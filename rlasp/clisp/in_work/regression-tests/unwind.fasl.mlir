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
      %58 = arith.constant 22 : i64
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
      %75 = arith.constant 7 : i64
      %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
      %77 = func.call @cc_nil_value() : () -> i64
      %78 = func.call @cc_intern(%76, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %82 = llvm.mlir.addressof @str8 : !llvm.ptr
      %83 = arith.constant 20 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = llvm.mlir.addressof @str9 : !llvm.ptr
      %86 = arith.constant 7 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      %88 = func.call @cc_intern(%84, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @stack_pop_pointer() : () -> i64
      %94 = func.call @cc_cons(%93, %92) : (i64, i64) -> i64
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
      %104 = llvm.mlir.addressof @str10 : !llvm.ptr
      %105 = arith.constant 22 : i64
      %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
      %107 = llvm.mlir.addressof @str11 : !llvm.ptr
      %108 = arith.constant 3 : i64
      %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
      %110 = func.call @cc_intern(%106, %109) : (i64, i64) -> i64
      %111 = func.call @cc_nil_value() : () -> i64
      %112 = func.call @cc_cons(%110, %111) : (i64, i64) -> i64
      %113 = func.call @cc_values_pack(%112) : (i64) -> i64
      func.call @stack_push_pointer(%110) : (i64) -> ()
      %114 = llvm.mlir.addressof @str12 : !llvm.ptr
      %115 = arith.constant 2 : i64
      %116 = func.call @cc_make_string(%114, %115) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      %117 = llvm.mlir.addressof @str13 : !llvm.ptr
      %118 = arith.constant 4 : i64
      %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%119) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %120 = func.call @stack_pop_pointer() : () -> i64
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @cc_cons(%121, %120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%122) : (i64) -> ()
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @stack_pop_pointer() : () -> i64
      %125 = func.call @cc_cons(%124, %123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%125) : (i64) -> ()
      %126 = llvm.mlir.addressof @str14 : !llvm.ptr
      %127 = arith.constant 12 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      %129 = llvm.mlir.addressof @str15 : !llvm.ptr
      %130 = arith.constant 11 : i64
      %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
      %132 = func.call @cc_intern(%128, %131) : (i64, i64) -> i64
      %133 = func.call @cc_nil_value() : () -> i64
      %134 = func.call @cc_cons(%132, %133) : (i64, i64) -> i64
      %135 = func.call @cc_values_pack(%134) : (i64) -> i64
      func.call @stack_push_pointer(%132) : (i64) -> ()
      %136 = llvm.mlir.addressof @str16 : !llvm.ptr
      %137 = arith.constant 36 : i64
      %138 = func.call @cc_make_string(%136, %137) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%138) : (i64) -> ()
      %139 = llvm.mlir.addressof @str17 : !llvm.ptr
      %140 = arith.constant 9 : i64
      %141 = func.call @cc_make_string(%139, %140) : (!llvm.ptr, i64) -> i64
      %142 = llvm.mlir.addressof @str18 : !llvm.ptr
      %143 = arith.constant 7 : i64
      %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
      %145 = func.call @cc_intern(%141, %144) : (i64, i64) -> i64
      %146 = func.call @cc_nil_value() : () -> i64
      %147 = func.call @cc_cons(%145, %146) : (i64, i64) -> i64
      %148 = func.call @cc_values_pack(%147) : (i64) -> i64
      func.call @stack_push_pointer(%145) : (i64) -> ()
      %149 = llvm.mlir.addressof @str19 : !llvm.ptr
      %150 = arith.constant 6 : i64
      %151 = func.call @cc_make_string(%149, %150) : (!llvm.ptr, i64) -> i64
      %152 = llvm.mlir.addressof @str20 : !llvm.ptr
      %153 = arith.constant 7 : i64
      %154 = func.call @cc_make_string(%152, %153) : (!llvm.ptr, i64) -> i64
      %155 = func.call @cc_intern(%151, %154) : (i64, i64) -> i64
      %156 = func.call @cc_nil_value() : () -> i64
      %157 = func.call @cc_cons(%155, %156) : (i64, i64) -> i64
      %158 = func.call @cc_values_pack(%157) : (i64) -> i64
      func.call @stack_push_pointer(%155) : (i64) -> ()
      %159 = llvm.mlir.addressof @str21 : !llvm.ptr
      %160 = arith.constant 11 : i64
      %161 = func.call @cc_make_string(%159, %160) : (!llvm.ptr, i64) -> i64
      %162 = llvm.mlir.addressof @str22 : !llvm.ptr
      %163 = arith.constant 7 : i64
      %164 = func.call @cc_make_string(%162, %163) : (!llvm.ptr, i64) -> i64
      %165 = func.call @cc_intern(%161, %164) : (i64, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_cons(%165, %166) : (i64, i64) -> i64
      %168 = func.call @cc_values_pack(%167) : (i64) -> i64
      func.call @stack_push_pointer(%165) : (i64) -> ()
      %169 = llvm.mlir.addressof @str23 : !llvm.ptr
      %170 = arith.constant 13 : i64
      %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
      %172 = llvm.mlir.addressof @str24 : !llvm.ptr
      %173 = arith.constant 11 : i64
      %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
      %175 = func.call @cc_intern(%171, %174) : (i64, i64) -> i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_cons(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_values_pack(%177) : (i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      %179 = llvm.mlir.addressof @str25 : !llvm.ptr
      %180 = arith.constant 4 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = llvm.mlir.addressof @str26 : !llvm.ptr
      %183 = arith.constant 7 : i64
      %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
      %185 = func.call @cc_intern(%181, %184) : (i64, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_values_pack(%187) : (i64) -> i64
      func.call @stack_push_pointer(%185) : (i64) -> ()
      %189 = llvm.mlir.addressof @str27 : !llvm.ptr
      %190 = arith.constant 13 : i64
      %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
      %192 = llvm.mlir.addressof @str28 : !llvm.ptr
      %193 = arith.constant 11 : i64
      %194 = func.call @cc_make_string(%192, %193) : (!llvm.ptr, i64) -> i64
      %195 = func.call @cc_intern(%191, %194) : (i64, i64) -> i64
      %196 = func.call @cc_nil_value() : () -> i64
      %197 = func.call @cc_cons(%195, %196) : (i64, i64) -> i64
      %198 = func.call @cc_values_pack(%197) : (i64) -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      %199 = llvm.mlir.addressof @str29 : !llvm.ptr
      %200 = arith.constant 21 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      %202 = llvm.mlir.addressof @str30 : !llvm.ptr
      %203 = arith.constant 11 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = func.call @cc_intern(%201, %204) : (i64, i64) -> i64
      %206 = func.call @cc_nil_value() : () -> i64
      %207 = func.call @cc_cons(%205, %206) : (i64, i64) -> i64
      %208 = func.call @cc_values_pack(%207) : (i64) -> i64
      func.call @stack_push_pointer(%205) : (i64) -> ()
      %209 = llvm.mlir.addressof @str31 : !llvm.ptr
      %210 = arith.constant 8 : i64
      %211 = func.call @cc_make_string(%209, %210) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%214) : (i64) -> ()
      %215 = func.call @stack_pop_pointer() : () -> i64
      %216 = func.call @stack_pop_pointer() : () -> i64
      %217 = func.call @cc_cons(%216, %215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %218 = func.call @stack_pop_pointer() : () -> i64
      %219 = func.call @stack_pop_pointer() : () -> i64
      %220 = func.call @cc_cons(%219, %218) : (i64, i64) -> i64
      func.call @stack_push_pointer(%220) : (i64) -> ()
      %221 = func.call @stack_pop_pointer() : () -> i64
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = func.call @cc_cons(%222, %221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %224 = llvm.mlir.addressof @str32 : !llvm.ptr
      %225 = arith.constant 8 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = llvm.mlir.addressof @str33 : !llvm.ptr
      %228 = arith.constant 7 : i64
      %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
      %230 = func.call @cc_intern(%226, %229) : (i64, i64) -> i64
      %231 = func.call @cc_nil_value() : () -> i64
      %232 = func.call @cc_cons(%230, %231) : (i64, i64) -> i64
      %233 = func.call @cc_values_pack(%232) : (i64) -> i64
      func.call @stack_push_pointer(%230) : (i64) -> ()
      %234 = llvm.mlir.addressof @str34 : !llvm.ptr
      %235 = arith.constant 7 : i64
      %236 = func.call @cc_make_string(%234, %235) : (!llvm.ptr, i64) -> i64
      %237 = llvm.mlir.addressof @str35 : !llvm.ptr
      %238 = arith.constant 4 : i64
      %239 = func.call @cc_make_string(%237, %238) : (!llvm.ptr, i64) -> i64
      %240 = func.call @cc_intern(%236, %239) : (i64, i64) -> i64
      %241 = func.call @cc_nil_value() : () -> i64
      %242 = func.call @cc_cons(%240, %241) : (i64, i64) -> i64
      %243 = func.call @cc_values_pack(%242) : (i64) -> i64
      func.call @stack_push_pointer(%240) : (i64) -> ()
      %244 = llvm.mlir.addressof @str36 : !llvm.ptr
      %245 = arith.constant 12 : i64
      %246 = func.call @cc_make_string(%244, %245) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @stack_pop_pointer() : () -> i64
      %249 = func.call @cc_cons(%248, %247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%249) : (i64) -> ()
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @stack_pop_pointer() : () -> i64
      %252 = func.call @cc_cons(%251, %250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%252) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %253 = func.call @stack_pop_pointer() : () -> i64
      %254 = func.call @stack_pop_pointer() : () -> i64
      %255 = func.call @cc_cons(%254, %253) : (i64, i64) -> i64
      func.call @stack_push_pointer(%255) : (i64) -> ()
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @stack_pop_pointer() : () -> i64
      %258 = func.call @cc_cons(%257, %256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @cc_cons(%260, %259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%261) : (i64) -> ()
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @stack_pop_pointer() : () -> i64
      %264 = func.call @cc_cons(%263, %262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @stack_pop_pointer() : () -> i64
      %267 = func.call @cc_cons(%266, %265) : (i64, i64) -> i64
      func.call @stack_push_pointer(%267) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %268 = func.call @stack_pop_pointer() : () -> i64
      %269 = func.call @stack_pop_pointer() : () -> i64
      %270 = func.call @cc_cons(%269, %268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%270) : (i64) -> ()
      %271 = func.call @stack_pop_pointer() : () -> i64
      %272 = func.call @stack_pop_pointer() : () -> i64
      %273 = func.call @cc_cons(%272, %271) : (i64, i64) -> i64
      func.call @stack_push_pointer(%273) : (i64) -> ()
      %274 = func.call @stack_pop_pointer() : () -> i64
      %275 = func.call @stack_pop_pointer() : () -> i64
      %276 = func.call @cc_cons(%275, %274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%276) : (i64) -> ()
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = func.call @stack_pop_pointer() : () -> i64
      %279 = func.call @cc_cons(%278, %277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%279) : (i64) -> ()
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @stack_pop_pointer() : () -> i64
      %282 = func.call @cc_cons(%281, %280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%282) : (i64) -> ()
      %283 = func.call @stack_pop_pointer() : () -> i64
      %284 = func.call @stack_pop_pointer() : () -> i64
      %285 = func.call @cc_cons(%284, %283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%285) : (i64) -> ()
      %286 = llvm.mlir.addressof @str37 : !llvm.ptr
      %287 = arith.constant 1 : i64
      %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
      %289 = llvm.mlir.addressof @str38 : !llvm.ptr
      %290 = arith.constant 11 : i64
      %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
      %292 = func.call @cc_intern(%288, %291) : (i64, i64) -> i64
      %293 = func.call @cc_nil_value() : () -> i64
      %294 = func.call @cc_cons(%292, %293) : (i64, i64) -> i64
      %295 = func.call @cc_values_pack(%294) : (i64) -> i64
      func.call @stack_push_pointer(%292) : (i64) -> ()
      %296 = llvm.mlir.addressof @str39 : !llvm.ptr
      %297 = arith.constant 20 : i64
      %298 = func.call @cc_make_string(%296, %297) : (!llvm.ptr, i64) -> i64
      %299 = llvm.mlir.addressof @str40 : !llvm.ptr
      %300 = arith.constant 7 : i64
      %301 = func.call @cc_make_string(%299, %300) : (!llvm.ptr, i64) -> i64
      %302 = func.call @cc_intern(%298, %301) : (i64, i64) -> i64
      %303 = func.call @cc_nil_value() : () -> i64
      %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
      %305 = func.call @cc_values_pack(%304) : (i64) -> i64
      func.call @stack_push_pointer(%302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @stack_pop_pointer() : () -> i64
      %308 = func.call @cc_cons(%307, %306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %309 = llvm.mlir.addressof @str41 : !llvm.ptr
      %310 = arith.constant 7 : i64
      %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_intern(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_nil_value() : () -> i64
      %315 = func.call @cc_cons(%313, %314) : (i64, i64) -> i64
      %316 = func.call @cc_values_pack(%315) : (i64) -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @cc_cons(%318, %317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %320 = func.call @stack_pop_pointer() : () -> i64
      %321 = func.call @stack_pop_pointer() : () -> i64
      %322 = func.call @cc_cons(%321, %320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%322) : (i64) -> ()
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @cc_cons(%324, %323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %326 = func.call @stack_pop_pointer() : () -> i64
      %327 = func.call @stack_pop_pointer() : () -> i64
      %328 = func.call @cc_cons(%327, %326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%328) : (i64) -> ()
      %329 = func.call @stack_pop_pointer() : () -> i64
      %330 = func.call @stack_pop_pointer() : () -> i64
      %331 = func.call @cc_cons(%330, %329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%331) : (i64) -> ()
      %332 = func.call @stack_pop_pointer() : () -> i64
      %333 = func.call @stack_pop_pointer() : () -> i64
      %334 = func.call @cc_cons(%333, %332) : (i64, i64) -> i64
      func.call @stack_push_pointer(%334) : (i64) -> ()
      %335 = func.call @stack_pop_pointer() : () -> i64
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @cc_cons(%336, %335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%337) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %338 = func.call @stack_pop_pointer() : () -> i64
      %339 = func.call @stack_pop_pointer() : () -> i64
      %340 = func.call @cc_cons(%339, %338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%340) : (i64) -> ()
      %341 = func.call @stack_pop_pointer() : () -> i64
      %342 = func.call @stack_pop_pointer() : () -> i64
      %343 = func.call @cc_cons(%342, %341) : (i64, i64) -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %344 = func.call @stack_pop_pointer() : () -> i64
      %345 = func.call @stack_pop_pointer() : () -> i64
      %346 = func.call @cc_cons(%345, %344) : (i64, i64) -> i64
      func.call @stack_push_pointer(%346) : (i64) -> ()
      %347 = func.call @stack_pop_pointer() : () -> i64
      %600 = arith.constant 76042832183297 : i64
      %601 = arith.constant 0 : i64
      %602 = func.call @cc_make_closure(%600, %601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%602) : (i64) -> ()
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %605 = func.call @stack_pop_pointer() : () -> i64
      %606 = func.call @stack_pop_pointer() : () -> i64
      %607 = func.call @cc_cons(%606, %605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%607) : (i64) -> ()
      %608 = func.call @stack_pop_pointer() : () -> i64
      %609 = llvm.mlir.addressof @str69 : !llvm.ptr
      %610 = arith.constant 11 : i64
      %611 = func.call @cc_make_string(%609, %610) : (!llvm.ptr, i64) -> i64
      %612 = llvm.mlir.addressof @str70 : !llvm.ptr
      %613 = arith.constant 7 : i64
      %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
      %615 = func.call @cc_intern(%611, %614) : (i64, i64) -> i64
      %616 = func.call @cc_nil_value() : () -> i64
      %617 = func.call @cc_cons(%615, %616) : (i64, i64) -> i64
      %618 = func.call @cc_values_pack(%617) : (i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %619 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %620 = func.call @stack_pop_pointer() : () -> i64
      %621 = llvm.mlir.addressof @str71 : !llvm.ptr
      %622 = arith.constant 4 : i64
      %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
      %624 = llvm.mlir.addressof @str72 : !llvm.ptr
      %625 = arith.constant 7 : i64
      %626 = func.call @cc_make_string(%624, %625) : (!llvm.ptr, i64) -> i64
      %627 = func.call @cc_intern(%623, %626) : (i64, i64) -> i64
      %628 = func.call @cc_nil_value() : () -> i64
      %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
      %630 = func.call @cc_values_pack(%629) : (i64) -> i64
      func.call @stack_push_pointer(%627) : (i64) -> ()
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = llvm.mlir.addressof @str73 : !llvm.ptr
      %633 = arith.constant 6 : i64
      %634 = func.call @cc_make_string(%632, %633) : (!llvm.ptr, i64) -> i64
      %635 = func.call @cc_nil_value() : () -> i64
      %636 = func.call @cc_intern(%634, %635) : (i64, i64) -> i64
      %637 = func.call @cc_nil_value() : () -> i64
      %638 = func.call @cc_cons(%636, %637) : (i64, i64) -> i64
      %639 = func.call @cc_values_pack(%638) : (i64) -> i64
      func.call @stack_push_pointer(%636) : (i64) -> ()
      %640 = func.call @stack_pop_pointer() : () -> i64
      %641 = func.call @cc_nil_value() : () -> i64
      %642 = func.call @cc_errorp(%65) : (i64) -> i64
      %643 = arith.cmpi ne, %642, %641 : i64
      %644 = arith.cmpi eq, %641, %641 : i64
      %645 = arith.andi %643, %644 : i1
      %646 = scf.if %645 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %641 : i64
      }
      %647 = func.call @cc_errorp(%347) : (i64) -> i64
      %648 = arith.cmpi ne, %647, %641 : i64
      %649 = arith.cmpi eq, %646, %641 : i64
      %650 = arith.andi %648, %649 : i1
      %651 = scf.if %650 -> (i64) {
        scf.yield %347 : i64
      } else {
        scf.yield %646 : i64
      }
      %652 = func.call @cc_errorp(%603) : (i64) -> i64
      %653 = arith.cmpi ne, %652, %641 : i64
      %654 = arith.cmpi eq, %651, %641 : i64
      %655 = arith.andi %653, %654 : i1
      %656 = scf.if %655 -> (i64) {
        scf.yield %603 : i64
      } else {
        scf.yield %651 : i64
      }
      %657 = func.call @cc_errorp(%608) : (i64) -> i64
      %658 = arith.cmpi ne, %657, %641 : i64
      %659 = arith.cmpi eq, %656, %641 : i64
      %660 = arith.andi %658, %659 : i1
      %661 = scf.if %660 -> (i64) {
        scf.yield %608 : i64
      } else {
        scf.yield %656 : i64
      }
      %662 = func.call @cc_errorp(%619) : (i64) -> i64
      %663 = arith.cmpi ne, %662, %641 : i64
      %664 = arith.cmpi eq, %661, %641 : i64
      %665 = arith.andi %663, %664 : i1
      %666 = scf.if %665 -> (i64) {
        scf.yield %619 : i64
      } else {
        scf.yield %661 : i64
      }
      %667 = func.call @cc_errorp(%620) : (i64) -> i64
      %668 = arith.cmpi ne, %667, %641 : i64
      %669 = arith.cmpi eq, %666, %641 : i64
      %670 = arith.andi %668, %669 : i1
      %671 = scf.if %670 -> (i64) {
        scf.yield %620 : i64
      } else {
        scf.yield %666 : i64
      }
      %672 = func.call @cc_errorp(%631) : (i64) -> i64
      %673 = arith.cmpi ne, %672, %641 : i64
      %674 = arith.cmpi eq, %671, %641 : i64
      %675 = arith.andi %673, %674 : i1
      %676 = scf.if %675 -> (i64) {
        scf.yield %631 : i64
      } else {
        scf.yield %671 : i64
      }
      %677 = func.call @cc_errorp(%640) : (i64) -> i64
      %678 = arith.cmpi ne, %677, %641 : i64
      %679 = arith.cmpi eq, %676, %641 : i64
      %680 = arith.andi %678, %679 : i1
      %681 = scf.if %680 -> (i64) {
        scf.yield %640 : i64
      } else {
        scf.yield %676 : i64
      }
      %682 = arith.cmpi ne, %681, %641 : i64
      scf.if %682 {
        func.call @stack_push_pointer(%681) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%347) : (i64) -> ()
        func.call @stack_push_pointer(%603) : (i64) -> ()
        func.call @stack_push_pointer(%608) : (i64) -> ()
        func.call @stack_push_pointer(%619) : (i64) -> ()
        func.call @stack_push_pointer(%620) : (i64) -> ()
        func.call @stack_push_pointer(%631) : (i64) -> ()
        func.call @stack_push_pointer(%640) : (i64) -> ()
        %683 = llvm.mlir.addressof @str74 : !llvm.ptr
        %684 = func.call @cc_make_function_ref_const(%683) : (!llvm.ptr) -> i64
        %685 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%684, %685) : (i64, i64) -> ()
      }
      %686 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %686 : i64
    }
    func.call @stack_push_pointer(%56) : (i64) -> ()
    %687 = func.call @stack_pop_pointer() : () -> i64
    %688 = func.call @cc_multiple_value_list(%687) : (i64) -> i64
    %689 = llvm.mlir.addressof @str75 : !llvm.ptr
    %690 = arith.constant 37 : i64
    %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
    %692 = func.call @cc_nil_value() : () -> i64
    %693 = func.call @cc_intern(%691, %692) : (i64, i64) -> i64
    %694 = func.call @cc_nil_value() : () -> i64
    %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
    %696 = func.call @cc_values_pack(%695) : (i64) -> i64
    %697 = func.call @cc_symbol_value(%693) : (i64) -> i64
    %698 = llvm.mlir.addressof @str76 : !llvm.ptr
    %699 = arith.constant 39 : i64
    %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
    %701 = func.call @cc_nil_value() : () -> i64
    %702 = func.call @cc_intern(%700, %701) : (i64, i64) -> i64
    %703 = func.call @cc_nil_value() : () -> i64
    %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
    %705 = func.call @cc_values_pack(%704) : (i64) -> i64
    %706 = func.call @cc_symbol_value(%702) : (i64) -> i64
    %707 = func.call @cc_nil_value() : () -> i64
    %708 = arith.cmpi ne, %697, %707 : i64
    %709 = scf.if %708 -> (i64) {
      scf.yield %706 : i64
    } else {
      scf.yield %688 : i64
    }
    %710 = func.call @cc_values_pack(%709) : (i64) -> i64
    func.call @stack_push_pointer(%710) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_76042832183297"() {
    %348 = func.call @cc_nil_value() : () -> i64
    %349 = func.call @cc_nil_value() : () -> i64
    %350 = func.call @cc_errorp(%348) : (i64) -> i64
    %351 = arith.cmpi ne, %350, %349 : i64
    %352 = scf.if %351 -> (i64) {
      scf.yield %348 : i64
    } else {
      %353 = func.call @cc_nil_value() : () -> i64
      %354 = arith.cmpi ne, %353, %353 : i64
      scf.if %354 {
        func.call @stack_push_pointer(%353) : (i64) -> ()
      } else {
        %355 = llvm.mlir.addressof @str42 : !llvm.ptr
        %356 = func.call @cc_make_function_ref_const(%355) : (!llvm.ptr) -> i64
        %357 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%356, %357) : (i64, i64) -> ()
      }
      %358 = func.call @stack_pop_pointer() : () -> i64
      %359 = func.call @cc_nil_value() : () -> i64
      %360 = func.call @cc_nil_value() : () -> i64
      %361 = func.call @cc_errorp(%359) : (i64) -> i64
      %362 = arith.cmpi ne, %361, %360 : i64
      %363 = scf.if %362 -> (i64) {
        scf.yield %359 : i64
      } else {
        %364 = llvm.mlir.addressof @str43 : !llvm.ptr
        %365 = arith.constant 2 : i64
        %366 = func.call @cc_make_string(%364, %365) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%366) : (i64) -> ()
        %367 = func.call @stack_pop_pointer() : () -> i64
        %368 = llvm.mlir.addressof @str44 : !llvm.ptr
        %369 = arith.constant 4 : i64
        %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%370) : (i64) -> ()
        %371 = arith.constant 4 : i64
        %372 = func.call @cc_collect_args(%371) : (i64) -> i64
        %373 = func.call @cc_funcall(%367, %372) : (i64, i64) -> i64
        func.call @stack_push_pointer(%373) : (i64) -> ()
        %374 = func.call @stack_pop_pointer() : () -> i64
        %375 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%375) : (i64) -> ()
        %376 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%376) : (i64) -> ()
        %377 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%377) : (i64) -> ()
        %378 = llvm.mlir.addressof @str45 : !llvm.ptr
        %379 = arith.constant 12 : i64
        %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%380) : (i64) -> ()
        %381 = func.call @stack_pop_pointer() : () -> i64
        %382 = func.call @stack_pop_pointer() : () -> i64
        %383 = func.call @cc_cons(%381, %382) : (i64, i64) -> i64
        func.call @stack_push_pointer(%383) : (i64) -> ()
        %384 = llvm.mlir.addressof @str46 : !llvm.ptr
        %385 = arith.constant 7 : i64
        %386 = func.call @cc_make_string(%384, %385) : (!llvm.ptr, i64) -> i64
        %387 = llvm.mlir.addressof @str47 : !llvm.ptr
        %388 = arith.constant 4 : i64
        %389 = func.call @cc_make_string(%387, %388) : (!llvm.ptr, i64) -> i64
        %390 = func.call @cc_intern(%386, %389) : (i64, i64) -> i64
        %391 = func.call @cc_nil_value() : () -> i64
        %392 = func.call @cc_cons(%390, %391) : (i64, i64) -> i64
        %393 = func.call @cc_values_pack(%392) : (i64) -> i64
        func.call @stack_push_pointer(%390) : (i64) -> ()
        %394 = func.call @stack_pop_pointer() : () -> i64
        %395 = func.call @stack_pop_pointer() : () -> i64
        %396 = func.call @cc_cons(%394, %395) : (i64, i64) -> i64
        func.call @stack_push_pointer(%396) : (i64) -> ()
        %397 = func.call @stack_pop_pointer() : () -> i64
        %398 = func.call @stack_pop_pointer() : () -> i64
        %399 = func.call @cc_cons(%397, %398) : (i64, i64) -> i64
        func.call @stack_push_pointer(%399) : (i64) -> ()
        %400 = llvm.mlir.addressof @str48 : !llvm.ptr
        %401 = arith.constant 8 : i64
        %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
        %403 = llvm.mlir.addressof @str49 : !llvm.ptr
        %404 = arith.constant 7 : i64
        %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
        %406 = func.call @cc_intern(%402, %405) : (i64, i64) -> i64
        %407 = func.call @cc_nil_value() : () -> i64
        %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
        %409 = func.call @cc_values_pack(%408) : (i64) -> i64
        func.call @stack_push_pointer(%406) : (i64) -> ()
        %410 = func.call @stack_pop_pointer() : () -> i64
        %411 = func.call @stack_pop_pointer() : () -> i64
        %412 = func.call @cc_cons(%410, %411) : (i64, i64) -> i64
        func.call @stack_push_pointer(%412) : (i64) -> ()
        %413 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %414 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%414) : (i64) -> ()
        %415 = llvm.mlir.addressof @str50 : !llvm.ptr
        %416 = arith.constant 8 : i64
        %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%417) : (i64) -> ()
        %418 = func.call @stack_pop_pointer() : () -> i64
        %419 = func.call @stack_pop_pointer() : () -> i64
        %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
        func.call @stack_push_pointer(%420) : (i64) -> ()
        %421 = llvm.mlir.addressof @str51 : !llvm.ptr
        %422 = arith.constant 21 : i64
        %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
        %424 = llvm.mlir.addressof @str52 : !llvm.ptr
        %425 = arith.constant 11 : i64
        %426 = func.call @cc_make_string(%424, %425) : (!llvm.ptr, i64) -> i64
        %427 = func.call @cc_intern(%423, %426) : (i64, i64) -> i64
        %428 = func.call @cc_nil_value() : () -> i64
        %429 = func.call @cc_cons(%427, %428) : (i64, i64) -> i64
        %430 = func.call @cc_values_pack(%429) : (i64) -> i64
        func.call @stack_push_pointer(%427) : (i64) -> ()
        %431 = func.call @stack_pop_pointer() : () -> i64
        %432 = func.call @stack_pop_pointer() : () -> i64
        %433 = func.call @cc_cons(%431, %432) : (i64, i64) -> i64
        func.call @stack_push_pointer(%433) : (i64) -> ()
        %434 = func.call @stack_pop_pointer() : () -> i64
        %435 = func.call @stack_pop_pointer() : () -> i64
        %436 = func.call @cc_cons(%434, %435) : (i64, i64) -> i64
        func.call @stack_push_pointer(%436) : (i64) -> ()
        %437 = llvm.mlir.addressof @str53 : !llvm.ptr
        %438 = arith.constant 13 : i64
        %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
        %440 = llvm.mlir.addressof @str54 : !llvm.ptr
        %441 = arith.constant 11 : i64
        %442 = func.call @cc_make_string(%440, %441) : (!llvm.ptr, i64) -> i64
        %443 = func.call @cc_intern(%439, %442) : (i64, i64) -> i64
        %444 = func.call @cc_nil_value() : () -> i64
        %445 = func.call @cc_cons(%443, %444) : (i64, i64) -> i64
        %446 = func.call @cc_values_pack(%445) : (i64) -> i64
        func.call @stack_push_pointer(%443) : (i64) -> ()
        %447 = func.call @stack_pop_pointer() : () -> i64
        %448 = func.call @stack_pop_pointer() : () -> i64
        %449 = func.call @cc_cons(%447, %448) : (i64, i64) -> i64
        func.call @stack_push_pointer(%449) : (i64) -> ()
        %450 = func.call @stack_pop_pointer() : () -> i64
        %451 = func.call @stack_pop_pointer() : () -> i64
        %452 = func.call @cc_cons(%450, %451) : (i64, i64) -> i64
        func.call @stack_push_pointer(%452) : (i64) -> ()
        %453 = llvm.mlir.addressof @str55 : !llvm.ptr
        %454 = arith.constant 4 : i64
        %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
        %456 = llvm.mlir.addressof @str56 : !llvm.ptr
        %457 = arith.constant 7 : i64
        %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
        %459 = func.call @cc_intern(%455, %458) : (i64, i64) -> i64
        %460 = func.call @cc_nil_value() : () -> i64
        %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
        %462 = func.call @cc_values_pack(%461) : (i64) -> i64
        func.call @stack_push_pointer(%459) : (i64) -> ()
        %463 = func.call @stack_pop_pointer() : () -> i64
        %464 = func.call @stack_pop_pointer() : () -> i64
        %465 = func.call @cc_cons(%463, %464) : (i64, i64) -> i64
        func.call @stack_push_pointer(%465) : (i64) -> ()
        %466 = llvm.mlir.addressof @str57 : !llvm.ptr
        %467 = arith.constant 13 : i64
        %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
        %469 = llvm.mlir.addressof @str58 : !llvm.ptr
        %470 = arith.constant 11 : i64
        %471 = func.call @cc_make_string(%469, %470) : (!llvm.ptr, i64) -> i64
        %472 = func.call @cc_intern(%468, %471) : (i64, i64) -> i64
        %473 = func.call @cc_nil_value() : () -> i64
        %474 = func.call @cc_cons(%472, %473) : (i64, i64) -> i64
        %475 = func.call @cc_values_pack(%474) : (i64) -> i64
        func.call @stack_push_pointer(%472) : (i64) -> ()
        %476 = func.call @stack_pop_pointer() : () -> i64
        %477 = func.call @stack_pop_pointer() : () -> i64
        %478 = func.call @cc_cons(%476, %477) : (i64, i64) -> i64
        func.call @stack_push_pointer(%478) : (i64) -> ()
        %479 = func.call @stack_pop_pointer() : () -> i64
        %480 = func.call @stack_pop_pointer() : () -> i64
        %481 = func.call @cc_cons(%479, %480) : (i64, i64) -> i64
        func.call @stack_push_pointer(%481) : (i64) -> ()
        %482 = llvm.mlir.addressof @str59 : !llvm.ptr
        %483 = arith.constant 11 : i64
        %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
        %485 = llvm.mlir.addressof @str60 : !llvm.ptr
        %486 = arith.constant 7 : i64
        %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
        %488 = func.call @cc_intern(%484, %487) : (i64, i64) -> i64
        %489 = func.call @cc_nil_value() : () -> i64
        %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
        %491 = func.call @cc_values_pack(%490) : (i64) -> i64
        func.call @stack_push_pointer(%488) : (i64) -> ()
        %492 = func.call @stack_pop_pointer() : () -> i64
        %493 = func.call @stack_pop_pointer() : () -> i64
        %494 = func.call @cc_cons(%492, %493) : (i64, i64) -> i64
        func.call @stack_push_pointer(%494) : (i64) -> ()
        %495 = llvm.mlir.addressof @str61 : !llvm.ptr
        %496 = arith.constant 6 : i64
        %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
        %498 = llvm.mlir.addressof @str62 : !llvm.ptr
        %499 = arith.constant 7 : i64
        %500 = func.call @cc_make_string(%498, %499) : (!llvm.ptr, i64) -> i64
        %501 = func.call @cc_intern(%497, %500) : (i64, i64) -> i64
        %502 = func.call @cc_nil_value() : () -> i64
        %503 = func.call @cc_cons(%501, %502) : (i64, i64) -> i64
        %504 = func.call @cc_values_pack(%503) : (i64) -> i64
        func.call @stack_push_pointer(%501) : (i64) -> ()
        %505 = func.call @stack_pop_pointer() : () -> i64
        %506 = func.call @stack_pop_pointer() : () -> i64
        %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
        func.call @stack_push_pointer(%507) : (i64) -> ()
        %508 = llvm.mlir.addressof @str63 : !llvm.ptr
        %509 = arith.constant 9 : i64
        %510 = func.call @cc_make_string(%508, %509) : (!llvm.ptr, i64) -> i64
        %511 = llvm.mlir.addressof @str64 : !llvm.ptr
        %512 = arith.constant 7 : i64
        %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
        %514 = func.call @cc_intern(%510, %513) : (i64, i64) -> i64
        %515 = func.call @cc_nil_value() : () -> i64
        %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
        %517 = func.call @cc_values_pack(%516) : (i64) -> i64
        func.call @stack_push_pointer(%514) : (i64) -> ()
        %518 = func.call @stack_pop_pointer() : () -> i64
        %519 = func.call @stack_pop_pointer() : () -> i64
        %520 = func.call @cc_cons(%518, %519) : (i64, i64) -> i64
        func.call @stack_push_pointer(%520) : (i64) -> ()
        %521 = llvm.mlir.addressof @str65 : !llvm.ptr
        %522 = arith.constant 36 : i64
        %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%523) : (i64) -> ()
        %524 = func.call @stack_pop_pointer() : () -> i64
        %525 = func.call @stack_pop_pointer() : () -> i64
        %526 = func.call @cc_cons(%524, %525) : (i64, i64) -> i64
        func.call @stack_push_pointer(%526) : (i64) -> ()
        %527 = llvm.mlir.addressof @str66 : !llvm.ptr
        %528 = arith.constant 12 : i64
        %529 = func.call @cc_make_string(%527, %528) : (!llvm.ptr, i64) -> i64
        %530 = func.call @cc_nil_value() : () -> i64
        %531 = func.call @cc_intern(%529, %530) : (i64, i64) -> i64
        %532 = func.call @cc_nil_value() : () -> i64
        %533 = func.call @cc_cons(%531, %532) : (i64, i64) -> i64
        %534 = func.call @cc_values_pack(%533) : (i64) -> i64
        func.call @stack_push_pointer(%531) : (i64) -> ()
        %535 = func.call @stack_pop_pointer() : () -> i64
        %536 = func.call @stack_pop_pointer() : () -> i64
        %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
        func.call @stack_push_pointer(%537) : (i64) -> ()
        %538 = func.call @stack_pop_pointer() : () -> i64
        %539 = func.call @cc_nil_value() : () -> i64
        %540 = func.call @cc_cons(%538, %539) : (i64, i64) -> i64
        %541 = func.call @cc_eval(%540) : (i64) -> i64
        %542 = func.call @cc_multiple_value_list(%541) : (i64) -> i64
        %543 = func.call @cc_values_pack(%542) : (i64) -> i64
        func.call @stack_push_pointer(%543) : (i64) -> ()
        %544 = func.call @stack_pop_pointer() : () -> i64
        %545 = func.call @cc_nil_value() : () -> i64
        %546 = arith.cmpi ne, %545, %545 : i64
        scf.if %546 {
          func.call @stack_push_pointer(%545) : (i64) -> ()
        } else {
          %547 = llvm.mlir.addressof @str67 : !llvm.ptr
          %548 = func.call @cc_make_function_ref_const(%547) : (!llvm.ptr) -> i64
          %549 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%548, %549) : (i64, i64) -> ()
        }
        %550 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%358) : (i64) -> ()
        %551 = func.call @stack_pop_pointer() : () -> i64
        %553 = arith.constant 3 : i64
        %552 = arith.andi %550, %553 : i64
        %554 = arith.constant 0 : i64
        %555 = arith.cmpi eq, %552, %554 : i64
        %557 = arith.constant 3 : i64
        %556 = arith.andi %551, %557 : i64
        %558 = arith.constant 0 : i64
        %559 = arith.cmpi eq, %556, %558 : i64
        %560 = arith.andi %555, %559 : i1
        %561 = scf.if %560 -> (i64) {
          %562 = arith.constant 2 : i64
          %563 = arith.shrsi %550, %562 : i64
          %564 = arith.constant 2 : i64
          %565 = arith.shrsi %551, %564 : i64
          %566 = arith.subi %563, %565 : i64
          %567 = arith.constant -2305843009213693952 : i64
          %568 = arith.constant 2305843009213693951 : i64
          %569 = arith.cmpi sge, %566, %567 : i64
          %570 = arith.cmpi sle, %566, %568 : i64
          %571 = arith.andi %569, %570 : i1
          %572 = scf.if %571 -> (i64) {
            %573 = arith.constant 2 : i64
            %574 = arith.shli %566, %573 : i64
            scf.yield %574 : i64
          } else {
            %575 = func.call @cc_sub(%550, %551) : (i64, i64) -> i64
            scf.yield %575 : i64
          }
          scf.yield %572 : i64
        } else {
          %576 = func.call @cc_sub(%550, %551) : (i64, i64) -> i64
          scf.yield %576 : i64
        }
        func.call @stack_push_pointer(%561) : (i64) -> ()
        %577 = func.call @stack_pop_pointer() : () -> i64
        %578 = func.call @cc_nil_value() : () -> i64
        %579 = func.call @cc_errorp(%374) : (i64) -> i64
        %580 = arith.cmpi ne, %579, %578 : i64
        %581 = arith.cmpi eq, %578, %578 : i64
        %582 = arith.andi %580, %581 : i1
        %583 = scf.if %582 -> (i64) {
          scf.yield %374 : i64
        } else {
          scf.yield %578 : i64
        }
        %584 = func.call @cc_errorp(%544) : (i64) -> i64
        %585 = arith.cmpi ne, %584, %578 : i64
        %586 = arith.cmpi eq, %583, %578 : i64
        %587 = arith.andi %585, %586 : i1
        %588 = scf.if %587 -> (i64) {
          scf.yield %544 : i64
        } else {
          scf.yield %583 : i64
        }
        %589 = func.call @cc_errorp(%577) : (i64) -> i64
        %590 = arith.cmpi ne, %589, %578 : i64
        %591 = arith.cmpi eq, %588, %578 : i64
        %592 = arith.andi %590, %591 : i1
        %593 = scf.if %592 -> (i64) {
          scf.yield %577 : i64
        } else {
          scf.yield %588 : i64
        }
        %594 = arith.cmpi ne, %593, %578 : i64
        scf.if %594 {
          func.call @stack_push_pointer(%593) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%374) : (i64) -> ()
          func.call @stack_push_pointer(%544) : (i64) -> ()
          func.call @stack_push_pointer(%577) : (i64) -> ()
          %595 = llvm.mlir.addressof @str68 : !llvm.ptr
          %596 = func.call @cc_make_function_ref_const(%595) : (!llvm.ptr) -> i64
          %597 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%596, %597) : (i64, i64) -> ()
        }
        %598 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %598 : i64
      }
      func.call @stack_push_pointer(%363) : (i64) -> ()
      %599 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %599 : i64
    }
    func.call @stack_push_pointer(%352) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_76042832183296*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_76042832183296*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_76042832183296*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("COMPILE-FILE-NO-UNWIND\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("UNWINDS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("THREAD-LOCAL-UNWINDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str9("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("WITH-UNLOCKED-PACKAGES\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str11("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str12("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str13("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str14("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("sys:src;lisp;kernel;lsp;predlib.lisp\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str17("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("foo.lisp\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str32("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("MKSTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str36("/tmp/predlib\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str37("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("THREAD-LOCAL-UNWINDS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str40("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str41("UNWINDS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("gctools:thread-local-unwinds\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str43("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str44("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("/tmp/predlib\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str46("MKSTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("DEFAULTS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("foo.lisp\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str51("COMPILE-FILE-PATHNAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("PATHNAME-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str56("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str57("MAKE-PATHNAME\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("OUTPUT-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str63("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str64("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("sys:src;lisp;kernel;lsp;predlib.lisp\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str66("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str67("gctools:thread-local-unwinds\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str68("ext:with-unlocked-packages\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str69("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str73("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETFLAG_76042832183296*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETMVLIST_76042832183296*\00") : !llvm.array<40 x i8>
}
