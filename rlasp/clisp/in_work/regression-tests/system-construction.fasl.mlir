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
      %77 = arith.constant 21 : i64
      %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
      %79 = llvm.mlir.addressof @str9 : !llvm.ptr
      %80 = arith.constant 11 : i64
      %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
      %82 = func.call @cc_intern(%78, %81) : (i64, i64) -> i64
      %83 = func.call @cc_nil_value() : () -> i64
      %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
      %85 = func.call @cc_values_pack(%84) : (i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      %86 = llvm.mlir.addressof @str10 : !llvm.ptr
      %87 = arith.constant 9 : i64
      %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %89 = llvm.mlir.addressof @str11 : !llvm.ptr
      %90 = arith.constant 11 : i64
      %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
      %92 = llvm.mlir.addressof @str12 : !llvm.ptr
      %93 = arith.constant 7 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = func.call @cc_intern(%91, %94) : (i64, i64) -> i64
      %96 = func.call @cc_nil_value() : () -> i64
      %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
      %98 = func.call @cc_values_pack(%97) : (i64) -> i64
      func.call @stack_push_pointer(%95) : (i64) -> ()
      %99 = llvm.mlir.addressof @str13 : !llvm.ptr
      %100 = arith.constant 12 : i64
      %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %102 = func.call @stack_pop_pointer() : () -> i64
      %103 = func.call @stack_pop_pointer() : () -> i64
      %104 = func.call @cc_cons(%103, %102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%104) : (i64) -> ()
      %105 = func.call @stack_pop_pointer() : () -> i64
      %106 = func.call @stack_pop_pointer() : () -> i64
      %107 = func.call @cc_cons(%106, %105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = func.call @cc_cons(%109, %108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%110) : (i64) -> ()
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @stack_pop_pointer() : () -> i64
      %113 = func.call @cc_cons(%112, %111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %114 = func.call @stack_pop_pointer() : () -> i64
      %115 = func.call @stack_pop_pointer() : () -> i64
      %116 = func.call @cc_cons(%115, %114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      %117 = func.call @stack_pop_pointer() : () -> i64
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = func.call @cc_cons(%118, %117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%119) : (i64) -> ()
      %120 = func.call @stack_pop_pointer() : () -> i64
      %177 = arith.constant 96094591647745 : i64
      %178 = arith.constant 0 : i64
      %179 = func.call @cc_make_closure(%177, %178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%179) : (i64) -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = llvm.mlir.addressof @str20 : !llvm.ptr
      %182 = arith.constant 7 : i64
      %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = func.call @cc_cons(%185, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %187 = func.call @stack_pop_pointer() : () -> i64
      %188 = llvm.mlir.addressof @str21 : !llvm.ptr
      %189 = arith.constant 11 : i64
      %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
      %191 = llvm.mlir.addressof @str22 : !llvm.ptr
      %192 = arith.constant 7 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = func.call @cc_intern(%190, %193) : (i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_values_pack(%196) : (i64) -> i64
      func.call @stack_push_pointer(%194) : (i64) -> ()
      %198 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %199 = func.call @stack_pop_pointer() : () -> i64
      %200 = llvm.mlir.addressof @str23 : !llvm.ptr
      %201 = arith.constant 4 : i64
      %202 = func.call @cc_make_string(%200, %201) : (!llvm.ptr, i64) -> i64
      %203 = llvm.mlir.addressof @str24 : !llvm.ptr
      %204 = arith.constant 7 : i64
      %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
      %206 = func.call @cc_intern(%202, %205) : (i64, i64) -> i64
      %207 = func.call @cc_nil_value() : () -> i64
      %208 = func.call @cc_cons(%206, %207) : (i64, i64) -> i64
      %209 = func.call @cc_values_pack(%208) : (i64) -> i64
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %210 = func.call @stack_pop_pointer() : () -> i64
      %211 = llvm.mlir.addressof @str25 : !llvm.ptr
      %212 = arith.constant 6 : i64
      %213 = func.call @cc_make_string(%211, %212) : (!llvm.ptr, i64) -> i64
      %214 = func.call @cc_nil_value() : () -> i64
      %215 = func.call @cc_intern(%213, %214) : (i64, i64) -> i64
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_cons(%215, %216) : (i64, i64) -> i64
      %218 = func.call @cc_values_pack(%217) : (i64) -> i64
      func.call @stack_push_pointer(%215) : (i64) -> ()
      %219 = func.call @stack_pop_pointer() : () -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_errorp(%65) : (i64) -> i64
      %222 = arith.cmpi ne, %221, %220 : i64
      %223 = arith.cmpi eq, %220, %220 : i64
      %224 = arith.andi %222, %223 : i1
      %225 = scf.if %224 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %220 : i64
      }
      %226 = func.call @cc_errorp(%120) : (i64) -> i64
      %227 = arith.cmpi ne, %226, %220 : i64
      %228 = arith.cmpi eq, %225, %220 : i64
      %229 = arith.andi %227, %228 : i1
      %230 = scf.if %229 -> (i64) {
        scf.yield %120 : i64
      } else {
        scf.yield %225 : i64
      }
      %231 = func.call @cc_errorp(%180) : (i64) -> i64
      %232 = arith.cmpi ne, %231, %220 : i64
      %233 = arith.cmpi eq, %230, %220 : i64
      %234 = arith.andi %232, %233 : i1
      %235 = scf.if %234 -> (i64) {
        scf.yield %180 : i64
      } else {
        scf.yield %230 : i64
      }
      %236 = func.call @cc_errorp(%187) : (i64) -> i64
      %237 = arith.cmpi ne, %236, %220 : i64
      %238 = arith.cmpi eq, %235, %220 : i64
      %239 = arith.andi %237, %238 : i1
      %240 = scf.if %239 -> (i64) {
        scf.yield %187 : i64
      } else {
        scf.yield %235 : i64
      }
      %241 = func.call @cc_errorp(%198) : (i64) -> i64
      %242 = arith.cmpi ne, %241, %220 : i64
      %243 = arith.cmpi eq, %240, %220 : i64
      %244 = arith.andi %242, %243 : i1
      %245 = scf.if %244 -> (i64) {
        scf.yield %198 : i64
      } else {
        scf.yield %240 : i64
      }
      %246 = func.call @cc_errorp(%199) : (i64) -> i64
      %247 = arith.cmpi ne, %246, %220 : i64
      %248 = arith.cmpi eq, %245, %220 : i64
      %249 = arith.andi %247, %248 : i1
      %250 = scf.if %249 -> (i64) {
        scf.yield %199 : i64
      } else {
        scf.yield %245 : i64
      }
      %251 = func.call @cc_errorp(%210) : (i64) -> i64
      %252 = arith.cmpi ne, %251, %220 : i64
      %253 = arith.cmpi eq, %250, %220 : i64
      %254 = arith.andi %252, %253 : i1
      %255 = scf.if %254 -> (i64) {
        scf.yield %210 : i64
      } else {
        scf.yield %250 : i64
      }
      %256 = func.call @cc_errorp(%219) : (i64) -> i64
      %257 = arith.cmpi ne, %256, %220 : i64
      %258 = arith.cmpi eq, %255, %220 : i64
      %259 = arith.andi %257, %258 : i1
      %260 = scf.if %259 -> (i64) {
        scf.yield %219 : i64
      } else {
        scf.yield %255 : i64
      }
      %261 = arith.cmpi ne, %260, %220 : i64
      scf.if %261 {
        func.call @stack_push_pointer(%260) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%120) : (i64) -> ()
        func.call @stack_push_pointer(%180) : (i64) -> ()
        func.call @stack_push_pointer(%187) : (i64) -> ()
        func.call @stack_push_pointer(%198) : (i64) -> ()
        func.call @stack_push_pointer(%199) : (i64) -> ()
        func.call @stack_push_pointer(%210) : (i64) -> ()
        func.call @stack_push_pointer(%219) : (i64) -> ()
        %262 = llvm.mlir.addressof @str26 : !llvm.ptr
        %263 = func.call @cc_make_function_ref_const(%262) : (!llvm.ptr) -> i64
        %264 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%263, %264) : (i64, i64) -> ()
      }
      %265 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %265 : i64
    }
    %266 = func.call @cc_nil_value() : () -> i64
    %267 = func.call @cc_errorp(%56) : (i64) -> i64
    %268 = arith.cmpi ne, %267, %266 : i64
    %269 = scf.if %268 -> (i64) {
      scf.yield %56 : i64
    } else {
      %270 = llvm.mlir.addressof @str27 : !llvm.ptr
      %271 = arith.constant 21 : i64
      %272 = func.call @cc_make_string(%270, %271) : (!llvm.ptr, i64) -> i64
      %273 = func.call @cc_nil_value() : () -> i64
      %274 = func.call @cc_intern(%272, %273) : (i64, i64) -> i64
      %275 = func.call @cc_nil_value() : () -> i64
      %276 = func.call @cc_cons(%274, %275) : (i64, i64) -> i64
      %277 = func.call @cc_values_pack(%276) : (i64) -> i64
      func.call @stack_push_pointer(%274) : (i64) -> ()
      %278 = func.call @stack_pop_pointer() : () -> i64
      %279 = llvm.mlir.addressof @str28 : !llvm.ptr
      %280 = arith.constant 3 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = func.call @cc_intern(%281, %282) : (i64, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_cons(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_values_pack(%285) : (i64) -> i64
      func.call @stack_push_pointer(%283) : (i64) -> ()
      %287 = llvm.mlir.addressof @str29 : !llvm.ptr
      %288 = arith.constant 3 : i64
      %289 = func.call @cc_make_string(%287, %288) : (!llvm.ptr, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_intern(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_cons(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_values_pack(%293) : (i64) -> i64
      func.call @stack_push_pointer(%291) : (i64) -> ()
      %295 = llvm.mlir.addressof @str30 : !llvm.ptr
      %296 = arith.constant 3 : i64
      %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_intern(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_values_pack(%301) : (i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      %303 = llvm.mlir.addressof @str31 : !llvm.ptr
      %304 = arith.constant 23 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = llvm.mlir.addressof @str32 : !llvm.ptr
      %307 = arith.constant 3 : i64
      %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
      %309 = func.call @cc_intern(%305, %308) : (i64, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_values_pack(%311) : (i64) -> i64
      func.call @stack_push_pointer(%309) : (i64) -> ()
      %313 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %314 = func.call @stack_pop_pointer() : () -> i64
      %315 = func.call @stack_pop_pointer() : () -> i64
      %316 = func.call @cc_cons(%315, %314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%316) : (i64) -> ()
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @cc_cons(%318, %317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %320 = llvm.mlir.addressof @str33 : !llvm.ptr
      %321 = arith.constant 4 : i64
      %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
      %323 = func.call @cc_nil_value() : () -> i64
      %324 = func.call @cc_intern(%322, %323) : (i64, i64) -> i64
      %325 = func.call @cc_nil_value() : () -> i64
      %326 = func.call @cc_cons(%324, %325) : (i64, i64) -> i64
      %327 = func.call @cc_values_pack(%326) : (i64) -> i64
      func.call @stack_push_pointer(%324) : (i64) -> ()
      %328 = llvm.mlir.addressof @str34 : !llvm.ptr
      %329 = arith.constant 44 : i64
      %330 = func.call @cc_make_string(%328, %329) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%330) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %331 = func.call @stack_pop_pointer() : () -> i64
      %332 = func.call @stack_pop_pointer() : () -> i64
      %333 = func.call @cc_cons(%332, %331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%333) : (i64) -> ()
      %334 = func.call @stack_pop_pointer() : () -> i64
      %335 = func.call @stack_pop_pointer() : () -> i64
      %336 = func.call @cc_cons(%335, %334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%336) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %337 = func.call @stack_pop_pointer() : () -> i64
      %338 = func.call @stack_pop_pointer() : () -> i64
      %339 = func.call @cc_cons(%338, %337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%339) : (i64) -> ()
      %340 = func.call @stack_pop_pointer() : () -> i64
      %341 = func.call @stack_pop_pointer() : () -> i64
      %342 = func.call @cc_cons(%341, %340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%342) : (i64) -> ()
      %343 = llvm.mlir.addressof @str35 : !llvm.ptr
      %344 = arith.constant 3 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = func.call @cc_nil_value() : () -> i64
      %347 = func.call @cc_intern(%345, %346) : (i64, i64) -> i64
      %348 = func.call @cc_nil_value() : () -> i64
      %349 = func.call @cc_cons(%347, %348) : (i64, i64) -> i64
      %350 = func.call @cc_values_pack(%349) : (i64) -> i64
      func.call @stack_push_pointer(%347) : (i64) -> ()
      %351 = llvm.mlir.addressof @str36 : !llvm.ptr
      %352 = arith.constant 4 : i64
      %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
      %354 = func.call @cc_nil_value() : () -> i64
      %355 = func.call @cc_intern(%353, %354) : (i64, i64) -> i64
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
      %358 = func.call @cc_values_pack(%357) : (i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %359 = llvm.mlir.addressof @str37 : !llvm.ptr
      %360 = arith.constant 12 : i64
      %361 = func.call @cc_make_string(%359, %360) : (!llvm.ptr, i64) -> i64
      %362 = llvm.mlir.addressof @str38 : !llvm.ptr
      %363 = arith.constant 11 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = func.call @cc_intern(%361, %364) : (i64, i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_cons(%365, %366) : (i64, i64) -> i64
      %368 = func.call @cc_values_pack(%367) : (i64) -> i64
      func.call @stack_push_pointer(%365) : (i64) -> ()
      %369 = llvm.mlir.addressof @str39 : !llvm.ptr
      %370 = arith.constant 4 : i64
      %371 = func.call @cc_make_string(%369, %370) : (!llvm.ptr, i64) -> i64
      %372 = func.call @cc_nil_value() : () -> i64
      %373 = func.call @cc_intern(%371, %372) : (i64, i64) -> i64
      %374 = func.call @cc_nil_value() : () -> i64
      %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
      %376 = func.call @cc_values_pack(%375) : (i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %377 = llvm.mlir.addressof @str40 : !llvm.ptr
      %378 = arith.constant 11 : i64
      %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
      %380 = llvm.mlir.addressof @str41 : !llvm.ptr
      %381 = arith.constant 7 : i64
      %382 = func.call @cc_make_string(%380, %381) : (!llvm.ptr, i64) -> i64
      %383 = func.call @cc_intern(%379, %382) : (i64, i64) -> i64
      %384 = func.call @cc_nil_value() : () -> i64
      %385 = func.call @cc_cons(%383, %384) : (i64, i64) -> i64
      %386 = func.call @cc_values_pack(%385) : (i64) -> i64
      func.call @stack_push_pointer(%383) : (i64) -> ()
      %387 = llvm.mlir.addressof @str42 : !llvm.ptr
      %388 = arith.constant 13 : i64
      %389 = func.call @cc_make_string(%387, %388) : (!llvm.ptr, i64) -> i64
      %390 = llvm.mlir.addressof @str43 : !llvm.ptr
      %391 = arith.constant 11 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_intern(%389, %392) : (i64, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_values_pack(%395) : (i64) -> i64
      func.call @stack_push_pointer(%393) : (i64) -> ()
      %397 = llvm.mlir.addressof @str44 : !llvm.ptr
      %398 = arith.constant 4 : i64
      %399 = func.call @cc_make_string(%397, %398) : (!llvm.ptr, i64) -> i64
      %400 = llvm.mlir.addressof @str45 : !llvm.ptr
      %401 = arith.constant 7 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = func.call @cc_intern(%399, %402) : (i64, i64) -> i64
      %404 = func.call @cc_nil_value() : () -> i64
      %405 = func.call @cc_cons(%403, %404) : (i64, i64) -> i64
      %406 = func.call @cc_values_pack(%405) : (i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      %407 = llvm.mlir.addressof @str46 : !llvm.ptr
      %408 = arith.constant 7 : i64
      %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%409) : (i64) -> ()
      %410 = llvm.mlir.addressof @str47 : !llvm.ptr
      %411 = arith.constant 8 : i64
      %412 = func.call @cc_make_string(%410, %411) : (!llvm.ptr, i64) -> i64
      %413 = llvm.mlir.addressof @str48 : !llvm.ptr
      %414 = arith.constant 7 : i64
      %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
      %416 = func.call @cc_intern(%412, %415) : (i64, i64) -> i64
      %417 = func.call @cc_nil_value() : () -> i64
      %418 = func.call @cc_cons(%416, %417) : (i64, i64) -> i64
      %419 = func.call @cc_values_pack(%418) : (i64) -> i64
      func.call @stack_push_pointer(%416) : (i64) -> ()
      %420 = llvm.mlir.addressof @str49 : !llvm.ptr
      %421 = arith.constant 4 : i64
      %422 = func.call @cc_make_string(%420, %421) : (!llvm.ptr, i64) -> i64
      %423 = func.call @cc_nil_value() : () -> i64
      %424 = func.call @cc_intern(%422, %423) : (i64, i64) -> i64
      %425 = func.call @cc_nil_value() : () -> i64
      %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
      %427 = func.call @cc_values_pack(%426) : (i64) -> i64
      func.call @stack_push_pointer(%424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_cons(%429, %428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%430) : (i64) -> ()
      %431 = func.call @stack_pop_pointer() : () -> i64
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @cc_cons(%432, %431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%433) : (i64) -> ()
      %434 = func.call @stack_pop_pointer() : () -> i64
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_cons(%435, %434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%436) : (i64) -> ()
      %437 = func.call @stack_pop_pointer() : () -> i64
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @cc_cons(%438, %437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %440 = func.call @stack_pop_pointer() : () -> i64
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @cc_cons(%441, %440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%442) : (i64) -> ()
      %443 = llvm.mlir.addressof @str50 : !llvm.ptr
      %444 = arith.constant 7 : i64
      %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
      %446 = llvm.mlir.addressof @str51 : !llvm.ptr
      %447 = arith.constant 7 : i64
      %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
      %449 = func.call @cc_intern(%445, %448) : (i64, i64) -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
      %452 = func.call @cc_values_pack(%451) : (i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %453 = llvm.mlir.addressof @str52 : !llvm.ptr
      %454 = arith.constant 5 : i64
      %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
      %456 = llvm.mlir.addressof @str53 : !llvm.ptr
      %457 = arith.constant 7 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = func.call @cc_intern(%455, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %463 = func.call @stack_pop_pointer() : () -> i64
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%464, %463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @cc_cons(%467, %466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %469 = func.call @stack_pop_pointer() : () -> i64
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @cc_cons(%470, %469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @cc_cons(%473, %472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%474) : (i64) -> ()
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%477) : (i64) -> ()
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
      func.call @stack_push_nil() : () -> ()
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @cc_cons(%488, %487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%489) : (i64) -> ()
      %490 = func.call @stack_pop_pointer() : () -> i64
      %491 = func.call @stack_pop_pointer() : () -> i64
      %492 = func.call @cc_cons(%491, %490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %493 = func.call @stack_pop_pointer() : () -> i64
      %494 = func.call @stack_pop_pointer() : () -> i64
      %495 = func.call @cc_cons(%494, %493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      %496 = llvm.mlir.addressof @str54 : !llvm.ptr
      %497 = arith.constant 3 : i64
      %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
      %499 = llvm.mlir.addressof @str55 : !llvm.ptr
      %500 = arith.constant 11 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = func.call @cc_intern(%498, %501) : (i64, i64) -> i64
      %503 = func.call @cc_nil_value() : () -> i64
      %504 = func.call @cc_cons(%502, %503) : (i64, i64) -> i64
      %505 = func.call @cc_values_pack(%504) : (i64) -> i64
      func.call @stack_push_pointer(%502) : (i64) -> ()
      %506 = llvm.mlir.addressof @str56 : !llvm.ptr
      %507 = arith.constant 10 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = llvm.mlir.addressof @str57 : !llvm.ptr
      %510 = arith.constant 11 : i64
      %511 = func.call @cc_make_string(%509, %510) : (!llvm.ptr, i64) -> i64
      %512 = func.call @cc_intern(%508, %511) : (i64, i64) -> i64
      %513 = func.call @cc_nil_value() : () -> i64
      %514 = func.call @cc_cons(%512, %513) : (i64, i64) -> i64
      %515 = func.call @cc_values_pack(%514) : (i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
      %516 = llvm.mlir.addressof @str58 : !llvm.ptr
      %517 = arith.constant 4 : i64
      %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
      %519 = func.call @cc_nil_value() : () -> i64
      %520 = func.call @cc_intern(%518, %519) : (i64, i64) -> i64
      %521 = func.call @cc_nil_value() : () -> i64
      %522 = func.call @cc_cons(%520, %521) : (i64, i64) -> i64
      %523 = func.call @cc_values_pack(%522) : (i64) -> i64
      func.call @stack_push_pointer(%520) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %524 = func.call @stack_pop_pointer() : () -> i64
      %525 = func.call @stack_pop_pointer() : () -> i64
      %526 = func.call @cc_cons(%525, %524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%526) : (i64) -> ()
      %527 = func.call @stack_pop_pointer() : () -> i64
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @cc_cons(%528, %527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%529) : (i64) -> ()
      %530 = llvm.mlir.addressof @str59 : !llvm.ptr
      %531 = arith.constant 12 : i64
      %532 = func.call @cc_make_string(%530, %531) : (!llvm.ptr, i64) -> i64
      %533 = llvm.mlir.addressof @str60 : !llvm.ptr
      %534 = arith.constant 11 : i64
      %535 = func.call @cc_make_string(%533, %534) : (!llvm.ptr, i64) -> i64
      %536 = func.call @cc_intern(%532, %535) : (i64, i64) -> i64
      %537 = func.call @cc_nil_value() : () -> i64
      %538 = func.call @cc_cons(%536, %537) : (i64, i64) -> i64
      %539 = func.call @cc_values_pack(%538) : (i64) -> i64
      func.call @stack_push_pointer(%536) : (i64) -> ()
      %540 = llvm.mlir.addressof @str61 : !llvm.ptr
      %541 = arith.constant 13 : i64
      %542 = func.call @cc_make_string(%540, %541) : (!llvm.ptr, i64) -> i64
      %543 = llvm.mlir.addressof @str62 : !llvm.ptr
      %544 = arith.constant 11 : i64
      %545 = func.call @cc_make_string(%543, %544) : (!llvm.ptr, i64) -> i64
      %546 = func.call @cc_intern(%542, %545) : (i64, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_cons(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_values_pack(%548) : (i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      %550 = llvm.mlir.addressof @str63 : !llvm.ptr
      %551 = arith.constant 4 : i64
      %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
      %553 = func.call @cc_nil_value() : () -> i64
      %554 = func.call @cc_intern(%552, %553) : (i64, i64) -> i64
      %555 = func.call @cc_nil_value() : () -> i64
      %556 = func.call @cc_cons(%554, %555) : (i64, i64) -> i64
      %557 = func.call @cc_values_pack(%556) : (i64) -> i64
      func.call @stack_push_pointer(%554) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @stack_pop_pointer() : () -> i64
      %560 = func.call @cc_cons(%559, %558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%560) : (i64) -> ()
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @stack_pop_pointer() : () -> i64
      %563 = func.call @cc_cons(%562, %561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%563) : (i64) -> ()
      %564 = llvm.mlir.addressof @str64 : !llvm.ptr
      %565 = arith.constant 7 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%566) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = func.call @stack_pop_pointer() : () -> i64
      %569 = func.call @cc_cons(%568, %567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%569) : (i64) -> ()
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @cc_cons(%571, %570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%572) : (i64) -> ()
      %573 = func.call @stack_pop_pointer() : () -> i64
      %574 = func.call @stack_pop_pointer() : () -> i64
      %575 = func.call @cc_cons(%574, %573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%575) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %576 = func.call @stack_pop_pointer() : () -> i64
      %577 = func.call @stack_pop_pointer() : () -> i64
      %578 = func.call @cc_cons(%577, %576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = func.call @stack_pop_pointer() : () -> i64
      %581 = func.call @cc_cons(%580, %579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%581) : (i64) -> ()
      %582 = func.call @stack_pop_pointer() : () -> i64
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = func.call @cc_cons(%583, %582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%584) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %585 = func.call @stack_pop_pointer() : () -> i64
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = func.call @cc_cons(%586, %585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      %588 = func.call @stack_pop_pointer() : () -> i64
      %589 = func.call @stack_pop_pointer() : () -> i64
      %590 = func.call @cc_cons(%589, %588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%590) : (i64) -> ()
      %591 = func.call @stack_pop_pointer() : () -> i64
      %592 = func.call @stack_pop_pointer() : () -> i64
      %593 = func.call @cc_cons(%592, %591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%593) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %594 = func.call @stack_pop_pointer() : () -> i64
      %595 = func.call @stack_pop_pointer() : () -> i64
      %596 = func.call @cc_cons(%595, %594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
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
      %609 = func.call @stack_pop_pointer() : () -> i64
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @cc_cons(%610, %609) : (i64, i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %612 = func.call @stack_pop_pointer() : () -> i64
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @cc_cons(%613, %612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %615 = func.call @stack_pop_pointer() : () -> i64
      %840 = arith.constant 96094591647746 : i64
      %841 = arith.constant 0 : i64
      %842 = func.call @cc_make_closure(%840, %841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%842) : (i64) -> ()
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = llvm.mlir.addressof @str87 : !llvm.ptr
      %845 = arith.constant 1 : i64
      %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
      %847 = func.call @cc_nil_value() : () -> i64
      %848 = func.call @cc_intern(%846, %847) : (i64, i64) -> i64
      %849 = func.call @cc_nil_value() : () -> i64
      %850 = func.call @cc_cons(%848, %849) : (i64, i64) -> i64
      %851 = func.call @cc_values_pack(%850) : (i64) -> i64
      func.call @stack_push_pointer(%848) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %852 = func.call @stack_pop_pointer() : () -> i64
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @cc_cons(%853, %852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%854) : (i64) -> ()
      %855 = func.call @stack_pop_pointer() : () -> i64
      %856 = llvm.mlir.addressof @str88 : !llvm.ptr
      %857 = arith.constant 11 : i64
      %858 = func.call @cc_make_string(%856, %857) : (!llvm.ptr, i64) -> i64
      %859 = llvm.mlir.addressof @str89 : !llvm.ptr
      %860 = arith.constant 7 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = func.call @cc_intern(%858, %861) : (i64, i64) -> i64
      %863 = func.call @cc_nil_value() : () -> i64
      %864 = func.call @cc_cons(%862, %863) : (i64, i64) -> i64
      %865 = func.call @cc_values_pack(%864) : (i64) -> i64
      func.call @stack_push_pointer(%862) : (i64) -> ()
      %866 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %867 = func.call @stack_pop_pointer() : () -> i64
      %868 = llvm.mlir.addressof @str90 : !llvm.ptr
      %869 = arith.constant 4 : i64
      %870 = func.call @cc_make_string(%868, %869) : (!llvm.ptr, i64) -> i64
      %871 = llvm.mlir.addressof @str91 : !llvm.ptr
      %872 = arith.constant 7 : i64
      %873 = func.call @cc_make_string(%871, %872) : (!llvm.ptr, i64) -> i64
      %874 = func.call @cc_intern(%870, %873) : (i64, i64) -> i64
      %875 = func.call @cc_nil_value() : () -> i64
      %876 = func.call @cc_cons(%874, %875) : (i64, i64) -> i64
      %877 = func.call @cc_values_pack(%876) : (i64) -> i64
      func.call @stack_push_pointer(%874) : (i64) -> ()
      %878 = func.call @stack_pop_pointer() : () -> i64
      %879 = llvm.mlir.addressof @str92 : !llvm.ptr
      %880 = arith.constant 6 : i64
      %881 = func.call @cc_make_string(%879, %880) : (!llvm.ptr, i64) -> i64
      %882 = func.call @cc_nil_value() : () -> i64
      %883 = func.call @cc_intern(%881, %882) : (i64, i64) -> i64
      %884 = func.call @cc_nil_value() : () -> i64
      %885 = func.call @cc_cons(%883, %884) : (i64, i64) -> i64
      %886 = func.call @cc_values_pack(%885) : (i64) -> i64
      func.call @stack_push_pointer(%883) : (i64) -> ()
      %887 = func.call @stack_pop_pointer() : () -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_errorp(%278) : (i64) -> i64
      %890 = arith.cmpi ne, %889, %888 : i64
      %891 = arith.cmpi eq, %888, %888 : i64
      %892 = arith.andi %890, %891 : i1
      %893 = scf.if %892 -> (i64) {
        scf.yield %278 : i64
      } else {
        scf.yield %888 : i64
      }
      %894 = func.call @cc_errorp(%615) : (i64) -> i64
      %895 = arith.cmpi ne, %894, %888 : i64
      %896 = arith.cmpi eq, %893, %888 : i64
      %897 = arith.andi %895, %896 : i1
      %898 = scf.if %897 -> (i64) {
        scf.yield %615 : i64
      } else {
        scf.yield %893 : i64
      }
      %899 = func.call @cc_errorp(%843) : (i64) -> i64
      %900 = arith.cmpi ne, %899, %888 : i64
      %901 = arith.cmpi eq, %898, %888 : i64
      %902 = arith.andi %900, %901 : i1
      %903 = scf.if %902 -> (i64) {
        scf.yield %843 : i64
      } else {
        scf.yield %898 : i64
      }
      %904 = func.call @cc_errorp(%855) : (i64) -> i64
      %905 = arith.cmpi ne, %904, %888 : i64
      %906 = arith.cmpi eq, %903, %888 : i64
      %907 = arith.andi %905, %906 : i1
      %908 = scf.if %907 -> (i64) {
        scf.yield %855 : i64
      } else {
        scf.yield %903 : i64
      }
      %909 = func.call @cc_errorp(%866) : (i64) -> i64
      %910 = arith.cmpi ne, %909, %888 : i64
      %911 = arith.cmpi eq, %908, %888 : i64
      %912 = arith.andi %910, %911 : i1
      %913 = scf.if %912 -> (i64) {
        scf.yield %866 : i64
      } else {
        scf.yield %908 : i64
      }
      %914 = func.call @cc_errorp(%867) : (i64) -> i64
      %915 = arith.cmpi ne, %914, %888 : i64
      %916 = arith.cmpi eq, %913, %888 : i64
      %917 = arith.andi %915, %916 : i1
      %918 = scf.if %917 -> (i64) {
        scf.yield %867 : i64
      } else {
        scf.yield %913 : i64
      }
      %919 = func.call @cc_errorp(%878) : (i64) -> i64
      %920 = arith.cmpi ne, %919, %888 : i64
      %921 = arith.cmpi eq, %918, %888 : i64
      %922 = arith.andi %920, %921 : i1
      %923 = scf.if %922 -> (i64) {
        scf.yield %878 : i64
      } else {
        scf.yield %918 : i64
      }
      %924 = func.call @cc_errorp(%887) : (i64) -> i64
      %925 = arith.cmpi ne, %924, %888 : i64
      %926 = arith.cmpi eq, %923, %888 : i64
      %927 = arith.andi %925, %926 : i1
      %928 = scf.if %927 -> (i64) {
        scf.yield %887 : i64
      } else {
        scf.yield %923 : i64
      }
      %929 = arith.cmpi ne, %928, %888 : i64
      scf.if %929 {
        func.call @stack_push_pointer(%928) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%278) : (i64) -> ()
        func.call @stack_push_pointer(%615) : (i64) -> ()
        func.call @stack_push_pointer(%843) : (i64) -> ()
        func.call @stack_push_pointer(%855) : (i64) -> ()
        func.call @stack_push_pointer(%866) : (i64) -> ()
        func.call @stack_push_pointer(%867) : (i64) -> ()
        func.call @stack_push_pointer(%878) : (i64) -> ()
        func.call @stack_push_pointer(%887) : (i64) -> ()
        %930 = llvm.mlir.addressof @str93 : !llvm.ptr
        %931 = func.call @cc_make_function_ref_const(%930) : (!llvm.ptr) -> i64
        %932 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%931, %932) : (i64, i64) -> ()
      }
      %933 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %933 : i64
    }
    %934 = func.call @cc_nil_value() : () -> i64
    %935 = func.call @cc_errorp(%269) : (i64) -> i64
    %936 = arith.cmpi ne, %935, %934 : i64
    %937 = scf.if %936 -> (i64) {
      scf.yield %269 : i64
    } else {
      %938 = llvm.mlir.addressof @str94 : !llvm.ptr
      %939 = arith.constant 19 : i64
      %940 = func.call @cc_make_string(%938, %939) : (!llvm.ptr, i64) -> i64
      %941 = func.call @cc_nil_value() : () -> i64
      %942 = func.call @cc_intern(%940, %941) : (i64, i64) -> i64
      %943 = func.call @cc_nil_value() : () -> i64
      %944 = func.call @cc_cons(%942, %943) : (i64, i64) -> i64
      %945 = func.call @cc_values_pack(%944) : (i64) -> i64
      func.call @stack_push_pointer(%942) : (i64) -> ()
      %946 = func.call @stack_pop_pointer() : () -> i64
      %947 = llvm.mlir.addressof @str95 : !llvm.ptr
      %948 = arith.constant 3 : i64
      %949 = func.call @cc_make_string(%947, %948) : (!llvm.ptr, i64) -> i64
      %950 = func.call @cc_nil_value() : () -> i64
      %951 = func.call @cc_intern(%949, %950) : (i64, i64) -> i64
      %952 = func.call @cc_nil_value() : () -> i64
      %953 = func.call @cc_cons(%951, %952) : (i64, i64) -> i64
      %954 = func.call @cc_values_pack(%953) : (i64) -> i64
      func.call @stack_push_pointer(%951) : (i64) -> ()
      %955 = llvm.mlir.addressof @str96 : !llvm.ptr
      %956 = arith.constant 3 : i64
      %957 = func.call @cc_make_string(%955, %956) : (!llvm.ptr, i64) -> i64
      %958 = func.call @cc_nil_value() : () -> i64
      %959 = func.call @cc_intern(%957, %958) : (i64, i64) -> i64
      %960 = func.call @cc_nil_value() : () -> i64
      %961 = func.call @cc_cons(%959, %960) : (i64, i64) -> i64
      %962 = func.call @cc_values_pack(%961) : (i64) -> i64
      func.call @stack_push_pointer(%959) : (i64) -> ()
      %963 = llvm.mlir.addressof @str97 : !llvm.ptr
      %964 = arith.constant 3 : i64
      %965 = func.call @cc_make_string(%963, %964) : (!llvm.ptr, i64) -> i64
      %966 = func.call @cc_nil_value() : () -> i64
      %967 = func.call @cc_intern(%965, %966) : (i64, i64) -> i64
      %968 = func.call @cc_nil_value() : () -> i64
      %969 = func.call @cc_cons(%967, %968) : (i64, i64) -> i64
      %970 = func.call @cc_values_pack(%969) : (i64) -> i64
      func.call @stack_push_pointer(%967) : (i64) -> ()
      %971 = llvm.mlir.addressof @str98 : !llvm.ptr
      %972 = arith.constant 23 : i64
      %973 = func.call @cc_make_string(%971, %972) : (!llvm.ptr, i64) -> i64
      %974 = llvm.mlir.addressof @str99 : !llvm.ptr
      %975 = arith.constant 3 : i64
      %976 = func.call @cc_make_string(%974, %975) : (!llvm.ptr, i64) -> i64
      %977 = func.call @cc_intern(%973, %976) : (i64, i64) -> i64
      %978 = func.call @cc_nil_value() : () -> i64
      %979 = func.call @cc_cons(%977, %978) : (i64, i64) -> i64
      %980 = func.call @cc_values_pack(%979) : (i64) -> i64
      func.call @stack_push_pointer(%977) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @stack_pop_pointer() : () -> i64
      %983 = func.call @cc_cons(%982, %981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%983) : (i64) -> ()
      %984 = func.call @stack_pop_pointer() : () -> i64
      %985 = func.call @stack_pop_pointer() : () -> i64
      %986 = func.call @cc_cons(%985, %984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      %987 = llvm.mlir.addressof @str100 : !llvm.ptr
      %988 = arith.constant 4 : i64
      %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_intern(%989, %990) : (i64, i64) -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_cons(%991, %992) : (i64, i64) -> i64
      %994 = func.call @cc_values_pack(%993) : (i64) -> i64
      func.call @stack_push_pointer(%991) : (i64) -> ()
      %995 = llvm.mlir.addressof @str101 : !llvm.ptr
      %996 = arith.constant 44 : i64
      %997 = func.call @cc_make_string(%995, %996) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = func.call @stack_pop_pointer() : () -> i64
      %1000 = func.call @cc_cons(%999, %998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1000) : (i64) -> ()
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @stack_pop_pointer() : () -> i64
      %1003 = func.call @cc_cons(%1002, %1001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = func.call @cc_cons(%1005, %1004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1006) : (i64) -> ()
      %1007 = func.call @stack_pop_pointer() : () -> i64
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_cons(%1008, %1007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      %1010 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1011 = arith.constant 3 : i64
      %1012 = func.call @cc_make_string(%1010, %1011) : (!llvm.ptr, i64) -> i64
      %1013 = func.call @cc_nil_value() : () -> i64
      %1014 = func.call @cc_intern(%1012, %1013) : (i64, i64) -> i64
      %1015 = func.call @cc_nil_value() : () -> i64
      %1016 = func.call @cc_cons(%1014, %1015) : (i64, i64) -> i64
      %1017 = func.call @cc_values_pack(%1016) : (i64) -> i64
      func.call @stack_push_pointer(%1014) : (i64) -> ()
      %1018 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1019 = arith.constant 4 : i64
      %1020 = func.call @cc_make_string(%1018, %1019) : (!llvm.ptr, i64) -> i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_intern(%1020, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_cons(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_values_pack(%1024) : (i64) -> i64
      func.call @stack_push_pointer(%1022) : (i64) -> ()
      %1026 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1027 = arith.constant 12 : i64
      %1028 = func.call @cc_make_string(%1026, %1027) : (!llvm.ptr, i64) -> i64
      %1029 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1030 = arith.constant 11 : i64
      %1031 = func.call @cc_make_string(%1029, %1030) : (!llvm.ptr, i64) -> i64
      %1032 = func.call @cc_intern(%1028, %1031) : (i64, i64) -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_cons(%1032, %1033) : (i64, i64) -> i64
      %1035 = func.call @cc_values_pack(%1034) : (i64) -> i64
      func.call @stack_push_pointer(%1032) : (i64) -> ()
      %1036 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1037 = arith.constant 4 : i64
      %1038 = func.call @cc_make_string(%1036, %1037) : (!llvm.ptr, i64) -> i64
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_intern(%1038, %1039) : (i64, i64) -> i64
      %1041 = func.call @cc_nil_value() : () -> i64
      %1042 = func.call @cc_cons(%1040, %1041) : (i64, i64) -> i64
      %1043 = func.call @cc_values_pack(%1042) : (i64) -> i64
      func.call @stack_push_pointer(%1040) : (i64) -> ()
      %1044 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1045 = arith.constant 11 : i64
      %1046 = func.call @cc_make_string(%1044, %1045) : (!llvm.ptr, i64) -> i64
      %1047 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1048 = arith.constant 7 : i64
      %1049 = func.call @cc_make_string(%1047, %1048) : (!llvm.ptr, i64) -> i64
      %1050 = func.call @cc_intern(%1046, %1049) : (i64, i64) -> i64
      %1051 = func.call @cc_nil_value() : () -> i64
      %1052 = func.call @cc_cons(%1050, %1051) : (i64, i64) -> i64
      %1053 = func.call @cc_values_pack(%1052) : (i64) -> i64
      func.call @stack_push_pointer(%1050) : (i64) -> ()
      %1054 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1055 = arith.constant 13 : i64
      %1056 = func.call @cc_make_string(%1054, %1055) : (!llvm.ptr, i64) -> i64
      %1057 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1058 = arith.constant 11 : i64
      %1059 = func.call @cc_make_string(%1057, %1058) : (!llvm.ptr, i64) -> i64
      %1060 = func.call @cc_intern(%1056, %1059) : (i64, i64) -> i64
      %1061 = func.call @cc_nil_value() : () -> i64
      %1062 = func.call @cc_cons(%1060, %1061) : (i64, i64) -> i64
      %1063 = func.call @cc_values_pack(%1062) : (i64) -> i64
      func.call @stack_push_pointer(%1060) : (i64) -> ()
      %1064 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1065 = arith.constant 4 : i64
      %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
      %1067 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1068 = arith.constant 7 : i64
      %1069 = func.call @cc_make_string(%1067, %1068) : (!llvm.ptr, i64) -> i64
      %1070 = func.call @cc_intern(%1066, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_values_pack(%1072) : (i64) -> i64
      func.call @stack_push_pointer(%1070) : (i64) -> ()
      %1074 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1075 = arith.constant 7 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1076) : (i64) -> ()
      %1077 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1078 = arith.constant 8 : i64
      %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
      %1080 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1081 = arith.constant 7 : i64
      %1082 = func.call @cc_make_string(%1080, %1081) : (!llvm.ptr, i64) -> i64
      %1083 = func.call @cc_intern(%1079, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_cons(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_values_pack(%1085) : (i64) -> i64
      func.call @stack_push_pointer(%1083) : (i64) -> ()
      %1087 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1088 = arith.constant 4 : i64
      %1089 = func.call @cc_make_string(%1087, %1088) : (!llvm.ptr, i64) -> i64
      %1090 = func.call @cc_nil_value() : () -> i64
      %1091 = func.call @cc_intern(%1089, %1090) : (i64, i64) -> i64
      %1092 = func.call @cc_nil_value() : () -> i64
      %1093 = func.call @cc_cons(%1091, %1092) : (i64, i64) -> i64
      %1094 = func.call @cc_values_pack(%1093) : (i64) -> i64
      func.call @stack_push_pointer(%1091) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1095 = func.call @stack_pop_pointer() : () -> i64
      %1096 = func.call @stack_pop_pointer() : () -> i64
      %1097 = func.call @cc_cons(%1096, %1095) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1097) : (i64) -> ()
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = func.call @stack_pop_pointer() : () -> i64
      %1100 = func.call @cc_cons(%1099, %1098) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1100) : (i64) -> ()
      %1101 = func.call @stack_pop_pointer() : () -> i64
      %1102 = func.call @stack_pop_pointer() : () -> i64
      %1103 = func.call @cc_cons(%1102, %1101) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1103) : (i64) -> ()
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = func.call @stack_pop_pointer() : () -> i64
      %1106 = func.call @cc_cons(%1105, %1104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1106) : (i64) -> ()
      %1107 = func.call @stack_pop_pointer() : () -> i64
      %1108 = func.call @stack_pop_pointer() : () -> i64
      %1109 = func.call @cc_cons(%1108, %1107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1109) : (i64) -> ()
      %1110 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1111 = arith.constant 7 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1114 = arith.constant 7 : i64
      %1115 = func.call @cc_make_string(%1113, %1114) : (!llvm.ptr, i64) -> i64
      %1116 = func.call @cc_intern(%1112, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_nil_value() : () -> i64
      %1118 = func.call @cc_cons(%1116, %1117) : (i64, i64) -> i64
      %1119 = func.call @cc_values_pack(%1118) : (i64) -> i64
      func.call @stack_push_pointer(%1116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1120 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1121 = arith.constant 5 : i64
      %1122 = func.call @cc_make_string(%1120, %1121) : (!llvm.ptr, i64) -> i64
      %1123 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1124 = arith.constant 7 : i64
      %1125 = func.call @cc_make_string(%1123, %1124) : (!llvm.ptr, i64) -> i64
      %1126 = func.call @cc_intern(%1122, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_nil_value() : () -> i64
      %1128 = func.call @cc_cons(%1126, %1127) : (i64, i64) -> i64
      %1129 = func.call @cc_values_pack(%1128) : (i64) -> i64
      func.call @stack_push_pointer(%1126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1130 = func.call @stack_pop_pointer() : () -> i64
      %1131 = func.call @stack_pop_pointer() : () -> i64
      %1132 = func.call @cc_cons(%1131, %1130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1132) : (i64) -> ()
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @stack_pop_pointer() : () -> i64
      %1135 = func.call @cc_cons(%1134, %1133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1135) : (i64) -> ()
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @stack_pop_pointer() : () -> i64
      %1138 = func.call @cc_cons(%1137, %1136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @stack_pop_pointer() : () -> i64
      %1141 = func.call @cc_cons(%1140, %1139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1141) : (i64) -> ()
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @cc_cons(%1143, %1142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1144) : (i64) -> ()
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @cc_cons(%1146, %1145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1147) : (i64) -> ()
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @cc_cons(%1149, %1148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = func.call @stack_pop_pointer() : () -> i64
      %1153 = func.call @cc_cons(%1152, %1151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1153) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @stack_pop_pointer() : () -> i64
      %1156 = func.call @cc_cons(%1155, %1154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1156) : (i64) -> ()
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @stack_pop_pointer() : () -> i64
      %1159 = func.call @cc_cons(%1158, %1157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @stack_pop_pointer() : () -> i64
      %1162 = func.call @cc_cons(%1161, %1160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      %1163 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1164 = arith.constant 3 : i64
      %1165 = func.call @cc_make_string(%1163, %1164) : (!llvm.ptr, i64) -> i64
      %1166 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1167 = arith.constant 11 : i64
      %1168 = func.call @cc_make_string(%1166, %1167) : (!llvm.ptr, i64) -> i64
      %1169 = func.call @cc_intern(%1165, %1168) : (i64, i64) -> i64
      %1170 = func.call @cc_nil_value() : () -> i64
      %1171 = func.call @cc_cons(%1169, %1170) : (i64, i64) -> i64
      %1172 = func.call @cc_values_pack(%1171) : (i64) -> i64
      func.call @stack_push_pointer(%1169) : (i64) -> ()
      %1173 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1174 = arith.constant 10 : i64
      %1175 = func.call @cc_make_string(%1173, %1174) : (!llvm.ptr, i64) -> i64
      %1176 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1177 = arith.constant 11 : i64
      %1178 = func.call @cc_make_string(%1176, %1177) : (!llvm.ptr, i64) -> i64
      %1179 = func.call @cc_intern(%1175, %1178) : (i64, i64) -> i64
      %1180 = func.call @cc_nil_value() : () -> i64
      %1181 = func.call @cc_cons(%1179, %1180) : (i64, i64) -> i64
      %1182 = func.call @cc_values_pack(%1181) : (i64) -> i64
      func.call @stack_push_pointer(%1179) : (i64) -> ()
      %1183 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1184 = arith.constant 4 : i64
      %1185 = func.call @cc_make_string(%1183, %1184) : (!llvm.ptr, i64) -> i64
      %1186 = func.call @cc_nil_value() : () -> i64
      %1187 = func.call @cc_intern(%1185, %1186) : (i64, i64) -> i64
      %1188 = func.call @cc_nil_value() : () -> i64
      %1189 = func.call @cc_cons(%1187, %1188) : (i64, i64) -> i64
      %1190 = func.call @cc_values_pack(%1189) : (i64) -> i64
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1191 = func.call @stack_pop_pointer() : () -> i64
      %1192 = func.call @stack_pop_pointer() : () -> i64
      %1193 = func.call @cc_cons(%1192, %1191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1193) : (i64) -> ()
      %1194 = func.call @stack_pop_pointer() : () -> i64
      %1195 = func.call @stack_pop_pointer() : () -> i64
      %1196 = func.call @cc_cons(%1195, %1194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1196) : (i64) -> ()
      %1197 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1198 = arith.constant 12 : i64
      %1199 = func.call @cc_make_string(%1197, %1198) : (!llvm.ptr, i64) -> i64
      %1200 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1201 = arith.constant 11 : i64
      %1202 = func.call @cc_make_string(%1200, %1201) : (!llvm.ptr, i64) -> i64
      %1203 = func.call @cc_intern(%1199, %1202) : (i64, i64) -> i64
      %1204 = func.call @cc_nil_value() : () -> i64
      %1205 = func.call @cc_cons(%1203, %1204) : (i64, i64) -> i64
      %1206 = func.call @cc_values_pack(%1205) : (i64) -> i64
      func.call @stack_push_pointer(%1203) : (i64) -> ()
      %1207 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1208 = arith.constant 13 : i64
      %1209 = func.call @cc_make_string(%1207, %1208) : (!llvm.ptr, i64) -> i64
      %1210 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1211 = arith.constant 11 : i64
      %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
      %1213 = func.call @cc_intern(%1209, %1212) : (i64, i64) -> i64
      %1214 = func.call @cc_nil_value() : () -> i64
      %1215 = func.call @cc_cons(%1213, %1214) : (i64, i64) -> i64
      %1216 = func.call @cc_values_pack(%1215) : (i64) -> i64
      func.call @stack_push_pointer(%1213) : (i64) -> ()
      %1217 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1218 = arith.constant 4 : i64
      %1219 = func.call @cc_make_string(%1217, %1218) : (!llvm.ptr, i64) -> i64
      %1220 = func.call @cc_nil_value() : () -> i64
      %1221 = func.call @cc_intern(%1219, %1220) : (i64, i64) -> i64
      %1222 = func.call @cc_nil_value() : () -> i64
      %1223 = func.call @cc_cons(%1221, %1222) : (i64, i64) -> i64
      %1224 = func.call @cc_values_pack(%1223) : (i64) -> i64
      func.call @stack_push_pointer(%1221) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1225 = func.call @stack_pop_pointer() : () -> i64
      %1226 = func.call @stack_pop_pointer() : () -> i64
      %1227 = func.call @cc_cons(%1226, %1225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1227) : (i64) -> ()
      %1228 = func.call @stack_pop_pointer() : () -> i64
      %1229 = func.call @stack_pop_pointer() : () -> i64
      %1230 = func.call @cc_cons(%1229, %1228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1230) : (i64) -> ()
      %1231 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1232 = arith.constant 7 : i64
      %1233 = func.call @cc_make_string(%1231, %1232) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1233) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1234 = func.call @stack_pop_pointer() : () -> i64
      %1235 = func.call @stack_pop_pointer() : () -> i64
      %1236 = func.call @cc_cons(%1235, %1234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1236) : (i64) -> ()
      %1237 = func.call @stack_pop_pointer() : () -> i64
      %1238 = func.call @stack_pop_pointer() : () -> i64
      %1239 = func.call @cc_cons(%1238, %1237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1239) : (i64) -> ()
      %1240 = func.call @stack_pop_pointer() : () -> i64
      %1241 = func.call @stack_pop_pointer() : () -> i64
      %1242 = func.call @cc_cons(%1241, %1240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1242) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %1252 = func.call @stack_pop_pointer() : () -> i64
      %1253 = func.call @stack_pop_pointer() : () -> i64
      %1254 = func.call @cc_cons(%1253, %1252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      %1255 = func.call @stack_pop_pointer() : () -> i64
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @cc_cons(%1256, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      %1258 = func.call @stack_pop_pointer() : () -> i64
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = func.call @cc_cons(%1259, %1258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_cons(%1262, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = func.call @stack_pop_pointer() : () -> i64
      %1266 = func.call @cc_cons(%1265, %1264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1266) : (i64) -> ()
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_cons(%1268, %1267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = func.call @stack_pop_pointer() : () -> i64
      %1272 = func.call @cc_cons(%1271, %1270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1272) : (i64) -> ()
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = func.call @stack_pop_pointer() : () -> i64
      %1275 = func.call @cc_cons(%1274, %1273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = func.call @stack_pop_pointer() : () -> i64
      %1278 = func.call @cc_cons(%1277, %1276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @cc_cons(%1280, %1279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1281) : (i64) -> ()
      %1282 = func.call @stack_pop_pointer() : () -> i64
      %1506 = arith.constant 96094591647747 : i64
      %1507 = arith.constant 0 : i64
      %1508 = func.call @cc_make_closure(%1506, %1507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1508) : (i64) -> ()
      %1509 = func.call @stack_pop_pointer() : () -> i64
      %1510 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1511 = arith.constant 1 : i64
      %1512 = func.call @cc_make_string(%1510, %1511) : (!llvm.ptr, i64) -> i64
      %1513 = func.call @cc_nil_value() : () -> i64
      %1514 = func.call @cc_intern(%1512, %1513) : (i64, i64) -> i64
      %1515 = func.call @cc_nil_value() : () -> i64
      %1516 = func.call @cc_cons(%1514, %1515) : (i64, i64) -> i64
      %1517 = func.call @cc_values_pack(%1516) : (i64) -> i64
      func.call @stack_push_pointer(%1514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1518 = func.call @stack_pop_pointer() : () -> i64
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = func.call @cc_cons(%1519, %1518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1520) : (i64) -> ()
      %1521 = func.call @stack_pop_pointer() : () -> i64
      %1522 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1523 = arith.constant 11 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1526 = arith.constant 7 : i64
      %1527 = func.call @cc_make_string(%1525, %1526) : (!llvm.ptr, i64) -> i64
      %1528 = func.call @cc_intern(%1524, %1527) : (i64, i64) -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_cons(%1528, %1529) : (i64, i64) -> i64
      %1531 = func.call @cc_values_pack(%1530) : (i64) -> i64
      func.call @stack_push_pointer(%1528) : (i64) -> ()
      %1532 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1533 = func.call @stack_pop_pointer() : () -> i64
      %1534 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1535 = arith.constant 4 : i64
      %1536 = func.call @cc_make_string(%1534, %1535) : (!llvm.ptr, i64) -> i64
      %1537 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1538 = arith.constant 7 : i64
      %1539 = func.call @cc_make_string(%1537, %1538) : (!llvm.ptr, i64) -> i64
      %1540 = func.call @cc_intern(%1536, %1539) : (i64, i64) -> i64
      %1541 = func.call @cc_nil_value() : () -> i64
      %1542 = func.call @cc_cons(%1540, %1541) : (i64, i64) -> i64
      %1543 = func.call @cc_values_pack(%1542) : (i64) -> i64
      func.call @stack_push_pointer(%1540) : (i64) -> ()
      %1544 = func.call @stack_pop_pointer() : () -> i64
      %1545 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1546 = arith.constant 6 : i64
      %1547 = func.call @cc_make_string(%1545, %1546) : (!llvm.ptr, i64) -> i64
      %1548 = func.call @cc_nil_value() : () -> i64
      %1549 = func.call @cc_intern(%1547, %1548) : (i64, i64) -> i64
      %1550 = func.call @cc_nil_value() : () -> i64
      %1551 = func.call @cc_cons(%1549, %1550) : (i64, i64) -> i64
      %1552 = func.call @cc_values_pack(%1551) : (i64) -> i64
      func.call @stack_push_pointer(%1549) : (i64) -> ()
      %1553 = func.call @stack_pop_pointer() : () -> i64
      %1554 = func.call @cc_nil_value() : () -> i64
      %1555 = func.call @cc_errorp(%946) : (i64) -> i64
      %1556 = arith.cmpi ne, %1555, %1554 : i64
      %1557 = arith.cmpi eq, %1554, %1554 : i64
      %1558 = arith.andi %1556, %1557 : i1
      %1559 = scf.if %1558 -> (i64) {
        scf.yield %946 : i64
      } else {
        scf.yield %1554 : i64
      }
      %1560 = func.call @cc_errorp(%1282) : (i64) -> i64
      %1561 = arith.cmpi ne, %1560, %1554 : i64
      %1562 = arith.cmpi eq, %1559, %1554 : i64
      %1563 = arith.andi %1561, %1562 : i1
      %1564 = scf.if %1563 -> (i64) {
        scf.yield %1282 : i64
      } else {
        scf.yield %1559 : i64
      }
      %1565 = func.call @cc_errorp(%1509) : (i64) -> i64
      %1566 = arith.cmpi ne, %1565, %1554 : i64
      %1567 = arith.cmpi eq, %1564, %1554 : i64
      %1568 = arith.andi %1566, %1567 : i1
      %1569 = scf.if %1568 -> (i64) {
        scf.yield %1509 : i64
      } else {
        scf.yield %1564 : i64
      }
      %1570 = func.call @cc_errorp(%1521) : (i64) -> i64
      %1571 = arith.cmpi ne, %1570, %1554 : i64
      %1572 = arith.cmpi eq, %1569, %1554 : i64
      %1573 = arith.andi %1571, %1572 : i1
      %1574 = scf.if %1573 -> (i64) {
        scf.yield %1521 : i64
      } else {
        scf.yield %1569 : i64
      }
      %1575 = func.call @cc_errorp(%1532) : (i64) -> i64
      %1576 = arith.cmpi ne, %1575, %1554 : i64
      %1577 = arith.cmpi eq, %1574, %1554 : i64
      %1578 = arith.andi %1576, %1577 : i1
      %1579 = scf.if %1578 -> (i64) {
        scf.yield %1532 : i64
      } else {
        scf.yield %1574 : i64
      }
      %1580 = func.call @cc_errorp(%1533) : (i64) -> i64
      %1581 = arith.cmpi ne, %1580, %1554 : i64
      %1582 = arith.cmpi eq, %1579, %1554 : i64
      %1583 = arith.andi %1581, %1582 : i1
      %1584 = scf.if %1583 -> (i64) {
        scf.yield %1533 : i64
      } else {
        scf.yield %1579 : i64
      }
      %1585 = func.call @cc_errorp(%1544) : (i64) -> i64
      %1586 = arith.cmpi ne, %1585, %1554 : i64
      %1587 = arith.cmpi eq, %1584, %1554 : i64
      %1588 = arith.andi %1586, %1587 : i1
      %1589 = scf.if %1588 -> (i64) {
        scf.yield %1544 : i64
      } else {
        scf.yield %1584 : i64
      }
      %1590 = func.call @cc_errorp(%1553) : (i64) -> i64
      %1591 = arith.cmpi ne, %1590, %1554 : i64
      %1592 = arith.cmpi eq, %1589, %1554 : i64
      %1593 = arith.andi %1591, %1592 : i1
      %1594 = scf.if %1593 -> (i64) {
        scf.yield %1553 : i64
      } else {
        scf.yield %1589 : i64
      }
      %1595 = arith.cmpi ne, %1594, %1554 : i64
      scf.if %1595 {
        func.call @stack_push_pointer(%1594) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%946) : (i64) -> ()
        func.call @stack_push_pointer(%1282) : (i64) -> ()
        func.call @stack_push_pointer(%1509) : (i64) -> ()
        func.call @stack_push_pointer(%1521) : (i64) -> ()
        func.call @stack_push_pointer(%1532) : (i64) -> ()
        func.call @stack_push_pointer(%1533) : (i64) -> ()
        func.call @stack_push_pointer(%1544) : (i64) -> ()
        func.call @stack_push_pointer(%1553) : (i64) -> ()
        %1596 = llvm.mlir.addressof @str160 : !llvm.ptr
        %1597 = func.call @cc_make_function_ref_const(%1596) : (!llvm.ptr) -> i64
        %1598 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1597, %1598) : (i64, i64) -> ()
      }
      %1599 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1599 : i64
    }
    %1600 = func.call @cc_nil_value() : () -> i64
    %1601 = func.call @cc_errorp(%937) : (i64) -> i64
    %1602 = arith.cmpi ne, %1601, %1600 : i64
    %1603 = scf.if %1602 -> (i64) {
      scf.yield %937 : i64
    } else {
      %1604 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1605 = arith.constant 27 : i64
      %1606 = func.call @cc_make_string(%1604, %1605) : (!llvm.ptr, i64) -> i64
      %1607 = func.call @cc_nil_value() : () -> i64
      %1608 = func.call @cc_intern(%1606, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_nil_value() : () -> i64
      %1610 = func.call @cc_cons(%1608, %1609) : (i64, i64) -> i64
      %1611 = func.call @cc_values_pack(%1610) : (i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1614 = arith.constant 3 : i64
      %1615 = func.call @cc_make_string(%1613, %1614) : (!llvm.ptr, i64) -> i64
      %1616 = func.call @cc_nil_value() : () -> i64
      %1617 = func.call @cc_intern(%1615, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_nil_value() : () -> i64
      %1619 = func.call @cc_cons(%1617, %1618) : (i64, i64) -> i64
      %1620 = func.call @cc_values_pack(%1619) : (i64) -> i64
      func.call @stack_push_pointer(%1617) : (i64) -> ()
      %1621 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1622 = arith.constant 3 : i64
      %1623 = func.call @cc_make_string(%1621, %1622) : (!llvm.ptr, i64) -> i64
      %1624 = func.call @cc_nil_value() : () -> i64
      %1625 = func.call @cc_intern(%1623, %1624) : (i64, i64) -> i64
      %1626 = func.call @cc_nil_value() : () -> i64
      %1627 = func.call @cc_cons(%1625, %1626) : (i64, i64) -> i64
      %1628 = func.call @cc_values_pack(%1627) : (i64) -> i64
      func.call @stack_push_pointer(%1625) : (i64) -> ()
      %1629 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1630 = arith.constant 3 : i64
      %1631 = func.call @cc_make_string(%1629, %1630) : (!llvm.ptr, i64) -> i64
      %1632 = func.call @cc_nil_value() : () -> i64
      %1633 = func.call @cc_intern(%1631, %1632) : (i64, i64) -> i64
      %1634 = func.call @cc_nil_value() : () -> i64
      %1635 = func.call @cc_cons(%1633, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_values_pack(%1635) : (i64) -> i64
      func.call @stack_push_pointer(%1633) : (i64) -> ()
      %1637 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1638 = arith.constant 23 : i64
      %1639 = func.call @cc_make_string(%1637, %1638) : (!llvm.ptr, i64) -> i64
      %1640 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1641 = arith.constant 3 : i64
      %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
      %1643 = func.call @cc_intern(%1639, %1642) : (i64, i64) -> i64
      %1644 = func.call @cc_nil_value() : () -> i64
      %1645 = func.call @cc_cons(%1643, %1644) : (i64, i64) -> i64
      %1646 = func.call @cc_values_pack(%1645) : (i64) -> i64
      func.call @stack_push_pointer(%1643) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1647 = func.call @stack_pop_pointer() : () -> i64
      %1648 = func.call @stack_pop_pointer() : () -> i64
      %1649 = func.call @cc_cons(%1648, %1647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1649) : (i64) -> ()
      %1650 = func.call @stack_pop_pointer() : () -> i64
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @cc_cons(%1651, %1650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1652) : (i64) -> ()
      %1653 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1654 = arith.constant 21 : i64
      %1655 = func.call @cc_make_string(%1653, %1654) : (!llvm.ptr, i64) -> i64
      %1656 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1657 = arith.constant 3 : i64
      %1658 = func.call @cc_make_string(%1656, %1657) : (!llvm.ptr, i64) -> i64
      %1659 = func.call @cc_intern(%1655, %1658) : (i64, i64) -> i64
      %1660 = func.call @cc_nil_value() : () -> i64
      %1661 = func.call @cc_cons(%1659, %1660) : (i64, i64) -> i64
      %1662 = func.call @cc_values_pack(%1661) : (i64) -> i64
      func.call @stack_push_pointer(%1659) : (i64) -> ()
      %1663 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1664 = arith.constant 4 : i64
      %1665 = func.call @cc_make_string(%1663, %1664) : (!llvm.ptr, i64) -> i64
      %1666 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1667 = arith.constant 7 : i64
      %1668 = func.call @cc_make_string(%1666, %1667) : (!llvm.ptr, i64) -> i64
      %1669 = func.call @cc_intern(%1665, %1668) : (i64, i64) -> i64
      %1670 = func.call @cc_nil_value() : () -> i64
      %1671 = func.call @cc_cons(%1669, %1670) : (i64, i64) -> i64
      %1672 = func.call @cc_values_pack(%1671) : (i64) -> i64
      func.call @stack_push_pointer(%1669) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1673 = func.call @stack_pop_pointer() : () -> i64
      %1674 = func.call @stack_pop_pointer() : () -> i64
      %1675 = func.call @cc_cons(%1674, %1673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1675) : (i64) -> ()
      %1676 = func.call @stack_pop_pointer() : () -> i64
      %1677 = func.call @stack_pop_pointer() : () -> i64
      %1678 = func.call @cc_cons(%1677, %1676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1678) : (i64) -> ()
      %1679 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1680 = arith.constant 4 : i64
      %1681 = func.call @cc_make_string(%1679, %1680) : (!llvm.ptr, i64) -> i64
      %1682 = func.call @cc_nil_value() : () -> i64
      %1683 = func.call @cc_intern(%1681, %1682) : (i64, i64) -> i64
      %1684 = func.call @cc_nil_value() : () -> i64
      %1685 = func.call @cc_cons(%1683, %1684) : (i64, i64) -> i64
      %1686 = func.call @cc_values_pack(%1685) : (i64) -> i64
      func.call @stack_push_pointer(%1683) : (i64) -> ()
      %1687 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1688 = arith.constant 44 : i64
      %1689 = func.call @cc_make_string(%1687, %1688) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1689) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = func.call @cc_cons(%1691, %1690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1692) : (i64) -> ()
      %1693 = func.call @stack_pop_pointer() : () -> i64
      %1694 = func.call @stack_pop_pointer() : () -> i64
      %1695 = func.call @cc_cons(%1694, %1693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1696 = func.call @stack_pop_pointer() : () -> i64
      %1697 = func.call @stack_pop_pointer() : () -> i64
      %1698 = func.call @cc_cons(%1697, %1696) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1698) : (i64) -> ()
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @stack_pop_pointer() : () -> i64
      %1701 = func.call @cc_cons(%1700, %1699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1701) : (i64) -> ()
      %1702 = func.call @stack_pop_pointer() : () -> i64
      %1703 = func.call @stack_pop_pointer() : () -> i64
      %1704 = func.call @cc_cons(%1703, %1702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1704) : (i64) -> ()
      %1705 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1706 = arith.constant 3 : i64
      %1707 = func.call @cc_make_string(%1705, %1706) : (!llvm.ptr, i64) -> i64
      %1708 = func.call @cc_nil_value() : () -> i64
      %1709 = func.call @cc_intern(%1707, %1708) : (i64, i64) -> i64
      %1710 = func.call @cc_nil_value() : () -> i64
      %1711 = func.call @cc_cons(%1709, %1710) : (i64, i64) -> i64
      %1712 = func.call @cc_values_pack(%1711) : (i64) -> i64
      func.call @stack_push_pointer(%1709) : (i64) -> ()
      %1713 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1714 = arith.constant 4 : i64
      %1715 = func.call @cc_make_string(%1713, %1714) : (!llvm.ptr, i64) -> i64
      %1716 = func.call @cc_nil_value() : () -> i64
      %1717 = func.call @cc_intern(%1715, %1716) : (i64, i64) -> i64
      %1718 = func.call @cc_nil_value() : () -> i64
      %1719 = func.call @cc_cons(%1717, %1718) : (i64, i64) -> i64
      %1720 = func.call @cc_values_pack(%1719) : (i64) -> i64
      func.call @stack_push_pointer(%1717) : (i64) -> ()
      %1721 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1722 = arith.constant 12 : i64
      %1723 = func.call @cc_make_string(%1721, %1722) : (!llvm.ptr, i64) -> i64
      %1724 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1725 = arith.constant 11 : i64
      %1726 = func.call @cc_make_string(%1724, %1725) : (!llvm.ptr, i64) -> i64
      %1727 = func.call @cc_intern(%1723, %1726) : (i64, i64) -> i64
      %1728 = func.call @cc_nil_value() : () -> i64
      %1729 = func.call @cc_cons(%1727, %1728) : (i64, i64) -> i64
      %1730 = func.call @cc_values_pack(%1729) : (i64) -> i64
      func.call @stack_push_pointer(%1727) : (i64) -> ()
      %1731 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1732 = arith.constant 4 : i64
      %1733 = func.call @cc_make_string(%1731, %1732) : (!llvm.ptr, i64) -> i64
      %1734 = func.call @cc_nil_value() : () -> i64
      %1735 = func.call @cc_intern(%1733, %1734) : (i64, i64) -> i64
      %1736 = func.call @cc_nil_value() : () -> i64
      %1737 = func.call @cc_cons(%1735, %1736) : (i64, i64) -> i64
      %1738 = func.call @cc_values_pack(%1737) : (i64) -> i64
      func.call @stack_push_pointer(%1735) : (i64) -> ()
      %1739 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1740 = arith.constant 11 : i64
      %1741 = func.call @cc_make_string(%1739, %1740) : (!llvm.ptr, i64) -> i64
      %1742 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1743 = arith.constant 7 : i64
      %1744 = func.call @cc_make_string(%1742, %1743) : (!llvm.ptr, i64) -> i64
      %1745 = func.call @cc_intern(%1741, %1744) : (i64, i64) -> i64
      %1746 = func.call @cc_nil_value() : () -> i64
      %1747 = func.call @cc_cons(%1745, %1746) : (i64, i64) -> i64
      %1748 = func.call @cc_values_pack(%1747) : (i64) -> i64
      func.call @stack_push_pointer(%1745) : (i64) -> ()
      %1749 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1750 = arith.constant 13 : i64
      %1751 = func.call @cc_make_string(%1749, %1750) : (!llvm.ptr, i64) -> i64
      %1752 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1753 = arith.constant 11 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      %1755 = func.call @cc_intern(%1751, %1754) : (i64, i64) -> i64
      %1756 = func.call @cc_nil_value() : () -> i64
      %1757 = func.call @cc_cons(%1755, %1756) : (i64, i64) -> i64
      %1758 = func.call @cc_values_pack(%1757) : (i64) -> i64
      func.call @stack_push_pointer(%1755) : (i64) -> ()
      %1759 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1760 = arith.constant 4 : i64
      %1761 = func.call @cc_make_string(%1759, %1760) : (!llvm.ptr, i64) -> i64
      %1762 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1763 = arith.constant 7 : i64
      %1764 = func.call @cc_make_string(%1762, %1763) : (!llvm.ptr, i64) -> i64
      %1765 = func.call @cc_intern(%1761, %1764) : (i64, i64) -> i64
      %1766 = func.call @cc_nil_value() : () -> i64
      %1767 = func.call @cc_cons(%1765, %1766) : (i64, i64) -> i64
      %1768 = func.call @cc_values_pack(%1767) : (i64) -> i64
      func.call @stack_push_pointer(%1765) : (i64) -> ()
      %1769 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1770 = arith.constant 7 : i64
      %1771 = func.call @cc_make_string(%1769, %1770) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1771) : (i64) -> ()
      %1772 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1773 = arith.constant 8 : i64
      %1774 = func.call @cc_make_string(%1772, %1773) : (!llvm.ptr, i64) -> i64
      %1775 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1776 = arith.constant 7 : i64
      %1777 = func.call @cc_make_string(%1775, %1776) : (!llvm.ptr, i64) -> i64
      %1778 = func.call @cc_intern(%1774, %1777) : (i64, i64) -> i64
      %1779 = func.call @cc_nil_value() : () -> i64
      %1780 = func.call @cc_cons(%1778, %1779) : (i64, i64) -> i64
      %1781 = func.call @cc_values_pack(%1780) : (i64) -> i64
      func.call @stack_push_pointer(%1778) : (i64) -> ()
      %1782 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1783 = arith.constant 4 : i64
      %1784 = func.call @cc_make_string(%1782, %1783) : (!llvm.ptr, i64) -> i64
      %1785 = func.call @cc_nil_value() : () -> i64
      %1786 = func.call @cc_intern(%1784, %1785) : (i64, i64) -> i64
      %1787 = func.call @cc_nil_value() : () -> i64
      %1788 = func.call @cc_cons(%1786, %1787) : (i64, i64) -> i64
      %1789 = func.call @cc_values_pack(%1788) : (i64) -> i64
      func.call @stack_push_pointer(%1786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @stack_pop_pointer() : () -> i64
      %1792 = func.call @cc_cons(%1791, %1790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1792) : (i64) -> ()
      %1793 = func.call @stack_pop_pointer() : () -> i64
      %1794 = func.call @stack_pop_pointer() : () -> i64
      %1795 = func.call @cc_cons(%1794, %1793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1795) : (i64) -> ()
      %1796 = func.call @stack_pop_pointer() : () -> i64
      %1797 = func.call @stack_pop_pointer() : () -> i64
      %1798 = func.call @cc_cons(%1797, %1796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1798) : (i64) -> ()
      %1799 = func.call @stack_pop_pointer() : () -> i64
      %1800 = func.call @stack_pop_pointer() : () -> i64
      %1801 = func.call @cc_cons(%1800, %1799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1801) : (i64) -> ()
      %1802 = func.call @stack_pop_pointer() : () -> i64
      %1803 = func.call @stack_pop_pointer() : () -> i64
      %1804 = func.call @cc_cons(%1803, %1802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1804) : (i64) -> ()
      %1805 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1806 = arith.constant 7 : i64
      %1807 = func.call @cc_make_string(%1805, %1806) : (!llvm.ptr, i64) -> i64
      %1808 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1809 = arith.constant 7 : i64
      %1810 = func.call @cc_make_string(%1808, %1809) : (!llvm.ptr, i64) -> i64
      %1811 = func.call @cc_intern(%1807, %1810) : (i64, i64) -> i64
      %1812 = func.call @cc_nil_value() : () -> i64
      %1813 = func.call @cc_cons(%1811, %1812) : (i64, i64) -> i64
      %1814 = func.call @cc_values_pack(%1813) : (i64) -> i64
      func.call @stack_push_pointer(%1811) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1815 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1816 = arith.constant 5 : i64
      %1817 = func.call @cc_make_string(%1815, %1816) : (!llvm.ptr, i64) -> i64
      %1818 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1819 = arith.constant 7 : i64
      %1820 = func.call @cc_make_string(%1818, %1819) : (!llvm.ptr, i64) -> i64
      %1821 = func.call @cc_intern(%1817, %1820) : (i64, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_cons(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_values_pack(%1823) : (i64) -> i64
      func.call @stack_push_pointer(%1821) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @cc_cons(%1850, %1849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1851) : (i64) -> ()
      %1852 = func.call @stack_pop_pointer() : () -> i64
      %1853 = func.call @stack_pop_pointer() : () -> i64
      %1854 = func.call @cc_cons(%1853, %1852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1854) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1855 = func.call @stack_pop_pointer() : () -> i64
      %1856 = func.call @stack_pop_pointer() : () -> i64
      %1857 = func.call @cc_cons(%1856, %1855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1857) : (i64) -> ()
      %1858 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1859 = arith.constant 3 : i64
      %1860 = func.call @cc_make_string(%1858, %1859) : (!llvm.ptr, i64) -> i64
      %1861 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1862 = arith.constant 11 : i64
      %1863 = func.call @cc_make_string(%1861, %1862) : (!llvm.ptr, i64) -> i64
      %1864 = func.call @cc_intern(%1860, %1863) : (i64, i64) -> i64
      %1865 = func.call @cc_nil_value() : () -> i64
      %1866 = func.call @cc_cons(%1864, %1865) : (i64, i64) -> i64
      %1867 = func.call @cc_values_pack(%1866) : (i64) -> i64
      func.call @stack_push_pointer(%1864) : (i64) -> ()
      %1868 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1869 = arith.constant 10 : i64
      %1870 = func.call @cc_make_string(%1868, %1869) : (!llvm.ptr, i64) -> i64
      %1871 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1872 = arith.constant 11 : i64
      %1873 = func.call @cc_make_string(%1871, %1872) : (!llvm.ptr, i64) -> i64
      %1874 = func.call @cc_intern(%1870, %1873) : (i64, i64) -> i64
      %1875 = func.call @cc_nil_value() : () -> i64
      %1876 = func.call @cc_cons(%1874, %1875) : (i64, i64) -> i64
      %1877 = func.call @cc_values_pack(%1876) : (i64) -> i64
      func.call @stack_push_pointer(%1874) : (i64) -> ()
      %1878 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1879 = arith.constant 4 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = func.call @cc_nil_value() : () -> i64
      %1882 = func.call @cc_intern(%1880, %1881) : (i64, i64) -> i64
      %1883 = func.call @cc_nil_value() : () -> i64
      %1884 = func.call @cc_cons(%1882, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_values_pack(%1884) : (i64) -> i64
      func.call @stack_push_pointer(%1882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1886 = func.call @stack_pop_pointer() : () -> i64
      %1887 = func.call @stack_pop_pointer() : () -> i64
      %1888 = func.call @cc_cons(%1887, %1886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1888) : (i64) -> ()
      %1889 = func.call @stack_pop_pointer() : () -> i64
      %1890 = func.call @stack_pop_pointer() : () -> i64
      %1891 = func.call @cc_cons(%1890, %1889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1891) : (i64) -> ()
      %1892 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1893 = arith.constant 12 : i64
      %1894 = func.call @cc_make_string(%1892, %1893) : (!llvm.ptr, i64) -> i64
      %1895 = llvm.mlir.addressof @str198 : !llvm.ptr
      %1896 = arith.constant 11 : i64
      %1897 = func.call @cc_make_string(%1895, %1896) : (!llvm.ptr, i64) -> i64
      %1898 = func.call @cc_intern(%1894, %1897) : (i64, i64) -> i64
      %1899 = func.call @cc_nil_value() : () -> i64
      %1900 = func.call @cc_cons(%1898, %1899) : (i64, i64) -> i64
      %1901 = func.call @cc_values_pack(%1900) : (i64) -> i64
      func.call @stack_push_pointer(%1898) : (i64) -> ()
      %1902 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1903 = arith.constant 13 : i64
      %1904 = func.call @cc_make_string(%1902, %1903) : (!llvm.ptr, i64) -> i64
      %1905 = llvm.mlir.addressof @str200 : !llvm.ptr
      %1906 = arith.constant 11 : i64
      %1907 = func.call @cc_make_string(%1905, %1906) : (!llvm.ptr, i64) -> i64
      %1908 = func.call @cc_intern(%1904, %1907) : (i64, i64) -> i64
      %1909 = func.call @cc_nil_value() : () -> i64
      %1910 = func.call @cc_cons(%1908, %1909) : (i64, i64) -> i64
      %1911 = func.call @cc_values_pack(%1910) : (i64) -> i64
      func.call @stack_push_pointer(%1908) : (i64) -> ()
      %1912 = llvm.mlir.addressof @str201 : !llvm.ptr
      %1913 = arith.constant 4 : i64
      %1914 = func.call @cc_make_string(%1912, %1913) : (!llvm.ptr, i64) -> i64
      %1915 = func.call @cc_nil_value() : () -> i64
      %1916 = func.call @cc_intern(%1914, %1915) : (i64, i64) -> i64
      %1917 = func.call @cc_nil_value() : () -> i64
      %1918 = func.call @cc_cons(%1916, %1917) : (i64, i64) -> i64
      %1919 = func.call @cc_values_pack(%1918) : (i64) -> i64
      func.call @stack_push_pointer(%1916) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1920 = func.call @stack_pop_pointer() : () -> i64
      %1921 = func.call @stack_pop_pointer() : () -> i64
      %1922 = func.call @cc_cons(%1921, %1920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1922) : (i64) -> ()
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = func.call @cc_cons(%1924, %1923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1925) : (i64) -> ()
      %1926 = llvm.mlir.addressof @str202 : !llvm.ptr
      %1927 = arith.constant 7 : i64
      %1928 = func.call @cc_make_string(%1926, %1927) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1928) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1929 = func.call @stack_pop_pointer() : () -> i64
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = func.call @cc_cons(%1930, %1929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1931) : (i64) -> ()
      %1932 = func.call @stack_pop_pointer() : () -> i64
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = func.call @cc_cons(%1933, %1932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1934) : (i64) -> ()
      %1935 = func.call @stack_pop_pointer() : () -> i64
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @cc_cons(%1936, %1935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1937) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1938 = func.call @stack_pop_pointer() : () -> i64
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @cc_cons(%1939, %1938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1940) : (i64) -> ()
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
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @cc_cons(%1954, %1953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @cc_cons(%1957, %1956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1958) : (i64) -> ()
      %1959 = func.call @stack_pop_pointer() : () -> i64
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_cons(%1960, %1959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1961) : (i64) -> ()
      %1962 = func.call @stack_pop_pointer() : () -> i64
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @cc_cons(%1963, %1962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1964) : (i64) -> ()
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
      %2218 = arith.constant 96094591647748 : i64
      %2219 = arith.constant 0 : i64
      %2220 = func.call @cc_make_closure(%2218, %2219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2220) : (i64) -> ()
      %2221 = func.call @stack_pop_pointer() : () -> i64
      %2222 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2223 = arith.constant 1 : i64
      %2224 = func.call @cc_make_string(%2222, %2223) : (!llvm.ptr, i64) -> i64
      %2225 = func.call @cc_nil_value() : () -> i64
      %2226 = func.call @cc_intern(%2224, %2225) : (i64, i64) -> i64
      %2227 = func.call @cc_nil_value() : () -> i64
      %2228 = func.call @cc_cons(%2226, %2227) : (i64, i64) -> i64
      %2229 = func.call @cc_values_pack(%2228) : (i64) -> i64
      func.call @stack_push_pointer(%2226) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2230 = func.call @stack_pop_pointer() : () -> i64
      %2231 = func.call @stack_pop_pointer() : () -> i64
      %2232 = func.call @cc_cons(%2231, %2230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2232) : (i64) -> ()
      %2233 = func.call @stack_pop_pointer() : () -> i64
      %2234 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2235 = arith.constant 11 : i64
      %2236 = func.call @cc_make_string(%2234, %2235) : (!llvm.ptr, i64) -> i64
      %2237 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2238 = arith.constant 7 : i64
      %2239 = func.call @cc_make_string(%2237, %2238) : (!llvm.ptr, i64) -> i64
      %2240 = func.call @cc_intern(%2236, %2239) : (i64, i64) -> i64
      %2241 = func.call @cc_nil_value() : () -> i64
      %2242 = func.call @cc_cons(%2240, %2241) : (i64, i64) -> i64
      %2243 = func.call @cc_values_pack(%2242) : (i64) -> i64
      func.call @stack_push_pointer(%2240) : (i64) -> ()
      %2244 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2245 = func.call @stack_pop_pointer() : () -> i64
      %2246 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2247 = arith.constant 4 : i64
      %2248 = func.call @cc_make_string(%2246, %2247) : (!llvm.ptr, i64) -> i64
      %2249 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2250 = arith.constant 7 : i64
      %2251 = func.call @cc_make_string(%2249, %2250) : (!llvm.ptr, i64) -> i64
      %2252 = func.call @cc_intern(%2248, %2251) : (i64, i64) -> i64
      %2253 = func.call @cc_nil_value() : () -> i64
      %2254 = func.call @cc_cons(%2252, %2253) : (i64, i64) -> i64
      %2255 = func.call @cc_values_pack(%2254) : (i64) -> i64
      func.call @stack_push_pointer(%2252) : (i64) -> ()
      %2256 = func.call @stack_pop_pointer() : () -> i64
      %2257 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2258 = arith.constant 6 : i64
      %2259 = func.call @cc_make_string(%2257, %2258) : (!llvm.ptr, i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = func.call @cc_intern(%2259, %2260) : (i64, i64) -> i64
      %2262 = func.call @cc_nil_value() : () -> i64
      %2263 = func.call @cc_cons(%2261, %2262) : (i64, i64) -> i64
      %2264 = func.call @cc_values_pack(%2263) : (i64) -> i64
      func.call @stack_push_pointer(%2261) : (i64) -> ()
      %2265 = func.call @stack_pop_pointer() : () -> i64
      %2266 = func.call @cc_nil_value() : () -> i64
      %2267 = func.call @cc_errorp(%1612) : (i64) -> i64
      %2268 = arith.cmpi ne, %2267, %2266 : i64
      %2269 = arith.cmpi eq, %2266, %2266 : i64
      %2270 = arith.andi %2268, %2269 : i1
      %2271 = scf.if %2270 -> (i64) {
        scf.yield %1612 : i64
      } else {
        scf.yield %2266 : i64
      }
      %2272 = func.call @cc_errorp(%1977) : (i64) -> i64
      %2273 = arith.cmpi ne, %2272, %2266 : i64
      %2274 = arith.cmpi eq, %2271, %2266 : i64
      %2275 = arith.andi %2273, %2274 : i1
      %2276 = scf.if %2275 -> (i64) {
        scf.yield %1977 : i64
      } else {
        scf.yield %2271 : i64
      }
      %2277 = func.call @cc_errorp(%2221) : (i64) -> i64
      %2278 = arith.cmpi ne, %2277, %2266 : i64
      %2279 = arith.cmpi eq, %2276, %2266 : i64
      %2280 = arith.andi %2278, %2279 : i1
      %2281 = scf.if %2280 -> (i64) {
        scf.yield %2221 : i64
      } else {
        scf.yield %2276 : i64
      }
      %2282 = func.call @cc_errorp(%2233) : (i64) -> i64
      %2283 = arith.cmpi ne, %2282, %2266 : i64
      %2284 = arith.cmpi eq, %2281, %2266 : i64
      %2285 = arith.andi %2283, %2284 : i1
      %2286 = scf.if %2285 -> (i64) {
        scf.yield %2233 : i64
      } else {
        scf.yield %2281 : i64
      }
      %2287 = func.call @cc_errorp(%2244) : (i64) -> i64
      %2288 = arith.cmpi ne, %2287, %2266 : i64
      %2289 = arith.cmpi eq, %2286, %2266 : i64
      %2290 = arith.andi %2288, %2289 : i1
      %2291 = scf.if %2290 -> (i64) {
        scf.yield %2244 : i64
      } else {
        scf.yield %2286 : i64
      }
      %2292 = func.call @cc_errorp(%2245) : (i64) -> i64
      %2293 = arith.cmpi ne, %2292, %2266 : i64
      %2294 = arith.cmpi eq, %2291, %2266 : i64
      %2295 = arith.andi %2293, %2294 : i1
      %2296 = scf.if %2295 -> (i64) {
        scf.yield %2245 : i64
      } else {
        scf.yield %2291 : i64
      }
      %2297 = func.call @cc_errorp(%2256) : (i64) -> i64
      %2298 = arith.cmpi ne, %2297, %2266 : i64
      %2299 = arith.cmpi eq, %2296, %2266 : i64
      %2300 = arith.andi %2298, %2299 : i1
      %2301 = scf.if %2300 -> (i64) {
        scf.yield %2256 : i64
      } else {
        scf.yield %2296 : i64
      }
      %2302 = func.call @cc_errorp(%2265) : (i64) -> i64
      %2303 = arith.cmpi ne, %2302, %2266 : i64
      %2304 = arith.cmpi eq, %2301, %2266 : i64
      %2305 = arith.andi %2303, %2304 : i1
      %2306 = scf.if %2305 -> (i64) {
        scf.yield %2265 : i64
      } else {
        scf.yield %2301 : i64
      }
      %2307 = arith.cmpi ne, %2306, %2266 : i64
      scf.if %2307 {
        func.call @stack_push_pointer(%2306) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1612) : (i64) -> ()
        func.call @stack_push_pointer(%1977) : (i64) -> ()
        func.call @stack_push_pointer(%2221) : (i64) -> ()
        func.call @stack_push_pointer(%2233) : (i64) -> ()
        func.call @stack_push_pointer(%2244) : (i64) -> ()
        func.call @stack_push_pointer(%2245) : (i64) -> ()
        func.call @stack_push_pointer(%2256) : (i64) -> ()
        func.call @stack_push_pointer(%2265) : (i64) -> ()
        %2308 = llvm.mlir.addressof @str234 : !llvm.ptr
        %2309 = func.call @cc_make_function_ref_const(%2308) : (!llvm.ptr) -> i64
        %2310 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2309, %2310) : (i64, i64) -> ()
      }
      %2311 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2311 : i64
    }
    %2312 = func.call @cc_nil_value() : () -> i64
    %2313 = func.call @cc_errorp(%1603) : (i64) -> i64
    %2314 = arith.cmpi ne, %2313, %2312 : i64
    %2315 = scf.if %2314 -> (i64) {
      scf.yield %1603 : i64
    } else {
      %2316 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2317 = arith.constant 25 : i64
      %2318 = func.call @cc_make_string(%2316, %2317) : (!llvm.ptr, i64) -> i64
      %2319 = func.call @cc_nil_value() : () -> i64
      %2320 = func.call @cc_intern(%2318, %2319) : (i64, i64) -> i64
      %2321 = func.call @cc_nil_value() : () -> i64
      %2322 = func.call @cc_cons(%2320, %2321) : (i64, i64) -> i64
      %2323 = func.call @cc_values_pack(%2322) : (i64) -> i64
      func.call @stack_push_pointer(%2320) : (i64) -> ()
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2326 = arith.constant 21 : i64
      %2327 = func.call @cc_make_string(%2325, %2326) : (!llvm.ptr, i64) -> i64
      %2328 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2329 = arith.constant 11 : i64
      %2330 = func.call @cc_make_string(%2328, %2329) : (!llvm.ptr, i64) -> i64
      %2331 = func.call @cc_intern(%2327, %2330) : (i64, i64) -> i64
      %2332 = func.call @cc_nil_value() : () -> i64
      %2333 = func.call @cc_cons(%2331, %2332) : (i64, i64) -> i64
      %2334 = func.call @cc_values_pack(%2333) : (i64) -> i64
      func.call @stack_push_pointer(%2331) : (i64) -> ()
      %2335 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2336 = arith.constant 17 : i64
      %2337 = func.call @cc_make_string(%2335, %2336) : (!llvm.ptr, i64) -> i64
      %2338 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2339 = arith.constant 11 : i64
      %2340 = func.call @cc_make_string(%2338, %2339) : (!llvm.ptr, i64) -> i64
      %2341 = func.call @cc_intern(%2337, %2340) : (i64, i64) -> i64
      %2342 = func.call @cc_nil_value() : () -> i64
      %2343 = func.call @cc_cons(%2341, %2342) : (i64, i64) -> i64
      %2344 = func.call @cc_values_pack(%2343) : (i64) -> i64
      func.call @stack_push_pointer(%2341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2345 = func.call @stack_pop_pointer() : () -> i64
      %2346 = func.call @stack_pop_pointer() : () -> i64
      %2347 = func.call @cc_cons(%2346, %2345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2347) : (i64) -> ()
      %2348 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2349 = arith.constant 12 : i64
      %2350 = func.call @cc_make_string(%2348, %2349) : (!llvm.ptr, i64) -> i64
      %2351 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2352 = arith.constant 11 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = func.call @cc_intern(%2350, %2353) : (i64, i64) -> i64
      %2355 = func.call @cc_nil_value() : () -> i64
      %2356 = func.call @cc_cons(%2354, %2355) : (i64, i64) -> i64
      %2357 = func.call @cc_values_pack(%2356) : (i64) -> i64
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      %2358 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2359 = arith.constant 44 : i64
      %2360 = func.call @cc_make_string(%2358, %2359) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2360) : (i64) -> ()
      %2361 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2362 = arith.constant 7 : i64
      %2363 = func.call @cc_make_string(%2361, %2362) : (!llvm.ptr, i64) -> i64
      %2364 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2365 = arith.constant 7 : i64
      %2366 = func.call @cc_make_string(%2364, %2365) : (!llvm.ptr, i64) -> i64
      %2367 = func.call @cc_intern(%2363, %2366) : (i64, i64) -> i64
      %2368 = func.call @cc_nil_value() : () -> i64
      %2369 = func.call @cc_cons(%2367, %2368) : (i64, i64) -> i64
      %2370 = func.call @cc_values_pack(%2369) : (i64) -> i64
      func.call @stack_push_pointer(%2367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2371 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2372 = arith.constant 5 : i64
      %2373 = func.call @cc_make_string(%2371, %2372) : (!llvm.ptr, i64) -> i64
      %2374 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2375 = arith.constant 7 : i64
      %2376 = func.call @cc_make_string(%2374, %2375) : (!llvm.ptr, i64) -> i64
      %2377 = func.call @cc_intern(%2373, %2376) : (i64, i64) -> i64
      %2378 = func.call @cc_nil_value() : () -> i64
      %2379 = func.call @cc_cons(%2377, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_values_pack(%2379) : (i64) -> i64
      func.call @stack_push_pointer(%2377) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2381 = func.call @stack_pop_pointer() : () -> i64
      %2382 = func.call @stack_pop_pointer() : () -> i64
      %2383 = func.call @cc_cons(%2382, %2381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2383) : (i64) -> ()
      %2384 = func.call @stack_pop_pointer() : () -> i64
      %2385 = func.call @stack_pop_pointer() : () -> i64
      %2386 = func.call @cc_cons(%2385, %2384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2386) : (i64) -> ()
      %2387 = func.call @stack_pop_pointer() : () -> i64
      %2388 = func.call @stack_pop_pointer() : () -> i64
      %2389 = func.call @cc_cons(%2388, %2387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2389) : (i64) -> ()
      %2390 = func.call @stack_pop_pointer() : () -> i64
      %2391 = func.call @stack_pop_pointer() : () -> i64
      %2392 = func.call @cc_cons(%2391, %2390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2392) : (i64) -> ()
      %2393 = func.call @stack_pop_pointer() : () -> i64
      %2394 = func.call @stack_pop_pointer() : () -> i64
      %2395 = func.call @cc_cons(%2394, %2393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2395) : (i64) -> ()
      %2396 = func.call @stack_pop_pointer() : () -> i64
      %2397 = func.call @stack_pop_pointer() : () -> i64
      %2398 = func.call @cc_cons(%2397, %2396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2398) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2399 = func.call @stack_pop_pointer() : () -> i64
      %2400 = func.call @stack_pop_pointer() : () -> i64
      %2401 = func.call @cc_cons(%2400, %2399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2401) : (i64) -> ()
      %2402 = func.call @stack_pop_pointer() : () -> i64
      %2403 = func.call @stack_pop_pointer() : () -> i64
      %2404 = func.call @cc_cons(%2403, %2402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2404) : (i64) -> ()
      %2405 = func.call @stack_pop_pointer() : () -> i64
      %2406 = func.call @stack_pop_pointer() : () -> i64
      %2407 = func.call @cc_cons(%2406, %2405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2407) : (i64) -> ()
      %2408 = func.call @stack_pop_pointer() : () -> i64
      %2489 = arith.constant 96094591647749 : i64
      %2490 = arith.constant 0 : i64
      %2491 = func.call @cc_make_closure(%2489, %2490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2491) : (i64) -> ()
      %2492 = func.call @stack_pop_pointer() : () -> i64
      %2493 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2494 = arith.constant 0 : i64
      %2495 = func.call @cc_make_string(%2493, %2494) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2495) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2496 = func.call @stack_pop_pointer() : () -> i64
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @cc_cons(%2497, %2496) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2498) : (i64) -> ()
      %2499 = func.call @stack_pop_pointer() : () -> i64
      %2500 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2501 = arith.constant 11 : i64
      %2502 = func.call @cc_make_string(%2500, %2501) : (!llvm.ptr, i64) -> i64
      %2503 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2504 = arith.constant 7 : i64
      %2505 = func.call @cc_make_string(%2503, %2504) : (!llvm.ptr, i64) -> i64
      %2506 = func.call @cc_intern(%2502, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_nil_value() : () -> i64
      %2508 = func.call @cc_cons(%2506, %2507) : (i64, i64) -> i64
      %2509 = func.call @cc_values_pack(%2508) : (i64) -> i64
      func.call @stack_push_pointer(%2506) : (i64) -> ()
      %2510 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2511 = func.call @stack_pop_pointer() : () -> i64
      %2512 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2513 = arith.constant 4 : i64
      %2514 = func.call @cc_make_string(%2512, %2513) : (!llvm.ptr, i64) -> i64
      %2515 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2516 = arith.constant 7 : i64
      %2517 = func.call @cc_make_string(%2515, %2516) : (!llvm.ptr, i64) -> i64
      %2518 = func.call @cc_intern(%2514, %2517) : (i64, i64) -> i64
      %2519 = func.call @cc_nil_value() : () -> i64
      %2520 = func.call @cc_cons(%2518, %2519) : (i64, i64) -> i64
      %2521 = func.call @cc_values_pack(%2520) : (i64) -> i64
      func.call @stack_push_pointer(%2518) : (i64) -> ()
      %2522 = func.call @stack_pop_pointer() : () -> i64
      %2523 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2524 = arith.constant 6 : i64
      %2525 = func.call @cc_make_string(%2523, %2524) : (!llvm.ptr, i64) -> i64
      %2526 = func.call @cc_nil_value() : () -> i64
      %2527 = func.call @cc_intern(%2525, %2526) : (i64, i64) -> i64
      %2528 = func.call @cc_nil_value() : () -> i64
      %2529 = func.call @cc_cons(%2527, %2528) : (i64, i64) -> i64
      %2530 = func.call @cc_values_pack(%2529) : (i64) -> i64
      func.call @stack_push_pointer(%2527) : (i64) -> ()
      %2531 = func.call @stack_pop_pointer() : () -> i64
      %2532 = func.call @cc_nil_value() : () -> i64
      %2533 = func.call @cc_errorp(%2324) : (i64) -> i64
      %2534 = arith.cmpi ne, %2533, %2532 : i64
      %2535 = arith.cmpi eq, %2532, %2532 : i64
      %2536 = arith.andi %2534, %2535 : i1
      %2537 = scf.if %2536 -> (i64) {
        scf.yield %2324 : i64
      } else {
        scf.yield %2532 : i64
      }
      %2538 = func.call @cc_errorp(%2408) : (i64) -> i64
      %2539 = arith.cmpi ne, %2538, %2532 : i64
      %2540 = arith.cmpi eq, %2537, %2532 : i64
      %2541 = arith.andi %2539, %2540 : i1
      %2542 = scf.if %2541 -> (i64) {
        scf.yield %2408 : i64
      } else {
        scf.yield %2537 : i64
      }
      %2543 = func.call @cc_errorp(%2492) : (i64) -> i64
      %2544 = arith.cmpi ne, %2543, %2532 : i64
      %2545 = arith.cmpi eq, %2542, %2532 : i64
      %2546 = arith.andi %2544, %2545 : i1
      %2547 = scf.if %2546 -> (i64) {
        scf.yield %2492 : i64
      } else {
        scf.yield %2542 : i64
      }
      %2548 = func.call @cc_errorp(%2499) : (i64) -> i64
      %2549 = arith.cmpi ne, %2548, %2532 : i64
      %2550 = arith.cmpi eq, %2547, %2532 : i64
      %2551 = arith.andi %2549, %2550 : i1
      %2552 = scf.if %2551 -> (i64) {
        scf.yield %2499 : i64
      } else {
        scf.yield %2547 : i64
      }
      %2553 = func.call @cc_errorp(%2510) : (i64) -> i64
      %2554 = arith.cmpi ne, %2553, %2532 : i64
      %2555 = arith.cmpi eq, %2552, %2532 : i64
      %2556 = arith.andi %2554, %2555 : i1
      %2557 = scf.if %2556 -> (i64) {
        scf.yield %2510 : i64
      } else {
        scf.yield %2552 : i64
      }
      %2558 = func.call @cc_errorp(%2511) : (i64) -> i64
      %2559 = arith.cmpi ne, %2558, %2532 : i64
      %2560 = arith.cmpi eq, %2557, %2532 : i64
      %2561 = arith.andi %2559, %2560 : i1
      %2562 = scf.if %2561 -> (i64) {
        scf.yield %2511 : i64
      } else {
        scf.yield %2557 : i64
      }
      %2563 = func.call @cc_errorp(%2522) : (i64) -> i64
      %2564 = arith.cmpi ne, %2563, %2532 : i64
      %2565 = arith.cmpi eq, %2562, %2532 : i64
      %2566 = arith.andi %2564, %2565 : i1
      %2567 = scf.if %2566 -> (i64) {
        scf.yield %2522 : i64
      } else {
        scf.yield %2562 : i64
      }
      %2568 = func.call @cc_errorp(%2531) : (i64) -> i64
      %2569 = arith.cmpi ne, %2568, %2532 : i64
      %2570 = arith.cmpi eq, %2567, %2532 : i64
      %2571 = arith.andi %2569, %2570 : i1
      %2572 = scf.if %2571 -> (i64) {
        scf.yield %2531 : i64
      } else {
        scf.yield %2567 : i64
      }
      %2573 = arith.cmpi ne, %2572, %2532 : i64
      scf.if %2573 {
        func.call @stack_push_pointer(%2572) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2324) : (i64) -> ()
        func.call @stack_push_pointer(%2408) : (i64) -> ()
        func.call @stack_push_pointer(%2492) : (i64) -> ()
        func.call @stack_push_pointer(%2499) : (i64) -> ()
        func.call @stack_push_pointer(%2510) : (i64) -> ()
        func.call @stack_push_pointer(%2511) : (i64) -> ()
        func.call @stack_push_pointer(%2522) : (i64) -> ()
        func.call @stack_push_pointer(%2531) : (i64) -> ()
        %2574 = llvm.mlir.addressof @str260 : !llvm.ptr
        %2575 = func.call @cc_make_function_ref_const(%2574) : (!llvm.ptr) -> i64
        %2576 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2575, %2576) : (i64, i64) -> ()
      }
      %2577 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2577 : i64
    }
    func.call @stack_push_pointer(%2315) : (i64) -> ()
    %2578 = func.call @stack_pop_pointer() : () -> i64
    %2579 = func.call @cc_multiple_value_list(%2578) : (i64) -> i64
    %2580 = llvm.mlir.addressof @str261 : !llvm.ptr
    %2581 = arith.constant 37 : i64
    %2582 = func.call @cc_make_string(%2580, %2581) : (!llvm.ptr, i64) -> i64
    %2583 = func.call @cc_nil_value() : () -> i64
    %2584 = func.call @cc_intern(%2582, %2583) : (i64, i64) -> i64
    %2585 = func.call @cc_nil_value() : () -> i64
    %2586 = func.call @cc_cons(%2584, %2585) : (i64, i64) -> i64
    %2587 = func.call @cc_values_pack(%2586) : (i64) -> i64
    %2588 = func.call @cc_symbol_value(%2584) : (i64) -> i64
    %2589 = llvm.mlir.addressof @str262 : !llvm.ptr
    %2590 = arith.constant 39 : i64
    %2591 = func.call @cc_make_string(%2589, %2590) : (!llvm.ptr, i64) -> i64
    %2592 = func.call @cc_nil_value() : () -> i64
    %2593 = func.call @cc_intern(%2591, %2592) : (i64, i64) -> i64
    %2594 = func.call @cc_nil_value() : () -> i64
    %2595 = func.call @cc_cons(%2593, %2594) : (i64, i64) -> i64
    %2596 = func.call @cc_values_pack(%2595) : (i64) -> i64
    %2597 = func.call @cc_symbol_value(%2593) : (i64) -> i64
    %2598 = func.call @cc_nil_value() : () -> i64
    %2599 = arith.cmpi ne, %2588, %2598 : i64
    %2600 = scf.if %2599 -> (i64) {
      scf.yield %2597 : i64
    } else {
      scf.yield %2579 : i64
    }
    %2601 = func.call @cc_values_pack(%2600) : (i64) -> i64
    func.call @stack_push_pointer(%2601) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_96094591647745"() {
    %121 = func.call @cc_nil_value() : () -> i64
    %122 = func.call @cc_nil_value() : () -> i64
    %123 = func.call @cc_errorp(%121) : (i64) -> i64
    %124 = arith.cmpi ne, %123, %122 : i64
    %125 = scf.if %124 -> (i64) {
      scf.yield %121 : i64
    } else {
      %126 = llvm.mlir.addressof @str14 : !llvm.ptr
      %127 = arith.constant 9 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%128) : (i64) -> ()
      %129 = func.call @stack_pop_pointer() : () -> i64
      %130 = llvm.mlir.addressof @str15 : !llvm.ptr
      %131 = arith.constant 11 : i64
      %132 = func.call @cc_make_string(%130, %131) : (!llvm.ptr, i64) -> i64
      %133 = llvm.mlir.addressof @str16 : !llvm.ptr
      %134 = arith.constant 7 : i64
      %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
      %136 = func.call @cc_intern(%132, %135) : (i64, i64) -> i64
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_cons(%136, %137) : (i64, i64) -> i64
      %139 = func.call @cc_values_pack(%138) : (i64) -> i64
      func.call @stack_push_pointer(%136) : (i64) -> ()
      %140 = func.call @stack_pop_pointer() : () -> i64
      %141 = llvm.mlir.addressof @str17 : !llvm.ptr
      %142 = arith.constant 12 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%143) : (i64) -> ()
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_errorp(%129) : (i64) -> i64
      %147 = arith.cmpi ne, %146, %145 : i64
      %148 = arith.cmpi eq, %145, %145 : i64
      %149 = arith.andi %147, %148 : i1
      %150 = scf.if %149 -> (i64) {
        scf.yield %129 : i64
      } else {
        scf.yield %145 : i64
      }
      %151 = func.call @cc_errorp(%140) : (i64) -> i64
      %152 = arith.cmpi ne, %151, %145 : i64
      %153 = arith.cmpi eq, %150, %145 : i64
      %154 = arith.andi %152, %153 : i1
      %155 = scf.if %154 -> (i64) {
        scf.yield %140 : i64
      } else {
        scf.yield %150 : i64
      }
      %156 = func.call @cc_errorp(%144) : (i64) -> i64
      %157 = arith.cmpi ne, %156, %145 : i64
      %158 = arith.cmpi eq, %155, %145 : i64
      %159 = arith.andi %157, %158 : i1
      %160 = scf.if %159 -> (i64) {
        scf.yield %144 : i64
      } else {
        scf.yield %155 : i64
      }
      %161 = arith.cmpi ne, %160, %145 : i64
      scf.if %161 {
        func.call @stack_push_pointer(%160) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%129) : (i64) -> ()
        func.call @stack_push_pointer(%140) : (i64) -> ()
        func.call @stack_push_pointer(%144) : (i64) -> ()
        %162 = llvm.mlir.addressof @str18 : !llvm.ptr
        %163 = func.call @cc_make_function_ref_const(%162) : (!llvm.ptr) -> i64
        %164 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%163, %164) : (i64, i64) -> ()
      }
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_errorp(%165) : (i64) -> i64
      %168 = arith.cmpi ne, %167, %166 : i64
      %169 = arith.cmpi eq, %166, %166 : i64
      %170 = arith.andi %168, %169 : i1
      %171 = scf.if %170 -> (i64) {
        scf.yield %165 : i64
      } else {
        scf.yield %166 : i64
      }
      %172 = arith.cmpi ne, %171, %166 : i64
      scf.if %172 {
        func.call @stack_push_pointer(%171) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%165) : (i64) -> ()
        %173 = llvm.mlir.addressof @str19 : !llvm.ptr
        %174 = func.call @cc_make_function_ref_const(%173) : (!llvm.ptr) -> i64
        %175 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%174, %175) : (i64, i64) -> ()
      }
      %176 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %176 : i64
    }
    func.call @stack_push_pointer(%125) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647746"() {
    %616 = func.call @cc_nil_value() : () -> i64
    %617 = func.call @cc_nil_value() : () -> i64
    %618 = func.call @cc_errorp(%616) : (i64) -> i64
    %619 = arith.cmpi ne, %618, %617 : i64
    %620 = scf.if %619 -> (i64) {
      scf.yield %616 : i64
    } else {
      %621 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = llvm.mlir.addressof @str65 : !llvm.ptr
      %624 = arith.constant 44 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%625) : (i64) -> ()
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = llvm.mlir.addressof @str66 : !llvm.ptr
      %628 = arith.constant 28 : i64
      %629 = func.call @cc_make_symbol(%627, %628) : (!llvm.ptr, i64) -> i64
      %630 = func.call @cc_symbol_value(%629) : (i64) -> i64
      %631 = func.call @cc_set_symbol_value(%629, %622) : (i64, i64) -> i64
      %632 = func.call @cc_nil_value() : () -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_errorp(%632) : (i64) -> i64
      %635 = arith.cmpi ne, %634, %633 : i64
      %636 = scf.if %635 -> (i64) {
        scf.yield %632 : i64
      } else {
        %637 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%637) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %638 = func.call @stack_pop_pointer() : () -> i64
        %639 = func.call @stack_pop_pointer() : () -> i64
        %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
        func.call @stack_push_pointer(%640) : (i64) -> ()
        %641 = llvm.mlir.addressof @str67 : !llvm.ptr
        %642 = arith.constant 5 : i64
        %643 = func.call @cc_make_string(%641, %642) : (!llvm.ptr, i64) -> i64
        %644 = llvm.mlir.addressof @str68 : !llvm.ptr
        %645 = arith.constant 7 : i64
        %646 = func.call @cc_make_string(%644, %645) : (!llvm.ptr, i64) -> i64
        %647 = func.call @cc_intern(%643, %646) : (i64, i64) -> i64
        %648 = func.call @cc_nil_value() : () -> i64
        %649 = func.call @cc_cons(%647, %648) : (i64, i64) -> i64
        %650 = func.call @cc_values_pack(%649) : (i64) -> i64
        func.call @stack_push_pointer(%647) : (i64) -> ()
        %651 = func.call @stack_pop_pointer() : () -> i64
        %652 = func.call @stack_pop_pointer() : () -> i64
        %653 = func.call @cc_cons(%651, %652) : (i64, i64) -> i64
        func.call @stack_push_pointer(%653) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %654 = func.call @stack_pop_pointer() : () -> i64
        %655 = func.call @stack_pop_pointer() : () -> i64
        %656 = func.call @cc_cons(%654, %655) : (i64, i64) -> i64
        func.call @stack_push_pointer(%656) : (i64) -> ()
        %657 = llvm.mlir.addressof @str69 : !llvm.ptr
        %658 = arith.constant 7 : i64
        %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
        %660 = llvm.mlir.addressof @str70 : !llvm.ptr
        %661 = arith.constant 7 : i64
        %662 = func.call @cc_make_string(%660, %661) : (!llvm.ptr, i64) -> i64
        %663 = func.call @cc_intern(%659, %662) : (i64, i64) -> i64
        %664 = func.call @cc_nil_value() : () -> i64
        %665 = func.call @cc_cons(%663, %664) : (i64, i64) -> i64
        %666 = func.call @cc_values_pack(%665) : (i64) -> i64
        func.call @stack_push_pointer(%663) : (i64) -> ()
        %667 = func.call @stack_pop_pointer() : () -> i64
        %668 = func.call @stack_pop_pointer() : () -> i64
        %669 = func.call @cc_cons(%667, %668) : (i64, i64) -> i64
        func.call @stack_push_pointer(%669) : (i64) -> ()
        %670 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%670) : (i64) -> ()
        %671 = llvm.mlir.addressof @str71 : !llvm.ptr
        %672 = arith.constant 4 : i64
        %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
        %674 = func.call @cc_nil_value() : () -> i64
        %675 = func.call @cc_intern(%673, %674) : (i64, i64) -> i64
        %676 = func.call @cc_nil_value() : () -> i64
        %677 = func.call @cc_cons(%675, %676) : (i64, i64) -> i64
        %678 = func.call @cc_values_pack(%677) : (i64) -> i64
        func.call @stack_push_pointer(%675) : (i64) -> ()
        %679 = func.call @stack_pop_pointer() : () -> i64
        %680 = func.call @stack_pop_pointer() : () -> i64
        %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
        func.call @stack_push_pointer(%681) : (i64) -> ()
        %682 = llvm.mlir.addressof @str72 : !llvm.ptr
        %683 = arith.constant 8 : i64
        %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
        %685 = llvm.mlir.addressof @str73 : !llvm.ptr
        %686 = arith.constant 7 : i64
        %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
        %688 = func.call @cc_intern(%684, %687) : (i64, i64) -> i64
        %689 = func.call @cc_nil_value() : () -> i64
        %690 = func.call @cc_cons(%688, %689) : (i64, i64) -> i64
        %691 = func.call @cc_values_pack(%690) : (i64) -> i64
        func.call @stack_push_pointer(%688) : (i64) -> ()
        %692 = func.call @stack_pop_pointer() : () -> i64
        %693 = func.call @stack_pop_pointer() : () -> i64
        %694 = func.call @cc_cons(%692, %693) : (i64, i64) -> i64
        func.call @stack_push_pointer(%694) : (i64) -> ()
        %695 = llvm.mlir.addressof @str74 : !llvm.ptr
        %696 = arith.constant 7 : i64
        %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%697) : (i64) -> ()
        %698 = func.call @stack_pop_pointer() : () -> i64
        %699 = func.call @stack_pop_pointer() : () -> i64
        %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
        func.call @stack_push_pointer(%700) : (i64) -> ()
        %701 = llvm.mlir.addressof @str75 : !llvm.ptr
        %702 = arith.constant 4 : i64
        %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
        %704 = llvm.mlir.addressof @str76 : !llvm.ptr
        %705 = arith.constant 7 : i64
        %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
        %707 = func.call @cc_intern(%703, %706) : (i64, i64) -> i64
        %708 = func.call @cc_nil_value() : () -> i64
        %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
        %710 = func.call @cc_values_pack(%709) : (i64) -> i64
        func.call @stack_push_pointer(%707) : (i64) -> ()
        %711 = func.call @stack_pop_pointer() : () -> i64
        %712 = func.call @stack_pop_pointer() : () -> i64
        %713 = func.call @cc_cons(%711, %712) : (i64, i64) -> i64
        func.call @stack_push_pointer(%713) : (i64) -> ()
        %714 = llvm.mlir.addressof @str77 : !llvm.ptr
        %715 = arith.constant 13 : i64
        %716 = func.call @cc_make_string(%714, %715) : (!llvm.ptr, i64) -> i64
        %717 = llvm.mlir.addressof @str78 : !llvm.ptr
        %718 = arith.constant 11 : i64
        %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
        %720 = func.call @cc_intern(%716, %719) : (i64, i64) -> i64
        %721 = func.call @cc_nil_value() : () -> i64
        %722 = func.call @cc_cons(%720, %721) : (i64, i64) -> i64
        %723 = func.call @cc_values_pack(%722) : (i64) -> i64
        func.call @stack_push_pointer(%720) : (i64) -> ()
        %724 = func.call @stack_pop_pointer() : () -> i64
        %725 = func.call @stack_pop_pointer() : () -> i64
        %726 = func.call @cc_cons(%724, %725) : (i64, i64) -> i64
        func.call @stack_push_pointer(%726) : (i64) -> ()
        %727 = func.call @stack_pop_pointer() : () -> i64
        %728 = func.call @stack_pop_pointer() : () -> i64
        %729 = func.call @cc_cons(%727, %728) : (i64, i64) -> i64
        func.call @stack_push_pointer(%729) : (i64) -> ()
        %730 = llvm.mlir.addressof @str79 : !llvm.ptr
        %731 = arith.constant 11 : i64
        %732 = func.call @cc_make_string(%730, %731) : (!llvm.ptr, i64) -> i64
        %733 = llvm.mlir.addressof @str80 : !llvm.ptr
        %734 = arith.constant 7 : i64
        %735 = func.call @cc_make_string(%733, %734) : (!llvm.ptr, i64) -> i64
        %736 = func.call @cc_intern(%732, %735) : (i64, i64) -> i64
        %737 = func.call @cc_nil_value() : () -> i64
        %738 = func.call @cc_cons(%736, %737) : (i64, i64) -> i64
        %739 = func.call @cc_values_pack(%738) : (i64) -> i64
        func.call @stack_push_pointer(%736) : (i64) -> ()
        %740 = func.call @stack_pop_pointer() : () -> i64
        %741 = func.call @stack_pop_pointer() : () -> i64
        %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
        func.call @stack_push_pointer(%742) : (i64) -> ()
        %743 = llvm.mlir.addressof @str81 : !llvm.ptr
        %744 = arith.constant 4 : i64
        %745 = func.call @cc_make_string(%743, %744) : (!llvm.ptr, i64) -> i64
        %746 = func.call @cc_nil_value() : () -> i64
        %747 = func.call @cc_intern(%745, %746) : (i64, i64) -> i64
        %748 = func.call @cc_nil_value() : () -> i64
        %749 = func.call @cc_cons(%747, %748) : (i64, i64) -> i64
        %750 = func.call @cc_values_pack(%749) : (i64) -> i64
        func.call @stack_push_pointer(%747) : (i64) -> ()
        %751 = func.call @stack_pop_pointer() : () -> i64
        %752 = func.call @stack_pop_pointer() : () -> i64
        %753 = func.call @cc_cons(%751, %752) : (i64, i64) -> i64
        func.call @stack_push_pointer(%753) : (i64) -> ()
        %754 = llvm.mlir.addressof @str82 : !llvm.ptr
        %755 = arith.constant 12 : i64
        %756 = func.call @cc_make_string(%754, %755) : (!llvm.ptr, i64) -> i64
        %757 = func.call @cc_nil_value() : () -> i64
        %758 = func.call @cc_intern(%756, %757) : (i64, i64) -> i64
        %759 = func.call @cc_nil_value() : () -> i64
        %760 = func.call @cc_cons(%758, %759) : (i64, i64) -> i64
        %761 = func.call @cc_values_pack(%760) : (i64) -> i64
        func.call @stack_push_pointer(%758) : (i64) -> ()
        %762 = func.call @stack_pop_pointer() : () -> i64
        %763 = func.call @stack_pop_pointer() : () -> i64
        %764 = func.call @cc_cons(%762, %763) : (i64, i64) -> i64
        func.call @stack_push_pointer(%764) : (i64) -> ()
        %765 = func.call @stack_pop_pointer() : () -> i64
        %766 = func.call @cc_nil_value() : () -> i64
        %767 = func.call @cc_cons(%765, %766) : (i64, i64) -> i64
        %768 = llvm.mlir.addressof @str83 : !llvm.ptr
        %769 = arith.constant 4 : i64
        %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
        %771 = func.call @cc_nil_value() : () -> i64
        %772 = func.call @cc_intern(%770, %771) : (i64, i64) -> i64
        %773 = func.call @cc_nil_value() : () -> i64
        %774 = func.call @cc_cons(%772, %773) : (i64, i64) -> i64
        %775 = func.call @cc_values_pack(%774) : (i64) -> i64
        %776 = func.call @cc_symbol_value(%772) : (i64) -> i64
        %777 = func.call @cc_set_symbol_value(%772, %626) : (i64, i64) -> i64
        %778 = func.call @cc_eval(%767) : (i64) -> i64
        %779 = func.call @cc_multiple_value_list(%778) : (i64) -> i64
        %780 = func.call @cc_symbol_value(%772) : (i64) -> i64
        %781 = func.call @cc_set_symbol_value(%772, %776) : (i64, i64) -> i64
        %782 = func.call @cc_values_pack(%779) : (i64) -> i64
        func.call @stack_push_pointer(%782) : (i64) -> ()
        %783 = func.call @stack_pop_pointer() : () -> i64
        %784 = func.call @cc_nil_value() : () -> i64
        %785 = func.call @cc_nil_value() : () -> i64
        %786 = func.call @cc_errorp(%784) : (i64) -> i64
        %787 = arith.cmpi ne, %786, %785 : i64
        %788 = scf.if %787 -> (i64) {
          scf.yield %784 : i64
        } else {
          %789 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%783) : (i64) -> ()
          %790 = func.call @stack_pop_pointer() : () -> i64
          %791 = func.call @cc_nil_value() : () -> i64
          %792 = func.call @cc_errorp(%790) : (i64) -> i64
          %793 = arith.cmpi ne, %792, %791 : i64
          %794 = arith.cmpi eq, %791, %791 : i64
          %795 = arith.andi %793, %794 : i1
          %796 = scf.if %795 -> (i64) {
            scf.yield %790 : i64
          } else {
            scf.yield %791 : i64
          }
          %797 = arith.cmpi ne, %796, %791 : i64
          scf.if %797 {
            func.call @stack_push_pointer(%796) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%790) : (i64) -> ()
            %798 = llvm.mlir.addressof @str84 : !llvm.ptr
            %799 = func.call @cc_make_function_ref_const(%798) : (!llvm.ptr) -> i64
            %800 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%799, %800) : (i64, i64) -> ()
          }
          %801 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %802 = llvm.mlir.addressof @str85 : !llvm.ptr
          %803 = arith.constant 7 : i64
          %804 = func.call @cc_make_string(%802, %803) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%804) : (i64) -> ()
          %805 = func.call @stack_pop_pointer() : () -> i64
          %806 = func.call @stack_pop_pointer() : () -> i64
          %807 = func.call @cc_cons(%805, %806) : (i64, i64) -> i64
          func.call @stack_push_pointer(%807) : (i64) -> ()
          func.call @stack_push_pointer(%783) : (i64) -> ()
          %808 = func.call @stack_pop_pointer() : () -> i64
          %809 = func.call @cc_nil_value() : () -> i64
          %810 = func.call @cc_errorp(%808) : (i64) -> i64
          %811 = arith.cmpi ne, %810, %809 : i64
          %812 = arith.cmpi eq, %809, %809 : i64
          %813 = arith.andi %811, %812 : i1
          %814 = scf.if %813 -> (i64) {
            scf.yield %808 : i64
          } else {
            scf.yield %809 : i64
          }
          %815 = arith.cmpi ne, %814, %809 : i64
          scf.if %815 {
            func.call @stack_push_pointer(%814) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%808) : (i64) -> ()
            %816 = llvm.mlir.addressof @str86 : !llvm.ptr
            %817 = func.call @cc_make_function_ref_const(%816) : (!llvm.ptr) -> i64
            %818 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%817, %818) : (i64, i64) -> ()
          }
          %819 = func.call @stack_pop_pointer() : () -> i64
          %820 = func.call @stack_pop_pointer() : () -> i64
          %821 = func.call @cc_cons(%819, %820) : (i64, i64) -> i64
          func.call @stack_push_pointer(%821) : (i64) -> ()
          %822 = func.call @stack_pop_pointer() : () -> i64
          %823 = func.call @cc_string_equal_full(%822) : (i64) -> i64
          func.call @stack_push_pointer(%823) : (i64) -> ()
          %824 = func.call @stack_pop_pointer() : () -> i64
          %825 = func.call @cc_cons(%824, %789) : (i64, i64) -> i64
          %826 = func.call @cc_cons(%801, %825) : (i64, i64) -> i64
          %827 = func.call @cc_and(%826) : (i64) -> i64
          func.call @stack_push_pointer(%827) : (i64) -> ()
          %828 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %828 : i64
        }
        func.call @stack_push_pointer(%788) : (i64) -> ()
        %829 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %829 : i64
      }
      func.call @stack_push_pointer(%636) : (i64) -> ()
      %830 = func.call @cc_restore_symbol_value(%629, %630) : (i64, i64) -> i64
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = func.call @cc_nil_value() : () -> i64
      %833 = func.call @cc_cons(%831, %832) : (i64, i64) -> i64
      %834 = func.call @cc_not(%833) : (i64) -> i64
      func.call @stack_push_pointer(%834) : (i64) -> ()
      %835 = func.call @stack_pop_pointer() : () -> i64
      %836 = func.call @cc_nil_value() : () -> i64
      %837 = func.call @cc_cons(%835, %836) : (i64, i64) -> i64
      %838 = func.call @cc_not(%837) : (i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      %839 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %839 : i64
    }
    func.call @stack_push_pointer(%620) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647747"() {
    %1283 = func.call @cc_nil_value() : () -> i64
    %1284 = func.call @cc_nil_value() : () -> i64
    %1285 = func.call @cc_errorp(%1283) : (i64) -> i64
    %1286 = arith.cmpi ne, %1285, %1284 : i64
    %1287 = scf.if %1286 -> (i64) {
      scf.yield %1283 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1288 = func.call @stack_pop_pointer() : () -> i64
      %1289 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1290 = arith.constant 44 : i64
      %1291 = func.call @cc_make_string(%1289, %1290) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1291) : (i64) -> ()
      %1292 = func.call @stack_pop_pointer() : () -> i64
      %1293 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1294 = arith.constant 28 : i64
      %1295 = func.call @cc_make_symbol(%1293, %1294) : (!llvm.ptr, i64) -> i64
      %1296 = func.call @cc_symbol_value(%1295) : (i64) -> i64
      %1297 = func.call @cc_set_symbol_value(%1295, %1288) : (i64, i64) -> i64
      %1298 = func.call @cc_nil_value() : () -> i64
      %1299 = func.call @cc_nil_value() : () -> i64
      %1300 = func.call @cc_errorp(%1298) : (i64) -> i64
      %1301 = arith.cmpi ne, %1300, %1299 : i64
      %1302 = scf.if %1301 -> (i64) {
        scf.yield %1298 : i64
      } else {
        %1303 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1303) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1304 = func.call @stack_pop_pointer() : () -> i64
        %1305 = func.call @stack_pop_pointer() : () -> i64
        %1306 = func.call @cc_cons(%1304, %1305) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1306) : (i64) -> ()
        %1307 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1308 = arith.constant 5 : i64
        %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
        %1310 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1311 = arith.constant 7 : i64
        %1312 = func.call @cc_make_string(%1310, %1311) : (!llvm.ptr, i64) -> i64
        %1313 = func.call @cc_intern(%1309, %1312) : (i64, i64) -> i64
        %1314 = func.call @cc_nil_value() : () -> i64
        %1315 = func.call @cc_cons(%1313, %1314) : (i64, i64) -> i64
        %1316 = func.call @cc_values_pack(%1315) : (i64) -> i64
        func.call @stack_push_pointer(%1313) : (i64) -> ()
        %1317 = func.call @stack_pop_pointer() : () -> i64
        %1318 = func.call @stack_pop_pointer() : () -> i64
        %1319 = func.call @cc_cons(%1317, %1318) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1319) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1320 = func.call @stack_pop_pointer() : () -> i64
        %1321 = func.call @stack_pop_pointer() : () -> i64
        %1322 = func.call @cc_cons(%1320, %1321) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1322) : (i64) -> ()
        %1323 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1324 = arith.constant 7 : i64
        %1325 = func.call @cc_make_string(%1323, %1324) : (!llvm.ptr, i64) -> i64
        %1326 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1327 = arith.constant 7 : i64
        %1328 = func.call @cc_make_string(%1326, %1327) : (!llvm.ptr, i64) -> i64
        %1329 = func.call @cc_intern(%1325, %1328) : (i64, i64) -> i64
        %1330 = func.call @cc_nil_value() : () -> i64
        %1331 = func.call @cc_cons(%1329, %1330) : (i64, i64) -> i64
        %1332 = func.call @cc_values_pack(%1331) : (i64) -> i64
        func.call @stack_push_pointer(%1329) : (i64) -> ()
        %1333 = func.call @stack_pop_pointer() : () -> i64
        %1334 = func.call @stack_pop_pointer() : () -> i64
        %1335 = func.call @cc_cons(%1333, %1334) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1335) : (i64) -> ()
        %1336 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1336) : (i64) -> ()
        %1337 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1338 = arith.constant 4 : i64
        %1339 = func.call @cc_make_string(%1337, %1338) : (!llvm.ptr, i64) -> i64
        %1340 = func.call @cc_nil_value() : () -> i64
        %1341 = func.call @cc_intern(%1339, %1340) : (i64, i64) -> i64
        %1342 = func.call @cc_nil_value() : () -> i64
        %1343 = func.call @cc_cons(%1341, %1342) : (i64, i64) -> i64
        %1344 = func.call @cc_values_pack(%1343) : (i64) -> i64
        func.call @stack_push_pointer(%1341) : (i64) -> ()
        %1345 = func.call @stack_pop_pointer() : () -> i64
        %1346 = func.call @stack_pop_pointer() : () -> i64
        %1347 = func.call @cc_cons(%1345, %1346) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1347) : (i64) -> ()
        %1348 = llvm.mlir.addressof @str139 : !llvm.ptr
        %1349 = arith.constant 8 : i64
        %1350 = func.call @cc_make_string(%1348, %1349) : (!llvm.ptr, i64) -> i64
        %1351 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1352 = arith.constant 7 : i64
        %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
        %1354 = func.call @cc_intern(%1350, %1353) : (i64, i64) -> i64
        %1355 = func.call @cc_nil_value() : () -> i64
        %1356 = func.call @cc_cons(%1354, %1355) : (i64, i64) -> i64
        %1357 = func.call @cc_values_pack(%1356) : (i64) -> i64
        func.call @stack_push_pointer(%1354) : (i64) -> ()
        %1358 = func.call @stack_pop_pointer() : () -> i64
        %1359 = func.call @stack_pop_pointer() : () -> i64
        %1360 = func.call @cc_cons(%1358, %1359) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1360) : (i64) -> ()
        %1361 = llvm.mlir.addressof @str141 : !llvm.ptr
        %1362 = arith.constant 7 : i64
        %1363 = func.call @cc_make_string(%1361, %1362) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1363) : (i64) -> ()
        %1364 = func.call @stack_pop_pointer() : () -> i64
        %1365 = func.call @stack_pop_pointer() : () -> i64
        %1366 = func.call @cc_cons(%1364, %1365) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1366) : (i64) -> ()
        %1367 = llvm.mlir.addressof @str142 : !llvm.ptr
        %1368 = arith.constant 4 : i64
        %1369 = func.call @cc_make_string(%1367, %1368) : (!llvm.ptr, i64) -> i64
        %1370 = llvm.mlir.addressof @str143 : !llvm.ptr
        %1371 = arith.constant 7 : i64
        %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
        %1373 = func.call @cc_intern(%1369, %1372) : (i64, i64) -> i64
        %1374 = func.call @cc_nil_value() : () -> i64
        %1375 = func.call @cc_cons(%1373, %1374) : (i64, i64) -> i64
        %1376 = func.call @cc_values_pack(%1375) : (i64) -> i64
        func.call @stack_push_pointer(%1373) : (i64) -> ()
        %1377 = func.call @stack_pop_pointer() : () -> i64
        %1378 = func.call @stack_pop_pointer() : () -> i64
        %1379 = func.call @cc_cons(%1377, %1378) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1379) : (i64) -> ()
        %1380 = llvm.mlir.addressof @str144 : !llvm.ptr
        %1381 = arith.constant 13 : i64
        %1382 = func.call @cc_make_string(%1380, %1381) : (!llvm.ptr, i64) -> i64
        %1383 = llvm.mlir.addressof @str145 : !llvm.ptr
        %1384 = arith.constant 11 : i64
        %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
        %1386 = func.call @cc_intern(%1382, %1385) : (i64, i64) -> i64
        %1387 = func.call @cc_nil_value() : () -> i64
        %1388 = func.call @cc_cons(%1386, %1387) : (i64, i64) -> i64
        %1389 = func.call @cc_values_pack(%1388) : (i64) -> i64
        func.call @stack_push_pointer(%1386) : (i64) -> ()
        %1390 = func.call @stack_pop_pointer() : () -> i64
        %1391 = func.call @stack_pop_pointer() : () -> i64
        %1392 = func.call @cc_cons(%1390, %1391) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1392) : (i64) -> ()
        %1393 = func.call @stack_pop_pointer() : () -> i64
        %1394 = func.call @stack_pop_pointer() : () -> i64
        %1395 = func.call @cc_cons(%1393, %1394) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1395) : (i64) -> ()
        %1396 = llvm.mlir.addressof @str146 : !llvm.ptr
        %1397 = arith.constant 11 : i64
        %1398 = func.call @cc_make_string(%1396, %1397) : (!llvm.ptr, i64) -> i64
        %1399 = llvm.mlir.addressof @str147 : !llvm.ptr
        %1400 = arith.constant 7 : i64
        %1401 = func.call @cc_make_string(%1399, %1400) : (!llvm.ptr, i64) -> i64
        %1402 = func.call @cc_intern(%1398, %1401) : (i64, i64) -> i64
        %1403 = func.call @cc_nil_value() : () -> i64
        %1404 = func.call @cc_cons(%1402, %1403) : (i64, i64) -> i64
        %1405 = func.call @cc_values_pack(%1404) : (i64) -> i64
        func.call @stack_push_pointer(%1402) : (i64) -> ()
        %1406 = func.call @stack_pop_pointer() : () -> i64
        %1407 = func.call @stack_pop_pointer() : () -> i64
        %1408 = func.call @cc_cons(%1406, %1407) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1408) : (i64) -> ()
        %1409 = llvm.mlir.addressof @str148 : !llvm.ptr
        %1410 = arith.constant 4 : i64
        %1411 = func.call @cc_make_string(%1409, %1410) : (!llvm.ptr, i64) -> i64
        %1412 = func.call @cc_nil_value() : () -> i64
        %1413 = func.call @cc_intern(%1411, %1412) : (i64, i64) -> i64
        %1414 = func.call @cc_nil_value() : () -> i64
        %1415 = func.call @cc_cons(%1413, %1414) : (i64, i64) -> i64
        %1416 = func.call @cc_values_pack(%1415) : (i64) -> i64
        func.call @stack_push_pointer(%1413) : (i64) -> ()
        %1417 = func.call @stack_pop_pointer() : () -> i64
        %1418 = func.call @stack_pop_pointer() : () -> i64
        %1419 = func.call @cc_cons(%1417, %1418) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1419) : (i64) -> ()
        %1420 = llvm.mlir.addressof @str149 : !llvm.ptr
        %1421 = arith.constant 12 : i64
        %1422 = func.call @cc_make_string(%1420, %1421) : (!llvm.ptr, i64) -> i64
        %1423 = func.call @cc_nil_value() : () -> i64
        %1424 = func.call @cc_intern(%1422, %1423) : (i64, i64) -> i64
        %1425 = func.call @cc_nil_value() : () -> i64
        %1426 = func.call @cc_cons(%1424, %1425) : (i64, i64) -> i64
        %1427 = func.call @cc_values_pack(%1426) : (i64) -> i64
        func.call @stack_push_pointer(%1424) : (i64) -> ()
        %1428 = func.call @stack_pop_pointer() : () -> i64
        %1429 = func.call @stack_pop_pointer() : () -> i64
        %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1430) : (i64) -> ()
        %1431 = func.call @stack_pop_pointer() : () -> i64
        %1432 = func.call @cc_nil_value() : () -> i64
        %1433 = func.call @cc_cons(%1431, %1432) : (i64, i64) -> i64
        %1434 = llvm.mlir.addressof @str150 : !llvm.ptr
        %1435 = arith.constant 4 : i64
        %1436 = func.call @cc_make_string(%1434, %1435) : (!llvm.ptr, i64) -> i64
        %1437 = func.call @cc_nil_value() : () -> i64
        %1438 = func.call @cc_intern(%1436, %1437) : (i64, i64) -> i64
        %1439 = func.call @cc_nil_value() : () -> i64
        %1440 = func.call @cc_cons(%1438, %1439) : (i64, i64) -> i64
        %1441 = func.call @cc_values_pack(%1440) : (i64) -> i64
        %1442 = func.call @cc_symbol_value(%1438) : (i64) -> i64
        %1443 = func.call @cc_set_symbol_value(%1438, %1292) : (i64, i64) -> i64
        %1444 = func.call @cc_eval(%1433) : (i64) -> i64
        %1445 = func.call @cc_multiple_value_list(%1444) : (i64) -> i64
        %1446 = func.call @cc_symbol_value(%1438) : (i64) -> i64
        %1447 = func.call @cc_set_symbol_value(%1438, %1442) : (i64, i64) -> i64
        %1448 = func.call @cc_values_pack(%1445) : (i64) -> i64
        func.call @stack_push_pointer(%1448) : (i64) -> ()
        %1449 = func.call @stack_pop_pointer() : () -> i64
        %1450 = func.call @cc_nil_value() : () -> i64
        %1451 = func.call @cc_nil_value() : () -> i64
        %1452 = func.call @cc_errorp(%1450) : (i64) -> i64
        %1453 = arith.cmpi ne, %1452, %1451 : i64
        %1454 = scf.if %1453 -> (i64) {
          scf.yield %1450 : i64
        } else {
          %1455 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%1449) : (i64) -> ()
          %1456 = func.call @stack_pop_pointer() : () -> i64
          %1457 = func.call @cc_nil_value() : () -> i64
          %1458 = func.call @cc_errorp(%1456) : (i64) -> i64
          %1459 = arith.cmpi ne, %1458, %1457 : i64
          %1460 = arith.cmpi eq, %1457, %1457 : i64
          %1461 = arith.andi %1459, %1460 : i1
          %1462 = scf.if %1461 -> (i64) {
            scf.yield %1456 : i64
          } else {
            scf.yield %1457 : i64
          }
          %1463 = arith.cmpi ne, %1462, %1457 : i64
          scf.if %1463 {
            func.call @stack_push_pointer(%1462) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1456) : (i64) -> ()
            %1464 = llvm.mlir.addressof @str151 : !llvm.ptr
            %1465 = func.call @cc_make_function_ref_const(%1464) : (!llvm.ptr) -> i64
            %1466 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1465, %1466) : (i64, i64) -> ()
          }
          %1467 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1468 = llvm.mlir.addressof @str152 : !llvm.ptr
          %1469 = arith.constant 7 : i64
          %1470 = func.call @cc_make_string(%1468, %1469) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1470) : (i64) -> ()
          %1471 = func.call @stack_pop_pointer() : () -> i64
          %1472 = func.call @stack_pop_pointer() : () -> i64
          %1473 = func.call @cc_cons(%1471, %1472) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1473) : (i64) -> ()
          func.call @stack_push_pointer(%1449) : (i64) -> ()
          %1474 = func.call @stack_pop_pointer() : () -> i64
          %1475 = func.call @cc_nil_value() : () -> i64
          %1476 = func.call @cc_errorp(%1474) : (i64) -> i64
          %1477 = arith.cmpi ne, %1476, %1475 : i64
          %1478 = arith.cmpi eq, %1475, %1475 : i64
          %1479 = arith.andi %1477, %1478 : i1
          %1480 = scf.if %1479 -> (i64) {
            scf.yield %1474 : i64
          } else {
            scf.yield %1475 : i64
          }
          %1481 = arith.cmpi ne, %1480, %1475 : i64
          scf.if %1481 {
            func.call @stack_push_pointer(%1480) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1474) : (i64) -> ()
            %1482 = llvm.mlir.addressof @str153 : !llvm.ptr
            %1483 = func.call @cc_make_function_ref_const(%1482) : (!llvm.ptr) -> i64
            %1484 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1483, %1484) : (i64, i64) -> ()
          }
          %1485 = func.call @stack_pop_pointer() : () -> i64
          %1486 = func.call @stack_pop_pointer() : () -> i64
          %1487 = func.call @cc_cons(%1485, %1486) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1487) : (i64) -> ()
          %1488 = func.call @stack_pop_pointer() : () -> i64
          %1489 = func.call @cc_string_equal_full(%1488) : (i64) -> i64
          func.call @stack_push_pointer(%1489) : (i64) -> ()
          %1490 = func.call @stack_pop_pointer() : () -> i64
          %1491 = func.call @cc_cons(%1490, %1455) : (i64, i64) -> i64
          %1492 = func.call @cc_cons(%1467, %1491) : (i64, i64) -> i64
          %1493 = func.call @cc_and(%1492) : (i64) -> i64
          func.call @stack_push_pointer(%1493) : (i64) -> ()
          %1494 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1494 : i64
        }
        func.call @stack_push_pointer(%1454) : (i64) -> ()
        %1495 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1495 : i64
      }
      func.call @stack_push_pointer(%1302) : (i64) -> ()
      %1496 = func.call @cc_restore_symbol_value(%1295, %1296) : (i64, i64) -> i64
      %1497 = func.call @stack_pop_pointer() : () -> i64
      %1498 = func.call @cc_nil_value() : () -> i64
      %1499 = func.call @cc_cons(%1497, %1498) : (i64, i64) -> i64
      %1500 = func.call @cc_not(%1499) : (i64) -> i64
      func.call @stack_push_pointer(%1500) : (i64) -> ()
      %1501 = func.call @stack_pop_pointer() : () -> i64
      %1502 = func.call @cc_nil_value() : () -> i64
      %1503 = func.call @cc_cons(%1501, %1502) : (i64, i64) -> i64
      %1504 = func.call @cc_not(%1503) : (i64) -> i64
      func.call @stack_push_pointer(%1504) : (i64) -> ()
      %1505 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1505 : i64
    }
    func.call @stack_push_pointer(%1287) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647748"() {
    %1978 = func.call @cc_nil_value() : () -> i64
    %1979 = func.call @cc_nil_value() : () -> i64
    %1980 = func.call @cc_errorp(%1978) : (i64) -> i64
    %1981 = arith.cmpi ne, %1980, %1979 : i64
    %1982 = scf.if %1981 -> (i64) {
      scf.yield %1978 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1983 = func.call @stack_pop_pointer() : () -> i64
      %1984 = llvm.mlir.addressof @str203 : !llvm.ptr
      %1985 = arith.constant 4 : i64
      %1986 = func.call @cc_make_string(%1984, %1985) : (!llvm.ptr, i64) -> i64
      %1987 = llvm.mlir.addressof @str204 : !llvm.ptr
      %1988 = arith.constant 7 : i64
      %1989 = func.call @cc_make_string(%1987, %1988) : (!llvm.ptr, i64) -> i64
      %1990 = func.call @cc_intern(%1986, %1989) : (i64, i64) -> i64
      %1991 = func.call @cc_nil_value() : () -> i64
      %1992 = func.call @cc_cons(%1990, %1991) : (i64, i64) -> i64
      %1993 = func.call @cc_values_pack(%1992) : (i64) -> i64
      func.call @stack_push_pointer(%1990) : (i64) -> ()
      %1994 = func.call @stack_pop_pointer() : () -> i64
      %1995 = llvm.mlir.addressof @str205 : !llvm.ptr
      %1996 = arith.constant 44 : i64
      %1997 = func.call @cc_make_string(%1995, %1996) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1997) : (i64) -> ()
      %1998 = func.call @stack_pop_pointer() : () -> i64
      %1999 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2000 = arith.constant 28 : i64
      %2001 = func.call @cc_make_symbol(%1999, %2000) : (!llvm.ptr, i64) -> i64
      %2002 = func.call @cc_symbol_value(%2001) : (i64) -> i64
      %2003 = func.call @cc_set_symbol_value(%2001, %1983) : (i64, i64) -> i64
      %2004 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2005 = arith.constant 25 : i64
      %2006 = func.call @cc_make_symbol(%2004, %2005) : (!llvm.ptr, i64) -> i64
      %2007 = func.call @cc_symbol_value(%2006) : (i64) -> i64
      %2008 = func.call @cc_set_symbol_value(%2006, %1994) : (i64, i64) -> i64
      %2009 = func.call @cc_nil_value() : () -> i64
      %2010 = func.call @cc_nil_value() : () -> i64
      %2011 = func.call @cc_errorp(%2009) : (i64) -> i64
      %2012 = arith.cmpi ne, %2011, %2010 : i64
      %2013 = scf.if %2012 -> (i64) {
        scf.yield %2009 : i64
      } else {
        %2014 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2014) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %2015 = func.call @stack_pop_pointer() : () -> i64
        %2016 = func.call @stack_pop_pointer() : () -> i64
        %2017 = func.call @cc_cons(%2015, %2016) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2017) : (i64) -> ()
        %2018 = llvm.mlir.addressof @str208 : !llvm.ptr
        %2019 = arith.constant 5 : i64
        %2020 = func.call @cc_make_string(%2018, %2019) : (!llvm.ptr, i64) -> i64
        %2021 = llvm.mlir.addressof @str209 : !llvm.ptr
        %2022 = arith.constant 7 : i64
        %2023 = func.call @cc_make_string(%2021, %2022) : (!llvm.ptr, i64) -> i64
        %2024 = func.call @cc_intern(%2020, %2023) : (i64, i64) -> i64
        %2025 = func.call @cc_nil_value() : () -> i64
        %2026 = func.call @cc_cons(%2024, %2025) : (i64, i64) -> i64
        %2027 = func.call @cc_values_pack(%2026) : (i64) -> i64
        func.call @stack_push_pointer(%2024) : (i64) -> ()
        %2028 = func.call @stack_pop_pointer() : () -> i64
        %2029 = func.call @stack_pop_pointer() : () -> i64
        %2030 = func.call @cc_cons(%2028, %2029) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2030) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %2031 = func.call @stack_pop_pointer() : () -> i64
        %2032 = func.call @stack_pop_pointer() : () -> i64
        %2033 = func.call @cc_cons(%2031, %2032) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2033) : (i64) -> ()
        %2034 = llvm.mlir.addressof @str210 : !llvm.ptr
        %2035 = arith.constant 7 : i64
        %2036 = func.call @cc_make_string(%2034, %2035) : (!llvm.ptr, i64) -> i64
        %2037 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2038 = arith.constant 7 : i64
        %2039 = func.call @cc_make_string(%2037, %2038) : (!llvm.ptr, i64) -> i64
        %2040 = func.call @cc_intern(%2036, %2039) : (i64, i64) -> i64
        %2041 = func.call @cc_nil_value() : () -> i64
        %2042 = func.call @cc_cons(%2040, %2041) : (i64, i64) -> i64
        %2043 = func.call @cc_values_pack(%2042) : (i64) -> i64
        func.call @stack_push_pointer(%2040) : (i64) -> ()
        %2044 = func.call @stack_pop_pointer() : () -> i64
        %2045 = func.call @stack_pop_pointer() : () -> i64
        %2046 = func.call @cc_cons(%2044, %2045) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2046) : (i64) -> ()
        %2047 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2047) : (i64) -> ()
        %2048 = llvm.mlir.addressof @str212 : !llvm.ptr
        %2049 = arith.constant 4 : i64
        %2050 = func.call @cc_make_string(%2048, %2049) : (!llvm.ptr, i64) -> i64
        %2051 = func.call @cc_nil_value() : () -> i64
        %2052 = func.call @cc_intern(%2050, %2051) : (i64, i64) -> i64
        %2053 = func.call @cc_nil_value() : () -> i64
        %2054 = func.call @cc_cons(%2052, %2053) : (i64, i64) -> i64
        %2055 = func.call @cc_values_pack(%2054) : (i64) -> i64
        func.call @stack_push_pointer(%2052) : (i64) -> ()
        %2056 = func.call @stack_pop_pointer() : () -> i64
        %2057 = func.call @stack_pop_pointer() : () -> i64
        %2058 = func.call @cc_cons(%2056, %2057) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2058) : (i64) -> ()
        %2059 = llvm.mlir.addressof @str213 : !llvm.ptr
        %2060 = arith.constant 8 : i64
        %2061 = func.call @cc_make_string(%2059, %2060) : (!llvm.ptr, i64) -> i64
        %2062 = llvm.mlir.addressof @str214 : !llvm.ptr
        %2063 = arith.constant 7 : i64
        %2064 = func.call @cc_make_string(%2062, %2063) : (!llvm.ptr, i64) -> i64
        %2065 = func.call @cc_intern(%2061, %2064) : (i64, i64) -> i64
        %2066 = func.call @cc_nil_value() : () -> i64
        %2067 = func.call @cc_cons(%2065, %2066) : (i64, i64) -> i64
        %2068 = func.call @cc_values_pack(%2067) : (i64) -> i64
        func.call @stack_push_pointer(%2065) : (i64) -> ()
        %2069 = func.call @stack_pop_pointer() : () -> i64
        %2070 = func.call @stack_pop_pointer() : () -> i64
        %2071 = func.call @cc_cons(%2069, %2070) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2071) : (i64) -> ()
        %2072 = llvm.mlir.addressof @str215 : !llvm.ptr
        %2073 = arith.constant 7 : i64
        %2074 = func.call @cc_make_string(%2072, %2073) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2074) : (i64) -> ()
        %2075 = func.call @stack_pop_pointer() : () -> i64
        %2076 = func.call @stack_pop_pointer() : () -> i64
        %2077 = func.call @cc_cons(%2075, %2076) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2077) : (i64) -> ()
        %2078 = llvm.mlir.addressof @str216 : !llvm.ptr
        %2079 = arith.constant 4 : i64
        %2080 = func.call @cc_make_string(%2078, %2079) : (!llvm.ptr, i64) -> i64
        %2081 = llvm.mlir.addressof @str217 : !llvm.ptr
        %2082 = arith.constant 7 : i64
        %2083 = func.call @cc_make_string(%2081, %2082) : (!llvm.ptr, i64) -> i64
        %2084 = func.call @cc_intern(%2080, %2083) : (i64, i64) -> i64
        %2085 = func.call @cc_nil_value() : () -> i64
        %2086 = func.call @cc_cons(%2084, %2085) : (i64, i64) -> i64
        %2087 = func.call @cc_values_pack(%2086) : (i64) -> i64
        func.call @stack_push_pointer(%2084) : (i64) -> ()
        %2088 = func.call @stack_pop_pointer() : () -> i64
        %2089 = func.call @stack_pop_pointer() : () -> i64
        %2090 = func.call @cc_cons(%2088, %2089) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2090) : (i64) -> ()
        %2091 = llvm.mlir.addressof @str218 : !llvm.ptr
        %2092 = arith.constant 13 : i64
        %2093 = func.call @cc_make_string(%2091, %2092) : (!llvm.ptr, i64) -> i64
        %2094 = llvm.mlir.addressof @str219 : !llvm.ptr
        %2095 = arith.constant 11 : i64
        %2096 = func.call @cc_make_string(%2094, %2095) : (!llvm.ptr, i64) -> i64
        %2097 = func.call @cc_intern(%2093, %2096) : (i64, i64) -> i64
        %2098 = func.call @cc_nil_value() : () -> i64
        %2099 = func.call @cc_cons(%2097, %2098) : (i64, i64) -> i64
        %2100 = func.call @cc_values_pack(%2099) : (i64) -> i64
        func.call @stack_push_pointer(%2097) : (i64) -> ()
        %2101 = func.call @stack_pop_pointer() : () -> i64
        %2102 = func.call @stack_pop_pointer() : () -> i64
        %2103 = func.call @cc_cons(%2101, %2102) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2103) : (i64) -> ()
        %2104 = func.call @stack_pop_pointer() : () -> i64
        %2105 = func.call @stack_pop_pointer() : () -> i64
        %2106 = func.call @cc_cons(%2104, %2105) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2106) : (i64) -> ()
        %2107 = llvm.mlir.addressof @str220 : !llvm.ptr
        %2108 = arith.constant 11 : i64
        %2109 = func.call @cc_make_string(%2107, %2108) : (!llvm.ptr, i64) -> i64
        %2110 = llvm.mlir.addressof @str221 : !llvm.ptr
        %2111 = arith.constant 7 : i64
        %2112 = func.call @cc_make_string(%2110, %2111) : (!llvm.ptr, i64) -> i64
        %2113 = func.call @cc_intern(%2109, %2112) : (i64, i64) -> i64
        %2114 = func.call @cc_nil_value() : () -> i64
        %2115 = func.call @cc_cons(%2113, %2114) : (i64, i64) -> i64
        %2116 = func.call @cc_values_pack(%2115) : (i64) -> i64
        func.call @stack_push_pointer(%2113) : (i64) -> ()
        %2117 = func.call @stack_pop_pointer() : () -> i64
        %2118 = func.call @stack_pop_pointer() : () -> i64
        %2119 = func.call @cc_cons(%2117, %2118) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2119) : (i64) -> ()
        %2120 = llvm.mlir.addressof @str222 : !llvm.ptr
        %2121 = arith.constant 4 : i64
        %2122 = func.call @cc_make_string(%2120, %2121) : (!llvm.ptr, i64) -> i64
        %2123 = func.call @cc_nil_value() : () -> i64
        %2124 = func.call @cc_intern(%2122, %2123) : (i64, i64) -> i64
        %2125 = func.call @cc_nil_value() : () -> i64
        %2126 = func.call @cc_cons(%2124, %2125) : (i64, i64) -> i64
        %2127 = func.call @cc_values_pack(%2126) : (i64) -> i64
        func.call @stack_push_pointer(%2124) : (i64) -> ()
        %2128 = func.call @stack_pop_pointer() : () -> i64
        %2129 = func.call @stack_pop_pointer() : () -> i64
        %2130 = func.call @cc_cons(%2128, %2129) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2130) : (i64) -> ()
        %2131 = llvm.mlir.addressof @str223 : !llvm.ptr
        %2132 = arith.constant 12 : i64
        %2133 = func.call @cc_make_string(%2131, %2132) : (!llvm.ptr, i64) -> i64
        %2134 = func.call @cc_nil_value() : () -> i64
        %2135 = func.call @cc_intern(%2133, %2134) : (i64, i64) -> i64
        %2136 = func.call @cc_nil_value() : () -> i64
        %2137 = func.call @cc_cons(%2135, %2136) : (i64, i64) -> i64
        %2138 = func.call @cc_values_pack(%2137) : (i64) -> i64
        func.call @stack_push_pointer(%2135) : (i64) -> ()
        %2139 = func.call @stack_pop_pointer() : () -> i64
        %2140 = func.call @stack_pop_pointer() : () -> i64
        %2141 = func.call @cc_cons(%2139, %2140) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2141) : (i64) -> ()
        %2142 = func.call @stack_pop_pointer() : () -> i64
        %2143 = func.call @cc_nil_value() : () -> i64
        %2144 = func.call @cc_cons(%2142, %2143) : (i64, i64) -> i64
        %2145 = llvm.mlir.addressof @str224 : !llvm.ptr
        %2146 = arith.constant 4 : i64
        %2147 = func.call @cc_make_string(%2145, %2146) : (!llvm.ptr, i64) -> i64
        %2148 = func.call @cc_nil_value() : () -> i64
        %2149 = func.call @cc_intern(%2147, %2148) : (i64, i64) -> i64
        %2150 = func.call @cc_nil_value() : () -> i64
        %2151 = func.call @cc_cons(%2149, %2150) : (i64, i64) -> i64
        %2152 = func.call @cc_values_pack(%2151) : (i64) -> i64
        %2153 = func.call @cc_symbol_value(%2149) : (i64) -> i64
        %2154 = func.call @cc_set_symbol_value(%2149, %1998) : (i64, i64) -> i64
        %2155 = func.call @cc_eval(%2144) : (i64) -> i64
        %2156 = func.call @cc_multiple_value_list(%2155) : (i64) -> i64
        %2157 = func.call @cc_symbol_value(%2149) : (i64) -> i64
        %2158 = func.call @cc_set_symbol_value(%2149, %2153) : (i64, i64) -> i64
        %2159 = func.call @cc_values_pack(%2156) : (i64) -> i64
        func.call @stack_push_pointer(%2159) : (i64) -> ()
        %2160 = func.call @stack_pop_pointer() : () -> i64
        %2161 = func.call @cc_nil_value() : () -> i64
        %2162 = func.call @cc_nil_value() : () -> i64
        %2163 = func.call @cc_errorp(%2161) : (i64) -> i64
        %2164 = arith.cmpi ne, %2163, %2162 : i64
        %2165 = scf.if %2164 -> (i64) {
          scf.yield %2161 : i64
        } else {
          %2166 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%2160) : (i64) -> ()
          %2167 = func.call @stack_pop_pointer() : () -> i64
          %2168 = func.call @cc_nil_value() : () -> i64
          %2169 = func.call @cc_errorp(%2167) : (i64) -> i64
          %2170 = arith.cmpi ne, %2169, %2168 : i64
          %2171 = arith.cmpi eq, %2168, %2168 : i64
          %2172 = arith.andi %2170, %2171 : i1
          %2173 = scf.if %2172 -> (i64) {
            scf.yield %2167 : i64
          } else {
            scf.yield %2168 : i64
          }
          %2174 = arith.cmpi ne, %2173, %2168 : i64
          scf.if %2174 {
            func.call @stack_push_pointer(%2173) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2167) : (i64) -> ()
            %2175 = llvm.mlir.addressof @str225 : !llvm.ptr
            %2176 = func.call @cc_make_function_ref_const(%2175) : (!llvm.ptr) -> i64
            %2177 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2176, %2177) : (i64, i64) -> ()
          }
          %2178 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %2179 = llvm.mlir.addressof @str226 : !llvm.ptr
          %2180 = arith.constant 7 : i64
          %2181 = func.call @cc_make_string(%2179, %2180) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%2181) : (i64) -> ()
          %2182 = func.call @stack_pop_pointer() : () -> i64
          %2183 = func.call @stack_pop_pointer() : () -> i64
          %2184 = func.call @cc_cons(%2182, %2183) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2184) : (i64) -> ()
          func.call @stack_push_pointer(%2160) : (i64) -> ()
          %2185 = func.call @stack_pop_pointer() : () -> i64
          %2186 = func.call @cc_nil_value() : () -> i64
          %2187 = func.call @cc_errorp(%2185) : (i64) -> i64
          %2188 = arith.cmpi ne, %2187, %2186 : i64
          %2189 = arith.cmpi eq, %2186, %2186 : i64
          %2190 = arith.andi %2188, %2189 : i1
          %2191 = scf.if %2190 -> (i64) {
            scf.yield %2185 : i64
          } else {
            scf.yield %2186 : i64
          }
          %2192 = arith.cmpi ne, %2191, %2186 : i64
          scf.if %2192 {
            func.call @stack_push_pointer(%2191) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2185) : (i64) -> ()
            %2193 = llvm.mlir.addressof @str227 : !llvm.ptr
            %2194 = func.call @cc_make_function_ref_const(%2193) : (!llvm.ptr) -> i64
            %2195 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2194, %2195) : (i64, i64) -> ()
          }
          %2196 = func.call @stack_pop_pointer() : () -> i64
          %2197 = func.call @stack_pop_pointer() : () -> i64
          %2198 = func.call @cc_cons(%2196, %2197) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2198) : (i64) -> ()
          %2199 = func.call @stack_pop_pointer() : () -> i64
          %2200 = func.call @cc_string_equal_full(%2199) : (i64) -> i64
          func.call @stack_push_pointer(%2200) : (i64) -> ()
          %2201 = func.call @stack_pop_pointer() : () -> i64
          %2202 = func.call @cc_cons(%2201, %2166) : (i64, i64) -> i64
          %2203 = func.call @cc_cons(%2178, %2202) : (i64, i64) -> i64
          %2204 = func.call @cc_and(%2203) : (i64) -> i64
          func.call @stack_push_pointer(%2204) : (i64) -> ()
          %2205 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2205 : i64
        }
        func.call @stack_push_pointer(%2165) : (i64) -> ()
        %2206 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2206 : i64
      }
      func.call @stack_push_pointer(%2013) : (i64) -> ()
      %2207 = func.call @cc_restore_symbol_value(%2006, %2007) : (i64, i64) -> i64
      %2208 = func.call @cc_restore_symbol_value(%2001, %2002) : (i64, i64) -> i64
      %2209 = func.call @stack_pop_pointer() : () -> i64
      %2210 = func.call @cc_nil_value() : () -> i64
      %2211 = func.call @cc_cons(%2209, %2210) : (i64, i64) -> i64
      %2212 = func.call @cc_not(%2211) : (i64) -> i64
      func.call @stack_push_pointer(%2212) : (i64) -> ()
      %2213 = func.call @stack_pop_pointer() : () -> i64
      %2214 = func.call @cc_nil_value() : () -> i64
      %2215 = func.call @cc_cons(%2213, %2214) : (i64, i64) -> i64
      %2216 = func.call @cc_not(%2215) : (i64) -> i64
      func.call @stack_push_pointer(%2216) : (i64) -> ()
      %2217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2217 : i64
    }
    func.call @stack_push_pointer(%1982) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_96094591647749"() {
    %2409 = func.call @cc_nil_value() : () -> i64
    %2410 = func.call @cc_nil_value() : () -> i64
    %2411 = func.call @cc_errorp(%2409) : (i64) -> i64
    %2412 = arith.cmpi ne, %2411, %2410 : i64
    %2413 = scf.if %2412 -> (i64) {
      scf.yield %2409 : i64
    } else {
      %2414 = func.call @cc_make_string_output_stream() : () -> i64
      %2415 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2416 = arith.constant 17 : i64
      %2417 = func.call @cc_make_string(%2415, %2416) : (!llvm.ptr, i64) -> i64
      %2418 = func.call @cc_nil_value() : () -> i64
      %2419 = func.call @cc_intern(%2417, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_values_pack(%2421) : (i64) -> i64
      %2423 = func.call @cc_symbol_value(%2419) : (i64) -> i64
      %2424 = func.call @cc_set_symbol_value(%2419, %2414) : (i64, i64) -> i64
      %2425 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2425) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2426 = func.call @stack_pop_pointer() : () -> i64
      %2427 = func.call @stack_pop_pointer() : () -> i64
      %2428 = func.call @cc_cons(%2426, %2427) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2428) : (i64) -> ()
      %2429 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2430 = arith.constant 5 : i64
      %2431 = func.call @cc_make_string(%2429, %2430) : (!llvm.ptr, i64) -> i64
      %2432 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2433 = arith.constant 7 : i64
      %2434 = func.call @cc_make_string(%2432, %2433) : (!llvm.ptr, i64) -> i64
      %2435 = func.call @cc_intern(%2431, %2434) : (i64, i64) -> i64
      %2436 = func.call @cc_nil_value() : () -> i64
      %2437 = func.call @cc_cons(%2435, %2436) : (i64, i64) -> i64
      %2438 = func.call @cc_values_pack(%2437) : (i64) -> i64
      func.call @stack_push_pointer(%2435) : (i64) -> ()
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @stack_pop_pointer() : () -> i64
      %2441 = func.call @cc_cons(%2439, %2440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2441) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2442 = func.call @stack_pop_pointer() : () -> i64
      %2443 = func.call @stack_pop_pointer() : () -> i64
      %2444 = func.call @cc_cons(%2442, %2443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2444) : (i64) -> ()
      %2445 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2446 = arith.constant 7 : i64
      %2447 = func.call @cc_make_string(%2445, %2446) : (!llvm.ptr, i64) -> i64
      %2448 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2449 = arith.constant 7 : i64
      %2450 = func.call @cc_make_string(%2448, %2449) : (!llvm.ptr, i64) -> i64
      %2451 = func.call @cc_intern(%2447, %2450) : (i64, i64) -> i64
      %2452 = func.call @cc_nil_value() : () -> i64
      %2453 = func.call @cc_cons(%2451, %2452) : (i64, i64) -> i64
      %2454 = func.call @cc_values_pack(%2453) : (i64) -> i64
      func.call @stack_push_pointer(%2451) : (i64) -> ()
      %2455 = func.call @stack_pop_pointer() : () -> i64
      %2456 = func.call @stack_pop_pointer() : () -> i64
      %2457 = func.call @cc_cons(%2455, %2456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2457) : (i64) -> ()
      %2458 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2459 = arith.constant 44 : i64
      %2460 = func.call @cc_make_string(%2458, %2459) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2460) : (i64) -> ()
      %2461 = func.call @stack_pop_pointer() : () -> i64
      %2462 = func.call @stack_pop_pointer() : () -> i64
      %2463 = func.call @cc_cons(%2461, %2462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2463) : (i64) -> ()
      %2464 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2465 = arith.constant 12 : i64
      %2466 = func.call @cc_make_string(%2464, %2465) : (!llvm.ptr, i64) -> i64
      %2467 = func.call @cc_nil_value() : () -> i64
      %2468 = func.call @cc_intern(%2466, %2467) : (i64, i64) -> i64
      %2469 = func.call @cc_nil_value() : () -> i64
      %2470 = func.call @cc_cons(%2468, %2469) : (i64, i64) -> i64
      %2471 = func.call @cc_values_pack(%2470) : (i64) -> i64
      func.call @stack_push_pointer(%2468) : (i64) -> ()
      %2472 = func.call @stack_pop_pointer() : () -> i64
      %2473 = func.call @stack_pop_pointer() : () -> i64
      %2474 = func.call @cc_cons(%2472, %2473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2474) : (i64) -> ()
      %2475 = func.call @stack_pop_pointer() : () -> i64
      %2476 = func.call @cc_nil_value() : () -> i64
      %2477 = func.call @cc_cons(%2475, %2476) : (i64, i64) -> i64
      %2478 = func.call @cc_eval(%2477) : (i64) -> i64
      %2479 = func.call @cc_multiple_value_list(%2478) : (i64) -> i64
      %2480 = func.call @cc_values_pack(%2479) : (i64) -> i64
      func.call @stack_push_pointer(%2480) : (i64) -> ()
      %2481 = func.call @stack_pop_pointer() : () -> i64
      %2482 = func.call @cc_nil_value() : () -> i64
      %2483 = func.call @cc_errorp(%2481) : (i64) -> i64
      %2484 = arith.cmpi ne, %2483, %2482 : i64
      %2485 = scf.if %2484 -> (i64) {
        scf.yield %2481 : i64
      } else {
        %2486 = func.call @cc_get_output_stream_string(%2414) : (i64) -> i64
        scf.yield %2486 : i64
      }
      func.call @stack_push_pointer(%2485) : (i64) -> ()
      %2487 = func.call @cc_set_symbol_value(%2419, %2423) : (i64, i64) -> i64
      %2488 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2488 : i64
    }
    func.call @stack_push_pointer(%2413) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_96094591647744*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_96094591647744*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_96094591647744*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("COMPILE-FILE-PATHNAME-1\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str6("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("test.lisp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str11("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("test.newfasl\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str14("test.lisp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str15("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("test.newfasl\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str18("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str19("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str20("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str27("COMPILE-FILE-PARALLEL\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str28("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str30("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str31("*COMPILE-FILE-PARALLEL*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str32("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str33("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str34("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str35("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str36("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str37("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str43("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str48("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str49("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str57("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str59("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str66("cmp::*compile-file-parallel*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str67("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str73("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str78("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str83("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str85("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str87("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str88("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str90("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str91("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str92("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str93("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str94("COMPILE-FILE-SERIAL\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str95("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str96("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str97("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str98("*COMPILE-FILE-PARALLEL*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str99("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str100("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str101("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str102("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str103("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str104("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str107("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str117("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str119("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str131("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str133("cmp::*compile-file-parallel*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str134("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str135("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str136("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str138("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str139("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str142("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str143("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str144("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str145("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str148("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str149("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str150("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str152("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str153("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str154("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str155("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str156("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str157("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str158("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str160("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str161("COMPILE-FILE-SERIAL-NO-FASO\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str162("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str163("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str164("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("*COMPILE-FILE-PARALLEL*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str166("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str167("*DEFAULT-OUTPUT-TYPE*\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str168("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str169("FASO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str170("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str171("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str172("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str173("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str174("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str176("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str178("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str182("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str183("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str184("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str189("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str190("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str191("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str192("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str193("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str195("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str200("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("FASL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str202("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str203("FASO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str205("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str206("cmp::*compile-file-parallel*\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str207("cmp:*default-output-type*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str208("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str209("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str210("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str211("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str212("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str213("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str214("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str216("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str217("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str218("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str223("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str224("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str225("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str226("newfasl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str228("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str229("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str230("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str231("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str233("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str234("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str235("COMPILE-FILE.1.SIMPLIFIED\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str236("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str237("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str243("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str244("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str245("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str246("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str247("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str248("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str250("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str251("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str252("sys:src;lisp;regression-tests;framework.lisp\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str253("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str254("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str255("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str257("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str260("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str261("*__MLIR_BLOCK_RETFLAG_96094591647744*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str262("*__MLIR_BLOCK_RETMVLIST_96094591647744*\00") : !llvm.array<40 x i8>
}
