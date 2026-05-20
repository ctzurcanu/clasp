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
      %58 = arith.constant 24 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 13 : i64
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
      %77 = arith.constant 6 : i64
      %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_intern(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_nil_value() : () -> i64
      %82 = func.call @cc_cons(%80, %81) : (i64, i64) -> i64
      %83 = func.call @cc_values_pack(%82) : (i64) -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      %84 = llvm.mlir.addressof @str9 : !llvm.ptr
      %85 = arith.constant 19 : i64
      %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
      %87 = func.call @cc_nil_value() : () -> i64
      %88 = func.call @cc_intern(%86, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %92 = llvm.mlir.addressof @str10 : !llvm.ptr
      %93 = arith.constant 11 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = llvm.mlir.addressof @str11 : !llvm.ptr
      %96 = arith.constant 11 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = func.call @cc_intern(%94, %97) : (i64, i64) -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
      %101 = func.call @cc_values_pack(%100) : (i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %102 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%102) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %103 = func.call @stack_pop_pointer() : () -> i64
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = func.call @cc_cons(%104, %103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%105) : (i64) -> ()
      %106 = func.call @stack_pop_pointer() : () -> i64
      %107 = func.call @stack_pop_pointer() : () -> i64
      %108 = func.call @cc_cons(%107, %106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @cc_cons(%110, %109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%111) : (i64) -> ()
      %112 = func.call @stack_pop_pointer() : () -> i64
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = func.call @cc_cons(%113, %112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%114) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %115 = func.call @stack_pop_pointer() : () -> i64
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @cc_cons(%116, %115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%117) : (i64) -> ()
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @cc_cons(%119, %118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_cons(%122, %121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%123) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %124 = func.call @stack_pop_pointer() : () -> i64
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @cc_cons(%125, %124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%126) : (i64) -> ()
      %127 = func.call @stack_pop_pointer() : () -> i64
      %128 = func.call @stack_pop_pointer() : () -> i64
      %129 = func.call @cc_cons(%128, %127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      %130 = func.call @stack_pop_pointer() : () -> i64
      %177 = arith.constant 116254966808577 : i64
      %178 = arith.constant 0 : i64
      %179 = func.call @cc_make_closure(%177, %178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%179) : (i64) -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = llvm.mlir.addressof @str12 : !llvm.ptr
      %182 = arith.constant 4 : i64
      %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_intern(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_values_pack(%187) : (i64) -> i64
      func.call @stack_push_pointer(%185) : (i64) -> ()
      %189 = llvm.mlir.addressof @str13 : !llvm.ptr
      %190 = arith.constant 10 : i64
      %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
      %192 = llvm.mlir.addressof @str14 : !llvm.ptr
      %193 = arith.constant 11 : i64
      %194 = func.call @cc_make_string(%192, %193) : (!llvm.ptr, i64) -> i64
      %195 = func.call @cc_intern(%191, %194) : (i64, i64) -> i64
      %196 = func.call @cc_nil_value() : () -> i64
      %197 = func.call @cc_cons(%195, %196) : (i64, i64) -> i64
      %198 = func.call @cc_values_pack(%197) : (i64) -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %199 = func.call @stack_pop_pointer() : () -> i64
      %200 = func.call @stack_pop_pointer() : () -> i64
      %201 = func.call @cc_cons(%200, %199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @stack_pop_pointer() : () -> i64
      %204 = func.call @cc_cons(%203, %202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%204) : (i64) -> ()
      %205 = func.call @stack_pop_pointer() : () -> i64
      %206 = llvm.mlir.addressof @str15 : !llvm.ptr
      %207 = arith.constant 11 : i64
      %208 = func.call @cc_make_string(%206, %207) : (!llvm.ptr, i64) -> i64
      %209 = llvm.mlir.addressof @str16 : !llvm.ptr
      %210 = arith.constant 7 : i64
      %211 = func.call @cc_make_string(%209, %210) : (!llvm.ptr, i64) -> i64
      %212 = func.call @cc_intern(%208, %211) : (i64, i64) -> i64
      %213 = func.call @cc_nil_value() : () -> i64
      %214 = func.call @cc_cons(%212, %213) : (i64, i64) -> i64
      %215 = func.call @cc_values_pack(%214) : (i64) -> i64
      func.call @stack_push_pointer(%212) : (i64) -> ()
      %216 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %217 = func.call @stack_pop_pointer() : () -> i64
      %218 = llvm.mlir.addressof @str17 : !llvm.ptr
      %219 = arith.constant 4 : i64
      %220 = func.call @cc_make_string(%218, %219) : (!llvm.ptr, i64) -> i64
      %221 = llvm.mlir.addressof @str18 : !llvm.ptr
      %222 = arith.constant 7 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = func.call @cc_intern(%220, %223) : (i64, i64) -> i64
      %225 = func.call @cc_nil_value() : () -> i64
      %226 = func.call @cc_cons(%224, %225) : (i64, i64) -> i64
      %227 = func.call @cc_values_pack(%226) : (i64) -> i64
      func.call @stack_push_pointer(%224) : (i64) -> ()
      %228 = func.call @stack_pop_pointer() : () -> i64
      %229 = llvm.mlir.addressof @str19 : !llvm.ptr
      %230 = arith.constant 5 : i64
      %231 = func.call @cc_make_string(%229, %230) : (!llvm.ptr, i64) -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_intern(%231, %232) : (i64, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_cons(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_values_pack(%235) : (i64) -> i64
      func.call @stack_push_pointer(%233) : (i64) -> ()
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @cc_nil_value() : () -> i64
      %239 = func.call @cc_errorp(%65) : (i64) -> i64
      %240 = arith.cmpi ne, %239, %238 : i64
      %241 = arith.cmpi eq, %238, %238 : i64
      %242 = arith.andi %240, %241 : i1
      %243 = scf.if %242 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %238 : i64
      }
      %244 = func.call @cc_errorp(%130) : (i64) -> i64
      %245 = arith.cmpi ne, %244, %238 : i64
      %246 = arith.cmpi eq, %243, %238 : i64
      %247 = arith.andi %245, %246 : i1
      %248 = scf.if %247 -> (i64) {
        scf.yield %130 : i64
      } else {
        scf.yield %243 : i64
      }
      %249 = func.call @cc_errorp(%180) : (i64) -> i64
      %250 = arith.cmpi ne, %249, %238 : i64
      %251 = arith.cmpi eq, %248, %238 : i64
      %252 = arith.andi %250, %251 : i1
      %253 = scf.if %252 -> (i64) {
        scf.yield %180 : i64
      } else {
        scf.yield %248 : i64
      }
      %254 = func.call @cc_errorp(%205) : (i64) -> i64
      %255 = arith.cmpi ne, %254, %238 : i64
      %256 = arith.cmpi eq, %253, %238 : i64
      %257 = arith.andi %255, %256 : i1
      %258 = scf.if %257 -> (i64) {
        scf.yield %205 : i64
      } else {
        scf.yield %253 : i64
      }
      %259 = func.call @cc_errorp(%216) : (i64) -> i64
      %260 = arith.cmpi ne, %259, %238 : i64
      %261 = arith.cmpi eq, %258, %238 : i64
      %262 = arith.andi %260, %261 : i1
      %263 = scf.if %262 -> (i64) {
        scf.yield %216 : i64
      } else {
        scf.yield %258 : i64
      }
      %264 = func.call @cc_errorp(%217) : (i64) -> i64
      %265 = arith.cmpi ne, %264, %238 : i64
      %266 = arith.cmpi eq, %263, %238 : i64
      %267 = arith.andi %265, %266 : i1
      %268 = scf.if %267 -> (i64) {
        scf.yield %217 : i64
      } else {
        scf.yield %263 : i64
      }
      %269 = func.call @cc_errorp(%228) : (i64) -> i64
      %270 = arith.cmpi ne, %269, %238 : i64
      %271 = arith.cmpi eq, %268, %238 : i64
      %272 = arith.andi %270, %271 : i1
      %273 = scf.if %272 -> (i64) {
        scf.yield %228 : i64
      } else {
        scf.yield %268 : i64
      }
      %274 = func.call @cc_errorp(%237) : (i64) -> i64
      %275 = arith.cmpi ne, %274, %238 : i64
      %276 = arith.cmpi eq, %273, %238 : i64
      %277 = arith.andi %275, %276 : i1
      %278 = scf.if %277 -> (i64) {
        scf.yield %237 : i64
      } else {
        scf.yield %273 : i64
      }
      %279 = arith.cmpi ne, %278, %238 : i64
      scf.if %279 {
        func.call @stack_push_pointer(%278) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%130) : (i64) -> ()
        func.call @stack_push_pointer(%180) : (i64) -> ()
        func.call @stack_push_pointer(%205) : (i64) -> ()
        func.call @stack_push_pointer(%216) : (i64) -> ()
        func.call @stack_push_pointer(%217) : (i64) -> ()
        func.call @stack_push_pointer(%228) : (i64) -> ()
        func.call @stack_push_pointer(%237) : (i64) -> ()
        %280 = llvm.mlir.addressof @str20 : !llvm.ptr
        %281 = func.call @cc_make_function_ref_const(%280) : (!llvm.ptr) -> i64
        %282 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%281, %282) : (i64, i64) -> ()
      }
      %283 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %283 : i64
    }
    %284 = func.call @cc_nil_value() : () -> i64
    %285 = func.call @cc_errorp(%56) : (i64) -> i64
    %286 = arith.cmpi ne, %285, %284 : i64
    %287 = scf.if %286 -> (i64) {
      scf.yield %56 : i64
    } else {
      %288 = llvm.mlir.addressof @str21 : !llvm.ptr
      %289 = arith.constant 24 : i64
      %290 = func.call @cc_make_string(%288, %289) : (!llvm.ptr, i64) -> i64
      %291 = func.call @cc_nil_value() : () -> i64
      %292 = func.call @cc_intern(%290, %291) : (i64, i64) -> i64
      %293 = func.call @cc_nil_value() : () -> i64
      %294 = func.call @cc_cons(%292, %293) : (i64, i64) -> i64
      %295 = func.call @cc_values_pack(%294) : (i64) -> i64
      func.call @stack_push_pointer(%292) : (i64) -> ()
      %296 = func.call @stack_pop_pointer() : () -> i64
      %297 = llvm.mlir.addressof @str22 : !llvm.ptr
      %298 = arith.constant 13 : i64
      %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
      %300 = llvm.mlir.addressof @str23 : !llvm.ptr
      %301 = arith.constant 11 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = func.call @cc_intern(%299, %302) : (i64, i64) -> i64
      %304 = func.call @cc_nil_value() : () -> i64
      %305 = func.call @cc_cons(%303, %304) : (i64, i64) -> i64
      %306 = func.call @cc_values_pack(%305) : (i64) -> i64
      func.call @stack_push_pointer(%303) : (i64) -> ()
      %307 = llvm.mlir.addressof @str24 : !llvm.ptr
      %308 = arith.constant 6 : i64
      %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_intern(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_values_pack(%313) : (i64) -> i64
      func.call @stack_push_pointer(%311) : (i64) -> ()
      %315 = llvm.mlir.addressof @str25 : !llvm.ptr
      %316 = arith.constant 19 : i64
      %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
      %318 = func.call @cc_nil_value() : () -> i64
      %319 = func.call @cc_intern(%317, %318) : (i64, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_values_pack(%321) : (i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %323 = llvm.mlir.addressof @str26 : !llvm.ptr
      %324 = arith.constant 11 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = llvm.mlir.addressof @str27 : !llvm.ptr
      %327 = arith.constant 11 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_intern(%325, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      func.call @stack_push_pointer(%329) : (i64) -> ()
      %333 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%333) : (i64) -> ()
      %334 = llvm.mlir.addressof @str28 : !llvm.ptr
      %335 = arith.constant 5 : i64
      %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
      %337 = llvm.mlir.addressof @str29 : !llvm.ptr
      %338 = arith.constant 11 : i64
      %339 = func.call @cc_make_string(%337, %338) : (!llvm.ptr, i64) -> i64
      %340 = func.call @cc_intern(%336, %339) : (i64, i64) -> i64
      %341 = func.call @cc_nil_value() : () -> i64
      %342 = func.call @cc_cons(%340, %341) : (i64, i64) -> i64
      %343 = func.call @cc_values_pack(%342) : (i64) -> i64
      func.call @stack_push_pointer(%340) : (i64) -> ()
      %344 = func.call @stack_pop_pointer() : () -> i64
      %345 = func.call @stack_pop_pointer() : () -> i64
      %346 = func.call @cc_cons(%344, %345) : (i64, i64) -> i64
      %347 = llvm.mlir.addressof @str30 : !llvm.ptr
      %348 = arith.constant 5 : i64
      %349 = func.call @cc_make_string(%347, %348) : (!llvm.ptr, i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_intern(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
      %354 = func.call @cc_values_pack(%353) : (i64) -> i64
      %355 = func.call @cc_cons(%351, %346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %356 = func.call @stack_pop_pointer() : () -> i64
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = func.call @cc_cons(%357, %356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%358) : (i64) -> ()
      %359 = func.call @stack_pop_pointer() : () -> i64
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @cc_cons(%360, %359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%361) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %362 = func.call @stack_pop_pointer() : () -> i64
      %363 = func.call @stack_pop_pointer() : () -> i64
      %364 = func.call @cc_cons(%363, %362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%364) : (i64) -> ()
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @cc_cons(%366, %365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @stack_pop_pointer() : () -> i64
      %370 = func.call @cc_cons(%369, %368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%370) : (i64) -> ()
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @cc_cons(%372, %371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @stack_pop_pointer() : () -> i64
      %376 = func.call @cc_cons(%375, %374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%376) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %377 = func.call @stack_pop_pointer() : () -> i64
      %378 = func.call @stack_pop_pointer() : () -> i64
      %379 = func.call @cc_cons(%378, %377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%379) : (i64) -> ()
      %380 = func.call @stack_pop_pointer() : () -> i64
      %381 = func.call @stack_pop_pointer() : () -> i64
      %382 = func.call @cc_cons(%381, %380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%382) : (i64) -> ()
      %383 = func.call @stack_pop_pointer() : () -> i64
      %439 = arith.constant 116254966808578 : i64
      %440 = arith.constant 0 : i64
      %441 = func.call @cc_make_closure(%439, %440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%441) : (i64) -> ()
      %442 = func.call @stack_pop_pointer() : () -> i64
      %443 = llvm.mlir.addressof @str33 : !llvm.ptr
      %444 = arith.constant 4 : i64
      %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
      %446 = func.call @cc_nil_value() : () -> i64
      %447 = func.call @cc_intern(%445, %446) : (i64, i64) -> i64
      %448 = func.call @cc_nil_value() : () -> i64
      %449 = func.call @cc_cons(%447, %448) : (i64, i64) -> i64
      %450 = func.call @cc_values_pack(%449) : (i64) -> i64
      func.call @stack_push_pointer(%447) : (i64) -> ()
      %451 = llvm.mlir.addressof @str34 : !llvm.ptr
      %452 = arith.constant 10 : i64
      %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
      %454 = llvm.mlir.addressof @str35 : !llvm.ptr
      %455 = arith.constant 11 : i64
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
      %468 = llvm.mlir.addressof @str36 : !llvm.ptr
      %469 = arith.constant 11 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = llvm.mlir.addressof @str37 : !llvm.ptr
      %472 = arith.constant 7 : i64
      %473 = func.call @cc_make_string(%471, %472) : (!llvm.ptr, i64) -> i64
      %474 = func.call @cc_intern(%470, %473) : (i64, i64) -> i64
      %475 = func.call @cc_nil_value() : () -> i64
      %476 = func.call @cc_cons(%474, %475) : (i64, i64) -> i64
      %477 = func.call @cc_values_pack(%476) : (i64) -> i64
      func.call @stack_push_pointer(%474) : (i64) -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = llvm.mlir.addressof @str38 : !llvm.ptr
      %481 = arith.constant 4 : i64
      %482 = func.call @cc_make_string(%480, %481) : (!llvm.ptr, i64) -> i64
      %483 = llvm.mlir.addressof @str39 : !llvm.ptr
      %484 = arith.constant 7 : i64
      %485 = func.call @cc_make_string(%483, %484) : (!llvm.ptr, i64) -> i64
      %486 = func.call @cc_intern(%482, %485) : (i64, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_values_pack(%488) : (i64) -> i64
      func.call @stack_push_pointer(%486) : (i64) -> ()
      %490 = func.call @stack_pop_pointer() : () -> i64
      %491 = llvm.mlir.addressof @str40 : !llvm.ptr
      %492 = arith.constant 5 : i64
      %493 = func.call @cc_make_string(%491, %492) : (!llvm.ptr, i64) -> i64
      %494 = func.call @cc_nil_value() : () -> i64
      %495 = func.call @cc_intern(%493, %494) : (i64, i64) -> i64
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
      %498 = func.call @cc_values_pack(%497) : (i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      %499 = func.call @stack_pop_pointer() : () -> i64
      %500 = func.call @cc_nil_value() : () -> i64
      %501 = func.call @cc_errorp(%296) : (i64) -> i64
      %502 = arith.cmpi ne, %501, %500 : i64
      %503 = arith.cmpi eq, %500, %500 : i64
      %504 = arith.andi %502, %503 : i1
      %505 = scf.if %504 -> (i64) {
        scf.yield %296 : i64
      } else {
        scf.yield %500 : i64
      }
      %506 = func.call @cc_errorp(%383) : (i64) -> i64
      %507 = arith.cmpi ne, %506, %500 : i64
      %508 = arith.cmpi eq, %505, %500 : i64
      %509 = arith.andi %507, %508 : i1
      %510 = scf.if %509 -> (i64) {
        scf.yield %383 : i64
      } else {
        scf.yield %505 : i64
      }
      %511 = func.call @cc_errorp(%442) : (i64) -> i64
      %512 = arith.cmpi ne, %511, %500 : i64
      %513 = arith.cmpi eq, %510, %500 : i64
      %514 = arith.andi %512, %513 : i1
      %515 = scf.if %514 -> (i64) {
        scf.yield %442 : i64
      } else {
        scf.yield %510 : i64
      }
      %516 = func.call @cc_errorp(%467) : (i64) -> i64
      %517 = arith.cmpi ne, %516, %500 : i64
      %518 = arith.cmpi eq, %515, %500 : i64
      %519 = arith.andi %517, %518 : i1
      %520 = scf.if %519 -> (i64) {
        scf.yield %467 : i64
      } else {
        scf.yield %515 : i64
      }
      %521 = func.call @cc_errorp(%478) : (i64) -> i64
      %522 = arith.cmpi ne, %521, %500 : i64
      %523 = arith.cmpi eq, %520, %500 : i64
      %524 = arith.andi %522, %523 : i1
      %525 = scf.if %524 -> (i64) {
        scf.yield %478 : i64
      } else {
        scf.yield %520 : i64
      }
      %526 = func.call @cc_errorp(%479) : (i64) -> i64
      %527 = arith.cmpi ne, %526, %500 : i64
      %528 = arith.cmpi eq, %525, %500 : i64
      %529 = arith.andi %527, %528 : i1
      %530 = scf.if %529 -> (i64) {
        scf.yield %479 : i64
      } else {
        scf.yield %525 : i64
      }
      %531 = func.call @cc_errorp(%490) : (i64) -> i64
      %532 = arith.cmpi ne, %531, %500 : i64
      %533 = arith.cmpi eq, %530, %500 : i64
      %534 = arith.andi %532, %533 : i1
      %535 = scf.if %534 -> (i64) {
        scf.yield %490 : i64
      } else {
        scf.yield %530 : i64
      }
      %536 = func.call @cc_errorp(%499) : (i64) -> i64
      %537 = arith.cmpi ne, %536, %500 : i64
      %538 = arith.cmpi eq, %535, %500 : i64
      %539 = arith.andi %537, %538 : i1
      %540 = scf.if %539 -> (i64) {
        scf.yield %499 : i64
      } else {
        scf.yield %535 : i64
      }
      %541 = arith.cmpi ne, %540, %500 : i64
      scf.if %541 {
        func.call @stack_push_pointer(%540) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%296) : (i64) -> ()
        func.call @stack_push_pointer(%383) : (i64) -> ()
        func.call @stack_push_pointer(%442) : (i64) -> ()
        func.call @stack_push_pointer(%467) : (i64) -> ()
        func.call @stack_push_pointer(%478) : (i64) -> ()
        func.call @stack_push_pointer(%479) : (i64) -> ()
        func.call @stack_push_pointer(%490) : (i64) -> ()
        func.call @stack_push_pointer(%499) : (i64) -> ()
        %542 = llvm.mlir.addressof @str41 : !llvm.ptr
        %543 = func.call @cc_make_function_ref_const(%542) : (!llvm.ptr) -> i64
        %544 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%543, %544) : (i64, i64) -> ()
      }
      %545 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %545 : i64
    }
    %546 = func.call @cc_nil_value() : () -> i64
    %547 = func.call @cc_errorp(%287) : (i64) -> i64
    %548 = arith.cmpi ne, %547, %546 : i64
    %549 = scf.if %548 -> (i64) {
      scf.yield %287 : i64
    } else {
      %550 = llvm.mlir.addressof @str42 : !llvm.ptr
      %551 = arith.constant 24 : i64
      %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
      %553 = func.call @cc_nil_value() : () -> i64
      %554 = func.call @cc_intern(%552, %553) : (i64, i64) -> i64
      %555 = func.call @cc_nil_value() : () -> i64
      %556 = func.call @cc_cons(%554, %555) : (i64, i64) -> i64
      %557 = func.call @cc_values_pack(%556) : (i64) -> i64
      func.call @stack_push_pointer(%554) : (i64) -> ()
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = llvm.mlir.addressof @str43 : !llvm.ptr
      %560 = arith.constant 13 : i64
      %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
      %562 = llvm.mlir.addressof @str44 : !llvm.ptr
      %563 = arith.constant 11 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      %565 = func.call @cc_intern(%561, %564) : (i64, i64) -> i64
      %566 = func.call @cc_nil_value() : () -> i64
      %567 = func.call @cc_cons(%565, %566) : (i64, i64) -> i64
      %568 = func.call @cc_values_pack(%567) : (i64) -> i64
      func.call @stack_push_pointer(%565) : (i64) -> ()
      %569 = llvm.mlir.addressof @str45 : !llvm.ptr
      %570 = arith.constant 6 : i64
      %571 = func.call @cc_make_string(%569, %570) : (!llvm.ptr, i64) -> i64
      %572 = func.call @cc_nil_value() : () -> i64
      %573 = func.call @cc_intern(%571, %572) : (i64, i64) -> i64
      %574 = func.call @cc_nil_value() : () -> i64
      %575 = func.call @cc_cons(%573, %574) : (i64, i64) -> i64
      %576 = func.call @cc_values_pack(%575) : (i64) -> i64
      func.call @stack_push_pointer(%573) : (i64) -> ()
      %577 = llvm.mlir.addressof @str46 : !llvm.ptr
      %578 = arith.constant 19 : i64
      %579 = func.call @cc_make_string(%577, %578) : (!llvm.ptr, i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_intern(%579, %580) : (i64, i64) -> i64
      %582 = func.call @cc_nil_value() : () -> i64
      %583 = func.call @cc_cons(%581, %582) : (i64, i64) -> i64
      %584 = func.call @cc_values_pack(%583) : (i64) -> i64
      func.call @stack_push_pointer(%581) : (i64) -> ()
      %585 = llvm.mlir.addressof @str47 : !llvm.ptr
      %586 = arith.constant 11 : i64
      %587 = func.call @cc_make_string(%585, %586) : (!llvm.ptr, i64) -> i64
      %588 = llvm.mlir.addressof @str48 : !llvm.ptr
      %589 = arith.constant 11 : i64
      %590 = func.call @cc_make_string(%588, %589) : (!llvm.ptr, i64) -> i64
      %591 = func.call @cc_intern(%587, %590) : (i64, i64) -> i64
      %592 = func.call @cc_nil_value() : () -> i64
      %593 = func.call @cc_cons(%591, %592) : (i64, i64) -> i64
      %594 = func.call @cc_values_pack(%593) : (i64) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      %595 = arith.constant 65 : i64
      %596 = func.call @cc_box_character(%595) : (i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %597 = func.call @stack_pop_pointer() : () -> i64
      %598 = func.call @stack_pop_pointer() : () -> i64
      %599 = func.call @cc_cons(%598, %597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%599) : (i64) -> ()
      %600 = func.call @stack_pop_pointer() : () -> i64
      %601 = func.call @stack_pop_pointer() : () -> i64
      %602 = func.call @cc_cons(%601, %600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @cc_cons(%604, %603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%605) : (i64) -> ()
      %606 = func.call @stack_pop_pointer() : () -> i64
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @cc_cons(%607, %606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%608) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %609 = func.call @stack_pop_pointer() : () -> i64
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @cc_cons(%610, %609) : (i64, i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %612 = func.call @stack_pop_pointer() : () -> i64
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @cc_cons(%613, %612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %615 = func.call @stack_pop_pointer() : () -> i64
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = func.call @cc_cons(%616, %615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %618 = func.call @stack_pop_pointer() : () -> i64
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = func.call @cc_cons(%619, %618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%620) : (i64) -> ()
      %621 = func.call @stack_pop_pointer() : () -> i64
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @cc_cons(%622, %621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%623) : (i64) -> ()
      %624 = func.call @stack_pop_pointer() : () -> i64
      %672 = arith.constant 116254966808579 : i64
      %673 = arith.constant 0 : i64
      %674 = func.call @cc_make_closure(%672, %673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%674) : (i64) -> ()
      %675 = func.call @stack_pop_pointer() : () -> i64
      %676 = llvm.mlir.addressof @str49 : !llvm.ptr
      %677 = arith.constant 4 : i64
      %678 = func.call @cc_make_string(%676, %677) : (!llvm.ptr, i64) -> i64
      %679 = func.call @cc_nil_value() : () -> i64
      %680 = func.call @cc_intern(%678, %679) : (i64, i64) -> i64
      %681 = func.call @cc_nil_value() : () -> i64
      %682 = func.call @cc_cons(%680, %681) : (i64, i64) -> i64
      %683 = func.call @cc_values_pack(%682) : (i64) -> i64
      func.call @stack_push_pointer(%680) : (i64) -> ()
      %684 = llvm.mlir.addressof @str50 : !llvm.ptr
      %685 = arith.constant 10 : i64
      %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
      %687 = llvm.mlir.addressof @str51 : !llvm.ptr
      %688 = arith.constant 11 : i64
      %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
      %690 = func.call @cc_intern(%686, %689) : (i64, i64) -> i64
      %691 = func.call @cc_nil_value() : () -> i64
      %692 = func.call @cc_cons(%690, %691) : (i64, i64) -> i64
      %693 = func.call @cc_values_pack(%692) : (i64) -> i64
      func.call @stack_push_pointer(%690) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %694 = func.call @stack_pop_pointer() : () -> i64
      %695 = func.call @stack_pop_pointer() : () -> i64
      %696 = func.call @cc_cons(%695, %694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%696) : (i64) -> ()
      %697 = func.call @stack_pop_pointer() : () -> i64
      %698 = func.call @stack_pop_pointer() : () -> i64
      %699 = func.call @cc_cons(%698, %697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%699) : (i64) -> ()
      %700 = func.call @stack_pop_pointer() : () -> i64
      %701 = llvm.mlir.addressof @str52 : !llvm.ptr
      %702 = arith.constant 11 : i64
      %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
      %704 = llvm.mlir.addressof @str53 : !llvm.ptr
      %705 = arith.constant 7 : i64
      %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
      %707 = func.call @cc_intern(%703, %706) : (i64, i64) -> i64
      %708 = func.call @cc_nil_value() : () -> i64
      %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
      %710 = func.call @cc_values_pack(%709) : (i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %711 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %712 = func.call @stack_pop_pointer() : () -> i64
      %713 = llvm.mlir.addressof @str54 : !llvm.ptr
      %714 = arith.constant 4 : i64
      %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
      %716 = llvm.mlir.addressof @str55 : !llvm.ptr
      %717 = arith.constant 7 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = func.call @cc_intern(%715, %718) : (i64, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_cons(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_values_pack(%721) : (i64) -> i64
      func.call @stack_push_pointer(%719) : (i64) -> ()
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = llvm.mlir.addressof @str56 : !llvm.ptr
      %725 = arith.constant 5 : i64
      %726 = func.call @cc_make_string(%724, %725) : (!llvm.ptr, i64) -> i64
      %727 = func.call @cc_nil_value() : () -> i64
      %728 = func.call @cc_intern(%726, %727) : (i64, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_cons(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_values_pack(%730) : (i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %732 = func.call @stack_pop_pointer() : () -> i64
      %733 = func.call @cc_nil_value() : () -> i64
      %734 = func.call @cc_errorp(%558) : (i64) -> i64
      %735 = arith.cmpi ne, %734, %733 : i64
      %736 = arith.cmpi eq, %733, %733 : i64
      %737 = arith.andi %735, %736 : i1
      %738 = scf.if %737 -> (i64) {
        scf.yield %558 : i64
      } else {
        scf.yield %733 : i64
      }
      %739 = func.call @cc_errorp(%624) : (i64) -> i64
      %740 = arith.cmpi ne, %739, %733 : i64
      %741 = arith.cmpi eq, %738, %733 : i64
      %742 = arith.andi %740, %741 : i1
      %743 = scf.if %742 -> (i64) {
        scf.yield %624 : i64
      } else {
        scf.yield %738 : i64
      }
      %744 = func.call @cc_errorp(%675) : (i64) -> i64
      %745 = arith.cmpi ne, %744, %733 : i64
      %746 = arith.cmpi eq, %743, %733 : i64
      %747 = arith.andi %745, %746 : i1
      %748 = scf.if %747 -> (i64) {
        scf.yield %675 : i64
      } else {
        scf.yield %743 : i64
      }
      %749 = func.call @cc_errorp(%700) : (i64) -> i64
      %750 = arith.cmpi ne, %749, %733 : i64
      %751 = arith.cmpi eq, %748, %733 : i64
      %752 = arith.andi %750, %751 : i1
      %753 = scf.if %752 -> (i64) {
        scf.yield %700 : i64
      } else {
        scf.yield %748 : i64
      }
      %754 = func.call @cc_errorp(%711) : (i64) -> i64
      %755 = arith.cmpi ne, %754, %733 : i64
      %756 = arith.cmpi eq, %753, %733 : i64
      %757 = arith.andi %755, %756 : i1
      %758 = scf.if %757 -> (i64) {
        scf.yield %711 : i64
      } else {
        scf.yield %753 : i64
      }
      %759 = func.call @cc_errorp(%712) : (i64) -> i64
      %760 = arith.cmpi ne, %759, %733 : i64
      %761 = arith.cmpi eq, %758, %733 : i64
      %762 = arith.andi %760, %761 : i1
      %763 = scf.if %762 -> (i64) {
        scf.yield %712 : i64
      } else {
        scf.yield %758 : i64
      }
      %764 = func.call @cc_errorp(%723) : (i64) -> i64
      %765 = arith.cmpi ne, %764, %733 : i64
      %766 = arith.cmpi eq, %763, %733 : i64
      %767 = arith.andi %765, %766 : i1
      %768 = scf.if %767 -> (i64) {
        scf.yield %723 : i64
      } else {
        scf.yield %763 : i64
      }
      %769 = func.call @cc_errorp(%732) : (i64) -> i64
      %770 = arith.cmpi ne, %769, %733 : i64
      %771 = arith.cmpi eq, %768, %733 : i64
      %772 = arith.andi %770, %771 : i1
      %773 = scf.if %772 -> (i64) {
        scf.yield %732 : i64
      } else {
        scf.yield %768 : i64
      }
      %774 = arith.cmpi ne, %773, %733 : i64
      scf.if %774 {
        func.call @stack_push_pointer(%773) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%558) : (i64) -> ()
        func.call @stack_push_pointer(%624) : (i64) -> ()
        func.call @stack_push_pointer(%675) : (i64) -> ()
        func.call @stack_push_pointer(%700) : (i64) -> ()
        func.call @stack_push_pointer(%711) : (i64) -> ()
        func.call @stack_push_pointer(%712) : (i64) -> ()
        func.call @stack_push_pointer(%723) : (i64) -> ()
        func.call @stack_push_pointer(%732) : (i64) -> ()
        %775 = llvm.mlir.addressof @str57 : !llvm.ptr
        %776 = func.call @cc_make_function_ref_const(%775) : (!llvm.ptr) -> i64
        %777 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%776, %777) : (i64, i64) -> ()
      }
      %778 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %778 : i64
    }
    %779 = func.call @cc_nil_value() : () -> i64
    %780 = func.call @cc_errorp(%549) : (i64) -> i64
    %781 = arith.cmpi ne, %780, %779 : i64
    %782 = scf.if %781 -> (i64) {
      scf.yield %549 : i64
    } else {
      %783 = llvm.mlir.addressof @str58 : !llvm.ptr
      %784 = arith.constant 18 : i64
      %785 = func.call @cc_make_string(%783, %784) : (!llvm.ptr, i64) -> i64
      %786 = func.call @cc_nil_value() : () -> i64
      %787 = func.call @cc_intern(%785, %786) : (i64, i64) -> i64
      %788 = func.call @cc_nil_value() : () -> i64
      %789 = func.call @cc_cons(%787, %788) : (i64, i64) -> i64
      %790 = func.call @cc_values_pack(%789) : (i64) -> i64
      func.call @stack_push_pointer(%787) : (i64) -> ()
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = llvm.mlir.addressof @str59 : !llvm.ptr
      %793 = arith.constant 6 : i64
      %794 = func.call @cc_make_string(%792, %793) : (!llvm.ptr, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_intern(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_nil_value() : () -> i64
      %798 = func.call @cc_cons(%796, %797) : (i64, i64) -> i64
      %799 = func.call @cc_values_pack(%798) : (i64) -> i64
      func.call @stack_push_pointer(%796) : (i64) -> ()
      %800 = llvm.mlir.addressof @str60 : !llvm.ptr
      %801 = arith.constant 11 : i64
      %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
      %803 = llvm.mlir.addressof @str61 : !llvm.ptr
      %804 = arith.constant 11 : i64
      %805 = func.call @cc_make_string(%803, %804) : (!llvm.ptr, i64) -> i64
      %806 = func.call @cc_intern(%802, %805) : (i64, i64) -> i64
      %807 = func.call @cc_nil_value() : () -> i64
      %808 = func.call @cc_cons(%806, %807) : (i64, i64) -> i64
      %809 = func.call @cc_values_pack(%808) : (i64) -> i64
      func.call @stack_push_pointer(%806) : (i64) -> ()
      %810 = llvm.mlir.addressof @str62 : !llvm.ptr
      %811 = arith.constant 5 : i64
      %812 = func.call @cc_make_string(%810, %811) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%812) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %813 = func.call @stack_pop_pointer() : () -> i64
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @cc_cons(%814, %813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%815) : (i64) -> ()
      %816 = func.call @stack_pop_pointer() : () -> i64
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = func.call @cc_cons(%817, %816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%818) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %819 = func.call @stack_pop_pointer() : () -> i64
      %820 = func.call @stack_pop_pointer() : () -> i64
      %821 = func.call @cc_cons(%820, %819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%821) : (i64) -> ()
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @cc_cons(%823, %822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%824) : (i64) -> ()
      %825 = func.call @stack_pop_pointer() : () -> i64
      %842 = arith.constant 116254966808580 : i64
      %843 = arith.constant 0 : i64
      %844 = func.call @cc_make_closure(%842, %843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%844) : (i64) -> ()
      %845 = func.call @stack_pop_pointer() : () -> i64
      %846 = llvm.mlir.addressof @str64 : !llvm.ptr
      %847 = arith.constant 6 : i64
      %848 = func.call @cc_make_string(%846, %847) : (!llvm.ptr, i64) -> i64
      %849 = llvm.mlir.addressof @str65 : !llvm.ptr
      %850 = arith.constant 11 : i64
      %851 = func.call @cc_make_string(%849, %850) : (!llvm.ptr, i64) -> i64
      %852 = func.call @cc_intern(%848, %851) : (i64, i64) -> i64
      %853 = func.call @cc_nil_value() : () -> i64
      %854 = func.call @cc_cons(%852, %853) : (i64, i64) -> i64
      %855 = func.call @cc_values_pack(%854) : (i64) -> i64
      func.call @stack_push_pointer(%852) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @cc_cons(%857, %856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = llvm.mlir.addressof @str66 : !llvm.ptr
      %861 = arith.constant 11 : i64
      %862 = func.call @cc_make_string(%860, %861) : (!llvm.ptr, i64) -> i64
      %863 = llvm.mlir.addressof @str67 : !llvm.ptr
      %864 = arith.constant 7 : i64
      %865 = func.call @cc_make_string(%863, %864) : (!llvm.ptr, i64) -> i64
      %866 = func.call @cc_intern(%862, %865) : (i64, i64) -> i64
      %867 = func.call @cc_nil_value() : () -> i64
      %868 = func.call @cc_cons(%866, %867) : (i64, i64) -> i64
      %869 = func.call @cc_values_pack(%868) : (i64) -> i64
      func.call @stack_push_pointer(%866) : (i64) -> ()
      %870 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %871 = func.call @stack_pop_pointer() : () -> i64
      %872 = llvm.mlir.addressof @str68 : !llvm.ptr
      %873 = arith.constant 4 : i64
      %874 = func.call @cc_make_string(%872, %873) : (!llvm.ptr, i64) -> i64
      %875 = llvm.mlir.addressof @str69 : !llvm.ptr
      %876 = arith.constant 7 : i64
      %877 = func.call @cc_make_string(%875, %876) : (!llvm.ptr, i64) -> i64
      %878 = func.call @cc_intern(%874, %877) : (i64, i64) -> i64
      %879 = func.call @cc_nil_value() : () -> i64
      %880 = func.call @cc_cons(%878, %879) : (i64, i64) -> i64
      %881 = func.call @cc_values_pack(%880) : (i64) -> i64
      func.call @stack_push_pointer(%878) : (i64) -> ()
      %882 = func.call @stack_pop_pointer() : () -> i64
      %883 = llvm.mlir.addressof @str70 : !llvm.ptr
      %884 = arith.constant 5 : i64
      %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
      %886 = func.call @cc_nil_value() : () -> i64
      %887 = func.call @cc_intern(%885, %886) : (i64, i64) -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_cons(%887, %888) : (i64, i64) -> i64
      %890 = func.call @cc_values_pack(%889) : (i64) -> i64
      func.call @stack_push_pointer(%887) : (i64) -> ()
      %891 = func.call @stack_pop_pointer() : () -> i64
      %892 = func.call @cc_nil_value() : () -> i64
      %893 = func.call @cc_errorp(%791) : (i64) -> i64
      %894 = arith.cmpi ne, %893, %892 : i64
      %895 = arith.cmpi eq, %892, %892 : i64
      %896 = arith.andi %894, %895 : i1
      %897 = scf.if %896 -> (i64) {
        scf.yield %791 : i64
      } else {
        scf.yield %892 : i64
      }
      %898 = func.call @cc_errorp(%825) : (i64) -> i64
      %899 = arith.cmpi ne, %898, %892 : i64
      %900 = arith.cmpi eq, %897, %892 : i64
      %901 = arith.andi %899, %900 : i1
      %902 = scf.if %901 -> (i64) {
        scf.yield %825 : i64
      } else {
        scf.yield %897 : i64
      }
      %903 = func.call @cc_errorp(%845) : (i64) -> i64
      %904 = arith.cmpi ne, %903, %892 : i64
      %905 = arith.cmpi eq, %902, %892 : i64
      %906 = arith.andi %904, %905 : i1
      %907 = scf.if %906 -> (i64) {
        scf.yield %845 : i64
      } else {
        scf.yield %902 : i64
      }
      %908 = func.call @cc_errorp(%859) : (i64) -> i64
      %909 = arith.cmpi ne, %908, %892 : i64
      %910 = arith.cmpi eq, %907, %892 : i64
      %911 = arith.andi %909, %910 : i1
      %912 = scf.if %911 -> (i64) {
        scf.yield %859 : i64
      } else {
        scf.yield %907 : i64
      }
      %913 = func.call @cc_errorp(%870) : (i64) -> i64
      %914 = arith.cmpi ne, %913, %892 : i64
      %915 = arith.cmpi eq, %912, %892 : i64
      %916 = arith.andi %914, %915 : i1
      %917 = scf.if %916 -> (i64) {
        scf.yield %870 : i64
      } else {
        scf.yield %912 : i64
      }
      %918 = func.call @cc_errorp(%871) : (i64) -> i64
      %919 = arith.cmpi ne, %918, %892 : i64
      %920 = arith.cmpi eq, %917, %892 : i64
      %921 = arith.andi %919, %920 : i1
      %922 = scf.if %921 -> (i64) {
        scf.yield %871 : i64
      } else {
        scf.yield %917 : i64
      }
      %923 = func.call @cc_errorp(%882) : (i64) -> i64
      %924 = arith.cmpi ne, %923, %892 : i64
      %925 = arith.cmpi eq, %922, %892 : i64
      %926 = arith.andi %924, %925 : i1
      %927 = scf.if %926 -> (i64) {
        scf.yield %882 : i64
      } else {
        scf.yield %922 : i64
      }
      %928 = func.call @cc_errorp(%891) : (i64) -> i64
      %929 = arith.cmpi ne, %928, %892 : i64
      %930 = arith.cmpi eq, %927, %892 : i64
      %931 = arith.andi %929, %930 : i1
      %932 = scf.if %931 -> (i64) {
        scf.yield %891 : i64
      } else {
        scf.yield %927 : i64
      }
      %933 = arith.cmpi ne, %932, %892 : i64
      scf.if %933 {
        func.call @stack_push_pointer(%932) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%791) : (i64) -> ()
        func.call @stack_push_pointer(%825) : (i64) -> ()
        func.call @stack_push_pointer(%845) : (i64) -> ()
        func.call @stack_push_pointer(%859) : (i64) -> ()
        func.call @stack_push_pointer(%870) : (i64) -> ()
        func.call @stack_push_pointer(%871) : (i64) -> ()
        func.call @stack_push_pointer(%882) : (i64) -> ()
        func.call @stack_push_pointer(%891) : (i64) -> ()
        %934 = llvm.mlir.addressof @str71 : !llvm.ptr
        %935 = func.call @cc_make_function_ref_const(%934) : (!llvm.ptr) -> i64
        %936 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%935, %936) : (i64, i64) -> ()
      }
      %937 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %937 : i64
    }
    %938 = func.call @cc_nil_value() : () -> i64
    %939 = func.call @cc_errorp(%782) : (i64) -> i64
    %940 = arith.cmpi ne, %939, %938 : i64
    %941 = scf.if %940 -> (i64) {
      scf.yield %782 : i64
    } else {
      %942 = llvm.mlir.addressof @str72 : !llvm.ptr
      %943 = arith.constant 18 : i64
      %944 = func.call @cc_make_string(%942, %943) : (!llvm.ptr, i64) -> i64
      %945 = func.call @cc_nil_value() : () -> i64
      %946 = func.call @cc_intern(%944, %945) : (i64, i64) -> i64
      %947 = func.call @cc_nil_value() : () -> i64
      %948 = func.call @cc_cons(%946, %947) : (i64, i64) -> i64
      %949 = func.call @cc_values_pack(%948) : (i64) -> i64
      func.call @stack_push_pointer(%946) : (i64) -> ()
      %950 = func.call @stack_pop_pointer() : () -> i64
      %951 = llvm.mlir.addressof @str73 : !llvm.ptr
      %952 = arith.constant 6 : i64
      %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      func.call @stack_push_pointer(%955) : (i64) -> ()
      %959 = llvm.mlir.addressof @str74 : !llvm.ptr
      %960 = arith.constant 11 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = llvm.mlir.addressof @str75 : !llvm.ptr
      %963 = arith.constant 11 : i64
      %964 = func.call @cc_make_string(%962, %963) : (!llvm.ptr, i64) -> i64
      %965 = func.call @cc_intern(%961, %964) : (i64, i64) -> i64
      %966 = func.call @cc_nil_value() : () -> i64
      %967 = func.call @cc_cons(%965, %966) : (i64, i64) -> i64
      %968 = func.call @cc_values_pack(%967) : (i64) -> i64
      func.call @stack_push_pointer(%965) : (i64) -> ()
      %969 = llvm.mlir.addressof @str76 : !llvm.ptr
      %970 = arith.constant 10 : i64
      %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
      %972 = llvm.mlir.addressof @str77 : !llvm.ptr
      %973 = arith.constant 11 : i64
      %974 = func.call @cc_make_string(%972, %973) : (!llvm.ptr, i64) -> i64
      %975 = func.call @cc_intern(%971, %974) : (i64, i64) -> i64
      %976 = func.call @cc_nil_value() : () -> i64
      %977 = func.call @cc_cons(%975, %976) : (i64, i64) -> i64
      %978 = func.call @cc_values_pack(%977) : (i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      %979 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%979) : (i64) -> ()
      %980 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%980) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @stack_pop_pointer() : () -> i64
      %983 = func.call @cc_cons(%982, %981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%983) : (i64) -> ()
      %984 = func.call @stack_pop_pointer() : () -> i64
      %985 = func.call @stack_pop_pointer() : () -> i64
      %986 = func.call @cc_cons(%984, %985) : (i64, i64) -> i64
      %987 = llvm.mlir.addressof @str78 : !llvm.ptr
      %988 = arith.constant 5 : i64
      %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_intern(%989, %990) : (i64, i64) -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_cons(%991, %992) : (i64, i64) -> i64
      %994 = func.call @cc_values_pack(%993) : (i64) -> i64
      %995 = func.call @cc_cons(%991, %986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%995) : (i64) -> ()
      %996 = llvm.mlir.addressof @str79 : !llvm.ptr
      %997 = arith.constant 16 : i64
      %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
      %999 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1000 = arith.constant 7 : i64
      %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
      %1002 = func.call @cc_intern(%998, %1001) : (i64, i64) -> i64
      %1003 = func.call @cc_nil_value() : () -> i64
      %1004 = func.call @cc_cons(%1002, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_values_pack(%1004) : (i64) -> i64
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      %1006 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1006) : (i64) -> ()
      %1007 = arith.constant 65 : i64
      %1008 = func.call @cc_box_character(%1007) : (i64) -> i64
      func.call @stack_push_pointer(%1008) : (i64) -> ()
      %1009 = arith.constant 66 : i64
      %1010 = func.call @cc_box_character(%1009) : (i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1011 = arith.constant 67 : i64
      %1012 = func.call @cc_box_character(%1011) : (i64) -> i64
      func.call @stack_push_pointer(%1012) : (i64) -> ()
      %1013 = arith.constant 68 : i64
      %1014 = func.call @cc_box_character(%1013) : (i64) -> i64
      func.call @stack_push_pointer(%1014) : (i64) -> ()
      %1015 = arith.constant 69 : i64
      %1016 = func.call @cc_box_character(%1015) : (i64) -> i64
      func.call @stack_push_pointer(%1016) : (i64) -> ()
      %1017 = arith.constant 70 : i64
      %1018 = func.call @cc_box_character(%1017) : (i64) -> i64
      func.call @stack_push_pointer(%1018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1019 = func.call @stack_pop_pointer() : () -> i64
      %1020 = func.call @stack_pop_pointer() : () -> i64
      %1021 = func.call @cc_cons(%1020, %1019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1021) : (i64) -> ()
      %1022 = func.call @stack_pop_pointer() : () -> i64
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = func.call @cc_cons(%1023, %1022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @cc_cons(%1026, %1025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      %1028 = func.call @stack_pop_pointer() : () -> i64
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = func.call @cc_cons(%1029, %1028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1030) : (i64) -> ()
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
      %1039 = func.call @cc_cons(%1037, %1038) : (i64, i64) -> i64
      %1040 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1041 = arith.constant 5 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = func.call @cc_nil_value() : () -> i64
      %1044 = func.call @cc_intern(%1042, %1043) : (i64, i64) -> i64
      %1045 = func.call @cc_nil_value() : () -> i64
      %1046 = func.call @cc_cons(%1044, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_values_pack(%1046) : (i64) -> i64
      %1048 = func.call @cc_cons(%1044, %1039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1048) : (i64) -> ()
      %1049 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1050 = arith.constant 12 : i64
      %1051 = func.call @cc_make_string(%1049, %1050) : (!llvm.ptr, i64) -> i64
      %1052 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1053 = arith.constant 7 : i64
      %1054 = func.call @cc_make_string(%1052, %1053) : (!llvm.ptr, i64) -> i64
      %1055 = func.call @cc_intern(%1051, %1054) : (i64, i64) -> i64
      %1056 = func.call @cc_nil_value() : () -> i64
      %1057 = func.call @cc_cons(%1055, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_values_pack(%1057) : (i64) -> i64
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      %1059 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1059) : (i64) -> ()
      %1060 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1061 = arith.constant 9 : i64
      %1062 = func.call @cc_make_string(%1060, %1061) : (!llvm.ptr, i64) -> i64
      %1063 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1064 = arith.constant 11 : i64
      %1065 = func.call @cc_make_string(%1063, %1064) : (!llvm.ptr, i64) -> i64
      %1066 = func.call @cc_intern(%1062, %1065) : (i64, i64) -> i64
      %1067 = func.call @cc_nil_value() : () -> i64
      %1068 = func.call @cc_cons(%1066, %1067) : (i64, i64) -> i64
      %1069 = func.call @cc_values_pack(%1068) : (i64) -> i64
      func.call @stack_push_pointer(%1066) : (i64) -> ()
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1074 = arith.constant 5 : i64
      %1075 = func.call @cc_make_string(%1073, %1074) : (!llvm.ptr, i64) -> i64
      %1076 = func.call @cc_nil_value() : () -> i64
      %1077 = func.call @cc_intern(%1075, %1076) : (i64, i64) -> i64
      %1078 = func.call @cc_nil_value() : () -> i64
      %1079 = func.call @cc_cons(%1077, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_values_pack(%1079) : (i64) -> i64
      %1081 = func.call @cc_cons(%1077, %1072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1083 = arith.constant 12 : i64
      %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
      %1085 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1086 = arith.constant 7 : i64
      %1087 = func.call @cc_make_string(%1085, %1086) : (!llvm.ptr, i64) -> i64
      %1088 = func.call @cc_intern(%1084, %1087) : (i64, i64) -> i64
      %1089 = func.call @cc_nil_value() : () -> i64
      %1090 = func.call @cc_cons(%1088, %1089) : (i64, i64) -> i64
      %1091 = func.call @cc_values_pack(%1090) : (i64) -> i64
      func.call @stack_push_pointer(%1088) : (i64) -> ()
      %1092 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%1092) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @cc_cons(%1094, %1093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1095) : (i64) -> ()
      %1096 = func.call @stack_pop_pointer() : () -> i64
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @cc_cons(%1097, %1096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
      %1099 = func.call @stack_pop_pointer() : () -> i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_cons(%1100, %1099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1101) : (i64) -> ()
      %1102 = func.call @stack_pop_pointer() : () -> i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1103, %1102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      %1105 = func.call @stack_pop_pointer() : () -> i64
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @cc_cons(%1106, %1105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1107) : (i64) -> ()
      %1108 = func.call @stack_pop_pointer() : () -> i64
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = func.call @cc_cons(%1109, %1108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1110) : (i64) -> ()
      %1111 = func.call @stack_pop_pointer() : () -> i64
      %1112 = func.call @stack_pop_pointer() : () -> i64
      %1113 = func.call @cc_cons(%1112, %1111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      %1114 = func.call @stack_pop_pointer() : () -> i64
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1116 = func.call @cc_cons(%1115, %1114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1117 = func.call @stack_pop_pointer() : () -> i64
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_cons(%1118, %1117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1119) : (i64) -> ()
      %1120 = func.call @stack_pop_pointer() : () -> i64
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @cc_cons(%1121, %1120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1123 = func.call @stack_pop_pointer() : () -> i64
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @cc_cons(%1124, %1123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1125) : (i64) -> ()
      %1126 = func.call @stack_pop_pointer() : () -> i64
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_cons(%1127, %1126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1129 = func.call @stack_pop_pointer() : () -> i64
      %1265 = arith.constant 116254966808581 : i64
      %1266 = arith.constant 0 : i64
      %1267 = func.call @cc_make_closure(%1265, %1266) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1267) : (i64) -> ()
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1270 = arith.constant 6 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1273 = arith.constant 11 : i64
      %1274 = func.call @cc_make_string(%1272, %1273) : (!llvm.ptr, i64) -> i64
      %1275 = func.call @cc_intern(%1271, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = func.call @cc_cons(%1275, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_values_pack(%1277) : (i64) -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @cc_cons(%1280, %1279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1281) : (i64) -> ()
      %1282 = func.call @stack_pop_pointer() : () -> i64
      %1283 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1284 = arith.constant 11 : i64
      %1285 = func.call @cc_make_string(%1283, %1284) : (!llvm.ptr, i64) -> i64
      %1286 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1287 = arith.constant 7 : i64
      %1288 = func.call @cc_make_string(%1286, %1287) : (!llvm.ptr, i64) -> i64
      %1289 = func.call @cc_intern(%1285, %1288) : (i64, i64) -> i64
      %1290 = func.call @cc_nil_value() : () -> i64
      %1291 = func.call @cc_cons(%1289, %1290) : (i64, i64) -> i64
      %1292 = func.call @cc_values_pack(%1291) : (i64) -> i64
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      %1293 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1294 = func.call @stack_pop_pointer() : () -> i64
      %1295 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1296 = arith.constant 4 : i64
      %1297 = func.call @cc_make_string(%1295, %1296) : (!llvm.ptr, i64) -> i64
      %1298 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1299 = arith.constant 7 : i64
      %1300 = func.call @cc_make_string(%1298, %1299) : (!llvm.ptr, i64) -> i64
      %1301 = func.call @cc_intern(%1297, %1300) : (i64, i64) -> i64
      %1302 = func.call @cc_nil_value() : () -> i64
      %1303 = func.call @cc_cons(%1301, %1302) : (i64, i64) -> i64
      %1304 = func.call @cc_values_pack(%1303) : (i64) -> i64
      func.call @stack_push_pointer(%1301) : (i64) -> ()
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %1306 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1307 = arith.constant 5 : i64
      %1308 = func.call @cc_make_string(%1306, %1307) : (!llvm.ptr, i64) -> i64
      %1309 = func.call @cc_nil_value() : () -> i64
      %1310 = func.call @cc_intern(%1308, %1309) : (i64, i64) -> i64
      %1311 = func.call @cc_nil_value() : () -> i64
      %1312 = func.call @cc_cons(%1310, %1311) : (i64, i64) -> i64
      %1313 = func.call @cc_values_pack(%1312) : (i64) -> i64
      func.call @stack_push_pointer(%1310) : (i64) -> ()
      %1314 = func.call @stack_pop_pointer() : () -> i64
      %1315 = func.call @cc_nil_value() : () -> i64
      %1316 = func.call @cc_errorp(%950) : (i64) -> i64
      %1317 = arith.cmpi ne, %1316, %1315 : i64
      %1318 = arith.cmpi eq, %1315, %1315 : i64
      %1319 = arith.andi %1317, %1318 : i1
      %1320 = scf.if %1319 -> (i64) {
        scf.yield %950 : i64
      } else {
        scf.yield %1315 : i64
      }
      %1321 = func.call @cc_errorp(%1129) : (i64) -> i64
      %1322 = arith.cmpi ne, %1321, %1315 : i64
      %1323 = arith.cmpi eq, %1320, %1315 : i64
      %1324 = arith.andi %1322, %1323 : i1
      %1325 = scf.if %1324 -> (i64) {
        scf.yield %1129 : i64
      } else {
        scf.yield %1320 : i64
      }
      %1326 = func.call @cc_errorp(%1268) : (i64) -> i64
      %1327 = arith.cmpi ne, %1326, %1315 : i64
      %1328 = arith.cmpi eq, %1325, %1315 : i64
      %1329 = arith.andi %1327, %1328 : i1
      %1330 = scf.if %1329 -> (i64) {
        scf.yield %1268 : i64
      } else {
        scf.yield %1325 : i64
      }
      %1331 = func.call @cc_errorp(%1282) : (i64) -> i64
      %1332 = arith.cmpi ne, %1331, %1315 : i64
      %1333 = arith.cmpi eq, %1330, %1315 : i64
      %1334 = arith.andi %1332, %1333 : i1
      %1335 = scf.if %1334 -> (i64) {
        scf.yield %1282 : i64
      } else {
        scf.yield %1330 : i64
      }
      %1336 = func.call @cc_errorp(%1293) : (i64) -> i64
      %1337 = arith.cmpi ne, %1336, %1315 : i64
      %1338 = arith.cmpi eq, %1335, %1315 : i64
      %1339 = arith.andi %1337, %1338 : i1
      %1340 = scf.if %1339 -> (i64) {
        scf.yield %1293 : i64
      } else {
        scf.yield %1335 : i64
      }
      %1341 = func.call @cc_errorp(%1294) : (i64) -> i64
      %1342 = arith.cmpi ne, %1341, %1315 : i64
      %1343 = arith.cmpi eq, %1340, %1315 : i64
      %1344 = arith.andi %1342, %1343 : i1
      %1345 = scf.if %1344 -> (i64) {
        scf.yield %1294 : i64
      } else {
        scf.yield %1340 : i64
      }
      %1346 = func.call @cc_errorp(%1305) : (i64) -> i64
      %1347 = arith.cmpi ne, %1346, %1315 : i64
      %1348 = arith.cmpi eq, %1345, %1315 : i64
      %1349 = arith.andi %1347, %1348 : i1
      %1350 = scf.if %1349 -> (i64) {
        scf.yield %1305 : i64
      } else {
        scf.yield %1345 : i64
      }
      %1351 = func.call @cc_errorp(%1314) : (i64) -> i64
      %1352 = arith.cmpi ne, %1351, %1315 : i64
      %1353 = arith.cmpi eq, %1350, %1315 : i64
      %1354 = arith.andi %1352, %1353 : i1
      %1355 = scf.if %1354 -> (i64) {
        scf.yield %1314 : i64
      } else {
        scf.yield %1350 : i64
      }
      %1356 = arith.cmpi ne, %1355, %1315 : i64
      scf.if %1356 {
        func.call @stack_push_pointer(%1355) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%950) : (i64) -> ()
        func.call @stack_push_pointer(%1129) : (i64) -> ()
        func.call @stack_push_pointer(%1268) : (i64) -> ()
        func.call @stack_push_pointer(%1282) : (i64) -> ()
        func.call @stack_push_pointer(%1293) : (i64) -> ()
        func.call @stack_push_pointer(%1294) : (i64) -> ()
        func.call @stack_push_pointer(%1305) : (i64) -> ()
        func.call @stack_push_pointer(%1314) : (i64) -> ()
        %1357 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1358 = func.call @cc_make_function_ref_const(%1357) : (!llvm.ptr) -> i64
        %1359 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1358, %1359) : (i64, i64) -> ()
      }
      %1360 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1360 : i64
    }
    %1361 = func.call @cc_nil_value() : () -> i64
    %1362 = func.call @cc_errorp(%941) : (i64) -> i64
    %1363 = arith.cmpi ne, %1362, %1361 : i64
    %1364 = scf.if %1363 -> (i64) {
      scf.yield %941 : i64
    } else {
      %1365 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1366 = arith.constant 12 : i64
      %1367 = func.call @cc_make_string(%1365, %1366) : (!llvm.ptr, i64) -> i64
      %1368 = func.call @cc_nil_value() : () -> i64
      %1369 = func.call @cc_intern(%1367, %1368) : (i64, i64) -> i64
      %1370 = func.call @cc_nil_value() : () -> i64
      %1371 = func.call @cc_cons(%1369, %1370) : (i64, i64) -> i64
      %1372 = func.call @cc_values_pack(%1371) : (i64) -> i64
      func.call @stack_push_pointer(%1369) : (i64) -> ()
      %1373 = func.call @stack_pop_pointer() : () -> i64
      %1374 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1375 = arith.constant 13 : i64
      %1376 = func.call @cc_make_string(%1374, %1375) : (!llvm.ptr, i64) -> i64
      %1377 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1378 = arith.constant 11 : i64
      %1379 = func.call @cc_make_string(%1377, %1378) : (!llvm.ptr, i64) -> i64
      %1380 = func.call @cc_intern(%1376, %1379) : (i64, i64) -> i64
      %1381 = func.call @cc_nil_value() : () -> i64
      %1382 = func.call @cc_cons(%1380, %1381) : (i64, i64) -> i64
      %1383 = func.call @cc_values_pack(%1382) : (i64) -> i64
      func.call @stack_push_pointer(%1380) : (i64) -> ()
      %1384 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1385 = arith.constant 6 : i64
      %1386 = func.call @cc_make_string(%1384, %1385) : (!llvm.ptr, i64) -> i64
      %1387 = func.call @cc_nil_value() : () -> i64
      %1388 = func.call @cc_intern(%1386, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_nil_value() : () -> i64
      %1390 = func.call @cc_cons(%1388, %1389) : (i64, i64) -> i64
      %1391 = func.call @cc_values_pack(%1390) : (i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1392 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1393 = arith.constant 19 : i64
      %1394 = func.call @cc_make_string(%1392, %1393) : (!llvm.ptr, i64) -> i64
      %1395 = func.call @cc_nil_value() : () -> i64
      %1396 = func.call @cc_intern(%1394, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_nil_value() : () -> i64
      %1398 = func.call @cc_cons(%1396, %1397) : (i64, i64) -> i64
      %1399 = func.call @cc_values_pack(%1398) : (i64) -> i64
      func.call @stack_push_pointer(%1396) : (i64) -> ()
      %1400 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1401 = arith.constant 3 : i64
      %1402 = func.call @cc_make_string(%1400, %1401) : (!llvm.ptr, i64) -> i64
      %1403 = func.call @cc_nil_value() : () -> i64
      %1404 = func.call @cc_intern(%1402, %1403) : (i64, i64) -> i64
      %1405 = func.call @cc_nil_value() : () -> i64
      %1406 = func.call @cc_cons(%1404, %1405) : (i64, i64) -> i64
      %1407 = func.call @cc_values_pack(%1406) : (i64) -> i64
      func.call @stack_push_pointer(%1404) : (i64) -> ()
      %1408 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1409 = arith.constant 3 : i64
      %1410 = func.call @cc_make_string(%1408, %1409) : (!llvm.ptr, i64) -> i64
      %1411 = func.call @cc_nil_value() : () -> i64
      %1412 = func.call @cc_intern(%1410, %1411) : (i64, i64) -> i64
      %1413 = func.call @cc_nil_value() : () -> i64
      %1414 = func.call @cc_cons(%1412, %1413) : (i64, i64) -> i64
      %1415 = func.call @cc_values_pack(%1414) : (i64) -> i64
      func.call @stack_push_pointer(%1412) : (i64) -> ()
      %1416 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1416) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1417 = func.call @stack_pop_pointer() : () -> i64
      %1418 = func.call @stack_pop_pointer() : () -> i64
      %1419 = func.call @cc_cons(%1418, %1417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1419) : (i64) -> ()
      %1420 = func.call @stack_pop_pointer() : () -> i64
      %1421 = func.call @stack_pop_pointer() : () -> i64
      %1422 = func.call @cc_cons(%1421, %1420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = func.call @stack_pop_pointer() : () -> i64
      %1425 = func.call @cc_cons(%1424, %1423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1425) : (i64) -> ()
      %1426 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1427 = arith.constant 10 : i64
      %1428 = func.call @cc_make_string(%1426, %1427) : (!llvm.ptr, i64) -> i64
      %1429 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1430 = arith.constant 11 : i64
      %1431 = func.call @cc_make_string(%1429, %1430) : (!llvm.ptr, i64) -> i64
      %1432 = func.call @cc_intern(%1428, %1431) : (i64, i64) -> i64
      %1433 = func.call @cc_nil_value() : () -> i64
      %1434 = func.call @cc_cons(%1432, %1433) : (i64, i64) -> i64
      %1435 = func.call @cc_values_pack(%1434) : (i64) -> i64
      func.call @stack_push_pointer(%1432) : (i64) -> ()
      %1436 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1437 = arith.constant 3 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = func.call @cc_nil_value() : () -> i64
      %1440 = func.call @cc_intern(%1438, %1439) : (i64, i64) -> i64
      %1441 = func.call @cc_nil_value() : () -> i64
      %1442 = func.call @cc_cons(%1440, %1441) : (i64, i64) -> i64
      %1443 = func.call @cc_values_pack(%1442) : (i64) -> i64
      func.call @stack_push_pointer(%1440) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1444 = func.call @stack_pop_pointer() : () -> i64
      %1445 = func.call @stack_pop_pointer() : () -> i64
      %1446 = func.call @cc_cons(%1445, %1444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1446) : (i64) -> ()
      %1447 = func.call @stack_pop_pointer() : () -> i64
      %1448 = func.call @stack_pop_pointer() : () -> i64
      %1449 = func.call @cc_cons(%1448, %1447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1449) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1450 = func.call @stack_pop_pointer() : () -> i64
      %1451 = func.call @stack_pop_pointer() : () -> i64
      %1452 = func.call @cc_cons(%1451, %1450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1452) : (i64) -> ()
      %1453 = func.call @stack_pop_pointer() : () -> i64
      %1454 = func.call @stack_pop_pointer() : () -> i64
      %1455 = func.call @cc_cons(%1454, %1453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1455) : (i64) -> ()
      %1456 = func.call @stack_pop_pointer() : () -> i64
      %1457 = func.call @stack_pop_pointer() : () -> i64
      %1458 = func.call @cc_cons(%1457, %1456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1459 = func.call @stack_pop_pointer() : () -> i64
      %1460 = func.call @stack_pop_pointer() : () -> i64
      %1461 = func.call @cc_cons(%1460, %1459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1461) : (i64) -> ()
      %1462 = func.call @stack_pop_pointer() : () -> i64
      %1463 = func.call @stack_pop_pointer() : () -> i64
      %1464 = func.call @cc_cons(%1463, %1462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1464) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1465 = func.call @stack_pop_pointer() : () -> i64
      %1466 = func.call @stack_pop_pointer() : () -> i64
      %1467 = func.call @cc_cons(%1466, %1465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1467) : (i64) -> ()
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
      %1480 = func.call @stack_pop_pointer() : () -> i64
      %1534 = arith.constant 116254966808582 : i64
      %1535 = arith.constant 0 : i64
      %1536 = func.call @cc_make_closure(%1534, %1535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1536) : (i64) -> ()
      %1537 = func.call @stack_pop_pointer() : () -> i64
      %1538 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1539 = arith.constant 4 : i64
      %1540 = func.call @cc_make_string(%1538, %1539) : (!llvm.ptr, i64) -> i64
      %1541 = func.call @cc_nil_value() : () -> i64
      %1542 = func.call @cc_intern(%1540, %1541) : (i64, i64) -> i64
      %1543 = func.call @cc_nil_value() : () -> i64
      %1544 = func.call @cc_cons(%1542, %1543) : (i64, i64) -> i64
      %1545 = func.call @cc_values_pack(%1544) : (i64) -> i64
      func.call @stack_push_pointer(%1542) : (i64) -> ()
      %1546 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1547 = arith.constant 10 : i64
      %1548 = func.call @cc_make_string(%1546, %1547) : (!llvm.ptr, i64) -> i64
      %1549 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1550 = arith.constant 11 : i64
      %1551 = func.call @cc_make_string(%1549, %1550) : (!llvm.ptr, i64) -> i64
      %1552 = func.call @cc_intern(%1548, %1551) : (i64, i64) -> i64
      %1553 = func.call @cc_nil_value() : () -> i64
      %1554 = func.call @cc_cons(%1552, %1553) : (i64, i64) -> i64
      %1555 = func.call @cc_values_pack(%1554) : (i64) -> i64
      func.call @stack_push_pointer(%1552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1556 = func.call @stack_pop_pointer() : () -> i64
      %1557 = func.call @stack_pop_pointer() : () -> i64
      %1558 = func.call @cc_cons(%1557, %1556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1558) : (i64) -> ()
      %1559 = func.call @stack_pop_pointer() : () -> i64
      %1560 = func.call @stack_pop_pointer() : () -> i64
      %1561 = func.call @cc_cons(%1560, %1559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1561) : (i64) -> ()
      %1562 = func.call @stack_pop_pointer() : () -> i64
      %1563 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1564 = arith.constant 11 : i64
      %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
      %1566 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1567 = arith.constant 7 : i64
      %1568 = func.call @cc_make_string(%1566, %1567) : (!llvm.ptr, i64) -> i64
      %1569 = func.call @cc_intern(%1565, %1568) : (i64, i64) -> i64
      %1570 = func.call @cc_nil_value() : () -> i64
      %1571 = func.call @cc_cons(%1569, %1570) : (i64, i64) -> i64
      %1572 = func.call @cc_values_pack(%1571) : (i64) -> i64
      func.call @stack_push_pointer(%1569) : (i64) -> ()
      %1573 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1574 = func.call @stack_pop_pointer() : () -> i64
      %1575 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1576 = arith.constant 4 : i64
      %1577 = func.call @cc_make_string(%1575, %1576) : (!llvm.ptr, i64) -> i64
      %1578 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1579 = arith.constant 7 : i64
      %1580 = func.call @cc_make_string(%1578, %1579) : (!llvm.ptr, i64) -> i64
      %1581 = func.call @cc_intern(%1577, %1580) : (i64, i64) -> i64
      %1582 = func.call @cc_nil_value() : () -> i64
      %1583 = func.call @cc_cons(%1581, %1582) : (i64, i64) -> i64
      %1584 = func.call @cc_values_pack(%1583) : (i64) -> i64
      func.call @stack_push_pointer(%1581) : (i64) -> ()
      %1585 = func.call @stack_pop_pointer() : () -> i64
      %1586 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1587 = arith.constant 5 : i64
      %1588 = func.call @cc_make_string(%1586, %1587) : (!llvm.ptr, i64) -> i64
      %1589 = func.call @cc_nil_value() : () -> i64
      %1590 = func.call @cc_intern(%1588, %1589) : (i64, i64) -> i64
      %1591 = func.call @cc_nil_value() : () -> i64
      %1592 = func.call @cc_cons(%1590, %1591) : (i64, i64) -> i64
      %1593 = func.call @cc_values_pack(%1592) : (i64) -> i64
      func.call @stack_push_pointer(%1590) : (i64) -> ()
      %1594 = func.call @stack_pop_pointer() : () -> i64
      %1595 = func.call @cc_nil_value() : () -> i64
      %1596 = func.call @cc_errorp(%1373) : (i64) -> i64
      %1597 = arith.cmpi ne, %1596, %1595 : i64
      %1598 = arith.cmpi eq, %1595, %1595 : i64
      %1599 = arith.andi %1597, %1598 : i1
      %1600 = scf.if %1599 -> (i64) {
        scf.yield %1373 : i64
      } else {
        scf.yield %1595 : i64
      }
      %1601 = func.call @cc_errorp(%1480) : (i64) -> i64
      %1602 = arith.cmpi ne, %1601, %1595 : i64
      %1603 = arith.cmpi eq, %1600, %1595 : i64
      %1604 = arith.andi %1602, %1603 : i1
      %1605 = scf.if %1604 -> (i64) {
        scf.yield %1480 : i64
      } else {
        scf.yield %1600 : i64
      }
      %1606 = func.call @cc_errorp(%1537) : (i64) -> i64
      %1607 = arith.cmpi ne, %1606, %1595 : i64
      %1608 = arith.cmpi eq, %1605, %1595 : i64
      %1609 = arith.andi %1607, %1608 : i1
      %1610 = scf.if %1609 -> (i64) {
        scf.yield %1537 : i64
      } else {
        scf.yield %1605 : i64
      }
      %1611 = func.call @cc_errorp(%1562) : (i64) -> i64
      %1612 = arith.cmpi ne, %1611, %1595 : i64
      %1613 = arith.cmpi eq, %1610, %1595 : i64
      %1614 = arith.andi %1612, %1613 : i1
      %1615 = scf.if %1614 -> (i64) {
        scf.yield %1562 : i64
      } else {
        scf.yield %1610 : i64
      }
      %1616 = func.call @cc_errorp(%1573) : (i64) -> i64
      %1617 = arith.cmpi ne, %1616, %1595 : i64
      %1618 = arith.cmpi eq, %1615, %1595 : i64
      %1619 = arith.andi %1617, %1618 : i1
      %1620 = scf.if %1619 -> (i64) {
        scf.yield %1573 : i64
      } else {
        scf.yield %1615 : i64
      }
      %1621 = func.call @cc_errorp(%1574) : (i64) -> i64
      %1622 = arith.cmpi ne, %1621, %1595 : i64
      %1623 = arith.cmpi eq, %1620, %1595 : i64
      %1624 = arith.andi %1622, %1623 : i1
      %1625 = scf.if %1624 -> (i64) {
        scf.yield %1574 : i64
      } else {
        scf.yield %1620 : i64
      }
      %1626 = func.call @cc_errorp(%1585) : (i64) -> i64
      %1627 = arith.cmpi ne, %1626, %1595 : i64
      %1628 = arith.cmpi eq, %1625, %1595 : i64
      %1629 = arith.andi %1627, %1628 : i1
      %1630 = scf.if %1629 -> (i64) {
        scf.yield %1585 : i64
      } else {
        scf.yield %1625 : i64
      }
      %1631 = func.call @cc_errorp(%1594) : (i64) -> i64
      %1632 = arith.cmpi ne, %1631, %1595 : i64
      %1633 = arith.cmpi eq, %1630, %1595 : i64
      %1634 = arith.andi %1632, %1633 : i1
      %1635 = scf.if %1634 -> (i64) {
        scf.yield %1594 : i64
      } else {
        scf.yield %1630 : i64
      }
      %1636 = arith.cmpi ne, %1635, %1595 : i64
      scf.if %1636 {
        func.call @stack_push_pointer(%1635) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1373) : (i64) -> ()
        func.call @stack_push_pointer(%1480) : (i64) -> ()
        func.call @stack_push_pointer(%1537) : (i64) -> ()
        func.call @stack_push_pointer(%1562) : (i64) -> ()
        func.call @stack_push_pointer(%1573) : (i64) -> ()
        func.call @stack_push_pointer(%1574) : (i64) -> ()
        func.call @stack_push_pointer(%1585) : (i64) -> ()
        func.call @stack_push_pointer(%1594) : (i64) -> ()
        %1637 = llvm.mlir.addressof @str124 : !llvm.ptr
        %1638 = func.call @cc_make_function_ref_const(%1637) : (!llvm.ptr) -> i64
        %1639 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1638, %1639) : (i64, i64) -> ()
      }
      %1640 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1640 : i64
    }
    %1641 = func.call @cc_nil_value() : () -> i64
    %1642 = func.call @cc_errorp(%1364) : (i64) -> i64
    %1643 = arith.cmpi ne, %1642, %1641 : i64
    %1644 = scf.if %1643 -> (i64) {
      scf.yield %1364 : i64
    } else {
      %1645 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1646 = arith.constant 8 : i64
      %1647 = func.call @cc_make_string(%1645, %1646) : (!llvm.ptr, i64) -> i64
      %1648 = func.call @cc_nil_value() : () -> i64
      %1649 = func.call @cc_intern(%1647, %1648) : (i64, i64) -> i64
      %1650 = func.call @cc_nil_value() : () -> i64
      %1651 = func.call @cc_cons(%1649, %1650) : (i64, i64) -> i64
      %1652 = func.call @cc_values_pack(%1651) : (i64) -> i64
      func.call @stack_push_pointer(%1649) : (i64) -> ()
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1655 = arith.constant 13 : i64
      %1656 = func.call @cc_make_string(%1654, %1655) : (!llvm.ptr, i64) -> i64
      %1657 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1658 = arith.constant 11 : i64
      %1659 = func.call @cc_make_string(%1657, %1658) : (!llvm.ptr, i64) -> i64
      %1660 = func.call @cc_intern(%1656, %1659) : (i64, i64) -> i64
      %1661 = func.call @cc_nil_value() : () -> i64
      %1662 = func.call @cc_cons(%1660, %1661) : (i64, i64) -> i64
      %1663 = func.call @cc_values_pack(%1662) : (i64) -> i64
      func.call @stack_push_pointer(%1660) : (i64) -> ()
      %1664 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1665 = arith.constant 6 : i64
      %1666 = func.call @cc_make_string(%1664, %1665) : (!llvm.ptr, i64) -> i64
      %1667 = func.call @cc_nil_value() : () -> i64
      %1668 = func.call @cc_intern(%1666, %1667) : (i64, i64) -> i64
      %1669 = func.call @cc_nil_value() : () -> i64
      %1670 = func.call @cc_cons(%1668, %1669) : (i64, i64) -> i64
      %1671 = func.call @cc_values_pack(%1670) : (i64) -> i64
      func.call @stack_push_pointer(%1668) : (i64) -> ()
      %1672 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1673 = arith.constant 19 : i64
      %1674 = func.call @cc_make_string(%1672, %1673) : (!llvm.ptr, i64) -> i64
      %1675 = func.call @cc_nil_value() : () -> i64
      %1676 = func.call @cc_intern(%1674, %1675) : (i64, i64) -> i64
      %1677 = func.call @cc_nil_value() : () -> i64
      %1678 = func.call @cc_cons(%1676, %1677) : (i64, i64) -> i64
      %1679 = func.call @cc_values_pack(%1678) : (i64) -> i64
      func.call @stack_push_pointer(%1676) : (i64) -> ()
      %1680 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1681 = arith.constant 6 : i64
      %1682 = func.call @cc_make_string(%1680, %1681) : (!llvm.ptr, i64) -> i64
      %1683 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1684 = arith.constant 11 : i64
      %1685 = func.call @cc_make_string(%1683, %1684) : (!llvm.ptr, i64) -> i64
      %1686 = func.call @cc_intern(%1682, %1685) : (i64, i64) -> i64
      %1687 = func.call @cc_nil_value() : () -> i64
      %1688 = func.call @cc_cons(%1686, %1687) : (i64, i64) -> i64
      %1689 = func.call @cc_values_pack(%1688) : (i64) -> i64
      func.call @stack_push_pointer(%1686) : (i64) -> ()
      %1690 = arith.constant -1 : i64
      func.call @stack_push_fixnum(%1690) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = func.call @cc_cons(%1692, %1691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1693) : (i64) -> ()
      %1694 = func.call @stack_pop_pointer() : () -> i64
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @cc_cons(%1695, %1694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1696) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1697 = func.call @stack_pop_pointer() : () -> i64
      %1698 = func.call @stack_pop_pointer() : () -> i64
      %1699 = func.call @cc_cons(%1698, %1697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1699) : (i64) -> ()
      %1700 = func.call @stack_pop_pointer() : () -> i64
      %1701 = func.call @stack_pop_pointer() : () -> i64
      %1702 = func.call @cc_cons(%1701, %1700) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1703 = func.call @stack_pop_pointer() : () -> i64
      %1704 = func.call @stack_pop_pointer() : () -> i64
      %1705 = func.call @cc_cons(%1704, %1703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1705) : (i64) -> ()
      %1706 = func.call @stack_pop_pointer() : () -> i64
      %1707 = func.call @stack_pop_pointer() : () -> i64
      %1708 = func.call @cc_cons(%1707, %1706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1708) : (i64) -> ()
      %1709 = func.call @stack_pop_pointer() : () -> i64
      %1710 = func.call @stack_pop_pointer() : () -> i64
      %1711 = func.call @cc_cons(%1710, %1709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1712 = func.call @stack_pop_pointer() : () -> i64
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @cc_cons(%1713, %1712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1714) : (i64) -> ()
      %1715 = func.call @stack_pop_pointer() : () -> i64
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = func.call @cc_cons(%1716, %1715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1717) : (i64) -> ()
      %1718 = func.call @stack_pop_pointer() : () -> i64
      %1765 = arith.constant 116254966808583 : i64
      %1766 = arith.constant 0 : i64
      %1767 = func.call @cc_make_closure(%1765, %1766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1767) : (i64) -> ()
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1770 = arith.constant 4 : i64
      %1771 = func.call @cc_make_string(%1769, %1770) : (!llvm.ptr, i64) -> i64
      %1772 = func.call @cc_nil_value() : () -> i64
      %1773 = func.call @cc_intern(%1771, %1772) : (i64, i64) -> i64
      %1774 = func.call @cc_nil_value() : () -> i64
      %1775 = func.call @cc_cons(%1773, %1774) : (i64, i64) -> i64
      %1776 = func.call @cc_values_pack(%1775) : (i64) -> i64
      func.call @stack_push_pointer(%1773) : (i64) -> ()
      %1777 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1778 = arith.constant 10 : i64
      %1779 = func.call @cc_make_string(%1777, %1778) : (!llvm.ptr, i64) -> i64
      %1780 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1781 = arith.constant 11 : i64
      %1782 = func.call @cc_make_string(%1780, %1781) : (!llvm.ptr, i64) -> i64
      %1783 = func.call @cc_intern(%1779, %1782) : (i64, i64) -> i64
      %1784 = func.call @cc_nil_value() : () -> i64
      %1785 = func.call @cc_cons(%1783, %1784) : (i64, i64) -> i64
      %1786 = func.call @cc_values_pack(%1785) : (i64) -> i64
      func.call @stack_push_pointer(%1783) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = func.call @stack_pop_pointer() : () -> i64
      %1789 = func.call @cc_cons(%1788, %1787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1789) : (i64) -> ()
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @stack_pop_pointer() : () -> i64
      %1792 = func.call @cc_cons(%1791, %1790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1792) : (i64) -> ()
      %1793 = func.call @stack_pop_pointer() : () -> i64
      %1794 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1795 = arith.constant 11 : i64
      %1796 = func.call @cc_make_string(%1794, %1795) : (!llvm.ptr, i64) -> i64
      %1797 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1798 = arith.constant 7 : i64
      %1799 = func.call @cc_make_string(%1797, %1798) : (!llvm.ptr, i64) -> i64
      %1800 = func.call @cc_intern(%1796, %1799) : (i64, i64) -> i64
      %1801 = func.call @cc_nil_value() : () -> i64
      %1802 = func.call @cc_cons(%1800, %1801) : (i64, i64) -> i64
      %1803 = func.call @cc_values_pack(%1802) : (i64) -> i64
      func.call @stack_push_pointer(%1800) : (i64) -> ()
      %1804 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1805 = func.call @stack_pop_pointer() : () -> i64
      %1806 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1807 = arith.constant 4 : i64
      %1808 = func.call @cc_make_string(%1806, %1807) : (!llvm.ptr, i64) -> i64
      %1809 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1810 = arith.constant 7 : i64
      %1811 = func.call @cc_make_string(%1809, %1810) : (!llvm.ptr, i64) -> i64
      %1812 = func.call @cc_intern(%1808, %1811) : (i64, i64) -> i64
      %1813 = func.call @cc_nil_value() : () -> i64
      %1814 = func.call @cc_cons(%1812, %1813) : (i64, i64) -> i64
      %1815 = func.call @cc_values_pack(%1814) : (i64) -> i64
      func.call @stack_push_pointer(%1812) : (i64) -> ()
      %1816 = func.call @stack_pop_pointer() : () -> i64
      %1817 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1818 = arith.constant 5 : i64
      %1819 = func.call @cc_make_string(%1817, %1818) : (!llvm.ptr, i64) -> i64
      %1820 = func.call @cc_nil_value() : () -> i64
      %1821 = func.call @cc_intern(%1819, %1820) : (i64, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_cons(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_values_pack(%1823) : (i64) -> i64
      func.call @stack_push_pointer(%1821) : (i64) -> ()
      %1825 = func.call @stack_pop_pointer() : () -> i64
      %1826 = func.call @cc_nil_value() : () -> i64
      %1827 = func.call @cc_errorp(%1653) : (i64) -> i64
      %1828 = arith.cmpi ne, %1827, %1826 : i64
      %1829 = arith.cmpi eq, %1826, %1826 : i64
      %1830 = arith.andi %1828, %1829 : i1
      %1831 = scf.if %1830 -> (i64) {
        scf.yield %1653 : i64
      } else {
        scf.yield %1826 : i64
      }
      %1832 = func.call @cc_errorp(%1718) : (i64) -> i64
      %1833 = arith.cmpi ne, %1832, %1826 : i64
      %1834 = arith.cmpi eq, %1831, %1826 : i64
      %1835 = arith.andi %1833, %1834 : i1
      %1836 = scf.if %1835 -> (i64) {
        scf.yield %1718 : i64
      } else {
        scf.yield %1831 : i64
      }
      %1837 = func.call @cc_errorp(%1768) : (i64) -> i64
      %1838 = arith.cmpi ne, %1837, %1826 : i64
      %1839 = arith.cmpi eq, %1836, %1826 : i64
      %1840 = arith.andi %1838, %1839 : i1
      %1841 = scf.if %1840 -> (i64) {
        scf.yield %1768 : i64
      } else {
        scf.yield %1836 : i64
      }
      %1842 = func.call @cc_errorp(%1793) : (i64) -> i64
      %1843 = arith.cmpi ne, %1842, %1826 : i64
      %1844 = arith.cmpi eq, %1841, %1826 : i64
      %1845 = arith.andi %1843, %1844 : i1
      %1846 = scf.if %1845 -> (i64) {
        scf.yield %1793 : i64
      } else {
        scf.yield %1841 : i64
      }
      %1847 = func.call @cc_errorp(%1804) : (i64) -> i64
      %1848 = arith.cmpi ne, %1847, %1826 : i64
      %1849 = arith.cmpi eq, %1846, %1826 : i64
      %1850 = arith.andi %1848, %1849 : i1
      %1851 = scf.if %1850 -> (i64) {
        scf.yield %1804 : i64
      } else {
        scf.yield %1846 : i64
      }
      %1852 = func.call @cc_errorp(%1805) : (i64) -> i64
      %1853 = arith.cmpi ne, %1852, %1826 : i64
      %1854 = arith.cmpi eq, %1851, %1826 : i64
      %1855 = arith.andi %1853, %1854 : i1
      %1856 = scf.if %1855 -> (i64) {
        scf.yield %1805 : i64
      } else {
        scf.yield %1851 : i64
      }
      %1857 = func.call @cc_errorp(%1816) : (i64) -> i64
      %1858 = arith.cmpi ne, %1857, %1826 : i64
      %1859 = arith.cmpi eq, %1856, %1826 : i64
      %1860 = arith.andi %1858, %1859 : i1
      %1861 = scf.if %1860 -> (i64) {
        scf.yield %1816 : i64
      } else {
        scf.yield %1856 : i64
      }
      %1862 = func.call @cc_errorp(%1825) : (i64) -> i64
      %1863 = arith.cmpi ne, %1862, %1826 : i64
      %1864 = arith.cmpi eq, %1861, %1826 : i64
      %1865 = arith.andi %1863, %1864 : i1
      %1866 = scf.if %1865 -> (i64) {
        scf.yield %1825 : i64
      } else {
        scf.yield %1861 : i64
      }
      %1867 = arith.cmpi ne, %1866, %1826 : i64
      scf.if %1867 {
        func.call @stack_push_pointer(%1866) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1653) : (i64) -> ()
        func.call @stack_push_pointer(%1718) : (i64) -> ()
        func.call @stack_push_pointer(%1768) : (i64) -> ()
        func.call @stack_push_pointer(%1793) : (i64) -> ()
        func.call @stack_push_pointer(%1804) : (i64) -> ()
        func.call @stack_push_pointer(%1805) : (i64) -> ()
        func.call @stack_push_pointer(%1816) : (i64) -> ()
        func.call @stack_push_pointer(%1825) : (i64) -> ()
        %1868 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1869 = func.call @cc_make_function_ref_const(%1868) : (!llvm.ptr) -> i64
        %1870 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1869, %1870) : (i64, i64) -> ()
      }
      %1871 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1871 : i64
    }
    %1872 = func.call @cc_nil_value() : () -> i64
    %1873 = func.call @cc_errorp(%1644) : (i64) -> i64
    %1874 = arith.cmpi ne, %1873, %1872 : i64
    %1875 = scf.if %1874 -> (i64) {
      scf.yield %1644 : i64
    } else {
      %1876 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1877 = arith.constant 8 : i64
      %1878 = func.call @cc_make_string(%1876, %1877) : (!llvm.ptr, i64) -> i64
      %1879 = func.call @cc_nil_value() : () -> i64
      %1880 = func.call @cc_intern(%1878, %1879) : (i64, i64) -> i64
      %1881 = func.call @cc_nil_value() : () -> i64
      %1882 = func.call @cc_cons(%1880, %1881) : (i64, i64) -> i64
      %1883 = func.call @cc_values_pack(%1882) : (i64) -> i64
      func.call @stack_push_pointer(%1880) : (i64) -> ()
      %1884 = func.call @stack_pop_pointer() : () -> i64
      %1885 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1886 = arith.constant 13 : i64
      %1887 = func.call @cc_make_string(%1885, %1886) : (!llvm.ptr, i64) -> i64
      %1888 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1889 = arith.constant 11 : i64
      %1890 = func.call @cc_make_string(%1888, %1889) : (!llvm.ptr, i64) -> i64
      %1891 = func.call @cc_intern(%1887, %1890) : (i64, i64) -> i64
      %1892 = func.call @cc_nil_value() : () -> i64
      %1893 = func.call @cc_cons(%1891, %1892) : (i64, i64) -> i64
      %1894 = func.call @cc_values_pack(%1893) : (i64) -> i64
      func.call @stack_push_pointer(%1891) : (i64) -> ()
      %1895 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1896 = arith.constant 6 : i64
      %1897 = func.call @cc_make_string(%1895, %1896) : (!llvm.ptr, i64) -> i64
      %1898 = func.call @cc_nil_value() : () -> i64
      %1899 = func.call @cc_intern(%1897, %1898) : (i64, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_cons(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_values_pack(%1901) : (i64) -> i64
      func.call @stack_push_pointer(%1899) : (i64) -> ()
      %1903 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1904 = arith.constant 19 : i64
      %1905 = func.call @cc_make_string(%1903, %1904) : (!llvm.ptr, i64) -> i64
      %1906 = func.call @cc_nil_value() : () -> i64
      %1907 = func.call @cc_intern(%1905, %1906) : (i64, i64) -> i64
      %1908 = func.call @cc_nil_value() : () -> i64
      %1909 = func.call @cc_cons(%1907, %1908) : (i64, i64) -> i64
      %1910 = func.call @cc_values_pack(%1909) : (i64) -> i64
      func.call @stack_push_pointer(%1907) : (i64) -> ()
      %1911 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1912 = arith.constant 6 : i64
      %1913 = func.call @cc_make_string(%1911, %1912) : (!llvm.ptr, i64) -> i64
      %1914 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1915 = arith.constant 11 : i64
      %1916 = func.call @cc_make_string(%1914, %1915) : (!llvm.ptr, i64) -> i64
      %1917 = func.call @cc_intern(%1913, %1916) : (i64, i64) -> i64
      %1918 = func.call @cc_nil_value() : () -> i64
      %1919 = func.call @cc_cons(%1917, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_values_pack(%1919) : (i64) -> i64
      func.call @stack_push_pointer(%1917) : (i64) -> ()
      %1921 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1922 = arith.constant 2 : i64
      %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
      %1924 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1925 = arith.constant 11 : i64
      %1926 = func.call @cc_make_string(%1924, %1925) : (!llvm.ptr, i64) -> i64
      %1927 = func.call @cc_intern(%1923, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_nil_value() : () -> i64
      %1929 = func.call @cc_cons(%1927, %1928) : (i64, i64) -> i64
      %1930 = func.call @cc_values_pack(%1929) : (i64) -> i64
      func.call @stack_push_pointer(%1927) : (i64) -> ()
      %1931 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1932 = arith.constant 20 : i64
      %1933 = func.call @cc_make_string(%1931, %1932) : (!llvm.ptr, i64) -> i64
      %1934 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1935 = arith.constant 11 : i64
      %1936 = func.call @cc_make_string(%1934, %1935) : (!llvm.ptr, i64) -> i64
      %1937 = func.call @cc_intern(%1933, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_nil_value() : () -> i64
      %1939 = func.call @cc_cons(%1937, %1938) : (i64, i64) -> i64
      %1940 = func.call @cc_values_pack(%1939) : (i64) -> i64
      func.call @stack_push_pointer(%1937) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1941 = func.call @stack_pop_pointer() : () -> i64
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @cc_cons(%1942, %1941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1943) : (i64) -> ()
      %1944 = func.call @stack_pop_pointer() : () -> i64
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_cons(%1945, %1944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1946) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1947 = func.call @stack_pop_pointer() : () -> i64
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @cc_cons(%1948, %1947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1949) : (i64) -> ()
      %1950 = func.call @stack_pop_pointer() : () -> i64
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @cc_cons(%1951, %1950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @cc_cons(%1954, %1953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1955) : (i64) -> ()
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @cc_cons(%1957, %1956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1958) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1959 = func.call @stack_pop_pointer() : () -> i64
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_cons(%1960, %1959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1961) : (i64) -> ()
      %1962 = func.call @stack_pop_pointer() : () -> i64
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @cc_cons(%1963, %1962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1964) : (i64) -> ()
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @cc_cons(%1966, %1965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = func.call @stack_pop_pointer() : () -> i64
      %1970 = func.call @cc_cons(%1969, %1968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1970) : (i64) -> ()
      %1971 = func.call @stack_pop_pointer() : () -> i64
      %1972 = func.call @stack_pop_pointer() : () -> i64
      %1973 = func.call @cc_cons(%1972, %1971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1973) : (i64) -> ()
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %2059 = arith.constant 116254966808584 : i64
      %2060 = arith.constant 0 : i64
      %2061 = func.call @cc_make_closure(%2059, %2060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2061) : (i64) -> ()
      %2062 = func.call @stack_pop_pointer() : () -> i64
      %2063 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2064 = arith.constant 4 : i64
      %2065 = func.call @cc_make_string(%2063, %2064) : (!llvm.ptr, i64) -> i64
      %2066 = func.call @cc_nil_value() : () -> i64
      %2067 = func.call @cc_intern(%2065, %2066) : (i64, i64) -> i64
      %2068 = func.call @cc_nil_value() : () -> i64
      %2069 = func.call @cc_cons(%2067, %2068) : (i64, i64) -> i64
      %2070 = func.call @cc_values_pack(%2069) : (i64) -> i64
      func.call @stack_push_pointer(%2067) : (i64) -> ()
      %2071 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2072 = arith.constant 10 : i64
      %2073 = func.call @cc_make_string(%2071, %2072) : (!llvm.ptr, i64) -> i64
      %2074 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2075 = arith.constant 11 : i64
      %2076 = func.call @cc_make_string(%2074, %2075) : (!llvm.ptr, i64) -> i64
      %2077 = func.call @cc_intern(%2073, %2076) : (i64, i64) -> i64
      %2078 = func.call @cc_nil_value() : () -> i64
      %2079 = func.call @cc_cons(%2077, %2078) : (i64, i64) -> i64
      %2080 = func.call @cc_values_pack(%2079) : (i64) -> i64
      func.call @stack_push_pointer(%2077) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2081 = func.call @stack_pop_pointer() : () -> i64
      %2082 = func.call @stack_pop_pointer() : () -> i64
      %2083 = func.call @cc_cons(%2082, %2081) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2083) : (i64) -> ()
      %2084 = func.call @stack_pop_pointer() : () -> i64
      %2085 = func.call @stack_pop_pointer() : () -> i64
      %2086 = func.call @cc_cons(%2085, %2084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2086) : (i64) -> ()
      %2087 = func.call @stack_pop_pointer() : () -> i64
      %2088 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2089 = arith.constant 11 : i64
      %2090 = func.call @cc_make_string(%2088, %2089) : (!llvm.ptr, i64) -> i64
      %2091 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2092 = arith.constant 7 : i64
      %2093 = func.call @cc_make_string(%2091, %2092) : (!llvm.ptr, i64) -> i64
      %2094 = func.call @cc_intern(%2090, %2093) : (i64, i64) -> i64
      %2095 = func.call @cc_nil_value() : () -> i64
      %2096 = func.call @cc_cons(%2094, %2095) : (i64, i64) -> i64
      %2097 = func.call @cc_values_pack(%2096) : (i64) -> i64
      func.call @stack_push_pointer(%2094) : (i64) -> ()
      %2098 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2099 = func.call @stack_pop_pointer() : () -> i64
      %2100 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2101 = arith.constant 4 : i64
      %2102 = func.call @cc_make_string(%2100, %2101) : (!llvm.ptr, i64) -> i64
      %2103 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2104 = arith.constant 7 : i64
      %2105 = func.call @cc_make_string(%2103, %2104) : (!llvm.ptr, i64) -> i64
      %2106 = func.call @cc_intern(%2102, %2105) : (i64, i64) -> i64
      %2107 = func.call @cc_nil_value() : () -> i64
      %2108 = func.call @cc_cons(%2106, %2107) : (i64, i64) -> i64
      %2109 = func.call @cc_values_pack(%2108) : (i64) -> i64
      func.call @stack_push_pointer(%2106) : (i64) -> ()
      %2110 = func.call @stack_pop_pointer() : () -> i64
      %2111 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2112 = arith.constant 5 : i64
      %2113 = func.call @cc_make_string(%2111, %2112) : (!llvm.ptr, i64) -> i64
      %2114 = func.call @cc_nil_value() : () -> i64
      %2115 = func.call @cc_intern(%2113, %2114) : (i64, i64) -> i64
      %2116 = func.call @cc_nil_value() : () -> i64
      %2117 = func.call @cc_cons(%2115, %2116) : (i64, i64) -> i64
      %2118 = func.call @cc_values_pack(%2117) : (i64) -> i64
      func.call @stack_push_pointer(%2115) : (i64) -> ()
      %2119 = func.call @stack_pop_pointer() : () -> i64
      %2120 = func.call @cc_nil_value() : () -> i64
      %2121 = func.call @cc_errorp(%1884) : (i64) -> i64
      %2122 = arith.cmpi ne, %2121, %2120 : i64
      %2123 = arith.cmpi eq, %2120, %2120 : i64
      %2124 = arith.andi %2122, %2123 : i1
      %2125 = scf.if %2124 -> (i64) {
        scf.yield %1884 : i64
      } else {
        scf.yield %2120 : i64
      }
      %2126 = func.call @cc_errorp(%1974) : (i64) -> i64
      %2127 = arith.cmpi ne, %2126, %2120 : i64
      %2128 = arith.cmpi eq, %2125, %2120 : i64
      %2129 = arith.andi %2127, %2128 : i1
      %2130 = scf.if %2129 -> (i64) {
        scf.yield %1974 : i64
      } else {
        scf.yield %2125 : i64
      }
      %2131 = func.call @cc_errorp(%2062) : (i64) -> i64
      %2132 = arith.cmpi ne, %2131, %2120 : i64
      %2133 = arith.cmpi eq, %2130, %2120 : i64
      %2134 = arith.andi %2132, %2133 : i1
      %2135 = scf.if %2134 -> (i64) {
        scf.yield %2062 : i64
      } else {
        scf.yield %2130 : i64
      }
      %2136 = func.call @cc_errorp(%2087) : (i64) -> i64
      %2137 = arith.cmpi ne, %2136, %2120 : i64
      %2138 = arith.cmpi eq, %2135, %2120 : i64
      %2139 = arith.andi %2137, %2138 : i1
      %2140 = scf.if %2139 -> (i64) {
        scf.yield %2087 : i64
      } else {
        scf.yield %2135 : i64
      }
      %2141 = func.call @cc_errorp(%2098) : (i64) -> i64
      %2142 = arith.cmpi ne, %2141, %2120 : i64
      %2143 = arith.cmpi eq, %2140, %2120 : i64
      %2144 = arith.andi %2142, %2143 : i1
      %2145 = scf.if %2144 -> (i64) {
        scf.yield %2098 : i64
      } else {
        scf.yield %2140 : i64
      }
      %2146 = func.call @cc_errorp(%2099) : (i64) -> i64
      %2147 = arith.cmpi ne, %2146, %2120 : i64
      %2148 = arith.cmpi eq, %2145, %2120 : i64
      %2149 = arith.andi %2147, %2148 : i1
      %2150 = scf.if %2149 -> (i64) {
        scf.yield %2099 : i64
      } else {
        scf.yield %2145 : i64
      }
      %2151 = func.call @cc_errorp(%2110) : (i64) -> i64
      %2152 = arith.cmpi ne, %2151, %2120 : i64
      %2153 = arith.cmpi eq, %2150, %2120 : i64
      %2154 = arith.andi %2152, %2153 : i1
      %2155 = scf.if %2154 -> (i64) {
        scf.yield %2110 : i64
      } else {
        scf.yield %2150 : i64
      }
      %2156 = func.call @cc_errorp(%2119) : (i64) -> i64
      %2157 = arith.cmpi ne, %2156, %2120 : i64
      %2158 = arith.cmpi eq, %2155, %2120 : i64
      %2159 = arith.andi %2157, %2158 : i1
      %2160 = scf.if %2159 -> (i64) {
        scf.yield %2119 : i64
      } else {
        scf.yield %2155 : i64
      }
      %2161 = arith.cmpi ne, %2160, %2120 : i64
      scf.if %2161 {
        func.call @stack_push_pointer(%2160) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1884) : (i64) -> ()
        func.call @stack_push_pointer(%1974) : (i64) -> ()
        func.call @stack_push_pointer(%2062) : (i64) -> ()
        func.call @stack_push_pointer(%2087) : (i64) -> ()
        func.call @stack_push_pointer(%2098) : (i64) -> ()
        func.call @stack_push_pointer(%2099) : (i64) -> ()
        func.call @stack_push_pointer(%2110) : (i64) -> ()
        func.call @stack_push_pointer(%2119) : (i64) -> ()
        %2162 = llvm.mlir.addressof @str162 : !llvm.ptr
        %2163 = func.call @cc_make_function_ref_const(%2162) : (!llvm.ptr) -> i64
        %2164 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2163, %2164) : (i64, i64) -> ()
      }
      %2165 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2165 : i64
    }
    %2166 = func.call @cc_nil_value() : () -> i64
    %2167 = func.call @cc_errorp(%1875) : (i64) -> i64
    %2168 = arith.cmpi ne, %2167, %2166 : i64
    %2169 = scf.if %2168 -> (i64) {
      scf.yield %1875 : i64
    } else {
      %2170 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2171 = arith.constant 8 : i64
      %2172 = func.call @cc_make_string(%2170, %2171) : (!llvm.ptr, i64) -> i64
      %2173 = func.call @cc_nil_value() : () -> i64
      %2174 = func.call @cc_intern(%2172, %2173) : (i64, i64) -> i64
      %2175 = func.call @cc_nil_value() : () -> i64
      %2176 = func.call @cc_cons(%2174, %2175) : (i64, i64) -> i64
      %2177 = func.call @cc_values_pack(%2176) : (i64) -> i64
      func.call @stack_push_pointer(%2174) : (i64) -> ()
      %2178 = func.call @stack_pop_pointer() : () -> i64
      %2179 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2180 = arith.constant 13 : i64
      %2181 = func.call @cc_make_string(%2179, %2180) : (!llvm.ptr, i64) -> i64
      %2182 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2183 = arith.constant 11 : i64
      %2184 = func.call @cc_make_string(%2182, %2183) : (!llvm.ptr, i64) -> i64
      %2185 = func.call @cc_intern(%2181, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_nil_value() : () -> i64
      %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
      %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
      func.call @stack_push_pointer(%2185) : (i64) -> ()
      %2189 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2190 = arith.constant 6 : i64
      %2191 = func.call @cc_make_string(%2189, %2190) : (!llvm.ptr, i64) -> i64
      %2192 = func.call @cc_nil_value() : () -> i64
      %2193 = func.call @cc_intern(%2191, %2192) : (i64, i64) -> i64
      %2194 = func.call @cc_nil_value() : () -> i64
      %2195 = func.call @cc_cons(%2193, %2194) : (i64, i64) -> i64
      %2196 = func.call @cc_values_pack(%2195) : (i64) -> i64
      func.call @stack_push_pointer(%2193) : (i64) -> ()
      %2197 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2198 = arith.constant 19 : i64
      %2199 = func.call @cc_make_string(%2197, %2198) : (!llvm.ptr, i64) -> i64
      %2200 = func.call @cc_nil_value() : () -> i64
      %2201 = func.call @cc_intern(%2199, %2200) : (i64, i64) -> i64
      %2202 = func.call @cc_nil_value() : () -> i64
      %2203 = func.call @cc_cons(%2201, %2202) : (i64, i64) -> i64
      %2204 = func.call @cc_values_pack(%2203) : (i64) -> i64
      func.call @stack_push_pointer(%2201) : (i64) -> ()
      %2205 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2206 = arith.constant 6 : i64
      %2207 = func.call @cc_make_string(%2205, %2206) : (!llvm.ptr, i64) -> i64
      %2208 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2209 = arith.constant 11 : i64
      %2210 = func.call @cc_make_string(%2208, %2209) : (!llvm.ptr, i64) -> i64
      %2211 = func.call @cc_intern(%2207, %2210) : (i64, i64) -> i64
      %2212 = func.call @cc_nil_value() : () -> i64
      %2213 = func.call @cc_cons(%2211, %2212) : (i64, i64) -> i64
      %2214 = func.call @cc_values_pack(%2213) : (i64) -> i64
      func.call @stack_push_pointer(%2211) : (i64) -> ()
      %2215 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2215) : (i64) -> ()
      %2216 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2217 = arith.constant 5 : i64
      %2218 = func.call @cc_make_string(%2216, %2217) : (!llvm.ptr, i64) -> i64
      %2219 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2220 = arith.constant 11 : i64
      %2221 = func.call @cc_make_string(%2219, %2220) : (!llvm.ptr, i64) -> i64
      %2222 = func.call @cc_intern(%2218, %2221) : (i64, i64) -> i64
      %2223 = func.call @cc_nil_value() : () -> i64
      %2224 = func.call @cc_cons(%2222, %2223) : (i64, i64) -> i64
      %2225 = func.call @cc_values_pack(%2224) : (i64) -> i64
      func.call @stack_push_pointer(%2222) : (i64) -> ()
      %2226 = func.call @stack_pop_pointer() : () -> i64
      %2227 = func.call @stack_pop_pointer() : () -> i64
      %2228 = func.call @cc_cons(%2226, %2227) : (i64, i64) -> i64
      %2229 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2230 = arith.constant 5 : i64
      %2231 = func.call @cc_make_string(%2229, %2230) : (!llvm.ptr, i64) -> i64
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = func.call @cc_intern(%2231, %2232) : (i64, i64) -> i64
      %2234 = func.call @cc_nil_value() : () -> i64
      %2235 = func.call @cc_cons(%2233, %2234) : (i64, i64) -> i64
      %2236 = func.call @cc_values_pack(%2235) : (i64) -> i64
      %2237 = func.call @cc_cons(%2233, %2228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2238 = func.call @stack_pop_pointer() : () -> i64
      %2239 = func.call @stack_pop_pointer() : () -> i64
      %2240 = func.call @cc_cons(%2239, %2238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2240) : (i64) -> ()
      %2241 = func.call @stack_pop_pointer() : () -> i64
      %2242 = func.call @stack_pop_pointer() : () -> i64
      %2243 = func.call @cc_cons(%2242, %2241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2244 = func.call @stack_pop_pointer() : () -> i64
      %2245 = func.call @stack_pop_pointer() : () -> i64
      %2246 = func.call @cc_cons(%2245, %2244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2246) : (i64) -> ()
      %2247 = func.call @stack_pop_pointer() : () -> i64
      %2248 = func.call @stack_pop_pointer() : () -> i64
      %2249 = func.call @cc_cons(%2248, %2247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2249) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2250 = func.call @stack_pop_pointer() : () -> i64
      %2251 = func.call @stack_pop_pointer() : () -> i64
      %2252 = func.call @cc_cons(%2251, %2250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2252) : (i64) -> ()
      %2253 = func.call @stack_pop_pointer() : () -> i64
      %2254 = func.call @stack_pop_pointer() : () -> i64
      %2255 = func.call @cc_cons(%2254, %2253) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2255) : (i64) -> ()
      %2256 = func.call @stack_pop_pointer() : () -> i64
      %2257 = func.call @stack_pop_pointer() : () -> i64
      %2258 = func.call @cc_cons(%2257, %2256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2258) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2259 = func.call @stack_pop_pointer() : () -> i64
      %2260 = func.call @stack_pop_pointer() : () -> i64
      %2261 = func.call @cc_cons(%2260, %2259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2261) : (i64) -> ()
      %2262 = func.call @stack_pop_pointer() : () -> i64
      %2263 = func.call @stack_pop_pointer() : () -> i64
      %2264 = func.call @cc_cons(%2263, %2262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2264) : (i64) -> ()
      %2265 = func.call @stack_pop_pointer() : () -> i64
      %2321 = arith.constant 116254966808585 : i64
      %2322 = arith.constant 0 : i64
      %2323 = func.call @cc_make_closure(%2321, %2322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2323) : (i64) -> ()
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2326 = arith.constant 4 : i64
      %2327 = func.call @cc_make_string(%2325, %2326) : (!llvm.ptr, i64) -> i64
      %2328 = func.call @cc_nil_value() : () -> i64
      %2329 = func.call @cc_intern(%2327, %2328) : (i64, i64) -> i64
      %2330 = func.call @cc_nil_value() : () -> i64
      %2331 = func.call @cc_cons(%2329, %2330) : (i64, i64) -> i64
      %2332 = func.call @cc_values_pack(%2331) : (i64) -> i64
      func.call @stack_push_pointer(%2329) : (i64) -> ()
      %2333 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2334 = arith.constant 10 : i64
      %2335 = func.call @cc_make_string(%2333, %2334) : (!llvm.ptr, i64) -> i64
      %2336 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2337 = arith.constant 11 : i64
      %2338 = func.call @cc_make_string(%2336, %2337) : (!llvm.ptr, i64) -> i64
      %2339 = func.call @cc_intern(%2335, %2338) : (i64, i64) -> i64
      %2340 = func.call @cc_nil_value() : () -> i64
      %2341 = func.call @cc_cons(%2339, %2340) : (i64, i64) -> i64
      %2342 = func.call @cc_values_pack(%2341) : (i64) -> i64
      func.call @stack_push_pointer(%2339) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2343 = func.call @stack_pop_pointer() : () -> i64
      %2344 = func.call @stack_pop_pointer() : () -> i64
      %2345 = func.call @cc_cons(%2344, %2343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2345) : (i64) -> ()
      %2346 = func.call @stack_pop_pointer() : () -> i64
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = func.call @cc_cons(%2347, %2346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2348) : (i64) -> ()
      %2349 = func.call @stack_pop_pointer() : () -> i64
      %2350 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2351 = arith.constant 11 : i64
      %2352 = func.call @cc_make_string(%2350, %2351) : (!llvm.ptr, i64) -> i64
      %2353 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2354 = arith.constant 7 : i64
      %2355 = func.call @cc_make_string(%2353, %2354) : (!llvm.ptr, i64) -> i64
      %2356 = func.call @cc_intern(%2352, %2355) : (i64, i64) -> i64
      %2357 = func.call @cc_nil_value() : () -> i64
      %2358 = func.call @cc_cons(%2356, %2357) : (i64, i64) -> i64
      %2359 = func.call @cc_values_pack(%2358) : (i64) -> i64
      func.call @stack_push_pointer(%2356) : (i64) -> ()
      %2360 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2361 = func.call @stack_pop_pointer() : () -> i64
      %2362 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2363 = arith.constant 4 : i64
      %2364 = func.call @cc_make_string(%2362, %2363) : (!llvm.ptr, i64) -> i64
      %2365 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2366 = arith.constant 7 : i64
      %2367 = func.call @cc_make_string(%2365, %2366) : (!llvm.ptr, i64) -> i64
      %2368 = func.call @cc_intern(%2364, %2367) : (i64, i64) -> i64
      %2369 = func.call @cc_nil_value() : () -> i64
      %2370 = func.call @cc_cons(%2368, %2369) : (i64, i64) -> i64
      %2371 = func.call @cc_values_pack(%2370) : (i64) -> i64
      func.call @stack_push_pointer(%2368) : (i64) -> ()
      %2372 = func.call @stack_pop_pointer() : () -> i64
      %2373 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2374 = arith.constant 5 : i64
      %2375 = func.call @cc_make_string(%2373, %2374) : (!llvm.ptr, i64) -> i64
      %2376 = func.call @cc_nil_value() : () -> i64
      %2377 = func.call @cc_intern(%2375, %2376) : (i64, i64) -> i64
      %2378 = func.call @cc_nil_value() : () -> i64
      %2379 = func.call @cc_cons(%2377, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_values_pack(%2379) : (i64) -> i64
      func.call @stack_push_pointer(%2377) : (i64) -> ()
      %2381 = func.call @stack_pop_pointer() : () -> i64
      %2382 = func.call @cc_nil_value() : () -> i64
      %2383 = func.call @cc_errorp(%2178) : (i64) -> i64
      %2384 = arith.cmpi ne, %2383, %2382 : i64
      %2385 = arith.cmpi eq, %2382, %2382 : i64
      %2386 = arith.andi %2384, %2385 : i1
      %2387 = scf.if %2386 -> (i64) {
        scf.yield %2178 : i64
      } else {
        scf.yield %2382 : i64
      }
      %2388 = func.call @cc_errorp(%2265) : (i64) -> i64
      %2389 = arith.cmpi ne, %2388, %2382 : i64
      %2390 = arith.cmpi eq, %2387, %2382 : i64
      %2391 = arith.andi %2389, %2390 : i1
      %2392 = scf.if %2391 -> (i64) {
        scf.yield %2265 : i64
      } else {
        scf.yield %2387 : i64
      }
      %2393 = func.call @cc_errorp(%2324) : (i64) -> i64
      %2394 = arith.cmpi ne, %2393, %2382 : i64
      %2395 = arith.cmpi eq, %2392, %2382 : i64
      %2396 = arith.andi %2394, %2395 : i1
      %2397 = scf.if %2396 -> (i64) {
        scf.yield %2324 : i64
      } else {
        scf.yield %2392 : i64
      }
      %2398 = func.call @cc_errorp(%2349) : (i64) -> i64
      %2399 = arith.cmpi ne, %2398, %2382 : i64
      %2400 = arith.cmpi eq, %2397, %2382 : i64
      %2401 = arith.andi %2399, %2400 : i1
      %2402 = scf.if %2401 -> (i64) {
        scf.yield %2349 : i64
      } else {
        scf.yield %2397 : i64
      }
      %2403 = func.call @cc_errorp(%2360) : (i64) -> i64
      %2404 = arith.cmpi ne, %2403, %2382 : i64
      %2405 = arith.cmpi eq, %2402, %2382 : i64
      %2406 = arith.andi %2404, %2405 : i1
      %2407 = scf.if %2406 -> (i64) {
        scf.yield %2360 : i64
      } else {
        scf.yield %2402 : i64
      }
      %2408 = func.call @cc_errorp(%2361) : (i64) -> i64
      %2409 = arith.cmpi ne, %2408, %2382 : i64
      %2410 = arith.cmpi eq, %2407, %2382 : i64
      %2411 = arith.andi %2409, %2410 : i1
      %2412 = scf.if %2411 -> (i64) {
        scf.yield %2361 : i64
      } else {
        scf.yield %2407 : i64
      }
      %2413 = func.call @cc_errorp(%2372) : (i64) -> i64
      %2414 = arith.cmpi ne, %2413, %2382 : i64
      %2415 = arith.cmpi eq, %2412, %2382 : i64
      %2416 = arith.andi %2414, %2415 : i1
      %2417 = scf.if %2416 -> (i64) {
        scf.yield %2372 : i64
      } else {
        scf.yield %2412 : i64
      }
      %2418 = func.call @cc_errorp(%2381) : (i64) -> i64
      %2419 = arith.cmpi ne, %2418, %2382 : i64
      %2420 = arith.cmpi eq, %2417, %2382 : i64
      %2421 = arith.andi %2419, %2420 : i1
      %2422 = scf.if %2421 -> (i64) {
        scf.yield %2381 : i64
      } else {
        scf.yield %2417 : i64
      }
      %2423 = arith.cmpi ne, %2422, %2382 : i64
      scf.if %2423 {
        func.call @stack_push_pointer(%2422) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2178) : (i64) -> ()
        func.call @stack_push_pointer(%2265) : (i64) -> ()
        func.call @stack_push_pointer(%2324) : (i64) -> ()
        func.call @stack_push_pointer(%2349) : (i64) -> ()
        func.call @stack_push_pointer(%2360) : (i64) -> ()
        func.call @stack_push_pointer(%2361) : (i64) -> ()
        func.call @stack_push_pointer(%2372) : (i64) -> ()
        func.call @stack_push_pointer(%2381) : (i64) -> ()
        %2424 = llvm.mlir.addressof @str183 : !llvm.ptr
        %2425 = func.call @cc_make_function_ref_const(%2424) : (!llvm.ptr) -> i64
        %2426 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2425, %2426) : (i64, i64) -> ()
      }
      %2427 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2427 : i64
    }
    %2428 = func.call @cc_nil_value() : () -> i64
    %2429 = func.call @cc_errorp(%2169) : (i64) -> i64
    %2430 = arith.cmpi ne, %2429, %2428 : i64
    %2431 = scf.if %2430 -> (i64) {
      scf.yield %2169 : i64
    } else {
      %2432 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2433 = arith.constant 8 : i64
      %2434 = func.call @cc_make_string(%2432, %2433) : (!llvm.ptr, i64) -> i64
      %2435 = func.call @cc_nil_value() : () -> i64
      %2436 = func.call @cc_intern(%2434, %2435) : (i64, i64) -> i64
      %2437 = func.call @cc_nil_value() : () -> i64
      %2438 = func.call @cc_cons(%2436, %2437) : (i64, i64) -> i64
      %2439 = func.call @cc_values_pack(%2438) : (i64) -> i64
      func.call @stack_push_pointer(%2436) : (i64) -> ()
      %2440 = func.call @stack_pop_pointer() : () -> i64
      %2441 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2442 = arith.constant 3 : i64
      %2443 = func.call @cc_make_string(%2441, %2442) : (!llvm.ptr, i64) -> i64
      %2444 = func.call @cc_nil_value() : () -> i64
      %2445 = func.call @cc_intern(%2443, %2444) : (i64, i64) -> i64
      %2446 = func.call @cc_nil_value() : () -> i64
      %2447 = func.call @cc_cons(%2445, %2446) : (i64, i64) -> i64
      %2448 = func.call @cc_values_pack(%2447) : (i64) -> i64
      func.call @stack_push_pointer(%2445) : (i64) -> ()
      %2449 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2450 = arith.constant 3 : i64
      %2451 = func.call @cc_make_string(%2449, %2450) : (!llvm.ptr, i64) -> i64
      %2452 = func.call @cc_nil_value() : () -> i64
      %2453 = func.call @cc_intern(%2451, %2452) : (i64, i64) -> i64
      %2454 = func.call @cc_nil_value() : () -> i64
      %2455 = func.call @cc_cons(%2453, %2454) : (i64, i64) -> i64
      %2456 = func.call @cc_values_pack(%2455) : (i64) -> i64
      func.call @stack_push_pointer(%2453) : (i64) -> ()
      %2457 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2458 = arith.constant 6 : i64
      %2459 = func.call @cc_make_string(%2457, %2458) : (!llvm.ptr, i64) -> i64
      %2460 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2461 = arith.constant 11 : i64
      %2462 = func.call @cc_make_string(%2460, %2461) : (!llvm.ptr, i64) -> i64
      %2463 = func.call @cc_intern(%2459, %2462) : (i64, i64) -> i64
      %2464 = func.call @cc_nil_value() : () -> i64
      %2465 = func.call @cc_cons(%2463, %2464) : (i64, i64) -> i64
      %2466 = func.call @cc_values_pack(%2465) : (i64) -> i64
      func.call @stack_push_pointer(%2463) : (i64) -> ()
      %2467 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2468 = arith.constant 1 : i64
      %2469 = func.call @cc_make_string(%2467, %2468) : (!llvm.ptr, i64) -> i64
      %2470 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2471 = arith.constant 11 : i64
      %2472 = func.call @cc_make_string(%2470, %2471) : (!llvm.ptr, i64) -> i64
      %2473 = func.call @cc_intern(%2469, %2472) : (i64, i64) -> i64
      %2474 = func.call @cc_nil_value() : () -> i64
      %2475 = func.call @cc_cons(%2473, %2474) : (i64, i64) -> i64
      %2476 = func.call @cc_values_pack(%2475) : (i64) -> i64
      func.call @stack_push_pointer(%2473) : (i64) -> ()
      %2477 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2478 = arith.constant 20 : i64
      %2479 = func.call @cc_make_string(%2477, %2478) : (!llvm.ptr, i64) -> i64
      %2480 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2481 = arith.constant 11 : i64
      %2482 = func.call @cc_make_string(%2480, %2481) : (!llvm.ptr, i64) -> i64
      %2483 = func.call @cc_intern(%2479, %2482) : (i64, i64) -> i64
      %2484 = func.call @cc_nil_value() : () -> i64
      %2485 = func.call @cc_cons(%2483, %2484) : (i64, i64) -> i64
      %2486 = func.call @cc_values_pack(%2485) : (i64) -> i64
      func.call @stack_push_pointer(%2483) : (i64) -> ()
      %2487 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2488 = arith.constant 20 : i64
      %2489 = func.call @cc_make_string(%2487, %2488) : (!llvm.ptr, i64) -> i64
      %2490 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2491 = arith.constant 11 : i64
      %2492 = func.call @cc_make_string(%2490, %2491) : (!llvm.ptr, i64) -> i64
      %2493 = func.call @cc_intern(%2489, %2492) : (i64, i64) -> i64
      %2494 = func.call @cc_nil_value() : () -> i64
      %2495 = func.call @cc_cons(%2493, %2494) : (i64, i64) -> i64
      %2496 = func.call @cc_values_pack(%2495) : (i64) -> i64
      func.call @stack_push_pointer(%2493) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = func.call @stack_pop_pointer() : () -> i64
      %2520 = func.call @cc_cons(%2519, %2518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2520) : (i64) -> ()
      %2521 = func.call @stack_pop_pointer() : () -> i64
      %2522 = func.call @stack_pop_pointer() : () -> i64
      %2523 = func.call @cc_cons(%2522, %2521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2523) : (i64) -> ()
      %2524 = func.call @stack_pop_pointer() : () -> i64
      %2590 = arith.constant 116254966808586 : i64
      %2591 = arith.constant 0 : i64
      %2592 = func.call @cc_make_closure(%2590, %2591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2592) : (i64) -> ()
      %2593 = func.call @stack_pop_pointer() : () -> i64
      %2594 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2595 = arith.constant 1 : i64
      %2596 = func.call @cc_make_string(%2594, %2595) : (!llvm.ptr, i64) -> i64
      %2597 = func.call @cc_nil_value() : () -> i64
      %2598 = func.call @cc_intern(%2596, %2597) : (i64, i64) -> i64
      %2599 = func.call @cc_nil_value() : () -> i64
      %2600 = func.call @cc_cons(%2598, %2599) : (i64, i64) -> i64
      %2601 = func.call @cc_values_pack(%2600) : (i64) -> i64
      func.call @stack_push_pointer(%2598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @cc_cons(%2603, %2602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2604) : (i64) -> ()
      %2605 = func.call @stack_pop_pointer() : () -> i64
      %2606 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2607 = arith.constant 11 : i64
      %2608 = func.call @cc_make_string(%2606, %2607) : (!llvm.ptr, i64) -> i64
      %2609 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2610 = arith.constant 7 : i64
      %2611 = func.call @cc_make_string(%2609, %2610) : (!llvm.ptr, i64) -> i64
      %2612 = func.call @cc_intern(%2608, %2611) : (i64, i64) -> i64
      %2613 = func.call @cc_nil_value() : () -> i64
      %2614 = func.call @cc_cons(%2612, %2613) : (i64, i64) -> i64
      %2615 = func.call @cc_values_pack(%2614) : (i64) -> i64
      func.call @stack_push_pointer(%2612) : (i64) -> ()
      %2616 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2617 = func.call @stack_pop_pointer() : () -> i64
      %2618 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2619 = arith.constant 4 : i64
      %2620 = func.call @cc_make_string(%2618, %2619) : (!llvm.ptr, i64) -> i64
      %2621 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2622 = arith.constant 7 : i64
      %2623 = func.call @cc_make_string(%2621, %2622) : (!llvm.ptr, i64) -> i64
      %2624 = func.call @cc_intern(%2620, %2623) : (i64, i64) -> i64
      %2625 = func.call @cc_nil_value() : () -> i64
      %2626 = func.call @cc_cons(%2624, %2625) : (i64, i64) -> i64
      %2627 = func.call @cc_values_pack(%2626) : (i64) -> i64
      func.call @stack_push_pointer(%2624) : (i64) -> ()
      %2628 = func.call @stack_pop_pointer() : () -> i64
      %2629 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2630 = arith.constant 6 : i64
      %2631 = func.call @cc_make_string(%2629, %2630) : (!llvm.ptr, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_intern(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_nil_value() : () -> i64
      %2635 = func.call @cc_cons(%2633, %2634) : (i64, i64) -> i64
      %2636 = func.call @cc_values_pack(%2635) : (i64) -> i64
      func.call @stack_push_pointer(%2633) : (i64) -> ()
      %2637 = func.call @stack_pop_pointer() : () -> i64
      %2638 = func.call @cc_nil_value() : () -> i64
      %2639 = func.call @cc_errorp(%2440) : (i64) -> i64
      %2640 = arith.cmpi ne, %2639, %2638 : i64
      %2641 = arith.cmpi eq, %2638, %2638 : i64
      %2642 = arith.andi %2640, %2641 : i1
      %2643 = scf.if %2642 -> (i64) {
        scf.yield %2440 : i64
      } else {
        scf.yield %2638 : i64
      }
      %2644 = func.call @cc_errorp(%2524) : (i64) -> i64
      %2645 = arith.cmpi ne, %2644, %2638 : i64
      %2646 = arith.cmpi eq, %2643, %2638 : i64
      %2647 = arith.andi %2645, %2646 : i1
      %2648 = scf.if %2647 -> (i64) {
        scf.yield %2524 : i64
      } else {
        scf.yield %2643 : i64
      }
      %2649 = func.call @cc_errorp(%2593) : (i64) -> i64
      %2650 = arith.cmpi ne, %2649, %2638 : i64
      %2651 = arith.cmpi eq, %2648, %2638 : i64
      %2652 = arith.andi %2650, %2651 : i1
      %2653 = scf.if %2652 -> (i64) {
        scf.yield %2593 : i64
      } else {
        scf.yield %2648 : i64
      }
      %2654 = func.call @cc_errorp(%2605) : (i64) -> i64
      %2655 = arith.cmpi ne, %2654, %2638 : i64
      %2656 = arith.cmpi eq, %2653, %2638 : i64
      %2657 = arith.andi %2655, %2656 : i1
      %2658 = scf.if %2657 -> (i64) {
        scf.yield %2605 : i64
      } else {
        scf.yield %2653 : i64
      }
      %2659 = func.call @cc_errorp(%2616) : (i64) -> i64
      %2660 = arith.cmpi ne, %2659, %2638 : i64
      %2661 = arith.cmpi eq, %2658, %2638 : i64
      %2662 = arith.andi %2660, %2661 : i1
      %2663 = scf.if %2662 -> (i64) {
        scf.yield %2616 : i64
      } else {
        scf.yield %2658 : i64
      }
      %2664 = func.call @cc_errorp(%2617) : (i64) -> i64
      %2665 = arith.cmpi ne, %2664, %2638 : i64
      %2666 = arith.cmpi eq, %2663, %2638 : i64
      %2667 = arith.andi %2665, %2666 : i1
      %2668 = scf.if %2667 -> (i64) {
        scf.yield %2617 : i64
      } else {
        scf.yield %2663 : i64
      }
      %2669 = func.call @cc_errorp(%2628) : (i64) -> i64
      %2670 = arith.cmpi ne, %2669, %2638 : i64
      %2671 = arith.cmpi eq, %2668, %2638 : i64
      %2672 = arith.andi %2670, %2671 : i1
      %2673 = scf.if %2672 -> (i64) {
        scf.yield %2628 : i64
      } else {
        scf.yield %2668 : i64
      }
      %2674 = func.call @cc_errorp(%2637) : (i64) -> i64
      %2675 = arith.cmpi ne, %2674, %2638 : i64
      %2676 = arith.cmpi eq, %2673, %2638 : i64
      %2677 = arith.andi %2675, %2676 : i1
      %2678 = scf.if %2677 -> (i64) {
        scf.yield %2637 : i64
      } else {
        scf.yield %2673 : i64
      }
      %2679 = arith.cmpi ne, %2678, %2638 : i64
      scf.if %2679 {
        func.call @stack_push_pointer(%2678) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2440) : (i64) -> ()
        func.call @stack_push_pointer(%2524) : (i64) -> ()
        func.call @stack_push_pointer(%2593) : (i64) -> ()
        func.call @stack_push_pointer(%2605) : (i64) -> ()
        func.call @stack_push_pointer(%2616) : (i64) -> ()
        func.call @stack_push_pointer(%2617) : (i64) -> ()
        func.call @stack_push_pointer(%2628) : (i64) -> ()
        func.call @stack_push_pointer(%2637) : (i64) -> ()
        %2680 = llvm.mlir.addressof @str205 : !llvm.ptr
        %2681 = func.call @cc_make_function_ref_const(%2680) : (!llvm.ptr) -> i64
        %2682 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2681, %2682) : (i64, i64) -> ()
      }
      %2683 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2683 : i64
    }
    %2684 = func.call @cc_nil_value() : () -> i64
    %2685 = func.call @cc_errorp(%2431) : (i64) -> i64
    %2686 = arith.cmpi ne, %2685, %2684 : i64
    %2687 = scf.if %2686 -> (i64) {
      scf.yield %2431 : i64
    } else {
      %2688 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2689 = arith.constant 8 : i64
      %2690 = func.call @cc_make_string(%2688, %2689) : (!llvm.ptr, i64) -> i64
      %2691 = func.call @cc_nil_value() : () -> i64
      %2692 = func.call @cc_intern(%2690, %2691) : (i64, i64) -> i64
      %2693 = func.call @cc_nil_value() : () -> i64
      %2694 = func.call @cc_cons(%2692, %2693) : (i64, i64) -> i64
      %2695 = func.call @cc_values_pack(%2694) : (i64) -> i64
      func.call @stack_push_pointer(%2692) : (i64) -> ()
      %2696 = func.call @stack_pop_pointer() : () -> i64
      %2697 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2698 = arith.constant 3 : i64
      %2699 = func.call @cc_make_string(%2697, %2698) : (!llvm.ptr, i64) -> i64
      %2700 = func.call @cc_nil_value() : () -> i64
      %2701 = func.call @cc_intern(%2699, %2700) : (i64, i64) -> i64
      %2702 = func.call @cc_nil_value() : () -> i64
      %2703 = func.call @cc_cons(%2701, %2702) : (i64, i64) -> i64
      %2704 = func.call @cc_values_pack(%2703) : (i64) -> i64
      func.call @stack_push_pointer(%2701) : (i64) -> ()
      %2705 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2706 = arith.constant 3 : i64
      %2707 = func.call @cc_make_string(%2705, %2706) : (!llvm.ptr, i64) -> i64
      %2708 = func.call @cc_nil_value() : () -> i64
      %2709 = func.call @cc_intern(%2707, %2708) : (i64, i64) -> i64
      %2710 = func.call @cc_nil_value() : () -> i64
      %2711 = func.call @cc_cons(%2709, %2710) : (i64, i64) -> i64
      %2712 = func.call @cc_values_pack(%2711) : (i64) -> i64
      func.call @stack_push_pointer(%2709) : (i64) -> ()
      %2713 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2714 = arith.constant 3 : i64
      %2715 = func.call @cc_make_string(%2713, %2714) : (!llvm.ptr, i64) -> i64
      %2716 = func.call @cc_nil_value() : () -> i64
      %2717 = func.call @cc_intern(%2715, %2716) : (i64, i64) -> i64
      %2718 = func.call @cc_nil_value() : () -> i64
      %2719 = func.call @cc_cons(%2717, %2718) : (i64, i64) -> i64
      %2720 = func.call @cc_values_pack(%2719) : (i64) -> i64
      func.call @stack_push_pointer(%2717) : (i64) -> ()
      %2721 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2722 = arith.constant 6 : i64
      %2723 = func.call @cc_make_string(%2721, %2722) : (!llvm.ptr, i64) -> i64
      %2724 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2725 = arith.constant 11 : i64
      %2726 = func.call @cc_make_string(%2724, %2725) : (!llvm.ptr, i64) -> i64
      %2727 = func.call @cc_intern(%2723, %2726) : (i64, i64) -> i64
      %2728 = func.call @cc_nil_value() : () -> i64
      %2729 = func.call @cc_cons(%2727, %2728) : (i64, i64) -> i64
      %2730 = func.call @cc_values_pack(%2729) : (i64) -> i64
      func.call @stack_push_pointer(%2727) : (i64) -> ()
      %2731 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2732 = arith.constant 50 : i64
      %2733 = func.call @cc_parse_bignum(%2731, %2732) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2734 = func.call @stack_pop_pointer() : () -> i64
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @cc_cons(%2735, %2734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2736) : (i64) -> ()
      %2737 = func.call @stack_pop_pointer() : () -> i64
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @cc_cons(%2738, %2737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2740 = func.call @stack_pop_pointer() : () -> i64
      %2741 = func.call @stack_pop_pointer() : () -> i64
      %2742 = func.call @cc_cons(%2741, %2740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2742) : (i64) -> ()
      %2743 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2744 = arith.constant 1 : i64
      %2745 = func.call @cc_make_string(%2743, %2744) : (!llvm.ptr, i64) -> i64
      %2746 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2747 = arith.constant 11 : i64
      %2748 = func.call @cc_make_string(%2746, %2747) : (!llvm.ptr, i64) -> i64
      %2749 = func.call @cc_intern(%2745, %2748) : (i64, i64) -> i64
      %2750 = func.call @cc_nil_value() : () -> i64
      %2751 = func.call @cc_cons(%2749, %2750) : (i64, i64) -> i64
      %2752 = func.call @cc_values_pack(%2751) : (i64) -> i64
      func.call @stack_push_pointer(%2749) : (i64) -> ()
      %2753 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2754 = arith.constant 2 : i64
      %2755 = func.call @cc_make_string(%2753, %2754) : (!llvm.ptr, i64) -> i64
      %2756 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2757 = arith.constant 11 : i64
      %2758 = func.call @cc_make_string(%2756, %2757) : (!llvm.ptr, i64) -> i64
      %2759 = func.call @cc_intern(%2755, %2758) : (i64, i64) -> i64
      %2760 = func.call @cc_nil_value() : () -> i64
      %2761 = func.call @cc_cons(%2759, %2760) : (i64, i64) -> i64
      %2762 = func.call @cc_values_pack(%2761) : (i64) -> i64
      func.call @stack_push_pointer(%2759) : (i64) -> ()
      %2763 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2764 = arith.constant 6 : i64
      %2765 = func.call @cc_make_string(%2763, %2764) : (!llvm.ptr, i64) -> i64
      %2766 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2767 = arith.constant 11 : i64
      %2768 = func.call @cc_make_string(%2766, %2767) : (!llvm.ptr, i64) -> i64
      %2769 = func.call @cc_intern(%2765, %2768) : (i64, i64) -> i64
      %2770 = func.call @cc_nil_value() : () -> i64
      %2771 = func.call @cc_cons(%2769, %2770) : (i64, i64) -> i64
      %2772 = func.call @cc_values_pack(%2771) : (i64) -> i64
      func.call @stack_push_pointer(%2769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2773 = func.call @stack_pop_pointer() : () -> i64
      %2774 = func.call @stack_pop_pointer() : () -> i64
      %2775 = func.call @cc_cons(%2774, %2773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2775) : (i64) -> ()
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @stack_pop_pointer() : () -> i64
      %2778 = func.call @cc_cons(%2777, %2776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2778) : (i64) -> ()
      %2779 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2780 = arith.constant 3 : i64
      %2781 = func.call @cc_make_string(%2779, %2780) : (!llvm.ptr, i64) -> i64
      %2782 = func.call @cc_nil_value() : () -> i64
      %2783 = func.call @cc_intern(%2781, %2782) : (i64, i64) -> i64
      %2784 = func.call @cc_nil_value() : () -> i64
      %2785 = func.call @cc_cons(%2783, %2784) : (i64, i64) -> i64
      %2786 = func.call @cc_values_pack(%2785) : (i64) -> i64
      func.call @stack_push_pointer(%2783) : (i64) -> ()
      %2787 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2788 = arith.constant 16 : i64
      %2789 = func.call @cc_make_string(%2787, %2788) : (!llvm.ptr, i64) -> i64
      %2790 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2791 = arith.constant 11 : i64
      %2792 = func.call @cc_make_string(%2790, %2791) : (!llvm.ptr, i64) -> i64
      %2793 = func.call @cc_intern(%2789, %2792) : (i64, i64) -> i64
      %2794 = func.call @cc_nil_value() : () -> i64
      %2795 = func.call @cc_cons(%2793, %2794) : (i64, i64) -> i64
      %2796 = func.call @cc_values_pack(%2795) : (i64) -> i64
      func.call @stack_push_pointer(%2793) : (i64) -> ()
      %2797 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2798 = arith.constant 6 : i64
      %2799 = func.call @cc_make_string(%2797, %2798) : (!llvm.ptr, i64) -> i64
      %2800 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2801 = arith.constant 11 : i64
      %2802 = func.call @cc_make_string(%2800, %2801) : (!llvm.ptr, i64) -> i64
      %2803 = func.call @cc_intern(%2799, %2802) : (i64, i64) -> i64
      %2804 = func.call @cc_nil_value() : () -> i64
      %2805 = func.call @cc_cons(%2803, %2804) : (i64, i64) -> i64
      %2806 = func.call @cc_values_pack(%2805) : (i64) -> i64
      func.call @stack_push_pointer(%2803) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2807 = func.call @stack_pop_pointer() : () -> i64
      %2808 = func.call @stack_pop_pointer() : () -> i64
      %2809 = func.call @cc_cons(%2808, %2807) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2809) : (i64) -> ()
      %2810 = func.call @stack_pop_pointer() : () -> i64
      %2811 = func.call @stack_pop_pointer() : () -> i64
      %2812 = func.call @cc_cons(%2811, %2810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2812) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2813 = func.call @stack_pop_pointer() : () -> i64
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @cc_cons(%2814, %2813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2815) : (i64) -> ()
      %2816 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2817 = arith.constant 6 : i64
      %2818 = func.call @cc_make_string(%2816, %2817) : (!llvm.ptr, i64) -> i64
      %2819 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2820 = arith.constant 11 : i64
      %2821 = func.call @cc_make_string(%2819, %2820) : (!llvm.ptr, i64) -> i64
      %2822 = func.call @cc_intern(%2818, %2821) : (i64, i64) -> i64
      %2823 = func.call @cc_nil_value() : () -> i64
      %2824 = func.call @cc_cons(%2822, %2823) : (i64, i64) -> i64
      %2825 = func.call @cc_values_pack(%2824) : (i64) -> i64
      func.call @stack_push_pointer(%2822) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2826 = func.call @stack_pop_pointer() : () -> i64
      %2827 = func.call @stack_pop_pointer() : () -> i64
      %2828 = func.call @cc_cons(%2827, %2826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2828) : (i64) -> ()
      %2829 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2830 = arith.constant 16 : i64
      %2831 = func.call @cc_make_string(%2829, %2830) : (!llvm.ptr, i64) -> i64
      %2832 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2833 = arith.constant 11 : i64
      %2834 = func.call @cc_make_string(%2832, %2833) : (!llvm.ptr, i64) -> i64
      %2835 = func.call @cc_intern(%2831, %2834) : (i64, i64) -> i64
      %2836 = func.call @cc_nil_value() : () -> i64
      %2837 = func.call @cc_cons(%2835, %2836) : (i64, i64) -> i64
      %2838 = func.call @cc_values_pack(%2837) : (i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2839 = func.call @stack_pop_pointer() : () -> i64
      %2840 = func.call @stack_pop_pointer() : () -> i64
      %2841 = func.call @cc_cons(%2840, %2839) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2841) : (i64) -> ()
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = func.call @stack_pop_pointer() : () -> i64
      %2844 = func.call @cc_cons(%2843, %2842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2844) : (i64) -> ()
      %2845 = func.call @stack_pop_pointer() : () -> i64
      %2846 = func.call @stack_pop_pointer() : () -> i64
      %2847 = func.call @cc_cons(%2846, %2845) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2847) : (i64) -> ()
      %2848 = func.call @stack_pop_pointer() : () -> i64
      %2849 = func.call @stack_pop_pointer() : () -> i64
      %2850 = func.call @cc_cons(%2849, %2848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2850) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2851 = func.call @stack_pop_pointer() : () -> i64
      %2852 = func.call @stack_pop_pointer() : () -> i64
      %2853 = func.call @cc_cons(%2852, %2851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2853) : (i64) -> ()
      %2854 = func.call @stack_pop_pointer() : () -> i64
      %2855 = func.call @stack_pop_pointer() : () -> i64
      %2856 = func.call @cc_cons(%2855, %2854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2856) : (i64) -> ()
      %2857 = func.call @stack_pop_pointer() : () -> i64
      %2858 = func.call @stack_pop_pointer() : () -> i64
      %2859 = func.call @cc_cons(%2858, %2857) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2859) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2860 = func.call @stack_pop_pointer() : () -> i64
      %2861 = func.call @stack_pop_pointer() : () -> i64
      %2862 = func.call @cc_cons(%2861, %2860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2862) : (i64) -> ()
      %2863 = func.call @stack_pop_pointer() : () -> i64
      %2864 = func.call @stack_pop_pointer() : () -> i64
      %2865 = func.call @cc_cons(%2864, %2863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2865) : (i64) -> ()
      %2866 = func.call @stack_pop_pointer() : () -> i64
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @cc_cons(%2867, %2866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2868) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2869 = func.call @stack_pop_pointer() : () -> i64
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_cons(%2870, %2869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2871) : (i64) -> ()
      %2872 = func.call @stack_pop_pointer() : () -> i64
      %2873 = func.call @stack_pop_pointer() : () -> i64
      %2874 = func.call @cc_cons(%2873, %2872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2874) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2875 = func.call @stack_pop_pointer() : () -> i64
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @cc_cons(%2876, %2875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2877) : (i64) -> ()
      %2878 = func.call @stack_pop_pointer() : () -> i64
      %2879 = func.call @stack_pop_pointer() : () -> i64
      %2880 = func.call @cc_cons(%2879, %2878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2880) : (i64) -> ()
      %2881 = func.call @stack_pop_pointer() : () -> i64
      %2990 = arith.constant 116254966808587 : i64
      %2991 = arith.constant 0 : i64
      %2992 = func.call @cc_make_closure(%2990, %2991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2992) : (i64) -> ()
      %2993 = func.call @stack_pop_pointer() : () -> i64
      %2994 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2995 = arith.constant 1 : i64
      %2996 = func.call @cc_make_string(%2994, %2995) : (!llvm.ptr, i64) -> i64
      %2997 = func.call @cc_nil_value() : () -> i64
      %2998 = func.call @cc_intern(%2996, %2997) : (i64, i64) -> i64
      %2999 = func.call @cc_nil_value() : () -> i64
      %3000 = func.call @cc_cons(%2998, %2999) : (i64, i64) -> i64
      %3001 = func.call @cc_values_pack(%3000) : (i64) -> i64
      func.call @stack_push_pointer(%2998) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3002 = func.call @stack_pop_pointer() : () -> i64
      %3003 = func.call @stack_pop_pointer() : () -> i64
      %3004 = func.call @cc_cons(%3003, %3002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3004) : (i64) -> ()
      %3005 = func.call @stack_pop_pointer() : () -> i64
      %3006 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3007 = arith.constant 11 : i64
      %3008 = func.call @cc_make_string(%3006, %3007) : (!llvm.ptr, i64) -> i64
      %3009 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3010 = arith.constant 7 : i64
      %3011 = func.call @cc_make_string(%3009, %3010) : (!llvm.ptr, i64) -> i64
      %3012 = func.call @cc_intern(%3008, %3011) : (i64, i64) -> i64
      %3013 = func.call @cc_nil_value() : () -> i64
      %3014 = func.call @cc_cons(%3012, %3013) : (i64, i64) -> i64
      %3015 = func.call @cc_values_pack(%3014) : (i64) -> i64
      func.call @stack_push_pointer(%3012) : (i64) -> ()
      %3016 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3017 = func.call @stack_pop_pointer() : () -> i64
      %3018 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3019 = arith.constant 4 : i64
      %3020 = func.call @cc_make_string(%3018, %3019) : (!llvm.ptr, i64) -> i64
      %3021 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3022 = arith.constant 7 : i64
      %3023 = func.call @cc_make_string(%3021, %3022) : (!llvm.ptr, i64) -> i64
      %3024 = func.call @cc_intern(%3020, %3023) : (i64, i64) -> i64
      %3025 = func.call @cc_nil_value() : () -> i64
      %3026 = func.call @cc_cons(%3024, %3025) : (i64, i64) -> i64
      %3027 = func.call @cc_values_pack(%3026) : (i64) -> i64
      func.call @stack_push_pointer(%3024) : (i64) -> ()
      %3028 = func.call @stack_pop_pointer() : () -> i64
      %3029 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3030 = arith.constant 6 : i64
      %3031 = func.call @cc_make_string(%3029, %3030) : (!llvm.ptr, i64) -> i64
      %3032 = func.call @cc_nil_value() : () -> i64
      %3033 = func.call @cc_intern(%3031, %3032) : (i64, i64) -> i64
      %3034 = func.call @cc_nil_value() : () -> i64
      %3035 = func.call @cc_cons(%3033, %3034) : (i64, i64) -> i64
      %3036 = func.call @cc_values_pack(%3035) : (i64) -> i64
      func.call @stack_push_pointer(%3033) : (i64) -> ()
      %3037 = func.call @stack_pop_pointer() : () -> i64
      %3038 = func.call @cc_nil_value() : () -> i64
      %3039 = func.call @cc_errorp(%2696) : (i64) -> i64
      %3040 = arith.cmpi ne, %3039, %3038 : i64
      %3041 = arith.cmpi eq, %3038, %3038 : i64
      %3042 = arith.andi %3040, %3041 : i1
      %3043 = scf.if %3042 -> (i64) {
        scf.yield %2696 : i64
      } else {
        scf.yield %3038 : i64
      }
      %3044 = func.call @cc_errorp(%2881) : (i64) -> i64
      %3045 = arith.cmpi ne, %3044, %3038 : i64
      %3046 = arith.cmpi eq, %3043, %3038 : i64
      %3047 = arith.andi %3045, %3046 : i1
      %3048 = scf.if %3047 -> (i64) {
        scf.yield %2881 : i64
      } else {
        scf.yield %3043 : i64
      }
      %3049 = func.call @cc_errorp(%2993) : (i64) -> i64
      %3050 = arith.cmpi ne, %3049, %3038 : i64
      %3051 = arith.cmpi eq, %3048, %3038 : i64
      %3052 = arith.andi %3050, %3051 : i1
      %3053 = scf.if %3052 -> (i64) {
        scf.yield %2993 : i64
      } else {
        scf.yield %3048 : i64
      }
      %3054 = func.call @cc_errorp(%3005) : (i64) -> i64
      %3055 = arith.cmpi ne, %3054, %3038 : i64
      %3056 = arith.cmpi eq, %3053, %3038 : i64
      %3057 = arith.andi %3055, %3056 : i1
      %3058 = scf.if %3057 -> (i64) {
        scf.yield %3005 : i64
      } else {
        scf.yield %3053 : i64
      }
      %3059 = func.call @cc_errorp(%3016) : (i64) -> i64
      %3060 = arith.cmpi ne, %3059, %3038 : i64
      %3061 = arith.cmpi eq, %3058, %3038 : i64
      %3062 = arith.andi %3060, %3061 : i1
      %3063 = scf.if %3062 -> (i64) {
        scf.yield %3016 : i64
      } else {
        scf.yield %3058 : i64
      }
      %3064 = func.call @cc_errorp(%3017) : (i64) -> i64
      %3065 = arith.cmpi ne, %3064, %3038 : i64
      %3066 = arith.cmpi eq, %3063, %3038 : i64
      %3067 = arith.andi %3065, %3066 : i1
      %3068 = scf.if %3067 -> (i64) {
        scf.yield %3017 : i64
      } else {
        scf.yield %3063 : i64
      }
      %3069 = func.call @cc_errorp(%3028) : (i64) -> i64
      %3070 = arith.cmpi ne, %3069, %3038 : i64
      %3071 = arith.cmpi eq, %3068, %3038 : i64
      %3072 = arith.andi %3070, %3071 : i1
      %3073 = scf.if %3072 -> (i64) {
        scf.yield %3028 : i64
      } else {
        scf.yield %3068 : i64
      }
      %3074 = func.call @cc_errorp(%3037) : (i64) -> i64
      %3075 = arith.cmpi ne, %3074, %3038 : i64
      %3076 = arith.cmpi eq, %3073, %3038 : i64
      %3077 = arith.andi %3075, %3076 : i1
      %3078 = scf.if %3077 -> (i64) {
        scf.yield %3037 : i64
      } else {
        scf.yield %3073 : i64
      }
      %3079 = arith.cmpi ne, %3078, %3038 : i64
      scf.if %3079 {
        func.call @stack_push_pointer(%3078) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2696) : (i64) -> ()
        func.call @stack_push_pointer(%2881) : (i64) -> ()
        func.call @stack_push_pointer(%2993) : (i64) -> ()
        func.call @stack_push_pointer(%3005) : (i64) -> ()
        func.call @stack_push_pointer(%3016) : (i64) -> ()
        func.call @stack_push_pointer(%3017) : (i64) -> ()
        func.call @stack_push_pointer(%3028) : (i64) -> ()
        func.call @stack_push_pointer(%3037) : (i64) -> ()
        %3080 = llvm.mlir.addressof @str238 : !llvm.ptr
        %3081 = func.call @cc_make_function_ref_const(%3080) : (!llvm.ptr) -> i64
        %3082 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3081, %3082) : (i64, i64) -> ()
      }
      %3083 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3083 : i64
    }
    %3084 = func.call @cc_nil_value() : () -> i64
    %3085 = func.call @cc_errorp(%2687) : (i64) -> i64
    %3086 = arith.cmpi ne, %3085, %3084 : i64
    %3087 = scf.if %3086 -> (i64) {
      scf.yield %2687 : i64
    } else {
      %3088 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3089 = arith.constant 8 : i64
      %3090 = func.call @cc_make_string(%3088, %3089) : (!llvm.ptr, i64) -> i64
      %3091 = func.call @cc_nil_value() : () -> i64
      %3092 = func.call @cc_intern(%3090, %3091) : (i64, i64) -> i64
      %3093 = func.call @cc_nil_value() : () -> i64
      %3094 = func.call @cc_cons(%3092, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_values_pack(%3094) : (i64) -> i64
      func.call @stack_push_pointer(%3092) : (i64) -> ()
      %3096 = func.call @stack_pop_pointer() : () -> i64
      %3097 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3098 = arith.constant 3 : i64
      %3099 = func.call @cc_make_string(%3097, %3098) : (!llvm.ptr, i64) -> i64
      %3100 = func.call @cc_nil_value() : () -> i64
      %3101 = func.call @cc_intern(%3099, %3100) : (i64, i64) -> i64
      %3102 = func.call @cc_nil_value() : () -> i64
      %3103 = func.call @cc_cons(%3101, %3102) : (i64, i64) -> i64
      %3104 = func.call @cc_values_pack(%3103) : (i64) -> i64
      func.call @stack_push_pointer(%3101) : (i64) -> ()
      %3105 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3106 = arith.constant 3 : i64
      %3107 = func.call @cc_make_string(%3105, %3106) : (!llvm.ptr, i64) -> i64
      %3108 = func.call @cc_nil_value() : () -> i64
      %3109 = func.call @cc_intern(%3107, %3108) : (i64, i64) -> i64
      %3110 = func.call @cc_nil_value() : () -> i64
      %3111 = func.call @cc_cons(%3109, %3110) : (i64, i64) -> i64
      %3112 = func.call @cc_values_pack(%3111) : (i64) -> i64
      func.call @stack_push_pointer(%3109) : (i64) -> ()
      %3113 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3114 = arith.constant 1 : i64
      %3115 = func.call @cc_make_string(%3113, %3114) : (!llvm.ptr, i64) -> i64
      %3116 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3117 = arith.constant 11 : i64
      %3118 = func.call @cc_make_string(%3116, %3117) : (!llvm.ptr, i64) -> i64
      %3119 = func.call @cc_intern(%3115, %3118) : (i64, i64) -> i64
      %3120 = func.call @cc_nil_value() : () -> i64
      %3121 = func.call @cc_cons(%3119, %3120) : (i64, i64) -> i64
      %3122 = func.call @cc_values_pack(%3121) : (i64) -> i64
      func.call @stack_push_pointer(%3119) : (i64) -> ()
      %3123 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3124 = arith.constant 2 : i64
      %3125 = func.call @cc_make_string(%3123, %3124) : (!llvm.ptr, i64) -> i64
      %3126 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3127 = arith.constant 11 : i64
      %3128 = func.call @cc_make_string(%3126, %3127) : (!llvm.ptr, i64) -> i64
      %3129 = func.call @cc_intern(%3125, %3128) : (i64, i64) -> i64
      %3130 = func.call @cc_nil_value() : () -> i64
      %3131 = func.call @cc_cons(%3129, %3130) : (i64, i64) -> i64
      %3132 = func.call @cc_values_pack(%3131) : (i64) -> i64
      func.call @stack_push_pointer(%3129) : (i64) -> ()
      %3133 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3134 = arith.constant 20 : i64
      %3135 = func.call @cc_make_string(%3133, %3134) : (!llvm.ptr, i64) -> i64
      %3136 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3137 = arith.constant 11 : i64
      %3138 = func.call @cc_make_string(%3136, %3137) : (!llvm.ptr, i64) -> i64
      %3139 = func.call @cc_intern(%3135, %3138) : (i64, i64) -> i64
      %3140 = func.call @cc_nil_value() : () -> i64
      %3141 = func.call @cc_cons(%3139, %3140) : (i64, i64) -> i64
      %3142 = func.call @cc_values_pack(%3141) : (i64) -> i64
      func.call @stack_push_pointer(%3139) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3143 = func.call @stack_pop_pointer() : () -> i64
      %3144 = func.call @stack_pop_pointer() : () -> i64
      %3145 = func.call @cc_cons(%3144, %3143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3145) : (i64) -> ()
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @stack_pop_pointer() : () -> i64
      %3148 = func.call @cc_cons(%3147, %3146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3148) : (i64) -> ()
      %3149 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3150 = arith.constant 3 : i64
      %3151 = func.call @cc_make_string(%3149, %3150) : (!llvm.ptr, i64) -> i64
      %3152 = func.call @cc_nil_value() : () -> i64
      %3153 = func.call @cc_intern(%3151, %3152) : (i64, i64) -> i64
      %3154 = func.call @cc_nil_value() : () -> i64
      %3155 = func.call @cc_cons(%3153, %3154) : (i64, i64) -> i64
      %3156 = func.call @cc_values_pack(%3155) : (i64) -> i64
      func.call @stack_push_pointer(%3153) : (i64) -> ()
      %3157 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3158 = arith.constant 16 : i64
      %3159 = func.call @cc_make_string(%3157, %3158) : (!llvm.ptr, i64) -> i64
      %3160 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3161 = arith.constant 11 : i64
      %3162 = func.call @cc_make_string(%3160, %3161) : (!llvm.ptr, i64) -> i64
      %3163 = func.call @cc_intern(%3159, %3162) : (i64, i64) -> i64
      %3164 = func.call @cc_nil_value() : () -> i64
      %3165 = func.call @cc_cons(%3163, %3164) : (i64, i64) -> i64
      %3166 = func.call @cc_values_pack(%3165) : (i64) -> i64
      func.call @stack_push_pointer(%3163) : (i64) -> ()
      %3167 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3168 = arith.constant 20 : i64
      %3169 = func.call @cc_make_string(%3167, %3168) : (!llvm.ptr, i64) -> i64
      %3170 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3171 = arith.constant 11 : i64
      %3172 = func.call @cc_make_string(%3170, %3171) : (!llvm.ptr, i64) -> i64
      %3173 = func.call @cc_intern(%3169, %3172) : (i64, i64) -> i64
      %3174 = func.call @cc_nil_value() : () -> i64
      %3175 = func.call @cc_cons(%3173, %3174) : (i64, i64) -> i64
      %3176 = func.call @cc_values_pack(%3175) : (i64) -> i64
      func.call @stack_push_pointer(%3173) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3177 = func.call @stack_pop_pointer() : () -> i64
      %3178 = func.call @stack_pop_pointer() : () -> i64
      %3179 = func.call @cc_cons(%3178, %3177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3179) : (i64) -> ()
      %3180 = func.call @stack_pop_pointer() : () -> i64
      %3181 = func.call @stack_pop_pointer() : () -> i64
      %3182 = func.call @cc_cons(%3181, %3180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3182) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3183 = func.call @stack_pop_pointer() : () -> i64
      %3184 = func.call @stack_pop_pointer() : () -> i64
      %3185 = func.call @cc_cons(%3184, %3183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3185) : (i64) -> ()
      %3186 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3187 = arith.constant 6 : i64
      %3188 = func.call @cc_make_string(%3186, %3187) : (!llvm.ptr, i64) -> i64
      %3189 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3190 = arith.constant 11 : i64
      %3191 = func.call @cc_make_string(%3189, %3190) : (!llvm.ptr, i64) -> i64
      %3192 = func.call @cc_intern(%3188, %3191) : (i64, i64) -> i64
      %3193 = func.call @cc_nil_value() : () -> i64
      %3194 = func.call @cc_cons(%3192, %3193) : (i64, i64) -> i64
      %3195 = func.call @cc_values_pack(%3194) : (i64) -> i64
      func.call @stack_push_pointer(%3192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @stack_pop_pointer() : () -> i64
      %3198 = func.call @cc_cons(%3197, %3196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3198) : (i64) -> ()
      %3199 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3200 = arith.constant 16 : i64
      %3201 = func.call @cc_make_string(%3199, %3200) : (!llvm.ptr, i64) -> i64
      %3202 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3203 = arith.constant 11 : i64
      %3204 = func.call @cc_make_string(%3202, %3203) : (!llvm.ptr, i64) -> i64
      %3205 = func.call @cc_intern(%3201, %3204) : (i64, i64) -> i64
      %3206 = func.call @cc_nil_value() : () -> i64
      %3207 = func.call @cc_cons(%3205, %3206) : (i64, i64) -> i64
      %3208 = func.call @cc_values_pack(%3207) : (i64) -> i64
      func.call @stack_push_pointer(%3205) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3209 = func.call @stack_pop_pointer() : () -> i64
      %3210 = func.call @stack_pop_pointer() : () -> i64
      %3211 = func.call @cc_cons(%3210, %3209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3211) : (i64) -> ()
      %3212 = func.call @stack_pop_pointer() : () -> i64
      %3213 = func.call @stack_pop_pointer() : () -> i64
      %3214 = func.call @cc_cons(%3213, %3212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3214) : (i64) -> ()
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @cc_cons(%3216, %3215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3217) : (i64) -> ()
      %3218 = func.call @stack_pop_pointer() : () -> i64
      %3219 = func.call @stack_pop_pointer() : () -> i64
      %3220 = func.call @cc_cons(%3219, %3218) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3221 = func.call @stack_pop_pointer() : () -> i64
      %3222 = func.call @stack_pop_pointer() : () -> i64
      %3223 = func.call @cc_cons(%3222, %3221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3223) : (i64) -> ()
      %3224 = func.call @stack_pop_pointer() : () -> i64
      %3225 = func.call @stack_pop_pointer() : () -> i64
      %3226 = func.call @cc_cons(%3225, %3224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3226) : (i64) -> ()
      %3227 = func.call @stack_pop_pointer() : () -> i64
      %3228 = func.call @stack_pop_pointer() : () -> i64
      %3229 = func.call @cc_cons(%3228, %3227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3230 = func.call @stack_pop_pointer() : () -> i64
      %3231 = func.call @stack_pop_pointer() : () -> i64
      %3232 = func.call @cc_cons(%3231, %3230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3232) : (i64) -> ()
      %3233 = func.call @stack_pop_pointer() : () -> i64
      %3234 = func.call @stack_pop_pointer() : () -> i64
      %3235 = func.call @cc_cons(%3234, %3233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3235) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3236 = func.call @stack_pop_pointer() : () -> i64
      %3237 = func.call @stack_pop_pointer() : () -> i64
      %3238 = func.call @cc_cons(%3237, %3236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3238) : (i64) -> ()
      %3239 = func.call @stack_pop_pointer() : () -> i64
      %3240 = func.call @stack_pop_pointer() : () -> i64
      %3241 = func.call @cc_cons(%3240, %3239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3241) : (i64) -> ()
      %3242 = func.call @stack_pop_pointer() : () -> i64
      %3363 = arith.constant 116254966808588 : i64
      %3364 = arith.constant 0 : i64
      %3365 = func.call @cc_make_closure(%3363, %3364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3365) : (i64) -> ()
      %3366 = func.call @stack_pop_pointer() : () -> i64
      %3367 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3368 = arith.constant 1 : i64
      %3369 = func.call @cc_make_string(%3367, %3368) : (!llvm.ptr, i64) -> i64
      %3370 = func.call @cc_nil_value() : () -> i64
      %3371 = func.call @cc_intern(%3369, %3370) : (i64, i64) -> i64
      %3372 = func.call @cc_nil_value() : () -> i64
      %3373 = func.call @cc_cons(%3371, %3372) : (i64, i64) -> i64
      %3374 = func.call @cc_values_pack(%3373) : (i64) -> i64
      func.call @stack_push_pointer(%3371) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3375 = func.call @stack_pop_pointer() : () -> i64
      %3376 = func.call @stack_pop_pointer() : () -> i64
      %3377 = func.call @cc_cons(%3376, %3375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3377) : (i64) -> ()
      %3378 = func.call @stack_pop_pointer() : () -> i64
      %3379 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3380 = arith.constant 11 : i64
      %3381 = func.call @cc_make_string(%3379, %3380) : (!llvm.ptr, i64) -> i64
      %3382 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3383 = arith.constant 7 : i64
      %3384 = func.call @cc_make_string(%3382, %3383) : (!llvm.ptr, i64) -> i64
      %3385 = func.call @cc_intern(%3381, %3384) : (i64, i64) -> i64
      %3386 = func.call @cc_nil_value() : () -> i64
      %3387 = func.call @cc_cons(%3385, %3386) : (i64, i64) -> i64
      %3388 = func.call @cc_values_pack(%3387) : (i64) -> i64
      func.call @stack_push_pointer(%3385) : (i64) -> ()
      %3389 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3390 = func.call @stack_pop_pointer() : () -> i64
      %3391 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3392 = arith.constant 4 : i64
      %3393 = func.call @cc_make_string(%3391, %3392) : (!llvm.ptr, i64) -> i64
      %3394 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3395 = arith.constant 7 : i64
      %3396 = func.call @cc_make_string(%3394, %3395) : (!llvm.ptr, i64) -> i64
      %3397 = func.call @cc_intern(%3393, %3396) : (i64, i64) -> i64
      %3398 = func.call @cc_nil_value() : () -> i64
      %3399 = func.call @cc_cons(%3397, %3398) : (i64, i64) -> i64
      %3400 = func.call @cc_values_pack(%3399) : (i64) -> i64
      func.call @stack_push_pointer(%3397) : (i64) -> ()
      %3401 = func.call @stack_pop_pointer() : () -> i64
      %3402 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3403 = arith.constant 6 : i64
      %3404 = func.call @cc_make_string(%3402, %3403) : (!llvm.ptr, i64) -> i64
      %3405 = func.call @cc_nil_value() : () -> i64
      %3406 = func.call @cc_intern(%3404, %3405) : (i64, i64) -> i64
      %3407 = func.call @cc_nil_value() : () -> i64
      %3408 = func.call @cc_cons(%3406, %3407) : (i64, i64) -> i64
      %3409 = func.call @cc_values_pack(%3408) : (i64) -> i64
      func.call @stack_push_pointer(%3406) : (i64) -> ()
      %3410 = func.call @stack_pop_pointer() : () -> i64
      %3411 = func.call @cc_nil_value() : () -> i64
      %3412 = func.call @cc_errorp(%3096) : (i64) -> i64
      %3413 = arith.cmpi ne, %3412, %3411 : i64
      %3414 = arith.cmpi eq, %3411, %3411 : i64
      %3415 = arith.andi %3413, %3414 : i1
      %3416 = scf.if %3415 -> (i64) {
        scf.yield %3096 : i64
      } else {
        scf.yield %3411 : i64
      }
      %3417 = func.call @cc_errorp(%3242) : (i64) -> i64
      %3418 = arith.cmpi ne, %3417, %3411 : i64
      %3419 = arith.cmpi eq, %3416, %3411 : i64
      %3420 = arith.andi %3418, %3419 : i1
      %3421 = scf.if %3420 -> (i64) {
        scf.yield %3242 : i64
      } else {
        scf.yield %3416 : i64
      }
      %3422 = func.call @cc_errorp(%3366) : (i64) -> i64
      %3423 = arith.cmpi ne, %3422, %3411 : i64
      %3424 = arith.cmpi eq, %3421, %3411 : i64
      %3425 = arith.andi %3423, %3424 : i1
      %3426 = scf.if %3425 -> (i64) {
        scf.yield %3366 : i64
      } else {
        scf.yield %3421 : i64
      }
      %3427 = func.call @cc_errorp(%3378) : (i64) -> i64
      %3428 = arith.cmpi ne, %3427, %3411 : i64
      %3429 = arith.cmpi eq, %3426, %3411 : i64
      %3430 = arith.andi %3428, %3429 : i1
      %3431 = scf.if %3430 -> (i64) {
        scf.yield %3378 : i64
      } else {
        scf.yield %3426 : i64
      }
      %3432 = func.call @cc_errorp(%3389) : (i64) -> i64
      %3433 = arith.cmpi ne, %3432, %3411 : i64
      %3434 = arith.cmpi eq, %3431, %3411 : i64
      %3435 = arith.andi %3433, %3434 : i1
      %3436 = scf.if %3435 -> (i64) {
        scf.yield %3389 : i64
      } else {
        scf.yield %3431 : i64
      }
      %3437 = func.call @cc_errorp(%3390) : (i64) -> i64
      %3438 = arith.cmpi ne, %3437, %3411 : i64
      %3439 = arith.cmpi eq, %3436, %3411 : i64
      %3440 = arith.andi %3438, %3439 : i1
      %3441 = scf.if %3440 -> (i64) {
        scf.yield %3390 : i64
      } else {
        scf.yield %3436 : i64
      }
      %3442 = func.call @cc_errorp(%3401) : (i64) -> i64
      %3443 = arith.cmpi ne, %3442, %3411 : i64
      %3444 = arith.cmpi eq, %3441, %3411 : i64
      %3445 = arith.andi %3443, %3444 : i1
      %3446 = scf.if %3445 -> (i64) {
        scf.yield %3401 : i64
      } else {
        scf.yield %3441 : i64
      }
      %3447 = func.call @cc_errorp(%3410) : (i64) -> i64
      %3448 = arith.cmpi ne, %3447, %3411 : i64
      %3449 = arith.cmpi eq, %3446, %3411 : i64
      %3450 = arith.andi %3448, %3449 : i1
      %3451 = scf.if %3450 -> (i64) {
        scf.yield %3410 : i64
      } else {
        scf.yield %3446 : i64
      }
      %3452 = arith.cmpi ne, %3451, %3411 : i64
      scf.if %3452 {
        func.call @stack_push_pointer(%3451) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3096) : (i64) -> ()
        func.call @stack_push_pointer(%3242) : (i64) -> ()
        func.call @stack_push_pointer(%3366) : (i64) -> ()
        func.call @stack_push_pointer(%3378) : (i64) -> ()
        func.call @stack_push_pointer(%3389) : (i64) -> ()
        func.call @stack_push_pointer(%3390) : (i64) -> ()
        func.call @stack_push_pointer(%3401) : (i64) -> ()
        func.call @stack_push_pointer(%3410) : (i64) -> ()
        %3453 = llvm.mlir.addressof @str270 : !llvm.ptr
        %3454 = func.call @cc_make_function_ref_const(%3453) : (!llvm.ptr) -> i64
        %3455 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3454, %3455) : (i64, i64) -> ()
      }
      %3456 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3456 : i64
    }
    %3457 = func.call @cc_nil_value() : () -> i64
    %3458 = func.call @cc_errorp(%3087) : (i64) -> i64
    %3459 = arith.cmpi ne, %3458, %3457 : i64
    %3460 = scf.if %3459 -> (i64) {
      scf.yield %3087 : i64
    } else {
      %3461 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3462 = arith.constant 8 : i64
      %3463 = func.call @cc_make_string(%3461, %3462) : (!llvm.ptr, i64) -> i64
      %3464 = func.call @cc_nil_value() : () -> i64
      %3465 = func.call @cc_intern(%3463, %3464) : (i64, i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = func.call @cc_cons(%3465, %3466) : (i64, i64) -> i64
      %3468 = func.call @cc_values_pack(%3467) : (i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3469 = func.call @stack_pop_pointer() : () -> i64
      %3470 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3471 = arith.constant 13 : i64
      %3472 = func.call @cc_make_string(%3470, %3471) : (!llvm.ptr, i64) -> i64
      %3473 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3474 = arith.constant 11 : i64
      %3475 = func.call @cc_make_string(%3473, %3474) : (!llvm.ptr, i64) -> i64
      %3476 = func.call @cc_intern(%3472, %3475) : (i64, i64) -> i64
      %3477 = func.call @cc_nil_value() : () -> i64
      %3478 = func.call @cc_cons(%3476, %3477) : (i64, i64) -> i64
      %3479 = func.call @cc_values_pack(%3478) : (i64) -> i64
      func.call @stack_push_pointer(%3476) : (i64) -> ()
      %3480 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3481 = arith.constant 6 : i64
      %3482 = func.call @cc_make_string(%3480, %3481) : (!llvm.ptr, i64) -> i64
      %3483 = func.call @cc_nil_value() : () -> i64
      %3484 = func.call @cc_intern(%3482, %3483) : (i64, i64) -> i64
      %3485 = func.call @cc_nil_value() : () -> i64
      %3486 = func.call @cc_cons(%3484, %3485) : (i64, i64) -> i64
      %3487 = func.call @cc_values_pack(%3486) : (i64) -> i64
      func.call @stack_push_pointer(%3484) : (i64) -> ()
      %3488 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3489 = arith.constant 19 : i64
      %3490 = func.call @cc_make_string(%3488, %3489) : (!llvm.ptr, i64) -> i64
      %3491 = func.call @cc_nil_value() : () -> i64
      %3492 = func.call @cc_intern(%3490, %3491) : (i64, i64) -> i64
      %3493 = func.call @cc_nil_value() : () -> i64
      %3494 = func.call @cc_cons(%3492, %3493) : (i64, i64) -> i64
      %3495 = func.call @cc_values_pack(%3494) : (i64) -> i64
      func.call @stack_push_pointer(%3492) : (i64) -> ()
      %3496 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3497 = arith.constant 3 : i64
      %3498 = func.call @cc_make_string(%3496, %3497) : (!llvm.ptr, i64) -> i64
      %3499 = func.call @cc_nil_value() : () -> i64
      %3500 = func.call @cc_intern(%3498, %3499) : (i64, i64) -> i64
      %3501 = func.call @cc_nil_value() : () -> i64
      %3502 = func.call @cc_cons(%3500, %3501) : (i64, i64) -> i64
      %3503 = func.call @cc_values_pack(%3502) : (i64) -> i64
      func.call @stack_push_pointer(%3500) : (i64) -> ()
      %3504 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3505 = arith.constant 16 : i64
      %3506 = func.call @cc_make_string(%3504, %3505) : (!llvm.ptr, i64) -> i64
      %3507 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3508 = arith.constant 11 : i64
      %3509 = func.call @cc_make_string(%3507, %3508) : (!llvm.ptr, i64) -> i64
      %3510 = func.call @cc_intern(%3506, %3509) : (i64, i64) -> i64
      %3511 = func.call @cc_nil_value() : () -> i64
      %3512 = func.call @cc_cons(%3510, %3511) : (i64, i64) -> i64
      %3513 = func.call @cc_values_pack(%3512) : (i64) -> i64
      func.call @stack_push_pointer(%3510) : (i64) -> ()
      %3514 = arith.constant -1 : i64
      func.call @stack_push_fixnum(%3514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3515 = func.call @stack_pop_pointer() : () -> i64
      %3516 = func.call @stack_pop_pointer() : () -> i64
      %3517 = func.call @cc_cons(%3516, %3515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3517) : (i64) -> ()
      %3518 = func.call @stack_pop_pointer() : () -> i64
      %3519 = func.call @stack_pop_pointer() : () -> i64
      %3520 = func.call @cc_cons(%3519, %3518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3520) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3521 = func.call @stack_pop_pointer() : () -> i64
      %3522 = func.call @stack_pop_pointer() : () -> i64
      %3523 = func.call @cc_cons(%3522, %3521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3523) : (i64) -> ()
      %3524 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3525 = arith.constant 6 : i64
      %3526 = func.call @cc_make_string(%3524, %3525) : (!llvm.ptr, i64) -> i64
      %3527 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3528 = arith.constant 11 : i64
      %3529 = func.call @cc_make_string(%3527, %3528) : (!llvm.ptr, i64) -> i64
      %3530 = func.call @cc_intern(%3526, %3529) : (i64, i64) -> i64
      %3531 = func.call @cc_nil_value() : () -> i64
      %3532 = func.call @cc_cons(%3530, %3531) : (i64, i64) -> i64
      %3533 = func.call @cc_values_pack(%3532) : (i64) -> i64
      func.call @stack_push_pointer(%3530) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3534 = func.call @stack_pop_pointer() : () -> i64
      %3535 = func.call @stack_pop_pointer() : () -> i64
      %3536 = func.call @cc_cons(%3535, %3534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3536) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %3627 = arith.constant 116254966808589 : i64
      %3628 = arith.constant 0 : i64
      %3629 = func.call @cc_make_closure(%3627, %3628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3629) : (i64) -> ()
      %3630 = func.call @stack_pop_pointer() : () -> i64
      %3631 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3632 = arith.constant 4 : i64
      %3633 = func.call @cc_make_string(%3631, %3632) : (!llvm.ptr, i64) -> i64
      %3634 = func.call @cc_nil_value() : () -> i64
      %3635 = func.call @cc_intern(%3633, %3634) : (i64, i64) -> i64
      %3636 = func.call @cc_nil_value() : () -> i64
      %3637 = func.call @cc_cons(%3635, %3636) : (i64, i64) -> i64
      %3638 = func.call @cc_values_pack(%3637) : (i64) -> i64
      func.call @stack_push_pointer(%3635) : (i64) -> ()
      %3639 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3640 = arith.constant 10 : i64
      %3641 = func.call @cc_make_string(%3639, %3640) : (!llvm.ptr, i64) -> i64
      %3642 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3643 = arith.constant 11 : i64
      %3644 = func.call @cc_make_string(%3642, %3643) : (!llvm.ptr, i64) -> i64
      %3645 = func.call @cc_intern(%3641, %3644) : (i64, i64) -> i64
      %3646 = func.call @cc_nil_value() : () -> i64
      %3647 = func.call @cc_cons(%3645, %3646) : (i64, i64) -> i64
      %3648 = func.call @cc_values_pack(%3647) : (i64) -> i64
      func.call @stack_push_pointer(%3645) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3649 = func.call @stack_pop_pointer() : () -> i64
      %3650 = func.call @stack_pop_pointer() : () -> i64
      %3651 = func.call @cc_cons(%3650, %3649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3651) : (i64) -> ()
      %3652 = func.call @stack_pop_pointer() : () -> i64
      %3653 = func.call @stack_pop_pointer() : () -> i64
      %3654 = func.call @cc_cons(%3653, %3652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3654) : (i64) -> ()
      %3655 = func.call @stack_pop_pointer() : () -> i64
      %3656 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3657 = arith.constant 11 : i64
      %3658 = func.call @cc_make_string(%3656, %3657) : (!llvm.ptr, i64) -> i64
      %3659 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3660 = arith.constant 7 : i64
      %3661 = func.call @cc_make_string(%3659, %3660) : (!llvm.ptr, i64) -> i64
      %3662 = func.call @cc_intern(%3658, %3661) : (i64, i64) -> i64
      %3663 = func.call @cc_nil_value() : () -> i64
      %3664 = func.call @cc_cons(%3662, %3663) : (i64, i64) -> i64
      %3665 = func.call @cc_values_pack(%3664) : (i64) -> i64
      func.call @stack_push_pointer(%3662) : (i64) -> ()
      %3666 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3667 = func.call @stack_pop_pointer() : () -> i64
      %3668 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3669 = arith.constant 4 : i64
      %3670 = func.call @cc_make_string(%3668, %3669) : (!llvm.ptr, i64) -> i64
      %3671 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3672 = arith.constant 7 : i64
      %3673 = func.call @cc_make_string(%3671, %3672) : (!llvm.ptr, i64) -> i64
      %3674 = func.call @cc_intern(%3670, %3673) : (i64, i64) -> i64
      %3675 = func.call @cc_nil_value() : () -> i64
      %3676 = func.call @cc_cons(%3674, %3675) : (i64, i64) -> i64
      %3677 = func.call @cc_values_pack(%3676) : (i64) -> i64
      func.call @stack_push_pointer(%3674) : (i64) -> ()
      %3678 = func.call @stack_pop_pointer() : () -> i64
      %3679 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3680 = arith.constant 5 : i64
      %3681 = func.call @cc_make_string(%3679, %3680) : (!llvm.ptr, i64) -> i64
      %3682 = func.call @cc_nil_value() : () -> i64
      %3683 = func.call @cc_intern(%3681, %3682) : (i64, i64) -> i64
      %3684 = func.call @cc_nil_value() : () -> i64
      %3685 = func.call @cc_cons(%3683, %3684) : (i64, i64) -> i64
      %3686 = func.call @cc_values_pack(%3685) : (i64) -> i64
      func.call @stack_push_pointer(%3683) : (i64) -> ()
      %3687 = func.call @stack_pop_pointer() : () -> i64
      %3688 = func.call @cc_nil_value() : () -> i64
      %3689 = func.call @cc_errorp(%3469) : (i64) -> i64
      %3690 = arith.cmpi ne, %3689, %3688 : i64
      %3691 = arith.cmpi eq, %3688, %3688 : i64
      %3692 = arith.andi %3690, %3691 : i1
      %3693 = scf.if %3692 -> (i64) {
        scf.yield %3469 : i64
      } else {
        scf.yield %3688 : i64
      }
      %3694 = func.call @cc_errorp(%3567) : (i64) -> i64
      %3695 = arith.cmpi ne, %3694, %3688 : i64
      %3696 = arith.cmpi eq, %3693, %3688 : i64
      %3697 = arith.andi %3695, %3696 : i1
      %3698 = scf.if %3697 -> (i64) {
        scf.yield %3567 : i64
      } else {
        scf.yield %3693 : i64
      }
      %3699 = func.call @cc_errorp(%3630) : (i64) -> i64
      %3700 = arith.cmpi ne, %3699, %3688 : i64
      %3701 = arith.cmpi eq, %3698, %3688 : i64
      %3702 = arith.andi %3700, %3701 : i1
      %3703 = scf.if %3702 -> (i64) {
        scf.yield %3630 : i64
      } else {
        scf.yield %3698 : i64
      }
      %3704 = func.call @cc_errorp(%3655) : (i64) -> i64
      %3705 = arith.cmpi ne, %3704, %3688 : i64
      %3706 = arith.cmpi eq, %3703, %3688 : i64
      %3707 = arith.andi %3705, %3706 : i1
      %3708 = scf.if %3707 -> (i64) {
        scf.yield %3655 : i64
      } else {
        scf.yield %3703 : i64
      }
      %3709 = func.call @cc_errorp(%3666) : (i64) -> i64
      %3710 = arith.cmpi ne, %3709, %3688 : i64
      %3711 = arith.cmpi eq, %3708, %3688 : i64
      %3712 = arith.andi %3710, %3711 : i1
      %3713 = scf.if %3712 -> (i64) {
        scf.yield %3666 : i64
      } else {
        scf.yield %3708 : i64
      }
      %3714 = func.call @cc_errorp(%3667) : (i64) -> i64
      %3715 = arith.cmpi ne, %3714, %3688 : i64
      %3716 = arith.cmpi eq, %3713, %3688 : i64
      %3717 = arith.andi %3715, %3716 : i1
      %3718 = scf.if %3717 -> (i64) {
        scf.yield %3667 : i64
      } else {
        scf.yield %3713 : i64
      }
      %3719 = func.call @cc_errorp(%3678) : (i64) -> i64
      %3720 = arith.cmpi ne, %3719, %3688 : i64
      %3721 = arith.cmpi eq, %3718, %3688 : i64
      %3722 = arith.andi %3720, %3721 : i1
      %3723 = scf.if %3722 -> (i64) {
        scf.yield %3678 : i64
      } else {
        scf.yield %3718 : i64
      }
      %3724 = func.call @cc_errorp(%3687) : (i64) -> i64
      %3725 = arith.cmpi ne, %3724, %3688 : i64
      %3726 = arith.cmpi eq, %3723, %3688 : i64
      %3727 = arith.andi %3725, %3726 : i1
      %3728 = scf.if %3727 -> (i64) {
        scf.yield %3687 : i64
      } else {
        scf.yield %3723 : i64
      }
      %3729 = arith.cmpi ne, %3728, %3688 : i64
      scf.if %3729 {
        func.call @stack_push_pointer(%3728) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3469) : (i64) -> ()
        func.call @stack_push_pointer(%3567) : (i64) -> ()
        func.call @stack_push_pointer(%3630) : (i64) -> ()
        func.call @stack_push_pointer(%3655) : (i64) -> ()
        func.call @stack_push_pointer(%3666) : (i64) -> ()
        func.call @stack_push_pointer(%3667) : (i64) -> ()
        func.call @stack_push_pointer(%3678) : (i64) -> ()
        func.call @stack_push_pointer(%3687) : (i64) -> ()
        %3730 = llvm.mlir.addressof @str290 : !llvm.ptr
        %3731 = func.call @cc_make_function_ref_const(%3730) : (!llvm.ptr) -> i64
        %3732 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3731, %3732) : (i64, i64) -> ()
      }
      %3733 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3733 : i64
    }
    %3734 = func.call @cc_nil_value() : () -> i64
    %3735 = func.call @cc_errorp(%3460) : (i64) -> i64
    %3736 = arith.cmpi ne, %3735, %3734 : i64
    %3737 = scf.if %3736 -> (i64) {
      scf.yield %3460 : i64
    } else {
      %3738 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3739 = arith.constant 8 : i64
      %3740 = func.call @cc_make_string(%3738, %3739) : (!llvm.ptr, i64) -> i64
      %3741 = func.call @cc_nil_value() : () -> i64
      %3742 = func.call @cc_intern(%3740, %3741) : (i64, i64) -> i64
      %3743 = func.call @cc_nil_value() : () -> i64
      %3744 = func.call @cc_cons(%3742, %3743) : (i64, i64) -> i64
      %3745 = func.call @cc_values_pack(%3744) : (i64) -> i64
      func.call @stack_push_pointer(%3742) : (i64) -> ()
      %3746 = func.call @stack_pop_pointer() : () -> i64
      %3747 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3748 = arith.constant 13 : i64
      %3749 = func.call @cc_make_string(%3747, %3748) : (!llvm.ptr, i64) -> i64
      %3750 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3751 = arith.constant 11 : i64
      %3752 = func.call @cc_make_string(%3750, %3751) : (!llvm.ptr, i64) -> i64
      %3753 = func.call @cc_intern(%3749, %3752) : (i64, i64) -> i64
      %3754 = func.call @cc_nil_value() : () -> i64
      %3755 = func.call @cc_cons(%3753, %3754) : (i64, i64) -> i64
      %3756 = func.call @cc_values_pack(%3755) : (i64) -> i64
      func.call @stack_push_pointer(%3753) : (i64) -> ()
      %3757 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3758 = arith.constant 6 : i64
      %3759 = func.call @cc_make_string(%3757, %3758) : (!llvm.ptr, i64) -> i64
      %3760 = func.call @cc_nil_value() : () -> i64
      %3761 = func.call @cc_intern(%3759, %3760) : (i64, i64) -> i64
      %3762 = func.call @cc_nil_value() : () -> i64
      %3763 = func.call @cc_cons(%3761, %3762) : (i64, i64) -> i64
      %3764 = func.call @cc_values_pack(%3763) : (i64) -> i64
      func.call @stack_push_pointer(%3761) : (i64) -> ()
      %3765 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3766 = arith.constant 19 : i64
      %3767 = func.call @cc_make_string(%3765, %3766) : (!llvm.ptr, i64) -> i64
      %3768 = func.call @cc_nil_value() : () -> i64
      %3769 = func.call @cc_intern(%3767, %3768) : (i64, i64) -> i64
      %3770 = func.call @cc_nil_value() : () -> i64
      %3771 = func.call @cc_cons(%3769, %3770) : (i64, i64) -> i64
      %3772 = func.call @cc_values_pack(%3771) : (i64) -> i64
      func.call @stack_push_pointer(%3769) : (i64) -> ()
      %3773 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3774 = arith.constant 3 : i64
      %3775 = func.call @cc_make_string(%3773, %3774) : (!llvm.ptr, i64) -> i64
      %3776 = func.call @cc_nil_value() : () -> i64
      %3777 = func.call @cc_intern(%3775, %3776) : (i64, i64) -> i64
      %3778 = func.call @cc_nil_value() : () -> i64
      %3779 = func.call @cc_cons(%3777, %3778) : (i64, i64) -> i64
      %3780 = func.call @cc_values_pack(%3779) : (i64) -> i64
      func.call @stack_push_pointer(%3777) : (i64) -> ()
      %3781 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3782 = arith.constant 16 : i64
      %3783 = func.call @cc_make_string(%3781, %3782) : (!llvm.ptr, i64) -> i64
      %3784 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3785 = arith.constant 11 : i64
      %3786 = func.call @cc_make_string(%3784, %3785) : (!llvm.ptr, i64) -> i64
      %3787 = func.call @cc_intern(%3783, %3786) : (i64, i64) -> i64
      %3788 = func.call @cc_nil_value() : () -> i64
      %3789 = func.call @cc_cons(%3787, %3788) : (i64, i64) -> i64
      %3790 = func.call @cc_values_pack(%3789) : (i64) -> i64
      func.call @stack_push_pointer(%3787) : (i64) -> ()
      %3791 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3792 = arith.constant 2 : i64
      %3793 = func.call @cc_make_string(%3791, %3792) : (!llvm.ptr, i64) -> i64
      %3794 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3795 = arith.constant 11 : i64
      %3796 = func.call @cc_make_string(%3794, %3795) : (!llvm.ptr, i64) -> i64
      %3797 = func.call @cc_intern(%3793, %3796) : (i64, i64) -> i64
      %3798 = func.call @cc_nil_value() : () -> i64
      %3799 = func.call @cc_cons(%3797, %3798) : (i64, i64) -> i64
      %3800 = func.call @cc_values_pack(%3799) : (i64) -> i64
      func.call @stack_push_pointer(%3797) : (i64) -> ()
      %3801 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3802 = arith.constant 20 : i64
      %3803 = func.call @cc_make_string(%3801, %3802) : (!llvm.ptr, i64) -> i64
      %3804 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3805 = arith.constant 11 : i64
      %3806 = func.call @cc_make_string(%3804, %3805) : (!llvm.ptr, i64) -> i64
      %3807 = func.call @cc_intern(%3803, %3806) : (i64, i64) -> i64
      %3808 = func.call @cc_nil_value() : () -> i64
      %3809 = func.call @cc_cons(%3807, %3808) : (i64, i64) -> i64
      %3810 = func.call @cc_values_pack(%3809) : (i64) -> i64
      func.call @stack_push_pointer(%3807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3811 = func.call @stack_pop_pointer() : () -> i64
      %3812 = func.call @stack_pop_pointer() : () -> i64
      %3813 = func.call @cc_cons(%3812, %3811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3813) : (i64) -> ()
      %3814 = func.call @stack_pop_pointer() : () -> i64
      %3815 = func.call @stack_pop_pointer() : () -> i64
      %3816 = func.call @cc_cons(%3815, %3814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3816) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3817 = func.call @stack_pop_pointer() : () -> i64
      %3818 = func.call @stack_pop_pointer() : () -> i64
      %3819 = func.call @cc_cons(%3818, %3817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3819) : (i64) -> ()
      %3820 = func.call @stack_pop_pointer() : () -> i64
      %3821 = func.call @stack_pop_pointer() : () -> i64
      %3822 = func.call @cc_cons(%3821, %3820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3822) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3823 = func.call @stack_pop_pointer() : () -> i64
      %3824 = func.call @stack_pop_pointer() : () -> i64
      %3825 = func.call @cc_cons(%3824, %3823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3825) : (i64) -> ()
      %3826 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3827 = arith.constant 6 : i64
      %3828 = func.call @cc_make_string(%3826, %3827) : (!llvm.ptr, i64) -> i64
      %3829 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3830 = arith.constant 11 : i64
      %3831 = func.call @cc_make_string(%3829, %3830) : (!llvm.ptr, i64) -> i64
      %3832 = func.call @cc_intern(%3828, %3831) : (i64, i64) -> i64
      %3833 = func.call @cc_nil_value() : () -> i64
      %3834 = func.call @cc_cons(%3832, %3833) : (i64, i64) -> i64
      %3835 = func.call @cc_values_pack(%3834) : (i64) -> i64
      func.call @stack_push_pointer(%3832) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3836 = func.call @stack_pop_pointer() : () -> i64
      %3837 = func.call @stack_pop_pointer() : () -> i64
      %3838 = func.call @cc_cons(%3837, %3836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3838) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %3848 = func.call @stack_pop_pointer() : () -> i64
      %3849 = func.call @stack_pop_pointer() : () -> i64
      %3850 = func.call @cc_cons(%3849, %3848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3850) : (i64) -> ()
      %3851 = func.call @stack_pop_pointer() : () -> i64
      %3852 = func.call @stack_pop_pointer() : () -> i64
      %3853 = func.call @cc_cons(%3852, %3851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3853) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3854 = func.call @stack_pop_pointer() : () -> i64
      %3855 = func.call @stack_pop_pointer() : () -> i64
      %3856 = func.call @cc_cons(%3855, %3854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3856) : (i64) -> ()
      %3857 = func.call @stack_pop_pointer() : () -> i64
      %3858 = func.call @stack_pop_pointer() : () -> i64
      %3859 = func.call @cc_cons(%3858, %3857) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3859) : (i64) -> ()
      %3860 = func.call @stack_pop_pointer() : () -> i64
      %3861 = func.call @stack_pop_pointer() : () -> i64
      %3862 = func.call @cc_cons(%3861, %3860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3863 = func.call @stack_pop_pointer() : () -> i64
      %3864 = func.call @stack_pop_pointer() : () -> i64
      %3865 = func.call @cc_cons(%3864, %3863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3865) : (i64) -> ()
      %3866 = func.call @stack_pop_pointer() : () -> i64
      %3867 = func.call @stack_pop_pointer() : () -> i64
      %3868 = func.call @cc_cons(%3867, %3866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3868) : (i64) -> ()
      %3869 = func.call @stack_pop_pointer() : () -> i64
      %3967 = arith.constant 116254966808590 : i64
      %3968 = arith.constant 0 : i64
      %3969 = func.call @cc_make_closure(%3967, %3968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3969) : (i64) -> ()
      %3970 = func.call @stack_pop_pointer() : () -> i64
      %3971 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3972 = arith.constant 4 : i64
      %3973 = func.call @cc_make_string(%3971, %3972) : (!llvm.ptr, i64) -> i64
      %3974 = func.call @cc_nil_value() : () -> i64
      %3975 = func.call @cc_intern(%3973, %3974) : (i64, i64) -> i64
      %3976 = func.call @cc_nil_value() : () -> i64
      %3977 = func.call @cc_cons(%3975, %3976) : (i64, i64) -> i64
      %3978 = func.call @cc_values_pack(%3977) : (i64) -> i64
      func.call @stack_push_pointer(%3975) : (i64) -> ()
      %3979 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3980 = arith.constant 10 : i64
      %3981 = func.call @cc_make_string(%3979, %3980) : (!llvm.ptr, i64) -> i64
      %3982 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3983 = arith.constant 11 : i64
      %3984 = func.call @cc_make_string(%3982, %3983) : (!llvm.ptr, i64) -> i64
      %3985 = func.call @cc_intern(%3981, %3984) : (i64, i64) -> i64
      %3986 = func.call @cc_nil_value() : () -> i64
      %3987 = func.call @cc_cons(%3985, %3986) : (i64, i64) -> i64
      %3988 = func.call @cc_values_pack(%3987) : (i64) -> i64
      func.call @stack_push_pointer(%3985) : (i64) -> ()
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
      %3996 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3997 = arith.constant 11 : i64
      %3998 = func.call @cc_make_string(%3996, %3997) : (!llvm.ptr, i64) -> i64
      %3999 = llvm.mlir.addressof @str312 : !llvm.ptr
      %4000 = arith.constant 7 : i64
      %4001 = func.call @cc_make_string(%3999, %4000) : (!llvm.ptr, i64) -> i64
      %4002 = func.call @cc_intern(%3998, %4001) : (i64, i64) -> i64
      %4003 = func.call @cc_nil_value() : () -> i64
      %4004 = func.call @cc_cons(%4002, %4003) : (i64, i64) -> i64
      %4005 = func.call @cc_values_pack(%4004) : (i64) -> i64
      func.call @stack_push_pointer(%4002) : (i64) -> ()
      %4006 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4007 = func.call @stack_pop_pointer() : () -> i64
      %4008 = llvm.mlir.addressof @str313 : !llvm.ptr
      %4009 = arith.constant 4 : i64
      %4010 = func.call @cc_make_string(%4008, %4009) : (!llvm.ptr, i64) -> i64
      %4011 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4012 = arith.constant 7 : i64
      %4013 = func.call @cc_make_string(%4011, %4012) : (!llvm.ptr, i64) -> i64
      %4014 = func.call @cc_intern(%4010, %4013) : (i64, i64) -> i64
      %4015 = func.call @cc_nil_value() : () -> i64
      %4016 = func.call @cc_cons(%4014, %4015) : (i64, i64) -> i64
      %4017 = func.call @cc_values_pack(%4016) : (i64) -> i64
      func.call @stack_push_pointer(%4014) : (i64) -> ()
      %4018 = func.call @stack_pop_pointer() : () -> i64
      %4019 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4020 = arith.constant 5 : i64
      %4021 = func.call @cc_make_string(%4019, %4020) : (!llvm.ptr, i64) -> i64
      %4022 = func.call @cc_nil_value() : () -> i64
      %4023 = func.call @cc_intern(%4021, %4022) : (i64, i64) -> i64
      %4024 = func.call @cc_nil_value() : () -> i64
      %4025 = func.call @cc_cons(%4023, %4024) : (i64, i64) -> i64
      %4026 = func.call @cc_values_pack(%4025) : (i64) -> i64
      func.call @stack_push_pointer(%4023) : (i64) -> ()
      %4027 = func.call @stack_pop_pointer() : () -> i64
      %4028 = func.call @cc_nil_value() : () -> i64
      %4029 = func.call @cc_errorp(%3746) : (i64) -> i64
      %4030 = arith.cmpi ne, %4029, %4028 : i64
      %4031 = arith.cmpi eq, %4028, %4028 : i64
      %4032 = arith.andi %4030, %4031 : i1
      %4033 = scf.if %4032 -> (i64) {
        scf.yield %3746 : i64
      } else {
        scf.yield %4028 : i64
      }
      %4034 = func.call @cc_errorp(%3869) : (i64) -> i64
      %4035 = arith.cmpi ne, %4034, %4028 : i64
      %4036 = arith.cmpi eq, %4033, %4028 : i64
      %4037 = arith.andi %4035, %4036 : i1
      %4038 = scf.if %4037 -> (i64) {
        scf.yield %3869 : i64
      } else {
        scf.yield %4033 : i64
      }
      %4039 = func.call @cc_errorp(%3970) : (i64) -> i64
      %4040 = arith.cmpi ne, %4039, %4028 : i64
      %4041 = arith.cmpi eq, %4038, %4028 : i64
      %4042 = arith.andi %4040, %4041 : i1
      %4043 = scf.if %4042 -> (i64) {
        scf.yield %3970 : i64
      } else {
        scf.yield %4038 : i64
      }
      %4044 = func.call @cc_errorp(%3995) : (i64) -> i64
      %4045 = arith.cmpi ne, %4044, %4028 : i64
      %4046 = arith.cmpi eq, %4043, %4028 : i64
      %4047 = arith.andi %4045, %4046 : i1
      %4048 = scf.if %4047 -> (i64) {
        scf.yield %3995 : i64
      } else {
        scf.yield %4043 : i64
      }
      %4049 = func.call @cc_errorp(%4006) : (i64) -> i64
      %4050 = arith.cmpi ne, %4049, %4028 : i64
      %4051 = arith.cmpi eq, %4048, %4028 : i64
      %4052 = arith.andi %4050, %4051 : i1
      %4053 = scf.if %4052 -> (i64) {
        scf.yield %4006 : i64
      } else {
        scf.yield %4048 : i64
      }
      %4054 = func.call @cc_errorp(%4007) : (i64) -> i64
      %4055 = arith.cmpi ne, %4054, %4028 : i64
      %4056 = arith.cmpi eq, %4053, %4028 : i64
      %4057 = arith.andi %4055, %4056 : i1
      %4058 = scf.if %4057 -> (i64) {
        scf.yield %4007 : i64
      } else {
        scf.yield %4053 : i64
      }
      %4059 = func.call @cc_errorp(%4018) : (i64) -> i64
      %4060 = arith.cmpi ne, %4059, %4028 : i64
      %4061 = arith.cmpi eq, %4058, %4028 : i64
      %4062 = arith.andi %4060, %4061 : i1
      %4063 = scf.if %4062 -> (i64) {
        scf.yield %4018 : i64
      } else {
        scf.yield %4058 : i64
      }
      %4064 = func.call @cc_errorp(%4027) : (i64) -> i64
      %4065 = arith.cmpi ne, %4064, %4028 : i64
      %4066 = arith.cmpi eq, %4063, %4028 : i64
      %4067 = arith.andi %4065, %4066 : i1
      %4068 = scf.if %4067 -> (i64) {
        scf.yield %4027 : i64
      } else {
        scf.yield %4063 : i64
      }
      %4069 = arith.cmpi ne, %4068, %4028 : i64
      scf.if %4069 {
        func.call @stack_push_pointer(%4068) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3746) : (i64) -> ()
        func.call @stack_push_pointer(%3869) : (i64) -> ()
        func.call @stack_push_pointer(%3970) : (i64) -> ()
        func.call @stack_push_pointer(%3995) : (i64) -> ()
        func.call @stack_push_pointer(%4006) : (i64) -> ()
        func.call @stack_push_pointer(%4007) : (i64) -> ()
        func.call @stack_push_pointer(%4018) : (i64) -> ()
        func.call @stack_push_pointer(%4027) : (i64) -> ()
        %4070 = llvm.mlir.addressof @str316 : !llvm.ptr
        %4071 = func.call @cc_make_function_ref_const(%4070) : (!llvm.ptr) -> i64
        %4072 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4071, %4072) : (i64, i64) -> ()
      }
      %4073 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4073 : i64
    }
    %4074 = func.call @cc_nil_value() : () -> i64
    %4075 = func.call @cc_errorp(%3737) : (i64) -> i64
    %4076 = arith.cmpi ne, %4075, %4074 : i64
    %4077 = scf.if %4076 -> (i64) {
      scf.yield %3737 : i64
    } else {
      %4078 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4079 = arith.constant 9 : i64
      %4080 = func.call @cc_make_string(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = func.call @cc_nil_value() : () -> i64
      %4082 = func.call @cc_intern(%4080, %4081) : (i64, i64) -> i64
      %4083 = func.call @cc_nil_value() : () -> i64
      %4084 = func.call @cc_cons(%4082, %4083) : (i64, i64) -> i64
      %4085 = func.call @cc_values_pack(%4084) : (i64) -> i64
      func.call @stack_push_pointer(%4082) : (i64) -> ()
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4088 = arith.constant 13 : i64
      %4089 = func.call @cc_make_string(%4087, %4088) : (!llvm.ptr, i64) -> i64
      %4090 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4091 = arith.constant 11 : i64
      %4092 = func.call @cc_make_string(%4090, %4091) : (!llvm.ptr, i64) -> i64
      %4093 = func.call @cc_intern(%4089, %4092) : (i64, i64) -> i64
      %4094 = func.call @cc_nil_value() : () -> i64
      %4095 = func.call @cc_cons(%4093, %4094) : (i64, i64) -> i64
      %4096 = func.call @cc_values_pack(%4095) : (i64) -> i64
      func.call @stack_push_pointer(%4093) : (i64) -> ()
      %4097 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4098 = arith.constant 6 : i64
      %4099 = func.call @cc_make_string(%4097, %4098) : (!llvm.ptr, i64) -> i64
      %4100 = func.call @cc_nil_value() : () -> i64
      %4101 = func.call @cc_intern(%4099, %4100) : (i64, i64) -> i64
      %4102 = func.call @cc_nil_value() : () -> i64
      %4103 = func.call @cc_cons(%4101, %4102) : (i64, i64) -> i64
      %4104 = func.call @cc_values_pack(%4103) : (i64) -> i64
      func.call @stack_push_pointer(%4101) : (i64) -> ()
      %4105 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4106 = arith.constant 19 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = func.call @cc_nil_value() : () -> i64
      %4109 = func.call @cc_intern(%4107, %4108) : (i64, i64) -> i64
      %4110 = func.call @cc_nil_value() : () -> i64
      %4111 = func.call @cc_cons(%4109, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_values_pack(%4111) : (i64) -> i64
      func.call @stack_push_pointer(%4109) : (i64) -> ()
      %4113 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4114 = arith.constant 3 : i64
      %4115 = func.call @cc_make_string(%4113, %4114) : (!llvm.ptr, i64) -> i64
      %4116 = func.call @cc_nil_value() : () -> i64
      %4117 = func.call @cc_intern(%4115, %4116) : (i64, i64) -> i64
      %4118 = func.call @cc_nil_value() : () -> i64
      %4119 = func.call @cc_cons(%4117, %4118) : (i64, i64) -> i64
      %4120 = func.call @cc_values_pack(%4119) : (i64) -> i64
      func.call @stack_push_pointer(%4117) : (i64) -> ()
      %4121 = llvm.mlir.addressof @str323 : !llvm.ptr
      %4122 = arith.constant 16 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4125 = arith.constant 11 : i64
      %4126 = func.call @cc_make_string(%4124, %4125) : (!llvm.ptr, i64) -> i64
      %4127 = func.call @cc_intern(%4123, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_nil_value() : () -> i64
      %4129 = func.call @cc_cons(%4127, %4128) : (i64, i64) -> i64
      %4130 = func.call @cc_values_pack(%4129) : (i64) -> i64
      func.call @stack_push_pointer(%4127) : (i64) -> ()
      %4131 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4131) : (i64) -> ()
      %4132 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4133 = arith.constant 5 : i64
      %4134 = func.call @cc_make_string(%4132, %4133) : (!llvm.ptr, i64) -> i64
      %4135 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4136 = arith.constant 11 : i64
      %4137 = func.call @cc_make_string(%4135, %4136) : (!llvm.ptr, i64) -> i64
      %4138 = func.call @cc_intern(%4134, %4137) : (i64, i64) -> i64
      %4139 = func.call @cc_nil_value() : () -> i64
      %4140 = func.call @cc_cons(%4138, %4139) : (i64, i64) -> i64
      %4141 = func.call @cc_values_pack(%4140) : (i64) -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4142 = func.call @stack_pop_pointer() : () -> i64
      %4143 = func.call @stack_pop_pointer() : () -> i64
      %4144 = func.call @cc_cons(%4142, %4143) : (i64, i64) -> i64
      %4145 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4146 = arith.constant 5 : i64
      %4147 = func.call @cc_make_string(%4145, %4146) : (!llvm.ptr, i64) -> i64
      %4148 = func.call @cc_nil_value() : () -> i64
      %4149 = func.call @cc_intern(%4147, %4148) : (i64, i64) -> i64
      %4150 = func.call @cc_nil_value() : () -> i64
      %4151 = func.call @cc_cons(%4149, %4150) : (i64, i64) -> i64
      %4152 = func.call @cc_values_pack(%4151) : (i64) -> i64
      %4153 = func.call @cc_cons(%4149, %4144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4153) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4154 = func.call @stack_pop_pointer() : () -> i64
      %4155 = func.call @stack_pop_pointer() : () -> i64
      %4156 = func.call @cc_cons(%4155, %4154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4156) : (i64) -> ()
      %4157 = func.call @stack_pop_pointer() : () -> i64
      %4158 = func.call @stack_pop_pointer() : () -> i64
      %4159 = func.call @cc_cons(%4158, %4157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4160 = func.call @stack_pop_pointer() : () -> i64
      %4161 = func.call @stack_pop_pointer() : () -> i64
      %4162 = func.call @cc_cons(%4161, %4160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4162) : (i64) -> ()
      %4163 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4164 = arith.constant 6 : i64
      %4165 = func.call @cc_make_string(%4163, %4164) : (!llvm.ptr, i64) -> i64
      %4166 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4167 = arith.constant 11 : i64
      %4168 = func.call @cc_make_string(%4166, %4167) : (!llvm.ptr, i64) -> i64
      %4169 = func.call @cc_intern(%4165, %4168) : (i64, i64) -> i64
      %4170 = func.call @cc_nil_value() : () -> i64
      %4171 = func.call @cc_cons(%4169, %4170) : (i64, i64) -> i64
      %4172 = func.call @cc_values_pack(%4171) : (i64) -> i64
      func.call @stack_push_pointer(%4169) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4173 = func.call @stack_pop_pointer() : () -> i64
      %4174 = func.call @stack_pop_pointer() : () -> i64
      %4175 = func.call @cc_cons(%4174, %4173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4176 = func.call @stack_pop_pointer() : () -> i64
      %4177 = func.call @stack_pop_pointer() : () -> i64
      %4178 = func.call @cc_cons(%4177, %4176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4178) : (i64) -> ()
      %4179 = func.call @stack_pop_pointer() : () -> i64
      %4180 = func.call @stack_pop_pointer() : () -> i64
      %4181 = func.call @cc_cons(%4180, %4179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4181) : (i64) -> ()
      %4182 = func.call @stack_pop_pointer() : () -> i64
      %4183 = func.call @stack_pop_pointer() : () -> i64
      %4184 = func.call @cc_cons(%4183, %4182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4184) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4185 = func.call @stack_pop_pointer() : () -> i64
      %4186 = func.call @stack_pop_pointer() : () -> i64
      %4187 = func.call @cc_cons(%4186, %4185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4187) : (i64) -> ()
      %4188 = func.call @stack_pop_pointer() : () -> i64
      %4189 = func.call @stack_pop_pointer() : () -> i64
      %4190 = func.call @cc_cons(%4189, %4188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4190) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4191 = func.call @stack_pop_pointer() : () -> i64
      %4192 = func.call @stack_pop_pointer() : () -> i64
      %4193 = func.call @cc_cons(%4192, %4191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4193) : (i64) -> ()
      %4194 = func.call @stack_pop_pointer() : () -> i64
      %4195 = func.call @stack_pop_pointer() : () -> i64
      %4196 = func.call @cc_cons(%4195, %4194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4196) : (i64) -> ()
      %4197 = func.call @stack_pop_pointer() : () -> i64
      %4198 = func.call @stack_pop_pointer() : () -> i64
      %4199 = func.call @cc_cons(%4198, %4197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4199) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4200 = func.call @stack_pop_pointer() : () -> i64
      %4201 = func.call @stack_pop_pointer() : () -> i64
      %4202 = func.call @cc_cons(%4201, %4200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4202) : (i64) -> ()
      %4203 = func.call @stack_pop_pointer() : () -> i64
      %4204 = func.call @stack_pop_pointer() : () -> i64
      %4205 = func.call @cc_cons(%4204, %4203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4205) : (i64) -> ()
      %4206 = func.call @stack_pop_pointer() : () -> i64
      %4275 = arith.constant 116254966808591 : i64
      %4276 = arith.constant 0 : i64
      %4277 = func.call @cc_make_closure(%4275, %4276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4277) : (i64) -> ()
      %4278 = func.call @stack_pop_pointer() : () -> i64
      %4279 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4280 = arith.constant 4 : i64
      %4281 = func.call @cc_make_string(%4279, %4280) : (!llvm.ptr, i64) -> i64
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_intern(%4281, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_nil_value() : () -> i64
      %4285 = func.call @cc_cons(%4283, %4284) : (i64, i64) -> i64
      %4286 = func.call @cc_values_pack(%4285) : (i64) -> i64
      func.call @stack_push_pointer(%4283) : (i64) -> ()
      %4287 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4288 = arith.constant 10 : i64
      %4289 = func.call @cc_make_string(%4287, %4288) : (!llvm.ptr, i64) -> i64
      %4290 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4291 = arith.constant 11 : i64
      %4292 = func.call @cc_make_string(%4290, %4291) : (!llvm.ptr, i64) -> i64
      %4293 = func.call @cc_intern(%4289, %4292) : (i64, i64) -> i64
      %4294 = func.call @cc_nil_value() : () -> i64
      %4295 = func.call @cc_cons(%4293, %4294) : (i64, i64) -> i64
      %4296 = func.call @cc_values_pack(%4295) : (i64) -> i64
      func.call @stack_push_pointer(%4293) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4297 = func.call @stack_pop_pointer() : () -> i64
      %4298 = func.call @stack_pop_pointer() : () -> i64
      %4299 = func.call @cc_cons(%4298, %4297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4299) : (i64) -> ()
      %4300 = func.call @stack_pop_pointer() : () -> i64
      %4301 = func.call @stack_pop_pointer() : () -> i64
      %4302 = func.call @cc_cons(%4301, %4300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4302) : (i64) -> ()
      %4303 = func.call @stack_pop_pointer() : () -> i64
      %4304 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4305 = arith.constant 11 : i64
      %4306 = func.call @cc_make_string(%4304, %4305) : (!llvm.ptr, i64) -> i64
      %4307 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4308 = arith.constant 7 : i64
      %4309 = func.call @cc_make_string(%4307, %4308) : (!llvm.ptr, i64) -> i64
      %4310 = func.call @cc_intern(%4306, %4309) : (i64, i64) -> i64
      %4311 = func.call @cc_nil_value() : () -> i64
      %4312 = func.call @cc_cons(%4310, %4311) : (i64, i64) -> i64
      %4313 = func.call @cc_values_pack(%4312) : (i64) -> i64
      func.call @stack_push_pointer(%4310) : (i64) -> ()
      %4314 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4315 = func.call @stack_pop_pointer() : () -> i64
      %4316 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4317 = arith.constant 4 : i64
      %4318 = func.call @cc_make_string(%4316, %4317) : (!llvm.ptr, i64) -> i64
      %4319 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4320 = arith.constant 7 : i64
      %4321 = func.call @cc_make_string(%4319, %4320) : (!llvm.ptr, i64) -> i64
      %4322 = func.call @cc_intern(%4318, %4321) : (i64, i64) -> i64
      %4323 = func.call @cc_nil_value() : () -> i64
      %4324 = func.call @cc_cons(%4322, %4323) : (i64, i64) -> i64
      %4325 = func.call @cc_values_pack(%4324) : (i64) -> i64
      func.call @stack_push_pointer(%4322) : (i64) -> ()
      %4326 = func.call @stack_pop_pointer() : () -> i64
      %4327 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4328 = arith.constant 5 : i64
      %4329 = func.call @cc_make_string(%4327, %4328) : (!llvm.ptr, i64) -> i64
      %4330 = func.call @cc_nil_value() : () -> i64
      %4331 = func.call @cc_intern(%4329, %4330) : (i64, i64) -> i64
      %4332 = func.call @cc_nil_value() : () -> i64
      %4333 = func.call @cc_cons(%4331, %4332) : (i64, i64) -> i64
      %4334 = func.call @cc_values_pack(%4333) : (i64) -> i64
      func.call @stack_push_pointer(%4331) : (i64) -> ()
      %4335 = func.call @stack_pop_pointer() : () -> i64
      %4336 = func.call @cc_nil_value() : () -> i64
      %4337 = func.call @cc_errorp(%4086) : (i64) -> i64
      %4338 = arith.cmpi ne, %4337, %4336 : i64
      %4339 = arith.cmpi eq, %4336, %4336 : i64
      %4340 = arith.andi %4338, %4339 : i1
      %4341 = scf.if %4340 -> (i64) {
        scf.yield %4086 : i64
      } else {
        scf.yield %4336 : i64
      }
      %4342 = func.call @cc_errorp(%4206) : (i64) -> i64
      %4343 = arith.cmpi ne, %4342, %4336 : i64
      %4344 = arith.cmpi eq, %4341, %4336 : i64
      %4345 = arith.andi %4343, %4344 : i1
      %4346 = scf.if %4345 -> (i64) {
        scf.yield %4206 : i64
      } else {
        scf.yield %4341 : i64
      }
      %4347 = func.call @cc_errorp(%4278) : (i64) -> i64
      %4348 = arith.cmpi ne, %4347, %4336 : i64
      %4349 = arith.cmpi eq, %4346, %4336 : i64
      %4350 = arith.andi %4348, %4349 : i1
      %4351 = scf.if %4350 -> (i64) {
        scf.yield %4278 : i64
      } else {
        scf.yield %4346 : i64
      }
      %4352 = func.call @cc_errorp(%4303) : (i64) -> i64
      %4353 = arith.cmpi ne, %4352, %4336 : i64
      %4354 = arith.cmpi eq, %4351, %4336 : i64
      %4355 = arith.andi %4353, %4354 : i1
      %4356 = scf.if %4355 -> (i64) {
        scf.yield %4303 : i64
      } else {
        scf.yield %4351 : i64
      }
      %4357 = func.call @cc_errorp(%4314) : (i64) -> i64
      %4358 = arith.cmpi ne, %4357, %4336 : i64
      %4359 = arith.cmpi eq, %4356, %4336 : i64
      %4360 = arith.andi %4358, %4359 : i1
      %4361 = scf.if %4360 -> (i64) {
        scf.yield %4314 : i64
      } else {
        scf.yield %4356 : i64
      }
      %4362 = func.call @cc_errorp(%4315) : (i64) -> i64
      %4363 = arith.cmpi ne, %4362, %4336 : i64
      %4364 = arith.cmpi eq, %4361, %4336 : i64
      %4365 = arith.andi %4363, %4364 : i1
      %4366 = scf.if %4365 -> (i64) {
        scf.yield %4315 : i64
      } else {
        scf.yield %4361 : i64
      }
      %4367 = func.call @cc_errorp(%4326) : (i64) -> i64
      %4368 = arith.cmpi ne, %4367, %4336 : i64
      %4369 = arith.cmpi eq, %4366, %4336 : i64
      %4370 = arith.andi %4368, %4369 : i1
      %4371 = scf.if %4370 -> (i64) {
        scf.yield %4326 : i64
      } else {
        scf.yield %4366 : i64
      }
      %4372 = func.call @cc_errorp(%4335) : (i64) -> i64
      %4373 = arith.cmpi ne, %4372, %4336 : i64
      %4374 = arith.cmpi eq, %4371, %4336 : i64
      %4375 = arith.andi %4373, %4374 : i1
      %4376 = scf.if %4375 -> (i64) {
        scf.yield %4335 : i64
      } else {
        scf.yield %4371 : i64
      }
      %4377 = arith.cmpi ne, %4376, %4336 : i64
      scf.if %4377 {
        func.call @stack_push_pointer(%4376) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4086) : (i64) -> ()
        func.call @stack_push_pointer(%4206) : (i64) -> ()
        func.call @stack_push_pointer(%4278) : (i64) -> ()
        func.call @stack_push_pointer(%4303) : (i64) -> ()
        func.call @stack_push_pointer(%4314) : (i64) -> ()
        func.call @stack_push_pointer(%4315) : (i64) -> ()
        func.call @stack_push_pointer(%4326) : (i64) -> ()
        func.call @stack_push_pointer(%4335) : (i64) -> ()
        %4378 = llvm.mlir.addressof @str341 : !llvm.ptr
        %4379 = func.call @cc_make_function_ref_const(%4378) : (!llvm.ptr) -> i64
        %4380 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4379, %4380) : (i64, i64) -> ()
      }
      %4381 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4381 : i64
    }
    %4382 = func.call @cc_nil_value() : () -> i64
    %4383 = func.call @cc_errorp(%4077) : (i64) -> i64
    %4384 = arith.cmpi ne, %4383, %4382 : i64
    %4385 = scf.if %4384 -> (i64) {
      scf.yield %4077 : i64
    } else {
      %4386 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4387 = arith.constant 9 : i64
      %4388 = func.call @cc_make_string(%4386, %4387) : (!llvm.ptr, i64) -> i64
      %4389 = func.call @cc_nil_value() : () -> i64
      %4390 = func.call @cc_intern(%4388, %4389) : (i64, i64) -> i64
      %4391 = func.call @cc_nil_value() : () -> i64
      %4392 = func.call @cc_cons(%4390, %4391) : (i64, i64) -> i64
      %4393 = func.call @cc_values_pack(%4392) : (i64) -> i64
      func.call @stack_push_pointer(%4390) : (i64) -> ()
      %4394 = func.call @stack_pop_pointer() : () -> i64
      %4395 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4396 = arith.constant 13 : i64
      %4397 = func.call @cc_make_string(%4395, %4396) : (!llvm.ptr, i64) -> i64
      %4398 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4399 = arith.constant 11 : i64
      %4400 = func.call @cc_make_string(%4398, %4399) : (!llvm.ptr, i64) -> i64
      %4401 = func.call @cc_intern(%4397, %4400) : (i64, i64) -> i64
      %4402 = func.call @cc_nil_value() : () -> i64
      %4403 = func.call @cc_cons(%4401, %4402) : (i64, i64) -> i64
      %4404 = func.call @cc_values_pack(%4403) : (i64) -> i64
      func.call @stack_push_pointer(%4401) : (i64) -> ()
      %4405 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4406 = arith.constant 6 : i64
      %4407 = func.call @cc_make_string(%4405, %4406) : (!llvm.ptr, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_intern(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_nil_value() : () -> i64
      %4411 = func.call @cc_cons(%4409, %4410) : (i64, i64) -> i64
      %4412 = func.call @cc_values_pack(%4411) : (i64) -> i64
      func.call @stack_push_pointer(%4409) : (i64) -> ()
      %4413 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4414 = arith.constant 19 : i64
      %4415 = func.call @cc_make_string(%4413, %4414) : (!llvm.ptr, i64) -> i64
      %4416 = func.call @cc_nil_value() : () -> i64
      %4417 = func.call @cc_intern(%4415, %4416) : (i64, i64) -> i64
      %4418 = func.call @cc_nil_value() : () -> i64
      %4419 = func.call @cc_cons(%4417, %4418) : (i64, i64) -> i64
      %4420 = func.call @cc_values_pack(%4419) : (i64) -> i64
      func.call @stack_push_pointer(%4417) : (i64) -> ()
      %4421 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4422 = arith.constant 7 : i64
      %4423 = func.call @cc_make_string(%4421, %4422) : (!llvm.ptr, i64) -> i64
      %4424 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4425 = arith.constant 11 : i64
      %4426 = func.call @cc_make_string(%4424, %4425) : (!llvm.ptr, i64) -> i64
      %4427 = func.call @cc_intern(%4423, %4426) : (i64, i64) -> i64
      %4428 = func.call @cc_nil_value() : () -> i64
      %4429 = func.call @cc_cons(%4427, %4428) : (i64, i64) -> i64
      %4430 = func.call @cc_values_pack(%4429) : (i64) -> i64
      func.call @stack_push_pointer(%4427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4431 = func.call @stack_pop_pointer() : () -> i64
      %4432 = func.call @stack_pop_pointer() : () -> i64
      %4433 = func.call @cc_cons(%4432, %4431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4433) : (i64) -> ()
      %4434 = func.call @stack_pop_pointer() : () -> i64
      %4435 = func.call @stack_pop_pointer() : () -> i64
      %4436 = func.call @cc_cons(%4435, %4434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4437 = func.call @stack_pop_pointer() : () -> i64
      %4438 = func.call @stack_pop_pointer() : () -> i64
      %4439 = func.call @cc_cons(%4438, %4437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4439) : (i64) -> ()
      %4440 = func.call @stack_pop_pointer() : () -> i64
      %4441 = func.call @stack_pop_pointer() : () -> i64
      %4442 = func.call @cc_cons(%4441, %4440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4443 = func.call @stack_pop_pointer() : () -> i64
      %4444 = func.call @stack_pop_pointer() : () -> i64
      %4445 = func.call @cc_cons(%4444, %4443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4445) : (i64) -> ()
      %4446 = func.call @stack_pop_pointer() : () -> i64
      %4447 = func.call @stack_pop_pointer() : () -> i64
      %4448 = func.call @cc_cons(%4447, %4446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4448) : (i64) -> ()
      %4449 = func.call @stack_pop_pointer() : () -> i64
      %4450 = func.call @stack_pop_pointer() : () -> i64
      %4451 = func.call @cc_cons(%4450, %4449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4451) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4452 = func.call @stack_pop_pointer() : () -> i64
      %4453 = func.call @stack_pop_pointer() : () -> i64
      %4454 = func.call @cc_cons(%4453, %4452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4454) : (i64) -> ()
      %4455 = func.call @stack_pop_pointer() : () -> i64
      %4456 = func.call @stack_pop_pointer() : () -> i64
      %4457 = func.call @cc_cons(%4456, %4455) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4457) : (i64) -> ()
      %4458 = func.call @stack_pop_pointer() : () -> i64
      %4505 = arith.constant 116254966808592 : i64
      %4506 = arith.constant 0 : i64
      %4507 = func.call @cc_make_closure(%4505, %4506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4507) : (i64) -> ()
      %4508 = func.call @stack_pop_pointer() : () -> i64
      %4509 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4510 = arith.constant 4 : i64
      %4511 = func.call @cc_make_string(%4509, %4510) : (!llvm.ptr, i64) -> i64
      %4512 = func.call @cc_nil_value() : () -> i64
      %4513 = func.call @cc_intern(%4511, %4512) : (i64, i64) -> i64
      %4514 = func.call @cc_nil_value() : () -> i64
      %4515 = func.call @cc_cons(%4513, %4514) : (i64, i64) -> i64
      %4516 = func.call @cc_values_pack(%4515) : (i64) -> i64
      func.call @stack_push_pointer(%4513) : (i64) -> ()
      %4517 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4518 = arith.constant 10 : i64
      %4519 = func.call @cc_make_string(%4517, %4518) : (!llvm.ptr, i64) -> i64
      %4520 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4521 = arith.constant 11 : i64
      %4522 = func.call @cc_make_string(%4520, %4521) : (!llvm.ptr, i64) -> i64
      %4523 = func.call @cc_intern(%4519, %4522) : (i64, i64) -> i64
      %4524 = func.call @cc_nil_value() : () -> i64
      %4525 = func.call @cc_cons(%4523, %4524) : (i64, i64) -> i64
      %4526 = func.call @cc_values_pack(%4525) : (i64) -> i64
      func.call @stack_push_pointer(%4523) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4527 = func.call @stack_pop_pointer() : () -> i64
      %4528 = func.call @stack_pop_pointer() : () -> i64
      %4529 = func.call @cc_cons(%4528, %4527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4529) : (i64) -> ()
      %4530 = func.call @stack_pop_pointer() : () -> i64
      %4531 = func.call @stack_pop_pointer() : () -> i64
      %4532 = func.call @cc_cons(%4531, %4530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4532) : (i64) -> ()
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4535 = arith.constant 11 : i64
      %4536 = func.call @cc_make_string(%4534, %4535) : (!llvm.ptr, i64) -> i64
      %4537 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4538 = arith.constant 7 : i64
      %4539 = func.call @cc_make_string(%4537, %4538) : (!llvm.ptr, i64) -> i64
      %4540 = func.call @cc_intern(%4536, %4539) : (i64, i64) -> i64
      %4541 = func.call @cc_nil_value() : () -> i64
      %4542 = func.call @cc_cons(%4540, %4541) : (i64, i64) -> i64
      %4543 = func.call @cc_values_pack(%4542) : (i64) -> i64
      func.call @stack_push_pointer(%4540) : (i64) -> ()
      %4544 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4547 = arith.constant 4 : i64
      %4548 = func.call @cc_make_string(%4546, %4547) : (!llvm.ptr, i64) -> i64
      %4549 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4550 = arith.constant 7 : i64
      %4551 = func.call @cc_make_string(%4549, %4550) : (!llvm.ptr, i64) -> i64
      %4552 = func.call @cc_intern(%4548, %4551) : (i64, i64) -> i64
      %4553 = func.call @cc_nil_value() : () -> i64
      %4554 = func.call @cc_cons(%4552, %4553) : (i64, i64) -> i64
      %4555 = func.call @cc_values_pack(%4554) : (i64) -> i64
      func.call @stack_push_pointer(%4552) : (i64) -> ()
      %4556 = func.call @stack_pop_pointer() : () -> i64
      %4557 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4558 = arith.constant 5 : i64
      %4559 = func.call @cc_make_string(%4557, %4558) : (!llvm.ptr, i64) -> i64
      %4560 = func.call @cc_nil_value() : () -> i64
      %4561 = func.call @cc_intern(%4559, %4560) : (i64, i64) -> i64
      %4562 = func.call @cc_nil_value() : () -> i64
      %4563 = func.call @cc_cons(%4561, %4562) : (i64, i64) -> i64
      %4564 = func.call @cc_values_pack(%4563) : (i64) -> i64
      func.call @stack_push_pointer(%4561) : (i64) -> ()
      %4565 = func.call @stack_pop_pointer() : () -> i64
      %4566 = func.call @cc_nil_value() : () -> i64
      %4567 = func.call @cc_errorp(%4394) : (i64) -> i64
      %4568 = arith.cmpi ne, %4567, %4566 : i64
      %4569 = arith.cmpi eq, %4566, %4566 : i64
      %4570 = arith.andi %4568, %4569 : i1
      %4571 = scf.if %4570 -> (i64) {
        scf.yield %4394 : i64
      } else {
        scf.yield %4566 : i64
      }
      %4572 = func.call @cc_errorp(%4458) : (i64) -> i64
      %4573 = arith.cmpi ne, %4572, %4566 : i64
      %4574 = arith.cmpi eq, %4571, %4566 : i64
      %4575 = arith.andi %4573, %4574 : i1
      %4576 = scf.if %4575 -> (i64) {
        scf.yield %4458 : i64
      } else {
        scf.yield %4571 : i64
      }
      %4577 = func.call @cc_errorp(%4508) : (i64) -> i64
      %4578 = arith.cmpi ne, %4577, %4566 : i64
      %4579 = arith.cmpi eq, %4576, %4566 : i64
      %4580 = arith.andi %4578, %4579 : i1
      %4581 = scf.if %4580 -> (i64) {
        scf.yield %4508 : i64
      } else {
        scf.yield %4576 : i64
      }
      %4582 = func.call @cc_errorp(%4533) : (i64) -> i64
      %4583 = arith.cmpi ne, %4582, %4566 : i64
      %4584 = arith.cmpi eq, %4581, %4566 : i64
      %4585 = arith.andi %4583, %4584 : i1
      %4586 = scf.if %4585 -> (i64) {
        scf.yield %4533 : i64
      } else {
        scf.yield %4581 : i64
      }
      %4587 = func.call @cc_errorp(%4544) : (i64) -> i64
      %4588 = arith.cmpi ne, %4587, %4566 : i64
      %4589 = arith.cmpi eq, %4586, %4566 : i64
      %4590 = arith.andi %4588, %4589 : i1
      %4591 = scf.if %4590 -> (i64) {
        scf.yield %4544 : i64
      } else {
        scf.yield %4586 : i64
      }
      %4592 = func.call @cc_errorp(%4545) : (i64) -> i64
      %4593 = arith.cmpi ne, %4592, %4566 : i64
      %4594 = arith.cmpi eq, %4591, %4566 : i64
      %4595 = arith.andi %4593, %4594 : i1
      %4596 = scf.if %4595 -> (i64) {
        scf.yield %4545 : i64
      } else {
        scf.yield %4591 : i64
      }
      %4597 = func.call @cc_errorp(%4556) : (i64) -> i64
      %4598 = arith.cmpi ne, %4597, %4566 : i64
      %4599 = arith.cmpi eq, %4596, %4566 : i64
      %4600 = arith.andi %4598, %4599 : i1
      %4601 = scf.if %4600 -> (i64) {
        scf.yield %4556 : i64
      } else {
        scf.yield %4596 : i64
      }
      %4602 = func.call @cc_errorp(%4565) : (i64) -> i64
      %4603 = arith.cmpi ne, %4602, %4566 : i64
      %4604 = arith.cmpi eq, %4601, %4566 : i64
      %4605 = arith.andi %4603, %4604 : i1
      %4606 = scf.if %4605 -> (i64) {
        scf.yield %4565 : i64
      } else {
        scf.yield %4601 : i64
      }
      %4607 = arith.cmpi ne, %4606, %4566 : i64
      scf.if %4607 {
        func.call @stack_push_pointer(%4606) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4394) : (i64) -> ()
        func.call @stack_push_pointer(%4458) : (i64) -> ()
        func.call @stack_push_pointer(%4508) : (i64) -> ()
        func.call @stack_push_pointer(%4533) : (i64) -> ()
        func.call @stack_push_pointer(%4544) : (i64) -> ()
        func.call @stack_push_pointer(%4545) : (i64) -> ()
        func.call @stack_push_pointer(%4556) : (i64) -> ()
        func.call @stack_push_pointer(%4565) : (i64) -> ()
        %4608 = llvm.mlir.addressof @str357 : !llvm.ptr
        %4609 = func.call @cc_make_function_ref_const(%4608) : (!llvm.ptr) -> i64
        %4610 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4609, %4610) : (i64, i64) -> ()
      }
      %4611 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4611 : i64
    }
    %4612 = func.call @cc_nil_value() : () -> i64
    %4613 = func.call @cc_errorp(%4385) : (i64) -> i64
    %4614 = arith.cmpi ne, %4613, %4612 : i64
    %4615 = scf.if %4614 -> (i64) {
      scf.yield %4385 : i64
    } else {
      %4616 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4617 = arith.constant 12 : i64
      %4618 = func.call @cc_make_string(%4616, %4617) : (!llvm.ptr, i64) -> i64
      %4619 = func.call @cc_nil_value() : () -> i64
      %4620 = func.call @cc_intern(%4618, %4619) : (i64, i64) -> i64
      %4621 = func.call @cc_nil_value() : () -> i64
      %4622 = func.call @cc_cons(%4620, %4621) : (i64, i64) -> i64
      %4623 = func.call @cc_values_pack(%4622) : (i64) -> i64
      func.call @stack_push_pointer(%4620) : (i64) -> ()
      %4624 = func.call @stack_pop_pointer() : () -> i64
      %4625 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4626 = arith.constant 3 : i64
      %4627 = func.call @cc_make_string(%4625, %4626) : (!llvm.ptr, i64) -> i64
      %4628 = func.call @cc_nil_value() : () -> i64
      %4629 = func.call @cc_intern(%4627, %4628) : (i64, i64) -> i64
      %4630 = func.call @cc_nil_value() : () -> i64
      %4631 = func.call @cc_cons(%4629, %4630) : (i64, i64) -> i64
      %4632 = func.call @cc_values_pack(%4631) : (i64) -> i64
      func.call @stack_push_pointer(%4629) : (i64) -> ()
      %4633 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4634 = arith.constant 3 : i64
      %4635 = func.call @cc_make_string(%4633, %4634) : (!llvm.ptr, i64) -> i64
      %4636 = func.call @cc_nil_value() : () -> i64
      %4637 = func.call @cc_intern(%4635, %4636) : (i64, i64) -> i64
      %4638 = func.call @cc_nil_value() : () -> i64
      %4639 = func.call @cc_cons(%4637, %4638) : (i64, i64) -> i64
      %4640 = func.call @cc_values_pack(%4639) : (i64) -> i64
      func.call @stack_push_pointer(%4637) : (i64) -> ()
      %4641 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4642 = arith.constant 4 : i64
      %4643 = func.call @cc_make_string(%4641, %4642) : (!llvm.ptr, i64) -> i64
      %4644 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4645 = arith.constant 11 : i64
      %4646 = func.call @cc_make_string(%4644, %4645) : (!llvm.ptr, i64) -> i64
      %4647 = func.call @cc_intern(%4643, %4646) : (i64, i64) -> i64
      %4648 = func.call @cc_nil_value() : () -> i64
      %4649 = func.call @cc_cons(%4647, %4648) : (i64, i64) -> i64
      %4650 = func.call @cc_values_pack(%4649) : (i64) -> i64
      func.call @stack_push_pointer(%4647) : (i64) -> ()
      %4651 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4652 = arith.constant 12 : i64
      %4653 = func.call @cc_make_string(%4651, %4652) : (!llvm.ptr, i64) -> i64
      %4654 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4655 = arith.constant 11 : i64
      %4656 = func.call @cc_make_string(%4654, %4655) : (!llvm.ptr, i64) -> i64
      %4657 = func.call @cc_intern(%4653, %4656) : (i64, i64) -> i64
      %4658 = func.call @cc_nil_value() : () -> i64
      %4659 = func.call @cc_cons(%4657, %4658) : (i64, i64) -> i64
      %4660 = func.call @cc_values_pack(%4659) : (i64) -> i64
      func.call @stack_push_pointer(%4657) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4661 = func.call @stack_pop_pointer() : () -> i64
      %4662 = func.call @stack_pop_pointer() : () -> i64
      %4663 = func.call @cc_cons(%4662, %4661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4663) : (i64) -> ()
      %4664 = func.call @stack_pop_pointer() : () -> i64
      %4665 = func.call @stack_pop_pointer() : () -> i64
      %4666 = func.call @cc_cons(%4665, %4664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4666) : (i64) -> ()
      %4667 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4668 = arith.constant 4 : i64
      %4669 = func.call @cc_make_string(%4667, %4668) : (!llvm.ptr, i64) -> i64
      %4670 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4671 = arith.constant 11 : i64
      %4672 = func.call @cc_make_string(%4670, %4671) : (!llvm.ptr, i64) -> i64
      %4673 = func.call @cc_intern(%4669, %4672) : (i64, i64) -> i64
      %4674 = func.call @cc_nil_value() : () -> i64
      %4675 = func.call @cc_cons(%4673, %4674) : (i64, i64) -> i64
      %4676 = func.call @cc_values_pack(%4675) : (i64) -> i64
      func.call @stack_push_pointer(%4673) : (i64) -> ()
      %4677 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4677) : (i64) -> ()
      %4678 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4679 = func.call @stack_pop_pointer() : () -> i64
      %4680 = func.call @stack_pop_pointer() : () -> i64
      %4681 = func.call @cc_cons(%4680, %4679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4681) : (i64) -> ()
      %4682 = func.call @stack_pop_pointer() : () -> i64
      %4683 = func.call @stack_pop_pointer() : () -> i64
      %4684 = func.call @cc_cons(%4683, %4682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4684) : (i64) -> ()
      %4685 = func.call @stack_pop_pointer() : () -> i64
      %4686 = func.call @stack_pop_pointer() : () -> i64
      %4687 = func.call @cc_cons(%4686, %4685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4687) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4688 = func.call @stack_pop_pointer() : () -> i64
      %4689 = func.call @stack_pop_pointer() : () -> i64
      %4690 = func.call @cc_cons(%4689, %4688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4690) : (i64) -> ()
      %4691 = func.call @stack_pop_pointer() : () -> i64
      %4692 = func.call @stack_pop_pointer() : () -> i64
      %4693 = func.call @cc_cons(%4692, %4691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4693) : (i64) -> ()
      %4694 = func.call @stack_pop_pointer() : () -> i64
      %4695 = func.call @stack_pop_pointer() : () -> i64
      %4696 = func.call @cc_cons(%4695, %4694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4696) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4697 = func.call @stack_pop_pointer() : () -> i64
      %4698 = func.call @stack_pop_pointer() : () -> i64
      %4699 = func.call @cc_cons(%4698, %4697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4699) : (i64) -> ()
      %4700 = func.call @stack_pop_pointer() : () -> i64
      %4701 = func.call @stack_pop_pointer() : () -> i64
      %4702 = func.call @cc_cons(%4701, %4700) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4703 = func.call @stack_pop_pointer() : () -> i64
      %4704 = func.call @stack_pop_pointer() : () -> i64
      %4705 = func.call @cc_cons(%4704, %4703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4705) : (i64) -> ()
      %4706 = func.call @stack_pop_pointer() : () -> i64
      %4707 = func.call @stack_pop_pointer() : () -> i64
      %4708 = func.call @cc_cons(%4707, %4706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4708) : (i64) -> ()
      %4709 = func.call @stack_pop_pointer() : () -> i64
      %4752 = arith.constant 116254966808593 : i64
      %4753 = arith.constant 0 : i64
      %4754 = func.call @cc_make_closure(%4752, %4753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4754) : (i64) -> ()
      %4755 = func.call @stack_pop_pointer() : () -> i64
      %4756 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4757 = arith.constant 1 : i64
      %4758 = func.call @cc_make_string(%4756, %4757) : (!llvm.ptr, i64) -> i64
      %4759 = func.call @cc_nil_value() : () -> i64
      %4760 = func.call @cc_intern(%4758, %4759) : (i64, i64) -> i64
      %4761 = func.call @cc_nil_value() : () -> i64
      %4762 = func.call @cc_cons(%4760, %4761) : (i64, i64) -> i64
      %4763 = func.call @cc_values_pack(%4762) : (i64) -> i64
      func.call @stack_push_pointer(%4760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4764 = func.call @stack_pop_pointer() : () -> i64
      %4765 = func.call @stack_pop_pointer() : () -> i64
      %4766 = func.call @cc_cons(%4765, %4764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4766) : (i64) -> ()
      %4767 = func.call @stack_pop_pointer() : () -> i64
      %4768 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4769 = arith.constant 11 : i64
      %4770 = func.call @cc_make_string(%4768, %4769) : (!llvm.ptr, i64) -> i64
      %4771 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4772 = arith.constant 7 : i64
      %4773 = func.call @cc_make_string(%4771, %4772) : (!llvm.ptr, i64) -> i64
      %4774 = func.call @cc_intern(%4770, %4773) : (i64, i64) -> i64
      %4775 = func.call @cc_nil_value() : () -> i64
      %4776 = func.call @cc_cons(%4774, %4775) : (i64, i64) -> i64
      %4777 = func.call @cc_values_pack(%4776) : (i64) -> i64
      func.call @stack_push_pointer(%4774) : (i64) -> ()
      %4778 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4779 = func.call @stack_pop_pointer() : () -> i64
      %4780 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4781 = arith.constant 4 : i64
      %4782 = func.call @cc_make_string(%4780, %4781) : (!llvm.ptr, i64) -> i64
      %4783 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4784 = arith.constant 7 : i64
      %4785 = func.call @cc_make_string(%4783, %4784) : (!llvm.ptr, i64) -> i64
      %4786 = func.call @cc_intern(%4782, %4785) : (i64, i64) -> i64
      %4787 = func.call @cc_nil_value() : () -> i64
      %4788 = func.call @cc_cons(%4786, %4787) : (i64, i64) -> i64
      %4789 = func.call @cc_values_pack(%4788) : (i64) -> i64
      func.call @stack_push_pointer(%4786) : (i64) -> ()
      %4790 = func.call @stack_pop_pointer() : () -> i64
      %4791 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4792 = arith.constant 6 : i64
      %4793 = func.call @cc_make_string(%4791, %4792) : (!llvm.ptr, i64) -> i64
      %4794 = func.call @cc_nil_value() : () -> i64
      %4795 = func.call @cc_intern(%4793, %4794) : (i64, i64) -> i64
      %4796 = func.call @cc_nil_value() : () -> i64
      %4797 = func.call @cc_cons(%4795, %4796) : (i64, i64) -> i64
      %4798 = func.call @cc_values_pack(%4797) : (i64) -> i64
      func.call @stack_push_pointer(%4795) : (i64) -> ()
      %4799 = func.call @stack_pop_pointer() : () -> i64
      %4800 = func.call @cc_nil_value() : () -> i64
      %4801 = func.call @cc_errorp(%4624) : (i64) -> i64
      %4802 = arith.cmpi ne, %4801, %4800 : i64
      %4803 = arith.cmpi eq, %4800, %4800 : i64
      %4804 = arith.andi %4802, %4803 : i1
      %4805 = scf.if %4804 -> (i64) {
        scf.yield %4624 : i64
      } else {
        scf.yield %4800 : i64
      }
      %4806 = func.call @cc_errorp(%4709) : (i64) -> i64
      %4807 = arith.cmpi ne, %4806, %4800 : i64
      %4808 = arith.cmpi eq, %4805, %4800 : i64
      %4809 = arith.andi %4807, %4808 : i1
      %4810 = scf.if %4809 -> (i64) {
        scf.yield %4709 : i64
      } else {
        scf.yield %4805 : i64
      }
      %4811 = func.call @cc_errorp(%4755) : (i64) -> i64
      %4812 = arith.cmpi ne, %4811, %4800 : i64
      %4813 = arith.cmpi eq, %4810, %4800 : i64
      %4814 = arith.andi %4812, %4813 : i1
      %4815 = scf.if %4814 -> (i64) {
        scf.yield %4755 : i64
      } else {
        scf.yield %4810 : i64
      }
      %4816 = func.call @cc_errorp(%4767) : (i64) -> i64
      %4817 = arith.cmpi ne, %4816, %4800 : i64
      %4818 = arith.cmpi eq, %4815, %4800 : i64
      %4819 = arith.andi %4817, %4818 : i1
      %4820 = scf.if %4819 -> (i64) {
        scf.yield %4767 : i64
      } else {
        scf.yield %4815 : i64
      }
      %4821 = func.call @cc_errorp(%4778) : (i64) -> i64
      %4822 = arith.cmpi ne, %4821, %4800 : i64
      %4823 = arith.cmpi eq, %4820, %4800 : i64
      %4824 = arith.andi %4822, %4823 : i1
      %4825 = scf.if %4824 -> (i64) {
        scf.yield %4778 : i64
      } else {
        scf.yield %4820 : i64
      }
      %4826 = func.call @cc_errorp(%4779) : (i64) -> i64
      %4827 = arith.cmpi ne, %4826, %4800 : i64
      %4828 = arith.cmpi eq, %4825, %4800 : i64
      %4829 = arith.andi %4827, %4828 : i1
      %4830 = scf.if %4829 -> (i64) {
        scf.yield %4779 : i64
      } else {
        scf.yield %4825 : i64
      }
      %4831 = func.call @cc_errorp(%4790) : (i64) -> i64
      %4832 = arith.cmpi ne, %4831, %4800 : i64
      %4833 = arith.cmpi eq, %4830, %4800 : i64
      %4834 = arith.andi %4832, %4833 : i1
      %4835 = scf.if %4834 -> (i64) {
        scf.yield %4790 : i64
      } else {
        scf.yield %4830 : i64
      }
      %4836 = func.call @cc_errorp(%4799) : (i64) -> i64
      %4837 = arith.cmpi ne, %4836, %4800 : i64
      %4838 = arith.cmpi eq, %4835, %4800 : i64
      %4839 = arith.andi %4837, %4838 : i1
      %4840 = scf.if %4839 -> (i64) {
        scf.yield %4799 : i64
      } else {
        scf.yield %4835 : i64
      }
      %4841 = arith.cmpi ne, %4840, %4800 : i64
      scf.if %4841 {
        func.call @stack_push_pointer(%4840) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4624) : (i64) -> ()
        func.call @stack_push_pointer(%4709) : (i64) -> ()
        func.call @stack_push_pointer(%4755) : (i64) -> ()
        func.call @stack_push_pointer(%4767) : (i64) -> ()
        func.call @stack_push_pointer(%4778) : (i64) -> ()
        func.call @stack_push_pointer(%4779) : (i64) -> ()
        func.call @stack_push_pointer(%4790) : (i64) -> ()
        func.call @stack_push_pointer(%4799) : (i64) -> ()
        %4842 = llvm.mlir.addressof @str374 : !llvm.ptr
        %4843 = func.call @cc_make_function_ref_const(%4842) : (!llvm.ptr) -> i64
        %4844 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4843, %4844) : (i64, i64) -> ()
      }
      %4845 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4845 : i64
    }
    %4846 = func.call @cc_nil_value() : () -> i64
    %4847 = func.call @cc_errorp(%4615) : (i64) -> i64
    %4848 = arith.cmpi ne, %4847, %4846 : i64
    %4849 = scf.if %4848 -> (i64) {
      scf.yield %4615 : i64
    } else {
      %4850 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4851 = arith.constant 12 : i64
      %4852 = func.call @cc_make_string(%4850, %4851) : (!llvm.ptr, i64) -> i64
      %4853 = func.call @cc_nil_value() : () -> i64
      %4854 = func.call @cc_intern(%4852, %4853) : (i64, i64) -> i64
      %4855 = func.call @cc_nil_value() : () -> i64
      %4856 = func.call @cc_cons(%4854, %4855) : (i64, i64) -> i64
      %4857 = func.call @cc_values_pack(%4856) : (i64) -> i64
      func.call @stack_push_pointer(%4854) : (i64) -> ()
      %4858 = func.call @stack_pop_pointer() : () -> i64
      %4859 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4860 = arith.constant 3 : i64
      %4861 = func.call @cc_make_string(%4859, %4860) : (!llvm.ptr, i64) -> i64
      %4862 = func.call @cc_nil_value() : () -> i64
      %4863 = func.call @cc_intern(%4861, %4862) : (i64, i64) -> i64
      %4864 = func.call @cc_nil_value() : () -> i64
      %4865 = func.call @cc_cons(%4863, %4864) : (i64, i64) -> i64
      %4866 = func.call @cc_values_pack(%4865) : (i64) -> i64
      func.call @stack_push_pointer(%4863) : (i64) -> ()
      %4867 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4868 = arith.constant 3 : i64
      %4869 = func.call @cc_make_string(%4867, %4868) : (!llvm.ptr, i64) -> i64
      %4870 = func.call @cc_nil_value() : () -> i64
      %4871 = func.call @cc_intern(%4869, %4870) : (i64, i64) -> i64
      %4872 = func.call @cc_nil_value() : () -> i64
      %4873 = func.call @cc_cons(%4871, %4872) : (i64, i64) -> i64
      %4874 = func.call @cc_values_pack(%4873) : (i64) -> i64
      func.call @stack_push_pointer(%4871) : (i64) -> ()
      %4875 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4876 = arith.constant 4 : i64
      %4877 = func.call @cc_make_string(%4875, %4876) : (!llvm.ptr, i64) -> i64
      %4878 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4879 = arith.constant 11 : i64
      %4880 = func.call @cc_make_string(%4878, %4879) : (!llvm.ptr, i64) -> i64
      %4881 = func.call @cc_intern(%4877, %4880) : (i64, i64) -> i64
      %4882 = func.call @cc_nil_value() : () -> i64
      %4883 = func.call @cc_cons(%4881, %4882) : (i64, i64) -> i64
      %4884 = func.call @cc_values_pack(%4883) : (i64) -> i64
      func.call @stack_push_pointer(%4881) : (i64) -> ()
      %4885 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4886 = arith.constant 3 : i64
      %4887 = func.call @cc_make_string(%4885, %4886) : (!llvm.ptr, i64) -> i64
      %4888 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4889 = arith.constant 11 : i64
      %4890 = func.call @cc_make_string(%4888, %4889) : (!llvm.ptr, i64) -> i64
      %4891 = func.call @cc_intern(%4887, %4890) : (i64, i64) -> i64
      %4892 = func.call @cc_nil_value() : () -> i64
      %4893 = func.call @cc_cons(%4891, %4892) : (i64, i64) -> i64
      %4894 = func.call @cc_values_pack(%4893) : (i64) -> i64
      func.call @stack_push_pointer(%4891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4895 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4895) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4896 = func.call @stack_pop_pointer() : () -> i64
      %4897 = func.call @stack_pop_pointer() : () -> i64
      %4898 = func.call @cc_cons(%4897, %4896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4898) : (i64) -> ()
      %4899 = func.call @stack_pop_pointer() : () -> i64
      %4900 = func.call @stack_pop_pointer() : () -> i64
      %4901 = func.call @cc_cons(%4900, %4899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4901) : (i64) -> ()
      %4902 = func.call @stack_pop_pointer() : () -> i64
      %4903 = func.call @stack_pop_pointer() : () -> i64
      %4904 = func.call @cc_cons(%4903, %4902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4904) : (i64) -> ()
      %4905 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4906 = func.call @stack_pop_pointer() : () -> i64
      %4907 = func.call @stack_pop_pointer() : () -> i64
      %4908 = func.call @cc_cons(%4907, %4906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4908) : (i64) -> ()
      %4909 = func.call @stack_pop_pointer() : () -> i64
      %4910 = func.call @stack_pop_pointer() : () -> i64
      %4911 = func.call @cc_cons(%4910, %4909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4911) : (i64) -> ()
      %4912 = func.call @stack_pop_pointer() : () -> i64
      %4913 = func.call @stack_pop_pointer() : () -> i64
      %4914 = func.call @cc_cons(%4913, %4912) : (i64, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %4921 = func.call @stack_pop_pointer() : () -> i64
      %4922 = func.call @stack_pop_pointer() : () -> i64
      %4923 = func.call @cc_cons(%4922, %4921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4923) : (i64) -> ()
      %4924 = func.call @stack_pop_pointer() : () -> i64
      %4925 = func.call @stack_pop_pointer() : () -> i64
      %4926 = func.call @cc_cons(%4925, %4924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4926) : (i64) -> ()
      %4927 = func.call @stack_pop_pointer() : () -> i64
      %4950 = arith.constant 116254966808594 : i64
      %4951 = arith.constant 0 : i64
      %4952 = func.call @cc_make_closure(%4950, %4951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4952) : (i64) -> ()
      %4953 = func.call @stack_pop_pointer() : () -> i64
      %4954 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4955 = arith.constant 1 : i64
      %4956 = func.call @cc_make_string(%4954, %4955) : (!llvm.ptr, i64) -> i64
      %4957 = func.call @cc_nil_value() : () -> i64
      %4958 = func.call @cc_intern(%4956, %4957) : (i64, i64) -> i64
      %4959 = func.call @cc_nil_value() : () -> i64
      %4960 = func.call @cc_cons(%4958, %4959) : (i64, i64) -> i64
      %4961 = func.call @cc_values_pack(%4960) : (i64) -> i64
      func.call @stack_push_pointer(%4958) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4962 = func.call @stack_pop_pointer() : () -> i64
      %4963 = func.call @stack_pop_pointer() : () -> i64
      %4964 = func.call @cc_cons(%4963, %4962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4964) : (i64) -> ()
      %4965 = func.call @stack_pop_pointer() : () -> i64
      %4966 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4967 = arith.constant 11 : i64
      %4968 = func.call @cc_make_string(%4966, %4967) : (!llvm.ptr, i64) -> i64
      %4969 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4970 = arith.constant 7 : i64
      %4971 = func.call @cc_make_string(%4969, %4970) : (!llvm.ptr, i64) -> i64
      %4972 = func.call @cc_intern(%4968, %4971) : (i64, i64) -> i64
      %4973 = func.call @cc_nil_value() : () -> i64
      %4974 = func.call @cc_cons(%4972, %4973) : (i64, i64) -> i64
      %4975 = func.call @cc_values_pack(%4974) : (i64) -> i64
      func.call @stack_push_pointer(%4972) : (i64) -> ()
      %4976 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4977 = func.call @stack_pop_pointer() : () -> i64
      %4978 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4979 = arith.constant 4 : i64
      %4980 = func.call @cc_make_string(%4978, %4979) : (!llvm.ptr, i64) -> i64
      %4981 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4982 = arith.constant 7 : i64
      %4983 = func.call @cc_make_string(%4981, %4982) : (!llvm.ptr, i64) -> i64
      %4984 = func.call @cc_intern(%4980, %4983) : (i64, i64) -> i64
      %4985 = func.call @cc_nil_value() : () -> i64
      %4986 = func.call @cc_cons(%4984, %4985) : (i64, i64) -> i64
      %4987 = func.call @cc_values_pack(%4986) : (i64) -> i64
      func.call @stack_push_pointer(%4984) : (i64) -> ()
      %4988 = func.call @stack_pop_pointer() : () -> i64
      %4989 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4990 = arith.constant 6 : i64
      %4991 = func.call @cc_make_string(%4989, %4990) : (!llvm.ptr, i64) -> i64
      %4992 = func.call @cc_nil_value() : () -> i64
      %4993 = func.call @cc_intern(%4991, %4992) : (i64, i64) -> i64
      %4994 = func.call @cc_nil_value() : () -> i64
      %4995 = func.call @cc_cons(%4993, %4994) : (i64, i64) -> i64
      %4996 = func.call @cc_values_pack(%4995) : (i64) -> i64
      func.call @stack_push_pointer(%4993) : (i64) -> ()
      %4997 = func.call @stack_pop_pointer() : () -> i64
      %4998 = func.call @cc_nil_value() : () -> i64
      %4999 = func.call @cc_errorp(%4858) : (i64) -> i64
      %5000 = arith.cmpi ne, %4999, %4998 : i64
      %5001 = arith.cmpi eq, %4998, %4998 : i64
      %5002 = arith.andi %5000, %5001 : i1
      %5003 = scf.if %5002 -> (i64) {
        scf.yield %4858 : i64
      } else {
        scf.yield %4998 : i64
      }
      %5004 = func.call @cc_errorp(%4927) : (i64) -> i64
      %5005 = arith.cmpi ne, %5004, %4998 : i64
      %5006 = arith.cmpi eq, %5003, %4998 : i64
      %5007 = arith.andi %5005, %5006 : i1
      %5008 = scf.if %5007 -> (i64) {
        scf.yield %4927 : i64
      } else {
        scf.yield %5003 : i64
      }
      %5009 = func.call @cc_errorp(%4953) : (i64) -> i64
      %5010 = arith.cmpi ne, %5009, %4998 : i64
      %5011 = arith.cmpi eq, %5008, %4998 : i64
      %5012 = arith.andi %5010, %5011 : i1
      %5013 = scf.if %5012 -> (i64) {
        scf.yield %4953 : i64
      } else {
        scf.yield %5008 : i64
      }
      %5014 = func.call @cc_errorp(%4965) : (i64) -> i64
      %5015 = arith.cmpi ne, %5014, %4998 : i64
      %5016 = arith.cmpi eq, %5013, %4998 : i64
      %5017 = arith.andi %5015, %5016 : i1
      %5018 = scf.if %5017 -> (i64) {
        scf.yield %4965 : i64
      } else {
        scf.yield %5013 : i64
      }
      %5019 = func.call @cc_errorp(%4976) : (i64) -> i64
      %5020 = arith.cmpi ne, %5019, %4998 : i64
      %5021 = arith.cmpi eq, %5018, %4998 : i64
      %5022 = arith.andi %5020, %5021 : i1
      %5023 = scf.if %5022 -> (i64) {
        scf.yield %4976 : i64
      } else {
        scf.yield %5018 : i64
      }
      %5024 = func.call @cc_errorp(%4977) : (i64) -> i64
      %5025 = arith.cmpi ne, %5024, %4998 : i64
      %5026 = arith.cmpi eq, %5023, %4998 : i64
      %5027 = arith.andi %5025, %5026 : i1
      %5028 = scf.if %5027 -> (i64) {
        scf.yield %4977 : i64
      } else {
        scf.yield %5023 : i64
      }
      %5029 = func.call @cc_errorp(%4988) : (i64) -> i64
      %5030 = arith.cmpi ne, %5029, %4998 : i64
      %5031 = arith.cmpi eq, %5028, %4998 : i64
      %5032 = arith.andi %5030, %5031 : i1
      %5033 = scf.if %5032 -> (i64) {
        scf.yield %4988 : i64
      } else {
        scf.yield %5028 : i64
      }
      %5034 = func.call @cc_errorp(%4997) : (i64) -> i64
      %5035 = arith.cmpi ne, %5034, %4998 : i64
      %5036 = arith.cmpi eq, %5033, %4998 : i64
      %5037 = arith.andi %5035, %5036 : i1
      %5038 = scf.if %5037 -> (i64) {
        scf.yield %4997 : i64
      } else {
        scf.yield %5033 : i64
      }
      %5039 = arith.cmpi ne, %5038, %4998 : i64
      scf.if %5039 {
        func.call @stack_push_pointer(%5038) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4858) : (i64) -> ()
        func.call @stack_push_pointer(%4927) : (i64) -> ()
        func.call @stack_push_pointer(%4953) : (i64) -> ()
        func.call @stack_push_pointer(%4965) : (i64) -> ()
        func.call @stack_push_pointer(%4976) : (i64) -> ()
        func.call @stack_push_pointer(%4977) : (i64) -> ()
        func.call @stack_push_pointer(%4988) : (i64) -> ()
        func.call @stack_push_pointer(%4997) : (i64) -> ()
        %5040 = llvm.mlir.addressof @str389 : !llvm.ptr
        %5041 = func.call @cc_make_function_ref_const(%5040) : (!llvm.ptr) -> i64
        %5042 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5041, %5042) : (i64, i64) -> ()
      }
      %5043 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5043 : i64
    }
    %5044 = func.call @cc_nil_value() : () -> i64
    %5045 = func.call @cc_errorp(%4849) : (i64) -> i64
    %5046 = arith.cmpi ne, %5045, %5044 : i64
    %5047 = scf.if %5046 -> (i64) {
      scf.yield %4849 : i64
    } else {
      %5048 = llvm.mlir.addressof @str390 : !llvm.ptr
      %5049 = arith.constant 32 : i64
      %5050 = func.call @cc_make_string(%5048, %5049) : (!llvm.ptr, i64) -> i64
      %5051 = func.call @cc_nil_value() : () -> i64
      %5052 = func.call @cc_intern(%5050, %5051) : (i64, i64) -> i64
      %5053 = func.call @cc_nil_value() : () -> i64
      %5054 = func.call @cc_cons(%5052, %5053) : (i64, i64) -> i64
      %5055 = func.call @cc_values_pack(%5054) : (i64) -> i64
      func.call @stack_push_pointer(%5052) : (i64) -> ()
      %5056 = func.call @stack_pop_pointer() : () -> i64
      %5057 = llvm.mlir.addressof @str391 : !llvm.ptr
      %5058 = arith.constant 3 : i64
      %5059 = func.call @cc_make_string(%5057, %5058) : (!llvm.ptr, i64) -> i64
      %5060 = func.call @cc_nil_value() : () -> i64
      %5061 = func.call @cc_intern(%5059, %5060) : (i64, i64) -> i64
      %5062 = func.call @cc_nil_value() : () -> i64
      %5063 = func.call @cc_cons(%5061, %5062) : (i64, i64) -> i64
      %5064 = func.call @cc_values_pack(%5063) : (i64) -> i64
      func.call @stack_push_pointer(%5061) : (i64) -> ()
      %5065 = llvm.mlir.addressof @str392 : !llvm.ptr
      %5066 = arith.constant 3 : i64
      %5067 = func.call @cc_make_string(%5065, %5066) : (!llvm.ptr, i64) -> i64
      %5068 = func.call @cc_nil_value() : () -> i64
      %5069 = func.call @cc_intern(%5067, %5068) : (i64, i64) -> i64
      %5070 = func.call @cc_nil_value() : () -> i64
      %5071 = func.call @cc_cons(%5069, %5070) : (i64, i64) -> i64
      %5072 = func.call @cc_values_pack(%5071) : (i64) -> i64
      func.call @stack_push_pointer(%5069) : (i64) -> ()
      %5073 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%5073) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5074 = func.call @stack_pop_pointer() : () -> i64
      %5075 = func.call @stack_pop_pointer() : () -> i64
      %5076 = func.call @cc_cons(%5075, %5074) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5076) : (i64) -> ()
      %5077 = func.call @stack_pop_pointer() : () -> i64
      %5078 = func.call @stack_pop_pointer() : () -> i64
      %5079 = func.call @cc_cons(%5078, %5077) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5079) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5080 = func.call @stack_pop_pointer() : () -> i64
      %5081 = func.call @stack_pop_pointer() : () -> i64
      %5082 = func.call @cc_cons(%5081, %5080) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5082) : (i64) -> ()
      %5083 = llvm.mlir.addressof @str393 : !llvm.ptr
      %5084 = arith.constant 19 : i64
      %5085 = func.call @cc_make_string(%5083, %5084) : (!llvm.ptr, i64) -> i64
      %5086 = llvm.mlir.addressof @str394 : !llvm.ptr
      %5087 = arith.constant 11 : i64
      %5088 = func.call @cc_make_string(%5086, %5087) : (!llvm.ptr, i64) -> i64
      %5089 = func.call @cc_intern(%5085, %5088) : (i64, i64) -> i64
      %5090 = func.call @cc_nil_value() : () -> i64
      %5091 = func.call @cc_cons(%5089, %5090) : (i64, i64) -> i64
      %5092 = func.call @cc_values_pack(%5091) : (i64) -> i64
      func.call @stack_push_pointer(%5089) : (i64) -> ()
      %5093 = llvm.mlir.addressof @str395 : !llvm.ptr
      %5094 = arith.constant 3 : i64
      %5095 = func.call @cc_make_string(%5093, %5094) : (!llvm.ptr, i64) -> i64
      %5096 = func.call @cc_nil_value() : () -> i64
      %5097 = func.call @cc_intern(%5095, %5096) : (i64, i64) -> i64
      %5098 = func.call @cc_nil_value() : () -> i64
      %5099 = func.call @cc_cons(%5097, %5098) : (i64, i64) -> i64
      %5100 = func.call @cc_values_pack(%5099) : (i64) -> i64
      func.call @stack_push_pointer(%5097) : (i64) -> ()
      %5101 = llvm.mlir.addressof @str396 : !llvm.ptr
      %5102 = arith.constant 12 : i64
      %5103 = func.call @cc_make_string(%5101, %5102) : (!llvm.ptr, i64) -> i64
      %5104 = llvm.mlir.addressof @str397 : !llvm.ptr
      %5105 = arith.constant 11 : i64
      %5106 = func.call @cc_make_string(%5104, %5105) : (!llvm.ptr, i64) -> i64
      %5107 = func.call @cc_intern(%5103, %5106) : (i64, i64) -> i64
      %5108 = func.call @cc_nil_value() : () -> i64
      %5109 = func.call @cc_cons(%5107, %5108) : (i64, i64) -> i64
      %5110 = func.call @cc_values_pack(%5109) : (i64) -> i64
      func.call @stack_push_pointer(%5107) : (i64) -> ()
      %5111 = llvm.mlir.addressof @str398 : !llvm.ptr
      %5112 = arith.constant 2 : i64
      %5113 = func.call @cc_make_string(%5111, %5112) : (!llvm.ptr, i64) -> i64
      %5114 = llvm.mlir.addressof @str399 : !llvm.ptr
      %5115 = arith.constant 7 : i64
      %5116 = func.call @cc_make_string(%5114, %5115) : (!llvm.ptr, i64) -> i64
      %5117 = func.call @cc_intern(%5113, %5116) : (i64, i64) -> i64
      %5118 = func.call @cc_nil_value() : () -> i64
      %5119 = func.call @cc_cons(%5117, %5118) : (i64, i64) -> i64
      %5120 = func.call @cc_values_pack(%5119) : (i64) -> i64
      func.call @stack_push_pointer(%5117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5121 = func.call @stack_pop_pointer() : () -> i64
      %5122 = func.call @stack_pop_pointer() : () -> i64
      %5123 = func.call @cc_cons(%5122, %5121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5123) : (i64) -> ()
      %5124 = func.call @stack_pop_pointer() : () -> i64
      %5125 = func.call @stack_pop_pointer() : () -> i64
      %5126 = func.call @cc_cons(%5125, %5124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5126) : (i64) -> ()
      %5127 = llvm.mlir.addressof @str400 : !llvm.ptr
      %5128 = arith.constant 3 : i64
      %5129 = func.call @cc_make_string(%5127, %5128) : (!llvm.ptr, i64) -> i64
      %5130 = func.call @cc_nil_value() : () -> i64
      %5131 = func.call @cc_intern(%5129, %5130) : (i64, i64) -> i64
      %5132 = func.call @cc_nil_value() : () -> i64
      %5133 = func.call @cc_cons(%5131, %5132) : (i64, i64) -> i64
      %5134 = func.call @cc_values_pack(%5133) : (i64) -> i64
      func.call @stack_push_pointer(%5131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5135 = func.call @stack_pop_pointer() : () -> i64
      %5136 = func.call @stack_pop_pointer() : () -> i64
      %5137 = func.call @cc_cons(%5136, %5135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5137) : (i64) -> ()
      %5138 = func.call @stack_pop_pointer() : () -> i64
      %5139 = func.call @stack_pop_pointer() : () -> i64
      %5140 = func.call @cc_cons(%5139, %5138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5140) : (i64) -> ()
      %5141 = func.call @stack_pop_pointer() : () -> i64
      %5142 = func.call @stack_pop_pointer() : () -> i64
      %5143 = func.call @cc_cons(%5142, %5141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5143) : (i64) -> ()
      %5144 = llvm.mlir.addressof @str401 : !llvm.ptr
      %5145 = arith.constant 7 : i64
      %5146 = func.call @cc_make_string(%5144, %5145) : (!llvm.ptr, i64) -> i64
      %5147 = llvm.mlir.addressof @str402 : !llvm.ptr
      %5148 = arith.constant 11 : i64
      %5149 = func.call @cc_make_string(%5147, %5148) : (!llvm.ptr, i64) -> i64
      %5150 = func.call @cc_intern(%5146, %5149) : (i64, i64) -> i64
      %5151 = func.call @cc_nil_value() : () -> i64
      %5152 = func.call @cc_cons(%5150, %5151) : (i64, i64) -> i64
      %5153 = func.call @cc_values_pack(%5152) : (i64) -> i64
      func.call @stack_push_pointer(%5150) : (i64) -> ()
      %5154 = llvm.mlir.addressof @str403 : !llvm.ptr
      %5155 = arith.constant 6 : i64
      %5156 = func.call @cc_make_string(%5154, %5155) : (!llvm.ptr, i64) -> i64
      %5157 = llvm.mlir.addressof @str404 : !llvm.ptr
      %5158 = arith.constant 11 : i64
      %5159 = func.call @cc_make_string(%5157, %5158) : (!llvm.ptr, i64) -> i64
      %5160 = func.call @cc_intern(%5156, %5159) : (i64, i64) -> i64
      %5161 = func.call @cc_nil_value() : () -> i64
      %5162 = func.call @cc_cons(%5160, %5161) : (i64, i64) -> i64
      %5163 = func.call @cc_values_pack(%5162) : (i64) -> i64
      func.call @stack_push_pointer(%5160) : (i64) -> ()
      %5164 = llvm.mlir.addressof @str405 : !llvm.ptr
      %5165 = arith.constant 3 : i64
      %5166 = func.call @cc_make_string(%5164, %5165) : (!llvm.ptr, i64) -> i64
      %5167 = func.call @cc_nil_value() : () -> i64
      %5168 = func.call @cc_intern(%5166, %5167) : (i64, i64) -> i64
      %5169 = func.call @cc_nil_value() : () -> i64
      %5170 = func.call @cc_cons(%5168, %5169) : (i64, i64) -> i64
      %5171 = func.call @cc_values_pack(%5170) : (i64) -> i64
      func.call @stack_push_pointer(%5168) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5172 = func.call @stack_pop_pointer() : () -> i64
      %5173 = func.call @stack_pop_pointer() : () -> i64
      %5174 = func.call @cc_cons(%5173, %5172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5174) : (i64) -> ()
      %5175 = func.call @stack_pop_pointer() : () -> i64
      %5176 = func.call @stack_pop_pointer() : () -> i64
      %5177 = func.call @cc_cons(%5176, %5175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5178 = func.call @stack_pop_pointer() : () -> i64
      %5179 = func.call @stack_pop_pointer() : () -> i64
      %5180 = func.call @cc_cons(%5179, %5178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5180) : (i64) -> ()
      %5181 = func.call @stack_pop_pointer() : () -> i64
      %5182 = func.call @stack_pop_pointer() : () -> i64
      %5183 = func.call @cc_cons(%5182, %5181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5183) : (i64) -> ()
      %5184 = llvm.mlir.addressof @str406 : !llvm.ptr
      %5185 = arith.constant 4 : i64
      %5186 = func.call @cc_make_string(%5184, %5185) : (!llvm.ptr, i64) -> i64
      %5187 = llvm.mlir.addressof @str407 : !llvm.ptr
      %5188 = arith.constant 11 : i64
      %5189 = func.call @cc_make_string(%5187, %5188) : (!llvm.ptr, i64) -> i64
      %5190 = func.call @cc_intern(%5186, %5189) : (i64, i64) -> i64
      %5191 = func.call @cc_nil_value() : () -> i64
      %5192 = func.call @cc_cons(%5190, %5191) : (i64, i64) -> i64
      %5193 = func.call @cc_values_pack(%5192) : (i64) -> i64
      func.call @stack_push_pointer(%5190) : (i64) -> ()
      %5194 = llvm.mlir.addressof @str408 : !llvm.ptr
      %5195 = arith.constant 3 : i64
      %5196 = func.call @cc_make_string(%5194, %5195) : (!llvm.ptr, i64) -> i64
      %5197 = func.call @cc_nil_value() : () -> i64
      %5198 = func.call @cc_intern(%5196, %5197) : (i64, i64) -> i64
      %5199 = func.call @cc_nil_value() : () -> i64
      %5200 = func.call @cc_cons(%5198, %5199) : (i64, i64) -> i64
      %5201 = func.call @cc_values_pack(%5200) : (i64) -> i64
      func.call @stack_push_pointer(%5198) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5202 = func.call @stack_pop_pointer() : () -> i64
      %5203 = func.call @stack_pop_pointer() : () -> i64
      %5204 = func.call @cc_cons(%5203, %5202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5204) : (i64) -> ()
      %5205 = func.call @stack_pop_pointer() : () -> i64
      %5206 = func.call @stack_pop_pointer() : () -> i64
      %5207 = func.call @cc_cons(%5206, %5205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5207) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5208 = func.call @stack_pop_pointer() : () -> i64
      %5209 = func.call @stack_pop_pointer() : () -> i64
      %5210 = func.call @cc_cons(%5209, %5208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5210) : (i64) -> ()
      %5211 = func.call @stack_pop_pointer() : () -> i64
      %5212 = func.call @stack_pop_pointer() : () -> i64
      %5213 = func.call @cc_cons(%5212, %5211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5213) : (i64) -> ()
      %5214 = func.call @stack_pop_pointer() : () -> i64
      %5215 = func.call @stack_pop_pointer() : () -> i64
      %5216 = func.call @cc_cons(%5215, %5214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5216) : (i64) -> ()
      %5217 = func.call @stack_pop_pointer() : () -> i64
      %5218 = func.call @stack_pop_pointer() : () -> i64
      %5219 = func.call @cc_cons(%5218, %5217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5219) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5220 = func.call @stack_pop_pointer() : () -> i64
      %5221 = func.call @stack_pop_pointer() : () -> i64
      %5222 = func.call @cc_cons(%5221, %5220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5222) : (i64) -> ()
      %5223 = func.call @stack_pop_pointer() : () -> i64
      %5224 = func.call @stack_pop_pointer() : () -> i64
      %5225 = func.call @cc_cons(%5224, %5223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5225) : (i64) -> ()
      %5226 = func.call @stack_pop_pointer() : () -> i64
      %5227 = func.call @stack_pop_pointer() : () -> i64
      %5228 = func.call @cc_cons(%5227, %5226) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5228) : (i64) -> ()
      %5229 = func.call @stack_pop_pointer() : () -> i64
      %5314 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5315 = arith.constant 32 : i64
      %5316 = func.call @cc_make_symbol(%5314, %5315) : (!llvm.ptr, i64) -> i64
      %5317 = func.call @cc_persistent_root_value(%5316) : (i64) -> i64
      func.call @stack_push_pointer(%5317) : (i64) -> ()
      %5318 = arith.constant 116254966808595 : i64
      %5319 = arith.constant 1 : i64
      %5320 = func.call @cc_make_closure(%5318, %5319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5320) : (i64) -> ()
      %5321 = func.call @stack_pop_pointer() : () -> i64
      %5322 = arith.constant 978 : i64
      func.call @stack_push_fixnum(%5322) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5323 = func.call @stack_pop_pointer() : () -> i64
      %5324 = func.call @stack_pop_pointer() : () -> i64
      %5325 = func.call @cc_cons(%5324, %5323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5325) : (i64) -> ()
      %5326 = func.call @stack_pop_pointer() : () -> i64
      %5327 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5328 = arith.constant 11 : i64
      %5329 = func.call @cc_make_string(%5327, %5328) : (!llvm.ptr, i64) -> i64
      %5330 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5331 = arith.constant 7 : i64
      %5332 = func.call @cc_make_string(%5330, %5331) : (!llvm.ptr, i64) -> i64
      %5333 = func.call @cc_intern(%5329, %5332) : (i64, i64) -> i64
      %5334 = func.call @cc_nil_value() : () -> i64
      %5335 = func.call @cc_cons(%5333, %5334) : (i64, i64) -> i64
      %5336 = func.call @cc_values_pack(%5335) : (i64) -> i64
      func.call @stack_push_pointer(%5333) : (i64) -> ()
      %5337 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5338 = func.call @stack_pop_pointer() : () -> i64
      %5339 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5340 = arith.constant 4 : i64
      %5341 = func.call @cc_make_string(%5339, %5340) : (!llvm.ptr, i64) -> i64
      %5342 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5343 = arith.constant 7 : i64
      %5344 = func.call @cc_make_string(%5342, %5343) : (!llvm.ptr, i64) -> i64
      %5345 = func.call @cc_intern(%5341, %5344) : (i64, i64) -> i64
      %5346 = func.call @cc_nil_value() : () -> i64
      %5347 = func.call @cc_cons(%5345, %5346) : (i64, i64) -> i64
      %5348 = func.call @cc_values_pack(%5347) : (i64) -> i64
      func.call @stack_push_pointer(%5345) : (i64) -> ()
      %5349 = func.call @stack_pop_pointer() : () -> i64
      %5350 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5351 = arith.constant 6 : i64
      %5352 = func.call @cc_make_string(%5350, %5351) : (!llvm.ptr, i64) -> i64
      %5353 = func.call @cc_nil_value() : () -> i64
      %5354 = func.call @cc_intern(%5352, %5353) : (i64, i64) -> i64
      %5355 = func.call @cc_nil_value() : () -> i64
      %5356 = func.call @cc_cons(%5354, %5355) : (i64, i64) -> i64
      %5357 = func.call @cc_values_pack(%5356) : (i64) -> i64
      func.call @stack_push_pointer(%5354) : (i64) -> ()
      %5358 = func.call @stack_pop_pointer() : () -> i64
      %5359 = func.call @cc_nil_value() : () -> i64
      %5360 = func.call @cc_errorp(%5056) : (i64) -> i64
      %5361 = arith.cmpi ne, %5360, %5359 : i64
      %5362 = arith.cmpi eq, %5359, %5359 : i64
      %5363 = arith.andi %5361, %5362 : i1
      %5364 = scf.if %5363 -> (i64) {
        scf.yield %5056 : i64
      } else {
        scf.yield %5359 : i64
      }
      %5365 = func.call @cc_errorp(%5229) : (i64) -> i64
      %5366 = arith.cmpi ne, %5365, %5359 : i64
      %5367 = arith.cmpi eq, %5364, %5359 : i64
      %5368 = arith.andi %5366, %5367 : i1
      %5369 = scf.if %5368 -> (i64) {
        scf.yield %5229 : i64
      } else {
        scf.yield %5364 : i64
      }
      %5370 = func.call @cc_errorp(%5321) : (i64) -> i64
      %5371 = arith.cmpi ne, %5370, %5359 : i64
      %5372 = arith.cmpi eq, %5369, %5359 : i64
      %5373 = arith.andi %5371, %5372 : i1
      %5374 = scf.if %5373 -> (i64) {
        scf.yield %5321 : i64
      } else {
        scf.yield %5369 : i64
      }
      %5375 = func.call @cc_errorp(%5326) : (i64) -> i64
      %5376 = arith.cmpi ne, %5375, %5359 : i64
      %5377 = arith.cmpi eq, %5374, %5359 : i64
      %5378 = arith.andi %5376, %5377 : i1
      %5379 = scf.if %5378 -> (i64) {
        scf.yield %5326 : i64
      } else {
        scf.yield %5374 : i64
      }
      %5380 = func.call @cc_errorp(%5337) : (i64) -> i64
      %5381 = arith.cmpi ne, %5380, %5359 : i64
      %5382 = arith.cmpi eq, %5379, %5359 : i64
      %5383 = arith.andi %5381, %5382 : i1
      %5384 = scf.if %5383 -> (i64) {
        scf.yield %5337 : i64
      } else {
        scf.yield %5379 : i64
      }
      %5385 = func.call @cc_errorp(%5338) : (i64) -> i64
      %5386 = arith.cmpi ne, %5385, %5359 : i64
      %5387 = arith.cmpi eq, %5384, %5359 : i64
      %5388 = arith.andi %5386, %5387 : i1
      %5389 = scf.if %5388 -> (i64) {
        scf.yield %5338 : i64
      } else {
        scf.yield %5384 : i64
      }
      %5390 = func.call @cc_errorp(%5349) : (i64) -> i64
      %5391 = arith.cmpi ne, %5390, %5359 : i64
      %5392 = arith.cmpi eq, %5389, %5359 : i64
      %5393 = arith.andi %5391, %5392 : i1
      %5394 = scf.if %5393 -> (i64) {
        scf.yield %5349 : i64
      } else {
        scf.yield %5389 : i64
      }
      %5395 = func.call @cc_errorp(%5358) : (i64) -> i64
      %5396 = arith.cmpi ne, %5395, %5359 : i64
      %5397 = arith.cmpi eq, %5394, %5359 : i64
      %5398 = arith.andi %5396, %5397 : i1
      %5399 = scf.if %5398 -> (i64) {
        scf.yield %5358 : i64
      } else {
        scf.yield %5394 : i64
      }
      %5400 = arith.cmpi ne, %5399, %5359 : i64
      scf.if %5400 {
        func.call @stack_push_pointer(%5399) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5056) : (i64) -> ()
        func.call @stack_push_pointer(%5229) : (i64) -> ()
        func.call @stack_push_pointer(%5321) : (i64) -> ()
        func.call @stack_push_pointer(%5326) : (i64) -> ()
        func.call @stack_push_pointer(%5337) : (i64) -> ()
        func.call @stack_push_pointer(%5338) : (i64) -> ()
        func.call @stack_push_pointer(%5349) : (i64) -> ()
        func.call @stack_push_pointer(%5358) : (i64) -> ()
        %5401 = llvm.mlir.addressof @str418 : !llvm.ptr
        %5402 = func.call @cc_make_function_ref_const(%5401) : (!llvm.ptr) -> i64
        %5403 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5402, %5403) : (i64, i64) -> ()
      }
      %5404 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5404 : i64
    }
    %5405 = func.call @cc_nil_value() : () -> i64
    %5406 = func.call @cc_errorp(%5047) : (i64) -> i64
    %5407 = arith.cmpi ne, %5406, %5405 : i64
    %5408 = scf.if %5407 -> (i64) {
      scf.yield %5047 : i64
    } else {
      %5409 = llvm.mlir.addressof @str419 : !llvm.ptr
      %5410 = arith.constant 9 : i64
      %5411 = func.call @cc_make_string(%5409, %5410) : (!llvm.ptr, i64) -> i64
      %5412 = func.call @cc_nil_value() : () -> i64
      %5413 = func.call @cc_intern(%5411, %5412) : (i64, i64) -> i64
      %5414 = func.call @cc_nil_value() : () -> i64
      %5415 = func.call @cc_cons(%5413, %5414) : (i64, i64) -> i64
      %5416 = func.call @cc_values_pack(%5415) : (i64) -> i64
      func.call @stack_push_pointer(%5413) : (i64) -> ()
      %5417 = func.call @stack_pop_pointer() : () -> i64
      %5418 = llvm.mlir.addressof @str420 : !llvm.ptr
      %5419 = arith.constant 3 : i64
      %5420 = func.call @cc_make_string(%5418, %5419) : (!llvm.ptr, i64) -> i64
      %5421 = func.call @cc_nil_value() : () -> i64
      %5422 = func.call @cc_intern(%5420, %5421) : (i64, i64) -> i64
      %5423 = func.call @cc_nil_value() : () -> i64
      %5424 = func.call @cc_cons(%5422, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_values_pack(%5424) : (i64) -> i64
      func.call @stack_push_pointer(%5422) : (i64) -> ()
      %5426 = llvm.mlir.addressof @str421 : !llvm.ptr
      %5427 = arith.constant 46 : i64
      %5428 = func.call @cc_make_string(%5426, %5427) : (!llvm.ptr, i64) -> i64
      %5429 = func.call @cc_nil_value() : () -> i64
      %5430 = func.call @cc_intern(%5428, %5429) : (i64, i64) -> i64
      %5431 = func.call @cc_nil_value() : () -> i64
      %5432 = func.call @cc_cons(%5430, %5431) : (i64, i64) -> i64
      %5433 = func.call @cc_values_pack(%5432) : (i64) -> i64
      func.call @stack_push_pointer(%5430) : (i64) -> ()
      %5434 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5434) : (i64) -> ()
      %5435 = llvm.mlir.addressof @str422 : !llvm.ptr
      %5436 = arith.constant 17 : i64
      %5437 = func.call @cc_make_string(%5435, %5436) : (!llvm.ptr, i64) -> i64
      %5438 = llvm.mlir.addressof @str423 : !llvm.ptr
      %5439 = arith.constant 11 : i64
      %5440 = func.call @cc_make_string(%5438, %5439) : (!llvm.ptr, i64) -> i64
      %5441 = func.call @cc_intern(%5437, %5440) : (i64, i64) -> i64
      %5442 = func.call @cc_nil_value() : () -> i64
      %5443 = func.call @cc_cons(%5441, %5442) : (i64, i64) -> i64
      %5444 = func.call @cc_values_pack(%5443) : (i64) -> i64
      func.call @stack_push_pointer(%5441) : (i64) -> ()
      %5445 = llvm.mlir.addressof @str424 : !llvm.ptr
      %5446 = arith.constant 4 : i64
      %5447 = func.call @cc_make_string(%5445, %5446) : (!llvm.ptr, i64) -> i64
      %5448 = llvm.mlir.addressof @str425 : !llvm.ptr
      %5449 = arith.constant 11 : i64
      %5450 = func.call @cc_make_string(%5448, %5449) : (!llvm.ptr, i64) -> i64
      %5451 = func.call @cc_intern(%5447, %5450) : (i64, i64) -> i64
      %5452 = func.call @cc_nil_value() : () -> i64
      %5453 = func.call @cc_cons(%5451, %5452) : (i64, i64) -> i64
      %5454 = func.call @cc_values_pack(%5453) : (i64) -> i64
      func.call @stack_push_pointer(%5451) : (i64) -> ()
      %5455 = llvm.mlir.addressof @str426 : !llvm.ptr
      %5456 = arith.constant 5 : i64
      %5457 = func.call @cc_make_string(%5455, %5456) : (!llvm.ptr, i64) -> i64
      %5458 = llvm.mlir.addressof @str427 : !llvm.ptr
      %5459 = arith.constant 11 : i64
      %5460 = func.call @cc_make_string(%5458, %5459) : (!llvm.ptr, i64) -> i64
      %5461 = func.call @cc_intern(%5457, %5460) : (i64, i64) -> i64
      %5462 = func.call @cc_nil_value() : () -> i64
      %5463 = func.call @cc_cons(%5461, %5462) : (i64, i64) -> i64
      %5464 = func.call @cc_values_pack(%5463) : (i64) -> i64
      func.call @stack_push_pointer(%5461) : (i64) -> ()
      %5465 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5466 = arith.constant 12 : i64
      %5467 = func.call @cc_make_string(%5465, %5466) : (!llvm.ptr, i64) -> i64
      %5468 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5469 = arith.constant 11 : i64
      %5470 = func.call @cc_make_string(%5468, %5469) : (!llvm.ptr, i64) -> i64
      %5471 = func.call @cc_intern(%5467, %5470) : (i64, i64) -> i64
      %5472 = func.call @cc_nil_value() : () -> i64
      %5473 = func.call @cc_cons(%5471, %5472) : (i64, i64) -> i64
      %5474 = func.call @cc_values_pack(%5473) : (i64) -> i64
      func.call @stack_push_pointer(%5471) : (i64) -> ()
      %5475 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5476 = arith.constant 4 : i64
      %5477 = func.call @cc_make_string(%5475, %5476) : (!llvm.ptr, i64) -> i64
      %5478 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5479 = arith.constant 11 : i64
      %5480 = func.call @cc_make_string(%5478, %5479) : (!llvm.ptr, i64) -> i64
      %5481 = func.call @cc_intern(%5477, %5480) : (i64, i64) -> i64
      %5482 = func.call @cc_nil_value() : () -> i64
      %5483 = func.call @cc_cons(%5481, %5482) : (i64, i64) -> i64
      %5484 = func.call @cc_values_pack(%5483) : (i64) -> i64
      func.call @stack_push_pointer(%5481) : (i64) -> ()
      %5485 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5486 = arith.constant 9 : i64
      %5487 = func.call @cc_make_string(%5485, %5486) : (!llvm.ptr, i64) -> i64
      %5488 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5489 = arith.constant 11 : i64
      %5490 = func.call @cc_make_string(%5488, %5489) : (!llvm.ptr, i64) -> i64
      %5491 = func.call @cc_intern(%5487, %5490) : (i64, i64) -> i64
      %5492 = func.call @cc_nil_value() : () -> i64
      %5493 = func.call @cc_cons(%5491, %5492) : (i64, i64) -> i64
      %5494 = func.call @cc_values_pack(%5493) : (i64) -> i64
      func.call @stack_push_pointer(%5491) : (i64) -> ()
      %5495 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5496 = arith.constant 5 : i64
      %5497 = func.call @cc_make_string(%5495, %5496) : (!llvm.ptr, i64) -> i64
      %5498 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5499 = arith.constant 11 : i64
      %5500 = func.call @cc_make_string(%5498, %5499) : (!llvm.ptr, i64) -> i64
      %5501 = func.call @cc_intern(%5497, %5500) : (i64, i64) -> i64
      %5502 = func.call @cc_nil_value() : () -> i64
      %5503 = func.call @cc_cons(%5501, %5502) : (i64, i64) -> i64
      %5504 = func.call @cc_values_pack(%5503) : (i64) -> i64
      func.call @stack_push_pointer(%5501) : (i64) -> ()
      %5505 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5506 = arith.constant 6 : i64
      %5507 = func.call @cc_make_string(%5505, %5506) : (!llvm.ptr, i64) -> i64
      %5508 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5509 = arith.constant 11 : i64
      %5510 = func.call @cc_make_string(%5508, %5509) : (!llvm.ptr, i64) -> i64
      %5511 = func.call @cc_intern(%5507, %5510) : (i64, i64) -> i64
      %5512 = func.call @cc_nil_value() : () -> i64
      %5513 = func.call @cc_cons(%5511, %5512) : (i64, i64) -> i64
      %5514 = func.call @cc_values_pack(%5513) : (i64) -> i64
      func.call @stack_push_pointer(%5511) : (i64) -> ()
      %5515 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5516 = arith.constant 2 : i64
      %5517 = func.call @cc_make_string(%5515, %5516) : (!llvm.ptr, i64) -> i64
      %5518 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5519 = arith.constant 11 : i64
      %5520 = func.call @cc_make_string(%5518, %5519) : (!llvm.ptr, i64) -> i64
      %5521 = func.call @cc_intern(%5517, %5520) : (i64, i64) -> i64
      %5522 = func.call @cc_nil_value() : () -> i64
      %5523 = func.call @cc_cons(%5521, %5522) : (i64, i64) -> i64
      %5524 = func.call @cc_values_pack(%5523) : (i64) -> i64
      func.call @stack_push_pointer(%5521) : (i64) -> ()
      %5525 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5526 = arith.constant 3 : i64
      %5527 = func.call @cc_make_string(%5525, %5526) : (!llvm.ptr, i64) -> i64
      %5528 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5529 = arith.constant 11 : i64
      %5530 = func.call @cc_make_string(%5528, %5529) : (!llvm.ptr, i64) -> i64
      %5531 = func.call @cc_intern(%5527, %5530) : (i64, i64) -> i64
      %5532 = func.call @cc_nil_value() : () -> i64
      %5533 = func.call @cc_cons(%5531, %5532) : (i64, i64) -> i64
      %5534 = func.call @cc_values_pack(%5533) : (i64) -> i64
      func.call @stack_push_pointer(%5531) : (i64) -> ()
      %5535 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5536 = arith.constant 18 : i64
      %5537 = func.call @cc_make_string(%5535, %5536) : (!llvm.ptr, i64) -> i64
      %5538 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5539 = arith.constant 11 : i64
      %5540 = func.call @cc_make_string(%5538, %5539) : (!llvm.ptr, i64) -> i64
      %5541 = func.call @cc_intern(%5537, %5540) : (i64, i64) -> i64
      %5542 = func.call @cc_nil_value() : () -> i64
      %5543 = func.call @cc_cons(%5541, %5542) : (i64, i64) -> i64
      %5544 = func.call @cc_values_pack(%5543) : (i64) -> i64
      func.call @stack_push_pointer(%5541) : (i64) -> ()
      %5545 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5546 = arith.constant 23 : i64
      %5547 = func.call @cc_make_string(%5545, %5546) : (!llvm.ptr, i64) -> i64
      %5548 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5549 = arith.constant 11 : i64
      %5550 = func.call @cc_make_string(%5548, %5549) : (!llvm.ptr, i64) -> i64
      %5551 = func.call @cc_intern(%5547, %5550) : (i64, i64) -> i64
      %5552 = func.call @cc_nil_value() : () -> i64
      %5553 = func.call @cc_cons(%5551, %5552) : (i64, i64) -> i64
      %5554 = func.call @cc_values_pack(%5553) : (i64) -> i64
      func.call @stack_push_pointer(%5551) : (i64) -> ()
      %5555 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5556 = arith.constant 23 : i64
      %5557 = func.call @cc_make_string(%5555, %5556) : (!llvm.ptr, i64) -> i64
      %5558 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5559 = arith.constant 11 : i64
      %5560 = func.call @cc_make_string(%5558, %5559) : (!llvm.ptr, i64) -> i64
      %5561 = func.call @cc_intern(%5557, %5560) : (i64, i64) -> i64
      %5562 = func.call @cc_nil_value() : () -> i64
      %5563 = func.call @cc_cons(%5561, %5562) : (i64, i64) -> i64
      %5564 = func.call @cc_values_pack(%5563) : (i64) -> i64
      func.call @stack_push_pointer(%5561) : (i64) -> ()
      %5565 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5566 = arith.constant 15 : i64
      %5567 = func.call @cc_make_string(%5565, %5566) : (!llvm.ptr, i64) -> i64
      %5568 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5569 = arith.constant 11 : i64
      %5570 = func.call @cc_make_string(%5568, %5569) : (!llvm.ptr, i64) -> i64
      %5571 = func.call @cc_intern(%5567, %5570) : (i64, i64) -> i64
      %5572 = func.call @cc_nil_value() : () -> i64
      %5573 = func.call @cc_cons(%5571, %5572) : (i64, i64) -> i64
      %5574 = func.call @cc_values_pack(%5573) : (i64) -> i64
      func.call @stack_push_pointer(%5571) : (i64) -> ()
      %5575 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5576 = arith.constant 17 : i64
      %5577 = func.call @cc_make_string(%5575, %5576) : (!llvm.ptr, i64) -> i64
      %5578 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5579 = arith.constant 11 : i64
      %5580 = func.call @cc_make_string(%5578, %5579) : (!llvm.ptr, i64) -> i64
      %5581 = func.call @cc_intern(%5577, %5580) : (i64, i64) -> i64
      %5582 = func.call @cc_nil_value() : () -> i64
      %5583 = func.call @cc_cons(%5581, %5582) : (i64, i64) -> i64
      %5584 = func.call @cc_values_pack(%5583) : (i64) -> i64
      func.call @stack_push_pointer(%5581) : (i64) -> ()
      %5585 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5586 = arith.constant 10 : i64
      %5587 = func.call @cc_make_string(%5585, %5586) : (!llvm.ptr, i64) -> i64
      %5588 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5589 = arith.constant 11 : i64
      %5590 = func.call @cc_make_string(%5588, %5589) : (!llvm.ptr, i64) -> i64
      %5591 = func.call @cc_intern(%5587, %5590) : (i64, i64) -> i64
      %5592 = func.call @cc_nil_value() : () -> i64
      %5593 = func.call @cc_cons(%5591, %5592) : (i64, i64) -> i64
      %5594 = func.call @cc_values_pack(%5593) : (i64) -> i64
      func.call @stack_push_pointer(%5591) : (i64) -> ()
      %5595 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5596 = arith.constant 15 : i64
      %5597 = func.call @cc_make_string(%5595, %5596) : (!llvm.ptr, i64) -> i64
      %5598 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5599 = arith.constant 11 : i64
      %5600 = func.call @cc_make_string(%5598, %5599) : (!llvm.ptr, i64) -> i64
      %5601 = func.call @cc_intern(%5597, %5600) : (i64, i64) -> i64
      %5602 = func.call @cc_nil_value() : () -> i64
      %5603 = func.call @cc_cons(%5601, %5602) : (i64, i64) -> i64
      %5604 = func.call @cc_values_pack(%5603) : (i64) -> i64
      func.call @stack_push_pointer(%5601) : (i64) -> ()
      %5605 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5606 = arith.constant 27 : i64
      %5607 = func.call @cc_make_string(%5605, %5606) : (!llvm.ptr, i64) -> i64
      %5608 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5609 = arith.constant 11 : i64
      %5610 = func.call @cc_make_string(%5608, %5609) : (!llvm.ptr, i64) -> i64
      %5611 = func.call @cc_intern(%5607, %5610) : (i64, i64) -> i64
      %5612 = func.call @cc_nil_value() : () -> i64
      %5613 = func.call @cc_cons(%5611, %5612) : (i64, i64) -> i64
      %5614 = func.call @cc_values_pack(%5613) : (i64) -> i64
      func.call @stack_push_pointer(%5611) : (i64) -> ()
      %5615 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5616 = arith.constant 14 : i64
      %5617 = func.call @cc_make_string(%5615, %5616) : (!llvm.ptr, i64) -> i64
      %5618 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5619 = arith.constant 11 : i64
      %5620 = func.call @cc_make_string(%5618, %5619) : (!llvm.ptr, i64) -> i64
      %5621 = func.call @cc_intern(%5617, %5620) : (i64, i64) -> i64
      %5622 = func.call @cc_nil_value() : () -> i64
      %5623 = func.call @cc_cons(%5621, %5622) : (i64, i64) -> i64
      %5624 = func.call @cc_values_pack(%5623) : (i64) -> i64
      func.call @stack_push_pointer(%5621) : (i64) -> ()
      %5625 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5626 = arith.constant 10 : i64
      %5627 = func.call @cc_make_string(%5625, %5626) : (!llvm.ptr, i64) -> i64
      %5628 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5629 = arith.constant 11 : i64
      %5630 = func.call @cc_make_string(%5628, %5629) : (!llvm.ptr, i64) -> i64
      %5631 = func.call @cc_intern(%5627, %5630) : (i64, i64) -> i64
      %5632 = func.call @cc_nil_value() : () -> i64
      %5633 = func.call @cc_cons(%5631, %5632) : (i64, i64) -> i64
      %5634 = func.call @cc_values_pack(%5633) : (i64) -> i64
      func.call @stack_push_pointer(%5631) : (i64) -> ()
      %5635 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5636 = arith.constant 16 : i64
      %5637 = func.call @cc_make_string(%5635, %5636) : (!llvm.ptr, i64) -> i64
      %5638 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5639 = arith.constant 11 : i64
      %5640 = func.call @cc_make_string(%5638, %5639) : (!llvm.ptr, i64) -> i64
      %5641 = func.call @cc_intern(%5637, %5640) : (i64, i64) -> i64
      %5642 = func.call @cc_nil_value() : () -> i64
      %5643 = func.call @cc_cons(%5641, %5642) : (i64, i64) -> i64
      %5644 = func.call @cc_values_pack(%5643) : (i64) -> i64
      func.call @stack_push_pointer(%5641) : (i64) -> ()
      %5645 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5646 = arith.constant 15 : i64
      %5647 = func.call @cc_make_string(%5645, %5646) : (!llvm.ptr, i64) -> i64
      %5648 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5649 = arith.constant 11 : i64
      %5650 = func.call @cc_make_string(%5648, %5649) : (!llvm.ptr, i64) -> i64
      %5651 = func.call @cc_intern(%5647, %5650) : (i64, i64) -> i64
      %5652 = func.call @cc_nil_value() : () -> i64
      %5653 = func.call @cc_cons(%5651, %5652) : (i64, i64) -> i64
      %5654 = func.call @cc_values_pack(%5653) : (i64) -> i64
      func.call @stack_push_pointer(%5651) : (i64) -> ()
      %5655 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5656 = arith.constant 12 : i64
      %5657 = func.call @cc_make_string(%5655, %5656) : (!llvm.ptr, i64) -> i64
      %5658 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5659 = arith.constant 11 : i64
      %5660 = func.call @cc_make_string(%5658, %5659) : (!llvm.ptr, i64) -> i64
      %5661 = func.call @cc_intern(%5657, %5660) : (i64, i64) -> i64
      %5662 = func.call @cc_nil_value() : () -> i64
      %5663 = func.call @cc_cons(%5661, %5662) : (i64, i64) -> i64
      %5664 = func.call @cc_values_pack(%5663) : (i64) -> i64
      func.call @stack_push_pointer(%5661) : (i64) -> ()
      %5665 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5666 = arith.constant 15 : i64
      %5667 = func.call @cc_make_string(%5665, %5666) : (!llvm.ptr, i64) -> i64
      %5668 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5669 = arith.constant 11 : i64
      %5670 = func.call @cc_make_string(%5668, %5669) : (!llvm.ptr, i64) -> i64
      %5671 = func.call @cc_intern(%5667, %5670) : (i64, i64) -> i64
      %5672 = func.call @cc_nil_value() : () -> i64
      %5673 = func.call @cc_cons(%5671, %5672) : (i64, i64) -> i64
      %5674 = func.call @cc_values_pack(%5673) : (i64) -> i64
      func.call @stack_push_pointer(%5671) : (i64) -> ()
      %5675 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5676 = arith.constant 14 : i64
      %5677 = func.call @cc_make_string(%5675, %5676) : (!llvm.ptr, i64) -> i64
      %5678 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5679 = arith.constant 11 : i64
      %5680 = func.call @cc_make_string(%5678, %5679) : (!llvm.ptr, i64) -> i64
      %5681 = func.call @cc_intern(%5677, %5680) : (i64, i64) -> i64
      %5682 = func.call @cc_nil_value() : () -> i64
      %5683 = func.call @cc_cons(%5681, %5682) : (i64, i64) -> i64
      %5684 = func.call @cc_values_pack(%5683) : (i64) -> i64
      func.call @stack_push_pointer(%5681) : (i64) -> ()
      %5685 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5686 = arith.constant 18 : i64
      %5687 = func.call @cc_make_string(%5685, %5686) : (!llvm.ptr, i64) -> i64
      %5688 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5689 = arith.constant 11 : i64
      %5690 = func.call @cc_make_string(%5688, %5689) : (!llvm.ptr, i64) -> i64
      %5691 = func.call @cc_intern(%5687, %5690) : (i64, i64) -> i64
      %5692 = func.call @cc_nil_value() : () -> i64
      %5693 = func.call @cc_cons(%5691, %5692) : (i64, i64) -> i64
      %5694 = func.call @cc_values_pack(%5693) : (i64) -> i64
      func.call @stack_push_pointer(%5691) : (i64) -> ()
      %5695 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5696 = arith.constant 9 : i64
      %5697 = func.call @cc_make_string(%5695, %5696) : (!llvm.ptr, i64) -> i64
      %5698 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5699 = arith.constant 11 : i64
      %5700 = func.call @cc_make_string(%5698, %5699) : (!llvm.ptr, i64) -> i64
      %5701 = func.call @cc_intern(%5697, %5700) : (i64, i64) -> i64
      %5702 = func.call @cc_nil_value() : () -> i64
      %5703 = func.call @cc_cons(%5701, %5702) : (i64, i64) -> i64
      %5704 = func.call @cc_values_pack(%5703) : (i64) -> i64
      func.call @stack_push_pointer(%5701) : (i64) -> ()
      %5705 = llvm.mlir.addressof @str476 : !llvm.ptr
      %5706 = arith.constant 9 : i64
      %5707 = func.call @cc_make_string(%5705, %5706) : (!llvm.ptr, i64) -> i64
      %5708 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5709 = arith.constant 11 : i64
      %5710 = func.call @cc_make_string(%5708, %5709) : (!llvm.ptr, i64) -> i64
      %5711 = func.call @cc_intern(%5707, %5710) : (i64, i64) -> i64
      %5712 = func.call @cc_nil_value() : () -> i64
      %5713 = func.call @cc_cons(%5711, %5712) : (i64, i64) -> i64
      %5714 = func.call @cc_values_pack(%5713) : (i64) -> i64
      func.call @stack_push_pointer(%5711) : (i64) -> ()
      %5715 = llvm.mlir.addressof @str478 : !llvm.ptr
      %5716 = arith.constant 13 : i64
      %5717 = func.call @cc_make_string(%5715, %5716) : (!llvm.ptr, i64) -> i64
      %5718 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5719 = arith.constant 11 : i64
      %5720 = func.call @cc_make_string(%5718, %5719) : (!llvm.ptr, i64) -> i64
      %5721 = func.call @cc_intern(%5717, %5720) : (i64, i64) -> i64
      %5722 = func.call @cc_nil_value() : () -> i64
      %5723 = func.call @cc_cons(%5721, %5722) : (i64, i64) -> i64
      %5724 = func.call @cc_values_pack(%5723) : (i64) -> i64
      func.call @stack_push_pointer(%5721) : (i64) -> ()
      %5725 = llvm.mlir.addressof @str480 : !llvm.ptr
      %5726 = arith.constant 12 : i64
      %5727 = func.call @cc_make_string(%5725, %5726) : (!llvm.ptr, i64) -> i64
      %5728 = llvm.mlir.addressof @str481 : !llvm.ptr
      %5729 = arith.constant 11 : i64
      %5730 = func.call @cc_make_string(%5728, %5729) : (!llvm.ptr, i64) -> i64
      %5731 = func.call @cc_intern(%5727, %5730) : (i64, i64) -> i64
      %5732 = func.call @cc_nil_value() : () -> i64
      %5733 = func.call @cc_cons(%5731, %5732) : (i64, i64) -> i64
      %5734 = func.call @cc_values_pack(%5733) : (i64) -> i64
      func.call @stack_push_pointer(%5731) : (i64) -> ()
      %5735 = llvm.mlir.addressof @str482 : !llvm.ptr
      %5736 = arith.constant 12 : i64
      %5737 = func.call @cc_make_string(%5735, %5736) : (!llvm.ptr, i64) -> i64
      %5738 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5739 = arith.constant 11 : i64
      %5740 = func.call @cc_make_string(%5738, %5739) : (!llvm.ptr, i64) -> i64
      %5741 = func.call @cc_intern(%5737, %5740) : (i64, i64) -> i64
      %5742 = func.call @cc_nil_value() : () -> i64
      %5743 = func.call @cc_cons(%5741, %5742) : (i64, i64) -> i64
      %5744 = func.call @cc_values_pack(%5743) : (i64) -> i64
      func.call @stack_push_pointer(%5741) : (i64) -> ()
      %5745 = llvm.mlir.addressof @str484 : !llvm.ptr
      %5746 = arith.constant 14 : i64
      %5747 = func.call @cc_make_string(%5745, %5746) : (!llvm.ptr, i64) -> i64
      %5748 = llvm.mlir.addressof @str485 : !llvm.ptr
      %5749 = arith.constant 11 : i64
      %5750 = func.call @cc_make_string(%5748, %5749) : (!llvm.ptr, i64) -> i64
      %5751 = func.call @cc_intern(%5747, %5750) : (i64, i64) -> i64
      %5752 = func.call @cc_nil_value() : () -> i64
      %5753 = func.call @cc_cons(%5751, %5752) : (i64, i64) -> i64
      %5754 = func.call @cc_values_pack(%5753) : (i64) -> i64
      func.call @stack_push_pointer(%5751) : (i64) -> ()
      %5755 = llvm.mlir.addressof @str486 : !llvm.ptr
      %5756 = arith.constant 14 : i64
      %5757 = func.call @cc_make_string(%5755, %5756) : (!llvm.ptr, i64) -> i64
      %5758 = llvm.mlir.addressof @str487 : !llvm.ptr
      %5759 = arith.constant 11 : i64
      %5760 = func.call @cc_make_string(%5758, %5759) : (!llvm.ptr, i64) -> i64
      %5761 = func.call @cc_intern(%5757, %5760) : (i64, i64) -> i64
      %5762 = func.call @cc_nil_value() : () -> i64
      %5763 = func.call @cc_cons(%5761, %5762) : (i64, i64) -> i64
      %5764 = func.call @cc_values_pack(%5763) : (i64) -> i64
      func.call @stack_push_pointer(%5761) : (i64) -> ()
      %5765 = llvm.mlir.addressof @str488 : !llvm.ptr
      %5766 = arith.constant 14 : i64
      %5767 = func.call @cc_make_string(%5765, %5766) : (!llvm.ptr, i64) -> i64
      %5768 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5769 = arith.constant 11 : i64
      %5770 = func.call @cc_make_string(%5768, %5769) : (!llvm.ptr, i64) -> i64
      %5771 = func.call @cc_intern(%5767, %5770) : (i64, i64) -> i64
      %5772 = func.call @cc_nil_value() : () -> i64
      %5773 = func.call @cc_cons(%5771, %5772) : (i64, i64) -> i64
      %5774 = func.call @cc_values_pack(%5773) : (i64) -> i64
      func.call @stack_push_pointer(%5771) : (i64) -> ()
      %5775 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5776 = arith.constant 14 : i64
      %5777 = func.call @cc_make_string(%5775, %5776) : (!llvm.ptr, i64) -> i64
      %5778 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5779 = arith.constant 11 : i64
      %5780 = func.call @cc_make_string(%5778, %5779) : (!llvm.ptr, i64) -> i64
      %5781 = func.call @cc_intern(%5777, %5780) : (i64, i64) -> i64
      %5782 = func.call @cc_nil_value() : () -> i64
      %5783 = func.call @cc_cons(%5781, %5782) : (i64, i64) -> i64
      %5784 = func.call @cc_values_pack(%5783) : (i64) -> i64
      func.call @stack_push_pointer(%5781) : (i64) -> ()
      %5785 = llvm.mlir.addressof @str492 : !llvm.ptr
      %5786 = arith.constant 13 : i64
      %5787 = func.call @cc_make_string(%5785, %5786) : (!llvm.ptr, i64) -> i64
      %5788 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5789 = arith.constant 11 : i64
      %5790 = func.call @cc_make_string(%5788, %5789) : (!llvm.ptr, i64) -> i64
      %5791 = func.call @cc_intern(%5787, %5790) : (i64, i64) -> i64
      %5792 = func.call @cc_nil_value() : () -> i64
      %5793 = func.call @cc_cons(%5791, %5792) : (i64, i64) -> i64
      %5794 = func.call @cc_values_pack(%5793) : (i64) -> i64
      func.call @stack_push_pointer(%5791) : (i64) -> ()
      %5795 = llvm.mlir.addressof @str494 : !llvm.ptr
      %5796 = arith.constant 13 : i64
      %5797 = func.call @cc_make_string(%5795, %5796) : (!llvm.ptr, i64) -> i64
      %5798 = llvm.mlir.addressof @str495 : !llvm.ptr
      %5799 = arith.constant 11 : i64
      %5800 = func.call @cc_make_string(%5798, %5799) : (!llvm.ptr, i64) -> i64
      %5801 = func.call @cc_intern(%5797, %5800) : (i64, i64) -> i64
      %5802 = func.call @cc_nil_value() : () -> i64
      %5803 = func.call @cc_cons(%5801, %5802) : (i64, i64) -> i64
      %5804 = func.call @cc_values_pack(%5803) : (i64) -> i64
      func.call @stack_push_pointer(%5801) : (i64) -> ()
      %5805 = llvm.mlir.addressof @str496 : !llvm.ptr
      %5806 = arith.constant 19 : i64
      %5807 = func.call @cc_make_string(%5805, %5806) : (!llvm.ptr, i64) -> i64
      %5808 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5809 = arith.constant 11 : i64
      %5810 = func.call @cc_make_string(%5808, %5809) : (!llvm.ptr, i64) -> i64
      %5811 = func.call @cc_intern(%5807, %5810) : (i64, i64) -> i64
      %5812 = func.call @cc_nil_value() : () -> i64
      %5813 = func.call @cc_cons(%5811, %5812) : (i64, i64) -> i64
      %5814 = func.call @cc_values_pack(%5813) : (i64) -> i64
      func.call @stack_push_pointer(%5811) : (i64) -> ()
      %5815 = llvm.mlir.addressof @str498 : !llvm.ptr
      %5816 = arith.constant 23 : i64
      %5817 = func.call @cc_make_string(%5815, %5816) : (!llvm.ptr, i64) -> i64
      %5818 = llvm.mlir.addressof @str499 : !llvm.ptr
      %5819 = arith.constant 11 : i64
      %5820 = func.call @cc_make_string(%5818, %5819) : (!llvm.ptr, i64) -> i64
      %5821 = func.call @cc_intern(%5817, %5820) : (i64, i64) -> i64
      %5822 = func.call @cc_nil_value() : () -> i64
      %5823 = func.call @cc_cons(%5821, %5822) : (i64, i64) -> i64
      %5824 = func.call @cc_values_pack(%5823) : (i64) -> i64
      func.call @stack_push_pointer(%5821) : (i64) -> ()
      %5825 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5826 = arith.constant 14 : i64
      %5827 = func.call @cc_make_string(%5825, %5826) : (!llvm.ptr, i64) -> i64
      %5828 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5829 = arith.constant 11 : i64
      %5830 = func.call @cc_make_string(%5828, %5829) : (!llvm.ptr, i64) -> i64
      %5831 = func.call @cc_intern(%5827, %5830) : (i64, i64) -> i64
      %5832 = func.call @cc_nil_value() : () -> i64
      %5833 = func.call @cc_cons(%5831, %5832) : (i64, i64) -> i64
      %5834 = func.call @cc_values_pack(%5833) : (i64) -> i64
      func.call @stack_push_pointer(%5831) : (i64) -> ()
      %5835 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5836 = arith.constant 13 : i64
      %5837 = func.call @cc_make_string(%5835, %5836) : (!llvm.ptr, i64) -> i64
      %5838 = llvm.mlir.addressof @str503 : !llvm.ptr
      %5839 = arith.constant 11 : i64
      %5840 = func.call @cc_make_string(%5838, %5839) : (!llvm.ptr, i64) -> i64
      %5841 = func.call @cc_intern(%5837, %5840) : (i64, i64) -> i64
      %5842 = func.call @cc_nil_value() : () -> i64
      %5843 = func.call @cc_cons(%5841, %5842) : (i64, i64) -> i64
      %5844 = func.call @cc_values_pack(%5843) : (i64) -> i64
      func.call @stack_push_pointer(%5841) : (i64) -> ()
      %5845 = llvm.mlir.addressof @str504 : !llvm.ptr
      %5846 = arith.constant 16 : i64
      %5847 = func.call @cc_make_string(%5845, %5846) : (!llvm.ptr, i64) -> i64
      %5848 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5849 = arith.constant 11 : i64
      %5850 = func.call @cc_make_string(%5848, %5849) : (!llvm.ptr, i64) -> i64
      %5851 = func.call @cc_intern(%5847, %5850) : (i64, i64) -> i64
      %5852 = func.call @cc_nil_value() : () -> i64
      %5853 = func.call @cc_cons(%5851, %5852) : (i64, i64) -> i64
      %5854 = func.call @cc_values_pack(%5853) : (i64) -> i64
      func.call @stack_push_pointer(%5851) : (i64) -> ()
      %5855 = llvm.mlir.addressof @str506 : !llvm.ptr
      %5856 = arith.constant 20 : i64
      %5857 = func.call @cc_make_string(%5855, %5856) : (!llvm.ptr, i64) -> i64
      %5858 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5859 = arith.constant 11 : i64
      %5860 = func.call @cc_make_string(%5858, %5859) : (!llvm.ptr, i64) -> i64
      %5861 = func.call @cc_intern(%5857, %5860) : (i64, i64) -> i64
      %5862 = func.call @cc_nil_value() : () -> i64
      %5863 = func.call @cc_cons(%5861, %5862) : (i64, i64) -> i64
      %5864 = func.call @cc_values_pack(%5863) : (i64) -> i64
      func.call @stack_push_pointer(%5861) : (i64) -> ()
      %5865 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5866 = arith.constant 10 : i64
      %5867 = func.call @cc_make_string(%5865, %5866) : (!llvm.ptr, i64) -> i64
      %5868 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5869 = arith.constant 11 : i64
      %5870 = func.call @cc_make_string(%5868, %5869) : (!llvm.ptr, i64) -> i64
      %5871 = func.call @cc_intern(%5867, %5870) : (i64, i64) -> i64
      %5872 = func.call @cc_nil_value() : () -> i64
      %5873 = func.call @cc_cons(%5871, %5872) : (i64, i64) -> i64
      %5874 = func.call @cc_values_pack(%5873) : (i64) -> i64
      func.call @stack_push_pointer(%5871) : (i64) -> ()
      %5875 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5876 = arith.constant 14 : i64
      %5877 = func.call @cc_make_string(%5875, %5876) : (!llvm.ptr, i64) -> i64
      %5878 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5879 = arith.constant 11 : i64
      %5880 = func.call @cc_make_string(%5878, %5879) : (!llvm.ptr, i64) -> i64
      %5881 = func.call @cc_intern(%5877, %5880) : (i64, i64) -> i64
      %5882 = func.call @cc_nil_value() : () -> i64
      %5883 = func.call @cc_cons(%5881, %5882) : (i64, i64) -> i64
      %5884 = func.call @cc_values_pack(%5883) : (i64) -> i64
      func.call @stack_push_pointer(%5881) : (i64) -> ()
      %5885 = llvm.mlir.addressof @str512 : !llvm.ptr
      %5886 = arith.constant 11 : i64
      %5887 = func.call @cc_make_string(%5885, %5886) : (!llvm.ptr, i64) -> i64
      %5888 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5889 = arith.constant 11 : i64
      %5890 = func.call @cc_make_string(%5888, %5889) : (!llvm.ptr, i64) -> i64
      %5891 = func.call @cc_intern(%5887, %5890) : (i64, i64) -> i64
      %5892 = func.call @cc_nil_value() : () -> i64
      %5893 = func.call @cc_cons(%5891, %5892) : (i64, i64) -> i64
      %5894 = func.call @cc_values_pack(%5893) : (i64) -> i64
      func.call @stack_push_pointer(%5891) : (i64) -> ()
      %5895 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5896 = arith.constant 27 : i64
      %5897 = func.call @cc_make_string(%5895, %5896) : (!llvm.ptr, i64) -> i64
      %5898 = llvm.mlir.addressof @str515 : !llvm.ptr
      %5899 = arith.constant 11 : i64
      %5900 = func.call @cc_make_string(%5898, %5899) : (!llvm.ptr, i64) -> i64
      %5901 = func.call @cc_intern(%5897, %5900) : (i64, i64) -> i64
      %5902 = func.call @cc_nil_value() : () -> i64
      %5903 = func.call @cc_cons(%5901, %5902) : (i64, i64) -> i64
      %5904 = func.call @cc_values_pack(%5903) : (i64) -> i64
      func.call @stack_push_pointer(%5901) : (i64) -> ()
      %5905 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5906 = arith.constant 11 : i64
      %5907 = func.call @cc_make_string(%5905, %5906) : (!llvm.ptr, i64) -> i64
      %5908 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5909 = arith.constant 11 : i64
      %5910 = func.call @cc_make_string(%5908, %5909) : (!llvm.ptr, i64) -> i64
      %5911 = func.call @cc_intern(%5907, %5910) : (i64, i64) -> i64
      %5912 = func.call @cc_nil_value() : () -> i64
      %5913 = func.call @cc_cons(%5911, %5912) : (i64, i64) -> i64
      %5914 = func.call @cc_values_pack(%5913) : (i64) -> i64
      func.call @stack_push_pointer(%5911) : (i64) -> ()
      %5915 = llvm.mlir.addressof @str518 : !llvm.ptr
      %5916 = arith.constant 15 : i64
      %5917 = func.call @cc_make_string(%5915, %5916) : (!llvm.ptr, i64) -> i64
      %5918 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5919 = arith.constant 11 : i64
      %5920 = func.call @cc_make_string(%5918, %5919) : (!llvm.ptr, i64) -> i64
      %5921 = func.call @cc_intern(%5917, %5920) : (i64, i64) -> i64
      %5922 = func.call @cc_nil_value() : () -> i64
      %5923 = func.call @cc_cons(%5921, %5922) : (i64, i64) -> i64
      %5924 = func.call @cc_values_pack(%5923) : (i64) -> i64
      func.call @stack_push_pointer(%5921) : (i64) -> ()
      %5925 = llvm.mlir.addressof @str520 : !llvm.ptr
      %5926 = arith.constant 11 : i64
      %5927 = func.call @cc_make_string(%5925, %5926) : (!llvm.ptr, i64) -> i64
      %5928 = llvm.mlir.addressof @str521 : !llvm.ptr
      %5929 = arith.constant 11 : i64
      %5930 = func.call @cc_make_string(%5928, %5929) : (!llvm.ptr, i64) -> i64
      %5931 = func.call @cc_intern(%5927, %5930) : (i64, i64) -> i64
      %5932 = func.call @cc_nil_value() : () -> i64
      %5933 = func.call @cc_cons(%5931, %5932) : (i64, i64) -> i64
      %5934 = func.call @cc_values_pack(%5933) : (i64) -> i64
      func.call @stack_push_pointer(%5931) : (i64) -> ()
      %5935 = llvm.mlir.addressof @str522 : !llvm.ptr
      %5936 = arith.constant 16 : i64
      %5937 = func.call @cc_make_string(%5935, %5936) : (!llvm.ptr, i64) -> i64
      %5938 = llvm.mlir.addressof @str523 : !llvm.ptr
      %5939 = arith.constant 11 : i64
      %5940 = func.call @cc_make_string(%5938, %5939) : (!llvm.ptr, i64) -> i64
      %5941 = func.call @cc_intern(%5937, %5940) : (i64, i64) -> i64
      %5942 = func.call @cc_nil_value() : () -> i64
      %5943 = func.call @cc_cons(%5941, %5942) : (i64, i64) -> i64
      %5944 = func.call @cc_values_pack(%5943) : (i64) -> i64
      func.call @stack_push_pointer(%5941) : (i64) -> ()
      %5945 = llvm.mlir.addressof @str524 : !llvm.ptr
      %5946 = arith.constant 17 : i64
      %5947 = func.call @cc_make_string(%5945, %5946) : (!llvm.ptr, i64) -> i64
      %5948 = llvm.mlir.addressof @str525 : !llvm.ptr
      %5949 = arith.constant 11 : i64
      %5950 = func.call @cc_make_string(%5948, %5949) : (!llvm.ptr, i64) -> i64
      %5951 = func.call @cc_intern(%5947, %5950) : (i64, i64) -> i64
      %5952 = func.call @cc_nil_value() : () -> i64
      %5953 = func.call @cc_cons(%5951, %5952) : (i64, i64) -> i64
      %5954 = func.call @cc_values_pack(%5953) : (i64) -> i64
      func.call @stack_push_pointer(%5951) : (i64) -> ()
      %5955 = llvm.mlir.addressof @str526 : !llvm.ptr
      %5956 = arith.constant 13 : i64
      %5957 = func.call @cc_make_string(%5955, %5956) : (!llvm.ptr, i64) -> i64
      %5958 = llvm.mlir.addressof @str527 : !llvm.ptr
      %5959 = arith.constant 11 : i64
      %5960 = func.call @cc_make_string(%5958, %5959) : (!llvm.ptr, i64) -> i64
      %5961 = func.call @cc_intern(%5957, %5960) : (i64, i64) -> i64
      %5962 = func.call @cc_nil_value() : () -> i64
      %5963 = func.call @cc_cons(%5961, %5962) : (i64, i64) -> i64
      %5964 = func.call @cc_values_pack(%5963) : (i64) -> i64
      func.call @stack_push_pointer(%5961) : (i64) -> ()
      %5965 = llvm.mlir.addressof @str528 : !llvm.ptr
      %5966 = arith.constant 14 : i64
      %5967 = func.call @cc_make_string(%5965, %5966) : (!llvm.ptr, i64) -> i64
      %5968 = llvm.mlir.addressof @str529 : !llvm.ptr
      %5969 = arith.constant 11 : i64
      %5970 = func.call @cc_make_string(%5968, %5969) : (!llvm.ptr, i64) -> i64
      %5971 = func.call @cc_intern(%5967, %5970) : (i64, i64) -> i64
      %5972 = func.call @cc_nil_value() : () -> i64
      %5973 = func.call @cc_cons(%5971, %5972) : (i64, i64) -> i64
      %5974 = func.call @cc_values_pack(%5973) : (i64) -> i64
      func.call @stack_push_pointer(%5971) : (i64) -> ()
      %5975 = llvm.mlir.addressof @str530 : !llvm.ptr
      %5976 = arith.constant 2 : i64
      %5977 = func.call @cc_make_string(%5975, %5976) : (!llvm.ptr, i64) -> i64
      %5978 = llvm.mlir.addressof @str531 : !llvm.ptr
      %5979 = arith.constant 11 : i64
      %5980 = func.call @cc_make_string(%5978, %5979) : (!llvm.ptr, i64) -> i64
      %5981 = func.call @cc_intern(%5977, %5980) : (i64, i64) -> i64
      %5982 = func.call @cc_nil_value() : () -> i64
      %5983 = func.call @cc_cons(%5981, %5982) : (i64, i64) -> i64
      %5984 = func.call @cc_values_pack(%5983) : (i64) -> i64
      func.call @stack_push_pointer(%5981) : (i64) -> ()
      %5985 = llvm.mlir.addressof @str532 : !llvm.ptr
      %5986 = arith.constant 3 : i64
      %5987 = func.call @cc_make_string(%5985, %5986) : (!llvm.ptr, i64) -> i64
      %5988 = llvm.mlir.addressof @str533 : !llvm.ptr
      %5989 = arith.constant 11 : i64
      %5990 = func.call @cc_make_string(%5988, %5989) : (!llvm.ptr, i64) -> i64
      %5991 = func.call @cc_intern(%5987, %5990) : (i64, i64) -> i64
      %5992 = func.call @cc_nil_value() : () -> i64
      %5993 = func.call @cc_cons(%5991, %5992) : (i64, i64) -> i64
      %5994 = func.call @cc_values_pack(%5993) : (i64) -> i64
      func.call @stack_push_pointer(%5991) : (i64) -> ()
      %5995 = llvm.mlir.addressof @str534 : !llvm.ptr
      %5996 = arith.constant 2 : i64
      %5997 = func.call @cc_make_string(%5995, %5996) : (!llvm.ptr, i64) -> i64
      %5998 = llvm.mlir.addressof @str535 : !llvm.ptr
      %5999 = arith.constant 11 : i64
      %6000 = func.call @cc_make_string(%5998, %5999) : (!llvm.ptr, i64) -> i64
      %6001 = func.call @cc_intern(%5997, %6000) : (i64, i64) -> i64
      %6002 = func.call @cc_nil_value() : () -> i64
      %6003 = func.call @cc_cons(%6001, %6002) : (i64, i64) -> i64
      %6004 = func.call @cc_values_pack(%6003) : (i64) -> i64
      func.call @stack_push_pointer(%6001) : (i64) -> ()
      %6005 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6006 = arith.constant 3 : i64
      %6007 = func.call @cc_make_string(%6005, %6006) : (!llvm.ptr, i64) -> i64
      %6008 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6009 = arith.constant 11 : i64
      %6010 = func.call @cc_make_string(%6008, %6009) : (!llvm.ptr, i64) -> i64
      %6011 = func.call @cc_intern(%6007, %6010) : (i64, i64) -> i64
      %6012 = func.call @cc_nil_value() : () -> i64
      %6013 = func.call @cc_cons(%6011, %6012) : (i64, i64) -> i64
      %6014 = func.call @cc_values_pack(%6013) : (i64) -> i64
      func.call @stack_push_pointer(%6011) : (i64) -> ()
      %6015 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6016 = arith.constant 16 : i64
      %6017 = func.call @cc_make_string(%6015, %6016) : (!llvm.ptr, i64) -> i64
      %6018 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6019 = arith.constant 11 : i64
      %6020 = func.call @cc_make_string(%6018, %6019) : (!llvm.ptr, i64) -> i64
      %6021 = func.call @cc_intern(%6017, %6020) : (i64, i64) -> i64
      %6022 = func.call @cc_nil_value() : () -> i64
      %6023 = func.call @cc_cons(%6021, %6022) : (i64, i64) -> i64
      %6024 = func.call @cc_values_pack(%6023) : (i64) -> i64
      func.call @stack_push_pointer(%6021) : (i64) -> ()
      %6025 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6026 = arith.constant 5 : i64
      %6027 = func.call @cc_make_string(%6025, %6026) : (!llvm.ptr, i64) -> i64
      %6028 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6029 = arith.constant 11 : i64
      %6030 = func.call @cc_make_string(%6028, %6029) : (!llvm.ptr, i64) -> i64
      %6031 = func.call @cc_intern(%6027, %6030) : (i64, i64) -> i64
      %6032 = func.call @cc_nil_value() : () -> i64
      %6033 = func.call @cc_cons(%6031, %6032) : (i64, i64) -> i64
      %6034 = func.call @cc_values_pack(%6033) : (i64) -> i64
      func.call @stack_push_pointer(%6031) : (i64) -> ()
      %6035 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6036 = arith.constant 21 : i64
      %6037 = func.call @cc_make_string(%6035, %6036) : (!llvm.ptr, i64) -> i64
      %6038 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6039 = arith.constant 11 : i64
      %6040 = func.call @cc_make_string(%6038, %6039) : (!llvm.ptr, i64) -> i64
      %6041 = func.call @cc_intern(%6037, %6040) : (i64, i64) -> i64
      %6042 = func.call @cc_nil_value() : () -> i64
      %6043 = func.call @cc_cons(%6041, %6042) : (i64, i64) -> i64
      %6044 = func.call @cc_values_pack(%6043) : (i64) -> i64
      func.call @stack_push_pointer(%6041) : (i64) -> ()
      %6045 = llvm.mlir.addressof @str544 : !llvm.ptr
      %6046 = arith.constant 16 : i64
      %6047 = func.call @cc_make_string(%6045, %6046) : (!llvm.ptr, i64) -> i64
      %6048 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6049 = arith.constant 11 : i64
      %6050 = func.call @cc_make_string(%6048, %6049) : (!llvm.ptr, i64) -> i64
      %6051 = func.call @cc_intern(%6047, %6050) : (i64, i64) -> i64
      %6052 = func.call @cc_nil_value() : () -> i64
      %6053 = func.call @cc_cons(%6051, %6052) : (i64, i64) -> i64
      %6054 = func.call @cc_values_pack(%6053) : (i64) -> i64
      func.call @stack_push_pointer(%6051) : (i64) -> ()
      %6055 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6056 = arith.constant 22 : i64
      %6057 = func.call @cc_make_string(%6055, %6056) : (!llvm.ptr, i64) -> i64
      %6058 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6059 = arith.constant 11 : i64
      %6060 = func.call @cc_make_string(%6058, %6059) : (!llvm.ptr, i64) -> i64
      %6061 = func.call @cc_intern(%6057, %6060) : (i64, i64) -> i64
      %6062 = func.call @cc_nil_value() : () -> i64
      %6063 = func.call @cc_cons(%6061, %6062) : (i64, i64) -> i64
      %6064 = func.call @cc_values_pack(%6063) : (i64) -> i64
      func.call @stack_push_pointer(%6061) : (i64) -> ()
      %6065 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6066 = arith.constant 9 : i64
      %6067 = func.call @cc_make_string(%6065, %6066) : (!llvm.ptr, i64) -> i64
      %6068 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6069 = arith.constant 11 : i64
      %6070 = func.call @cc_make_string(%6068, %6069) : (!llvm.ptr, i64) -> i64
      %6071 = func.call @cc_intern(%6067, %6070) : (i64, i64) -> i64
      %6072 = func.call @cc_nil_value() : () -> i64
      %6073 = func.call @cc_cons(%6071, %6072) : (i64, i64) -> i64
      %6074 = func.call @cc_values_pack(%6073) : (i64) -> i64
      func.call @stack_push_pointer(%6071) : (i64) -> ()
      %6075 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6076 = arith.constant 11 : i64
      %6077 = func.call @cc_make_string(%6075, %6076) : (!llvm.ptr, i64) -> i64
      %6078 = llvm.mlir.addressof @str551 : !llvm.ptr
      %6079 = arith.constant 11 : i64
      %6080 = func.call @cc_make_string(%6078, %6079) : (!llvm.ptr, i64) -> i64
      %6081 = func.call @cc_intern(%6077, %6080) : (i64, i64) -> i64
      %6082 = func.call @cc_nil_value() : () -> i64
      %6083 = func.call @cc_cons(%6081, %6082) : (i64, i64) -> i64
      %6084 = func.call @cc_values_pack(%6083) : (i64) -> i64
      func.call @stack_push_pointer(%6081) : (i64) -> ()
      %6085 = llvm.mlir.addressof @str552 : !llvm.ptr
      %6086 = arith.constant 6 : i64
      %6087 = func.call @cc_make_string(%6085, %6086) : (!llvm.ptr, i64) -> i64
      %6088 = llvm.mlir.addressof @str553 : !llvm.ptr
      %6089 = arith.constant 11 : i64
      %6090 = func.call @cc_make_string(%6088, %6089) : (!llvm.ptr, i64) -> i64
      %6091 = func.call @cc_intern(%6087, %6090) : (i64, i64) -> i64
      %6092 = func.call @cc_nil_value() : () -> i64
      %6093 = func.call @cc_cons(%6091, %6092) : (i64, i64) -> i64
      %6094 = func.call @cc_values_pack(%6093) : (i64) -> i64
      func.call @stack_push_pointer(%6091) : (i64) -> ()
      %6095 = llvm.mlir.addressof @str554 : !llvm.ptr
      %6096 = arith.constant 10 : i64
      %6097 = func.call @cc_make_string(%6095, %6096) : (!llvm.ptr, i64) -> i64
      %6098 = llvm.mlir.addressof @str555 : !llvm.ptr
      %6099 = arith.constant 11 : i64
      %6100 = func.call @cc_make_string(%6098, %6099) : (!llvm.ptr, i64) -> i64
      %6101 = func.call @cc_intern(%6097, %6100) : (i64, i64) -> i64
      %6102 = func.call @cc_nil_value() : () -> i64
      %6103 = func.call @cc_cons(%6101, %6102) : (i64, i64) -> i64
      %6104 = func.call @cc_values_pack(%6103) : (i64) -> i64
      func.call @stack_push_pointer(%6101) : (i64) -> ()
      %6105 = llvm.mlir.addressof @str556 : !llvm.ptr
      %6106 = arith.constant 7 : i64
      %6107 = func.call @cc_make_string(%6105, %6106) : (!llvm.ptr, i64) -> i64
      %6108 = llvm.mlir.addressof @str557 : !llvm.ptr
      %6109 = arith.constant 11 : i64
      %6110 = func.call @cc_make_string(%6108, %6109) : (!llvm.ptr, i64) -> i64
      %6111 = func.call @cc_intern(%6107, %6110) : (i64, i64) -> i64
      %6112 = func.call @cc_nil_value() : () -> i64
      %6113 = func.call @cc_cons(%6111, %6112) : (i64, i64) -> i64
      %6114 = func.call @cc_values_pack(%6113) : (i64) -> i64
      func.call @stack_push_pointer(%6111) : (i64) -> ()
      %6115 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6116 = arith.constant 7 : i64
      %6117 = func.call @cc_make_string(%6115, %6116) : (!llvm.ptr, i64) -> i64
      %6118 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6119 = arith.constant 11 : i64
      %6120 = func.call @cc_make_string(%6118, %6119) : (!llvm.ptr, i64) -> i64
      %6121 = func.call @cc_intern(%6117, %6120) : (i64, i64) -> i64
      %6122 = func.call @cc_nil_value() : () -> i64
      %6123 = func.call @cc_cons(%6121, %6122) : (i64, i64) -> i64
      %6124 = func.call @cc_values_pack(%6123) : (i64) -> i64
      func.call @stack_push_pointer(%6121) : (i64) -> ()
      %6125 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6126 = arith.constant 9 : i64
      %6127 = func.call @cc_make_string(%6125, %6126) : (!llvm.ptr, i64) -> i64
      %6128 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6129 = arith.constant 11 : i64
      %6130 = func.call @cc_make_string(%6128, %6129) : (!llvm.ptr, i64) -> i64
      %6131 = func.call @cc_intern(%6127, %6130) : (i64, i64) -> i64
      %6132 = func.call @cc_nil_value() : () -> i64
      %6133 = func.call @cc_cons(%6131, %6132) : (i64, i64) -> i64
      %6134 = func.call @cc_values_pack(%6133) : (i64) -> i64
      func.call @stack_push_pointer(%6131) : (i64) -> ()
      %6135 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6136 = arith.constant 11 : i64
      %6137 = func.call @cc_make_string(%6135, %6136) : (!llvm.ptr, i64) -> i64
      %6138 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6139 = arith.constant 11 : i64
      %6140 = func.call @cc_make_string(%6138, %6139) : (!llvm.ptr, i64) -> i64
      %6141 = func.call @cc_intern(%6137, %6140) : (i64, i64) -> i64
      %6142 = func.call @cc_nil_value() : () -> i64
      %6143 = func.call @cc_cons(%6141, %6142) : (i64, i64) -> i64
      %6144 = func.call @cc_values_pack(%6143) : (i64) -> i64
      func.call @stack_push_pointer(%6141) : (i64) -> ()
      %6145 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6146 = arith.constant 11 : i64
      %6147 = func.call @cc_make_string(%6145, %6146) : (!llvm.ptr, i64) -> i64
      %6148 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6149 = arith.constant 11 : i64
      %6150 = func.call @cc_make_string(%6148, %6149) : (!llvm.ptr, i64) -> i64
      %6151 = func.call @cc_intern(%6147, %6150) : (i64, i64) -> i64
      %6152 = func.call @cc_nil_value() : () -> i64
      %6153 = func.call @cc_cons(%6151, %6152) : (i64, i64) -> i64
      %6154 = func.call @cc_values_pack(%6153) : (i64) -> i64
      func.call @stack_push_pointer(%6151) : (i64) -> ()
      %6155 = llvm.mlir.addressof @str566 : !llvm.ptr
      %6156 = arith.constant 8 : i64
      %6157 = func.call @cc_make_string(%6155, %6156) : (!llvm.ptr, i64) -> i64
      %6158 = llvm.mlir.addressof @str567 : !llvm.ptr
      %6159 = arith.constant 11 : i64
      %6160 = func.call @cc_make_string(%6158, %6159) : (!llvm.ptr, i64) -> i64
      %6161 = func.call @cc_intern(%6157, %6160) : (i64, i64) -> i64
      %6162 = func.call @cc_nil_value() : () -> i64
      %6163 = func.call @cc_cons(%6161, %6162) : (i64, i64) -> i64
      %6164 = func.call @cc_values_pack(%6163) : (i64) -> i64
      func.call @stack_push_pointer(%6161) : (i64) -> ()
      %6165 = llvm.mlir.addressof @str568 : !llvm.ptr
      %6166 = arith.constant 8 : i64
      %6167 = func.call @cc_make_string(%6165, %6166) : (!llvm.ptr, i64) -> i64
      %6168 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6169 = arith.constant 11 : i64
      %6170 = func.call @cc_make_string(%6168, %6169) : (!llvm.ptr, i64) -> i64
      %6171 = func.call @cc_intern(%6167, %6170) : (i64, i64) -> i64
      %6172 = func.call @cc_nil_value() : () -> i64
      %6173 = func.call @cc_cons(%6171, %6172) : (i64, i64) -> i64
      %6174 = func.call @cc_values_pack(%6173) : (i64) -> i64
      func.call @stack_push_pointer(%6171) : (i64) -> ()
      %6175 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6176 = arith.constant 9 : i64
      %6177 = func.call @cc_make_string(%6175, %6176) : (!llvm.ptr, i64) -> i64
      %6178 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6179 = arith.constant 11 : i64
      %6180 = func.call @cc_make_string(%6178, %6179) : (!llvm.ptr, i64) -> i64
      %6181 = func.call @cc_intern(%6177, %6180) : (i64, i64) -> i64
      %6182 = func.call @cc_nil_value() : () -> i64
      %6183 = func.call @cc_cons(%6181, %6182) : (i64, i64) -> i64
      %6184 = func.call @cc_values_pack(%6183) : (i64) -> i64
      func.call @stack_push_pointer(%6181) : (i64) -> ()
      %6185 = llvm.mlir.addressof @str572 : !llvm.ptr
      %6186 = arith.constant 9 : i64
      %6187 = func.call @cc_make_string(%6185, %6186) : (!llvm.ptr, i64) -> i64
      %6188 = llvm.mlir.addressof @str573 : !llvm.ptr
      %6189 = arith.constant 11 : i64
      %6190 = func.call @cc_make_string(%6188, %6189) : (!llvm.ptr, i64) -> i64
      %6191 = func.call @cc_intern(%6187, %6190) : (i64, i64) -> i64
      %6192 = func.call @cc_nil_value() : () -> i64
      %6193 = func.call @cc_cons(%6191, %6192) : (i64, i64) -> i64
      %6194 = func.call @cc_values_pack(%6193) : (i64) -> i64
      func.call @stack_push_pointer(%6191) : (i64) -> ()
      %6195 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6196 = arith.constant 9 : i64
      %6197 = func.call @cc_make_string(%6195, %6196) : (!llvm.ptr, i64) -> i64
      %6198 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6199 = arith.constant 11 : i64
      %6200 = func.call @cc_make_string(%6198, %6199) : (!llvm.ptr, i64) -> i64
      %6201 = func.call @cc_intern(%6197, %6200) : (i64, i64) -> i64
      %6202 = func.call @cc_nil_value() : () -> i64
      %6203 = func.call @cc_cons(%6201, %6202) : (i64, i64) -> i64
      %6204 = func.call @cc_values_pack(%6203) : (i64) -> i64
      func.call @stack_push_pointer(%6201) : (i64) -> ()
      %6205 = llvm.mlir.addressof @str576 : !llvm.ptr
      %6206 = arith.constant 10 : i64
      %6207 = func.call @cc_make_string(%6205, %6206) : (!llvm.ptr, i64) -> i64
      %6208 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6209 = arith.constant 11 : i64
      %6210 = func.call @cc_make_string(%6208, %6209) : (!llvm.ptr, i64) -> i64
      %6211 = func.call @cc_intern(%6207, %6210) : (i64, i64) -> i64
      %6212 = func.call @cc_nil_value() : () -> i64
      %6213 = func.call @cc_cons(%6211, %6212) : (i64, i64) -> i64
      %6214 = func.call @cc_values_pack(%6213) : (i64) -> i64
      func.call @stack_push_pointer(%6211) : (i64) -> ()
      %6215 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6216 = arith.constant 9 : i64
      %6217 = func.call @cc_make_string(%6215, %6216) : (!llvm.ptr, i64) -> i64
      %6218 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6219 = arith.constant 11 : i64
      %6220 = func.call @cc_make_string(%6218, %6219) : (!llvm.ptr, i64) -> i64
      %6221 = func.call @cc_intern(%6217, %6220) : (i64, i64) -> i64
      %6222 = func.call @cc_nil_value() : () -> i64
      %6223 = func.call @cc_cons(%6221, %6222) : (i64, i64) -> i64
      %6224 = func.call @cc_values_pack(%6223) : (i64) -> i64
      func.call @stack_push_pointer(%6221) : (i64) -> ()
      %6225 = llvm.mlir.addressof @str580 : !llvm.ptr
      %6226 = arith.constant 10 : i64
      %6227 = func.call @cc_make_string(%6225, %6226) : (!llvm.ptr, i64) -> i64
      %6228 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6229 = arith.constant 11 : i64
      %6230 = func.call @cc_make_string(%6228, %6229) : (!llvm.ptr, i64) -> i64
      %6231 = func.call @cc_intern(%6227, %6230) : (i64, i64) -> i64
      %6232 = func.call @cc_nil_value() : () -> i64
      %6233 = func.call @cc_cons(%6231, %6232) : (i64, i64) -> i64
      %6234 = func.call @cc_values_pack(%6233) : (i64) -> i64
      func.call @stack_push_pointer(%6231) : (i64) -> ()
      %6235 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6236 = arith.constant 10 : i64
      %6237 = func.call @cc_make_string(%6235, %6236) : (!llvm.ptr, i64) -> i64
      %6238 = llvm.mlir.addressof @str583 : !llvm.ptr
      %6239 = arith.constant 11 : i64
      %6240 = func.call @cc_make_string(%6238, %6239) : (!llvm.ptr, i64) -> i64
      %6241 = func.call @cc_intern(%6237, %6240) : (i64, i64) -> i64
      %6242 = func.call @cc_nil_value() : () -> i64
      %6243 = func.call @cc_cons(%6241, %6242) : (i64, i64) -> i64
      %6244 = func.call @cc_values_pack(%6243) : (i64) -> i64
      func.call @stack_push_pointer(%6241) : (i64) -> ()
      %6245 = llvm.mlir.addressof @str584 : !llvm.ptr
      %6246 = arith.constant 9 : i64
      %6247 = func.call @cc_make_string(%6245, %6246) : (!llvm.ptr, i64) -> i64
      %6248 = llvm.mlir.addressof @str585 : !llvm.ptr
      %6249 = arith.constant 11 : i64
      %6250 = func.call @cc_make_string(%6248, %6249) : (!llvm.ptr, i64) -> i64
      %6251 = func.call @cc_intern(%6247, %6250) : (i64, i64) -> i64
      %6252 = func.call @cc_nil_value() : () -> i64
      %6253 = func.call @cc_cons(%6251, %6252) : (i64, i64) -> i64
      %6254 = func.call @cc_values_pack(%6253) : (i64) -> i64
      func.call @stack_push_pointer(%6251) : (i64) -> ()
      %6255 = llvm.mlir.addressof @str586 : !llvm.ptr
      %6256 = arith.constant 9 : i64
      %6257 = func.call @cc_make_string(%6255, %6256) : (!llvm.ptr, i64) -> i64
      %6258 = llvm.mlir.addressof @str587 : !llvm.ptr
      %6259 = arith.constant 11 : i64
      %6260 = func.call @cc_make_string(%6258, %6259) : (!llvm.ptr, i64) -> i64
      %6261 = func.call @cc_intern(%6257, %6260) : (i64, i64) -> i64
      %6262 = func.call @cc_nil_value() : () -> i64
      %6263 = func.call @cc_cons(%6261, %6262) : (i64, i64) -> i64
      %6264 = func.call @cc_values_pack(%6263) : (i64) -> i64
      func.call @stack_push_pointer(%6261) : (i64) -> ()
      %6265 = llvm.mlir.addressof @str588 : !llvm.ptr
      %6266 = arith.constant 7 : i64
      %6267 = func.call @cc_make_string(%6265, %6266) : (!llvm.ptr, i64) -> i64
      %6268 = llvm.mlir.addressof @str589 : !llvm.ptr
      %6269 = arith.constant 11 : i64
      %6270 = func.call @cc_make_string(%6268, %6269) : (!llvm.ptr, i64) -> i64
      %6271 = func.call @cc_intern(%6267, %6270) : (i64, i64) -> i64
      %6272 = func.call @cc_nil_value() : () -> i64
      %6273 = func.call @cc_cons(%6271, %6272) : (i64, i64) -> i64
      %6274 = func.call @cc_values_pack(%6273) : (i64) -> i64
      func.call @stack_push_pointer(%6271) : (i64) -> ()
      %6275 = llvm.mlir.addressof @str590 : !llvm.ptr
      %6276 = arith.constant 16 : i64
      %6277 = func.call @cc_make_string(%6275, %6276) : (!llvm.ptr, i64) -> i64
      %6278 = llvm.mlir.addressof @str591 : !llvm.ptr
      %6279 = arith.constant 11 : i64
      %6280 = func.call @cc_make_string(%6278, %6279) : (!llvm.ptr, i64) -> i64
      %6281 = func.call @cc_intern(%6277, %6280) : (i64, i64) -> i64
      %6282 = func.call @cc_nil_value() : () -> i64
      %6283 = func.call @cc_cons(%6281, %6282) : (i64, i64) -> i64
      %6284 = func.call @cc_values_pack(%6283) : (i64) -> i64
      func.call @stack_push_pointer(%6281) : (i64) -> ()
      %6285 = llvm.mlir.addressof @str592 : !llvm.ptr
      %6286 = arith.constant 14 : i64
      %6287 = func.call @cc_make_string(%6285, %6286) : (!llvm.ptr, i64) -> i64
      %6288 = llvm.mlir.addressof @str593 : !llvm.ptr
      %6289 = arith.constant 11 : i64
      %6290 = func.call @cc_make_string(%6288, %6289) : (!llvm.ptr, i64) -> i64
      %6291 = func.call @cc_intern(%6287, %6290) : (i64, i64) -> i64
      %6292 = func.call @cc_nil_value() : () -> i64
      %6293 = func.call @cc_cons(%6291, %6292) : (i64, i64) -> i64
      %6294 = func.call @cc_values_pack(%6293) : (i64) -> i64
      func.call @stack_push_pointer(%6291) : (i64) -> ()
      %6295 = llvm.mlir.addressof @str594 : !llvm.ptr
      %6296 = arith.constant 20 : i64
      %6297 = func.call @cc_make_string(%6295, %6296) : (!llvm.ptr, i64) -> i64
      %6298 = llvm.mlir.addressof @str595 : !llvm.ptr
      %6299 = arith.constant 11 : i64
      %6300 = func.call @cc_make_string(%6298, %6299) : (!llvm.ptr, i64) -> i64
      %6301 = func.call @cc_intern(%6297, %6300) : (i64, i64) -> i64
      %6302 = func.call @cc_nil_value() : () -> i64
      %6303 = func.call @cc_cons(%6301, %6302) : (i64, i64) -> i64
      %6304 = func.call @cc_values_pack(%6303) : (i64) -> i64
      func.call @stack_push_pointer(%6301) : (i64) -> ()
      %6305 = llvm.mlir.addressof @str596 : !llvm.ptr
      %6306 = arith.constant 10 : i64
      %6307 = func.call @cc_make_string(%6305, %6306) : (!llvm.ptr, i64) -> i64
      %6308 = llvm.mlir.addressof @str597 : !llvm.ptr
      %6309 = arith.constant 11 : i64
      %6310 = func.call @cc_make_string(%6308, %6309) : (!llvm.ptr, i64) -> i64
      %6311 = func.call @cc_intern(%6307, %6310) : (i64, i64) -> i64
      %6312 = func.call @cc_nil_value() : () -> i64
      %6313 = func.call @cc_cons(%6311, %6312) : (i64, i64) -> i64
      %6314 = func.call @cc_values_pack(%6313) : (i64) -> i64
      func.call @stack_push_pointer(%6311) : (i64) -> ()
      %6315 = llvm.mlir.addressof @str598 : !llvm.ptr
      %6316 = arith.constant 15 : i64
      %6317 = func.call @cc_make_string(%6315, %6316) : (!llvm.ptr, i64) -> i64
      %6318 = llvm.mlir.addressof @str599 : !llvm.ptr
      %6319 = arith.constant 11 : i64
      %6320 = func.call @cc_make_string(%6318, %6319) : (!llvm.ptr, i64) -> i64
      %6321 = func.call @cc_intern(%6317, %6320) : (i64, i64) -> i64
      %6322 = func.call @cc_nil_value() : () -> i64
      %6323 = func.call @cc_cons(%6321, %6322) : (i64, i64) -> i64
      %6324 = func.call @cc_values_pack(%6323) : (i64) -> i64
      func.call @stack_push_pointer(%6321) : (i64) -> ()
      %6325 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6326 = arith.constant 5 : i64
      %6327 = func.call @cc_make_string(%6325, %6326) : (!llvm.ptr, i64) -> i64
      %6328 = llvm.mlir.addressof @str601 : !llvm.ptr
      %6329 = arith.constant 11 : i64
      %6330 = func.call @cc_make_string(%6328, %6329) : (!llvm.ptr, i64) -> i64
      %6331 = func.call @cc_intern(%6327, %6330) : (i64, i64) -> i64
      %6332 = func.call @cc_nil_value() : () -> i64
      %6333 = func.call @cc_cons(%6331, %6332) : (i64, i64) -> i64
      %6334 = func.call @cc_values_pack(%6333) : (i64) -> i64
      func.call @stack_push_pointer(%6331) : (i64) -> ()
      %6335 = llvm.mlir.addressof @str602 : !llvm.ptr
      %6336 = arith.constant 17 : i64
      %6337 = func.call @cc_make_string(%6335, %6336) : (!llvm.ptr, i64) -> i64
      %6338 = llvm.mlir.addressof @str603 : !llvm.ptr
      %6339 = arith.constant 11 : i64
      %6340 = func.call @cc_make_string(%6338, %6339) : (!llvm.ptr, i64) -> i64
      %6341 = func.call @cc_intern(%6337, %6340) : (i64, i64) -> i64
      %6342 = func.call @cc_nil_value() : () -> i64
      %6343 = func.call @cc_cons(%6341, %6342) : (i64, i64) -> i64
      %6344 = func.call @cc_values_pack(%6343) : (i64) -> i64
      func.call @stack_push_pointer(%6341) : (i64) -> ()
      %6345 = llvm.mlir.addressof @str604 : !llvm.ptr
      %6346 = arith.constant 17 : i64
      %6347 = func.call @cc_make_string(%6345, %6346) : (!llvm.ptr, i64) -> i64
      %6348 = llvm.mlir.addressof @str605 : !llvm.ptr
      %6349 = arith.constant 11 : i64
      %6350 = func.call @cc_make_string(%6348, %6349) : (!llvm.ptr, i64) -> i64
      %6351 = func.call @cc_intern(%6347, %6350) : (i64, i64) -> i64
      %6352 = func.call @cc_nil_value() : () -> i64
      %6353 = func.call @cc_cons(%6351, %6352) : (i64, i64) -> i64
      %6354 = func.call @cc_values_pack(%6353) : (i64) -> i64
      func.call @stack_push_pointer(%6351) : (i64) -> ()
      %6355 = llvm.mlir.addressof @str606 : !llvm.ptr
      %6356 = arith.constant 14 : i64
      %6357 = func.call @cc_make_string(%6355, %6356) : (!llvm.ptr, i64) -> i64
      %6358 = llvm.mlir.addressof @str607 : !llvm.ptr
      %6359 = arith.constant 11 : i64
      %6360 = func.call @cc_make_string(%6358, %6359) : (!llvm.ptr, i64) -> i64
      %6361 = func.call @cc_intern(%6357, %6360) : (i64, i64) -> i64
      %6362 = func.call @cc_nil_value() : () -> i64
      %6363 = func.call @cc_cons(%6361, %6362) : (i64, i64) -> i64
      %6364 = func.call @cc_values_pack(%6363) : (i64) -> i64
      func.call @stack_push_pointer(%6361) : (i64) -> ()
      %6365 = llvm.mlir.addressof @str608 : !llvm.ptr
      %6366 = arith.constant 19 : i64
      %6367 = func.call @cc_make_string(%6365, %6366) : (!llvm.ptr, i64) -> i64
      %6368 = llvm.mlir.addressof @str609 : !llvm.ptr
      %6369 = arith.constant 11 : i64
      %6370 = func.call @cc_make_string(%6368, %6369) : (!llvm.ptr, i64) -> i64
      %6371 = func.call @cc_intern(%6367, %6370) : (i64, i64) -> i64
      %6372 = func.call @cc_nil_value() : () -> i64
      %6373 = func.call @cc_cons(%6371, %6372) : (i64, i64) -> i64
      %6374 = func.call @cc_values_pack(%6373) : (i64) -> i64
      func.call @stack_push_pointer(%6371) : (i64) -> ()
      %6375 = llvm.mlir.addressof @str610 : !llvm.ptr
      %6376 = arith.constant 9 : i64
      %6377 = func.call @cc_make_string(%6375, %6376) : (!llvm.ptr, i64) -> i64
      %6378 = llvm.mlir.addressof @str611 : !llvm.ptr
      %6379 = arith.constant 11 : i64
      %6380 = func.call @cc_make_string(%6378, %6379) : (!llvm.ptr, i64) -> i64
      %6381 = func.call @cc_intern(%6377, %6380) : (i64, i64) -> i64
      %6382 = func.call @cc_nil_value() : () -> i64
      %6383 = func.call @cc_cons(%6381, %6382) : (i64, i64) -> i64
      %6384 = func.call @cc_values_pack(%6383) : (i64) -> i64
      func.call @stack_push_pointer(%6381) : (i64) -> ()
      %6385 = llvm.mlir.addressof @str612 : !llvm.ptr
      %6386 = arith.constant 13 : i64
      %6387 = func.call @cc_make_string(%6385, %6386) : (!llvm.ptr, i64) -> i64
      %6388 = llvm.mlir.addressof @str613 : !llvm.ptr
      %6389 = arith.constant 11 : i64
      %6390 = func.call @cc_make_string(%6388, %6389) : (!llvm.ptr, i64) -> i64
      %6391 = func.call @cc_intern(%6387, %6390) : (i64, i64) -> i64
      %6392 = func.call @cc_nil_value() : () -> i64
      %6393 = func.call @cc_cons(%6391, %6392) : (i64, i64) -> i64
      %6394 = func.call @cc_values_pack(%6393) : (i64) -> i64
      func.call @stack_push_pointer(%6391) : (i64) -> ()
      %6395 = llvm.mlir.addressof @str614 : !llvm.ptr
      %6396 = arith.constant 5 : i64
      %6397 = func.call @cc_make_string(%6395, %6396) : (!llvm.ptr, i64) -> i64
      %6398 = llvm.mlir.addressof @str615 : !llvm.ptr
      %6399 = arith.constant 11 : i64
      %6400 = func.call @cc_make_string(%6398, %6399) : (!llvm.ptr, i64) -> i64
      %6401 = func.call @cc_intern(%6397, %6400) : (i64, i64) -> i64
      %6402 = func.call @cc_nil_value() : () -> i64
      %6403 = func.call @cc_cons(%6401, %6402) : (i64, i64) -> i64
      %6404 = func.call @cc_values_pack(%6403) : (i64) -> i64
      func.call @stack_push_pointer(%6401) : (i64) -> ()
      %6405 = llvm.mlir.addressof @str616 : !llvm.ptr
      %6406 = arith.constant 11 : i64
      %6407 = func.call @cc_make_string(%6405, %6406) : (!llvm.ptr, i64) -> i64
      %6408 = llvm.mlir.addressof @str617 : !llvm.ptr
      %6409 = arith.constant 11 : i64
      %6410 = func.call @cc_make_string(%6408, %6409) : (!llvm.ptr, i64) -> i64
      %6411 = func.call @cc_intern(%6407, %6410) : (i64, i64) -> i64
      %6412 = func.call @cc_nil_value() : () -> i64
      %6413 = func.call @cc_cons(%6411, %6412) : (i64, i64) -> i64
      %6414 = func.call @cc_values_pack(%6413) : (i64) -> i64
      func.call @stack_push_pointer(%6411) : (i64) -> ()
      %6415 = llvm.mlir.addressof @str618 : !llvm.ptr
      %6416 = arith.constant 16 : i64
      %6417 = func.call @cc_make_string(%6415, %6416) : (!llvm.ptr, i64) -> i64
      %6418 = llvm.mlir.addressof @str619 : !llvm.ptr
      %6419 = arith.constant 11 : i64
      %6420 = func.call @cc_make_string(%6418, %6419) : (!llvm.ptr, i64) -> i64
      %6421 = func.call @cc_intern(%6417, %6420) : (i64, i64) -> i64
      %6422 = func.call @cc_nil_value() : () -> i64
      %6423 = func.call @cc_cons(%6421, %6422) : (i64, i64) -> i64
      %6424 = func.call @cc_values_pack(%6423) : (i64) -> i64
      func.call @stack_push_pointer(%6421) : (i64) -> ()
      %6425 = llvm.mlir.addressof @str620 : !llvm.ptr
      %6426 = arith.constant 12 : i64
      %6427 = func.call @cc_make_string(%6425, %6426) : (!llvm.ptr, i64) -> i64
      %6428 = llvm.mlir.addressof @str621 : !llvm.ptr
      %6429 = arith.constant 11 : i64
      %6430 = func.call @cc_make_string(%6428, %6429) : (!llvm.ptr, i64) -> i64
      %6431 = func.call @cc_intern(%6427, %6430) : (i64, i64) -> i64
      %6432 = func.call @cc_nil_value() : () -> i64
      %6433 = func.call @cc_cons(%6431, %6432) : (i64, i64) -> i64
      %6434 = func.call @cc_values_pack(%6433) : (i64) -> i64
      func.call @stack_push_pointer(%6431) : (i64) -> ()
      %6435 = llvm.mlir.addressof @str622 : !llvm.ptr
      %6436 = arith.constant 20 : i64
      %6437 = func.call @cc_make_string(%6435, %6436) : (!llvm.ptr, i64) -> i64
      %6438 = llvm.mlir.addressof @str623 : !llvm.ptr
      %6439 = arith.constant 11 : i64
      %6440 = func.call @cc_make_string(%6438, %6439) : (!llvm.ptr, i64) -> i64
      %6441 = func.call @cc_intern(%6437, %6440) : (i64, i64) -> i64
      %6442 = func.call @cc_nil_value() : () -> i64
      %6443 = func.call @cc_cons(%6441, %6442) : (i64, i64) -> i64
      %6444 = func.call @cc_values_pack(%6443) : (i64) -> i64
      func.call @stack_push_pointer(%6441) : (i64) -> ()
      %6445 = llvm.mlir.addressof @str624 : !llvm.ptr
      %6446 = arith.constant 29 : i64
      %6447 = func.call @cc_make_string(%6445, %6446) : (!llvm.ptr, i64) -> i64
      %6448 = llvm.mlir.addressof @str625 : !llvm.ptr
      %6449 = arith.constant 11 : i64
      %6450 = func.call @cc_make_string(%6448, %6449) : (!llvm.ptr, i64) -> i64
      %6451 = func.call @cc_intern(%6447, %6450) : (i64, i64) -> i64
      %6452 = func.call @cc_nil_value() : () -> i64
      %6453 = func.call @cc_cons(%6451, %6452) : (i64, i64) -> i64
      %6454 = func.call @cc_values_pack(%6453) : (i64) -> i64
      func.call @stack_push_pointer(%6451) : (i64) -> ()
      %6455 = llvm.mlir.addressof @str626 : !llvm.ptr
      %6456 = arith.constant 14 : i64
      %6457 = func.call @cc_make_string(%6455, %6456) : (!llvm.ptr, i64) -> i64
      %6458 = llvm.mlir.addressof @str627 : !llvm.ptr
      %6459 = arith.constant 11 : i64
      %6460 = func.call @cc_make_string(%6458, %6459) : (!llvm.ptr, i64) -> i64
      %6461 = func.call @cc_intern(%6457, %6460) : (i64, i64) -> i64
      %6462 = func.call @cc_nil_value() : () -> i64
      %6463 = func.call @cc_cons(%6461, %6462) : (i64, i64) -> i64
      %6464 = func.call @cc_values_pack(%6463) : (i64) -> i64
      func.call @stack_push_pointer(%6461) : (i64) -> ()
      %6465 = llvm.mlir.addressof @str628 : !llvm.ptr
      %6466 = arith.constant 11 : i64
      %6467 = func.call @cc_make_string(%6465, %6466) : (!llvm.ptr, i64) -> i64
      %6468 = llvm.mlir.addressof @str629 : !llvm.ptr
      %6469 = arith.constant 11 : i64
      %6470 = func.call @cc_make_string(%6468, %6469) : (!llvm.ptr, i64) -> i64
      %6471 = func.call @cc_intern(%6467, %6470) : (i64, i64) -> i64
      %6472 = func.call @cc_nil_value() : () -> i64
      %6473 = func.call @cc_cons(%6471, %6472) : (i64, i64) -> i64
      %6474 = func.call @cc_values_pack(%6473) : (i64) -> i64
      func.call @stack_push_pointer(%6471) : (i64) -> ()
      %6475 = llvm.mlir.addressof @str630 : !llvm.ptr
      %6476 = arith.constant 11 : i64
      %6477 = func.call @cc_make_string(%6475, %6476) : (!llvm.ptr, i64) -> i64
      %6478 = llvm.mlir.addressof @str631 : !llvm.ptr
      %6479 = arith.constant 11 : i64
      %6480 = func.call @cc_make_string(%6478, %6479) : (!llvm.ptr, i64) -> i64
      %6481 = func.call @cc_intern(%6477, %6480) : (i64, i64) -> i64
      %6482 = func.call @cc_nil_value() : () -> i64
      %6483 = func.call @cc_cons(%6481, %6482) : (i64, i64) -> i64
      %6484 = func.call @cc_values_pack(%6483) : (i64) -> i64
      func.call @stack_push_pointer(%6481) : (i64) -> ()
      %6485 = llvm.mlir.addressof @str632 : !llvm.ptr
      %6486 = arith.constant 13 : i64
      %6487 = func.call @cc_make_string(%6485, %6486) : (!llvm.ptr, i64) -> i64
      %6488 = llvm.mlir.addressof @str633 : !llvm.ptr
      %6489 = arith.constant 11 : i64
      %6490 = func.call @cc_make_string(%6488, %6489) : (!llvm.ptr, i64) -> i64
      %6491 = func.call @cc_intern(%6487, %6490) : (i64, i64) -> i64
      %6492 = func.call @cc_nil_value() : () -> i64
      %6493 = func.call @cc_cons(%6491, %6492) : (i64, i64) -> i64
      %6494 = func.call @cc_values_pack(%6493) : (i64) -> i64
      func.call @stack_push_pointer(%6491) : (i64) -> ()
      %6495 = llvm.mlir.addressof @str634 : !llvm.ptr
      %6496 = arith.constant 10 : i64
      %6497 = func.call @cc_make_string(%6495, %6496) : (!llvm.ptr, i64) -> i64
      %6498 = llvm.mlir.addressof @str635 : !llvm.ptr
      %6499 = arith.constant 11 : i64
      %6500 = func.call @cc_make_string(%6498, %6499) : (!llvm.ptr, i64) -> i64
      %6501 = func.call @cc_intern(%6497, %6500) : (i64, i64) -> i64
      %6502 = func.call @cc_nil_value() : () -> i64
      %6503 = func.call @cc_cons(%6501, %6502) : (i64, i64) -> i64
      %6504 = func.call @cc_values_pack(%6503) : (i64) -> i64
      func.call @stack_push_pointer(%6501) : (i64) -> ()
      %6505 = llvm.mlir.addressof @str636 : !llvm.ptr
      %6506 = arith.constant 11 : i64
      %6507 = func.call @cc_make_string(%6505, %6506) : (!llvm.ptr, i64) -> i64
      %6508 = llvm.mlir.addressof @str637 : !llvm.ptr
      %6509 = arith.constant 11 : i64
      %6510 = func.call @cc_make_string(%6508, %6509) : (!llvm.ptr, i64) -> i64
      %6511 = func.call @cc_intern(%6507, %6510) : (i64, i64) -> i64
      %6512 = func.call @cc_nil_value() : () -> i64
      %6513 = func.call @cc_cons(%6511, %6512) : (i64, i64) -> i64
      %6514 = func.call @cc_values_pack(%6513) : (i64) -> i64
      func.call @stack_push_pointer(%6511) : (i64) -> ()
      %6515 = llvm.mlir.addressof @str638 : !llvm.ptr
      %6516 = arith.constant 6 : i64
      %6517 = func.call @cc_make_string(%6515, %6516) : (!llvm.ptr, i64) -> i64
      %6518 = llvm.mlir.addressof @str639 : !llvm.ptr
      %6519 = arith.constant 11 : i64
      %6520 = func.call @cc_make_string(%6518, %6519) : (!llvm.ptr, i64) -> i64
      %6521 = func.call @cc_intern(%6517, %6520) : (i64, i64) -> i64
      %6522 = func.call @cc_nil_value() : () -> i64
      %6523 = func.call @cc_cons(%6521, %6522) : (i64, i64) -> i64
      %6524 = func.call @cc_values_pack(%6523) : (i64) -> i64
      func.call @stack_push_pointer(%6521) : (i64) -> ()
      %6525 = llvm.mlir.addressof @str640 : !llvm.ptr
      %6526 = arith.constant 22 : i64
      %6527 = func.call @cc_make_string(%6525, %6526) : (!llvm.ptr, i64) -> i64
      %6528 = llvm.mlir.addressof @str641 : !llvm.ptr
      %6529 = arith.constant 11 : i64
      %6530 = func.call @cc_make_string(%6528, %6529) : (!llvm.ptr, i64) -> i64
      %6531 = func.call @cc_intern(%6527, %6530) : (i64, i64) -> i64
      %6532 = func.call @cc_nil_value() : () -> i64
      %6533 = func.call @cc_cons(%6531, %6532) : (i64, i64) -> i64
      %6534 = func.call @cc_values_pack(%6533) : (i64) -> i64
      func.call @stack_push_pointer(%6531) : (i64) -> ()
      %6535 = llvm.mlir.addressof @str642 : !llvm.ptr
      %6536 = arith.constant 32 : i64
      %6537 = func.call @cc_make_string(%6535, %6536) : (!llvm.ptr, i64) -> i64
      %6538 = llvm.mlir.addressof @str643 : !llvm.ptr
      %6539 = arith.constant 11 : i64
      %6540 = func.call @cc_make_string(%6538, %6539) : (!llvm.ptr, i64) -> i64
      %6541 = func.call @cc_intern(%6537, %6540) : (i64, i64) -> i64
      %6542 = func.call @cc_nil_value() : () -> i64
      %6543 = func.call @cc_cons(%6541, %6542) : (i64, i64) -> i64
      %6544 = func.call @cc_values_pack(%6543) : (i64) -> i64
      func.call @stack_push_pointer(%6541) : (i64) -> ()
      %6545 = llvm.mlir.addressof @str644 : !llvm.ptr
      %6546 = arith.constant 23 : i64
      %6547 = func.call @cc_make_string(%6545, %6546) : (!llvm.ptr, i64) -> i64
      %6548 = llvm.mlir.addressof @str645 : !llvm.ptr
      %6549 = arith.constant 11 : i64
      %6550 = func.call @cc_make_string(%6548, %6549) : (!llvm.ptr, i64) -> i64
      %6551 = func.call @cc_intern(%6547, %6550) : (i64, i64) -> i64
      %6552 = func.call @cc_nil_value() : () -> i64
      %6553 = func.call @cc_cons(%6551, %6552) : (i64, i64) -> i64
      %6554 = func.call @cc_values_pack(%6553) : (i64) -> i64
      func.call @stack_push_pointer(%6551) : (i64) -> ()
      %6555 = llvm.mlir.addressof @str646 : !llvm.ptr
      %6556 = arith.constant 24 : i64
      %6557 = func.call @cc_make_string(%6555, %6556) : (!llvm.ptr, i64) -> i64
      %6558 = llvm.mlir.addressof @str647 : !llvm.ptr
      %6559 = arith.constant 11 : i64
      %6560 = func.call @cc_make_string(%6558, %6559) : (!llvm.ptr, i64) -> i64
      %6561 = func.call @cc_intern(%6557, %6560) : (i64, i64) -> i64
      %6562 = func.call @cc_nil_value() : () -> i64
      %6563 = func.call @cc_cons(%6561, %6562) : (i64, i64) -> i64
      %6564 = func.call @cc_values_pack(%6563) : (i64) -> i64
      func.call @stack_push_pointer(%6561) : (i64) -> ()
      %6565 = llvm.mlir.addressof @str648 : !llvm.ptr
      %6566 = arith.constant 5 : i64
      %6567 = func.call @cc_make_string(%6565, %6566) : (!llvm.ptr, i64) -> i64
      %6568 = llvm.mlir.addressof @str649 : !llvm.ptr
      %6569 = arith.constant 11 : i64
      %6570 = func.call @cc_make_string(%6568, %6569) : (!llvm.ptr, i64) -> i64
      %6571 = func.call @cc_intern(%6567, %6570) : (i64, i64) -> i64
      %6572 = func.call @cc_nil_value() : () -> i64
      %6573 = func.call @cc_cons(%6571, %6572) : (i64, i64) -> i64
      %6574 = func.call @cc_values_pack(%6573) : (i64) -> i64
      func.call @stack_push_pointer(%6571) : (i64) -> ()
      %6575 = llvm.mlir.addressof @str650 : !llvm.ptr
      %6576 = arith.constant 16 : i64
      %6577 = func.call @cc_make_string(%6575, %6576) : (!llvm.ptr, i64) -> i64
      %6578 = llvm.mlir.addressof @str651 : !llvm.ptr
      %6579 = arith.constant 11 : i64
      %6580 = func.call @cc_make_string(%6578, %6579) : (!llvm.ptr, i64) -> i64
      %6581 = func.call @cc_intern(%6577, %6580) : (i64, i64) -> i64
      %6582 = func.call @cc_nil_value() : () -> i64
      %6583 = func.call @cc_cons(%6581, %6582) : (i64, i64) -> i64
      %6584 = func.call @cc_values_pack(%6583) : (i64) -> i64
      func.call @stack_push_pointer(%6581) : (i64) -> ()
      %6585 = llvm.mlir.addressof @str652 : !llvm.ptr
      %6586 = arith.constant 10 : i64
      %6587 = func.call @cc_make_string(%6585, %6586) : (!llvm.ptr, i64) -> i64
      %6588 = llvm.mlir.addressof @str653 : !llvm.ptr
      %6589 = arith.constant 11 : i64
      %6590 = func.call @cc_make_string(%6588, %6589) : (!llvm.ptr, i64) -> i64
      %6591 = func.call @cc_intern(%6587, %6590) : (i64, i64) -> i64
      %6592 = func.call @cc_nil_value() : () -> i64
      %6593 = func.call @cc_cons(%6591, %6592) : (i64, i64) -> i64
      %6594 = func.call @cc_values_pack(%6593) : (i64) -> i64
      func.call @stack_push_pointer(%6591) : (i64) -> ()
      %6595 = llvm.mlir.addressof @str654 : !llvm.ptr
      %6596 = arith.constant 9 : i64
      %6597 = func.call @cc_make_string(%6595, %6596) : (!llvm.ptr, i64) -> i64
      %6598 = llvm.mlir.addressof @str655 : !llvm.ptr
      %6599 = arith.constant 11 : i64
      %6600 = func.call @cc_make_string(%6598, %6599) : (!llvm.ptr, i64) -> i64
      %6601 = func.call @cc_intern(%6597, %6600) : (i64, i64) -> i64
      %6602 = func.call @cc_nil_value() : () -> i64
      %6603 = func.call @cc_cons(%6601, %6602) : (i64, i64) -> i64
      %6604 = func.call @cc_values_pack(%6603) : (i64) -> i64
      func.call @stack_push_pointer(%6601) : (i64) -> ()
      %6605 = llvm.mlir.addressof @str656 : !llvm.ptr
      %6606 = arith.constant 6 : i64
      %6607 = func.call @cc_make_string(%6605, %6606) : (!llvm.ptr, i64) -> i64
      %6608 = llvm.mlir.addressof @str657 : !llvm.ptr
      %6609 = arith.constant 11 : i64
      %6610 = func.call @cc_make_string(%6608, %6609) : (!llvm.ptr, i64) -> i64
      %6611 = func.call @cc_intern(%6607, %6610) : (i64, i64) -> i64
      %6612 = func.call @cc_nil_value() : () -> i64
      %6613 = func.call @cc_cons(%6611, %6612) : (i64, i64) -> i64
      %6614 = func.call @cc_values_pack(%6613) : (i64) -> i64
      func.call @stack_push_pointer(%6611) : (i64) -> ()
      %6615 = llvm.mlir.addressof @str658 : !llvm.ptr
      %6616 = arith.constant 6 : i64
      %6617 = func.call @cc_make_string(%6615, %6616) : (!llvm.ptr, i64) -> i64
      %6618 = llvm.mlir.addressof @str659 : !llvm.ptr
      %6619 = arith.constant 11 : i64
      %6620 = func.call @cc_make_string(%6618, %6619) : (!llvm.ptr, i64) -> i64
      %6621 = func.call @cc_intern(%6617, %6620) : (i64, i64) -> i64
      %6622 = func.call @cc_nil_value() : () -> i64
      %6623 = func.call @cc_cons(%6621, %6622) : (i64, i64) -> i64
      %6624 = func.call @cc_values_pack(%6623) : (i64) -> i64
      func.call @stack_push_pointer(%6621) : (i64) -> ()
      %6625 = llvm.mlir.addressof @str660 : !llvm.ptr
      %6626 = arith.constant 7 : i64
      %6627 = func.call @cc_make_string(%6625, %6626) : (!llvm.ptr, i64) -> i64
      %6628 = llvm.mlir.addressof @str661 : !llvm.ptr
      %6629 = arith.constant 11 : i64
      %6630 = func.call @cc_make_string(%6628, %6629) : (!llvm.ptr, i64) -> i64
      %6631 = func.call @cc_intern(%6627, %6630) : (i64, i64) -> i64
      %6632 = func.call @cc_nil_value() : () -> i64
      %6633 = func.call @cc_cons(%6631, %6632) : (i64, i64) -> i64
      %6634 = func.call @cc_values_pack(%6633) : (i64) -> i64
      func.call @stack_push_pointer(%6631) : (i64) -> ()
      %6635 = llvm.mlir.addressof @str662 : !llvm.ptr
      %6636 = arith.constant 30 : i64
      %6637 = func.call @cc_make_string(%6635, %6636) : (!llvm.ptr, i64) -> i64
      %6638 = llvm.mlir.addressof @str663 : !llvm.ptr
      %6639 = arith.constant 11 : i64
      %6640 = func.call @cc_make_string(%6638, %6639) : (!llvm.ptr, i64) -> i64
      %6641 = func.call @cc_intern(%6637, %6640) : (i64, i64) -> i64
      %6642 = func.call @cc_nil_value() : () -> i64
      %6643 = func.call @cc_cons(%6641, %6642) : (i64, i64) -> i64
      %6644 = func.call @cc_values_pack(%6643) : (i64) -> i64
      func.call @stack_push_pointer(%6641) : (i64) -> ()
      %6645 = llvm.mlir.addressof @str664 : !llvm.ptr
      %6646 = arith.constant 7 : i64
      %6647 = func.call @cc_make_string(%6645, %6646) : (!llvm.ptr, i64) -> i64
      %6648 = llvm.mlir.addressof @str665 : !llvm.ptr
      %6649 = arith.constant 11 : i64
      %6650 = func.call @cc_make_string(%6648, %6649) : (!llvm.ptr, i64) -> i64
      %6651 = func.call @cc_intern(%6647, %6650) : (i64, i64) -> i64
      %6652 = func.call @cc_nil_value() : () -> i64
      %6653 = func.call @cc_cons(%6651, %6652) : (i64, i64) -> i64
      %6654 = func.call @cc_values_pack(%6653) : (i64) -> i64
      func.call @stack_push_pointer(%6651) : (i64) -> ()
      %6655 = llvm.mlir.addressof @str666 : !llvm.ptr
      %6656 = arith.constant 20 : i64
      %6657 = func.call @cc_make_string(%6655, %6656) : (!llvm.ptr, i64) -> i64
      %6658 = llvm.mlir.addressof @str667 : !llvm.ptr
      %6659 = arith.constant 11 : i64
      %6660 = func.call @cc_make_string(%6658, %6659) : (!llvm.ptr, i64) -> i64
      %6661 = func.call @cc_intern(%6657, %6660) : (i64, i64) -> i64
      %6662 = func.call @cc_nil_value() : () -> i64
      %6663 = func.call @cc_cons(%6661, %6662) : (i64, i64) -> i64
      %6664 = func.call @cc_values_pack(%6663) : (i64) -> i64
      func.call @stack_push_pointer(%6661) : (i64) -> ()
      %6665 = llvm.mlir.addressof @str668 : !llvm.ptr
      %6666 = arith.constant 23 : i64
      %6667 = func.call @cc_make_string(%6665, %6666) : (!llvm.ptr, i64) -> i64
      %6668 = llvm.mlir.addressof @str669 : !llvm.ptr
      %6669 = arith.constant 11 : i64
      %6670 = func.call @cc_make_string(%6668, %6669) : (!llvm.ptr, i64) -> i64
      %6671 = func.call @cc_intern(%6667, %6670) : (i64, i64) -> i64
      %6672 = func.call @cc_nil_value() : () -> i64
      %6673 = func.call @cc_cons(%6671, %6672) : (i64, i64) -> i64
      %6674 = func.call @cc_values_pack(%6673) : (i64) -> i64
      func.call @stack_push_pointer(%6671) : (i64) -> ()
      %6675 = llvm.mlir.addressof @str670 : !llvm.ptr
      %6676 = arith.constant 27 : i64
      %6677 = func.call @cc_make_string(%6675, %6676) : (!llvm.ptr, i64) -> i64
      %6678 = llvm.mlir.addressof @str671 : !llvm.ptr
      %6679 = arith.constant 11 : i64
      %6680 = func.call @cc_make_string(%6678, %6679) : (!llvm.ptr, i64) -> i64
      %6681 = func.call @cc_intern(%6677, %6680) : (i64, i64) -> i64
      %6682 = func.call @cc_nil_value() : () -> i64
      %6683 = func.call @cc_cons(%6681, %6682) : (i64, i64) -> i64
      %6684 = func.call @cc_values_pack(%6683) : (i64) -> i64
      func.call @stack_push_pointer(%6681) : (i64) -> ()
      %6685 = llvm.mlir.addressof @str672 : !llvm.ptr
      %6686 = arith.constant 25 : i64
      %6687 = func.call @cc_make_string(%6685, %6686) : (!llvm.ptr, i64) -> i64
      %6688 = llvm.mlir.addressof @str673 : !llvm.ptr
      %6689 = arith.constant 11 : i64
      %6690 = func.call @cc_make_string(%6688, %6689) : (!llvm.ptr, i64) -> i64
      %6691 = func.call @cc_intern(%6687, %6690) : (i64, i64) -> i64
      %6692 = func.call @cc_nil_value() : () -> i64
      %6693 = func.call @cc_cons(%6691, %6692) : (i64, i64) -> i64
      %6694 = func.call @cc_values_pack(%6693) : (i64) -> i64
      func.call @stack_push_pointer(%6691) : (i64) -> ()
      %6695 = llvm.mlir.addressof @str674 : !llvm.ptr
      %6696 = arith.constant 38 : i64
      %6697 = func.call @cc_make_string(%6695, %6696) : (!llvm.ptr, i64) -> i64
      %6698 = llvm.mlir.addressof @str675 : !llvm.ptr
      %6699 = arith.constant 11 : i64
      %6700 = func.call @cc_make_string(%6698, %6699) : (!llvm.ptr, i64) -> i64
      %6701 = func.call @cc_intern(%6697, %6700) : (i64, i64) -> i64
      %6702 = func.call @cc_nil_value() : () -> i64
      %6703 = func.call @cc_cons(%6701, %6702) : (i64, i64) -> i64
      %6704 = func.call @cc_values_pack(%6703) : (i64) -> i64
      func.call @stack_push_pointer(%6701) : (i64) -> ()
      %6705 = llvm.mlir.addressof @str676 : !llvm.ptr
      %6706 = arith.constant 36 : i64
      %6707 = func.call @cc_make_string(%6705, %6706) : (!llvm.ptr, i64) -> i64
      %6708 = llvm.mlir.addressof @str677 : !llvm.ptr
      %6709 = arith.constant 11 : i64
      %6710 = func.call @cc_make_string(%6708, %6709) : (!llvm.ptr, i64) -> i64
      %6711 = func.call @cc_intern(%6707, %6710) : (i64, i64) -> i64
      %6712 = func.call @cc_nil_value() : () -> i64
      %6713 = func.call @cc_cons(%6711, %6712) : (i64, i64) -> i64
      %6714 = func.call @cc_values_pack(%6713) : (i64) -> i64
      func.call @stack_push_pointer(%6711) : (i64) -> ()
      %6715 = llvm.mlir.addressof @str678 : !llvm.ptr
      %6716 = arith.constant 37 : i64
      %6717 = func.call @cc_make_string(%6715, %6716) : (!llvm.ptr, i64) -> i64
      %6718 = llvm.mlir.addressof @str679 : !llvm.ptr
      %6719 = arith.constant 11 : i64
      %6720 = func.call @cc_make_string(%6718, %6719) : (!llvm.ptr, i64) -> i64
      %6721 = func.call @cc_intern(%6717, %6720) : (i64, i64) -> i64
      %6722 = func.call @cc_nil_value() : () -> i64
      %6723 = func.call @cc_cons(%6721, %6722) : (i64, i64) -> i64
      %6724 = func.call @cc_values_pack(%6723) : (i64) -> i64
      func.call @stack_push_pointer(%6721) : (i64) -> ()
      %6725 = llvm.mlir.addressof @str680 : !llvm.ptr
      %6726 = arith.constant 38 : i64
      %6727 = func.call @cc_make_string(%6725, %6726) : (!llvm.ptr, i64) -> i64
      %6728 = llvm.mlir.addressof @str681 : !llvm.ptr
      %6729 = arith.constant 11 : i64
      %6730 = func.call @cc_make_string(%6728, %6729) : (!llvm.ptr, i64) -> i64
      %6731 = func.call @cc_intern(%6727, %6730) : (i64, i64) -> i64
      %6732 = func.call @cc_nil_value() : () -> i64
      %6733 = func.call @cc_cons(%6731, %6732) : (i64, i64) -> i64
      %6734 = func.call @cc_values_pack(%6733) : (i64) -> i64
      func.call @stack_push_pointer(%6731) : (i64) -> ()
      %6735 = llvm.mlir.addressof @str682 : !llvm.ptr
      %6736 = arith.constant 26 : i64
      %6737 = func.call @cc_make_string(%6735, %6736) : (!llvm.ptr, i64) -> i64
      %6738 = llvm.mlir.addressof @str683 : !llvm.ptr
      %6739 = arith.constant 11 : i64
      %6740 = func.call @cc_make_string(%6738, %6739) : (!llvm.ptr, i64) -> i64
      %6741 = func.call @cc_intern(%6737, %6740) : (i64, i64) -> i64
      %6742 = func.call @cc_nil_value() : () -> i64
      %6743 = func.call @cc_cons(%6741, %6742) : (i64, i64) -> i64
      %6744 = func.call @cc_values_pack(%6743) : (i64) -> i64
      func.call @stack_push_pointer(%6741) : (i64) -> ()
      %6745 = llvm.mlir.addressof @str684 : !llvm.ptr
      %6746 = arith.constant 27 : i64
      %6747 = func.call @cc_make_string(%6745, %6746) : (!llvm.ptr, i64) -> i64
      %6748 = llvm.mlir.addressof @str685 : !llvm.ptr
      %6749 = arith.constant 11 : i64
      %6750 = func.call @cc_make_string(%6748, %6749) : (!llvm.ptr, i64) -> i64
      %6751 = func.call @cc_intern(%6747, %6750) : (i64, i64) -> i64
      %6752 = func.call @cc_nil_value() : () -> i64
      %6753 = func.call @cc_cons(%6751, %6752) : (i64, i64) -> i64
      %6754 = func.call @cc_values_pack(%6753) : (i64) -> i64
      func.call @stack_push_pointer(%6751) : (i64) -> ()
      %6755 = llvm.mlir.addressof @str686 : !llvm.ptr
      %6756 = arith.constant 27 : i64
      %6757 = func.call @cc_make_string(%6755, %6756) : (!llvm.ptr, i64) -> i64
      %6758 = llvm.mlir.addressof @str687 : !llvm.ptr
      %6759 = arith.constant 11 : i64
      %6760 = func.call @cc_make_string(%6758, %6759) : (!llvm.ptr, i64) -> i64
      %6761 = func.call @cc_intern(%6757, %6760) : (i64, i64) -> i64
      %6762 = func.call @cc_nil_value() : () -> i64
      %6763 = func.call @cc_cons(%6761, %6762) : (i64, i64) -> i64
      %6764 = func.call @cc_values_pack(%6763) : (i64) -> i64
      func.call @stack_push_pointer(%6761) : (i64) -> ()
      %6765 = llvm.mlir.addressof @str688 : !llvm.ptr
      %6766 = arith.constant 25 : i64
      %6767 = func.call @cc_make_string(%6765, %6766) : (!llvm.ptr, i64) -> i64
      %6768 = llvm.mlir.addressof @str689 : !llvm.ptr
      %6769 = arith.constant 11 : i64
      %6770 = func.call @cc_make_string(%6768, %6769) : (!llvm.ptr, i64) -> i64
      %6771 = func.call @cc_intern(%6767, %6770) : (i64, i64) -> i64
      %6772 = func.call @cc_nil_value() : () -> i64
      %6773 = func.call @cc_cons(%6771, %6772) : (i64, i64) -> i64
      %6774 = func.call @cc_values_pack(%6773) : (i64) -> i64
      func.call @stack_push_pointer(%6771) : (i64) -> ()
      %6775 = llvm.mlir.addressof @str690 : !llvm.ptr
      %6776 = arith.constant 38 : i64
      %6777 = func.call @cc_make_string(%6775, %6776) : (!llvm.ptr, i64) -> i64
      %6778 = llvm.mlir.addressof @str691 : !llvm.ptr
      %6779 = arith.constant 11 : i64
      %6780 = func.call @cc_make_string(%6778, %6779) : (!llvm.ptr, i64) -> i64
      %6781 = func.call @cc_intern(%6777, %6780) : (i64, i64) -> i64
      %6782 = func.call @cc_nil_value() : () -> i64
      %6783 = func.call @cc_cons(%6781, %6782) : (i64, i64) -> i64
      %6784 = func.call @cc_values_pack(%6783) : (i64) -> i64
      func.call @stack_push_pointer(%6781) : (i64) -> ()
      %6785 = llvm.mlir.addressof @str692 : !llvm.ptr
      %6786 = arith.constant 36 : i64
      %6787 = func.call @cc_make_string(%6785, %6786) : (!llvm.ptr, i64) -> i64
      %6788 = llvm.mlir.addressof @str693 : !llvm.ptr
      %6789 = arith.constant 11 : i64
      %6790 = func.call @cc_make_string(%6788, %6789) : (!llvm.ptr, i64) -> i64
      %6791 = func.call @cc_intern(%6787, %6790) : (i64, i64) -> i64
      %6792 = func.call @cc_nil_value() : () -> i64
      %6793 = func.call @cc_cons(%6791, %6792) : (i64, i64) -> i64
      %6794 = func.call @cc_values_pack(%6793) : (i64) -> i64
      func.call @stack_push_pointer(%6791) : (i64) -> ()
      %6795 = llvm.mlir.addressof @str694 : !llvm.ptr
      %6796 = arith.constant 37 : i64
      %6797 = func.call @cc_make_string(%6795, %6796) : (!llvm.ptr, i64) -> i64
      %6798 = llvm.mlir.addressof @str695 : !llvm.ptr
      %6799 = arith.constant 11 : i64
      %6800 = func.call @cc_make_string(%6798, %6799) : (!llvm.ptr, i64) -> i64
      %6801 = func.call @cc_intern(%6797, %6800) : (i64, i64) -> i64
      %6802 = func.call @cc_nil_value() : () -> i64
      %6803 = func.call @cc_cons(%6801, %6802) : (i64, i64) -> i64
      %6804 = func.call @cc_values_pack(%6803) : (i64) -> i64
      func.call @stack_push_pointer(%6801) : (i64) -> ()
      %6805 = llvm.mlir.addressof @str696 : !llvm.ptr
      %6806 = arith.constant 38 : i64
      %6807 = func.call @cc_make_string(%6805, %6806) : (!llvm.ptr, i64) -> i64
      %6808 = llvm.mlir.addressof @str697 : !llvm.ptr
      %6809 = arith.constant 11 : i64
      %6810 = func.call @cc_make_string(%6808, %6809) : (!llvm.ptr, i64) -> i64
      %6811 = func.call @cc_intern(%6807, %6810) : (i64, i64) -> i64
      %6812 = func.call @cc_nil_value() : () -> i64
      %6813 = func.call @cc_cons(%6811, %6812) : (i64, i64) -> i64
      %6814 = func.call @cc_values_pack(%6813) : (i64) -> i64
      func.call @stack_push_pointer(%6811) : (i64) -> ()
      %6815 = llvm.mlir.addressof @str698 : !llvm.ptr
      %6816 = arith.constant 26 : i64
      %6817 = func.call @cc_make_string(%6815, %6816) : (!llvm.ptr, i64) -> i64
      %6818 = llvm.mlir.addressof @str699 : !llvm.ptr
      %6819 = arith.constant 11 : i64
      %6820 = func.call @cc_make_string(%6818, %6819) : (!llvm.ptr, i64) -> i64
      %6821 = func.call @cc_intern(%6817, %6820) : (i64, i64) -> i64
      %6822 = func.call @cc_nil_value() : () -> i64
      %6823 = func.call @cc_cons(%6821, %6822) : (i64, i64) -> i64
      %6824 = func.call @cc_values_pack(%6823) : (i64) -> i64
      func.call @stack_push_pointer(%6821) : (i64) -> ()
      %6825 = llvm.mlir.addressof @str700 : !llvm.ptr
      %6826 = arith.constant 27 : i64
      %6827 = func.call @cc_make_string(%6825, %6826) : (!llvm.ptr, i64) -> i64
      %6828 = llvm.mlir.addressof @str701 : !llvm.ptr
      %6829 = arith.constant 11 : i64
      %6830 = func.call @cc_make_string(%6828, %6829) : (!llvm.ptr, i64) -> i64
      %6831 = func.call @cc_intern(%6827, %6830) : (i64, i64) -> i64
      %6832 = func.call @cc_nil_value() : () -> i64
      %6833 = func.call @cc_cons(%6831, %6832) : (i64, i64) -> i64
      %6834 = func.call @cc_values_pack(%6833) : (i64) -> i64
      func.call @stack_push_pointer(%6831) : (i64) -> ()
      %6835 = llvm.mlir.addressof @str702 : !llvm.ptr
      %6836 = arith.constant 10 : i64
      %6837 = func.call @cc_make_string(%6835, %6836) : (!llvm.ptr, i64) -> i64
      %6838 = llvm.mlir.addressof @str703 : !llvm.ptr
      %6839 = arith.constant 11 : i64
      %6840 = func.call @cc_make_string(%6838, %6839) : (!llvm.ptr, i64) -> i64
      %6841 = func.call @cc_intern(%6837, %6840) : (i64, i64) -> i64
      %6842 = func.call @cc_nil_value() : () -> i64
      %6843 = func.call @cc_cons(%6841, %6842) : (i64, i64) -> i64
      %6844 = func.call @cc_values_pack(%6843) : (i64) -> i64
      func.call @stack_push_pointer(%6841) : (i64) -> ()
      %6845 = llvm.mlir.addressof @str704 : !llvm.ptr
      %6846 = arith.constant 18 : i64
      %6847 = func.call @cc_make_string(%6845, %6846) : (!llvm.ptr, i64) -> i64
      %6848 = llvm.mlir.addressof @str705 : !llvm.ptr
      %6849 = arith.constant 11 : i64
      %6850 = func.call @cc_make_string(%6848, %6849) : (!llvm.ptr, i64) -> i64
      %6851 = func.call @cc_intern(%6847, %6850) : (i64, i64) -> i64
      %6852 = func.call @cc_nil_value() : () -> i64
      %6853 = func.call @cc_cons(%6851, %6852) : (i64, i64) -> i64
      %6854 = func.call @cc_values_pack(%6853) : (i64) -> i64
      func.call @stack_push_pointer(%6851) : (i64) -> ()
      %6855 = llvm.mlir.addressof @str706 : !llvm.ptr
      %6856 = arith.constant 27 : i64
      %6857 = func.call @cc_make_string(%6855, %6856) : (!llvm.ptr, i64) -> i64
      %6858 = llvm.mlir.addressof @str707 : !llvm.ptr
      %6859 = arith.constant 11 : i64
      %6860 = func.call @cc_make_string(%6858, %6859) : (!llvm.ptr, i64) -> i64
      %6861 = func.call @cc_intern(%6857, %6860) : (i64, i64) -> i64
      %6862 = func.call @cc_nil_value() : () -> i64
      %6863 = func.call @cc_cons(%6861, %6862) : (i64, i64) -> i64
      %6864 = func.call @cc_values_pack(%6863) : (i64) -> i64
      func.call @stack_push_pointer(%6861) : (i64) -> ()
      %6865 = llvm.mlir.addressof @str708 : !llvm.ptr
      %6866 = arith.constant 6 : i64
      %6867 = func.call @cc_make_string(%6865, %6866) : (!llvm.ptr, i64) -> i64
      %6868 = llvm.mlir.addressof @str709 : !llvm.ptr
      %6869 = arith.constant 11 : i64
      %6870 = func.call @cc_make_string(%6868, %6869) : (!llvm.ptr, i64) -> i64
      %6871 = func.call @cc_intern(%6867, %6870) : (i64, i64) -> i64
      %6872 = func.call @cc_nil_value() : () -> i64
      %6873 = func.call @cc_cons(%6871, %6872) : (i64, i64) -> i64
      %6874 = func.call @cc_values_pack(%6873) : (i64) -> i64
      func.call @stack_push_pointer(%6871) : (i64) -> ()
      %6875 = llvm.mlir.addressof @str710 : !llvm.ptr
      %6876 = arith.constant 18 : i64
      %6877 = func.call @cc_make_string(%6875, %6876) : (!llvm.ptr, i64) -> i64
      %6878 = llvm.mlir.addressof @str711 : !llvm.ptr
      %6879 = arith.constant 11 : i64
      %6880 = func.call @cc_make_string(%6878, %6879) : (!llvm.ptr, i64) -> i64
      %6881 = func.call @cc_intern(%6877, %6880) : (i64, i64) -> i64
      %6882 = func.call @cc_nil_value() : () -> i64
      %6883 = func.call @cc_cons(%6881, %6882) : (i64, i64) -> i64
      %6884 = func.call @cc_values_pack(%6883) : (i64) -> i64
      func.call @stack_push_pointer(%6881) : (i64) -> ()
      %6885 = llvm.mlir.addressof @str712 : !llvm.ptr
      %6886 = arith.constant 26 : i64
      %6887 = func.call @cc_make_string(%6885, %6886) : (!llvm.ptr, i64) -> i64
      %6888 = llvm.mlir.addressof @str713 : !llvm.ptr
      %6889 = arith.constant 11 : i64
      %6890 = func.call @cc_make_string(%6888, %6889) : (!llvm.ptr, i64) -> i64
      %6891 = func.call @cc_intern(%6887, %6890) : (i64, i64) -> i64
      %6892 = func.call @cc_nil_value() : () -> i64
      %6893 = func.call @cc_cons(%6891, %6892) : (i64, i64) -> i64
      %6894 = func.call @cc_values_pack(%6893) : (i64) -> i64
      func.call @stack_push_pointer(%6891) : (i64) -> ()
      %6895 = llvm.mlir.addressof @str714 : !llvm.ptr
      %6896 = arith.constant 20 : i64
      %6897 = func.call @cc_make_string(%6895, %6896) : (!llvm.ptr, i64) -> i64
      %6898 = llvm.mlir.addressof @str715 : !llvm.ptr
      %6899 = arith.constant 11 : i64
      %6900 = func.call @cc_make_string(%6898, %6899) : (!llvm.ptr, i64) -> i64
      %6901 = func.call @cc_intern(%6897, %6900) : (i64, i64) -> i64
      %6902 = func.call @cc_nil_value() : () -> i64
      %6903 = func.call @cc_cons(%6901, %6902) : (i64, i64) -> i64
      %6904 = func.call @cc_values_pack(%6903) : (i64) -> i64
      func.call @stack_push_pointer(%6901) : (i64) -> ()
      %6905 = llvm.mlir.addressof @str716 : !llvm.ptr
      %6906 = arith.constant 24 : i64
      %6907 = func.call @cc_make_string(%6905, %6906) : (!llvm.ptr, i64) -> i64
      %6908 = llvm.mlir.addressof @str717 : !llvm.ptr
      %6909 = arith.constant 11 : i64
      %6910 = func.call @cc_make_string(%6908, %6909) : (!llvm.ptr, i64) -> i64
      %6911 = func.call @cc_intern(%6907, %6910) : (i64, i64) -> i64
      %6912 = func.call @cc_nil_value() : () -> i64
      %6913 = func.call @cc_cons(%6911, %6912) : (i64, i64) -> i64
      %6914 = func.call @cc_values_pack(%6913) : (i64) -> i64
      func.call @stack_push_pointer(%6911) : (i64) -> ()
      %6915 = llvm.mlir.addressof @str718 : !llvm.ptr
      %6916 = arith.constant 25 : i64
      %6917 = func.call @cc_make_string(%6915, %6916) : (!llvm.ptr, i64) -> i64
      %6918 = llvm.mlir.addressof @str719 : !llvm.ptr
      %6919 = arith.constant 11 : i64
      %6920 = func.call @cc_make_string(%6918, %6919) : (!llvm.ptr, i64) -> i64
      %6921 = func.call @cc_intern(%6917, %6920) : (i64, i64) -> i64
      %6922 = func.call @cc_nil_value() : () -> i64
      %6923 = func.call @cc_cons(%6921, %6922) : (i64, i64) -> i64
      %6924 = func.call @cc_values_pack(%6923) : (i64) -> i64
      func.call @stack_push_pointer(%6921) : (i64) -> ()
      %6925 = llvm.mlir.addressof @str720 : !llvm.ptr
      %6926 = arith.constant 26 : i64
      %6927 = func.call @cc_make_string(%6925, %6926) : (!llvm.ptr, i64) -> i64
      %6928 = llvm.mlir.addressof @str721 : !llvm.ptr
      %6929 = arith.constant 11 : i64
      %6930 = func.call @cc_make_string(%6928, %6929) : (!llvm.ptr, i64) -> i64
      %6931 = func.call @cc_intern(%6927, %6930) : (i64, i64) -> i64
      %6932 = func.call @cc_nil_value() : () -> i64
      %6933 = func.call @cc_cons(%6931, %6932) : (i64, i64) -> i64
      %6934 = func.call @cc_values_pack(%6933) : (i64) -> i64
      func.call @stack_push_pointer(%6931) : (i64) -> ()
      %6935 = llvm.mlir.addressof @str722 : !llvm.ptr
      %6936 = arith.constant 26 : i64
      %6937 = func.call @cc_make_string(%6935, %6936) : (!llvm.ptr, i64) -> i64
      %6938 = llvm.mlir.addressof @str723 : !llvm.ptr
      %6939 = arith.constant 11 : i64
      %6940 = func.call @cc_make_string(%6938, %6939) : (!llvm.ptr, i64) -> i64
      %6941 = func.call @cc_intern(%6937, %6940) : (i64, i64) -> i64
      %6942 = func.call @cc_nil_value() : () -> i64
      %6943 = func.call @cc_cons(%6941, %6942) : (i64, i64) -> i64
      %6944 = func.call @cc_values_pack(%6943) : (i64) -> i64
      func.call @stack_push_pointer(%6941) : (i64) -> ()
      %6945 = llvm.mlir.addressof @str724 : !llvm.ptr
      %6946 = arith.constant 20 : i64
      %6947 = func.call @cc_make_string(%6945, %6946) : (!llvm.ptr, i64) -> i64
      %6948 = llvm.mlir.addressof @str725 : !llvm.ptr
      %6949 = arith.constant 11 : i64
      %6950 = func.call @cc_make_string(%6948, %6949) : (!llvm.ptr, i64) -> i64
      %6951 = func.call @cc_intern(%6947, %6950) : (i64, i64) -> i64
      %6952 = func.call @cc_nil_value() : () -> i64
      %6953 = func.call @cc_cons(%6951, %6952) : (i64, i64) -> i64
      %6954 = func.call @cc_values_pack(%6953) : (i64) -> i64
      func.call @stack_push_pointer(%6951) : (i64) -> ()
      %6955 = llvm.mlir.addressof @str726 : !llvm.ptr
      %6956 = arith.constant 24 : i64
      %6957 = func.call @cc_make_string(%6955, %6956) : (!llvm.ptr, i64) -> i64
      %6958 = llvm.mlir.addressof @str727 : !llvm.ptr
      %6959 = arith.constant 11 : i64
      %6960 = func.call @cc_make_string(%6958, %6959) : (!llvm.ptr, i64) -> i64
      %6961 = func.call @cc_intern(%6957, %6960) : (i64, i64) -> i64
      %6962 = func.call @cc_nil_value() : () -> i64
      %6963 = func.call @cc_cons(%6961, %6962) : (i64, i64) -> i64
      %6964 = func.call @cc_values_pack(%6963) : (i64) -> i64
      func.call @stack_push_pointer(%6961) : (i64) -> ()
      %6965 = llvm.mlir.addressof @str728 : !llvm.ptr
      %6966 = arith.constant 25 : i64
      %6967 = func.call @cc_make_string(%6965, %6966) : (!llvm.ptr, i64) -> i64
      %6968 = llvm.mlir.addressof @str729 : !llvm.ptr
      %6969 = arith.constant 11 : i64
      %6970 = func.call @cc_make_string(%6968, %6969) : (!llvm.ptr, i64) -> i64
      %6971 = func.call @cc_intern(%6967, %6970) : (i64, i64) -> i64
      %6972 = func.call @cc_nil_value() : () -> i64
      %6973 = func.call @cc_cons(%6971, %6972) : (i64, i64) -> i64
      %6974 = func.call @cc_values_pack(%6973) : (i64) -> i64
      func.call @stack_push_pointer(%6971) : (i64) -> ()
      %6975 = llvm.mlir.addressof @str730 : !llvm.ptr
      %6976 = arith.constant 26 : i64
      %6977 = func.call @cc_make_string(%6975, %6976) : (!llvm.ptr, i64) -> i64
      %6978 = llvm.mlir.addressof @str731 : !llvm.ptr
      %6979 = arith.constant 11 : i64
      %6980 = func.call @cc_make_string(%6978, %6979) : (!llvm.ptr, i64) -> i64
      %6981 = func.call @cc_intern(%6977, %6980) : (i64, i64) -> i64
      %6982 = func.call @cc_nil_value() : () -> i64
      %6983 = func.call @cc_cons(%6981, %6982) : (i64, i64) -> i64
      %6984 = func.call @cc_values_pack(%6983) : (i64) -> i64
      func.call @stack_push_pointer(%6981) : (i64) -> ()
      %6985 = llvm.mlir.addressof @str732 : !llvm.ptr
      %6986 = arith.constant 21 : i64
      %6987 = func.call @cc_make_string(%6985, %6986) : (!llvm.ptr, i64) -> i64
      %6988 = llvm.mlir.addressof @str733 : !llvm.ptr
      %6989 = arith.constant 11 : i64
      %6990 = func.call @cc_make_string(%6988, %6989) : (!llvm.ptr, i64) -> i64
      %6991 = func.call @cc_intern(%6987, %6990) : (i64, i64) -> i64
      %6992 = func.call @cc_nil_value() : () -> i64
      %6993 = func.call @cc_cons(%6991, %6992) : (i64, i64) -> i64
      %6994 = func.call @cc_values_pack(%6993) : (i64) -> i64
      func.call @stack_push_pointer(%6991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6995 = llvm.mlir.addressof @str734 : !llvm.ptr
      %6996 = arith.constant 9 : i64
      %6997 = func.call @cc_make_string(%6995, %6996) : (!llvm.ptr, i64) -> i64
      %6998 = llvm.mlir.addressof @str735 : !llvm.ptr
      %6999 = arith.constant 11 : i64
      %7000 = func.call @cc_make_string(%6998, %6999) : (!llvm.ptr, i64) -> i64
      %7001 = func.call @cc_intern(%6997, %7000) : (i64, i64) -> i64
      %7002 = func.call @cc_nil_value() : () -> i64
      %7003 = func.call @cc_cons(%7001, %7002) : (i64, i64) -> i64
      %7004 = func.call @cc_values_pack(%7003) : (i64) -> i64
      func.call @stack_push_pointer(%7001) : (i64) -> ()
      %7005 = llvm.mlir.addressof @str736 : !llvm.ptr
      %7006 = arith.constant 6 : i64
      %7007 = func.call @cc_make_string(%7005, %7006) : (!llvm.ptr, i64) -> i64
      %7008 = llvm.mlir.addressof @str737 : !llvm.ptr
      %7009 = arith.constant 11 : i64
      %7010 = func.call @cc_make_string(%7008, %7009) : (!llvm.ptr, i64) -> i64
      %7011 = func.call @cc_intern(%7007, %7010) : (i64, i64) -> i64
      %7012 = func.call @cc_nil_value() : () -> i64
      %7013 = func.call @cc_cons(%7011, %7012) : (i64, i64) -> i64
      %7014 = func.call @cc_values_pack(%7013) : (i64) -> i64
      func.call @stack_push_pointer(%7011) : (i64) -> ()
      %7015 = llvm.mlir.addressof @str738 : !llvm.ptr
      %7016 = arith.constant 8 : i64
      %7017 = func.call @cc_make_string(%7015, %7016) : (!llvm.ptr, i64) -> i64
      %7018 = llvm.mlir.addressof @str739 : !llvm.ptr
      %7019 = arith.constant 11 : i64
      %7020 = func.call @cc_make_string(%7018, %7019) : (!llvm.ptr, i64) -> i64
      %7021 = func.call @cc_intern(%7017, %7020) : (i64, i64) -> i64
      %7022 = func.call @cc_nil_value() : () -> i64
      %7023 = func.call @cc_cons(%7021, %7022) : (i64, i64) -> i64
      %7024 = func.call @cc_values_pack(%7023) : (i64) -> i64
      func.call @stack_push_pointer(%7021) : (i64) -> ()
      %7025 = llvm.mlir.addressof @str740 : !llvm.ptr
      %7026 = arith.constant 9 : i64
      %7027 = func.call @cc_make_string(%7025, %7026) : (!llvm.ptr, i64) -> i64
      %7028 = llvm.mlir.addressof @str741 : !llvm.ptr
      %7029 = arith.constant 11 : i64
      %7030 = func.call @cc_make_string(%7028, %7029) : (!llvm.ptr, i64) -> i64
      %7031 = func.call @cc_intern(%7027, %7030) : (i64, i64) -> i64
      %7032 = func.call @cc_nil_value() : () -> i64
      %7033 = func.call @cc_cons(%7031, %7032) : (i64, i64) -> i64
      %7034 = func.call @cc_values_pack(%7033) : (i64) -> i64
      func.call @stack_push_pointer(%7031) : (i64) -> ()
      %7035 = llvm.mlir.addressof @str742 : !llvm.ptr
      %7036 = arith.constant 7 : i64
      %7037 = func.call @cc_make_string(%7035, %7036) : (!llvm.ptr, i64) -> i64
      %7038 = llvm.mlir.addressof @str743 : !llvm.ptr
      %7039 = arith.constant 11 : i64
      %7040 = func.call @cc_make_string(%7038, %7039) : (!llvm.ptr, i64) -> i64
      %7041 = func.call @cc_intern(%7037, %7040) : (i64, i64) -> i64
      %7042 = func.call @cc_nil_value() : () -> i64
      %7043 = func.call @cc_cons(%7041, %7042) : (i64, i64) -> i64
      %7044 = func.call @cc_values_pack(%7043) : (i64) -> i64
      func.call @stack_push_pointer(%7041) : (i64) -> ()
      %7045 = llvm.mlir.addressof @str744 : !llvm.ptr
      %7046 = arith.constant 13 : i64
      %7047 = func.call @cc_make_string(%7045, %7046) : (!llvm.ptr, i64) -> i64
      %7048 = llvm.mlir.addressof @str745 : !llvm.ptr
      %7049 = arith.constant 11 : i64
      %7050 = func.call @cc_make_string(%7048, %7049) : (!llvm.ptr, i64) -> i64
      %7051 = func.call @cc_intern(%7047, %7050) : (i64, i64) -> i64
      %7052 = func.call @cc_nil_value() : () -> i64
      %7053 = func.call @cc_cons(%7051, %7052) : (i64, i64) -> i64
      %7054 = func.call @cc_values_pack(%7053) : (i64) -> i64
      func.call @stack_push_pointer(%7051) : (i64) -> ()
      %7055 = llvm.mlir.addressof @str746 : !llvm.ptr
      %7056 = arith.constant 11 : i64
      %7057 = func.call @cc_make_string(%7055, %7056) : (!llvm.ptr, i64) -> i64
      %7058 = llvm.mlir.addressof @str747 : !llvm.ptr
      %7059 = arith.constant 11 : i64
      %7060 = func.call @cc_make_string(%7058, %7059) : (!llvm.ptr, i64) -> i64
      %7061 = func.call @cc_intern(%7057, %7060) : (i64, i64) -> i64
      %7062 = func.call @cc_nil_value() : () -> i64
      %7063 = func.call @cc_cons(%7061, %7062) : (i64, i64) -> i64
      %7064 = func.call @cc_values_pack(%7063) : (i64) -> i64
      func.call @stack_push_pointer(%7061) : (i64) -> ()
      %7065 = llvm.mlir.addressof @str748 : !llvm.ptr
      %7066 = arith.constant 2 : i64
      %7067 = func.call @cc_make_string(%7065, %7066) : (!llvm.ptr, i64) -> i64
      %7068 = llvm.mlir.addressof @str749 : !llvm.ptr
      %7069 = arith.constant 11 : i64
      %7070 = func.call @cc_make_string(%7068, %7069) : (!llvm.ptr, i64) -> i64
      %7071 = func.call @cc_intern(%7067, %7070) : (i64, i64) -> i64
      %7072 = func.call @cc_nil_value() : () -> i64
      %7073 = func.call @cc_cons(%7071, %7072) : (i64, i64) -> i64
      %7074 = func.call @cc_values_pack(%7073) : (i64) -> i64
      func.call @stack_push_pointer(%7071) : (i64) -> ()
      %7075 = llvm.mlir.addressof @str750 : !llvm.ptr
      %7076 = arith.constant 18 : i64
      %7077 = func.call @cc_make_string(%7075, %7076) : (!llvm.ptr, i64) -> i64
      %7078 = llvm.mlir.addressof @str751 : !llvm.ptr
      %7079 = arith.constant 11 : i64
      %7080 = func.call @cc_make_string(%7078, %7079) : (!llvm.ptr, i64) -> i64
      %7081 = func.call @cc_intern(%7077, %7080) : (i64, i64) -> i64
      %7082 = func.call @cc_nil_value() : () -> i64
      %7083 = func.call @cc_cons(%7081, %7082) : (i64, i64) -> i64
      %7084 = func.call @cc_values_pack(%7083) : (i64) -> i64
      func.call @stack_push_pointer(%7081) : (i64) -> ()
      %7085 = llvm.mlir.addressof @str752 : !llvm.ptr
      %7086 = arith.constant 13 : i64
      %7087 = func.call @cc_make_string(%7085, %7086) : (!llvm.ptr, i64) -> i64
      %7088 = llvm.mlir.addressof @str753 : !llvm.ptr
      %7089 = arith.constant 11 : i64
      %7090 = func.call @cc_make_string(%7088, %7089) : (!llvm.ptr, i64) -> i64
      %7091 = func.call @cc_intern(%7087, %7090) : (i64, i64) -> i64
      %7092 = func.call @cc_nil_value() : () -> i64
      %7093 = func.call @cc_cons(%7091, %7092) : (i64, i64) -> i64
      %7094 = func.call @cc_values_pack(%7093) : (i64) -> i64
      func.call @stack_push_pointer(%7091) : (i64) -> ()
      %7095 = llvm.mlir.addressof @str754 : !llvm.ptr
      %7096 = arith.constant 12 : i64
      %7097 = func.call @cc_make_string(%7095, %7096) : (!llvm.ptr, i64) -> i64
      %7098 = llvm.mlir.addressof @str755 : !llvm.ptr
      %7099 = arith.constant 11 : i64
      %7100 = func.call @cc_make_string(%7098, %7099) : (!llvm.ptr, i64) -> i64
      %7101 = func.call @cc_intern(%7097, %7100) : (i64, i64) -> i64
      %7102 = func.call @cc_nil_value() : () -> i64
      %7103 = func.call @cc_cons(%7101, %7102) : (i64, i64) -> i64
      %7104 = func.call @cc_values_pack(%7103) : (i64) -> i64
      func.call @stack_push_pointer(%7101) : (i64) -> ()
      %7105 = llvm.mlir.addressof @str756 : !llvm.ptr
      %7106 = arith.constant 5 : i64
      %7107 = func.call @cc_make_string(%7105, %7106) : (!llvm.ptr, i64) -> i64
      %7108 = llvm.mlir.addressof @str757 : !llvm.ptr
      %7109 = arith.constant 11 : i64
      %7110 = func.call @cc_make_string(%7108, %7109) : (!llvm.ptr, i64) -> i64
      %7111 = func.call @cc_intern(%7107, %7110) : (i64, i64) -> i64
      %7112 = func.call @cc_nil_value() : () -> i64
      %7113 = func.call @cc_cons(%7111, %7112) : (i64, i64) -> i64
      %7114 = func.call @cc_values_pack(%7113) : (i64) -> i64
      func.call @stack_push_pointer(%7111) : (i64) -> ()
      %7115 = llvm.mlir.addressof @str758 : !llvm.ptr
      %7116 = arith.constant 12 : i64
      %7117 = func.call @cc_make_string(%7115, %7116) : (!llvm.ptr, i64) -> i64
      %7118 = llvm.mlir.addressof @str759 : !llvm.ptr
      %7119 = arith.constant 11 : i64
      %7120 = func.call @cc_make_string(%7118, %7119) : (!llvm.ptr, i64) -> i64
      %7121 = func.call @cc_intern(%7117, %7120) : (i64, i64) -> i64
      %7122 = func.call @cc_nil_value() : () -> i64
      %7123 = func.call @cc_cons(%7121, %7122) : (i64, i64) -> i64
      %7124 = func.call @cc_values_pack(%7123) : (i64) -> i64
      func.call @stack_push_pointer(%7121) : (i64) -> ()
      %7125 = llvm.mlir.addressof @str760 : !llvm.ptr
      %7126 = arith.constant 9 : i64
      %7127 = func.call @cc_make_string(%7125, %7126) : (!llvm.ptr, i64) -> i64
      %7128 = llvm.mlir.addressof @str761 : !llvm.ptr
      %7129 = arith.constant 11 : i64
      %7130 = func.call @cc_make_string(%7128, %7129) : (!llvm.ptr, i64) -> i64
      %7131 = func.call @cc_intern(%7127, %7130) : (i64, i64) -> i64
      %7132 = func.call @cc_nil_value() : () -> i64
      %7133 = func.call @cc_cons(%7131, %7132) : (i64, i64) -> i64
      %7134 = func.call @cc_values_pack(%7133) : (i64) -> i64
      func.call @stack_push_pointer(%7131) : (i64) -> ()
      %7135 = llvm.mlir.addressof @str762 : !llvm.ptr
      %7136 = arith.constant 4 : i64
      %7137 = func.call @cc_make_string(%7135, %7136) : (!llvm.ptr, i64) -> i64
      %7138 = llvm.mlir.addressof @str763 : !llvm.ptr
      %7139 = arith.constant 11 : i64
      %7140 = func.call @cc_make_string(%7138, %7139) : (!llvm.ptr, i64) -> i64
      %7141 = func.call @cc_intern(%7137, %7140) : (i64, i64) -> i64
      %7142 = func.call @cc_nil_value() : () -> i64
      %7143 = func.call @cc_cons(%7141, %7142) : (i64, i64) -> i64
      %7144 = func.call @cc_values_pack(%7143) : (i64) -> i64
      func.call @stack_push_pointer(%7141) : (i64) -> ()
      %7145 = llvm.mlir.addressof @str764 : !llvm.ptr
      %7146 = arith.constant 7 : i64
      %7147 = func.call @cc_make_string(%7145, %7146) : (!llvm.ptr, i64) -> i64
      %7148 = llvm.mlir.addressof @str765 : !llvm.ptr
      %7149 = arith.constant 11 : i64
      %7150 = func.call @cc_make_string(%7148, %7149) : (!llvm.ptr, i64) -> i64
      %7151 = func.call @cc_intern(%7147, %7150) : (i64, i64) -> i64
      %7152 = func.call @cc_nil_value() : () -> i64
      %7153 = func.call @cc_cons(%7151, %7152) : (i64, i64) -> i64
      %7154 = func.call @cc_values_pack(%7153) : (i64) -> i64
      func.call @stack_push_pointer(%7151) : (i64) -> ()
      %7155 = llvm.mlir.addressof @str766 : !llvm.ptr
      %7156 = arith.constant 6 : i64
      %7157 = func.call @cc_make_string(%7155, %7156) : (!llvm.ptr, i64) -> i64
      %7158 = llvm.mlir.addressof @str767 : !llvm.ptr
      %7159 = arith.constant 11 : i64
      %7160 = func.call @cc_make_string(%7158, %7159) : (!llvm.ptr, i64) -> i64
      %7161 = func.call @cc_intern(%7157, %7160) : (i64, i64) -> i64
      %7162 = func.call @cc_nil_value() : () -> i64
      %7163 = func.call @cc_cons(%7161, %7162) : (i64, i64) -> i64
      %7164 = func.call @cc_values_pack(%7163) : (i64) -> i64
      func.call @stack_push_pointer(%7161) : (i64) -> ()
      %7165 = llvm.mlir.addressof @str768 : !llvm.ptr
      %7166 = arith.constant 9 : i64
      %7167 = func.call @cc_make_string(%7165, %7166) : (!llvm.ptr, i64) -> i64
      %7168 = llvm.mlir.addressof @str769 : !llvm.ptr
      %7169 = arith.constant 11 : i64
      %7170 = func.call @cc_make_string(%7168, %7169) : (!llvm.ptr, i64) -> i64
      %7171 = func.call @cc_intern(%7167, %7170) : (i64, i64) -> i64
      %7172 = func.call @cc_nil_value() : () -> i64
      %7173 = func.call @cc_cons(%7171, %7172) : (i64, i64) -> i64
      %7174 = func.call @cc_values_pack(%7173) : (i64) -> i64
      func.call @stack_push_pointer(%7171) : (i64) -> ()
      %7175 = llvm.mlir.addressof @str770 : !llvm.ptr
      %7176 = arith.constant 8 : i64
      %7177 = func.call @cc_make_string(%7175, %7176) : (!llvm.ptr, i64) -> i64
      %7178 = llvm.mlir.addressof @str771 : !llvm.ptr
      %7179 = arith.constant 11 : i64
      %7180 = func.call @cc_make_string(%7178, %7179) : (!llvm.ptr, i64) -> i64
      %7181 = func.call @cc_intern(%7177, %7180) : (i64, i64) -> i64
      %7182 = func.call @cc_nil_value() : () -> i64
      %7183 = func.call @cc_cons(%7181, %7182) : (i64, i64) -> i64
      %7184 = func.call @cc_values_pack(%7183) : (i64) -> i64
      func.call @stack_push_pointer(%7181) : (i64) -> ()
      %7185 = llvm.mlir.addressof @str772 : !llvm.ptr
      %7186 = arith.constant 17 : i64
      %7187 = func.call @cc_make_string(%7185, %7186) : (!llvm.ptr, i64) -> i64
      %7188 = llvm.mlir.addressof @str773 : !llvm.ptr
      %7189 = arith.constant 11 : i64
      %7190 = func.call @cc_make_string(%7188, %7189) : (!llvm.ptr, i64) -> i64
      %7191 = func.call @cc_intern(%7187, %7190) : (i64, i64) -> i64
      %7192 = func.call @cc_nil_value() : () -> i64
      %7193 = func.call @cc_cons(%7191, %7192) : (i64, i64) -> i64
      %7194 = func.call @cc_values_pack(%7193) : (i64) -> i64
      func.call @stack_push_pointer(%7191) : (i64) -> ()
      %7195 = llvm.mlir.addressof @str774 : !llvm.ptr
      %7196 = arith.constant 11 : i64
      %7197 = func.call @cc_make_string(%7195, %7196) : (!llvm.ptr, i64) -> i64
      %7198 = llvm.mlir.addressof @str775 : !llvm.ptr
      %7199 = arith.constant 11 : i64
      %7200 = func.call @cc_make_string(%7198, %7199) : (!llvm.ptr, i64) -> i64
      %7201 = func.call @cc_intern(%7197, %7200) : (i64, i64) -> i64
      %7202 = func.call @cc_nil_value() : () -> i64
      %7203 = func.call @cc_cons(%7201, %7202) : (i64, i64) -> i64
      %7204 = func.call @cc_values_pack(%7203) : (i64) -> i64
      func.call @stack_push_pointer(%7201) : (i64) -> ()
      %7205 = llvm.mlir.addressof @str776 : !llvm.ptr
      %7206 = arith.constant 19 : i64
      %7207 = func.call @cc_make_string(%7205, %7206) : (!llvm.ptr, i64) -> i64
      %7208 = llvm.mlir.addressof @str777 : !llvm.ptr
      %7209 = arith.constant 11 : i64
      %7210 = func.call @cc_make_string(%7208, %7209) : (!llvm.ptr, i64) -> i64
      %7211 = func.call @cc_intern(%7207, %7210) : (i64, i64) -> i64
      %7212 = func.call @cc_nil_value() : () -> i64
      %7213 = func.call @cc_cons(%7211, %7212) : (i64, i64) -> i64
      %7214 = func.call @cc_values_pack(%7213) : (i64) -> i64
      func.call @stack_push_pointer(%7211) : (i64) -> ()
      %7215 = llvm.mlir.addressof @str778 : !llvm.ptr
      %7216 = arith.constant 28 : i64
      %7217 = func.call @cc_make_string(%7215, %7216) : (!llvm.ptr, i64) -> i64
      %7218 = llvm.mlir.addressof @str779 : !llvm.ptr
      %7219 = arith.constant 11 : i64
      %7220 = func.call @cc_make_string(%7218, %7219) : (!llvm.ptr, i64) -> i64
      %7221 = func.call @cc_intern(%7217, %7220) : (i64, i64) -> i64
      %7222 = func.call @cc_nil_value() : () -> i64
      %7223 = func.call @cc_cons(%7221, %7222) : (i64, i64) -> i64
      %7224 = func.call @cc_values_pack(%7223) : (i64) -> i64
      func.call @stack_push_pointer(%7221) : (i64) -> ()
      %7225 = llvm.mlir.addressof @str780 : !llvm.ptr
      %7226 = arith.constant 11 : i64
      %7227 = func.call @cc_make_string(%7225, %7226) : (!llvm.ptr, i64) -> i64
      %7228 = llvm.mlir.addressof @str781 : !llvm.ptr
      %7229 = arith.constant 11 : i64
      %7230 = func.call @cc_make_string(%7228, %7229) : (!llvm.ptr, i64) -> i64
      %7231 = func.call @cc_intern(%7227, %7230) : (i64, i64) -> i64
      %7232 = func.call @cc_nil_value() : () -> i64
      %7233 = func.call @cc_cons(%7231, %7232) : (i64, i64) -> i64
      %7234 = func.call @cc_values_pack(%7233) : (i64) -> i64
      func.call @stack_push_pointer(%7231) : (i64) -> ()
      %7235 = llvm.mlir.addressof @str782 : !llvm.ptr
      %7236 = arith.constant 12 : i64
      %7237 = func.call @cc_make_string(%7235, %7236) : (!llvm.ptr, i64) -> i64
      %7238 = llvm.mlir.addressof @str783 : !llvm.ptr
      %7239 = arith.constant 11 : i64
      %7240 = func.call @cc_make_string(%7238, %7239) : (!llvm.ptr, i64) -> i64
      %7241 = func.call @cc_intern(%7237, %7240) : (i64, i64) -> i64
      %7242 = func.call @cc_nil_value() : () -> i64
      %7243 = func.call @cc_cons(%7241, %7242) : (i64, i64) -> i64
      %7244 = func.call @cc_values_pack(%7243) : (i64) -> i64
      func.call @stack_push_pointer(%7241) : (i64) -> ()
      %7245 = llvm.mlir.addressof @str784 : !llvm.ptr
      %7246 = arith.constant 18 : i64
      %7247 = func.call @cc_make_string(%7245, %7246) : (!llvm.ptr, i64) -> i64
      %7248 = llvm.mlir.addressof @str785 : !llvm.ptr
      %7249 = arith.constant 11 : i64
      %7250 = func.call @cc_make_string(%7248, %7249) : (!llvm.ptr, i64) -> i64
      %7251 = func.call @cc_intern(%7247, %7250) : (i64, i64) -> i64
      %7252 = func.call @cc_nil_value() : () -> i64
      %7253 = func.call @cc_cons(%7251, %7252) : (i64, i64) -> i64
      %7254 = func.call @cc_values_pack(%7253) : (i64) -> i64
      func.call @stack_push_pointer(%7251) : (i64) -> ()
      %7255 = llvm.mlir.addressof @str786 : !llvm.ptr
      %7256 = arith.constant 17 : i64
      %7257 = func.call @cc_make_string(%7255, %7256) : (!llvm.ptr, i64) -> i64
      %7258 = llvm.mlir.addressof @str787 : !llvm.ptr
      %7259 = arith.constant 11 : i64
      %7260 = func.call @cc_make_string(%7258, %7259) : (!llvm.ptr, i64) -> i64
      %7261 = func.call @cc_intern(%7257, %7260) : (i64, i64) -> i64
      %7262 = func.call @cc_nil_value() : () -> i64
      %7263 = func.call @cc_cons(%7261, %7262) : (i64, i64) -> i64
      %7264 = func.call @cc_values_pack(%7263) : (i64) -> i64
      func.call @stack_push_pointer(%7261) : (i64) -> ()
      %7265 = llvm.mlir.addressof @str788 : !llvm.ptr
      %7266 = arith.constant 16 : i64
      %7267 = func.call @cc_make_string(%7265, %7266) : (!llvm.ptr, i64) -> i64
      %7268 = llvm.mlir.addressof @str789 : !llvm.ptr
      %7269 = arith.constant 11 : i64
      %7270 = func.call @cc_make_string(%7268, %7269) : (!llvm.ptr, i64) -> i64
      %7271 = func.call @cc_intern(%7267, %7270) : (i64, i64) -> i64
      %7272 = func.call @cc_nil_value() : () -> i64
      %7273 = func.call @cc_cons(%7271, %7272) : (i64, i64) -> i64
      %7274 = func.call @cc_values_pack(%7273) : (i64) -> i64
      func.call @stack_push_pointer(%7271) : (i64) -> ()
      %7275 = llvm.mlir.addressof @str790 : !llvm.ptr
      %7276 = arith.constant 12 : i64
      %7277 = func.call @cc_make_string(%7275, %7276) : (!llvm.ptr, i64) -> i64
      %7278 = llvm.mlir.addressof @str791 : !llvm.ptr
      %7279 = arith.constant 11 : i64
      %7280 = func.call @cc_make_string(%7278, %7279) : (!llvm.ptr, i64) -> i64
      %7281 = func.call @cc_intern(%7277, %7280) : (i64, i64) -> i64
      %7282 = func.call @cc_nil_value() : () -> i64
      %7283 = func.call @cc_cons(%7281, %7282) : (i64, i64) -> i64
      %7284 = func.call @cc_values_pack(%7283) : (i64) -> i64
      func.call @stack_push_pointer(%7281) : (i64) -> ()
      %7285 = llvm.mlir.addressof @str792 : !llvm.ptr
      %7286 = arith.constant 13 : i64
      %7287 = func.call @cc_make_string(%7285, %7286) : (!llvm.ptr, i64) -> i64
      %7288 = llvm.mlir.addressof @str793 : !llvm.ptr
      %7289 = arith.constant 11 : i64
      %7290 = func.call @cc_make_string(%7288, %7289) : (!llvm.ptr, i64) -> i64
      %7291 = func.call @cc_intern(%7287, %7290) : (i64, i64) -> i64
      %7292 = func.call @cc_nil_value() : () -> i64
      %7293 = func.call @cc_cons(%7291, %7292) : (i64, i64) -> i64
      %7294 = func.call @cc_values_pack(%7293) : (i64) -> i64
      func.call @stack_push_pointer(%7291) : (i64) -> ()
      %7295 = llvm.mlir.addressof @str794 : !llvm.ptr
      %7296 = arith.constant 17 : i64
      %7297 = func.call @cc_make_string(%7295, %7296) : (!llvm.ptr, i64) -> i64
      %7298 = llvm.mlir.addressof @str795 : !llvm.ptr
      %7299 = arith.constant 11 : i64
      %7300 = func.call @cc_make_string(%7298, %7299) : (!llvm.ptr, i64) -> i64
      %7301 = func.call @cc_intern(%7297, %7300) : (i64, i64) -> i64
      %7302 = func.call @cc_nil_value() : () -> i64
      %7303 = func.call @cc_cons(%7301, %7302) : (i64, i64) -> i64
      %7304 = func.call @cc_values_pack(%7303) : (i64) -> i64
      func.call @stack_push_pointer(%7301) : (i64) -> ()
      %7305 = llvm.mlir.addressof @str796 : !llvm.ptr
      %7306 = arith.constant 13 : i64
      %7307 = func.call @cc_make_string(%7305, %7306) : (!llvm.ptr, i64) -> i64
      %7308 = llvm.mlir.addressof @str797 : !llvm.ptr
      %7309 = arith.constant 11 : i64
      %7310 = func.call @cc_make_string(%7308, %7309) : (!llvm.ptr, i64) -> i64
      %7311 = func.call @cc_intern(%7307, %7310) : (i64, i64) -> i64
      %7312 = func.call @cc_nil_value() : () -> i64
      %7313 = func.call @cc_cons(%7311, %7312) : (i64, i64) -> i64
      %7314 = func.call @cc_values_pack(%7313) : (i64) -> i64
      func.call @stack_push_pointer(%7311) : (i64) -> ()
      %7315 = llvm.mlir.addressof @str798 : !llvm.ptr
      %7316 = arith.constant 14 : i64
      %7317 = func.call @cc_make_string(%7315, %7316) : (!llvm.ptr, i64) -> i64
      %7318 = llvm.mlir.addressof @str799 : !llvm.ptr
      %7319 = arith.constant 11 : i64
      %7320 = func.call @cc_make_string(%7318, %7319) : (!llvm.ptr, i64) -> i64
      %7321 = func.call @cc_intern(%7317, %7320) : (i64, i64) -> i64
      %7322 = func.call @cc_nil_value() : () -> i64
      %7323 = func.call @cc_cons(%7321, %7322) : (i64, i64) -> i64
      %7324 = func.call @cc_values_pack(%7323) : (i64) -> i64
      func.call @stack_push_pointer(%7321) : (i64) -> ()
      %7325 = llvm.mlir.addressof @str800 : !llvm.ptr
      %7326 = arith.constant 12 : i64
      %7327 = func.call @cc_make_string(%7325, %7326) : (!llvm.ptr, i64) -> i64
      %7328 = llvm.mlir.addressof @str801 : !llvm.ptr
      %7329 = arith.constant 11 : i64
      %7330 = func.call @cc_make_string(%7328, %7329) : (!llvm.ptr, i64) -> i64
      %7331 = func.call @cc_intern(%7327, %7330) : (i64, i64) -> i64
      %7332 = func.call @cc_nil_value() : () -> i64
      %7333 = func.call @cc_cons(%7331, %7332) : (i64, i64) -> i64
      %7334 = func.call @cc_values_pack(%7333) : (i64) -> i64
      func.call @stack_push_pointer(%7331) : (i64) -> ()
      %7335 = llvm.mlir.addressof @str802 : !llvm.ptr
      %7336 = arith.constant 20 : i64
      %7337 = func.call @cc_make_string(%7335, %7336) : (!llvm.ptr, i64) -> i64
      %7338 = llvm.mlir.addressof @str803 : !llvm.ptr
      %7339 = arith.constant 11 : i64
      %7340 = func.call @cc_make_string(%7338, %7339) : (!llvm.ptr, i64) -> i64
      %7341 = func.call @cc_intern(%7337, %7340) : (i64, i64) -> i64
      %7342 = func.call @cc_nil_value() : () -> i64
      %7343 = func.call @cc_cons(%7341, %7342) : (i64, i64) -> i64
      %7344 = func.call @cc_values_pack(%7343) : (i64) -> i64
      func.call @stack_push_pointer(%7341) : (i64) -> ()
      %7345 = llvm.mlir.addressof @str804 : !llvm.ptr
      %7346 = arith.constant 29 : i64
      %7347 = func.call @cc_make_string(%7345, %7346) : (!llvm.ptr, i64) -> i64
      %7348 = llvm.mlir.addressof @str805 : !llvm.ptr
      %7349 = arith.constant 11 : i64
      %7350 = func.call @cc_make_string(%7348, %7349) : (!llvm.ptr, i64) -> i64
      %7351 = func.call @cc_intern(%7347, %7350) : (i64, i64) -> i64
      %7352 = func.call @cc_nil_value() : () -> i64
      %7353 = func.call @cc_cons(%7351, %7352) : (i64, i64) -> i64
      %7354 = func.call @cc_values_pack(%7353) : (i64) -> i64
      func.call @stack_push_pointer(%7351) : (i64) -> ()
      %7355 = llvm.mlir.addressof @str806 : !llvm.ptr
      %7356 = arith.constant 5 : i64
      %7357 = func.call @cc_make_string(%7355, %7356) : (!llvm.ptr, i64) -> i64
      %7358 = llvm.mlir.addressof @str807 : !llvm.ptr
      %7359 = arith.constant 11 : i64
      %7360 = func.call @cc_make_string(%7358, %7359) : (!llvm.ptr, i64) -> i64
      %7361 = func.call @cc_intern(%7357, %7360) : (i64, i64) -> i64
      %7362 = func.call @cc_nil_value() : () -> i64
      %7363 = func.call @cc_cons(%7361, %7362) : (i64, i64) -> i64
      %7364 = func.call @cc_values_pack(%7363) : (i64) -> i64
      func.call @stack_push_pointer(%7361) : (i64) -> ()
      %7365 = llvm.mlir.addressof @str808 : !llvm.ptr
      %7366 = arith.constant 7 : i64
      %7367 = func.call @cc_make_string(%7365, %7366) : (!llvm.ptr, i64) -> i64
      %7368 = llvm.mlir.addressof @str809 : !llvm.ptr
      %7369 = arith.constant 11 : i64
      %7370 = func.call @cc_make_string(%7368, %7369) : (!llvm.ptr, i64) -> i64
      %7371 = func.call @cc_intern(%7367, %7370) : (i64, i64) -> i64
      %7372 = func.call @cc_nil_value() : () -> i64
      %7373 = func.call @cc_cons(%7371, %7372) : (i64, i64) -> i64
      %7374 = func.call @cc_values_pack(%7373) : (i64) -> i64
      func.call @stack_push_pointer(%7371) : (i64) -> ()
      %7375 = llvm.mlir.addressof @str810 : !llvm.ptr
      %7376 = arith.constant 5 : i64
      %7377 = func.call @cc_make_string(%7375, %7376) : (!llvm.ptr, i64) -> i64
      %7378 = llvm.mlir.addressof @str811 : !llvm.ptr
      %7379 = arith.constant 11 : i64
      %7380 = func.call @cc_make_string(%7378, %7379) : (!llvm.ptr, i64) -> i64
      %7381 = func.call @cc_intern(%7377, %7380) : (i64, i64) -> i64
      %7382 = func.call @cc_nil_value() : () -> i64
      %7383 = func.call @cc_cons(%7381, %7382) : (i64, i64) -> i64
      %7384 = func.call @cc_values_pack(%7383) : (i64) -> i64
      func.call @stack_push_pointer(%7381) : (i64) -> ()
      %7385 = llvm.mlir.addressof @str812 : !llvm.ptr
      %7386 = arith.constant 8 : i64
      %7387 = func.call @cc_make_string(%7385, %7386) : (!llvm.ptr, i64) -> i64
      %7388 = llvm.mlir.addressof @str813 : !llvm.ptr
      %7389 = arith.constant 11 : i64
      %7390 = func.call @cc_make_string(%7388, %7389) : (!llvm.ptr, i64) -> i64
      %7391 = func.call @cc_intern(%7387, %7390) : (i64, i64) -> i64
      %7392 = func.call @cc_nil_value() : () -> i64
      %7393 = func.call @cc_cons(%7391, %7392) : (i64, i64) -> i64
      %7394 = func.call @cc_values_pack(%7393) : (i64) -> i64
      func.call @stack_push_pointer(%7391) : (i64) -> ()
      %7395 = llvm.mlir.addressof @str814 : !llvm.ptr
      %7396 = arith.constant 13 : i64
      %7397 = func.call @cc_make_string(%7395, %7396) : (!llvm.ptr, i64) -> i64
      %7398 = llvm.mlir.addressof @str815 : !llvm.ptr
      %7399 = arith.constant 11 : i64
      %7400 = func.call @cc_make_string(%7398, %7399) : (!llvm.ptr, i64) -> i64
      %7401 = func.call @cc_intern(%7397, %7400) : (i64, i64) -> i64
      %7402 = func.call @cc_nil_value() : () -> i64
      %7403 = func.call @cc_cons(%7401, %7402) : (i64, i64) -> i64
      %7404 = func.call @cc_values_pack(%7403) : (i64) -> i64
      func.call @stack_push_pointer(%7401) : (i64) -> ()
      %7405 = llvm.mlir.addressof @str816 : !llvm.ptr
      %7406 = arith.constant 14 : i64
      %7407 = func.call @cc_make_string(%7405, %7406) : (!llvm.ptr, i64) -> i64
      %7408 = llvm.mlir.addressof @str817 : !llvm.ptr
      %7409 = arith.constant 11 : i64
      %7410 = func.call @cc_make_string(%7408, %7409) : (!llvm.ptr, i64) -> i64
      %7411 = func.call @cc_intern(%7407, %7410) : (i64, i64) -> i64
      %7412 = func.call @cc_nil_value() : () -> i64
      %7413 = func.call @cc_cons(%7411, %7412) : (i64, i64) -> i64
      %7414 = func.call @cc_values_pack(%7413) : (i64) -> i64
      func.call @stack_push_pointer(%7411) : (i64) -> ()
      %7415 = llvm.mlir.addressof @str818 : !llvm.ptr
      %7416 = arith.constant 25 : i64
      %7417 = func.call @cc_make_string(%7415, %7416) : (!llvm.ptr, i64) -> i64
      %7418 = llvm.mlir.addressof @str819 : !llvm.ptr
      %7419 = arith.constant 11 : i64
      %7420 = func.call @cc_make_string(%7418, %7419) : (!llvm.ptr, i64) -> i64
      %7421 = func.call @cc_intern(%7417, %7420) : (i64, i64) -> i64
      %7422 = func.call @cc_nil_value() : () -> i64
      %7423 = func.call @cc_cons(%7421, %7422) : (i64, i64) -> i64
      %7424 = func.call @cc_values_pack(%7423) : (i64) -> i64
      func.call @stack_push_pointer(%7421) : (i64) -> ()
      %7425 = llvm.mlir.addressof @str820 : !llvm.ptr
      %7426 = arith.constant 15 : i64
      %7427 = func.call @cc_make_string(%7425, %7426) : (!llvm.ptr, i64) -> i64
      %7428 = llvm.mlir.addressof @str821 : !llvm.ptr
      %7429 = arith.constant 11 : i64
      %7430 = func.call @cc_make_string(%7428, %7429) : (!llvm.ptr, i64) -> i64
      %7431 = func.call @cc_intern(%7427, %7430) : (i64, i64) -> i64
      %7432 = func.call @cc_nil_value() : () -> i64
      %7433 = func.call @cc_cons(%7431, %7432) : (i64, i64) -> i64
      %7434 = func.call @cc_values_pack(%7433) : (i64) -> i64
      func.call @stack_push_pointer(%7431) : (i64) -> ()
      %7435 = llvm.mlir.addressof @str822 : !llvm.ptr
      %7436 = arith.constant 15 : i64
      %7437 = func.call @cc_make_string(%7435, %7436) : (!llvm.ptr, i64) -> i64
      %7438 = llvm.mlir.addressof @str823 : !llvm.ptr
      %7439 = arith.constant 11 : i64
      %7440 = func.call @cc_make_string(%7438, %7439) : (!llvm.ptr, i64) -> i64
      %7441 = func.call @cc_intern(%7437, %7440) : (i64, i64) -> i64
      %7442 = func.call @cc_nil_value() : () -> i64
      %7443 = func.call @cc_cons(%7441, %7442) : (i64, i64) -> i64
      %7444 = func.call @cc_values_pack(%7443) : (i64) -> i64
      func.call @stack_push_pointer(%7441) : (i64) -> ()
      %7445 = llvm.mlir.addressof @str824 : !llvm.ptr
      %7446 = arith.constant 17 : i64
      %7447 = func.call @cc_make_string(%7445, %7446) : (!llvm.ptr, i64) -> i64
      %7448 = llvm.mlir.addressof @str825 : !llvm.ptr
      %7449 = arith.constant 11 : i64
      %7450 = func.call @cc_make_string(%7448, %7449) : (!llvm.ptr, i64) -> i64
      %7451 = func.call @cc_intern(%7447, %7450) : (i64, i64) -> i64
      %7452 = func.call @cc_nil_value() : () -> i64
      %7453 = func.call @cc_cons(%7451, %7452) : (i64, i64) -> i64
      %7454 = func.call @cc_values_pack(%7453) : (i64) -> i64
      func.call @stack_push_pointer(%7451) : (i64) -> ()
      %7455 = llvm.mlir.addressof @str826 : !llvm.ptr
      %7456 = arith.constant 6 : i64
      %7457 = func.call @cc_make_string(%7455, %7456) : (!llvm.ptr, i64) -> i64
      %7458 = llvm.mlir.addressof @str827 : !llvm.ptr
      %7459 = arith.constant 11 : i64
      %7460 = func.call @cc_make_string(%7458, %7459) : (!llvm.ptr, i64) -> i64
      %7461 = func.call @cc_intern(%7457, %7460) : (i64, i64) -> i64
      %7462 = func.call @cc_nil_value() : () -> i64
      %7463 = func.call @cc_cons(%7461, %7462) : (i64, i64) -> i64
      %7464 = func.call @cc_values_pack(%7463) : (i64) -> i64
      func.call @stack_push_pointer(%7461) : (i64) -> ()
      %7465 = llvm.mlir.addressof @str828 : !llvm.ptr
      %7466 = arith.constant 12 : i64
      %7467 = func.call @cc_make_string(%7465, %7466) : (!llvm.ptr, i64) -> i64
      %7468 = llvm.mlir.addressof @str829 : !llvm.ptr
      %7469 = arith.constant 11 : i64
      %7470 = func.call @cc_make_string(%7468, %7469) : (!llvm.ptr, i64) -> i64
      %7471 = func.call @cc_intern(%7467, %7470) : (i64, i64) -> i64
      %7472 = func.call @cc_nil_value() : () -> i64
      %7473 = func.call @cc_cons(%7471, %7472) : (i64, i64) -> i64
      %7474 = func.call @cc_values_pack(%7473) : (i64) -> i64
      func.call @stack_push_pointer(%7471) : (i64) -> ()
      %7475 = llvm.mlir.addressof @str830 : !llvm.ptr
      %7476 = arith.constant 13 : i64
      %7477 = func.call @cc_make_string(%7475, %7476) : (!llvm.ptr, i64) -> i64
      %7478 = llvm.mlir.addressof @str831 : !llvm.ptr
      %7479 = arith.constant 11 : i64
      %7480 = func.call @cc_make_string(%7478, %7479) : (!llvm.ptr, i64) -> i64
      %7481 = func.call @cc_intern(%7477, %7480) : (i64, i64) -> i64
      %7482 = func.call @cc_nil_value() : () -> i64
      %7483 = func.call @cc_cons(%7481, %7482) : (i64, i64) -> i64
      %7484 = func.call @cc_values_pack(%7483) : (i64) -> i64
      func.call @stack_push_pointer(%7481) : (i64) -> ()
      %7485 = llvm.mlir.addressof @str832 : !llvm.ptr
      %7486 = arith.constant 9 : i64
      %7487 = func.call @cc_make_string(%7485, %7486) : (!llvm.ptr, i64) -> i64
      %7488 = llvm.mlir.addressof @str833 : !llvm.ptr
      %7489 = arith.constant 11 : i64
      %7490 = func.call @cc_make_string(%7488, %7489) : (!llvm.ptr, i64) -> i64
      %7491 = func.call @cc_intern(%7487, %7490) : (i64, i64) -> i64
      %7492 = func.call @cc_nil_value() : () -> i64
      %7493 = func.call @cc_cons(%7491, %7492) : (i64, i64) -> i64
      %7494 = func.call @cc_values_pack(%7493) : (i64) -> i64
      func.call @stack_push_pointer(%7491) : (i64) -> ()
      %7495 = llvm.mlir.addressof @str834 : !llvm.ptr
      %7496 = arith.constant 15 : i64
      %7497 = func.call @cc_make_string(%7495, %7496) : (!llvm.ptr, i64) -> i64
      %7498 = llvm.mlir.addressof @str835 : !llvm.ptr
      %7499 = arith.constant 11 : i64
      %7500 = func.call @cc_make_string(%7498, %7499) : (!llvm.ptr, i64) -> i64
      %7501 = func.call @cc_intern(%7497, %7500) : (i64, i64) -> i64
      %7502 = func.call @cc_nil_value() : () -> i64
      %7503 = func.call @cc_cons(%7501, %7502) : (i64, i64) -> i64
      %7504 = func.call @cc_values_pack(%7503) : (i64) -> i64
      func.call @stack_push_pointer(%7501) : (i64) -> ()
      %7505 = llvm.mlir.addressof @str836 : !llvm.ptr
      %7506 = arith.constant 16 : i64
      %7507 = func.call @cc_make_string(%7505, %7506) : (!llvm.ptr, i64) -> i64
      %7508 = llvm.mlir.addressof @str837 : !llvm.ptr
      %7509 = arith.constant 11 : i64
      %7510 = func.call @cc_make_string(%7508, %7509) : (!llvm.ptr, i64) -> i64
      %7511 = func.call @cc_intern(%7507, %7510) : (i64, i64) -> i64
      %7512 = func.call @cc_nil_value() : () -> i64
      %7513 = func.call @cc_cons(%7511, %7512) : (i64, i64) -> i64
      %7514 = func.call @cc_values_pack(%7513) : (i64) -> i64
      func.call @stack_push_pointer(%7511) : (i64) -> ()
      %7515 = llvm.mlir.addressof @str838 : !llvm.ptr
      %7516 = arith.constant 13 : i64
      %7517 = func.call @cc_make_string(%7515, %7516) : (!llvm.ptr, i64) -> i64
      %7518 = llvm.mlir.addressof @str839 : !llvm.ptr
      %7519 = arith.constant 11 : i64
      %7520 = func.call @cc_make_string(%7518, %7519) : (!llvm.ptr, i64) -> i64
      %7521 = func.call @cc_intern(%7517, %7520) : (i64, i64) -> i64
      %7522 = func.call @cc_nil_value() : () -> i64
      %7523 = func.call @cc_cons(%7521, %7522) : (i64, i64) -> i64
      %7524 = func.call @cc_values_pack(%7523) : (i64) -> i64
      func.call @stack_push_pointer(%7521) : (i64) -> ()
      %7525 = llvm.mlir.addressof @str840 : !llvm.ptr
      %7526 = arith.constant 6 : i64
      %7527 = func.call @cc_make_string(%7525, %7526) : (!llvm.ptr, i64) -> i64
      %7528 = llvm.mlir.addressof @str841 : !llvm.ptr
      %7529 = arith.constant 11 : i64
      %7530 = func.call @cc_make_string(%7528, %7529) : (!llvm.ptr, i64) -> i64
      %7531 = func.call @cc_intern(%7527, %7530) : (i64, i64) -> i64
      %7532 = func.call @cc_nil_value() : () -> i64
      %7533 = func.call @cc_cons(%7531, %7532) : (i64, i64) -> i64
      %7534 = func.call @cc_values_pack(%7533) : (i64) -> i64
      func.call @stack_push_pointer(%7531) : (i64) -> ()
      %7535 = llvm.mlir.addressof @str842 : !llvm.ptr
      %7536 = arith.constant 14 : i64
      %7537 = func.call @cc_make_string(%7535, %7536) : (!llvm.ptr, i64) -> i64
      %7538 = llvm.mlir.addressof @str843 : !llvm.ptr
      %7539 = arith.constant 11 : i64
      %7540 = func.call @cc_make_string(%7538, %7539) : (!llvm.ptr, i64) -> i64
      %7541 = func.call @cc_intern(%7537, %7540) : (i64, i64) -> i64
      %7542 = func.call @cc_nil_value() : () -> i64
      %7543 = func.call @cc_cons(%7541, %7542) : (i64, i64) -> i64
      %7544 = func.call @cc_values_pack(%7543) : (i64) -> i64
      func.call @stack_push_pointer(%7541) : (i64) -> ()
      %7545 = llvm.mlir.addressof @str844 : !llvm.ptr
      %7546 = arith.constant 1 : i64
      %7547 = func.call @cc_make_string(%7545, %7546) : (!llvm.ptr, i64) -> i64
      %7548 = func.call @cc_nil_value() : () -> i64
      %7549 = func.call @cc_intern(%7547, %7548) : (i64, i64) -> i64
      %7550 = func.call @cc_nil_value() : () -> i64
      %7551 = func.call @cc_cons(%7549, %7550) : (i64, i64) -> i64
      %7552 = func.call @cc_values_pack(%7551) : (i64) -> i64
      func.call @stack_push_pointer(%7549) : (i64) -> ()
      %7553 = llvm.mlir.addressof @str845 : !llvm.ptr
      %7554 = arith.constant 14 : i64
      %7555 = func.call @cc_make_string(%7553, %7554) : (!llvm.ptr, i64) -> i64
      %7556 = llvm.mlir.addressof @str846 : !llvm.ptr
      %7557 = arith.constant 11 : i64
      %7558 = func.call @cc_make_string(%7556, %7557) : (!llvm.ptr, i64) -> i64
      %7559 = func.call @cc_intern(%7555, %7558) : (i64, i64) -> i64
      %7560 = func.call @cc_nil_value() : () -> i64
      %7561 = func.call @cc_cons(%7559, %7560) : (i64, i64) -> i64
      %7562 = func.call @cc_values_pack(%7561) : (i64) -> i64
      func.call @stack_push_pointer(%7559) : (i64) -> ()
      %7563 = llvm.mlir.addressof @str847 : !llvm.ptr
      %7564 = arith.constant 4 : i64
      %7565 = func.call @cc_make_string(%7563, %7564) : (!llvm.ptr, i64) -> i64
      %7566 = llvm.mlir.addressof @str848 : !llvm.ptr
      %7567 = arith.constant 11 : i64
      %7568 = func.call @cc_make_string(%7566, %7567) : (!llvm.ptr, i64) -> i64
      %7569 = func.call @cc_intern(%7565, %7568) : (i64, i64) -> i64
      %7570 = func.call @cc_nil_value() : () -> i64
      %7571 = func.call @cc_cons(%7569, %7570) : (i64, i64) -> i64
      %7572 = func.call @cc_values_pack(%7571) : (i64) -> i64
      func.call @stack_push_pointer(%7569) : (i64) -> ()
      %7573 = llvm.mlir.addressof @str849 : !llvm.ptr
      %7574 = arith.constant 10 : i64
      %7575 = func.call @cc_make_string(%7573, %7574) : (!llvm.ptr, i64) -> i64
      %7576 = llvm.mlir.addressof @str850 : !llvm.ptr
      %7577 = arith.constant 11 : i64
      %7578 = func.call @cc_make_string(%7576, %7577) : (!llvm.ptr, i64) -> i64
      %7579 = func.call @cc_intern(%7575, %7578) : (i64, i64) -> i64
      %7580 = func.call @cc_nil_value() : () -> i64
      %7581 = func.call @cc_cons(%7579, %7580) : (i64, i64) -> i64
      %7582 = func.call @cc_values_pack(%7581) : (i64) -> i64
      func.call @stack_push_pointer(%7579) : (i64) -> ()
      %7583 = llvm.mlir.addressof @str851 : !llvm.ptr
      %7584 = arith.constant 12 : i64
      %7585 = func.call @cc_make_string(%7583, %7584) : (!llvm.ptr, i64) -> i64
      %7586 = llvm.mlir.addressof @str852 : !llvm.ptr
      %7587 = arith.constant 11 : i64
      %7588 = func.call @cc_make_string(%7586, %7587) : (!llvm.ptr, i64) -> i64
      %7589 = func.call @cc_intern(%7585, %7588) : (i64, i64) -> i64
      %7590 = func.call @cc_nil_value() : () -> i64
      %7591 = func.call @cc_cons(%7589, %7590) : (i64, i64) -> i64
      %7592 = func.call @cc_values_pack(%7591) : (i64) -> i64
      func.call @stack_push_pointer(%7589) : (i64) -> ()
      %7593 = llvm.mlir.addressof @str853 : !llvm.ptr
      %7594 = arith.constant 16 : i64
      %7595 = func.call @cc_make_string(%7593, %7594) : (!llvm.ptr, i64) -> i64
      %7596 = llvm.mlir.addressof @str854 : !llvm.ptr
      %7597 = arith.constant 11 : i64
      %7598 = func.call @cc_make_string(%7596, %7597) : (!llvm.ptr, i64) -> i64
      %7599 = func.call @cc_intern(%7595, %7598) : (i64, i64) -> i64
      %7600 = func.call @cc_nil_value() : () -> i64
      %7601 = func.call @cc_cons(%7599, %7600) : (i64, i64) -> i64
      %7602 = func.call @cc_values_pack(%7601) : (i64) -> i64
      func.call @stack_push_pointer(%7599) : (i64) -> ()
      %7603 = llvm.mlir.addressof @str855 : !llvm.ptr
      %7604 = arith.constant 18 : i64
      %7605 = func.call @cc_make_string(%7603, %7604) : (!llvm.ptr, i64) -> i64
      %7606 = llvm.mlir.addressof @str856 : !llvm.ptr
      %7607 = arith.constant 11 : i64
      %7608 = func.call @cc_make_string(%7606, %7607) : (!llvm.ptr, i64) -> i64
      %7609 = func.call @cc_intern(%7605, %7608) : (i64, i64) -> i64
      %7610 = func.call @cc_nil_value() : () -> i64
      %7611 = func.call @cc_cons(%7609, %7610) : (i64, i64) -> i64
      %7612 = func.call @cc_values_pack(%7611) : (i64) -> i64
      func.call @stack_push_pointer(%7609) : (i64) -> ()
      %7613 = llvm.mlir.addressof @str857 : !llvm.ptr
      %7614 = arith.constant 13 : i64
      %7615 = func.call @cc_make_string(%7613, %7614) : (!llvm.ptr, i64) -> i64
      %7616 = llvm.mlir.addressof @str858 : !llvm.ptr
      %7617 = arith.constant 11 : i64
      %7618 = func.call @cc_make_string(%7616, %7617) : (!llvm.ptr, i64) -> i64
      %7619 = func.call @cc_intern(%7615, %7618) : (i64, i64) -> i64
      %7620 = func.call @cc_nil_value() : () -> i64
      %7621 = func.call @cc_cons(%7619, %7620) : (i64, i64) -> i64
      %7622 = func.call @cc_values_pack(%7621) : (i64) -> i64
      func.call @stack_push_pointer(%7619) : (i64) -> ()
      %7623 = llvm.mlir.addressof @str859 : !llvm.ptr
      %7624 = arith.constant 8 : i64
      %7625 = func.call @cc_make_string(%7623, %7624) : (!llvm.ptr, i64) -> i64
      %7626 = llvm.mlir.addressof @str860 : !llvm.ptr
      %7627 = arith.constant 11 : i64
      %7628 = func.call @cc_make_string(%7626, %7627) : (!llvm.ptr, i64) -> i64
      %7629 = func.call @cc_intern(%7625, %7628) : (i64, i64) -> i64
      %7630 = func.call @cc_nil_value() : () -> i64
      %7631 = func.call @cc_cons(%7629, %7630) : (i64, i64) -> i64
      %7632 = func.call @cc_values_pack(%7631) : (i64) -> i64
      func.call @stack_push_pointer(%7629) : (i64) -> ()
      %7633 = llvm.mlir.addressof @str861 : !llvm.ptr
      %7634 = arith.constant 7 : i64
      %7635 = func.call @cc_make_string(%7633, %7634) : (!llvm.ptr, i64) -> i64
      %7636 = llvm.mlir.addressof @str862 : !llvm.ptr
      %7637 = arith.constant 11 : i64
      %7638 = func.call @cc_make_string(%7636, %7637) : (!llvm.ptr, i64) -> i64
      %7639 = func.call @cc_intern(%7635, %7638) : (i64, i64) -> i64
      %7640 = func.call @cc_nil_value() : () -> i64
      %7641 = func.call @cc_cons(%7639, %7640) : (i64, i64) -> i64
      %7642 = func.call @cc_values_pack(%7641) : (i64) -> i64
      func.call @stack_push_pointer(%7639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7643 = func.call @stack_pop_pointer() : () -> i64
      %7644 = func.call @stack_pop_pointer() : () -> i64
      %7645 = func.call @cc_cons(%7644, %7643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7645) : (i64) -> ()
      %7646 = func.call @stack_pop_pointer() : () -> i64
      %7647 = func.call @stack_pop_pointer() : () -> i64
      %7648 = func.call @cc_cons(%7647, %7646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7648) : (i64) -> ()
      %7649 = func.call @stack_pop_pointer() : () -> i64
      %7650 = func.call @stack_pop_pointer() : () -> i64
      %7651 = func.call @cc_cons(%7650, %7649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7651) : (i64) -> ()
      %7652 = func.call @stack_pop_pointer() : () -> i64
      %7653 = func.call @stack_pop_pointer() : () -> i64
      %7654 = func.call @cc_cons(%7653, %7652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7654) : (i64) -> ()
      %7655 = func.call @stack_pop_pointer() : () -> i64
      %7656 = func.call @stack_pop_pointer() : () -> i64
      %7657 = func.call @cc_cons(%7656, %7655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7657) : (i64) -> ()
      %7658 = func.call @stack_pop_pointer() : () -> i64
      %7659 = func.call @stack_pop_pointer() : () -> i64
      %7660 = func.call @cc_cons(%7659, %7658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7660) : (i64) -> ()
      %7661 = func.call @stack_pop_pointer() : () -> i64
      %7662 = func.call @stack_pop_pointer() : () -> i64
      %7663 = func.call @cc_cons(%7662, %7661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7663) : (i64) -> ()
      %7664 = func.call @stack_pop_pointer() : () -> i64
      %7665 = func.call @stack_pop_pointer() : () -> i64
      %7666 = func.call @cc_cons(%7665, %7664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7666) : (i64) -> ()
      %7667 = func.call @stack_pop_pointer() : () -> i64
      %7668 = func.call @stack_pop_pointer() : () -> i64
      %7669 = func.call @cc_cons(%7668, %7667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7669) : (i64) -> ()
      %7670 = func.call @stack_pop_pointer() : () -> i64
      %7671 = func.call @stack_pop_pointer() : () -> i64
      %7672 = func.call @cc_cons(%7671, %7670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7672) : (i64) -> ()
      %7673 = func.call @stack_pop_pointer() : () -> i64
      %7674 = func.call @stack_pop_pointer() : () -> i64
      %7675 = func.call @cc_cons(%7674, %7673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7675) : (i64) -> ()
      %7676 = func.call @stack_pop_pointer() : () -> i64
      %7677 = func.call @stack_pop_pointer() : () -> i64
      %7678 = func.call @cc_cons(%7677, %7676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7678) : (i64) -> ()
      %7679 = func.call @stack_pop_pointer() : () -> i64
      %7680 = func.call @stack_pop_pointer() : () -> i64
      %7681 = func.call @cc_cons(%7680, %7679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7681) : (i64) -> ()
      %7682 = func.call @stack_pop_pointer() : () -> i64
      %7683 = func.call @stack_pop_pointer() : () -> i64
      %7684 = func.call @cc_cons(%7683, %7682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7684) : (i64) -> ()
      %7685 = func.call @stack_pop_pointer() : () -> i64
      %7686 = func.call @stack_pop_pointer() : () -> i64
      %7687 = func.call @cc_cons(%7686, %7685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7687) : (i64) -> ()
      %7688 = func.call @stack_pop_pointer() : () -> i64
      %7689 = func.call @stack_pop_pointer() : () -> i64
      %7690 = func.call @cc_cons(%7689, %7688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7690) : (i64) -> ()
      %7691 = func.call @stack_pop_pointer() : () -> i64
      %7692 = func.call @stack_pop_pointer() : () -> i64
      %7693 = func.call @cc_cons(%7692, %7691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7693) : (i64) -> ()
      %7694 = func.call @stack_pop_pointer() : () -> i64
      %7695 = func.call @stack_pop_pointer() : () -> i64
      %7696 = func.call @cc_cons(%7695, %7694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7696) : (i64) -> ()
      %7697 = func.call @stack_pop_pointer() : () -> i64
      %7698 = func.call @stack_pop_pointer() : () -> i64
      %7699 = func.call @cc_cons(%7698, %7697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7699) : (i64) -> ()
      %7700 = func.call @stack_pop_pointer() : () -> i64
      %7701 = func.call @stack_pop_pointer() : () -> i64
      %7702 = func.call @cc_cons(%7701, %7700) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7702) : (i64) -> ()
      %7703 = func.call @stack_pop_pointer() : () -> i64
      %7704 = func.call @stack_pop_pointer() : () -> i64
      %7705 = func.call @cc_cons(%7704, %7703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7705) : (i64) -> ()
      %7706 = func.call @stack_pop_pointer() : () -> i64
      %7707 = func.call @stack_pop_pointer() : () -> i64
      %7708 = func.call @cc_cons(%7707, %7706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7708) : (i64) -> ()
      %7709 = func.call @stack_pop_pointer() : () -> i64
      %7710 = func.call @stack_pop_pointer() : () -> i64
      %7711 = func.call @cc_cons(%7710, %7709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7711) : (i64) -> ()
      %7712 = func.call @stack_pop_pointer() : () -> i64
      %7713 = func.call @stack_pop_pointer() : () -> i64
      %7714 = func.call @cc_cons(%7713, %7712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7714) : (i64) -> ()
      %7715 = func.call @stack_pop_pointer() : () -> i64
      %7716 = func.call @stack_pop_pointer() : () -> i64
      %7717 = func.call @cc_cons(%7716, %7715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7717) : (i64) -> ()
      %7718 = func.call @stack_pop_pointer() : () -> i64
      %7719 = func.call @stack_pop_pointer() : () -> i64
      %7720 = func.call @cc_cons(%7719, %7718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7720) : (i64) -> ()
      %7721 = func.call @stack_pop_pointer() : () -> i64
      %7722 = func.call @stack_pop_pointer() : () -> i64
      %7723 = func.call @cc_cons(%7722, %7721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7723) : (i64) -> ()
      %7724 = func.call @stack_pop_pointer() : () -> i64
      %7725 = func.call @stack_pop_pointer() : () -> i64
      %7726 = func.call @cc_cons(%7725, %7724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7726) : (i64) -> ()
      %7727 = func.call @stack_pop_pointer() : () -> i64
      %7728 = func.call @stack_pop_pointer() : () -> i64
      %7729 = func.call @cc_cons(%7728, %7727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7729) : (i64) -> ()
      %7730 = func.call @stack_pop_pointer() : () -> i64
      %7731 = func.call @stack_pop_pointer() : () -> i64
      %7732 = func.call @cc_cons(%7731, %7730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7732) : (i64) -> ()
      %7733 = func.call @stack_pop_pointer() : () -> i64
      %7734 = func.call @stack_pop_pointer() : () -> i64
      %7735 = func.call @cc_cons(%7734, %7733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7735) : (i64) -> ()
      %7736 = func.call @stack_pop_pointer() : () -> i64
      %7737 = func.call @stack_pop_pointer() : () -> i64
      %7738 = func.call @cc_cons(%7737, %7736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7738) : (i64) -> ()
      %7739 = func.call @stack_pop_pointer() : () -> i64
      %7740 = func.call @stack_pop_pointer() : () -> i64
      %7741 = func.call @cc_cons(%7740, %7739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7741) : (i64) -> ()
      %7742 = func.call @stack_pop_pointer() : () -> i64
      %7743 = func.call @stack_pop_pointer() : () -> i64
      %7744 = func.call @cc_cons(%7743, %7742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7744) : (i64) -> ()
      %7745 = func.call @stack_pop_pointer() : () -> i64
      %7746 = func.call @stack_pop_pointer() : () -> i64
      %7747 = func.call @cc_cons(%7746, %7745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7747) : (i64) -> ()
      %7748 = func.call @stack_pop_pointer() : () -> i64
      %7749 = func.call @stack_pop_pointer() : () -> i64
      %7750 = func.call @cc_cons(%7749, %7748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7750) : (i64) -> ()
      %7751 = func.call @stack_pop_pointer() : () -> i64
      %7752 = func.call @stack_pop_pointer() : () -> i64
      %7753 = func.call @cc_cons(%7752, %7751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7753) : (i64) -> ()
      %7754 = func.call @stack_pop_pointer() : () -> i64
      %7755 = func.call @stack_pop_pointer() : () -> i64
      %7756 = func.call @cc_cons(%7755, %7754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7756) : (i64) -> ()
      %7757 = func.call @stack_pop_pointer() : () -> i64
      %7758 = func.call @stack_pop_pointer() : () -> i64
      %7759 = func.call @cc_cons(%7758, %7757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7759) : (i64) -> ()
      %7760 = func.call @stack_pop_pointer() : () -> i64
      %7761 = func.call @stack_pop_pointer() : () -> i64
      %7762 = func.call @cc_cons(%7761, %7760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7762) : (i64) -> ()
      %7763 = func.call @stack_pop_pointer() : () -> i64
      %7764 = func.call @stack_pop_pointer() : () -> i64
      %7765 = func.call @cc_cons(%7764, %7763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7765) : (i64) -> ()
      %7766 = func.call @stack_pop_pointer() : () -> i64
      %7767 = func.call @stack_pop_pointer() : () -> i64
      %7768 = func.call @cc_cons(%7767, %7766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7768) : (i64) -> ()
      %7769 = func.call @stack_pop_pointer() : () -> i64
      %7770 = func.call @stack_pop_pointer() : () -> i64
      %7771 = func.call @cc_cons(%7770, %7769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7771) : (i64) -> ()
      %7772 = func.call @stack_pop_pointer() : () -> i64
      %7773 = func.call @stack_pop_pointer() : () -> i64
      %7774 = func.call @cc_cons(%7773, %7772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7774) : (i64) -> ()
      %7775 = func.call @stack_pop_pointer() : () -> i64
      %7776 = func.call @stack_pop_pointer() : () -> i64
      %7777 = func.call @cc_cons(%7776, %7775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7777) : (i64) -> ()
      %7778 = func.call @stack_pop_pointer() : () -> i64
      %7779 = func.call @stack_pop_pointer() : () -> i64
      %7780 = func.call @cc_cons(%7779, %7778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7780) : (i64) -> ()
      %7781 = func.call @stack_pop_pointer() : () -> i64
      %7782 = func.call @stack_pop_pointer() : () -> i64
      %7783 = func.call @cc_cons(%7782, %7781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7783) : (i64) -> ()
      %7784 = func.call @stack_pop_pointer() : () -> i64
      %7785 = func.call @stack_pop_pointer() : () -> i64
      %7786 = func.call @cc_cons(%7785, %7784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7786) : (i64) -> ()
      %7787 = func.call @stack_pop_pointer() : () -> i64
      %7788 = func.call @stack_pop_pointer() : () -> i64
      %7789 = func.call @cc_cons(%7788, %7787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7789) : (i64) -> ()
      %7790 = func.call @stack_pop_pointer() : () -> i64
      %7791 = func.call @stack_pop_pointer() : () -> i64
      %7792 = func.call @cc_cons(%7791, %7790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7792) : (i64) -> ()
      %7793 = func.call @stack_pop_pointer() : () -> i64
      %7794 = func.call @stack_pop_pointer() : () -> i64
      %7795 = func.call @cc_cons(%7794, %7793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7795) : (i64) -> ()
      %7796 = func.call @stack_pop_pointer() : () -> i64
      %7797 = func.call @stack_pop_pointer() : () -> i64
      %7798 = func.call @cc_cons(%7797, %7796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7798) : (i64) -> ()
      %7799 = func.call @stack_pop_pointer() : () -> i64
      %7800 = func.call @stack_pop_pointer() : () -> i64
      %7801 = func.call @cc_cons(%7800, %7799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7801) : (i64) -> ()
      %7802 = func.call @stack_pop_pointer() : () -> i64
      %7803 = func.call @stack_pop_pointer() : () -> i64
      %7804 = func.call @cc_cons(%7803, %7802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7804) : (i64) -> ()
      %7805 = func.call @stack_pop_pointer() : () -> i64
      %7806 = func.call @stack_pop_pointer() : () -> i64
      %7807 = func.call @cc_cons(%7806, %7805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7807) : (i64) -> ()
      %7808 = func.call @stack_pop_pointer() : () -> i64
      %7809 = func.call @stack_pop_pointer() : () -> i64
      %7810 = func.call @cc_cons(%7809, %7808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7810) : (i64) -> ()
      %7811 = func.call @stack_pop_pointer() : () -> i64
      %7812 = func.call @stack_pop_pointer() : () -> i64
      %7813 = func.call @cc_cons(%7812, %7811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7813) : (i64) -> ()
      %7814 = func.call @stack_pop_pointer() : () -> i64
      %7815 = func.call @stack_pop_pointer() : () -> i64
      %7816 = func.call @cc_cons(%7815, %7814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7816) : (i64) -> ()
      %7817 = func.call @stack_pop_pointer() : () -> i64
      %7818 = func.call @stack_pop_pointer() : () -> i64
      %7819 = func.call @cc_cons(%7818, %7817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7819) : (i64) -> ()
      %7820 = func.call @stack_pop_pointer() : () -> i64
      %7821 = func.call @stack_pop_pointer() : () -> i64
      %7822 = func.call @cc_cons(%7821, %7820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7822) : (i64) -> ()
      %7823 = func.call @stack_pop_pointer() : () -> i64
      %7824 = func.call @stack_pop_pointer() : () -> i64
      %7825 = func.call @cc_cons(%7824, %7823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7825) : (i64) -> ()
      %7826 = func.call @stack_pop_pointer() : () -> i64
      %7827 = func.call @stack_pop_pointer() : () -> i64
      %7828 = func.call @cc_cons(%7827, %7826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7828) : (i64) -> ()
      %7829 = func.call @stack_pop_pointer() : () -> i64
      %7830 = func.call @stack_pop_pointer() : () -> i64
      %7831 = func.call @cc_cons(%7830, %7829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7831) : (i64) -> ()
      %7832 = func.call @stack_pop_pointer() : () -> i64
      %7833 = func.call @stack_pop_pointer() : () -> i64
      %7834 = func.call @cc_cons(%7833, %7832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7834) : (i64) -> ()
      %7835 = func.call @stack_pop_pointer() : () -> i64
      %7836 = func.call @stack_pop_pointer() : () -> i64
      %7837 = func.call @cc_cons(%7836, %7835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7837) : (i64) -> ()
      %7838 = func.call @stack_pop_pointer() : () -> i64
      %7839 = func.call @stack_pop_pointer() : () -> i64
      %7840 = func.call @cc_cons(%7839, %7838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7840) : (i64) -> ()
      %7841 = func.call @stack_pop_pointer() : () -> i64
      %7842 = func.call @stack_pop_pointer() : () -> i64
      %7843 = func.call @cc_cons(%7842, %7841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7843) : (i64) -> ()
      %7844 = func.call @stack_pop_pointer() : () -> i64
      %7845 = func.call @stack_pop_pointer() : () -> i64
      %7846 = func.call @cc_cons(%7845, %7844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7846) : (i64) -> ()
      %7847 = func.call @stack_pop_pointer() : () -> i64
      %7848 = func.call @stack_pop_pointer() : () -> i64
      %7849 = func.call @cc_cons(%7848, %7847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7849) : (i64) -> ()
      %7850 = func.call @stack_pop_pointer() : () -> i64
      %7851 = func.call @stack_pop_pointer() : () -> i64
      %7852 = func.call @cc_cons(%7851, %7850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7852) : (i64) -> ()
      %7853 = func.call @stack_pop_pointer() : () -> i64
      %7854 = func.call @stack_pop_pointer() : () -> i64
      %7855 = func.call @cc_cons(%7854, %7853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7855) : (i64) -> ()
      %7856 = func.call @stack_pop_pointer() : () -> i64
      %7857 = func.call @stack_pop_pointer() : () -> i64
      %7858 = func.call @cc_cons(%7857, %7856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7858) : (i64) -> ()
      %7859 = func.call @stack_pop_pointer() : () -> i64
      %7860 = func.call @stack_pop_pointer() : () -> i64
      %7861 = func.call @cc_cons(%7860, %7859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7861) : (i64) -> ()
      %7862 = func.call @stack_pop_pointer() : () -> i64
      %7863 = func.call @stack_pop_pointer() : () -> i64
      %7864 = func.call @cc_cons(%7863, %7862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7864) : (i64) -> ()
      %7865 = func.call @stack_pop_pointer() : () -> i64
      %7866 = func.call @stack_pop_pointer() : () -> i64
      %7867 = func.call @cc_cons(%7866, %7865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7867) : (i64) -> ()
      %7868 = func.call @stack_pop_pointer() : () -> i64
      %7869 = func.call @stack_pop_pointer() : () -> i64
      %7870 = func.call @cc_cons(%7869, %7868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7870) : (i64) -> ()
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
      %7892 = func.call @stack_pop_pointer() : () -> i64
      %7893 = func.call @stack_pop_pointer() : () -> i64
      %7894 = func.call @cc_cons(%7893, %7892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7894) : (i64) -> ()
      %7895 = func.call @stack_pop_pointer() : () -> i64
      %7896 = func.call @stack_pop_pointer() : () -> i64
      %7897 = func.call @cc_cons(%7896, %7895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7897) : (i64) -> ()
      %7898 = func.call @stack_pop_pointer() : () -> i64
      %7899 = func.call @stack_pop_pointer() : () -> i64
      %7900 = func.call @cc_cons(%7899, %7898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7900) : (i64) -> ()
      %7901 = func.call @stack_pop_pointer() : () -> i64
      %7902 = func.call @stack_pop_pointer() : () -> i64
      %7903 = func.call @cc_cons(%7902, %7901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7903) : (i64) -> ()
      %7904 = func.call @stack_pop_pointer() : () -> i64
      %7905 = func.call @stack_pop_pointer() : () -> i64
      %7906 = func.call @cc_cons(%7905, %7904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7906) : (i64) -> ()
      %7907 = func.call @stack_pop_pointer() : () -> i64
      %7908 = func.call @stack_pop_pointer() : () -> i64
      %7909 = func.call @cc_cons(%7908, %7907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7909) : (i64) -> ()
      %7910 = func.call @stack_pop_pointer() : () -> i64
      %7911 = func.call @stack_pop_pointer() : () -> i64
      %7912 = func.call @cc_cons(%7911, %7910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7912) : (i64) -> ()
      %7913 = func.call @stack_pop_pointer() : () -> i64
      %7914 = func.call @stack_pop_pointer() : () -> i64
      %7915 = func.call @cc_cons(%7914, %7913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7915) : (i64) -> ()
      %7916 = func.call @stack_pop_pointer() : () -> i64
      %7917 = func.call @stack_pop_pointer() : () -> i64
      %7918 = func.call @cc_cons(%7917, %7916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7918) : (i64) -> ()
      %7919 = func.call @stack_pop_pointer() : () -> i64
      %7920 = func.call @stack_pop_pointer() : () -> i64
      %7921 = func.call @cc_cons(%7920, %7919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7921) : (i64) -> ()
      %7922 = func.call @stack_pop_pointer() : () -> i64
      %7923 = func.call @stack_pop_pointer() : () -> i64
      %7924 = func.call @cc_cons(%7923, %7922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7924) : (i64) -> ()
      %7925 = func.call @stack_pop_pointer() : () -> i64
      %7926 = func.call @stack_pop_pointer() : () -> i64
      %7927 = func.call @cc_cons(%7926, %7925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7927) : (i64) -> ()
      %7928 = func.call @stack_pop_pointer() : () -> i64
      %7929 = func.call @stack_pop_pointer() : () -> i64
      %7930 = func.call @cc_cons(%7929, %7928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7930) : (i64) -> ()
      %7931 = func.call @stack_pop_pointer() : () -> i64
      %7932 = func.call @stack_pop_pointer() : () -> i64
      %7933 = func.call @cc_cons(%7932, %7931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7933) : (i64) -> ()
      %7934 = func.call @stack_pop_pointer() : () -> i64
      %7935 = func.call @stack_pop_pointer() : () -> i64
      %7936 = func.call @cc_cons(%7935, %7934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7936) : (i64) -> ()
      %7937 = func.call @stack_pop_pointer() : () -> i64
      %7938 = func.call @stack_pop_pointer() : () -> i64
      %7939 = func.call @cc_cons(%7938, %7937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7939) : (i64) -> ()
      %7940 = func.call @stack_pop_pointer() : () -> i64
      %7941 = func.call @stack_pop_pointer() : () -> i64
      %7942 = func.call @cc_cons(%7941, %7940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7942) : (i64) -> ()
      %7943 = func.call @stack_pop_pointer() : () -> i64
      %7944 = func.call @stack_pop_pointer() : () -> i64
      %7945 = func.call @cc_cons(%7944, %7943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7945) : (i64) -> ()
      %7946 = func.call @stack_pop_pointer() : () -> i64
      %7947 = func.call @stack_pop_pointer() : () -> i64
      %7948 = func.call @cc_cons(%7947, %7946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7948) : (i64) -> ()
      %7949 = func.call @stack_pop_pointer() : () -> i64
      %7950 = func.call @stack_pop_pointer() : () -> i64
      %7951 = func.call @cc_cons(%7950, %7949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7951) : (i64) -> ()
      %7952 = func.call @stack_pop_pointer() : () -> i64
      %7953 = func.call @stack_pop_pointer() : () -> i64
      %7954 = func.call @cc_cons(%7953, %7952) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7954) : (i64) -> ()
      %7955 = func.call @stack_pop_pointer() : () -> i64
      %7956 = func.call @stack_pop_pointer() : () -> i64
      %7957 = func.call @cc_cons(%7956, %7955) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7957) : (i64) -> ()
      %7958 = func.call @stack_pop_pointer() : () -> i64
      %7959 = func.call @stack_pop_pointer() : () -> i64
      %7960 = func.call @cc_cons(%7959, %7958) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7960) : (i64) -> ()
      %7961 = func.call @stack_pop_pointer() : () -> i64
      %7962 = func.call @stack_pop_pointer() : () -> i64
      %7963 = func.call @cc_cons(%7962, %7961) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7963) : (i64) -> ()
      %7964 = func.call @stack_pop_pointer() : () -> i64
      %7965 = func.call @stack_pop_pointer() : () -> i64
      %7966 = func.call @cc_cons(%7965, %7964) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7966) : (i64) -> ()
      %7967 = func.call @stack_pop_pointer() : () -> i64
      %7968 = func.call @stack_pop_pointer() : () -> i64
      %7969 = func.call @cc_cons(%7968, %7967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7969) : (i64) -> ()
      %7970 = func.call @stack_pop_pointer() : () -> i64
      %7971 = func.call @stack_pop_pointer() : () -> i64
      %7972 = func.call @cc_cons(%7971, %7970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7972) : (i64) -> ()
      %7973 = func.call @stack_pop_pointer() : () -> i64
      %7974 = func.call @stack_pop_pointer() : () -> i64
      %7975 = func.call @cc_cons(%7974, %7973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7975) : (i64) -> ()
      %7976 = func.call @stack_pop_pointer() : () -> i64
      %7977 = func.call @stack_pop_pointer() : () -> i64
      %7978 = func.call @cc_cons(%7977, %7976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7978) : (i64) -> ()
      %7979 = func.call @stack_pop_pointer() : () -> i64
      %7980 = func.call @stack_pop_pointer() : () -> i64
      %7981 = func.call @cc_cons(%7980, %7979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7981) : (i64) -> ()
      %7982 = func.call @stack_pop_pointer() : () -> i64
      %7983 = func.call @stack_pop_pointer() : () -> i64
      %7984 = func.call @cc_cons(%7983, %7982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7984) : (i64) -> ()
      %7985 = func.call @stack_pop_pointer() : () -> i64
      %7986 = func.call @stack_pop_pointer() : () -> i64
      %7987 = func.call @cc_cons(%7986, %7985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7987) : (i64) -> ()
      %7988 = func.call @stack_pop_pointer() : () -> i64
      %7989 = func.call @stack_pop_pointer() : () -> i64
      %7990 = func.call @cc_cons(%7989, %7988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7990) : (i64) -> ()
      %7991 = func.call @stack_pop_pointer() : () -> i64
      %7992 = func.call @stack_pop_pointer() : () -> i64
      %7993 = func.call @cc_cons(%7992, %7991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7993) : (i64) -> ()
      %7994 = func.call @stack_pop_pointer() : () -> i64
      %7995 = func.call @stack_pop_pointer() : () -> i64
      %7996 = func.call @cc_cons(%7995, %7994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7996) : (i64) -> ()
      %7997 = func.call @stack_pop_pointer() : () -> i64
      %7998 = func.call @stack_pop_pointer() : () -> i64
      %7999 = func.call @cc_cons(%7998, %7997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7999) : (i64) -> ()
      %8000 = func.call @stack_pop_pointer() : () -> i64
      %8001 = func.call @stack_pop_pointer() : () -> i64
      %8002 = func.call @cc_cons(%8001, %8000) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8002) : (i64) -> ()
      %8003 = func.call @stack_pop_pointer() : () -> i64
      %8004 = func.call @stack_pop_pointer() : () -> i64
      %8005 = func.call @cc_cons(%8004, %8003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8005) : (i64) -> ()
      %8006 = func.call @stack_pop_pointer() : () -> i64
      %8007 = func.call @stack_pop_pointer() : () -> i64
      %8008 = func.call @cc_cons(%8007, %8006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8008) : (i64) -> ()
      %8009 = func.call @stack_pop_pointer() : () -> i64
      %8010 = func.call @stack_pop_pointer() : () -> i64
      %8011 = func.call @cc_cons(%8010, %8009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8011) : (i64) -> ()
      %8012 = func.call @stack_pop_pointer() : () -> i64
      %8013 = func.call @stack_pop_pointer() : () -> i64
      %8014 = func.call @cc_cons(%8013, %8012) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8014) : (i64) -> ()
      %8015 = func.call @stack_pop_pointer() : () -> i64
      %8016 = func.call @stack_pop_pointer() : () -> i64
      %8017 = func.call @cc_cons(%8016, %8015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8017) : (i64) -> ()
      %8018 = func.call @stack_pop_pointer() : () -> i64
      %8019 = func.call @stack_pop_pointer() : () -> i64
      %8020 = func.call @cc_cons(%8019, %8018) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8020) : (i64) -> ()
      %8021 = func.call @stack_pop_pointer() : () -> i64
      %8022 = func.call @stack_pop_pointer() : () -> i64
      %8023 = func.call @cc_cons(%8022, %8021) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8023) : (i64) -> ()
      %8024 = func.call @stack_pop_pointer() : () -> i64
      %8025 = func.call @stack_pop_pointer() : () -> i64
      %8026 = func.call @cc_cons(%8025, %8024) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8026) : (i64) -> ()
      %8027 = func.call @stack_pop_pointer() : () -> i64
      %8028 = func.call @stack_pop_pointer() : () -> i64
      %8029 = func.call @cc_cons(%8028, %8027) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8029) : (i64) -> ()
      %8030 = func.call @stack_pop_pointer() : () -> i64
      %8031 = func.call @stack_pop_pointer() : () -> i64
      %8032 = func.call @cc_cons(%8031, %8030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8032) : (i64) -> ()
      %8033 = func.call @stack_pop_pointer() : () -> i64
      %8034 = func.call @stack_pop_pointer() : () -> i64
      %8035 = func.call @cc_cons(%8034, %8033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8035) : (i64) -> ()
      %8036 = func.call @stack_pop_pointer() : () -> i64
      %8037 = func.call @stack_pop_pointer() : () -> i64
      %8038 = func.call @cc_cons(%8037, %8036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8038) : (i64) -> ()
      %8039 = func.call @stack_pop_pointer() : () -> i64
      %8040 = func.call @stack_pop_pointer() : () -> i64
      %8041 = func.call @cc_cons(%8040, %8039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8041) : (i64) -> ()
      %8042 = func.call @stack_pop_pointer() : () -> i64
      %8043 = func.call @stack_pop_pointer() : () -> i64
      %8044 = func.call @cc_cons(%8043, %8042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8044) : (i64) -> ()
      %8045 = func.call @stack_pop_pointer() : () -> i64
      %8046 = func.call @stack_pop_pointer() : () -> i64
      %8047 = func.call @cc_cons(%8046, %8045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8047) : (i64) -> ()
      %8048 = func.call @stack_pop_pointer() : () -> i64
      %8049 = func.call @stack_pop_pointer() : () -> i64
      %8050 = func.call @cc_cons(%8049, %8048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8050) : (i64) -> ()
      %8051 = func.call @stack_pop_pointer() : () -> i64
      %8052 = func.call @stack_pop_pointer() : () -> i64
      %8053 = func.call @cc_cons(%8052, %8051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8053) : (i64) -> ()
      %8054 = func.call @stack_pop_pointer() : () -> i64
      %8055 = func.call @stack_pop_pointer() : () -> i64
      %8056 = func.call @cc_cons(%8055, %8054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8056) : (i64) -> ()
      %8057 = func.call @stack_pop_pointer() : () -> i64
      %8058 = func.call @stack_pop_pointer() : () -> i64
      %8059 = func.call @cc_cons(%8058, %8057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8059) : (i64) -> ()
      %8060 = func.call @stack_pop_pointer() : () -> i64
      %8061 = func.call @stack_pop_pointer() : () -> i64
      %8062 = func.call @cc_cons(%8061, %8060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8062) : (i64) -> ()
      %8063 = func.call @stack_pop_pointer() : () -> i64
      %8064 = func.call @stack_pop_pointer() : () -> i64
      %8065 = func.call @cc_cons(%8064, %8063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8065) : (i64) -> ()
      %8066 = func.call @stack_pop_pointer() : () -> i64
      %8067 = func.call @stack_pop_pointer() : () -> i64
      %8068 = func.call @cc_cons(%8067, %8066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8068) : (i64) -> ()
      %8069 = func.call @stack_pop_pointer() : () -> i64
      %8070 = func.call @stack_pop_pointer() : () -> i64
      %8071 = func.call @cc_cons(%8070, %8069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8071) : (i64) -> ()
      %8072 = func.call @stack_pop_pointer() : () -> i64
      %8073 = func.call @stack_pop_pointer() : () -> i64
      %8074 = func.call @cc_cons(%8073, %8072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8074) : (i64) -> ()
      %8075 = func.call @stack_pop_pointer() : () -> i64
      %8076 = func.call @stack_pop_pointer() : () -> i64
      %8077 = func.call @cc_cons(%8076, %8075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8077) : (i64) -> ()
      %8078 = func.call @stack_pop_pointer() : () -> i64
      %8079 = func.call @stack_pop_pointer() : () -> i64
      %8080 = func.call @cc_cons(%8079, %8078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8080) : (i64) -> ()
      %8081 = func.call @stack_pop_pointer() : () -> i64
      %8082 = func.call @stack_pop_pointer() : () -> i64
      %8083 = func.call @cc_cons(%8082, %8081) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8083) : (i64) -> ()
      %8084 = func.call @stack_pop_pointer() : () -> i64
      %8085 = func.call @stack_pop_pointer() : () -> i64
      %8086 = func.call @cc_cons(%8085, %8084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8086) : (i64) -> ()
      %8087 = func.call @stack_pop_pointer() : () -> i64
      %8088 = func.call @stack_pop_pointer() : () -> i64
      %8089 = func.call @cc_cons(%8088, %8087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8089) : (i64) -> ()
      %8090 = func.call @stack_pop_pointer() : () -> i64
      %8091 = func.call @stack_pop_pointer() : () -> i64
      %8092 = func.call @cc_cons(%8091, %8090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8092) : (i64) -> ()
      %8093 = func.call @stack_pop_pointer() : () -> i64
      %8094 = func.call @stack_pop_pointer() : () -> i64
      %8095 = func.call @cc_cons(%8094, %8093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8095) : (i64) -> ()
      %8096 = func.call @stack_pop_pointer() : () -> i64
      %8097 = func.call @stack_pop_pointer() : () -> i64
      %8098 = func.call @cc_cons(%8097, %8096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8098) : (i64) -> ()
      %8099 = func.call @stack_pop_pointer() : () -> i64
      %8100 = func.call @stack_pop_pointer() : () -> i64
      %8101 = func.call @cc_cons(%8100, %8099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8101) : (i64) -> ()
      %8102 = func.call @stack_pop_pointer() : () -> i64
      %8103 = func.call @stack_pop_pointer() : () -> i64
      %8104 = func.call @cc_cons(%8103, %8102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8104) : (i64) -> ()
      %8105 = func.call @stack_pop_pointer() : () -> i64
      %8106 = func.call @stack_pop_pointer() : () -> i64
      %8107 = func.call @cc_cons(%8106, %8105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8107) : (i64) -> ()
      %8108 = func.call @stack_pop_pointer() : () -> i64
      %8109 = func.call @stack_pop_pointer() : () -> i64
      %8110 = func.call @cc_cons(%8109, %8108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8110) : (i64) -> ()
      %8111 = func.call @stack_pop_pointer() : () -> i64
      %8112 = func.call @stack_pop_pointer() : () -> i64
      %8113 = func.call @cc_cons(%8112, %8111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8113) : (i64) -> ()
      %8114 = func.call @stack_pop_pointer() : () -> i64
      %8115 = func.call @stack_pop_pointer() : () -> i64
      %8116 = func.call @cc_cons(%8115, %8114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8116) : (i64) -> ()
      %8117 = func.call @stack_pop_pointer() : () -> i64
      %8118 = func.call @stack_pop_pointer() : () -> i64
      %8119 = func.call @cc_cons(%8118, %8117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8119) : (i64) -> ()
      %8120 = func.call @stack_pop_pointer() : () -> i64
      %8121 = func.call @stack_pop_pointer() : () -> i64
      %8122 = func.call @cc_cons(%8121, %8120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8122) : (i64) -> ()
      %8123 = func.call @stack_pop_pointer() : () -> i64
      %8124 = func.call @stack_pop_pointer() : () -> i64
      %8125 = func.call @cc_cons(%8124, %8123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8125) : (i64) -> ()
      %8126 = func.call @stack_pop_pointer() : () -> i64
      %8127 = func.call @stack_pop_pointer() : () -> i64
      %8128 = func.call @cc_cons(%8127, %8126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8128) : (i64) -> ()
      %8129 = func.call @stack_pop_pointer() : () -> i64
      %8130 = func.call @stack_pop_pointer() : () -> i64
      %8131 = func.call @cc_cons(%8130, %8129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8131) : (i64) -> ()
      %8132 = func.call @stack_pop_pointer() : () -> i64
      %8133 = func.call @stack_pop_pointer() : () -> i64
      %8134 = func.call @cc_cons(%8133, %8132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8134) : (i64) -> ()
      %8135 = func.call @stack_pop_pointer() : () -> i64
      %8136 = func.call @stack_pop_pointer() : () -> i64
      %8137 = func.call @cc_cons(%8136, %8135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8137) : (i64) -> ()
      %8138 = func.call @stack_pop_pointer() : () -> i64
      %8139 = func.call @stack_pop_pointer() : () -> i64
      %8140 = func.call @cc_cons(%8139, %8138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8140) : (i64) -> ()
      %8141 = func.call @stack_pop_pointer() : () -> i64
      %8142 = func.call @stack_pop_pointer() : () -> i64
      %8143 = func.call @cc_cons(%8142, %8141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8143) : (i64) -> ()
      %8144 = func.call @stack_pop_pointer() : () -> i64
      %8145 = func.call @stack_pop_pointer() : () -> i64
      %8146 = func.call @cc_cons(%8145, %8144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8146) : (i64) -> ()
      %8147 = func.call @stack_pop_pointer() : () -> i64
      %8148 = func.call @stack_pop_pointer() : () -> i64
      %8149 = func.call @cc_cons(%8148, %8147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8149) : (i64) -> ()
      %8150 = func.call @stack_pop_pointer() : () -> i64
      %8151 = func.call @stack_pop_pointer() : () -> i64
      %8152 = func.call @cc_cons(%8151, %8150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8152) : (i64) -> ()
      %8153 = func.call @stack_pop_pointer() : () -> i64
      %8154 = func.call @stack_pop_pointer() : () -> i64
      %8155 = func.call @cc_cons(%8154, %8153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8155) : (i64) -> ()
      %8156 = func.call @stack_pop_pointer() : () -> i64
      %8157 = func.call @stack_pop_pointer() : () -> i64
      %8158 = func.call @cc_cons(%8157, %8156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8158) : (i64) -> ()
      %8159 = func.call @stack_pop_pointer() : () -> i64
      %8160 = func.call @stack_pop_pointer() : () -> i64
      %8161 = func.call @cc_cons(%8160, %8159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8161) : (i64) -> ()
      %8162 = func.call @stack_pop_pointer() : () -> i64
      %8163 = func.call @stack_pop_pointer() : () -> i64
      %8164 = func.call @cc_cons(%8163, %8162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8164) : (i64) -> ()
      %8165 = func.call @stack_pop_pointer() : () -> i64
      %8166 = func.call @stack_pop_pointer() : () -> i64
      %8167 = func.call @cc_cons(%8166, %8165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8167) : (i64) -> ()
      %8168 = func.call @stack_pop_pointer() : () -> i64
      %8169 = func.call @stack_pop_pointer() : () -> i64
      %8170 = func.call @cc_cons(%8169, %8168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8170) : (i64) -> ()
      %8171 = func.call @stack_pop_pointer() : () -> i64
      %8172 = func.call @stack_pop_pointer() : () -> i64
      %8173 = func.call @cc_cons(%8172, %8171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8173) : (i64) -> ()
      %8174 = func.call @stack_pop_pointer() : () -> i64
      %8175 = func.call @stack_pop_pointer() : () -> i64
      %8176 = func.call @cc_cons(%8175, %8174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8176) : (i64) -> ()
      %8177 = func.call @stack_pop_pointer() : () -> i64
      %8178 = func.call @stack_pop_pointer() : () -> i64
      %8179 = func.call @cc_cons(%8178, %8177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8179) : (i64) -> ()
      %8180 = func.call @stack_pop_pointer() : () -> i64
      %8181 = func.call @stack_pop_pointer() : () -> i64
      %8182 = func.call @cc_cons(%8181, %8180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8182) : (i64) -> ()
      %8183 = func.call @stack_pop_pointer() : () -> i64
      %8184 = func.call @stack_pop_pointer() : () -> i64
      %8185 = func.call @cc_cons(%8184, %8183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8185) : (i64) -> ()
      %8186 = func.call @stack_pop_pointer() : () -> i64
      %8187 = func.call @stack_pop_pointer() : () -> i64
      %8188 = func.call @cc_cons(%8187, %8186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8188) : (i64) -> ()
      %8189 = func.call @stack_pop_pointer() : () -> i64
      %8190 = func.call @stack_pop_pointer() : () -> i64
      %8191 = func.call @cc_cons(%8190, %8189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8191) : (i64) -> ()
      %8192 = func.call @stack_pop_pointer() : () -> i64
      %8193 = func.call @stack_pop_pointer() : () -> i64
      %8194 = func.call @cc_cons(%8193, %8192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8194) : (i64) -> ()
      %8195 = func.call @stack_pop_pointer() : () -> i64
      %8196 = func.call @stack_pop_pointer() : () -> i64
      %8197 = func.call @cc_cons(%8196, %8195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8197) : (i64) -> ()
      %8198 = func.call @stack_pop_pointer() : () -> i64
      %8199 = func.call @stack_pop_pointer() : () -> i64
      %8200 = func.call @cc_cons(%8199, %8198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8200) : (i64) -> ()
      %8201 = func.call @stack_pop_pointer() : () -> i64
      %8202 = func.call @stack_pop_pointer() : () -> i64
      %8203 = func.call @cc_cons(%8202, %8201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8203) : (i64) -> ()
      %8204 = func.call @stack_pop_pointer() : () -> i64
      %8205 = func.call @stack_pop_pointer() : () -> i64
      %8206 = func.call @cc_cons(%8205, %8204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8206) : (i64) -> ()
      %8207 = func.call @stack_pop_pointer() : () -> i64
      %8208 = func.call @stack_pop_pointer() : () -> i64
      %8209 = func.call @cc_cons(%8208, %8207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8209) : (i64) -> ()
      %8210 = func.call @stack_pop_pointer() : () -> i64
      %8211 = func.call @stack_pop_pointer() : () -> i64
      %8212 = func.call @cc_cons(%8211, %8210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8212) : (i64) -> ()
      %8213 = func.call @stack_pop_pointer() : () -> i64
      %8214 = func.call @stack_pop_pointer() : () -> i64
      %8215 = func.call @cc_cons(%8214, %8213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8215) : (i64) -> ()
      %8216 = func.call @stack_pop_pointer() : () -> i64
      %8217 = func.call @stack_pop_pointer() : () -> i64
      %8218 = func.call @cc_cons(%8217, %8216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8218) : (i64) -> ()
      %8219 = func.call @stack_pop_pointer() : () -> i64
      %8220 = func.call @stack_pop_pointer() : () -> i64
      %8221 = func.call @cc_cons(%8220, %8219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8221) : (i64) -> ()
      %8222 = func.call @stack_pop_pointer() : () -> i64
      %8223 = func.call @stack_pop_pointer() : () -> i64
      %8224 = func.call @cc_cons(%8223, %8222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8224) : (i64) -> ()
      %8225 = func.call @stack_pop_pointer() : () -> i64
      %8226 = func.call @stack_pop_pointer() : () -> i64
      %8227 = func.call @cc_cons(%8226, %8225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8227) : (i64) -> ()
      %8228 = func.call @stack_pop_pointer() : () -> i64
      %8229 = func.call @stack_pop_pointer() : () -> i64
      %8230 = func.call @cc_cons(%8229, %8228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8230) : (i64) -> ()
      %8231 = func.call @stack_pop_pointer() : () -> i64
      %8232 = func.call @stack_pop_pointer() : () -> i64
      %8233 = func.call @cc_cons(%8232, %8231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8233) : (i64) -> ()
      %8234 = func.call @stack_pop_pointer() : () -> i64
      %8235 = func.call @stack_pop_pointer() : () -> i64
      %8236 = func.call @cc_cons(%8235, %8234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8236) : (i64) -> ()
      %8237 = func.call @stack_pop_pointer() : () -> i64
      %8238 = func.call @stack_pop_pointer() : () -> i64
      %8239 = func.call @cc_cons(%8238, %8237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8239) : (i64) -> ()
      %8240 = func.call @stack_pop_pointer() : () -> i64
      %8241 = func.call @stack_pop_pointer() : () -> i64
      %8242 = func.call @cc_cons(%8241, %8240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8242) : (i64) -> ()
      %8243 = func.call @stack_pop_pointer() : () -> i64
      %8244 = func.call @stack_pop_pointer() : () -> i64
      %8245 = func.call @cc_cons(%8244, %8243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8245) : (i64) -> ()
      %8246 = func.call @stack_pop_pointer() : () -> i64
      %8247 = func.call @stack_pop_pointer() : () -> i64
      %8248 = func.call @cc_cons(%8247, %8246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8248) : (i64) -> ()
      %8249 = func.call @stack_pop_pointer() : () -> i64
      %8250 = func.call @stack_pop_pointer() : () -> i64
      %8251 = func.call @cc_cons(%8250, %8249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8251) : (i64) -> ()
      %8252 = func.call @stack_pop_pointer() : () -> i64
      %8253 = func.call @stack_pop_pointer() : () -> i64
      %8254 = func.call @cc_cons(%8253, %8252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8254) : (i64) -> ()
      %8255 = func.call @stack_pop_pointer() : () -> i64
      %8256 = func.call @stack_pop_pointer() : () -> i64
      %8257 = func.call @cc_cons(%8256, %8255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8257) : (i64) -> ()
      %8258 = func.call @stack_pop_pointer() : () -> i64
      %8259 = func.call @stack_pop_pointer() : () -> i64
      %8260 = func.call @cc_cons(%8259, %8258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8260) : (i64) -> ()
      %8261 = func.call @stack_pop_pointer() : () -> i64
      %8262 = func.call @stack_pop_pointer() : () -> i64
      %8263 = func.call @cc_cons(%8262, %8261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8263) : (i64) -> ()
      %8264 = func.call @stack_pop_pointer() : () -> i64
      %8265 = func.call @stack_pop_pointer() : () -> i64
      %8266 = func.call @cc_cons(%8265, %8264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8266) : (i64) -> ()
      %8267 = func.call @stack_pop_pointer() : () -> i64
      %8268 = func.call @stack_pop_pointer() : () -> i64
      %8269 = func.call @cc_cons(%8268, %8267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8269) : (i64) -> ()
      %8270 = func.call @stack_pop_pointer() : () -> i64
      %8271 = func.call @stack_pop_pointer() : () -> i64
      %8272 = func.call @cc_cons(%8271, %8270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8272) : (i64) -> ()
      %8273 = func.call @stack_pop_pointer() : () -> i64
      %8274 = func.call @stack_pop_pointer() : () -> i64
      %8275 = func.call @cc_cons(%8274, %8273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8275) : (i64) -> ()
      %8276 = func.call @stack_pop_pointer() : () -> i64
      %8277 = func.call @stack_pop_pointer() : () -> i64
      %8278 = func.call @cc_cons(%8277, %8276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8278) : (i64) -> ()
      %8279 = func.call @stack_pop_pointer() : () -> i64
      %8280 = func.call @stack_pop_pointer() : () -> i64
      %8281 = func.call @cc_cons(%8280, %8279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8281) : (i64) -> ()
      %8282 = func.call @stack_pop_pointer() : () -> i64
      %8283 = func.call @stack_pop_pointer() : () -> i64
      %8284 = func.call @cc_cons(%8283, %8282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8284) : (i64) -> ()
      %8285 = func.call @stack_pop_pointer() : () -> i64
      %8286 = func.call @stack_pop_pointer() : () -> i64
      %8287 = func.call @cc_cons(%8286, %8285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8287) : (i64) -> ()
      %8288 = func.call @stack_pop_pointer() : () -> i64
      %8289 = func.call @stack_pop_pointer() : () -> i64
      %8290 = func.call @cc_cons(%8289, %8288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8290) : (i64) -> ()
      %8291 = func.call @stack_pop_pointer() : () -> i64
      %8292 = func.call @stack_pop_pointer() : () -> i64
      %8293 = func.call @cc_cons(%8292, %8291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8293) : (i64) -> ()
      %8294 = func.call @stack_pop_pointer() : () -> i64
      %8295 = func.call @stack_pop_pointer() : () -> i64
      %8296 = func.call @cc_cons(%8295, %8294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8296) : (i64) -> ()
      %8297 = func.call @stack_pop_pointer() : () -> i64
      %8298 = func.call @stack_pop_pointer() : () -> i64
      %8299 = func.call @cc_cons(%8298, %8297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8299) : (i64) -> ()
      %8300 = func.call @stack_pop_pointer() : () -> i64
      %8301 = func.call @stack_pop_pointer() : () -> i64
      %8302 = func.call @cc_cons(%8301, %8300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8302) : (i64) -> ()
      %8303 = func.call @stack_pop_pointer() : () -> i64
      %8304 = func.call @stack_pop_pointer() : () -> i64
      %8305 = func.call @cc_cons(%8304, %8303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8305) : (i64) -> ()
      %8306 = func.call @stack_pop_pointer() : () -> i64
      %8307 = func.call @stack_pop_pointer() : () -> i64
      %8308 = func.call @cc_cons(%8307, %8306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8308) : (i64) -> ()
      %8309 = func.call @stack_pop_pointer() : () -> i64
      %8310 = func.call @stack_pop_pointer() : () -> i64
      %8311 = func.call @cc_cons(%8309, %8310) : (i64, i64) -> i64
      %8312 = llvm.mlir.addressof @str863 : !llvm.ptr
      %8313 = arith.constant 5 : i64
      %8314 = func.call @cc_make_string(%8312, %8313) : (!llvm.ptr, i64) -> i64
      %8315 = func.call @cc_nil_value() : () -> i64
      %8316 = func.call @cc_intern(%8314, %8315) : (i64, i64) -> i64
      %8317 = func.call @cc_nil_value() : () -> i64
      %8318 = func.call @cc_cons(%8316, %8317) : (i64, i64) -> i64
      %8319 = func.call @cc_values_pack(%8318) : (i64) -> i64
      %8320 = func.call @cc_cons(%8316, %8311) : (i64, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %8327 = func.call @stack_pop_pointer() : () -> i64
      %8328 = func.call @stack_pop_pointer() : () -> i64
      %8329 = func.call @cc_cons(%8328, %8327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8329) : (i64) -> ()
      %8330 = llvm.mlir.addressof @str864 : !llvm.ptr
      %8331 = arith.constant 4 : i64
      %8332 = func.call @cc_make_string(%8330, %8331) : (!llvm.ptr, i64) -> i64
      %8333 = func.call @cc_nil_value() : () -> i64
      %8334 = func.call @cc_intern(%8332, %8333) : (i64, i64) -> i64
      %8335 = func.call @cc_nil_value() : () -> i64
      %8336 = func.call @cc_cons(%8334, %8335) : (i64, i64) -> i64
      %8337 = func.call @cc_values_pack(%8336) : (i64) -> i64
      func.call @stack_push_pointer(%8334) : (i64) -> ()
      %8338 = llvm.mlir.addressof @str865 : !llvm.ptr
      %8339 = arith.constant 3 : i64
      %8340 = func.call @cc_make_string(%8338, %8339) : (!llvm.ptr, i64) -> i64
      %8341 = func.call @cc_nil_value() : () -> i64
      %8342 = func.call @cc_intern(%8340, %8341) : (i64, i64) -> i64
      %8343 = func.call @cc_nil_value() : () -> i64
      %8344 = func.call @cc_cons(%8342, %8343) : (i64, i64) -> i64
      %8345 = func.call @cc_values_pack(%8344) : (i64) -> i64
      func.call @stack_push_pointer(%8342) : (i64) -> ()
      %8346 = llvm.mlir.addressof @str866 : !llvm.ptr
      %8347 = arith.constant 1 : i64
      %8348 = func.call @cc_make_string(%8346, %8347) : (!llvm.ptr, i64) -> i64
      %8349 = func.call @cc_nil_value() : () -> i64
      %8350 = func.call @cc_intern(%8348, %8349) : (i64, i64) -> i64
      %8351 = func.call @cc_nil_value() : () -> i64
      %8352 = func.call @cc_cons(%8350, %8351) : (i64, i64) -> i64
      %8353 = func.call @cc_values_pack(%8352) : (i64) -> i64
      func.call @stack_push_pointer(%8350) : (i64) -> ()
      %8354 = llvm.mlir.addressof @str867 : !llvm.ptr
      %8355 = arith.constant 2 : i64
      %8356 = func.call @cc_make_string(%8354, %8355) : (!llvm.ptr, i64) -> i64
      %8357 = func.call @cc_nil_value() : () -> i64
      %8358 = func.call @cc_intern(%8356, %8357) : (i64, i64) -> i64
      %8359 = func.call @cc_nil_value() : () -> i64
      %8360 = func.call @cc_cons(%8358, %8359) : (i64, i64) -> i64
      %8361 = func.call @cc_values_pack(%8360) : (i64) -> i64
      func.call @stack_push_pointer(%8358) : (i64) -> ()
      %8362 = llvm.mlir.addressof @str868 : !llvm.ptr
      %8363 = arith.constant 46 : i64
      %8364 = func.call @cc_make_string(%8362, %8363) : (!llvm.ptr, i64) -> i64
      %8365 = func.call @cc_nil_value() : () -> i64
      %8366 = func.call @cc_intern(%8364, %8365) : (i64, i64) -> i64
      %8367 = func.call @cc_nil_value() : () -> i64
      %8368 = func.call @cc_cons(%8366, %8367) : (i64, i64) -> i64
      %8369 = func.call @cc_values_pack(%8368) : (i64) -> i64
      func.call @stack_push_pointer(%8366) : (i64) -> ()
      %8370 = llvm.mlir.addressof @str869 : !llvm.ptr
      %8371 = arith.constant 4 : i64
      %8372 = func.call @cc_make_string(%8370, %8371) : (!llvm.ptr, i64) -> i64
      %8373 = llvm.mlir.addressof @str870 : !llvm.ptr
      %8374 = arith.constant 11 : i64
      %8375 = func.call @cc_make_string(%8373, %8374) : (!llvm.ptr, i64) -> i64
      %8376 = func.call @cc_intern(%8372, %8375) : (i64, i64) -> i64
      %8377 = func.call @cc_nil_value() : () -> i64
      %8378 = func.call @cc_cons(%8376, %8377) : (i64, i64) -> i64
      %8379 = func.call @cc_values_pack(%8378) : (i64) -> i64
      func.call @stack_push_pointer(%8376) : (i64) -> ()
      %8380 = llvm.mlir.addressof @str871 : !llvm.ptr
      %8381 = arith.constant 7 : i64
      %8382 = func.call @cc_make_string(%8380, %8381) : (!llvm.ptr, i64) -> i64
      %8383 = llvm.mlir.addressof @str872 : !llvm.ptr
      %8384 = arith.constant 11 : i64
      %8385 = func.call @cc_make_string(%8383, %8384) : (!llvm.ptr, i64) -> i64
      %8386 = func.call @cc_intern(%8382, %8385) : (i64, i64) -> i64
      %8387 = func.call @cc_nil_value() : () -> i64
      %8388 = func.call @cc_cons(%8386, %8387) : (i64, i64) -> i64
      %8389 = func.call @cc_values_pack(%8388) : (i64) -> i64
      func.call @stack_push_pointer(%8386) : (i64) -> ()
      %8390 = llvm.mlir.addressof @str873 : !llvm.ptr
      %8391 = arith.constant 1 : i64
      %8392 = func.call @cc_make_string(%8390, %8391) : (!llvm.ptr, i64) -> i64
      %8393 = func.call @cc_nil_value() : () -> i64
      %8394 = func.call @cc_intern(%8392, %8393) : (i64, i64) -> i64
      %8395 = func.call @cc_nil_value() : () -> i64
      %8396 = func.call @cc_cons(%8394, %8395) : (i64, i64) -> i64
      %8397 = func.call @cc_values_pack(%8396) : (i64) -> i64
      func.call @stack_push_pointer(%8394) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8398 = func.call @stack_pop_pointer() : () -> i64
      %8399 = func.call @stack_pop_pointer() : () -> i64
      %8400 = func.call @cc_cons(%8399, %8398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8400) : (i64) -> ()
      %8401 = func.call @stack_pop_pointer() : () -> i64
      %8402 = func.call @stack_pop_pointer() : () -> i64
      %8403 = func.call @cc_cons(%8402, %8401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8403) : (i64) -> ()
      %8404 = llvm.mlir.addressof @str874 : !llvm.ptr
      %8405 = arith.constant 7 : i64
      %8406 = func.call @cc_make_string(%8404, %8405) : (!llvm.ptr, i64) -> i64
      %8407 = func.call @cc_nil_value() : () -> i64
      %8408 = func.call @cc_intern(%8406, %8407) : (i64, i64) -> i64
      %8409 = func.call @cc_nil_value() : () -> i64
      %8410 = func.call @cc_cons(%8408, %8409) : (i64, i64) -> i64
      %8411 = func.call @cc_values_pack(%8410) : (i64) -> i64
      func.call @stack_push_pointer(%8408) : (i64) -> ()
      %8412 = llvm.mlir.addressof @str875 : !llvm.ptr
      %8413 = arith.constant 1 : i64
      %8414 = func.call @cc_make_string(%8412, %8413) : (!llvm.ptr, i64) -> i64
      %8415 = func.call @cc_nil_value() : () -> i64
      %8416 = func.call @cc_intern(%8414, %8415) : (i64, i64) -> i64
      %8417 = func.call @cc_nil_value() : () -> i64
      %8418 = func.call @cc_cons(%8416, %8417) : (i64, i64) -> i64
      %8419 = func.call @cc_values_pack(%8418) : (i64) -> i64
      func.call @stack_push_pointer(%8416) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8420 = func.call @stack_pop_pointer() : () -> i64
      %8421 = func.call @stack_pop_pointer() : () -> i64
      %8422 = func.call @cc_cons(%8421, %8420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8422) : (i64) -> ()
      %8423 = func.call @stack_pop_pointer() : () -> i64
      %8424 = func.call @stack_pop_pointer() : () -> i64
      %8425 = func.call @cc_cons(%8424, %8423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8425) : (i64) -> ()
      %8426 = func.call @stack_pop_pointer() : () -> i64
      %8427 = func.call @stack_pop_pointer() : () -> i64
      %8428 = func.call @cc_cons(%8427, %8426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8428) : (i64) -> ()
      %8429 = func.call @stack_pop_pointer() : () -> i64
      %8430 = func.call @stack_pop_pointer() : () -> i64
      %8431 = func.call @cc_cons(%8430, %8429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8431) : (i64) -> ()
      %8432 = func.call @stack_pop_pointer() : () -> i64
      %8433 = func.call @stack_pop_pointer() : () -> i64
      %8434 = func.call @cc_cons(%8433, %8432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8434) : (i64) -> ()
      %8435 = func.call @stack_pop_pointer() : () -> i64
      %8436 = func.call @stack_pop_pointer() : () -> i64
      %8437 = func.call @cc_cons(%8436, %8435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8437) : (i64) -> ()
      %8438 = func.call @stack_pop_pointer() : () -> i64
      %8439 = func.call @stack_pop_pointer() : () -> i64
      %8440 = func.call @cc_cons(%8439, %8438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8440) : (i64) -> ()
      %8441 = func.call @stack_pop_pointer() : () -> i64
      %8442 = func.call @stack_pop_pointer() : () -> i64
      %8443 = func.call @cc_cons(%8442, %8441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8443) : (i64) -> ()
      %8444 = func.call @stack_pop_pointer() : () -> i64
      %8445 = func.call @stack_pop_pointer() : () -> i64
      %8446 = func.call @cc_cons(%8445, %8444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8446) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8447 = func.call @stack_pop_pointer() : () -> i64
      %8448 = func.call @stack_pop_pointer() : () -> i64
      %8449 = func.call @cc_cons(%8448, %8447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8449) : (i64) -> ()
      %8450 = func.call @stack_pop_pointer() : () -> i64
      %8451 = func.call @stack_pop_pointer() : () -> i64
      %8452 = func.call @cc_cons(%8451, %8450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8452) : (i64) -> ()
      %8453 = func.call @stack_pop_pointer() : () -> i64
      %8454 = func.call @stack_pop_pointer() : () -> i64
      %8455 = func.call @cc_cons(%8454, %8453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8455) : (i64) -> ()
      %8456 = func.call @stack_pop_pointer() : () -> i64
      %11585 = arith.constant 116254966808597 : i64
      %11586 = arith.constant 0 : i64
      %11587 = func.call @cc_make_closure(%11585, %11586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11587) : (i64) -> ()
      %11588 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %11589 = func.call @stack_pop_pointer() : () -> i64
      %11590 = func.call @stack_pop_pointer() : () -> i64
      %11591 = func.call @cc_cons(%11590, %11589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11591) : (i64) -> ()
      %11592 = func.call @stack_pop_pointer() : () -> i64
      %11593 = llvm.mlir.addressof @str1330 : !llvm.ptr
      %11594 = arith.constant 11 : i64
      %11595 = func.call @cc_make_string(%11593, %11594) : (!llvm.ptr, i64) -> i64
      %11596 = llvm.mlir.addressof @str1331 : !llvm.ptr
      %11597 = arith.constant 7 : i64
      %11598 = func.call @cc_make_string(%11596, %11597) : (!llvm.ptr, i64) -> i64
      %11599 = func.call @cc_intern(%11595, %11598) : (i64, i64) -> i64
      %11600 = func.call @cc_nil_value() : () -> i64
      %11601 = func.call @cc_cons(%11599, %11600) : (i64, i64) -> i64
      %11602 = func.call @cc_values_pack(%11601) : (i64) -> i64
      func.call @stack_push_pointer(%11599) : (i64) -> ()
      %11603 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %11604 = func.call @stack_pop_pointer() : () -> i64
      %11605 = llvm.mlir.addressof @str1332 : !llvm.ptr
      %11606 = arith.constant 4 : i64
      %11607 = func.call @cc_make_string(%11605, %11606) : (!llvm.ptr, i64) -> i64
      %11608 = llvm.mlir.addressof @str1333 : !llvm.ptr
      %11609 = arith.constant 7 : i64
      %11610 = func.call @cc_make_string(%11608, %11609) : (!llvm.ptr, i64) -> i64
      %11611 = func.call @cc_intern(%11607, %11610) : (i64, i64) -> i64
      %11612 = func.call @cc_nil_value() : () -> i64
      %11613 = func.call @cc_cons(%11611, %11612) : (i64, i64) -> i64
      %11614 = func.call @cc_values_pack(%11613) : (i64) -> i64
      func.call @stack_push_pointer(%11611) : (i64) -> ()
      %11615 = func.call @stack_pop_pointer() : () -> i64
      %11616 = llvm.mlir.addressof @str1334 : !llvm.ptr
      %11617 = arith.constant 6 : i64
      %11618 = func.call @cc_make_string(%11616, %11617) : (!llvm.ptr, i64) -> i64
      %11619 = func.call @cc_nil_value() : () -> i64
      %11620 = func.call @cc_intern(%11618, %11619) : (i64, i64) -> i64
      %11621 = func.call @cc_nil_value() : () -> i64
      %11622 = func.call @cc_cons(%11620, %11621) : (i64, i64) -> i64
      %11623 = func.call @cc_values_pack(%11622) : (i64) -> i64
      func.call @stack_push_pointer(%11620) : (i64) -> ()
      %11624 = func.call @stack_pop_pointer() : () -> i64
      %11625 = func.call @cc_nil_value() : () -> i64
      %11626 = func.call @cc_errorp(%5417) : (i64) -> i64
      %11627 = arith.cmpi ne, %11626, %11625 : i64
      %11628 = arith.cmpi eq, %11625, %11625 : i64
      %11629 = arith.andi %11627, %11628 : i1
      %11630 = scf.if %11629 -> (i64) {
        scf.yield %5417 : i64
      } else {
        scf.yield %11625 : i64
      }
      %11631 = func.call @cc_errorp(%8456) : (i64) -> i64
      %11632 = arith.cmpi ne, %11631, %11625 : i64
      %11633 = arith.cmpi eq, %11630, %11625 : i64
      %11634 = arith.andi %11632, %11633 : i1
      %11635 = scf.if %11634 -> (i64) {
        scf.yield %8456 : i64
      } else {
        scf.yield %11630 : i64
      }
      %11636 = func.call @cc_errorp(%11588) : (i64) -> i64
      %11637 = arith.cmpi ne, %11636, %11625 : i64
      %11638 = arith.cmpi eq, %11635, %11625 : i64
      %11639 = arith.andi %11637, %11638 : i1
      %11640 = scf.if %11639 -> (i64) {
        scf.yield %11588 : i64
      } else {
        scf.yield %11635 : i64
      }
      %11641 = func.call @cc_errorp(%11592) : (i64) -> i64
      %11642 = arith.cmpi ne, %11641, %11625 : i64
      %11643 = arith.cmpi eq, %11640, %11625 : i64
      %11644 = arith.andi %11642, %11643 : i1
      %11645 = scf.if %11644 -> (i64) {
        scf.yield %11592 : i64
      } else {
        scf.yield %11640 : i64
      }
      %11646 = func.call @cc_errorp(%11603) : (i64) -> i64
      %11647 = arith.cmpi ne, %11646, %11625 : i64
      %11648 = arith.cmpi eq, %11645, %11625 : i64
      %11649 = arith.andi %11647, %11648 : i1
      %11650 = scf.if %11649 -> (i64) {
        scf.yield %11603 : i64
      } else {
        scf.yield %11645 : i64
      }
      %11651 = func.call @cc_errorp(%11604) : (i64) -> i64
      %11652 = arith.cmpi ne, %11651, %11625 : i64
      %11653 = arith.cmpi eq, %11650, %11625 : i64
      %11654 = arith.andi %11652, %11653 : i1
      %11655 = scf.if %11654 -> (i64) {
        scf.yield %11604 : i64
      } else {
        scf.yield %11650 : i64
      }
      %11656 = func.call @cc_errorp(%11615) : (i64) -> i64
      %11657 = arith.cmpi ne, %11656, %11625 : i64
      %11658 = arith.cmpi eq, %11655, %11625 : i64
      %11659 = arith.andi %11657, %11658 : i1
      %11660 = scf.if %11659 -> (i64) {
        scf.yield %11615 : i64
      } else {
        scf.yield %11655 : i64
      }
      %11661 = func.call @cc_errorp(%11624) : (i64) -> i64
      %11662 = arith.cmpi ne, %11661, %11625 : i64
      %11663 = arith.cmpi eq, %11660, %11625 : i64
      %11664 = arith.andi %11662, %11663 : i1
      %11665 = scf.if %11664 -> (i64) {
        scf.yield %11624 : i64
      } else {
        scf.yield %11660 : i64
      }
      %11666 = arith.cmpi ne, %11665, %11625 : i64
      scf.if %11666 {
        func.call @stack_push_pointer(%11665) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5417) : (i64) -> ()
        func.call @stack_push_pointer(%8456) : (i64) -> ()
        func.call @stack_push_pointer(%11588) : (i64) -> ()
        func.call @stack_push_pointer(%11592) : (i64) -> ()
        func.call @stack_push_pointer(%11603) : (i64) -> ()
        func.call @stack_push_pointer(%11604) : (i64) -> ()
        func.call @stack_push_pointer(%11615) : (i64) -> ()
        func.call @stack_push_pointer(%11624) : (i64) -> ()
        %11667 = llvm.mlir.addressof @str1335 : !llvm.ptr
        %11668 = func.call @cc_make_function_ref_const(%11667) : (!llvm.ptr) -> i64
        %11669 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11668, %11669) : (i64, i64) -> ()
      }
      %11670 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11670 : i64
    }
    func.call @stack_push_pointer(%5408) : (i64) -> ()
    %11671 = func.call @stack_pop_pointer() : () -> i64
    %11672 = func.call @cc_multiple_value_list(%11671) : (i64) -> i64
    %11673 = llvm.mlir.addressof @str1336 : !llvm.ptr
    %11674 = arith.constant 38 : i64
    %11675 = func.call @cc_make_string(%11673, %11674) : (!llvm.ptr, i64) -> i64
    %11676 = func.call @cc_nil_value() : () -> i64
    %11677 = func.call @cc_intern(%11675, %11676) : (i64, i64) -> i64
    %11678 = func.call @cc_nil_value() : () -> i64
    %11679 = func.call @cc_cons(%11677, %11678) : (i64, i64) -> i64
    %11680 = func.call @cc_values_pack(%11679) : (i64) -> i64
    %11681 = func.call @cc_symbol_value(%11677) : (i64) -> i64
    %11682 = llvm.mlir.addressof @str1337 : !llvm.ptr
    %11683 = arith.constant 40 : i64
    %11684 = func.call @cc_make_string(%11682, %11683) : (!llvm.ptr, i64) -> i64
    %11685 = func.call @cc_nil_value() : () -> i64
    %11686 = func.call @cc_intern(%11684, %11685) : (i64, i64) -> i64
    %11687 = func.call @cc_nil_value() : () -> i64
    %11688 = func.call @cc_cons(%11686, %11687) : (i64, i64) -> i64
    %11689 = func.call @cc_values_pack(%11688) : (i64) -> i64
    %11690 = func.call @cc_symbol_value(%11686) : (i64) -> i64
    %11691 = func.call @cc_nil_value() : () -> i64
    %11692 = arith.cmpi ne, %11681, %11691 : i64
    %11693 = scf.if %11692 -> (i64) {
      scf.yield %11690 : i64
    } else {
      scf.yield %11672 : i64
    }
    %11694 = func.call @cc_values_pack(%11693) : (i64) -> i64
    func.call @stack_push_pointer(%11694) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_116254966808577"() {
    %131 = func.call @cc_nil_value() : () -> i64
    %132 = func.call @cc_nil_value() : () -> i64
    %133 = func.call @cc_errorp(%131) : (i64) -> i64
    %134 = arith.cmpi ne, %133, %132 : i64
    %135 = scf.if %134 -> (i64) {
      scf.yield %131 : i64
    } else {
      %136 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_errorp(%137) : (i64) -> i64
      %140 = arith.cmpi ne, %139, %138 : i64
      %141 = scf.if %140 -> (i64) {
        scf.yield %137 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %142 = arith.constant 23 : i64
        func.call @stack_push_fixnum(%142) : (i64) -> ()
        %143 = func.call @stack_pop_pointer() : () -> i64
        %144 = func.call @cc_make_symbol_from_name(%143) : (i64) -> i64
        func.call @stack_push_pointer(%144) : (i64) -> ()
        %145 = func.call @stack_pop_pointer() : () -> i64
        %146 = func.call @cc_errorp(%145) : (i64) -> i64
        %147 = func.call @cc_nil_value() : () -> i64
        %148 = arith.cmpi ne, %146, %147 : i64
        scf.if %148 {
          func.call @stack_push_pointer(%145) : (i64) -> ()
        } else {
          %149 = func.call @cc_multiple_value_list(%145) : (i64) -> i64
          func.call @stack_push_pointer(%149) : (i64) -> ()
        }
        %150 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %151 = func.call @stack_pop_pointer() : () -> i64
        %152 = func.call @cc_nil_value() : () -> i64
        %153 = func.call @cc_maybe_error_from_multiple_value_list(%150) : (i64) -> i64
        %154 = func.call @cc_errorp(%153) : (i64) -> i64
        %155 = arith.cmpi ne, %154, %152 : i64
        %156 = arith.cmpi eq, %152, %152 : i64
        %157 = arith.andi %155, %156 : i1
        %158 = scf.if %157 -> (i64) {
          scf.yield %153 : i64
        } else {
          scf.yield %152 : i64
        }
        %159 = arith.cmpi ne, %158, %152 : i64
        scf.if %159 {
          func.call @stack_push_pointer(%158) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %160 = func.call @stack_pop_pointer() : () -> i64
          %161 = func.call @cc_cons(%151, %160) : (i64, i64) -> i64
          func.call @stack_push_pointer(%161) : (i64) -> ()
          %162 = func.call @stack_pop_pointer() : () -> i64
          %163 = func.call @cc_cons(%150, %162) : (i64, i64) -> i64
          func.call @stack_push_pointer(%163) : (i64) -> ()
          %164 = func.call @stack_pop_pointer() : () -> i64
          %165 = func.call @cc_values_pack(%164) : (i64) -> i64
          func.call @stack_push_pointer(%165) : (i64) -> ()
        }
        %166 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %166 : i64
      }
      func.call @stack_push_pointer(%141) : (i64) -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %169 = func.call @cc_errorp(%167) : (i64) -> i64
      %170 = func.call @cc_nil_value() : () -> i64
      %171 = arith.cmpi ne, %169, %170 : i64
      scf.if %171 {
        %172 = func.call @cc_condition_value(%167) : (i64) -> i64
        %173 = func.call @cc_values2(%170, %172) : (i64, i64) -> i64
        func.call @stack_push_pointer(%173) : (i64) -> ()
      } else {
        %174 = func.call @cc_multiple_value_list(%167) : (i64) -> i64
        %175 = func.call @cc_values_pack(%174) : (i64) -> i64
        func.call @stack_push_pointer(%175) : (i64) -> ()
      }
      %176 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %176 : i64
    }
    func.call @stack_push_pointer(%135) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808578"() {
    %384 = func.call @cc_nil_value() : () -> i64
    %385 = func.call @cc_nil_value() : () -> i64
    %386 = func.call @cc_errorp(%384) : (i64) -> i64
    %387 = arith.cmpi ne, %386, %385 : i64
    %388 = scf.if %387 -> (i64) {
      scf.yield %384 : i64
    } else {
      %389 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %390 = func.call @cc_nil_value() : () -> i64
      %391 = func.call @cc_nil_value() : () -> i64
      %392 = func.call @cc_errorp(%390) : (i64) -> i64
      %393 = arith.cmpi ne, %392, %391 : i64
      %394 = scf.if %393 -> (i64) {
        scf.yield %390 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %395 = llvm.mlir.addressof @str31 : !llvm.ptr
        %396 = arith.constant 5 : i64
        %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
        %398 = llvm.mlir.addressof @str32 : !llvm.ptr
        %399 = arith.constant 11 : i64
        %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
        %401 = func.call @cc_intern(%397, %400) : (i64, i64) -> i64
        %402 = func.call @cc_nil_value() : () -> i64
        %403 = func.call @cc_cons(%401, %402) : (i64, i64) -> i64
        %404 = func.call @cc_values_pack(%403) : (i64) -> i64
        func.call @stack_push_pointer(%401) : (i64) -> ()
        %405 = func.call @stack_pop_pointer() : () -> i64
        %406 = func.call @cc_make_symbol_from_name(%405) : (i64) -> i64
        func.call @stack_push_pointer(%406) : (i64) -> ()
        %407 = func.call @stack_pop_pointer() : () -> i64
        %408 = func.call @cc_errorp(%407) : (i64) -> i64
        %409 = func.call @cc_nil_value() : () -> i64
        %410 = arith.cmpi ne, %408, %409 : i64
        scf.if %410 {
          func.call @stack_push_pointer(%407) : (i64) -> ()
        } else {
          %411 = func.call @cc_multiple_value_list(%407) : (i64) -> i64
          func.call @stack_push_pointer(%411) : (i64) -> ()
        }
        %412 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %413 = func.call @stack_pop_pointer() : () -> i64
        %414 = func.call @cc_nil_value() : () -> i64
        %415 = func.call @cc_maybe_error_from_multiple_value_list(%412) : (i64) -> i64
        %416 = func.call @cc_errorp(%415) : (i64) -> i64
        %417 = arith.cmpi ne, %416, %414 : i64
        %418 = arith.cmpi eq, %414, %414 : i64
        %419 = arith.andi %417, %418 : i1
        %420 = scf.if %419 -> (i64) {
          scf.yield %415 : i64
        } else {
          scf.yield %414 : i64
        }
        %421 = arith.cmpi ne, %420, %414 : i64
        scf.if %421 {
          func.call @stack_push_pointer(%420) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %422 = func.call @stack_pop_pointer() : () -> i64
          %423 = func.call @cc_cons(%413, %422) : (i64, i64) -> i64
          func.call @stack_push_pointer(%423) : (i64) -> ()
          %424 = func.call @stack_pop_pointer() : () -> i64
          %425 = func.call @cc_cons(%412, %424) : (i64, i64) -> i64
          func.call @stack_push_pointer(%425) : (i64) -> ()
          %426 = func.call @stack_pop_pointer() : () -> i64
          %427 = func.call @cc_values_pack(%426) : (i64) -> i64
          func.call @stack_push_pointer(%427) : (i64) -> ()
        }
        %428 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %428 : i64
      }
      func.call @stack_push_pointer(%394) : (i64) -> ()
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %431 = func.call @cc_errorp(%429) : (i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = arith.cmpi ne, %431, %432 : i64
      scf.if %433 {
        %434 = func.call @cc_condition_value(%429) : (i64) -> i64
        %435 = func.call @cc_values2(%432, %434) : (i64, i64) -> i64
        func.call @stack_push_pointer(%435) : (i64) -> ()
      } else {
        %436 = func.call @cc_multiple_value_list(%429) : (i64) -> i64
        %437 = func.call @cc_values_pack(%436) : (i64) -> i64
        func.call @stack_push_pointer(%437) : (i64) -> ()
      }
      %438 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %438 : i64
    }
    func.call @stack_push_pointer(%388) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808579"() {
    %625 = func.call @cc_nil_value() : () -> i64
    %626 = func.call @cc_nil_value() : () -> i64
    %627 = func.call @cc_errorp(%625) : (i64) -> i64
    %628 = arith.cmpi ne, %627, %626 : i64
    %629 = scf.if %628 -> (i64) {
      scf.yield %625 : i64
    } else {
      %630 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %631 = func.call @cc_nil_value() : () -> i64
      %632 = func.call @cc_nil_value() : () -> i64
      %633 = func.call @cc_errorp(%631) : (i64) -> i64
      %634 = arith.cmpi ne, %633, %632 : i64
      %635 = scf.if %634 -> (i64) {
        scf.yield %631 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %636 = arith.constant 65 : i64
        %637 = func.call @cc_box_character(%636) : (i64) -> i64
        func.call @stack_push_pointer(%637) : (i64) -> ()
        %638 = func.call @stack_pop_pointer() : () -> i64
        %639 = func.call @cc_make_symbol_from_name(%638) : (i64) -> i64
        func.call @stack_push_pointer(%639) : (i64) -> ()
        %640 = func.call @stack_pop_pointer() : () -> i64
        %641 = func.call @cc_errorp(%640) : (i64) -> i64
        %642 = func.call @cc_nil_value() : () -> i64
        %643 = arith.cmpi ne, %641, %642 : i64
        scf.if %643 {
          func.call @stack_push_pointer(%640) : (i64) -> ()
        } else {
          %644 = func.call @cc_multiple_value_list(%640) : (i64) -> i64
          func.call @stack_push_pointer(%644) : (i64) -> ()
        }
        %645 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %646 = func.call @stack_pop_pointer() : () -> i64
        %647 = func.call @cc_nil_value() : () -> i64
        %648 = func.call @cc_maybe_error_from_multiple_value_list(%645) : (i64) -> i64
        %649 = func.call @cc_errorp(%648) : (i64) -> i64
        %650 = arith.cmpi ne, %649, %647 : i64
        %651 = arith.cmpi eq, %647, %647 : i64
        %652 = arith.andi %650, %651 : i1
        %653 = scf.if %652 -> (i64) {
          scf.yield %648 : i64
        } else {
          scf.yield %647 : i64
        }
        %654 = arith.cmpi ne, %653, %647 : i64
        scf.if %654 {
          func.call @stack_push_pointer(%653) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %655 = func.call @stack_pop_pointer() : () -> i64
          %656 = func.call @cc_cons(%646, %655) : (i64, i64) -> i64
          func.call @stack_push_pointer(%656) : (i64) -> ()
          %657 = func.call @stack_pop_pointer() : () -> i64
          %658 = func.call @cc_cons(%645, %657) : (i64, i64) -> i64
          func.call @stack_push_pointer(%658) : (i64) -> ()
          %659 = func.call @stack_pop_pointer() : () -> i64
          %660 = func.call @cc_values_pack(%659) : (i64) -> i64
          func.call @stack_push_pointer(%660) : (i64) -> ()
        }
        %661 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %661 : i64
      }
      func.call @stack_push_pointer(%635) : (i64) -> ()
      %662 = func.call @stack_pop_pointer() : () -> i64
      %663 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %664 = func.call @cc_errorp(%662) : (i64) -> i64
      %665 = func.call @cc_nil_value() : () -> i64
      %666 = arith.cmpi ne, %664, %665 : i64
      scf.if %666 {
        %667 = func.call @cc_condition_value(%662) : (i64) -> i64
        %668 = func.call @cc_values2(%665, %667) : (i64, i64) -> i64
        func.call @stack_push_pointer(%668) : (i64) -> ()
      } else {
        %669 = func.call @cc_multiple_value_list(%662) : (i64) -> i64
        %670 = func.call @cc_values_pack(%669) : (i64) -> i64
        func.call @stack_push_pointer(%670) : (i64) -> ()
      }
      %671 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %671 : i64
    }
    func.call @stack_push_pointer(%629) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808580"() {
    %826 = func.call @cc_nil_value() : () -> i64
    %827 = func.call @cc_nil_value() : () -> i64
    %828 = func.call @cc_errorp(%826) : (i64) -> i64
    %829 = arith.cmpi ne, %828, %827 : i64
    %830 = scf.if %829 -> (i64) {
      scf.yield %826 : i64
    } else {
      %831 = llvm.mlir.addressof @str63 : !llvm.ptr
      %832 = arith.constant 5 : i64
      %833 = func.call @cc_make_string(%831, %832) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%833) : (i64) -> ()
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @cc_make_symbol_from_name(%834) : (i64) -> i64
      func.call @stack_push_pointer(%835) : (i64) -> ()
      %836 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @cc_values_pack(%839) : (i64) -> i64
      func.call @stack_push_pointer(%840) : (i64) -> ()
      %841 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %841 : i64
    }
    func.call @stack_push_pointer(%830) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808581"() {
    %1130 = func.call @cc_nil_value() : () -> i64
    %1131 = func.call @cc_nil_value() : () -> i64
    %1132 = func.call @cc_errorp(%1130) : (i64) -> i64
    %1133 = arith.cmpi ne, %1132, %1131 : i64
    %1134 = scf.if %1133 -> (i64) {
      scf.yield %1130 : i64
    } else {
      %1135 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%1135) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @stack_pop_pointer() : () -> i64
      %1138 = func.call @cc_cons(%1137, %1136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1141 = arith.constant 16 : i64
      %1142 = func.call @cc_make_string(%1140, %1141) : (!llvm.ptr, i64) -> i64
      %1143 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1144 = arith.constant 7 : i64
      %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
      %1146 = func.call @cc_intern(%1142, %1145) : (i64, i64) -> i64
      %1147 = func.call @cc_nil_value() : () -> i64
      %1148 = func.call @cc_cons(%1146, %1147) : (i64, i64) -> i64
      %1149 = func.call @cc_values_pack(%1148) : (i64) -> i64
      func.call @stack_push_pointer(%1146) : (i64) -> ()
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = arith.constant 65 : i64
      %1152 = func.call @cc_box_character(%1151) : (i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      %1153 = arith.constant 66 : i64
      %1154 = func.call @cc_box_character(%1153) : (i64) -> i64
      func.call @stack_push_pointer(%1154) : (i64) -> ()
      %1155 = arith.constant 67 : i64
      %1156 = func.call @cc_box_character(%1155) : (i64) -> i64
      func.call @stack_push_pointer(%1156) : (i64) -> ()
      %1157 = arith.constant 68 : i64
      %1158 = func.call @cc_box_character(%1157) : (i64) -> i64
      func.call @stack_push_pointer(%1158) : (i64) -> ()
      %1159 = arith.constant 69 : i64
      %1160 = func.call @cc_box_character(%1159) : (i64) -> i64
      func.call @stack_push_pointer(%1160) : (i64) -> ()
      %1161 = arith.constant 70 : i64
      %1162 = func.call @cc_box_character(%1161) : (i64) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @stack_pop_pointer() : () -> i64
      %1165 = func.call @cc_cons(%1164, %1163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1165) : (i64) -> ()
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
      %1175 = func.call @stack_pop_pointer() : () -> i64
      %1176 = func.call @stack_pop_pointer() : () -> i64
      %1177 = func.call @cc_cons(%1176, %1175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1177) : (i64) -> ()
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @stack_pop_pointer() : () -> i64
      %1180 = func.call @cc_cons(%1179, %1178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1180) : (i64) -> ()
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1183 = arith.constant 12 : i64
      %1184 = func.call @cc_make_string(%1182, %1183) : (!llvm.ptr, i64) -> i64
      %1185 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1186 = arith.constant 7 : i64
      %1187 = func.call @cc_make_string(%1185, %1186) : (!llvm.ptr, i64) -> i64
      %1188 = func.call @cc_intern(%1184, %1187) : (i64, i64) -> i64
      %1189 = func.call @cc_nil_value() : () -> i64
      %1190 = func.call @cc_cons(%1188, %1189) : (i64, i64) -> i64
      %1191 = func.call @cc_values_pack(%1190) : (i64) -> i64
      func.call @stack_push_pointer(%1188) : (i64) -> ()
      %1192 = func.call @stack_pop_pointer() : () -> i64
      %1193 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1194 = arith.constant 9 : i64
      %1195 = func.call @cc_make_string(%1193, %1194) : (!llvm.ptr, i64) -> i64
      %1196 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1197 = arith.constant 11 : i64
      %1198 = func.call @cc_make_string(%1196, %1197) : (!llvm.ptr, i64) -> i64
      %1199 = func.call @cc_intern(%1195, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_nil_value() : () -> i64
      %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
      %1202 = func.call @cc_values_pack(%1201) : (i64) -> i64
      func.call @stack_push_pointer(%1199) : (i64) -> ()
      %1203 = func.call @stack_pop_pointer() : () -> i64
      %1204 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1205 = arith.constant 12 : i64
      %1206 = func.call @cc_make_string(%1204, %1205) : (!llvm.ptr, i64) -> i64
      %1207 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1208 = arith.constant 7 : i64
      %1209 = func.call @cc_make_string(%1207, %1208) : (!llvm.ptr, i64) -> i64
      %1210 = func.call @cc_intern(%1206, %1209) : (i64, i64) -> i64
      %1211 = func.call @cc_nil_value() : () -> i64
      %1212 = func.call @cc_cons(%1210, %1211) : (i64, i64) -> i64
      %1213 = func.call @cc_values_pack(%1212) : (i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      %1214 = func.call @stack_pop_pointer() : () -> i64
      %1215 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%1215) : (i64) -> ()
      %1216 = func.call @stack_pop_pointer() : () -> i64
      %1217 = func.call @cc_nil_value() : () -> i64
      %1218 = func.call @cc_errorp(%1139) : (i64) -> i64
      %1219 = arith.cmpi ne, %1218, %1217 : i64
      %1220 = arith.cmpi eq, %1217, %1217 : i64
      %1221 = arith.andi %1219, %1220 : i1
      %1222 = scf.if %1221 -> (i64) {
        scf.yield %1139 : i64
      } else {
        scf.yield %1217 : i64
      }
      %1223 = func.call @cc_errorp(%1150) : (i64) -> i64
      %1224 = arith.cmpi ne, %1223, %1217 : i64
      %1225 = arith.cmpi eq, %1222, %1217 : i64
      %1226 = arith.andi %1224, %1225 : i1
      %1227 = scf.if %1226 -> (i64) {
        scf.yield %1150 : i64
      } else {
        scf.yield %1222 : i64
      }
      %1228 = func.call @cc_errorp(%1181) : (i64) -> i64
      %1229 = arith.cmpi ne, %1228, %1217 : i64
      %1230 = arith.cmpi eq, %1227, %1217 : i64
      %1231 = arith.andi %1229, %1230 : i1
      %1232 = scf.if %1231 -> (i64) {
        scf.yield %1181 : i64
      } else {
        scf.yield %1227 : i64
      }
      %1233 = func.call @cc_errorp(%1192) : (i64) -> i64
      %1234 = arith.cmpi ne, %1233, %1217 : i64
      %1235 = arith.cmpi eq, %1232, %1217 : i64
      %1236 = arith.andi %1234, %1235 : i1
      %1237 = scf.if %1236 -> (i64) {
        scf.yield %1192 : i64
      } else {
        scf.yield %1232 : i64
      }
      %1238 = func.call @cc_errorp(%1203) : (i64) -> i64
      %1239 = arith.cmpi ne, %1238, %1217 : i64
      %1240 = arith.cmpi eq, %1237, %1217 : i64
      %1241 = arith.andi %1239, %1240 : i1
      %1242 = scf.if %1241 -> (i64) {
        scf.yield %1203 : i64
      } else {
        scf.yield %1237 : i64
      }
      %1243 = func.call @cc_errorp(%1214) : (i64) -> i64
      %1244 = arith.cmpi ne, %1243, %1217 : i64
      %1245 = arith.cmpi eq, %1242, %1217 : i64
      %1246 = arith.andi %1244, %1245 : i1
      %1247 = scf.if %1246 -> (i64) {
        scf.yield %1214 : i64
      } else {
        scf.yield %1242 : i64
      }
      %1248 = func.call @cc_errorp(%1216) : (i64) -> i64
      %1249 = arith.cmpi ne, %1248, %1217 : i64
      %1250 = arith.cmpi eq, %1247, %1217 : i64
      %1251 = arith.andi %1249, %1250 : i1
      %1252 = scf.if %1251 -> (i64) {
        scf.yield %1216 : i64
      } else {
        scf.yield %1247 : i64
      }
      %1253 = arith.cmpi ne, %1252, %1217 : i64
      scf.if %1253 {
        func.call @stack_push_pointer(%1252) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1139) : (i64) -> ()
        func.call @stack_push_pointer(%1150) : (i64) -> ()
        func.call @stack_push_pointer(%1181) : (i64) -> ()
        func.call @stack_push_pointer(%1192) : (i64) -> ()
        func.call @stack_push_pointer(%1203) : (i64) -> ()
        func.call @stack_push_pointer(%1214) : (i64) -> ()
        func.call @stack_push_pointer(%1216) : (i64) -> ()
        %1254 = llvm.mlir.addressof @str97 : !llvm.ptr
        %1255 = func.call @cc_make_function_ref_const(%1254) : (!llvm.ptr) -> i64
        %1256 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%1255, %1256) : (i64, i64) -> ()
      }
      %1257 = func.call @stack_pop_pointer() : () -> i64
      %1258 = func.call @cc_make_symbol_from_name(%1257) : (i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1259 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1260 = func.call @stack_pop_pointer() : () -> i64
      %1261 = func.call @cc_cons(%1259, %1260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1261) : (i64) -> ()
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_values_pack(%1262) : (i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1264 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1264 : i64
    }
    func.call @stack_push_pointer(%1134) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808582"() {
    %1481 = func.call @cc_nil_value() : () -> i64
    %1482 = func.call @cc_nil_value() : () -> i64
    %1483 = func.call @cc_errorp(%1481) : (i64) -> i64
    %1484 = arith.cmpi ne, %1483, %1482 : i64
    %1485 = scf.if %1484 -> (i64) {
      scf.yield %1481 : i64
    } else {
      %1486 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = func.call @cc_nil_value() : () -> i64
      %1489 = func.call @cc_errorp(%1487) : (i64) -> i64
      %1490 = arith.cmpi ne, %1489, %1488 : i64
      %1491 = scf.if %1490 -> (i64) {
        scf.yield %1487 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1492 = arith.constant 23 : i64
        func.call @stack_push_fixnum(%1492) : (i64) -> ()
        %1493 = func.call @stack_pop_pointer() : () -> i64
        %1494 = func.call @cc_nil_value() : () -> i64
        %1495 = func.call @cc_nil_value() : () -> i64
        %1496 = func.call @cc_errorp(%1494) : (i64) -> i64
        %1497 = arith.cmpi ne, %1496, %1495 : i64
        %1498 = scf.if %1497 -> (i64) {
          scf.yield %1494 : i64
        } else {
          func.call @stack_push_pointer(%1493) : (i64) -> ()
          %1499 = func.call @stack_pop_pointer() : () -> i64
          %1500 = func.call @cc_makunbound(%1499) : (i64) -> i64
          func.call @stack_push_pointer(%1500) : (i64) -> ()
          %1501 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1501 : i64
        }
        func.call @stack_push_pointer(%1498) : (i64) -> ()
        %1502 = func.call @stack_pop_pointer() : () -> i64
        %1503 = func.call @cc_errorp(%1502) : (i64) -> i64
        %1504 = func.call @cc_nil_value() : () -> i64
        %1505 = arith.cmpi ne, %1503, %1504 : i64
        scf.if %1505 {
          func.call @stack_push_pointer(%1502) : (i64) -> ()
        } else {
          %1506 = func.call @cc_multiple_value_list(%1502) : (i64) -> i64
          func.call @stack_push_pointer(%1506) : (i64) -> ()
        }
        %1507 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1508 = func.call @stack_pop_pointer() : () -> i64
        %1509 = func.call @cc_nil_value() : () -> i64
        %1510 = func.call @cc_maybe_error_from_multiple_value_list(%1507) : (i64) -> i64
        %1511 = func.call @cc_errorp(%1510) : (i64) -> i64
        %1512 = arith.cmpi ne, %1511, %1509 : i64
        %1513 = arith.cmpi eq, %1509, %1509 : i64
        %1514 = arith.andi %1512, %1513 : i1
        %1515 = scf.if %1514 -> (i64) {
          scf.yield %1510 : i64
        } else {
          scf.yield %1509 : i64
        }
        %1516 = arith.cmpi ne, %1515, %1509 : i64
        scf.if %1516 {
          func.call @stack_push_pointer(%1515) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1517 = func.call @stack_pop_pointer() : () -> i64
          %1518 = func.call @cc_cons(%1508, %1517) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1518) : (i64) -> ()
          %1519 = func.call @stack_pop_pointer() : () -> i64
          %1520 = func.call @cc_cons(%1507, %1519) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1520) : (i64) -> ()
          %1521 = func.call @stack_pop_pointer() : () -> i64
          %1522 = func.call @cc_values_pack(%1521) : (i64) -> i64
          func.call @stack_push_pointer(%1522) : (i64) -> ()
        }
        %1523 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1523 : i64
      }
      func.call @stack_push_pointer(%1491) : (i64) -> ()
      %1524 = func.call @stack_pop_pointer() : () -> i64
      %1525 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1526 = func.call @cc_errorp(%1524) : (i64) -> i64
      %1527 = func.call @cc_nil_value() : () -> i64
      %1528 = arith.cmpi ne, %1526, %1527 : i64
      scf.if %1528 {
        %1529 = func.call @cc_condition_value(%1524) : (i64) -> i64
        %1530 = func.call @cc_values2(%1527, %1529) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1530) : (i64) -> ()
      } else {
        %1531 = func.call @cc_multiple_value_list(%1524) : (i64) -> i64
        %1532 = func.call @cc_values_pack(%1531) : (i64) -> i64
        func.call @stack_push_pointer(%1532) : (i64) -> ()
      }
      %1533 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1533 : i64
    }
    func.call @stack_push_pointer(%1485) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808583"() {
    %1719 = func.call @cc_nil_value() : () -> i64
    %1720 = func.call @cc_nil_value() : () -> i64
    %1721 = func.call @cc_errorp(%1719) : (i64) -> i64
    %1722 = arith.cmpi ne, %1721, %1720 : i64
    %1723 = scf.if %1722 -> (i64) {
      scf.yield %1719 : i64
    } else {
      %1724 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1725 = func.call @cc_nil_value() : () -> i64
      %1726 = func.call @cc_nil_value() : () -> i64
      %1727 = func.call @cc_errorp(%1725) : (i64) -> i64
      %1728 = arith.cmpi ne, %1727, %1726 : i64
      %1729 = scf.if %1728 -> (i64) {
        scf.yield %1725 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1730 = arith.constant -1 : i64
        func.call @stack_push_fixnum(%1730) : (i64) -> ()
        %1731 = func.call @stack_pop_pointer() : () -> i64
        %1732 = func.call @cc_gensym(%1731) : (i64) -> i64
        func.call @stack_push_pointer(%1732) : (i64) -> ()
        %1733 = func.call @stack_pop_pointer() : () -> i64
        %1734 = func.call @cc_errorp(%1733) : (i64) -> i64
        %1735 = func.call @cc_nil_value() : () -> i64
        %1736 = arith.cmpi ne, %1734, %1735 : i64
        scf.if %1736 {
          func.call @stack_push_pointer(%1733) : (i64) -> ()
        } else {
          %1737 = func.call @cc_multiple_value_list(%1733) : (i64) -> i64
          func.call @stack_push_pointer(%1737) : (i64) -> ()
        }
        %1738 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1739 = func.call @stack_pop_pointer() : () -> i64
        %1740 = func.call @cc_nil_value() : () -> i64
        %1741 = func.call @cc_maybe_error_from_multiple_value_list(%1738) : (i64) -> i64
        %1742 = func.call @cc_errorp(%1741) : (i64) -> i64
        %1743 = arith.cmpi ne, %1742, %1740 : i64
        %1744 = arith.cmpi eq, %1740, %1740 : i64
        %1745 = arith.andi %1743, %1744 : i1
        %1746 = scf.if %1745 -> (i64) {
          scf.yield %1741 : i64
        } else {
          scf.yield %1740 : i64
        }
        %1747 = arith.cmpi ne, %1746, %1740 : i64
        scf.if %1747 {
          func.call @stack_push_pointer(%1746) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1748 = func.call @stack_pop_pointer() : () -> i64
          %1749 = func.call @cc_cons(%1739, %1748) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1749) : (i64) -> ()
          %1750 = func.call @stack_pop_pointer() : () -> i64
          %1751 = func.call @cc_cons(%1738, %1750) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1751) : (i64) -> ()
          %1752 = func.call @stack_pop_pointer() : () -> i64
          %1753 = func.call @cc_values_pack(%1752) : (i64) -> i64
          func.call @stack_push_pointer(%1753) : (i64) -> ()
        }
        %1754 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1754 : i64
      }
      func.call @stack_push_pointer(%1729) : (i64) -> ()
      %1755 = func.call @stack_pop_pointer() : () -> i64
      %1756 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1757 = func.call @cc_errorp(%1755) : (i64) -> i64
      %1758 = func.call @cc_nil_value() : () -> i64
      %1759 = arith.cmpi ne, %1757, %1758 : i64
      scf.if %1759 {
        %1760 = func.call @cc_condition_value(%1755) : (i64) -> i64
        %1761 = func.call @cc_values2(%1758, %1760) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1761) : (i64) -> ()
      } else {
        %1762 = func.call @cc_multiple_value_list(%1755) : (i64) -> i64
        %1763 = func.call @cc_values_pack(%1762) : (i64) -> i64
        func.call @stack_push_pointer(%1763) : (i64) -> ()
      }
      %1764 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1764 : i64
    }
    func.call @stack_push_pointer(%1723) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808584"() {
    %1975 = func.call @cc_nil_value() : () -> i64
    %1976 = func.call @cc_nil_value() : () -> i64
    %1977 = func.call @cc_errorp(%1975) : (i64) -> i64
    %1978 = arith.cmpi ne, %1977, %1976 : i64
    %1979 = scf.if %1978 -> (i64) {
      scf.yield %1975 : i64
    } else {
      %1980 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1981 = func.call @cc_nil_value() : () -> i64
      %1982 = func.call @cc_nil_value() : () -> i64
      %1983 = func.call @cc_errorp(%1981) : (i64) -> i64
      %1984 = arith.cmpi ne, %1983, %1982 : i64
      %1985 = scf.if %1984 -> (i64) {
        scf.yield %1981 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1986 = llvm.mlir.addressof @str152 : !llvm.ptr
        %1987 = arith.constant 20 : i64
        %1988 = func.call @cc_make_string(%1986, %1987) : (!llvm.ptr, i64) -> i64
        %1989 = llvm.mlir.addressof @str153 : !llvm.ptr
        %1990 = arith.constant 11 : i64
        %1991 = func.call @cc_make_string(%1989, %1990) : (!llvm.ptr, i64) -> i64
        %1992 = func.call @cc_intern(%1988, %1991) : (i64, i64) -> i64
        %1993 = func.call @cc_nil_value() : () -> i64
        %1994 = func.call @cc_cons(%1992, %1993) : (i64, i64) -> i64
        %1995 = func.call @cc_values_pack(%1994) : (i64) -> i64
        %1996 = func.call @cc_symbol_value(%1992) : (i64) -> i64
        func.call @stack_push_pointer(%1996) : (i64) -> ()
        %1997 = func.call @stack_pop_pointer() : () -> i64
        %1998 = arith.constant 1 : i64
        %1999 = func.call @cc_box_fixnum(%1998) : (i64) -> i64
        %2001 = arith.constant 3 : i64
        %2000 = arith.andi %1997, %2001 : i64
        %2002 = arith.constant 0 : i64
        %2003 = arith.cmpi eq, %2000, %2002 : i64
        %2005 = arith.constant 3 : i64
        %2004 = arith.andi %1999, %2005 : i64
        %2006 = arith.constant 0 : i64
        %2007 = arith.cmpi eq, %2004, %2006 : i64
        %2008 = arith.andi %2003, %2007 : i1
        %2009 = scf.if %2008 -> (i64) {
          %2010 = arith.constant 2 : i64
          %2011 = arith.shrsi %1997, %2010 : i64
          %2012 = arith.constant 2 : i64
          %2013 = arith.shrsi %1999, %2012 : i64
          %2014 = arith.subi %2011, %2013 : i64
          %2015 = arith.constant -2305843009213693952 : i64
          %2016 = arith.constant 2305843009213693951 : i64
          %2017 = arith.cmpi sge, %2014, %2015 : i64
          %2018 = arith.cmpi sle, %2014, %2016 : i64
          %2019 = arith.andi %2017, %2018 : i1
          %2020 = scf.if %2019 -> (i64) {
            %2021 = arith.constant 2 : i64
            %2022 = arith.shli %2014, %2021 : i64
            scf.yield %2022 : i64
          } else {
            %2023 = func.call @cc_sub(%1997, %1999) : (i64, i64) -> i64
            scf.yield %2023 : i64
          }
          scf.yield %2020 : i64
        } else {
          %2024 = func.call @cc_sub(%1997, %1999) : (i64, i64) -> i64
          scf.yield %2024 : i64
        }
        func.call @stack_push_pointer(%2009) : (i64) -> ()
        %2025 = func.call @stack_pop_pointer() : () -> i64
        %2026 = func.call @cc_gensym(%2025) : (i64) -> i64
        func.call @stack_push_pointer(%2026) : (i64) -> ()
        %2027 = func.call @stack_pop_pointer() : () -> i64
        %2028 = func.call @cc_errorp(%2027) : (i64) -> i64
        %2029 = func.call @cc_nil_value() : () -> i64
        %2030 = arith.cmpi ne, %2028, %2029 : i64
        scf.if %2030 {
          func.call @stack_push_pointer(%2027) : (i64) -> ()
        } else {
          %2031 = func.call @cc_multiple_value_list(%2027) : (i64) -> i64
          func.call @stack_push_pointer(%2031) : (i64) -> ()
        }
        %2032 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2033 = func.call @stack_pop_pointer() : () -> i64
        %2034 = func.call @cc_nil_value() : () -> i64
        %2035 = func.call @cc_maybe_error_from_multiple_value_list(%2032) : (i64) -> i64
        %2036 = func.call @cc_errorp(%2035) : (i64) -> i64
        %2037 = arith.cmpi ne, %2036, %2034 : i64
        %2038 = arith.cmpi eq, %2034, %2034 : i64
        %2039 = arith.andi %2037, %2038 : i1
        %2040 = scf.if %2039 -> (i64) {
          scf.yield %2035 : i64
        } else {
          scf.yield %2034 : i64
        }
        %2041 = arith.cmpi ne, %2040, %2034 : i64
        scf.if %2041 {
          func.call @stack_push_pointer(%2040) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2042 = func.call @stack_pop_pointer() : () -> i64
          %2043 = func.call @cc_cons(%2033, %2042) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2043) : (i64) -> ()
          %2044 = func.call @stack_pop_pointer() : () -> i64
          %2045 = func.call @cc_cons(%2032, %2044) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2045) : (i64) -> ()
          %2046 = func.call @stack_pop_pointer() : () -> i64
          %2047 = func.call @cc_values_pack(%2046) : (i64) -> i64
          func.call @stack_push_pointer(%2047) : (i64) -> ()
        }
        %2048 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2048 : i64
      }
      func.call @stack_push_pointer(%1985) : (i64) -> ()
      %2049 = func.call @stack_pop_pointer() : () -> i64
      %2050 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2051 = func.call @cc_errorp(%2049) : (i64) -> i64
      %2052 = func.call @cc_nil_value() : () -> i64
      %2053 = arith.cmpi ne, %2051, %2052 : i64
      scf.if %2053 {
        %2054 = func.call @cc_condition_value(%2049) : (i64) -> i64
        %2055 = func.call @cc_values2(%2052, %2054) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2055) : (i64) -> ()
      } else {
        %2056 = func.call @cc_multiple_value_list(%2049) : (i64) -> i64
        %2057 = func.call @cc_values_pack(%2056) : (i64) -> i64
        func.call @stack_push_pointer(%2057) : (i64) -> ()
      }
      %2058 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2058 : i64
    }
    func.call @stack_push_pointer(%1979) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808585"() {
    %2266 = func.call @cc_nil_value() : () -> i64
    %2267 = func.call @cc_nil_value() : () -> i64
    %2268 = func.call @cc_errorp(%2266) : (i64) -> i64
    %2269 = arith.cmpi ne, %2268, %2267 : i64
    %2270 = scf.if %2269 -> (i64) {
      scf.yield %2266 : i64
    } else {
      %2271 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2272 = func.call @cc_nil_value() : () -> i64
      %2273 = func.call @cc_nil_value() : () -> i64
      %2274 = func.call @cc_errorp(%2272) : (i64) -> i64
      %2275 = arith.cmpi ne, %2274, %2273 : i64
      %2276 = scf.if %2275 -> (i64) {
        scf.yield %2272 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2277 = llvm.mlir.addressof @str173 : !llvm.ptr
        %2278 = arith.constant 5 : i64
        %2279 = func.call @cc_make_string(%2277, %2278) : (!llvm.ptr, i64) -> i64
        %2280 = llvm.mlir.addressof @str174 : !llvm.ptr
        %2281 = arith.constant 11 : i64
        %2282 = func.call @cc_make_string(%2280, %2281) : (!llvm.ptr, i64) -> i64
        %2283 = func.call @cc_intern(%2279, %2282) : (i64, i64) -> i64
        %2284 = func.call @cc_nil_value() : () -> i64
        %2285 = func.call @cc_cons(%2283, %2284) : (i64, i64) -> i64
        %2286 = func.call @cc_values_pack(%2285) : (i64) -> i64
        func.call @stack_push_pointer(%2283) : (i64) -> ()
        %2287 = func.call @stack_pop_pointer() : () -> i64
        %2288 = func.call @cc_gensym(%2287) : (i64) -> i64
        func.call @stack_push_pointer(%2288) : (i64) -> ()
        %2289 = func.call @stack_pop_pointer() : () -> i64
        %2290 = func.call @cc_errorp(%2289) : (i64) -> i64
        %2291 = func.call @cc_nil_value() : () -> i64
        %2292 = arith.cmpi ne, %2290, %2291 : i64
        scf.if %2292 {
          func.call @stack_push_pointer(%2289) : (i64) -> ()
        } else {
          %2293 = func.call @cc_multiple_value_list(%2289) : (i64) -> i64
          func.call @stack_push_pointer(%2293) : (i64) -> ()
        }
        %2294 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2295 = func.call @stack_pop_pointer() : () -> i64
        %2296 = func.call @cc_nil_value() : () -> i64
        %2297 = func.call @cc_maybe_error_from_multiple_value_list(%2294) : (i64) -> i64
        %2298 = func.call @cc_errorp(%2297) : (i64) -> i64
        %2299 = arith.cmpi ne, %2298, %2296 : i64
        %2300 = arith.cmpi eq, %2296, %2296 : i64
        %2301 = arith.andi %2299, %2300 : i1
        %2302 = scf.if %2301 -> (i64) {
          scf.yield %2297 : i64
        } else {
          scf.yield %2296 : i64
        }
        %2303 = arith.cmpi ne, %2302, %2296 : i64
        scf.if %2303 {
          func.call @stack_push_pointer(%2302) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2304 = func.call @stack_pop_pointer() : () -> i64
          %2305 = func.call @cc_cons(%2295, %2304) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2305) : (i64) -> ()
          %2306 = func.call @stack_pop_pointer() : () -> i64
          %2307 = func.call @cc_cons(%2294, %2306) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2307) : (i64) -> ()
          %2308 = func.call @stack_pop_pointer() : () -> i64
          %2309 = func.call @cc_values_pack(%2308) : (i64) -> i64
          func.call @stack_push_pointer(%2309) : (i64) -> ()
        }
        %2310 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2310 : i64
      }
      func.call @stack_push_pointer(%2276) : (i64) -> ()
      %2311 = func.call @stack_pop_pointer() : () -> i64
      %2312 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2313 = func.call @cc_errorp(%2311) : (i64) -> i64
      %2314 = func.call @cc_nil_value() : () -> i64
      %2315 = arith.cmpi ne, %2313, %2314 : i64
      scf.if %2315 {
        %2316 = func.call @cc_condition_value(%2311) : (i64) -> i64
        %2317 = func.call @cc_values2(%2314, %2316) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2317) : (i64) -> ()
      } else {
        %2318 = func.call @cc_multiple_value_list(%2311) : (i64) -> i64
        %2319 = func.call @cc_values_pack(%2318) : (i64) -> i64
        func.call @stack_push_pointer(%2319) : (i64) -> ()
      }
      %2320 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2320 : i64
    }
    func.call @stack_push_pointer(%2270) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808586"() {
    %2525 = func.call @cc_nil_value() : () -> i64
    %2526 = func.call @cc_nil_value() : () -> i64
    %2527 = func.call @cc_errorp(%2525) : (i64) -> i64
    %2528 = arith.cmpi ne, %2527, %2526 : i64
    %2529 = scf.if %2528 -> (i64) {
      scf.yield %2525 : i64
    } else {
      %2530 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2531 = arith.constant 20 : i64
      %2532 = func.call @cc_make_string(%2530, %2531) : (!llvm.ptr, i64) -> i64
      %2533 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2534 = arith.constant 11 : i64
      %2535 = func.call @cc_make_string(%2533, %2534) : (!llvm.ptr, i64) -> i64
      %2536 = func.call @cc_intern(%2532, %2535) : (i64, i64) -> i64
      %2537 = func.call @cc_nil_value() : () -> i64
      %2538 = func.call @cc_cons(%2536, %2537) : (i64, i64) -> i64
      %2539 = func.call @cc_values_pack(%2538) : (i64) -> i64
      %2540 = func.call @cc_symbol_value(%2536) : (i64) -> i64
      func.call @stack_push_pointer(%2540) : (i64) -> ()
      %2541 = func.call @stack_pop_pointer() : () -> i64
      %2542 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2543 = arith.constant 20 : i64
      %2544 = func.call @cc_make_string(%2542, %2543) : (!llvm.ptr, i64) -> i64
      %2545 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2546 = arith.constant 11 : i64
      %2547 = func.call @cc_make_string(%2545, %2546) : (!llvm.ptr, i64) -> i64
      %2548 = func.call @cc_intern(%2544, %2547) : (i64, i64) -> i64
      %2549 = func.call @cc_nil_value() : () -> i64
      %2550 = func.call @cc_cons(%2548, %2549) : (i64, i64) -> i64
      %2551 = func.call @cc_values_pack(%2550) : (i64) -> i64
      %2552 = func.call @cc_symbol_value(%2548) : (i64) -> i64
      func.call @stack_push_pointer(%2552) : (i64) -> ()
      %2553 = func.call @stack_pop_pointer() : () -> i64
      %2555 = arith.constant 3 : i64
      %2554 = arith.andi %2541, %2555 : i64
      %2556 = arith.constant 0 : i64
      %2557 = arith.cmpi eq, %2554, %2556 : i64
      %2559 = arith.constant 3 : i64
      %2558 = arith.andi %2553, %2559 : i64
      %2560 = arith.constant 0 : i64
      %2561 = arith.cmpi eq, %2558, %2560 : i64
      %2562 = arith.andi %2557, %2561 : i1
      %2563 = scf.if %2562 -> (i64) {
        %2564 = arith.constant 2 : i64
        %2565 = arith.shrsi %2541, %2564 : i64
        %2566 = arith.constant 2 : i64
        %2567 = arith.shrsi %2553, %2566 : i64
        %2568 = arith.addi %2565, %2567 : i64
        %2569 = arith.constant -2305843009213693952 : i64
        %2570 = arith.constant 2305843009213693951 : i64
        %2571 = arith.cmpi sge, %2568, %2569 : i64
        %2572 = arith.cmpi sle, %2568, %2570 : i64
        %2573 = arith.andi %2571, %2572 : i1
        %2574 = scf.if %2573 -> (i64) {
          %2575 = arith.constant 2 : i64
          %2576 = arith.shli %2568, %2575 : i64
          scf.yield %2576 : i64
        } else {
          %2577 = func.call @cc_add(%2541, %2553) : (i64, i64) -> i64
          scf.yield %2577 : i64
        }
        scf.yield %2574 : i64
      } else {
        %2578 = func.call @cc_add(%2541, %2553) : (i64, i64) -> i64
        scf.yield %2578 : i64
      }
      func.call @stack_push_pointer(%2563) : (i64) -> ()
      %2579 = func.call @stack_pop_pointer() : () -> i64
      %2580 = func.call @cc_gensym(%2579) : (i64) -> i64
      func.call @stack_push_pointer(%2580) : (i64) -> ()
      %2581 = func.call @stack_pop_pointer() : () -> i64
      %2582 = func.call @cc_nil_value() : () -> i64
      %2583 = func.call @cc_cons(%2581, %2582) : (i64, i64) -> i64
      %2584 = func.call @cc_not(%2583) : (i64) -> i64
      func.call @stack_push_pointer(%2584) : (i64) -> ()
      %2585 = func.call @stack_pop_pointer() : () -> i64
      %2586 = func.call @cc_nil_value() : () -> i64
      %2587 = func.call @cc_cons(%2585, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_not(%2587) : (i64) -> i64
      func.call @stack_push_pointer(%2588) : (i64) -> ()
      %2589 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2589 : i64
    }
    func.call @stack_push_pointer(%2529) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808587"() {
    %2882 = func.call @cc_nil_value() : () -> i64
    %2883 = func.call @cc_nil_value() : () -> i64
    %2884 = func.call @cc_errorp(%2882) : (i64) -> i64
    %2885 = arith.cmpi ne, %2884, %2883 : i64
    %2886 = scf.if %2885 -> (i64) {
      scf.yield %2882 : i64
    } else {
      %2887 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2888 = arith.constant 50 : i64
      %2889 = func.call @cc_parse_bignum(%2887, %2888) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2889) : (i64) -> ()
      %2890 = func.call @stack_pop_pointer() : () -> i64
      %2891 = func.call @cc_nil_value() : () -> i64
      %2892 = func.call @cc_nil_value() : () -> i64
      %2893 = func.call @cc_errorp(%2891) : (i64) -> i64
      %2894 = arith.cmpi ne, %2893, %2892 : i64
      %2895 = scf.if %2894 -> (i64) {
        scf.yield %2891 : i64
      } else {
        func.call @stack_push_pointer(%2890) : (i64) -> ()
        %2896 = func.call @stack_pop_pointer() : () -> i64
        %2897 = arith.constant 1 : i64
        %2898 = func.call @cc_box_fixnum(%2897) : (i64) -> i64
        %2900 = arith.constant 3 : i64
        %2899 = arith.andi %2896, %2900 : i64
        %2901 = arith.constant 0 : i64
        %2902 = arith.cmpi eq, %2899, %2901 : i64
        %2904 = arith.constant 3 : i64
        %2903 = arith.andi %2898, %2904 : i64
        %2905 = arith.constant 0 : i64
        %2906 = arith.cmpi eq, %2903, %2905 : i64
        %2907 = arith.andi %2902, %2906 : i1
        %2908 = scf.if %2907 -> (i64) {
          %2909 = arith.constant 2 : i64
          %2910 = arith.shrsi %2896, %2909 : i64
          %2911 = arith.constant 2 : i64
          %2912 = arith.shrsi %2898, %2911 : i64
          %2913 = arith.addi %2910, %2912 : i64
          %2914 = arith.constant -2305843009213693952 : i64
          %2915 = arith.constant 2305843009213693951 : i64
          %2916 = arith.cmpi sge, %2913, %2914 : i64
          %2917 = arith.cmpi sle, %2913, %2915 : i64
          %2918 = arith.andi %2916, %2917 : i1
          %2919 = scf.if %2918 -> (i64) {
            %2920 = arith.constant 2 : i64
            %2921 = arith.shli %2913, %2920 : i64
            scf.yield %2921 : i64
          } else {
            %2922 = func.call @cc_add(%2896, %2898) : (i64, i64) -> i64
            scf.yield %2922 : i64
          }
          scf.yield %2919 : i64
        } else {
          %2923 = func.call @cc_add(%2896, %2898) : (i64, i64) -> i64
          scf.yield %2923 : i64
        }
        func.call @stack_push_pointer(%2908) : (i64) -> ()
        %2924 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2890) : (i64) -> ()
        %2925 = func.call @stack_pop_pointer() : () -> i64
        %2926 = llvm.mlir.addressof @str229 : !llvm.ptr
        %2927 = arith.constant 28 : i64
        %2928 = func.call @cc_make_symbol(%2926, %2927) : (!llvm.ptr, i64) -> i64
        %2929 = func.call @cc_symbol_value(%2928) : (i64) -> i64
        %2930 = func.call @cc_set_symbol_value(%2928, %2925) : (i64, i64) -> i64
        %2931 = func.call @cc_nil_value() : () -> i64
        %2932 = func.call @cc_nil_value() : () -> i64
        %2933 = func.call @cc_errorp(%2931) : (i64) -> i64
        %2934 = arith.cmpi ne, %2933, %2932 : i64
        %2935 = scf.if %2934 -> (i64) {
          scf.yield %2931 : i64
        } else {
          %2936 = func.call @cc_nil_value() : () -> i64
          %2937 = func.call @cc_gensym(%2936) : (i64) -> i64
          func.call @stack_push_pointer(%2937) : (i64) -> ()
          %2938 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2938 : i64
        }
        %2939 = func.call @cc_nil_value() : () -> i64
        %2940 = func.call @cc_errorp(%2935) : (i64) -> i64
        %2941 = arith.cmpi ne, %2940, %2939 : i64
        %2942 = scf.if %2941 -> (i64) {
          scf.yield %2935 : i64
        } else {
          %2943 = llvm.mlir.addressof @str230 : !llvm.ptr
          %2944 = arith.constant 16 : i64
          %2945 = func.call @cc_make_string(%2943, %2944) : (!llvm.ptr, i64) -> i64
          %2946 = llvm.mlir.addressof @str231 : !llvm.ptr
          %2947 = arith.constant 11 : i64
          %2948 = func.call @cc_make_string(%2946, %2947) : (!llvm.ptr, i64) -> i64
          %2949 = func.call @cc_intern(%2945, %2948) : (i64, i64) -> i64
          %2950 = func.call @cc_nil_value() : () -> i64
          %2951 = func.call @cc_cons(%2949, %2950) : (i64, i64) -> i64
          %2952 = func.call @cc_values_pack(%2951) : (i64) -> i64
          %2953 = func.call @cc_symbol_value(%2949) : (i64) -> i64
          func.call @stack_push_pointer(%2953) : (i64) -> ()
          %2954 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2954 : i64
        }
        func.call @stack_push_pointer(%2942) : (i64) -> ()
        %2955 = func.call @cc_restore_symbol_value(%2928, %2929) : (i64, i64) -> i64
        %2956 = func.call @stack_pop_pointer() : () -> i64
        %2957 = arith.constant 1 : i1
        %2959 = arith.constant 3 : i64
        %2958 = arith.andi %2924, %2959 : i64
        %2960 = arith.constant 0 : i64
        %2961 = arith.cmpi eq, %2958, %2960 : i64
        %2963 = arith.constant 3 : i64
        %2962 = arith.andi %2956, %2963 : i64
        %2964 = arith.constant 0 : i64
        %2965 = arith.cmpi eq, %2962, %2964 : i64
        %2966 = arith.andi %2961, %2965 : i1
        %2967 = scf.if %2966 -> (i1) {
          %2968 = arith.constant 2 : i64
          %2969 = arith.shrsi %2924, %2968 : i64
          %2970 = arith.constant 2 : i64
          %2971 = arith.shrsi %2956, %2970 : i64
          %2972 = arith.cmpi eq, %2969, %2971 : i64
          scf.yield %2972 : i1
        } else {
          %2973 = func.call @cc_eq(%2924, %2956) : (i64, i64) -> i64
          %2974 = func.call @cc_nil_value() : () -> i64
          %2975 = arith.cmpi ne, %2973, %2974 : i64
          scf.yield %2975 : i1
        }
        %2976 = arith.andi %2957, %2967 : i1
        %2977 = func.call @cc_nil_value() : () -> i64
        %2978 = func.call @cc_t_value() : () -> i64
        %2979 = scf.if %2976 -> (i64) {
          scf.yield %2978 : i64
        } else {
          scf.yield %2977 : i64
        }
        func.call @stack_push_pointer(%2979) : (i64) -> ()
        %2980 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2980 : i64
      }
      func.call @stack_push_pointer(%2895) : (i64) -> ()
      %2981 = func.call @stack_pop_pointer() : () -> i64
      %2982 = func.call @cc_nil_value() : () -> i64
      %2983 = func.call @cc_cons(%2981, %2982) : (i64, i64) -> i64
      %2984 = func.call @cc_not(%2983) : (i64) -> i64
      func.call @stack_push_pointer(%2984) : (i64) -> ()
      %2985 = func.call @stack_pop_pointer() : () -> i64
      %2986 = func.call @cc_nil_value() : () -> i64
      %2987 = func.call @cc_cons(%2985, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_not(%2987) : (i64) -> i64
      func.call @stack_push_pointer(%2988) : (i64) -> ()
      %2989 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2989 : i64
    }
    func.call @stack_push_pointer(%2886) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808588"() {
    %3243 = func.call @cc_nil_value() : () -> i64
    %3244 = func.call @cc_nil_value() : () -> i64
    %3245 = func.call @cc_errorp(%3243) : (i64) -> i64
    %3246 = arith.cmpi ne, %3245, %3244 : i64
    %3247 = scf.if %3246 -> (i64) {
      scf.yield %3243 : i64
    } else {
      %3248 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3249 = arith.constant 20 : i64
      %3250 = func.call @cc_make_string(%3248, %3249) : (!llvm.ptr, i64) -> i64
      %3251 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3252 = arith.constant 11 : i64
      %3253 = func.call @cc_make_string(%3251, %3252) : (!llvm.ptr, i64) -> i64
      %3254 = func.call @cc_intern(%3250, %3253) : (i64, i64) -> i64
      %3255 = func.call @cc_nil_value() : () -> i64
      %3256 = func.call @cc_cons(%3254, %3255) : (i64, i64) -> i64
      %3257 = func.call @cc_values_pack(%3256) : (i64) -> i64
      %3258 = func.call @cc_symbol_value(%3254) : (i64) -> i64
      func.call @stack_push_pointer(%3258) : (i64) -> ()
      %3259 = func.call @stack_pop_pointer() : () -> i64
      %3260 = arith.constant 1 : i64
      %3261 = func.call @cc_box_fixnum(%3260) : (i64) -> i64
      %3263 = arith.constant 3 : i64
      %3262 = arith.andi %3259, %3263 : i64
      %3264 = arith.constant 0 : i64
      %3265 = arith.cmpi eq, %3262, %3264 : i64
      %3267 = arith.constant 3 : i64
      %3266 = arith.andi %3261, %3267 : i64
      %3268 = arith.constant 0 : i64
      %3269 = arith.cmpi eq, %3266, %3268 : i64
      %3270 = arith.andi %3265, %3269 : i1
      %3271 = scf.if %3270 -> (i64) {
        %3272 = arith.constant 2 : i64
        %3273 = arith.shrsi %3259, %3272 : i64
        %3274 = arith.constant 2 : i64
        %3275 = arith.shrsi %3261, %3274 : i64
        %3276 = arith.addi %3273, %3275 : i64
        %3277 = arith.constant -2305843009213693952 : i64
        %3278 = arith.constant 2305843009213693951 : i64
        %3279 = arith.cmpi sge, %3276, %3277 : i64
        %3280 = arith.cmpi sle, %3276, %3278 : i64
        %3281 = arith.andi %3279, %3280 : i1
        %3282 = scf.if %3281 -> (i64) {
          %3283 = arith.constant 2 : i64
          %3284 = arith.shli %3276, %3283 : i64
          scf.yield %3284 : i64
        } else {
          %3285 = func.call @cc_add(%3259, %3261) : (i64, i64) -> i64
          scf.yield %3285 : i64
        }
        scf.yield %3282 : i64
      } else {
        %3286 = func.call @cc_add(%3259, %3261) : (i64, i64) -> i64
        scf.yield %3286 : i64
      }
      func.call @stack_push_pointer(%3271) : (i64) -> ()
      %3287 = func.call @stack_pop_pointer() : () -> i64
      %3288 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3289 = arith.constant 20 : i64
      %3290 = func.call @cc_make_string(%3288, %3289) : (!llvm.ptr, i64) -> i64
      %3291 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3292 = arith.constant 11 : i64
      %3293 = func.call @cc_make_string(%3291, %3292) : (!llvm.ptr, i64) -> i64
      %3294 = func.call @cc_intern(%3290, %3293) : (i64, i64) -> i64
      %3295 = func.call @cc_nil_value() : () -> i64
      %3296 = func.call @cc_cons(%3294, %3295) : (i64, i64) -> i64
      %3297 = func.call @cc_values_pack(%3296) : (i64) -> i64
      %3298 = func.call @cc_symbol_value(%3294) : (i64) -> i64
      func.call @stack_push_pointer(%3298) : (i64) -> ()
      %3299 = func.call @stack_pop_pointer() : () -> i64
      %3300 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3301 = arith.constant 28 : i64
      %3302 = func.call @cc_make_symbol(%3300, %3301) : (!llvm.ptr, i64) -> i64
      %3303 = func.call @cc_symbol_value(%3302) : (i64) -> i64
      %3304 = func.call @cc_set_symbol_value(%3302, %3299) : (i64, i64) -> i64
      %3305 = func.call @cc_nil_value() : () -> i64
      %3306 = func.call @cc_nil_value() : () -> i64
      %3307 = func.call @cc_errorp(%3305) : (i64) -> i64
      %3308 = arith.cmpi ne, %3307, %3306 : i64
      %3309 = scf.if %3308 -> (i64) {
        scf.yield %3305 : i64
      } else {
        %3310 = func.call @cc_nil_value() : () -> i64
        %3311 = func.call @cc_gensym(%3310) : (i64) -> i64
        func.call @stack_push_pointer(%3311) : (i64) -> ()
        %3312 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3312 : i64
      }
      %3313 = func.call @cc_nil_value() : () -> i64
      %3314 = func.call @cc_errorp(%3309) : (i64) -> i64
      %3315 = arith.cmpi ne, %3314, %3313 : i64
      %3316 = scf.if %3315 -> (i64) {
        scf.yield %3309 : i64
      } else {
        %3317 = llvm.mlir.addressof @str262 : !llvm.ptr
        %3318 = arith.constant 16 : i64
        %3319 = func.call @cc_make_string(%3317, %3318) : (!llvm.ptr, i64) -> i64
        %3320 = llvm.mlir.addressof @str263 : !llvm.ptr
        %3321 = arith.constant 11 : i64
        %3322 = func.call @cc_make_string(%3320, %3321) : (!llvm.ptr, i64) -> i64
        %3323 = func.call @cc_intern(%3319, %3322) : (i64, i64) -> i64
        %3324 = func.call @cc_nil_value() : () -> i64
        %3325 = func.call @cc_cons(%3323, %3324) : (i64, i64) -> i64
        %3326 = func.call @cc_values_pack(%3325) : (i64) -> i64
        %3327 = func.call @cc_symbol_value(%3323) : (i64) -> i64
        func.call @stack_push_pointer(%3327) : (i64) -> ()
        %3328 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3328 : i64
      }
      func.call @stack_push_pointer(%3316) : (i64) -> ()
      %3329 = func.call @cc_restore_symbol_value(%3302, %3303) : (i64, i64) -> i64
      %3330 = func.call @stack_pop_pointer() : () -> i64
      %3331 = arith.constant 1 : i1
      %3333 = arith.constant 3 : i64
      %3332 = arith.andi %3287, %3333 : i64
      %3334 = arith.constant 0 : i64
      %3335 = arith.cmpi eq, %3332, %3334 : i64
      %3337 = arith.constant 3 : i64
      %3336 = arith.andi %3330, %3337 : i64
      %3338 = arith.constant 0 : i64
      %3339 = arith.cmpi eq, %3336, %3338 : i64
      %3340 = arith.andi %3335, %3339 : i1
      %3341 = scf.if %3340 -> (i1) {
        %3342 = arith.constant 2 : i64
        %3343 = arith.shrsi %3287, %3342 : i64
        %3344 = arith.constant 2 : i64
        %3345 = arith.shrsi %3330, %3344 : i64
        %3346 = arith.cmpi eq, %3343, %3345 : i64
        scf.yield %3346 : i1
      } else {
        %3347 = func.call @cc_eq(%3287, %3330) : (i64, i64) -> i64
        %3348 = func.call @cc_nil_value() : () -> i64
        %3349 = arith.cmpi ne, %3347, %3348 : i64
        scf.yield %3349 : i1
      }
      %3350 = arith.andi %3331, %3341 : i1
      %3351 = func.call @cc_nil_value() : () -> i64
      %3352 = func.call @cc_t_value() : () -> i64
      %3353 = scf.if %3350 -> (i64) {
        scf.yield %3352 : i64
      } else {
        scf.yield %3351 : i64
      }
      func.call @stack_push_pointer(%3353) : (i64) -> ()
      %3354 = func.call @stack_pop_pointer() : () -> i64
      %3355 = func.call @cc_nil_value() : () -> i64
      %3356 = func.call @cc_cons(%3354, %3355) : (i64, i64) -> i64
      %3357 = func.call @cc_not(%3356) : (i64) -> i64
      func.call @stack_push_pointer(%3357) : (i64) -> ()
      %3358 = func.call @stack_pop_pointer() : () -> i64
      %3359 = func.call @cc_nil_value() : () -> i64
      %3360 = func.call @cc_cons(%3358, %3359) : (i64, i64) -> i64
      %3361 = func.call @cc_not(%3360) : (i64) -> i64
      func.call @stack_push_pointer(%3361) : (i64) -> ()
      %3362 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3362 : i64
    }
    func.call @stack_push_pointer(%3247) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808589"() {
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
        %3579 = arith.constant -1 : i64
        func.call @stack_push_fixnum(%3579) : (i64) -> ()
        %3580 = func.call @stack_pop_pointer() : () -> i64
        %3581 = llvm.mlir.addressof @str281 : !llvm.ptr
        %3582 = arith.constant 28 : i64
        %3583 = func.call @cc_make_symbol(%3581, %3582) : (!llvm.ptr, i64) -> i64
        %3584 = func.call @cc_symbol_value(%3583) : (i64) -> i64
        %3585 = func.call @cc_set_symbol_value(%3583, %3580) : (i64, i64) -> i64
        %3586 = func.call @cc_nil_value() : () -> i64
        %3587 = func.call @cc_nil_value() : () -> i64
        %3588 = func.call @cc_errorp(%3586) : (i64) -> i64
        %3589 = arith.cmpi ne, %3588, %3587 : i64
        %3590 = scf.if %3589 -> (i64) {
          scf.yield %3586 : i64
        } else {
          %3591 = func.call @cc_nil_value() : () -> i64
          %3592 = func.call @cc_gensym(%3591) : (i64) -> i64
          func.call @stack_push_pointer(%3592) : (i64) -> ()
          %3593 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3593 : i64
        }
        func.call @stack_push_pointer(%3590) : (i64) -> ()
        %3594 = func.call @cc_restore_symbol_value(%3583, %3584) : (i64, i64) -> i64
        %3595 = func.call @stack_pop_pointer() : () -> i64
        %3596 = func.call @cc_errorp(%3595) : (i64) -> i64
        %3597 = func.call @cc_nil_value() : () -> i64
        %3598 = arith.cmpi ne, %3596, %3597 : i64
        scf.if %3598 {
          func.call @stack_push_pointer(%3595) : (i64) -> ()
        } else {
          %3599 = func.call @cc_multiple_value_list(%3595) : (i64) -> i64
          func.call @stack_push_pointer(%3599) : (i64) -> ()
        }
        %3600 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3601 = func.call @stack_pop_pointer() : () -> i64
        %3602 = func.call @cc_nil_value() : () -> i64
        %3603 = func.call @cc_maybe_error_from_multiple_value_list(%3600) : (i64) -> i64
        %3604 = func.call @cc_errorp(%3603) : (i64) -> i64
        %3605 = arith.cmpi ne, %3604, %3602 : i64
        %3606 = arith.cmpi eq, %3602, %3602 : i64
        %3607 = arith.andi %3605, %3606 : i1
        %3608 = scf.if %3607 -> (i64) {
          scf.yield %3603 : i64
        } else {
          scf.yield %3602 : i64
        }
        %3609 = arith.cmpi ne, %3608, %3602 : i64
        scf.if %3609 {
          func.call @stack_push_pointer(%3608) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3610 = func.call @stack_pop_pointer() : () -> i64
          %3611 = func.call @cc_cons(%3601, %3610) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3611) : (i64) -> ()
          %3612 = func.call @stack_pop_pointer() : () -> i64
          %3613 = func.call @cc_cons(%3600, %3612) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3613) : (i64) -> ()
          %3614 = func.call @stack_pop_pointer() : () -> i64
          %3615 = func.call @cc_values_pack(%3614) : (i64) -> i64
          func.call @stack_push_pointer(%3615) : (i64) -> ()
        }
        %3616 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3616 : i64
      }
      func.call @stack_push_pointer(%3578) : (i64) -> ()
      %3617 = func.call @stack_pop_pointer() : () -> i64
      %3618 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3619 = func.call @cc_errorp(%3617) : (i64) -> i64
      %3620 = func.call @cc_nil_value() : () -> i64
      %3621 = arith.cmpi ne, %3619, %3620 : i64
      scf.if %3621 {
        %3622 = func.call @cc_condition_value(%3617) : (i64) -> i64
        %3623 = func.call @cc_values2(%3620, %3622) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3623) : (i64) -> ()
      } else {
        %3624 = func.call @cc_multiple_value_list(%3617) : (i64) -> i64
        %3625 = func.call @cc_values_pack(%3624) : (i64) -> i64
        func.call @stack_push_pointer(%3625) : (i64) -> ()
      }
      %3626 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3626 : i64
    }
    func.call @stack_push_pointer(%3572) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808590"() {
    %3870 = func.call @cc_nil_value() : () -> i64
    %3871 = func.call @cc_nil_value() : () -> i64
    %3872 = func.call @cc_errorp(%3870) : (i64) -> i64
    %3873 = arith.cmpi ne, %3872, %3871 : i64
    %3874 = scf.if %3873 -> (i64) {
      scf.yield %3870 : i64
    } else {
      %3875 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3876 = func.call @cc_nil_value() : () -> i64
      %3877 = func.call @cc_nil_value() : () -> i64
      %3878 = func.call @cc_errorp(%3876) : (i64) -> i64
      %3879 = arith.cmpi ne, %3878, %3877 : i64
      %3880 = scf.if %3879 -> (i64) {
        scf.yield %3876 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3881 = llvm.mlir.addressof @str305 : !llvm.ptr
        %3882 = arith.constant 20 : i64
        %3883 = func.call @cc_make_string(%3881, %3882) : (!llvm.ptr, i64) -> i64
        %3884 = llvm.mlir.addressof @str306 : !llvm.ptr
        %3885 = arith.constant 11 : i64
        %3886 = func.call @cc_make_string(%3884, %3885) : (!llvm.ptr, i64) -> i64
        %3887 = func.call @cc_intern(%3883, %3886) : (i64, i64) -> i64
        %3888 = func.call @cc_nil_value() : () -> i64
        %3889 = func.call @cc_cons(%3887, %3888) : (i64, i64) -> i64
        %3890 = func.call @cc_values_pack(%3889) : (i64) -> i64
        %3891 = func.call @cc_symbol_value(%3887) : (i64) -> i64
        func.call @stack_push_pointer(%3891) : (i64) -> ()
        %3892 = func.call @stack_pop_pointer() : () -> i64
        %3893 = arith.constant 1 : i64
        %3894 = func.call @cc_box_fixnum(%3893) : (i64) -> i64
        %3896 = arith.constant 3 : i64
        %3895 = arith.andi %3892, %3896 : i64
        %3897 = arith.constant 0 : i64
        %3898 = arith.cmpi eq, %3895, %3897 : i64
        %3900 = arith.constant 3 : i64
        %3899 = arith.andi %3894, %3900 : i64
        %3901 = arith.constant 0 : i64
        %3902 = arith.cmpi eq, %3899, %3901 : i64
        %3903 = arith.andi %3898, %3902 : i1
        %3904 = scf.if %3903 -> (i64) {
          %3905 = arith.constant 2 : i64
          %3906 = arith.shrsi %3892, %3905 : i64
          %3907 = arith.constant 2 : i64
          %3908 = arith.shrsi %3894, %3907 : i64
          %3909 = arith.subi %3906, %3908 : i64
          %3910 = arith.constant -2305843009213693952 : i64
          %3911 = arith.constant 2305843009213693951 : i64
          %3912 = arith.cmpi sge, %3909, %3910 : i64
          %3913 = arith.cmpi sle, %3909, %3911 : i64
          %3914 = arith.andi %3912, %3913 : i1
          %3915 = scf.if %3914 -> (i64) {
            %3916 = arith.constant 2 : i64
            %3917 = arith.shli %3909, %3916 : i64
            scf.yield %3917 : i64
          } else {
            %3918 = func.call @cc_sub(%3892, %3894) : (i64, i64) -> i64
            scf.yield %3918 : i64
          }
          scf.yield %3915 : i64
        } else {
          %3919 = func.call @cc_sub(%3892, %3894) : (i64, i64) -> i64
          scf.yield %3919 : i64
        }
        func.call @stack_push_pointer(%3904) : (i64) -> ()
        %3920 = func.call @stack_pop_pointer() : () -> i64
        %3921 = llvm.mlir.addressof @str307 : !llvm.ptr
        %3922 = arith.constant 28 : i64
        %3923 = func.call @cc_make_symbol(%3921, %3922) : (!llvm.ptr, i64) -> i64
        %3924 = func.call @cc_symbol_value(%3923) : (i64) -> i64
        %3925 = func.call @cc_set_symbol_value(%3923, %3920) : (i64, i64) -> i64
        %3926 = func.call @cc_nil_value() : () -> i64
        %3927 = func.call @cc_nil_value() : () -> i64
        %3928 = func.call @cc_errorp(%3926) : (i64) -> i64
        %3929 = arith.cmpi ne, %3928, %3927 : i64
        %3930 = scf.if %3929 -> (i64) {
          scf.yield %3926 : i64
        } else {
          %3931 = func.call @cc_nil_value() : () -> i64
          %3932 = func.call @cc_gensym(%3931) : (i64) -> i64
          func.call @stack_push_pointer(%3932) : (i64) -> ()
          %3933 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3933 : i64
        }
        func.call @stack_push_pointer(%3930) : (i64) -> ()
        %3934 = func.call @cc_restore_symbol_value(%3923, %3924) : (i64, i64) -> i64
        %3935 = func.call @stack_pop_pointer() : () -> i64
        %3936 = func.call @cc_errorp(%3935) : (i64) -> i64
        %3937 = func.call @cc_nil_value() : () -> i64
        %3938 = arith.cmpi ne, %3936, %3937 : i64
        scf.if %3938 {
          func.call @stack_push_pointer(%3935) : (i64) -> ()
        } else {
          %3939 = func.call @cc_multiple_value_list(%3935) : (i64) -> i64
          func.call @stack_push_pointer(%3939) : (i64) -> ()
        }
        %3940 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3941 = func.call @stack_pop_pointer() : () -> i64
        %3942 = func.call @cc_nil_value() : () -> i64
        %3943 = func.call @cc_maybe_error_from_multiple_value_list(%3940) : (i64) -> i64
        %3944 = func.call @cc_errorp(%3943) : (i64) -> i64
        %3945 = arith.cmpi ne, %3944, %3942 : i64
        %3946 = arith.cmpi eq, %3942, %3942 : i64
        %3947 = arith.andi %3945, %3946 : i1
        %3948 = scf.if %3947 -> (i64) {
          scf.yield %3943 : i64
        } else {
          scf.yield %3942 : i64
        }
        %3949 = arith.cmpi ne, %3948, %3942 : i64
        scf.if %3949 {
          func.call @stack_push_pointer(%3948) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3950 = func.call @stack_pop_pointer() : () -> i64
          %3951 = func.call @cc_cons(%3941, %3950) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3951) : (i64) -> ()
          %3952 = func.call @stack_pop_pointer() : () -> i64
          %3953 = func.call @cc_cons(%3940, %3952) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3953) : (i64) -> ()
          %3954 = func.call @stack_pop_pointer() : () -> i64
          %3955 = func.call @cc_values_pack(%3954) : (i64) -> i64
          func.call @stack_push_pointer(%3955) : (i64) -> ()
        }
        %3956 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3956 : i64
      }
      func.call @stack_push_pointer(%3880) : (i64) -> ()
      %3957 = func.call @stack_pop_pointer() : () -> i64
      %3958 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3959 = func.call @cc_errorp(%3957) : (i64) -> i64
      %3960 = func.call @cc_nil_value() : () -> i64
      %3961 = arith.cmpi ne, %3959, %3960 : i64
      scf.if %3961 {
        %3962 = func.call @cc_condition_value(%3957) : (i64) -> i64
        %3963 = func.call @cc_values2(%3960, %3962) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3963) : (i64) -> ()
      } else {
        %3964 = func.call @cc_multiple_value_list(%3957) : (i64) -> i64
        %3965 = func.call @cc_values_pack(%3964) : (i64) -> i64
        func.call @stack_push_pointer(%3965) : (i64) -> ()
      }
      %3966 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3966 : i64
    }
    func.call @stack_push_pointer(%3874) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808591"() {
    %4207 = func.call @cc_nil_value() : () -> i64
    %4208 = func.call @cc_nil_value() : () -> i64
    %4209 = func.call @cc_errorp(%4207) : (i64) -> i64
    %4210 = arith.cmpi ne, %4209, %4208 : i64
    %4211 = scf.if %4210 -> (i64) {
      scf.yield %4207 : i64
    } else {
      %4212 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4213 = func.call @cc_nil_value() : () -> i64
      %4214 = func.call @cc_nil_value() : () -> i64
      %4215 = func.call @cc_errorp(%4213) : (i64) -> i64
      %4216 = arith.cmpi ne, %4215, %4214 : i64
      %4217 = scf.if %4216 -> (i64) {
        scf.yield %4213 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4218 = llvm.mlir.addressof @str330 : !llvm.ptr
        %4219 = arith.constant 5 : i64
        %4220 = func.call @cc_make_string(%4218, %4219) : (!llvm.ptr, i64) -> i64
        %4221 = llvm.mlir.addressof @str331 : !llvm.ptr
        %4222 = arith.constant 11 : i64
        %4223 = func.call @cc_make_string(%4221, %4222) : (!llvm.ptr, i64) -> i64
        %4224 = func.call @cc_intern(%4220, %4223) : (i64, i64) -> i64
        %4225 = func.call @cc_nil_value() : () -> i64
        %4226 = func.call @cc_cons(%4224, %4225) : (i64, i64) -> i64
        %4227 = func.call @cc_values_pack(%4226) : (i64) -> i64
        func.call @stack_push_pointer(%4224) : (i64) -> ()
        %4228 = func.call @stack_pop_pointer() : () -> i64
        %4229 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4230 = arith.constant 28 : i64
        %4231 = func.call @cc_make_symbol(%4229, %4230) : (!llvm.ptr, i64) -> i64
        %4232 = func.call @cc_symbol_value(%4231) : (i64) -> i64
        %4233 = func.call @cc_set_symbol_value(%4231, %4228) : (i64, i64) -> i64
        %4234 = func.call @cc_nil_value() : () -> i64
        %4235 = func.call @cc_nil_value() : () -> i64
        %4236 = func.call @cc_errorp(%4234) : (i64) -> i64
        %4237 = arith.cmpi ne, %4236, %4235 : i64
        %4238 = scf.if %4237 -> (i64) {
          scf.yield %4234 : i64
        } else {
          %4239 = func.call @cc_nil_value() : () -> i64
          %4240 = func.call @cc_gensym(%4239) : (i64) -> i64
          func.call @stack_push_pointer(%4240) : (i64) -> ()
          %4241 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4241 : i64
        }
        func.call @stack_push_pointer(%4238) : (i64) -> ()
        %4242 = func.call @cc_restore_symbol_value(%4231, %4232) : (i64, i64) -> i64
        %4243 = func.call @stack_pop_pointer() : () -> i64
        %4244 = func.call @cc_errorp(%4243) : (i64) -> i64
        %4245 = func.call @cc_nil_value() : () -> i64
        %4246 = arith.cmpi ne, %4244, %4245 : i64
        scf.if %4246 {
          func.call @stack_push_pointer(%4243) : (i64) -> ()
        } else {
          %4247 = func.call @cc_multiple_value_list(%4243) : (i64) -> i64
          func.call @stack_push_pointer(%4247) : (i64) -> ()
        }
        %4248 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4249 = func.call @stack_pop_pointer() : () -> i64
        %4250 = func.call @cc_nil_value() : () -> i64
        %4251 = func.call @cc_maybe_error_from_multiple_value_list(%4248) : (i64) -> i64
        %4252 = func.call @cc_errorp(%4251) : (i64) -> i64
        %4253 = arith.cmpi ne, %4252, %4250 : i64
        %4254 = arith.cmpi eq, %4250, %4250 : i64
        %4255 = arith.andi %4253, %4254 : i1
        %4256 = scf.if %4255 -> (i64) {
          scf.yield %4251 : i64
        } else {
          scf.yield %4250 : i64
        }
        %4257 = arith.cmpi ne, %4256, %4250 : i64
        scf.if %4257 {
          func.call @stack_push_pointer(%4256) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4258 = func.call @stack_pop_pointer() : () -> i64
          %4259 = func.call @cc_cons(%4249, %4258) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4259) : (i64) -> ()
          %4260 = func.call @stack_pop_pointer() : () -> i64
          %4261 = func.call @cc_cons(%4248, %4260) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4261) : (i64) -> ()
          %4262 = func.call @stack_pop_pointer() : () -> i64
          %4263 = func.call @cc_values_pack(%4262) : (i64) -> i64
          func.call @stack_push_pointer(%4263) : (i64) -> ()
        }
        %4264 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4264 : i64
      }
      func.call @stack_push_pointer(%4217) : (i64) -> ()
      %4265 = func.call @stack_pop_pointer() : () -> i64
      %4266 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4267 = func.call @cc_errorp(%4265) : (i64) -> i64
      %4268 = func.call @cc_nil_value() : () -> i64
      %4269 = arith.cmpi ne, %4267, %4268 : i64
      scf.if %4269 {
        %4270 = func.call @cc_condition_value(%4265) : (i64) -> i64
        %4271 = func.call @cc_values2(%4268, %4270) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4271) : (i64) -> ()
      } else {
        %4272 = func.call @cc_multiple_value_list(%4265) : (i64) -> i64
        %4273 = func.call @cc_values_pack(%4272) : (i64) -> i64
        func.call @stack_push_pointer(%4273) : (i64) -> ()
      }
      %4274 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4274 : i64
    }
    func.call @stack_push_pointer(%4211) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808592"() {
    %4459 = func.call @cc_nil_value() : () -> i64
    %4460 = func.call @cc_nil_value() : () -> i64
    %4461 = func.call @cc_errorp(%4459) : (i64) -> i64
    %4462 = arith.cmpi ne, %4461, %4460 : i64
    %4463 = scf.if %4462 -> (i64) {
      scf.yield %4459 : i64
    } else {
      %4464 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4465 = func.call @cc_nil_value() : () -> i64
      %4466 = func.call @cc_nil_value() : () -> i64
      %4467 = func.call @cc_errorp(%4465) : (i64) -> i64
      %4468 = arith.cmpi ne, %4467, %4466 : i64
      %4469 = scf.if %4468 -> (i64) {
        scf.yield %4465 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %4470 = func.call @stack_pop_pointer() : () -> i64
        %4471 = func.call @cc_nil_value() : () -> i64
        %4472 = func.call @cc_gentemp(%4470, %4471) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4472) : (i64) -> ()
        %4473 = func.call @stack_pop_pointer() : () -> i64
        %4474 = func.call @cc_errorp(%4473) : (i64) -> i64
        %4475 = func.call @cc_nil_value() : () -> i64
        %4476 = arith.cmpi ne, %4474, %4475 : i64
        scf.if %4476 {
          func.call @stack_push_pointer(%4473) : (i64) -> ()
        } else {
          %4477 = func.call @cc_multiple_value_list(%4473) : (i64) -> i64
          func.call @stack_push_pointer(%4477) : (i64) -> ()
        }
        %4478 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4479 = func.call @stack_pop_pointer() : () -> i64
        %4480 = func.call @cc_nil_value() : () -> i64
        %4481 = func.call @cc_maybe_error_from_multiple_value_list(%4478) : (i64) -> i64
        %4482 = func.call @cc_errorp(%4481) : (i64) -> i64
        %4483 = arith.cmpi ne, %4482, %4480 : i64
        %4484 = arith.cmpi eq, %4480, %4480 : i64
        %4485 = arith.andi %4483, %4484 : i1
        %4486 = scf.if %4485 -> (i64) {
          scf.yield %4481 : i64
        } else {
          scf.yield %4480 : i64
        }
        %4487 = arith.cmpi ne, %4486, %4480 : i64
        scf.if %4487 {
          func.call @stack_push_pointer(%4486) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4488 = func.call @stack_pop_pointer() : () -> i64
          %4489 = func.call @cc_cons(%4479, %4488) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4489) : (i64) -> ()
          %4490 = func.call @stack_pop_pointer() : () -> i64
          %4491 = func.call @cc_cons(%4478, %4490) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4491) : (i64) -> ()
          %4492 = func.call @stack_pop_pointer() : () -> i64
          %4493 = func.call @cc_values_pack(%4492) : (i64) -> i64
          func.call @stack_push_pointer(%4493) : (i64) -> ()
        }
        %4494 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4494 : i64
      }
      func.call @stack_push_pointer(%4469) : (i64) -> ()
      %4495 = func.call @stack_pop_pointer() : () -> i64
      %4496 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4497 = func.call @cc_errorp(%4495) : (i64) -> i64
      %4498 = func.call @cc_nil_value() : () -> i64
      %4499 = arith.cmpi ne, %4497, %4498 : i64
      scf.if %4499 {
        %4500 = func.call @cc_condition_value(%4495) : (i64) -> i64
        %4501 = func.call @cc_values2(%4498, %4500) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4501) : (i64) -> ()
      } else {
        %4502 = func.call @cc_multiple_value_list(%4495) : (i64) -> i64
        %4503 = func.call @cc_values_pack(%4502) : (i64) -> i64
        func.call @stack_push_pointer(%4503) : (i64) -> ()
      }
      %4504 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4504 : i64
    }
    func.call @stack_push_pointer(%4463) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808593"() {
    %4710 = func.call @cc_nil_value() : () -> i64
    %4711 = func.call @cc_nil_value() : () -> i64
    %4712 = func.call @cc_errorp(%4710) : (i64) -> i64
    %4713 = arith.cmpi ne, %4712, %4711 : i64
    %4714 = scf.if %4713 -> (i64) {
      scf.yield %4710 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %4715 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4715) : (i64) -> ()
      %4716 = func.call @stack_pop_pointer() : () -> i64
      %4717 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4717) : (i64) -> ()
      %4718 = func.call @stack_pop_pointer() : () -> i64
      %4719 = func.call @cc_nil_value() : () -> i64
      %4720 = func.call @cc_errorp(%4716) : (i64) -> i64
      %4721 = arith.cmpi ne, %4720, %4719 : i64
      %4722 = arith.cmpi eq, %4719, %4719 : i64
      %4723 = arith.andi %4721, %4722 : i1
      %4724 = scf.if %4723 -> (i64) {
        scf.yield %4716 : i64
      } else {
        scf.yield %4719 : i64
      }
      %4725 = func.call @cc_errorp(%4718) : (i64) -> i64
      %4726 = arith.cmpi ne, %4725, %4719 : i64
      %4727 = arith.cmpi eq, %4724, %4719 : i64
      %4728 = arith.andi %4726, %4727 : i1
      %4729 = scf.if %4728 -> (i64) {
        scf.yield %4718 : i64
      } else {
        scf.yield %4724 : i64
      }
      %4730 = arith.cmpi ne, %4729, %4719 : i64
      scf.if %4730 {
        func.call @stack_push_pointer(%4729) : (i64) -> ()
      } else {
        %4731 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4731) : (i64) -> ()
        func.call @stack_push_pointer(%4718) : (i64) -> ()
        %4732 = func.call @stack_pop_pointer() : () -> i64
        %4733 = func.call @stack_pop_pointer() : () -> i64
        %4734 = func.call @cc_cons(%4732, %4733) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4734) : (i64) -> ()
        func.call @stack_push_pointer(%4716) : (i64) -> ()
        %4735 = func.call @stack_pop_pointer() : () -> i64
        %4736 = func.call @stack_pop_pointer() : () -> i64
        %4737 = func.call @cc_cons(%4735, %4736) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4737) : (i64) -> ()
      }
      %4738 = func.call @stack_pop_pointer() : () -> i64
      %4739 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4738) : (i64) -> ()
      func.call @stack_push_pointer(%4739) : (i64) -> ()
      %4740 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4741 = func.call @cc_make_function_ref_const(%4740) : (!llvm.ptr) -> i64
      %4742 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%4741, %4742) : (i64, i64) -> ()
      %4743 = func.call @stack_pop_pointer() : () -> i64
      %4744 = func.call @cc_nil_value() : () -> i64
      %4745 = func.call @cc_cons(%4743, %4744) : (i64, i64) -> i64
      %4746 = func.call @cc_not(%4745) : (i64) -> i64
      func.call @stack_push_pointer(%4746) : (i64) -> ()
      %4747 = func.call @stack_pop_pointer() : () -> i64
      %4748 = func.call @cc_nil_value() : () -> i64
      %4749 = func.call @cc_cons(%4747, %4748) : (i64, i64) -> i64
      %4750 = func.call @cc_not(%4749) : (i64) -> i64
      func.call @stack_push_pointer(%4750) : (i64) -> ()
      %4751 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4751 : i64
    }
    func.call @stack_push_pointer(%4714) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808594"() {
    %4928 = func.call @cc_nil_value() : () -> i64
    %4929 = func.call @cc_nil_value() : () -> i64
    %4930 = func.call @cc_errorp(%4928) : (i64) -> i64
    %4931 = arith.cmpi ne, %4930, %4929 : i64
    %4932 = scf.if %4931 -> (i64) {
      scf.yield %4928 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %4933 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4933) : (i64) -> ()
      %4934 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4934) : (i64) -> ()
      %4935 = func.call @stack_pop_pointer() : () -> i64
      %4936 = func.call @stack_pop_pointer() : () -> i64
      %4937 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4935) : (i64) -> ()
      func.call @stack_push_pointer(%4937) : (i64) -> ()
      func.call @stack_push_pointer(%4936) : (i64) -> ()
      %4938 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4939 = func.call @cc_make_function_ref_const(%4938) : (!llvm.ptr) -> i64
      %4940 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%4939, %4940) : (i64, i64) -> ()
      %4941 = func.call @stack_pop_pointer() : () -> i64
      %4942 = func.call @cc_nil_value() : () -> i64
      %4943 = func.call @cc_cons(%4941, %4942) : (i64, i64) -> i64
      %4944 = func.call @cc_not(%4943) : (i64) -> i64
      func.call @stack_push_pointer(%4944) : (i64) -> ()
      %4945 = func.call @stack_pop_pointer() : () -> i64
      %4946 = func.call @cc_nil_value() : () -> i64
      %4947 = func.call @cc_cons(%4945, %4946) : (i64, i64) -> i64
      %4948 = func.call @cc_not(%4947) : (i64) -> i64
      func.call @stack_push_pointer(%4948) : (i64) -> ()
      %4949 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4949 : i64
    }
    func.call @stack_push_pointer(%4932) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808595"() {
    %5230 = func.call @stack_pop_pointer() : () -> i64
    %5231 = func.call @cc_nil_value() : () -> i64
    %5232 = func.call @cc_nil_value() : () -> i64
    %5233 = func.call @cc_errorp(%5231) : (i64) -> i64
    %5234 = arith.cmpi ne, %5233, %5232 : i64
    %5235 = scf.if %5234 -> (i64) {
      scf.yield %5231 : i64
    } else {
      %5236 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%5236) : (i64) -> ()
      %5237 = func.call @stack_pop_pointer() : () -> i64
      %5238 = func.call @cc_nil_value() : () -> i64
      %5239 = func.call @cc_nil_value() : () -> i64
      %5240 = func.call @cc_errorp(%5238) : (i64) -> i64
      %5241 = arith.cmpi ne, %5240, %5239 : i64
      %5242:2 = scf.if %5241 -> (i64, i64) {
        scf.yield %5238, %5237 : i64, i64
      } else {
        %5243 = llvm.mlir.addressof @str409 : !llvm.ptr
        %5244 = arith.constant 2 : i64
        %5245 = func.call @cc_make_string(%5243, %5244) : (!llvm.ptr, i64) -> i64
        %5246 = llvm.mlir.addressof @str410 : !llvm.ptr
        %5247 = arith.constant 7 : i64
        %5248 = func.call @cc_make_string(%5246, %5247) : (!llvm.ptr, i64) -> i64
        %5249 = func.call @cc_intern(%5245, %5248) : (i64, i64) -> i64
        %5250 = func.call @cc_nil_value() : () -> i64
        %5251 = func.call @cc_cons(%5249, %5250) : (i64, i64) -> i64
        %5252 = func.call @cc_values_pack(%5251) : (i64) -> i64
        func.call @stack_push_pointer(%5249) : (i64) -> ()
        %5253 = func.call @stack_pop_pointer() : () -> i64
        %5254 = func.call @cc_nil_value() : () -> i64
        %5255 = func.call @cc_errorp(%5253) : (i64) -> i64
        %5256 = arith.cmpi ne, %5255, %5254 : i64
        %5257 = arith.cmpi eq, %5254, %5254 : i64
        %5258 = arith.andi %5256, %5257 : i1
        %5259 = scf.if %5258 -> (i64) {
          scf.yield %5253 : i64
        } else {
          scf.yield %5254 : i64
        }
        %5260 = arith.cmpi ne, %5259, %5254 : i64
        scf.if %5260 {
          func.call @stack_push_pointer(%5259) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5253) : (i64) -> ()
          %5261 = llvm.mlir.addressof @str411 : !llvm.ptr
          %5262 = func.call @cc_make_function_ref_const(%5261) : (!llvm.ptr) -> i64
          %5263 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5262, %5263) : (i64, i64) -> ()
        }
        %5264 = func.call @stack_pop_pointer() : () -> i64
        %5265 = func.call @cc_package_external_symbols(%5264) : (i64) -> i64
        %5266:2 = scf.while (%arg0 = %5265, %arg1 = %5237) : (i64, i64) -> (i64, i64) {
          %5267 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %5268 = arith.constant 0 : i32
          %5269 = arith.cmpi ne, %5267, %5268 : i32
          scf.condition(%5269) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%5270: i64, %5271: i64):
          %5272 = func.call @cc_car(%5270) : (i64) -> i64
          func.call @stack_push_nil() : () -> ()
          %5273 = func.call @stack_depth() : () -> i64
          %5274 = arith.constant 0 : i64
          %5275 = arith.cmpi sgt, %5273, %5274 : i64
          scf.if %5275 {
            %5276 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%5271) : (i64) -> ()
          %5277 = func.call @stack_pop_pointer() : () -> i64
          %5278 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%5278) : (i64) -> ()
          %5279 = func.call @stack_pop_pointer() : () -> i64
          %5281 = arith.constant 3 : i64
          %5280 = arith.andi %5277, %5281 : i64
          %5282 = arith.constant 0 : i64
          %5283 = arith.cmpi eq, %5280, %5282 : i64
          %5285 = arith.constant 3 : i64
          %5284 = arith.andi %5279, %5285 : i64
          %5286 = arith.constant 0 : i64
          %5287 = arith.cmpi eq, %5284, %5286 : i64
          %5288 = arith.andi %5283, %5287 : i1
          %5289 = scf.if %5288 -> (i64) {
            %5290 = arith.constant 2 : i64
            %5291 = arith.shrsi %5277, %5290 : i64
            %5292 = arith.constant 2 : i64
            %5293 = arith.shrsi %5279, %5292 : i64
            %5294 = arith.addi %5291, %5293 : i64
            %5295 = arith.constant -2305843009213693952 : i64
            %5296 = arith.constant 2305843009213693951 : i64
            %5297 = arith.cmpi sge, %5294, %5295 : i64
            %5298 = arith.cmpi sle, %5294, %5296 : i64
            %5299 = arith.andi %5297, %5298 : i1
            %5300 = scf.if %5299 -> (i64) {
              %5301 = arith.constant 2 : i64
              %5302 = arith.shli %5294, %5301 : i64
              scf.yield %5302 : i64
            } else {
              %5303 = func.call @cc_add(%5277, %5279) : (i64, i64) -> i64
              scf.yield %5303 : i64
            }
            scf.yield %5300 : i64
          } else {
            %5304 = func.call @cc_add(%5277, %5279) : (i64, i64) -> i64
            scf.yield %5304 : i64
          }
          func.call @stack_push_pointer(%5289) : (i64) -> ()
          %5305 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%5305) : (i64) -> ()
          %5306 = func.call @stack_depth() : () -> i64
          %5307 = arith.constant 0 : i64
          %5308 = arith.cmpi sgt, %5306, %5307 : i64
          scf.if %5308 {
            %5309 = func.call @stack_pop_pointer() : () -> i64
          }
          %5310 = func.call @cc_cdr(%5270) : (i64) -> i64
          scf.yield %5310, %5305 : i64, i64
        }
        %5311 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5266#1) : (i64) -> ()
        %5312 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5312, %5266#1 : i64, i64
      }
      func.call @stack_push_pointer(%5242#0) : (i64) -> ()
      %5313 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5313 : i64
    }
    func.call @stack_push_pointer(%5235) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_116254966808597"() {
    %8457 = func.call @cc_nil_value() : () -> i64
    %8458 = func.call @cc_nil_value() : () -> i64
    %8459 = func.call @cc_errorp(%8457) : (i64) -> i64
    %8460 = arith.cmpi ne, %8459, %8458 : i64
    %8461 = scf.if %8460 -> (i64) {
      scf.yield %8457 : i64
    } else {
      %8462 = llvm.mlir.addressof @str876 : !llvm.ptr
      %8463 = arith.constant 17 : i64
      %8464 = func.call @cc_make_string(%8462, %8463) : (!llvm.ptr, i64) -> i64
      %8465 = llvm.mlir.addressof @str877 : !llvm.ptr
      %8466 = arith.constant 11 : i64
      %8467 = func.call @cc_make_string(%8465, %8466) : (!llvm.ptr, i64) -> i64
      %8468 = func.call @cc_intern(%8464, %8467) : (i64, i64) -> i64
      %8469 = func.call @cc_nil_value() : () -> i64
      %8470 = func.call @cc_cons(%8468, %8469) : (i64, i64) -> i64
      %8471 = func.call @cc_values_pack(%8470) : (i64) -> i64
      func.call @stack_push_pointer(%8468) : (i64) -> ()
      %8472 = llvm.mlir.addressof @str878 : !llvm.ptr
      %8473 = arith.constant 4 : i64
      %8474 = func.call @cc_make_string(%8472, %8473) : (!llvm.ptr, i64) -> i64
      %8475 = llvm.mlir.addressof @str879 : !llvm.ptr
      %8476 = arith.constant 11 : i64
      %8477 = func.call @cc_make_string(%8475, %8476) : (!llvm.ptr, i64) -> i64
      %8478 = func.call @cc_intern(%8474, %8477) : (i64, i64) -> i64
      %8479 = func.call @cc_nil_value() : () -> i64
      %8480 = func.call @cc_cons(%8478, %8479) : (i64, i64) -> i64
      %8481 = func.call @cc_values_pack(%8480) : (i64) -> i64
      func.call @stack_push_pointer(%8478) : (i64) -> ()
      %8482 = llvm.mlir.addressof @str880 : !llvm.ptr
      %8483 = arith.constant 5 : i64
      %8484 = func.call @cc_make_string(%8482, %8483) : (!llvm.ptr, i64) -> i64
      %8485 = llvm.mlir.addressof @str881 : !llvm.ptr
      %8486 = arith.constant 11 : i64
      %8487 = func.call @cc_make_string(%8485, %8486) : (!llvm.ptr, i64) -> i64
      %8488 = func.call @cc_intern(%8484, %8487) : (i64, i64) -> i64
      %8489 = func.call @cc_nil_value() : () -> i64
      %8490 = func.call @cc_cons(%8488, %8489) : (i64, i64) -> i64
      %8491 = func.call @cc_values_pack(%8490) : (i64) -> i64
      func.call @stack_push_pointer(%8488) : (i64) -> ()
      %8492 = llvm.mlir.addressof @str882 : !llvm.ptr
      %8493 = arith.constant 12 : i64
      %8494 = func.call @cc_make_string(%8492, %8493) : (!llvm.ptr, i64) -> i64
      %8495 = llvm.mlir.addressof @str883 : !llvm.ptr
      %8496 = arith.constant 11 : i64
      %8497 = func.call @cc_make_string(%8495, %8496) : (!llvm.ptr, i64) -> i64
      %8498 = func.call @cc_intern(%8494, %8497) : (i64, i64) -> i64
      %8499 = func.call @cc_nil_value() : () -> i64
      %8500 = func.call @cc_cons(%8498, %8499) : (i64, i64) -> i64
      %8501 = func.call @cc_values_pack(%8500) : (i64) -> i64
      func.call @stack_push_pointer(%8498) : (i64) -> ()
      %8502 = llvm.mlir.addressof @str884 : !llvm.ptr
      %8503 = arith.constant 4 : i64
      %8504 = func.call @cc_make_string(%8502, %8503) : (!llvm.ptr, i64) -> i64
      %8505 = llvm.mlir.addressof @str885 : !llvm.ptr
      %8506 = arith.constant 11 : i64
      %8507 = func.call @cc_make_string(%8505, %8506) : (!llvm.ptr, i64) -> i64
      %8508 = func.call @cc_intern(%8504, %8507) : (i64, i64) -> i64
      %8509 = func.call @cc_nil_value() : () -> i64
      %8510 = func.call @cc_cons(%8508, %8509) : (i64, i64) -> i64
      %8511 = func.call @cc_values_pack(%8510) : (i64) -> i64
      func.call @stack_push_pointer(%8508) : (i64) -> ()
      %8512 = llvm.mlir.addressof @str886 : !llvm.ptr
      %8513 = arith.constant 9 : i64
      %8514 = func.call @cc_make_string(%8512, %8513) : (!llvm.ptr, i64) -> i64
      %8515 = llvm.mlir.addressof @str887 : !llvm.ptr
      %8516 = arith.constant 11 : i64
      %8517 = func.call @cc_make_string(%8515, %8516) : (!llvm.ptr, i64) -> i64
      %8518 = func.call @cc_intern(%8514, %8517) : (i64, i64) -> i64
      %8519 = func.call @cc_nil_value() : () -> i64
      %8520 = func.call @cc_cons(%8518, %8519) : (i64, i64) -> i64
      %8521 = func.call @cc_values_pack(%8520) : (i64) -> i64
      func.call @stack_push_pointer(%8518) : (i64) -> ()
      %8522 = llvm.mlir.addressof @str888 : !llvm.ptr
      %8523 = arith.constant 5 : i64
      %8524 = func.call @cc_make_string(%8522, %8523) : (!llvm.ptr, i64) -> i64
      %8525 = llvm.mlir.addressof @str889 : !llvm.ptr
      %8526 = arith.constant 11 : i64
      %8527 = func.call @cc_make_string(%8525, %8526) : (!llvm.ptr, i64) -> i64
      %8528 = func.call @cc_intern(%8524, %8527) : (i64, i64) -> i64
      %8529 = func.call @cc_nil_value() : () -> i64
      %8530 = func.call @cc_cons(%8528, %8529) : (i64, i64) -> i64
      %8531 = func.call @cc_values_pack(%8530) : (i64) -> i64
      func.call @stack_push_pointer(%8528) : (i64) -> ()
      %8532 = llvm.mlir.addressof @str890 : !llvm.ptr
      %8533 = arith.constant 6 : i64
      %8534 = func.call @cc_make_string(%8532, %8533) : (!llvm.ptr, i64) -> i64
      %8535 = llvm.mlir.addressof @str891 : !llvm.ptr
      %8536 = arith.constant 11 : i64
      %8537 = func.call @cc_make_string(%8535, %8536) : (!llvm.ptr, i64) -> i64
      %8538 = func.call @cc_intern(%8534, %8537) : (i64, i64) -> i64
      %8539 = func.call @cc_nil_value() : () -> i64
      %8540 = func.call @cc_cons(%8538, %8539) : (i64, i64) -> i64
      %8541 = func.call @cc_values_pack(%8540) : (i64) -> i64
      func.call @stack_push_pointer(%8538) : (i64) -> ()
      %8542 = llvm.mlir.addressof @str892 : !llvm.ptr
      %8543 = arith.constant 2 : i64
      %8544 = func.call @cc_make_string(%8542, %8543) : (!llvm.ptr, i64) -> i64
      %8545 = llvm.mlir.addressof @str893 : !llvm.ptr
      %8546 = arith.constant 11 : i64
      %8547 = func.call @cc_make_string(%8545, %8546) : (!llvm.ptr, i64) -> i64
      %8548 = func.call @cc_intern(%8544, %8547) : (i64, i64) -> i64
      %8549 = func.call @cc_nil_value() : () -> i64
      %8550 = func.call @cc_cons(%8548, %8549) : (i64, i64) -> i64
      %8551 = func.call @cc_values_pack(%8550) : (i64) -> i64
      func.call @stack_push_pointer(%8548) : (i64) -> ()
      %8552 = llvm.mlir.addressof @str894 : !llvm.ptr
      %8553 = arith.constant 3 : i64
      %8554 = func.call @cc_make_string(%8552, %8553) : (!llvm.ptr, i64) -> i64
      %8555 = llvm.mlir.addressof @str895 : !llvm.ptr
      %8556 = arith.constant 11 : i64
      %8557 = func.call @cc_make_string(%8555, %8556) : (!llvm.ptr, i64) -> i64
      %8558 = func.call @cc_intern(%8554, %8557) : (i64, i64) -> i64
      %8559 = func.call @cc_nil_value() : () -> i64
      %8560 = func.call @cc_cons(%8558, %8559) : (i64, i64) -> i64
      %8561 = func.call @cc_values_pack(%8560) : (i64) -> i64
      func.call @stack_push_pointer(%8558) : (i64) -> ()
      %8562 = llvm.mlir.addressof @str896 : !llvm.ptr
      %8563 = arith.constant 18 : i64
      %8564 = func.call @cc_make_string(%8562, %8563) : (!llvm.ptr, i64) -> i64
      %8565 = llvm.mlir.addressof @str897 : !llvm.ptr
      %8566 = arith.constant 11 : i64
      %8567 = func.call @cc_make_string(%8565, %8566) : (!llvm.ptr, i64) -> i64
      %8568 = func.call @cc_intern(%8564, %8567) : (i64, i64) -> i64
      %8569 = func.call @cc_nil_value() : () -> i64
      %8570 = func.call @cc_cons(%8568, %8569) : (i64, i64) -> i64
      %8571 = func.call @cc_values_pack(%8570) : (i64) -> i64
      func.call @stack_push_pointer(%8568) : (i64) -> ()
      %8572 = llvm.mlir.addressof @str898 : !llvm.ptr
      %8573 = arith.constant 23 : i64
      %8574 = func.call @cc_make_string(%8572, %8573) : (!llvm.ptr, i64) -> i64
      %8575 = llvm.mlir.addressof @str899 : !llvm.ptr
      %8576 = arith.constant 11 : i64
      %8577 = func.call @cc_make_string(%8575, %8576) : (!llvm.ptr, i64) -> i64
      %8578 = func.call @cc_intern(%8574, %8577) : (i64, i64) -> i64
      %8579 = func.call @cc_nil_value() : () -> i64
      %8580 = func.call @cc_cons(%8578, %8579) : (i64, i64) -> i64
      %8581 = func.call @cc_values_pack(%8580) : (i64) -> i64
      func.call @stack_push_pointer(%8578) : (i64) -> ()
      %8582 = llvm.mlir.addressof @str900 : !llvm.ptr
      %8583 = arith.constant 23 : i64
      %8584 = func.call @cc_make_string(%8582, %8583) : (!llvm.ptr, i64) -> i64
      %8585 = llvm.mlir.addressof @str901 : !llvm.ptr
      %8586 = arith.constant 11 : i64
      %8587 = func.call @cc_make_string(%8585, %8586) : (!llvm.ptr, i64) -> i64
      %8588 = func.call @cc_intern(%8584, %8587) : (i64, i64) -> i64
      %8589 = func.call @cc_nil_value() : () -> i64
      %8590 = func.call @cc_cons(%8588, %8589) : (i64, i64) -> i64
      %8591 = func.call @cc_values_pack(%8590) : (i64) -> i64
      func.call @stack_push_pointer(%8588) : (i64) -> ()
      %8592 = llvm.mlir.addressof @str902 : !llvm.ptr
      %8593 = arith.constant 15 : i64
      %8594 = func.call @cc_make_string(%8592, %8593) : (!llvm.ptr, i64) -> i64
      %8595 = llvm.mlir.addressof @str903 : !llvm.ptr
      %8596 = arith.constant 11 : i64
      %8597 = func.call @cc_make_string(%8595, %8596) : (!llvm.ptr, i64) -> i64
      %8598 = func.call @cc_intern(%8594, %8597) : (i64, i64) -> i64
      %8599 = func.call @cc_nil_value() : () -> i64
      %8600 = func.call @cc_cons(%8598, %8599) : (i64, i64) -> i64
      %8601 = func.call @cc_values_pack(%8600) : (i64) -> i64
      func.call @stack_push_pointer(%8598) : (i64) -> ()
      %8602 = llvm.mlir.addressof @str904 : !llvm.ptr
      %8603 = arith.constant 17 : i64
      %8604 = func.call @cc_make_string(%8602, %8603) : (!llvm.ptr, i64) -> i64
      %8605 = llvm.mlir.addressof @str905 : !llvm.ptr
      %8606 = arith.constant 11 : i64
      %8607 = func.call @cc_make_string(%8605, %8606) : (!llvm.ptr, i64) -> i64
      %8608 = func.call @cc_intern(%8604, %8607) : (i64, i64) -> i64
      %8609 = func.call @cc_nil_value() : () -> i64
      %8610 = func.call @cc_cons(%8608, %8609) : (i64, i64) -> i64
      %8611 = func.call @cc_values_pack(%8610) : (i64) -> i64
      func.call @stack_push_pointer(%8608) : (i64) -> ()
      %8612 = llvm.mlir.addressof @str906 : !llvm.ptr
      %8613 = arith.constant 10 : i64
      %8614 = func.call @cc_make_string(%8612, %8613) : (!llvm.ptr, i64) -> i64
      %8615 = llvm.mlir.addressof @str907 : !llvm.ptr
      %8616 = arith.constant 11 : i64
      %8617 = func.call @cc_make_string(%8615, %8616) : (!llvm.ptr, i64) -> i64
      %8618 = func.call @cc_intern(%8614, %8617) : (i64, i64) -> i64
      %8619 = func.call @cc_nil_value() : () -> i64
      %8620 = func.call @cc_cons(%8618, %8619) : (i64, i64) -> i64
      %8621 = func.call @cc_values_pack(%8620) : (i64) -> i64
      func.call @stack_push_pointer(%8618) : (i64) -> ()
      %8622 = llvm.mlir.addressof @str908 : !llvm.ptr
      %8623 = arith.constant 15 : i64
      %8624 = func.call @cc_make_string(%8622, %8623) : (!llvm.ptr, i64) -> i64
      %8625 = llvm.mlir.addressof @str909 : !llvm.ptr
      %8626 = arith.constant 11 : i64
      %8627 = func.call @cc_make_string(%8625, %8626) : (!llvm.ptr, i64) -> i64
      %8628 = func.call @cc_intern(%8624, %8627) : (i64, i64) -> i64
      %8629 = func.call @cc_nil_value() : () -> i64
      %8630 = func.call @cc_cons(%8628, %8629) : (i64, i64) -> i64
      %8631 = func.call @cc_values_pack(%8630) : (i64) -> i64
      func.call @stack_push_pointer(%8628) : (i64) -> ()
      %8632 = llvm.mlir.addressof @str910 : !llvm.ptr
      %8633 = arith.constant 27 : i64
      %8634 = func.call @cc_make_string(%8632, %8633) : (!llvm.ptr, i64) -> i64
      %8635 = llvm.mlir.addressof @str911 : !llvm.ptr
      %8636 = arith.constant 11 : i64
      %8637 = func.call @cc_make_string(%8635, %8636) : (!llvm.ptr, i64) -> i64
      %8638 = func.call @cc_intern(%8634, %8637) : (i64, i64) -> i64
      %8639 = func.call @cc_nil_value() : () -> i64
      %8640 = func.call @cc_cons(%8638, %8639) : (i64, i64) -> i64
      %8641 = func.call @cc_values_pack(%8640) : (i64) -> i64
      func.call @stack_push_pointer(%8638) : (i64) -> ()
      %8642 = llvm.mlir.addressof @str912 : !llvm.ptr
      %8643 = arith.constant 14 : i64
      %8644 = func.call @cc_make_string(%8642, %8643) : (!llvm.ptr, i64) -> i64
      %8645 = llvm.mlir.addressof @str913 : !llvm.ptr
      %8646 = arith.constant 11 : i64
      %8647 = func.call @cc_make_string(%8645, %8646) : (!llvm.ptr, i64) -> i64
      %8648 = func.call @cc_intern(%8644, %8647) : (i64, i64) -> i64
      %8649 = func.call @cc_nil_value() : () -> i64
      %8650 = func.call @cc_cons(%8648, %8649) : (i64, i64) -> i64
      %8651 = func.call @cc_values_pack(%8650) : (i64) -> i64
      func.call @stack_push_pointer(%8648) : (i64) -> ()
      %8652 = llvm.mlir.addressof @str914 : !llvm.ptr
      %8653 = arith.constant 10 : i64
      %8654 = func.call @cc_make_string(%8652, %8653) : (!llvm.ptr, i64) -> i64
      %8655 = llvm.mlir.addressof @str915 : !llvm.ptr
      %8656 = arith.constant 11 : i64
      %8657 = func.call @cc_make_string(%8655, %8656) : (!llvm.ptr, i64) -> i64
      %8658 = func.call @cc_intern(%8654, %8657) : (i64, i64) -> i64
      %8659 = func.call @cc_nil_value() : () -> i64
      %8660 = func.call @cc_cons(%8658, %8659) : (i64, i64) -> i64
      %8661 = func.call @cc_values_pack(%8660) : (i64) -> i64
      func.call @stack_push_pointer(%8658) : (i64) -> ()
      %8662 = llvm.mlir.addressof @str916 : !llvm.ptr
      %8663 = arith.constant 16 : i64
      %8664 = func.call @cc_make_string(%8662, %8663) : (!llvm.ptr, i64) -> i64
      %8665 = llvm.mlir.addressof @str917 : !llvm.ptr
      %8666 = arith.constant 11 : i64
      %8667 = func.call @cc_make_string(%8665, %8666) : (!llvm.ptr, i64) -> i64
      %8668 = func.call @cc_intern(%8664, %8667) : (i64, i64) -> i64
      %8669 = func.call @cc_nil_value() : () -> i64
      %8670 = func.call @cc_cons(%8668, %8669) : (i64, i64) -> i64
      %8671 = func.call @cc_values_pack(%8670) : (i64) -> i64
      func.call @stack_push_pointer(%8668) : (i64) -> ()
      %8672 = llvm.mlir.addressof @str918 : !llvm.ptr
      %8673 = arith.constant 15 : i64
      %8674 = func.call @cc_make_string(%8672, %8673) : (!llvm.ptr, i64) -> i64
      %8675 = llvm.mlir.addressof @str919 : !llvm.ptr
      %8676 = arith.constant 11 : i64
      %8677 = func.call @cc_make_string(%8675, %8676) : (!llvm.ptr, i64) -> i64
      %8678 = func.call @cc_intern(%8674, %8677) : (i64, i64) -> i64
      %8679 = func.call @cc_nil_value() : () -> i64
      %8680 = func.call @cc_cons(%8678, %8679) : (i64, i64) -> i64
      %8681 = func.call @cc_values_pack(%8680) : (i64) -> i64
      func.call @stack_push_pointer(%8678) : (i64) -> ()
      %8682 = llvm.mlir.addressof @str920 : !llvm.ptr
      %8683 = arith.constant 12 : i64
      %8684 = func.call @cc_make_string(%8682, %8683) : (!llvm.ptr, i64) -> i64
      %8685 = llvm.mlir.addressof @str921 : !llvm.ptr
      %8686 = arith.constant 11 : i64
      %8687 = func.call @cc_make_string(%8685, %8686) : (!llvm.ptr, i64) -> i64
      %8688 = func.call @cc_intern(%8684, %8687) : (i64, i64) -> i64
      %8689 = func.call @cc_nil_value() : () -> i64
      %8690 = func.call @cc_cons(%8688, %8689) : (i64, i64) -> i64
      %8691 = func.call @cc_values_pack(%8690) : (i64) -> i64
      func.call @stack_push_pointer(%8688) : (i64) -> ()
      %8692 = llvm.mlir.addressof @str922 : !llvm.ptr
      %8693 = arith.constant 15 : i64
      %8694 = func.call @cc_make_string(%8692, %8693) : (!llvm.ptr, i64) -> i64
      %8695 = llvm.mlir.addressof @str923 : !llvm.ptr
      %8696 = arith.constant 11 : i64
      %8697 = func.call @cc_make_string(%8695, %8696) : (!llvm.ptr, i64) -> i64
      %8698 = func.call @cc_intern(%8694, %8697) : (i64, i64) -> i64
      %8699 = func.call @cc_nil_value() : () -> i64
      %8700 = func.call @cc_cons(%8698, %8699) : (i64, i64) -> i64
      %8701 = func.call @cc_values_pack(%8700) : (i64) -> i64
      func.call @stack_push_pointer(%8698) : (i64) -> ()
      %8702 = llvm.mlir.addressof @str924 : !llvm.ptr
      %8703 = arith.constant 14 : i64
      %8704 = func.call @cc_make_string(%8702, %8703) : (!llvm.ptr, i64) -> i64
      %8705 = llvm.mlir.addressof @str925 : !llvm.ptr
      %8706 = arith.constant 11 : i64
      %8707 = func.call @cc_make_string(%8705, %8706) : (!llvm.ptr, i64) -> i64
      %8708 = func.call @cc_intern(%8704, %8707) : (i64, i64) -> i64
      %8709 = func.call @cc_nil_value() : () -> i64
      %8710 = func.call @cc_cons(%8708, %8709) : (i64, i64) -> i64
      %8711 = func.call @cc_values_pack(%8710) : (i64) -> i64
      func.call @stack_push_pointer(%8708) : (i64) -> ()
      %8712 = llvm.mlir.addressof @str926 : !llvm.ptr
      %8713 = arith.constant 18 : i64
      %8714 = func.call @cc_make_string(%8712, %8713) : (!llvm.ptr, i64) -> i64
      %8715 = llvm.mlir.addressof @str927 : !llvm.ptr
      %8716 = arith.constant 11 : i64
      %8717 = func.call @cc_make_string(%8715, %8716) : (!llvm.ptr, i64) -> i64
      %8718 = func.call @cc_intern(%8714, %8717) : (i64, i64) -> i64
      %8719 = func.call @cc_nil_value() : () -> i64
      %8720 = func.call @cc_cons(%8718, %8719) : (i64, i64) -> i64
      %8721 = func.call @cc_values_pack(%8720) : (i64) -> i64
      func.call @stack_push_pointer(%8718) : (i64) -> ()
      %8722 = llvm.mlir.addressof @str928 : !llvm.ptr
      %8723 = arith.constant 9 : i64
      %8724 = func.call @cc_make_string(%8722, %8723) : (!llvm.ptr, i64) -> i64
      %8725 = llvm.mlir.addressof @str929 : !llvm.ptr
      %8726 = arith.constant 11 : i64
      %8727 = func.call @cc_make_string(%8725, %8726) : (!llvm.ptr, i64) -> i64
      %8728 = func.call @cc_intern(%8724, %8727) : (i64, i64) -> i64
      %8729 = func.call @cc_nil_value() : () -> i64
      %8730 = func.call @cc_cons(%8728, %8729) : (i64, i64) -> i64
      %8731 = func.call @cc_values_pack(%8730) : (i64) -> i64
      func.call @stack_push_pointer(%8728) : (i64) -> ()
      %8732 = llvm.mlir.addressof @str930 : !llvm.ptr
      %8733 = arith.constant 9 : i64
      %8734 = func.call @cc_make_string(%8732, %8733) : (!llvm.ptr, i64) -> i64
      %8735 = llvm.mlir.addressof @str931 : !llvm.ptr
      %8736 = arith.constant 11 : i64
      %8737 = func.call @cc_make_string(%8735, %8736) : (!llvm.ptr, i64) -> i64
      %8738 = func.call @cc_intern(%8734, %8737) : (i64, i64) -> i64
      %8739 = func.call @cc_nil_value() : () -> i64
      %8740 = func.call @cc_cons(%8738, %8739) : (i64, i64) -> i64
      %8741 = func.call @cc_values_pack(%8740) : (i64) -> i64
      func.call @stack_push_pointer(%8738) : (i64) -> ()
      %8742 = llvm.mlir.addressof @str932 : !llvm.ptr
      %8743 = arith.constant 13 : i64
      %8744 = func.call @cc_make_string(%8742, %8743) : (!llvm.ptr, i64) -> i64
      %8745 = llvm.mlir.addressof @str933 : !llvm.ptr
      %8746 = arith.constant 11 : i64
      %8747 = func.call @cc_make_string(%8745, %8746) : (!llvm.ptr, i64) -> i64
      %8748 = func.call @cc_intern(%8744, %8747) : (i64, i64) -> i64
      %8749 = func.call @cc_nil_value() : () -> i64
      %8750 = func.call @cc_cons(%8748, %8749) : (i64, i64) -> i64
      %8751 = func.call @cc_values_pack(%8750) : (i64) -> i64
      func.call @stack_push_pointer(%8748) : (i64) -> ()
      %8752 = llvm.mlir.addressof @str934 : !llvm.ptr
      %8753 = arith.constant 12 : i64
      %8754 = func.call @cc_make_string(%8752, %8753) : (!llvm.ptr, i64) -> i64
      %8755 = llvm.mlir.addressof @str935 : !llvm.ptr
      %8756 = arith.constant 11 : i64
      %8757 = func.call @cc_make_string(%8755, %8756) : (!llvm.ptr, i64) -> i64
      %8758 = func.call @cc_intern(%8754, %8757) : (i64, i64) -> i64
      %8759 = func.call @cc_nil_value() : () -> i64
      %8760 = func.call @cc_cons(%8758, %8759) : (i64, i64) -> i64
      %8761 = func.call @cc_values_pack(%8760) : (i64) -> i64
      func.call @stack_push_pointer(%8758) : (i64) -> ()
      %8762 = llvm.mlir.addressof @str936 : !llvm.ptr
      %8763 = arith.constant 12 : i64
      %8764 = func.call @cc_make_string(%8762, %8763) : (!llvm.ptr, i64) -> i64
      %8765 = llvm.mlir.addressof @str937 : !llvm.ptr
      %8766 = arith.constant 11 : i64
      %8767 = func.call @cc_make_string(%8765, %8766) : (!llvm.ptr, i64) -> i64
      %8768 = func.call @cc_intern(%8764, %8767) : (i64, i64) -> i64
      %8769 = func.call @cc_nil_value() : () -> i64
      %8770 = func.call @cc_cons(%8768, %8769) : (i64, i64) -> i64
      %8771 = func.call @cc_values_pack(%8770) : (i64) -> i64
      func.call @stack_push_pointer(%8768) : (i64) -> ()
      %8772 = llvm.mlir.addressof @str938 : !llvm.ptr
      %8773 = arith.constant 14 : i64
      %8774 = func.call @cc_make_string(%8772, %8773) : (!llvm.ptr, i64) -> i64
      %8775 = llvm.mlir.addressof @str939 : !llvm.ptr
      %8776 = arith.constant 11 : i64
      %8777 = func.call @cc_make_string(%8775, %8776) : (!llvm.ptr, i64) -> i64
      %8778 = func.call @cc_intern(%8774, %8777) : (i64, i64) -> i64
      %8779 = func.call @cc_nil_value() : () -> i64
      %8780 = func.call @cc_cons(%8778, %8779) : (i64, i64) -> i64
      %8781 = func.call @cc_values_pack(%8780) : (i64) -> i64
      func.call @stack_push_pointer(%8778) : (i64) -> ()
      %8782 = llvm.mlir.addressof @str940 : !llvm.ptr
      %8783 = arith.constant 14 : i64
      %8784 = func.call @cc_make_string(%8782, %8783) : (!llvm.ptr, i64) -> i64
      %8785 = llvm.mlir.addressof @str941 : !llvm.ptr
      %8786 = arith.constant 11 : i64
      %8787 = func.call @cc_make_string(%8785, %8786) : (!llvm.ptr, i64) -> i64
      %8788 = func.call @cc_intern(%8784, %8787) : (i64, i64) -> i64
      %8789 = func.call @cc_nil_value() : () -> i64
      %8790 = func.call @cc_cons(%8788, %8789) : (i64, i64) -> i64
      %8791 = func.call @cc_values_pack(%8790) : (i64) -> i64
      func.call @stack_push_pointer(%8788) : (i64) -> ()
      %8792 = llvm.mlir.addressof @str942 : !llvm.ptr
      %8793 = arith.constant 14 : i64
      %8794 = func.call @cc_make_string(%8792, %8793) : (!llvm.ptr, i64) -> i64
      %8795 = llvm.mlir.addressof @str943 : !llvm.ptr
      %8796 = arith.constant 11 : i64
      %8797 = func.call @cc_make_string(%8795, %8796) : (!llvm.ptr, i64) -> i64
      %8798 = func.call @cc_intern(%8794, %8797) : (i64, i64) -> i64
      %8799 = func.call @cc_nil_value() : () -> i64
      %8800 = func.call @cc_cons(%8798, %8799) : (i64, i64) -> i64
      %8801 = func.call @cc_values_pack(%8800) : (i64) -> i64
      func.call @stack_push_pointer(%8798) : (i64) -> ()
      %8802 = llvm.mlir.addressof @str944 : !llvm.ptr
      %8803 = arith.constant 14 : i64
      %8804 = func.call @cc_make_string(%8802, %8803) : (!llvm.ptr, i64) -> i64
      %8805 = llvm.mlir.addressof @str945 : !llvm.ptr
      %8806 = arith.constant 11 : i64
      %8807 = func.call @cc_make_string(%8805, %8806) : (!llvm.ptr, i64) -> i64
      %8808 = func.call @cc_intern(%8804, %8807) : (i64, i64) -> i64
      %8809 = func.call @cc_nil_value() : () -> i64
      %8810 = func.call @cc_cons(%8808, %8809) : (i64, i64) -> i64
      %8811 = func.call @cc_values_pack(%8810) : (i64) -> i64
      func.call @stack_push_pointer(%8808) : (i64) -> ()
      %8812 = llvm.mlir.addressof @str946 : !llvm.ptr
      %8813 = arith.constant 13 : i64
      %8814 = func.call @cc_make_string(%8812, %8813) : (!llvm.ptr, i64) -> i64
      %8815 = llvm.mlir.addressof @str947 : !llvm.ptr
      %8816 = arith.constant 11 : i64
      %8817 = func.call @cc_make_string(%8815, %8816) : (!llvm.ptr, i64) -> i64
      %8818 = func.call @cc_intern(%8814, %8817) : (i64, i64) -> i64
      %8819 = func.call @cc_nil_value() : () -> i64
      %8820 = func.call @cc_cons(%8818, %8819) : (i64, i64) -> i64
      %8821 = func.call @cc_values_pack(%8820) : (i64) -> i64
      func.call @stack_push_pointer(%8818) : (i64) -> ()
      %8822 = llvm.mlir.addressof @str948 : !llvm.ptr
      %8823 = arith.constant 13 : i64
      %8824 = func.call @cc_make_string(%8822, %8823) : (!llvm.ptr, i64) -> i64
      %8825 = llvm.mlir.addressof @str949 : !llvm.ptr
      %8826 = arith.constant 11 : i64
      %8827 = func.call @cc_make_string(%8825, %8826) : (!llvm.ptr, i64) -> i64
      %8828 = func.call @cc_intern(%8824, %8827) : (i64, i64) -> i64
      %8829 = func.call @cc_nil_value() : () -> i64
      %8830 = func.call @cc_cons(%8828, %8829) : (i64, i64) -> i64
      %8831 = func.call @cc_values_pack(%8830) : (i64) -> i64
      func.call @stack_push_pointer(%8828) : (i64) -> ()
      %8832 = llvm.mlir.addressof @str950 : !llvm.ptr
      %8833 = arith.constant 19 : i64
      %8834 = func.call @cc_make_string(%8832, %8833) : (!llvm.ptr, i64) -> i64
      %8835 = llvm.mlir.addressof @str951 : !llvm.ptr
      %8836 = arith.constant 11 : i64
      %8837 = func.call @cc_make_string(%8835, %8836) : (!llvm.ptr, i64) -> i64
      %8838 = func.call @cc_intern(%8834, %8837) : (i64, i64) -> i64
      %8839 = func.call @cc_nil_value() : () -> i64
      %8840 = func.call @cc_cons(%8838, %8839) : (i64, i64) -> i64
      %8841 = func.call @cc_values_pack(%8840) : (i64) -> i64
      func.call @stack_push_pointer(%8838) : (i64) -> ()
      %8842 = llvm.mlir.addressof @str952 : !llvm.ptr
      %8843 = arith.constant 23 : i64
      %8844 = func.call @cc_make_string(%8842, %8843) : (!llvm.ptr, i64) -> i64
      %8845 = llvm.mlir.addressof @str953 : !llvm.ptr
      %8846 = arith.constant 11 : i64
      %8847 = func.call @cc_make_string(%8845, %8846) : (!llvm.ptr, i64) -> i64
      %8848 = func.call @cc_intern(%8844, %8847) : (i64, i64) -> i64
      %8849 = func.call @cc_nil_value() : () -> i64
      %8850 = func.call @cc_cons(%8848, %8849) : (i64, i64) -> i64
      %8851 = func.call @cc_values_pack(%8850) : (i64) -> i64
      func.call @stack_push_pointer(%8848) : (i64) -> ()
      %8852 = llvm.mlir.addressof @str954 : !llvm.ptr
      %8853 = arith.constant 14 : i64
      %8854 = func.call @cc_make_string(%8852, %8853) : (!llvm.ptr, i64) -> i64
      %8855 = llvm.mlir.addressof @str955 : !llvm.ptr
      %8856 = arith.constant 11 : i64
      %8857 = func.call @cc_make_string(%8855, %8856) : (!llvm.ptr, i64) -> i64
      %8858 = func.call @cc_intern(%8854, %8857) : (i64, i64) -> i64
      %8859 = func.call @cc_nil_value() : () -> i64
      %8860 = func.call @cc_cons(%8858, %8859) : (i64, i64) -> i64
      %8861 = func.call @cc_values_pack(%8860) : (i64) -> i64
      func.call @stack_push_pointer(%8858) : (i64) -> ()
      %8862 = llvm.mlir.addressof @str956 : !llvm.ptr
      %8863 = arith.constant 13 : i64
      %8864 = func.call @cc_make_string(%8862, %8863) : (!llvm.ptr, i64) -> i64
      %8865 = llvm.mlir.addressof @str957 : !llvm.ptr
      %8866 = arith.constant 11 : i64
      %8867 = func.call @cc_make_string(%8865, %8866) : (!llvm.ptr, i64) -> i64
      %8868 = func.call @cc_intern(%8864, %8867) : (i64, i64) -> i64
      %8869 = func.call @cc_nil_value() : () -> i64
      %8870 = func.call @cc_cons(%8868, %8869) : (i64, i64) -> i64
      %8871 = func.call @cc_values_pack(%8870) : (i64) -> i64
      func.call @stack_push_pointer(%8868) : (i64) -> ()
      %8872 = llvm.mlir.addressof @str958 : !llvm.ptr
      %8873 = arith.constant 16 : i64
      %8874 = func.call @cc_make_string(%8872, %8873) : (!llvm.ptr, i64) -> i64
      %8875 = llvm.mlir.addressof @str959 : !llvm.ptr
      %8876 = arith.constant 11 : i64
      %8877 = func.call @cc_make_string(%8875, %8876) : (!llvm.ptr, i64) -> i64
      %8878 = func.call @cc_intern(%8874, %8877) : (i64, i64) -> i64
      %8879 = func.call @cc_nil_value() : () -> i64
      %8880 = func.call @cc_cons(%8878, %8879) : (i64, i64) -> i64
      %8881 = func.call @cc_values_pack(%8880) : (i64) -> i64
      func.call @stack_push_pointer(%8878) : (i64) -> ()
      %8882 = llvm.mlir.addressof @str960 : !llvm.ptr
      %8883 = arith.constant 20 : i64
      %8884 = func.call @cc_make_string(%8882, %8883) : (!llvm.ptr, i64) -> i64
      %8885 = llvm.mlir.addressof @str961 : !llvm.ptr
      %8886 = arith.constant 11 : i64
      %8887 = func.call @cc_make_string(%8885, %8886) : (!llvm.ptr, i64) -> i64
      %8888 = func.call @cc_intern(%8884, %8887) : (i64, i64) -> i64
      %8889 = func.call @cc_nil_value() : () -> i64
      %8890 = func.call @cc_cons(%8888, %8889) : (i64, i64) -> i64
      %8891 = func.call @cc_values_pack(%8890) : (i64) -> i64
      func.call @stack_push_pointer(%8888) : (i64) -> ()
      %8892 = llvm.mlir.addressof @str962 : !llvm.ptr
      %8893 = arith.constant 10 : i64
      %8894 = func.call @cc_make_string(%8892, %8893) : (!llvm.ptr, i64) -> i64
      %8895 = llvm.mlir.addressof @str963 : !llvm.ptr
      %8896 = arith.constant 11 : i64
      %8897 = func.call @cc_make_string(%8895, %8896) : (!llvm.ptr, i64) -> i64
      %8898 = func.call @cc_intern(%8894, %8897) : (i64, i64) -> i64
      %8899 = func.call @cc_nil_value() : () -> i64
      %8900 = func.call @cc_cons(%8898, %8899) : (i64, i64) -> i64
      %8901 = func.call @cc_values_pack(%8900) : (i64) -> i64
      func.call @stack_push_pointer(%8898) : (i64) -> ()
      %8902 = llvm.mlir.addressof @str964 : !llvm.ptr
      %8903 = arith.constant 14 : i64
      %8904 = func.call @cc_make_string(%8902, %8903) : (!llvm.ptr, i64) -> i64
      %8905 = llvm.mlir.addressof @str965 : !llvm.ptr
      %8906 = arith.constant 11 : i64
      %8907 = func.call @cc_make_string(%8905, %8906) : (!llvm.ptr, i64) -> i64
      %8908 = func.call @cc_intern(%8904, %8907) : (i64, i64) -> i64
      %8909 = func.call @cc_nil_value() : () -> i64
      %8910 = func.call @cc_cons(%8908, %8909) : (i64, i64) -> i64
      %8911 = func.call @cc_values_pack(%8910) : (i64) -> i64
      func.call @stack_push_pointer(%8908) : (i64) -> ()
      %8912 = llvm.mlir.addressof @str966 : !llvm.ptr
      %8913 = arith.constant 11 : i64
      %8914 = func.call @cc_make_string(%8912, %8913) : (!llvm.ptr, i64) -> i64
      %8915 = llvm.mlir.addressof @str967 : !llvm.ptr
      %8916 = arith.constant 11 : i64
      %8917 = func.call @cc_make_string(%8915, %8916) : (!llvm.ptr, i64) -> i64
      %8918 = func.call @cc_intern(%8914, %8917) : (i64, i64) -> i64
      %8919 = func.call @cc_nil_value() : () -> i64
      %8920 = func.call @cc_cons(%8918, %8919) : (i64, i64) -> i64
      %8921 = func.call @cc_values_pack(%8920) : (i64) -> i64
      func.call @stack_push_pointer(%8918) : (i64) -> ()
      %8922 = llvm.mlir.addressof @str968 : !llvm.ptr
      %8923 = arith.constant 27 : i64
      %8924 = func.call @cc_make_string(%8922, %8923) : (!llvm.ptr, i64) -> i64
      %8925 = llvm.mlir.addressof @str969 : !llvm.ptr
      %8926 = arith.constant 11 : i64
      %8927 = func.call @cc_make_string(%8925, %8926) : (!llvm.ptr, i64) -> i64
      %8928 = func.call @cc_intern(%8924, %8927) : (i64, i64) -> i64
      %8929 = func.call @cc_nil_value() : () -> i64
      %8930 = func.call @cc_cons(%8928, %8929) : (i64, i64) -> i64
      %8931 = func.call @cc_values_pack(%8930) : (i64) -> i64
      func.call @stack_push_pointer(%8928) : (i64) -> ()
      %8932 = llvm.mlir.addressof @str970 : !llvm.ptr
      %8933 = arith.constant 11 : i64
      %8934 = func.call @cc_make_string(%8932, %8933) : (!llvm.ptr, i64) -> i64
      %8935 = llvm.mlir.addressof @str971 : !llvm.ptr
      %8936 = arith.constant 11 : i64
      %8937 = func.call @cc_make_string(%8935, %8936) : (!llvm.ptr, i64) -> i64
      %8938 = func.call @cc_intern(%8934, %8937) : (i64, i64) -> i64
      %8939 = func.call @cc_nil_value() : () -> i64
      %8940 = func.call @cc_cons(%8938, %8939) : (i64, i64) -> i64
      %8941 = func.call @cc_values_pack(%8940) : (i64) -> i64
      func.call @stack_push_pointer(%8938) : (i64) -> ()
      %8942 = llvm.mlir.addressof @str972 : !llvm.ptr
      %8943 = arith.constant 15 : i64
      %8944 = func.call @cc_make_string(%8942, %8943) : (!llvm.ptr, i64) -> i64
      %8945 = llvm.mlir.addressof @str973 : !llvm.ptr
      %8946 = arith.constant 11 : i64
      %8947 = func.call @cc_make_string(%8945, %8946) : (!llvm.ptr, i64) -> i64
      %8948 = func.call @cc_intern(%8944, %8947) : (i64, i64) -> i64
      %8949 = func.call @cc_nil_value() : () -> i64
      %8950 = func.call @cc_cons(%8948, %8949) : (i64, i64) -> i64
      %8951 = func.call @cc_values_pack(%8950) : (i64) -> i64
      func.call @stack_push_pointer(%8948) : (i64) -> ()
      %8952 = llvm.mlir.addressof @str974 : !llvm.ptr
      %8953 = arith.constant 11 : i64
      %8954 = func.call @cc_make_string(%8952, %8953) : (!llvm.ptr, i64) -> i64
      %8955 = llvm.mlir.addressof @str975 : !llvm.ptr
      %8956 = arith.constant 11 : i64
      %8957 = func.call @cc_make_string(%8955, %8956) : (!llvm.ptr, i64) -> i64
      %8958 = func.call @cc_intern(%8954, %8957) : (i64, i64) -> i64
      %8959 = func.call @cc_nil_value() : () -> i64
      %8960 = func.call @cc_cons(%8958, %8959) : (i64, i64) -> i64
      %8961 = func.call @cc_values_pack(%8960) : (i64) -> i64
      func.call @stack_push_pointer(%8958) : (i64) -> ()
      %8962 = llvm.mlir.addressof @str976 : !llvm.ptr
      %8963 = arith.constant 16 : i64
      %8964 = func.call @cc_make_string(%8962, %8963) : (!llvm.ptr, i64) -> i64
      %8965 = llvm.mlir.addressof @str977 : !llvm.ptr
      %8966 = arith.constant 11 : i64
      %8967 = func.call @cc_make_string(%8965, %8966) : (!llvm.ptr, i64) -> i64
      %8968 = func.call @cc_intern(%8964, %8967) : (i64, i64) -> i64
      %8969 = func.call @cc_nil_value() : () -> i64
      %8970 = func.call @cc_cons(%8968, %8969) : (i64, i64) -> i64
      %8971 = func.call @cc_values_pack(%8970) : (i64) -> i64
      func.call @stack_push_pointer(%8968) : (i64) -> ()
      %8972 = llvm.mlir.addressof @str978 : !llvm.ptr
      %8973 = arith.constant 17 : i64
      %8974 = func.call @cc_make_string(%8972, %8973) : (!llvm.ptr, i64) -> i64
      %8975 = llvm.mlir.addressof @str979 : !llvm.ptr
      %8976 = arith.constant 11 : i64
      %8977 = func.call @cc_make_string(%8975, %8976) : (!llvm.ptr, i64) -> i64
      %8978 = func.call @cc_intern(%8974, %8977) : (i64, i64) -> i64
      %8979 = func.call @cc_nil_value() : () -> i64
      %8980 = func.call @cc_cons(%8978, %8979) : (i64, i64) -> i64
      %8981 = func.call @cc_values_pack(%8980) : (i64) -> i64
      func.call @stack_push_pointer(%8978) : (i64) -> ()
      %8982 = llvm.mlir.addressof @str980 : !llvm.ptr
      %8983 = arith.constant 13 : i64
      %8984 = func.call @cc_make_string(%8982, %8983) : (!llvm.ptr, i64) -> i64
      %8985 = llvm.mlir.addressof @str981 : !llvm.ptr
      %8986 = arith.constant 11 : i64
      %8987 = func.call @cc_make_string(%8985, %8986) : (!llvm.ptr, i64) -> i64
      %8988 = func.call @cc_intern(%8984, %8987) : (i64, i64) -> i64
      %8989 = func.call @cc_nil_value() : () -> i64
      %8990 = func.call @cc_cons(%8988, %8989) : (i64, i64) -> i64
      %8991 = func.call @cc_values_pack(%8990) : (i64) -> i64
      func.call @stack_push_pointer(%8988) : (i64) -> ()
      %8992 = llvm.mlir.addressof @str982 : !llvm.ptr
      %8993 = arith.constant 14 : i64
      %8994 = func.call @cc_make_string(%8992, %8993) : (!llvm.ptr, i64) -> i64
      %8995 = llvm.mlir.addressof @str983 : !llvm.ptr
      %8996 = arith.constant 11 : i64
      %8997 = func.call @cc_make_string(%8995, %8996) : (!llvm.ptr, i64) -> i64
      %8998 = func.call @cc_intern(%8994, %8997) : (i64, i64) -> i64
      %8999 = func.call @cc_nil_value() : () -> i64
      %9000 = func.call @cc_cons(%8998, %8999) : (i64, i64) -> i64
      %9001 = func.call @cc_values_pack(%9000) : (i64) -> i64
      func.call @stack_push_pointer(%8998) : (i64) -> ()
      %9002 = llvm.mlir.addressof @str984 : !llvm.ptr
      %9003 = arith.constant 2 : i64
      %9004 = func.call @cc_make_string(%9002, %9003) : (!llvm.ptr, i64) -> i64
      %9005 = llvm.mlir.addressof @str985 : !llvm.ptr
      %9006 = arith.constant 11 : i64
      %9007 = func.call @cc_make_string(%9005, %9006) : (!llvm.ptr, i64) -> i64
      %9008 = func.call @cc_intern(%9004, %9007) : (i64, i64) -> i64
      %9009 = func.call @cc_nil_value() : () -> i64
      %9010 = func.call @cc_cons(%9008, %9009) : (i64, i64) -> i64
      %9011 = func.call @cc_values_pack(%9010) : (i64) -> i64
      func.call @stack_push_pointer(%9008) : (i64) -> ()
      %9012 = llvm.mlir.addressof @str986 : !llvm.ptr
      %9013 = arith.constant 3 : i64
      %9014 = func.call @cc_make_string(%9012, %9013) : (!llvm.ptr, i64) -> i64
      %9015 = llvm.mlir.addressof @str987 : !llvm.ptr
      %9016 = arith.constant 11 : i64
      %9017 = func.call @cc_make_string(%9015, %9016) : (!llvm.ptr, i64) -> i64
      %9018 = func.call @cc_intern(%9014, %9017) : (i64, i64) -> i64
      %9019 = func.call @cc_nil_value() : () -> i64
      %9020 = func.call @cc_cons(%9018, %9019) : (i64, i64) -> i64
      %9021 = func.call @cc_values_pack(%9020) : (i64) -> i64
      func.call @stack_push_pointer(%9018) : (i64) -> ()
      %9022 = llvm.mlir.addressof @str988 : !llvm.ptr
      %9023 = arith.constant 2 : i64
      %9024 = func.call @cc_make_string(%9022, %9023) : (!llvm.ptr, i64) -> i64
      %9025 = llvm.mlir.addressof @str989 : !llvm.ptr
      %9026 = arith.constant 11 : i64
      %9027 = func.call @cc_make_string(%9025, %9026) : (!llvm.ptr, i64) -> i64
      %9028 = func.call @cc_intern(%9024, %9027) : (i64, i64) -> i64
      %9029 = func.call @cc_nil_value() : () -> i64
      %9030 = func.call @cc_cons(%9028, %9029) : (i64, i64) -> i64
      %9031 = func.call @cc_values_pack(%9030) : (i64) -> i64
      func.call @stack_push_pointer(%9028) : (i64) -> ()
      %9032 = llvm.mlir.addressof @str990 : !llvm.ptr
      %9033 = arith.constant 3 : i64
      %9034 = func.call @cc_make_string(%9032, %9033) : (!llvm.ptr, i64) -> i64
      %9035 = llvm.mlir.addressof @str991 : !llvm.ptr
      %9036 = arith.constant 11 : i64
      %9037 = func.call @cc_make_string(%9035, %9036) : (!llvm.ptr, i64) -> i64
      %9038 = func.call @cc_intern(%9034, %9037) : (i64, i64) -> i64
      %9039 = func.call @cc_nil_value() : () -> i64
      %9040 = func.call @cc_cons(%9038, %9039) : (i64, i64) -> i64
      %9041 = func.call @cc_values_pack(%9040) : (i64) -> i64
      func.call @stack_push_pointer(%9038) : (i64) -> ()
      %9042 = llvm.mlir.addressof @str992 : !llvm.ptr
      %9043 = arith.constant 16 : i64
      %9044 = func.call @cc_make_string(%9042, %9043) : (!llvm.ptr, i64) -> i64
      %9045 = llvm.mlir.addressof @str993 : !llvm.ptr
      %9046 = arith.constant 11 : i64
      %9047 = func.call @cc_make_string(%9045, %9046) : (!llvm.ptr, i64) -> i64
      %9048 = func.call @cc_intern(%9044, %9047) : (i64, i64) -> i64
      %9049 = func.call @cc_nil_value() : () -> i64
      %9050 = func.call @cc_cons(%9048, %9049) : (i64, i64) -> i64
      %9051 = func.call @cc_values_pack(%9050) : (i64) -> i64
      func.call @stack_push_pointer(%9048) : (i64) -> ()
      %9052 = llvm.mlir.addressof @str994 : !llvm.ptr
      %9053 = arith.constant 5 : i64
      %9054 = func.call @cc_make_string(%9052, %9053) : (!llvm.ptr, i64) -> i64
      %9055 = llvm.mlir.addressof @str995 : !llvm.ptr
      %9056 = arith.constant 11 : i64
      %9057 = func.call @cc_make_string(%9055, %9056) : (!llvm.ptr, i64) -> i64
      %9058 = func.call @cc_intern(%9054, %9057) : (i64, i64) -> i64
      %9059 = func.call @cc_nil_value() : () -> i64
      %9060 = func.call @cc_cons(%9058, %9059) : (i64, i64) -> i64
      %9061 = func.call @cc_values_pack(%9060) : (i64) -> i64
      func.call @stack_push_pointer(%9058) : (i64) -> ()
      %9062 = llvm.mlir.addressof @str996 : !llvm.ptr
      %9063 = arith.constant 21 : i64
      %9064 = func.call @cc_make_string(%9062, %9063) : (!llvm.ptr, i64) -> i64
      %9065 = llvm.mlir.addressof @str997 : !llvm.ptr
      %9066 = arith.constant 11 : i64
      %9067 = func.call @cc_make_string(%9065, %9066) : (!llvm.ptr, i64) -> i64
      %9068 = func.call @cc_intern(%9064, %9067) : (i64, i64) -> i64
      %9069 = func.call @cc_nil_value() : () -> i64
      %9070 = func.call @cc_cons(%9068, %9069) : (i64, i64) -> i64
      %9071 = func.call @cc_values_pack(%9070) : (i64) -> i64
      func.call @stack_push_pointer(%9068) : (i64) -> ()
      %9072 = llvm.mlir.addressof @str998 : !llvm.ptr
      %9073 = arith.constant 16 : i64
      %9074 = func.call @cc_make_string(%9072, %9073) : (!llvm.ptr, i64) -> i64
      %9075 = llvm.mlir.addressof @str999 : !llvm.ptr
      %9076 = arith.constant 11 : i64
      %9077 = func.call @cc_make_string(%9075, %9076) : (!llvm.ptr, i64) -> i64
      %9078 = func.call @cc_intern(%9074, %9077) : (i64, i64) -> i64
      %9079 = func.call @cc_nil_value() : () -> i64
      %9080 = func.call @cc_cons(%9078, %9079) : (i64, i64) -> i64
      %9081 = func.call @cc_values_pack(%9080) : (i64) -> i64
      func.call @stack_push_pointer(%9078) : (i64) -> ()
      %9082 = llvm.mlir.addressof @str1000 : !llvm.ptr
      %9083 = arith.constant 22 : i64
      %9084 = func.call @cc_make_string(%9082, %9083) : (!llvm.ptr, i64) -> i64
      %9085 = llvm.mlir.addressof @str1001 : !llvm.ptr
      %9086 = arith.constant 11 : i64
      %9087 = func.call @cc_make_string(%9085, %9086) : (!llvm.ptr, i64) -> i64
      %9088 = func.call @cc_intern(%9084, %9087) : (i64, i64) -> i64
      %9089 = func.call @cc_nil_value() : () -> i64
      %9090 = func.call @cc_cons(%9088, %9089) : (i64, i64) -> i64
      %9091 = func.call @cc_values_pack(%9090) : (i64) -> i64
      func.call @stack_push_pointer(%9088) : (i64) -> ()
      %9092 = llvm.mlir.addressof @str1002 : !llvm.ptr
      %9093 = arith.constant 9 : i64
      %9094 = func.call @cc_make_string(%9092, %9093) : (!llvm.ptr, i64) -> i64
      %9095 = llvm.mlir.addressof @str1003 : !llvm.ptr
      %9096 = arith.constant 11 : i64
      %9097 = func.call @cc_make_string(%9095, %9096) : (!llvm.ptr, i64) -> i64
      %9098 = func.call @cc_intern(%9094, %9097) : (i64, i64) -> i64
      %9099 = func.call @cc_nil_value() : () -> i64
      %9100 = func.call @cc_cons(%9098, %9099) : (i64, i64) -> i64
      %9101 = func.call @cc_values_pack(%9100) : (i64) -> i64
      func.call @stack_push_pointer(%9098) : (i64) -> ()
      %9102 = llvm.mlir.addressof @str1004 : !llvm.ptr
      %9103 = arith.constant 11 : i64
      %9104 = func.call @cc_make_string(%9102, %9103) : (!llvm.ptr, i64) -> i64
      %9105 = llvm.mlir.addressof @str1005 : !llvm.ptr
      %9106 = arith.constant 11 : i64
      %9107 = func.call @cc_make_string(%9105, %9106) : (!llvm.ptr, i64) -> i64
      %9108 = func.call @cc_intern(%9104, %9107) : (i64, i64) -> i64
      %9109 = func.call @cc_nil_value() : () -> i64
      %9110 = func.call @cc_cons(%9108, %9109) : (i64, i64) -> i64
      %9111 = func.call @cc_values_pack(%9110) : (i64) -> i64
      func.call @stack_push_pointer(%9108) : (i64) -> ()
      %9112 = llvm.mlir.addressof @str1006 : !llvm.ptr
      %9113 = arith.constant 6 : i64
      %9114 = func.call @cc_make_string(%9112, %9113) : (!llvm.ptr, i64) -> i64
      %9115 = llvm.mlir.addressof @str1007 : !llvm.ptr
      %9116 = arith.constant 11 : i64
      %9117 = func.call @cc_make_string(%9115, %9116) : (!llvm.ptr, i64) -> i64
      %9118 = func.call @cc_intern(%9114, %9117) : (i64, i64) -> i64
      %9119 = func.call @cc_nil_value() : () -> i64
      %9120 = func.call @cc_cons(%9118, %9119) : (i64, i64) -> i64
      %9121 = func.call @cc_values_pack(%9120) : (i64) -> i64
      func.call @stack_push_pointer(%9118) : (i64) -> ()
      %9122 = llvm.mlir.addressof @str1008 : !llvm.ptr
      %9123 = arith.constant 10 : i64
      %9124 = func.call @cc_make_string(%9122, %9123) : (!llvm.ptr, i64) -> i64
      %9125 = llvm.mlir.addressof @str1009 : !llvm.ptr
      %9126 = arith.constant 11 : i64
      %9127 = func.call @cc_make_string(%9125, %9126) : (!llvm.ptr, i64) -> i64
      %9128 = func.call @cc_intern(%9124, %9127) : (i64, i64) -> i64
      %9129 = func.call @cc_nil_value() : () -> i64
      %9130 = func.call @cc_cons(%9128, %9129) : (i64, i64) -> i64
      %9131 = func.call @cc_values_pack(%9130) : (i64) -> i64
      func.call @stack_push_pointer(%9128) : (i64) -> ()
      %9132 = llvm.mlir.addressof @str1010 : !llvm.ptr
      %9133 = arith.constant 7 : i64
      %9134 = func.call @cc_make_string(%9132, %9133) : (!llvm.ptr, i64) -> i64
      %9135 = llvm.mlir.addressof @str1011 : !llvm.ptr
      %9136 = arith.constant 11 : i64
      %9137 = func.call @cc_make_string(%9135, %9136) : (!llvm.ptr, i64) -> i64
      %9138 = func.call @cc_intern(%9134, %9137) : (i64, i64) -> i64
      %9139 = func.call @cc_nil_value() : () -> i64
      %9140 = func.call @cc_cons(%9138, %9139) : (i64, i64) -> i64
      %9141 = func.call @cc_values_pack(%9140) : (i64) -> i64
      func.call @stack_push_pointer(%9138) : (i64) -> ()
      %9142 = llvm.mlir.addressof @str1012 : !llvm.ptr
      %9143 = arith.constant 7 : i64
      %9144 = func.call @cc_make_string(%9142, %9143) : (!llvm.ptr, i64) -> i64
      %9145 = llvm.mlir.addressof @str1013 : !llvm.ptr
      %9146 = arith.constant 11 : i64
      %9147 = func.call @cc_make_string(%9145, %9146) : (!llvm.ptr, i64) -> i64
      %9148 = func.call @cc_intern(%9144, %9147) : (i64, i64) -> i64
      %9149 = func.call @cc_nil_value() : () -> i64
      %9150 = func.call @cc_cons(%9148, %9149) : (i64, i64) -> i64
      %9151 = func.call @cc_values_pack(%9150) : (i64) -> i64
      func.call @stack_push_pointer(%9148) : (i64) -> ()
      %9152 = llvm.mlir.addressof @str1014 : !llvm.ptr
      %9153 = arith.constant 9 : i64
      %9154 = func.call @cc_make_string(%9152, %9153) : (!llvm.ptr, i64) -> i64
      %9155 = llvm.mlir.addressof @str1015 : !llvm.ptr
      %9156 = arith.constant 11 : i64
      %9157 = func.call @cc_make_string(%9155, %9156) : (!llvm.ptr, i64) -> i64
      %9158 = func.call @cc_intern(%9154, %9157) : (i64, i64) -> i64
      %9159 = func.call @cc_nil_value() : () -> i64
      %9160 = func.call @cc_cons(%9158, %9159) : (i64, i64) -> i64
      %9161 = func.call @cc_values_pack(%9160) : (i64) -> i64
      func.call @stack_push_pointer(%9158) : (i64) -> ()
      %9162 = llvm.mlir.addressof @str1016 : !llvm.ptr
      %9163 = arith.constant 11 : i64
      %9164 = func.call @cc_make_string(%9162, %9163) : (!llvm.ptr, i64) -> i64
      %9165 = llvm.mlir.addressof @str1017 : !llvm.ptr
      %9166 = arith.constant 11 : i64
      %9167 = func.call @cc_make_string(%9165, %9166) : (!llvm.ptr, i64) -> i64
      %9168 = func.call @cc_intern(%9164, %9167) : (i64, i64) -> i64
      %9169 = func.call @cc_nil_value() : () -> i64
      %9170 = func.call @cc_cons(%9168, %9169) : (i64, i64) -> i64
      %9171 = func.call @cc_values_pack(%9170) : (i64) -> i64
      func.call @stack_push_pointer(%9168) : (i64) -> ()
      %9172 = llvm.mlir.addressof @str1018 : !llvm.ptr
      %9173 = arith.constant 11 : i64
      %9174 = func.call @cc_make_string(%9172, %9173) : (!llvm.ptr, i64) -> i64
      %9175 = llvm.mlir.addressof @str1019 : !llvm.ptr
      %9176 = arith.constant 11 : i64
      %9177 = func.call @cc_make_string(%9175, %9176) : (!llvm.ptr, i64) -> i64
      %9178 = func.call @cc_intern(%9174, %9177) : (i64, i64) -> i64
      %9179 = func.call @cc_nil_value() : () -> i64
      %9180 = func.call @cc_cons(%9178, %9179) : (i64, i64) -> i64
      %9181 = func.call @cc_values_pack(%9180) : (i64) -> i64
      func.call @stack_push_pointer(%9178) : (i64) -> ()
      %9182 = llvm.mlir.addressof @str1020 : !llvm.ptr
      %9183 = arith.constant 8 : i64
      %9184 = func.call @cc_make_string(%9182, %9183) : (!llvm.ptr, i64) -> i64
      %9185 = llvm.mlir.addressof @str1021 : !llvm.ptr
      %9186 = arith.constant 11 : i64
      %9187 = func.call @cc_make_string(%9185, %9186) : (!llvm.ptr, i64) -> i64
      %9188 = func.call @cc_intern(%9184, %9187) : (i64, i64) -> i64
      %9189 = func.call @cc_nil_value() : () -> i64
      %9190 = func.call @cc_cons(%9188, %9189) : (i64, i64) -> i64
      %9191 = func.call @cc_values_pack(%9190) : (i64) -> i64
      func.call @stack_push_pointer(%9188) : (i64) -> ()
      %9192 = llvm.mlir.addressof @str1022 : !llvm.ptr
      %9193 = arith.constant 8 : i64
      %9194 = func.call @cc_make_string(%9192, %9193) : (!llvm.ptr, i64) -> i64
      %9195 = llvm.mlir.addressof @str1023 : !llvm.ptr
      %9196 = arith.constant 11 : i64
      %9197 = func.call @cc_make_string(%9195, %9196) : (!llvm.ptr, i64) -> i64
      %9198 = func.call @cc_intern(%9194, %9197) : (i64, i64) -> i64
      %9199 = func.call @cc_nil_value() : () -> i64
      %9200 = func.call @cc_cons(%9198, %9199) : (i64, i64) -> i64
      %9201 = func.call @cc_values_pack(%9200) : (i64) -> i64
      func.call @stack_push_pointer(%9198) : (i64) -> ()
      %9202 = llvm.mlir.addressof @str1024 : !llvm.ptr
      %9203 = arith.constant 9 : i64
      %9204 = func.call @cc_make_string(%9202, %9203) : (!llvm.ptr, i64) -> i64
      %9205 = llvm.mlir.addressof @str1025 : !llvm.ptr
      %9206 = arith.constant 11 : i64
      %9207 = func.call @cc_make_string(%9205, %9206) : (!llvm.ptr, i64) -> i64
      %9208 = func.call @cc_intern(%9204, %9207) : (i64, i64) -> i64
      %9209 = func.call @cc_nil_value() : () -> i64
      %9210 = func.call @cc_cons(%9208, %9209) : (i64, i64) -> i64
      %9211 = func.call @cc_values_pack(%9210) : (i64) -> i64
      func.call @stack_push_pointer(%9208) : (i64) -> ()
      %9212 = llvm.mlir.addressof @str1026 : !llvm.ptr
      %9213 = arith.constant 9 : i64
      %9214 = func.call @cc_make_string(%9212, %9213) : (!llvm.ptr, i64) -> i64
      %9215 = llvm.mlir.addressof @str1027 : !llvm.ptr
      %9216 = arith.constant 11 : i64
      %9217 = func.call @cc_make_string(%9215, %9216) : (!llvm.ptr, i64) -> i64
      %9218 = func.call @cc_intern(%9214, %9217) : (i64, i64) -> i64
      %9219 = func.call @cc_nil_value() : () -> i64
      %9220 = func.call @cc_cons(%9218, %9219) : (i64, i64) -> i64
      %9221 = func.call @cc_values_pack(%9220) : (i64) -> i64
      func.call @stack_push_pointer(%9218) : (i64) -> ()
      %9222 = llvm.mlir.addressof @str1028 : !llvm.ptr
      %9223 = arith.constant 9 : i64
      %9224 = func.call @cc_make_string(%9222, %9223) : (!llvm.ptr, i64) -> i64
      %9225 = llvm.mlir.addressof @str1029 : !llvm.ptr
      %9226 = arith.constant 11 : i64
      %9227 = func.call @cc_make_string(%9225, %9226) : (!llvm.ptr, i64) -> i64
      %9228 = func.call @cc_intern(%9224, %9227) : (i64, i64) -> i64
      %9229 = func.call @cc_nil_value() : () -> i64
      %9230 = func.call @cc_cons(%9228, %9229) : (i64, i64) -> i64
      %9231 = func.call @cc_values_pack(%9230) : (i64) -> i64
      func.call @stack_push_pointer(%9228) : (i64) -> ()
      %9232 = llvm.mlir.addressof @str1030 : !llvm.ptr
      %9233 = arith.constant 10 : i64
      %9234 = func.call @cc_make_string(%9232, %9233) : (!llvm.ptr, i64) -> i64
      %9235 = llvm.mlir.addressof @str1031 : !llvm.ptr
      %9236 = arith.constant 11 : i64
      %9237 = func.call @cc_make_string(%9235, %9236) : (!llvm.ptr, i64) -> i64
      %9238 = func.call @cc_intern(%9234, %9237) : (i64, i64) -> i64
      %9239 = func.call @cc_nil_value() : () -> i64
      %9240 = func.call @cc_cons(%9238, %9239) : (i64, i64) -> i64
      %9241 = func.call @cc_values_pack(%9240) : (i64) -> i64
      func.call @stack_push_pointer(%9238) : (i64) -> ()
      %9242 = llvm.mlir.addressof @str1032 : !llvm.ptr
      %9243 = arith.constant 9 : i64
      %9244 = func.call @cc_make_string(%9242, %9243) : (!llvm.ptr, i64) -> i64
      %9245 = llvm.mlir.addressof @str1033 : !llvm.ptr
      %9246 = arith.constant 11 : i64
      %9247 = func.call @cc_make_string(%9245, %9246) : (!llvm.ptr, i64) -> i64
      %9248 = func.call @cc_intern(%9244, %9247) : (i64, i64) -> i64
      %9249 = func.call @cc_nil_value() : () -> i64
      %9250 = func.call @cc_cons(%9248, %9249) : (i64, i64) -> i64
      %9251 = func.call @cc_values_pack(%9250) : (i64) -> i64
      func.call @stack_push_pointer(%9248) : (i64) -> ()
      %9252 = llvm.mlir.addressof @str1034 : !llvm.ptr
      %9253 = arith.constant 10 : i64
      %9254 = func.call @cc_make_string(%9252, %9253) : (!llvm.ptr, i64) -> i64
      %9255 = llvm.mlir.addressof @str1035 : !llvm.ptr
      %9256 = arith.constant 11 : i64
      %9257 = func.call @cc_make_string(%9255, %9256) : (!llvm.ptr, i64) -> i64
      %9258 = func.call @cc_intern(%9254, %9257) : (i64, i64) -> i64
      %9259 = func.call @cc_nil_value() : () -> i64
      %9260 = func.call @cc_cons(%9258, %9259) : (i64, i64) -> i64
      %9261 = func.call @cc_values_pack(%9260) : (i64) -> i64
      func.call @stack_push_pointer(%9258) : (i64) -> ()
      %9262 = llvm.mlir.addressof @str1036 : !llvm.ptr
      %9263 = arith.constant 10 : i64
      %9264 = func.call @cc_make_string(%9262, %9263) : (!llvm.ptr, i64) -> i64
      %9265 = llvm.mlir.addressof @str1037 : !llvm.ptr
      %9266 = arith.constant 11 : i64
      %9267 = func.call @cc_make_string(%9265, %9266) : (!llvm.ptr, i64) -> i64
      %9268 = func.call @cc_intern(%9264, %9267) : (i64, i64) -> i64
      %9269 = func.call @cc_nil_value() : () -> i64
      %9270 = func.call @cc_cons(%9268, %9269) : (i64, i64) -> i64
      %9271 = func.call @cc_values_pack(%9270) : (i64) -> i64
      func.call @stack_push_pointer(%9268) : (i64) -> ()
      %9272 = llvm.mlir.addressof @str1038 : !llvm.ptr
      %9273 = arith.constant 9 : i64
      %9274 = func.call @cc_make_string(%9272, %9273) : (!llvm.ptr, i64) -> i64
      %9275 = llvm.mlir.addressof @str1039 : !llvm.ptr
      %9276 = arith.constant 11 : i64
      %9277 = func.call @cc_make_string(%9275, %9276) : (!llvm.ptr, i64) -> i64
      %9278 = func.call @cc_intern(%9274, %9277) : (i64, i64) -> i64
      %9279 = func.call @cc_nil_value() : () -> i64
      %9280 = func.call @cc_cons(%9278, %9279) : (i64, i64) -> i64
      %9281 = func.call @cc_values_pack(%9280) : (i64) -> i64
      func.call @stack_push_pointer(%9278) : (i64) -> ()
      %9282 = llvm.mlir.addressof @str1040 : !llvm.ptr
      %9283 = arith.constant 9 : i64
      %9284 = func.call @cc_make_string(%9282, %9283) : (!llvm.ptr, i64) -> i64
      %9285 = llvm.mlir.addressof @str1041 : !llvm.ptr
      %9286 = arith.constant 11 : i64
      %9287 = func.call @cc_make_string(%9285, %9286) : (!llvm.ptr, i64) -> i64
      %9288 = func.call @cc_intern(%9284, %9287) : (i64, i64) -> i64
      %9289 = func.call @cc_nil_value() : () -> i64
      %9290 = func.call @cc_cons(%9288, %9289) : (i64, i64) -> i64
      %9291 = func.call @cc_values_pack(%9290) : (i64) -> i64
      func.call @stack_push_pointer(%9288) : (i64) -> ()
      %9292 = llvm.mlir.addressof @str1042 : !llvm.ptr
      %9293 = arith.constant 7 : i64
      %9294 = func.call @cc_make_string(%9292, %9293) : (!llvm.ptr, i64) -> i64
      %9295 = llvm.mlir.addressof @str1043 : !llvm.ptr
      %9296 = arith.constant 11 : i64
      %9297 = func.call @cc_make_string(%9295, %9296) : (!llvm.ptr, i64) -> i64
      %9298 = func.call @cc_intern(%9294, %9297) : (i64, i64) -> i64
      %9299 = func.call @cc_nil_value() : () -> i64
      %9300 = func.call @cc_cons(%9298, %9299) : (i64, i64) -> i64
      %9301 = func.call @cc_values_pack(%9300) : (i64) -> i64
      func.call @stack_push_pointer(%9298) : (i64) -> ()
      %9302 = llvm.mlir.addressof @str1044 : !llvm.ptr
      %9303 = arith.constant 16 : i64
      %9304 = func.call @cc_make_string(%9302, %9303) : (!llvm.ptr, i64) -> i64
      %9305 = llvm.mlir.addressof @str1045 : !llvm.ptr
      %9306 = arith.constant 11 : i64
      %9307 = func.call @cc_make_string(%9305, %9306) : (!llvm.ptr, i64) -> i64
      %9308 = func.call @cc_intern(%9304, %9307) : (i64, i64) -> i64
      %9309 = func.call @cc_nil_value() : () -> i64
      %9310 = func.call @cc_cons(%9308, %9309) : (i64, i64) -> i64
      %9311 = func.call @cc_values_pack(%9310) : (i64) -> i64
      func.call @stack_push_pointer(%9308) : (i64) -> ()
      %9312 = llvm.mlir.addressof @str1046 : !llvm.ptr
      %9313 = arith.constant 14 : i64
      %9314 = func.call @cc_make_string(%9312, %9313) : (!llvm.ptr, i64) -> i64
      %9315 = llvm.mlir.addressof @str1047 : !llvm.ptr
      %9316 = arith.constant 11 : i64
      %9317 = func.call @cc_make_string(%9315, %9316) : (!llvm.ptr, i64) -> i64
      %9318 = func.call @cc_intern(%9314, %9317) : (i64, i64) -> i64
      %9319 = func.call @cc_nil_value() : () -> i64
      %9320 = func.call @cc_cons(%9318, %9319) : (i64, i64) -> i64
      %9321 = func.call @cc_values_pack(%9320) : (i64) -> i64
      func.call @stack_push_pointer(%9318) : (i64) -> ()
      %9322 = llvm.mlir.addressof @str1048 : !llvm.ptr
      %9323 = arith.constant 20 : i64
      %9324 = func.call @cc_make_string(%9322, %9323) : (!llvm.ptr, i64) -> i64
      %9325 = llvm.mlir.addressof @str1049 : !llvm.ptr
      %9326 = arith.constant 11 : i64
      %9327 = func.call @cc_make_string(%9325, %9326) : (!llvm.ptr, i64) -> i64
      %9328 = func.call @cc_intern(%9324, %9327) : (i64, i64) -> i64
      %9329 = func.call @cc_nil_value() : () -> i64
      %9330 = func.call @cc_cons(%9328, %9329) : (i64, i64) -> i64
      %9331 = func.call @cc_values_pack(%9330) : (i64) -> i64
      func.call @stack_push_pointer(%9328) : (i64) -> ()
      %9332 = llvm.mlir.addressof @str1050 : !llvm.ptr
      %9333 = arith.constant 10 : i64
      %9334 = func.call @cc_make_string(%9332, %9333) : (!llvm.ptr, i64) -> i64
      %9335 = llvm.mlir.addressof @str1051 : !llvm.ptr
      %9336 = arith.constant 11 : i64
      %9337 = func.call @cc_make_string(%9335, %9336) : (!llvm.ptr, i64) -> i64
      %9338 = func.call @cc_intern(%9334, %9337) : (i64, i64) -> i64
      %9339 = func.call @cc_nil_value() : () -> i64
      %9340 = func.call @cc_cons(%9338, %9339) : (i64, i64) -> i64
      %9341 = func.call @cc_values_pack(%9340) : (i64) -> i64
      func.call @stack_push_pointer(%9338) : (i64) -> ()
      %9342 = llvm.mlir.addressof @str1052 : !llvm.ptr
      %9343 = arith.constant 15 : i64
      %9344 = func.call @cc_make_string(%9342, %9343) : (!llvm.ptr, i64) -> i64
      %9345 = llvm.mlir.addressof @str1053 : !llvm.ptr
      %9346 = arith.constant 11 : i64
      %9347 = func.call @cc_make_string(%9345, %9346) : (!llvm.ptr, i64) -> i64
      %9348 = func.call @cc_intern(%9344, %9347) : (i64, i64) -> i64
      %9349 = func.call @cc_nil_value() : () -> i64
      %9350 = func.call @cc_cons(%9348, %9349) : (i64, i64) -> i64
      %9351 = func.call @cc_values_pack(%9350) : (i64) -> i64
      func.call @stack_push_pointer(%9348) : (i64) -> ()
      %9352 = llvm.mlir.addressof @str1054 : !llvm.ptr
      %9353 = arith.constant 5 : i64
      %9354 = func.call @cc_make_string(%9352, %9353) : (!llvm.ptr, i64) -> i64
      %9355 = llvm.mlir.addressof @str1055 : !llvm.ptr
      %9356 = arith.constant 11 : i64
      %9357 = func.call @cc_make_string(%9355, %9356) : (!llvm.ptr, i64) -> i64
      %9358 = func.call @cc_intern(%9354, %9357) : (i64, i64) -> i64
      %9359 = func.call @cc_nil_value() : () -> i64
      %9360 = func.call @cc_cons(%9358, %9359) : (i64, i64) -> i64
      %9361 = func.call @cc_values_pack(%9360) : (i64) -> i64
      func.call @stack_push_pointer(%9358) : (i64) -> ()
      %9362 = llvm.mlir.addressof @str1056 : !llvm.ptr
      %9363 = arith.constant 17 : i64
      %9364 = func.call @cc_make_string(%9362, %9363) : (!llvm.ptr, i64) -> i64
      %9365 = llvm.mlir.addressof @str1057 : !llvm.ptr
      %9366 = arith.constant 11 : i64
      %9367 = func.call @cc_make_string(%9365, %9366) : (!llvm.ptr, i64) -> i64
      %9368 = func.call @cc_intern(%9364, %9367) : (i64, i64) -> i64
      %9369 = func.call @cc_nil_value() : () -> i64
      %9370 = func.call @cc_cons(%9368, %9369) : (i64, i64) -> i64
      %9371 = func.call @cc_values_pack(%9370) : (i64) -> i64
      func.call @stack_push_pointer(%9368) : (i64) -> ()
      %9372 = llvm.mlir.addressof @str1058 : !llvm.ptr
      %9373 = arith.constant 17 : i64
      %9374 = func.call @cc_make_string(%9372, %9373) : (!llvm.ptr, i64) -> i64
      %9375 = llvm.mlir.addressof @str1059 : !llvm.ptr
      %9376 = arith.constant 11 : i64
      %9377 = func.call @cc_make_string(%9375, %9376) : (!llvm.ptr, i64) -> i64
      %9378 = func.call @cc_intern(%9374, %9377) : (i64, i64) -> i64
      %9379 = func.call @cc_nil_value() : () -> i64
      %9380 = func.call @cc_cons(%9378, %9379) : (i64, i64) -> i64
      %9381 = func.call @cc_values_pack(%9380) : (i64) -> i64
      func.call @stack_push_pointer(%9378) : (i64) -> ()
      %9382 = llvm.mlir.addressof @str1060 : !llvm.ptr
      %9383 = arith.constant 14 : i64
      %9384 = func.call @cc_make_string(%9382, %9383) : (!llvm.ptr, i64) -> i64
      %9385 = llvm.mlir.addressof @str1061 : !llvm.ptr
      %9386 = arith.constant 11 : i64
      %9387 = func.call @cc_make_string(%9385, %9386) : (!llvm.ptr, i64) -> i64
      %9388 = func.call @cc_intern(%9384, %9387) : (i64, i64) -> i64
      %9389 = func.call @cc_nil_value() : () -> i64
      %9390 = func.call @cc_cons(%9388, %9389) : (i64, i64) -> i64
      %9391 = func.call @cc_values_pack(%9390) : (i64) -> i64
      func.call @stack_push_pointer(%9388) : (i64) -> ()
      %9392 = llvm.mlir.addressof @str1062 : !llvm.ptr
      %9393 = arith.constant 19 : i64
      %9394 = func.call @cc_make_string(%9392, %9393) : (!llvm.ptr, i64) -> i64
      %9395 = llvm.mlir.addressof @str1063 : !llvm.ptr
      %9396 = arith.constant 11 : i64
      %9397 = func.call @cc_make_string(%9395, %9396) : (!llvm.ptr, i64) -> i64
      %9398 = func.call @cc_intern(%9394, %9397) : (i64, i64) -> i64
      %9399 = func.call @cc_nil_value() : () -> i64
      %9400 = func.call @cc_cons(%9398, %9399) : (i64, i64) -> i64
      %9401 = func.call @cc_values_pack(%9400) : (i64) -> i64
      func.call @stack_push_pointer(%9398) : (i64) -> ()
      %9402 = llvm.mlir.addressof @str1064 : !llvm.ptr
      %9403 = arith.constant 9 : i64
      %9404 = func.call @cc_make_string(%9402, %9403) : (!llvm.ptr, i64) -> i64
      %9405 = llvm.mlir.addressof @str1065 : !llvm.ptr
      %9406 = arith.constant 11 : i64
      %9407 = func.call @cc_make_string(%9405, %9406) : (!llvm.ptr, i64) -> i64
      %9408 = func.call @cc_intern(%9404, %9407) : (i64, i64) -> i64
      %9409 = func.call @cc_nil_value() : () -> i64
      %9410 = func.call @cc_cons(%9408, %9409) : (i64, i64) -> i64
      %9411 = func.call @cc_values_pack(%9410) : (i64) -> i64
      func.call @stack_push_pointer(%9408) : (i64) -> ()
      %9412 = llvm.mlir.addressof @str1066 : !llvm.ptr
      %9413 = arith.constant 13 : i64
      %9414 = func.call @cc_make_string(%9412, %9413) : (!llvm.ptr, i64) -> i64
      %9415 = llvm.mlir.addressof @str1067 : !llvm.ptr
      %9416 = arith.constant 11 : i64
      %9417 = func.call @cc_make_string(%9415, %9416) : (!llvm.ptr, i64) -> i64
      %9418 = func.call @cc_intern(%9414, %9417) : (i64, i64) -> i64
      %9419 = func.call @cc_nil_value() : () -> i64
      %9420 = func.call @cc_cons(%9418, %9419) : (i64, i64) -> i64
      %9421 = func.call @cc_values_pack(%9420) : (i64) -> i64
      func.call @stack_push_pointer(%9418) : (i64) -> ()
      %9422 = llvm.mlir.addressof @str1068 : !llvm.ptr
      %9423 = arith.constant 5 : i64
      %9424 = func.call @cc_make_string(%9422, %9423) : (!llvm.ptr, i64) -> i64
      %9425 = llvm.mlir.addressof @str1069 : !llvm.ptr
      %9426 = arith.constant 11 : i64
      %9427 = func.call @cc_make_string(%9425, %9426) : (!llvm.ptr, i64) -> i64
      %9428 = func.call @cc_intern(%9424, %9427) : (i64, i64) -> i64
      %9429 = func.call @cc_nil_value() : () -> i64
      %9430 = func.call @cc_cons(%9428, %9429) : (i64, i64) -> i64
      %9431 = func.call @cc_values_pack(%9430) : (i64) -> i64
      func.call @stack_push_pointer(%9428) : (i64) -> ()
      %9432 = llvm.mlir.addressof @str1070 : !llvm.ptr
      %9433 = arith.constant 11 : i64
      %9434 = func.call @cc_make_string(%9432, %9433) : (!llvm.ptr, i64) -> i64
      %9435 = llvm.mlir.addressof @str1071 : !llvm.ptr
      %9436 = arith.constant 11 : i64
      %9437 = func.call @cc_make_string(%9435, %9436) : (!llvm.ptr, i64) -> i64
      %9438 = func.call @cc_intern(%9434, %9437) : (i64, i64) -> i64
      %9439 = func.call @cc_nil_value() : () -> i64
      %9440 = func.call @cc_cons(%9438, %9439) : (i64, i64) -> i64
      %9441 = func.call @cc_values_pack(%9440) : (i64) -> i64
      func.call @stack_push_pointer(%9438) : (i64) -> ()
      %9442 = llvm.mlir.addressof @str1072 : !llvm.ptr
      %9443 = arith.constant 16 : i64
      %9444 = func.call @cc_make_string(%9442, %9443) : (!llvm.ptr, i64) -> i64
      %9445 = llvm.mlir.addressof @str1073 : !llvm.ptr
      %9446 = arith.constant 11 : i64
      %9447 = func.call @cc_make_string(%9445, %9446) : (!llvm.ptr, i64) -> i64
      %9448 = func.call @cc_intern(%9444, %9447) : (i64, i64) -> i64
      %9449 = func.call @cc_nil_value() : () -> i64
      %9450 = func.call @cc_cons(%9448, %9449) : (i64, i64) -> i64
      %9451 = func.call @cc_values_pack(%9450) : (i64) -> i64
      func.call @stack_push_pointer(%9448) : (i64) -> ()
      %9452 = llvm.mlir.addressof @str1074 : !llvm.ptr
      %9453 = arith.constant 12 : i64
      %9454 = func.call @cc_make_string(%9452, %9453) : (!llvm.ptr, i64) -> i64
      %9455 = llvm.mlir.addressof @str1075 : !llvm.ptr
      %9456 = arith.constant 11 : i64
      %9457 = func.call @cc_make_string(%9455, %9456) : (!llvm.ptr, i64) -> i64
      %9458 = func.call @cc_intern(%9454, %9457) : (i64, i64) -> i64
      %9459 = func.call @cc_nil_value() : () -> i64
      %9460 = func.call @cc_cons(%9458, %9459) : (i64, i64) -> i64
      %9461 = func.call @cc_values_pack(%9460) : (i64) -> i64
      func.call @stack_push_pointer(%9458) : (i64) -> ()
      %9462 = llvm.mlir.addressof @str1076 : !llvm.ptr
      %9463 = arith.constant 20 : i64
      %9464 = func.call @cc_make_string(%9462, %9463) : (!llvm.ptr, i64) -> i64
      %9465 = llvm.mlir.addressof @str1077 : !llvm.ptr
      %9466 = arith.constant 11 : i64
      %9467 = func.call @cc_make_string(%9465, %9466) : (!llvm.ptr, i64) -> i64
      %9468 = func.call @cc_intern(%9464, %9467) : (i64, i64) -> i64
      %9469 = func.call @cc_nil_value() : () -> i64
      %9470 = func.call @cc_cons(%9468, %9469) : (i64, i64) -> i64
      %9471 = func.call @cc_values_pack(%9470) : (i64) -> i64
      func.call @stack_push_pointer(%9468) : (i64) -> ()
      %9472 = llvm.mlir.addressof @str1078 : !llvm.ptr
      %9473 = arith.constant 29 : i64
      %9474 = func.call @cc_make_string(%9472, %9473) : (!llvm.ptr, i64) -> i64
      %9475 = llvm.mlir.addressof @str1079 : !llvm.ptr
      %9476 = arith.constant 11 : i64
      %9477 = func.call @cc_make_string(%9475, %9476) : (!llvm.ptr, i64) -> i64
      %9478 = func.call @cc_intern(%9474, %9477) : (i64, i64) -> i64
      %9479 = func.call @cc_nil_value() : () -> i64
      %9480 = func.call @cc_cons(%9478, %9479) : (i64, i64) -> i64
      %9481 = func.call @cc_values_pack(%9480) : (i64) -> i64
      func.call @stack_push_pointer(%9478) : (i64) -> ()
      %9482 = llvm.mlir.addressof @str1080 : !llvm.ptr
      %9483 = arith.constant 14 : i64
      %9484 = func.call @cc_make_string(%9482, %9483) : (!llvm.ptr, i64) -> i64
      %9485 = llvm.mlir.addressof @str1081 : !llvm.ptr
      %9486 = arith.constant 11 : i64
      %9487 = func.call @cc_make_string(%9485, %9486) : (!llvm.ptr, i64) -> i64
      %9488 = func.call @cc_intern(%9484, %9487) : (i64, i64) -> i64
      %9489 = func.call @cc_nil_value() : () -> i64
      %9490 = func.call @cc_cons(%9488, %9489) : (i64, i64) -> i64
      %9491 = func.call @cc_values_pack(%9490) : (i64) -> i64
      func.call @stack_push_pointer(%9488) : (i64) -> ()
      %9492 = llvm.mlir.addressof @str1082 : !llvm.ptr
      %9493 = arith.constant 11 : i64
      %9494 = func.call @cc_make_string(%9492, %9493) : (!llvm.ptr, i64) -> i64
      %9495 = llvm.mlir.addressof @str1083 : !llvm.ptr
      %9496 = arith.constant 11 : i64
      %9497 = func.call @cc_make_string(%9495, %9496) : (!llvm.ptr, i64) -> i64
      %9498 = func.call @cc_intern(%9494, %9497) : (i64, i64) -> i64
      %9499 = func.call @cc_nil_value() : () -> i64
      %9500 = func.call @cc_cons(%9498, %9499) : (i64, i64) -> i64
      %9501 = func.call @cc_values_pack(%9500) : (i64) -> i64
      func.call @stack_push_pointer(%9498) : (i64) -> ()
      %9502 = llvm.mlir.addressof @str1084 : !llvm.ptr
      %9503 = arith.constant 11 : i64
      %9504 = func.call @cc_make_string(%9502, %9503) : (!llvm.ptr, i64) -> i64
      %9505 = llvm.mlir.addressof @str1085 : !llvm.ptr
      %9506 = arith.constant 11 : i64
      %9507 = func.call @cc_make_string(%9505, %9506) : (!llvm.ptr, i64) -> i64
      %9508 = func.call @cc_intern(%9504, %9507) : (i64, i64) -> i64
      %9509 = func.call @cc_nil_value() : () -> i64
      %9510 = func.call @cc_cons(%9508, %9509) : (i64, i64) -> i64
      %9511 = func.call @cc_values_pack(%9510) : (i64) -> i64
      func.call @stack_push_pointer(%9508) : (i64) -> ()
      %9512 = llvm.mlir.addressof @str1086 : !llvm.ptr
      %9513 = arith.constant 13 : i64
      %9514 = func.call @cc_make_string(%9512, %9513) : (!llvm.ptr, i64) -> i64
      %9515 = llvm.mlir.addressof @str1087 : !llvm.ptr
      %9516 = arith.constant 11 : i64
      %9517 = func.call @cc_make_string(%9515, %9516) : (!llvm.ptr, i64) -> i64
      %9518 = func.call @cc_intern(%9514, %9517) : (i64, i64) -> i64
      %9519 = func.call @cc_nil_value() : () -> i64
      %9520 = func.call @cc_cons(%9518, %9519) : (i64, i64) -> i64
      %9521 = func.call @cc_values_pack(%9520) : (i64) -> i64
      func.call @stack_push_pointer(%9518) : (i64) -> ()
      %9522 = llvm.mlir.addressof @str1088 : !llvm.ptr
      %9523 = arith.constant 10 : i64
      %9524 = func.call @cc_make_string(%9522, %9523) : (!llvm.ptr, i64) -> i64
      %9525 = llvm.mlir.addressof @str1089 : !llvm.ptr
      %9526 = arith.constant 11 : i64
      %9527 = func.call @cc_make_string(%9525, %9526) : (!llvm.ptr, i64) -> i64
      %9528 = func.call @cc_intern(%9524, %9527) : (i64, i64) -> i64
      %9529 = func.call @cc_nil_value() : () -> i64
      %9530 = func.call @cc_cons(%9528, %9529) : (i64, i64) -> i64
      %9531 = func.call @cc_values_pack(%9530) : (i64) -> i64
      func.call @stack_push_pointer(%9528) : (i64) -> ()
      %9532 = llvm.mlir.addressof @str1090 : !llvm.ptr
      %9533 = arith.constant 11 : i64
      %9534 = func.call @cc_make_string(%9532, %9533) : (!llvm.ptr, i64) -> i64
      %9535 = llvm.mlir.addressof @str1091 : !llvm.ptr
      %9536 = arith.constant 11 : i64
      %9537 = func.call @cc_make_string(%9535, %9536) : (!llvm.ptr, i64) -> i64
      %9538 = func.call @cc_intern(%9534, %9537) : (i64, i64) -> i64
      %9539 = func.call @cc_nil_value() : () -> i64
      %9540 = func.call @cc_cons(%9538, %9539) : (i64, i64) -> i64
      %9541 = func.call @cc_values_pack(%9540) : (i64) -> i64
      func.call @stack_push_pointer(%9538) : (i64) -> ()
      %9542 = llvm.mlir.addressof @str1092 : !llvm.ptr
      %9543 = arith.constant 6 : i64
      %9544 = func.call @cc_make_string(%9542, %9543) : (!llvm.ptr, i64) -> i64
      %9545 = llvm.mlir.addressof @str1093 : !llvm.ptr
      %9546 = arith.constant 11 : i64
      %9547 = func.call @cc_make_string(%9545, %9546) : (!llvm.ptr, i64) -> i64
      %9548 = func.call @cc_intern(%9544, %9547) : (i64, i64) -> i64
      %9549 = func.call @cc_nil_value() : () -> i64
      %9550 = func.call @cc_cons(%9548, %9549) : (i64, i64) -> i64
      %9551 = func.call @cc_values_pack(%9550) : (i64) -> i64
      func.call @stack_push_pointer(%9548) : (i64) -> ()
      %9552 = llvm.mlir.addressof @str1094 : !llvm.ptr
      %9553 = arith.constant 22 : i64
      %9554 = func.call @cc_make_string(%9552, %9553) : (!llvm.ptr, i64) -> i64
      %9555 = llvm.mlir.addressof @str1095 : !llvm.ptr
      %9556 = arith.constant 11 : i64
      %9557 = func.call @cc_make_string(%9555, %9556) : (!llvm.ptr, i64) -> i64
      %9558 = func.call @cc_intern(%9554, %9557) : (i64, i64) -> i64
      %9559 = func.call @cc_nil_value() : () -> i64
      %9560 = func.call @cc_cons(%9558, %9559) : (i64, i64) -> i64
      %9561 = func.call @cc_values_pack(%9560) : (i64) -> i64
      func.call @stack_push_pointer(%9558) : (i64) -> ()
      %9562 = llvm.mlir.addressof @str1096 : !llvm.ptr
      %9563 = arith.constant 32 : i64
      %9564 = func.call @cc_make_string(%9562, %9563) : (!llvm.ptr, i64) -> i64
      %9565 = llvm.mlir.addressof @str1097 : !llvm.ptr
      %9566 = arith.constant 11 : i64
      %9567 = func.call @cc_make_string(%9565, %9566) : (!llvm.ptr, i64) -> i64
      %9568 = func.call @cc_intern(%9564, %9567) : (i64, i64) -> i64
      %9569 = func.call @cc_nil_value() : () -> i64
      %9570 = func.call @cc_cons(%9568, %9569) : (i64, i64) -> i64
      %9571 = func.call @cc_values_pack(%9570) : (i64) -> i64
      func.call @stack_push_pointer(%9568) : (i64) -> ()
      %9572 = llvm.mlir.addressof @str1098 : !llvm.ptr
      %9573 = arith.constant 23 : i64
      %9574 = func.call @cc_make_string(%9572, %9573) : (!llvm.ptr, i64) -> i64
      %9575 = llvm.mlir.addressof @str1099 : !llvm.ptr
      %9576 = arith.constant 11 : i64
      %9577 = func.call @cc_make_string(%9575, %9576) : (!llvm.ptr, i64) -> i64
      %9578 = func.call @cc_intern(%9574, %9577) : (i64, i64) -> i64
      %9579 = func.call @cc_nil_value() : () -> i64
      %9580 = func.call @cc_cons(%9578, %9579) : (i64, i64) -> i64
      %9581 = func.call @cc_values_pack(%9580) : (i64) -> i64
      func.call @stack_push_pointer(%9578) : (i64) -> ()
      %9582 = llvm.mlir.addressof @str1100 : !llvm.ptr
      %9583 = arith.constant 24 : i64
      %9584 = func.call @cc_make_string(%9582, %9583) : (!llvm.ptr, i64) -> i64
      %9585 = llvm.mlir.addressof @str1101 : !llvm.ptr
      %9586 = arith.constant 11 : i64
      %9587 = func.call @cc_make_string(%9585, %9586) : (!llvm.ptr, i64) -> i64
      %9588 = func.call @cc_intern(%9584, %9587) : (i64, i64) -> i64
      %9589 = func.call @cc_nil_value() : () -> i64
      %9590 = func.call @cc_cons(%9588, %9589) : (i64, i64) -> i64
      %9591 = func.call @cc_values_pack(%9590) : (i64) -> i64
      func.call @stack_push_pointer(%9588) : (i64) -> ()
      %9592 = llvm.mlir.addressof @str1102 : !llvm.ptr
      %9593 = arith.constant 5 : i64
      %9594 = func.call @cc_make_string(%9592, %9593) : (!llvm.ptr, i64) -> i64
      %9595 = llvm.mlir.addressof @str1103 : !llvm.ptr
      %9596 = arith.constant 11 : i64
      %9597 = func.call @cc_make_string(%9595, %9596) : (!llvm.ptr, i64) -> i64
      %9598 = func.call @cc_intern(%9594, %9597) : (i64, i64) -> i64
      %9599 = func.call @cc_nil_value() : () -> i64
      %9600 = func.call @cc_cons(%9598, %9599) : (i64, i64) -> i64
      %9601 = func.call @cc_values_pack(%9600) : (i64) -> i64
      func.call @stack_push_pointer(%9598) : (i64) -> ()
      %9602 = llvm.mlir.addressof @str1104 : !llvm.ptr
      %9603 = arith.constant 16 : i64
      %9604 = func.call @cc_make_string(%9602, %9603) : (!llvm.ptr, i64) -> i64
      %9605 = llvm.mlir.addressof @str1105 : !llvm.ptr
      %9606 = arith.constant 11 : i64
      %9607 = func.call @cc_make_string(%9605, %9606) : (!llvm.ptr, i64) -> i64
      %9608 = func.call @cc_intern(%9604, %9607) : (i64, i64) -> i64
      %9609 = func.call @cc_nil_value() : () -> i64
      %9610 = func.call @cc_cons(%9608, %9609) : (i64, i64) -> i64
      %9611 = func.call @cc_values_pack(%9610) : (i64) -> i64
      func.call @stack_push_pointer(%9608) : (i64) -> ()
      %9612 = llvm.mlir.addressof @str1106 : !llvm.ptr
      %9613 = arith.constant 10 : i64
      %9614 = func.call @cc_make_string(%9612, %9613) : (!llvm.ptr, i64) -> i64
      %9615 = llvm.mlir.addressof @str1107 : !llvm.ptr
      %9616 = arith.constant 11 : i64
      %9617 = func.call @cc_make_string(%9615, %9616) : (!llvm.ptr, i64) -> i64
      %9618 = func.call @cc_intern(%9614, %9617) : (i64, i64) -> i64
      %9619 = func.call @cc_nil_value() : () -> i64
      %9620 = func.call @cc_cons(%9618, %9619) : (i64, i64) -> i64
      %9621 = func.call @cc_values_pack(%9620) : (i64) -> i64
      func.call @stack_push_pointer(%9618) : (i64) -> ()
      %9622 = llvm.mlir.addressof @str1108 : !llvm.ptr
      %9623 = arith.constant 9 : i64
      %9624 = func.call @cc_make_string(%9622, %9623) : (!llvm.ptr, i64) -> i64
      %9625 = llvm.mlir.addressof @str1109 : !llvm.ptr
      %9626 = arith.constant 11 : i64
      %9627 = func.call @cc_make_string(%9625, %9626) : (!llvm.ptr, i64) -> i64
      %9628 = func.call @cc_intern(%9624, %9627) : (i64, i64) -> i64
      %9629 = func.call @cc_nil_value() : () -> i64
      %9630 = func.call @cc_cons(%9628, %9629) : (i64, i64) -> i64
      %9631 = func.call @cc_values_pack(%9630) : (i64) -> i64
      func.call @stack_push_pointer(%9628) : (i64) -> ()
      %9632 = llvm.mlir.addressof @str1110 : !llvm.ptr
      %9633 = arith.constant 6 : i64
      %9634 = func.call @cc_make_string(%9632, %9633) : (!llvm.ptr, i64) -> i64
      %9635 = llvm.mlir.addressof @str1111 : !llvm.ptr
      %9636 = arith.constant 11 : i64
      %9637 = func.call @cc_make_string(%9635, %9636) : (!llvm.ptr, i64) -> i64
      %9638 = func.call @cc_intern(%9634, %9637) : (i64, i64) -> i64
      %9639 = func.call @cc_nil_value() : () -> i64
      %9640 = func.call @cc_cons(%9638, %9639) : (i64, i64) -> i64
      %9641 = func.call @cc_values_pack(%9640) : (i64) -> i64
      func.call @stack_push_pointer(%9638) : (i64) -> ()
      %9642 = llvm.mlir.addressof @str1112 : !llvm.ptr
      %9643 = arith.constant 6 : i64
      %9644 = func.call @cc_make_string(%9642, %9643) : (!llvm.ptr, i64) -> i64
      %9645 = llvm.mlir.addressof @str1113 : !llvm.ptr
      %9646 = arith.constant 11 : i64
      %9647 = func.call @cc_make_string(%9645, %9646) : (!llvm.ptr, i64) -> i64
      %9648 = func.call @cc_intern(%9644, %9647) : (i64, i64) -> i64
      %9649 = func.call @cc_nil_value() : () -> i64
      %9650 = func.call @cc_cons(%9648, %9649) : (i64, i64) -> i64
      %9651 = func.call @cc_values_pack(%9650) : (i64) -> i64
      func.call @stack_push_pointer(%9648) : (i64) -> ()
      %9652 = llvm.mlir.addressof @str1114 : !llvm.ptr
      %9653 = arith.constant 7 : i64
      %9654 = func.call @cc_make_string(%9652, %9653) : (!llvm.ptr, i64) -> i64
      %9655 = llvm.mlir.addressof @str1115 : !llvm.ptr
      %9656 = arith.constant 11 : i64
      %9657 = func.call @cc_make_string(%9655, %9656) : (!llvm.ptr, i64) -> i64
      %9658 = func.call @cc_intern(%9654, %9657) : (i64, i64) -> i64
      %9659 = func.call @cc_nil_value() : () -> i64
      %9660 = func.call @cc_cons(%9658, %9659) : (i64, i64) -> i64
      %9661 = func.call @cc_values_pack(%9660) : (i64) -> i64
      func.call @stack_push_pointer(%9658) : (i64) -> ()
      %9662 = llvm.mlir.addressof @str1116 : !llvm.ptr
      %9663 = arith.constant 30 : i64
      %9664 = func.call @cc_make_string(%9662, %9663) : (!llvm.ptr, i64) -> i64
      %9665 = llvm.mlir.addressof @str1117 : !llvm.ptr
      %9666 = arith.constant 11 : i64
      %9667 = func.call @cc_make_string(%9665, %9666) : (!llvm.ptr, i64) -> i64
      %9668 = func.call @cc_intern(%9664, %9667) : (i64, i64) -> i64
      %9669 = func.call @cc_nil_value() : () -> i64
      %9670 = func.call @cc_cons(%9668, %9669) : (i64, i64) -> i64
      %9671 = func.call @cc_values_pack(%9670) : (i64) -> i64
      func.call @stack_push_pointer(%9668) : (i64) -> ()
      %9672 = llvm.mlir.addressof @str1118 : !llvm.ptr
      %9673 = arith.constant 7 : i64
      %9674 = func.call @cc_make_string(%9672, %9673) : (!llvm.ptr, i64) -> i64
      %9675 = llvm.mlir.addressof @str1119 : !llvm.ptr
      %9676 = arith.constant 11 : i64
      %9677 = func.call @cc_make_string(%9675, %9676) : (!llvm.ptr, i64) -> i64
      %9678 = func.call @cc_intern(%9674, %9677) : (i64, i64) -> i64
      %9679 = func.call @cc_nil_value() : () -> i64
      %9680 = func.call @cc_cons(%9678, %9679) : (i64, i64) -> i64
      %9681 = func.call @cc_values_pack(%9680) : (i64) -> i64
      func.call @stack_push_pointer(%9678) : (i64) -> ()
      %9682 = llvm.mlir.addressof @str1120 : !llvm.ptr
      %9683 = arith.constant 20 : i64
      %9684 = func.call @cc_make_string(%9682, %9683) : (!llvm.ptr, i64) -> i64
      %9685 = llvm.mlir.addressof @str1121 : !llvm.ptr
      %9686 = arith.constant 11 : i64
      %9687 = func.call @cc_make_string(%9685, %9686) : (!llvm.ptr, i64) -> i64
      %9688 = func.call @cc_intern(%9684, %9687) : (i64, i64) -> i64
      %9689 = func.call @cc_nil_value() : () -> i64
      %9690 = func.call @cc_cons(%9688, %9689) : (i64, i64) -> i64
      %9691 = func.call @cc_values_pack(%9690) : (i64) -> i64
      func.call @stack_push_pointer(%9688) : (i64) -> ()
      %9692 = llvm.mlir.addressof @str1122 : !llvm.ptr
      %9693 = arith.constant 23 : i64
      %9694 = func.call @cc_make_string(%9692, %9693) : (!llvm.ptr, i64) -> i64
      %9695 = llvm.mlir.addressof @str1123 : !llvm.ptr
      %9696 = arith.constant 11 : i64
      %9697 = func.call @cc_make_string(%9695, %9696) : (!llvm.ptr, i64) -> i64
      %9698 = func.call @cc_intern(%9694, %9697) : (i64, i64) -> i64
      %9699 = func.call @cc_nil_value() : () -> i64
      %9700 = func.call @cc_cons(%9698, %9699) : (i64, i64) -> i64
      %9701 = func.call @cc_values_pack(%9700) : (i64) -> i64
      func.call @stack_push_pointer(%9698) : (i64) -> ()
      %9702 = llvm.mlir.addressof @str1124 : !llvm.ptr
      %9703 = arith.constant 27 : i64
      %9704 = func.call @cc_make_string(%9702, %9703) : (!llvm.ptr, i64) -> i64
      %9705 = llvm.mlir.addressof @str1125 : !llvm.ptr
      %9706 = arith.constant 11 : i64
      %9707 = func.call @cc_make_string(%9705, %9706) : (!llvm.ptr, i64) -> i64
      %9708 = func.call @cc_intern(%9704, %9707) : (i64, i64) -> i64
      %9709 = func.call @cc_nil_value() : () -> i64
      %9710 = func.call @cc_cons(%9708, %9709) : (i64, i64) -> i64
      %9711 = func.call @cc_values_pack(%9710) : (i64) -> i64
      func.call @stack_push_pointer(%9708) : (i64) -> ()
      %9712 = llvm.mlir.addressof @str1126 : !llvm.ptr
      %9713 = arith.constant 25 : i64
      %9714 = func.call @cc_make_string(%9712, %9713) : (!llvm.ptr, i64) -> i64
      %9715 = llvm.mlir.addressof @str1127 : !llvm.ptr
      %9716 = arith.constant 11 : i64
      %9717 = func.call @cc_make_string(%9715, %9716) : (!llvm.ptr, i64) -> i64
      %9718 = func.call @cc_intern(%9714, %9717) : (i64, i64) -> i64
      %9719 = func.call @cc_nil_value() : () -> i64
      %9720 = func.call @cc_cons(%9718, %9719) : (i64, i64) -> i64
      %9721 = func.call @cc_values_pack(%9720) : (i64) -> i64
      func.call @stack_push_pointer(%9718) : (i64) -> ()
      %9722 = llvm.mlir.addressof @str1128 : !llvm.ptr
      %9723 = arith.constant 38 : i64
      %9724 = func.call @cc_make_string(%9722, %9723) : (!llvm.ptr, i64) -> i64
      %9725 = llvm.mlir.addressof @str1129 : !llvm.ptr
      %9726 = arith.constant 11 : i64
      %9727 = func.call @cc_make_string(%9725, %9726) : (!llvm.ptr, i64) -> i64
      %9728 = func.call @cc_intern(%9724, %9727) : (i64, i64) -> i64
      %9729 = func.call @cc_nil_value() : () -> i64
      %9730 = func.call @cc_cons(%9728, %9729) : (i64, i64) -> i64
      %9731 = func.call @cc_values_pack(%9730) : (i64) -> i64
      func.call @stack_push_pointer(%9728) : (i64) -> ()
      %9732 = llvm.mlir.addressof @str1130 : !llvm.ptr
      %9733 = arith.constant 36 : i64
      %9734 = func.call @cc_make_string(%9732, %9733) : (!llvm.ptr, i64) -> i64
      %9735 = llvm.mlir.addressof @str1131 : !llvm.ptr
      %9736 = arith.constant 11 : i64
      %9737 = func.call @cc_make_string(%9735, %9736) : (!llvm.ptr, i64) -> i64
      %9738 = func.call @cc_intern(%9734, %9737) : (i64, i64) -> i64
      %9739 = func.call @cc_nil_value() : () -> i64
      %9740 = func.call @cc_cons(%9738, %9739) : (i64, i64) -> i64
      %9741 = func.call @cc_values_pack(%9740) : (i64) -> i64
      func.call @stack_push_pointer(%9738) : (i64) -> ()
      %9742 = llvm.mlir.addressof @str1132 : !llvm.ptr
      %9743 = arith.constant 37 : i64
      %9744 = func.call @cc_make_string(%9742, %9743) : (!llvm.ptr, i64) -> i64
      %9745 = llvm.mlir.addressof @str1133 : !llvm.ptr
      %9746 = arith.constant 11 : i64
      %9747 = func.call @cc_make_string(%9745, %9746) : (!llvm.ptr, i64) -> i64
      %9748 = func.call @cc_intern(%9744, %9747) : (i64, i64) -> i64
      %9749 = func.call @cc_nil_value() : () -> i64
      %9750 = func.call @cc_cons(%9748, %9749) : (i64, i64) -> i64
      %9751 = func.call @cc_values_pack(%9750) : (i64) -> i64
      func.call @stack_push_pointer(%9748) : (i64) -> ()
      %9752 = llvm.mlir.addressof @str1134 : !llvm.ptr
      %9753 = arith.constant 38 : i64
      %9754 = func.call @cc_make_string(%9752, %9753) : (!llvm.ptr, i64) -> i64
      %9755 = llvm.mlir.addressof @str1135 : !llvm.ptr
      %9756 = arith.constant 11 : i64
      %9757 = func.call @cc_make_string(%9755, %9756) : (!llvm.ptr, i64) -> i64
      %9758 = func.call @cc_intern(%9754, %9757) : (i64, i64) -> i64
      %9759 = func.call @cc_nil_value() : () -> i64
      %9760 = func.call @cc_cons(%9758, %9759) : (i64, i64) -> i64
      %9761 = func.call @cc_values_pack(%9760) : (i64) -> i64
      func.call @stack_push_pointer(%9758) : (i64) -> ()
      %9762 = llvm.mlir.addressof @str1136 : !llvm.ptr
      %9763 = arith.constant 26 : i64
      %9764 = func.call @cc_make_string(%9762, %9763) : (!llvm.ptr, i64) -> i64
      %9765 = llvm.mlir.addressof @str1137 : !llvm.ptr
      %9766 = arith.constant 11 : i64
      %9767 = func.call @cc_make_string(%9765, %9766) : (!llvm.ptr, i64) -> i64
      %9768 = func.call @cc_intern(%9764, %9767) : (i64, i64) -> i64
      %9769 = func.call @cc_nil_value() : () -> i64
      %9770 = func.call @cc_cons(%9768, %9769) : (i64, i64) -> i64
      %9771 = func.call @cc_values_pack(%9770) : (i64) -> i64
      func.call @stack_push_pointer(%9768) : (i64) -> ()
      %9772 = llvm.mlir.addressof @str1138 : !llvm.ptr
      %9773 = arith.constant 27 : i64
      %9774 = func.call @cc_make_string(%9772, %9773) : (!llvm.ptr, i64) -> i64
      %9775 = llvm.mlir.addressof @str1139 : !llvm.ptr
      %9776 = arith.constant 11 : i64
      %9777 = func.call @cc_make_string(%9775, %9776) : (!llvm.ptr, i64) -> i64
      %9778 = func.call @cc_intern(%9774, %9777) : (i64, i64) -> i64
      %9779 = func.call @cc_nil_value() : () -> i64
      %9780 = func.call @cc_cons(%9778, %9779) : (i64, i64) -> i64
      %9781 = func.call @cc_values_pack(%9780) : (i64) -> i64
      func.call @stack_push_pointer(%9778) : (i64) -> ()
      %9782 = llvm.mlir.addressof @str1140 : !llvm.ptr
      %9783 = arith.constant 27 : i64
      %9784 = func.call @cc_make_string(%9782, %9783) : (!llvm.ptr, i64) -> i64
      %9785 = llvm.mlir.addressof @str1141 : !llvm.ptr
      %9786 = arith.constant 11 : i64
      %9787 = func.call @cc_make_string(%9785, %9786) : (!llvm.ptr, i64) -> i64
      %9788 = func.call @cc_intern(%9784, %9787) : (i64, i64) -> i64
      %9789 = func.call @cc_nil_value() : () -> i64
      %9790 = func.call @cc_cons(%9788, %9789) : (i64, i64) -> i64
      %9791 = func.call @cc_values_pack(%9790) : (i64) -> i64
      func.call @stack_push_pointer(%9788) : (i64) -> ()
      %9792 = llvm.mlir.addressof @str1142 : !llvm.ptr
      %9793 = arith.constant 25 : i64
      %9794 = func.call @cc_make_string(%9792, %9793) : (!llvm.ptr, i64) -> i64
      %9795 = llvm.mlir.addressof @str1143 : !llvm.ptr
      %9796 = arith.constant 11 : i64
      %9797 = func.call @cc_make_string(%9795, %9796) : (!llvm.ptr, i64) -> i64
      %9798 = func.call @cc_intern(%9794, %9797) : (i64, i64) -> i64
      %9799 = func.call @cc_nil_value() : () -> i64
      %9800 = func.call @cc_cons(%9798, %9799) : (i64, i64) -> i64
      %9801 = func.call @cc_values_pack(%9800) : (i64) -> i64
      func.call @stack_push_pointer(%9798) : (i64) -> ()
      %9802 = llvm.mlir.addressof @str1144 : !llvm.ptr
      %9803 = arith.constant 38 : i64
      %9804 = func.call @cc_make_string(%9802, %9803) : (!llvm.ptr, i64) -> i64
      %9805 = llvm.mlir.addressof @str1145 : !llvm.ptr
      %9806 = arith.constant 11 : i64
      %9807 = func.call @cc_make_string(%9805, %9806) : (!llvm.ptr, i64) -> i64
      %9808 = func.call @cc_intern(%9804, %9807) : (i64, i64) -> i64
      %9809 = func.call @cc_nil_value() : () -> i64
      %9810 = func.call @cc_cons(%9808, %9809) : (i64, i64) -> i64
      %9811 = func.call @cc_values_pack(%9810) : (i64) -> i64
      func.call @stack_push_pointer(%9808) : (i64) -> ()
      %9812 = llvm.mlir.addressof @str1146 : !llvm.ptr
      %9813 = arith.constant 36 : i64
      %9814 = func.call @cc_make_string(%9812, %9813) : (!llvm.ptr, i64) -> i64
      %9815 = llvm.mlir.addressof @str1147 : !llvm.ptr
      %9816 = arith.constant 11 : i64
      %9817 = func.call @cc_make_string(%9815, %9816) : (!llvm.ptr, i64) -> i64
      %9818 = func.call @cc_intern(%9814, %9817) : (i64, i64) -> i64
      %9819 = func.call @cc_nil_value() : () -> i64
      %9820 = func.call @cc_cons(%9818, %9819) : (i64, i64) -> i64
      %9821 = func.call @cc_values_pack(%9820) : (i64) -> i64
      func.call @stack_push_pointer(%9818) : (i64) -> ()
      %9822 = llvm.mlir.addressof @str1148 : !llvm.ptr
      %9823 = arith.constant 37 : i64
      %9824 = func.call @cc_make_string(%9822, %9823) : (!llvm.ptr, i64) -> i64
      %9825 = llvm.mlir.addressof @str1149 : !llvm.ptr
      %9826 = arith.constant 11 : i64
      %9827 = func.call @cc_make_string(%9825, %9826) : (!llvm.ptr, i64) -> i64
      %9828 = func.call @cc_intern(%9824, %9827) : (i64, i64) -> i64
      %9829 = func.call @cc_nil_value() : () -> i64
      %9830 = func.call @cc_cons(%9828, %9829) : (i64, i64) -> i64
      %9831 = func.call @cc_values_pack(%9830) : (i64) -> i64
      func.call @stack_push_pointer(%9828) : (i64) -> ()
      %9832 = llvm.mlir.addressof @str1150 : !llvm.ptr
      %9833 = arith.constant 38 : i64
      %9834 = func.call @cc_make_string(%9832, %9833) : (!llvm.ptr, i64) -> i64
      %9835 = llvm.mlir.addressof @str1151 : !llvm.ptr
      %9836 = arith.constant 11 : i64
      %9837 = func.call @cc_make_string(%9835, %9836) : (!llvm.ptr, i64) -> i64
      %9838 = func.call @cc_intern(%9834, %9837) : (i64, i64) -> i64
      %9839 = func.call @cc_nil_value() : () -> i64
      %9840 = func.call @cc_cons(%9838, %9839) : (i64, i64) -> i64
      %9841 = func.call @cc_values_pack(%9840) : (i64) -> i64
      func.call @stack_push_pointer(%9838) : (i64) -> ()
      %9842 = llvm.mlir.addressof @str1152 : !llvm.ptr
      %9843 = arith.constant 26 : i64
      %9844 = func.call @cc_make_string(%9842, %9843) : (!llvm.ptr, i64) -> i64
      %9845 = llvm.mlir.addressof @str1153 : !llvm.ptr
      %9846 = arith.constant 11 : i64
      %9847 = func.call @cc_make_string(%9845, %9846) : (!llvm.ptr, i64) -> i64
      %9848 = func.call @cc_intern(%9844, %9847) : (i64, i64) -> i64
      %9849 = func.call @cc_nil_value() : () -> i64
      %9850 = func.call @cc_cons(%9848, %9849) : (i64, i64) -> i64
      %9851 = func.call @cc_values_pack(%9850) : (i64) -> i64
      func.call @stack_push_pointer(%9848) : (i64) -> ()
      %9852 = llvm.mlir.addressof @str1154 : !llvm.ptr
      %9853 = arith.constant 27 : i64
      %9854 = func.call @cc_make_string(%9852, %9853) : (!llvm.ptr, i64) -> i64
      %9855 = llvm.mlir.addressof @str1155 : !llvm.ptr
      %9856 = arith.constant 11 : i64
      %9857 = func.call @cc_make_string(%9855, %9856) : (!llvm.ptr, i64) -> i64
      %9858 = func.call @cc_intern(%9854, %9857) : (i64, i64) -> i64
      %9859 = func.call @cc_nil_value() : () -> i64
      %9860 = func.call @cc_cons(%9858, %9859) : (i64, i64) -> i64
      %9861 = func.call @cc_values_pack(%9860) : (i64) -> i64
      func.call @stack_push_pointer(%9858) : (i64) -> ()
      %9862 = llvm.mlir.addressof @str1156 : !llvm.ptr
      %9863 = arith.constant 10 : i64
      %9864 = func.call @cc_make_string(%9862, %9863) : (!llvm.ptr, i64) -> i64
      %9865 = llvm.mlir.addressof @str1157 : !llvm.ptr
      %9866 = arith.constant 11 : i64
      %9867 = func.call @cc_make_string(%9865, %9866) : (!llvm.ptr, i64) -> i64
      %9868 = func.call @cc_intern(%9864, %9867) : (i64, i64) -> i64
      %9869 = func.call @cc_nil_value() : () -> i64
      %9870 = func.call @cc_cons(%9868, %9869) : (i64, i64) -> i64
      %9871 = func.call @cc_values_pack(%9870) : (i64) -> i64
      func.call @stack_push_pointer(%9868) : (i64) -> ()
      %9872 = llvm.mlir.addressof @str1158 : !llvm.ptr
      %9873 = arith.constant 18 : i64
      %9874 = func.call @cc_make_string(%9872, %9873) : (!llvm.ptr, i64) -> i64
      %9875 = llvm.mlir.addressof @str1159 : !llvm.ptr
      %9876 = arith.constant 11 : i64
      %9877 = func.call @cc_make_string(%9875, %9876) : (!llvm.ptr, i64) -> i64
      %9878 = func.call @cc_intern(%9874, %9877) : (i64, i64) -> i64
      %9879 = func.call @cc_nil_value() : () -> i64
      %9880 = func.call @cc_cons(%9878, %9879) : (i64, i64) -> i64
      %9881 = func.call @cc_values_pack(%9880) : (i64) -> i64
      func.call @stack_push_pointer(%9878) : (i64) -> ()
      %9882 = llvm.mlir.addressof @str1160 : !llvm.ptr
      %9883 = arith.constant 27 : i64
      %9884 = func.call @cc_make_string(%9882, %9883) : (!llvm.ptr, i64) -> i64
      %9885 = llvm.mlir.addressof @str1161 : !llvm.ptr
      %9886 = arith.constant 11 : i64
      %9887 = func.call @cc_make_string(%9885, %9886) : (!llvm.ptr, i64) -> i64
      %9888 = func.call @cc_intern(%9884, %9887) : (i64, i64) -> i64
      %9889 = func.call @cc_nil_value() : () -> i64
      %9890 = func.call @cc_cons(%9888, %9889) : (i64, i64) -> i64
      %9891 = func.call @cc_values_pack(%9890) : (i64) -> i64
      func.call @stack_push_pointer(%9888) : (i64) -> ()
      %9892 = llvm.mlir.addressof @str1162 : !llvm.ptr
      %9893 = arith.constant 6 : i64
      %9894 = func.call @cc_make_string(%9892, %9893) : (!llvm.ptr, i64) -> i64
      %9895 = llvm.mlir.addressof @str1163 : !llvm.ptr
      %9896 = arith.constant 11 : i64
      %9897 = func.call @cc_make_string(%9895, %9896) : (!llvm.ptr, i64) -> i64
      %9898 = func.call @cc_intern(%9894, %9897) : (i64, i64) -> i64
      %9899 = func.call @cc_nil_value() : () -> i64
      %9900 = func.call @cc_cons(%9898, %9899) : (i64, i64) -> i64
      %9901 = func.call @cc_values_pack(%9900) : (i64) -> i64
      func.call @stack_push_pointer(%9898) : (i64) -> ()
      %9902 = llvm.mlir.addressof @str1164 : !llvm.ptr
      %9903 = arith.constant 18 : i64
      %9904 = func.call @cc_make_string(%9902, %9903) : (!llvm.ptr, i64) -> i64
      %9905 = llvm.mlir.addressof @str1165 : !llvm.ptr
      %9906 = arith.constant 11 : i64
      %9907 = func.call @cc_make_string(%9905, %9906) : (!llvm.ptr, i64) -> i64
      %9908 = func.call @cc_intern(%9904, %9907) : (i64, i64) -> i64
      %9909 = func.call @cc_nil_value() : () -> i64
      %9910 = func.call @cc_cons(%9908, %9909) : (i64, i64) -> i64
      %9911 = func.call @cc_values_pack(%9910) : (i64) -> i64
      func.call @stack_push_pointer(%9908) : (i64) -> ()
      %9912 = llvm.mlir.addressof @str1166 : !llvm.ptr
      %9913 = arith.constant 26 : i64
      %9914 = func.call @cc_make_string(%9912, %9913) : (!llvm.ptr, i64) -> i64
      %9915 = llvm.mlir.addressof @str1167 : !llvm.ptr
      %9916 = arith.constant 11 : i64
      %9917 = func.call @cc_make_string(%9915, %9916) : (!llvm.ptr, i64) -> i64
      %9918 = func.call @cc_intern(%9914, %9917) : (i64, i64) -> i64
      %9919 = func.call @cc_nil_value() : () -> i64
      %9920 = func.call @cc_cons(%9918, %9919) : (i64, i64) -> i64
      %9921 = func.call @cc_values_pack(%9920) : (i64) -> i64
      func.call @stack_push_pointer(%9918) : (i64) -> ()
      %9922 = llvm.mlir.addressof @str1168 : !llvm.ptr
      %9923 = arith.constant 20 : i64
      %9924 = func.call @cc_make_string(%9922, %9923) : (!llvm.ptr, i64) -> i64
      %9925 = llvm.mlir.addressof @str1169 : !llvm.ptr
      %9926 = arith.constant 11 : i64
      %9927 = func.call @cc_make_string(%9925, %9926) : (!llvm.ptr, i64) -> i64
      %9928 = func.call @cc_intern(%9924, %9927) : (i64, i64) -> i64
      %9929 = func.call @cc_nil_value() : () -> i64
      %9930 = func.call @cc_cons(%9928, %9929) : (i64, i64) -> i64
      %9931 = func.call @cc_values_pack(%9930) : (i64) -> i64
      func.call @stack_push_pointer(%9928) : (i64) -> ()
      %9932 = llvm.mlir.addressof @str1170 : !llvm.ptr
      %9933 = arith.constant 24 : i64
      %9934 = func.call @cc_make_string(%9932, %9933) : (!llvm.ptr, i64) -> i64
      %9935 = llvm.mlir.addressof @str1171 : !llvm.ptr
      %9936 = arith.constant 11 : i64
      %9937 = func.call @cc_make_string(%9935, %9936) : (!llvm.ptr, i64) -> i64
      %9938 = func.call @cc_intern(%9934, %9937) : (i64, i64) -> i64
      %9939 = func.call @cc_nil_value() : () -> i64
      %9940 = func.call @cc_cons(%9938, %9939) : (i64, i64) -> i64
      %9941 = func.call @cc_values_pack(%9940) : (i64) -> i64
      func.call @stack_push_pointer(%9938) : (i64) -> ()
      %9942 = llvm.mlir.addressof @str1172 : !llvm.ptr
      %9943 = arith.constant 25 : i64
      %9944 = func.call @cc_make_string(%9942, %9943) : (!llvm.ptr, i64) -> i64
      %9945 = llvm.mlir.addressof @str1173 : !llvm.ptr
      %9946 = arith.constant 11 : i64
      %9947 = func.call @cc_make_string(%9945, %9946) : (!llvm.ptr, i64) -> i64
      %9948 = func.call @cc_intern(%9944, %9947) : (i64, i64) -> i64
      %9949 = func.call @cc_nil_value() : () -> i64
      %9950 = func.call @cc_cons(%9948, %9949) : (i64, i64) -> i64
      %9951 = func.call @cc_values_pack(%9950) : (i64) -> i64
      func.call @stack_push_pointer(%9948) : (i64) -> ()
      %9952 = llvm.mlir.addressof @str1174 : !llvm.ptr
      %9953 = arith.constant 26 : i64
      %9954 = func.call @cc_make_string(%9952, %9953) : (!llvm.ptr, i64) -> i64
      %9955 = llvm.mlir.addressof @str1175 : !llvm.ptr
      %9956 = arith.constant 11 : i64
      %9957 = func.call @cc_make_string(%9955, %9956) : (!llvm.ptr, i64) -> i64
      %9958 = func.call @cc_intern(%9954, %9957) : (i64, i64) -> i64
      %9959 = func.call @cc_nil_value() : () -> i64
      %9960 = func.call @cc_cons(%9958, %9959) : (i64, i64) -> i64
      %9961 = func.call @cc_values_pack(%9960) : (i64) -> i64
      func.call @stack_push_pointer(%9958) : (i64) -> ()
      %9962 = llvm.mlir.addressof @str1176 : !llvm.ptr
      %9963 = arith.constant 26 : i64
      %9964 = func.call @cc_make_string(%9962, %9963) : (!llvm.ptr, i64) -> i64
      %9965 = llvm.mlir.addressof @str1177 : !llvm.ptr
      %9966 = arith.constant 11 : i64
      %9967 = func.call @cc_make_string(%9965, %9966) : (!llvm.ptr, i64) -> i64
      %9968 = func.call @cc_intern(%9964, %9967) : (i64, i64) -> i64
      %9969 = func.call @cc_nil_value() : () -> i64
      %9970 = func.call @cc_cons(%9968, %9969) : (i64, i64) -> i64
      %9971 = func.call @cc_values_pack(%9970) : (i64) -> i64
      func.call @stack_push_pointer(%9968) : (i64) -> ()
      %9972 = llvm.mlir.addressof @str1178 : !llvm.ptr
      %9973 = arith.constant 20 : i64
      %9974 = func.call @cc_make_string(%9972, %9973) : (!llvm.ptr, i64) -> i64
      %9975 = llvm.mlir.addressof @str1179 : !llvm.ptr
      %9976 = arith.constant 11 : i64
      %9977 = func.call @cc_make_string(%9975, %9976) : (!llvm.ptr, i64) -> i64
      %9978 = func.call @cc_intern(%9974, %9977) : (i64, i64) -> i64
      %9979 = func.call @cc_nil_value() : () -> i64
      %9980 = func.call @cc_cons(%9978, %9979) : (i64, i64) -> i64
      %9981 = func.call @cc_values_pack(%9980) : (i64) -> i64
      func.call @stack_push_pointer(%9978) : (i64) -> ()
      %9982 = llvm.mlir.addressof @str1180 : !llvm.ptr
      %9983 = arith.constant 24 : i64
      %9984 = func.call @cc_make_string(%9982, %9983) : (!llvm.ptr, i64) -> i64
      %9985 = llvm.mlir.addressof @str1181 : !llvm.ptr
      %9986 = arith.constant 11 : i64
      %9987 = func.call @cc_make_string(%9985, %9986) : (!llvm.ptr, i64) -> i64
      %9988 = func.call @cc_intern(%9984, %9987) : (i64, i64) -> i64
      %9989 = func.call @cc_nil_value() : () -> i64
      %9990 = func.call @cc_cons(%9988, %9989) : (i64, i64) -> i64
      %9991 = func.call @cc_values_pack(%9990) : (i64) -> i64
      func.call @stack_push_pointer(%9988) : (i64) -> ()
      %9992 = llvm.mlir.addressof @str1182 : !llvm.ptr
      %9993 = arith.constant 25 : i64
      %9994 = func.call @cc_make_string(%9992, %9993) : (!llvm.ptr, i64) -> i64
      %9995 = llvm.mlir.addressof @str1183 : !llvm.ptr
      %9996 = arith.constant 11 : i64
      %9997 = func.call @cc_make_string(%9995, %9996) : (!llvm.ptr, i64) -> i64
      %9998 = func.call @cc_intern(%9994, %9997) : (i64, i64) -> i64
      %9999 = func.call @cc_nil_value() : () -> i64
      %10000 = func.call @cc_cons(%9998, %9999) : (i64, i64) -> i64
      %10001 = func.call @cc_values_pack(%10000) : (i64) -> i64
      func.call @stack_push_pointer(%9998) : (i64) -> ()
      %10002 = llvm.mlir.addressof @str1184 : !llvm.ptr
      %10003 = arith.constant 26 : i64
      %10004 = func.call @cc_make_string(%10002, %10003) : (!llvm.ptr, i64) -> i64
      %10005 = llvm.mlir.addressof @str1185 : !llvm.ptr
      %10006 = arith.constant 11 : i64
      %10007 = func.call @cc_make_string(%10005, %10006) : (!llvm.ptr, i64) -> i64
      %10008 = func.call @cc_intern(%10004, %10007) : (i64, i64) -> i64
      %10009 = func.call @cc_nil_value() : () -> i64
      %10010 = func.call @cc_cons(%10008, %10009) : (i64, i64) -> i64
      %10011 = func.call @cc_values_pack(%10010) : (i64) -> i64
      func.call @stack_push_pointer(%10008) : (i64) -> ()
      %10012 = llvm.mlir.addressof @str1186 : !llvm.ptr
      %10013 = arith.constant 21 : i64
      %10014 = func.call @cc_make_string(%10012, %10013) : (!llvm.ptr, i64) -> i64
      %10015 = llvm.mlir.addressof @str1187 : !llvm.ptr
      %10016 = arith.constant 11 : i64
      %10017 = func.call @cc_make_string(%10015, %10016) : (!llvm.ptr, i64) -> i64
      %10018 = func.call @cc_intern(%10014, %10017) : (i64, i64) -> i64
      %10019 = func.call @cc_nil_value() : () -> i64
      %10020 = func.call @cc_cons(%10018, %10019) : (i64, i64) -> i64
      %10021 = func.call @cc_values_pack(%10020) : (i64) -> i64
      func.call @stack_push_pointer(%10018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10022 = llvm.mlir.addressof @str1188 : !llvm.ptr
      %10023 = arith.constant 9 : i64
      %10024 = func.call @cc_make_string(%10022, %10023) : (!llvm.ptr, i64) -> i64
      %10025 = llvm.mlir.addressof @str1189 : !llvm.ptr
      %10026 = arith.constant 11 : i64
      %10027 = func.call @cc_make_string(%10025, %10026) : (!llvm.ptr, i64) -> i64
      %10028 = func.call @cc_intern(%10024, %10027) : (i64, i64) -> i64
      %10029 = func.call @cc_nil_value() : () -> i64
      %10030 = func.call @cc_cons(%10028, %10029) : (i64, i64) -> i64
      %10031 = func.call @cc_values_pack(%10030) : (i64) -> i64
      func.call @stack_push_pointer(%10028) : (i64) -> ()
      %10032 = llvm.mlir.addressof @str1190 : !llvm.ptr
      %10033 = arith.constant 6 : i64
      %10034 = func.call @cc_make_string(%10032, %10033) : (!llvm.ptr, i64) -> i64
      %10035 = llvm.mlir.addressof @str1191 : !llvm.ptr
      %10036 = arith.constant 11 : i64
      %10037 = func.call @cc_make_string(%10035, %10036) : (!llvm.ptr, i64) -> i64
      %10038 = func.call @cc_intern(%10034, %10037) : (i64, i64) -> i64
      %10039 = func.call @cc_nil_value() : () -> i64
      %10040 = func.call @cc_cons(%10038, %10039) : (i64, i64) -> i64
      %10041 = func.call @cc_values_pack(%10040) : (i64) -> i64
      func.call @stack_push_pointer(%10038) : (i64) -> ()
      %10042 = llvm.mlir.addressof @str1192 : !llvm.ptr
      %10043 = arith.constant 8 : i64
      %10044 = func.call @cc_make_string(%10042, %10043) : (!llvm.ptr, i64) -> i64
      %10045 = llvm.mlir.addressof @str1193 : !llvm.ptr
      %10046 = arith.constant 11 : i64
      %10047 = func.call @cc_make_string(%10045, %10046) : (!llvm.ptr, i64) -> i64
      %10048 = func.call @cc_intern(%10044, %10047) : (i64, i64) -> i64
      %10049 = func.call @cc_nil_value() : () -> i64
      %10050 = func.call @cc_cons(%10048, %10049) : (i64, i64) -> i64
      %10051 = func.call @cc_values_pack(%10050) : (i64) -> i64
      func.call @stack_push_pointer(%10048) : (i64) -> ()
      %10052 = llvm.mlir.addressof @str1194 : !llvm.ptr
      %10053 = arith.constant 9 : i64
      %10054 = func.call @cc_make_string(%10052, %10053) : (!llvm.ptr, i64) -> i64
      %10055 = llvm.mlir.addressof @str1195 : !llvm.ptr
      %10056 = arith.constant 11 : i64
      %10057 = func.call @cc_make_string(%10055, %10056) : (!llvm.ptr, i64) -> i64
      %10058 = func.call @cc_intern(%10054, %10057) : (i64, i64) -> i64
      %10059 = func.call @cc_nil_value() : () -> i64
      %10060 = func.call @cc_cons(%10058, %10059) : (i64, i64) -> i64
      %10061 = func.call @cc_values_pack(%10060) : (i64) -> i64
      func.call @stack_push_pointer(%10058) : (i64) -> ()
      %10062 = llvm.mlir.addressof @str1196 : !llvm.ptr
      %10063 = arith.constant 7 : i64
      %10064 = func.call @cc_make_string(%10062, %10063) : (!llvm.ptr, i64) -> i64
      %10065 = llvm.mlir.addressof @str1197 : !llvm.ptr
      %10066 = arith.constant 11 : i64
      %10067 = func.call @cc_make_string(%10065, %10066) : (!llvm.ptr, i64) -> i64
      %10068 = func.call @cc_intern(%10064, %10067) : (i64, i64) -> i64
      %10069 = func.call @cc_nil_value() : () -> i64
      %10070 = func.call @cc_cons(%10068, %10069) : (i64, i64) -> i64
      %10071 = func.call @cc_values_pack(%10070) : (i64) -> i64
      func.call @stack_push_pointer(%10068) : (i64) -> ()
      %10072 = llvm.mlir.addressof @str1198 : !llvm.ptr
      %10073 = arith.constant 13 : i64
      %10074 = func.call @cc_make_string(%10072, %10073) : (!llvm.ptr, i64) -> i64
      %10075 = llvm.mlir.addressof @str1199 : !llvm.ptr
      %10076 = arith.constant 11 : i64
      %10077 = func.call @cc_make_string(%10075, %10076) : (!llvm.ptr, i64) -> i64
      %10078 = func.call @cc_intern(%10074, %10077) : (i64, i64) -> i64
      %10079 = func.call @cc_nil_value() : () -> i64
      %10080 = func.call @cc_cons(%10078, %10079) : (i64, i64) -> i64
      %10081 = func.call @cc_values_pack(%10080) : (i64) -> i64
      func.call @stack_push_pointer(%10078) : (i64) -> ()
      %10082 = llvm.mlir.addressof @str1200 : !llvm.ptr
      %10083 = arith.constant 11 : i64
      %10084 = func.call @cc_make_string(%10082, %10083) : (!llvm.ptr, i64) -> i64
      %10085 = llvm.mlir.addressof @str1201 : !llvm.ptr
      %10086 = arith.constant 11 : i64
      %10087 = func.call @cc_make_string(%10085, %10086) : (!llvm.ptr, i64) -> i64
      %10088 = func.call @cc_intern(%10084, %10087) : (i64, i64) -> i64
      %10089 = func.call @cc_nil_value() : () -> i64
      %10090 = func.call @cc_cons(%10088, %10089) : (i64, i64) -> i64
      %10091 = func.call @cc_values_pack(%10090) : (i64) -> i64
      func.call @stack_push_pointer(%10088) : (i64) -> ()
      %10092 = llvm.mlir.addressof @str1202 : !llvm.ptr
      %10093 = arith.constant 2 : i64
      %10094 = func.call @cc_make_string(%10092, %10093) : (!llvm.ptr, i64) -> i64
      %10095 = llvm.mlir.addressof @str1203 : !llvm.ptr
      %10096 = arith.constant 11 : i64
      %10097 = func.call @cc_make_string(%10095, %10096) : (!llvm.ptr, i64) -> i64
      %10098 = func.call @cc_intern(%10094, %10097) : (i64, i64) -> i64
      %10099 = func.call @cc_nil_value() : () -> i64
      %10100 = func.call @cc_cons(%10098, %10099) : (i64, i64) -> i64
      %10101 = func.call @cc_values_pack(%10100) : (i64) -> i64
      func.call @stack_push_pointer(%10098) : (i64) -> ()
      %10102 = llvm.mlir.addressof @str1204 : !llvm.ptr
      %10103 = arith.constant 18 : i64
      %10104 = func.call @cc_make_string(%10102, %10103) : (!llvm.ptr, i64) -> i64
      %10105 = llvm.mlir.addressof @str1205 : !llvm.ptr
      %10106 = arith.constant 11 : i64
      %10107 = func.call @cc_make_string(%10105, %10106) : (!llvm.ptr, i64) -> i64
      %10108 = func.call @cc_intern(%10104, %10107) : (i64, i64) -> i64
      %10109 = func.call @cc_nil_value() : () -> i64
      %10110 = func.call @cc_cons(%10108, %10109) : (i64, i64) -> i64
      %10111 = func.call @cc_values_pack(%10110) : (i64) -> i64
      func.call @stack_push_pointer(%10108) : (i64) -> ()
      %10112 = llvm.mlir.addressof @str1206 : !llvm.ptr
      %10113 = arith.constant 13 : i64
      %10114 = func.call @cc_make_string(%10112, %10113) : (!llvm.ptr, i64) -> i64
      %10115 = llvm.mlir.addressof @str1207 : !llvm.ptr
      %10116 = arith.constant 11 : i64
      %10117 = func.call @cc_make_string(%10115, %10116) : (!llvm.ptr, i64) -> i64
      %10118 = func.call @cc_intern(%10114, %10117) : (i64, i64) -> i64
      %10119 = func.call @cc_nil_value() : () -> i64
      %10120 = func.call @cc_cons(%10118, %10119) : (i64, i64) -> i64
      %10121 = func.call @cc_values_pack(%10120) : (i64) -> i64
      func.call @stack_push_pointer(%10118) : (i64) -> ()
      %10122 = llvm.mlir.addressof @str1208 : !llvm.ptr
      %10123 = arith.constant 12 : i64
      %10124 = func.call @cc_make_string(%10122, %10123) : (!llvm.ptr, i64) -> i64
      %10125 = llvm.mlir.addressof @str1209 : !llvm.ptr
      %10126 = arith.constant 11 : i64
      %10127 = func.call @cc_make_string(%10125, %10126) : (!llvm.ptr, i64) -> i64
      %10128 = func.call @cc_intern(%10124, %10127) : (i64, i64) -> i64
      %10129 = func.call @cc_nil_value() : () -> i64
      %10130 = func.call @cc_cons(%10128, %10129) : (i64, i64) -> i64
      %10131 = func.call @cc_values_pack(%10130) : (i64) -> i64
      func.call @stack_push_pointer(%10128) : (i64) -> ()
      %10132 = llvm.mlir.addressof @str1210 : !llvm.ptr
      %10133 = arith.constant 5 : i64
      %10134 = func.call @cc_make_string(%10132, %10133) : (!llvm.ptr, i64) -> i64
      %10135 = llvm.mlir.addressof @str1211 : !llvm.ptr
      %10136 = arith.constant 11 : i64
      %10137 = func.call @cc_make_string(%10135, %10136) : (!llvm.ptr, i64) -> i64
      %10138 = func.call @cc_intern(%10134, %10137) : (i64, i64) -> i64
      %10139 = func.call @cc_nil_value() : () -> i64
      %10140 = func.call @cc_cons(%10138, %10139) : (i64, i64) -> i64
      %10141 = func.call @cc_values_pack(%10140) : (i64) -> i64
      func.call @stack_push_pointer(%10138) : (i64) -> ()
      %10142 = llvm.mlir.addressof @str1212 : !llvm.ptr
      %10143 = arith.constant 12 : i64
      %10144 = func.call @cc_make_string(%10142, %10143) : (!llvm.ptr, i64) -> i64
      %10145 = llvm.mlir.addressof @str1213 : !llvm.ptr
      %10146 = arith.constant 11 : i64
      %10147 = func.call @cc_make_string(%10145, %10146) : (!llvm.ptr, i64) -> i64
      %10148 = func.call @cc_intern(%10144, %10147) : (i64, i64) -> i64
      %10149 = func.call @cc_nil_value() : () -> i64
      %10150 = func.call @cc_cons(%10148, %10149) : (i64, i64) -> i64
      %10151 = func.call @cc_values_pack(%10150) : (i64) -> i64
      func.call @stack_push_pointer(%10148) : (i64) -> ()
      %10152 = llvm.mlir.addressof @str1214 : !llvm.ptr
      %10153 = arith.constant 9 : i64
      %10154 = func.call @cc_make_string(%10152, %10153) : (!llvm.ptr, i64) -> i64
      %10155 = llvm.mlir.addressof @str1215 : !llvm.ptr
      %10156 = arith.constant 11 : i64
      %10157 = func.call @cc_make_string(%10155, %10156) : (!llvm.ptr, i64) -> i64
      %10158 = func.call @cc_intern(%10154, %10157) : (i64, i64) -> i64
      %10159 = func.call @cc_nil_value() : () -> i64
      %10160 = func.call @cc_cons(%10158, %10159) : (i64, i64) -> i64
      %10161 = func.call @cc_values_pack(%10160) : (i64) -> i64
      func.call @stack_push_pointer(%10158) : (i64) -> ()
      %10162 = llvm.mlir.addressof @str1216 : !llvm.ptr
      %10163 = arith.constant 4 : i64
      %10164 = func.call @cc_make_string(%10162, %10163) : (!llvm.ptr, i64) -> i64
      %10165 = llvm.mlir.addressof @str1217 : !llvm.ptr
      %10166 = arith.constant 11 : i64
      %10167 = func.call @cc_make_string(%10165, %10166) : (!llvm.ptr, i64) -> i64
      %10168 = func.call @cc_intern(%10164, %10167) : (i64, i64) -> i64
      %10169 = func.call @cc_nil_value() : () -> i64
      %10170 = func.call @cc_cons(%10168, %10169) : (i64, i64) -> i64
      %10171 = func.call @cc_values_pack(%10170) : (i64) -> i64
      func.call @stack_push_pointer(%10168) : (i64) -> ()
      %10172 = llvm.mlir.addressof @str1218 : !llvm.ptr
      %10173 = arith.constant 7 : i64
      %10174 = func.call @cc_make_string(%10172, %10173) : (!llvm.ptr, i64) -> i64
      %10175 = llvm.mlir.addressof @str1219 : !llvm.ptr
      %10176 = arith.constant 11 : i64
      %10177 = func.call @cc_make_string(%10175, %10176) : (!llvm.ptr, i64) -> i64
      %10178 = func.call @cc_intern(%10174, %10177) : (i64, i64) -> i64
      %10179 = func.call @cc_nil_value() : () -> i64
      %10180 = func.call @cc_cons(%10178, %10179) : (i64, i64) -> i64
      %10181 = func.call @cc_values_pack(%10180) : (i64) -> i64
      func.call @stack_push_pointer(%10178) : (i64) -> ()
      %10182 = llvm.mlir.addressof @str1220 : !llvm.ptr
      %10183 = arith.constant 6 : i64
      %10184 = func.call @cc_make_string(%10182, %10183) : (!llvm.ptr, i64) -> i64
      %10185 = llvm.mlir.addressof @str1221 : !llvm.ptr
      %10186 = arith.constant 11 : i64
      %10187 = func.call @cc_make_string(%10185, %10186) : (!llvm.ptr, i64) -> i64
      %10188 = func.call @cc_intern(%10184, %10187) : (i64, i64) -> i64
      %10189 = func.call @cc_nil_value() : () -> i64
      %10190 = func.call @cc_cons(%10188, %10189) : (i64, i64) -> i64
      %10191 = func.call @cc_values_pack(%10190) : (i64) -> i64
      func.call @stack_push_pointer(%10188) : (i64) -> ()
      %10192 = llvm.mlir.addressof @str1222 : !llvm.ptr
      %10193 = arith.constant 9 : i64
      %10194 = func.call @cc_make_string(%10192, %10193) : (!llvm.ptr, i64) -> i64
      %10195 = llvm.mlir.addressof @str1223 : !llvm.ptr
      %10196 = arith.constant 11 : i64
      %10197 = func.call @cc_make_string(%10195, %10196) : (!llvm.ptr, i64) -> i64
      %10198 = func.call @cc_intern(%10194, %10197) : (i64, i64) -> i64
      %10199 = func.call @cc_nil_value() : () -> i64
      %10200 = func.call @cc_cons(%10198, %10199) : (i64, i64) -> i64
      %10201 = func.call @cc_values_pack(%10200) : (i64) -> i64
      func.call @stack_push_pointer(%10198) : (i64) -> ()
      %10202 = llvm.mlir.addressof @str1224 : !llvm.ptr
      %10203 = arith.constant 8 : i64
      %10204 = func.call @cc_make_string(%10202, %10203) : (!llvm.ptr, i64) -> i64
      %10205 = llvm.mlir.addressof @str1225 : !llvm.ptr
      %10206 = arith.constant 11 : i64
      %10207 = func.call @cc_make_string(%10205, %10206) : (!llvm.ptr, i64) -> i64
      %10208 = func.call @cc_intern(%10204, %10207) : (i64, i64) -> i64
      %10209 = func.call @cc_nil_value() : () -> i64
      %10210 = func.call @cc_cons(%10208, %10209) : (i64, i64) -> i64
      %10211 = func.call @cc_values_pack(%10210) : (i64) -> i64
      func.call @stack_push_pointer(%10208) : (i64) -> ()
      %10212 = llvm.mlir.addressof @str1226 : !llvm.ptr
      %10213 = arith.constant 17 : i64
      %10214 = func.call @cc_make_string(%10212, %10213) : (!llvm.ptr, i64) -> i64
      %10215 = llvm.mlir.addressof @str1227 : !llvm.ptr
      %10216 = arith.constant 11 : i64
      %10217 = func.call @cc_make_string(%10215, %10216) : (!llvm.ptr, i64) -> i64
      %10218 = func.call @cc_intern(%10214, %10217) : (i64, i64) -> i64
      %10219 = func.call @cc_nil_value() : () -> i64
      %10220 = func.call @cc_cons(%10218, %10219) : (i64, i64) -> i64
      %10221 = func.call @cc_values_pack(%10220) : (i64) -> i64
      func.call @stack_push_pointer(%10218) : (i64) -> ()
      %10222 = llvm.mlir.addressof @str1228 : !llvm.ptr
      %10223 = arith.constant 11 : i64
      %10224 = func.call @cc_make_string(%10222, %10223) : (!llvm.ptr, i64) -> i64
      %10225 = llvm.mlir.addressof @str1229 : !llvm.ptr
      %10226 = arith.constant 11 : i64
      %10227 = func.call @cc_make_string(%10225, %10226) : (!llvm.ptr, i64) -> i64
      %10228 = func.call @cc_intern(%10224, %10227) : (i64, i64) -> i64
      %10229 = func.call @cc_nil_value() : () -> i64
      %10230 = func.call @cc_cons(%10228, %10229) : (i64, i64) -> i64
      %10231 = func.call @cc_values_pack(%10230) : (i64) -> i64
      func.call @stack_push_pointer(%10228) : (i64) -> ()
      %10232 = llvm.mlir.addressof @str1230 : !llvm.ptr
      %10233 = arith.constant 19 : i64
      %10234 = func.call @cc_make_string(%10232, %10233) : (!llvm.ptr, i64) -> i64
      %10235 = llvm.mlir.addressof @str1231 : !llvm.ptr
      %10236 = arith.constant 11 : i64
      %10237 = func.call @cc_make_string(%10235, %10236) : (!llvm.ptr, i64) -> i64
      %10238 = func.call @cc_intern(%10234, %10237) : (i64, i64) -> i64
      %10239 = func.call @cc_nil_value() : () -> i64
      %10240 = func.call @cc_cons(%10238, %10239) : (i64, i64) -> i64
      %10241 = func.call @cc_values_pack(%10240) : (i64) -> i64
      func.call @stack_push_pointer(%10238) : (i64) -> ()
      %10242 = llvm.mlir.addressof @str1232 : !llvm.ptr
      %10243 = arith.constant 28 : i64
      %10244 = func.call @cc_make_string(%10242, %10243) : (!llvm.ptr, i64) -> i64
      %10245 = llvm.mlir.addressof @str1233 : !llvm.ptr
      %10246 = arith.constant 11 : i64
      %10247 = func.call @cc_make_string(%10245, %10246) : (!llvm.ptr, i64) -> i64
      %10248 = func.call @cc_intern(%10244, %10247) : (i64, i64) -> i64
      %10249 = func.call @cc_nil_value() : () -> i64
      %10250 = func.call @cc_cons(%10248, %10249) : (i64, i64) -> i64
      %10251 = func.call @cc_values_pack(%10250) : (i64) -> i64
      func.call @stack_push_pointer(%10248) : (i64) -> ()
      %10252 = llvm.mlir.addressof @str1234 : !llvm.ptr
      %10253 = arith.constant 11 : i64
      %10254 = func.call @cc_make_string(%10252, %10253) : (!llvm.ptr, i64) -> i64
      %10255 = llvm.mlir.addressof @str1235 : !llvm.ptr
      %10256 = arith.constant 11 : i64
      %10257 = func.call @cc_make_string(%10255, %10256) : (!llvm.ptr, i64) -> i64
      %10258 = func.call @cc_intern(%10254, %10257) : (i64, i64) -> i64
      %10259 = func.call @cc_nil_value() : () -> i64
      %10260 = func.call @cc_cons(%10258, %10259) : (i64, i64) -> i64
      %10261 = func.call @cc_values_pack(%10260) : (i64) -> i64
      func.call @stack_push_pointer(%10258) : (i64) -> ()
      %10262 = llvm.mlir.addressof @str1236 : !llvm.ptr
      %10263 = arith.constant 12 : i64
      %10264 = func.call @cc_make_string(%10262, %10263) : (!llvm.ptr, i64) -> i64
      %10265 = llvm.mlir.addressof @str1237 : !llvm.ptr
      %10266 = arith.constant 11 : i64
      %10267 = func.call @cc_make_string(%10265, %10266) : (!llvm.ptr, i64) -> i64
      %10268 = func.call @cc_intern(%10264, %10267) : (i64, i64) -> i64
      %10269 = func.call @cc_nil_value() : () -> i64
      %10270 = func.call @cc_cons(%10268, %10269) : (i64, i64) -> i64
      %10271 = func.call @cc_values_pack(%10270) : (i64) -> i64
      func.call @stack_push_pointer(%10268) : (i64) -> ()
      %10272 = llvm.mlir.addressof @str1238 : !llvm.ptr
      %10273 = arith.constant 18 : i64
      %10274 = func.call @cc_make_string(%10272, %10273) : (!llvm.ptr, i64) -> i64
      %10275 = llvm.mlir.addressof @str1239 : !llvm.ptr
      %10276 = arith.constant 11 : i64
      %10277 = func.call @cc_make_string(%10275, %10276) : (!llvm.ptr, i64) -> i64
      %10278 = func.call @cc_intern(%10274, %10277) : (i64, i64) -> i64
      %10279 = func.call @cc_nil_value() : () -> i64
      %10280 = func.call @cc_cons(%10278, %10279) : (i64, i64) -> i64
      %10281 = func.call @cc_values_pack(%10280) : (i64) -> i64
      func.call @stack_push_pointer(%10278) : (i64) -> ()
      %10282 = llvm.mlir.addressof @str1240 : !llvm.ptr
      %10283 = arith.constant 17 : i64
      %10284 = func.call @cc_make_string(%10282, %10283) : (!llvm.ptr, i64) -> i64
      %10285 = llvm.mlir.addressof @str1241 : !llvm.ptr
      %10286 = arith.constant 11 : i64
      %10287 = func.call @cc_make_string(%10285, %10286) : (!llvm.ptr, i64) -> i64
      %10288 = func.call @cc_intern(%10284, %10287) : (i64, i64) -> i64
      %10289 = func.call @cc_nil_value() : () -> i64
      %10290 = func.call @cc_cons(%10288, %10289) : (i64, i64) -> i64
      %10291 = func.call @cc_values_pack(%10290) : (i64) -> i64
      func.call @stack_push_pointer(%10288) : (i64) -> ()
      %10292 = llvm.mlir.addressof @str1242 : !llvm.ptr
      %10293 = arith.constant 16 : i64
      %10294 = func.call @cc_make_string(%10292, %10293) : (!llvm.ptr, i64) -> i64
      %10295 = llvm.mlir.addressof @str1243 : !llvm.ptr
      %10296 = arith.constant 11 : i64
      %10297 = func.call @cc_make_string(%10295, %10296) : (!llvm.ptr, i64) -> i64
      %10298 = func.call @cc_intern(%10294, %10297) : (i64, i64) -> i64
      %10299 = func.call @cc_nil_value() : () -> i64
      %10300 = func.call @cc_cons(%10298, %10299) : (i64, i64) -> i64
      %10301 = func.call @cc_values_pack(%10300) : (i64) -> i64
      func.call @stack_push_pointer(%10298) : (i64) -> ()
      %10302 = llvm.mlir.addressof @str1244 : !llvm.ptr
      %10303 = arith.constant 12 : i64
      %10304 = func.call @cc_make_string(%10302, %10303) : (!llvm.ptr, i64) -> i64
      %10305 = llvm.mlir.addressof @str1245 : !llvm.ptr
      %10306 = arith.constant 11 : i64
      %10307 = func.call @cc_make_string(%10305, %10306) : (!llvm.ptr, i64) -> i64
      %10308 = func.call @cc_intern(%10304, %10307) : (i64, i64) -> i64
      %10309 = func.call @cc_nil_value() : () -> i64
      %10310 = func.call @cc_cons(%10308, %10309) : (i64, i64) -> i64
      %10311 = func.call @cc_values_pack(%10310) : (i64) -> i64
      func.call @stack_push_pointer(%10308) : (i64) -> ()
      %10312 = llvm.mlir.addressof @str1246 : !llvm.ptr
      %10313 = arith.constant 13 : i64
      %10314 = func.call @cc_make_string(%10312, %10313) : (!llvm.ptr, i64) -> i64
      %10315 = llvm.mlir.addressof @str1247 : !llvm.ptr
      %10316 = arith.constant 11 : i64
      %10317 = func.call @cc_make_string(%10315, %10316) : (!llvm.ptr, i64) -> i64
      %10318 = func.call @cc_intern(%10314, %10317) : (i64, i64) -> i64
      %10319 = func.call @cc_nil_value() : () -> i64
      %10320 = func.call @cc_cons(%10318, %10319) : (i64, i64) -> i64
      %10321 = func.call @cc_values_pack(%10320) : (i64) -> i64
      func.call @stack_push_pointer(%10318) : (i64) -> ()
      %10322 = llvm.mlir.addressof @str1248 : !llvm.ptr
      %10323 = arith.constant 17 : i64
      %10324 = func.call @cc_make_string(%10322, %10323) : (!llvm.ptr, i64) -> i64
      %10325 = llvm.mlir.addressof @str1249 : !llvm.ptr
      %10326 = arith.constant 11 : i64
      %10327 = func.call @cc_make_string(%10325, %10326) : (!llvm.ptr, i64) -> i64
      %10328 = func.call @cc_intern(%10324, %10327) : (i64, i64) -> i64
      %10329 = func.call @cc_nil_value() : () -> i64
      %10330 = func.call @cc_cons(%10328, %10329) : (i64, i64) -> i64
      %10331 = func.call @cc_values_pack(%10330) : (i64) -> i64
      func.call @stack_push_pointer(%10328) : (i64) -> ()
      %10332 = llvm.mlir.addressof @str1250 : !llvm.ptr
      %10333 = arith.constant 13 : i64
      %10334 = func.call @cc_make_string(%10332, %10333) : (!llvm.ptr, i64) -> i64
      %10335 = llvm.mlir.addressof @str1251 : !llvm.ptr
      %10336 = arith.constant 11 : i64
      %10337 = func.call @cc_make_string(%10335, %10336) : (!llvm.ptr, i64) -> i64
      %10338 = func.call @cc_intern(%10334, %10337) : (i64, i64) -> i64
      %10339 = func.call @cc_nil_value() : () -> i64
      %10340 = func.call @cc_cons(%10338, %10339) : (i64, i64) -> i64
      %10341 = func.call @cc_values_pack(%10340) : (i64) -> i64
      func.call @stack_push_pointer(%10338) : (i64) -> ()
      %10342 = llvm.mlir.addressof @str1252 : !llvm.ptr
      %10343 = arith.constant 14 : i64
      %10344 = func.call @cc_make_string(%10342, %10343) : (!llvm.ptr, i64) -> i64
      %10345 = llvm.mlir.addressof @str1253 : !llvm.ptr
      %10346 = arith.constant 11 : i64
      %10347 = func.call @cc_make_string(%10345, %10346) : (!llvm.ptr, i64) -> i64
      %10348 = func.call @cc_intern(%10344, %10347) : (i64, i64) -> i64
      %10349 = func.call @cc_nil_value() : () -> i64
      %10350 = func.call @cc_cons(%10348, %10349) : (i64, i64) -> i64
      %10351 = func.call @cc_values_pack(%10350) : (i64) -> i64
      func.call @stack_push_pointer(%10348) : (i64) -> ()
      %10352 = llvm.mlir.addressof @str1254 : !llvm.ptr
      %10353 = arith.constant 12 : i64
      %10354 = func.call @cc_make_string(%10352, %10353) : (!llvm.ptr, i64) -> i64
      %10355 = llvm.mlir.addressof @str1255 : !llvm.ptr
      %10356 = arith.constant 11 : i64
      %10357 = func.call @cc_make_string(%10355, %10356) : (!llvm.ptr, i64) -> i64
      %10358 = func.call @cc_intern(%10354, %10357) : (i64, i64) -> i64
      %10359 = func.call @cc_nil_value() : () -> i64
      %10360 = func.call @cc_cons(%10358, %10359) : (i64, i64) -> i64
      %10361 = func.call @cc_values_pack(%10360) : (i64) -> i64
      func.call @stack_push_pointer(%10358) : (i64) -> ()
      %10362 = llvm.mlir.addressof @str1256 : !llvm.ptr
      %10363 = arith.constant 20 : i64
      %10364 = func.call @cc_make_string(%10362, %10363) : (!llvm.ptr, i64) -> i64
      %10365 = llvm.mlir.addressof @str1257 : !llvm.ptr
      %10366 = arith.constant 11 : i64
      %10367 = func.call @cc_make_string(%10365, %10366) : (!llvm.ptr, i64) -> i64
      %10368 = func.call @cc_intern(%10364, %10367) : (i64, i64) -> i64
      %10369 = func.call @cc_nil_value() : () -> i64
      %10370 = func.call @cc_cons(%10368, %10369) : (i64, i64) -> i64
      %10371 = func.call @cc_values_pack(%10370) : (i64) -> i64
      func.call @stack_push_pointer(%10368) : (i64) -> ()
      %10372 = llvm.mlir.addressof @str1258 : !llvm.ptr
      %10373 = arith.constant 29 : i64
      %10374 = func.call @cc_make_string(%10372, %10373) : (!llvm.ptr, i64) -> i64
      %10375 = llvm.mlir.addressof @str1259 : !llvm.ptr
      %10376 = arith.constant 11 : i64
      %10377 = func.call @cc_make_string(%10375, %10376) : (!llvm.ptr, i64) -> i64
      %10378 = func.call @cc_intern(%10374, %10377) : (i64, i64) -> i64
      %10379 = func.call @cc_nil_value() : () -> i64
      %10380 = func.call @cc_cons(%10378, %10379) : (i64, i64) -> i64
      %10381 = func.call @cc_values_pack(%10380) : (i64) -> i64
      func.call @stack_push_pointer(%10378) : (i64) -> ()
      %10382 = llvm.mlir.addressof @str1260 : !llvm.ptr
      %10383 = arith.constant 5 : i64
      %10384 = func.call @cc_make_string(%10382, %10383) : (!llvm.ptr, i64) -> i64
      %10385 = llvm.mlir.addressof @str1261 : !llvm.ptr
      %10386 = arith.constant 11 : i64
      %10387 = func.call @cc_make_string(%10385, %10386) : (!llvm.ptr, i64) -> i64
      %10388 = func.call @cc_intern(%10384, %10387) : (i64, i64) -> i64
      %10389 = func.call @cc_nil_value() : () -> i64
      %10390 = func.call @cc_cons(%10388, %10389) : (i64, i64) -> i64
      %10391 = func.call @cc_values_pack(%10390) : (i64) -> i64
      func.call @stack_push_pointer(%10388) : (i64) -> ()
      %10392 = llvm.mlir.addressof @str1262 : !llvm.ptr
      %10393 = arith.constant 7 : i64
      %10394 = func.call @cc_make_string(%10392, %10393) : (!llvm.ptr, i64) -> i64
      %10395 = llvm.mlir.addressof @str1263 : !llvm.ptr
      %10396 = arith.constant 11 : i64
      %10397 = func.call @cc_make_string(%10395, %10396) : (!llvm.ptr, i64) -> i64
      %10398 = func.call @cc_intern(%10394, %10397) : (i64, i64) -> i64
      %10399 = func.call @cc_nil_value() : () -> i64
      %10400 = func.call @cc_cons(%10398, %10399) : (i64, i64) -> i64
      %10401 = func.call @cc_values_pack(%10400) : (i64) -> i64
      func.call @stack_push_pointer(%10398) : (i64) -> ()
      %10402 = llvm.mlir.addressof @str1264 : !llvm.ptr
      %10403 = arith.constant 5 : i64
      %10404 = func.call @cc_make_string(%10402, %10403) : (!llvm.ptr, i64) -> i64
      %10405 = llvm.mlir.addressof @str1265 : !llvm.ptr
      %10406 = arith.constant 11 : i64
      %10407 = func.call @cc_make_string(%10405, %10406) : (!llvm.ptr, i64) -> i64
      %10408 = func.call @cc_intern(%10404, %10407) : (i64, i64) -> i64
      %10409 = func.call @cc_nil_value() : () -> i64
      %10410 = func.call @cc_cons(%10408, %10409) : (i64, i64) -> i64
      %10411 = func.call @cc_values_pack(%10410) : (i64) -> i64
      func.call @stack_push_pointer(%10408) : (i64) -> ()
      %10412 = llvm.mlir.addressof @str1266 : !llvm.ptr
      %10413 = arith.constant 8 : i64
      %10414 = func.call @cc_make_string(%10412, %10413) : (!llvm.ptr, i64) -> i64
      %10415 = llvm.mlir.addressof @str1267 : !llvm.ptr
      %10416 = arith.constant 11 : i64
      %10417 = func.call @cc_make_string(%10415, %10416) : (!llvm.ptr, i64) -> i64
      %10418 = func.call @cc_intern(%10414, %10417) : (i64, i64) -> i64
      %10419 = func.call @cc_nil_value() : () -> i64
      %10420 = func.call @cc_cons(%10418, %10419) : (i64, i64) -> i64
      %10421 = func.call @cc_values_pack(%10420) : (i64) -> i64
      func.call @stack_push_pointer(%10418) : (i64) -> ()
      %10422 = llvm.mlir.addressof @str1268 : !llvm.ptr
      %10423 = arith.constant 13 : i64
      %10424 = func.call @cc_make_string(%10422, %10423) : (!llvm.ptr, i64) -> i64
      %10425 = llvm.mlir.addressof @str1269 : !llvm.ptr
      %10426 = arith.constant 11 : i64
      %10427 = func.call @cc_make_string(%10425, %10426) : (!llvm.ptr, i64) -> i64
      %10428 = func.call @cc_intern(%10424, %10427) : (i64, i64) -> i64
      %10429 = func.call @cc_nil_value() : () -> i64
      %10430 = func.call @cc_cons(%10428, %10429) : (i64, i64) -> i64
      %10431 = func.call @cc_values_pack(%10430) : (i64) -> i64
      func.call @stack_push_pointer(%10428) : (i64) -> ()
      %10432 = llvm.mlir.addressof @str1270 : !llvm.ptr
      %10433 = arith.constant 14 : i64
      %10434 = func.call @cc_make_string(%10432, %10433) : (!llvm.ptr, i64) -> i64
      %10435 = llvm.mlir.addressof @str1271 : !llvm.ptr
      %10436 = arith.constant 11 : i64
      %10437 = func.call @cc_make_string(%10435, %10436) : (!llvm.ptr, i64) -> i64
      %10438 = func.call @cc_intern(%10434, %10437) : (i64, i64) -> i64
      %10439 = func.call @cc_nil_value() : () -> i64
      %10440 = func.call @cc_cons(%10438, %10439) : (i64, i64) -> i64
      %10441 = func.call @cc_values_pack(%10440) : (i64) -> i64
      func.call @stack_push_pointer(%10438) : (i64) -> ()
      %10442 = llvm.mlir.addressof @str1272 : !llvm.ptr
      %10443 = arith.constant 25 : i64
      %10444 = func.call @cc_make_string(%10442, %10443) : (!llvm.ptr, i64) -> i64
      %10445 = llvm.mlir.addressof @str1273 : !llvm.ptr
      %10446 = arith.constant 11 : i64
      %10447 = func.call @cc_make_string(%10445, %10446) : (!llvm.ptr, i64) -> i64
      %10448 = func.call @cc_intern(%10444, %10447) : (i64, i64) -> i64
      %10449 = func.call @cc_nil_value() : () -> i64
      %10450 = func.call @cc_cons(%10448, %10449) : (i64, i64) -> i64
      %10451 = func.call @cc_values_pack(%10450) : (i64) -> i64
      func.call @stack_push_pointer(%10448) : (i64) -> ()
      %10452 = llvm.mlir.addressof @str1274 : !llvm.ptr
      %10453 = arith.constant 15 : i64
      %10454 = func.call @cc_make_string(%10452, %10453) : (!llvm.ptr, i64) -> i64
      %10455 = llvm.mlir.addressof @str1275 : !llvm.ptr
      %10456 = arith.constant 11 : i64
      %10457 = func.call @cc_make_string(%10455, %10456) : (!llvm.ptr, i64) -> i64
      %10458 = func.call @cc_intern(%10454, %10457) : (i64, i64) -> i64
      %10459 = func.call @cc_nil_value() : () -> i64
      %10460 = func.call @cc_cons(%10458, %10459) : (i64, i64) -> i64
      %10461 = func.call @cc_values_pack(%10460) : (i64) -> i64
      func.call @stack_push_pointer(%10458) : (i64) -> ()
      %10462 = llvm.mlir.addressof @str1276 : !llvm.ptr
      %10463 = arith.constant 15 : i64
      %10464 = func.call @cc_make_string(%10462, %10463) : (!llvm.ptr, i64) -> i64
      %10465 = llvm.mlir.addressof @str1277 : !llvm.ptr
      %10466 = arith.constant 11 : i64
      %10467 = func.call @cc_make_string(%10465, %10466) : (!llvm.ptr, i64) -> i64
      %10468 = func.call @cc_intern(%10464, %10467) : (i64, i64) -> i64
      %10469 = func.call @cc_nil_value() : () -> i64
      %10470 = func.call @cc_cons(%10468, %10469) : (i64, i64) -> i64
      %10471 = func.call @cc_values_pack(%10470) : (i64) -> i64
      func.call @stack_push_pointer(%10468) : (i64) -> ()
      %10472 = llvm.mlir.addressof @str1278 : !llvm.ptr
      %10473 = arith.constant 17 : i64
      %10474 = func.call @cc_make_string(%10472, %10473) : (!llvm.ptr, i64) -> i64
      %10475 = llvm.mlir.addressof @str1279 : !llvm.ptr
      %10476 = arith.constant 11 : i64
      %10477 = func.call @cc_make_string(%10475, %10476) : (!llvm.ptr, i64) -> i64
      %10478 = func.call @cc_intern(%10474, %10477) : (i64, i64) -> i64
      %10479 = func.call @cc_nil_value() : () -> i64
      %10480 = func.call @cc_cons(%10478, %10479) : (i64, i64) -> i64
      %10481 = func.call @cc_values_pack(%10480) : (i64) -> i64
      func.call @stack_push_pointer(%10478) : (i64) -> ()
      %10482 = llvm.mlir.addressof @str1280 : !llvm.ptr
      %10483 = arith.constant 6 : i64
      %10484 = func.call @cc_make_string(%10482, %10483) : (!llvm.ptr, i64) -> i64
      %10485 = llvm.mlir.addressof @str1281 : !llvm.ptr
      %10486 = arith.constant 11 : i64
      %10487 = func.call @cc_make_string(%10485, %10486) : (!llvm.ptr, i64) -> i64
      %10488 = func.call @cc_intern(%10484, %10487) : (i64, i64) -> i64
      %10489 = func.call @cc_nil_value() : () -> i64
      %10490 = func.call @cc_cons(%10488, %10489) : (i64, i64) -> i64
      %10491 = func.call @cc_values_pack(%10490) : (i64) -> i64
      func.call @stack_push_pointer(%10488) : (i64) -> ()
      %10492 = llvm.mlir.addressof @str1282 : !llvm.ptr
      %10493 = arith.constant 12 : i64
      %10494 = func.call @cc_make_string(%10492, %10493) : (!llvm.ptr, i64) -> i64
      %10495 = llvm.mlir.addressof @str1283 : !llvm.ptr
      %10496 = arith.constant 11 : i64
      %10497 = func.call @cc_make_string(%10495, %10496) : (!llvm.ptr, i64) -> i64
      %10498 = func.call @cc_intern(%10494, %10497) : (i64, i64) -> i64
      %10499 = func.call @cc_nil_value() : () -> i64
      %10500 = func.call @cc_cons(%10498, %10499) : (i64, i64) -> i64
      %10501 = func.call @cc_values_pack(%10500) : (i64) -> i64
      func.call @stack_push_pointer(%10498) : (i64) -> ()
      %10502 = llvm.mlir.addressof @str1284 : !llvm.ptr
      %10503 = arith.constant 13 : i64
      %10504 = func.call @cc_make_string(%10502, %10503) : (!llvm.ptr, i64) -> i64
      %10505 = llvm.mlir.addressof @str1285 : !llvm.ptr
      %10506 = arith.constant 11 : i64
      %10507 = func.call @cc_make_string(%10505, %10506) : (!llvm.ptr, i64) -> i64
      %10508 = func.call @cc_intern(%10504, %10507) : (i64, i64) -> i64
      %10509 = func.call @cc_nil_value() : () -> i64
      %10510 = func.call @cc_cons(%10508, %10509) : (i64, i64) -> i64
      %10511 = func.call @cc_values_pack(%10510) : (i64) -> i64
      func.call @stack_push_pointer(%10508) : (i64) -> ()
      %10512 = llvm.mlir.addressof @str1286 : !llvm.ptr
      %10513 = arith.constant 9 : i64
      %10514 = func.call @cc_make_string(%10512, %10513) : (!llvm.ptr, i64) -> i64
      %10515 = llvm.mlir.addressof @str1287 : !llvm.ptr
      %10516 = arith.constant 11 : i64
      %10517 = func.call @cc_make_string(%10515, %10516) : (!llvm.ptr, i64) -> i64
      %10518 = func.call @cc_intern(%10514, %10517) : (i64, i64) -> i64
      %10519 = func.call @cc_nil_value() : () -> i64
      %10520 = func.call @cc_cons(%10518, %10519) : (i64, i64) -> i64
      %10521 = func.call @cc_values_pack(%10520) : (i64) -> i64
      func.call @stack_push_pointer(%10518) : (i64) -> ()
      %10522 = llvm.mlir.addressof @str1288 : !llvm.ptr
      %10523 = arith.constant 15 : i64
      %10524 = func.call @cc_make_string(%10522, %10523) : (!llvm.ptr, i64) -> i64
      %10525 = llvm.mlir.addressof @str1289 : !llvm.ptr
      %10526 = arith.constant 11 : i64
      %10527 = func.call @cc_make_string(%10525, %10526) : (!llvm.ptr, i64) -> i64
      %10528 = func.call @cc_intern(%10524, %10527) : (i64, i64) -> i64
      %10529 = func.call @cc_nil_value() : () -> i64
      %10530 = func.call @cc_cons(%10528, %10529) : (i64, i64) -> i64
      %10531 = func.call @cc_values_pack(%10530) : (i64) -> i64
      func.call @stack_push_pointer(%10528) : (i64) -> ()
      %10532 = llvm.mlir.addressof @str1290 : !llvm.ptr
      %10533 = arith.constant 16 : i64
      %10534 = func.call @cc_make_string(%10532, %10533) : (!llvm.ptr, i64) -> i64
      %10535 = llvm.mlir.addressof @str1291 : !llvm.ptr
      %10536 = arith.constant 11 : i64
      %10537 = func.call @cc_make_string(%10535, %10536) : (!llvm.ptr, i64) -> i64
      %10538 = func.call @cc_intern(%10534, %10537) : (i64, i64) -> i64
      %10539 = func.call @cc_nil_value() : () -> i64
      %10540 = func.call @cc_cons(%10538, %10539) : (i64, i64) -> i64
      %10541 = func.call @cc_values_pack(%10540) : (i64) -> i64
      func.call @stack_push_pointer(%10538) : (i64) -> ()
      %10542 = llvm.mlir.addressof @str1292 : !llvm.ptr
      %10543 = arith.constant 13 : i64
      %10544 = func.call @cc_make_string(%10542, %10543) : (!llvm.ptr, i64) -> i64
      %10545 = llvm.mlir.addressof @str1293 : !llvm.ptr
      %10546 = arith.constant 11 : i64
      %10547 = func.call @cc_make_string(%10545, %10546) : (!llvm.ptr, i64) -> i64
      %10548 = func.call @cc_intern(%10544, %10547) : (i64, i64) -> i64
      %10549 = func.call @cc_nil_value() : () -> i64
      %10550 = func.call @cc_cons(%10548, %10549) : (i64, i64) -> i64
      %10551 = func.call @cc_values_pack(%10550) : (i64) -> i64
      func.call @stack_push_pointer(%10548) : (i64) -> ()
      %10552 = llvm.mlir.addressof @str1294 : !llvm.ptr
      %10553 = arith.constant 6 : i64
      %10554 = func.call @cc_make_string(%10552, %10553) : (!llvm.ptr, i64) -> i64
      %10555 = llvm.mlir.addressof @str1295 : !llvm.ptr
      %10556 = arith.constant 11 : i64
      %10557 = func.call @cc_make_string(%10555, %10556) : (!llvm.ptr, i64) -> i64
      %10558 = func.call @cc_intern(%10554, %10557) : (i64, i64) -> i64
      %10559 = func.call @cc_nil_value() : () -> i64
      %10560 = func.call @cc_cons(%10558, %10559) : (i64, i64) -> i64
      %10561 = func.call @cc_values_pack(%10560) : (i64) -> i64
      func.call @stack_push_pointer(%10558) : (i64) -> ()
      %10562 = llvm.mlir.addressof @str1296 : !llvm.ptr
      %10563 = arith.constant 14 : i64
      %10564 = func.call @cc_make_string(%10562, %10563) : (!llvm.ptr, i64) -> i64
      %10565 = llvm.mlir.addressof @str1297 : !llvm.ptr
      %10566 = arith.constant 11 : i64
      %10567 = func.call @cc_make_string(%10565, %10566) : (!llvm.ptr, i64) -> i64
      %10568 = func.call @cc_intern(%10564, %10567) : (i64, i64) -> i64
      %10569 = func.call @cc_nil_value() : () -> i64
      %10570 = func.call @cc_cons(%10568, %10569) : (i64, i64) -> i64
      %10571 = func.call @cc_values_pack(%10570) : (i64) -> i64
      func.call @stack_push_pointer(%10568) : (i64) -> ()
      %10572 = llvm.mlir.addressof @str1298 : !llvm.ptr
      %10573 = arith.constant 1 : i64
      %10574 = func.call @cc_make_string(%10572, %10573) : (!llvm.ptr, i64) -> i64
      %10575 = func.call @cc_nil_value() : () -> i64
      %10576 = func.call @cc_intern(%10574, %10575) : (i64, i64) -> i64
      %10577 = func.call @cc_nil_value() : () -> i64
      %10578 = func.call @cc_cons(%10576, %10577) : (i64, i64) -> i64
      %10579 = func.call @cc_values_pack(%10578) : (i64) -> i64
      func.call @stack_push_pointer(%10576) : (i64) -> ()
      %10580 = llvm.mlir.addressof @str1299 : !llvm.ptr
      %10581 = arith.constant 14 : i64
      %10582 = func.call @cc_make_string(%10580, %10581) : (!llvm.ptr, i64) -> i64
      %10583 = llvm.mlir.addressof @str1300 : !llvm.ptr
      %10584 = arith.constant 11 : i64
      %10585 = func.call @cc_make_string(%10583, %10584) : (!llvm.ptr, i64) -> i64
      %10586 = func.call @cc_intern(%10582, %10585) : (i64, i64) -> i64
      %10587 = func.call @cc_nil_value() : () -> i64
      %10588 = func.call @cc_cons(%10586, %10587) : (i64, i64) -> i64
      %10589 = func.call @cc_values_pack(%10588) : (i64) -> i64
      func.call @stack_push_pointer(%10586) : (i64) -> ()
      %10590 = llvm.mlir.addressof @str1301 : !llvm.ptr
      %10591 = arith.constant 4 : i64
      %10592 = func.call @cc_make_string(%10590, %10591) : (!llvm.ptr, i64) -> i64
      %10593 = llvm.mlir.addressof @str1302 : !llvm.ptr
      %10594 = arith.constant 11 : i64
      %10595 = func.call @cc_make_string(%10593, %10594) : (!llvm.ptr, i64) -> i64
      %10596 = func.call @cc_intern(%10592, %10595) : (i64, i64) -> i64
      %10597 = func.call @cc_nil_value() : () -> i64
      %10598 = func.call @cc_cons(%10596, %10597) : (i64, i64) -> i64
      %10599 = func.call @cc_values_pack(%10598) : (i64) -> i64
      func.call @stack_push_pointer(%10596) : (i64) -> ()
      %10600 = llvm.mlir.addressof @str1303 : !llvm.ptr
      %10601 = arith.constant 10 : i64
      %10602 = func.call @cc_make_string(%10600, %10601) : (!llvm.ptr, i64) -> i64
      %10603 = llvm.mlir.addressof @str1304 : !llvm.ptr
      %10604 = arith.constant 11 : i64
      %10605 = func.call @cc_make_string(%10603, %10604) : (!llvm.ptr, i64) -> i64
      %10606 = func.call @cc_intern(%10602, %10605) : (i64, i64) -> i64
      %10607 = func.call @cc_nil_value() : () -> i64
      %10608 = func.call @cc_cons(%10606, %10607) : (i64, i64) -> i64
      %10609 = func.call @cc_values_pack(%10608) : (i64) -> i64
      func.call @stack_push_pointer(%10606) : (i64) -> ()
      %10610 = llvm.mlir.addressof @str1305 : !llvm.ptr
      %10611 = arith.constant 12 : i64
      %10612 = func.call @cc_make_string(%10610, %10611) : (!llvm.ptr, i64) -> i64
      %10613 = llvm.mlir.addressof @str1306 : !llvm.ptr
      %10614 = arith.constant 11 : i64
      %10615 = func.call @cc_make_string(%10613, %10614) : (!llvm.ptr, i64) -> i64
      %10616 = func.call @cc_intern(%10612, %10615) : (i64, i64) -> i64
      %10617 = func.call @cc_nil_value() : () -> i64
      %10618 = func.call @cc_cons(%10616, %10617) : (i64, i64) -> i64
      %10619 = func.call @cc_values_pack(%10618) : (i64) -> i64
      func.call @stack_push_pointer(%10616) : (i64) -> ()
      %10620 = llvm.mlir.addressof @str1307 : !llvm.ptr
      %10621 = arith.constant 16 : i64
      %10622 = func.call @cc_make_string(%10620, %10621) : (!llvm.ptr, i64) -> i64
      %10623 = llvm.mlir.addressof @str1308 : !llvm.ptr
      %10624 = arith.constant 11 : i64
      %10625 = func.call @cc_make_string(%10623, %10624) : (!llvm.ptr, i64) -> i64
      %10626 = func.call @cc_intern(%10622, %10625) : (i64, i64) -> i64
      %10627 = func.call @cc_nil_value() : () -> i64
      %10628 = func.call @cc_cons(%10626, %10627) : (i64, i64) -> i64
      %10629 = func.call @cc_values_pack(%10628) : (i64) -> i64
      func.call @stack_push_pointer(%10626) : (i64) -> ()
      %10630 = llvm.mlir.addressof @str1309 : !llvm.ptr
      %10631 = arith.constant 18 : i64
      %10632 = func.call @cc_make_string(%10630, %10631) : (!llvm.ptr, i64) -> i64
      %10633 = llvm.mlir.addressof @str1310 : !llvm.ptr
      %10634 = arith.constant 11 : i64
      %10635 = func.call @cc_make_string(%10633, %10634) : (!llvm.ptr, i64) -> i64
      %10636 = func.call @cc_intern(%10632, %10635) : (i64, i64) -> i64
      %10637 = func.call @cc_nil_value() : () -> i64
      %10638 = func.call @cc_cons(%10636, %10637) : (i64, i64) -> i64
      %10639 = func.call @cc_values_pack(%10638) : (i64) -> i64
      func.call @stack_push_pointer(%10636) : (i64) -> ()
      %10640 = llvm.mlir.addressof @str1311 : !llvm.ptr
      %10641 = arith.constant 13 : i64
      %10642 = func.call @cc_make_string(%10640, %10641) : (!llvm.ptr, i64) -> i64
      %10643 = llvm.mlir.addressof @str1312 : !llvm.ptr
      %10644 = arith.constant 11 : i64
      %10645 = func.call @cc_make_string(%10643, %10644) : (!llvm.ptr, i64) -> i64
      %10646 = func.call @cc_intern(%10642, %10645) : (i64, i64) -> i64
      %10647 = func.call @cc_nil_value() : () -> i64
      %10648 = func.call @cc_cons(%10646, %10647) : (i64, i64) -> i64
      %10649 = func.call @cc_values_pack(%10648) : (i64) -> i64
      func.call @stack_push_pointer(%10646) : (i64) -> ()
      %10650 = llvm.mlir.addressof @str1313 : !llvm.ptr
      %10651 = arith.constant 8 : i64
      %10652 = func.call @cc_make_string(%10650, %10651) : (!llvm.ptr, i64) -> i64
      %10653 = llvm.mlir.addressof @str1314 : !llvm.ptr
      %10654 = arith.constant 11 : i64
      %10655 = func.call @cc_make_string(%10653, %10654) : (!llvm.ptr, i64) -> i64
      %10656 = func.call @cc_intern(%10652, %10655) : (i64, i64) -> i64
      %10657 = func.call @cc_nil_value() : () -> i64
      %10658 = func.call @cc_cons(%10656, %10657) : (i64, i64) -> i64
      %10659 = func.call @cc_values_pack(%10658) : (i64) -> i64
      func.call @stack_push_pointer(%10656) : (i64) -> ()
      %10660 = llvm.mlir.addressof @str1315 : !llvm.ptr
      %10661 = arith.constant 7 : i64
      %10662 = func.call @cc_make_string(%10660, %10661) : (!llvm.ptr, i64) -> i64
      %10663 = llvm.mlir.addressof @str1316 : !llvm.ptr
      %10664 = arith.constant 11 : i64
      %10665 = func.call @cc_make_string(%10663, %10664) : (!llvm.ptr, i64) -> i64
      %10666 = func.call @cc_intern(%10662, %10665) : (i64, i64) -> i64
      %10667 = func.call @cc_nil_value() : () -> i64
      %10668 = func.call @cc_cons(%10666, %10667) : (i64, i64) -> i64
      %10669 = func.call @cc_values_pack(%10668) : (i64) -> i64
      func.call @stack_push_pointer(%10666) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10670 = func.call @stack_pop_pointer() : () -> i64
      %10671 = func.call @stack_pop_pointer() : () -> i64
      %10672 = func.call @cc_cons(%10671, %10670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10672) : (i64) -> ()
      %10673 = func.call @stack_pop_pointer() : () -> i64
      %10674 = func.call @stack_pop_pointer() : () -> i64
      %10675 = func.call @cc_cons(%10674, %10673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10675) : (i64) -> ()
      %10676 = func.call @stack_pop_pointer() : () -> i64
      %10677 = func.call @stack_pop_pointer() : () -> i64
      %10678 = func.call @cc_cons(%10677, %10676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10678) : (i64) -> ()
      %10679 = func.call @stack_pop_pointer() : () -> i64
      %10680 = func.call @stack_pop_pointer() : () -> i64
      %10681 = func.call @cc_cons(%10680, %10679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10681) : (i64) -> ()
      %10682 = func.call @stack_pop_pointer() : () -> i64
      %10683 = func.call @stack_pop_pointer() : () -> i64
      %10684 = func.call @cc_cons(%10683, %10682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10684) : (i64) -> ()
      %10685 = func.call @stack_pop_pointer() : () -> i64
      %10686 = func.call @stack_pop_pointer() : () -> i64
      %10687 = func.call @cc_cons(%10686, %10685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10687) : (i64) -> ()
      %10688 = func.call @stack_pop_pointer() : () -> i64
      %10689 = func.call @stack_pop_pointer() : () -> i64
      %10690 = func.call @cc_cons(%10689, %10688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10690) : (i64) -> ()
      %10691 = func.call @stack_pop_pointer() : () -> i64
      %10692 = func.call @stack_pop_pointer() : () -> i64
      %10693 = func.call @cc_cons(%10692, %10691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10693) : (i64) -> ()
      %10694 = func.call @stack_pop_pointer() : () -> i64
      %10695 = func.call @stack_pop_pointer() : () -> i64
      %10696 = func.call @cc_cons(%10695, %10694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10696) : (i64) -> ()
      %10697 = func.call @stack_pop_pointer() : () -> i64
      %10698 = func.call @stack_pop_pointer() : () -> i64
      %10699 = func.call @cc_cons(%10698, %10697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10699) : (i64) -> ()
      %10700 = func.call @stack_pop_pointer() : () -> i64
      %10701 = func.call @stack_pop_pointer() : () -> i64
      %10702 = func.call @cc_cons(%10701, %10700) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10702) : (i64) -> ()
      %10703 = func.call @stack_pop_pointer() : () -> i64
      %10704 = func.call @stack_pop_pointer() : () -> i64
      %10705 = func.call @cc_cons(%10704, %10703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10705) : (i64) -> ()
      %10706 = func.call @stack_pop_pointer() : () -> i64
      %10707 = func.call @stack_pop_pointer() : () -> i64
      %10708 = func.call @cc_cons(%10707, %10706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10708) : (i64) -> ()
      %10709 = func.call @stack_pop_pointer() : () -> i64
      %10710 = func.call @stack_pop_pointer() : () -> i64
      %10711 = func.call @cc_cons(%10710, %10709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10711) : (i64) -> ()
      %10712 = func.call @stack_pop_pointer() : () -> i64
      %10713 = func.call @stack_pop_pointer() : () -> i64
      %10714 = func.call @cc_cons(%10713, %10712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10714) : (i64) -> ()
      %10715 = func.call @stack_pop_pointer() : () -> i64
      %10716 = func.call @stack_pop_pointer() : () -> i64
      %10717 = func.call @cc_cons(%10716, %10715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10717) : (i64) -> ()
      %10718 = func.call @stack_pop_pointer() : () -> i64
      %10719 = func.call @stack_pop_pointer() : () -> i64
      %10720 = func.call @cc_cons(%10719, %10718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10720) : (i64) -> ()
      %10721 = func.call @stack_pop_pointer() : () -> i64
      %10722 = func.call @stack_pop_pointer() : () -> i64
      %10723 = func.call @cc_cons(%10722, %10721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10723) : (i64) -> ()
      %10724 = func.call @stack_pop_pointer() : () -> i64
      %10725 = func.call @stack_pop_pointer() : () -> i64
      %10726 = func.call @cc_cons(%10725, %10724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10726) : (i64) -> ()
      %10727 = func.call @stack_pop_pointer() : () -> i64
      %10728 = func.call @stack_pop_pointer() : () -> i64
      %10729 = func.call @cc_cons(%10728, %10727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10729) : (i64) -> ()
      %10730 = func.call @stack_pop_pointer() : () -> i64
      %10731 = func.call @stack_pop_pointer() : () -> i64
      %10732 = func.call @cc_cons(%10731, %10730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10732) : (i64) -> ()
      %10733 = func.call @stack_pop_pointer() : () -> i64
      %10734 = func.call @stack_pop_pointer() : () -> i64
      %10735 = func.call @cc_cons(%10734, %10733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10735) : (i64) -> ()
      %10736 = func.call @stack_pop_pointer() : () -> i64
      %10737 = func.call @stack_pop_pointer() : () -> i64
      %10738 = func.call @cc_cons(%10737, %10736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10738) : (i64) -> ()
      %10739 = func.call @stack_pop_pointer() : () -> i64
      %10740 = func.call @stack_pop_pointer() : () -> i64
      %10741 = func.call @cc_cons(%10740, %10739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10741) : (i64) -> ()
      %10742 = func.call @stack_pop_pointer() : () -> i64
      %10743 = func.call @stack_pop_pointer() : () -> i64
      %10744 = func.call @cc_cons(%10743, %10742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10744) : (i64) -> ()
      %10745 = func.call @stack_pop_pointer() : () -> i64
      %10746 = func.call @stack_pop_pointer() : () -> i64
      %10747 = func.call @cc_cons(%10746, %10745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10747) : (i64) -> ()
      %10748 = func.call @stack_pop_pointer() : () -> i64
      %10749 = func.call @stack_pop_pointer() : () -> i64
      %10750 = func.call @cc_cons(%10749, %10748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10750) : (i64) -> ()
      %10751 = func.call @stack_pop_pointer() : () -> i64
      %10752 = func.call @stack_pop_pointer() : () -> i64
      %10753 = func.call @cc_cons(%10752, %10751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10753) : (i64) -> ()
      %10754 = func.call @stack_pop_pointer() : () -> i64
      %10755 = func.call @stack_pop_pointer() : () -> i64
      %10756 = func.call @cc_cons(%10755, %10754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10756) : (i64) -> ()
      %10757 = func.call @stack_pop_pointer() : () -> i64
      %10758 = func.call @stack_pop_pointer() : () -> i64
      %10759 = func.call @cc_cons(%10758, %10757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10759) : (i64) -> ()
      %10760 = func.call @stack_pop_pointer() : () -> i64
      %10761 = func.call @stack_pop_pointer() : () -> i64
      %10762 = func.call @cc_cons(%10761, %10760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10762) : (i64) -> ()
      %10763 = func.call @stack_pop_pointer() : () -> i64
      %10764 = func.call @stack_pop_pointer() : () -> i64
      %10765 = func.call @cc_cons(%10764, %10763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10765) : (i64) -> ()
      %10766 = func.call @stack_pop_pointer() : () -> i64
      %10767 = func.call @stack_pop_pointer() : () -> i64
      %10768 = func.call @cc_cons(%10767, %10766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10768) : (i64) -> ()
      %10769 = func.call @stack_pop_pointer() : () -> i64
      %10770 = func.call @stack_pop_pointer() : () -> i64
      %10771 = func.call @cc_cons(%10770, %10769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10771) : (i64) -> ()
      %10772 = func.call @stack_pop_pointer() : () -> i64
      %10773 = func.call @stack_pop_pointer() : () -> i64
      %10774 = func.call @cc_cons(%10773, %10772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10774) : (i64) -> ()
      %10775 = func.call @stack_pop_pointer() : () -> i64
      %10776 = func.call @stack_pop_pointer() : () -> i64
      %10777 = func.call @cc_cons(%10776, %10775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10777) : (i64) -> ()
      %10778 = func.call @stack_pop_pointer() : () -> i64
      %10779 = func.call @stack_pop_pointer() : () -> i64
      %10780 = func.call @cc_cons(%10779, %10778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10780) : (i64) -> ()
      %10781 = func.call @stack_pop_pointer() : () -> i64
      %10782 = func.call @stack_pop_pointer() : () -> i64
      %10783 = func.call @cc_cons(%10782, %10781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10783) : (i64) -> ()
      %10784 = func.call @stack_pop_pointer() : () -> i64
      %10785 = func.call @stack_pop_pointer() : () -> i64
      %10786 = func.call @cc_cons(%10785, %10784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10786) : (i64) -> ()
      %10787 = func.call @stack_pop_pointer() : () -> i64
      %10788 = func.call @stack_pop_pointer() : () -> i64
      %10789 = func.call @cc_cons(%10788, %10787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10789) : (i64) -> ()
      %10790 = func.call @stack_pop_pointer() : () -> i64
      %10791 = func.call @stack_pop_pointer() : () -> i64
      %10792 = func.call @cc_cons(%10791, %10790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10792) : (i64) -> ()
      %10793 = func.call @stack_pop_pointer() : () -> i64
      %10794 = func.call @stack_pop_pointer() : () -> i64
      %10795 = func.call @cc_cons(%10794, %10793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10795) : (i64) -> ()
      %10796 = func.call @stack_pop_pointer() : () -> i64
      %10797 = func.call @stack_pop_pointer() : () -> i64
      %10798 = func.call @cc_cons(%10797, %10796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10798) : (i64) -> ()
      %10799 = func.call @stack_pop_pointer() : () -> i64
      %10800 = func.call @stack_pop_pointer() : () -> i64
      %10801 = func.call @cc_cons(%10800, %10799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10801) : (i64) -> ()
      %10802 = func.call @stack_pop_pointer() : () -> i64
      %10803 = func.call @stack_pop_pointer() : () -> i64
      %10804 = func.call @cc_cons(%10803, %10802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10804) : (i64) -> ()
      %10805 = func.call @stack_pop_pointer() : () -> i64
      %10806 = func.call @stack_pop_pointer() : () -> i64
      %10807 = func.call @cc_cons(%10806, %10805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10807) : (i64) -> ()
      %10808 = func.call @stack_pop_pointer() : () -> i64
      %10809 = func.call @stack_pop_pointer() : () -> i64
      %10810 = func.call @cc_cons(%10809, %10808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10810) : (i64) -> ()
      %10811 = func.call @stack_pop_pointer() : () -> i64
      %10812 = func.call @stack_pop_pointer() : () -> i64
      %10813 = func.call @cc_cons(%10812, %10811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10813) : (i64) -> ()
      %10814 = func.call @stack_pop_pointer() : () -> i64
      %10815 = func.call @stack_pop_pointer() : () -> i64
      %10816 = func.call @cc_cons(%10815, %10814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10816) : (i64) -> ()
      %10817 = func.call @stack_pop_pointer() : () -> i64
      %10818 = func.call @stack_pop_pointer() : () -> i64
      %10819 = func.call @cc_cons(%10818, %10817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10819) : (i64) -> ()
      %10820 = func.call @stack_pop_pointer() : () -> i64
      %10821 = func.call @stack_pop_pointer() : () -> i64
      %10822 = func.call @cc_cons(%10821, %10820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10822) : (i64) -> ()
      %10823 = func.call @stack_pop_pointer() : () -> i64
      %10824 = func.call @stack_pop_pointer() : () -> i64
      %10825 = func.call @cc_cons(%10824, %10823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10825) : (i64) -> ()
      %10826 = func.call @stack_pop_pointer() : () -> i64
      %10827 = func.call @stack_pop_pointer() : () -> i64
      %10828 = func.call @cc_cons(%10827, %10826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10828) : (i64) -> ()
      %10829 = func.call @stack_pop_pointer() : () -> i64
      %10830 = func.call @stack_pop_pointer() : () -> i64
      %10831 = func.call @cc_cons(%10830, %10829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10831) : (i64) -> ()
      %10832 = func.call @stack_pop_pointer() : () -> i64
      %10833 = func.call @stack_pop_pointer() : () -> i64
      %10834 = func.call @cc_cons(%10833, %10832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10834) : (i64) -> ()
      %10835 = func.call @stack_pop_pointer() : () -> i64
      %10836 = func.call @stack_pop_pointer() : () -> i64
      %10837 = func.call @cc_cons(%10836, %10835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10837) : (i64) -> ()
      %10838 = func.call @stack_pop_pointer() : () -> i64
      %10839 = func.call @stack_pop_pointer() : () -> i64
      %10840 = func.call @cc_cons(%10839, %10838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10840) : (i64) -> ()
      %10841 = func.call @stack_pop_pointer() : () -> i64
      %10842 = func.call @stack_pop_pointer() : () -> i64
      %10843 = func.call @cc_cons(%10842, %10841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10843) : (i64) -> ()
      %10844 = func.call @stack_pop_pointer() : () -> i64
      %10845 = func.call @stack_pop_pointer() : () -> i64
      %10846 = func.call @cc_cons(%10845, %10844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10846) : (i64) -> ()
      %10847 = func.call @stack_pop_pointer() : () -> i64
      %10848 = func.call @stack_pop_pointer() : () -> i64
      %10849 = func.call @cc_cons(%10848, %10847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10849) : (i64) -> ()
      %10850 = func.call @stack_pop_pointer() : () -> i64
      %10851 = func.call @stack_pop_pointer() : () -> i64
      %10852 = func.call @cc_cons(%10851, %10850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10852) : (i64) -> ()
      %10853 = func.call @stack_pop_pointer() : () -> i64
      %10854 = func.call @stack_pop_pointer() : () -> i64
      %10855 = func.call @cc_cons(%10854, %10853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10855) : (i64) -> ()
      %10856 = func.call @stack_pop_pointer() : () -> i64
      %10857 = func.call @stack_pop_pointer() : () -> i64
      %10858 = func.call @cc_cons(%10857, %10856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10858) : (i64) -> ()
      %10859 = func.call @stack_pop_pointer() : () -> i64
      %10860 = func.call @stack_pop_pointer() : () -> i64
      %10861 = func.call @cc_cons(%10860, %10859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10861) : (i64) -> ()
      %10862 = func.call @stack_pop_pointer() : () -> i64
      %10863 = func.call @stack_pop_pointer() : () -> i64
      %10864 = func.call @cc_cons(%10863, %10862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10864) : (i64) -> ()
      %10865 = func.call @stack_pop_pointer() : () -> i64
      %10866 = func.call @stack_pop_pointer() : () -> i64
      %10867 = func.call @cc_cons(%10866, %10865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10867) : (i64) -> ()
      %10868 = func.call @stack_pop_pointer() : () -> i64
      %10869 = func.call @stack_pop_pointer() : () -> i64
      %10870 = func.call @cc_cons(%10869, %10868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10870) : (i64) -> ()
      %10871 = func.call @stack_pop_pointer() : () -> i64
      %10872 = func.call @stack_pop_pointer() : () -> i64
      %10873 = func.call @cc_cons(%10872, %10871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10873) : (i64) -> ()
      %10874 = func.call @stack_pop_pointer() : () -> i64
      %10875 = func.call @stack_pop_pointer() : () -> i64
      %10876 = func.call @cc_cons(%10875, %10874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10876) : (i64) -> ()
      %10877 = func.call @stack_pop_pointer() : () -> i64
      %10878 = func.call @stack_pop_pointer() : () -> i64
      %10879 = func.call @cc_cons(%10878, %10877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10879) : (i64) -> ()
      %10880 = func.call @stack_pop_pointer() : () -> i64
      %10881 = func.call @stack_pop_pointer() : () -> i64
      %10882 = func.call @cc_cons(%10881, %10880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10882) : (i64) -> ()
      %10883 = func.call @stack_pop_pointer() : () -> i64
      %10884 = func.call @stack_pop_pointer() : () -> i64
      %10885 = func.call @cc_cons(%10884, %10883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10885) : (i64) -> ()
      %10886 = func.call @stack_pop_pointer() : () -> i64
      %10887 = func.call @stack_pop_pointer() : () -> i64
      %10888 = func.call @cc_cons(%10887, %10886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10888) : (i64) -> ()
      %10889 = func.call @stack_pop_pointer() : () -> i64
      %10890 = func.call @stack_pop_pointer() : () -> i64
      %10891 = func.call @cc_cons(%10890, %10889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10891) : (i64) -> ()
      %10892 = func.call @stack_pop_pointer() : () -> i64
      %10893 = func.call @stack_pop_pointer() : () -> i64
      %10894 = func.call @cc_cons(%10893, %10892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10894) : (i64) -> ()
      %10895 = func.call @stack_pop_pointer() : () -> i64
      %10896 = func.call @stack_pop_pointer() : () -> i64
      %10897 = func.call @cc_cons(%10896, %10895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10897) : (i64) -> ()
      %10898 = func.call @stack_pop_pointer() : () -> i64
      %10899 = func.call @stack_pop_pointer() : () -> i64
      %10900 = func.call @cc_cons(%10899, %10898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10900) : (i64) -> ()
      %10901 = func.call @stack_pop_pointer() : () -> i64
      %10902 = func.call @stack_pop_pointer() : () -> i64
      %10903 = func.call @cc_cons(%10902, %10901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10903) : (i64) -> ()
      %10904 = func.call @stack_pop_pointer() : () -> i64
      %10905 = func.call @stack_pop_pointer() : () -> i64
      %10906 = func.call @cc_cons(%10905, %10904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10906) : (i64) -> ()
      %10907 = func.call @stack_pop_pointer() : () -> i64
      %10908 = func.call @stack_pop_pointer() : () -> i64
      %10909 = func.call @cc_cons(%10908, %10907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10909) : (i64) -> ()
      %10910 = func.call @stack_pop_pointer() : () -> i64
      %10911 = func.call @stack_pop_pointer() : () -> i64
      %10912 = func.call @cc_cons(%10911, %10910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10912) : (i64) -> ()
      %10913 = func.call @stack_pop_pointer() : () -> i64
      %10914 = func.call @stack_pop_pointer() : () -> i64
      %10915 = func.call @cc_cons(%10914, %10913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10915) : (i64) -> ()
      %10916 = func.call @stack_pop_pointer() : () -> i64
      %10917 = func.call @stack_pop_pointer() : () -> i64
      %10918 = func.call @cc_cons(%10917, %10916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10918) : (i64) -> ()
      %10919 = func.call @stack_pop_pointer() : () -> i64
      %10920 = func.call @stack_pop_pointer() : () -> i64
      %10921 = func.call @cc_cons(%10920, %10919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10921) : (i64) -> ()
      %10922 = func.call @stack_pop_pointer() : () -> i64
      %10923 = func.call @stack_pop_pointer() : () -> i64
      %10924 = func.call @cc_cons(%10923, %10922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10924) : (i64) -> ()
      %10925 = func.call @stack_pop_pointer() : () -> i64
      %10926 = func.call @stack_pop_pointer() : () -> i64
      %10927 = func.call @cc_cons(%10926, %10925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10927) : (i64) -> ()
      %10928 = func.call @stack_pop_pointer() : () -> i64
      %10929 = func.call @stack_pop_pointer() : () -> i64
      %10930 = func.call @cc_cons(%10929, %10928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10930) : (i64) -> ()
      %10931 = func.call @stack_pop_pointer() : () -> i64
      %10932 = func.call @stack_pop_pointer() : () -> i64
      %10933 = func.call @cc_cons(%10932, %10931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10933) : (i64) -> ()
      %10934 = func.call @stack_pop_pointer() : () -> i64
      %10935 = func.call @stack_pop_pointer() : () -> i64
      %10936 = func.call @cc_cons(%10935, %10934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10936) : (i64) -> ()
      %10937 = func.call @stack_pop_pointer() : () -> i64
      %10938 = func.call @stack_pop_pointer() : () -> i64
      %10939 = func.call @cc_cons(%10938, %10937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10939) : (i64) -> ()
      %10940 = func.call @stack_pop_pointer() : () -> i64
      %10941 = func.call @stack_pop_pointer() : () -> i64
      %10942 = func.call @cc_cons(%10941, %10940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10942) : (i64) -> ()
      %10943 = func.call @stack_pop_pointer() : () -> i64
      %10944 = func.call @stack_pop_pointer() : () -> i64
      %10945 = func.call @cc_cons(%10944, %10943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10945) : (i64) -> ()
      %10946 = func.call @stack_pop_pointer() : () -> i64
      %10947 = func.call @stack_pop_pointer() : () -> i64
      %10948 = func.call @cc_cons(%10947, %10946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10948) : (i64) -> ()
      %10949 = func.call @stack_pop_pointer() : () -> i64
      %10950 = func.call @stack_pop_pointer() : () -> i64
      %10951 = func.call @cc_cons(%10950, %10949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10951) : (i64) -> ()
      %10952 = func.call @stack_pop_pointer() : () -> i64
      %10953 = func.call @stack_pop_pointer() : () -> i64
      %10954 = func.call @cc_cons(%10953, %10952) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10954) : (i64) -> ()
      %10955 = func.call @stack_pop_pointer() : () -> i64
      %10956 = func.call @stack_pop_pointer() : () -> i64
      %10957 = func.call @cc_cons(%10956, %10955) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10957) : (i64) -> ()
      %10958 = func.call @stack_pop_pointer() : () -> i64
      %10959 = func.call @stack_pop_pointer() : () -> i64
      %10960 = func.call @cc_cons(%10959, %10958) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10960) : (i64) -> ()
      %10961 = func.call @stack_pop_pointer() : () -> i64
      %10962 = func.call @stack_pop_pointer() : () -> i64
      %10963 = func.call @cc_cons(%10962, %10961) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10963) : (i64) -> ()
      %10964 = func.call @stack_pop_pointer() : () -> i64
      %10965 = func.call @stack_pop_pointer() : () -> i64
      %10966 = func.call @cc_cons(%10965, %10964) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10966) : (i64) -> ()
      %10967 = func.call @stack_pop_pointer() : () -> i64
      %10968 = func.call @stack_pop_pointer() : () -> i64
      %10969 = func.call @cc_cons(%10968, %10967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10969) : (i64) -> ()
      %10970 = func.call @stack_pop_pointer() : () -> i64
      %10971 = func.call @stack_pop_pointer() : () -> i64
      %10972 = func.call @cc_cons(%10971, %10970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10972) : (i64) -> ()
      %10973 = func.call @stack_pop_pointer() : () -> i64
      %10974 = func.call @stack_pop_pointer() : () -> i64
      %10975 = func.call @cc_cons(%10974, %10973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10975) : (i64) -> ()
      %10976 = func.call @stack_pop_pointer() : () -> i64
      %10977 = func.call @stack_pop_pointer() : () -> i64
      %10978 = func.call @cc_cons(%10977, %10976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10978) : (i64) -> ()
      %10979 = func.call @stack_pop_pointer() : () -> i64
      %10980 = func.call @stack_pop_pointer() : () -> i64
      %10981 = func.call @cc_cons(%10980, %10979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10981) : (i64) -> ()
      %10982 = func.call @stack_pop_pointer() : () -> i64
      %10983 = func.call @stack_pop_pointer() : () -> i64
      %10984 = func.call @cc_cons(%10983, %10982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10984) : (i64) -> ()
      %10985 = func.call @stack_pop_pointer() : () -> i64
      %10986 = func.call @stack_pop_pointer() : () -> i64
      %10987 = func.call @cc_cons(%10986, %10985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10987) : (i64) -> ()
      %10988 = func.call @stack_pop_pointer() : () -> i64
      %10989 = func.call @stack_pop_pointer() : () -> i64
      %10990 = func.call @cc_cons(%10989, %10988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10990) : (i64) -> ()
      %10991 = func.call @stack_pop_pointer() : () -> i64
      %10992 = func.call @stack_pop_pointer() : () -> i64
      %10993 = func.call @cc_cons(%10992, %10991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10993) : (i64) -> ()
      %10994 = func.call @stack_pop_pointer() : () -> i64
      %10995 = func.call @stack_pop_pointer() : () -> i64
      %10996 = func.call @cc_cons(%10995, %10994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10996) : (i64) -> ()
      %10997 = func.call @stack_pop_pointer() : () -> i64
      %10998 = func.call @stack_pop_pointer() : () -> i64
      %10999 = func.call @cc_cons(%10998, %10997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10999) : (i64) -> ()
      %11000 = func.call @stack_pop_pointer() : () -> i64
      %11001 = func.call @stack_pop_pointer() : () -> i64
      %11002 = func.call @cc_cons(%11001, %11000) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11002) : (i64) -> ()
      %11003 = func.call @stack_pop_pointer() : () -> i64
      %11004 = func.call @stack_pop_pointer() : () -> i64
      %11005 = func.call @cc_cons(%11004, %11003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11005) : (i64) -> ()
      %11006 = func.call @stack_pop_pointer() : () -> i64
      %11007 = func.call @stack_pop_pointer() : () -> i64
      %11008 = func.call @cc_cons(%11007, %11006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11008) : (i64) -> ()
      %11009 = func.call @stack_pop_pointer() : () -> i64
      %11010 = func.call @stack_pop_pointer() : () -> i64
      %11011 = func.call @cc_cons(%11010, %11009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11011) : (i64) -> ()
      %11012 = func.call @stack_pop_pointer() : () -> i64
      %11013 = func.call @stack_pop_pointer() : () -> i64
      %11014 = func.call @cc_cons(%11013, %11012) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11014) : (i64) -> ()
      %11015 = func.call @stack_pop_pointer() : () -> i64
      %11016 = func.call @stack_pop_pointer() : () -> i64
      %11017 = func.call @cc_cons(%11016, %11015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11017) : (i64) -> ()
      %11018 = func.call @stack_pop_pointer() : () -> i64
      %11019 = func.call @stack_pop_pointer() : () -> i64
      %11020 = func.call @cc_cons(%11019, %11018) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11020) : (i64) -> ()
      %11021 = func.call @stack_pop_pointer() : () -> i64
      %11022 = func.call @stack_pop_pointer() : () -> i64
      %11023 = func.call @cc_cons(%11022, %11021) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11023) : (i64) -> ()
      %11024 = func.call @stack_pop_pointer() : () -> i64
      %11025 = func.call @stack_pop_pointer() : () -> i64
      %11026 = func.call @cc_cons(%11025, %11024) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11026) : (i64) -> ()
      %11027 = func.call @stack_pop_pointer() : () -> i64
      %11028 = func.call @stack_pop_pointer() : () -> i64
      %11029 = func.call @cc_cons(%11028, %11027) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11029) : (i64) -> ()
      %11030 = func.call @stack_pop_pointer() : () -> i64
      %11031 = func.call @stack_pop_pointer() : () -> i64
      %11032 = func.call @cc_cons(%11031, %11030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11032) : (i64) -> ()
      %11033 = func.call @stack_pop_pointer() : () -> i64
      %11034 = func.call @stack_pop_pointer() : () -> i64
      %11035 = func.call @cc_cons(%11034, %11033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11035) : (i64) -> ()
      %11036 = func.call @stack_pop_pointer() : () -> i64
      %11037 = func.call @stack_pop_pointer() : () -> i64
      %11038 = func.call @cc_cons(%11037, %11036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11038) : (i64) -> ()
      %11039 = func.call @stack_pop_pointer() : () -> i64
      %11040 = func.call @stack_pop_pointer() : () -> i64
      %11041 = func.call @cc_cons(%11040, %11039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11041) : (i64) -> ()
      %11042 = func.call @stack_pop_pointer() : () -> i64
      %11043 = func.call @stack_pop_pointer() : () -> i64
      %11044 = func.call @cc_cons(%11043, %11042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11044) : (i64) -> ()
      %11045 = func.call @stack_pop_pointer() : () -> i64
      %11046 = func.call @stack_pop_pointer() : () -> i64
      %11047 = func.call @cc_cons(%11046, %11045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11047) : (i64) -> ()
      %11048 = func.call @stack_pop_pointer() : () -> i64
      %11049 = func.call @stack_pop_pointer() : () -> i64
      %11050 = func.call @cc_cons(%11049, %11048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11050) : (i64) -> ()
      %11051 = func.call @stack_pop_pointer() : () -> i64
      %11052 = func.call @stack_pop_pointer() : () -> i64
      %11053 = func.call @cc_cons(%11052, %11051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11053) : (i64) -> ()
      %11054 = func.call @stack_pop_pointer() : () -> i64
      %11055 = func.call @stack_pop_pointer() : () -> i64
      %11056 = func.call @cc_cons(%11055, %11054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11056) : (i64) -> ()
      %11057 = func.call @stack_pop_pointer() : () -> i64
      %11058 = func.call @stack_pop_pointer() : () -> i64
      %11059 = func.call @cc_cons(%11058, %11057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11059) : (i64) -> ()
      %11060 = func.call @stack_pop_pointer() : () -> i64
      %11061 = func.call @stack_pop_pointer() : () -> i64
      %11062 = func.call @cc_cons(%11061, %11060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11062) : (i64) -> ()
      %11063 = func.call @stack_pop_pointer() : () -> i64
      %11064 = func.call @stack_pop_pointer() : () -> i64
      %11065 = func.call @cc_cons(%11064, %11063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11065) : (i64) -> ()
      %11066 = func.call @stack_pop_pointer() : () -> i64
      %11067 = func.call @stack_pop_pointer() : () -> i64
      %11068 = func.call @cc_cons(%11067, %11066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11068) : (i64) -> ()
      %11069 = func.call @stack_pop_pointer() : () -> i64
      %11070 = func.call @stack_pop_pointer() : () -> i64
      %11071 = func.call @cc_cons(%11070, %11069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11071) : (i64) -> ()
      %11072 = func.call @stack_pop_pointer() : () -> i64
      %11073 = func.call @stack_pop_pointer() : () -> i64
      %11074 = func.call @cc_cons(%11073, %11072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11074) : (i64) -> ()
      %11075 = func.call @stack_pop_pointer() : () -> i64
      %11076 = func.call @stack_pop_pointer() : () -> i64
      %11077 = func.call @cc_cons(%11076, %11075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11077) : (i64) -> ()
      %11078 = func.call @stack_pop_pointer() : () -> i64
      %11079 = func.call @stack_pop_pointer() : () -> i64
      %11080 = func.call @cc_cons(%11079, %11078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11080) : (i64) -> ()
      %11081 = func.call @stack_pop_pointer() : () -> i64
      %11082 = func.call @stack_pop_pointer() : () -> i64
      %11083 = func.call @cc_cons(%11082, %11081) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11083) : (i64) -> ()
      %11084 = func.call @stack_pop_pointer() : () -> i64
      %11085 = func.call @stack_pop_pointer() : () -> i64
      %11086 = func.call @cc_cons(%11085, %11084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11086) : (i64) -> ()
      %11087 = func.call @stack_pop_pointer() : () -> i64
      %11088 = func.call @stack_pop_pointer() : () -> i64
      %11089 = func.call @cc_cons(%11088, %11087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11089) : (i64) -> ()
      %11090 = func.call @stack_pop_pointer() : () -> i64
      %11091 = func.call @stack_pop_pointer() : () -> i64
      %11092 = func.call @cc_cons(%11091, %11090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11092) : (i64) -> ()
      %11093 = func.call @stack_pop_pointer() : () -> i64
      %11094 = func.call @stack_pop_pointer() : () -> i64
      %11095 = func.call @cc_cons(%11094, %11093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11095) : (i64) -> ()
      %11096 = func.call @stack_pop_pointer() : () -> i64
      %11097 = func.call @stack_pop_pointer() : () -> i64
      %11098 = func.call @cc_cons(%11097, %11096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11098) : (i64) -> ()
      %11099 = func.call @stack_pop_pointer() : () -> i64
      %11100 = func.call @stack_pop_pointer() : () -> i64
      %11101 = func.call @cc_cons(%11100, %11099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11101) : (i64) -> ()
      %11102 = func.call @stack_pop_pointer() : () -> i64
      %11103 = func.call @stack_pop_pointer() : () -> i64
      %11104 = func.call @cc_cons(%11103, %11102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11104) : (i64) -> ()
      %11105 = func.call @stack_pop_pointer() : () -> i64
      %11106 = func.call @stack_pop_pointer() : () -> i64
      %11107 = func.call @cc_cons(%11106, %11105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11107) : (i64) -> ()
      %11108 = func.call @stack_pop_pointer() : () -> i64
      %11109 = func.call @stack_pop_pointer() : () -> i64
      %11110 = func.call @cc_cons(%11109, %11108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11110) : (i64) -> ()
      %11111 = func.call @stack_pop_pointer() : () -> i64
      %11112 = func.call @stack_pop_pointer() : () -> i64
      %11113 = func.call @cc_cons(%11112, %11111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11113) : (i64) -> ()
      %11114 = func.call @stack_pop_pointer() : () -> i64
      %11115 = func.call @stack_pop_pointer() : () -> i64
      %11116 = func.call @cc_cons(%11115, %11114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11116) : (i64) -> ()
      %11117 = func.call @stack_pop_pointer() : () -> i64
      %11118 = func.call @stack_pop_pointer() : () -> i64
      %11119 = func.call @cc_cons(%11118, %11117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11119) : (i64) -> ()
      %11120 = func.call @stack_pop_pointer() : () -> i64
      %11121 = func.call @stack_pop_pointer() : () -> i64
      %11122 = func.call @cc_cons(%11121, %11120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11122) : (i64) -> ()
      %11123 = func.call @stack_pop_pointer() : () -> i64
      %11124 = func.call @stack_pop_pointer() : () -> i64
      %11125 = func.call @cc_cons(%11124, %11123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11125) : (i64) -> ()
      %11126 = func.call @stack_pop_pointer() : () -> i64
      %11127 = func.call @stack_pop_pointer() : () -> i64
      %11128 = func.call @cc_cons(%11127, %11126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11128) : (i64) -> ()
      %11129 = func.call @stack_pop_pointer() : () -> i64
      %11130 = func.call @stack_pop_pointer() : () -> i64
      %11131 = func.call @cc_cons(%11130, %11129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11131) : (i64) -> ()
      %11132 = func.call @stack_pop_pointer() : () -> i64
      %11133 = func.call @stack_pop_pointer() : () -> i64
      %11134 = func.call @cc_cons(%11133, %11132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11134) : (i64) -> ()
      %11135 = func.call @stack_pop_pointer() : () -> i64
      %11136 = func.call @stack_pop_pointer() : () -> i64
      %11137 = func.call @cc_cons(%11136, %11135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11137) : (i64) -> ()
      %11138 = func.call @stack_pop_pointer() : () -> i64
      %11139 = func.call @stack_pop_pointer() : () -> i64
      %11140 = func.call @cc_cons(%11139, %11138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11140) : (i64) -> ()
      %11141 = func.call @stack_pop_pointer() : () -> i64
      %11142 = func.call @stack_pop_pointer() : () -> i64
      %11143 = func.call @cc_cons(%11142, %11141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11143) : (i64) -> ()
      %11144 = func.call @stack_pop_pointer() : () -> i64
      %11145 = func.call @stack_pop_pointer() : () -> i64
      %11146 = func.call @cc_cons(%11145, %11144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11146) : (i64) -> ()
      %11147 = func.call @stack_pop_pointer() : () -> i64
      %11148 = func.call @stack_pop_pointer() : () -> i64
      %11149 = func.call @cc_cons(%11148, %11147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11149) : (i64) -> ()
      %11150 = func.call @stack_pop_pointer() : () -> i64
      %11151 = func.call @stack_pop_pointer() : () -> i64
      %11152 = func.call @cc_cons(%11151, %11150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11152) : (i64) -> ()
      %11153 = func.call @stack_pop_pointer() : () -> i64
      %11154 = func.call @stack_pop_pointer() : () -> i64
      %11155 = func.call @cc_cons(%11154, %11153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11155) : (i64) -> ()
      %11156 = func.call @stack_pop_pointer() : () -> i64
      %11157 = func.call @stack_pop_pointer() : () -> i64
      %11158 = func.call @cc_cons(%11157, %11156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11158) : (i64) -> ()
      %11159 = func.call @stack_pop_pointer() : () -> i64
      %11160 = func.call @stack_pop_pointer() : () -> i64
      %11161 = func.call @cc_cons(%11160, %11159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11161) : (i64) -> ()
      %11162 = func.call @stack_pop_pointer() : () -> i64
      %11163 = func.call @stack_pop_pointer() : () -> i64
      %11164 = func.call @cc_cons(%11163, %11162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11164) : (i64) -> ()
      %11165 = func.call @stack_pop_pointer() : () -> i64
      %11166 = func.call @stack_pop_pointer() : () -> i64
      %11167 = func.call @cc_cons(%11166, %11165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11167) : (i64) -> ()
      %11168 = func.call @stack_pop_pointer() : () -> i64
      %11169 = func.call @stack_pop_pointer() : () -> i64
      %11170 = func.call @cc_cons(%11169, %11168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11170) : (i64) -> ()
      %11171 = func.call @stack_pop_pointer() : () -> i64
      %11172 = func.call @stack_pop_pointer() : () -> i64
      %11173 = func.call @cc_cons(%11172, %11171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11173) : (i64) -> ()
      %11174 = func.call @stack_pop_pointer() : () -> i64
      %11175 = func.call @stack_pop_pointer() : () -> i64
      %11176 = func.call @cc_cons(%11175, %11174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11176) : (i64) -> ()
      %11177 = func.call @stack_pop_pointer() : () -> i64
      %11178 = func.call @stack_pop_pointer() : () -> i64
      %11179 = func.call @cc_cons(%11178, %11177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11179) : (i64) -> ()
      %11180 = func.call @stack_pop_pointer() : () -> i64
      %11181 = func.call @stack_pop_pointer() : () -> i64
      %11182 = func.call @cc_cons(%11181, %11180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11182) : (i64) -> ()
      %11183 = func.call @stack_pop_pointer() : () -> i64
      %11184 = func.call @stack_pop_pointer() : () -> i64
      %11185 = func.call @cc_cons(%11184, %11183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11185) : (i64) -> ()
      %11186 = func.call @stack_pop_pointer() : () -> i64
      %11187 = func.call @stack_pop_pointer() : () -> i64
      %11188 = func.call @cc_cons(%11187, %11186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11188) : (i64) -> ()
      %11189 = func.call @stack_pop_pointer() : () -> i64
      %11190 = func.call @stack_pop_pointer() : () -> i64
      %11191 = func.call @cc_cons(%11190, %11189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11191) : (i64) -> ()
      %11192 = func.call @stack_pop_pointer() : () -> i64
      %11193 = func.call @stack_pop_pointer() : () -> i64
      %11194 = func.call @cc_cons(%11193, %11192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11194) : (i64) -> ()
      %11195 = func.call @stack_pop_pointer() : () -> i64
      %11196 = func.call @stack_pop_pointer() : () -> i64
      %11197 = func.call @cc_cons(%11196, %11195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11197) : (i64) -> ()
      %11198 = func.call @stack_pop_pointer() : () -> i64
      %11199 = func.call @stack_pop_pointer() : () -> i64
      %11200 = func.call @cc_cons(%11199, %11198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11200) : (i64) -> ()
      %11201 = func.call @stack_pop_pointer() : () -> i64
      %11202 = func.call @stack_pop_pointer() : () -> i64
      %11203 = func.call @cc_cons(%11202, %11201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11203) : (i64) -> ()
      %11204 = func.call @stack_pop_pointer() : () -> i64
      %11205 = func.call @stack_pop_pointer() : () -> i64
      %11206 = func.call @cc_cons(%11205, %11204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11206) : (i64) -> ()
      %11207 = func.call @stack_pop_pointer() : () -> i64
      %11208 = func.call @stack_pop_pointer() : () -> i64
      %11209 = func.call @cc_cons(%11208, %11207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11209) : (i64) -> ()
      %11210 = func.call @stack_pop_pointer() : () -> i64
      %11211 = func.call @stack_pop_pointer() : () -> i64
      %11212 = func.call @cc_cons(%11211, %11210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11212) : (i64) -> ()
      %11213 = func.call @stack_pop_pointer() : () -> i64
      %11214 = func.call @stack_pop_pointer() : () -> i64
      %11215 = func.call @cc_cons(%11214, %11213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11215) : (i64) -> ()
      %11216 = func.call @stack_pop_pointer() : () -> i64
      %11217 = func.call @stack_pop_pointer() : () -> i64
      %11218 = func.call @cc_cons(%11217, %11216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11218) : (i64) -> ()
      %11219 = func.call @stack_pop_pointer() : () -> i64
      %11220 = func.call @stack_pop_pointer() : () -> i64
      %11221 = func.call @cc_cons(%11220, %11219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11221) : (i64) -> ()
      %11222 = func.call @stack_pop_pointer() : () -> i64
      %11223 = func.call @stack_pop_pointer() : () -> i64
      %11224 = func.call @cc_cons(%11223, %11222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11224) : (i64) -> ()
      %11225 = func.call @stack_pop_pointer() : () -> i64
      %11226 = func.call @stack_pop_pointer() : () -> i64
      %11227 = func.call @cc_cons(%11226, %11225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11227) : (i64) -> ()
      %11228 = func.call @stack_pop_pointer() : () -> i64
      %11229 = func.call @stack_pop_pointer() : () -> i64
      %11230 = func.call @cc_cons(%11229, %11228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11230) : (i64) -> ()
      %11231 = func.call @stack_pop_pointer() : () -> i64
      %11232 = func.call @stack_pop_pointer() : () -> i64
      %11233 = func.call @cc_cons(%11232, %11231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11233) : (i64) -> ()
      %11234 = func.call @stack_pop_pointer() : () -> i64
      %11235 = func.call @stack_pop_pointer() : () -> i64
      %11236 = func.call @cc_cons(%11235, %11234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11236) : (i64) -> ()
      %11237 = func.call @stack_pop_pointer() : () -> i64
      %11238 = func.call @stack_pop_pointer() : () -> i64
      %11239 = func.call @cc_cons(%11238, %11237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11239) : (i64) -> ()
      %11240 = func.call @stack_pop_pointer() : () -> i64
      %11241 = func.call @stack_pop_pointer() : () -> i64
      %11242 = func.call @cc_cons(%11241, %11240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11242) : (i64) -> ()
      %11243 = func.call @stack_pop_pointer() : () -> i64
      %11244 = func.call @stack_pop_pointer() : () -> i64
      %11245 = func.call @cc_cons(%11244, %11243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11245) : (i64) -> ()
      %11246 = func.call @stack_pop_pointer() : () -> i64
      %11247 = func.call @stack_pop_pointer() : () -> i64
      %11248 = func.call @cc_cons(%11247, %11246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11248) : (i64) -> ()
      %11249 = func.call @stack_pop_pointer() : () -> i64
      %11250 = func.call @stack_pop_pointer() : () -> i64
      %11251 = func.call @cc_cons(%11250, %11249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11251) : (i64) -> ()
      %11252 = func.call @stack_pop_pointer() : () -> i64
      %11253 = func.call @stack_pop_pointer() : () -> i64
      %11254 = func.call @cc_cons(%11253, %11252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11254) : (i64) -> ()
      %11255 = func.call @stack_pop_pointer() : () -> i64
      %11256 = func.call @stack_pop_pointer() : () -> i64
      %11257 = func.call @cc_cons(%11256, %11255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11257) : (i64) -> ()
      %11258 = func.call @stack_pop_pointer() : () -> i64
      %11259 = func.call @stack_pop_pointer() : () -> i64
      %11260 = func.call @cc_cons(%11259, %11258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11260) : (i64) -> ()
      %11261 = func.call @stack_pop_pointer() : () -> i64
      %11262 = func.call @stack_pop_pointer() : () -> i64
      %11263 = func.call @cc_cons(%11262, %11261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11263) : (i64) -> ()
      %11264 = func.call @stack_pop_pointer() : () -> i64
      %11265 = func.call @stack_pop_pointer() : () -> i64
      %11266 = func.call @cc_cons(%11265, %11264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11266) : (i64) -> ()
      %11267 = func.call @stack_pop_pointer() : () -> i64
      %11268 = func.call @stack_pop_pointer() : () -> i64
      %11269 = func.call @cc_cons(%11268, %11267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11269) : (i64) -> ()
      %11270 = func.call @stack_pop_pointer() : () -> i64
      %11271 = func.call @stack_pop_pointer() : () -> i64
      %11272 = func.call @cc_cons(%11271, %11270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11272) : (i64) -> ()
      %11273 = func.call @stack_pop_pointer() : () -> i64
      %11274 = func.call @stack_pop_pointer() : () -> i64
      %11275 = func.call @cc_cons(%11274, %11273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11275) : (i64) -> ()
      %11276 = func.call @stack_pop_pointer() : () -> i64
      %11277 = func.call @stack_pop_pointer() : () -> i64
      %11278 = func.call @cc_cons(%11277, %11276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11278) : (i64) -> ()
      %11279 = func.call @stack_pop_pointer() : () -> i64
      %11280 = func.call @stack_pop_pointer() : () -> i64
      %11281 = func.call @cc_cons(%11280, %11279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11281) : (i64) -> ()
      %11282 = func.call @stack_pop_pointer() : () -> i64
      %11283 = func.call @stack_pop_pointer() : () -> i64
      %11284 = func.call @cc_cons(%11283, %11282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11284) : (i64) -> ()
      %11285 = func.call @stack_pop_pointer() : () -> i64
      %11286 = func.call @stack_pop_pointer() : () -> i64
      %11287 = func.call @cc_cons(%11286, %11285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11287) : (i64) -> ()
      %11288 = func.call @stack_pop_pointer() : () -> i64
      %11289 = func.call @stack_pop_pointer() : () -> i64
      %11290 = func.call @cc_cons(%11289, %11288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11290) : (i64) -> ()
      %11291 = func.call @stack_pop_pointer() : () -> i64
      %11292 = func.call @stack_pop_pointer() : () -> i64
      %11293 = func.call @cc_cons(%11292, %11291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11293) : (i64) -> ()
      %11294 = func.call @stack_pop_pointer() : () -> i64
      %11295 = func.call @stack_pop_pointer() : () -> i64
      %11296 = func.call @cc_cons(%11295, %11294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11296) : (i64) -> ()
      %11297 = func.call @stack_pop_pointer() : () -> i64
      %11298 = func.call @stack_pop_pointer() : () -> i64
      %11299 = func.call @cc_cons(%11298, %11297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11299) : (i64) -> ()
      %11300 = func.call @stack_pop_pointer() : () -> i64
      %11301 = func.call @stack_pop_pointer() : () -> i64
      %11302 = func.call @cc_cons(%11301, %11300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11302) : (i64) -> ()
      %11303 = func.call @stack_pop_pointer() : () -> i64
      %11304 = func.call @stack_pop_pointer() : () -> i64
      %11305 = func.call @cc_cons(%11304, %11303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11305) : (i64) -> ()
      %11306 = func.call @stack_pop_pointer() : () -> i64
      %11307 = func.call @stack_pop_pointer() : () -> i64
      %11308 = func.call @cc_cons(%11307, %11306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11308) : (i64) -> ()
      %11309 = func.call @stack_pop_pointer() : () -> i64
      %11310 = func.call @stack_pop_pointer() : () -> i64
      %11311 = func.call @cc_cons(%11310, %11309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11311) : (i64) -> ()
      %11312 = func.call @stack_pop_pointer() : () -> i64
      %11313 = func.call @stack_pop_pointer() : () -> i64
      %11314 = func.call @cc_cons(%11313, %11312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11314) : (i64) -> ()
      %11315 = func.call @stack_pop_pointer() : () -> i64
      %11316 = func.call @stack_pop_pointer() : () -> i64
      %11317 = func.call @cc_cons(%11316, %11315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11317) : (i64) -> ()
      %11318 = func.call @stack_pop_pointer() : () -> i64
      %11319 = func.call @stack_pop_pointer() : () -> i64
      %11320 = func.call @cc_cons(%11319, %11318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11320) : (i64) -> ()
      %11321 = func.call @stack_pop_pointer() : () -> i64
      %11322 = func.call @stack_pop_pointer() : () -> i64
      %11323 = func.call @cc_cons(%11322, %11321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11323) : (i64) -> ()
      %11324 = func.call @stack_pop_pointer() : () -> i64
      %11325 = func.call @stack_pop_pointer() : () -> i64
      %11326 = func.call @cc_cons(%11325, %11324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11326) : (i64) -> ()
      %11327 = func.call @stack_pop_pointer() : () -> i64
      %11328 = func.call @stack_pop_pointer() : () -> i64
      %11329 = func.call @cc_cons(%11328, %11327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11329) : (i64) -> ()
      %11330 = func.call @stack_pop_pointer() : () -> i64
      %11331 = func.call @stack_pop_pointer() : () -> i64
      %11332 = func.call @cc_cons(%11331, %11330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11332) : (i64) -> ()
      %11333 = func.call @stack_pop_pointer() : () -> i64
      %11334 = func.call @stack_pop_pointer() : () -> i64
      %11335 = func.call @cc_cons(%11334, %11333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11335) : (i64) -> ()
      %11336 = func.call @stack_pop_pointer() : () -> i64
      %11337 = func.call @cc_nil_value() : () -> i64
      %11338 = func.call @cc_nil_value() : () -> i64
      %11339 = func.call @cc_errorp(%11337) : (i64) -> i64
      %11340 = arith.cmpi ne, %11339, %11338 : i64
      %11341 = scf.if %11340 -> (i64) {
        scf.yield %11337 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %11342 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%11336) : (i64) -> ()
        %11343 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %11344 = func.call @stack_pop_pointer() : () -> i64
        %11345 = func.call @cc_nil_value() : () -> i64
        %11346 = func.call @cc_nil_value() : () -> i64
        %11347 = func.call @cc_errorp(%11345) : (i64) -> i64
        %11348 = arith.cmpi ne, %11347, %11346 : i64
        %11349 = scf.if %11348 -> (i64) {
          scf.yield %11345 : i64
        } else {
          %11350 = func.call @cc_nil_value() : () -> i64
          %11351 = llvm.mlir.addressof @str1317 : !llvm.ptr
          %11352 = arith.constant 38 : i64
          %11353 = func.call @cc_make_string(%11351, %11352) : (!llvm.ptr, i64) -> i64
          %11354 = func.call @cc_nil_value() : () -> i64
          %11355 = func.call @cc_intern(%11353, %11354) : (i64, i64) -> i64
          %11356 = func.call @cc_nil_value() : () -> i64
          %11357 = func.call @cc_cons(%11355, %11356) : (i64, i64) -> i64
          %11358 = func.call @cc_values_pack(%11357) : (i64) -> i64
          %11359 = func.call @cc_set_symbol_value(%11355, %11350) : (i64, i64) -> i64
          %11360 = llvm.mlir.addressof @str1318 : !llvm.ptr
          %11361 = arith.constant 39 : i64
          %11362 = func.call @cc_make_string(%11360, %11361) : (!llvm.ptr, i64) -> i64
          %11363 = func.call @cc_nil_value() : () -> i64
          %11364 = func.call @cc_intern(%11362, %11363) : (i64, i64) -> i64
          %11365 = func.call @cc_nil_value() : () -> i64
          %11366 = func.call @cc_cons(%11364, %11365) : (i64, i64) -> i64
          %11367 = func.call @cc_values_pack(%11366) : (i64) -> i64
          %11368 = func.call @cc_set_symbol_value(%11364, %11350) : (i64, i64) -> i64
          %11369 = llvm.mlir.addressof @str1319 : !llvm.ptr
          %11370 = arith.constant 40 : i64
          %11371 = func.call @cc_make_string(%11369, %11370) : (!llvm.ptr, i64) -> i64
          %11372 = func.call @cc_nil_value() : () -> i64
          %11373 = func.call @cc_intern(%11371, %11372) : (i64, i64) -> i64
          %11374 = func.call @cc_nil_value() : () -> i64
          %11375 = func.call @cc_cons(%11373, %11374) : (i64, i64) -> i64
          %11376 = func.call @cc_values_pack(%11375) : (i64) -> i64
          %11377 = func.call @cc_set_symbol_value(%11373, %11350) : (i64, i64) -> i64
          %11378:3 = scf.while (%arg0 = %11342, %arg1 = %11344, %arg2 = %11343) : (i64, i64, i64) -> (i64, i64, i64) {
            func.call @stack_push_pointer(%arg2) : (i64) -> ()
            %11379 = func.call @stack_pop_pointer() : () -> i64
            %11380 = func.call @cc_nil_value() : () -> i64
            %11381 = arith.cmpi ne, %11379, %11380 : i64
            %11382 = func.call @cc_nil_value() : () -> i64
            %11383 = llvm.mlir.addressof @str1320 : !llvm.ptr
            %11384 = arith.constant 38 : i64
            %11385 = func.call @cc_make_string(%11383, %11384) : (!llvm.ptr, i64) -> i64
            %11386 = func.call @cc_nil_value() : () -> i64
            %11387 = func.call @cc_intern(%11385, %11386) : (i64, i64) -> i64
            %11388 = func.call @cc_nil_value() : () -> i64
            %11389 = func.call @cc_cons(%11387, %11388) : (i64, i64) -> i64
            %11390 = func.call @cc_values_pack(%11389) : (i64) -> i64
            %11391 = func.call @cc_symbol_value(%11387) : (i64) -> i64
            %11392 = arith.cmpi ne, %11391, %11382 : i64
            %11393 = llvm.mlir.addressof @str1321 : !llvm.ptr
            %11394 = arith.constant 38 : i64
            %11395 = func.call @cc_make_string(%11393, %11394) : (!llvm.ptr, i64) -> i64
            %11396 = func.call @cc_nil_value() : () -> i64
            %11397 = func.call @cc_intern(%11395, %11396) : (i64, i64) -> i64
            %11398 = func.call @cc_nil_value() : () -> i64
            %11399 = func.call @cc_cons(%11397, %11398) : (i64, i64) -> i64
            %11400 = func.call @cc_values_pack(%11399) : (i64) -> i64
            %11401 = func.call @cc_symbol_value(%11397) : (i64) -> i64
            %11402 = arith.cmpi ne, %11401, %11382 : i64
            %11403 = arith.ori %11392, %11402 : i1
            %11404 = arith.constant 0 : i1
            %11405 = arith.cmpi eq, %11403, %11404 : i1
            %11406 = arith.andi %11381, %11405 : i1
            scf.condition(%11406) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%11407: i64, %11408: i64, %11409: i64):
            %11410 = func.call @cc_nil_value() : () -> i64
            %11411 = func.call @cc_nil_value() : () -> i64
            %11412 = func.call @cc_errorp(%11410) : (i64) -> i64
            %11413 = arith.cmpi ne, %11412, %11411 : i64
            %11414:3 = scf.if %11413 -> (i64, i64, i64) {
              scf.yield %11410, %11408, %11407 : i64, i64, i64
            } else {
              %11415 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%11409) : (i64) -> ()
              %11416 = func.call @stack_pop_pointer() : () -> i64
              %11417 = func.call @cc_nil_value() : () -> i64
              %11418 = arith.cmpi eq, %11416, %11417 : i64
              %11420 = func.call @cc_t_value() : () -> i64
              %11419 = arith.select %11418, %11420, %11417 : i64
              func.call @stack_push_pointer(%11419) : (i64) -> ()
              %11421 = func.call @stack_pop_pointer() : () -> i64
              %11422 = func.call @cc_nil_value() : () -> i64
              %11423 = func.call @cc_cons(%11421, %11422) : (i64, i64) -> i64
              %11424 = func.call @cc_not(%11423) : (i64) -> i64
              func.call @stack_push_pointer(%11424) : (i64) -> ()
              %11425 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%11409) : (i64) -> ()
              %11426 = func.call @stack_pop_pointer() : () -> i64
              %11427 = func.call @cc_is_cons(%11426) : (i64) -> i32
              %11428 = arith.constant 0 : i32
              %11429 = arith.cmpi ne, %11427, %11428 : i32
              %11430 = func.call @cc_t_value() : () -> i64
              %11431 = func.call @cc_nil_value() : () -> i64
              %11432 = arith.select %11429, %11430, %11431 : i64
              func.call @stack_push_pointer(%11432) : (i64) -> ()
              %11433 = func.call @stack_pop_pointer() : () -> i64
              %11434 = func.call @cc_nil_value() : () -> i64
              %11435 = func.call @cc_cons(%11433, %11434) : (i64, i64) -> i64
              %11436 = func.call @cc_not(%11435) : (i64) -> i64
              func.call @stack_push_pointer(%11436) : (i64) -> ()
              %11437 = func.call @stack_pop_pointer() : () -> i64
              %11438 = func.call @cc_cons(%11437, %11415) : (i64, i64) -> i64
              %11439 = func.call @cc_cons(%11425, %11438) : (i64, i64) -> i64
              %11440 = func.call @cc_and(%11439) : (i64) -> i64
              func.call @stack_push_pointer(%11440) : (i64) -> ()
              %11441 = func.call @stack_pop_pointer() : () -> i64
              %11442 = func.call @cc_nil_value() : () -> i64
              %11443 = arith.cmpi ne, %11441, %11442 : i64
              scf.if %11443 {
                %11444 = llvm.mlir.addressof @str1322 : !llvm.ptr
                %11445 = arith.constant 10 : i64
                %11446 = func.call @cc_make_string(%11444, %11445) : (!llvm.ptr, i64) -> i64
                %11447 = func.call @cc_nil_value() : () -> i64
                %11448 = func.call @cc_intern(%11446, %11447) : (i64, i64) -> i64
                %11449 = func.call @cc_nil_value() : () -> i64
                %11450 = func.call @cc_cons(%11448, %11449) : (i64, i64) -> i64
                %11451 = func.call @cc_values_pack(%11450) : (i64) -> i64
                func.call @stack_push_pointer(%11448) : (i64) -> ()
                %11452 = func.call @stack_pop_pointer() : () -> i64
                %11453 = func.call @cc_nil_value() : () -> i64
                %11454 = func.call @cc_errorp(%11452) : (i64) -> i64
                %11455 = arith.cmpi ne, %11454, %11453 : i64
                %11456 = arith.cmpi eq, %11453, %11453 : i64
                %11457 = arith.andi %11455, %11456 : i1
                %11458 = scf.if %11457 -> (i64) {
                  scf.yield %11452 : i64
                } else {
                  scf.yield %11453 : i64
                }
                %11459 = arith.cmpi ne, %11458, %11453 : i64
                scf.if %11459 {
                  func.call @stack_push_pointer(%11458) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%11452) : (i64) -> ()
                  %11460 = llvm.mlir.addressof @str1323 : !llvm.ptr
                  %11461 = func.call @cc_make_function_ref_const(%11460) : (!llvm.ptr) -> i64
                  %11462 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%11461, %11462) : (i64, i64) -> ()
                }
                %11463 = func.call @stack_pop_pointer() : () -> i64
                %11464 = func.call @cc_multiple_value_list(%11463) : (i64) -> i64
                %11465 = func.call @cc_t_value() : () -> i64
                %11466 = llvm.mlir.addressof @str1324 : !llvm.ptr
                %11467 = arith.constant 38 : i64
                %11468 = func.call @cc_make_string(%11466, %11467) : (!llvm.ptr, i64) -> i64
                %11469 = func.call @cc_nil_value() : () -> i64
                %11470 = func.call @cc_intern(%11468, %11469) : (i64, i64) -> i64
                %11471 = func.call @cc_nil_value() : () -> i64
                %11472 = func.call @cc_cons(%11470, %11471) : (i64, i64) -> i64
                %11473 = func.call @cc_values_pack(%11472) : (i64) -> i64
                %11474 = func.call @cc_set_symbol_value(%11470, %11465) : (i64, i64) -> i64
                %11475 = llvm.mlir.addressof @str1325 : !llvm.ptr
                %11476 = arith.constant 39 : i64
                %11477 = func.call @cc_make_string(%11475, %11476) : (!llvm.ptr, i64) -> i64
                %11478 = func.call @cc_nil_value() : () -> i64
                %11479 = func.call @cc_intern(%11477, %11478) : (i64, i64) -> i64
                %11480 = func.call @cc_nil_value() : () -> i64
                %11481 = func.call @cc_cons(%11479, %11480) : (i64, i64) -> i64
                %11482 = func.call @cc_values_pack(%11481) : (i64) -> i64
                %11483 = func.call @cc_set_symbol_value(%11479, %11463) : (i64, i64) -> i64
                %11484 = llvm.mlir.addressof @str1326 : !llvm.ptr
                %11485 = arith.constant 40 : i64
                %11486 = func.call @cc_make_string(%11484, %11485) : (!llvm.ptr, i64) -> i64
                %11487 = func.call @cc_nil_value() : () -> i64
                %11488 = func.call @cc_intern(%11486, %11487) : (i64, i64) -> i64
                %11489 = func.call @cc_nil_value() : () -> i64
                %11490 = func.call @cc_cons(%11488, %11489) : (i64, i64) -> i64
                %11491 = func.call @cc_values_pack(%11490) : (i64) -> i64
                %11492 = func.call @cc_set_symbol_value(%11488, %11464) : (i64, i64) -> i64
                func.call @stack_push_pointer(%11463) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %11493 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %11493, %11408, %11407 : i64, i64, i64
            }
            %11494 = func.call @cc_nil_value() : () -> i64
            %11495 = func.call @cc_errorp(%11414#0) : (i64) -> i64
            %11496 = arith.cmpi ne, %11495, %11494 : i64
            %11497:3 = scf.if %11496 -> (i64, i64, i64) {
              scf.yield %11414#0, %11414#1, %11414#2 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%11409) : (i64) -> ()
              %11498 = func.call @stack_pop_pointer() : () -> i64
              %11499 = func.call @cc_car(%11498) : (i64) -> i64
              func.call @stack_push_pointer(%11499) : (i64) -> ()
              %11500 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%11500) : (i64) -> ()
              %11501 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %11501, %11414#1, %11500 : i64, i64, i64
            }
            %11502 = func.call @cc_nil_value() : () -> i64
            %11503 = func.call @cc_errorp(%11497#0) : (i64) -> i64
            %11504 = arith.cmpi ne, %11503, %11502 : i64
            %11505:3 = scf.if %11504 -> (i64, i64, i64) {
              scf.yield %11497#0, %11497#1, %11497#2 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%11497#2) : (i64) -> ()
              %11506 = func.call @stack_pop_pointer() : () -> i64
              %11507 = func.call @cc_fboundp(%11506) : (i64) -> i64
              func.call @stack_push_pointer(%11507) : (i64) -> ()
              %11508 = func.call @stack_pop_pointer() : () -> i64
              %11509 = func.call @cc_nil_value() : () -> i64
              %11510 = arith.cmpi ne, %11508, %11509 : i64
              %11511:2 = scf.if %11510 -> (i64, i64) {
                %11512 = func.call @cc_nil_value() : () -> i64
                %11513 = func.call @cc_nil_value() : () -> i64
                %11514 = func.call @cc_errorp(%11512) : (i64) -> i64
                %11515 = arith.cmpi ne, %11514, %11513 : i64
                %11516:2 = scf.if %11515 -> (i64, i64) {
                  scf.yield %11512, %11497#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%11497#1) : (i64) -> ()
                  func.call @stack_push_pointer(%11497#2) : (i64) -> ()
                  %11517 = func.call @stack_pop_pointer() : () -> i64
                  %11518 = func.call @cc_nil_value() : () -> i64
                  %11519 = func.call @cc_errorp(%11517) : (i64) -> i64
                  %11520 = arith.cmpi ne, %11519, %11518 : i64
                  %11521 = arith.cmpi eq, %11518, %11518 : i64
                  %11522 = arith.andi %11520, %11521 : i1
                  %11523 = scf.if %11522 -> (i64) {
                    scf.yield %11517 : i64
                  } else {
                    scf.yield %11518 : i64
                  }
                  %11524 = arith.cmpi ne, %11523, %11518 : i64
                  scf.if %11524 {
                    func.call @stack_push_pointer(%11523) : (i64) -> ()
                  } else {
                    %11525 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%11525) : (i64) -> ()
                    func.call @stack_push_pointer(%11517) : (i64) -> ()
                    %11526 = func.call @stack_pop_pointer() : () -> i64
                    %11527 = func.call @stack_pop_pointer() : () -> i64
                    %11528 = func.call @cc_cons(%11526, %11527) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%11528) : (i64) -> ()
                  }
                  %11529 = func.call @stack_pop_pointer() : () -> i64
                  %11530 = func.call @stack_pop_pointer() : () -> i64
                  %11531 = func.call @cc_append(%11530, %11529) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%11531) : (i64) -> ()
                  %11532 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%11532) : (i64) -> ()
                  %11533 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %11533, %11532 : i64, i64
                }
                func.call @stack_push_pointer(%11516#0) : (i64) -> ()
                %11534 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %11534, %11516#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %11535 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %11535, %11497#1 : i64, i64
              }
              func.call @stack_push_pointer(%11511#0) : (i64) -> ()
              %11536 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %11536, %11511#1, %11497#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%11505#0) : (i64) -> ()
            %11537 = func.call @stack_depth() : () -> i64
            %11538 = arith.constant 0 : i64
            %11539 = arith.cmpi sgt, %11537, %11538 : i64
            scf.if %11539 {
              %11540 = func.call @stack_pop_pointer() : () -> i64
            }
            func.call @stack_push_pointer(%11409) : (i64) -> ()
            %11541 = func.call @stack_pop_pointer() : () -> i64
            %11542 = func.call @cc_cdr(%11541) : (i64) -> i64
            func.call @stack_push_pointer(%11542) : (i64) -> ()
            %11543 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%11543) : (i64) -> ()
            %11544 = func.call @stack_depth() : () -> i64
            %11545 = arith.constant 0 : i64
            %11546 = arith.cmpi sgt, %11544, %11545 : i64
            scf.if %11546 {
              %11547 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %11505#2, %11505#1, %11543 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %11548 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%11378#1) : (i64) -> ()
          %11549 = func.call @stack_pop_pointer() : () -> i64
          %11550 = func.call @cc_multiple_value_list(%11549) : (i64) -> i64
          %11551 = llvm.mlir.addressof @str1327 : !llvm.ptr
          %11552 = arith.constant 38 : i64
          %11553 = func.call @cc_make_string(%11551, %11552) : (!llvm.ptr, i64) -> i64
          %11554 = func.call @cc_nil_value() : () -> i64
          %11555 = func.call @cc_intern(%11553, %11554) : (i64, i64) -> i64
          %11556 = func.call @cc_nil_value() : () -> i64
          %11557 = func.call @cc_cons(%11555, %11556) : (i64, i64) -> i64
          %11558 = func.call @cc_values_pack(%11557) : (i64) -> i64
          %11559 = func.call @cc_symbol_value(%11555) : (i64) -> i64
          %11560 = llvm.mlir.addressof @str1328 : !llvm.ptr
          %11561 = arith.constant 39 : i64
          %11562 = func.call @cc_make_string(%11560, %11561) : (!llvm.ptr, i64) -> i64
          %11563 = func.call @cc_nil_value() : () -> i64
          %11564 = func.call @cc_intern(%11562, %11563) : (i64, i64) -> i64
          %11565 = func.call @cc_nil_value() : () -> i64
          %11566 = func.call @cc_cons(%11564, %11565) : (i64, i64) -> i64
          %11567 = func.call @cc_values_pack(%11566) : (i64) -> i64
          %11568 = func.call @cc_symbol_value(%11564) : (i64) -> i64
          %11569 = llvm.mlir.addressof @str1329 : !llvm.ptr
          %11570 = arith.constant 40 : i64
          %11571 = func.call @cc_make_string(%11569, %11570) : (!llvm.ptr, i64) -> i64
          %11572 = func.call @cc_nil_value() : () -> i64
          %11573 = func.call @cc_intern(%11571, %11572) : (i64, i64) -> i64
          %11574 = func.call @cc_nil_value() : () -> i64
          %11575 = func.call @cc_cons(%11573, %11574) : (i64, i64) -> i64
          %11576 = func.call @cc_values_pack(%11575) : (i64) -> i64
          %11577 = func.call @cc_symbol_value(%11573) : (i64) -> i64
          %11578 = func.call @cc_nil_value() : () -> i64
          %11579 = arith.cmpi ne, %11559, %11578 : i64
          %11580 = scf.if %11579 -> (i64) {
            scf.yield %11577 : i64
          } else {
            scf.yield %11550 : i64
          }
          %11581 = func.call @cc_values_pack(%11580) : (i64) -> i64
          func.call @stack_push_pointer(%11581) : (i64) -> ()
          %11582 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %11582 : i64
        }
        func.call @stack_push_pointer(%11349) : (i64) -> ()
        %11583 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11583 : i64
      }
      func.call @stack_push_pointer(%11341) : (i64) -> ()
      %11584 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11584 : i64
    }
    func.call @stack_push_pointer(%8461) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_116254966808576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_116254966808576*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_116254966808576*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("TEST-MAKE-SYMBOL-ERROR-0\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str6("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str9("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str10("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str13("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str20("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str21("TEST-MAKE-SYMBOL-ERROR-1\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str22("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str23("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str26("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str31("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str34("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str35("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str42("TEST-MAKE-SYMBOL-ERROR-2\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str43("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str44("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str47("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str58("TEST-MAKE-SYMBOL-0\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str59("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str60("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("ABCCC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str63("ABCCC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str64("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str68("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str69("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str70("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str71("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str72("TEST-MAKE-SYMBOL-1\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str73("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("MAKE-SYMBOL\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str82("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str87("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str88("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str89("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str90("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str98("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str102("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str103("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str104("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str105("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str106("MAKUNBOUND-1\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str107("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str108("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str110("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str111("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str112("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str113("MAKUNBOUND\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str114("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str116("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str117("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str118("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str124("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str125("GENSYM-2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str126("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str127("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str129("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str130("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str133("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str134("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str140("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str141("GENSYM-3\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str142("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str143("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str145("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str146("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str158("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str162("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str163("GENSYM-4\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str164("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str165("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str167("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str168("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str173("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str176("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str181("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str182("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str183("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str184("GENSYM-5\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str185("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str186("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str187("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str188("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str190("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str191("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str192("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str193("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str194("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str195("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str196("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str197("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str200("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str202("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str203("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str204("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str205("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str206("GENSYM-6\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str207("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str208("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str209("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str210("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str211("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("12345678901234567890123456789012345678901234567890\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str213("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str214("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str216("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str217("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str218("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str220("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str226("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("12345678901234567890123456789012345678901234567890\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str229("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str230("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str233("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str236("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str238("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str239("GENSYM-7\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str240("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str241("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str242("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str247("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str249("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str250("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str251("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str252("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str253("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str254("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str255("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str256("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str257("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str258("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str259("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str260("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str262("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str263("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str264("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str265("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str266("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str267("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str268("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str269("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str270("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str271("GENSYM-8\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str272("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str273("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str275("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str276("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str277("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str280("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str281("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str282("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str283("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str284("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str288("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str289("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str290("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str291("GENSYM-9\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str292("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str293("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str295("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str296("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str297("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str298("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str299("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str300("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str301("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str304("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str306("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str307("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str308("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str309("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str310("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str311("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str312("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str313("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str314("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str315("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str316("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str317("GENSYM-10\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str318("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str319("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str321("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str322("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str323("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str326("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str327("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str328("GENSYM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str331("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("COMMON-LISP:*GENSYM-COUNTER*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str333("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str334("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str335("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str338("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str339("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str340("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str341("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str342("GENTEMP-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str343("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str344("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str345("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str346("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str347("GENTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str348("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str349("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str350("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str351("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str352("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str353("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str354("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str355("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str357("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str358("BUILD-SBCL-1\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str359("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str360("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str361("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str362("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str363("SYMBOL-PLIST\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str364("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str365("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str366("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str367("%FN%(setf COMMON-LISP::SYMBOL-PLIST)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str368("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str369("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str370("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str371("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str372("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str373("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str374("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str375("BUILD-SBCL-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str376("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str377("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str378("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str379("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str380("GET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str381("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str382("%FN%(setf COMMON-LISP::GET)\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str383("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str384("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str386("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str387("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str388("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str389("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str390("978-SYMBOLS-COMMON-LISP-EXPORTED\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str391("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str392("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str393("DO-EXTERNAL-SYMBOLS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str394("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str395("SYM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str396("FIND-PACKAGE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str397("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str398("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str399("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str400("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str401("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str404("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("SYM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str406("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str407("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str408("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str409("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str410("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str411("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str412("#:%%DYN-CELL-116254966808596-SYM\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str413("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str414("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str415("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str416("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str417("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str418("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str419("FBOUNDP.8\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str420("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str421("CL-NON-FUNCTION-MACRO-SPECIAL-OPERATOR-SYMBOLS\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str422("&ALLOW-OTHER-KEYS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str423("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("&AUX\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str425("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("&BODY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str427("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str428("&ENVIRONMENT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str429("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str430("&KEY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str431("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str432("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str433("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str434("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str435("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str436("&WHOLE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str437("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str438("**\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str439("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str440("***\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str441("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("*BREAK-ON-SIGNALS*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str443("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("*COMPILE-FILE-PATHNAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str445("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str446("*COMPILE-FILE-TRUENAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str447("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str448("*COMPILE-PRINT*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str449("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("*COMPILE-VERBOSE*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str451("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str452("*DEBUG-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("*DEBUGGER-HOOK*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str455("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str456("*DEFAULT-PATHNAME-DEFAULTS*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str457("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str458("*ERROR-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str459("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str460("*FEATURES*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str461("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str462("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str463("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str464("*LOAD-PATHNAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str465("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str466("*LOAD-PRINT*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str467("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("*LOAD-TRUENAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str469("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str470("*LOAD-VERBOSE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str471("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("*MACROEXPAND-HOOK*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str473("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("*MODULES*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str475("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str476("*PACKAGE*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str477("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str478("*PRINT-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str479("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str480("*PRINT-BASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str481("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str482("*PRINT-CASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str483("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("*PRINT-CIRCLE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str485("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str486("*PRINT-ESCAPE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str487("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str488("*PRINT-GENSYM*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str489("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str490("*PRINT-LENGTH*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str491("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str492("*PRINT-LEVEL*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str493("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str494("*PRINT-LINES*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str495("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str496("*PRINT-MISER-WIDTH*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str497("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str498("*PRINT-PPRINT-DISPATCH*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str499("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str501("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str502("*PRINT-RADIX*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str503("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str504("*PRINT-READABLY*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str505("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str506("*PRINT-RIGHT-MARGIN*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str507("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str508("*QUERY-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str509("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str510("*RANDOM-STATE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str511("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str512("*READ-BASE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str513("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str514("*READ-DEFAULT-FLOAT-FORMAT*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str515("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str516("*READ-EVAL*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str517("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str518("*READ-SUPPRESS*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str519("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str520("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str521("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str522("*STANDARD-INPUT*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str523("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str524("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str525("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str526("*TERMINAL-IO*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str527("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str528("*TRACE-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str529("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str530("++\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str531("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str532("+++\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str533("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str534("//\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str535("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str536("///\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str537("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str538("ARITHMETIC-ERROR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str539("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str541("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str542("ARRAY-DIMENSION-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str543("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("ARRAY-RANK-LIMIT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str545("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str547("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str549("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str550("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str551("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str552("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str553("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str554("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str555("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str556("BOOLE-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str557("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str558("BOOLE-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str559("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str560("BOOLE-AND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str561("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str562("BOOLE-ANDC1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str564("BOOLE-ANDC2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str565("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str566("BOOLE-C1\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str567("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str568("BOOLE-C2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str569("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str570("BOOLE-CLR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str571("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str572("BOOLE-EQV\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str573("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str574("BOOLE-IOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str575("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("BOOLE-NAND\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str577("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str578("BOOLE-NOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str579("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str580("BOOLE-ORC1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str581("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str582("BOOLE-ORC2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str583("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str584("BOOLE-SET\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str585("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str586("BOOLE-XOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str587("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str588("BOOLEAN\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str589("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str590("BROADCAST-STREAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str591("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str592("BUILT-IN-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str593("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str594("CALL-ARGUMENTS-LIMIT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str595("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str596("CELL-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str597("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str598("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str599("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str600("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str601("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str602("COMPILATION-SPEED\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str603("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str604("COMPILED-FUNCTION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str605("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str606("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str607("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str608("CONCATENATED-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str609("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str610("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str611("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str612("CONTROL-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str613("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str614("DEBUG\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str615("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str616("DECLARATION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str617("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str618("DIVISION-BY-ZERO\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str619("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str620("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str621("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str622("DOUBLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str623("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str624("DOUBLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str625("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str626("DYNAMIC-EXTENT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str627("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str628("ECHO-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str629("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str630("END-OF-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str631("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str632("EXTENDED-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str633("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str634("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str635("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str636("FILE-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str637("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str638("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str639("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str640("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str641("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str642("FLOATING-POINT-INVALID-OPERATION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str643("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str644("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str645("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str646("FLOATING-POINT-UNDERFLOW\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str647("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str648("FTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str649("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str650("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str651("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str652("HASH-TABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("IGNORABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str655("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str656("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str657("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str658("INLINE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str659("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str660("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str661("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str662("INTERNAL-TIME-UNITS-PER-SECOND\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str663("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str664("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str665("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str666("LAMBDA-LIST-KEYWORDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str667("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str668("LAMBDA-PARAMETERS-LIMIT\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str669("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str670("LEAST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str671("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str672("LEAST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str673("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str674("LEAST-NEGATIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str675("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str676("LEAST-NEGATIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str677("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str678("LEAST-NEGATIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str679("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str680("LEAST-NEGATIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str681("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str682("LEAST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str683("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str684("LEAST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str685("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str686("LEAST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str687("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str688("LEAST-POSITIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str689("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str690("LEAST-POSITIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str691("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str692("LEAST-POSITIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str693("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str694("LEAST-POSITIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str695("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str696("LEAST-POSITIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str697("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str698("LEAST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str699("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str700("LEAST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str701("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str702("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str703("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str704("LONG-FLOAT-EPSILON\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str705("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str706("LONG-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str707("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str708("METHOD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str709("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str710("METHOD-COMBINATION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str711("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str712("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str713("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str714("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str715("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str716("MOST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str717("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str718("MOST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str719("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str720("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str721("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str722("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str723("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str724("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str725("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str726("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str727("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("MOST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str729("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str730("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str731("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str732("MULTIPLE-VALUES-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str733("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str734("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str735("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str736("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str737("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str738("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str739("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str740("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str741("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str742("PACKAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str743("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str744("PACKAGE-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str745("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str746("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str747("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str748("PI\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str749("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str750("PRINT-NOT-READABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str751("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str752("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str753("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str754("RANDOM-STATE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str755("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str756("RATIO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str757("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str758("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str759("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str760("READTABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str761("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str762("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str763("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str764("RESTART\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str765("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str766("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str767("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str768("SATISFIES\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str769("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str770("SEQUENCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str771("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str772("SERIOUS-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str773("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str774("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str775("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str776("SHORT-FLOAT-EPSILON\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str777("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str778("SHORT-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str779("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str780("SIGNED-BYTE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str781("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str782("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str783("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str784("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str785("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str786("SIMPLE-BIT-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str787("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str788("SIMPLE-CONDITION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str789("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str790("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str791("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str792("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str793("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str794("SIMPLE-TYPE-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str795("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str796("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str797("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str798("SIMPLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str799("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str800("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str801("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str802("SINGLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str803("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str804("SINGLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str805("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str806("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str807("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str808("SPECIAL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str809("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str810("SPEED\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str811("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str812("STANDARD\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str813("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str814("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str815("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str816("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str817("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str818("STANDARD-GENERIC-FUNCTION\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str819("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str820("STANDARD-METHOD\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str821("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str822("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str823("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str824("STORAGE-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str825("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str826("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str827("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str828("STREAM-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str829("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str830("STRING-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str831("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str832("STRUCTURE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str833("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str834("STRUCTURE-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str835("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str836("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str837("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str838("STYLE-WARNING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str839("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str840("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str841("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str842("SYNONYM-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str843("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str844("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str845("TWO-WAY-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str846("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str847("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str848("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str849("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str850("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str851("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str852("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str853("UNBOUND-VARIABLE\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str854("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str855("UNDEFINED-FUNCTION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str856("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str857("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str858("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str859("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str860("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str861("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str862("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str863("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str864("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str865("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str866("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str867("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str868("CL-NON-FUNCTION-MACRO-SPECIAL-OPERATOR-SYMBOLS\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str869("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str870("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str871("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str872("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str873("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str874("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str875("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str876("&ALLOW-OTHER-KEYS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str877("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str878("&AUX\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str879("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str880("&BODY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str881("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str882("&ENVIRONMENT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str883("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str884("&KEY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str885("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str886("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str887("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str888("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str889("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str890("&WHOLE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str891("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str892("**\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str893("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str894("***\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str895("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str896("*BREAK-ON-SIGNALS*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str897("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str898("*COMPILE-FILE-PATHNAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str899("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str900("*COMPILE-FILE-TRUENAME*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str901("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str902("*COMPILE-PRINT*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str903("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str904("*COMPILE-VERBOSE*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str905("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str906("*DEBUG-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str907("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str908("*DEBUGGER-HOOK*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str909("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str910("*DEFAULT-PATHNAME-DEFAULTS*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str911("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str912("*ERROR-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str913("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str914("*FEATURES*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str915("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str916("*GENSYM-COUNTER*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str917("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str918("*LOAD-PATHNAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str919("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str920("*LOAD-PRINT*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str921("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str922("*LOAD-TRUENAME*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str923("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str924("*LOAD-VERBOSE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str925("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str926("*MACROEXPAND-HOOK*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str927("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str928("*MODULES*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str929("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str930("*PACKAGE*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str931("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str932("*PRINT-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str933("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str934("*PRINT-BASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str935("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str936("*PRINT-CASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str937("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str938("*PRINT-CIRCLE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str939("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str940("*PRINT-ESCAPE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str941("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str942("*PRINT-GENSYM*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str943("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str944("*PRINT-LENGTH*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str945("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str946("*PRINT-LEVEL*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str947("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str948("*PRINT-LINES*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str949("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str950("*PRINT-MISER-WIDTH*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str951("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str952("*PRINT-PPRINT-DISPATCH*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str953("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str954("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str955("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str956("*PRINT-RADIX*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str957("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str958("*PRINT-READABLY*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str959("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str960("*PRINT-RIGHT-MARGIN*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str961("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str962("*QUERY-IO*\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str963("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str964("*RANDOM-STATE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str965("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str966("*READ-BASE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str967("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str968("*READ-DEFAULT-FLOAT-FORMAT*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str969("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str970("*READ-EVAL*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str971("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str972("*READ-SUPPRESS*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str973("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str974("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str975("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str976("*STANDARD-INPUT*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str977("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str978("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str979("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str980("*TERMINAL-IO*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str981("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str982("*TRACE-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str983("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str984("++\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str985("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str986("+++\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str987("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str988("//\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str989("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str990("///\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str991("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str992("ARITHMETIC-ERROR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str993("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str994("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str995("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str996("ARRAY-DIMENSION-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str997("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str998("ARRAY-RANK-LIMIT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str999("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1000("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str1001("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1002("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1003("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1004("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1005("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1006("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1007("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1008("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1009("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1010("BOOLE-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1011("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1012("BOOLE-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1013("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1014("BOOLE-AND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1015("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1016("BOOLE-ANDC1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1017("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1018("BOOLE-ANDC2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1019("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1020("BOOLE-C1\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1021("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1022("BOOLE-C2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1023("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1024("BOOLE-CLR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1025("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1026("BOOLE-EQV\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1027("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1028("BOOLE-IOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1029("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1030("BOOLE-NAND\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1031("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1032("BOOLE-NOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1033("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1034("BOOLE-ORC1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1035("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1036("BOOLE-ORC2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1037("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1038("BOOLE-SET\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1039("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1040("BOOLE-XOR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1041("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1042("BOOLEAN\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1043("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1044("BROADCAST-STREAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1045("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1046("BUILT-IN-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1047("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1048("CALL-ARGUMENTS-LIMIT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1049("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1050("CELL-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1051("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1052("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1053("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1054("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1055("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1056("COMPILATION-SPEED\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1057("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1058("COMPILED-FUNCTION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1059("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1060("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1061("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1062("CONCATENATED-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str1063("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1064("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1065("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1066("CONTROL-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1067("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1068("DEBUG\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1069("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1070("DECLARATION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1071("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1072("DIVISION-BY-ZERO\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1073("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1074("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1075("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1076("DOUBLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1077("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1078("DOUBLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str1079("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1080("DYNAMIC-EXTENT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1081("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1082("ECHO-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1083("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1084("END-OF-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1085("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1086("EXTENDED-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1087("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1088("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1089("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1090("FILE-STREAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1091("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1092("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1093("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1094("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str1095("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1096("FLOATING-POINT-INVALID-OPERATION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str1097("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1098("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str1099("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1100("FLOATING-POINT-UNDERFLOW\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str1101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1102("FTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1104("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1106("HASH-TABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1108("IGNORABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1110("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1112("INLINE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1114("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1116("INTERNAL-TIME-UNITS-PER-SECOND\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str1117("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1118("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1119("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1120("LAMBDA-LIST-KEYWORDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1122("LAMBDA-PARAMETERS-LIMIT\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str1123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1124("LEAST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1125("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1126("LEAST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1128("LEAST-NEGATIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1130("LEAST-NEGATIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str1131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1132("LEAST-NEGATIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1134("LEAST-NEGATIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1136("LEAST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1138("LEAST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1140("LEAST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1142("LEAST-POSITIVE-LONG-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1144("LEAST-POSITIVE-NORMALIZED-DOUBLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1145("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1146("LEAST-POSITIVE-NORMALIZED-LONG-FLOAT\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str1147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1148("LEAST-POSITIVE-NORMALIZED-SHORT-FLOAT\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1150("LEAST-POSITIVE-NORMALIZED-SINGLE-FLOAT\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1152("LEAST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1154("LEAST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1155("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1156("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1157("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1158("LONG-FLOAT-EPSILON\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1159("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1160("LONG-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1161("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1162("METHOD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1163("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1164("METHOD-COMBINATION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1165("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1166("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1167("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1168("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1170("MOST-NEGATIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str1171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1172("MOST-NEGATIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1174("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1175("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1176("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1178("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1179("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1180("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str1181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1182("MOST-POSITIVE-SHORT-FLOAT\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1183("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1184("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1185("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1186("MULTIPLE-VALUES-LIMIT\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str1187("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1188("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1189("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1190("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1192("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1193("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1194("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1195("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1196("PACKAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1197("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1198("PACKAGE-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1200("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1201("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1202("PI\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str1203("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1204("PRINT-NOT-READABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1205("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1206("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1207("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1208("RANDOM-STATE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1209("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1210("RATIO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1211("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1212("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1213("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1214("READTABLE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1216("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1218("RESTART\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1220("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1222("SATISFIES\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1224("SEQUENCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1226("SERIOUS-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1228("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1229("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1230("SHORT-FLOAT-EPSILON\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str1231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1232("SHORT-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str1233("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1234("SIGNED-BYTE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1235("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1236("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1237("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1238("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1240("SIMPLE-BIT-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1242("SIMPLE-CONDITION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1244("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1246("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1247("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1248("SIMPLE-TYPE-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1249("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1250("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1251("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1252("SIMPLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1254("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1256("SINGLE-FLOAT-EPSILON\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1257("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1258("SINGLE-FLOAT-NEGATIVE-EPSILON\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str1259("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1260("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1261("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1262("SPECIAL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1263("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1264("SPEED\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1265("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1266("STANDARD\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1267("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1268("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1269("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1270("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1271("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1272("STANDARD-GENERIC-FUNCTION\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1274("STANDARD-METHOD\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1275("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1276("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1277("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1278("STORAGE-CONDITION\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1280("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1281("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1282("STREAM-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1283("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1284("STRING-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1285("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1286("STRUCTURE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1287("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1288("STRUCTURE-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1289("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1290("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1291("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1292("STYLE-WARNING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1293("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1294("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1295("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1296("SYNONYM-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1297("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1298("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str1299("TWO-WAY-STREAM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1300("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1301("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1303("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1304("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1305("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1306("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1307("UNBOUND-VARIABLE\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str1308("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1309("UNDEFINED-FUNCTION\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1310("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1311("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1312("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1313("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1315("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1316("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1317("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1318("*__MLIR_BLOCK_RETVALUE_116254966808598*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1319("*__MLIR_BLOCK_RETMVLIST_116254966808598*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str1320("*__MLIR_BLOCK_RETFLAG_116254966808576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1321("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1322("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1323("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1324("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1325("*__MLIR_BLOCK_RETVALUE_116254966808598*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1326("*__MLIR_BLOCK_RETMVLIST_116254966808598*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str1327("*__MLIR_BLOCK_RETFLAG_116254966808598*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1328("*__MLIR_BLOCK_RETVALUE_116254966808598*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1329("*__MLIR_BLOCK_RETMVLIST_116254966808598*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str1330("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1331("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1332("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1333("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1334("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1335("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1336("*__MLIR_BLOCK_RETFLAG_116254966808576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1337("*__MLIR_BLOCK_RETMVLIST_116254966808576*\00") : !llvm.array<41 x i8>
}
