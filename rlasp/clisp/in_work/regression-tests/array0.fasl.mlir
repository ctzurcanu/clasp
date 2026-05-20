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
    %11 = arith.constant 37 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = func.call @cc_intern(%12, %13) : (i64, i64) -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = func.call @cc_cons(%14, %15) : (i64, i64) -> i64
    %17 = func.call @cc_values_pack(%16) : (i64) -> i64
    %18 = func.call @cc_set_symbol_value(%14, %9) : (i64, i64) -> i64
    %19 = llvm.mlir.addressof @str2 : !llvm.ptr
    %20 = arith.constant 38 : i64
    %21 = func.call @cc_make_string(%19, %20) : (!llvm.ptr, i64) -> i64
    %22 = func.call @cc_nil_value() : () -> i64
    %23 = func.call @cc_intern(%21, %22) : (i64, i64) -> i64
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_cons(%23, %24) : (i64, i64) -> i64
    %26 = func.call @cc_values_pack(%25) : (i64) -> i64
    %27 = func.call @cc_set_symbol_value(%23, %9) : (i64, i64) -> i64
    %28 = llvm.mlir.addressof @str3 : !llvm.ptr
    %29 = arith.constant 39 : i64
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
      %58 = arith.constant 16 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 15 : i64
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
      %77 = arith.constant 10 : i64
      %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
      %79 = llvm.mlir.addressof @str9 : !llvm.ptr
      %80 = arith.constant 11 : i64
      %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
      %82 = func.call @cc_intern(%78, %81) : (i64, i64) -> i64
      %83 = func.call @cc_nil_value() : () -> i64
      %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
      %85 = func.call @cc_values_pack(%84) : (i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      %86 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %87 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%87) : (i64) -> ()
      %88 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%88) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %89 = func.call @stack_pop_pointer() : () -> i64
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @cc_cons(%90, %89) : (i64, i64) -> i64
      func.call @stack_push_pointer(%91) : (i64) -> ()
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @stack_pop_pointer() : () -> i64
      %94 = func.call @cc_cons(%93, %92) : (i64, i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %95 = func.call @stack_pop_pointer() : () -> i64
      %96 = func.call @stack_pop_pointer() : () -> i64
      %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
      %98 = llvm.mlir.addressof @str10 : !llvm.ptr
      %99 = arith.constant 5 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = func.call @cc_nil_value() : () -> i64
      %102 = func.call @cc_intern(%100, %101) : (i64, i64) -> i64
      %103 = func.call @cc_nil_value() : () -> i64
      %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
      %105 = func.call @cc_values_pack(%104) : (i64) -> i64
      %106 = func.call @cc_cons(%102, %97) : (i64, i64) -> i64
      func.call @stack_push_pointer(%106) : (i64) -> ()
      %107 = llvm.mlir.addressof @str11 : !llvm.ptr
      %108 = arith.constant 12 : i64
      %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
      %110 = llvm.mlir.addressof @str12 : !llvm.ptr
      %111 = arith.constant 7 : i64
      %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
      %113 = func.call @cc_intern(%109, %112) : (i64, i64) -> i64
      %114 = func.call @cc_nil_value() : () -> i64
      %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
      %116 = func.call @cc_values_pack(%115) : (i64) -> i64
      func.call @stack_push_pointer(%113) : (i64) -> ()
      %117 = func.call @cc_t_value() : () -> i64
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
      %128 = func.call @stack_pop_pointer() : () -> i64
      %129 = func.call @cc_cons(%128, %127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      %130 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%130) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %140 = func.call @stack_pop_pointer() : () -> i64
      %207 = arith.constant 15079495958529 : i64
      %208 = arith.constant 0 : i64
      %209 = func.call @cc_make_closure(%207, %208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %210 = func.call @stack_pop_pointer() : () -> i64
      %211 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%211) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%214) : (i64) -> ()
      %215 = func.call @stack_pop_pointer() : () -> i64
      %216 = llvm.mlir.addressof @str17 : !llvm.ptr
      %217 = arith.constant 11 : i64
      %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
      %219 = llvm.mlir.addressof @str18 : !llvm.ptr
      %220 = arith.constant 7 : i64
      %221 = func.call @cc_make_string(%219, %220) : (!llvm.ptr, i64) -> i64
      %222 = func.call @cc_intern(%218, %221) : (i64, i64) -> i64
      %223 = func.call @cc_nil_value() : () -> i64
      %224 = func.call @cc_cons(%222, %223) : (i64, i64) -> i64
      %225 = func.call @cc_values_pack(%224) : (i64) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      %226 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %227 = func.call @stack_pop_pointer() : () -> i64
      %228 = llvm.mlir.addressof @str19 : !llvm.ptr
      %229 = arith.constant 4 : i64
      %230 = func.call @cc_make_string(%228, %229) : (!llvm.ptr, i64) -> i64
      %231 = llvm.mlir.addressof @str20 : !llvm.ptr
      %232 = arith.constant 7 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_intern(%230, %233) : (i64, i64) -> i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
      %237 = func.call @cc_values_pack(%236) : (i64) -> i64
      func.call @stack_push_pointer(%234) : (i64) -> ()
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = llvm.mlir.addressof @str21 : !llvm.ptr
      %240 = arith.constant 6 : i64
      %241 = func.call @cc_make_string(%239, %240) : (!llvm.ptr, i64) -> i64
      %242 = func.call @cc_nil_value() : () -> i64
      %243 = func.call @cc_intern(%241, %242) : (i64, i64) -> i64
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_cons(%243, %244) : (i64, i64) -> i64
      %246 = func.call @cc_values_pack(%245) : (i64) -> i64
      func.call @stack_push_pointer(%243) : (i64) -> ()
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @cc_nil_value() : () -> i64
      %249 = func.call @cc_errorp(%65) : (i64) -> i64
      %250 = arith.cmpi ne, %249, %248 : i64
      %251 = arith.cmpi eq, %248, %248 : i64
      %252 = arith.andi %250, %251 : i1
      %253 = scf.if %252 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %248 : i64
      }
      %254 = func.call @cc_errorp(%140) : (i64) -> i64
      %255 = arith.cmpi ne, %254, %248 : i64
      %256 = arith.cmpi eq, %253, %248 : i64
      %257 = arith.andi %255, %256 : i1
      %258 = scf.if %257 -> (i64) {
        scf.yield %140 : i64
      } else {
        scf.yield %253 : i64
      }
      %259 = func.call @cc_errorp(%210) : (i64) -> i64
      %260 = arith.cmpi ne, %259, %248 : i64
      %261 = arith.cmpi eq, %258, %248 : i64
      %262 = arith.andi %260, %261 : i1
      %263 = scf.if %262 -> (i64) {
        scf.yield %210 : i64
      } else {
        scf.yield %258 : i64
      }
      %264 = func.call @cc_errorp(%215) : (i64) -> i64
      %265 = arith.cmpi ne, %264, %248 : i64
      %266 = arith.cmpi eq, %263, %248 : i64
      %267 = arith.andi %265, %266 : i1
      %268 = scf.if %267 -> (i64) {
        scf.yield %215 : i64
      } else {
        scf.yield %263 : i64
      }
      %269 = func.call @cc_errorp(%226) : (i64) -> i64
      %270 = arith.cmpi ne, %269, %248 : i64
      %271 = arith.cmpi eq, %268, %248 : i64
      %272 = arith.andi %270, %271 : i1
      %273 = scf.if %272 -> (i64) {
        scf.yield %226 : i64
      } else {
        scf.yield %268 : i64
      }
      %274 = func.call @cc_errorp(%227) : (i64) -> i64
      %275 = arith.cmpi ne, %274, %248 : i64
      %276 = arith.cmpi eq, %273, %248 : i64
      %277 = arith.andi %275, %276 : i1
      %278 = scf.if %277 -> (i64) {
        scf.yield %227 : i64
      } else {
        scf.yield %273 : i64
      }
      %279 = func.call @cc_errorp(%238) : (i64) -> i64
      %280 = arith.cmpi ne, %279, %248 : i64
      %281 = arith.cmpi eq, %278, %248 : i64
      %282 = arith.andi %280, %281 : i1
      %283 = scf.if %282 -> (i64) {
        scf.yield %238 : i64
      } else {
        scf.yield %278 : i64
      }
      %284 = func.call @cc_errorp(%247) : (i64) -> i64
      %285 = arith.cmpi ne, %284, %248 : i64
      %286 = arith.cmpi eq, %283, %248 : i64
      %287 = arith.andi %285, %286 : i1
      %288 = scf.if %287 -> (i64) {
        scf.yield %247 : i64
      } else {
        scf.yield %283 : i64
      }
      %289 = arith.cmpi ne, %288, %248 : i64
      scf.if %289 {
        func.call @stack_push_pointer(%288) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%140) : (i64) -> ()
        func.call @stack_push_pointer(%210) : (i64) -> ()
        func.call @stack_push_pointer(%215) : (i64) -> ()
        func.call @stack_push_pointer(%226) : (i64) -> ()
        func.call @stack_push_pointer(%227) : (i64) -> ()
        func.call @stack_push_pointer(%238) : (i64) -> ()
        func.call @stack_push_pointer(%247) : (i64) -> ()
        %290 = llvm.mlir.addressof @str22 : !llvm.ptr
        %291 = func.call @cc_make_function_ref_const(%290) : (!llvm.ptr) -> i64
        %292 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%291, %292) : (i64, i64) -> ()
      }
      %293 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %293 : i64
    }
    %294 = func.call @cc_nil_value() : () -> i64
    %295 = func.call @cc_errorp(%56) : (i64) -> i64
    %296 = arith.cmpi ne, %295, %294 : i64
    %297 = scf.if %296 -> (i64) {
      scf.yield %56 : i64
    } else {
      %298 = llvm.mlir.addressof @str23 : !llvm.ptr
      %299 = arith.constant 27 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = func.call @cc_nil_value() : () -> i64
      %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
      %303 = func.call @cc_nil_value() : () -> i64
      %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
      %305 = func.call @cc_values_pack(%304) : (i64) -> i64
      func.call @stack_push_pointer(%302) : (i64) -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = llvm.mlir.addressof @str24 : !llvm.ptr
      %308 = arith.constant 3 : i64
      %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_intern(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_values_pack(%313) : (i64) -> i64
      func.call @stack_push_pointer(%311) : (i64) -> ()
      %315 = llvm.mlir.addressof @str25 : !llvm.ptr
      %316 = arith.constant 3 : i64
      %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
      %318 = func.call @cc_nil_value() : () -> i64
      %319 = func.call @cc_intern(%317, %318) : (i64, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_values_pack(%321) : (i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %323 = llvm.mlir.addressof @str26 : !llvm.ptr
      %324 = arith.constant 8 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = llvm.mlir.addressof @str27 : !llvm.ptr
      %327 = arith.constant 11 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_intern(%325, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      func.call @stack_push_pointer(%329) : (i64) -> ()
      %333 = llvm.mlir.addressof @str28 : !llvm.ptr
      %334 = arith.constant 7 : i64
      %335 = func.call @cc_make_string(%333, %334) : (!llvm.ptr, i64) -> i64
      %336 = llvm.mlir.addressof @str29 : !llvm.ptr
      %337 = arith.constant 11 : i64
      %338 = func.call @cc_make_string(%336, %337) : (!llvm.ptr, i64) -> i64
      %339 = func.call @cc_intern(%335, %338) : (i64, i64) -> i64
      %340 = func.call @cc_nil_value() : () -> i64
      %341 = func.call @cc_cons(%339, %340) : (i64, i64) -> i64
      %342 = func.call @cc_values_pack(%341) : (i64) -> i64
      func.call @stack_push_pointer(%339) : (i64) -> ()
      %343 = llvm.mlir.addressof @str30 : !llvm.ptr
      %344 = arith.constant 13 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = llvm.mlir.addressof @str31 : !llvm.ptr
      %347 = arith.constant 11 : i64
      %348 = func.call @cc_make_string(%346, %347) : (!llvm.ptr, i64) -> i64
      %349 = func.call @cc_intern(%345, %348) : (i64, i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_values_pack(%351) : (i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %353 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %354 = llvm.mlir.addressof @str32 : !llvm.ptr
      %355 = arith.constant 13 : i64
      %356 = func.call @cc_make_string(%354, %355) : (!llvm.ptr, i64) -> i64
      %357 = llvm.mlir.addressof @str33 : !llvm.ptr
      %358 = arith.constant 11 : i64
      %359 = func.call @cc_make_string(%357, %358) : (!llvm.ptr, i64) -> i64
      %360 = func.call @cc_intern(%356, %359) : (i64, i64) -> i64
      %361 = func.call @cc_nil_value() : () -> i64
      %362 = func.call @cc_cons(%360, %361) : (i64, i64) -> i64
      %363 = func.call @cc_values_pack(%362) : (i64) -> i64
      func.call @stack_push_pointer(%360) : (i64) -> ()
      %364 = func.call @stack_pop_pointer() : () -> i64
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
      %367 = llvm.mlir.addressof @str34 : !llvm.ptr
      %368 = arith.constant 5 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = func.call @cc_nil_value() : () -> i64
      %371 = func.call @cc_intern(%369, %370) : (i64, i64) -> i64
      %372 = func.call @cc_nil_value() : () -> i64
      %373 = func.call @cc_cons(%371, %372) : (i64, i64) -> i64
      %374 = func.call @cc_values_pack(%373) : (i64) -> i64
      %375 = func.call @cc_cons(%371, %366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%375) : (i64) -> ()
      %376 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%376) : (i64) -> ()
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
      %384 = func.call @stack_pop_pointer() : () -> i64
      %385 = func.call @cc_cons(%384, %383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%385) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = func.call @stack_pop_pointer() : () -> i64
      %388 = func.call @cc_cons(%387, %386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%388) : (i64) -> ()
      %389 = func.call @stack_pop_pointer() : () -> i64
      %390 = func.call @stack_pop_pointer() : () -> i64
      %391 = func.call @cc_cons(%390, %389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%391) : (i64) -> ()
      %392 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%392) : (i64) -> ()
      %393 = llvm.mlir.addressof @str35 : !llvm.ptr
      %394 = arith.constant 12 : i64
      %395 = func.call @cc_make_string(%393, %394) : (!llvm.ptr, i64) -> i64
      %396 = llvm.mlir.addressof @str36 : !llvm.ptr
      %397 = arith.constant 11 : i64
      %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
      %399 = func.call @cc_intern(%395, %398) : (i64, i64) -> i64
      %400 = func.call @cc_nil_value() : () -> i64
      %401 = func.call @cc_cons(%399, %400) : (i64, i64) -> i64
      %402 = func.call @cc_values_pack(%401) : (i64) -> i64
      func.call @stack_push_pointer(%399) : (i64) -> ()
      %403 = llvm.mlir.addressof @str37 : !llvm.ptr
      %404 = arith.constant 9 : i64
      %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
      %406 = llvm.mlir.addressof @str38 : !llvm.ptr
      %407 = arith.constant 11 : i64
      %408 = func.call @cc_make_string(%406, %407) : (!llvm.ptr, i64) -> i64
      %409 = func.call @cc_intern(%405, %408) : (i64, i64) -> i64
      %410 = func.call @cc_nil_value() : () -> i64
      %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
      %412 = func.call @cc_values_pack(%411) : (i64) -> i64
      func.call @stack_push_pointer(%409) : (i64) -> ()
      %413 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %414 = func.call @stack_pop_pointer() : () -> i64
      %415 = func.call @stack_pop_pointer() : () -> i64
      %416 = func.call @cc_cons(%415, %414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%416) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %417 = func.call @stack_pop_pointer() : () -> i64
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = func.call @cc_cons(%418, %417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%419) : (i64) -> ()
      %420 = func.call @stack_pop_pointer() : () -> i64
      %421 = func.call @stack_pop_pointer() : () -> i64
      %422 = func.call @cc_cons(%421, %420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @cc_cons(%424, %423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%425) : (i64) -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%426, %427) : (i64, i64) -> i64
      %429 = llvm.mlir.addressof @str39 : !llvm.ptr
      %430 = arith.constant 5 : i64
      %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = func.call @cc_intern(%431, %432) : (i64, i64) -> i64
      %434 = func.call @cc_nil_value() : () -> i64
      %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
      %436 = func.call @cc_values_pack(%435) : (i64) -> i64
      %437 = func.call @cc_cons(%433, %428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%437) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @stack_pop_pointer() : () -> i64
      %440 = func.call @cc_cons(%439, %438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%440) : (i64) -> ()
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @stack_pop_pointer() : () -> i64
      %443 = func.call @cc_cons(%442, %441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      %444 = func.call @stack_pop_pointer() : () -> i64
      %445 = func.call @stack_pop_pointer() : () -> i64
      %446 = func.call @cc_cons(%445, %444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%446) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %447 = func.call @stack_pop_pointer() : () -> i64
      %448 = func.call @stack_pop_pointer() : () -> i64
      %449 = func.call @cc_cons(%448, %447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %450 = func.call @stack_pop_pointer() : () -> i64
      %451 = func.call @stack_pop_pointer() : () -> i64
      %452 = func.call @cc_cons(%451, %450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%452) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %453 = func.call @stack_pop_pointer() : () -> i64
      %454 = func.call @stack_pop_pointer() : () -> i64
      %455 = func.call @cc_cons(%454, %453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%455) : (i64) -> ()
      %456 = func.call @stack_pop_pointer() : () -> i64
      %457 = func.call @stack_pop_pointer() : () -> i64
      %458 = func.call @cc_cons(%457, %456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%458) : (i64) -> ()
      %459 = func.call @stack_pop_pointer() : () -> i64
      %540 = arith.constant 15079495958530 : i64
      %541 = arith.constant 0 : i64
      %542 = func.call @cc_make_closure(%540, %541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = llvm.mlir.addressof @str47 : !llvm.ptr
      %545 = arith.constant 1 : i64
      %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_intern(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_values_pack(%550) : (i64) -> i64
      func.call @stack_push_pointer(%548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %552 = func.call @stack_pop_pointer() : () -> i64
      %553 = func.call @stack_pop_pointer() : () -> i64
      %554 = func.call @cc_cons(%553, %552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%554) : (i64) -> ()
      %555 = func.call @stack_pop_pointer() : () -> i64
      %556 = llvm.mlir.addressof @str48 : !llvm.ptr
      %557 = arith.constant 11 : i64
      %558 = func.call @cc_make_string(%556, %557) : (!llvm.ptr, i64) -> i64
      %559 = llvm.mlir.addressof @str49 : !llvm.ptr
      %560 = arith.constant 7 : i64
      %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
      %562 = func.call @cc_intern(%558, %561) : (i64, i64) -> i64
      %563 = func.call @cc_nil_value() : () -> i64
      %564 = func.call @cc_cons(%562, %563) : (i64, i64) -> i64
      %565 = func.call @cc_values_pack(%564) : (i64) -> i64
      func.call @stack_push_pointer(%562) : (i64) -> ()
      %566 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = llvm.mlir.addressof @str50 : !llvm.ptr
      %569 = arith.constant 4 : i64
      %570 = func.call @cc_make_string(%568, %569) : (!llvm.ptr, i64) -> i64
      %571 = llvm.mlir.addressof @str51 : !llvm.ptr
      %572 = arith.constant 7 : i64
      %573 = func.call @cc_make_string(%571, %572) : (!llvm.ptr, i64) -> i64
      %574 = func.call @cc_intern(%570, %573) : (i64, i64) -> i64
      %575 = func.call @cc_nil_value() : () -> i64
      %576 = func.call @cc_cons(%574, %575) : (i64, i64) -> i64
      %577 = func.call @cc_values_pack(%576) : (i64) -> i64
      func.call @stack_push_pointer(%574) : (i64) -> ()
      %578 = func.call @stack_pop_pointer() : () -> i64
      %579 = llvm.mlir.addressof @str52 : !llvm.ptr
      %580 = arith.constant 6 : i64
      %581 = func.call @cc_make_string(%579, %580) : (!llvm.ptr, i64) -> i64
      %582 = func.call @cc_nil_value() : () -> i64
      %583 = func.call @cc_intern(%581, %582) : (i64, i64) -> i64
      %584 = func.call @cc_nil_value() : () -> i64
      %585 = func.call @cc_cons(%583, %584) : (i64, i64) -> i64
      %586 = func.call @cc_values_pack(%585) : (i64) -> i64
      func.call @stack_push_pointer(%583) : (i64) -> ()
      %587 = func.call @stack_pop_pointer() : () -> i64
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_errorp(%306) : (i64) -> i64
      %590 = arith.cmpi ne, %589, %588 : i64
      %591 = arith.cmpi eq, %588, %588 : i64
      %592 = arith.andi %590, %591 : i1
      %593 = scf.if %592 -> (i64) {
        scf.yield %306 : i64
      } else {
        scf.yield %588 : i64
      }
      %594 = func.call @cc_errorp(%459) : (i64) -> i64
      %595 = arith.cmpi ne, %594, %588 : i64
      %596 = arith.cmpi eq, %593, %588 : i64
      %597 = arith.andi %595, %596 : i1
      %598 = scf.if %597 -> (i64) {
        scf.yield %459 : i64
      } else {
        scf.yield %593 : i64
      }
      %599 = func.call @cc_errorp(%543) : (i64) -> i64
      %600 = arith.cmpi ne, %599, %588 : i64
      %601 = arith.cmpi eq, %598, %588 : i64
      %602 = arith.andi %600, %601 : i1
      %603 = scf.if %602 -> (i64) {
        scf.yield %543 : i64
      } else {
        scf.yield %598 : i64
      }
      %604 = func.call @cc_errorp(%555) : (i64) -> i64
      %605 = arith.cmpi ne, %604, %588 : i64
      %606 = arith.cmpi eq, %603, %588 : i64
      %607 = arith.andi %605, %606 : i1
      %608 = scf.if %607 -> (i64) {
        scf.yield %555 : i64
      } else {
        scf.yield %603 : i64
      }
      %609 = func.call @cc_errorp(%566) : (i64) -> i64
      %610 = arith.cmpi ne, %609, %588 : i64
      %611 = arith.cmpi eq, %608, %588 : i64
      %612 = arith.andi %610, %611 : i1
      %613 = scf.if %612 -> (i64) {
        scf.yield %566 : i64
      } else {
        scf.yield %608 : i64
      }
      %614 = func.call @cc_errorp(%567) : (i64) -> i64
      %615 = arith.cmpi ne, %614, %588 : i64
      %616 = arith.cmpi eq, %613, %588 : i64
      %617 = arith.andi %615, %616 : i1
      %618 = scf.if %617 -> (i64) {
        scf.yield %567 : i64
      } else {
        scf.yield %613 : i64
      }
      %619 = func.call @cc_errorp(%578) : (i64) -> i64
      %620 = arith.cmpi ne, %619, %588 : i64
      %621 = arith.cmpi eq, %618, %588 : i64
      %622 = arith.andi %620, %621 : i1
      %623 = scf.if %622 -> (i64) {
        scf.yield %578 : i64
      } else {
        scf.yield %618 : i64
      }
      %624 = func.call @cc_errorp(%587) : (i64) -> i64
      %625 = arith.cmpi ne, %624, %588 : i64
      %626 = arith.cmpi eq, %623, %588 : i64
      %627 = arith.andi %625, %626 : i1
      %628 = scf.if %627 -> (i64) {
        scf.yield %587 : i64
      } else {
        scf.yield %623 : i64
      }
      %629 = arith.cmpi ne, %628, %588 : i64
      scf.if %629 {
        func.call @stack_push_pointer(%628) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%306) : (i64) -> ()
        func.call @stack_push_pointer(%459) : (i64) -> ()
        func.call @stack_push_pointer(%543) : (i64) -> ()
        func.call @stack_push_pointer(%555) : (i64) -> ()
        func.call @stack_push_pointer(%566) : (i64) -> ()
        func.call @stack_push_pointer(%567) : (i64) -> ()
        func.call @stack_push_pointer(%578) : (i64) -> ()
        func.call @stack_push_pointer(%587) : (i64) -> ()
        %630 = llvm.mlir.addressof @str53 : !llvm.ptr
        %631 = func.call @cc_make_function_ref_const(%630) : (!llvm.ptr) -> i64
        %632 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%631, %632) : (i64, i64) -> ()
      }
      %633 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %633 : i64
    }
    %634 = func.call @cc_nil_value() : () -> i64
    %635 = func.call @cc_errorp(%297) : (i64) -> i64
    %636 = arith.cmpi ne, %635, %634 : i64
    %637 = scf.if %636 -> (i64) {
      scf.yield %297 : i64
    } else {
      %638 = llvm.mlir.addressof @str54 : !llvm.ptr
      %639 = arith.constant 32 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = func.call @cc_nil_value() : () -> i64
      %642 = func.call @cc_intern(%640, %641) : (i64, i64) -> i64
      %643 = func.call @cc_nil_value() : () -> i64
      %644 = func.call @cc_cons(%642, %643) : (i64, i64) -> i64
      %645 = func.call @cc_values_pack(%644) : (i64) -> i64
      func.call @stack_push_pointer(%642) : (i64) -> ()
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = llvm.mlir.addressof @str55 : !llvm.ptr
      %648 = arith.constant 3 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = func.call @cc_nil_value() : () -> i64
      %651 = func.call @cc_intern(%649, %650) : (i64, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_cons(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_values_pack(%653) : (i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %655 = llvm.mlir.addressof @str56 : !llvm.ptr
      %656 = arith.constant 3 : i64
      %657 = func.call @cc_make_string(%655, %656) : (!llvm.ptr, i64) -> i64
      %658 = func.call @cc_nil_value() : () -> i64
      %659 = func.call @cc_intern(%657, %658) : (i64, i64) -> i64
      %660 = func.call @cc_nil_value() : () -> i64
      %661 = func.call @cc_cons(%659, %660) : (i64, i64) -> i64
      %662 = func.call @cc_values_pack(%661) : (i64) -> i64
      func.call @stack_push_pointer(%659) : (i64) -> ()
      %663 = llvm.mlir.addressof @str57 : !llvm.ptr
      %664 = arith.constant 8 : i64
      %665 = func.call @cc_make_string(%663, %664) : (!llvm.ptr, i64) -> i64
      %666 = llvm.mlir.addressof @str58 : !llvm.ptr
      %667 = arith.constant 11 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = func.call @cc_intern(%665, %668) : (i64, i64) -> i64
      %670 = func.call @cc_nil_value() : () -> i64
      %671 = func.call @cc_cons(%669, %670) : (i64, i64) -> i64
      %672 = func.call @cc_values_pack(%671) : (i64) -> i64
      func.call @stack_push_pointer(%669) : (i64) -> ()
      %673 = llvm.mlir.addressof @str59 : !llvm.ptr
      %674 = arith.constant 7 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = llvm.mlir.addressof @str60 : !llvm.ptr
      %677 = arith.constant 11 : i64
      %678 = func.call @cc_make_string(%676, %677) : (!llvm.ptr, i64) -> i64
      %679 = func.call @cc_intern(%675, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      %683 = llvm.mlir.addressof @str61 : !llvm.ptr
      %684 = arith.constant 13 : i64
      %685 = func.call @cc_make_string(%683, %684) : (!llvm.ptr, i64) -> i64
      %686 = llvm.mlir.addressof @str62 : !llvm.ptr
      %687 = arith.constant 11 : i64
      %688 = func.call @cc_make_string(%686, %687) : (!llvm.ptr, i64) -> i64
      %689 = func.call @cc_intern(%685, %688) : (i64, i64) -> i64
      %690 = func.call @cc_nil_value() : () -> i64
      %691 = func.call @cc_cons(%689, %690) : (i64, i64) -> i64
      %692 = func.call @cc_values_pack(%691) : (i64) -> i64
      func.call @stack_push_pointer(%689) : (i64) -> ()
      %693 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%693) : (i64) -> ()
      %694 = llvm.mlir.addressof @str63 : !llvm.ptr
      %695 = arith.constant 18 : i64
      %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
      %697 = llvm.mlir.addressof @str64 : !llvm.ptr
      %698 = arith.constant 11 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = func.call @cc_intern(%696, %699) : (i64, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_cons(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_values_pack(%702) : (i64) -> i64
      func.call @stack_push_pointer(%700) : (i64) -> ()
      %704 = func.call @stack_pop_pointer() : () -> i64
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @cc_cons(%704, %705) : (i64, i64) -> i64
      %707 = llvm.mlir.addressof @str65 : !llvm.ptr
      %708 = arith.constant 5 : i64
      %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
      %710 = func.call @cc_nil_value() : () -> i64
      %711 = func.call @cc_intern(%709, %710) : (i64, i64) -> i64
      %712 = func.call @cc_nil_value() : () -> i64
      %713 = func.call @cc_cons(%711, %712) : (i64, i64) -> i64
      %714 = func.call @cc_values_pack(%713) : (i64) -> i64
      %715 = func.call @cc_cons(%711, %706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%715) : (i64) -> ()
      %716 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%716) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @cc_cons(%718, %717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%719) : (i64) -> ()
      %720 = func.call @stack_pop_pointer() : () -> i64
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @cc_cons(%721, %720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%722) : (i64) -> ()
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @cc_cons(%724, %723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%725) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @cc_cons(%727, %726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @cc_cons(%730, %729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%731) : (i64) -> ()
      %732 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%732) : (i64) -> ()
      %733 = llvm.mlir.addressof @str66 : !llvm.ptr
      %734 = arith.constant 12 : i64
      %735 = func.call @cc_make_string(%733, %734) : (!llvm.ptr, i64) -> i64
      %736 = llvm.mlir.addressof @str67 : !llvm.ptr
      %737 = arith.constant 11 : i64
      %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
      %739 = func.call @cc_intern(%735, %738) : (i64, i64) -> i64
      %740 = func.call @cc_nil_value() : () -> i64
      %741 = func.call @cc_cons(%739, %740) : (i64, i64) -> i64
      %742 = func.call @cc_values_pack(%741) : (i64) -> i64
      func.call @stack_push_pointer(%739) : (i64) -> ()
      %743 = llvm.mlir.addressof @str68 : !llvm.ptr
      %744 = arith.constant 9 : i64
      %745 = func.call @cc_make_string(%743, %744) : (!llvm.ptr, i64) -> i64
      %746 = llvm.mlir.addressof @str69 : !llvm.ptr
      %747 = arith.constant 11 : i64
      %748 = func.call @cc_make_string(%746, %747) : (!llvm.ptr, i64) -> i64
      %749 = func.call @cc_intern(%745, %748) : (i64, i64) -> i64
      %750 = func.call @cc_nil_value() : () -> i64
      %751 = func.call @cc_cons(%749, %750) : (i64, i64) -> i64
      %752 = func.call @cc_values_pack(%751) : (i64) -> i64
      func.call @stack_push_pointer(%749) : (i64) -> ()
      %753 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%753) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @cc_cons(%755, %754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %768 = func.call @cc_cons(%766, %767) : (i64, i64) -> i64
      %769 = llvm.mlir.addressof @str70 : !llvm.ptr
      %770 = arith.constant 5 : i64
      %771 = func.call @cc_make_string(%769, %770) : (!llvm.ptr, i64) -> i64
      %772 = func.call @cc_nil_value() : () -> i64
      %773 = func.call @cc_intern(%771, %772) : (i64, i64) -> i64
      %774 = func.call @cc_nil_value() : () -> i64
      %775 = func.call @cc_cons(%773, %774) : (i64, i64) -> i64
      %776 = func.call @cc_values_pack(%775) : (i64) -> i64
      %777 = func.call @cc_cons(%773, %768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @cc_cons(%788, %787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%789) : (i64) -> ()
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @cc_cons(%794, %793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = func.call @stack_pop_pointer() : () -> i64
      %798 = func.call @cc_cons(%797, %796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%798) : (i64) -> ()
      %799 = func.call @stack_pop_pointer() : () -> i64
      %880 = arith.constant 15079495958531 : i64
      %881 = arith.constant 0 : i64
      %882 = func.call @cc_make_closure(%880, %881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%882) : (i64) -> ()
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = llvm.mlir.addressof @str78 : !llvm.ptr
      %885 = arith.constant 1 : i64
      %886 = func.call @cc_make_string(%884, %885) : (!llvm.ptr, i64) -> i64
      %887 = func.call @cc_nil_value() : () -> i64
      %888 = func.call @cc_intern(%886, %887) : (i64, i64) -> i64
      %889 = func.call @cc_nil_value() : () -> i64
      %890 = func.call @cc_cons(%888, %889) : (i64, i64) -> i64
      %891 = func.call @cc_values_pack(%890) : (i64) -> i64
      func.call @stack_push_pointer(%888) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%894) : (i64) -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = llvm.mlir.addressof @str79 : !llvm.ptr
      %897 = arith.constant 11 : i64
      %898 = func.call @cc_make_string(%896, %897) : (!llvm.ptr, i64) -> i64
      %899 = llvm.mlir.addressof @str80 : !llvm.ptr
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
      %908 = llvm.mlir.addressof @str81 : !llvm.ptr
      %909 = arith.constant 4 : i64
      %910 = func.call @cc_make_string(%908, %909) : (!llvm.ptr, i64) -> i64
      %911 = llvm.mlir.addressof @str82 : !llvm.ptr
      %912 = arith.constant 7 : i64
      %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
      %914 = func.call @cc_intern(%910, %913) : (i64, i64) -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      %917 = func.call @cc_values_pack(%916) : (i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = llvm.mlir.addressof @str83 : !llvm.ptr
      %920 = arith.constant 6 : i64
      %921 = func.call @cc_make_string(%919, %920) : (!llvm.ptr, i64) -> i64
      %922 = func.call @cc_nil_value() : () -> i64
      %923 = func.call @cc_intern(%921, %922) : (i64, i64) -> i64
      %924 = func.call @cc_nil_value() : () -> i64
      %925 = func.call @cc_cons(%923, %924) : (i64, i64) -> i64
      %926 = func.call @cc_values_pack(%925) : (i64) -> i64
      func.call @stack_push_pointer(%923) : (i64) -> ()
      %927 = func.call @stack_pop_pointer() : () -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      %929 = func.call @cc_errorp(%646) : (i64) -> i64
      %930 = arith.cmpi ne, %929, %928 : i64
      %931 = arith.cmpi eq, %928, %928 : i64
      %932 = arith.andi %930, %931 : i1
      %933 = scf.if %932 -> (i64) {
        scf.yield %646 : i64
      } else {
        scf.yield %928 : i64
      }
      %934 = func.call @cc_errorp(%799) : (i64) -> i64
      %935 = arith.cmpi ne, %934, %928 : i64
      %936 = arith.cmpi eq, %933, %928 : i64
      %937 = arith.andi %935, %936 : i1
      %938 = scf.if %937 -> (i64) {
        scf.yield %799 : i64
      } else {
        scf.yield %933 : i64
      }
      %939 = func.call @cc_errorp(%883) : (i64) -> i64
      %940 = arith.cmpi ne, %939, %928 : i64
      %941 = arith.cmpi eq, %938, %928 : i64
      %942 = arith.andi %940, %941 : i1
      %943 = scf.if %942 -> (i64) {
        scf.yield %883 : i64
      } else {
        scf.yield %938 : i64
      }
      %944 = func.call @cc_errorp(%895) : (i64) -> i64
      %945 = arith.cmpi ne, %944, %928 : i64
      %946 = arith.cmpi eq, %943, %928 : i64
      %947 = arith.andi %945, %946 : i1
      %948 = scf.if %947 -> (i64) {
        scf.yield %895 : i64
      } else {
        scf.yield %943 : i64
      }
      %949 = func.call @cc_errorp(%906) : (i64) -> i64
      %950 = arith.cmpi ne, %949, %928 : i64
      %951 = arith.cmpi eq, %948, %928 : i64
      %952 = arith.andi %950, %951 : i1
      %953 = scf.if %952 -> (i64) {
        scf.yield %906 : i64
      } else {
        scf.yield %948 : i64
      }
      %954 = func.call @cc_errorp(%907) : (i64) -> i64
      %955 = arith.cmpi ne, %954, %928 : i64
      %956 = arith.cmpi eq, %953, %928 : i64
      %957 = arith.andi %955, %956 : i1
      %958 = scf.if %957 -> (i64) {
        scf.yield %907 : i64
      } else {
        scf.yield %953 : i64
      }
      %959 = func.call @cc_errorp(%918) : (i64) -> i64
      %960 = arith.cmpi ne, %959, %928 : i64
      %961 = arith.cmpi eq, %958, %928 : i64
      %962 = arith.andi %960, %961 : i1
      %963 = scf.if %962 -> (i64) {
        scf.yield %918 : i64
      } else {
        scf.yield %958 : i64
      }
      %964 = func.call @cc_errorp(%927) : (i64) -> i64
      %965 = arith.cmpi ne, %964, %928 : i64
      %966 = arith.cmpi eq, %963, %928 : i64
      %967 = arith.andi %965, %966 : i1
      %968 = scf.if %967 -> (i64) {
        scf.yield %927 : i64
      } else {
        scf.yield %963 : i64
      }
      %969 = arith.cmpi ne, %968, %928 : i64
      scf.if %969 {
        func.call @stack_push_pointer(%968) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%646) : (i64) -> ()
        func.call @stack_push_pointer(%799) : (i64) -> ()
        func.call @stack_push_pointer(%883) : (i64) -> ()
        func.call @stack_push_pointer(%895) : (i64) -> ()
        func.call @stack_push_pointer(%906) : (i64) -> ()
        func.call @stack_push_pointer(%907) : (i64) -> ()
        func.call @stack_push_pointer(%918) : (i64) -> ()
        func.call @stack_push_pointer(%927) : (i64) -> ()
        %970 = llvm.mlir.addressof @str84 : !llvm.ptr
        %971 = func.call @cc_make_function_ref_const(%970) : (!llvm.ptr) -> i64
        %972 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%971, %972) : (i64, i64) -> ()
      }
      %973 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %973 : i64
    }
    %974 = func.call @cc_nil_value() : () -> i64
    %975 = func.call @cc_errorp(%637) : (i64) -> i64
    %976 = arith.cmpi ne, %975, %974 : i64
    %977 = scf.if %976 -> (i64) {
      scf.yield %637 : i64
    } else {
      %978 = llvm.mlir.addressof @str85 : !llvm.ptr
      %979 = arith.constant 23 : i64
      %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_intern(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = llvm.mlir.addressof @str86 : !llvm.ptr
      %988 = arith.constant 6 : i64
      %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_intern(%989, %990) : (i64, i64) -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_cons(%991, %992) : (i64, i64) -> i64
      %994 = func.call @cc_values_pack(%993) : (i64) -> i64
      func.call @stack_push_pointer(%991) : (i64) -> ()
      %995 = llvm.mlir.addressof @str87 : !llvm.ptr
      %996 = arith.constant 10 : i64
      %997 = func.call @cc_make_string(%995, %996) : (!llvm.ptr, i64) -> i64
      %998 = llvm.mlir.addressof @str88 : !llvm.ptr
      %999 = arith.constant 11 : i64
      %1000 = func.call @cc_make_string(%998, %999) : (!llvm.ptr, i64) -> i64
      %1001 = func.call @cc_intern(%997, %1000) : (i64, i64) -> i64
      %1002 = func.call @cc_nil_value() : () -> i64
      %1003 = func.call @cc_cons(%1001, %1002) : (i64, i64) -> i64
      %1004 = func.call @cc_values_pack(%1003) : (i64) -> i64
      func.call @stack_push_pointer(%1001) : (i64) -> ()
      %1005 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1006 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1006) : (i64) -> ()
      %1007 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1007) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @stack_pop_pointer() : () -> i64
      %1010 = func.call @cc_cons(%1009, %1008) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = func.call @stack_pop_pointer() : () -> i64
      %1013 = func.call @cc_cons(%1012, %1011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1013) : (i64) -> ()
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @stack_pop_pointer() : () -> i64
      %1016 = func.call @cc_cons(%1014, %1015) : (i64, i64) -> i64
      %1017 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1018 = arith.constant 5 : i64
      %1019 = func.call @cc_make_string(%1017, %1018) : (!llvm.ptr, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_intern(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_nil_value() : () -> i64
      %1023 = func.call @cc_cons(%1021, %1022) : (i64, i64) -> i64
      %1024 = func.call @cc_values_pack(%1023) : (i64) -> i64
      %1025 = func.call @cc_cons(%1021, %1016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @cc_cons(%1027, %1026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1028) : (i64) -> ()
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = func.call @stack_pop_pointer() : () -> i64
      %1031 = func.call @cc_cons(%1030, %1029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1031) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @stack_pop_pointer() : () -> i64
      %1034 = func.call @cc_cons(%1033, %1032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @cc_cons(%1036, %1035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1037) : (i64) -> ()
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1069 = arith.constant 15079495958532 : i64
      %1070 = arith.constant 0 : i64
      %1071 = func.call @cc_make_closure(%1069, %1070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1071) : (i64) -> ()
      %1072 = func.call @stack_pop_pointer() : () -> i64
      %1073 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1074 = arith.constant 12 : i64
      %1075 = func.call @cc_make_string(%1073, %1074) : (!llvm.ptr, i64) -> i64
      %1076 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1077 = arith.constant 11 : i64
      %1078 = func.call @cc_make_string(%1076, %1077) : (!llvm.ptr, i64) -> i64
      %1079 = func.call @cc_intern(%1075, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_nil_value() : () -> i64
      %1081 = func.call @cc_cons(%1079, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_values_pack(%1081) : (i64) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1083 = func.call @stack_pop_pointer() : () -> i64
      %1084 = func.call @stack_pop_pointer() : () -> i64
      %1085 = func.call @cc_cons(%1084, %1083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1085) : (i64) -> ()
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1088 = arith.constant 11 : i64
      %1089 = func.call @cc_make_string(%1087, %1088) : (!llvm.ptr, i64) -> i64
      %1090 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1091 = arith.constant 7 : i64
      %1092 = func.call @cc_make_string(%1090, %1091) : (!llvm.ptr, i64) -> i64
      %1093 = func.call @cc_intern(%1089, %1092) : (i64, i64) -> i64
      %1094 = func.call @cc_nil_value() : () -> i64
      %1095 = func.call @cc_cons(%1093, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_values_pack(%1095) : (i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      %1097 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1100 = arith.constant 4 : i64
      %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
      %1102 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1103 = arith.constant 7 : i64
      %1104 = func.call @cc_make_string(%1102, %1103) : (!llvm.ptr, i64) -> i64
      %1105 = func.call @cc_intern(%1101, %1104) : (i64, i64) -> i64
      %1106 = func.call @cc_nil_value() : () -> i64
      %1107 = func.call @cc_cons(%1105, %1106) : (i64, i64) -> i64
      %1108 = func.call @cc_values_pack(%1107) : (i64) -> i64
      func.call @stack_push_pointer(%1105) : (i64) -> ()
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1111 = arith.constant 5 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = func.call @cc_nil_value() : () -> i64
      %1114 = func.call @cc_intern(%1112, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_nil_value() : () -> i64
      %1116 = func.call @cc_cons(%1114, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_values_pack(%1116) : (i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_nil_value() : () -> i64
      %1120 = func.call @cc_errorp(%986) : (i64) -> i64
      %1121 = arith.cmpi ne, %1120, %1119 : i64
      %1122 = arith.cmpi eq, %1119, %1119 : i64
      %1123 = arith.andi %1121, %1122 : i1
      %1124 = scf.if %1123 -> (i64) {
        scf.yield %986 : i64
      } else {
        scf.yield %1119 : i64
      }
      %1125 = func.call @cc_errorp(%1038) : (i64) -> i64
      %1126 = arith.cmpi ne, %1125, %1119 : i64
      %1127 = arith.cmpi eq, %1124, %1119 : i64
      %1128 = arith.andi %1126, %1127 : i1
      %1129 = scf.if %1128 -> (i64) {
        scf.yield %1038 : i64
      } else {
        scf.yield %1124 : i64
      }
      %1130 = func.call @cc_errorp(%1072) : (i64) -> i64
      %1131 = arith.cmpi ne, %1130, %1119 : i64
      %1132 = arith.cmpi eq, %1129, %1119 : i64
      %1133 = arith.andi %1131, %1132 : i1
      %1134 = scf.if %1133 -> (i64) {
        scf.yield %1072 : i64
      } else {
        scf.yield %1129 : i64
      }
      %1135 = func.call @cc_errorp(%1086) : (i64) -> i64
      %1136 = arith.cmpi ne, %1135, %1119 : i64
      %1137 = arith.cmpi eq, %1134, %1119 : i64
      %1138 = arith.andi %1136, %1137 : i1
      %1139 = scf.if %1138 -> (i64) {
        scf.yield %1086 : i64
      } else {
        scf.yield %1134 : i64
      }
      %1140 = func.call @cc_errorp(%1097) : (i64) -> i64
      %1141 = arith.cmpi ne, %1140, %1119 : i64
      %1142 = arith.cmpi eq, %1139, %1119 : i64
      %1143 = arith.andi %1141, %1142 : i1
      %1144 = scf.if %1143 -> (i64) {
        scf.yield %1097 : i64
      } else {
        scf.yield %1139 : i64
      }
      %1145 = func.call @cc_errorp(%1098) : (i64) -> i64
      %1146 = arith.cmpi ne, %1145, %1119 : i64
      %1147 = arith.cmpi eq, %1144, %1119 : i64
      %1148 = arith.andi %1146, %1147 : i1
      %1149 = scf.if %1148 -> (i64) {
        scf.yield %1098 : i64
      } else {
        scf.yield %1144 : i64
      }
      %1150 = func.call @cc_errorp(%1109) : (i64) -> i64
      %1151 = arith.cmpi ne, %1150, %1119 : i64
      %1152 = arith.cmpi eq, %1149, %1119 : i64
      %1153 = arith.andi %1151, %1152 : i1
      %1154 = scf.if %1153 -> (i64) {
        scf.yield %1109 : i64
      } else {
        scf.yield %1149 : i64
      }
      %1155 = func.call @cc_errorp(%1118) : (i64) -> i64
      %1156 = arith.cmpi ne, %1155, %1119 : i64
      %1157 = arith.cmpi eq, %1154, %1119 : i64
      %1158 = arith.andi %1156, %1157 : i1
      %1159 = scf.if %1158 -> (i64) {
        scf.yield %1118 : i64
      } else {
        scf.yield %1154 : i64
      }
      %1160 = arith.cmpi ne, %1159, %1119 : i64
      scf.if %1160 {
        func.call @stack_push_pointer(%1159) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%986) : (i64) -> ()
        func.call @stack_push_pointer(%1038) : (i64) -> ()
        func.call @stack_push_pointer(%1072) : (i64) -> ()
        func.call @stack_push_pointer(%1086) : (i64) -> ()
        func.call @stack_push_pointer(%1097) : (i64) -> ()
        func.call @stack_push_pointer(%1098) : (i64) -> ()
        func.call @stack_push_pointer(%1109) : (i64) -> ()
        func.call @stack_push_pointer(%1118) : (i64) -> ()
        %1161 = llvm.mlir.addressof @str98 : !llvm.ptr
        %1162 = func.call @cc_make_function_ref_const(%1161) : (!llvm.ptr) -> i64
        %1163 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1162, %1163) : (i64, i64) -> ()
      }
      %1164 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1164 : i64
    }
    %1165 = func.call @cc_nil_value() : () -> i64
    %1166 = func.call @cc_errorp(%977) : (i64) -> i64
    %1167 = arith.cmpi ne, %1166, %1165 : i64
    %1168 = scf.if %1167 -> (i64) {
      scf.yield %977 : i64
    } else {
      %1169 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1170 = arith.constant 40 : i64
      %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
      %1172 = func.call @cc_nil_value() : () -> i64
      %1173 = func.call @cc_intern(%1171, %1172) : (i64, i64) -> i64
      %1174 = func.call @cc_nil_value() : () -> i64
      %1175 = func.call @cc_cons(%1173, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_values_pack(%1175) : (i64) -> i64
      func.call @stack_push_pointer(%1173) : (i64) -> ()
      %1177 = func.call @stack_pop_pointer() : () -> i64
      %1178 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1179 = arith.constant 6 : i64
      %1180 = func.call @cc_make_string(%1178, %1179) : (!llvm.ptr, i64) -> i64
      %1181 = func.call @cc_nil_value() : () -> i64
      %1182 = func.call @cc_intern(%1180, %1181) : (i64, i64) -> i64
      %1183 = func.call @cc_nil_value() : () -> i64
      %1184 = func.call @cc_cons(%1182, %1183) : (i64, i64) -> i64
      %1185 = func.call @cc_values_pack(%1184) : (i64) -> i64
      func.call @stack_push_pointer(%1182) : (i64) -> ()
      %1186 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1187 = arith.constant 10 : i64
      %1188 = func.call @cc_make_string(%1186, %1187) : (!llvm.ptr, i64) -> i64
      %1189 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1190 = arith.constant 11 : i64
      %1191 = func.call @cc_make_string(%1189, %1190) : (!llvm.ptr, i64) -> i64
      %1192 = func.call @cc_intern(%1188, %1191) : (i64, i64) -> i64
      %1193 = func.call @cc_nil_value() : () -> i64
      %1194 = func.call @cc_cons(%1192, %1193) : (i64, i64) -> i64
      %1195 = func.call @cc_values_pack(%1194) : (i64) -> i64
      func.call @stack_push_pointer(%1192) : (i64) -> ()
      %1196 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1196) : (i64) -> ()
      %1197 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1198 = arith.constant 12 : i64
      %1199 = func.call @cc_make_string(%1197, %1198) : (!llvm.ptr, i64) -> i64
      %1200 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1201 = arith.constant 7 : i64
      %1202 = func.call @cc_make_string(%1200, %1201) : (!llvm.ptr, i64) -> i64
      %1203 = func.call @cc_intern(%1199, %1202) : (i64, i64) -> i64
      %1204 = func.call @cc_nil_value() : () -> i64
      %1205 = func.call @cc_cons(%1203, %1204) : (i64, i64) -> i64
      %1206 = func.call @cc_values_pack(%1205) : (i64) -> i64
      func.call @stack_push_pointer(%1203) : (i64) -> ()
      %1207 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1207) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1208 = func.call @stack_pop_pointer() : () -> i64
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @cc_cons(%1209, %1208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      %1211 = func.call @stack_pop_pointer() : () -> i64
      %1212 = func.call @stack_pop_pointer() : () -> i64
      %1213 = func.call @cc_cons(%1212, %1211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1213) : (i64) -> ()
      %1214 = func.call @stack_pop_pointer() : () -> i64
      %1215 = func.call @stack_pop_pointer() : () -> i64
      %1216 = func.call @cc_cons(%1215, %1214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
      %1217 = func.call @stack_pop_pointer() : () -> i64
      %1218 = func.call @stack_pop_pointer() : () -> i64
      %1219 = func.call @cc_cons(%1218, %1217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1219) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1220 = func.call @stack_pop_pointer() : () -> i64
      %1221 = func.call @stack_pop_pointer() : () -> i64
      %1222 = func.call @cc_cons(%1221, %1220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = func.call @stack_pop_pointer() : () -> i64
      %1225 = func.call @cc_cons(%1224, %1223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1225) : (i64) -> ()
      %1226 = func.call @stack_pop_pointer() : () -> i64
      %1273 = arith.constant 15079495958533 : i64
      %1274 = arith.constant 0 : i64
      %1275 = func.call @cc_make_closure(%1273, %1274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1278 = arith.constant 3 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1281 = arith.constant 11 : i64
      %1282 = func.call @cc_make_string(%1280, %1281) : (!llvm.ptr, i64) -> i64
      %1283 = func.call @cc_intern(%1279, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_nil_value() : () -> i64
      %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
      %1286 = func.call @cc_values_pack(%1285) : (i64) -> i64
      func.call @stack_push_pointer(%1283) : (i64) -> ()
      %1287 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1288 = arith.constant 12 : i64
      %1289 = func.call @cc_make_string(%1287, %1288) : (!llvm.ptr, i64) -> i64
      %1290 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1291 = arith.constant 11 : i64
      %1292 = func.call @cc_make_string(%1290, %1291) : (!llvm.ptr, i64) -> i64
      %1293 = func.call @cc_intern(%1289, %1292) : (i64, i64) -> i64
      %1294 = func.call @cc_nil_value() : () -> i64
      %1295 = func.call @cc_cons(%1293, %1294) : (i64, i64) -> i64
      %1296 = func.call @cc_values_pack(%1295) : (i64) -> i64
      func.call @stack_push_pointer(%1293) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1297 = func.call @stack_pop_pointer() : () -> i64
      %1298 = func.call @stack_pop_pointer() : () -> i64
      %1299 = func.call @cc_cons(%1298, %1297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1299) : (i64) -> ()
      %1300 = func.call @stack_pop_pointer() : () -> i64
      %1301 = func.call @stack_pop_pointer() : () -> i64
      %1302 = func.call @cc_cons(%1301, %1300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1303 = func.call @stack_pop_pointer() : () -> i64
      %1304 = func.call @stack_pop_pointer() : () -> i64
      %1305 = func.call @cc_cons(%1304, %1303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1305) : (i64) -> ()
      %1306 = func.call @stack_pop_pointer() : () -> i64
      %1307 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1308 = arith.constant 11 : i64
      %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
      %1310 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1311 = arith.constant 7 : i64
      %1312 = func.call @cc_make_string(%1310, %1311) : (!llvm.ptr, i64) -> i64
      %1313 = func.call @cc_intern(%1309, %1312) : (i64, i64) -> i64
      %1314 = func.call @cc_nil_value() : () -> i64
      %1315 = func.call @cc_cons(%1313, %1314) : (i64, i64) -> i64
      %1316 = func.call @cc_values_pack(%1315) : (i64) -> i64
      func.call @stack_push_pointer(%1313) : (i64) -> ()
      %1317 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1318 = func.call @stack_pop_pointer() : () -> i64
      %1319 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1320 = arith.constant 4 : i64
      %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
      %1322 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1323 = arith.constant 7 : i64
      %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
      %1325 = func.call @cc_intern(%1321, %1324) : (i64, i64) -> i64
      %1326 = func.call @cc_nil_value() : () -> i64
      %1327 = func.call @cc_cons(%1325, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_values_pack(%1327) : (i64) -> i64
      func.call @stack_push_pointer(%1325) : (i64) -> ()
      %1329 = func.call @stack_pop_pointer() : () -> i64
      %1330 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1331 = arith.constant 5 : i64
      %1332 = func.call @cc_make_string(%1330, %1331) : (!llvm.ptr, i64) -> i64
      %1333 = func.call @cc_nil_value() : () -> i64
      %1334 = func.call @cc_intern(%1332, %1333) : (i64, i64) -> i64
      %1335 = func.call @cc_nil_value() : () -> i64
      %1336 = func.call @cc_cons(%1334, %1335) : (i64, i64) -> i64
      %1337 = func.call @cc_values_pack(%1336) : (i64) -> i64
      func.call @stack_push_pointer(%1334) : (i64) -> ()
      %1338 = func.call @stack_pop_pointer() : () -> i64
      %1339 = func.call @cc_nil_value() : () -> i64
      %1340 = func.call @cc_errorp(%1177) : (i64) -> i64
      %1341 = arith.cmpi ne, %1340, %1339 : i64
      %1342 = arith.cmpi eq, %1339, %1339 : i64
      %1343 = arith.andi %1341, %1342 : i1
      %1344 = scf.if %1343 -> (i64) {
        scf.yield %1177 : i64
      } else {
        scf.yield %1339 : i64
      }
      %1345 = func.call @cc_errorp(%1226) : (i64) -> i64
      %1346 = arith.cmpi ne, %1345, %1339 : i64
      %1347 = arith.cmpi eq, %1344, %1339 : i64
      %1348 = arith.andi %1346, %1347 : i1
      %1349 = scf.if %1348 -> (i64) {
        scf.yield %1226 : i64
      } else {
        scf.yield %1344 : i64
      }
      %1350 = func.call @cc_errorp(%1276) : (i64) -> i64
      %1351 = arith.cmpi ne, %1350, %1339 : i64
      %1352 = arith.cmpi eq, %1349, %1339 : i64
      %1353 = arith.andi %1351, %1352 : i1
      %1354 = scf.if %1353 -> (i64) {
        scf.yield %1276 : i64
      } else {
        scf.yield %1349 : i64
      }
      %1355 = func.call @cc_errorp(%1306) : (i64) -> i64
      %1356 = arith.cmpi ne, %1355, %1339 : i64
      %1357 = arith.cmpi eq, %1354, %1339 : i64
      %1358 = arith.andi %1356, %1357 : i1
      %1359 = scf.if %1358 -> (i64) {
        scf.yield %1306 : i64
      } else {
        scf.yield %1354 : i64
      }
      %1360 = func.call @cc_errorp(%1317) : (i64) -> i64
      %1361 = arith.cmpi ne, %1360, %1339 : i64
      %1362 = arith.cmpi eq, %1359, %1339 : i64
      %1363 = arith.andi %1361, %1362 : i1
      %1364 = scf.if %1363 -> (i64) {
        scf.yield %1317 : i64
      } else {
        scf.yield %1359 : i64
      }
      %1365 = func.call @cc_errorp(%1318) : (i64) -> i64
      %1366 = arith.cmpi ne, %1365, %1339 : i64
      %1367 = arith.cmpi eq, %1364, %1339 : i64
      %1368 = arith.andi %1366, %1367 : i1
      %1369 = scf.if %1368 -> (i64) {
        scf.yield %1318 : i64
      } else {
        scf.yield %1364 : i64
      }
      %1370 = func.call @cc_errorp(%1329) : (i64) -> i64
      %1371 = arith.cmpi ne, %1370, %1339 : i64
      %1372 = arith.cmpi eq, %1369, %1339 : i64
      %1373 = arith.andi %1371, %1372 : i1
      %1374 = scf.if %1373 -> (i64) {
        scf.yield %1329 : i64
      } else {
        scf.yield %1369 : i64
      }
      %1375 = func.call @cc_errorp(%1338) : (i64) -> i64
      %1376 = arith.cmpi ne, %1375, %1339 : i64
      %1377 = arith.cmpi eq, %1374, %1339 : i64
      %1378 = arith.andi %1376, %1377 : i1
      %1379 = scf.if %1378 -> (i64) {
        scf.yield %1338 : i64
      } else {
        scf.yield %1374 : i64
      }
      %1380 = arith.cmpi ne, %1379, %1339 : i64
      scf.if %1380 {
        func.call @stack_push_pointer(%1379) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1177) : (i64) -> ()
        func.call @stack_push_pointer(%1226) : (i64) -> ()
        func.call @stack_push_pointer(%1276) : (i64) -> ()
        func.call @stack_push_pointer(%1306) : (i64) -> ()
        func.call @stack_push_pointer(%1317) : (i64) -> ()
        func.call @stack_push_pointer(%1318) : (i64) -> ()
        func.call @stack_push_pointer(%1329) : (i64) -> ()
        func.call @stack_push_pointer(%1338) : (i64) -> ()
        %1381 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1382 = func.call @cc_make_function_ref_const(%1381) : (!llvm.ptr) -> i64
        %1383 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1382, %1383) : (i64, i64) -> ()
      }
      %1384 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1384 : i64
    }
    %1385 = func.call @cc_nil_value() : () -> i64
    %1386 = func.call @cc_errorp(%1168) : (i64) -> i64
    %1387 = arith.cmpi ne, %1386, %1385 : i64
    %1388 = scf.if %1387 -> (i64) {
      scf.yield %1168 : i64
    } else {
      %1389 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1390 = arith.constant 47 : i64
      %1391 = func.call @cc_make_string(%1389, %1390) : (!llvm.ptr, i64) -> i64
      %1392 = func.call @cc_nil_value() : () -> i64
      %1393 = func.call @cc_intern(%1391, %1392) : (i64, i64) -> i64
      %1394 = func.call @cc_nil_value() : () -> i64
      %1395 = func.call @cc_cons(%1393, %1394) : (i64, i64) -> i64
      %1396 = func.call @cc_values_pack(%1395) : (i64) -> i64
      func.call @stack_push_pointer(%1393) : (i64) -> ()
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1399 = arith.constant 6 : i64
      %1400 = func.call @cc_make_string(%1398, %1399) : (!llvm.ptr, i64) -> i64
      %1401 = func.call @cc_nil_value() : () -> i64
      %1402 = func.call @cc_intern(%1400, %1401) : (i64, i64) -> i64
      %1403 = func.call @cc_nil_value() : () -> i64
      %1404 = func.call @cc_cons(%1402, %1403) : (i64, i64) -> i64
      %1405 = func.call @cc_values_pack(%1404) : (i64) -> i64
      func.call @stack_push_pointer(%1402) : (i64) -> ()
      %1406 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1407 = arith.constant 10 : i64
      %1408 = func.call @cc_make_string(%1406, %1407) : (!llvm.ptr, i64) -> i64
      %1409 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1410 = arith.constant 11 : i64
      %1411 = func.call @cc_make_string(%1409, %1410) : (!llvm.ptr, i64) -> i64
      %1412 = func.call @cc_intern(%1408, %1411) : (i64, i64) -> i64
      %1413 = func.call @cc_nil_value() : () -> i64
      %1414 = func.call @cc_cons(%1412, %1413) : (i64, i64) -> i64
      %1415 = func.call @cc_values_pack(%1414) : (i64) -> i64
      func.call @stack_push_pointer(%1412) : (i64) -> ()
      %1416 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1416) : (i64) -> ()
      %1417 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1418 = arith.constant 12 : i64
      %1419 = func.call @cc_make_string(%1417, %1418) : (!llvm.ptr, i64) -> i64
      %1420 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1421 = arith.constant 7 : i64
      %1422 = func.call @cc_make_string(%1420, %1421) : (!llvm.ptr, i64) -> i64
      %1423 = func.call @cc_intern(%1419, %1422) : (i64, i64) -> i64
      %1424 = func.call @cc_nil_value() : () -> i64
      %1425 = func.call @cc_cons(%1423, %1424) : (i64, i64) -> i64
      %1426 = func.call @cc_values_pack(%1425) : (i64) -> i64
      func.call @stack_push_pointer(%1423) : (i64) -> ()
      %1427 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1428 = func.call @stack_pop_pointer() : () -> i64
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @cc_cons(%1429, %1428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1430) : (i64) -> ()
      %1431 = func.call @stack_pop_pointer() : () -> i64
      %1432 = func.call @stack_pop_pointer() : () -> i64
      %1433 = func.call @cc_cons(%1432, %1431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1433) : (i64) -> ()
      %1434 = func.call @stack_pop_pointer() : () -> i64
      %1435 = func.call @stack_pop_pointer() : () -> i64
      %1436 = func.call @cc_cons(%1435, %1434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1436) : (i64) -> ()
      %1437 = func.call @stack_pop_pointer() : () -> i64
      %1438 = func.call @stack_pop_pointer() : () -> i64
      %1439 = func.call @cc_cons(%1438, %1437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1439) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1440 = func.call @stack_pop_pointer() : () -> i64
      %1441 = func.call @stack_pop_pointer() : () -> i64
      %1442 = func.call @cc_cons(%1441, %1440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1442) : (i64) -> ()
      %1443 = func.call @stack_pop_pointer() : () -> i64
      %1444 = func.call @stack_pop_pointer() : () -> i64
      %1445 = func.call @cc_cons(%1444, %1443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1445) : (i64) -> ()
      %1446 = func.call @stack_pop_pointer() : () -> i64
      %1493 = arith.constant 15079495958534 : i64
      %1494 = arith.constant 0 : i64
      %1495 = func.call @cc_make_closure(%1493, %1494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1495) : (i64) -> ()
      %1496 = func.call @stack_pop_pointer() : () -> i64
      %1497 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1498 = arith.constant 3 : i64
      %1499 = func.call @cc_make_string(%1497, %1498) : (!llvm.ptr, i64) -> i64
      %1500 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1501 = arith.constant 11 : i64
      %1502 = func.call @cc_make_string(%1500, %1501) : (!llvm.ptr, i64) -> i64
      %1503 = func.call @cc_intern(%1499, %1502) : (i64, i64) -> i64
      %1504 = func.call @cc_nil_value() : () -> i64
      %1505 = func.call @cc_cons(%1503, %1504) : (i64, i64) -> i64
      %1506 = func.call @cc_values_pack(%1505) : (i64) -> i64
      func.call @stack_push_pointer(%1503) : (i64) -> ()
      %1507 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1508 = arith.constant 13 : i64
      %1509 = func.call @cc_make_string(%1507, %1508) : (!llvm.ptr, i64) -> i64
      %1510 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1511 = arith.constant 11 : i64
      %1512 = func.call @cc_make_string(%1510, %1511) : (!llvm.ptr, i64) -> i64
      %1513 = func.call @cc_intern(%1509, %1512) : (i64, i64) -> i64
      %1514 = func.call @cc_nil_value() : () -> i64
      %1515 = func.call @cc_cons(%1513, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_values_pack(%1515) : (i64) -> i64
      func.call @stack_push_pointer(%1513) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1517 = func.call @stack_pop_pointer() : () -> i64
      %1518 = func.call @stack_pop_pointer() : () -> i64
      %1519 = func.call @cc_cons(%1518, %1517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1519) : (i64) -> ()
      %1520 = func.call @stack_pop_pointer() : () -> i64
      %1521 = func.call @stack_pop_pointer() : () -> i64
      %1522 = func.call @cc_cons(%1521, %1520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1523 = func.call @stack_pop_pointer() : () -> i64
      %1524 = func.call @stack_pop_pointer() : () -> i64
      %1525 = func.call @cc_cons(%1524, %1523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1525) : (i64) -> ()
      %1526 = func.call @stack_pop_pointer() : () -> i64
      %1527 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1528 = arith.constant 11 : i64
      %1529 = func.call @cc_make_string(%1527, %1528) : (!llvm.ptr, i64) -> i64
      %1530 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1531 = arith.constant 7 : i64
      %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
      %1533 = func.call @cc_intern(%1529, %1532) : (i64, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_cons(%1533, %1534) : (i64, i64) -> i64
      %1536 = func.call @cc_values_pack(%1535) : (i64) -> i64
      func.call @stack_push_pointer(%1533) : (i64) -> ()
      %1537 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1538 = func.call @stack_pop_pointer() : () -> i64
      %1539 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1540 = arith.constant 4 : i64
      %1541 = func.call @cc_make_string(%1539, %1540) : (!llvm.ptr, i64) -> i64
      %1542 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1543 = arith.constant 7 : i64
      %1544 = func.call @cc_make_string(%1542, %1543) : (!llvm.ptr, i64) -> i64
      %1545 = func.call @cc_intern(%1541, %1544) : (i64, i64) -> i64
      %1546 = func.call @cc_nil_value() : () -> i64
      %1547 = func.call @cc_cons(%1545, %1546) : (i64, i64) -> i64
      %1548 = func.call @cc_values_pack(%1547) : (i64) -> i64
      func.call @stack_push_pointer(%1545) : (i64) -> ()
      %1549 = func.call @stack_pop_pointer() : () -> i64
      %1550 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1551 = arith.constant 5 : i64
      %1552 = func.call @cc_make_string(%1550, %1551) : (!llvm.ptr, i64) -> i64
      %1553 = func.call @cc_nil_value() : () -> i64
      %1554 = func.call @cc_intern(%1552, %1553) : (i64, i64) -> i64
      %1555 = func.call @cc_nil_value() : () -> i64
      %1556 = func.call @cc_cons(%1554, %1555) : (i64, i64) -> i64
      %1557 = func.call @cc_values_pack(%1556) : (i64) -> i64
      func.call @stack_push_pointer(%1554) : (i64) -> ()
      %1558 = func.call @stack_pop_pointer() : () -> i64
      %1559 = func.call @cc_nil_value() : () -> i64
      %1560 = func.call @cc_errorp(%1397) : (i64) -> i64
      %1561 = arith.cmpi ne, %1560, %1559 : i64
      %1562 = arith.cmpi eq, %1559, %1559 : i64
      %1563 = arith.andi %1561, %1562 : i1
      %1564 = scf.if %1563 -> (i64) {
        scf.yield %1397 : i64
      } else {
        scf.yield %1559 : i64
      }
      %1565 = func.call @cc_errorp(%1446) : (i64) -> i64
      %1566 = arith.cmpi ne, %1565, %1559 : i64
      %1567 = arith.cmpi eq, %1564, %1559 : i64
      %1568 = arith.andi %1566, %1567 : i1
      %1569 = scf.if %1568 -> (i64) {
        scf.yield %1446 : i64
      } else {
        scf.yield %1564 : i64
      }
      %1570 = func.call @cc_errorp(%1496) : (i64) -> i64
      %1571 = arith.cmpi ne, %1570, %1559 : i64
      %1572 = arith.cmpi eq, %1569, %1559 : i64
      %1573 = arith.andi %1571, %1572 : i1
      %1574 = scf.if %1573 -> (i64) {
        scf.yield %1496 : i64
      } else {
        scf.yield %1569 : i64
      }
      %1575 = func.call @cc_errorp(%1526) : (i64) -> i64
      %1576 = arith.cmpi ne, %1575, %1559 : i64
      %1577 = arith.cmpi eq, %1574, %1559 : i64
      %1578 = arith.andi %1576, %1577 : i1
      %1579 = scf.if %1578 -> (i64) {
        scf.yield %1526 : i64
      } else {
        scf.yield %1574 : i64
      }
      %1580 = func.call @cc_errorp(%1537) : (i64) -> i64
      %1581 = arith.cmpi ne, %1580, %1559 : i64
      %1582 = arith.cmpi eq, %1579, %1559 : i64
      %1583 = arith.andi %1581, %1582 : i1
      %1584 = scf.if %1583 -> (i64) {
        scf.yield %1537 : i64
      } else {
        scf.yield %1579 : i64
      }
      %1585 = func.call @cc_errorp(%1538) : (i64) -> i64
      %1586 = arith.cmpi ne, %1585, %1559 : i64
      %1587 = arith.cmpi eq, %1584, %1559 : i64
      %1588 = arith.andi %1586, %1587 : i1
      %1589 = scf.if %1588 -> (i64) {
        scf.yield %1538 : i64
      } else {
        scf.yield %1584 : i64
      }
      %1590 = func.call @cc_errorp(%1549) : (i64) -> i64
      %1591 = arith.cmpi ne, %1590, %1559 : i64
      %1592 = arith.cmpi eq, %1589, %1559 : i64
      %1593 = arith.andi %1591, %1592 : i1
      %1594 = scf.if %1593 -> (i64) {
        scf.yield %1549 : i64
      } else {
        scf.yield %1589 : i64
      }
      %1595 = func.call @cc_errorp(%1558) : (i64) -> i64
      %1596 = arith.cmpi ne, %1595, %1559 : i64
      %1597 = arith.cmpi eq, %1594, %1559 : i64
      %1598 = arith.andi %1596, %1597 : i1
      %1599 = scf.if %1598 -> (i64) {
        scf.yield %1558 : i64
      } else {
        scf.yield %1594 : i64
      }
      %1600 = arith.cmpi ne, %1599, %1559 : i64
      scf.if %1600 {
        func.call @stack_push_pointer(%1599) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1397) : (i64) -> ()
        func.call @stack_push_pointer(%1446) : (i64) -> ()
        func.call @stack_push_pointer(%1496) : (i64) -> ()
        func.call @stack_push_pointer(%1526) : (i64) -> ()
        func.call @stack_push_pointer(%1537) : (i64) -> ()
        func.call @stack_push_pointer(%1538) : (i64) -> ()
        func.call @stack_push_pointer(%1549) : (i64) -> ()
        func.call @stack_push_pointer(%1558) : (i64) -> ()
        %1601 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1602 = func.call @cc_make_function_ref_const(%1601) : (!llvm.ptr) -> i64
        %1603 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1602, %1603) : (i64, i64) -> ()
      }
      %1604 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1604 : i64
    }
    %1605 = func.call @cc_nil_value() : () -> i64
    %1606 = func.call @cc_errorp(%1388) : (i64) -> i64
    %1607 = arith.cmpi ne, %1606, %1605 : i64
    %1608 = scf.if %1607 -> (i64) {
      scf.yield %1388 : i64
    } else {
      %1609 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1610 = arith.constant 27 : i64
      %1611 = func.call @cc_make_string(%1609, %1610) : (!llvm.ptr, i64) -> i64
      %1612 = func.call @cc_nil_value() : () -> i64
      %1613 = func.call @cc_intern(%1611, %1612) : (i64, i64) -> i64
      %1614 = func.call @cc_nil_value() : () -> i64
      %1615 = func.call @cc_cons(%1613, %1614) : (i64, i64) -> i64
      %1616 = func.call @cc_values_pack(%1615) : (i64) -> i64
      func.call @stack_push_pointer(%1613) : (i64) -> ()
      %1617 = func.call @stack_pop_pointer() : () -> i64
      %1618 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1619 = arith.constant 6 : i64
      %1620 = func.call @cc_make_string(%1618, %1619) : (!llvm.ptr, i64) -> i64
      %1621 = func.call @cc_nil_value() : () -> i64
      %1622 = func.call @cc_intern(%1620, %1621) : (i64, i64) -> i64
      %1623 = func.call @cc_nil_value() : () -> i64
      %1624 = func.call @cc_cons(%1622, %1623) : (i64, i64) -> i64
      %1625 = func.call @cc_values_pack(%1624) : (i64) -> i64
      func.call @stack_push_pointer(%1622) : (i64) -> ()
      %1626 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1627 = arith.constant 10 : i64
      %1628 = func.call @cc_make_string(%1626, %1627) : (!llvm.ptr, i64) -> i64
      %1629 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1630 = arith.constant 11 : i64
      %1631 = func.call @cc_make_string(%1629, %1630) : (!llvm.ptr, i64) -> i64
      %1632 = func.call @cc_intern(%1628, %1631) : (i64, i64) -> i64
      %1633 = func.call @cc_nil_value() : () -> i64
      %1634 = func.call @cc_cons(%1632, %1633) : (i64, i64) -> i64
      %1635 = func.call @cc_values_pack(%1634) : (i64) -> i64
      func.call @stack_push_pointer(%1632) : (i64) -> ()
      %1636 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1636) : (i64) -> ()
      %1637 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1637) : (i64) -> ()
      %1638 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1638) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1639 = func.call @stack_pop_pointer() : () -> i64
      %1640 = func.call @stack_pop_pointer() : () -> i64
      %1641 = func.call @cc_cons(%1640, %1639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1644) : (i64) -> ()
      %1645 = func.call @stack_pop_pointer() : () -> i64
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = func.call @cc_cons(%1645, %1646) : (i64, i64) -> i64
      %1648 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1649 = arith.constant 5 : i64
      %1650 = func.call @cc_make_string(%1648, %1649) : (!llvm.ptr, i64) -> i64
      %1651 = func.call @cc_nil_value() : () -> i64
      %1652 = func.call @cc_intern(%1650, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_nil_value() : () -> i64
      %1654 = func.call @cc_cons(%1652, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_values_pack(%1654) : (i64) -> i64
      %1656 = func.call @cc_cons(%1652, %1647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1656) : (i64) -> ()
      %1657 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1658 = arith.constant 10 : i64
      %1659 = func.call @cc_make_string(%1657, %1658) : (!llvm.ptr, i64) -> i64
      %1660 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1661 = arith.constant 7 : i64
      %1662 = func.call @cc_make_string(%1660, %1661) : (!llvm.ptr, i64) -> i64
      %1663 = func.call @cc_intern(%1659, %1662) : (i64, i64) -> i64
      %1664 = func.call @cc_nil_value() : () -> i64
      %1665 = func.call @cc_cons(%1663, %1664) : (i64, i64) -> i64
      %1666 = func.call @cc_values_pack(%1665) : (i64) -> i64
      func.call @stack_push_pointer(%1663) : (i64) -> ()
      %1667 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1667) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1668 = func.call @stack_pop_pointer() : () -> i64
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = func.call @cc_cons(%1669, %1668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1670) : (i64) -> ()
      %1671 = func.call @stack_pop_pointer() : () -> i64
      %1672 = func.call @stack_pop_pointer() : () -> i64
      %1673 = func.call @cc_cons(%1672, %1671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1673) : (i64) -> ()
      %1674 = func.call @stack_pop_pointer() : () -> i64
      %1675 = func.call @stack_pop_pointer() : () -> i64
      %1676 = func.call @cc_cons(%1675, %1674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1676) : (i64) -> ()
      %1677 = func.call @stack_pop_pointer() : () -> i64
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @cc_cons(%1678, %1677) : (i64, i64) -> i64
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
      %1740 = arith.constant 15079495958535 : i64
      %1741 = arith.constant 0 : i64
      %1742 = func.call @cc_make_closure(%1740, %1741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1742) : (i64) -> ()
      %1743 = func.call @stack_pop_pointer() : () -> i64
      %1744 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1745 = arith.constant 5 : i64
      %1746 = func.call @cc_make_string(%1744, %1745) : (!llvm.ptr, i64) -> i64
      %1747 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1748 = arith.constant 11 : i64
      %1749 = func.call @cc_make_string(%1747, %1748) : (!llvm.ptr, i64) -> i64
      %1750 = func.call @cc_intern(%1746, %1749) : (i64, i64) -> i64
      %1751 = func.call @cc_nil_value() : () -> i64
      %1752 = func.call @cc_cons(%1750, %1751) : (i64, i64) -> i64
      %1753 = func.call @cc_values_pack(%1752) : (i64) -> i64
      func.call @stack_push_pointer(%1750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1754 = func.call @stack_pop_pointer() : () -> i64
      %1755 = func.call @stack_pop_pointer() : () -> i64
      %1756 = func.call @cc_cons(%1755, %1754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1756) : (i64) -> ()
      %1757 = func.call @stack_pop_pointer() : () -> i64
      %1758 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1759 = arith.constant 11 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      %1761 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1762 = arith.constant 7 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      %1764 = func.call @cc_intern(%1760, %1763) : (i64, i64) -> i64
      %1765 = func.call @cc_nil_value() : () -> i64
      %1766 = func.call @cc_cons(%1764, %1765) : (i64, i64) -> i64
      %1767 = func.call @cc_values_pack(%1766) : (i64) -> i64
      func.call @stack_push_pointer(%1764) : (i64) -> ()
      %1768 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1769 = func.call @stack_pop_pointer() : () -> i64
      %1770 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1771 = arith.constant 4 : i64
      %1772 = func.call @cc_make_string(%1770, %1771) : (!llvm.ptr, i64) -> i64
      %1773 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1774 = arith.constant 7 : i64
      %1775 = func.call @cc_make_string(%1773, %1774) : (!llvm.ptr, i64) -> i64
      %1776 = func.call @cc_intern(%1772, %1775) : (i64, i64) -> i64
      %1777 = func.call @cc_nil_value() : () -> i64
      %1778 = func.call @cc_cons(%1776, %1777) : (i64, i64) -> i64
      %1779 = func.call @cc_values_pack(%1778) : (i64) -> i64
      func.call @stack_push_pointer(%1776) : (i64) -> ()
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1782 = arith.constant 5 : i64
      %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
      %1784 = func.call @cc_nil_value() : () -> i64
      %1785 = func.call @cc_intern(%1783, %1784) : (i64, i64) -> i64
      %1786 = func.call @cc_nil_value() : () -> i64
      %1787 = func.call @cc_cons(%1785, %1786) : (i64, i64) -> i64
      %1788 = func.call @cc_values_pack(%1787) : (i64) -> i64
      func.call @stack_push_pointer(%1785) : (i64) -> ()
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @cc_nil_value() : () -> i64
      %1791 = func.call @cc_errorp(%1617) : (i64) -> i64
      %1792 = arith.cmpi ne, %1791, %1790 : i64
      %1793 = arith.cmpi eq, %1790, %1790 : i64
      %1794 = arith.andi %1792, %1793 : i1
      %1795 = scf.if %1794 -> (i64) {
        scf.yield %1617 : i64
      } else {
        scf.yield %1790 : i64
      }
      %1796 = func.call @cc_errorp(%1686) : (i64) -> i64
      %1797 = arith.cmpi ne, %1796, %1790 : i64
      %1798 = arith.cmpi eq, %1795, %1790 : i64
      %1799 = arith.andi %1797, %1798 : i1
      %1800 = scf.if %1799 -> (i64) {
        scf.yield %1686 : i64
      } else {
        scf.yield %1795 : i64
      }
      %1801 = func.call @cc_errorp(%1743) : (i64) -> i64
      %1802 = arith.cmpi ne, %1801, %1790 : i64
      %1803 = arith.cmpi eq, %1800, %1790 : i64
      %1804 = arith.andi %1802, %1803 : i1
      %1805 = scf.if %1804 -> (i64) {
        scf.yield %1743 : i64
      } else {
        scf.yield %1800 : i64
      }
      %1806 = func.call @cc_errorp(%1757) : (i64) -> i64
      %1807 = arith.cmpi ne, %1806, %1790 : i64
      %1808 = arith.cmpi eq, %1805, %1790 : i64
      %1809 = arith.andi %1807, %1808 : i1
      %1810 = scf.if %1809 -> (i64) {
        scf.yield %1757 : i64
      } else {
        scf.yield %1805 : i64
      }
      %1811 = func.call @cc_errorp(%1768) : (i64) -> i64
      %1812 = arith.cmpi ne, %1811, %1790 : i64
      %1813 = arith.cmpi eq, %1810, %1790 : i64
      %1814 = arith.andi %1812, %1813 : i1
      %1815 = scf.if %1814 -> (i64) {
        scf.yield %1768 : i64
      } else {
        scf.yield %1810 : i64
      }
      %1816 = func.call @cc_errorp(%1769) : (i64) -> i64
      %1817 = arith.cmpi ne, %1816, %1790 : i64
      %1818 = arith.cmpi eq, %1815, %1790 : i64
      %1819 = arith.andi %1817, %1818 : i1
      %1820 = scf.if %1819 -> (i64) {
        scf.yield %1769 : i64
      } else {
        scf.yield %1815 : i64
      }
      %1821 = func.call @cc_errorp(%1780) : (i64) -> i64
      %1822 = arith.cmpi ne, %1821, %1790 : i64
      %1823 = arith.cmpi eq, %1820, %1790 : i64
      %1824 = arith.andi %1822, %1823 : i1
      %1825 = scf.if %1824 -> (i64) {
        scf.yield %1780 : i64
      } else {
        scf.yield %1820 : i64
      }
      %1826 = func.call @cc_errorp(%1789) : (i64) -> i64
      %1827 = arith.cmpi ne, %1826, %1790 : i64
      %1828 = arith.cmpi eq, %1825, %1790 : i64
      %1829 = arith.andi %1827, %1828 : i1
      %1830 = scf.if %1829 -> (i64) {
        scf.yield %1789 : i64
      } else {
        scf.yield %1825 : i64
      }
      %1831 = arith.cmpi ne, %1830, %1790 : i64
      scf.if %1831 {
        func.call @stack_push_pointer(%1830) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1617) : (i64) -> ()
        func.call @stack_push_pointer(%1686) : (i64) -> ()
        func.call @stack_push_pointer(%1743) : (i64) -> ()
        func.call @stack_push_pointer(%1757) : (i64) -> ()
        func.call @stack_push_pointer(%1768) : (i64) -> ()
        func.call @stack_push_pointer(%1769) : (i64) -> ()
        func.call @stack_push_pointer(%1780) : (i64) -> ()
        func.call @stack_push_pointer(%1789) : (i64) -> ()
        %1832 = llvm.mlir.addressof @str154 : !llvm.ptr
        %1833 = func.call @cc_make_function_ref_const(%1832) : (!llvm.ptr) -> i64
        %1834 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1833, %1834) : (i64, i64) -> ()
      }
      %1835 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1835 : i64
    }
    %1836 = func.call @cc_nil_value() : () -> i64
    %1837 = func.call @cc_errorp(%1608) : (i64) -> i64
    %1838 = arith.cmpi ne, %1837, %1836 : i64
    %1839 = scf.if %1838 -> (i64) {
      scf.yield %1608 : i64
    } else {
      %1840 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1841 = arith.constant 37 : i64
      %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
      %1843 = func.call @cc_nil_value() : () -> i64
      %1844 = func.call @cc_intern(%1842, %1843) : (i64, i64) -> i64
      %1845 = func.call @cc_nil_value() : () -> i64
      %1846 = func.call @cc_cons(%1844, %1845) : (i64, i64) -> i64
      %1847 = func.call @cc_values_pack(%1846) : (i64) -> i64
      func.call @stack_push_pointer(%1844) : (i64) -> ()
      %1848 = func.call @stack_pop_pointer() : () -> i64
      %1849 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1850 = arith.constant 6 : i64
      %1851 = func.call @cc_make_string(%1849, %1850) : (!llvm.ptr, i64) -> i64
      %1852 = func.call @cc_nil_value() : () -> i64
      %1853 = func.call @cc_intern(%1851, %1852) : (i64, i64) -> i64
      %1854 = func.call @cc_nil_value() : () -> i64
      %1855 = func.call @cc_cons(%1853, %1854) : (i64, i64) -> i64
      %1856 = func.call @cc_values_pack(%1855) : (i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      %1857 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1858 = arith.constant 10 : i64
      %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
      %1860 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1861 = arith.constant 11 : i64
      %1862 = func.call @cc_make_string(%1860, %1861) : (!llvm.ptr, i64) -> i64
      %1863 = func.call @cc_intern(%1859, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_nil_value() : () -> i64
      %1865 = func.call @cc_cons(%1863, %1864) : (i64, i64) -> i64
      %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
      func.call @stack_push_pointer(%1863) : (i64) -> ()
      %1867 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1867) : (i64) -> ()
      %1868 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1868) : (i64) -> ()
      %1869 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1869) : (i64) -> ()
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
      %1878 = func.call @cc_cons(%1876, %1877) : (i64, i64) -> i64
      %1879 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1880 = arith.constant 5 : i64
      %1881 = func.call @cc_make_string(%1879, %1880) : (!llvm.ptr, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_intern(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_nil_value() : () -> i64
      %1885 = func.call @cc_cons(%1883, %1884) : (i64, i64) -> i64
      %1886 = func.call @cc_values_pack(%1885) : (i64) -> i64
      %1887 = func.call @cc_cons(%1883, %1878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1887) : (i64) -> ()
      %1888 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1889 = arith.constant 10 : i64
      %1890 = func.call @cc_make_string(%1888, %1889) : (!llvm.ptr, i64) -> i64
      %1891 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1892 = arith.constant 7 : i64
      %1893 = func.call @cc_make_string(%1891, %1892) : (!llvm.ptr, i64) -> i64
      %1894 = func.call @cc_intern(%1890, %1893) : (i64, i64) -> i64
      %1895 = func.call @cc_nil_value() : () -> i64
      %1896 = func.call @cc_cons(%1894, %1895) : (i64, i64) -> i64
      %1897 = func.call @cc_values_pack(%1896) : (i64) -> i64
      func.call @stack_push_pointer(%1894) : (i64) -> ()
      %1898 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1898) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1899 = func.call @stack_pop_pointer() : () -> i64
      %1900 = func.call @stack_pop_pointer() : () -> i64
      %1901 = func.call @cc_cons(%1900, %1899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1901) : (i64) -> ()
      %1902 = func.call @stack_pop_pointer() : () -> i64
      %1903 = func.call @stack_pop_pointer() : () -> i64
      %1904 = func.call @cc_cons(%1903, %1902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1904) : (i64) -> ()
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @stack_pop_pointer() : () -> i64
      %1907 = func.call @cc_cons(%1906, %1905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1907) : (i64) -> ()
      %1908 = func.call @stack_pop_pointer() : () -> i64
      %1909 = func.call @stack_pop_pointer() : () -> i64
      %1910 = func.call @cc_cons(%1909, %1908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1910) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @stack_pop_pointer() : () -> i64
      %1913 = func.call @cc_cons(%1912, %1911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1913) : (i64) -> ()
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = func.call @stack_pop_pointer() : () -> i64
      %1916 = func.call @cc_cons(%1915, %1914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1916) : (i64) -> ()
      %1917 = func.call @stack_pop_pointer() : () -> i64
      %1971 = arith.constant 15079495958536 : i64
      %1972 = arith.constant 0 : i64
      %1973 = func.call @cc_make_closure(%1971, %1972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1973) : (i64) -> ()
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %1975 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1976 = arith.constant 3 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      %1978 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1979 = arith.constant 11 : i64
      %1980 = func.call @cc_make_string(%1978, %1979) : (!llvm.ptr, i64) -> i64
      %1981 = func.call @cc_intern(%1977, %1980) : (i64, i64) -> i64
      %1982 = func.call @cc_nil_value() : () -> i64
      %1983 = func.call @cc_cons(%1981, %1982) : (i64, i64) -> i64
      %1984 = func.call @cc_values_pack(%1983) : (i64) -> i64
      func.call @stack_push_pointer(%1981) : (i64) -> ()
      %1985 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1986 = arith.constant 12 : i64
      %1987 = func.call @cc_make_string(%1985, %1986) : (!llvm.ptr, i64) -> i64
      %1988 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1989 = arith.constant 11 : i64
      %1990 = func.call @cc_make_string(%1988, %1989) : (!llvm.ptr, i64) -> i64
      %1991 = func.call @cc_intern(%1987, %1990) : (i64, i64) -> i64
      %1992 = func.call @cc_nil_value() : () -> i64
      %1993 = func.call @cc_cons(%1991, %1992) : (i64, i64) -> i64
      %1994 = func.call @cc_values_pack(%1993) : (i64) -> i64
      func.call @stack_push_pointer(%1991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1995 = func.call @stack_pop_pointer() : () -> i64
      %1996 = func.call @stack_pop_pointer() : () -> i64
      %1997 = func.call @cc_cons(%1996, %1995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1997) : (i64) -> ()
      %1998 = func.call @stack_pop_pointer() : () -> i64
      %1999 = func.call @stack_pop_pointer() : () -> i64
      %2000 = func.call @cc_cons(%1999, %1998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2000) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2001 = func.call @stack_pop_pointer() : () -> i64
      %2002 = func.call @stack_pop_pointer() : () -> i64
      %2003 = func.call @cc_cons(%2002, %2001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2003) : (i64) -> ()
      %2004 = func.call @stack_pop_pointer() : () -> i64
      %2005 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2006 = arith.constant 11 : i64
      %2007 = func.call @cc_make_string(%2005, %2006) : (!llvm.ptr, i64) -> i64
      %2008 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2009 = arith.constant 7 : i64
      %2010 = func.call @cc_make_string(%2008, %2009) : (!llvm.ptr, i64) -> i64
      %2011 = func.call @cc_intern(%2007, %2010) : (i64, i64) -> i64
      %2012 = func.call @cc_nil_value() : () -> i64
      %2013 = func.call @cc_cons(%2011, %2012) : (i64, i64) -> i64
      %2014 = func.call @cc_values_pack(%2013) : (i64) -> i64
      func.call @stack_push_pointer(%2011) : (i64) -> ()
      %2015 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2016 = func.call @stack_pop_pointer() : () -> i64
      %2017 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2018 = arith.constant 4 : i64
      %2019 = func.call @cc_make_string(%2017, %2018) : (!llvm.ptr, i64) -> i64
      %2020 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2021 = arith.constant 7 : i64
      %2022 = func.call @cc_make_string(%2020, %2021) : (!llvm.ptr, i64) -> i64
      %2023 = func.call @cc_intern(%2019, %2022) : (i64, i64) -> i64
      %2024 = func.call @cc_nil_value() : () -> i64
      %2025 = func.call @cc_cons(%2023, %2024) : (i64, i64) -> i64
      %2026 = func.call @cc_values_pack(%2025) : (i64) -> i64
      func.call @stack_push_pointer(%2023) : (i64) -> ()
      %2027 = func.call @stack_pop_pointer() : () -> i64
      %2028 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2029 = arith.constant 5 : i64
      %2030 = func.call @cc_make_string(%2028, %2029) : (!llvm.ptr, i64) -> i64
      %2031 = func.call @cc_nil_value() : () -> i64
      %2032 = func.call @cc_intern(%2030, %2031) : (i64, i64) -> i64
      %2033 = func.call @cc_nil_value() : () -> i64
      %2034 = func.call @cc_cons(%2032, %2033) : (i64, i64) -> i64
      %2035 = func.call @cc_values_pack(%2034) : (i64) -> i64
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = func.call @cc_nil_value() : () -> i64
      %2038 = func.call @cc_errorp(%1848) : (i64) -> i64
      %2039 = arith.cmpi ne, %2038, %2037 : i64
      %2040 = arith.cmpi eq, %2037, %2037 : i64
      %2041 = arith.andi %2039, %2040 : i1
      %2042 = scf.if %2041 -> (i64) {
        scf.yield %1848 : i64
      } else {
        scf.yield %2037 : i64
      }
      %2043 = func.call @cc_errorp(%1917) : (i64) -> i64
      %2044 = arith.cmpi ne, %2043, %2037 : i64
      %2045 = arith.cmpi eq, %2042, %2037 : i64
      %2046 = arith.andi %2044, %2045 : i1
      %2047 = scf.if %2046 -> (i64) {
        scf.yield %1917 : i64
      } else {
        scf.yield %2042 : i64
      }
      %2048 = func.call @cc_errorp(%1974) : (i64) -> i64
      %2049 = arith.cmpi ne, %2048, %2037 : i64
      %2050 = arith.cmpi eq, %2047, %2037 : i64
      %2051 = arith.andi %2049, %2050 : i1
      %2052 = scf.if %2051 -> (i64) {
        scf.yield %1974 : i64
      } else {
        scf.yield %2047 : i64
      }
      %2053 = func.call @cc_errorp(%2004) : (i64) -> i64
      %2054 = arith.cmpi ne, %2053, %2037 : i64
      %2055 = arith.cmpi eq, %2052, %2037 : i64
      %2056 = arith.andi %2054, %2055 : i1
      %2057 = scf.if %2056 -> (i64) {
        scf.yield %2004 : i64
      } else {
        scf.yield %2052 : i64
      }
      %2058 = func.call @cc_errorp(%2015) : (i64) -> i64
      %2059 = arith.cmpi ne, %2058, %2037 : i64
      %2060 = arith.cmpi eq, %2057, %2037 : i64
      %2061 = arith.andi %2059, %2060 : i1
      %2062 = scf.if %2061 -> (i64) {
        scf.yield %2015 : i64
      } else {
        scf.yield %2057 : i64
      }
      %2063 = func.call @cc_errorp(%2016) : (i64) -> i64
      %2064 = arith.cmpi ne, %2063, %2037 : i64
      %2065 = arith.cmpi eq, %2062, %2037 : i64
      %2066 = arith.andi %2064, %2065 : i1
      %2067 = scf.if %2066 -> (i64) {
        scf.yield %2016 : i64
      } else {
        scf.yield %2062 : i64
      }
      %2068 = func.call @cc_errorp(%2027) : (i64) -> i64
      %2069 = arith.cmpi ne, %2068, %2037 : i64
      %2070 = arith.cmpi eq, %2067, %2037 : i64
      %2071 = arith.andi %2069, %2070 : i1
      %2072 = scf.if %2071 -> (i64) {
        scf.yield %2027 : i64
      } else {
        scf.yield %2067 : i64
      }
      %2073 = func.call @cc_errorp(%2036) : (i64) -> i64
      %2074 = arith.cmpi ne, %2073, %2037 : i64
      %2075 = arith.cmpi eq, %2072, %2037 : i64
      %2076 = arith.andi %2074, %2075 : i1
      %2077 = scf.if %2076 -> (i64) {
        scf.yield %2036 : i64
      } else {
        scf.yield %2072 : i64
      }
      %2078 = arith.cmpi ne, %2077, %2037 : i64
      scf.if %2078 {
        func.call @stack_push_pointer(%2077) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1848) : (i64) -> ()
        func.call @stack_push_pointer(%1917) : (i64) -> ()
        func.call @stack_push_pointer(%1974) : (i64) -> ()
        func.call @stack_push_pointer(%2004) : (i64) -> ()
        func.call @stack_push_pointer(%2015) : (i64) -> ()
        func.call @stack_push_pointer(%2016) : (i64) -> ()
        func.call @stack_push_pointer(%2027) : (i64) -> ()
        func.call @stack_push_pointer(%2036) : (i64) -> ()
        %2079 = llvm.mlir.addressof @str174 : !llvm.ptr
        %2080 = func.call @cc_make_function_ref_const(%2079) : (!llvm.ptr) -> i64
        %2081 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2080, %2081) : (i64, i64) -> ()
      }
      %2082 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2082 : i64
    }
    %2083 = func.call @cc_nil_value() : () -> i64
    %2084 = func.call @cc_errorp(%1839) : (i64) -> i64
    %2085 = arith.cmpi ne, %2084, %2083 : i64
    %2086 = scf.if %2085 -> (i64) {
      scf.yield %1839 : i64
    } else {
      %2087 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2088 = arith.constant 45 : i64
      %2089 = func.call @cc_make_string(%2087, %2088) : (!llvm.ptr, i64) -> i64
      %2090 = func.call @cc_nil_value() : () -> i64
      %2091 = func.call @cc_intern(%2089, %2090) : (i64, i64) -> i64
      %2092 = func.call @cc_nil_value() : () -> i64
      %2093 = func.call @cc_cons(%2091, %2092) : (i64, i64) -> i64
      %2094 = func.call @cc_values_pack(%2093) : (i64) -> i64
      func.call @stack_push_pointer(%2091) : (i64) -> ()
      %2095 = func.call @stack_pop_pointer() : () -> i64
      %2096 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2097 = arith.constant 6 : i64
      %2098 = func.call @cc_make_string(%2096, %2097) : (!llvm.ptr, i64) -> i64
      %2099 = func.call @cc_nil_value() : () -> i64
      %2100 = func.call @cc_intern(%2098, %2099) : (i64, i64) -> i64
      %2101 = func.call @cc_nil_value() : () -> i64
      %2102 = func.call @cc_cons(%2100, %2101) : (i64, i64) -> i64
      %2103 = func.call @cc_values_pack(%2102) : (i64) -> i64
      func.call @stack_push_pointer(%2100) : (i64) -> ()
      %2104 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2105 = arith.constant 10 : i64
      %2106 = func.call @cc_make_string(%2104, %2105) : (!llvm.ptr, i64) -> i64
      %2107 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2108 = arith.constant 11 : i64
      %2109 = func.call @cc_make_string(%2107, %2108) : (!llvm.ptr, i64) -> i64
      %2110 = func.call @cc_intern(%2106, %2109) : (i64, i64) -> i64
      %2111 = func.call @cc_nil_value() : () -> i64
      %2112 = func.call @cc_cons(%2110, %2111) : (i64, i64) -> i64
      %2113 = func.call @cc_values_pack(%2112) : (i64) -> i64
      func.call @stack_push_pointer(%2110) : (i64) -> ()
      %2114 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2114) : (i64) -> ()
      %2115 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2115) : (i64) -> ()
      %2116 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2116) : (i64) -> ()
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
      %2125 = func.call @cc_cons(%2123, %2124) : (i64, i64) -> i64
      %2126 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2127 = arith.constant 5 : i64
      %2128 = func.call @cc_make_string(%2126, %2127) : (!llvm.ptr, i64) -> i64
      %2129 = func.call @cc_nil_value() : () -> i64
      %2130 = func.call @cc_intern(%2128, %2129) : (i64, i64) -> i64
      %2131 = func.call @cc_nil_value() : () -> i64
      %2132 = func.call @cc_cons(%2130, %2131) : (i64, i64) -> i64
      %2133 = func.call @cc_values_pack(%2132) : (i64) -> i64
      %2134 = func.call @cc_cons(%2130, %2125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2134) : (i64) -> ()
      %2135 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2136 = arith.constant 10 : i64
      %2137 = func.call @cc_make_string(%2135, %2136) : (!llvm.ptr, i64) -> i64
      %2138 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2139 = arith.constant 7 : i64
      %2140 = func.call @cc_make_string(%2138, %2139) : (!llvm.ptr, i64) -> i64
      %2141 = func.call @cc_intern(%2137, %2140) : (i64, i64) -> i64
      %2142 = func.call @cc_nil_value() : () -> i64
      %2143 = func.call @cc_cons(%2141, %2142) : (i64, i64) -> i64
      %2144 = func.call @cc_values_pack(%2143) : (i64) -> i64
      func.call @stack_push_pointer(%2141) : (i64) -> ()
      %2145 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2145) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2146 = func.call @stack_pop_pointer() : () -> i64
      %2147 = func.call @stack_pop_pointer() : () -> i64
      %2148 = func.call @cc_cons(%2147, %2146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2148) : (i64) -> ()
      %2149 = func.call @stack_pop_pointer() : () -> i64
      %2150 = func.call @stack_pop_pointer() : () -> i64
      %2151 = func.call @cc_cons(%2150, %2149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2151) : (i64) -> ()
      %2152 = func.call @stack_pop_pointer() : () -> i64
      %2153 = func.call @stack_pop_pointer() : () -> i64
      %2154 = func.call @cc_cons(%2153, %2152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2154) : (i64) -> ()
      %2155 = func.call @stack_pop_pointer() : () -> i64
      %2156 = func.call @stack_pop_pointer() : () -> i64
      %2157 = func.call @cc_cons(%2156, %2155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2157) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2158 = func.call @stack_pop_pointer() : () -> i64
      %2159 = func.call @stack_pop_pointer() : () -> i64
      %2160 = func.call @cc_cons(%2159, %2158) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2160) : (i64) -> ()
      %2161 = func.call @stack_pop_pointer() : () -> i64
      %2162 = func.call @stack_pop_pointer() : () -> i64
      %2163 = func.call @cc_cons(%2162, %2161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2163) : (i64) -> ()
      %2164 = func.call @stack_pop_pointer() : () -> i64
      %2218 = arith.constant 15079495958537 : i64
      %2219 = arith.constant 0 : i64
      %2220 = func.call @cc_make_closure(%2218, %2219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2220) : (i64) -> ()
      %2221 = func.call @stack_pop_pointer() : () -> i64
      %2222 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2223 = arith.constant 3 : i64
      %2224 = func.call @cc_make_string(%2222, %2223) : (!llvm.ptr, i64) -> i64
      %2225 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2226 = arith.constant 11 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = func.call @cc_intern(%2224, %2227) : (i64, i64) -> i64
      %2229 = func.call @cc_nil_value() : () -> i64
      %2230 = func.call @cc_cons(%2228, %2229) : (i64, i64) -> i64
      %2231 = func.call @cc_values_pack(%2230) : (i64) -> i64
      func.call @stack_push_pointer(%2228) : (i64) -> ()
      %2232 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2233 = arith.constant 13 : i64
      %2234 = func.call @cc_make_string(%2232, %2233) : (!llvm.ptr, i64) -> i64
      %2235 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2236 = arith.constant 11 : i64
      %2237 = func.call @cc_make_string(%2235, %2236) : (!llvm.ptr, i64) -> i64
      %2238 = func.call @cc_intern(%2234, %2237) : (i64, i64) -> i64
      %2239 = func.call @cc_nil_value() : () -> i64
      %2240 = func.call @cc_cons(%2238, %2239) : (i64, i64) -> i64
      %2241 = func.call @cc_values_pack(%2240) : (i64) -> i64
      func.call @stack_push_pointer(%2238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2242 = func.call @stack_pop_pointer() : () -> i64
      %2243 = func.call @stack_pop_pointer() : () -> i64
      %2244 = func.call @cc_cons(%2243, %2242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2244) : (i64) -> ()
      %2245 = func.call @stack_pop_pointer() : () -> i64
      %2246 = func.call @stack_pop_pointer() : () -> i64
      %2247 = func.call @cc_cons(%2246, %2245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2247) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2248 = func.call @stack_pop_pointer() : () -> i64
      %2249 = func.call @stack_pop_pointer() : () -> i64
      %2250 = func.call @cc_cons(%2249, %2248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2250) : (i64) -> ()
      %2251 = func.call @stack_pop_pointer() : () -> i64
      %2252 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2253 = arith.constant 11 : i64
      %2254 = func.call @cc_make_string(%2252, %2253) : (!llvm.ptr, i64) -> i64
      %2255 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2256 = arith.constant 7 : i64
      %2257 = func.call @cc_make_string(%2255, %2256) : (!llvm.ptr, i64) -> i64
      %2258 = func.call @cc_intern(%2254, %2257) : (i64, i64) -> i64
      %2259 = func.call @cc_nil_value() : () -> i64
      %2260 = func.call @cc_cons(%2258, %2259) : (i64, i64) -> i64
      %2261 = func.call @cc_values_pack(%2260) : (i64) -> i64
      func.call @stack_push_pointer(%2258) : (i64) -> ()
      %2262 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2263 = func.call @stack_pop_pointer() : () -> i64
      %2264 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2265 = arith.constant 4 : i64
      %2266 = func.call @cc_make_string(%2264, %2265) : (!llvm.ptr, i64) -> i64
      %2267 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2268 = arith.constant 7 : i64
      %2269 = func.call @cc_make_string(%2267, %2268) : (!llvm.ptr, i64) -> i64
      %2270 = func.call @cc_intern(%2266, %2269) : (i64, i64) -> i64
      %2271 = func.call @cc_nil_value() : () -> i64
      %2272 = func.call @cc_cons(%2270, %2271) : (i64, i64) -> i64
      %2273 = func.call @cc_values_pack(%2272) : (i64) -> i64
      func.call @stack_push_pointer(%2270) : (i64) -> ()
      %2274 = func.call @stack_pop_pointer() : () -> i64
      %2275 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2276 = arith.constant 5 : i64
      %2277 = func.call @cc_make_string(%2275, %2276) : (!llvm.ptr, i64) -> i64
      %2278 = func.call @cc_nil_value() : () -> i64
      %2279 = func.call @cc_intern(%2277, %2278) : (i64, i64) -> i64
      %2280 = func.call @cc_nil_value() : () -> i64
      %2281 = func.call @cc_cons(%2279, %2280) : (i64, i64) -> i64
      %2282 = func.call @cc_values_pack(%2281) : (i64) -> i64
      func.call @stack_push_pointer(%2279) : (i64) -> ()
      %2283 = func.call @stack_pop_pointer() : () -> i64
      %2284 = func.call @cc_nil_value() : () -> i64
      %2285 = func.call @cc_errorp(%2095) : (i64) -> i64
      %2286 = arith.cmpi ne, %2285, %2284 : i64
      %2287 = arith.cmpi eq, %2284, %2284 : i64
      %2288 = arith.andi %2286, %2287 : i1
      %2289 = scf.if %2288 -> (i64) {
        scf.yield %2095 : i64
      } else {
        scf.yield %2284 : i64
      }
      %2290 = func.call @cc_errorp(%2164) : (i64) -> i64
      %2291 = arith.cmpi ne, %2290, %2284 : i64
      %2292 = arith.cmpi eq, %2289, %2284 : i64
      %2293 = arith.andi %2291, %2292 : i1
      %2294 = scf.if %2293 -> (i64) {
        scf.yield %2164 : i64
      } else {
        scf.yield %2289 : i64
      }
      %2295 = func.call @cc_errorp(%2221) : (i64) -> i64
      %2296 = arith.cmpi ne, %2295, %2284 : i64
      %2297 = arith.cmpi eq, %2294, %2284 : i64
      %2298 = arith.andi %2296, %2297 : i1
      %2299 = scf.if %2298 -> (i64) {
        scf.yield %2221 : i64
      } else {
        scf.yield %2294 : i64
      }
      %2300 = func.call @cc_errorp(%2251) : (i64) -> i64
      %2301 = arith.cmpi ne, %2300, %2284 : i64
      %2302 = arith.cmpi eq, %2299, %2284 : i64
      %2303 = arith.andi %2301, %2302 : i1
      %2304 = scf.if %2303 -> (i64) {
        scf.yield %2251 : i64
      } else {
        scf.yield %2299 : i64
      }
      %2305 = func.call @cc_errorp(%2262) : (i64) -> i64
      %2306 = arith.cmpi ne, %2305, %2284 : i64
      %2307 = arith.cmpi eq, %2304, %2284 : i64
      %2308 = arith.andi %2306, %2307 : i1
      %2309 = scf.if %2308 -> (i64) {
        scf.yield %2262 : i64
      } else {
        scf.yield %2304 : i64
      }
      %2310 = func.call @cc_errorp(%2263) : (i64) -> i64
      %2311 = arith.cmpi ne, %2310, %2284 : i64
      %2312 = arith.cmpi eq, %2309, %2284 : i64
      %2313 = arith.andi %2311, %2312 : i1
      %2314 = scf.if %2313 -> (i64) {
        scf.yield %2263 : i64
      } else {
        scf.yield %2309 : i64
      }
      %2315 = func.call @cc_errorp(%2274) : (i64) -> i64
      %2316 = arith.cmpi ne, %2315, %2284 : i64
      %2317 = arith.cmpi eq, %2314, %2284 : i64
      %2318 = arith.andi %2316, %2317 : i1
      %2319 = scf.if %2318 -> (i64) {
        scf.yield %2274 : i64
      } else {
        scf.yield %2314 : i64
      }
      %2320 = func.call @cc_errorp(%2283) : (i64) -> i64
      %2321 = arith.cmpi ne, %2320, %2284 : i64
      %2322 = arith.cmpi eq, %2319, %2284 : i64
      %2323 = arith.andi %2321, %2322 : i1
      %2324 = scf.if %2323 -> (i64) {
        scf.yield %2283 : i64
      } else {
        scf.yield %2319 : i64
      }
      %2325 = arith.cmpi ne, %2324, %2284 : i64
      scf.if %2325 {
        func.call @stack_push_pointer(%2324) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2095) : (i64) -> ()
        func.call @stack_push_pointer(%2164) : (i64) -> ()
        func.call @stack_push_pointer(%2221) : (i64) -> ()
        func.call @stack_push_pointer(%2251) : (i64) -> ()
        func.call @stack_push_pointer(%2262) : (i64) -> ()
        func.call @stack_push_pointer(%2263) : (i64) -> ()
        func.call @stack_push_pointer(%2274) : (i64) -> ()
        func.call @stack_push_pointer(%2283) : (i64) -> ()
        %2326 = llvm.mlir.addressof @str194 : !llvm.ptr
        %2327 = func.call @cc_make_function_ref_const(%2326) : (!llvm.ptr) -> i64
        %2328 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2327, %2328) : (i64, i64) -> ()
      }
      %2329 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2329 : i64
    }
    %2330 = func.call @cc_nil_value() : () -> i64
    %2331 = func.call @cc_errorp(%2086) : (i64) -> i64
    %2332 = arith.cmpi ne, %2331, %2330 : i64
    %2333 = scf.if %2332 -> (i64) {
      scf.yield %2086 : i64
    } else {
      %2334 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2335 = arith.constant 13 : i64
      %2336 = func.call @cc_make_string(%2334, %2335) : (!llvm.ptr, i64) -> i64
      %2337 = func.call @cc_nil_value() : () -> i64
      %2338 = func.call @cc_intern(%2336, %2337) : (i64, i64) -> i64
      %2339 = func.call @cc_nil_value() : () -> i64
      %2340 = func.call @cc_cons(%2338, %2339) : (i64, i64) -> i64
      %2341 = func.call @cc_values_pack(%2340) : (i64) -> i64
      func.call @stack_push_pointer(%2338) : (i64) -> ()
      %2342 = func.call @stack_pop_pointer() : () -> i64
      %2343 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2344 = arith.constant 12 : i64
      %2345 = func.call @cc_make_string(%2343, %2344) : (!llvm.ptr, i64) -> i64
      %2346 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2347 = arith.constant 11 : i64
      %2348 = func.call @cc_make_string(%2346, %2347) : (!llvm.ptr, i64) -> i64
      %2349 = func.call @cc_intern(%2345, %2348) : (i64, i64) -> i64
      %2350 = func.call @cc_nil_value() : () -> i64
      %2351 = func.call @cc_cons(%2349, %2350) : (i64, i64) -> i64
      %2352 = func.call @cc_values_pack(%2351) : (i64) -> i64
      func.call @stack_push_pointer(%2349) : (i64) -> ()
      %2353 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2353) : (i64) -> ()
      %2354 = func.call @stack_pop_pointer() : () -> i64
      %2355 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2355) : (i64) -> ()
      %2356 = func.call @stack_pop_pointer() : () -> i64
      %2357 = func.call @cc_nil_value() : () -> i64
      %2358 = func.call @cc_errorp(%2354) : (i64) -> i64
      %2359 = arith.cmpi ne, %2358, %2357 : i64
      %2360 = arith.cmpi eq, %2357, %2357 : i64
      %2361 = arith.andi %2359, %2360 : i1
      %2362 = scf.if %2361 -> (i64) {
        scf.yield %2354 : i64
      } else {
        scf.yield %2357 : i64
      }
      %2363 = func.call @cc_errorp(%2356) : (i64) -> i64
      %2364 = arith.cmpi ne, %2363, %2357 : i64
      %2365 = arith.cmpi eq, %2362, %2357 : i64
      %2366 = arith.andi %2364, %2365 : i1
      %2367 = scf.if %2366 -> (i64) {
        scf.yield %2356 : i64
      } else {
        scf.yield %2362 : i64
      }
      %2368 = arith.cmpi ne, %2367, %2357 : i64
      scf.if %2368 {
        func.call @stack_push_pointer(%2367) : (i64) -> ()
      } else {
        %2369 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2369) : (i64) -> ()
        func.call @stack_push_pointer(%2356) : (i64) -> ()
        %2370 = func.call @stack_pop_pointer() : () -> i64
        %2371 = func.call @stack_pop_pointer() : () -> i64
        %2372 = func.call @cc_cons(%2370, %2371) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2372) : (i64) -> ()
        func.call @stack_push_pointer(%2354) : (i64) -> ()
        %2373 = func.call @stack_pop_pointer() : () -> i64
        %2374 = func.call @stack_pop_pointer() : () -> i64
        %2375 = func.call @cc_cons(%2373, %2374) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2375) : (i64) -> ()
      }
      %2376 = func.call @stack_pop_pointer() : () -> i64
      %2377 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2378 = arith.constant 16 : i64
      %2379 = func.call @cc_make_string(%2377, %2378) : (!llvm.ptr, i64) -> i64
      %2380 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2381 = arith.constant 7 : i64
      %2382 = func.call @cc_make_string(%2380, %2381) : (!llvm.ptr, i64) -> i64
      %2383 = func.call @cc_intern(%2379, %2382) : (i64, i64) -> i64
      %2384 = func.call @cc_nil_value() : () -> i64
      %2385 = func.call @cc_cons(%2383, %2384) : (i64, i64) -> i64
      %2386 = func.call @cc_values_pack(%2385) : (i64) -> i64
      func.call @stack_push_pointer(%2383) : (i64) -> ()
      %2387 = func.call @stack_pop_pointer() : () -> i64
      %2388 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2388) : (i64) -> ()
      %2389 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2389) : (i64) -> ()
      %2390 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2390) : (i64) -> ()
      %2391 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%2391) : (i64) -> ()
      %2392 = arith.constant 4 : i64
      %2393 = func.call @cc_box_fixnum(%2392) : (i64) -> i64
      %2394 = func.call @cc_make_vector(%2393) : (i64) -> i64
      %2395 = func.call @stack_pop_pointer() : () -> i64
      %2396 = arith.constant 3 : i64
      %2397 = func.call @cc_box_fixnum(%2396) : (i64) -> i64
      %2398 = func.call @cc_svset(%2394, %2397, %2395) : (i64, i64, i64) -> i64
      %2399 = func.call @stack_pop_pointer() : () -> i64
      %2400 = arith.constant 2 : i64
      %2401 = func.call @cc_box_fixnum(%2400) : (i64) -> i64
      %2402 = func.call @cc_svset(%2394, %2401, %2399) : (i64, i64, i64) -> i64
      %2403 = func.call @stack_pop_pointer() : () -> i64
      %2404 = arith.constant 1 : i64
      %2405 = func.call @cc_box_fixnum(%2404) : (i64) -> i64
      %2406 = func.call @cc_svset(%2394, %2405, %2403) : (i64, i64, i64) -> i64
      %2407 = func.call @stack_pop_pointer() : () -> i64
      %2408 = arith.constant 0 : i64
      %2409 = func.call @cc_box_fixnum(%2408) : (i64) -> i64
      %2410 = func.call @cc_svset(%2394, %2409, %2407) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%2394) : (i64) -> ()
      %2411 = func.call @stack_pop_pointer() : () -> i64
      %2412 = func.call @cc_nil_value() : () -> i64
      %2413 = func.call @cc_errorp(%2376) : (i64) -> i64
      %2414 = arith.cmpi ne, %2413, %2412 : i64
      %2415 = arith.cmpi eq, %2412, %2412 : i64
      %2416 = arith.andi %2414, %2415 : i1
      %2417 = scf.if %2416 -> (i64) {
        scf.yield %2376 : i64
      } else {
        scf.yield %2412 : i64
      }
      %2418 = func.call @cc_errorp(%2387) : (i64) -> i64
      %2419 = arith.cmpi ne, %2418, %2412 : i64
      %2420 = arith.cmpi eq, %2417, %2412 : i64
      %2421 = arith.andi %2419, %2420 : i1
      %2422 = scf.if %2421 -> (i64) {
        scf.yield %2387 : i64
      } else {
        scf.yield %2417 : i64
      }
      %2423 = func.call @cc_errorp(%2411) : (i64) -> i64
      %2424 = arith.cmpi ne, %2423, %2412 : i64
      %2425 = arith.cmpi eq, %2422, %2412 : i64
      %2426 = arith.andi %2424, %2425 : i1
      %2427 = scf.if %2426 -> (i64) {
        scf.yield %2411 : i64
      } else {
        scf.yield %2422 : i64
      }
      %2428 = arith.cmpi ne, %2427, %2412 : i64
      scf.if %2428 {
        func.call @stack_push_pointer(%2427) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2376) : (i64) -> ()
        func.call @stack_push_pointer(%2387) : (i64) -> ()
        func.call @stack_push_pointer(%2411) : (i64) -> ()
        %2429 = llvm.mlir.addressof @str200 : !llvm.ptr
        %2430 = func.call @cc_make_function_ref_const(%2429) : (!llvm.ptr) -> i64
        %2431 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2430, %2431) : (i64, i64) -> ()
      }
      %2432 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2432) : (i64) -> ()
      %2433 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2433) : (i64) -> ()
      %2434 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2434) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2435 = func.call @stack_pop_pointer() : () -> i64
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @cc_cons(%2436, %2435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2437) : (i64) -> ()
      %2438 = func.call @stack_pop_pointer() : () -> i64
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @cc_cons(%2439, %2438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2440) : (i64) -> ()
      %2441 = func.call @stack_pop_pointer() : () -> i64
      %2442 = func.call @stack_pop_pointer() : () -> i64
      %2443 = func.call @cc_cons(%2441, %2442) : (i64, i64) -> i64
      %2444 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2445 = arith.constant 5 : i64
      %2446 = func.call @cc_make_string(%2444, %2445) : (!llvm.ptr, i64) -> i64
      %2447 = func.call @cc_nil_value() : () -> i64
      %2448 = func.call @cc_intern(%2446, %2447) : (i64, i64) -> i64
      %2449 = func.call @cc_nil_value() : () -> i64
      %2450 = func.call @cc_cons(%2448, %2449) : (i64, i64) -> i64
      %2451 = func.call @cc_values_pack(%2450) : (i64) -> i64
      %2452 = func.call @cc_cons(%2448, %2443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2452) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2453 = func.call @stack_pop_pointer() : () -> i64
      %2454 = func.call @stack_pop_pointer() : () -> i64
      %2455 = func.call @cc_cons(%2454, %2453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2455) : (i64) -> ()
      %2456 = func.call @stack_pop_pointer() : () -> i64
      %2457 = func.call @stack_pop_pointer() : () -> i64
      %2458 = func.call @cc_cons(%2457, %2456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2458) : (i64) -> ()
      %2459 = func.call @stack_pop_pointer() : () -> i64
      %2460 = func.call @stack_pop_pointer() : () -> i64
      %2461 = func.call @cc_cons(%2460, %2459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2461) : (i64) -> ()
      %2462 = func.call @stack_pop_pointer() : () -> i64
      %2573 = arith.constant 15079495958538 : i64
      %2574 = arith.constant 0 : i64
      %2575 = func.call @cc_make_closure(%2573, %2574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2575) : (i64) -> ()
      %2576 = func.call @stack_pop_pointer() : () -> i64
      %2577 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2577) : (i64) -> ()
      %2578 = func.call @stack_pop_pointer() : () -> i64
      %2579 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2579) : (i64) -> ()
      %2580 = func.call @stack_pop_pointer() : () -> i64
      %2581 = func.call @cc_nil_value() : () -> i64
      %2582 = func.call @cc_errorp(%2578) : (i64) -> i64
      %2583 = arith.cmpi ne, %2582, %2581 : i64
      %2584 = arith.cmpi eq, %2581, %2581 : i64
      %2585 = arith.andi %2583, %2584 : i1
      %2586 = scf.if %2585 -> (i64) {
        scf.yield %2578 : i64
      } else {
        scf.yield %2581 : i64
      }
      %2587 = func.call @cc_errorp(%2580) : (i64) -> i64
      %2588 = arith.cmpi ne, %2587, %2581 : i64
      %2589 = arith.cmpi eq, %2586, %2581 : i64
      %2590 = arith.andi %2588, %2589 : i1
      %2591 = scf.if %2590 -> (i64) {
        scf.yield %2580 : i64
      } else {
        scf.yield %2586 : i64
      }
      %2592 = arith.cmpi ne, %2591, %2581 : i64
      scf.if %2592 {
        func.call @stack_push_pointer(%2591) : (i64) -> ()
      } else {
        %2593 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2593) : (i64) -> ()
        func.call @stack_push_pointer(%2580) : (i64) -> ()
        %2594 = func.call @stack_pop_pointer() : () -> i64
        %2595 = func.call @stack_pop_pointer() : () -> i64
        %2596 = func.call @cc_cons(%2594, %2595) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2596) : (i64) -> ()
        func.call @stack_push_pointer(%2578) : (i64) -> ()
        %2597 = func.call @stack_pop_pointer() : () -> i64
        %2598 = func.call @stack_pop_pointer() : () -> i64
        %2599 = func.call @cc_cons(%2597, %2598) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2599) : (i64) -> ()
      }
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2602 = arith.constant 16 : i64
      %2603 = func.call @cc_make_string(%2601, %2602) : (!llvm.ptr, i64) -> i64
      %2604 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2605 = arith.constant 7 : i64
      %2606 = func.call @cc_make_string(%2604, %2605) : (!llvm.ptr, i64) -> i64
      %2607 = func.call @cc_intern(%2603, %2606) : (i64, i64) -> i64
      %2608 = func.call @cc_nil_value() : () -> i64
      %2609 = func.call @cc_cons(%2607, %2608) : (i64, i64) -> i64
      %2610 = func.call @cc_values_pack(%2609) : (i64) -> i64
      func.call @stack_push_pointer(%2607) : (i64) -> ()
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2612) : (i64) -> ()
      %2613 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2613) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2614 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2614) : (i64) -> ()
      %2615 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%2615) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2616 = arith.constant 9 : i64
      %2617 = func.call @cc_box_fixnum(%2616) : (i64) -> i64
      %2618 = func.call @cc_make_vector(%2617) : (i64) -> i64
      %2619 = func.call @stack_pop_pointer() : () -> i64
      %2620 = arith.constant 8 : i64
      %2621 = func.call @cc_box_fixnum(%2620) : (i64) -> i64
      %2622 = func.call @cc_svset(%2618, %2621, %2619) : (i64, i64, i64) -> i64
      %2623 = func.call @stack_pop_pointer() : () -> i64
      %2624 = arith.constant 7 : i64
      %2625 = func.call @cc_box_fixnum(%2624) : (i64) -> i64
      %2626 = func.call @cc_svset(%2618, %2625, %2623) : (i64, i64, i64) -> i64
      %2627 = func.call @stack_pop_pointer() : () -> i64
      %2628 = arith.constant 6 : i64
      %2629 = func.call @cc_box_fixnum(%2628) : (i64) -> i64
      %2630 = func.call @cc_svset(%2618, %2629, %2627) : (i64, i64, i64) -> i64
      %2631 = func.call @stack_pop_pointer() : () -> i64
      %2632 = arith.constant 5 : i64
      %2633 = func.call @cc_box_fixnum(%2632) : (i64) -> i64
      %2634 = func.call @cc_svset(%2618, %2633, %2631) : (i64, i64, i64) -> i64
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = arith.constant 4 : i64
      %2637 = func.call @cc_box_fixnum(%2636) : (i64) -> i64
      %2638 = func.call @cc_svset(%2618, %2637, %2635) : (i64, i64, i64) -> i64
      %2639 = func.call @stack_pop_pointer() : () -> i64
      %2640 = arith.constant 3 : i64
      %2641 = func.call @cc_box_fixnum(%2640) : (i64) -> i64
      %2642 = func.call @cc_svset(%2618, %2641, %2639) : (i64, i64, i64) -> i64
      %2643 = func.call @stack_pop_pointer() : () -> i64
      %2644 = arith.constant 2 : i64
      %2645 = func.call @cc_box_fixnum(%2644) : (i64) -> i64
      %2646 = func.call @cc_svset(%2618, %2645, %2643) : (i64, i64, i64) -> i64
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = arith.constant 1 : i64
      %2649 = func.call @cc_box_fixnum(%2648) : (i64) -> i64
      %2650 = func.call @cc_svset(%2618, %2649, %2647) : (i64, i64, i64) -> i64
      %2651 = func.call @stack_pop_pointer() : () -> i64
      %2652 = arith.constant 0 : i64
      %2653 = func.call @cc_box_fixnum(%2652) : (i64) -> i64
      %2654 = func.call @cc_svset(%2618, %2653, %2651) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%2618) : (i64) -> ()
      %2655 = func.call @stack_pop_pointer() : () -> i64
      %2656 = func.call @cc_nil_value() : () -> i64
      %2657 = func.call @cc_errorp(%2600) : (i64) -> i64
      %2658 = arith.cmpi ne, %2657, %2656 : i64
      %2659 = arith.cmpi eq, %2656, %2656 : i64
      %2660 = arith.andi %2658, %2659 : i1
      %2661 = scf.if %2660 -> (i64) {
        scf.yield %2600 : i64
      } else {
        scf.yield %2656 : i64
      }
      %2662 = func.call @cc_errorp(%2611) : (i64) -> i64
      %2663 = arith.cmpi ne, %2662, %2656 : i64
      %2664 = arith.cmpi eq, %2661, %2656 : i64
      %2665 = arith.andi %2663, %2664 : i1
      %2666 = scf.if %2665 -> (i64) {
        scf.yield %2611 : i64
      } else {
        scf.yield %2661 : i64
      }
      %2667 = func.call @cc_errorp(%2655) : (i64) -> i64
      %2668 = arith.cmpi ne, %2667, %2656 : i64
      %2669 = arith.cmpi eq, %2666, %2656 : i64
      %2670 = arith.andi %2668, %2669 : i1
      %2671 = scf.if %2670 -> (i64) {
        scf.yield %2655 : i64
      } else {
        scf.yield %2666 : i64
      }
      %2672 = arith.cmpi ne, %2671, %2656 : i64
      scf.if %2672 {
        func.call @stack_push_pointer(%2671) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2600) : (i64) -> ()
        func.call @stack_push_pointer(%2611) : (i64) -> ()
        func.call @stack_push_pointer(%2655) : (i64) -> ()
        %2673 = llvm.mlir.addressof @str208 : !llvm.ptr
        %2674 = func.call @cc_make_function_ref_const(%2673) : (!llvm.ptr) -> i64
        %2675 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2674, %2675) : (i64, i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %2676 = func.call @stack_pop_pointer() : () -> i64
      %2677 = func.call @stack_pop_pointer() : () -> i64
      %2678 = func.call @cc_cons(%2677, %2676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2678) : (i64) -> ()
      %2679 = func.call @stack_pop_pointer() : () -> i64
      %2680 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2681 = arith.constant 11 : i64
      %2682 = func.call @cc_make_string(%2680, %2681) : (!llvm.ptr, i64) -> i64
      %2683 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2684 = arith.constant 7 : i64
      %2685 = func.call @cc_make_string(%2683, %2684) : (!llvm.ptr, i64) -> i64
      %2686 = func.call @cc_intern(%2682, %2685) : (i64, i64) -> i64
      %2687 = func.call @cc_nil_value() : () -> i64
      %2688 = func.call @cc_cons(%2686, %2687) : (i64, i64) -> i64
      %2689 = func.call @cc_values_pack(%2688) : (i64) -> i64
      func.call @stack_push_pointer(%2686) : (i64) -> ()
      %2690 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2691 = func.call @stack_pop_pointer() : () -> i64
      %2692 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2693 = arith.constant 4 : i64
      %2694 = func.call @cc_make_string(%2692, %2693) : (!llvm.ptr, i64) -> i64
      %2695 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2696 = arith.constant 7 : i64
      %2697 = func.call @cc_make_string(%2695, %2696) : (!llvm.ptr, i64) -> i64
      %2698 = func.call @cc_intern(%2694, %2697) : (i64, i64) -> i64
      %2699 = func.call @cc_nil_value() : () -> i64
      %2700 = func.call @cc_cons(%2698, %2699) : (i64, i64) -> i64
      %2701 = func.call @cc_values_pack(%2700) : (i64) -> i64
      func.call @stack_push_pointer(%2698) : (i64) -> ()
      %2702 = func.call @stack_pop_pointer() : () -> i64
      %2703 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2704 = arith.constant 6 : i64
      %2705 = func.call @cc_make_string(%2703, %2704) : (!llvm.ptr, i64) -> i64
      %2706 = func.call @cc_nil_value() : () -> i64
      %2707 = func.call @cc_intern(%2705, %2706) : (i64, i64) -> i64
      %2708 = func.call @cc_nil_value() : () -> i64
      %2709 = func.call @cc_cons(%2707, %2708) : (i64, i64) -> i64
      %2710 = func.call @cc_values_pack(%2709) : (i64) -> i64
      func.call @stack_push_pointer(%2707) : (i64) -> ()
      %2711 = func.call @stack_pop_pointer() : () -> i64
      %2712 = func.call @cc_nil_value() : () -> i64
      %2713 = func.call @cc_errorp(%2342) : (i64) -> i64
      %2714 = arith.cmpi ne, %2713, %2712 : i64
      %2715 = arith.cmpi eq, %2712, %2712 : i64
      %2716 = arith.andi %2714, %2715 : i1
      %2717 = scf.if %2716 -> (i64) {
        scf.yield %2342 : i64
      } else {
        scf.yield %2712 : i64
      }
      %2718 = func.call @cc_errorp(%2462) : (i64) -> i64
      %2719 = arith.cmpi ne, %2718, %2712 : i64
      %2720 = arith.cmpi eq, %2717, %2712 : i64
      %2721 = arith.andi %2719, %2720 : i1
      %2722 = scf.if %2721 -> (i64) {
        scf.yield %2462 : i64
      } else {
        scf.yield %2717 : i64
      }
      %2723 = func.call @cc_errorp(%2576) : (i64) -> i64
      %2724 = arith.cmpi ne, %2723, %2712 : i64
      %2725 = arith.cmpi eq, %2722, %2712 : i64
      %2726 = arith.andi %2724, %2725 : i1
      %2727 = scf.if %2726 -> (i64) {
        scf.yield %2576 : i64
      } else {
        scf.yield %2722 : i64
      }
      %2728 = func.call @cc_errorp(%2679) : (i64) -> i64
      %2729 = arith.cmpi ne, %2728, %2712 : i64
      %2730 = arith.cmpi eq, %2727, %2712 : i64
      %2731 = arith.andi %2729, %2730 : i1
      %2732 = scf.if %2731 -> (i64) {
        scf.yield %2679 : i64
      } else {
        scf.yield %2727 : i64
      }
      %2733 = func.call @cc_errorp(%2690) : (i64) -> i64
      %2734 = arith.cmpi ne, %2733, %2712 : i64
      %2735 = arith.cmpi eq, %2732, %2712 : i64
      %2736 = arith.andi %2734, %2735 : i1
      %2737 = scf.if %2736 -> (i64) {
        scf.yield %2690 : i64
      } else {
        scf.yield %2732 : i64
      }
      %2738 = func.call @cc_errorp(%2691) : (i64) -> i64
      %2739 = arith.cmpi ne, %2738, %2712 : i64
      %2740 = arith.cmpi eq, %2737, %2712 : i64
      %2741 = arith.andi %2739, %2740 : i1
      %2742 = scf.if %2741 -> (i64) {
        scf.yield %2691 : i64
      } else {
        scf.yield %2737 : i64
      }
      %2743 = func.call @cc_errorp(%2702) : (i64) -> i64
      %2744 = arith.cmpi ne, %2743, %2712 : i64
      %2745 = arith.cmpi eq, %2742, %2712 : i64
      %2746 = arith.andi %2744, %2745 : i1
      %2747 = scf.if %2746 -> (i64) {
        scf.yield %2702 : i64
      } else {
        scf.yield %2742 : i64
      }
      %2748 = func.call @cc_errorp(%2711) : (i64) -> i64
      %2749 = arith.cmpi ne, %2748, %2712 : i64
      %2750 = arith.cmpi eq, %2747, %2712 : i64
      %2751 = arith.andi %2749, %2750 : i1
      %2752 = scf.if %2751 -> (i64) {
        scf.yield %2711 : i64
      } else {
        scf.yield %2747 : i64
      }
      %2753 = arith.cmpi ne, %2752, %2712 : i64
      scf.if %2753 {
        func.call @stack_push_pointer(%2752) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2342) : (i64) -> ()
        func.call @stack_push_pointer(%2462) : (i64) -> ()
        func.call @stack_push_pointer(%2576) : (i64) -> ()
        func.call @stack_push_pointer(%2679) : (i64) -> ()
        func.call @stack_push_pointer(%2690) : (i64) -> ()
        func.call @stack_push_pointer(%2691) : (i64) -> ()
        func.call @stack_push_pointer(%2702) : (i64) -> ()
        func.call @stack_push_pointer(%2711) : (i64) -> ()
        %2754 = llvm.mlir.addressof @str214 : !llvm.ptr
        %2755 = func.call @cc_make_function_ref_const(%2754) : (!llvm.ptr) -> i64
        %2756 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2755, %2756) : (i64, i64) -> ()
      }
      %2757 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2757 : i64
    }
    %2758 = func.call @cc_nil_value() : () -> i64
    %2759 = func.call @cc_errorp(%2333) : (i64) -> i64
    %2760 = arith.cmpi ne, %2759, %2758 : i64
    %2761 = scf.if %2760 -> (i64) {
      scf.yield %2333 : i64
    } else {
      %2762 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2763 = arith.constant 12 : i64
      %2764 = func.call @cc_make_string(%2762, %2763) : (!llvm.ptr, i64) -> i64
      %2765 = func.call @cc_nil_value() : () -> i64
      %2766 = func.call @cc_intern(%2764, %2765) : (i64, i64) -> i64
      %2767 = func.call @cc_nil_value() : () -> i64
      %2768 = func.call @cc_cons(%2766, %2767) : (i64, i64) -> i64
      %2769 = func.call @cc_values_pack(%2768) : (i64) -> i64
      func.call @stack_push_pointer(%2766) : (i64) -> ()
      %2770 = func.call @stack_pop_pointer() : () -> i64
      %2771 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2772 = arith.constant 18 : i64
      %2773 = func.call @cc_make_string(%2771, %2772) : (!llvm.ptr, i64) -> i64
      %2774 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2775 = arith.constant 11 : i64
      %2776 = func.call @cc_make_string(%2774, %2775) : (!llvm.ptr, i64) -> i64
      %2777 = func.call @cc_intern(%2773, %2776) : (i64, i64) -> i64
      %2778 = func.call @cc_nil_value() : () -> i64
      %2779 = func.call @cc_cons(%2777, %2778) : (i64, i64) -> i64
      %2780 = func.call @cc_values_pack(%2779) : (i64) -> i64
      func.call @stack_push_pointer(%2777) : (i64) -> ()
      %2781 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2782 = arith.constant 10 : i64
      %2783 = func.call @cc_make_string(%2781, %2782) : (!llvm.ptr, i64) -> i64
      %2784 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2785 = arith.constant 11 : i64
      %2786 = func.call @cc_make_string(%2784, %2785) : (!llvm.ptr, i64) -> i64
      %2787 = func.call @cc_intern(%2783, %2786) : (i64, i64) -> i64
      %2788 = func.call @cc_nil_value() : () -> i64
      %2789 = func.call @cc_cons(%2787, %2788) : (i64, i64) -> i64
      %2790 = func.call @cc_values_pack(%2789) : (i64) -> i64
      func.call @stack_push_pointer(%2787) : (i64) -> ()
      %2791 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2791) : (i64) -> ()
      %2792 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2793 = arith.constant 12 : i64
      %2794 = func.call @cc_make_string(%2792, %2793) : (!llvm.ptr, i64) -> i64
      %2795 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2796 = arith.constant 7 : i64
      %2797 = func.call @cc_make_string(%2795, %2796) : (!llvm.ptr, i64) -> i64
      %2798 = func.call @cc_intern(%2794, %2797) : (i64, i64) -> i64
      %2799 = func.call @cc_nil_value() : () -> i64
      %2800 = func.call @cc_cons(%2798, %2799) : (i64, i64) -> i64
      %2801 = func.call @cc_values_pack(%2800) : (i64) -> i64
      func.call @stack_push_pointer(%2798) : (i64) -> ()
      %2802 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2802) : (i64) -> ()
      %2803 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2804 = arith.constant 9 : i64
      %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
      %2806 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2807 = arith.constant 11 : i64
      %2808 = func.call @cc_make_string(%2806, %2807) : (!llvm.ptr, i64) -> i64
      %2809 = func.call @cc_intern(%2805, %2808) : (i64, i64) -> i64
      %2810 = func.call @cc_nil_value() : () -> i64
      %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
      func.call @stack_push_pointer(%2809) : (i64) -> ()
      %2813 = func.call @stack_pop_pointer() : () -> i64
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @cc_cons(%2813, %2814) : (i64, i64) -> i64
      %2816 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2817 = arith.constant 5 : i64
      %2818 = func.call @cc_make_string(%2816, %2817) : (!llvm.ptr, i64) -> i64
      %2819 = func.call @cc_nil_value() : () -> i64
      %2820 = func.call @cc_intern(%2818, %2819) : (i64, i64) -> i64
      %2821 = func.call @cc_nil_value() : () -> i64
      %2822 = func.call @cc_cons(%2820, %2821) : (i64, i64) -> i64
      %2823 = func.call @cc_values_pack(%2822) : (i64) -> i64
      %2824 = func.call @cc_cons(%2820, %2815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2824) : (i64) -> ()
      %2825 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2826 = arith.constant 15 : i64
      %2827 = func.call @cc_make_string(%2825, %2826) : (!llvm.ptr, i64) -> i64
      %2828 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2829 = arith.constant 7 : i64
      %2830 = func.call @cc_make_string(%2828, %2829) : (!llvm.ptr, i64) -> i64
      %2831 = func.call @cc_intern(%2827, %2830) : (i64, i64) -> i64
      %2832 = func.call @cc_nil_value() : () -> i64
      %2833 = func.call @cc_cons(%2831, %2832) : (i64, i64) -> i64
      %2834 = func.call @cc_values_pack(%2833) : (i64) -> i64
      func.call @stack_push_pointer(%2831) : (i64) -> ()
      %2835 = arith.constant 97 : i64
      %2836 = func.call @cc_box_character(%2835) : (i64) -> i64
      func.call @stack_push_pointer(%2836) : (i64) -> ()
      %2837 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2838 = arith.constant 10 : i64
      %2839 = func.call @cc_make_string(%2837, %2838) : (!llvm.ptr, i64) -> i64
      %2840 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2841 = arith.constant 7 : i64
      %2842 = func.call @cc_make_string(%2840, %2841) : (!llvm.ptr, i64) -> i64
      %2843 = func.call @cc_intern(%2839, %2842) : (i64, i64) -> i64
      %2844 = func.call @cc_nil_value() : () -> i64
      %2845 = func.call @cc_cons(%2843, %2844) : (i64, i64) -> i64
      %2846 = func.call @cc_values_pack(%2845) : (i64) -> i64
      func.call @stack_push_pointer(%2843) : (i64) -> ()
      %2847 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2847) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2848 = func.call @stack_pop_pointer() : () -> i64
      %2849 = func.call @stack_pop_pointer() : () -> i64
      %2850 = func.call @cc_cons(%2849, %2848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2850) : (i64) -> ()
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
      %2869 = func.call @stack_pop_pointer() : () -> i64
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_cons(%2870, %2869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2871) : (i64) -> ()
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
      %2987 = arith.constant 15079495958539 : i64
      %2988 = arith.constant 0 : i64
      %2989 = func.call @cc_make_closure(%2987, %2988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2989) : (i64) -> ()
      %2990 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2991 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2992 = func.call @stack_pop_pointer() : () -> i64
      %2993 = func.call @stack_pop_pointer() : () -> i64
      %2994 = func.call @cc_cons(%2993, %2992) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2994) : (i64) -> ()
      %2995 = func.call @stack_pop_pointer() : () -> i64
      %2996 = func.call @stack_pop_pointer() : () -> i64
      %2997 = func.call @cc_cons(%2996, %2995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2997) : (i64) -> ()
      %2998 = func.call @stack_pop_pointer() : () -> i64
      %2999 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3000 = arith.constant 11 : i64
      %3001 = func.call @cc_make_string(%2999, %3000) : (!llvm.ptr, i64) -> i64
      %3002 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3003 = arith.constant 7 : i64
      %3004 = func.call @cc_make_string(%3002, %3003) : (!llvm.ptr, i64) -> i64
      %3005 = func.call @cc_intern(%3001, %3004) : (i64, i64) -> i64
      %3006 = func.call @cc_nil_value() : () -> i64
      %3007 = func.call @cc_cons(%3005, %3006) : (i64, i64) -> i64
      %3008 = func.call @cc_values_pack(%3007) : (i64) -> i64
      func.call @stack_push_pointer(%3005) : (i64) -> ()
      %3009 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3010 = func.call @stack_pop_pointer() : () -> i64
      %3011 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3012 = arith.constant 4 : i64
      %3013 = func.call @cc_make_string(%3011, %3012) : (!llvm.ptr, i64) -> i64
      %3014 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3015 = arith.constant 7 : i64
      %3016 = func.call @cc_make_string(%3014, %3015) : (!llvm.ptr, i64) -> i64
      %3017 = func.call @cc_intern(%3013, %3016) : (i64, i64) -> i64
      %3018 = func.call @cc_nil_value() : () -> i64
      %3019 = func.call @cc_cons(%3017, %3018) : (i64, i64) -> i64
      %3020 = func.call @cc_values_pack(%3019) : (i64) -> i64
      func.call @stack_push_pointer(%3017) : (i64) -> ()
      %3021 = func.call @stack_pop_pointer() : () -> i64
      %3022 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3023 = arith.constant 6 : i64
      %3024 = func.call @cc_make_string(%3022, %3023) : (!llvm.ptr, i64) -> i64
      %3025 = func.call @cc_nil_value() : () -> i64
      %3026 = func.call @cc_intern(%3024, %3025) : (i64, i64) -> i64
      %3027 = func.call @cc_nil_value() : () -> i64
      %3028 = func.call @cc_cons(%3026, %3027) : (i64, i64) -> i64
      %3029 = func.call @cc_values_pack(%3028) : (i64) -> i64
      func.call @stack_push_pointer(%3026) : (i64) -> ()
      %3030 = func.call @stack_pop_pointer() : () -> i64
      %3031 = func.call @cc_nil_value() : () -> i64
      %3032 = func.call @cc_errorp(%2770) : (i64) -> i64
      %3033 = arith.cmpi ne, %3032, %3031 : i64
      %3034 = arith.cmpi eq, %3031, %3031 : i64
      %3035 = arith.andi %3033, %3034 : i1
      %3036 = scf.if %3035 -> (i64) {
        scf.yield %2770 : i64
      } else {
        scf.yield %3031 : i64
      }
      %3037 = func.call @cc_errorp(%2878) : (i64) -> i64
      %3038 = arith.cmpi ne, %3037, %3031 : i64
      %3039 = arith.cmpi eq, %3036, %3031 : i64
      %3040 = arith.andi %3038, %3039 : i1
      %3041 = scf.if %3040 -> (i64) {
        scf.yield %2878 : i64
      } else {
        scf.yield %3036 : i64
      }
      %3042 = func.call @cc_errorp(%2990) : (i64) -> i64
      %3043 = arith.cmpi ne, %3042, %3031 : i64
      %3044 = arith.cmpi eq, %3041, %3031 : i64
      %3045 = arith.andi %3043, %3044 : i1
      %3046 = scf.if %3045 -> (i64) {
        scf.yield %2990 : i64
      } else {
        scf.yield %3041 : i64
      }
      %3047 = func.call @cc_errorp(%2998) : (i64) -> i64
      %3048 = arith.cmpi ne, %3047, %3031 : i64
      %3049 = arith.cmpi eq, %3046, %3031 : i64
      %3050 = arith.andi %3048, %3049 : i1
      %3051 = scf.if %3050 -> (i64) {
        scf.yield %2998 : i64
      } else {
        scf.yield %3046 : i64
      }
      %3052 = func.call @cc_errorp(%3009) : (i64) -> i64
      %3053 = arith.cmpi ne, %3052, %3031 : i64
      %3054 = arith.cmpi eq, %3051, %3031 : i64
      %3055 = arith.andi %3053, %3054 : i1
      %3056 = scf.if %3055 -> (i64) {
        scf.yield %3009 : i64
      } else {
        scf.yield %3051 : i64
      }
      %3057 = func.call @cc_errorp(%3010) : (i64) -> i64
      %3058 = arith.cmpi ne, %3057, %3031 : i64
      %3059 = arith.cmpi eq, %3056, %3031 : i64
      %3060 = arith.andi %3058, %3059 : i1
      %3061 = scf.if %3060 -> (i64) {
        scf.yield %3010 : i64
      } else {
        scf.yield %3056 : i64
      }
      %3062 = func.call @cc_errorp(%3021) : (i64) -> i64
      %3063 = arith.cmpi ne, %3062, %3031 : i64
      %3064 = arith.cmpi eq, %3061, %3031 : i64
      %3065 = arith.andi %3063, %3064 : i1
      %3066 = scf.if %3065 -> (i64) {
        scf.yield %3021 : i64
      } else {
        scf.yield %3061 : i64
      }
      %3067 = func.call @cc_errorp(%3030) : (i64) -> i64
      %3068 = arith.cmpi ne, %3067, %3031 : i64
      %3069 = arith.cmpi eq, %3066, %3031 : i64
      %3070 = arith.andi %3068, %3069 : i1
      %3071 = scf.if %3070 -> (i64) {
        scf.yield %3030 : i64
      } else {
        scf.yield %3066 : i64
      }
      %3072 = arith.cmpi ne, %3071, %3031 : i64
      scf.if %3072 {
        func.call @stack_push_pointer(%3071) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2770) : (i64) -> ()
        func.call @stack_push_pointer(%2878) : (i64) -> ()
        func.call @stack_push_pointer(%2990) : (i64) -> ()
        func.call @stack_push_pointer(%2998) : (i64) -> ()
        func.call @stack_push_pointer(%3009) : (i64) -> ()
        func.call @stack_push_pointer(%3010) : (i64) -> ()
        func.call @stack_push_pointer(%3021) : (i64) -> ()
        func.call @stack_push_pointer(%3030) : (i64) -> ()
        %3073 = llvm.mlir.addressof @str244 : !llvm.ptr
        %3074 = func.call @cc_make_function_ref_const(%3073) : (!llvm.ptr) -> i64
        %3075 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3074, %3075) : (i64, i64) -> ()
      }
      %3076 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3076 : i64
    }
    %3077 = func.call @cc_nil_value() : () -> i64
    %3078 = func.call @cc_errorp(%2761) : (i64) -> i64
    %3079 = arith.cmpi ne, %3078, %3077 : i64
    %3080 = scf.if %3079 -> (i64) {
      scf.yield %2761 : i64
    } else {
      %3081 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3082 = arith.constant 12 : i64
      %3083 = func.call @cc_make_string(%3081, %3082) : (!llvm.ptr, i64) -> i64
      %3084 = func.call @cc_nil_value() : () -> i64
      %3085 = func.call @cc_intern(%3083, %3084) : (i64, i64) -> i64
      %3086 = func.call @cc_nil_value() : () -> i64
      %3087 = func.call @cc_cons(%3085, %3086) : (i64, i64) -> i64
      %3088 = func.call @cc_values_pack(%3087) : (i64) -> i64
      func.call @stack_push_pointer(%3085) : (i64) -> ()
      %3089 = func.call @stack_pop_pointer() : () -> i64
      %3090 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3091 = arith.constant 18 : i64
      %3092 = func.call @cc_make_string(%3090, %3091) : (!llvm.ptr, i64) -> i64
      %3093 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3094 = arith.constant 11 : i64
      %3095 = func.call @cc_make_string(%3093, %3094) : (!llvm.ptr, i64) -> i64
      %3096 = func.call @cc_intern(%3092, %3095) : (i64, i64) -> i64
      %3097 = func.call @cc_nil_value() : () -> i64
      %3098 = func.call @cc_cons(%3096, %3097) : (i64, i64) -> i64
      %3099 = func.call @cc_values_pack(%3098) : (i64) -> i64
      func.call @stack_push_pointer(%3096) : (i64) -> ()
      %3100 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3101 = arith.constant 10 : i64
      %3102 = func.call @cc_make_string(%3100, %3101) : (!llvm.ptr, i64) -> i64
      %3103 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3104 = arith.constant 11 : i64
      %3105 = func.call @cc_make_string(%3103, %3104) : (!llvm.ptr, i64) -> i64
      %3106 = func.call @cc_intern(%3102, %3105) : (i64, i64) -> i64
      %3107 = func.call @cc_nil_value() : () -> i64
      %3108 = func.call @cc_cons(%3106, %3107) : (i64, i64) -> i64
      %3109 = func.call @cc_values_pack(%3108) : (i64) -> i64
      func.call @stack_push_pointer(%3106) : (i64) -> ()
      %3110 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%3110) : (i64) -> ()
      %3111 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3112 = arith.constant 12 : i64
      %3113 = func.call @cc_make_string(%3111, %3112) : (!llvm.ptr, i64) -> i64
      %3114 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3115 = arith.constant 7 : i64
      %3116 = func.call @cc_make_string(%3114, %3115) : (!llvm.ptr, i64) -> i64
      %3117 = func.call @cc_intern(%3113, %3116) : (i64, i64) -> i64
      %3118 = func.call @cc_nil_value() : () -> i64
      %3119 = func.call @cc_cons(%3117, %3118) : (i64, i64) -> i64
      %3120 = func.call @cc_values_pack(%3119) : (i64) -> i64
      func.call @stack_push_pointer(%3117) : (i64) -> ()
      %3121 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3121) : (i64) -> ()
      %3122 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3123 = arith.constant 9 : i64
      %3124 = func.call @cc_make_string(%3122, %3123) : (!llvm.ptr, i64) -> i64
      %3125 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3126 = arith.constant 11 : i64
      %3127 = func.call @cc_make_string(%3125, %3126) : (!llvm.ptr, i64) -> i64
      %3128 = func.call @cc_intern(%3124, %3127) : (i64, i64) -> i64
      %3129 = func.call @cc_nil_value() : () -> i64
      %3130 = func.call @cc_cons(%3128, %3129) : (i64, i64) -> i64
      %3131 = func.call @cc_values_pack(%3130) : (i64) -> i64
      func.call @stack_push_pointer(%3128) : (i64) -> ()
      %3132 = func.call @stack_pop_pointer() : () -> i64
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = func.call @cc_cons(%3132, %3133) : (i64, i64) -> i64
      %3135 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3136 = arith.constant 5 : i64
      %3137 = func.call @cc_make_string(%3135, %3136) : (!llvm.ptr, i64) -> i64
      %3138 = func.call @cc_nil_value() : () -> i64
      %3139 = func.call @cc_intern(%3137, %3138) : (i64, i64) -> i64
      %3140 = func.call @cc_nil_value() : () -> i64
      %3141 = func.call @cc_cons(%3139, %3140) : (i64, i64) -> i64
      %3142 = func.call @cc_values_pack(%3141) : (i64) -> i64
      %3143 = func.call @cc_cons(%3139, %3134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3143) : (i64) -> ()
      %3144 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3145 = arith.constant 15 : i64
      %3146 = func.call @cc_make_string(%3144, %3145) : (!llvm.ptr, i64) -> i64
      %3147 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3148 = arith.constant 7 : i64
      %3149 = func.call @cc_make_string(%3147, %3148) : (!llvm.ptr, i64) -> i64
      %3150 = func.call @cc_intern(%3146, %3149) : (i64, i64) -> i64
      %3151 = func.call @cc_nil_value() : () -> i64
      %3152 = func.call @cc_cons(%3150, %3151) : (i64, i64) -> i64
      %3153 = func.call @cc_values_pack(%3152) : (i64) -> i64
      func.call @stack_push_pointer(%3150) : (i64) -> ()
      %3154 = arith.constant 97 : i64
      %3155 = func.call @cc_box_character(%3154) : (i64) -> i64
      func.call @stack_push_pointer(%3155) : (i64) -> ()
      %3156 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3157 = arith.constant 10 : i64
      %3158 = func.call @cc_make_string(%3156, %3157) : (!llvm.ptr, i64) -> i64
      %3159 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3160 = arith.constant 7 : i64
      %3161 = func.call @cc_make_string(%3159, %3160) : (!llvm.ptr, i64) -> i64
      %3162 = func.call @cc_intern(%3158, %3161) : (i64, i64) -> i64
      %3163 = func.call @cc_nil_value() : () -> i64
      %3164 = func.call @cc_cons(%3162, %3163) : (i64, i64) -> i64
      %3165 = func.call @cc_values_pack(%3164) : (i64) -> i64
      func.call @stack_push_pointer(%3162) : (i64) -> ()
      %3166 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3166) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3167 = func.call @stack_pop_pointer() : () -> i64
      %3168 = func.call @stack_pop_pointer() : () -> i64
      %3169 = func.call @cc_cons(%3168, %3167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3169) : (i64) -> ()
      %3170 = func.call @stack_pop_pointer() : () -> i64
      %3171 = func.call @stack_pop_pointer() : () -> i64
      %3172 = func.call @cc_cons(%3171, %3170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3172) : (i64) -> ()
      %3173 = func.call @stack_pop_pointer() : () -> i64
      %3174 = func.call @stack_pop_pointer() : () -> i64
      %3175 = func.call @cc_cons(%3174, %3173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3175) : (i64) -> ()
      %3176 = func.call @stack_pop_pointer() : () -> i64
      %3177 = func.call @stack_pop_pointer() : () -> i64
      %3178 = func.call @cc_cons(%3177, %3176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3178) : (i64) -> ()
      %3179 = func.call @stack_pop_pointer() : () -> i64
      %3180 = func.call @stack_pop_pointer() : () -> i64
      %3181 = func.call @cc_cons(%3180, %3179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3181) : (i64) -> ()
      %3182 = func.call @stack_pop_pointer() : () -> i64
      %3183 = func.call @stack_pop_pointer() : () -> i64
      %3184 = func.call @cc_cons(%3183, %3182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3184) : (i64) -> ()
      %3185 = func.call @stack_pop_pointer() : () -> i64
      %3186 = func.call @stack_pop_pointer() : () -> i64
      %3187 = func.call @cc_cons(%3186, %3185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3187) : (i64) -> ()
      %3188 = func.call @stack_pop_pointer() : () -> i64
      %3189 = func.call @stack_pop_pointer() : () -> i64
      %3190 = func.call @cc_cons(%3189, %3188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3190) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3191 = func.call @stack_pop_pointer() : () -> i64
      %3192 = func.call @stack_pop_pointer() : () -> i64
      %3193 = func.call @cc_cons(%3192, %3191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3193) : (i64) -> ()
      %3194 = func.call @stack_pop_pointer() : () -> i64
      %3195 = func.call @stack_pop_pointer() : () -> i64
      %3196 = func.call @cc_cons(%3195, %3194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3196) : (i64) -> ()
      %3197 = func.call @stack_pop_pointer() : () -> i64
      %3306 = arith.constant 15079495958540 : i64
      %3307 = arith.constant 0 : i64
      %3308 = func.call @cc_make_closure(%3306, %3307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3308) : (i64) -> ()
      %3309 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3310 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3311 = func.call @stack_pop_pointer() : () -> i64
      %3312 = func.call @stack_pop_pointer() : () -> i64
      %3313 = func.call @cc_cons(%3312, %3311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3313) : (i64) -> ()
      %3314 = func.call @stack_pop_pointer() : () -> i64
      %3315 = func.call @stack_pop_pointer() : () -> i64
      %3316 = func.call @cc_cons(%3315, %3314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3316) : (i64) -> ()
      %3317 = func.call @stack_pop_pointer() : () -> i64
      %3318 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3319 = arith.constant 11 : i64
      %3320 = func.call @cc_make_string(%3318, %3319) : (!llvm.ptr, i64) -> i64
      %3321 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3322 = arith.constant 7 : i64
      %3323 = func.call @cc_make_string(%3321, %3322) : (!llvm.ptr, i64) -> i64
      %3324 = func.call @cc_intern(%3320, %3323) : (i64, i64) -> i64
      %3325 = func.call @cc_nil_value() : () -> i64
      %3326 = func.call @cc_cons(%3324, %3325) : (i64, i64) -> i64
      %3327 = func.call @cc_values_pack(%3326) : (i64) -> i64
      func.call @stack_push_pointer(%3324) : (i64) -> ()
      %3328 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3329 = func.call @stack_pop_pointer() : () -> i64
      %3330 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3331 = arith.constant 4 : i64
      %3332 = func.call @cc_make_string(%3330, %3331) : (!llvm.ptr, i64) -> i64
      %3333 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3334 = arith.constant 7 : i64
      %3335 = func.call @cc_make_string(%3333, %3334) : (!llvm.ptr, i64) -> i64
      %3336 = func.call @cc_intern(%3332, %3335) : (i64, i64) -> i64
      %3337 = func.call @cc_nil_value() : () -> i64
      %3338 = func.call @cc_cons(%3336, %3337) : (i64, i64) -> i64
      %3339 = func.call @cc_values_pack(%3338) : (i64) -> i64
      func.call @stack_push_pointer(%3336) : (i64) -> ()
      %3340 = func.call @stack_pop_pointer() : () -> i64
      %3341 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3342 = arith.constant 6 : i64
      %3343 = func.call @cc_make_string(%3341, %3342) : (!llvm.ptr, i64) -> i64
      %3344 = func.call @cc_nil_value() : () -> i64
      %3345 = func.call @cc_intern(%3343, %3344) : (i64, i64) -> i64
      %3346 = func.call @cc_nil_value() : () -> i64
      %3347 = func.call @cc_cons(%3345, %3346) : (i64, i64) -> i64
      %3348 = func.call @cc_values_pack(%3347) : (i64) -> i64
      func.call @stack_push_pointer(%3345) : (i64) -> ()
      %3349 = func.call @stack_pop_pointer() : () -> i64
      %3350 = func.call @cc_nil_value() : () -> i64
      %3351 = func.call @cc_errorp(%3089) : (i64) -> i64
      %3352 = arith.cmpi ne, %3351, %3350 : i64
      %3353 = arith.cmpi eq, %3350, %3350 : i64
      %3354 = arith.andi %3352, %3353 : i1
      %3355 = scf.if %3354 -> (i64) {
        scf.yield %3089 : i64
      } else {
        scf.yield %3350 : i64
      }
      %3356 = func.call @cc_errorp(%3197) : (i64) -> i64
      %3357 = arith.cmpi ne, %3356, %3350 : i64
      %3358 = arith.cmpi eq, %3355, %3350 : i64
      %3359 = arith.andi %3357, %3358 : i1
      %3360 = scf.if %3359 -> (i64) {
        scf.yield %3197 : i64
      } else {
        scf.yield %3355 : i64
      }
      %3361 = func.call @cc_errorp(%3309) : (i64) -> i64
      %3362 = arith.cmpi ne, %3361, %3350 : i64
      %3363 = arith.cmpi eq, %3360, %3350 : i64
      %3364 = arith.andi %3362, %3363 : i1
      %3365 = scf.if %3364 -> (i64) {
        scf.yield %3309 : i64
      } else {
        scf.yield %3360 : i64
      }
      %3366 = func.call @cc_errorp(%3317) : (i64) -> i64
      %3367 = arith.cmpi ne, %3366, %3350 : i64
      %3368 = arith.cmpi eq, %3365, %3350 : i64
      %3369 = arith.andi %3367, %3368 : i1
      %3370 = scf.if %3369 -> (i64) {
        scf.yield %3317 : i64
      } else {
        scf.yield %3365 : i64
      }
      %3371 = func.call @cc_errorp(%3328) : (i64) -> i64
      %3372 = arith.cmpi ne, %3371, %3350 : i64
      %3373 = arith.cmpi eq, %3370, %3350 : i64
      %3374 = arith.andi %3372, %3373 : i1
      %3375 = scf.if %3374 -> (i64) {
        scf.yield %3328 : i64
      } else {
        scf.yield %3370 : i64
      }
      %3376 = func.call @cc_errorp(%3329) : (i64) -> i64
      %3377 = arith.cmpi ne, %3376, %3350 : i64
      %3378 = arith.cmpi eq, %3375, %3350 : i64
      %3379 = arith.andi %3377, %3378 : i1
      %3380 = scf.if %3379 -> (i64) {
        scf.yield %3329 : i64
      } else {
        scf.yield %3375 : i64
      }
      %3381 = func.call @cc_errorp(%3340) : (i64) -> i64
      %3382 = arith.cmpi ne, %3381, %3350 : i64
      %3383 = arith.cmpi eq, %3380, %3350 : i64
      %3384 = arith.andi %3382, %3383 : i1
      %3385 = scf.if %3384 -> (i64) {
        scf.yield %3340 : i64
      } else {
        scf.yield %3380 : i64
      }
      %3386 = func.call @cc_errorp(%3349) : (i64) -> i64
      %3387 = arith.cmpi ne, %3386, %3350 : i64
      %3388 = arith.cmpi eq, %3385, %3350 : i64
      %3389 = arith.andi %3387, %3388 : i1
      %3390 = scf.if %3389 -> (i64) {
        scf.yield %3349 : i64
      } else {
        scf.yield %3385 : i64
      }
      %3391 = arith.cmpi ne, %3390, %3350 : i64
      scf.if %3391 {
        func.call @stack_push_pointer(%3390) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3089) : (i64) -> ()
        func.call @stack_push_pointer(%3197) : (i64) -> ()
        func.call @stack_push_pointer(%3309) : (i64) -> ()
        func.call @stack_push_pointer(%3317) : (i64) -> ()
        func.call @stack_push_pointer(%3328) : (i64) -> ()
        func.call @stack_push_pointer(%3329) : (i64) -> ()
        func.call @stack_push_pointer(%3340) : (i64) -> ()
        func.call @stack_push_pointer(%3349) : (i64) -> ()
        %3392 = llvm.mlir.addressof @str274 : !llvm.ptr
        %3393 = func.call @cc_make_function_ref_const(%3392) : (!llvm.ptr) -> i64
        %3394 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3393, %3394) : (i64, i64) -> ()
      }
      %3395 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3395 : i64
    }
    %3396 = func.call @cc_nil_value() : () -> i64
    %3397 = func.call @cc_errorp(%3080) : (i64) -> i64
    %3398 = arith.cmpi ne, %3397, %3396 : i64
    %3399 = scf.if %3398 -> (i64) {
      scf.yield %3080 : i64
    } else {
      %3400 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3401 = arith.constant 12 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      %3403 = func.call @cc_nil_value() : () -> i64
      %3404 = func.call @cc_intern(%3402, %3403) : (i64, i64) -> i64
      %3405 = func.call @cc_nil_value() : () -> i64
      %3406 = func.call @cc_cons(%3404, %3405) : (i64, i64) -> i64
      %3407 = func.call @cc_values_pack(%3406) : (i64) -> i64
      func.call @stack_push_pointer(%3404) : (i64) -> ()
      %3408 = func.call @stack_pop_pointer() : () -> i64
      %3409 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3410 = arith.constant 6 : i64
      %3411 = func.call @cc_make_string(%3409, %3410) : (!llvm.ptr, i64) -> i64
      %3412 = func.call @cc_nil_value() : () -> i64
      %3413 = func.call @cc_intern(%3411, %3412) : (i64, i64) -> i64
      %3414 = func.call @cc_nil_value() : () -> i64
      %3415 = func.call @cc_cons(%3413, %3414) : (i64, i64) -> i64
      %3416 = func.call @cc_values_pack(%3415) : (i64) -> i64
      func.call @stack_push_pointer(%3413) : (i64) -> ()
      %3417 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3418 = arith.constant 10 : i64
      %3419 = func.call @cc_make_string(%3417, %3418) : (!llvm.ptr, i64) -> i64
      %3420 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3421 = arith.constant 11 : i64
      %3422 = func.call @cc_make_string(%3420, %3421) : (!llvm.ptr, i64) -> i64
      %3423 = func.call @cc_intern(%3419, %3422) : (i64, i64) -> i64
      %3424 = func.call @cc_nil_value() : () -> i64
      %3425 = func.call @cc_cons(%3423, %3424) : (i64, i64) -> i64
      %3426 = func.call @cc_values_pack(%3425) : (i64) -> i64
      func.call @stack_push_pointer(%3423) : (i64) -> ()
      %3427 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3427) : (i64) -> ()
      %3428 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3428) : (i64) -> ()
      %3429 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3429) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3430 = func.call @stack_pop_pointer() : () -> i64
      %3431 = func.call @stack_pop_pointer() : () -> i64
      %3432 = func.call @cc_cons(%3431, %3430) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3432) : (i64) -> ()
      %3433 = func.call @stack_pop_pointer() : () -> i64
      %3434 = func.call @stack_pop_pointer() : () -> i64
      %3435 = func.call @cc_cons(%3434, %3433) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3435) : (i64) -> ()
      %3436 = func.call @stack_pop_pointer() : () -> i64
      %3437 = func.call @stack_pop_pointer() : () -> i64
      %3438 = func.call @cc_cons(%3436, %3437) : (i64, i64) -> i64
      %3439 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3440 = arith.constant 5 : i64
      %3441 = func.call @cc_make_string(%3439, %3440) : (!llvm.ptr, i64) -> i64
      %3442 = func.call @cc_nil_value() : () -> i64
      %3443 = func.call @cc_intern(%3441, %3442) : (i64, i64) -> i64
      %3444 = func.call @cc_nil_value() : () -> i64
      %3445 = func.call @cc_cons(%3443, %3444) : (i64, i64) -> i64
      %3446 = func.call @cc_values_pack(%3445) : (i64) -> i64
      %3447 = func.call @cc_cons(%3443, %3438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3447) : (i64) -> ()
      %3448 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3449 = arith.constant 12 : i64
      %3450 = func.call @cc_make_string(%3448, %3449) : (!llvm.ptr, i64) -> i64
      %3451 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3452 = arith.constant 7 : i64
      %3453 = func.call @cc_make_string(%3451, %3452) : (!llvm.ptr, i64) -> i64
      %3454 = func.call @cc_intern(%3450, %3453) : (i64, i64) -> i64
      %3455 = func.call @cc_nil_value() : () -> i64
      %3456 = func.call @cc_cons(%3454, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_values_pack(%3456) : (i64) -> i64
      func.call @stack_push_pointer(%3454) : (i64) -> ()
      %3458 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3458) : (i64) -> ()
      %3459 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3460 = arith.constant 7 : i64
      %3461 = func.call @cc_make_string(%3459, %3460) : (!llvm.ptr, i64) -> i64
      %3462 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3463 = arith.constant 11 : i64
      %3464 = func.call @cc_make_string(%3462, %3463) : (!llvm.ptr, i64) -> i64
      %3465 = func.call @cc_intern(%3461, %3464) : (i64, i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = func.call @cc_cons(%3465, %3466) : (i64, i64) -> i64
      %3468 = func.call @cc_values_pack(%3467) : (i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3469 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3469) : (i64) -> ()
      %3470 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%3470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3471 = func.call @stack_pop_pointer() : () -> i64
      %3472 = func.call @stack_pop_pointer() : () -> i64
      %3473 = func.call @cc_cons(%3472, %3471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3473) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3474 = func.call @stack_pop_pointer() : () -> i64
      %3475 = func.call @stack_pop_pointer() : () -> i64
      %3476 = func.call @cc_cons(%3475, %3474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3476) : (i64) -> ()
      %3477 = func.call @stack_pop_pointer() : () -> i64
      %3478 = func.call @stack_pop_pointer() : () -> i64
      %3479 = func.call @cc_cons(%3478, %3477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3479) : (i64) -> ()
      %3480 = func.call @stack_pop_pointer() : () -> i64
      %3481 = func.call @stack_pop_pointer() : () -> i64
      %3482 = func.call @cc_cons(%3481, %3480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3482) : (i64) -> ()
      %3483 = func.call @stack_pop_pointer() : () -> i64
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = func.call @cc_cons(%3483, %3484) : (i64, i64) -> i64
      %3486 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3487 = arith.constant 5 : i64
      %3488 = func.call @cc_make_string(%3486, %3487) : (!llvm.ptr, i64) -> i64
      %3489 = func.call @cc_nil_value() : () -> i64
      %3490 = func.call @cc_intern(%3488, %3489) : (i64, i64) -> i64
      %3491 = func.call @cc_nil_value() : () -> i64
      %3492 = func.call @cc_cons(%3490, %3491) : (i64, i64) -> i64
      %3493 = func.call @cc_values_pack(%3492) : (i64) -> i64
      %3494 = func.call @cc_cons(%3490, %3485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3494) : (i64) -> ()
      %3495 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3496 = arith.constant 16 : i64
      %3497 = func.call @cc_make_string(%3495, %3496) : (!llvm.ptr, i64) -> i64
      %3498 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3499 = arith.constant 7 : i64
      %3500 = func.call @cc_make_string(%3498, %3499) : (!llvm.ptr, i64) -> i64
      %3501 = func.call @cc_intern(%3497, %3500) : (i64, i64) -> i64
      %3502 = func.call @cc_nil_value() : () -> i64
      %3503 = func.call @cc_cons(%3501, %3502) : (i64, i64) -> i64
      %3504 = func.call @cc_values_pack(%3503) : (i64) -> i64
      func.call @stack_push_pointer(%3501) : (i64) -> ()
      %3505 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3505) : (i64) -> ()
      %3506 = arith.constant 34 : i64
      func.call @stack_push_fixnum(%3506) : (i64) -> ()
      %3507 = arith.constant 98 : i64
      func.call @stack_push_fixnum(%3507) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3508 = func.call @stack_pop_pointer() : () -> i64
      %3509 = func.call @stack_pop_pointer() : () -> i64
      %3510 = func.call @cc_cons(%3509, %3508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3510) : (i64) -> ()
      %3511 = func.call @stack_pop_pointer() : () -> i64
      %3512 = func.call @stack_pop_pointer() : () -> i64
      %3513 = func.call @cc_cons(%3512, %3511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3513) : (i64) -> ()
      %3514 = arith.constant 14 : i64
      func.call @stack_push_fixnum(%3514) : (i64) -> ()
      %3515 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%3515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3516 = func.call @stack_pop_pointer() : () -> i64
      %3517 = func.call @stack_pop_pointer() : () -> i64
      %3518 = func.call @cc_cons(%3517, %3516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3518) : (i64) -> ()
      %3519 = func.call @stack_pop_pointer() : () -> i64
      %3520 = func.call @stack_pop_pointer() : () -> i64
      %3521 = func.call @cc_cons(%3520, %3519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3521) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3522 = func.call @stack_pop_pointer() : () -> i64
      %3523 = func.call @stack_pop_pointer() : () -> i64
      %3524 = func.call @cc_cons(%3523, %3522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3524) : (i64) -> ()
      %3525 = func.call @stack_pop_pointer() : () -> i64
      %3526 = func.call @stack_pop_pointer() : () -> i64
      %3527 = func.call @cc_cons(%3526, %3525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3527) : (i64) -> ()
      %3528 = func.call @stack_pop_pointer() : () -> i64
      %3529 = func.call @stack_pop_pointer() : () -> i64
      %3530 = func.call @cc_cons(%3528, %3529) : (i64, i64) -> i64
      %3531 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3532 = arith.constant 5 : i64
      %3533 = func.call @cc_make_string(%3531, %3532) : (!llvm.ptr, i64) -> i64
      %3534 = func.call @cc_nil_value() : () -> i64
      %3535 = func.call @cc_intern(%3533, %3534) : (i64, i64) -> i64
      %3536 = func.call @cc_nil_value() : () -> i64
      %3537 = func.call @cc_cons(%3535, %3536) : (i64, i64) -> i64
      %3538 = func.call @cc_values_pack(%3537) : (i64) -> i64
      %3539 = func.call @cc_cons(%3535, %3530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3539) : (i64) -> ()
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
      %3552 = func.call @stack_pop_pointer() : () -> i64
      %3553 = func.call @stack_pop_pointer() : () -> i64
      %3554 = func.call @cc_cons(%3553, %3552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3554) : (i64) -> ()
      %3555 = func.call @stack_pop_pointer() : () -> i64
      %3556 = func.call @stack_pop_pointer() : () -> i64
      %3557 = func.call @cc_cons(%3556, %3555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3557) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3558 = func.call @stack_pop_pointer() : () -> i64
      %3559 = func.call @stack_pop_pointer() : () -> i64
      %3560 = func.call @cc_cons(%3559, %3558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3560) : (i64) -> ()
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = func.call @stack_pop_pointer() : () -> i64
      %3563 = func.call @cc_cons(%3562, %3561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3563) : (i64) -> ()
      %3564 = func.call @stack_pop_pointer() : () -> i64
      %3685 = arith.constant 15079495958541 : i64
      %3686 = arith.constant 0 : i64
      %3687 = func.call @cc_make_closure(%3685, %3686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3687) : (i64) -> ()
      %3688 = func.call @stack_pop_pointer() : () -> i64
      %3689 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3690 = arith.constant 5 : i64
      %3691 = func.call @cc_make_string(%3689, %3690) : (!llvm.ptr, i64) -> i64
      %3692 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3693 = arith.constant 11 : i64
      %3694 = func.call @cc_make_string(%3692, %3693) : (!llvm.ptr, i64) -> i64
      %3695 = func.call @cc_intern(%3691, %3694) : (i64, i64) -> i64
      %3696 = func.call @cc_nil_value() : () -> i64
      %3697 = func.call @cc_cons(%3695, %3696) : (i64, i64) -> i64
      %3698 = func.call @cc_values_pack(%3697) : (i64) -> i64
      func.call @stack_push_pointer(%3695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3699 = func.call @stack_pop_pointer() : () -> i64
      %3700 = func.call @stack_pop_pointer() : () -> i64
      %3701 = func.call @cc_cons(%3700, %3699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3701) : (i64) -> ()
      %3702 = func.call @stack_pop_pointer() : () -> i64
      %3703 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3704 = arith.constant 11 : i64
      %3705 = func.call @cc_make_string(%3703, %3704) : (!llvm.ptr, i64) -> i64
      %3706 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3707 = arith.constant 7 : i64
      %3708 = func.call @cc_make_string(%3706, %3707) : (!llvm.ptr, i64) -> i64
      %3709 = func.call @cc_intern(%3705, %3708) : (i64, i64) -> i64
      %3710 = func.call @cc_nil_value() : () -> i64
      %3711 = func.call @cc_cons(%3709, %3710) : (i64, i64) -> i64
      %3712 = func.call @cc_values_pack(%3711) : (i64) -> i64
      func.call @stack_push_pointer(%3709) : (i64) -> ()
      %3713 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3714 = func.call @stack_pop_pointer() : () -> i64
      %3715 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3716 = arith.constant 4 : i64
      %3717 = func.call @cc_make_string(%3715, %3716) : (!llvm.ptr, i64) -> i64
      %3718 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3719 = arith.constant 7 : i64
      %3720 = func.call @cc_make_string(%3718, %3719) : (!llvm.ptr, i64) -> i64
      %3721 = func.call @cc_intern(%3717, %3720) : (i64, i64) -> i64
      %3722 = func.call @cc_nil_value() : () -> i64
      %3723 = func.call @cc_cons(%3721, %3722) : (i64, i64) -> i64
      %3724 = func.call @cc_values_pack(%3723) : (i64) -> i64
      func.call @stack_push_pointer(%3721) : (i64) -> ()
      %3725 = func.call @stack_pop_pointer() : () -> i64
      %3726 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3727 = arith.constant 5 : i64
      %3728 = func.call @cc_make_string(%3726, %3727) : (!llvm.ptr, i64) -> i64
      %3729 = func.call @cc_nil_value() : () -> i64
      %3730 = func.call @cc_intern(%3728, %3729) : (i64, i64) -> i64
      %3731 = func.call @cc_nil_value() : () -> i64
      %3732 = func.call @cc_cons(%3730, %3731) : (i64, i64) -> i64
      %3733 = func.call @cc_values_pack(%3732) : (i64) -> i64
      func.call @stack_push_pointer(%3730) : (i64) -> ()
      %3734 = func.call @stack_pop_pointer() : () -> i64
      %3735 = func.call @cc_nil_value() : () -> i64
      %3736 = func.call @cc_errorp(%3408) : (i64) -> i64
      %3737 = arith.cmpi ne, %3736, %3735 : i64
      %3738 = arith.cmpi eq, %3735, %3735 : i64
      %3739 = arith.andi %3737, %3738 : i1
      %3740 = scf.if %3739 -> (i64) {
        scf.yield %3408 : i64
      } else {
        scf.yield %3735 : i64
      }
      %3741 = func.call @cc_errorp(%3564) : (i64) -> i64
      %3742 = arith.cmpi ne, %3741, %3735 : i64
      %3743 = arith.cmpi eq, %3740, %3735 : i64
      %3744 = arith.andi %3742, %3743 : i1
      %3745 = scf.if %3744 -> (i64) {
        scf.yield %3564 : i64
      } else {
        scf.yield %3740 : i64
      }
      %3746 = func.call @cc_errorp(%3688) : (i64) -> i64
      %3747 = arith.cmpi ne, %3746, %3735 : i64
      %3748 = arith.cmpi eq, %3745, %3735 : i64
      %3749 = arith.andi %3747, %3748 : i1
      %3750 = scf.if %3749 -> (i64) {
        scf.yield %3688 : i64
      } else {
        scf.yield %3745 : i64
      }
      %3751 = func.call @cc_errorp(%3702) : (i64) -> i64
      %3752 = arith.cmpi ne, %3751, %3735 : i64
      %3753 = arith.cmpi eq, %3750, %3735 : i64
      %3754 = arith.andi %3752, %3753 : i1
      %3755 = scf.if %3754 -> (i64) {
        scf.yield %3702 : i64
      } else {
        scf.yield %3750 : i64
      }
      %3756 = func.call @cc_errorp(%3713) : (i64) -> i64
      %3757 = arith.cmpi ne, %3756, %3735 : i64
      %3758 = arith.cmpi eq, %3755, %3735 : i64
      %3759 = arith.andi %3757, %3758 : i1
      %3760 = scf.if %3759 -> (i64) {
        scf.yield %3713 : i64
      } else {
        scf.yield %3755 : i64
      }
      %3761 = func.call @cc_errorp(%3714) : (i64) -> i64
      %3762 = arith.cmpi ne, %3761, %3735 : i64
      %3763 = arith.cmpi eq, %3760, %3735 : i64
      %3764 = arith.andi %3762, %3763 : i1
      %3765 = scf.if %3764 -> (i64) {
        scf.yield %3714 : i64
      } else {
        scf.yield %3760 : i64
      }
      %3766 = func.call @cc_errorp(%3725) : (i64) -> i64
      %3767 = arith.cmpi ne, %3766, %3735 : i64
      %3768 = arith.cmpi eq, %3765, %3735 : i64
      %3769 = arith.andi %3767, %3768 : i1
      %3770 = scf.if %3769 -> (i64) {
        scf.yield %3725 : i64
      } else {
        scf.yield %3765 : i64
      }
      %3771 = func.call @cc_errorp(%3734) : (i64) -> i64
      %3772 = arith.cmpi ne, %3771, %3735 : i64
      %3773 = arith.cmpi eq, %3770, %3735 : i64
      %3774 = arith.andi %3772, %3773 : i1
      %3775 = scf.if %3774 -> (i64) {
        scf.yield %3734 : i64
      } else {
        scf.yield %3770 : i64
      }
      %3776 = arith.cmpi ne, %3775, %3735 : i64
      scf.if %3776 {
        func.call @stack_push_pointer(%3775) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3408) : (i64) -> ()
        func.call @stack_push_pointer(%3564) : (i64) -> ()
        func.call @stack_push_pointer(%3688) : (i64) -> ()
        func.call @stack_push_pointer(%3702) : (i64) -> ()
        func.call @stack_push_pointer(%3713) : (i64) -> ()
        func.call @stack_push_pointer(%3714) : (i64) -> ()
        func.call @stack_push_pointer(%3725) : (i64) -> ()
        func.call @stack_push_pointer(%3734) : (i64) -> ()
        %3777 = llvm.mlir.addressof @str302 : !llvm.ptr
        %3778 = func.call @cc_make_function_ref_const(%3777) : (!llvm.ptr) -> i64
        %3779 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3778, %3779) : (i64, i64) -> ()
      }
      %3780 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3780 : i64
    }
    %3781 = func.call @cc_nil_value() : () -> i64
    %3782 = func.call @cc_errorp(%3399) : (i64) -> i64
    %3783 = arith.cmpi ne, %3782, %3781 : i64
    %3784 = scf.if %3783 -> (i64) {
      scf.yield %3399 : i64
    } else {
      %3785 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3786 = arith.constant 12 : i64
      %3787 = func.call @cc_make_string(%3785, %3786) : (!llvm.ptr, i64) -> i64
      %3788 = func.call @cc_nil_value() : () -> i64
      %3789 = func.call @cc_intern(%3787, %3788) : (i64, i64) -> i64
      %3790 = func.call @cc_nil_value() : () -> i64
      %3791 = func.call @cc_cons(%3789, %3790) : (i64, i64) -> i64
      %3792 = func.call @cc_values_pack(%3791) : (i64) -> i64
      func.call @stack_push_pointer(%3789) : (i64) -> ()
      %3793 = func.call @stack_pop_pointer() : () -> i64
      %3794 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3795 = arith.constant 3 : i64
      %3796 = func.call @cc_make_string(%3794, %3795) : (!llvm.ptr, i64) -> i64
      %3797 = func.call @cc_nil_value() : () -> i64
      %3798 = func.call @cc_intern(%3796, %3797) : (i64, i64) -> i64
      %3799 = func.call @cc_nil_value() : () -> i64
      %3800 = func.call @cc_cons(%3798, %3799) : (i64, i64) -> i64
      %3801 = func.call @cc_values_pack(%3800) : (i64) -> i64
      func.call @stack_push_pointer(%3798) : (i64) -> ()
      %3802 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3803 = arith.constant 3 : i64
      %3804 = func.call @cc_make_string(%3802, %3803) : (!llvm.ptr, i64) -> i64
      %3805 = func.call @cc_nil_value() : () -> i64
      %3806 = func.call @cc_intern(%3804, %3805) : (i64, i64) -> i64
      %3807 = func.call @cc_nil_value() : () -> i64
      %3808 = func.call @cc_cons(%3806, %3807) : (i64, i64) -> i64
      %3809 = func.call @cc_values_pack(%3808) : (i64) -> i64
      func.call @stack_push_pointer(%3806) : (i64) -> ()
      %3810 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3811 = arith.constant 3 : i64
      %3812 = func.call @cc_make_string(%3810, %3811) : (!llvm.ptr, i64) -> i64
      %3813 = func.call @cc_nil_value() : () -> i64
      %3814 = func.call @cc_intern(%3812, %3813) : (i64, i64) -> i64
      %3815 = func.call @cc_nil_value() : () -> i64
      %3816 = func.call @cc_cons(%3814, %3815) : (i64, i64) -> i64
      %3817 = func.call @cc_values_pack(%3816) : (i64) -> i64
      func.call @stack_push_pointer(%3814) : (i64) -> ()
      %3818 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3819 = arith.constant 5 : i64
      %3820 = func.call @cc_make_string(%3818, %3819) : (!llvm.ptr, i64) -> i64
      %3821 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3822 = arith.constant 11 : i64
      %3823 = func.call @cc_make_string(%3821, %3822) : (!llvm.ptr, i64) -> i64
      %3824 = func.call @cc_intern(%3820, %3823) : (i64, i64) -> i64
      %3825 = func.call @cc_nil_value() : () -> i64
      %3826 = func.call @cc_cons(%3824, %3825) : (i64, i64) -> i64
      %3827 = func.call @cc_values_pack(%3826) : (i64) -> i64
      func.call @stack_push_pointer(%3824) : (i64) -> ()
      %3828 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3829 = arith.constant 12 : i64
      %3830 = func.call @cc_make_string(%3828, %3829) : (!llvm.ptr, i64) -> i64
      %3831 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3832 = arith.constant 11 : i64
      %3833 = func.call @cc_make_string(%3831, %3832) : (!llvm.ptr, i64) -> i64
      %3834 = func.call @cc_intern(%3830, %3833) : (i64, i64) -> i64
      %3835 = func.call @cc_nil_value() : () -> i64
      %3836 = func.call @cc_cons(%3834, %3835) : (i64, i64) -> i64
      %3837 = func.call @cc_values_pack(%3836) : (i64) -> i64
      func.call @stack_push_pointer(%3834) : (i64) -> ()
      %3838 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3839 = arith.constant 4 : i64
      %3840 = func.call @cc_make_string(%3838, %3839) : (!llvm.ptr, i64) -> i64
      %3841 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3842 = arith.constant 11 : i64
      %3843 = func.call @cc_make_string(%3841, %3842) : (!llvm.ptr, i64) -> i64
      %3844 = func.call @cc_intern(%3840, %3843) : (i64, i64) -> i64
      %3845 = func.call @cc_nil_value() : () -> i64
      %3846 = func.call @cc_cons(%3844, %3845) : (i64, i64) -> i64
      %3847 = func.call @cc_values_pack(%3846) : (i64) -> i64
      func.call @stack_push_pointer(%3844) : (i64) -> ()
      %3848 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3849 = arith.constant 10 : i64
      %3850 = func.call @cc_make_string(%3848, %3849) : (!llvm.ptr, i64) -> i64
      %3851 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3852 = arith.constant 11 : i64
      %3853 = func.call @cc_make_string(%3851, %3852) : (!llvm.ptr, i64) -> i64
      %3854 = func.call @cc_intern(%3850, %3853) : (i64, i64) -> i64
      %3855 = func.call @cc_nil_value() : () -> i64
      %3856 = func.call @cc_cons(%3854, %3855) : (i64, i64) -> i64
      %3857 = func.call @cc_values_pack(%3856) : (i64) -> i64
      func.call @stack_push_pointer(%3854) : (i64) -> ()
      %3858 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3858) : (i64) -> ()
      %3859 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3859) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3860 = func.call @stack_pop_pointer() : () -> i64
      %3861 = func.call @stack_pop_pointer() : () -> i64
      %3862 = func.call @cc_cons(%3861, %3860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3862) : (i64) -> ()
      %3863 = func.call @stack_pop_pointer() : () -> i64
      %3864 = func.call @stack_pop_pointer() : () -> i64
      %3865 = func.call @cc_cons(%3863, %3864) : (i64, i64) -> i64
      %3866 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3867 = arith.constant 5 : i64
      %3868 = func.call @cc_make_string(%3866, %3867) : (!llvm.ptr, i64) -> i64
      %3869 = func.call @cc_nil_value() : () -> i64
      %3870 = func.call @cc_intern(%3868, %3869) : (i64, i64) -> i64
      %3871 = func.call @cc_nil_value() : () -> i64
      %3872 = func.call @cc_cons(%3870, %3871) : (i64, i64) -> i64
      %3873 = func.call @cc_values_pack(%3872) : (i64) -> i64
      %3874 = func.call @cc_cons(%3870, %3865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3874) : (i64) -> ()
      %3875 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3876 = arith.constant 12 : i64
      %3877 = func.call @cc_make_string(%3875, %3876) : (!llvm.ptr, i64) -> i64
      %3878 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3879 = arith.constant 7 : i64
      %3880 = func.call @cc_make_string(%3878, %3879) : (!llvm.ptr, i64) -> i64
      %3881 = func.call @cc_intern(%3877, %3880) : (i64, i64) -> i64
      %3882 = func.call @cc_nil_value() : () -> i64
      %3883 = func.call @cc_cons(%3881, %3882) : (i64, i64) -> i64
      %3884 = func.call @cc_values_pack(%3883) : (i64) -> i64
      func.call @stack_push_pointer(%3881) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3885 = func.call @stack_pop_pointer() : () -> i64
      %3886 = func.call @stack_pop_pointer() : () -> i64
      %3887 = func.call @cc_cons(%3886, %3885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3887) : (i64) -> ()
      %3888 = func.call @stack_pop_pointer() : () -> i64
      %3889 = func.call @stack_pop_pointer() : () -> i64
      %3890 = func.call @cc_cons(%3889, %3888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3890) : (i64) -> ()
      %3891 = func.call @stack_pop_pointer() : () -> i64
      %3892 = func.call @stack_pop_pointer() : () -> i64
      %3893 = func.call @cc_cons(%3892, %3891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3893) : (i64) -> ()
      %3894 = func.call @stack_pop_pointer() : () -> i64
      %3895 = func.call @stack_pop_pointer() : () -> i64
      %3896 = func.call @cc_cons(%3895, %3894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3897 = func.call @stack_pop_pointer() : () -> i64
      %3898 = func.call @stack_pop_pointer() : () -> i64
      %3899 = func.call @cc_cons(%3898, %3897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3899) : (i64) -> ()
      %3900 = func.call @stack_pop_pointer() : () -> i64
      %3901 = func.call @stack_pop_pointer() : () -> i64
      %3902 = func.call @cc_cons(%3901, %3900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3902) : (i64) -> ()
      %3903 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3904 = arith.constant 5 : i64
      %3905 = func.call @cc_make_string(%3903, %3904) : (!llvm.ptr, i64) -> i64
      %3906 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3907 = arith.constant 11 : i64
      %3908 = func.call @cc_make_string(%3906, %3907) : (!llvm.ptr, i64) -> i64
      %3909 = func.call @cc_intern(%3905, %3908) : (i64, i64) -> i64
      %3910 = func.call @cc_nil_value() : () -> i64
      %3911 = func.call @cc_cons(%3909, %3910) : (i64, i64) -> i64
      %3912 = func.call @cc_values_pack(%3911) : (i64) -> i64
      func.call @stack_push_pointer(%3909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3913 = func.call @stack_pop_pointer() : () -> i64
      %3914 = func.call @stack_pop_pointer() : () -> i64
      %3915 = func.call @cc_cons(%3914, %3913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3915) : (i64) -> ()
      %3916 = func.call @stack_pop_pointer() : () -> i64
      %3917 = func.call @stack_pop_pointer() : () -> i64
      %3918 = func.call @cc_cons(%3917, %3916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3918) : (i64) -> ()
      %3919 = func.call @stack_pop_pointer() : () -> i64
      %3920 = func.call @stack_pop_pointer() : () -> i64
      %3921 = func.call @cc_cons(%3920, %3919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3921) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3922 = func.call @stack_pop_pointer() : () -> i64
      %3923 = func.call @stack_pop_pointer() : () -> i64
      %3924 = func.call @cc_cons(%3923, %3922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3924) : (i64) -> ()
      %3925 = func.call @stack_pop_pointer() : () -> i64
      %3926 = func.call @stack_pop_pointer() : () -> i64
      %3927 = func.call @cc_cons(%3926, %3925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3927) : (i64) -> ()
      %3928 = func.call @stack_pop_pointer() : () -> i64
      %3929 = func.call @stack_pop_pointer() : () -> i64
      %3930 = func.call @cc_cons(%3929, %3928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3930) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3931 = func.call @stack_pop_pointer() : () -> i64
      %3932 = func.call @stack_pop_pointer() : () -> i64
      %3933 = func.call @cc_cons(%3932, %3931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3933) : (i64) -> ()
      %3934 = func.call @stack_pop_pointer() : () -> i64
      %3935 = func.call @stack_pop_pointer() : () -> i64
      %3936 = func.call @cc_cons(%3935, %3934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3936) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3937 = func.call @stack_pop_pointer() : () -> i64
      %3938 = func.call @stack_pop_pointer() : () -> i64
      %3939 = func.call @cc_cons(%3938, %3937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3939) : (i64) -> ()
      %3940 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3941 = arith.constant 2 : i64
      %3942 = func.call @cc_make_string(%3940, %3941) : (!llvm.ptr, i64) -> i64
      %3943 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3944 = arith.constant 11 : i64
      %3945 = func.call @cc_make_string(%3943, %3944) : (!llvm.ptr, i64) -> i64
      %3946 = func.call @cc_intern(%3942, %3945) : (i64, i64) -> i64
      %3947 = func.call @cc_nil_value() : () -> i64
      %3948 = func.call @cc_cons(%3946, %3947) : (i64, i64) -> i64
      %3949 = func.call @cc_values_pack(%3948) : (i64) -> i64
      func.call @stack_push_pointer(%3946) : (i64) -> ()
      %3950 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3951 = arith.constant 4 : i64
      %3952 = func.call @cc_make_string(%3950, %3951) : (!llvm.ptr, i64) -> i64
      %3953 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3954 = arith.constant 11 : i64
      %3955 = func.call @cc_make_string(%3953, %3954) : (!llvm.ptr, i64) -> i64
      %3956 = func.call @cc_intern(%3952, %3955) : (i64, i64) -> i64
      %3957 = func.call @cc_nil_value() : () -> i64
      %3958 = func.call @cc_cons(%3956, %3957) : (i64, i64) -> i64
      %3959 = func.call @cc_values_pack(%3958) : (i64) -> i64
      func.call @stack_push_pointer(%3956) : (i64) -> ()
      %3960 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3961 = arith.constant 5 : i64
      %3962 = func.call @cc_make_string(%3960, %3961) : (!llvm.ptr, i64) -> i64
      %3963 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3964 = arith.constant 11 : i64
      %3965 = func.call @cc_make_string(%3963, %3964) : (!llvm.ptr, i64) -> i64
      %3966 = func.call @cc_intern(%3962, %3965) : (i64, i64) -> i64
      %3967 = func.call @cc_nil_value() : () -> i64
      %3968 = func.call @cc_cons(%3966, %3967) : (i64, i64) -> i64
      %3969 = func.call @cc_values_pack(%3968) : (i64) -> i64
      func.call @stack_push_pointer(%3966) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3970 = func.call @stack_pop_pointer() : () -> i64
      %3971 = func.call @stack_pop_pointer() : () -> i64
      %3972 = func.call @cc_cons(%3971, %3970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3972) : (i64) -> ()
      %3973 = func.call @stack_pop_pointer() : () -> i64
      %3974 = func.call @stack_pop_pointer() : () -> i64
      %3975 = func.call @cc_cons(%3974, %3973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3975) : (i64) -> ()
      %3976 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3977 = arith.constant 6 : i64
      %3978 = func.call @cc_make_string(%3976, %3977) : (!llvm.ptr, i64) -> i64
      %3979 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3980 = arith.constant 11 : i64
      %3981 = func.call @cc_make_string(%3979, %3980) : (!llvm.ptr, i64) -> i64
      %3982 = func.call @cc_intern(%3978, %3981) : (i64, i64) -> i64
      %3983 = func.call @cc_nil_value() : () -> i64
      %3984 = func.call @cc_cons(%3982, %3983) : (i64, i64) -> i64
      %3985 = func.call @cc_values_pack(%3984) : (i64) -> i64
      func.call @stack_push_pointer(%3982) : (i64) -> ()
      %3986 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3987 = arith.constant 5 : i64
      %3988 = func.call @cc_make_string(%3986, %3987) : (!llvm.ptr, i64) -> i64
      %3989 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3990 = arith.constant 11 : i64
      %3991 = func.call @cc_make_string(%3989, %3990) : (!llvm.ptr, i64) -> i64
      %3992 = func.call @cc_intern(%3988, %3991) : (i64, i64) -> i64
      %3993 = func.call @cc_nil_value() : () -> i64
      %3994 = func.call @cc_cons(%3992, %3993) : (i64, i64) -> i64
      %3995 = func.call @cc_values_pack(%3994) : (i64) -> i64
      func.call @stack_push_pointer(%3992) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3996 = func.call @stack_pop_pointer() : () -> i64
      %3997 = func.call @stack_pop_pointer() : () -> i64
      %3998 = func.call @cc_cons(%3997, %3996) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3998) : (i64) -> ()
      %3999 = func.call @stack_pop_pointer() : () -> i64
      %4000 = func.call @stack_pop_pointer() : () -> i64
      %4001 = func.call @cc_cons(%4000, %3999) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4001) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4002 = func.call @stack_pop_pointer() : () -> i64
      %4003 = func.call @stack_pop_pointer() : () -> i64
      %4004 = func.call @cc_cons(%4003, %4002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4004) : (i64) -> ()
      %4005 = func.call @stack_pop_pointer() : () -> i64
      %4006 = func.call @stack_pop_pointer() : () -> i64
      %4007 = func.call @cc_cons(%4006, %4005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4007) : (i64) -> ()
      %4008 = func.call @stack_pop_pointer() : () -> i64
      %4009 = func.call @stack_pop_pointer() : () -> i64
      %4010 = func.call @cc_cons(%4009, %4008) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4010) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4011 = func.call @stack_pop_pointer() : () -> i64
      %4012 = func.call @stack_pop_pointer() : () -> i64
      %4013 = func.call @cc_cons(%4012, %4011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4013) : (i64) -> ()
      %4014 = func.call @stack_pop_pointer() : () -> i64
      %4015 = func.call @stack_pop_pointer() : () -> i64
      %4016 = func.call @cc_cons(%4015, %4014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4016) : (i64) -> ()
      %4017 = func.call @stack_pop_pointer() : () -> i64
      %4018 = func.call @stack_pop_pointer() : () -> i64
      %4019 = func.call @cc_cons(%4018, %4017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4019) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4020 = func.call @stack_pop_pointer() : () -> i64
      %4021 = func.call @stack_pop_pointer() : () -> i64
      %4022 = func.call @cc_cons(%4021, %4020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4022) : (i64) -> ()
      %4023 = func.call @stack_pop_pointer() : () -> i64
      %4024 = func.call @stack_pop_pointer() : () -> i64
      %4025 = func.call @cc_cons(%4024, %4023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4026 = func.call @stack_pop_pointer() : () -> i64
      %4027 = func.call @stack_pop_pointer() : () -> i64
      %4028 = func.call @cc_cons(%4027, %4026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4028) : (i64) -> ()
      %4029 = func.call @stack_pop_pointer() : () -> i64
      %4030 = func.call @stack_pop_pointer() : () -> i64
      %4031 = func.call @cc_cons(%4030, %4029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4031) : (i64) -> ()
      %4032 = func.call @stack_pop_pointer() : () -> i64
      %4138 = arith.constant 15079495958542 : i64
      %4139 = arith.constant 0 : i64
      %4140 = func.call @cc_make_closure(%4138, %4139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4140) : (i64) -> ()
      %4141 = func.call @stack_pop_pointer() : () -> i64
      %4142 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4143 = arith.constant 1 : i64
      %4144 = func.call @cc_make_string(%4142, %4143) : (!llvm.ptr, i64) -> i64
      %4145 = func.call @cc_nil_value() : () -> i64
      %4146 = func.call @cc_intern(%4144, %4145) : (i64, i64) -> i64
      %4147 = func.call @cc_nil_value() : () -> i64
      %4148 = func.call @cc_cons(%4146, %4147) : (i64, i64) -> i64
      %4149 = func.call @cc_values_pack(%4148) : (i64) -> i64
      func.call @stack_push_pointer(%4146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4150 = func.call @stack_pop_pointer() : () -> i64
      %4151 = func.call @stack_pop_pointer() : () -> i64
      %4152 = func.call @cc_cons(%4151, %4150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4152) : (i64) -> ()
      %4153 = func.call @stack_pop_pointer() : () -> i64
      %4154 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4155 = arith.constant 11 : i64
      %4156 = func.call @cc_make_string(%4154, %4155) : (!llvm.ptr, i64) -> i64
      %4157 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4158 = arith.constant 7 : i64
      %4159 = func.call @cc_make_string(%4157, %4158) : (!llvm.ptr, i64) -> i64
      %4160 = func.call @cc_intern(%4156, %4159) : (i64, i64) -> i64
      %4161 = func.call @cc_nil_value() : () -> i64
      %4162 = func.call @cc_cons(%4160, %4161) : (i64, i64) -> i64
      %4163 = func.call @cc_values_pack(%4162) : (i64) -> i64
      func.call @stack_push_pointer(%4160) : (i64) -> ()
      %4164 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4167 = arith.constant 4 : i64
      %4168 = func.call @cc_make_string(%4166, %4167) : (!llvm.ptr, i64) -> i64
      %4169 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4170 = arith.constant 7 : i64
      %4171 = func.call @cc_make_string(%4169, %4170) : (!llvm.ptr, i64) -> i64
      %4172 = func.call @cc_intern(%4168, %4171) : (i64, i64) -> i64
      %4173 = func.call @cc_nil_value() : () -> i64
      %4174 = func.call @cc_cons(%4172, %4173) : (i64, i64) -> i64
      %4175 = func.call @cc_values_pack(%4174) : (i64) -> i64
      func.call @stack_push_pointer(%4172) : (i64) -> ()
      %4176 = func.call @stack_pop_pointer() : () -> i64
      %4177 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4178 = arith.constant 6 : i64
      %4179 = func.call @cc_make_string(%4177, %4178) : (!llvm.ptr, i64) -> i64
      %4180 = func.call @cc_nil_value() : () -> i64
      %4181 = func.call @cc_intern(%4179, %4180) : (i64, i64) -> i64
      %4182 = func.call @cc_nil_value() : () -> i64
      %4183 = func.call @cc_cons(%4181, %4182) : (i64, i64) -> i64
      %4184 = func.call @cc_values_pack(%4183) : (i64) -> i64
      func.call @stack_push_pointer(%4181) : (i64) -> ()
      %4185 = func.call @stack_pop_pointer() : () -> i64
      %4186 = func.call @cc_nil_value() : () -> i64
      %4187 = func.call @cc_errorp(%3793) : (i64) -> i64
      %4188 = arith.cmpi ne, %4187, %4186 : i64
      %4189 = arith.cmpi eq, %4186, %4186 : i64
      %4190 = arith.andi %4188, %4189 : i1
      %4191 = scf.if %4190 -> (i64) {
        scf.yield %3793 : i64
      } else {
        scf.yield %4186 : i64
      }
      %4192 = func.call @cc_errorp(%4032) : (i64) -> i64
      %4193 = arith.cmpi ne, %4192, %4186 : i64
      %4194 = arith.cmpi eq, %4191, %4186 : i64
      %4195 = arith.andi %4193, %4194 : i1
      %4196 = scf.if %4195 -> (i64) {
        scf.yield %4032 : i64
      } else {
        scf.yield %4191 : i64
      }
      %4197 = func.call @cc_errorp(%4141) : (i64) -> i64
      %4198 = arith.cmpi ne, %4197, %4186 : i64
      %4199 = arith.cmpi eq, %4196, %4186 : i64
      %4200 = arith.andi %4198, %4199 : i1
      %4201 = scf.if %4200 -> (i64) {
        scf.yield %4141 : i64
      } else {
        scf.yield %4196 : i64
      }
      %4202 = func.call @cc_errorp(%4153) : (i64) -> i64
      %4203 = arith.cmpi ne, %4202, %4186 : i64
      %4204 = arith.cmpi eq, %4201, %4186 : i64
      %4205 = arith.andi %4203, %4204 : i1
      %4206 = scf.if %4205 -> (i64) {
        scf.yield %4153 : i64
      } else {
        scf.yield %4201 : i64
      }
      %4207 = func.call @cc_errorp(%4164) : (i64) -> i64
      %4208 = arith.cmpi ne, %4207, %4186 : i64
      %4209 = arith.cmpi eq, %4206, %4186 : i64
      %4210 = arith.andi %4208, %4209 : i1
      %4211 = scf.if %4210 -> (i64) {
        scf.yield %4164 : i64
      } else {
        scf.yield %4206 : i64
      }
      %4212 = func.call @cc_errorp(%4165) : (i64) -> i64
      %4213 = arith.cmpi ne, %4212, %4186 : i64
      %4214 = arith.cmpi eq, %4211, %4186 : i64
      %4215 = arith.andi %4213, %4214 : i1
      %4216 = scf.if %4215 -> (i64) {
        scf.yield %4165 : i64
      } else {
        scf.yield %4211 : i64
      }
      %4217 = func.call @cc_errorp(%4176) : (i64) -> i64
      %4218 = arith.cmpi ne, %4217, %4186 : i64
      %4219 = arith.cmpi eq, %4216, %4186 : i64
      %4220 = arith.andi %4218, %4219 : i1
      %4221 = scf.if %4220 -> (i64) {
        scf.yield %4176 : i64
      } else {
        scf.yield %4216 : i64
      }
      %4222 = func.call @cc_errorp(%4185) : (i64) -> i64
      %4223 = arith.cmpi ne, %4222, %4186 : i64
      %4224 = arith.cmpi eq, %4221, %4186 : i64
      %4225 = arith.andi %4223, %4224 : i1
      %4226 = scf.if %4225 -> (i64) {
        scf.yield %4185 : i64
      } else {
        scf.yield %4221 : i64
      }
      %4227 = arith.cmpi ne, %4226, %4186 : i64
      scf.if %4227 {
        func.call @stack_push_pointer(%4226) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3793) : (i64) -> ()
        func.call @stack_push_pointer(%4032) : (i64) -> ()
        func.call @stack_push_pointer(%4141) : (i64) -> ()
        func.call @stack_push_pointer(%4153) : (i64) -> ()
        func.call @stack_push_pointer(%4164) : (i64) -> ()
        func.call @stack_push_pointer(%4165) : (i64) -> ()
        func.call @stack_push_pointer(%4176) : (i64) -> ()
        func.call @stack_push_pointer(%4185) : (i64) -> ()
        %4228 = llvm.mlir.addressof @str341 : !llvm.ptr
        %4229 = func.call @cc_make_function_ref_const(%4228) : (!llvm.ptr) -> i64
        %4230 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4229, %4230) : (i64, i64) -> ()
      }
      %4231 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4231 : i64
    }
    %4232 = func.call @cc_nil_value() : () -> i64
    %4233 = func.call @cc_errorp(%3784) : (i64) -> i64
    %4234 = arith.cmpi ne, %4233, %4232 : i64
    %4235 = scf.if %4234 -> (i64) {
      scf.yield %3784 : i64
    } else {
      %4236 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4237 = arith.constant 12 : i64
      %4238 = func.call @cc_make_string(%4236, %4237) : (!llvm.ptr, i64) -> i64
      %4239 = func.call @cc_nil_value() : () -> i64
      %4240 = func.call @cc_intern(%4238, %4239) : (i64, i64) -> i64
      %4241 = func.call @cc_nil_value() : () -> i64
      %4242 = func.call @cc_cons(%4240, %4241) : (i64, i64) -> i64
      %4243 = func.call @cc_values_pack(%4242) : (i64) -> i64
      func.call @stack_push_pointer(%4240) : (i64) -> ()
      %4244 = func.call @stack_pop_pointer() : () -> i64
      %4245 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4246 = arith.constant 3 : i64
      %4247 = func.call @cc_make_string(%4245, %4246) : (!llvm.ptr, i64) -> i64
      %4248 = func.call @cc_nil_value() : () -> i64
      %4249 = func.call @cc_intern(%4247, %4248) : (i64, i64) -> i64
      %4250 = func.call @cc_nil_value() : () -> i64
      %4251 = func.call @cc_cons(%4249, %4250) : (i64, i64) -> i64
      %4252 = func.call @cc_values_pack(%4251) : (i64) -> i64
      func.call @stack_push_pointer(%4249) : (i64) -> ()
      %4253 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4254 = arith.constant 13 : i64
      %4255 = func.call @cc_make_string(%4253, %4254) : (!llvm.ptr, i64) -> i64
      %4256 = func.call @cc_nil_value() : () -> i64
      %4257 = func.call @cc_intern(%4255, %4256) : (i64, i64) -> i64
      %4258 = func.call @cc_nil_value() : () -> i64
      %4259 = func.call @cc_cons(%4257, %4258) : (i64, i64) -> i64
      %4260 = func.call @cc_values_pack(%4259) : (i64) -> i64
      func.call @stack_push_pointer(%4257) : (i64) -> ()
      %4261 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4262 = arith.constant 10 : i64
      %4263 = func.call @cc_make_string(%4261, %4262) : (!llvm.ptr, i64) -> i64
      %4264 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4265 = arith.constant 11 : i64
      %4266 = func.call @cc_make_string(%4264, %4265) : (!llvm.ptr, i64) -> i64
      %4267 = func.call @cc_intern(%4263, %4266) : (i64, i64) -> i64
      %4268 = func.call @cc_nil_value() : () -> i64
      %4269 = func.call @cc_cons(%4267, %4268) : (i64, i64) -> i64
      %4270 = func.call @cc_values_pack(%4269) : (i64) -> i64
      func.call @stack_push_pointer(%4267) : (i64) -> ()
      %4271 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4271) : (i64) -> ()
      %4272 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4272) : (i64) -> ()
      %4273 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4273) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4274 = func.call @stack_pop_pointer() : () -> i64
      %4275 = func.call @stack_pop_pointer() : () -> i64
      %4276 = func.call @cc_cons(%4275, %4274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4276) : (i64) -> ()
      %4277 = func.call @stack_pop_pointer() : () -> i64
      %4278 = func.call @stack_pop_pointer() : () -> i64
      %4279 = func.call @cc_cons(%4278, %4277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4279) : (i64) -> ()
      %4280 = func.call @stack_pop_pointer() : () -> i64
      %4281 = func.call @stack_pop_pointer() : () -> i64
      %4282 = func.call @cc_cons(%4280, %4281) : (i64, i64) -> i64
      %4283 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4284 = arith.constant 5 : i64
      %4285 = func.call @cc_make_string(%4283, %4284) : (!llvm.ptr, i64) -> i64
      %4286 = func.call @cc_nil_value() : () -> i64
      %4287 = func.call @cc_intern(%4285, %4286) : (i64, i64) -> i64
      %4288 = func.call @cc_nil_value() : () -> i64
      %4289 = func.call @cc_cons(%4287, %4288) : (i64, i64) -> i64
      %4290 = func.call @cc_values_pack(%4289) : (i64) -> i64
      %4291 = func.call @cc_cons(%4287, %4282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4291) : (i64) -> ()
      %4292 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4293 = arith.constant 15 : i64
      %4294 = func.call @cc_make_string(%4292, %4293) : (!llvm.ptr, i64) -> i64
      %4295 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4296 = arith.constant 7 : i64
      %4297 = func.call @cc_make_string(%4295, %4296) : (!llvm.ptr, i64) -> i64
      %4298 = func.call @cc_intern(%4294, %4297) : (i64, i64) -> i64
      %4299 = func.call @cc_nil_value() : () -> i64
      %4300 = func.call @cc_cons(%4298, %4299) : (i64, i64) -> i64
      %4301 = func.call @cc_values_pack(%4300) : (i64) -> i64
      func.call @stack_push_pointer(%4298) : (i64) -> ()
      %4302 = arith.constant 97 : i64
      %4303 = func.call @cc_box_character(%4302) : (i64) -> i64
      func.call @stack_push_pointer(%4303) : (i64) -> ()
      %4304 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4305 = arith.constant 12 : i64
      %4306 = func.call @cc_make_string(%4304, %4305) : (!llvm.ptr, i64) -> i64
      %4307 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4308 = arith.constant 7 : i64
      %4309 = func.call @cc_make_string(%4307, %4308) : (!llvm.ptr, i64) -> i64
      %4310 = func.call @cc_intern(%4306, %4309) : (i64, i64) -> i64
      %4311 = func.call @cc_nil_value() : () -> i64
      %4312 = func.call @cc_cons(%4310, %4311) : (i64, i64) -> i64
      %4313 = func.call @cc_values_pack(%4312) : (i64) -> i64
      func.call @stack_push_pointer(%4310) : (i64) -> ()
      %4314 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4314) : (i64) -> ()
      %4315 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4316 = arith.constant 9 : i64
      %4317 = func.call @cc_make_string(%4315, %4316) : (!llvm.ptr, i64) -> i64
      %4318 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4319 = arith.constant 11 : i64
      %4320 = func.call @cc_make_string(%4318, %4319) : (!llvm.ptr, i64) -> i64
      %4321 = func.call @cc_intern(%4317, %4320) : (i64, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_cons(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_values_pack(%4323) : (i64) -> i64
      func.call @stack_push_pointer(%4321) : (i64) -> ()
      %4325 = func.call @stack_pop_pointer() : () -> i64
      %4326 = func.call @stack_pop_pointer() : () -> i64
      %4327 = func.call @cc_cons(%4325, %4326) : (i64, i64) -> i64
      %4328 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4329 = arith.constant 5 : i64
      %4330 = func.call @cc_make_string(%4328, %4329) : (!llvm.ptr, i64) -> i64
      %4331 = func.call @cc_nil_value() : () -> i64
      %4332 = func.call @cc_intern(%4330, %4331) : (i64, i64) -> i64
      %4333 = func.call @cc_nil_value() : () -> i64
      %4334 = func.call @cc_cons(%4332, %4333) : (i64, i64) -> i64
      %4335 = func.call @cc_values_pack(%4334) : (i64) -> i64
      %4336 = func.call @cc_cons(%4332, %4327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4336) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4337 = func.call @stack_pop_pointer() : () -> i64
      %4338 = func.call @stack_pop_pointer() : () -> i64
      %4339 = func.call @cc_cons(%4338, %4337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4339) : (i64) -> ()
      %4340 = func.call @stack_pop_pointer() : () -> i64
      %4341 = func.call @stack_pop_pointer() : () -> i64
      %4342 = func.call @cc_cons(%4341, %4340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4342) : (i64) -> ()
      %4343 = func.call @stack_pop_pointer() : () -> i64
      %4344 = func.call @stack_pop_pointer() : () -> i64
      %4345 = func.call @cc_cons(%4344, %4343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4345) : (i64) -> ()
      %4346 = func.call @stack_pop_pointer() : () -> i64
      %4347 = func.call @stack_pop_pointer() : () -> i64
      %4348 = func.call @cc_cons(%4347, %4346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4348) : (i64) -> ()
      %4349 = func.call @stack_pop_pointer() : () -> i64
      %4350 = func.call @stack_pop_pointer() : () -> i64
      %4351 = func.call @cc_cons(%4350, %4349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4351) : (i64) -> ()
      %4352 = func.call @stack_pop_pointer() : () -> i64
      %4353 = func.call @stack_pop_pointer() : () -> i64
      %4354 = func.call @cc_cons(%4353, %4352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4354) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4355 = func.call @stack_pop_pointer() : () -> i64
      %4356 = func.call @stack_pop_pointer() : () -> i64
      %4357 = func.call @cc_cons(%4356, %4355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4357) : (i64) -> ()
      %4358 = func.call @stack_pop_pointer() : () -> i64
      %4359 = func.call @stack_pop_pointer() : () -> i64
      %4360 = func.call @cc_cons(%4359, %4358) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4360) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4361 = func.call @stack_pop_pointer() : () -> i64
      %4362 = func.call @stack_pop_pointer() : () -> i64
      %4363 = func.call @cc_cons(%4362, %4361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4363) : (i64) -> ()
      %4364 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4365 = arith.constant 4 : i64
      %4366 = func.call @cc_make_string(%4364, %4365) : (!llvm.ptr, i64) -> i64
      %4367 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4368 = arith.constant 11 : i64
      %4369 = func.call @cc_make_string(%4367, %4368) : (!llvm.ptr, i64) -> i64
      %4370 = func.call @cc_intern(%4366, %4369) : (i64, i64) -> i64
      %4371 = func.call @cc_nil_value() : () -> i64
      %4372 = func.call @cc_cons(%4370, %4371) : (i64, i64) -> i64
      %4373 = func.call @cc_values_pack(%4372) : (i64) -> i64
      func.call @stack_push_pointer(%4370) : (i64) -> ()
      %4374 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4375 = arith.constant 13 : i64
      %4376 = func.call @cc_make_string(%4374, %4375) : (!llvm.ptr, i64) -> i64
      %4377 = func.call @cc_nil_value() : () -> i64
      %4378 = func.call @cc_intern(%4376, %4377) : (i64, i64) -> i64
      %4379 = func.call @cc_nil_value() : () -> i64
      %4380 = func.call @cc_cons(%4378, %4379) : (i64, i64) -> i64
      %4381 = func.call @cc_values_pack(%4380) : (i64) -> i64
      func.call @stack_push_pointer(%4378) : (i64) -> ()
      %4382 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4382) : (i64) -> ()
      %4383 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4383) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4384 = func.call @stack_pop_pointer() : () -> i64
      %4385 = func.call @stack_pop_pointer() : () -> i64
      %4386 = func.call @cc_cons(%4385, %4384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4386) : (i64) -> ()
      %4387 = func.call @stack_pop_pointer() : () -> i64
      %4388 = func.call @stack_pop_pointer() : () -> i64
      %4389 = func.call @cc_cons(%4388, %4387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4389) : (i64) -> ()
      %4390 = func.call @stack_pop_pointer() : () -> i64
      %4391 = func.call @stack_pop_pointer() : () -> i64
      %4392 = func.call @cc_cons(%4391, %4390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4392) : (i64) -> ()
      %4393 = func.call @stack_pop_pointer() : () -> i64
      %4394 = func.call @stack_pop_pointer() : () -> i64
      %4395 = func.call @cc_cons(%4394, %4393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4396 = func.call @stack_pop_pointer() : () -> i64
      %4397 = func.call @stack_pop_pointer() : () -> i64
      %4398 = func.call @cc_cons(%4397, %4396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4398) : (i64) -> ()
      %4399 = func.call @stack_pop_pointer() : () -> i64
      %4400 = func.call @stack_pop_pointer() : () -> i64
      %4401 = func.call @cc_cons(%4400, %4399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4401) : (i64) -> ()
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = func.call @stack_pop_pointer() : () -> i64
      %4404 = func.call @cc_cons(%4403, %4402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4404) : (i64) -> ()
      %4405 = func.call @stack_pop_pointer() : () -> i64
      %4519 = arith.constant 15079495958543 : i64
      %4520 = arith.constant 0 : i64
      %4521 = func.call @cc_make_closure(%4519, %4520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4521) : (i64) -> ()
      %4522 = func.call @stack_pop_pointer() : () -> i64
      %4523 = arith.constant 97 : i64
      %4524 = func.call @cc_box_character(%4523) : (i64) -> i64
      func.call @stack_push_pointer(%4524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4525 = func.call @stack_pop_pointer() : () -> i64
      %4526 = func.call @stack_pop_pointer() : () -> i64
      %4527 = func.call @cc_cons(%4526, %4525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4527) : (i64) -> ()
      %4528 = func.call @stack_pop_pointer() : () -> i64
      %4529 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4530 = arith.constant 11 : i64
      %4531 = func.call @cc_make_string(%4529, %4530) : (!llvm.ptr, i64) -> i64
      %4532 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4533 = arith.constant 7 : i64
      %4534 = func.call @cc_make_string(%4532, %4533) : (!llvm.ptr, i64) -> i64
      %4535 = func.call @cc_intern(%4531, %4534) : (i64, i64) -> i64
      %4536 = func.call @cc_nil_value() : () -> i64
      %4537 = func.call @cc_cons(%4535, %4536) : (i64, i64) -> i64
      %4538 = func.call @cc_values_pack(%4537) : (i64) -> i64
      func.call @stack_push_pointer(%4535) : (i64) -> ()
      %4539 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4540 = func.call @stack_pop_pointer() : () -> i64
      %4541 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4542 = arith.constant 4 : i64
      %4543 = func.call @cc_make_string(%4541, %4542) : (!llvm.ptr, i64) -> i64
      %4544 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4545 = arith.constant 7 : i64
      %4546 = func.call @cc_make_string(%4544, %4545) : (!llvm.ptr, i64) -> i64
      %4547 = func.call @cc_intern(%4543, %4546) : (i64, i64) -> i64
      %4548 = func.call @cc_nil_value() : () -> i64
      %4549 = func.call @cc_cons(%4547, %4548) : (i64, i64) -> i64
      %4550 = func.call @cc_values_pack(%4549) : (i64) -> i64
      func.call @stack_push_pointer(%4547) : (i64) -> ()
      %4551 = func.call @stack_pop_pointer() : () -> i64
      %4552 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4553 = arith.constant 6 : i64
      %4554 = func.call @cc_make_string(%4552, %4553) : (!llvm.ptr, i64) -> i64
      %4555 = func.call @cc_nil_value() : () -> i64
      %4556 = func.call @cc_intern(%4554, %4555) : (i64, i64) -> i64
      %4557 = func.call @cc_nil_value() : () -> i64
      %4558 = func.call @cc_cons(%4556, %4557) : (i64, i64) -> i64
      %4559 = func.call @cc_values_pack(%4558) : (i64) -> i64
      func.call @stack_push_pointer(%4556) : (i64) -> ()
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @cc_nil_value() : () -> i64
      %4562 = func.call @cc_errorp(%4244) : (i64) -> i64
      %4563 = arith.cmpi ne, %4562, %4561 : i64
      %4564 = arith.cmpi eq, %4561, %4561 : i64
      %4565 = arith.andi %4563, %4564 : i1
      %4566 = scf.if %4565 -> (i64) {
        scf.yield %4244 : i64
      } else {
        scf.yield %4561 : i64
      }
      %4567 = func.call @cc_errorp(%4405) : (i64) -> i64
      %4568 = arith.cmpi ne, %4567, %4561 : i64
      %4569 = arith.cmpi eq, %4566, %4561 : i64
      %4570 = arith.andi %4568, %4569 : i1
      %4571 = scf.if %4570 -> (i64) {
        scf.yield %4405 : i64
      } else {
        scf.yield %4566 : i64
      }
      %4572 = func.call @cc_errorp(%4522) : (i64) -> i64
      %4573 = arith.cmpi ne, %4572, %4561 : i64
      %4574 = arith.cmpi eq, %4571, %4561 : i64
      %4575 = arith.andi %4573, %4574 : i1
      %4576 = scf.if %4575 -> (i64) {
        scf.yield %4522 : i64
      } else {
        scf.yield %4571 : i64
      }
      %4577 = func.call @cc_errorp(%4528) : (i64) -> i64
      %4578 = arith.cmpi ne, %4577, %4561 : i64
      %4579 = arith.cmpi eq, %4576, %4561 : i64
      %4580 = arith.andi %4578, %4579 : i1
      %4581 = scf.if %4580 -> (i64) {
        scf.yield %4528 : i64
      } else {
        scf.yield %4576 : i64
      }
      %4582 = func.call @cc_errorp(%4539) : (i64) -> i64
      %4583 = arith.cmpi ne, %4582, %4561 : i64
      %4584 = arith.cmpi eq, %4581, %4561 : i64
      %4585 = arith.andi %4583, %4584 : i1
      %4586 = scf.if %4585 -> (i64) {
        scf.yield %4539 : i64
      } else {
        scf.yield %4581 : i64
      }
      %4587 = func.call @cc_errorp(%4540) : (i64) -> i64
      %4588 = arith.cmpi ne, %4587, %4561 : i64
      %4589 = arith.cmpi eq, %4586, %4561 : i64
      %4590 = arith.andi %4588, %4589 : i1
      %4591 = scf.if %4590 -> (i64) {
        scf.yield %4540 : i64
      } else {
        scf.yield %4586 : i64
      }
      %4592 = func.call @cc_errorp(%4551) : (i64) -> i64
      %4593 = arith.cmpi ne, %4592, %4561 : i64
      %4594 = arith.cmpi eq, %4591, %4561 : i64
      %4595 = arith.andi %4593, %4594 : i1
      %4596 = scf.if %4595 -> (i64) {
        scf.yield %4551 : i64
      } else {
        scf.yield %4591 : i64
      }
      %4597 = func.call @cc_errorp(%4560) : (i64) -> i64
      %4598 = arith.cmpi ne, %4597, %4561 : i64
      %4599 = arith.cmpi eq, %4596, %4561 : i64
      %4600 = arith.andi %4598, %4599 : i1
      %4601 = scf.if %4600 -> (i64) {
        scf.yield %4560 : i64
      } else {
        scf.yield %4596 : i64
      }
      %4602 = arith.cmpi ne, %4601, %4561 : i64
      scf.if %4602 {
        func.call @stack_push_pointer(%4601) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4244) : (i64) -> ()
        func.call @stack_push_pointer(%4405) : (i64) -> ()
        func.call @stack_push_pointer(%4522) : (i64) -> ()
        func.call @stack_push_pointer(%4528) : (i64) -> ()
        func.call @stack_push_pointer(%4539) : (i64) -> ()
        func.call @stack_push_pointer(%4540) : (i64) -> ()
        func.call @stack_push_pointer(%4551) : (i64) -> ()
        func.call @stack_push_pointer(%4560) : (i64) -> ()
        %4603 = llvm.mlir.addressof @str371 : !llvm.ptr
        %4604 = func.call @cc_make_function_ref_const(%4603) : (!llvm.ptr) -> i64
        %4605 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4604, %4605) : (i64, i64) -> ()
      }
      %4606 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4606 : i64
    }
    %4607 = func.call @cc_nil_value() : () -> i64
    %4608 = func.call @cc_errorp(%4235) : (i64) -> i64
    %4609 = arith.cmpi ne, %4608, %4607 : i64
    %4610 = scf.if %4609 -> (i64) {
      scf.yield %4235 : i64
    } else {
      %4611 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4612 = arith.constant 12 : i64
      %4613 = func.call @cc_make_string(%4611, %4612) : (!llvm.ptr, i64) -> i64
      %4614 = func.call @cc_nil_value() : () -> i64
      %4615 = func.call @cc_intern(%4613, %4614) : (i64, i64) -> i64
      %4616 = func.call @cc_nil_value() : () -> i64
      %4617 = func.call @cc_cons(%4615, %4616) : (i64, i64) -> i64
      %4618 = func.call @cc_values_pack(%4617) : (i64) -> i64
      func.call @stack_push_pointer(%4615) : (i64) -> ()
      %4619 = func.call @stack_pop_pointer() : () -> i64
      %4620 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4621 = arith.constant 3 : i64
      %4622 = func.call @cc_make_string(%4620, %4621) : (!llvm.ptr, i64) -> i64
      %4623 = func.call @cc_nil_value() : () -> i64
      %4624 = func.call @cc_intern(%4622, %4623) : (i64, i64) -> i64
      %4625 = func.call @cc_nil_value() : () -> i64
      %4626 = func.call @cc_cons(%4624, %4625) : (i64, i64) -> i64
      %4627 = func.call @cc_values_pack(%4626) : (i64) -> i64
      func.call @stack_push_pointer(%4624) : (i64) -> ()
      %4628 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4629 = arith.constant 13 : i64
      %4630 = func.call @cc_make_string(%4628, %4629) : (!llvm.ptr, i64) -> i64
      %4631 = func.call @cc_nil_value() : () -> i64
      %4632 = func.call @cc_intern(%4630, %4631) : (i64, i64) -> i64
      %4633 = func.call @cc_nil_value() : () -> i64
      %4634 = func.call @cc_cons(%4632, %4633) : (i64, i64) -> i64
      %4635 = func.call @cc_values_pack(%4634) : (i64) -> i64
      func.call @stack_push_pointer(%4632) : (i64) -> ()
      %4636 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4637 = arith.constant 10 : i64
      %4638 = func.call @cc_make_string(%4636, %4637) : (!llvm.ptr, i64) -> i64
      %4639 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4640 = arith.constant 11 : i64
      %4641 = func.call @cc_make_string(%4639, %4640) : (!llvm.ptr, i64) -> i64
      %4642 = func.call @cc_intern(%4638, %4641) : (i64, i64) -> i64
      %4643 = func.call @cc_nil_value() : () -> i64
      %4644 = func.call @cc_cons(%4642, %4643) : (i64, i64) -> i64
      %4645 = func.call @cc_values_pack(%4644) : (i64) -> i64
      func.call @stack_push_pointer(%4642) : (i64) -> ()
      %4646 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4646) : (i64) -> ()
      %4647 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4647) : (i64) -> ()
      %4648 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4649 = func.call @stack_pop_pointer() : () -> i64
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = func.call @cc_cons(%4650, %4649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4651) : (i64) -> ()
      %4652 = func.call @stack_pop_pointer() : () -> i64
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @cc_cons(%4653, %4652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4654) : (i64) -> ()
      %4655 = func.call @stack_pop_pointer() : () -> i64
      %4656 = func.call @stack_pop_pointer() : () -> i64
      %4657 = func.call @cc_cons(%4655, %4656) : (i64, i64) -> i64
      %4658 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4659 = arith.constant 5 : i64
      %4660 = func.call @cc_make_string(%4658, %4659) : (!llvm.ptr, i64) -> i64
      %4661 = func.call @cc_nil_value() : () -> i64
      %4662 = func.call @cc_intern(%4660, %4661) : (i64, i64) -> i64
      %4663 = func.call @cc_nil_value() : () -> i64
      %4664 = func.call @cc_cons(%4662, %4663) : (i64, i64) -> i64
      %4665 = func.call @cc_values_pack(%4664) : (i64) -> i64
      %4666 = func.call @cc_cons(%4662, %4657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4666) : (i64) -> ()
      %4667 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4668 = arith.constant 15 : i64
      %4669 = func.call @cc_make_string(%4667, %4668) : (!llvm.ptr, i64) -> i64
      %4670 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4671 = arith.constant 7 : i64
      %4672 = func.call @cc_make_string(%4670, %4671) : (!llvm.ptr, i64) -> i64
      %4673 = func.call @cc_intern(%4669, %4672) : (i64, i64) -> i64
      %4674 = func.call @cc_nil_value() : () -> i64
      %4675 = func.call @cc_cons(%4673, %4674) : (i64, i64) -> i64
      %4676 = func.call @cc_values_pack(%4675) : (i64) -> i64
      func.call @stack_push_pointer(%4673) : (i64) -> ()
      %4677 = arith.constant 97 : i64
      %4678 = func.call @cc_box_character(%4677) : (i64) -> i64
      func.call @stack_push_pointer(%4678) : (i64) -> ()
      %4679 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4680 = arith.constant 12 : i64
      %4681 = func.call @cc_make_string(%4679, %4680) : (!llvm.ptr, i64) -> i64
      %4682 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4683 = arith.constant 7 : i64
      %4684 = func.call @cc_make_string(%4682, %4683) : (!llvm.ptr, i64) -> i64
      %4685 = func.call @cc_intern(%4681, %4684) : (i64, i64) -> i64
      %4686 = func.call @cc_nil_value() : () -> i64
      %4687 = func.call @cc_cons(%4685, %4686) : (i64, i64) -> i64
      %4688 = func.call @cc_values_pack(%4687) : (i64) -> i64
      func.call @stack_push_pointer(%4685) : (i64) -> ()
      %4689 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4689) : (i64) -> ()
      %4690 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4691 = arith.constant 9 : i64
      %4692 = func.call @cc_make_string(%4690, %4691) : (!llvm.ptr, i64) -> i64
      %4693 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4694 = arith.constant 11 : i64
      %4695 = func.call @cc_make_string(%4693, %4694) : (!llvm.ptr, i64) -> i64
      %4696 = func.call @cc_intern(%4692, %4695) : (i64, i64) -> i64
      %4697 = func.call @cc_nil_value() : () -> i64
      %4698 = func.call @cc_cons(%4696, %4697) : (i64, i64) -> i64
      %4699 = func.call @cc_values_pack(%4698) : (i64) -> i64
      func.call @stack_push_pointer(%4696) : (i64) -> ()
      %4700 = func.call @stack_pop_pointer() : () -> i64
      %4701 = func.call @stack_pop_pointer() : () -> i64
      %4702 = func.call @cc_cons(%4700, %4701) : (i64, i64) -> i64
      %4703 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4704 = arith.constant 5 : i64
      %4705 = func.call @cc_make_string(%4703, %4704) : (!llvm.ptr, i64) -> i64
      %4706 = func.call @cc_nil_value() : () -> i64
      %4707 = func.call @cc_intern(%4705, %4706) : (i64, i64) -> i64
      %4708 = func.call @cc_nil_value() : () -> i64
      %4709 = func.call @cc_cons(%4707, %4708) : (i64, i64) -> i64
      %4710 = func.call @cc_values_pack(%4709) : (i64) -> i64
      %4711 = func.call @cc_cons(%4707, %4702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4712 = func.call @stack_pop_pointer() : () -> i64
      %4713 = func.call @stack_pop_pointer() : () -> i64
      %4714 = func.call @cc_cons(%4713, %4712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4714) : (i64) -> ()
      %4715 = func.call @stack_pop_pointer() : () -> i64
      %4716 = func.call @stack_pop_pointer() : () -> i64
      %4717 = func.call @cc_cons(%4716, %4715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4717) : (i64) -> ()
      %4718 = func.call @stack_pop_pointer() : () -> i64
      %4719 = func.call @stack_pop_pointer() : () -> i64
      %4720 = func.call @cc_cons(%4719, %4718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4720) : (i64) -> ()
      %4721 = func.call @stack_pop_pointer() : () -> i64
      %4722 = func.call @stack_pop_pointer() : () -> i64
      %4723 = func.call @cc_cons(%4722, %4721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4723) : (i64) -> ()
      %4724 = func.call @stack_pop_pointer() : () -> i64
      %4725 = func.call @stack_pop_pointer() : () -> i64
      %4726 = func.call @cc_cons(%4725, %4724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4726) : (i64) -> ()
      %4727 = func.call @stack_pop_pointer() : () -> i64
      %4728 = func.call @stack_pop_pointer() : () -> i64
      %4729 = func.call @cc_cons(%4728, %4727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4729) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4730 = func.call @stack_pop_pointer() : () -> i64
      %4731 = func.call @stack_pop_pointer() : () -> i64
      %4732 = func.call @cc_cons(%4731, %4730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4732) : (i64) -> ()
      %4733 = func.call @stack_pop_pointer() : () -> i64
      %4734 = func.call @stack_pop_pointer() : () -> i64
      %4735 = func.call @cc_cons(%4734, %4733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4735) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4736 = func.call @stack_pop_pointer() : () -> i64
      %4737 = func.call @stack_pop_pointer() : () -> i64
      %4738 = func.call @cc_cons(%4737, %4736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4738) : (i64) -> ()
      %4739 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4740 = arith.constant 4 : i64
      %4741 = func.call @cc_make_string(%4739, %4740) : (!llvm.ptr, i64) -> i64
      %4742 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4743 = arith.constant 11 : i64
      %4744 = func.call @cc_make_string(%4742, %4743) : (!llvm.ptr, i64) -> i64
      %4745 = func.call @cc_intern(%4741, %4744) : (i64, i64) -> i64
      %4746 = func.call @cc_nil_value() : () -> i64
      %4747 = func.call @cc_cons(%4745, %4746) : (i64, i64) -> i64
      %4748 = func.call @cc_values_pack(%4747) : (i64) -> i64
      func.call @stack_push_pointer(%4745) : (i64) -> ()
      %4749 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4750 = arith.constant 13 : i64
      %4751 = func.call @cc_make_string(%4749, %4750) : (!llvm.ptr, i64) -> i64
      %4752 = func.call @cc_nil_value() : () -> i64
      %4753 = func.call @cc_intern(%4751, %4752) : (i64, i64) -> i64
      %4754 = func.call @cc_nil_value() : () -> i64
      %4755 = func.call @cc_cons(%4753, %4754) : (i64, i64) -> i64
      %4756 = func.call @cc_values_pack(%4755) : (i64) -> i64
      func.call @stack_push_pointer(%4753) : (i64) -> ()
      %4757 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4757) : (i64) -> ()
      %4758 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4759 = func.call @stack_pop_pointer() : () -> i64
      %4760 = func.call @stack_pop_pointer() : () -> i64
      %4761 = func.call @cc_cons(%4760, %4759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4761) : (i64) -> ()
      %4762 = func.call @stack_pop_pointer() : () -> i64
      %4763 = func.call @stack_pop_pointer() : () -> i64
      %4764 = func.call @cc_cons(%4763, %4762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4764) : (i64) -> ()
      %4765 = func.call @stack_pop_pointer() : () -> i64
      %4766 = func.call @stack_pop_pointer() : () -> i64
      %4767 = func.call @cc_cons(%4766, %4765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4767) : (i64) -> ()
      %4768 = func.call @stack_pop_pointer() : () -> i64
      %4769 = func.call @stack_pop_pointer() : () -> i64
      %4770 = func.call @cc_cons(%4769, %4768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4771 = func.call @stack_pop_pointer() : () -> i64
      %4772 = func.call @stack_pop_pointer() : () -> i64
      %4773 = func.call @cc_cons(%4772, %4771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4773) : (i64) -> ()
      %4774 = func.call @stack_pop_pointer() : () -> i64
      %4775 = func.call @stack_pop_pointer() : () -> i64
      %4776 = func.call @cc_cons(%4775, %4774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4776) : (i64) -> ()
      %4777 = func.call @stack_pop_pointer() : () -> i64
      %4778 = func.call @stack_pop_pointer() : () -> i64
      %4779 = func.call @cc_cons(%4778, %4777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4779) : (i64) -> ()
      %4780 = func.call @stack_pop_pointer() : () -> i64
      %4894 = arith.constant 15079495958544 : i64
      %4895 = arith.constant 0 : i64
      %4896 = func.call @cc_make_closure(%4894, %4895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4896) : (i64) -> ()
      %4897 = func.call @stack_pop_pointer() : () -> i64
      %4898 = arith.constant 97 : i64
      %4899 = func.call @cc_box_character(%4898) : (i64) -> i64
      func.call @stack_push_pointer(%4899) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4900 = func.call @stack_pop_pointer() : () -> i64
      %4901 = func.call @stack_pop_pointer() : () -> i64
      %4902 = func.call @cc_cons(%4901, %4900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4902) : (i64) -> ()
      %4903 = func.call @stack_pop_pointer() : () -> i64
      %4904 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4905 = arith.constant 11 : i64
      %4906 = func.call @cc_make_string(%4904, %4905) : (!llvm.ptr, i64) -> i64
      %4907 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4908 = arith.constant 7 : i64
      %4909 = func.call @cc_make_string(%4907, %4908) : (!llvm.ptr, i64) -> i64
      %4910 = func.call @cc_intern(%4906, %4909) : (i64, i64) -> i64
      %4911 = func.call @cc_nil_value() : () -> i64
      %4912 = func.call @cc_cons(%4910, %4911) : (i64, i64) -> i64
      %4913 = func.call @cc_values_pack(%4912) : (i64) -> i64
      func.call @stack_push_pointer(%4910) : (i64) -> ()
      %4914 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4915 = func.call @stack_pop_pointer() : () -> i64
      %4916 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4917 = arith.constant 4 : i64
      %4918 = func.call @cc_make_string(%4916, %4917) : (!llvm.ptr, i64) -> i64
      %4919 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4920 = arith.constant 7 : i64
      %4921 = func.call @cc_make_string(%4919, %4920) : (!llvm.ptr, i64) -> i64
      %4922 = func.call @cc_intern(%4918, %4921) : (i64, i64) -> i64
      %4923 = func.call @cc_nil_value() : () -> i64
      %4924 = func.call @cc_cons(%4922, %4923) : (i64, i64) -> i64
      %4925 = func.call @cc_values_pack(%4924) : (i64) -> i64
      func.call @stack_push_pointer(%4922) : (i64) -> ()
      %4926 = func.call @stack_pop_pointer() : () -> i64
      %4927 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4928 = arith.constant 6 : i64
      %4929 = func.call @cc_make_string(%4927, %4928) : (!llvm.ptr, i64) -> i64
      %4930 = func.call @cc_nil_value() : () -> i64
      %4931 = func.call @cc_intern(%4929, %4930) : (i64, i64) -> i64
      %4932 = func.call @cc_nil_value() : () -> i64
      %4933 = func.call @cc_cons(%4931, %4932) : (i64, i64) -> i64
      %4934 = func.call @cc_values_pack(%4933) : (i64) -> i64
      func.call @stack_push_pointer(%4931) : (i64) -> ()
      %4935 = func.call @stack_pop_pointer() : () -> i64
      %4936 = func.call @cc_nil_value() : () -> i64
      %4937 = func.call @cc_errorp(%4619) : (i64) -> i64
      %4938 = arith.cmpi ne, %4937, %4936 : i64
      %4939 = arith.cmpi eq, %4936, %4936 : i64
      %4940 = arith.andi %4938, %4939 : i1
      %4941 = scf.if %4940 -> (i64) {
        scf.yield %4619 : i64
      } else {
        scf.yield %4936 : i64
      }
      %4942 = func.call @cc_errorp(%4780) : (i64) -> i64
      %4943 = arith.cmpi ne, %4942, %4936 : i64
      %4944 = arith.cmpi eq, %4941, %4936 : i64
      %4945 = arith.andi %4943, %4944 : i1
      %4946 = scf.if %4945 -> (i64) {
        scf.yield %4780 : i64
      } else {
        scf.yield %4941 : i64
      }
      %4947 = func.call @cc_errorp(%4897) : (i64) -> i64
      %4948 = arith.cmpi ne, %4947, %4936 : i64
      %4949 = arith.cmpi eq, %4946, %4936 : i64
      %4950 = arith.andi %4948, %4949 : i1
      %4951 = scf.if %4950 -> (i64) {
        scf.yield %4897 : i64
      } else {
        scf.yield %4946 : i64
      }
      %4952 = func.call @cc_errorp(%4903) : (i64) -> i64
      %4953 = arith.cmpi ne, %4952, %4936 : i64
      %4954 = arith.cmpi eq, %4951, %4936 : i64
      %4955 = arith.andi %4953, %4954 : i1
      %4956 = scf.if %4955 -> (i64) {
        scf.yield %4903 : i64
      } else {
        scf.yield %4951 : i64
      }
      %4957 = func.call @cc_errorp(%4914) : (i64) -> i64
      %4958 = arith.cmpi ne, %4957, %4936 : i64
      %4959 = arith.cmpi eq, %4956, %4936 : i64
      %4960 = arith.andi %4958, %4959 : i1
      %4961 = scf.if %4960 -> (i64) {
        scf.yield %4914 : i64
      } else {
        scf.yield %4956 : i64
      }
      %4962 = func.call @cc_errorp(%4915) : (i64) -> i64
      %4963 = arith.cmpi ne, %4962, %4936 : i64
      %4964 = arith.cmpi eq, %4961, %4936 : i64
      %4965 = arith.andi %4963, %4964 : i1
      %4966 = scf.if %4965 -> (i64) {
        scf.yield %4915 : i64
      } else {
        scf.yield %4961 : i64
      }
      %4967 = func.call @cc_errorp(%4926) : (i64) -> i64
      %4968 = arith.cmpi ne, %4967, %4936 : i64
      %4969 = arith.cmpi eq, %4966, %4936 : i64
      %4970 = arith.andi %4968, %4969 : i1
      %4971 = scf.if %4970 -> (i64) {
        scf.yield %4926 : i64
      } else {
        scf.yield %4966 : i64
      }
      %4972 = func.call @cc_errorp(%4935) : (i64) -> i64
      %4973 = arith.cmpi ne, %4972, %4936 : i64
      %4974 = arith.cmpi eq, %4971, %4936 : i64
      %4975 = arith.andi %4973, %4974 : i1
      %4976 = scf.if %4975 -> (i64) {
        scf.yield %4935 : i64
      } else {
        scf.yield %4971 : i64
      }
      %4977 = arith.cmpi ne, %4976, %4936 : i64
      scf.if %4977 {
        func.call @stack_push_pointer(%4976) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4619) : (i64) -> ()
        func.call @stack_push_pointer(%4780) : (i64) -> ()
        func.call @stack_push_pointer(%4897) : (i64) -> ()
        func.call @stack_push_pointer(%4903) : (i64) -> ()
        func.call @stack_push_pointer(%4914) : (i64) -> ()
        func.call @stack_push_pointer(%4915) : (i64) -> ()
        func.call @stack_push_pointer(%4926) : (i64) -> ()
        func.call @stack_push_pointer(%4935) : (i64) -> ()
        %4978 = llvm.mlir.addressof @str401 : !llvm.ptr
        %4979 = func.call @cc_make_function_ref_const(%4978) : (!llvm.ptr) -> i64
        %4980 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4979, %4980) : (i64, i64) -> ()
      }
      %4981 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4981 : i64
    }
    %4982 = func.call @cc_nil_value() : () -> i64
    %4983 = func.call @cc_errorp(%4610) : (i64) -> i64
    %4984 = arith.cmpi ne, %4983, %4982 : i64
    %4985 = scf.if %4984 -> (i64) {
      scf.yield %4610 : i64
    } else {
      %4986 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4987 = arith.constant 12 : i64
      %4988 = func.call @cc_make_string(%4986, %4987) : (!llvm.ptr, i64) -> i64
      %4989 = func.call @cc_nil_value() : () -> i64
      %4990 = func.call @cc_intern(%4988, %4989) : (i64, i64) -> i64
      %4991 = func.call @cc_nil_value() : () -> i64
      %4992 = func.call @cc_cons(%4990, %4991) : (i64, i64) -> i64
      %4993 = func.call @cc_values_pack(%4992) : (i64) -> i64
      func.call @stack_push_pointer(%4990) : (i64) -> ()
      %4994 = func.call @stack_pop_pointer() : () -> i64
      %4995 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4996 = arith.constant 13 : i64
      %4997 = func.call @cc_make_string(%4995, %4996) : (!llvm.ptr, i64) -> i64
      %4998 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4999 = arith.constant 11 : i64
      %5000 = func.call @cc_make_string(%4998, %4999) : (!llvm.ptr, i64) -> i64
      %5001 = func.call @cc_intern(%4997, %5000) : (i64, i64) -> i64
      %5002 = func.call @cc_nil_value() : () -> i64
      %5003 = func.call @cc_cons(%5001, %5002) : (i64, i64) -> i64
      %5004 = func.call @cc_values_pack(%5003) : (i64) -> i64
      func.call @stack_push_pointer(%5001) : (i64) -> ()
      %5005 = llvm.mlir.addressof @str405 : !llvm.ptr
      %5006 = arith.constant 6 : i64
      %5007 = func.call @cc_make_string(%5005, %5006) : (!llvm.ptr, i64) -> i64
      %5008 = func.call @cc_nil_value() : () -> i64
      %5009 = func.call @cc_intern(%5007, %5008) : (i64, i64) -> i64
      %5010 = func.call @cc_nil_value() : () -> i64
      %5011 = func.call @cc_cons(%5009, %5010) : (i64, i64) -> i64
      %5012 = func.call @cc_values_pack(%5011) : (i64) -> i64
      func.call @stack_push_pointer(%5009) : (i64) -> ()
      %5013 = llvm.mlir.addressof @str406 : !llvm.ptr
      %5014 = arith.constant 19 : i64
      %5015 = func.call @cc_make_string(%5013, %5014) : (!llvm.ptr, i64) -> i64
      %5016 = func.call @cc_nil_value() : () -> i64
      %5017 = func.call @cc_intern(%5015, %5016) : (i64, i64) -> i64
      %5018 = func.call @cc_nil_value() : () -> i64
      %5019 = func.call @cc_cons(%5017, %5018) : (i64, i64) -> i64
      %5020 = func.call @cc_values_pack(%5019) : (i64) -> i64
      func.call @stack_push_pointer(%5017) : (i64) -> ()
      %5021 = llvm.mlir.addressof @str407 : !llvm.ptr
      %5022 = arith.constant 10 : i64
      %5023 = func.call @cc_make_string(%5021, %5022) : (!llvm.ptr, i64) -> i64
      %5024 = llvm.mlir.addressof @str408 : !llvm.ptr
      %5025 = arith.constant 11 : i64
      %5026 = func.call @cc_make_string(%5024, %5025) : (!llvm.ptr, i64) -> i64
      %5027 = func.call @cc_intern(%5023, %5026) : (i64, i64) -> i64
      %5028 = func.call @cc_nil_value() : () -> i64
      %5029 = func.call @cc_cons(%5027, %5028) : (i64, i64) -> i64
      %5030 = func.call @cc_values_pack(%5029) : (i64) -> i64
      func.call @stack_push_pointer(%5027) : (i64) -> ()
      %5031 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%5031) : (i64) -> ()
      %5032 = llvm.mlir.addressof @str409 : !llvm.ptr
      %5033 = arith.constant 12 : i64
      %5034 = func.call @cc_make_string(%5032, %5033) : (!llvm.ptr, i64) -> i64
      %5035 = llvm.mlir.addressof @str410 : !llvm.ptr
      %5036 = arith.constant 7 : i64
      %5037 = func.call @cc_make_string(%5035, %5036) : (!llvm.ptr, i64) -> i64
      %5038 = func.call @cc_intern(%5034, %5037) : (i64, i64) -> i64
      %5039 = func.call @cc_nil_value() : () -> i64
      %5040 = func.call @cc_cons(%5038, %5039) : (i64, i64) -> i64
      %5041 = func.call @cc_values_pack(%5040) : (i64) -> i64
      func.call @stack_push_pointer(%5038) : (i64) -> ()
      %5042 = llvm.mlir.addressof @str411 : !llvm.ptr
      %5043 = arith.constant 18 : i64
      %5044 = func.call @cc_make_string(%5042, %5043) : (!llvm.ptr, i64) -> i64
      %5045 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5046 = arith.constant 11 : i64
      %5047 = func.call @cc_make_string(%5045, %5046) : (!llvm.ptr, i64) -> i64
      %5048 = func.call @cc_intern(%5044, %5047) : (i64, i64) -> i64
      %5049 = func.call @cc_nil_value() : () -> i64
      %5050 = func.call @cc_cons(%5048, %5049) : (i64, i64) -> i64
      %5051 = func.call @cc_values_pack(%5050) : (i64) -> i64
      func.call @stack_push_pointer(%5048) : (i64) -> ()
      %5052 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5053 = arith.constant 0 : i64
      %5054 = func.call @cc_make_string(%5052, %5053) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5055 = func.call @stack_pop_pointer() : () -> i64
      %5056 = func.call @stack_pop_pointer() : () -> i64
      %5057 = func.call @cc_cons(%5056, %5055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5057) : (i64) -> ()
      %5058 = func.call @stack_pop_pointer() : () -> i64
      %5059 = func.call @stack_pop_pointer() : () -> i64
      %5060 = func.call @cc_cons(%5059, %5058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5060) : (i64) -> ()
      %5061 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5062 = arith.constant 22 : i64
      %5063 = func.call @cc_make_string(%5061, %5062) : (!llvm.ptr, i64) -> i64
      %5064 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5065 = arith.constant 7 : i64
      %5066 = func.call @cc_make_string(%5064, %5065) : (!llvm.ptr, i64) -> i64
      %5067 = func.call @cc_intern(%5063, %5066) : (i64, i64) -> i64
      %5068 = func.call @cc_nil_value() : () -> i64
      %5069 = func.call @cc_cons(%5067, %5068) : (i64, i64) -> i64
      %5070 = func.call @cc_values_pack(%5069) : (i64) -> i64
      func.call @stack_push_pointer(%5067) : (i64) -> ()
      %5071 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%5071) : (i64) -> ()
      %5072 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5073 = arith.constant 12 : i64
      %5074 = func.call @cc_make_string(%5072, %5073) : (!llvm.ptr, i64) -> i64
      %5075 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5076 = arith.constant 7 : i64
      %5077 = func.call @cc_make_string(%5075, %5076) : (!llvm.ptr, i64) -> i64
      %5078 = func.call @cc_intern(%5074, %5077) : (i64, i64) -> i64
      %5079 = func.call @cc_nil_value() : () -> i64
      %5080 = func.call @cc_cons(%5078, %5079) : (i64, i64) -> i64
      %5081 = func.call @cc_values_pack(%5080) : (i64) -> i64
      func.call @stack_push_pointer(%5078) : (i64) -> ()
      %5082 = llvm.mlir.addressof @str418 : !llvm.ptr
      %5083 = arith.constant 0 : i64
      %5084 = func.call @cc_make_string(%5082, %5083) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5085 = func.call @stack_pop_pointer() : () -> i64
      %5086 = func.call @stack_pop_pointer() : () -> i64
      %5087 = func.call @cc_cons(%5086, %5085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5087) : (i64) -> ()
      %5088 = func.call @stack_pop_pointer() : () -> i64
      %5089 = func.call @stack_pop_pointer() : () -> i64
      %5090 = func.call @cc_cons(%5089, %5088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5090) : (i64) -> ()
      %5091 = func.call @stack_pop_pointer() : () -> i64
      %5092 = func.call @stack_pop_pointer() : () -> i64
      %5093 = func.call @cc_cons(%5092, %5091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5093) : (i64) -> ()
      %5094 = func.call @stack_pop_pointer() : () -> i64
      %5095 = func.call @stack_pop_pointer() : () -> i64
      %5096 = func.call @cc_cons(%5095, %5094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5096) : (i64) -> ()
      %5097 = func.call @stack_pop_pointer() : () -> i64
      %5098 = func.call @stack_pop_pointer() : () -> i64
      %5099 = func.call @cc_cons(%5098, %5097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5099) : (i64) -> ()
      %5100 = func.call @stack_pop_pointer() : () -> i64
      %5101 = func.call @stack_pop_pointer() : () -> i64
      %5102 = func.call @cc_cons(%5101, %5100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5102) : (i64) -> ()
      %5103 = func.call @stack_pop_pointer() : () -> i64
      %5104 = func.call @stack_pop_pointer() : () -> i64
      %5105 = func.call @cc_cons(%5104, %5103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5105) : (i64) -> ()
      %5106 = func.call @stack_pop_pointer() : () -> i64
      %5107 = func.call @stack_pop_pointer() : () -> i64
      %5108 = func.call @cc_cons(%5107, %5106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5109 = func.call @stack_pop_pointer() : () -> i64
      %5110 = func.call @stack_pop_pointer() : () -> i64
      %5111 = func.call @cc_cons(%5110, %5109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5111) : (i64) -> ()
      %5112 = func.call @stack_pop_pointer() : () -> i64
      %5113 = func.call @stack_pop_pointer() : () -> i64
      %5114 = func.call @cc_cons(%5113, %5112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5114) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5115 = func.call @stack_pop_pointer() : () -> i64
      %5116 = func.call @stack_pop_pointer() : () -> i64
      %5117 = func.call @cc_cons(%5116, %5115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5117) : (i64) -> ()
      %5118 = func.call @stack_pop_pointer() : () -> i64
      %5119 = func.call @stack_pop_pointer() : () -> i64
      %5120 = func.call @cc_cons(%5119, %5118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5120) : (i64) -> ()
      %5121 = func.call @stack_pop_pointer() : () -> i64
      %5122 = func.call @stack_pop_pointer() : () -> i64
      %5123 = func.call @cc_cons(%5122, %5121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5123) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5124 = func.call @stack_pop_pointer() : () -> i64
      %5125 = func.call @stack_pop_pointer() : () -> i64
      %5126 = func.call @cc_cons(%5125, %5124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5126) : (i64) -> ()
      %5127 = func.call @stack_pop_pointer() : () -> i64
      %5128 = func.call @stack_pop_pointer() : () -> i64
      %5129 = func.call @cc_cons(%5128, %5127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5129) : (i64) -> ()
      %5130 = func.call @stack_pop_pointer() : () -> i64
      %5270 = arith.constant 15079495958545 : i64
      %5271 = arith.constant 0 : i64
      %5272 = func.call @cc_make_closure(%5270, %5271) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5272) : (i64) -> ()
      %5273 = func.call @stack_pop_pointer() : () -> i64
      %5274 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5275 = arith.constant 4 : i64
      %5276 = func.call @cc_make_string(%5274, %5275) : (!llvm.ptr, i64) -> i64
      %5277 = func.call @cc_nil_value() : () -> i64
      %5278 = func.call @cc_intern(%5276, %5277) : (i64, i64) -> i64
      %5279 = func.call @cc_nil_value() : () -> i64
      %5280 = func.call @cc_cons(%5278, %5279) : (i64, i64) -> i64
      %5281 = func.call @cc_values_pack(%5280) : (i64) -> i64
      func.call @stack_push_pointer(%5278) : (i64) -> ()
      %5282 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5283 = arith.constant 12 : i64
      %5284 = func.call @cc_make_string(%5282, %5283) : (!llvm.ptr, i64) -> i64
      %5285 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5286 = arith.constant 11 : i64
      %5287 = func.call @cc_make_string(%5285, %5286) : (!llvm.ptr, i64) -> i64
      %5288 = func.call @cc_intern(%5284, %5287) : (i64, i64) -> i64
      %5289 = func.call @cc_nil_value() : () -> i64
      %5290 = func.call @cc_cons(%5288, %5289) : (i64, i64) -> i64
      %5291 = func.call @cc_values_pack(%5290) : (i64) -> i64
      func.call @stack_push_pointer(%5288) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5292 = func.call @stack_pop_pointer() : () -> i64
      %5293 = func.call @stack_pop_pointer() : () -> i64
      %5294 = func.call @cc_cons(%5293, %5292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5294) : (i64) -> ()
      %5295 = func.call @stack_pop_pointer() : () -> i64
      %5296 = func.call @stack_pop_pointer() : () -> i64
      %5297 = func.call @cc_cons(%5296, %5295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5297) : (i64) -> ()
      %5298 = func.call @stack_pop_pointer() : () -> i64
      %5299 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5300 = arith.constant 11 : i64
      %5301 = func.call @cc_make_string(%5299, %5300) : (!llvm.ptr, i64) -> i64
      %5302 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5303 = arith.constant 7 : i64
      %5304 = func.call @cc_make_string(%5302, %5303) : (!llvm.ptr, i64) -> i64
      %5305 = func.call @cc_intern(%5301, %5304) : (i64, i64) -> i64
      %5306 = func.call @cc_nil_value() : () -> i64
      %5307 = func.call @cc_cons(%5305, %5306) : (i64, i64) -> i64
      %5308 = func.call @cc_values_pack(%5307) : (i64) -> i64
      func.call @stack_push_pointer(%5305) : (i64) -> ()
      %5309 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5310 = func.call @stack_pop_pointer() : () -> i64
      %5311 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5312 = arith.constant 4 : i64
      %5313 = func.call @cc_make_string(%5311, %5312) : (!llvm.ptr, i64) -> i64
      %5314 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5315 = arith.constant 7 : i64
      %5316 = func.call @cc_make_string(%5314, %5315) : (!llvm.ptr, i64) -> i64
      %5317 = func.call @cc_intern(%5313, %5316) : (i64, i64) -> i64
      %5318 = func.call @cc_nil_value() : () -> i64
      %5319 = func.call @cc_cons(%5317, %5318) : (i64, i64) -> i64
      %5320 = func.call @cc_values_pack(%5319) : (i64) -> i64
      func.call @stack_push_pointer(%5317) : (i64) -> ()
      %5321 = func.call @stack_pop_pointer() : () -> i64
      %5322 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5323 = arith.constant 5 : i64
      %5324 = func.call @cc_make_string(%5322, %5323) : (!llvm.ptr, i64) -> i64
      %5325 = func.call @cc_nil_value() : () -> i64
      %5326 = func.call @cc_intern(%5324, %5325) : (i64, i64) -> i64
      %5327 = func.call @cc_nil_value() : () -> i64
      %5328 = func.call @cc_cons(%5326, %5327) : (i64, i64) -> i64
      %5329 = func.call @cc_values_pack(%5328) : (i64) -> i64
      func.call @stack_push_pointer(%5326) : (i64) -> ()
      %5330 = func.call @stack_pop_pointer() : () -> i64
      %5331 = func.call @cc_nil_value() : () -> i64
      %5332 = func.call @cc_errorp(%4994) : (i64) -> i64
      %5333 = arith.cmpi ne, %5332, %5331 : i64
      %5334 = arith.cmpi eq, %5331, %5331 : i64
      %5335 = arith.andi %5333, %5334 : i1
      %5336 = scf.if %5335 -> (i64) {
        scf.yield %4994 : i64
      } else {
        scf.yield %5331 : i64
      }
      %5337 = func.call @cc_errorp(%5130) : (i64) -> i64
      %5338 = arith.cmpi ne, %5337, %5331 : i64
      %5339 = arith.cmpi eq, %5336, %5331 : i64
      %5340 = arith.andi %5338, %5339 : i1
      %5341 = scf.if %5340 -> (i64) {
        scf.yield %5130 : i64
      } else {
        scf.yield %5336 : i64
      }
      %5342 = func.call @cc_errorp(%5273) : (i64) -> i64
      %5343 = arith.cmpi ne, %5342, %5331 : i64
      %5344 = arith.cmpi eq, %5341, %5331 : i64
      %5345 = arith.andi %5343, %5344 : i1
      %5346 = scf.if %5345 -> (i64) {
        scf.yield %5273 : i64
      } else {
        scf.yield %5341 : i64
      }
      %5347 = func.call @cc_errorp(%5298) : (i64) -> i64
      %5348 = arith.cmpi ne, %5347, %5331 : i64
      %5349 = arith.cmpi eq, %5346, %5331 : i64
      %5350 = arith.andi %5348, %5349 : i1
      %5351 = scf.if %5350 -> (i64) {
        scf.yield %5298 : i64
      } else {
        scf.yield %5346 : i64
      }
      %5352 = func.call @cc_errorp(%5309) : (i64) -> i64
      %5353 = arith.cmpi ne, %5352, %5331 : i64
      %5354 = arith.cmpi eq, %5351, %5331 : i64
      %5355 = arith.andi %5353, %5354 : i1
      %5356 = scf.if %5355 -> (i64) {
        scf.yield %5309 : i64
      } else {
        scf.yield %5351 : i64
      }
      %5357 = func.call @cc_errorp(%5310) : (i64) -> i64
      %5358 = arith.cmpi ne, %5357, %5331 : i64
      %5359 = arith.cmpi eq, %5356, %5331 : i64
      %5360 = arith.andi %5358, %5359 : i1
      %5361 = scf.if %5360 -> (i64) {
        scf.yield %5310 : i64
      } else {
        scf.yield %5356 : i64
      }
      %5362 = func.call @cc_errorp(%5321) : (i64) -> i64
      %5363 = arith.cmpi ne, %5362, %5331 : i64
      %5364 = arith.cmpi eq, %5361, %5331 : i64
      %5365 = arith.andi %5363, %5364 : i1
      %5366 = scf.if %5365 -> (i64) {
        scf.yield %5321 : i64
      } else {
        scf.yield %5361 : i64
      }
      %5367 = func.call @cc_errorp(%5330) : (i64) -> i64
      %5368 = arith.cmpi ne, %5367, %5331 : i64
      %5369 = arith.cmpi eq, %5366, %5331 : i64
      %5370 = arith.andi %5368, %5369 : i1
      %5371 = scf.if %5370 -> (i64) {
        scf.yield %5330 : i64
      } else {
        scf.yield %5366 : i64
      }
      %5372 = arith.cmpi ne, %5371, %5331 : i64
      scf.if %5372 {
        func.call @stack_push_pointer(%5371) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4994) : (i64) -> ()
        func.call @stack_push_pointer(%5130) : (i64) -> ()
        func.call @stack_push_pointer(%5273) : (i64) -> ()
        func.call @stack_push_pointer(%5298) : (i64) -> ()
        func.call @stack_push_pointer(%5309) : (i64) -> ()
        func.call @stack_push_pointer(%5310) : (i64) -> ()
        func.call @stack_push_pointer(%5321) : (i64) -> ()
        func.call @stack_push_pointer(%5330) : (i64) -> ()
        %5373 = llvm.mlir.addressof @str437 : !llvm.ptr
        %5374 = func.call @cc_make_function_ref_const(%5373) : (!llvm.ptr) -> i64
        %5375 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5374, %5375) : (i64, i64) -> ()
      }
      %5376 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5376 : i64
    }
    %5377 = func.call @cc_nil_value() : () -> i64
    %5378 = func.call @cc_errorp(%4985) : (i64) -> i64
    %5379 = arith.cmpi ne, %5378, %5377 : i64
    %5380 = scf.if %5379 -> (i64) {
      scf.yield %4985 : i64
    } else {
      %5381 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5382 = arith.constant 14 : i64
      %5383 = func.call @cc_make_string(%5381, %5382) : (!llvm.ptr, i64) -> i64
      %5384 = func.call @cc_nil_value() : () -> i64
      %5385 = func.call @cc_intern(%5383, %5384) : (i64, i64) -> i64
      %5386 = func.call @cc_nil_value() : () -> i64
      %5387 = func.call @cc_cons(%5385, %5386) : (i64, i64) -> i64
      %5388 = func.call @cc_values_pack(%5387) : (i64) -> i64
      func.call @stack_push_pointer(%5385) : (i64) -> ()
      %5389 = func.call @stack_pop_pointer() : () -> i64
      %5390 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5391 = arith.constant 3 : i64
      %5392 = func.call @cc_make_string(%5390, %5391) : (!llvm.ptr, i64) -> i64
      %5393 = func.call @cc_nil_value() : () -> i64
      %5394 = func.call @cc_intern(%5392, %5393) : (i64, i64) -> i64
      %5395 = func.call @cc_nil_value() : () -> i64
      %5396 = func.call @cc_cons(%5394, %5395) : (i64, i64) -> i64
      %5397 = func.call @cc_values_pack(%5396) : (i64) -> i64
      func.call @stack_push_pointer(%5394) : (i64) -> ()
      %5398 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5399 = arith.constant 5 : i64
      %5400 = func.call @cc_make_string(%5398, %5399) : (!llvm.ptr, i64) -> i64
      %5401 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5402 = arith.constant 11 : i64
      %5403 = func.call @cc_make_string(%5401, %5402) : (!llvm.ptr, i64) -> i64
      %5404 = func.call @cc_intern(%5400, %5403) : (i64, i64) -> i64
      %5405 = func.call @cc_nil_value() : () -> i64
      %5406 = func.call @cc_cons(%5404, %5405) : (i64, i64) -> i64
      %5407 = func.call @cc_values_pack(%5406) : (i64) -> i64
      func.call @stack_push_pointer(%5404) : (i64) -> ()
      %5408 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5409 = arith.constant 10 : i64
      %5410 = func.call @cc_make_string(%5408, %5409) : (!llvm.ptr, i64) -> i64
      %5411 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5412 = arith.constant 11 : i64
      %5413 = func.call @cc_make_string(%5411, %5412) : (!llvm.ptr, i64) -> i64
      %5414 = func.call @cc_intern(%5410, %5413) : (i64, i64) -> i64
      %5415 = func.call @cc_nil_value() : () -> i64
      %5416 = func.call @cc_cons(%5414, %5415) : (i64, i64) -> i64
      %5417 = func.call @cc_values_pack(%5416) : (i64) -> i64
      func.call @stack_push_pointer(%5414) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5418 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5419 = arith.constant 15 : i64
      %5420 = func.call @cc_make_string(%5418, %5419) : (!llvm.ptr, i64) -> i64
      %5421 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5422 = arith.constant 7 : i64
      %5423 = func.call @cc_make_string(%5421, %5422) : (!llvm.ptr, i64) -> i64
      %5424 = func.call @cc_intern(%5420, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_nil_value() : () -> i64
      %5426 = func.call @cc_cons(%5424, %5425) : (i64, i64) -> i64
      %5427 = func.call @cc_values_pack(%5426) : (i64) -> i64
      func.call @stack_push_pointer(%5424) : (i64) -> ()
      %5428 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5429 = func.call @stack_pop_pointer() : () -> i64
      %5430 = func.call @stack_pop_pointer() : () -> i64
      %5431 = func.call @cc_cons(%5430, %5429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5431) : (i64) -> ()
      %5432 = func.call @stack_pop_pointer() : () -> i64
      %5433 = func.call @stack_pop_pointer() : () -> i64
      %5434 = func.call @cc_cons(%5433, %5432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5434) : (i64) -> ()
      %5435 = func.call @stack_pop_pointer() : () -> i64
      %5436 = func.call @stack_pop_pointer() : () -> i64
      %5437 = func.call @cc_cons(%5436, %5435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5437) : (i64) -> ()
      %5438 = func.call @stack_pop_pointer() : () -> i64
      %5439 = func.call @stack_pop_pointer() : () -> i64
      %5440 = func.call @cc_cons(%5439, %5438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5440) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5441 = func.call @stack_pop_pointer() : () -> i64
      %5442 = func.call @stack_pop_pointer() : () -> i64
      %5443 = func.call @cc_cons(%5442, %5441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5443) : (i64) -> ()
      %5444 = func.call @stack_pop_pointer() : () -> i64
      %5445 = func.call @stack_pop_pointer() : () -> i64
      %5446 = func.call @cc_cons(%5445, %5444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5446) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5447 = func.call @stack_pop_pointer() : () -> i64
      %5448 = func.call @stack_pop_pointer() : () -> i64
      %5449 = func.call @cc_cons(%5448, %5447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5449) : (i64) -> ()
      %5450 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5451 = arith.constant 4 : i64
      %5452 = func.call @cc_make_string(%5450, %5451) : (!llvm.ptr, i64) -> i64
      %5453 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5454 = arith.constant 11 : i64
      %5455 = func.call @cc_make_string(%5453, %5454) : (!llvm.ptr, i64) -> i64
      %5456 = func.call @cc_intern(%5452, %5455) : (i64, i64) -> i64
      %5457 = func.call @cc_nil_value() : () -> i64
      %5458 = func.call @cc_cons(%5456, %5457) : (i64, i64) -> i64
      %5459 = func.call @cc_values_pack(%5458) : (i64) -> i64
      func.call @stack_push_pointer(%5456) : (i64) -> ()
      %5460 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5461 = arith.constant 5 : i64
      %5462 = func.call @cc_make_string(%5460, %5461) : (!llvm.ptr, i64) -> i64
      %5463 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5464 = arith.constant 11 : i64
      %5465 = func.call @cc_make_string(%5463, %5464) : (!llvm.ptr, i64) -> i64
      %5466 = func.call @cc_intern(%5462, %5465) : (i64, i64) -> i64
      %5467 = func.call @cc_nil_value() : () -> i64
      %5468 = func.call @cc_cons(%5466, %5467) : (i64, i64) -> i64
      %5469 = func.call @cc_values_pack(%5468) : (i64) -> i64
      func.call @stack_push_pointer(%5466) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5470 = func.call @stack_pop_pointer() : () -> i64
      %5471 = func.call @stack_pop_pointer() : () -> i64
      %5472 = func.call @cc_cons(%5471, %5470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5472) : (i64) -> ()
      %5473 = func.call @stack_pop_pointer() : () -> i64
      %5474 = func.call @stack_pop_pointer() : () -> i64
      %5475 = func.call @cc_cons(%5474, %5473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5476 = func.call @stack_pop_pointer() : () -> i64
      %5477 = func.call @stack_pop_pointer() : () -> i64
      %5478 = func.call @cc_cons(%5477, %5476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5478) : (i64) -> ()
      %5479 = func.call @stack_pop_pointer() : () -> i64
      %5480 = func.call @stack_pop_pointer() : () -> i64
      %5481 = func.call @cc_cons(%5480, %5479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5481) : (i64) -> ()
      %5482 = func.call @stack_pop_pointer() : () -> i64
      %5483 = func.call @stack_pop_pointer() : () -> i64
      %5484 = func.call @cc_cons(%5483, %5482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5484) : (i64) -> ()
      %5485 = func.call @stack_pop_pointer() : () -> i64
      %5544 = arith.constant 15079495958546 : i64
      %5545 = arith.constant 0 : i64
      %5546 = func.call @cc_make_closure(%5544, %5545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5546) : (i64) -> ()
      %5547 = func.call @stack_pop_pointer() : () -> i64
      %5548 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5549 = func.call @stack_pop_pointer() : () -> i64
      %5550 = func.call @stack_pop_pointer() : () -> i64
      %5551 = func.call @cc_cons(%5550, %5549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5551) : (i64) -> ()
      %5552 = func.call @stack_pop_pointer() : () -> i64
      %5553 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5554 = arith.constant 11 : i64
      %5555 = func.call @cc_make_string(%5553, %5554) : (!llvm.ptr, i64) -> i64
      %5556 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5557 = arith.constant 7 : i64
      %5558 = func.call @cc_make_string(%5556, %5557) : (!llvm.ptr, i64) -> i64
      %5559 = func.call @cc_intern(%5555, %5558) : (i64, i64) -> i64
      %5560 = func.call @cc_nil_value() : () -> i64
      %5561 = func.call @cc_cons(%5559, %5560) : (i64, i64) -> i64
      %5562 = func.call @cc_values_pack(%5561) : (i64) -> i64
      func.call @stack_push_pointer(%5559) : (i64) -> ()
      %5563 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5564 = func.call @stack_pop_pointer() : () -> i64
      %5565 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5566 = arith.constant 4 : i64
      %5567 = func.call @cc_make_string(%5565, %5566) : (!llvm.ptr, i64) -> i64
      %5568 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5569 = arith.constant 7 : i64
      %5570 = func.call @cc_make_string(%5568, %5569) : (!llvm.ptr, i64) -> i64
      %5571 = func.call @cc_intern(%5567, %5570) : (i64, i64) -> i64
      %5572 = func.call @cc_nil_value() : () -> i64
      %5573 = func.call @cc_cons(%5571, %5572) : (i64, i64) -> i64
      %5574 = func.call @cc_values_pack(%5573) : (i64) -> i64
      func.call @stack_push_pointer(%5571) : (i64) -> ()
      %5575 = func.call @stack_pop_pointer() : () -> i64
      %5576 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5577 = arith.constant 6 : i64
      %5578 = func.call @cc_make_string(%5576, %5577) : (!llvm.ptr, i64) -> i64
      %5579 = func.call @cc_nil_value() : () -> i64
      %5580 = func.call @cc_intern(%5578, %5579) : (i64, i64) -> i64
      %5581 = func.call @cc_nil_value() : () -> i64
      %5582 = func.call @cc_cons(%5580, %5581) : (i64, i64) -> i64
      %5583 = func.call @cc_values_pack(%5582) : (i64) -> i64
      func.call @stack_push_pointer(%5580) : (i64) -> ()
      %5584 = func.call @stack_pop_pointer() : () -> i64
      %5585 = func.call @cc_nil_value() : () -> i64
      %5586 = func.call @cc_errorp(%5389) : (i64) -> i64
      %5587 = arith.cmpi ne, %5586, %5585 : i64
      %5588 = arith.cmpi eq, %5585, %5585 : i64
      %5589 = arith.andi %5587, %5588 : i1
      %5590 = scf.if %5589 -> (i64) {
        scf.yield %5389 : i64
      } else {
        scf.yield %5585 : i64
      }
      %5591 = func.call @cc_errorp(%5485) : (i64) -> i64
      %5592 = arith.cmpi ne, %5591, %5585 : i64
      %5593 = arith.cmpi eq, %5590, %5585 : i64
      %5594 = arith.andi %5592, %5593 : i1
      %5595 = scf.if %5594 -> (i64) {
        scf.yield %5485 : i64
      } else {
        scf.yield %5590 : i64
      }
      %5596 = func.call @cc_errorp(%5547) : (i64) -> i64
      %5597 = arith.cmpi ne, %5596, %5585 : i64
      %5598 = arith.cmpi eq, %5595, %5585 : i64
      %5599 = arith.andi %5597, %5598 : i1
      %5600 = scf.if %5599 -> (i64) {
        scf.yield %5547 : i64
      } else {
        scf.yield %5595 : i64
      }
      %5601 = func.call @cc_errorp(%5552) : (i64) -> i64
      %5602 = arith.cmpi ne, %5601, %5585 : i64
      %5603 = arith.cmpi eq, %5600, %5585 : i64
      %5604 = arith.andi %5602, %5603 : i1
      %5605 = scf.if %5604 -> (i64) {
        scf.yield %5552 : i64
      } else {
        scf.yield %5600 : i64
      }
      %5606 = func.call @cc_errorp(%5563) : (i64) -> i64
      %5607 = arith.cmpi ne, %5606, %5585 : i64
      %5608 = arith.cmpi eq, %5605, %5585 : i64
      %5609 = arith.andi %5607, %5608 : i1
      %5610 = scf.if %5609 -> (i64) {
        scf.yield %5563 : i64
      } else {
        scf.yield %5605 : i64
      }
      %5611 = func.call @cc_errorp(%5564) : (i64) -> i64
      %5612 = arith.cmpi ne, %5611, %5585 : i64
      %5613 = arith.cmpi eq, %5610, %5585 : i64
      %5614 = arith.andi %5612, %5613 : i1
      %5615 = scf.if %5614 -> (i64) {
        scf.yield %5564 : i64
      } else {
        scf.yield %5610 : i64
      }
      %5616 = func.call @cc_errorp(%5575) : (i64) -> i64
      %5617 = arith.cmpi ne, %5616, %5585 : i64
      %5618 = arith.cmpi eq, %5615, %5585 : i64
      %5619 = arith.andi %5617, %5618 : i1
      %5620 = scf.if %5619 -> (i64) {
        scf.yield %5575 : i64
      } else {
        scf.yield %5615 : i64
      }
      %5621 = func.call @cc_errorp(%5584) : (i64) -> i64
      %5622 = arith.cmpi ne, %5621, %5585 : i64
      %5623 = arith.cmpi eq, %5620, %5585 : i64
      %5624 = arith.andi %5622, %5623 : i1
      %5625 = scf.if %5624 -> (i64) {
        scf.yield %5584 : i64
      } else {
        scf.yield %5620 : i64
      }
      %5626 = arith.cmpi ne, %5625, %5585 : i64
      scf.if %5626 {
        func.call @stack_push_pointer(%5625) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5389) : (i64) -> ()
        func.call @stack_push_pointer(%5485) : (i64) -> ()
        func.call @stack_push_pointer(%5547) : (i64) -> ()
        func.call @stack_push_pointer(%5552) : (i64) -> ()
        func.call @stack_push_pointer(%5563) : (i64) -> ()
        func.call @stack_push_pointer(%5564) : (i64) -> ()
        func.call @stack_push_pointer(%5575) : (i64) -> ()
        func.call @stack_push_pointer(%5584) : (i64) -> ()
        %5627 = llvm.mlir.addressof @str459 : !llvm.ptr
        %5628 = func.call @cc_make_function_ref_const(%5627) : (!llvm.ptr) -> i64
        %5629 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5628, %5629) : (i64, i64) -> ()
      }
      %5630 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5630 : i64
    }
    %5631 = func.call @cc_nil_value() : () -> i64
    %5632 = func.call @cc_errorp(%5380) : (i64) -> i64
    %5633 = arith.cmpi ne, %5632, %5631 : i64
    %5634 = scf.if %5633 -> (i64) {
      scf.yield %5380 : i64
    } else {
      %5635 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5636 = arith.constant 19 : i64
      %5637 = func.call @cc_make_string(%5635, %5636) : (!llvm.ptr, i64) -> i64
      %5638 = func.call @cc_nil_value() : () -> i64
      %5639 = func.call @cc_intern(%5637, %5638) : (i64, i64) -> i64
      %5640 = func.call @cc_nil_value() : () -> i64
      %5641 = func.call @cc_cons(%5639, %5640) : (i64, i64) -> i64
      %5642 = func.call @cc_values_pack(%5641) : (i64) -> i64
      func.call @stack_push_pointer(%5639) : (i64) -> ()
      %5643 = func.call @stack_pop_pointer() : () -> i64
      %5644 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5645 = arith.constant 3 : i64
      %5646 = func.call @cc_make_string(%5644, %5645) : (!llvm.ptr, i64) -> i64
      %5647 = func.call @cc_nil_value() : () -> i64
      %5648 = func.call @cc_intern(%5646, %5647) : (i64, i64) -> i64
      %5649 = func.call @cc_nil_value() : () -> i64
      %5650 = func.call @cc_cons(%5648, %5649) : (i64, i64) -> i64
      %5651 = func.call @cc_values_pack(%5650) : (i64) -> i64
      func.call @stack_push_pointer(%5648) : (i64) -> ()
      %5652 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5653 = arith.constant 5 : i64
      %5654 = func.call @cc_make_string(%5652, %5653) : (!llvm.ptr, i64) -> i64
      %5655 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5656 = arith.constant 11 : i64
      %5657 = func.call @cc_make_string(%5655, %5656) : (!llvm.ptr, i64) -> i64
      %5658 = func.call @cc_intern(%5654, %5657) : (i64, i64) -> i64
      %5659 = func.call @cc_nil_value() : () -> i64
      %5660 = func.call @cc_cons(%5658, %5659) : (i64, i64) -> i64
      %5661 = func.call @cc_values_pack(%5660) : (i64) -> i64
      func.call @stack_push_pointer(%5658) : (i64) -> ()
      %5662 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5663 = arith.constant 10 : i64
      %5664 = func.call @cc_make_string(%5662, %5663) : (!llvm.ptr, i64) -> i64
      %5665 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5666 = arith.constant 11 : i64
      %5667 = func.call @cc_make_string(%5665, %5666) : (!llvm.ptr, i64) -> i64
      %5668 = func.call @cc_intern(%5664, %5667) : (i64, i64) -> i64
      %5669 = func.call @cc_nil_value() : () -> i64
      %5670 = func.call @cc_cons(%5668, %5669) : (i64, i64) -> i64
      %5671 = func.call @cc_values_pack(%5670) : (i64) -> i64
      func.call @stack_push_pointer(%5668) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5672 = func.call @stack_pop_pointer() : () -> i64
      %5673 = func.call @stack_pop_pointer() : () -> i64
      %5674 = func.call @cc_cons(%5673, %5672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5674) : (i64) -> ()
      %5675 = func.call @stack_pop_pointer() : () -> i64
      %5676 = func.call @stack_pop_pointer() : () -> i64
      %5677 = func.call @cc_cons(%5676, %5675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5677) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5678 = func.call @stack_pop_pointer() : () -> i64
      %5679 = func.call @stack_pop_pointer() : () -> i64
      %5680 = func.call @cc_cons(%5679, %5678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5680) : (i64) -> ()
      %5681 = func.call @stack_pop_pointer() : () -> i64
      %5682 = func.call @stack_pop_pointer() : () -> i64
      %5683 = func.call @cc_cons(%5682, %5681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5683) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5684 = func.call @stack_pop_pointer() : () -> i64
      %5685 = func.call @stack_pop_pointer() : () -> i64
      %5686 = func.call @cc_cons(%5685, %5684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5686) : (i64) -> ()
      %5687 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5688 = arith.constant 4 : i64
      %5689 = func.call @cc_make_string(%5687, %5688) : (!llvm.ptr, i64) -> i64
      %5690 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5691 = arith.constant 11 : i64
      %5692 = func.call @cc_make_string(%5690, %5691) : (!llvm.ptr, i64) -> i64
      %5693 = func.call @cc_intern(%5689, %5692) : (i64, i64) -> i64
      %5694 = func.call @cc_nil_value() : () -> i64
      %5695 = func.call @cc_cons(%5693, %5694) : (i64, i64) -> i64
      %5696 = func.call @cc_values_pack(%5695) : (i64) -> i64
      func.call @stack_push_pointer(%5693) : (i64) -> ()
      %5697 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5698 = arith.constant 4 : i64
      %5699 = func.call @cc_make_string(%5697, %5698) : (!llvm.ptr, i64) -> i64
      %5700 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5701 = arith.constant 11 : i64
      %5702 = func.call @cc_make_string(%5700, %5701) : (!llvm.ptr, i64) -> i64
      %5703 = func.call @cc_intern(%5699, %5702) : (i64, i64) -> i64
      %5704 = func.call @cc_nil_value() : () -> i64
      %5705 = func.call @cc_cons(%5703, %5704) : (i64, i64) -> i64
      %5706 = func.call @cc_values_pack(%5705) : (i64) -> i64
      func.call @stack_push_pointer(%5703) : (i64) -> ()
      %5707 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5708 = arith.constant 5 : i64
      %5709 = func.call @cc_make_string(%5707, %5708) : (!llvm.ptr, i64) -> i64
      %5710 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5711 = arith.constant 11 : i64
      %5712 = func.call @cc_make_string(%5710, %5711) : (!llvm.ptr, i64) -> i64
      %5713 = func.call @cc_intern(%5709, %5712) : (i64, i64) -> i64
      %5714 = func.call @cc_nil_value() : () -> i64
      %5715 = func.call @cc_cons(%5713, %5714) : (i64, i64) -> i64
      %5716 = func.call @cc_values_pack(%5715) : (i64) -> i64
      func.call @stack_push_pointer(%5713) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5717 = func.call @stack_pop_pointer() : () -> i64
      %5718 = func.call @stack_pop_pointer() : () -> i64
      %5719 = func.call @cc_cons(%5718, %5717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5719) : (i64) -> ()
      %5720 = func.call @stack_pop_pointer() : () -> i64
      %5721 = func.call @stack_pop_pointer() : () -> i64
      %5722 = func.call @cc_cons(%5721, %5720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5722) : (i64) -> ()
      %5723 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5723) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5724 = func.call @stack_pop_pointer() : () -> i64
      %5725 = func.call @stack_pop_pointer() : () -> i64
      %5726 = func.call @cc_cons(%5725, %5724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5726) : (i64) -> ()
      %5727 = func.call @stack_pop_pointer() : () -> i64
      %5728 = func.call @stack_pop_pointer() : () -> i64
      %5729 = func.call @cc_cons(%5728, %5727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5729) : (i64) -> ()
      %5730 = func.call @stack_pop_pointer() : () -> i64
      %5731 = func.call @stack_pop_pointer() : () -> i64
      %5732 = func.call @cc_cons(%5731, %5730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5732) : (i64) -> ()
      %5733 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5734 = arith.constant 5 : i64
      %5735 = func.call @cc_make_string(%5733, %5734) : (!llvm.ptr, i64) -> i64
      %5736 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5737 = arith.constant 11 : i64
      %5738 = func.call @cc_make_string(%5736, %5737) : (!llvm.ptr, i64) -> i64
      %5739 = func.call @cc_intern(%5735, %5738) : (i64, i64) -> i64
      %5740 = func.call @cc_nil_value() : () -> i64
      %5741 = func.call @cc_cons(%5739, %5740) : (i64, i64) -> i64
      %5742 = func.call @cc_values_pack(%5741) : (i64) -> i64
      func.call @stack_push_pointer(%5739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5743 = func.call @stack_pop_pointer() : () -> i64
      %5744 = func.call @stack_pop_pointer() : () -> i64
      %5745 = func.call @cc_cons(%5744, %5743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5745) : (i64) -> ()
      %5746 = func.call @stack_pop_pointer() : () -> i64
      %5747 = func.call @stack_pop_pointer() : () -> i64
      %5748 = func.call @cc_cons(%5747, %5746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5748) : (i64) -> ()
      %5749 = func.call @stack_pop_pointer() : () -> i64
      %5750 = func.call @stack_pop_pointer() : () -> i64
      %5751 = func.call @cc_cons(%5750, %5749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5751) : (i64) -> ()
      %5752 = func.call @stack_pop_pointer() : () -> i64
      %5753 = func.call @stack_pop_pointer() : () -> i64
      %5754 = func.call @cc_cons(%5753, %5752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5754) : (i64) -> ()
      %5755 = func.call @stack_pop_pointer() : () -> i64
      %5791 = arith.constant 15079495958547 : i64
      %5792 = arith.constant 0 : i64
      %5793 = func.call @cc_make_closure(%5791, %5792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5793) : (i64) -> ()
      %5794 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5795 = func.call @stack_pop_pointer() : () -> i64
      %5796 = llvm.mlir.addressof @str476 : !llvm.ptr
      %5797 = arith.constant 15 : i64
      %5798 = func.call @cc_make_string(%5796, %5797) : (!llvm.ptr, i64) -> i64
      %5799 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5800 = arith.constant 7 : i64
      %5801 = func.call @cc_make_string(%5799, %5800) : (!llvm.ptr, i64) -> i64
      %5802 = func.call @cc_intern(%5798, %5801) : (i64, i64) -> i64
      %5803 = func.call @cc_nil_value() : () -> i64
      %5804 = func.call @cc_cons(%5802, %5803) : (i64, i64) -> i64
      %5805 = func.call @cc_values_pack(%5804) : (i64) -> i64
      func.call @stack_push_pointer(%5802) : (i64) -> ()
      %5806 = func.call @stack_pop_pointer() : () -> i64
      %5807 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5807) : (i64) -> ()
      %5808 = func.call @stack_pop_pointer() : () -> i64
      %5809 = func.call @cc_nil_value() : () -> i64
      %5810 = func.call @cc_errorp(%5795) : (i64) -> i64
      %5811 = arith.cmpi ne, %5810, %5809 : i64
      %5812 = arith.cmpi eq, %5809, %5809 : i64
      %5813 = arith.andi %5811, %5812 : i1
      %5814 = scf.if %5813 -> (i64) {
        scf.yield %5795 : i64
      } else {
        scf.yield %5809 : i64
      }
      %5815 = func.call @cc_errorp(%5806) : (i64) -> i64
      %5816 = arith.cmpi ne, %5815, %5809 : i64
      %5817 = arith.cmpi eq, %5814, %5809 : i64
      %5818 = arith.andi %5816, %5817 : i1
      %5819 = scf.if %5818 -> (i64) {
        scf.yield %5806 : i64
      } else {
        scf.yield %5814 : i64
      }
      %5820 = func.call @cc_errorp(%5808) : (i64) -> i64
      %5821 = arith.cmpi ne, %5820, %5809 : i64
      %5822 = arith.cmpi eq, %5819, %5809 : i64
      %5823 = arith.andi %5821, %5822 : i1
      %5824 = scf.if %5823 -> (i64) {
        scf.yield %5808 : i64
      } else {
        scf.yield %5819 : i64
      }
      %5825 = arith.cmpi ne, %5824, %5809 : i64
      scf.if %5825 {
        func.call @stack_push_pointer(%5824) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5795) : (i64) -> ()
        func.call @stack_push_pointer(%5806) : (i64) -> ()
        func.call @stack_push_pointer(%5808) : (i64) -> ()
        %5826 = llvm.mlir.addressof @str478 : !llvm.ptr
        %5827 = func.call @cc_make_function_ref_const(%5826) : (!llvm.ptr) -> i64
        %5828 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%5827, %5828) : (i64, i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %5829 = func.call @stack_pop_pointer() : () -> i64
      %5830 = func.call @stack_pop_pointer() : () -> i64
      %5831 = func.call @cc_cons(%5830, %5829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5831) : (i64) -> ()
      %5832 = func.call @stack_pop_pointer() : () -> i64
      %5833 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5834 = arith.constant 11 : i64
      %5835 = func.call @cc_make_string(%5833, %5834) : (!llvm.ptr, i64) -> i64
      %5836 = llvm.mlir.addressof @str480 : !llvm.ptr
      %5837 = arith.constant 7 : i64
      %5838 = func.call @cc_make_string(%5836, %5837) : (!llvm.ptr, i64) -> i64
      %5839 = func.call @cc_intern(%5835, %5838) : (i64, i64) -> i64
      %5840 = func.call @cc_nil_value() : () -> i64
      %5841 = func.call @cc_cons(%5839, %5840) : (i64, i64) -> i64
      %5842 = func.call @cc_values_pack(%5841) : (i64) -> i64
      func.call @stack_push_pointer(%5839) : (i64) -> ()
      %5843 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5844 = func.call @stack_pop_pointer() : () -> i64
      %5845 = llvm.mlir.addressof @str481 : !llvm.ptr
      %5846 = arith.constant 4 : i64
      %5847 = func.call @cc_make_string(%5845, %5846) : (!llvm.ptr, i64) -> i64
      %5848 = llvm.mlir.addressof @str482 : !llvm.ptr
      %5849 = arith.constant 7 : i64
      %5850 = func.call @cc_make_string(%5848, %5849) : (!llvm.ptr, i64) -> i64
      %5851 = func.call @cc_intern(%5847, %5850) : (i64, i64) -> i64
      %5852 = func.call @cc_nil_value() : () -> i64
      %5853 = func.call @cc_cons(%5851, %5852) : (i64, i64) -> i64
      %5854 = func.call @cc_values_pack(%5853) : (i64) -> i64
      func.call @stack_push_pointer(%5851) : (i64) -> ()
      %5855 = func.call @stack_pop_pointer() : () -> i64
      %5856 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5857 = arith.constant 6 : i64
      %5858 = func.call @cc_make_string(%5856, %5857) : (!llvm.ptr, i64) -> i64
      %5859 = func.call @cc_nil_value() : () -> i64
      %5860 = func.call @cc_intern(%5858, %5859) : (i64, i64) -> i64
      %5861 = func.call @cc_nil_value() : () -> i64
      %5862 = func.call @cc_cons(%5860, %5861) : (i64, i64) -> i64
      %5863 = func.call @cc_values_pack(%5862) : (i64) -> i64
      func.call @stack_push_pointer(%5860) : (i64) -> ()
      %5864 = func.call @stack_pop_pointer() : () -> i64
      %5865 = func.call @cc_nil_value() : () -> i64
      %5866 = func.call @cc_errorp(%5643) : (i64) -> i64
      %5867 = arith.cmpi ne, %5866, %5865 : i64
      %5868 = arith.cmpi eq, %5865, %5865 : i64
      %5869 = arith.andi %5867, %5868 : i1
      %5870 = scf.if %5869 -> (i64) {
        scf.yield %5643 : i64
      } else {
        scf.yield %5865 : i64
      }
      %5871 = func.call @cc_errorp(%5755) : (i64) -> i64
      %5872 = arith.cmpi ne, %5871, %5865 : i64
      %5873 = arith.cmpi eq, %5870, %5865 : i64
      %5874 = arith.andi %5872, %5873 : i1
      %5875 = scf.if %5874 -> (i64) {
        scf.yield %5755 : i64
      } else {
        scf.yield %5870 : i64
      }
      %5876 = func.call @cc_errorp(%5794) : (i64) -> i64
      %5877 = arith.cmpi ne, %5876, %5865 : i64
      %5878 = arith.cmpi eq, %5875, %5865 : i64
      %5879 = arith.andi %5877, %5878 : i1
      %5880 = scf.if %5879 -> (i64) {
        scf.yield %5794 : i64
      } else {
        scf.yield %5875 : i64
      }
      %5881 = func.call @cc_errorp(%5832) : (i64) -> i64
      %5882 = arith.cmpi ne, %5881, %5865 : i64
      %5883 = arith.cmpi eq, %5880, %5865 : i64
      %5884 = arith.andi %5882, %5883 : i1
      %5885 = scf.if %5884 -> (i64) {
        scf.yield %5832 : i64
      } else {
        scf.yield %5880 : i64
      }
      %5886 = func.call @cc_errorp(%5843) : (i64) -> i64
      %5887 = arith.cmpi ne, %5886, %5865 : i64
      %5888 = arith.cmpi eq, %5885, %5865 : i64
      %5889 = arith.andi %5887, %5888 : i1
      %5890 = scf.if %5889 -> (i64) {
        scf.yield %5843 : i64
      } else {
        scf.yield %5885 : i64
      }
      %5891 = func.call @cc_errorp(%5844) : (i64) -> i64
      %5892 = arith.cmpi ne, %5891, %5865 : i64
      %5893 = arith.cmpi eq, %5890, %5865 : i64
      %5894 = arith.andi %5892, %5893 : i1
      %5895 = scf.if %5894 -> (i64) {
        scf.yield %5844 : i64
      } else {
        scf.yield %5890 : i64
      }
      %5896 = func.call @cc_errorp(%5855) : (i64) -> i64
      %5897 = arith.cmpi ne, %5896, %5865 : i64
      %5898 = arith.cmpi eq, %5895, %5865 : i64
      %5899 = arith.andi %5897, %5898 : i1
      %5900 = scf.if %5899 -> (i64) {
        scf.yield %5855 : i64
      } else {
        scf.yield %5895 : i64
      }
      %5901 = func.call @cc_errorp(%5864) : (i64) -> i64
      %5902 = arith.cmpi ne, %5901, %5865 : i64
      %5903 = arith.cmpi eq, %5900, %5865 : i64
      %5904 = arith.andi %5902, %5903 : i1
      %5905 = scf.if %5904 -> (i64) {
        scf.yield %5864 : i64
      } else {
        scf.yield %5900 : i64
      }
      %5906 = arith.cmpi ne, %5905, %5865 : i64
      scf.if %5906 {
        func.call @stack_push_pointer(%5905) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5643) : (i64) -> ()
        func.call @stack_push_pointer(%5755) : (i64) -> ()
        func.call @stack_push_pointer(%5794) : (i64) -> ()
        func.call @stack_push_pointer(%5832) : (i64) -> ()
        func.call @stack_push_pointer(%5843) : (i64) -> ()
        func.call @stack_push_pointer(%5844) : (i64) -> ()
        func.call @stack_push_pointer(%5855) : (i64) -> ()
        func.call @stack_push_pointer(%5864) : (i64) -> ()
        %5907 = llvm.mlir.addressof @str484 : !llvm.ptr
        %5908 = func.call @cc_make_function_ref_const(%5907) : (!llvm.ptr) -> i64
        %5909 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5908, %5909) : (i64, i64) -> ()
      }
      %5910 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5910 : i64
    }
    %5911 = func.call @cc_nil_value() : () -> i64
    %5912 = func.call @cc_errorp(%5634) : (i64) -> i64
    %5913 = arith.cmpi ne, %5912, %5911 : i64
    %5914 = scf.if %5913 -> (i64) {
      scf.yield %5634 : i64
    } else {
      %5915 = llvm.mlir.addressof @str485 : !llvm.ptr
      %5916 = arith.constant 22 : i64
      %5917 = func.call @cc_make_string(%5915, %5916) : (!llvm.ptr, i64) -> i64
      %5918 = func.call @cc_nil_value() : () -> i64
      %5919 = func.call @cc_intern(%5917, %5918) : (i64, i64) -> i64
      %5920 = func.call @cc_nil_value() : () -> i64
      %5921 = func.call @cc_cons(%5919, %5920) : (i64, i64) -> i64
      %5922 = func.call @cc_values_pack(%5921) : (i64) -> i64
      func.call @stack_push_pointer(%5919) : (i64) -> ()
      %5923 = func.call @stack_pop_pointer() : () -> i64
      %5924 = llvm.mlir.addressof @str486 : !llvm.ptr
      %5925 = arith.constant 13 : i64
      %5926 = func.call @cc_make_string(%5924, %5925) : (!llvm.ptr, i64) -> i64
      %5927 = llvm.mlir.addressof @str487 : !llvm.ptr
      %5928 = arith.constant 11 : i64
      %5929 = func.call @cc_make_string(%5927, %5928) : (!llvm.ptr, i64) -> i64
      %5930 = func.call @cc_intern(%5926, %5929) : (i64, i64) -> i64
      %5931 = func.call @cc_nil_value() : () -> i64
      %5932 = func.call @cc_cons(%5930, %5931) : (i64, i64) -> i64
      %5933 = func.call @cc_values_pack(%5932) : (i64) -> i64
      func.call @stack_push_pointer(%5930) : (i64) -> ()
      %5934 = llvm.mlir.addressof @str488 : !llvm.ptr
      %5935 = arith.constant 6 : i64
      %5936 = func.call @cc_make_string(%5934, %5935) : (!llvm.ptr, i64) -> i64
      %5937 = func.call @cc_nil_value() : () -> i64
      %5938 = func.call @cc_intern(%5936, %5937) : (i64, i64) -> i64
      %5939 = func.call @cc_nil_value() : () -> i64
      %5940 = func.call @cc_cons(%5938, %5939) : (i64, i64) -> i64
      %5941 = func.call @cc_values_pack(%5940) : (i64) -> i64
      func.call @stack_push_pointer(%5938) : (i64) -> ()
      %5942 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5943 = arith.constant 19 : i64
      %5944 = func.call @cc_make_string(%5942, %5943) : (!llvm.ptr, i64) -> i64
      %5945 = func.call @cc_nil_value() : () -> i64
      %5946 = func.call @cc_intern(%5944, %5945) : (i64, i64) -> i64
      %5947 = func.call @cc_nil_value() : () -> i64
      %5948 = func.call @cc_cons(%5946, %5947) : (i64, i64) -> i64
      %5949 = func.call @cc_values_pack(%5948) : (i64) -> i64
      func.call @stack_push_pointer(%5946) : (i64) -> ()
      %5950 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5951 = arith.constant 12 : i64
      %5952 = func.call @cc_make_string(%5950, %5951) : (!llvm.ptr, i64) -> i64
      %5953 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5954 = arith.constant 11 : i64
      %5955 = func.call @cc_make_string(%5953, %5954) : (!llvm.ptr, i64) -> i64
      %5956 = func.call @cc_intern(%5952, %5955) : (i64, i64) -> i64
      %5957 = func.call @cc_nil_value() : () -> i64
      %5958 = func.call @cc_cons(%5956, %5957) : (i64, i64) -> i64
      %5959 = func.call @cc_values_pack(%5958) : (i64) -> i64
      func.call @stack_push_pointer(%5956) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5960 = func.call @stack_pop_pointer() : () -> i64
      %5961 = llvm.mlir.addressof @str492 : !llvm.ptr
      %5962 = arith.constant 15 : i64
      %5963 = func.call @cc_make_string(%5961, %5962) : (!llvm.ptr, i64) -> i64
      %5964 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5965 = arith.constant 7 : i64
      %5966 = func.call @cc_make_string(%5964, %5965) : (!llvm.ptr, i64) -> i64
      %5967 = func.call @cc_intern(%5963, %5966) : (i64, i64) -> i64
      %5968 = func.call @cc_nil_value() : () -> i64
      %5969 = func.call @cc_cons(%5967, %5968) : (i64, i64) -> i64
      %5970 = func.call @cc_values_pack(%5969) : (i64) -> i64
      func.call @stack_push_pointer(%5967) : (i64) -> ()
      %5971 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5972 = func.call @stack_pop_pointer() : () -> i64
      %5973 = func.call @cc_nil_value() : () -> i64
      %5974 = func.call @cc_errorp(%5960) : (i64) -> i64
      %5975 = arith.cmpi ne, %5974, %5973 : i64
      %5976 = arith.cmpi eq, %5973, %5973 : i64
      %5977 = arith.andi %5975, %5976 : i1
      %5978 = scf.if %5977 -> (i64) {
        scf.yield %5960 : i64
      } else {
        scf.yield %5973 : i64
      }
      %5979 = func.call @cc_errorp(%5971) : (i64) -> i64
      %5980 = arith.cmpi ne, %5979, %5973 : i64
      %5981 = arith.cmpi eq, %5978, %5973 : i64
      %5982 = arith.andi %5980, %5981 : i1
      %5983 = scf.if %5982 -> (i64) {
        scf.yield %5971 : i64
      } else {
        scf.yield %5978 : i64
      }
      %5984 = func.call @cc_errorp(%5972) : (i64) -> i64
      %5985 = arith.cmpi ne, %5984, %5973 : i64
      %5986 = arith.cmpi eq, %5983, %5973 : i64
      %5987 = arith.andi %5985, %5986 : i1
      %5988 = scf.if %5987 -> (i64) {
        scf.yield %5972 : i64
      } else {
        scf.yield %5983 : i64
      }
      %5989 = arith.cmpi ne, %5988, %5973 : i64
      scf.if %5989 {
        func.call @stack_push_pointer(%5988) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5960) : (i64) -> ()
        func.call @stack_push_pointer(%5971) : (i64) -> ()
        func.call @stack_push_pointer(%5972) : (i64) -> ()
        %5990 = llvm.mlir.addressof @str494 : !llvm.ptr
        %5991 = func.call @cc_make_function_ref_const(%5990) : (!llvm.ptr) -> i64
        %5992 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%5991, %5992) : (i64, i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %5993 = func.call @stack_pop_pointer() : () -> i64
      %5994 = func.call @stack_pop_pointer() : () -> i64
      %5995 = func.call @cc_cons(%5994, %5993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5995) : (i64) -> ()
      %5996 = func.call @stack_pop_pointer() : () -> i64
      %5997 = func.call @stack_pop_pointer() : () -> i64
      %5998 = func.call @cc_cons(%5997, %5996) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5998) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5999 = func.call @stack_pop_pointer() : () -> i64
      %6000 = func.call @stack_pop_pointer() : () -> i64
      %6001 = func.call @cc_cons(%6000, %5999) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6001) : (i64) -> ()
      %6002 = func.call @stack_pop_pointer() : () -> i64
      %6003 = func.call @stack_pop_pointer() : () -> i64
      %6004 = func.call @cc_cons(%6003, %6002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6004) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %6014 = func.call @stack_pop_pointer() : () -> i64
      %6015 = func.call @stack_pop_pointer() : () -> i64
      %6016 = func.call @cc_cons(%6015, %6014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6016) : (i64) -> ()
      %6017 = func.call @stack_pop_pointer() : () -> i64
      %6018 = func.call @stack_pop_pointer() : () -> i64
      %6019 = func.call @cc_cons(%6018, %6017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6019) : (i64) -> ()
      %6020 = func.call @stack_pop_pointer() : () -> i64
      %6108 = arith.constant 15079495958548 : i64
      %6109 = arith.constant 0 : i64
      %6110 = func.call @cc_make_closure(%6108, %6109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6110) : (i64) -> ()
      %6111 = func.call @stack_pop_pointer() : () -> i64
      %6112 = llvm.mlir.addressof @str499 : !llvm.ptr
      %6113 = arith.constant 4 : i64
      %6114 = func.call @cc_make_string(%6112, %6113) : (!llvm.ptr, i64) -> i64
      %6115 = func.call @cc_nil_value() : () -> i64
      %6116 = func.call @cc_intern(%6114, %6115) : (i64, i64) -> i64
      %6117 = func.call @cc_nil_value() : () -> i64
      %6118 = func.call @cc_cons(%6116, %6117) : (i64, i64) -> i64
      %6119 = func.call @cc_values_pack(%6118) : (i64) -> i64
      func.call @stack_push_pointer(%6116) : (i64) -> ()
      %6120 = llvm.mlir.addressof @str500 : !llvm.ptr
      %6121 = arith.constant 10 : i64
      %6122 = func.call @cc_make_string(%6120, %6121) : (!llvm.ptr, i64) -> i64
      %6123 = llvm.mlir.addressof @str501 : !llvm.ptr
      %6124 = arith.constant 11 : i64
      %6125 = func.call @cc_make_string(%6123, %6124) : (!llvm.ptr, i64) -> i64
      %6126 = func.call @cc_intern(%6122, %6125) : (i64, i64) -> i64
      %6127 = func.call @cc_nil_value() : () -> i64
      %6128 = func.call @cc_cons(%6126, %6127) : (i64, i64) -> i64
      %6129 = func.call @cc_values_pack(%6128) : (i64) -> i64
      func.call @stack_push_pointer(%6126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6130 = func.call @stack_pop_pointer() : () -> i64
      %6131 = func.call @stack_pop_pointer() : () -> i64
      %6132 = func.call @cc_cons(%6131, %6130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6132) : (i64) -> ()
      %6133 = func.call @stack_pop_pointer() : () -> i64
      %6134 = func.call @stack_pop_pointer() : () -> i64
      %6135 = func.call @cc_cons(%6134, %6133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6135) : (i64) -> ()
      %6136 = func.call @stack_pop_pointer() : () -> i64
      %6137 = llvm.mlir.addressof @str502 : !llvm.ptr
      %6138 = arith.constant 11 : i64
      %6139 = func.call @cc_make_string(%6137, %6138) : (!llvm.ptr, i64) -> i64
      %6140 = llvm.mlir.addressof @str503 : !llvm.ptr
      %6141 = arith.constant 7 : i64
      %6142 = func.call @cc_make_string(%6140, %6141) : (!llvm.ptr, i64) -> i64
      %6143 = func.call @cc_intern(%6139, %6142) : (i64, i64) -> i64
      %6144 = func.call @cc_nil_value() : () -> i64
      %6145 = func.call @cc_cons(%6143, %6144) : (i64, i64) -> i64
      %6146 = func.call @cc_values_pack(%6145) : (i64) -> i64
      func.call @stack_push_pointer(%6143) : (i64) -> ()
      %6147 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6148 = func.call @stack_pop_pointer() : () -> i64
      %6149 = llvm.mlir.addressof @str504 : !llvm.ptr
      %6150 = arith.constant 4 : i64
      %6151 = func.call @cc_make_string(%6149, %6150) : (!llvm.ptr, i64) -> i64
      %6152 = llvm.mlir.addressof @str505 : !llvm.ptr
      %6153 = arith.constant 7 : i64
      %6154 = func.call @cc_make_string(%6152, %6153) : (!llvm.ptr, i64) -> i64
      %6155 = func.call @cc_intern(%6151, %6154) : (i64, i64) -> i64
      %6156 = func.call @cc_nil_value() : () -> i64
      %6157 = func.call @cc_cons(%6155, %6156) : (i64, i64) -> i64
      %6158 = func.call @cc_values_pack(%6157) : (i64) -> i64
      func.call @stack_push_pointer(%6155) : (i64) -> ()
      %6159 = func.call @stack_pop_pointer() : () -> i64
      %6160 = llvm.mlir.addressof @str506 : !llvm.ptr
      %6161 = arith.constant 5 : i64
      %6162 = func.call @cc_make_string(%6160, %6161) : (!llvm.ptr, i64) -> i64
      %6163 = func.call @cc_nil_value() : () -> i64
      %6164 = func.call @cc_intern(%6162, %6163) : (i64, i64) -> i64
      %6165 = func.call @cc_nil_value() : () -> i64
      %6166 = func.call @cc_cons(%6164, %6165) : (i64, i64) -> i64
      %6167 = func.call @cc_values_pack(%6166) : (i64) -> i64
      func.call @stack_push_pointer(%6164) : (i64) -> ()
      %6168 = func.call @stack_pop_pointer() : () -> i64
      %6169 = func.call @cc_nil_value() : () -> i64
      %6170 = func.call @cc_errorp(%5923) : (i64) -> i64
      %6171 = arith.cmpi ne, %6170, %6169 : i64
      %6172 = arith.cmpi eq, %6169, %6169 : i64
      %6173 = arith.andi %6171, %6172 : i1
      %6174 = scf.if %6173 -> (i64) {
        scf.yield %5923 : i64
      } else {
        scf.yield %6169 : i64
      }
      %6175 = func.call @cc_errorp(%6020) : (i64) -> i64
      %6176 = arith.cmpi ne, %6175, %6169 : i64
      %6177 = arith.cmpi eq, %6174, %6169 : i64
      %6178 = arith.andi %6176, %6177 : i1
      %6179 = scf.if %6178 -> (i64) {
        scf.yield %6020 : i64
      } else {
        scf.yield %6174 : i64
      }
      %6180 = func.call @cc_errorp(%6111) : (i64) -> i64
      %6181 = arith.cmpi ne, %6180, %6169 : i64
      %6182 = arith.cmpi eq, %6179, %6169 : i64
      %6183 = arith.andi %6181, %6182 : i1
      %6184 = scf.if %6183 -> (i64) {
        scf.yield %6111 : i64
      } else {
        scf.yield %6179 : i64
      }
      %6185 = func.call @cc_errorp(%6136) : (i64) -> i64
      %6186 = arith.cmpi ne, %6185, %6169 : i64
      %6187 = arith.cmpi eq, %6184, %6169 : i64
      %6188 = arith.andi %6186, %6187 : i1
      %6189 = scf.if %6188 -> (i64) {
        scf.yield %6136 : i64
      } else {
        scf.yield %6184 : i64
      }
      %6190 = func.call @cc_errorp(%6147) : (i64) -> i64
      %6191 = arith.cmpi ne, %6190, %6169 : i64
      %6192 = arith.cmpi eq, %6189, %6169 : i64
      %6193 = arith.andi %6191, %6192 : i1
      %6194 = scf.if %6193 -> (i64) {
        scf.yield %6147 : i64
      } else {
        scf.yield %6189 : i64
      }
      %6195 = func.call @cc_errorp(%6148) : (i64) -> i64
      %6196 = arith.cmpi ne, %6195, %6169 : i64
      %6197 = arith.cmpi eq, %6194, %6169 : i64
      %6198 = arith.andi %6196, %6197 : i1
      %6199 = scf.if %6198 -> (i64) {
        scf.yield %6148 : i64
      } else {
        scf.yield %6194 : i64
      }
      %6200 = func.call @cc_errorp(%6159) : (i64) -> i64
      %6201 = arith.cmpi ne, %6200, %6169 : i64
      %6202 = arith.cmpi eq, %6199, %6169 : i64
      %6203 = arith.andi %6201, %6202 : i1
      %6204 = scf.if %6203 -> (i64) {
        scf.yield %6159 : i64
      } else {
        scf.yield %6199 : i64
      }
      %6205 = func.call @cc_errorp(%6168) : (i64) -> i64
      %6206 = arith.cmpi ne, %6205, %6169 : i64
      %6207 = arith.cmpi eq, %6204, %6169 : i64
      %6208 = arith.andi %6206, %6207 : i1
      %6209 = scf.if %6208 -> (i64) {
        scf.yield %6168 : i64
      } else {
        scf.yield %6204 : i64
      }
      %6210 = arith.cmpi ne, %6209, %6169 : i64
      scf.if %6210 {
        func.call @stack_push_pointer(%6209) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5923) : (i64) -> ()
        func.call @stack_push_pointer(%6020) : (i64) -> ()
        func.call @stack_push_pointer(%6111) : (i64) -> ()
        func.call @stack_push_pointer(%6136) : (i64) -> ()
        func.call @stack_push_pointer(%6147) : (i64) -> ()
        func.call @stack_push_pointer(%6148) : (i64) -> ()
        func.call @stack_push_pointer(%6159) : (i64) -> ()
        func.call @stack_push_pointer(%6168) : (i64) -> ()
        %6211 = llvm.mlir.addressof @str507 : !llvm.ptr
        %6212 = func.call @cc_make_function_ref_const(%6211) : (!llvm.ptr) -> i64
        %6213 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6212, %6213) : (i64, i64) -> ()
      }
      %6214 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6214 : i64
    }
    %6215 = func.call @cc_nil_value() : () -> i64
    %6216 = func.call @cc_errorp(%5914) : (i64) -> i64
    %6217 = arith.cmpi ne, %6216, %6215 : i64
    %6218 = scf.if %6217 -> (i64) {
      scf.yield %5914 : i64
    } else {
      %6219 = llvm.mlir.addressof @str508 : !llvm.ptr
      %6220 = arith.constant 34 : i64
      %6221 = func.call @cc_make_string(%6219, %6220) : (!llvm.ptr, i64) -> i64
      %6222 = func.call @cc_nil_value() : () -> i64
      %6223 = func.call @cc_intern(%6221, %6222) : (i64, i64) -> i64
      %6224 = func.call @cc_nil_value() : () -> i64
      %6225 = func.call @cc_cons(%6223, %6224) : (i64, i64) -> i64
      %6226 = func.call @cc_values_pack(%6225) : (i64) -> i64
      func.call @stack_push_pointer(%6223) : (i64) -> ()
      %6227 = func.call @stack_pop_pointer() : () -> i64
      %6228 = llvm.mlir.addressof @str509 : !llvm.ptr
      %6229 = arith.constant 3 : i64
      %6230 = func.call @cc_make_string(%6228, %6229) : (!llvm.ptr, i64) -> i64
      %6231 = func.call @cc_nil_value() : () -> i64
      %6232 = func.call @cc_intern(%6230, %6231) : (i64, i64) -> i64
      %6233 = func.call @cc_nil_value() : () -> i64
      %6234 = func.call @cc_cons(%6232, %6233) : (i64, i64) -> i64
      %6235 = func.call @cc_values_pack(%6234) : (i64) -> i64
      func.call @stack_push_pointer(%6232) : (i64) -> ()
      %6236 = llvm.mlir.addressof @str510 : !llvm.ptr
      %6237 = arith.constant 3 : i64
      %6238 = func.call @cc_make_string(%6236, %6237) : (!llvm.ptr, i64) -> i64
      %6239 = func.call @cc_nil_value() : () -> i64
      %6240 = func.call @cc_intern(%6238, %6239) : (i64, i64) -> i64
      %6241 = func.call @cc_nil_value() : () -> i64
      %6242 = func.call @cc_cons(%6240, %6241) : (i64, i64) -> i64
      %6243 = func.call @cc_values_pack(%6242) : (i64) -> i64
      func.call @stack_push_pointer(%6240) : (i64) -> ()
      %6244 = llvm.mlir.addressof @str511 : !llvm.ptr
      %6245 = arith.constant 3 : i64
      %6246 = func.call @cc_make_string(%6244, %6245) : (!llvm.ptr, i64) -> i64
      %6247 = func.call @cc_nil_value() : () -> i64
      %6248 = func.call @cc_intern(%6246, %6247) : (i64, i64) -> i64
      %6249 = func.call @cc_nil_value() : () -> i64
      %6250 = func.call @cc_cons(%6248, %6249) : (i64, i64) -> i64
      %6251 = func.call @cc_values_pack(%6250) : (i64) -> i64
      func.call @stack_push_pointer(%6248) : (i64) -> ()
      %6252 = llvm.mlir.addressof @str512 : !llvm.ptr
      %6253 = arith.constant 7 : i64
      %6254 = func.call @cc_make_string(%6252, %6253) : (!llvm.ptr, i64) -> i64
      %6255 = func.call @cc_nil_value() : () -> i64
      %6256 = func.call @cc_intern(%6254, %6255) : (i64, i64) -> i64
      %6257 = func.call @cc_nil_value() : () -> i64
      %6258 = func.call @cc_cons(%6256, %6257) : (i64, i64) -> i64
      %6259 = func.call @cc_values_pack(%6258) : (i64) -> i64
      func.call @stack_push_pointer(%6256) : (i64) -> ()
      %6260 = llvm.mlir.addressof @str513 : !llvm.ptr
      %6261 = arith.constant 12 : i64
      %6262 = func.call @cc_make_string(%6260, %6261) : (!llvm.ptr, i64) -> i64
      %6263 = llvm.mlir.addressof @str514 : !llvm.ptr
      %6264 = arith.constant 11 : i64
      %6265 = func.call @cc_make_string(%6263, %6264) : (!llvm.ptr, i64) -> i64
      %6266 = func.call @cc_intern(%6262, %6265) : (i64, i64) -> i64
      %6267 = func.call @cc_nil_value() : () -> i64
      %6268 = func.call @cc_cons(%6266, %6267) : (i64, i64) -> i64
      %6269 = func.call @cc_values_pack(%6268) : (i64) -> i64
      func.call @stack_push_pointer(%6266) : (i64) -> ()
      %6270 = llvm.mlir.addressof @str515 : !llvm.ptr
      %6271 = arith.constant 7 : i64
      %6272 = func.call @cc_make_string(%6270, %6271) : (!llvm.ptr, i64) -> i64
      %6273 = llvm.mlir.addressof @str516 : !llvm.ptr
      %6274 = arith.constant 11 : i64
      %6275 = func.call @cc_make_string(%6273, %6274) : (!llvm.ptr, i64) -> i64
      %6276 = func.call @cc_intern(%6272, %6275) : (i64, i64) -> i64
      %6277 = func.call @cc_nil_value() : () -> i64
      %6278 = func.call @cc_cons(%6276, %6277) : (i64, i64) -> i64
      %6279 = func.call @cc_values_pack(%6278) : (i64) -> i64
      func.call @stack_push_pointer(%6276) : (i64) -> ()
      %6280 = llvm.mlir.addressof @str517 : !llvm.ptr
      %6281 = arith.constant 7 : i64
      %6282 = func.call @cc_make_string(%6280, %6281) : (!llvm.ptr, i64) -> i64
      %6283 = llvm.mlir.addressof @str518 : !llvm.ptr
      %6284 = arith.constant 11 : i64
      %6285 = func.call @cc_make_string(%6283, %6284) : (!llvm.ptr, i64) -> i64
      %6286 = func.call @cc_intern(%6282, %6285) : (i64, i64) -> i64
      %6287 = func.call @cc_nil_value() : () -> i64
      %6288 = func.call @cc_cons(%6286, %6287) : (i64, i64) -> i64
      %6289 = func.call @cc_values_pack(%6288) : (i64) -> i64
      func.call @stack_push_pointer(%6286) : (i64) -> ()
      %6290 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6291 = arith.constant 8 : i64
      %6292 = func.call @cc_make_string(%6290, %6291) : (!llvm.ptr, i64) -> i64
      %6293 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6294 = arith.constant 11 : i64
      %6295 = func.call @cc_make_string(%6293, %6294) : (!llvm.ptr, i64) -> i64
      %6296 = func.call @cc_intern(%6292, %6295) : (i64, i64) -> i64
      %6297 = func.call @cc_nil_value() : () -> i64
      %6298 = func.call @cc_cons(%6296, %6297) : (i64, i64) -> i64
      %6299 = func.call @cc_values_pack(%6298) : (i64) -> i64
      func.call @stack_push_pointer(%6296) : (i64) -> ()
      %6300 = llvm.mlir.addressof @str521 : !llvm.ptr
      %6301 = arith.constant 5 : i64
      %6302 = func.call @cc_make_string(%6300, %6301) : (!llvm.ptr, i64) -> i64
      %6303 = llvm.mlir.addressof @str522 : !llvm.ptr
      %6304 = arith.constant 11 : i64
      %6305 = func.call @cc_make_string(%6303, %6304) : (!llvm.ptr, i64) -> i64
      %6306 = func.call @cc_intern(%6302, %6305) : (i64, i64) -> i64
      %6307 = func.call @cc_nil_value() : () -> i64
      %6308 = func.call @cc_cons(%6306, %6307) : (i64, i64) -> i64
      %6309 = func.call @cc_values_pack(%6308) : (i64) -> i64
      func.call @stack_push_pointer(%6306) : (i64) -> ()
      %6310 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6311 = func.call @stack_pop_pointer() : () -> i64
      %6312 = func.call @stack_pop_pointer() : () -> i64
      %6313 = func.call @cc_cons(%6312, %6311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6313) : (i64) -> ()
      %6314 = func.call @stack_pop_pointer() : () -> i64
      %6315 = func.call @stack_pop_pointer() : () -> i64
      %6316 = func.call @cc_cons(%6315, %6314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6316) : (i64) -> ()
      %6317 = llvm.mlir.addressof @str523 : !llvm.ptr
      %6318 = arith.constant 6 : i64
      %6319 = func.call @cc_make_string(%6317, %6318) : (!llvm.ptr, i64) -> i64
      %6320 = llvm.mlir.addressof @str524 : !llvm.ptr
      %6321 = arith.constant 11 : i64
      %6322 = func.call @cc_make_string(%6320, %6321) : (!llvm.ptr, i64) -> i64
      %6323 = func.call @cc_intern(%6319, %6322) : (i64, i64) -> i64
      %6324 = func.call @cc_nil_value() : () -> i64
      %6325 = func.call @cc_cons(%6323, %6324) : (i64, i64) -> i64
      %6326 = func.call @cc_values_pack(%6325) : (i64) -> i64
      func.call @stack_push_pointer(%6323) : (i64) -> ()
      %6327 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6327) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6328 = func.call @stack_pop_pointer() : () -> i64
      %6329 = func.call @stack_pop_pointer() : () -> i64
      %6330 = func.call @cc_cons(%6329, %6328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6330) : (i64) -> ()
      %6331 = func.call @stack_pop_pointer() : () -> i64
      %6332 = func.call @stack_pop_pointer() : () -> i64
      %6333 = func.call @cc_cons(%6332, %6331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6333) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6334 = func.call @stack_pop_pointer() : () -> i64
      %6335 = func.call @stack_pop_pointer() : () -> i64
      %6336 = func.call @cc_cons(%6335, %6334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6336) : (i64) -> ()
      %6337 = func.call @stack_pop_pointer() : () -> i64
      %6338 = func.call @stack_pop_pointer() : () -> i64
      %6339 = func.call @cc_cons(%6338, %6337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6339) : (i64) -> ()
      %6340 = func.call @stack_pop_pointer() : () -> i64
      %6341 = func.call @stack_pop_pointer() : () -> i64
      %6342 = func.call @cc_cons(%6341, %6340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6343 = func.call @stack_pop_pointer() : () -> i64
      %6344 = func.call @stack_pop_pointer() : () -> i64
      %6345 = func.call @cc_cons(%6344, %6343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6345) : (i64) -> ()
      %6346 = func.call @stack_pop_pointer() : () -> i64
      %6347 = func.call @stack_pop_pointer() : () -> i64
      %6348 = func.call @cc_cons(%6347, %6346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6348) : (i64) -> ()
      %6349 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6350 = arith.constant 4 : i64
      %6351 = func.call @cc_make_string(%6349, %6350) : (!llvm.ptr, i64) -> i64
      %6352 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6353 = arith.constant 11 : i64
      %6354 = func.call @cc_make_string(%6352, %6353) : (!llvm.ptr, i64) -> i64
      %6355 = func.call @cc_intern(%6351, %6354) : (i64, i64) -> i64
      %6356 = func.call @cc_nil_value() : () -> i64
      %6357 = func.call @cc_cons(%6355, %6356) : (i64, i64) -> i64
      %6358 = func.call @cc_values_pack(%6357) : (i64) -> i64
      func.call @stack_push_pointer(%6355) : (i64) -> ()
      %6359 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6360 = arith.constant 10 : i64
      %6361 = func.call @cc_make_string(%6359, %6360) : (!llvm.ptr, i64) -> i64
      %6362 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6363 = arith.constant 11 : i64
      %6364 = func.call @cc_make_string(%6362, %6363) : (!llvm.ptr, i64) -> i64
      %6365 = func.call @cc_intern(%6361, %6364) : (i64, i64) -> i64
      %6366 = func.call @cc_nil_value() : () -> i64
      %6367 = func.call @cc_cons(%6365, %6366) : (i64, i64) -> i64
      %6368 = func.call @cc_values_pack(%6367) : (i64) -> i64
      func.call @stack_push_pointer(%6365) : (i64) -> ()
      %6369 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6369) : (i64) -> ()
      %6370 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6371 = arith.constant 15 : i64
      %6372 = func.call @cc_make_string(%6370, %6371) : (!llvm.ptr, i64) -> i64
      %6373 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6374 = arith.constant 7 : i64
      %6375 = func.call @cc_make_string(%6373, %6374) : (!llvm.ptr, i64) -> i64
      %6376 = func.call @cc_intern(%6372, %6375) : (i64, i64) -> i64
      %6377 = func.call @cc_nil_value() : () -> i64
      %6378 = func.call @cc_cons(%6376, %6377) : (i64, i64) -> i64
      %6379 = func.call @cc_values_pack(%6378) : (i64) -> i64
      func.call @stack_push_pointer(%6376) : (i64) -> ()
      %6380 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%6380) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6381 = func.call @stack_pop_pointer() : () -> i64
      %6382 = func.call @stack_pop_pointer() : () -> i64
      %6383 = func.call @cc_cons(%6382, %6381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6383) : (i64) -> ()
      %6384 = func.call @stack_pop_pointer() : () -> i64
      %6385 = func.call @stack_pop_pointer() : () -> i64
      %6386 = func.call @cc_cons(%6385, %6384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6386) : (i64) -> ()
      %6387 = func.call @stack_pop_pointer() : () -> i64
      %6388 = func.call @stack_pop_pointer() : () -> i64
      %6389 = func.call @cc_cons(%6388, %6387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6389) : (i64) -> ()
      %6390 = func.call @stack_pop_pointer() : () -> i64
      %6391 = func.call @stack_pop_pointer() : () -> i64
      %6392 = func.call @cc_cons(%6391, %6390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6392) : (i64) -> ()
      %6393 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%6393) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6394 = func.call @stack_pop_pointer() : () -> i64
      %6395 = func.call @stack_pop_pointer() : () -> i64
      %6396 = func.call @cc_cons(%6395, %6394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6396) : (i64) -> ()
      %6397 = func.call @stack_pop_pointer() : () -> i64
      %6398 = func.call @stack_pop_pointer() : () -> i64
      %6399 = func.call @cc_cons(%6398, %6397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6399) : (i64) -> ()
      %6400 = func.call @stack_pop_pointer() : () -> i64
      %6401 = func.call @stack_pop_pointer() : () -> i64
      %6402 = func.call @cc_cons(%6401, %6400) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6402) : (i64) -> ()
      %6403 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6404 = arith.constant 4 : i64
      %6405 = func.call @cc_make_string(%6403, %6404) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6405) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6406 = func.call @stack_pop_pointer() : () -> i64
      %6407 = func.call @stack_pop_pointer() : () -> i64
      %6408 = func.call @cc_cons(%6407, %6406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6408) : (i64) -> ()
      %6409 = func.call @stack_pop_pointer() : () -> i64
      %6410 = func.call @stack_pop_pointer() : () -> i64
      %6411 = func.call @cc_cons(%6410, %6409) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6411) : (i64) -> ()
      %6412 = func.call @stack_pop_pointer() : () -> i64
      %6413 = func.call @stack_pop_pointer() : () -> i64
      %6414 = func.call @cc_cons(%6413, %6412) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6414) : (i64) -> ()
      %6415 = func.call @stack_pop_pointer() : () -> i64
      %6416 = func.call @stack_pop_pointer() : () -> i64
      %6417 = func.call @cc_cons(%6416, %6415) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6417) : (i64) -> ()
      %6418 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6419 = arith.constant 5 : i64
      %6420 = func.call @cc_make_string(%6418, %6419) : (!llvm.ptr, i64) -> i64
      %6421 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6422 = arith.constant 11 : i64
      %6423 = func.call @cc_make_string(%6421, %6422) : (!llvm.ptr, i64) -> i64
      %6424 = func.call @cc_intern(%6420, %6423) : (i64, i64) -> i64
      %6425 = func.call @cc_nil_value() : () -> i64
      %6426 = func.call @cc_cons(%6424, %6425) : (i64, i64) -> i64
      %6427 = func.call @cc_values_pack(%6426) : (i64) -> i64
      func.call @stack_push_pointer(%6424) : (i64) -> ()
      %6428 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6429 = arith.constant 1 : i64
      %6430 = func.call @cc_make_string(%6428, %6429) : (!llvm.ptr, i64) -> i64
      %6431 = func.call @cc_nil_value() : () -> i64
      %6432 = func.call @cc_intern(%6430, %6431) : (i64, i64) -> i64
      %6433 = func.call @cc_nil_value() : () -> i64
      %6434 = func.call @cc_cons(%6432, %6433) : (i64, i64) -> i64
      %6435 = func.call @cc_values_pack(%6434) : (i64) -> i64
      func.call @stack_push_pointer(%6432) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6436 = func.call @stack_pop_pointer() : () -> i64
      %6437 = func.call @stack_pop_pointer() : () -> i64
      %6438 = func.call @cc_cons(%6437, %6436) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6438) : (i64) -> ()
      %6439 = llvm.mlir.addressof @str535 : !llvm.ptr
      %6440 = arith.constant 15 : i64
      %6441 = func.call @cc_make_string(%6439, %6440) : (!llvm.ptr, i64) -> i64
      %6442 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6443 = arith.constant 11 : i64
      %6444 = func.call @cc_make_string(%6442, %6443) : (!llvm.ptr, i64) -> i64
      %6445 = func.call @cc_intern(%6441, %6444) : (i64, i64) -> i64
      %6446 = func.call @cc_nil_value() : () -> i64
      %6447 = func.call @cc_cons(%6445, %6446) : (i64, i64) -> i64
      %6448 = func.call @cc_values_pack(%6447) : (i64) -> i64
      func.call @stack_push_pointer(%6445) : (i64) -> ()
      %6449 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6450 = arith.constant 1 : i64
      %6451 = func.call @cc_make_string(%6449, %6450) : (!llvm.ptr, i64) -> i64
      %6452 = func.call @cc_nil_value() : () -> i64
      %6453 = func.call @cc_intern(%6451, %6452) : (i64, i64) -> i64
      %6454 = func.call @cc_nil_value() : () -> i64
      %6455 = func.call @cc_cons(%6453, %6454) : (i64, i64) -> i64
      %6456 = func.call @cc_values_pack(%6455) : (i64) -> i64
      func.call @stack_push_pointer(%6453) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6457 = func.call @stack_pop_pointer() : () -> i64
      %6458 = func.call @stack_pop_pointer() : () -> i64
      %6459 = func.call @cc_cons(%6458, %6457) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6459) : (i64) -> ()
      %6460 = func.call @stack_pop_pointer() : () -> i64
      %6461 = func.call @stack_pop_pointer() : () -> i64
      %6462 = func.call @cc_cons(%6461, %6460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6462) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6463 = func.call @stack_pop_pointer() : () -> i64
      %6464 = func.call @stack_pop_pointer() : () -> i64
      %6465 = func.call @cc_cons(%6464, %6463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6465) : (i64) -> ()
      %6466 = func.call @stack_pop_pointer() : () -> i64
      %6467 = func.call @stack_pop_pointer() : () -> i64
      %6468 = func.call @cc_cons(%6467, %6466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6468) : (i64) -> ()
      %6469 = func.call @stack_pop_pointer() : () -> i64
      %6470 = func.call @stack_pop_pointer() : () -> i64
      %6471 = func.call @cc_cons(%6470, %6469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6472 = func.call @stack_pop_pointer() : () -> i64
      %6473 = func.call @stack_pop_pointer() : () -> i64
      %6474 = func.call @cc_cons(%6473, %6472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6474) : (i64) -> ()
      %6475 = func.call @stack_pop_pointer() : () -> i64
      %6476 = func.call @stack_pop_pointer() : () -> i64
      %6477 = func.call @cc_cons(%6476, %6475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6477) : (i64) -> ()
      %6478 = func.call @stack_pop_pointer() : () -> i64
      %6479 = func.call @stack_pop_pointer() : () -> i64
      %6480 = func.call @cc_cons(%6479, %6478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6480) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6481 = func.call @stack_pop_pointer() : () -> i64
      %6482 = func.call @stack_pop_pointer() : () -> i64
      %6483 = func.call @cc_cons(%6482, %6481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6483) : (i64) -> ()
      %6484 = func.call @stack_pop_pointer() : () -> i64
      %6485 = func.call @stack_pop_pointer() : () -> i64
      %6486 = func.call @cc_cons(%6485, %6484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6486) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6487 = func.call @stack_pop_pointer() : () -> i64
      %6488 = func.call @stack_pop_pointer() : () -> i64
      %6489 = func.call @cc_cons(%6488, %6487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6489) : (i64) -> ()
      %6490 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6491 = arith.constant 2 : i64
      %6492 = func.call @cc_make_string(%6490, %6491) : (!llvm.ptr, i64) -> i64
      %6493 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6494 = arith.constant 11 : i64
      %6495 = func.call @cc_make_string(%6493, %6494) : (!llvm.ptr, i64) -> i64
      %6496 = func.call @cc_intern(%6492, %6495) : (i64, i64) -> i64
      %6497 = func.call @cc_nil_value() : () -> i64
      %6498 = func.call @cc_cons(%6496, %6497) : (i64, i64) -> i64
      %6499 = func.call @cc_values_pack(%6498) : (i64) -> i64
      func.call @stack_push_pointer(%6496) : (i64) -> ()
      %6500 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6501 = arith.constant 6 : i64
      %6502 = func.call @cc_make_string(%6500, %6501) : (!llvm.ptr, i64) -> i64
      %6503 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6504 = arith.constant 11 : i64
      %6505 = func.call @cc_make_string(%6503, %6504) : (!llvm.ptr, i64) -> i64
      %6506 = func.call @cc_intern(%6502, %6505) : (i64, i64) -> i64
      %6507 = func.call @cc_nil_value() : () -> i64
      %6508 = func.call @cc_cons(%6506, %6507) : (i64, i64) -> i64
      %6509 = func.call @cc_values_pack(%6508) : (i64) -> i64
      func.call @stack_push_pointer(%6506) : (i64) -> ()
      %6510 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6511 = arith.constant 12 : i64
      %6512 = func.call @cc_make_string(%6510, %6511) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6512) : (i64) -> ()
      %6513 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6514 = arith.constant 7 : i64
      %6515 = func.call @cc_make_string(%6513, %6514) : (!llvm.ptr, i64) -> i64
      %6516 = func.call @cc_nil_value() : () -> i64
      %6517 = func.call @cc_intern(%6515, %6516) : (i64, i64) -> i64
      %6518 = func.call @cc_nil_value() : () -> i64
      %6519 = func.call @cc_cons(%6517, %6518) : (i64, i64) -> i64
      %6520 = func.call @cc_values_pack(%6519) : (i64) -> i64
      func.call @stack_push_pointer(%6517) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6521 = func.call @stack_pop_pointer() : () -> i64
      %6522 = func.call @stack_pop_pointer() : () -> i64
      %6523 = func.call @cc_cons(%6522, %6521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6523) : (i64) -> ()
      %6524 = func.call @stack_pop_pointer() : () -> i64
      %6525 = func.call @stack_pop_pointer() : () -> i64
      %6526 = func.call @cc_cons(%6525, %6524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6526) : (i64) -> ()
      %6527 = func.call @stack_pop_pointer() : () -> i64
      %6528 = func.call @stack_pop_pointer() : () -> i64
      %6529 = func.call @cc_cons(%6528, %6527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6529) : (i64) -> ()
      %6530 = llvm.mlir.addressof @str544 : !llvm.ptr
      %6531 = arith.constant 6 : i64
      %6532 = func.call @cc_make_string(%6530, %6531) : (!llvm.ptr, i64) -> i64
      %6533 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6534 = arith.constant 11 : i64
      %6535 = func.call @cc_make_string(%6533, %6534) : (!llvm.ptr, i64) -> i64
      %6536 = func.call @cc_intern(%6532, %6535) : (i64, i64) -> i64
      %6537 = func.call @cc_nil_value() : () -> i64
      %6538 = func.call @cc_cons(%6536, %6537) : (i64, i64) -> i64
      %6539 = func.call @cc_values_pack(%6538) : (i64) -> i64
      func.call @stack_push_pointer(%6536) : (i64) -> ()
      %6540 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6541 = arith.constant 15 : i64
      %6542 = func.call @cc_make_string(%6540, %6541) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6542) : (i64) -> ()
      %6543 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6544 = arith.constant 7 : i64
      %6545 = func.call @cc_make_string(%6543, %6544) : (!llvm.ptr, i64) -> i64
      %6546 = func.call @cc_nil_value() : () -> i64
      %6547 = func.call @cc_intern(%6545, %6546) : (i64, i64) -> i64
      %6548 = func.call @cc_nil_value() : () -> i64
      %6549 = func.call @cc_cons(%6547, %6548) : (i64, i64) -> i64
      %6550 = func.call @cc_values_pack(%6549) : (i64) -> i64
      func.call @stack_push_pointer(%6547) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6551 = func.call @stack_pop_pointer() : () -> i64
      %6552 = func.call @stack_pop_pointer() : () -> i64
      %6553 = func.call @cc_cons(%6552, %6551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6553) : (i64) -> ()
      %6554 = func.call @stack_pop_pointer() : () -> i64
      %6555 = func.call @stack_pop_pointer() : () -> i64
      %6556 = func.call @cc_cons(%6555, %6554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6556) : (i64) -> ()
      %6557 = func.call @stack_pop_pointer() : () -> i64
      %6558 = func.call @stack_pop_pointer() : () -> i64
      %6559 = func.call @cc_cons(%6558, %6557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6559) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6560 = func.call @stack_pop_pointer() : () -> i64
      %6561 = func.call @stack_pop_pointer() : () -> i64
      %6562 = func.call @cc_cons(%6561, %6560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6562) : (i64) -> ()
      %6563 = func.call @stack_pop_pointer() : () -> i64
      %6564 = func.call @stack_pop_pointer() : () -> i64
      %6565 = func.call @cc_cons(%6564, %6563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6565) : (i64) -> ()
      %6566 = func.call @stack_pop_pointer() : () -> i64
      %6567 = func.call @stack_pop_pointer() : () -> i64
      %6568 = func.call @cc_cons(%6567, %6566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6568) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6569 = func.call @stack_pop_pointer() : () -> i64
      %6570 = func.call @stack_pop_pointer() : () -> i64
      %6571 = func.call @cc_cons(%6570, %6569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6571) : (i64) -> ()
      %6572 = func.call @stack_pop_pointer() : () -> i64
      %6573 = func.call @stack_pop_pointer() : () -> i64
      %6574 = func.call @cc_cons(%6573, %6572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6574) : (i64) -> ()
      %6575 = func.call @stack_pop_pointer() : () -> i64
      %6576 = func.call @stack_pop_pointer() : () -> i64
      %6577 = func.call @cc_cons(%6576, %6575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6577) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6578 = func.call @stack_pop_pointer() : () -> i64
      %6579 = func.call @stack_pop_pointer() : () -> i64
      %6580 = func.call @cc_cons(%6579, %6578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6580) : (i64) -> ()
      %6581 = func.call @stack_pop_pointer() : () -> i64
      %6582 = func.call @stack_pop_pointer() : () -> i64
      %6583 = func.call @cc_cons(%6582, %6581) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6583) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6584 = func.call @stack_pop_pointer() : () -> i64
      %6585 = func.call @stack_pop_pointer() : () -> i64
      %6586 = func.call @cc_cons(%6585, %6584) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6586) : (i64) -> ()
      %6587 = func.call @stack_pop_pointer() : () -> i64
      %6588 = func.call @stack_pop_pointer() : () -> i64
      %6589 = func.call @cc_cons(%6588, %6587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6589) : (i64) -> ()
      %6590 = func.call @stack_pop_pointer() : () -> i64
      %6738 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6739 = arith.constant 29 : i64
      %6740 = func.call @cc_make_symbol(%6738, %6739) : (!llvm.ptr, i64) -> i64
      %6741 = func.call @cc_persistent_root_value(%6740) : (i64) -> i64
      func.call @stack_push_pointer(%6741) : (i64) -> ()
      %6742 = arith.constant 15079495958549 : i64
      %6743 = arith.constant 1 : i64
      %6744 = func.call @cc_make_closure(%6742, %6743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6744) : (i64) -> ()
      %6745 = func.call @stack_pop_pointer() : () -> i64
      %6746 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6747 = arith.constant 1 : i64
      %6748 = func.call @cc_make_string(%6746, %6747) : (!llvm.ptr, i64) -> i64
      %6749 = func.call @cc_nil_value() : () -> i64
      %6750 = func.call @cc_intern(%6748, %6749) : (i64, i64) -> i64
      %6751 = func.call @cc_nil_value() : () -> i64
      %6752 = func.call @cc_cons(%6750, %6751) : (i64, i64) -> i64
      %6753 = func.call @cc_values_pack(%6752) : (i64) -> i64
      func.call @stack_push_pointer(%6750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6754 = func.call @stack_pop_pointer() : () -> i64
      %6755 = func.call @stack_pop_pointer() : () -> i64
      %6756 = func.call @cc_cons(%6755, %6754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6756) : (i64) -> ()
      %6757 = func.call @stack_pop_pointer() : () -> i64
      %6758 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6759 = arith.constant 11 : i64
      %6760 = func.call @cc_make_string(%6758, %6759) : (!llvm.ptr, i64) -> i64
      %6761 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6762 = arith.constant 7 : i64
      %6763 = func.call @cc_make_string(%6761, %6762) : (!llvm.ptr, i64) -> i64
      %6764 = func.call @cc_intern(%6760, %6763) : (i64, i64) -> i64
      %6765 = func.call @cc_nil_value() : () -> i64
      %6766 = func.call @cc_cons(%6764, %6765) : (i64, i64) -> i64
      %6767 = func.call @cc_values_pack(%6766) : (i64) -> i64
      func.call @stack_push_pointer(%6764) : (i64) -> ()
      %6768 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6769 = func.call @stack_pop_pointer() : () -> i64
      %6770 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6771 = arith.constant 4 : i64
      %6772 = func.call @cc_make_string(%6770, %6771) : (!llvm.ptr, i64) -> i64
      %6773 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6774 = arith.constant 7 : i64
      %6775 = func.call @cc_make_string(%6773, %6774) : (!llvm.ptr, i64) -> i64
      %6776 = func.call @cc_intern(%6772, %6775) : (i64, i64) -> i64
      %6777 = func.call @cc_nil_value() : () -> i64
      %6778 = func.call @cc_cons(%6776, %6777) : (i64, i64) -> i64
      %6779 = func.call @cc_values_pack(%6778) : (i64) -> i64
      func.call @stack_push_pointer(%6776) : (i64) -> ()
      %6780 = func.call @stack_pop_pointer() : () -> i64
      %6781 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6782 = arith.constant 6 : i64
      %6783 = func.call @cc_make_string(%6781, %6782) : (!llvm.ptr, i64) -> i64
      %6784 = func.call @cc_nil_value() : () -> i64
      %6785 = func.call @cc_intern(%6783, %6784) : (i64, i64) -> i64
      %6786 = func.call @cc_nil_value() : () -> i64
      %6787 = func.call @cc_cons(%6785, %6786) : (i64, i64) -> i64
      %6788 = func.call @cc_values_pack(%6787) : (i64) -> i64
      func.call @stack_push_pointer(%6785) : (i64) -> ()
      %6789 = func.call @stack_pop_pointer() : () -> i64
      %6790 = func.call @cc_nil_value() : () -> i64
      %6791 = func.call @cc_errorp(%6227) : (i64) -> i64
      %6792 = arith.cmpi ne, %6791, %6790 : i64
      %6793 = arith.cmpi eq, %6790, %6790 : i64
      %6794 = arith.andi %6792, %6793 : i1
      %6795 = scf.if %6794 -> (i64) {
        scf.yield %6227 : i64
      } else {
        scf.yield %6790 : i64
      }
      %6796 = func.call @cc_errorp(%6590) : (i64) -> i64
      %6797 = arith.cmpi ne, %6796, %6790 : i64
      %6798 = arith.cmpi eq, %6795, %6790 : i64
      %6799 = arith.andi %6797, %6798 : i1
      %6800 = scf.if %6799 -> (i64) {
        scf.yield %6590 : i64
      } else {
        scf.yield %6795 : i64
      }
      %6801 = func.call @cc_errorp(%6745) : (i64) -> i64
      %6802 = arith.cmpi ne, %6801, %6790 : i64
      %6803 = arith.cmpi eq, %6800, %6790 : i64
      %6804 = arith.andi %6802, %6803 : i1
      %6805 = scf.if %6804 -> (i64) {
        scf.yield %6745 : i64
      } else {
        scf.yield %6800 : i64
      }
      %6806 = func.call @cc_errorp(%6757) : (i64) -> i64
      %6807 = arith.cmpi ne, %6806, %6790 : i64
      %6808 = arith.cmpi eq, %6805, %6790 : i64
      %6809 = arith.andi %6807, %6808 : i1
      %6810 = scf.if %6809 -> (i64) {
        scf.yield %6757 : i64
      } else {
        scf.yield %6805 : i64
      }
      %6811 = func.call @cc_errorp(%6768) : (i64) -> i64
      %6812 = arith.cmpi ne, %6811, %6790 : i64
      %6813 = arith.cmpi eq, %6810, %6790 : i64
      %6814 = arith.andi %6812, %6813 : i1
      %6815 = scf.if %6814 -> (i64) {
        scf.yield %6768 : i64
      } else {
        scf.yield %6810 : i64
      }
      %6816 = func.call @cc_errorp(%6769) : (i64) -> i64
      %6817 = arith.cmpi ne, %6816, %6790 : i64
      %6818 = arith.cmpi eq, %6815, %6790 : i64
      %6819 = arith.andi %6817, %6818 : i1
      %6820 = scf.if %6819 -> (i64) {
        scf.yield %6769 : i64
      } else {
        scf.yield %6815 : i64
      }
      %6821 = func.call @cc_errorp(%6780) : (i64) -> i64
      %6822 = arith.cmpi ne, %6821, %6790 : i64
      %6823 = arith.cmpi eq, %6820, %6790 : i64
      %6824 = arith.andi %6822, %6823 : i1
      %6825 = scf.if %6824 -> (i64) {
        scf.yield %6780 : i64
      } else {
        scf.yield %6820 : i64
      }
      %6826 = func.call @cc_errorp(%6789) : (i64) -> i64
      %6827 = arith.cmpi ne, %6826, %6790 : i64
      %6828 = arith.cmpi eq, %6825, %6790 : i64
      %6829 = arith.andi %6827, %6828 : i1
      %6830 = scf.if %6829 -> (i64) {
        scf.yield %6789 : i64
      } else {
        scf.yield %6825 : i64
      }
      %6831 = arith.cmpi ne, %6830, %6790 : i64
      scf.if %6831 {
        func.call @stack_push_pointer(%6830) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6227) : (i64) -> ()
        func.call @stack_push_pointer(%6590) : (i64) -> ()
        func.call @stack_push_pointer(%6745) : (i64) -> ()
        func.call @stack_push_pointer(%6757) : (i64) -> ()
        func.call @stack_push_pointer(%6768) : (i64) -> ()
        func.call @stack_push_pointer(%6769) : (i64) -> ()
        func.call @stack_push_pointer(%6780) : (i64) -> ()
        func.call @stack_push_pointer(%6789) : (i64) -> ()
        %6832 = llvm.mlir.addressof @str566 : !llvm.ptr
        %6833 = func.call @cc_make_function_ref_const(%6832) : (!llvm.ptr) -> i64
        %6834 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6833, %6834) : (i64, i64) -> ()
      }
      %6835 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6835 : i64
    }
    %6836 = func.call @cc_nil_value() : () -> i64
    %6837 = func.call @cc_errorp(%6218) : (i64) -> i64
    %6838 = arith.cmpi ne, %6837, %6836 : i64
    %6839 = scf.if %6838 -> (i64) {
      scf.yield %6218 : i64
    } else {
      %6840 = llvm.mlir.addressof @str567 : !llvm.ptr
      %6841 = arith.constant 24 : i64
      %6842 = func.call @cc_make_string(%6840, %6841) : (!llvm.ptr, i64) -> i64
      %6843 = func.call @cc_nil_value() : () -> i64
      %6844 = func.call @cc_intern(%6842, %6843) : (i64, i64) -> i64
      %6845 = func.call @cc_nil_value() : () -> i64
      %6846 = func.call @cc_cons(%6844, %6845) : (i64, i64) -> i64
      %6847 = func.call @cc_values_pack(%6846) : (i64) -> i64
      func.call @stack_push_pointer(%6844) : (i64) -> ()
      %6848 = func.call @stack_pop_pointer() : () -> i64
      %6849 = llvm.mlir.addressof @str568 : !llvm.ptr
      %6850 = arith.constant 3 : i64
      %6851 = func.call @cc_make_string(%6849, %6850) : (!llvm.ptr, i64) -> i64
      %6852 = func.call @cc_nil_value() : () -> i64
      %6853 = func.call @cc_intern(%6851, %6852) : (i64, i64) -> i64
      %6854 = func.call @cc_nil_value() : () -> i64
      %6855 = func.call @cc_cons(%6853, %6854) : (i64, i64) -> i64
      %6856 = func.call @cc_values_pack(%6855) : (i64) -> i64
      func.call @stack_push_pointer(%6853) : (i64) -> ()
      %6857 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6858 = arith.constant 3 : i64
      %6859 = func.call @cc_make_string(%6857, %6858) : (!llvm.ptr, i64) -> i64
      %6860 = func.call @cc_nil_value() : () -> i64
      %6861 = func.call @cc_intern(%6859, %6860) : (i64, i64) -> i64
      %6862 = func.call @cc_nil_value() : () -> i64
      %6863 = func.call @cc_cons(%6861, %6862) : (i64, i64) -> i64
      %6864 = func.call @cc_values_pack(%6863) : (i64) -> i64
      func.call @stack_push_pointer(%6861) : (i64) -> ()
      %6865 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6866 = arith.constant 3 : i64
      %6867 = func.call @cc_make_string(%6865, %6866) : (!llvm.ptr, i64) -> i64
      %6868 = func.call @cc_nil_value() : () -> i64
      %6869 = func.call @cc_intern(%6867, %6868) : (i64, i64) -> i64
      %6870 = func.call @cc_nil_value() : () -> i64
      %6871 = func.call @cc_cons(%6869, %6870) : (i64, i64) -> i64
      %6872 = func.call @cc_values_pack(%6871) : (i64) -> i64
      func.call @stack_push_pointer(%6869) : (i64) -> ()
      %6873 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6874 = arith.constant 9 : i64
      %6875 = func.call @cc_make_string(%6873, %6874) : (!llvm.ptr, i64) -> i64
      %6876 = func.call @cc_nil_value() : () -> i64
      %6877 = func.call @cc_intern(%6875, %6876) : (i64, i64) -> i64
      %6878 = func.call @cc_nil_value() : () -> i64
      %6879 = func.call @cc_cons(%6877, %6878) : (i64, i64) -> i64
      %6880 = func.call @cc_values_pack(%6879) : (i64) -> i64
      func.call @stack_push_pointer(%6877) : (i64) -> ()
      %6881 = llvm.mlir.addressof @str572 : !llvm.ptr
      %6882 = arith.constant 10 : i64
      %6883 = func.call @cc_make_string(%6881, %6882) : (!llvm.ptr, i64) -> i64
      %6884 = llvm.mlir.addressof @str573 : !llvm.ptr
      %6885 = arith.constant 11 : i64
      %6886 = func.call @cc_make_string(%6884, %6885) : (!llvm.ptr, i64) -> i64
      %6887 = func.call @cc_intern(%6883, %6886) : (i64, i64) -> i64
      %6888 = func.call @cc_nil_value() : () -> i64
      %6889 = func.call @cc_cons(%6887, %6888) : (i64, i64) -> i64
      %6890 = func.call @cc_values_pack(%6889) : (i64) -> i64
      func.call @stack_push_pointer(%6887) : (i64) -> ()
      %6891 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6891) : (i64) -> ()
      %6892 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%6892) : (i64) -> ()
      %6893 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%6893) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6894 = func.call @stack_pop_pointer() : () -> i64
      %6895 = func.call @stack_pop_pointer() : () -> i64
      %6896 = func.call @cc_cons(%6895, %6894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6896) : (i64) -> ()
      %6897 = func.call @stack_pop_pointer() : () -> i64
      %6898 = func.call @stack_pop_pointer() : () -> i64
      %6899 = func.call @cc_cons(%6898, %6897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6899) : (i64) -> ()
      %6900 = func.call @stack_pop_pointer() : () -> i64
      %6901 = func.call @stack_pop_pointer() : () -> i64
      %6902 = func.call @cc_cons(%6900, %6901) : (i64, i64) -> i64
      %6903 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6904 = arith.constant 5 : i64
      %6905 = func.call @cc_make_string(%6903, %6904) : (!llvm.ptr, i64) -> i64
      %6906 = func.call @cc_nil_value() : () -> i64
      %6907 = func.call @cc_intern(%6905, %6906) : (i64, i64) -> i64
      %6908 = func.call @cc_nil_value() : () -> i64
      %6909 = func.call @cc_cons(%6907, %6908) : (i64, i64) -> i64
      %6910 = func.call @cc_values_pack(%6909) : (i64) -> i64
      %6911 = func.call @cc_cons(%6907, %6902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6911) : (i64) -> ()
      %6912 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6913 = arith.constant 12 : i64
      %6914 = func.call @cc_make_string(%6912, %6913) : (!llvm.ptr, i64) -> i64
      %6915 = llvm.mlir.addressof @str576 : !llvm.ptr
      %6916 = arith.constant 7 : i64
      %6917 = func.call @cc_make_string(%6915, %6916) : (!llvm.ptr, i64) -> i64
      %6918 = func.call @cc_intern(%6914, %6917) : (i64, i64) -> i64
      %6919 = func.call @cc_nil_value() : () -> i64
      %6920 = func.call @cc_cons(%6918, %6919) : (i64, i64) -> i64
      %6921 = func.call @cc_values_pack(%6920) : (i64) -> i64
      func.call @stack_push_pointer(%6918) : (i64) -> ()
      %6922 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6922) : (i64) -> ()
      %6923 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6924 = arith.constant 9 : i64
      %6925 = func.call @cc_make_string(%6923, %6924) : (!llvm.ptr, i64) -> i64
      %6926 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6927 = arith.constant 11 : i64
      %6928 = func.call @cc_make_string(%6926, %6927) : (!llvm.ptr, i64) -> i64
      %6929 = func.call @cc_intern(%6925, %6928) : (i64, i64) -> i64
      %6930 = func.call @cc_nil_value() : () -> i64
      %6931 = func.call @cc_cons(%6929, %6930) : (i64, i64) -> i64
      %6932 = func.call @cc_values_pack(%6931) : (i64) -> i64
      func.call @stack_push_pointer(%6929) : (i64) -> ()
      %6933 = func.call @stack_pop_pointer() : () -> i64
      %6934 = func.call @stack_pop_pointer() : () -> i64
      %6935 = func.call @cc_cons(%6933, %6934) : (i64, i64) -> i64
      %6936 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6937 = arith.constant 5 : i64
      %6938 = func.call @cc_make_string(%6936, %6937) : (!llvm.ptr, i64) -> i64
      %6939 = func.call @cc_nil_value() : () -> i64
      %6940 = func.call @cc_intern(%6938, %6939) : (i64, i64) -> i64
      %6941 = func.call @cc_nil_value() : () -> i64
      %6942 = func.call @cc_cons(%6940, %6941) : (i64, i64) -> i64
      %6943 = func.call @cc_values_pack(%6942) : (i64) -> i64
      %6944 = func.call @cc_cons(%6940, %6935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6944) : (i64) -> ()
      %6945 = llvm.mlir.addressof @str580 : !llvm.ptr
      %6946 = arith.constant 16 : i64
      %6947 = func.call @cc_make_string(%6945, %6946) : (!llvm.ptr, i64) -> i64
      %6948 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6949 = arith.constant 7 : i64
      %6950 = func.call @cc_make_string(%6948, %6949) : (!llvm.ptr, i64) -> i64
      %6951 = func.call @cc_intern(%6947, %6950) : (i64, i64) -> i64
      %6952 = func.call @cc_nil_value() : () -> i64
      %6953 = func.call @cc_cons(%6951, %6952) : (i64, i64) -> i64
      %6954 = func.call @cc_values_pack(%6953) : (i64) -> i64
      func.call @stack_push_pointer(%6951) : (i64) -> ()
      %6955 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6955) : (i64) -> ()
      %6956 = arith.constant 97 : i64
      %6957 = func.call @cc_box_character(%6956) : (i64) -> i64
      func.call @stack_push_pointer(%6957) : (i64) -> ()
      %6958 = arith.constant 98 : i64
      %6959 = func.call @cc_box_character(%6958) : (i64) -> i64
      func.call @stack_push_pointer(%6959) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6960 = func.call @stack_pop_pointer() : () -> i64
      %6961 = func.call @stack_pop_pointer() : () -> i64
      %6962 = func.call @cc_cons(%6961, %6960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6962) : (i64) -> ()
      %6963 = func.call @stack_pop_pointer() : () -> i64
      %6964 = func.call @stack_pop_pointer() : () -> i64
      %6965 = func.call @cc_cons(%6964, %6963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6965) : (i64) -> ()
      %6966 = arith.constant 99 : i64
      %6967 = func.call @cc_box_character(%6966) : (i64) -> i64
      func.call @stack_push_pointer(%6967) : (i64) -> ()
      %6968 = arith.constant 100 : i64
      %6969 = func.call @cc_box_character(%6968) : (i64) -> i64
      func.call @stack_push_pointer(%6969) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6970 = func.call @stack_pop_pointer() : () -> i64
      %6971 = func.call @stack_pop_pointer() : () -> i64
      %6972 = func.call @cc_cons(%6971, %6970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6972) : (i64) -> ()
      %6973 = func.call @stack_pop_pointer() : () -> i64
      %6974 = func.call @stack_pop_pointer() : () -> i64
      %6975 = func.call @cc_cons(%6974, %6973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6975) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6976 = func.call @stack_pop_pointer() : () -> i64
      %6977 = func.call @stack_pop_pointer() : () -> i64
      %6978 = func.call @cc_cons(%6977, %6976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6978) : (i64) -> ()
      %6979 = func.call @stack_pop_pointer() : () -> i64
      %6980 = func.call @stack_pop_pointer() : () -> i64
      %6981 = func.call @cc_cons(%6980, %6979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6981) : (i64) -> ()
      %6982 = func.call @stack_pop_pointer() : () -> i64
      %6983 = func.call @stack_pop_pointer() : () -> i64
      %6984 = func.call @cc_cons(%6982, %6983) : (i64, i64) -> i64
      %6985 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6986 = arith.constant 5 : i64
      %6987 = func.call @cc_make_string(%6985, %6986) : (!llvm.ptr, i64) -> i64
      %6988 = func.call @cc_nil_value() : () -> i64
      %6989 = func.call @cc_intern(%6987, %6988) : (i64, i64) -> i64
      %6990 = func.call @cc_nil_value() : () -> i64
      %6991 = func.call @cc_cons(%6989, %6990) : (i64, i64) -> i64
      %6992 = func.call @cc_values_pack(%6991) : (i64) -> i64
      %6993 = func.call @cc_cons(%6989, %6984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6993) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6994 = func.call @stack_pop_pointer() : () -> i64
      %6995 = func.call @stack_pop_pointer() : () -> i64
      %6996 = func.call @cc_cons(%6995, %6994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6996) : (i64) -> ()
      %6997 = func.call @stack_pop_pointer() : () -> i64
      %6998 = func.call @stack_pop_pointer() : () -> i64
      %6999 = func.call @cc_cons(%6998, %6997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6999) : (i64) -> ()
      %7000 = func.call @stack_pop_pointer() : () -> i64
      %7001 = func.call @stack_pop_pointer() : () -> i64
      %7002 = func.call @cc_cons(%7001, %7000) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7002) : (i64) -> ()
      %7003 = func.call @stack_pop_pointer() : () -> i64
      %7004 = func.call @stack_pop_pointer() : () -> i64
      %7005 = func.call @cc_cons(%7004, %7003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7005) : (i64) -> ()
      %7006 = func.call @stack_pop_pointer() : () -> i64
      %7007 = func.call @stack_pop_pointer() : () -> i64
      %7008 = func.call @cc_cons(%7007, %7006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7008) : (i64) -> ()
      %7009 = func.call @stack_pop_pointer() : () -> i64
      %7010 = func.call @stack_pop_pointer() : () -> i64
      %7011 = func.call @cc_cons(%7010, %7009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7011) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7012 = func.call @stack_pop_pointer() : () -> i64
      %7013 = func.call @stack_pop_pointer() : () -> i64
      %7014 = func.call @cc_cons(%7013, %7012) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7014) : (i64) -> ()
      %7015 = func.call @stack_pop_pointer() : () -> i64
      %7016 = func.call @stack_pop_pointer() : () -> i64
      %7017 = func.call @cc_cons(%7016, %7015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7017) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7018 = func.call @stack_pop_pointer() : () -> i64
      %7019 = func.call @stack_pop_pointer() : () -> i64
      %7020 = func.call @cc_cons(%7019, %7018) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7020) : (i64) -> ()
      %7021 = llvm.mlir.addressof @str583 : !llvm.ptr
      %7022 = arith.constant 5 : i64
      %7023 = func.call @cc_make_string(%7021, %7022) : (!llvm.ptr, i64) -> i64
      %7024 = llvm.mlir.addressof @str584 : !llvm.ptr
      %7025 = arith.constant 11 : i64
      %7026 = func.call @cc_make_string(%7024, %7025) : (!llvm.ptr, i64) -> i64
      %7027 = func.call @cc_intern(%7023, %7026) : (i64, i64) -> i64
      %7028 = func.call @cc_nil_value() : () -> i64
      %7029 = func.call @cc_cons(%7027, %7028) : (i64, i64) -> i64
      %7030 = func.call @cc_values_pack(%7029) : (i64) -> i64
      func.call @stack_push_pointer(%7027) : (i64) -> ()
      %7031 = llvm.mlir.addressof @str585 : !llvm.ptr
      %7032 = arith.constant 10 : i64
      %7033 = func.call @cc_make_string(%7031, %7032) : (!llvm.ptr, i64) -> i64
      %7034 = llvm.mlir.addressof @str586 : !llvm.ptr
      %7035 = arith.constant 11 : i64
      %7036 = func.call @cc_make_string(%7034, %7035) : (!llvm.ptr, i64) -> i64
      %7037 = func.call @cc_intern(%7033, %7036) : (i64, i64) -> i64
      %7038 = func.call @cc_nil_value() : () -> i64
      %7039 = func.call @cc_cons(%7037, %7038) : (i64, i64) -> i64
      %7040 = func.call @cc_values_pack(%7039) : (i64) -> i64
      func.call @stack_push_pointer(%7037) : (i64) -> ()
      %7041 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%7041) : (i64) -> ()
      %7042 = llvm.mlir.addressof @str587 : !llvm.ptr
      %7043 = arith.constant 12 : i64
      %7044 = func.call @cc_make_string(%7042, %7043) : (!llvm.ptr, i64) -> i64
      %7045 = llvm.mlir.addressof @str588 : !llvm.ptr
      %7046 = arith.constant 7 : i64
      %7047 = func.call @cc_make_string(%7045, %7046) : (!llvm.ptr, i64) -> i64
      %7048 = func.call @cc_intern(%7044, %7047) : (i64, i64) -> i64
      %7049 = func.call @cc_nil_value() : () -> i64
      %7050 = func.call @cc_cons(%7048, %7049) : (i64, i64) -> i64
      %7051 = func.call @cc_values_pack(%7050) : (i64) -> i64
      func.call @stack_push_pointer(%7048) : (i64) -> ()
      %7052 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7052) : (i64) -> ()
      %7053 = llvm.mlir.addressof @str589 : !llvm.ptr
      %7054 = arith.constant 9 : i64
      %7055 = func.call @cc_make_string(%7053, %7054) : (!llvm.ptr, i64) -> i64
      %7056 = llvm.mlir.addressof @str590 : !llvm.ptr
      %7057 = arith.constant 11 : i64
      %7058 = func.call @cc_make_string(%7056, %7057) : (!llvm.ptr, i64) -> i64
      %7059 = func.call @cc_intern(%7055, %7058) : (i64, i64) -> i64
      %7060 = func.call @cc_nil_value() : () -> i64
      %7061 = func.call @cc_cons(%7059, %7060) : (i64, i64) -> i64
      %7062 = func.call @cc_values_pack(%7061) : (i64) -> i64
      func.call @stack_push_pointer(%7059) : (i64) -> ()
      %7063 = func.call @stack_pop_pointer() : () -> i64
      %7064 = func.call @stack_pop_pointer() : () -> i64
      %7065 = func.call @cc_cons(%7063, %7064) : (i64, i64) -> i64
      %7066 = llvm.mlir.addressof @str591 : !llvm.ptr
      %7067 = arith.constant 5 : i64
      %7068 = func.call @cc_make_string(%7066, %7067) : (!llvm.ptr, i64) -> i64
      %7069 = func.call @cc_nil_value() : () -> i64
      %7070 = func.call @cc_intern(%7068, %7069) : (i64, i64) -> i64
      %7071 = func.call @cc_nil_value() : () -> i64
      %7072 = func.call @cc_cons(%7070, %7071) : (i64, i64) -> i64
      %7073 = func.call @cc_values_pack(%7072) : (i64) -> i64
      %7074 = func.call @cc_cons(%7070, %7065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7074) : (i64) -> ()
      %7075 = llvm.mlir.addressof @str592 : !llvm.ptr
      %7076 = arith.constant 12 : i64
      %7077 = func.call @cc_make_string(%7075, %7076) : (!llvm.ptr, i64) -> i64
      %7078 = llvm.mlir.addressof @str593 : !llvm.ptr
      %7079 = arith.constant 7 : i64
      %7080 = func.call @cc_make_string(%7078, %7079) : (!llvm.ptr, i64) -> i64
      %7081 = func.call @cc_intern(%7077, %7080) : (i64, i64) -> i64
      %7082 = func.call @cc_nil_value() : () -> i64
      %7083 = func.call @cc_cons(%7081, %7082) : (i64, i64) -> i64
      %7084 = func.call @cc_values_pack(%7083) : (i64) -> i64
      func.call @stack_push_pointer(%7081) : (i64) -> ()
      %7085 = llvm.mlir.addressof @str594 : !llvm.ptr
      %7086 = arith.constant 9 : i64
      %7087 = func.call @cc_make_string(%7085, %7086) : (!llvm.ptr, i64) -> i64
      %7088 = func.call @cc_nil_value() : () -> i64
      %7089 = func.call @cc_intern(%7087, %7088) : (i64, i64) -> i64
      %7090 = func.call @cc_nil_value() : () -> i64
      %7091 = func.call @cc_cons(%7089, %7090) : (i64, i64) -> i64
      %7092 = func.call @cc_values_pack(%7091) : (i64) -> i64
      func.call @stack_push_pointer(%7089) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7093 = func.call @stack_pop_pointer() : () -> i64
      %7094 = func.call @stack_pop_pointer() : () -> i64
      %7095 = func.call @cc_cons(%7094, %7093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7095) : (i64) -> ()
      %7096 = func.call @stack_pop_pointer() : () -> i64
      %7097 = func.call @stack_pop_pointer() : () -> i64
      %7098 = func.call @cc_cons(%7097, %7096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7098) : (i64) -> ()
      %7099 = func.call @stack_pop_pointer() : () -> i64
      %7100 = func.call @stack_pop_pointer() : () -> i64
      %7101 = func.call @cc_cons(%7100, %7099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7101) : (i64) -> ()
      %7102 = func.call @stack_pop_pointer() : () -> i64
      %7103 = func.call @stack_pop_pointer() : () -> i64
      %7104 = func.call @cc_cons(%7103, %7102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7104) : (i64) -> ()
      %7105 = func.call @stack_pop_pointer() : () -> i64
      %7106 = func.call @stack_pop_pointer() : () -> i64
      %7107 = func.call @cc_cons(%7106, %7105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7107) : (i64) -> ()
      %7108 = func.call @stack_pop_pointer() : () -> i64
      %7109 = func.call @stack_pop_pointer() : () -> i64
      %7110 = func.call @cc_cons(%7109, %7108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7110) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7111 = func.call @stack_pop_pointer() : () -> i64
      %7112 = func.call @stack_pop_pointer() : () -> i64
      %7113 = func.call @cc_cons(%7112, %7111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7113) : (i64) -> ()
      %7114 = func.call @stack_pop_pointer() : () -> i64
      %7115 = func.call @stack_pop_pointer() : () -> i64
      %7116 = func.call @cc_cons(%7115, %7114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7117 = func.call @stack_pop_pointer() : () -> i64
      %7118 = func.call @stack_pop_pointer() : () -> i64
      %7119 = func.call @cc_cons(%7118, %7117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7119) : (i64) -> ()
      %7120 = func.call @stack_pop_pointer() : () -> i64
      %7121 = func.call @stack_pop_pointer() : () -> i64
      %7122 = func.call @cc_cons(%7121, %7120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7122) : (i64) -> ()
      %7123 = func.call @stack_pop_pointer() : () -> i64
      %7124 = func.call @stack_pop_pointer() : () -> i64
      %7125 = func.call @cc_cons(%7124, %7123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7126 = func.call @stack_pop_pointer() : () -> i64
      %7127 = func.call @stack_pop_pointer() : () -> i64
      %7128 = func.call @cc_cons(%7127, %7126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7128) : (i64) -> ()
      %7129 = func.call @stack_pop_pointer() : () -> i64
      %7130 = func.call @stack_pop_pointer() : () -> i64
      %7131 = func.call @cc_cons(%7130, %7129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7132 = func.call @stack_pop_pointer() : () -> i64
      %7133 = func.call @stack_pop_pointer() : () -> i64
      %7134 = func.call @cc_cons(%7133, %7132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7134) : (i64) -> ()
      %7135 = func.call @stack_pop_pointer() : () -> i64
      %7136 = func.call @stack_pop_pointer() : () -> i64
      %7137 = func.call @cc_cons(%7136, %7135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7137) : (i64) -> ()
      %7138 = func.call @stack_pop_pointer() : () -> i64
      %7335 = arith.constant 15079495958551 : i64
      %7336 = arith.constant 0 : i64
      %7337 = func.call @cc_make_closure(%7335, %7336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7337) : (i64) -> ()
      %7338 = func.call @stack_pop_pointer() : () -> i64
      %7339 = llvm.mlir.addressof @str609 : !llvm.ptr
      %7340 = arith.constant 1 : i64
      %7341 = func.call @cc_make_string(%7339, %7340) : (!llvm.ptr, i64) -> i64
      %7342 = func.call @cc_nil_value() : () -> i64
      %7343 = func.call @cc_intern(%7341, %7342) : (i64, i64) -> i64
      %7344 = func.call @cc_nil_value() : () -> i64
      %7345 = func.call @cc_cons(%7343, %7344) : (i64, i64) -> i64
      %7346 = func.call @cc_values_pack(%7345) : (i64) -> i64
      func.call @stack_push_pointer(%7343) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7347 = func.call @stack_pop_pointer() : () -> i64
      %7348 = func.call @stack_pop_pointer() : () -> i64
      %7349 = func.call @cc_cons(%7348, %7347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7349) : (i64) -> ()
      %7350 = func.call @stack_pop_pointer() : () -> i64
      %7351 = llvm.mlir.addressof @str610 : !llvm.ptr
      %7352 = arith.constant 11 : i64
      %7353 = func.call @cc_make_string(%7351, %7352) : (!llvm.ptr, i64) -> i64
      %7354 = llvm.mlir.addressof @str611 : !llvm.ptr
      %7355 = arith.constant 7 : i64
      %7356 = func.call @cc_make_string(%7354, %7355) : (!llvm.ptr, i64) -> i64
      %7357 = func.call @cc_intern(%7353, %7356) : (i64, i64) -> i64
      %7358 = func.call @cc_nil_value() : () -> i64
      %7359 = func.call @cc_cons(%7357, %7358) : (i64, i64) -> i64
      %7360 = func.call @cc_values_pack(%7359) : (i64) -> i64
      func.call @stack_push_pointer(%7357) : (i64) -> ()
      %7361 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7362 = func.call @stack_pop_pointer() : () -> i64
      %7363 = llvm.mlir.addressof @str612 : !llvm.ptr
      %7364 = arith.constant 4 : i64
      %7365 = func.call @cc_make_string(%7363, %7364) : (!llvm.ptr, i64) -> i64
      %7366 = llvm.mlir.addressof @str613 : !llvm.ptr
      %7367 = arith.constant 7 : i64
      %7368 = func.call @cc_make_string(%7366, %7367) : (!llvm.ptr, i64) -> i64
      %7369 = func.call @cc_intern(%7365, %7368) : (i64, i64) -> i64
      %7370 = func.call @cc_nil_value() : () -> i64
      %7371 = func.call @cc_cons(%7369, %7370) : (i64, i64) -> i64
      %7372 = func.call @cc_values_pack(%7371) : (i64) -> i64
      func.call @stack_push_pointer(%7369) : (i64) -> ()
      %7373 = func.call @stack_pop_pointer() : () -> i64
      %7374 = llvm.mlir.addressof @str614 : !llvm.ptr
      %7375 = arith.constant 6 : i64
      %7376 = func.call @cc_make_string(%7374, %7375) : (!llvm.ptr, i64) -> i64
      %7377 = func.call @cc_nil_value() : () -> i64
      %7378 = func.call @cc_intern(%7376, %7377) : (i64, i64) -> i64
      %7379 = func.call @cc_nil_value() : () -> i64
      %7380 = func.call @cc_cons(%7378, %7379) : (i64, i64) -> i64
      %7381 = func.call @cc_values_pack(%7380) : (i64) -> i64
      func.call @stack_push_pointer(%7378) : (i64) -> ()
      %7382 = func.call @stack_pop_pointer() : () -> i64
      %7383 = func.call @cc_nil_value() : () -> i64
      %7384 = func.call @cc_errorp(%6848) : (i64) -> i64
      %7385 = arith.cmpi ne, %7384, %7383 : i64
      %7386 = arith.cmpi eq, %7383, %7383 : i64
      %7387 = arith.andi %7385, %7386 : i1
      %7388 = scf.if %7387 -> (i64) {
        scf.yield %6848 : i64
      } else {
        scf.yield %7383 : i64
      }
      %7389 = func.call @cc_errorp(%7138) : (i64) -> i64
      %7390 = arith.cmpi ne, %7389, %7383 : i64
      %7391 = arith.cmpi eq, %7388, %7383 : i64
      %7392 = arith.andi %7390, %7391 : i1
      %7393 = scf.if %7392 -> (i64) {
        scf.yield %7138 : i64
      } else {
        scf.yield %7388 : i64
      }
      %7394 = func.call @cc_errorp(%7338) : (i64) -> i64
      %7395 = arith.cmpi ne, %7394, %7383 : i64
      %7396 = arith.cmpi eq, %7393, %7383 : i64
      %7397 = arith.andi %7395, %7396 : i1
      %7398 = scf.if %7397 -> (i64) {
        scf.yield %7338 : i64
      } else {
        scf.yield %7393 : i64
      }
      %7399 = func.call @cc_errorp(%7350) : (i64) -> i64
      %7400 = arith.cmpi ne, %7399, %7383 : i64
      %7401 = arith.cmpi eq, %7398, %7383 : i64
      %7402 = arith.andi %7400, %7401 : i1
      %7403 = scf.if %7402 -> (i64) {
        scf.yield %7350 : i64
      } else {
        scf.yield %7398 : i64
      }
      %7404 = func.call @cc_errorp(%7361) : (i64) -> i64
      %7405 = arith.cmpi ne, %7404, %7383 : i64
      %7406 = arith.cmpi eq, %7403, %7383 : i64
      %7407 = arith.andi %7405, %7406 : i1
      %7408 = scf.if %7407 -> (i64) {
        scf.yield %7361 : i64
      } else {
        scf.yield %7403 : i64
      }
      %7409 = func.call @cc_errorp(%7362) : (i64) -> i64
      %7410 = arith.cmpi ne, %7409, %7383 : i64
      %7411 = arith.cmpi eq, %7408, %7383 : i64
      %7412 = arith.andi %7410, %7411 : i1
      %7413 = scf.if %7412 -> (i64) {
        scf.yield %7362 : i64
      } else {
        scf.yield %7408 : i64
      }
      %7414 = func.call @cc_errorp(%7373) : (i64) -> i64
      %7415 = arith.cmpi ne, %7414, %7383 : i64
      %7416 = arith.cmpi eq, %7413, %7383 : i64
      %7417 = arith.andi %7415, %7416 : i1
      %7418 = scf.if %7417 -> (i64) {
        scf.yield %7373 : i64
      } else {
        scf.yield %7413 : i64
      }
      %7419 = func.call @cc_errorp(%7382) : (i64) -> i64
      %7420 = arith.cmpi ne, %7419, %7383 : i64
      %7421 = arith.cmpi eq, %7418, %7383 : i64
      %7422 = arith.andi %7420, %7421 : i1
      %7423 = scf.if %7422 -> (i64) {
        scf.yield %7382 : i64
      } else {
        scf.yield %7418 : i64
      }
      %7424 = arith.cmpi ne, %7423, %7383 : i64
      scf.if %7424 {
        func.call @stack_push_pointer(%7423) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6848) : (i64) -> ()
        func.call @stack_push_pointer(%7138) : (i64) -> ()
        func.call @stack_push_pointer(%7338) : (i64) -> ()
        func.call @stack_push_pointer(%7350) : (i64) -> ()
        func.call @stack_push_pointer(%7361) : (i64) -> ()
        func.call @stack_push_pointer(%7362) : (i64) -> ()
        func.call @stack_push_pointer(%7373) : (i64) -> ()
        func.call @stack_push_pointer(%7382) : (i64) -> ()
        %7425 = llvm.mlir.addressof @str615 : !llvm.ptr
        %7426 = func.call @cc_make_function_ref_const(%7425) : (!llvm.ptr) -> i64
        %7427 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7426, %7427) : (i64, i64) -> ()
      }
      %7428 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7428 : i64
    }
    %7429 = func.call @cc_nil_value() : () -> i64
    %7430 = func.call @cc_errorp(%6839) : (i64) -> i64
    %7431 = arith.cmpi ne, %7430, %7429 : i64
    %7432 = scf.if %7431 -> (i64) {
      scf.yield %6839 : i64
    } else {
      %7433 = llvm.mlir.addressof @str616 : !llvm.ptr
      %7434 = arith.constant 13 : i64
      %7435 = func.call @cc_make_string(%7433, %7434) : (!llvm.ptr, i64) -> i64
      %7436 = func.call @cc_nil_value() : () -> i64
      %7437 = func.call @cc_intern(%7435, %7436) : (i64, i64) -> i64
      %7438 = func.call @cc_nil_value() : () -> i64
      %7439 = func.call @cc_cons(%7437, %7438) : (i64, i64) -> i64
      %7440 = func.call @cc_values_pack(%7439) : (i64) -> i64
      func.call @stack_push_pointer(%7437) : (i64) -> ()
      %7441 = func.call @stack_pop_pointer() : () -> i64
      %7442 = llvm.mlir.addressof @str617 : !llvm.ptr
      %7443 = arith.constant 13 : i64
      %7444 = func.call @cc_make_string(%7442, %7443) : (!llvm.ptr, i64) -> i64
      %7445 = llvm.mlir.addressof @str618 : !llvm.ptr
      %7446 = arith.constant 11 : i64
      %7447 = func.call @cc_make_string(%7445, %7446) : (!llvm.ptr, i64) -> i64
      %7448 = func.call @cc_intern(%7444, %7447) : (i64, i64) -> i64
      %7449 = func.call @cc_nil_value() : () -> i64
      %7450 = func.call @cc_cons(%7448, %7449) : (i64, i64) -> i64
      %7451 = func.call @cc_values_pack(%7450) : (i64) -> i64
      func.call @stack_push_pointer(%7448) : (i64) -> ()
      %7452 = llvm.mlir.addressof @str619 : !llvm.ptr
      %7453 = arith.constant 6 : i64
      %7454 = func.call @cc_make_string(%7452, %7453) : (!llvm.ptr, i64) -> i64
      %7455 = func.call @cc_nil_value() : () -> i64
      %7456 = func.call @cc_intern(%7454, %7455) : (i64, i64) -> i64
      %7457 = func.call @cc_nil_value() : () -> i64
      %7458 = func.call @cc_cons(%7456, %7457) : (i64, i64) -> i64
      %7459 = func.call @cc_values_pack(%7458) : (i64) -> i64
      func.call @stack_push_pointer(%7456) : (i64) -> ()
      %7460 = llvm.mlir.addressof @str620 : !llvm.ptr
      %7461 = arith.constant 19 : i64
      %7462 = func.call @cc_make_string(%7460, %7461) : (!llvm.ptr, i64) -> i64
      %7463 = func.call @cc_nil_value() : () -> i64
      %7464 = func.call @cc_intern(%7462, %7463) : (i64, i64) -> i64
      %7465 = func.call @cc_nil_value() : () -> i64
      %7466 = func.call @cc_cons(%7464, %7465) : (i64, i64) -> i64
      %7467 = func.call @cc_values_pack(%7466) : (i64) -> i64
      func.call @stack_push_pointer(%7464) : (i64) -> ()
      %7468 = llvm.mlir.addressof @str621 : !llvm.ptr
      %7469 = arith.constant 10 : i64
      %7470 = func.call @cc_make_string(%7468, %7469) : (!llvm.ptr, i64) -> i64
      %7471 = llvm.mlir.addressof @str622 : !llvm.ptr
      %7472 = arith.constant 11 : i64
      %7473 = func.call @cc_make_string(%7471, %7472) : (!llvm.ptr, i64) -> i64
      %7474 = func.call @cc_intern(%7470, %7473) : (i64, i64) -> i64
      %7475 = func.call @cc_nil_value() : () -> i64
      %7476 = func.call @cc_cons(%7474, %7475) : (i64, i64) -> i64
      %7477 = func.call @cc_values_pack(%7476) : (i64) -> i64
      func.call @stack_push_pointer(%7474) : (i64) -> ()
      %7478 = llvm.mlir.addressof @str623 : !llvm.ptr
      %7479 = arith.constant 2 : i64
      %7480 = func.call @cc_make_string(%7478, %7479) : (!llvm.ptr, i64) -> i64
      %7481 = llvm.mlir.addressof @str624 : !llvm.ptr
      %7482 = arith.constant 11 : i64
      %7483 = func.call @cc_make_string(%7481, %7482) : (!llvm.ptr, i64) -> i64
      %7484 = func.call @cc_intern(%7480, %7483) : (i64, i64) -> i64
      %7485 = func.call @cc_nil_value() : () -> i64
      %7486 = func.call @cc_cons(%7484, %7485) : (i64, i64) -> i64
      %7487 = func.call @cc_values_pack(%7486) : (i64) -> i64
      func.call @stack_push_pointer(%7484) : (i64) -> ()
      %7488 = llvm.mlir.addressof @str625 : !llvm.ptr
      %7489 = arith.constant 22 : i64
      %7490 = func.call @cc_make_string(%7488, %7489) : (!llvm.ptr, i64) -> i64
      %7491 = llvm.mlir.addressof @str626 : !llvm.ptr
      %7492 = arith.constant 11 : i64
      %7493 = func.call @cc_make_string(%7491, %7492) : (!llvm.ptr, i64) -> i64
      %7494 = func.call @cc_intern(%7490, %7493) : (i64, i64) -> i64
      %7495 = func.call @cc_nil_value() : () -> i64
      %7496 = func.call @cc_cons(%7494, %7495) : (i64, i64) -> i64
      %7497 = func.call @cc_values_pack(%7496) : (i64) -> i64
      func.call @stack_push_pointer(%7494) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7498 = func.call @stack_pop_pointer() : () -> i64
      %7499 = func.call @stack_pop_pointer() : () -> i64
      %7500 = func.call @cc_cons(%7499, %7498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7500) : (i64) -> ()
      %7501 = func.call @stack_pop_pointer() : () -> i64
      %7502 = func.call @stack_pop_pointer() : () -> i64
      %7503 = func.call @cc_cons(%7502, %7501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7503) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7504 = func.call @stack_pop_pointer() : () -> i64
      %7505 = func.call @stack_pop_pointer() : () -> i64
      %7506 = func.call @cc_cons(%7505, %7504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7506) : (i64) -> ()
      %7507 = func.call @stack_pop_pointer() : () -> i64
      %7508 = func.call @stack_pop_pointer() : () -> i64
      %7509 = func.call @cc_cons(%7508, %7507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7509) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7510 = func.call @stack_pop_pointer() : () -> i64
      %7511 = func.call @stack_pop_pointer() : () -> i64
      %7512 = func.call @cc_cons(%7511, %7510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7512) : (i64) -> ()
      %7513 = func.call @stack_pop_pointer() : () -> i64
      %7514 = func.call @stack_pop_pointer() : () -> i64
      %7515 = func.call @cc_cons(%7514, %7513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7516 = func.call @stack_pop_pointer() : () -> i64
      %7517 = func.call @stack_pop_pointer() : () -> i64
      %7518 = func.call @cc_cons(%7517, %7516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7518) : (i64) -> ()
      %7519 = func.call @stack_pop_pointer() : () -> i64
      %7520 = func.call @stack_pop_pointer() : () -> i64
      %7521 = func.call @cc_cons(%7520, %7519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7521) : (i64) -> ()
      %7522 = func.call @stack_pop_pointer() : () -> i64
      %7523 = func.call @stack_pop_pointer() : () -> i64
      %7524 = func.call @cc_cons(%7523, %7522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7525 = func.call @stack_pop_pointer() : () -> i64
      %7526 = func.call @stack_pop_pointer() : () -> i64
      %7527 = func.call @cc_cons(%7526, %7525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7527) : (i64) -> ()
      %7528 = func.call @stack_pop_pointer() : () -> i64
      %7529 = func.call @stack_pop_pointer() : () -> i64
      %7530 = func.call @cc_cons(%7529, %7528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7530) : (i64) -> ()
      %7531 = func.call @stack_pop_pointer() : () -> i64
      %7616 = arith.constant 15079495958552 : i64
      %7617 = arith.constant 0 : i64
      %7618 = func.call @cc_make_closure(%7616, %7617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7618) : (i64) -> ()
      %7619 = func.call @stack_pop_pointer() : () -> i64
      %7620 = llvm.mlir.addressof @str628 : !llvm.ptr
      %7621 = arith.constant 4 : i64
      %7622 = func.call @cc_make_string(%7620, %7621) : (!llvm.ptr, i64) -> i64
      %7623 = func.call @cc_nil_value() : () -> i64
      %7624 = func.call @cc_intern(%7622, %7623) : (i64, i64) -> i64
      %7625 = func.call @cc_nil_value() : () -> i64
      %7626 = func.call @cc_cons(%7624, %7625) : (i64, i64) -> i64
      %7627 = func.call @cc_values_pack(%7626) : (i64) -> i64
      func.call @stack_push_pointer(%7624) : (i64) -> ()
      %7628 = llvm.mlir.addressof @str629 : !llvm.ptr
      %7629 = arith.constant 10 : i64
      %7630 = func.call @cc_make_string(%7628, %7629) : (!llvm.ptr, i64) -> i64
      %7631 = llvm.mlir.addressof @str630 : !llvm.ptr
      %7632 = arith.constant 11 : i64
      %7633 = func.call @cc_make_string(%7631, %7632) : (!llvm.ptr, i64) -> i64
      %7634 = func.call @cc_intern(%7630, %7633) : (i64, i64) -> i64
      %7635 = func.call @cc_nil_value() : () -> i64
      %7636 = func.call @cc_cons(%7634, %7635) : (i64, i64) -> i64
      %7637 = func.call @cc_values_pack(%7636) : (i64) -> i64
      func.call @stack_push_pointer(%7634) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7638 = func.call @stack_pop_pointer() : () -> i64
      %7639 = func.call @stack_pop_pointer() : () -> i64
      %7640 = func.call @cc_cons(%7639, %7638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7640) : (i64) -> ()
      %7641 = func.call @stack_pop_pointer() : () -> i64
      %7642 = func.call @stack_pop_pointer() : () -> i64
      %7643 = func.call @cc_cons(%7642, %7641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7643) : (i64) -> ()
      %7644 = func.call @stack_pop_pointer() : () -> i64
      %7645 = llvm.mlir.addressof @str631 : !llvm.ptr
      %7646 = arith.constant 11 : i64
      %7647 = func.call @cc_make_string(%7645, %7646) : (!llvm.ptr, i64) -> i64
      %7648 = llvm.mlir.addressof @str632 : !llvm.ptr
      %7649 = arith.constant 7 : i64
      %7650 = func.call @cc_make_string(%7648, %7649) : (!llvm.ptr, i64) -> i64
      %7651 = func.call @cc_intern(%7647, %7650) : (i64, i64) -> i64
      %7652 = func.call @cc_nil_value() : () -> i64
      %7653 = func.call @cc_cons(%7651, %7652) : (i64, i64) -> i64
      %7654 = func.call @cc_values_pack(%7653) : (i64) -> i64
      func.call @stack_push_pointer(%7651) : (i64) -> ()
      %7655 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7656 = func.call @stack_pop_pointer() : () -> i64
      %7657 = llvm.mlir.addressof @str633 : !llvm.ptr
      %7658 = arith.constant 4 : i64
      %7659 = func.call @cc_make_string(%7657, %7658) : (!llvm.ptr, i64) -> i64
      %7660 = llvm.mlir.addressof @str634 : !llvm.ptr
      %7661 = arith.constant 7 : i64
      %7662 = func.call @cc_make_string(%7660, %7661) : (!llvm.ptr, i64) -> i64
      %7663 = func.call @cc_intern(%7659, %7662) : (i64, i64) -> i64
      %7664 = func.call @cc_nil_value() : () -> i64
      %7665 = func.call @cc_cons(%7663, %7664) : (i64, i64) -> i64
      %7666 = func.call @cc_values_pack(%7665) : (i64) -> i64
      func.call @stack_push_pointer(%7663) : (i64) -> ()
      %7667 = func.call @stack_pop_pointer() : () -> i64
      %7668 = llvm.mlir.addressof @str635 : !llvm.ptr
      %7669 = arith.constant 5 : i64
      %7670 = func.call @cc_make_string(%7668, %7669) : (!llvm.ptr, i64) -> i64
      %7671 = func.call @cc_nil_value() : () -> i64
      %7672 = func.call @cc_intern(%7670, %7671) : (i64, i64) -> i64
      %7673 = func.call @cc_nil_value() : () -> i64
      %7674 = func.call @cc_cons(%7672, %7673) : (i64, i64) -> i64
      %7675 = func.call @cc_values_pack(%7674) : (i64) -> i64
      func.call @stack_push_pointer(%7672) : (i64) -> ()
      %7676 = func.call @stack_pop_pointer() : () -> i64
      %7677 = func.call @cc_nil_value() : () -> i64
      %7678 = func.call @cc_errorp(%7441) : (i64) -> i64
      %7679 = arith.cmpi ne, %7678, %7677 : i64
      %7680 = arith.cmpi eq, %7677, %7677 : i64
      %7681 = arith.andi %7679, %7680 : i1
      %7682 = scf.if %7681 -> (i64) {
        scf.yield %7441 : i64
      } else {
        scf.yield %7677 : i64
      }
      %7683 = func.call @cc_errorp(%7531) : (i64) -> i64
      %7684 = arith.cmpi ne, %7683, %7677 : i64
      %7685 = arith.cmpi eq, %7682, %7677 : i64
      %7686 = arith.andi %7684, %7685 : i1
      %7687 = scf.if %7686 -> (i64) {
        scf.yield %7531 : i64
      } else {
        scf.yield %7682 : i64
      }
      %7688 = func.call @cc_errorp(%7619) : (i64) -> i64
      %7689 = arith.cmpi ne, %7688, %7677 : i64
      %7690 = arith.cmpi eq, %7687, %7677 : i64
      %7691 = arith.andi %7689, %7690 : i1
      %7692 = scf.if %7691 -> (i64) {
        scf.yield %7619 : i64
      } else {
        scf.yield %7687 : i64
      }
      %7693 = func.call @cc_errorp(%7644) : (i64) -> i64
      %7694 = arith.cmpi ne, %7693, %7677 : i64
      %7695 = arith.cmpi eq, %7692, %7677 : i64
      %7696 = arith.andi %7694, %7695 : i1
      %7697 = scf.if %7696 -> (i64) {
        scf.yield %7644 : i64
      } else {
        scf.yield %7692 : i64
      }
      %7698 = func.call @cc_errorp(%7655) : (i64) -> i64
      %7699 = arith.cmpi ne, %7698, %7677 : i64
      %7700 = arith.cmpi eq, %7697, %7677 : i64
      %7701 = arith.andi %7699, %7700 : i1
      %7702 = scf.if %7701 -> (i64) {
        scf.yield %7655 : i64
      } else {
        scf.yield %7697 : i64
      }
      %7703 = func.call @cc_errorp(%7656) : (i64) -> i64
      %7704 = arith.cmpi ne, %7703, %7677 : i64
      %7705 = arith.cmpi eq, %7702, %7677 : i64
      %7706 = arith.andi %7704, %7705 : i1
      %7707 = scf.if %7706 -> (i64) {
        scf.yield %7656 : i64
      } else {
        scf.yield %7702 : i64
      }
      %7708 = func.call @cc_errorp(%7667) : (i64) -> i64
      %7709 = arith.cmpi ne, %7708, %7677 : i64
      %7710 = arith.cmpi eq, %7707, %7677 : i64
      %7711 = arith.andi %7709, %7710 : i1
      %7712 = scf.if %7711 -> (i64) {
        scf.yield %7667 : i64
      } else {
        scf.yield %7707 : i64
      }
      %7713 = func.call @cc_errorp(%7676) : (i64) -> i64
      %7714 = arith.cmpi ne, %7713, %7677 : i64
      %7715 = arith.cmpi eq, %7712, %7677 : i64
      %7716 = arith.andi %7714, %7715 : i1
      %7717 = scf.if %7716 -> (i64) {
        scf.yield %7676 : i64
      } else {
        scf.yield %7712 : i64
      }
      %7718 = arith.cmpi ne, %7717, %7677 : i64
      scf.if %7718 {
        func.call @stack_push_pointer(%7717) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7441) : (i64) -> ()
        func.call @stack_push_pointer(%7531) : (i64) -> ()
        func.call @stack_push_pointer(%7619) : (i64) -> ()
        func.call @stack_push_pointer(%7644) : (i64) -> ()
        func.call @stack_push_pointer(%7655) : (i64) -> ()
        func.call @stack_push_pointer(%7656) : (i64) -> ()
        func.call @stack_push_pointer(%7667) : (i64) -> ()
        func.call @stack_push_pointer(%7676) : (i64) -> ()
        %7719 = llvm.mlir.addressof @str636 : !llvm.ptr
        %7720 = func.call @cc_make_function_ref_const(%7719) : (!llvm.ptr) -> i64
        %7721 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7720, %7721) : (i64, i64) -> ()
      }
      %7722 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7722 : i64
    }
    %7723 = func.call @cc_nil_value() : () -> i64
    %7724 = func.call @cc_errorp(%7432) : (i64) -> i64
    %7725 = arith.cmpi ne, %7724, %7723 : i64
    %7726 = scf.if %7725 -> (i64) {
      scf.yield %7432 : i64
    } else {
      %7727 = llvm.mlir.addressof @str637 : !llvm.ptr
      %7728 = arith.constant 18 : i64
      %7729 = func.call @cc_make_string(%7727, %7728) : (!llvm.ptr, i64) -> i64
      %7730 = func.call @cc_nil_value() : () -> i64
      %7731 = func.call @cc_intern(%7729, %7730) : (i64, i64) -> i64
      %7732 = func.call @cc_nil_value() : () -> i64
      %7733 = func.call @cc_cons(%7731, %7732) : (i64, i64) -> i64
      %7734 = func.call @cc_values_pack(%7733) : (i64) -> i64
      func.call @stack_push_pointer(%7731) : (i64) -> ()
      %7735 = func.call @stack_pop_pointer() : () -> i64
      %7736 = llvm.mlir.addressof @str638 : !llvm.ptr
      %7737 = arith.constant 13 : i64
      %7738 = func.call @cc_make_string(%7736, %7737) : (!llvm.ptr, i64) -> i64
      %7739 = llvm.mlir.addressof @str639 : !llvm.ptr
      %7740 = arith.constant 11 : i64
      %7741 = func.call @cc_make_string(%7739, %7740) : (!llvm.ptr, i64) -> i64
      %7742 = func.call @cc_intern(%7738, %7741) : (i64, i64) -> i64
      %7743 = func.call @cc_nil_value() : () -> i64
      %7744 = func.call @cc_cons(%7742, %7743) : (i64, i64) -> i64
      %7745 = func.call @cc_values_pack(%7744) : (i64) -> i64
      func.call @stack_push_pointer(%7742) : (i64) -> ()
      %7746 = llvm.mlir.addressof @str640 : !llvm.ptr
      %7747 = arith.constant 6 : i64
      %7748 = func.call @cc_make_string(%7746, %7747) : (!llvm.ptr, i64) -> i64
      %7749 = func.call @cc_nil_value() : () -> i64
      %7750 = func.call @cc_intern(%7748, %7749) : (i64, i64) -> i64
      %7751 = func.call @cc_nil_value() : () -> i64
      %7752 = func.call @cc_cons(%7750, %7751) : (i64, i64) -> i64
      %7753 = func.call @cc_values_pack(%7752) : (i64) -> i64
      func.call @stack_push_pointer(%7750) : (i64) -> ()
      %7754 = llvm.mlir.addressof @str641 : !llvm.ptr
      %7755 = arith.constant 19 : i64
      %7756 = func.call @cc_make_string(%7754, %7755) : (!llvm.ptr, i64) -> i64
      %7757 = func.call @cc_nil_value() : () -> i64
      %7758 = func.call @cc_intern(%7756, %7757) : (i64, i64) -> i64
      %7759 = func.call @cc_nil_value() : () -> i64
      %7760 = func.call @cc_cons(%7758, %7759) : (i64, i64) -> i64
      %7761 = func.call @cc_values_pack(%7760) : (i64) -> i64
      func.call @stack_push_pointer(%7758) : (i64) -> ()
      %7762 = llvm.mlir.addressof @str642 : !llvm.ptr
      %7763 = arith.constant 10 : i64
      %7764 = func.call @cc_make_string(%7762, %7763) : (!llvm.ptr, i64) -> i64
      %7765 = llvm.mlir.addressof @str643 : !llvm.ptr
      %7766 = arith.constant 11 : i64
      %7767 = func.call @cc_make_string(%7765, %7766) : (!llvm.ptr, i64) -> i64
      %7768 = func.call @cc_intern(%7764, %7767) : (i64, i64) -> i64
      %7769 = func.call @cc_nil_value() : () -> i64
      %7770 = func.call @cc_cons(%7768, %7769) : (i64, i64) -> i64
      %7771 = func.call @cc_values_pack(%7770) : (i64) -> i64
      func.call @stack_push_pointer(%7768) : (i64) -> ()
      %7772 = llvm.mlir.addressof @str644 : !llvm.ptr
      %7773 = arith.constant 4 : i64
      %7774 = func.call @cc_make_string(%7772, %7773) : (!llvm.ptr, i64) -> i64
      %7775 = llvm.mlir.addressof @str645 : !llvm.ptr
      %7776 = arith.constant 11 : i64
      %7777 = func.call @cc_make_string(%7775, %7776) : (!llvm.ptr, i64) -> i64
      %7778 = func.call @cc_intern(%7774, %7777) : (i64, i64) -> i64
      %7779 = func.call @cc_nil_value() : () -> i64
      %7780 = func.call @cc_cons(%7778, %7779) : (i64, i64) -> i64
      %7781 = func.call @cc_values_pack(%7780) : (i64) -> i64
      func.call @stack_push_pointer(%7778) : (i64) -> ()
      %7782 = llvm.mlir.addressof @str646 : !llvm.ptr
      %7783 = arith.constant 2 : i64
      %7784 = func.call @cc_make_string(%7782, %7783) : (!llvm.ptr, i64) -> i64
      %7785 = llvm.mlir.addressof @str647 : !llvm.ptr
      %7786 = arith.constant 11 : i64
      %7787 = func.call @cc_make_string(%7785, %7786) : (!llvm.ptr, i64) -> i64
      %7788 = func.call @cc_intern(%7784, %7787) : (i64, i64) -> i64
      %7789 = func.call @cc_nil_value() : () -> i64
      %7790 = func.call @cc_cons(%7788, %7789) : (i64, i64) -> i64
      %7791 = func.call @cc_values_pack(%7790) : (i64) -> i64
      func.call @stack_push_pointer(%7788) : (i64) -> ()
      %7792 = llvm.mlir.addressof @str648 : !llvm.ptr
      %7793 = arith.constant 22 : i64
      %7794 = func.call @cc_make_string(%7792, %7793) : (!llvm.ptr, i64) -> i64
      %7795 = llvm.mlir.addressof @str649 : !llvm.ptr
      %7796 = arith.constant 11 : i64
      %7797 = func.call @cc_make_string(%7795, %7796) : (!llvm.ptr, i64) -> i64
      %7798 = func.call @cc_intern(%7794, %7797) : (i64, i64) -> i64
      %7799 = func.call @cc_nil_value() : () -> i64
      %7800 = func.call @cc_cons(%7798, %7799) : (i64, i64) -> i64
      %7801 = func.call @cc_values_pack(%7800) : (i64) -> i64
      func.call @stack_push_pointer(%7798) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7802 = func.call @stack_pop_pointer() : () -> i64
      %7803 = func.call @stack_pop_pointer() : () -> i64
      %7804 = func.call @cc_cons(%7803, %7802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7804) : (i64) -> ()
      %7805 = func.call @stack_pop_pointer() : () -> i64
      %7806 = func.call @stack_pop_pointer() : () -> i64
      %7807 = func.call @cc_cons(%7806, %7805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7808 = func.call @stack_pop_pointer() : () -> i64
      %7809 = func.call @stack_pop_pointer() : () -> i64
      %7810 = func.call @cc_cons(%7809, %7808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7810) : (i64) -> ()
      %7811 = func.call @stack_pop_pointer() : () -> i64
      %7812 = func.call @stack_pop_pointer() : () -> i64
      %7813 = func.call @cc_cons(%7812, %7811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7814 = func.call @stack_pop_pointer() : () -> i64
      %7815 = func.call @stack_pop_pointer() : () -> i64
      %7816 = func.call @cc_cons(%7815, %7814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7816) : (i64) -> ()
      %7817 = func.call @stack_pop_pointer() : () -> i64
      %7818 = func.call @stack_pop_pointer() : () -> i64
      %7819 = func.call @cc_cons(%7818, %7817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7820 = func.call @stack_pop_pointer() : () -> i64
      %7821 = func.call @stack_pop_pointer() : () -> i64
      %7822 = func.call @cc_cons(%7821, %7820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7822) : (i64) -> ()
      %7823 = func.call @stack_pop_pointer() : () -> i64
      %7824 = func.call @stack_pop_pointer() : () -> i64
      %7825 = func.call @cc_cons(%7824, %7823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7825) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %7835 = func.call @stack_pop_pointer() : () -> i64
      %7836 = func.call @stack_pop_pointer() : () -> i64
      %7837 = func.call @cc_cons(%7836, %7835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7837) : (i64) -> ()
      %7838 = func.call @stack_pop_pointer() : () -> i64
      %7839 = func.call @stack_pop_pointer() : () -> i64
      %7840 = func.call @cc_cons(%7839, %7838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7840) : (i64) -> ()
      %7841 = func.call @stack_pop_pointer() : () -> i64
      %7938 = arith.constant 15079495958553 : i64
      %7939 = arith.constant 0 : i64
      %7940 = func.call @cc_make_closure(%7938, %7939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7940) : (i64) -> ()
      %7941 = func.call @stack_pop_pointer() : () -> i64
      %7942 = llvm.mlir.addressof @str651 : !llvm.ptr
      %7943 = arith.constant 4 : i64
      %7944 = func.call @cc_make_string(%7942, %7943) : (!llvm.ptr, i64) -> i64
      %7945 = func.call @cc_nil_value() : () -> i64
      %7946 = func.call @cc_intern(%7944, %7945) : (i64, i64) -> i64
      %7947 = func.call @cc_nil_value() : () -> i64
      %7948 = func.call @cc_cons(%7946, %7947) : (i64, i64) -> i64
      %7949 = func.call @cc_values_pack(%7948) : (i64) -> i64
      func.call @stack_push_pointer(%7946) : (i64) -> ()
      %7950 = llvm.mlir.addressof @str652 : !llvm.ptr
      %7951 = arith.constant 10 : i64
      %7952 = func.call @cc_make_string(%7950, %7951) : (!llvm.ptr, i64) -> i64
      %7953 = llvm.mlir.addressof @str653 : !llvm.ptr
      %7954 = arith.constant 11 : i64
      %7955 = func.call @cc_make_string(%7953, %7954) : (!llvm.ptr, i64) -> i64
      %7956 = func.call @cc_intern(%7952, %7955) : (i64, i64) -> i64
      %7957 = func.call @cc_nil_value() : () -> i64
      %7958 = func.call @cc_cons(%7956, %7957) : (i64, i64) -> i64
      %7959 = func.call @cc_values_pack(%7958) : (i64) -> i64
      func.call @stack_push_pointer(%7956) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7960 = func.call @stack_pop_pointer() : () -> i64
      %7961 = func.call @stack_pop_pointer() : () -> i64
      %7962 = func.call @cc_cons(%7961, %7960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7962) : (i64) -> ()
      %7963 = func.call @stack_pop_pointer() : () -> i64
      %7964 = func.call @stack_pop_pointer() : () -> i64
      %7965 = func.call @cc_cons(%7964, %7963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7965) : (i64) -> ()
      %7966 = func.call @stack_pop_pointer() : () -> i64
      %7967 = llvm.mlir.addressof @str654 : !llvm.ptr
      %7968 = arith.constant 11 : i64
      %7969 = func.call @cc_make_string(%7967, %7968) : (!llvm.ptr, i64) -> i64
      %7970 = llvm.mlir.addressof @str655 : !llvm.ptr
      %7971 = arith.constant 7 : i64
      %7972 = func.call @cc_make_string(%7970, %7971) : (!llvm.ptr, i64) -> i64
      %7973 = func.call @cc_intern(%7969, %7972) : (i64, i64) -> i64
      %7974 = func.call @cc_nil_value() : () -> i64
      %7975 = func.call @cc_cons(%7973, %7974) : (i64, i64) -> i64
      %7976 = func.call @cc_values_pack(%7975) : (i64) -> i64
      func.call @stack_push_pointer(%7973) : (i64) -> ()
      %7977 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7978 = func.call @stack_pop_pointer() : () -> i64
      %7979 = llvm.mlir.addressof @str656 : !llvm.ptr
      %7980 = arith.constant 4 : i64
      %7981 = func.call @cc_make_string(%7979, %7980) : (!llvm.ptr, i64) -> i64
      %7982 = llvm.mlir.addressof @str657 : !llvm.ptr
      %7983 = arith.constant 7 : i64
      %7984 = func.call @cc_make_string(%7982, %7983) : (!llvm.ptr, i64) -> i64
      %7985 = func.call @cc_intern(%7981, %7984) : (i64, i64) -> i64
      %7986 = func.call @cc_nil_value() : () -> i64
      %7987 = func.call @cc_cons(%7985, %7986) : (i64, i64) -> i64
      %7988 = func.call @cc_values_pack(%7987) : (i64) -> i64
      func.call @stack_push_pointer(%7985) : (i64) -> ()
      %7989 = func.call @stack_pop_pointer() : () -> i64
      %7990 = llvm.mlir.addressof @str658 : !llvm.ptr
      %7991 = arith.constant 5 : i64
      %7992 = func.call @cc_make_string(%7990, %7991) : (!llvm.ptr, i64) -> i64
      %7993 = func.call @cc_nil_value() : () -> i64
      %7994 = func.call @cc_intern(%7992, %7993) : (i64, i64) -> i64
      %7995 = func.call @cc_nil_value() : () -> i64
      %7996 = func.call @cc_cons(%7994, %7995) : (i64, i64) -> i64
      %7997 = func.call @cc_values_pack(%7996) : (i64) -> i64
      func.call @stack_push_pointer(%7994) : (i64) -> ()
      %7998 = func.call @stack_pop_pointer() : () -> i64
      %7999 = func.call @cc_nil_value() : () -> i64
      %8000 = func.call @cc_errorp(%7735) : (i64) -> i64
      %8001 = arith.cmpi ne, %8000, %7999 : i64
      %8002 = arith.cmpi eq, %7999, %7999 : i64
      %8003 = arith.andi %8001, %8002 : i1
      %8004 = scf.if %8003 -> (i64) {
        scf.yield %7735 : i64
      } else {
        scf.yield %7999 : i64
      }
      %8005 = func.call @cc_errorp(%7841) : (i64) -> i64
      %8006 = arith.cmpi ne, %8005, %7999 : i64
      %8007 = arith.cmpi eq, %8004, %7999 : i64
      %8008 = arith.andi %8006, %8007 : i1
      %8009 = scf.if %8008 -> (i64) {
        scf.yield %7841 : i64
      } else {
        scf.yield %8004 : i64
      }
      %8010 = func.call @cc_errorp(%7941) : (i64) -> i64
      %8011 = arith.cmpi ne, %8010, %7999 : i64
      %8012 = arith.cmpi eq, %8009, %7999 : i64
      %8013 = arith.andi %8011, %8012 : i1
      %8014 = scf.if %8013 -> (i64) {
        scf.yield %7941 : i64
      } else {
        scf.yield %8009 : i64
      }
      %8015 = func.call @cc_errorp(%7966) : (i64) -> i64
      %8016 = arith.cmpi ne, %8015, %7999 : i64
      %8017 = arith.cmpi eq, %8014, %7999 : i64
      %8018 = arith.andi %8016, %8017 : i1
      %8019 = scf.if %8018 -> (i64) {
        scf.yield %7966 : i64
      } else {
        scf.yield %8014 : i64
      }
      %8020 = func.call @cc_errorp(%7977) : (i64) -> i64
      %8021 = arith.cmpi ne, %8020, %7999 : i64
      %8022 = arith.cmpi eq, %8019, %7999 : i64
      %8023 = arith.andi %8021, %8022 : i1
      %8024 = scf.if %8023 -> (i64) {
        scf.yield %7977 : i64
      } else {
        scf.yield %8019 : i64
      }
      %8025 = func.call @cc_errorp(%7978) : (i64) -> i64
      %8026 = arith.cmpi ne, %8025, %7999 : i64
      %8027 = arith.cmpi eq, %8024, %7999 : i64
      %8028 = arith.andi %8026, %8027 : i1
      %8029 = scf.if %8028 -> (i64) {
        scf.yield %7978 : i64
      } else {
        scf.yield %8024 : i64
      }
      %8030 = func.call @cc_errorp(%7989) : (i64) -> i64
      %8031 = arith.cmpi ne, %8030, %7999 : i64
      %8032 = arith.cmpi eq, %8029, %7999 : i64
      %8033 = arith.andi %8031, %8032 : i1
      %8034 = scf.if %8033 -> (i64) {
        scf.yield %7989 : i64
      } else {
        scf.yield %8029 : i64
      }
      %8035 = func.call @cc_errorp(%7998) : (i64) -> i64
      %8036 = arith.cmpi ne, %8035, %7999 : i64
      %8037 = arith.cmpi eq, %8034, %7999 : i64
      %8038 = arith.andi %8036, %8037 : i1
      %8039 = scf.if %8038 -> (i64) {
        scf.yield %7998 : i64
      } else {
        scf.yield %8034 : i64
      }
      %8040 = arith.cmpi ne, %8039, %7999 : i64
      scf.if %8040 {
        func.call @stack_push_pointer(%8039) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7735) : (i64) -> ()
        func.call @stack_push_pointer(%7841) : (i64) -> ()
        func.call @stack_push_pointer(%7941) : (i64) -> ()
        func.call @stack_push_pointer(%7966) : (i64) -> ()
        func.call @stack_push_pointer(%7977) : (i64) -> ()
        func.call @stack_push_pointer(%7978) : (i64) -> ()
        func.call @stack_push_pointer(%7989) : (i64) -> ()
        func.call @stack_push_pointer(%7998) : (i64) -> ()
        %8041 = llvm.mlir.addressof @str659 : !llvm.ptr
        %8042 = func.call @cc_make_function_ref_const(%8041) : (!llvm.ptr) -> i64
        %8043 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8042, %8043) : (i64, i64) -> ()
      }
      %8044 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8044 : i64
    }
    %8045 = func.call @cc_nil_value() : () -> i64
    %8046 = func.call @cc_errorp(%7726) : (i64) -> i64
    %8047 = arith.cmpi ne, %8046, %8045 : i64
    %8048 = scf.if %8047 -> (i64) {
      scf.yield %7726 : i64
    } else {
      %8049 = llvm.mlir.addressof @str660 : !llvm.ptr
      %8050 = arith.constant 28 : i64
      %8051 = func.call @cc_make_string(%8049, %8050) : (!llvm.ptr, i64) -> i64
      %8052 = func.call @cc_nil_value() : () -> i64
      %8053 = func.call @cc_intern(%8051, %8052) : (i64, i64) -> i64
      %8054 = func.call @cc_nil_value() : () -> i64
      %8055 = func.call @cc_cons(%8053, %8054) : (i64, i64) -> i64
      %8056 = func.call @cc_values_pack(%8055) : (i64) -> i64
      func.call @stack_push_pointer(%8053) : (i64) -> ()
      %8057 = func.call @stack_pop_pointer() : () -> i64
      %8058 = llvm.mlir.addressof @str661 : !llvm.ptr
      %8059 = arith.constant 13 : i64
      %8060 = func.call @cc_make_string(%8058, %8059) : (!llvm.ptr, i64) -> i64
      %8061 = llvm.mlir.addressof @str662 : !llvm.ptr
      %8062 = arith.constant 11 : i64
      %8063 = func.call @cc_make_string(%8061, %8062) : (!llvm.ptr, i64) -> i64
      %8064 = func.call @cc_intern(%8060, %8063) : (i64, i64) -> i64
      %8065 = func.call @cc_nil_value() : () -> i64
      %8066 = func.call @cc_cons(%8064, %8065) : (i64, i64) -> i64
      %8067 = func.call @cc_values_pack(%8066) : (i64) -> i64
      func.call @stack_push_pointer(%8064) : (i64) -> ()
      %8068 = llvm.mlir.addressof @str663 : !llvm.ptr
      %8069 = arith.constant 6 : i64
      %8070 = func.call @cc_make_string(%8068, %8069) : (!llvm.ptr, i64) -> i64
      %8071 = func.call @cc_nil_value() : () -> i64
      %8072 = func.call @cc_intern(%8070, %8071) : (i64, i64) -> i64
      %8073 = func.call @cc_nil_value() : () -> i64
      %8074 = func.call @cc_cons(%8072, %8073) : (i64, i64) -> i64
      %8075 = func.call @cc_values_pack(%8074) : (i64) -> i64
      func.call @stack_push_pointer(%8072) : (i64) -> ()
      %8076 = llvm.mlir.addressof @str664 : !llvm.ptr
      %8077 = arith.constant 19 : i64
      %8078 = func.call @cc_make_string(%8076, %8077) : (!llvm.ptr, i64) -> i64
      %8079 = func.call @cc_nil_value() : () -> i64
      %8080 = func.call @cc_intern(%8078, %8079) : (i64, i64) -> i64
      %8081 = func.call @cc_nil_value() : () -> i64
      %8082 = func.call @cc_cons(%8080, %8081) : (i64, i64) -> i64
      %8083 = func.call @cc_values_pack(%8082) : (i64) -> i64
      func.call @stack_push_pointer(%8080) : (i64) -> ()
      %8084 = llvm.mlir.addressof @str665 : !llvm.ptr
      %8085 = arith.constant 10 : i64
      %8086 = func.call @cc_make_string(%8084, %8085) : (!llvm.ptr, i64) -> i64
      %8087 = llvm.mlir.addressof @str666 : !llvm.ptr
      %8088 = arith.constant 11 : i64
      %8089 = func.call @cc_make_string(%8087, %8088) : (!llvm.ptr, i64) -> i64
      %8090 = func.call @cc_intern(%8086, %8089) : (i64, i64) -> i64
      %8091 = func.call @cc_nil_value() : () -> i64
      %8092 = func.call @cc_cons(%8090, %8091) : (i64, i64) -> i64
      %8093 = func.call @cc_values_pack(%8092) : (i64) -> i64
      func.call @stack_push_pointer(%8090) : (i64) -> ()
      %8094 = llvm.mlir.addressof @str667 : !llvm.ptr
      %8095 = arith.constant 4 : i64
      %8096 = func.call @cc_make_string(%8094, %8095) : (!llvm.ptr, i64) -> i64
      %8097 = llvm.mlir.addressof @str668 : !llvm.ptr
      %8098 = arith.constant 11 : i64
      %8099 = func.call @cc_make_string(%8097, %8098) : (!llvm.ptr, i64) -> i64
      %8100 = func.call @cc_intern(%8096, %8099) : (i64, i64) -> i64
      %8101 = func.call @cc_nil_value() : () -> i64
      %8102 = func.call @cc_cons(%8100, %8101) : (i64, i64) -> i64
      %8103 = func.call @cc_values_pack(%8102) : (i64) -> i64
      func.call @stack_push_pointer(%8100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8104 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%8104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %8114 = func.call @stack_pop_pointer() : () -> i64
      %8115 = func.call @stack_pop_pointer() : () -> i64
      %8116 = func.call @cc_cons(%8115, %8114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8116) : (i64) -> ()
      %8117 = func.call @stack_pop_pointer() : () -> i64
      %8118 = func.call @stack_pop_pointer() : () -> i64
      %8119 = func.call @cc_cons(%8118, %8117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8119) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8120 = func.call @stack_pop_pointer() : () -> i64
      %8121 = func.call @stack_pop_pointer() : () -> i64
      %8122 = func.call @cc_cons(%8121, %8120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8122) : (i64) -> ()
      %8123 = func.call @stack_pop_pointer() : () -> i64
      %8124 = func.call @stack_pop_pointer() : () -> i64
      %8125 = func.call @cc_cons(%8124, %8123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %8135 = func.call @stack_pop_pointer() : () -> i64
      %8136 = func.call @stack_pop_pointer() : () -> i64
      %8137 = func.call @cc_cons(%8136, %8135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8137) : (i64) -> ()
      %8138 = func.call @stack_pop_pointer() : () -> i64
      %8139 = func.call @stack_pop_pointer() : () -> i64
      %8140 = func.call @cc_cons(%8139, %8138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8140) : (i64) -> ()
      %8141 = func.call @stack_pop_pointer() : () -> i64
      %8218 = arith.constant 15079495958554 : i64
      %8219 = arith.constant 0 : i64
      %8220 = func.call @cc_make_closure(%8218, %8219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8220) : (i64) -> ()
      %8221 = func.call @stack_pop_pointer() : () -> i64
      %8222 = llvm.mlir.addressof @str670 : !llvm.ptr
      %8223 = arith.constant 4 : i64
      %8224 = func.call @cc_make_string(%8222, %8223) : (!llvm.ptr, i64) -> i64
      %8225 = func.call @cc_nil_value() : () -> i64
      %8226 = func.call @cc_intern(%8224, %8225) : (i64, i64) -> i64
      %8227 = func.call @cc_nil_value() : () -> i64
      %8228 = func.call @cc_cons(%8226, %8227) : (i64, i64) -> i64
      %8229 = func.call @cc_values_pack(%8228) : (i64) -> i64
      func.call @stack_push_pointer(%8226) : (i64) -> ()
      %8230 = llvm.mlir.addressof @str671 : !llvm.ptr
      %8231 = arith.constant 10 : i64
      %8232 = func.call @cc_make_string(%8230, %8231) : (!llvm.ptr, i64) -> i64
      %8233 = llvm.mlir.addressof @str672 : !llvm.ptr
      %8234 = arith.constant 11 : i64
      %8235 = func.call @cc_make_string(%8233, %8234) : (!llvm.ptr, i64) -> i64
      %8236 = func.call @cc_intern(%8232, %8235) : (i64, i64) -> i64
      %8237 = func.call @cc_nil_value() : () -> i64
      %8238 = func.call @cc_cons(%8236, %8237) : (i64, i64) -> i64
      %8239 = func.call @cc_values_pack(%8238) : (i64) -> i64
      func.call @stack_push_pointer(%8236) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8240 = func.call @stack_pop_pointer() : () -> i64
      %8241 = func.call @stack_pop_pointer() : () -> i64
      %8242 = func.call @cc_cons(%8241, %8240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8242) : (i64) -> ()
      %8243 = func.call @stack_pop_pointer() : () -> i64
      %8244 = func.call @stack_pop_pointer() : () -> i64
      %8245 = func.call @cc_cons(%8244, %8243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8245) : (i64) -> ()
      %8246 = func.call @stack_pop_pointer() : () -> i64
      %8247 = llvm.mlir.addressof @str673 : !llvm.ptr
      %8248 = arith.constant 11 : i64
      %8249 = func.call @cc_make_string(%8247, %8248) : (!llvm.ptr, i64) -> i64
      %8250 = llvm.mlir.addressof @str674 : !llvm.ptr
      %8251 = arith.constant 7 : i64
      %8252 = func.call @cc_make_string(%8250, %8251) : (!llvm.ptr, i64) -> i64
      %8253 = func.call @cc_intern(%8249, %8252) : (i64, i64) -> i64
      %8254 = func.call @cc_nil_value() : () -> i64
      %8255 = func.call @cc_cons(%8253, %8254) : (i64, i64) -> i64
      %8256 = func.call @cc_values_pack(%8255) : (i64) -> i64
      func.call @stack_push_pointer(%8253) : (i64) -> ()
      %8257 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8258 = func.call @stack_pop_pointer() : () -> i64
      %8259 = llvm.mlir.addressof @str675 : !llvm.ptr
      %8260 = arith.constant 4 : i64
      %8261 = func.call @cc_make_string(%8259, %8260) : (!llvm.ptr, i64) -> i64
      %8262 = llvm.mlir.addressof @str676 : !llvm.ptr
      %8263 = arith.constant 7 : i64
      %8264 = func.call @cc_make_string(%8262, %8263) : (!llvm.ptr, i64) -> i64
      %8265 = func.call @cc_intern(%8261, %8264) : (i64, i64) -> i64
      %8266 = func.call @cc_nil_value() : () -> i64
      %8267 = func.call @cc_cons(%8265, %8266) : (i64, i64) -> i64
      %8268 = func.call @cc_values_pack(%8267) : (i64) -> i64
      func.call @stack_push_pointer(%8265) : (i64) -> ()
      %8269 = func.call @stack_pop_pointer() : () -> i64
      %8270 = llvm.mlir.addressof @str677 : !llvm.ptr
      %8271 = arith.constant 5 : i64
      %8272 = func.call @cc_make_string(%8270, %8271) : (!llvm.ptr, i64) -> i64
      %8273 = func.call @cc_nil_value() : () -> i64
      %8274 = func.call @cc_intern(%8272, %8273) : (i64, i64) -> i64
      %8275 = func.call @cc_nil_value() : () -> i64
      %8276 = func.call @cc_cons(%8274, %8275) : (i64, i64) -> i64
      %8277 = func.call @cc_values_pack(%8276) : (i64) -> i64
      func.call @stack_push_pointer(%8274) : (i64) -> ()
      %8278 = func.call @stack_pop_pointer() : () -> i64
      %8279 = func.call @cc_nil_value() : () -> i64
      %8280 = func.call @cc_errorp(%8057) : (i64) -> i64
      %8281 = arith.cmpi ne, %8280, %8279 : i64
      %8282 = arith.cmpi eq, %8279, %8279 : i64
      %8283 = arith.andi %8281, %8282 : i1
      %8284 = scf.if %8283 -> (i64) {
        scf.yield %8057 : i64
      } else {
        scf.yield %8279 : i64
      }
      %8285 = func.call @cc_errorp(%8141) : (i64) -> i64
      %8286 = arith.cmpi ne, %8285, %8279 : i64
      %8287 = arith.cmpi eq, %8284, %8279 : i64
      %8288 = arith.andi %8286, %8287 : i1
      %8289 = scf.if %8288 -> (i64) {
        scf.yield %8141 : i64
      } else {
        scf.yield %8284 : i64
      }
      %8290 = func.call @cc_errorp(%8221) : (i64) -> i64
      %8291 = arith.cmpi ne, %8290, %8279 : i64
      %8292 = arith.cmpi eq, %8289, %8279 : i64
      %8293 = arith.andi %8291, %8292 : i1
      %8294 = scf.if %8293 -> (i64) {
        scf.yield %8221 : i64
      } else {
        scf.yield %8289 : i64
      }
      %8295 = func.call @cc_errorp(%8246) : (i64) -> i64
      %8296 = arith.cmpi ne, %8295, %8279 : i64
      %8297 = arith.cmpi eq, %8294, %8279 : i64
      %8298 = arith.andi %8296, %8297 : i1
      %8299 = scf.if %8298 -> (i64) {
        scf.yield %8246 : i64
      } else {
        scf.yield %8294 : i64
      }
      %8300 = func.call @cc_errorp(%8257) : (i64) -> i64
      %8301 = arith.cmpi ne, %8300, %8279 : i64
      %8302 = arith.cmpi eq, %8299, %8279 : i64
      %8303 = arith.andi %8301, %8302 : i1
      %8304 = scf.if %8303 -> (i64) {
        scf.yield %8257 : i64
      } else {
        scf.yield %8299 : i64
      }
      %8305 = func.call @cc_errorp(%8258) : (i64) -> i64
      %8306 = arith.cmpi ne, %8305, %8279 : i64
      %8307 = arith.cmpi eq, %8304, %8279 : i64
      %8308 = arith.andi %8306, %8307 : i1
      %8309 = scf.if %8308 -> (i64) {
        scf.yield %8258 : i64
      } else {
        scf.yield %8304 : i64
      }
      %8310 = func.call @cc_errorp(%8269) : (i64) -> i64
      %8311 = arith.cmpi ne, %8310, %8279 : i64
      %8312 = arith.cmpi eq, %8309, %8279 : i64
      %8313 = arith.andi %8311, %8312 : i1
      %8314 = scf.if %8313 -> (i64) {
        scf.yield %8269 : i64
      } else {
        scf.yield %8309 : i64
      }
      %8315 = func.call @cc_errorp(%8278) : (i64) -> i64
      %8316 = arith.cmpi ne, %8315, %8279 : i64
      %8317 = arith.cmpi eq, %8314, %8279 : i64
      %8318 = arith.andi %8316, %8317 : i1
      %8319 = scf.if %8318 -> (i64) {
        scf.yield %8278 : i64
      } else {
        scf.yield %8314 : i64
      }
      %8320 = arith.cmpi ne, %8319, %8279 : i64
      scf.if %8320 {
        func.call @stack_push_pointer(%8319) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8057) : (i64) -> ()
        func.call @stack_push_pointer(%8141) : (i64) -> ()
        func.call @stack_push_pointer(%8221) : (i64) -> ()
        func.call @stack_push_pointer(%8246) : (i64) -> ()
        func.call @stack_push_pointer(%8257) : (i64) -> ()
        func.call @stack_push_pointer(%8258) : (i64) -> ()
        func.call @stack_push_pointer(%8269) : (i64) -> ()
        func.call @stack_push_pointer(%8278) : (i64) -> ()
        %8321 = llvm.mlir.addressof @str678 : !llvm.ptr
        %8322 = func.call @cc_make_function_ref_const(%8321) : (!llvm.ptr) -> i64
        %8323 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8322, %8323) : (i64, i64) -> ()
      }
      %8324 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8324 : i64
    }
    %8325 = func.call @cc_nil_value() : () -> i64
    %8326 = func.call @cc_errorp(%8048) : (i64) -> i64
    %8327 = arith.cmpi ne, %8326, %8325 : i64
    %8328 = scf.if %8327 -> (i64) {
      scf.yield %8048 : i64
    } else {
      %8329 = llvm.mlir.addressof @str679 : !llvm.ptr
      %8330 = arith.constant 28 : i64
      %8331 = func.call @cc_make_string(%8329, %8330) : (!llvm.ptr, i64) -> i64
      %8332 = func.call @cc_nil_value() : () -> i64
      %8333 = func.call @cc_intern(%8331, %8332) : (i64, i64) -> i64
      %8334 = func.call @cc_nil_value() : () -> i64
      %8335 = func.call @cc_cons(%8333, %8334) : (i64, i64) -> i64
      %8336 = func.call @cc_values_pack(%8335) : (i64) -> i64
      func.call @stack_push_pointer(%8333) : (i64) -> ()
      %8337 = func.call @stack_pop_pointer() : () -> i64
      %8338 = llvm.mlir.addressof @str680 : !llvm.ptr
      %8339 = arith.constant 13 : i64
      %8340 = func.call @cc_make_string(%8338, %8339) : (!llvm.ptr, i64) -> i64
      %8341 = llvm.mlir.addressof @str681 : !llvm.ptr
      %8342 = arith.constant 11 : i64
      %8343 = func.call @cc_make_string(%8341, %8342) : (!llvm.ptr, i64) -> i64
      %8344 = func.call @cc_intern(%8340, %8343) : (i64, i64) -> i64
      %8345 = func.call @cc_nil_value() : () -> i64
      %8346 = func.call @cc_cons(%8344, %8345) : (i64, i64) -> i64
      %8347 = func.call @cc_values_pack(%8346) : (i64) -> i64
      func.call @stack_push_pointer(%8344) : (i64) -> ()
      %8348 = llvm.mlir.addressof @str682 : !llvm.ptr
      %8349 = arith.constant 6 : i64
      %8350 = func.call @cc_make_string(%8348, %8349) : (!llvm.ptr, i64) -> i64
      %8351 = func.call @cc_nil_value() : () -> i64
      %8352 = func.call @cc_intern(%8350, %8351) : (i64, i64) -> i64
      %8353 = func.call @cc_nil_value() : () -> i64
      %8354 = func.call @cc_cons(%8352, %8353) : (i64, i64) -> i64
      %8355 = func.call @cc_values_pack(%8354) : (i64) -> i64
      func.call @stack_push_pointer(%8352) : (i64) -> ()
      %8356 = llvm.mlir.addressof @str683 : !llvm.ptr
      %8357 = arith.constant 19 : i64
      %8358 = func.call @cc_make_string(%8356, %8357) : (!llvm.ptr, i64) -> i64
      %8359 = func.call @cc_nil_value() : () -> i64
      %8360 = func.call @cc_intern(%8358, %8359) : (i64, i64) -> i64
      %8361 = func.call @cc_nil_value() : () -> i64
      %8362 = func.call @cc_cons(%8360, %8361) : (i64, i64) -> i64
      %8363 = func.call @cc_values_pack(%8362) : (i64) -> i64
      func.call @stack_push_pointer(%8360) : (i64) -> ()
      %8364 = llvm.mlir.addressof @str684 : !llvm.ptr
      %8365 = arith.constant 10 : i64
      %8366 = func.call @cc_make_string(%8364, %8365) : (!llvm.ptr, i64) -> i64
      %8367 = llvm.mlir.addressof @str685 : !llvm.ptr
      %8368 = arith.constant 11 : i64
      %8369 = func.call @cc_make_string(%8367, %8368) : (!llvm.ptr, i64) -> i64
      %8370 = func.call @cc_intern(%8366, %8369) : (i64, i64) -> i64
      %8371 = func.call @cc_nil_value() : () -> i64
      %8372 = func.call @cc_cons(%8370, %8371) : (i64, i64) -> i64
      %8373 = func.call @cc_values_pack(%8372) : (i64) -> i64
      func.call @stack_push_pointer(%8370) : (i64) -> ()
      %8374 = llvm.mlir.addressof @str686 : !llvm.ptr
      %8375 = arith.constant 4 : i64
      %8376 = func.call @cc_make_string(%8374, %8375) : (!llvm.ptr, i64) -> i64
      %8377 = llvm.mlir.addressof @str687 : !llvm.ptr
      %8378 = arith.constant 11 : i64
      %8379 = func.call @cc_make_string(%8377, %8378) : (!llvm.ptr, i64) -> i64
      %8380 = func.call @cc_intern(%8376, %8379) : (i64, i64) -> i64
      %8381 = func.call @cc_nil_value() : () -> i64
      %8382 = func.call @cc_cons(%8380, %8381) : (i64, i64) -> i64
      %8383 = func.call @cc_values_pack(%8382) : (i64) -> i64
      func.call @stack_push_pointer(%8380) : (i64) -> ()
      %8384 = arith.constant 97 : i64
      %8385 = func.call @cc_box_character(%8384) : (i64) -> i64
      func.call @stack_push_pointer(%8385) : (i64) -> ()
      %8386 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%8386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8387 = func.call @stack_pop_pointer() : () -> i64
      %8388 = func.call @stack_pop_pointer() : () -> i64
      %8389 = func.call @cc_cons(%8388, %8387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8389) : (i64) -> ()
      %8390 = func.call @stack_pop_pointer() : () -> i64
      %8391 = func.call @stack_pop_pointer() : () -> i64
      %8392 = func.call @cc_cons(%8391, %8390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8392) : (i64) -> ()
      %8393 = func.call @stack_pop_pointer() : () -> i64
      %8394 = func.call @stack_pop_pointer() : () -> i64
      %8395 = func.call @cc_cons(%8394, %8393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8396 = func.call @stack_pop_pointer() : () -> i64
      %8397 = func.call @stack_pop_pointer() : () -> i64
      %8398 = func.call @cc_cons(%8397, %8396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8398) : (i64) -> ()
      %8399 = func.call @stack_pop_pointer() : () -> i64
      %8400 = func.call @stack_pop_pointer() : () -> i64
      %8401 = func.call @cc_cons(%8400, %8399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8401) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8402 = func.call @stack_pop_pointer() : () -> i64
      %8403 = func.call @stack_pop_pointer() : () -> i64
      %8404 = func.call @cc_cons(%8403, %8402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8404) : (i64) -> ()
      %8405 = func.call @stack_pop_pointer() : () -> i64
      %8406 = func.call @stack_pop_pointer() : () -> i64
      %8407 = func.call @cc_cons(%8406, %8405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8407) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8408 = func.call @stack_pop_pointer() : () -> i64
      %8409 = func.call @stack_pop_pointer() : () -> i64
      %8410 = func.call @cc_cons(%8409, %8408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8410) : (i64) -> ()
      %8411 = func.call @stack_pop_pointer() : () -> i64
      %8412 = func.call @stack_pop_pointer() : () -> i64
      %8413 = func.call @cc_cons(%8412, %8411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8413) : (i64) -> ()
      %8414 = func.call @stack_pop_pointer() : () -> i64
      %8415 = func.call @stack_pop_pointer() : () -> i64
      %8416 = func.call @cc_cons(%8415, %8414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8416) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8417 = func.call @stack_pop_pointer() : () -> i64
      %8418 = func.call @stack_pop_pointer() : () -> i64
      %8419 = func.call @cc_cons(%8418, %8417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8419) : (i64) -> ()
      %8420 = func.call @stack_pop_pointer() : () -> i64
      %8421 = func.call @stack_pop_pointer() : () -> i64
      %8422 = func.call @cc_cons(%8421, %8420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8422) : (i64) -> ()
      %8423 = func.call @stack_pop_pointer() : () -> i64
      %8502 = arith.constant 15079495958555 : i64
      %8503 = arith.constant 0 : i64
      %8504 = func.call @cc_make_closure(%8502, %8503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8504) : (i64) -> ()
      %8505 = func.call @stack_pop_pointer() : () -> i64
      %8506 = llvm.mlir.addressof @str689 : !llvm.ptr
      %8507 = arith.constant 4 : i64
      %8508 = func.call @cc_make_string(%8506, %8507) : (!llvm.ptr, i64) -> i64
      %8509 = func.call @cc_nil_value() : () -> i64
      %8510 = func.call @cc_intern(%8508, %8509) : (i64, i64) -> i64
      %8511 = func.call @cc_nil_value() : () -> i64
      %8512 = func.call @cc_cons(%8510, %8511) : (i64, i64) -> i64
      %8513 = func.call @cc_values_pack(%8512) : (i64) -> i64
      func.call @stack_push_pointer(%8510) : (i64) -> ()
      %8514 = llvm.mlir.addressof @str690 : !llvm.ptr
      %8515 = arith.constant 10 : i64
      %8516 = func.call @cc_make_string(%8514, %8515) : (!llvm.ptr, i64) -> i64
      %8517 = llvm.mlir.addressof @str691 : !llvm.ptr
      %8518 = arith.constant 11 : i64
      %8519 = func.call @cc_make_string(%8517, %8518) : (!llvm.ptr, i64) -> i64
      %8520 = func.call @cc_intern(%8516, %8519) : (i64, i64) -> i64
      %8521 = func.call @cc_nil_value() : () -> i64
      %8522 = func.call @cc_cons(%8520, %8521) : (i64, i64) -> i64
      %8523 = func.call @cc_values_pack(%8522) : (i64) -> i64
      func.call @stack_push_pointer(%8520) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8524 = func.call @stack_pop_pointer() : () -> i64
      %8525 = func.call @stack_pop_pointer() : () -> i64
      %8526 = func.call @cc_cons(%8525, %8524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8526) : (i64) -> ()
      %8527 = func.call @stack_pop_pointer() : () -> i64
      %8528 = func.call @stack_pop_pointer() : () -> i64
      %8529 = func.call @cc_cons(%8528, %8527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8529) : (i64) -> ()
      %8530 = func.call @stack_pop_pointer() : () -> i64
      %8531 = llvm.mlir.addressof @str692 : !llvm.ptr
      %8532 = arith.constant 11 : i64
      %8533 = func.call @cc_make_string(%8531, %8532) : (!llvm.ptr, i64) -> i64
      %8534 = llvm.mlir.addressof @str693 : !llvm.ptr
      %8535 = arith.constant 7 : i64
      %8536 = func.call @cc_make_string(%8534, %8535) : (!llvm.ptr, i64) -> i64
      %8537 = func.call @cc_intern(%8533, %8536) : (i64, i64) -> i64
      %8538 = func.call @cc_nil_value() : () -> i64
      %8539 = func.call @cc_cons(%8537, %8538) : (i64, i64) -> i64
      %8540 = func.call @cc_values_pack(%8539) : (i64) -> i64
      func.call @stack_push_pointer(%8537) : (i64) -> ()
      %8541 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8542 = func.call @stack_pop_pointer() : () -> i64
      %8543 = llvm.mlir.addressof @str694 : !llvm.ptr
      %8544 = arith.constant 4 : i64
      %8545 = func.call @cc_make_string(%8543, %8544) : (!llvm.ptr, i64) -> i64
      %8546 = llvm.mlir.addressof @str695 : !llvm.ptr
      %8547 = arith.constant 7 : i64
      %8548 = func.call @cc_make_string(%8546, %8547) : (!llvm.ptr, i64) -> i64
      %8549 = func.call @cc_intern(%8545, %8548) : (i64, i64) -> i64
      %8550 = func.call @cc_nil_value() : () -> i64
      %8551 = func.call @cc_cons(%8549, %8550) : (i64, i64) -> i64
      %8552 = func.call @cc_values_pack(%8551) : (i64) -> i64
      func.call @stack_push_pointer(%8549) : (i64) -> ()
      %8553 = func.call @stack_pop_pointer() : () -> i64
      %8554 = llvm.mlir.addressof @str696 : !llvm.ptr
      %8555 = arith.constant 5 : i64
      %8556 = func.call @cc_make_string(%8554, %8555) : (!llvm.ptr, i64) -> i64
      %8557 = func.call @cc_nil_value() : () -> i64
      %8558 = func.call @cc_intern(%8556, %8557) : (i64, i64) -> i64
      %8559 = func.call @cc_nil_value() : () -> i64
      %8560 = func.call @cc_cons(%8558, %8559) : (i64, i64) -> i64
      %8561 = func.call @cc_values_pack(%8560) : (i64) -> i64
      func.call @stack_push_pointer(%8558) : (i64) -> ()
      %8562 = func.call @stack_pop_pointer() : () -> i64
      %8563 = func.call @cc_nil_value() : () -> i64
      %8564 = func.call @cc_errorp(%8337) : (i64) -> i64
      %8565 = arith.cmpi ne, %8564, %8563 : i64
      %8566 = arith.cmpi eq, %8563, %8563 : i64
      %8567 = arith.andi %8565, %8566 : i1
      %8568 = scf.if %8567 -> (i64) {
        scf.yield %8337 : i64
      } else {
        scf.yield %8563 : i64
      }
      %8569 = func.call @cc_errorp(%8423) : (i64) -> i64
      %8570 = arith.cmpi ne, %8569, %8563 : i64
      %8571 = arith.cmpi eq, %8568, %8563 : i64
      %8572 = arith.andi %8570, %8571 : i1
      %8573 = scf.if %8572 -> (i64) {
        scf.yield %8423 : i64
      } else {
        scf.yield %8568 : i64
      }
      %8574 = func.call @cc_errorp(%8505) : (i64) -> i64
      %8575 = arith.cmpi ne, %8574, %8563 : i64
      %8576 = arith.cmpi eq, %8573, %8563 : i64
      %8577 = arith.andi %8575, %8576 : i1
      %8578 = scf.if %8577 -> (i64) {
        scf.yield %8505 : i64
      } else {
        scf.yield %8573 : i64
      }
      %8579 = func.call @cc_errorp(%8530) : (i64) -> i64
      %8580 = arith.cmpi ne, %8579, %8563 : i64
      %8581 = arith.cmpi eq, %8578, %8563 : i64
      %8582 = arith.andi %8580, %8581 : i1
      %8583 = scf.if %8582 -> (i64) {
        scf.yield %8530 : i64
      } else {
        scf.yield %8578 : i64
      }
      %8584 = func.call @cc_errorp(%8541) : (i64) -> i64
      %8585 = arith.cmpi ne, %8584, %8563 : i64
      %8586 = arith.cmpi eq, %8583, %8563 : i64
      %8587 = arith.andi %8585, %8586 : i1
      %8588 = scf.if %8587 -> (i64) {
        scf.yield %8541 : i64
      } else {
        scf.yield %8583 : i64
      }
      %8589 = func.call @cc_errorp(%8542) : (i64) -> i64
      %8590 = arith.cmpi ne, %8589, %8563 : i64
      %8591 = arith.cmpi eq, %8588, %8563 : i64
      %8592 = arith.andi %8590, %8591 : i1
      %8593 = scf.if %8592 -> (i64) {
        scf.yield %8542 : i64
      } else {
        scf.yield %8588 : i64
      }
      %8594 = func.call @cc_errorp(%8553) : (i64) -> i64
      %8595 = arith.cmpi ne, %8594, %8563 : i64
      %8596 = arith.cmpi eq, %8593, %8563 : i64
      %8597 = arith.andi %8595, %8596 : i1
      %8598 = scf.if %8597 -> (i64) {
        scf.yield %8553 : i64
      } else {
        scf.yield %8593 : i64
      }
      %8599 = func.call @cc_errorp(%8562) : (i64) -> i64
      %8600 = arith.cmpi ne, %8599, %8563 : i64
      %8601 = arith.cmpi eq, %8598, %8563 : i64
      %8602 = arith.andi %8600, %8601 : i1
      %8603 = scf.if %8602 -> (i64) {
        scf.yield %8562 : i64
      } else {
        scf.yield %8598 : i64
      }
      %8604 = arith.cmpi ne, %8603, %8563 : i64
      scf.if %8604 {
        func.call @stack_push_pointer(%8603) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8337) : (i64) -> ()
        func.call @stack_push_pointer(%8423) : (i64) -> ()
        func.call @stack_push_pointer(%8505) : (i64) -> ()
        func.call @stack_push_pointer(%8530) : (i64) -> ()
        func.call @stack_push_pointer(%8541) : (i64) -> ()
        func.call @stack_push_pointer(%8542) : (i64) -> ()
        func.call @stack_push_pointer(%8553) : (i64) -> ()
        func.call @stack_push_pointer(%8562) : (i64) -> ()
        %8605 = llvm.mlir.addressof @str697 : !llvm.ptr
        %8606 = func.call @cc_make_function_ref_const(%8605) : (!llvm.ptr) -> i64
        %8607 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8606, %8607) : (i64, i64) -> ()
      }
      %8608 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8608 : i64
    }
    %8609 = func.call @cc_nil_value() : () -> i64
    %8610 = func.call @cc_errorp(%8328) : (i64) -> i64
    %8611 = arith.cmpi ne, %8610, %8609 : i64
    %8612 = scf.if %8611 -> (i64) {
      scf.yield %8328 : i64
    } else {
      %8613 = llvm.mlir.addressof @str698 : !llvm.ptr
      %8614 = arith.constant 28 : i64
      %8615 = func.call @cc_make_string(%8613, %8614) : (!llvm.ptr, i64) -> i64
      %8616 = func.call @cc_nil_value() : () -> i64
      %8617 = func.call @cc_intern(%8615, %8616) : (i64, i64) -> i64
      %8618 = func.call @cc_nil_value() : () -> i64
      %8619 = func.call @cc_cons(%8617, %8618) : (i64, i64) -> i64
      %8620 = func.call @cc_values_pack(%8619) : (i64) -> i64
      func.call @stack_push_pointer(%8617) : (i64) -> ()
      %8621 = func.call @stack_pop_pointer() : () -> i64
      %8622 = llvm.mlir.addressof @str699 : !llvm.ptr
      %8623 = arith.constant 13 : i64
      %8624 = func.call @cc_make_string(%8622, %8623) : (!llvm.ptr, i64) -> i64
      %8625 = llvm.mlir.addressof @str700 : !llvm.ptr
      %8626 = arith.constant 11 : i64
      %8627 = func.call @cc_make_string(%8625, %8626) : (!llvm.ptr, i64) -> i64
      %8628 = func.call @cc_intern(%8624, %8627) : (i64, i64) -> i64
      %8629 = func.call @cc_nil_value() : () -> i64
      %8630 = func.call @cc_cons(%8628, %8629) : (i64, i64) -> i64
      %8631 = func.call @cc_values_pack(%8630) : (i64) -> i64
      func.call @stack_push_pointer(%8628) : (i64) -> ()
      %8632 = llvm.mlir.addressof @str701 : !llvm.ptr
      %8633 = arith.constant 6 : i64
      %8634 = func.call @cc_make_string(%8632, %8633) : (!llvm.ptr, i64) -> i64
      %8635 = func.call @cc_nil_value() : () -> i64
      %8636 = func.call @cc_intern(%8634, %8635) : (i64, i64) -> i64
      %8637 = func.call @cc_nil_value() : () -> i64
      %8638 = func.call @cc_cons(%8636, %8637) : (i64, i64) -> i64
      %8639 = func.call @cc_values_pack(%8638) : (i64) -> i64
      func.call @stack_push_pointer(%8636) : (i64) -> ()
      %8640 = llvm.mlir.addressof @str702 : !llvm.ptr
      %8641 = arith.constant 19 : i64
      %8642 = func.call @cc_make_string(%8640, %8641) : (!llvm.ptr, i64) -> i64
      %8643 = func.call @cc_nil_value() : () -> i64
      %8644 = func.call @cc_intern(%8642, %8643) : (i64, i64) -> i64
      %8645 = func.call @cc_nil_value() : () -> i64
      %8646 = func.call @cc_cons(%8644, %8645) : (i64, i64) -> i64
      %8647 = func.call @cc_values_pack(%8646) : (i64) -> i64
      func.call @stack_push_pointer(%8644) : (i64) -> ()
      %8648 = llvm.mlir.addressof @str703 : !llvm.ptr
      %8649 = arith.constant 10 : i64
      %8650 = func.call @cc_make_string(%8648, %8649) : (!llvm.ptr, i64) -> i64
      %8651 = llvm.mlir.addressof @str704 : !llvm.ptr
      %8652 = arith.constant 11 : i64
      %8653 = func.call @cc_make_string(%8651, %8652) : (!llvm.ptr, i64) -> i64
      %8654 = func.call @cc_intern(%8650, %8653) : (i64, i64) -> i64
      %8655 = func.call @cc_nil_value() : () -> i64
      %8656 = func.call @cc_cons(%8654, %8655) : (i64, i64) -> i64
      %8657 = func.call @cc_values_pack(%8656) : (i64) -> i64
      func.call @stack_push_pointer(%8654) : (i64) -> ()
      %8658 = llvm.mlir.addressof @str705 : !llvm.ptr
      %8659 = arith.constant 4 : i64
      %8660 = func.call @cc_make_string(%8658, %8659) : (!llvm.ptr, i64) -> i64
      %8661 = llvm.mlir.addressof @str706 : !llvm.ptr
      %8662 = arith.constant 11 : i64
      %8663 = func.call @cc_make_string(%8661, %8662) : (!llvm.ptr, i64) -> i64
      %8664 = func.call @cc_intern(%8660, %8663) : (i64, i64) -> i64
      %8665 = func.call @cc_nil_value() : () -> i64
      %8666 = func.call @cc_cons(%8664, %8665) : (i64, i64) -> i64
      %8667 = func.call @cc_values_pack(%8666) : (i64) -> i64
      func.call @stack_push_pointer(%8664) : (i64) -> ()
      %8668 = arith.constant -13 : i64
      func.call @stack_push_fixnum(%8668) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8669 = func.call @stack_pop_pointer() : () -> i64
      %8670 = func.call @stack_pop_pointer() : () -> i64
      %8671 = func.call @cc_cons(%8670, %8669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8671) : (i64) -> ()
      %8672 = func.call @stack_pop_pointer() : () -> i64
      %8673 = func.call @stack_pop_pointer() : () -> i64
      %8674 = func.call @cc_cons(%8673, %8672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8675 = func.call @stack_pop_pointer() : () -> i64
      %8676 = func.call @stack_pop_pointer() : () -> i64
      %8677 = func.call @cc_cons(%8676, %8675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8677) : (i64) -> ()
      %8678 = func.call @stack_pop_pointer() : () -> i64
      %8679 = func.call @stack_pop_pointer() : () -> i64
      %8680 = func.call @cc_cons(%8679, %8678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8680) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8681 = func.call @stack_pop_pointer() : () -> i64
      %8682 = func.call @stack_pop_pointer() : () -> i64
      %8683 = func.call @cc_cons(%8682, %8681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8683) : (i64) -> ()
      %8684 = func.call @stack_pop_pointer() : () -> i64
      %8685 = func.call @stack_pop_pointer() : () -> i64
      %8686 = func.call @cc_cons(%8685, %8684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8686) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8687 = func.call @stack_pop_pointer() : () -> i64
      %8688 = func.call @stack_pop_pointer() : () -> i64
      %8689 = func.call @cc_cons(%8688, %8687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8689) : (i64) -> ()
      %8690 = func.call @stack_pop_pointer() : () -> i64
      %8691 = func.call @stack_pop_pointer() : () -> i64
      %8692 = func.call @cc_cons(%8691, %8690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8692) : (i64) -> ()
      %8693 = func.call @stack_pop_pointer() : () -> i64
      %8694 = func.call @stack_pop_pointer() : () -> i64
      %8695 = func.call @cc_cons(%8694, %8693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8696 = func.call @stack_pop_pointer() : () -> i64
      %8697 = func.call @stack_pop_pointer() : () -> i64
      %8698 = func.call @cc_cons(%8697, %8696) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8698) : (i64) -> ()
      %8699 = func.call @stack_pop_pointer() : () -> i64
      %8700 = func.call @stack_pop_pointer() : () -> i64
      %8701 = func.call @cc_cons(%8700, %8699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8701) : (i64) -> ()
      %8702 = func.call @stack_pop_pointer() : () -> i64
      %8770 = arith.constant 15079495958556 : i64
      %8771 = arith.constant 0 : i64
      %8772 = func.call @cc_make_closure(%8770, %8771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8772) : (i64) -> ()
      %8773 = func.call @stack_pop_pointer() : () -> i64
      %8774 = llvm.mlir.addressof @str708 : !llvm.ptr
      %8775 = arith.constant 4 : i64
      %8776 = func.call @cc_make_string(%8774, %8775) : (!llvm.ptr, i64) -> i64
      %8777 = func.call @cc_nil_value() : () -> i64
      %8778 = func.call @cc_intern(%8776, %8777) : (i64, i64) -> i64
      %8779 = func.call @cc_nil_value() : () -> i64
      %8780 = func.call @cc_cons(%8778, %8779) : (i64, i64) -> i64
      %8781 = func.call @cc_values_pack(%8780) : (i64) -> i64
      func.call @stack_push_pointer(%8778) : (i64) -> ()
      %8782 = llvm.mlir.addressof @str709 : !llvm.ptr
      %8783 = arith.constant 10 : i64
      %8784 = func.call @cc_make_string(%8782, %8783) : (!llvm.ptr, i64) -> i64
      %8785 = llvm.mlir.addressof @str710 : !llvm.ptr
      %8786 = arith.constant 11 : i64
      %8787 = func.call @cc_make_string(%8785, %8786) : (!llvm.ptr, i64) -> i64
      %8788 = func.call @cc_intern(%8784, %8787) : (i64, i64) -> i64
      %8789 = func.call @cc_nil_value() : () -> i64
      %8790 = func.call @cc_cons(%8788, %8789) : (i64, i64) -> i64
      %8791 = func.call @cc_values_pack(%8790) : (i64) -> i64
      func.call @stack_push_pointer(%8788) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8792 = func.call @stack_pop_pointer() : () -> i64
      %8793 = func.call @stack_pop_pointer() : () -> i64
      %8794 = func.call @cc_cons(%8793, %8792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8794) : (i64) -> ()
      %8795 = func.call @stack_pop_pointer() : () -> i64
      %8796 = func.call @stack_pop_pointer() : () -> i64
      %8797 = func.call @cc_cons(%8796, %8795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8797) : (i64) -> ()
      %8798 = func.call @stack_pop_pointer() : () -> i64
      %8799 = llvm.mlir.addressof @str711 : !llvm.ptr
      %8800 = arith.constant 11 : i64
      %8801 = func.call @cc_make_string(%8799, %8800) : (!llvm.ptr, i64) -> i64
      %8802 = llvm.mlir.addressof @str712 : !llvm.ptr
      %8803 = arith.constant 7 : i64
      %8804 = func.call @cc_make_string(%8802, %8803) : (!llvm.ptr, i64) -> i64
      %8805 = func.call @cc_intern(%8801, %8804) : (i64, i64) -> i64
      %8806 = func.call @cc_nil_value() : () -> i64
      %8807 = func.call @cc_cons(%8805, %8806) : (i64, i64) -> i64
      %8808 = func.call @cc_values_pack(%8807) : (i64) -> i64
      func.call @stack_push_pointer(%8805) : (i64) -> ()
      %8809 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8810 = func.call @stack_pop_pointer() : () -> i64
      %8811 = llvm.mlir.addressof @str713 : !llvm.ptr
      %8812 = arith.constant 4 : i64
      %8813 = func.call @cc_make_string(%8811, %8812) : (!llvm.ptr, i64) -> i64
      %8814 = llvm.mlir.addressof @str714 : !llvm.ptr
      %8815 = arith.constant 7 : i64
      %8816 = func.call @cc_make_string(%8814, %8815) : (!llvm.ptr, i64) -> i64
      %8817 = func.call @cc_intern(%8813, %8816) : (i64, i64) -> i64
      %8818 = func.call @cc_nil_value() : () -> i64
      %8819 = func.call @cc_cons(%8817, %8818) : (i64, i64) -> i64
      %8820 = func.call @cc_values_pack(%8819) : (i64) -> i64
      func.call @stack_push_pointer(%8817) : (i64) -> ()
      %8821 = func.call @stack_pop_pointer() : () -> i64
      %8822 = llvm.mlir.addressof @str715 : !llvm.ptr
      %8823 = arith.constant 5 : i64
      %8824 = func.call @cc_make_string(%8822, %8823) : (!llvm.ptr, i64) -> i64
      %8825 = func.call @cc_nil_value() : () -> i64
      %8826 = func.call @cc_intern(%8824, %8825) : (i64, i64) -> i64
      %8827 = func.call @cc_nil_value() : () -> i64
      %8828 = func.call @cc_cons(%8826, %8827) : (i64, i64) -> i64
      %8829 = func.call @cc_values_pack(%8828) : (i64) -> i64
      func.call @stack_push_pointer(%8826) : (i64) -> ()
      %8830 = func.call @stack_pop_pointer() : () -> i64
      %8831 = func.call @cc_nil_value() : () -> i64
      %8832 = func.call @cc_errorp(%8621) : (i64) -> i64
      %8833 = arith.cmpi ne, %8832, %8831 : i64
      %8834 = arith.cmpi eq, %8831, %8831 : i64
      %8835 = arith.andi %8833, %8834 : i1
      %8836 = scf.if %8835 -> (i64) {
        scf.yield %8621 : i64
      } else {
        scf.yield %8831 : i64
      }
      %8837 = func.call @cc_errorp(%8702) : (i64) -> i64
      %8838 = arith.cmpi ne, %8837, %8831 : i64
      %8839 = arith.cmpi eq, %8836, %8831 : i64
      %8840 = arith.andi %8838, %8839 : i1
      %8841 = scf.if %8840 -> (i64) {
        scf.yield %8702 : i64
      } else {
        scf.yield %8836 : i64
      }
      %8842 = func.call @cc_errorp(%8773) : (i64) -> i64
      %8843 = arith.cmpi ne, %8842, %8831 : i64
      %8844 = arith.cmpi eq, %8841, %8831 : i64
      %8845 = arith.andi %8843, %8844 : i1
      %8846 = scf.if %8845 -> (i64) {
        scf.yield %8773 : i64
      } else {
        scf.yield %8841 : i64
      }
      %8847 = func.call @cc_errorp(%8798) : (i64) -> i64
      %8848 = arith.cmpi ne, %8847, %8831 : i64
      %8849 = arith.cmpi eq, %8846, %8831 : i64
      %8850 = arith.andi %8848, %8849 : i1
      %8851 = scf.if %8850 -> (i64) {
        scf.yield %8798 : i64
      } else {
        scf.yield %8846 : i64
      }
      %8852 = func.call @cc_errorp(%8809) : (i64) -> i64
      %8853 = arith.cmpi ne, %8852, %8831 : i64
      %8854 = arith.cmpi eq, %8851, %8831 : i64
      %8855 = arith.andi %8853, %8854 : i1
      %8856 = scf.if %8855 -> (i64) {
        scf.yield %8809 : i64
      } else {
        scf.yield %8851 : i64
      }
      %8857 = func.call @cc_errorp(%8810) : (i64) -> i64
      %8858 = arith.cmpi ne, %8857, %8831 : i64
      %8859 = arith.cmpi eq, %8856, %8831 : i64
      %8860 = arith.andi %8858, %8859 : i1
      %8861 = scf.if %8860 -> (i64) {
        scf.yield %8810 : i64
      } else {
        scf.yield %8856 : i64
      }
      %8862 = func.call @cc_errorp(%8821) : (i64) -> i64
      %8863 = arith.cmpi ne, %8862, %8831 : i64
      %8864 = arith.cmpi eq, %8861, %8831 : i64
      %8865 = arith.andi %8863, %8864 : i1
      %8866 = scf.if %8865 -> (i64) {
        scf.yield %8821 : i64
      } else {
        scf.yield %8861 : i64
      }
      %8867 = func.call @cc_errorp(%8830) : (i64) -> i64
      %8868 = arith.cmpi ne, %8867, %8831 : i64
      %8869 = arith.cmpi eq, %8866, %8831 : i64
      %8870 = arith.andi %8868, %8869 : i1
      %8871 = scf.if %8870 -> (i64) {
        scf.yield %8830 : i64
      } else {
        scf.yield %8866 : i64
      }
      %8872 = arith.cmpi ne, %8871, %8831 : i64
      scf.if %8872 {
        func.call @stack_push_pointer(%8871) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8621) : (i64) -> ()
        func.call @stack_push_pointer(%8702) : (i64) -> ()
        func.call @stack_push_pointer(%8773) : (i64) -> ()
        func.call @stack_push_pointer(%8798) : (i64) -> ()
        func.call @stack_push_pointer(%8809) : (i64) -> ()
        func.call @stack_push_pointer(%8810) : (i64) -> ()
        func.call @stack_push_pointer(%8821) : (i64) -> ()
        func.call @stack_push_pointer(%8830) : (i64) -> ()
        %8873 = llvm.mlir.addressof @str716 : !llvm.ptr
        %8874 = func.call @cc_make_function_ref_const(%8873) : (!llvm.ptr) -> i64
        %8875 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8874, %8875) : (i64, i64) -> ()
      }
      %8876 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8876 : i64
    }
    %8877 = func.call @cc_nil_value() : () -> i64
    %8878 = func.call @cc_errorp(%8612) : (i64) -> i64
    %8879 = arith.cmpi ne, %8878, %8877 : i64
    %8880 = scf.if %8879 -> (i64) {
      scf.yield %8612 : i64
    } else {
      %8881 = llvm.mlir.addressof @str717 : !llvm.ptr
      %8882 = arith.constant 24 : i64
      %8883 = func.call @cc_make_string(%8881, %8882) : (!llvm.ptr, i64) -> i64
      %8884 = func.call @cc_nil_value() : () -> i64
      %8885 = func.call @cc_intern(%8883, %8884) : (i64, i64) -> i64
      %8886 = func.call @cc_nil_value() : () -> i64
      %8887 = func.call @cc_cons(%8885, %8886) : (i64, i64) -> i64
      %8888 = func.call @cc_values_pack(%8887) : (i64) -> i64
      func.call @stack_push_pointer(%8885) : (i64) -> ()
      %8889 = func.call @stack_pop_pointer() : () -> i64
      %8890 = llvm.mlir.addressof @str718 : !llvm.ptr
      %8891 = arith.constant 13 : i64
      %8892 = func.call @cc_make_string(%8890, %8891) : (!llvm.ptr, i64) -> i64
      %8893 = llvm.mlir.addressof @str719 : !llvm.ptr
      %8894 = arith.constant 11 : i64
      %8895 = func.call @cc_make_string(%8893, %8894) : (!llvm.ptr, i64) -> i64
      %8896 = func.call @cc_intern(%8892, %8895) : (i64, i64) -> i64
      %8897 = func.call @cc_nil_value() : () -> i64
      %8898 = func.call @cc_cons(%8896, %8897) : (i64, i64) -> i64
      %8899 = func.call @cc_values_pack(%8898) : (i64) -> i64
      func.call @stack_push_pointer(%8896) : (i64) -> ()
      %8900 = llvm.mlir.addressof @str720 : !llvm.ptr
      %8901 = arith.constant 6 : i64
      %8902 = func.call @cc_make_string(%8900, %8901) : (!llvm.ptr, i64) -> i64
      %8903 = func.call @cc_nil_value() : () -> i64
      %8904 = func.call @cc_intern(%8902, %8903) : (i64, i64) -> i64
      %8905 = func.call @cc_nil_value() : () -> i64
      %8906 = func.call @cc_cons(%8904, %8905) : (i64, i64) -> i64
      %8907 = func.call @cc_values_pack(%8906) : (i64) -> i64
      func.call @stack_push_pointer(%8904) : (i64) -> ()
      %8908 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8909 = arith.constant 19 : i64
      %8910 = func.call @cc_make_string(%8908, %8909) : (!llvm.ptr, i64) -> i64
      %8911 = func.call @cc_nil_value() : () -> i64
      %8912 = func.call @cc_intern(%8910, %8911) : (i64, i64) -> i64
      %8913 = func.call @cc_nil_value() : () -> i64
      %8914 = func.call @cc_cons(%8912, %8913) : (i64, i64) -> i64
      %8915 = func.call @cc_values_pack(%8914) : (i64) -> i64
      func.call @stack_push_pointer(%8912) : (i64) -> ()
      %8916 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8917 = arith.constant 7 : i64
      %8918 = func.call @cc_make_string(%8916, %8917) : (!llvm.ptr, i64) -> i64
      %8919 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8920 = arith.constant 11 : i64
      %8921 = func.call @cc_make_string(%8919, %8920) : (!llvm.ptr, i64) -> i64
      %8922 = func.call @cc_intern(%8918, %8921) : (i64, i64) -> i64
      %8923 = func.call @cc_nil_value() : () -> i64
      %8924 = func.call @cc_cons(%8922, %8923) : (i64, i64) -> i64
      %8925 = func.call @cc_values_pack(%8924) : (i64) -> i64
      func.call @stack_push_pointer(%8922) : (i64) -> ()
      %8926 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8927 = arith.constant 7 : i64
      %8928 = func.call @cc_make_string(%8926, %8927) : (!llvm.ptr, i64) -> i64
      %8929 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8930 = arith.constant 11 : i64
      %8931 = func.call @cc_make_string(%8929, %8930) : (!llvm.ptr, i64) -> i64
      %8932 = func.call @cc_intern(%8928, %8931) : (i64, i64) -> i64
      %8933 = func.call @cc_nil_value() : () -> i64
      %8934 = func.call @cc_cons(%8932, %8933) : (i64, i64) -> i64
      %8935 = func.call @cc_values_pack(%8934) : (i64) -> i64
      func.call @stack_push_pointer(%8932) : (i64) -> ()
      %8936 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8937 = arith.constant 9 : i64
      %8938 = func.call @cc_make_string(%8936, %8937) : (!llvm.ptr, i64) -> i64
      %8939 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8940 = arith.constant 11 : i64
      %8941 = func.call @cc_make_string(%8939, %8940) : (!llvm.ptr, i64) -> i64
      %8942 = func.call @cc_intern(%8938, %8941) : (i64, i64) -> i64
      %8943 = func.call @cc_nil_value() : () -> i64
      %8944 = func.call @cc_cons(%8942, %8943) : (i64, i64) -> i64
      %8945 = func.call @cc_values_pack(%8944) : (i64) -> i64
      func.call @stack_push_pointer(%8942) : (i64) -> ()
      %8946 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8947 = arith.constant 10 : i64
      %8948 = func.call @cc_make_string(%8946, %8947) : (!llvm.ptr, i64) -> i64
      %8949 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8950 = arith.constant 11 : i64
      %8951 = func.call @cc_make_string(%8949, %8950) : (!llvm.ptr, i64) -> i64
      %8952 = func.call @cc_intern(%8948, %8951) : (i64, i64) -> i64
      %8953 = func.call @cc_nil_value() : () -> i64
      %8954 = func.call @cc_cons(%8952, %8953) : (i64, i64) -> i64
      %8955 = func.call @cc_values_pack(%8954) : (i64) -> i64
      func.call @stack_push_pointer(%8952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8956 = func.call @stack_pop_pointer() : () -> i64
      %8957 = func.call @stack_pop_pointer() : () -> i64
      %8958 = func.call @cc_cons(%8957, %8956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8958) : (i64) -> ()
      %8959 = func.call @stack_pop_pointer() : () -> i64
      %8960 = func.call @stack_pop_pointer() : () -> i64
      %8961 = func.call @cc_cons(%8960, %8959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8962 = func.call @stack_pop_pointer() : () -> i64
      %8963 = func.call @stack_pop_pointer() : () -> i64
      %8964 = func.call @cc_cons(%8963, %8962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8964) : (i64) -> ()
      %8965 = func.call @stack_pop_pointer() : () -> i64
      %8966 = func.call @stack_pop_pointer() : () -> i64
      %8967 = func.call @cc_cons(%8966, %8965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8967) : (i64) -> ()
      %8968 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8969 = arith.constant 10 : i64
      %8970 = func.call @cc_make_string(%8968, %8969) : (!llvm.ptr, i64) -> i64
      %8971 = llvm.mlir.addressof @str731 : !llvm.ptr
      %8972 = arith.constant 11 : i64
      %8973 = func.call @cc_make_string(%8971, %8972) : (!llvm.ptr, i64) -> i64
      %8974 = func.call @cc_intern(%8970, %8973) : (i64, i64) -> i64
      %8975 = func.call @cc_nil_value() : () -> i64
      %8976 = func.call @cc_cons(%8974, %8975) : (i64, i64) -> i64
      %8977 = func.call @cc_values_pack(%8976) : (i64) -> i64
      func.call @stack_push_pointer(%8974) : (i64) -> ()
      %8978 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8979 = arith.constant 2 : i64
      %8980 = func.call @cc_make_string(%8978, %8979) : (!llvm.ptr, i64) -> i64
      %8981 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8982 = arith.constant 11 : i64
      %8983 = func.call @cc_make_string(%8981, %8982) : (!llvm.ptr, i64) -> i64
      %8984 = func.call @cc_intern(%8980, %8983) : (i64, i64) -> i64
      %8985 = func.call @cc_nil_value() : () -> i64
      %8986 = func.call @cc_cons(%8984, %8985) : (i64, i64) -> i64
      %8987 = func.call @cc_values_pack(%8986) : (i64) -> i64
      func.call @stack_push_pointer(%8984) : (i64) -> ()
      %8988 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8989 = arith.constant 22 : i64
      %8990 = func.call @cc_make_string(%8988, %8989) : (!llvm.ptr, i64) -> i64
      %8991 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8992 = arith.constant 11 : i64
      %8993 = func.call @cc_make_string(%8991, %8992) : (!llvm.ptr, i64) -> i64
      %8994 = func.call @cc_intern(%8990, %8993) : (i64, i64) -> i64
      %8995 = func.call @cc_nil_value() : () -> i64
      %8996 = func.call @cc_cons(%8994, %8995) : (i64, i64) -> i64
      %8997 = func.call @cc_values_pack(%8996) : (i64) -> i64
      func.call @stack_push_pointer(%8994) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8998 = func.call @stack_pop_pointer() : () -> i64
      %8999 = func.call @stack_pop_pointer() : () -> i64
      %9000 = func.call @cc_cons(%8999, %8998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9000) : (i64) -> ()
      %9001 = func.call @stack_pop_pointer() : () -> i64
      %9002 = func.call @stack_pop_pointer() : () -> i64
      %9003 = func.call @cc_cons(%9002, %9001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9004 = func.call @stack_pop_pointer() : () -> i64
      %9005 = func.call @stack_pop_pointer() : () -> i64
      %9006 = func.call @cc_cons(%9005, %9004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9006) : (i64) -> ()
      %9007 = func.call @stack_pop_pointer() : () -> i64
      %9008 = func.call @stack_pop_pointer() : () -> i64
      %9009 = func.call @cc_cons(%9008, %9007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9010 = func.call @stack_pop_pointer() : () -> i64
      %9011 = func.call @stack_pop_pointer() : () -> i64
      %9012 = func.call @cc_cons(%9011, %9010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9012) : (i64) -> ()
      %9013 = func.call @stack_pop_pointer() : () -> i64
      %9014 = func.call @stack_pop_pointer() : () -> i64
      %9015 = func.call @cc_cons(%9014, %9013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9015) : (i64) -> ()
      %9016 = func.call @stack_pop_pointer() : () -> i64
      %9017 = func.call @stack_pop_pointer() : () -> i64
      %9018 = func.call @cc_cons(%9017, %9016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9019 = func.call @stack_pop_pointer() : () -> i64
      %9020 = func.call @stack_pop_pointer() : () -> i64
      %9021 = func.call @cc_cons(%9020, %9019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9021) : (i64) -> ()
      %9022 = func.call @stack_pop_pointer() : () -> i64
      %9023 = func.call @stack_pop_pointer() : () -> i64
      %9024 = func.call @cc_cons(%9023, %9022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9024) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9025 = func.call @stack_pop_pointer() : () -> i64
      %9026 = func.call @stack_pop_pointer() : () -> i64
      %9027 = func.call @cc_cons(%9026, %9025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9027) : (i64) -> ()
      %9028 = func.call @stack_pop_pointer() : () -> i64
      %9029 = func.call @stack_pop_pointer() : () -> i64
      %9030 = func.call @cc_cons(%9029, %9028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9030) : (i64) -> ()
      %9031 = func.call @stack_pop_pointer() : () -> i64
      %9032 = func.call @stack_pop_pointer() : () -> i64
      %9033 = func.call @cc_cons(%9032, %9031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9034 = func.call @stack_pop_pointer() : () -> i64
      %9035 = func.call @stack_pop_pointer() : () -> i64
      %9036 = func.call @cc_cons(%9035, %9034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9036) : (i64) -> ()
      %9037 = func.call @stack_pop_pointer() : () -> i64
      %9038 = func.call @stack_pop_pointer() : () -> i64
      %9039 = func.call @cc_cons(%9038, %9037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9039) : (i64) -> ()
      %9040 = func.call @stack_pop_pointer() : () -> i64
      %9131 = arith.constant 15079495958557 : i64
      %9132 = arith.constant 0 : i64
      %9133 = func.call @cc_make_closure(%9131, %9132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9133) : (i64) -> ()
      %9134 = func.call @stack_pop_pointer() : () -> i64
      %9135 = llvm.mlir.addressof @str737 : !llvm.ptr
      %9136 = arith.constant 4 : i64
      %9137 = func.call @cc_make_string(%9135, %9136) : (!llvm.ptr, i64) -> i64
      %9138 = func.call @cc_nil_value() : () -> i64
      %9139 = func.call @cc_intern(%9137, %9138) : (i64, i64) -> i64
      %9140 = func.call @cc_nil_value() : () -> i64
      %9141 = func.call @cc_cons(%9139, %9140) : (i64, i64) -> i64
      %9142 = func.call @cc_values_pack(%9141) : (i64) -> i64
      func.call @stack_push_pointer(%9139) : (i64) -> ()
      %9143 = llvm.mlir.addressof @str738 : !llvm.ptr
      %9144 = arith.constant 10 : i64
      %9145 = func.call @cc_make_string(%9143, %9144) : (!llvm.ptr, i64) -> i64
      %9146 = llvm.mlir.addressof @str739 : !llvm.ptr
      %9147 = arith.constant 11 : i64
      %9148 = func.call @cc_make_string(%9146, %9147) : (!llvm.ptr, i64) -> i64
      %9149 = func.call @cc_intern(%9145, %9148) : (i64, i64) -> i64
      %9150 = func.call @cc_nil_value() : () -> i64
      %9151 = func.call @cc_cons(%9149, %9150) : (i64, i64) -> i64
      %9152 = func.call @cc_values_pack(%9151) : (i64) -> i64
      func.call @stack_push_pointer(%9149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9153 = func.call @stack_pop_pointer() : () -> i64
      %9154 = func.call @stack_pop_pointer() : () -> i64
      %9155 = func.call @cc_cons(%9154, %9153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9155) : (i64) -> ()
      %9156 = func.call @stack_pop_pointer() : () -> i64
      %9157 = func.call @stack_pop_pointer() : () -> i64
      %9158 = func.call @cc_cons(%9157, %9156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9158) : (i64) -> ()
      %9159 = func.call @stack_pop_pointer() : () -> i64
      %9160 = llvm.mlir.addressof @str740 : !llvm.ptr
      %9161 = arith.constant 11 : i64
      %9162 = func.call @cc_make_string(%9160, %9161) : (!llvm.ptr, i64) -> i64
      %9163 = llvm.mlir.addressof @str741 : !llvm.ptr
      %9164 = arith.constant 7 : i64
      %9165 = func.call @cc_make_string(%9163, %9164) : (!llvm.ptr, i64) -> i64
      %9166 = func.call @cc_intern(%9162, %9165) : (i64, i64) -> i64
      %9167 = func.call @cc_nil_value() : () -> i64
      %9168 = func.call @cc_cons(%9166, %9167) : (i64, i64) -> i64
      %9169 = func.call @cc_values_pack(%9168) : (i64) -> i64
      func.call @stack_push_pointer(%9166) : (i64) -> ()
      %9170 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9171 = func.call @stack_pop_pointer() : () -> i64
      %9172 = llvm.mlir.addressof @str742 : !llvm.ptr
      %9173 = arith.constant 4 : i64
      %9174 = func.call @cc_make_string(%9172, %9173) : (!llvm.ptr, i64) -> i64
      %9175 = llvm.mlir.addressof @str743 : !llvm.ptr
      %9176 = arith.constant 7 : i64
      %9177 = func.call @cc_make_string(%9175, %9176) : (!llvm.ptr, i64) -> i64
      %9178 = func.call @cc_intern(%9174, %9177) : (i64, i64) -> i64
      %9179 = func.call @cc_nil_value() : () -> i64
      %9180 = func.call @cc_cons(%9178, %9179) : (i64, i64) -> i64
      %9181 = func.call @cc_values_pack(%9180) : (i64) -> i64
      func.call @stack_push_pointer(%9178) : (i64) -> ()
      %9182 = func.call @stack_pop_pointer() : () -> i64
      %9183 = llvm.mlir.addressof @str744 : !llvm.ptr
      %9184 = arith.constant 5 : i64
      %9185 = func.call @cc_make_string(%9183, %9184) : (!llvm.ptr, i64) -> i64
      %9186 = func.call @cc_nil_value() : () -> i64
      %9187 = func.call @cc_intern(%9185, %9186) : (i64, i64) -> i64
      %9188 = func.call @cc_nil_value() : () -> i64
      %9189 = func.call @cc_cons(%9187, %9188) : (i64, i64) -> i64
      %9190 = func.call @cc_values_pack(%9189) : (i64) -> i64
      func.call @stack_push_pointer(%9187) : (i64) -> ()
      %9191 = func.call @stack_pop_pointer() : () -> i64
      %9192 = func.call @cc_nil_value() : () -> i64
      %9193 = func.call @cc_errorp(%8889) : (i64) -> i64
      %9194 = arith.cmpi ne, %9193, %9192 : i64
      %9195 = arith.cmpi eq, %9192, %9192 : i64
      %9196 = arith.andi %9194, %9195 : i1
      %9197 = scf.if %9196 -> (i64) {
        scf.yield %8889 : i64
      } else {
        scf.yield %9192 : i64
      }
      %9198 = func.call @cc_errorp(%9040) : (i64) -> i64
      %9199 = arith.cmpi ne, %9198, %9192 : i64
      %9200 = arith.cmpi eq, %9197, %9192 : i64
      %9201 = arith.andi %9199, %9200 : i1
      %9202 = scf.if %9201 -> (i64) {
        scf.yield %9040 : i64
      } else {
        scf.yield %9197 : i64
      }
      %9203 = func.call @cc_errorp(%9134) : (i64) -> i64
      %9204 = arith.cmpi ne, %9203, %9192 : i64
      %9205 = arith.cmpi eq, %9202, %9192 : i64
      %9206 = arith.andi %9204, %9205 : i1
      %9207 = scf.if %9206 -> (i64) {
        scf.yield %9134 : i64
      } else {
        scf.yield %9202 : i64
      }
      %9208 = func.call @cc_errorp(%9159) : (i64) -> i64
      %9209 = arith.cmpi ne, %9208, %9192 : i64
      %9210 = arith.cmpi eq, %9207, %9192 : i64
      %9211 = arith.andi %9209, %9210 : i1
      %9212 = scf.if %9211 -> (i64) {
        scf.yield %9159 : i64
      } else {
        scf.yield %9207 : i64
      }
      %9213 = func.call @cc_errorp(%9170) : (i64) -> i64
      %9214 = arith.cmpi ne, %9213, %9192 : i64
      %9215 = arith.cmpi eq, %9212, %9192 : i64
      %9216 = arith.andi %9214, %9215 : i1
      %9217 = scf.if %9216 -> (i64) {
        scf.yield %9170 : i64
      } else {
        scf.yield %9212 : i64
      }
      %9218 = func.call @cc_errorp(%9171) : (i64) -> i64
      %9219 = arith.cmpi ne, %9218, %9192 : i64
      %9220 = arith.cmpi eq, %9217, %9192 : i64
      %9221 = arith.andi %9219, %9220 : i1
      %9222 = scf.if %9221 -> (i64) {
        scf.yield %9171 : i64
      } else {
        scf.yield %9217 : i64
      }
      %9223 = func.call @cc_errorp(%9182) : (i64) -> i64
      %9224 = arith.cmpi ne, %9223, %9192 : i64
      %9225 = arith.cmpi eq, %9222, %9192 : i64
      %9226 = arith.andi %9224, %9225 : i1
      %9227 = scf.if %9226 -> (i64) {
        scf.yield %9182 : i64
      } else {
        scf.yield %9222 : i64
      }
      %9228 = func.call @cc_errorp(%9191) : (i64) -> i64
      %9229 = arith.cmpi ne, %9228, %9192 : i64
      %9230 = arith.cmpi eq, %9227, %9192 : i64
      %9231 = arith.andi %9229, %9230 : i1
      %9232 = scf.if %9231 -> (i64) {
        scf.yield %9191 : i64
      } else {
        scf.yield %9227 : i64
      }
      %9233 = arith.cmpi ne, %9232, %9192 : i64
      scf.if %9233 {
        func.call @stack_push_pointer(%9232) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8889) : (i64) -> ()
        func.call @stack_push_pointer(%9040) : (i64) -> ()
        func.call @stack_push_pointer(%9134) : (i64) -> ()
        func.call @stack_push_pointer(%9159) : (i64) -> ()
        func.call @stack_push_pointer(%9170) : (i64) -> ()
        func.call @stack_push_pointer(%9171) : (i64) -> ()
        func.call @stack_push_pointer(%9182) : (i64) -> ()
        func.call @stack_push_pointer(%9191) : (i64) -> ()
        %9234 = llvm.mlir.addressof @str745 : !llvm.ptr
        %9235 = func.call @cc_make_function_ref_const(%9234) : (!llvm.ptr) -> i64
        %9236 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9235, %9236) : (i64, i64) -> ()
      }
      %9237 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9237 : i64
    }
    %9238 = func.call @cc_nil_value() : () -> i64
    %9239 = func.call @cc_errorp(%8880) : (i64) -> i64
    %9240 = arith.cmpi ne, %9239, %9238 : i64
    %9241 = scf.if %9240 -> (i64) {
      scf.yield %8880 : i64
    } else {
      %9242 = llvm.mlir.addressof @str746 : !llvm.ptr
      %9243 = arith.constant 29 : i64
      %9244 = func.call @cc_make_string(%9242, %9243) : (!llvm.ptr, i64) -> i64
      %9245 = func.call @cc_nil_value() : () -> i64
      %9246 = func.call @cc_intern(%9244, %9245) : (i64, i64) -> i64
      %9247 = func.call @cc_nil_value() : () -> i64
      %9248 = func.call @cc_cons(%9246, %9247) : (i64, i64) -> i64
      %9249 = func.call @cc_values_pack(%9248) : (i64) -> i64
      func.call @stack_push_pointer(%9246) : (i64) -> ()
      %9250 = func.call @stack_pop_pointer() : () -> i64
      %9251 = llvm.mlir.addressof @str747 : !llvm.ptr
      %9252 = arith.constant 13 : i64
      %9253 = func.call @cc_make_string(%9251, %9252) : (!llvm.ptr, i64) -> i64
      %9254 = llvm.mlir.addressof @str748 : !llvm.ptr
      %9255 = arith.constant 11 : i64
      %9256 = func.call @cc_make_string(%9254, %9255) : (!llvm.ptr, i64) -> i64
      %9257 = func.call @cc_intern(%9253, %9256) : (i64, i64) -> i64
      %9258 = func.call @cc_nil_value() : () -> i64
      %9259 = func.call @cc_cons(%9257, %9258) : (i64, i64) -> i64
      %9260 = func.call @cc_values_pack(%9259) : (i64) -> i64
      func.call @stack_push_pointer(%9257) : (i64) -> ()
      %9261 = llvm.mlir.addressof @str749 : !llvm.ptr
      %9262 = arith.constant 6 : i64
      %9263 = func.call @cc_make_string(%9261, %9262) : (!llvm.ptr, i64) -> i64
      %9264 = func.call @cc_nil_value() : () -> i64
      %9265 = func.call @cc_intern(%9263, %9264) : (i64, i64) -> i64
      %9266 = func.call @cc_nil_value() : () -> i64
      %9267 = func.call @cc_cons(%9265, %9266) : (i64, i64) -> i64
      %9268 = func.call @cc_values_pack(%9267) : (i64) -> i64
      func.call @stack_push_pointer(%9265) : (i64) -> ()
      %9269 = llvm.mlir.addressof @str750 : !llvm.ptr
      %9270 = arith.constant 19 : i64
      %9271 = func.call @cc_make_string(%9269, %9270) : (!llvm.ptr, i64) -> i64
      %9272 = func.call @cc_nil_value() : () -> i64
      %9273 = func.call @cc_intern(%9271, %9272) : (i64, i64) -> i64
      %9274 = func.call @cc_nil_value() : () -> i64
      %9275 = func.call @cc_cons(%9273, %9274) : (i64, i64) -> i64
      %9276 = func.call @cc_values_pack(%9275) : (i64) -> i64
      func.call @stack_push_pointer(%9273) : (i64) -> ()
      %9277 = llvm.mlir.addressof @str751 : !llvm.ptr
      %9278 = arith.constant 7 : i64
      %9279 = func.call @cc_make_string(%9277, %9278) : (!llvm.ptr, i64) -> i64
      %9280 = llvm.mlir.addressof @str752 : !llvm.ptr
      %9281 = arith.constant 11 : i64
      %9282 = func.call @cc_make_string(%9280, %9281) : (!llvm.ptr, i64) -> i64
      %9283 = func.call @cc_intern(%9279, %9282) : (i64, i64) -> i64
      %9284 = func.call @cc_nil_value() : () -> i64
      %9285 = func.call @cc_cons(%9283, %9284) : (i64, i64) -> i64
      %9286 = func.call @cc_values_pack(%9285) : (i64) -> i64
      func.call @stack_push_pointer(%9283) : (i64) -> ()
      %9287 = llvm.mlir.addressof @str753 : !llvm.ptr
      %9288 = arith.constant 7 : i64
      %9289 = func.call @cc_make_string(%9287, %9288) : (!llvm.ptr, i64) -> i64
      %9290 = llvm.mlir.addressof @str754 : !llvm.ptr
      %9291 = arith.constant 11 : i64
      %9292 = func.call @cc_make_string(%9290, %9291) : (!llvm.ptr, i64) -> i64
      %9293 = func.call @cc_intern(%9289, %9292) : (i64, i64) -> i64
      %9294 = func.call @cc_nil_value() : () -> i64
      %9295 = func.call @cc_cons(%9293, %9294) : (i64, i64) -> i64
      %9296 = func.call @cc_values_pack(%9295) : (i64) -> i64
      func.call @stack_push_pointer(%9293) : (i64) -> ()
      %9297 = llvm.mlir.addressof @str755 : !llvm.ptr
      %9298 = arith.constant 9 : i64
      %9299 = func.call @cc_make_string(%9297, %9298) : (!llvm.ptr, i64) -> i64
      %9300 = llvm.mlir.addressof @str756 : !llvm.ptr
      %9301 = arith.constant 11 : i64
      %9302 = func.call @cc_make_string(%9300, %9301) : (!llvm.ptr, i64) -> i64
      %9303 = func.call @cc_intern(%9299, %9302) : (i64, i64) -> i64
      %9304 = func.call @cc_nil_value() : () -> i64
      %9305 = func.call @cc_cons(%9303, %9304) : (i64, i64) -> i64
      %9306 = func.call @cc_values_pack(%9305) : (i64) -> i64
      func.call @stack_push_pointer(%9303) : (i64) -> ()
      %9307 = llvm.mlir.addressof @str757 : !llvm.ptr
      %9308 = arith.constant 10 : i64
      %9309 = func.call @cc_make_string(%9307, %9308) : (!llvm.ptr, i64) -> i64
      %9310 = llvm.mlir.addressof @str758 : !llvm.ptr
      %9311 = arith.constant 11 : i64
      %9312 = func.call @cc_make_string(%9310, %9311) : (!llvm.ptr, i64) -> i64
      %9313 = func.call @cc_intern(%9309, %9312) : (i64, i64) -> i64
      %9314 = func.call @cc_nil_value() : () -> i64
      %9315 = func.call @cc_cons(%9313, %9314) : (i64, i64) -> i64
      %9316 = func.call @cc_values_pack(%9315) : (i64) -> i64
      func.call @stack_push_pointer(%9313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9317 = func.call @stack_pop_pointer() : () -> i64
      %9318 = func.call @stack_pop_pointer() : () -> i64
      %9319 = func.call @cc_cons(%9318, %9317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9319) : (i64) -> ()
      %9320 = func.call @stack_pop_pointer() : () -> i64
      %9321 = func.call @stack_pop_pointer() : () -> i64
      %9322 = func.call @cc_cons(%9321, %9320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9322) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9323 = func.call @stack_pop_pointer() : () -> i64
      %9324 = func.call @stack_pop_pointer() : () -> i64
      %9325 = func.call @cc_cons(%9324, %9323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9325) : (i64) -> ()
      %9326 = func.call @stack_pop_pointer() : () -> i64
      %9327 = func.call @stack_pop_pointer() : () -> i64
      %9328 = func.call @cc_cons(%9327, %9326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9328) : (i64) -> ()
      %9329 = llvm.mlir.addressof @str759 : !llvm.ptr
      %9330 = arith.constant 10 : i64
      %9331 = func.call @cc_make_string(%9329, %9330) : (!llvm.ptr, i64) -> i64
      %9332 = llvm.mlir.addressof @str760 : !llvm.ptr
      %9333 = arith.constant 11 : i64
      %9334 = func.call @cc_make_string(%9332, %9333) : (!llvm.ptr, i64) -> i64
      %9335 = func.call @cc_intern(%9331, %9334) : (i64, i64) -> i64
      %9336 = func.call @cc_nil_value() : () -> i64
      %9337 = func.call @cc_cons(%9335, %9336) : (i64, i64) -> i64
      %9338 = func.call @cc_values_pack(%9337) : (i64) -> i64
      func.call @stack_push_pointer(%9335) : (i64) -> ()
      %9339 = llvm.mlir.addressof @str761 : !llvm.ptr
      %9340 = arith.constant 4 : i64
      %9341 = func.call @cc_make_string(%9339, %9340) : (!llvm.ptr, i64) -> i64
      %9342 = llvm.mlir.addressof @str762 : !llvm.ptr
      %9343 = arith.constant 11 : i64
      %9344 = func.call @cc_make_string(%9342, %9343) : (!llvm.ptr, i64) -> i64
      %9345 = func.call @cc_intern(%9341, %9344) : (i64, i64) -> i64
      %9346 = func.call @cc_nil_value() : () -> i64
      %9347 = func.call @cc_cons(%9345, %9346) : (i64, i64) -> i64
      %9348 = func.call @cc_values_pack(%9347) : (i64) -> i64
      func.call @stack_push_pointer(%9345) : (i64) -> ()
      %9349 = llvm.mlir.addressof @str763 : !llvm.ptr
      %9350 = arith.constant 2 : i64
      %9351 = func.call @cc_make_string(%9349, %9350) : (!llvm.ptr, i64) -> i64
      %9352 = llvm.mlir.addressof @str764 : !llvm.ptr
      %9353 = arith.constant 11 : i64
      %9354 = func.call @cc_make_string(%9352, %9353) : (!llvm.ptr, i64) -> i64
      %9355 = func.call @cc_intern(%9351, %9354) : (i64, i64) -> i64
      %9356 = func.call @cc_nil_value() : () -> i64
      %9357 = func.call @cc_cons(%9355, %9356) : (i64, i64) -> i64
      %9358 = func.call @cc_values_pack(%9357) : (i64) -> i64
      func.call @stack_push_pointer(%9355) : (i64) -> ()
      %9359 = llvm.mlir.addressof @str765 : !llvm.ptr
      %9360 = arith.constant 22 : i64
      %9361 = func.call @cc_make_string(%9359, %9360) : (!llvm.ptr, i64) -> i64
      %9362 = llvm.mlir.addressof @str766 : !llvm.ptr
      %9363 = arith.constant 11 : i64
      %9364 = func.call @cc_make_string(%9362, %9363) : (!llvm.ptr, i64) -> i64
      %9365 = func.call @cc_intern(%9361, %9364) : (i64, i64) -> i64
      %9366 = func.call @cc_nil_value() : () -> i64
      %9367 = func.call @cc_cons(%9365, %9366) : (i64, i64) -> i64
      %9368 = func.call @cc_values_pack(%9367) : (i64) -> i64
      func.call @stack_push_pointer(%9365) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9369 = func.call @stack_pop_pointer() : () -> i64
      %9370 = func.call @stack_pop_pointer() : () -> i64
      %9371 = func.call @cc_cons(%9370, %9369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9371) : (i64) -> ()
      %9372 = func.call @stack_pop_pointer() : () -> i64
      %9373 = func.call @stack_pop_pointer() : () -> i64
      %9374 = func.call @cc_cons(%9373, %9372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9374) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9375 = func.call @stack_pop_pointer() : () -> i64
      %9376 = func.call @stack_pop_pointer() : () -> i64
      %9377 = func.call @cc_cons(%9376, %9375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9377) : (i64) -> ()
      %9378 = func.call @stack_pop_pointer() : () -> i64
      %9379 = func.call @stack_pop_pointer() : () -> i64
      %9380 = func.call @cc_cons(%9379, %9378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9380) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9381 = func.call @stack_pop_pointer() : () -> i64
      %9382 = func.call @stack_pop_pointer() : () -> i64
      %9383 = func.call @cc_cons(%9382, %9381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9383) : (i64) -> ()
      %9384 = func.call @stack_pop_pointer() : () -> i64
      %9385 = func.call @stack_pop_pointer() : () -> i64
      %9386 = func.call @cc_cons(%9385, %9384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9387 = func.call @stack_pop_pointer() : () -> i64
      %9388 = func.call @stack_pop_pointer() : () -> i64
      %9389 = func.call @cc_cons(%9388, %9387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9389) : (i64) -> ()
      %9390 = func.call @stack_pop_pointer() : () -> i64
      %9391 = func.call @stack_pop_pointer() : () -> i64
      %9392 = func.call @cc_cons(%9391, %9390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9392) : (i64) -> ()
      %9393 = func.call @stack_pop_pointer() : () -> i64
      %9394 = func.call @stack_pop_pointer() : () -> i64
      %9395 = func.call @cc_cons(%9394, %9393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9396 = func.call @stack_pop_pointer() : () -> i64
      %9397 = func.call @stack_pop_pointer() : () -> i64
      %9398 = func.call @cc_cons(%9397, %9396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9398) : (i64) -> ()
      %9399 = func.call @stack_pop_pointer() : () -> i64
      %9400 = func.call @stack_pop_pointer() : () -> i64
      %9401 = func.call @cc_cons(%9400, %9399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9401) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9402 = func.call @stack_pop_pointer() : () -> i64
      %9403 = func.call @stack_pop_pointer() : () -> i64
      %9404 = func.call @cc_cons(%9403, %9402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9404) : (i64) -> ()
      %9405 = func.call @stack_pop_pointer() : () -> i64
      %9406 = func.call @stack_pop_pointer() : () -> i64
      %9407 = func.call @cc_cons(%9406, %9405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9407) : (i64) -> ()
      %9408 = func.call @stack_pop_pointer() : () -> i64
      %9409 = func.call @stack_pop_pointer() : () -> i64
      %9410 = func.call @cc_cons(%9409, %9408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9410) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9411 = func.call @stack_pop_pointer() : () -> i64
      %9412 = func.call @stack_pop_pointer() : () -> i64
      %9413 = func.call @cc_cons(%9412, %9411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9413) : (i64) -> ()
      %9414 = func.call @stack_pop_pointer() : () -> i64
      %9415 = func.call @stack_pop_pointer() : () -> i64
      %9416 = func.call @cc_cons(%9415, %9414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9416) : (i64) -> ()
      %9417 = func.call @stack_pop_pointer() : () -> i64
      %9520 = arith.constant 15079495958558 : i64
      %9521 = arith.constant 0 : i64
      %9522 = func.call @cc_make_closure(%9520, %9521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9522) : (i64) -> ()
      %9523 = func.call @stack_pop_pointer() : () -> i64
      %9524 = llvm.mlir.addressof @str768 : !llvm.ptr
      %9525 = arith.constant 4 : i64
      %9526 = func.call @cc_make_string(%9524, %9525) : (!llvm.ptr, i64) -> i64
      %9527 = func.call @cc_nil_value() : () -> i64
      %9528 = func.call @cc_intern(%9526, %9527) : (i64, i64) -> i64
      %9529 = func.call @cc_nil_value() : () -> i64
      %9530 = func.call @cc_cons(%9528, %9529) : (i64, i64) -> i64
      %9531 = func.call @cc_values_pack(%9530) : (i64) -> i64
      func.call @stack_push_pointer(%9528) : (i64) -> ()
      %9532 = llvm.mlir.addressof @str769 : !llvm.ptr
      %9533 = arith.constant 10 : i64
      %9534 = func.call @cc_make_string(%9532, %9533) : (!llvm.ptr, i64) -> i64
      %9535 = llvm.mlir.addressof @str770 : !llvm.ptr
      %9536 = arith.constant 11 : i64
      %9537 = func.call @cc_make_string(%9535, %9536) : (!llvm.ptr, i64) -> i64
      %9538 = func.call @cc_intern(%9534, %9537) : (i64, i64) -> i64
      %9539 = func.call @cc_nil_value() : () -> i64
      %9540 = func.call @cc_cons(%9538, %9539) : (i64, i64) -> i64
      %9541 = func.call @cc_values_pack(%9540) : (i64) -> i64
      func.call @stack_push_pointer(%9538) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9542 = func.call @stack_pop_pointer() : () -> i64
      %9543 = func.call @stack_pop_pointer() : () -> i64
      %9544 = func.call @cc_cons(%9543, %9542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9544) : (i64) -> ()
      %9545 = func.call @stack_pop_pointer() : () -> i64
      %9546 = func.call @stack_pop_pointer() : () -> i64
      %9547 = func.call @cc_cons(%9546, %9545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9547) : (i64) -> ()
      %9548 = func.call @stack_pop_pointer() : () -> i64
      %9549 = llvm.mlir.addressof @str771 : !llvm.ptr
      %9550 = arith.constant 11 : i64
      %9551 = func.call @cc_make_string(%9549, %9550) : (!llvm.ptr, i64) -> i64
      %9552 = llvm.mlir.addressof @str772 : !llvm.ptr
      %9553 = arith.constant 7 : i64
      %9554 = func.call @cc_make_string(%9552, %9553) : (!llvm.ptr, i64) -> i64
      %9555 = func.call @cc_intern(%9551, %9554) : (i64, i64) -> i64
      %9556 = func.call @cc_nil_value() : () -> i64
      %9557 = func.call @cc_cons(%9555, %9556) : (i64, i64) -> i64
      %9558 = func.call @cc_values_pack(%9557) : (i64) -> i64
      func.call @stack_push_pointer(%9555) : (i64) -> ()
      %9559 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9560 = func.call @stack_pop_pointer() : () -> i64
      %9561 = llvm.mlir.addressof @str773 : !llvm.ptr
      %9562 = arith.constant 4 : i64
      %9563 = func.call @cc_make_string(%9561, %9562) : (!llvm.ptr, i64) -> i64
      %9564 = llvm.mlir.addressof @str774 : !llvm.ptr
      %9565 = arith.constant 7 : i64
      %9566 = func.call @cc_make_string(%9564, %9565) : (!llvm.ptr, i64) -> i64
      %9567 = func.call @cc_intern(%9563, %9566) : (i64, i64) -> i64
      %9568 = func.call @cc_nil_value() : () -> i64
      %9569 = func.call @cc_cons(%9567, %9568) : (i64, i64) -> i64
      %9570 = func.call @cc_values_pack(%9569) : (i64) -> i64
      func.call @stack_push_pointer(%9567) : (i64) -> ()
      %9571 = func.call @stack_pop_pointer() : () -> i64
      %9572 = llvm.mlir.addressof @str775 : !llvm.ptr
      %9573 = arith.constant 5 : i64
      %9574 = func.call @cc_make_string(%9572, %9573) : (!llvm.ptr, i64) -> i64
      %9575 = func.call @cc_nil_value() : () -> i64
      %9576 = func.call @cc_intern(%9574, %9575) : (i64, i64) -> i64
      %9577 = func.call @cc_nil_value() : () -> i64
      %9578 = func.call @cc_cons(%9576, %9577) : (i64, i64) -> i64
      %9579 = func.call @cc_values_pack(%9578) : (i64) -> i64
      func.call @stack_push_pointer(%9576) : (i64) -> ()
      %9580 = func.call @stack_pop_pointer() : () -> i64
      %9581 = func.call @cc_nil_value() : () -> i64
      %9582 = func.call @cc_errorp(%9250) : (i64) -> i64
      %9583 = arith.cmpi ne, %9582, %9581 : i64
      %9584 = arith.cmpi eq, %9581, %9581 : i64
      %9585 = arith.andi %9583, %9584 : i1
      %9586 = scf.if %9585 -> (i64) {
        scf.yield %9250 : i64
      } else {
        scf.yield %9581 : i64
      }
      %9587 = func.call @cc_errorp(%9417) : (i64) -> i64
      %9588 = arith.cmpi ne, %9587, %9581 : i64
      %9589 = arith.cmpi eq, %9586, %9581 : i64
      %9590 = arith.andi %9588, %9589 : i1
      %9591 = scf.if %9590 -> (i64) {
        scf.yield %9417 : i64
      } else {
        scf.yield %9586 : i64
      }
      %9592 = func.call @cc_errorp(%9523) : (i64) -> i64
      %9593 = arith.cmpi ne, %9592, %9581 : i64
      %9594 = arith.cmpi eq, %9591, %9581 : i64
      %9595 = arith.andi %9593, %9594 : i1
      %9596 = scf.if %9595 -> (i64) {
        scf.yield %9523 : i64
      } else {
        scf.yield %9591 : i64
      }
      %9597 = func.call @cc_errorp(%9548) : (i64) -> i64
      %9598 = arith.cmpi ne, %9597, %9581 : i64
      %9599 = arith.cmpi eq, %9596, %9581 : i64
      %9600 = arith.andi %9598, %9599 : i1
      %9601 = scf.if %9600 -> (i64) {
        scf.yield %9548 : i64
      } else {
        scf.yield %9596 : i64
      }
      %9602 = func.call @cc_errorp(%9559) : (i64) -> i64
      %9603 = arith.cmpi ne, %9602, %9581 : i64
      %9604 = arith.cmpi eq, %9601, %9581 : i64
      %9605 = arith.andi %9603, %9604 : i1
      %9606 = scf.if %9605 -> (i64) {
        scf.yield %9559 : i64
      } else {
        scf.yield %9601 : i64
      }
      %9607 = func.call @cc_errorp(%9560) : (i64) -> i64
      %9608 = arith.cmpi ne, %9607, %9581 : i64
      %9609 = arith.cmpi eq, %9606, %9581 : i64
      %9610 = arith.andi %9608, %9609 : i1
      %9611 = scf.if %9610 -> (i64) {
        scf.yield %9560 : i64
      } else {
        scf.yield %9606 : i64
      }
      %9612 = func.call @cc_errorp(%9571) : (i64) -> i64
      %9613 = arith.cmpi ne, %9612, %9581 : i64
      %9614 = arith.cmpi eq, %9611, %9581 : i64
      %9615 = arith.andi %9613, %9614 : i1
      %9616 = scf.if %9615 -> (i64) {
        scf.yield %9571 : i64
      } else {
        scf.yield %9611 : i64
      }
      %9617 = func.call @cc_errorp(%9580) : (i64) -> i64
      %9618 = arith.cmpi ne, %9617, %9581 : i64
      %9619 = arith.cmpi eq, %9616, %9581 : i64
      %9620 = arith.andi %9618, %9619 : i1
      %9621 = scf.if %9620 -> (i64) {
        scf.yield %9580 : i64
      } else {
        scf.yield %9616 : i64
      }
      %9622 = arith.cmpi ne, %9621, %9581 : i64
      scf.if %9622 {
        func.call @stack_push_pointer(%9621) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9250) : (i64) -> ()
        func.call @stack_push_pointer(%9417) : (i64) -> ()
        func.call @stack_push_pointer(%9523) : (i64) -> ()
        func.call @stack_push_pointer(%9548) : (i64) -> ()
        func.call @stack_push_pointer(%9559) : (i64) -> ()
        func.call @stack_push_pointer(%9560) : (i64) -> ()
        func.call @stack_push_pointer(%9571) : (i64) -> ()
        func.call @stack_push_pointer(%9580) : (i64) -> ()
        %9623 = llvm.mlir.addressof @str776 : !llvm.ptr
        %9624 = func.call @cc_make_function_ref_const(%9623) : (!llvm.ptr) -> i64
        %9625 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9624, %9625) : (i64, i64) -> ()
      }
      %9626 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9626 : i64
    }
    %9627 = func.call @cc_nil_value() : () -> i64
    %9628 = func.call @cc_errorp(%9241) : (i64) -> i64
    %9629 = arith.cmpi ne, %9628, %9627 : i64
    %9630 = scf.if %9629 -> (i64) {
      scf.yield %9241 : i64
    } else {
      %9631 = llvm.mlir.addressof @str777 : !llvm.ptr
      %9632 = arith.constant 39 : i64
      %9633 = func.call @cc_make_string(%9631, %9632) : (!llvm.ptr, i64) -> i64
      %9634 = func.call @cc_nil_value() : () -> i64
      %9635 = func.call @cc_intern(%9633, %9634) : (i64, i64) -> i64
      %9636 = func.call @cc_nil_value() : () -> i64
      %9637 = func.call @cc_cons(%9635, %9636) : (i64, i64) -> i64
      %9638 = func.call @cc_values_pack(%9637) : (i64) -> i64
      func.call @stack_push_pointer(%9635) : (i64) -> ()
      %9639 = func.call @stack_pop_pointer() : () -> i64
      %9640 = llvm.mlir.addressof @str778 : !llvm.ptr
      %9641 = arith.constant 13 : i64
      %9642 = func.call @cc_make_string(%9640, %9641) : (!llvm.ptr, i64) -> i64
      %9643 = llvm.mlir.addressof @str779 : !llvm.ptr
      %9644 = arith.constant 11 : i64
      %9645 = func.call @cc_make_string(%9643, %9644) : (!llvm.ptr, i64) -> i64
      %9646 = func.call @cc_intern(%9642, %9645) : (i64, i64) -> i64
      %9647 = func.call @cc_nil_value() : () -> i64
      %9648 = func.call @cc_cons(%9646, %9647) : (i64, i64) -> i64
      %9649 = func.call @cc_values_pack(%9648) : (i64) -> i64
      func.call @stack_push_pointer(%9646) : (i64) -> ()
      %9650 = llvm.mlir.addressof @str780 : !llvm.ptr
      %9651 = arith.constant 6 : i64
      %9652 = func.call @cc_make_string(%9650, %9651) : (!llvm.ptr, i64) -> i64
      %9653 = func.call @cc_nil_value() : () -> i64
      %9654 = func.call @cc_intern(%9652, %9653) : (i64, i64) -> i64
      %9655 = func.call @cc_nil_value() : () -> i64
      %9656 = func.call @cc_cons(%9654, %9655) : (i64, i64) -> i64
      %9657 = func.call @cc_values_pack(%9656) : (i64) -> i64
      func.call @stack_push_pointer(%9654) : (i64) -> ()
      %9658 = llvm.mlir.addressof @str781 : !llvm.ptr
      %9659 = arith.constant 19 : i64
      %9660 = func.call @cc_make_string(%9658, %9659) : (!llvm.ptr, i64) -> i64
      %9661 = func.call @cc_nil_value() : () -> i64
      %9662 = func.call @cc_intern(%9660, %9661) : (i64, i64) -> i64
      %9663 = func.call @cc_nil_value() : () -> i64
      %9664 = func.call @cc_cons(%9662, %9663) : (i64, i64) -> i64
      %9665 = func.call @cc_values_pack(%9664) : (i64) -> i64
      func.call @stack_push_pointer(%9662) : (i64) -> ()
      %9666 = llvm.mlir.addressof @str782 : !llvm.ptr
      %9667 = arith.constant 7 : i64
      %9668 = func.call @cc_make_string(%9666, %9667) : (!llvm.ptr, i64) -> i64
      %9669 = llvm.mlir.addressof @str783 : !llvm.ptr
      %9670 = arith.constant 11 : i64
      %9671 = func.call @cc_make_string(%9669, %9670) : (!llvm.ptr, i64) -> i64
      %9672 = func.call @cc_intern(%9668, %9671) : (i64, i64) -> i64
      %9673 = func.call @cc_nil_value() : () -> i64
      %9674 = func.call @cc_cons(%9672, %9673) : (i64, i64) -> i64
      %9675 = func.call @cc_values_pack(%9674) : (i64) -> i64
      func.call @stack_push_pointer(%9672) : (i64) -> ()
      %9676 = llvm.mlir.addressof @str784 : !llvm.ptr
      %9677 = arith.constant 7 : i64
      %9678 = func.call @cc_make_string(%9676, %9677) : (!llvm.ptr, i64) -> i64
      %9679 = llvm.mlir.addressof @str785 : !llvm.ptr
      %9680 = arith.constant 11 : i64
      %9681 = func.call @cc_make_string(%9679, %9680) : (!llvm.ptr, i64) -> i64
      %9682 = func.call @cc_intern(%9678, %9681) : (i64, i64) -> i64
      %9683 = func.call @cc_nil_value() : () -> i64
      %9684 = func.call @cc_cons(%9682, %9683) : (i64, i64) -> i64
      %9685 = func.call @cc_values_pack(%9684) : (i64) -> i64
      func.call @stack_push_pointer(%9682) : (i64) -> ()
      %9686 = llvm.mlir.addressof @str786 : !llvm.ptr
      %9687 = arith.constant 9 : i64
      %9688 = func.call @cc_make_string(%9686, %9687) : (!llvm.ptr, i64) -> i64
      %9689 = llvm.mlir.addressof @str787 : !llvm.ptr
      %9690 = arith.constant 11 : i64
      %9691 = func.call @cc_make_string(%9689, %9690) : (!llvm.ptr, i64) -> i64
      %9692 = func.call @cc_intern(%9688, %9691) : (i64, i64) -> i64
      %9693 = func.call @cc_nil_value() : () -> i64
      %9694 = func.call @cc_cons(%9692, %9693) : (i64, i64) -> i64
      %9695 = func.call @cc_values_pack(%9694) : (i64) -> i64
      func.call @stack_push_pointer(%9692) : (i64) -> ()
      %9696 = llvm.mlir.addressof @str788 : !llvm.ptr
      %9697 = arith.constant 10 : i64
      %9698 = func.call @cc_make_string(%9696, %9697) : (!llvm.ptr, i64) -> i64
      %9699 = llvm.mlir.addressof @str789 : !llvm.ptr
      %9700 = arith.constant 11 : i64
      %9701 = func.call @cc_make_string(%9699, %9700) : (!llvm.ptr, i64) -> i64
      %9702 = func.call @cc_intern(%9698, %9701) : (i64, i64) -> i64
      %9703 = func.call @cc_nil_value() : () -> i64
      %9704 = func.call @cc_cons(%9702, %9703) : (i64, i64) -> i64
      %9705 = func.call @cc_values_pack(%9704) : (i64) -> i64
      func.call @stack_push_pointer(%9702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9706 = func.call @stack_pop_pointer() : () -> i64
      %9707 = func.call @stack_pop_pointer() : () -> i64
      %9708 = func.call @cc_cons(%9707, %9706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9708) : (i64) -> ()
      %9709 = func.call @stack_pop_pointer() : () -> i64
      %9710 = func.call @stack_pop_pointer() : () -> i64
      %9711 = func.call @cc_cons(%9710, %9709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9712 = func.call @stack_pop_pointer() : () -> i64
      %9713 = func.call @stack_pop_pointer() : () -> i64
      %9714 = func.call @cc_cons(%9713, %9712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9714) : (i64) -> ()
      %9715 = func.call @stack_pop_pointer() : () -> i64
      %9716 = func.call @stack_pop_pointer() : () -> i64
      %9717 = func.call @cc_cons(%9716, %9715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9717) : (i64) -> ()
      %9718 = llvm.mlir.addressof @str790 : !llvm.ptr
      %9719 = arith.constant 10 : i64
      %9720 = func.call @cc_make_string(%9718, %9719) : (!llvm.ptr, i64) -> i64
      %9721 = llvm.mlir.addressof @str791 : !llvm.ptr
      %9722 = arith.constant 11 : i64
      %9723 = func.call @cc_make_string(%9721, %9722) : (!llvm.ptr, i64) -> i64
      %9724 = func.call @cc_intern(%9720, %9723) : (i64, i64) -> i64
      %9725 = func.call @cc_nil_value() : () -> i64
      %9726 = func.call @cc_cons(%9724, %9725) : (i64, i64) -> i64
      %9727 = func.call @cc_values_pack(%9726) : (i64) -> i64
      func.call @stack_push_pointer(%9724) : (i64) -> ()
      %9728 = llvm.mlir.addressof @str792 : !llvm.ptr
      %9729 = arith.constant 4 : i64
      %9730 = func.call @cc_make_string(%9728, %9729) : (!llvm.ptr, i64) -> i64
      %9731 = llvm.mlir.addressof @str793 : !llvm.ptr
      %9732 = arith.constant 11 : i64
      %9733 = func.call @cc_make_string(%9731, %9732) : (!llvm.ptr, i64) -> i64
      %9734 = func.call @cc_intern(%9730, %9733) : (i64, i64) -> i64
      %9735 = func.call @cc_nil_value() : () -> i64
      %9736 = func.call @cc_cons(%9734, %9735) : (i64, i64) -> i64
      %9737 = func.call @cc_values_pack(%9736) : (i64) -> i64
      func.call @stack_push_pointer(%9734) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9738 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%9738) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9739 = func.call @stack_pop_pointer() : () -> i64
      %9740 = func.call @stack_pop_pointer() : () -> i64
      %9741 = func.call @cc_cons(%9740, %9739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9741) : (i64) -> ()
      %9742 = func.call @stack_pop_pointer() : () -> i64
      %9743 = func.call @stack_pop_pointer() : () -> i64
      %9744 = func.call @cc_cons(%9743, %9742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9744) : (i64) -> ()
      %9745 = func.call @stack_pop_pointer() : () -> i64
      %9746 = func.call @stack_pop_pointer() : () -> i64
      %9747 = func.call @cc_cons(%9746, %9745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9747) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9748 = func.call @stack_pop_pointer() : () -> i64
      %9749 = func.call @stack_pop_pointer() : () -> i64
      %9750 = func.call @cc_cons(%9749, %9748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9750) : (i64) -> ()
      %9751 = func.call @stack_pop_pointer() : () -> i64
      %9752 = func.call @stack_pop_pointer() : () -> i64
      %9753 = func.call @cc_cons(%9752, %9751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9753) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9754 = func.call @stack_pop_pointer() : () -> i64
      %9755 = func.call @stack_pop_pointer() : () -> i64
      %9756 = func.call @cc_cons(%9755, %9754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9756) : (i64) -> ()
      %9757 = func.call @stack_pop_pointer() : () -> i64
      %9758 = func.call @stack_pop_pointer() : () -> i64
      %9759 = func.call @cc_cons(%9758, %9757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9759) : (i64) -> ()
      %9760 = func.call @stack_pop_pointer() : () -> i64
      %9761 = func.call @stack_pop_pointer() : () -> i64
      %9762 = func.call @cc_cons(%9761, %9760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9763 = func.call @stack_pop_pointer() : () -> i64
      %9764 = func.call @stack_pop_pointer() : () -> i64
      %9765 = func.call @cc_cons(%9764, %9763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9765) : (i64) -> ()
      %9766 = func.call @stack_pop_pointer() : () -> i64
      %9767 = func.call @stack_pop_pointer() : () -> i64
      %9768 = func.call @cc_cons(%9767, %9766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9768) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9769 = func.call @stack_pop_pointer() : () -> i64
      %9770 = func.call @stack_pop_pointer() : () -> i64
      %9771 = func.call @cc_cons(%9770, %9769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9771) : (i64) -> ()
      %9772 = func.call @stack_pop_pointer() : () -> i64
      %9773 = func.call @stack_pop_pointer() : () -> i64
      %9774 = func.call @cc_cons(%9773, %9772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9774) : (i64) -> ()
      %9775 = func.call @stack_pop_pointer() : () -> i64
      %9776 = func.call @stack_pop_pointer() : () -> i64
      %9777 = func.call @cc_cons(%9776, %9775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9777) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9778 = func.call @stack_pop_pointer() : () -> i64
      %9779 = func.call @stack_pop_pointer() : () -> i64
      %9780 = func.call @cc_cons(%9779, %9778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9780) : (i64) -> ()
      %9781 = func.call @stack_pop_pointer() : () -> i64
      %9782 = func.call @stack_pop_pointer() : () -> i64
      %9783 = func.call @cc_cons(%9782, %9781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9783) : (i64) -> ()
      %9784 = func.call @stack_pop_pointer() : () -> i64
      %9867 = arith.constant 15079495958559 : i64
      %9868 = arith.constant 0 : i64
      %9869 = func.call @cc_make_closure(%9867, %9868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9869) : (i64) -> ()
      %9870 = func.call @stack_pop_pointer() : () -> i64
      %9871 = llvm.mlir.addressof @str795 : !llvm.ptr
      %9872 = arith.constant 4 : i64
      %9873 = func.call @cc_make_string(%9871, %9872) : (!llvm.ptr, i64) -> i64
      %9874 = func.call @cc_nil_value() : () -> i64
      %9875 = func.call @cc_intern(%9873, %9874) : (i64, i64) -> i64
      %9876 = func.call @cc_nil_value() : () -> i64
      %9877 = func.call @cc_cons(%9875, %9876) : (i64, i64) -> i64
      %9878 = func.call @cc_values_pack(%9877) : (i64) -> i64
      func.call @stack_push_pointer(%9875) : (i64) -> ()
      %9879 = llvm.mlir.addressof @str796 : !llvm.ptr
      %9880 = arith.constant 10 : i64
      %9881 = func.call @cc_make_string(%9879, %9880) : (!llvm.ptr, i64) -> i64
      %9882 = llvm.mlir.addressof @str797 : !llvm.ptr
      %9883 = arith.constant 11 : i64
      %9884 = func.call @cc_make_string(%9882, %9883) : (!llvm.ptr, i64) -> i64
      %9885 = func.call @cc_intern(%9881, %9884) : (i64, i64) -> i64
      %9886 = func.call @cc_nil_value() : () -> i64
      %9887 = func.call @cc_cons(%9885, %9886) : (i64, i64) -> i64
      %9888 = func.call @cc_values_pack(%9887) : (i64) -> i64
      func.call @stack_push_pointer(%9885) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9889 = func.call @stack_pop_pointer() : () -> i64
      %9890 = func.call @stack_pop_pointer() : () -> i64
      %9891 = func.call @cc_cons(%9890, %9889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9891) : (i64) -> ()
      %9892 = func.call @stack_pop_pointer() : () -> i64
      %9893 = func.call @stack_pop_pointer() : () -> i64
      %9894 = func.call @cc_cons(%9893, %9892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9894) : (i64) -> ()
      %9895 = func.call @stack_pop_pointer() : () -> i64
      %9896 = llvm.mlir.addressof @str798 : !llvm.ptr
      %9897 = arith.constant 11 : i64
      %9898 = func.call @cc_make_string(%9896, %9897) : (!llvm.ptr, i64) -> i64
      %9899 = llvm.mlir.addressof @str799 : !llvm.ptr
      %9900 = arith.constant 7 : i64
      %9901 = func.call @cc_make_string(%9899, %9900) : (!llvm.ptr, i64) -> i64
      %9902 = func.call @cc_intern(%9898, %9901) : (i64, i64) -> i64
      %9903 = func.call @cc_nil_value() : () -> i64
      %9904 = func.call @cc_cons(%9902, %9903) : (i64, i64) -> i64
      %9905 = func.call @cc_values_pack(%9904) : (i64) -> i64
      func.call @stack_push_pointer(%9902) : (i64) -> ()
      %9906 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9907 = func.call @stack_pop_pointer() : () -> i64
      %9908 = llvm.mlir.addressof @str800 : !llvm.ptr
      %9909 = arith.constant 4 : i64
      %9910 = func.call @cc_make_string(%9908, %9909) : (!llvm.ptr, i64) -> i64
      %9911 = llvm.mlir.addressof @str801 : !llvm.ptr
      %9912 = arith.constant 7 : i64
      %9913 = func.call @cc_make_string(%9911, %9912) : (!llvm.ptr, i64) -> i64
      %9914 = func.call @cc_intern(%9910, %9913) : (i64, i64) -> i64
      %9915 = func.call @cc_nil_value() : () -> i64
      %9916 = func.call @cc_cons(%9914, %9915) : (i64, i64) -> i64
      %9917 = func.call @cc_values_pack(%9916) : (i64) -> i64
      func.call @stack_push_pointer(%9914) : (i64) -> ()
      %9918 = func.call @stack_pop_pointer() : () -> i64
      %9919 = llvm.mlir.addressof @str802 : !llvm.ptr
      %9920 = arith.constant 5 : i64
      %9921 = func.call @cc_make_string(%9919, %9920) : (!llvm.ptr, i64) -> i64
      %9922 = func.call @cc_nil_value() : () -> i64
      %9923 = func.call @cc_intern(%9921, %9922) : (i64, i64) -> i64
      %9924 = func.call @cc_nil_value() : () -> i64
      %9925 = func.call @cc_cons(%9923, %9924) : (i64, i64) -> i64
      %9926 = func.call @cc_values_pack(%9925) : (i64) -> i64
      func.call @stack_push_pointer(%9923) : (i64) -> ()
      %9927 = func.call @stack_pop_pointer() : () -> i64
      %9928 = func.call @cc_nil_value() : () -> i64
      %9929 = func.call @cc_errorp(%9639) : (i64) -> i64
      %9930 = arith.cmpi ne, %9929, %9928 : i64
      %9931 = arith.cmpi eq, %9928, %9928 : i64
      %9932 = arith.andi %9930, %9931 : i1
      %9933 = scf.if %9932 -> (i64) {
        scf.yield %9639 : i64
      } else {
        scf.yield %9928 : i64
      }
      %9934 = func.call @cc_errorp(%9784) : (i64) -> i64
      %9935 = arith.cmpi ne, %9934, %9928 : i64
      %9936 = arith.cmpi eq, %9933, %9928 : i64
      %9937 = arith.andi %9935, %9936 : i1
      %9938 = scf.if %9937 -> (i64) {
        scf.yield %9784 : i64
      } else {
        scf.yield %9933 : i64
      }
      %9939 = func.call @cc_errorp(%9870) : (i64) -> i64
      %9940 = arith.cmpi ne, %9939, %9928 : i64
      %9941 = arith.cmpi eq, %9938, %9928 : i64
      %9942 = arith.andi %9940, %9941 : i1
      %9943 = scf.if %9942 -> (i64) {
        scf.yield %9870 : i64
      } else {
        scf.yield %9938 : i64
      }
      %9944 = func.call @cc_errorp(%9895) : (i64) -> i64
      %9945 = arith.cmpi ne, %9944, %9928 : i64
      %9946 = arith.cmpi eq, %9943, %9928 : i64
      %9947 = arith.andi %9945, %9946 : i1
      %9948 = scf.if %9947 -> (i64) {
        scf.yield %9895 : i64
      } else {
        scf.yield %9943 : i64
      }
      %9949 = func.call @cc_errorp(%9906) : (i64) -> i64
      %9950 = arith.cmpi ne, %9949, %9928 : i64
      %9951 = arith.cmpi eq, %9948, %9928 : i64
      %9952 = arith.andi %9950, %9951 : i1
      %9953 = scf.if %9952 -> (i64) {
        scf.yield %9906 : i64
      } else {
        scf.yield %9948 : i64
      }
      %9954 = func.call @cc_errorp(%9907) : (i64) -> i64
      %9955 = arith.cmpi ne, %9954, %9928 : i64
      %9956 = arith.cmpi eq, %9953, %9928 : i64
      %9957 = arith.andi %9955, %9956 : i1
      %9958 = scf.if %9957 -> (i64) {
        scf.yield %9907 : i64
      } else {
        scf.yield %9953 : i64
      }
      %9959 = func.call @cc_errorp(%9918) : (i64) -> i64
      %9960 = arith.cmpi ne, %9959, %9928 : i64
      %9961 = arith.cmpi eq, %9958, %9928 : i64
      %9962 = arith.andi %9960, %9961 : i1
      %9963 = scf.if %9962 -> (i64) {
        scf.yield %9918 : i64
      } else {
        scf.yield %9958 : i64
      }
      %9964 = func.call @cc_errorp(%9927) : (i64) -> i64
      %9965 = arith.cmpi ne, %9964, %9928 : i64
      %9966 = arith.cmpi eq, %9963, %9928 : i64
      %9967 = arith.andi %9965, %9966 : i1
      %9968 = scf.if %9967 -> (i64) {
        scf.yield %9927 : i64
      } else {
        scf.yield %9963 : i64
      }
      %9969 = arith.cmpi ne, %9968, %9928 : i64
      scf.if %9969 {
        func.call @stack_push_pointer(%9968) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9639) : (i64) -> ()
        func.call @stack_push_pointer(%9784) : (i64) -> ()
        func.call @stack_push_pointer(%9870) : (i64) -> ()
        func.call @stack_push_pointer(%9895) : (i64) -> ()
        func.call @stack_push_pointer(%9906) : (i64) -> ()
        func.call @stack_push_pointer(%9907) : (i64) -> ()
        func.call @stack_push_pointer(%9918) : (i64) -> ()
        func.call @stack_push_pointer(%9927) : (i64) -> ()
        %9970 = llvm.mlir.addressof @str803 : !llvm.ptr
        %9971 = func.call @cc_make_function_ref_const(%9970) : (!llvm.ptr) -> i64
        %9972 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9971, %9972) : (i64, i64) -> ()
      }
      %9973 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9973 : i64
    }
    %9974 = func.call @cc_nil_value() : () -> i64
    %9975 = func.call @cc_errorp(%9630) : (i64) -> i64
    %9976 = arith.cmpi ne, %9975, %9974 : i64
    %9977 = scf.if %9976 -> (i64) {
      scf.yield %9630 : i64
    } else {
      %9978 = llvm.mlir.addressof @str804 : !llvm.ptr
      %9979 = arith.constant 39 : i64
      %9980 = func.call @cc_make_string(%9978, %9979) : (!llvm.ptr, i64) -> i64
      %9981 = func.call @cc_nil_value() : () -> i64
      %9982 = func.call @cc_intern(%9980, %9981) : (i64, i64) -> i64
      %9983 = func.call @cc_nil_value() : () -> i64
      %9984 = func.call @cc_cons(%9982, %9983) : (i64, i64) -> i64
      %9985 = func.call @cc_values_pack(%9984) : (i64) -> i64
      func.call @stack_push_pointer(%9982) : (i64) -> ()
      %9986 = func.call @stack_pop_pointer() : () -> i64
      %9987 = llvm.mlir.addressof @str805 : !llvm.ptr
      %9988 = arith.constant 13 : i64
      %9989 = func.call @cc_make_string(%9987, %9988) : (!llvm.ptr, i64) -> i64
      %9990 = llvm.mlir.addressof @str806 : !llvm.ptr
      %9991 = arith.constant 11 : i64
      %9992 = func.call @cc_make_string(%9990, %9991) : (!llvm.ptr, i64) -> i64
      %9993 = func.call @cc_intern(%9989, %9992) : (i64, i64) -> i64
      %9994 = func.call @cc_nil_value() : () -> i64
      %9995 = func.call @cc_cons(%9993, %9994) : (i64, i64) -> i64
      %9996 = func.call @cc_values_pack(%9995) : (i64) -> i64
      func.call @stack_push_pointer(%9993) : (i64) -> ()
      %9997 = llvm.mlir.addressof @str807 : !llvm.ptr
      %9998 = arith.constant 6 : i64
      %9999 = func.call @cc_make_string(%9997, %9998) : (!llvm.ptr, i64) -> i64
      %10000 = func.call @cc_nil_value() : () -> i64
      %10001 = func.call @cc_intern(%9999, %10000) : (i64, i64) -> i64
      %10002 = func.call @cc_nil_value() : () -> i64
      %10003 = func.call @cc_cons(%10001, %10002) : (i64, i64) -> i64
      %10004 = func.call @cc_values_pack(%10003) : (i64) -> i64
      func.call @stack_push_pointer(%10001) : (i64) -> ()
      %10005 = llvm.mlir.addressof @str808 : !llvm.ptr
      %10006 = arith.constant 19 : i64
      %10007 = func.call @cc_make_string(%10005, %10006) : (!llvm.ptr, i64) -> i64
      %10008 = func.call @cc_nil_value() : () -> i64
      %10009 = func.call @cc_intern(%10007, %10008) : (i64, i64) -> i64
      %10010 = func.call @cc_nil_value() : () -> i64
      %10011 = func.call @cc_cons(%10009, %10010) : (i64, i64) -> i64
      %10012 = func.call @cc_values_pack(%10011) : (i64) -> i64
      func.call @stack_push_pointer(%10009) : (i64) -> ()
      %10013 = llvm.mlir.addressof @str809 : !llvm.ptr
      %10014 = arith.constant 7 : i64
      %10015 = func.call @cc_make_string(%10013, %10014) : (!llvm.ptr, i64) -> i64
      %10016 = llvm.mlir.addressof @str810 : !llvm.ptr
      %10017 = arith.constant 11 : i64
      %10018 = func.call @cc_make_string(%10016, %10017) : (!llvm.ptr, i64) -> i64
      %10019 = func.call @cc_intern(%10015, %10018) : (i64, i64) -> i64
      %10020 = func.call @cc_nil_value() : () -> i64
      %10021 = func.call @cc_cons(%10019, %10020) : (i64, i64) -> i64
      %10022 = func.call @cc_values_pack(%10021) : (i64) -> i64
      func.call @stack_push_pointer(%10019) : (i64) -> ()
      %10023 = llvm.mlir.addressof @str811 : !llvm.ptr
      %10024 = arith.constant 7 : i64
      %10025 = func.call @cc_make_string(%10023, %10024) : (!llvm.ptr, i64) -> i64
      %10026 = llvm.mlir.addressof @str812 : !llvm.ptr
      %10027 = arith.constant 11 : i64
      %10028 = func.call @cc_make_string(%10026, %10027) : (!llvm.ptr, i64) -> i64
      %10029 = func.call @cc_intern(%10025, %10028) : (i64, i64) -> i64
      %10030 = func.call @cc_nil_value() : () -> i64
      %10031 = func.call @cc_cons(%10029, %10030) : (i64, i64) -> i64
      %10032 = func.call @cc_values_pack(%10031) : (i64) -> i64
      func.call @stack_push_pointer(%10029) : (i64) -> ()
      %10033 = llvm.mlir.addressof @str813 : !llvm.ptr
      %10034 = arith.constant 9 : i64
      %10035 = func.call @cc_make_string(%10033, %10034) : (!llvm.ptr, i64) -> i64
      %10036 = llvm.mlir.addressof @str814 : !llvm.ptr
      %10037 = arith.constant 11 : i64
      %10038 = func.call @cc_make_string(%10036, %10037) : (!llvm.ptr, i64) -> i64
      %10039 = func.call @cc_intern(%10035, %10038) : (i64, i64) -> i64
      %10040 = func.call @cc_nil_value() : () -> i64
      %10041 = func.call @cc_cons(%10039, %10040) : (i64, i64) -> i64
      %10042 = func.call @cc_values_pack(%10041) : (i64) -> i64
      func.call @stack_push_pointer(%10039) : (i64) -> ()
      %10043 = llvm.mlir.addressof @str815 : !llvm.ptr
      %10044 = arith.constant 10 : i64
      %10045 = func.call @cc_make_string(%10043, %10044) : (!llvm.ptr, i64) -> i64
      %10046 = llvm.mlir.addressof @str816 : !llvm.ptr
      %10047 = arith.constant 11 : i64
      %10048 = func.call @cc_make_string(%10046, %10047) : (!llvm.ptr, i64) -> i64
      %10049 = func.call @cc_intern(%10045, %10048) : (i64, i64) -> i64
      %10050 = func.call @cc_nil_value() : () -> i64
      %10051 = func.call @cc_cons(%10049, %10050) : (i64, i64) -> i64
      %10052 = func.call @cc_values_pack(%10051) : (i64) -> i64
      func.call @stack_push_pointer(%10049) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10053 = func.call @stack_pop_pointer() : () -> i64
      %10054 = func.call @stack_pop_pointer() : () -> i64
      %10055 = func.call @cc_cons(%10054, %10053) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10055) : (i64) -> ()
      %10056 = func.call @stack_pop_pointer() : () -> i64
      %10057 = func.call @stack_pop_pointer() : () -> i64
      %10058 = func.call @cc_cons(%10057, %10056) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10058) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10059 = func.call @stack_pop_pointer() : () -> i64
      %10060 = func.call @stack_pop_pointer() : () -> i64
      %10061 = func.call @cc_cons(%10060, %10059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10061) : (i64) -> ()
      %10062 = func.call @stack_pop_pointer() : () -> i64
      %10063 = func.call @stack_pop_pointer() : () -> i64
      %10064 = func.call @cc_cons(%10063, %10062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10064) : (i64) -> ()
      %10065 = llvm.mlir.addressof @str817 : !llvm.ptr
      %10066 = arith.constant 10 : i64
      %10067 = func.call @cc_make_string(%10065, %10066) : (!llvm.ptr, i64) -> i64
      %10068 = llvm.mlir.addressof @str818 : !llvm.ptr
      %10069 = arith.constant 11 : i64
      %10070 = func.call @cc_make_string(%10068, %10069) : (!llvm.ptr, i64) -> i64
      %10071 = func.call @cc_intern(%10067, %10070) : (i64, i64) -> i64
      %10072 = func.call @cc_nil_value() : () -> i64
      %10073 = func.call @cc_cons(%10071, %10072) : (i64, i64) -> i64
      %10074 = func.call @cc_values_pack(%10073) : (i64) -> i64
      func.call @stack_push_pointer(%10071) : (i64) -> ()
      %10075 = llvm.mlir.addressof @str819 : !llvm.ptr
      %10076 = arith.constant 4 : i64
      %10077 = func.call @cc_make_string(%10075, %10076) : (!llvm.ptr, i64) -> i64
      %10078 = llvm.mlir.addressof @str820 : !llvm.ptr
      %10079 = arith.constant 11 : i64
      %10080 = func.call @cc_make_string(%10078, %10079) : (!llvm.ptr, i64) -> i64
      %10081 = func.call @cc_intern(%10077, %10080) : (i64, i64) -> i64
      %10082 = func.call @cc_nil_value() : () -> i64
      %10083 = func.call @cc_cons(%10081, %10082) : (i64, i64) -> i64
      %10084 = func.call @cc_values_pack(%10083) : (i64) -> i64
      func.call @stack_push_pointer(%10081) : (i64) -> ()
      %10085 = arith.constant 97 : i64
      %10086 = func.call @cc_box_character(%10085) : (i64) -> i64
      func.call @stack_push_pointer(%10086) : (i64) -> ()
      %10087 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%10087) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10088 = func.call @stack_pop_pointer() : () -> i64
      %10089 = func.call @stack_pop_pointer() : () -> i64
      %10090 = func.call @cc_cons(%10089, %10088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10090) : (i64) -> ()
      %10091 = func.call @stack_pop_pointer() : () -> i64
      %10092 = func.call @stack_pop_pointer() : () -> i64
      %10093 = func.call @cc_cons(%10092, %10091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10093) : (i64) -> ()
      %10094 = func.call @stack_pop_pointer() : () -> i64
      %10095 = func.call @stack_pop_pointer() : () -> i64
      %10096 = func.call @cc_cons(%10095, %10094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10096) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10097 = func.call @stack_pop_pointer() : () -> i64
      %10098 = func.call @stack_pop_pointer() : () -> i64
      %10099 = func.call @cc_cons(%10098, %10097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10099) : (i64) -> ()
      %10100 = func.call @stack_pop_pointer() : () -> i64
      %10101 = func.call @stack_pop_pointer() : () -> i64
      %10102 = func.call @cc_cons(%10101, %10100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10102) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10103 = func.call @stack_pop_pointer() : () -> i64
      %10104 = func.call @stack_pop_pointer() : () -> i64
      %10105 = func.call @cc_cons(%10104, %10103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10105) : (i64) -> ()
      %10106 = func.call @stack_pop_pointer() : () -> i64
      %10107 = func.call @stack_pop_pointer() : () -> i64
      %10108 = func.call @cc_cons(%10107, %10106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10108) : (i64) -> ()
      %10109 = func.call @stack_pop_pointer() : () -> i64
      %10110 = func.call @stack_pop_pointer() : () -> i64
      %10111 = func.call @cc_cons(%10110, %10109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10111) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10112 = func.call @stack_pop_pointer() : () -> i64
      %10113 = func.call @stack_pop_pointer() : () -> i64
      %10114 = func.call @cc_cons(%10113, %10112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10114) : (i64) -> ()
      %10115 = func.call @stack_pop_pointer() : () -> i64
      %10116 = func.call @stack_pop_pointer() : () -> i64
      %10117 = func.call @cc_cons(%10116, %10115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10118 = func.call @stack_pop_pointer() : () -> i64
      %10119 = func.call @stack_pop_pointer() : () -> i64
      %10120 = func.call @cc_cons(%10119, %10118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10120) : (i64) -> ()
      %10121 = func.call @stack_pop_pointer() : () -> i64
      %10122 = func.call @stack_pop_pointer() : () -> i64
      %10123 = func.call @cc_cons(%10122, %10121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10123) : (i64) -> ()
      %10124 = func.call @stack_pop_pointer() : () -> i64
      %10125 = func.call @stack_pop_pointer() : () -> i64
      %10126 = func.call @cc_cons(%10125, %10124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10127 = func.call @stack_pop_pointer() : () -> i64
      %10128 = func.call @stack_pop_pointer() : () -> i64
      %10129 = func.call @cc_cons(%10128, %10127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10129) : (i64) -> ()
      %10130 = func.call @stack_pop_pointer() : () -> i64
      %10131 = func.call @stack_pop_pointer() : () -> i64
      %10132 = func.call @cc_cons(%10131, %10130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10132) : (i64) -> ()
      %10133 = func.call @stack_pop_pointer() : () -> i64
      %10218 = arith.constant 15079495958560 : i64
      %10219 = arith.constant 0 : i64
      %10220 = func.call @cc_make_closure(%10218, %10219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10220) : (i64) -> ()
      %10221 = func.call @stack_pop_pointer() : () -> i64
      %10222 = llvm.mlir.addressof @str822 : !llvm.ptr
      %10223 = arith.constant 4 : i64
      %10224 = func.call @cc_make_string(%10222, %10223) : (!llvm.ptr, i64) -> i64
      %10225 = func.call @cc_nil_value() : () -> i64
      %10226 = func.call @cc_intern(%10224, %10225) : (i64, i64) -> i64
      %10227 = func.call @cc_nil_value() : () -> i64
      %10228 = func.call @cc_cons(%10226, %10227) : (i64, i64) -> i64
      %10229 = func.call @cc_values_pack(%10228) : (i64) -> i64
      func.call @stack_push_pointer(%10226) : (i64) -> ()
      %10230 = llvm.mlir.addressof @str823 : !llvm.ptr
      %10231 = arith.constant 10 : i64
      %10232 = func.call @cc_make_string(%10230, %10231) : (!llvm.ptr, i64) -> i64
      %10233 = llvm.mlir.addressof @str824 : !llvm.ptr
      %10234 = arith.constant 11 : i64
      %10235 = func.call @cc_make_string(%10233, %10234) : (!llvm.ptr, i64) -> i64
      %10236 = func.call @cc_intern(%10232, %10235) : (i64, i64) -> i64
      %10237 = func.call @cc_nil_value() : () -> i64
      %10238 = func.call @cc_cons(%10236, %10237) : (i64, i64) -> i64
      %10239 = func.call @cc_values_pack(%10238) : (i64) -> i64
      func.call @stack_push_pointer(%10236) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10240 = func.call @stack_pop_pointer() : () -> i64
      %10241 = func.call @stack_pop_pointer() : () -> i64
      %10242 = func.call @cc_cons(%10241, %10240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10242) : (i64) -> ()
      %10243 = func.call @stack_pop_pointer() : () -> i64
      %10244 = func.call @stack_pop_pointer() : () -> i64
      %10245 = func.call @cc_cons(%10244, %10243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10245) : (i64) -> ()
      %10246 = func.call @stack_pop_pointer() : () -> i64
      %10247 = llvm.mlir.addressof @str825 : !llvm.ptr
      %10248 = arith.constant 11 : i64
      %10249 = func.call @cc_make_string(%10247, %10248) : (!llvm.ptr, i64) -> i64
      %10250 = llvm.mlir.addressof @str826 : !llvm.ptr
      %10251 = arith.constant 7 : i64
      %10252 = func.call @cc_make_string(%10250, %10251) : (!llvm.ptr, i64) -> i64
      %10253 = func.call @cc_intern(%10249, %10252) : (i64, i64) -> i64
      %10254 = func.call @cc_nil_value() : () -> i64
      %10255 = func.call @cc_cons(%10253, %10254) : (i64, i64) -> i64
      %10256 = func.call @cc_values_pack(%10255) : (i64) -> i64
      func.call @stack_push_pointer(%10253) : (i64) -> ()
      %10257 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10258 = func.call @stack_pop_pointer() : () -> i64
      %10259 = llvm.mlir.addressof @str827 : !llvm.ptr
      %10260 = arith.constant 4 : i64
      %10261 = func.call @cc_make_string(%10259, %10260) : (!llvm.ptr, i64) -> i64
      %10262 = llvm.mlir.addressof @str828 : !llvm.ptr
      %10263 = arith.constant 7 : i64
      %10264 = func.call @cc_make_string(%10262, %10263) : (!llvm.ptr, i64) -> i64
      %10265 = func.call @cc_intern(%10261, %10264) : (i64, i64) -> i64
      %10266 = func.call @cc_nil_value() : () -> i64
      %10267 = func.call @cc_cons(%10265, %10266) : (i64, i64) -> i64
      %10268 = func.call @cc_values_pack(%10267) : (i64) -> i64
      func.call @stack_push_pointer(%10265) : (i64) -> ()
      %10269 = func.call @stack_pop_pointer() : () -> i64
      %10270 = llvm.mlir.addressof @str829 : !llvm.ptr
      %10271 = arith.constant 5 : i64
      %10272 = func.call @cc_make_string(%10270, %10271) : (!llvm.ptr, i64) -> i64
      %10273 = func.call @cc_nil_value() : () -> i64
      %10274 = func.call @cc_intern(%10272, %10273) : (i64, i64) -> i64
      %10275 = func.call @cc_nil_value() : () -> i64
      %10276 = func.call @cc_cons(%10274, %10275) : (i64, i64) -> i64
      %10277 = func.call @cc_values_pack(%10276) : (i64) -> i64
      func.call @stack_push_pointer(%10274) : (i64) -> ()
      %10278 = func.call @stack_pop_pointer() : () -> i64
      %10279 = func.call @cc_nil_value() : () -> i64
      %10280 = func.call @cc_errorp(%9986) : (i64) -> i64
      %10281 = arith.cmpi ne, %10280, %10279 : i64
      %10282 = arith.cmpi eq, %10279, %10279 : i64
      %10283 = arith.andi %10281, %10282 : i1
      %10284 = scf.if %10283 -> (i64) {
        scf.yield %9986 : i64
      } else {
        scf.yield %10279 : i64
      }
      %10285 = func.call @cc_errorp(%10133) : (i64) -> i64
      %10286 = arith.cmpi ne, %10285, %10279 : i64
      %10287 = arith.cmpi eq, %10284, %10279 : i64
      %10288 = arith.andi %10286, %10287 : i1
      %10289 = scf.if %10288 -> (i64) {
        scf.yield %10133 : i64
      } else {
        scf.yield %10284 : i64
      }
      %10290 = func.call @cc_errorp(%10221) : (i64) -> i64
      %10291 = arith.cmpi ne, %10290, %10279 : i64
      %10292 = arith.cmpi eq, %10289, %10279 : i64
      %10293 = arith.andi %10291, %10292 : i1
      %10294 = scf.if %10293 -> (i64) {
        scf.yield %10221 : i64
      } else {
        scf.yield %10289 : i64
      }
      %10295 = func.call @cc_errorp(%10246) : (i64) -> i64
      %10296 = arith.cmpi ne, %10295, %10279 : i64
      %10297 = arith.cmpi eq, %10294, %10279 : i64
      %10298 = arith.andi %10296, %10297 : i1
      %10299 = scf.if %10298 -> (i64) {
        scf.yield %10246 : i64
      } else {
        scf.yield %10294 : i64
      }
      %10300 = func.call @cc_errorp(%10257) : (i64) -> i64
      %10301 = arith.cmpi ne, %10300, %10279 : i64
      %10302 = arith.cmpi eq, %10299, %10279 : i64
      %10303 = arith.andi %10301, %10302 : i1
      %10304 = scf.if %10303 -> (i64) {
        scf.yield %10257 : i64
      } else {
        scf.yield %10299 : i64
      }
      %10305 = func.call @cc_errorp(%10258) : (i64) -> i64
      %10306 = arith.cmpi ne, %10305, %10279 : i64
      %10307 = arith.cmpi eq, %10304, %10279 : i64
      %10308 = arith.andi %10306, %10307 : i1
      %10309 = scf.if %10308 -> (i64) {
        scf.yield %10258 : i64
      } else {
        scf.yield %10304 : i64
      }
      %10310 = func.call @cc_errorp(%10269) : (i64) -> i64
      %10311 = arith.cmpi ne, %10310, %10279 : i64
      %10312 = arith.cmpi eq, %10309, %10279 : i64
      %10313 = arith.andi %10311, %10312 : i1
      %10314 = scf.if %10313 -> (i64) {
        scf.yield %10269 : i64
      } else {
        scf.yield %10309 : i64
      }
      %10315 = func.call @cc_errorp(%10278) : (i64) -> i64
      %10316 = arith.cmpi ne, %10315, %10279 : i64
      %10317 = arith.cmpi eq, %10314, %10279 : i64
      %10318 = arith.andi %10316, %10317 : i1
      %10319 = scf.if %10318 -> (i64) {
        scf.yield %10278 : i64
      } else {
        scf.yield %10314 : i64
      }
      %10320 = arith.cmpi ne, %10319, %10279 : i64
      scf.if %10320 {
        func.call @stack_push_pointer(%10319) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9986) : (i64) -> ()
        func.call @stack_push_pointer(%10133) : (i64) -> ()
        func.call @stack_push_pointer(%10221) : (i64) -> ()
        func.call @stack_push_pointer(%10246) : (i64) -> ()
        func.call @stack_push_pointer(%10257) : (i64) -> ()
        func.call @stack_push_pointer(%10258) : (i64) -> ()
        func.call @stack_push_pointer(%10269) : (i64) -> ()
        func.call @stack_push_pointer(%10278) : (i64) -> ()
        %10321 = llvm.mlir.addressof @str830 : !llvm.ptr
        %10322 = func.call @cc_make_function_ref_const(%10321) : (!llvm.ptr) -> i64
        %10323 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10322, %10323) : (i64, i64) -> ()
      }
      %10324 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10324 : i64
    }
    %10325 = func.call @cc_nil_value() : () -> i64
    %10326 = func.call @cc_errorp(%9977) : (i64) -> i64
    %10327 = arith.cmpi ne, %10326, %10325 : i64
    %10328 = scf.if %10327 -> (i64) {
      scf.yield %9977 : i64
    } else {
      %10329 = llvm.mlir.addressof @str831 : !llvm.ptr
      %10330 = arith.constant 39 : i64
      %10331 = func.call @cc_make_string(%10329, %10330) : (!llvm.ptr, i64) -> i64
      %10332 = func.call @cc_nil_value() : () -> i64
      %10333 = func.call @cc_intern(%10331, %10332) : (i64, i64) -> i64
      %10334 = func.call @cc_nil_value() : () -> i64
      %10335 = func.call @cc_cons(%10333, %10334) : (i64, i64) -> i64
      %10336 = func.call @cc_values_pack(%10335) : (i64) -> i64
      func.call @stack_push_pointer(%10333) : (i64) -> ()
      %10337 = func.call @stack_pop_pointer() : () -> i64
      %10338 = llvm.mlir.addressof @str832 : !llvm.ptr
      %10339 = arith.constant 13 : i64
      %10340 = func.call @cc_make_string(%10338, %10339) : (!llvm.ptr, i64) -> i64
      %10341 = llvm.mlir.addressof @str833 : !llvm.ptr
      %10342 = arith.constant 11 : i64
      %10343 = func.call @cc_make_string(%10341, %10342) : (!llvm.ptr, i64) -> i64
      %10344 = func.call @cc_intern(%10340, %10343) : (i64, i64) -> i64
      %10345 = func.call @cc_nil_value() : () -> i64
      %10346 = func.call @cc_cons(%10344, %10345) : (i64, i64) -> i64
      %10347 = func.call @cc_values_pack(%10346) : (i64) -> i64
      func.call @stack_push_pointer(%10344) : (i64) -> ()
      %10348 = llvm.mlir.addressof @str834 : !llvm.ptr
      %10349 = arith.constant 6 : i64
      %10350 = func.call @cc_make_string(%10348, %10349) : (!llvm.ptr, i64) -> i64
      %10351 = func.call @cc_nil_value() : () -> i64
      %10352 = func.call @cc_intern(%10350, %10351) : (i64, i64) -> i64
      %10353 = func.call @cc_nil_value() : () -> i64
      %10354 = func.call @cc_cons(%10352, %10353) : (i64, i64) -> i64
      %10355 = func.call @cc_values_pack(%10354) : (i64) -> i64
      func.call @stack_push_pointer(%10352) : (i64) -> ()
      %10356 = llvm.mlir.addressof @str835 : !llvm.ptr
      %10357 = arith.constant 19 : i64
      %10358 = func.call @cc_make_string(%10356, %10357) : (!llvm.ptr, i64) -> i64
      %10359 = func.call @cc_nil_value() : () -> i64
      %10360 = func.call @cc_intern(%10358, %10359) : (i64, i64) -> i64
      %10361 = func.call @cc_nil_value() : () -> i64
      %10362 = func.call @cc_cons(%10360, %10361) : (i64, i64) -> i64
      %10363 = func.call @cc_values_pack(%10362) : (i64) -> i64
      func.call @stack_push_pointer(%10360) : (i64) -> ()
      %10364 = llvm.mlir.addressof @str836 : !llvm.ptr
      %10365 = arith.constant 7 : i64
      %10366 = func.call @cc_make_string(%10364, %10365) : (!llvm.ptr, i64) -> i64
      %10367 = llvm.mlir.addressof @str837 : !llvm.ptr
      %10368 = arith.constant 11 : i64
      %10369 = func.call @cc_make_string(%10367, %10368) : (!llvm.ptr, i64) -> i64
      %10370 = func.call @cc_intern(%10366, %10369) : (i64, i64) -> i64
      %10371 = func.call @cc_nil_value() : () -> i64
      %10372 = func.call @cc_cons(%10370, %10371) : (i64, i64) -> i64
      %10373 = func.call @cc_values_pack(%10372) : (i64) -> i64
      func.call @stack_push_pointer(%10370) : (i64) -> ()
      %10374 = llvm.mlir.addressof @str838 : !llvm.ptr
      %10375 = arith.constant 7 : i64
      %10376 = func.call @cc_make_string(%10374, %10375) : (!llvm.ptr, i64) -> i64
      %10377 = llvm.mlir.addressof @str839 : !llvm.ptr
      %10378 = arith.constant 11 : i64
      %10379 = func.call @cc_make_string(%10377, %10378) : (!llvm.ptr, i64) -> i64
      %10380 = func.call @cc_intern(%10376, %10379) : (i64, i64) -> i64
      %10381 = func.call @cc_nil_value() : () -> i64
      %10382 = func.call @cc_cons(%10380, %10381) : (i64, i64) -> i64
      %10383 = func.call @cc_values_pack(%10382) : (i64) -> i64
      func.call @stack_push_pointer(%10380) : (i64) -> ()
      %10384 = llvm.mlir.addressof @str840 : !llvm.ptr
      %10385 = arith.constant 9 : i64
      %10386 = func.call @cc_make_string(%10384, %10385) : (!llvm.ptr, i64) -> i64
      %10387 = llvm.mlir.addressof @str841 : !llvm.ptr
      %10388 = arith.constant 11 : i64
      %10389 = func.call @cc_make_string(%10387, %10388) : (!llvm.ptr, i64) -> i64
      %10390 = func.call @cc_intern(%10386, %10389) : (i64, i64) -> i64
      %10391 = func.call @cc_nil_value() : () -> i64
      %10392 = func.call @cc_cons(%10390, %10391) : (i64, i64) -> i64
      %10393 = func.call @cc_values_pack(%10392) : (i64) -> i64
      func.call @stack_push_pointer(%10390) : (i64) -> ()
      %10394 = llvm.mlir.addressof @str842 : !llvm.ptr
      %10395 = arith.constant 10 : i64
      %10396 = func.call @cc_make_string(%10394, %10395) : (!llvm.ptr, i64) -> i64
      %10397 = llvm.mlir.addressof @str843 : !llvm.ptr
      %10398 = arith.constant 11 : i64
      %10399 = func.call @cc_make_string(%10397, %10398) : (!llvm.ptr, i64) -> i64
      %10400 = func.call @cc_intern(%10396, %10399) : (i64, i64) -> i64
      %10401 = func.call @cc_nil_value() : () -> i64
      %10402 = func.call @cc_cons(%10400, %10401) : (i64, i64) -> i64
      %10403 = func.call @cc_values_pack(%10402) : (i64) -> i64
      func.call @stack_push_pointer(%10400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10404 = func.call @stack_pop_pointer() : () -> i64
      %10405 = func.call @stack_pop_pointer() : () -> i64
      %10406 = func.call @cc_cons(%10405, %10404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10406) : (i64) -> ()
      %10407 = func.call @stack_pop_pointer() : () -> i64
      %10408 = func.call @stack_pop_pointer() : () -> i64
      %10409 = func.call @cc_cons(%10408, %10407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10410 = func.call @stack_pop_pointer() : () -> i64
      %10411 = func.call @stack_pop_pointer() : () -> i64
      %10412 = func.call @cc_cons(%10411, %10410) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10412) : (i64) -> ()
      %10413 = func.call @stack_pop_pointer() : () -> i64
      %10414 = func.call @stack_pop_pointer() : () -> i64
      %10415 = func.call @cc_cons(%10414, %10413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10415) : (i64) -> ()
      %10416 = llvm.mlir.addressof @str844 : !llvm.ptr
      %10417 = arith.constant 10 : i64
      %10418 = func.call @cc_make_string(%10416, %10417) : (!llvm.ptr, i64) -> i64
      %10419 = llvm.mlir.addressof @str845 : !llvm.ptr
      %10420 = arith.constant 11 : i64
      %10421 = func.call @cc_make_string(%10419, %10420) : (!llvm.ptr, i64) -> i64
      %10422 = func.call @cc_intern(%10418, %10421) : (i64, i64) -> i64
      %10423 = func.call @cc_nil_value() : () -> i64
      %10424 = func.call @cc_cons(%10422, %10423) : (i64, i64) -> i64
      %10425 = func.call @cc_values_pack(%10424) : (i64) -> i64
      func.call @stack_push_pointer(%10422) : (i64) -> ()
      %10426 = llvm.mlir.addressof @str846 : !llvm.ptr
      %10427 = arith.constant 4 : i64
      %10428 = func.call @cc_make_string(%10426, %10427) : (!llvm.ptr, i64) -> i64
      %10429 = llvm.mlir.addressof @str847 : !llvm.ptr
      %10430 = arith.constant 11 : i64
      %10431 = func.call @cc_make_string(%10429, %10430) : (!llvm.ptr, i64) -> i64
      %10432 = func.call @cc_intern(%10428, %10431) : (i64, i64) -> i64
      %10433 = func.call @cc_nil_value() : () -> i64
      %10434 = func.call @cc_cons(%10432, %10433) : (i64, i64) -> i64
      %10435 = func.call @cc_values_pack(%10434) : (i64) -> i64
      func.call @stack_push_pointer(%10432) : (i64) -> ()
      %10436 = arith.constant -13 : i64
      func.call @stack_push_fixnum(%10436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10437 = func.call @stack_pop_pointer() : () -> i64
      %10438 = func.call @stack_pop_pointer() : () -> i64
      %10439 = func.call @cc_cons(%10438, %10437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10439) : (i64) -> ()
      %10440 = func.call @stack_pop_pointer() : () -> i64
      %10441 = func.call @stack_pop_pointer() : () -> i64
      %10442 = func.call @cc_cons(%10441, %10440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10443 = func.call @stack_pop_pointer() : () -> i64
      %10444 = func.call @stack_pop_pointer() : () -> i64
      %10445 = func.call @cc_cons(%10444, %10443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10445) : (i64) -> ()
      %10446 = func.call @stack_pop_pointer() : () -> i64
      %10447 = func.call @stack_pop_pointer() : () -> i64
      %10448 = func.call @cc_cons(%10447, %10446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10448) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10449 = func.call @stack_pop_pointer() : () -> i64
      %10450 = func.call @stack_pop_pointer() : () -> i64
      %10451 = func.call @cc_cons(%10450, %10449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10451) : (i64) -> ()
      %10452 = func.call @stack_pop_pointer() : () -> i64
      %10453 = func.call @stack_pop_pointer() : () -> i64
      %10454 = func.call @cc_cons(%10453, %10452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10454) : (i64) -> ()
      %10455 = func.call @stack_pop_pointer() : () -> i64
      %10456 = func.call @stack_pop_pointer() : () -> i64
      %10457 = func.call @cc_cons(%10456, %10455) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10458 = func.call @stack_pop_pointer() : () -> i64
      %10459 = func.call @stack_pop_pointer() : () -> i64
      %10460 = func.call @cc_cons(%10459, %10458) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10460) : (i64) -> ()
      %10461 = func.call @stack_pop_pointer() : () -> i64
      %10462 = func.call @stack_pop_pointer() : () -> i64
      %10463 = func.call @cc_cons(%10462, %10461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10463) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10464 = func.call @stack_pop_pointer() : () -> i64
      %10465 = func.call @stack_pop_pointer() : () -> i64
      %10466 = func.call @cc_cons(%10465, %10464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10466) : (i64) -> ()
      %10467 = func.call @stack_pop_pointer() : () -> i64
      %10468 = func.call @stack_pop_pointer() : () -> i64
      %10469 = func.call @cc_cons(%10468, %10467) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10469) : (i64) -> ()
      %10470 = func.call @stack_pop_pointer() : () -> i64
      %10471 = func.call @stack_pop_pointer() : () -> i64
      %10472 = func.call @cc_cons(%10471, %10470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10473 = func.call @stack_pop_pointer() : () -> i64
      %10474 = func.call @stack_pop_pointer() : () -> i64
      %10475 = func.call @cc_cons(%10474, %10473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10475) : (i64) -> ()
      %10476 = func.call @stack_pop_pointer() : () -> i64
      %10477 = func.call @stack_pop_pointer() : () -> i64
      %10478 = func.call @cc_cons(%10477, %10476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10478) : (i64) -> ()
      %10479 = func.call @stack_pop_pointer() : () -> i64
      %10553 = arith.constant 15079495958561 : i64
      %10554 = arith.constant 0 : i64
      %10555 = func.call @cc_make_closure(%10553, %10554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10555) : (i64) -> ()
      %10556 = func.call @stack_pop_pointer() : () -> i64
      %10557 = llvm.mlir.addressof @str849 : !llvm.ptr
      %10558 = arith.constant 4 : i64
      %10559 = func.call @cc_make_string(%10557, %10558) : (!llvm.ptr, i64) -> i64
      %10560 = func.call @cc_nil_value() : () -> i64
      %10561 = func.call @cc_intern(%10559, %10560) : (i64, i64) -> i64
      %10562 = func.call @cc_nil_value() : () -> i64
      %10563 = func.call @cc_cons(%10561, %10562) : (i64, i64) -> i64
      %10564 = func.call @cc_values_pack(%10563) : (i64) -> i64
      func.call @stack_push_pointer(%10561) : (i64) -> ()
      %10565 = llvm.mlir.addressof @str850 : !llvm.ptr
      %10566 = arith.constant 10 : i64
      %10567 = func.call @cc_make_string(%10565, %10566) : (!llvm.ptr, i64) -> i64
      %10568 = llvm.mlir.addressof @str851 : !llvm.ptr
      %10569 = arith.constant 11 : i64
      %10570 = func.call @cc_make_string(%10568, %10569) : (!llvm.ptr, i64) -> i64
      %10571 = func.call @cc_intern(%10567, %10570) : (i64, i64) -> i64
      %10572 = func.call @cc_nil_value() : () -> i64
      %10573 = func.call @cc_cons(%10571, %10572) : (i64, i64) -> i64
      %10574 = func.call @cc_values_pack(%10573) : (i64) -> i64
      func.call @stack_push_pointer(%10571) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10575 = func.call @stack_pop_pointer() : () -> i64
      %10576 = func.call @stack_pop_pointer() : () -> i64
      %10577 = func.call @cc_cons(%10576, %10575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10577) : (i64) -> ()
      %10578 = func.call @stack_pop_pointer() : () -> i64
      %10579 = func.call @stack_pop_pointer() : () -> i64
      %10580 = func.call @cc_cons(%10579, %10578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10580) : (i64) -> ()
      %10581 = func.call @stack_pop_pointer() : () -> i64
      %10582 = llvm.mlir.addressof @str852 : !llvm.ptr
      %10583 = arith.constant 11 : i64
      %10584 = func.call @cc_make_string(%10582, %10583) : (!llvm.ptr, i64) -> i64
      %10585 = llvm.mlir.addressof @str853 : !llvm.ptr
      %10586 = arith.constant 7 : i64
      %10587 = func.call @cc_make_string(%10585, %10586) : (!llvm.ptr, i64) -> i64
      %10588 = func.call @cc_intern(%10584, %10587) : (i64, i64) -> i64
      %10589 = func.call @cc_nil_value() : () -> i64
      %10590 = func.call @cc_cons(%10588, %10589) : (i64, i64) -> i64
      %10591 = func.call @cc_values_pack(%10590) : (i64) -> i64
      func.call @stack_push_pointer(%10588) : (i64) -> ()
      %10592 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10593 = func.call @stack_pop_pointer() : () -> i64
      %10594 = llvm.mlir.addressof @str854 : !llvm.ptr
      %10595 = arith.constant 4 : i64
      %10596 = func.call @cc_make_string(%10594, %10595) : (!llvm.ptr, i64) -> i64
      %10597 = llvm.mlir.addressof @str855 : !llvm.ptr
      %10598 = arith.constant 7 : i64
      %10599 = func.call @cc_make_string(%10597, %10598) : (!llvm.ptr, i64) -> i64
      %10600 = func.call @cc_intern(%10596, %10599) : (i64, i64) -> i64
      %10601 = func.call @cc_nil_value() : () -> i64
      %10602 = func.call @cc_cons(%10600, %10601) : (i64, i64) -> i64
      %10603 = func.call @cc_values_pack(%10602) : (i64) -> i64
      func.call @stack_push_pointer(%10600) : (i64) -> ()
      %10604 = func.call @stack_pop_pointer() : () -> i64
      %10605 = llvm.mlir.addressof @str856 : !llvm.ptr
      %10606 = arith.constant 5 : i64
      %10607 = func.call @cc_make_string(%10605, %10606) : (!llvm.ptr, i64) -> i64
      %10608 = func.call @cc_nil_value() : () -> i64
      %10609 = func.call @cc_intern(%10607, %10608) : (i64, i64) -> i64
      %10610 = func.call @cc_nil_value() : () -> i64
      %10611 = func.call @cc_cons(%10609, %10610) : (i64, i64) -> i64
      %10612 = func.call @cc_values_pack(%10611) : (i64) -> i64
      func.call @stack_push_pointer(%10609) : (i64) -> ()
      %10613 = func.call @stack_pop_pointer() : () -> i64
      %10614 = func.call @cc_nil_value() : () -> i64
      %10615 = func.call @cc_errorp(%10337) : (i64) -> i64
      %10616 = arith.cmpi ne, %10615, %10614 : i64
      %10617 = arith.cmpi eq, %10614, %10614 : i64
      %10618 = arith.andi %10616, %10617 : i1
      %10619 = scf.if %10618 -> (i64) {
        scf.yield %10337 : i64
      } else {
        scf.yield %10614 : i64
      }
      %10620 = func.call @cc_errorp(%10479) : (i64) -> i64
      %10621 = arith.cmpi ne, %10620, %10614 : i64
      %10622 = arith.cmpi eq, %10619, %10614 : i64
      %10623 = arith.andi %10621, %10622 : i1
      %10624 = scf.if %10623 -> (i64) {
        scf.yield %10479 : i64
      } else {
        scf.yield %10619 : i64
      }
      %10625 = func.call @cc_errorp(%10556) : (i64) -> i64
      %10626 = arith.cmpi ne, %10625, %10614 : i64
      %10627 = arith.cmpi eq, %10624, %10614 : i64
      %10628 = arith.andi %10626, %10627 : i1
      %10629 = scf.if %10628 -> (i64) {
        scf.yield %10556 : i64
      } else {
        scf.yield %10624 : i64
      }
      %10630 = func.call @cc_errorp(%10581) : (i64) -> i64
      %10631 = arith.cmpi ne, %10630, %10614 : i64
      %10632 = arith.cmpi eq, %10629, %10614 : i64
      %10633 = arith.andi %10631, %10632 : i1
      %10634 = scf.if %10633 -> (i64) {
        scf.yield %10581 : i64
      } else {
        scf.yield %10629 : i64
      }
      %10635 = func.call @cc_errorp(%10592) : (i64) -> i64
      %10636 = arith.cmpi ne, %10635, %10614 : i64
      %10637 = arith.cmpi eq, %10634, %10614 : i64
      %10638 = arith.andi %10636, %10637 : i1
      %10639 = scf.if %10638 -> (i64) {
        scf.yield %10592 : i64
      } else {
        scf.yield %10634 : i64
      }
      %10640 = func.call @cc_errorp(%10593) : (i64) -> i64
      %10641 = arith.cmpi ne, %10640, %10614 : i64
      %10642 = arith.cmpi eq, %10639, %10614 : i64
      %10643 = arith.andi %10641, %10642 : i1
      %10644 = scf.if %10643 -> (i64) {
        scf.yield %10593 : i64
      } else {
        scf.yield %10639 : i64
      }
      %10645 = func.call @cc_errorp(%10604) : (i64) -> i64
      %10646 = arith.cmpi ne, %10645, %10614 : i64
      %10647 = arith.cmpi eq, %10644, %10614 : i64
      %10648 = arith.andi %10646, %10647 : i1
      %10649 = scf.if %10648 -> (i64) {
        scf.yield %10604 : i64
      } else {
        scf.yield %10644 : i64
      }
      %10650 = func.call @cc_errorp(%10613) : (i64) -> i64
      %10651 = arith.cmpi ne, %10650, %10614 : i64
      %10652 = arith.cmpi eq, %10649, %10614 : i64
      %10653 = arith.andi %10651, %10652 : i1
      %10654 = scf.if %10653 -> (i64) {
        scf.yield %10613 : i64
      } else {
        scf.yield %10649 : i64
      }
      %10655 = arith.cmpi ne, %10654, %10614 : i64
      scf.if %10655 {
        func.call @stack_push_pointer(%10654) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10337) : (i64) -> ()
        func.call @stack_push_pointer(%10479) : (i64) -> ()
        func.call @stack_push_pointer(%10556) : (i64) -> ()
        func.call @stack_push_pointer(%10581) : (i64) -> ()
        func.call @stack_push_pointer(%10592) : (i64) -> ()
        func.call @stack_push_pointer(%10593) : (i64) -> ()
        func.call @stack_push_pointer(%10604) : (i64) -> ()
        func.call @stack_push_pointer(%10613) : (i64) -> ()
        %10656 = llvm.mlir.addressof @str857 : !llvm.ptr
        %10657 = func.call @cc_make_function_ref_const(%10656) : (!llvm.ptr) -> i64
        %10658 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10657, %10658) : (i64, i64) -> ()
      }
      %10659 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10659 : i64
    }
    %10660 = func.call @cc_nil_value() : () -> i64
    %10661 = func.call @cc_errorp(%10328) : (i64) -> i64
    %10662 = arith.cmpi ne, %10661, %10660 : i64
    %10663 = scf.if %10662 -> (i64) {
      scf.yield %10328 : i64
    } else {
      %10664 = llvm.mlir.addressof @str858 : !llvm.ptr
      %10665 = arith.constant 10 : i64
      %10666 = func.call @cc_make_string(%10664, %10665) : (!llvm.ptr, i64) -> i64
      %10667 = func.call @cc_nil_value() : () -> i64
      %10668 = func.call @cc_intern(%10666, %10667) : (i64, i64) -> i64
      %10669 = func.call @cc_nil_value() : () -> i64
      %10670 = func.call @cc_cons(%10668, %10669) : (i64, i64) -> i64
      %10671 = func.call @cc_values_pack(%10670) : (i64) -> i64
      func.call @stack_push_pointer(%10668) : (i64) -> ()
      %10672 = func.call @stack_pop_pointer() : () -> i64
      %10673 = llvm.mlir.addressof @str859 : !llvm.ptr
      %10674 = arith.constant 3 : i64
      %10675 = func.call @cc_make_string(%10673, %10674) : (!llvm.ptr, i64) -> i64
      %10676 = func.call @cc_nil_value() : () -> i64
      %10677 = func.call @cc_intern(%10675, %10676) : (i64, i64) -> i64
      %10678 = func.call @cc_nil_value() : () -> i64
      %10679 = func.call @cc_cons(%10677, %10678) : (i64, i64) -> i64
      %10680 = func.call @cc_values_pack(%10679) : (i64) -> i64
      func.call @stack_push_pointer(%10677) : (i64) -> ()
      %10681 = llvm.mlir.addressof @str860 : !llvm.ptr
      %10682 = arith.constant 3 : i64
      %10683 = func.call @cc_make_string(%10681, %10682) : (!llvm.ptr, i64) -> i64
      %10684 = func.call @cc_nil_value() : () -> i64
      %10685 = func.call @cc_intern(%10683, %10684) : (i64, i64) -> i64
      %10686 = func.call @cc_nil_value() : () -> i64
      %10687 = func.call @cc_cons(%10685, %10686) : (i64, i64) -> i64
      %10688 = func.call @cc_values_pack(%10687) : (i64) -> i64
      func.call @stack_push_pointer(%10685) : (i64) -> ()
      %10689 = llvm.mlir.addressof @str861 : !llvm.ptr
      %10690 = arith.constant 7 : i64
      %10691 = func.call @cc_make_string(%10689, %10690) : (!llvm.ptr, i64) -> i64
      %10692 = llvm.mlir.addressof @str862 : !llvm.ptr
      %10693 = arith.constant 11 : i64
      %10694 = func.call @cc_make_string(%10692, %10693) : (!llvm.ptr, i64) -> i64
      %10695 = func.call @cc_intern(%10691, %10694) : (i64, i64) -> i64
      %10696 = func.call @cc_nil_value() : () -> i64
      %10697 = func.call @cc_cons(%10695, %10696) : (i64, i64) -> i64
      %10698 = func.call @cc_values_pack(%10697) : (i64) -> i64
      func.call @stack_push_pointer(%10695) : (i64) -> ()
      %10699 = llvm.mlir.addressof @str863 : !llvm.ptr
      %10700 = arith.constant 3 : i64
      %10701 = func.call @cc_make_string(%10699, %10700) : (!llvm.ptr, i64) -> i64
      %10702 = llvm.mlir.addressof @str864 : !llvm.ptr
      %10703 = arith.constant 11 : i64
      %10704 = func.call @cc_make_string(%10702, %10703) : (!llvm.ptr, i64) -> i64
      %10705 = func.call @cc_intern(%10701, %10704) : (i64, i64) -> i64
      %10706 = func.call @cc_nil_value() : () -> i64
      %10707 = func.call @cc_cons(%10705, %10706) : (i64, i64) -> i64
      %10708 = func.call @cc_values_pack(%10707) : (i64) -> i64
      func.call @stack_push_pointer(%10705) : (i64) -> ()
      %10709 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10709) : (i64) -> ()
      %10710 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10710) : (i64) -> ()
      %10711 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10711) : (i64) -> ()
      %10712 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10712) : (i64) -> ()
      %10713 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10713) : (i64) -> ()
      %10714 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10714) : (i64) -> ()
      %10715 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10715) : (i64) -> ()
      %10716 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10716) : (i64) -> ()
      %10717 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10717) : (i64) -> ()
      %10718 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10718) : (i64) -> ()
      %10719 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10719) : (i64) -> ()
      %10720 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10720) : (i64) -> ()
      %10721 = arith.constant 12 : i64
      %10722 = func.call @cc_box_fixnum(%10721) : (i64) -> i64
      %10723 = func.call @cc_make_vector(%10722) : (i64) -> i64
      %10724 = func.call @stack_pop_pointer() : () -> i64
      %10725 = arith.constant 11 : i64
      %10726 = func.call @cc_box_fixnum(%10725) : (i64) -> i64
      %10727 = func.call @cc_svset(%10723, %10726, %10724) : (i64, i64, i64) -> i64
      %10728 = func.call @stack_pop_pointer() : () -> i64
      %10729 = arith.constant 10 : i64
      %10730 = func.call @cc_box_fixnum(%10729) : (i64) -> i64
      %10731 = func.call @cc_svset(%10723, %10730, %10728) : (i64, i64, i64) -> i64
      %10732 = func.call @stack_pop_pointer() : () -> i64
      %10733 = arith.constant 9 : i64
      %10734 = func.call @cc_box_fixnum(%10733) : (i64) -> i64
      %10735 = func.call @cc_svset(%10723, %10734, %10732) : (i64, i64, i64) -> i64
      %10736 = func.call @stack_pop_pointer() : () -> i64
      %10737 = arith.constant 8 : i64
      %10738 = func.call @cc_box_fixnum(%10737) : (i64) -> i64
      %10739 = func.call @cc_svset(%10723, %10738, %10736) : (i64, i64, i64) -> i64
      %10740 = func.call @stack_pop_pointer() : () -> i64
      %10741 = arith.constant 7 : i64
      %10742 = func.call @cc_box_fixnum(%10741) : (i64) -> i64
      %10743 = func.call @cc_svset(%10723, %10742, %10740) : (i64, i64, i64) -> i64
      %10744 = func.call @stack_pop_pointer() : () -> i64
      %10745 = arith.constant 6 : i64
      %10746 = func.call @cc_box_fixnum(%10745) : (i64) -> i64
      %10747 = func.call @cc_svset(%10723, %10746, %10744) : (i64, i64, i64) -> i64
      %10748 = func.call @stack_pop_pointer() : () -> i64
      %10749 = arith.constant 5 : i64
      %10750 = func.call @cc_box_fixnum(%10749) : (i64) -> i64
      %10751 = func.call @cc_svset(%10723, %10750, %10748) : (i64, i64, i64) -> i64
      %10752 = func.call @stack_pop_pointer() : () -> i64
      %10753 = arith.constant 4 : i64
      %10754 = func.call @cc_box_fixnum(%10753) : (i64) -> i64
      %10755 = func.call @cc_svset(%10723, %10754, %10752) : (i64, i64, i64) -> i64
      %10756 = func.call @stack_pop_pointer() : () -> i64
      %10757 = arith.constant 3 : i64
      %10758 = func.call @cc_box_fixnum(%10757) : (i64) -> i64
      %10759 = func.call @cc_svset(%10723, %10758, %10756) : (i64, i64, i64) -> i64
      %10760 = func.call @stack_pop_pointer() : () -> i64
      %10761 = arith.constant 2 : i64
      %10762 = func.call @cc_box_fixnum(%10761) : (i64) -> i64
      %10763 = func.call @cc_svset(%10723, %10762, %10760) : (i64, i64, i64) -> i64
      %10764 = func.call @stack_pop_pointer() : () -> i64
      %10765 = arith.constant 1 : i64
      %10766 = func.call @cc_box_fixnum(%10765) : (i64) -> i64
      %10767 = func.call @cc_svset(%10723, %10766, %10764) : (i64, i64, i64) -> i64
      %10768 = func.call @stack_pop_pointer() : () -> i64
      %10769 = arith.constant 0 : i64
      %10770 = func.call @cc_box_fixnum(%10769) : (i64) -> i64
      %10771 = func.call @cc_svset(%10723, %10770, %10768) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%10723) : (i64) -> ()
      %10772 = arith.constant 11 : i64
      func.call @stack_push_fixnum(%10772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10773 = func.call @stack_pop_pointer() : () -> i64
      %10774 = func.call @stack_pop_pointer() : () -> i64
      %10775 = func.call @cc_cons(%10774, %10773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10775) : (i64) -> ()
      %10776 = func.call @stack_pop_pointer() : () -> i64
      %10777 = func.call @stack_pop_pointer() : () -> i64
      %10778 = func.call @cc_cons(%10777, %10776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10778) : (i64) -> ()
      %10779 = func.call @stack_pop_pointer() : () -> i64
      %10780 = func.call @stack_pop_pointer() : () -> i64
      %10781 = func.call @cc_cons(%10780, %10779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10781) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10782 = func.call @stack_pop_pointer() : () -> i64
      %10783 = func.call @stack_pop_pointer() : () -> i64
      %10784 = func.call @cc_cons(%10783, %10782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10784) : (i64) -> ()
      %10785 = func.call @stack_pop_pointer() : () -> i64
      %10786 = func.call @stack_pop_pointer() : () -> i64
      %10787 = func.call @cc_cons(%10786, %10785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10788 = func.call @stack_pop_pointer() : () -> i64
      %10789 = func.call @stack_pop_pointer() : () -> i64
      %10790 = func.call @cc_cons(%10789, %10788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10790) : (i64) -> ()
      %10791 = func.call @stack_pop_pointer() : () -> i64
      %10792 = func.call @stack_pop_pointer() : () -> i64
      %10793 = func.call @cc_cons(%10792, %10791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10793) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10794 = func.call @stack_pop_pointer() : () -> i64
      %10795 = func.call @stack_pop_pointer() : () -> i64
      %10796 = func.call @cc_cons(%10795, %10794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10796) : (i64) -> ()
      %10797 = func.call @stack_pop_pointer() : () -> i64
      %10798 = func.call @stack_pop_pointer() : () -> i64
      %10799 = func.call @cc_cons(%10798, %10797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10799) : (i64) -> ()
      %10800 = func.call @stack_pop_pointer() : () -> i64
      %10898 = arith.constant 15079495958562 : i64
      %10899 = arith.constant 0 : i64
      %10900 = func.call @cc_make_closure(%10898, %10899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10900) : (i64) -> ()
      %10901 = func.call @stack_pop_pointer() : () -> i64
      %10902 = llvm.mlir.addressof @str866 : !llvm.ptr
      %10903 = arith.constant 1 : i64
      %10904 = func.call @cc_make_string(%10902, %10903) : (!llvm.ptr, i64) -> i64
      %10905 = func.call @cc_nil_value() : () -> i64
      %10906 = func.call @cc_intern(%10904, %10905) : (i64, i64) -> i64
      %10907 = func.call @cc_nil_value() : () -> i64
      %10908 = func.call @cc_cons(%10906, %10907) : (i64, i64) -> i64
      %10909 = func.call @cc_values_pack(%10908) : (i64) -> i64
      func.call @stack_push_pointer(%10906) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10910 = func.call @stack_pop_pointer() : () -> i64
      %10911 = func.call @stack_pop_pointer() : () -> i64
      %10912 = func.call @cc_cons(%10911, %10910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10912) : (i64) -> ()
      %10913 = func.call @stack_pop_pointer() : () -> i64
      %10914 = llvm.mlir.addressof @str867 : !llvm.ptr
      %10915 = arith.constant 11 : i64
      %10916 = func.call @cc_make_string(%10914, %10915) : (!llvm.ptr, i64) -> i64
      %10917 = llvm.mlir.addressof @str868 : !llvm.ptr
      %10918 = arith.constant 7 : i64
      %10919 = func.call @cc_make_string(%10917, %10918) : (!llvm.ptr, i64) -> i64
      %10920 = func.call @cc_intern(%10916, %10919) : (i64, i64) -> i64
      %10921 = func.call @cc_nil_value() : () -> i64
      %10922 = func.call @cc_cons(%10920, %10921) : (i64, i64) -> i64
      %10923 = func.call @cc_values_pack(%10922) : (i64) -> i64
      func.call @stack_push_pointer(%10920) : (i64) -> ()
      %10924 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10925 = func.call @stack_pop_pointer() : () -> i64
      %10926 = llvm.mlir.addressof @str869 : !llvm.ptr
      %10927 = arith.constant 4 : i64
      %10928 = func.call @cc_make_string(%10926, %10927) : (!llvm.ptr, i64) -> i64
      %10929 = llvm.mlir.addressof @str870 : !llvm.ptr
      %10930 = arith.constant 7 : i64
      %10931 = func.call @cc_make_string(%10929, %10930) : (!llvm.ptr, i64) -> i64
      %10932 = func.call @cc_intern(%10928, %10931) : (i64, i64) -> i64
      %10933 = func.call @cc_nil_value() : () -> i64
      %10934 = func.call @cc_cons(%10932, %10933) : (i64, i64) -> i64
      %10935 = func.call @cc_values_pack(%10934) : (i64) -> i64
      func.call @stack_push_pointer(%10932) : (i64) -> ()
      %10936 = func.call @stack_pop_pointer() : () -> i64
      %10937 = llvm.mlir.addressof @str871 : !llvm.ptr
      %10938 = arith.constant 6 : i64
      %10939 = func.call @cc_make_string(%10937, %10938) : (!llvm.ptr, i64) -> i64
      %10940 = func.call @cc_nil_value() : () -> i64
      %10941 = func.call @cc_intern(%10939, %10940) : (i64, i64) -> i64
      %10942 = func.call @cc_nil_value() : () -> i64
      %10943 = func.call @cc_cons(%10941, %10942) : (i64, i64) -> i64
      %10944 = func.call @cc_values_pack(%10943) : (i64) -> i64
      func.call @stack_push_pointer(%10941) : (i64) -> ()
      %10945 = func.call @stack_pop_pointer() : () -> i64
      %10946 = func.call @cc_nil_value() : () -> i64
      %10947 = func.call @cc_errorp(%10672) : (i64) -> i64
      %10948 = arith.cmpi ne, %10947, %10946 : i64
      %10949 = arith.cmpi eq, %10946, %10946 : i64
      %10950 = arith.andi %10948, %10949 : i1
      %10951 = scf.if %10950 -> (i64) {
        scf.yield %10672 : i64
      } else {
        scf.yield %10946 : i64
      }
      %10952 = func.call @cc_errorp(%10800) : (i64) -> i64
      %10953 = arith.cmpi ne, %10952, %10946 : i64
      %10954 = arith.cmpi eq, %10951, %10946 : i64
      %10955 = arith.andi %10953, %10954 : i1
      %10956 = scf.if %10955 -> (i64) {
        scf.yield %10800 : i64
      } else {
        scf.yield %10951 : i64
      }
      %10957 = func.call @cc_errorp(%10901) : (i64) -> i64
      %10958 = arith.cmpi ne, %10957, %10946 : i64
      %10959 = arith.cmpi eq, %10956, %10946 : i64
      %10960 = arith.andi %10958, %10959 : i1
      %10961 = scf.if %10960 -> (i64) {
        scf.yield %10901 : i64
      } else {
        scf.yield %10956 : i64
      }
      %10962 = func.call @cc_errorp(%10913) : (i64) -> i64
      %10963 = arith.cmpi ne, %10962, %10946 : i64
      %10964 = arith.cmpi eq, %10961, %10946 : i64
      %10965 = arith.andi %10963, %10964 : i1
      %10966 = scf.if %10965 -> (i64) {
        scf.yield %10913 : i64
      } else {
        scf.yield %10961 : i64
      }
      %10967 = func.call @cc_errorp(%10924) : (i64) -> i64
      %10968 = arith.cmpi ne, %10967, %10946 : i64
      %10969 = arith.cmpi eq, %10966, %10946 : i64
      %10970 = arith.andi %10968, %10969 : i1
      %10971 = scf.if %10970 -> (i64) {
        scf.yield %10924 : i64
      } else {
        scf.yield %10966 : i64
      }
      %10972 = func.call @cc_errorp(%10925) : (i64) -> i64
      %10973 = arith.cmpi ne, %10972, %10946 : i64
      %10974 = arith.cmpi eq, %10971, %10946 : i64
      %10975 = arith.andi %10973, %10974 : i1
      %10976 = scf.if %10975 -> (i64) {
        scf.yield %10925 : i64
      } else {
        scf.yield %10971 : i64
      }
      %10977 = func.call @cc_errorp(%10936) : (i64) -> i64
      %10978 = arith.cmpi ne, %10977, %10946 : i64
      %10979 = arith.cmpi eq, %10976, %10946 : i64
      %10980 = arith.andi %10978, %10979 : i1
      %10981 = scf.if %10980 -> (i64) {
        scf.yield %10936 : i64
      } else {
        scf.yield %10976 : i64
      }
      %10982 = func.call @cc_errorp(%10945) : (i64) -> i64
      %10983 = arith.cmpi ne, %10982, %10946 : i64
      %10984 = arith.cmpi eq, %10981, %10946 : i64
      %10985 = arith.andi %10983, %10984 : i1
      %10986 = scf.if %10985 -> (i64) {
        scf.yield %10945 : i64
      } else {
        scf.yield %10981 : i64
      }
      %10987 = arith.cmpi ne, %10986, %10946 : i64
      scf.if %10987 {
        func.call @stack_push_pointer(%10986) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10672) : (i64) -> ()
        func.call @stack_push_pointer(%10800) : (i64) -> ()
        func.call @stack_push_pointer(%10901) : (i64) -> ()
        func.call @stack_push_pointer(%10913) : (i64) -> ()
        func.call @stack_push_pointer(%10924) : (i64) -> ()
        func.call @stack_push_pointer(%10925) : (i64) -> ()
        func.call @stack_push_pointer(%10936) : (i64) -> ()
        func.call @stack_push_pointer(%10945) : (i64) -> ()
        %10988 = llvm.mlir.addressof @str872 : !llvm.ptr
        %10989 = func.call @cc_make_function_ref_const(%10988) : (!llvm.ptr) -> i64
        %10990 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10989, %10990) : (i64, i64) -> ()
      }
      %10991 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10991 : i64
    }
    %10992 = func.call @cc_nil_value() : () -> i64
    %10993 = func.call @cc_errorp(%10663) : (i64) -> i64
    %10994 = arith.cmpi ne, %10993, %10992 : i64
    %10995 = scf.if %10994 -> (i64) {
      scf.yield %10663 : i64
    } else {
      %10996 = llvm.mlir.addressof @str873 : !llvm.ptr
      %10997 = arith.constant 12 : i64
      %10998 = func.call @cc_make_string(%10996, %10997) : (!llvm.ptr, i64) -> i64
      %10999 = func.call @cc_nil_value() : () -> i64
      %11000 = func.call @cc_intern(%10998, %10999) : (i64, i64) -> i64
      %11001 = func.call @cc_nil_value() : () -> i64
      %11002 = func.call @cc_cons(%11000, %11001) : (i64, i64) -> i64
      %11003 = func.call @cc_values_pack(%11002) : (i64) -> i64
      func.call @stack_push_pointer(%11000) : (i64) -> ()
      %11004 = func.call @stack_pop_pointer() : () -> i64
      %11005 = llvm.mlir.addressof @str874 : !llvm.ptr
      %11006 = arith.constant 3 : i64
      %11007 = func.call @cc_make_string(%11005, %11006) : (!llvm.ptr, i64) -> i64
      %11008 = func.call @cc_nil_value() : () -> i64
      %11009 = func.call @cc_intern(%11007, %11008) : (i64, i64) -> i64
      %11010 = func.call @cc_nil_value() : () -> i64
      %11011 = func.call @cc_cons(%11009, %11010) : (i64, i64) -> i64
      %11012 = func.call @cc_values_pack(%11011) : (i64) -> i64
      func.call @stack_push_pointer(%11009) : (i64) -> ()
      %11013 = llvm.mlir.addressof @str875 : !llvm.ptr
      %11014 = arith.constant 3 : i64
      %11015 = func.call @cc_make_string(%11013, %11014) : (!llvm.ptr, i64) -> i64
      %11016 = func.call @cc_nil_value() : () -> i64
      %11017 = func.call @cc_intern(%11015, %11016) : (i64, i64) -> i64
      %11018 = func.call @cc_nil_value() : () -> i64
      %11019 = func.call @cc_cons(%11017, %11018) : (i64, i64) -> i64
      %11020 = func.call @cc_values_pack(%11019) : (i64) -> i64
      func.call @stack_push_pointer(%11017) : (i64) -> ()
      %11021 = llvm.mlir.addressof @str876 : !llvm.ptr
      %11022 = arith.constant 7 : i64
      %11023 = func.call @cc_make_string(%11021, %11022) : (!llvm.ptr, i64) -> i64
      %11024 = llvm.mlir.addressof @str877 : !llvm.ptr
      %11025 = arith.constant 11 : i64
      %11026 = func.call @cc_make_string(%11024, %11025) : (!llvm.ptr, i64) -> i64
      %11027 = func.call @cc_intern(%11023, %11026) : (i64, i64) -> i64
      %11028 = func.call @cc_nil_value() : () -> i64
      %11029 = func.call @cc_cons(%11027, %11028) : (i64, i64) -> i64
      %11030 = func.call @cc_values_pack(%11029) : (i64) -> i64
      func.call @stack_push_pointer(%11027) : (i64) -> ()
      %11031 = llvm.mlir.addressof @str878 : !llvm.ptr
      %11032 = arith.constant 3 : i64
      %11033 = func.call @cc_make_string(%11031, %11032) : (!llvm.ptr, i64) -> i64
      %11034 = llvm.mlir.addressof @str879 : !llvm.ptr
      %11035 = arith.constant 11 : i64
      %11036 = func.call @cc_make_string(%11034, %11035) : (!llvm.ptr, i64) -> i64
      %11037 = func.call @cc_intern(%11033, %11036) : (i64, i64) -> i64
      %11038 = func.call @cc_nil_value() : () -> i64
      %11039 = func.call @cc_cons(%11037, %11038) : (i64, i64) -> i64
      %11040 = func.call @cc_values_pack(%11039) : (i64) -> i64
      func.call @stack_push_pointer(%11037) : (i64) -> ()
      %11041 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11041) : (i64) -> ()
      %11042 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11042) : (i64) -> ()
      %11043 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11043) : (i64) -> ()
      %11044 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11044) : (i64) -> ()
      %11045 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11045) : (i64) -> ()
      %11046 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11046) : (i64) -> ()
      %11047 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11047) : (i64) -> ()
      %11048 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11048) : (i64) -> ()
      %11049 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11049) : (i64) -> ()
      %11050 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11050) : (i64) -> ()
      %11051 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11051) : (i64) -> ()
      %11052 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11052) : (i64) -> ()
      %11053 = arith.constant 12 : i64
      %11054 = func.call @cc_box_fixnum(%11053) : (i64) -> i64
      %11055 = func.call @cc_make_vector(%11054) : (i64) -> i64
      %11056 = func.call @stack_pop_pointer() : () -> i64
      %11057 = arith.constant 11 : i64
      %11058 = func.call @cc_box_fixnum(%11057) : (i64) -> i64
      %11059 = func.call @cc_svset(%11055, %11058, %11056) : (i64, i64, i64) -> i64
      %11060 = func.call @stack_pop_pointer() : () -> i64
      %11061 = arith.constant 10 : i64
      %11062 = func.call @cc_box_fixnum(%11061) : (i64) -> i64
      %11063 = func.call @cc_svset(%11055, %11062, %11060) : (i64, i64, i64) -> i64
      %11064 = func.call @stack_pop_pointer() : () -> i64
      %11065 = arith.constant 9 : i64
      %11066 = func.call @cc_box_fixnum(%11065) : (i64) -> i64
      %11067 = func.call @cc_svset(%11055, %11066, %11064) : (i64, i64, i64) -> i64
      %11068 = func.call @stack_pop_pointer() : () -> i64
      %11069 = arith.constant 8 : i64
      %11070 = func.call @cc_box_fixnum(%11069) : (i64) -> i64
      %11071 = func.call @cc_svset(%11055, %11070, %11068) : (i64, i64, i64) -> i64
      %11072 = func.call @stack_pop_pointer() : () -> i64
      %11073 = arith.constant 7 : i64
      %11074 = func.call @cc_box_fixnum(%11073) : (i64) -> i64
      %11075 = func.call @cc_svset(%11055, %11074, %11072) : (i64, i64, i64) -> i64
      %11076 = func.call @stack_pop_pointer() : () -> i64
      %11077 = arith.constant 6 : i64
      %11078 = func.call @cc_box_fixnum(%11077) : (i64) -> i64
      %11079 = func.call @cc_svset(%11055, %11078, %11076) : (i64, i64, i64) -> i64
      %11080 = func.call @stack_pop_pointer() : () -> i64
      %11081 = arith.constant 5 : i64
      %11082 = func.call @cc_box_fixnum(%11081) : (i64) -> i64
      %11083 = func.call @cc_svset(%11055, %11082, %11080) : (i64, i64, i64) -> i64
      %11084 = func.call @stack_pop_pointer() : () -> i64
      %11085 = arith.constant 4 : i64
      %11086 = func.call @cc_box_fixnum(%11085) : (i64) -> i64
      %11087 = func.call @cc_svset(%11055, %11086, %11084) : (i64, i64, i64) -> i64
      %11088 = func.call @stack_pop_pointer() : () -> i64
      %11089 = arith.constant 3 : i64
      %11090 = func.call @cc_box_fixnum(%11089) : (i64) -> i64
      %11091 = func.call @cc_svset(%11055, %11090, %11088) : (i64, i64, i64) -> i64
      %11092 = func.call @stack_pop_pointer() : () -> i64
      %11093 = arith.constant 2 : i64
      %11094 = func.call @cc_box_fixnum(%11093) : (i64) -> i64
      %11095 = func.call @cc_svset(%11055, %11094, %11092) : (i64, i64, i64) -> i64
      %11096 = func.call @stack_pop_pointer() : () -> i64
      %11097 = arith.constant 1 : i64
      %11098 = func.call @cc_box_fixnum(%11097) : (i64) -> i64
      %11099 = func.call @cc_svset(%11055, %11098, %11096) : (i64, i64, i64) -> i64
      %11100 = func.call @stack_pop_pointer() : () -> i64
      %11101 = arith.constant 0 : i64
      %11102 = func.call @cc_box_fixnum(%11101) : (i64) -> i64
      %11103 = func.call @cc_svset(%11055, %11102, %11100) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%11055) : (i64) -> ()
      %11104 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%11104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %11114 = func.call @stack_pop_pointer() : () -> i64
      %11115 = func.call @stack_pop_pointer() : () -> i64
      %11116 = func.call @cc_cons(%11115, %11114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11116) : (i64) -> ()
      %11117 = func.call @stack_pop_pointer() : () -> i64
      %11118 = func.call @stack_pop_pointer() : () -> i64
      %11119 = func.call @cc_cons(%11118, %11117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11119) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11120 = func.call @stack_pop_pointer() : () -> i64
      %11121 = func.call @stack_pop_pointer() : () -> i64
      %11122 = func.call @cc_cons(%11121, %11120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11122) : (i64) -> ()
      %11123 = func.call @stack_pop_pointer() : () -> i64
      %11124 = func.call @stack_pop_pointer() : () -> i64
      %11125 = func.call @cc_cons(%11124, %11123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11126 = func.call @stack_pop_pointer() : () -> i64
      %11127 = func.call @stack_pop_pointer() : () -> i64
      %11128 = func.call @cc_cons(%11127, %11126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11128) : (i64) -> ()
      %11129 = func.call @stack_pop_pointer() : () -> i64
      %11130 = func.call @stack_pop_pointer() : () -> i64
      %11131 = func.call @cc_cons(%11130, %11129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11131) : (i64) -> ()
      %11132 = func.call @stack_pop_pointer() : () -> i64
      %11230 = arith.constant 15079495958563 : i64
      %11231 = arith.constant 0 : i64
      %11232 = func.call @cc_make_closure(%11230, %11231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11232) : (i64) -> ()
      %11233 = func.call @stack_pop_pointer() : () -> i64
      %11234 = llvm.mlir.addressof @str881 : !llvm.ptr
      %11235 = arith.constant 1 : i64
      %11236 = func.call @cc_make_string(%11234, %11235) : (!llvm.ptr, i64) -> i64
      %11237 = func.call @cc_nil_value() : () -> i64
      %11238 = func.call @cc_intern(%11236, %11237) : (i64, i64) -> i64
      %11239 = func.call @cc_nil_value() : () -> i64
      %11240 = func.call @cc_cons(%11238, %11239) : (i64, i64) -> i64
      %11241 = func.call @cc_values_pack(%11240) : (i64) -> i64
      func.call @stack_push_pointer(%11238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11242 = func.call @stack_pop_pointer() : () -> i64
      %11243 = func.call @stack_pop_pointer() : () -> i64
      %11244 = func.call @cc_cons(%11243, %11242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11244) : (i64) -> ()
      %11245 = func.call @stack_pop_pointer() : () -> i64
      %11246 = llvm.mlir.addressof @str882 : !llvm.ptr
      %11247 = arith.constant 11 : i64
      %11248 = func.call @cc_make_string(%11246, %11247) : (!llvm.ptr, i64) -> i64
      %11249 = llvm.mlir.addressof @str883 : !llvm.ptr
      %11250 = arith.constant 7 : i64
      %11251 = func.call @cc_make_string(%11249, %11250) : (!llvm.ptr, i64) -> i64
      %11252 = func.call @cc_intern(%11248, %11251) : (i64, i64) -> i64
      %11253 = func.call @cc_nil_value() : () -> i64
      %11254 = func.call @cc_cons(%11252, %11253) : (i64, i64) -> i64
      %11255 = func.call @cc_values_pack(%11254) : (i64) -> i64
      func.call @stack_push_pointer(%11252) : (i64) -> ()
      %11256 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %11257 = func.call @stack_pop_pointer() : () -> i64
      %11258 = llvm.mlir.addressof @str884 : !llvm.ptr
      %11259 = arith.constant 4 : i64
      %11260 = func.call @cc_make_string(%11258, %11259) : (!llvm.ptr, i64) -> i64
      %11261 = llvm.mlir.addressof @str885 : !llvm.ptr
      %11262 = arith.constant 7 : i64
      %11263 = func.call @cc_make_string(%11261, %11262) : (!llvm.ptr, i64) -> i64
      %11264 = func.call @cc_intern(%11260, %11263) : (i64, i64) -> i64
      %11265 = func.call @cc_nil_value() : () -> i64
      %11266 = func.call @cc_cons(%11264, %11265) : (i64, i64) -> i64
      %11267 = func.call @cc_values_pack(%11266) : (i64) -> i64
      func.call @stack_push_pointer(%11264) : (i64) -> ()
      %11268 = func.call @stack_pop_pointer() : () -> i64
      %11269 = llvm.mlir.addressof @str886 : !llvm.ptr
      %11270 = arith.constant 6 : i64
      %11271 = func.call @cc_make_string(%11269, %11270) : (!llvm.ptr, i64) -> i64
      %11272 = func.call @cc_nil_value() : () -> i64
      %11273 = func.call @cc_intern(%11271, %11272) : (i64, i64) -> i64
      %11274 = func.call @cc_nil_value() : () -> i64
      %11275 = func.call @cc_cons(%11273, %11274) : (i64, i64) -> i64
      %11276 = func.call @cc_values_pack(%11275) : (i64) -> i64
      func.call @stack_push_pointer(%11273) : (i64) -> ()
      %11277 = func.call @stack_pop_pointer() : () -> i64
      %11278 = func.call @cc_nil_value() : () -> i64
      %11279 = func.call @cc_errorp(%11004) : (i64) -> i64
      %11280 = arith.cmpi ne, %11279, %11278 : i64
      %11281 = arith.cmpi eq, %11278, %11278 : i64
      %11282 = arith.andi %11280, %11281 : i1
      %11283 = scf.if %11282 -> (i64) {
        scf.yield %11004 : i64
      } else {
        scf.yield %11278 : i64
      }
      %11284 = func.call @cc_errorp(%11132) : (i64) -> i64
      %11285 = arith.cmpi ne, %11284, %11278 : i64
      %11286 = arith.cmpi eq, %11283, %11278 : i64
      %11287 = arith.andi %11285, %11286 : i1
      %11288 = scf.if %11287 -> (i64) {
        scf.yield %11132 : i64
      } else {
        scf.yield %11283 : i64
      }
      %11289 = func.call @cc_errorp(%11233) : (i64) -> i64
      %11290 = arith.cmpi ne, %11289, %11278 : i64
      %11291 = arith.cmpi eq, %11288, %11278 : i64
      %11292 = arith.andi %11290, %11291 : i1
      %11293 = scf.if %11292 -> (i64) {
        scf.yield %11233 : i64
      } else {
        scf.yield %11288 : i64
      }
      %11294 = func.call @cc_errorp(%11245) : (i64) -> i64
      %11295 = arith.cmpi ne, %11294, %11278 : i64
      %11296 = arith.cmpi eq, %11293, %11278 : i64
      %11297 = arith.andi %11295, %11296 : i1
      %11298 = scf.if %11297 -> (i64) {
        scf.yield %11245 : i64
      } else {
        scf.yield %11293 : i64
      }
      %11299 = func.call @cc_errorp(%11256) : (i64) -> i64
      %11300 = arith.cmpi ne, %11299, %11278 : i64
      %11301 = arith.cmpi eq, %11298, %11278 : i64
      %11302 = arith.andi %11300, %11301 : i1
      %11303 = scf.if %11302 -> (i64) {
        scf.yield %11256 : i64
      } else {
        scf.yield %11298 : i64
      }
      %11304 = func.call @cc_errorp(%11257) : (i64) -> i64
      %11305 = arith.cmpi ne, %11304, %11278 : i64
      %11306 = arith.cmpi eq, %11303, %11278 : i64
      %11307 = arith.andi %11305, %11306 : i1
      %11308 = scf.if %11307 -> (i64) {
        scf.yield %11257 : i64
      } else {
        scf.yield %11303 : i64
      }
      %11309 = func.call @cc_errorp(%11268) : (i64) -> i64
      %11310 = arith.cmpi ne, %11309, %11278 : i64
      %11311 = arith.cmpi eq, %11308, %11278 : i64
      %11312 = arith.andi %11310, %11311 : i1
      %11313 = scf.if %11312 -> (i64) {
        scf.yield %11268 : i64
      } else {
        scf.yield %11308 : i64
      }
      %11314 = func.call @cc_errorp(%11277) : (i64) -> i64
      %11315 = arith.cmpi ne, %11314, %11278 : i64
      %11316 = arith.cmpi eq, %11313, %11278 : i64
      %11317 = arith.andi %11315, %11316 : i1
      %11318 = scf.if %11317 -> (i64) {
        scf.yield %11277 : i64
      } else {
        scf.yield %11313 : i64
      }
      %11319 = arith.cmpi ne, %11318, %11278 : i64
      scf.if %11319 {
        func.call @stack_push_pointer(%11318) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11004) : (i64) -> ()
        func.call @stack_push_pointer(%11132) : (i64) -> ()
        func.call @stack_push_pointer(%11233) : (i64) -> ()
        func.call @stack_push_pointer(%11245) : (i64) -> ()
        func.call @stack_push_pointer(%11256) : (i64) -> ()
        func.call @stack_push_pointer(%11257) : (i64) -> ()
        func.call @stack_push_pointer(%11268) : (i64) -> ()
        func.call @stack_push_pointer(%11277) : (i64) -> ()
        %11320 = llvm.mlir.addressof @str887 : !llvm.ptr
        %11321 = func.call @cc_make_function_ref_const(%11320) : (!llvm.ptr) -> i64
        %11322 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11321, %11322) : (i64, i64) -> ()
      }
      %11323 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11323 : i64
    }
    %11324 = func.call @cc_nil_value() : () -> i64
    %11325 = func.call @cc_errorp(%10995) : (i64) -> i64
    %11326 = arith.cmpi ne, %11325, %11324 : i64
    %11327 = scf.if %11326 -> (i64) {
      scf.yield %10995 : i64
    } else {
      %11328 = llvm.mlir.addressof @str888 : !llvm.ptr
      %11329 = arith.constant 12 : i64
      %11330 = func.call @cc_make_string(%11328, %11329) : (!llvm.ptr, i64) -> i64
      %11331 = func.call @cc_nil_value() : () -> i64
      %11332 = func.call @cc_intern(%11330, %11331) : (i64, i64) -> i64
      %11333 = func.call @cc_nil_value() : () -> i64
      %11334 = func.call @cc_cons(%11332, %11333) : (i64, i64) -> i64
      %11335 = func.call @cc_values_pack(%11334) : (i64) -> i64
      func.call @stack_push_pointer(%11332) : (i64) -> ()
      %11336 = func.call @stack_pop_pointer() : () -> i64
      %11337 = llvm.mlir.addressof @str889 : !llvm.ptr
      %11338 = arith.constant 3 : i64
      %11339 = func.call @cc_make_string(%11337, %11338) : (!llvm.ptr, i64) -> i64
      %11340 = func.call @cc_nil_value() : () -> i64
      %11341 = func.call @cc_intern(%11339, %11340) : (i64, i64) -> i64
      %11342 = func.call @cc_nil_value() : () -> i64
      %11343 = func.call @cc_cons(%11341, %11342) : (i64, i64) -> i64
      %11344 = func.call @cc_values_pack(%11343) : (i64) -> i64
      func.call @stack_push_pointer(%11341) : (i64) -> ()
      %11345 = llvm.mlir.addressof @str890 : !llvm.ptr
      %11346 = arith.constant 3 : i64
      %11347 = func.call @cc_make_string(%11345, %11346) : (!llvm.ptr, i64) -> i64
      %11348 = func.call @cc_nil_value() : () -> i64
      %11349 = func.call @cc_intern(%11347, %11348) : (i64, i64) -> i64
      %11350 = func.call @cc_nil_value() : () -> i64
      %11351 = func.call @cc_cons(%11349, %11350) : (i64, i64) -> i64
      %11352 = func.call @cc_values_pack(%11351) : (i64) -> i64
      func.call @stack_push_pointer(%11349) : (i64) -> ()
      %11353 = llvm.mlir.addressof @str891 : !llvm.ptr
      %11354 = arith.constant 7 : i64
      %11355 = func.call @cc_make_string(%11353, %11354) : (!llvm.ptr, i64) -> i64
      %11356 = llvm.mlir.addressof @str892 : !llvm.ptr
      %11357 = arith.constant 11 : i64
      %11358 = func.call @cc_make_string(%11356, %11357) : (!llvm.ptr, i64) -> i64
      %11359 = func.call @cc_intern(%11355, %11358) : (i64, i64) -> i64
      %11360 = func.call @cc_nil_value() : () -> i64
      %11361 = func.call @cc_cons(%11359, %11360) : (i64, i64) -> i64
      %11362 = func.call @cc_values_pack(%11361) : (i64) -> i64
      func.call @stack_push_pointer(%11359) : (i64) -> ()
      %11363 = llvm.mlir.addressof @str893 : !llvm.ptr
      %11364 = arith.constant 4 : i64
      %11365 = func.call @cc_make_string(%11363, %11364) : (!llvm.ptr, i64) -> i64
      %11366 = llvm.mlir.addressof @str894 : !llvm.ptr
      %11367 = arith.constant 11 : i64
      %11368 = func.call @cc_make_string(%11366, %11367) : (!llvm.ptr, i64) -> i64
      %11369 = func.call @cc_intern(%11365, %11368) : (i64, i64) -> i64
      %11370 = func.call @cc_nil_value() : () -> i64
      %11371 = func.call @cc_cons(%11369, %11370) : (i64, i64) -> i64
      %11372 = func.call @cc_values_pack(%11371) : (i64) -> i64
      func.call @stack_push_pointer(%11369) : (i64) -> ()
      %11373 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11373) : (i64) -> ()
      %11374 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11374) : (i64) -> ()
      %11375 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11375) : (i64) -> ()
      %11376 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11376) : (i64) -> ()
      %11377 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11377) : (i64) -> ()
      %11378 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11378) : (i64) -> ()
      %11379 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11379) : (i64) -> ()
      %11380 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11380) : (i64) -> ()
      %11381 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11381) : (i64) -> ()
      %11382 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11382) : (i64) -> ()
      %11383 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11383) : (i64) -> ()
      %11384 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11384) : (i64) -> ()
      %11385 = arith.constant 12 : i64
      %11386 = func.call @cc_box_fixnum(%11385) : (i64) -> i64
      %11387 = func.call @cc_make_vector(%11386) : (i64) -> i64
      %11388 = func.call @stack_pop_pointer() : () -> i64
      %11389 = arith.constant 11 : i64
      %11390 = func.call @cc_box_fixnum(%11389) : (i64) -> i64
      %11391 = func.call @cc_svset(%11387, %11390, %11388) : (i64, i64, i64) -> i64
      %11392 = func.call @stack_pop_pointer() : () -> i64
      %11393 = arith.constant 10 : i64
      %11394 = func.call @cc_box_fixnum(%11393) : (i64) -> i64
      %11395 = func.call @cc_svset(%11387, %11394, %11392) : (i64, i64, i64) -> i64
      %11396 = func.call @stack_pop_pointer() : () -> i64
      %11397 = arith.constant 9 : i64
      %11398 = func.call @cc_box_fixnum(%11397) : (i64) -> i64
      %11399 = func.call @cc_svset(%11387, %11398, %11396) : (i64, i64, i64) -> i64
      %11400 = func.call @stack_pop_pointer() : () -> i64
      %11401 = arith.constant 8 : i64
      %11402 = func.call @cc_box_fixnum(%11401) : (i64) -> i64
      %11403 = func.call @cc_svset(%11387, %11402, %11400) : (i64, i64, i64) -> i64
      %11404 = func.call @stack_pop_pointer() : () -> i64
      %11405 = arith.constant 7 : i64
      %11406 = func.call @cc_box_fixnum(%11405) : (i64) -> i64
      %11407 = func.call @cc_svset(%11387, %11406, %11404) : (i64, i64, i64) -> i64
      %11408 = func.call @stack_pop_pointer() : () -> i64
      %11409 = arith.constant 6 : i64
      %11410 = func.call @cc_box_fixnum(%11409) : (i64) -> i64
      %11411 = func.call @cc_svset(%11387, %11410, %11408) : (i64, i64, i64) -> i64
      %11412 = func.call @stack_pop_pointer() : () -> i64
      %11413 = arith.constant 5 : i64
      %11414 = func.call @cc_box_fixnum(%11413) : (i64) -> i64
      %11415 = func.call @cc_svset(%11387, %11414, %11412) : (i64, i64, i64) -> i64
      %11416 = func.call @stack_pop_pointer() : () -> i64
      %11417 = arith.constant 4 : i64
      %11418 = func.call @cc_box_fixnum(%11417) : (i64) -> i64
      %11419 = func.call @cc_svset(%11387, %11418, %11416) : (i64, i64, i64) -> i64
      %11420 = func.call @stack_pop_pointer() : () -> i64
      %11421 = arith.constant 3 : i64
      %11422 = func.call @cc_box_fixnum(%11421) : (i64) -> i64
      %11423 = func.call @cc_svset(%11387, %11422, %11420) : (i64, i64, i64) -> i64
      %11424 = func.call @stack_pop_pointer() : () -> i64
      %11425 = arith.constant 2 : i64
      %11426 = func.call @cc_box_fixnum(%11425) : (i64) -> i64
      %11427 = func.call @cc_svset(%11387, %11426, %11424) : (i64, i64, i64) -> i64
      %11428 = func.call @stack_pop_pointer() : () -> i64
      %11429 = arith.constant 1 : i64
      %11430 = func.call @cc_box_fixnum(%11429) : (i64) -> i64
      %11431 = func.call @cc_svset(%11387, %11430, %11428) : (i64, i64, i64) -> i64
      %11432 = func.call @stack_pop_pointer() : () -> i64
      %11433 = arith.constant 0 : i64
      %11434 = func.call @cc_box_fixnum(%11433) : (i64) -> i64
      %11435 = func.call @cc_svset(%11387, %11434, %11432) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%11387) : (i64) -> ()
      %11436 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%11436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11437 = func.call @stack_pop_pointer() : () -> i64
      %11438 = func.call @stack_pop_pointer() : () -> i64
      %11439 = func.call @cc_cons(%11438, %11437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11439) : (i64) -> ()
      %11440 = func.call @stack_pop_pointer() : () -> i64
      %11441 = func.call @stack_pop_pointer() : () -> i64
      %11442 = func.call @cc_cons(%11441, %11440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11442) : (i64) -> ()
      %11443 = func.call @stack_pop_pointer() : () -> i64
      %11444 = func.call @stack_pop_pointer() : () -> i64
      %11445 = func.call @cc_cons(%11444, %11443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11445) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11446 = func.call @stack_pop_pointer() : () -> i64
      %11447 = func.call @stack_pop_pointer() : () -> i64
      %11448 = func.call @cc_cons(%11447, %11446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11448) : (i64) -> ()
      %11449 = func.call @stack_pop_pointer() : () -> i64
      %11450 = func.call @stack_pop_pointer() : () -> i64
      %11451 = func.call @cc_cons(%11450, %11449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11451) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11452 = func.call @stack_pop_pointer() : () -> i64
      %11453 = func.call @stack_pop_pointer() : () -> i64
      %11454 = func.call @cc_cons(%11453, %11452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11454) : (i64) -> ()
      %11455 = func.call @stack_pop_pointer() : () -> i64
      %11456 = func.call @stack_pop_pointer() : () -> i64
      %11457 = func.call @cc_cons(%11456, %11455) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11458 = func.call @stack_pop_pointer() : () -> i64
      %11459 = func.call @stack_pop_pointer() : () -> i64
      %11460 = func.call @cc_cons(%11459, %11458) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11460) : (i64) -> ()
      %11461 = func.call @stack_pop_pointer() : () -> i64
      %11462 = func.call @stack_pop_pointer() : () -> i64
      %11463 = func.call @cc_cons(%11462, %11461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11463) : (i64) -> ()
      %11464 = func.call @stack_pop_pointer() : () -> i64
      %11562 = arith.constant 15079495958564 : i64
      %11563 = arith.constant 0 : i64
      %11564 = func.call @cc_make_closure(%11562, %11563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11564) : (i64) -> ()
      %11565 = func.call @stack_pop_pointer() : () -> i64
      %11566 = llvm.mlir.addressof @str896 : !llvm.ptr
      %11567 = arith.constant 1 : i64
      %11568 = func.call @cc_make_string(%11566, %11567) : (!llvm.ptr, i64) -> i64
      %11569 = func.call @cc_nil_value() : () -> i64
      %11570 = func.call @cc_intern(%11568, %11569) : (i64, i64) -> i64
      %11571 = func.call @cc_nil_value() : () -> i64
      %11572 = func.call @cc_cons(%11570, %11571) : (i64, i64) -> i64
      %11573 = func.call @cc_values_pack(%11572) : (i64) -> i64
      func.call @stack_push_pointer(%11570) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11574 = func.call @stack_pop_pointer() : () -> i64
      %11575 = func.call @stack_pop_pointer() : () -> i64
      %11576 = func.call @cc_cons(%11575, %11574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11576) : (i64) -> ()
      %11577 = func.call @stack_pop_pointer() : () -> i64
      %11578 = llvm.mlir.addressof @str897 : !llvm.ptr
      %11579 = arith.constant 11 : i64
      %11580 = func.call @cc_make_string(%11578, %11579) : (!llvm.ptr, i64) -> i64
      %11581 = llvm.mlir.addressof @str898 : !llvm.ptr
      %11582 = arith.constant 7 : i64
      %11583 = func.call @cc_make_string(%11581, %11582) : (!llvm.ptr, i64) -> i64
      %11584 = func.call @cc_intern(%11580, %11583) : (i64, i64) -> i64
      %11585 = func.call @cc_nil_value() : () -> i64
      %11586 = func.call @cc_cons(%11584, %11585) : (i64, i64) -> i64
      %11587 = func.call @cc_values_pack(%11586) : (i64) -> i64
      func.call @stack_push_pointer(%11584) : (i64) -> ()
      %11588 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %11589 = func.call @stack_pop_pointer() : () -> i64
      %11590 = llvm.mlir.addressof @str899 : !llvm.ptr
      %11591 = arith.constant 4 : i64
      %11592 = func.call @cc_make_string(%11590, %11591) : (!llvm.ptr, i64) -> i64
      %11593 = llvm.mlir.addressof @str900 : !llvm.ptr
      %11594 = arith.constant 7 : i64
      %11595 = func.call @cc_make_string(%11593, %11594) : (!llvm.ptr, i64) -> i64
      %11596 = func.call @cc_intern(%11592, %11595) : (i64, i64) -> i64
      %11597 = func.call @cc_nil_value() : () -> i64
      %11598 = func.call @cc_cons(%11596, %11597) : (i64, i64) -> i64
      %11599 = func.call @cc_values_pack(%11598) : (i64) -> i64
      func.call @stack_push_pointer(%11596) : (i64) -> ()
      %11600 = func.call @stack_pop_pointer() : () -> i64
      %11601 = llvm.mlir.addressof @str901 : !llvm.ptr
      %11602 = arith.constant 6 : i64
      %11603 = func.call @cc_make_string(%11601, %11602) : (!llvm.ptr, i64) -> i64
      %11604 = func.call @cc_nil_value() : () -> i64
      %11605 = func.call @cc_intern(%11603, %11604) : (i64, i64) -> i64
      %11606 = func.call @cc_nil_value() : () -> i64
      %11607 = func.call @cc_cons(%11605, %11606) : (i64, i64) -> i64
      %11608 = func.call @cc_values_pack(%11607) : (i64) -> i64
      func.call @stack_push_pointer(%11605) : (i64) -> ()
      %11609 = func.call @stack_pop_pointer() : () -> i64
      %11610 = func.call @cc_nil_value() : () -> i64
      %11611 = func.call @cc_errorp(%11336) : (i64) -> i64
      %11612 = arith.cmpi ne, %11611, %11610 : i64
      %11613 = arith.cmpi eq, %11610, %11610 : i64
      %11614 = arith.andi %11612, %11613 : i1
      %11615 = scf.if %11614 -> (i64) {
        scf.yield %11336 : i64
      } else {
        scf.yield %11610 : i64
      }
      %11616 = func.call @cc_errorp(%11464) : (i64) -> i64
      %11617 = arith.cmpi ne, %11616, %11610 : i64
      %11618 = arith.cmpi eq, %11615, %11610 : i64
      %11619 = arith.andi %11617, %11618 : i1
      %11620 = scf.if %11619 -> (i64) {
        scf.yield %11464 : i64
      } else {
        scf.yield %11615 : i64
      }
      %11621 = func.call @cc_errorp(%11565) : (i64) -> i64
      %11622 = arith.cmpi ne, %11621, %11610 : i64
      %11623 = arith.cmpi eq, %11620, %11610 : i64
      %11624 = arith.andi %11622, %11623 : i1
      %11625 = scf.if %11624 -> (i64) {
        scf.yield %11565 : i64
      } else {
        scf.yield %11620 : i64
      }
      %11626 = func.call @cc_errorp(%11577) : (i64) -> i64
      %11627 = arith.cmpi ne, %11626, %11610 : i64
      %11628 = arith.cmpi eq, %11625, %11610 : i64
      %11629 = arith.andi %11627, %11628 : i1
      %11630 = scf.if %11629 -> (i64) {
        scf.yield %11577 : i64
      } else {
        scf.yield %11625 : i64
      }
      %11631 = func.call @cc_errorp(%11588) : (i64) -> i64
      %11632 = arith.cmpi ne, %11631, %11610 : i64
      %11633 = arith.cmpi eq, %11630, %11610 : i64
      %11634 = arith.andi %11632, %11633 : i1
      %11635 = scf.if %11634 -> (i64) {
        scf.yield %11588 : i64
      } else {
        scf.yield %11630 : i64
      }
      %11636 = func.call @cc_errorp(%11589) : (i64) -> i64
      %11637 = arith.cmpi ne, %11636, %11610 : i64
      %11638 = arith.cmpi eq, %11635, %11610 : i64
      %11639 = arith.andi %11637, %11638 : i1
      %11640 = scf.if %11639 -> (i64) {
        scf.yield %11589 : i64
      } else {
        scf.yield %11635 : i64
      }
      %11641 = func.call @cc_errorp(%11600) : (i64) -> i64
      %11642 = arith.cmpi ne, %11641, %11610 : i64
      %11643 = arith.cmpi eq, %11640, %11610 : i64
      %11644 = arith.andi %11642, %11643 : i1
      %11645 = scf.if %11644 -> (i64) {
        scf.yield %11600 : i64
      } else {
        scf.yield %11640 : i64
      }
      %11646 = func.call @cc_errorp(%11609) : (i64) -> i64
      %11647 = arith.cmpi ne, %11646, %11610 : i64
      %11648 = arith.cmpi eq, %11645, %11610 : i64
      %11649 = arith.andi %11647, %11648 : i1
      %11650 = scf.if %11649 -> (i64) {
        scf.yield %11609 : i64
      } else {
        scf.yield %11645 : i64
      }
      %11651 = arith.cmpi ne, %11650, %11610 : i64
      scf.if %11651 {
        func.call @stack_push_pointer(%11650) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11336) : (i64) -> ()
        func.call @stack_push_pointer(%11464) : (i64) -> ()
        func.call @stack_push_pointer(%11565) : (i64) -> ()
        func.call @stack_push_pointer(%11577) : (i64) -> ()
        func.call @stack_push_pointer(%11588) : (i64) -> ()
        func.call @stack_push_pointer(%11589) : (i64) -> ()
        func.call @stack_push_pointer(%11600) : (i64) -> ()
        func.call @stack_push_pointer(%11609) : (i64) -> ()
        %11652 = llvm.mlir.addressof @str902 : !llvm.ptr
        %11653 = func.call @cc_make_function_ref_const(%11652) : (!llvm.ptr) -> i64
        %11654 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11653, %11654) : (i64, i64) -> ()
      }
      %11655 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11655 : i64
    }
    func.call @stack_push_pointer(%11327) : (i64) -> ()
    %11656 = func.call @stack_pop_pointer() : () -> i64
    %11657 = func.call @cc_multiple_value_list(%11656) : (i64) -> i64
    %11658 = llvm.mlir.addressof @str903 : !llvm.ptr
    %11659 = arith.constant 37 : i64
    %11660 = func.call @cc_make_string(%11658, %11659) : (!llvm.ptr, i64) -> i64
    %11661 = func.call @cc_nil_value() : () -> i64
    %11662 = func.call @cc_intern(%11660, %11661) : (i64, i64) -> i64
    %11663 = func.call @cc_nil_value() : () -> i64
    %11664 = func.call @cc_cons(%11662, %11663) : (i64, i64) -> i64
    %11665 = func.call @cc_values_pack(%11664) : (i64) -> i64
    %11666 = func.call @cc_symbol_value(%11662) : (i64) -> i64
    %11667 = llvm.mlir.addressof @str904 : !llvm.ptr
    %11668 = arith.constant 39 : i64
    %11669 = func.call @cc_make_string(%11667, %11668) : (!llvm.ptr, i64) -> i64
    %11670 = func.call @cc_nil_value() : () -> i64
    %11671 = func.call @cc_intern(%11669, %11670) : (i64, i64) -> i64
    %11672 = func.call @cc_nil_value() : () -> i64
    %11673 = func.call @cc_cons(%11671, %11672) : (i64, i64) -> i64
    %11674 = func.call @cc_values_pack(%11673) : (i64) -> i64
    %11675 = func.call @cc_symbol_value(%11671) : (i64) -> i64
    %11676 = func.call @cc_nil_value() : () -> i64
    %11677 = arith.cmpi ne, %11666, %11676 : i64
    %11678 = scf.if %11677 -> (i64) {
      scf.yield %11675 : i64
    } else {
      scf.yield %11657 : i64
    }
    %11679 = func.call @cc_values_pack(%11678) : (i64) -> i64
    func.call @stack_push_pointer(%11679) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_15079495958529"() {
    %141 = func.call @cc_nil_value() : () -> i64
    %142 = func.call @cc_nil_value() : () -> i64
    %143 = func.call @cc_errorp(%141) : (i64) -> i64
    %144 = arith.cmpi ne, %143, %142 : i64
    %145 = scf.if %144 -> (i64) {
      scf.yield %141 : i64
    } else {
      %146 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%146) : (i64) -> ()
      %147 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%147) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = func.call @cc_cons(%149, %148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @stack_pop_pointer() : () -> i64
      %153 = func.call @cc_cons(%152, %151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%153) : (i64) -> ()
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = llvm.mlir.addressof @str13 : !llvm.ptr
      %156 = arith.constant 12 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = llvm.mlir.addressof @str14 : !llvm.ptr
      %159 = arith.constant 7 : i64
      %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
      %161 = func.call @cc_intern(%157, %160) : (i64, i64) -> i64
      %162 = func.call @cc_nil_value() : () -> i64
      %163 = func.call @cc_cons(%161, %162) : (i64, i64) -> i64
      %164 = func.call @cc_values_pack(%163) : (i64) -> i64
      func.call @stack_push_pointer(%161) : (i64) -> ()
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_nil_value() : () -> i64
      %169 = func.call @cc_errorp(%154) : (i64) -> i64
      %170 = arith.cmpi ne, %169, %168 : i64
      %171 = arith.cmpi eq, %168, %168 : i64
      %172 = arith.andi %170, %171 : i1
      %173 = scf.if %172 -> (i64) {
        scf.yield %154 : i64
      } else {
        scf.yield %168 : i64
      }
      %174 = func.call @cc_errorp(%165) : (i64) -> i64
      %175 = arith.cmpi ne, %174, %168 : i64
      %176 = arith.cmpi eq, %173, %168 : i64
      %177 = arith.andi %175, %176 : i1
      %178 = scf.if %177 -> (i64) {
        scf.yield %165 : i64
      } else {
        scf.yield %173 : i64
      }
      %179 = func.call @cc_errorp(%167) : (i64) -> i64
      %180 = arith.cmpi ne, %179, %168 : i64
      %181 = arith.cmpi eq, %178, %168 : i64
      %182 = arith.andi %180, %181 : i1
      %183 = scf.if %182 -> (i64) {
        scf.yield %167 : i64
      } else {
        scf.yield %178 : i64
      }
      %184 = arith.cmpi ne, %183, %168 : i64
      scf.if %184 {
        func.call @stack_push_pointer(%183) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%154) : (i64) -> ()
        func.call @stack_push_pointer(%165) : (i64) -> ()
        func.call @stack_push_pointer(%167) : (i64) -> ()
        %185 = llvm.mlir.addressof @str15 : !llvm.ptr
        %186 = func.call @cc_make_function_ref_const(%185) : (!llvm.ptr) -> i64
        %187 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%186, %187) : (i64, i64) -> ()
      }
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%189) : (i64) -> ()
      %190 = func.call @stack_pop_pointer() : () -> i64
      %191 = func.call @cc_nil_value() : () -> i64
      %192 = func.call @cc_errorp(%188) : (i64) -> i64
      %193 = arith.cmpi ne, %192, %191 : i64
      %194 = arith.cmpi eq, %191, %191 : i64
      %195 = arith.andi %193, %194 : i1
      %196 = scf.if %195 -> (i64) {
        scf.yield %188 : i64
      } else {
        scf.yield %191 : i64
      }
      %197 = func.call @cc_errorp(%190) : (i64) -> i64
      %198 = arith.cmpi ne, %197, %191 : i64
      %199 = arith.cmpi eq, %196, %191 : i64
      %200 = arith.andi %198, %199 : i1
      %201 = scf.if %200 -> (i64) {
        scf.yield %190 : i64
      } else {
        scf.yield %196 : i64
      }
      %202 = arith.cmpi ne, %201, %191 : i64
      scf.if %202 {
        func.call @stack_push_pointer(%201) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%188) : (i64) -> ()
        func.call @stack_push_pointer(%190) : (i64) -> ()
        %203 = llvm.mlir.addressof @str16 : !llvm.ptr
        %204 = func.call @cc_make_function_ref_const(%203) : (!llvm.ptr) -> i64
        %205 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%204, %205) : (i64, i64) -> ()
      }
      %206 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %206 : i64
    }
    func.call @stack_push_pointer(%145) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958530"() {
    %460 = func.call @cc_nil_value() : () -> i64
    %461 = func.call @cc_nil_value() : () -> i64
    %462 = func.call @cc_errorp(%460) : (i64) -> i64
    %463 = arith.cmpi ne, %462, %461 : i64
    %464 = scf.if %463 -> (i64) {
      scf.yield %460 : i64
    } else {
      %465 = llvm.mlir.addressof @str40 : !llvm.ptr
      %466 = arith.constant 13 : i64
      %467 = func.call @cc_make_string(%465, %466) : (!llvm.ptr, i64) -> i64
      %468 = llvm.mlir.addressof @str41 : !llvm.ptr
      %469 = arith.constant 11 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = func.call @cc_intern(%467, %470) : (i64, i64) -> i64
      %472 = func.call @cc_nil_value() : () -> i64
      %473 = func.call @cc_cons(%471, %472) : (i64, i64) -> i64
      %474 = func.call @cc_values_pack(%473) : (i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%476) : (i64) -> ()
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_nil_value() : () -> i64
      %479 = func.call @cc_errorp(%475) : (i64) -> i64
      %480 = arith.cmpi ne, %479, %478 : i64
      %481 = arith.cmpi eq, %478, %478 : i64
      %482 = arith.andi %480, %481 : i1
      %483 = scf.if %482 -> (i64) {
        scf.yield %475 : i64
      } else {
        scf.yield %478 : i64
      }
      %484 = func.call @cc_errorp(%477) : (i64) -> i64
      %485 = arith.cmpi ne, %484, %478 : i64
      %486 = arith.cmpi eq, %483, %478 : i64
      %487 = arith.andi %485, %486 : i1
      %488 = scf.if %487 -> (i64) {
        scf.yield %477 : i64
      } else {
        scf.yield %483 : i64
      }
      %489 = arith.cmpi ne, %488, %478 : i64
      scf.if %489 {
        func.call @stack_push_pointer(%488) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%475) : (i64) -> ()
        func.call @stack_push_pointer(%477) : (i64) -> ()
        %490 = llvm.mlir.addressof @str42 : !llvm.ptr
        %491 = func.call @cc_make_function_ref_const(%490) : (!llvm.ptr) -> i64
        %492 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%491, %492) : (i64, i64) -> ()
      }
      %493 = func.call @stack_pop_pointer() : () -> i64
      %494 = func.call @cc_type_of(%493) : (i64) -> i64
      func.call @stack_push_pointer(%494) : (i64) -> ()
      %495 = llvm.mlir.addressof @str43 : !llvm.ptr
      %496 = arith.constant 12 : i64
      %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
      %498 = llvm.mlir.addressof @str44 : !llvm.ptr
      %499 = arith.constant 11 : i64
      %500 = func.call @cc_make_string(%498, %499) : (!llvm.ptr, i64) -> i64
      %501 = func.call @cc_intern(%497, %500) : (i64, i64) -> i64
      %502 = func.call @cc_nil_value() : () -> i64
      %503 = func.call @cc_cons(%501, %502) : (i64, i64) -> i64
      %504 = func.call @cc_values_pack(%503) : (i64) -> i64
      func.call @stack_push_pointer(%501) : (i64) -> ()
      %505 = llvm.mlir.addressof @str45 : !llvm.ptr
      %506 = arith.constant 9 : i64
      %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
      %508 = llvm.mlir.addressof @str46 : !llvm.ptr
      %509 = arith.constant 11 : i64
      %510 = func.call @cc_make_string(%508, %509) : (!llvm.ptr, i64) -> i64
      %511 = func.call @cc_intern(%507, %510) : (i64, i64) -> i64
      %512 = func.call @cc_nil_value() : () -> i64
      %513 = func.call @cc_cons(%511, %512) : (i64, i64) -> i64
      %514 = func.call @cc_values_pack(%513) : (i64) -> i64
      func.call @stack_push_pointer(%511) : (i64) -> ()
      %515 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @stack_pop_pointer() : () -> i64
      %530 = func.call @cc_subtypep(%529, %528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%530) : (i64) -> ()
      %531 = func.call @stack_pop_pointer() : () -> i64
      %532 = func.call @cc_nil_value() : () -> i64
      %533 = func.call @cc_cons(%531, %532) : (i64, i64) -> i64
      %534 = func.call @cc_not(%533) : (i64) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      %535 = func.call @stack_pop_pointer() : () -> i64
      %536 = func.call @cc_nil_value() : () -> i64
      %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
      %538 = func.call @cc_not(%537) : (i64) -> i64
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %539 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %539 : i64
    }
    func.call @stack_push_pointer(%464) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958531"() {
    %800 = func.call @cc_nil_value() : () -> i64
    %801 = func.call @cc_nil_value() : () -> i64
    %802 = func.call @cc_errorp(%800) : (i64) -> i64
    %803 = arith.cmpi ne, %802, %801 : i64
    %804 = scf.if %803 -> (i64) {
      scf.yield %800 : i64
    } else {
      %805 = llvm.mlir.addressof @str71 : !llvm.ptr
      %806 = arith.constant 18 : i64
      %807 = func.call @cc_make_string(%805, %806) : (!llvm.ptr, i64) -> i64
      %808 = llvm.mlir.addressof @str72 : !llvm.ptr
      %809 = arith.constant 11 : i64
      %810 = func.call @cc_make_string(%808, %809) : (!llvm.ptr, i64) -> i64
      %811 = func.call @cc_intern(%807, %810) : (i64, i64) -> i64
      %812 = func.call @cc_nil_value() : () -> i64
      %813 = func.call @cc_cons(%811, %812) : (i64, i64) -> i64
      %814 = func.call @cc_values_pack(%813) : (i64) -> i64
      func.call @stack_push_pointer(%811) : (i64) -> ()
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%816) : (i64) -> ()
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_errorp(%815) : (i64) -> i64
      %820 = arith.cmpi ne, %819, %818 : i64
      %821 = arith.cmpi eq, %818, %818 : i64
      %822 = arith.andi %820, %821 : i1
      %823 = scf.if %822 -> (i64) {
        scf.yield %815 : i64
      } else {
        scf.yield %818 : i64
      }
      %824 = func.call @cc_errorp(%817) : (i64) -> i64
      %825 = arith.cmpi ne, %824, %818 : i64
      %826 = arith.cmpi eq, %823, %818 : i64
      %827 = arith.andi %825, %826 : i1
      %828 = scf.if %827 -> (i64) {
        scf.yield %817 : i64
      } else {
        scf.yield %823 : i64
      }
      %829 = arith.cmpi ne, %828, %818 : i64
      scf.if %829 {
        func.call @stack_push_pointer(%828) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%815) : (i64) -> ()
        func.call @stack_push_pointer(%817) : (i64) -> ()
        %830 = llvm.mlir.addressof @str73 : !llvm.ptr
        %831 = func.call @cc_make_function_ref_const(%830) : (!llvm.ptr) -> i64
        %832 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%831, %832) : (i64, i64) -> ()
      }
      %833 = func.call @stack_pop_pointer() : () -> i64
      %834 = func.call @cc_type_of(%833) : (i64) -> i64
      func.call @stack_push_pointer(%834) : (i64) -> ()
      %835 = llvm.mlir.addressof @str74 : !llvm.ptr
      %836 = arith.constant 12 : i64
      %837 = func.call @cc_make_string(%835, %836) : (!llvm.ptr, i64) -> i64
      %838 = llvm.mlir.addressof @str75 : !llvm.ptr
      %839 = arith.constant 11 : i64
      %840 = func.call @cc_make_string(%838, %839) : (!llvm.ptr, i64) -> i64
      %841 = func.call @cc_intern(%837, %840) : (i64, i64) -> i64
      %842 = func.call @cc_nil_value() : () -> i64
      %843 = func.call @cc_cons(%841, %842) : (i64, i64) -> i64
      %844 = func.call @cc_values_pack(%843) : (i64) -> i64
      func.call @stack_push_pointer(%841) : (i64) -> ()
      %845 = llvm.mlir.addressof @str76 : !llvm.ptr
      %846 = arith.constant 9 : i64
      %847 = func.call @cc_make_string(%845, %846) : (!llvm.ptr, i64) -> i64
      %848 = llvm.mlir.addressof @str77 : !llvm.ptr
      %849 = arith.constant 11 : i64
      %850 = func.call @cc_make_string(%848, %849) : (!llvm.ptr, i64) -> i64
      %851 = func.call @cc_intern(%847, %850) : (i64, i64) -> i64
      %852 = func.call @cc_nil_value() : () -> i64
      %853 = func.call @cc_cons(%851, %852) : (i64, i64) -> i64
      %854 = func.call @cc_values_pack(%853) : (i64) -> i64
      func.call @stack_push_pointer(%851) : (i64) -> ()
      %855 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%855) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @cc_cons(%857, %856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %870 = func.call @cc_subtypep(%869, %868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%870) : (i64) -> ()
      %871 = func.call @stack_pop_pointer() : () -> i64
      %872 = func.call @cc_nil_value() : () -> i64
      %873 = func.call @cc_cons(%871, %872) : (i64, i64) -> i64
      %874 = func.call @cc_not(%873) : (i64) -> i64
      func.call @stack_push_pointer(%874) : (i64) -> ()
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @cc_nil_value() : () -> i64
      %877 = func.call @cc_cons(%875, %876) : (i64, i64) -> i64
      %878 = func.call @cc_not(%877) : (i64) -> i64
      func.call @stack_push_pointer(%878) : (i64) -> ()
      %879 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %879 : i64
    }
    func.call @stack_push_pointer(%804) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958532"() {
    %1039 = func.call @cc_nil_value() : () -> i64
    %1040 = func.call @cc_nil_value() : () -> i64
    %1041 = func.call @cc_errorp(%1039) : (i64) -> i64
    %1042 = arith.cmpi ne, %1041, %1040 : i64
    %1043 = scf.if %1042 -> (i64) {
      scf.yield %1039 : i64
    } else {
      %1044 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1044) : (i64) -> ()
      %1045 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @cc_cons(%1047, %1046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1048) : (i64) -> ()
      %1049 = func.call @stack_pop_pointer() : () -> i64
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @cc_cons(%1050, %1049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1051) : (i64) -> ()
      %1052 = func.call @stack_pop_pointer() : () -> i64
      %1053 = func.call @cc_nil_value() : () -> i64
      %1054 = func.call @cc_errorp(%1052) : (i64) -> i64
      %1055 = arith.cmpi ne, %1054, %1053 : i64
      %1056 = arith.cmpi eq, %1053, %1053 : i64
      %1057 = arith.andi %1055, %1056 : i1
      %1058 = scf.if %1057 -> (i64) {
        scf.yield %1052 : i64
      } else {
        scf.yield %1053 : i64
      }
      %1059 = arith.cmpi ne, %1058, %1053 : i64
      scf.if %1059 {
        func.call @stack_push_pointer(%1058) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1052) : (i64) -> ()
        %1060 = llvm.mlir.addressof @str90 : !llvm.ptr
        %1061 = func.call @cc_make_function_ref_const(%1060) : (!llvm.ptr) -> i64
        %1062 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1061, %1062) : (i64, i64) -> ()
      }
      %1063 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = func.call @cc_cons(%1063, %1064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1065) : (i64) -> ()
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @cc_values_pack(%1066) : (i64) -> i64
      func.call @stack_push_pointer(%1067) : (i64) -> ()
      %1068 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1068 : i64
    }
    func.call @stack_push_pointer(%1043) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958533"() {
    %1227 = func.call @cc_nil_value() : () -> i64
    %1228 = func.call @cc_nil_value() : () -> i64
    %1229 = func.call @cc_errorp(%1227) : (i64) -> i64
    %1230 = arith.cmpi ne, %1229, %1228 : i64
    %1231 = scf.if %1230 -> (i64) {
      scf.yield %1227 : i64
    } else {
      %1232 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1232) : (i64) -> ()
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1235 = arith.constant 12 : i64
      %1236 = func.call @cc_make_string(%1234, %1235) : (!llvm.ptr, i64) -> i64
      %1237 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1238 = arith.constant 7 : i64
      %1239 = func.call @cc_make_string(%1237, %1238) : (!llvm.ptr, i64) -> i64
      %1240 = func.call @cc_intern(%1236, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_nil_value() : () -> i64
      %1242 = func.call @cc_cons(%1240, %1241) : (i64, i64) -> i64
      %1243 = func.call @cc_values_pack(%1242) : (i64) -> i64
      func.call @stack_push_pointer(%1240) : (i64) -> ()
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1245 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1245) : (i64) -> ()
      %1246 = func.call @stack_pop_pointer() : () -> i64
      %1247 = func.call @cc_nil_value() : () -> i64
      %1248 = func.call @cc_errorp(%1233) : (i64) -> i64
      %1249 = arith.cmpi ne, %1248, %1247 : i64
      %1250 = arith.cmpi eq, %1247, %1247 : i64
      %1251 = arith.andi %1249, %1250 : i1
      %1252 = scf.if %1251 -> (i64) {
        scf.yield %1233 : i64
      } else {
        scf.yield %1247 : i64
      }
      %1253 = func.call @cc_errorp(%1244) : (i64) -> i64
      %1254 = arith.cmpi ne, %1253, %1247 : i64
      %1255 = arith.cmpi eq, %1252, %1247 : i64
      %1256 = arith.andi %1254, %1255 : i1
      %1257 = scf.if %1256 -> (i64) {
        scf.yield %1244 : i64
      } else {
        scf.yield %1252 : i64
      }
      %1258 = func.call @cc_errorp(%1246) : (i64) -> i64
      %1259 = arith.cmpi ne, %1258, %1247 : i64
      %1260 = arith.cmpi eq, %1257, %1247 : i64
      %1261 = arith.andi %1259, %1260 : i1
      %1262 = scf.if %1261 -> (i64) {
        scf.yield %1246 : i64
      } else {
        scf.yield %1257 : i64
      }
      %1263 = arith.cmpi ne, %1262, %1247 : i64
      scf.if %1263 {
        func.call @stack_push_pointer(%1262) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1233) : (i64) -> ()
        func.call @stack_push_pointer(%1244) : (i64) -> ()
        func.call @stack_push_pointer(%1246) : (i64) -> ()
        %1264 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1265 = func.call @cc_make_function_ref_const(%1264) : (!llvm.ptr) -> i64
        %1266 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1265, %1266) : (i64, i64) -> ()
      }
      %1267 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_cons(%1267, %1268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = func.call @cc_values_pack(%1270) : (i64) -> i64
      func.call @stack_push_pointer(%1271) : (i64) -> ()
      %1272 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1272 : i64
    }
    func.call @stack_push_pointer(%1231) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958534"() {
    %1447 = func.call @cc_nil_value() : () -> i64
    %1448 = func.call @cc_nil_value() : () -> i64
    %1449 = func.call @cc_errorp(%1447) : (i64) -> i64
    %1450 = arith.cmpi ne, %1449, %1448 : i64
    %1451 = scf.if %1450 -> (i64) {
      scf.yield %1447 : i64
    } else {
      %1452 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1452) : (i64) -> ()
      %1453 = func.call @stack_pop_pointer() : () -> i64
      %1454 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1455 = arith.constant 12 : i64
      %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
      %1457 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1458 = arith.constant 7 : i64
      %1459 = func.call @cc_make_string(%1457, %1458) : (!llvm.ptr, i64) -> i64
      %1460 = func.call @cc_intern(%1456, %1459) : (i64, i64) -> i64
      %1461 = func.call @cc_nil_value() : () -> i64
      %1462 = func.call @cc_cons(%1460, %1461) : (i64, i64) -> i64
      %1463 = func.call @cc_values_pack(%1462) : (i64) -> i64
      func.call @stack_push_pointer(%1460) : (i64) -> ()
      %1464 = func.call @stack_pop_pointer() : () -> i64
      %1465 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1465) : (i64) -> ()
      %1466 = func.call @stack_pop_pointer() : () -> i64
      %1467 = func.call @cc_nil_value() : () -> i64
      %1468 = func.call @cc_errorp(%1453) : (i64) -> i64
      %1469 = arith.cmpi ne, %1468, %1467 : i64
      %1470 = arith.cmpi eq, %1467, %1467 : i64
      %1471 = arith.andi %1469, %1470 : i1
      %1472 = scf.if %1471 -> (i64) {
        scf.yield %1453 : i64
      } else {
        scf.yield %1467 : i64
      }
      %1473 = func.call @cc_errorp(%1464) : (i64) -> i64
      %1474 = arith.cmpi ne, %1473, %1467 : i64
      %1475 = arith.cmpi eq, %1472, %1467 : i64
      %1476 = arith.andi %1474, %1475 : i1
      %1477 = scf.if %1476 -> (i64) {
        scf.yield %1464 : i64
      } else {
        scf.yield %1472 : i64
      }
      %1478 = func.call @cc_errorp(%1466) : (i64) -> i64
      %1479 = arith.cmpi ne, %1478, %1467 : i64
      %1480 = arith.cmpi eq, %1477, %1467 : i64
      %1481 = arith.andi %1479, %1480 : i1
      %1482 = scf.if %1481 -> (i64) {
        scf.yield %1466 : i64
      } else {
        scf.yield %1477 : i64
      }
      %1483 = arith.cmpi ne, %1482, %1467 : i64
      scf.if %1483 {
        func.call @stack_push_pointer(%1482) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1453) : (i64) -> ()
        func.call @stack_push_pointer(%1464) : (i64) -> ()
        func.call @stack_push_pointer(%1466) : (i64) -> ()
        %1484 = llvm.mlir.addressof @str126 : !llvm.ptr
        %1485 = func.call @cc_make_function_ref_const(%1484) : (!llvm.ptr) -> i64
        %1486 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1485, %1486) : (i64, i64) -> ()
      }
      %1487 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1488 = func.call @stack_pop_pointer() : () -> i64
      %1489 = func.call @cc_cons(%1487, %1488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1489) : (i64) -> ()
      %1490 = func.call @stack_pop_pointer() : () -> i64
      %1491 = func.call @cc_values_pack(%1490) : (i64) -> i64
      func.call @stack_push_pointer(%1491) : (i64) -> ()
      %1492 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1492 : i64
    }
    func.call @stack_push_pointer(%1451) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958535"() {
    %1687 = func.call @cc_nil_value() : () -> i64
    %1688 = func.call @cc_nil_value() : () -> i64
    %1689 = func.call @cc_errorp(%1687) : (i64) -> i64
    %1690 = arith.cmpi ne, %1689, %1688 : i64
    %1691 = scf.if %1690 -> (i64) {
      scf.yield %1687 : i64
    } else {
      %1692 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1692) : (i64) -> ()
      %1693 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1693) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1694 = func.call @stack_pop_pointer() : () -> i64
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @cc_cons(%1695, %1694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1696) : (i64) -> ()
      %1697 = func.call @stack_pop_pointer() : () -> i64
      %1698 = func.call @stack_pop_pointer() : () -> i64
      %1699 = func.call @cc_cons(%1698, %1697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1699) : (i64) -> ()
      %1700 = func.call @stack_pop_pointer() : () -> i64
      %1701 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1702 = arith.constant 10 : i64
      %1703 = func.call @cc_make_string(%1701, %1702) : (!llvm.ptr, i64) -> i64
      %1704 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1705 = arith.constant 7 : i64
      %1706 = func.call @cc_make_string(%1704, %1705) : (!llvm.ptr, i64) -> i64
      %1707 = func.call @cc_intern(%1703, %1706) : (i64, i64) -> i64
      %1708 = func.call @cc_nil_value() : () -> i64
      %1709 = func.call @cc_cons(%1707, %1708) : (i64, i64) -> i64
      %1710 = func.call @cc_values_pack(%1709) : (i64) -> i64
      func.call @stack_push_pointer(%1707) : (i64) -> ()
      %1711 = func.call @stack_pop_pointer() : () -> i64
      %1712 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1712) : (i64) -> ()
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @cc_nil_value() : () -> i64
      %1715 = func.call @cc_errorp(%1700) : (i64) -> i64
      %1716 = arith.cmpi ne, %1715, %1714 : i64
      %1717 = arith.cmpi eq, %1714, %1714 : i64
      %1718 = arith.andi %1716, %1717 : i1
      %1719 = scf.if %1718 -> (i64) {
        scf.yield %1700 : i64
      } else {
        scf.yield %1714 : i64
      }
      %1720 = func.call @cc_errorp(%1711) : (i64) -> i64
      %1721 = arith.cmpi ne, %1720, %1714 : i64
      %1722 = arith.cmpi eq, %1719, %1714 : i64
      %1723 = arith.andi %1721, %1722 : i1
      %1724 = scf.if %1723 -> (i64) {
        scf.yield %1711 : i64
      } else {
        scf.yield %1719 : i64
      }
      %1725 = func.call @cc_errorp(%1713) : (i64) -> i64
      %1726 = arith.cmpi ne, %1725, %1714 : i64
      %1727 = arith.cmpi eq, %1724, %1714 : i64
      %1728 = arith.andi %1726, %1727 : i1
      %1729 = scf.if %1728 -> (i64) {
        scf.yield %1713 : i64
      } else {
        scf.yield %1724 : i64
      }
      %1730 = arith.cmpi ne, %1729, %1714 : i64
      scf.if %1730 {
        func.call @stack_push_pointer(%1729) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1700) : (i64) -> ()
        func.call @stack_push_pointer(%1711) : (i64) -> ()
        func.call @stack_push_pointer(%1713) : (i64) -> ()
        %1731 = llvm.mlir.addressof @str146 : !llvm.ptr
        %1732 = func.call @cc_make_function_ref_const(%1731) : (!llvm.ptr) -> i64
        %1733 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1732, %1733) : (i64, i64) -> ()
      }
      %1734 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1735 = func.call @stack_pop_pointer() : () -> i64
      %1736 = func.call @cc_cons(%1734, %1735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1736) : (i64) -> ()
      %1737 = func.call @stack_pop_pointer() : () -> i64
      %1738 = func.call @cc_values_pack(%1737) : (i64) -> i64
      func.call @stack_push_pointer(%1738) : (i64) -> ()
      %1739 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1739 : i64
    }
    func.call @stack_push_pointer(%1691) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958536"() {
    %1918 = func.call @cc_nil_value() : () -> i64
    %1919 = func.call @cc_nil_value() : () -> i64
    %1920 = func.call @cc_errorp(%1918) : (i64) -> i64
    %1921 = arith.cmpi ne, %1920, %1919 : i64
    %1922 = scf.if %1921 -> (i64) {
      scf.yield %1918 : i64
    } else {
      %1923 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1923) : (i64) -> ()
      %1924 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1924) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1925 = func.call @stack_pop_pointer() : () -> i64
      %1926 = func.call @stack_pop_pointer() : () -> i64
      %1927 = func.call @cc_cons(%1926, %1925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1927) : (i64) -> ()
      %1928 = func.call @stack_pop_pointer() : () -> i64
      %1929 = func.call @stack_pop_pointer() : () -> i64
      %1930 = func.call @cc_cons(%1929, %1928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1930) : (i64) -> ()
      %1931 = func.call @stack_pop_pointer() : () -> i64
      %1932 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1933 = arith.constant 10 : i64
      %1934 = func.call @cc_make_string(%1932, %1933) : (!llvm.ptr, i64) -> i64
      %1935 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1936 = arith.constant 7 : i64
      %1937 = func.call @cc_make_string(%1935, %1936) : (!llvm.ptr, i64) -> i64
      %1938 = func.call @cc_intern(%1934, %1937) : (i64, i64) -> i64
      %1939 = func.call @cc_nil_value() : () -> i64
      %1940 = func.call @cc_cons(%1938, %1939) : (i64, i64) -> i64
      %1941 = func.call @cc_values_pack(%1940) : (i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1943) : (i64) -> ()
      %1944 = func.call @stack_pop_pointer() : () -> i64
      %1945 = func.call @cc_nil_value() : () -> i64
      %1946 = func.call @cc_errorp(%1931) : (i64) -> i64
      %1947 = arith.cmpi ne, %1946, %1945 : i64
      %1948 = arith.cmpi eq, %1945, %1945 : i64
      %1949 = arith.andi %1947, %1948 : i1
      %1950 = scf.if %1949 -> (i64) {
        scf.yield %1931 : i64
      } else {
        scf.yield %1945 : i64
      }
      %1951 = func.call @cc_errorp(%1942) : (i64) -> i64
      %1952 = arith.cmpi ne, %1951, %1945 : i64
      %1953 = arith.cmpi eq, %1950, %1945 : i64
      %1954 = arith.andi %1952, %1953 : i1
      %1955 = scf.if %1954 -> (i64) {
        scf.yield %1942 : i64
      } else {
        scf.yield %1950 : i64
      }
      %1956 = func.call @cc_errorp(%1944) : (i64) -> i64
      %1957 = arith.cmpi ne, %1956, %1945 : i64
      %1958 = arith.cmpi eq, %1955, %1945 : i64
      %1959 = arith.andi %1957, %1958 : i1
      %1960 = scf.if %1959 -> (i64) {
        scf.yield %1944 : i64
      } else {
        scf.yield %1955 : i64
      }
      %1961 = arith.cmpi ne, %1960, %1945 : i64
      scf.if %1961 {
        func.call @stack_push_pointer(%1960) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1931) : (i64) -> ()
        func.call @stack_push_pointer(%1942) : (i64) -> ()
        func.call @stack_push_pointer(%1944) : (i64) -> ()
        %1962 = llvm.mlir.addressof @str164 : !llvm.ptr
        %1963 = func.call @cc_make_function_ref_const(%1962) : (!llvm.ptr) -> i64
        %1964 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1963, %1964) : (i64, i64) -> ()
      }
      %1965 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @cc_cons(%1965, %1966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1967) : (i64) -> ()
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = func.call @cc_values_pack(%1968) : (i64) -> i64
      func.call @stack_push_pointer(%1969) : (i64) -> ()
      %1970 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1970 : i64
    }
    func.call @stack_push_pointer(%1922) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958537"() {
    %2165 = func.call @cc_nil_value() : () -> i64
    %2166 = func.call @cc_nil_value() : () -> i64
    %2167 = func.call @cc_errorp(%2165) : (i64) -> i64
    %2168 = arith.cmpi ne, %2167, %2166 : i64
    %2169 = scf.if %2168 -> (i64) {
      scf.yield %2165 : i64
    } else {
      %2170 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2170) : (i64) -> ()
      %2171 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2171) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2172 = func.call @stack_pop_pointer() : () -> i64
      %2173 = func.call @stack_pop_pointer() : () -> i64
      %2174 = func.call @cc_cons(%2173, %2172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2174) : (i64) -> ()
      %2175 = func.call @stack_pop_pointer() : () -> i64
      %2176 = func.call @stack_pop_pointer() : () -> i64
      %2177 = func.call @cc_cons(%2176, %2175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2177) : (i64) -> ()
      %2178 = func.call @stack_pop_pointer() : () -> i64
      %2179 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2180 = arith.constant 10 : i64
      %2181 = func.call @cc_make_string(%2179, %2180) : (!llvm.ptr, i64) -> i64
      %2182 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2183 = arith.constant 7 : i64
      %2184 = func.call @cc_make_string(%2182, %2183) : (!llvm.ptr, i64) -> i64
      %2185 = func.call @cc_intern(%2181, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_nil_value() : () -> i64
      %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
      %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
      func.call @stack_push_pointer(%2185) : (i64) -> ()
      %2189 = func.call @stack_pop_pointer() : () -> i64
      %2190 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2190) : (i64) -> ()
      %2191 = func.call @stack_pop_pointer() : () -> i64
      %2192 = func.call @cc_nil_value() : () -> i64
      %2193 = func.call @cc_errorp(%2178) : (i64) -> i64
      %2194 = arith.cmpi ne, %2193, %2192 : i64
      %2195 = arith.cmpi eq, %2192, %2192 : i64
      %2196 = arith.andi %2194, %2195 : i1
      %2197 = scf.if %2196 -> (i64) {
        scf.yield %2178 : i64
      } else {
        scf.yield %2192 : i64
      }
      %2198 = func.call @cc_errorp(%2189) : (i64) -> i64
      %2199 = arith.cmpi ne, %2198, %2192 : i64
      %2200 = arith.cmpi eq, %2197, %2192 : i64
      %2201 = arith.andi %2199, %2200 : i1
      %2202 = scf.if %2201 -> (i64) {
        scf.yield %2189 : i64
      } else {
        scf.yield %2197 : i64
      }
      %2203 = func.call @cc_errorp(%2191) : (i64) -> i64
      %2204 = arith.cmpi ne, %2203, %2192 : i64
      %2205 = arith.cmpi eq, %2202, %2192 : i64
      %2206 = arith.andi %2204, %2205 : i1
      %2207 = scf.if %2206 -> (i64) {
        scf.yield %2191 : i64
      } else {
        scf.yield %2202 : i64
      }
      %2208 = arith.cmpi ne, %2207, %2192 : i64
      scf.if %2208 {
        func.call @stack_push_pointer(%2207) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2178) : (i64) -> ()
        func.call @stack_push_pointer(%2189) : (i64) -> ()
        func.call @stack_push_pointer(%2191) : (i64) -> ()
        %2209 = llvm.mlir.addressof @str184 : !llvm.ptr
        %2210 = func.call @cc_make_function_ref_const(%2209) : (!llvm.ptr) -> i64
        %2211 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2210, %2211) : (i64, i64) -> ()
      }
      %2212 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2213 = func.call @stack_pop_pointer() : () -> i64
      %2214 = func.call @cc_cons(%2212, %2213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2214) : (i64) -> ()
      %2215 = func.call @stack_pop_pointer() : () -> i64
      %2216 = func.call @cc_values_pack(%2215) : (i64) -> i64
      func.call @stack_push_pointer(%2216) : (i64) -> ()
      %2217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2217 : i64
    }
    func.call @stack_push_pointer(%2169) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958538"() {
    %2463 = func.call @cc_nil_value() : () -> i64
    %2464 = func.call @cc_nil_value() : () -> i64
    %2465 = func.call @cc_errorp(%2463) : (i64) -> i64
    %2466 = arith.cmpi ne, %2465, %2464 : i64
    %2467 = scf.if %2466 -> (i64) {
      scf.yield %2463 : i64
    } else {
      %2468 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2468) : (i64) -> ()
      %2469 = func.call @stack_pop_pointer() : () -> i64
      %2470 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2470) : (i64) -> ()
      %2471 = func.call @stack_pop_pointer() : () -> i64
      %2472 = func.call @cc_nil_value() : () -> i64
      %2473 = func.call @cc_errorp(%2469) : (i64) -> i64
      %2474 = arith.cmpi ne, %2473, %2472 : i64
      %2475 = arith.cmpi eq, %2472, %2472 : i64
      %2476 = arith.andi %2474, %2475 : i1
      %2477 = scf.if %2476 -> (i64) {
        scf.yield %2469 : i64
      } else {
        scf.yield %2472 : i64
      }
      %2478 = func.call @cc_errorp(%2471) : (i64) -> i64
      %2479 = arith.cmpi ne, %2478, %2472 : i64
      %2480 = arith.cmpi eq, %2477, %2472 : i64
      %2481 = arith.andi %2479, %2480 : i1
      %2482 = scf.if %2481 -> (i64) {
        scf.yield %2471 : i64
      } else {
        scf.yield %2477 : i64
      }
      %2483 = arith.cmpi ne, %2482, %2472 : i64
      scf.if %2483 {
        func.call @stack_push_pointer(%2482) : (i64) -> ()
      } else {
        %2484 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2484) : (i64) -> ()
        func.call @stack_push_pointer(%2471) : (i64) -> ()
        %2485 = func.call @stack_pop_pointer() : () -> i64
        %2486 = func.call @stack_pop_pointer() : () -> i64
        %2487 = func.call @cc_cons(%2485, %2486) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2487) : (i64) -> ()
        func.call @stack_push_pointer(%2469) : (i64) -> ()
        %2488 = func.call @stack_pop_pointer() : () -> i64
        %2489 = func.call @stack_pop_pointer() : () -> i64
        %2490 = func.call @cc_cons(%2488, %2489) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2490) : (i64) -> ()
      }
      %2491 = func.call @stack_pop_pointer() : () -> i64
      %2492 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2493 = arith.constant 16 : i64
      %2494 = func.call @cc_make_string(%2492, %2493) : (!llvm.ptr, i64) -> i64
      %2495 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2496 = arith.constant 7 : i64
      %2497 = func.call @cc_make_string(%2495, %2496) : (!llvm.ptr, i64) -> i64
      %2498 = func.call @cc_intern(%2494, %2497) : (i64, i64) -> i64
      %2499 = func.call @cc_nil_value() : () -> i64
      %2500 = func.call @cc_cons(%2498, %2499) : (i64, i64) -> i64
      %2501 = func.call @cc_values_pack(%2500) : (i64) -> i64
      func.call @stack_push_pointer(%2498) : (i64) -> ()
      %2502 = func.call @stack_pop_pointer() : () -> i64
      %2503 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2503) : (i64) -> ()
      %2504 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2504) : (i64) -> ()
      %2505 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2505) : (i64) -> ()
      %2506 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%2506) : (i64) -> ()
      %2507 = arith.constant 4 : i64
      %2508 = func.call @cc_box_fixnum(%2507) : (i64) -> i64
      %2509 = func.call @cc_make_vector(%2508) : (i64) -> i64
      %2510 = func.call @stack_pop_pointer() : () -> i64
      %2511 = arith.constant 3 : i64
      %2512 = func.call @cc_box_fixnum(%2511) : (i64) -> i64
      %2513 = func.call @cc_svset(%2509, %2512, %2510) : (i64, i64, i64) -> i64
      %2514 = func.call @stack_pop_pointer() : () -> i64
      %2515 = arith.constant 2 : i64
      %2516 = func.call @cc_box_fixnum(%2515) : (i64) -> i64
      %2517 = func.call @cc_svset(%2509, %2516, %2514) : (i64, i64, i64) -> i64
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = arith.constant 1 : i64
      %2520 = func.call @cc_box_fixnum(%2519) : (i64) -> i64
      %2521 = func.call @cc_svset(%2509, %2520, %2518) : (i64, i64, i64) -> i64
      %2522 = func.call @stack_pop_pointer() : () -> i64
      %2523 = arith.constant 0 : i64
      %2524 = func.call @cc_box_fixnum(%2523) : (i64) -> i64
      %2525 = func.call @cc_svset(%2509, %2524, %2522) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%2509) : (i64) -> ()
      %2526 = func.call @stack_pop_pointer() : () -> i64
      %2527 = func.call @cc_nil_value() : () -> i64
      %2528 = func.call @cc_errorp(%2491) : (i64) -> i64
      %2529 = arith.cmpi ne, %2528, %2527 : i64
      %2530 = arith.cmpi eq, %2527, %2527 : i64
      %2531 = arith.andi %2529, %2530 : i1
      %2532 = scf.if %2531 -> (i64) {
        scf.yield %2491 : i64
      } else {
        scf.yield %2527 : i64
      }
      %2533 = func.call @cc_errorp(%2502) : (i64) -> i64
      %2534 = arith.cmpi ne, %2533, %2527 : i64
      %2535 = arith.cmpi eq, %2532, %2527 : i64
      %2536 = arith.andi %2534, %2535 : i1
      %2537 = scf.if %2536 -> (i64) {
        scf.yield %2502 : i64
      } else {
        scf.yield %2532 : i64
      }
      %2538 = func.call @cc_errorp(%2526) : (i64) -> i64
      %2539 = arith.cmpi ne, %2538, %2527 : i64
      %2540 = arith.cmpi eq, %2537, %2527 : i64
      %2541 = arith.andi %2539, %2540 : i1
      %2542 = scf.if %2541 -> (i64) {
        scf.yield %2526 : i64
      } else {
        scf.yield %2537 : i64
      }
      %2543 = arith.cmpi ne, %2542, %2527 : i64
      scf.if %2543 {
        func.call @stack_push_pointer(%2542) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2491) : (i64) -> ()
        func.call @stack_push_pointer(%2502) : (i64) -> ()
        func.call @stack_push_pointer(%2526) : (i64) -> ()
        %2544 = llvm.mlir.addressof @str204 : !llvm.ptr
        %2545 = func.call @cc_make_function_ref_const(%2544) : (!llvm.ptr) -> i64
        %2546 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2545, %2546) : (i64, i64) -> ()
      }
      %2547 = func.call @stack_pop_pointer() : () -> i64
      %2548 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2548) : (i64) -> ()
      %2549 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2550 = func.call @stack_pop_pointer() : () -> i64
      %2551 = func.call @stack_pop_pointer() : () -> i64
      %2552 = func.call @cc_cons(%2551, %2550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2552) : (i64) -> ()
      %2553 = func.call @stack_pop_pointer() : () -> i64
      %2554 = func.call @stack_pop_pointer() : () -> i64
      %2555 = func.call @cc_cons(%2554, %2553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2555) : (i64) -> ()
      %2556 = func.call @stack_pop_pointer() : () -> i64
      %2557 = func.call @cc_nil_value() : () -> i64
      %2558 = func.call @cc_errorp(%2547) : (i64) -> i64
      %2559 = arith.cmpi ne, %2558, %2557 : i64
      %2560 = arith.cmpi eq, %2557, %2557 : i64
      %2561 = arith.andi %2559, %2560 : i1
      %2562 = scf.if %2561 -> (i64) {
        scf.yield %2547 : i64
      } else {
        scf.yield %2557 : i64
      }
      %2563 = func.call @cc_errorp(%2556) : (i64) -> i64
      %2564 = arith.cmpi ne, %2563, %2557 : i64
      %2565 = arith.cmpi eq, %2562, %2557 : i64
      %2566 = arith.andi %2564, %2565 : i1
      %2567 = scf.if %2566 -> (i64) {
        scf.yield %2556 : i64
      } else {
        scf.yield %2562 : i64
      }
      %2568 = arith.cmpi ne, %2567, %2557 : i64
      scf.if %2568 {
        func.call @stack_push_pointer(%2567) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2547) : (i64) -> ()
        func.call @stack_push_pointer(%2556) : (i64) -> ()
        %2569 = llvm.mlir.addressof @str205 : !llvm.ptr
        %2570 = func.call @cc_make_function_ref_const(%2569) : (!llvm.ptr) -> i64
        %2571 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2570, %2571) : (i64, i64) -> ()
      }
      %2572 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2572 : i64
    }
    func.call @stack_push_pointer(%2467) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958539"() {
    %2879 = func.call @cc_nil_value() : () -> i64
    %2880 = func.call @cc_nil_value() : () -> i64
    %2881 = func.call @cc_errorp(%2879) : (i64) -> i64
    %2882 = arith.cmpi ne, %2881, %2880 : i64
    %2883 = scf.if %2882 -> (i64) {
      scf.yield %2879 : i64
    } else {
      %2884 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2884) : (i64) -> ()
      %2885 = func.call @stack_pop_pointer() : () -> i64
      %2886 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2887 = arith.constant 12 : i64
      %2888 = func.call @cc_make_string(%2886, %2887) : (!llvm.ptr, i64) -> i64
      %2889 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2890 = arith.constant 7 : i64
      %2891 = func.call @cc_make_string(%2889, %2890) : (!llvm.ptr, i64) -> i64
      %2892 = func.call @cc_intern(%2888, %2891) : (i64, i64) -> i64
      %2893 = func.call @cc_nil_value() : () -> i64
      %2894 = func.call @cc_cons(%2892, %2893) : (i64, i64) -> i64
      %2895 = func.call @cc_values_pack(%2894) : (i64) -> i64
      func.call @stack_push_pointer(%2892) : (i64) -> ()
      %2896 = func.call @stack_pop_pointer() : () -> i64
      %2897 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2898 = arith.constant 9 : i64
      %2899 = func.call @cc_make_string(%2897, %2898) : (!llvm.ptr, i64) -> i64
      %2900 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2901 = arith.constant 11 : i64
      %2902 = func.call @cc_make_string(%2900, %2901) : (!llvm.ptr, i64) -> i64
      %2903 = func.call @cc_intern(%2899, %2902) : (i64, i64) -> i64
      %2904 = func.call @cc_nil_value() : () -> i64
      %2905 = func.call @cc_cons(%2903, %2904) : (i64, i64) -> i64
      %2906 = func.call @cc_values_pack(%2905) : (i64) -> i64
      func.call @stack_push_pointer(%2903) : (i64) -> ()
      %2907 = func.call @stack_pop_pointer() : () -> i64
      %2908 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2909 = arith.constant 15 : i64
      %2910 = func.call @cc_make_string(%2908, %2909) : (!llvm.ptr, i64) -> i64
      %2911 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2912 = arith.constant 7 : i64
      %2913 = func.call @cc_make_string(%2911, %2912) : (!llvm.ptr, i64) -> i64
      %2914 = func.call @cc_intern(%2910, %2913) : (i64, i64) -> i64
      %2915 = func.call @cc_nil_value() : () -> i64
      %2916 = func.call @cc_cons(%2914, %2915) : (i64, i64) -> i64
      %2917 = func.call @cc_values_pack(%2916) : (i64) -> i64
      func.call @stack_push_pointer(%2914) : (i64) -> ()
      %2918 = func.call @stack_pop_pointer() : () -> i64
      %2919 = arith.constant 97 : i64
      %2920 = func.call @cc_box_character(%2919) : (i64) -> i64
      func.call @stack_push_pointer(%2920) : (i64) -> ()
      %2921 = func.call @stack_pop_pointer() : () -> i64
      %2922 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2923 = arith.constant 10 : i64
      %2924 = func.call @cc_make_string(%2922, %2923) : (!llvm.ptr, i64) -> i64
      %2925 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2926 = arith.constant 7 : i64
      %2927 = func.call @cc_make_string(%2925, %2926) : (!llvm.ptr, i64) -> i64
      %2928 = func.call @cc_intern(%2924, %2927) : (i64, i64) -> i64
      %2929 = func.call @cc_nil_value() : () -> i64
      %2930 = func.call @cc_cons(%2928, %2929) : (i64, i64) -> i64
      %2931 = func.call @cc_values_pack(%2930) : (i64) -> i64
      func.call @stack_push_pointer(%2928) : (i64) -> ()
      %2932 = func.call @stack_pop_pointer() : () -> i64
      %2933 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2933) : (i64) -> ()
      %2934 = func.call @stack_pop_pointer() : () -> i64
      %2935 = func.call @cc_nil_value() : () -> i64
      %2936 = func.call @cc_errorp(%2885) : (i64) -> i64
      %2937 = arith.cmpi ne, %2936, %2935 : i64
      %2938 = arith.cmpi eq, %2935, %2935 : i64
      %2939 = arith.andi %2937, %2938 : i1
      %2940 = scf.if %2939 -> (i64) {
        scf.yield %2885 : i64
      } else {
        scf.yield %2935 : i64
      }
      %2941 = func.call @cc_errorp(%2896) : (i64) -> i64
      %2942 = arith.cmpi ne, %2941, %2935 : i64
      %2943 = arith.cmpi eq, %2940, %2935 : i64
      %2944 = arith.andi %2942, %2943 : i1
      %2945 = scf.if %2944 -> (i64) {
        scf.yield %2896 : i64
      } else {
        scf.yield %2940 : i64
      }
      %2946 = func.call @cc_errorp(%2907) : (i64) -> i64
      %2947 = arith.cmpi ne, %2946, %2935 : i64
      %2948 = arith.cmpi eq, %2945, %2935 : i64
      %2949 = arith.andi %2947, %2948 : i1
      %2950 = scf.if %2949 -> (i64) {
        scf.yield %2907 : i64
      } else {
        scf.yield %2945 : i64
      }
      %2951 = func.call @cc_errorp(%2918) : (i64) -> i64
      %2952 = arith.cmpi ne, %2951, %2935 : i64
      %2953 = arith.cmpi eq, %2950, %2935 : i64
      %2954 = arith.andi %2952, %2953 : i1
      %2955 = scf.if %2954 -> (i64) {
        scf.yield %2918 : i64
      } else {
        scf.yield %2950 : i64
      }
      %2956 = func.call @cc_errorp(%2921) : (i64) -> i64
      %2957 = arith.cmpi ne, %2956, %2935 : i64
      %2958 = arith.cmpi eq, %2955, %2935 : i64
      %2959 = arith.andi %2957, %2958 : i1
      %2960 = scf.if %2959 -> (i64) {
        scf.yield %2921 : i64
      } else {
        scf.yield %2955 : i64
      }
      %2961 = func.call @cc_errorp(%2932) : (i64) -> i64
      %2962 = arith.cmpi ne, %2961, %2935 : i64
      %2963 = arith.cmpi eq, %2960, %2935 : i64
      %2964 = arith.andi %2962, %2963 : i1
      %2965 = scf.if %2964 -> (i64) {
        scf.yield %2932 : i64
      } else {
        scf.yield %2960 : i64
      }
      %2966 = func.call @cc_errorp(%2934) : (i64) -> i64
      %2967 = arith.cmpi ne, %2966, %2935 : i64
      %2968 = arith.cmpi eq, %2965, %2935 : i64
      %2969 = arith.andi %2967, %2968 : i1
      %2970 = scf.if %2969 -> (i64) {
        scf.yield %2934 : i64
      } else {
        scf.yield %2965 : i64
      }
      %2971 = arith.cmpi ne, %2970, %2935 : i64
      scf.if %2971 {
        func.call @stack_push_pointer(%2970) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2885) : (i64) -> ()
        func.call @stack_push_pointer(%2896) : (i64) -> ()
        func.call @stack_push_pointer(%2907) : (i64) -> ()
        func.call @stack_push_pointer(%2918) : (i64) -> ()
        func.call @stack_push_pointer(%2921) : (i64) -> ()
        func.call @stack_push_pointer(%2932) : (i64) -> ()
        func.call @stack_push_pointer(%2934) : (i64) -> ()
        %2972 = llvm.mlir.addressof @str237 : !llvm.ptr
        %2973 = func.call @cc_make_function_ref_const(%2972) : (!llvm.ptr) -> i64
        %2974 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%2973, %2974) : (i64, i64) -> ()
      }
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @cc_nil_value() : () -> i64
      %2977 = func.call @cc_errorp(%2975) : (i64) -> i64
      %2978 = arith.cmpi ne, %2977, %2976 : i64
      %2979 = arith.cmpi eq, %2976, %2976 : i64
      %2980 = arith.andi %2978, %2979 : i1
      %2981 = scf.if %2980 -> (i64) {
        scf.yield %2975 : i64
      } else {
        scf.yield %2976 : i64
      }
      %2982 = arith.cmpi ne, %2981, %2976 : i64
      scf.if %2982 {
        func.call @stack_push_pointer(%2981) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2975) : (i64) -> ()
        %2983 = llvm.mlir.addressof @str238 : !llvm.ptr
        %2984 = func.call @cc_make_function_ref_const(%2983) : (!llvm.ptr) -> i64
        %2985 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2984, %2985) : (i64, i64) -> ()
      }
      %2986 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2986 : i64
    }
    func.call @stack_push_pointer(%2883) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958540"() {
    %3198 = func.call @cc_nil_value() : () -> i64
    %3199 = func.call @cc_nil_value() : () -> i64
    %3200 = func.call @cc_errorp(%3198) : (i64) -> i64
    %3201 = arith.cmpi ne, %3200, %3199 : i64
    %3202 = scf.if %3201 -> (i64) {
      scf.yield %3198 : i64
    } else {
      %3203 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%3203) : (i64) -> ()
      %3204 = func.call @stack_pop_pointer() : () -> i64
      %3205 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3206 = arith.constant 12 : i64
      %3207 = func.call @cc_make_string(%3205, %3206) : (!llvm.ptr, i64) -> i64
      %3208 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3209 = arith.constant 7 : i64
      %3210 = func.call @cc_make_string(%3208, %3209) : (!llvm.ptr, i64) -> i64
      %3211 = func.call @cc_intern(%3207, %3210) : (i64, i64) -> i64
      %3212 = func.call @cc_nil_value() : () -> i64
      %3213 = func.call @cc_cons(%3211, %3212) : (i64, i64) -> i64
      %3214 = func.call @cc_values_pack(%3213) : (i64) -> i64
      func.call @stack_push_pointer(%3211) : (i64) -> ()
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3217 = arith.constant 9 : i64
      %3218 = func.call @cc_make_string(%3216, %3217) : (!llvm.ptr, i64) -> i64
      %3219 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3220 = arith.constant 11 : i64
      %3221 = func.call @cc_make_string(%3219, %3220) : (!llvm.ptr, i64) -> i64
      %3222 = func.call @cc_intern(%3218, %3221) : (i64, i64) -> i64
      %3223 = func.call @cc_nil_value() : () -> i64
      %3224 = func.call @cc_cons(%3222, %3223) : (i64, i64) -> i64
      %3225 = func.call @cc_values_pack(%3224) : (i64) -> i64
      func.call @stack_push_pointer(%3222) : (i64) -> ()
      %3226 = func.call @stack_pop_pointer() : () -> i64
      %3227 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3228 = arith.constant 15 : i64
      %3229 = func.call @cc_make_string(%3227, %3228) : (!llvm.ptr, i64) -> i64
      %3230 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3231 = arith.constant 7 : i64
      %3232 = func.call @cc_make_string(%3230, %3231) : (!llvm.ptr, i64) -> i64
      %3233 = func.call @cc_intern(%3229, %3232) : (i64, i64) -> i64
      %3234 = func.call @cc_nil_value() : () -> i64
      %3235 = func.call @cc_cons(%3233, %3234) : (i64, i64) -> i64
      %3236 = func.call @cc_values_pack(%3235) : (i64) -> i64
      func.call @stack_push_pointer(%3233) : (i64) -> ()
      %3237 = func.call @stack_pop_pointer() : () -> i64
      %3238 = arith.constant 97 : i64
      %3239 = func.call @cc_box_character(%3238) : (i64) -> i64
      func.call @stack_push_pointer(%3239) : (i64) -> ()
      %3240 = func.call @stack_pop_pointer() : () -> i64
      %3241 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3242 = arith.constant 10 : i64
      %3243 = func.call @cc_make_string(%3241, %3242) : (!llvm.ptr, i64) -> i64
      %3244 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3245 = arith.constant 7 : i64
      %3246 = func.call @cc_make_string(%3244, %3245) : (!llvm.ptr, i64) -> i64
      %3247 = func.call @cc_intern(%3243, %3246) : (i64, i64) -> i64
      %3248 = func.call @cc_nil_value() : () -> i64
      %3249 = func.call @cc_cons(%3247, %3248) : (i64, i64) -> i64
      %3250 = func.call @cc_values_pack(%3249) : (i64) -> i64
      func.call @stack_push_pointer(%3247) : (i64) -> ()
      %3251 = func.call @stack_pop_pointer() : () -> i64
      %3252 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3252) : (i64) -> ()
      %3253 = func.call @stack_pop_pointer() : () -> i64
      %3254 = func.call @cc_nil_value() : () -> i64
      %3255 = func.call @cc_errorp(%3204) : (i64) -> i64
      %3256 = arith.cmpi ne, %3255, %3254 : i64
      %3257 = arith.cmpi eq, %3254, %3254 : i64
      %3258 = arith.andi %3256, %3257 : i1
      %3259 = scf.if %3258 -> (i64) {
        scf.yield %3204 : i64
      } else {
        scf.yield %3254 : i64
      }
      %3260 = func.call @cc_errorp(%3215) : (i64) -> i64
      %3261 = arith.cmpi ne, %3260, %3254 : i64
      %3262 = arith.cmpi eq, %3259, %3254 : i64
      %3263 = arith.andi %3261, %3262 : i1
      %3264 = scf.if %3263 -> (i64) {
        scf.yield %3215 : i64
      } else {
        scf.yield %3259 : i64
      }
      %3265 = func.call @cc_errorp(%3226) : (i64) -> i64
      %3266 = arith.cmpi ne, %3265, %3254 : i64
      %3267 = arith.cmpi eq, %3264, %3254 : i64
      %3268 = arith.andi %3266, %3267 : i1
      %3269 = scf.if %3268 -> (i64) {
        scf.yield %3226 : i64
      } else {
        scf.yield %3264 : i64
      }
      %3270 = func.call @cc_errorp(%3237) : (i64) -> i64
      %3271 = arith.cmpi ne, %3270, %3254 : i64
      %3272 = arith.cmpi eq, %3269, %3254 : i64
      %3273 = arith.andi %3271, %3272 : i1
      %3274 = scf.if %3273 -> (i64) {
        scf.yield %3237 : i64
      } else {
        scf.yield %3269 : i64
      }
      %3275 = func.call @cc_errorp(%3240) : (i64) -> i64
      %3276 = arith.cmpi ne, %3275, %3254 : i64
      %3277 = arith.cmpi eq, %3274, %3254 : i64
      %3278 = arith.andi %3276, %3277 : i1
      %3279 = scf.if %3278 -> (i64) {
        scf.yield %3240 : i64
      } else {
        scf.yield %3274 : i64
      }
      %3280 = func.call @cc_errorp(%3251) : (i64) -> i64
      %3281 = arith.cmpi ne, %3280, %3254 : i64
      %3282 = arith.cmpi eq, %3279, %3254 : i64
      %3283 = arith.andi %3281, %3282 : i1
      %3284 = scf.if %3283 -> (i64) {
        scf.yield %3251 : i64
      } else {
        scf.yield %3279 : i64
      }
      %3285 = func.call @cc_errorp(%3253) : (i64) -> i64
      %3286 = arith.cmpi ne, %3285, %3254 : i64
      %3287 = arith.cmpi eq, %3284, %3254 : i64
      %3288 = arith.andi %3286, %3287 : i1
      %3289 = scf.if %3288 -> (i64) {
        scf.yield %3253 : i64
      } else {
        scf.yield %3284 : i64
      }
      %3290 = arith.cmpi ne, %3289, %3254 : i64
      scf.if %3290 {
        func.call @stack_push_pointer(%3289) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3204) : (i64) -> ()
        func.call @stack_push_pointer(%3215) : (i64) -> ()
        func.call @stack_push_pointer(%3226) : (i64) -> ()
        func.call @stack_push_pointer(%3237) : (i64) -> ()
        func.call @stack_push_pointer(%3240) : (i64) -> ()
        func.call @stack_push_pointer(%3251) : (i64) -> ()
        func.call @stack_push_pointer(%3253) : (i64) -> ()
        %3291 = llvm.mlir.addressof @str267 : !llvm.ptr
        %3292 = func.call @cc_make_function_ref_const(%3291) : (!llvm.ptr) -> i64
        %3293 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%3292, %3293) : (i64, i64) -> ()
      }
      %3294 = func.call @stack_pop_pointer() : () -> i64
      %3295 = func.call @cc_nil_value() : () -> i64
      %3296 = func.call @cc_errorp(%3294) : (i64) -> i64
      %3297 = arith.cmpi ne, %3296, %3295 : i64
      %3298 = arith.cmpi eq, %3295, %3295 : i64
      %3299 = arith.andi %3297, %3298 : i1
      %3300 = scf.if %3299 -> (i64) {
        scf.yield %3294 : i64
      } else {
        scf.yield %3295 : i64
      }
      %3301 = arith.cmpi ne, %3300, %3295 : i64
      scf.if %3301 {
        func.call @stack_push_pointer(%3300) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3294) : (i64) -> ()
        %3302 = llvm.mlir.addressof @str268 : !llvm.ptr
        %3303 = func.call @cc_make_function_ref_const(%3302) : (!llvm.ptr) -> i64
        %3304 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3303, %3304) : (i64, i64) -> ()
      }
      %3305 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3305 : i64
    }
    func.call @stack_push_pointer(%3202) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958541"() {
    %3565 = func.call @cc_nil_value() : () -> i64
    %3566 = func.call @cc_nil_value() : () -> i64
    %3567 = func.call @cc_errorp(%3565) : (i64) -> i64
    %3568 = arith.cmpi ne, %3567, %3566 : i64
    %3569 = scf.if %3568 -> (i64) {
      scf.yield %3565 : i64
    } else {
      %3570 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3570) : (i64) -> ()
      %3571 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3571) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3572 = func.call @stack_pop_pointer() : () -> i64
      %3573 = func.call @stack_pop_pointer() : () -> i64
      %3574 = func.call @cc_cons(%3573, %3572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3574) : (i64) -> ()
      %3575 = func.call @stack_pop_pointer() : () -> i64
      %3576 = func.call @stack_pop_pointer() : () -> i64
      %3577 = func.call @cc_cons(%3576, %3575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3577) : (i64) -> ()
      %3578 = func.call @stack_pop_pointer() : () -> i64
      %3579 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3580 = arith.constant 12 : i64
      %3581 = func.call @cc_make_string(%3579, %3580) : (!llvm.ptr, i64) -> i64
      %3582 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3583 = arith.constant 7 : i64
      %3584 = func.call @cc_make_string(%3582, %3583) : (!llvm.ptr, i64) -> i64
      %3585 = func.call @cc_intern(%3581, %3584) : (i64, i64) -> i64
      %3586 = func.call @cc_nil_value() : () -> i64
      %3587 = func.call @cc_cons(%3585, %3586) : (i64, i64) -> i64
      %3588 = func.call @cc_values_pack(%3587) : (i64) -> i64
      func.call @stack_push_pointer(%3585) : (i64) -> ()
      %3589 = func.call @stack_pop_pointer() : () -> i64
      %3590 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3591 = arith.constant 7 : i64
      %3592 = func.call @cc_make_string(%3590, %3591) : (!llvm.ptr, i64) -> i64
      %3593 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3594 = arith.constant 11 : i64
      %3595 = func.call @cc_make_string(%3593, %3594) : (!llvm.ptr, i64) -> i64
      %3596 = func.call @cc_intern(%3592, %3595) : (i64, i64) -> i64
      %3597 = func.call @cc_nil_value() : () -> i64
      %3598 = func.call @cc_cons(%3596, %3597) : (i64, i64) -> i64
      %3599 = func.call @cc_values_pack(%3598) : (i64) -> i64
      func.call @stack_push_pointer(%3596) : (i64) -> ()
      %3600 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3600) : (i64) -> ()
      %3601 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%3601) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3602 = func.call @stack_pop_pointer() : () -> i64
      %3603 = func.call @stack_pop_pointer() : () -> i64
      %3604 = func.call @cc_cons(%3603, %3602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3605 = func.call @stack_pop_pointer() : () -> i64
      %3606 = func.call @stack_pop_pointer() : () -> i64
      %3607 = func.call @cc_cons(%3606, %3605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3607) : (i64) -> ()
      %3608 = func.call @stack_pop_pointer() : () -> i64
      %3609 = func.call @stack_pop_pointer() : () -> i64
      %3610 = func.call @cc_cons(%3609, %3608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3610) : (i64) -> ()
      %3611 = func.call @stack_pop_pointer() : () -> i64
      %3612 = func.call @stack_pop_pointer() : () -> i64
      %3613 = func.call @cc_cons(%3612, %3611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3613) : (i64) -> ()
      %3614 = func.call @stack_pop_pointer() : () -> i64
      %3615 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3616 = arith.constant 16 : i64
      %3617 = func.call @cc_make_string(%3615, %3616) : (!llvm.ptr, i64) -> i64
      %3618 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3619 = arith.constant 7 : i64
      %3620 = func.call @cc_make_string(%3618, %3619) : (!llvm.ptr, i64) -> i64
      %3621 = func.call @cc_intern(%3617, %3620) : (i64, i64) -> i64
      %3622 = func.call @cc_nil_value() : () -> i64
      %3623 = func.call @cc_cons(%3621, %3622) : (i64, i64) -> i64
      %3624 = func.call @cc_values_pack(%3623) : (i64) -> i64
      func.call @stack_push_pointer(%3621) : (i64) -> ()
      %3625 = func.call @stack_pop_pointer() : () -> i64
      %3626 = arith.constant 34 : i64
      func.call @stack_push_fixnum(%3626) : (i64) -> ()
      %3627 = arith.constant 98 : i64
      func.call @stack_push_fixnum(%3627) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3628 = func.call @stack_pop_pointer() : () -> i64
      %3629 = func.call @stack_pop_pointer() : () -> i64
      %3630 = func.call @cc_cons(%3629, %3628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3630) : (i64) -> ()
      %3631 = func.call @stack_pop_pointer() : () -> i64
      %3632 = func.call @stack_pop_pointer() : () -> i64
      %3633 = func.call @cc_cons(%3632, %3631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3633) : (i64) -> ()
      %3634 = arith.constant 14 : i64
      func.call @stack_push_fixnum(%3634) : (i64) -> ()
      %3635 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%3635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3636 = func.call @stack_pop_pointer() : () -> i64
      %3637 = func.call @stack_pop_pointer() : () -> i64
      %3638 = func.call @cc_cons(%3637, %3636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3638) : (i64) -> ()
      %3639 = func.call @stack_pop_pointer() : () -> i64
      %3640 = func.call @stack_pop_pointer() : () -> i64
      %3641 = func.call @cc_cons(%3640, %3639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3642 = func.call @stack_pop_pointer() : () -> i64
      %3643 = func.call @stack_pop_pointer() : () -> i64
      %3644 = func.call @cc_cons(%3643, %3642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3644) : (i64) -> ()
      %3645 = func.call @stack_pop_pointer() : () -> i64
      %3646 = func.call @stack_pop_pointer() : () -> i64
      %3647 = func.call @cc_cons(%3646, %3645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3647) : (i64) -> ()
      %3648 = func.call @stack_pop_pointer() : () -> i64
      %3649 = func.call @cc_nil_value() : () -> i64
      %3650 = func.call @cc_errorp(%3578) : (i64) -> i64
      %3651 = arith.cmpi ne, %3650, %3649 : i64
      %3652 = arith.cmpi eq, %3649, %3649 : i64
      %3653 = arith.andi %3651, %3652 : i1
      %3654 = scf.if %3653 -> (i64) {
        scf.yield %3578 : i64
      } else {
        scf.yield %3649 : i64
      }
      %3655 = func.call @cc_errorp(%3589) : (i64) -> i64
      %3656 = arith.cmpi ne, %3655, %3649 : i64
      %3657 = arith.cmpi eq, %3654, %3649 : i64
      %3658 = arith.andi %3656, %3657 : i1
      %3659 = scf.if %3658 -> (i64) {
        scf.yield %3589 : i64
      } else {
        scf.yield %3654 : i64
      }
      %3660 = func.call @cc_errorp(%3614) : (i64) -> i64
      %3661 = arith.cmpi ne, %3660, %3649 : i64
      %3662 = arith.cmpi eq, %3659, %3649 : i64
      %3663 = arith.andi %3661, %3662 : i1
      %3664 = scf.if %3663 -> (i64) {
        scf.yield %3614 : i64
      } else {
        scf.yield %3659 : i64
      }
      %3665 = func.call @cc_errorp(%3625) : (i64) -> i64
      %3666 = arith.cmpi ne, %3665, %3649 : i64
      %3667 = arith.cmpi eq, %3664, %3649 : i64
      %3668 = arith.andi %3666, %3667 : i1
      %3669 = scf.if %3668 -> (i64) {
        scf.yield %3625 : i64
      } else {
        scf.yield %3664 : i64
      }
      %3670 = func.call @cc_errorp(%3648) : (i64) -> i64
      %3671 = arith.cmpi ne, %3670, %3649 : i64
      %3672 = arith.cmpi eq, %3669, %3649 : i64
      %3673 = arith.andi %3671, %3672 : i1
      %3674 = scf.if %3673 -> (i64) {
        scf.yield %3648 : i64
      } else {
        scf.yield %3669 : i64
      }
      %3675 = arith.cmpi ne, %3674, %3649 : i64
      scf.if %3675 {
        func.call @stack_push_pointer(%3674) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3578) : (i64) -> ()
        func.call @stack_push_pointer(%3589) : (i64) -> ()
        func.call @stack_push_pointer(%3614) : (i64) -> ()
        func.call @stack_push_pointer(%3625) : (i64) -> ()
        func.call @stack_push_pointer(%3648) : (i64) -> ()
        %3676 = llvm.mlir.addressof @str294 : !llvm.ptr
        %3677 = func.call @cc_make_function_ref_const(%3676) : (!llvm.ptr) -> i64
        %3678 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%3677, %3678) : (i64, i64) -> ()
      }
      %3679 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3680 = func.call @stack_pop_pointer() : () -> i64
      %3681 = func.call @cc_cons(%3679, %3680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3681) : (i64) -> ()
      %3682 = func.call @stack_pop_pointer() : () -> i64
      %3683 = func.call @cc_values_pack(%3682) : (i64) -> i64
      func.call @stack_push_pointer(%3683) : (i64) -> ()
      %3684 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3684 : i64
    }
    func.call @stack_push_pointer(%3569) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958542"() {
    %4033 = func.call @cc_nil_value() : () -> i64
    %4034 = func.call @cc_nil_value() : () -> i64
    %4035 = func.call @cc_errorp(%4033) : (i64) -> i64
    %4036 = arith.cmpi ne, %4035, %4034 : i64
    %4037 = scf.if %4036 -> (i64) {
      scf.yield %4033 : i64
    } else {
      %4038 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4038) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4039 = func.call @stack_pop_pointer() : () -> i64
      %4040 = func.call @stack_pop_pointer() : () -> i64
      %4041 = func.call @cc_cons(%4040, %4039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4041) : (i64) -> ()
      %4042 = func.call @stack_pop_pointer() : () -> i64
      %4043 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4044 = arith.constant 12 : i64
      %4045 = func.call @cc_make_string(%4043, %4044) : (!llvm.ptr, i64) -> i64
      %4046 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4047 = arith.constant 7 : i64
      %4048 = func.call @cc_make_string(%4046, %4047) : (!llvm.ptr, i64) -> i64
      %4049 = func.call @cc_intern(%4045, %4048) : (i64, i64) -> i64
      %4050 = func.call @cc_nil_value() : () -> i64
      %4051 = func.call @cc_cons(%4049, %4050) : (i64, i64) -> i64
      %4052 = func.call @cc_values_pack(%4051) : (i64) -> i64
      func.call @stack_push_pointer(%4049) : (i64) -> ()
      %4053 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4054 = func.call @stack_pop_pointer() : () -> i64
      %4055 = func.call @cc_nil_value() : () -> i64
      %4056 = func.call @cc_errorp(%4042) : (i64) -> i64
      %4057 = arith.cmpi ne, %4056, %4055 : i64
      %4058 = arith.cmpi eq, %4055, %4055 : i64
      %4059 = arith.andi %4057, %4058 : i1
      %4060 = scf.if %4059 -> (i64) {
        scf.yield %4042 : i64
      } else {
        scf.yield %4055 : i64
      }
      %4061 = func.call @cc_errorp(%4053) : (i64) -> i64
      %4062 = arith.cmpi ne, %4061, %4055 : i64
      %4063 = arith.cmpi eq, %4060, %4055 : i64
      %4064 = arith.andi %4062, %4063 : i1
      %4065 = scf.if %4064 -> (i64) {
        scf.yield %4053 : i64
      } else {
        scf.yield %4060 : i64
      }
      %4066 = func.call @cc_errorp(%4054) : (i64) -> i64
      %4067 = arith.cmpi ne, %4066, %4055 : i64
      %4068 = arith.cmpi eq, %4065, %4055 : i64
      %4069 = arith.andi %4067, %4068 : i1
      %4070 = scf.if %4069 -> (i64) {
        scf.yield %4054 : i64
      } else {
        scf.yield %4065 : i64
      }
      %4071 = arith.cmpi ne, %4070, %4055 : i64
      scf.if %4071 {
        func.call @stack_push_pointer(%4070) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4042) : (i64) -> ()
        func.call @stack_push_pointer(%4053) : (i64) -> ()
        func.call @stack_push_pointer(%4054) : (i64) -> ()
        %4072 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4073 = func.call @cc_make_function_ref_const(%4072) : (!llvm.ptr) -> i64
        %4074 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4073, %4074) : (i64, i64) -> ()
      }
      %4075 = func.call @stack_pop_pointer() : () -> i64
      %4076 = func.call @cc_nil_value() : () -> i64
      %4077 = func.call @cc_errorp(%4075) : (i64) -> i64
      %4078 = arith.cmpi ne, %4077, %4076 : i64
      %4079 = arith.cmpi eq, %4076, %4076 : i64
      %4080 = arith.andi %4078, %4079 : i1
      %4081 = scf.if %4080 -> (i64) {
        scf.yield %4075 : i64
      } else {
        scf.yield %4076 : i64
      }
      %4082 = arith.cmpi ne, %4081, %4076 : i64
      scf.if %4082 {
        func.call @stack_push_pointer(%4081) : (i64) -> ()
      } else {
        %4083 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4083) : (i64) -> ()
        func.call @stack_push_pointer(%4075) : (i64) -> ()
        %4084 = func.call @stack_pop_pointer() : () -> i64
        %4085 = func.call @stack_pop_pointer() : () -> i64
        %4086 = func.call @cc_cons(%4084, %4085) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4086) : (i64) -> ()
      }
      %4087 = func.call @stack_pop_pointer() : () -> i64
      %4088 = func.call @cc_errorp(%4087) : (i64) -> i64
      %4089 = func.call @cc_nil_value() : () -> i64
      %4090 = arith.cmpi ne, %4088, %4089 : i64
      %4091 = scf.if %4090 -> (i64) {
        %4092 = func.call @cc_condition_value(%4087) : (i64) -> i64
        %4093 = llvm.mlir.addressof @str333 : !llvm.ptr
        %4094 = arith.constant 5 : i64
        %4095 = func.call @cc_make_string(%4093, %4094) : (!llvm.ptr, i64) -> i64
        %4096 = llvm.mlir.addressof @str334 : !llvm.ptr
        %4097 = arith.constant 11 : i64
        %4098 = func.call @cc_make_string(%4096, %4097) : (!llvm.ptr, i64) -> i64
        %4099 = func.call @cc_intern(%4095, %4098) : (i64, i64) -> i64
        %4100 = func.call @cc_nil_value() : () -> i64
        %4101 = func.call @cc_cons(%4099, %4100) : (i64, i64) -> i64
        %4102 = func.call @cc_values_pack(%4101) : (i64) -> i64
        func.call @stack_push_pointer(%4099) : (i64) -> ()
        %4103 = func.call @stack_pop_pointer() : () -> i64
        %4104 = func.call @cc_typep(%4092, %4103) : (i64, i64) -> i64
        %4105 = func.call @cc_nil_value() : () -> i64
        %4106 = arith.cmpi ne, %4104, %4105 : i64
        %4107 = scf.if %4106 -> (i64) {
          func.call @stack_push_nil() : () -> ()
          %4108 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4108 : i64
        } else {
          scf.yield %4087 : i64
        }
        scf.yield %4107 : i64
      } else {
        scf.yield %4087 : i64
      }
      func.call @stack_push_pointer(%4091) : (i64) -> ()
      %4109 = func.call @stack_pop_pointer() : () -> i64
      %4110 = func.call @cc_nil_value() : () -> i64
      %4111 = func.call @cc_nil_value() : () -> i64
      %4112 = func.call @cc_errorp(%4110) : (i64) -> i64
      %4113 = arith.cmpi ne, %4112, %4111 : i64
      %4114 = scf.if %4113 -> (i64) {
        scf.yield %4110 : i64
      } else {
        %4115 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4109) : (i64) -> ()
        %4116 = func.call @stack_pop_pointer() : () -> i64
        %4117 = func.call @cc_nil_value() : () -> i64
        %4118 = arith.cmpi eq, %4116, %4117 : i64
        %4120 = func.call @cc_t_value() : () -> i64
        %4119 = arith.select %4118, %4120, %4117 : i64
        func.call @stack_push_pointer(%4119) : (i64) -> ()
        %4121 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4109) : (i64) -> ()
        %4122 = func.call @stack_pop_pointer() : () -> i64
        %4123 = func.call @cc_arrayp(%4122) : (i64) -> i64
        func.call @stack_push_pointer(%4123) : (i64) -> ()
        %4124 = func.call @stack_pop_pointer() : () -> i64
        %4125 = func.call @cc_cons(%4124, %4115) : (i64, i64) -> i64
        %4126 = func.call @cc_cons(%4121, %4125) : (i64, i64) -> i64
        %4127 = func.call @cc_or(%4126) : (i64) -> i64
        func.call @stack_push_pointer(%4127) : (i64) -> ()
        %4128 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4128 : i64
      }
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4129 = func.call @stack_pop_pointer() : () -> i64
      %4130 = func.call @cc_nil_value() : () -> i64
      %4131 = func.call @cc_cons(%4129, %4130) : (i64, i64) -> i64
      %4132 = func.call @cc_not(%4131) : (i64) -> i64
      func.call @stack_push_pointer(%4132) : (i64) -> ()
      %4133 = func.call @stack_pop_pointer() : () -> i64
      %4134 = func.call @cc_nil_value() : () -> i64
      %4135 = func.call @cc_cons(%4133, %4134) : (i64, i64) -> i64
      %4136 = func.call @cc_not(%4135) : (i64) -> i64
      func.call @stack_push_pointer(%4136) : (i64) -> ()
      %4137 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4137 : i64
    }
    func.call @stack_push_pointer(%4037) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958543"() {
    %4406 = func.call @cc_nil_value() : () -> i64
    %4407 = func.call @cc_nil_value() : () -> i64
    %4408 = func.call @cc_errorp(%4406) : (i64) -> i64
    %4409 = arith.cmpi ne, %4408, %4407 : i64
    %4410 = scf.if %4409 -> (i64) {
      scf.yield %4406 : i64
    } else {
      %4411 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4411) : (i64) -> ()
      %4412 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4412) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4413 = func.call @stack_pop_pointer() : () -> i64
      %4414 = func.call @stack_pop_pointer() : () -> i64
      %4415 = func.call @cc_cons(%4414, %4413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4415) : (i64) -> ()
      %4416 = func.call @stack_pop_pointer() : () -> i64
      %4417 = func.call @stack_pop_pointer() : () -> i64
      %4418 = func.call @cc_cons(%4417, %4416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4418) : (i64) -> ()
      %4419 = func.call @stack_pop_pointer() : () -> i64
      %4420 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4421 = arith.constant 15 : i64
      %4422 = func.call @cc_make_string(%4420, %4421) : (!llvm.ptr, i64) -> i64
      %4423 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4424 = arith.constant 7 : i64
      %4425 = func.call @cc_make_string(%4423, %4424) : (!llvm.ptr, i64) -> i64
      %4426 = func.call @cc_intern(%4422, %4425) : (i64, i64) -> i64
      %4427 = func.call @cc_nil_value() : () -> i64
      %4428 = func.call @cc_cons(%4426, %4427) : (i64, i64) -> i64
      %4429 = func.call @cc_values_pack(%4428) : (i64) -> i64
      func.call @stack_push_pointer(%4426) : (i64) -> ()
      %4430 = func.call @stack_pop_pointer() : () -> i64
      %4431 = arith.constant 97 : i64
      %4432 = func.call @cc_box_character(%4431) : (i64) -> i64
      func.call @stack_push_pointer(%4432) : (i64) -> ()
      %4433 = func.call @stack_pop_pointer() : () -> i64
      %4434 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4435 = arith.constant 12 : i64
      %4436 = func.call @cc_make_string(%4434, %4435) : (!llvm.ptr, i64) -> i64
      %4437 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4438 = arith.constant 7 : i64
      %4439 = func.call @cc_make_string(%4437, %4438) : (!llvm.ptr, i64) -> i64
      %4440 = func.call @cc_intern(%4436, %4439) : (i64, i64) -> i64
      %4441 = func.call @cc_nil_value() : () -> i64
      %4442 = func.call @cc_cons(%4440, %4441) : (i64, i64) -> i64
      %4443 = func.call @cc_values_pack(%4442) : (i64) -> i64
      func.call @stack_push_pointer(%4440) : (i64) -> ()
      %4444 = func.call @stack_pop_pointer() : () -> i64
      %4445 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4446 = arith.constant 9 : i64
      %4447 = func.call @cc_make_string(%4445, %4446) : (!llvm.ptr, i64) -> i64
      %4448 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4449 = arith.constant 11 : i64
      %4450 = func.call @cc_make_string(%4448, %4449) : (!llvm.ptr, i64) -> i64
      %4451 = func.call @cc_intern(%4447, %4450) : (i64, i64) -> i64
      %4452 = func.call @cc_nil_value() : () -> i64
      %4453 = func.call @cc_cons(%4451, %4452) : (i64, i64) -> i64
      %4454 = func.call @cc_values_pack(%4453) : (i64) -> i64
      func.call @stack_push_pointer(%4451) : (i64) -> ()
      %4455 = func.call @stack_pop_pointer() : () -> i64
      %4456 = func.call @cc_nil_value() : () -> i64
      %4457 = func.call @cc_errorp(%4419) : (i64) -> i64
      %4458 = arith.cmpi ne, %4457, %4456 : i64
      %4459 = arith.cmpi eq, %4456, %4456 : i64
      %4460 = arith.andi %4458, %4459 : i1
      %4461 = scf.if %4460 -> (i64) {
        scf.yield %4419 : i64
      } else {
        scf.yield %4456 : i64
      }
      %4462 = func.call @cc_errorp(%4430) : (i64) -> i64
      %4463 = arith.cmpi ne, %4462, %4456 : i64
      %4464 = arith.cmpi eq, %4461, %4456 : i64
      %4465 = arith.andi %4463, %4464 : i1
      %4466 = scf.if %4465 -> (i64) {
        scf.yield %4430 : i64
      } else {
        scf.yield %4461 : i64
      }
      %4467 = func.call @cc_errorp(%4433) : (i64) -> i64
      %4468 = arith.cmpi ne, %4467, %4456 : i64
      %4469 = arith.cmpi eq, %4466, %4456 : i64
      %4470 = arith.andi %4468, %4469 : i1
      %4471 = scf.if %4470 -> (i64) {
        scf.yield %4433 : i64
      } else {
        scf.yield %4466 : i64
      }
      %4472 = func.call @cc_errorp(%4444) : (i64) -> i64
      %4473 = arith.cmpi ne, %4472, %4456 : i64
      %4474 = arith.cmpi eq, %4471, %4456 : i64
      %4475 = arith.andi %4473, %4474 : i1
      %4476 = scf.if %4475 -> (i64) {
        scf.yield %4444 : i64
      } else {
        scf.yield %4471 : i64
      }
      %4477 = func.call @cc_errorp(%4455) : (i64) -> i64
      %4478 = arith.cmpi ne, %4477, %4456 : i64
      %4479 = arith.cmpi eq, %4476, %4456 : i64
      %4480 = arith.andi %4478, %4479 : i1
      %4481 = scf.if %4480 -> (i64) {
        scf.yield %4455 : i64
      } else {
        scf.yield %4476 : i64
      }
      %4482 = arith.cmpi ne, %4481, %4456 : i64
      scf.if %4482 {
        func.call @stack_push_pointer(%4481) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4419) : (i64) -> ()
        func.call @stack_push_pointer(%4430) : (i64) -> ()
        func.call @stack_push_pointer(%4433) : (i64) -> ()
        func.call @stack_push_pointer(%4444) : (i64) -> ()
        func.call @stack_push_pointer(%4455) : (i64) -> ()
        %4483 = llvm.mlir.addressof @str364 : !llvm.ptr
        %4484 = func.call @cc_make_function_ref_const(%4483) : (!llvm.ptr) -> i64
        %4485 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%4484, %4485) : (i64, i64) -> ()
      }
      %4486 = func.call @stack_pop_pointer() : () -> i64
      %4487 = func.call @cc_nil_value() : () -> i64
      %4488 = func.call @cc_nil_value() : () -> i64
      %4489 = func.call @cc_errorp(%4487) : (i64) -> i64
      %4490 = arith.cmpi ne, %4489, %4488 : i64
      %4491 = scf.if %4490 -> (i64) {
        scf.yield %4487 : i64
      } else {
        func.call @stack_push_pointer(%4486) : (i64) -> ()
        %4492 = func.call @stack_pop_pointer() : () -> i64
        %4493 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%4493) : (i64) -> ()
        %4494 = func.call @stack_pop_pointer() : () -> i64
        %4495 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%4495) : (i64) -> ()
        %4496 = func.call @stack_pop_pointer() : () -> i64
        %4497 = func.call @cc_nil_value() : () -> i64
        %4498 = func.call @cc_errorp(%4492) : (i64) -> i64
        %4499 = arith.cmpi ne, %4498, %4497 : i64
        %4500 = arith.cmpi eq, %4497, %4497 : i64
        %4501 = arith.andi %4499, %4500 : i1
        %4502 = scf.if %4501 -> (i64) {
          scf.yield %4492 : i64
        } else {
          scf.yield %4497 : i64
        }
        %4503 = func.call @cc_errorp(%4494) : (i64) -> i64
        %4504 = arith.cmpi ne, %4503, %4497 : i64
        %4505 = arith.cmpi eq, %4502, %4497 : i64
        %4506 = arith.andi %4504, %4505 : i1
        %4507 = scf.if %4506 -> (i64) {
          scf.yield %4494 : i64
        } else {
          scf.yield %4502 : i64
        }
        %4508 = func.call @cc_errorp(%4496) : (i64) -> i64
        %4509 = arith.cmpi ne, %4508, %4497 : i64
        %4510 = arith.cmpi eq, %4507, %4497 : i64
        %4511 = arith.andi %4509, %4510 : i1
        %4512 = scf.if %4511 -> (i64) {
          scf.yield %4496 : i64
        } else {
          scf.yield %4507 : i64
        }
        %4513 = arith.cmpi ne, %4512, %4497 : i64
        scf.if %4513 {
          func.call @stack_push_pointer(%4512) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4492) : (i64) -> ()
          func.call @stack_push_pointer(%4494) : (i64) -> ()
          func.call @stack_push_pointer(%4496) : (i64) -> ()
          %4514 = llvm.mlir.addressof @str365 : !llvm.ptr
          %4515 = func.call @cc_make_function_ref_const(%4514) : (!llvm.ptr) -> i64
          %4516 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%4515, %4516) : (i64, i64) -> ()
        }
        %4517 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4517 : i64
      }
      func.call @stack_push_pointer(%4491) : (i64) -> ()
      %4518 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4518 : i64
    }
    func.call @stack_push_pointer(%4410) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958544"() {
    %4781 = func.call @cc_nil_value() : () -> i64
    %4782 = func.call @cc_nil_value() : () -> i64
    %4783 = func.call @cc_errorp(%4781) : (i64) -> i64
    %4784 = arith.cmpi ne, %4783, %4782 : i64
    %4785 = scf.if %4784 -> (i64) {
      scf.yield %4781 : i64
    } else {
      %4786 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%4786) : (i64) -> ()
      %4787 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4788 = func.call @stack_pop_pointer() : () -> i64
      %4789 = func.call @stack_pop_pointer() : () -> i64
      %4790 = func.call @cc_cons(%4789, %4788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4790) : (i64) -> ()
      %4791 = func.call @stack_pop_pointer() : () -> i64
      %4792 = func.call @stack_pop_pointer() : () -> i64
      %4793 = func.call @cc_cons(%4792, %4791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4793) : (i64) -> ()
      %4794 = func.call @stack_pop_pointer() : () -> i64
      %4795 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4796 = arith.constant 15 : i64
      %4797 = func.call @cc_make_string(%4795, %4796) : (!llvm.ptr, i64) -> i64
      %4798 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4799 = arith.constant 7 : i64
      %4800 = func.call @cc_make_string(%4798, %4799) : (!llvm.ptr, i64) -> i64
      %4801 = func.call @cc_intern(%4797, %4800) : (i64, i64) -> i64
      %4802 = func.call @cc_nil_value() : () -> i64
      %4803 = func.call @cc_cons(%4801, %4802) : (i64, i64) -> i64
      %4804 = func.call @cc_values_pack(%4803) : (i64) -> i64
      func.call @stack_push_pointer(%4801) : (i64) -> ()
      %4805 = func.call @stack_pop_pointer() : () -> i64
      %4806 = arith.constant 97 : i64
      %4807 = func.call @cc_box_character(%4806) : (i64) -> i64
      func.call @stack_push_pointer(%4807) : (i64) -> ()
      %4808 = func.call @stack_pop_pointer() : () -> i64
      %4809 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4810 = arith.constant 12 : i64
      %4811 = func.call @cc_make_string(%4809, %4810) : (!llvm.ptr, i64) -> i64
      %4812 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4813 = arith.constant 7 : i64
      %4814 = func.call @cc_make_string(%4812, %4813) : (!llvm.ptr, i64) -> i64
      %4815 = func.call @cc_intern(%4811, %4814) : (i64, i64) -> i64
      %4816 = func.call @cc_nil_value() : () -> i64
      %4817 = func.call @cc_cons(%4815, %4816) : (i64, i64) -> i64
      %4818 = func.call @cc_values_pack(%4817) : (i64) -> i64
      func.call @stack_push_pointer(%4815) : (i64) -> ()
      %4819 = func.call @stack_pop_pointer() : () -> i64
      %4820 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4821 = arith.constant 9 : i64
      %4822 = func.call @cc_make_string(%4820, %4821) : (!llvm.ptr, i64) -> i64
      %4823 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4824 = arith.constant 11 : i64
      %4825 = func.call @cc_make_string(%4823, %4824) : (!llvm.ptr, i64) -> i64
      %4826 = func.call @cc_intern(%4822, %4825) : (i64, i64) -> i64
      %4827 = func.call @cc_nil_value() : () -> i64
      %4828 = func.call @cc_cons(%4826, %4827) : (i64, i64) -> i64
      %4829 = func.call @cc_values_pack(%4828) : (i64) -> i64
      func.call @stack_push_pointer(%4826) : (i64) -> ()
      %4830 = func.call @stack_pop_pointer() : () -> i64
      %4831 = func.call @cc_nil_value() : () -> i64
      %4832 = func.call @cc_errorp(%4794) : (i64) -> i64
      %4833 = arith.cmpi ne, %4832, %4831 : i64
      %4834 = arith.cmpi eq, %4831, %4831 : i64
      %4835 = arith.andi %4833, %4834 : i1
      %4836 = scf.if %4835 -> (i64) {
        scf.yield %4794 : i64
      } else {
        scf.yield %4831 : i64
      }
      %4837 = func.call @cc_errorp(%4805) : (i64) -> i64
      %4838 = arith.cmpi ne, %4837, %4831 : i64
      %4839 = arith.cmpi eq, %4836, %4831 : i64
      %4840 = arith.andi %4838, %4839 : i1
      %4841 = scf.if %4840 -> (i64) {
        scf.yield %4805 : i64
      } else {
        scf.yield %4836 : i64
      }
      %4842 = func.call @cc_errorp(%4808) : (i64) -> i64
      %4843 = arith.cmpi ne, %4842, %4831 : i64
      %4844 = arith.cmpi eq, %4841, %4831 : i64
      %4845 = arith.andi %4843, %4844 : i1
      %4846 = scf.if %4845 -> (i64) {
        scf.yield %4808 : i64
      } else {
        scf.yield %4841 : i64
      }
      %4847 = func.call @cc_errorp(%4819) : (i64) -> i64
      %4848 = arith.cmpi ne, %4847, %4831 : i64
      %4849 = arith.cmpi eq, %4846, %4831 : i64
      %4850 = arith.andi %4848, %4849 : i1
      %4851 = scf.if %4850 -> (i64) {
        scf.yield %4819 : i64
      } else {
        scf.yield %4846 : i64
      }
      %4852 = func.call @cc_errorp(%4830) : (i64) -> i64
      %4853 = arith.cmpi ne, %4852, %4831 : i64
      %4854 = arith.cmpi eq, %4851, %4831 : i64
      %4855 = arith.andi %4853, %4854 : i1
      %4856 = scf.if %4855 -> (i64) {
        scf.yield %4830 : i64
      } else {
        scf.yield %4851 : i64
      }
      %4857 = arith.cmpi ne, %4856, %4831 : i64
      scf.if %4857 {
        func.call @stack_push_pointer(%4856) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4794) : (i64) -> ()
        func.call @stack_push_pointer(%4805) : (i64) -> ()
        func.call @stack_push_pointer(%4808) : (i64) -> ()
        func.call @stack_push_pointer(%4819) : (i64) -> ()
        func.call @stack_push_pointer(%4830) : (i64) -> ()
        %4858 = llvm.mlir.addressof @str394 : !llvm.ptr
        %4859 = func.call @cc_make_function_ref_const(%4858) : (!llvm.ptr) -> i64
        %4860 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%4859, %4860) : (i64, i64) -> ()
      }
      %4861 = func.call @stack_pop_pointer() : () -> i64
      %4862 = func.call @cc_nil_value() : () -> i64
      %4863 = func.call @cc_nil_value() : () -> i64
      %4864 = func.call @cc_errorp(%4862) : (i64) -> i64
      %4865 = arith.cmpi ne, %4864, %4863 : i64
      %4866 = scf.if %4865 -> (i64) {
        scf.yield %4862 : i64
      } else {
        func.call @stack_push_pointer(%4861) : (i64) -> ()
        %4867 = func.call @stack_pop_pointer() : () -> i64
        %4868 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%4868) : (i64) -> ()
        %4869 = func.call @stack_pop_pointer() : () -> i64
        %4870 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%4870) : (i64) -> ()
        %4871 = func.call @stack_pop_pointer() : () -> i64
        %4872 = func.call @cc_nil_value() : () -> i64
        %4873 = func.call @cc_errorp(%4867) : (i64) -> i64
        %4874 = arith.cmpi ne, %4873, %4872 : i64
        %4875 = arith.cmpi eq, %4872, %4872 : i64
        %4876 = arith.andi %4874, %4875 : i1
        %4877 = scf.if %4876 -> (i64) {
          scf.yield %4867 : i64
        } else {
          scf.yield %4872 : i64
        }
        %4878 = func.call @cc_errorp(%4869) : (i64) -> i64
        %4879 = arith.cmpi ne, %4878, %4872 : i64
        %4880 = arith.cmpi eq, %4877, %4872 : i64
        %4881 = arith.andi %4879, %4880 : i1
        %4882 = scf.if %4881 -> (i64) {
          scf.yield %4869 : i64
        } else {
          scf.yield %4877 : i64
        }
        %4883 = func.call @cc_errorp(%4871) : (i64) -> i64
        %4884 = arith.cmpi ne, %4883, %4872 : i64
        %4885 = arith.cmpi eq, %4882, %4872 : i64
        %4886 = arith.andi %4884, %4885 : i1
        %4887 = scf.if %4886 -> (i64) {
          scf.yield %4871 : i64
        } else {
          scf.yield %4882 : i64
        }
        %4888 = arith.cmpi ne, %4887, %4872 : i64
        scf.if %4888 {
          func.call @stack_push_pointer(%4887) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4867) : (i64) -> ()
          func.call @stack_push_pointer(%4869) : (i64) -> ()
          func.call @stack_push_pointer(%4871) : (i64) -> ()
          %4889 = llvm.mlir.addressof @str395 : !llvm.ptr
          %4890 = func.call @cc_make_function_ref_const(%4889) : (!llvm.ptr) -> i64
          %4891 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%4890, %4891) : (i64, i64) -> ()
        }
        %4892 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4892 : i64
      }
      func.call @stack_push_pointer(%4866) : (i64) -> ()
      %4893 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4893 : i64
    }
    func.call @stack_push_pointer(%4785) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958545"() {
    %5131 = func.call @cc_nil_value() : () -> i64
    %5132 = func.call @cc_nil_value() : () -> i64
    %5133 = func.call @cc_errorp(%5131) : (i64) -> i64
    %5134 = arith.cmpi ne, %5133, %5132 : i64
    %5135 = scf.if %5134 -> (i64) {
      scf.yield %5131 : i64
    } else {
      %5136 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5137 = func.call @cc_nil_value() : () -> i64
      %5138 = func.call @cc_nil_value() : () -> i64
      %5139 = func.call @cc_errorp(%5137) : (i64) -> i64
      %5140 = arith.cmpi ne, %5139, %5138 : i64
      %5141 = scf.if %5140 -> (i64) {
        scf.yield %5137 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5142 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%5142) : (i64) -> ()
        %5143 = func.call @stack_pop_pointer() : () -> i64
        %5144 = llvm.mlir.addressof @str419 : !llvm.ptr
        %5145 = arith.constant 12 : i64
        %5146 = func.call @cc_make_string(%5144, %5145) : (!llvm.ptr, i64) -> i64
        %5147 = llvm.mlir.addressof @str420 : !llvm.ptr
        %5148 = arith.constant 7 : i64
        %5149 = func.call @cc_make_string(%5147, %5148) : (!llvm.ptr, i64) -> i64
        %5150 = func.call @cc_intern(%5146, %5149) : (i64, i64) -> i64
        %5151 = func.call @cc_nil_value() : () -> i64
        %5152 = func.call @cc_cons(%5150, %5151) : (i64, i64) -> i64
        %5153 = func.call @cc_values_pack(%5152) : (i64) -> i64
        func.call @stack_push_pointer(%5150) : (i64) -> ()
        %5154 = func.call @stack_pop_pointer() : () -> i64
        %5155 = llvm.mlir.addressof @str421 : !llvm.ptr
        %5156 = arith.constant 0 : i64
        %5157 = func.call @cc_make_string(%5155, %5156) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%5157) : (i64) -> ()
        %5158 = func.call @stack_pop_pointer() : () -> i64
        %5159 = func.call @cc_nil_value() : () -> i64
        %5160 = func.call @cc_errorp(%5158) : (i64) -> i64
        %5161 = arith.cmpi ne, %5160, %5159 : i64
        %5162 = arith.cmpi eq, %5159, %5159 : i64
        %5163 = arith.andi %5161, %5162 : i1
        %5164 = scf.if %5163 -> (i64) {
          scf.yield %5158 : i64
        } else {
          scf.yield %5159 : i64
        }
        %5165 = arith.cmpi ne, %5164, %5159 : i64
        scf.if %5165 {
          func.call @stack_push_pointer(%5164) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5158) : (i64) -> ()
          %5166 = llvm.mlir.addressof @str422 : !llvm.ptr
          %5167 = func.call @cc_make_function_ref_const(%5166) : (!llvm.ptr) -> i64
          %5168 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5167, %5168) : (i64, i64) -> ()
        }
        %5169 = func.call @stack_pop_pointer() : () -> i64
        %5170 = llvm.mlir.addressof @str423 : !llvm.ptr
        %5171 = arith.constant 22 : i64
        %5172 = func.call @cc_make_string(%5170, %5171) : (!llvm.ptr, i64) -> i64
        %5173 = llvm.mlir.addressof @str424 : !llvm.ptr
        %5174 = arith.constant 7 : i64
        %5175 = func.call @cc_make_string(%5173, %5174) : (!llvm.ptr, i64) -> i64
        %5176 = func.call @cc_intern(%5172, %5175) : (i64, i64) -> i64
        %5177 = func.call @cc_nil_value() : () -> i64
        %5178 = func.call @cc_cons(%5176, %5177) : (i64, i64) -> i64
        %5179 = func.call @cc_values_pack(%5178) : (i64) -> i64
        func.call @stack_push_pointer(%5176) : (i64) -> ()
        %5180 = func.call @stack_pop_pointer() : () -> i64
        %5181 = arith.constant 2 : i64
        func.call @stack_push_fixnum(%5181) : (i64) -> ()
        %5182 = func.call @stack_pop_pointer() : () -> i64
        %5183 = llvm.mlir.addressof @str425 : !llvm.ptr
        %5184 = arith.constant 12 : i64
        %5185 = func.call @cc_make_string(%5183, %5184) : (!llvm.ptr, i64) -> i64
        %5186 = llvm.mlir.addressof @str426 : !llvm.ptr
        %5187 = arith.constant 7 : i64
        %5188 = func.call @cc_make_string(%5186, %5187) : (!llvm.ptr, i64) -> i64
        %5189 = func.call @cc_intern(%5185, %5188) : (i64, i64) -> i64
        %5190 = func.call @cc_nil_value() : () -> i64
        %5191 = func.call @cc_cons(%5189, %5190) : (i64, i64) -> i64
        %5192 = func.call @cc_values_pack(%5191) : (i64) -> i64
        func.call @stack_push_pointer(%5189) : (i64) -> ()
        %5193 = func.call @stack_pop_pointer() : () -> i64
        %5194 = llvm.mlir.addressof @str427 : !llvm.ptr
        %5195 = arith.constant 0 : i64
        %5196 = func.call @cc_make_string(%5194, %5195) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%5196) : (i64) -> ()
        %5197 = func.call @stack_pop_pointer() : () -> i64
        %5198 = func.call @cc_nil_value() : () -> i64
        %5199 = func.call @cc_errorp(%5143) : (i64) -> i64
        %5200 = arith.cmpi ne, %5199, %5198 : i64
        %5201 = arith.cmpi eq, %5198, %5198 : i64
        %5202 = arith.andi %5200, %5201 : i1
        %5203 = scf.if %5202 -> (i64) {
          scf.yield %5143 : i64
        } else {
          scf.yield %5198 : i64
        }
        %5204 = func.call @cc_errorp(%5154) : (i64) -> i64
        %5205 = arith.cmpi ne, %5204, %5198 : i64
        %5206 = arith.cmpi eq, %5203, %5198 : i64
        %5207 = arith.andi %5205, %5206 : i1
        %5208 = scf.if %5207 -> (i64) {
          scf.yield %5154 : i64
        } else {
          scf.yield %5203 : i64
        }
        %5209 = func.call @cc_errorp(%5169) : (i64) -> i64
        %5210 = arith.cmpi ne, %5209, %5198 : i64
        %5211 = arith.cmpi eq, %5208, %5198 : i64
        %5212 = arith.andi %5210, %5211 : i1
        %5213 = scf.if %5212 -> (i64) {
          scf.yield %5169 : i64
        } else {
          scf.yield %5208 : i64
        }
        %5214 = func.call @cc_errorp(%5180) : (i64) -> i64
        %5215 = arith.cmpi ne, %5214, %5198 : i64
        %5216 = arith.cmpi eq, %5213, %5198 : i64
        %5217 = arith.andi %5215, %5216 : i1
        %5218 = scf.if %5217 -> (i64) {
          scf.yield %5180 : i64
        } else {
          scf.yield %5213 : i64
        }
        %5219 = func.call @cc_errorp(%5182) : (i64) -> i64
        %5220 = arith.cmpi ne, %5219, %5198 : i64
        %5221 = arith.cmpi eq, %5218, %5198 : i64
        %5222 = arith.andi %5220, %5221 : i1
        %5223 = scf.if %5222 -> (i64) {
          scf.yield %5182 : i64
        } else {
          scf.yield %5218 : i64
        }
        %5224 = func.call @cc_errorp(%5193) : (i64) -> i64
        %5225 = arith.cmpi ne, %5224, %5198 : i64
        %5226 = arith.cmpi eq, %5223, %5198 : i64
        %5227 = arith.andi %5225, %5226 : i1
        %5228 = scf.if %5227 -> (i64) {
          scf.yield %5193 : i64
        } else {
          scf.yield %5223 : i64
        }
        %5229 = func.call @cc_errorp(%5197) : (i64) -> i64
        %5230 = arith.cmpi ne, %5229, %5198 : i64
        %5231 = arith.cmpi eq, %5228, %5198 : i64
        %5232 = arith.andi %5230, %5231 : i1
        %5233 = scf.if %5232 -> (i64) {
          scf.yield %5197 : i64
        } else {
          scf.yield %5228 : i64
        }
        %5234 = arith.cmpi ne, %5233, %5198 : i64
        scf.if %5234 {
          func.call @stack_push_pointer(%5233) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5143) : (i64) -> ()
          func.call @stack_push_pointer(%5154) : (i64) -> ()
          func.call @stack_push_pointer(%5169) : (i64) -> ()
          func.call @stack_push_pointer(%5180) : (i64) -> ()
          func.call @stack_push_pointer(%5182) : (i64) -> ()
          func.call @stack_push_pointer(%5193) : (i64) -> ()
          func.call @stack_push_pointer(%5197) : (i64) -> ()
          %5235 = llvm.mlir.addressof @str428 : !llvm.ptr
          %5236 = func.call @cc_make_function_ref_const(%5235) : (!llvm.ptr) -> i64
          %5237 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%5236, %5237) : (i64, i64) -> ()
        }
        %5238 = func.call @stack_pop_pointer() : () -> i64
        %5239 = func.call @cc_errorp(%5238) : (i64) -> i64
        %5240 = func.call @cc_nil_value() : () -> i64
        %5241 = arith.cmpi ne, %5239, %5240 : i64
        scf.if %5241 {
          func.call @stack_push_pointer(%5238) : (i64) -> ()
        } else {
          %5242 = func.call @cc_multiple_value_list(%5238) : (i64) -> i64
          func.call @stack_push_pointer(%5242) : (i64) -> ()
        }
        %5243 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5244 = func.call @stack_pop_pointer() : () -> i64
        %5245 = func.call @cc_nil_value() : () -> i64
        %5246 = func.call @cc_maybe_error_from_multiple_value_list(%5243) : (i64) -> i64
        %5247 = func.call @cc_errorp(%5246) : (i64) -> i64
        %5248 = arith.cmpi ne, %5247, %5245 : i64
        %5249 = arith.cmpi eq, %5245, %5245 : i64
        %5250 = arith.andi %5248, %5249 : i1
        %5251 = scf.if %5250 -> (i64) {
          scf.yield %5246 : i64
        } else {
          scf.yield %5245 : i64
        }
        %5252 = arith.cmpi ne, %5251, %5245 : i64
        scf.if %5252 {
          func.call @stack_push_pointer(%5251) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5253 = func.call @stack_pop_pointer() : () -> i64
          %5254 = func.call @cc_cons(%5244, %5253) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5254) : (i64) -> ()
          %5255 = func.call @stack_pop_pointer() : () -> i64
          %5256 = func.call @cc_cons(%5243, %5255) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5256) : (i64) -> ()
          %5257 = func.call @stack_pop_pointer() : () -> i64
          %5258 = func.call @cc_values_pack(%5257) : (i64) -> i64
          func.call @stack_push_pointer(%5258) : (i64) -> ()
        }
        %5259 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5259 : i64
      }
      func.call @stack_push_pointer(%5141) : (i64) -> ()
      %5260 = func.call @stack_pop_pointer() : () -> i64
      %5261 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5262 = func.call @cc_errorp(%5260) : (i64) -> i64
      %5263 = func.call @cc_nil_value() : () -> i64
      %5264 = arith.cmpi ne, %5262, %5263 : i64
      scf.if %5264 {
        %5265 = func.call @cc_condition_value(%5260) : (i64) -> i64
        %5266 = func.call @cc_values2(%5263, %5265) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5266) : (i64) -> ()
      } else {
        %5267 = func.call @cc_multiple_value_list(%5260) : (i64) -> i64
        %5268 = func.call @cc_values_pack(%5267) : (i64) -> i64
        func.call @stack_push_pointer(%5268) : (i64) -> ()
      }
      %5269 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5269 : i64
    }
    func.call @stack_push_pointer(%5135) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958546"() {
    %5486 = func.call @cc_nil_value() : () -> i64
    %5487 = func.call @cc_nil_value() : () -> i64
    %5488 = func.call @cc_errorp(%5486) : (i64) -> i64
    %5489 = arith.cmpi ne, %5488, %5487 : i64
    %5490 = scf.if %5489 -> (i64) {
      scf.yield %5486 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %5491 = func.call @stack_pop_pointer() : () -> i64
      %5492 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5493 = arith.constant 15 : i64
      %5494 = func.call @cc_make_string(%5492, %5493) : (!llvm.ptr, i64) -> i64
      %5495 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5496 = arith.constant 7 : i64
      %5497 = func.call @cc_make_string(%5495, %5496) : (!llvm.ptr, i64) -> i64
      %5498 = func.call @cc_intern(%5494, %5497) : (i64, i64) -> i64
      %5499 = func.call @cc_nil_value() : () -> i64
      %5500 = func.call @cc_cons(%5498, %5499) : (i64, i64) -> i64
      %5501 = func.call @cc_values_pack(%5500) : (i64) -> i64
      func.call @stack_push_pointer(%5498) : (i64) -> ()
      %5502 = func.call @stack_pop_pointer() : () -> i64
      %5503 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%5503) : (i64) -> ()
      %5504 = func.call @stack_pop_pointer() : () -> i64
      %5505 = func.call @cc_nil_value() : () -> i64
      %5506 = func.call @cc_errorp(%5491) : (i64) -> i64
      %5507 = arith.cmpi ne, %5506, %5505 : i64
      %5508 = arith.cmpi eq, %5505, %5505 : i64
      %5509 = arith.andi %5507, %5508 : i1
      %5510 = scf.if %5509 -> (i64) {
        scf.yield %5491 : i64
      } else {
        scf.yield %5505 : i64
      }
      %5511 = func.call @cc_errorp(%5502) : (i64) -> i64
      %5512 = arith.cmpi ne, %5511, %5505 : i64
      %5513 = arith.cmpi eq, %5510, %5505 : i64
      %5514 = arith.andi %5512, %5513 : i1
      %5515 = scf.if %5514 -> (i64) {
        scf.yield %5502 : i64
      } else {
        scf.yield %5510 : i64
      }
      %5516 = func.call @cc_errorp(%5504) : (i64) -> i64
      %5517 = arith.cmpi ne, %5516, %5505 : i64
      %5518 = arith.cmpi eq, %5515, %5505 : i64
      %5519 = arith.andi %5517, %5518 : i1
      %5520 = scf.if %5519 -> (i64) {
        scf.yield %5504 : i64
      } else {
        scf.yield %5515 : i64
      }
      %5521 = arith.cmpi ne, %5520, %5505 : i64
      scf.if %5521 {
        func.call @stack_push_pointer(%5520) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5491) : (i64) -> ()
        func.call @stack_push_pointer(%5502) : (i64) -> ()
        func.call @stack_push_pointer(%5504) : (i64) -> ()
        %5522 = llvm.mlir.addressof @str452 : !llvm.ptr
        %5523 = func.call @cc_make_function_ref_const(%5522) : (!llvm.ptr) -> i64
        %5524 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%5523, %5524) : (i64, i64) -> ()
      }
      %5525 = func.call @stack_pop_pointer() : () -> i64
      %5526 = func.call @cc_nil_value() : () -> i64
      %5527 = func.call @cc_nil_value() : () -> i64
      %5528 = func.call @cc_errorp(%5526) : (i64) -> i64
      %5529 = arith.cmpi ne, %5528, %5527 : i64
      %5530 = scf.if %5529 -> (i64) {
        scf.yield %5526 : i64
      } else {
        func.call @stack_push_pointer(%5525) : (i64) -> ()
        %5531 = func.call @stack_pop_pointer() : () -> i64
        %5532 = func.call @cc_nil_value() : () -> i64
        %5533 = func.call @cc_errorp(%5531) : (i64) -> i64
        %5534 = arith.cmpi ne, %5533, %5532 : i64
        %5535 = arith.cmpi eq, %5532, %5532 : i64
        %5536 = arith.andi %5534, %5535 : i1
        %5537 = scf.if %5536 -> (i64) {
          scf.yield %5531 : i64
        } else {
          scf.yield %5532 : i64
        }
        %5538 = arith.cmpi ne, %5537, %5532 : i64
        scf.if %5538 {
          func.call @stack_push_pointer(%5537) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5531) : (i64) -> ()
          %5539 = llvm.mlir.addressof @str453 : !llvm.ptr
          %5540 = func.call @cc_make_function_ref_const(%5539) : (!llvm.ptr) -> i64
          %5541 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5540, %5541) : (i64, i64) -> ()
        }
        %5542 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5542 : i64
      }
      func.call @stack_push_pointer(%5530) : (i64) -> ()
      %5543 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5543 : i64
    }
    func.call @stack_push_pointer(%5490) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958547"() {
    %5756 = func.call @cc_nil_value() : () -> i64
    %5757 = func.call @cc_nil_value() : () -> i64
    %5758 = func.call @cc_errorp(%5756) : (i64) -> i64
    %5759 = arith.cmpi ne, %5758, %5757 : i64
    %5760 = scf.if %5759 -> (i64) {
      scf.yield %5756 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %5761 = func.call @stack_pop_pointer() : () -> i64
      %5762 = func.call @cc_nil_value() : () -> i64
      %5763 = func.call @cc_errorp(%5761) : (i64) -> i64
      %5764 = arith.cmpi ne, %5763, %5762 : i64
      %5765 = arith.cmpi eq, %5762, %5762 : i64
      %5766 = arith.andi %5764, %5765 : i1
      %5767 = scf.if %5766 -> (i64) {
        scf.yield %5761 : i64
      } else {
        scf.yield %5762 : i64
      }
      %5768 = arith.cmpi ne, %5767, %5762 : i64
      scf.if %5768 {
        func.call @stack_push_pointer(%5767) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5761) : (i64) -> ()
        %5769 = llvm.mlir.addressof @str474 : !llvm.ptr
        %5770 = func.call @cc_make_function_ref_const(%5769) : (!llvm.ptr) -> i64
        %5771 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5770, %5771) : (i64, i64) -> ()
      }
      %5772 = func.call @stack_pop_pointer() : () -> i64
      %5773 = func.call @cc_nil_value() : () -> i64
      %5774 = func.call @cc_nil_value() : () -> i64
      %5775 = func.call @cc_errorp(%5773) : (i64) -> i64
      %5776 = arith.cmpi ne, %5775, %5774 : i64
      %5777 = scf.if %5776 -> (i64) {
        scf.yield %5773 : i64
      } else {
        func.call @stack_push_pointer(%5772) : (i64) -> ()
        %5778 = arith.constant 23 : i64
        func.call @stack_push_fixnum(%5778) : (i64) -> ()
        %5779 = func.call @stack_pop_pointer() : () -> i64
        %5780 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5779) : (i64) -> ()
        func.call @stack_push_pointer(%5780) : (i64) -> ()
        %5781 = llvm.mlir.addressof @str475 : !llvm.ptr
        %5782 = func.call @cc_make_function_ref_const(%5781) : (!llvm.ptr) -> i64
        %5783 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%5782, %5783) : (i64, i64) -> ()
        %5784 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5784 : i64
      }
      %5785 = func.call @cc_nil_value() : () -> i64
      %5786 = func.call @cc_errorp(%5777) : (i64) -> i64
      %5787 = arith.cmpi ne, %5786, %5785 : i64
      %5788 = scf.if %5787 -> (i64) {
        scf.yield %5777 : i64
      } else {
        func.call @stack_push_pointer(%5772) : (i64) -> ()
        %5789 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5789 : i64
      }
      func.call @stack_push_pointer(%5788) : (i64) -> ()
      %5790 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5790 : i64
    }
    func.call @stack_push_pointer(%5760) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958548"() {
    %6021 = func.call @cc_nil_value() : () -> i64
    %6022 = func.call @cc_nil_value() : () -> i64
    %6023 = func.call @cc_errorp(%6021) : (i64) -> i64
    %6024 = arith.cmpi ne, %6023, %6022 : i64
    %6025 = scf.if %6024 -> (i64) {
      scf.yield %6021 : i64
    } else {
      %6026 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %6027 = func.call @cc_nil_value() : () -> i64
      %6028 = func.call @cc_nil_value() : () -> i64
      %6029 = func.call @cc_errorp(%6027) : (i64) -> i64
      %6030 = arith.cmpi ne, %6029, %6028 : i64
      %6031 = scf.if %6030 -> (i64) {
        scf.yield %6027 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %6032 = func.call @stack_pop_pointer() : () -> i64
        %6033 = llvm.mlir.addressof @str495 : !llvm.ptr
        %6034 = arith.constant 15 : i64
        %6035 = func.call @cc_make_string(%6033, %6034) : (!llvm.ptr, i64) -> i64
        %6036 = llvm.mlir.addressof @str496 : !llvm.ptr
        %6037 = arith.constant 7 : i64
        %6038 = func.call @cc_make_string(%6036, %6037) : (!llvm.ptr, i64) -> i64
        %6039 = func.call @cc_intern(%6035, %6038) : (i64, i64) -> i64
        %6040 = func.call @cc_nil_value() : () -> i64
        %6041 = func.call @cc_cons(%6039, %6040) : (i64, i64) -> i64
        %6042 = func.call @cc_values_pack(%6041) : (i64) -> i64
        func.call @stack_push_pointer(%6039) : (i64) -> ()
        %6043 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %6044 = func.call @stack_pop_pointer() : () -> i64
        %6045 = func.call @cc_nil_value() : () -> i64
        %6046 = func.call @cc_errorp(%6032) : (i64) -> i64
        %6047 = arith.cmpi ne, %6046, %6045 : i64
        %6048 = arith.cmpi eq, %6045, %6045 : i64
        %6049 = arith.andi %6047, %6048 : i1
        %6050 = scf.if %6049 -> (i64) {
          scf.yield %6032 : i64
        } else {
          scf.yield %6045 : i64
        }
        %6051 = func.call @cc_errorp(%6043) : (i64) -> i64
        %6052 = arith.cmpi ne, %6051, %6045 : i64
        %6053 = arith.cmpi eq, %6050, %6045 : i64
        %6054 = arith.andi %6052, %6053 : i1
        %6055 = scf.if %6054 -> (i64) {
          scf.yield %6043 : i64
        } else {
          scf.yield %6050 : i64
        }
        %6056 = func.call @cc_errorp(%6044) : (i64) -> i64
        %6057 = arith.cmpi ne, %6056, %6045 : i64
        %6058 = arith.cmpi eq, %6055, %6045 : i64
        %6059 = arith.andi %6057, %6058 : i1
        %6060 = scf.if %6059 -> (i64) {
          scf.yield %6044 : i64
        } else {
          scf.yield %6055 : i64
        }
        %6061 = arith.cmpi ne, %6060, %6045 : i64
        scf.if %6061 {
          func.call @stack_push_pointer(%6060) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6032) : (i64) -> ()
          func.call @stack_push_pointer(%6043) : (i64) -> ()
          func.call @stack_push_pointer(%6044) : (i64) -> ()
          %6062 = llvm.mlir.addressof @str497 : !llvm.ptr
          %6063 = func.call @cc_make_function_ref_const(%6062) : (!llvm.ptr) -> i64
          %6064 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%6063, %6064) : (i64, i64) -> ()
        }
        %6065 = func.call @stack_pop_pointer() : () -> i64
        %6066 = func.call @cc_nil_value() : () -> i64
        %6067 = func.call @cc_errorp(%6065) : (i64) -> i64
        %6068 = arith.cmpi ne, %6067, %6066 : i64
        %6069 = arith.cmpi eq, %6066, %6066 : i64
        %6070 = arith.andi %6068, %6069 : i1
        %6071 = scf.if %6070 -> (i64) {
          scf.yield %6065 : i64
        } else {
          scf.yield %6066 : i64
        }
        %6072 = arith.cmpi ne, %6071, %6066 : i64
        scf.if %6072 {
          func.call @stack_push_pointer(%6071) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6065) : (i64) -> ()
          %6073 = llvm.mlir.addressof @str498 : !llvm.ptr
          %6074 = func.call @cc_make_function_ref_const(%6073) : (!llvm.ptr) -> i64
          %6075 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6074, %6075) : (i64, i64) -> ()
        }
        %6076 = func.call @stack_pop_pointer() : () -> i64
        %6077 = func.call @cc_errorp(%6076) : (i64) -> i64
        %6078 = func.call @cc_nil_value() : () -> i64
        %6079 = arith.cmpi ne, %6077, %6078 : i64
        scf.if %6079 {
          func.call @stack_push_pointer(%6076) : (i64) -> ()
        } else {
          %6080 = func.call @cc_multiple_value_list(%6076) : (i64) -> i64
          func.call @stack_push_pointer(%6080) : (i64) -> ()
        }
        %6081 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %6082 = func.call @stack_pop_pointer() : () -> i64
        %6083 = func.call @cc_nil_value() : () -> i64
        %6084 = func.call @cc_maybe_error_from_multiple_value_list(%6081) : (i64) -> i64
        %6085 = func.call @cc_errorp(%6084) : (i64) -> i64
        %6086 = arith.cmpi ne, %6085, %6083 : i64
        %6087 = arith.cmpi eq, %6083, %6083 : i64
        %6088 = arith.andi %6086, %6087 : i1
        %6089 = scf.if %6088 -> (i64) {
          scf.yield %6084 : i64
        } else {
          scf.yield %6083 : i64
        }
        %6090 = arith.cmpi ne, %6089, %6083 : i64
        scf.if %6090 {
          func.call @stack_push_pointer(%6089) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %6091 = func.call @stack_pop_pointer() : () -> i64
          %6092 = func.call @cc_cons(%6082, %6091) : (i64, i64) -> i64
          func.call @stack_push_pointer(%6092) : (i64) -> ()
          %6093 = func.call @stack_pop_pointer() : () -> i64
          %6094 = func.call @cc_cons(%6081, %6093) : (i64, i64) -> i64
          func.call @stack_push_pointer(%6094) : (i64) -> ()
          %6095 = func.call @stack_pop_pointer() : () -> i64
          %6096 = func.call @cc_values_pack(%6095) : (i64) -> i64
          func.call @stack_push_pointer(%6096) : (i64) -> ()
        }
        %6097 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6097 : i64
      }
      func.call @stack_push_pointer(%6031) : (i64) -> ()
      %6098 = func.call @stack_pop_pointer() : () -> i64
      %6099 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %6100 = func.call @cc_errorp(%6098) : (i64) -> i64
      %6101 = func.call @cc_nil_value() : () -> i64
      %6102 = arith.cmpi ne, %6100, %6101 : i64
      scf.if %6102 {
        %6103 = func.call @cc_condition_value(%6098) : (i64) -> i64
        %6104 = func.call @cc_values2(%6101, %6103) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6104) : (i64) -> ()
      } else {
        %6105 = func.call @cc_multiple_value_list(%6098) : (i64) -> i64
        %6106 = func.call @cc_values_pack(%6105) : (i64) -> i64
        func.call @stack_push_pointer(%6106) : (i64) -> ()
      }
      %6107 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6107 : i64
    }
    func.call @stack_push_pointer(%6025) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958549"() {
    %6591 = func.call @stack_pop_pointer() : () -> i64
    %6592 = func.call @cc_nil_value() : () -> i64
    %6593 = func.call @cc_nil_value() : () -> i64
    %6594 = func.call @cc_errorp(%6592) : (i64) -> i64
    %6595 = arith.cmpi ne, %6594, %6593 : i64
    %6596 = scf.if %6595 -> (i64) {
      scf.yield %6592 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %6597 = func.call @stack_pop_pointer() : () -> i64
      %6598 = func.call @cc_nil_value() : () -> i64
      %6599 = func.call @cc_errorp(%6597) : (i64) -> i64
      %6600 = arith.cmpi ne, %6599, %6598 : i64
      %6601 = scf.if %6600 -> (i64) {
        scf.yield %6597 : i64
      } else {
        %6602 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%6602) : (i64) -> ()
        %6603 = func.call @stack_pop_pointer() : () -> i64
        %6604 = llvm.mlir.addressof @str548 : !llvm.ptr
        %6605 = arith.constant 15 : i64
        %6606 = func.call @cc_make_string(%6604, %6605) : (!llvm.ptr, i64) -> i64
        %6607 = llvm.mlir.addressof @str549 : !llvm.ptr
        %6608 = arith.constant 7 : i64
        %6609 = func.call @cc_make_string(%6607, %6608) : (!llvm.ptr, i64) -> i64
        %6610 = func.call @cc_intern(%6606, %6609) : (i64, i64) -> i64
        %6611 = func.call @cc_nil_value() : () -> i64
        %6612 = func.call @cc_cons(%6610, %6611) : (i64, i64) -> i64
        %6613 = func.call @cc_values_pack(%6612) : (i64) -> i64
        func.call @stack_push_pointer(%6610) : (i64) -> ()
        %6614 = func.call @stack_pop_pointer() : () -> i64
        %6615 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%6615) : (i64) -> ()
        %6616 = func.call @stack_pop_pointer() : () -> i64
        %6617 = func.call @cc_nil_value() : () -> i64
        %6618 = func.call @cc_errorp(%6603) : (i64) -> i64
        %6619 = arith.cmpi ne, %6618, %6617 : i64
        %6620 = arith.cmpi eq, %6617, %6617 : i64
        %6621 = arith.andi %6619, %6620 : i1
        %6622 = scf.if %6621 -> (i64) {
          scf.yield %6603 : i64
        } else {
          scf.yield %6617 : i64
        }
        %6623 = func.call @cc_errorp(%6614) : (i64) -> i64
        %6624 = arith.cmpi ne, %6623, %6617 : i64
        %6625 = arith.cmpi eq, %6622, %6617 : i64
        %6626 = arith.andi %6624, %6625 : i1
        %6627 = scf.if %6626 -> (i64) {
          scf.yield %6614 : i64
        } else {
          scf.yield %6622 : i64
        }
        %6628 = func.call @cc_errorp(%6616) : (i64) -> i64
        %6629 = arith.cmpi ne, %6628, %6617 : i64
        %6630 = arith.cmpi eq, %6627, %6617 : i64
        %6631 = arith.andi %6629, %6630 : i1
        %6632 = scf.if %6631 -> (i64) {
          scf.yield %6616 : i64
        } else {
          scf.yield %6627 : i64
        }
        %6633 = arith.cmpi ne, %6632, %6617 : i64
        scf.if %6633 {
          func.call @stack_push_pointer(%6632) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6603) : (i64) -> ()
          func.call @stack_push_pointer(%6614) : (i64) -> ()
          func.call @stack_push_pointer(%6616) : (i64) -> ()
          %6634 = llvm.mlir.addressof @str550 : !llvm.ptr
          %6635 = func.call @cc_make_function_ref_const(%6634) : (!llvm.ptr) -> i64
          %6636 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%6635, %6636) : (i64, i64) -> ()
        }
        %6637 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%6637) : (i64) -> ()
        %6638 = func.call @stack_pop_pointer() : () -> i64
        %6639 = func.call @stack_pop_pointer() : () -> i64
        %6640 = func.call @cc_aref(%6639, %6638) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6640) : (i64) -> ()
        %6641 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6641 : i64
      }
      %6642 = func.call @cc_nil_value() : () -> i64
      %6643 = func.call @cc_errorp(%6601) : (i64) -> i64
      %6644 = arith.cmpi ne, %6643, %6642 : i64
      %6645 = scf.if %6644 -> (i64) {
        scf.yield %6601 : i64
      } else {
        %6646 = llvm.mlir.addressof @str551 : !llvm.ptr
        %6647 = arith.constant 4 : i64
        %6648 = func.call @cc_make_string(%6646, %6647) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%6648) : (i64) -> ()
        %6649 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6649 : i64
      }
      func.call @stack_push_pointer(%6645) : (i64) -> ()
      %6650 = func.call @stack_pop_pointer() : () -> i64
      %6651 = func.call @cc_errorp(%6650) : (i64) -> i64
      %6652 = func.call @cc_nil_value() : () -> i64
      %6653 = arith.cmpi ne, %6651, %6652 : i64
      %6654 = scf.if %6653 -> (i64) {
        %6655 = func.call @cc_condition_value(%6650) : (i64) -> i64
        %6656 = llvm.mlir.addressof @str552 : !llvm.ptr
        %6657 = arith.constant 5 : i64
        %6658 = func.call @cc_make_string(%6656, %6657) : (!llvm.ptr, i64) -> i64
        %6659 = llvm.mlir.addressof @str553 : !llvm.ptr
        %6660 = arith.constant 11 : i64
        %6661 = func.call @cc_make_string(%6659, %6660) : (!llvm.ptr, i64) -> i64
        %6662 = func.call @cc_intern(%6658, %6661) : (i64, i64) -> i64
        %6663 = func.call @cc_nil_value() : () -> i64
        %6664 = func.call @cc_cons(%6662, %6663) : (i64, i64) -> i64
        %6665 = func.call @cc_values_pack(%6664) : (i64) -> i64
        func.call @stack_push_pointer(%6662) : (i64) -> ()
        %6666 = func.call @stack_pop_pointer() : () -> i64
        %6667 = func.call @cc_typep(%6655, %6666) : (i64, i64) -> i64
        %6668 = func.call @cc_nil_value() : () -> i64
        %6669 = arith.cmpi ne, %6667, %6668 : i64
        %6670 = scf.if %6669 -> (i64) {
          func.call @stack_push_pointer(%6655) : (i64) -> ()
          %6671 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%6671) : (i64) -> ()
          %6672 = llvm.mlir.addressof @str554 : !llvm.ptr
          %6673 = func.call @cc_make_function_ref_const(%6672) : (!llvm.ptr) -> i64
          %6674 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6673, %6674) : (i64, i64) -> ()
          %6675 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %6675 : i64
        } else {
          scf.yield %6650 : i64
        }
        scf.yield %6670 : i64
      } else {
        scf.yield %6650 : i64
      }
      func.call @stack_push_pointer(%6654) : (i64) -> ()
      %6676 = func.call @stack_pop_pointer() : () -> i64
      %6677 = func.call @cc_nil_value() : () -> i64
      %6678 = func.call @cc_nil_value() : () -> i64
      %6679 = func.call @cc_errorp(%6677) : (i64) -> i64
      %6680 = arith.cmpi ne, %6679, %6678 : i64
      %6681 = scf.if %6680 -> (i64) {
        scf.yield %6677 : i64
      } else {
        %6682 = func.call @cc_nil_value() : () -> i64
        %6683 = llvm.mlir.addressof @str555 : !llvm.ptr
        %6684 = arith.constant 12 : i64
        %6685 = func.call @cc_make_string(%6683, %6684) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%6685) : (i64) -> ()
        %6686 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%6676) : (i64) -> ()
        %6687 = func.call @stack_pop_pointer() : () -> i64
        %6688 = func.call @cc_nil_value() : () -> i64
        %6689 = func.call @cc_errorp(%6686) : (i64) -> i64
        %6690 = arith.cmpi ne, %6689, %6688 : i64
        %6691 = arith.cmpi eq, %6688, %6688 : i64
        %6692 = arith.andi %6690, %6691 : i1
        %6693 = scf.if %6692 -> (i64) {
          scf.yield %6686 : i64
        } else {
          scf.yield %6688 : i64
        }
        %6694 = func.call @cc_errorp(%6687) : (i64) -> i64
        %6695 = arith.cmpi ne, %6694, %6688 : i64
        %6696 = arith.cmpi eq, %6693, %6688 : i64
        %6697 = arith.andi %6695, %6696 : i1
        %6698 = scf.if %6697 -> (i64) {
          scf.yield %6687 : i64
        } else {
          scf.yield %6693 : i64
        }
        %6699 = arith.cmpi ne, %6698, %6688 : i64
        scf.if %6699 {
          func.call @stack_push_pointer(%6698) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6686) : (i64) -> ()
          func.call @stack_push_pointer(%6687) : (i64) -> ()
          %6700 = llvm.mlir.addressof @str556 : !llvm.ptr
          %6701 = func.call @cc_make_function_ref_const(%6700) : (!llvm.ptr) -> i64
          %6702 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%6701, %6702) : (i64, i64) -> ()
        }
        %6703 = func.call @stack_pop_pointer() : () -> i64
        %6704 = llvm.mlir.addressof @str557 : !llvm.ptr
        %6705 = arith.constant 15 : i64
        %6706 = func.call @cc_make_string(%6704, %6705) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%6706) : (i64) -> ()
        %6707 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%6676) : (i64) -> ()
        %6708 = func.call @stack_pop_pointer() : () -> i64
        %6709 = func.call @cc_nil_value() : () -> i64
        %6710 = func.call @cc_errorp(%6707) : (i64) -> i64
        %6711 = arith.cmpi ne, %6710, %6709 : i64
        %6712 = arith.cmpi eq, %6709, %6709 : i64
        %6713 = arith.andi %6711, %6712 : i1
        %6714 = scf.if %6713 -> (i64) {
          scf.yield %6707 : i64
        } else {
          scf.yield %6709 : i64
        }
        %6715 = func.call @cc_errorp(%6708) : (i64) -> i64
        %6716 = arith.cmpi ne, %6715, %6709 : i64
        %6717 = arith.cmpi eq, %6714, %6709 : i64
        %6718 = arith.andi %6716, %6717 : i1
        %6719 = scf.if %6718 -> (i64) {
          scf.yield %6708 : i64
        } else {
          scf.yield %6714 : i64
        }
        %6720 = arith.cmpi ne, %6719, %6709 : i64
        scf.if %6720 {
          func.call @stack_push_pointer(%6719) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6707) : (i64) -> ()
          func.call @stack_push_pointer(%6708) : (i64) -> ()
          %6721 = llvm.mlir.addressof @str558 : !llvm.ptr
          %6722 = func.call @cc_make_function_ref_const(%6721) : (!llvm.ptr) -> i64
          %6723 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%6722, %6723) : (i64, i64) -> ()
        }
        %6724 = func.call @stack_pop_pointer() : () -> i64
        %6725 = func.call @cc_cons(%6724, %6682) : (i64, i64) -> i64
        %6726 = func.call @cc_cons(%6703, %6725) : (i64, i64) -> i64
        %6727 = func.call @cc_or(%6726) : (i64) -> i64
        func.call @stack_push_pointer(%6727) : (i64) -> ()
        %6728 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6728 : i64
      }
      func.call @stack_push_pointer(%6681) : (i64) -> ()
      %6729 = func.call @stack_pop_pointer() : () -> i64
      %6730 = func.call @cc_nil_value() : () -> i64
      %6731 = func.call @cc_cons(%6729, %6730) : (i64, i64) -> i64
      %6732 = func.call @cc_not(%6731) : (i64) -> i64
      func.call @stack_push_pointer(%6732) : (i64) -> ()
      %6733 = func.call @stack_pop_pointer() : () -> i64
      %6734 = func.call @cc_nil_value() : () -> i64
      %6735 = func.call @cc_cons(%6733, %6734) : (i64, i64) -> i64
      %6736 = func.call @cc_not(%6735) : (i64) -> i64
      func.call @stack_push_pointer(%6736) : (i64) -> ()
      %6737 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6737 : i64
    }
    func.call @stack_push_pointer(%6596) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958551"() {
    %7139 = func.call @cc_nil_value() : () -> i64
    %7140 = func.call @cc_nil_value() : () -> i64
    %7141 = func.call @cc_errorp(%7139) : (i64) -> i64
    %7142 = arith.cmpi ne, %7141, %7140 : i64
    %7143 = scf.if %7142 -> (i64) {
      scf.yield %7139 : i64
    } else {
      %7144 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%7144) : (i64) -> ()
      %7145 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%7145) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7146 = func.call @stack_pop_pointer() : () -> i64
      %7147 = func.call @stack_pop_pointer() : () -> i64
      %7148 = func.call @cc_cons(%7147, %7146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7148) : (i64) -> ()
      %7149 = func.call @stack_pop_pointer() : () -> i64
      %7150 = func.call @stack_pop_pointer() : () -> i64
      %7151 = func.call @cc_cons(%7150, %7149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7151) : (i64) -> ()
      %7152 = func.call @stack_pop_pointer() : () -> i64
      %7153 = llvm.mlir.addressof @str595 : !llvm.ptr
      %7154 = arith.constant 12 : i64
      %7155 = func.call @cc_make_string(%7153, %7154) : (!llvm.ptr, i64) -> i64
      %7156 = llvm.mlir.addressof @str596 : !llvm.ptr
      %7157 = arith.constant 7 : i64
      %7158 = func.call @cc_make_string(%7156, %7157) : (!llvm.ptr, i64) -> i64
      %7159 = func.call @cc_intern(%7155, %7158) : (i64, i64) -> i64
      %7160 = func.call @cc_nil_value() : () -> i64
      %7161 = func.call @cc_cons(%7159, %7160) : (i64, i64) -> i64
      %7162 = func.call @cc_values_pack(%7161) : (i64) -> i64
      func.call @stack_push_pointer(%7159) : (i64) -> ()
      %7163 = func.call @stack_pop_pointer() : () -> i64
      %7164 = llvm.mlir.addressof @str597 : !llvm.ptr
      %7165 = arith.constant 9 : i64
      %7166 = func.call @cc_make_string(%7164, %7165) : (!llvm.ptr, i64) -> i64
      %7167 = llvm.mlir.addressof @str598 : !llvm.ptr
      %7168 = arith.constant 11 : i64
      %7169 = func.call @cc_make_string(%7167, %7168) : (!llvm.ptr, i64) -> i64
      %7170 = func.call @cc_intern(%7166, %7169) : (i64, i64) -> i64
      %7171 = func.call @cc_nil_value() : () -> i64
      %7172 = func.call @cc_cons(%7170, %7171) : (i64, i64) -> i64
      %7173 = func.call @cc_values_pack(%7172) : (i64) -> i64
      func.call @stack_push_pointer(%7170) : (i64) -> ()
      %7174 = func.call @stack_pop_pointer() : () -> i64
      %7175 = llvm.mlir.addressof @str599 : !llvm.ptr
      %7176 = arith.constant 16 : i64
      %7177 = func.call @cc_make_string(%7175, %7176) : (!llvm.ptr, i64) -> i64
      %7178 = llvm.mlir.addressof @str600 : !llvm.ptr
      %7179 = arith.constant 7 : i64
      %7180 = func.call @cc_make_string(%7178, %7179) : (!llvm.ptr, i64) -> i64
      %7181 = func.call @cc_intern(%7177, %7180) : (i64, i64) -> i64
      %7182 = func.call @cc_nil_value() : () -> i64
      %7183 = func.call @cc_cons(%7181, %7182) : (i64, i64) -> i64
      %7184 = func.call @cc_values_pack(%7183) : (i64) -> i64
      func.call @stack_push_pointer(%7181) : (i64) -> ()
      %7185 = func.call @stack_pop_pointer() : () -> i64
      %7186 = arith.constant 97 : i64
      %7187 = func.call @cc_box_character(%7186) : (i64) -> i64
      func.call @stack_push_pointer(%7187) : (i64) -> ()
      %7188 = arith.constant 98 : i64
      %7189 = func.call @cc_box_character(%7188) : (i64) -> i64
      func.call @stack_push_pointer(%7189) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7190 = func.call @stack_pop_pointer() : () -> i64
      %7191 = func.call @stack_pop_pointer() : () -> i64
      %7192 = func.call @cc_cons(%7191, %7190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7192) : (i64) -> ()
      %7193 = func.call @stack_pop_pointer() : () -> i64
      %7194 = func.call @stack_pop_pointer() : () -> i64
      %7195 = func.call @cc_cons(%7194, %7193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7195) : (i64) -> ()
      %7196 = arith.constant 99 : i64
      %7197 = func.call @cc_box_character(%7196) : (i64) -> i64
      func.call @stack_push_pointer(%7197) : (i64) -> ()
      %7198 = arith.constant 100 : i64
      %7199 = func.call @cc_box_character(%7198) : (i64) -> i64
      func.call @stack_push_pointer(%7199) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7200 = func.call @stack_pop_pointer() : () -> i64
      %7201 = func.call @stack_pop_pointer() : () -> i64
      %7202 = func.call @cc_cons(%7201, %7200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7202) : (i64) -> ()
      %7203 = func.call @stack_pop_pointer() : () -> i64
      %7204 = func.call @stack_pop_pointer() : () -> i64
      %7205 = func.call @cc_cons(%7204, %7203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7205) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7206 = func.call @stack_pop_pointer() : () -> i64
      %7207 = func.call @stack_pop_pointer() : () -> i64
      %7208 = func.call @cc_cons(%7207, %7206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7208) : (i64) -> ()
      %7209 = func.call @stack_pop_pointer() : () -> i64
      %7210 = func.call @stack_pop_pointer() : () -> i64
      %7211 = func.call @cc_cons(%7210, %7209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7211) : (i64) -> ()
      %7212 = func.call @stack_pop_pointer() : () -> i64
      %7213 = func.call @cc_nil_value() : () -> i64
      %7214 = func.call @cc_errorp(%7152) : (i64) -> i64
      %7215 = arith.cmpi ne, %7214, %7213 : i64
      %7216 = arith.cmpi eq, %7213, %7213 : i64
      %7217 = arith.andi %7215, %7216 : i1
      %7218 = scf.if %7217 -> (i64) {
        scf.yield %7152 : i64
      } else {
        scf.yield %7213 : i64
      }
      %7219 = func.call @cc_errorp(%7163) : (i64) -> i64
      %7220 = arith.cmpi ne, %7219, %7213 : i64
      %7221 = arith.cmpi eq, %7218, %7213 : i64
      %7222 = arith.andi %7220, %7221 : i1
      %7223 = scf.if %7222 -> (i64) {
        scf.yield %7163 : i64
      } else {
        scf.yield %7218 : i64
      }
      %7224 = func.call @cc_errorp(%7174) : (i64) -> i64
      %7225 = arith.cmpi ne, %7224, %7213 : i64
      %7226 = arith.cmpi eq, %7223, %7213 : i64
      %7227 = arith.andi %7225, %7226 : i1
      %7228 = scf.if %7227 -> (i64) {
        scf.yield %7174 : i64
      } else {
        scf.yield %7223 : i64
      }
      %7229 = func.call @cc_errorp(%7185) : (i64) -> i64
      %7230 = arith.cmpi ne, %7229, %7213 : i64
      %7231 = arith.cmpi eq, %7228, %7213 : i64
      %7232 = arith.andi %7230, %7231 : i1
      %7233 = scf.if %7232 -> (i64) {
        scf.yield %7185 : i64
      } else {
        scf.yield %7228 : i64
      }
      %7234 = func.call @cc_errorp(%7212) : (i64) -> i64
      %7235 = arith.cmpi ne, %7234, %7213 : i64
      %7236 = arith.cmpi eq, %7233, %7213 : i64
      %7237 = arith.andi %7235, %7236 : i1
      %7238 = scf.if %7237 -> (i64) {
        scf.yield %7212 : i64
      } else {
        scf.yield %7233 : i64
      }
      %7239 = arith.cmpi ne, %7238, %7213 : i64
      scf.if %7239 {
        func.call @stack_push_pointer(%7238) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7152) : (i64) -> ()
        func.call @stack_push_pointer(%7163) : (i64) -> ()
        func.call @stack_push_pointer(%7174) : (i64) -> ()
        func.call @stack_push_pointer(%7185) : (i64) -> ()
        func.call @stack_push_pointer(%7212) : (i64) -> ()
        %7240 = llvm.mlir.addressof @str601 : !llvm.ptr
        %7241 = func.call @cc_make_function_ref_const(%7240) : (!llvm.ptr) -> i64
        %7242 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%7241, %7242) : (i64, i64) -> ()
      }
      %7243 = func.call @stack_pop_pointer() : () -> i64
      %7244 = func.call @cc_nil_value() : () -> i64
      %7245 = func.call @cc_nil_value() : () -> i64
      %7246 = func.call @cc_errorp(%7244) : (i64) -> i64
      %7247 = arith.cmpi ne, %7246, %7245 : i64
      %7248 = scf.if %7247 -> (i64) {
        scf.yield %7244 : i64
      } else {
        %7249 = arith.constant 4 : i64
        func.call @stack_push_fixnum(%7249) : (i64) -> ()
        %7250 = func.call @stack_pop_pointer() : () -> i64
        %7251 = llvm.mlir.addressof @str602 : !llvm.ptr
        %7252 = arith.constant 12 : i64
        %7253 = func.call @cc_make_string(%7251, %7252) : (!llvm.ptr, i64) -> i64
        %7254 = llvm.mlir.addressof @str603 : !llvm.ptr
        %7255 = arith.constant 7 : i64
        %7256 = func.call @cc_make_string(%7254, %7255) : (!llvm.ptr, i64) -> i64
        %7257 = func.call @cc_intern(%7253, %7256) : (i64, i64) -> i64
        %7258 = func.call @cc_nil_value() : () -> i64
        %7259 = func.call @cc_cons(%7257, %7258) : (i64, i64) -> i64
        %7260 = func.call @cc_values_pack(%7259) : (i64) -> i64
        func.call @stack_push_pointer(%7257) : (i64) -> ()
        %7261 = func.call @stack_pop_pointer() : () -> i64
        %7262 = llvm.mlir.addressof @str604 : !llvm.ptr
        %7263 = arith.constant 9 : i64
        %7264 = func.call @cc_make_string(%7262, %7263) : (!llvm.ptr, i64) -> i64
        %7265 = llvm.mlir.addressof @str605 : !llvm.ptr
        %7266 = arith.constant 11 : i64
        %7267 = func.call @cc_make_string(%7265, %7266) : (!llvm.ptr, i64) -> i64
        %7268 = func.call @cc_intern(%7264, %7267) : (i64, i64) -> i64
        %7269 = func.call @cc_nil_value() : () -> i64
        %7270 = func.call @cc_cons(%7268, %7269) : (i64, i64) -> i64
        %7271 = func.call @cc_values_pack(%7270) : (i64) -> i64
        func.call @stack_push_pointer(%7268) : (i64) -> ()
        %7272 = func.call @stack_pop_pointer() : () -> i64
        %7273 = llvm.mlir.addressof @str606 : !llvm.ptr
        %7274 = arith.constant 12 : i64
        %7275 = func.call @cc_make_string(%7273, %7274) : (!llvm.ptr, i64) -> i64
        %7276 = llvm.mlir.addressof @str607 : !llvm.ptr
        %7277 = arith.constant 7 : i64
        %7278 = func.call @cc_make_string(%7276, %7277) : (!llvm.ptr, i64) -> i64
        %7279 = func.call @cc_intern(%7275, %7278) : (i64, i64) -> i64
        %7280 = func.call @cc_nil_value() : () -> i64
        %7281 = func.call @cc_cons(%7279, %7280) : (i64, i64) -> i64
        %7282 = func.call @cc_values_pack(%7281) : (i64) -> i64
        func.call @stack_push_pointer(%7279) : (i64) -> ()
        %7283 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%7243) : (i64) -> ()
        %7284 = func.call @stack_pop_pointer() : () -> i64
        %7285 = func.call @cc_nil_value() : () -> i64
        %7286 = func.call @cc_errorp(%7250) : (i64) -> i64
        %7287 = arith.cmpi ne, %7286, %7285 : i64
        %7288 = arith.cmpi eq, %7285, %7285 : i64
        %7289 = arith.andi %7287, %7288 : i1
        %7290 = scf.if %7289 -> (i64) {
          scf.yield %7250 : i64
        } else {
          scf.yield %7285 : i64
        }
        %7291 = func.call @cc_errorp(%7261) : (i64) -> i64
        %7292 = arith.cmpi ne, %7291, %7285 : i64
        %7293 = arith.cmpi eq, %7290, %7285 : i64
        %7294 = arith.andi %7292, %7293 : i1
        %7295 = scf.if %7294 -> (i64) {
          scf.yield %7261 : i64
        } else {
          scf.yield %7290 : i64
        }
        %7296 = func.call @cc_errorp(%7272) : (i64) -> i64
        %7297 = arith.cmpi ne, %7296, %7285 : i64
        %7298 = arith.cmpi eq, %7295, %7285 : i64
        %7299 = arith.andi %7297, %7298 : i1
        %7300 = scf.if %7299 -> (i64) {
          scf.yield %7272 : i64
        } else {
          scf.yield %7295 : i64
        }
        %7301 = func.call @cc_errorp(%7283) : (i64) -> i64
        %7302 = arith.cmpi ne, %7301, %7285 : i64
        %7303 = arith.cmpi eq, %7300, %7285 : i64
        %7304 = arith.andi %7302, %7303 : i1
        %7305 = scf.if %7304 -> (i64) {
          scf.yield %7283 : i64
        } else {
          scf.yield %7300 : i64
        }
        %7306 = func.call @cc_errorp(%7284) : (i64) -> i64
        %7307 = arith.cmpi ne, %7306, %7285 : i64
        %7308 = arith.cmpi eq, %7305, %7285 : i64
        %7309 = arith.andi %7307, %7308 : i1
        %7310 = scf.if %7309 -> (i64) {
          scf.yield %7284 : i64
        } else {
          scf.yield %7305 : i64
        }
        %7311 = arith.cmpi ne, %7310, %7285 : i64
        scf.if %7311 {
          func.call @stack_push_pointer(%7310) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7250) : (i64) -> ()
          func.call @stack_push_pointer(%7261) : (i64) -> ()
          func.call @stack_push_pointer(%7272) : (i64) -> ()
          func.call @stack_push_pointer(%7283) : (i64) -> ()
          func.call @stack_push_pointer(%7284) : (i64) -> ()
          %7312 = llvm.mlir.addressof @str608 : !llvm.ptr
          %7313 = func.call @cc_make_function_ref_const(%7312) : (!llvm.ptr) -> i64
          %7314 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%7313, %7314) : (i64, i64) -> ()
        }
        %7315 = func.call @stack_pop_pointer() : () -> i64
        %7316 = func.call @cc_nil_value() : () -> i64
        %7317 = func.call @cc_errorp(%7315) : (i64) -> i64
        %7318 = arith.cmpi ne, %7317, %7316 : i64
        %7319 = arith.cmpi eq, %7316, %7316 : i64
        %7320 = arith.andi %7318, %7319 : i1
        %7321 = scf.if %7320 -> (i64) {
          scf.yield %7315 : i64
        } else {
          scf.yield %7316 : i64
        }
        %7322 = arith.cmpi ne, %7321, %7316 : i64
        scf.if %7322 {
          func.call @stack_push_pointer(%7321) : (i64) -> ()
        } else {
          %7323 = func.call @cc_nil_value() : () -> i64
          %7324 = func.call @cc_cons(%7315, %7323) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7324) : (i64) -> ()
          func.call @cc_print_stack() : () -> ()
        }
        %7325 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7325 : i64
      }
      func.call @stack_push_pointer(%7248) : (i64) -> ()
      %7326 = func.call @stack_pop_pointer() : () -> i64
      %7327 = func.call @cc_nil_value() : () -> i64
      %7328 = func.call @cc_cons(%7326, %7327) : (i64, i64) -> i64
      %7329 = func.call @cc_not(%7328) : (i64) -> i64
      func.call @stack_push_pointer(%7329) : (i64) -> ()
      %7330 = func.call @stack_pop_pointer() : () -> i64
      %7331 = func.call @cc_nil_value() : () -> i64
      %7332 = func.call @cc_cons(%7330, %7331) : (i64, i64) -> i64
      %7333 = func.call @cc_not(%7332) : (i64) -> i64
      func.call @stack_push_pointer(%7333) : (i64) -> ()
      %7334 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7334 : i64
    }
    func.call @stack_push_pointer(%7143) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958552"() {
    %7532 = func.call @cc_nil_value() : () -> i64
    %7533 = func.call @cc_nil_value() : () -> i64
    %7534 = func.call @cc_errorp(%7532) : (i64) -> i64
    %7535 = arith.cmpi ne, %7534, %7533 : i64
    %7536 = scf.if %7535 -> (i64) {
      scf.yield %7532 : i64
    } else {
      %7537 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %7538 = func.call @cc_nil_value() : () -> i64
      %7539 = func.call @cc_nil_value() : () -> i64
      %7540 = func.call @cc_errorp(%7538) : (i64) -> i64
      %7541 = arith.cmpi ne, %7540, %7539 : i64
      %7542 = scf.if %7541 -> (i64) {
        scf.yield %7538 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %7543 = arith.constant 16777216 : i64
        %7544 = func.call @cc_box_fixnum(%7543) : (i64) -> i64
        func.call @stack_push_pointer(%7544) : (i64) -> ()
        %7545 = func.call @stack_pop_pointer() : () -> i64
        %7546 = arith.constant 1 : i64
        %7547 = func.call @cc_box_fixnum(%7546) : (i64) -> i64
        %7549 = arith.constant 3 : i64
        %7548 = arith.andi %7545, %7549 : i64
        %7550 = arith.constant 0 : i64
        %7551 = arith.cmpi eq, %7548, %7550 : i64
        %7553 = arith.constant 3 : i64
        %7552 = arith.andi %7547, %7553 : i64
        %7554 = arith.constant 0 : i64
        %7555 = arith.cmpi eq, %7552, %7554 : i64
        %7556 = arith.andi %7551, %7555 : i1
        %7557 = scf.if %7556 -> (i64) {
          %7558 = arith.constant 2 : i64
          %7559 = arith.shrsi %7545, %7558 : i64
          %7560 = arith.constant 2 : i64
          %7561 = arith.shrsi %7547, %7560 : i64
          %7562 = arith.addi %7559, %7561 : i64
          %7563 = arith.constant -2305843009213693952 : i64
          %7564 = arith.constant 2305843009213693951 : i64
          %7565 = arith.cmpi sge, %7562, %7563 : i64
          %7566 = arith.cmpi sle, %7562, %7564 : i64
          %7567 = arith.andi %7565, %7566 : i1
          %7568 = scf.if %7567 -> (i64) {
            %7569 = arith.constant 2 : i64
            %7570 = arith.shli %7562, %7569 : i64
            scf.yield %7570 : i64
          } else {
            %7571 = func.call @cc_add(%7545, %7547) : (i64, i64) -> i64
            scf.yield %7571 : i64
          }
          scf.yield %7568 : i64
        } else {
          %7572 = func.call @cc_add(%7545, %7547) : (i64, i64) -> i64
          scf.yield %7572 : i64
        }
        func.call @stack_push_pointer(%7557) : (i64) -> ()
        %7573 = func.call @stack_pop_pointer() : () -> i64
        %7574 = func.call @cc_nil_value() : () -> i64
        %7575 = func.call @cc_errorp(%7573) : (i64) -> i64
        %7576 = arith.cmpi ne, %7575, %7574 : i64
        %7577 = arith.cmpi eq, %7574, %7574 : i64
        %7578 = arith.andi %7576, %7577 : i1
        %7579 = scf.if %7578 -> (i64) {
          scf.yield %7573 : i64
        } else {
          scf.yield %7574 : i64
        }
        %7580 = arith.cmpi ne, %7579, %7574 : i64
        scf.if %7580 {
          func.call @stack_push_pointer(%7579) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7573) : (i64) -> ()
          %7581 = llvm.mlir.addressof @str627 : !llvm.ptr
          %7582 = func.call @cc_make_function_ref_const(%7581) : (!llvm.ptr) -> i64
          %7583 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%7582, %7583) : (i64, i64) -> ()
        }
        %7584 = func.call @stack_pop_pointer() : () -> i64
        %7585 = func.call @cc_errorp(%7584) : (i64) -> i64
        %7586 = func.call @cc_nil_value() : () -> i64
        %7587 = arith.cmpi ne, %7585, %7586 : i64
        scf.if %7587 {
          func.call @stack_push_pointer(%7584) : (i64) -> ()
        } else {
          %7588 = func.call @cc_multiple_value_list(%7584) : (i64) -> i64
          func.call @stack_push_pointer(%7588) : (i64) -> ()
        }
        %7589 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %7590 = func.call @stack_pop_pointer() : () -> i64
        %7591 = func.call @cc_nil_value() : () -> i64
        %7592 = func.call @cc_maybe_error_from_multiple_value_list(%7589) : (i64) -> i64
        %7593 = func.call @cc_errorp(%7592) : (i64) -> i64
        %7594 = arith.cmpi ne, %7593, %7591 : i64
        %7595 = arith.cmpi eq, %7591, %7591 : i64
        %7596 = arith.andi %7594, %7595 : i1
        %7597 = scf.if %7596 -> (i64) {
          scf.yield %7592 : i64
        } else {
          scf.yield %7591 : i64
        }
        %7598 = arith.cmpi ne, %7597, %7591 : i64
        scf.if %7598 {
          func.call @stack_push_pointer(%7597) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %7599 = func.call @stack_pop_pointer() : () -> i64
          %7600 = func.call @cc_cons(%7590, %7599) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7600) : (i64) -> ()
          %7601 = func.call @stack_pop_pointer() : () -> i64
          %7602 = func.call @cc_cons(%7589, %7601) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7602) : (i64) -> ()
          %7603 = func.call @stack_pop_pointer() : () -> i64
          %7604 = func.call @cc_values_pack(%7603) : (i64) -> i64
          func.call @stack_push_pointer(%7604) : (i64) -> ()
        }
        %7605 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7605 : i64
      }
      func.call @stack_push_pointer(%7542) : (i64) -> ()
      %7606 = func.call @stack_pop_pointer() : () -> i64
      %7607 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %7608 = func.call @cc_errorp(%7606) : (i64) -> i64
      %7609 = func.call @cc_nil_value() : () -> i64
      %7610 = arith.cmpi ne, %7608, %7609 : i64
      scf.if %7610 {
        %7611 = func.call @cc_condition_value(%7606) : (i64) -> i64
        %7612 = func.call @cc_values2(%7609, %7611) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7612) : (i64) -> ()
      } else {
        %7613 = func.call @cc_multiple_value_list(%7606) : (i64) -> i64
        %7614 = func.call @cc_values_pack(%7613) : (i64) -> i64
        func.call @stack_push_pointer(%7614) : (i64) -> ()
      }
      %7615 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7615 : i64
    }
    func.call @stack_push_pointer(%7536) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958553"() {
    %7842 = func.call @cc_nil_value() : () -> i64
    %7843 = func.call @cc_nil_value() : () -> i64
    %7844 = func.call @cc_errorp(%7842) : (i64) -> i64
    %7845 = arith.cmpi ne, %7844, %7843 : i64
    %7846 = scf.if %7845 -> (i64) {
      scf.yield %7842 : i64
    } else {
      %7847 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %7848 = func.call @cc_nil_value() : () -> i64
      %7849 = func.call @cc_nil_value() : () -> i64
      %7850 = func.call @cc_errorp(%7848) : (i64) -> i64
      %7851 = arith.cmpi ne, %7850, %7849 : i64
      %7852 = scf.if %7851 -> (i64) {
        scf.yield %7848 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %7853 = arith.constant 16777216 : i64
        %7854 = func.call @cc_box_fixnum(%7853) : (i64) -> i64
        func.call @stack_push_pointer(%7854) : (i64) -> ()
        %7855 = func.call @stack_pop_pointer() : () -> i64
        %7856 = arith.constant 1 : i64
        %7857 = func.call @cc_box_fixnum(%7856) : (i64) -> i64
        %7859 = arith.constant 3 : i64
        %7858 = arith.andi %7855, %7859 : i64
        %7860 = arith.constant 0 : i64
        %7861 = arith.cmpi eq, %7858, %7860 : i64
        %7863 = arith.constant 3 : i64
        %7862 = arith.andi %7857, %7863 : i64
        %7864 = arith.constant 0 : i64
        %7865 = arith.cmpi eq, %7862, %7864 : i64
        %7866 = arith.andi %7861, %7865 : i1
        %7867 = scf.if %7866 -> (i64) {
          %7868 = arith.constant 2 : i64
          %7869 = arith.shrsi %7855, %7868 : i64
          %7870 = arith.constant 2 : i64
          %7871 = arith.shrsi %7857, %7870 : i64
          %7872 = arith.addi %7869, %7871 : i64
          %7873 = arith.constant -2305843009213693952 : i64
          %7874 = arith.constant 2305843009213693951 : i64
          %7875 = arith.cmpi sge, %7872, %7873 : i64
          %7876 = arith.cmpi sle, %7872, %7874 : i64
          %7877 = arith.andi %7875, %7876 : i1
          %7878 = scf.if %7877 -> (i64) {
            %7879 = arith.constant 2 : i64
            %7880 = arith.shli %7872, %7879 : i64
            scf.yield %7880 : i64
          } else {
            %7881 = func.call @cc_add(%7855, %7857) : (i64, i64) -> i64
            scf.yield %7881 : i64
          }
          scf.yield %7878 : i64
        } else {
          %7882 = func.call @cc_add(%7855, %7857) : (i64, i64) -> i64
          scf.yield %7882 : i64
        }
        func.call @stack_push_pointer(%7867) : (i64) -> ()
        %7883 = func.call @stack_pop_pointer() : () -> i64
        %7884 = func.call @cc_nil_value() : () -> i64
        %7885 = func.call @cc_errorp(%7883) : (i64) -> i64
        %7886 = arith.cmpi ne, %7885, %7884 : i64
        %7887 = arith.cmpi eq, %7884, %7884 : i64
        %7888 = arith.andi %7886, %7887 : i1
        %7889 = scf.if %7888 -> (i64) {
          scf.yield %7883 : i64
        } else {
          scf.yield %7884 : i64
        }
        %7890 = arith.cmpi ne, %7889, %7884 : i64
        scf.if %7890 {
          func.call @stack_push_pointer(%7889) : (i64) -> ()
        } else {
          %7891 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%7891) : (i64) -> ()
          func.call @stack_push_pointer(%7883) : (i64) -> ()
          %7892 = func.call @stack_pop_pointer() : () -> i64
          %7893 = func.call @stack_pop_pointer() : () -> i64
          %7894 = func.call @cc_cons(%7892, %7893) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7894) : (i64) -> ()
        }
        %7895 = func.call @stack_pop_pointer() : () -> i64
        %7896 = func.call @cc_nil_value() : () -> i64
        %7897 = func.call @cc_errorp(%7895) : (i64) -> i64
        %7898 = arith.cmpi ne, %7897, %7896 : i64
        %7899 = arith.cmpi eq, %7896, %7896 : i64
        %7900 = arith.andi %7898, %7899 : i1
        %7901 = scf.if %7900 -> (i64) {
          scf.yield %7895 : i64
        } else {
          scf.yield %7896 : i64
        }
        %7902 = arith.cmpi ne, %7901, %7896 : i64
        scf.if %7902 {
          func.call @stack_push_pointer(%7901) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7895) : (i64) -> ()
          %7903 = llvm.mlir.addressof @str650 : !llvm.ptr
          %7904 = func.call @cc_make_function_ref_const(%7903) : (!llvm.ptr) -> i64
          %7905 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%7904, %7905) : (i64, i64) -> ()
        }
        %7906 = func.call @stack_pop_pointer() : () -> i64
        %7907 = func.call @cc_errorp(%7906) : (i64) -> i64
        %7908 = func.call @cc_nil_value() : () -> i64
        %7909 = arith.cmpi ne, %7907, %7908 : i64
        scf.if %7909 {
          func.call @stack_push_pointer(%7906) : (i64) -> ()
        } else {
          %7910 = func.call @cc_multiple_value_list(%7906) : (i64) -> i64
          func.call @stack_push_pointer(%7910) : (i64) -> ()
        }
        %7911 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %7912 = func.call @stack_pop_pointer() : () -> i64
        %7913 = func.call @cc_nil_value() : () -> i64
        %7914 = func.call @cc_maybe_error_from_multiple_value_list(%7911) : (i64) -> i64
        %7915 = func.call @cc_errorp(%7914) : (i64) -> i64
        %7916 = arith.cmpi ne, %7915, %7913 : i64
        %7917 = arith.cmpi eq, %7913, %7913 : i64
        %7918 = arith.andi %7916, %7917 : i1
        %7919 = scf.if %7918 -> (i64) {
          scf.yield %7914 : i64
        } else {
          scf.yield %7913 : i64
        }
        %7920 = arith.cmpi ne, %7919, %7913 : i64
        scf.if %7920 {
          func.call @stack_push_pointer(%7919) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %7921 = func.call @stack_pop_pointer() : () -> i64
          %7922 = func.call @cc_cons(%7912, %7921) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7922) : (i64) -> ()
          %7923 = func.call @stack_pop_pointer() : () -> i64
          %7924 = func.call @cc_cons(%7911, %7923) : (i64, i64) -> i64
          func.call @stack_push_pointer(%7924) : (i64) -> ()
          %7925 = func.call @stack_pop_pointer() : () -> i64
          %7926 = func.call @cc_values_pack(%7925) : (i64) -> i64
          func.call @stack_push_pointer(%7926) : (i64) -> ()
        }
        %7927 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7927 : i64
      }
      func.call @stack_push_pointer(%7852) : (i64) -> ()
      %7928 = func.call @stack_pop_pointer() : () -> i64
      %7929 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %7930 = func.call @cc_errorp(%7928) : (i64) -> i64
      %7931 = func.call @cc_nil_value() : () -> i64
      %7932 = arith.cmpi ne, %7930, %7931 : i64
      scf.if %7932 {
        %7933 = func.call @cc_condition_value(%7928) : (i64) -> i64
        %7934 = func.call @cc_values2(%7931, %7933) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7934) : (i64) -> ()
      } else {
        %7935 = func.call @cc_multiple_value_list(%7928) : (i64) -> i64
        %7936 = func.call @cc_values_pack(%7935) : (i64) -> i64
        func.call @stack_push_pointer(%7936) : (i64) -> ()
      }
      %7937 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7937 : i64
    }
    func.call @stack_push_pointer(%7846) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958554"() {
    %8142 = func.call @cc_nil_value() : () -> i64
    %8143 = func.call @cc_nil_value() : () -> i64
    %8144 = func.call @cc_errorp(%8142) : (i64) -> i64
    %8145 = arith.cmpi ne, %8144, %8143 : i64
    %8146 = scf.if %8145 -> (i64) {
      scf.yield %8142 : i64
    } else {
      %8147 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %8148 = func.call @cc_nil_value() : () -> i64
      %8149 = func.call @cc_nil_value() : () -> i64
      %8150 = func.call @cc_errorp(%8148) : (i64) -> i64
      %8151 = arith.cmpi ne, %8150, %8149 : i64
      %8152 = scf.if %8151 -> (i64) {
        scf.yield %8148 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %8153 = func.call @stack_pop_pointer() : () -> i64
        %8154 = arith.constant 13 : i64
        func.call @stack_push_fixnum(%8154) : (i64) -> ()
        %8155 = func.call @stack_pop_pointer() : () -> i64
        %8156 = func.call @cc_nil_value() : () -> i64
        %8157 = func.call @cc_errorp(%8153) : (i64) -> i64
        %8158 = arith.cmpi ne, %8157, %8156 : i64
        %8159 = arith.cmpi eq, %8156, %8156 : i64
        %8160 = arith.andi %8158, %8159 : i1
        %8161 = scf.if %8160 -> (i64) {
          scf.yield %8153 : i64
        } else {
          scf.yield %8156 : i64
        }
        %8162 = func.call @cc_errorp(%8155) : (i64) -> i64
        %8163 = arith.cmpi ne, %8162, %8156 : i64
        %8164 = arith.cmpi eq, %8161, %8156 : i64
        %8165 = arith.andi %8163, %8164 : i1
        %8166 = scf.if %8165 -> (i64) {
          scf.yield %8155 : i64
        } else {
          scf.yield %8161 : i64
        }
        %8167 = arith.cmpi ne, %8166, %8156 : i64
        scf.if %8167 {
          func.call @stack_push_pointer(%8166) : (i64) -> ()
        } else {
          %8168 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%8168) : (i64) -> ()
          func.call @stack_push_pointer(%8155) : (i64) -> ()
          %8169 = func.call @stack_pop_pointer() : () -> i64
          %8170 = func.call @stack_pop_pointer() : () -> i64
          %8171 = func.call @cc_cons(%8169, %8170) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8171) : (i64) -> ()
          func.call @stack_push_pointer(%8153) : (i64) -> ()
          %8172 = func.call @stack_pop_pointer() : () -> i64
          %8173 = func.call @stack_pop_pointer() : () -> i64
          %8174 = func.call @cc_cons(%8172, %8173) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8174) : (i64) -> ()
        }
        %8175 = func.call @stack_pop_pointer() : () -> i64
        %8176 = func.call @cc_nil_value() : () -> i64
        %8177 = func.call @cc_errorp(%8175) : (i64) -> i64
        %8178 = arith.cmpi ne, %8177, %8176 : i64
        %8179 = arith.cmpi eq, %8176, %8176 : i64
        %8180 = arith.andi %8178, %8179 : i1
        %8181 = scf.if %8180 -> (i64) {
          scf.yield %8175 : i64
        } else {
          scf.yield %8176 : i64
        }
        %8182 = arith.cmpi ne, %8181, %8176 : i64
        scf.if %8182 {
          func.call @stack_push_pointer(%8181) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8175) : (i64) -> ()
          %8183 = llvm.mlir.addressof @str669 : !llvm.ptr
          %8184 = func.call @cc_make_function_ref_const(%8183) : (!llvm.ptr) -> i64
          %8185 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%8184, %8185) : (i64, i64) -> ()
        }
        %8186 = func.call @stack_pop_pointer() : () -> i64
        %8187 = func.call @cc_errorp(%8186) : (i64) -> i64
        %8188 = func.call @cc_nil_value() : () -> i64
        %8189 = arith.cmpi ne, %8187, %8188 : i64
        scf.if %8189 {
          func.call @stack_push_pointer(%8186) : (i64) -> ()
        } else {
          %8190 = func.call @cc_multiple_value_list(%8186) : (i64) -> i64
          func.call @stack_push_pointer(%8190) : (i64) -> ()
        }
        %8191 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %8192 = func.call @stack_pop_pointer() : () -> i64
        %8193 = func.call @cc_nil_value() : () -> i64
        %8194 = func.call @cc_maybe_error_from_multiple_value_list(%8191) : (i64) -> i64
        %8195 = func.call @cc_errorp(%8194) : (i64) -> i64
        %8196 = arith.cmpi ne, %8195, %8193 : i64
        %8197 = arith.cmpi eq, %8193, %8193 : i64
        %8198 = arith.andi %8196, %8197 : i1
        %8199 = scf.if %8198 -> (i64) {
          scf.yield %8194 : i64
        } else {
          scf.yield %8193 : i64
        }
        %8200 = arith.cmpi ne, %8199, %8193 : i64
        scf.if %8200 {
          func.call @stack_push_pointer(%8199) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %8201 = func.call @stack_pop_pointer() : () -> i64
          %8202 = func.call @cc_cons(%8192, %8201) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8202) : (i64) -> ()
          %8203 = func.call @stack_pop_pointer() : () -> i64
          %8204 = func.call @cc_cons(%8191, %8203) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8204) : (i64) -> ()
          %8205 = func.call @stack_pop_pointer() : () -> i64
          %8206 = func.call @cc_values_pack(%8205) : (i64) -> i64
          func.call @stack_push_pointer(%8206) : (i64) -> ()
        }
        %8207 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8207 : i64
      }
      func.call @stack_push_pointer(%8152) : (i64) -> ()
      %8208 = func.call @stack_pop_pointer() : () -> i64
      %8209 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %8210 = func.call @cc_errorp(%8208) : (i64) -> i64
      %8211 = func.call @cc_nil_value() : () -> i64
      %8212 = arith.cmpi ne, %8210, %8211 : i64
      scf.if %8212 {
        %8213 = func.call @cc_condition_value(%8208) : (i64) -> i64
        %8214 = func.call @cc_values2(%8211, %8213) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8214) : (i64) -> ()
      } else {
        %8215 = func.call @cc_multiple_value_list(%8208) : (i64) -> i64
        %8216 = func.call @cc_values_pack(%8215) : (i64) -> i64
        func.call @stack_push_pointer(%8216) : (i64) -> ()
      }
      %8217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8217 : i64
    }
    func.call @stack_push_pointer(%8146) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958555"() {
    %8424 = func.call @cc_nil_value() : () -> i64
    %8425 = func.call @cc_nil_value() : () -> i64
    %8426 = func.call @cc_errorp(%8424) : (i64) -> i64
    %8427 = arith.cmpi ne, %8426, %8425 : i64
    %8428 = scf.if %8427 -> (i64) {
      scf.yield %8424 : i64
    } else {
      %8429 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %8430 = func.call @cc_nil_value() : () -> i64
      %8431 = func.call @cc_nil_value() : () -> i64
      %8432 = func.call @cc_errorp(%8430) : (i64) -> i64
      %8433 = arith.cmpi ne, %8432, %8431 : i64
      %8434 = scf.if %8433 -> (i64) {
        scf.yield %8430 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %8435 = arith.constant 97 : i64
        %8436 = func.call @cc_box_character(%8435) : (i64) -> i64
        func.call @stack_push_pointer(%8436) : (i64) -> ()
        %8437 = func.call @stack_pop_pointer() : () -> i64
        %8438 = arith.constant 13 : i64
        func.call @stack_push_fixnum(%8438) : (i64) -> ()
        %8439 = func.call @stack_pop_pointer() : () -> i64
        %8440 = func.call @cc_nil_value() : () -> i64
        %8441 = func.call @cc_errorp(%8437) : (i64) -> i64
        %8442 = arith.cmpi ne, %8441, %8440 : i64
        %8443 = arith.cmpi eq, %8440, %8440 : i64
        %8444 = arith.andi %8442, %8443 : i1
        %8445 = scf.if %8444 -> (i64) {
          scf.yield %8437 : i64
        } else {
          scf.yield %8440 : i64
        }
        %8446 = func.call @cc_errorp(%8439) : (i64) -> i64
        %8447 = arith.cmpi ne, %8446, %8440 : i64
        %8448 = arith.cmpi eq, %8445, %8440 : i64
        %8449 = arith.andi %8447, %8448 : i1
        %8450 = scf.if %8449 -> (i64) {
          scf.yield %8439 : i64
        } else {
          scf.yield %8445 : i64
        }
        %8451 = arith.cmpi ne, %8450, %8440 : i64
        scf.if %8451 {
          func.call @stack_push_pointer(%8450) : (i64) -> ()
        } else {
          %8452 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%8452) : (i64) -> ()
          func.call @stack_push_pointer(%8439) : (i64) -> ()
          %8453 = func.call @stack_pop_pointer() : () -> i64
          %8454 = func.call @stack_pop_pointer() : () -> i64
          %8455 = func.call @cc_cons(%8453, %8454) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8455) : (i64) -> ()
          func.call @stack_push_pointer(%8437) : (i64) -> ()
          %8456 = func.call @stack_pop_pointer() : () -> i64
          %8457 = func.call @stack_pop_pointer() : () -> i64
          %8458 = func.call @cc_cons(%8456, %8457) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8458) : (i64) -> ()
        }
        %8459 = func.call @stack_pop_pointer() : () -> i64
        %8460 = func.call @cc_nil_value() : () -> i64
        %8461 = func.call @cc_errorp(%8459) : (i64) -> i64
        %8462 = arith.cmpi ne, %8461, %8460 : i64
        %8463 = arith.cmpi eq, %8460, %8460 : i64
        %8464 = arith.andi %8462, %8463 : i1
        %8465 = scf.if %8464 -> (i64) {
          scf.yield %8459 : i64
        } else {
          scf.yield %8460 : i64
        }
        %8466 = arith.cmpi ne, %8465, %8460 : i64
        scf.if %8466 {
          func.call @stack_push_pointer(%8465) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8459) : (i64) -> ()
          %8467 = llvm.mlir.addressof @str688 : !llvm.ptr
          %8468 = func.call @cc_make_function_ref_const(%8467) : (!llvm.ptr) -> i64
          %8469 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%8468, %8469) : (i64, i64) -> ()
        }
        %8470 = func.call @stack_pop_pointer() : () -> i64
        %8471 = func.call @cc_errorp(%8470) : (i64) -> i64
        %8472 = func.call @cc_nil_value() : () -> i64
        %8473 = arith.cmpi ne, %8471, %8472 : i64
        scf.if %8473 {
          func.call @stack_push_pointer(%8470) : (i64) -> ()
        } else {
          %8474 = func.call @cc_multiple_value_list(%8470) : (i64) -> i64
          func.call @stack_push_pointer(%8474) : (i64) -> ()
        }
        %8475 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %8476 = func.call @stack_pop_pointer() : () -> i64
        %8477 = func.call @cc_nil_value() : () -> i64
        %8478 = func.call @cc_maybe_error_from_multiple_value_list(%8475) : (i64) -> i64
        %8479 = func.call @cc_errorp(%8478) : (i64) -> i64
        %8480 = arith.cmpi ne, %8479, %8477 : i64
        %8481 = arith.cmpi eq, %8477, %8477 : i64
        %8482 = arith.andi %8480, %8481 : i1
        %8483 = scf.if %8482 -> (i64) {
          scf.yield %8478 : i64
        } else {
          scf.yield %8477 : i64
        }
        %8484 = arith.cmpi ne, %8483, %8477 : i64
        scf.if %8484 {
          func.call @stack_push_pointer(%8483) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %8485 = func.call @stack_pop_pointer() : () -> i64
          %8486 = func.call @cc_cons(%8476, %8485) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8486) : (i64) -> ()
          %8487 = func.call @stack_pop_pointer() : () -> i64
          %8488 = func.call @cc_cons(%8475, %8487) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8488) : (i64) -> ()
          %8489 = func.call @stack_pop_pointer() : () -> i64
          %8490 = func.call @cc_values_pack(%8489) : (i64) -> i64
          func.call @stack_push_pointer(%8490) : (i64) -> ()
        }
        %8491 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8491 : i64
      }
      func.call @stack_push_pointer(%8434) : (i64) -> ()
      %8492 = func.call @stack_pop_pointer() : () -> i64
      %8493 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %8494 = func.call @cc_errorp(%8492) : (i64) -> i64
      %8495 = func.call @cc_nil_value() : () -> i64
      %8496 = arith.cmpi ne, %8494, %8495 : i64
      scf.if %8496 {
        %8497 = func.call @cc_condition_value(%8492) : (i64) -> i64
        %8498 = func.call @cc_values2(%8495, %8497) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8498) : (i64) -> ()
      } else {
        %8499 = func.call @cc_multiple_value_list(%8492) : (i64) -> i64
        %8500 = func.call @cc_values_pack(%8499) : (i64) -> i64
        func.call @stack_push_pointer(%8500) : (i64) -> ()
      }
      %8501 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8501 : i64
    }
    func.call @stack_push_pointer(%8428) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958556"() {
    %8703 = func.call @cc_nil_value() : () -> i64
    %8704 = func.call @cc_nil_value() : () -> i64
    %8705 = func.call @cc_errorp(%8703) : (i64) -> i64
    %8706 = arith.cmpi ne, %8705, %8704 : i64
    %8707 = scf.if %8706 -> (i64) {
      scf.yield %8703 : i64
    } else {
      %8708 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %8709 = func.call @cc_nil_value() : () -> i64
      %8710 = func.call @cc_nil_value() : () -> i64
      %8711 = func.call @cc_errorp(%8709) : (i64) -> i64
      %8712 = arith.cmpi ne, %8711, %8710 : i64
      %8713 = scf.if %8712 -> (i64) {
        scf.yield %8709 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %8714 = arith.constant -13 : i64
        func.call @stack_push_fixnum(%8714) : (i64) -> ()
        %8715 = func.call @stack_pop_pointer() : () -> i64
        %8716 = func.call @cc_nil_value() : () -> i64
        %8717 = func.call @cc_errorp(%8715) : (i64) -> i64
        %8718 = arith.cmpi ne, %8717, %8716 : i64
        %8719 = arith.cmpi eq, %8716, %8716 : i64
        %8720 = arith.andi %8718, %8719 : i1
        %8721 = scf.if %8720 -> (i64) {
          scf.yield %8715 : i64
        } else {
          scf.yield %8716 : i64
        }
        %8722 = arith.cmpi ne, %8721, %8716 : i64
        scf.if %8722 {
          func.call @stack_push_pointer(%8721) : (i64) -> ()
        } else {
          %8723 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%8723) : (i64) -> ()
          func.call @stack_push_pointer(%8715) : (i64) -> ()
          %8724 = func.call @stack_pop_pointer() : () -> i64
          %8725 = func.call @stack_pop_pointer() : () -> i64
          %8726 = func.call @cc_cons(%8724, %8725) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8726) : (i64) -> ()
        }
        %8727 = func.call @stack_pop_pointer() : () -> i64
        %8728 = func.call @cc_nil_value() : () -> i64
        %8729 = func.call @cc_errorp(%8727) : (i64) -> i64
        %8730 = arith.cmpi ne, %8729, %8728 : i64
        %8731 = arith.cmpi eq, %8728, %8728 : i64
        %8732 = arith.andi %8730, %8731 : i1
        %8733 = scf.if %8732 -> (i64) {
          scf.yield %8727 : i64
        } else {
          scf.yield %8728 : i64
        }
        %8734 = arith.cmpi ne, %8733, %8728 : i64
        scf.if %8734 {
          func.call @stack_push_pointer(%8733) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8727) : (i64) -> ()
          %8735 = llvm.mlir.addressof @str707 : !llvm.ptr
          %8736 = func.call @cc_make_function_ref_const(%8735) : (!llvm.ptr) -> i64
          %8737 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%8736, %8737) : (i64, i64) -> ()
        }
        %8738 = func.call @stack_pop_pointer() : () -> i64
        %8739 = func.call @cc_errorp(%8738) : (i64) -> i64
        %8740 = func.call @cc_nil_value() : () -> i64
        %8741 = arith.cmpi ne, %8739, %8740 : i64
        scf.if %8741 {
          func.call @stack_push_pointer(%8738) : (i64) -> ()
        } else {
          %8742 = func.call @cc_multiple_value_list(%8738) : (i64) -> i64
          func.call @stack_push_pointer(%8742) : (i64) -> ()
        }
        %8743 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %8744 = func.call @stack_pop_pointer() : () -> i64
        %8745 = func.call @cc_nil_value() : () -> i64
        %8746 = func.call @cc_maybe_error_from_multiple_value_list(%8743) : (i64) -> i64
        %8747 = func.call @cc_errorp(%8746) : (i64) -> i64
        %8748 = arith.cmpi ne, %8747, %8745 : i64
        %8749 = arith.cmpi eq, %8745, %8745 : i64
        %8750 = arith.andi %8748, %8749 : i1
        %8751 = scf.if %8750 -> (i64) {
          scf.yield %8746 : i64
        } else {
          scf.yield %8745 : i64
        }
        %8752 = arith.cmpi ne, %8751, %8745 : i64
        scf.if %8752 {
          func.call @stack_push_pointer(%8751) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %8753 = func.call @stack_pop_pointer() : () -> i64
          %8754 = func.call @cc_cons(%8744, %8753) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8754) : (i64) -> ()
          %8755 = func.call @stack_pop_pointer() : () -> i64
          %8756 = func.call @cc_cons(%8743, %8755) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8756) : (i64) -> ()
          %8757 = func.call @stack_pop_pointer() : () -> i64
          %8758 = func.call @cc_values_pack(%8757) : (i64) -> i64
          func.call @stack_push_pointer(%8758) : (i64) -> ()
        }
        %8759 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8759 : i64
      }
      func.call @stack_push_pointer(%8713) : (i64) -> ()
      %8760 = func.call @stack_pop_pointer() : () -> i64
      %8761 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %8762 = func.call @cc_errorp(%8760) : (i64) -> i64
      %8763 = func.call @cc_nil_value() : () -> i64
      %8764 = arith.cmpi ne, %8762, %8763 : i64
      scf.if %8764 {
        %8765 = func.call @cc_condition_value(%8760) : (i64) -> i64
        %8766 = func.call @cc_values2(%8763, %8765) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8766) : (i64) -> ()
      } else {
        %8767 = func.call @cc_multiple_value_list(%8760) : (i64) -> i64
        %8768 = func.call @cc_values_pack(%8767) : (i64) -> i64
        func.call @stack_push_pointer(%8768) : (i64) -> ()
      }
      %8769 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8769 : i64
    }
    func.call @stack_push_pointer(%8707) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958557"() {
    %9041 = func.call @cc_nil_value() : () -> i64
    %9042 = func.call @cc_nil_value() : () -> i64
    %9043 = func.call @cc_errorp(%9041) : (i64) -> i64
    %9044 = arith.cmpi ne, %9043, %9042 : i64
    %9045 = scf.if %9044 -> (i64) {
      scf.yield %9041 : i64
    } else {
      %9046 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %9047 = func.call @cc_nil_value() : () -> i64
      %9048 = func.call @cc_nil_value() : () -> i64
      %9049 = func.call @cc_errorp(%9047) : (i64) -> i64
      %9050 = arith.cmpi ne, %9049, %9048 : i64
      %9051 = scf.if %9050 -> (i64) {
        scf.yield %9047 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %9052 = func.call @stack_pop_pointer() : () -> i64
        %9053 = func.call @cc_nil_value() : () -> i64
        %9054 = func.call @cc_errorp(%9052) : (i64) -> i64
        %9055 = arith.cmpi ne, %9054, %9053 : i64
        %9056 = scf.if %9055 -> (i64) {
          scf.yield %9052 : i64
        } else {
          %9057 = arith.constant 16777216 : i64
          %9058 = func.call @cc_box_fixnum(%9057) : (i64) -> i64
          func.call @stack_push_pointer(%9058) : (i64) -> ()
          %9059 = func.call @stack_pop_pointer() : () -> i64
          %9060 = arith.constant 1 : i64
          %9061 = func.call @cc_box_fixnum(%9060) : (i64) -> i64
          %9063 = arith.constant 3 : i64
          %9062 = arith.andi %9059, %9063 : i64
          %9064 = arith.constant 0 : i64
          %9065 = arith.cmpi eq, %9062, %9064 : i64
          %9067 = arith.constant 3 : i64
          %9066 = arith.andi %9061, %9067 : i64
          %9068 = arith.constant 0 : i64
          %9069 = arith.cmpi eq, %9066, %9068 : i64
          %9070 = arith.andi %9065, %9069 : i1
          %9071 = scf.if %9070 -> (i64) {
            %9072 = arith.constant 2 : i64
            %9073 = arith.shrsi %9059, %9072 : i64
            %9074 = arith.constant 2 : i64
            %9075 = arith.shrsi %9061, %9074 : i64
            %9076 = arith.addi %9073, %9075 : i64
            %9077 = arith.constant -2305843009213693952 : i64
            %9078 = arith.constant 2305843009213693951 : i64
            %9079 = arith.cmpi sge, %9076, %9077 : i64
            %9080 = arith.cmpi sle, %9076, %9078 : i64
            %9081 = arith.andi %9079, %9080 : i1
            %9082 = scf.if %9081 -> (i64) {
              %9083 = arith.constant 2 : i64
              %9084 = arith.shli %9076, %9083 : i64
              scf.yield %9084 : i64
            } else {
              %9085 = func.call @cc_add(%9059, %9061) : (i64, i64) -> i64
              scf.yield %9085 : i64
            }
            scf.yield %9082 : i64
          } else {
            %9086 = func.call @cc_add(%9059, %9061) : (i64, i64) -> i64
            scf.yield %9086 : i64
          }
          func.call @stack_push_pointer(%9071) : (i64) -> ()
          %9087 = func.call @stack_pop_pointer() : () -> i64
          %9088 = func.call @cc_nil_value() : () -> i64
          %9089 = func.call @cc_errorp(%9087) : (i64) -> i64
          %9090 = arith.cmpi ne, %9089, %9088 : i64
          %9091 = arith.cmpi eq, %9088, %9088 : i64
          %9092 = arith.andi %9090, %9091 : i1
          %9093 = scf.if %9092 -> (i64) {
            scf.yield %9087 : i64
          } else {
            scf.yield %9088 : i64
          }
          %9094 = arith.cmpi ne, %9093, %9088 : i64
          scf.if %9094 {
            func.call @stack_push_pointer(%9093) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%9087) : (i64) -> ()
            %9095 = llvm.mlir.addressof @str736 : !llvm.ptr
            %9096 = func.call @cc_make_function_ref_const(%9095) : (!llvm.ptr) -> i64
            %9097 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%9096, %9097) : (i64, i64) -> ()
          }
          %9098 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %9098 : i64
        }
        func.call @stack_push_pointer(%9056) : (i64) -> ()
        %9099 = func.call @stack_pop_pointer() : () -> i64
        %9100 = func.call @cc_errorp(%9099) : (i64) -> i64
        %9101 = func.call @cc_nil_value() : () -> i64
        %9102 = arith.cmpi ne, %9100, %9101 : i64
        scf.if %9102 {
          func.call @stack_push_pointer(%9099) : (i64) -> ()
        } else {
          %9103 = func.call @cc_multiple_value_list(%9099) : (i64) -> i64
          func.call @stack_push_pointer(%9103) : (i64) -> ()
        }
        %9104 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9105 = func.call @stack_pop_pointer() : () -> i64
        %9106 = func.call @cc_nil_value() : () -> i64
        %9107 = func.call @cc_maybe_error_from_multiple_value_list(%9104) : (i64) -> i64
        %9108 = func.call @cc_errorp(%9107) : (i64) -> i64
        %9109 = arith.cmpi ne, %9108, %9106 : i64
        %9110 = arith.cmpi eq, %9106, %9106 : i64
        %9111 = arith.andi %9109, %9110 : i1
        %9112 = scf.if %9111 -> (i64) {
          scf.yield %9107 : i64
        } else {
          scf.yield %9106 : i64
        }
        %9113 = arith.cmpi ne, %9112, %9106 : i64
        scf.if %9113 {
          func.call @stack_push_pointer(%9112) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %9114 = func.call @stack_pop_pointer() : () -> i64
          %9115 = func.call @cc_cons(%9105, %9114) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9115) : (i64) -> ()
          %9116 = func.call @stack_pop_pointer() : () -> i64
          %9117 = func.call @cc_cons(%9104, %9116) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9117) : (i64) -> ()
          %9118 = func.call @stack_pop_pointer() : () -> i64
          %9119 = func.call @cc_values_pack(%9118) : (i64) -> i64
          func.call @stack_push_pointer(%9119) : (i64) -> ()
        }
        %9120 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9120 : i64
      }
      func.call @stack_push_pointer(%9051) : (i64) -> ()
      %9121 = func.call @stack_pop_pointer() : () -> i64
      %9122 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %9123 = func.call @cc_errorp(%9121) : (i64) -> i64
      %9124 = func.call @cc_nil_value() : () -> i64
      %9125 = arith.cmpi ne, %9123, %9124 : i64
      scf.if %9125 {
        %9126 = func.call @cc_condition_value(%9121) : (i64) -> i64
        %9127 = func.call @cc_values2(%9124, %9126) : (i64, i64) -> i64
        func.call @stack_push_pointer(%9127) : (i64) -> ()
      } else {
        %9128 = func.call @cc_multiple_value_list(%9121) : (i64) -> i64
        %9129 = func.call @cc_values_pack(%9128) : (i64) -> i64
        func.call @stack_push_pointer(%9129) : (i64) -> ()
      }
      %9130 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9130 : i64
    }
    func.call @stack_push_pointer(%9045) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958558"() {
    %9418 = func.call @cc_nil_value() : () -> i64
    %9419 = func.call @cc_nil_value() : () -> i64
    %9420 = func.call @cc_errorp(%9418) : (i64) -> i64
    %9421 = arith.cmpi ne, %9420, %9419 : i64
    %9422 = scf.if %9421 -> (i64) {
      scf.yield %9418 : i64
    } else {
      %9423 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %9424 = func.call @cc_nil_value() : () -> i64
      %9425 = func.call @cc_nil_value() : () -> i64
      %9426 = func.call @cc_errorp(%9424) : (i64) -> i64
      %9427 = arith.cmpi ne, %9426, %9425 : i64
      %9428 = scf.if %9427 -> (i64) {
        scf.yield %9424 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %9429 = func.call @stack_pop_pointer() : () -> i64
        %9430 = func.call @cc_nil_value() : () -> i64
        %9431 = func.call @cc_errorp(%9429) : (i64) -> i64
        %9432 = arith.cmpi ne, %9431, %9430 : i64
        %9433 = scf.if %9432 -> (i64) {
          scf.yield %9429 : i64
        } else {
          %9434 = arith.constant 16777216 : i64
          %9435 = func.call @cc_box_fixnum(%9434) : (i64) -> i64
          func.call @stack_push_pointer(%9435) : (i64) -> ()
          %9436 = func.call @stack_pop_pointer() : () -> i64
          %9437 = arith.constant 1 : i64
          %9438 = func.call @cc_box_fixnum(%9437) : (i64) -> i64
          %9440 = arith.constant 3 : i64
          %9439 = arith.andi %9436, %9440 : i64
          %9441 = arith.constant 0 : i64
          %9442 = arith.cmpi eq, %9439, %9441 : i64
          %9444 = arith.constant 3 : i64
          %9443 = arith.andi %9438, %9444 : i64
          %9445 = arith.constant 0 : i64
          %9446 = arith.cmpi eq, %9443, %9445 : i64
          %9447 = arith.andi %9442, %9446 : i1
          %9448 = scf.if %9447 -> (i64) {
            %9449 = arith.constant 2 : i64
            %9450 = arith.shrsi %9436, %9449 : i64
            %9451 = arith.constant 2 : i64
            %9452 = arith.shrsi %9438, %9451 : i64
            %9453 = arith.addi %9450, %9452 : i64
            %9454 = arith.constant -2305843009213693952 : i64
            %9455 = arith.constant 2305843009213693951 : i64
            %9456 = arith.cmpi sge, %9453, %9454 : i64
            %9457 = arith.cmpi sle, %9453, %9455 : i64
            %9458 = arith.andi %9456, %9457 : i1
            %9459 = scf.if %9458 -> (i64) {
              %9460 = arith.constant 2 : i64
              %9461 = arith.shli %9453, %9460 : i64
              scf.yield %9461 : i64
            } else {
              %9462 = func.call @cc_add(%9436, %9438) : (i64, i64) -> i64
              scf.yield %9462 : i64
            }
            scf.yield %9459 : i64
          } else {
            %9463 = func.call @cc_add(%9436, %9438) : (i64, i64) -> i64
            scf.yield %9463 : i64
          }
          func.call @stack_push_pointer(%9448) : (i64) -> ()
          %9464 = func.call @stack_pop_pointer() : () -> i64
          %9465 = func.call @cc_nil_value() : () -> i64
          %9466 = func.call @cc_errorp(%9464) : (i64) -> i64
          %9467 = arith.cmpi ne, %9466, %9465 : i64
          %9468 = arith.cmpi eq, %9465, %9465 : i64
          %9469 = arith.andi %9467, %9468 : i1
          %9470 = scf.if %9469 -> (i64) {
            scf.yield %9464 : i64
          } else {
            scf.yield %9465 : i64
          }
          %9471 = arith.cmpi ne, %9470, %9465 : i64
          scf.if %9471 {
            func.call @stack_push_pointer(%9470) : (i64) -> ()
          } else {
            %9472 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%9472) : (i64) -> ()
            func.call @stack_push_pointer(%9464) : (i64) -> ()
            %9473 = func.call @stack_pop_pointer() : () -> i64
            %9474 = func.call @stack_pop_pointer() : () -> i64
            %9475 = func.call @cc_cons(%9473, %9474) : (i64, i64) -> i64
            func.call @stack_push_pointer(%9475) : (i64) -> ()
          }
          %9476 = func.call @stack_pop_pointer() : () -> i64
          %9477 = func.call @cc_nil_value() : () -> i64
          %9478 = func.call @cc_errorp(%9476) : (i64) -> i64
          %9479 = arith.cmpi ne, %9478, %9477 : i64
          %9480 = arith.cmpi eq, %9477, %9477 : i64
          %9481 = arith.andi %9479, %9480 : i1
          %9482 = scf.if %9481 -> (i64) {
            scf.yield %9476 : i64
          } else {
            scf.yield %9477 : i64
          }
          %9483 = arith.cmpi ne, %9482, %9477 : i64
          scf.if %9483 {
            func.call @stack_push_pointer(%9482) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%9476) : (i64) -> ()
            %9484 = llvm.mlir.addressof @str767 : !llvm.ptr
            %9485 = func.call @cc_make_function_ref_const(%9484) : (!llvm.ptr) -> i64
            %9486 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%9485, %9486) : (i64, i64) -> ()
          }
          %9487 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %9487 : i64
        }
        func.call @stack_push_pointer(%9433) : (i64) -> ()
        %9488 = func.call @stack_pop_pointer() : () -> i64
        %9489 = func.call @cc_errorp(%9488) : (i64) -> i64
        %9490 = func.call @cc_nil_value() : () -> i64
        %9491 = arith.cmpi ne, %9489, %9490 : i64
        scf.if %9491 {
          func.call @stack_push_pointer(%9488) : (i64) -> ()
        } else {
          %9492 = func.call @cc_multiple_value_list(%9488) : (i64) -> i64
          func.call @stack_push_pointer(%9492) : (i64) -> ()
        }
        %9493 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9494 = func.call @stack_pop_pointer() : () -> i64
        %9495 = func.call @cc_nil_value() : () -> i64
        %9496 = func.call @cc_maybe_error_from_multiple_value_list(%9493) : (i64) -> i64
        %9497 = func.call @cc_errorp(%9496) : (i64) -> i64
        %9498 = arith.cmpi ne, %9497, %9495 : i64
        %9499 = arith.cmpi eq, %9495, %9495 : i64
        %9500 = arith.andi %9498, %9499 : i1
        %9501 = scf.if %9500 -> (i64) {
          scf.yield %9496 : i64
        } else {
          scf.yield %9495 : i64
        }
        %9502 = arith.cmpi ne, %9501, %9495 : i64
        scf.if %9502 {
          func.call @stack_push_pointer(%9501) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %9503 = func.call @stack_pop_pointer() : () -> i64
          %9504 = func.call @cc_cons(%9494, %9503) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9504) : (i64) -> ()
          %9505 = func.call @stack_pop_pointer() : () -> i64
          %9506 = func.call @cc_cons(%9493, %9505) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9506) : (i64) -> ()
          %9507 = func.call @stack_pop_pointer() : () -> i64
          %9508 = func.call @cc_values_pack(%9507) : (i64) -> i64
          func.call @stack_push_pointer(%9508) : (i64) -> ()
        }
        %9509 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9509 : i64
      }
      func.call @stack_push_pointer(%9428) : (i64) -> ()
      %9510 = func.call @stack_pop_pointer() : () -> i64
      %9511 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %9512 = func.call @cc_errorp(%9510) : (i64) -> i64
      %9513 = func.call @cc_nil_value() : () -> i64
      %9514 = arith.cmpi ne, %9512, %9513 : i64
      scf.if %9514 {
        %9515 = func.call @cc_condition_value(%9510) : (i64) -> i64
        %9516 = func.call @cc_values2(%9513, %9515) : (i64, i64) -> i64
        func.call @stack_push_pointer(%9516) : (i64) -> ()
      } else {
        %9517 = func.call @cc_multiple_value_list(%9510) : (i64) -> i64
        %9518 = func.call @cc_values_pack(%9517) : (i64) -> i64
        func.call @stack_push_pointer(%9518) : (i64) -> ()
      }
      %9519 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9519 : i64
    }
    func.call @stack_push_pointer(%9422) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958559"() {
    %9785 = func.call @cc_nil_value() : () -> i64
    %9786 = func.call @cc_nil_value() : () -> i64
    %9787 = func.call @cc_errorp(%9785) : (i64) -> i64
    %9788 = arith.cmpi ne, %9787, %9786 : i64
    %9789 = scf.if %9788 -> (i64) {
      scf.yield %9785 : i64
    } else {
      %9790 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %9791 = func.call @cc_nil_value() : () -> i64
      %9792 = func.call @cc_nil_value() : () -> i64
      %9793 = func.call @cc_errorp(%9791) : (i64) -> i64
      %9794 = arith.cmpi ne, %9793, %9792 : i64
      %9795 = scf.if %9794 -> (i64) {
        scf.yield %9791 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %9796 = func.call @stack_pop_pointer() : () -> i64
        %9797 = func.call @cc_nil_value() : () -> i64
        %9798 = func.call @cc_errorp(%9796) : (i64) -> i64
        %9799 = arith.cmpi ne, %9798, %9797 : i64
        %9800 = scf.if %9799 -> (i64) {
          scf.yield %9796 : i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %9801 = func.call @stack_pop_pointer() : () -> i64
          %9802 = arith.constant 13 : i64
          func.call @stack_push_fixnum(%9802) : (i64) -> ()
          %9803 = func.call @stack_pop_pointer() : () -> i64
          %9804 = func.call @cc_nil_value() : () -> i64
          %9805 = func.call @cc_errorp(%9801) : (i64) -> i64
          %9806 = arith.cmpi ne, %9805, %9804 : i64
          %9807 = arith.cmpi eq, %9804, %9804 : i64
          %9808 = arith.andi %9806, %9807 : i1
          %9809 = scf.if %9808 -> (i64) {
            scf.yield %9801 : i64
          } else {
            scf.yield %9804 : i64
          }
          %9810 = func.call @cc_errorp(%9803) : (i64) -> i64
          %9811 = arith.cmpi ne, %9810, %9804 : i64
          %9812 = arith.cmpi eq, %9809, %9804 : i64
          %9813 = arith.andi %9811, %9812 : i1
          %9814 = scf.if %9813 -> (i64) {
            scf.yield %9803 : i64
          } else {
            scf.yield %9809 : i64
          }
          %9815 = arith.cmpi ne, %9814, %9804 : i64
          scf.if %9815 {
            func.call @stack_push_pointer(%9814) : (i64) -> ()
          } else {
            %9816 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%9816) : (i64) -> ()
            func.call @stack_push_pointer(%9803) : (i64) -> ()
            %9817 = func.call @stack_pop_pointer() : () -> i64
            %9818 = func.call @stack_pop_pointer() : () -> i64
            %9819 = func.call @cc_cons(%9817, %9818) : (i64, i64) -> i64
            func.call @stack_push_pointer(%9819) : (i64) -> ()
            func.call @stack_push_pointer(%9801) : (i64) -> ()
            %9820 = func.call @stack_pop_pointer() : () -> i64
            %9821 = func.call @stack_pop_pointer() : () -> i64
            %9822 = func.call @cc_cons(%9820, %9821) : (i64, i64) -> i64
            func.call @stack_push_pointer(%9822) : (i64) -> ()
          }
          %9823 = func.call @stack_pop_pointer() : () -> i64
          %9824 = func.call @cc_nil_value() : () -> i64
          %9825 = func.call @cc_errorp(%9823) : (i64) -> i64
          %9826 = arith.cmpi ne, %9825, %9824 : i64
          %9827 = arith.cmpi eq, %9824, %9824 : i64
          %9828 = arith.andi %9826, %9827 : i1
          %9829 = scf.if %9828 -> (i64) {
            scf.yield %9823 : i64
          } else {
            scf.yield %9824 : i64
          }
          %9830 = arith.cmpi ne, %9829, %9824 : i64
          scf.if %9830 {
            func.call @stack_push_pointer(%9829) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%9823) : (i64) -> ()
            %9831 = llvm.mlir.addressof @str794 : !llvm.ptr
            %9832 = func.call @cc_make_function_ref_const(%9831) : (!llvm.ptr) -> i64
            %9833 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%9832, %9833) : (i64, i64) -> ()
          }
          %9834 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %9834 : i64
        }
        func.call @stack_push_pointer(%9800) : (i64) -> ()
        %9835 = func.call @stack_pop_pointer() : () -> i64
        %9836 = func.call @cc_errorp(%9835) : (i64) -> i64
        %9837 = func.call @cc_nil_value() : () -> i64
        %9838 = arith.cmpi ne, %9836, %9837 : i64
        scf.if %9838 {
          func.call @stack_push_pointer(%9835) : (i64) -> ()
        } else {
          %9839 = func.call @cc_multiple_value_list(%9835) : (i64) -> i64
          func.call @stack_push_pointer(%9839) : (i64) -> ()
        }
        %9840 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9841 = func.call @stack_pop_pointer() : () -> i64
        %9842 = func.call @cc_nil_value() : () -> i64
        %9843 = func.call @cc_maybe_error_from_multiple_value_list(%9840) : (i64) -> i64
        %9844 = func.call @cc_errorp(%9843) : (i64) -> i64
        %9845 = arith.cmpi ne, %9844, %9842 : i64
        %9846 = arith.cmpi eq, %9842, %9842 : i64
        %9847 = arith.andi %9845, %9846 : i1
        %9848 = scf.if %9847 -> (i64) {
          scf.yield %9843 : i64
        } else {
          scf.yield %9842 : i64
        }
        %9849 = arith.cmpi ne, %9848, %9842 : i64
        scf.if %9849 {
          func.call @stack_push_pointer(%9848) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %9850 = func.call @stack_pop_pointer() : () -> i64
          %9851 = func.call @cc_cons(%9841, %9850) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9851) : (i64) -> ()
          %9852 = func.call @stack_pop_pointer() : () -> i64
          %9853 = func.call @cc_cons(%9840, %9852) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9853) : (i64) -> ()
          %9854 = func.call @stack_pop_pointer() : () -> i64
          %9855 = func.call @cc_values_pack(%9854) : (i64) -> i64
          func.call @stack_push_pointer(%9855) : (i64) -> ()
        }
        %9856 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9856 : i64
      }
      func.call @stack_push_pointer(%9795) : (i64) -> ()
      %9857 = func.call @stack_pop_pointer() : () -> i64
      %9858 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %9859 = func.call @cc_errorp(%9857) : (i64) -> i64
      %9860 = func.call @cc_nil_value() : () -> i64
      %9861 = arith.cmpi ne, %9859, %9860 : i64
      scf.if %9861 {
        %9862 = func.call @cc_condition_value(%9857) : (i64) -> i64
        %9863 = func.call @cc_values2(%9860, %9862) : (i64, i64) -> i64
        func.call @stack_push_pointer(%9863) : (i64) -> ()
      } else {
        %9864 = func.call @cc_multiple_value_list(%9857) : (i64) -> i64
        %9865 = func.call @cc_values_pack(%9864) : (i64) -> i64
        func.call @stack_push_pointer(%9865) : (i64) -> ()
      }
      %9866 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9866 : i64
    }
    func.call @stack_push_pointer(%9789) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958560"() {
    %10134 = func.call @cc_nil_value() : () -> i64
    %10135 = func.call @cc_nil_value() : () -> i64
    %10136 = func.call @cc_errorp(%10134) : (i64) -> i64
    %10137 = arith.cmpi ne, %10136, %10135 : i64
    %10138 = scf.if %10137 -> (i64) {
      scf.yield %10134 : i64
    } else {
      %10139 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %10140 = func.call @cc_nil_value() : () -> i64
      %10141 = func.call @cc_nil_value() : () -> i64
      %10142 = func.call @cc_errorp(%10140) : (i64) -> i64
      %10143 = arith.cmpi ne, %10142, %10141 : i64
      %10144 = scf.if %10143 -> (i64) {
        scf.yield %10140 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %10145 = func.call @stack_pop_pointer() : () -> i64
        %10146 = func.call @cc_nil_value() : () -> i64
        %10147 = func.call @cc_errorp(%10145) : (i64) -> i64
        %10148 = arith.cmpi ne, %10147, %10146 : i64
        %10149 = scf.if %10148 -> (i64) {
          scf.yield %10145 : i64
        } else {
          %10150 = arith.constant 97 : i64
          %10151 = func.call @cc_box_character(%10150) : (i64) -> i64
          func.call @stack_push_pointer(%10151) : (i64) -> ()
          %10152 = func.call @stack_pop_pointer() : () -> i64
          %10153 = arith.constant 13 : i64
          func.call @stack_push_fixnum(%10153) : (i64) -> ()
          %10154 = func.call @stack_pop_pointer() : () -> i64
          %10155 = func.call @cc_nil_value() : () -> i64
          %10156 = func.call @cc_errorp(%10152) : (i64) -> i64
          %10157 = arith.cmpi ne, %10156, %10155 : i64
          %10158 = arith.cmpi eq, %10155, %10155 : i64
          %10159 = arith.andi %10157, %10158 : i1
          %10160 = scf.if %10159 -> (i64) {
            scf.yield %10152 : i64
          } else {
            scf.yield %10155 : i64
          }
          %10161 = func.call @cc_errorp(%10154) : (i64) -> i64
          %10162 = arith.cmpi ne, %10161, %10155 : i64
          %10163 = arith.cmpi eq, %10160, %10155 : i64
          %10164 = arith.andi %10162, %10163 : i1
          %10165 = scf.if %10164 -> (i64) {
            scf.yield %10154 : i64
          } else {
            scf.yield %10160 : i64
          }
          %10166 = arith.cmpi ne, %10165, %10155 : i64
          scf.if %10166 {
            func.call @stack_push_pointer(%10165) : (i64) -> ()
          } else {
            %10167 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%10167) : (i64) -> ()
            func.call @stack_push_pointer(%10154) : (i64) -> ()
            %10168 = func.call @stack_pop_pointer() : () -> i64
            %10169 = func.call @stack_pop_pointer() : () -> i64
            %10170 = func.call @cc_cons(%10168, %10169) : (i64, i64) -> i64
            func.call @stack_push_pointer(%10170) : (i64) -> ()
            func.call @stack_push_pointer(%10152) : (i64) -> ()
            %10171 = func.call @stack_pop_pointer() : () -> i64
            %10172 = func.call @stack_pop_pointer() : () -> i64
            %10173 = func.call @cc_cons(%10171, %10172) : (i64, i64) -> i64
            func.call @stack_push_pointer(%10173) : (i64) -> ()
          }
          %10174 = func.call @stack_pop_pointer() : () -> i64
          %10175 = func.call @cc_nil_value() : () -> i64
          %10176 = func.call @cc_errorp(%10174) : (i64) -> i64
          %10177 = arith.cmpi ne, %10176, %10175 : i64
          %10178 = arith.cmpi eq, %10175, %10175 : i64
          %10179 = arith.andi %10177, %10178 : i1
          %10180 = scf.if %10179 -> (i64) {
            scf.yield %10174 : i64
          } else {
            scf.yield %10175 : i64
          }
          %10181 = arith.cmpi ne, %10180, %10175 : i64
          scf.if %10181 {
            func.call @stack_push_pointer(%10180) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%10174) : (i64) -> ()
            %10182 = llvm.mlir.addressof @str821 : !llvm.ptr
            %10183 = func.call @cc_make_function_ref_const(%10182) : (!llvm.ptr) -> i64
            %10184 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%10183, %10184) : (i64, i64) -> ()
          }
          %10185 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %10185 : i64
        }
        func.call @stack_push_pointer(%10149) : (i64) -> ()
        %10186 = func.call @stack_pop_pointer() : () -> i64
        %10187 = func.call @cc_errorp(%10186) : (i64) -> i64
        %10188 = func.call @cc_nil_value() : () -> i64
        %10189 = arith.cmpi ne, %10187, %10188 : i64
        scf.if %10189 {
          func.call @stack_push_pointer(%10186) : (i64) -> ()
        } else {
          %10190 = func.call @cc_multiple_value_list(%10186) : (i64) -> i64
          func.call @stack_push_pointer(%10190) : (i64) -> ()
        }
        %10191 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %10192 = func.call @stack_pop_pointer() : () -> i64
        %10193 = func.call @cc_nil_value() : () -> i64
        %10194 = func.call @cc_maybe_error_from_multiple_value_list(%10191) : (i64) -> i64
        %10195 = func.call @cc_errorp(%10194) : (i64) -> i64
        %10196 = arith.cmpi ne, %10195, %10193 : i64
        %10197 = arith.cmpi eq, %10193, %10193 : i64
        %10198 = arith.andi %10196, %10197 : i1
        %10199 = scf.if %10198 -> (i64) {
          scf.yield %10194 : i64
        } else {
          scf.yield %10193 : i64
        }
        %10200 = arith.cmpi ne, %10199, %10193 : i64
        scf.if %10200 {
          func.call @stack_push_pointer(%10199) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %10201 = func.call @stack_pop_pointer() : () -> i64
          %10202 = func.call @cc_cons(%10192, %10201) : (i64, i64) -> i64
          func.call @stack_push_pointer(%10202) : (i64) -> ()
          %10203 = func.call @stack_pop_pointer() : () -> i64
          %10204 = func.call @cc_cons(%10191, %10203) : (i64, i64) -> i64
          func.call @stack_push_pointer(%10204) : (i64) -> ()
          %10205 = func.call @stack_pop_pointer() : () -> i64
          %10206 = func.call @cc_values_pack(%10205) : (i64) -> i64
          func.call @stack_push_pointer(%10206) : (i64) -> ()
        }
        %10207 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10207 : i64
      }
      func.call @stack_push_pointer(%10144) : (i64) -> ()
      %10208 = func.call @stack_pop_pointer() : () -> i64
      %10209 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %10210 = func.call @cc_errorp(%10208) : (i64) -> i64
      %10211 = func.call @cc_nil_value() : () -> i64
      %10212 = arith.cmpi ne, %10210, %10211 : i64
      scf.if %10212 {
        %10213 = func.call @cc_condition_value(%10208) : (i64) -> i64
        %10214 = func.call @cc_values2(%10211, %10213) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10214) : (i64) -> ()
      } else {
        %10215 = func.call @cc_multiple_value_list(%10208) : (i64) -> i64
        %10216 = func.call @cc_values_pack(%10215) : (i64) -> i64
        func.call @stack_push_pointer(%10216) : (i64) -> ()
      }
      %10217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10217 : i64
    }
    func.call @stack_push_pointer(%10138) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958561"() {
    %10480 = func.call @cc_nil_value() : () -> i64
    %10481 = func.call @cc_nil_value() : () -> i64
    %10482 = func.call @cc_errorp(%10480) : (i64) -> i64
    %10483 = arith.cmpi ne, %10482, %10481 : i64
    %10484 = scf.if %10483 -> (i64) {
      scf.yield %10480 : i64
    } else {
      %10485 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %10486 = func.call @cc_nil_value() : () -> i64
      %10487 = func.call @cc_nil_value() : () -> i64
      %10488 = func.call @cc_errorp(%10486) : (i64) -> i64
      %10489 = arith.cmpi ne, %10488, %10487 : i64
      %10490 = scf.if %10489 -> (i64) {
        scf.yield %10486 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %10491 = func.call @stack_pop_pointer() : () -> i64
        %10492 = func.call @cc_nil_value() : () -> i64
        %10493 = func.call @cc_errorp(%10491) : (i64) -> i64
        %10494 = arith.cmpi ne, %10493, %10492 : i64
        %10495 = scf.if %10494 -> (i64) {
          scf.yield %10491 : i64
        } else {
          %10496 = arith.constant -13 : i64
          func.call @stack_push_fixnum(%10496) : (i64) -> ()
          %10497 = func.call @stack_pop_pointer() : () -> i64
          %10498 = func.call @cc_nil_value() : () -> i64
          %10499 = func.call @cc_errorp(%10497) : (i64) -> i64
          %10500 = arith.cmpi ne, %10499, %10498 : i64
          %10501 = arith.cmpi eq, %10498, %10498 : i64
          %10502 = arith.andi %10500, %10501 : i1
          %10503 = scf.if %10502 -> (i64) {
            scf.yield %10497 : i64
          } else {
            scf.yield %10498 : i64
          }
          %10504 = arith.cmpi ne, %10503, %10498 : i64
          scf.if %10504 {
            func.call @stack_push_pointer(%10503) : (i64) -> ()
          } else {
            %10505 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%10505) : (i64) -> ()
            func.call @stack_push_pointer(%10497) : (i64) -> ()
            %10506 = func.call @stack_pop_pointer() : () -> i64
            %10507 = func.call @stack_pop_pointer() : () -> i64
            %10508 = func.call @cc_cons(%10506, %10507) : (i64, i64) -> i64
            func.call @stack_push_pointer(%10508) : (i64) -> ()
          }
          %10509 = func.call @stack_pop_pointer() : () -> i64
          %10510 = func.call @cc_nil_value() : () -> i64
          %10511 = func.call @cc_errorp(%10509) : (i64) -> i64
          %10512 = arith.cmpi ne, %10511, %10510 : i64
          %10513 = arith.cmpi eq, %10510, %10510 : i64
          %10514 = arith.andi %10512, %10513 : i1
          %10515 = scf.if %10514 -> (i64) {
            scf.yield %10509 : i64
          } else {
            scf.yield %10510 : i64
          }
          %10516 = arith.cmpi ne, %10515, %10510 : i64
          scf.if %10516 {
            func.call @stack_push_pointer(%10515) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%10509) : (i64) -> ()
            %10517 = llvm.mlir.addressof @str848 : !llvm.ptr
            %10518 = func.call @cc_make_function_ref_const(%10517) : (!llvm.ptr) -> i64
            %10519 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%10518, %10519) : (i64, i64) -> ()
          }
          %10520 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %10520 : i64
        }
        func.call @stack_push_pointer(%10495) : (i64) -> ()
        %10521 = func.call @stack_pop_pointer() : () -> i64
        %10522 = func.call @cc_errorp(%10521) : (i64) -> i64
        %10523 = func.call @cc_nil_value() : () -> i64
        %10524 = arith.cmpi ne, %10522, %10523 : i64
        scf.if %10524 {
          func.call @stack_push_pointer(%10521) : (i64) -> ()
        } else {
          %10525 = func.call @cc_multiple_value_list(%10521) : (i64) -> i64
          func.call @stack_push_pointer(%10525) : (i64) -> ()
        }
        %10526 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %10527 = func.call @stack_pop_pointer() : () -> i64
        %10528 = func.call @cc_nil_value() : () -> i64
        %10529 = func.call @cc_maybe_error_from_multiple_value_list(%10526) : (i64) -> i64
        %10530 = func.call @cc_errorp(%10529) : (i64) -> i64
        %10531 = arith.cmpi ne, %10530, %10528 : i64
        %10532 = arith.cmpi eq, %10528, %10528 : i64
        %10533 = arith.andi %10531, %10532 : i1
        %10534 = scf.if %10533 -> (i64) {
          scf.yield %10529 : i64
        } else {
          scf.yield %10528 : i64
        }
        %10535 = arith.cmpi ne, %10534, %10528 : i64
        scf.if %10535 {
          func.call @stack_push_pointer(%10534) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %10536 = func.call @stack_pop_pointer() : () -> i64
          %10537 = func.call @cc_cons(%10527, %10536) : (i64, i64) -> i64
          func.call @stack_push_pointer(%10537) : (i64) -> ()
          %10538 = func.call @stack_pop_pointer() : () -> i64
          %10539 = func.call @cc_cons(%10526, %10538) : (i64, i64) -> i64
          func.call @stack_push_pointer(%10539) : (i64) -> ()
          %10540 = func.call @stack_pop_pointer() : () -> i64
          %10541 = func.call @cc_values_pack(%10540) : (i64) -> i64
          func.call @stack_push_pointer(%10541) : (i64) -> ()
        }
        %10542 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10542 : i64
      }
      func.call @stack_push_pointer(%10490) : (i64) -> ()
      %10543 = func.call @stack_pop_pointer() : () -> i64
      %10544 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %10545 = func.call @cc_errorp(%10543) : (i64) -> i64
      %10546 = func.call @cc_nil_value() : () -> i64
      %10547 = arith.cmpi ne, %10545, %10546 : i64
      scf.if %10547 {
        %10548 = func.call @cc_condition_value(%10543) : (i64) -> i64
        %10549 = func.call @cc_values2(%10546, %10548) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10549) : (i64) -> ()
      } else {
        %10550 = func.call @cc_multiple_value_list(%10543) : (i64) -> i64
        %10551 = func.call @cc_values_pack(%10550) : (i64) -> i64
        func.call @stack_push_pointer(%10551) : (i64) -> ()
      }
      %10552 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10552 : i64
    }
    func.call @stack_push_pointer(%10484) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958562"() {
    %10801 = func.call @cc_nil_value() : () -> i64
    %10802 = func.call @cc_nil_value() : () -> i64
    %10803 = func.call @cc_errorp(%10801) : (i64) -> i64
    %10804 = arith.cmpi ne, %10803, %10802 : i64
    %10805 = scf.if %10804 -> (i64) {
      scf.yield %10801 : i64
    } else {
      %10806 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10806) : (i64) -> ()
      %10807 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10807) : (i64) -> ()
      %10808 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10808) : (i64) -> ()
      %10809 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10809) : (i64) -> ()
      %10810 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10810) : (i64) -> ()
      %10811 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10811) : (i64) -> ()
      %10812 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10812) : (i64) -> ()
      %10813 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10813) : (i64) -> ()
      %10814 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10814) : (i64) -> ()
      %10815 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%10815) : (i64) -> ()
      %10816 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10816) : (i64) -> ()
      %10817 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%10817) : (i64) -> ()
      %10818 = arith.constant 12 : i64
      %10819 = func.call @cc_box_fixnum(%10818) : (i64) -> i64
      %10820 = func.call @cc_make_vector(%10819) : (i64) -> i64
      %10821 = func.call @stack_pop_pointer() : () -> i64
      %10822 = arith.constant 11 : i64
      %10823 = func.call @cc_box_fixnum(%10822) : (i64) -> i64
      %10824 = func.call @cc_svset(%10820, %10823, %10821) : (i64, i64, i64) -> i64
      %10825 = func.call @stack_pop_pointer() : () -> i64
      %10826 = arith.constant 10 : i64
      %10827 = func.call @cc_box_fixnum(%10826) : (i64) -> i64
      %10828 = func.call @cc_svset(%10820, %10827, %10825) : (i64, i64, i64) -> i64
      %10829 = func.call @stack_pop_pointer() : () -> i64
      %10830 = arith.constant 9 : i64
      %10831 = func.call @cc_box_fixnum(%10830) : (i64) -> i64
      %10832 = func.call @cc_svset(%10820, %10831, %10829) : (i64, i64, i64) -> i64
      %10833 = func.call @stack_pop_pointer() : () -> i64
      %10834 = arith.constant 8 : i64
      %10835 = func.call @cc_box_fixnum(%10834) : (i64) -> i64
      %10836 = func.call @cc_svset(%10820, %10835, %10833) : (i64, i64, i64) -> i64
      %10837 = func.call @stack_pop_pointer() : () -> i64
      %10838 = arith.constant 7 : i64
      %10839 = func.call @cc_box_fixnum(%10838) : (i64) -> i64
      %10840 = func.call @cc_svset(%10820, %10839, %10837) : (i64, i64, i64) -> i64
      %10841 = func.call @stack_pop_pointer() : () -> i64
      %10842 = arith.constant 6 : i64
      %10843 = func.call @cc_box_fixnum(%10842) : (i64) -> i64
      %10844 = func.call @cc_svset(%10820, %10843, %10841) : (i64, i64, i64) -> i64
      %10845 = func.call @stack_pop_pointer() : () -> i64
      %10846 = arith.constant 5 : i64
      %10847 = func.call @cc_box_fixnum(%10846) : (i64) -> i64
      %10848 = func.call @cc_svset(%10820, %10847, %10845) : (i64, i64, i64) -> i64
      %10849 = func.call @stack_pop_pointer() : () -> i64
      %10850 = arith.constant 4 : i64
      %10851 = func.call @cc_box_fixnum(%10850) : (i64) -> i64
      %10852 = func.call @cc_svset(%10820, %10851, %10849) : (i64, i64, i64) -> i64
      %10853 = func.call @stack_pop_pointer() : () -> i64
      %10854 = arith.constant 3 : i64
      %10855 = func.call @cc_box_fixnum(%10854) : (i64) -> i64
      %10856 = func.call @cc_svset(%10820, %10855, %10853) : (i64, i64, i64) -> i64
      %10857 = func.call @stack_pop_pointer() : () -> i64
      %10858 = arith.constant 2 : i64
      %10859 = func.call @cc_box_fixnum(%10858) : (i64) -> i64
      %10860 = func.call @cc_svset(%10820, %10859, %10857) : (i64, i64, i64) -> i64
      %10861 = func.call @stack_pop_pointer() : () -> i64
      %10862 = arith.constant 1 : i64
      %10863 = func.call @cc_box_fixnum(%10862) : (i64) -> i64
      %10864 = func.call @cc_svset(%10820, %10863, %10861) : (i64, i64, i64) -> i64
      %10865 = func.call @stack_pop_pointer() : () -> i64
      %10866 = arith.constant 0 : i64
      %10867 = func.call @cc_box_fixnum(%10866) : (i64) -> i64
      %10868 = func.call @cc_svset(%10820, %10867, %10865) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%10820) : (i64) -> ()
      %10869 = func.call @stack_pop_pointer() : () -> i64
      %10870 = arith.constant 11 : i64
      func.call @stack_push_fixnum(%10870) : (i64) -> ()
      %10871 = func.call @stack_pop_pointer() : () -> i64
      %10872 = func.call @cc_nil_value() : () -> i64
      %10873 = func.call @cc_errorp(%10869) : (i64) -> i64
      %10874 = arith.cmpi ne, %10873, %10872 : i64
      %10875 = arith.cmpi eq, %10872, %10872 : i64
      %10876 = arith.andi %10874, %10875 : i1
      %10877 = scf.if %10876 -> (i64) {
        scf.yield %10869 : i64
      } else {
        scf.yield %10872 : i64
      }
      %10878 = func.call @cc_errorp(%10871) : (i64) -> i64
      %10879 = arith.cmpi ne, %10878, %10872 : i64
      %10880 = arith.cmpi eq, %10877, %10872 : i64
      %10881 = arith.andi %10879, %10880 : i1
      %10882 = scf.if %10881 -> (i64) {
        scf.yield %10871 : i64
      } else {
        scf.yield %10877 : i64
      }
      %10883 = arith.cmpi ne, %10882, %10872 : i64
      scf.if %10883 {
        func.call @stack_push_pointer(%10882) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10869) : (i64) -> ()
        func.call @stack_push_pointer(%10871) : (i64) -> ()
        %10884 = llvm.mlir.addressof @str865 : !llvm.ptr
        %10885 = func.call @cc_make_function_ref_const(%10884) : (!llvm.ptr) -> i64
        %10886 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%10885, %10886) : (i64, i64) -> ()
      }
      %10887 = func.call @stack_pop_pointer() : () -> i64
      %10888 = func.call @cc_numberp(%10887) : (i64) -> i64
      func.call @stack_push_pointer(%10888) : (i64) -> ()
      %10889 = func.call @stack_pop_pointer() : () -> i64
      %10890 = func.call @cc_nil_value() : () -> i64
      %10891 = func.call @cc_cons(%10889, %10890) : (i64, i64) -> i64
      %10892 = func.call @cc_not(%10891) : (i64) -> i64
      func.call @stack_push_pointer(%10892) : (i64) -> ()
      %10893 = func.call @stack_pop_pointer() : () -> i64
      %10894 = func.call @cc_nil_value() : () -> i64
      %10895 = func.call @cc_cons(%10893, %10894) : (i64, i64) -> i64
      %10896 = func.call @cc_not(%10895) : (i64) -> i64
      func.call @stack_push_pointer(%10896) : (i64) -> ()
      %10897 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10897 : i64
    }
    func.call @stack_push_pointer(%10805) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958563"() {
    %11133 = func.call @cc_nil_value() : () -> i64
    %11134 = func.call @cc_nil_value() : () -> i64
    %11135 = func.call @cc_errorp(%11133) : (i64) -> i64
    %11136 = arith.cmpi ne, %11135, %11134 : i64
    %11137 = scf.if %11136 -> (i64) {
      scf.yield %11133 : i64
    } else {
      %11138 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11138) : (i64) -> ()
      %11139 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11139) : (i64) -> ()
      %11140 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11140) : (i64) -> ()
      %11141 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11141) : (i64) -> ()
      %11142 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11142) : (i64) -> ()
      %11143 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11143) : (i64) -> ()
      %11144 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11144) : (i64) -> ()
      %11145 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11145) : (i64) -> ()
      %11146 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11146) : (i64) -> ()
      %11147 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11147) : (i64) -> ()
      %11148 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11148) : (i64) -> ()
      %11149 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11149) : (i64) -> ()
      %11150 = arith.constant 12 : i64
      %11151 = func.call @cc_box_fixnum(%11150) : (i64) -> i64
      %11152 = func.call @cc_make_vector(%11151) : (i64) -> i64
      %11153 = func.call @stack_pop_pointer() : () -> i64
      %11154 = arith.constant 11 : i64
      %11155 = func.call @cc_box_fixnum(%11154) : (i64) -> i64
      %11156 = func.call @cc_svset(%11152, %11155, %11153) : (i64, i64, i64) -> i64
      %11157 = func.call @stack_pop_pointer() : () -> i64
      %11158 = arith.constant 10 : i64
      %11159 = func.call @cc_box_fixnum(%11158) : (i64) -> i64
      %11160 = func.call @cc_svset(%11152, %11159, %11157) : (i64, i64, i64) -> i64
      %11161 = func.call @stack_pop_pointer() : () -> i64
      %11162 = arith.constant 9 : i64
      %11163 = func.call @cc_box_fixnum(%11162) : (i64) -> i64
      %11164 = func.call @cc_svset(%11152, %11163, %11161) : (i64, i64, i64) -> i64
      %11165 = func.call @stack_pop_pointer() : () -> i64
      %11166 = arith.constant 8 : i64
      %11167 = func.call @cc_box_fixnum(%11166) : (i64) -> i64
      %11168 = func.call @cc_svset(%11152, %11167, %11165) : (i64, i64, i64) -> i64
      %11169 = func.call @stack_pop_pointer() : () -> i64
      %11170 = arith.constant 7 : i64
      %11171 = func.call @cc_box_fixnum(%11170) : (i64) -> i64
      %11172 = func.call @cc_svset(%11152, %11171, %11169) : (i64, i64, i64) -> i64
      %11173 = func.call @stack_pop_pointer() : () -> i64
      %11174 = arith.constant 6 : i64
      %11175 = func.call @cc_box_fixnum(%11174) : (i64) -> i64
      %11176 = func.call @cc_svset(%11152, %11175, %11173) : (i64, i64, i64) -> i64
      %11177 = func.call @stack_pop_pointer() : () -> i64
      %11178 = arith.constant 5 : i64
      %11179 = func.call @cc_box_fixnum(%11178) : (i64) -> i64
      %11180 = func.call @cc_svset(%11152, %11179, %11177) : (i64, i64, i64) -> i64
      %11181 = func.call @stack_pop_pointer() : () -> i64
      %11182 = arith.constant 4 : i64
      %11183 = func.call @cc_box_fixnum(%11182) : (i64) -> i64
      %11184 = func.call @cc_svset(%11152, %11183, %11181) : (i64, i64, i64) -> i64
      %11185 = func.call @stack_pop_pointer() : () -> i64
      %11186 = arith.constant 3 : i64
      %11187 = func.call @cc_box_fixnum(%11186) : (i64) -> i64
      %11188 = func.call @cc_svset(%11152, %11187, %11185) : (i64, i64, i64) -> i64
      %11189 = func.call @stack_pop_pointer() : () -> i64
      %11190 = arith.constant 2 : i64
      %11191 = func.call @cc_box_fixnum(%11190) : (i64) -> i64
      %11192 = func.call @cc_svset(%11152, %11191, %11189) : (i64, i64, i64) -> i64
      %11193 = func.call @stack_pop_pointer() : () -> i64
      %11194 = arith.constant 1 : i64
      %11195 = func.call @cc_box_fixnum(%11194) : (i64) -> i64
      %11196 = func.call @cc_svset(%11152, %11195, %11193) : (i64, i64, i64) -> i64
      %11197 = func.call @stack_pop_pointer() : () -> i64
      %11198 = arith.constant 0 : i64
      %11199 = func.call @cc_box_fixnum(%11198) : (i64) -> i64
      %11200 = func.call @cc_svset(%11152, %11199, %11197) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%11152) : (i64) -> ()
      %11201 = func.call @stack_pop_pointer() : () -> i64
      %11202 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%11202) : (i64) -> ()
      %11203 = func.call @stack_pop_pointer() : () -> i64
      %11204 = func.call @cc_nil_value() : () -> i64
      %11205 = func.call @cc_errorp(%11201) : (i64) -> i64
      %11206 = arith.cmpi ne, %11205, %11204 : i64
      %11207 = arith.cmpi eq, %11204, %11204 : i64
      %11208 = arith.andi %11206, %11207 : i1
      %11209 = scf.if %11208 -> (i64) {
        scf.yield %11201 : i64
      } else {
        scf.yield %11204 : i64
      }
      %11210 = func.call @cc_errorp(%11203) : (i64) -> i64
      %11211 = arith.cmpi ne, %11210, %11204 : i64
      %11212 = arith.cmpi eq, %11209, %11204 : i64
      %11213 = arith.andi %11211, %11212 : i1
      %11214 = scf.if %11213 -> (i64) {
        scf.yield %11203 : i64
      } else {
        scf.yield %11209 : i64
      }
      %11215 = arith.cmpi ne, %11214, %11204 : i64
      scf.if %11215 {
        func.call @stack_push_pointer(%11214) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11201) : (i64) -> ()
        func.call @stack_push_pointer(%11203) : (i64) -> ()
        %11216 = llvm.mlir.addressof @str880 : !llvm.ptr
        %11217 = func.call @cc_make_function_ref_const(%11216) : (!llvm.ptr) -> i64
        %11218 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%11217, %11218) : (i64, i64) -> ()
      }
      %11219 = func.call @stack_pop_pointer() : () -> i64
      %11220 = func.call @cc_numberp(%11219) : (i64) -> i64
      func.call @stack_push_pointer(%11220) : (i64) -> ()
      %11221 = func.call @stack_pop_pointer() : () -> i64
      %11222 = func.call @cc_nil_value() : () -> i64
      %11223 = func.call @cc_cons(%11221, %11222) : (i64, i64) -> i64
      %11224 = func.call @cc_not(%11223) : (i64) -> i64
      func.call @stack_push_pointer(%11224) : (i64) -> ()
      %11225 = func.call @stack_pop_pointer() : () -> i64
      %11226 = func.call @cc_nil_value() : () -> i64
      %11227 = func.call @cc_cons(%11225, %11226) : (i64, i64) -> i64
      %11228 = func.call @cc_not(%11227) : (i64) -> i64
      func.call @stack_push_pointer(%11228) : (i64) -> ()
      %11229 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11229 : i64
    }
    func.call @stack_push_pointer(%11137) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_15079495958564"() {
    %11465 = func.call @cc_nil_value() : () -> i64
    %11466 = func.call @cc_nil_value() : () -> i64
    %11467 = func.call @cc_errorp(%11465) : (i64) -> i64
    %11468 = arith.cmpi ne, %11467, %11466 : i64
    %11469 = scf.if %11468 -> (i64) {
      scf.yield %11465 : i64
    } else {
      %11470 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11470) : (i64) -> ()
      %11471 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11471) : (i64) -> ()
      %11472 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11472) : (i64) -> ()
      %11473 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11473) : (i64) -> ()
      %11474 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11474) : (i64) -> ()
      %11475 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11475) : (i64) -> ()
      %11476 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11476) : (i64) -> ()
      %11477 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11477) : (i64) -> ()
      %11478 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11478) : (i64) -> ()
      %11479 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%11479) : (i64) -> ()
      %11480 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11480) : (i64) -> ()
      %11481 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%11481) : (i64) -> ()
      %11482 = arith.constant 12 : i64
      %11483 = func.call @cc_box_fixnum(%11482) : (i64) -> i64
      %11484 = func.call @cc_make_vector(%11483) : (i64) -> i64
      %11485 = func.call @stack_pop_pointer() : () -> i64
      %11486 = arith.constant 11 : i64
      %11487 = func.call @cc_box_fixnum(%11486) : (i64) -> i64
      %11488 = func.call @cc_svset(%11484, %11487, %11485) : (i64, i64, i64) -> i64
      %11489 = func.call @stack_pop_pointer() : () -> i64
      %11490 = arith.constant 10 : i64
      %11491 = func.call @cc_box_fixnum(%11490) : (i64) -> i64
      %11492 = func.call @cc_svset(%11484, %11491, %11489) : (i64, i64, i64) -> i64
      %11493 = func.call @stack_pop_pointer() : () -> i64
      %11494 = arith.constant 9 : i64
      %11495 = func.call @cc_box_fixnum(%11494) : (i64) -> i64
      %11496 = func.call @cc_svset(%11484, %11495, %11493) : (i64, i64, i64) -> i64
      %11497 = func.call @stack_pop_pointer() : () -> i64
      %11498 = arith.constant 8 : i64
      %11499 = func.call @cc_box_fixnum(%11498) : (i64) -> i64
      %11500 = func.call @cc_svset(%11484, %11499, %11497) : (i64, i64, i64) -> i64
      %11501 = func.call @stack_pop_pointer() : () -> i64
      %11502 = arith.constant 7 : i64
      %11503 = func.call @cc_box_fixnum(%11502) : (i64) -> i64
      %11504 = func.call @cc_svset(%11484, %11503, %11501) : (i64, i64, i64) -> i64
      %11505 = func.call @stack_pop_pointer() : () -> i64
      %11506 = arith.constant 6 : i64
      %11507 = func.call @cc_box_fixnum(%11506) : (i64) -> i64
      %11508 = func.call @cc_svset(%11484, %11507, %11505) : (i64, i64, i64) -> i64
      %11509 = func.call @stack_pop_pointer() : () -> i64
      %11510 = arith.constant 5 : i64
      %11511 = func.call @cc_box_fixnum(%11510) : (i64) -> i64
      %11512 = func.call @cc_svset(%11484, %11511, %11509) : (i64, i64, i64) -> i64
      %11513 = func.call @stack_pop_pointer() : () -> i64
      %11514 = arith.constant 4 : i64
      %11515 = func.call @cc_box_fixnum(%11514) : (i64) -> i64
      %11516 = func.call @cc_svset(%11484, %11515, %11513) : (i64, i64, i64) -> i64
      %11517 = func.call @stack_pop_pointer() : () -> i64
      %11518 = arith.constant 3 : i64
      %11519 = func.call @cc_box_fixnum(%11518) : (i64) -> i64
      %11520 = func.call @cc_svset(%11484, %11519, %11517) : (i64, i64, i64) -> i64
      %11521 = func.call @stack_pop_pointer() : () -> i64
      %11522 = arith.constant 2 : i64
      %11523 = func.call @cc_box_fixnum(%11522) : (i64) -> i64
      %11524 = func.call @cc_svset(%11484, %11523, %11521) : (i64, i64, i64) -> i64
      %11525 = func.call @stack_pop_pointer() : () -> i64
      %11526 = arith.constant 1 : i64
      %11527 = func.call @cc_box_fixnum(%11526) : (i64) -> i64
      %11528 = func.call @cc_svset(%11484, %11527, %11525) : (i64, i64, i64) -> i64
      %11529 = func.call @stack_pop_pointer() : () -> i64
      %11530 = arith.constant 0 : i64
      %11531 = func.call @cc_box_fixnum(%11530) : (i64) -> i64
      %11532 = func.call @cc_svset(%11484, %11531, %11529) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%11484) : (i64) -> ()
      %11533 = func.call @stack_pop_pointer() : () -> i64
      %11534 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%11534) : (i64) -> ()
      %11535 = func.call @stack_pop_pointer() : () -> i64
      %11536 = func.call @cc_nil_value() : () -> i64
      %11537 = func.call @cc_errorp(%11533) : (i64) -> i64
      %11538 = arith.cmpi ne, %11537, %11536 : i64
      %11539 = arith.cmpi eq, %11536, %11536 : i64
      %11540 = arith.andi %11538, %11539 : i1
      %11541 = scf.if %11540 -> (i64) {
        scf.yield %11533 : i64
      } else {
        scf.yield %11536 : i64
      }
      %11542 = func.call @cc_errorp(%11535) : (i64) -> i64
      %11543 = arith.cmpi ne, %11542, %11536 : i64
      %11544 = arith.cmpi eq, %11541, %11536 : i64
      %11545 = arith.andi %11543, %11544 : i1
      %11546 = scf.if %11545 -> (i64) {
        scf.yield %11535 : i64
      } else {
        scf.yield %11541 : i64
      }
      %11547 = arith.cmpi ne, %11546, %11536 : i64
      scf.if %11547 {
        func.call @stack_push_pointer(%11546) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11533) : (i64) -> ()
        func.call @stack_push_pointer(%11535) : (i64) -> ()
        %11548 = llvm.mlir.addressof @str895 : !llvm.ptr
        %11549 = func.call @cc_make_function_ref_const(%11548) : (!llvm.ptr) -> i64
        %11550 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%11549, %11550) : (i64, i64) -> ()
      }
      %11551 = func.call @stack_pop_pointer() : () -> i64
      %11552 = func.call @cc_numberp(%11551) : (i64) -> i64
      func.call @stack_push_pointer(%11552) : (i64) -> ()
      %11553 = func.call @stack_pop_pointer() : () -> i64
      %11554 = func.call @cc_nil_value() : () -> i64
      %11555 = func.call @cc_cons(%11553, %11554) : (i64, i64) -> i64
      %11556 = func.call @cc_not(%11555) : (i64) -> i64
      func.call @stack_push_pointer(%11556) : (i64) -> ()
      %11557 = func.call @stack_pop_pointer() : () -> i64
      %11558 = func.call @cc_nil_value() : () -> i64
      %11559 = func.call @cc_cons(%11557, %11558) : (i64, i64) -> i64
      %11560 = func.call @cc_not(%11559) : (i64) -> i64
      func.call @stack_push_pointer(%11560) : (i64) -> ()
      %11561 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11561 : i64
    }
    func.call @stack_push_pointer(%11469) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_15079495958528*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_15079495958528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_15079495958528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("ARRAY-DIMENSION0\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str6("ARRAY-DIMENSION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str11("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str16("ARRAY-DIMENSION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str17("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str23("MAKE-SEQUENCE-SIMPLE-STRING\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str24("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str25("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str26("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str35("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str40("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str43("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str48("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str53("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str54("MAKE-SEQUENCE-SIMPLE-BASE-STRING\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str55("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str56("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str57("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str71("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str74("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str79("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str83("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str84("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str85("TYPEP-MAKE-SIMPLE-ARRAY\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str86("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str90("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str91("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str99("TYPEP-MAKE-FILL-POINTER-VECTOR-NONSIMPLE\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str100("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str101("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str102("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str108("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str117("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str118("TYPEP-MAKE-FILL-POINTER-VECTOR-NONSIMPLE-VECTOR\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str119("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str120("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str123("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str125("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str126("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str127("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str134("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str135("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str136("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str137("TYPEP-MAKE-ADJUSTABLE-ARRAY\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str138("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str142("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str143("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str144("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str145("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str146("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str147("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str148("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str151("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str152("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str153("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str154("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str155("TYPEP-MAKE-ADJUSTABLE-ARRAY-NONSIMPLE\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str156("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str157("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str160("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str161("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str162("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str165("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str168("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str171("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str172("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str173("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str174("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str175("TYPEP-MAKE-ADJUSTABLE-ARRAY-NON-SIMPLE-VECTOR\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str176("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str177("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str178("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str180("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str181("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str182("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str183("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str184("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str185("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str186("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("SIMPLE-VECTOR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str188("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str193("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str194("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str195("ADJUST-ARRAY0\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str196("ADJUST-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str197("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str198("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str199("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str200("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str201("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str202("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str203("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str204("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str205("ADJUST-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str206("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str207("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str208("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str209("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str210("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str211("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str212("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str213("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str214("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str215("MAKE-ARRAY-0\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str216("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str225("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str226("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str228("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str229("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str230("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str231("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str236("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str238("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str239("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str241("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str242("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str243("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str244("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str245("MAKE-ARRAY-1\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str246("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str247("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str249("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str250("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str251("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str252("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str255("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str256("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str257("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str260("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str261("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str264("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str265("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str266("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str267("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str268("ARRAY-DISPLACEMENT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str269("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str271("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str272("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str273("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str274("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str275("MAKE-ARRAY-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str276("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str277("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str280("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str281("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str282("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str283("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str285("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str288("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str289("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str290("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str292("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str293("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str294("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str295("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str296("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str299("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str300("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str301("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str302("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str303("MAKE-ARRAY-3\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str304("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str305("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str306("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str307("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str308("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("HANDLER-CASE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str310("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str311("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str312("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str313("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str316("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str317("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str318("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str319("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str323("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str325("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str326("ARRAYP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str331("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str332("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str333("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str334("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str336("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str338("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str339("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str340("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str341("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str342("MAKE-ARRAY-4\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str343("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str344("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str345("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str346("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str348("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str349("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str350("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str351("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str352("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str353("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str354("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str355("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str356("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str357("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str358("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str359("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str360("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str361("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str362("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str363("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str364("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str365("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str366("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str367("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str368("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str369("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str370("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str371("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str372("MAKE-ARRAY-5\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str373("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str374("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str375("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str376("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str377("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str378("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str379("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str380("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str381("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str382("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str383("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str385("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str386("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str387("PLEASE-INLINE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str388("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str389("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str390("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str391("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str392("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str393("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str394("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str395("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str396("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str397("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str398("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str399("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str400("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str401("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str402("MAKE-ARRAY-6\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str403("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str404("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str406("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str407("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str408("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str409("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str410("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str411("ARRAY-ELEMENT-TYPE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str412("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str413("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str414("DISPLACED-INDEX-OFFSET\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str415("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str416("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str417("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str418("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str419("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str420("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str421("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str422("ARRAY-ELEMENT-TYPE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str423("DISPLACED-INDEX-OFFSET\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str424("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str425("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str426("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str427("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str428("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str429("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str430("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str431("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str432("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str433("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str434("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str435("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str436("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str437("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str438("AREF-NIL-ARRAY\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str439("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str440("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str441("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str443("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str445("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str446("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str447("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str448("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str449("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str451("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str452("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str453("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str454("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str455("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str456("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str457("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str458("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str459("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str460("SETF-AREF-NIL-ARRAY\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str461("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str462("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str463("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str464("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str465("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str466("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str467("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str469("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str470("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str471("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str473("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str475("%FN%(setf COMMON-LISP::AREF)\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str476("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str477("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str478("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str479("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str480("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str481("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str482("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str483("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str484("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str485("FILL-POINTER-NIL-ARRAY\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str486("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str487("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str488("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str489("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str490("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str491("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str492("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str493("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str494("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str495("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str496("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str497("make-array\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str498("FILL-POINTER\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str499("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str500("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str501("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str502("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str503("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str504("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str505("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str506("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str507("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str508("SIMPLE-ARRAY-OUT-OF-BOUNDS-MESSAGE\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str509("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str510("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str511("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str512("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str513("HANDLER-CASE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str514("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str515("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str516("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str517("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str518("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str519("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str520("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str521("SPEED\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str522("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str523("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str524("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str525("AREF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str526("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str527("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str528("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str529("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str530("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str531("nada\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str532("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str533("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str534("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str535("PRINC-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str536("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str538("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str539("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str541("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str542("expected 0-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str543("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str544("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str545("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("(INTEGER 0 (3))\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str547("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str548("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str549("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str550("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str551("nada\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str552("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str553("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str554("PRINC-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str555("expected 0-2\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str556("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str557("(INTEGER 0 (3))\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str558("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str559("#:%%DYN-CELL-15079495958550-E\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str560("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str561("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str562("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str563("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str564("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str565("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str566("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str567("COMPLEX-DISPLACEMENT-ASV\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str568("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str569("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str570("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str571("DISPLACED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str572("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str573("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str574("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str575("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str576("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str577("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str578("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str579("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str580("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str581("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str582("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str583("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str584("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str585("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str586("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str587("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str588("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str589("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str590("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str591("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str592("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str593("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str594("DISPLACED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str595("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str596("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str597("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str598("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str599("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str600("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str601("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str602("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str603("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str604("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str605("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str606("DISPLACED-TO\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str607("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str608("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str609("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str610("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str611("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str612("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str613("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str614("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str615("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str616("ARRAY-TOO-BIG\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str617("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str618("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str619("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str620("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str621("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str622("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str623("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str624("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str625("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str626("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str627("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str628("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str629("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str630("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str631("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str632("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str633("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str634("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str635("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str636("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str637("ARRAY-TOO-BIG-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str638("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str639("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str640("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str641("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str642("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str643("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str644("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str645("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str646("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str647("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str648("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str649("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str650("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str651("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str652("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str655("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str656("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str657("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str658("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str659("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str660("ARRAY-WRONG-DIMENSION-LIST-A\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str661("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str662("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str663("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str664("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str665("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str666("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str667("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str668("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str669("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str670("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str671("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str672("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str673("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str674("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str675("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str676("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str677("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str678("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str679("ARRAY-WRONG-DIMENSION-LIST-B\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str680("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str681("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str682("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str683("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str684("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str685("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str686("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str687("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str688("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str689("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str690("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str691("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str692("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str693("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str694("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str695("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str696("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str697("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str698("ARRAY-WRONG-DIMENSION-LIST-C\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str699("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str700("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str701("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str702("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str703("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str704("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str705("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str706("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str707("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str708("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str709("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str710("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str711("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str712("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str713("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str714("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str715("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str716("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str717("ARRAY-TOO-BIG-NOT-INLINE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str718("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str719("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str720("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str721("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str722("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str723("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str724("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str725("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str726("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str727("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str729("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str730("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str731("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str732("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str733("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str734("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str735("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str736("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str737("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str738("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str739("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str740("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str741("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str742("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str743("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str744("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str745("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str746("ARRAY-TOO-BIG-LIST-NOT-INLINE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str747("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str748("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str749("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str750("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str751("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str752("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str753("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str754("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str755("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str756("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str757("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str758("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str759("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str760("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str761("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str762("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str763("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str764("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str765("ARRAY-TOTAL-SIZE-LIMIT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str766("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str767("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str768("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str769("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str770("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str771("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str772("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str773("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str774("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str775("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str776("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str777("ARRAY-WRONG-DIMENSION-LIST-A-NOT-INLINE\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str778("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str779("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str780("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str781("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str782("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str783("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str784("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str785("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str786("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str787("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str788("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str789("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str790("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str791("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str792("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str793("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str794("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str795("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str796("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str797("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str798("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str799("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str800("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str801("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str802("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str803("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str804("ARRAY-WRONG-DIMENSION-LIST-B-NOT-INLINE\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str805("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str806("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str807("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str808("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str809("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str810("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str811("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str812("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str813("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str814("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str815("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str816("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str817("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str818("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str819("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str820("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str821("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str822("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str823("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str824("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str825("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str826("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str827("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str828("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str829("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str830("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str831("ARRAY-WRONG-DIMENSION-LIST-C-NOT-INLINE\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str832("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str833("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str834("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str835("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str836("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str837("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str838("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str839("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str840("NOTINLINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str841("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str842("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str843("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str844("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str845("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str846("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str847("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str848("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str849("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str850("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str851("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str852("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str853("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str854("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str855("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str856("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str857("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str858("ISSUE-1253\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str859("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str860("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str861("NUMBERP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str862("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str863("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str864("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str865("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str866("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str867("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str868("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str869("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str870("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str871("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str872("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str873("ISSUE-1253-A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str874("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str875("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str876("NUMBERP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str877("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str878("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str879("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str880("BIT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str881("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str882("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str883("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str884("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str885("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str886("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str887("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str888("ISSUE-1253-B\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str889("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str890("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str891("NUMBERP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str892("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str893("SBIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str894("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str895("SBIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str896("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str897("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str898("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str899("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str900("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str901("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str902("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str903("*__MLIR_BLOCK_RETFLAG_15079495958528*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str904("*__MLIR_BLOCK_RETMVLIST_15079495958528*\00") : !llvm.array<40 x i8>
}
