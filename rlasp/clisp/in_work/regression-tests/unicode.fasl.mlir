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
      %58 = arith.constant 18 : i64
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
      %76 = arith.constant 1024 : i64
      %77 = func.call @cc_box_character(%76) : (i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %78 = func.call @stack_pop_pointer() : () -> i64
      %79 = func.call @stack_pop_pointer() : () -> i64
      %80 = func.call @cc_cons(%79, %78) : (i64, i64) -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @cc_cons(%82, %81) : (i64, i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      %104 = arith.constant 271595545296897 : i64
      %105 = arith.constant 0 : i64
      %106 = func.call @cc_make_closure(%104, %105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%106) : (i64) -> ()
      %107 = func.call @stack_pop_pointer() : () -> i64
      %108 = arith.constant 1104 : i64
      %109 = func.call @cc_box_character(%108) : (i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @cc_cons(%111, %110) : (i64, i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = llvm.mlir.addressof @str9 : !llvm.ptr
      %115 = arith.constant 11 : i64
      %116 = func.call @cc_make_string(%114, %115) : (!llvm.ptr, i64) -> i64
      %117 = llvm.mlir.addressof @str10 : !llvm.ptr
      %118 = arith.constant 7 : i64
      %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
      %120 = func.call @cc_intern(%116, %119) : (i64, i64) -> i64
      %121 = func.call @cc_nil_value() : () -> i64
      %122 = func.call @cc_cons(%120, %121) : (i64, i64) -> i64
      %123 = func.call @cc_values_pack(%122) : (i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %124 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = llvm.mlir.addressof @str11 : !llvm.ptr
      %127 = arith.constant 4 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      %129 = llvm.mlir.addressof @str12 : !llvm.ptr
      %130 = arith.constant 7 : i64
      %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
      %132 = func.call @cc_intern(%128, %131) : (i64, i64) -> i64
      %133 = func.call @cc_nil_value() : () -> i64
      %134 = func.call @cc_cons(%132, %133) : (i64, i64) -> i64
      %135 = func.call @cc_values_pack(%134) : (i64) -> i64
      func.call @stack_push_pointer(%132) : (i64) -> ()
      %136 = func.call @stack_pop_pointer() : () -> i64
      %137 = llvm.mlir.addressof @str13 : !llvm.ptr
      %138 = arith.constant 6 : i64
      %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
      %140 = func.call @cc_nil_value() : () -> i64
      %141 = func.call @cc_intern(%139, %140) : (i64, i64) -> i64
      %142 = func.call @cc_nil_value() : () -> i64
      %143 = func.call @cc_cons(%141, %142) : (i64, i64) -> i64
      %144 = func.call @cc_values_pack(%143) : (i64) -> i64
      func.call @stack_push_pointer(%141) : (i64) -> ()
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @cc_nil_value() : () -> i64
      %147 = func.call @cc_errorp(%65) : (i64) -> i64
      %148 = arith.cmpi ne, %147, %146 : i64
      %149 = arith.cmpi eq, %146, %146 : i64
      %150 = arith.andi %148, %149 : i1
      %151 = scf.if %150 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %146 : i64
      }
      %152 = func.call @cc_errorp(%84) : (i64) -> i64
      %153 = arith.cmpi ne, %152, %146 : i64
      %154 = arith.cmpi eq, %151, %146 : i64
      %155 = arith.andi %153, %154 : i1
      %156 = scf.if %155 -> (i64) {
        scf.yield %84 : i64
      } else {
        scf.yield %151 : i64
      }
      %157 = func.call @cc_errorp(%107) : (i64) -> i64
      %158 = arith.cmpi ne, %157, %146 : i64
      %159 = arith.cmpi eq, %156, %146 : i64
      %160 = arith.andi %158, %159 : i1
      %161 = scf.if %160 -> (i64) {
        scf.yield %107 : i64
      } else {
        scf.yield %156 : i64
      }
      %162 = func.call @cc_errorp(%113) : (i64) -> i64
      %163 = arith.cmpi ne, %162, %146 : i64
      %164 = arith.cmpi eq, %161, %146 : i64
      %165 = arith.andi %163, %164 : i1
      %166 = scf.if %165 -> (i64) {
        scf.yield %113 : i64
      } else {
        scf.yield %161 : i64
      }
      %167 = func.call @cc_errorp(%124) : (i64) -> i64
      %168 = arith.cmpi ne, %167, %146 : i64
      %169 = arith.cmpi eq, %166, %146 : i64
      %170 = arith.andi %168, %169 : i1
      %171 = scf.if %170 -> (i64) {
        scf.yield %124 : i64
      } else {
        scf.yield %166 : i64
      }
      %172 = func.call @cc_errorp(%125) : (i64) -> i64
      %173 = arith.cmpi ne, %172, %146 : i64
      %174 = arith.cmpi eq, %171, %146 : i64
      %175 = arith.andi %173, %174 : i1
      %176 = scf.if %175 -> (i64) {
        scf.yield %125 : i64
      } else {
        scf.yield %171 : i64
      }
      %177 = func.call @cc_errorp(%136) : (i64) -> i64
      %178 = arith.cmpi ne, %177, %146 : i64
      %179 = arith.cmpi eq, %176, %146 : i64
      %180 = arith.andi %178, %179 : i1
      %181 = scf.if %180 -> (i64) {
        scf.yield %136 : i64
      } else {
        scf.yield %176 : i64
      }
      %182 = func.call @cc_errorp(%145) : (i64) -> i64
      %183 = arith.cmpi ne, %182, %146 : i64
      %184 = arith.cmpi eq, %181, %146 : i64
      %185 = arith.andi %183, %184 : i1
      %186 = scf.if %185 -> (i64) {
        scf.yield %145 : i64
      } else {
        scf.yield %181 : i64
      }
      %187 = arith.cmpi ne, %186, %146 : i64
      scf.if %187 {
        func.call @stack_push_pointer(%186) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%84) : (i64) -> ()
        func.call @stack_push_pointer(%107) : (i64) -> ()
        func.call @stack_push_pointer(%113) : (i64) -> ()
        func.call @stack_push_pointer(%124) : (i64) -> ()
        func.call @stack_push_pointer(%125) : (i64) -> ()
        func.call @stack_push_pointer(%136) : (i64) -> ()
        func.call @stack_push_pointer(%145) : (i64) -> ()
        %188 = llvm.mlir.addressof @str14 : !llvm.ptr
        %189 = func.call @cc_make_function_ref_const(%188) : (!llvm.ptr) -> i64
        %190 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%189, %190) : (i64, i64) -> ()
      }
      %191 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %191 : i64
    }
    %192 = func.call @cc_nil_value() : () -> i64
    %193 = func.call @cc_errorp(%56) : (i64) -> i64
    %194 = arith.cmpi ne, %193, %192 : i64
    %195 = scf.if %194 -> (i64) {
      scf.yield %56 : i64
    } else {
      %196 = llvm.mlir.addressof @str15 : !llvm.ptr
      %197 = arith.constant 16 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_intern(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_nil_value() : () -> i64
      %202 = func.call @cc_cons(%200, %201) : (i64, i64) -> i64
      %203 = func.call @cc_values_pack(%202) : (i64) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      %204 = func.call @stack_pop_pointer() : () -> i64
      %205 = llvm.mlir.addressof @str16 : !llvm.ptr
      %206 = arith.constant 11 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = llvm.mlir.addressof @str17 : !llvm.ptr
      %209 = arith.constant 11 : i64
      %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
      %211 = func.call @cc_intern(%207, %210) : (i64, i64) -> i64
      %212 = func.call @cc_nil_value() : () -> i64
      %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
      %214 = func.call @cc_values_pack(%213) : (i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      %215 = arith.constant 1104 : i64
      %216 = func.call @cc_box_character(%215) : (i64) -> i64
      func.call @stack_push_pointer(%216) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %217 = func.call @stack_pop_pointer() : () -> i64
      %218 = func.call @stack_pop_pointer() : () -> i64
      %219 = func.call @cc_cons(%218, %217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %220 = func.call @stack_pop_pointer() : () -> i64
      %221 = func.call @stack_pop_pointer() : () -> i64
      %222 = func.call @cc_cons(%221, %220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      %223 = func.call @stack_pop_pointer() : () -> i64
      %243 = arith.constant 271595545296898 : i64
      %244 = arith.constant 0 : i64
      %245 = func.call @cc_make_closure(%243, %244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = arith.constant 1024 : i64
      %248 = func.call @cc_box_character(%247) : (i64) -> i64
      func.call @stack_push_pointer(%248) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @cc_cons(%250, %249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = llvm.mlir.addressof @str19 : !llvm.ptr
      %254 = arith.constant 11 : i64
      %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
      %256 = llvm.mlir.addressof @str20 : !llvm.ptr
      %257 = arith.constant 7 : i64
      %258 = func.call @cc_make_string(%256, %257) : (!llvm.ptr, i64) -> i64
      %259 = func.call @cc_intern(%255, %258) : (i64, i64) -> i64
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_cons(%259, %260) : (i64, i64) -> i64
      %262 = func.call @cc_values_pack(%261) : (i64) -> i64
      func.call @stack_push_pointer(%259) : (i64) -> ()
      %263 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %264 = func.call @stack_pop_pointer() : () -> i64
      %265 = llvm.mlir.addressof @str21 : !llvm.ptr
      %266 = arith.constant 4 : i64
      %267 = func.call @cc_make_string(%265, %266) : (!llvm.ptr, i64) -> i64
      %268 = llvm.mlir.addressof @str22 : !llvm.ptr
      %269 = arith.constant 7 : i64
      %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
      %271 = func.call @cc_intern(%267, %270) : (i64, i64) -> i64
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = func.call @cc_cons(%271, %272) : (i64, i64) -> i64
      %274 = func.call @cc_values_pack(%273) : (i64) -> i64
      func.call @stack_push_pointer(%271) : (i64) -> ()
      %275 = func.call @stack_pop_pointer() : () -> i64
      %276 = llvm.mlir.addressof @str23 : !llvm.ptr
      %277 = arith.constant 6 : i64
      %278 = func.call @cc_make_string(%276, %277) : (!llvm.ptr, i64) -> i64
      %279 = func.call @cc_nil_value() : () -> i64
      %280 = func.call @cc_intern(%278, %279) : (i64, i64) -> i64
      %281 = func.call @cc_nil_value() : () -> i64
      %282 = func.call @cc_cons(%280, %281) : (i64, i64) -> i64
      %283 = func.call @cc_values_pack(%282) : (i64) -> i64
      func.call @stack_push_pointer(%280) : (i64) -> ()
      %284 = func.call @stack_pop_pointer() : () -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_errorp(%204) : (i64) -> i64
      %287 = arith.cmpi ne, %286, %285 : i64
      %288 = arith.cmpi eq, %285, %285 : i64
      %289 = arith.andi %287, %288 : i1
      %290 = scf.if %289 -> (i64) {
        scf.yield %204 : i64
      } else {
        scf.yield %285 : i64
      }
      %291 = func.call @cc_errorp(%223) : (i64) -> i64
      %292 = arith.cmpi ne, %291, %285 : i64
      %293 = arith.cmpi eq, %290, %285 : i64
      %294 = arith.andi %292, %293 : i1
      %295 = scf.if %294 -> (i64) {
        scf.yield %223 : i64
      } else {
        scf.yield %290 : i64
      }
      %296 = func.call @cc_errorp(%246) : (i64) -> i64
      %297 = arith.cmpi ne, %296, %285 : i64
      %298 = arith.cmpi eq, %295, %285 : i64
      %299 = arith.andi %297, %298 : i1
      %300 = scf.if %299 -> (i64) {
        scf.yield %246 : i64
      } else {
        scf.yield %295 : i64
      }
      %301 = func.call @cc_errorp(%252) : (i64) -> i64
      %302 = arith.cmpi ne, %301, %285 : i64
      %303 = arith.cmpi eq, %300, %285 : i64
      %304 = arith.andi %302, %303 : i1
      %305 = scf.if %304 -> (i64) {
        scf.yield %252 : i64
      } else {
        scf.yield %300 : i64
      }
      %306 = func.call @cc_errorp(%263) : (i64) -> i64
      %307 = arith.cmpi ne, %306, %285 : i64
      %308 = arith.cmpi eq, %305, %285 : i64
      %309 = arith.andi %307, %308 : i1
      %310 = scf.if %309 -> (i64) {
        scf.yield %263 : i64
      } else {
        scf.yield %305 : i64
      }
      %311 = func.call @cc_errorp(%264) : (i64) -> i64
      %312 = arith.cmpi ne, %311, %285 : i64
      %313 = arith.cmpi eq, %310, %285 : i64
      %314 = arith.andi %312, %313 : i1
      %315 = scf.if %314 -> (i64) {
        scf.yield %264 : i64
      } else {
        scf.yield %310 : i64
      }
      %316 = func.call @cc_errorp(%275) : (i64) -> i64
      %317 = arith.cmpi ne, %316, %285 : i64
      %318 = arith.cmpi eq, %315, %285 : i64
      %319 = arith.andi %317, %318 : i1
      %320 = scf.if %319 -> (i64) {
        scf.yield %275 : i64
      } else {
        scf.yield %315 : i64
      }
      %321 = func.call @cc_errorp(%284) : (i64) -> i64
      %322 = arith.cmpi ne, %321, %285 : i64
      %323 = arith.cmpi eq, %320, %285 : i64
      %324 = arith.andi %322, %323 : i1
      %325 = scf.if %324 -> (i64) {
        scf.yield %284 : i64
      } else {
        scf.yield %320 : i64
      }
      %326 = arith.cmpi ne, %325, %285 : i64
      scf.if %326 {
        func.call @stack_push_pointer(%325) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%204) : (i64) -> ()
        func.call @stack_push_pointer(%223) : (i64) -> ()
        func.call @stack_push_pointer(%246) : (i64) -> ()
        func.call @stack_push_pointer(%252) : (i64) -> ()
        func.call @stack_push_pointer(%263) : (i64) -> ()
        func.call @stack_push_pointer(%264) : (i64) -> ()
        func.call @stack_push_pointer(%275) : (i64) -> ()
        func.call @stack_push_pointer(%284) : (i64) -> ()
        %327 = llvm.mlir.addressof @str24 : !llvm.ptr
        %328 = func.call @cc_make_function_ref_const(%327) : (!llvm.ptr) -> i64
        %329 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%328, %329) : (i64, i64) -> ()
      }
      %330 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %330 : i64
    }
    %331 = func.call @cc_nil_value() : () -> i64
    %332 = func.call @cc_errorp(%195) : (i64) -> i64
    %333 = arith.cmpi ne, %332, %331 : i64
    %334 = scf.if %333 -> (i64) {
      scf.yield %195 : i64
    } else {
      %335 = llvm.mlir.addressof @str25 : !llvm.ptr
      %336 = arith.constant 13 : i64
      %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
      %338 = func.call @cc_nil_value() : () -> i64
      %339 = func.call @cc_intern(%337, %338) : (i64, i64) -> i64
      %340 = func.call @cc_nil_value() : () -> i64
      %341 = func.call @cc_cons(%339, %340) : (i64, i64) -> i64
      %342 = func.call @cc_values_pack(%341) : (i64) -> i64
      func.call @stack_push_pointer(%339) : (i64) -> ()
      %343 = func.call @stack_pop_pointer() : () -> i64
      %344 = llvm.mlir.addressof @str26 : !llvm.ptr
      %345 = arith.constant 4 : i64
      %346 = func.call @cc_make_string(%344, %345) : (!llvm.ptr, i64) -> i64
      %347 = func.call @cc_nil_value() : () -> i64
      %348 = func.call @cc_intern(%346, %347) : (i64, i64) -> i64
      %349 = func.call @cc_nil_value() : () -> i64
      %350 = func.call @cc_cons(%348, %349) : (i64, i64) -> i64
      %351 = func.call @cc_values_pack(%350) : (i64) -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      %352 = llvm.mlir.addressof @str27 : !llvm.ptr
      %353 = arith.constant 1 : i64
      %354 = func.call @cc_make_string(%352, %353) : (!llvm.ptr, i64) -> i64
      %355 = func.call @cc_nil_value() : () -> i64
      %356 = func.call @cc_intern(%354, %355) : (i64, i64) -> i64
      %357 = func.call @cc_nil_value() : () -> i64
      %358 = func.call @cc_cons(%356, %357) : (i64, i64) -> i64
      %359 = func.call @cc_values_pack(%358) : (i64) -> i64
      func.call @stack_push_pointer(%356) : (i64) -> ()
      %360 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%360) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %361 = func.call @stack_pop_pointer() : () -> i64
      %362 = func.call @stack_pop_pointer() : () -> i64
      %363 = func.call @cc_cons(%362, %361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%363) : (i64) -> ()
      %364 = func.call @stack_pop_pointer() : () -> i64
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @cc_cons(%365, %364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%366) : (i64) -> ()
      %367 = llvm.mlir.addressof @str28 : !llvm.ptr
      %368 = arith.constant 19 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = func.call @cc_nil_value() : () -> i64
      %371 = func.call @cc_intern(%369, %370) : (i64, i64) -> i64
      %372 = func.call @cc_nil_value() : () -> i64
      %373 = func.call @cc_cons(%371, %372) : (i64, i64) -> i64
      %374 = func.call @cc_values_pack(%373) : (i64) -> i64
      func.call @stack_push_pointer(%371) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %375 = func.call @stack_pop_pointer() : () -> i64
      %376 = func.call @stack_pop_pointer() : () -> i64
      %377 = func.call @cc_cons(%376, %375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%377) : (i64) -> ()
      %378 = func.call @stack_pop_pointer() : () -> i64
      %379 = func.call @stack_pop_pointer() : () -> i64
      %380 = func.call @cc_cons(%379, %378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%380) : (i64) -> ()
      %381 = llvm.mlir.addressof @str29 : !llvm.ptr
      %382 = arith.constant 1 : i64
      %383 = func.call @cc_make_string(%381, %382) : (!llvm.ptr, i64) -> i64
      %384 = func.call @cc_nil_value() : () -> i64
      %385 = func.call @cc_intern(%383, %384) : (i64, i64) -> i64
      %386 = func.call @cc_nil_value() : () -> i64
      %387 = func.call @cc_cons(%385, %386) : (i64, i64) -> i64
      %388 = func.call @cc_values_pack(%387) : (i64) -> i64
      func.call @stack_push_pointer(%385) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %389 = func.call @stack_pop_pointer() : () -> i64
      %390 = func.call @stack_pop_pointer() : () -> i64
      %391 = func.call @cc_cons(%390, %389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%391) : (i64) -> ()
      %392 = func.call @stack_pop_pointer() : () -> i64
      %393 = func.call @stack_pop_pointer() : () -> i64
      %394 = func.call @cc_cons(%393, %392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%394) : (i64) -> ()
      %395 = llvm.mlir.addressof @str30 : !llvm.ptr
      %396 = arith.constant 15 : i64
      %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
      %398 = func.call @cc_nil_value() : () -> i64
      %399 = func.call @cc_intern(%397, %398) : (i64, i64) -> i64
      %400 = func.call @cc_nil_value() : () -> i64
      %401 = func.call @cc_cons(%399, %400) : (i64, i64) -> i64
      %402 = func.call @cc_values_pack(%401) : (i64) -> i64
      func.call @stack_push_pointer(%399) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %403 = func.call @stack_pop_pointer() : () -> i64
      %404 = func.call @stack_pop_pointer() : () -> i64
      %405 = func.call @cc_cons(%404, %403) : (i64, i64) -> i64
      func.call @stack_push_pointer(%405) : (i64) -> ()
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = func.call @stack_pop_pointer() : () -> i64
      %408 = func.call @cc_cons(%407, %406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%408) : (i64) -> ()
      %409 = llvm.mlir.addressof @str31 : !llvm.ptr
      %410 = arith.constant 17 : i64
      %411 = func.call @cc_make_string(%409, %410) : (!llvm.ptr, i64) -> i64
      %412 = func.call @cc_nil_value() : () -> i64
      %413 = func.call @cc_intern(%411, %412) : (i64, i64) -> i64
      %414 = func.call @cc_nil_value() : () -> i64
      %415 = func.call @cc_cons(%413, %414) : (i64, i64) -> i64
      %416 = func.call @cc_values_pack(%415) : (i64) -> i64
      func.call @stack_push_pointer(%413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %417 = func.call @stack_pop_pointer() : () -> i64
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = func.call @cc_cons(%418, %417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%419) : (i64) -> ()
      %420 = func.call @stack_pop_pointer() : () -> i64
      %421 = func.call @stack_pop_pointer() : () -> i64
      %422 = func.call @cc_cons(%421, %420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @cc_cons(%424, %423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%425) : (i64) -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%427, %426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
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
      %438 = llvm.mlir.addressof @str32 : !llvm.ptr
      %439 = arith.constant 5 : i64
      %440 = func.call @cc_make_string(%438, %439) : (!llvm.ptr, i64) -> i64
      %441 = func.call @cc_nil_value() : () -> i64
      %442 = func.call @cc_intern(%440, %441) : (i64, i64) -> i64
      %443 = func.call @cc_nil_value() : () -> i64
      %444 = func.call @cc_cons(%442, %443) : (i64, i64) -> i64
      %445 = func.call @cc_values_pack(%444) : (i64) -> i64
      func.call @stack_push_pointer(%442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %446 = llvm.mlir.addressof @str33 : !llvm.ptr
      %447 = arith.constant 5 : i64
      %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
      %449 = llvm.mlir.addressof @str34 : !llvm.ptr
      %450 = arith.constant 3 : i64
      %451 = func.call @cc_make_string(%449, %450) : (!llvm.ptr, i64) -> i64
      %452 = func.call @cc_intern(%448, %451) : (i64, i64) -> i64
      %453 = func.call @cc_nil_value() : () -> i64
      %454 = func.call @cc_cons(%452, %453) : (i64, i64) -> i64
      %455 = func.call @cc_values_pack(%454) : (i64) -> i64
      func.call @stack_push_pointer(%452) : (i64) -> ()
      %456 = llvm.mlir.addressof @str35 : !llvm.ptr
      %457 = arith.constant 1 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = func.call @cc_nil_value() : () -> i64
      %460 = func.call @cc_intern(%458, %459) : (i64, i64) -> i64
      %461 = func.call @cc_nil_value() : () -> i64
      %462 = func.call @cc_cons(%460, %461) : (i64, i64) -> i64
      %463 = func.call @cc_values_pack(%462) : (i64) -> i64
      func.call @stack_push_pointer(%460) : (i64) -> ()
      %464 = llvm.mlir.addressof @str36 : !llvm.ptr
      %465 = arith.constant 1 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_intern(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_cons(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_values_pack(%470) : (i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %472 = llvm.mlir.addressof @str37 : !llvm.ptr
      %473 = arith.constant 15 : i64
      %474 = func.call @cc_make_string(%472, %473) : (!llvm.ptr, i64) -> i64
      %475 = llvm.mlir.addressof @str38 : !llvm.ptr
      %476 = arith.constant 11 : i64
      %477 = func.call @cc_make_string(%475, %476) : (!llvm.ptr, i64) -> i64
      %478 = func.call @cc_intern(%474, %477) : (i64, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_values_pack(%480) : (i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = func.call @cc_cons(%483, %482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%484) : (i64) -> ()
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @stack_pop_pointer() : () -> i64
      %487 = func.call @cc_cons(%486, %485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%487) : (i64) -> ()
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @stack_pop_pointer() : () -> i64
      %490 = func.call @cc_cons(%489, %488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%490) : (i64) -> ()
      %491 = llvm.mlir.addressof @str39 : !llvm.ptr
      %492 = arith.constant 4 : i64
      %493 = func.call @cc_make_string(%491, %492) : (!llvm.ptr, i64) -> i64
      %494 = func.call @cc_nil_value() : () -> i64
      %495 = func.call @cc_intern(%493, %494) : (i64, i64) -> i64
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
      %498 = func.call @cc_values_pack(%497) : (i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      %499 = llvm.mlir.addressof @str40 : !llvm.ptr
      %500 = arith.constant 17 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = func.call @cc_nil_value() : () -> i64
      %503 = func.call @cc_intern(%501, %502) : (i64, i64) -> i64
      %504 = func.call @cc_nil_value() : () -> i64
      %505 = func.call @cc_cons(%503, %504) : (i64, i64) -> i64
      %506 = func.call @cc_values_pack(%505) : (i64) -> i64
      func.call @stack_push_pointer(%503) : (i64) -> ()
      %507 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%507) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %508 = func.call @stack_pop_pointer() : () -> i64
      %509 = func.call @stack_pop_pointer() : () -> i64
      %510 = func.call @cc_cons(%509, %508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%510) : (i64) -> ()
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @stack_pop_pointer() : () -> i64
      %513 = func.call @cc_cons(%512, %511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%513) : (i64) -> ()
      %514 = func.call @stack_pop_pointer() : () -> i64
      %515 = func.call @stack_pop_pointer() : () -> i64
      %516 = func.call @cc_cons(%515, %514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%516) : (i64) -> ()
      %517 = llvm.mlir.addressof @str41 : !llvm.ptr
      %518 = arith.constant 4 : i64
      %519 = func.call @cc_make_string(%517, %518) : (!llvm.ptr, i64) -> i64
      %520 = func.call @cc_nil_value() : () -> i64
      %521 = func.call @cc_intern(%519, %520) : (i64, i64) -> i64
      %522 = func.call @cc_nil_value() : () -> i64
      %523 = func.call @cc_cons(%521, %522) : (i64, i64) -> i64
      %524 = func.call @cc_values_pack(%523) : (i64) -> i64
      func.call @stack_push_pointer(%521) : (i64) -> ()
      %525 = llvm.mlir.addressof @str42 : !llvm.ptr
      %526 = arith.constant 19 : i64
      %527 = func.call @cc_make_string(%525, %526) : (!llvm.ptr, i64) -> i64
      %528 = func.call @cc_nil_value() : () -> i64
      %529 = func.call @cc_intern(%527, %528) : (i64, i64) -> i64
      %530 = func.call @cc_nil_value() : () -> i64
      %531 = func.call @cc_cons(%529, %530) : (i64, i64) -> i64
      %532 = func.call @cc_values_pack(%531) : (i64) -> i64
      func.call @stack_push_pointer(%529) : (i64) -> ()
      %533 = llvm.mlir.addressof @str43 : !llvm.ptr
      %534 = arith.constant 1 : i64
      %535 = func.call @cc_make_string(%533, %534) : (!llvm.ptr, i64) -> i64
      %536 = func.call @cc_nil_value() : () -> i64
      %537 = func.call @cc_intern(%535, %536) : (i64, i64) -> i64
      %538 = func.call @cc_nil_value() : () -> i64
      %539 = func.call @cc_cons(%537, %538) : (i64, i64) -> i64
      %540 = func.call @cc_values_pack(%539) : (i64) -> i64
      func.call @stack_push_pointer(%537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %541 = func.call @stack_pop_pointer() : () -> i64
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @cc_cons(%542, %541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%543) : (i64) -> ()
      %544 = func.call @stack_pop_pointer() : () -> i64
      %545 = func.call @stack_pop_pointer() : () -> i64
      %546 = func.call @cc_cons(%545, %544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      %547 = func.call @stack_pop_pointer() : () -> i64
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @cc_cons(%548, %547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%549) : (i64) -> ()
      %550 = llvm.mlir.addressof @str44 : !llvm.ptr
      %551 = arith.constant 4 : i64
      %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
      %553 = func.call @cc_nil_value() : () -> i64
      %554 = func.call @cc_intern(%552, %553) : (i64, i64) -> i64
      %555 = func.call @cc_nil_value() : () -> i64
      %556 = func.call @cc_cons(%554, %555) : (i64, i64) -> i64
      %557 = func.call @cc_values_pack(%556) : (i64) -> i64
      func.call @stack_push_pointer(%554) : (i64) -> ()
      %558 = llvm.mlir.addressof @str45 : !llvm.ptr
      %559 = arith.constant 1 : i64
      %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
      %561 = func.call @cc_nil_value() : () -> i64
      %562 = func.call @cc_intern(%560, %561) : (i64, i64) -> i64
      %563 = func.call @cc_nil_value() : () -> i64
      %564 = func.call @cc_cons(%562, %563) : (i64, i64) -> i64
      %565 = func.call @cc_values_pack(%564) : (i64) -> i64
      func.call @stack_push_pointer(%562) : (i64) -> ()
      %566 = llvm.mlir.addressof @str46 : !llvm.ptr
      %567 = arith.constant 9 : i64
      %568 = func.call @cc_make_string(%566, %567) : (!llvm.ptr, i64) -> i64
      %569 = llvm.mlir.addressof @str47 : !llvm.ptr
      %570 = arith.constant 11 : i64
      %571 = func.call @cc_make_string(%569, %570) : (!llvm.ptr, i64) -> i64
      %572 = func.call @cc_intern(%568, %571) : (i64, i64) -> i64
      %573 = func.call @cc_nil_value() : () -> i64
      %574 = func.call @cc_cons(%572, %573) : (i64, i64) -> i64
      %575 = func.call @cc_values_pack(%574) : (i64) -> i64
      func.call @stack_push_pointer(%572) : (i64) -> ()
      %576 = llvm.mlir.addressof @str48 : !llvm.ptr
      %577 = arith.constant 1 : i64
      %578 = func.call @cc_make_string(%576, %577) : (!llvm.ptr, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_intern(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_nil_value() : () -> i64
      %582 = func.call @cc_cons(%580, %581) : (i64, i64) -> i64
      %583 = func.call @cc_values_pack(%582) : (i64) -> i64
      func.call @stack_push_pointer(%580) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %584 = func.call @stack_pop_pointer() : () -> i64
      %585 = func.call @stack_pop_pointer() : () -> i64
      %586 = func.call @cc_cons(%585, %584) : (i64, i64) -> i64
      func.call @stack_push_pointer(%586) : (i64) -> ()
      %587 = func.call @stack_pop_pointer() : () -> i64
      %588 = func.call @stack_pop_pointer() : () -> i64
      %589 = func.call @cc_cons(%588, %587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%589) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %590 = func.call @stack_pop_pointer() : () -> i64
      %591 = func.call @stack_pop_pointer() : () -> i64
      %592 = func.call @cc_cons(%591, %590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%592) : (i64) -> ()
      %593 = func.call @stack_pop_pointer() : () -> i64
      %594 = func.call @stack_pop_pointer() : () -> i64
      %595 = func.call @cc_cons(%594, %593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%595) : (i64) -> ()
      %596 = func.call @stack_pop_pointer() : () -> i64
      %597 = func.call @stack_pop_pointer() : () -> i64
      %598 = func.call @cc_cons(%597, %596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      %599 = llvm.mlir.addressof @str49 : !llvm.ptr
      %600 = arith.constant 2 : i64
      %601 = func.call @cc_make_string(%599, %600) : (!llvm.ptr, i64) -> i64
      %602 = func.call @cc_nil_value() : () -> i64
      %603 = func.call @cc_intern(%601, %602) : (i64, i64) -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      %605 = func.call @cc_cons(%603, %604) : (i64, i64) -> i64
      %606 = func.call @cc_values_pack(%605) : (i64) -> i64
      func.call @stack_push_pointer(%603) : (i64) -> ()
      %607 = llvm.mlir.addressof @str50 : !llvm.ptr
      %608 = arith.constant 3 : i64
      %609 = func.call @cc_make_string(%607, %608) : (!llvm.ptr, i64) -> i64
      %610 = func.call @cc_nil_value() : () -> i64
      %611 = func.call @cc_intern(%609, %610) : (i64, i64) -> i64
      %612 = func.call @cc_nil_value() : () -> i64
      %613 = func.call @cc_cons(%611, %612) : (i64, i64) -> i64
      %614 = func.call @cc_values_pack(%613) : (i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %615 = llvm.mlir.addressof @str51 : !llvm.ptr
      %616 = arith.constant 2 : i64
      %617 = func.call @cc_make_string(%615, %616) : (!llvm.ptr, i64) -> i64
      %618 = llvm.mlir.addressof @str52 : !llvm.ptr
      %619 = arith.constant 11 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = func.call @cc_intern(%617, %620) : (i64, i64) -> i64
      %622 = func.call @cc_nil_value() : () -> i64
      %623 = func.call @cc_cons(%621, %622) : (i64, i64) -> i64
      %624 = func.call @cc_values_pack(%623) : (i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      %625 = llvm.mlir.addressof @str53 : !llvm.ptr
      %626 = arith.constant 3 : i64
      %627 = func.call @cc_make_string(%625, %626) : (!llvm.ptr, i64) -> i64
      %628 = llvm.mlir.addressof @str54 : !llvm.ptr
      %629 = arith.constant 11 : i64
      %630 = func.call @cc_make_string(%628, %629) : (!llvm.ptr, i64) -> i64
      %631 = func.call @cc_intern(%627, %630) : (i64, i64) -> i64
      %632 = func.call @cc_nil_value() : () -> i64
      %633 = func.call @cc_cons(%631, %632) : (i64, i64) -> i64
      %634 = func.call @cc_values_pack(%633) : (i64) -> i64
      func.call @stack_push_pointer(%631) : (i64) -> ()
      %635 = llvm.mlir.addressof @str55 : !llvm.ptr
      %636 = arith.constant 1 : i64
      %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
      %638 = func.call @cc_nil_value() : () -> i64
      %639 = func.call @cc_intern(%637, %638) : (i64, i64) -> i64
      %640 = func.call @cc_nil_value() : () -> i64
      %641 = func.call @cc_cons(%639, %640) : (i64, i64) -> i64
      %642 = func.call @cc_values_pack(%641) : (i64) -> i64
      func.call @stack_push_pointer(%639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @stack_pop_pointer() : () -> i64
      %645 = func.call @cc_cons(%644, %643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%645) : (i64) -> ()
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = func.call @stack_pop_pointer() : () -> i64
      %648 = func.call @cc_cons(%647, %646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%648) : (i64) -> ()
      %649 = llvm.mlir.addressof @str56 : !llvm.ptr
      %650 = arith.constant 3 : i64
      %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_intern(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_nil_value() : () -> i64
      %655 = func.call @cc_cons(%653, %654) : (i64, i64) -> i64
      %656 = func.call @cc_values_pack(%655) : (i64) -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
      %657 = llvm.mlir.addressof @str57 : !llvm.ptr
      %658 = arith.constant 1 : i64
      %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
      %660 = func.call @cc_nil_value() : () -> i64
      %661 = func.call @cc_intern(%659, %660) : (i64, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_values_pack(%663) : (i64) -> i64
      func.call @stack_push_pointer(%661) : (i64) -> ()
      %665 = llvm.mlir.addressof @str58 : !llvm.ptr
      %666 = arith.constant 11 : i64
      %667 = func.call @cc_make_string(%665, %666) : (!llvm.ptr, i64) -> i64
      %668 = llvm.mlir.addressof @str59 : !llvm.ptr
      %669 = arith.constant 11 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = func.call @cc_intern(%667, %670) : (i64, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_values_pack(%673) : (i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %675 = llvm.mlir.addressof @str60 : !llvm.ptr
      %676 = arith.constant 1 : i64
      %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_intern(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @stack_pop_pointer() : () -> i64
      %685 = func.call @cc_cons(%684, %683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @stack_pop_pointer() : () -> i64
      %688 = func.call @cc_cons(%687, %686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%688) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %689 = func.call @stack_pop_pointer() : () -> i64
      %690 = func.call @stack_pop_pointer() : () -> i64
      %691 = func.call @cc_cons(%690, %689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%691) : (i64) -> ()
      %692 = func.call @stack_pop_pointer() : () -> i64
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @cc_cons(%693, %692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %695 = func.call @stack_pop_pointer() : () -> i64
      %696 = func.call @stack_pop_pointer() : () -> i64
      %697 = func.call @cc_cons(%696, %695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%697) : (i64) -> ()
      %698 = llvm.mlir.addressof @str61 : !llvm.ptr
      %699 = arith.constant 3 : i64
      %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
      %701 = llvm.mlir.addressof @str62 : !llvm.ptr
      %702 = arith.constant 11 : i64
      %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
      %704 = func.call @cc_intern(%700, %703) : (i64, i64) -> i64
      %705 = func.call @cc_nil_value() : () -> i64
      %706 = func.call @cc_cons(%704, %705) : (i64, i64) -> i64
      %707 = func.call @cc_values_pack(%706) : (i64) -> i64
      func.call @stack_push_pointer(%704) : (i64) -> ()
      %708 = llvm.mlir.addressof @str63 : !llvm.ptr
      %709 = arith.constant 2 : i64
      %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
      %711 = llvm.mlir.addressof @str64 : !llvm.ptr
      %712 = arith.constant 11 : i64
      %713 = func.call @cc_make_string(%711, %712) : (!llvm.ptr, i64) -> i64
      %714 = func.call @cc_intern(%710, %713) : (i64, i64) -> i64
      %715 = func.call @cc_nil_value() : () -> i64
      %716 = func.call @cc_cons(%714, %715) : (i64, i64) -> i64
      %717 = func.call @cc_values_pack(%716) : (i64) -> i64
      func.call @stack_push_pointer(%714) : (i64) -> ()
      %718 = llvm.mlir.addressof @str65 : !llvm.ptr
      %719 = arith.constant 12 : i64
      %720 = func.call @cc_make_string(%718, %719) : (!llvm.ptr, i64) -> i64
      %721 = llvm.mlir.addressof @str66 : !llvm.ptr
      %722 = arith.constant 11 : i64
      %723 = func.call @cc_make_string(%721, %722) : (!llvm.ptr, i64) -> i64
      %724 = func.call @cc_intern(%720, %723) : (i64, i64) -> i64
      %725 = func.call @cc_nil_value() : () -> i64
      %726 = func.call @cc_cons(%724, %725) : (i64, i64) -> i64
      %727 = func.call @cc_values_pack(%726) : (i64) -> i64
      func.call @stack_push_pointer(%724) : (i64) -> ()
      %728 = llvm.mlir.addressof @str67 : !llvm.ptr
      %729 = arith.constant 1 : i64
      %730 = func.call @cc_make_string(%728, %729) : (!llvm.ptr, i64) -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_intern(%730, %731) : (i64, i64) -> i64
      %733 = func.call @cc_nil_value() : () -> i64
      %734 = func.call @cc_cons(%732, %733) : (i64, i64) -> i64
      %735 = func.call @cc_values_pack(%734) : (i64) -> i64
      func.call @stack_push_pointer(%732) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %736 = func.call @stack_pop_pointer() : () -> i64
      %737 = func.call @stack_pop_pointer() : () -> i64
      %738 = func.call @cc_cons(%737, %736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%738) : (i64) -> ()
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @cc_cons(%740, %739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%741) : (i64) -> ()
      %742 = llvm.mlir.addressof @str68 : !llvm.ptr
      %743 = arith.constant 5 : i64
      %744 = func.call @cc_make_string(%742, %743) : (!llvm.ptr, i64) -> i64
      %745 = llvm.mlir.addressof @str69 : !llvm.ptr
      %746 = arith.constant 11 : i64
      %747 = func.call @cc_make_string(%745, %746) : (!llvm.ptr, i64) -> i64
      %748 = func.call @cc_intern(%744, %747) : (i64, i64) -> i64
      %749 = func.call @cc_nil_value() : () -> i64
      %750 = func.call @cc_cons(%748, %749) : (i64, i64) -> i64
      %751 = func.call @cc_values_pack(%750) : (i64) -> i64
      func.call @stack_push_pointer(%748) : (i64) -> ()
      %752 = llvm.mlir.addressof @str70 : !llvm.ptr
      %753 = arith.constant 1 : i64
      %754 = func.call @cc_make_string(%752, %753) : (!llvm.ptr, i64) -> i64
      %755 = func.call @cc_nil_value() : () -> i64
      %756 = func.call @cc_intern(%754, %755) : (i64, i64) -> i64
      %757 = func.call @cc_nil_value() : () -> i64
      %758 = func.call @cc_cons(%756, %757) : (i64, i64) -> i64
      %759 = func.call @cc_values_pack(%758) : (i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      %760 = llvm.mlir.addressof @str71 : !llvm.ptr
      %761 = arith.constant 1 : i64
      %762 = func.call @cc_make_string(%760, %761) : (!llvm.ptr, i64) -> i64
      %763 = func.call @cc_nil_value() : () -> i64
      %764 = func.call @cc_intern(%762, %763) : (i64, i64) -> i64
      %765 = func.call @cc_nil_value() : () -> i64
      %766 = func.call @cc_cons(%764, %765) : (i64, i64) -> i64
      %767 = func.call @cc_values_pack(%766) : (i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %768 = func.call @stack_pop_pointer() : () -> i64
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @cc_cons(%769, %768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%770) : (i64) -> ()
      %771 = func.call @stack_pop_pointer() : () -> i64
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @cc_cons(%772, %771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%773) : (i64) -> ()
      %774 = func.call @stack_pop_pointer() : () -> i64
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = func.call @cc_cons(%775, %774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%776) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %777 = func.call @stack_pop_pointer() : () -> i64
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = func.call @cc_cons(%778, %777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%779) : (i64) -> ()
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @stack_pop_pointer() : () -> i64
      %782 = func.call @cc_cons(%781, %780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%782) : (i64) -> ()
      %783 = func.call @stack_pop_pointer() : () -> i64
      %784 = func.call @stack_pop_pointer() : () -> i64
      %785 = func.call @cc_cons(%784, %783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%785) : (i64) -> ()
      %786 = llvm.mlir.addressof @str72 : !llvm.ptr
      %787 = arith.constant 5 : i64
      %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
      %789 = llvm.mlir.addressof @str73 : !llvm.ptr
      %790 = arith.constant 11 : i64
      %791 = func.call @cc_make_string(%789, %790) : (!llvm.ptr, i64) -> i64
      %792 = func.call @cc_intern(%788, %791) : (i64, i64) -> i64
      %793 = func.call @cc_nil_value() : () -> i64
      %794 = func.call @cc_cons(%792, %793) : (i64, i64) -> i64
      %795 = func.call @cc_values_pack(%794) : (i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %796 = llvm.mlir.addressof @str74 : !llvm.ptr
      %797 = arith.constant 1 : i64
      %798 = func.call @cc_make_string(%796, %797) : (!llvm.ptr, i64) -> i64
      %799 = func.call @cc_nil_value() : () -> i64
      %800 = func.call @cc_intern(%798, %799) : (i64, i64) -> i64
      %801 = func.call @cc_nil_value() : () -> i64
      %802 = func.call @cc_cons(%800, %801) : (i64, i64) -> i64
      %803 = func.call @cc_values_pack(%802) : (i64) -> i64
      func.call @stack_push_pointer(%800) : (i64) -> ()
      %804 = llvm.mlir.addressof @str75 : !llvm.ptr
      %805 = arith.constant 11 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = llvm.mlir.addressof @str76 : !llvm.ptr
      %808 = arith.constant 11 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = func.call @cc_intern(%806, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      func.call @stack_push_pointer(%810) : (i64) -> ()
      %814 = llvm.mlir.addressof @str77 : !llvm.ptr
      %815 = arith.constant 1 : i64
      %816 = func.call @cc_make_string(%814, %815) : (!llvm.ptr, i64) -> i64
      %817 = func.call @cc_nil_value() : () -> i64
      %818 = func.call @cc_intern(%816, %817) : (i64, i64) -> i64
      %819 = func.call @cc_nil_value() : () -> i64
      %820 = func.call @cc_cons(%818, %819) : (i64, i64) -> i64
      %821 = func.call @cc_values_pack(%820) : (i64) -> i64
      func.call @stack_push_pointer(%818) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @cc_cons(%823, %822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%824) : (i64) -> ()
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = func.call @stack_pop_pointer() : () -> i64
      %827 = func.call @cc_cons(%826, %825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%827) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @stack_pop_pointer() : () -> i64
      %830 = func.call @cc_cons(%829, %828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%830) : (i64) -> ()
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = func.call @stack_pop_pointer() : () -> i64
      %833 = func.call @cc_cons(%832, %831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%833) : (i64) -> ()
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @stack_pop_pointer() : () -> i64
      %836 = func.call @cc_cons(%835, %834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%836) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = func.call @cc_cons(%838, %837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%839) : (i64) -> ()
      %840 = func.call @stack_pop_pointer() : () -> i64
      %841 = func.call @stack_pop_pointer() : () -> i64
      %842 = func.call @cc_cons(%841, %840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%842) : (i64) -> ()
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @stack_pop_pointer() : () -> i64
      %845 = func.call @cc_cons(%844, %843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = func.call @cc_cons(%847, %846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%848) : (i64) -> ()
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @cc_cons(%850, %849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%851) : (i64) -> ()
      %852 = func.call @stack_pop_pointer() : () -> i64
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @cc_cons(%853, %852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%854) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %855 = func.call @stack_pop_pointer() : () -> i64
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @cc_cons(%856, %855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%857) : (i64) -> ()
      %858 = func.call @stack_pop_pointer() : () -> i64
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @cc_cons(%859, %858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%860) : (i64) -> ()
      %861 = func.call @stack_pop_pointer() : () -> i64
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @cc_cons(%862, %861) : (i64, i64) -> i64
      func.call @stack_push_pointer(%863) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %864 = func.call @stack_pop_pointer() : () -> i64
      %865 = func.call @stack_pop_pointer() : () -> i64
      %866 = func.call @cc_cons(%865, %864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%866) : (i64) -> ()
      %867 = func.call @stack_pop_pointer() : () -> i64
      %868 = func.call @stack_pop_pointer() : () -> i64
      %869 = func.call @cc_cons(%868, %867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%869) : (i64) -> ()
      %870 = llvm.mlir.addressof @str78 : !llvm.ptr
      %871 = arith.constant 5 : i64
      %872 = func.call @cc_make_string(%870, %871) : (!llvm.ptr, i64) -> i64
      %873 = func.call @cc_nil_value() : () -> i64
      %874 = func.call @cc_intern(%872, %873) : (i64, i64) -> i64
      %875 = func.call @cc_nil_value() : () -> i64
      %876 = func.call @cc_cons(%874, %875) : (i64, i64) -> i64
      %877 = func.call @cc_values_pack(%876) : (i64) -> i64
      func.call @stack_push_pointer(%874) : (i64) -> ()
      %878 = llvm.mlir.addressof @str79 : !llvm.ptr
      %879 = arith.constant 4 : i64
      %880 = func.call @cc_make_string(%878, %879) : (!llvm.ptr, i64) -> i64
      %881 = func.call @cc_nil_value() : () -> i64
      %882 = func.call @cc_intern(%880, %881) : (i64, i64) -> i64
      %883 = func.call @cc_nil_value() : () -> i64
      %884 = func.call @cc_cons(%882, %883) : (i64, i64) -> i64
      %885 = func.call @cc_values_pack(%884) : (i64) -> i64
      func.call @stack_push_pointer(%882) : (i64) -> ()
      %886 = llvm.mlir.addressof @str80 : !llvm.ptr
      %887 = arith.constant 15 : i64
      %888 = func.call @cc_make_string(%886, %887) : (!llvm.ptr, i64) -> i64
      %889 = func.call @cc_nil_value() : () -> i64
      %890 = func.call @cc_intern(%888, %889) : (i64, i64) -> i64
      %891 = func.call @cc_nil_value() : () -> i64
      %892 = func.call @cc_cons(%890, %891) : (i64, i64) -> i64
      %893 = func.call @cc_values_pack(%892) : (i64) -> i64
      func.call @stack_push_pointer(%890) : (i64) -> ()
      %894 = llvm.mlir.addressof @str81 : !llvm.ptr
      %895 = arith.constant 6 : i64
      %896 = func.call @cc_make_string(%894, %895) : (!llvm.ptr, i64) -> i64
      %897 = func.call @cc_nil_value() : () -> i64
      %898 = func.call @cc_intern(%896, %897) : (i64, i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
      %901 = func.call @cc_values_pack(%900) : (i64) -> i64
      func.call @stack_push_pointer(%898) : (i64) -> ()
      %902 = llvm.mlir.addressof @str82 : !llvm.ptr
      %903 = arith.constant 15 : i64
      %904 = func.call @cc_make_string(%902, %903) : (!llvm.ptr, i64) -> i64
      %905 = func.call @cc_nil_value() : () -> i64
      %906 = func.call @cc_intern(%904, %905) : (i64, i64) -> i64
      %907 = func.call @cc_nil_value() : () -> i64
      %908 = func.call @cc_cons(%906, %907) : (i64, i64) -> i64
      %909 = func.call @cc_values_pack(%908) : (i64) -> i64
      func.call @stack_push_pointer(%906) : (i64) -> ()
      %910 = llvm.mlir.addressof @str83 : !llvm.ptr
      %911 = arith.constant 4 : i64
      %912 = func.call @cc_make_string(%910, %911) : (!llvm.ptr, i64) -> i64
      %913 = func.call @cc_nil_value() : () -> i64
      %914 = func.call @cc_intern(%912, %913) : (i64, i64) -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      %917 = func.call @cc_values_pack(%916) : (i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %918 = llvm.mlir.addressof @str84 : !llvm.ptr
      %919 = arith.constant 4 : i64
      %920 = func.call @cc_make_string(%918, %919) : (!llvm.ptr, i64) -> i64
      %921 = llvm.mlir.addressof @str85 : !llvm.ptr
      %922 = arith.constant 11 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = func.call @cc_intern(%920, %923) : (i64, i64) -> i64
      %925 = func.call @cc_nil_value() : () -> i64
      %926 = func.call @cc_cons(%924, %925) : (i64, i64) -> i64
      %927 = func.call @cc_values_pack(%926) : (i64) -> i64
      func.call @stack_push_pointer(%924) : (i64) -> ()
      %928 = llvm.mlir.addressof @str86 : !llvm.ptr
      %929 = arith.constant 1 : i64
      %930 = func.call @cc_make_string(%928, %929) : (!llvm.ptr, i64) -> i64
      %931 = func.call @cc_nil_value() : () -> i64
      %932 = func.call @cc_intern(%930, %931) : (i64, i64) -> i64
      %933 = func.call @cc_nil_value() : () -> i64
      %934 = func.call @cc_cons(%932, %933) : (i64, i64) -> i64
      %935 = func.call @cc_values_pack(%934) : (i64) -> i64
      func.call @stack_push_pointer(%932) : (i64) -> ()
      %936 = llvm.mlir.addressof @str87 : !llvm.ptr
      %937 = arith.constant 9 : i64
      %938 = func.call @cc_make_string(%936, %937) : (!llvm.ptr, i64) -> i64
      %939 = llvm.mlir.addressof @str88 : !llvm.ptr
      %940 = arith.constant 11 : i64
      %941 = func.call @cc_make_string(%939, %940) : (!llvm.ptr, i64) -> i64
      %942 = func.call @cc_intern(%938, %941) : (i64, i64) -> i64
      %943 = func.call @cc_nil_value() : () -> i64
      %944 = func.call @cc_cons(%942, %943) : (i64, i64) -> i64
      %945 = func.call @cc_values_pack(%944) : (i64) -> i64
      func.call @stack_push_pointer(%942) : (i64) -> ()
      %946 = llvm.mlir.addressof @str89 : !llvm.ptr
      %947 = arith.constant 1 : i64
      %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
      %949 = func.call @cc_nil_value() : () -> i64
      %950 = func.call @cc_intern(%948, %949) : (i64, i64) -> i64
      %951 = func.call @cc_nil_value() : () -> i64
      %952 = func.call @cc_cons(%950, %951) : (i64, i64) -> i64
      %953 = func.call @cc_values_pack(%952) : (i64) -> i64
      func.call @stack_push_pointer(%950) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %954 = func.call @stack_pop_pointer() : () -> i64
      %955 = func.call @stack_pop_pointer() : () -> i64
      %956 = func.call @cc_cons(%955, %954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%956) : (i64) -> ()
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @stack_pop_pointer() : () -> i64
      %959 = func.call @cc_cons(%958, %957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%959) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = func.call @stack_pop_pointer() : () -> i64
      %962 = func.call @cc_cons(%961, %960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%962) : (i64) -> ()
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
      %972 = func.call @stack_pop_pointer() : () -> i64
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @cc_cons(%973, %972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %975 = func.call @stack_pop_pointer() : () -> i64
      %976 = func.call @stack_pop_pointer() : () -> i64
      %977 = func.call @cc_cons(%976, %975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%977) : (i64) -> ()
      %978 = func.call @stack_pop_pointer() : () -> i64
      %979 = func.call @stack_pop_pointer() : () -> i64
      %980 = func.call @cc_cons(%979, %978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%980) : (i64) -> ()
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @stack_pop_pointer() : () -> i64
      %983 = func.call @cc_cons(%982, %981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%983) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %984 = func.call @stack_pop_pointer() : () -> i64
      %985 = func.call @stack_pop_pointer() : () -> i64
      %986 = func.call @cc_cons(%985, %984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      %987 = func.call @stack_pop_pointer() : () -> i64
      %988 = func.call @stack_pop_pointer() : () -> i64
      %989 = func.call @cc_cons(%988, %987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%989) : (i64) -> ()
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @stack_pop_pointer() : () -> i64
      %992 = func.call @cc_cons(%991, %990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %993 = func.call @stack_pop_pointer() : () -> i64
      %994 = func.call @stack_pop_pointer() : () -> i64
      %995 = func.call @cc_cons(%994, %993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%995) : (i64) -> ()
      %996 = func.call @stack_pop_pointer() : () -> i64
      %997 = func.call @stack_pop_pointer() : () -> i64
      %998 = func.call @cc_cons(%997, %996) : (i64, i64) -> i64
      func.call @stack_push_pointer(%998) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %999 = func.call @stack_pop_pointer() : () -> i64
      %1000 = func.call @stack_pop_pointer() : () -> i64
      %1001 = func.call @cc_cons(%1000, %999) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1001) : (i64) -> ()
      %1002 = func.call @stack_pop_pointer() : () -> i64
      %1003 = func.call @stack_pop_pointer() : () -> i64
      %1004 = func.call @cc_cons(%1003, %1002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1004) : (i64) -> ()
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = func.call @stack_pop_pointer() : () -> i64
      %1007 = func.call @cc_cons(%1006, %1005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1007) : (i64) -> ()
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @stack_pop_pointer() : () -> i64
      %1010 = func.call @cc_cons(%1009, %1008) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1011 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1012 = arith.constant 4 : i64
      %1013 = func.call @cc_make_string(%1011, %1012) : (!llvm.ptr, i64) -> i64
      %1014 = func.call @cc_nil_value() : () -> i64
      %1015 = func.call @cc_intern(%1013, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_cons(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_values_pack(%1017) : (i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1019 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1020 = arith.constant 1 : i64
      %1021 = func.call @cc_make_string(%1019, %1020) : (!llvm.ptr, i64) -> i64
      %1022 = func.call @cc_nil_value() : () -> i64
      %1023 = func.call @cc_intern(%1021, %1022) : (i64, i64) -> i64
      %1024 = func.call @cc_nil_value() : () -> i64
      %1025 = func.call @cc_cons(%1023, %1024) : (i64, i64) -> i64
      %1026 = func.call @cc_values_pack(%1025) : (i64) -> i64
      func.call @stack_push_pointer(%1023) : (i64) -> ()
      %1027 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1028 = arith.constant 1 : i64
      %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
      %1030 = func.call @cc_nil_value() : () -> i64
      %1031 = func.call @cc_intern(%1029, %1030) : (i64, i64) -> i64
      %1032 = func.call @cc_nil_value() : () -> i64
      %1033 = func.call @cc_cons(%1031, %1032) : (i64, i64) -> i64
      %1034 = func.call @cc_values_pack(%1033) : (i64) -> i64
      func.call @stack_push_pointer(%1031) : (i64) -> ()
      %1035 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1036 = arith.constant 1 : i64
      %1037 = func.call @cc_make_string(%1035, %1036) : (!llvm.ptr, i64) -> i64
      %1038 = func.call @cc_nil_value() : () -> i64
      %1039 = func.call @cc_intern(%1037, %1038) : (i64, i64) -> i64
      %1040 = func.call @cc_nil_value() : () -> i64
      %1041 = func.call @cc_cons(%1039, %1040) : (i64, i64) -> i64
      %1042 = func.call @cc_values_pack(%1041) : (i64) -> i64
      func.call @stack_push_pointer(%1039) : (i64) -> ()
      %1043 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1043) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1044 = func.call @stack_pop_pointer() : () -> i64
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @cc_cons(%1045, %1044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @cc_cons(%1048, %1047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1049) : (i64) -> ()
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @cc_cons(%1051, %1050) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1052) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1053 = func.call @stack_pop_pointer() : () -> i64
      %1054 = func.call @stack_pop_pointer() : () -> i64
      %1055 = func.call @cc_cons(%1054, %1053) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @cc_cons(%1057, %1056) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1058) : (i64) -> ()
      %1059 = func.call @stack_pop_pointer() : () -> i64
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @cc_cons(%1060, %1059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1061) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @cc_cons(%1063, %1062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @cc_cons(%1066, %1065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1067) : (i64) -> ()
      %1068 = func.call @stack_pop_pointer() : () -> i64
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1070 = func.call @cc_cons(%1069, %1068) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1070) : (i64) -> ()
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @stack_pop_pointer() : () -> i64
      %1073 = func.call @cc_cons(%1072, %1071) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1073) : (i64) -> ()
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @stack_pop_pointer() : () -> i64
      %1076 = func.call @cc_cons(%1075, %1074) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1076) : (i64) -> ()
      %1077 = func.call @stack_pop_pointer() : () -> i64
      %1078 = func.call @stack_pop_pointer() : () -> i64
      %1079 = func.call @cc_cons(%1078, %1077) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      %1080 = func.call @stack_pop_pointer() : () -> i64
      %1081 = func.call @stack_pop_pointer() : () -> i64
      %1082 = func.call @cc_cons(%1081, %1080) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1082) : (i64) -> ()
      %1083 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1084 = arith.constant 2 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_intern(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_cons(%1087, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_values_pack(%1089) : (i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      %1091 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1092 = arith.constant 17 : i64
      %1093 = func.call @cc_make_string(%1091, %1092) : (!llvm.ptr, i64) -> i64
      %1094 = func.call @cc_nil_value() : () -> i64
      %1095 = func.call @cc_intern(%1093, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = func.call @cc_cons(%1095, %1096) : (i64, i64) -> i64
      %1098 = func.call @cc_values_pack(%1097) : (i64) -> i64
      func.call @stack_push_pointer(%1095) : (i64) -> ()
      %1099 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1100 = arith.constant 5 : i64
      %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
      %1102 = func.call @cc_nil_value() : () -> i64
      %1103 = func.call @cc_intern(%1101, %1102) : (i64, i64) -> i64
      %1104 = func.call @cc_nil_value() : () -> i64
      %1105 = func.call @cc_cons(%1103, %1104) : (i64, i64) -> i64
      %1106 = func.call @cc_values_pack(%1105) : (i64) -> i64
      func.call @stack_push_pointer(%1103) : (i64) -> ()
      %1107 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1108 = arith.constant 4 : i64
      %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
      %1110 = func.call @cc_nil_value() : () -> i64
      %1111 = func.call @cc_intern(%1109, %1110) : (i64, i64) -> i64
      %1112 = func.call @cc_nil_value() : () -> i64
      %1113 = func.call @cc_cons(%1111, %1112) : (i64, i64) -> i64
      %1114 = func.call @cc_values_pack(%1113) : (i64) -> i64
      func.call @stack_push_pointer(%1111) : (i64) -> ()
      %1115 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1116 = arith.constant 1 : i64
      %1117 = func.call @cc_make_string(%1115, %1116) : (!llvm.ptr, i64) -> i64
      %1118 = func.call @cc_nil_value() : () -> i64
      %1119 = func.call @cc_intern(%1117, %1118) : (i64, i64) -> i64
      %1120 = func.call @cc_nil_value() : () -> i64
      %1121 = func.call @cc_cons(%1119, %1120) : (i64, i64) -> i64
      %1122 = func.call @cc_values_pack(%1121) : (i64) -> i64
      func.call @stack_push_pointer(%1119) : (i64) -> ()
      %1123 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1124 = arith.constant 19 : i64
      %1125 = func.call @cc_make_string(%1123, %1124) : (!llvm.ptr, i64) -> i64
      %1126 = func.call @cc_nil_value() : () -> i64
      %1127 = func.call @cc_intern(%1125, %1126) : (i64, i64) -> i64
      %1128 = func.call @cc_nil_value() : () -> i64
      %1129 = func.call @cc_cons(%1127, %1128) : (i64, i64) -> i64
      %1130 = func.call @cc_values_pack(%1129) : (i64) -> i64
      func.call @stack_push_pointer(%1127) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1131 = func.call @stack_pop_pointer() : () -> i64
      %1132 = func.call @stack_pop_pointer() : () -> i64
      %1133 = func.call @cc_cons(%1132, %1131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1133) : (i64) -> ()
      %1134 = func.call @stack_pop_pointer() : () -> i64
      %1135 = func.call @stack_pop_pointer() : () -> i64
      %1136 = func.call @cc_cons(%1135, %1134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1136) : (i64) -> ()
      %1137 = func.call @stack_pop_pointer() : () -> i64
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @cc_cons(%1138, %1137) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1139) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1140 = func.call @stack_pop_pointer() : () -> i64
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @cc_cons(%1141, %1140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1142) : (i64) -> ()
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @cc_cons(%1144, %1143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1145) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @cc_cons(%1147, %1146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1148) : (i64) -> ()
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @cc_cons(%1150, %1149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1151) : (i64) -> ()
      %1152 = func.call @stack_pop_pointer() : () -> i64
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @cc_cons(%1153, %1152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1154) : (i64) -> ()
      %1155 = func.call @stack_pop_pointer() : () -> i64
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @cc_cons(%1156, %1155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1157) : (i64) -> ()
      %1158 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1159 = arith.constant 15 : i64
      %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
      %1161 = func.call @cc_nil_value() : () -> i64
      %1162 = func.call @cc_intern(%1160, %1161) : (i64, i64) -> i64
      %1163 = func.call @cc_nil_value() : () -> i64
      %1164 = func.call @cc_cons(%1162, %1163) : (i64, i64) -> i64
      %1165 = func.call @cc_values_pack(%1164) : (i64) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
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
      %1188 = func.call @stack_pop_pointer() : () -> i64
      %1189 = func.call @cc_cons(%1188, %1187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1189) : (i64) -> ()
      %1190 = func.call @stack_pop_pointer() : () -> i64
      %1525 = arith.constant 271595545296899 : i64
      %1526 = arith.constant 0 : i64
      %1527 = func.call @cc_make_closure(%1525, %1526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1527) : (i64) -> ()
      %1528 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1529 = func.call @stack_pop_pointer() : () -> i64
      %1530 = func.call @stack_pop_pointer() : () -> i64
      %1531 = func.call @cc_cons(%1530, %1529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1531) : (i64) -> ()
      %1532 = func.call @stack_pop_pointer() : () -> i64
      %1533 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1534 = arith.constant 11 : i64
      %1535 = func.call @cc_make_string(%1533, %1534) : (!llvm.ptr, i64) -> i64
      %1536 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1537 = arith.constant 7 : i64
      %1538 = func.call @cc_make_string(%1536, %1537) : (!llvm.ptr, i64) -> i64
      %1539 = func.call @cc_intern(%1535, %1538) : (i64, i64) -> i64
      %1540 = func.call @cc_nil_value() : () -> i64
      %1541 = func.call @cc_cons(%1539, %1540) : (i64, i64) -> i64
      %1542 = func.call @cc_values_pack(%1541) : (i64) -> i64
      func.call @stack_push_pointer(%1539) : (i64) -> ()
      %1543 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1544 = func.call @stack_pop_pointer() : () -> i64
      %1545 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1546 = arith.constant 4 : i64
      %1547 = func.call @cc_make_string(%1545, %1546) : (!llvm.ptr, i64) -> i64
      %1548 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1549 = arith.constant 7 : i64
      %1550 = func.call @cc_make_string(%1548, %1549) : (!llvm.ptr, i64) -> i64
      %1551 = func.call @cc_intern(%1547, %1550) : (i64, i64) -> i64
      %1552 = func.call @cc_nil_value() : () -> i64
      %1553 = func.call @cc_cons(%1551, %1552) : (i64, i64) -> i64
      %1554 = func.call @cc_values_pack(%1553) : (i64) -> i64
      func.call @stack_push_pointer(%1551) : (i64) -> ()
      %1555 = func.call @stack_pop_pointer() : () -> i64
      %1556 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1557 = arith.constant 6 : i64
      %1558 = func.call @cc_make_string(%1556, %1557) : (!llvm.ptr, i64) -> i64
      %1559 = func.call @cc_nil_value() : () -> i64
      %1560 = func.call @cc_intern(%1558, %1559) : (i64, i64) -> i64
      %1561 = func.call @cc_nil_value() : () -> i64
      %1562 = func.call @cc_cons(%1560, %1561) : (i64, i64) -> i64
      %1563 = func.call @cc_values_pack(%1562) : (i64) -> i64
      func.call @stack_push_pointer(%1560) : (i64) -> ()
      %1564 = func.call @stack_pop_pointer() : () -> i64
      %1565 = func.call @cc_nil_value() : () -> i64
      %1566 = func.call @cc_errorp(%343) : (i64) -> i64
      %1567 = arith.cmpi ne, %1566, %1565 : i64
      %1568 = arith.cmpi eq, %1565, %1565 : i64
      %1569 = arith.andi %1567, %1568 : i1
      %1570 = scf.if %1569 -> (i64) {
        scf.yield %343 : i64
      } else {
        scf.yield %1565 : i64
      }
      %1571 = func.call @cc_errorp(%1190) : (i64) -> i64
      %1572 = arith.cmpi ne, %1571, %1565 : i64
      %1573 = arith.cmpi eq, %1570, %1565 : i64
      %1574 = arith.andi %1572, %1573 : i1
      %1575 = scf.if %1574 -> (i64) {
        scf.yield %1190 : i64
      } else {
        scf.yield %1570 : i64
      }
      %1576 = func.call @cc_errorp(%1528) : (i64) -> i64
      %1577 = arith.cmpi ne, %1576, %1565 : i64
      %1578 = arith.cmpi eq, %1575, %1565 : i64
      %1579 = arith.andi %1577, %1578 : i1
      %1580 = scf.if %1579 -> (i64) {
        scf.yield %1528 : i64
      } else {
        scf.yield %1575 : i64
      }
      %1581 = func.call @cc_errorp(%1532) : (i64) -> i64
      %1582 = arith.cmpi ne, %1581, %1565 : i64
      %1583 = arith.cmpi eq, %1580, %1565 : i64
      %1584 = arith.andi %1582, %1583 : i1
      %1585 = scf.if %1584 -> (i64) {
        scf.yield %1532 : i64
      } else {
        scf.yield %1580 : i64
      }
      %1586 = func.call @cc_errorp(%1543) : (i64) -> i64
      %1587 = arith.cmpi ne, %1586, %1565 : i64
      %1588 = arith.cmpi eq, %1585, %1565 : i64
      %1589 = arith.andi %1587, %1588 : i1
      %1590 = scf.if %1589 -> (i64) {
        scf.yield %1543 : i64
      } else {
        scf.yield %1585 : i64
      }
      %1591 = func.call @cc_errorp(%1544) : (i64) -> i64
      %1592 = arith.cmpi ne, %1591, %1565 : i64
      %1593 = arith.cmpi eq, %1590, %1565 : i64
      %1594 = arith.andi %1592, %1593 : i1
      %1595 = scf.if %1594 -> (i64) {
        scf.yield %1544 : i64
      } else {
        scf.yield %1590 : i64
      }
      %1596 = func.call @cc_errorp(%1555) : (i64) -> i64
      %1597 = arith.cmpi ne, %1596, %1565 : i64
      %1598 = arith.cmpi eq, %1595, %1565 : i64
      %1599 = arith.andi %1597, %1598 : i1
      %1600 = scf.if %1599 -> (i64) {
        scf.yield %1555 : i64
      } else {
        scf.yield %1595 : i64
      }
      %1601 = func.call @cc_errorp(%1564) : (i64) -> i64
      %1602 = arith.cmpi ne, %1601, %1565 : i64
      %1603 = arith.cmpi eq, %1600, %1565 : i64
      %1604 = arith.andi %1602, %1603 : i1
      %1605 = scf.if %1604 -> (i64) {
        scf.yield %1564 : i64
      } else {
        scf.yield %1600 : i64
      }
      %1606 = arith.cmpi ne, %1605, %1565 : i64
      scf.if %1606 {
        func.call @stack_push_pointer(%1605) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%343) : (i64) -> ()
        func.call @stack_push_pointer(%1190) : (i64) -> ()
        func.call @stack_push_pointer(%1528) : (i64) -> ()
        func.call @stack_push_pointer(%1532) : (i64) -> ()
        func.call @stack_push_pointer(%1543) : (i64) -> ()
        func.call @stack_push_pointer(%1544) : (i64) -> ()
        func.call @stack_push_pointer(%1555) : (i64) -> ()
        func.call @stack_push_pointer(%1564) : (i64) -> ()
        %1607 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1608 = func.call @cc_make_function_ref_const(%1607) : (!llvm.ptr) -> i64
        %1609 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1608, %1609) : (i64, i64) -> ()
      }
      %1610 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1610 : i64
    }
    %1611 = func.call @cc_nil_value() : () -> i64
    %1612 = func.call @cc_errorp(%334) : (i64) -> i64
    %1613 = arith.cmpi ne, %1612, %1611 : i64
    %1614 = scf.if %1613 -> (i64) {
      scf.yield %334 : i64
    } else {
      %1615 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1616 = arith.constant 14 : i64
      %1617 = func.call @cc_make_string(%1615, %1616) : (!llvm.ptr, i64) -> i64
      %1618 = func.call @cc_nil_value() : () -> i64
      %1619 = func.call @cc_intern(%1617, %1618) : (i64, i64) -> i64
      %1620 = func.call @cc_nil_value() : () -> i64
      %1621 = func.call @cc_cons(%1619, %1620) : (i64, i64) -> i64
      %1622 = func.call @cc_values_pack(%1621) : (i64) -> i64
      func.call @stack_push_pointer(%1619) : (i64) -> ()
      %1623 = func.call @stack_pop_pointer() : () -> i64
      %1624 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1625 = arith.constant 4 : i64
      %1626 = func.call @cc_make_string(%1624, %1625) : (!llvm.ptr, i64) -> i64
      %1627 = func.call @cc_nil_value() : () -> i64
      %1628 = func.call @cc_intern(%1626, %1627) : (i64, i64) -> i64
      %1629 = func.call @cc_nil_value() : () -> i64
      %1630 = func.call @cc_cons(%1628, %1629) : (i64, i64) -> i64
      %1631 = func.call @cc_values_pack(%1630) : (i64) -> i64
      func.call @stack_push_pointer(%1628) : (i64) -> ()
      %1632 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1633 = arith.constant 1 : i64
      %1634 = func.call @cc_make_string(%1632, %1633) : (!llvm.ptr, i64) -> i64
      %1635 = func.call @cc_nil_value() : () -> i64
      %1636 = func.call @cc_intern(%1634, %1635) : (i64, i64) -> i64
      %1637 = func.call @cc_nil_value() : () -> i64
      %1638 = func.call @cc_cons(%1636, %1637) : (i64, i64) -> i64
      %1639 = func.call @cc_values_pack(%1638) : (i64) -> i64
      func.call @stack_push_pointer(%1636) : (i64) -> ()
      %1640 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1640) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1641 = func.call @stack_pop_pointer() : () -> i64
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = func.call @cc_cons(%1642, %1641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1643) : (i64) -> ()
      %1644 = func.call @stack_pop_pointer() : () -> i64
      %1645 = func.call @stack_pop_pointer() : () -> i64
      %1646 = func.call @cc_cons(%1645, %1644) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1646) : (i64) -> ()
      %1647 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1648 = arith.constant 19 : i64
      %1649 = func.call @cc_make_string(%1647, %1648) : (!llvm.ptr, i64) -> i64
      %1650 = func.call @cc_nil_value() : () -> i64
      %1651 = func.call @cc_intern(%1649, %1650) : (i64, i64) -> i64
      %1652 = func.call @cc_nil_value() : () -> i64
      %1653 = func.call @cc_cons(%1651, %1652) : (i64, i64) -> i64
      %1654 = func.call @cc_values_pack(%1653) : (i64) -> i64
      func.call @stack_push_pointer(%1651) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1655 = func.call @stack_pop_pointer() : () -> i64
      %1656 = func.call @stack_pop_pointer() : () -> i64
      %1657 = func.call @cc_cons(%1656, %1655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1657) : (i64) -> ()
      %1658 = func.call @stack_pop_pointer() : () -> i64
      %1659 = func.call @stack_pop_pointer() : () -> i64
      %1660 = func.call @cc_cons(%1659, %1658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1660) : (i64) -> ()
      %1661 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1662 = arith.constant 1 : i64
      %1663 = func.call @cc_make_string(%1661, %1662) : (!llvm.ptr, i64) -> i64
      %1664 = func.call @cc_nil_value() : () -> i64
      %1665 = func.call @cc_intern(%1663, %1664) : (i64, i64) -> i64
      %1666 = func.call @cc_nil_value() : () -> i64
      %1667 = func.call @cc_cons(%1665, %1666) : (i64, i64) -> i64
      %1668 = func.call @cc_values_pack(%1667) : (i64) -> i64
      func.call @stack_push_pointer(%1665) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = func.call @stack_pop_pointer() : () -> i64
      %1671 = func.call @cc_cons(%1670, %1669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1671) : (i64) -> ()
      %1672 = func.call @stack_pop_pointer() : () -> i64
      %1673 = func.call @stack_pop_pointer() : () -> i64
      %1674 = func.call @cc_cons(%1673, %1672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1674) : (i64) -> ()
      %1675 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1676 = arith.constant 15 : i64
      %1677 = func.call @cc_make_string(%1675, %1676) : (!llvm.ptr, i64) -> i64
      %1678 = func.call @cc_nil_value() : () -> i64
      %1679 = func.call @cc_intern(%1677, %1678) : (i64, i64) -> i64
      %1680 = func.call @cc_nil_value() : () -> i64
      %1681 = func.call @cc_cons(%1679, %1680) : (i64, i64) -> i64
      %1682 = func.call @cc_values_pack(%1681) : (i64) -> i64
      func.call @stack_push_pointer(%1679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @stack_pop_pointer() : () -> i64
      %1685 = func.call @cc_cons(%1684, %1683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @cc_cons(%1687, %1686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1688) : (i64) -> ()
      %1689 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1690 = arith.constant 17 : i64
      %1691 = func.call @cc_make_string(%1689, %1690) : (!llvm.ptr, i64) -> i64
      %1692 = func.call @cc_nil_value() : () -> i64
      %1693 = func.call @cc_intern(%1691, %1692) : (i64, i64) -> i64
      %1694 = func.call @cc_nil_value() : () -> i64
      %1695 = func.call @cc_cons(%1693, %1694) : (i64, i64) -> i64
      %1696 = func.call @cc_values_pack(%1695) : (i64) -> i64
      func.call @stack_push_pointer(%1693) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %1712 = func.call @stack_pop_pointer() : () -> i64
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @cc_cons(%1713, %1712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1714) : (i64) -> ()
      %1715 = func.call @stack_pop_pointer() : () -> i64
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = func.call @cc_cons(%1716, %1715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1717) : (i64) -> ()
      %1718 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1719 = arith.constant 5 : i64
      %1720 = func.call @cc_make_string(%1718, %1719) : (!llvm.ptr, i64) -> i64
      %1721 = func.call @cc_nil_value() : () -> i64
      %1722 = func.call @cc_intern(%1720, %1721) : (i64, i64) -> i64
      %1723 = func.call @cc_nil_value() : () -> i64
      %1724 = func.call @cc_cons(%1722, %1723) : (i64, i64) -> i64
      %1725 = func.call @cc_values_pack(%1724) : (i64) -> i64
      func.call @stack_push_pointer(%1722) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1726 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1727 = arith.constant 5 : i64
      %1728 = func.call @cc_make_string(%1726, %1727) : (!llvm.ptr, i64) -> i64
      %1729 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1730 = arith.constant 3 : i64
      %1731 = func.call @cc_make_string(%1729, %1730) : (!llvm.ptr, i64) -> i64
      %1732 = func.call @cc_intern(%1728, %1731) : (i64, i64) -> i64
      %1733 = func.call @cc_nil_value() : () -> i64
      %1734 = func.call @cc_cons(%1732, %1733) : (i64, i64) -> i64
      %1735 = func.call @cc_values_pack(%1734) : (i64) -> i64
      func.call @stack_push_pointer(%1732) : (i64) -> ()
      %1736 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1737 = arith.constant 1 : i64
      %1738 = func.call @cc_make_string(%1736, %1737) : (!llvm.ptr, i64) -> i64
      %1739 = func.call @cc_nil_value() : () -> i64
      %1740 = func.call @cc_intern(%1738, %1739) : (i64, i64) -> i64
      %1741 = func.call @cc_nil_value() : () -> i64
      %1742 = func.call @cc_cons(%1740, %1741) : (i64, i64) -> i64
      %1743 = func.call @cc_values_pack(%1742) : (i64) -> i64
      func.call @stack_push_pointer(%1740) : (i64) -> ()
      %1744 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1745 = arith.constant 1 : i64
      %1746 = func.call @cc_make_string(%1744, %1745) : (!llvm.ptr, i64) -> i64
      %1747 = func.call @cc_nil_value() : () -> i64
      %1748 = func.call @cc_intern(%1746, %1747) : (i64, i64) -> i64
      %1749 = func.call @cc_nil_value() : () -> i64
      %1750 = func.call @cc_cons(%1748, %1749) : (i64, i64) -> i64
      %1751 = func.call @cc_values_pack(%1750) : (i64) -> i64
      func.call @stack_push_pointer(%1748) : (i64) -> ()
      %1752 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1753 = arith.constant 15 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      %1755 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1756 = arith.constant 11 : i64
      %1757 = func.call @cc_make_string(%1755, %1756) : (!llvm.ptr, i64) -> i64
      %1758 = func.call @cc_intern(%1754, %1757) : (i64, i64) -> i64
      %1759 = func.call @cc_nil_value() : () -> i64
      %1760 = func.call @cc_cons(%1758, %1759) : (i64, i64) -> i64
      %1761 = func.call @cc_values_pack(%1760) : (i64) -> i64
      func.call @stack_push_pointer(%1758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1762 = func.call @stack_pop_pointer() : () -> i64
      %1763 = func.call @stack_pop_pointer() : () -> i64
      %1764 = func.call @cc_cons(%1763, %1762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1764) : (i64) -> ()
      %1765 = func.call @stack_pop_pointer() : () -> i64
      %1766 = func.call @stack_pop_pointer() : () -> i64
      %1767 = func.call @cc_cons(%1766, %1765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1767) : (i64) -> ()
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = func.call @stack_pop_pointer() : () -> i64
      %1770 = func.call @cc_cons(%1769, %1768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1770) : (i64) -> ()
      %1771 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1772 = arith.constant 4 : i64
      %1773 = func.call @cc_make_string(%1771, %1772) : (!llvm.ptr, i64) -> i64
      %1774 = func.call @cc_nil_value() : () -> i64
      %1775 = func.call @cc_intern(%1773, %1774) : (i64, i64) -> i64
      %1776 = func.call @cc_nil_value() : () -> i64
      %1777 = func.call @cc_cons(%1775, %1776) : (i64, i64) -> i64
      %1778 = func.call @cc_values_pack(%1777) : (i64) -> i64
      func.call @stack_push_pointer(%1775) : (i64) -> ()
      %1779 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1780 = arith.constant 17 : i64
      %1781 = func.call @cc_make_string(%1779, %1780) : (!llvm.ptr, i64) -> i64
      %1782 = func.call @cc_nil_value() : () -> i64
      %1783 = func.call @cc_intern(%1781, %1782) : (i64, i64) -> i64
      %1784 = func.call @cc_nil_value() : () -> i64
      %1785 = func.call @cc_cons(%1783, %1784) : (i64, i64) -> i64
      %1786 = func.call @cc_values_pack(%1785) : (i64) -> i64
      func.call @stack_push_pointer(%1783) : (i64) -> ()
      %1787 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1788 = func.call @stack_pop_pointer() : () -> i64
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @cc_cons(%1789, %1788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1790) : (i64) -> ()
      %1791 = func.call @stack_pop_pointer() : () -> i64
      %1792 = func.call @stack_pop_pointer() : () -> i64
      %1793 = func.call @cc_cons(%1792, %1791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1793) : (i64) -> ()
      %1794 = func.call @stack_pop_pointer() : () -> i64
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @cc_cons(%1795, %1794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1796) : (i64) -> ()
      %1797 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1798 = arith.constant 4 : i64
      %1799 = func.call @cc_make_string(%1797, %1798) : (!llvm.ptr, i64) -> i64
      %1800 = func.call @cc_nil_value() : () -> i64
      %1801 = func.call @cc_intern(%1799, %1800) : (i64, i64) -> i64
      %1802 = func.call @cc_nil_value() : () -> i64
      %1803 = func.call @cc_cons(%1801, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_values_pack(%1803) : (i64) -> i64
      func.call @stack_push_pointer(%1801) : (i64) -> ()
      %1805 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1806 = arith.constant 19 : i64
      %1807 = func.call @cc_make_string(%1805, %1806) : (!llvm.ptr, i64) -> i64
      %1808 = func.call @cc_nil_value() : () -> i64
      %1809 = func.call @cc_intern(%1807, %1808) : (i64, i64) -> i64
      %1810 = func.call @cc_nil_value() : () -> i64
      %1811 = func.call @cc_cons(%1809, %1810) : (i64, i64) -> i64
      %1812 = func.call @cc_values_pack(%1811) : (i64) -> i64
      func.call @stack_push_pointer(%1809) : (i64) -> ()
      %1813 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1814 = arith.constant 1 : i64
      %1815 = func.call @cc_make_string(%1813, %1814) : (!llvm.ptr, i64) -> i64
      %1816 = func.call @cc_nil_value() : () -> i64
      %1817 = func.call @cc_intern(%1815, %1816) : (i64, i64) -> i64
      %1818 = func.call @cc_nil_value() : () -> i64
      %1819 = func.call @cc_cons(%1817, %1818) : (i64, i64) -> i64
      %1820 = func.call @cc_values_pack(%1819) : (i64) -> i64
      func.call @stack_push_pointer(%1817) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1821 = func.call @stack_pop_pointer() : () -> i64
      %1822 = func.call @stack_pop_pointer() : () -> i64
      %1823 = func.call @cc_cons(%1822, %1821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1823) : (i64) -> ()
      %1824 = func.call @stack_pop_pointer() : () -> i64
      %1825 = func.call @stack_pop_pointer() : () -> i64
      %1826 = func.call @cc_cons(%1825, %1824) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1826) : (i64) -> ()
      %1827 = func.call @stack_pop_pointer() : () -> i64
      %1828 = func.call @stack_pop_pointer() : () -> i64
      %1829 = func.call @cc_cons(%1828, %1827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1829) : (i64) -> ()
      %1830 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1831 = arith.constant 4 : i64
      %1832 = func.call @cc_make_string(%1830, %1831) : (!llvm.ptr, i64) -> i64
      %1833 = func.call @cc_nil_value() : () -> i64
      %1834 = func.call @cc_intern(%1832, %1833) : (i64, i64) -> i64
      %1835 = func.call @cc_nil_value() : () -> i64
      %1836 = func.call @cc_cons(%1834, %1835) : (i64, i64) -> i64
      %1837 = func.call @cc_values_pack(%1836) : (i64) -> i64
      func.call @stack_push_pointer(%1834) : (i64) -> ()
      %1838 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1839 = arith.constant 1 : i64
      %1840 = func.call @cc_make_string(%1838, %1839) : (!llvm.ptr, i64) -> i64
      %1841 = func.call @cc_nil_value() : () -> i64
      %1842 = func.call @cc_intern(%1840, %1841) : (i64, i64) -> i64
      %1843 = func.call @cc_nil_value() : () -> i64
      %1844 = func.call @cc_cons(%1842, %1843) : (i64, i64) -> i64
      %1845 = func.call @cc_values_pack(%1844) : (i64) -> i64
      func.call @stack_push_pointer(%1842) : (i64) -> ()
      %1846 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1847 = arith.constant 9 : i64
      %1848 = func.call @cc_make_string(%1846, %1847) : (!llvm.ptr, i64) -> i64
      %1849 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1850 = arith.constant 11 : i64
      %1851 = func.call @cc_make_string(%1849, %1850) : (!llvm.ptr, i64) -> i64
      %1852 = func.call @cc_intern(%1848, %1851) : (i64, i64) -> i64
      %1853 = func.call @cc_nil_value() : () -> i64
      %1854 = func.call @cc_cons(%1852, %1853) : (i64, i64) -> i64
      %1855 = func.call @cc_values_pack(%1854) : (i64) -> i64
      func.call @stack_push_pointer(%1852) : (i64) -> ()
      %1856 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1857 = arith.constant 1 : i64
      %1858 = func.call @cc_make_string(%1856, %1857) : (!llvm.ptr, i64) -> i64
      %1859 = func.call @cc_nil_value() : () -> i64
      %1860 = func.call @cc_intern(%1858, %1859) : (i64, i64) -> i64
      %1861 = func.call @cc_nil_value() : () -> i64
      %1862 = func.call @cc_cons(%1860, %1861) : (i64, i64) -> i64
      %1863 = func.call @cc_values_pack(%1862) : (i64) -> i64
      func.call @stack_push_pointer(%1860) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1864 = func.call @stack_pop_pointer() : () -> i64
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = func.call @cc_cons(%1865, %1864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1866) : (i64) -> ()
      %1867 = func.call @stack_pop_pointer() : () -> i64
      %1868 = func.call @stack_pop_pointer() : () -> i64
      %1869 = func.call @cc_cons(%1868, %1867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1869) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %1879 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1880 = arith.constant 2 : i64
      %1881 = func.call @cc_make_string(%1879, %1880) : (!llvm.ptr, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_intern(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_nil_value() : () -> i64
      %1885 = func.call @cc_cons(%1883, %1884) : (i64, i64) -> i64
      %1886 = func.call @cc_values_pack(%1885) : (i64) -> i64
      func.call @stack_push_pointer(%1883) : (i64) -> ()
      %1887 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1888 = arith.constant 3 : i64
      %1889 = func.call @cc_make_string(%1887, %1888) : (!llvm.ptr, i64) -> i64
      %1890 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1891 = arith.constant 11 : i64
      %1892 = func.call @cc_make_string(%1890, %1891) : (!llvm.ptr, i64) -> i64
      %1893 = func.call @cc_intern(%1889, %1892) : (i64, i64) -> i64
      %1894 = func.call @cc_nil_value() : () -> i64
      %1895 = func.call @cc_cons(%1893, %1894) : (i64, i64) -> i64
      %1896 = func.call @cc_values_pack(%1895) : (i64) -> i64
      func.call @stack_push_pointer(%1893) : (i64) -> ()
      %1897 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1898 = arith.constant 1 : i64
      %1899 = func.call @cc_make_string(%1897, %1898) : (!llvm.ptr, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_intern(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_nil_value() : () -> i64
      %1903 = func.call @cc_cons(%1901, %1902) : (i64, i64) -> i64
      %1904 = func.call @cc_values_pack(%1903) : (i64) -> i64
      func.call @stack_push_pointer(%1901) : (i64) -> ()
      %1905 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1906 = arith.constant 12 : i64
      %1907 = func.call @cc_make_string(%1905, %1906) : (!llvm.ptr, i64) -> i64
      %1908 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1909 = arith.constant 11 : i64
      %1910 = func.call @cc_make_string(%1908, %1909) : (!llvm.ptr, i64) -> i64
      %1911 = func.call @cc_intern(%1907, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_nil_value() : () -> i64
      %1913 = func.call @cc_cons(%1911, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_values_pack(%1913) : (i64) -> i64
      func.call @stack_push_pointer(%1911) : (i64) -> ()
      %1915 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1916 = arith.constant 1 : i64
      %1917 = func.call @cc_make_string(%1915, %1916) : (!llvm.ptr, i64) -> i64
      %1918 = func.call @cc_nil_value() : () -> i64
      %1919 = func.call @cc_intern(%1917, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_nil_value() : () -> i64
      %1921 = func.call @cc_cons(%1919, %1920) : (i64, i64) -> i64
      %1922 = func.call @cc_values_pack(%1921) : (i64) -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = func.call @cc_cons(%1924, %1923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1925) : (i64) -> ()
      %1926 = func.call @stack_pop_pointer() : () -> i64
      %1927 = func.call @stack_pop_pointer() : () -> i64
      %1928 = func.call @cc_cons(%1927, %1926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1928) : (i64) -> ()
      %1929 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1930 = arith.constant 5 : i64
      %1931 = func.call @cc_make_string(%1929, %1930) : (!llvm.ptr, i64) -> i64
      %1932 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1933 = arith.constant 11 : i64
      %1934 = func.call @cc_make_string(%1932, %1933) : (!llvm.ptr, i64) -> i64
      %1935 = func.call @cc_intern(%1931, %1934) : (i64, i64) -> i64
      %1936 = func.call @cc_nil_value() : () -> i64
      %1937 = func.call @cc_cons(%1935, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_values_pack(%1937) : (i64) -> i64
      func.call @stack_push_pointer(%1935) : (i64) -> ()
      %1939 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1940 = arith.constant 1 : i64
      %1941 = func.call @cc_make_string(%1939, %1940) : (!llvm.ptr, i64) -> i64
      %1942 = func.call @cc_nil_value() : () -> i64
      %1943 = func.call @cc_intern(%1941, %1942) : (i64, i64) -> i64
      %1944 = func.call @cc_nil_value() : () -> i64
      %1945 = func.call @cc_cons(%1943, %1944) : (i64, i64) -> i64
      %1946 = func.call @cc_values_pack(%1945) : (i64) -> i64
      func.call @stack_push_pointer(%1943) : (i64) -> ()
      %1947 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1948 = arith.constant 11 : i64
      %1949 = func.call @cc_make_string(%1947, %1948) : (!llvm.ptr, i64) -> i64
      %1950 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1951 = arith.constant 11 : i64
      %1952 = func.call @cc_make_string(%1950, %1951) : (!llvm.ptr, i64) -> i64
      %1953 = func.call @cc_intern(%1949, %1952) : (i64, i64) -> i64
      %1954 = func.call @cc_nil_value() : () -> i64
      %1955 = func.call @cc_cons(%1953, %1954) : (i64, i64) -> i64
      %1956 = func.call @cc_values_pack(%1955) : (i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      %1957 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1958 = arith.constant 1 : i64
      %1959 = func.call @cc_make_string(%1957, %1958) : (!llvm.ptr, i64) -> i64
      %1960 = func.call @cc_nil_value() : () -> i64
      %1961 = func.call @cc_intern(%1959, %1960) : (i64, i64) -> i64
      %1962 = func.call @cc_nil_value() : () -> i64
      %1963 = func.call @cc_cons(%1961, %1962) : (i64, i64) -> i64
      %1964 = func.call @cc_values_pack(%1963) : (i64) -> i64
      func.call @stack_push_pointer(%1961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @cc_cons(%1966, %1965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1967) : (i64) -> ()
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = func.call @stack_pop_pointer() : () -> i64
      %1970 = func.call @cc_cons(%1969, %1968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1970) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1971 = func.call @stack_pop_pointer() : () -> i64
      %1972 = func.call @stack_pop_pointer() : () -> i64
      %1973 = func.call @cc_cons(%1972, %1971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1973) : (i64) -> ()
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %1975 = func.call @stack_pop_pointer() : () -> i64
      %1976 = func.call @cc_cons(%1975, %1974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1976) : (i64) -> ()
      %1977 = func.call @stack_pop_pointer() : () -> i64
      %1978 = func.call @stack_pop_pointer() : () -> i64
      %1979 = func.call @cc_cons(%1978, %1977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1979) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1980 = func.call @stack_pop_pointer() : () -> i64
      %1981 = func.call @stack_pop_pointer() : () -> i64
      %1982 = func.call @cc_cons(%1981, %1980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1982) : (i64) -> ()
      %1983 = func.call @stack_pop_pointer() : () -> i64
      %1984 = func.call @stack_pop_pointer() : () -> i64
      %1985 = func.call @cc_cons(%1984, %1983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1985) : (i64) -> ()
      %1986 = func.call @stack_pop_pointer() : () -> i64
      %1987 = func.call @stack_pop_pointer() : () -> i64
      %1988 = func.call @cc_cons(%1987, %1986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1988) : (i64) -> ()
      %1989 = func.call @stack_pop_pointer() : () -> i64
      %1990 = func.call @stack_pop_pointer() : () -> i64
      %1991 = func.call @cc_cons(%1990, %1989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1991) : (i64) -> ()
      %1992 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1993 = arith.constant 5 : i64
      %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
      %1995 = func.call @cc_nil_value() : () -> i64
      %1996 = func.call @cc_intern(%1994, %1995) : (i64, i64) -> i64
      %1997 = func.call @cc_nil_value() : () -> i64
      %1998 = func.call @cc_cons(%1996, %1997) : (i64, i64) -> i64
      %1999 = func.call @cc_values_pack(%1998) : (i64) -> i64
      func.call @stack_push_pointer(%1996) : (i64) -> ()
      %2000 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2001 = arith.constant 4 : i64
      %2002 = func.call @cc_make_string(%2000, %2001) : (!llvm.ptr, i64) -> i64
      %2003 = func.call @cc_nil_value() : () -> i64
      %2004 = func.call @cc_intern(%2002, %2003) : (i64, i64) -> i64
      %2005 = func.call @cc_nil_value() : () -> i64
      %2006 = func.call @cc_cons(%2004, %2005) : (i64, i64) -> i64
      %2007 = func.call @cc_values_pack(%2006) : (i64) -> i64
      func.call @stack_push_pointer(%2004) : (i64) -> ()
      %2008 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2009 = arith.constant 15 : i64
      %2010 = func.call @cc_make_string(%2008, %2009) : (!llvm.ptr, i64) -> i64
      %2011 = func.call @cc_nil_value() : () -> i64
      %2012 = func.call @cc_intern(%2010, %2011) : (i64, i64) -> i64
      %2013 = func.call @cc_nil_value() : () -> i64
      %2014 = func.call @cc_cons(%2012, %2013) : (i64, i64) -> i64
      %2015 = func.call @cc_values_pack(%2014) : (i64) -> i64
      func.call @stack_push_pointer(%2012) : (i64) -> ()
      %2016 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2017 = arith.constant 6 : i64
      %2018 = func.call @cc_make_string(%2016, %2017) : (!llvm.ptr, i64) -> i64
      %2019 = func.call @cc_nil_value() : () -> i64
      %2020 = func.call @cc_intern(%2018, %2019) : (i64, i64) -> i64
      %2021 = func.call @cc_nil_value() : () -> i64
      %2022 = func.call @cc_cons(%2020, %2021) : (i64, i64) -> i64
      %2023 = func.call @cc_values_pack(%2022) : (i64) -> i64
      func.call @stack_push_pointer(%2020) : (i64) -> ()
      %2024 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2025 = arith.constant 15 : i64
      %2026 = func.call @cc_make_string(%2024, %2025) : (!llvm.ptr, i64) -> i64
      %2027 = func.call @cc_nil_value() : () -> i64
      %2028 = func.call @cc_intern(%2026, %2027) : (i64, i64) -> i64
      %2029 = func.call @cc_nil_value() : () -> i64
      %2030 = func.call @cc_cons(%2028, %2029) : (i64, i64) -> i64
      %2031 = func.call @cc_values_pack(%2030) : (i64) -> i64
      func.call @stack_push_pointer(%2028) : (i64) -> ()
      %2032 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2033 = arith.constant 4 : i64
      %2034 = func.call @cc_make_string(%2032, %2033) : (!llvm.ptr, i64) -> i64
      %2035 = func.call @cc_nil_value() : () -> i64
      %2036 = func.call @cc_intern(%2034, %2035) : (i64, i64) -> i64
      %2037 = func.call @cc_nil_value() : () -> i64
      %2038 = func.call @cc_cons(%2036, %2037) : (i64, i64) -> i64
      %2039 = func.call @cc_values_pack(%2038) : (i64) -> i64
      func.call @stack_push_pointer(%2036) : (i64) -> ()
      %2040 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2041 = arith.constant 4 : i64
      %2042 = func.call @cc_make_string(%2040, %2041) : (!llvm.ptr, i64) -> i64
      %2043 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2044 = arith.constant 11 : i64
      %2045 = func.call @cc_make_string(%2043, %2044) : (!llvm.ptr, i64) -> i64
      %2046 = func.call @cc_intern(%2042, %2045) : (i64, i64) -> i64
      %2047 = func.call @cc_nil_value() : () -> i64
      %2048 = func.call @cc_cons(%2046, %2047) : (i64, i64) -> i64
      %2049 = func.call @cc_values_pack(%2048) : (i64) -> i64
      func.call @stack_push_pointer(%2046) : (i64) -> ()
      %2050 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2051 = arith.constant 1 : i64
      %2052 = func.call @cc_make_string(%2050, %2051) : (!llvm.ptr, i64) -> i64
      %2053 = func.call @cc_nil_value() : () -> i64
      %2054 = func.call @cc_intern(%2052, %2053) : (i64, i64) -> i64
      %2055 = func.call @cc_nil_value() : () -> i64
      %2056 = func.call @cc_cons(%2054, %2055) : (i64, i64) -> i64
      %2057 = func.call @cc_values_pack(%2056) : (i64) -> i64
      func.call @stack_push_pointer(%2054) : (i64) -> ()
      %2058 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2059 = arith.constant 1 : i64
      %2060 = func.call @cc_make_string(%2058, %2059) : (!llvm.ptr, i64) -> i64
      %2061 = func.call @cc_nil_value() : () -> i64
      %2062 = func.call @cc_intern(%2060, %2061) : (i64, i64) -> i64
      %2063 = func.call @cc_nil_value() : () -> i64
      %2064 = func.call @cc_cons(%2062, %2063) : (i64, i64) -> i64
      %2065 = func.call @cc_values_pack(%2064) : (i64) -> i64
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      %2066 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2067 = arith.constant 9 : i64
      %2068 = func.call @cc_make_string(%2066, %2067) : (!llvm.ptr, i64) -> i64
      %2069 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2070 = arith.constant 11 : i64
      %2071 = func.call @cc_make_string(%2069, %2070) : (!llvm.ptr, i64) -> i64
      %2072 = func.call @cc_intern(%2068, %2071) : (i64, i64) -> i64
      %2073 = func.call @cc_nil_value() : () -> i64
      %2074 = func.call @cc_cons(%2072, %2073) : (i64, i64) -> i64
      %2075 = func.call @cc_values_pack(%2074) : (i64) -> i64
      func.call @stack_push_pointer(%2072) : (i64) -> ()
      %2076 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2077 = arith.constant 1 : i64
      %2078 = func.call @cc_make_string(%2076, %2077) : (!llvm.ptr, i64) -> i64
      %2079 = func.call @cc_nil_value() : () -> i64
      %2080 = func.call @cc_intern(%2078, %2079) : (i64, i64) -> i64
      %2081 = func.call @cc_nil_value() : () -> i64
      %2082 = func.call @cc_cons(%2080, %2081) : (i64, i64) -> i64
      %2083 = func.call @cc_values_pack(%2082) : (i64) -> i64
      func.call @stack_push_pointer(%2080) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2084 = func.call @stack_pop_pointer() : () -> i64
      %2085 = func.call @stack_pop_pointer() : () -> i64
      %2086 = func.call @cc_cons(%2085, %2084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2086) : (i64) -> ()
      %2087 = func.call @stack_pop_pointer() : () -> i64
      %2088 = func.call @stack_pop_pointer() : () -> i64
      %2089 = func.call @cc_cons(%2088, %2087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2089) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2090 = func.call @stack_pop_pointer() : () -> i64
      %2091 = func.call @stack_pop_pointer() : () -> i64
      %2092 = func.call @cc_cons(%2091, %2090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2092) : (i64) -> ()
      %2093 = func.call @stack_pop_pointer() : () -> i64
      %2094 = func.call @stack_pop_pointer() : () -> i64
      %2095 = func.call @cc_cons(%2094, %2093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2095) : (i64) -> ()
      %2096 = func.call @stack_pop_pointer() : () -> i64
      %2097 = func.call @stack_pop_pointer() : () -> i64
      %2098 = func.call @cc_cons(%2097, %2096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2098) : (i64) -> ()
      %2099 = func.call @stack_pop_pointer() : () -> i64
      %2100 = func.call @stack_pop_pointer() : () -> i64
      %2101 = func.call @cc_cons(%2100, %2099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2101) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2102 = func.call @stack_pop_pointer() : () -> i64
      %2103 = func.call @stack_pop_pointer() : () -> i64
      %2104 = func.call @cc_cons(%2103, %2102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2104) : (i64) -> ()
      %2105 = func.call @stack_pop_pointer() : () -> i64
      %2106 = func.call @stack_pop_pointer() : () -> i64
      %2107 = func.call @cc_cons(%2106, %2105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2107) : (i64) -> ()
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
      func.call @stack_push_nil() : () -> ()
      %2117 = func.call @stack_pop_pointer() : () -> i64
      %2118 = func.call @stack_pop_pointer() : () -> i64
      %2119 = func.call @cc_cons(%2118, %2117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2119) : (i64) -> ()
      %2120 = func.call @stack_pop_pointer() : () -> i64
      %2121 = func.call @stack_pop_pointer() : () -> i64
      %2122 = func.call @cc_cons(%2121, %2120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2122) : (i64) -> ()
      %2123 = func.call @stack_pop_pointer() : () -> i64
      %2124 = func.call @stack_pop_pointer() : () -> i64
      %2125 = func.call @cc_cons(%2124, %2123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2126 = func.call @stack_pop_pointer() : () -> i64
      %2127 = func.call @stack_pop_pointer() : () -> i64
      %2128 = func.call @cc_cons(%2127, %2126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2128) : (i64) -> ()
      %2129 = func.call @stack_pop_pointer() : () -> i64
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_cons(%2130, %2129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2132 = func.call @stack_pop_pointer() : () -> i64
      %2133 = func.call @stack_pop_pointer() : () -> i64
      %2134 = func.call @cc_cons(%2133, %2132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2134) : (i64) -> ()
      %2135 = func.call @stack_pop_pointer() : () -> i64
      %2136 = func.call @stack_pop_pointer() : () -> i64
      %2137 = func.call @cc_cons(%2136, %2135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2137) : (i64) -> ()
      %2138 = func.call @stack_pop_pointer() : () -> i64
      %2139 = func.call @stack_pop_pointer() : () -> i64
      %2140 = func.call @cc_cons(%2139, %2138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2140) : (i64) -> ()
      %2141 = func.call @stack_pop_pointer() : () -> i64
      %2142 = func.call @stack_pop_pointer() : () -> i64
      %2143 = func.call @cc_cons(%2142, %2141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2143) : (i64) -> ()
      %2144 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2145 = arith.constant 4 : i64
      %2146 = func.call @cc_make_string(%2144, %2145) : (!llvm.ptr, i64) -> i64
      %2147 = func.call @cc_nil_value() : () -> i64
      %2148 = func.call @cc_intern(%2146, %2147) : (i64, i64) -> i64
      %2149 = func.call @cc_nil_value() : () -> i64
      %2150 = func.call @cc_cons(%2148, %2149) : (i64, i64) -> i64
      %2151 = func.call @cc_values_pack(%2150) : (i64) -> i64
      func.call @stack_push_pointer(%2148) : (i64) -> ()
      %2152 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2153 = arith.constant 1 : i64
      %2154 = func.call @cc_make_string(%2152, %2153) : (!llvm.ptr, i64) -> i64
      %2155 = func.call @cc_nil_value() : () -> i64
      %2156 = func.call @cc_intern(%2154, %2155) : (i64, i64) -> i64
      %2157 = func.call @cc_nil_value() : () -> i64
      %2158 = func.call @cc_cons(%2156, %2157) : (i64, i64) -> i64
      %2159 = func.call @cc_values_pack(%2158) : (i64) -> i64
      func.call @stack_push_pointer(%2156) : (i64) -> ()
      %2160 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2161 = arith.constant 1 : i64
      %2162 = func.call @cc_make_string(%2160, %2161) : (!llvm.ptr, i64) -> i64
      %2163 = func.call @cc_nil_value() : () -> i64
      %2164 = func.call @cc_intern(%2162, %2163) : (i64, i64) -> i64
      %2165 = func.call @cc_nil_value() : () -> i64
      %2166 = func.call @cc_cons(%2164, %2165) : (i64, i64) -> i64
      %2167 = func.call @cc_values_pack(%2166) : (i64) -> i64
      func.call @stack_push_pointer(%2164) : (i64) -> ()
      %2168 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2169 = arith.constant 1 : i64
      %2170 = func.call @cc_make_string(%2168, %2169) : (!llvm.ptr, i64) -> i64
      %2171 = func.call @cc_nil_value() : () -> i64
      %2172 = func.call @cc_intern(%2170, %2171) : (i64, i64) -> i64
      %2173 = func.call @cc_nil_value() : () -> i64
      %2174 = func.call @cc_cons(%2172, %2173) : (i64, i64) -> i64
      %2175 = func.call @cc_values_pack(%2174) : (i64) -> i64
      func.call @stack_push_pointer(%2172) : (i64) -> ()
      %2176 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2176) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2177 = func.call @stack_pop_pointer() : () -> i64
      %2178 = func.call @stack_pop_pointer() : () -> i64
      %2179 = func.call @cc_cons(%2178, %2177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2179) : (i64) -> ()
      %2180 = func.call @stack_pop_pointer() : () -> i64
      %2181 = func.call @stack_pop_pointer() : () -> i64
      %2182 = func.call @cc_cons(%2181, %2180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2182) : (i64) -> ()
      %2183 = func.call @stack_pop_pointer() : () -> i64
      %2184 = func.call @stack_pop_pointer() : () -> i64
      %2185 = func.call @cc_cons(%2184, %2183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2185) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2186 = func.call @stack_pop_pointer() : () -> i64
      %2187 = func.call @stack_pop_pointer() : () -> i64
      %2188 = func.call @cc_cons(%2187, %2186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2188) : (i64) -> ()
      %2189 = func.call @stack_pop_pointer() : () -> i64
      %2190 = func.call @stack_pop_pointer() : () -> i64
      %2191 = func.call @cc_cons(%2190, %2189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2191) : (i64) -> ()
      %2192 = func.call @stack_pop_pointer() : () -> i64
      %2193 = func.call @stack_pop_pointer() : () -> i64
      %2194 = func.call @cc_cons(%2193, %2192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2195 = func.call @stack_pop_pointer() : () -> i64
      %2196 = func.call @stack_pop_pointer() : () -> i64
      %2197 = func.call @cc_cons(%2196, %2195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2197) : (i64) -> ()
      %2198 = func.call @stack_pop_pointer() : () -> i64
      %2199 = func.call @stack_pop_pointer() : () -> i64
      %2200 = func.call @cc_cons(%2199, %2198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2200) : (i64) -> ()
      %2201 = func.call @stack_pop_pointer() : () -> i64
      %2202 = func.call @stack_pop_pointer() : () -> i64
      %2203 = func.call @cc_cons(%2202, %2201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2203) : (i64) -> ()
      %2204 = func.call @stack_pop_pointer() : () -> i64
      %2205 = func.call @stack_pop_pointer() : () -> i64
      %2206 = func.call @cc_cons(%2205, %2204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2206) : (i64) -> ()
      %2207 = func.call @stack_pop_pointer() : () -> i64
      %2208 = func.call @stack_pop_pointer() : () -> i64
      %2209 = func.call @cc_cons(%2208, %2207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2209) : (i64) -> ()
      %2210 = func.call @stack_pop_pointer() : () -> i64
      %2211 = func.call @stack_pop_pointer() : () -> i64
      %2212 = func.call @cc_cons(%2211, %2210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2212) : (i64) -> ()
      %2213 = func.call @stack_pop_pointer() : () -> i64
      %2214 = func.call @stack_pop_pointer() : () -> i64
      %2215 = func.call @cc_cons(%2214, %2213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2215) : (i64) -> ()
      %2216 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2217 = arith.constant 2 : i64
      %2218 = func.call @cc_make_string(%2216, %2217) : (!llvm.ptr, i64) -> i64
      %2219 = func.call @cc_nil_value() : () -> i64
      %2220 = func.call @cc_intern(%2218, %2219) : (i64, i64) -> i64
      %2221 = func.call @cc_nil_value() : () -> i64
      %2222 = func.call @cc_cons(%2220, %2221) : (i64, i64) -> i64
      %2223 = func.call @cc_values_pack(%2222) : (i64) -> i64
      func.call @stack_push_pointer(%2220) : (i64) -> ()
      %2224 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2225 = arith.constant 17 : i64
      %2226 = func.call @cc_make_string(%2224, %2225) : (!llvm.ptr, i64) -> i64
      %2227 = func.call @cc_nil_value() : () -> i64
      %2228 = func.call @cc_intern(%2226, %2227) : (i64, i64) -> i64
      %2229 = func.call @cc_nil_value() : () -> i64
      %2230 = func.call @cc_cons(%2228, %2229) : (i64, i64) -> i64
      %2231 = func.call @cc_values_pack(%2230) : (i64) -> i64
      func.call @stack_push_pointer(%2228) : (i64) -> ()
      %2232 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2233 = arith.constant 5 : i64
      %2234 = func.call @cc_make_string(%2232, %2233) : (!llvm.ptr, i64) -> i64
      %2235 = func.call @cc_nil_value() : () -> i64
      %2236 = func.call @cc_intern(%2234, %2235) : (i64, i64) -> i64
      %2237 = func.call @cc_nil_value() : () -> i64
      %2238 = func.call @cc_cons(%2236, %2237) : (i64, i64) -> i64
      %2239 = func.call @cc_values_pack(%2238) : (i64) -> i64
      func.call @stack_push_pointer(%2236) : (i64) -> ()
      %2240 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2241 = arith.constant 4 : i64
      %2242 = func.call @cc_make_string(%2240, %2241) : (!llvm.ptr, i64) -> i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_intern(%2242, %2243) : (i64, i64) -> i64
      %2245 = func.call @cc_nil_value() : () -> i64
      %2246 = func.call @cc_cons(%2244, %2245) : (i64, i64) -> i64
      %2247 = func.call @cc_values_pack(%2246) : (i64) -> i64
      func.call @stack_push_pointer(%2244) : (i64) -> ()
      %2248 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2249 = arith.constant 1 : i64
      %2250 = func.call @cc_make_string(%2248, %2249) : (!llvm.ptr, i64) -> i64
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_intern(%2250, %2251) : (i64, i64) -> i64
      %2253 = func.call @cc_nil_value() : () -> i64
      %2254 = func.call @cc_cons(%2252, %2253) : (i64, i64) -> i64
      %2255 = func.call @cc_values_pack(%2254) : (i64) -> i64
      func.call @stack_push_pointer(%2252) : (i64) -> ()
      %2256 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2257 = arith.constant 19 : i64
      %2258 = func.call @cc_make_string(%2256, %2257) : (!llvm.ptr, i64) -> i64
      %2259 = func.call @cc_nil_value() : () -> i64
      %2260 = func.call @cc_intern(%2258, %2259) : (i64, i64) -> i64
      %2261 = func.call @cc_nil_value() : () -> i64
      %2262 = func.call @cc_cons(%2260, %2261) : (i64, i64) -> i64
      %2263 = func.call @cc_values_pack(%2262) : (i64) -> i64
      func.call @stack_push_pointer(%2260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2264 = func.call @stack_pop_pointer() : () -> i64
      %2265 = func.call @stack_pop_pointer() : () -> i64
      %2266 = func.call @cc_cons(%2265, %2264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2266) : (i64) -> ()
      %2267 = func.call @stack_pop_pointer() : () -> i64
      %2268 = func.call @stack_pop_pointer() : () -> i64
      %2269 = func.call @cc_cons(%2268, %2267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2269) : (i64) -> ()
      %2270 = func.call @stack_pop_pointer() : () -> i64
      %2271 = func.call @stack_pop_pointer() : () -> i64
      %2272 = func.call @cc_cons(%2271, %2270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2273 = func.call @stack_pop_pointer() : () -> i64
      %2274 = func.call @stack_pop_pointer() : () -> i64
      %2275 = func.call @cc_cons(%2274, %2273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2275) : (i64) -> ()
      %2276 = func.call @stack_pop_pointer() : () -> i64
      %2277 = func.call @stack_pop_pointer() : () -> i64
      %2278 = func.call @cc_cons(%2277, %2276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2279 = func.call @stack_pop_pointer() : () -> i64
      %2280 = func.call @stack_pop_pointer() : () -> i64
      %2281 = func.call @cc_cons(%2280, %2279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2281) : (i64) -> ()
      %2282 = func.call @stack_pop_pointer() : () -> i64
      %2283 = func.call @stack_pop_pointer() : () -> i64
      %2284 = func.call @cc_cons(%2283, %2282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2284) : (i64) -> ()
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @stack_pop_pointer() : () -> i64
      %2287 = func.call @cc_cons(%2286, %2285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2287) : (i64) -> ()
      %2288 = func.call @stack_pop_pointer() : () -> i64
      %2289 = func.call @stack_pop_pointer() : () -> i64
      %2290 = func.call @cc_cons(%2289, %2288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2290) : (i64) -> ()
      %2291 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2292 = arith.constant 15 : i64
      %2293 = func.call @cc_make_string(%2291, %2292) : (!llvm.ptr, i64) -> i64
      %2294 = func.call @cc_nil_value() : () -> i64
      %2295 = func.call @cc_intern(%2293, %2294) : (i64, i64) -> i64
      %2296 = func.call @cc_nil_value() : () -> i64
      %2297 = func.call @cc_cons(%2295, %2296) : (i64, i64) -> i64
      %2298 = func.call @cc_values_pack(%2297) : (i64) -> i64
      func.call @stack_push_pointer(%2295) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2299 = func.call @stack_pop_pointer() : () -> i64
      %2300 = func.call @stack_pop_pointer() : () -> i64
      %2301 = func.call @cc_cons(%2300, %2299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2301) : (i64) -> ()
      %2302 = func.call @stack_pop_pointer() : () -> i64
      %2303 = func.call @stack_pop_pointer() : () -> i64
      %2304 = func.call @cc_cons(%2303, %2302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2304) : (i64) -> ()
      %2305 = func.call @stack_pop_pointer() : () -> i64
      %2306 = func.call @stack_pop_pointer() : () -> i64
      %2307 = func.call @cc_cons(%2306, %2305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2307) : (i64) -> ()
      %2308 = func.call @stack_pop_pointer() : () -> i64
      %2309 = func.call @stack_pop_pointer() : () -> i64
      %2310 = func.call @cc_cons(%2309, %2308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2310) : (i64) -> ()
      %2311 = func.call @stack_pop_pointer() : () -> i64
      %2312 = func.call @stack_pop_pointer() : () -> i64
      %2313 = func.call @cc_cons(%2312, %2311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2314 = func.call @stack_pop_pointer() : () -> i64
      %2315 = func.call @stack_pop_pointer() : () -> i64
      %2316 = func.call @cc_cons(%2315, %2314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2316) : (i64) -> ()
      %2317 = func.call @stack_pop_pointer() : () -> i64
      %2318 = func.call @stack_pop_pointer() : () -> i64
      %2319 = func.call @cc_cons(%2318, %2317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2319) : (i64) -> ()
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @cc_cons(%2321, %2320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2628 = arith.constant 271595545296901 : i64
      %2629 = arith.constant 0 : i64
      %2630 = func.call @cc_make_closure(%2628, %2629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2630) : (i64) -> ()
      %2631 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = func.call @stack_pop_pointer() : () -> i64
      %2634 = func.call @cc_cons(%2633, %2632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2634) : (i64) -> ()
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2637 = arith.constant 11 : i64
      %2638 = func.call @cc_make_string(%2636, %2637) : (!llvm.ptr, i64) -> i64
      %2639 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2640 = arith.constant 7 : i64
      %2641 = func.call @cc_make_string(%2639, %2640) : (!llvm.ptr, i64) -> i64
      %2642 = func.call @cc_intern(%2638, %2641) : (i64, i64) -> i64
      %2643 = func.call @cc_nil_value() : () -> i64
      %2644 = func.call @cc_cons(%2642, %2643) : (i64, i64) -> i64
      %2645 = func.call @cc_values_pack(%2644) : (i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      %2646 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2649 = arith.constant 4 : i64
      %2650 = func.call @cc_make_string(%2648, %2649) : (!llvm.ptr, i64) -> i64
      %2651 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2652 = arith.constant 7 : i64
      %2653 = func.call @cc_make_string(%2651, %2652) : (!llvm.ptr, i64) -> i64
      %2654 = func.call @cc_intern(%2650, %2653) : (i64, i64) -> i64
      %2655 = func.call @cc_nil_value() : () -> i64
      %2656 = func.call @cc_cons(%2654, %2655) : (i64, i64) -> i64
      %2657 = func.call @cc_values_pack(%2656) : (i64) -> i64
      func.call @stack_push_pointer(%2654) : (i64) -> ()
      %2658 = func.call @stack_pop_pointer() : () -> i64
      %2659 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2660 = arith.constant 6 : i64
      %2661 = func.call @cc_make_string(%2659, %2660) : (!llvm.ptr, i64) -> i64
      %2662 = func.call @cc_nil_value() : () -> i64
      %2663 = func.call @cc_intern(%2661, %2662) : (i64, i64) -> i64
      %2664 = func.call @cc_nil_value() : () -> i64
      %2665 = func.call @cc_cons(%2663, %2664) : (i64, i64) -> i64
      %2666 = func.call @cc_values_pack(%2665) : (i64) -> i64
      func.call @stack_push_pointer(%2663) : (i64) -> ()
      %2667 = func.call @stack_pop_pointer() : () -> i64
      %2668 = func.call @cc_nil_value() : () -> i64
      %2669 = func.call @cc_errorp(%1623) : (i64) -> i64
      %2670 = arith.cmpi ne, %2669, %2668 : i64
      %2671 = arith.cmpi eq, %2668, %2668 : i64
      %2672 = arith.andi %2670, %2671 : i1
      %2673 = scf.if %2672 -> (i64) {
        scf.yield %1623 : i64
      } else {
        scf.yield %2668 : i64
      }
      %2674 = func.call @cc_errorp(%2323) : (i64) -> i64
      %2675 = arith.cmpi ne, %2674, %2668 : i64
      %2676 = arith.cmpi eq, %2673, %2668 : i64
      %2677 = arith.andi %2675, %2676 : i1
      %2678 = scf.if %2677 -> (i64) {
        scf.yield %2323 : i64
      } else {
        scf.yield %2673 : i64
      }
      %2679 = func.call @cc_errorp(%2631) : (i64) -> i64
      %2680 = arith.cmpi ne, %2679, %2668 : i64
      %2681 = arith.cmpi eq, %2678, %2668 : i64
      %2682 = arith.andi %2680, %2681 : i1
      %2683 = scf.if %2682 -> (i64) {
        scf.yield %2631 : i64
      } else {
        scf.yield %2678 : i64
      }
      %2684 = func.call @cc_errorp(%2635) : (i64) -> i64
      %2685 = arith.cmpi ne, %2684, %2668 : i64
      %2686 = arith.cmpi eq, %2683, %2668 : i64
      %2687 = arith.andi %2685, %2686 : i1
      %2688 = scf.if %2687 -> (i64) {
        scf.yield %2635 : i64
      } else {
        scf.yield %2683 : i64
      }
      %2689 = func.call @cc_errorp(%2646) : (i64) -> i64
      %2690 = arith.cmpi ne, %2689, %2668 : i64
      %2691 = arith.cmpi eq, %2688, %2668 : i64
      %2692 = arith.andi %2690, %2691 : i1
      %2693 = scf.if %2692 -> (i64) {
        scf.yield %2646 : i64
      } else {
        scf.yield %2688 : i64
      }
      %2694 = func.call @cc_errorp(%2647) : (i64) -> i64
      %2695 = arith.cmpi ne, %2694, %2668 : i64
      %2696 = arith.cmpi eq, %2693, %2668 : i64
      %2697 = arith.andi %2695, %2696 : i1
      %2698 = scf.if %2697 -> (i64) {
        scf.yield %2647 : i64
      } else {
        scf.yield %2693 : i64
      }
      %2699 = func.call @cc_errorp(%2658) : (i64) -> i64
      %2700 = arith.cmpi ne, %2699, %2668 : i64
      %2701 = arith.cmpi eq, %2698, %2668 : i64
      %2702 = arith.andi %2700, %2701 : i1
      %2703 = scf.if %2702 -> (i64) {
        scf.yield %2658 : i64
      } else {
        scf.yield %2698 : i64
      }
      %2704 = func.call @cc_errorp(%2667) : (i64) -> i64
      %2705 = arith.cmpi ne, %2704, %2668 : i64
      %2706 = arith.cmpi eq, %2703, %2668 : i64
      %2707 = arith.andi %2705, %2706 : i1
      %2708 = scf.if %2707 -> (i64) {
        scf.yield %2667 : i64
      } else {
        scf.yield %2703 : i64
      }
      %2709 = arith.cmpi ne, %2708, %2668 : i64
      scf.if %2709 {
        func.call @stack_push_pointer(%2708) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1623) : (i64) -> ()
        func.call @stack_push_pointer(%2323) : (i64) -> ()
        func.call @stack_push_pointer(%2631) : (i64) -> ()
        func.call @stack_push_pointer(%2635) : (i64) -> ()
        func.call @stack_push_pointer(%2646) : (i64) -> ()
        func.call @stack_push_pointer(%2647) : (i64) -> ()
        func.call @stack_push_pointer(%2658) : (i64) -> ()
        func.call @stack_push_pointer(%2667) : (i64) -> ()
        %2710 = llvm.mlir.addressof @str194 : !llvm.ptr
        %2711 = func.call @cc_make_function_ref_const(%2710) : (!llvm.ptr) -> i64
        %2712 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2711, %2712) : (i64, i64) -> ()
      }
      %2713 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2713 : i64
    }
    %2714 = func.call @cc_nil_value() : () -> i64
    %2715 = func.call @cc_errorp(%1614) : (i64) -> i64
    %2716 = arith.cmpi ne, %2715, %2714 : i64
    %2717 = scf.if %2716 -> (i64) {
      scf.yield %1614 : i64
    } else {
      %2718 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2719 = arith.constant 15 : i64
      %2720 = func.call @cc_make_string(%2718, %2719) : (!llvm.ptr, i64) -> i64
      %2721 = func.call @cc_nil_value() : () -> i64
      %2722 = func.call @cc_intern(%2720, %2721) : (i64, i64) -> i64
      %2723 = func.call @cc_nil_value() : () -> i64
      %2724 = func.call @cc_cons(%2722, %2723) : (i64, i64) -> i64
      %2725 = func.call @cc_values_pack(%2724) : (i64) -> i64
      func.call @stack_push_pointer(%2722) : (i64) -> ()
      %2726 = func.call @stack_pop_pointer() : () -> i64
      %2727 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2728 = arith.constant 4 : i64
      %2729 = func.call @cc_make_string(%2727, %2728) : (!llvm.ptr, i64) -> i64
      %2730 = func.call @cc_nil_value() : () -> i64
      %2731 = func.call @cc_intern(%2729, %2730) : (i64, i64) -> i64
      %2732 = func.call @cc_nil_value() : () -> i64
      %2733 = func.call @cc_cons(%2731, %2732) : (i64, i64) -> i64
      %2734 = func.call @cc_values_pack(%2733) : (i64) -> i64
      func.call @stack_push_pointer(%2731) : (i64) -> ()
      %2735 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2736 = arith.constant 1 : i64
      %2737 = func.call @cc_make_string(%2735, %2736) : (!llvm.ptr, i64) -> i64
      %2738 = func.call @cc_nil_value() : () -> i64
      %2739 = func.call @cc_intern(%2737, %2738) : (i64, i64) -> i64
      %2740 = func.call @cc_nil_value() : () -> i64
      %2741 = func.call @cc_cons(%2739, %2740) : (i64, i64) -> i64
      %2742 = func.call @cc_values_pack(%2741) : (i64) -> i64
      func.call @stack_push_pointer(%2739) : (i64) -> ()
      %2743 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2743) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2744 = func.call @stack_pop_pointer() : () -> i64
      %2745 = func.call @stack_pop_pointer() : () -> i64
      %2746 = func.call @cc_cons(%2745, %2744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2746) : (i64) -> ()
      %2747 = func.call @stack_pop_pointer() : () -> i64
      %2748 = func.call @stack_pop_pointer() : () -> i64
      %2749 = func.call @cc_cons(%2748, %2747) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2749) : (i64) -> ()
      %2750 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2751 = arith.constant 19 : i64
      %2752 = func.call @cc_make_string(%2750, %2751) : (!llvm.ptr, i64) -> i64
      %2753 = func.call @cc_nil_value() : () -> i64
      %2754 = func.call @cc_intern(%2752, %2753) : (i64, i64) -> i64
      %2755 = func.call @cc_nil_value() : () -> i64
      %2756 = func.call @cc_cons(%2754, %2755) : (i64, i64) -> i64
      %2757 = func.call @cc_values_pack(%2756) : (i64) -> i64
      func.call @stack_push_pointer(%2754) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2758 = func.call @stack_pop_pointer() : () -> i64
      %2759 = func.call @stack_pop_pointer() : () -> i64
      %2760 = func.call @cc_cons(%2759, %2758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2760) : (i64) -> ()
      %2761 = func.call @stack_pop_pointer() : () -> i64
      %2762 = func.call @stack_pop_pointer() : () -> i64
      %2763 = func.call @cc_cons(%2762, %2761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2763) : (i64) -> ()
      %2764 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2765 = arith.constant 1 : i64
      %2766 = func.call @cc_make_string(%2764, %2765) : (!llvm.ptr, i64) -> i64
      %2767 = func.call @cc_nil_value() : () -> i64
      %2768 = func.call @cc_intern(%2766, %2767) : (i64, i64) -> i64
      %2769 = func.call @cc_nil_value() : () -> i64
      %2770 = func.call @cc_cons(%2768, %2769) : (i64, i64) -> i64
      %2771 = func.call @cc_values_pack(%2770) : (i64) -> i64
      func.call @stack_push_pointer(%2768) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @stack_pop_pointer() : () -> i64
      %2774 = func.call @cc_cons(%2773, %2772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      %2775 = func.call @stack_pop_pointer() : () -> i64
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @cc_cons(%2776, %2775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2777) : (i64) -> ()
      %2778 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2779 = arith.constant 15 : i64
      %2780 = func.call @cc_make_string(%2778, %2779) : (!llvm.ptr, i64) -> i64
      %2781 = func.call @cc_nil_value() : () -> i64
      %2782 = func.call @cc_intern(%2780, %2781) : (i64, i64) -> i64
      %2783 = func.call @cc_nil_value() : () -> i64
      %2784 = func.call @cc_cons(%2782, %2783) : (i64, i64) -> i64
      %2785 = func.call @cc_values_pack(%2784) : (i64) -> i64
      func.call @stack_push_pointer(%2782) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2786 = func.call @stack_pop_pointer() : () -> i64
      %2787 = func.call @stack_pop_pointer() : () -> i64
      %2788 = func.call @cc_cons(%2787, %2786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2788) : (i64) -> ()
      %2789 = func.call @stack_pop_pointer() : () -> i64
      %2790 = func.call @stack_pop_pointer() : () -> i64
      %2791 = func.call @cc_cons(%2790, %2789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2791) : (i64) -> ()
      %2792 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2793 = arith.constant 17 : i64
      %2794 = func.call @cc_make_string(%2792, %2793) : (!llvm.ptr, i64) -> i64
      %2795 = func.call @cc_nil_value() : () -> i64
      %2796 = func.call @cc_intern(%2794, %2795) : (i64, i64) -> i64
      %2797 = func.call @cc_nil_value() : () -> i64
      %2798 = func.call @cc_cons(%2796, %2797) : (i64, i64) -> i64
      %2799 = func.call @cc_values_pack(%2798) : (i64) -> i64
      func.call @stack_push_pointer(%2796) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = func.call @stack_pop_pointer() : () -> i64
      %2802 = func.call @cc_cons(%2801, %2800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2802) : (i64) -> ()
      %2803 = func.call @stack_pop_pointer() : () -> i64
      %2804 = func.call @stack_pop_pointer() : () -> i64
      %2805 = func.call @cc_cons(%2804, %2803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2805) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2806 = func.call @stack_pop_pointer() : () -> i64
      %2807 = func.call @stack_pop_pointer() : () -> i64
      %2808 = func.call @cc_cons(%2807, %2806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2808) : (i64) -> ()
      %2809 = func.call @stack_pop_pointer() : () -> i64
      %2810 = func.call @stack_pop_pointer() : () -> i64
      %2811 = func.call @cc_cons(%2810, %2809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2811) : (i64) -> ()
      %2812 = func.call @stack_pop_pointer() : () -> i64
      %2813 = func.call @stack_pop_pointer() : () -> i64
      %2814 = func.call @cc_cons(%2813, %2812) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2814) : (i64) -> ()
      %2815 = func.call @stack_pop_pointer() : () -> i64
      %2816 = func.call @stack_pop_pointer() : () -> i64
      %2817 = func.call @cc_cons(%2816, %2815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2817) : (i64) -> ()
      %2818 = func.call @stack_pop_pointer() : () -> i64
      %2819 = func.call @stack_pop_pointer() : () -> i64
      %2820 = func.call @cc_cons(%2819, %2818) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2820) : (i64) -> ()
      %2821 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2822 = arith.constant 5 : i64
      %2823 = func.call @cc_make_string(%2821, %2822) : (!llvm.ptr, i64) -> i64
      %2824 = func.call @cc_nil_value() : () -> i64
      %2825 = func.call @cc_intern(%2823, %2824) : (i64, i64) -> i64
      %2826 = func.call @cc_nil_value() : () -> i64
      %2827 = func.call @cc_cons(%2825, %2826) : (i64, i64) -> i64
      %2828 = func.call @cc_values_pack(%2827) : (i64) -> i64
      func.call @stack_push_pointer(%2825) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2829 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2830 = arith.constant 5 : i64
      %2831 = func.call @cc_make_string(%2829, %2830) : (!llvm.ptr, i64) -> i64
      %2832 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2833 = arith.constant 3 : i64
      %2834 = func.call @cc_make_string(%2832, %2833) : (!llvm.ptr, i64) -> i64
      %2835 = func.call @cc_intern(%2831, %2834) : (i64, i64) -> i64
      %2836 = func.call @cc_nil_value() : () -> i64
      %2837 = func.call @cc_cons(%2835, %2836) : (i64, i64) -> i64
      %2838 = func.call @cc_values_pack(%2837) : (i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      %2839 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2840 = arith.constant 1 : i64
      %2841 = func.call @cc_make_string(%2839, %2840) : (!llvm.ptr, i64) -> i64
      %2842 = func.call @cc_nil_value() : () -> i64
      %2843 = func.call @cc_intern(%2841, %2842) : (i64, i64) -> i64
      %2844 = func.call @cc_nil_value() : () -> i64
      %2845 = func.call @cc_cons(%2843, %2844) : (i64, i64) -> i64
      %2846 = func.call @cc_values_pack(%2845) : (i64) -> i64
      func.call @stack_push_pointer(%2843) : (i64) -> ()
      %2847 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2848 = arith.constant 1 : i64
      %2849 = func.call @cc_make_string(%2847, %2848) : (!llvm.ptr, i64) -> i64
      %2850 = func.call @cc_nil_value() : () -> i64
      %2851 = func.call @cc_intern(%2849, %2850) : (i64, i64) -> i64
      %2852 = func.call @cc_nil_value() : () -> i64
      %2853 = func.call @cc_cons(%2851, %2852) : (i64, i64) -> i64
      %2854 = func.call @cc_values_pack(%2853) : (i64) -> i64
      func.call @stack_push_pointer(%2851) : (i64) -> ()
      %2855 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2856 = arith.constant 15 : i64
      %2857 = func.call @cc_make_string(%2855, %2856) : (!llvm.ptr, i64) -> i64
      %2858 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2859 = arith.constant 11 : i64
      %2860 = func.call @cc_make_string(%2858, %2859) : (!llvm.ptr, i64) -> i64
      %2861 = func.call @cc_intern(%2857, %2860) : (i64, i64) -> i64
      %2862 = func.call @cc_nil_value() : () -> i64
      %2863 = func.call @cc_cons(%2861, %2862) : (i64, i64) -> i64
      %2864 = func.call @cc_values_pack(%2863) : (i64) -> i64
      func.call @stack_push_pointer(%2861) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2865 = func.call @stack_pop_pointer() : () -> i64
      %2866 = func.call @stack_pop_pointer() : () -> i64
      %2867 = func.call @cc_cons(%2866, %2865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2867) : (i64) -> ()
      %2868 = func.call @stack_pop_pointer() : () -> i64
      %2869 = func.call @stack_pop_pointer() : () -> i64
      %2870 = func.call @cc_cons(%2869, %2868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2870) : (i64) -> ()
      %2871 = func.call @stack_pop_pointer() : () -> i64
      %2872 = func.call @stack_pop_pointer() : () -> i64
      %2873 = func.call @cc_cons(%2872, %2871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2873) : (i64) -> ()
      %2874 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2875 = arith.constant 4 : i64
      %2876 = func.call @cc_make_string(%2874, %2875) : (!llvm.ptr, i64) -> i64
      %2877 = func.call @cc_nil_value() : () -> i64
      %2878 = func.call @cc_intern(%2876, %2877) : (i64, i64) -> i64
      %2879 = func.call @cc_nil_value() : () -> i64
      %2880 = func.call @cc_cons(%2878, %2879) : (i64, i64) -> i64
      %2881 = func.call @cc_values_pack(%2880) : (i64) -> i64
      func.call @stack_push_pointer(%2878) : (i64) -> ()
      %2882 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2883 = arith.constant 17 : i64
      %2884 = func.call @cc_make_string(%2882, %2883) : (!llvm.ptr, i64) -> i64
      %2885 = func.call @cc_nil_value() : () -> i64
      %2886 = func.call @cc_intern(%2884, %2885) : (i64, i64) -> i64
      %2887 = func.call @cc_nil_value() : () -> i64
      %2888 = func.call @cc_cons(%2886, %2887) : (i64, i64) -> i64
      %2889 = func.call @cc_values_pack(%2888) : (i64) -> i64
      func.call @stack_push_pointer(%2886) : (i64) -> ()
      %2890 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2890) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2891 = func.call @stack_pop_pointer() : () -> i64
      %2892 = func.call @stack_pop_pointer() : () -> i64
      %2893 = func.call @cc_cons(%2892, %2891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2893) : (i64) -> ()
      %2894 = func.call @stack_pop_pointer() : () -> i64
      %2895 = func.call @stack_pop_pointer() : () -> i64
      %2896 = func.call @cc_cons(%2895, %2894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2896) : (i64) -> ()
      %2897 = func.call @stack_pop_pointer() : () -> i64
      %2898 = func.call @stack_pop_pointer() : () -> i64
      %2899 = func.call @cc_cons(%2898, %2897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2899) : (i64) -> ()
      %2900 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2901 = arith.constant 4 : i64
      %2902 = func.call @cc_make_string(%2900, %2901) : (!llvm.ptr, i64) -> i64
      %2903 = func.call @cc_nil_value() : () -> i64
      %2904 = func.call @cc_intern(%2902, %2903) : (i64, i64) -> i64
      %2905 = func.call @cc_nil_value() : () -> i64
      %2906 = func.call @cc_cons(%2904, %2905) : (i64, i64) -> i64
      %2907 = func.call @cc_values_pack(%2906) : (i64) -> i64
      func.call @stack_push_pointer(%2904) : (i64) -> ()
      %2908 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2909 = arith.constant 19 : i64
      %2910 = func.call @cc_make_string(%2908, %2909) : (!llvm.ptr, i64) -> i64
      %2911 = func.call @cc_nil_value() : () -> i64
      %2912 = func.call @cc_intern(%2910, %2911) : (i64, i64) -> i64
      %2913 = func.call @cc_nil_value() : () -> i64
      %2914 = func.call @cc_cons(%2912, %2913) : (i64, i64) -> i64
      %2915 = func.call @cc_values_pack(%2914) : (i64) -> i64
      func.call @stack_push_pointer(%2912) : (i64) -> ()
      %2916 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2917 = arith.constant 1 : i64
      %2918 = func.call @cc_make_string(%2916, %2917) : (!llvm.ptr, i64) -> i64
      %2919 = func.call @cc_nil_value() : () -> i64
      %2920 = func.call @cc_intern(%2918, %2919) : (i64, i64) -> i64
      %2921 = func.call @cc_nil_value() : () -> i64
      %2922 = func.call @cc_cons(%2920, %2921) : (i64, i64) -> i64
      %2923 = func.call @cc_values_pack(%2922) : (i64) -> i64
      func.call @stack_push_pointer(%2920) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2924 = func.call @stack_pop_pointer() : () -> i64
      %2925 = func.call @stack_pop_pointer() : () -> i64
      %2926 = func.call @cc_cons(%2925, %2924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2926) : (i64) -> ()
      %2927 = func.call @stack_pop_pointer() : () -> i64
      %2928 = func.call @stack_pop_pointer() : () -> i64
      %2929 = func.call @cc_cons(%2928, %2927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2929) : (i64) -> ()
      %2930 = func.call @stack_pop_pointer() : () -> i64
      %2931 = func.call @stack_pop_pointer() : () -> i64
      %2932 = func.call @cc_cons(%2931, %2930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2932) : (i64) -> ()
      %2933 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2934 = arith.constant 4 : i64
      %2935 = func.call @cc_make_string(%2933, %2934) : (!llvm.ptr, i64) -> i64
      %2936 = func.call @cc_nil_value() : () -> i64
      %2937 = func.call @cc_intern(%2935, %2936) : (i64, i64) -> i64
      %2938 = func.call @cc_nil_value() : () -> i64
      %2939 = func.call @cc_cons(%2937, %2938) : (i64, i64) -> i64
      %2940 = func.call @cc_values_pack(%2939) : (i64) -> i64
      func.call @stack_push_pointer(%2937) : (i64) -> ()
      %2941 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2942 = arith.constant 1 : i64
      %2943 = func.call @cc_make_string(%2941, %2942) : (!llvm.ptr, i64) -> i64
      %2944 = func.call @cc_nil_value() : () -> i64
      %2945 = func.call @cc_intern(%2943, %2944) : (i64, i64) -> i64
      %2946 = func.call @cc_nil_value() : () -> i64
      %2947 = func.call @cc_cons(%2945, %2946) : (i64, i64) -> i64
      %2948 = func.call @cc_values_pack(%2947) : (i64) -> i64
      func.call @stack_push_pointer(%2945) : (i64) -> ()
      %2949 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2950 = arith.constant 9 : i64
      %2951 = func.call @cc_make_string(%2949, %2950) : (!llvm.ptr, i64) -> i64
      %2952 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2953 = arith.constant 11 : i64
      %2954 = func.call @cc_make_string(%2952, %2953) : (!llvm.ptr, i64) -> i64
      %2955 = func.call @cc_intern(%2951, %2954) : (i64, i64) -> i64
      %2956 = func.call @cc_nil_value() : () -> i64
      %2957 = func.call @cc_cons(%2955, %2956) : (i64, i64) -> i64
      %2958 = func.call @cc_values_pack(%2957) : (i64) -> i64
      func.call @stack_push_pointer(%2955) : (i64) -> ()
      %2959 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2960 = arith.constant 1 : i64
      %2961 = func.call @cc_make_string(%2959, %2960) : (!llvm.ptr, i64) -> i64
      %2962 = func.call @cc_nil_value() : () -> i64
      %2963 = func.call @cc_intern(%2961, %2962) : (i64, i64) -> i64
      %2964 = func.call @cc_nil_value() : () -> i64
      %2965 = func.call @cc_cons(%2963, %2964) : (i64, i64) -> i64
      %2966 = func.call @cc_values_pack(%2965) : (i64) -> i64
      func.call @stack_push_pointer(%2963) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2967 = func.call @stack_pop_pointer() : () -> i64
      %2968 = func.call @stack_pop_pointer() : () -> i64
      %2969 = func.call @cc_cons(%2968, %2967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2969) : (i64) -> ()
      %2970 = func.call @stack_pop_pointer() : () -> i64
      %2971 = func.call @stack_pop_pointer() : () -> i64
      %2972 = func.call @cc_cons(%2971, %2970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2972) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2973 = func.call @stack_pop_pointer() : () -> i64
      %2974 = func.call @stack_pop_pointer() : () -> i64
      %2975 = func.call @cc_cons(%2974, %2973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2975) : (i64) -> ()
      %2976 = func.call @stack_pop_pointer() : () -> i64
      %2977 = func.call @stack_pop_pointer() : () -> i64
      %2978 = func.call @cc_cons(%2977, %2976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2978) : (i64) -> ()
      %2979 = func.call @stack_pop_pointer() : () -> i64
      %2980 = func.call @stack_pop_pointer() : () -> i64
      %2981 = func.call @cc_cons(%2980, %2979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2981) : (i64) -> ()
      %2982 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2983 = arith.constant 2 : i64
      %2984 = func.call @cc_make_string(%2982, %2983) : (!llvm.ptr, i64) -> i64
      %2985 = func.call @cc_nil_value() : () -> i64
      %2986 = func.call @cc_intern(%2984, %2985) : (i64, i64) -> i64
      %2987 = func.call @cc_nil_value() : () -> i64
      %2988 = func.call @cc_cons(%2986, %2987) : (i64, i64) -> i64
      %2989 = func.call @cc_values_pack(%2988) : (i64) -> i64
      func.call @stack_push_pointer(%2986) : (i64) -> ()
      %2990 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2991 = arith.constant 3 : i64
      %2992 = func.call @cc_make_string(%2990, %2991) : (!llvm.ptr, i64) -> i64
      %2993 = func.call @cc_nil_value() : () -> i64
      %2994 = func.call @cc_intern(%2992, %2993) : (i64, i64) -> i64
      %2995 = func.call @cc_nil_value() : () -> i64
      %2996 = func.call @cc_cons(%2994, %2995) : (i64, i64) -> i64
      %2997 = func.call @cc_values_pack(%2996) : (i64) -> i64
      func.call @stack_push_pointer(%2994) : (i64) -> ()
      %2998 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2999 = arith.constant 2 : i64
      %3000 = func.call @cc_make_string(%2998, %2999) : (!llvm.ptr, i64) -> i64
      %3001 = llvm.mlir.addressof @str222 : !llvm.ptr
      %3002 = arith.constant 11 : i64
      %3003 = func.call @cc_make_string(%3001, %3002) : (!llvm.ptr, i64) -> i64
      %3004 = func.call @cc_intern(%3000, %3003) : (i64, i64) -> i64
      %3005 = func.call @cc_nil_value() : () -> i64
      %3006 = func.call @cc_cons(%3004, %3005) : (i64, i64) -> i64
      %3007 = func.call @cc_values_pack(%3006) : (i64) -> i64
      func.call @stack_push_pointer(%3004) : (i64) -> ()
      %3008 = llvm.mlir.addressof @str223 : !llvm.ptr
      %3009 = arith.constant 3 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = llvm.mlir.addressof @str224 : !llvm.ptr
      %3012 = arith.constant 11 : i64
      %3013 = func.call @cc_make_string(%3011, %3012) : (!llvm.ptr, i64) -> i64
      %3014 = func.call @cc_intern(%3010, %3013) : (i64, i64) -> i64
      %3015 = func.call @cc_nil_value() : () -> i64
      %3016 = func.call @cc_cons(%3014, %3015) : (i64, i64) -> i64
      %3017 = func.call @cc_values_pack(%3016) : (i64) -> i64
      func.call @stack_push_pointer(%3014) : (i64) -> ()
      %3018 = llvm.mlir.addressof @str225 : !llvm.ptr
      %3019 = arith.constant 1 : i64
      %3020 = func.call @cc_make_string(%3018, %3019) : (!llvm.ptr, i64) -> i64
      %3021 = func.call @cc_nil_value() : () -> i64
      %3022 = func.call @cc_intern(%3020, %3021) : (i64, i64) -> i64
      %3023 = func.call @cc_nil_value() : () -> i64
      %3024 = func.call @cc_cons(%3022, %3023) : (i64, i64) -> i64
      %3025 = func.call @cc_values_pack(%3024) : (i64) -> i64
      func.call @stack_push_pointer(%3022) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3026 = func.call @stack_pop_pointer() : () -> i64
      %3027 = func.call @stack_pop_pointer() : () -> i64
      %3028 = func.call @cc_cons(%3027, %3026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3028) : (i64) -> ()
      %3029 = func.call @stack_pop_pointer() : () -> i64
      %3030 = func.call @stack_pop_pointer() : () -> i64
      %3031 = func.call @cc_cons(%3030, %3029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3031) : (i64) -> ()
      %3032 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3033 = arith.constant 3 : i64
      %3034 = func.call @cc_make_string(%3032, %3033) : (!llvm.ptr, i64) -> i64
      %3035 = func.call @cc_nil_value() : () -> i64
      %3036 = func.call @cc_intern(%3034, %3035) : (i64, i64) -> i64
      %3037 = func.call @cc_nil_value() : () -> i64
      %3038 = func.call @cc_cons(%3036, %3037) : (i64, i64) -> i64
      %3039 = func.call @cc_values_pack(%3038) : (i64) -> i64
      func.call @stack_push_pointer(%3036) : (i64) -> ()
      %3040 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3041 = arith.constant 1 : i64
      %3042 = func.call @cc_make_string(%3040, %3041) : (!llvm.ptr, i64) -> i64
      %3043 = func.call @cc_nil_value() : () -> i64
      %3044 = func.call @cc_intern(%3042, %3043) : (i64, i64) -> i64
      %3045 = func.call @cc_nil_value() : () -> i64
      %3046 = func.call @cc_cons(%3044, %3045) : (i64, i64) -> i64
      %3047 = func.call @cc_values_pack(%3046) : (i64) -> i64
      func.call @stack_push_pointer(%3044) : (i64) -> ()
      %3048 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3049 = arith.constant 13 : i64
      %3050 = func.call @cc_make_string(%3048, %3049) : (!llvm.ptr, i64) -> i64
      %3051 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3052 = arith.constant 11 : i64
      %3053 = func.call @cc_make_string(%3051, %3052) : (!llvm.ptr, i64) -> i64
      %3054 = func.call @cc_intern(%3050, %3053) : (i64, i64) -> i64
      %3055 = func.call @cc_nil_value() : () -> i64
      %3056 = func.call @cc_cons(%3054, %3055) : (i64, i64) -> i64
      %3057 = func.call @cc_values_pack(%3056) : (i64) -> i64
      func.call @stack_push_pointer(%3054) : (i64) -> ()
      %3058 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3059 = arith.constant 1 : i64
      %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
      %3061 = func.call @cc_nil_value() : () -> i64
      %3062 = func.call @cc_intern(%3060, %3061) : (i64, i64) -> i64
      %3063 = func.call @cc_nil_value() : () -> i64
      %3064 = func.call @cc_cons(%3062, %3063) : (i64, i64) -> i64
      %3065 = func.call @cc_values_pack(%3064) : (i64) -> i64
      func.call @stack_push_pointer(%3062) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3066 = func.call @stack_pop_pointer() : () -> i64
      %3067 = func.call @stack_pop_pointer() : () -> i64
      %3068 = func.call @cc_cons(%3067, %3066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3068) : (i64) -> ()
      %3069 = func.call @stack_pop_pointer() : () -> i64
      %3070 = func.call @stack_pop_pointer() : () -> i64
      %3071 = func.call @cc_cons(%3070, %3069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3071) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3072 = func.call @stack_pop_pointer() : () -> i64
      %3073 = func.call @stack_pop_pointer() : () -> i64
      %3074 = func.call @cc_cons(%3073, %3072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3074) : (i64) -> ()
      %3075 = func.call @stack_pop_pointer() : () -> i64
      %3076 = func.call @stack_pop_pointer() : () -> i64
      %3077 = func.call @cc_cons(%3076, %3075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3077) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3078 = func.call @stack_pop_pointer() : () -> i64
      %3079 = func.call @stack_pop_pointer() : () -> i64
      %3080 = func.call @cc_cons(%3079, %3078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3080) : (i64) -> ()
      %3081 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3082 = arith.constant 3 : i64
      %3083 = func.call @cc_make_string(%3081, %3082) : (!llvm.ptr, i64) -> i64
      %3084 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3085 = arith.constant 11 : i64
      %3086 = func.call @cc_make_string(%3084, %3085) : (!llvm.ptr, i64) -> i64
      %3087 = func.call @cc_intern(%3083, %3086) : (i64, i64) -> i64
      %3088 = func.call @cc_nil_value() : () -> i64
      %3089 = func.call @cc_cons(%3087, %3088) : (i64, i64) -> i64
      %3090 = func.call @cc_values_pack(%3089) : (i64) -> i64
      func.call @stack_push_pointer(%3087) : (i64) -> ()
      %3091 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3092 = arith.constant 2 : i64
      %3093 = func.call @cc_make_string(%3091, %3092) : (!llvm.ptr, i64) -> i64
      %3094 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3095 = arith.constant 11 : i64
      %3096 = func.call @cc_make_string(%3094, %3095) : (!llvm.ptr, i64) -> i64
      %3097 = func.call @cc_intern(%3093, %3096) : (i64, i64) -> i64
      %3098 = func.call @cc_nil_value() : () -> i64
      %3099 = func.call @cc_cons(%3097, %3098) : (i64, i64) -> i64
      %3100 = func.call @cc_values_pack(%3099) : (i64) -> i64
      func.call @stack_push_pointer(%3097) : (i64) -> ()
      %3101 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3102 = arith.constant 12 : i64
      %3103 = func.call @cc_make_string(%3101, %3102) : (!llvm.ptr, i64) -> i64
      %3104 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3105 = arith.constant 11 : i64
      %3106 = func.call @cc_make_string(%3104, %3105) : (!llvm.ptr, i64) -> i64
      %3107 = func.call @cc_intern(%3103, %3106) : (i64, i64) -> i64
      %3108 = func.call @cc_nil_value() : () -> i64
      %3109 = func.call @cc_cons(%3107, %3108) : (i64, i64) -> i64
      %3110 = func.call @cc_values_pack(%3109) : (i64) -> i64
      func.call @stack_push_pointer(%3107) : (i64) -> ()
      %3111 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3112 = arith.constant 1 : i64
      %3113 = func.call @cc_make_string(%3111, %3112) : (!llvm.ptr, i64) -> i64
      %3114 = func.call @cc_nil_value() : () -> i64
      %3115 = func.call @cc_intern(%3113, %3114) : (i64, i64) -> i64
      %3116 = func.call @cc_nil_value() : () -> i64
      %3117 = func.call @cc_cons(%3115, %3116) : (i64, i64) -> i64
      %3118 = func.call @cc_values_pack(%3117) : (i64) -> i64
      func.call @stack_push_pointer(%3115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3119 = func.call @stack_pop_pointer() : () -> i64
      %3120 = func.call @stack_pop_pointer() : () -> i64
      %3121 = func.call @cc_cons(%3120, %3119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3121) : (i64) -> ()
      %3122 = func.call @stack_pop_pointer() : () -> i64
      %3123 = func.call @stack_pop_pointer() : () -> i64
      %3124 = func.call @cc_cons(%3123, %3122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3124) : (i64) -> ()
      %3125 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3126 = arith.constant 5 : i64
      %3127 = func.call @cc_make_string(%3125, %3126) : (!llvm.ptr, i64) -> i64
      %3128 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3129 = arith.constant 11 : i64
      %3130 = func.call @cc_make_string(%3128, %3129) : (!llvm.ptr, i64) -> i64
      %3131 = func.call @cc_intern(%3127, %3130) : (i64, i64) -> i64
      %3132 = func.call @cc_nil_value() : () -> i64
      %3133 = func.call @cc_cons(%3131, %3132) : (i64, i64) -> i64
      %3134 = func.call @cc_values_pack(%3133) : (i64) -> i64
      func.call @stack_push_pointer(%3131) : (i64) -> ()
      %3135 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3136 = arith.constant 1 : i64
      %3137 = func.call @cc_make_string(%3135, %3136) : (!llvm.ptr, i64) -> i64
      %3138 = func.call @cc_nil_value() : () -> i64
      %3139 = func.call @cc_intern(%3137, %3138) : (i64, i64) -> i64
      %3140 = func.call @cc_nil_value() : () -> i64
      %3141 = func.call @cc_cons(%3139, %3140) : (i64, i64) -> i64
      %3142 = func.call @cc_values_pack(%3141) : (i64) -> i64
      func.call @stack_push_pointer(%3139) : (i64) -> ()
      %3143 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3144 = arith.constant 1 : i64
      %3145 = func.call @cc_make_string(%3143, %3144) : (!llvm.ptr, i64) -> i64
      %3146 = func.call @cc_nil_value() : () -> i64
      %3147 = func.call @cc_intern(%3145, %3146) : (i64, i64) -> i64
      %3148 = func.call @cc_nil_value() : () -> i64
      %3149 = func.call @cc_cons(%3147, %3148) : (i64, i64) -> i64
      %3150 = func.call @cc_values_pack(%3149) : (i64) -> i64
      func.call @stack_push_pointer(%3147) : (i64) -> ()
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
      func.call @stack_push_nil() : () -> ()
      %3160 = func.call @stack_pop_pointer() : () -> i64
      %3161 = func.call @stack_pop_pointer() : () -> i64
      %3162 = func.call @cc_cons(%3161, %3160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3162) : (i64) -> ()
      %3163 = func.call @stack_pop_pointer() : () -> i64
      %3164 = func.call @stack_pop_pointer() : () -> i64
      %3165 = func.call @cc_cons(%3164, %3163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3165) : (i64) -> ()
      %3166 = func.call @stack_pop_pointer() : () -> i64
      %3167 = func.call @stack_pop_pointer() : () -> i64
      %3168 = func.call @cc_cons(%3167, %3166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3168) : (i64) -> ()
      %3169 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3170 = arith.constant 5 : i64
      %3171 = func.call @cc_make_string(%3169, %3170) : (!llvm.ptr, i64) -> i64
      %3172 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3173 = arith.constant 11 : i64
      %3174 = func.call @cc_make_string(%3172, %3173) : (!llvm.ptr, i64) -> i64
      %3175 = func.call @cc_intern(%3171, %3174) : (i64, i64) -> i64
      %3176 = func.call @cc_nil_value() : () -> i64
      %3177 = func.call @cc_cons(%3175, %3176) : (i64, i64) -> i64
      %3178 = func.call @cc_values_pack(%3177) : (i64) -> i64
      func.call @stack_push_pointer(%3175) : (i64) -> ()
      %3179 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3180 = arith.constant 1 : i64
      %3181 = func.call @cc_make_string(%3179, %3180) : (!llvm.ptr, i64) -> i64
      %3182 = func.call @cc_nil_value() : () -> i64
      %3183 = func.call @cc_intern(%3181, %3182) : (i64, i64) -> i64
      %3184 = func.call @cc_nil_value() : () -> i64
      %3185 = func.call @cc_cons(%3183, %3184) : (i64, i64) -> i64
      %3186 = func.call @cc_values_pack(%3185) : (i64) -> i64
      func.call @stack_push_pointer(%3183) : (i64) -> ()
      %3187 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3188 = arith.constant 13 : i64
      %3189 = func.call @cc_make_string(%3187, %3188) : (!llvm.ptr, i64) -> i64
      %3190 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3191 = arith.constant 11 : i64
      %3192 = func.call @cc_make_string(%3190, %3191) : (!llvm.ptr, i64) -> i64
      %3193 = func.call @cc_intern(%3189, %3192) : (i64, i64) -> i64
      %3194 = func.call @cc_nil_value() : () -> i64
      %3195 = func.call @cc_cons(%3193, %3194) : (i64, i64) -> i64
      %3196 = func.call @cc_values_pack(%3195) : (i64) -> i64
      func.call @stack_push_pointer(%3193) : (i64) -> ()
      %3197 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3198 = arith.constant 1 : i64
      %3199 = func.call @cc_make_string(%3197, %3198) : (!llvm.ptr, i64) -> i64
      %3200 = func.call @cc_nil_value() : () -> i64
      %3201 = func.call @cc_intern(%3199, %3200) : (i64, i64) -> i64
      %3202 = func.call @cc_nil_value() : () -> i64
      %3203 = func.call @cc_cons(%3201, %3202) : (i64, i64) -> i64
      %3204 = func.call @cc_values_pack(%3203) : (i64) -> i64
      func.call @stack_push_pointer(%3201) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @stack_pop_pointer() : () -> i64
      %3207 = func.call @cc_cons(%3206, %3205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3207) : (i64) -> ()
      %3208 = func.call @stack_pop_pointer() : () -> i64
      %3209 = func.call @stack_pop_pointer() : () -> i64
      %3210 = func.call @cc_cons(%3209, %3208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3211 = func.call @stack_pop_pointer() : () -> i64
      %3212 = func.call @stack_pop_pointer() : () -> i64
      %3213 = func.call @cc_cons(%3212, %3211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3213) : (i64) -> ()
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @cc_cons(%3215, %3214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3216) : (i64) -> ()
      %3217 = func.call @stack_pop_pointer() : () -> i64
      %3218 = func.call @stack_pop_pointer() : () -> i64
      %3219 = func.call @cc_cons(%3218, %3217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3219) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @stack_pop_pointer() : () -> i64
      %3222 = func.call @cc_cons(%3221, %3220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3222) : (i64) -> ()
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @stack_pop_pointer() : () -> i64
      %3225 = func.call @cc_cons(%3224, %3223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3225) : (i64) -> ()
      %3226 = func.call @stack_pop_pointer() : () -> i64
      %3227 = func.call @stack_pop_pointer() : () -> i64
      %3228 = func.call @cc_cons(%3227, %3226) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3228) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3229 = func.call @stack_pop_pointer() : () -> i64
      %3230 = func.call @stack_pop_pointer() : () -> i64
      %3231 = func.call @cc_cons(%3230, %3229) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3231) : (i64) -> ()
      %3232 = func.call @stack_pop_pointer() : () -> i64
      %3233 = func.call @stack_pop_pointer() : () -> i64
      %3234 = func.call @cc_cons(%3233, %3232) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3234) : (i64) -> ()
      %3235 = func.call @stack_pop_pointer() : () -> i64
      %3236 = func.call @stack_pop_pointer() : () -> i64
      %3237 = func.call @cc_cons(%3236, %3235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3238 = func.call @stack_pop_pointer() : () -> i64
      %3239 = func.call @stack_pop_pointer() : () -> i64
      %3240 = func.call @cc_cons(%3239, %3238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3240) : (i64) -> ()
      %3241 = func.call @stack_pop_pointer() : () -> i64
      %3242 = func.call @stack_pop_pointer() : () -> i64
      %3243 = func.call @cc_cons(%3242, %3241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3243) : (i64) -> ()
      %3244 = func.call @stack_pop_pointer() : () -> i64
      %3245 = func.call @stack_pop_pointer() : () -> i64
      %3246 = func.call @cc_cons(%3245, %3244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3246) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3247 = func.call @stack_pop_pointer() : () -> i64
      %3248 = func.call @stack_pop_pointer() : () -> i64
      %3249 = func.call @cc_cons(%3248, %3247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3249) : (i64) -> ()
      %3250 = func.call @stack_pop_pointer() : () -> i64
      %3251 = func.call @stack_pop_pointer() : () -> i64
      %3252 = func.call @cc_cons(%3251, %3250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3252) : (i64) -> ()
      %3253 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3254 = arith.constant 5 : i64
      %3255 = func.call @cc_make_string(%3253, %3254) : (!llvm.ptr, i64) -> i64
      %3256 = func.call @cc_nil_value() : () -> i64
      %3257 = func.call @cc_intern(%3255, %3256) : (i64, i64) -> i64
      %3258 = func.call @cc_nil_value() : () -> i64
      %3259 = func.call @cc_cons(%3257, %3258) : (i64, i64) -> i64
      %3260 = func.call @cc_values_pack(%3259) : (i64) -> i64
      func.call @stack_push_pointer(%3257) : (i64) -> ()
      %3261 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3262 = arith.constant 4 : i64
      %3263 = func.call @cc_make_string(%3261, %3262) : (!llvm.ptr, i64) -> i64
      %3264 = func.call @cc_nil_value() : () -> i64
      %3265 = func.call @cc_intern(%3263, %3264) : (i64, i64) -> i64
      %3266 = func.call @cc_nil_value() : () -> i64
      %3267 = func.call @cc_cons(%3265, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_values_pack(%3267) : (i64) -> i64
      func.call @stack_push_pointer(%3265) : (i64) -> ()
      %3269 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3270 = arith.constant 15 : i64
      %3271 = func.call @cc_make_string(%3269, %3270) : (!llvm.ptr, i64) -> i64
      %3272 = func.call @cc_nil_value() : () -> i64
      %3273 = func.call @cc_intern(%3271, %3272) : (i64, i64) -> i64
      %3274 = func.call @cc_nil_value() : () -> i64
      %3275 = func.call @cc_cons(%3273, %3274) : (i64, i64) -> i64
      %3276 = func.call @cc_values_pack(%3275) : (i64) -> i64
      func.call @stack_push_pointer(%3273) : (i64) -> ()
      %3277 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3278 = arith.constant 6 : i64
      %3279 = func.call @cc_make_string(%3277, %3278) : (!llvm.ptr, i64) -> i64
      %3280 = func.call @cc_nil_value() : () -> i64
      %3281 = func.call @cc_intern(%3279, %3280) : (i64, i64) -> i64
      %3282 = func.call @cc_nil_value() : () -> i64
      %3283 = func.call @cc_cons(%3281, %3282) : (i64, i64) -> i64
      %3284 = func.call @cc_values_pack(%3283) : (i64) -> i64
      func.call @stack_push_pointer(%3281) : (i64) -> ()
      %3285 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3286 = arith.constant 15 : i64
      %3287 = func.call @cc_make_string(%3285, %3286) : (!llvm.ptr, i64) -> i64
      %3288 = func.call @cc_nil_value() : () -> i64
      %3289 = func.call @cc_intern(%3287, %3288) : (i64, i64) -> i64
      %3290 = func.call @cc_nil_value() : () -> i64
      %3291 = func.call @cc_cons(%3289, %3290) : (i64, i64) -> i64
      %3292 = func.call @cc_values_pack(%3291) : (i64) -> i64
      func.call @stack_push_pointer(%3289) : (i64) -> ()
      %3293 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3294 = arith.constant 4 : i64
      %3295 = func.call @cc_make_string(%3293, %3294) : (!llvm.ptr, i64) -> i64
      %3296 = func.call @cc_nil_value() : () -> i64
      %3297 = func.call @cc_intern(%3295, %3296) : (i64, i64) -> i64
      %3298 = func.call @cc_nil_value() : () -> i64
      %3299 = func.call @cc_cons(%3297, %3298) : (i64, i64) -> i64
      %3300 = func.call @cc_values_pack(%3299) : (i64) -> i64
      func.call @stack_push_pointer(%3297) : (i64) -> ()
      %3301 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3302 = arith.constant 4 : i64
      %3303 = func.call @cc_make_string(%3301, %3302) : (!llvm.ptr, i64) -> i64
      %3304 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3305 = arith.constant 11 : i64
      %3306 = func.call @cc_make_string(%3304, %3305) : (!llvm.ptr, i64) -> i64
      %3307 = func.call @cc_intern(%3303, %3306) : (i64, i64) -> i64
      %3308 = func.call @cc_nil_value() : () -> i64
      %3309 = func.call @cc_cons(%3307, %3308) : (i64, i64) -> i64
      %3310 = func.call @cc_values_pack(%3309) : (i64) -> i64
      func.call @stack_push_pointer(%3307) : (i64) -> ()
      %3311 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3312 = arith.constant 1 : i64
      %3313 = func.call @cc_make_string(%3311, %3312) : (!llvm.ptr, i64) -> i64
      %3314 = func.call @cc_nil_value() : () -> i64
      %3315 = func.call @cc_intern(%3313, %3314) : (i64, i64) -> i64
      %3316 = func.call @cc_nil_value() : () -> i64
      %3317 = func.call @cc_cons(%3315, %3316) : (i64, i64) -> i64
      %3318 = func.call @cc_values_pack(%3317) : (i64) -> i64
      func.call @stack_push_pointer(%3315) : (i64) -> ()
      %3319 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3320 = arith.constant 1 : i64
      %3321 = func.call @cc_make_string(%3319, %3320) : (!llvm.ptr, i64) -> i64
      %3322 = func.call @cc_nil_value() : () -> i64
      %3323 = func.call @cc_intern(%3321, %3322) : (i64, i64) -> i64
      %3324 = func.call @cc_nil_value() : () -> i64
      %3325 = func.call @cc_cons(%3323, %3324) : (i64, i64) -> i64
      %3326 = func.call @cc_values_pack(%3325) : (i64) -> i64
      func.call @stack_push_pointer(%3323) : (i64) -> ()
      %3327 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3328 = arith.constant 9 : i64
      %3329 = func.call @cc_make_string(%3327, %3328) : (!llvm.ptr, i64) -> i64
      %3330 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3331 = arith.constant 11 : i64
      %3332 = func.call @cc_make_string(%3330, %3331) : (!llvm.ptr, i64) -> i64
      %3333 = func.call @cc_intern(%3329, %3332) : (i64, i64) -> i64
      %3334 = func.call @cc_nil_value() : () -> i64
      %3335 = func.call @cc_cons(%3333, %3334) : (i64, i64) -> i64
      %3336 = func.call @cc_values_pack(%3335) : (i64) -> i64
      func.call @stack_push_pointer(%3333) : (i64) -> ()
      %3337 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3338 = arith.constant 1 : i64
      %3339 = func.call @cc_make_string(%3337, %3338) : (!llvm.ptr, i64) -> i64
      %3340 = func.call @cc_nil_value() : () -> i64
      %3341 = func.call @cc_intern(%3339, %3340) : (i64, i64) -> i64
      %3342 = func.call @cc_nil_value() : () -> i64
      %3343 = func.call @cc_cons(%3341, %3342) : (i64, i64) -> i64
      %3344 = func.call @cc_values_pack(%3343) : (i64) -> i64
      func.call @stack_push_pointer(%3341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3345 = func.call @stack_pop_pointer() : () -> i64
      %3346 = func.call @stack_pop_pointer() : () -> i64
      %3347 = func.call @cc_cons(%3346, %3345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3347) : (i64) -> ()
      %3348 = func.call @stack_pop_pointer() : () -> i64
      %3349 = func.call @stack_pop_pointer() : () -> i64
      %3350 = func.call @cc_cons(%3349, %3348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3350) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3351 = func.call @stack_pop_pointer() : () -> i64
      %3352 = func.call @stack_pop_pointer() : () -> i64
      %3353 = func.call @cc_cons(%3352, %3351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3353) : (i64) -> ()
      %3354 = func.call @stack_pop_pointer() : () -> i64
      %3355 = func.call @stack_pop_pointer() : () -> i64
      %3356 = func.call @cc_cons(%3355, %3354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3356) : (i64) -> ()
      %3357 = func.call @stack_pop_pointer() : () -> i64
      %3358 = func.call @stack_pop_pointer() : () -> i64
      %3359 = func.call @cc_cons(%3358, %3357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3359) : (i64) -> ()
      %3360 = func.call @stack_pop_pointer() : () -> i64
      %3361 = func.call @stack_pop_pointer() : () -> i64
      %3362 = func.call @cc_cons(%3361, %3360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3363 = func.call @stack_pop_pointer() : () -> i64
      %3364 = func.call @stack_pop_pointer() : () -> i64
      %3365 = func.call @cc_cons(%3364, %3363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3365) : (i64) -> ()
      %3366 = func.call @stack_pop_pointer() : () -> i64
      %3367 = func.call @stack_pop_pointer() : () -> i64
      %3368 = func.call @cc_cons(%3367, %3366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3368) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3369 = func.call @stack_pop_pointer() : () -> i64
      %3370 = func.call @stack_pop_pointer() : () -> i64
      %3371 = func.call @cc_cons(%3370, %3369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3371) : (i64) -> ()
      %3372 = func.call @stack_pop_pointer() : () -> i64
      %3373 = func.call @stack_pop_pointer() : () -> i64
      %3374 = func.call @cc_cons(%3373, %3372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3374) : (i64) -> ()
      %3375 = func.call @stack_pop_pointer() : () -> i64
      %3376 = func.call @stack_pop_pointer() : () -> i64
      %3377 = func.call @cc_cons(%3376, %3375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3377) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3378 = func.call @stack_pop_pointer() : () -> i64
      %3379 = func.call @stack_pop_pointer() : () -> i64
      %3380 = func.call @cc_cons(%3379, %3378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3380) : (i64) -> ()
      %3381 = func.call @stack_pop_pointer() : () -> i64
      %3382 = func.call @stack_pop_pointer() : () -> i64
      %3383 = func.call @cc_cons(%3382, %3381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3383) : (i64) -> ()
      %3384 = func.call @stack_pop_pointer() : () -> i64
      %3385 = func.call @stack_pop_pointer() : () -> i64
      %3386 = func.call @cc_cons(%3385, %3384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3387 = func.call @stack_pop_pointer() : () -> i64
      %3388 = func.call @stack_pop_pointer() : () -> i64
      %3389 = func.call @cc_cons(%3388, %3387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3389) : (i64) -> ()
      %3390 = func.call @stack_pop_pointer() : () -> i64
      %3391 = func.call @stack_pop_pointer() : () -> i64
      %3392 = func.call @cc_cons(%3391, %3390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3392) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3393 = func.call @stack_pop_pointer() : () -> i64
      %3394 = func.call @stack_pop_pointer() : () -> i64
      %3395 = func.call @cc_cons(%3394, %3393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3395) : (i64) -> ()
      %3396 = func.call @stack_pop_pointer() : () -> i64
      %3397 = func.call @stack_pop_pointer() : () -> i64
      %3398 = func.call @cc_cons(%3397, %3396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3398) : (i64) -> ()
      %3399 = func.call @stack_pop_pointer() : () -> i64
      %3400 = func.call @stack_pop_pointer() : () -> i64
      %3401 = func.call @cc_cons(%3400, %3399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3401) : (i64) -> ()
      %3402 = func.call @stack_pop_pointer() : () -> i64
      %3403 = func.call @stack_pop_pointer() : () -> i64
      %3404 = func.call @cc_cons(%3403, %3402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3404) : (i64) -> ()
      %3405 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3406 = arith.constant 4 : i64
      %3407 = func.call @cc_make_string(%3405, %3406) : (!llvm.ptr, i64) -> i64
      %3408 = func.call @cc_nil_value() : () -> i64
      %3409 = func.call @cc_intern(%3407, %3408) : (i64, i64) -> i64
      %3410 = func.call @cc_nil_value() : () -> i64
      %3411 = func.call @cc_cons(%3409, %3410) : (i64, i64) -> i64
      %3412 = func.call @cc_values_pack(%3411) : (i64) -> i64
      func.call @stack_push_pointer(%3409) : (i64) -> ()
      %3413 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3414 = arith.constant 1 : i64
      %3415 = func.call @cc_make_string(%3413, %3414) : (!llvm.ptr, i64) -> i64
      %3416 = func.call @cc_nil_value() : () -> i64
      %3417 = func.call @cc_intern(%3415, %3416) : (i64, i64) -> i64
      %3418 = func.call @cc_nil_value() : () -> i64
      %3419 = func.call @cc_cons(%3417, %3418) : (i64, i64) -> i64
      %3420 = func.call @cc_values_pack(%3419) : (i64) -> i64
      func.call @stack_push_pointer(%3417) : (i64) -> ()
      %3421 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3422 = arith.constant 1 : i64
      %3423 = func.call @cc_make_string(%3421, %3422) : (!llvm.ptr, i64) -> i64
      %3424 = func.call @cc_nil_value() : () -> i64
      %3425 = func.call @cc_intern(%3423, %3424) : (i64, i64) -> i64
      %3426 = func.call @cc_nil_value() : () -> i64
      %3427 = func.call @cc_cons(%3425, %3426) : (i64, i64) -> i64
      %3428 = func.call @cc_values_pack(%3427) : (i64) -> i64
      func.call @stack_push_pointer(%3425) : (i64) -> ()
      %3429 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3430 = arith.constant 1 : i64
      %3431 = func.call @cc_make_string(%3429, %3430) : (!llvm.ptr, i64) -> i64
      %3432 = func.call @cc_nil_value() : () -> i64
      %3433 = func.call @cc_intern(%3431, %3432) : (i64, i64) -> i64
      %3434 = func.call @cc_nil_value() : () -> i64
      %3435 = func.call @cc_cons(%3433, %3434) : (i64, i64) -> i64
      %3436 = func.call @cc_values_pack(%3435) : (i64) -> i64
      func.call @stack_push_pointer(%3433) : (i64) -> ()
      %3437 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%3437) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3438 = func.call @stack_pop_pointer() : () -> i64
      %3439 = func.call @stack_pop_pointer() : () -> i64
      %3440 = func.call @cc_cons(%3439, %3438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3440) : (i64) -> ()
      %3441 = func.call @stack_pop_pointer() : () -> i64
      %3442 = func.call @stack_pop_pointer() : () -> i64
      %3443 = func.call @cc_cons(%3442, %3441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3443) : (i64) -> ()
      %3444 = func.call @stack_pop_pointer() : () -> i64
      %3445 = func.call @stack_pop_pointer() : () -> i64
      %3446 = func.call @cc_cons(%3445, %3444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3446) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3447 = func.call @stack_pop_pointer() : () -> i64
      %3448 = func.call @stack_pop_pointer() : () -> i64
      %3449 = func.call @cc_cons(%3448, %3447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3449) : (i64) -> ()
      %3450 = func.call @stack_pop_pointer() : () -> i64
      %3451 = func.call @stack_pop_pointer() : () -> i64
      %3452 = func.call @cc_cons(%3451, %3450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3452) : (i64) -> ()
      %3453 = func.call @stack_pop_pointer() : () -> i64
      %3454 = func.call @stack_pop_pointer() : () -> i64
      %3455 = func.call @cc_cons(%3454, %3453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3455) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3456 = func.call @stack_pop_pointer() : () -> i64
      %3457 = func.call @stack_pop_pointer() : () -> i64
      %3458 = func.call @cc_cons(%3457, %3456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3458) : (i64) -> ()
      %3459 = func.call @stack_pop_pointer() : () -> i64
      %3460 = func.call @stack_pop_pointer() : () -> i64
      %3461 = func.call @cc_cons(%3460, %3459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3461) : (i64) -> ()
      %3462 = func.call @stack_pop_pointer() : () -> i64
      %3463 = func.call @stack_pop_pointer() : () -> i64
      %3464 = func.call @cc_cons(%3463, %3462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3464) : (i64) -> ()
      %3465 = func.call @stack_pop_pointer() : () -> i64
      %3466 = func.call @stack_pop_pointer() : () -> i64
      %3467 = func.call @cc_cons(%3466, %3465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3467) : (i64) -> ()
      %3468 = func.call @stack_pop_pointer() : () -> i64
      %3469 = func.call @stack_pop_pointer() : () -> i64
      %3470 = func.call @cc_cons(%3469, %3468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3470) : (i64) -> ()
      %3471 = func.call @stack_pop_pointer() : () -> i64
      %3472 = func.call @stack_pop_pointer() : () -> i64
      %3473 = func.call @cc_cons(%3472, %3471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3473) : (i64) -> ()
      %3474 = func.call @stack_pop_pointer() : () -> i64
      %3475 = func.call @stack_pop_pointer() : () -> i64
      %3476 = func.call @cc_cons(%3475, %3474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3476) : (i64) -> ()
      %3477 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3478 = arith.constant 2 : i64
      %3479 = func.call @cc_make_string(%3477, %3478) : (!llvm.ptr, i64) -> i64
      %3480 = func.call @cc_nil_value() : () -> i64
      %3481 = func.call @cc_intern(%3479, %3480) : (i64, i64) -> i64
      %3482 = func.call @cc_nil_value() : () -> i64
      %3483 = func.call @cc_cons(%3481, %3482) : (i64, i64) -> i64
      %3484 = func.call @cc_values_pack(%3483) : (i64) -> i64
      func.call @stack_push_pointer(%3481) : (i64) -> ()
      %3485 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3486 = arith.constant 17 : i64
      %3487 = func.call @cc_make_string(%3485, %3486) : (!llvm.ptr, i64) -> i64
      %3488 = func.call @cc_nil_value() : () -> i64
      %3489 = func.call @cc_intern(%3487, %3488) : (i64, i64) -> i64
      %3490 = func.call @cc_nil_value() : () -> i64
      %3491 = func.call @cc_cons(%3489, %3490) : (i64, i64) -> i64
      %3492 = func.call @cc_values_pack(%3491) : (i64) -> i64
      func.call @stack_push_pointer(%3489) : (i64) -> ()
      %3493 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3494 = arith.constant 5 : i64
      %3495 = func.call @cc_make_string(%3493, %3494) : (!llvm.ptr, i64) -> i64
      %3496 = func.call @cc_nil_value() : () -> i64
      %3497 = func.call @cc_intern(%3495, %3496) : (i64, i64) -> i64
      %3498 = func.call @cc_nil_value() : () -> i64
      %3499 = func.call @cc_cons(%3497, %3498) : (i64, i64) -> i64
      %3500 = func.call @cc_values_pack(%3499) : (i64) -> i64
      func.call @stack_push_pointer(%3497) : (i64) -> ()
      %3501 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3502 = arith.constant 4 : i64
      %3503 = func.call @cc_make_string(%3501, %3502) : (!llvm.ptr, i64) -> i64
      %3504 = func.call @cc_nil_value() : () -> i64
      %3505 = func.call @cc_intern(%3503, %3504) : (i64, i64) -> i64
      %3506 = func.call @cc_nil_value() : () -> i64
      %3507 = func.call @cc_cons(%3505, %3506) : (i64, i64) -> i64
      %3508 = func.call @cc_values_pack(%3507) : (i64) -> i64
      func.call @stack_push_pointer(%3505) : (i64) -> ()
      %3509 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3510 = arith.constant 1 : i64
      %3511 = func.call @cc_make_string(%3509, %3510) : (!llvm.ptr, i64) -> i64
      %3512 = func.call @cc_nil_value() : () -> i64
      %3513 = func.call @cc_intern(%3511, %3512) : (i64, i64) -> i64
      %3514 = func.call @cc_nil_value() : () -> i64
      %3515 = func.call @cc_cons(%3513, %3514) : (i64, i64) -> i64
      %3516 = func.call @cc_values_pack(%3515) : (i64) -> i64
      func.call @stack_push_pointer(%3513) : (i64) -> ()
      %3517 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3518 = arith.constant 19 : i64
      %3519 = func.call @cc_make_string(%3517, %3518) : (!llvm.ptr, i64) -> i64
      %3520 = func.call @cc_nil_value() : () -> i64
      %3521 = func.call @cc_intern(%3519, %3520) : (i64, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %3534 = func.call @stack_pop_pointer() : () -> i64
      %3535 = func.call @stack_pop_pointer() : () -> i64
      %3536 = func.call @cc_cons(%3535, %3534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3536) : (i64) -> ()
      %3537 = func.call @stack_pop_pointer() : () -> i64
      %3538 = func.call @stack_pop_pointer() : () -> i64
      %3539 = func.call @cc_cons(%3538, %3537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3539) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      %3552 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3553 = arith.constant 15 : i64
      %3554 = func.call @cc_make_string(%3552, %3553) : (!llvm.ptr, i64) -> i64
      %3555 = func.call @cc_nil_value() : () -> i64
      %3556 = func.call @cc_intern(%3554, %3555) : (i64, i64) -> i64
      %3557 = func.call @cc_nil_value() : () -> i64
      %3558 = func.call @cc_cons(%3556, %3557) : (i64, i64) -> i64
      %3559 = func.call @cc_values_pack(%3558) : (i64) -> i64
      func.call @stack_push_pointer(%3556) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3560 = func.call @stack_pop_pointer() : () -> i64
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = func.call @cc_cons(%3561, %3560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3562) : (i64) -> ()
      %3563 = func.call @stack_pop_pointer() : () -> i64
      %3564 = func.call @stack_pop_pointer() : () -> i64
      %3565 = func.call @cc_cons(%3564, %3563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3565) : (i64) -> ()
      %3566 = func.call @stack_pop_pointer() : () -> i64
      %3567 = func.call @stack_pop_pointer() : () -> i64
      %3568 = func.call @cc_cons(%3567, %3566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3568) : (i64) -> ()
      %3569 = func.call @stack_pop_pointer() : () -> i64
      %3570 = func.call @stack_pop_pointer() : () -> i64
      %3571 = func.call @cc_cons(%3570, %3569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3571) : (i64) -> ()
      %3572 = func.call @stack_pop_pointer() : () -> i64
      %3573 = func.call @stack_pop_pointer() : () -> i64
      %3574 = func.call @cc_cons(%3573, %3572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3574) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3575 = func.call @stack_pop_pointer() : () -> i64
      %3576 = func.call @stack_pop_pointer() : () -> i64
      %3577 = func.call @cc_cons(%3576, %3575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3577) : (i64) -> ()
      %3578 = func.call @stack_pop_pointer() : () -> i64
      %3579 = func.call @stack_pop_pointer() : () -> i64
      %3580 = func.call @cc_cons(%3579, %3578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3580) : (i64) -> ()
      %3581 = func.call @stack_pop_pointer() : () -> i64
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @cc_cons(%3582, %3581) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3583) : (i64) -> ()
      %3584 = func.call @stack_pop_pointer() : () -> i64
      %3928 = arith.constant 271595545296903 : i64
      %3929 = arith.constant 0 : i64
      %3930 = func.call @cc_make_closure(%3928, %3929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3930) : (i64) -> ()
      %3931 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3932 = func.call @stack_pop_pointer() : () -> i64
      %3933 = func.call @stack_pop_pointer() : () -> i64
      %3934 = func.call @cc_cons(%3933, %3932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3934) : (i64) -> ()
      %3935 = func.call @stack_pop_pointer() : () -> i64
      %3936 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3937 = arith.constant 11 : i64
      %3938 = func.call @cc_make_string(%3936, %3937) : (!llvm.ptr, i64) -> i64
      %3939 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3940 = arith.constant 7 : i64
      %3941 = func.call @cc_make_string(%3939, %3940) : (!llvm.ptr, i64) -> i64
      %3942 = func.call @cc_intern(%3938, %3941) : (i64, i64) -> i64
      %3943 = func.call @cc_nil_value() : () -> i64
      %3944 = func.call @cc_cons(%3942, %3943) : (i64, i64) -> i64
      %3945 = func.call @cc_values_pack(%3944) : (i64) -> i64
      func.call @stack_push_pointer(%3942) : (i64) -> ()
      %3946 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3947 = func.call @stack_pop_pointer() : () -> i64
      %3948 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3949 = arith.constant 4 : i64
      %3950 = func.call @cc_make_string(%3948, %3949) : (!llvm.ptr, i64) -> i64
      %3951 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3952 = arith.constant 7 : i64
      %3953 = func.call @cc_make_string(%3951, %3952) : (!llvm.ptr, i64) -> i64
      %3954 = func.call @cc_intern(%3950, %3953) : (i64, i64) -> i64
      %3955 = func.call @cc_nil_value() : () -> i64
      %3956 = func.call @cc_cons(%3954, %3955) : (i64, i64) -> i64
      %3957 = func.call @cc_values_pack(%3956) : (i64) -> i64
      func.call @stack_push_pointer(%3954) : (i64) -> ()
      %3958 = func.call @stack_pop_pointer() : () -> i64
      %3959 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3960 = arith.constant 6 : i64
      %3961 = func.call @cc_make_string(%3959, %3960) : (!llvm.ptr, i64) -> i64
      %3962 = func.call @cc_nil_value() : () -> i64
      %3963 = func.call @cc_intern(%3961, %3962) : (i64, i64) -> i64
      %3964 = func.call @cc_nil_value() : () -> i64
      %3965 = func.call @cc_cons(%3963, %3964) : (i64, i64) -> i64
      %3966 = func.call @cc_values_pack(%3965) : (i64) -> i64
      func.call @stack_push_pointer(%3963) : (i64) -> ()
      %3967 = func.call @stack_pop_pointer() : () -> i64
      %3968 = func.call @cc_nil_value() : () -> i64
      %3969 = func.call @cc_errorp(%2726) : (i64) -> i64
      %3970 = arith.cmpi ne, %3969, %3968 : i64
      %3971 = arith.cmpi eq, %3968, %3968 : i64
      %3972 = arith.andi %3970, %3971 : i1
      %3973 = scf.if %3972 -> (i64) {
        scf.yield %2726 : i64
      } else {
        scf.yield %3968 : i64
      }
      %3974 = func.call @cc_errorp(%3584) : (i64) -> i64
      %3975 = arith.cmpi ne, %3974, %3968 : i64
      %3976 = arith.cmpi eq, %3973, %3968 : i64
      %3977 = arith.andi %3975, %3976 : i1
      %3978 = scf.if %3977 -> (i64) {
        scf.yield %3584 : i64
      } else {
        scf.yield %3973 : i64
      }
      %3979 = func.call @cc_errorp(%3931) : (i64) -> i64
      %3980 = arith.cmpi ne, %3979, %3968 : i64
      %3981 = arith.cmpi eq, %3978, %3968 : i64
      %3982 = arith.andi %3980, %3981 : i1
      %3983 = scf.if %3982 -> (i64) {
        scf.yield %3931 : i64
      } else {
        scf.yield %3978 : i64
      }
      %3984 = func.call @cc_errorp(%3935) : (i64) -> i64
      %3985 = arith.cmpi ne, %3984, %3968 : i64
      %3986 = arith.cmpi eq, %3983, %3968 : i64
      %3987 = arith.andi %3985, %3986 : i1
      %3988 = scf.if %3987 -> (i64) {
        scf.yield %3935 : i64
      } else {
        scf.yield %3983 : i64
      }
      %3989 = func.call @cc_errorp(%3946) : (i64) -> i64
      %3990 = arith.cmpi ne, %3989, %3968 : i64
      %3991 = arith.cmpi eq, %3988, %3968 : i64
      %3992 = arith.andi %3990, %3991 : i1
      %3993 = scf.if %3992 -> (i64) {
        scf.yield %3946 : i64
      } else {
        scf.yield %3988 : i64
      }
      %3994 = func.call @cc_errorp(%3947) : (i64) -> i64
      %3995 = arith.cmpi ne, %3994, %3968 : i64
      %3996 = arith.cmpi eq, %3993, %3968 : i64
      %3997 = arith.andi %3995, %3996 : i1
      %3998 = scf.if %3997 -> (i64) {
        scf.yield %3947 : i64
      } else {
        scf.yield %3993 : i64
      }
      %3999 = func.call @cc_errorp(%3958) : (i64) -> i64
      %4000 = arith.cmpi ne, %3999, %3968 : i64
      %4001 = arith.cmpi eq, %3998, %3968 : i64
      %4002 = arith.andi %4000, %4001 : i1
      %4003 = scf.if %4002 -> (i64) {
        scf.yield %3958 : i64
      } else {
        scf.yield %3998 : i64
      }
      %4004 = func.call @cc_errorp(%3967) : (i64) -> i64
      %4005 = arith.cmpi ne, %4004, %3968 : i64
      %4006 = arith.cmpi eq, %4003, %3968 : i64
      %4007 = arith.andi %4005, %4006 : i1
      %4008 = scf.if %4007 -> (i64) {
        scf.yield %3967 : i64
      } else {
        scf.yield %4003 : i64
      }
      %4009 = arith.cmpi ne, %4008, %3968 : i64
      scf.if %4009 {
        func.call @stack_push_pointer(%4008) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2726) : (i64) -> ()
        func.call @stack_push_pointer(%3584) : (i64) -> ()
        func.call @stack_push_pointer(%3931) : (i64) -> ()
        func.call @stack_push_pointer(%3935) : (i64) -> ()
        func.call @stack_push_pointer(%3946) : (i64) -> ()
        func.call @stack_push_pointer(%3947) : (i64) -> ()
        func.call @stack_push_pointer(%3958) : (i64) -> ()
        func.call @stack_push_pointer(%3967) : (i64) -> ()
        %4010 = llvm.mlir.addressof @str288 : !llvm.ptr
        %4011 = func.call @cc_make_function_ref_const(%4010) : (!llvm.ptr) -> i64
        %4012 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4011, %4012) : (i64, i64) -> ()
      }
      %4013 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4013 : i64
    }
    %4014 = func.call @cc_nil_value() : () -> i64
    %4015 = func.call @cc_errorp(%2717) : (i64) -> i64
    %4016 = arith.cmpi ne, %4015, %4014 : i64
    %4017 = scf.if %4016 -> (i64) {
      scf.yield %2717 : i64
    } else {
      %4018 = llvm.mlir.addressof @str289 : !llvm.ptr
      %4019 = arith.constant 16 : i64
      %4020 = func.call @cc_make_string(%4018, %4019) : (!llvm.ptr, i64) -> i64
      %4021 = func.call @cc_nil_value() : () -> i64
      %4022 = func.call @cc_intern(%4020, %4021) : (i64, i64) -> i64
      %4023 = func.call @cc_nil_value() : () -> i64
      %4024 = func.call @cc_cons(%4022, %4023) : (i64, i64) -> i64
      %4025 = func.call @cc_values_pack(%4024) : (i64) -> i64
      func.call @stack_push_pointer(%4022) : (i64) -> ()
      %4026 = func.call @stack_pop_pointer() : () -> i64
      %4027 = llvm.mlir.addressof @str290 : !llvm.ptr
      %4028 = arith.constant 4 : i64
      %4029 = func.call @cc_make_string(%4027, %4028) : (!llvm.ptr, i64) -> i64
      %4030 = func.call @cc_nil_value() : () -> i64
      %4031 = func.call @cc_intern(%4029, %4030) : (i64, i64) -> i64
      %4032 = func.call @cc_nil_value() : () -> i64
      %4033 = func.call @cc_cons(%4031, %4032) : (i64, i64) -> i64
      %4034 = func.call @cc_values_pack(%4033) : (i64) -> i64
      func.call @stack_push_pointer(%4031) : (i64) -> ()
      %4035 = llvm.mlir.addressof @str291 : !llvm.ptr
      %4036 = arith.constant 1 : i64
      %4037 = func.call @cc_make_string(%4035, %4036) : (!llvm.ptr, i64) -> i64
      %4038 = func.call @cc_nil_value() : () -> i64
      %4039 = func.call @cc_intern(%4037, %4038) : (i64, i64) -> i64
      %4040 = func.call @cc_nil_value() : () -> i64
      %4041 = func.call @cc_cons(%4039, %4040) : (i64, i64) -> i64
      %4042 = func.call @cc_values_pack(%4041) : (i64) -> i64
      func.call @stack_push_pointer(%4039) : (i64) -> ()
      %4043 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4043) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4044 = func.call @stack_pop_pointer() : () -> i64
      %4045 = func.call @stack_pop_pointer() : () -> i64
      %4046 = func.call @cc_cons(%4045, %4044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4046) : (i64) -> ()
      %4047 = func.call @stack_pop_pointer() : () -> i64
      %4048 = func.call @stack_pop_pointer() : () -> i64
      %4049 = func.call @cc_cons(%4048, %4047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4049) : (i64) -> ()
      %4050 = llvm.mlir.addressof @str292 : !llvm.ptr
      %4051 = arith.constant 19 : i64
      %4052 = func.call @cc_make_string(%4050, %4051) : (!llvm.ptr, i64) -> i64
      %4053 = func.call @cc_nil_value() : () -> i64
      %4054 = func.call @cc_intern(%4052, %4053) : (i64, i64) -> i64
      %4055 = func.call @cc_nil_value() : () -> i64
      %4056 = func.call @cc_cons(%4054, %4055) : (i64, i64) -> i64
      %4057 = func.call @cc_values_pack(%4056) : (i64) -> i64
      func.call @stack_push_pointer(%4054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4058 = func.call @stack_pop_pointer() : () -> i64
      %4059 = func.call @stack_pop_pointer() : () -> i64
      %4060 = func.call @cc_cons(%4059, %4058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4060) : (i64) -> ()
      %4061 = func.call @stack_pop_pointer() : () -> i64
      %4062 = func.call @stack_pop_pointer() : () -> i64
      %4063 = func.call @cc_cons(%4062, %4061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4063) : (i64) -> ()
      %4064 = llvm.mlir.addressof @str293 : !llvm.ptr
      %4065 = arith.constant 1 : i64
      %4066 = func.call @cc_make_string(%4064, %4065) : (!llvm.ptr, i64) -> i64
      %4067 = func.call @cc_nil_value() : () -> i64
      %4068 = func.call @cc_intern(%4066, %4067) : (i64, i64) -> i64
      %4069 = func.call @cc_nil_value() : () -> i64
      %4070 = func.call @cc_cons(%4068, %4069) : (i64, i64) -> i64
      %4071 = func.call @cc_values_pack(%4070) : (i64) -> i64
      func.call @stack_push_pointer(%4068) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4072 = func.call @stack_pop_pointer() : () -> i64
      %4073 = func.call @stack_pop_pointer() : () -> i64
      %4074 = func.call @cc_cons(%4073, %4072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4074) : (i64) -> ()
      %4075 = func.call @stack_pop_pointer() : () -> i64
      %4076 = func.call @stack_pop_pointer() : () -> i64
      %4077 = func.call @cc_cons(%4076, %4075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4077) : (i64) -> ()
      %4078 = llvm.mlir.addressof @str294 : !llvm.ptr
      %4079 = arith.constant 15 : i64
      %4080 = func.call @cc_make_string(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = func.call @cc_nil_value() : () -> i64
      %4082 = func.call @cc_intern(%4080, %4081) : (i64, i64) -> i64
      %4083 = func.call @cc_nil_value() : () -> i64
      %4084 = func.call @cc_cons(%4082, %4083) : (i64, i64) -> i64
      %4085 = func.call @cc_values_pack(%4084) : (i64) -> i64
      func.call @stack_push_pointer(%4082) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @stack_pop_pointer() : () -> i64
      %4088 = func.call @cc_cons(%4087, %4086) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4088) : (i64) -> ()
      %4089 = func.call @stack_pop_pointer() : () -> i64
      %4090 = func.call @stack_pop_pointer() : () -> i64
      %4091 = func.call @cc_cons(%4090, %4089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4091) : (i64) -> ()
      %4092 = llvm.mlir.addressof @str295 : !llvm.ptr
      %4093 = arith.constant 17 : i64
      %4094 = func.call @cc_make_string(%4092, %4093) : (!llvm.ptr, i64) -> i64
      %4095 = func.call @cc_nil_value() : () -> i64
      %4096 = func.call @cc_intern(%4094, %4095) : (i64, i64) -> i64
      %4097 = func.call @cc_nil_value() : () -> i64
      %4098 = func.call @cc_cons(%4096, %4097) : (i64, i64) -> i64
      %4099 = func.call @cc_values_pack(%4098) : (i64) -> i64
      func.call @stack_push_pointer(%4096) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4100 = func.call @stack_pop_pointer() : () -> i64
      %4101 = func.call @stack_pop_pointer() : () -> i64
      %4102 = func.call @cc_cons(%4101, %4100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4102) : (i64) -> ()
      %4103 = func.call @stack_pop_pointer() : () -> i64
      %4104 = func.call @stack_pop_pointer() : () -> i64
      %4105 = func.call @cc_cons(%4104, %4103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4106 = func.call @stack_pop_pointer() : () -> i64
      %4107 = func.call @stack_pop_pointer() : () -> i64
      %4108 = func.call @cc_cons(%4107, %4106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4108) : (i64) -> ()
      %4109 = func.call @stack_pop_pointer() : () -> i64
      %4110 = func.call @stack_pop_pointer() : () -> i64
      %4111 = func.call @cc_cons(%4110, %4109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4111) : (i64) -> ()
      %4112 = func.call @stack_pop_pointer() : () -> i64
      %4113 = func.call @stack_pop_pointer() : () -> i64
      %4114 = func.call @cc_cons(%4113, %4112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4115 = func.call @stack_pop_pointer() : () -> i64
      %4116 = func.call @stack_pop_pointer() : () -> i64
      %4117 = func.call @cc_cons(%4116, %4115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4117) : (i64) -> ()
      %4118 = func.call @stack_pop_pointer() : () -> i64
      %4119 = func.call @stack_pop_pointer() : () -> i64
      %4120 = func.call @cc_cons(%4119, %4118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4120) : (i64) -> ()
      %4121 = llvm.mlir.addressof @str296 : !llvm.ptr
      %4122 = arith.constant 5 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_nil_value() : () -> i64
      %4125 = func.call @cc_intern(%4123, %4124) : (i64, i64) -> i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_cons(%4125, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_values_pack(%4127) : (i64) -> i64
      func.call @stack_push_pointer(%4125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4129 = llvm.mlir.addressof @str297 : !llvm.ptr
      %4130 = arith.constant 5 : i64
      %4131 = func.call @cc_make_string(%4129, %4130) : (!llvm.ptr, i64) -> i64
      %4132 = llvm.mlir.addressof @str298 : !llvm.ptr
      %4133 = arith.constant 3 : i64
      %4134 = func.call @cc_make_string(%4132, %4133) : (!llvm.ptr, i64) -> i64
      %4135 = func.call @cc_intern(%4131, %4134) : (i64, i64) -> i64
      %4136 = func.call @cc_nil_value() : () -> i64
      %4137 = func.call @cc_cons(%4135, %4136) : (i64, i64) -> i64
      %4138 = func.call @cc_values_pack(%4137) : (i64) -> i64
      func.call @stack_push_pointer(%4135) : (i64) -> ()
      %4139 = llvm.mlir.addressof @str299 : !llvm.ptr
      %4140 = arith.constant 1 : i64
      %4141 = func.call @cc_make_string(%4139, %4140) : (!llvm.ptr, i64) -> i64
      %4142 = func.call @cc_nil_value() : () -> i64
      %4143 = func.call @cc_intern(%4141, %4142) : (i64, i64) -> i64
      %4144 = func.call @cc_nil_value() : () -> i64
      %4145 = func.call @cc_cons(%4143, %4144) : (i64, i64) -> i64
      %4146 = func.call @cc_values_pack(%4145) : (i64) -> i64
      func.call @stack_push_pointer(%4143) : (i64) -> ()
      %4147 = llvm.mlir.addressof @str300 : !llvm.ptr
      %4148 = arith.constant 1 : i64
      %4149 = func.call @cc_make_string(%4147, %4148) : (!llvm.ptr, i64) -> i64
      %4150 = func.call @cc_nil_value() : () -> i64
      %4151 = func.call @cc_intern(%4149, %4150) : (i64, i64) -> i64
      %4152 = func.call @cc_nil_value() : () -> i64
      %4153 = func.call @cc_cons(%4151, %4152) : (i64, i64) -> i64
      %4154 = func.call @cc_values_pack(%4153) : (i64) -> i64
      func.call @stack_push_pointer(%4151) : (i64) -> ()
      %4155 = llvm.mlir.addressof @str301 : !llvm.ptr
      %4156 = arith.constant 15 : i64
      %4157 = func.call @cc_make_string(%4155, %4156) : (!llvm.ptr, i64) -> i64
      %4158 = llvm.mlir.addressof @str302 : !llvm.ptr
      %4159 = arith.constant 11 : i64
      %4160 = func.call @cc_make_string(%4158, %4159) : (!llvm.ptr, i64) -> i64
      %4161 = func.call @cc_intern(%4157, %4160) : (i64, i64) -> i64
      %4162 = func.call @cc_nil_value() : () -> i64
      %4163 = func.call @cc_cons(%4161, %4162) : (i64, i64) -> i64
      %4164 = func.call @cc_values_pack(%4163) : (i64) -> i64
      func.call @stack_push_pointer(%4161) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @stack_pop_pointer() : () -> i64
      %4167 = func.call @cc_cons(%4166, %4165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4167) : (i64) -> ()
      %4168 = func.call @stack_pop_pointer() : () -> i64
      %4169 = func.call @stack_pop_pointer() : () -> i64
      %4170 = func.call @cc_cons(%4169, %4168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4170) : (i64) -> ()
      %4171 = func.call @stack_pop_pointer() : () -> i64
      %4172 = func.call @stack_pop_pointer() : () -> i64
      %4173 = func.call @cc_cons(%4172, %4171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4173) : (i64) -> ()
      %4174 = llvm.mlir.addressof @str303 : !llvm.ptr
      %4175 = arith.constant 4 : i64
      %4176 = func.call @cc_make_string(%4174, %4175) : (!llvm.ptr, i64) -> i64
      %4177 = func.call @cc_nil_value() : () -> i64
      %4178 = func.call @cc_intern(%4176, %4177) : (i64, i64) -> i64
      %4179 = func.call @cc_nil_value() : () -> i64
      %4180 = func.call @cc_cons(%4178, %4179) : (i64, i64) -> i64
      %4181 = func.call @cc_values_pack(%4180) : (i64) -> i64
      func.call @stack_push_pointer(%4178) : (i64) -> ()
      %4182 = llvm.mlir.addressof @str304 : !llvm.ptr
      %4183 = arith.constant 17 : i64
      %4184 = func.call @cc_make_string(%4182, %4183) : (!llvm.ptr, i64) -> i64
      %4185 = func.call @cc_nil_value() : () -> i64
      %4186 = func.call @cc_intern(%4184, %4185) : (i64, i64) -> i64
      %4187 = func.call @cc_nil_value() : () -> i64
      %4188 = func.call @cc_cons(%4186, %4187) : (i64, i64) -> i64
      %4189 = func.call @cc_values_pack(%4188) : (i64) -> i64
      func.call @stack_push_pointer(%4186) : (i64) -> ()
      %4190 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4190) : (i64) -> ()
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
      %4200 = llvm.mlir.addressof @str305 : !llvm.ptr
      %4201 = arith.constant 4 : i64
      %4202 = func.call @cc_make_string(%4200, %4201) : (!llvm.ptr, i64) -> i64
      %4203 = func.call @cc_nil_value() : () -> i64
      %4204 = func.call @cc_intern(%4202, %4203) : (i64, i64) -> i64
      %4205 = func.call @cc_nil_value() : () -> i64
      %4206 = func.call @cc_cons(%4204, %4205) : (i64, i64) -> i64
      %4207 = func.call @cc_values_pack(%4206) : (i64) -> i64
      func.call @stack_push_pointer(%4204) : (i64) -> ()
      %4208 = llvm.mlir.addressof @str306 : !llvm.ptr
      %4209 = arith.constant 19 : i64
      %4210 = func.call @cc_make_string(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = func.call @cc_nil_value() : () -> i64
      %4212 = func.call @cc_intern(%4210, %4211) : (i64, i64) -> i64
      %4213 = func.call @cc_nil_value() : () -> i64
      %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
      %4215 = func.call @cc_values_pack(%4214) : (i64) -> i64
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4216 = llvm.mlir.addressof @str307 : !llvm.ptr
      %4217 = arith.constant 1 : i64
      %4218 = func.call @cc_make_string(%4216, %4217) : (!llvm.ptr, i64) -> i64
      %4219 = func.call @cc_nil_value() : () -> i64
      %4220 = func.call @cc_intern(%4218, %4219) : (i64, i64) -> i64
      %4221 = func.call @cc_nil_value() : () -> i64
      %4222 = func.call @cc_cons(%4220, %4221) : (i64, i64) -> i64
      %4223 = func.call @cc_values_pack(%4222) : (i64) -> i64
      func.call @stack_push_pointer(%4220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4224 = func.call @stack_pop_pointer() : () -> i64
      %4225 = func.call @stack_pop_pointer() : () -> i64
      %4226 = func.call @cc_cons(%4225, %4224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4226) : (i64) -> ()
      %4227 = func.call @stack_pop_pointer() : () -> i64
      %4228 = func.call @stack_pop_pointer() : () -> i64
      %4229 = func.call @cc_cons(%4228, %4227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4229) : (i64) -> ()
      %4230 = func.call @stack_pop_pointer() : () -> i64
      %4231 = func.call @stack_pop_pointer() : () -> i64
      %4232 = func.call @cc_cons(%4231, %4230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4232) : (i64) -> ()
      %4233 = llvm.mlir.addressof @str308 : !llvm.ptr
      %4234 = arith.constant 4 : i64
      %4235 = func.call @cc_make_string(%4233, %4234) : (!llvm.ptr, i64) -> i64
      %4236 = func.call @cc_nil_value() : () -> i64
      %4237 = func.call @cc_intern(%4235, %4236) : (i64, i64) -> i64
      %4238 = func.call @cc_nil_value() : () -> i64
      %4239 = func.call @cc_cons(%4237, %4238) : (i64, i64) -> i64
      %4240 = func.call @cc_values_pack(%4239) : (i64) -> i64
      func.call @stack_push_pointer(%4237) : (i64) -> ()
      %4241 = llvm.mlir.addressof @str309 : !llvm.ptr
      %4242 = arith.constant 1 : i64
      %4243 = func.call @cc_make_string(%4241, %4242) : (!llvm.ptr, i64) -> i64
      %4244 = func.call @cc_nil_value() : () -> i64
      %4245 = func.call @cc_intern(%4243, %4244) : (i64, i64) -> i64
      %4246 = func.call @cc_nil_value() : () -> i64
      %4247 = func.call @cc_cons(%4245, %4246) : (i64, i64) -> i64
      %4248 = func.call @cc_values_pack(%4247) : (i64) -> i64
      func.call @stack_push_pointer(%4245) : (i64) -> ()
      %4249 = llvm.mlir.addressof @str310 : !llvm.ptr
      %4250 = arith.constant 9 : i64
      %4251 = func.call @cc_make_string(%4249, %4250) : (!llvm.ptr, i64) -> i64
      %4252 = llvm.mlir.addressof @str311 : !llvm.ptr
      %4253 = arith.constant 11 : i64
      %4254 = func.call @cc_make_string(%4252, %4253) : (!llvm.ptr, i64) -> i64
      %4255 = func.call @cc_intern(%4251, %4254) : (i64, i64) -> i64
      %4256 = func.call @cc_nil_value() : () -> i64
      %4257 = func.call @cc_cons(%4255, %4256) : (i64, i64) -> i64
      %4258 = func.call @cc_values_pack(%4257) : (i64) -> i64
      func.call @stack_push_pointer(%4255) : (i64) -> ()
      %4259 = llvm.mlir.addressof @str312 : !llvm.ptr
      %4260 = arith.constant 1 : i64
      %4261 = func.call @cc_make_string(%4259, %4260) : (!llvm.ptr, i64) -> i64
      %4262 = func.call @cc_nil_value() : () -> i64
      %4263 = func.call @cc_intern(%4261, %4262) : (i64, i64) -> i64
      %4264 = func.call @cc_nil_value() : () -> i64
      %4265 = func.call @cc_cons(%4263, %4264) : (i64, i64) -> i64
      %4266 = func.call @cc_values_pack(%4265) : (i64) -> i64
      func.call @stack_push_pointer(%4263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4267 = func.call @stack_pop_pointer() : () -> i64
      %4268 = func.call @stack_pop_pointer() : () -> i64
      %4269 = func.call @cc_cons(%4268, %4267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4269) : (i64) -> ()
      %4270 = func.call @stack_pop_pointer() : () -> i64
      %4271 = func.call @stack_pop_pointer() : () -> i64
      %4272 = func.call @cc_cons(%4271, %4270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4273 = func.call @stack_pop_pointer() : () -> i64
      %4274 = func.call @stack_pop_pointer() : () -> i64
      %4275 = func.call @cc_cons(%4274, %4273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4275) : (i64) -> ()
      %4276 = func.call @stack_pop_pointer() : () -> i64
      %4277 = func.call @stack_pop_pointer() : () -> i64
      %4278 = func.call @cc_cons(%4277, %4276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4278) : (i64) -> ()
      %4279 = func.call @stack_pop_pointer() : () -> i64
      %4280 = func.call @stack_pop_pointer() : () -> i64
      %4281 = func.call @cc_cons(%4280, %4279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      %4282 = llvm.mlir.addressof @str313 : !llvm.ptr
      %4283 = arith.constant 2 : i64
      %4284 = func.call @cc_make_string(%4282, %4283) : (!llvm.ptr, i64) -> i64
      %4285 = func.call @cc_nil_value() : () -> i64
      %4286 = func.call @cc_intern(%4284, %4285) : (i64, i64) -> i64
      %4287 = func.call @cc_nil_value() : () -> i64
      %4288 = func.call @cc_cons(%4286, %4287) : (i64, i64) -> i64
      %4289 = func.call @cc_values_pack(%4288) : (i64) -> i64
      func.call @stack_push_pointer(%4286) : (i64) -> ()
      %4290 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4291 = arith.constant 3 : i64
      %4292 = func.call @cc_make_string(%4290, %4291) : (!llvm.ptr, i64) -> i64
      %4293 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4294 = arith.constant 11 : i64
      %4295 = func.call @cc_make_string(%4293, %4294) : (!llvm.ptr, i64) -> i64
      %4296 = func.call @cc_intern(%4292, %4295) : (i64, i64) -> i64
      %4297 = func.call @cc_nil_value() : () -> i64
      %4298 = func.call @cc_cons(%4296, %4297) : (i64, i64) -> i64
      %4299 = func.call @cc_values_pack(%4298) : (i64) -> i64
      func.call @stack_push_pointer(%4296) : (i64) -> ()
      %4300 = llvm.mlir.addressof @str316 : !llvm.ptr
      %4301 = arith.constant 1 : i64
      %4302 = func.call @cc_make_string(%4300, %4301) : (!llvm.ptr, i64) -> i64
      %4303 = func.call @cc_nil_value() : () -> i64
      %4304 = func.call @cc_intern(%4302, %4303) : (i64, i64) -> i64
      %4305 = func.call @cc_nil_value() : () -> i64
      %4306 = func.call @cc_cons(%4304, %4305) : (i64, i64) -> i64
      %4307 = func.call @cc_values_pack(%4306) : (i64) -> i64
      func.call @stack_push_pointer(%4304) : (i64) -> ()
      %4308 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4309 = arith.constant 12 : i64
      %4310 = func.call @cc_make_string(%4308, %4309) : (!llvm.ptr, i64) -> i64
      %4311 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4312 = arith.constant 11 : i64
      %4313 = func.call @cc_make_string(%4311, %4312) : (!llvm.ptr, i64) -> i64
      %4314 = func.call @cc_intern(%4310, %4313) : (i64, i64) -> i64
      %4315 = func.call @cc_nil_value() : () -> i64
      %4316 = func.call @cc_cons(%4314, %4315) : (i64, i64) -> i64
      %4317 = func.call @cc_values_pack(%4316) : (i64) -> i64
      func.call @stack_push_pointer(%4314) : (i64) -> ()
      %4318 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4319 = arith.constant 1 : i64
      %4320 = func.call @cc_make_string(%4318, %4319) : (!llvm.ptr, i64) -> i64
      %4321 = func.call @cc_nil_value() : () -> i64
      %4322 = func.call @cc_intern(%4320, %4321) : (i64, i64) -> i64
      %4323 = func.call @cc_nil_value() : () -> i64
      %4324 = func.call @cc_cons(%4322, %4323) : (i64, i64) -> i64
      %4325 = func.call @cc_values_pack(%4324) : (i64) -> i64
      func.call @stack_push_pointer(%4322) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4326 = func.call @stack_pop_pointer() : () -> i64
      %4327 = func.call @stack_pop_pointer() : () -> i64
      %4328 = func.call @cc_cons(%4327, %4326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4328) : (i64) -> ()
      %4329 = func.call @stack_pop_pointer() : () -> i64
      %4330 = func.call @stack_pop_pointer() : () -> i64
      %4331 = func.call @cc_cons(%4330, %4329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4331) : (i64) -> ()
      %4332 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4333 = arith.constant 5 : i64
      %4334 = func.call @cc_make_string(%4332, %4333) : (!llvm.ptr, i64) -> i64
      %4335 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4336 = arith.constant 11 : i64
      %4337 = func.call @cc_make_string(%4335, %4336) : (!llvm.ptr, i64) -> i64
      %4338 = func.call @cc_intern(%4334, %4337) : (i64, i64) -> i64
      %4339 = func.call @cc_nil_value() : () -> i64
      %4340 = func.call @cc_cons(%4338, %4339) : (i64, i64) -> i64
      %4341 = func.call @cc_values_pack(%4340) : (i64) -> i64
      func.call @stack_push_pointer(%4338) : (i64) -> ()
      %4342 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4343 = arith.constant 1 : i64
      %4344 = func.call @cc_make_string(%4342, %4343) : (!llvm.ptr, i64) -> i64
      %4345 = func.call @cc_nil_value() : () -> i64
      %4346 = func.call @cc_intern(%4344, %4345) : (i64, i64) -> i64
      %4347 = func.call @cc_nil_value() : () -> i64
      %4348 = func.call @cc_cons(%4346, %4347) : (i64, i64) -> i64
      %4349 = func.call @cc_values_pack(%4348) : (i64) -> i64
      func.call @stack_push_pointer(%4346) : (i64) -> ()
      %4350 = llvm.mlir.addressof @str323 : !llvm.ptr
      %4351 = arith.constant 13 : i64
      %4352 = func.call @cc_make_string(%4350, %4351) : (!llvm.ptr, i64) -> i64
      %4353 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4354 = arith.constant 11 : i64
      %4355 = func.call @cc_make_string(%4353, %4354) : (!llvm.ptr, i64) -> i64
      %4356 = func.call @cc_intern(%4352, %4355) : (i64, i64) -> i64
      %4357 = func.call @cc_nil_value() : () -> i64
      %4358 = func.call @cc_cons(%4356, %4357) : (i64, i64) -> i64
      %4359 = func.call @cc_values_pack(%4358) : (i64) -> i64
      func.call @stack_push_pointer(%4356) : (i64) -> ()
      %4360 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4361 = arith.constant 1 : i64
      %4362 = func.call @cc_make_string(%4360, %4361) : (!llvm.ptr, i64) -> i64
      %4363 = func.call @cc_nil_value() : () -> i64
      %4364 = func.call @cc_intern(%4362, %4363) : (i64, i64) -> i64
      %4365 = func.call @cc_nil_value() : () -> i64
      %4366 = func.call @cc_cons(%4364, %4365) : (i64, i64) -> i64
      %4367 = func.call @cc_values_pack(%4366) : (i64) -> i64
      func.call @stack_push_pointer(%4364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4368 = func.call @stack_pop_pointer() : () -> i64
      %4369 = func.call @stack_pop_pointer() : () -> i64
      %4370 = func.call @cc_cons(%4369, %4368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4370) : (i64) -> ()
      %4371 = func.call @stack_pop_pointer() : () -> i64
      %4372 = func.call @stack_pop_pointer() : () -> i64
      %4373 = func.call @cc_cons(%4372, %4371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4373) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4374 = func.call @stack_pop_pointer() : () -> i64
      %4375 = func.call @stack_pop_pointer() : () -> i64
      %4376 = func.call @cc_cons(%4375, %4374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4376) : (i64) -> ()
      %4377 = func.call @stack_pop_pointer() : () -> i64
      %4378 = func.call @stack_pop_pointer() : () -> i64
      %4379 = func.call @cc_cons(%4378, %4377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4379) : (i64) -> ()
      %4380 = func.call @stack_pop_pointer() : () -> i64
      %4381 = func.call @stack_pop_pointer() : () -> i64
      %4382 = func.call @cc_cons(%4381, %4380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4382) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4383 = func.call @stack_pop_pointer() : () -> i64
      %4384 = func.call @stack_pop_pointer() : () -> i64
      %4385 = func.call @cc_cons(%4384, %4383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4385) : (i64) -> ()
      %4386 = func.call @stack_pop_pointer() : () -> i64
      %4387 = func.call @stack_pop_pointer() : () -> i64
      %4388 = func.call @cc_cons(%4387, %4386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4388) : (i64) -> ()
      %4389 = func.call @stack_pop_pointer() : () -> i64
      %4390 = func.call @stack_pop_pointer() : () -> i64
      %4391 = func.call @cc_cons(%4390, %4389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4391) : (i64) -> ()
      %4392 = func.call @stack_pop_pointer() : () -> i64
      %4393 = func.call @stack_pop_pointer() : () -> i64
      %4394 = func.call @cc_cons(%4393, %4392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4394) : (i64) -> ()
      %4395 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4396 = arith.constant 5 : i64
      %4397 = func.call @cc_make_string(%4395, %4396) : (!llvm.ptr, i64) -> i64
      %4398 = func.call @cc_nil_value() : () -> i64
      %4399 = func.call @cc_intern(%4397, %4398) : (i64, i64) -> i64
      %4400 = func.call @cc_nil_value() : () -> i64
      %4401 = func.call @cc_cons(%4399, %4400) : (i64, i64) -> i64
      %4402 = func.call @cc_values_pack(%4401) : (i64) -> i64
      func.call @stack_push_pointer(%4399) : (i64) -> ()
      %4403 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4404 = arith.constant 4 : i64
      %4405 = func.call @cc_make_string(%4403, %4404) : (!llvm.ptr, i64) -> i64
      %4406 = func.call @cc_nil_value() : () -> i64
      %4407 = func.call @cc_intern(%4405, %4406) : (i64, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_cons(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_values_pack(%4409) : (i64) -> i64
      func.call @stack_push_pointer(%4407) : (i64) -> ()
      %4411 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4412 = arith.constant 15 : i64
      %4413 = func.call @cc_make_string(%4411, %4412) : (!llvm.ptr, i64) -> i64
      %4414 = func.call @cc_nil_value() : () -> i64
      %4415 = func.call @cc_intern(%4413, %4414) : (i64, i64) -> i64
      %4416 = func.call @cc_nil_value() : () -> i64
      %4417 = func.call @cc_cons(%4415, %4416) : (i64, i64) -> i64
      %4418 = func.call @cc_values_pack(%4417) : (i64) -> i64
      func.call @stack_push_pointer(%4415) : (i64) -> ()
      %4419 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4420 = arith.constant 6 : i64
      %4421 = func.call @cc_make_string(%4419, %4420) : (!llvm.ptr, i64) -> i64
      %4422 = func.call @cc_nil_value() : () -> i64
      %4423 = func.call @cc_intern(%4421, %4422) : (i64, i64) -> i64
      %4424 = func.call @cc_nil_value() : () -> i64
      %4425 = func.call @cc_cons(%4423, %4424) : (i64, i64) -> i64
      %4426 = func.call @cc_values_pack(%4425) : (i64) -> i64
      func.call @stack_push_pointer(%4423) : (i64) -> ()
      %4427 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4428 = arith.constant 15 : i64
      %4429 = func.call @cc_make_string(%4427, %4428) : (!llvm.ptr, i64) -> i64
      %4430 = func.call @cc_nil_value() : () -> i64
      %4431 = func.call @cc_intern(%4429, %4430) : (i64, i64) -> i64
      %4432 = func.call @cc_nil_value() : () -> i64
      %4433 = func.call @cc_cons(%4431, %4432) : (i64, i64) -> i64
      %4434 = func.call @cc_values_pack(%4433) : (i64) -> i64
      func.call @stack_push_pointer(%4431) : (i64) -> ()
      %4435 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4436 = arith.constant 4 : i64
      %4437 = func.call @cc_make_string(%4435, %4436) : (!llvm.ptr, i64) -> i64
      %4438 = func.call @cc_nil_value() : () -> i64
      %4439 = func.call @cc_intern(%4437, %4438) : (i64, i64) -> i64
      %4440 = func.call @cc_nil_value() : () -> i64
      %4441 = func.call @cc_cons(%4439, %4440) : (i64, i64) -> i64
      %4442 = func.call @cc_values_pack(%4441) : (i64) -> i64
      func.call @stack_push_pointer(%4439) : (i64) -> ()
      %4443 = llvm.mlir.addressof @str332 : !llvm.ptr
      %4444 = arith.constant 4 : i64
      %4445 = func.call @cc_make_string(%4443, %4444) : (!llvm.ptr, i64) -> i64
      %4446 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4447 = arith.constant 11 : i64
      %4448 = func.call @cc_make_string(%4446, %4447) : (!llvm.ptr, i64) -> i64
      %4449 = func.call @cc_intern(%4445, %4448) : (i64, i64) -> i64
      %4450 = func.call @cc_nil_value() : () -> i64
      %4451 = func.call @cc_cons(%4449, %4450) : (i64, i64) -> i64
      %4452 = func.call @cc_values_pack(%4451) : (i64) -> i64
      func.call @stack_push_pointer(%4449) : (i64) -> ()
      %4453 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4454 = arith.constant 1 : i64
      %4455 = func.call @cc_make_string(%4453, %4454) : (!llvm.ptr, i64) -> i64
      %4456 = func.call @cc_nil_value() : () -> i64
      %4457 = func.call @cc_intern(%4455, %4456) : (i64, i64) -> i64
      %4458 = func.call @cc_nil_value() : () -> i64
      %4459 = func.call @cc_cons(%4457, %4458) : (i64, i64) -> i64
      %4460 = func.call @cc_values_pack(%4459) : (i64) -> i64
      func.call @stack_push_pointer(%4457) : (i64) -> ()
      %4461 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4462 = arith.constant 1 : i64
      %4463 = func.call @cc_make_string(%4461, %4462) : (!llvm.ptr, i64) -> i64
      %4464 = func.call @cc_nil_value() : () -> i64
      %4465 = func.call @cc_intern(%4463, %4464) : (i64, i64) -> i64
      %4466 = func.call @cc_nil_value() : () -> i64
      %4467 = func.call @cc_cons(%4465, %4466) : (i64, i64) -> i64
      %4468 = func.call @cc_values_pack(%4467) : (i64) -> i64
      func.call @stack_push_pointer(%4465) : (i64) -> ()
      %4469 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4470 = arith.constant 9 : i64
      %4471 = func.call @cc_make_string(%4469, %4470) : (!llvm.ptr, i64) -> i64
      %4472 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4473 = arith.constant 11 : i64
      %4474 = func.call @cc_make_string(%4472, %4473) : (!llvm.ptr, i64) -> i64
      %4475 = func.call @cc_intern(%4471, %4474) : (i64, i64) -> i64
      %4476 = func.call @cc_nil_value() : () -> i64
      %4477 = func.call @cc_cons(%4475, %4476) : (i64, i64) -> i64
      %4478 = func.call @cc_values_pack(%4477) : (i64) -> i64
      func.call @stack_push_pointer(%4475) : (i64) -> ()
      %4479 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4480 = arith.constant 1 : i64
      %4481 = func.call @cc_make_string(%4479, %4480) : (!llvm.ptr, i64) -> i64
      %4482 = func.call @cc_nil_value() : () -> i64
      %4483 = func.call @cc_intern(%4481, %4482) : (i64, i64) -> i64
      %4484 = func.call @cc_nil_value() : () -> i64
      %4485 = func.call @cc_cons(%4483, %4484) : (i64, i64) -> i64
      %4486 = func.call @cc_values_pack(%4485) : (i64) -> i64
      func.call @stack_push_pointer(%4483) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4487 = func.call @stack_pop_pointer() : () -> i64
      %4488 = func.call @stack_pop_pointer() : () -> i64
      %4489 = func.call @cc_cons(%4488, %4487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4489) : (i64) -> ()
      %4490 = func.call @stack_pop_pointer() : () -> i64
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @cc_cons(%4491, %4490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4493 = func.call @stack_pop_pointer() : () -> i64
      %4494 = func.call @stack_pop_pointer() : () -> i64
      %4495 = func.call @cc_cons(%4494, %4493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4495) : (i64) -> ()
      %4496 = func.call @stack_pop_pointer() : () -> i64
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @cc_cons(%4497, %4496) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4498) : (i64) -> ()
      %4499 = func.call @stack_pop_pointer() : () -> i64
      %4500 = func.call @stack_pop_pointer() : () -> i64
      %4501 = func.call @cc_cons(%4500, %4499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4501) : (i64) -> ()
      %4502 = func.call @stack_pop_pointer() : () -> i64
      %4503 = func.call @stack_pop_pointer() : () -> i64
      %4504 = func.call @cc_cons(%4503, %4502) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4504) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4505 = func.call @stack_pop_pointer() : () -> i64
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @cc_cons(%4506, %4505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4507) : (i64) -> ()
      %4508 = func.call @stack_pop_pointer() : () -> i64
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @cc_cons(%4509, %4508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4511 = func.call @stack_pop_pointer() : () -> i64
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = func.call @cc_cons(%4512, %4511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4513) : (i64) -> ()
      %4514 = func.call @stack_pop_pointer() : () -> i64
      %4515 = func.call @stack_pop_pointer() : () -> i64
      %4516 = func.call @cc_cons(%4515, %4514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4516) : (i64) -> ()
      %4517 = func.call @stack_pop_pointer() : () -> i64
      %4518 = func.call @stack_pop_pointer() : () -> i64
      %4519 = func.call @cc_cons(%4518, %4517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4520 = func.call @stack_pop_pointer() : () -> i64
      %4521 = func.call @stack_pop_pointer() : () -> i64
      %4522 = func.call @cc_cons(%4521, %4520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4522) : (i64) -> ()
      %4523 = func.call @stack_pop_pointer() : () -> i64
      %4524 = func.call @stack_pop_pointer() : () -> i64
      %4525 = func.call @cc_cons(%4524, %4523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4525) : (i64) -> ()
      %4526 = func.call @stack_pop_pointer() : () -> i64
      %4527 = func.call @stack_pop_pointer() : () -> i64
      %4528 = func.call @cc_cons(%4527, %4526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4529 = func.call @stack_pop_pointer() : () -> i64
      %4530 = func.call @stack_pop_pointer() : () -> i64
      %4531 = func.call @cc_cons(%4530, %4529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4531) : (i64) -> ()
      %4532 = func.call @stack_pop_pointer() : () -> i64
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = func.call @cc_cons(%4533, %4532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4534) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4535 = func.call @stack_pop_pointer() : () -> i64
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4537 = func.call @cc_cons(%4536, %4535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4537) : (i64) -> ()
      %4538 = func.call @stack_pop_pointer() : () -> i64
      %4539 = func.call @stack_pop_pointer() : () -> i64
      %4540 = func.call @cc_cons(%4539, %4538) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4540) : (i64) -> ()
      %4541 = func.call @stack_pop_pointer() : () -> i64
      %4542 = func.call @stack_pop_pointer() : () -> i64
      %4543 = func.call @cc_cons(%4542, %4541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4543) : (i64) -> ()
      %4544 = func.call @stack_pop_pointer() : () -> i64
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = func.call @cc_cons(%4545, %4544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4546) : (i64) -> ()
      %4547 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4548 = arith.constant 4 : i64
      %4549 = func.call @cc_make_string(%4547, %4548) : (!llvm.ptr, i64) -> i64
      %4550 = func.call @cc_nil_value() : () -> i64
      %4551 = func.call @cc_intern(%4549, %4550) : (i64, i64) -> i64
      %4552 = func.call @cc_nil_value() : () -> i64
      %4553 = func.call @cc_cons(%4551, %4552) : (i64, i64) -> i64
      %4554 = func.call @cc_values_pack(%4553) : (i64) -> i64
      func.call @stack_push_pointer(%4551) : (i64) -> ()
      %4555 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4556 = arith.constant 1 : i64
      %4557 = func.call @cc_make_string(%4555, %4556) : (!llvm.ptr, i64) -> i64
      %4558 = func.call @cc_nil_value() : () -> i64
      %4559 = func.call @cc_intern(%4557, %4558) : (i64, i64) -> i64
      %4560 = func.call @cc_nil_value() : () -> i64
      %4561 = func.call @cc_cons(%4559, %4560) : (i64, i64) -> i64
      %4562 = func.call @cc_values_pack(%4561) : (i64) -> i64
      func.call @stack_push_pointer(%4559) : (i64) -> ()
      %4563 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4564 = arith.constant 1 : i64
      %4565 = func.call @cc_make_string(%4563, %4564) : (!llvm.ptr, i64) -> i64
      %4566 = func.call @cc_nil_value() : () -> i64
      %4567 = func.call @cc_intern(%4565, %4566) : (i64, i64) -> i64
      %4568 = func.call @cc_nil_value() : () -> i64
      %4569 = func.call @cc_cons(%4567, %4568) : (i64, i64) -> i64
      %4570 = func.call @cc_values_pack(%4569) : (i64) -> i64
      func.call @stack_push_pointer(%4567) : (i64) -> ()
      %4571 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4572 = arith.constant 1 : i64
      %4573 = func.call @cc_make_string(%4571, %4572) : (!llvm.ptr, i64) -> i64
      %4574 = func.call @cc_nil_value() : () -> i64
      %4575 = func.call @cc_intern(%4573, %4574) : (i64, i64) -> i64
      %4576 = func.call @cc_nil_value() : () -> i64
      %4577 = func.call @cc_cons(%4575, %4576) : (i64, i64) -> i64
      %4578 = func.call @cc_values_pack(%4577) : (i64) -> i64
      func.call @stack_push_pointer(%4575) : (i64) -> ()
      %4579 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4579) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4580 = func.call @stack_pop_pointer() : () -> i64
      %4581 = func.call @stack_pop_pointer() : () -> i64
      %4582 = func.call @cc_cons(%4581, %4580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4582) : (i64) -> ()
      %4583 = func.call @stack_pop_pointer() : () -> i64
      %4584 = func.call @stack_pop_pointer() : () -> i64
      %4585 = func.call @cc_cons(%4584, %4583) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4585) : (i64) -> ()
      %4586 = func.call @stack_pop_pointer() : () -> i64
      %4587 = func.call @stack_pop_pointer() : () -> i64
      %4588 = func.call @cc_cons(%4587, %4586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4588) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4589 = func.call @stack_pop_pointer() : () -> i64
      %4590 = func.call @stack_pop_pointer() : () -> i64
      %4591 = func.call @cc_cons(%4590, %4589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4591) : (i64) -> ()
      %4592 = func.call @stack_pop_pointer() : () -> i64
      %4593 = func.call @stack_pop_pointer() : () -> i64
      %4594 = func.call @cc_cons(%4593, %4592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4594) : (i64) -> ()
      %4595 = func.call @stack_pop_pointer() : () -> i64
      %4596 = func.call @stack_pop_pointer() : () -> i64
      %4597 = func.call @cc_cons(%4596, %4595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4598 = func.call @stack_pop_pointer() : () -> i64
      %4599 = func.call @stack_pop_pointer() : () -> i64
      %4600 = func.call @cc_cons(%4599, %4598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4600) : (i64) -> ()
      %4601 = func.call @stack_pop_pointer() : () -> i64
      %4602 = func.call @stack_pop_pointer() : () -> i64
      %4603 = func.call @cc_cons(%4602, %4601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4603) : (i64) -> ()
      %4604 = func.call @stack_pop_pointer() : () -> i64
      %4605 = func.call @stack_pop_pointer() : () -> i64
      %4606 = func.call @cc_cons(%4605, %4604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4606) : (i64) -> ()
      %4607 = func.call @stack_pop_pointer() : () -> i64
      %4608 = func.call @stack_pop_pointer() : () -> i64
      %4609 = func.call @cc_cons(%4608, %4607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4609) : (i64) -> ()
      %4610 = func.call @stack_pop_pointer() : () -> i64
      %4611 = func.call @stack_pop_pointer() : () -> i64
      %4612 = func.call @cc_cons(%4611, %4610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4612) : (i64) -> ()
      %4613 = func.call @stack_pop_pointer() : () -> i64
      %4614 = func.call @stack_pop_pointer() : () -> i64
      %4615 = func.call @cc_cons(%4614, %4613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4615) : (i64) -> ()
      %4616 = func.call @stack_pop_pointer() : () -> i64
      %4617 = func.call @stack_pop_pointer() : () -> i64
      %4618 = func.call @cc_cons(%4617, %4616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4618) : (i64) -> ()
      %4619 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4620 = arith.constant 2 : i64
      %4621 = func.call @cc_make_string(%4619, %4620) : (!llvm.ptr, i64) -> i64
      %4622 = func.call @cc_nil_value() : () -> i64
      %4623 = func.call @cc_intern(%4621, %4622) : (i64, i64) -> i64
      %4624 = func.call @cc_nil_value() : () -> i64
      %4625 = func.call @cc_cons(%4623, %4624) : (i64, i64) -> i64
      %4626 = func.call @cc_values_pack(%4625) : (i64) -> i64
      func.call @stack_push_pointer(%4623) : (i64) -> ()
      %4627 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4628 = arith.constant 17 : i64
      %4629 = func.call @cc_make_string(%4627, %4628) : (!llvm.ptr, i64) -> i64
      %4630 = func.call @cc_nil_value() : () -> i64
      %4631 = func.call @cc_intern(%4629, %4630) : (i64, i64) -> i64
      %4632 = func.call @cc_nil_value() : () -> i64
      %4633 = func.call @cc_cons(%4631, %4632) : (i64, i64) -> i64
      %4634 = func.call @cc_values_pack(%4633) : (i64) -> i64
      func.call @stack_push_pointer(%4631) : (i64) -> ()
      %4635 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4636 = arith.constant 5 : i64
      %4637 = func.call @cc_make_string(%4635, %4636) : (!llvm.ptr, i64) -> i64
      %4638 = func.call @cc_nil_value() : () -> i64
      %4639 = func.call @cc_intern(%4637, %4638) : (i64, i64) -> i64
      %4640 = func.call @cc_nil_value() : () -> i64
      %4641 = func.call @cc_cons(%4639, %4640) : (i64, i64) -> i64
      %4642 = func.call @cc_values_pack(%4641) : (i64) -> i64
      func.call @stack_push_pointer(%4639) : (i64) -> ()
      %4643 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4644 = arith.constant 4 : i64
      %4645 = func.call @cc_make_string(%4643, %4644) : (!llvm.ptr, i64) -> i64
      %4646 = func.call @cc_nil_value() : () -> i64
      %4647 = func.call @cc_intern(%4645, %4646) : (i64, i64) -> i64
      %4648 = func.call @cc_nil_value() : () -> i64
      %4649 = func.call @cc_cons(%4647, %4648) : (i64, i64) -> i64
      %4650 = func.call @cc_values_pack(%4649) : (i64) -> i64
      func.call @stack_push_pointer(%4647) : (i64) -> ()
      %4651 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4652 = arith.constant 1 : i64
      %4653 = func.call @cc_make_string(%4651, %4652) : (!llvm.ptr, i64) -> i64
      %4654 = func.call @cc_nil_value() : () -> i64
      %4655 = func.call @cc_intern(%4653, %4654) : (i64, i64) -> i64
      %4656 = func.call @cc_nil_value() : () -> i64
      %4657 = func.call @cc_cons(%4655, %4656) : (i64, i64) -> i64
      %4658 = func.call @cc_values_pack(%4657) : (i64) -> i64
      func.call @stack_push_pointer(%4655) : (i64) -> ()
      %4659 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4660 = arith.constant 19 : i64
      %4661 = func.call @cc_make_string(%4659, %4660) : (!llvm.ptr, i64) -> i64
      %4662 = func.call @cc_nil_value() : () -> i64
      %4663 = func.call @cc_intern(%4661, %4662) : (i64, i64) -> i64
      %4664 = func.call @cc_nil_value() : () -> i64
      %4665 = func.call @cc_cons(%4663, %4664) : (i64, i64) -> i64
      %4666 = func.call @cc_values_pack(%4665) : (i64) -> i64
      func.call @stack_push_pointer(%4663) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4667 = func.call @stack_pop_pointer() : () -> i64
      %4668 = func.call @stack_pop_pointer() : () -> i64
      %4669 = func.call @cc_cons(%4668, %4667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4669) : (i64) -> ()
      %4670 = func.call @stack_pop_pointer() : () -> i64
      %4671 = func.call @stack_pop_pointer() : () -> i64
      %4672 = func.call @cc_cons(%4671, %4670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4672) : (i64) -> ()
      %4673 = func.call @stack_pop_pointer() : () -> i64
      %4674 = func.call @stack_pop_pointer() : () -> i64
      %4675 = func.call @cc_cons(%4674, %4673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4676 = func.call @stack_pop_pointer() : () -> i64
      %4677 = func.call @stack_pop_pointer() : () -> i64
      %4678 = func.call @cc_cons(%4677, %4676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4678) : (i64) -> ()
      %4679 = func.call @stack_pop_pointer() : () -> i64
      %4680 = func.call @stack_pop_pointer() : () -> i64
      %4681 = func.call @cc_cons(%4680, %4679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4681) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4682 = func.call @stack_pop_pointer() : () -> i64
      %4683 = func.call @stack_pop_pointer() : () -> i64
      %4684 = func.call @cc_cons(%4683, %4682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4684) : (i64) -> ()
      %4685 = func.call @stack_pop_pointer() : () -> i64
      %4686 = func.call @stack_pop_pointer() : () -> i64
      %4687 = func.call @cc_cons(%4686, %4685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4687) : (i64) -> ()
      %4688 = func.call @stack_pop_pointer() : () -> i64
      %4689 = func.call @stack_pop_pointer() : () -> i64
      %4690 = func.call @cc_cons(%4689, %4688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4690) : (i64) -> ()
      %4691 = func.call @stack_pop_pointer() : () -> i64
      %4692 = func.call @stack_pop_pointer() : () -> i64
      %4693 = func.call @cc_cons(%4692, %4691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4693) : (i64) -> ()
      %4694 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4695 = arith.constant 15 : i64
      %4696 = func.call @cc_make_string(%4694, %4695) : (!llvm.ptr, i64) -> i64
      %4697 = func.call @cc_nil_value() : () -> i64
      %4698 = func.call @cc_intern(%4696, %4697) : (i64, i64) -> i64
      %4699 = func.call @cc_nil_value() : () -> i64
      %4700 = func.call @cc_cons(%4698, %4699) : (i64, i64) -> i64
      %4701 = func.call @cc_values_pack(%4700) : (i64) -> i64
      func.call @stack_push_pointer(%4698) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4702 = func.call @stack_pop_pointer() : () -> i64
      %4703 = func.call @stack_pop_pointer() : () -> i64
      %4704 = func.call @cc_cons(%4703, %4702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4704) : (i64) -> ()
      %4705 = func.call @stack_pop_pointer() : () -> i64
      %4706 = func.call @stack_pop_pointer() : () -> i64
      %4707 = func.call @cc_cons(%4706, %4705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4707) : (i64) -> ()
      %4708 = func.call @stack_pop_pointer() : () -> i64
      %4709 = func.call @stack_pop_pointer() : () -> i64
      %4710 = func.call @cc_cons(%4709, %4708) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4710) : (i64) -> ()
      %4711 = func.call @stack_pop_pointer() : () -> i64
      %4712 = func.call @stack_pop_pointer() : () -> i64
      %4713 = func.call @cc_cons(%4712, %4711) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4713) : (i64) -> ()
      %4714 = func.call @stack_pop_pointer() : () -> i64
      %4715 = func.call @stack_pop_pointer() : () -> i64
      %4716 = func.call @cc_cons(%4715, %4714) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4716) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4717 = func.call @stack_pop_pointer() : () -> i64
      %4718 = func.call @stack_pop_pointer() : () -> i64
      %4719 = func.call @cc_cons(%4718, %4717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4719) : (i64) -> ()
      %4720 = func.call @stack_pop_pointer() : () -> i64
      %4721 = func.call @stack_pop_pointer() : () -> i64
      %4722 = func.call @cc_cons(%4721, %4720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4722) : (i64) -> ()
      %4723 = func.call @stack_pop_pointer() : () -> i64
      %4724 = func.call @stack_pop_pointer() : () -> i64
      %4725 = func.call @cc_cons(%4724, %4723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4725) : (i64) -> ()
      %4726 = func.call @stack_pop_pointer() : () -> i64
      %5031 = arith.constant 271595545296905 : i64
      %5032 = arith.constant 0 : i64
      %5033 = func.call @cc_make_closure(%5031, %5032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5033) : (i64) -> ()
      %5034 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5035 = func.call @stack_pop_pointer() : () -> i64
      %5036 = func.call @stack_pop_pointer() : () -> i64
      %5037 = func.call @cc_cons(%5036, %5035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5037) : (i64) -> ()
      %5038 = func.call @stack_pop_pointer() : () -> i64
      %5039 = llvm.mlir.addressof @str360 : !llvm.ptr
      %5040 = arith.constant 11 : i64
      %5041 = func.call @cc_make_string(%5039, %5040) : (!llvm.ptr, i64) -> i64
      %5042 = llvm.mlir.addressof @str361 : !llvm.ptr
      %5043 = arith.constant 7 : i64
      %5044 = func.call @cc_make_string(%5042, %5043) : (!llvm.ptr, i64) -> i64
      %5045 = func.call @cc_intern(%5041, %5044) : (i64, i64) -> i64
      %5046 = func.call @cc_nil_value() : () -> i64
      %5047 = func.call @cc_cons(%5045, %5046) : (i64, i64) -> i64
      %5048 = func.call @cc_values_pack(%5047) : (i64) -> i64
      func.call @stack_push_pointer(%5045) : (i64) -> ()
      %5049 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5050 = func.call @stack_pop_pointer() : () -> i64
      %5051 = llvm.mlir.addressof @str362 : !llvm.ptr
      %5052 = arith.constant 4 : i64
      %5053 = func.call @cc_make_string(%5051, %5052) : (!llvm.ptr, i64) -> i64
      %5054 = llvm.mlir.addressof @str363 : !llvm.ptr
      %5055 = arith.constant 7 : i64
      %5056 = func.call @cc_make_string(%5054, %5055) : (!llvm.ptr, i64) -> i64
      %5057 = func.call @cc_intern(%5053, %5056) : (i64, i64) -> i64
      %5058 = func.call @cc_nil_value() : () -> i64
      %5059 = func.call @cc_cons(%5057, %5058) : (i64, i64) -> i64
      %5060 = func.call @cc_values_pack(%5059) : (i64) -> i64
      func.call @stack_push_pointer(%5057) : (i64) -> ()
      %5061 = func.call @stack_pop_pointer() : () -> i64
      %5062 = llvm.mlir.addressof @str364 : !llvm.ptr
      %5063 = arith.constant 6 : i64
      %5064 = func.call @cc_make_string(%5062, %5063) : (!llvm.ptr, i64) -> i64
      %5065 = func.call @cc_nil_value() : () -> i64
      %5066 = func.call @cc_intern(%5064, %5065) : (i64, i64) -> i64
      %5067 = func.call @cc_nil_value() : () -> i64
      %5068 = func.call @cc_cons(%5066, %5067) : (i64, i64) -> i64
      %5069 = func.call @cc_values_pack(%5068) : (i64) -> i64
      func.call @stack_push_pointer(%5066) : (i64) -> ()
      %5070 = func.call @stack_pop_pointer() : () -> i64
      %5071 = func.call @cc_nil_value() : () -> i64
      %5072 = func.call @cc_errorp(%4026) : (i64) -> i64
      %5073 = arith.cmpi ne, %5072, %5071 : i64
      %5074 = arith.cmpi eq, %5071, %5071 : i64
      %5075 = arith.andi %5073, %5074 : i1
      %5076 = scf.if %5075 -> (i64) {
        scf.yield %4026 : i64
      } else {
        scf.yield %5071 : i64
      }
      %5077 = func.call @cc_errorp(%4726) : (i64) -> i64
      %5078 = arith.cmpi ne, %5077, %5071 : i64
      %5079 = arith.cmpi eq, %5076, %5071 : i64
      %5080 = arith.andi %5078, %5079 : i1
      %5081 = scf.if %5080 -> (i64) {
        scf.yield %4726 : i64
      } else {
        scf.yield %5076 : i64
      }
      %5082 = func.call @cc_errorp(%5034) : (i64) -> i64
      %5083 = arith.cmpi ne, %5082, %5071 : i64
      %5084 = arith.cmpi eq, %5081, %5071 : i64
      %5085 = arith.andi %5083, %5084 : i1
      %5086 = scf.if %5085 -> (i64) {
        scf.yield %5034 : i64
      } else {
        scf.yield %5081 : i64
      }
      %5087 = func.call @cc_errorp(%5038) : (i64) -> i64
      %5088 = arith.cmpi ne, %5087, %5071 : i64
      %5089 = arith.cmpi eq, %5086, %5071 : i64
      %5090 = arith.andi %5088, %5089 : i1
      %5091 = scf.if %5090 -> (i64) {
        scf.yield %5038 : i64
      } else {
        scf.yield %5086 : i64
      }
      %5092 = func.call @cc_errorp(%5049) : (i64) -> i64
      %5093 = arith.cmpi ne, %5092, %5071 : i64
      %5094 = arith.cmpi eq, %5091, %5071 : i64
      %5095 = arith.andi %5093, %5094 : i1
      %5096 = scf.if %5095 -> (i64) {
        scf.yield %5049 : i64
      } else {
        scf.yield %5091 : i64
      }
      %5097 = func.call @cc_errorp(%5050) : (i64) -> i64
      %5098 = arith.cmpi ne, %5097, %5071 : i64
      %5099 = arith.cmpi eq, %5096, %5071 : i64
      %5100 = arith.andi %5098, %5099 : i1
      %5101 = scf.if %5100 -> (i64) {
        scf.yield %5050 : i64
      } else {
        scf.yield %5096 : i64
      }
      %5102 = func.call @cc_errorp(%5061) : (i64) -> i64
      %5103 = arith.cmpi ne, %5102, %5071 : i64
      %5104 = arith.cmpi eq, %5101, %5071 : i64
      %5105 = arith.andi %5103, %5104 : i1
      %5106 = scf.if %5105 -> (i64) {
        scf.yield %5061 : i64
      } else {
        scf.yield %5101 : i64
      }
      %5107 = func.call @cc_errorp(%5070) : (i64) -> i64
      %5108 = arith.cmpi ne, %5107, %5071 : i64
      %5109 = arith.cmpi eq, %5106, %5071 : i64
      %5110 = arith.andi %5108, %5109 : i1
      %5111 = scf.if %5110 -> (i64) {
        scf.yield %5070 : i64
      } else {
        scf.yield %5106 : i64
      }
      %5112 = arith.cmpi ne, %5111, %5071 : i64
      scf.if %5112 {
        func.call @stack_push_pointer(%5111) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4026) : (i64) -> ()
        func.call @stack_push_pointer(%4726) : (i64) -> ()
        func.call @stack_push_pointer(%5034) : (i64) -> ()
        func.call @stack_push_pointer(%5038) : (i64) -> ()
        func.call @stack_push_pointer(%5049) : (i64) -> ()
        func.call @stack_push_pointer(%5050) : (i64) -> ()
        func.call @stack_push_pointer(%5061) : (i64) -> ()
        func.call @stack_push_pointer(%5070) : (i64) -> ()
        %5113 = llvm.mlir.addressof @str365 : !llvm.ptr
        %5114 = func.call @cc_make_function_ref_const(%5113) : (!llvm.ptr) -> i64
        %5115 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5114, %5115) : (i64, i64) -> ()
      }
      %5116 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5116 : i64
    }
    func.call @stack_push_pointer(%4017) : (i64) -> ()
    %5117 = func.call @stack_pop_pointer() : () -> i64
    %5118 = func.call @cc_multiple_value_list(%5117) : (i64) -> i64
    %5119 = llvm.mlir.addressof @str366 : !llvm.ptr
    %5120 = arith.constant 38 : i64
    %5121 = func.call @cc_make_string(%5119, %5120) : (!llvm.ptr, i64) -> i64
    %5122 = func.call @cc_nil_value() : () -> i64
    %5123 = func.call @cc_intern(%5121, %5122) : (i64, i64) -> i64
    %5124 = func.call @cc_nil_value() : () -> i64
    %5125 = func.call @cc_cons(%5123, %5124) : (i64, i64) -> i64
    %5126 = func.call @cc_values_pack(%5125) : (i64) -> i64
    %5127 = func.call @cc_symbol_value(%5123) : (i64) -> i64
    %5128 = llvm.mlir.addressof @str367 : !llvm.ptr
    %5129 = arith.constant 40 : i64
    %5130 = func.call @cc_make_string(%5128, %5129) : (!llvm.ptr, i64) -> i64
    %5131 = func.call @cc_nil_value() : () -> i64
    %5132 = func.call @cc_intern(%5130, %5131) : (i64, i64) -> i64
    %5133 = func.call @cc_nil_value() : () -> i64
    %5134 = func.call @cc_cons(%5132, %5133) : (i64, i64) -> i64
    %5135 = func.call @cc_values_pack(%5134) : (i64) -> i64
    %5136 = func.call @cc_symbol_value(%5132) : (i64) -> i64
    %5137 = func.call @cc_nil_value() : () -> i64
    %5138 = arith.cmpi ne, %5127, %5137 : i64
    %5139 = scf.if %5138 -> (i64) {
      scf.yield %5136 : i64
    } else {
      scf.yield %5118 : i64
    }
    %5140 = func.call @cc_values_pack(%5139) : (i64) -> i64
    func.call @stack_push_pointer(%5140) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_271595545296897"() {
    %85 = func.call @cc_nil_value() : () -> i64
    %86 = func.call @cc_nil_value() : () -> i64
    %87 = func.call @cc_errorp(%85) : (i64) -> i64
    %88 = arith.cmpi ne, %87, %86 : i64
    %89 = scf.if %88 -> (i64) {
      scf.yield %85 : i64
    } else {
      %90 = arith.constant 1024 : i64
      %91 = func.call @cc_box_character(%90) : (i64) -> i64
      func.call @stack_push_pointer(%91) : (i64) -> ()
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_errorp(%92) : (i64) -> i64
      %95 = arith.cmpi ne, %94, %93 : i64
      %96 = arith.cmpi eq, %93, %93 : i64
      %97 = arith.andi %95, %96 : i1
      %98 = scf.if %97 -> (i64) {
        scf.yield %92 : i64
      } else {
        scf.yield %93 : i64
      }
      %99 = arith.cmpi ne, %98, %93 : i64
      scf.if %99 {
        func.call @stack_push_pointer(%98) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%92) : (i64) -> ()
        %100 = llvm.mlir.addressof @str8 : !llvm.ptr
        %101 = func.call @cc_make_function_ref_const(%100) : (!llvm.ptr) -> i64
        %102 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%101, %102) : (i64, i64) -> ()
      }
      %103 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %103 : i64
    }
    func.call @stack_push_pointer(%89) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296898"() {
    %224 = func.call @cc_nil_value() : () -> i64
    %225 = func.call @cc_nil_value() : () -> i64
    %226 = func.call @cc_errorp(%224) : (i64) -> i64
    %227 = arith.cmpi ne, %226, %225 : i64
    %228 = scf.if %227 -> (i64) {
      scf.yield %224 : i64
    } else {
      %229 = arith.constant 1104 : i64
      %230 = func.call @cc_box_character(%229) : (i64) -> i64
      func.call @stack_push_pointer(%230) : (i64) -> ()
      %231 = func.call @stack_pop_pointer() : () -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_errorp(%231) : (i64) -> i64
      %234 = arith.cmpi ne, %233, %232 : i64
      %235 = arith.cmpi eq, %232, %232 : i64
      %236 = arith.andi %234, %235 : i1
      %237 = scf.if %236 -> (i64) {
        scf.yield %231 : i64
      } else {
        scf.yield %232 : i64
      }
      %238 = arith.cmpi ne, %237, %232 : i64
      scf.if %238 {
        func.call @stack_push_pointer(%237) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%231) : (i64) -> ()
        %239 = llvm.mlir.addressof @str18 : !llvm.ptr
        %240 = func.call @cc_make_function_ref_const(%239) : (!llvm.ptr) -> i64
        %241 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%240, %241) : (i64, i64) -> ()
      }
      %242 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %242 : i64
    }
    func.call @stack_push_pointer(%228) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296899"() {
    %1191 = func.call @cc_nil_value() : () -> i64
    %1192 = func.call @cc_nil_value() : () -> i64
    %1193 = func.call @cc_errorp(%1191) : (i64) -> i64
    %1194 = arith.cmpi ne, %1193, %1192 : i64
    %1195 = scf.if %1194 -> (i64) {
      scf.yield %1191 : i64
    } else {
      %1196 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1196) : (i64) -> ()
      %1197 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1198 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1199 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1200 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1201 = func.call @stack_pop_pointer() : () -> i64
      %1202 = func.call @cc_nil_value() : () -> i64
      %1203 = func.call @cc_nil_value() : () -> i64
      %1204 = func.call @cc_errorp(%1202) : (i64) -> i64
      %1205 = arith.cmpi ne, %1204, %1203 : i64
      %1206:6 = scf.if %1205 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %1202, %1201, %1198, %1200, %1197, %1199 : i64, i64, i64, i64, i64, i64
      } else {
        %1207 = func.call @cc_nil_value() : () -> i64
        %1208 = llvm.mlir.addressof @str101 : !llvm.ptr
        %1209 = arith.constant 38 : i64
        %1210 = func.call @cc_make_string(%1208, %1209) : (!llvm.ptr, i64) -> i64
        %1211 = func.call @cc_nil_value() : () -> i64
        %1212 = func.call @cc_intern(%1210, %1211) : (i64, i64) -> i64
        %1213 = func.call @cc_nil_value() : () -> i64
        %1214 = func.call @cc_cons(%1212, %1213) : (i64, i64) -> i64
        %1215 = func.call @cc_values_pack(%1214) : (i64) -> i64
        %1216 = func.call @cc_set_symbol_value(%1212, %1207) : (i64, i64) -> i64
        %1217 = llvm.mlir.addressof @str102 : !llvm.ptr
        %1218 = arith.constant 39 : i64
        %1219 = func.call @cc_make_string(%1217, %1218) : (!llvm.ptr, i64) -> i64
        %1220 = func.call @cc_nil_value() : () -> i64
        %1221 = func.call @cc_intern(%1219, %1220) : (i64, i64) -> i64
        %1222 = func.call @cc_nil_value() : () -> i64
        %1223 = func.call @cc_cons(%1221, %1222) : (i64, i64) -> i64
        %1224 = func.call @cc_values_pack(%1223) : (i64) -> i64
        %1225 = func.call @cc_set_symbol_value(%1221, %1207) : (i64, i64) -> i64
        %1226 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1227 = arith.constant 40 : i64
        %1228 = func.call @cc_make_string(%1226, %1227) : (!llvm.ptr, i64) -> i64
        %1229 = func.call @cc_nil_value() : () -> i64
        %1230 = func.call @cc_intern(%1228, %1229) : (i64, i64) -> i64
        %1231 = func.call @cc_nil_value() : () -> i64
        %1232 = func.call @cc_cons(%1230, %1231) : (i64, i64) -> i64
        %1233 = func.call @cc_values_pack(%1232) : (i64) -> i64
        %1234 = func.call @cc_set_symbol_value(%1230, %1207) : (i64, i64) -> i64
        %1235:5 = scf.while (%arg0 = %1201, %arg1 = %1198, %arg2 = %1199, %arg3 = %1200, %arg4 = %1197) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          func.call @stack_push_pointer(%arg4) : (i64) -> ()
          %1236 = func.call @stack_pop_pointer() : () -> i64
          %1237 = arith.constant 55296 : i64
          %1238 = func.call @cc_box_fixnum(%1237) : (i64) -> i64
          func.call @stack_push_pointer(%1238) : (i64) -> ()
          %1239 = func.call @stack_pop_pointer() : () -> i64
          %1240 = arith.constant 1 : i1
          %1242 = arith.constant 3 : i64
          %1241 = arith.andi %1236, %1242 : i64
          %1243 = arith.constant 0 : i64
          %1244 = arith.cmpi eq, %1241, %1243 : i64
          %1246 = arith.constant 3 : i64
          %1245 = arith.andi %1239, %1246 : i64
          %1247 = arith.constant 0 : i64
          %1248 = arith.cmpi eq, %1245, %1247 : i64
          %1249 = arith.andi %1244, %1248 : i1
          %1250 = scf.if %1249 -> (i1) {
            %1251 = arith.constant 2 : i64
            %1252 = arith.shrsi %1236, %1251 : i64
            %1253 = arith.constant 2 : i64
            %1254 = arith.shrsi %1239, %1253 : i64
            %1255 = arith.cmpi slt, %1252, %1254 : i64
            scf.yield %1255 : i1
          } else {
            %1256 = func.call @cc_lt(%1236, %1239) : (i64, i64) -> i64
            %1257 = func.call @cc_nil_value() : () -> i64
            %1258 = arith.cmpi ne, %1256, %1257 : i64
            scf.yield %1258 : i1
          }
          %1259 = arith.andi %1240, %1250 : i1
          %1260 = func.call @cc_nil_value() : () -> i64
          %1261 = func.call @cc_t_value() : () -> i64
          %1262 = scf.if %1259 -> (i64) {
            scf.yield %1261 : i64
          } else {
            scf.yield %1260 : i64
          }
          func.call @stack_push_pointer(%1262) : (i64) -> ()
          %1263 = func.call @stack_pop_pointer() : () -> i64
          %1264 = func.call @cc_nil_value() : () -> i64
          %1265 = arith.cmpi ne, %1263, %1264 : i64
          %1266 = func.call @cc_nil_value() : () -> i64
          %1267 = llvm.mlir.addressof @str104 : !llvm.ptr
          %1268 = arith.constant 38 : i64
          %1269 = func.call @cc_make_string(%1267, %1268) : (!llvm.ptr, i64) -> i64
          %1270 = func.call @cc_nil_value() : () -> i64
          %1271 = func.call @cc_intern(%1269, %1270) : (i64, i64) -> i64
          %1272 = func.call @cc_nil_value() : () -> i64
          %1273 = func.call @cc_cons(%1271, %1272) : (i64, i64) -> i64
          %1274 = func.call @cc_values_pack(%1273) : (i64) -> i64
          %1275 = func.call @cc_symbol_value(%1271) : (i64) -> i64
          %1276 = arith.cmpi ne, %1275, %1266 : i64
          %1277 = llvm.mlir.addressof @str105 : !llvm.ptr
          %1278 = arith.constant 38 : i64
          %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
          %1280 = func.call @cc_nil_value() : () -> i64
          %1281 = func.call @cc_intern(%1279, %1280) : (i64, i64) -> i64
          %1282 = func.call @cc_nil_value() : () -> i64
          %1283 = func.call @cc_cons(%1281, %1282) : (i64, i64) -> i64
          %1284 = func.call @cc_values_pack(%1283) : (i64) -> i64
          %1285 = func.call @cc_symbol_value(%1281) : (i64) -> i64
          %1286 = arith.cmpi ne, %1285, %1266 : i64
          %1287 = arith.ori %1276, %1286 : i1
          %1288 = arith.constant 0 : i1
          %1289 = arith.cmpi eq, %1287, %1288 : i1
          %1290 = arith.andi %1265, %1289 : i1
          scf.condition(%1290) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%1291: i64, %1292: i64, %1293: i64, %1294: i64, %1295: i64):
          %1296 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%1296) : (i64) -> ()
          %1297 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1297) : (i64) -> ()
          %1298 = func.call @stack_depth() : () -> i64
          %1299 = arith.constant 0 : i64
          %1300 = arith.cmpi sgt, %1298, %1299 : i64
          scf.if %1300 {
            %1301 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1295) : (i64) -> ()
          %1302 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1302) : (i64) -> ()
          %1303 = func.call @stack_depth() : () -> i64
          %1304 = arith.constant 0 : i64
          %1305 = arith.cmpi sgt, %1303, %1304 : i64
          scf.if %1305 {
            %1306 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1295) : (i64) -> ()
          %1307 = func.call @stack_pop_pointer() : () -> i64
          %1308 = func.call @cc_unbox_fixnum(%1307) : (i64) -> i64
          %1309 = func.call @cc_box_character(%1308) : (i64) -> i64
          func.call @stack_push_pointer(%1309) : (i64) -> ()
          %1310 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1310) : (i64) -> ()
          %1311 = func.call @stack_depth() : () -> i64
          %1312 = arith.constant 0 : i64
          %1313 = arith.cmpi sgt, %1311, %1312 : i64
          scf.if %1313 {
            %1314 = func.call @stack_pop_pointer() : () -> i64
          }
          %1315 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%1310) : (i64) -> ()
          %1316 = func.call @stack_pop_pointer() : () -> i64
          %1317 = func.call @cc_nil_value() : () -> i64
          %1318 = func.call @cc_cons(%1316, %1317) : (i64, i64) -> i64
          %1319 = func.call @cc_not(%1318) : (i64) -> i64
          func.call @stack_push_pointer(%1319) : (i64) -> ()
          %1320 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1310) : (i64) -> ()
          %1321 = func.call @stack_pop_pointer() : () -> i64
          %1322 = func.call @cc_nil_value() : () -> i64
          %1323 = func.call @cc_errorp(%1321) : (i64) -> i64
          %1324 = arith.cmpi ne, %1323, %1322 : i64
          %1325 = arith.cmpi eq, %1322, %1322 : i64
          %1326 = arith.andi %1324, %1325 : i1
          %1327 = scf.if %1326 -> (i64) {
            scf.yield %1321 : i64
          } else {
            scf.yield %1322 : i64
          }
          %1328 = arith.cmpi ne, %1327, %1322 : i64
          scf.if %1328 {
            func.call @stack_push_pointer(%1327) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1321) : (i64) -> ()
            %1329 = llvm.mlir.addressof @str106 : !llvm.ptr
            %1330 = func.call @cc_make_function_ref_const(%1329) : (!llvm.ptr) -> i64
            %1331 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1330, %1331) : (i64, i64) -> ()
          }
          %1332 = func.call @stack_pop_pointer() : () -> i64
          %1333 = func.call @cc_nil_value() : () -> i64
          %1334 = func.call @cc_nil_value() : () -> i64
          %1335 = func.call @cc_errorp(%1333) : (i64) -> i64
          %1336 = arith.cmpi ne, %1335, %1334 : i64
          %1337 = scf.if %1336 -> (i64) {
            scf.yield %1333 : i64
          } else {
            %1338 = func.call @cc_nil_value() : () -> i64
            %1339 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%1310) : (i64) -> ()
            %1340 = func.call @stack_pop_pointer() : () -> i64
            %1341 = func.call @cc_nil_value() : () -> i64
            %1342 = func.call @cc_errorp(%1340) : (i64) -> i64
            %1343 = arith.cmpi ne, %1342, %1341 : i64
            %1344 = arith.cmpi eq, %1341, %1341 : i64
            %1345 = arith.andi %1343, %1344 : i1
            %1346 = scf.if %1345 -> (i64) {
              scf.yield %1340 : i64
            } else {
              scf.yield %1341 : i64
            }
            %1347 = arith.cmpi ne, %1346, %1341 : i64
            scf.if %1347 {
              func.call @stack_push_pointer(%1346) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1340) : (i64) -> ()
              %1348 = llvm.mlir.addressof @str107 : !llvm.ptr
              %1349 = func.call @cc_make_function_ref_const(%1348) : (!llvm.ptr) -> i64
              %1350 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1349, %1350) : (i64, i64) -> ()
            }
            %1351 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1332) : (i64) -> ()
            func.call @stack_push_pointer(%1310) : (i64) -> ()
            %1352 = func.call @stack_pop_pointer() : () -> i64
            %1353 = func.call @stack_pop_pointer() : () -> i64
            %1354 = func.call @cc_char_eq(%1353, %1352) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1354) : (i64) -> ()
            %1355 = func.call @stack_pop_pointer() : () -> i64
            %1356 = func.call @cc_cons(%1355, %1339) : (i64, i64) -> i64
            %1357 = func.call @cc_cons(%1351, %1356) : (i64, i64) -> i64
            %1358 = func.call @cc_or(%1357) : (i64) -> i64
            func.call @stack_push_pointer(%1358) : (i64) -> ()
            %1359 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1332) : (i64) -> ()
            func.call @stack_push_pointer(%1332) : (i64) -> ()
            %1360 = func.call @stack_pop_pointer() : () -> i64
            %1361 = func.call @cc_nil_value() : () -> i64
            %1362 = func.call @cc_errorp(%1360) : (i64) -> i64
            %1363 = arith.cmpi ne, %1362, %1361 : i64
            %1364 = arith.cmpi eq, %1361, %1361 : i64
            %1365 = arith.andi %1363, %1364 : i1
            %1366 = scf.if %1365 -> (i64) {
              scf.yield %1360 : i64
            } else {
              scf.yield %1361 : i64
            }
            %1367 = arith.cmpi ne, %1366, %1361 : i64
            scf.if %1367 {
              func.call @stack_push_pointer(%1366) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1360) : (i64) -> ()
              %1368 = llvm.mlir.addressof @str108 : !llvm.ptr
              %1369 = func.call @cc_make_function_ref_const(%1368) : (!llvm.ptr) -> i64
              %1370 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1369, %1370) : (i64, i64) -> ()
            }
            %1371 = func.call @stack_pop_pointer() : () -> i64
            %1372 = func.call @stack_pop_pointer() : () -> i64
            %1373 = func.call @cc_char_eq(%1372, %1371) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1373) : (i64) -> ()
            %1374 = func.call @stack_pop_pointer() : () -> i64
            %1375 = func.call @cc_cons(%1374, %1338) : (i64, i64) -> i64
            %1376 = func.call @cc_cons(%1359, %1375) : (i64, i64) -> i64
            %1377 = func.call @cc_and(%1376) : (i64) -> i64
            func.call @stack_push_pointer(%1377) : (i64) -> ()
            %1378 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1378 : i64
          }
          func.call @stack_push_pointer(%1337) : (i64) -> ()
          %1379 = func.call @stack_pop_pointer() : () -> i64
          %1380 = func.call @cc_cons(%1379, %1315) : (i64, i64) -> i64
          %1381 = func.call @cc_cons(%1320, %1380) : (i64, i64) -> i64
          %1382 = func.call @cc_or(%1381) : (i64) -> i64
          func.call @stack_push_pointer(%1382) : (i64) -> ()
          %1383 = func.call @stack_pop_pointer() : () -> i64
          %1384 = func.call @cc_nil_value() : () -> i64
          %1385 = func.call @cc_cons(%1383, %1384) : (i64, i64) -> i64
          %1386 = func.call @cc_not(%1385) : (i64) -> i64
          func.call @stack_push_pointer(%1386) : (i64) -> ()
          %1387 = func.call @stack_pop_pointer() : () -> i64
          %1388 = func.call @cc_nil_value() : () -> i64
          %1389 = arith.cmpi ne, %1387, %1388 : i64
          %1390:2 = scf.if %1389 -> (i64, i64) {
            %1391 = func.call @cc_nil_value() : () -> i64
            %1392 = func.call @cc_nil_value() : () -> i64
            %1393 = func.call @cc_errorp(%1391) : (i64) -> i64
            %1394 = arith.cmpi ne, %1393, %1392 : i64
            %1395:2 = scf.if %1394 -> (i64, i64) {
              scf.yield %1391, %1294 : i64, i64
            } else {
              func.call @stack_push_pointer(%1294) : (i64) -> ()
              func.call @stack_push_pointer(%1295) : (i64) -> ()
              %1396 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1310) : (i64) -> ()
              %1397 = func.call @stack_pop_pointer() : () -> i64
              %1398 = func.call @cc_char_name(%1397) : (i64) -> i64
              func.call @stack_push_pointer(%1398) : (i64) -> ()
              %1399 = func.call @stack_pop_pointer() : () -> i64
              %1400 = func.call @cc_nil_value() : () -> i64
              %1401 = func.call @cc_errorp(%1396) : (i64) -> i64
              %1402 = arith.cmpi ne, %1401, %1400 : i64
              %1403 = arith.cmpi eq, %1400, %1400 : i64
              %1404 = arith.andi %1402, %1403 : i1
              %1405 = scf.if %1404 -> (i64) {
                scf.yield %1396 : i64
              } else {
                scf.yield %1400 : i64
              }
              %1406 = func.call @cc_errorp(%1399) : (i64) -> i64
              %1407 = arith.cmpi ne, %1406, %1400 : i64
              %1408 = arith.cmpi eq, %1405, %1400 : i64
              %1409 = arith.andi %1407, %1408 : i1
              %1410 = scf.if %1409 -> (i64) {
                scf.yield %1399 : i64
              } else {
                scf.yield %1405 : i64
              }
              %1411 = arith.cmpi ne, %1410, %1400 : i64
              scf.if %1411 {
                func.call @stack_push_pointer(%1410) : (i64) -> ()
              } else {
                %1412 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1412) : (i64) -> ()
                func.call @stack_push_pointer(%1399) : (i64) -> ()
                %1413 = func.call @stack_pop_pointer() : () -> i64
                %1414 = func.call @stack_pop_pointer() : () -> i64
                %1415 = func.call @cc_cons(%1413, %1414) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1415) : (i64) -> ()
                func.call @stack_push_pointer(%1396) : (i64) -> ()
                %1416 = func.call @stack_pop_pointer() : () -> i64
                %1417 = func.call @stack_pop_pointer() : () -> i64
                %1418 = func.call @cc_cons(%1416, %1417) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1418) : (i64) -> ()
              }
              %1419 = func.call @stack_pop_pointer() : () -> i64
              %1420 = func.call @cc_nil_value() : () -> i64
              %1421 = func.call @cc_errorp(%1419) : (i64) -> i64
              %1422 = arith.cmpi ne, %1421, %1420 : i64
              %1423 = arith.cmpi eq, %1420, %1420 : i64
              %1424 = arith.andi %1422, %1423 : i1
              %1425 = scf.if %1424 -> (i64) {
                scf.yield %1419 : i64
              } else {
                scf.yield %1420 : i64
              }
              %1426 = arith.cmpi ne, %1425, %1420 : i64
              scf.if %1426 {
                func.call @stack_push_pointer(%1425) : (i64) -> ()
              } else {
                %1427 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1427) : (i64) -> ()
                func.call @stack_push_pointer(%1419) : (i64) -> ()
                %1428 = func.call @stack_pop_pointer() : () -> i64
                %1429 = func.call @stack_pop_pointer() : () -> i64
                %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1430) : (i64) -> ()
              }
              %1431 = func.call @stack_pop_pointer() : () -> i64
              %1432 = func.call @stack_pop_pointer() : () -> i64
              %1433 = func.call @cc_append(%1432, %1431) : (i64, i64) -> i64
              func.call @stack_push_pointer(%1433) : (i64) -> ()
              %1434 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1434) : (i64) -> ()
              %1435 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1435, %1434 : i64, i64
            }
            func.call @stack_push_pointer(%1395#0) : (i64) -> ()
            %1436 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1436, %1395#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %1437 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1437, %1294 : i64, i64
          }
          func.call @stack_push_pointer(%1390#0) : (i64) -> ()
          %1438 = func.call @stack_depth() : () -> i64
          %1439 = arith.constant 0 : i64
          %1440 = arith.cmpi sgt, %1438, %1439 : i64
          scf.if %1440 {
            %1441 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1295) : (i64) -> ()
          %1442 = func.call @stack_pop_pointer() : () -> i64
          %1443 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%1443) : (i64) -> ()
          %1444 = func.call @stack_pop_pointer() : () -> i64
          %1446 = arith.constant 3 : i64
          %1445 = arith.andi %1442, %1446 : i64
          %1447 = arith.constant 0 : i64
          %1448 = arith.cmpi eq, %1445, %1447 : i64
          %1450 = arith.constant 3 : i64
          %1449 = arith.andi %1444, %1450 : i64
          %1451 = arith.constant 0 : i64
          %1452 = arith.cmpi eq, %1449, %1451 : i64
          %1453 = arith.andi %1448, %1452 : i1
          %1454 = scf.if %1453 -> (i64) {
            %1455 = arith.constant 2 : i64
            %1456 = arith.shrsi %1442, %1455 : i64
            %1457 = arith.constant 2 : i64
            %1458 = arith.shrsi %1444, %1457 : i64
            %1459 = arith.addi %1456, %1458 : i64
            %1460 = arith.constant -2305843009213693952 : i64
            %1461 = arith.constant 2305843009213693951 : i64
            %1462 = arith.cmpi sge, %1459, %1460 : i64
            %1463 = arith.cmpi sle, %1459, %1461 : i64
            %1464 = arith.andi %1462, %1463 : i1
            %1465 = scf.if %1464 -> (i64) {
              %1466 = arith.constant 2 : i64
              %1467 = arith.shli %1459, %1466 : i64
              scf.yield %1467 : i64
            } else {
              %1468 = func.call @cc_add(%1442, %1444) : (i64, i64) -> i64
              scf.yield %1468 : i64
            }
            scf.yield %1465 : i64
          } else {
            %1469 = func.call @cc_add(%1442, %1444) : (i64, i64) -> i64
            scf.yield %1469 : i64
          }
          func.call @stack_push_pointer(%1454) : (i64) -> ()
          %1470 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1470) : (i64) -> ()
          %1471 = func.call @stack_depth() : () -> i64
          %1472 = arith.constant 0 : i64
          %1473 = arith.cmpi sgt, %1471, %1472 : i64
          scf.if %1473 {
            %1474 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1297, %1302, %1310, %1390#1, %1470 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1475 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1235#0) : (i64) -> ()
        %1476 = func.call @stack_pop_pointer() : () -> i64
        %1477 = func.call @cc_nil_value() : () -> i64
        %1478 = arith.cmpi ne, %1476, %1477 : i64
        %1479:2 = scf.if %1478 -> (i64, i64) {
          %1480 = func.call @cc_nil_value() : () -> i64
          %1481 = func.call @cc_nil_value() : () -> i64
          %1482 = func.call @cc_errorp(%1480) : (i64) -> i64
          %1483 = arith.cmpi ne, %1482, %1481 : i64
          %1484:2 = scf.if %1483 -> (i64, i64) {
            scf.yield %1480, %1235#4 : i64, i64
          } else {
            func.call @stack_push_pointer(%1235#1) : (i64) -> ()
            %1485 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1485) : (i64) -> ()
            %1486 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1486, %1485 : i64, i64
          }
          func.call @stack_push_pointer(%1484#0) : (i64) -> ()
          %1487 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1487, %1484#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %1488 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1488, %1235#4 : i64, i64
        }
        func.call @stack_push_pointer(%1479#0) : (i64) -> ()
        %1489 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1235#3) : (i64) -> ()
        %1490 = func.call @stack_pop_pointer() : () -> i64
        %1491 = func.call @cc_multiple_value_list(%1490) : (i64) -> i64
        %1492 = llvm.mlir.addressof @str109 : !llvm.ptr
        %1493 = arith.constant 38 : i64
        %1494 = func.call @cc_make_string(%1492, %1493) : (!llvm.ptr, i64) -> i64
        %1495 = func.call @cc_nil_value() : () -> i64
        %1496 = func.call @cc_intern(%1494, %1495) : (i64, i64) -> i64
        %1497 = func.call @cc_nil_value() : () -> i64
        %1498 = func.call @cc_cons(%1496, %1497) : (i64, i64) -> i64
        %1499 = func.call @cc_values_pack(%1498) : (i64) -> i64
        %1500 = func.call @cc_symbol_value(%1496) : (i64) -> i64
        %1501 = llvm.mlir.addressof @str110 : !llvm.ptr
        %1502 = arith.constant 39 : i64
        %1503 = func.call @cc_make_string(%1501, %1502) : (!llvm.ptr, i64) -> i64
        %1504 = func.call @cc_nil_value() : () -> i64
        %1505 = func.call @cc_intern(%1503, %1504) : (i64, i64) -> i64
        %1506 = func.call @cc_nil_value() : () -> i64
        %1507 = func.call @cc_cons(%1505, %1506) : (i64, i64) -> i64
        %1508 = func.call @cc_values_pack(%1507) : (i64) -> i64
        %1509 = func.call @cc_symbol_value(%1505) : (i64) -> i64
        %1510 = llvm.mlir.addressof @str111 : !llvm.ptr
        %1511 = arith.constant 40 : i64
        %1512 = func.call @cc_make_string(%1510, %1511) : (!llvm.ptr, i64) -> i64
        %1513 = func.call @cc_nil_value() : () -> i64
        %1514 = func.call @cc_intern(%1512, %1513) : (i64, i64) -> i64
        %1515 = func.call @cc_nil_value() : () -> i64
        %1516 = func.call @cc_cons(%1514, %1515) : (i64, i64) -> i64
        %1517 = func.call @cc_values_pack(%1516) : (i64) -> i64
        %1518 = func.call @cc_symbol_value(%1514) : (i64) -> i64
        %1519 = func.call @cc_nil_value() : () -> i64
        %1520 = arith.cmpi ne, %1500, %1519 : i64
        %1521 = scf.if %1520 -> (i64) {
          scf.yield %1518 : i64
        } else {
          scf.yield %1491 : i64
        }
        %1522 = func.call @cc_values_pack(%1521) : (i64) -> i64
        func.call @stack_push_pointer(%1522) : (i64) -> ()
        %1523 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1523, %1235#0, %1235#1, %1235#3, %1479#1, %1235#2 : i64, i64, i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%1206#0) : (i64) -> ()
      %1524 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1524 : i64
    }
    func.call @stack_push_pointer(%1195) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296901"() {
    %2324 = func.call @cc_nil_value() : () -> i64
    %2325 = func.call @cc_nil_value() : () -> i64
    %2326 = func.call @cc_errorp(%2324) : (i64) -> i64
    %2327 = arith.cmpi ne, %2326, %2325 : i64
    %2328 = scf.if %2327 -> (i64) {
      scf.yield %2324 : i64
    } else {
      %2329 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2329) : (i64) -> ()
      %2330 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2331 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2332 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2333 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2334 = func.call @stack_pop_pointer() : () -> i64
      %2335 = func.call @cc_nil_value() : () -> i64
      %2336 = func.call @cc_nil_value() : () -> i64
      %2337 = func.call @cc_errorp(%2335) : (i64) -> i64
      %2338 = arith.cmpi ne, %2337, %2336 : i64
      %2339:6 = scf.if %2338 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %2335, %2334, %2331, %2333, %2330, %2332 : i64, i64, i64, i64, i64, i64
      } else {
        %2340 = func.call @cc_nil_value() : () -> i64
        %2341 = llvm.mlir.addressof @str179 : !llvm.ptr
        %2342 = arith.constant 38 : i64
        %2343 = func.call @cc_make_string(%2341, %2342) : (!llvm.ptr, i64) -> i64
        %2344 = func.call @cc_nil_value() : () -> i64
        %2345 = func.call @cc_intern(%2343, %2344) : (i64, i64) -> i64
        %2346 = func.call @cc_nil_value() : () -> i64
        %2347 = func.call @cc_cons(%2345, %2346) : (i64, i64) -> i64
        %2348 = func.call @cc_values_pack(%2347) : (i64) -> i64
        %2349 = func.call @cc_set_symbol_value(%2345, %2340) : (i64, i64) -> i64
        %2350 = llvm.mlir.addressof @str180 : !llvm.ptr
        %2351 = arith.constant 39 : i64
        %2352 = func.call @cc_make_string(%2350, %2351) : (!llvm.ptr, i64) -> i64
        %2353 = func.call @cc_nil_value() : () -> i64
        %2354 = func.call @cc_intern(%2352, %2353) : (i64, i64) -> i64
        %2355 = func.call @cc_nil_value() : () -> i64
        %2356 = func.call @cc_cons(%2354, %2355) : (i64, i64) -> i64
        %2357 = func.call @cc_values_pack(%2356) : (i64) -> i64
        %2358 = func.call @cc_set_symbol_value(%2354, %2340) : (i64, i64) -> i64
        %2359 = llvm.mlir.addressof @str181 : !llvm.ptr
        %2360 = arith.constant 40 : i64
        %2361 = func.call @cc_make_string(%2359, %2360) : (!llvm.ptr, i64) -> i64
        %2362 = func.call @cc_nil_value() : () -> i64
        %2363 = func.call @cc_intern(%2361, %2362) : (i64, i64) -> i64
        %2364 = func.call @cc_nil_value() : () -> i64
        %2365 = func.call @cc_cons(%2363, %2364) : (i64, i64) -> i64
        %2366 = func.call @cc_values_pack(%2365) : (i64) -> i64
        %2367 = func.call @cc_set_symbol_value(%2363, %2340) : (i64, i64) -> i64
        %2368:5 = scf.while (%arg0 = %2334, %arg1 = %2331, %arg2 = %2332, %arg3 = %2333, %arg4 = %2330) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          func.call @stack_push_pointer(%arg4) : (i64) -> ()
          %2369 = func.call @stack_pop_pointer() : () -> i64
          %2370 = arith.constant 55296 : i64
          %2371 = func.call @cc_box_fixnum(%2370) : (i64) -> i64
          func.call @stack_push_pointer(%2371) : (i64) -> ()
          %2372 = func.call @stack_pop_pointer() : () -> i64
          %2373 = arith.constant 1 : i1
          %2375 = arith.constant 3 : i64
          %2374 = arith.andi %2369, %2375 : i64
          %2376 = arith.constant 0 : i64
          %2377 = arith.cmpi eq, %2374, %2376 : i64
          %2379 = arith.constant 3 : i64
          %2378 = arith.andi %2372, %2379 : i64
          %2380 = arith.constant 0 : i64
          %2381 = arith.cmpi eq, %2378, %2380 : i64
          %2382 = arith.andi %2377, %2381 : i1
          %2383 = scf.if %2382 -> (i1) {
            %2384 = arith.constant 2 : i64
            %2385 = arith.shrsi %2369, %2384 : i64
            %2386 = arith.constant 2 : i64
            %2387 = arith.shrsi %2372, %2386 : i64
            %2388 = arith.cmpi slt, %2385, %2387 : i64
            scf.yield %2388 : i1
          } else {
            %2389 = func.call @cc_lt(%2369, %2372) : (i64, i64) -> i64
            %2390 = func.call @cc_nil_value() : () -> i64
            %2391 = arith.cmpi ne, %2389, %2390 : i64
            scf.yield %2391 : i1
          }
          %2392 = arith.andi %2373, %2383 : i1
          %2393 = func.call @cc_nil_value() : () -> i64
          %2394 = func.call @cc_t_value() : () -> i64
          %2395 = scf.if %2392 -> (i64) {
            scf.yield %2394 : i64
          } else {
            scf.yield %2393 : i64
          }
          func.call @stack_push_pointer(%2395) : (i64) -> ()
          %2396 = func.call @stack_pop_pointer() : () -> i64
          %2397 = func.call @cc_nil_value() : () -> i64
          %2398 = arith.cmpi ne, %2396, %2397 : i64
          %2399 = func.call @cc_nil_value() : () -> i64
          %2400 = llvm.mlir.addressof @str182 : !llvm.ptr
          %2401 = arith.constant 38 : i64
          %2402 = func.call @cc_make_string(%2400, %2401) : (!llvm.ptr, i64) -> i64
          %2403 = func.call @cc_nil_value() : () -> i64
          %2404 = func.call @cc_intern(%2402, %2403) : (i64, i64) -> i64
          %2405 = func.call @cc_nil_value() : () -> i64
          %2406 = func.call @cc_cons(%2404, %2405) : (i64, i64) -> i64
          %2407 = func.call @cc_values_pack(%2406) : (i64) -> i64
          %2408 = func.call @cc_symbol_value(%2404) : (i64) -> i64
          %2409 = arith.cmpi ne, %2408, %2399 : i64
          %2410 = llvm.mlir.addressof @str183 : !llvm.ptr
          %2411 = arith.constant 38 : i64
          %2412 = func.call @cc_make_string(%2410, %2411) : (!llvm.ptr, i64) -> i64
          %2413 = func.call @cc_nil_value() : () -> i64
          %2414 = func.call @cc_intern(%2412, %2413) : (i64, i64) -> i64
          %2415 = func.call @cc_nil_value() : () -> i64
          %2416 = func.call @cc_cons(%2414, %2415) : (i64, i64) -> i64
          %2417 = func.call @cc_values_pack(%2416) : (i64) -> i64
          %2418 = func.call @cc_symbol_value(%2414) : (i64) -> i64
          %2419 = arith.cmpi ne, %2418, %2399 : i64
          %2420 = arith.ori %2409, %2419 : i1
          %2421 = arith.constant 0 : i1
          %2422 = arith.cmpi eq, %2420, %2421 : i1
          %2423 = arith.andi %2398, %2422 : i1
          scf.condition(%2423) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%2424: i64, %2425: i64, %2426: i64, %2427: i64, %2428: i64):
          %2429 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%2429) : (i64) -> ()
          %2430 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2430) : (i64) -> ()
          %2431 = func.call @stack_depth() : () -> i64
          %2432 = arith.constant 0 : i64
          %2433 = arith.cmpi sgt, %2431, %2432 : i64
          scf.if %2433 {
            %2434 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%2428) : (i64) -> ()
          %2435 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2435) : (i64) -> ()
          %2436 = func.call @stack_depth() : () -> i64
          %2437 = arith.constant 0 : i64
          %2438 = arith.cmpi sgt, %2436, %2437 : i64
          scf.if %2438 {
            %2439 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%2428) : (i64) -> ()
          %2440 = func.call @stack_pop_pointer() : () -> i64
          %2441 = func.call @cc_unbox_fixnum(%2440) : (i64) -> i64
          %2442 = func.call @cc_box_character(%2441) : (i64) -> i64
          func.call @stack_push_pointer(%2442) : (i64) -> ()
          %2443 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2443) : (i64) -> ()
          %2444 = func.call @stack_depth() : () -> i64
          %2445 = arith.constant 0 : i64
          %2446 = arith.cmpi sgt, %2444, %2445 : i64
          scf.if %2446 {
            %2447 = func.call @stack_pop_pointer() : () -> i64
          }
          %2448 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%2443) : (i64) -> ()
          %2449 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2443) : (i64) -> ()
          %2450 = func.call @stack_pop_pointer() : () -> i64
          %2451 = func.call @cc_nil_value() : () -> i64
          %2452 = func.call @cc_errorp(%2450) : (i64) -> i64
          %2453 = arith.cmpi ne, %2452, %2451 : i64
          %2454 = arith.cmpi eq, %2451, %2451 : i64
          %2455 = arith.andi %2453, %2454 : i1
          %2456 = scf.if %2455 -> (i64) {
            scf.yield %2450 : i64
          } else {
            scf.yield %2451 : i64
          }
          %2457 = arith.cmpi ne, %2456, %2451 : i64
          scf.if %2457 {
            func.call @stack_push_pointer(%2456) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2450) : (i64) -> ()
            %2458 = llvm.mlir.addressof @str184 : !llvm.ptr
            %2459 = func.call @cc_make_function_ref_const(%2458) : (!llvm.ptr) -> i64
            %2460 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2459, %2460) : (i64, i64) -> ()
          }
          %2461 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2443) : (i64) -> ()
          func.call @stack_push_pointer(%2443) : (i64) -> ()
          %2462 = func.call @stack_pop_pointer() : () -> i64
          %2463 = func.call @cc_nil_value() : () -> i64
          %2464 = func.call @cc_errorp(%2462) : (i64) -> i64
          %2465 = arith.cmpi ne, %2464, %2463 : i64
          %2466 = arith.cmpi eq, %2463, %2463 : i64
          %2467 = arith.andi %2465, %2466 : i1
          %2468 = scf.if %2467 -> (i64) {
            scf.yield %2462 : i64
          } else {
            scf.yield %2463 : i64
          }
          %2469 = arith.cmpi ne, %2468, %2463 : i64
          scf.if %2469 {
            func.call @stack_push_pointer(%2468) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2462) : (i64) -> ()
            %2470 = llvm.mlir.addressof @str185 : !llvm.ptr
            %2471 = func.call @cc_make_function_ref_const(%2470) : (!llvm.ptr) -> i64
            %2472 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2471, %2472) : (i64, i64) -> ()
          }
          %2473 = func.call @stack_pop_pointer() : () -> i64
          %2474 = func.call @stack_pop_pointer() : () -> i64
          %2475 = func.call @cc_char_eq(%2474, %2473) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2475) : (i64) -> ()
          %2476 = func.call @stack_pop_pointer() : () -> i64
          %2477 = func.call @cc_cons(%2476, %2448) : (i64, i64) -> i64
          %2478 = func.call @cc_cons(%2461, %2477) : (i64, i64) -> i64
          %2479 = func.call @cc_cons(%2449, %2478) : (i64, i64) -> i64
          %2480 = func.call @cc_and(%2479) : (i64) -> i64
          func.call @stack_push_pointer(%2480) : (i64) -> ()
          %2481 = func.call @stack_pop_pointer() : () -> i64
          %2482 = func.call @cc_nil_value() : () -> i64
          %2483 = arith.cmpi ne, %2481, %2482 : i64
          %2484:2 = scf.if %2483 -> (i64, i64) {
            %2485 = func.call @cc_nil_value() : () -> i64
            %2486 = func.call @cc_nil_value() : () -> i64
            %2487 = func.call @cc_errorp(%2485) : (i64) -> i64
            %2488 = arith.cmpi ne, %2487, %2486 : i64
            %2489:2 = scf.if %2488 -> (i64, i64) {
              scf.yield %2485, %2427 : i64, i64
            } else {
              func.call @stack_push_pointer(%2427) : (i64) -> ()
              func.call @stack_push_pointer(%2428) : (i64) -> ()
              %2490 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2443) : (i64) -> ()
              %2491 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2443) : (i64) -> ()
              %2492 = func.call @stack_pop_pointer() : () -> i64
              %2493 = func.call @cc_char_name(%2492) : (i64) -> i64
              func.call @stack_push_pointer(%2493) : (i64) -> ()
              %2494 = func.call @stack_pop_pointer() : () -> i64
              %2495 = func.call @cc_nil_value() : () -> i64
              %2496 = func.call @cc_errorp(%2490) : (i64) -> i64
              %2497 = arith.cmpi ne, %2496, %2495 : i64
              %2498 = arith.cmpi eq, %2495, %2495 : i64
              %2499 = arith.andi %2497, %2498 : i1
              %2500 = scf.if %2499 -> (i64) {
                scf.yield %2490 : i64
              } else {
                scf.yield %2495 : i64
              }
              %2501 = func.call @cc_errorp(%2491) : (i64) -> i64
              %2502 = arith.cmpi ne, %2501, %2495 : i64
              %2503 = arith.cmpi eq, %2500, %2495 : i64
              %2504 = arith.andi %2502, %2503 : i1
              %2505 = scf.if %2504 -> (i64) {
                scf.yield %2491 : i64
              } else {
                scf.yield %2500 : i64
              }
              %2506 = func.call @cc_errorp(%2494) : (i64) -> i64
              %2507 = arith.cmpi ne, %2506, %2495 : i64
              %2508 = arith.cmpi eq, %2505, %2495 : i64
              %2509 = arith.andi %2507, %2508 : i1
              %2510 = scf.if %2509 -> (i64) {
                scf.yield %2494 : i64
              } else {
                scf.yield %2505 : i64
              }
              %2511 = arith.cmpi ne, %2510, %2495 : i64
              scf.if %2511 {
                func.call @stack_push_pointer(%2510) : (i64) -> ()
              } else {
                %2512 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%2512) : (i64) -> ()
                func.call @stack_push_pointer(%2494) : (i64) -> ()
                %2513 = func.call @stack_pop_pointer() : () -> i64
                %2514 = func.call @stack_pop_pointer() : () -> i64
                %2515 = func.call @cc_cons(%2513, %2514) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2515) : (i64) -> ()
                func.call @stack_push_pointer(%2491) : (i64) -> ()
                %2516 = func.call @stack_pop_pointer() : () -> i64
                %2517 = func.call @stack_pop_pointer() : () -> i64
                %2518 = func.call @cc_cons(%2516, %2517) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2518) : (i64) -> ()
                func.call @stack_push_pointer(%2490) : (i64) -> ()
                %2519 = func.call @stack_pop_pointer() : () -> i64
                %2520 = func.call @stack_pop_pointer() : () -> i64
                %2521 = func.call @cc_cons(%2519, %2520) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2521) : (i64) -> ()
              }
              %2522 = func.call @stack_pop_pointer() : () -> i64
              %2523 = func.call @cc_nil_value() : () -> i64
              %2524 = func.call @cc_errorp(%2522) : (i64) -> i64
              %2525 = arith.cmpi ne, %2524, %2523 : i64
              %2526 = arith.cmpi eq, %2523, %2523 : i64
              %2527 = arith.andi %2525, %2526 : i1
              %2528 = scf.if %2527 -> (i64) {
                scf.yield %2522 : i64
              } else {
                scf.yield %2523 : i64
              }
              %2529 = arith.cmpi ne, %2528, %2523 : i64
              scf.if %2529 {
                func.call @stack_push_pointer(%2528) : (i64) -> ()
              } else {
                %2530 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%2530) : (i64) -> ()
                func.call @stack_push_pointer(%2522) : (i64) -> ()
                %2531 = func.call @stack_pop_pointer() : () -> i64
                %2532 = func.call @stack_pop_pointer() : () -> i64
                %2533 = func.call @cc_cons(%2531, %2532) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2533) : (i64) -> ()
              }
              %2534 = func.call @stack_pop_pointer() : () -> i64
              %2535 = func.call @stack_pop_pointer() : () -> i64
              %2536 = func.call @cc_append(%2535, %2534) : (i64, i64) -> i64
              func.call @stack_push_pointer(%2536) : (i64) -> ()
              %2537 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2537) : (i64) -> ()
              %2538 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2538, %2537 : i64, i64
            }
            func.call @stack_push_pointer(%2489#0) : (i64) -> ()
            %2539 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2539, %2489#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %2540 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2540, %2427 : i64, i64
          }
          func.call @stack_push_pointer(%2484#0) : (i64) -> ()
          %2541 = func.call @stack_depth() : () -> i64
          %2542 = arith.constant 0 : i64
          %2543 = arith.cmpi sgt, %2541, %2542 : i64
          scf.if %2543 {
            %2544 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%2428) : (i64) -> ()
          %2545 = func.call @stack_pop_pointer() : () -> i64
          %2546 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%2546) : (i64) -> ()
          %2547 = func.call @stack_pop_pointer() : () -> i64
          %2549 = arith.constant 3 : i64
          %2548 = arith.andi %2545, %2549 : i64
          %2550 = arith.constant 0 : i64
          %2551 = arith.cmpi eq, %2548, %2550 : i64
          %2553 = arith.constant 3 : i64
          %2552 = arith.andi %2547, %2553 : i64
          %2554 = arith.constant 0 : i64
          %2555 = arith.cmpi eq, %2552, %2554 : i64
          %2556 = arith.andi %2551, %2555 : i1
          %2557 = scf.if %2556 -> (i64) {
            %2558 = arith.constant 2 : i64
            %2559 = arith.shrsi %2545, %2558 : i64
            %2560 = arith.constant 2 : i64
            %2561 = arith.shrsi %2547, %2560 : i64
            %2562 = arith.addi %2559, %2561 : i64
            %2563 = arith.constant -2305843009213693952 : i64
            %2564 = arith.constant 2305843009213693951 : i64
            %2565 = arith.cmpi sge, %2562, %2563 : i64
            %2566 = arith.cmpi sle, %2562, %2564 : i64
            %2567 = arith.andi %2565, %2566 : i1
            %2568 = scf.if %2567 -> (i64) {
              %2569 = arith.constant 2 : i64
              %2570 = arith.shli %2562, %2569 : i64
              scf.yield %2570 : i64
            } else {
              %2571 = func.call @cc_add(%2545, %2547) : (i64, i64) -> i64
              scf.yield %2571 : i64
            }
            scf.yield %2568 : i64
          } else {
            %2572 = func.call @cc_add(%2545, %2547) : (i64, i64) -> i64
            scf.yield %2572 : i64
          }
          func.call @stack_push_pointer(%2557) : (i64) -> ()
          %2573 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2573) : (i64) -> ()
          %2574 = func.call @stack_depth() : () -> i64
          %2575 = arith.constant 0 : i64
          %2576 = arith.cmpi sgt, %2574, %2575 : i64
          scf.if %2576 {
            %2577 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %2430, %2435, %2443, %2484#1, %2573 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %2578 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2368#0) : (i64) -> ()
        %2579 = func.call @stack_pop_pointer() : () -> i64
        %2580 = func.call @cc_nil_value() : () -> i64
        %2581 = arith.cmpi ne, %2579, %2580 : i64
        %2582:2 = scf.if %2581 -> (i64, i64) {
          %2583 = func.call @cc_nil_value() : () -> i64
          %2584 = func.call @cc_nil_value() : () -> i64
          %2585 = func.call @cc_errorp(%2583) : (i64) -> i64
          %2586 = arith.cmpi ne, %2585, %2584 : i64
          %2587:2 = scf.if %2586 -> (i64, i64) {
            scf.yield %2583, %2368#4 : i64, i64
          } else {
            func.call @stack_push_pointer(%2368#1) : (i64) -> ()
            %2588 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2588) : (i64) -> ()
            %2589 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2589, %2588 : i64, i64
          }
          func.call @stack_push_pointer(%2587#0) : (i64) -> ()
          %2590 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2590, %2587#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %2591 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2591, %2368#4 : i64, i64
        }
        func.call @stack_push_pointer(%2582#0) : (i64) -> ()
        %2592 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2368#3) : (i64) -> ()
        %2593 = func.call @stack_pop_pointer() : () -> i64
        %2594 = func.call @cc_multiple_value_list(%2593) : (i64) -> i64
        %2595 = llvm.mlir.addressof @str186 : !llvm.ptr
        %2596 = arith.constant 38 : i64
        %2597 = func.call @cc_make_string(%2595, %2596) : (!llvm.ptr, i64) -> i64
        %2598 = func.call @cc_nil_value() : () -> i64
        %2599 = func.call @cc_intern(%2597, %2598) : (i64, i64) -> i64
        %2600 = func.call @cc_nil_value() : () -> i64
        %2601 = func.call @cc_cons(%2599, %2600) : (i64, i64) -> i64
        %2602 = func.call @cc_values_pack(%2601) : (i64) -> i64
        %2603 = func.call @cc_symbol_value(%2599) : (i64) -> i64
        %2604 = llvm.mlir.addressof @str187 : !llvm.ptr
        %2605 = arith.constant 39 : i64
        %2606 = func.call @cc_make_string(%2604, %2605) : (!llvm.ptr, i64) -> i64
        %2607 = func.call @cc_nil_value() : () -> i64
        %2608 = func.call @cc_intern(%2606, %2607) : (i64, i64) -> i64
        %2609 = func.call @cc_nil_value() : () -> i64
        %2610 = func.call @cc_cons(%2608, %2609) : (i64, i64) -> i64
        %2611 = func.call @cc_values_pack(%2610) : (i64) -> i64
        %2612 = func.call @cc_symbol_value(%2608) : (i64) -> i64
        %2613 = llvm.mlir.addressof @str188 : !llvm.ptr
        %2614 = arith.constant 40 : i64
        %2615 = func.call @cc_make_string(%2613, %2614) : (!llvm.ptr, i64) -> i64
        %2616 = func.call @cc_nil_value() : () -> i64
        %2617 = func.call @cc_intern(%2615, %2616) : (i64, i64) -> i64
        %2618 = func.call @cc_nil_value() : () -> i64
        %2619 = func.call @cc_cons(%2617, %2618) : (i64, i64) -> i64
        %2620 = func.call @cc_values_pack(%2619) : (i64) -> i64
        %2621 = func.call @cc_symbol_value(%2617) : (i64) -> i64
        %2622 = func.call @cc_nil_value() : () -> i64
        %2623 = arith.cmpi ne, %2603, %2622 : i64
        %2624 = scf.if %2623 -> (i64) {
          scf.yield %2621 : i64
        } else {
          scf.yield %2594 : i64
        }
        %2625 = func.call @cc_values_pack(%2624) : (i64) -> i64
        func.call @stack_push_pointer(%2625) : (i64) -> ()
        %2626 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2626, %2368#0, %2368#1, %2368#3, %2582#1, %2368#2 : i64, i64, i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%2339#0) : (i64) -> ()
      %2627 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2627 : i64
    }
    func.call @stack_push_pointer(%2328) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296903"() {
    %3585 = func.call @cc_nil_value() : () -> i64
    %3586 = func.call @cc_nil_value() : () -> i64
    %3587 = func.call @cc_errorp(%3585) : (i64) -> i64
    %3588 = arith.cmpi ne, %3587, %3586 : i64
    %3589 = scf.if %3588 -> (i64) {
      scf.yield %3585 : i64
    } else {
      %3590 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3590) : (i64) -> ()
      %3591 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3592 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3593 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3594 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3595 = func.call @stack_pop_pointer() : () -> i64
      %3596 = func.call @cc_nil_value() : () -> i64
      %3597 = func.call @cc_nil_value() : () -> i64
      %3598 = func.call @cc_errorp(%3596) : (i64) -> i64
      %3599 = arith.cmpi ne, %3598, %3597 : i64
      %3600:6 = scf.if %3599 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %3596, %3595, %3592, %3594, %3591, %3593 : i64, i64, i64, i64, i64, i64
      } else {
        %3601 = func.call @cc_nil_value() : () -> i64
        %3602 = llvm.mlir.addressof @str272 : !llvm.ptr
        %3603 = arith.constant 38 : i64
        %3604 = func.call @cc_make_string(%3602, %3603) : (!llvm.ptr, i64) -> i64
        %3605 = func.call @cc_nil_value() : () -> i64
        %3606 = func.call @cc_intern(%3604, %3605) : (i64, i64) -> i64
        %3607 = func.call @cc_nil_value() : () -> i64
        %3608 = func.call @cc_cons(%3606, %3607) : (i64, i64) -> i64
        %3609 = func.call @cc_values_pack(%3608) : (i64) -> i64
        %3610 = func.call @cc_set_symbol_value(%3606, %3601) : (i64, i64) -> i64
        %3611 = llvm.mlir.addressof @str273 : !llvm.ptr
        %3612 = arith.constant 39 : i64
        %3613 = func.call @cc_make_string(%3611, %3612) : (!llvm.ptr, i64) -> i64
        %3614 = func.call @cc_nil_value() : () -> i64
        %3615 = func.call @cc_intern(%3613, %3614) : (i64, i64) -> i64
        %3616 = func.call @cc_nil_value() : () -> i64
        %3617 = func.call @cc_cons(%3615, %3616) : (i64, i64) -> i64
        %3618 = func.call @cc_values_pack(%3617) : (i64) -> i64
        %3619 = func.call @cc_set_symbol_value(%3615, %3601) : (i64, i64) -> i64
        %3620 = llvm.mlir.addressof @str274 : !llvm.ptr
        %3621 = arith.constant 40 : i64
        %3622 = func.call @cc_make_string(%3620, %3621) : (!llvm.ptr, i64) -> i64
        %3623 = func.call @cc_nil_value() : () -> i64
        %3624 = func.call @cc_intern(%3622, %3623) : (i64, i64) -> i64
        %3625 = func.call @cc_nil_value() : () -> i64
        %3626 = func.call @cc_cons(%3624, %3625) : (i64, i64) -> i64
        %3627 = func.call @cc_values_pack(%3626) : (i64) -> i64
        %3628 = func.call @cc_set_symbol_value(%3624, %3601) : (i64, i64) -> i64
        %3629:5 = scf.while (%arg0 = %3595, %arg1 = %3592, %arg2 = %3593, %arg3 = %3594, %arg4 = %3591) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          func.call @stack_push_pointer(%arg4) : (i64) -> ()
          %3630 = func.call @stack_pop_pointer() : () -> i64
          %3631 = arith.constant 55296 : i64
          %3632 = func.call @cc_box_fixnum(%3631) : (i64) -> i64
          func.call @stack_push_pointer(%3632) : (i64) -> ()
          %3633 = func.call @stack_pop_pointer() : () -> i64
          %3634 = arith.constant 1 : i1
          %3636 = arith.constant 3 : i64
          %3635 = arith.andi %3630, %3636 : i64
          %3637 = arith.constant 0 : i64
          %3638 = arith.cmpi eq, %3635, %3637 : i64
          %3640 = arith.constant 3 : i64
          %3639 = arith.andi %3633, %3640 : i64
          %3641 = arith.constant 0 : i64
          %3642 = arith.cmpi eq, %3639, %3641 : i64
          %3643 = arith.andi %3638, %3642 : i1
          %3644 = scf.if %3643 -> (i1) {
            %3645 = arith.constant 2 : i64
            %3646 = arith.shrsi %3630, %3645 : i64
            %3647 = arith.constant 2 : i64
            %3648 = arith.shrsi %3633, %3647 : i64
            %3649 = arith.cmpi slt, %3646, %3648 : i64
            scf.yield %3649 : i1
          } else {
            %3650 = func.call @cc_lt(%3630, %3633) : (i64, i64) -> i64
            %3651 = func.call @cc_nil_value() : () -> i64
            %3652 = arith.cmpi ne, %3650, %3651 : i64
            scf.yield %3652 : i1
          }
          %3653 = arith.andi %3634, %3644 : i1
          %3654 = func.call @cc_nil_value() : () -> i64
          %3655 = func.call @cc_t_value() : () -> i64
          %3656 = scf.if %3653 -> (i64) {
            scf.yield %3655 : i64
          } else {
            scf.yield %3654 : i64
          }
          func.call @stack_push_pointer(%3656) : (i64) -> ()
          %3657 = func.call @stack_pop_pointer() : () -> i64
          %3658 = func.call @cc_nil_value() : () -> i64
          %3659 = arith.cmpi ne, %3657, %3658 : i64
          %3660 = func.call @cc_nil_value() : () -> i64
          %3661 = llvm.mlir.addressof @str275 : !llvm.ptr
          %3662 = arith.constant 38 : i64
          %3663 = func.call @cc_make_string(%3661, %3662) : (!llvm.ptr, i64) -> i64
          %3664 = func.call @cc_nil_value() : () -> i64
          %3665 = func.call @cc_intern(%3663, %3664) : (i64, i64) -> i64
          %3666 = func.call @cc_nil_value() : () -> i64
          %3667 = func.call @cc_cons(%3665, %3666) : (i64, i64) -> i64
          %3668 = func.call @cc_values_pack(%3667) : (i64) -> i64
          %3669 = func.call @cc_symbol_value(%3665) : (i64) -> i64
          %3670 = arith.cmpi ne, %3669, %3660 : i64
          %3671 = llvm.mlir.addressof @str276 : !llvm.ptr
          %3672 = arith.constant 38 : i64
          %3673 = func.call @cc_make_string(%3671, %3672) : (!llvm.ptr, i64) -> i64
          %3674 = func.call @cc_nil_value() : () -> i64
          %3675 = func.call @cc_intern(%3673, %3674) : (i64, i64) -> i64
          %3676 = func.call @cc_nil_value() : () -> i64
          %3677 = func.call @cc_cons(%3675, %3676) : (i64, i64) -> i64
          %3678 = func.call @cc_values_pack(%3677) : (i64) -> i64
          %3679 = func.call @cc_symbol_value(%3675) : (i64) -> i64
          %3680 = arith.cmpi ne, %3679, %3660 : i64
          %3681 = arith.ori %3670, %3680 : i1
          %3682 = arith.constant 0 : i1
          %3683 = arith.cmpi eq, %3681, %3682 : i1
          %3684 = arith.andi %3659, %3683 : i1
          scf.condition(%3684) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%3685: i64, %3686: i64, %3687: i64, %3688: i64, %3689: i64):
          %3690 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%3690) : (i64) -> ()
          %3691 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3691) : (i64) -> ()
          %3692 = func.call @stack_depth() : () -> i64
          %3693 = arith.constant 0 : i64
          %3694 = arith.cmpi sgt, %3692, %3693 : i64
          scf.if %3694 {
            %3695 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%3689) : (i64) -> ()
          %3696 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3696) : (i64) -> ()
          %3697 = func.call @stack_depth() : () -> i64
          %3698 = arith.constant 0 : i64
          %3699 = arith.cmpi sgt, %3697, %3698 : i64
          scf.if %3699 {
            %3700 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%3689) : (i64) -> ()
          %3701 = func.call @stack_pop_pointer() : () -> i64
          %3702 = func.call @cc_unbox_fixnum(%3701) : (i64) -> i64
          %3703 = func.call @cc_box_character(%3702) : (i64) -> i64
          func.call @stack_push_pointer(%3703) : (i64) -> ()
          %3704 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3704) : (i64) -> ()
          %3705 = func.call @stack_depth() : () -> i64
          %3706 = arith.constant 0 : i64
          %3707 = arith.cmpi sgt, %3705, %3706 : i64
          scf.if %3707 {
            %3708 = func.call @stack_pop_pointer() : () -> i64
          }
          %3709 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%3704) : (i64) -> ()
          %3710 = func.call @stack_pop_pointer() : () -> i64
          %3711 = func.call @cc_nil_value() : () -> i64
          %3712 = func.call @cc_cons(%3710, %3711) : (i64, i64) -> i64
          %3713 = func.call @cc_not(%3712) : (i64) -> i64
          func.call @stack_push_pointer(%3713) : (i64) -> ()
          %3714 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3704) : (i64) -> ()
          %3715 = func.call @stack_pop_pointer() : () -> i64
          %3716 = func.call @cc_nil_value() : () -> i64
          %3717 = func.call @cc_errorp(%3715) : (i64) -> i64
          %3718 = arith.cmpi ne, %3717, %3716 : i64
          %3719 = arith.cmpi eq, %3716, %3716 : i64
          %3720 = arith.andi %3718, %3719 : i1
          %3721 = scf.if %3720 -> (i64) {
            scf.yield %3715 : i64
          } else {
            scf.yield %3716 : i64
          }
          %3722 = arith.cmpi ne, %3721, %3716 : i64
          scf.if %3722 {
            func.call @stack_push_pointer(%3721) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3715) : (i64) -> ()
            %3723 = llvm.mlir.addressof @str277 : !llvm.ptr
            %3724 = func.call @cc_make_function_ref_const(%3723) : (!llvm.ptr) -> i64
            %3725 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3724, %3725) : (i64, i64) -> ()
          }
          %3726 = func.call @stack_pop_pointer() : () -> i64
          %3727 = func.call @cc_nil_value() : () -> i64
          %3728 = func.call @cc_nil_value() : () -> i64
          %3729 = func.call @cc_errorp(%3727) : (i64) -> i64
          %3730 = arith.cmpi ne, %3729, %3728 : i64
          %3731 = scf.if %3730 -> (i64) {
            scf.yield %3727 : i64
          } else {
            %3732 = func.call @cc_nil_value() : () -> i64
            %3733 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%3704) : (i64) -> ()
            %3734 = func.call @stack_pop_pointer() : () -> i64
            %3735 = func.call @cc_nil_value() : () -> i64
            %3736 = func.call @cc_errorp(%3734) : (i64) -> i64
            %3737 = arith.cmpi ne, %3736, %3735 : i64
            %3738 = arith.cmpi eq, %3735, %3735 : i64
            %3739 = arith.andi %3737, %3738 : i1
            %3740 = scf.if %3739 -> (i64) {
              scf.yield %3734 : i64
            } else {
              scf.yield %3735 : i64
            }
            %3741 = arith.cmpi ne, %3740, %3735 : i64
            scf.if %3741 {
              func.call @stack_push_pointer(%3740) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3734) : (i64) -> ()
              %3742 = llvm.mlir.addressof @str278 : !llvm.ptr
              %3743 = func.call @cc_make_function_ref_const(%3742) : (!llvm.ptr) -> i64
              %3744 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3743, %3744) : (i64, i64) -> ()
            }
            %3745 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3726) : (i64) -> ()
            func.call @stack_push_pointer(%3704) : (i64) -> ()
            %3746 = func.call @stack_pop_pointer() : () -> i64
            %3747 = func.call @stack_pop_pointer() : () -> i64
            %3748 = func.call @cc_char_eq(%3747, %3746) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3748) : (i64) -> ()
            %3749 = func.call @stack_pop_pointer() : () -> i64
            %3750 = func.call @cc_cons(%3749, %3733) : (i64, i64) -> i64
            %3751 = func.call @cc_cons(%3745, %3750) : (i64, i64) -> i64
            %3752 = func.call @cc_or(%3751) : (i64) -> i64
            func.call @stack_push_pointer(%3752) : (i64) -> ()
            %3753 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3726) : (i64) -> ()
            func.call @stack_push_pointer(%3726) : (i64) -> ()
            %3754 = func.call @stack_pop_pointer() : () -> i64
            %3755 = func.call @cc_nil_value() : () -> i64
            %3756 = func.call @cc_errorp(%3754) : (i64) -> i64
            %3757 = arith.cmpi ne, %3756, %3755 : i64
            %3758 = arith.cmpi eq, %3755, %3755 : i64
            %3759 = arith.andi %3757, %3758 : i1
            %3760 = scf.if %3759 -> (i64) {
              scf.yield %3754 : i64
            } else {
              scf.yield %3755 : i64
            }
            %3761 = arith.cmpi ne, %3760, %3755 : i64
            scf.if %3761 {
              func.call @stack_push_pointer(%3760) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3754) : (i64) -> ()
              %3762 = llvm.mlir.addressof @str279 : !llvm.ptr
              %3763 = func.call @cc_make_function_ref_const(%3762) : (!llvm.ptr) -> i64
              %3764 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3763, %3764) : (i64, i64) -> ()
            }
            %3765 = func.call @stack_pop_pointer() : () -> i64
            %3766 = func.call @stack_pop_pointer() : () -> i64
            %3767 = func.call @cc_char_eq(%3766, %3765) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3767) : (i64) -> ()
            %3768 = func.call @stack_pop_pointer() : () -> i64
            %3769 = func.call @cc_cons(%3768, %3732) : (i64, i64) -> i64
            %3770 = func.call @cc_cons(%3753, %3769) : (i64, i64) -> i64
            %3771 = func.call @cc_and(%3770) : (i64) -> i64
            func.call @stack_push_pointer(%3771) : (i64) -> ()
            %3772 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3772 : i64
          }
          func.call @stack_push_pointer(%3731) : (i64) -> ()
          %3773 = func.call @stack_pop_pointer() : () -> i64
          %3774 = func.call @cc_cons(%3773, %3709) : (i64, i64) -> i64
          %3775 = func.call @cc_cons(%3714, %3774) : (i64, i64) -> i64
          %3776 = func.call @cc_or(%3775) : (i64) -> i64
          func.call @stack_push_pointer(%3776) : (i64) -> ()
          %3777 = func.call @stack_pop_pointer() : () -> i64
          %3778 = func.call @cc_nil_value() : () -> i64
          %3779 = func.call @cc_cons(%3777, %3778) : (i64, i64) -> i64
          %3780 = func.call @cc_not(%3779) : (i64) -> i64
          func.call @stack_push_pointer(%3780) : (i64) -> ()
          %3781 = func.call @stack_pop_pointer() : () -> i64
          %3782 = func.call @cc_nil_value() : () -> i64
          %3783 = arith.cmpi ne, %3781, %3782 : i64
          %3784:2 = scf.if %3783 -> (i64, i64) {
            %3785 = func.call @cc_nil_value() : () -> i64
            %3786 = func.call @cc_nil_value() : () -> i64
            %3787 = func.call @cc_errorp(%3785) : (i64) -> i64
            %3788 = arith.cmpi ne, %3787, %3786 : i64
            %3789:2 = scf.if %3788 -> (i64, i64) {
              scf.yield %3785, %3688 : i64, i64
            } else {
              func.call @stack_push_pointer(%3688) : (i64) -> ()
              func.call @stack_push_pointer(%3689) : (i64) -> ()
              %3790 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%3704) : (i64) -> ()
              %3791 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%3704) : (i64) -> ()
              %3792 = func.call @stack_pop_pointer() : () -> i64
              %3793 = func.call @cc_char_name(%3792) : (i64) -> i64
              func.call @stack_push_pointer(%3793) : (i64) -> ()
              %3794 = func.call @stack_pop_pointer() : () -> i64
              %3795 = func.call @cc_nil_value() : () -> i64
              %3796 = func.call @cc_errorp(%3790) : (i64) -> i64
              %3797 = arith.cmpi ne, %3796, %3795 : i64
              %3798 = arith.cmpi eq, %3795, %3795 : i64
              %3799 = arith.andi %3797, %3798 : i1
              %3800 = scf.if %3799 -> (i64) {
                scf.yield %3790 : i64
              } else {
                scf.yield %3795 : i64
              }
              %3801 = func.call @cc_errorp(%3791) : (i64) -> i64
              %3802 = arith.cmpi ne, %3801, %3795 : i64
              %3803 = arith.cmpi eq, %3800, %3795 : i64
              %3804 = arith.andi %3802, %3803 : i1
              %3805 = scf.if %3804 -> (i64) {
                scf.yield %3791 : i64
              } else {
                scf.yield %3800 : i64
              }
              %3806 = func.call @cc_errorp(%3794) : (i64) -> i64
              %3807 = arith.cmpi ne, %3806, %3795 : i64
              %3808 = arith.cmpi eq, %3805, %3795 : i64
              %3809 = arith.andi %3807, %3808 : i1
              %3810 = scf.if %3809 -> (i64) {
                scf.yield %3794 : i64
              } else {
                scf.yield %3805 : i64
              }
              %3811 = arith.cmpi ne, %3810, %3795 : i64
              scf.if %3811 {
                func.call @stack_push_pointer(%3810) : (i64) -> ()
              } else {
                %3812 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%3812) : (i64) -> ()
                func.call @stack_push_pointer(%3794) : (i64) -> ()
                %3813 = func.call @stack_pop_pointer() : () -> i64
                %3814 = func.call @stack_pop_pointer() : () -> i64
                %3815 = func.call @cc_cons(%3813, %3814) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3815) : (i64) -> ()
                func.call @stack_push_pointer(%3791) : (i64) -> ()
                %3816 = func.call @stack_pop_pointer() : () -> i64
                %3817 = func.call @stack_pop_pointer() : () -> i64
                %3818 = func.call @cc_cons(%3816, %3817) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3818) : (i64) -> ()
                func.call @stack_push_pointer(%3790) : (i64) -> ()
                %3819 = func.call @stack_pop_pointer() : () -> i64
                %3820 = func.call @stack_pop_pointer() : () -> i64
                %3821 = func.call @cc_cons(%3819, %3820) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3821) : (i64) -> ()
              }
              %3822 = func.call @stack_pop_pointer() : () -> i64
              %3823 = func.call @cc_nil_value() : () -> i64
              %3824 = func.call @cc_errorp(%3822) : (i64) -> i64
              %3825 = arith.cmpi ne, %3824, %3823 : i64
              %3826 = arith.cmpi eq, %3823, %3823 : i64
              %3827 = arith.andi %3825, %3826 : i1
              %3828 = scf.if %3827 -> (i64) {
                scf.yield %3822 : i64
              } else {
                scf.yield %3823 : i64
              }
              %3829 = arith.cmpi ne, %3828, %3823 : i64
              scf.if %3829 {
                func.call @stack_push_pointer(%3828) : (i64) -> ()
              } else {
                %3830 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%3830) : (i64) -> ()
                func.call @stack_push_pointer(%3822) : (i64) -> ()
                %3831 = func.call @stack_pop_pointer() : () -> i64
                %3832 = func.call @stack_pop_pointer() : () -> i64
                %3833 = func.call @cc_cons(%3831, %3832) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3833) : (i64) -> ()
              }
              %3834 = func.call @stack_pop_pointer() : () -> i64
              %3835 = func.call @stack_pop_pointer() : () -> i64
              %3836 = func.call @cc_append(%3835, %3834) : (i64, i64) -> i64
              func.call @stack_push_pointer(%3836) : (i64) -> ()
              %3837 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%3837) : (i64) -> ()
              %3838 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %3838, %3837 : i64, i64
            }
            func.call @stack_push_pointer(%3789#0) : (i64) -> ()
            %3839 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3839, %3789#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %3840 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3840, %3688 : i64, i64
          }
          func.call @stack_push_pointer(%3784#0) : (i64) -> ()
          %3841 = func.call @stack_depth() : () -> i64
          %3842 = arith.constant 0 : i64
          %3843 = arith.cmpi sgt, %3841, %3842 : i64
          scf.if %3843 {
            %3844 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%3689) : (i64) -> ()
          %3845 = func.call @stack_pop_pointer() : () -> i64
          %3846 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%3846) : (i64) -> ()
          %3847 = func.call @stack_pop_pointer() : () -> i64
          %3849 = arith.constant 3 : i64
          %3848 = arith.andi %3845, %3849 : i64
          %3850 = arith.constant 0 : i64
          %3851 = arith.cmpi eq, %3848, %3850 : i64
          %3853 = arith.constant 3 : i64
          %3852 = arith.andi %3847, %3853 : i64
          %3854 = arith.constant 0 : i64
          %3855 = arith.cmpi eq, %3852, %3854 : i64
          %3856 = arith.andi %3851, %3855 : i1
          %3857 = scf.if %3856 -> (i64) {
            %3858 = arith.constant 2 : i64
            %3859 = arith.shrsi %3845, %3858 : i64
            %3860 = arith.constant 2 : i64
            %3861 = arith.shrsi %3847, %3860 : i64
            %3862 = arith.addi %3859, %3861 : i64
            %3863 = arith.constant -2305843009213693952 : i64
            %3864 = arith.constant 2305843009213693951 : i64
            %3865 = arith.cmpi sge, %3862, %3863 : i64
            %3866 = arith.cmpi sle, %3862, %3864 : i64
            %3867 = arith.andi %3865, %3866 : i1
            %3868 = scf.if %3867 -> (i64) {
              %3869 = arith.constant 2 : i64
              %3870 = arith.shli %3862, %3869 : i64
              scf.yield %3870 : i64
            } else {
              %3871 = func.call @cc_add(%3845, %3847) : (i64, i64) -> i64
              scf.yield %3871 : i64
            }
            scf.yield %3868 : i64
          } else {
            %3872 = func.call @cc_add(%3845, %3847) : (i64, i64) -> i64
            scf.yield %3872 : i64
          }
          func.call @stack_push_pointer(%3857) : (i64) -> ()
          %3873 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3873) : (i64) -> ()
          %3874 = func.call @stack_depth() : () -> i64
          %3875 = arith.constant 0 : i64
          %3876 = arith.cmpi sgt, %3874, %3875 : i64
          scf.if %3876 {
            %3877 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %3691, %3696, %3704, %3784#1, %3873 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %3878 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3629#0) : (i64) -> ()
        %3879 = func.call @stack_pop_pointer() : () -> i64
        %3880 = func.call @cc_nil_value() : () -> i64
        %3881 = arith.cmpi ne, %3879, %3880 : i64
        %3882:2 = scf.if %3881 -> (i64, i64) {
          %3883 = func.call @cc_nil_value() : () -> i64
          %3884 = func.call @cc_nil_value() : () -> i64
          %3885 = func.call @cc_errorp(%3883) : (i64) -> i64
          %3886 = arith.cmpi ne, %3885, %3884 : i64
          %3887:2 = scf.if %3886 -> (i64, i64) {
            scf.yield %3883, %3629#4 : i64, i64
          } else {
            func.call @stack_push_pointer(%3629#1) : (i64) -> ()
            %3888 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3888) : (i64) -> ()
            %3889 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3889, %3888 : i64, i64
          }
          func.call @stack_push_pointer(%3887#0) : (i64) -> ()
          %3890 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3890, %3887#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %3891 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3891, %3629#4 : i64, i64
        }
        func.call @stack_push_pointer(%3882#0) : (i64) -> ()
        %3892 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3629#3) : (i64) -> ()
        %3893 = func.call @stack_pop_pointer() : () -> i64
        %3894 = func.call @cc_multiple_value_list(%3893) : (i64) -> i64
        %3895 = llvm.mlir.addressof @str280 : !llvm.ptr
        %3896 = arith.constant 38 : i64
        %3897 = func.call @cc_make_string(%3895, %3896) : (!llvm.ptr, i64) -> i64
        %3898 = func.call @cc_nil_value() : () -> i64
        %3899 = func.call @cc_intern(%3897, %3898) : (i64, i64) -> i64
        %3900 = func.call @cc_nil_value() : () -> i64
        %3901 = func.call @cc_cons(%3899, %3900) : (i64, i64) -> i64
        %3902 = func.call @cc_values_pack(%3901) : (i64) -> i64
        %3903 = func.call @cc_symbol_value(%3899) : (i64) -> i64
        %3904 = llvm.mlir.addressof @str281 : !llvm.ptr
        %3905 = arith.constant 39 : i64
        %3906 = func.call @cc_make_string(%3904, %3905) : (!llvm.ptr, i64) -> i64
        %3907 = func.call @cc_nil_value() : () -> i64
        %3908 = func.call @cc_intern(%3906, %3907) : (i64, i64) -> i64
        %3909 = func.call @cc_nil_value() : () -> i64
        %3910 = func.call @cc_cons(%3908, %3909) : (i64, i64) -> i64
        %3911 = func.call @cc_values_pack(%3910) : (i64) -> i64
        %3912 = func.call @cc_symbol_value(%3908) : (i64) -> i64
        %3913 = llvm.mlir.addressof @str282 : !llvm.ptr
        %3914 = arith.constant 40 : i64
        %3915 = func.call @cc_make_string(%3913, %3914) : (!llvm.ptr, i64) -> i64
        %3916 = func.call @cc_nil_value() : () -> i64
        %3917 = func.call @cc_intern(%3915, %3916) : (i64, i64) -> i64
        %3918 = func.call @cc_nil_value() : () -> i64
        %3919 = func.call @cc_cons(%3917, %3918) : (i64, i64) -> i64
        %3920 = func.call @cc_values_pack(%3919) : (i64) -> i64
        %3921 = func.call @cc_symbol_value(%3917) : (i64) -> i64
        %3922 = func.call @cc_nil_value() : () -> i64
        %3923 = arith.cmpi ne, %3903, %3922 : i64
        %3924 = scf.if %3923 -> (i64) {
          scf.yield %3921 : i64
        } else {
          scf.yield %3894 : i64
        }
        %3925 = func.call @cc_values_pack(%3924) : (i64) -> i64
        func.call @stack_push_pointer(%3925) : (i64) -> ()
        %3926 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3926, %3629#0, %3629#1, %3629#3, %3882#1, %3629#2 : i64, i64, i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%3600#0) : (i64) -> ()
      %3927 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3927 : i64
    }
    func.call @stack_push_pointer(%3589) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_271595545296905"() {
    %4727 = func.call @cc_nil_value() : () -> i64
    %4728 = func.call @cc_nil_value() : () -> i64
    %4729 = func.call @cc_errorp(%4727) : (i64) -> i64
    %4730 = arith.cmpi ne, %4729, %4728 : i64
    %4731 = scf.if %4730 -> (i64) {
      scf.yield %4727 : i64
    } else {
      %4732 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4732) : (i64) -> ()
      %4733 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4734 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4735 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4736 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4737 = func.call @stack_pop_pointer() : () -> i64
      %4738 = func.call @cc_nil_value() : () -> i64
      %4739 = func.call @cc_nil_value() : () -> i64
      %4740 = func.call @cc_errorp(%4738) : (i64) -> i64
      %4741 = arith.cmpi ne, %4740, %4739 : i64
      %4742:6 = scf.if %4741 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %4738, %4737, %4734, %4736, %4733, %4735 : i64, i64, i64, i64, i64, i64
      } else {
        %4743 = func.call @cc_nil_value() : () -> i64
        %4744 = llvm.mlir.addressof @str350 : !llvm.ptr
        %4745 = arith.constant 38 : i64
        %4746 = func.call @cc_make_string(%4744, %4745) : (!llvm.ptr, i64) -> i64
        %4747 = func.call @cc_nil_value() : () -> i64
        %4748 = func.call @cc_intern(%4746, %4747) : (i64, i64) -> i64
        %4749 = func.call @cc_nil_value() : () -> i64
        %4750 = func.call @cc_cons(%4748, %4749) : (i64, i64) -> i64
        %4751 = func.call @cc_values_pack(%4750) : (i64) -> i64
        %4752 = func.call @cc_set_symbol_value(%4748, %4743) : (i64, i64) -> i64
        %4753 = llvm.mlir.addressof @str351 : !llvm.ptr
        %4754 = arith.constant 39 : i64
        %4755 = func.call @cc_make_string(%4753, %4754) : (!llvm.ptr, i64) -> i64
        %4756 = func.call @cc_nil_value() : () -> i64
        %4757 = func.call @cc_intern(%4755, %4756) : (i64, i64) -> i64
        %4758 = func.call @cc_nil_value() : () -> i64
        %4759 = func.call @cc_cons(%4757, %4758) : (i64, i64) -> i64
        %4760 = func.call @cc_values_pack(%4759) : (i64) -> i64
        %4761 = func.call @cc_set_symbol_value(%4757, %4743) : (i64, i64) -> i64
        %4762 = llvm.mlir.addressof @str352 : !llvm.ptr
        %4763 = arith.constant 40 : i64
        %4764 = func.call @cc_make_string(%4762, %4763) : (!llvm.ptr, i64) -> i64
        %4765 = func.call @cc_nil_value() : () -> i64
        %4766 = func.call @cc_intern(%4764, %4765) : (i64, i64) -> i64
        %4767 = func.call @cc_nil_value() : () -> i64
        %4768 = func.call @cc_cons(%4766, %4767) : (i64, i64) -> i64
        %4769 = func.call @cc_values_pack(%4768) : (i64) -> i64
        %4770 = func.call @cc_set_symbol_value(%4766, %4743) : (i64, i64) -> i64
        %4771:5 = scf.while (%arg0 = %4737, %arg1 = %4734, %arg2 = %4735, %arg3 = %4736, %arg4 = %4733) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          func.call @stack_push_pointer(%arg4) : (i64) -> ()
          %4772 = func.call @stack_pop_pointer() : () -> i64
          %4773 = arith.constant 55296 : i64
          %4774 = func.call @cc_box_fixnum(%4773) : (i64) -> i64
          func.call @stack_push_pointer(%4774) : (i64) -> ()
          %4775 = func.call @stack_pop_pointer() : () -> i64
          %4776 = arith.constant 1 : i1
          %4778 = arith.constant 3 : i64
          %4777 = arith.andi %4772, %4778 : i64
          %4779 = arith.constant 0 : i64
          %4780 = arith.cmpi eq, %4777, %4779 : i64
          %4782 = arith.constant 3 : i64
          %4781 = arith.andi %4775, %4782 : i64
          %4783 = arith.constant 0 : i64
          %4784 = arith.cmpi eq, %4781, %4783 : i64
          %4785 = arith.andi %4780, %4784 : i1
          %4786 = scf.if %4785 -> (i1) {
            %4787 = arith.constant 2 : i64
            %4788 = arith.shrsi %4772, %4787 : i64
            %4789 = arith.constant 2 : i64
            %4790 = arith.shrsi %4775, %4789 : i64
            %4791 = arith.cmpi slt, %4788, %4790 : i64
            scf.yield %4791 : i1
          } else {
            %4792 = func.call @cc_lt(%4772, %4775) : (i64, i64) -> i64
            %4793 = func.call @cc_nil_value() : () -> i64
            %4794 = arith.cmpi ne, %4792, %4793 : i64
            scf.yield %4794 : i1
          }
          %4795 = arith.andi %4776, %4786 : i1
          %4796 = func.call @cc_nil_value() : () -> i64
          %4797 = func.call @cc_t_value() : () -> i64
          %4798 = scf.if %4795 -> (i64) {
            scf.yield %4797 : i64
          } else {
            scf.yield %4796 : i64
          }
          func.call @stack_push_pointer(%4798) : (i64) -> ()
          %4799 = func.call @stack_pop_pointer() : () -> i64
          %4800 = func.call @cc_nil_value() : () -> i64
          %4801 = arith.cmpi ne, %4799, %4800 : i64
          %4802 = func.call @cc_nil_value() : () -> i64
          %4803 = llvm.mlir.addressof @str353 : !llvm.ptr
          %4804 = arith.constant 38 : i64
          %4805 = func.call @cc_make_string(%4803, %4804) : (!llvm.ptr, i64) -> i64
          %4806 = func.call @cc_nil_value() : () -> i64
          %4807 = func.call @cc_intern(%4805, %4806) : (i64, i64) -> i64
          %4808 = func.call @cc_nil_value() : () -> i64
          %4809 = func.call @cc_cons(%4807, %4808) : (i64, i64) -> i64
          %4810 = func.call @cc_values_pack(%4809) : (i64) -> i64
          %4811 = func.call @cc_symbol_value(%4807) : (i64) -> i64
          %4812 = arith.cmpi ne, %4811, %4802 : i64
          %4813 = llvm.mlir.addressof @str354 : !llvm.ptr
          %4814 = arith.constant 38 : i64
          %4815 = func.call @cc_make_string(%4813, %4814) : (!llvm.ptr, i64) -> i64
          %4816 = func.call @cc_nil_value() : () -> i64
          %4817 = func.call @cc_intern(%4815, %4816) : (i64, i64) -> i64
          %4818 = func.call @cc_nil_value() : () -> i64
          %4819 = func.call @cc_cons(%4817, %4818) : (i64, i64) -> i64
          %4820 = func.call @cc_values_pack(%4819) : (i64) -> i64
          %4821 = func.call @cc_symbol_value(%4817) : (i64) -> i64
          %4822 = arith.cmpi ne, %4821, %4802 : i64
          %4823 = arith.ori %4812, %4822 : i1
          %4824 = arith.constant 0 : i1
          %4825 = arith.cmpi eq, %4823, %4824 : i1
          %4826 = arith.andi %4801, %4825 : i1
          scf.condition(%4826) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%4827: i64, %4828: i64, %4829: i64, %4830: i64, %4831: i64):
          %4832 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%4832) : (i64) -> ()
          %4833 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4833) : (i64) -> ()
          %4834 = func.call @stack_depth() : () -> i64
          %4835 = arith.constant 0 : i64
          %4836 = arith.cmpi sgt, %4834, %4835 : i64
          scf.if %4836 {
            %4837 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%4831) : (i64) -> ()
          %4838 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4838) : (i64) -> ()
          %4839 = func.call @stack_depth() : () -> i64
          %4840 = arith.constant 0 : i64
          %4841 = arith.cmpi sgt, %4839, %4840 : i64
          scf.if %4841 {
            %4842 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%4831) : (i64) -> ()
          %4843 = func.call @stack_pop_pointer() : () -> i64
          %4844 = func.call @cc_unbox_fixnum(%4843) : (i64) -> i64
          %4845 = func.call @cc_box_character(%4844) : (i64) -> i64
          func.call @stack_push_pointer(%4845) : (i64) -> ()
          %4846 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4846) : (i64) -> ()
          %4847 = func.call @stack_depth() : () -> i64
          %4848 = arith.constant 0 : i64
          %4849 = arith.cmpi sgt, %4847, %4848 : i64
          scf.if %4849 {
            %4850 = func.call @stack_pop_pointer() : () -> i64
          }
          %4851 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%4846) : (i64) -> ()
          %4852 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4846) : (i64) -> ()
          %4853 = func.call @stack_pop_pointer() : () -> i64
          %4854 = func.call @cc_nil_value() : () -> i64
          %4855 = func.call @cc_errorp(%4853) : (i64) -> i64
          %4856 = arith.cmpi ne, %4855, %4854 : i64
          %4857 = arith.cmpi eq, %4854, %4854 : i64
          %4858 = arith.andi %4856, %4857 : i1
          %4859 = scf.if %4858 -> (i64) {
            scf.yield %4853 : i64
          } else {
            scf.yield %4854 : i64
          }
          %4860 = arith.cmpi ne, %4859, %4854 : i64
          scf.if %4860 {
            func.call @stack_push_pointer(%4859) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4853) : (i64) -> ()
            %4861 = llvm.mlir.addressof @str355 : !llvm.ptr
            %4862 = func.call @cc_make_function_ref_const(%4861) : (!llvm.ptr) -> i64
            %4863 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4862, %4863) : (i64, i64) -> ()
          }
          %4864 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4846) : (i64) -> ()
          func.call @stack_push_pointer(%4846) : (i64) -> ()
          %4865 = func.call @stack_pop_pointer() : () -> i64
          %4866 = func.call @cc_nil_value() : () -> i64
          %4867 = func.call @cc_errorp(%4865) : (i64) -> i64
          %4868 = arith.cmpi ne, %4867, %4866 : i64
          %4869 = arith.cmpi eq, %4866, %4866 : i64
          %4870 = arith.andi %4868, %4869 : i1
          %4871 = scf.if %4870 -> (i64) {
            scf.yield %4865 : i64
          } else {
            scf.yield %4866 : i64
          }
          %4872 = arith.cmpi ne, %4871, %4866 : i64
          scf.if %4872 {
            func.call @stack_push_pointer(%4871) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4865) : (i64) -> ()
            %4873 = llvm.mlir.addressof @str356 : !llvm.ptr
            %4874 = func.call @cc_make_function_ref_const(%4873) : (!llvm.ptr) -> i64
            %4875 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4874, %4875) : (i64, i64) -> ()
          }
          %4876 = func.call @stack_pop_pointer() : () -> i64
          %4877 = func.call @stack_pop_pointer() : () -> i64
          %4878 = func.call @cc_char_eq(%4877, %4876) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4878) : (i64) -> ()
          %4879 = func.call @stack_pop_pointer() : () -> i64
          %4880 = func.call @cc_cons(%4879, %4851) : (i64, i64) -> i64
          %4881 = func.call @cc_cons(%4864, %4880) : (i64, i64) -> i64
          %4882 = func.call @cc_cons(%4852, %4881) : (i64, i64) -> i64
          %4883 = func.call @cc_and(%4882) : (i64) -> i64
          func.call @stack_push_pointer(%4883) : (i64) -> ()
          %4884 = func.call @stack_pop_pointer() : () -> i64
          %4885 = func.call @cc_nil_value() : () -> i64
          %4886 = arith.cmpi ne, %4884, %4885 : i64
          %4887:2 = scf.if %4886 -> (i64, i64) {
            %4888 = func.call @cc_nil_value() : () -> i64
            %4889 = func.call @cc_nil_value() : () -> i64
            %4890 = func.call @cc_errorp(%4888) : (i64) -> i64
            %4891 = arith.cmpi ne, %4890, %4889 : i64
            %4892:2 = scf.if %4891 -> (i64, i64) {
              scf.yield %4888, %4830 : i64, i64
            } else {
              func.call @stack_push_pointer(%4830) : (i64) -> ()
              func.call @stack_push_pointer(%4831) : (i64) -> ()
              %4893 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%4846) : (i64) -> ()
              %4894 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%4846) : (i64) -> ()
              %4895 = func.call @stack_pop_pointer() : () -> i64
              %4896 = func.call @cc_char_name(%4895) : (i64) -> i64
              func.call @stack_push_pointer(%4896) : (i64) -> ()
              %4897 = func.call @stack_pop_pointer() : () -> i64
              %4898 = func.call @cc_nil_value() : () -> i64
              %4899 = func.call @cc_errorp(%4893) : (i64) -> i64
              %4900 = arith.cmpi ne, %4899, %4898 : i64
              %4901 = arith.cmpi eq, %4898, %4898 : i64
              %4902 = arith.andi %4900, %4901 : i1
              %4903 = scf.if %4902 -> (i64) {
                scf.yield %4893 : i64
              } else {
                scf.yield %4898 : i64
              }
              %4904 = func.call @cc_errorp(%4894) : (i64) -> i64
              %4905 = arith.cmpi ne, %4904, %4898 : i64
              %4906 = arith.cmpi eq, %4903, %4898 : i64
              %4907 = arith.andi %4905, %4906 : i1
              %4908 = scf.if %4907 -> (i64) {
                scf.yield %4894 : i64
              } else {
                scf.yield %4903 : i64
              }
              %4909 = func.call @cc_errorp(%4897) : (i64) -> i64
              %4910 = arith.cmpi ne, %4909, %4898 : i64
              %4911 = arith.cmpi eq, %4908, %4898 : i64
              %4912 = arith.andi %4910, %4911 : i1
              %4913 = scf.if %4912 -> (i64) {
                scf.yield %4897 : i64
              } else {
                scf.yield %4908 : i64
              }
              %4914 = arith.cmpi ne, %4913, %4898 : i64
              scf.if %4914 {
                func.call @stack_push_pointer(%4913) : (i64) -> ()
              } else {
                %4915 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%4915) : (i64) -> ()
                func.call @stack_push_pointer(%4897) : (i64) -> ()
                %4916 = func.call @stack_pop_pointer() : () -> i64
                %4917 = func.call @stack_pop_pointer() : () -> i64
                %4918 = func.call @cc_cons(%4916, %4917) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4918) : (i64) -> ()
                func.call @stack_push_pointer(%4894) : (i64) -> ()
                %4919 = func.call @stack_pop_pointer() : () -> i64
                %4920 = func.call @stack_pop_pointer() : () -> i64
                %4921 = func.call @cc_cons(%4919, %4920) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4921) : (i64) -> ()
                func.call @stack_push_pointer(%4893) : (i64) -> ()
                %4922 = func.call @stack_pop_pointer() : () -> i64
                %4923 = func.call @stack_pop_pointer() : () -> i64
                %4924 = func.call @cc_cons(%4922, %4923) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4924) : (i64) -> ()
              }
              %4925 = func.call @stack_pop_pointer() : () -> i64
              %4926 = func.call @cc_nil_value() : () -> i64
              %4927 = func.call @cc_errorp(%4925) : (i64) -> i64
              %4928 = arith.cmpi ne, %4927, %4926 : i64
              %4929 = arith.cmpi eq, %4926, %4926 : i64
              %4930 = arith.andi %4928, %4929 : i1
              %4931 = scf.if %4930 -> (i64) {
                scf.yield %4925 : i64
              } else {
                scf.yield %4926 : i64
              }
              %4932 = arith.cmpi ne, %4931, %4926 : i64
              scf.if %4932 {
                func.call @stack_push_pointer(%4931) : (i64) -> ()
              } else {
                %4933 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%4933) : (i64) -> ()
                func.call @stack_push_pointer(%4925) : (i64) -> ()
                %4934 = func.call @stack_pop_pointer() : () -> i64
                %4935 = func.call @stack_pop_pointer() : () -> i64
                %4936 = func.call @cc_cons(%4934, %4935) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4936) : (i64) -> ()
              }
              %4937 = func.call @stack_pop_pointer() : () -> i64
              %4938 = func.call @stack_pop_pointer() : () -> i64
              %4939 = func.call @cc_append(%4938, %4937) : (i64, i64) -> i64
              func.call @stack_push_pointer(%4939) : (i64) -> ()
              %4940 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%4940) : (i64) -> ()
              %4941 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %4941, %4940 : i64, i64
            }
            func.call @stack_push_pointer(%4892#0) : (i64) -> ()
            %4942 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4942, %4892#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %4943 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4943, %4830 : i64, i64
          }
          func.call @stack_push_pointer(%4887#0) : (i64) -> ()
          %4944 = func.call @stack_depth() : () -> i64
          %4945 = arith.constant 0 : i64
          %4946 = arith.cmpi sgt, %4944, %4945 : i64
          scf.if %4946 {
            %4947 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%4831) : (i64) -> ()
          %4948 = func.call @stack_pop_pointer() : () -> i64
          %4949 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%4949) : (i64) -> ()
          %4950 = func.call @stack_pop_pointer() : () -> i64
          %4952 = arith.constant 3 : i64
          %4951 = arith.andi %4948, %4952 : i64
          %4953 = arith.constant 0 : i64
          %4954 = arith.cmpi eq, %4951, %4953 : i64
          %4956 = arith.constant 3 : i64
          %4955 = arith.andi %4950, %4956 : i64
          %4957 = arith.constant 0 : i64
          %4958 = arith.cmpi eq, %4955, %4957 : i64
          %4959 = arith.andi %4954, %4958 : i1
          %4960 = scf.if %4959 -> (i64) {
            %4961 = arith.constant 2 : i64
            %4962 = arith.shrsi %4948, %4961 : i64
            %4963 = arith.constant 2 : i64
            %4964 = arith.shrsi %4950, %4963 : i64
            %4965 = arith.addi %4962, %4964 : i64
            %4966 = arith.constant -2305843009213693952 : i64
            %4967 = arith.constant 2305843009213693951 : i64
            %4968 = arith.cmpi sge, %4965, %4966 : i64
            %4969 = arith.cmpi sle, %4965, %4967 : i64
            %4970 = arith.andi %4968, %4969 : i1
            %4971 = scf.if %4970 -> (i64) {
              %4972 = arith.constant 2 : i64
              %4973 = arith.shli %4965, %4972 : i64
              scf.yield %4973 : i64
            } else {
              %4974 = func.call @cc_add(%4948, %4950) : (i64, i64) -> i64
              scf.yield %4974 : i64
            }
            scf.yield %4971 : i64
          } else {
            %4975 = func.call @cc_add(%4948, %4950) : (i64, i64) -> i64
            scf.yield %4975 : i64
          }
          func.call @stack_push_pointer(%4960) : (i64) -> ()
          %4976 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4976) : (i64) -> ()
          %4977 = func.call @stack_depth() : () -> i64
          %4978 = arith.constant 0 : i64
          %4979 = arith.cmpi sgt, %4977, %4978 : i64
          scf.if %4979 {
            %4980 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %4833, %4838, %4846, %4887#1, %4976 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %4981 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4771#0) : (i64) -> ()
        %4982 = func.call @stack_pop_pointer() : () -> i64
        %4983 = func.call @cc_nil_value() : () -> i64
        %4984 = arith.cmpi ne, %4982, %4983 : i64
        %4985:2 = scf.if %4984 -> (i64, i64) {
          %4986 = func.call @cc_nil_value() : () -> i64
          %4987 = func.call @cc_nil_value() : () -> i64
          %4988 = func.call @cc_errorp(%4986) : (i64) -> i64
          %4989 = arith.cmpi ne, %4988, %4987 : i64
          %4990:2 = scf.if %4989 -> (i64, i64) {
            scf.yield %4986, %4771#4 : i64, i64
          } else {
            func.call @stack_push_pointer(%4771#1) : (i64) -> ()
            %4991 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4991) : (i64) -> ()
            %4992 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4992, %4991 : i64, i64
          }
          func.call @stack_push_pointer(%4990#0) : (i64) -> ()
          %4993 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4993, %4990#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %4994 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4994, %4771#4 : i64, i64
        }
        func.call @stack_push_pointer(%4985#0) : (i64) -> ()
        %4995 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4771#3) : (i64) -> ()
        %4996 = func.call @stack_pop_pointer() : () -> i64
        %4997 = func.call @cc_multiple_value_list(%4996) : (i64) -> i64
        %4998 = llvm.mlir.addressof @str357 : !llvm.ptr
        %4999 = arith.constant 38 : i64
        %5000 = func.call @cc_make_string(%4998, %4999) : (!llvm.ptr, i64) -> i64
        %5001 = func.call @cc_nil_value() : () -> i64
        %5002 = func.call @cc_intern(%5000, %5001) : (i64, i64) -> i64
        %5003 = func.call @cc_nil_value() : () -> i64
        %5004 = func.call @cc_cons(%5002, %5003) : (i64, i64) -> i64
        %5005 = func.call @cc_values_pack(%5004) : (i64) -> i64
        %5006 = func.call @cc_symbol_value(%5002) : (i64) -> i64
        %5007 = llvm.mlir.addressof @str358 : !llvm.ptr
        %5008 = arith.constant 39 : i64
        %5009 = func.call @cc_make_string(%5007, %5008) : (!llvm.ptr, i64) -> i64
        %5010 = func.call @cc_nil_value() : () -> i64
        %5011 = func.call @cc_intern(%5009, %5010) : (i64, i64) -> i64
        %5012 = func.call @cc_nil_value() : () -> i64
        %5013 = func.call @cc_cons(%5011, %5012) : (i64, i64) -> i64
        %5014 = func.call @cc_values_pack(%5013) : (i64) -> i64
        %5015 = func.call @cc_symbol_value(%5011) : (i64) -> i64
        %5016 = llvm.mlir.addressof @str359 : !llvm.ptr
        %5017 = arith.constant 40 : i64
        %5018 = func.call @cc_make_string(%5016, %5017) : (!llvm.ptr, i64) -> i64
        %5019 = func.call @cc_nil_value() : () -> i64
        %5020 = func.call @cc_intern(%5018, %5019) : (i64, i64) -> i64
        %5021 = func.call @cc_nil_value() : () -> i64
        %5022 = func.call @cc_cons(%5020, %5021) : (i64, i64) -> i64
        %5023 = func.call @cc_values_pack(%5022) : (i64) -> i64
        %5024 = func.call @cc_symbol_value(%5020) : (i64) -> i64
        %5025 = func.call @cc_nil_value() : () -> i64
        %5026 = arith.cmpi ne, %5006, %5025 : i64
        %5027 = scf.if %5026 -> (i64) {
          scf.yield %5024 : i64
        } else {
          scf.yield %4997 : i64
        }
        %5028 = func.call @cc_values_pack(%5027) : (i64) -> i64
        func.call @stack_push_pointer(%5028) : (i64) -> ()
        %5029 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5029, %4771#0, %4771#1, %4771#3, %4985#1, %4771#2 : i64, i64, i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%4742#0) : (i64) -> ()
      %5030 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5030 : i64
    }
    func.call @stack_push_pointer(%4731) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_271595545296896*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_271595545296896*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("UNICODE-DOWNCASE-1\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str6("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str9("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str15("UNICODE-UPCASE-1\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str16("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str19("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str25("CHAR-UPCASE.2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str26("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str27("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str28("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str29("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str30("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str31("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str32("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str33("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str35("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str36("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str37("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str41("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str43("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str44("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str46("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str47("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str48("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str49("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str50("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str51("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str56("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str57("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str58("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str61("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str68("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str71("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str72("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str75("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str78("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str81("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str82("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str83("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str87("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str90("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str91("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str92("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str93("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str94("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str95("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str96("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str97("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str98("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str99("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str100("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str101("*__MLIR_BLOCK_RETFLAG_271595545296900*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str102("*__MLIR_BLOCK_RETVALUE_271595545296900*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str103("*__MLIR_BLOCK_RETMVLIST_271595545296900*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str104("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str105("*__MLIR_BLOCK_RETFLAG_271595545296900*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str106("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str108("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("*__MLIR_BLOCK_RETFLAG_271595545296900*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str110("*__MLIR_BLOCK_RETVALUE_271595545296900*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str111("*__MLIR_BLOCK_RETMVLIST_271595545296900*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str112("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str118("CHAR-UPCASE.2A\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str119("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str120("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str121("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str122("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str123("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str124("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str125("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str126("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str127("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str129("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str130("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str133("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str134("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str135("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str136("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str137("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str138("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str139("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str142("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str143("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str146("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str149("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str150("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str151("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str152("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str155("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str156("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str157("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str158("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str159("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str160("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str161("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str162("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str164("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str165("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str168("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str170("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str171("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str172("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str173("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str174("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str175("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str176("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str177("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str178("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETFLAG_271595545296902*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str180("*__MLIR_BLOCK_RETVALUE_271595545296902*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str181("*__MLIR_BLOCK_RETMVLIST_271595545296902*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str182("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str183("*__MLIR_BLOCK_RETFLAG_271595545296902*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str184("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str185("CHAR-UPCASE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("*__MLIR_BLOCK_RETFLAG_271595545296902*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str187("*__MLIR_BLOCK_RETVALUE_271595545296902*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str188("*__MLIR_BLOCK_RETMVLIST_271595545296902*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str189("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str193("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str194("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str195("CHAR-DOWNCASE.2\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str196("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str198("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str199("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str200("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str201("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str202("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str203("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str204("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str205("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str207("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str211("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str212("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str213("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str214("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str216("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str219("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str220("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str221("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str222("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str223("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str224("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str225("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str226("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str227("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str228("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str229("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str230("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str231("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str234("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str235("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str238("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str241("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str242("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str245("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("U\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str248("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str250("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str251("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str252("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str253("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str254("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str257("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str258("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str259("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str260("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str261("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str262("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str263("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str264("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str265("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str266("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str267("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str268("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str269("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str270("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str271("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str272("*__MLIR_BLOCK_RETFLAG_271595545296904*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str273("*__MLIR_BLOCK_RETVALUE_271595545296904*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str274("*__MLIR_BLOCK_RETMVLIST_271595545296904*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str275("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str276("*__MLIR_BLOCK_RETFLAG_271595545296904*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str277("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str278("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str279("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str280("*__MLIR_BLOCK_RETFLAG_271595545296904*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str281("*__MLIR_BLOCK_RETVALUE_271595545296904*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str282("*__MLIR_BLOCK_RETMVLIST_271595545296904*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str283("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str285("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str288("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str289("CHAR-DOWNCASE.2A\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str290("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str291("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str292("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str293("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str294("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str295("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str296("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str297("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str298("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str299("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str300("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str301("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str304("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str305("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str306("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str307("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str308("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str309("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str310("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str311("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str312("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str313("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str314("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str315("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str317("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str318("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str320("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str323("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str326("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str327("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str328("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str329("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str330("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str331("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str332("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str333("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str335("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str336("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str337("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str338("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str339("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str340("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str341("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str342("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str343("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str344("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str345("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str346("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str347("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str348("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str349("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str350("*__MLIR_BLOCK_RETFLAG_271595545296906*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str351("*__MLIR_BLOCK_RETVALUE_271595545296906*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str352("*__MLIR_BLOCK_RETMVLIST_271595545296906*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str353("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str354("*__MLIR_BLOCK_RETFLAG_271595545296906*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str355("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str356("CHAR-DOWNCASE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str357("*__MLIR_BLOCK_RETFLAG_271595545296906*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str358("*__MLIR_BLOCK_RETVALUE_271595545296906*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str359("*__MLIR_BLOCK_RETMVLIST_271595545296906*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str360("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str362("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str363("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str364("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str365("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str366("*__MLIR_BLOCK_RETFLAG_271595545296896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str367("*__MLIR_BLOCK_RETMVLIST_271595545296896*\00") : !llvm.array<41 x i8>
}
