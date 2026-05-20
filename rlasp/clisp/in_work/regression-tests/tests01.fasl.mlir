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
      %43 = arith.constant 16 : i64
      %44 = func.call @cc_make_string(%42, %43) : (!llvm.ptr, i64) -> i64
      %45 = func.call @cc_nil_value() : () -> i64
      %46 = func.call @cc_intern(%44, %45) : (i64, i64) -> i64
      %47 = func.call @cc_nil_value() : () -> i64
      %48 = func.call @cc_cons(%46, %47) : (i64, i64) -> i64
      %49 = func.call @cc_values_pack(%48) : (i64) -> i64
      func.call @stack_push_pointer(%46) : (i64) -> ()
      %50 = func.call @stack_pop_pointer() : () -> i64
      %51 = llvm.mlir.addressof @str5 : !llvm.ptr
      %52 = arith.constant 3 : i64
      %53 = func.call @cc_make_string(%51, %52) : (!llvm.ptr, i64) -> i64
      %54 = func.call @cc_nil_value() : () -> i64
      %55 = func.call @cc_intern(%53, %54) : (i64, i64) -> i64
      %56 = func.call @cc_nil_value() : () -> i64
      %57 = func.call @cc_cons(%55, %56) : (i64, i64) -> i64
      %58 = func.call @cc_values_pack(%57) : (i64) -> i64
      func.call @stack_push_pointer(%55) : (i64) -> ()
      %59 = llvm.mlir.addressof @str6 : !llvm.ptr
      %60 = arith.constant 3 : i64
      %61 = func.call @cc_make_string(%59, %60) : (!llvm.ptr, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_intern(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_nil_value() : () -> i64
      %65 = func.call @cc_cons(%63, %64) : (i64, i64) -> i64
      %66 = func.call @cc_values_pack(%65) : (i64) -> i64
      func.call @stack_push_pointer(%63) : (i64) -> ()
      %67 = llvm.mlir.addressof @str7 : !llvm.ptr
      %68 = arith.constant 22 : i64
      %69 = func.call @cc_make_string(%67, %68) : (!llvm.ptr, i64) -> i64
      %70 = llvm.mlir.addressof @str8 : !llvm.ptr
      %71 = arith.constant 4 : i64
      %72 = func.call @cc_make_string(%70, %71) : (!llvm.ptr, i64) -> i64
      %73 = func.call @cc_intern(%69, %72) : (i64, i64) -> i64
      %74 = func.call @cc_nil_value() : () -> i64
      %75 = func.call @cc_cons(%73, %74) : (i64, i64) -> i64
      %76 = func.call @cc_values_pack(%75) : (i64) -> i64
      func.call @stack_push_pointer(%73) : (i64) -> ()
      %77 = llvm.mlir.addressof @str9 : !llvm.ptr
      %78 = arith.constant 15 : i64
      %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
      %80 = llvm.mlir.addressof @str10 : !llvm.ptr
      %81 = arith.constant 4 : i64
      %82 = func.call @cc_make_string(%80, %81) : (!llvm.ptr, i64) -> i64
      %83 = func.call @cc_intern(%79, %82) : (i64, i64) -> i64
      %84 = func.call @cc_nil_value() : () -> i64
      %85 = func.call @cc_cons(%83, %84) : (i64, i64) -> i64
      %86 = func.call @cc_values_pack(%85) : (i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      %87 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %88 = llvm.mlir.addressof @str11 : !llvm.ptr
      %89 = arith.constant 14 : i64
      %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
      %91 = llvm.mlir.addressof @str12 : !llvm.ptr
      %92 = arith.constant 11 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = func.call @cc_intern(%90, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @stack_pop_pointer() : () -> i64
      %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
      %101 = llvm.mlir.addressof @str13 : !llvm.ptr
      %102 = arith.constant 5 : i64
      %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
      %104 = func.call @cc_nil_value() : () -> i64
      %105 = func.call @cc_intern(%103, %104) : (i64, i64) -> i64
      %106 = func.call @cc_nil_value() : () -> i64
      %107 = func.call @cc_cons(%105, %106) : (i64, i64) -> i64
      %108 = func.call @cc_values_pack(%107) : (i64) -> i64
      %109 = func.call @cc_cons(%105, %100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @cc_cons(%111, %110) : (i64, i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = func.call @stack_pop_pointer() : () -> i64
      %115 = func.call @cc_cons(%114, %113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @stack_pop_pointer() : () -> i64
      %118 = func.call @cc_cons(%117, %116) : (i64, i64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @stack_pop_pointer() : () -> i64
      %121 = func.call @cc_cons(%120, %119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @cc_cons(%123, %122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @stack_pop_pointer() : () -> i64
      %127 = func.call @cc_cons(%126, %125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%127) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %128 = func.call @stack_pop_pointer() : () -> i64
      %129 = func.call @stack_pop_pointer() : () -> i64
      %130 = func.call @cc_cons(%129, %128) : (i64, i64) -> i64
      func.call @stack_push_pointer(%130) : (i64) -> ()
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @stack_pop_pointer() : () -> i64
      %133 = func.call @cc_cons(%132, %131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%133) : (i64) -> ()
      %134 = func.call @stack_pop_pointer() : () -> i64
      %181 = arith.constant 108321407238145 : i64
      %182 = arith.constant 0 : i64
      %183 = func.call @cc_make_closure(%181, %182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = llvm.mlir.addressof @str18 : !llvm.ptr
      %186 = arith.constant 1 : i64
      %187 = func.call @cc_make_string(%185, %186) : (!llvm.ptr, i64) -> i64
      %188 = func.call @cc_nil_value() : () -> i64
      %189 = func.call @cc_intern(%187, %188) : (i64, i64) -> i64
      %190 = func.call @cc_nil_value() : () -> i64
      %191 = func.call @cc_cons(%189, %190) : (i64, i64) -> i64
      %192 = func.call @cc_values_pack(%191) : (i64) -> i64
      func.call @stack_push_pointer(%189) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %193 = func.call @stack_pop_pointer() : () -> i64
      %194 = func.call @stack_pop_pointer() : () -> i64
      %195 = func.call @cc_cons(%194, %193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      %196 = func.call @stack_pop_pointer() : () -> i64
      %197 = llvm.mlir.addressof @str19 : !llvm.ptr
      %198 = arith.constant 11 : i64
      %199 = func.call @cc_make_string(%197, %198) : (!llvm.ptr, i64) -> i64
      %200 = llvm.mlir.addressof @str20 : !llvm.ptr
      %201 = arith.constant 7 : i64
      %202 = func.call @cc_make_string(%200, %201) : (!llvm.ptr, i64) -> i64
      %203 = func.call @cc_intern(%199, %202) : (i64, i64) -> i64
      %204 = func.call @cc_nil_value() : () -> i64
      %205 = func.call @cc_cons(%203, %204) : (i64, i64) -> i64
      %206 = func.call @cc_values_pack(%205) : (i64) -> i64
      func.call @stack_push_pointer(%203) : (i64) -> ()
      %207 = func.call @stack_pop_pointer() : () -> i64
      %208 = llvm.mlir.addressof @str21 : !llvm.ptr
      %209 = arith.constant 351 : i64
      %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%210) : (i64) -> ()
      %211 = func.call @stack_pop_pointer() : () -> i64
      %212 = llvm.mlir.addressof @str22 : !llvm.ptr
      %213 = arith.constant 4 : i64
      %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
      %215 = llvm.mlir.addressof @str23 : !llvm.ptr
      %216 = arith.constant 7 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_intern(%214, %217) : (i64, i64) -> i64
      %219 = func.call @cc_nil_value() : () -> i64
      %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
      %221 = func.call @cc_values_pack(%220) : (i64) -> i64
      func.call @stack_push_pointer(%218) : (i64) -> ()
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = llvm.mlir.addressof @str24 : !llvm.ptr
      %224 = arith.constant 6 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      func.call @stack_push_pointer(%227) : (i64) -> ()
      %231 = func.call @stack_pop_pointer() : () -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_errorp(%50) : (i64) -> i64
      %234 = arith.cmpi ne, %233, %232 : i64
      %235 = arith.cmpi eq, %232, %232 : i64
      %236 = arith.andi %234, %235 : i1
      %237 = scf.if %236 -> (i64) {
        scf.yield %50 : i64
      } else {
        scf.yield %232 : i64
      }
      %238 = func.call @cc_errorp(%134) : (i64) -> i64
      %239 = arith.cmpi ne, %238, %232 : i64
      %240 = arith.cmpi eq, %237, %232 : i64
      %241 = arith.andi %239, %240 : i1
      %242 = scf.if %241 -> (i64) {
        scf.yield %134 : i64
      } else {
        scf.yield %237 : i64
      }
      %243 = func.call @cc_errorp(%184) : (i64) -> i64
      %244 = arith.cmpi ne, %243, %232 : i64
      %245 = arith.cmpi eq, %242, %232 : i64
      %246 = arith.andi %244, %245 : i1
      %247 = scf.if %246 -> (i64) {
        scf.yield %184 : i64
      } else {
        scf.yield %242 : i64
      }
      %248 = func.call @cc_errorp(%196) : (i64) -> i64
      %249 = arith.cmpi ne, %248, %232 : i64
      %250 = arith.cmpi eq, %247, %232 : i64
      %251 = arith.andi %249, %250 : i1
      %252 = scf.if %251 -> (i64) {
        scf.yield %196 : i64
      } else {
        scf.yield %247 : i64
      }
      %253 = func.call @cc_errorp(%207) : (i64) -> i64
      %254 = arith.cmpi ne, %253, %232 : i64
      %255 = arith.cmpi eq, %252, %232 : i64
      %256 = arith.andi %254, %255 : i1
      %257 = scf.if %256 -> (i64) {
        scf.yield %207 : i64
      } else {
        scf.yield %252 : i64
      }
      %258 = func.call @cc_errorp(%211) : (i64) -> i64
      %259 = arith.cmpi ne, %258, %232 : i64
      %260 = arith.cmpi eq, %257, %232 : i64
      %261 = arith.andi %259, %260 : i1
      %262 = scf.if %261 -> (i64) {
        scf.yield %211 : i64
      } else {
        scf.yield %257 : i64
      }
      %263 = func.call @cc_errorp(%222) : (i64) -> i64
      %264 = arith.cmpi ne, %263, %232 : i64
      %265 = arith.cmpi eq, %262, %232 : i64
      %266 = arith.andi %264, %265 : i1
      %267 = scf.if %266 -> (i64) {
        scf.yield %222 : i64
      } else {
        scf.yield %262 : i64
      }
      %268 = func.call @cc_errorp(%231) : (i64) -> i64
      %269 = arith.cmpi ne, %268, %232 : i64
      %270 = arith.cmpi eq, %267, %232 : i64
      %271 = arith.andi %269, %270 : i1
      %272 = scf.if %271 -> (i64) {
        scf.yield %231 : i64
      } else {
        scf.yield %267 : i64
      }
      %273 = arith.cmpi ne, %272, %232 : i64
      scf.if %273 {
        func.call @stack_push_pointer(%272) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%50) : (i64) -> ()
        func.call @stack_push_pointer(%134) : (i64) -> ()
        func.call @stack_push_pointer(%184) : (i64) -> ()
        func.call @stack_push_pointer(%196) : (i64) -> ()
        func.call @stack_push_pointer(%207) : (i64) -> ()
        func.call @stack_push_pointer(%211) : (i64) -> ()
        func.call @stack_push_pointer(%222) : (i64) -> ()
        func.call @stack_push_pointer(%231) : (i64) -> ()
        %274 = llvm.mlir.addressof @str25 : !llvm.ptr
        %275 = func.call @cc_make_function_ref_const(%274) : (!llvm.ptr) -> i64
        %276 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%275, %276) : (i64, i64) -> ()
      }
      %277 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %277 : i64
    }
    %278 = func.call @cc_nil_value() : () -> i64
    %279 = func.call @cc_errorp(%41) : (i64) -> i64
    %280 = arith.cmpi ne, %279, %278 : i64
    %281 = scf.if %280 -> (i64) {
      scf.yield %41 : i64
    } else {
      %282 = llvm.mlir.addressof @str26 : !llvm.ptr
      %283 = arith.constant 16 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_intern(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_nil_value() : () -> i64
      %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
      %289 = func.call @cc_values_pack(%288) : (i64) -> i64
      func.call @stack_push_pointer(%286) : (i64) -> ()
      %290 = func.call @stack_pop_pointer() : () -> i64
      %291 = llvm.mlir.addressof @str27 : !llvm.ptr
      %292 = arith.constant 10 : i64
      %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
      %294 = llvm.mlir.addressof @str28 : !llvm.ptr
      %295 = arith.constant 11 : i64
      %296 = func.call @cc_make_string(%294, %295) : (!llvm.ptr, i64) -> i64
      %297 = func.call @cc_intern(%293, %296) : (i64, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_cons(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_values_pack(%299) : (i64) -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %301 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%301) : (i64) -> ()
      %302 = llvm.mlir.addressof @str29 : !llvm.ptr
      %303 = arith.constant 12 : i64
      %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
      %305 = llvm.mlir.addressof @str30 : !llvm.ptr
      %306 = arith.constant 7 : i64
      %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
      %308 = func.call @cc_intern(%304, %307) : (i64, i64) -> i64
      %309 = func.call @cc_nil_value() : () -> i64
      %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
      %311 = func.call @cc_values_pack(%310) : (i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %312 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%312) : (i64) -> ()
      %313 = llvm.mlir.addressof @str31 : !llvm.ptr
      %314 = arith.constant 3 : i64
      %315 = func.call @cc_make_string(%313, %314) : (!llvm.ptr, i64) -> i64
      %316 = llvm.mlir.addressof @str32 : !llvm.ptr
      %317 = arith.constant 11 : i64
      %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
      %319 = func.call @cc_intern(%315, %318) : (i64, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_values_pack(%321) : (i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
      %326 = llvm.mlir.addressof @str33 : !llvm.ptr
      %327 = arith.constant 5 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_nil_value() : () -> i64
      %330 = func.call @cc_intern(%328, %329) : (i64, i64) -> i64
      %331 = func.call @cc_nil_value() : () -> i64
      %332 = func.call @cc_cons(%330, %331) : (i64, i64) -> i64
      %333 = func.call @cc_values_pack(%332) : (i64) -> i64
      %334 = func.call @cc_cons(%330, %325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%334) : (i64) -> ()
      %335 = llvm.mlir.addressof @str34 : !llvm.ptr
      %336 = arith.constant 16 : i64
      %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
      %338 = llvm.mlir.addressof @str35 : !llvm.ptr
      %339 = arith.constant 7 : i64
      %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
      %341 = func.call @cc_intern(%337, %340) : (i64, i64) -> i64
      %342 = func.call @cc_nil_value() : () -> i64
      %343 = func.call @cc_cons(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_values_pack(%343) : (i64) -> i64
      func.call @stack_push_pointer(%341) : (i64) -> ()
      %345 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%345) : (i64) -> ()
      %346 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%346) : (i64) -> ()
      %347 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%347) : (i64) -> ()
      %348 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = func.call @stack_pop_pointer() : () -> i64
      %351 = func.call @cc_cons(%350, %349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%351) : (i64) -> ()
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @stack_pop_pointer() : () -> i64
      %354 = func.call @cc_cons(%353, %352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%354) : (i64) -> ()
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = func.call @stack_pop_pointer() : () -> i64
      %357 = func.call @cc_cons(%356, %355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%357) : (i64) -> ()
      %358 = func.call @stack_pop_pointer() : () -> i64
      %359 = func.call @stack_pop_pointer() : () -> i64
      %360 = func.call @cc_cons(%358, %359) : (i64, i64) -> i64
      %361 = llvm.mlir.addressof @str36 : !llvm.ptr
      %362 = arith.constant 5 : i64
      %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_intern(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_cons(%365, %366) : (i64, i64) -> i64
      %368 = func.call @cc_values_pack(%367) : (i64) -> i64
      %369 = func.call @cc_cons(%365, %360) : (i64, i64) -> i64
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
      %473 = arith.constant 108321407238146 : i64
      %474 = arith.constant 0 : i64
      %475 = func.call @cc_make_closure(%473, %474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%475) : (i64) -> ()
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%477) : (i64) -> ()
      %478 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%478) : (i64) -> ()
      %479 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%479) : (i64) -> ()
      %480 = arith.constant 3 : i64
      %481 = func.call @cc_box_fixnum(%480) : (i64) -> i64
      %482 = func.call @cc_make_vector(%481) : (i64) -> i64
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = arith.constant 2 : i64
      %485 = func.call @cc_box_fixnum(%484) : (i64) -> i64
      %486 = func.call @cc_svset(%482, %485, %483) : (i64, i64, i64) -> i64
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = arith.constant 1 : i64
      %489 = func.call @cc_box_fixnum(%488) : (i64) -> i64
      %490 = func.call @cc_svset(%482, %489, %487) : (i64, i64, i64) -> i64
      %491 = func.call @stack_pop_pointer() : () -> i64
      %492 = arith.constant 0 : i64
      %493 = func.call @cc_box_fixnum(%492) : (i64) -> i64
      %494 = func.call @cc_svset(%482, %493, %491) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %495 = func.call @stack_pop_pointer() : () -> i64
      %496 = func.call @stack_pop_pointer() : () -> i64
      %497 = func.call @cc_cons(%496, %495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%497) : (i64) -> ()
      %498 = func.call @stack_pop_pointer() : () -> i64
      %499 = llvm.mlir.addressof @str44 : !llvm.ptr
      %500 = arith.constant 11 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = llvm.mlir.addressof @str45 : !llvm.ptr
      %503 = arith.constant 7 : i64
      %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
      %505 = func.call @cc_intern(%501, %504) : (i64, i64) -> i64
      %506 = func.call @cc_nil_value() : () -> i64
      %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
      %508 = func.call @cc_values_pack(%507) : (i64) -> i64
      func.call @stack_push_pointer(%505) : (i64) -> ()
      %509 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = llvm.mlir.addressof @str46 : !llvm.ptr
      %512 = arith.constant 4 : i64
      %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
      %514 = llvm.mlir.addressof @str47 : !llvm.ptr
      %515 = arith.constant 7 : i64
      %516 = func.call @cc_make_string(%514, %515) : (!llvm.ptr, i64) -> i64
      %517 = func.call @cc_intern(%513, %516) : (i64, i64) -> i64
      %518 = func.call @cc_nil_value() : () -> i64
      %519 = func.call @cc_cons(%517, %518) : (i64, i64) -> i64
      %520 = func.call @cc_values_pack(%519) : (i64) -> i64
      func.call @stack_push_pointer(%517) : (i64) -> ()
      %521 = func.call @stack_pop_pointer() : () -> i64
      %522 = llvm.mlir.addressof @str48 : !llvm.ptr
      %523 = arith.constant 5 : i64
      %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
      %525 = llvm.mlir.addressof @str49 : !llvm.ptr
      %526 = arith.constant 11 : i64
      %527 = func.call @cc_make_string(%525, %526) : (!llvm.ptr, i64) -> i64
      %528 = func.call @cc_intern(%524, %527) : (i64, i64) -> i64
      %529 = func.call @cc_nil_value() : () -> i64
      %530 = func.call @cc_cons(%528, %529) : (i64, i64) -> i64
      %531 = func.call @cc_values_pack(%530) : (i64) -> i64
      func.call @stack_push_pointer(%528) : (i64) -> ()
      %532 = func.call @stack_pop_pointer() : () -> i64
      %533 = func.call @cc_nil_value() : () -> i64
      %534 = func.call @cc_errorp(%290) : (i64) -> i64
      %535 = arith.cmpi ne, %534, %533 : i64
      %536 = arith.cmpi eq, %533, %533 : i64
      %537 = arith.andi %535, %536 : i1
      %538 = scf.if %537 -> (i64) {
        scf.yield %290 : i64
      } else {
        scf.yield %533 : i64
      }
      %539 = func.call @cc_errorp(%388) : (i64) -> i64
      %540 = arith.cmpi ne, %539, %533 : i64
      %541 = arith.cmpi eq, %538, %533 : i64
      %542 = arith.andi %540, %541 : i1
      %543 = scf.if %542 -> (i64) {
        scf.yield %388 : i64
      } else {
        scf.yield %538 : i64
      }
      %544 = func.call @cc_errorp(%476) : (i64) -> i64
      %545 = arith.cmpi ne, %544, %533 : i64
      %546 = arith.cmpi eq, %543, %533 : i64
      %547 = arith.andi %545, %546 : i1
      %548 = scf.if %547 -> (i64) {
        scf.yield %476 : i64
      } else {
        scf.yield %543 : i64
      }
      %549 = func.call @cc_errorp(%498) : (i64) -> i64
      %550 = arith.cmpi ne, %549, %533 : i64
      %551 = arith.cmpi eq, %548, %533 : i64
      %552 = arith.andi %550, %551 : i1
      %553 = scf.if %552 -> (i64) {
        scf.yield %498 : i64
      } else {
        scf.yield %548 : i64
      }
      %554 = func.call @cc_errorp(%509) : (i64) -> i64
      %555 = arith.cmpi ne, %554, %533 : i64
      %556 = arith.cmpi eq, %553, %533 : i64
      %557 = arith.andi %555, %556 : i1
      %558 = scf.if %557 -> (i64) {
        scf.yield %509 : i64
      } else {
        scf.yield %553 : i64
      }
      %559 = func.call @cc_errorp(%510) : (i64) -> i64
      %560 = arith.cmpi ne, %559, %533 : i64
      %561 = arith.cmpi eq, %558, %533 : i64
      %562 = arith.andi %560, %561 : i1
      %563 = scf.if %562 -> (i64) {
        scf.yield %510 : i64
      } else {
        scf.yield %558 : i64
      }
      %564 = func.call @cc_errorp(%521) : (i64) -> i64
      %565 = arith.cmpi ne, %564, %533 : i64
      %566 = arith.cmpi eq, %563, %533 : i64
      %567 = arith.andi %565, %566 : i1
      %568 = scf.if %567 -> (i64) {
        scf.yield %521 : i64
      } else {
        scf.yield %563 : i64
      }
      %569 = func.call @cc_errorp(%532) : (i64) -> i64
      %570 = arith.cmpi ne, %569, %533 : i64
      %571 = arith.cmpi eq, %568, %533 : i64
      %572 = arith.andi %570, %571 : i1
      %573 = scf.if %572 -> (i64) {
        scf.yield %532 : i64
      } else {
        scf.yield %568 : i64
      }
      %574 = arith.cmpi ne, %573, %533 : i64
      scf.if %574 {
        func.call @stack_push_pointer(%573) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%290) : (i64) -> ()
        func.call @stack_push_pointer(%388) : (i64) -> ()
        func.call @stack_push_pointer(%476) : (i64) -> ()
        func.call @stack_push_pointer(%498) : (i64) -> ()
        func.call @stack_push_pointer(%509) : (i64) -> ()
        func.call @stack_push_pointer(%510) : (i64) -> ()
        func.call @stack_push_pointer(%521) : (i64) -> ()
        func.call @stack_push_pointer(%532) : (i64) -> ()
        %575 = llvm.mlir.addressof @str50 : !llvm.ptr
        %576 = func.call @cc_make_function_ref_const(%575) : (!llvm.ptr) -> i64
        %577 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%576, %577) : (i64, i64) -> ()
      }
      %578 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %578 : i64
    }
    %579 = func.call @cc_nil_value() : () -> i64
    %580 = func.call @cc_errorp(%281) : (i64) -> i64
    %581 = arith.cmpi ne, %580, %579 : i64
    %582 = scf.if %581 -> (i64) {
      scf.yield %281 : i64
    } else {
      %583 = llvm.mlir.addressof @str51 : !llvm.ptr
      %584 = arith.constant 17 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = func.call @cc_nil_value() : () -> i64
      %587 = func.call @cc_intern(%585, %586) : (i64, i64) -> i64
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_cons(%587, %588) : (i64, i64) -> i64
      %590 = func.call @cc_values_pack(%589) : (i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      %591 = func.call @stack_pop_pointer() : () -> i64
      %592 = llvm.mlir.addressof @str52 : !llvm.ptr
      %593 = arith.constant 10 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = llvm.mlir.addressof @str53 : !llvm.ptr
      %596 = arith.constant 11 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = func.call @cc_intern(%594, %597) : (i64, i64) -> i64
      %599 = func.call @cc_nil_value() : () -> i64
      %600 = func.call @cc_cons(%598, %599) : (i64, i64) -> i64
      %601 = func.call @cc_values_pack(%600) : (i64) -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      %602 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%602) : (i64) -> ()
      %603 = llvm.mlir.addressof @str54 : !llvm.ptr
      %604 = arith.constant 12 : i64
      %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
      %606 = llvm.mlir.addressof @str55 : !llvm.ptr
      %607 = arith.constant 7 : i64
      %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
      %609 = func.call @cc_intern(%605, %608) : (i64, i64) -> i64
      %610 = func.call @cc_nil_value() : () -> i64
      %611 = func.call @cc_cons(%609, %610) : (i64, i64) -> i64
      %612 = func.call @cc_values_pack(%611) : (i64) -> i64
      func.call @stack_push_pointer(%609) : (i64) -> ()
      %613 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%613) : (i64) -> ()
      %614 = llvm.mlir.addressof @str56 : !llvm.ptr
      %615 = arith.constant 13 : i64
      %616 = func.call @cc_make_string(%614, %615) : (!llvm.ptr, i64) -> i64
      %617 = llvm.mlir.addressof @str57 : !llvm.ptr
      %618 = arith.constant 11 : i64
      %619 = func.call @cc_make_string(%617, %618) : (!llvm.ptr, i64) -> i64
      %620 = func.call @cc_intern(%616, %619) : (i64, i64) -> i64
      %621 = func.call @cc_nil_value() : () -> i64
      %622 = func.call @cc_cons(%620, %621) : (i64, i64) -> i64
      %623 = func.call @cc_values_pack(%622) : (i64) -> i64
      func.call @stack_push_pointer(%620) : (i64) -> ()
      %624 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%624) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = func.call @cc_cons(%626, %625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%627) : (i64) -> ()
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @stack_pop_pointer() : () -> i64
      %630 = func.call @cc_cons(%629, %628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%630) : (i64) -> ()
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @cc_cons(%631, %632) : (i64, i64) -> i64
      %634 = llvm.mlir.addressof @str58 : !llvm.ptr
      %635 = arith.constant 5 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = func.call @cc_nil_value() : () -> i64
      %638 = func.call @cc_intern(%636, %637) : (i64, i64) -> i64
      %639 = func.call @cc_nil_value() : () -> i64
      %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
      %641 = func.call @cc_values_pack(%640) : (i64) -> i64
      %642 = func.call @cc_cons(%638, %633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%642) : (i64) -> ()
      %643 = llvm.mlir.addressof @str59 : !llvm.ptr
      %644 = arith.constant 16 : i64
      %645 = func.call @cc_make_string(%643, %644) : (!llvm.ptr, i64) -> i64
      %646 = llvm.mlir.addressof @str60 : !llvm.ptr
      %647 = arith.constant 7 : i64
      %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
      %649 = func.call @cc_intern(%645, %648) : (i64, i64) -> i64
      %650 = func.call @cc_nil_value() : () -> i64
      %651 = func.call @cc_cons(%649, %650) : (i64, i64) -> i64
      %652 = func.call @cc_values_pack(%651) : (i64) -> i64
      func.call @stack_push_pointer(%649) : (i64) -> ()
      %653 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
      %654 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%654) : (i64) -> ()
      %655 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%655) : (i64) -> ()
      %656 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %657 = func.call @stack_pop_pointer() : () -> i64
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @cc_cons(%658, %657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%659) : (i64) -> ()
      %660 = func.call @stack_pop_pointer() : () -> i64
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @cc_cons(%661, %660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %663 = func.call @stack_pop_pointer() : () -> i64
      %664 = func.call @stack_pop_pointer() : () -> i64
      %665 = func.call @cc_cons(%664, %663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%665) : (i64) -> ()
      %666 = func.call @stack_pop_pointer() : () -> i64
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @cc_cons(%666, %667) : (i64, i64) -> i64
      %669 = llvm.mlir.addressof @str61 : !llvm.ptr
      %670 = arith.constant 5 : i64
      %671 = func.call @cc_make_string(%669, %670) : (!llvm.ptr, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_intern(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_nil_value() : () -> i64
      %675 = func.call @cc_cons(%673, %674) : (i64, i64) -> i64
      %676 = func.call @cc_values_pack(%675) : (i64) -> i64
      %677 = func.call @cc_cons(%673, %668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%677) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %678 = func.call @stack_pop_pointer() : () -> i64
      %679 = func.call @stack_pop_pointer() : () -> i64
      %680 = func.call @cc_cons(%679, %678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%680) : (i64) -> ()
      %681 = func.call @stack_pop_pointer() : () -> i64
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @cc_cons(%682, %681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%683) : (i64) -> ()
      %684 = func.call @stack_pop_pointer() : () -> i64
      %685 = func.call @stack_pop_pointer() : () -> i64
      %686 = func.call @cc_cons(%685, %684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%686) : (i64) -> ()
      %687 = func.call @stack_pop_pointer() : () -> i64
      %688 = func.call @stack_pop_pointer() : () -> i64
      %689 = func.call @cc_cons(%688, %687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%689) : (i64) -> ()
      %690 = func.call @stack_pop_pointer() : () -> i64
      %691 = func.call @stack_pop_pointer() : () -> i64
      %692 = func.call @cc_cons(%691, %690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%692) : (i64) -> ()
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @stack_pop_pointer() : () -> i64
      %695 = func.call @cc_cons(%694, %693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%695) : (i64) -> ()
      %696 = func.call @stack_pop_pointer() : () -> i64
      %788 = arith.constant 108321407238147 : i64
      %789 = arith.constant 0 : i64
      %790 = func.call @cc_make_closure(%788, %789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%792) : (i64) -> ()
      %793 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%793) : (i64) -> ()
      %794 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%794) : (i64) -> ()
      %795 = arith.constant 3 : i64
      %796 = func.call @cc_box_fixnum(%795) : (i64) -> i64
      %797 = func.call @cc_make_vector(%796) : (i64) -> i64
      %798 = func.call @stack_pop_pointer() : () -> i64
      %799 = arith.constant 2 : i64
      %800 = func.call @cc_box_fixnum(%799) : (i64) -> i64
      %801 = func.call @cc_svset(%797, %800, %798) : (i64, i64, i64) -> i64
      %802 = func.call @stack_pop_pointer() : () -> i64
      %803 = arith.constant 1 : i64
      %804 = func.call @cc_box_fixnum(%803) : (i64) -> i64
      %805 = func.call @cc_svset(%797, %804, %802) : (i64, i64, i64) -> i64
      %806 = func.call @stack_pop_pointer() : () -> i64
      %807 = arith.constant 0 : i64
      %808 = func.call @cc_box_fixnum(%807) : (i64) -> i64
      %809 = func.call @cc_svset(%797, %808, %806) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%797) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %810 = func.call @stack_pop_pointer() : () -> i64
      %811 = func.call @stack_pop_pointer() : () -> i64
      %812 = func.call @cc_cons(%811, %810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%812) : (i64) -> ()
      %813 = func.call @stack_pop_pointer() : () -> i64
      %814 = llvm.mlir.addressof @str69 : !llvm.ptr
      %815 = arith.constant 11 : i64
      %816 = func.call @cc_make_string(%814, %815) : (!llvm.ptr, i64) -> i64
      %817 = llvm.mlir.addressof @str70 : !llvm.ptr
      %818 = arith.constant 7 : i64
      %819 = func.call @cc_make_string(%817, %818) : (!llvm.ptr, i64) -> i64
      %820 = func.call @cc_intern(%816, %819) : (i64, i64) -> i64
      %821 = func.call @cc_nil_value() : () -> i64
      %822 = func.call @cc_cons(%820, %821) : (i64, i64) -> i64
      %823 = func.call @cc_values_pack(%822) : (i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      %824 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = llvm.mlir.addressof @str71 : !llvm.ptr
      %827 = arith.constant 4 : i64
      %828 = func.call @cc_make_string(%826, %827) : (!llvm.ptr, i64) -> i64
      %829 = llvm.mlir.addressof @str72 : !llvm.ptr
      %830 = arith.constant 7 : i64
      %831 = func.call @cc_make_string(%829, %830) : (!llvm.ptr, i64) -> i64
      %832 = func.call @cc_intern(%828, %831) : (i64, i64) -> i64
      %833 = func.call @cc_nil_value() : () -> i64
      %834 = func.call @cc_cons(%832, %833) : (i64, i64) -> i64
      %835 = func.call @cc_values_pack(%834) : (i64) -> i64
      func.call @stack_push_pointer(%832) : (i64) -> ()
      %836 = func.call @stack_pop_pointer() : () -> i64
      %837 = llvm.mlir.addressof @str73 : !llvm.ptr
      %838 = arith.constant 6 : i64
      %839 = func.call @cc_make_string(%837, %838) : (!llvm.ptr, i64) -> i64
      %840 = func.call @cc_nil_value() : () -> i64
      %841 = func.call @cc_intern(%839, %840) : (i64, i64) -> i64
      %842 = func.call @cc_nil_value() : () -> i64
      %843 = func.call @cc_cons(%841, %842) : (i64, i64) -> i64
      %844 = func.call @cc_values_pack(%843) : (i64) -> i64
      func.call @stack_push_pointer(%841) : (i64) -> ()
      %845 = func.call @stack_pop_pointer() : () -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_errorp(%591) : (i64) -> i64
      %848 = arith.cmpi ne, %847, %846 : i64
      %849 = arith.cmpi eq, %846, %846 : i64
      %850 = arith.andi %848, %849 : i1
      %851 = scf.if %850 -> (i64) {
        scf.yield %591 : i64
      } else {
        scf.yield %846 : i64
      }
      %852 = func.call @cc_errorp(%696) : (i64) -> i64
      %853 = arith.cmpi ne, %852, %846 : i64
      %854 = arith.cmpi eq, %851, %846 : i64
      %855 = arith.andi %853, %854 : i1
      %856 = scf.if %855 -> (i64) {
        scf.yield %696 : i64
      } else {
        scf.yield %851 : i64
      }
      %857 = func.call @cc_errorp(%791) : (i64) -> i64
      %858 = arith.cmpi ne, %857, %846 : i64
      %859 = arith.cmpi eq, %856, %846 : i64
      %860 = arith.andi %858, %859 : i1
      %861 = scf.if %860 -> (i64) {
        scf.yield %791 : i64
      } else {
        scf.yield %856 : i64
      }
      %862 = func.call @cc_errorp(%813) : (i64) -> i64
      %863 = arith.cmpi ne, %862, %846 : i64
      %864 = arith.cmpi eq, %861, %846 : i64
      %865 = arith.andi %863, %864 : i1
      %866 = scf.if %865 -> (i64) {
        scf.yield %813 : i64
      } else {
        scf.yield %861 : i64
      }
      %867 = func.call @cc_errorp(%824) : (i64) -> i64
      %868 = arith.cmpi ne, %867, %846 : i64
      %869 = arith.cmpi eq, %866, %846 : i64
      %870 = arith.andi %868, %869 : i1
      %871 = scf.if %870 -> (i64) {
        scf.yield %824 : i64
      } else {
        scf.yield %866 : i64
      }
      %872 = func.call @cc_errorp(%825) : (i64) -> i64
      %873 = arith.cmpi ne, %872, %846 : i64
      %874 = arith.cmpi eq, %871, %846 : i64
      %875 = arith.andi %873, %874 : i1
      %876 = scf.if %875 -> (i64) {
        scf.yield %825 : i64
      } else {
        scf.yield %871 : i64
      }
      %877 = func.call @cc_errorp(%836) : (i64) -> i64
      %878 = arith.cmpi ne, %877, %846 : i64
      %879 = arith.cmpi eq, %876, %846 : i64
      %880 = arith.andi %878, %879 : i1
      %881 = scf.if %880 -> (i64) {
        scf.yield %836 : i64
      } else {
        scf.yield %876 : i64
      }
      %882 = func.call @cc_errorp(%845) : (i64) -> i64
      %883 = arith.cmpi ne, %882, %846 : i64
      %884 = arith.cmpi eq, %881, %846 : i64
      %885 = arith.andi %883, %884 : i1
      %886 = scf.if %885 -> (i64) {
        scf.yield %845 : i64
      } else {
        scf.yield %881 : i64
      }
      %887 = arith.cmpi ne, %886, %846 : i64
      scf.if %887 {
        func.call @stack_push_pointer(%886) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%591) : (i64) -> ()
        func.call @stack_push_pointer(%696) : (i64) -> ()
        func.call @stack_push_pointer(%791) : (i64) -> ()
        func.call @stack_push_pointer(%813) : (i64) -> ()
        func.call @stack_push_pointer(%824) : (i64) -> ()
        func.call @stack_push_pointer(%825) : (i64) -> ()
        func.call @stack_push_pointer(%836) : (i64) -> ()
        func.call @stack_push_pointer(%845) : (i64) -> ()
        %888 = llvm.mlir.addressof @str74 : !llvm.ptr
        %889 = func.call @cc_make_function_ref_const(%888) : (!llvm.ptr) -> i64
        %890 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%889, %890) : (i64, i64) -> ()
      }
      %891 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %891 : i64
    }
    %892 = func.call @cc_nil_value() : () -> i64
    %893 = func.call @cc_errorp(%582) : (i64) -> i64
    %894 = arith.cmpi ne, %893, %892 : i64
    %895 = scf.if %894 -> (i64) {
      scf.yield %582 : i64
    } else {
      %896 = llvm.mlir.addressof @str75 : !llvm.ptr
      %897 = arith.constant 8 : i64
      %898 = func.call @cc_make_string(%896, %897) : (!llvm.ptr, i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_intern(%898, %899) : (i64, i64) -> i64
      %901 = func.call @cc_nil_value() : () -> i64
      %902 = func.call @cc_cons(%900, %901) : (i64, i64) -> i64
      %903 = func.call @cc_values_pack(%902) : (i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %904 = func.call @stack_pop_pointer() : () -> i64
      %905 = llvm.mlir.addressof @str76 : !llvm.ptr
      %906 = arith.constant 10 : i64
      %907 = func.call @cc_make_string(%905, %906) : (!llvm.ptr, i64) -> i64
      %908 = llvm.mlir.addressof @str77 : !llvm.ptr
      %909 = arith.constant 11 : i64
      %910 = func.call @cc_make_string(%908, %909) : (!llvm.ptr, i64) -> i64
      %911 = func.call @cc_intern(%907, %910) : (i64, i64) -> i64
      %912 = func.call @cc_nil_value() : () -> i64
      %913 = func.call @cc_cons(%911, %912) : (i64, i64) -> i64
      %914 = func.call @cc_values_pack(%913) : (i64) -> i64
      func.call @stack_push_pointer(%911) : (i64) -> ()
      %915 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%915) : (i64) -> ()
      %916 = llvm.mlir.addressof @str78 : !llvm.ptr
      %917 = arith.constant 12 : i64
      %918 = func.call @cc_make_string(%916, %917) : (!llvm.ptr, i64) -> i64
      %919 = llvm.mlir.addressof @str79 : !llvm.ptr
      %920 = arith.constant 7 : i64
      %921 = func.call @cc_make_string(%919, %920) : (!llvm.ptr, i64) -> i64
      %922 = func.call @cc_intern(%918, %921) : (i64, i64) -> i64
      %923 = func.call @cc_nil_value() : () -> i64
      %924 = func.call @cc_cons(%922, %923) : (i64, i64) -> i64
      %925 = func.call @cc_values_pack(%924) : (i64) -> i64
      func.call @stack_push_pointer(%922) : (i64) -> ()
      %926 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%926) : (i64) -> ()
      %927 = llvm.mlir.addressof @str80 : !llvm.ptr
      %928 = arith.constant 9 : i64
      %929 = func.call @cc_make_string(%927, %928) : (!llvm.ptr, i64) -> i64
      %930 = llvm.mlir.addressof @str81 : !llvm.ptr
      %931 = arith.constant 11 : i64
      %932 = func.call @cc_make_string(%930, %931) : (!llvm.ptr, i64) -> i64
      %933 = func.call @cc_intern(%929, %932) : (i64, i64) -> i64
      %934 = func.call @cc_nil_value() : () -> i64
      %935 = func.call @cc_cons(%933, %934) : (i64, i64) -> i64
      %936 = func.call @cc_values_pack(%935) : (i64) -> i64
      func.call @stack_push_pointer(%933) : (i64) -> ()
      %937 = func.call @stack_pop_pointer() : () -> i64
      %938 = func.call @stack_pop_pointer() : () -> i64
      %939 = func.call @cc_cons(%937, %938) : (i64, i64) -> i64
      %940 = llvm.mlir.addressof @str82 : !llvm.ptr
      %941 = arith.constant 5 : i64
      %942 = func.call @cc_make_string(%940, %941) : (!llvm.ptr, i64) -> i64
      %943 = func.call @cc_nil_value() : () -> i64
      %944 = func.call @cc_intern(%942, %943) : (i64, i64) -> i64
      %945 = func.call @cc_nil_value() : () -> i64
      %946 = func.call @cc_cons(%944, %945) : (i64, i64) -> i64
      %947 = func.call @cc_values_pack(%946) : (i64) -> i64
      %948 = func.call @cc_cons(%944, %939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%948) : (i64) -> ()
      %949 = llvm.mlir.addressof @str83 : !llvm.ptr
      %950 = arith.constant 15 : i64
      %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
      %952 = llvm.mlir.addressof @str84 : !llvm.ptr
      %953 = arith.constant 7 : i64
      %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
      %955 = func.call @cc_intern(%951, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      func.call @stack_push_pointer(%955) : (i64) -> ()
      %959 = arith.constant 97 : i64
      %960 = func.call @cc_box_character(%959) : (i64) -> i64
      func.call @stack_push_pointer(%960) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %961 = func.call @stack_pop_pointer() : () -> i64
      %962 = func.call @stack_pop_pointer() : () -> i64
      %963 = func.call @cc_cons(%962, %961) : (i64, i64) -> i64
      func.call @stack_push_pointer(%963) : (i64) -> ()
      %964 = func.call @stack_pop_pointer() : () -> i64
      %965 = func.call @stack_pop_pointer() : () -> i64
      %966 = func.call @cc_cons(%965, %964) : (i64, i64) -> i64
      func.call @stack_push_pointer(%966) : (i64) -> ()
      %967 = func.call @stack_pop_pointer() : () -> i64
      %968 = func.call @stack_pop_pointer() : () -> i64
      %969 = func.call @cc_cons(%968, %967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%969) : (i64) -> ()
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = func.call @stack_pop_pointer() : () -> i64
      %972 = func.call @cc_cons(%971, %970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @stack_pop_pointer() : () -> i64
      %975 = func.call @cc_cons(%974, %973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      %976 = func.call @stack_pop_pointer() : () -> i64
      %977 = func.call @stack_pop_pointer() : () -> i64
      %978 = func.call @cc_cons(%977, %976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %979 = func.call @stack_pop_pointer() : () -> i64
      %1054 = arith.constant 108321407238148 : i64
      %1055 = arith.constant 0 : i64
      %1056 = func.call @cc_make_closure(%1054, %1055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1056) : (i64) -> ()
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1059 = arith.constant 3 : i64
      %1060 = func.call @cc_make_string(%1058, %1059) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1060) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @cc_cons(%1062, %1061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1066 = arith.constant 11 : i64
      %1067 = func.call @cc_make_string(%1065, %1066) : (!llvm.ptr, i64) -> i64
      %1068 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1069 = arith.constant 7 : i64
      %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
      %1071 = func.call @cc_intern(%1067, %1070) : (i64, i64) -> i64
      %1072 = func.call @cc_nil_value() : () -> i64
      %1073 = func.call @cc_cons(%1071, %1072) : (i64, i64) -> i64
      %1074 = func.call @cc_values_pack(%1073) : (i64) -> i64
      func.call @stack_push_pointer(%1071) : (i64) -> ()
      %1075 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1076 = func.call @stack_pop_pointer() : () -> i64
      %1077 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1078 = arith.constant 4 : i64
      %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
      %1080 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1081 = arith.constant 7 : i64
      %1082 = func.call @cc_make_string(%1080, %1081) : (!llvm.ptr, i64) -> i64
      %1083 = func.call @cc_intern(%1079, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_cons(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_values_pack(%1085) : (i64) -> i64
      func.call @stack_push_pointer(%1083) : (i64) -> ()
      %1087 = func.call @stack_pop_pointer() : () -> i64
      %1088 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1089 = arith.constant 7 : i64
      %1090 = func.call @cc_make_string(%1088, %1089) : (!llvm.ptr, i64) -> i64
      %1091 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1092 = arith.constant 11 : i64
      %1093 = func.call @cc_make_string(%1091, %1092) : (!llvm.ptr, i64) -> i64
      %1094 = func.call @cc_intern(%1090, %1093) : (i64, i64) -> i64
      %1095 = func.call @cc_nil_value() : () -> i64
      %1096 = func.call @cc_cons(%1094, %1095) : (i64, i64) -> i64
      %1097 = func.call @cc_values_pack(%1096) : (i64) -> i64
      func.call @stack_push_pointer(%1094) : (i64) -> ()
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_errorp(%904) : (i64) -> i64
      %1101 = arith.cmpi ne, %1100, %1099 : i64
      %1102 = arith.cmpi eq, %1099, %1099 : i64
      %1103 = arith.andi %1101, %1102 : i1
      %1104 = scf.if %1103 -> (i64) {
        scf.yield %904 : i64
      } else {
        scf.yield %1099 : i64
      }
      %1105 = func.call @cc_errorp(%979) : (i64) -> i64
      %1106 = arith.cmpi ne, %1105, %1099 : i64
      %1107 = arith.cmpi eq, %1104, %1099 : i64
      %1108 = arith.andi %1106, %1107 : i1
      %1109 = scf.if %1108 -> (i64) {
        scf.yield %979 : i64
      } else {
        scf.yield %1104 : i64
      }
      %1110 = func.call @cc_errorp(%1057) : (i64) -> i64
      %1111 = arith.cmpi ne, %1110, %1099 : i64
      %1112 = arith.cmpi eq, %1109, %1099 : i64
      %1113 = arith.andi %1111, %1112 : i1
      %1114 = scf.if %1113 -> (i64) {
        scf.yield %1057 : i64
      } else {
        scf.yield %1109 : i64
      }
      %1115 = func.call @cc_errorp(%1064) : (i64) -> i64
      %1116 = arith.cmpi ne, %1115, %1099 : i64
      %1117 = arith.cmpi eq, %1114, %1099 : i64
      %1118 = arith.andi %1116, %1117 : i1
      %1119 = scf.if %1118 -> (i64) {
        scf.yield %1064 : i64
      } else {
        scf.yield %1114 : i64
      }
      %1120 = func.call @cc_errorp(%1075) : (i64) -> i64
      %1121 = arith.cmpi ne, %1120, %1099 : i64
      %1122 = arith.cmpi eq, %1119, %1099 : i64
      %1123 = arith.andi %1121, %1122 : i1
      %1124 = scf.if %1123 -> (i64) {
        scf.yield %1075 : i64
      } else {
        scf.yield %1119 : i64
      }
      %1125 = func.call @cc_errorp(%1076) : (i64) -> i64
      %1126 = arith.cmpi ne, %1125, %1099 : i64
      %1127 = arith.cmpi eq, %1124, %1099 : i64
      %1128 = arith.andi %1126, %1127 : i1
      %1129 = scf.if %1128 -> (i64) {
        scf.yield %1076 : i64
      } else {
        scf.yield %1124 : i64
      }
      %1130 = func.call @cc_errorp(%1087) : (i64) -> i64
      %1131 = arith.cmpi ne, %1130, %1099 : i64
      %1132 = arith.cmpi eq, %1129, %1099 : i64
      %1133 = arith.andi %1131, %1132 : i1
      %1134 = scf.if %1133 -> (i64) {
        scf.yield %1087 : i64
      } else {
        scf.yield %1129 : i64
      }
      %1135 = func.call @cc_errorp(%1098) : (i64) -> i64
      %1136 = arith.cmpi ne, %1135, %1099 : i64
      %1137 = arith.cmpi eq, %1134, %1099 : i64
      %1138 = arith.andi %1136, %1137 : i1
      %1139 = scf.if %1138 -> (i64) {
        scf.yield %1098 : i64
      } else {
        scf.yield %1134 : i64
      }
      %1140 = arith.cmpi ne, %1139, %1099 : i64
      scf.if %1140 {
        func.call @stack_push_pointer(%1139) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%904) : (i64) -> ()
        func.call @stack_push_pointer(%979) : (i64) -> ()
        func.call @stack_push_pointer(%1057) : (i64) -> ()
        func.call @stack_push_pointer(%1064) : (i64) -> ()
        func.call @stack_push_pointer(%1075) : (i64) -> ()
        func.call @stack_push_pointer(%1076) : (i64) -> ()
        func.call @stack_push_pointer(%1087) : (i64) -> ()
        func.call @stack_push_pointer(%1098) : (i64) -> ()
        %1141 = llvm.mlir.addressof @str99 : !llvm.ptr
        %1142 = func.call @cc_make_function_ref_const(%1141) : (!llvm.ptr) -> i64
        %1143 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1142, %1143) : (i64, i64) -> ()
      }
      %1144 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1144 : i64
    }
    %1145 = func.call @cc_nil_value() : () -> i64
    %1146 = func.call @cc_errorp(%895) : (i64) -> i64
    %1147 = arith.cmpi ne, %1146, %1145 : i64
    %1148 = scf.if %1147 -> (i64) {
      scf.yield %895 : i64
    } else {
      %1149 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1150 = arith.constant 8 : i64
      %1151 = func.call @cc_make_string(%1149, %1150) : (!llvm.ptr, i64) -> i64
      %1152 = func.call @cc_nil_value() : () -> i64
      %1153 = func.call @cc_intern(%1151, %1152) : (i64, i64) -> i64
      %1154 = func.call @cc_nil_value() : () -> i64
      %1155 = func.call @cc_cons(%1153, %1154) : (i64, i64) -> i64
      %1156 = func.call @cc_values_pack(%1155) : (i64) -> i64
      func.call @stack_push_pointer(%1153) : (i64) -> ()
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1159 = arith.constant 10 : i64
      %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
      %1161 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1162 = arith.constant 11 : i64
      %1163 = func.call @cc_make_string(%1161, %1162) : (!llvm.ptr, i64) -> i64
      %1164 = func.call @cc_intern(%1160, %1163) : (i64, i64) -> i64
      %1165 = func.call @cc_nil_value() : () -> i64
      %1166 = func.call @cc_cons(%1164, %1165) : (i64, i64) -> i64
      %1167 = func.call @cc_values_pack(%1166) : (i64) -> i64
      func.call @stack_push_pointer(%1164) : (i64) -> ()
      %1168 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1168) : (i64) -> ()
      %1169 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1170 = arith.constant 12 : i64
      %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
      %1172 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1173 = arith.constant 7 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = func.call @cc_intern(%1171, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_cons(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_values_pack(%1177) : (i64) -> i64
      func.call @stack_push_pointer(%1175) : (i64) -> ()
      %1179 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1179) : (i64) -> ()
      %1180 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1181 = arith.constant 9 : i64
      %1182 = func.call @cc_make_string(%1180, %1181) : (!llvm.ptr, i64) -> i64
      %1183 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1184 = arith.constant 11 : i64
      %1185 = func.call @cc_make_string(%1183, %1184) : (!llvm.ptr, i64) -> i64
      %1186 = func.call @cc_intern(%1182, %1185) : (i64, i64) -> i64
      %1187 = func.call @cc_nil_value() : () -> i64
      %1188 = func.call @cc_cons(%1186, %1187) : (i64, i64) -> i64
      %1189 = func.call @cc_values_pack(%1188) : (i64) -> i64
      func.call @stack_push_pointer(%1186) : (i64) -> ()
      %1190 = func.call @stack_pop_pointer() : () -> i64
      %1191 = func.call @stack_pop_pointer() : () -> i64
      %1192 = func.call @cc_cons(%1190, %1191) : (i64, i64) -> i64
      %1193 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1194 = arith.constant 5 : i64
      %1195 = func.call @cc_make_string(%1193, %1194) : (!llvm.ptr, i64) -> i64
      %1196 = func.call @cc_nil_value() : () -> i64
      %1197 = func.call @cc_intern(%1195, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_nil_value() : () -> i64
      %1199 = func.call @cc_cons(%1197, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_values_pack(%1199) : (i64) -> i64
      %1201 = func.call @cc_cons(%1197, %1192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1201) : (i64) -> ()
      %1202 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1203 = arith.constant 16 : i64
      %1204 = func.call @cc_make_string(%1202, %1203) : (!llvm.ptr, i64) -> i64
      %1205 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1206 = arith.constant 7 : i64
      %1207 = func.call @cc_make_string(%1205, %1206) : (!llvm.ptr, i64) -> i64
      %1208 = func.call @cc_intern(%1204, %1207) : (i64, i64) -> i64
      %1209 = func.call @cc_nil_value() : () -> i64
      %1210 = func.call @cc_cons(%1208, %1209) : (i64, i64) -> i64
      %1211 = func.call @cc_values_pack(%1210) : (i64) -> i64
      func.call @stack_push_pointer(%1208) : (i64) -> ()
      %1212 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1212) : (i64) -> ()
      %1213 = arith.constant 97 : i64
      %1214 = func.call @cc_box_character(%1213) : (i64) -> i64
      func.call @stack_push_pointer(%1214) : (i64) -> ()
      %1215 = arith.constant 98 : i64
      %1216 = func.call @cc_box_character(%1215) : (i64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
      %1217 = arith.constant 99 : i64
      %1218 = func.call @cc_box_character(%1217) : (i64) -> i64
      func.call @stack_push_pointer(%1218) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1219 = func.call @stack_pop_pointer() : () -> i64
      %1220 = func.call @stack_pop_pointer() : () -> i64
      %1221 = func.call @cc_cons(%1220, %1219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1221) : (i64) -> ()
      %1222 = func.call @stack_pop_pointer() : () -> i64
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = func.call @cc_cons(%1223, %1222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1224) : (i64) -> ()
      %1225 = func.call @stack_pop_pointer() : () -> i64
      %1226 = func.call @stack_pop_pointer() : () -> i64
      %1227 = func.call @cc_cons(%1226, %1225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1227) : (i64) -> ()
      %1228 = func.call @stack_pop_pointer() : () -> i64
      %1229 = func.call @stack_pop_pointer() : () -> i64
      %1230 = func.call @cc_cons(%1228, %1229) : (i64, i64) -> i64
      %1231 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1232 = arith.constant 5 : i64
      %1233 = func.call @cc_make_string(%1231, %1232) : (!llvm.ptr, i64) -> i64
      %1234 = func.call @cc_nil_value() : () -> i64
      %1235 = func.call @cc_intern(%1233, %1234) : (i64, i64) -> i64
      %1236 = func.call @cc_nil_value() : () -> i64
      %1237 = func.call @cc_cons(%1235, %1236) : (i64, i64) -> i64
      %1238 = func.call @cc_values_pack(%1237) : (i64) -> i64
      %1239 = func.call @cc_cons(%1235, %1230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1239) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1240 = func.call @stack_pop_pointer() : () -> i64
      %1241 = func.call @stack_pop_pointer() : () -> i64
      %1242 = func.call @cc_cons(%1241, %1240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1242) : (i64) -> ()
      %1243 = func.call @stack_pop_pointer() : () -> i64
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1245 = func.call @cc_cons(%1244, %1243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1245) : (i64) -> ()
      %1246 = func.call @stack_pop_pointer() : () -> i64
      %1247 = func.call @stack_pop_pointer() : () -> i64
      %1248 = func.call @cc_cons(%1247, %1246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      %1249 = func.call @stack_pop_pointer() : () -> i64
      %1250 = func.call @stack_pop_pointer() : () -> i64
      %1251 = func.call @cc_cons(%1250, %1249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1252 = func.call @stack_pop_pointer() : () -> i64
      %1253 = func.call @stack_pop_pointer() : () -> i64
      %1254 = func.call @cc_cons(%1253, %1252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      %1255 = func.call @stack_pop_pointer() : () -> i64
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @cc_cons(%1256, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      %1258 = func.call @stack_pop_pointer() : () -> i64
      %1346 = arith.constant 108321407238149 : i64
      %1347 = arith.constant 0 : i64
      %1348 = func.call @cc_make_closure(%1346, %1347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1351 = arith.constant 3 : i64
      %1352 = func.call @cc_make_string(%1350, %1351) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1352) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1353 = func.call @stack_pop_pointer() : () -> i64
      %1354 = func.call @stack_pop_pointer() : () -> i64
      %1355 = func.call @cc_cons(%1354, %1353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1355) : (i64) -> ()
      %1356 = func.call @stack_pop_pointer() : () -> i64
      %1357 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1358 = arith.constant 11 : i64
      %1359 = func.call @cc_make_string(%1357, %1358) : (!llvm.ptr, i64) -> i64
      %1360 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1361 = arith.constant 7 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      %1363 = func.call @cc_intern(%1359, %1362) : (i64, i64) -> i64
      %1364 = func.call @cc_nil_value() : () -> i64
      %1365 = func.call @cc_cons(%1363, %1364) : (i64, i64) -> i64
      %1366 = func.call @cc_values_pack(%1365) : (i64) -> i64
      func.call @stack_push_pointer(%1363) : (i64) -> ()
      %1367 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1368 = func.call @stack_pop_pointer() : () -> i64
      %1369 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1370 = arith.constant 4 : i64
      %1371 = func.call @cc_make_string(%1369, %1370) : (!llvm.ptr, i64) -> i64
      %1372 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1373 = arith.constant 7 : i64
      %1374 = func.call @cc_make_string(%1372, %1373) : (!llvm.ptr, i64) -> i64
      %1375 = func.call @cc_intern(%1371, %1374) : (i64, i64) -> i64
      %1376 = func.call @cc_nil_value() : () -> i64
      %1377 = func.call @cc_cons(%1375, %1376) : (i64, i64) -> i64
      %1378 = func.call @cc_values_pack(%1377) : (i64) -> i64
      func.call @stack_push_pointer(%1375) : (i64) -> ()
      %1379 = func.call @stack_pop_pointer() : () -> i64
      %1380 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1381 = arith.constant 7 : i64
      %1382 = func.call @cc_make_string(%1380, %1381) : (!llvm.ptr, i64) -> i64
      %1383 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1384 = arith.constant 11 : i64
      %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
      %1386 = func.call @cc_intern(%1382, %1385) : (i64, i64) -> i64
      %1387 = func.call @cc_nil_value() : () -> i64
      %1388 = func.call @cc_cons(%1386, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_values_pack(%1388) : (i64) -> i64
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      %1390 = func.call @stack_pop_pointer() : () -> i64
      %1391 = func.call @cc_nil_value() : () -> i64
      %1392 = func.call @cc_errorp(%1157) : (i64) -> i64
      %1393 = arith.cmpi ne, %1392, %1391 : i64
      %1394 = arith.cmpi eq, %1391, %1391 : i64
      %1395 = arith.andi %1393, %1394 : i1
      %1396 = scf.if %1395 -> (i64) {
        scf.yield %1157 : i64
      } else {
        scf.yield %1391 : i64
      }
      %1397 = func.call @cc_errorp(%1258) : (i64) -> i64
      %1398 = arith.cmpi ne, %1397, %1391 : i64
      %1399 = arith.cmpi eq, %1396, %1391 : i64
      %1400 = arith.andi %1398, %1399 : i1
      %1401 = scf.if %1400 -> (i64) {
        scf.yield %1258 : i64
      } else {
        scf.yield %1396 : i64
      }
      %1402 = func.call @cc_errorp(%1349) : (i64) -> i64
      %1403 = arith.cmpi ne, %1402, %1391 : i64
      %1404 = arith.cmpi eq, %1401, %1391 : i64
      %1405 = arith.andi %1403, %1404 : i1
      %1406 = scf.if %1405 -> (i64) {
        scf.yield %1349 : i64
      } else {
        scf.yield %1401 : i64
      }
      %1407 = func.call @cc_errorp(%1356) : (i64) -> i64
      %1408 = arith.cmpi ne, %1407, %1391 : i64
      %1409 = arith.cmpi eq, %1406, %1391 : i64
      %1410 = arith.andi %1408, %1409 : i1
      %1411 = scf.if %1410 -> (i64) {
        scf.yield %1356 : i64
      } else {
        scf.yield %1406 : i64
      }
      %1412 = func.call @cc_errorp(%1367) : (i64) -> i64
      %1413 = arith.cmpi ne, %1412, %1391 : i64
      %1414 = arith.cmpi eq, %1411, %1391 : i64
      %1415 = arith.andi %1413, %1414 : i1
      %1416 = scf.if %1415 -> (i64) {
        scf.yield %1367 : i64
      } else {
        scf.yield %1411 : i64
      }
      %1417 = func.call @cc_errorp(%1368) : (i64) -> i64
      %1418 = arith.cmpi ne, %1417, %1391 : i64
      %1419 = arith.cmpi eq, %1416, %1391 : i64
      %1420 = arith.andi %1418, %1419 : i1
      %1421 = scf.if %1420 -> (i64) {
        scf.yield %1368 : i64
      } else {
        scf.yield %1416 : i64
      }
      %1422 = func.call @cc_errorp(%1379) : (i64) -> i64
      %1423 = arith.cmpi ne, %1422, %1391 : i64
      %1424 = arith.cmpi eq, %1421, %1391 : i64
      %1425 = arith.andi %1423, %1424 : i1
      %1426 = scf.if %1425 -> (i64) {
        scf.yield %1379 : i64
      } else {
        scf.yield %1421 : i64
      }
      %1427 = func.call @cc_errorp(%1390) : (i64) -> i64
      %1428 = arith.cmpi ne, %1427, %1391 : i64
      %1429 = arith.cmpi eq, %1426, %1391 : i64
      %1430 = arith.andi %1428, %1429 : i1
      %1431 = scf.if %1430 -> (i64) {
        scf.yield %1390 : i64
      } else {
        scf.yield %1426 : i64
      }
      %1432 = arith.cmpi ne, %1431, %1391 : i64
      scf.if %1432 {
        func.call @stack_push_pointer(%1431) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1157) : (i64) -> ()
        func.call @stack_push_pointer(%1258) : (i64) -> ()
        func.call @stack_push_pointer(%1349) : (i64) -> ()
        func.call @stack_push_pointer(%1356) : (i64) -> ()
        func.call @stack_push_pointer(%1367) : (i64) -> ()
        func.call @stack_push_pointer(%1368) : (i64) -> ()
        func.call @stack_push_pointer(%1379) : (i64) -> ()
        func.call @stack_push_pointer(%1390) : (i64) -> ()
        %1433 = llvm.mlir.addressof @str125 : !llvm.ptr
        %1434 = func.call @cc_make_function_ref_const(%1433) : (!llvm.ptr) -> i64
        %1435 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1434, %1435) : (i64, i64) -> ()
      }
      %1436 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1436 : i64
    }
    %1437 = func.call @cc_nil_value() : () -> i64
    %1438 = func.call @cc_errorp(%1148) : (i64) -> i64
    %1439 = arith.cmpi ne, %1438, %1437 : i64
    %1440 = scf.if %1439 -> (i64) {
      scf.yield %1148 : i64
    } else {
      %1441 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1442 = arith.constant 8 : i64
      %1443 = func.call @cc_make_string(%1441, %1442) : (!llvm.ptr, i64) -> i64
      %1444 = func.call @cc_nil_value() : () -> i64
      %1445 = func.call @cc_intern(%1443, %1444) : (i64, i64) -> i64
      %1446 = func.call @cc_nil_value() : () -> i64
      %1447 = func.call @cc_cons(%1445, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_values_pack(%1447) : (i64) -> i64
      %1449 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1449) : (i64) -> ()
      %1450 = func.call @stack_pop_pointer() : () -> i64
      %1451 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1452 = arith.constant 12 : i64
      %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
      %1454 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1455 = arith.constant 7 : i64
      %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
      %1457 = func.call @cc_intern(%1453, %1456) : (i64, i64) -> i64
      %1458 = func.call @cc_nil_value() : () -> i64
      %1459 = func.call @cc_cons(%1457, %1458) : (i64, i64) -> i64
      %1460 = func.call @cc_values_pack(%1459) : (i64) -> i64
      func.call @stack_push_pointer(%1457) : (i64) -> ()
      %1461 = func.call @stack_pop_pointer() : () -> i64
      %1462 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1463 = arith.constant 3 : i64
      %1464 = func.call @cc_make_string(%1462, %1463) : (!llvm.ptr, i64) -> i64
      %1465 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1466 = arith.constant 11 : i64
      %1467 = func.call @cc_make_string(%1465, %1466) : (!llvm.ptr, i64) -> i64
      %1468 = func.call @cc_intern(%1464, %1467) : (i64, i64) -> i64
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = func.call @cc_cons(%1468, %1469) : (i64, i64) -> i64
      %1471 = func.call @cc_values_pack(%1470) : (i64) -> i64
      func.call @stack_push_pointer(%1468) : (i64) -> ()
      %1472 = func.call @stack_pop_pointer() : () -> i64
      %1473 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1474 = arith.constant 15 : i64
      %1475 = func.call @cc_make_string(%1473, %1474) : (!llvm.ptr, i64) -> i64
      %1476 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1477 = arith.constant 7 : i64
      %1478 = func.call @cc_make_string(%1476, %1477) : (!llvm.ptr, i64) -> i64
      %1479 = func.call @cc_intern(%1475, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_nil_value() : () -> i64
      %1481 = func.call @cc_cons(%1479, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_values_pack(%1481) : (i64) -> i64
      func.call @stack_push_pointer(%1479) : (i64) -> ()
      %1483 = func.call @stack_pop_pointer() : () -> i64
      %1484 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1484) : (i64) -> ()
      %1485 = func.call @stack_pop_pointer() : () -> i64
      %1486 = func.call @cc_nil_value() : () -> i64
      %1487 = func.call @cc_errorp(%1450) : (i64) -> i64
      %1488 = arith.cmpi ne, %1487, %1486 : i64
      %1489 = arith.cmpi eq, %1486, %1486 : i64
      %1490 = arith.andi %1488, %1489 : i1
      %1491 = scf.if %1490 -> (i64) {
        scf.yield %1450 : i64
      } else {
        scf.yield %1486 : i64
      }
      %1492 = func.call @cc_errorp(%1461) : (i64) -> i64
      %1493 = arith.cmpi ne, %1492, %1486 : i64
      %1494 = arith.cmpi eq, %1491, %1486 : i64
      %1495 = arith.andi %1493, %1494 : i1
      %1496 = scf.if %1495 -> (i64) {
        scf.yield %1461 : i64
      } else {
        scf.yield %1491 : i64
      }
      %1497 = func.call @cc_errorp(%1472) : (i64) -> i64
      %1498 = arith.cmpi ne, %1497, %1486 : i64
      %1499 = arith.cmpi eq, %1496, %1486 : i64
      %1500 = arith.andi %1498, %1499 : i1
      %1501 = scf.if %1500 -> (i64) {
        scf.yield %1472 : i64
      } else {
        scf.yield %1496 : i64
      }
      %1502 = func.call @cc_errorp(%1483) : (i64) -> i64
      %1503 = arith.cmpi ne, %1502, %1486 : i64
      %1504 = arith.cmpi eq, %1501, %1486 : i64
      %1505 = arith.andi %1503, %1504 : i1
      %1506 = scf.if %1505 -> (i64) {
        scf.yield %1483 : i64
      } else {
        scf.yield %1501 : i64
      }
      %1507 = func.call @cc_errorp(%1485) : (i64) -> i64
      %1508 = arith.cmpi ne, %1507, %1486 : i64
      %1509 = arith.cmpi eq, %1506, %1486 : i64
      %1510 = arith.andi %1508, %1509 : i1
      %1511 = scf.if %1510 -> (i64) {
        scf.yield %1485 : i64
      } else {
        scf.yield %1506 : i64
      }
      %1512 = arith.cmpi ne, %1511, %1486 : i64
      scf.if %1512 {
        func.call @stack_push_pointer(%1511) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1450) : (i64) -> ()
        func.call @stack_push_pointer(%1461) : (i64) -> ()
        func.call @stack_push_pointer(%1472) : (i64) -> ()
        func.call @stack_push_pointer(%1483) : (i64) -> ()
        func.call @stack_push_pointer(%1485) : (i64) -> ()
        %1513 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1514 = func.call @cc_make_function_ref_const(%1513) : (!llvm.ptr) -> i64
        %1515 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1514, %1515) : (i64, i64) -> ()
      }
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @cc_set_symbol_value(%1445, %1516) : (i64, i64) -> i64
      %1518 = func.call @cc_errorp(%1517) : (i64) -> i64
      %1519 = func.call @cc_nil_value() : () -> i64
      %1520 = arith.cmpi ne, %1518, %1519 : i64
      scf.if %1520 {
        func.call @stack_push_pointer(%1517) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1445) : (i64) -> ()
      }
      %1521 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1521 : i64
    }
    %1522 = func.call @cc_nil_value() : () -> i64
    %1523 = func.call @cc_errorp(%1440) : (i64) -> i64
    %1524 = arith.cmpi ne, %1523, %1522 : i64
    %1525 = scf.if %1524 -> (i64) {
      scf.yield %1440 : i64
    } else {
      %1526 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1527 = arith.constant 17 : i64
      %1528 = func.call @cc_make_string(%1526, %1527) : (!llvm.ptr, i64) -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_intern(%1528, %1529) : (i64, i64) -> i64
      %1531 = func.call @cc_nil_value() : () -> i64
      %1532 = func.call @cc_cons(%1530, %1531) : (i64, i64) -> i64
      %1533 = func.call @cc_values_pack(%1532) : (i64) -> i64
      func.call @stack_push_pointer(%1530) : (i64) -> ()
      %1534 = func.call @stack_pop_pointer() : () -> i64
      %1535 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1536 = arith.constant 8 : i64
      %1537 = func.call @cc_make_string(%1535, %1536) : (!llvm.ptr, i64) -> i64
      %1538 = func.call @cc_nil_value() : () -> i64
      %1539 = func.call @cc_intern(%1537, %1538) : (i64, i64) -> i64
      %1540 = func.call @cc_nil_value() : () -> i64
      %1541 = func.call @cc_cons(%1539, %1540) : (i64, i64) -> i64
      %1542 = func.call @cc_values_pack(%1541) : (i64) -> i64
      func.call @stack_push_pointer(%1539) : (i64) -> ()
      %1543 = func.call @stack_pop_pointer() : () -> i64
      %1559 = arith.constant 108321407238150 : i64
      %1560 = arith.constant 0 : i64
      %1561 = func.call @cc_make_closure(%1559, %1560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1561) : (i64) -> ()
      %1562 = func.call @stack_pop_pointer() : () -> i64
      %1563 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1563) : (i64) -> ()
      %1564 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1564) : (i64) -> ()
      %1565 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1565) : (i64) -> ()
      %1566 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1566) : (i64) -> ()
      %1567 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1567) : (i64) -> ()
      %1568 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1568) : (i64) -> ()
      %1569 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1569) : (i64) -> ()
      %1570 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1570) : (i64) -> ()
      %1571 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1571) : (i64) -> ()
      %1572 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1572) : (i64) -> ()
      %1573 = arith.constant 10 : i64
      %1574 = func.call @cc_box_fixnum(%1573) : (i64) -> i64
      %1575 = func.call @cc_make_vector(%1574) : (i64) -> i64
      %1576 = func.call @stack_pop_pointer() : () -> i64
      %1577 = arith.constant 9 : i64
      %1578 = func.call @cc_box_fixnum(%1577) : (i64) -> i64
      %1579 = func.call @cc_svset(%1575, %1578, %1576) : (i64, i64, i64) -> i64
      %1580 = func.call @stack_pop_pointer() : () -> i64
      %1581 = arith.constant 8 : i64
      %1582 = func.call @cc_box_fixnum(%1581) : (i64) -> i64
      %1583 = func.call @cc_svset(%1575, %1582, %1580) : (i64, i64, i64) -> i64
      %1584 = func.call @stack_pop_pointer() : () -> i64
      %1585 = arith.constant 7 : i64
      %1586 = func.call @cc_box_fixnum(%1585) : (i64) -> i64
      %1587 = func.call @cc_svset(%1575, %1586, %1584) : (i64, i64, i64) -> i64
      %1588 = func.call @stack_pop_pointer() : () -> i64
      %1589 = arith.constant 6 : i64
      %1590 = func.call @cc_box_fixnum(%1589) : (i64) -> i64
      %1591 = func.call @cc_svset(%1575, %1590, %1588) : (i64, i64, i64) -> i64
      %1592 = func.call @stack_pop_pointer() : () -> i64
      %1593 = arith.constant 5 : i64
      %1594 = func.call @cc_box_fixnum(%1593) : (i64) -> i64
      %1595 = func.call @cc_svset(%1575, %1594, %1592) : (i64, i64, i64) -> i64
      %1596 = func.call @stack_pop_pointer() : () -> i64
      %1597 = arith.constant 4 : i64
      %1598 = func.call @cc_box_fixnum(%1597) : (i64) -> i64
      %1599 = func.call @cc_svset(%1575, %1598, %1596) : (i64, i64, i64) -> i64
      %1600 = func.call @stack_pop_pointer() : () -> i64
      %1601 = arith.constant 3 : i64
      %1602 = func.call @cc_box_fixnum(%1601) : (i64) -> i64
      %1603 = func.call @cc_svset(%1575, %1602, %1600) : (i64, i64, i64) -> i64
      %1604 = func.call @stack_pop_pointer() : () -> i64
      %1605 = arith.constant 2 : i64
      %1606 = func.call @cc_box_fixnum(%1605) : (i64) -> i64
      %1607 = func.call @cc_svset(%1575, %1606, %1604) : (i64, i64, i64) -> i64
      %1608 = func.call @stack_pop_pointer() : () -> i64
      %1609 = arith.constant 1 : i64
      %1610 = func.call @cc_box_fixnum(%1609) : (i64) -> i64
      %1611 = func.call @cc_svset(%1575, %1610, %1608) : (i64, i64, i64) -> i64
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = arith.constant 0 : i64
      %1614 = func.call @cc_box_fixnum(%1613) : (i64) -> i64
      %1615 = func.call @cc_svset(%1575, %1614, %1612) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%1575) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1616 = func.call @stack_pop_pointer() : () -> i64
      %1617 = func.call @stack_pop_pointer() : () -> i64
      %1618 = func.call @cc_cons(%1617, %1616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1618) : (i64) -> ()
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1621 = arith.constant 11 : i64
      %1622 = func.call @cc_make_string(%1620, %1621) : (!llvm.ptr, i64) -> i64
      %1623 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1624 = arith.constant 7 : i64
      %1625 = func.call @cc_make_string(%1623, %1624) : (!llvm.ptr, i64) -> i64
      %1626 = func.call @cc_intern(%1622, %1625) : (i64, i64) -> i64
      %1627 = func.call @cc_nil_value() : () -> i64
      %1628 = func.call @cc_cons(%1626, %1627) : (i64, i64) -> i64
      %1629 = func.call @cc_values_pack(%1628) : (i64) -> i64
      func.call @stack_push_pointer(%1626) : (i64) -> ()
      %1630 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1631 = func.call @stack_pop_pointer() : () -> i64
      %1632 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1633 = arith.constant 4 : i64
      %1634 = func.call @cc_make_string(%1632, %1633) : (!llvm.ptr, i64) -> i64
      %1635 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1636 = arith.constant 7 : i64
      %1637 = func.call @cc_make_string(%1635, %1636) : (!llvm.ptr, i64) -> i64
      %1638 = func.call @cc_intern(%1634, %1637) : (i64, i64) -> i64
      %1639 = func.call @cc_nil_value() : () -> i64
      %1640 = func.call @cc_cons(%1638, %1639) : (i64, i64) -> i64
      %1641 = func.call @cc_values_pack(%1640) : (i64) -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1644 = arith.constant 6 : i64
      %1645 = func.call @cc_make_string(%1643, %1644) : (!llvm.ptr, i64) -> i64
      %1646 = func.call @cc_nil_value() : () -> i64
      %1647 = func.call @cc_intern(%1645, %1646) : (i64, i64) -> i64
      %1648 = func.call @cc_nil_value() : () -> i64
      %1649 = func.call @cc_cons(%1647, %1648) : (i64, i64) -> i64
      %1650 = func.call @cc_values_pack(%1649) : (i64) -> i64
      func.call @stack_push_pointer(%1647) : (i64) -> ()
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @cc_nil_value() : () -> i64
      %1653 = func.call @cc_errorp(%1534) : (i64) -> i64
      %1654 = arith.cmpi ne, %1653, %1652 : i64
      %1655 = arith.cmpi eq, %1652, %1652 : i64
      %1656 = arith.andi %1654, %1655 : i1
      %1657 = scf.if %1656 -> (i64) {
        scf.yield %1534 : i64
      } else {
        scf.yield %1652 : i64
      }
      %1658 = func.call @cc_errorp(%1543) : (i64) -> i64
      %1659 = arith.cmpi ne, %1658, %1652 : i64
      %1660 = arith.cmpi eq, %1657, %1652 : i64
      %1661 = arith.andi %1659, %1660 : i1
      %1662 = scf.if %1661 -> (i64) {
        scf.yield %1543 : i64
      } else {
        scf.yield %1657 : i64
      }
      %1663 = func.call @cc_errorp(%1562) : (i64) -> i64
      %1664 = arith.cmpi ne, %1663, %1652 : i64
      %1665 = arith.cmpi eq, %1662, %1652 : i64
      %1666 = arith.andi %1664, %1665 : i1
      %1667 = scf.if %1666 -> (i64) {
        scf.yield %1562 : i64
      } else {
        scf.yield %1662 : i64
      }
      %1668 = func.call @cc_errorp(%1619) : (i64) -> i64
      %1669 = arith.cmpi ne, %1668, %1652 : i64
      %1670 = arith.cmpi eq, %1667, %1652 : i64
      %1671 = arith.andi %1669, %1670 : i1
      %1672 = scf.if %1671 -> (i64) {
        scf.yield %1619 : i64
      } else {
        scf.yield %1667 : i64
      }
      %1673 = func.call @cc_errorp(%1630) : (i64) -> i64
      %1674 = arith.cmpi ne, %1673, %1652 : i64
      %1675 = arith.cmpi eq, %1672, %1652 : i64
      %1676 = arith.andi %1674, %1675 : i1
      %1677 = scf.if %1676 -> (i64) {
        scf.yield %1630 : i64
      } else {
        scf.yield %1672 : i64
      }
      %1678 = func.call @cc_errorp(%1631) : (i64) -> i64
      %1679 = arith.cmpi ne, %1678, %1652 : i64
      %1680 = arith.cmpi eq, %1677, %1652 : i64
      %1681 = arith.andi %1679, %1680 : i1
      %1682 = scf.if %1681 -> (i64) {
        scf.yield %1631 : i64
      } else {
        scf.yield %1677 : i64
      }
      %1683 = func.call @cc_errorp(%1642) : (i64) -> i64
      %1684 = arith.cmpi ne, %1683, %1652 : i64
      %1685 = arith.cmpi eq, %1682, %1652 : i64
      %1686 = arith.andi %1684, %1685 : i1
      %1687 = scf.if %1686 -> (i64) {
        scf.yield %1642 : i64
      } else {
        scf.yield %1682 : i64
      }
      %1688 = func.call @cc_errorp(%1651) : (i64) -> i64
      %1689 = arith.cmpi ne, %1688, %1652 : i64
      %1690 = arith.cmpi eq, %1687, %1652 : i64
      %1691 = arith.andi %1689, %1690 : i1
      %1692 = scf.if %1691 -> (i64) {
        scf.yield %1651 : i64
      } else {
        scf.yield %1687 : i64
      }
      %1693 = arith.cmpi ne, %1692, %1652 : i64
      scf.if %1693 {
        func.call @stack_push_pointer(%1692) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1534) : (i64) -> ()
        func.call @stack_push_pointer(%1543) : (i64) -> ()
        func.call @stack_push_pointer(%1562) : (i64) -> ()
        func.call @stack_push_pointer(%1619) : (i64) -> ()
        func.call @stack_push_pointer(%1630) : (i64) -> ()
        func.call @stack_push_pointer(%1631) : (i64) -> ()
        func.call @stack_push_pointer(%1642) : (i64) -> ()
        func.call @stack_push_pointer(%1651) : (i64) -> ()
        %1694 = llvm.mlir.addressof @str142 : !llvm.ptr
        %1695 = func.call @cc_make_function_ref_const(%1694) : (!llvm.ptr) -> i64
        %1696 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1695, %1696) : (i64, i64) -> ()
      }
      %1697 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1697 : i64
    }
    %1698 = func.call @cc_nil_value() : () -> i64
    %1699 = func.call @cc_errorp(%1525) : (i64) -> i64
    %1700 = arith.cmpi ne, %1699, %1698 : i64
    %1701 = scf.if %1700 -> (i64) {
      scf.yield %1525 : i64
    } else {
      %1702 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1703 = arith.constant 8 : i64
      %1704 = func.call @cc_make_string(%1702, %1703) : (!llvm.ptr, i64) -> i64
      %1705 = func.call @cc_nil_value() : () -> i64
      %1706 = func.call @cc_intern(%1704, %1705) : (i64, i64) -> i64
      %1707 = func.call @cc_nil_value() : () -> i64
      %1708 = func.call @cc_cons(%1706, %1707) : (i64, i64) -> i64
      %1709 = func.call @cc_values_pack(%1708) : (i64) -> i64
      %1710 = func.call @cc_symbol_value(%1706) : (i64) -> i64
      func.call @stack_push_pointer(%1710) : (i64) -> ()
      %1711 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1711) : (i64) -> ()
      %1712 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1712) : (i64) -> ()
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @stack_pop_pointer() : () -> i64
      %1715 = func.call @stack_pop_pointer() : () -> i64
      %1716 = func.call @cc_set_elt(%1715, %1714, %1713) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%1716) : (i64) -> ()
      %1717 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1717 : i64
    }
    %1718 = func.call @cc_nil_value() : () -> i64
    %1719 = func.call @cc_errorp(%1701) : (i64) -> i64
    %1720 = arith.cmpi ne, %1719, %1718 : i64
    %1721 = scf.if %1720 -> (i64) {
      scf.yield %1701 : i64
    } else {
      %1722 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1723 = arith.constant 4 : i64
      %1724 = func.call @cc_make_string(%1722, %1723) : (!llvm.ptr, i64) -> i64
      %1725 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1726 = arith.constant 11 : i64
      %1727 = func.call @cc_make_string(%1725, %1726) : (!llvm.ptr, i64) -> i64
      %1728 = func.call @cc_intern(%1724, %1727) : (i64, i64) -> i64
      %1729 = func.call @cc_nil_value() : () -> i64
      %1730 = func.call @cc_cons(%1728, %1729) : (i64, i64) -> i64
      %1731 = func.call @cc_values_pack(%1730) : (i64) -> i64
      func.call @stack_push_pointer(%1728) : (i64) -> ()
      %1732 = func.call @stack_pop_pointer() : () -> i64
      %1733 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1734 = arith.constant 8 : i64
      %1735 = func.call @cc_make_string(%1733, %1734) : (!llvm.ptr, i64) -> i64
      %1736 = func.call @cc_nil_value() : () -> i64
      %1737 = func.call @cc_intern(%1735, %1736) : (i64, i64) -> i64
      %1738 = func.call @cc_nil_value() : () -> i64
      %1739 = func.call @cc_cons(%1737, %1738) : (i64, i64) -> i64
      %1740 = func.call @cc_values_pack(%1739) : (i64) -> i64
      func.call @stack_push_pointer(%1737) : (i64) -> ()
      %1741 = func.call @stack_pop_pointer() : () -> i64
      %1757 = arith.constant 108321407238151 : i64
      %1758 = arith.constant 0 : i64
      %1759 = func.call @cc_make_closure(%1757, %1758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1759) : (i64) -> ()
      %1760 = func.call @stack_pop_pointer() : () -> i64
      %1761 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1761) : (i64) -> ()
      %1762 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1762) : (i64) -> ()
      %1763 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1763) : (i64) -> ()
      %1764 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1764) : (i64) -> ()
      %1765 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1765) : (i64) -> ()
      %1766 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1766) : (i64) -> ()
      %1767 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1767) : (i64) -> ()
      %1768 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1768) : (i64) -> ()
      %1769 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1769) : (i64) -> ()
      %1770 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1770) : (i64) -> ()
      %1771 = arith.constant 10 : i64
      %1772 = func.call @cc_box_fixnum(%1771) : (i64) -> i64
      %1773 = func.call @cc_make_vector(%1772) : (i64) -> i64
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = arith.constant 9 : i64
      %1776 = func.call @cc_box_fixnum(%1775) : (i64) -> i64
      %1777 = func.call @cc_svset(%1773, %1776, %1774) : (i64, i64, i64) -> i64
      %1778 = func.call @stack_pop_pointer() : () -> i64
      %1779 = arith.constant 8 : i64
      %1780 = func.call @cc_box_fixnum(%1779) : (i64) -> i64
      %1781 = func.call @cc_svset(%1773, %1780, %1778) : (i64, i64, i64) -> i64
      %1782 = func.call @stack_pop_pointer() : () -> i64
      %1783 = arith.constant 7 : i64
      %1784 = func.call @cc_box_fixnum(%1783) : (i64) -> i64
      %1785 = func.call @cc_svset(%1773, %1784, %1782) : (i64, i64, i64) -> i64
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = arith.constant 6 : i64
      %1788 = func.call @cc_box_fixnum(%1787) : (i64) -> i64
      %1789 = func.call @cc_svset(%1773, %1788, %1786) : (i64, i64, i64) -> i64
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = arith.constant 5 : i64
      %1792 = func.call @cc_box_fixnum(%1791) : (i64) -> i64
      %1793 = func.call @cc_svset(%1773, %1792, %1790) : (i64, i64, i64) -> i64
      %1794 = func.call @stack_pop_pointer() : () -> i64
      %1795 = arith.constant 4 : i64
      %1796 = func.call @cc_box_fixnum(%1795) : (i64) -> i64
      %1797 = func.call @cc_svset(%1773, %1796, %1794) : (i64, i64, i64) -> i64
      %1798 = func.call @stack_pop_pointer() : () -> i64
      %1799 = arith.constant 3 : i64
      %1800 = func.call @cc_box_fixnum(%1799) : (i64) -> i64
      %1801 = func.call @cc_svset(%1773, %1800, %1798) : (i64, i64, i64) -> i64
      %1802 = func.call @stack_pop_pointer() : () -> i64
      %1803 = arith.constant 2 : i64
      %1804 = func.call @cc_box_fixnum(%1803) : (i64) -> i64
      %1805 = func.call @cc_svset(%1773, %1804, %1802) : (i64, i64, i64) -> i64
      %1806 = func.call @stack_pop_pointer() : () -> i64
      %1807 = arith.constant 1 : i64
      %1808 = func.call @cc_box_fixnum(%1807) : (i64) -> i64
      %1809 = func.call @cc_svset(%1773, %1808, %1806) : (i64, i64, i64) -> i64
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = arith.constant 0 : i64
      %1812 = func.call @cc_box_fixnum(%1811) : (i64) -> i64
      %1813 = func.call @cc_svset(%1773, %1812, %1810) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%1773) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1814 = func.call @stack_pop_pointer() : () -> i64
      %1815 = func.call @stack_pop_pointer() : () -> i64
      %1816 = func.call @cc_cons(%1815, %1814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1816) : (i64) -> ()
      %1817 = func.call @stack_pop_pointer() : () -> i64
      %1818 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1819 = arith.constant 11 : i64
      %1820 = func.call @cc_make_string(%1818, %1819) : (!llvm.ptr, i64) -> i64
      %1821 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1822 = arith.constant 7 : i64
      %1823 = func.call @cc_make_string(%1821, %1822) : (!llvm.ptr, i64) -> i64
      %1824 = func.call @cc_intern(%1820, %1823) : (i64, i64) -> i64
      %1825 = func.call @cc_nil_value() : () -> i64
      %1826 = func.call @cc_cons(%1824, %1825) : (i64, i64) -> i64
      %1827 = func.call @cc_values_pack(%1826) : (i64) -> i64
      func.call @stack_push_pointer(%1824) : (i64) -> ()
      %1828 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1829 = func.call @stack_pop_pointer() : () -> i64
      %1830 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1831 = arith.constant 4 : i64
      %1832 = func.call @cc_make_string(%1830, %1831) : (!llvm.ptr, i64) -> i64
      %1833 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1834 = arith.constant 7 : i64
      %1835 = func.call @cc_make_string(%1833, %1834) : (!llvm.ptr, i64) -> i64
      %1836 = func.call @cc_intern(%1832, %1835) : (i64, i64) -> i64
      %1837 = func.call @cc_nil_value() : () -> i64
      %1838 = func.call @cc_cons(%1836, %1837) : (i64, i64) -> i64
      %1839 = func.call @cc_values_pack(%1838) : (i64) -> i64
      func.call @stack_push_pointer(%1836) : (i64) -> ()
      %1840 = func.call @stack_pop_pointer() : () -> i64
      %1841 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1842 = arith.constant 6 : i64
      %1843 = func.call @cc_make_string(%1841, %1842) : (!llvm.ptr, i64) -> i64
      %1844 = func.call @cc_nil_value() : () -> i64
      %1845 = func.call @cc_intern(%1843, %1844) : (i64, i64) -> i64
      %1846 = func.call @cc_nil_value() : () -> i64
      %1847 = func.call @cc_cons(%1845, %1846) : (i64, i64) -> i64
      %1848 = func.call @cc_values_pack(%1847) : (i64) -> i64
      func.call @stack_push_pointer(%1845) : (i64) -> ()
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @cc_nil_value() : () -> i64
      %1851 = func.call @cc_errorp(%1732) : (i64) -> i64
      %1852 = arith.cmpi ne, %1851, %1850 : i64
      %1853 = arith.cmpi eq, %1850, %1850 : i64
      %1854 = arith.andi %1852, %1853 : i1
      %1855 = scf.if %1854 -> (i64) {
        scf.yield %1732 : i64
      } else {
        scf.yield %1850 : i64
      }
      %1856 = func.call @cc_errorp(%1741) : (i64) -> i64
      %1857 = arith.cmpi ne, %1856, %1850 : i64
      %1858 = arith.cmpi eq, %1855, %1850 : i64
      %1859 = arith.andi %1857, %1858 : i1
      %1860 = scf.if %1859 -> (i64) {
        scf.yield %1741 : i64
      } else {
        scf.yield %1855 : i64
      }
      %1861 = func.call @cc_errorp(%1760) : (i64) -> i64
      %1862 = arith.cmpi ne, %1861, %1850 : i64
      %1863 = arith.cmpi eq, %1860, %1850 : i64
      %1864 = arith.andi %1862, %1863 : i1
      %1865 = scf.if %1864 -> (i64) {
        scf.yield %1760 : i64
      } else {
        scf.yield %1860 : i64
      }
      %1866 = func.call @cc_errorp(%1817) : (i64) -> i64
      %1867 = arith.cmpi ne, %1866, %1850 : i64
      %1868 = arith.cmpi eq, %1865, %1850 : i64
      %1869 = arith.andi %1867, %1868 : i1
      %1870 = scf.if %1869 -> (i64) {
        scf.yield %1817 : i64
      } else {
        scf.yield %1865 : i64
      }
      %1871 = func.call @cc_errorp(%1828) : (i64) -> i64
      %1872 = arith.cmpi ne, %1871, %1850 : i64
      %1873 = arith.cmpi eq, %1870, %1850 : i64
      %1874 = arith.andi %1872, %1873 : i1
      %1875 = scf.if %1874 -> (i64) {
        scf.yield %1828 : i64
      } else {
        scf.yield %1870 : i64
      }
      %1876 = func.call @cc_errorp(%1829) : (i64) -> i64
      %1877 = arith.cmpi ne, %1876, %1850 : i64
      %1878 = arith.cmpi eq, %1875, %1850 : i64
      %1879 = arith.andi %1877, %1878 : i1
      %1880 = scf.if %1879 -> (i64) {
        scf.yield %1829 : i64
      } else {
        scf.yield %1875 : i64
      }
      %1881 = func.call @cc_errorp(%1840) : (i64) -> i64
      %1882 = arith.cmpi ne, %1881, %1850 : i64
      %1883 = arith.cmpi eq, %1880, %1850 : i64
      %1884 = arith.andi %1882, %1883 : i1
      %1885 = scf.if %1884 -> (i64) {
        scf.yield %1840 : i64
      } else {
        scf.yield %1880 : i64
      }
      %1886 = func.call @cc_errorp(%1849) : (i64) -> i64
      %1887 = arith.cmpi ne, %1886, %1850 : i64
      %1888 = arith.cmpi eq, %1885, %1850 : i64
      %1889 = arith.andi %1887, %1888 : i1
      %1890 = scf.if %1889 -> (i64) {
        scf.yield %1849 : i64
      } else {
        scf.yield %1885 : i64
      }
      %1891 = arith.cmpi ne, %1890, %1850 : i64
      scf.if %1891 {
        func.call @stack_push_pointer(%1890) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1732) : (i64) -> ()
        func.call @stack_push_pointer(%1741) : (i64) -> ()
        func.call @stack_push_pointer(%1760) : (i64) -> ()
        func.call @stack_push_pointer(%1817) : (i64) -> ()
        func.call @stack_push_pointer(%1828) : (i64) -> ()
        func.call @stack_push_pointer(%1829) : (i64) -> ()
        func.call @stack_push_pointer(%1840) : (i64) -> ()
        func.call @stack_push_pointer(%1849) : (i64) -> ()
        %1892 = llvm.mlir.addressof @str153 : !llvm.ptr
        %1893 = func.call @cc_make_function_ref_const(%1892) : (!llvm.ptr) -> i64
        %1894 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1893, %1894) : (i64, i64) -> ()
      }
      %1895 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1895 : i64
    }
    %1896 = func.call @cc_nil_value() : () -> i64
    %1897 = func.call @cc_errorp(%1721) : (i64) -> i64
    %1898 = arith.cmpi ne, %1897, %1896 : i64
    %1899 = scf.if %1898 -> (i64) {
      scf.yield %1721 : i64
    } else {
      %1900 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1901 = arith.constant 4 : i64
      %1902 = func.call @cc_make_string(%1900, %1901) : (!llvm.ptr, i64) -> i64
      %1903 = func.call @cc_nil_value() : () -> i64
      %1904 = func.call @cc_intern(%1902, %1903) : (i64, i64) -> i64
      %1905 = func.call @cc_nil_value() : () -> i64
      %1906 = func.call @cc_cons(%1904, %1905) : (i64, i64) -> i64
      %1907 = func.call @cc_values_pack(%1906) : (i64) -> i64
      %1908 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1909 = arith.constant 44 : i64
      %1910 = func.call @cc_parse_bignum(%1908, %1909) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1910) : (i64) -> ()
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @cc_set_symbol_value(%1904, %1911) : (i64, i64) -> i64
      %1913 = func.call @cc_errorp(%1912) : (i64) -> i64
      %1914 = func.call @cc_nil_value() : () -> i64
      %1915 = arith.cmpi ne, %1913, %1914 : i64
      scf.if %1915 {
        func.call @stack_push_pointer(%1912) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1904) : (i64) -> ()
      }
      %1916 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1916 : i64
    }
    %1917 = func.call @cc_nil_value() : () -> i64
    %1918 = func.call @cc_errorp(%1899) : (i64) -> i64
    %1919 = arith.cmpi ne, %1918, %1917 : i64
    %1920 = scf.if %1919 -> (i64) {
      scf.yield %1899 : i64
    } else {
      %1921 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1922 = arith.constant 3 : i64
      %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
      %1924 = func.call @cc_nil_value() : () -> i64
      %1925 = func.call @cc_intern(%1923, %1924) : (i64, i64) -> i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_cons(%1925, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_values_pack(%1927) : (i64) -> i64
      %1929 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%1929) : (i64) -> ()
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1932 = arith.constant 12 : i64
      %1933 = func.call @cc_make_string(%1931, %1932) : (!llvm.ptr, i64) -> i64
      %1934 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1935 = arith.constant 7 : i64
      %1936 = func.call @cc_make_string(%1934, %1935) : (!llvm.ptr, i64) -> i64
      %1937 = func.call @cc_intern(%1933, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_nil_value() : () -> i64
      %1939 = func.call @cc_cons(%1937, %1938) : (i64, i64) -> i64
      %1940 = func.call @cc_values_pack(%1939) : (i64) -> i64
      func.call @stack_push_pointer(%1937) : (i64) -> ()
      %1941 = func.call @stack_pop_pointer() : () -> i64
      %1942 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1943 = arith.constant 9 : i64
      %1944 = func.call @cc_make_string(%1942, %1943) : (!llvm.ptr, i64) -> i64
      %1945 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1946 = arith.constant 11 : i64
      %1947 = func.call @cc_make_string(%1945, %1946) : (!llvm.ptr, i64) -> i64
      %1948 = func.call @cc_intern(%1944, %1947) : (i64, i64) -> i64
      %1949 = func.call @cc_nil_value() : () -> i64
      %1950 = func.call @cc_cons(%1948, %1949) : (i64, i64) -> i64
      %1951 = func.call @cc_values_pack(%1950) : (i64) -> i64
      func.call @stack_push_pointer(%1948) : (i64) -> ()
      %1952 = func.call @stack_pop_pointer() : () -> i64
      %1953 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1954 = arith.constant 12 : i64
      %1955 = func.call @cc_make_string(%1953, %1954) : (!llvm.ptr, i64) -> i64
      %1956 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1957 = arith.constant 7 : i64
      %1958 = func.call @cc_make_string(%1956, %1957) : (!llvm.ptr, i64) -> i64
      %1959 = func.call @cc_intern(%1955, %1958) : (i64, i64) -> i64
      %1960 = func.call @cc_nil_value() : () -> i64
      %1961 = func.call @cc_cons(%1959, %1960) : (i64, i64) -> i64
      %1962 = func.call @cc_values_pack(%1961) : (i64) -> i64
      func.call @stack_push_pointer(%1959) : (i64) -> ()
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1964) : (i64) -> ()
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %1966 = func.call @cc_nil_value() : () -> i64
      %1967 = func.call @cc_errorp(%1930) : (i64) -> i64
      %1968 = arith.cmpi ne, %1967, %1966 : i64
      %1969 = arith.cmpi eq, %1966, %1966 : i64
      %1970 = arith.andi %1968, %1969 : i1
      %1971 = scf.if %1970 -> (i64) {
        scf.yield %1930 : i64
      } else {
        scf.yield %1966 : i64
      }
      %1972 = func.call @cc_errorp(%1941) : (i64) -> i64
      %1973 = arith.cmpi ne, %1972, %1966 : i64
      %1974 = arith.cmpi eq, %1971, %1966 : i64
      %1975 = arith.andi %1973, %1974 : i1
      %1976 = scf.if %1975 -> (i64) {
        scf.yield %1941 : i64
      } else {
        scf.yield %1971 : i64
      }
      %1977 = func.call @cc_errorp(%1952) : (i64) -> i64
      %1978 = arith.cmpi ne, %1977, %1966 : i64
      %1979 = arith.cmpi eq, %1976, %1966 : i64
      %1980 = arith.andi %1978, %1979 : i1
      %1981 = scf.if %1980 -> (i64) {
        scf.yield %1952 : i64
      } else {
        scf.yield %1976 : i64
      }
      %1982 = func.call @cc_errorp(%1963) : (i64) -> i64
      %1983 = arith.cmpi ne, %1982, %1966 : i64
      %1984 = arith.cmpi eq, %1981, %1966 : i64
      %1985 = arith.andi %1983, %1984 : i1
      %1986 = scf.if %1985 -> (i64) {
        scf.yield %1963 : i64
      } else {
        scf.yield %1981 : i64
      }
      %1987 = func.call @cc_errorp(%1965) : (i64) -> i64
      %1988 = arith.cmpi ne, %1987, %1966 : i64
      %1989 = arith.cmpi eq, %1986, %1966 : i64
      %1990 = arith.andi %1988, %1989 : i1
      %1991 = scf.if %1990 -> (i64) {
        scf.yield %1965 : i64
      } else {
        scf.yield %1986 : i64
      }
      %1992 = arith.cmpi ne, %1991, %1966 : i64
      scf.if %1992 {
        func.call @stack_push_pointer(%1991) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1930) : (i64) -> ()
        func.call @stack_push_pointer(%1941) : (i64) -> ()
        func.call @stack_push_pointer(%1952) : (i64) -> ()
        func.call @stack_push_pointer(%1963) : (i64) -> ()
        func.call @stack_push_pointer(%1965) : (i64) -> ()
        %1993 = llvm.mlir.addressof @str163 : !llvm.ptr
        %1994 = func.call @cc_make_function_ref_const(%1993) : (!llvm.ptr) -> i64
        %1995 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1994, %1995) : (i64, i64) -> ()
      }
      %1996 = func.call @stack_pop_pointer() : () -> i64
      %1997 = func.call @cc_set_symbol_value(%1925, %1996) : (i64, i64) -> i64
      %1998 = func.call @cc_errorp(%1997) : (i64) -> i64
      %1999 = func.call @cc_nil_value() : () -> i64
      %2000 = arith.cmpi ne, %1998, %1999 : i64
      scf.if %2000 {
        func.call @stack_push_pointer(%1997) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1925) : (i64) -> ()
      }
      %2001 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2001 : i64
    }
    %2002 = func.call @cc_nil_value() : () -> i64
    %2003 = func.call @cc_errorp(%1920) : (i64) -> i64
    %2004 = arith.cmpi ne, %2003, %2002 : i64
    %2005 = scf.if %2004 -> (i64) {
      scf.yield %1920 : i64
    } else {
      %2006 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2007 = arith.constant 3 : i64
      %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
      %2009 = func.call @cc_nil_value() : () -> i64
      %2010 = func.call @cc_intern(%2008, %2009) : (i64, i64) -> i64
      %2011 = func.call @cc_nil_value() : () -> i64
      %2012 = func.call @cc_cons(%2010, %2011) : (i64, i64) -> i64
      %2013 = func.call @cc_values_pack(%2012) : (i64) -> i64
      %2014 = func.call @cc_symbol_value(%2010) : (i64) -> i64
      func.call @stack_push_pointer(%2014) : (i64) -> ()
      %2015 = func.call @stack_pop_pointer() : () -> i64
      %2016 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2017 = arith.constant 4 : i64
      %2018 = func.call @cc_make_string(%2016, %2017) : (!llvm.ptr, i64) -> i64
      %2019 = func.call @cc_nil_value() : () -> i64
      %2020 = func.call @cc_intern(%2018, %2019) : (i64, i64) -> i64
      %2021 = func.call @cc_nil_value() : () -> i64
      %2022 = func.call @cc_cons(%2020, %2021) : (i64, i64) -> i64
      %2023 = func.call @cc_values_pack(%2022) : (i64) -> i64
      %2024 = func.call @cc_symbol_value(%2020) : (i64) -> i64
      func.call @stack_push_pointer(%2024) : (i64) -> ()
      %2025 = func.call @stack_pop_pointer() : () -> i64
      %2026 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2026) : (i64) -> ()
      %2027 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2028 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @cc_nil_value() : () -> i64
      %2031 = func.call @cc_errorp(%2015) : (i64) -> i64
      %2032 = arith.cmpi ne, %2031, %2030 : i64
      %2033 = arith.cmpi eq, %2030, %2030 : i64
      %2034 = arith.andi %2032, %2033 : i1
      %2035 = scf.if %2034 -> (i64) {
        scf.yield %2015 : i64
      } else {
        scf.yield %2030 : i64
      }
      %2036 = func.call @cc_errorp(%2025) : (i64) -> i64
      %2037 = arith.cmpi ne, %2036, %2030 : i64
      %2038 = arith.cmpi eq, %2035, %2030 : i64
      %2039 = arith.andi %2037, %2038 : i1
      %2040 = scf.if %2039 -> (i64) {
        scf.yield %2025 : i64
      } else {
        scf.yield %2035 : i64
      }
      %2041 = func.call @cc_errorp(%2027) : (i64) -> i64
      %2042 = arith.cmpi ne, %2041, %2030 : i64
      %2043 = arith.cmpi eq, %2040, %2030 : i64
      %2044 = arith.andi %2042, %2043 : i1
      %2045 = scf.if %2044 -> (i64) {
        scf.yield %2027 : i64
      } else {
        scf.yield %2040 : i64
      }
      %2046 = func.call @cc_errorp(%2028) : (i64) -> i64
      %2047 = arith.cmpi ne, %2046, %2030 : i64
      %2048 = arith.cmpi eq, %2045, %2030 : i64
      %2049 = arith.andi %2047, %2048 : i1
      %2050 = scf.if %2049 -> (i64) {
        scf.yield %2028 : i64
      } else {
        scf.yield %2045 : i64
      }
      %2051 = func.call @cc_errorp(%2029) : (i64) -> i64
      %2052 = arith.cmpi ne, %2051, %2030 : i64
      %2053 = arith.cmpi eq, %2050, %2030 : i64
      %2054 = arith.andi %2052, %2053 : i1
      %2055 = scf.if %2054 -> (i64) {
        scf.yield %2029 : i64
      } else {
        scf.yield %2050 : i64
      }
      %2056 = arith.cmpi ne, %2055, %2030 : i64
      scf.if %2056 {
        func.call @stack_push_pointer(%2055) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2015) : (i64) -> ()
        func.call @stack_push_pointer(%2025) : (i64) -> ()
        func.call @stack_push_pointer(%2027) : (i64) -> ()
        func.call @stack_push_pointer(%2028) : (i64) -> ()
        func.call @stack_push_pointer(%2029) : (i64) -> ()
        %2057 = llvm.mlir.addressof @str166 : !llvm.ptr
        %2058 = func.call @cc_make_function_ref_const(%2057) : (!llvm.ptr) -> i64
        %2059 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2058, %2059) : (i64, i64) -> ()
      }
      %2060 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2060 : i64
    }
    %2061 = func.call @cc_nil_value() : () -> i64
    %2062 = func.call @cc_errorp(%2005) : (i64) -> i64
    %2063 = arith.cmpi ne, %2062, %2061 : i64
    %2064 = scf.if %2063 -> (i64) {
      scf.yield %2005 : i64
    } else {
      %2065 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2066 = arith.constant 26 : i64
      %2067 = func.call @cc_make_string(%2065, %2066) : (!llvm.ptr, i64) -> i64
      %2068 = func.call @cc_nil_value() : () -> i64
      %2069 = func.call @cc_intern(%2067, %2068) : (i64, i64) -> i64
      %2070 = func.call @cc_nil_value() : () -> i64
      %2071 = func.call @cc_cons(%2069, %2070) : (i64, i64) -> i64
      %2072 = func.call @cc_values_pack(%2071) : (i64) -> i64
      func.call @stack_push_pointer(%2069) : (i64) -> ()
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2075 = arith.constant 3 : i64
      %2076 = func.call @cc_make_string(%2074, %2075) : (!llvm.ptr, i64) -> i64
      %2077 = func.call @cc_nil_value() : () -> i64
      %2078 = func.call @cc_intern(%2076, %2077) : (i64, i64) -> i64
      %2079 = func.call @cc_nil_value() : () -> i64
      %2080 = func.call @cc_cons(%2078, %2079) : (i64, i64) -> i64
      %2081 = func.call @cc_values_pack(%2080) : (i64) -> i64
      func.call @stack_push_pointer(%2078) : (i64) -> ()
      %2082 = func.call @stack_pop_pointer() : () -> i64
      %2098 = arith.constant 108321407238152 : i64
      %2099 = arith.constant 0 : i64
      %2100 = func.call @cc_make_closure(%2098, %2099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2100) : (i64) -> ()
      %2101 = func.call @stack_pop_pointer() : () -> i64
      %2102 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2103 = arith.constant 44 : i64
      %2104 = func.call @cc_make_string(%2102, %2103) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2105 = func.call @stack_pop_pointer() : () -> i64
      %2106 = func.call @stack_pop_pointer() : () -> i64
      %2107 = func.call @cc_cons(%2106, %2105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2107) : (i64) -> ()
      %2108 = func.call @stack_pop_pointer() : () -> i64
      %2109 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2110 = arith.constant 11 : i64
      %2111 = func.call @cc_make_string(%2109, %2110) : (!llvm.ptr, i64) -> i64
      %2112 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2113 = arith.constant 7 : i64
      %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
      %2115 = func.call @cc_intern(%2111, %2114) : (i64, i64) -> i64
      %2116 = func.call @cc_nil_value() : () -> i64
      %2117 = func.call @cc_cons(%2115, %2116) : (i64, i64) -> i64
      %2118 = func.call @cc_values_pack(%2117) : (i64) -> i64
      func.call @stack_push_pointer(%2115) : (i64) -> ()
      %2119 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2120 = func.call @stack_pop_pointer() : () -> i64
      %2121 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2122 = arith.constant 4 : i64
      %2123 = func.call @cc_make_string(%2121, %2122) : (!llvm.ptr, i64) -> i64
      %2124 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2125 = arith.constant 7 : i64
      %2126 = func.call @cc_make_string(%2124, %2125) : (!llvm.ptr, i64) -> i64
      %2127 = func.call @cc_intern(%2123, %2126) : (i64, i64) -> i64
      %2128 = func.call @cc_nil_value() : () -> i64
      %2129 = func.call @cc_cons(%2127, %2128) : (i64, i64) -> i64
      %2130 = func.call @cc_values_pack(%2129) : (i64) -> i64
      func.call @stack_push_pointer(%2127) : (i64) -> ()
      %2131 = func.call @stack_pop_pointer() : () -> i64
      %2132 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2133 = arith.constant 7 : i64
      %2134 = func.call @cc_make_string(%2132, %2133) : (!llvm.ptr, i64) -> i64
      %2135 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2136 = arith.constant 11 : i64
      %2137 = func.call @cc_make_string(%2135, %2136) : (!llvm.ptr, i64) -> i64
      %2138 = func.call @cc_intern(%2134, %2137) : (i64, i64) -> i64
      %2139 = func.call @cc_nil_value() : () -> i64
      %2140 = func.call @cc_cons(%2138, %2139) : (i64, i64) -> i64
      %2141 = func.call @cc_values_pack(%2140) : (i64) -> i64
      func.call @stack_push_pointer(%2138) : (i64) -> ()
      %2142 = func.call @stack_pop_pointer() : () -> i64
      %2143 = func.call @cc_nil_value() : () -> i64
      %2144 = func.call @cc_errorp(%2073) : (i64) -> i64
      %2145 = arith.cmpi ne, %2144, %2143 : i64
      %2146 = arith.cmpi eq, %2143, %2143 : i64
      %2147 = arith.andi %2145, %2146 : i1
      %2148 = scf.if %2147 -> (i64) {
        scf.yield %2073 : i64
      } else {
        scf.yield %2143 : i64
      }
      %2149 = func.call @cc_errorp(%2082) : (i64) -> i64
      %2150 = arith.cmpi ne, %2149, %2143 : i64
      %2151 = arith.cmpi eq, %2148, %2143 : i64
      %2152 = arith.andi %2150, %2151 : i1
      %2153 = scf.if %2152 -> (i64) {
        scf.yield %2082 : i64
      } else {
        scf.yield %2148 : i64
      }
      %2154 = func.call @cc_errorp(%2101) : (i64) -> i64
      %2155 = arith.cmpi ne, %2154, %2143 : i64
      %2156 = arith.cmpi eq, %2153, %2143 : i64
      %2157 = arith.andi %2155, %2156 : i1
      %2158 = scf.if %2157 -> (i64) {
        scf.yield %2101 : i64
      } else {
        scf.yield %2153 : i64
      }
      %2159 = func.call @cc_errorp(%2108) : (i64) -> i64
      %2160 = arith.cmpi ne, %2159, %2143 : i64
      %2161 = arith.cmpi eq, %2158, %2143 : i64
      %2162 = arith.andi %2160, %2161 : i1
      %2163 = scf.if %2162 -> (i64) {
        scf.yield %2108 : i64
      } else {
        scf.yield %2158 : i64
      }
      %2164 = func.call @cc_errorp(%2119) : (i64) -> i64
      %2165 = arith.cmpi ne, %2164, %2143 : i64
      %2166 = arith.cmpi eq, %2163, %2143 : i64
      %2167 = arith.andi %2165, %2166 : i1
      %2168 = scf.if %2167 -> (i64) {
        scf.yield %2119 : i64
      } else {
        scf.yield %2163 : i64
      }
      %2169 = func.call @cc_errorp(%2120) : (i64) -> i64
      %2170 = arith.cmpi ne, %2169, %2143 : i64
      %2171 = arith.cmpi eq, %2168, %2143 : i64
      %2172 = arith.andi %2170, %2171 : i1
      %2173 = scf.if %2172 -> (i64) {
        scf.yield %2120 : i64
      } else {
        scf.yield %2168 : i64
      }
      %2174 = func.call @cc_errorp(%2131) : (i64) -> i64
      %2175 = arith.cmpi ne, %2174, %2143 : i64
      %2176 = arith.cmpi eq, %2173, %2143 : i64
      %2177 = arith.andi %2175, %2176 : i1
      %2178 = scf.if %2177 -> (i64) {
        scf.yield %2131 : i64
      } else {
        scf.yield %2173 : i64
      }
      %2179 = func.call @cc_errorp(%2142) : (i64) -> i64
      %2180 = arith.cmpi ne, %2179, %2143 : i64
      %2181 = arith.cmpi eq, %2178, %2143 : i64
      %2182 = arith.andi %2180, %2181 : i1
      %2183 = scf.if %2182 -> (i64) {
        scf.yield %2142 : i64
      } else {
        scf.yield %2178 : i64
      }
      %2184 = arith.cmpi ne, %2183, %2143 : i64
      scf.if %2184 {
        func.call @stack_push_pointer(%2183) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2073) : (i64) -> ()
        func.call @stack_push_pointer(%2082) : (i64) -> ()
        func.call @stack_push_pointer(%2101) : (i64) -> ()
        func.call @stack_push_pointer(%2108) : (i64) -> ()
        func.call @stack_push_pointer(%2119) : (i64) -> ()
        func.call @stack_push_pointer(%2120) : (i64) -> ()
        func.call @stack_push_pointer(%2131) : (i64) -> ()
        func.call @stack_push_pointer(%2142) : (i64) -> ()
        %2185 = llvm.mlir.addressof @str177 : !llvm.ptr
        %2186 = func.call @cc_make_function_ref_const(%2185) : (!llvm.ptr) -> i64
        %2187 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2186, %2187) : (i64, i64) -> ()
      }
      %2188 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2188 : i64
    }
    %2189 = func.call @cc_nil_value() : () -> i64
    %2190 = func.call @cc_errorp(%2064) : (i64) -> i64
    %2191 = arith.cmpi ne, %2190, %2189 : i64
    %2192 = scf.if %2191 -> (i64) {
      scf.yield %2064 : i64
    } else {
      %2193 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2194 = arith.constant 3 : i64
      %2195 = func.call @cc_make_string(%2193, %2194) : (!llvm.ptr, i64) -> i64
      %2196 = func.call @cc_nil_value() : () -> i64
      %2197 = func.call @cc_intern(%2195, %2196) : (i64, i64) -> i64
      %2198 = func.call @cc_nil_value() : () -> i64
      %2199 = func.call @cc_cons(%2197, %2198) : (i64, i64) -> i64
      %2200 = func.call @cc_values_pack(%2199) : (i64) -> i64
      %2201 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%2201) : (i64) -> ()
      %2202 = func.call @stack_pop_pointer() : () -> i64
      %2203 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2204 = arith.constant 12 : i64
      %2205 = func.call @cc_make_string(%2203, %2204) : (!llvm.ptr, i64) -> i64
      %2206 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2207 = arith.constant 7 : i64
      %2208 = func.call @cc_make_string(%2206, %2207) : (!llvm.ptr, i64) -> i64
      %2209 = func.call @cc_intern(%2205, %2208) : (i64, i64) -> i64
      %2210 = func.call @cc_nil_value() : () -> i64
      %2211 = func.call @cc_cons(%2209, %2210) : (i64, i64) -> i64
      %2212 = func.call @cc_values_pack(%2211) : (i64) -> i64
      func.call @stack_push_pointer(%2209) : (i64) -> ()
      %2213 = func.call @stack_pop_pointer() : () -> i64
      %2214 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2215 = arith.constant 9 : i64
      %2216 = func.call @cc_make_string(%2214, %2215) : (!llvm.ptr, i64) -> i64
      %2217 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2218 = arith.constant 11 : i64
      %2219 = func.call @cc_make_string(%2217, %2218) : (!llvm.ptr, i64) -> i64
      %2220 = func.call @cc_intern(%2216, %2219) : (i64, i64) -> i64
      %2221 = func.call @cc_nil_value() : () -> i64
      %2222 = func.call @cc_cons(%2220, %2221) : (i64, i64) -> i64
      %2223 = func.call @cc_values_pack(%2222) : (i64) -> i64
      func.call @stack_push_pointer(%2220) : (i64) -> ()
      %2224 = func.call @stack_pop_pointer() : () -> i64
      %2225 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2226 = arith.constant 12 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2229 = arith.constant 7 : i64
      %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
      %2231 = func.call @cc_intern(%2227, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = func.call @cc_cons(%2231, %2232) : (i64, i64) -> i64
      %2234 = func.call @cc_values_pack(%2233) : (i64) -> i64
      func.call @stack_push_pointer(%2231) : (i64) -> ()
      %2235 = func.call @stack_pop_pointer() : () -> i64
      %2236 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2236) : (i64) -> ()
      %2237 = func.call @stack_pop_pointer() : () -> i64
      %2238 = func.call @cc_nil_value() : () -> i64
      %2239 = func.call @cc_errorp(%2202) : (i64) -> i64
      %2240 = arith.cmpi ne, %2239, %2238 : i64
      %2241 = arith.cmpi eq, %2238, %2238 : i64
      %2242 = arith.andi %2240, %2241 : i1
      %2243 = scf.if %2242 -> (i64) {
        scf.yield %2202 : i64
      } else {
        scf.yield %2238 : i64
      }
      %2244 = func.call @cc_errorp(%2213) : (i64) -> i64
      %2245 = arith.cmpi ne, %2244, %2238 : i64
      %2246 = arith.cmpi eq, %2243, %2238 : i64
      %2247 = arith.andi %2245, %2246 : i1
      %2248 = scf.if %2247 -> (i64) {
        scf.yield %2213 : i64
      } else {
        scf.yield %2243 : i64
      }
      %2249 = func.call @cc_errorp(%2224) : (i64) -> i64
      %2250 = arith.cmpi ne, %2249, %2238 : i64
      %2251 = arith.cmpi eq, %2248, %2238 : i64
      %2252 = arith.andi %2250, %2251 : i1
      %2253 = scf.if %2252 -> (i64) {
        scf.yield %2224 : i64
      } else {
        scf.yield %2248 : i64
      }
      %2254 = func.call @cc_errorp(%2235) : (i64) -> i64
      %2255 = arith.cmpi ne, %2254, %2238 : i64
      %2256 = arith.cmpi eq, %2253, %2238 : i64
      %2257 = arith.andi %2255, %2256 : i1
      %2258 = scf.if %2257 -> (i64) {
        scf.yield %2235 : i64
      } else {
        scf.yield %2253 : i64
      }
      %2259 = func.call @cc_errorp(%2237) : (i64) -> i64
      %2260 = arith.cmpi ne, %2259, %2238 : i64
      %2261 = arith.cmpi eq, %2258, %2238 : i64
      %2262 = arith.andi %2260, %2261 : i1
      %2263 = scf.if %2262 -> (i64) {
        scf.yield %2237 : i64
      } else {
        scf.yield %2258 : i64
      }
      %2264 = arith.cmpi ne, %2263, %2238 : i64
      scf.if %2264 {
        func.call @stack_push_pointer(%2263) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2202) : (i64) -> ()
        func.call @stack_push_pointer(%2213) : (i64) -> ()
        func.call @stack_push_pointer(%2224) : (i64) -> ()
        func.call @stack_push_pointer(%2235) : (i64) -> ()
        func.call @stack_push_pointer(%2237) : (i64) -> ()
        %2265 = llvm.mlir.addressof @str185 : !llvm.ptr
        %2266 = func.call @cc_make_function_ref_const(%2265) : (!llvm.ptr) -> i64
        %2267 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2266, %2267) : (i64, i64) -> ()
      }
      %2268 = func.call @stack_pop_pointer() : () -> i64
      %2269 = func.call @cc_set_symbol_value(%2197, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_errorp(%2269) : (i64) -> i64
      %2271 = func.call @cc_nil_value() : () -> i64
      %2272 = arith.cmpi ne, %2270, %2271 : i64
      scf.if %2272 {
        func.call @stack_push_pointer(%2269) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2197) : (i64) -> ()
      }
      %2273 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2273 : i64
    }
    %2274 = func.call @cc_nil_value() : () -> i64
    %2275 = func.call @cc_errorp(%2192) : (i64) -> i64
    %2276 = arith.cmpi ne, %2275, %2274 : i64
    %2277 = scf.if %2276 -> (i64) {
      scf.yield %2192 : i64
    } else {
      %2278 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2279 = arith.constant 3 : i64
      %2280 = func.call @cc_make_string(%2278, %2279) : (!llvm.ptr, i64) -> i64
      %2281 = func.call @cc_nil_value() : () -> i64
      %2282 = func.call @cc_intern(%2280, %2281) : (i64, i64) -> i64
      %2283 = func.call @cc_nil_value() : () -> i64
      %2284 = func.call @cc_cons(%2282, %2283) : (i64, i64) -> i64
      %2285 = func.call @cc_values_pack(%2284) : (i64) -> i64
      %2286 = func.call @cc_symbol_value(%2282) : (i64) -> i64
      func.call @stack_push_pointer(%2286) : (i64) -> ()
      %2287 = func.call @stack_pop_pointer() : () -> i64
      %2288 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2289 = arith.constant 4 : i64
      %2290 = func.call @cc_make_string(%2288, %2289) : (!llvm.ptr, i64) -> i64
      %2291 = func.call @cc_nil_value() : () -> i64
      %2292 = func.call @cc_intern(%2290, %2291) : (i64, i64) -> i64
      %2293 = func.call @cc_nil_value() : () -> i64
      %2294 = func.call @cc_cons(%2292, %2293) : (i64, i64) -> i64
      %2295 = func.call @cc_values_pack(%2294) : (i64) -> i64
      %2296 = func.call @cc_symbol_value(%2292) : (i64) -> i64
      func.call @stack_push_pointer(%2296) : (i64) -> ()
      %2297 = func.call @stack_pop_pointer() : () -> i64
      %2298 = arith.constant 0 : i64
      %2299 = func.call @cc_box_fixnum(%2298) : (i64) -> i64
      %2301 = arith.constant 3 : i64
      %2300 = arith.andi %2299, %2301 : i64
      %2302 = arith.constant 0 : i64
      %2303 = arith.cmpi eq, %2300, %2302 : i64
      %2305 = arith.constant 3 : i64
      %2304 = arith.andi %2297, %2305 : i64
      %2306 = arith.constant 0 : i64
      %2307 = arith.cmpi eq, %2304, %2306 : i64
      %2308 = arith.andi %2303, %2307 : i1
      %2309 = scf.if %2308 -> (i64) {
        %2310 = arith.constant 2 : i64
        %2311 = arith.shrsi %2299, %2310 : i64
        %2312 = arith.constant 2 : i64
        %2313 = arith.shrsi %2297, %2312 : i64
        %2314 = arith.subi %2311, %2313 : i64
        %2315 = arith.constant -2305843009213693952 : i64
        %2316 = arith.constant 2305843009213693951 : i64
        %2317 = arith.cmpi sge, %2314, %2315 : i64
        %2318 = arith.cmpi sle, %2314, %2316 : i64
        %2319 = arith.andi %2317, %2318 : i1
        %2320 = scf.if %2319 -> (i64) {
          %2321 = arith.constant 2 : i64
          %2322 = arith.shli %2314, %2321 : i64
          scf.yield %2322 : i64
        } else {
          %2323 = func.call @cc_sub(%2299, %2297) : (i64, i64) -> i64
          scf.yield %2323 : i64
        }
        scf.yield %2320 : i64
      } else {
        %2324 = func.call @cc_sub(%2299, %2297) : (i64, i64) -> i64
        scf.yield %2324 : i64
      }
      func.call @stack_push_pointer(%2309) : (i64) -> ()
      %2325 = func.call @stack_pop_pointer() : () -> i64
      %2326 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2326) : (i64) -> ()
      %2327 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2328 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2329 = func.call @stack_pop_pointer() : () -> i64
      %2330 = func.call @cc_nil_value() : () -> i64
      %2331 = func.call @cc_errorp(%2287) : (i64) -> i64
      %2332 = arith.cmpi ne, %2331, %2330 : i64
      %2333 = arith.cmpi eq, %2330, %2330 : i64
      %2334 = arith.andi %2332, %2333 : i1
      %2335 = scf.if %2334 -> (i64) {
        scf.yield %2287 : i64
      } else {
        scf.yield %2330 : i64
      }
      %2336 = func.call @cc_errorp(%2325) : (i64) -> i64
      %2337 = arith.cmpi ne, %2336, %2330 : i64
      %2338 = arith.cmpi eq, %2335, %2330 : i64
      %2339 = arith.andi %2337, %2338 : i1
      %2340 = scf.if %2339 -> (i64) {
        scf.yield %2325 : i64
      } else {
        scf.yield %2335 : i64
      }
      %2341 = func.call @cc_errorp(%2327) : (i64) -> i64
      %2342 = arith.cmpi ne, %2341, %2330 : i64
      %2343 = arith.cmpi eq, %2340, %2330 : i64
      %2344 = arith.andi %2342, %2343 : i1
      %2345 = scf.if %2344 -> (i64) {
        scf.yield %2327 : i64
      } else {
        scf.yield %2340 : i64
      }
      %2346 = func.call @cc_errorp(%2328) : (i64) -> i64
      %2347 = arith.cmpi ne, %2346, %2330 : i64
      %2348 = arith.cmpi eq, %2345, %2330 : i64
      %2349 = arith.andi %2347, %2348 : i1
      %2350 = scf.if %2349 -> (i64) {
        scf.yield %2328 : i64
      } else {
        scf.yield %2345 : i64
      }
      %2351 = func.call @cc_errorp(%2329) : (i64) -> i64
      %2352 = arith.cmpi ne, %2351, %2330 : i64
      %2353 = arith.cmpi eq, %2350, %2330 : i64
      %2354 = arith.andi %2352, %2353 : i1
      %2355 = scf.if %2354 -> (i64) {
        scf.yield %2329 : i64
      } else {
        scf.yield %2350 : i64
      }
      %2356 = arith.cmpi ne, %2355, %2330 : i64
      scf.if %2356 {
        func.call @stack_push_pointer(%2355) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2287) : (i64) -> ()
        func.call @stack_push_pointer(%2325) : (i64) -> ()
        func.call @stack_push_pointer(%2327) : (i64) -> ()
        func.call @stack_push_pointer(%2328) : (i64) -> ()
        func.call @stack_push_pointer(%2329) : (i64) -> ()
        %2357 = llvm.mlir.addressof @str188 : !llvm.ptr
        %2358 = func.call @cc_make_function_ref_const(%2357) : (!llvm.ptr) -> i64
        %2359 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2358, %2359) : (i64, i64) -> ()
      }
      %2360 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2360 : i64
    }
    %2361 = func.call @cc_nil_value() : () -> i64
    %2362 = func.call @cc_errorp(%2277) : (i64) -> i64
    %2363 = arith.cmpi ne, %2362, %2361 : i64
    %2364 = scf.if %2363 -> (i64) {
      scf.yield %2277 : i64
    } else {
      %2365 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2366 = arith.constant 26 : i64
      %2367 = func.call @cc_make_string(%2365, %2366) : (!llvm.ptr, i64) -> i64
      %2368 = func.call @cc_nil_value() : () -> i64
      %2369 = func.call @cc_intern(%2367, %2368) : (i64, i64) -> i64
      %2370 = func.call @cc_nil_value() : () -> i64
      %2371 = func.call @cc_cons(%2369, %2370) : (i64, i64) -> i64
      %2372 = func.call @cc_values_pack(%2371) : (i64) -> i64
      func.call @stack_push_pointer(%2369) : (i64) -> ()
      %2373 = func.call @stack_pop_pointer() : () -> i64
      %2374 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2375 = arith.constant 3 : i64
      %2376 = func.call @cc_make_string(%2374, %2375) : (!llvm.ptr, i64) -> i64
      %2377 = func.call @cc_nil_value() : () -> i64
      %2378 = func.call @cc_intern(%2376, %2377) : (i64, i64) -> i64
      %2379 = func.call @cc_nil_value() : () -> i64
      %2380 = func.call @cc_cons(%2378, %2379) : (i64, i64) -> i64
      %2381 = func.call @cc_values_pack(%2380) : (i64) -> i64
      func.call @stack_push_pointer(%2378) : (i64) -> ()
      %2382 = func.call @stack_pop_pointer() : () -> i64
      %2398 = arith.constant 108321407238153 : i64
      %2399 = arith.constant 0 : i64
      %2400 = func.call @cc_make_closure(%2398, %2399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2400) : (i64) -> ()
      %2401 = func.call @stack_pop_pointer() : () -> i64
      %2402 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2403 = arith.constant 45 : i64
      %2404 = func.call @cc_make_string(%2402, %2403) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2404) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2405 = func.call @stack_pop_pointer() : () -> i64
      %2406 = func.call @stack_pop_pointer() : () -> i64
      %2407 = func.call @cc_cons(%2406, %2405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2407) : (i64) -> ()
      %2408 = func.call @stack_pop_pointer() : () -> i64
      %2409 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2410 = arith.constant 11 : i64
      %2411 = func.call @cc_make_string(%2409, %2410) : (!llvm.ptr, i64) -> i64
      %2412 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2413 = arith.constant 7 : i64
      %2414 = func.call @cc_make_string(%2412, %2413) : (!llvm.ptr, i64) -> i64
      %2415 = func.call @cc_intern(%2411, %2414) : (i64, i64) -> i64
      %2416 = func.call @cc_nil_value() : () -> i64
      %2417 = func.call @cc_cons(%2415, %2416) : (i64, i64) -> i64
      %2418 = func.call @cc_values_pack(%2417) : (i64) -> i64
      func.call @stack_push_pointer(%2415) : (i64) -> ()
      %2419 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2420 = func.call @stack_pop_pointer() : () -> i64
      %2421 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2422 = arith.constant 4 : i64
      %2423 = func.call @cc_make_string(%2421, %2422) : (!llvm.ptr, i64) -> i64
      %2424 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2425 = arith.constant 7 : i64
      %2426 = func.call @cc_make_string(%2424, %2425) : (!llvm.ptr, i64) -> i64
      %2427 = func.call @cc_intern(%2423, %2426) : (i64, i64) -> i64
      %2428 = func.call @cc_nil_value() : () -> i64
      %2429 = func.call @cc_cons(%2427, %2428) : (i64, i64) -> i64
      %2430 = func.call @cc_values_pack(%2429) : (i64) -> i64
      func.call @stack_push_pointer(%2427) : (i64) -> ()
      %2431 = func.call @stack_pop_pointer() : () -> i64
      %2432 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2433 = arith.constant 7 : i64
      %2434 = func.call @cc_make_string(%2432, %2433) : (!llvm.ptr, i64) -> i64
      %2435 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2436 = arith.constant 11 : i64
      %2437 = func.call @cc_make_string(%2435, %2436) : (!llvm.ptr, i64) -> i64
      %2438 = func.call @cc_intern(%2434, %2437) : (i64, i64) -> i64
      %2439 = func.call @cc_nil_value() : () -> i64
      %2440 = func.call @cc_cons(%2438, %2439) : (i64, i64) -> i64
      %2441 = func.call @cc_values_pack(%2440) : (i64) -> i64
      func.call @stack_push_pointer(%2438) : (i64) -> ()
      %2442 = func.call @stack_pop_pointer() : () -> i64
      %2443 = func.call @cc_nil_value() : () -> i64
      %2444 = func.call @cc_errorp(%2373) : (i64) -> i64
      %2445 = arith.cmpi ne, %2444, %2443 : i64
      %2446 = arith.cmpi eq, %2443, %2443 : i64
      %2447 = arith.andi %2445, %2446 : i1
      %2448 = scf.if %2447 -> (i64) {
        scf.yield %2373 : i64
      } else {
        scf.yield %2443 : i64
      }
      %2449 = func.call @cc_errorp(%2382) : (i64) -> i64
      %2450 = arith.cmpi ne, %2449, %2443 : i64
      %2451 = arith.cmpi eq, %2448, %2443 : i64
      %2452 = arith.andi %2450, %2451 : i1
      %2453 = scf.if %2452 -> (i64) {
        scf.yield %2382 : i64
      } else {
        scf.yield %2448 : i64
      }
      %2454 = func.call @cc_errorp(%2401) : (i64) -> i64
      %2455 = arith.cmpi ne, %2454, %2443 : i64
      %2456 = arith.cmpi eq, %2453, %2443 : i64
      %2457 = arith.andi %2455, %2456 : i1
      %2458 = scf.if %2457 -> (i64) {
        scf.yield %2401 : i64
      } else {
        scf.yield %2453 : i64
      }
      %2459 = func.call @cc_errorp(%2408) : (i64) -> i64
      %2460 = arith.cmpi ne, %2459, %2443 : i64
      %2461 = arith.cmpi eq, %2458, %2443 : i64
      %2462 = arith.andi %2460, %2461 : i1
      %2463 = scf.if %2462 -> (i64) {
        scf.yield %2408 : i64
      } else {
        scf.yield %2458 : i64
      }
      %2464 = func.call @cc_errorp(%2419) : (i64) -> i64
      %2465 = arith.cmpi ne, %2464, %2443 : i64
      %2466 = arith.cmpi eq, %2463, %2443 : i64
      %2467 = arith.andi %2465, %2466 : i1
      %2468 = scf.if %2467 -> (i64) {
        scf.yield %2419 : i64
      } else {
        scf.yield %2463 : i64
      }
      %2469 = func.call @cc_errorp(%2420) : (i64) -> i64
      %2470 = arith.cmpi ne, %2469, %2443 : i64
      %2471 = arith.cmpi eq, %2468, %2443 : i64
      %2472 = arith.andi %2470, %2471 : i1
      %2473 = scf.if %2472 -> (i64) {
        scf.yield %2420 : i64
      } else {
        scf.yield %2468 : i64
      }
      %2474 = func.call @cc_errorp(%2431) : (i64) -> i64
      %2475 = arith.cmpi ne, %2474, %2443 : i64
      %2476 = arith.cmpi eq, %2473, %2443 : i64
      %2477 = arith.andi %2475, %2476 : i1
      %2478 = scf.if %2477 -> (i64) {
        scf.yield %2431 : i64
      } else {
        scf.yield %2473 : i64
      }
      %2479 = func.call @cc_errorp(%2442) : (i64) -> i64
      %2480 = arith.cmpi ne, %2479, %2443 : i64
      %2481 = arith.cmpi eq, %2478, %2443 : i64
      %2482 = arith.andi %2480, %2481 : i1
      %2483 = scf.if %2482 -> (i64) {
        scf.yield %2442 : i64
      } else {
        scf.yield %2478 : i64
      }
      %2484 = arith.cmpi ne, %2483, %2443 : i64
      scf.if %2484 {
        func.call @stack_push_pointer(%2483) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2373) : (i64) -> ()
        func.call @stack_push_pointer(%2382) : (i64) -> ()
        func.call @stack_push_pointer(%2401) : (i64) -> ()
        func.call @stack_push_pointer(%2408) : (i64) -> ()
        func.call @stack_push_pointer(%2419) : (i64) -> ()
        func.call @stack_push_pointer(%2420) : (i64) -> ()
        func.call @stack_push_pointer(%2431) : (i64) -> ()
        func.call @stack_push_pointer(%2442) : (i64) -> ()
        %2485 = llvm.mlir.addressof @str199 : !llvm.ptr
        %2486 = func.call @cc_make_function_ref_const(%2485) : (!llvm.ptr) -> i64
        %2487 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2486, %2487) : (i64, i64) -> ()
      }
      %2488 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2488 : i64
    }
    func.call @stack_push_pointer(%2364) : (i64) -> ()
    %2489 = func.call @stack_pop_pointer() : () -> i64
    %2490 = func.call @cc_multiple_value_list(%2489) : (i64) -> i64
    %2491 = llvm.mlir.addressof @str200 : !llvm.ptr
    %2492 = arith.constant 38 : i64
    %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
    %2494 = func.call @cc_nil_value() : () -> i64
    %2495 = func.call @cc_intern(%2493, %2494) : (i64, i64) -> i64
    %2496 = func.call @cc_nil_value() : () -> i64
    %2497 = func.call @cc_cons(%2495, %2496) : (i64, i64) -> i64
    %2498 = func.call @cc_values_pack(%2497) : (i64) -> i64
    %2499 = func.call @cc_symbol_value(%2495) : (i64) -> i64
    %2500 = llvm.mlir.addressof @str201 : !llvm.ptr
    %2501 = arith.constant 40 : i64
    %2502 = func.call @cc_make_string(%2500, %2501) : (!llvm.ptr, i64) -> i64
    %2503 = func.call @cc_nil_value() : () -> i64
    %2504 = func.call @cc_intern(%2502, %2503) : (i64, i64) -> i64
    %2505 = func.call @cc_nil_value() : () -> i64
    %2506 = func.call @cc_cons(%2504, %2505) : (i64, i64) -> i64
    %2507 = func.call @cc_values_pack(%2506) : (i64) -> i64
    %2508 = func.call @cc_symbol_value(%2504) : (i64) -> i64
    %2509 = func.call @cc_nil_value() : () -> i64
    %2510 = arith.cmpi ne, %2499, %2509 : i64
    %2511 = scf.if %2510 -> (i64) {
      scf.yield %2508 : i64
    } else {
      scf.yield %2490 : i64
    }
    %2512 = func.call @cc_values_pack(%2511) : (i64) -> i64
    func.call @stack_push_pointer(%2512) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_108321407238145"() {
    %135 = func.call @cc_nil_value() : () -> i64
    %136 = func.call @cc_nil_value() : () -> i64
    %137 = func.call @cc_errorp(%135) : (i64) -> i64
    %138 = arith.cmpi ne, %137, %136 : i64
    %139 = scf.if %138 -> (i64) {
      scf.yield %135 : i64
    } else {
      %140 = llvm.mlir.addressof @str14 : !llvm.ptr
      %141 = arith.constant 14 : i64
      %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
      %143 = llvm.mlir.addressof @str15 : !llvm.ptr
      %144 = arith.constant 11 : i64
      %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
      %146 = func.call @cc_intern(%142, %145) : (i64, i64) -> i64
      %147 = func.call @cc_nil_value() : () -> i64
      %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
      %149 = func.call @cc_values_pack(%148) : (i64) -> i64
      func.call @stack_push_pointer(%146) : (i64) -> ()
      %150 = func.call @stack_pop_pointer() : () -> i64
      %151 = func.call @cc_nil_value() : () -> i64
      %152 = func.call @cc_errorp(%150) : (i64) -> i64
      %153 = arith.cmpi ne, %152, %151 : i64
      %154 = arith.cmpi eq, %151, %151 : i64
      %155 = arith.andi %153, %154 : i1
      %156 = scf.if %155 -> (i64) {
        scf.yield %150 : i64
      } else {
        scf.yield %151 : i64
      }
      %157 = arith.cmpi ne, %156, %151 : i64
      scf.if %157 {
        func.call @stack_push_pointer(%156) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%150) : (i64) -> ()
        %158 = llvm.mlir.addressof @str16 : !llvm.ptr
        %159 = func.call @cc_make_function_ref_const(%158) : (!llvm.ptr) -> i64
        %160 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%159, %160) : (i64, i64) -> ()
      }
      %161 = func.call @stack_pop_pointer() : () -> i64
      %162 = func.call @cc_nil_value() : () -> i64
      %163 = func.call @cc_errorp(%161) : (i64) -> i64
      %164 = arith.cmpi ne, %163, %162 : i64
      %165 = arith.cmpi eq, %162, %162 : i64
      %166 = arith.andi %164, %165 : i1
      %167 = scf.if %166 -> (i64) {
        scf.yield %161 : i64
      } else {
        scf.yield %162 : i64
      }
      %168 = arith.cmpi ne, %167, %162 : i64
      scf.if %168 {
        func.call @stack_push_pointer(%167) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%161) : (i64) -> ()
        %169 = llvm.mlir.addressof @str17 : !llvm.ptr
        %170 = func.call @cc_make_function_ref_const(%169) : (!llvm.ptr) -> i64
        %171 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%170, %171) : (i64, i64) -> ()
      }
      %172 = func.call @stack_pop_pointer() : () -> i64
      %173 = func.call @cc_nil_value() : () -> i64
      %174 = func.call @cc_cons(%172, %173) : (i64, i64) -> i64
      %175 = func.call @cc_not(%174) : (i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_not(%178) : (i64) -> i64
      func.call @stack_push_pointer(%179) : (i64) -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %180 : i64
    }
    func.call @stack_push_pointer(%139) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238146"() {
    %389 = func.call @cc_nil_value() : () -> i64
    %390 = func.call @cc_nil_value() : () -> i64
    %391 = func.call @cc_errorp(%389) : (i64) -> i64
    %392 = arith.cmpi ne, %391, %390 : i64
    %393 = scf.if %392 -> (i64) {
      scf.yield %389 : i64
    } else {
      %394 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%394) : (i64) -> ()
      %395 = func.call @stack_pop_pointer() : () -> i64
      %396 = llvm.mlir.addressof @str37 : !llvm.ptr
      %397 = arith.constant 12 : i64
      %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
      %399 = llvm.mlir.addressof @str38 : !llvm.ptr
      %400 = arith.constant 7 : i64
      %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
      %402 = func.call @cc_intern(%398, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      func.call @stack_push_pointer(%402) : (i64) -> ()
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = llvm.mlir.addressof @str39 : !llvm.ptr
      %408 = arith.constant 3 : i64
      %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
      %410 = llvm.mlir.addressof @str40 : !llvm.ptr
      %411 = arith.constant 11 : i64
      %412 = func.call @cc_make_string(%410, %411) : (!llvm.ptr, i64) -> i64
      %413 = func.call @cc_intern(%409, %412) : (i64, i64) -> i64
      %414 = func.call @cc_nil_value() : () -> i64
      %415 = func.call @cc_cons(%413, %414) : (i64, i64) -> i64
      %416 = func.call @cc_values_pack(%415) : (i64) -> i64
      func.call @stack_push_pointer(%413) : (i64) -> ()
      %417 = func.call @stack_pop_pointer() : () -> i64
      %418 = llvm.mlir.addressof @str41 : !llvm.ptr
      %419 = arith.constant 16 : i64
      %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
      %421 = llvm.mlir.addressof @str42 : !llvm.ptr
      %422 = arith.constant 7 : i64
      %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
      %424 = func.call @cc_intern(%420, %423) : (i64, i64) -> i64
      %425 = func.call @cc_nil_value() : () -> i64
      %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
      %427 = func.call @cc_values_pack(%426) : (i64) -> i64
      func.call @stack_push_pointer(%424) : (i64) -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %429 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%429) : (i64) -> ()
      %430 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%430) : (i64) -> ()
      %431 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%431) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @cc_cons(%433, %432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%434) : (i64) -> ()
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @stack_pop_pointer() : () -> i64
      %437 = func.call @cc_cons(%436, %435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%437) : (i64) -> ()
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @stack_pop_pointer() : () -> i64
      %440 = func.call @cc_cons(%439, %438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%440) : (i64) -> ()
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @cc_nil_value() : () -> i64
      %443 = func.call @cc_errorp(%395) : (i64) -> i64
      %444 = arith.cmpi ne, %443, %442 : i64
      %445 = arith.cmpi eq, %442, %442 : i64
      %446 = arith.andi %444, %445 : i1
      %447 = scf.if %446 -> (i64) {
        scf.yield %395 : i64
      } else {
        scf.yield %442 : i64
      }
      %448 = func.call @cc_errorp(%406) : (i64) -> i64
      %449 = arith.cmpi ne, %448, %442 : i64
      %450 = arith.cmpi eq, %447, %442 : i64
      %451 = arith.andi %449, %450 : i1
      %452 = scf.if %451 -> (i64) {
        scf.yield %406 : i64
      } else {
        scf.yield %447 : i64
      }
      %453 = func.call @cc_errorp(%417) : (i64) -> i64
      %454 = arith.cmpi ne, %453, %442 : i64
      %455 = arith.cmpi eq, %452, %442 : i64
      %456 = arith.andi %454, %455 : i1
      %457 = scf.if %456 -> (i64) {
        scf.yield %417 : i64
      } else {
        scf.yield %452 : i64
      }
      %458 = func.call @cc_errorp(%428) : (i64) -> i64
      %459 = arith.cmpi ne, %458, %442 : i64
      %460 = arith.cmpi eq, %457, %442 : i64
      %461 = arith.andi %459, %460 : i1
      %462 = scf.if %461 -> (i64) {
        scf.yield %428 : i64
      } else {
        scf.yield %457 : i64
      }
      %463 = func.call @cc_errorp(%441) : (i64) -> i64
      %464 = arith.cmpi ne, %463, %442 : i64
      %465 = arith.cmpi eq, %462, %442 : i64
      %466 = arith.andi %464, %465 : i1
      %467 = scf.if %466 -> (i64) {
        scf.yield %441 : i64
      } else {
        scf.yield %462 : i64
      }
      %468 = arith.cmpi ne, %467, %442 : i64
      scf.if %468 {
        func.call @stack_push_pointer(%467) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%395) : (i64) -> ()
        func.call @stack_push_pointer(%406) : (i64) -> ()
        func.call @stack_push_pointer(%417) : (i64) -> ()
        func.call @stack_push_pointer(%428) : (i64) -> ()
        func.call @stack_push_pointer(%441) : (i64) -> ()
        %469 = llvm.mlir.addressof @str43 : !llvm.ptr
        %470 = func.call @cc_make_function_ref_const(%469) : (!llvm.ptr) -> i64
        %471 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%470, %471) : (i64, i64) -> ()
      }
      %472 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %472 : i64
    }
    func.call @stack_push_pointer(%393) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238147"() {
    %697 = func.call @cc_nil_value() : () -> i64
    %698 = func.call @cc_nil_value() : () -> i64
    %699 = func.call @cc_errorp(%697) : (i64) -> i64
    %700 = arith.cmpi ne, %699, %698 : i64
    %701 = scf.if %700 -> (i64) {
      scf.yield %697 : i64
    } else {
      %702 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%702) : (i64) -> ()
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = llvm.mlir.addressof @str62 : !llvm.ptr
      %705 = arith.constant 12 : i64
      %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
      %707 = llvm.mlir.addressof @str63 : !llvm.ptr
      %708 = arith.constant 7 : i64
      %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
      %710 = func.call @cc_intern(%706, %709) : (i64, i64) -> i64
      %711 = func.call @cc_nil_value() : () -> i64
      %712 = func.call @cc_cons(%710, %711) : (i64, i64) -> i64
      %713 = func.call @cc_values_pack(%712) : (i64) -> i64
      func.call @stack_push_pointer(%710) : (i64) -> ()
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = llvm.mlir.addressof @str64 : !llvm.ptr
      %716 = arith.constant 13 : i64
      %717 = func.call @cc_make_string(%715, %716) : (!llvm.ptr, i64) -> i64
      %718 = llvm.mlir.addressof @str65 : !llvm.ptr
      %719 = arith.constant 11 : i64
      %720 = func.call @cc_make_string(%718, %719) : (!llvm.ptr, i64) -> i64
      %721 = func.call @cc_intern(%717, %720) : (i64, i64) -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
      %724 = func.call @cc_values_pack(%723) : (i64) -> i64
      func.call @stack_push_pointer(%721) : (i64) -> ()
      %725 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%725) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @cc_cons(%727, %726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @cc_cons(%730, %729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%731) : (i64) -> ()
      %732 = func.call @stack_pop_pointer() : () -> i64
      %733 = llvm.mlir.addressof @str66 : !llvm.ptr
      %734 = arith.constant 16 : i64
      %735 = func.call @cc_make_string(%733, %734) : (!llvm.ptr, i64) -> i64
      %736 = llvm.mlir.addressof @str67 : !llvm.ptr
      %737 = arith.constant 7 : i64
      %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
      %739 = func.call @cc_intern(%735, %738) : (i64, i64) -> i64
      %740 = func.call @cc_nil_value() : () -> i64
      %741 = func.call @cc_cons(%739, %740) : (i64, i64) -> i64
      %742 = func.call @cc_values_pack(%741) : (i64) -> i64
      func.call @stack_push_pointer(%739) : (i64) -> ()
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%744) : (i64) -> ()
      %745 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%745) : (i64) -> ()
      %746 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%746) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @cc_cons(%748, %747) : (i64, i64) -> i64
      func.call @stack_push_pointer(%749) : (i64) -> ()
      %750 = func.call @stack_pop_pointer() : () -> i64
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @cc_cons(%751, %750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%752) : (i64) -> ()
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @cc_cons(%754, %753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%755) : (i64) -> ()
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @cc_nil_value() : () -> i64
      %758 = func.call @cc_errorp(%703) : (i64) -> i64
      %759 = arith.cmpi ne, %758, %757 : i64
      %760 = arith.cmpi eq, %757, %757 : i64
      %761 = arith.andi %759, %760 : i1
      %762 = scf.if %761 -> (i64) {
        scf.yield %703 : i64
      } else {
        scf.yield %757 : i64
      }
      %763 = func.call @cc_errorp(%714) : (i64) -> i64
      %764 = arith.cmpi ne, %763, %757 : i64
      %765 = arith.cmpi eq, %762, %757 : i64
      %766 = arith.andi %764, %765 : i1
      %767 = scf.if %766 -> (i64) {
        scf.yield %714 : i64
      } else {
        scf.yield %762 : i64
      }
      %768 = func.call @cc_errorp(%732) : (i64) -> i64
      %769 = arith.cmpi ne, %768, %757 : i64
      %770 = arith.cmpi eq, %767, %757 : i64
      %771 = arith.andi %769, %770 : i1
      %772 = scf.if %771 -> (i64) {
        scf.yield %732 : i64
      } else {
        scf.yield %767 : i64
      }
      %773 = func.call @cc_errorp(%743) : (i64) -> i64
      %774 = arith.cmpi ne, %773, %757 : i64
      %775 = arith.cmpi eq, %772, %757 : i64
      %776 = arith.andi %774, %775 : i1
      %777 = scf.if %776 -> (i64) {
        scf.yield %743 : i64
      } else {
        scf.yield %772 : i64
      }
      %778 = func.call @cc_errorp(%756) : (i64) -> i64
      %779 = arith.cmpi ne, %778, %757 : i64
      %780 = arith.cmpi eq, %777, %757 : i64
      %781 = arith.andi %779, %780 : i1
      %782 = scf.if %781 -> (i64) {
        scf.yield %756 : i64
      } else {
        scf.yield %777 : i64
      }
      %783 = arith.cmpi ne, %782, %757 : i64
      scf.if %783 {
        func.call @stack_push_pointer(%782) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%703) : (i64) -> ()
        func.call @stack_push_pointer(%714) : (i64) -> ()
        func.call @stack_push_pointer(%732) : (i64) -> ()
        func.call @stack_push_pointer(%743) : (i64) -> ()
        func.call @stack_push_pointer(%756) : (i64) -> ()
        %784 = llvm.mlir.addressof @str68 : !llvm.ptr
        %785 = func.call @cc_make_function_ref_const(%784) : (!llvm.ptr) -> i64
        %786 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%785, %786) : (i64, i64) -> ()
      }
      %787 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %787 : i64
    }
    func.call @stack_push_pointer(%701) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238148"() {
    %980 = func.call @cc_nil_value() : () -> i64
    %981 = func.call @cc_nil_value() : () -> i64
    %982 = func.call @cc_errorp(%980) : (i64) -> i64
    %983 = arith.cmpi ne, %982, %981 : i64
    %984 = scf.if %983 -> (i64) {
      scf.yield %980 : i64
    } else {
      %985 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%985) : (i64) -> ()
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = llvm.mlir.addressof @str85 : !llvm.ptr
      %988 = arith.constant 12 : i64
      %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
      %990 = llvm.mlir.addressof @str86 : !llvm.ptr
      %991 = arith.constant 7 : i64
      %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
      %993 = func.call @cc_intern(%989, %992) : (i64, i64) -> i64
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = func.call @cc_cons(%993, %994) : (i64, i64) -> i64
      %996 = func.call @cc_values_pack(%995) : (i64) -> i64
      func.call @stack_push_pointer(%993) : (i64) -> ()
      %997 = func.call @stack_pop_pointer() : () -> i64
      %998 = llvm.mlir.addressof @str87 : !llvm.ptr
      %999 = arith.constant 9 : i64
      %1000 = func.call @cc_make_string(%998, %999) : (!llvm.ptr, i64) -> i64
      %1001 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1002 = arith.constant 11 : i64
      %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
      %1004 = func.call @cc_intern(%1000, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_nil_value() : () -> i64
      %1006 = func.call @cc_cons(%1004, %1005) : (i64, i64) -> i64
      %1007 = func.call @cc_values_pack(%1006) : (i64) -> i64
      func.call @stack_push_pointer(%1004) : (i64) -> ()
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1010 = arith.constant 15 : i64
      %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
      %1012 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1013 = arith.constant 7 : i64
      %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
      %1015 = func.call @cc_intern(%1011, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_cons(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_values_pack(%1017) : (i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1019 = func.call @stack_pop_pointer() : () -> i64
      %1020 = arith.constant 97 : i64
      %1021 = func.call @cc_box_character(%1020) : (i64) -> i64
      func.call @stack_push_pointer(%1021) : (i64) -> ()
      %1022 = func.call @stack_pop_pointer() : () -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_errorp(%986) : (i64) -> i64
      %1025 = arith.cmpi ne, %1024, %1023 : i64
      %1026 = arith.cmpi eq, %1023, %1023 : i64
      %1027 = arith.andi %1025, %1026 : i1
      %1028 = scf.if %1027 -> (i64) {
        scf.yield %986 : i64
      } else {
        scf.yield %1023 : i64
      }
      %1029 = func.call @cc_errorp(%997) : (i64) -> i64
      %1030 = arith.cmpi ne, %1029, %1023 : i64
      %1031 = arith.cmpi eq, %1028, %1023 : i64
      %1032 = arith.andi %1030, %1031 : i1
      %1033 = scf.if %1032 -> (i64) {
        scf.yield %997 : i64
      } else {
        scf.yield %1028 : i64
      }
      %1034 = func.call @cc_errorp(%1008) : (i64) -> i64
      %1035 = arith.cmpi ne, %1034, %1023 : i64
      %1036 = arith.cmpi eq, %1033, %1023 : i64
      %1037 = arith.andi %1035, %1036 : i1
      %1038 = scf.if %1037 -> (i64) {
        scf.yield %1008 : i64
      } else {
        scf.yield %1033 : i64
      }
      %1039 = func.call @cc_errorp(%1019) : (i64) -> i64
      %1040 = arith.cmpi ne, %1039, %1023 : i64
      %1041 = arith.cmpi eq, %1038, %1023 : i64
      %1042 = arith.andi %1040, %1041 : i1
      %1043 = scf.if %1042 -> (i64) {
        scf.yield %1019 : i64
      } else {
        scf.yield %1038 : i64
      }
      %1044 = func.call @cc_errorp(%1022) : (i64) -> i64
      %1045 = arith.cmpi ne, %1044, %1023 : i64
      %1046 = arith.cmpi eq, %1043, %1023 : i64
      %1047 = arith.andi %1045, %1046 : i1
      %1048 = scf.if %1047 -> (i64) {
        scf.yield %1022 : i64
      } else {
        scf.yield %1043 : i64
      }
      %1049 = arith.cmpi ne, %1048, %1023 : i64
      scf.if %1049 {
        func.call @stack_push_pointer(%1048) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%986) : (i64) -> ()
        func.call @stack_push_pointer(%997) : (i64) -> ()
        func.call @stack_push_pointer(%1008) : (i64) -> ()
        func.call @stack_push_pointer(%1019) : (i64) -> ()
        func.call @stack_push_pointer(%1022) : (i64) -> ()
        %1050 = llvm.mlir.addressof @str91 : !llvm.ptr
        %1051 = func.call @cc_make_function_ref_const(%1050) : (!llvm.ptr) -> i64
        %1052 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1051, %1052) : (i64, i64) -> ()
      }
      %1053 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1053 : i64
    }
    func.call @stack_push_pointer(%984) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238149"() {
    %1259 = func.call @cc_nil_value() : () -> i64
    %1260 = func.call @cc_nil_value() : () -> i64
    %1261 = func.call @cc_errorp(%1259) : (i64) -> i64
    %1262 = arith.cmpi ne, %1261, %1260 : i64
    %1263 = scf.if %1262 -> (i64) {
      scf.yield %1259 : i64
    } else {
      %1264 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1264) : (i64) -> ()
      %1265 = func.call @stack_pop_pointer() : () -> i64
      %1266 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1267 = arith.constant 12 : i64
      %1268 = func.call @cc_make_string(%1266, %1267) : (!llvm.ptr, i64) -> i64
      %1269 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1270 = arith.constant 7 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = func.call @cc_intern(%1268, %1271) : (i64, i64) -> i64
      %1273 = func.call @cc_nil_value() : () -> i64
      %1274 = func.call @cc_cons(%1272, %1273) : (i64, i64) -> i64
      %1275 = func.call @cc_values_pack(%1274) : (i64) -> i64
      func.call @stack_push_pointer(%1272) : (i64) -> ()
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1278 = arith.constant 9 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1281 = arith.constant 11 : i64
      %1282 = func.call @cc_make_string(%1280, %1281) : (!llvm.ptr, i64) -> i64
      %1283 = func.call @cc_intern(%1279, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_nil_value() : () -> i64
      %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
      %1286 = func.call @cc_values_pack(%1285) : (i64) -> i64
      func.call @stack_push_pointer(%1283) : (i64) -> ()
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1289 = arith.constant 16 : i64
      %1290 = func.call @cc_make_string(%1288, %1289) : (!llvm.ptr, i64) -> i64
      %1291 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1292 = arith.constant 7 : i64
      %1293 = func.call @cc_make_string(%1291, %1292) : (!llvm.ptr, i64) -> i64
      %1294 = func.call @cc_intern(%1290, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_nil_value() : () -> i64
      %1296 = func.call @cc_cons(%1294, %1295) : (i64, i64) -> i64
      %1297 = func.call @cc_values_pack(%1296) : (i64) -> i64
      func.call @stack_push_pointer(%1294) : (i64) -> ()
      %1298 = func.call @stack_pop_pointer() : () -> i64
      %1299 = arith.constant 97 : i64
      %1300 = func.call @cc_box_character(%1299) : (i64) -> i64
      func.call @stack_push_pointer(%1300) : (i64) -> ()
      %1301 = arith.constant 98 : i64
      %1302 = func.call @cc_box_character(%1301) : (i64) -> i64
      func.call @stack_push_pointer(%1302) : (i64) -> ()
      %1303 = arith.constant 99 : i64
      %1304 = func.call @cc_box_character(%1303) : (i64) -> i64
      func.call @stack_push_pointer(%1304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %1306 = func.call @stack_pop_pointer() : () -> i64
      %1307 = func.call @cc_cons(%1306, %1305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1307) : (i64) -> ()
      %1308 = func.call @stack_pop_pointer() : () -> i64
      %1309 = func.call @stack_pop_pointer() : () -> i64
      %1310 = func.call @cc_cons(%1309, %1308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1310) : (i64) -> ()
      %1311 = func.call @stack_pop_pointer() : () -> i64
      %1312 = func.call @stack_pop_pointer() : () -> i64
      %1313 = func.call @cc_cons(%1312, %1311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1313) : (i64) -> ()
      %1314 = func.call @stack_pop_pointer() : () -> i64
      %1315 = func.call @cc_nil_value() : () -> i64
      %1316 = func.call @cc_errorp(%1265) : (i64) -> i64
      %1317 = arith.cmpi ne, %1316, %1315 : i64
      %1318 = arith.cmpi eq, %1315, %1315 : i64
      %1319 = arith.andi %1317, %1318 : i1
      %1320 = scf.if %1319 -> (i64) {
        scf.yield %1265 : i64
      } else {
        scf.yield %1315 : i64
      }
      %1321 = func.call @cc_errorp(%1276) : (i64) -> i64
      %1322 = arith.cmpi ne, %1321, %1315 : i64
      %1323 = arith.cmpi eq, %1320, %1315 : i64
      %1324 = arith.andi %1322, %1323 : i1
      %1325 = scf.if %1324 -> (i64) {
        scf.yield %1276 : i64
      } else {
        scf.yield %1320 : i64
      }
      %1326 = func.call @cc_errorp(%1287) : (i64) -> i64
      %1327 = arith.cmpi ne, %1326, %1315 : i64
      %1328 = arith.cmpi eq, %1325, %1315 : i64
      %1329 = arith.andi %1327, %1328 : i1
      %1330 = scf.if %1329 -> (i64) {
        scf.yield %1287 : i64
      } else {
        scf.yield %1325 : i64
      }
      %1331 = func.call @cc_errorp(%1298) : (i64) -> i64
      %1332 = arith.cmpi ne, %1331, %1315 : i64
      %1333 = arith.cmpi eq, %1330, %1315 : i64
      %1334 = arith.andi %1332, %1333 : i1
      %1335 = scf.if %1334 -> (i64) {
        scf.yield %1298 : i64
      } else {
        scf.yield %1330 : i64
      }
      %1336 = func.call @cc_errorp(%1314) : (i64) -> i64
      %1337 = arith.cmpi ne, %1336, %1315 : i64
      %1338 = arith.cmpi eq, %1335, %1315 : i64
      %1339 = arith.andi %1337, %1338 : i1
      %1340 = scf.if %1339 -> (i64) {
        scf.yield %1314 : i64
      } else {
        scf.yield %1335 : i64
      }
      %1341 = arith.cmpi ne, %1340, %1315 : i64
      scf.if %1341 {
        func.call @stack_push_pointer(%1340) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1265) : (i64) -> ()
        func.call @stack_push_pointer(%1276) : (i64) -> ()
        func.call @stack_push_pointer(%1287) : (i64) -> ()
        func.call @stack_push_pointer(%1298) : (i64) -> ()
        func.call @stack_push_pointer(%1314) : (i64) -> ()
        %1342 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1343 = func.call @cc_make_function_ref_const(%1342) : (!llvm.ptr) -> i64
        %1344 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1343, %1344) : (i64, i64) -> ()
      }
      %1345 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1345 : i64
    }
    func.call @stack_push_pointer(%1263) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238150"() {
    %1544 = func.call @cc_nil_value() : () -> i64
    %1545 = func.call @cc_nil_value() : () -> i64
    %1546 = func.call @cc_errorp(%1544) : (i64) -> i64
    %1547 = arith.cmpi ne, %1546, %1545 : i64
    %1548 = scf.if %1547 -> (i64) {
      scf.yield %1544 : i64
    } else {
      %1549 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1550 = arith.constant 8 : i64
      %1551 = func.call @cc_make_string(%1549, %1550) : (!llvm.ptr, i64) -> i64
      %1552 = func.call @cc_nil_value() : () -> i64
      %1553 = func.call @cc_intern(%1551, %1552) : (i64, i64) -> i64
      %1554 = func.call @cc_nil_value() : () -> i64
      %1555 = func.call @cc_cons(%1553, %1554) : (i64, i64) -> i64
      %1556 = func.call @cc_values_pack(%1555) : (i64) -> i64
      %1557 = func.call @cc_symbol_value(%1553) : (i64) -> i64
      func.call @stack_push_pointer(%1557) : (i64) -> ()
      %1558 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1558 : i64
    }
    func.call @stack_push_pointer(%1548) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238151"() {
    %1742 = func.call @cc_nil_value() : () -> i64
    %1743 = func.call @cc_nil_value() : () -> i64
    %1744 = func.call @cc_errorp(%1742) : (i64) -> i64
    %1745 = arith.cmpi ne, %1744, %1743 : i64
    %1746 = scf.if %1745 -> (i64) {
      scf.yield %1742 : i64
    } else {
      %1747 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1748 = arith.constant 8 : i64
      %1749 = func.call @cc_make_string(%1747, %1748) : (!llvm.ptr, i64) -> i64
      %1750 = func.call @cc_nil_value() : () -> i64
      %1751 = func.call @cc_intern(%1749, %1750) : (i64, i64) -> i64
      %1752 = func.call @cc_nil_value() : () -> i64
      %1753 = func.call @cc_cons(%1751, %1752) : (i64, i64) -> i64
      %1754 = func.call @cc_values_pack(%1753) : (i64) -> i64
      %1755 = func.call @cc_symbol_value(%1751) : (i64) -> i64
      func.call @stack_push_pointer(%1755) : (i64) -> ()
      %1756 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1756 : i64
    }
    func.call @stack_push_pointer(%1746) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238152"() {
    %2083 = func.call @cc_nil_value() : () -> i64
    %2084 = func.call @cc_nil_value() : () -> i64
    %2085 = func.call @cc_errorp(%2083) : (i64) -> i64
    %2086 = arith.cmpi ne, %2085, %2084 : i64
    %2087 = scf.if %2086 -> (i64) {
      scf.yield %2083 : i64
    } else {
      %2088 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2089 = arith.constant 3 : i64
      %2090 = func.call @cc_make_string(%2088, %2089) : (!llvm.ptr, i64) -> i64
      %2091 = func.call @cc_nil_value() : () -> i64
      %2092 = func.call @cc_intern(%2090, %2091) : (i64, i64) -> i64
      %2093 = func.call @cc_nil_value() : () -> i64
      %2094 = func.call @cc_cons(%2092, %2093) : (i64, i64) -> i64
      %2095 = func.call @cc_values_pack(%2094) : (i64) -> i64
      %2096 = func.call @cc_symbol_value(%2092) : (i64) -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2097 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2097 : i64
    }
    func.call @stack_push_pointer(%2087) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_108321407238153"() {
    %2383 = func.call @cc_nil_value() : () -> i64
    %2384 = func.call @cc_nil_value() : () -> i64
    %2385 = func.call @cc_errorp(%2383) : (i64) -> i64
    %2386 = arith.cmpi ne, %2385, %2384 : i64
    %2387 = scf.if %2386 -> (i64) {
      scf.yield %2383 : i64
    } else {
      %2388 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2389 = arith.constant 3 : i64
      %2390 = func.call @cc_make_string(%2388, %2389) : (!llvm.ptr, i64) -> i64
      %2391 = func.call @cc_nil_value() : () -> i64
      %2392 = func.call @cc_intern(%2390, %2391) : (i64, i64) -> i64
      %2393 = func.call @cc_nil_value() : () -> i64
      %2394 = func.call @cc_cons(%2392, %2393) : (i64, i64) -> i64
      %2395 = func.call @cc_values_pack(%2394) : (i64) -> i64
      %2396 = func.call @cc_symbol_value(%2392) : (i64) -> i64
      func.call @stack_push_pointer(%2396) : (i64) -> ()
      %2397 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2397 : i64
    }
    func.call @stack_push_pointer(%2387) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_108321407238144*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_108321407238144*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_108321407238144*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CXX-DERIVABILITY\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str5("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("INHERITS-FROM-INSTANCE\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str8("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str9("MAKE-CXX-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str10("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str11("MATCH-CALLBACK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str12("AST-TOOLING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str13("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str14("MATCH-CALLBACK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str15("AST-TOOLING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("CORE:MAKE-CXX-OBJECT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str17("CORE:INHERITS-FROM-INSTANCE\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str18("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str19("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("A derivable class is a CLOS class that derives from a C++ class.\0AThey are defined in the clbind library using Derivable<Foo>.\0AThey must be seen as inheriting from the Instance_O class.\0AIf they don't then any code that uses them won't work properly.\0ACheck clasp/include/clasp/core/instance.h header file for the \0AInstance_O specialization of TaggedCast\00") : !llvm.array<352 x i8>
  llvm.mlir.global private constant @str22("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str23("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str24("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str26("EQUAL-BIT-VECTOR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str27("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str44("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str47("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str48("EQUAL\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str49("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str51("EQUALP-UB8-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str52("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str53("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str57("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str59("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str62("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str63("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str64("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str67("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str68("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str69("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str73("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str75("STRING=0\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str76("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str83("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str84("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str85("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str86("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str87("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str90("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str92("aaa\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str100("STRING=1\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str101("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str102("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str106("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str108("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str109("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str110("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str111("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str114("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str118("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str119("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str126("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str127("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str128("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str129("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str132("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str134("EQUALP-BIT-VECTOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str135("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str136("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str137("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str142("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str143("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str144("SBIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str145("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str147("*BITVEC*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str148("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str153("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str154("*BN*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("23482395823512381241927312749127418274918273\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str156("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str157("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str158("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str160("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str162("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str163("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str164("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("*BN*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str166("core:integer-to-string\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str167("INTEGER-TO-STRING-POSITIVE\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str168("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str169("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str170("23482395823512381241927312749127418274918273\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str171("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str173("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str174("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str175("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str176("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str178("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str179("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str182("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str184("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str186("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str187("*BN*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("core:integer-to-string\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str189("INTEGER-TO-STRING-NEGATIVE\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str190("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str191("*S*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str192("-23482395823512381241927312749127418274918273\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str193("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str200("*__MLIR_BLOCK_RETFLAG_108321407238144*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str201("*__MLIR_BLOCK_RETMVLIST_108321407238144*\00") : !llvm.array<41 x i8>
}
