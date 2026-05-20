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
      %42 = func.call @cc_nil_value() : () -> i64
      %43 = func.call @cc_nil_value() : () -> i64
      %44 = func.call @cc_errorp(%42) : (i64) -> i64
      %45 = arith.cmpi ne, %44, %43 : i64
      %46 = scf.if %45 -> (i64) {
        scf.yield %42 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %47 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %48 = llvm.mlir.addressof @str4 : !llvm.ptr
        %49 = arith.constant 5 : i64
        %50 = func.call @cc_make_string(%48, %49) : (!llvm.ptr, i64) -> i64
        %51 = llvm.mlir.addressof @str5 : !llvm.ptr
        %52 = arith.constant 11 : i64
        %53 = func.call @cc_make_string(%51, %52) : (!llvm.ptr, i64) -> i64
        %54 = func.call @cc_intern(%50, %53) : (i64, i64) -> i64
        %55 = func.call @cc_nil_value() : () -> i64
        %56 = func.call @cc_cons(%54, %55) : (i64, i64) -> i64
        %57 = func.call @cc_values_pack(%56) : (i64) -> i64
        %58 = func.call @stack_pop_pointer() : () -> i64
        %59 = func.call @cc_cons(%54, %58) : (i64, i64) -> i64
        func.call @stack_push_pointer(%59) : (i64) -> ()
        %60 = func.call @stack_pop_pointer() : () -> i64
        %61 = llvm.mlir.addressof @str6 : !llvm.ptr
        %62 = arith.constant 13 : i64
        %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
        %64 = func.call @cc_nil_value() : () -> i64
        %65 = func.call @cc_intern(%63, %64) : (i64, i64) -> i64
        %66 = func.call @cc_nil_value() : () -> i64
        %67 = func.call @cc_cons(%65, %66) : (i64, i64) -> i64
        %68 = func.call @cc_values_pack(%67) : (i64) -> i64
        %69 = func.call @cc_defclass(%65, %47, %60) : (i64, i64, i64) -> i64
        %70 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%70) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %71 = func.call @stack_pop_pointer() : () -> i64
        %72 = func.call @stack_pop_pointer() : () -> i64
        %73 = func.call @cc_cons(%71, %72) : (i64, i64) -> i64
        func.call @stack_push_pointer(%73) : (i64) -> ()
        %74 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%74) : (i64) -> ()
        %75 = llvm.mlir.addressof @str7 : !llvm.ptr
        %76 = arith.constant 5 : i64
        %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
        %78 = llvm.mlir.addressof @str8 : !llvm.ptr
        %79 = arith.constant 11 : i64
        %80 = func.call @cc_make_string(%78, %79) : (!llvm.ptr, i64) -> i64
        %81 = func.call @cc_intern(%77, %80) : (i64, i64) -> i64
        %82 = func.call @cc_nil_value() : () -> i64
        %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
        %84 = func.call @cc_values_pack(%83) : (i64) -> i64
        func.call @stack_push_pointer(%81) : (i64) -> ()
        %85 = func.call @stack_pop_pointer() : () -> i64
        %86 = func.call @stack_pop_pointer() : () -> i64
        %87 = func.call @cc_cons(%85, %86) : (i64, i64) -> i64
        func.call @stack_push_pointer(%87) : (i64) -> ()
        %88 = func.call @stack_pop_pointer() : () -> i64
        %89 = func.call @stack_pop_pointer() : () -> i64
        %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
        func.call @stack_push_pointer(%90) : (i64) -> ()
        %91 = llvm.mlir.addressof @str9 : !llvm.ptr
        %92 = arith.constant 13 : i64
        %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
        %94 = func.call @cc_nil_value() : () -> i64
        %95 = func.call @cc_intern(%93, %94) : (i64, i64) -> i64
        %96 = func.call @cc_nil_value() : () -> i64
        %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
        %98 = func.call @cc_values_pack(%97) : (i64) -> i64
        func.call @stack_push_pointer(%95) : (i64) -> ()
        %99 = func.call @stack_pop_pointer() : () -> i64
        %100 = func.call @stack_pop_pointer() : () -> i64
        %101 = func.call @cc_cons(%99, %100) : (i64, i64) -> i64
        func.call @stack_push_pointer(%101) : (i64) -> ()
        %102 = llvm.mlir.addressof @str10 : !llvm.ptr
        %103 = arith.constant 8 : i64
        %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
        %105 = func.call @cc_nil_value() : () -> i64
        %106 = func.call @cc_intern(%104, %105) : (i64, i64) -> i64
        %107 = func.call @cc_nil_value() : () -> i64
        %108 = func.call @cc_cons(%106, %107) : (i64, i64) -> i64
        %109 = func.call @cc_values_pack(%108) : (i64) -> i64
        func.call @stack_push_pointer(%106) : (i64) -> ()
        %110 = func.call @stack_pop_pointer() : () -> i64
        %111 = func.call @stack_pop_pointer() : () -> i64
        %112 = func.call @cc_cons(%110, %111) : (i64, i64) -> i64
        func.call @stack_push_pointer(%112) : (i64) -> ()
        %113 = func.call @stack_pop_pointer() : () -> i64
        %114 = func.call @cc_nil_value() : () -> i64
        %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
        %116 = func.call @cc_eval(%115) : (i64) -> i64
        %117 = func.call @cc_multiple_value_list(%116) : (i64) -> i64
        %118 = func.call @cc_values_pack(%117) : (i64) -> i64
        func.call @stack_push_pointer(%118) : (i64) -> ()
        %119 = func.call @stack_depth() : () -> i64
        %120 = arith.constant 0 : i64
        %121 = arith.cmpi sgt, %119, %120 : i64
        scf.if %121 {
          %122 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%65) : (i64) -> ()
        %123 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %123 : i64
      }
      %124 = func.call @cc_nil_value() : () -> i64
      %125 = func.call @cc_errorp(%46) : (i64) -> i64
      %126 = arith.cmpi ne, %125, %124 : i64
      %127 = scf.if %126 -> (i64) {
        scf.yield %46 : i64
      } else {
        %128 = llvm.mlir.addressof @str11 : !llvm.ptr
        %129 = arith.constant 13 : i64
        %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
        %131 = func.call @cc_nil_value() : () -> i64
        %132 = func.call @cc_intern(%130, %131) : (i64, i64) -> i64
        %133 = func.call @cc_nil_value() : () -> i64
        %134 = func.call @cc_cons(%132, %133) : (i64, i64) -> i64
        %135 = func.call @cc_values_pack(%134) : (i64) -> i64
        func.call @stack_push_pointer(%132) : (i64) -> ()
        %136 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %136 : i64
      }
      func.call @stack_push_pointer(%127) : (i64) -> ()
      %137 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %137 : i64
    }
    %138 = func.call @cc_nil_value() : () -> i64
    %139 = func.call @cc_errorp(%41) : (i64) -> i64
    %140 = arith.cmpi ne, %139, %138 : i64
    %141 = scf.if %140 -> (i64) {
      scf.yield %41 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %142 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %143 = llvm.mlir.addressof @str12 : !llvm.ptr
      %144 = arith.constant 14 : i64
      %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
      %146 = llvm.mlir.addressof @str13 : !llvm.ptr
      %147 = arith.constant 11 : i64
      %148 = func.call @cc_make_string(%146, %147) : (!llvm.ptr, i64) -> i64
      %149 = func.call @cc_intern(%145, %148) : (i64, i64) -> i64
      %150 = func.call @cc_nil_value() : () -> i64
      %151 = func.call @cc_cons(%149, %150) : (i64, i64) -> i64
      %152 = func.call @cc_values_pack(%151) : (i64) -> i64
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @cc_cons(%149, %153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      %155 = func.call @stack_pop_pointer() : () -> i64
      %156 = llvm.mlir.addressof @str14 : !llvm.ptr
      %157 = arith.constant 15 : i64
      %158 = func.call @cc_make_string(%156, %157) : (!llvm.ptr, i64) -> i64
      %159 = func.call @cc_nil_value() : () -> i64
      %160 = func.call @cc_intern(%158, %159) : (i64, i64) -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_cons(%160, %161) : (i64, i64) -> i64
      %163 = func.call @cc_values_pack(%162) : (i64) -> i64
      %164 = func.call @cc_defclass(%160, %142, %155) : (i64, i64, i64) -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%165) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_cons(%166, %167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      %169 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      %170 = llvm.mlir.addressof @str15 : !llvm.ptr
      %171 = arith.constant 14 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = llvm.mlir.addressof @str16 : !llvm.ptr
      %174 = arith.constant 11 : i64
      %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
      %176 = func.call @cc_intern(%172, %175) : (i64, i64) -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_values_pack(%178) : (i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @cc_cons(%180, %181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%182) : (i64) -> ()
      %183 = func.call @stack_pop_pointer() : () -> i64
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%185) : (i64) -> ()
      %186 = llvm.mlir.addressof @str17 : !llvm.ptr
      %187 = arith.constant 15 : i64
      %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
      %189 = func.call @cc_nil_value() : () -> i64
      %190 = func.call @cc_intern(%188, %189) : (i64, i64) -> i64
      %191 = func.call @cc_nil_value() : () -> i64
      %192 = func.call @cc_cons(%190, %191) : (i64, i64) -> i64
      %193 = func.call @cc_values_pack(%192) : (i64) -> i64
      func.call @stack_push_pointer(%190) : (i64) -> ()
      %194 = func.call @stack_pop_pointer() : () -> i64
      %195 = func.call @stack_pop_pointer() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%196) : (i64) -> ()
      %197 = llvm.mlir.addressof @str18 : !llvm.ptr
      %198 = arith.constant 8 : i64
      %199 = func.call @cc_make_string(%197, %198) : (!llvm.ptr, i64) -> i64
      %200 = func.call @cc_nil_value() : () -> i64
      %201 = func.call @cc_intern(%199, %200) : (i64, i64) -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
      %204 = func.call @cc_values_pack(%203) : (i64) -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %205 = func.call @stack_pop_pointer() : () -> i64
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @cc_cons(%205, %206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%207) : (i64) -> ()
      %208 = func.call @stack_pop_pointer() : () -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_eval(%210) : (i64) -> i64
      %212 = func.call @cc_multiple_value_list(%211) : (i64) -> i64
      %213 = func.call @cc_values_pack(%212) : (i64) -> i64
      func.call @stack_push_pointer(%213) : (i64) -> ()
      %214 = func.call @stack_depth() : () -> i64
      %215 = arith.constant 0 : i64
      %216 = arith.cmpi sgt, %214, %215 : i64
      scf.if %216 {
        %217 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%160) : (i64) -> ()
      %218 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %218 : i64
    }
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_errorp(%141) : (i64) -> i64
    %221 = arith.cmpi ne, %220, %219 : i64
    %222 = scf.if %221 -> (i64) {
      scf.yield %141 : i64
    } else {
      %226 = llvm.mlir.addressof @method_name_47863920852993 : !llvm.ptr
      %227 = func.call @cc_make_lambda_ref_str(%226) : (!llvm.ptr) -> i64
      %228 = llvm.mlir.addressof @str20 : !llvm.ptr
      %229 = arith.constant 19 : i64
      %230 = func.call @cc_make_string(%228, %229) : (!llvm.ptr, i64) -> i64
      %231 = llvm.mlir.addressof @str21 : !llvm.ptr
      %232 = arith.constant 4 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_intern(%230, %233) : (i64, i64) -> i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
      %237 = func.call @cc_values_pack(%236) : (i64) -> i64
      %238 = func.call @cc_nil() : () -> i64
      %239 = llvm.mlir.addressof @str22 : !llvm.ptr
      %240 = arith.constant 14 : i64
      %241 = func.call @cc_make_string(%239, %240) : (!llvm.ptr, i64) -> i64
      %242 = llvm.mlir.addressof @str23 : !llvm.ptr
      %243 = arith.constant 11 : i64
      %244 = func.call @cc_make_string(%242, %243) : (!llvm.ptr, i64) -> i64
      %245 = func.call @cc_intern(%241, %244) : (i64, i64) -> i64
      %246 = func.call @cc_nil_value() : () -> i64
      %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
      %248 = func.call @cc_values_pack(%247) : (i64) -> i64
      %249 = func.call @cc_cons(%245, %238) : (i64, i64) -> i64
      %250 = llvm.mlir.addressof @str24 : !llvm.ptr
      %251 = arith.constant 15 : i64
      %252 = func.call @cc_make_string(%250, %251) : (!llvm.ptr, i64) -> i64
      %253 = func.call @cc_nil_value() : () -> i64
      %254 = func.call @cc_intern(%252, %253) : (i64, i64) -> i64
      %255 = func.call @cc_nil_value() : () -> i64
      %256 = func.call @cc_cons(%254, %255) : (i64, i64) -> i64
      %257 = func.call @cc_values_pack(%256) : (i64) -> i64
      %258 = func.call @cc_cons(%254, %249) : (i64, i64) -> i64
      %259 = arith.constant 2 : i64
      %260 = func.call @cc_box_fixnum(%259) : (i64) -> i64
      %261 = arith.constant 0 : i64
      %262 = func.call @cc_defmethod_qualified(%234, %258, %227, %260, %261) : (i64, i64, i64, i64, i64) -> i64
      %263 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %264 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @stack_pop_pointer() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      func.call @stack_push_pointer(%267) : (i64) -> ()
      %268 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%268) : (i64) -> ()
      %269 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      %270 = llvm.mlir.addressof @str25 : !llvm.ptr
      %271 = arith.constant 14 : i64
      %272 = func.call @cc_make_string(%270, %271) : (!llvm.ptr, i64) -> i64
      %273 = llvm.mlir.addressof @str26 : !llvm.ptr
      %274 = arith.constant 11 : i64
      %275 = func.call @cc_make_string(%273, %274) : (!llvm.ptr, i64) -> i64
      %276 = func.call @cc_intern(%272, %275) : (i64, i64) -> i64
      %277 = func.call @cc_nil_value() : () -> i64
      %278 = func.call @cc_cons(%276, %277) : (i64, i64) -> i64
      %279 = func.call @cc_values_pack(%278) : (i64) -> i64
      func.call @stack_push_pointer(%276) : (i64) -> ()
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @stack_pop_pointer() : () -> i64
      %282 = func.call @cc_cons(%280, %281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%282) : (i64) -> ()
      %283 = llvm.mlir.addressof @str27 : !llvm.ptr
      %284 = arith.constant 1 : i64
      %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
      %286 = func.call @cc_nil_value() : () -> i64
      %287 = func.call @cc_intern(%285, %286) : (i64, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_cons(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_values_pack(%289) : (i64) -> i64
      func.call @stack_push_pointer(%287) : (i64) -> ()
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @stack_pop_pointer() : () -> i64
      %293 = func.call @cc_cons(%291, %292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @cc_cons(%294, %295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%296) : (i64) -> ()
      %297 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %298 = llvm.mlir.addressof @str28 : !llvm.ptr
      %299 = arith.constant 15 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = func.call @cc_nil_value() : () -> i64
      %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
      %303 = func.call @cc_nil_value() : () -> i64
      %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
      %305 = func.call @cc_values_pack(%304) : (i64) -> i64
      func.call @stack_push_pointer(%302) : (i64) -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @stack_pop_pointer() : () -> i64
      %308 = func.call @cc_cons(%306, %307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %309 = llvm.mlir.addressof @str29 : !llvm.ptr
      %310 = arith.constant 1 : i64
      %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_intern(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_nil_value() : () -> i64
      %315 = func.call @cc_cons(%313, %314) : (i64, i64) -> i64
      %316 = func.call @cc_values_pack(%315) : (i64) -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @cc_cons(%317, %318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %320 = func.call @stack_pop_pointer() : () -> i64
      %321 = func.call @stack_pop_pointer() : () -> i64
      %322 = func.call @cc_cons(%320, %321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%322) : (i64) -> ()
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %326 = llvm.mlir.addressof @str30 : !llvm.ptr
      %327 = arith.constant 19 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = llvm.mlir.addressof @str31 : !llvm.ptr
      %330 = arith.constant 4 : i64
      %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
      %332 = func.call @cc_intern(%328, %331) : (i64, i64) -> i64
      %333 = func.call @cc_nil_value() : () -> i64
      %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
      %335 = func.call @cc_values_pack(%334) : (i64) -> i64
      func.call @stack_push_pointer(%332) : (i64) -> ()
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @stack_pop_pointer() : () -> i64
      %338 = func.call @cc_cons(%336, %337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%338) : (i64) -> ()
      %339 = llvm.mlir.addressof @str32 : !llvm.ptr
      %340 = arith.constant 9 : i64
      %341 = func.call @cc_make_string(%339, %340) : (!llvm.ptr, i64) -> i64
      %342 = func.call @cc_nil_value() : () -> i64
      %343 = func.call @cc_intern(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_nil_value() : () -> i64
      %345 = func.call @cc_cons(%343, %344) : (i64, i64) -> i64
      %346 = func.call @cc_values_pack(%345) : (i64) -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %347 = func.call @stack_pop_pointer() : () -> i64
      %348 = func.call @stack_pop_pointer() : () -> i64
      %349 = func.call @cc_cons(%347, %348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %350 = func.call @stack_pop_pointer() : () -> i64
      %351 = func.call @cc_nil_value() : () -> i64
      %352 = func.call @cc_cons(%350, %351) : (i64, i64) -> i64
      %353 = func.call @cc_eval(%352) : (i64) -> i64
      %354 = func.call @cc_multiple_value_list(%353) : (i64) -> i64
      %355 = func.call @cc_values_pack(%354) : (i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %356 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %356 : i64
    }
    %357 = func.call @cc_nil_value() : () -> i64
    %358 = func.call @cc_errorp(%222) : (i64) -> i64
    %359 = arith.cmpi ne, %358, %357 : i64
    %360 = scf.if %359 -> (i64) {
      scf.yield %222 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %361 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %362 = llvm.mlir.addressof @str33 : !llvm.ptr
      %363 = arith.constant 15 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = llvm.mlir.addressof @str34 : !llvm.ptr
      %366 = arith.constant 11 : i64
      %367 = func.call @cc_make_string(%365, %366) : (!llvm.ptr, i64) -> i64
      %368 = func.call @cc_intern(%364, %367) : (i64, i64) -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_cons(%368, %369) : (i64, i64) -> i64
      %371 = func.call @cc_values_pack(%370) : (i64) -> i64
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @cc_cons(%368, %372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = llvm.mlir.addressof @str35 : !llvm.ptr
      %376 = arith.constant 16 : i64
      %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
      %378 = func.call @cc_nil_value() : () -> i64
      %379 = func.call @cc_intern(%377, %378) : (i64, i64) -> i64
      %380 = func.call @cc_nil_value() : () -> i64
      %381 = func.call @cc_cons(%379, %380) : (i64, i64) -> i64
      %382 = func.call @cc_values_pack(%381) : (i64) -> i64
      %383 = func.call @cc_defclass(%379, %361, %374) : (i64, i64, i64) -> i64
      %384 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%384) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = func.call @cc_cons(%385, %386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %388 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%388) : (i64) -> ()
      %389 = llvm.mlir.addressof @str36 : !llvm.ptr
      %390 = arith.constant 15 : i64
      %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
      %392 = llvm.mlir.addressof @str37 : !llvm.ptr
      %393 = arith.constant 11 : i64
      %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
      %395 = func.call @cc_intern(%391, %394) : (i64, i64) -> i64
      %396 = func.call @cc_nil_value() : () -> i64
      %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
      %398 = func.call @cc_values_pack(%397) : (i64) -> i64
      func.call @stack_push_pointer(%395) : (i64) -> ()
      %399 = func.call @stack_pop_pointer() : () -> i64
      %400 = func.call @stack_pop_pointer() : () -> i64
      %401 = func.call @cc_cons(%399, %400) : (i64, i64) -> i64
      func.call @stack_push_pointer(%401) : (i64) -> ()
      %402 = func.call @stack_pop_pointer() : () -> i64
      %403 = func.call @stack_pop_pointer() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      func.call @stack_push_pointer(%404) : (i64) -> ()
      %405 = llvm.mlir.addressof @str38 : !llvm.ptr
      %406 = arith.constant 16 : i64
      %407 = func.call @cc_make_string(%405, %406) : (!llvm.ptr, i64) -> i64
      %408 = func.call @cc_nil_value() : () -> i64
      %409 = func.call @cc_intern(%407, %408) : (i64, i64) -> i64
      %410 = func.call @cc_nil_value() : () -> i64
      %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
      %412 = func.call @cc_values_pack(%411) : (i64) -> i64
      func.call @stack_push_pointer(%409) : (i64) -> ()
      %413 = func.call @stack_pop_pointer() : () -> i64
      %414 = func.call @stack_pop_pointer() : () -> i64
      %415 = func.call @cc_cons(%413, %414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%415) : (i64) -> ()
      %416 = llvm.mlir.addressof @str39 : !llvm.ptr
      %417 = arith.constant 8 : i64
      %418 = func.call @cc_make_string(%416, %417) : (!llvm.ptr, i64) -> i64
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_intern(%418, %419) : (i64, i64) -> i64
      %421 = func.call @cc_nil_value() : () -> i64
      %422 = func.call @cc_cons(%420, %421) : (i64, i64) -> i64
      %423 = func.call @cc_values_pack(%422) : (i64) -> i64
      func.call @stack_push_pointer(%420) : (i64) -> ()
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @stack_pop_pointer() : () -> i64
      %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%426) : (i64) -> ()
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_nil_value() : () -> i64
      %429 = func.call @cc_cons(%427, %428) : (i64, i64) -> i64
      %430 = func.call @cc_eval(%429) : (i64) -> i64
      %431 = func.call @cc_multiple_value_list(%430) : (i64) -> i64
      %432 = func.call @cc_values_pack(%431) : (i64) -> i64
      func.call @stack_push_pointer(%432) : (i64) -> ()
      %433 = func.call @stack_depth() : () -> i64
      %434 = arith.constant 0 : i64
      %435 = arith.cmpi sgt, %433, %434 : i64
      scf.if %435 {
        %436 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%379) : (i64) -> ()
      %437 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %437 : i64
    }
    %438 = func.call @cc_nil_value() : () -> i64
    %439 = func.call @cc_errorp(%360) : (i64) -> i64
    %440 = arith.cmpi ne, %439, %438 : i64
    %441 = scf.if %440 -> (i64) {
      scf.yield %360 : i64
    } else {
      %527 = llvm.mlir.addressof @method_name_47863920852994 : !llvm.ptr
      %528 = func.call @cc_make_lambda_ref_str(%527) : (!llvm.ptr) -> i64
      %529 = llvm.mlir.addressof @str49 : !llvm.ptr
      %530 = arith.constant 17 : i64
      %531 = func.call @cc_make_string(%529, %530) : (!llvm.ptr, i64) -> i64
      %532 = llvm.mlir.addressof @str50 : !llvm.ptr
      %533 = arith.constant 11 : i64
      %534 = func.call @cc_make_string(%532, %533) : (!llvm.ptr, i64) -> i64
      %535 = func.call @cc_intern(%531, %534) : (i64, i64) -> i64
      %536 = func.call @cc_nil_value() : () -> i64
      %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
      %538 = func.call @cc_values_pack(%537) : (i64) -> i64
      %539 = func.call @cc_nil() : () -> i64
      %540 = llvm.mlir.addressof @str51 : !llvm.ptr
      %541 = arith.constant 1 : i64
      %542 = func.call @cc_make_string(%540, %541) : (!llvm.ptr, i64) -> i64
      %543 = func.call @cc_nil_value() : () -> i64
      %544 = func.call @cc_intern(%542, %543) : (i64, i64) -> i64
      %545 = func.call @cc_nil_value() : () -> i64
      %546 = func.call @cc_cons(%544, %545) : (i64, i64) -> i64
      %547 = func.call @cc_values_pack(%546) : (i64) -> i64
      %548 = func.call @cc_cons(%544, %539) : (i64, i64) -> i64
      %549 = llvm.mlir.addressof @str52 : !llvm.ptr
      %550 = arith.constant 1 : i64
      %551 = func.call @cc_make_string(%549, %550) : (!llvm.ptr, i64) -> i64
      %552 = func.call @cc_nil_value() : () -> i64
      %553 = func.call @cc_intern(%551, %552) : (i64, i64) -> i64
      %554 = func.call @cc_nil_value() : () -> i64
      %555 = func.call @cc_cons(%553, %554) : (i64, i64) -> i64
      %556 = func.call @cc_values_pack(%555) : (i64) -> i64
      %557 = func.call @cc_cons(%553, %548) : (i64, i64) -> i64
      %558 = llvm.mlir.addressof @str53 : !llvm.ptr
      %559 = arith.constant 1 : i64
      %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
      %561 = func.call @cc_nil_value() : () -> i64
      %562 = func.call @cc_intern(%560, %561) : (i64, i64) -> i64
      %563 = func.call @cc_nil_value() : () -> i64
      %564 = func.call @cc_cons(%562, %563) : (i64, i64) -> i64
      %565 = func.call @cc_values_pack(%564) : (i64) -> i64
      %566 = func.call @cc_cons(%562, %557) : (i64, i64) -> i64
      %567 = llvm.mlir.addressof @str54 : !llvm.ptr
      %568 = arith.constant 1 : i64
      %569 = func.call @cc_make_string(%567, %568) : (!llvm.ptr, i64) -> i64
      %570 = func.call @cc_nil_value() : () -> i64
      %571 = func.call @cc_intern(%569, %570) : (i64, i64) -> i64
      %572 = func.call @cc_nil_value() : () -> i64
      %573 = func.call @cc_cons(%571, %572) : (i64, i64) -> i64
      %574 = func.call @cc_values_pack(%573) : (i64) -> i64
      %575 = func.call @cc_cons(%571, %566) : (i64, i64) -> i64
      %576 = llvm.mlir.addressof @str55 : !llvm.ptr
      %577 = arith.constant 1 : i64
      %578 = func.call @cc_make_string(%576, %577) : (!llvm.ptr, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_intern(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_nil_value() : () -> i64
      %582 = func.call @cc_cons(%580, %581) : (i64, i64) -> i64
      %583 = func.call @cc_values_pack(%582) : (i64) -> i64
      %584 = func.call @cc_cons(%580, %575) : (i64, i64) -> i64
      %585 = llvm.mlir.addressof @str56 : !llvm.ptr
      %586 = arith.constant 15 : i64
      %587 = func.call @cc_make_string(%585, %586) : (!llvm.ptr, i64) -> i64
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_intern(%587, %588) : (i64, i64) -> i64
      %590 = func.call @cc_nil_value() : () -> i64
      %591 = func.call @cc_cons(%589, %590) : (i64, i64) -> i64
      %592 = func.call @cc_values_pack(%591) : (i64) -> i64
      %593 = func.call @cc_cons(%589, %584) : (i64, i64) -> i64
      %594 = arith.constant 6 : i64
      %595 = func.call @cc_box_fixnum(%594) : (i64) -> i64
      %596 = arith.constant 3 : i64
      %597 = func.call @cc_defmethod_qualified(%535, %593, %528, %595, %596) : (i64, i64, i64, i64, i64) -> i64
      %598 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      %599 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%599) : (i64) -> ()
      %600 = llvm.mlir.addressof @str57 : !llvm.ptr
      %601 = arith.constant 4 : i64
      %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
      %603 = llvm.mlir.addressof @str58 : !llvm.ptr
      %604 = arith.constant 11 : i64
      %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
      %606 = func.call @cc_intern(%602, %605) : (i64, i64) -> i64
      %607 = func.call @cc_nil_value() : () -> i64
      %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
      %609 = func.call @cc_values_pack(%608) : (i64) -> i64
      func.call @stack_push_pointer(%606) : (i64) -> ()
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%610, %611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %613 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%613) : (i64) -> ()
      %614 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %615 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%616) : (i64) -> ()
      %617 = llvm.mlir.addressof @str59 : !llvm.ptr
      %618 = arith.constant 16 : i64
      %619 = func.call @cc_make_string(%617, %618) : (!llvm.ptr, i64) -> i64
      %620 = func.call @cc_nil_value() : () -> i64
      %621 = func.call @cc_intern(%619, %620) : (i64, i64) -> i64
      %622 = func.call @cc_nil_value() : () -> i64
      %623 = func.call @cc_cons(%621, %622) : (i64, i64) -> i64
      %624 = func.call @cc_values_pack(%623) : (i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = func.call @cc_cons(%625, %626) : (i64, i64) -> i64
      %628 = llvm.mlir.addressof @str60 : !llvm.ptr
      %629 = arith.constant 5 : i64
      %630 = func.call @cc_make_string(%628, %629) : (!llvm.ptr, i64) -> i64
      %631 = func.call @cc_nil_value() : () -> i64
      %632 = func.call @cc_intern(%630, %631) : (i64, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_values_pack(%634) : (i64) -> i64
      %636 = func.call @cc_cons(%632, %627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%636) : (i64) -> ()
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @stack_pop_pointer() : () -> i64
      %639 = func.call @cc_cons(%637, %638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%639) : (i64) -> ()
      %640 = llvm.mlir.addressof @str61 : !llvm.ptr
      %641 = arith.constant 10 : i64
      %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
      %643 = llvm.mlir.addressof @str62 : !llvm.ptr
      %644 = arith.constant 11 : i64
      %645 = func.call @cc_make_string(%643, %644) : (!llvm.ptr, i64) -> i64
      %646 = func.call @cc_intern(%642, %645) : (i64, i64) -> i64
      %647 = func.call @cc_nil_value() : () -> i64
      %648 = func.call @cc_cons(%646, %647) : (i64, i64) -> i64
      %649 = func.call @cc_values_pack(%648) : (i64) -> i64
      func.call @stack_push_pointer(%646) : (i64) -> ()
      %650 = func.call @stack_pop_pointer() : () -> i64
      %651 = func.call @stack_pop_pointer() : () -> i64
      %652 = func.call @cc_cons(%650, %651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%652) : (i64) -> ()
      %653 = func.call @stack_pop_pointer() : () -> i64
      %654 = func.call @stack_pop_pointer() : () -> i64
      %655 = func.call @cc_cons(%653, %654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%655) : (i64) -> ()
      %656 = llvm.mlir.addressof @str63 : !llvm.ptr
      %657 = arith.constant 4 : i64
      %658 = func.call @cc_make_string(%656, %657) : (!llvm.ptr, i64) -> i64
      %659 = llvm.mlir.addressof @str64 : !llvm.ptr
      %660 = arith.constant 11 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = func.call @cc_intern(%658, %661) : (i64, i64) -> i64
      %663 = func.call @cc_nil_value() : () -> i64
      %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
      %665 = func.call @cc_values_pack(%664) : (i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %666 = func.call @stack_pop_pointer() : () -> i64
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @cc_cons(%666, %667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%668) : (i64) -> ()
      %669 = func.call @stack_pop_pointer() : () -> i64
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @cc_cons(%669, %670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %672 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      %673 = llvm.mlir.addressof @str65 : !llvm.ptr
      %674 = arith.constant 19 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = func.call @cc_nil_value() : () -> i64
      %677 = func.call @cc_intern(%675, %676) : (i64, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_cons(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_values_pack(%679) : (i64) -> i64
      func.call @stack_push_pointer(%677) : (i64) -> ()
      %681 = func.call @stack_pop_pointer() : () -> i64
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @cc_cons(%681, %682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%683) : (i64) -> ()
      %684 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%684) : (i64) -> ()
      %685 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %686 = llvm.mlir.addressof @str66 : !llvm.ptr
      %687 = arith.constant 15 : i64
      %688 = func.call @cc_make_string(%686, %687) : (!llvm.ptr, i64) -> i64
      %689 = llvm.mlir.addressof @str67 : !llvm.ptr
      %690 = arith.constant 11 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = func.call @cc_intern(%688, %691) : (i64, i64) -> i64
      %693 = func.call @cc_nil_value() : () -> i64
      %694 = func.call @cc_cons(%692, %693) : (i64, i64) -> i64
      %695 = func.call @cc_values_pack(%694) : (i64) -> i64
      func.call @stack_push_pointer(%692) : (i64) -> ()
      %696 = func.call @stack_pop_pointer() : () -> i64
      %697 = func.call @stack_pop_pointer() : () -> i64
      %698 = func.call @cc_cons(%696, %697) : (i64, i64) -> i64
      %699 = llvm.mlir.addressof @str68 : !llvm.ptr
      %700 = arith.constant 5 : i64
      %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_intern(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      %707 = func.call @cc_cons(%703, %698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @stack_pop_pointer() : () -> i64
      %710 = func.call @cc_cons(%708, %709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%710) : (i64) -> ()
      %711 = llvm.mlir.addressof @str69 : !llvm.ptr
      %712 = arith.constant 10 : i64
      %713 = func.call @cc_make_string(%711, %712) : (!llvm.ptr, i64) -> i64
      %714 = llvm.mlir.addressof @str70 : !llvm.ptr
      %715 = arith.constant 11 : i64
      %716 = func.call @cc_make_string(%714, %715) : (!llvm.ptr, i64) -> i64
      %717 = func.call @cc_intern(%713, %716) : (i64, i64) -> i64
      %718 = func.call @cc_nil_value() : () -> i64
      %719 = func.call @cc_cons(%717, %718) : (i64, i64) -> i64
      %720 = func.call @cc_values_pack(%719) : (i64) -> i64
      func.call @stack_push_pointer(%717) : (i64) -> ()
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @stack_pop_pointer() : () -> i64
      %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%723) : (i64) -> ()
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @cc_cons(%724, %725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%726) : (i64) -> ()
      %727 = llvm.mlir.addressof @str71 : !llvm.ptr
      %728 = arith.constant 6 : i64
      %729 = func.call @cc_make_string(%727, %728) : (!llvm.ptr, i64) -> i64
      %730 = llvm.mlir.addressof @str72 : !llvm.ptr
      %731 = arith.constant 11 : i64
      %732 = func.call @cc_make_string(%730, %731) : (!llvm.ptr, i64) -> i64
      %733 = func.call @cc_intern(%729, %732) : (i64, i64) -> i64
      %734 = func.call @cc_nil_value() : () -> i64
      %735 = func.call @cc_cons(%733, %734) : (i64, i64) -> i64
      %736 = func.call @cc_values_pack(%735) : (i64) -> i64
      func.call @stack_push_pointer(%733) : (i64) -> ()
      %737 = func.call @stack_pop_pointer() : () -> i64
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = func.call @cc_cons(%737, %738) : (i64, i64) -> i64
      func.call @stack_push_pointer(%739) : (i64) -> ()
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%742) : (i64) -> ()
      %743 = llvm.mlir.addressof @str73 : !llvm.ptr
      %744 = arith.constant 6 : i64
      %745 = func.call @cc_make_string(%743, %744) : (!llvm.ptr, i64) -> i64
      %746 = llvm.mlir.addressof @str74 : !llvm.ptr
      %747 = arith.constant 11 : i64
      %748 = func.call @cc_make_string(%746, %747) : (!llvm.ptr, i64) -> i64
      %749 = func.call @cc_intern(%745, %748) : (i64, i64) -> i64
      %750 = func.call @cc_nil_value() : () -> i64
      %751 = func.call @cc_cons(%749, %750) : (i64, i64) -> i64
      %752 = func.call @cc_values_pack(%751) : (i64) -> i64
      func.call @stack_push_pointer(%749) : (i64) -> ()
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @cc_cons(%753, %754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%755) : (i64) -> ()
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @cc_cons(%756, %757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%758) : (i64) -> ()
      %759 = llvm.mlir.addressof @str75 : !llvm.ptr
      %760 = arith.constant 19 : i64
      %761 = func.call @cc_make_string(%759, %760) : (!llvm.ptr, i64) -> i64
      %762 = llvm.mlir.addressof @str76 : !llvm.ptr
      %763 = arith.constant 7 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = func.call @cc_intern(%761, %764) : (i64, i64) -> i64
      %766 = func.call @cc_nil_value() : () -> i64
      %767 = func.call @cc_cons(%765, %766) : (i64, i64) -> i64
      %768 = func.call @cc_values_pack(%767) : (i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @cc_cons(%769, %770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%771) : (i64) -> ()
      %772 = llvm.mlir.addressof @str77 : !llvm.ptr
      %773 = arith.constant 10 : i64
      %774 = func.call @cc_make_string(%772, %773) : (!llvm.ptr, i64) -> i64
      %775 = func.call @cc_nil_value() : () -> i64
      %776 = func.call @cc_intern(%774, %775) : (i64, i64) -> i64
      %777 = func.call @cc_nil_value() : () -> i64
      %778 = func.call @cc_cons(%776, %777) : (i64, i64) -> i64
      %779 = func.call @cc_values_pack(%778) : (i64) -> i64
      func.call @stack_push_pointer(%776) : (i64) -> ()
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @stack_pop_pointer() : () -> i64
      %782 = func.call @cc_cons(%780, %781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%782) : (i64) -> ()
      %783 = llvm.mlir.addressof @str78 : !llvm.ptr
      %784 = arith.constant 5 : i64
      %785 = func.call @cc_make_string(%783, %784) : (!llvm.ptr, i64) -> i64
      %786 = llvm.mlir.addressof @str79 : !llvm.ptr
      %787 = arith.constant 11 : i64
      %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
      %789 = func.call @cc_intern(%785, %788) : (i64, i64) -> i64
      %790 = func.call @cc_nil_value() : () -> i64
      %791 = func.call @cc_cons(%789, %790) : (i64, i64) -> i64
      %792 = func.call @cc_values_pack(%791) : (i64) -> i64
      func.call @stack_push_pointer(%789) : (i64) -> ()
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @cc_cons(%793, %794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      %796 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%796) : (i64) -> ()
      %797 = llvm.mlir.addressof @str80 : !llvm.ptr
      %798 = arith.constant 16 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = llvm.mlir.addressof @str81 : !llvm.ptr
      %801 = arith.constant 11 : i64
      %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
      %803 = func.call @cc_intern(%799, %802) : (i64, i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
      %806 = func.call @cc_values_pack(%805) : (i64) -> i64
      func.call @stack_push_pointer(%803) : (i64) -> ()
      %807 = func.call @stack_pop_pointer() : () -> i64
      %808 = func.call @stack_pop_pointer() : () -> i64
      %809 = func.call @cc_cons(%807, %808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%809) : (i64) -> ()
      %810 = llvm.mlir.addressof @str82 : !llvm.ptr
      %811 = arith.constant 8 : i64
      %812 = func.call @cc_make_string(%810, %811) : (!llvm.ptr, i64) -> i64
      %813 = func.call @cc_nil_value() : () -> i64
      %814 = func.call @cc_intern(%812, %813) : (i64, i64) -> i64
      %815 = func.call @cc_nil_value() : () -> i64
      %816 = func.call @cc_cons(%814, %815) : (i64, i64) -> i64
      %817 = func.call @cc_values_pack(%816) : (i64) -> i64
      func.call @stack_push_pointer(%814) : (i64) -> ()
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @stack_pop_pointer() : () -> i64
      %820 = func.call @cc_cons(%818, %819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @cc_cons(%821, %822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%823) : (i64) -> ()
      %824 = llvm.mlir.addressof @str83 : !llvm.ptr
      %825 = arith.constant 5 : i64
      %826 = func.call @cc_make_string(%824, %825) : (!llvm.ptr, i64) -> i64
      %827 = llvm.mlir.addressof @str84 : !llvm.ptr
      %828 = arith.constant 11 : i64
      %829 = func.call @cc_make_string(%827, %828) : (!llvm.ptr, i64) -> i64
      %830 = func.call @cc_intern(%826, %829) : (i64, i64) -> i64
      %831 = func.call @cc_nil_value() : () -> i64
      %832 = func.call @cc_cons(%830, %831) : (i64, i64) -> i64
      %833 = func.call @cc_values_pack(%832) : (i64) -> i64
      func.call @stack_push_pointer(%830) : (i64) -> ()
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @stack_pop_pointer() : () -> i64
      %836 = func.call @cc_cons(%834, %835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%836) : (i64) -> ()
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = func.call @cc_cons(%837, %838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%839) : (i64) -> ()
      %840 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%840) : (i64) -> ()
      %841 = llvm.mlir.addressof @str85 : !llvm.ptr
      %842 = arith.constant 19 : i64
      %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
      %844 = func.call @cc_nil_value() : () -> i64
      %845 = func.call @cc_intern(%843, %844) : (i64, i64) -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_cons(%845, %846) : (i64, i64) -> i64
      %848 = func.call @cc_values_pack(%847) : (i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @cc_cons(%849, %850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%851) : (i64) -> ()
      %852 = llvm.mlir.addressof @str86 : !llvm.ptr
      %853 = arith.constant 4 : i64
      %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
      %855 = llvm.mlir.addressof @str87 : !llvm.ptr
      %856 = arith.constant 11 : i64
      %857 = func.call @cc_make_string(%855, %856) : (!llvm.ptr, i64) -> i64
      %858 = func.call @cc_intern(%854, %857) : (i64, i64) -> i64
      %859 = func.call @cc_nil_value() : () -> i64
      %860 = func.call @cc_cons(%858, %859) : (i64, i64) -> i64
      %861 = func.call @cc_values_pack(%860) : (i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @cc_cons(%862, %863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%864) : (i64) -> ()
      %865 = llvm.mlir.addressof @str88 : !llvm.ptr
      %866 = arith.constant 4 : i64
      %867 = func.call @cc_make_string(%865, %866) : (!llvm.ptr, i64) -> i64
      %868 = llvm.mlir.addressof @str89 : !llvm.ptr
      %869 = arith.constant 11 : i64
      %870 = func.call @cc_make_string(%868, %869) : (!llvm.ptr, i64) -> i64
      %871 = func.call @cc_intern(%867, %870) : (i64, i64) -> i64
      %872 = func.call @cc_nil_value() : () -> i64
      %873 = func.call @cc_cons(%871, %872) : (i64, i64) -> i64
      %874 = func.call @cc_values_pack(%873) : (i64) -> i64
      func.call @stack_push_pointer(%871) : (i64) -> ()
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @stack_pop_pointer() : () -> i64
      %877 = func.call @cc_cons(%875, %876) : (i64, i64) -> i64
      func.call @stack_push_pointer(%877) : (i64) -> ()
      %878 = llvm.mlir.addressof @str90 : !llvm.ptr
      %879 = arith.constant 5 : i64
      %880 = func.call @cc_make_string(%878, %879) : (!llvm.ptr, i64) -> i64
      %881 = llvm.mlir.addressof @str91 : !llvm.ptr
      %882 = arith.constant 11 : i64
      %883 = func.call @cc_make_string(%881, %882) : (!llvm.ptr, i64) -> i64
      %884 = func.call @cc_intern(%880, %883) : (i64, i64) -> i64
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_cons(%884, %885) : (i64, i64) -> i64
      %887 = func.call @cc_values_pack(%886) : (i64) -> i64
      func.call @stack_push_pointer(%884) : (i64) -> ()
      %888 = func.call @stack_pop_pointer() : () -> i64
      %889 = func.call @stack_pop_pointer() : () -> i64
      %890 = func.call @cc_cons(%888, %889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%890) : (i64) -> ()
      %891 = llvm.mlir.addressof @str92 : !llvm.ptr
      %892 = arith.constant 10 : i64
      %893 = func.call @cc_make_string(%891, %892) : (!llvm.ptr, i64) -> i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = func.call @cc_intern(%893, %894) : (i64, i64) -> i64
      %896 = func.call @cc_nil_value() : () -> i64
      %897 = func.call @cc_cons(%895, %896) : (i64, i64) -> i64
      %898 = func.call @cc_values_pack(%897) : (i64) -> i64
      func.call @stack_push_pointer(%895) : (i64) -> ()
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @stack_pop_pointer() : () -> i64
      %901 = func.call @cc_cons(%899, %900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%901) : (i64) -> ()
      %902 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%902) : (i64) -> ()
      %903 = llvm.mlir.addressof @str93 : !llvm.ptr
      %904 = arith.constant 15 : i64
      %905 = func.call @cc_make_string(%903, %904) : (!llvm.ptr, i64) -> i64
      %906 = func.call @cc_nil_value() : () -> i64
      %907 = func.call @cc_intern(%905, %906) : (i64, i64) -> i64
      %908 = func.call @cc_nil_value() : () -> i64
      %909 = func.call @cc_cons(%907, %908) : (i64, i64) -> i64
      %910 = func.call @cc_values_pack(%909) : (i64) -> i64
      func.call @stack_push_pointer(%907) : (i64) -> ()
      %911 = func.call @stack_pop_pointer() : () -> i64
      %912 = func.call @stack_pop_pointer() : () -> i64
      %913 = func.call @cc_cons(%911, %912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%913) : (i64) -> ()
      %914 = llvm.mlir.addressof @str94 : !llvm.ptr
      %915 = arith.constant 5 : i64
      %916 = func.call @cc_make_string(%914, %915) : (!llvm.ptr, i64) -> i64
      %917 = llvm.mlir.addressof @str95 : !llvm.ptr
      %918 = arith.constant 11 : i64
      %919 = func.call @cc_make_string(%917, %918) : (!llvm.ptr, i64) -> i64
      %920 = func.call @cc_intern(%916, %919) : (i64, i64) -> i64
      %921 = func.call @cc_nil_value() : () -> i64
      %922 = func.call @cc_cons(%920, %921) : (i64, i64) -> i64
      %923 = func.call @cc_values_pack(%922) : (i64) -> i64
      func.call @stack_push_pointer(%920) : (i64) -> ()
      %924 = func.call @stack_pop_pointer() : () -> i64
      %925 = func.call @stack_pop_pointer() : () -> i64
      %926 = func.call @cc_cons(%924, %925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%926) : (i64) -> ()
      %927 = func.call @stack_pop_pointer() : () -> i64
      %928 = func.call @stack_pop_pointer() : () -> i64
      %929 = func.call @cc_cons(%927, %928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%929) : (i64) -> ()
      %930 = func.call @stack_pop_pointer() : () -> i64
      %931 = func.call @stack_pop_pointer() : () -> i64
      %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%932) : (i64) -> ()
      %933 = llvm.mlir.addressof @str96 : !llvm.ptr
      %934 = arith.constant 6 : i64
      %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
      %936 = llvm.mlir.addressof @str97 : !llvm.ptr
      %937 = arith.constant 7 : i64
      %938 = func.call @cc_make_string(%936, %937) : (!llvm.ptr, i64) -> i64
      %939 = func.call @cc_intern(%935, %938) : (i64, i64) -> i64
      %940 = func.call @cc_nil_value() : () -> i64
      %941 = func.call @cc_cons(%939, %940) : (i64, i64) -> i64
      %942 = func.call @cc_values_pack(%941) : (i64) -> i64
      func.call @stack_push_pointer(%939) : (i64) -> ()
      %943 = func.call @stack_pop_pointer() : () -> i64
      %944 = func.call @stack_pop_pointer() : () -> i64
      %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%945) : (i64) -> ()
      %946 = llvm.mlir.addressof @str98 : !llvm.ptr
      %947 = arith.constant 17 : i64
      %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
      %949 = llvm.mlir.addressof @str99 : !llvm.ptr
      %950 = arith.constant 11 : i64
      %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
      %952 = func.call @cc_intern(%948, %951) : (i64, i64) -> i64
      %953 = func.call @cc_nil_value() : () -> i64
      %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
      %955 = func.call @cc_values_pack(%954) : (i64) -> i64
      func.call @stack_push_pointer(%952) : (i64) -> ()
      %956 = func.call @stack_pop_pointer() : () -> i64
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @cc_cons(%956, %957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%958) : (i64) -> ()
      %959 = llvm.mlir.addressof @str100 : !llvm.ptr
      %960 = arith.constant 9 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = func.call @cc_nil_value() : () -> i64
      %963 = func.call @cc_intern(%961, %962) : (i64, i64) -> i64
      %964 = func.call @cc_nil_value() : () -> i64
      %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
      %966 = func.call @cc_values_pack(%965) : (i64) -> i64
      func.call @stack_push_pointer(%963) : (i64) -> ()
      %967 = func.call @stack_pop_pointer() : () -> i64
      %968 = func.call @stack_pop_pointer() : () -> i64
      %969 = func.call @cc_cons(%967, %968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%969) : (i64) -> ()
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = func.call @cc_nil_value() : () -> i64
      %972 = func.call @cc_cons(%970, %971) : (i64, i64) -> i64
      %973 = func.call @cc_eval(%972) : (i64) -> i64
      %974 = func.call @cc_multiple_value_list(%973) : (i64) -> i64
      %975 = func.call @cc_values_pack(%974) : (i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      %976 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %976 : i64
    }
    %977 = func.call @cc_nil_value() : () -> i64
    %978 = func.call @cc_errorp(%441) : (i64) -> i64
    %979 = arith.cmpi ne, %978, %977 : i64
    %980 = scf.if %979 -> (i64) {
      scf.yield %441 : i64
    } else {
      %1009 = llvm.mlir.addressof @method_name_47863920852995 : !llvm.ptr
      %1010 = func.call @cc_make_lambda_ref_str(%1009) : (!llvm.ptr) -> i64
      %1011 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1012 = arith.constant 35 : i64
      %1013 = func.call @cc_make_string(%1011, %1012) : (!llvm.ptr, i64) -> i64
      %1014 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1015 = arith.constant 11 : i64
      %1016 = func.call @cc_make_string(%1014, %1015) : (!llvm.ptr, i64) -> i64
      %1017 = func.call @cc_intern(%1013, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_nil_value() : () -> i64
      %1019 = func.call @cc_cons(%1017, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_values_pack(%1019) : (i64) -> i64
      %1021 = func.call @cc_nil() : () -> i64
      %1022 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1023 = arith.constant 1 : i64
      %1024 = func.call @cc_make_string(%1022, %1023) : (!llvm.ptr, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_intern(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_nil_value() : () -> i64
      %1028 = func.call @cc_cons(%1026, %1027) : (i64, i64) -> i64
      %1029 = func.call @cc_values_pack(%1028) : (i64) -> i64
      %1030 = func.call @cc_cons(%1026, %1021) : (i64, i64) -> i64
      %1031 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1032 = arith.constant 1 : i64
      %1033 = func.call @cc_make_string(%1031, %1032) : (!llvm.ptr, i64) -> i64
      %1034 = func.call @cc_nil_value() : () -> i64
      %1035 = func.call @cc_intern(%1033, %1034) : (i64, i64) -> i64
      %1036 = func.call @cc_nil_value() : () -> i64
      %1037 = func.call @cc_cons(%1035, %1036) : (i64, i64) -> i64
      %1038 = func.call @cc_values_pack(%1037) : (i64) -> i64
      %1039 = func.call @cc_cons(%1035, %1030) : (i64, i64) -> i64
      %1040 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1041 = arith.constant 1 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = func.call @cc_nil_value() : () -> i64
      %1044 = func.call @cc_intern(%1042, %1043) : (i64, i64) -> i64
      %1045 = func.call @cc_nil_value() : () -> i64
      %1046 = func.call @cc_cons(%1044, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_values_pack(%1046) : (i64) -> i64
      %1048 = func.call @cc_cons(%1044, %1039) : (i64, i64) -> i64
      %1049 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1050 = arith.constant 1 : i64
      %1051 = func.call @cc_make_string(%1049, %1050) : (!llvm.ptr, i64) -> i64
      %1052 = func.call @cc_nil_value() : () -> i64
      %1053 = func.call @cc_intern(%1051, %1052) : (i64, i64) -> i64
      %1054 = func.call @cc_nil_value() : () -> i64
      %1055 = func.call @cc_cons(%1053, %1054) : (i64, i64) -> i64
      %1056 = func.call @cc_values_pack(%1055) : (i64) -> i64
      %1057 = func.call @cc_cons(%1053, %1048) : (i64, i64) -> i64
      %1058 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1059 = arith.constant 1 : i64
      %1060 = func.call @cc_make_string(%1058, %1059) : (!llvm.ptr, i64) -> i64
      %1061 = func.call @cc_nil_value() : () -> i64
      %1062 = func.call @cc_intern(%1060, %1061) : (i64, i64) -> i64
      %1063 = func.call @cc_nil_value() : () -> i64
      %1064 = func.call @cc_cons(%1062, %1063) : (i64, i64) -> i64
      %1065 = func.call @cc_values_pack(%1064) : (i64) -> i64
      %1066 = func.call @cc_cons(%1062, %1057) : (i64, i64) -> i64
      %1067 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1068 = arith.constant 16 : i64
      %1069 = func.call @cc_make_string(%1067, %1068) : (!llvm.ptr, i64) -> i64
      %1070 = func.call @cc_nil_value() : () -> i64
      %1071 = func.call @cc_intern(%1069, %1070) : (i64, i64) -> i64
      %1072 = func.call @cc_nil_value() : () -> i64
      %1073 = func.call @cc_cons(%1071, %1072) : (i64, i64) -> i64
      %1074 = func.call @cc_values_pack(%1073) : (i64) -> i64
      %1075 = func.call @cc_cons(%1071, %1066) : (i64, i64) -> i64
      %1076 = arith.constant 6 : i64
      %1077 = func.call @cc_box_fixnum(%1076) : (i64) -> i64
      %1078 = arith.constant 1 : i64
      %1079 = func.call @cc_defmethod_qualified(%1017, %1075, %1010, %1077, %1078) : (i64, i64, i64, i64, i64) -> i64
      %1080 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1080) : (i64) -> ()
      %1081 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1082) : (i64) -> ()
      %1083 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1084 = arith.constant 13 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_intern(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_cons(%1087, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_values_pack(%1089) : (i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @stack_pop_pointer() : () -> i64
      %1093 = func.call @cc_cons(%1091, %1092) : (i64, i64) -> i64
      %1094 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1095 = arith.constant 5 : i64
      %1096 = func.call @cc_make_string(%1094, %1095) : (!llvm.ptr, i64) -> i64
      %1097 = func.call @cc_nil_value() : () -> i64
      %1098 = func.call @cc_intern(%1096, %1097) : (i64, i64) -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_cons(%1098, %1099) : (i64, i64) -> i64
      %1101 = func.call @cc_values_pack(%1100) : (i64) -> i64
      %1102 = func.call @cc_cons(%1098, %1093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1102) : (i64) -> ()
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = func.call @cc_cons(%1103, %1104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1105) : (i64) -> ()
      %1106 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1107 = arith.constant 5 : i64
      %1108 = func.call @cc_make_string(%1106, %1107) : (!llvm.ptr, i64) -> i64
      %1109 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1110 = arith.constant 11 : i64
      %1111 = func.call @cc_make_string(%1109, %1110) : (!llvm.ptr, i64) -> i64
      %1112 = func.call @cc_intern(%1108, %1111) : (i64, i64) -> i64
      %1113 = func.call @cc_nil_value() : () -> i64
      %1114 = func.call @cc_cons(%1112, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_values_pack(%1114) : (i64) -> i64
      func.call @stack_push_pointer(%1112) : (i64) -> ()
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @stack_pop_pointer() : () -> i64
      %1118 = func.call @cc_cons(%1116, %1117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1118) : (i64) -> ()
      %1119 = func.call @stack_pop_pointer() : () -> i64
      %1120 = func.call @stack_pop_pointer() : () -> i64
      %1121 = func.call @cc_cons(%1119, %1120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1121) : (i64) -> ()
      %1122 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1122) : (i64) -> ()
      %1123 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1123) : (i64) -> ()
      %1124 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1125 = arith.constant 8 : i64
      %1126 = func.call @cc_make_string(%1124, %1125) : (!llvm.ptr, i64) -> i64
      %1127 = func.call @cc_nil_value() : () -> i64
      %1128 = func.call @cc_intern(%1126, %1127) : (i64, i64) -> i64
      %1129 = func.call @cc_nil_value() : () -> i64
      %1130 = func.call @cc_cons(%1128, %1129) : (i64, i64) -> i64
      %1131 = func.call @cc_values_pack(%1130) : (i64) -> i64
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1132 = func.call @stack_pop_pointer() : () -> i64
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @cc_cons(%1132, %1133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1134) : (i64) -> ()
      %1135 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1136 = arith.constant 13 : i64
      %1137 = func.call @cc_make_string(%1135, %1136) : (!llvm.ptr, i64) -> i64
      %1138 = func.call @cc_nil_value() : () -> i64
      %1139 = func.call @cc_intern(%1137, %1138) : (i64, i64) -> i64
      %1140 = func.call @cc_nil_value() : () -> i64
      %1141 = func.call @cc_cons(%1139, %1140) : (i64, i64) -> i64
      %1142 = func.call @cc_values_pack(%1141) : (i64) -> i64
      func.call @stack_push_pointer(%1139) : (i64) -> ()
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @cc_cons(%1143, %1144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1145) : (i64) -> ()
      %1146 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1147 = arith.constant 15 : i64
      %1148 = func.call @cc_make_string(%1146, %1147) : (!llvm.ptr, i64) -> i64
      %1149 = func.call @cc_nil_value() : () -> i64
      %1150 = func.call @cc_intern(%1148, %1149) : (i64, i64) -> i64
      %1151 = func.call @cc_nil_value() : () -> i64
      %1152 = func.call @cc_cons(%1150, %1151) : (i64, i64) -> i64
      %1153 = func.call @cc_values_pack(%1152) : (i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @stack_pop_pointer() : () -> i64
      %1156 = func.call @cc_cons(%1154, %1155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1156) : (i64) -> ()
      %1157 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1158 = arith.constant 11 : i64
      %1159 = func.call @cc_make_string(%1157, %1158) : (!llvm.ptr, i64) -> i64
      %1160 = func.call @cc_nil_value() : () -> i64
      %1161 = func.call @cc_intern(%1159, %1160) : (i64, i64) -> i64
      %1162 = func.call @cc_nil_value() : () -> i64
      %1163 = func.call @cc_cons(%1161, %1162) : (i64, i64) -> i64
      %1164 = func.call @cc_values_pack(%1163) : (i64) -> i64
      func.call @stack_push_pointer(%1161) : (i64) -> ()
      %1165 = func.call @stack_pop_pointer() : () -> i64
      %1166 = func.call @stack_pop_pointer() : () -> i64
      %1167 = func.call @cc_cons(%1165, %1166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1167) : (i64) -> ()
      %1168 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1169 = arith.constant 6 : i64
      %1170 = func.call @cc_make_string(%1168, %1169) : (!llvm.ptr, i64) -> i64
      %1171 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1172 = arith.constant 11 : i64
      %1173 = func.call @cc_make_string(%1171, %1172) : (!llvm.ptr, i64) -> i64
      %1174 = func.call @cc_intern(%1170, %1173) : (i64, i64) -> i64
      %1175 = func.call @cc_nil_value() : () -> i64
      %1176 = func.call @cc_cons(%1174, %1175) : (i64, i64) -> i64
      %1177 = func.call @cc_values_pack(%1176) : (i64) -> i64
      func.call @stack_push_pointer(%1174) : (i64) -> ()
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @stack_pop_pointer() : () -> i64
      %1180 = func.call @cc_cons(%1178, %1179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1180) : (i64) -> ()
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @stack_pop_pointer() : () -> i64
      %1183 = func.call @cc_cons(%1181, %1182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1183) : (i64) -> ()
      %1184 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1185 = arith.constant 7 : i64
      %1186 = func.call @cc_make_string(%1184, %1185) : (!llvm.ptr, i64) -> i64
      %1187 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1188 = arith.constant 11 : i64
      %1189 = func.call @cc_make_string(%1187, %1188) : (!llvm.ptr, i64) -> i64
      %1190 = func.call @cc_intern(%1186, %1189) : (i64, i64) -> i64
      %1191 = func.call @cc_nil_value() : () -> i64
      %1192 = func.call @cc_cons(%1190, %1191) : (i64, i64) -> i64
      %1193 = func.call @cc_values_pack(%1192) : (i64) -> i64
      func.call @stack_push_pointer(%1190) : (i64) -> ()
      %1194 = func.call @stack_pop_pointer() : () -> i64
      %1195 = func.call @stack_pop_pointer() : () -> i64
      %1196 = func.call @cc_cons(%1194, %1195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1196) : (i64) -> ()
      %1197 = func.call @stack_pop_pointer() : () -> i64
      %1198 = func.call @stack_pop_pointer() : () -> i64
      %1199 = func.call @cc_cons(%1197, %1198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1199) : (i64) -> ()
      %1200 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1200) : (i64) -> ()
      %1201 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1202 = arith.constant 8 : i64
      %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
      %1204 = func.call @cc_nil_value() : () -> i64
      %1205 = func.call @cc_intern(%1203, %1204) : (i64, i64) -> i64
      %1206 = func.call @cc_nil_value() : () -> i64
      %1207 = func.call @cc_cons(%1205, %1206) : (i64, i64) -> i64
      %1208 = func.call @cc_values_pack(%1207) : (i64) -> i64
      func.call @stack_push_pointer(%1205) : (i64) -> ()
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @stack_pop_pointer() : () -> i64
      %1211 = func.call @cc_cons(%1209, %1210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1211) : (i64) -> ()
      %1212 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1213 = arith.constant 5 : i64
      %1214 = func.call @cc_make_string(%1212, %1213) : (!llvm.ptr, i64) -> i64
      %1215 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1216 = arith.constant 11 : i64
      %1217 = func.call @cc_make_string(%1215, %1216) : (!llvm.ptr, i64) -> i64
      %1218 = func.call @cc_intern(%1214, %1217) : (i64, i64) -> i64
      %1219 = func.call @cc_nil_value() : () -> i64
      %1220 = func.call @cc_cons(%1218, %1219) : (i64, i64) -> i64
      %1221 = func.call @cc_values_pack(%1220) : (i64) -> i64
      func.call @stack_push_pointer(%1218) : (i64) -> ()
      %1222 = func.call @stack_pop_pointer() : () -> i64
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = func.call @cc_cons(%1222, %1223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1224) : (i64) -> ()
      %1225 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1226 = arith.constant 13 : i64
      %1227 = func.call @cc_make_string(%1225, %1226) : (!llvm.ptr, i64) -> i64
      %1228 = func.call @cc_nil_value() : () -> i64
      %1229 = func.call @cc_intern(%1227, %1228) : (i64, i64) -> i64
      %1230 = func.call @cc_nil_value() : () -> i64
      %1231 = func.call @cc_cons(%1229, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_values_pack(%1231) : (i64) -> i64
      func.call @stack_push_pointer(%1229) : (i64) -> ()
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = func.call @stack_pop_pointer() : () -> i64
      %1235 = func.call @cc_cons(%1233, %1234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1235) : (i64) -> ()
      %1236 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1237 = arith.constant 15 : i64
      %1238 = func.call @cc_make_string(%1236, %1237) : (!llvm.ptr, i64) -> i64
      %1239 = func.call @cc_nil_value() : () -> i64
      %1240 = func.call @cc_intern(%1238, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_nil_value() : () -> i64
      %1242 = func.call @cc_cons(%1240, %1241) : (i64, i64) -> i64
      %1243 = func.call @cc_values_pack(%1242) : (i64) -> i64
      func.call @stack_push_pointer(%1240) : (i64) -> ()
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1245 = func.call @stack_pop_pointer() : () -> i64
      %1246 = func.call @cc_cons(%1244, %1245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1246) : (i64) -> ()
      %1247 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1248 = arith.constant 11 : i64
      %1249 = func.call @cc_make_string(%1247, %1248) : (!llvm.ptr, i64) -> i64
      %1250 = func.call @cc_nil_value() : () -> i64
      %1251 = func.call @cc_intern(%1249, %1250) : (i64, i64) -> i64
      %1252 = func.call @cc_nil_value() : () -> i64
      %1253 = func.call @cc_cons(%1251, %1252) : (i64, i64) -> i64
      %1254 = func.call @cc_values_pack(%1253) : (i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1255 = func.call @stack_pop_pointer() : () -> i64
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      %1258 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1259 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1260 = arith.constant 16 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = func.call @cc_nil_value() : () -> i64
      %1263 = func.call @cc_intern(%1261, %1262) : (i64, i64) -> i64
      %1264 = func.call @cc_nil_value() : () -> i64
      %1265 = func.call @cc_cons(%1263, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_values_pack(%1265) : (i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_cons(%1267, %1268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      %1270 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1271 = arith.constant 8 : i64
      %1272 = func.call @cc_make_string(%1270, %1271) : (!llvm.ptr, i64) -> i64
      %1273 = func.call @cc_nil_value() : () -> i64
      %1274 = func.call @cc_intern(%1272, %1273) : (i64, i64) -> i64
      %1275 = func.call @cc_nil_value() : () -> i64
      %1276 = func.call @cc_cons(%1274, %1275) : (i64, i64) -> i64
      %1277 = func.call @cc_values_pack(%1276) : (i64) -> i64
      func.call @stack_push_pointer(%1274) : (i64) -> ()
      %1278 = func.call @stack_pop_pointer() : () -> i64
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = func.call @cc_cons(%1278, %1279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1280) : (i64) -> ()
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = func.call @stack_pop_pointer() : () -> i64
      %1283 = func.call @cc_cons(%1281, %1282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1283) : (i64) -> ()
      %1284 = func.call @stack_pop_pointer() : () -> i64
      %1285 = func.call @stack_pop_pointer() : () -> i64
      %1286 = func.call @cc_cons(%1284, %1285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1286) : (i64) -> ()
      %1287 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1288 = arith.constant 6 : i64
      %1289 = func.call @cc_make_string(%1287, %1288) : (!llvm.ptr, i64) -> i64
      %1290 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1291 = arith.constant 7 : i64
      %1292 = func.call @cc_make_string(%1290, %1291) : (!llvm.ptr, i64) -> i64
      %1293 = func.call @cc_intern(%1289, %1292) : (i64, i64) -> i64
      %1294 = func.call @cc_nil_value() : () -> i64
      %1295 = func.call @cc_cons(%1293, %1294) : (i64, i64) -> i64
      %1296 = func.call @cc_values_pack(%1295) : (i64) -> i64
      func.call @stack_push_pointer(%1293) : (i64) -> ()
      %1297 = func.call @stack_pop_pointer() : () -> i64
      %1298 = func.call @stack_pop_pointer() : () -> i64
      %1299 = func.call @cc_cons(%1297, %1298) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1299) : (i64) -> ()
      %1300 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1301 = arith.constant 35 : i64
      %1302 = func.call @cc_make_string(%1300, %1301) : (!llvm.ptr, i64) -> i64
      %1303 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1304 = arith.constant 11 : i64
      %1305 = func.call @cc_make_string(%1303, %1304) : (!llvm.ptr, i64) -> i64
      %1306 = func.call @cc_intern(%1302, %1305) : (i64, i64) -> i64
      %1307 = func.call @cc_nil_value() : () -> i64
      %1308 = func.call @cc_cons(%1306, %1307) : (i64, i64) -> i64
      %1309 = func.call @cc_values_pack(%1308) : (i64) -> i64
      func.call @stack_push_pointer(%1306) : (i64) -> ()
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = func.call @stack_pop_pointer() : () -> i64
      %1312 = func.call @cc_cons(%1310, %1311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1312) : (i64) -> ()
      %1313 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1314 = arith.constant 9 : i64
      %1315 = func.call @cc_make_string(%1313, %1314) : (!llvm.ptr, i64) -> i64
      %1316 = func.call @cc_nil_value() : () -> i64
      %1317 = func.call @cc_intern(%1315, %1316) : (i64, i64) -> i64
      %1318 = func.call @cc_nil_value() : () -> i64
      %1319 = func.call @cc_cons(%1317, %1318) : (i64, i64) -> i64
      %1320 = func.call @cc_values_pack(%1319) : (i64) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      %1321 = func.call @stack_pop_pointer() : () -> i64
      %1322 = func.call @stack_pop_pointer() : () -> i64
      %1323 = func.call @cc_cons(%1321, %1322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1323) : (i64) -> ()
      %1324 = func.call @stack_pop_pointer() : () -> i64
      %1325 = func.call @cc_nil_value() : () -> i64
      %1326 = func.call @cc_cons(%1324, %1325) : (i64, i64) -> i64
      %1327 = func.call @cc_eval(%1326) : (i64) -> i64
      %1328 = func.call @cc_multiple_value_list(%1327) : (i64) -> i64
      %1329 = func.call @cc_values_pack(%1328) : (i64) -> i64
      func.call @stack_push_pointer(%1329) : (i64) -> ()
      %1330 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1330 : i64
    }
    %1331 = func.call @cc_nil_value() : () -> i64
    %1332 = func.call @cc_errorp(%980) : (i64) -> i64
    %1333 = arith.cmpi ne, %1332, %1331 : i64
    %1334 = scf.if %1333 -> (i64) {
      scf.yield %980 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1335 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1336 = func.call @stack_pop_pointer() : () -> i64
      %1337 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1338 = arith.constant 9 : i64
      %1339 = func.call @cc_make_string(%1337, %1338) : (!llvm.ptr, i64) -> i64
      %1340 = func.call @cc_nil_value() : () -> i64
      %1341 = func.call @cc_intern(%1339, %1340) : (i64, i64) -> i64
      %1342 = func.call @cc_nil_value() : () -> i64
      %1343 = func.call @cc_cons(%1341, %1342) : (i64, i64) -> i64
      %1344 = func.call @cc_values_pack(%1343) : (i64) -> i64
      %1346 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1347 = arith.constant 15 : i64
      %1348 = func.call @cc_make_string(%1346, %1347) : (!llvm.ptr, i64) -> i64
      %1349 = func.call @cc_nil_value() : () -> i64
      %1350 = func.call @cc_intern(%1348, %1349) : (i64, i64) -> i64
      %1351 = func.call @cc_nil_value() : () -> i64
      %1352 = func.call @cc_cons(%1350, %1351) : (i64, i64) -> i64
      %1353 = func.call @cc_values_pack(%1352) : (i64) -> i64
      %1345 = func.call @cc_defclass_with_metaclass(%1341, %1335, %1336, %1350) : (i64, i64, i64, i64) -> i64
      %1354 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1354) : (i64) -> ()
      %1355 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1355) : (i64) -> ()
      %1356 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1357 = arith.constant 15 : i64
      %1358 = func.call @cc_make_string(%1356, %1357) : (!llvm.ptr, i64) -> i64
      %1359 = func.call @cc_nil_value() : () -> i64
      %1360 = func.call @cc_intern(%1358, %1359) : (i64, i64) -> i64
      %1361 = func.call @cc_nil_value() : () -> i64
      %1362 = func.call @cc_cons(%1360, %1361) : (i64, i64) -> i64
      %1363 = func.call @cc_values_pack(%1362) : (i64) -> i64
      func.call @stack_push_pointer(%1360) : (i64) -> ()
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @stack_pop_pointer() : () -> i64
      %1366 = func.call @cc_cons(%1364, %1365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1366) : (i64) -> ()
      %1367 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1368 = arith.constant 9 : i64
      %1369 = func.call @cc_make_string(%1367, %1368) : (!llvm.ptr, i64) -> i64
      %1370 = llvm.mlir.addressof @str141 : !llvm.ptr
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
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @cc_cons(%1380, %1381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @cc_cons(%1383, %1384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1385) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @cc_cons(%1386, %1387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1389 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1390 = arith.constant 9 : i64
      %1391 = func.call @cc_make_string(%1389, %1390) : (!llvm.ptr, i64) -> i64
      %1392 = func.call @cc_nil_value() : () -> i64
      %1393 = func.call @cc_intern(%1391, %1392) : (i64, i64) -> i64
      %1394 = func.call @cc_nil_value() : () -> i64
      %1395 = func.call @cc_cons(%1393, %1394) : (i64, i64) -> i64
      %1396 = func.call @cc_values_pack(%1395) : (i64) -> i64
      func.call @stack_push_pointer(%1393) : (i64) -> ()
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = func.call @stack_pop_pointer() : () -> i64
      %1399 = func.call @cc_cons(%1397, %1398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1399) : (i64) -> ()
      %1400 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1401 = arith.constant 8 : i64
      %1402 = func.call @cc_make_string(%1400, %1401) : (!llvm.ptr, i64) -> i64
      %1403 = func.call @cc_nil_value() : () -> i64
      %1404 = func.call @cc_intern(%1402, %1403) : (i64, i64) -> i64
      %1405 = func.call @cc_nil_value() : () -> i64
      %1406 = func.call @cc_cons(%1404, %1405) : (i64, i64) -> i64
      %1407 = func.call @cc_values_pack(%1406) : (i64) -> i64
      func.call @stack_push_pointer(%1404) : (i64) -> ()
      %1408 = func.call @stack_pop_pointer() : () -> i64
      %1409 = func.call @stack_pop_pointer() : () -> i64
      %1410 = func.call @cc_cons(%1408, %1409) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1410) : (i64) -> ()
      %1411 = func.call @stack_pop_pointer() : () -> i64
      %1412 = func.call @cc_nil_value() : () -> i64
      %1413 = func.call @cc_cons(%1411, %1412) : (i64, i64) -> i64
      %1414 = func.call @cc_eval(%1413) : (i64) -> i64
      %1415 = func.call @cc_multiple_value_list(%1414) : (i64) -> i64
      %1416 = func.call @cc_values_pack(%1415) : (i64) -> i64
      func.call @stack_push_pointer(%1416) : (i64) -> ()
      %1417 = func.call @stack_depth() : () -> i64
      %1418 = arith.constant 0 : i64
      %1419 = arith.cmpi sgt, %1417, %1418 : i64
      scf.if %1419 {
        %1420 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      %1421 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1421 : i64
    }
    %1422 = func.call @cc_nil_value() : () -> i64
    %1423 = func.call @cc_errorp(%1334) : (i64) -> i64
    %1424 = arith.cmpi ne, %1423, %1422 : i64
    %1425 = scf.if %1424 -> (i64) {
      scf.yield %1334 : i64
    } else {
      %1426 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1427 = arith.constant 11 : i64
      %1428 = func.call @cc_make_string(%1426, %1427) : (!llvm.ptr, i64) -> i64
      %1429 = func.call @cc_nil_value() : () -> i64
      %1430 = func.call @cc_intern(%1428, %1429) : (i64, i64) -> i64
      %1431 = func.call @cc_nil_value() : () -> i64
      %1432 = func.call @cc_cons(%1430, %1431) : (i64, i64) -> i64
      %1433 = func.call @cc_values_pack(%1432) : (i64) -> i64
      %1434 = func.call @cc_nil_value() : () -> i64
      %1435 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1436 = arith.constant 9 : i64
      %1437 = func.call @cc_make_string(%1435, %1436) : (!llvm.ptr, i64) -> i64
      %1438 = func.call @cc_nil_value() : () -> i64
      %1439 = func.call @cc_intern(%1437, %1438) : (i64, i64) -> i64
      %1440 = func.call @cc_nil_value() : () -> i64
      %1441 = func.call @cc_cons(%1439, %1440) : (i64, i64) -> i64
      %1442 = func.call @cc_values_pack(%1441) : (i64) -> i64
      func.call @stack_push_pointer(%1439) : (i64) -> ()
      %1443 = func.call @stack_pop_pointer() : () -> i64
      %1444 = func.call @cc_make_instance(%1443, %1434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1444) : (i64) -> ()
      %1445 = func.call @stack_pop_pointer() : () -> i64
      %1446 = func.call @cc_set_symbol_value(%1430, %1445) : (i64, i64) -> i64
      %1447 = func.call @cc_errorp(%1446) : (i64) -> i64
      %1448 = func.call @cc_nil_value() : () -> i64
      %1449 = arith.cmpi ne, %1447, %1448 : i64
      scf.if %1449 {
        func.call @stack_push_pointer(%1446) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1430) : (i64) -> ()
      }
      %1450 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1450 : i64
    }
    %1451 = func.call @cc_nil_value() : () -> i64
    %1452 = func.call @cc_errorp(%1425) : (i64) -> i64
    %1453 = arith.cmpi ne, %1452, %1451 : i64
    %1454 = scf.if %1453 -> (i64) {
      scf.yield %1425 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1455 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1456 = arith.constant 4 : i64
      %1457 = func.call @cc_make_string(%1455, %1456) : (!llvm.ptr, i64) -> i64
      %1458 = func.call @cc_nil_value() : () -> i64
      %1459 = func.call @cc_intern(%1457, %1458) : (i64, i64) -> i64
      %1460 = func.call @cc_nil_value() : () -> i64
      %1461 = func.call @cc_cons(%1459, %1460) : (i64, i64) -> i64
      %1462 = func.call @cc_values_pack(%1461) : (i64) -> i64
      %1463 = func.call @stack_pop_pointer() : () -> i64
      %1464 = func.call @cc_cons(%1459, %1463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1464) : (i64) -> ()
      %1465 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1466 = func.call @stack_pop_pointer() : () -> i64
      %1467 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1468 = arith.constant 9 : i64
      %1469 = func.call @cc_make_string(%1467, %1468) : (!llvm.ptr, i64) -> i64
      %1470 = func.call @cc_nil_value() : () -> i64
      %1471 = func.call @cc_intern(%1469, %1470) : (i64, i64) -> i64
      %1472 = func.call @cc_nil_value() : () -> i64
      %1473 = func.call @cc_cons(%1471, %1472) : (i64, i64) -> i64
      %1474 = func.call @cc_values_pack(%1473) : (i64) -> i64
      %1476 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1477 = arith.constant 15 : i64
      %1478 = func.call @cc_make_string(%1476, %1477) : (!llvm.ptr, i64) -> i64
      %1479 = func.call @cc_nil_value() : () -> i64
      %1480 = func.call @cc_intern(%1478, %1479) : (i64, i64) -> i64
      %1481 = func.call @cc_nil_value() : () -> i64
      %1482 = func.call @cc_cons(%1480, %1481) : (i64, i64) -> i64
      %1483 = func.call @cc_values_pack(%1482) : (i64) -> i64
      %1475 = func.call @cc_defclass_with_metaclass(%1471, %1465, %1466, %1480) : (i64, i64, i64, i64) -> i64
      %1484 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1484) : (i64) -> ()
      %1485 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1485) : (i64) -> ()
      %1486 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1487 = arith.constant 15 : i64
      %1488 = func.call @cc_make_string(%1486, %1487) : (!llvm.ptr, i64) -> i64
      %1489 = func.call @cc_nil_value() : () -> i64
      %1490 = func.call @cc_intern(%1488, %1489) : (i64, i64) -> i64
      %1491 = func.call @cc_nil_value() : () -> i64
      %1492 = func.call @cc_cons(%1490, %1491) : (i64, i64) -> i64
      %1493 = func.call @cc_values_pack(%1492) : (i64) -> i64
      func.call @stack_push_pointer(%1490) : (i64) -> ()
      %1494 = func.call @stack_pop_pointer() : () -> i64
      %1495 = func.call @stack_pop_pointer() : () -> i64
      %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1496) : (i64) -> ()
      %1497 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1498 = arith.constant 9 : i64
      %1499 = func.call @cc_make_string(%1497, %1498) : (!llvm.ptr, i64) -> i64
      %1500 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1501 = arith.constant 7 : i64
      %1502 = func.call @cc_make_string(%1500, %1501) : (!llvm.ptr, i64) -> i64
      %1503 = func.call @cc_intern(%1499, %1502) : (i64, i64) -> i64
      %1504 = func.call @cc_nil_value() : () -> i64
      %1505 = func.call @cc_cons(%1503, %1504) : (i64, i64) -> i64
      %1506 = func.call @cc_values_pack(%1505) : (i64) -> i64
      func.call @stack_push_pointer(%1503) : (i64) -> ()
      %1507 = func.call @stack_pop_pointer() : () -> i64
      %1508 = func.call @stack_pop_pointer() : () -> i64
      %1509 = func.call @cc_cons(%1507, %1508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1509) : (i64) -> ()
      %1510 = func.call @stack_pop_pointer() : () -> i64
      %1511 = func.call @stack_pop_pointer() : () -> i64
      %1512 = func.call @cc_cons(%1510, %1511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1512) : (i64) -> ()
      %1513 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1513) : (i64) -> ()
      %1514 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1514) : (i64) -> ()
      %1515 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%1515) : (i64) -> ()
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @stack_pop_pointer() : () -> i64
      %1518 = func.call @cc_cons(%1516, %1517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1518) : (i64) -> ()
      %1519 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1520 = arith.constant 8 : i64
      %1521 = func.call @cc_make_string(%1519, %1520) : (!llvm.ptr, i64) -> i64
      %1522 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1523 = arith.constant 7 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = func.call @cc_intern(%1521, %1524) : (i64, i64) -> i64
      %1526 = func.call @cc_nil_value() : () -> i64
      %1527 = func.call @cc_cons(%1525, %1526) : (i64, i64) -> i64
      %1528 = func.call @cc_values_pack(%1527) : (i64) -> i64
      func.call @stack_push_pointer(%1525) : (i64) -> ()
      %1529 = func.call @stack_pop_pointer() : () -> i64
      %1530 = func.call @stack_pop_pointer() : () -> i64
      %1531 = func.call @cc_cons(%1529, %1530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1531) : (i64) -> ()
      %1532 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1533 = arith.constant 4 : i64
      %1534 = func.call @cc_make_string(%1532, %1533) : (!llvm.ptr, i64) -> i64
      %1535 = func.call @cc_nil_value() : () -> i64
      %1536 = func.call @cc_intern(%1534, %1535) : (i64, i64) -> i64
      %1537 = func.call @cc_nil_value() : () -> i64
      %1538 = func.call @cc_cons(%1536, %1537) : (i64, i64) -> i64
      %1539 = func.call @cc_values_pack(%1538) : (i64) -> i64
      func.call @stack_push_pointer(%1536) : (i64) -> ()
      %1540 = func.call @stack_pop_pointer() : () -> i64
      %1541 = func.call @stack_pop_pointer() : () -> i64
      %1542 = func.call @cc_cons(%1540, %1541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1542) : (i64) -> ()
      %1543 = func.call @stack_pop_pointer() : () -> i64
      %1544 = func.call @stack_pop_pointer() : () -> i64
      %1545 = func.call @cc_cons(%1543, %1544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1545) : (i64) -> ()
      %1546 = func.call @stack_pop_pointer() : () -> i64
      %1547 = func.call @stack_pop_pointer() : () -> i64
      %1548 = func.call @cc_cons(%1546, %1547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1549 = func.call @stack_pop_pointer() : () -> i64
      %1550 = func.call @stack_pop_pointer() : () -> i64
      %1551 = func.call @cc_cons(%1549, %1550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1551) : (i64) -> ()
      %1552 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1553 = arith.constant 9 : i64
      %1554 = func.call @cc_make_string(%1552, %1553) : (!llvm.ptr, i64) -> i64
      %1555 = func.call @cc_nil_value() : () -> i64
      %1556 = func.call @cc_intern(%1554, %1555) : (i64, i64) -> i64
      %1557 = func.call @cc_nil_value() : () -> i64
      %1558 = func.call @cc_cons(%1556, %1557) : (i64, i64) -> i64
      %1559 = func.call @cc_values_pack(%1558) : (i64) -> i64
      func.call @stack_push_pointer(%1556) : (i64) -> ()
      %1560 = func.call @stack_pop_pointer() : () -> i64
      %1561 = func.call @stack_pop_pointer() : () -> i64
      %1562 = func.call @cc_cons(%1560, %1561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1562) : (i64) -> ()
      %1563 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1564 = arith.constant 8 : i64
      %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
      %1566 = func.call @cc_nil_value() : () -> i64
      %1567 = func.call @cc_intern(%1565, %1566) : (i64, i64) -> i64
      %1568 = func.call @cc_nil_value() : () -> i64
      %1569 = func.call @cc_cons(%1567, %1568) : (i64, i64) -> i64
      %1570 = func.call @cc_values_pack(%1569) : (i64) -> i64
      func.call @stack_push_pointer(%1567) : (i64) -> ()
      %1571 = func.call @stack_pop_pointer() : () -> i64
      %1572 = func.call @stack_pop_pointer() : () -> i64
      %1573 = func.call @cc_cons(%1571, %1572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1573) : (i64) -> ()
      %1574 = func.call @stack_pop_pointer() : () -> i64
      %1575 = func.call @cc_nil_value() : () -> i64
      %1576 = func.call @cc_cons(%1574, %1575) : (i64, i64) -> i64
      %1577 = func.call @cc_eval(%1576) : (i64) -> i64
      %1578 = func.call @cc_multiple_value_list(%1577) : (i64) -> i64
      %1579 = func.call @cc_values_pack(%1578) : (i64) -> i64
      func.call @stack_push_pointer(%1579) : (i64) -> ()
      %1580 = func.call @stack_depth() : () -> i64
      %1581 = arith.constant 0 : i64
      %1582 = arith.cmpi sgt, %1580, %1581 : i64
      scf.if %1582 {
        %1583 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%1471) : (i64) -> ()
      %1584 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1584 : i64
    }
    %1585 = func.call @cc_nil_value() : () -> i64
    %1586 = func.call @cc_errorp(%1454) : (i64) -> i64
    %1587 = arith.cmpi ne, %1586, %1585 : i64
    %1588 = scf.if %1587 -> (i64) {
      scf.yield %1454 : i64
    } else {
      %1589 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1590 = arith.constant 13 : i64
      %1591 = func.call @cc_make_string(%1589, %1590) : (!llvm.ptr, i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = func.call @cc_intern(%1591, %1592) : (i64, i64) -> i64
      %1594 = func.call @cc_nil_value() : () -> i64
      %1595 = func.call @cc_cons(%1593, %1594) : (i64, i64) -> i64
      %1596 = func.call @cc_values_pack(%1595) : (i64) -> i64
      func.call @stack_push_pointer(%1593) : (i64) -> ()
      %1597 = func.call @stack_pop_pointer() : () -> i64
      %1598 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1599 = arith.constant 13 : i64
      %1600 = func.call @cc_make_string(%1598, %1599) : (!llvm.ptr, i64) -> i64
      %1601 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1602 = arith.constant 11 : i64
      %1603 = func.call @cc_make_string(%1601, %1602) : (!llvm.ptr, i64) -> i64
      %1604 = func.call @cc_intern(%1600, %1603) : (i64, i64) -> i64
      %1605 = func.call @cc_nil_value() : () -> i64
      %1606 = func.call @cc_cons(%1604, %1605) : (i64, i64) -> i64
      %1607 = func.call @cc_values_pack(%1606) : (i64) -> i64
      func.call @stack_push_pointer(%1604) : (i64) -> ()
      %1608 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1609 = arith.constant 6 : i64
      %1610 = func.call @cc_make_string(%1608, %1609) : (!llvm.ptr, i64) -> i64
      %1611 = func.call @cc_nil_value() : () -> i64
      %1612 = func.call @cc_intern(%1610, %1611) : (i64, i64) -> i64
      %1613 = func.call @cc_nil_value() : () -> i64
      %1614 = func.call @cc_cons(%1612, %1613) : (i64, i64) -> i64
      %1615 = func.call @cc_values_pack(%1614) : (i64) -> i64
      func.call @stack_push_pointer(%1612) : (i64) -> ()
      %1616 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1617 = arith.constant 19 : i64
      %1618 = func.call @cc_make_string(%1616, %1617) : (!llvm.ptr, i64) -> i64
      %1619 = func.call @cc_nil_value() : () -> i64
      %1620 = func.call @cc_intern(%1618, %1619) : (i64, i64) -> i64
      %1621 = func.call @cc_nil_value() : () -> i64
      %1622 = func.call @cc_cons(%1620, %1621) : (i64, i64) -> i64
      %1623 = func.call @cc_values_pack(%1622) : (i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      %1624 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1625 = arith.constant 10 : i64
      %1626 = func.call @cc_make_string(%1624, %1625) : (!llvm.ptr, i64) -> i64
      %1627 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1628 = arith.constant 11 : i64
      %1629 = func.call @cc_make_string(%1627, %1628) : (!llvm.ptr, i64) -> i64
      %1630 = func.call @cc_intern(%1626, %1629) : (i64, i64) -> i64
      %1631 = func.call @cc_nil_value() : () -> i64
      %1632 = func.call @cc_cons(%1630, %1631) : (i64, i64) -> i64
      %1633 = func.call @cc_values_pack(%1632) : (i64) -> i64
      func.call @stack_push_pointer(%1630) : (i64) -> ()
      %1634 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1635 = arith.constant 11 : i64
      %1636 = func.call @cc_make_string(%1634, %1635) : (!llvm.ptr, i64) -> i64
      %1637 = func.call @cc_nil_value() : () -> i64
      %1638 = func.call @cc_intern(%1636, %1637) : (i64, i64) -> i64
      %1639 = func.call @cc_nil_value() : () -> i64
      %1640 = func.call @cc_cons(%1638, %1639) : (i64, i64) -> i64
      %1641 = func.call @cc_values_pack(%1640) : (i64) -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      %1642 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1642) : (i64) -> ()
      %1643 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1644 = arith.constant 4 : i64
      %1645 = func.call @cc_make_string(%1643, %1644) : (!llvm.ptr, i64) -> i64
      %1646 = func.call @cc_nil_value() : () -> i64
      %1647 = func.call @cc_intern(%1645, %1646) : (i64, i64) -> i64
      %1648 = func.call @cc_nil_value() : () -> i64
      %1649 = func.call @cc_cons(%1647, %1648) : (i64, i64) -> i64
      %1650 = func.call @cc_values_pack(%1649) : (i64) -> i64
      func.call @stack_push_pointer(%1647) : (i64) -> ()
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @cc_cons(%1651, %1652) : (i64, i64) -> i64
      %1654 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1655 = arith.constant 5 : i64
      %1656 = func.call @cc_make_string(%1654, %1655) : (!llvm.ptr, i64) -> i64
      %1657 = func.call @cc_nil_value() : () -> i64
      %1658 = func.call @cc_intern(%1656, %1657) : (i64, i64) -> i64
      %1659 = func.call @cc_nil_value() : () -> i64
      %1660 = func.call @cc_cons(%1658, %1659) : (i64, i64) -> i64
      %1661 = func.call @cc_values_pack(%1660) : (i64) -> i64
      %1662 = func.call @cc_cons(%1658, %1653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @stack_pop_pointer() : () -> i64
      %1665 = func.call @cc_cons(%1664, %1663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1665) : (i64) -> ()
      %1666 = func.call @stack_pop_pointer() : () -> i64
      %1667 = func.call @stack_pop_pointer() : () -> i64
      %1668 = func.call @cc_cons(%1667, %1666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1668) : (i64) -> ()
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = func.call @stack_pop_pointer() : () -> i64
      %1671 = func.call @cc_cons(%1670, %1669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1671) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1672 = func.call @stack_pop_pointer() : () -> i64
      %1673 = func.call @stack_pop_pointer() : () -> i64
      %1674 = func.call @cc_cons(%1673, %1672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1674) : (i64) -> ()
      %1675 = func.call @stack_pop_pointer() : () -> i64
      %1676 = func.call @stack_pop_pointer() : () -> i64
      %1677 = func.call @cc_cons(%1676, %1675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1677) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @stack_pop_pointer() : () -> i64
      %1680 = func.call @cc_cons(%1679, %1678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1680) : (i64) -> ()
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @cc_cons(%1682, %1681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1683) : (i64) -> ()
      %1684 = func.call @stack_pop_pointer() : () -> i64
      %1685 = func.call @stack_pop_pointer() : () -> i64
      %1686 = func.call @cc_cons(%1685, %1684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1686) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @stack_pop_pointer() : () -> i64
      %1689 = func.call @cc_cons(%1688, %1687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1689) : (i64) -> ()
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = func.call @cc_cons(%1691, %1690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1692) : (i64) -> ()
      %1693 = func.call @stack_pop_pointer() : () -> i64
      %1771 = arith.constant 47863920852996 : i64
      %1772 = arith.constant 0 : i64
      %1773 = func.call @cc_make_closure(%1771, %1772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1773) : (i64) -> ()
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1776 = arith.constant 4 : i64
      %1777 = func.call @cc_make_string(%1775, %1776) : (!llvm.ptr, i64) -> i64
      %1778 = func.call @cc_nil_value() : () -> i64
      %1779 = func.call @cc_intern(%1777, %1778) : (i64, i64) -> i64
      %1780 = func.call @cc_nil_value() : () -> i64
      %1781 = func.call @cc_cons(%1779, %1780) : (i64, i64) -> i64
      %1782 = func.call @cc_values_pack(%1781) : (i64) -> i64
      func.call @stack_push_pointer(%1779) : (i64) -> ()
      %1783 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1784 = arith.constant 13 : i64
      %1785 = func.call @cc_make_string(%1783, %1784) : (!llvm.ptr, i64) -> i64
      %1786 = func.call @cc_nil_value() : () -> i64
      %1787 = func.call @cc_intern(%1785, %1786) : (i64, i64) -> i64
      %1788 = func.call @cc_nil_value() : () -> i64
      %1789 = func.call @cc_cons(%1787, %1788) : (i64, i64) -> i64
      %1790 = func.call @cc_values_pack(%1789) : (i64) -> i64
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1791 = func.call @stack_pop_pointer() : () -> i64
      %1792 = func.call @stack_pop_pointer() : () -> i64
      %1793 = func.call @cc_cons(%1792, %1791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1793) : (i64) -> ()
      %1794 = func.call @stack_pop_pointer() : () -> i64
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @cc_cons(%1795, %1794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1796) : (i64) -> ()
      %1797 = func.call @stack_pop_pointer() : () -> i64
      %1798 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1799 = arith.constant 11 : i64
      %1800 = func.call @cc_make_string(%1798, %1799) : (!llvm.ptr, i64) -> i64
      %1801 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1802 = arith.constant 7 : i64
      %1803 = func.call @cc_make_string(%1801, %1802) : (!llvm.ptr, i64) -> i64
      %1804 = func.call @cc_intern(%1800, %1803) : (i64, i64) -> i64
      %1805 = func.call @cc_nil_value() : () -> i64
      %1806 = func.call @cc_cons(%1804, %1805) : (i64, i64) -> i64
      %1807 = func.call @cc_values_pack(%1806) : (i64) -> i64
      func.call @stack_push_pointer(%1804) : (i64) -> ()
      %1808 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1809 = func.call @stack_pop_pointer() : () -> i64
      %1810 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1811 = arith.constant 4 : i64
      %1812 = func.call @cc_make_string(%1810, %1811) : (!llvm.ptr, i64) -> i64
      %1813 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1814 = arith.constant 7 : i64
      %1815 = func.call @cc_make_string(%1813, %1814) : (!llvm.ptr, i64) -> i64
      %1816 = func.call @cc_intern(%1812, %1815) : (i64, i64) -> i64
      %1817 = func.call @cc_nil_value() : () -> i64
      %1818 = func.call @cc_cons(%1816, %1817) : (i64, i64) -> i64
      %1819 = func.call @cc_values_pack(%1818) : (i64) -> i64
      func.call @stack_push_pointer(%1816) : (i64) -> ()
      %1820 = func.call @stack_pop_pointer() : () -> i64
      %1821 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1822 = arith.constant 5 : i64
      %1823 = func.call @cc_make_string(%1821, %1822) : (!llvm.ptr, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_intern(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_nil_value() : () -> i64
      %1827 = func.call @cc_cons(%1825, %1826) : (i64, i64) -> i64
      %1828 = func.call @cc_values_pack(%1827) : (i64) -> i64
      func.call @stack_push_pointer(%1825) : (i64) -> ()
      %1829 = func.call @stack_pop_pointer() : () -> i64
      %1830 = func.call @cc_nil_value() : () -> i64
      %1831 = func.call @cc_errorp(%1597) : (i64) -> i64
      %1832 = arith.cmpi ne, %1831, %1830 : i64
      %1833 = arith.cmpi eq, %1830, %1830 : i64
      %1834 = arith.andi %1832, %1833 : i1
      %1835 = scf.if %1834 -> (i64) {
        scf.yield %1597 : i64
      } else {
        scf.yield %1830 : i64
      }
      %1836 = func.call @cc_errorp(%1693) : (i64) -> i64
      %1837 = arith.cmpi ne, %1836, %1830 : i64
      %1838 = arith.cmpi eq, %1835, %1830 : i64
      %1839 = arith.andi %1837, %1838 : i1
      %1840 = scf.if %1839 -> (i64) {
        scf.yield %1693 : i64
      } else {
        scf.yield %1835 : i64
      }
      %1841 = func.call @cc_errorp(%1774) : (i64) -> i64
      %1842 = arith.cmpi ne, %1841, %1830 : i64
      %1843 = arith.cmpi eq, %1840, %1830 : i64
      %1844 = arith.andi %1842, %1843 : i1
      %1845 = scf.if %1844 -> (i64) {
        scf.yield %1774 : i64
      } else {
        scf.yield %1840 : i64
      }
      %1846 = func.call @cc_errorp(%1797) : (i64) -> i64
      %1847 = arith.cmpi ne, %1846, %1830 : i64
      %1848 = arith.cmpi eq, %1845, %1830 : i64
      %1849 = arith.andi %1847, %1848 : i1
      %1850 = scf.if %1849 -> (i64) {
        scf.yield %1797 : i64
      } else {
        scf.yield %1845 : i64
      }
      %1851 = func.call @cc_errorp(%1808) : (i64) -> i64
      %1852 = arith.cmpi ne, %1851, %1830 : i64
      %1853 = arith.cmpi eq, %1850, %1830 : i64
      %1854 = arith.andi %1852, %1853 : i1
      %1855 = scf.if %1854 -> (i64) {
        scf.yield %1808 : i64
      } else {
        scf.yield %1850 : i64
      }
      %1856 = func.call @cc_errorp(%1809) : (i64) -> i64
      %1857 = arith.cmpi ne, %1856, %1830 : i64
      %1858 = arith.cmpi eq, %1855, %1830 : i64
      %1859 = arith.andi %1857, %1858 : i1
      %1860 = scf.if %1859 -> (i64) {
        scf.yield %1809 : i64
      } else {
        scf.yield %1855 : i64
      }
      %1861 = func.call @cc_errorp(%1820) : (i64) -> i64
      %1862 = arith.cmpi ne, %1861, %1830 : i64
      %1863 = arith.cmpi eq, %1860, %1830 : i64
      %1864 = arith.andi %1862, %1863 : i1
      %1865 = scf.if %1864 -> (i64) {
        scf.yield %1820 : i64
      } else {
        scf.yield %1860 : i64
      }
      %1866 = func.call @cc_errorp(%1829) : (i64) -> i64
      %1867 = arith.cmpi ne, %1866, %1830 : i64
      %1868 = arith.cmpi eq, %1865, %1830 : i64
      %1869 = arith.andi %1867, %1868 : i1
      %1870 = scf.if %1869 -> (i64) {
        scf.yield %1829 : i64
      } else {
        scf.yield %1865 : i64
      }
      %1871 = arith.cmpi ne, %1870, %1830 : i64
      scf.if %1871 {
        func.call @stack_push_pointer(%1870) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1597) : (i64) -> ()
        func.call @stack_push_pointer(%1693) : (i64) -> ()
        func.call @stack_push_pointer(%1774) : (i64) -> ()
        func.call @stack_push_pointer(%1797) : (i64) -> ()
        func.call @stack_push_pointer(%1808) : (i64) -> ()
        func.call @stack_push_pointer(%1809) : (i64) -> ()
        func.call @stack_push_pointer(%1820) : (i64) -> ()
        func.call @stack_push_pointer(%1829) : (i64) -> ()
        %1872 = llvm.mlir.addressof @str177 : !llvm.ptr
        %1873 = func.call @cc_make_function_ref_const(%1872) : (!llvm.ptr) -> i64
        %1874 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1873, %1874) : (i64, i64) -> ()
      }
      %1875 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1875 : i64
    }
    %1876 = func.call @cc_nil_value() : () -> i64
    %1877 = func.call @cc_errorp(%1588) : (i64) -> i64
    %1878 = arith.cmpi ne, %1877, %1876 : i64
    %1879 = scf.if %1878 -> (i64) {
      scf.yield %1588 : i64
    } else {
      %1880 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1881 = arith.constant 13 : i64
      %1882 = func.call @cc_make_string(%1880, %1881) : (!llvm.ptr, i64) -> i64
      %1883 = func.call @cc_nil_value() : () -> i64
      %1884 = func.call @cc_intern(%1882, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_nil_value() : () -> i64
      %1886 = func.call @cc_cons(%1884, %1885) : (i64, i64) -> i64
      %1887 = func.call @cc_values_pack(%1886) : (i64) -> i64
      func.call @stack_push_pointer(%1884) : (i64) -> ()
      %1888 = func.call @stack_pop_pointer() : () -> i64
      %1889 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1890 = arith.constant 13 : i64
      %1891 = func.call @cc_make_string(%1889, %1890) : (!llvm.ptr, i64) -> i64
      %1892 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1893 = arith.constant 11 : i64
      %1894 = func.call @cc_make_string(%1892, %1893) : (!llvm.ptr, i64) -> i64
      %1895 = func.call @cc_intern(%1891, %1894) : (i64, i64) -> i64
      %1896 = func.call @cc_nil_value() : () -> i64
      %1897 = func.call @cc_cons(%1895, %1896) : (i64, i64) -> i64
      %1898 = func.call @cc_values_pack(%1897) : (i64) -> i64
      func.call @stack_push_pointer(%1895) : (i64) -> ()
      %1899 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1900 = arith.constant 6 : i64
      %1901 = func.call @cc_make_string(%1899, %1900) : (!llvm.ptr, i64) -> i64
      %1902 = func.call @cc_nil_value() : () -> i64
      %1903 = func.call @cc_intern(%1901, %1902) : (i64, i64) -> i64
      %1904 = func.call @cc_nil_value() : () -> i64
      %1905 = func.call @cc_cons(%1903, %1904) : (i64, i64) -> i64
      %1906 = func.call @cc_values_pack(%1905) : (i64) -> i64
      func.call @stack_push_pointer(%1903) : (i64) -> ()
      %1907 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1908 = arith.constant 19 : i64
      %1909 = func.call @cc_make_string(%1907, %1908) : (!llvm.ptr, i64) -> i64
      %1910 = func.call @cc_nil_value() : () -> i64
      %1911 = func.call @cc_intern(%1909, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_nil_value() : () -> i64
      %1913 = func.call @cc_cons(%1911, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_values_pack(%1913) : (i64) -> i64
      func.call @stack_push_pointer(%1911) : (i64) -> ()
      %1915 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1916 = arith.constant 10 : i64
      %1917 = func.call @cc_make_string(%1915, %1916) : (!llvm.ptr, i64) -> i64
      %1918 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1919 = arith.constant 11 : i64
      %1920 = func.call @cc_make_string(%1918, %1919) : (!llvm.ptr, i64) -> i64
      %1921 = func.call @cc_intern(%1917, %1920) : (i64, i64) -> i64
      %1922 = func.call @cc_nil_value() : () -> i64
      %1923 = func.call @cc_cons(%1921, %1922) : (i64, i64) -> i64
      %1924 = func.call @cc_values_pack(%1923) : (i64) -> i64
      func.call @stack_push_pointer(%1921) : (i64) -> ()
      %1925 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1926 = arith.constant 11 : i64
      %1927 = func.call @cc_make_string(%1925, %1926) : (!llvm.ptr, i64) -> i64
      %1928 = func.call @cc_nil_value() : () -> i64
      %1929 = func.call @cc_intern(%1927, %1928) : (i64, i64) -> i64
      %1930 = func.call @cc_nil_value() : () -> i64
      %1931 = func.call @cc_cons(%1929, %1930) : (i64, i64) -> i64
      %1932 = func.call @cc_values_pack(%1931) : (i64) -> i64
      func.call @stack_push_pointer(%1929) : (i64) -> ()
      %1933 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1933) : (i64) -> ()
      %1934 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1935 = arith.constant 4 : i64
      %1936 = func.call @cc_make_string(%1934, %1935) : (!llvm.ptr, i64) -> i64
      %1937 = func.call @cc_nil_value() : () -> i64
      %1938 = func.call @cc_intern(%1936, %1937) : (i64, i64) -> i64
      %1939 = func.call @cc_nil_value() : () -> i64
      %1940 = func.call @cc_cons(%1938, %1939) : (i64, i64) -> i64
      %1941 = func.call @cc_values_pack(%1940) : (i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1942, %1943) : (i64, i64) -> i64
      %1945 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1946 = arith.constant 5 : i64
      %1947 = func.call @cc_make_string(%1945, %1946) : (!llvm.ptr, i64) -> i64
      %1948 = func.call @cc_nil_value() : () -> i64
      %1949 = func.call @cc_intern(%1947, %1948) : (i64, i64) -> i64
      %1950 = func.call @cc_nil_value() : () -> i64
      %1951 = func.call @cc_cons(%1949, %1950) : (i64, i64) -> i64
      %1952 = func.call @cc_values_pack(%1951) : (i64) -> i64
      %1953 = func.call @cc_cons(%1949, %1944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @stack_pop_pointer() : () -> i64
      %1956 = func.call @cc_cons(%1955, %1954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1956) : (i64) -> ()
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @stack_pop_pointer() : () -> i64
      %1959 = func.call @cc_cons(%1958, %1957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1959) : (i64) -> ()
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @stack_pop_pointer() : () -> i64
      %1962 = func.call @cc_cons(%1961, %1960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1962) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @stack_pop_pointer() : () -> i64
      %1965 = func.call @cc_cons(%1964, %1963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1965) : (i64) -> ()
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @stack_pop_pointer() : () -> i64
      %1968 = func.call @cc_cons(%1967, %1966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1968) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1969 = func.call @stack_pop_pointer() : () -> i64
      %1970 = func.call @stack_pop_pointer() : () -> i64
      %1971 = func.call @cc_cons(%1970, %1969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1971) : (i64) -> ()
      %1972 = func.call @stack_pop_pointer() : () -> i64
      %1973 = func.call @stack_pop_pointer() : () -> i64
      %1974 = func.call @cc_cons(%1973, %1972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1974) : (i64) -> ()
      %1975 = func.call @stack_pop_pointer() : () -> i64
      %1976 = func.call @stack_pop_pointer() : () -> i64
      %1977 = func.call @cc_cons(%1976, %1975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1977) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1978 = func.call @stack_pop_pointer() : () -> i64
      %1979 = func.call @stack_pop_pointer() : () -> i64
      %1980 = func.call @cc_cons(%1979, %1978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1980) : (i64) -> ()
      %1981 = func.call @stack_pop_pointer() : () -> i64
      %1982 = func.call @stack_pop_pointer() : () -> i64
      %1983 = func.call @cc_cons(%1982, %1981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1983) : (i64) -> ()
      %1984 = func.call @stack_pop_pointer() : () -> i64
      %2062 = arith.constant 47863920852997 : i64
      %2063 = arith.constant 0 : i64
      %2064 = func.call @cc_make_closure(%2062, %2063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2064) : (i64) -> ()
      %2065 = func.call @stack_pop_pointer() : () -> i64
      %2066 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2067 = arith.constant 4 : i64
      %2068 = func.call @cc_make_string(%2066, %2067) : (!llvm.ptr, i64) -> i64
      %2069 = func.call @cc_nil_value() : () -> i64
      %2070 = func.call @cc_intern(%2068, %2069) : (i64, i64) -> i64
      %2071 = func.call @cc_nil_value() : () -> i64
      %2072 = func.call @cc_cons(%2070, %2071) : (i64, i64) -> i64
      %2073 = func.call @cc_values_pack(%2072) : (i64) -> i64
      func.call @stack_push_pointer(%2070) : (i64) -> ()
      %2074 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2075 = arith.constant 13 : i64
      %2076 = func.call @cc_make_string(%2074, %2075) : (!llvm.ptr, i64) -> i64
      %2077 = func.call @cc_nil_value() : () -> i64
      %2078 = func.call @cc_intern(%2076, %2077) : (i64, i64) -> i64
      %2079 = func.call @cc_nil_value() : () -> i64
      %2080 = func.call @cc_cons(%2078, %2079) : (i64, i64) -> i64
      %2081 = func.call @cc_values_pack(%2080) : (i64) -> i64
      func.call @stack_push_pointer(%2078) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2082 = func.call @stack_pop_pointer() : () -> i64
      %2083 = func.call @stack_pop_pointer() : () -> i64
      %2084 = func.call @cc_cons(%2083, %2082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2084) : (i64) -> ()
      %2085 = func.call @stack_pop_pointer() : () -> i64
      %2086 = func.call @stack_pop_pointer() : () -> i64
      %2087 = func.call @cc_cons(%2086, %2085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2087) : (i64) -> ()
      %2088 = func.call @stack_pop_pointer() : () -> i64
      %2089 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2090 = arith.constant 11 : i64
      %2091 = func.call @cc_make_string(%2089, %2090) : (!llvm.ptr, i64) -> i64
      %2092 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2093 = arith.constant 7 : i64
      %2094 = func.call @cc_make_string(%2092, %2093) : (!llvm.ptr, i64) -> i64
      %2095 = func.call @cc_intern(%2091, %2094) : (i64, i64) -> i64
      %2096 = func.call @cc_nil_value() : () -> i64
      %2097 = func.call @cc_cons(%2095, %2096) : (i64, i64) -> i64
      %2098 = func.call @cc_values_pack(%2097) : (i64) -> i64
      func.call @stack_push_pointer(%2095) : (i64) -> ()
      %2099 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2100 = func.call @stack_pop_pointer() : () -> i64
      %2101 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2102 = arith.constant 4 : i64
      %2103 = func.call @cc_make_string(%2101, %2102) : (!llvm.ptr, i64) -> i64
      %2104 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2105 = arith.constant 7 : i64
      %2106 = func.call @cc_make_string(%2104, %2105) : (!llvm.ptr, i64) -> i64
      %2107 = func.call @cc_intern(%2103, %2106) : (i64, i64) -> i64
      %2108 = func.call @cc_nil_value() : () -> i64
      %2109 = func.call @cc_cons(%2107, %2108) : (i64, i64) -> i64
      %2110 = func.call @cc_values_pack(%2109) : (i64) -> i64
      func.call @stack_push_pointer(%2107) : (i64) -> ()
      %2111 = func.call @stack_pop_pointer() : () -> i64
      %2112 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2113 = arith.constant 5 : i64
      %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
      %2115 = func.call @cc_nil_value() : () -> i64
      %2116 = func.call @cc_intern(%2114, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_nil_value() : () -> i64
      %2118 = func.call @cc_cons(%2116, %2117) : (i64, i64) -> i64
      %2119 = func.call @cc_values_pack(%2118) : (i64) -> i64
      func.call @stack_push_pointer(%2116) : (i64) -> ()
      %2120 = func.call @stack_pop_pointer() : () -> i64
      %2121 = func.call @cc_nil_value() : () -> i64
      %2122 = func.call @cc_errorp(%1888) : (i64) -> i64
      %2123 = arith.cmpi ne, %2122, %2121 : i64
      %2124 = arith.cmpi eq, %2121, %2121 : i64
      %2125 = arith.andi %2123, %2124 : i1
      %2126 = scf.if %2125 -> (i64) {
        scf.yield %1888 : i64
      } else {
        scf.yield %2121 : i64
      }
      %2127 = func.call @cc_errorp(%1984) : (i64) -> i64
      %2128 = arith.cmpi ne, %2127, %2121 : i64
      %2129 = arith.cmpi eq, %2126, %2121 : i64
      %2130 = arith.andi %2128, %2129 : i1
      %2131 = scf.if %2130 -> (i64) {
        scf.yield %1984 : i64
      } else {
        scf.yield %2126 : i64
      }
      %2132 = func.call @cc_errorp(%2065) : (i64) -> i64
      %2133 = arith.cmpi ne, %2132, %2121 : i64
      %2134 = arith.cmpi eq, %2131, %2121 : i64
      %2135 = arith.andi %2133, %2134 : i1
      %2136 = scf.if %2135 -> (i64) {
        scf.yield %2065 : i64
      } else {
        scf.yield %2131 : i64
      }
      %2137 = func.call @cc_errorp(%2088) : (i64) -> i64
      %2138 = arith.cmpi ne, %2137, %2121 : i64
      %2139 = arith.cmpi eq, %2136, %2121 : i64
      %2140 = arith.andi %2138, %2139 : i1
      %2141 = scf.if %2140 -> (i64) {
        scf.yield %2088 : i64
      } else {
        scf.yield %2136 : i64
      }
      %2142 = func.call @cc_errorp(%2099) : (i64) -> i64
      %2143 = arith.cmpi ne, %2142, %2121 : i64
      %2144 = arith.cmpi eq, %2141, %2121 : i64
      %2145 = arith.andi %2143, %2144 : i1
      %2146 = scf.if %2145 -> (i64) {
        scf.yield %2099 : i64
      } else {
        scf.yield %2141 : i64
      }
      %2147 = func.call @cc_errorp(%2100) : (i64) -> i64
      %2148 = arith.cmpi ne, %2147, %2121 : i64
      %2149 = arith.cmpi eq, %2146, %2121 : i64
      %2150 = arith.andi %2148, %2149 : i1
      %2151 = scf.if %2150 -> (i64) {
        scf.yield %2100 : i64
      } else {
        scf.yield %2146 : i64
      }
      %2152 = func.call @cc_errorp(%2111) : (i64) -> i64
      %2153 = arith.cmpi ne, %2152, %2121 : i64
      %2154 = arith.cmpi eq, %2151, %2121 : i64
      %2155 = arith.andi %2153, %2154 : i1
      %2156 = scf.if %2155 -> (i64) {
        scf.yield %2111 : i64
      } else {
        scf.yield %2151 : i64
      }
      %2157 = func.call @cc_errorp(%2120) : (i64) -> i64
      %2158 = arith.cmpi ne, %2157, %2121 : i64
      %2159 = arith.cmpi eq, %2156, %2121 : i64
      %2160 = arith.andi %2158, %2159 : i1
      %2161 = scf.if %2160 -> (i64) {
        scf.yield %2120 : i64
      } else {
        scf.yield %2156 : i64
      }
      %2162 = arith.cmpi ne, %2161, %2121 : i64
      scf.if %2162 {
        func.call @stack_push_pointer(%2161) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1888) : (i64) -> ()
        func.call @stack_push_pointer(%1984) : (i64) -> ()
        func.call @stack_push_pointer(%2065) : (i64) -> ()
        func.call @stack_push_pointer(%2088) : (i64) -> ()
        func.call @stack_push_pointer(%2099) : (i64) -> ()
        func.call @stack_push_pointer(%2100) : (i64) -> ()
        func.call @stack_push_pointer(%2111) : (i64) -> ()
        func.call @stack_push_pointer(%2120) : (i64) -> ()
        %2163 = llvm.mlir.addressof @str198 : !llvm.ptr
        %2164 = func.call @cc_make_function_ref_const(%2163) : (!llvm.ptr) -> i64
        %2165 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2164, %2165) : (i64, i64) -> ()
      }
      %2166 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2166 : i64
    }
    %2167 = func.call @cc_nil_value() : () -> i64
    %2168 = func.call @cc_errorp(%1879) : (i64) -> i64
    %2169 = arith.cmpi ne, %2168, %2167 : i64
    %2170 = scf.if %2169 -> (i64) {
      scf.yield %1879 : i64
    } else {
      %2176 = llvm.mlir.addressof @method_name_47863920852998 : !llvm.ptr
      %2177 = func.call @cc_make_lambda_ref_str(%2176) : (!llvm.ptr) -> i64
      %2178 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2179 = arith.constant 35 : i64
      %2180 = func.call @cc_make_string(%2178, %2179) : (!llvm.ptr, i64) -> i64
      %2181 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2182 = arith.constant 11 : i64
      %2183 = func.call @cc_make_string(%2181, %2182) : (!llvm.ptr, i64) -> i64
      %2184 = func.call @cc_intern(%2180, %2183) : (i64, i64) -> i64
      %2185 = func.call @cc_nil_value() : () -> i64
      %2186 = func.call @cc_cons(%2184, %2185) : (i64, i64) -> i64
      %2187 = func.call @cc_values_pack(%2186) : (i64) -> i64
      %2188 = func.call @cc_nil() : () -> i64
      %2189 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2190 = arith.constant 1 : i64
      %2191 = func.call @cc_make_string(%2189, %2190) : (!llvm.ptr, i64) -> i64
      %2192 = func.call @cc_nil_value() : () -> i64
      %2193 = func.call @cc_intern(%2191, %2192) : (i64, i64) -> i64
      %2194 = func.call @cc_nil_value() : () -> i64
      %2195 = func.call @cc_cons(%2193, %2194) : (i64, i64) -> i64
      %2196 = func.call @cc_values_pack(%2195) : (i64) -> i64
      %2197 = func.call @cc_cons(%2193, %2188) : (i64, i64) -> i64
      %2198 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2199 = arith.constant 1 : i64
      %2200 = func.call @cc_make_string(%2198, %2199) : (!llvm.ptr, i64) -> i64
      %2201 = func.call @cc_nil_value() : () -> i64
      %2202 = func.call @cc_intern(%2200, %2201) : (i64, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_cons(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_values_pack(%2204) : (i64) -> i64
      %2206 = func.call @cc_cons(%2202, %2197) : (i64, i64) -> i64
      %2207 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2208 = arith.constant 1 : i64
      %2209 = func.call @cc_make_string(%2207, %2208) : (!llvm.ptr, i64) -> i64
      %2210 = func.call @cc_nil_value() : () -> i64
      %2211 = func.call @cc_intern(%2209, %2210) : (i64, i64) -> i64
      %2212 = func.call @cc_nil_value() : () -> i64
      %2213 = func.call @cc_cons(%2211, %2212) : (i64, i64) -> i64
      %2214 = func.call @cc_values_pack(%2213) : (i64) -> i64
      %2215 = func.call @cc_cons(%2211, %2206) : (i64, i64) -> i64
      %2216 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2217 = arith.constant 1 : i64
      %2218 = func.call @cc_make_string(%2216, %2217) : (!llvm.ptr, i64) -> i64
      %2219 = func.call @cc_nil_value() : () -> i64
      %2220 = func.call @cc_intern(%2218, %2219) : (i64, i64) -> i64
      %2221 = func.call @cc_nil_value() : () -> i64
      %2222 = func.call @cc_cons(%2220, %2221) : (i64, i64) -> i64
      %2223 = func.call @cc_values_pack(%2222) : (i64) -> i64
      %2224 = func.call @cc_cons(%2220, %2215) : (i64, i64) -> i64
      %2225 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2226 = arith.constant 1 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = func.call @cc_nil_value() : () -> i64
      %2229 = func.call @cc_intern(%2227, %2228) : (i64, i64) -> i64
      %2230 = func.call @cc_nil_value() : () -> i64
      %2231 = func.call @cc_cons(%2229, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_values_pack(%2231) : (i64) -> i64
      %2233 = func.call @cc_cons(%2229, %2224) : (i64, i64) -> i64
      %2234 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2235 = arith.constant 16 : i64
      %2236 = func.call @cc_make_string(%2234, %2235) : (!llvm.ptr, i64) -> i64
      %2237 = func.call @cc_nil_value() : () -> i64
      %2238 = func.call @cc_intern(%2236, %2237) : (i64, i64) -> i64
      %2239 = func.call @cc_nil_value() : () -> i64
      %2240 = func.call @cc_cons(%2238, %2239) : (i64, i64) -> i64
      %2241 = func.call @cc_values_pack(%2240) : (i64) -> i64
      %2242 = func.call @cc_cons(%2238, %2233) : (i64, i64) -> i64
      %2243 = arith.constant 6 : i64
      %2244 = func.call @cc_box_fixnum(%2243) : (i64) -> i64
      %2245 = arith.constant 1 : i64
      %2246 = func.call @cc_defmethod_qualified(%2184, %2242, %2177, %2244, %2245) : (i64, i64, i64, i64, i64) -> i64
      %2247 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2247) : (i64) -> ()
      %2248 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2248) : (i64) -> ()
      %2249 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2249) : (i64) -> ()
      %2250 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2251 = arith.constant 8 : i64
      %2252 = func.call @cc_make_string(%2250, %2251) : (!llvm.ptr, i64) -> i64
      %2253 = func.call @cc_nil_value() : () -> i64
      %2254 = func.call @cc_intern(%2252, %2253) : (i64, i64) -> i64
      %2255 = func.call @cc_nil_value() : () -> i64
      %2256 = func.call @cc_cons(%2254, %2255) : (i64, i64) -> i64
      %2257 = func.call @cc_values_pack(%2256) : (i64) -> i64
      func.call @stack_push_pointer(%2254) : (i64) -> ()
      %2258 = func.call @stack_pop_pointer() : () -> i64
      %2259 = func.call @stack_pop_pointer() : () -> i64
      %2260 = func.call @cc_cons(%2258, %2259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2260) : (i64) -> ()
      %2261 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2262 = arith.constant 13 : i64
      %2263 = func.call @cc_make_string(%2261, %2262) : (!llvm.ptr, i64) -> i64
      %2264 = func.call @cc_nil_value() : () -> i64
      %2265 = func.call @cc_intern(%2263, %2264) : (i64, i64) -> i64
      %2266 = func.call @cc_nil_value() : () -> i64
      %2267 = func.call @cc_cons(%2265, %2266) : (i64, i64) -> i64
      %2268 = func.call @cc_values_pack(%2267) : (i64) -> i64
      func.call @stack_push_pointer(%2265) : (i64) -> ()
      %2269 = func.call @stack_pop_pointer() : () -> i64
      %2270 = func.call @stack_pop_pointer() : () -> i64
      %2271 = func.call @cc_cons(%2269, %2270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2271) : (i64) -> ()
      %2272 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2273 = arith.constant 15 : i64
      %2274 = func.call @cc_make_string(%2272, %2273) : (!llvm.ptr, i64) -> i64
      %2275 = func.call @cc_nil_value() : () -> i64
      %2276 = func.call @cc_intern(%2274, %2275) : (i64, i64) -> i64
      %2277 = func.call @cc_nil_value() : () -> i64
      %2278 = func.call @cc_cons(%2276, %2277) : (i64, i64) -> i64
      %2279 = func.call @cc_values_pack(%2278) : (i64) -> i64
      func.call @stack_push_pointer(%2276) : (i64) -> ()
      %2280 = func.call @stack_pop_pointer() : () -> i64
      %2281 = func.call @stack_pop_pointer() : () -> i64
      %2282 = func.call @cc_cons(%2280, %2281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2282) : (i64) -> ()
      %2283 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2284 = arith.constant 11 : i64
      %2285 = func.call @cc_make_string(%2283, %2284) : (!llvm.ptr, i64) -> i64
      %2286 = func.call @cc_nil_value() : () -> i64
      %2287 = func.call @cc_intern(%2285, %2286) : (i64, i64) -> i64
      %2288 = func.call @cc_nil_value() : () -> i64
      %2289 = func.call @cc_cons(%2287, %2288) : (i64, i64) -> i64
      %2290 = func.call @cc_values_pack(%2289) : (i64) -> i64
      func.call @stack_push_pointer(%2287) : (i64) -> ()
      %2291 = func.call @stack_pop_pointer() : () -> i64
      %2292 = func.call @stack_pop_pointer() : () -> i64
      %2293 = func.call @cc_cons(%2291, %2292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2293) : (i64) -> ()
      %2294 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2295 = arith.constant 6 : i64
      %2296 = func.call @cc_make_string(%2294, %2295) : (!llvm.ptr, i64) -> i64
      %2297 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2298 = arith.constant 11 : i64
      %2299 = func.call @cc_make_string(%2297, %2298) : (!llvm.ptr, i64) -> i64
      %2300 = func.call @cc_intern(%2296, %2299) : (i64, i64) -> i64
      %2301 = func.call @cc_nil_value() : () -> i64
      %2302 = func.call @cc_cons(%2300, %2301) : (i64, i64) -> i64
      %2303 = func.call @cc_values_pack(%2302) : (i64) -> i64
      func.call @stack_push_pointer(%2300) : (i64) -> ()
      %2304 = func.call @stack_pop_pointer() : () -> i64
      %2305 = func.call @stack_pop_pointer() : () -> i64
      %2306 = func.call @cc_cons(%2304, %2305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2306) : (i64) -> ()
      %2307 = func.call @stack_pop_pointer() : () -> i64
      %2308 = func.call @stack_pop_pointer() : () -> i64
      %2309 = func.call @cc_cons(%2307, %2308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2309) : (i64) -> ()
      %2310 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2311 = arith.constant 7 : i64
      %2312 = func.call @cc_make_string(%2310, %2311) : (!llvm.ptr, i64) -> i64
      %2313 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2314 = arith.constant 11 : i64
      %2315 = func.call @cc_make_string(%2313, %2314) : (!llvm.ptr, i64) -> i64
      %2316 = func.call @cc_intern(%2312, %2315) : (i64, i64) -> i64
      %2317 = func.call @cc_nil_value() : () -> i64
      %2318 = func.call @cc_cons(%2316, %2317) : (i64, i64) -> i64
      %2319 = func.call @cc_values_pack(%2318) : (i64) -> i64
      func.call @stack_push_pointer(%2316) : (i64) -> ()
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @cc_cons(%2320, %2321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = func.call @cc_cons(%2323, %2324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2325) : (i64) -> ()
      %2326 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2326) : (i64) -> ()
      %2327 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2328 = arith.constant 8 : i64
      %2329 = func.call @cc_make_string(%2327, %2328) : (!llvm.ptr, i64) -> i64
      %2330 = func.call @cc_nil_value() : () -> i64
      %2331 = func.call @cc_intern(%2329, %2330) : (i64, i64) -> i64
      %2332 = func.call @cc_nil_value() : () -> i64
      %2333 = func.call @cc_cons(%2331, %2332) : (i64, i64) -> i64
      %2334 = func.call @cc_values_pack(%2333) : (i64) -> i64
      func.call @stack_push_pointer(%2331) : (i64) -> ()
      %2335 = func.call @stack_pop_pointer() : () -> i64
      %2336 = func.call @stack_pop_pointer() : () -> i64
      %2337 = func.call @cc_cons(%2335, %2336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2337) : (i64) -> ()
      %2338 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2339 = arith.constant 5 : i64
      %2340 = func.call @cc_make_string(%2338, %2339) : (!llvm.ptr, i64) -> i64
      %2341 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2342 = arith.constant 11 : i64
      %2343 = func.call @cc_make_string(%2341, %2342) : (!llvm.ptr, i64) -> i64
      %2344 = func.call @cc_intern(%2340, %2343) : (i64, i64) -> i64
      %2345 = func.call @cc_nil_value() : () -> i64
      %2346 = func.call @cc_cons(%2344, %2345) : (i64, i64) -> i64
      %2347 = func.call @cc_values_pack(%2346) : (i64) -> i64
      func.call @stack_push_pointer(%2344) : (i64) -> ()
      %2348 = func.call @stack_pop_pointer() : () -> i64
      %2349 = func.call @stack_pop_pointer() : () -> i64
      %2350 = func.call @cc_cons(%2348, %2349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2350) : (i64) -> ()
      %2351 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2352 = arith.constant 13 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = func.call @cc_nil_value() : () -> i64
      %2355 = func.call @cc_intern(%2353, %2354) : (i64, i64) -> i64
      %2356 = func.call @cc_nil_value() : () -> i64
      %2357 = func.call @cc_cons(%2355, %2356) : (i64, i64) -> i64
      %2358 = func.call @cc_values_pack(%2357) : (i64) -> i64
      func.call @stack_push_pointer(%2355) : (i64) -> ()
      %2359 = func.call @stack_pop_pointer() : () -> i64
      %2360 = func.call @stack_pop_pointer() : () -> i64
      %2361 = func.call @cc_cons(%2359, %2360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2361) : (i64) -> ()
      %2362 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2363 = arith.constant 15 : i64
      %2364 = func.call @cc_make_string(%2362, %2363) : (!llvm.ptr, i64) -> i64
      %2365 = func.call @cc_nil_value() : () -> i64
      %2366 = func.call @cc_intern(%2364, %2365) : (i64, i64) -> i64
      %2367 = func.call @cc_nil_value() : () -> i64
      %2368 = func.call @cc_cons(%2366, %2367) : (i64, i64) -> i64
      %2369 = func.call @cc_values_pack(%2368) : (i64) -> i64
      func.call @stack_push_pointer(%2366) : (i64) -> ()
      %2370 = func.call @stack_pop_pointer() : () -> i64
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @cc_cons(%2370, %2371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2372) : (i64) -> ()
      %2373 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2374 = arith.constant 11 : i64
      %2375 = func.call @cc_make_string(%2373, %2374) : (!llvm.ptr, i64) -> i64
      %2376 = func.call @cc_nil_value() : () -> i64
      %2377 = func.call @cc_intern(%2375, %2376) : (i64, i64) -> i64
      %2378 = func.call @cc_nil_value() : () -> i64
      %2379 = func.call @cc_cons(%2377, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_values_pack(%2379) : (i64) -> i64
      func.call @stack_push_pointer(%2377) : (i64) -> ()
      %2381 = func.call @stack_pop_pointer() : () -> i64
      %2382 = func.call @stack_pop_pointer() : () -> i64
      %2383 = func.call @cc_cons(%2381, %2382) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2383) : (i64) -> ()
      %2384 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2384) : (i64) -> ()
      %2385 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2386 = arith.constant 16 : i64
      %2387 = func.call @cc_make_string(%2385, %2386) : (!llvm.ptr, i64) -> i64
      %2388 = func.call @cc_nil_value() : () -> i64
      %2389 = func.call @cc_intern(%2387, %2388) : (i64, i64) -> i64
      %2390 = func.call @cc_nil_value() : () -> i64
      %2391 = func.call @cc_cons(%2389, %2390) : (i64, i64) -> i64
      %2392 = func.call @cc_values_pack(%2391) : (i64) -> i64
      func.call @stack_push_pointer(%2389) : (i64) -> ()
      %2393 = func.call @stack_pop_pointer() : () -> i64
      %2394 = func.call @stack_pop_pointer() : () -> i64
      %2395 = func.call @cc_cons(%2393, %2394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2395) : (i64) -> ()
      %2396 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2397 = arith.constant 8 : i64
      %2398 = func.call @cc_make_string(%2396, %2397) : (!llvm.ptr, i64) -> i64
      %2399 = func.call @cc_nil_value() : () -> i64
      %2400 = func.call @cc_intern(%2398, %2399) : (i64, i64) -> i64
      %2401 = func.call @cc_nil_value() : () -> i64
      %2402 = func.call @cc_cons(%2400, %2401) : (i64, i64) -> i64
      %2403 = func.call @cc_values_pack(%2402) : (i64) -> i64
      func.call @stack_push_pointer(%2400) : (i64) -> ()
      %2404 = func.call @stack_pop_pointer() : () -> i64
      %2405 = func.call @stack_pop_pointer() : () -> i64
      %2406 = func.call @cc_cons(%2404, %2405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2406) : (i64) -> ()
      %2407 = func.call @stack_pop_pointer() : () -> i64
      %2408 = func.call @stack_pop_pointer() : () -> i64
      %2409 = func.call @cc_cons(%2407, %2408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2409) : (i64) -> ()
      %2410 = func.call @stack_pop_pointer() : () -> i64
      %2411 = func.call @stack_pop_pointer() : () -> i64
      %2412 = func.call @cc_cons(%2410, %2411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2412) : (i64) -> ()
      %2413 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2414 = arith.constant 6 : i64
      %2415 = func.call @cc_make_string(%2413, %2414) : (!llvm.ptr, i64) -> i64
      %2416 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2417 = arith.constant 7 : i64
      %2418 = func.call @cc_make_string(%2416, %2417) : (!llvm.ptr, i64) -> i64
      %2419 = func.call @cc_intern(%2415, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_values_pack(%2421) : (i64) -> i64
      func.call @stack_push_pointer(%2419) : (i64) -> ()
      %2423 = func.call @stack_pop_pointer() : () -> i64
      %2424 = func.call @stack_pop_pointer() : () -> i64
      %2425 = func.call @cc_cons(%2423, %2424) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2425) : (i64) -> ()
      %2426 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2427 = arith.constant 35 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2430 = arith.constant 11 : i64
      %2431 = func.call @cc_make_string(%2429, %2430) : (!llvm.ptr, i64) -> i64
      %2432 = func.call @cc_intern(%2428, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_nil_value() : () -> i64
      %2434 = func.call @cc_cons(%2432, %2433) : (i64, i64) -> i64
      %2435 = func.call @cc_values_pack(%2434) : (i64) -> i64
      func.call @stack_push_pointer(%2432) : (i64) -> ()
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @stack_pop_pointer() : () -> i64
      %2438 = func.call @cc_cons(%2436, %2437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2438) : (i64) -> ()
      %2439 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2440 = arith.constant 9 : i64
      %2441 = func.call @cc_make_string(%2439, %2440) : (!llvm.ptr, i64) -> i64
      %2442 = func.call @cc_nil_value() : () -> i64
      %2443 = func.call @cc_intern(%2441, %2442) : (i64, i64) -> i64
      %2444 = func.call @cc_nil_value() : () -> i64
      %2445 = func.call @cc_cons(%2443, %2444) : (i64, i64) -> i64
      %2446 = func.call @cc_values_pack(%2445) : (i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      %2447 = func.call @stack_pop_pointer() : () -> i64
      %2448 = func.call @stack_pop_pointer() : () -> i64
      %2449 = func.call @cc_cons(%2447, %2448) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2449) : (i64) -> ()
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = func.call @cc_nil_value() : () -> i64
      %2452 = func.call @cc_cons(%2450, %2451) : (i64, i64) -> i64
      %2453 = func.call @cc_eval(%2452) : (i64) -> i64
      %2454 = func.call @cc_multiple_value_list(%2453) : (i64) -> i64
      %2455 = func.call @cc_values_pack(%2454) : (i64) -> i64
      func.call @stack_push_pointer(%2455) : (i64) -> ()
      %2456 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2456 : i64
    }
    %2457 = func.call @cc_nil_value() : () -> i64
    %2458 = func.call @cc_errorp(%2170) : (i64) -> i64
    %2459 = arith.cmpi ne, %2458, %2457 : i64
    %2460 = scf.if %2459 -> (i64) {
      scf.yield %2170 : i64
    } else {
      %2461 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2462 = arith.constant 13 : i64
      %2463 = func.call @cc_make_string(%2461, %2462) : (!llvm.ptr, i64) -> i64
      %2464 = func.call @cc_nil_value() : () -> i64
      %2465 = func.call @cc_intern(%2463, %2464) : (i64, i64) -> i64
      %2466 = func.call @cc_nil_value() : () -> i64
      %2467 = func.call @cc_cons(%2465, %2466) : (i64, i64) -> i64
      %2468 = func.call @cc_values_pack(%2467) : (i64) -> i64
      func.call @stack_push_pointer(%2465) : (i64) -> ()
      %2469 = func.call @stack_pop_pointer() : () -> i64
      %2470 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2471 = arith.constant 10 : i64
      %2472 = func.call @cc_make_string(%2470, %2471) : (!llvm.ptr, i64) -> i64
      %2473 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2474 = arith.constant 11 : i64
      %2475 = func.call @cc_make_string(%2473, %2474) : (!llvm.ptr, i64) -> i64
      %2476 = func.call @cc_intern(%2472, %2475) : (i64, i64) -> i64
      %2477 = func.call @cc_nil_value() : () -> i64
      %2478 = func.call @cc_cons(%2476, %2477) : (i64, i64) -> i64
      %2479 = func.call @cc_values_pack(%2478) : (i64) -> i64
      func.call @stack_push_pointer(%2476) : (i64) -> ()
      %2480 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2481 = arith.constant 11 : i64
      %2482 = func.call @cc_make_string(%2480, %2481) : (!llvm.ptr, i64) -> i64
      %2483 = func.call @cc_nil_value() : () -> i64
      %2484 = func.call @cc_intern(%2482, %2483) : (i64, i64) -> i64
      %2485 = func.call @cc_nil_value() : () -> i64
      %2486 = func.call @cc_cons(%2484, %2485) : (i64, i64) -> i64
      %2487 = func.call @cc_values_pack(%2486) : (i64) -> i64
      func.call @stack_push_pointer(%2484) : (i64) -> ()
      %2488 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2488) : (i64) -> ()
      %2489 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2490 = arith.constant 4 : i64
      %2491 = func.call @cc_make_string(%2489, %2490) : (!llvm.ptr, i64) -> i64
      %2492 = func.call @cc_nil_value() : () -> i64
      %2493 = func.call @cc_intern(%2491, %2492) : (i64, i64) -> i64
      %2494 = func.call @cc_nil_value() : () -> i64
      %2495 = func.call @cc_cons(%2493, %2494) : (i64, i64) -> i64
      %2496 = func.call @cc_values_pack(%2495) : (i64) -> i64
      func.call @stack_push_pointer(%2493) : (i64) -> ()
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @stack_pop_pointer() : () -> i64
      %2499 = func.call @cc_cons(%2497, %2498) : (i64, i64) -> i64
      %2500 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2501 = arith.constant 5 : i64
      %2502 = func.call @cc_make_string(%2500, %2501) : (!llvm.ptr, i64) -> i64
      %2503 = func.call @cc_nil_value() : () -> i64
      %2504 = func.call @cc_intern(%2502, %2503) : (i64, i64) -> i64
      %2505 = func.call @cc_nil_value() : () -> i64
      %2506 = func.call @cc_cons(%2504, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_values_pack(%2506) : (i64) -> i64
      %2508 = func.call @cc_cons(%2504, %2499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2508) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @stack_pop_pointer() : () -> i64
      %2511 = func.call @cc_cons(%2510, %2509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2511) : (i64) -> ()
      %2512 = func.call @stack_pop_pointer() : () -> i64
      %2513 = func.call @stack_pop_pointer() : () -> i64
      %2514 = func.call @cc_cons(%2513, %2512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2514) : (i64) -> ()
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @stack_pop_pointer() : () -> i64
      %2517 = func.call @cc_cons(%2516, %2515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2517) : (i64) -> ()
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2559 = arith.constant 47863920852999 : i64
      %2560 = arith.constant 0 : i64
      %2561 = func.call @cc_make_closure(%2559, %2560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2561) : (i64) -> ()
      %2562 = func.call @stack_pop_pointer() : () -> i64
      %2563 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%2563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2564 = func.call @stack_pop_pointer() : () -> i64
      %2565 = func.call @stack_pop_pointer() : () -> i64
      %2566 = func.call @cc_cons(%2565, %2564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2566) : (i64) -> ()
      %2567 = func.call @stack_pop_pointer() : () -> i64
      %2568 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2569 = arith.constant 11 : i64
      %2570 = func.call @cc_make_string(%2568, %2569) : (!llvm.ptr, i64) -> i64
      %2571 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2572 = arith.constant 7 : i64
      %2573 = func.call @cc_make_string(%2571, %2572) : (!llvm.ptr, i64) -> i64
      %2574 = func.call @cc_intern(%2570, %2573) : (i64, i64) -> i64
      %2575 = func.call @cc_nil_value() : () -> i64
      %2576 = func.call @cc_cons(%2574, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_values_pack(%2576) : (i64) -> i64
      func.call @stack_push_pointer(%2574) : (i64) -> ()
      %2578 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2579 = func.call @stack_pop_pointer() : () -> i64
      %2580 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2581 = arith.constant 4 : i64
      %2582 = func.call @cc_make_string(%2580, %2581) : (!llvm.ptr, i64) -> i64
      %2583 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2584 = arith.constant 7 : i64
      %2585 = func.call @cc_make_string(%2583, %2584) : (!llvm.ptr, i64) -> i64
      %2586 = func.call @cc_intern(%2582, %2585) : (i64, i64) -> i64
      %2587 = func.call @cc_nil_value() : () -> i64
      %2588 = func.call @cc_cons(%2586, %2587) : (i64, i64) -> i64
      %2589 = func.call @cc_values_pack(%2588) : (i64) -> i64
      func.call @stack_push_pointer(%2586) : (i64) -> ()
      %2590 = func.call @stack_pop_pointer() : () -> i64
      %2591 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2592 = arith.constant 6 : i64
      %2593 = func.call @cc_make_string(%2591, %2592) : (!llvm.ptr, i64) -> i64
      %2594 = func.call @cc_nil_value() : () -> i64
      %2595 = func.call @cc_intern(%2593, %2594) : (i64, i64) -> i64
      %2596 = func.call @cc_nil_value() : () -> i64
      %2597 = func.call @cc_cons(%2595, %2596) : (i64, i64) -> i64
      %2598 = func.call @cc_values_pack(%2597) : (i64) -> i64
      func.call @stack_push_pointer(%2595) : (i64) -> ()
      %2599 = func.call @stack_pop_pointer() : () -> i64
      %2600 = func.call @cc_nil_value() : () -> i64
      %2601 = func.call @cc_errorp(%2469) : (i64) -> i64
      %2602 = arith.cmpi ne, %2601, %2600 : i64
      %2603 = arith.cmpi eq, %2600, %2600 : i64
      %2604 = arith.andi %2602, %2603 : i1
      %2605 = scf.if %2604 -> (i64) {
        scf.yield %2469 : i64
      } else {
        scf.yield %2600 : i64
      }
      %2606 = func.call @cc_errorp(%2518) : (i64) -> i64
      %2607 = arith.cmpi ne, %2606, %2600 : i64
      %2608 = arith.cmpi eq, %2605, %2600 : i64
      %2609 = arith.andi %2607, %2608 : i1
      %2610 = scf.if %2609 -> (i64) {
        scf.yield %2518 : i64
      } else {
        scf.yield %2605 : i64
      }
      %2611 = func.call @cc_errorp(%2562) : (i64) -> i64
      %2612 = arith.cmpi ne, %2611, %2600 : i64
      %2613 = arith.cmpi eq, %2610, %2600 : i64
      %2614 = arith.andi %2612, %2613 : i1
      %2615 = scf.if %2614 -> (i64) {
        scf.yield %2562 : i64
      } else {
        scf.yield %2610 : i64
      }
      %2616 = func.call @cc_errorp(%2567) : (i64) -> i64
      %2617 = arith.cmpi ne, %2616, %2600 : i64
      %2618 = arith.cmpi eq, %2615, %2600 : i64
      %2619 = arith.andi %2617, %2618 : i1
      %2620 = scf.if %2619 -> (i64) {
        scf.yield %2567 : i64
      } else {
        scf.yield %2615 : i64
      }
      %2621 = func.call @cc_errorp(%2578) : (i64) -> i64
      %2622 = arith.cmpi ne, %2621, %2600 : i64
      %2623 = arith.cmpi eq, %2620, %2600 : i64
      %2624 = arith.andi %2622, %2623 : i1
      %2625 = scf.if %2624 -> (i64) {
        scf.yield %2578 : i64
      } else {
        scf.yield %2620 : i64
      }
      %2626 = func.call @cc_errorp(%2579) : (i64) -> i64
      %2627 = arith.cmpi ne, %2626, %2600 : i64
      %2628 = arith.cmpi eq, %2625, %2600 : i64
      %2629 = arith.andi %2627, %2628 : i1
      %2630 = scf.if %2629 -> (i64) {
        scf.yield %2579 : i64
      } else {
        scf.yield %2625 : i64
      }
      %2631 = func.call @cc_errorp(%2590) : (i64) -> i64
      %2632 = arith.cmpi ne, %2631, %2600 : i64
      %2633 = arith.cmpi eq, %2630, %2600 : i64
      %2634 = arith.andi %2632, %2633 : i1
      %2635 = scf.if %2634 -> (i64) {
        scf.yield %2590 : i64
      } else {
        scf.yield %2630 : i64
      }
      %2636 = func.call @cc_errorp(%2599) : (i64) -> i64
      %2637 = arith.cmpi ne, %2636, %2600 : i64
      %2638 = arith.cmpi eq, %2635, %2600 : i64
      %2639 = arith.andi %2637, %2638 : i1
      %2640 = scf.if %2639 -> (i64) {
        scf.yield %2599 : i64
      } else {
        scf.yield %2635 : i64
      }
      %2641 = arith.cmpi ne, %2640, %2600 : i64
      scf.if %2641 {
        func.call @stack_push_pointer(%2640) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2469) : (i64) -> ()
        func.call @stack_push_pointer(%2518) : (i64) -> ()
        func.call @stack_push_pointer(%2562) : (i64) -> ()
        func.call @stack_push_pointer(%2567) : (i64) -> ()
        func.call @stack_push_pointer(%2578) : (i64) -> ()
        func.call @stack_push_pointer(%2579) : (i64) -> ()
        func.call @stack_push_pointer(%2590) : (i64) -> ()
        func.call @stack_push_pointer(%2599) : (i64) -> ()
        %2642 = llvm.mlir.addressof @str243 : !llvm.ptr
        %2643 = func.call @cc_make_function_ref_const(%2642) : (!llvm.ptr) -> i64
        %2644 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2643, %2644) : (i64, i64) -> ()
      }
      %2645 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2645 : i64
    }
    %2646 = func.call @cc_nil_value() : () -> i64
    %2647 = func.call @cc_errorp(%2460) : (i64) -> i64
    %2648 = arith.cmpi ne, %2647, %2646 : i64
    %2649 = scf.if %2648 -> (i64) {
      scf.yield %2460 : i64
    } else {
      %2650 = func.call @cc_nil_value() : () -> i64
      %2651 = func.call @cc_nil_value() : () -> i64
      %2652 = func.call @cc_errorp(%2650) : (i64) -> i64
      %2653 = arith.cmpi ne, %2652, %2651 : i64
      %2654 = scf.if %2653 -> (i64) {
        scf.yield %2650 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %2655 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2656 = llvm.mlir.addressof @str244 : !llvm.ptr
        %2657 = arith.constant 5 : i64
        %2658 = func.call @cc_make_string(%2656, %2657) : (!llvm.ptr, i64) -> i64
        %2659 = llvm.mlir.addressof @str245 : !llvm.ptr
        %2660 = arith.constant 11 : i64
        %2661 = func.call @cc_make_string(%2659, %2660) : (!llvm.ptr, i64) -> i64
        %2662 = func.call @cc_intern(%2658, %2661) : (i64, i64) -> i64
        %2663 = func.call @cc_nil_value() : () -> i64
        %2664 = func.call @cc_cons(%2662, %2663) : (i64, i64) -> i64
        %2665 = func.call @cc_values_pack(%2664) : (i64) -> i64
        %2666 = func.call @stack_pop_pointer() : () -> i64
        %2667 = func.call @cc_cons(%2662, %2666) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2667) : (i64) -> ()
        %2668 = func.call @stack_pop_pointer() : () -> i64
        %2669 = llvm.mlir.addressof @str246 : !llvm.ptr
        %2670 = arith.constant 13 : i64
        %2671 = func.call @cc_make_string(%2669, %2670) : (!llvm.ptr, i64) -> i64
        %2672 = func.call @cc_nil_value() : () -> i64
        %2673 = func.call @cc_intern(%2671, %2672) : (i64, i64) -> i64
        %2674 = func.call @cc_nil_value() : () -> i64
        %2675 = func.call @cc_cons(%2673, %2674) : (i64, i64) -> i64
        %2676 = func.call @cc_values_pack(%2675) : (i64) -> i64
        %2677 = func.call @cc_defclass(%2673, %2655, %2668) : (i64, i64, i64) -> i64
        %2678 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2678) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %2679 = func.call @stack_pop_pointer() : () -> i64
        %2680 = func.call @stack_pop_pointer() : () -> i64
        %2681 = func.call @cc_cons(%2679, %2680) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2681) : (i64) -> ()
        %2682 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2682) : (i64) -> ()
        %2683 = llvm.mlir.addressof @str247 : !llvm.ptr
        %2684 = arith.constant 5 : i64
        %2685 = func.call @cc_make_string(%2683, %2684) : (!llvm.ptr, i64) -> i64
        %2686 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2687 = arith.constant 11 : i64
        %2688 = func.call @cc_make_string(%2686, %2687) : (!llvm.ptr, i64) -> i64
        %2689 = func.call @cc_intern(%2685, %2688) : (i64, i64) -> i64
        %2690 = func.call @cc_nil_value() : () -> i64
        %2691 = func.call @cc_cons(%2689, %2690) : (i64, i64) -> i64
        %2692 = func.call @cc_values_pack(%2691) : (i64) -> i64
        func.call @stack_push_pointer(%2689) : (i64) -> ()
        %2693 = func.call @stack_pop_pointer() : () -> i64
        %2694 = func.call @stack_pop_pointer() : () -> i64
        %2695 = func.call @cc_cons(%2693, %2694) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2695) : (i64) -> ()
        %2696 = func.call @stack_pop_pointer() : () -> i64
        %2697 = func.call @stack_pop_pointer() : () -> i64
        %2698 = func.call @cc_cons(%2696, %2697) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2698) : (i64) -> ()
        %2699 = llvm.mlir.addressof @str249 : !llvm.ptr
        %2700 = arith.constant 13 : i64
        %2701 = func.call @cc_make_string(%2699, %2700) : (!llvm.ptr, i64) -> i64
        %2702 = func.call @cc_nil_value() : () -> i64
        %2703 = func.call @cc_intern(%2701, %2702) : (i64, i64) -> i64
        %2704 = func.call @cc_nil_value() : () -> i64
        %2705 = func.call @cc_cons(%2703, %2704) : (i64, i64) -> i64
        %2706 = func.call @cc_values_pack(%2705) : (i64) -> i64
        func.call @stack_push_pointer(%2703) : (i64) -> ()
        %2707 = func.call @stack_pop_pointer() : () -> i64
        %2708 = func.call @stack_pop_pointer() : () -> i64
        %2709 = func.call @cc_cons(%2707, %2708) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2709) : (i64) -> ()
        %2710 = llvm.mlir.addressof @str250 : !llvm.ptr
        %2711 = arith.constant 8 : i64
        %2712 = func.call @cc_make_string(%2710, %2711) : (!llvm.ptr, i64) -> i64
        %2713 = func.call @cc_nil_value() : () -> i64
        %2714 = func.call @cc_intern(%2712, %2713) : (i64, i64) -> i64
        %2715 = func.call @cc_nil_value() : () -> i64
        %2716 = func.call @cc_cons(%2714, %2715) : (i64, i64) -> i64
        %2717 = func.call @cc_values_pack(%2716) : (i64) -> i64
        func.call @stack_push_pointer(%2714) : (i64) -> ()
        %2718 = func.call @stack_pop_pointer() : () -> i64
        %2719 = func.call @stack_pop_pointer() : () -> i64
        %2720 = func.call @cc_cons(%2718, %2719) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2720) : (i64) -> ()
        %2721 = func.call @stack_pop_pointer() : () -> i64
        %2722 = func.call @cc_nil_value() : () -> i64
        %2723 = func.call @cc_cons(%2721, %2722) : (i64, i64) -> i64
        %2724 = func.call @cc_eval(%2723) : (i64) -> i64
        %2725 = func.call @cc_multiple_value_list(%2724) : (i64) -> i64
        %2726 = func.call @cc_values_pack(%2725) : (i64) -> i64
        func.call @stack_push_pointer(%2726) : (i64) -> ()
        %2727 = func.call @stack_depth() : () -> i64
        %2728 = arith.constant 0 : i64
        %2729 = arith.cmpi sgt, %2727, %2728 : i64
        scf.if %2729 {
          %2730 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%2673) : (i64) -> ()
        %2731 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2731 : i64
      }
      %2732 = func.call @cc_nil_value() : () -> i64
      %2733 = func.call @cc_errorp(%2654) : (i64) -> i64
      %2734 = arith.cmpi ne, %2733, %2732 : i64
      %2735 = scf.if %2734 -> (i64) {
        scf.yield %2654 : i64
      } else {
        %2736 = llvm.mlir.addressof @str251 : !llvm.ptr
        %2737 = arith.constant 13 : i64
        %2738 = func.call @cc_make_string(%2736, %2737) : (!llvm.ptr, i64) -> i64
        %2739 = func.call @cc_nil_value() : () -> i64
        %2740 = func.call @cc_intern(%2738, %2739) : (i64, i64) -> i64
        %2741 = func.call @cc_nil_value() : () -> i64
        %2742 = func.call @cc_cons(%2740, %2741) : (i64, i64) -> i64
        %2743 = func.call @cc_values_pack(%2742) : (i64) -> i64
        func.call @stack_push_pointer(%2740) : (i64) -> ()
        %2744 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2744 : i64
      }
      func.call @stack_push_pointer(%2735) : (i64) -> ()
      %2745 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2745 : i64
    }
    %2746 = func.call @cc_nil_value() : () -> i64
    %2747 = func.call @cc_errorp(%2649) : (i64) -> i64
    %2748 = arith.cmpi ne, %2747, %2746 : i64
    %2749 = scf.if %2748 -> (i64) {
      scf.yield %2649 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2750 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2751 = func.call @stack_pop_pointer() : () -> i64
      %2752 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2753 = arith.constant 9 : i64
      %2754 = func.call @cc_make_string(%2752, %2753) : (!llvm.ptr, i64) -> i64
      %2755 = func.call @cc_nil_value() : () -> i64
      %2756 = func.call @cc_intern(%2754, %2755) : (i64, i64) -> i64
      %2757 = func.call @cc_nil_value() : () -> i64
      %2758 = func.call @cc_cons(%2756, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_values_pack(%2758) : (i64) -> i64
      %2760 = func.call @cc_defclass(%2756, %2750, %2751) : (i64, i64, i64) -> i64
      %2761 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2761) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2762 = func.call @stack_pop_pointer() : () -> i64
      %2763 = func.call @stack_pop_pointer() : () -> i64
      %2764 = func.call @cc_cons(%2762, %2763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2764) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2765 = func.call @stack_pop_pointer() : () -> i64
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @cc_cons(%2765, %2766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2767) : (i64) -> ()
      %2768 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2769 = arith.constant 9 : i64
      %2770 = func.call @cc_make_string(%2768, %2769) : (!llvm.ptr, i64) -> i64
      %2771 = func.call @cc_nil_value() : () -> i64
      %2772 = func.call @cc_intern(%2770, %2771) : (i64, i64) -> i64
      %2773 = func.call @cc_nil_value() : () -> i64
      %2774 = func.call @cc_cons(%2772, %2773) : (i64, i64) -> i64
      %2775 = func.call @cc_values_pack(%2774) : (i64) -> i64
      func.call @stack_push_pointer(%2772) : (i64) -> ()
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @stack_pop_pointer() : () -> i64
      %2778 = func.call @cc_cons(%2776, %2777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2778) : (i64) -> ()
      %2779 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2780 = arith.constant 8 : i64
      %2781 = func.call @cc_make_string(%2779, %2780) : (!llvm.ptr, i64) -> i64
      %2782 = func.call @cc_nil_value() : () -> i64
      %2783 = func.call @cc_intern(%2781, %2782) : (i64, i64) -> i64
      %2784 = func.call @cc_nil_value() : () -> i64
      %2785 = func.call @cc_cons(%2783, %2784) : (i64, i64) -> i64
      %2786 = func.call @cc_values_pack(%2785) : (i64) -> i64
      func.call @stack_push_pointer(%2783) : (i64) -> ()
      %2787 = func.call @stack_pop_pointer() : () -> i64
      %2788 = func.call @stack_pop_pointer() : () -> i64
      %2789 = func.call @cc_cons(%2787, %2788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2789) : (i64) -> ()
      %2790 = func.call @stack_pop_pointer() : () -> i64
      %2791 = func.call @cc_nil_value() : () -> i64
      %2792 = func.call @cc_cons(%2790, %2791) : (i64, i64) -> i64
      %2793 = func.call @cc_eval(%2792) : (i64) -> i64
      %2794 = func.call @cc_multiple_value_list(%2793) : (i64) -> i64
      %2795 = func.call @cc_values_pack(%2794) : (i64) -> i64
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      %2796 = func.call @stack_depth() : () -> i64
      %2797 = arith.constant 0 : i64
      %2798 = arith.cmpi sgt, %2796, %2797 : i64
      scf.if %2798 {
        %2799 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%2756) : (i64) -> ()
      %2800 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2800 : i64
    }
    %2801 = func.call @cc_nil_value() : () -> i64
    %2802 = func.call @cc_errorp(%2749) : (i64) -> i64
    %2803 = arith.cmpi ne, %2802, %2801 : i64
    %2804 = scf.if %2803 -> (i64) {
      scf.yield %2749 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2805 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2806 = arith.constant 4 : i64
      %2807 = func.call @cc_make_string(%2805, %2806) : (!llvm.ptr, i64) -> i64
      %2808 = func.call @cc_nil_value() : () -> i64
      %2809 = func.call @cc_intern(%2807, %2808) : (i64, i64) -> i64
      %2810 = func.call @cc_nil_value() : () -> i64
      %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
      %2813 = func.call @stack_pop_pointer() : () -> i64
      %2814 = func.call @cc_cons(%2809, %2813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2814) : (i64) -> ()
      %2815 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2816 = func.call @stack_pop_pointer() : () -> i64
      %2817 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2818 = arith.constant 9 : i64
      %2819 = func.call @cc_make_string(%2817, %2818) : (!llvm.ptr, i64) -> i64
      %2820 = func.call @cc_nil_value() : () -> i64
      %2821 = func.call @cc_intern(%2819, %2820) : (i64, i64) -> i64
      %2822 = func.call @cc_nil_value() : () -> i64
      %2823 = func.call @cc_cons(%2821, %2822) : (i64, i64) -> i64
      %2824 = func.call @cc_values_pack(%2823) : (i64) -> i64
      %2825 = func.call @cc_defclass(%2821, %2815, %2816) : (i64, i64, i64) -> i64
      %2826 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2826) : (i64) -> ()
      %2827 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2827) : (i64) -> ()
      %2828 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2828) : (i64) -> ()
      %2829 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%2829) : (i64) -> ()
      %2830 = func.call @stack_pop_pointer() : () -> i64
      %2831 = func.call @stack_pop_pointer() : () -> i64
      %2832 = func.call @cc_cons(%2830, %2831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2832) : (i64) -> ()
      %2833 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2834 = arith.constant 8 : i64
      %2835 = func.call @cc_make_string(%2833, %2834) : (!llvm.ptr, i64) -> i64
      %2836 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2837 = arith.constant 7 : i64
      %2838 = func.call @cc_make_string(%2836, %2837) : (!llvm.ptr, i64) -> i64
      %2839 = func.call @cc_intern(%2835, %2838) : (i64, i64) -> i64
      %2840 = func.call @cc_nil_value() : () -> i64
      %2841 = func.call @cc_cons(%2839, %2840) : (i64, i64) -> i64
      %2842 = func.call @cc_values_pack(%2841) : (i64) -> i64
      func.call @stack_push_pointer(%2839) : (i64) -> ()
      %2843 = func.call @stack_pop_pointer() : () -> i64
      %2844 = func.call @stack_pop_pointer() : () -> i64
      %2845 = func.call @cc_cons(%2843, %2844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2845) : (i64) -> ()
      %2846 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2847 = arith.constant 4 : i64
      %2848 = func.call @cc_make_string(%2846, %2847) : (!llvm.ptr, i64) -> i64
      %2849 = func.call @cc_nil_value() : () -> i64
      %2850 = func.call @cc_intern(%2848, %2849) : (i64, i64) -> i64
      %2851 = func.call @cc_nil_value() : () -> i64
      %2852 = func.call @cc_cons(%2850, %2851) : (i64, i64) -> i64
      %2853 = func.call @cc_values_pack(%2852) : (i64) -> i64
      func.call @stack_push_pointer(%2850) : (i64) -> ()
      %2854 = func.call @stack_pop_pointer() : () -> i64
      %2855 = func.call @stack_pop_pointer() : () -> i64
      %2856 = func.call @cc_cons(%2854, %2855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2856) : (i64) -> ()
      %2857 = func.call @stack_pop_pointer() : () -> i64
      %2858 = func.call @stack_pop_pointer() : () -> i64
      %2859 = func.call @cc_cons(%2857, %2858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2859) : (i64) -> ()
      %2860 = func.call @stack_pop_pointer() : () -> i64
      %2861 = func.call @stack_pop_pointer() : () -> i64
      %2862 = func.call @cc_cons(%2860, %2861) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2863 = func.call @stack_pop_pointer() : () -> i64
      %2864 = func.call @stack_pop_pointer() : () -> i64
      %2865 = func.call @cc_cons(%2863, %2864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2865) : (i64) -> ()
      %2866 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2867 = arith.constant 9 : i64
      %2868 = func.call @cc_make_string(%2866, %2867) : (!llvm.ptr, i64) -> i64
      %2869 = func.call @cc_nil_value() : () -> i64
      %2870 = func.call @cc_intern(%2868, %2869) : (i64, i64) -> i64
      %2871 = func.call @cc_nil_value() : () -> i64
      %2872 = func.call @cc_cons(%2870, %2871) : (i64, i64) -> i64
      %2873 = func.call @cc_values_pack(%2872) : (i64) -> i64
      func.call @stack_push_pointer(%2870) : (i64) -> ()
      %2874 = func.call @stack_pop_pointer() : () -> i64
      %2875 = func.call @stack_pop_pointer() : () -> i64
      %2876 = func.call @cc_cons(%2874, %2875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2876) : (i64) -> ()
      %2877 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2878 = arith.constant 8 : i64
      %2879 = func.call @cc_make_string(%2877, %2878) : (!llvm.ptr, i64) -> i64
      %2880 = func.call @cc_nil_value() : () -> i64
      %2881 = func.call @cc_intern(%2879, %2880) : (i64, i64) -> i64
      %2882 = func.call @cc_nil_value() : () -> i64
      %2883 = func.call @cc_cons(%2881, %2882) : (i64, i64) -> i64
      %2884 = func.call @cc_values_pack(%2883) : (i64) -> i64
      func.call @stack_push_pointer(%2881) : (i64) -> ()
      %2885 = func.call @stack_pop_pointer() : () -> i64
      %2886 = func.call @stack_pop_pointer() : () -> i64
      %2887 = func.call @cc_cons(%2885, %2886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2887) : (i64) -> ()
      %2888 = func.call @stack_pop_pointer() : () -> i64
      %2889 = func.call @cc_nil_value() : () -> i64
      %2890 = func.call @cc_cons(%2888, %2889) : (i64, i64) -> i64
      %2891 = func.call @cc_eval(%2890) : (i64) -> i64
      %2892 = func.call @cc_multiple_value_list(%2891) : (i64) -> i64
      %2893 = func.call @cc_values_pack(%2892) : (i64) -> i64
      func.call @stack_push_pointer(%2893) : (i64) -> ()
      %2894 = func.call @stack_depth() : () -> i64
      %2895 = arith.constant 0 : i64
      %2896 = arith.cmpi sgt, %2894, %2895 : i64
      scf.if %2896 {
        %2897 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%2821) : (i64) -> ()
      %2898 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2898 : i64
    }
    %2899 = func.call @cc_nil_value() : () -> i64
    %2900 = func.call @cc_errorp(%2804) : (i64) -> i64
    %2901 = arith.cmpi ne, %2900, %2899 : i64
    %2902 = scf.if %2901 -> (i64) {
      scf.yield %2804 : i64
    } else {
      %2929 = llvm.mlir.addressof @method_name_47863920853000 : !llvm.ptr
      %2930 = func.call @cc_make_lambda_ref_str(%2929) : (!llvm.ptr) -> i64
      %2931 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2932 = arith.constant 35 : i64
      %2933 = func.call @cc_make_string(%2931, %2932) : (!llvm.ptr, i64) -> i64
      %2934 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2935 = arith.constant 11 : i64
      %2936 = func.call @cc_make_string(%2934, %2935) : (!llvm.ptr, i64) -> i64
      %2937 = func.call @cc_intern(%2933, %2936) : (i64, i64) -> i64
      %2938 = func.call @cc_nil_value() : () -> i64
      %2939 = func.call @cc_cons(%2937, %2938) : (i64, i64) -> i64
      %2940 = func.call @cc_values_pack(%2939) : (i64) -> i64
      %2941 = func.call @cc_nil() : () -> i64
      %2942 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2943 = arith.constant 1 : i64
      %2944 = func.call @cc_make_string(%2942, %2943) : (!llvm.ptr, i64) -> i64
      %2945 = func.call @cc_nil_value() : () -> i64
      %2946 = func.call @cc_intern(%2944, %2945) : (i64, i64) -> i64
      %2947 = func.call @cc_nil_value() : () -> i64
      %2948 = func.call @cc_cons(%2946, %2947) : (i64, i64) -> i64
      %2949 = func.call @cc_values_pack(%2948) : (i64) -> i64
      %2950 = func.call @cc_cons(%2946, %2941) : (i64, i64) -> i64
      %2951 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2952 = arith.constant 1 : i64
      %2953 = func.call @cc_make_string(%2951, %2952) : (!llvm.ptr, i64) -> i64
      %2954 = func.call @cc_nil_value() : () -> i64
      %2955 = func.call @cc_intern(%2953, %2954) : (i64, i64) -> i64
      %2956 = func.call @cc_nil_value() : () -> i64
      %2957 = func.call @cc_cons(%2955, %2956) : (i64, i64) -> i64
      %2958 = func.call @cc_values_pack(%2957) : (i64) -> i64
      %2959 = func.call @cc_cons(%2955, %2950) : (i64, i64) -> i64
      %2960 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2961 = arith.constant 9 : i64
      %2962 = func.call @cc_make_string(%2960, %2961) : (!llvm.ptr, i64) -> i64
      %2963 = func.call @cc_nil_value() : () -> i64
      %2964 = func.call @cc_intern(%2962, %2963) : (i64, i64) -> i64
      %2965 = func.call @cc_nil_value() : () -> i64
      %2966 = func.call @cc_cons(%2964, %2965) : (i64, i64) -> i64
      %2967 = func.call @cc_values_pack(%2966) : (i64) -> i64
      %2968 = func.call @cc_cons(%2964, %2959) : (i64, i64) -> i64
      %2969 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2970 = arith.constant 9 : i64
      %2971 = func.call @cc_make_string(%2969, %2970) : (!llvm.ptr, i64) -> i64
      %2972 = func.call @cc_nil_value() : () -> i64
      %2973 = func.call @cc_intern(%2971, %2972) : (i64, i64) -> i64
      %2974 = func.call @cc_nil_value() : () -> i64
      %2975 = func.call @cc_cons(%2973, %2974) : (i64, i64) -> i64
      %2976 = func.call @cc_values_pack(%2975) : (i64) -> i64
      %2977 = func.call @cc_cons(%2973, %2968) : (i64, i64) -> i64
      %2978 = arith.constant 4 : i64
      %2979 = func.call @cc_box_fixnum(%2978) : (i64) -> i64
      %2980 = arith.constant 1 : i64
      %2981 = func.call @cc_defmethod_qualified(%2937, %2977, %2930, %2979, %2980) : (i64, i64, i64, i64, i64) -> i64
      %2982 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2982) : (i64) -> ()
      %2983 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2983) : (i64) -> ()
      %2984 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2984) : (i64) -> ()
      %2985 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2986 = arith.constant 13 : i64
      %2987 = func.call @cc_make_string(%2985, %2986) : (!llvm.ptr, i64) -> i64
      %2988 = func.call @cc_nil_value() : () -> i64
      %2989 = func.call @cc_intern(%2987, %2988) : (i64, i64) -> i64
      %2990 = func.call @cc_nil_value() : () -> i64
      %2991 = func.call @cc_cons(%2989, %2990) : (i64, i64) -> i64
      %2992 = func.call @cc_values_pack(%2991) : (i64) -> i64
      func.call @stack_push_pointer(%2989) : (i64) -> ()
      %2993 = func.call @stack_pop_pointer() : () -> i64
      %2994 = func.call @stack_pop_pointer() : () -> i64
      %2995 = func.call @cc_cons(%2993, %2994) : (i64, i64) -> i64
      %2996 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2997 = arith.constant 5 : i64
      %2998 = func.call @cc_make_string(%2996, %2997) : (!llvm.ptr, i64) -> i64
      %2999 = func.call @cc_nil_value() : () -> i64
      %3000 = func.call @cc_intern(%2998, %2999) : (i64, i64) -> i64
      %3001 = func.call @cc_nil_value() : () -> i64
      %3002 = func.call @cc_cons(%3000, %3001) : (i64, i64) -> i64
      %3003 = func.call @cc_values_pack(%3002) : (i64) -> i64
      %3004 = func.call @cc_cons(%3000, %2995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3004) : (i64) -> ()
      %3005 = func.call @stack_pop_pointer() : () -> i64
      %3006 = func.call @stack_pop_pointer() : () -> i64
      %3007 = func.call @cc_cons(%3005, %3006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3007) : (i64) -> ()
      %3008 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3009 = arith.constant 5 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3012 = arith.constant 11 : i64
      %3013 = func.call @cc_make_string(%3011, %3012) : (!llvm.ptr, i64) -> i64
      %3014 = func.call @cc_intern(%3010, %3013) : (i64, i64) -> i64
      %3015 = func.call @cc_nil_value() : () -> i64
      %3016 = func.call @cc_cons(%3014, %3015) : (i64, i64) -> i64
      %3017 = func.call @cc_values_pack(%3016) : (i64) -> i64
      func.call @stack_push_pointer(%3014) : (i64) -> ()
      %3018 = func.call @stack_pop_pointer() : () -> i64
      %3019 = func.call @stack_pop_pointer() : () -> i64
      %3020 = func.call @cc_cons(%3018, %3019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3020) : (i64) -> ()
      %3021 = func.call @stack_pop_pointer() : () -> i64
      %3022 = func.call @stack_pop_pointer() : () -> i64
      %3023 = func.call @cc_cons(%3021, %3022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3023) : (i64) -> ()
      %3024 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3024) : (i64) -> ()
      %3025 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3025) : (i64) -> ()
      %3026 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3027 = arith.constant 8 : i64
      %3028 = func.call @cc_make_string(%3026, %3027) : (!llvm.ptr, i64) -> i64
      %3029 = func.call @cc_nil_value() : () -> i64
      %3030 = func.call @cc_intern(%3028, %3029) : (i64, i64) -> i64
      %3031 = func.call @cc_nil_value() : () -> i64
      %3032 = func.call @cc_cons(%3030, %3031) : (i64, i64) -> i64
      %3033 = func.call @cc_values_pack(%3032) : (i64) -> i64
      func.call @stack_push_pointer(%3030) : (i64) -> ()
      %3034 = func.call @stack_pop_pointer() : () -> i64
      %3035 = func.call @stack_pop_pointer() : () -> i64
      %3036 = func.call @cc_cons(%3034, %3035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3036) : (i64) -> ()
      %3037 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3038 = arith.constant 6 : i64
      %3039 = func.call @cc_make_string(%3037, %3038) : (!llvm.ptr, i64) -> i64
      %3040 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3041 = arith.constant 11 : i64
      %3042 = func.call @cc_make_string(%3040, %3041) : (!llvm.ptr, i64) -> i64
      %3043 = func.call @cc_intern(%3039, %3042) : (i64, i64) -> i64
      %3044 = func.call @cc_nil_value() : () -> i64
      %3045 = func.call @cc_cons(%3043, %3044) : (i64, i64) -> i64
      %3046 = func.call @cc_values_pack(%3045) : (i64) -> i64
      func.call @stack_push_pointer(%3043) : (i64) -> ()
      %3047 = func.call @stack_pop_pointer() : () -> i64
      %3048 = func.call @stack_pop_pointer() : () -> i64
      %3049 = func.call @cc_cons(%3047, %3048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3049) : (i64) -> ()
      %3050 = func.call @stack_pop_pointer() : () -> i64
      %3051 = func.call @stack_pop_pointer() : () -> i64
      %3052 = func.call @cc_cons(%3050, %3051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3052) : (i64) -> ()
      %3053 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3054 = arith.constant 7 : i64
      %3055 = func.call @cc_make_string(%3053, %3054) : (!llvm.ptr, i64) -> i64
      %3056 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3057 = arith.constant 11 : i64
      %3058 = func.call @cc_make_string(%3056, %3057) : (!llvm.ptr, i64) -> i64
      %3059 = func.call @cc_intern(%3055, %3058) : (i64, i64) -> i64
      %3060 = func.call @cc_nil_value() : () -> i64
      %3061 = func.call @cc_cons(%3059, %3060) : (i64, i64) -> i64
      %3062 = func.call @cc_values_pack(%3061) : (i64) -> i64
      func.call @stack_push_pointer(%3059) : (i64) -> ()
      %3063 = func.call @stack_pop_pointer() : () -> i64
      %3064 = func.call @stack_pop_pointer() : () -> i64
      %3065 = func.call @cc_cons(%3063, %3064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3065) : (i64) -> ()
      %3066 = func.call @stack_pop_pointer() : () -> i64
      %3067 = func.call @stack_pop_pointer() : () -> i64
      %3068 = func.call @cc_cons(%3066, %3067) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3068) : (i64) -> ()
      %3069 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3069) : (i64) -> ()
      %3070 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3071 = arith.constant 8 : i64
      %3072 = func.call @cc_make_string(%3070, %3071) : (!llvm.ptr, i64) -> i64
      %3073 = func.call @cc_nil_value() : () -> i64
      %3074 = func.call @cc_intern(%3072, %3073) : (i64, i64) -> i64
      %3075 = func.call @cc_nil_value() : () -> i64
      %3076 = func.call @cc_cons(%3074, %3075) : (i64, i64) -> i64
      %3077 = func.call @cc_values_pack(%3076) : (i64) -> i64
      func.call @stack_push_pointer(%3074) : (i64) -> ()
      %3078 = func.call @stack_pop_pointer() : () -> i64
      %3079 = func.call @stack_pop_pointer() : () -> i64
      %3080 = func.call @cc_cons(%3078, %3079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3080) : (i64) -> ()
      %3081 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3082 = arith.constant 5 : i64
      %3083 = func.call @cc_make_string(%3081, %3082) : (!llvm.ptr, i64) -> i64
      %3084 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3085 = arith.constant 11 : i64
      %3086 = func.call @cc_make_string(%3084, %3085) : (!llvm.ptr, i64) -> i64
      %3087 = func.call @cc_intern(%3083, %3086) : (i64, i64) -> i64
      %3088 = func.call @cc_nil_value() : () -> i64
      %3089 = func.call @cc_cons(%3087, %3088) : (i64, i64) -> i64
      %3090 = func.call @cc_values_pack(%3089) : (i64) -> i64
      func.call @stack_push_pointer(%3087) : (i64) -> ()
      %3091 = func.call @stack_pop_pointer() : () -> i64
      %3092 = func.call @stack_pop_pointer() : () -> i64
      %3093 = func.call @cc_cons(%3091, %3092) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3093) : (i64) -> ()
      %3094 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3094) : (i64) -> ()
      %3095 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3096 = arith.constant 9 : i64
      %3097 = func.call @cc_make_string(%3095, %3096) : (!llvm.ptr, i64) -> i64
      %3098 = func.call @cc_nil_value() : () -> i64
      %3099 = func.call @cc_intern(%3097, %3098) : (i64, i64) -> i64
      %3100 = func.call @cc_nil_value() : () -> i64
      %3101 = func.call @cc_cons(%3099, %3100) : (i64, i64) -> i64
      %3102 = func.call @cc_values_pack(%3101) : (i64) -> i64
      func.call @stack_push_pointer(%3099) : (i64) -> ()
      %3103 = func.call @stack_pop_pointer() : () -> i64
      %3104 = func.call @stack_pop_pointer() : () -> i64
      %3105 = func.call @cc_cons(%3103, %3104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3105) : (i64) -> ()
      %3106 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3107 = arith.constant 3 : i64
      %3108 = func.call @cc_make_string(%3106, %3107) : (!llvm.ptr, i64) -> i64
      %3109 = func.call @cc_nil_value() : () -> i64
      %3110 = func.call @cc_intern(%3108, %3109) : (i64, i64) -> i64
      %3111 = func.call @cc_nil_value() : () -> i64
      %3112 = func.call @cc_cons(%3110, %3111) : (i64, i64) -> i64
      %3113 = func.call @cc_values_pack(%3112) : (i64) -> i64
      func.call @stack_push_pointer(%3110) : (i64) -> ()
      %3114 = func.call @stack_pop_pointer() : () -> i64
      %3115 = func.call @stack_pop_pointer() : () -> i64
      %3116 = func.call @cc_cons(%3114, %3115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3116) : (i64) -> ()
      %3117 = func.call @stack_pop_pointer() : () -> i64
      %3118 = func.call @stack_pop_pointer() : () -> i64
      %3119 = func.call @cc_cons(%3117, %3118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3119) : (i64) -> ()
      %3120 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3120) : (i64) -> ()
      %3121 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3122 = arith.constant 9 : i64
      %3123 = func.call @cc_make_string(%3121, %3122) : (!llvm.ptr, i64) -> i64
      %3124 = func.call @cc_nil_value() : () -> i64
      %3125 = func.call @cc_intern(%3123, %3124) : (i64, i64) -> i64
      %3126 = func.call @cc_nil_value() : () -> i64
      %3127 = func.call @cc_cons(%3125, %3126) : (i64, i64) -> i64
      %3128 = func.call @cc_values_pack(%3127) : (i64) -> i64
      func.call @stack_push_pointer(%3125) : (i64) -> ()
      %3129 = func.call @stack_pop_pointer() : () -> i64
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @cc_cons(%3129, %3130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3131) : (i64) -> ()
      %3132 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3133 = arith.constant 3 : i64
      %3134 = func.call @cc_make_string(%3132, %3133) : (!llvm.ptr, i64) -> i64
      %3135 = func.call @cc_nil_value() : () -> i64
      %3136 = func.call @cc_intern(%3134, %3135) : (i64, i64) -> i64
      %3137 = func.call @cc_nil_value() : () -> i64
      %3138 = func.call @cc_cons(%3136, %3137) : (i64, i64) -> i64
      %3139 = func.call @cc_values_pack(%3138) : (i64) -> i64
      func.call @stack_push_pointer(%3136) : (i64) -> ()
      %3140 = func.call @stack_pop_pointer() : () -> i64
      %3141 = func.call @stack_pop_pointer() : () -> i64
      %3142 = func.call @cc_cons(%3140, %3141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3142) : (i64) -> ()
      %3143 = func.call @stack_pop_pointer() : () -> i64
      %3144 = func.call @stack_pop_pointer() : () -> i64
      %3145 = func.call @cc_cons(%3143, %3144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3145) : (i64) -> ()
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @stack_pop_pointer() : () -> i64
      %3148 = func.call @cc_cons(%3146, %3147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3148) : (i64) -> ()
      %3149 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3150 = arith.constant 6 : i64
      %3151 = func.call @cc_make_string(%3149, %3150) : (!llvm.ptr, i64) -> i64
      %3152 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3153 = arith.constant 7 : i64
      %3154 = func.call @cc_make_string(%3152, %3153) : (!llvm.ptr, i64) -> i64
      %3155 = func.call @cc_intern(%3151, %3154) : (i64, i64) -> i64
      %3156 = func.call @cc_nil_value() : () -> i64
      %3157 = func.call @cc_cons(%3155, %3156) : (i64, i64) -> i64
      %3158 = func.call @cc_values_pack(%3157) : (i64) -> i64
      func.call @stack_push_pointer(%3155) : (i64) -> ()
      %3159 = func.call @stack_pop_pointer() : () -> i64
      %3160 = func.call @stack_pop_pointer() : () -> i64
      %3161 = func.call @cc_cons(%3159, %3160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3161) : (i64) -> ()
      %3162 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3163 = arith.constant 35 : i64
      %3164 = func.call @cc_make_string(%3162, %3163) : (!llvm.ptr, i64) -> i64
      %3165 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3166 = arith.constant 11 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = func.call @cc_intern(%3164, %3167) : (i64, i64) -> i64
      %3169 = func.call @cc_nil_value() : () -> i64
      %3170 = func.call @cc_cons(%3168, %3169) : (i64, i64) -> i64
      %3171 = func.call @cc_values_pack(%3170) : (i64) -> i64
      func.call @stack_push_pointer(%3168) : (i64) -> ()
      %3172 = func.call @stack_pop_pointer() : () -> i64
      %3173 = func.call @stack_pop_pointer() : () -> i64
      %3174 = func.call @cc_cons(%3172, %3173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3174) : (i64) -> ()
      %3175 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3176 = arith.constant 9 : i64
      %3177 = func.call @cc_make_string(%3175, %3176) : (!llvm.ptr, i64) -> i64
      %3178 = func.call @cc_nil_value() : () -> i64
      %3179 = func.call @cc_intern(%3177, %3178) : (i64, i64) -> i64
      %3180 = func.call @cc_nil_value() : () -> i64
      %3181 = func.call @cc_cons(%3179, %3180) : (i64, i64) -> i64
      %3182 = func.call @cc_values_pack(%3181) : (i64) -> i64
      func.call @stack_push_pointer(%3179) : (i64) -> ()
      %3183 = func.call @stack_pop_pointer() : () -> i64
      %3184 = func.call @stack_pop_pointer() : () -> i64
      %3185 = func.call @cc_cons(%3183, %3184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3185) : (i64) -> ()
      %3186 = func.call @stack_pop_pointer() : () -> i64
      %3187 = func.call @cc_nil_value() : () -> i64
      %3188 = func.call @cc_cons(%3186, %3187) : (i64, i64) -> i64
      %3189 = func.call @cc_eval(%3188) : (i64) -> i64
      %3190 = func.call @cc_multiple_value_list(%3189) : (i64) -> i64
      %3191 = func.call @cc_values_pack(%3190) : (i64) -> i64
      func.call @stack_push_pointer(%3191) : (i64) -> ()
      %3192 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3192 : i64
    }
    %3193 = func.call @cc_nil_value() : () -> i64
    %3194 = func.call @cc_errorp(%2902) : (i64) -> i64
    %3195 = arith.cmpi ne, %3194, %3193 : i64
    %3196 = scf.if %3195 -> (i64) {
      scf.yield %2902 : i64
    } else {
      %3197 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3198 = arith.constant 11 : i64
      %3199 = func.call @cc_make_string(%3197, %3198) : (!llvm.ptr, i64) -> i64
      %3200 = func.call @cc_nil_value() : () -> i64
      %3201 = func.call @cc_intern(%3199, %3200) : (i64, i64) -> i64
      %3202 = func.call @cc_nil_value() : () -> i64
      %3203 = func.call @cc_cons(%3201, %3202) : (i64, i64) -> i64
      %3204 = func.call @cc_values_pack(%3203) : (i64) -> i64
      %3205 = func.call @cc_nil_value() : () -> i64
      %3206 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3207 = arith.constant 9 : i64
      %3208 = func.call @cc_make_string(%3206, %3207) : (!llvm.ptr, i64) -> i64
      %3209 = func.call @cc_nil_value() : () -> i64
      %3210 = func.call @cc_intern(%3208, %3209) : (i64, i64) -> i64
      %3211 = func.call @cc_nil_value() : () -> i64
      %3212 = func.call @cc_cons(%3210, %3211) : (i64, i64) -> i64
      %3213 = func.call @cc_values_pack(%3212) : (i64) -> i64
      func.call @stack_push_pointer(%3210) : (i64) -> ()
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @cc_make_instance(%3214, %3205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3215) : (i64) -> ()
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @cc_set_symbol_value(%3201, %3216) : (i64, i64) -> i64
      %3218 = func.call @cc_errorp(%3217) : (i64) -> i64
      %3219 = func.call @cc_nil_value() : () -> i64
      %3220 = arith.cmpi ne, %3218, %3219 : i64
      scf.if %3220 {
        func.call @stack_push_pointer(%3217) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3201) : (i64) -> ()
      }
      %3221 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3221 : i64
    }
    %3222 = func.call @cc_nil_value() : () -> i64
    %3223 = func.call @cc_errorp(%3196) : (i64) -> i64
    %3224 = arith.cmpi ne, %3223, %3222 : i64
    %3225 = scf.if %3224 -> (i64) {
      scf.yield %3196 : i64
    } else {
      %3226 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3227 = arith.constant 13 : i64
      %3228 = func.call @cc_make_string(%3226, %3227) : (!llvm.ptr, i64) -> i64
      %3229 = func.call @cc_nil_value() : () -> i64
      %3230 = func.call @cc_intern(%3228, %3229) : (i64, i64) -> i64
      %3231 = func.call @cc_nil_value() : () -> i64
      %3232 = func.call @cc_cons(%3230, %3231) : (i64, i64) -> i64
      %3233 = func.call @cc_values_pack(%3232) : (i64) -> i64
      func.call @stack_push_pointer(%3230) : (i64) -> ()
      %3234 = func.call @stack_pop_pointer() : () -> i64
      %3235 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3236 = arith.constant 13 : i64
      %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
      %3238 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3239 = arith.constant 11 : i64
      %3240 = func.call @cc_make_string(%3238, %3239) : (!llvm.ptr, i64) -> i64
      %3241 = func.call @cc_intern(%3237, %3240) : (i64, i64) -> i64
      %3242 = func.call @cc_nil_value() : () -> i64
      %3243 = func.call @cc_cons(%3241, %3242) : (i64, i64) -> i64
      %3244 = func.call @cc_values_pack(%3243) : (i64) -> i64
      func.call @stack_push_pointer(%3241) : (i64) -> ()
      %3245 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3246 = arith.constant 6 : i64
      %3247 = func.call @cc_make_string(%3245, %3246) : (!llvm.ptr, i64) -> i64
      %3248 = func.call @cc_nil_value() : () -> i64
      %3249 = func.call @cc_intern(%3247, %3248) : (i64, i64) -> i64
      %3250 = func.call @cc_nil_value() : () -> i64
      %3251 = func.call @cc_cons(%3249, %3250) : (i64, i64) -> i64
      %3252 = func.call @cc_values_pack(%3251) : (i64) -> i64
      func.call @stack_push_pointer(%3249) : (i64) -> ()
      %3253 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3254 = arith.constant 19 : i64
      %3255 = func.call @cc_make_string(%3253, %3254) : (!llvm.ptr, i64) -> i64
      %3256 = func.call @cc_nil_value() : () -> i64
      %3257 = func.call @cc_intern(%3255, %3256) : (i64, i64) -> i64
      %3258 = func.call @cc_nil_value() : () -> i64
      %3259 = func.call @cc_cons(%3257, %3258) : (i64, i64) -> i64
      %3260 = func.call @cc_values_pack(%3259) : (i64) -> i64
      func.call @stack_push_pointer(%3257) : (i64) -> ()
      %3261 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3262 = arith.constant 12 : i64
      %3263 = func.call @cc_make_string(%3261, %3262) : (!llvm.ptr, i64) -> i64
      %3264 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3265 = arith.constant 11 : i64
      %3266 = func.call @cc_make_string(%3264, %3265) : (!llvm.ptr, i64) -> i64
      %3267 = func.call @cc_intern(%3263, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_nil_value() : () -> i64
      %3269 = func.call @cc_cons(%3267, %3268) : (i64, i64) -> i64
      %3270 = func.call @cc_values_pack(%3269) : (i64) -> i64
      func.call @stack_push_pointer(%3267) : (i64) -> ()
      %3271 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3272 = arith.constant 11 : i64
      %3273 = func.call @cc_make_string(%3271, %3272) : (!llvm.ptr, i64) -> i64
      %3274 = func.call @cc_nil_value() : () -> i64
      %3275 = func.call @cc_intern(%3273, %3274) : (i64, i64) -> i64
      %3276 = func.call @cc_nil_value() : () -> i64
      %3277 = func.call @cc_cons(%3275, %3276) : (i64, i64) -> i64
      %3278 = func.call @cc_values_pack(%3277) : (i64) -> i64
      func.call @stack_push_pointer(%3275) : (i64) -> ()
      %3279 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3279) : (i64) -> ()
      %3280 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3281 = arith.constant 9 : i64
      %3282 = func.call @cc_make_string(%3280, %3281) : (!llvm.ptr, i64) -> i64
      %3283 = func.call @cc_nil_value() : () -> i64
      %3284 = func.call @cc_intern(%3282, %3283) : (i64, i64) -> i64
      %3285 = func.call @cc_nil_value() : () -> i64
      %3286 = func.call @cc_cons(%3284, %3285) : (i64, i64) -> i64
      %3287 = func.call @cc_values_pack(%3286) : (i64) -> i64
      func.call @stack_push_pointer(%3284) : (i64) -> ()
      %3288 = func.call @stack_pop_pointer() : () -> i64
      %3289 = func.call @stack_pop_pointer() : () -> i64
      %3290 = func.call @cc_cons(%3288, %3289) : (i64, i64) -> i64
      %3291 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3292 = arith.constant 5 : i64
      %3293 = func.call @cc_make_string(%3291, %3292) : (!llvm.ptr, i64) -> i64
      %3294 = func.call @cc_nil_value() : () -> i64
      %3295 = func.call @cc_intern(%3293, %3294) : (i64, i64) -> i64
      %3296 = func.call @cc_nil_value() : () -> i64
      %3297 = func.call @cc_cons(%3295, %3296) : (i64, i64) -> i64
      %3298 = func.call @cc_values_pack(%3297) : (i64) -> i64
      %3299 = func.call @cc_cons(%3295, %3290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3300 = func.call @stack_pop_pointer() : () -> i64
      %3301 = func.call @stack_pop_pointer() : () -> i64
      %3302 = func.call @cc_cons(%3301, %3300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3302) : (i64) -> ()
      %3303 = func.call @stack_pop_pointer() : () -> i64
      %3304 = func.call @stack_pop_pointer() : () -> i64
      %3305 = func.call @cc_cons(%3304, %3303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3305) : (i64) -> ()
      %3306 = func.call @stack_pop_pointer() : () -> i64
      %3307 = func.call @stack_pop_pointer() : () -> i64
      %3308 = func.call @cc_cons(%3307, %3306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3308) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3309 = func.call @stack_pop_pointer() : () -> i64
      %3310 = func.call @stack_pop_pointer() : () -> i64
      %3311 = func.call @cc_cons(%3310, %3309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3311) : (i64) -> ()
      %3312 = func.call @stack_pop_pointer() : () -> i64
      %3313 = func.call @stack_pop_pointer() : () -> i64
      %3314 = func.call @cc_cons(%3313, %3312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3315 = func.call @stack_pop_pointer() : () -> i64
      %3316 = func.call @stack_pop_pointer() : () -> i64
      %3317 = func.call @cc_cons(%3316, %3315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3317) : (i64) -> ()
      %3318 = func.call @stack_pop_pointer() : () -> i64
      %3319 = func.call @stack_pop_pointer() : () -> i64
      %3320 = func.call @cc_cons(%3319, %3318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3320) : (i64) -> ()
      %3321 = func.call @stack_pop_pointer() : () -> i64
      %3322 = func.call @stack_pop_pointer() : () -> i64
      %3323 = func.call @cc_cons(%3322, %3321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3323) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3324 = func.call @stack_pop_pointer() : () -> i64
      %3325 = func.call @stack_pop_pointer() : () -> i64
      %3326 = func.call @cc_cons(%3325, %3324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3326) : (i64) -> ()
      %3327 = func.call @stack_pop_pointer() : () -> i64
      %3328 = func.call @stack_pop_pointer() : () -> i64
      %3329 = func.call @cc_cons(%3328, %3327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3329) : (i64) -> ()
      %3330 = func.call @stack_pop_pointer() : () -> i64
      %3394 = arith.constant 47863920853001 : i64
      %3395 = arith.constant 0 : i64
      %3396 = func.call @cc_make_closure(%3394, %3395) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3396) : (i64) -> ()
      %3397 = func.call @stack_pop_pointer() : () -> i64
      %3398 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3399 = arith.constant 4 : i64
      %3400 = func.call @cc_make_string(%3398, %3399) : (!llvm.ptr, i64) -> i64
      %3401 = func.call @cc_nil_value() : () -> i64
      %3402 = func.call @cc_intern(%3400, %3401) : (i64, i64) -> i64
      %3403 = func.call @cc_nil_value() : () -> i64
      %3404 = func.call @cc_cons(%3402, %3403) : (i64, i64) -> i64
      %3405 = func.call @cc_values_pack(%3404) : (i64) -> i64
      func.call @stack_push_pointer(%3402) : (i64) -> ()
      %3406 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3407 = arith.constant 13 : i64
      %3408 = func.call @cc_make_string(%3406, %3407) : (!llvm.ptr, i64) -> i64
      %3409 = func.call @cc_nil_value() : () -> i64
      %3410 = func.call @cc_intern(%3408, %3409) : (i64, i64) -> i64
      %3411 = func.call @cc_nil_value() : () -> i64
      %3412 = func.call @cc_cons(%3410, %3411) : (i64, i64) -> i64
      %3413 = func.call @cc_values_pack(%3412) : (i64) -> i64
      func.call @stack_push_pointer(%3410) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3414 = func.call @stack_pop_pointer() : () -> i64
      %3415 = func.call @stack_pop_pointer() : () -> i64
      %3416 = func.call @cc_cons(%3415, %3414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3416) : (i64) -> ()
      %3417 = func.call @stack_pop_pointer() : () -> i64
      %3418 = func.call @stack_pop_pointer() : () -> i64
      %3419 = func.call @cc_cons(%3418, %3417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3419) : (i64) -> ()
      %3420 = func.call @stack_pop_pointer() : () -> i64
      %3421 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3422 = arith.constant 11 : i64
      %3423 = func.call @cc_make_string(%3421, %3422) : (!llvm.ptr, i64) -> i64
      %3424 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3425 = arith.constant 7 : i64
      %3426 = func.call @cc_make_string(%3424, %3425) : (!llvm.ptr, i64) -> i64
      %3427 = func.call @cc_intern(%3423, %3426) : (i64, i64) -> i64
      %3428 = func.call @cc_nil_value() : () -> i64
      %3429 = func.call @cc_cons(%3427, %3428) : (i64, i64) -> i64
      %3430 = func.call @cc_values_pack(%3429) : (i64) -> i64
      func.call @stack_push_pointer(%3427) : (i64) -> ()
      %3431 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3432 = func.call @stack_pop_pointer() : () -> i64
      %3433 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3434 = arith.constant 4 : i64
      %3435 = func.call @cc_make_string(%3433, %3434) : (!llvm.ptr, i64) -> i64
      %3436 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3437 = arith.constant 7 : i64
      %3438 = func.call @cc_make_string(%3436, %3437) : (!llvm.ptr, i64) -> i64
      %3439 = func.call @cc_intern(%3435, %3438) : (i64, i64) -> i64
      %3440 = func.call @cc_nil_value() : () -> i64
      %3441 = func.call @cc_cons(%3439, %3440) : (i64, i64) -> i64
      %3442 = func.call @cc_values_pack(%3441) : (i64) -> i64
      func.call @stack_push_pointer(%3439) : (i64) -> ()
      %3443 = func.call @stack_pop_pointer() : () -> i64
      %3444 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3445 = arith.constant 5 : i64
      %3446 = func.call @cc_make_string(%3444, %3445) : (!llvm.ptr, i64) -> i64
      %3447 = func.call @cc_nil_value() : () -> i64
      %3448 = func.call @cc_intern(%3446, %3447) : (i64, i64) -> i64
      %3449 = func.call @cc_nil_value() : () -> i64
      %3450 = func.call @cc_cons(%3448, %3449) : (i64, i64) -> i64
      %3451 = func.call @cc_values_pack(%3450) : (i64) -> i64
      func.call @stack_push_pointer(%3448) : (i64) -> ()
      %3452 = func.call @stack_pop_pointer() : () -> i64
      %3453 = func.call @cc_nil_value() : () -> i64
      %3454 = func.call @cc_errorp(%3234) : (i64) -> i64
      %3455 = arith.cmpi ne, %3454, %3453 : i64
      %3456 = arith.cmpi eq, %3453, %3453 : i64
      %3457 = arith.andi %3455, %3456 : i1
      %3458 = scf.if %3457 -> (i64) {
        scf.yield %3234 : i64
      } else {
        scf.yield %3453 : i64
      }
      %3459 = func.call @cc_errorp(%3330) : (i64) -> i64
      %3460 = arith.cmpi ne, %3459, %3453 : i64
      %3461 = arith.cmpi eq, %3458, %3453 : i64
      %3462 = arith.andi %3460, %3461 : i1
      %3463 = scf.if %3462 -> (i64) {
        scf.yield %3330 : i64
      } else {
        scf.yield %3458 : i64
      }
      %3464 = func.call @cc_errorp(%3397) : (i64) -> i64
      %3465 = arith.cmpi ne, %3464, %3453 : i64
      %3466 = arith.cmpi eq, %3463, %3453 : i64
      %3467 = arith.andi %3465, %3466 : i1
      %3468 = scf.if %3467 -> (i64) {
        scf.yield %3397 : i64
      } else {
        scf.yield %3463 : i64
      }
      %3469 = func.call @cc_errorp(%3420) : (i64) -> i64
      %3470 = arith.cmpi ne, %3469, %3453 : i64
      %3471 = arith.cmpi eq, %3468, %3453 : i64
      %3472 = arith.andi %3470, %3471 : i1
      %3473 = scf.if %3472 -> (i64) {
        scf.yield %3420 : i64
      } else {
        scf.yield %3468 : i64
      }
      %3474 = func.call @cc_errorp(%3431) : (i64) -> i64
      %3475 = arith.cmpi ne, %3474, %3453 : i64
      %3476 = arith.cmpi eq, %3473, %3453 : i64
      %3477 = arith.andi %3475, %3476 : i1
      %3478 = scf.if %3477 -> (i64) {
        scf.yield %3431 : i64
      } else {
        scf.yield %3473 : i64
      }
      %3479 = func.call @cc_errorp(%3432) : (i64) -> i64
      %3480 = arith.cmpi ne, %3479, %3453 : i64
      %3481 = arith.cmpi eq, %3478, %3453 : i64
      %3482 = arith.andi %3480, %3481 : i1
      %3483 = scf.if %3482 -> (i64) {
        scf.yield %3432 : i64
      } else {
        scf.yield %3478 : i64
      }
      %3484 = func.call @cc_errorp(%3443) : (i64) -> i64
      %3485 = arith.cmpi ne, %3484, %3453 : i64
      %3486 = arith.cmpi eq, %3483, %3453 : i64
      %3487 = arith.andi %3485, %3486 : i1
      %3488 = scf.if %3487 -> (i64) {
        scf.yield %3443 : i64
      } else {
        scf.yield %3483 : i64
      }
      %3489 = func.call @cc_errorp(%3452) : (i64) -> i64
      %3490 = arith.cmpi ne, %3489, %3453 : i64
      %3491 = arith.cmpi eq, %3488, %3453 : i64
      %3492 = arith.andi %3490, %3491 : i1
      %3493 = scf.if %3492 -> (i64) {
        scf.yield %3452 : i64
      } else {
        scf.yield %3488 : i64
      }
      %3494 = arith.cmpi ne, %3493, %3453 : i64
      scf.if %3494 {
        func.call @stack_push_pointer(%3493) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3234) : (i64) -> ()
        func.call @stack_push_pointer(%3330) : (i64) -> ()
        func.call @stack_push_pointer(%3397) : (i64) -> ()
        func.call @stack_push_pointer(%3420) : (i64) -> ()
        func.call @stack_push_pointer(%3431) : (i64) -> ()
        func.call @stack_push_pointer(%3432) : (i64) -> ()
        func.call @stack_push_pointer(%3443) : (i64) -> ()
        func.call @stack_push_pointer(%3452) : (i64) -> ()
        %3495 = llvm.mlir.addressof @str313 : !llvm.ptr
        %3496 = func.call @cc_make_function_ref_const(%3495) : (!llvm.ptr) -> i64
        %3497 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3496, %3497) : (i64, i64) -> ()
      }
      %3498 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3498 : i64
    }
    %3499 = func.call @cc_nil_value() : () -> i64
    %3500 = func.call @cc_errorp(%3225) : (i64) -> i64
    %3501 = arith.cmpi ne, %3500, %3499 : i64
    %3502 = scf.if %3501 -> (i64) {
      scf.yield %3225 : i64
    } else {
      %3503 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3504 = arith.constant 13 : i64
      %3505 = func.call @cc_make_string(%3503, %3504) : (!llvm.ptr, i64) -> i64
      %3506 = func.call @cc_nil_value() : () -> i64
      %3507 = func.call @cc_intern(%3505, %3506) : (i64, i64) -> i64
      %3508 = func.call @cc_nil_value() : () -> i64
      %3509 = func.call @cc_cons(%3507, %3508) : (i64, i64) -> i64
      %3510 = func.call @cc_values_pack(%3509) : (i64) -> i64
      func.call @stack_push_pointer(%3507) : (i64) -> ()
      %3511 = func.call @stack_pop_pointer() : () -> i64
      %3512 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3513 = arith.constant 6 : i64
      %3514 = func.call @cc_make_string(%3512, %3513) : (!llvm.ptr, i64) -> i64
      %3515 = func.call @cc_nil_value() : () -> i64
      %3516 = func.call @cc_intern(%3514, %3515) : (i64, i64) -> i64
      %3517 = func.call @cc_nil_value() : () -> i64
      %3518 = func.call @cc_cons(%3516, %3517) : (i64, i64) -> i64
      %3519 = func.call @cc_values_pack(%3518) : (i64) -> i64
      func.call @stack_push_pointer(%3516) : (i64) -> ()
      %3520 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3521 = arith.constant 11 : i64
      %3522 = func.call @cc_make_string(%3520, %3521) : (!llvm.ptr, i64) -> i64
      %3523 = func.call @cc_nil_value() : () -> i64
      %3524 = func.call @cc_intern(%3522, %3523) : (i64, i64) -> i64
      %3525 = func.call @cc_nil_value() : () -> i64
      %3526 = func.call @cc_cons(%3524, %3525) : (i64, i64) -> i64
      %3527 = func.call @cc_values_pack(%3526) : (i64) -> i64
      func.call @stack_push_pointer(%3524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3528 = func.call @stack_pop_pointer() : () -> i64
      %3529 = func.call @stack_pop_pointer() : () -> i64
      %3530 = func.call @cc_cons(%3529, %3528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3530) : (i64) -> ()
      %3531 = func.call @stack_pop_pointer() : () -> i64
      %3532 = func.call @stack_pop_pointer() : () -> i64
      %3533 = func.call @cc_cons(%3532, %3531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3533) : (i64) -> ()
      %3534 = func.call @stack_pop_pointer() : () -> i64
      %3555 = arith.constant 47863920853002 : i64
      %3556 = arith.constant 0 : i64
      %3557 = func.call @cc_make_closure(%3555, %3556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3557) : (i64) -> ()
      %3558 = func.call @stack_pop_pointer() : () -> i64
      %3559 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3560 = arith.constant 9 : i64
      %3561 = func.call @cc_make_string(%3559, %3560) : (!llvm.ptr, i64) -> i64
      %3562 = func.call @cc_nil_value() : () -> i64
      %3563 = func.call @cc_intern(%3561, %3562) : (i64, i64) -> i64
      %3564 = func.call @cc_nil_value() : () -> i64
      %3565 = func.call @cc_cons(%3563, %3564) : (i64, i64) -> i64
      %3566 = func.call @cc_values_pack(%3565) : (i64) -> i64
      func.call @stack_push_pointer(%3563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3567 = func.call @stack_pop_pointer() : () -> i64
      %3568 = func.call @stack_pop_pointer() : () -> i64
      %3569 = func.call @cc_cons(%3568, %3567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3569) : (i64) -> ()
      %3570 = func.call @stack_pop_pointer() : () -> i64
      %3571 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3572 = arith.constant 11 : i64
      %3573 = func.call @cc_make_string(%3571, %3572) : (!llvm.ptr, i64) -> i64
      %3574 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3575 = arith.constant 7 : i64
      %3576 = func.call @cc_make_string(%3574, %3575) : (!llvm.ptr, i64) -> i64
      %3577 = func.call @cc_intern(%3573, %3576) : (i64, i64) -> i64
      %3578 = func.call @cc_nil_value() : () -> i64
      %3579 = func.call @cc_cons(%3577, %3578) : (i64, i64) -> i64
      %3580 = func.call @cc_values_pack(%3579) : (i64) -> i64
      func.call @stack_push_pointer(%3577) : (i64) -> ()
      %3581 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3584 = arith.constant 4 : i64
      %3585 = func.call @cc_make_string(%3583, %3584) : (!llvm.ptr, i64) -> i64
      %3586 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3587 = arith.constant 7 : i64
      %3588 = func.call @cc_make_string(%3586, %3587) : (!llvm.ptr, i64) -> i64
      %3589 = func.call @cc_intern(%3585, %3588) : (i64, i64) -> i64
      %3590 = func.call @cc_nil_value() : () -> i64
      %3591 = func.call @cc_cons(%3589, %3590) : (i64, i64) -> i64
      %3592 = func.call @cc_values_pack(%3591) : (i64) -> i64
      func.call @stack_push_pointer(%3589) : (i64) -> ()
      %3593 = func.call @stack_pop_pointer() : () -> i64
      %3594 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3595 = arith.constant 5 : i64
      %3596 = func.call @cc_make_string(%3594, %3595) : (!llvm.ptr, i64) -> i64
      %3597 = func.call @cc_nil_value() : () -> i64
      %3598 = func.call @cc_intern(%3596, %3597) : (i64, i64) -> i64
      %3599 = func.call @cc_nil_value() : () -> i64
      %3600 = func.call @cc_cons(%3598, %3599) : (i64, i64) -> i64
      %3601 = func.call @cc_values_pack(%3600) : (i64) -> i64
      func.call @stack_push_pointer(%3598) : (i64) -> ()
      %3602 = func.call @stack_pop_pointer() : () -> i64
      %3603 = func.call @cc_nil_value() : () -> i64
      %3604 = func.call @cc_errorp(%3511) : (i64) -> i64
      %3605 = arith.cmpi ne, %3604, %3603 : i64
      %3606 = arith.cmpi eq, %3603, %3603 : i64
      %3607 = arith.andi %3605, %3606 : i1
      %3608 = scf.if %3607 -> (i64) {
        scf.yield %3511 : i64
      } else {
        scf.yield %3603 : i64
      }
      %3609 = func.call @cc_errorp(%3534) : (i64) -> i64
      %3610 = arith.cmpi ne, %3609, %3603 : i64
      %3611 = arith.cmpi eq, %3608, %3603 : i64
      %3612 = arith.andi %3610, %3611 : i1
      %3613 = scf.if %3612 -> (i64) {
        scf.yield %3534 : i64
      } else {
        scf.yield %3608 : i64
      }
      %3614 = func.call @cc_errorp(%3558) : (i64) -> i64
      %3615 = arith.cmpi ne, %3614, %3603 : i64
      %3616 = arith.cmpi eq, %3613, %3603 : i64
      %3617 = arith.andi %3615, %3616 : i1
      %3618 = scf.if %3617 -> (i64) {
        scf.yield %3558 : i64
      } else {
        scf.yield %3613 : i64
      }
      %3619 = func.call @cc_errorp(%3570) : (i64) -> i64
      %3620 = arith.cmpi ne, %3619, %3603 : i64
      %3621 = arith.cmpi eq, %3618, %3603 : i64
      %3622 = arith.andi %3620, %3621 : i1
      %3623 = scf.if %3622 -> (i64) {
        scf.yield %3570 : i64
      } else {
        scf.yield %3618 : i64
      }
      %3624 = func.call @cc_errorp(%3581) : (i64) -> i64
      %3625 = arith.cmpi ne, %3624, %3603 : i64
      %3626 = arith.cmpi eq, %3623, %3603 : i64
      %3627 = arith.andi %3625, %3626 : i1
      %3628 = scf.if %3627 -> (i64) {
        scf.yield %3581 : i64
      } else {
        scf.yield %3623 : i64
      }
      %3629 = func.call @cc_errorp(%3582) : (i64) -> i64
      %3630 = arith.cmpi ne, %3629, %3603 : i64
      %3631 = arith.cmpi eq, %3628, %3603 : i64
      %3632 = arith.andi %3630, %3631 : i1
      %3633 = scf.if %3632 -> (i64) {
        scf.yield %3582 : i64
      } else {
        scf.yield %3628 : i64
      }
      %3634 = func.call @cc_errorp(%3593) : (i64) -> i64
      %3635 = arith.cmpi ne, %3634, %3603 : i64
      %3636 = arith.cmpi eq, %3633, %3603 : i64
      %3637 = arith.andi %3635, %3636 : i1
      %3638 = scf.if %3637 -> (i64) {
        scf.yield %3593 : i64
      } else {
        scf.yield %3633 : i64
      }
      %3639 = func.call @cc_errorp(%3602) : (i64) -> i64
      %3640 = arith.cmpi ne, %3639, %3603 : i64
      %3641 = arith.cmpi eq, %3638, %3603 : i64
      %3642 = arith.andi %3640, %3641 : i1
      %3643 = scf.if %3642 -> (i64) {
        scf.yield %3602 : i64
      } else {
        scf.yield %3638 : i64
      }
      %3644 = arith.cmpi ne, %3643, %3603 : i64
      scf.if %3644 {
        func.call @stack_push_pointer(%3643) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3511) : (i64) -> ()
        func.call @stack_push_pointer(%3534) : (i64) -> ()
        func.call @stack_push_pointer(%3558) : (i64) -> ()
        func.call @stack_push_pointer(%3570) : (i64) -> ()
        func.call @stack_push_pointer(%3581) : (i64) -> ()
        func.call @stack_push_pointer(%3582) : (i64) -> ()
        func.call @stack_push_pointer(%3593) : (i64) -> ()
        func.call @stack_push_pointer(%3602) : (i64) -> ()
        %3645 = llvm.mlir.addressof @str324 : !llvm.ptr
        %3646 = func.call @cc_make_function_ref_const(%3645) : (!llvm.ptr) -> i64
        %3647 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3646, %3647) : (i64, i64) -> ()
      }
      %3648 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3648 : i64
    }
    %3649 = func.call @cc_nil_value() : () -> i64
    %3650 = func.call @cc_errorp(%3502) : (i64) -> i64
    %3651 = arith.cmpi ne, %3650, %3649 : i64
    %3652 = scf.if %3651 -> (i64) {
      scf.yield %3502 : i64
    } else {
      %3653 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3654 = arith.constant 13 : i64
      %3655 = func.call @cc_make_string(%3653, %3654) : (!llvm.ptr, i64) -> i64
      %3656 = func.call @cc_nil_value() : () -> i64
      %3657 = func.call @cc_intern(%3655, %3656) : (i64, i64) -> i64
      %3658 = func.call @cc_nil_value() : () -> i64
      %3659 = func.call @cc_cons(%3657, %3658) : (i64, i64) -> i64
      %3660 = func.call @cc_values_pack(%3659) : (i64) -> i64
      func.call @stack_push_pointer(%3657) : (i64) -> ()
      %3661 = func.call @stack_pop_pointer() : () -> i64
      %3662 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3663 = arith.constant 13 : i64
      %3664 = func.call @cc_make_string(%3662, %3663) : (!llvm.ptr, i64) -> i64
      %3665 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3666 = arith.constant 11 : i64
      %3667 = func.call @cc_make_string(%3665, %3666) : (!llvm.ptr, i64) -> i64
      %3668 = func.call @cc_intern(%3664, %3667) : (i64, i64) -> i64
      %3669 = func.call @cc_nil_value() : () -> i64
      %3670 = func.call @cc_cons(%3668, %3669) : (i64, i64) -> i64
      %3671 = func.call @cc_values_pack(%3670) : (i64) -> i64
      func.call @stack_push_pointer(%3668) : (i64) -> ()
      %3672 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3673 = arith.constant 6 : i64
      %3674 = func.call @cc_make_string(%3672, %3673) : (!llvm.ptr, i64) -> i64
      %3675 = func.call @cc_nil_value() : () -> i64
      %3676 = func.call @cc_intern(%3674, %3675) : (i64, i64) -> i64
      %3677 = func.call @cc_nil_value() : () -> i64
      %3678 = func.call @cc_cons(%3676, %3677) : (i64, i64) -> i64
      %3679 = func.call @cc_values_pack(%3678) : (i64) -> i64
      func.call @stack_push_pointer(%3676) : (i64) -> ()
      %3680 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3681 = arith.constant 19 : i64
      %3682 = func.call @cc_make_string(%3680, %3681) : (!llvm.ptr, i64) -> i64
      %3683 = func.call @cc_nil_value() : () -> i64
      %3684 = func.call @cc_intern(%3682, %3683) : (i64, i64) -> i64
      %3685 = func.call @cc_nil_value() : () -> i64
      %3686 = func.call @cc_cons(%3684, %3685) : (i64, i64) -> i64
      %3687 = func.call @cc_values_pack(%3686) : (i64) -> i64
      func.call @stack_push_pointer(%3684) : (i64) -> ()
      %3688 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3689 = arith.constant 12 : i64
      %3690 = func.call @cc_make_string(%3688, %3689) : (!llvm.ptr, i64) -> i64
      %3691 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3692 = arith.constant 11 : i64
      %3693 = func.call @cc_make_string(%3691, %3692) : (!llvm.ptr, i64) -> i64
      %3694 = func.call @cc_intern(%3690, %3693) : (i64, i64) -> i64
      %3695 = func.call @cc_nil_value() : () -> i64
      %3696 = func.call @cc_cons(%3694, %3695) : (i64, i64) -> i64
      %3697 = func.call @cc_values_pack(%3696) : (i64) -> i64
      func.call @stack_push_pointer(%3694) : (i64) -> ()
      %3698 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3699 = arith.constant 11 : i64
      %3700 = func.call @cc_make_string(%3698, %3699) : (!llvm.ptr, i64) -> i64
      %3701 = func.call @cc_nil_value() : () -> i64
      %3702 = func.call @cc_intern(%3700, %3701) : (i64, i64) -> i64
      %3703 = func.call @cc_nil_value() : () -> i64
      %3704 = func.call @cc_cons(%3702, %3703) : (i64, i64) -> i64
      %3705 = func.call @cc_values_pack(%3704) : (i64) -> i64
      func.call @stack_push_pointer(%3702) : (i64) -> ()
      %3706 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3706) : (i64) -> ()
      %3707 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3708 = arith.constant 9 : i64
      %3709 = func.call @cc_make_string(%3707, %3708) : (!llvm.ptr, i64) -> i64
      %3710 = func.call @cc_nil_value() : () -> i64
      %3711 = func.call @cc_intern(%3709, %3710) : (i64, i64) -> i64
      %3712 = func.call @cc_nil_value() : () -> i64
      %3713 = func.call @cc_cons(%3711, %3712) : (i64, i64) -> i64
      %3714 = func.call @cc_values_pack(%3713) : (i64) -> i64
      func.call @stack_push_pointer(%3711) : (i64) -> ()
      %3715 = func.call @stack_pop_pointer() : () -> i64
      %3716 = func.call @stack_pop_pointer() : () -> i64
      %3717 = func.call @cc_cons(%3715, %3716) : (i64, i64) -> i64
      %3718 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3719 = arith.constant 5 : i64
      %3720 = func.call @cc_make_string(%3718, %3719) : (!llvm.ptr, i64) -> i64
      %3721 = func.call @cc_nil_value() : () -> i64
      %3722 = func.call @cc_intern(%3720, %3721) : (i64, i64) -> i64
      %3723 = func.call @cc_nil_value() : () -> i64
      %3724 = func.call @cc_cons(%3722, %3723) : (i64, i64) -> i64
      %3725 = func.call @cc_values_pack(%3724) : (i64) -> i64
      %3726 = func.call @cc_cons(%3722, %3717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3726) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3727 = func.call @stack_pop_pointer() : () -> i64
      %3728 = func.call @stack_pop_pointer() : () -> i64
      %3729 = func.call @cc_cons(%3728, %3727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3729) : (i64) -> ()
      %3730 = func.call @stack_pop_pointer() : () -> i64
      %3731 = func.call @stack_pop_pointer() : () -> i64
      %3732 = func.call @cc_cons(%3731, %3730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3732) : (i64) -> ()
      %3733 = func.call @stack_pop_pointer() : () -> i64
      %3734 = func.call @stack_pop_pointer() : () -> i64
      %3735 = func.call @cc_cons(%3734, %3733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3735) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3736 = func.call @stack_pop_pointer() : () -> i64
      %3737 = func.call @stack_pop_pointer() : () -> i64
      %3738 = func.call @cc_cons(%3737, %3736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3738) : (i64) -> ()
      %3739 = func.call @stack_pop_pointer() : () -> i64
      %3740 = func.call @stack_pop_pointer() : () -> i64
      %3741 = func.call @cc_cons(%3740, %3739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3741) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3742 = func.call @stack_pop_pointer() : () -> i64
      %3743 = func.call @stack_pop_pointer() : () -> i64
      %3744 = func.call @cc_cons(%3743, %3742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3744) : (i64) -> ()
      %3745 = func.call @stack_pop_pointer() : () -> i64
      %3746 = func.call @stack_pop_pointer() : () -> i64
      %3747 = func.call @cc_cons(%3746, %3745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3747) : (i64) -> ()
      %3748 = func.call @stack_pop_pointer() : () -> i64
      %3749 = func.call @stack_pop_pointer() : () -> i64
      %3750 = func.call @cc_cons(%3749, %3748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3751 = func.call @stack_pop_pointer() : () -> i64
      %3752 = func.call @stack_pop_pointer() : () -> i64
      %3753 = func.call @cc_cons(%3752, %3751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3753) : (i64) -> ()
      %3754 = func.call @stack_pop_pointer() : () -> i64
      %3755 = func.call @stack_pop_pointer() : () -> i64
      %3756 = func.call @cc_cons(%3755, %3754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3756) : (i64) -> ()
      %3757 = func.call @stack_pop_pointer() : () -> i64
      %3821 = arith.constant 47863920853003 : i64
      %3822 = arith.constant 0 : i64
      %3823 = func.call @cc_make_closure(%3821, %3822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      %3824 = func.call @stack_pop_pointer() : () -> i64
      %3825 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3826 = arith.constant 4 : i64
      %3827 = func.call @cc_make_string(%3825, %3826) : (!llvm.ptr, i64) -> i64
      %3828 = func.call @cc_nil_value() : () -> i64
      %3829 = func.call @cc_intern(%3827, %3828) : (i64, i64) -> i64
      %3830 = func.call @cc_nil_value() : () -> i64
      %3831 = func.call @cc_cons(%3829, %3830) : (i64, i64) -> i64
      %3832 = func.call @cc_values_pack(%3831) : (i64) -> i64
      func.call @stack_push_pointer(%3829) : (i64) -> ()
      %3833 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3834 = arith.constant 13 : i64
      %3835 = func.call @cc_make_string(%3833, %3834) : (!llvm.ptr, i64) -> i64
      %3836 = func.call @cc_nil_value() : () -> i64
      %3837 = func.call @cc_intern(%3835, %3836) : (i64, i64) -> i64
      %3838 = func.call @cc_nil_value() : () -> i64
      %3839 = func.call @cc_cons(%3837, %3838) : (i64, i64) -> i64
      %3840 = func.call @cc_values_pack(%3839) : (i64) -> i64
      func.call @stack_push_pointer(%3837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3841 = func.call @stack_pop_pointer() : () -> i64
      %3842 = func.call @stack_pop_pointer() : () -> i64
      %3843 = func.call @cc_cons(%3842, %3841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3843) : (i64) -> ()
      %3844 = func.call @stack_pop_pointer() : () -> i64
      %3845 = func.call @stack_pop_pointer() : () -> i64
      %3846 = func.call @cc_cons(%3845, %3844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3846) : (i64) -> ()
      %3847 = func.call @stack_pop_pointer() : () -> i64
      %3848 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3849 = arith.constant 11 : i64
      %3850 = func.call @cc_make_string(%3848, %3849) : (!llvm.ptr, i64) -> i64
      %3851 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3852 = arith.constant 7 : i64
      %3853 = func.call @cc_make_string(%3851, %3852) : (!llvm.ptr, i64) -> i64
      %3854 = func.call @cc_intern(%3850, %3853) : (i64, i64) -> i64
      %3855 = func.call @cc_nil_value() : () -> i64
      %3856 = func.call @cc_cons(%3854, %3855) : (i64, i64) -> i64
      %3857 = func.call @cc_values_pack(%3856) : (i64) -> i64
      func.call @stack_push_pointer(%3854) : (i64) -> ()
      %3858 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3859 = func.call @stack_pop_pointer() : () -> i64
      %3860 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3861 = arith.constant 4 : i64
      %3862 = func.call @cc_make_string(%3860, %3861) : (!llvm.ptr, i64) -> i64
      %3863 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3864 = arith.constant 7 : i64
      %3865 = func.call @cc_make_string(%3863, %3864) : (!llvm.ptr, i64) -> i64
      %3866 = func.call @cc_intern(%3862, %3865) : (i64, i64) -> i64
      %3867 = func.call @cc_nil_value() : () -> i64
      %3868 = func.call @cc_cons(%3866, %3867) : (i64, i64) -> i64
      %3869 = func.call @cc_values_pack(%3868) : (i64) -> i64
      func.call @stack_push_pointer(%3866) : (i64) -> ()
      %3870 = func.call @stack_pop_pointer() : () -> i64
      %3871 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3872 = arith.constant 5 : i64
      %3873 = func.call @cc_make_string(%3871, %3872) : (!llvm.ptr, i64) -> i64
      %3874 = func.call @cc_nil_value() : () -> i64
      %3875 = func.call @cc_intern(%3873, %3874) : (i64, i64) -> i64
      %3876 = func.call @cc_nil_value() : () -> i64
      %3877 = func.call @cc_cons(%3875, %3876) : (i64, i64) -> i64
      %3878 = func.call @cc_values_pack(%3877) : (i64) -> i64
      func.call @stack_push_pointer(%3875) : (i64) -> ()
      %3879 = func.call @stack_pop_pointer() : () -> i64
      %3880 = func.call @cc_nil_value() : () -> i64
      %3881 = func.call @cc_errorp(%3661) : (i64) -> i64
      %3882 = arith.cmpi ne, %3881, %3880 : i64
      %3883 = arith.cmpi eq, %3880, %3880 : i64
      %3884 = arith.andi %3882, %3883 : i1
      %3885 = scf.if %3884 -> (i64) {
        scf.yield %3661 : i64
      } else {
        scf.yield %3880 : i64
      }
      %3886 = func.call @cc_errorp(%3757) : (i64) -> i64
      %3887 = arith.cmpi ne, %3886, %3880 : i64
      %3888 = arith.cmpi eq, %3885, %3880 : i64
      %3889 = arith.andi %3887, %3888 : i1
      %3890 = scf.if %3889 -> (i64) {
        scf.yield %3757 : i64
      } else {
        scf.yield %3885 : i64
      }
      %3891 = func.call @cc_errorp(%3824) : (i64) -> i64
      %3892 = arith.cmpi ne, %3891, %3880 : i64
      %3893 = arith.cmpi eq, %3890, %3880 : i64
      %3894 = arith.andi %3892, %3893 : i1
      %3895 = scf.if %3894 -> (i64) {
        scf.yield %3824 : i64
      } else {
        scf.yield %3890 : i64
      }
      %3896 = func.call @cc_errorp(%3847) : (i64) -> i64
      %3897 = arith.cmpi ne, %3896, %3880 : i64
      %3898 = arith.cmpi eq, %3895, %3880 : i64
      %3899 = arith.andi %3897, %3898 : i1
      %3900 = scf.if %3899 -> (i64) {
        scf.yield %3847 : i64
      } else {
        scf.yield %3895 : i64
      }
      %3901 = func.call @cc_errorp(%3858) : (i64) -> i64
      %3902 = arith.cmpi ne, %3901, %3880 : i64
      %3903 = arith.cmpi eq, %3900, %3880 : i64
      %3904 = arith.andi %3902, %3903 : i1
      %3905 = scf.if %3904 -> (i64) {
        scf.yield %3858 : i64
      } else {
        scf.yield %3900 : i64
      }
      %3906 = func.call @cc_errorp(%3859) : (i64) -> i64
      %3907 = arith.cmpi ne, %3906, %3880 : i64
      %3908 = arith.cmpi eq, %3905, %3880 : i64
      %3909 = arith.andi %3907, %3908 : i1
      %3910 = scf.if %3909 -> (i64) {
        scf.yield %3859 : i64
      } else {
        scf.yield %3905 : i64
      }
      %3911 = func.call @cc_errorp(%3870) : (i64) -> i64
      %3912 = arith.cmpi ne, %3911, %3880 : i64
      %3913 = arith.cmpi eq, %3910, %3880 : i64
      %3914 = arith.andi %3912, %3913 : i1
      %3915 = scf.if %3914 -> (i64) {
        scf.yield %3870 : i64
      } else {
        scf.yield %3910 : i64
      }
      %3916 = func.call @cc_errorp(%3879) : (i64) -> i64
      %3917 = arith.cmpi ne, %3916, %3880 : i64
      %3918 = arith.cmpi eq, %3915, %3880 : i64
      %3919 = arith.andi %3917, %3918 : i1
      %3920 = scf.if %3919 -> (i64) {
        scf.yield %3879 : i64
      } else {
        scf.yield %3915 : i64
      }
      %3921 = arith.cmpi ne, %3920, %3880 : i64
      scf.if %3921 {
        func.call @stack_push_pointer(%3920) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3661) : (i64) -> ()
        func.call @stack_push_pointer(%3757) : (i64) -> ()
        func.call @stack_push_pointer(%3824) : (i64) -> ()
        func.call @stack_push_pointer(%3847) : (i64) -> ()
        func.call @stack_push_pointer(%3858) : (i64) -> ()
        func.call @stack_push_pointer(%3859) : (i64) -> ()
        func.call @stack_push_pointer(%3870) : (i64) -> ()
        func.call @stack_push_pointer(%3879) : (i64) -> ()
        %3922 = llvm.mlir.addressof @str344 : !llvm.ptr
        %3923 = func.call @cc_make_function_ref_const(%3922) : (!llvm.ptr) -> i64
        %3924 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3923, %3924) : (i64, i64) -> ()
      }
      %3925 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3925 : i64
    }
    %3926 = func.call @cc_nil_value() : () -> i64
    %3927 = func.call @cc_errorp(%3652) : (i64) -> i64
    %3928 = arith.cmpi ne, %3927, %3926 : i64
    %3929 = scf.if %3928 -> (i64) {
      scf.yield %3652 : i64
    } else {
      %3930 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3931 = arith.constant 13 : i64
      %3932 = func.call @cc_make_string(%3930, %3931) : (!llvm.ptr, i64) -> i64
      %3933 = func.call @cc_nil_value() : () -> i64
      %3934 = func.call @cc_intern(%3932, %3933) : (i64, i64) -> i64
      %3935 = func.call @cc_nil_value() : () -> i64
      %3936 = func.call @cc_cons(%3934, %3935) : (i64, i64) -> i64
      %3937 = func.call @cc_values_pack(%3936) : (i64) -> i64
      func.call @stack_push_pointer(%3934) : (i64) -> ()
      %3938 = func.call @stack_pop_pointer() : () -> i64
      %3939 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3940 = arith.constant 6 : i64
      %3941 = func.call @cc_make_string(%3939, %3940) : (!llvm.ptr, i64) -> i64
      %3942 = func.call @cc_nil_value() : () -> i64
      %3943 = func.call @cc_intern(%3941, %3942) : (i64, i64) -> i64
      %3944 = func.call @cc_nil_value() : () -> i64
      %3945 = func.call @cc_cons(%3943, %3944) : (i64, i64) -> i64
      %3946 = func.call @cc_values_pack(%3945) : (i64) -> i64
      func.call @stack_push_pointer(%3943) : (i64) -> ()
      %3947 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3948 = arith.constant 11 : i64
      %3949 = func.call @cc_make_string(%3947, %3948) : (!llvm.ptr, i64) -> i64
      %3950 = func.call @cc_nil_value() : () -> i64
      %3951 = func.call @cc_intern(%3949, %3950) : (i64, i64) -> i64
      %3952 = func.call @cc_nil_value() : () -> i64
      %3953 = func.call @cc_cons(%3951, %3952) : (i64, i64) -> i64
      %3954 = func.call @cc_values_pack(%3953) : (i64) -> i64
      func.call @stack_push_pointer(%3951) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3955 = func.call @stack_pop_pointer() : () -> i64
      %3956 = func.call @stack_pop_pointer() : () -> i64
      %3957 = func.call @cc_cons(%3956, %3955) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3957) : (i64) -> ()
      %3958 = func.call @stack_pop_pointer() : () -> i64
      %3959 = func.call @stack_pop_pointer() : () -> i64
      %3960 = func.call @cc_cons(%3959, %3958) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3960) : (i64) -> ()
      %3961 = func.call @stack_pop_pointer() : () -> i64
      %3982 = arith.constant 47863920853004 : i64
      %3983 = arith.constant 0 : i64
      %3984 = func.call @cc_make_closure(%3982, %3983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3984) : (i64) -> ()
      %3985 = func.call @stack_pop_pointer() : () -> i64
      %3986 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3987 = arith.constant 9 : i64
      %3988 = func.call @cc_make_string(%3986, %3987) : (!llvm.ptr, i64) -> i64
      %3989 = func.call @cc_nil_value() : () -> i64
      %3990 = func.call @cc_intern(%3988, %3989) : (i64, i64) -> i64
      %3991 = func.call @cc_nil_value() : () -> i64
      %3992 = func.call @cc_cons(%3990, %3991) : (i64, i64) -> i64
      %3993 = func.call @cc_values_pack(%3992) : (i64) -> i64
      func.call @stack_push_pointer(%3990) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3994 = func.call @stack_pop_pointer() : () -> i64
      %3995 = func.call @stack_pop_pointer() : () -> i64
      %3996 = func.call @cc_cons(%3995, %3994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3996) : (i64) -> ()
      %3997 = func.call @stack_pop_pointer() : () -> i64
      %3998 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3999 = arith.constant 11 : i64
      %4000 = func.call @cc_make_string(%3998, %3999) : (!llvm.ptr, i64) -> i64
      %4001 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4002 = arith.constant 7 : i64
      %4003 = func.call @cc_make_string(%4001, %4002) : (!llvm.ptr, i64) -> i64
      %4004 = func.call @cc_intern(%4000, %4003) : (i64, i64) -> i64
      %4005 = func.call @cc_nil_value() : () -> i64
      %4006 = func.call @cc_cons(%4004, %4005) : (i64, i64) -> i64
      %4007 = func.call @cc_values_pack(%4006) : (i64) -> i64
      func.call @stack_push_pointer(%4004) : (i64) -> ()
      %4008 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4009 = func.call @stack_pop_pointer() : () -> i64
      %4010 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4011 = arith.constant 4 : i64
      %4012 = func.call @cc_make_string(%4010, %4011) : (!llvm.ptr, i64) -> i64
      %4013 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4014 = arith.constant 7 : i64
      %4015 = func.call @cc_make_string(%4013, %4014) : (!llvm.ptr, i64) -> i64
      %4016 = func.call @cc_intern(%4012, %4015) : (i64, i64) -> i64
      %4017 = func.call @cc_nil_value() : () -> i64
      %4018 = func.call @cc_cons(%4016, %4017) : (i64, i64) -> i64
      %4019 = func.call @cc_values_pack(%4018) : (i64) -> i64
      func.call @stack_push_pointer(%4016) : (i64) -> ()
      %4020 = func.call @stack_pop_pointer() : () -> i64
      %4021 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4022 = arith.constant 5 : i64
      %4023 = func.call @cc_make_string(%4021, %4022) : (!llvm.ptr, i64) -> i64
      %4024 = func.call @cc_nil_value() : () -> i64
      %4025 = func.call @cc_intern(%4023, %4024) : (i64, i64) -> i64
      %4026 = func.call @cc_nil_value() : () -> i64
      %4027 = func.call @cc_cons(%4025, %4026) : (i64, i64) -> i64
      %4028 = func.call @cc_values_pack(%4027) : (i64) -> i64
      func.call @stack_push_pointer(%4025) : (i64) -> ()
      %4029 = func.call @stack_pop_pointer() : () -> i64
      %4030 = func.call @cc_nil_value() : () -> i64
      %4031 = func.call @cc_errorp(%3938) : (i64) -> i64
      %4032 = arith.cmpi ne, %4031, %4030 : i64
      %4033 = arith.cmpi eq, %4030, %4030 : i64
      %4034 = arith.andi %4032, %4033 : i1
      %4035 = scf.if %4034 -> (i64) {
        scf.yield %3938 : i64
      } else {
        scf.yield %4030 : i64
      }
      %4036 = func.call @cc_errorp(%3961) : (i64) -> i64
      %4037 = arith.cmpi ne, %4036, %4030 : i64
      %4038 = arith.cmpi eq, %4035, %4030 : i64
      %4039 = arith.andi %4037, %4038 : i1
      %4040 = scf.if %4039 -> (i64) {
        scf.yield %3961 : i64
      } else {
        scf.yield %4035 : i64
      }
      %4041 = func.call @cc_errorp(%3985) : (i64) -> i64
      %4042 = arith.cmpi ne, %4041, %4030 : i64
      %4043 = arith.cmpi eq, %4040, %4030 : i64
      %4044 = arith.andi %4042, %4043 : i1
      %4045 = scf.if %4044 -> (i64) {
        scf.yield %3985 : i64
      } else {
        scf.yield %4040 : i64
      }
      %4046 = func.call @cc_errorp(%3997) : (i64) -> i64
      %4047 = arith.cmpi ne, %4046, %4030 : i64
      %4048 = arith.cmpi eq, %4045, %4030 : i64
      %4049 = arith.andi %4047, %4048 : i1
      %4050 = scf.if %4049 -> (i64) {
        scf.yield %3997 : i64
      } else {
        scf.yield %4045 : i64
      }
      %4051 = func.call @cc_errorp(%4008) : (i64) -> i64
      %4052 = arith.cmpi ne, %4051, %4030 : i64
      %4053 = arith.cmpi eq, %4050, %4030 : i64
      %4054 = arith.andi %4052, %4053 : i1
      %4055 = scf.if %4054 -> (i64) {
        scf.yield %4008 : i64
      } else {
        scf.yield %4050 : i64
      }
      %4056 = func.call @cc_errorp(%4009) : (i64) -> i64
      %4057 = arith.cmpi ne, %4056, %4030 : i64
      %4058 = arith.cmpi eq, %4055, %4030 : i64
      %4059 = arith.andi %4057, %4058 : i1
      %4060 = scf.if %4059 -> (i64) {
        scf.yield %4009 : i64
      } else {
        scf.yield %4055 : i64
      }
      %4061 = func.call @cc_errorp(%4020) : (i64) -> i64
      %4062 = arith.cmpi ne, %4061, %4030 : i64
      %4063 = arith.cmpi eq, %4060, %4030 : i64
      %4064 = arith.andi %4062, %4063 : i1
      %4065 = scf.if %4064 -> (i64) {
        scf.yield %4020 : i64
      } else {
        scf.yield %4060 : i64
      }
      %4066 = func.call @cc_errorp(%4029) : (i64) -> i64
      %4067 = arith.cmpi ne, %4066, %4030 : i64
      %4068 = arith.cmpi eq, %4065, %4030 : i64
      %4069 = arith.andi %4067, %4068 : i1
      %4070 = scf.if %4069 -> (i64) {
        scf.yield %4029 : i64
      } else {
        scf.yield %4065 : i64
      }
      %4071 = arith.cmpi ne, %4070, %4030 : i64
      scf.if %4071 {
        func.call @stack_push_pointer(%4070) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3938) : (i64) -> ()
        func.call @stack_push_pointer(%3961) : (i64) -> ()
        func.call @stack_push_pointer(%3985) : (i64) -> ()
        func.call @stack_push_pointer(%3997) : (i64) -> ()
        func.call @stack_push_pointer(%4008) : (i64) -> ()
        func.call @stack_push_pointer(%4009) : (i64) -> ()
        func.call @stack_push_pointer(%4020) : (i64) -> ()
        func.call @stack_push_pointer(%4029) : (i64) -> ()
        %4072 = llvm.mlir.addressof @str355 : !llvm.ptr
        %4073 = func.call @cc_make_function_ref_const(%4072) : (!llvm.ptr) -> i64
        %4074 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4073, %4074) : (i64, i64) -> ()
      }
      %4075 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4075 : i64
    }
    %4076 = func.call @cc_nil_value() : () -> i64
    %4077 = func.call @cc_errorp(%3929) : (i64) -> i64
    %4078 = arith.cmpi ne, %4077, %4076 : i64
    %4079 = scf.if %4078 -> (i64) {
      scf.yield %3929 : i64
    } else {
      %4083 = llvm.mlir.addressof @method_name_47863920853005 : !llvm.ptr
      %4084 = func.call @cc_make_lambda_ref_str(%4083) : (!llvm.ptr) -> i64
      %4085 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4086 = arith.constant 35 : i64
      %4087 = func.call @cc_make_string(%4085, %4086) : (!llvm.ptr, i64) -> i64
      %4088 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4089 = arith.constant 11 : i64
      %4090 = func.call @cc_make_string(%4088, %4089) : (!llvm.ptr, i64) -> i64
      %4091 = func.call @cc_intern(%4087, %4090) : (i64, i64) -> i64
      %4092 = func.call @cc_nil_value() : () -> i64
      %4093 = func.call @cc_cons(%4091, %4092) : (i64, i64) -> i64
      %4094 = func.call @cc_values_pack(%4093) : (i64) -> i64
      %4095 = func.call @cc_nil() : () -> i64
      %4096 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4097 = arith.constant 1 : i64
      %4098 = func.call @cc_make_string(%4096, %4097) : (!llvm.ptr, i64) -> i64
      %4099 = func.call @cc_nil_value() : () -> i64
      %4100 = func.call @cc_intern(%4098, %4099) : (i64, i64) -> i64
      %4101 = func.call @cc_nil_value() : () -> i64
      %4102 = func.call @cc_cons(%4100, %4101) : (i64, i64) -> i64
      %4103 = func.call @cc_values_pack(%4102) : (i64) -> i64
      %4104 = func.call @cc_cons(%4100, %4095) : (i64, i64) -> i64
      %4105 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4106 = arith.constant 1 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = func.call @cc_nil_value() : () -> i64
      %4109 = func.call @cc_intern(%4107, %4108) : (i64, i64) -> i64
      %4110 = func.call @cc_nil_value() : () -> i64
      %4111 = func.call @cc_cons(%4109, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_values_pack(%4111) : (i64) -> i64
      %4113 = func.call @cc_cons(%4109, %4104) : (i64, i64) -> i64
      %4114 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4115 = arith.constant 9 : i64
      %4116 = func.call @cc_make_string(%4114, %4115) : (!llvm.ptr, i64) -> i64
      %4117 = func.call @cc_nil_value() : () -> i64
      %4118 = func.call @cc_intern(%4116, %4117) : (i64, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_cons(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_values_pack(%4120) : (i64) -> i64
      %4122 = func.call @cc_cons(%4118, %4113) : (i64, i64) -> i64
      %4123 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4124 = arith.constant 9 : i64
      %4125 = func.call @cc_make_string(%4123, %4124) : (!llvm.ptr, i64) -> i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_intern(%4125, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_nil_value() : () -> i64
      %4129 = func.call @cc_cons(%4127, %4128) : (i64, i64) -> i64
      %4130 = func.call @cc_values_pack(%4129) : (i64) -> i64
      %4131 = func.call @cc_cons(%4127, %4122) : (i64, i64) -> i64
      %4132 = arith.constant 4 : i64
      %4133 = func.call @cc_box_fixnum(%4132) : (i64) -> i64
      %4134 = arith.constant 1 : i64
      %4135 = func.call @cc_defmethod_qualified(%4091, %4131, %4084, %4133, %4134) : (i64, i64, i64, i64, i64) -> i64
      %4136 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4136) : (i64) -> ()
      %4137 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4137) : (i64) -> ()
      %4138 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4139 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4140 = arith.constant 8 : i64
      %4141 = func.call @cc_make_string(%4139, %4140) : (!llvm.ptr, i64) -> i64
      %4142 = func.call @cc_nil_value() : () -> i64
      %4143 = func.call @cc_intern(%4141, %4142) : (i64, i64) -> i64
      %4144 = func.call @cc_nil_value() : () -> i64
      %4145 = func.call @cc_cons(%4143, %4144) : (i64, i64) -> i64
      %4146 = func.call @cc_values_pack(%4145) : (i64) -> i64
      func.call @stack_push_pointer(%4143) : (i64) -> ()
      %4147 = func.call @stack_pop_pointer() : () -> i64
      %4148 = func.call @stack_pop_pointer() : () -> i64
      %4149 = func.call @cc_cons(%4147, %4148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4149) : (i64) -> ()
      %4150 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4151 = arith.constant 6 : i64
      %4152 = func.call @cc_make_string(%4150, %4151) : (!llvm.ptr, i64) -> i64
      %4153 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4154 = arith.constant 11 : i64
      %4155 = func.call @cc_make_string(%4153, %4154) : (!llvm.ptr, i64) -> i64
      %4156 = func.call @cc_intern(%4152, %4155) : (i64, i64) -> i64
      %4157 = func.call @cc_nil_value() : () -> i64
      %4158 = func.call @cc_cons(%4156, %4157) : (i64, i64) -> i64
      %4159 = func.call @cc_values_pack(%4158) : (i64) -> i64
      func.call @stack_push_pointer(%4156) : (i64) -> ()
      %4160 = func.call @stack_pop_pointer() : () -> i64
      %4161 = func.call @stack_pop_pointer() : () -> i64
      %4162 = func.call @cc_cons(%4160, %4161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4162) : (i64) -> ()
      %4163 = func.call @stack_pop_pointer() : () -> i64
      %4164 = func.call @stack_pop_pointer() : () -> i64
      %4165 = func.call @cc_cons(%4163, %4164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4165) : (i64) -> ()
      %4166 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4167 = arith.constant 7 : i64
      %4168 = func.call @cc_make_string(%4166, %4167) : (!llvm.ptr, i64) -> i64
      %4169 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4170 = arith.constant 11 : i64
      %4171 = func.call @cc_make_string(%4169, %4170) : (!llvm.ptr, i64) -> i64
      %4172 = func.call @cc_intern(%4168, %4171) : (i64, i64) -> i64
      %4173 = func.call @cc_nil_value() : () -> i64
      %4174 = func.call @cc_cons(%4172, %4173) : (i64, i64) -> i64
      %4175 = func.call @cc_values_pack(%4174) : (i64) -> i64
      func.call @stack_push_pointer(%4172) : (i64) -> ()
      %4176 = func.call @stack_pop_pointer() : () -> i64
      %4177 = func.call @stack_pop_pointer() : () -> i64
      %4178 = func.call @cc_cons(%4176, %4177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4178) : (i64) -> ()
      %4179 = func.call @stack_pop_pointer() : () -> i64
      %4180 = func.call @stack_pop_pointer() : () -> i64
      %4181 = func.call @cc_cons(%4179, %4180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4181) : (i64) -> ()
      %4182 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4182) : (i64) -> ()
      %4183 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4184 = arith.constant 8 : i64
      %4185 = func.call @cc_make_string(%4183, %4184) : (!llvm.ptr, i64) -> i64
      %4186 = func.call @cc_nil_value() : () -> i64
      %4187 = func.call @cc_intern(%4185, %4186) : (i64, i64) -> i64
      %4188 = func.call @cc_nil_value() : () -> i64
      %4189 = func.call @cc_cons(%4187, %4188) : (i64, i64) -> i64
      %4190 = func.call @cc_values_pack(%4189) : (i64) -> i64
      func.call @stack_push_pointer(%4187) : (i64) -> ()
      %4191 = func.call @stack_pop_pointer() : () -> i64
      %4192 = func.call @stack_pop_pointer() : () -> i64
      %4193 = func.call @cc_cons(%4191, %4192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4193) : (i64) -> ()
      %4194 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4195 = arith.constant 5 : i64
      %4196 = func.call @cc_make_string(%4194, %4195) : (!llvm.ptr, i64) -> i64
      %4197 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4198 = arith.constant 11 : i64
      %4199 = func.call @cc_make_string(%4197, %4198) : (!llvm.ptr, i64) -> i64
      %4200 = func.call @cc_intern(%4196, %4199) : (i64, i64) -> i64
      %4201 = func.call @cc_nil_value() : () -> i64
      %4202 = func.call @cc_cons(%4200, %4201) : (i64, i64) -> i64
      %4203 = func.call @cc_values_pack(%4202) : (i64) -> i64
      func.call @stack_push_pointer(%4200) : (i64) -> ()
      %4204 = func.call @stack_pop_pointer() : () -> i64
      %4205 = func.call @stack_pop_pointer() : () -> i64
      %4206 = func.call @cc_cons(%4204, %4205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4206) : (i64) -> ()
      %4207 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4207) : (i64) -> ()
      %4208 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4209 = arith.constant 9 : i64
      %4210 = func.call @cc_make_string(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = func.call @cc_nil_value() : () -> i64
      %4212 = func.call @cc_intern(%4210, %4211) : (i64, i64) -> i64
      %4213 = func.call @cc_nil_value() : () -> i64
      %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
      %4215 = func.call @cc_values_pack(%4214) : (i64) -> i64
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4216 = func.call @stack_pop_pointer() : () -> i64
      %4217 = func.call @stack_pop_pointer() : () -> i64
      %4218 = func.call @cc_cons(%4216, %4217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4218) : (i64) -> ()
      %4219 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4220 = arith.constant 3 : i64
      %4221 = func.call @cc_make_string(%4219, %4220) : (!llvm.ptr, i64) -> i64
      %4222 = func.call @cc_nil_value() : () -> i64
      %4223 = func.call @cc_intern(%4221, %4222) : (i64, i64) -> i64
      %4224 = func.call @cc_nil_value() : () -> i64
      %4225 = func.call @cc_cons(%4223, %4224) : (i64, i64) -> i64
      %4226 = func.call @cc_values_pack(%4225) : (i64) -> i64
      func.call @stack_push_pointer(%4223) : (i64) -> ()
      %4227 = func.call @stack_pop_pointer() : () -> i64
      %4228 = func.call @stack_pop_pointer() : () -> i64
      %4229 = func.call @cc_cons(%4227, %4228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4229) : (i64) -> ()
      %4230 = func.call @stack_pop_pointer() : () -> i64
      %4231 = func.call @stack_pop_pointer() : () -> i64
      %4232 = func.call @cc_cons(%4230, %4231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4232) : (i64) -> ()
      %4233 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4233) : (i64) -> ()
      %4234 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4235 = arith.constant 9 : i64
      %4236 = func.call @cc_make_string(%4234, %4235) : (!llvm.ptr, i64) -> i64
      %4237 = func.call @cc_nil_value() : () -> i64
      %4238 = func.call @cc_intern(%4236, %4237) : (i64, i64) -> i64
      %4239 = func.call @cc_nil_value() : () -> i64
      %4240 = func.call @cc_cons(%4238, %4239) : (i64, i64) -> i64
      %4241 = func.call @cc_values_pack(%4240) : (i64) -> i64
      func.call @stack_push_pointer(%4238) : (i64) -> ()
      %4242 = func.call @stack_pop_pointer() : () -> i64
      %4243 = func.call @stack_pop_pointer() : () -> i64
      %4244 = func.call @cc_cons(%4242, %4243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4244) : (i64) -> ()
      %4245 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4246 = arith.constant 3 : i64
      %4247 = func.call @cc_make_string(%4245, %4246) : (!llvm.ptr, i64) -> i64
      %4248 = func.call @cc_nil_value() : () -> i64
      %4249 = func.call @cc_intern(%4247, %4248) : (i64, i64) -> i64
      %4250 = func.call @cc_nil_value() : () -> i64
      %4251 = func.call @cc_cons(%4249, %4250) : (i64, i64) -> i64
      %4252 = func.call @cc_values_pack(%4251) : (i64) -> i64
      func.call @stack_push_pointer(%4249) : (i64) -> ()
      %4253 = func.call @stack_pop_pointer() : () -> i64
      %4254 = func.call @stack_pop_pointer() : () -> i64
      %4255 = func.call @cc_cons(%4253, %4254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4255) : (i64) -> ()
      %4256 = func.call @stack_pop_pointer() : () -> i64
      %4257 = func.call @stack_pop_pointer() : () -> i64
      %4258 = func.call @cc_cons(%4256, %4257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4258) : (i64) -> ()
      %4259 = func.call @stack_pop_pointer() : () -> i64
      %4260 = func.call @stack_pop_pointer() : () -> i64
      %4261 = func.call @cc_cons(%4259, %4260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4261) : (i64) -> ()
      %4262 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4263 = arith.constant 6 : i64
      %4264 = func.call @cc_make_string(%4262, %4263) : (!llvm.ptr, i64) -> i64
      %4265 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4266 = arith.constant 7 : i64
      %4267 = func.call @cc_make_string(%4265, %4266) : (!llvm.ptr, i64) -> i64
      %4268 = func.call @cc_intern(%4264, %4267) : (i64, i64) -> i64
      %4269 = func.call @cc_nil_value() : () -> i64
      %4270 = func.call @cc_cons(%4268, %4269) : (i64, i64) -> i64
      %4271 = func.call @cc_values_pack(%4270) : (i64) -> i64
      func.call @stack_push_pointer(%4268) : (i64) -> ()
      %4272 = func.call @stack_pop_pointer() : () -> i64
      %4273 = func.call @stack_pop_pointer() : () -> i64
      %4274 = func.call @cc_cons(%4272, %4273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4274) : (i64) -> ()
      %4275 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4276 = arith.constant 35 : i64
      %4277 = func.call @cc_make_string(%4275, %4276) : (!llvm.ptr, i64) -> i64
      %4278 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4279 = arith.constant 11 : i64
      %4280 = func.call @cc_make_string(%4278, %4279) : (!llvm.ptr, i64) -> i64
      %4281 = func.call @cc_intern(%4277, %4280) : (i64, i64) -> i64
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_cons(%4281, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_values_pack(%4283) : (i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      %4285 = func.call @stack_pop_pointer() : () -> i64
      %4286 = func.call @stack_pop_pointer() : () -> i64
      %4287 = func.call @cc_cons(%4285, %4286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4287) : (i64) -> ()
      %4288 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4289 = arith.constant 9 : i64
      %4290 = func.call @cc_make_string(%4288, %4289) : (!llvm.ptr, i64) -> i64
      %4291 = func.call @cc_nil_value() : () -> i64
      %4292 = func.call @cc_intern(%4290, %4291) : (i64, i64) -> i64
      %4293 = func.call @cc_nil_value() : () -> i64
      %4294 = func.call @cc_cons(%4292, %4293) : (i64, i64) -> i64
      %4295 = func.call @cc_values_pack(%4294) : (i64) -> i64
      func.call @stack_push_pointer(%4292) : (i64) -> ()
      %4296 = func.call @stack_pop_pointer() : () -> i64
      %4297 = func.call @stack_pop_pointer() : () -> i64
      %4298 = func.call @cc_cons(%4296, %4297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4298) : (i64) -> ()
      %4299 = func.call @stack_pop_pointer() : () -> i64
      %4300 = func.call @cc_nil_value() : () -> i64
      %4301 = func.call @cc_cons(%4299, %4300) : (i64, i64) -> i64
      %4302 = func.call @cc_eval(%4301) : (i64) -> i64
      %4303 = func.call @cc_multiple_value_list(%4302) : (i64) -> i64
      %4304 = func.call @cc_values_pack(%4303) : (i64) -> i64
      func.call @stack_push_pointer(%4304) : (i64) -> ()
      %4305 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4305 : i64
    }
    %4306 = func.call @cc_nil_value() : () -> i64
    %4307 = func.call @cc_errorp(%4079) : (i64) -> i64
    %4308 = arith.cmpi ne, %4307, %4306 : i64
    %4309 = scf.if %4308 -> (i64) {
      scf.yield %4079 : i64
    } else {
      %4310 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4311 = arith.constant 13 : i64
      %4312 = func.call @cc_make_string(%4310, %4311) : (!llvm.ptr, i64) -> i64
      %4313 = func.call @cc_nil_value() : () -> i64
      %4314 = func.call @cc_intern(%4312, %4313) : (i64, i64) -> i64
      %4315 = func.call @cc_nil_value() : () -> i64
      %4316 = func.call @cc_cons(%4314, %4315) : (i64, i64) -> i64
      %4317 = func.call @cc_values_pack(%4316) : (i64) -> i64
      func.call @stack_push_pointer(%4314) : (i64) -> ()
      %4318 = func.call @stack_pop_pointer() : () -> i64
      %4319 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4320 = arith.constant 5 : i64
      %4321 = func.call @cc_make_string(%4319, %4320) : (!llvm.ptr, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_intern(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_nil_value() : () -> i64
      %4325 = func.call @cc_cons(%4323, %4324) : (i64, i64) -> i64
      %4326 = func.call @cc_values_pack(%4325) : (i64) -> i64
      func.call @stack_push_pointer(%4323) : (i64) -> ()
      %4327 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4328 = arith.constant 12 : i64
      %4329 = func.call @cc_make_string(%4327, %4328) : (!llvm.ptr, i64) -> i64
      %4330 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4331 = arith.constant 11 : i64
      %4332 = func.call @cc_make_string(%4330, %4331) : (!llvm.ptr, i64) -> i64
      %4333 = func.call @cc_intern(%4329, %4332) : (i64, i64) -> i64
      %4334 = func.call @cc_nil_value() : () -> i64
      %4335 = func.call @cc_cons(%4333, %4334) : (i64, i64) -> i64
      %4336 = func.call @cc_values_pack(%4335) : (i64) -> i64
      func.call @stack_push_pointer(%4333) : (i64) -> ()
      %4337 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4338 = arith.constant 11 : i64
      %4339 = func.call @cc_make_string(%4337, %4338) : (!llvm.ptr, i64) -> i64
      %4340 = func.call @cc_nil_value() : () -> i64
      %4341 = func.call @cc_intern(%4339, %4340) : (i64, i64) -> i64
      %4342 = func.call @cc_nil_value() : () -> i64
      %4343 = func.call @cc_cons(%4341, %4342) : (i64, i64) -> i64
      %4344 = func.call @cc_values_pack(%4343) : (i64) -> i64
      func.call @stack_push_pointer(%4341) : (i64) -> ()
      %4345 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4345) : (i64) -> ()
      %4346 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4347 = arith.constant 9 : i64
      %4348 = func.call @cc_make_string(%4346, %4347) : (!llvm.ptr, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_intern(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_nil_value() : () -> i64
      %4352 = func.call @cc_cons(%4350, %4351) : (i64, i64) -> i64
      %4353 = func.call @cc_values_pack(%4352) : (i64) -> i64
      func.call @stack_push_pointer(%4350) : (i64) -> ()
      %4354 = func.call @stack_pop_pointer() : () -> i64
      %4355 = func.call @stack_pop_pointer() : () -> i64
      %4356 = func.call @cc_cons(%4354, %4355) : (i64, i64) -> i64
      %4357 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4358 = arith.constant 5 : i64
      %4359 = func.call @cc_make_string(%4357, %4358) : (!llvm.ptr, i64) -> i64
      %4360 = func.call @cc_nil_value() : () -> i64
      %4361 = func.call @cc_intern(%4359, %4360) : (i64, i64) -> i64
      %4362 = func.call @cc_nil_value() : () -> i64
      %4363 = func.call @cc_cons(%4361, %4362) : (i64, i64) -> i64
      %4364 = func.call @cc_values_pack(%4363) : (i64) -> i64
      %4365 = func.call @cc_cons(%4361, %4356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4365) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4366 = func.call @stack_pop_pointer() : () -> i64
      %4367 = func.call @stack_pop_pointer() : () -> i64
      %4368 = func.call @cc_cons(%4367, %4366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4368) : (i64) -> ()
      %4369 = func.call @stack_pop_pointer() : () -> i64
      %4370 = func.call @stack_pop_pointer() : () -> i64
      %4371 = func.call @cc_cons(%4370, %4369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4371) : (i64) -> ()
      %4372 = func.call @stack_pop_pointer() : () -> i64
      %4373 = func.call @stack_pop_pointer() : () -> i64
      %4374 = func.call @cc_cons(%4373, %4372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4374) : (i64) -> ()
      %4375 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4376 = arith.constant 10 : i64
      %4377 = func.call @cc_make_string(%4375, %4376) : (!llvm.ptr, i64) -> i64
      %4378 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4379 = arith.constant 11 : i64
      %4380 = func.call @cc_make_string(%4378, %4379) : (!llvm.ptr, i64) -> i64
      %4381 = func.call @cc_intern(%4377, %4380) : (i64, i64) -> i64
      %4382 = func.call @cc_nil_value() : () -> i64
      %4383 = func.call @cc_cons(%4381, %4382) : (i64, i64) -> i64
      %4384 = func.call @cc_values_pack(%4383) : (i64) -> i64
      func.call @stack_push_pointer(%4381) : (i64) -> ()
      %4385 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4386 = arith.constant 11 : i64
      %4387 = func.call @cc_make_string(%4385, %4386) : (!llvm.ptr, i64) -> i64
      %4388 = func.call @cc_nil_value() : () -> i64
      %4389 = func.call @cc_intern(%4387, %4388) : (i64, i64) -> i64
      %4390 = func.call @cc_nil_value() : () -> i64
      %4391 = func.call @cc_cons(%4389, %4390) : (i64, i64) -> i64
      %4392 = func.call @cc_values_pack(%4391) : (i64) -> i64
      func.call @stack_push_pointer(%4389) : (i64) -> ()
      %4393 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4393) : (i64) -> ()
      %4394 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4395 = arith.constant 4 : i64
      %4396 = func.call @cc_make_string(%4394, %4395) : (!llvm.ptr, i64) -> i64
      %4397 = func.call @cc_nil_value() : () -> i64
      %4398 = func.call @cc_intern(%4396, %4397) : (i64, i64) -> i64
      %4399 = func.call @cc_nil_value() : () -> i64
      %4400 = func.call @cc_cons(%4398, %4399) : (i64, i64) -> i64
      %4401 = func.call @cc_values_pack(%4400) : (i64) -> i64
      func.call @stack_push_pointer(%4398) : (i64) -> ()
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = func.call @stack_pop_pointer() : () -> i64
      %4404 = func.call @cc_cons(%4402, %4403) : (i64, i64) -> i64
      %4405 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4406 = arith.constant 5 : i64
      %4407 = func.call @cc_make_string(%4405, %4406) : (!llvm.ptr, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_intern(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_nil_value() : () -> i64
      %4411 = func.call @cc_cons(%4409, %4410) : (i64, i64) -> i64
      %4412 = func.call @cc_values_pack(%4411) : (i64) -> i64
      %4413 = func.call @cc_cons(%4409, %4404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4414 = func.call @stack_pop_pointer() : () -> i64
      %4415 = func.call @stack_pop_pointer() : () -> i64
      %4416 = func.call @cc_cons(%4415, %4414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4416) : (i64) -> ()
      %4417 = func.call @stack_pop_pointer() : () -> i64
      %4418 = func.call @stack_pop_pointer() : () -> i64
      %4419 = func.call @cc_cons(%4418, %4417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4419) : (i64) -> ()
      %4420 = func.call @stack_pop_pointer() : () -> i64
      %4421 = func.call @stack_pop_pointer() : () -> i64
      %4422 = func.call @cc_cons(%4421, %4420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4423 = func.call @stack_pop_pointer() : () -> i64
      %4424 = func.call @stack_pop_pointer() : () -> i64
      %4425 = func.call @cc_cons(%4424, %4423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4425) : (i64) -> ()
      %4426 = func.call @stack_pop_pointer() : () -> i64
      %4427 = func.call @stack_pop_pointer() : () -> i64
      %4428 = func.call @cc_cons(%4427, %4426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4428) : (i64) -> ()
      %4429 = func.call @stack_pop_pointer() : () -> i64
      %4430 = func.call @stack_pop_pointer() : () -> i64
      %4431 = func.call @cc_cons(%4430, %4429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4431) : (i64) -> ()
      %4432 = func.call @stack_pop_pointer() : () -> i64
      %4504 = arith.constant 47863920853006 : i64
      %4505 = arith.constant 0 : i64
      %4506 = func.call @cc_make_closure(%4504, %4505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4506) : (i64) -> ()
      %4507 = func.call @stack_pop_pointer() : () -> i64
      %4508 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%4508) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @stack_pop_pointer() : () -> i64
      %4511 = func.call @cc_cons(%4510, %4509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4511) : (i64) -> ()
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4514 = arith.constant 11 : i64
      %4515 = func.call @cc_make_string(%4513, %4514) : (!llvm.ptr, i64) -> i64
      %4516 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4517 = arith.constant 7 : i64
      %4518 = func.call @cc_make_string(%4516, %4517) : (!llvm.ptr, i64) -> i64
      %4519 = func.call @cc_intern(%4515, %4518) : (i64, i64) -> i64
      %4520 = func.call @cc_nil_value() : () -> i64
      %4521 = func.call @cc_cons(%4519, %4520) : (i64, i64) -> i64
      %4522 = func.call @cc_values_pack(%4521) : (i64) -> i64
      func.call @stack_push_pointer(%4519) : (i64) -> ()
      %4523 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4524 = func.call @stack_pop_pointer() : () -> i64
      %4525 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4526 = arith.constant 4 : i64
      %4527 = func.call @cc_make_string(%4525, %4526) : (!llvm.ptr, i64) -> i64
      %4528 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4529 = arith.constant 7 : i64
      %4530 = func.call @cc_make_string(%4528, %4529) : (!llvm.ptr, i64) -> i64
      %4531 = func.call @cc_intern(%4527, %4530) : (i64, i64) -> i64
      %4532 = func.call @cc_nil_value() : () -> i64
      %4533 = func.call @cc_cons(%4531, %4532) : (i64, i64) -> i64
      %4534 = func.call @cc_values_pack(%4533) : (i64) -> i64
      func.call @stack_push_pointer(%4531) : (i64) -> ()
      %4535 = func.call @stack_pop_pointer() : () -> i64
      %4536 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4537 = arith.constant 6 : i64
      %4538 = func.call @cc_make_string(%4536, %4537) : (!llvm.ptr, i64) -> i64
      %4539 = func.call @cc_nil_value() : () -> i64
      %4540 = func.call @cc_intern(%4538, %4539) : (i64, i64) -> i64
      %4541 = func.call @cc_nil_value() : () -> i64
      %4542 = func.call @cc_cons(%4540, %4541) : (i64, i64) -> i64
      %4543 = func.call @cc_values_pack(%4542) : (i64) -> i64
      func.call @stack_push_pointer(%4540) : (i64) -> ()
      %4544 = func.call @stack_pop_pointer() : () -> i64
      %4545 = func.call @cc_nil_value() : () -> i64
      %4546 = func.call @cc_errorp(%4318) : (i64) -> i64
      %4547 = arith.cmpi ne, %4546, %4545 : i64
      %4548 = arith.cmpi eq, %4545, %4545 : i64
      %4549 = arith.andi %4547, %4548 : i1
      %4550 = scf.if %4549 -> (i64) {
        scf.yield %4318 : i64
      } else {
        scf.yield %4545 : i64
      }
      %4551 = func.call @cc_errorp(%4432) : (i64) -> i64
      %4552 = arith.cmpi ne, %4551, %4545 : i64
      %4553 = arith.cmpi eq, %4550, %4545 : i64
      %4554 = arith.andi %4552, %4553 : i1
      %4555 = scf.if %4554 -> (i64) {
        scf.yield %4432 : i64
      } else {
        scf.yield %4550 : i64
      }
      %4556 = func.call @cc_errorp(%4507) : (i64) -> i64
      %4557 = arith.cmpi ne, %4556, %4545 : i64
      %4558 = arith.cmpi eq, %4555, %4545 : i64
      %4559 = arith.andi %4557, %4558 : i1
      %4560 = scf.if %4559 -> (i64) {
        scf.yield %4507 : i64
      } else {
        scf.yield %4555 : i64
      }
      %4561 = func.call @cc_errorp(%4512) : (i64) -> i64
      %4562 = arith.cmpi ne, %4561, %4545 : i64
      %4563 = arith.cmpi eq, %4560, %4545 : i64
      %4564 = arith.andi %4562, %4563 : i1
      %4565 = scf.if %4564 -> (i64) {
        scf.yield %4512 : i64
      } else {
        scf.yield %4560 : i64
      }
      %4566 = func.call @cc_errorp(%4523) : (i64) -> i64
      %4567 = arith.cmpi ne, %4566, %4545 : i64
      %4568 = arith.cmpi eq, %4565, %4545 : i64
      %4569 = arith.andi %4567, %4568 : i1
      %4570 = scf.if %4569 -> (i64) {
        scf.yield %4523 : i64
      } else {
        scf.yield %4565 : i64
      }
      %4571 = func.call @cc_errorp(%4524) : (i64) -> i64
      %4572 = arith.cmpi ne, %4571, %4545 : i64
      %4573 = arith.cmpi eq, %4570, %4545 : i64
      %4574 = arith.andi %4572, %4573 : i1
      %4575 = scf.if %4574 -> (i64) {
        scf.yield %4524 : i64
      } else {
        scf.yield %4570 : i64
      }
      %4576 = func.call @cc_errorp(%4535) : (i64) -> i64
      %4577 = arith.cmpi ne, %4576, %4545 : i64
      %4578 = arith.cmpi eq, %4575, %4545 : i64
      %4579 = arith.andi %4577, %4578 : i1
      %4580 = scf.if %4579 -> (i64) {
        scf.yield %4535 : i64
      } else {
        scf.yield %4575 : i64
      }
      %4581 = func.call @cc_errorp(%4544) : (i64) -> i64
      %4582 = arith.cmpi ne, %4581, %4545 : i64
      %4583 = arith.cmpi eq, %4580, %4545 : i64
      %4584 = arith.andi %4582, %4583 : i1
      %4585 = scf.if %4584 -> (i64) {
        scf.yield %4544 : i64
      } else {
        scf.yield %4580 : i64
      }
      %4586 = arith.cmpi ne, %4585, %4545 : i64
      scf.if %4586 {
        func.call @stack_push_pointer(%4585) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4318) : (i64) -> ()
        func.call @stack_push_pointer(%4432) : (i64) -> ()
        func.call @stack_push_pointer(%4507) : (i64) -> ()
        func.call @stack_push_pointer(%4512) : (i64) -> ()
        func.call @stack_push_pointer(%4523) : (i64) -> ()
        func.call @stack_push_pointer(%4524) : (i64) -> ()
        func.call @stack_push_pointer(%4535) : (i64) -> ()
        func.call @stack_push_pointer(%4544) : (i64) -> ()
        %4587 = llvm.mlir.addressof @str402 : !llvm.ptr
        %4588 = func.call @cc_make_function_ref_const(%4587) : (!llvm.ptr) -> i64
        %4589 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4588, %4589) : (i64, i64) -> ()
      }
      %4590 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4590 : i64
    }
    %4591 = func.call @cc_nil_value() : () -> i64
    %4592 = func.call @cc_errorp(%4309) : (i64) -> i64
    %4593 = arith.cmpi ne, %4592, %4591 : i64
    %4594 = scf.if %4593 -> (i64) {
      scf.yield %4309 : i64
    } else {
      %4595 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4596 = arith.constant 13 : i64
      %4597 = func.call @cc_make_string(%4595, %4596) : (!llvm.ptr, i64) -> i64
      %4598 = func.call @cc_nil_value() : () -> i64
      %4599 = func.call @cc_intern(%4597, %4598) : (i64, i64) -> i64
      %4600 = func.call @cc_nil_value() : () -> i64
      %4601 = func.call @cc_cons(%4599, %4600) : (i64, i64) -> i64
      %4602 = func.call @cc_values_pack(%4601) : (i64) -> i64
      func.call @stack_push_pointer(%4599) : (i64) -> ()
      %4603 = func.call @stack_pop_pointer() : () -> i64
      %4604 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4605 = arith.constant 6 : i64
      %4606 = func.call @cc_make_string(%4604, %4605) : (!llvm.ptr, i64) -> i64
      %4607 = func.call @cc_nil_value() : () -> i64
      %4608 = func.call @cc_intern(%4606, %4607) : (i64, i64) -> i64
      %4609 = func.call @cc_nil_value() : () -> i64
      %4610 = func.call @cc_cons(%4608, %4609) : (i64, i64) -> i64
      %4611 = func.call @cc_values_pack(%4610) : (i64) -> i64
      func.call @stack_push_pointer(%4608) : (i64) -> ()
      %4612 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4613 = arith.constant 11 : i64
      %4614 = func.call @cc_make_string(%4612, %4613) : (!llvm.ptr, i64) -> i64
      %4615 = func.call @cc_nil_value() : () -> i64
      %4616 = func.call @cc_intern(%4614, %4615) : (i64, i64) -> i64
      %4617 = func.call @cc_nil_value() : () -> i64
      %4618 = func.call @cc_cons(%4616, %4617) : (i64, i64) -> i64
      %4619 = func.call @cc_values_pack(%4618) : (i64) -> i64
      func.call @stack_push_pointer(%4616) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4620 = func.call @stack_pop_pointer() : () -> i64
      %4621 = func.call @stack_pop_pointer() : () -> i64
      %4622 = func.call @cc_cons(%4621, %4620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4622) : (i64) -> ()
      %4623 = func.call @stack_pop_pointer() : () -> i64
      %4624 = func.call @stack_pop_pointer() : () -> i64
      %4625 = func.call @cc_cons(%4624, %4623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4625) : (i64) -> ()
      %4626 = func.call @stack_pop_pointer() : () -> i64
      %4647 = arith.constant 47863920853007 : i64
      %4648 = arith.constant 0 : i64
      %4649 = func.call @cc_make_closure(%4647, %4648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4649) : (i64) -> ()
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4652 = arith.constant 9 : i64
      %4653 = func.call @cc_make_string(%4651, %4652) : (!llvm.ptr, i64) -> i64
      %4654 = func.call @cc_nil_value() : () -> i64
      %4655 = func.call @cc_intern(%4653, %4654) : (i64, i64) -> i64
      %4656 = func.call @cc_nil_value() : () -> i64
      %4657 = func.call @cc_cons(%4655, %4656) : (i64, i64) -> i64
      %4658 = func.call @cc_values_pack(%4657) : (i64) -> i64
      func.call @stack_push_pointer(%4655) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4659 = func.call @stack_pop_pointer() : () -> i64
      %4660 = func.call @stack_pop_pointer() : () -> i64
      %4661 = func.call @cc_cons(%4660, %4659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4661) : (i64) -> ()
      %4662 = func.call @stack_pop_pointer() : () -> i64
      %4663 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4664 = arith.constant 11 : i64
      %4665 = func.call @cc_make_string(%4663, %4664) : (!llvm.ptr, i64) -> i64
      %4666 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4667 = arith.constant 7 : i64
      %4668 = func.call @cc_make_string(%4666, %4667) : (!llvm.ptr, i64) -> i64
      %4669 = func.call @cc_intern(%4665, %4668) : (i64, i64) -> i64
      %4670 = func.call @cc_nil_value() : () -> i64
      %4671 = func.call @cc_cons(%4669, %4670) : (i64, i64) -> i64
      %4672 = func.call @cc_values_pack(%4671) : (i64) -> i64
      func.call @stack_push_pointer(%4669) : (i64) -> ()
      %4673 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4674 = func.call @stack_pop_pointer() : () -> i64
      %4675 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4676 = arith.constant 4 : i64
      %4677 = func.call @cc_make_string(%4675, %4676) : (!llvm.ptr, i64) -> i64
      %4678 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4679 = arith.constant 7 : i64
      %4680 = func.call @cc_make_string(%4678, %4679) : (!llvm.ptr, i64) -> i64
      %4681 = func.call @cc_intern(%4677, %4680) : (i64, i64) -> i64
      %4682 = func.call @cc_nil_value() : () -> i64
      %4683 = func.call @cc_cons(%4681, %4682) : (i64, i64) -> i64
      %4684 = func.call @cc_values_pack(%4683) : (i64) -> i64
      func.call @stack_push_pointer(%4681) : (i64) -> ()
      %4685 = func.call @stack_pop_pointer() : () -> i64
      %4686 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4687 = arith.constant 5 : i64
      %4688 = func.call @cc_make_string(%4686, %4687) : (!llvm.ptr, i64) -> i64
      %4689 = func.call @cc_nil_value() : () -> i64
      %4690 = func.call @cc_intern(%4688, %4689) : (i64, i64) -> i64
      %4691 = func.call @cc_nil_value() : () -> i64
      %4692 = func.call @cc_cons(%4690, %4691) : (i64, i64) -> i64
      %4693 = func.call @cc_values_pack(%4692) : (i64) -> i64
      func.call @stack_push_pointer(%4690) : (i64) -> ()
      %4694 = func.call @stack_pop_pointer() : () -> i64
      %4695 = func.call @cc_nil_value() : () -> i64
      %4696 = func.call @cc_errorp(%4603) : (i64) -> i64
      %4697 = arith.cmpi ne, %4696, %4695 : i64
      %4698 = arith.cmpi eq, %4695, %4695 : i64
      %4699 = arith.andi %4697, %4698 : i1
      %4700 = scf.if %4699 -> (i64) {
        scf.yield %4603 : i64
      } else {
        scf.yield %4695 : i64
      }
      %4701 = func.call @cc_errorp(%4626) : (i64) -> i64
      %4702 = arith.cmpi ne, %4701, %4695 : i64
      %4703 = arith.cmpi eq, %4700, %4695 : i64
      %4704 = arith.andi %4702, %4703 : i1
      %4705 = scf.if %4704 -> (i64) {
        scf.yield %4626 : i64
      } else {
        scf.yield %4700 : i64
      }
      %4706 = func.call @cc_errorp(%4650) : (i64) -> i64
      %4707 = arith.cmpi ne, %4706, %4695 : i64
      %4708 = arith.cmpi eq, %4705, %4695 : i64
      %4709 = arith.andi %4707, %4708 : i1
      %4710 = scf.if %4709 -> (i64) {
        scf.yield %4650 : i64
      } else {
        scf.yield %4705 : i64
      }
      %4711 = func.call @cc_errorp(%4662) : (i64) -> i64
      %4712 = arith.cmpi ne, %4711, %4695 : i64
      %4713 = arith.cmpi eq, %4710, %4695 : i64
      %4714 = arith.andi %4712, %4713 : i1
      %4715 = scf.if %4714 -> (i64) {
        scf.yield %4662 : i64
      } else {
        scf.yield %4710 : i64
      }
      %4716 = func.call @cc_errorp(%4673) : (i64) -> i64
      %4717 = arith.cmpi ne, %4716, %4695 : i64
      %4718 = arith.cmpi eq, %4715, %4695 : i64
      %4719 = arith.andi %4717, %4718 : i1
      %4720 = scf.if %4719 -> (i64) {
        scf.yield %4673 : i64
      } else {
        scf.yield %4715 : i64
      }
      %4721 = func.call @cc_errorp(%4674) : (i64) -> i64
      %4722 = arith.cmpi ne, %4721, %4695 : i64
      %4723 = arith.cmpi eq, %4720, %4695 : i64
      %4724 = arith.andi %4722, %4723 : i1
      %4725 = scf.if %4724 -> (i64) {
        scf.yield %4674 : i64
      } else {
        scf.yield %4720 : i64
      }
      %4726 = func.call @cc_errorp(%4685) : (i64) -> i64
      %4727 = arith.cmpi ne, %4726, %4695 : i64
      %4728 = arith.cmpi eq, %4725, %4695 : i64
      %4729 = arith.andi %4727, %4728 : i1
      %4730 = scf.if %4729 -> (i64) {
        scf.yield %4685 : i64
      } else {
        scf.yield %4725 : i64
      }
      %4731 = func.call @cc_errorp(%4694) : (i64) -> i64
      %4732 = arith.cmpi ne, %4731, %4695 : i64
      %4733 = arith.cmpi eq, %4730, %4695 : i64
      %4734 = arith.andi %4732, %4733 : i1
      %4735 = scf.if %4734 -> (i64) {
        scf.yield %4694 : i64
      } else {
        scf.yield %4730 : i64
      }
      %4736 = arith.cmpi ne, %4735, %4695 : i64
      scf.if %4736 {
        func.call @stack_push_pointer(%4735) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4603) : (i64) -> ()
        func.call @stack_push_pointer(%4626) : (i64) -> ()
        func.call @stack_push_pointer(%4650) : (i64) -> ()
        func.call @stack_push_pointer(%4662) : (i64) -> ()
        func.call @stack_push_pointer(%4673) : (i64) -> ()
        func.call @stack_push_pointer(%4674) : (i64) -> ()
        func.call @stack_push_pointer(%4685) : (i64) -> ()
        func.call @stack_push_pointer(%4694) : (i64) -> ()
        %4737 = llvm.mlir.addressof @str413 : !llvm.ptr
        %4738 = func.call @cc_make_function_ref_const(%4737) : (!llvm.ptr) -> i64
        %4739 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4738, %4739) : (i64, i64) -> ()
      }
      %4740 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4740 : i64
    }
    func.call @stack_push_pointer(%4594) : (i64) -> ()
    %4741 = func.call @stack_pop_pointer() : () -> i64
    %4742 = func.call @cc_multiple_value_list(%4741) : (i64) -> i64
    %4743 = llvm.mlir.addressof @str414 : !llvm.ptr
    %4744 = arith.constant 37 : i64
    %4745 = func.call @cc_make_string(%4743, %4744) : (!llvm.ptr, i64) -> i64
    %4746 = func.call @cc_nil_value() : () -> i64
    %4747 = func.call @cc_intern(%4745, %4746) : (i64, i64) -> i64
    %4748 = func.call @cc_nil_value() : () -> i64
    %4749 = func.call @cc_cons(%4747, %4748) : (i64, i64) -> i64
    %4750 = func.call @cc_values_pack(%4749) : (i64) -> i64
    %4751 = func.call @cc_symbol_value(%4747) : (i64) -> i64
    %4752 = llvm.mlir.addressof @str415 : !llvm.ptr
    %4753 = arith.constant 39 : i64
    %4754 = func.call @cc_make_string(%4752, %4753) : (!llvm.ptr, i64) -> i64
    %4755 = func.call @cc_nil_value() : () -> i64
    %4756 = func.call @cc_intern(%4754, %4755) : (i64, i64) -> i64
    %4757 = func.call @cc_nil_value() : () -> i64
    %4758 = func.call @cc_cons(%4756, %4757) : (i64, i64) -> i64
    %4759 = func.call @cc_values_pack(%4758) : (i64) -> i64
    %4760 = func.call @cc_symbol_value(%4756) : (i64) -> i64
    %4761 = func.call @cc_nil_value() : () -> i64
    %4762 = arith.cmpi ne, %4751, %4761 : i64
    %4763 = scf.if %4762 -> (i64) {
      scf.yield %4760 : i64
    } else {
      scf.yield %4742 : i64
    }
    %4764 = func.call @cc_values_pack(%4763) : (i64) -> i64
    func.call @stack_push_pointer(%4764) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"clos:validate-superclass_47863920852993_primary"() {
    %223 = func.call @stack_pop_pointer() : () -> i64
    %224 = func.call @stack_pop_pointer() : () -> i64
    %225 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%225) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:SHARED-INITIALIZE_47863920852994_around"() {
    %442 = func.call @stack_pop_pointer() : () -> i64
    %443 = func.call @stack_pop_pointer() : () -> i64
    %444 = func.call @stack_pop_pointer() : () -> i64
    %445 = func.call @stack_pop_pointer() : () -> i64
    %446 = llvm.mlir.addressof @str40 : !llvm.ptr
    %447 = func.call @cc_make_function_ref_const(%446) : (!llvm.ptr) -> i64
    func.call @stack_push_pointer(%447) : (i64) -> ()
    %448 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%445) : (i64) -> ()
    func.call @stack_push_pointer(%444) : (i64) -> ()
    %449 = llvm.mlir.addressof @str41 : !llvm.ptr
    %450 = arith.constant 19 : i64
    %451 = func.call @cc_make_string(%449, %450) : (!llvm.ptr, i64) -> i64
    %452 = llvm.mlir.addressof @str42 : !llvm.ptr
    %453 = arith.constant 7 : i64
    %454 = func.call @cc_make_string(%452, %453) : (!llvm.ptr, i64) -> i64
    %455 = func.call @cc_intern(%451, %454) : (i64, i64) -> i64
    %456 = func.call @cc_nil_value() : () -> i64
    %457 = func.call @cc_cons(%455, %456) : (i64, i64) -> i64
    %458 = func.call @cc_values_pack(%457) : (i64) -> i64
    func.call @stack_push_pointer(%455) : (i64) -> ()
    %459 = llvm.mlir.addressof @str43 : !llvm.ptr
    %460 = arith.constant 15 : i64
    %461 = func.call @cc_make_string(%459, %460) : (!llvm.ptr, i64) -> i64
    %462 = llvm.mlir.addressof @str44 : !llvm.ptr
    %463 = arith.constant 11 : i64
    %464 = func.call @cc_make_string(%462, %463) : (!llvm.ptr, i64) -> i64
    %465 = func.call @cc_intern(%461, %464) : (i64, i64) -> i64
    %466 = func.call @cc_nil_value() : () -> i64
    %467 = func.call @cc_cons(%465, %466) : (i64, i64) -> i64
    %468 = func.call @cc_values_pack(%467) : (i64) -> i64
    func.call @stack_push_pointer(%465) : (i64) -> ()
    %469 = func.call @stack_pop_pointer() : () -> i64
    %470 = func.call @cc_nil_value() : () -> i64
    %471 = func.call @cc_errorp(%469) : (i64) -> i64
    %472 = arith.cmpi ne, %471, %470 : i64
    %473 = arith.cmpi eq, %470, %470 : i64
    %474 = arith.andi %472, %473 : i1
    %475 = scf.if %474 -> (i64) {
      scf.yield %469 : i64
    } else {
      scf.yield %470 : i64
    }
    %476 = arith.cmpi ne, %475, %470 : i64
    scf.if %476 {
      func.call @stack_push_pointer(%475) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%469) : (i64) -> ()
      %477 = llvm.mlir.addressof @str45 : !llvm.ptr
      %478 = func.call @cc_make_function_ref_const(%477) : (!llvm.ptr) -> i64
      %479 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%478, %479) : (i64, i64) -> ()
    }
    func.call @stack_push_pointer(%442) : (i64) -> ()
    %480 = func.call @stack_pop_pointer() : () -> i64
    %481 = func.call @stack_pop_pointer() : () -> i64
    %482 = func.call @cc_remove(%481, %480) : (i64, i64) -> i64
    func.call @stack_push_pointer(%482) : (i64) -> ()
    %483 = llvm.mlir.addressof @str46 : !llvm.ptr
    %484 = arith.constant 16 : i64
    %485 = func.call @cc_make_string(%483, %484) : (!llvm.ptr, i64) -> i64
    %486 = func.call @cc_nil_value() : () -> i64
    %487 = func.call @cc_intern(%485, %486) : (i64, i64) -> i64
    %488 = func.call @cc_nil_value() : () -> i64
    %489 = func.call @cc_cons(%487, %488) : (i64, i64) -> i64
    %490 = func.call @cc_values_pack(%489) : (i64) -> i64
    func.call @stack_push_pointer(%487) : (i64) -> ()
    %491 = func.call @stack_pop_pointer() : () -> i64
    %492 = func.call @cc_nil_value() : () -> i64
    %493 = func.call @cc_errorp(%491) : (i64) -> i64
    %494 = arith.cmpi ne, %493, %492 : i64
    %495 = arith.cmpi eq, %492, %492 : i64
    %496 = arith.andi %494, %495 : i1
    %497 = scf.if %496 -> (i64) {
      scf.yield %491 : i64
    } else {
      scf.yield %492 : i64
    }
    %498 = arith.cmpi ne, %497, %492 : i64
    scf.if %498 {
      func.call @stack_push_pointer(%497) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%491) : (i64) -> ()
      %499 = llvm.mlir.addressof @str47 : !llvm.ptr
      %500 = func.call @cc_make_function_ref_const(%499) : (!llvm.ptr) -> i64
      %501 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%500, %501) : (i64, i64) -> ()
    }
    %502 = func.call @stack_pop_pointer() : () -> i64
    %503 = func.call @cc_nil_value() : () -> i64
    %504 = func.call @cc_errorp(%502) : (i64) -> i64
    %505 = arith.cmpi ne, %504, %503 : i64
    %506 = arith.cmpi eq, %503, %503 : i64
    %507 = arith.andi %505, %506 : i1
    %508 = scf.if %507 -> (i64) {
      scf.yield %502 : i64
    } else {
      scf.yield %503 : i64
    }
    %509 = arith.cmpi ne, %508, %503 : i64
    scf.if %509 {
      func.call @stack_push_pointer(%508) : (i64) -> ()
    } else {
      %510 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%510) : (i64) -> ()
      func.call @stack_push_pointer(%502) : (i64) -> ()
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @stack_pop_pointer() : () -> i64
      %513 = func.call @cc_cons(%511, %512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%513) : (i64) -> ()
    }
    %514 = func.call @stack_pop_pointer() : () -> i64
    %515 = func.call @stack_pop_pointer() : () -> i64
    %516 = func.call @cc_append(%515, %514) : (i64, i64) -> i64
    func.call @stack_push_pointer(%516) : (i64) -> ()
    func.call @stack_push_pointer(%443) : (i64) -> ()
    %517 = func.call @stack_pop_pointer() : () -> i64
    %518 = func.call @stack_pop_pointer() : () -> i64
    %519 = func.call @cc_cons(%518, %517) : (i64, i64) -> i64
    %520 = func.call @stack_pop_pointer() : () -> i64
    %521 = func.call @cc_cons(%520, %519) : (i64, i64) -> i64
    %522 = func.call @stack_pop_pointer() : () -> i64
    %523 = func.call @cc_cons(%522, %521) : (i64, i64) -> i64
    %524 = func.call @stack_pop_pointer() : () -> i64
    %525 = func.call @cc_cons(%524, %523) : (i64, i64) -> i64
    %526 = func.call @cc_apply(%448, %525) : (i64, i64) -> i64
    func.call @stack_push_pointer(%526) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852995_before"() {
    %981 = func.call @stack_pop_pointer() : () -> i64
    %982 = func.call @stack_pop_pointer() : () -> i64
    %983 = func.call @stack_pop_pointer() : () -> i64
    %984 = func.call @stack_pop_pointer() : () -> i64
    %985 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %986 = func.call @stack_depth() : () -> i64
    %987 = arith.constant 0 : i64
    %988 = arith.cmpi sgt, %986, %987 : i64
    scf.if %988 {
      %989 = func.call @stack_pop_pointer() : () -> i64
    }
    %990 = llvm.mlir.addressof @str101 : !llvm.ptr
    %991 = arith.constant 13 : i64
    %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
    %993 = func.call @cc_nil_value() : () -> i64
    %994 = func.call @cc_intern(%992, %993) : (i64, i64) -> i64
    %995 = func.call @cc_nil_value() : () -> i64
    %996 = func.call @cc_cons(%994, %995) : (i64, i64) -> i64
    %997 = func.call @cc_values_pack(%996) : (i64) -> i64
    func.call @stack_push_pointer(%994) : (i64) -> ()
    %998 = func.call @stack_pop_pointer() : () -> i64
    %999 = func.call @cc_nil_value() : () -> i64
    %1000 = func.call @cc_errorp(%998) : (i64) -> i64
    %1001 = arith.cmpi ne, %1000, %999 : i64
    %1002 = arith.cmpi eq, %999, %999 : i64
    %1003 = arith.andi %1001, %1002 : i1
    %1004 = scf.if %1003 -> (i64) {
      scf.yield %998 : i64
    } else {
      scf.yield %999 : i64
    }
    %1005 = arith.cmpi ne, %1004, %999 : i64
    scf.if %1005 {
      func.call @stack_push_pointer(%1004) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%998) : (i64) -> ()
      %1006 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1007 = func.call @cc_make_function_ref_const(%1006) : (!llvm.ptr) -> i64
      %1008 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1007, %1008) : (i64, i64) -> ()
    }
    func.return
  }
  func.func @"__lambda_47863920852996"() {
    %1694 = func.call @cc_nil_value() : () -> i64
    %1695 = func.call @cc_nil_value() : () -> i64
    %1696 = func.call @cc_errorp(%1694) : (i64) -> i64
    %1697 = arith.cmpi ne, %1696, %1695 : i64
    %1698 = scf.if %1697 -> (i64) {
      scf.yield %1694 : i64
    } else {
      %1699 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1700 = func.call @cc_nil_value() : () -> i64
      %1701 = func.call @cc_nil_value() : () -> i64
      %1702 = func.call @cc_errorp(%1700) : (i64) -> i64
      %1703 = arith.cmpi ne, %1702, %1701 : i64
      %1704 = scf.if %1703 -> (i64) {
        scf.yield %1700 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1705 = llvm.mlir.addressof @str167 : !llvm.ptr
        %1706 = arith.constant 11 : i64
        %1707 = func.call @cc_make_string(%1705, %1706) : (!llvm.ptr, i64) -> i64
        %1708 = func.call @cc_nil_value() : () -> i64
        %1709 = func.call @cc_intern(%1707, %1708) : (i64, i64) -> i64
        %1710 = func.call @cc_nil_value() : () -> i64
        %1711 = func.call @cc_cons(%1709, %1710) : (i64, i64) -> i64
        %1712 = func.call @cc_values_pack(%1711) : (i64) -> i64
        %1713 = func.call @cc_symbol_value(%1709) : (i64) -> i64
        func.call @stack_push_pointer(%1713) : (i64) -> ()
        %1714 = func.call @stack_pop_pointer() : () -> i64
        %1715 = llvm.mlir.addressof @str168 : !llvm.ptr
        %1716 = arith.constant 4 : i64
        %1717 = func.call @cc_make_string(%1715, %1716) : (!llvm.ptr, i64) -> i64
        %1718 = func.call @cc_nil_value() : () -> i64
        %1719 = func.call @cc_intern(%1717, %1718) : (i64, i64) -> i64
        %1720 = func.call @cc_nil_value() : () -> i64
        %1721 = func.call @cc_cons(%1719, %1720) : (i64, i64) -> i64
        %1722 = func.call @cc_values_pack(%1721) : (i64) -> i64
        func.call @stack_push_pointer(%1719) : (i64) -> ()
        %1723 = func.call @stack_pop_pointer() : () -> i64
        %1724 = func.call @cc_nil_value() : () -> i64
        %1725 = func.call @cc_errorp(%1714) : (i64) -> i64
        %1726 = arith.cmpi ne, %1725, %1724 : i64
        %1727 = arith.cmpi eq, %1724, %1724 : i64
        %1728 = arith.andi %1726, %1727 : i1
        %1729 = scf.if %1728 -> (i64) {
          scf.yield %1714 : i64
        } else {
          scf.yield %1724 : i64
        }
        %1730 = func.call @cc_errorp(%1723) : (i64) -> i64
        %1731 = arith.cmpi ne, %1730, %1724 : i64
        %1732 = arith.cmpi eq, %1729, %1724 : i64
        %1733 = arith.andi %1731, %1732 : i1
        %1734 = scf.if %1733 -> (i64) {
          scf.yield %1723 : i64
        } else {
          scf.yield %1729 : i64
        }
        %1735 = arith.cmpi ne, %1734, %1724 : i64
        scf.if %1735 {
          func.call @stack_push_pointer(%1734) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1714) : (i64) -> ()
          func.call @stack_push_pointer(%1723) : (i64) -> ()
          %1736 = llvm.mlir.addressof @str169 : !llvm.ptr
          %1737 = func.call @cc_make_function_ref_const(%1736) : (!llvm.ptr) -> i64
          %1738 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1737, %1738) : (i64, i64) -> ()
        }
        %1739 = func.call @stack_pop_pointer() : () -> i64
        %1740 = func.call @cc_errorp(%1739) : (i64) -> i64
        %1741 = func.call @cc_nil_value() : () -> i64
        %1742 = arith.cmpi ne, %1740, %1741 : i64
        scf.if %1742 {
          func.call @stack_push_pointer(%1739) : (i64) -> ()
        } else {
          %1743 = func.call @cc_multiple_value_list(%1739) : (i64) -> i64
          func.call @stack_push_pointer(%1743) : (i64) -> ()
        }
        %1744 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1745 = func.call @stack_pop_pointer() : () -> i64
        %1746 = func.call @cc_nil_value() : () -> i64
        %1747 = func.call @cc_maybe_error_from_multiple_value_list(%1744) : (i64) -> i64
        %1748 = func.call @cc_errorp(%1747) : (i64) -> i64
        %1749 = arith.cmpi ne, %1748, %1746 : i64
        %1750 = arith.cmpi eq, %1746, %1746 : i64
        %1751 = arith.andi %1749, %1750 : i1
        %1752 = scf.if %1751 -> (i64) {
          scf.yield %1747 : i64
        } else {
          scf.yield %1746 : i64
        }
        %1753 = arith.cmpi ne, %1752, %1746 : i64
        scf.if %1753 {
          func.call @stack_push_pointer(%1752) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1754 = func.call @stack_pop_pointer() : () -> i64
          %1755 = func.call @cc_cons(%1745, %1754) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1755) : (i64) -> ()
          %1756 = func.call @stack_pop_pointer() : () -> i64
          %1757 = func.call @cc_cons(%1744, %1756) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1757) : (i64) -> ()
          %1758 = func.call @stack_pop_pointer() : () -> i64
          %1759 = func.call @cc_values_pack(%1758) : (i64) -> i64
          func.call @stack_push_pointer(%1759) : (i64) -> ()
        }
        %1760 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1760 : i64
      }
      func.call @stack_push_pointer(%1704) : (i64) -> ()
      %1761 = func.call @stack_pop_pointer() : () -> i64
      %1762 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1763 = func.call @cc_errorp(%1761) : (i64) -> i64
      %1764 = func.call @cc_nil_value() : () -> i64
      %1765 = arith.cmpi ne, %1763, %1764 : i64
      scf.if %1765 {
        %1766 = func.call @cc_condition_value(%1761) : (i64) -> i64
        %1767 = func.call @cc_values2(%1764, %1766) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1767) : (i64) -> ()
      } else {
        %1768 = func.call @cc_multiple_value_list(%1761) : (i64) -> i64
        %1769 = func.call @cc_values_pack(%1768) : (i64) -> i64
        func.call @stack_push_pointer(%1769) : (i64) -> ()
      }
      %1770 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1770 : i64
    }
    func.call @stack_push_pointer(%1698) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920852997"() {
    %1985 = func.call @cc_nil_value() : () -> i64
    %1986 = func.call @cc_nil_value() : () -> i64
    %1987 = func.call @cc_errorp(%1985) : (i64) -> i64
    %1988 = arith.cmpi ne, %1987, %1986 : i64
    %1989 = scf.if %1988 -> (i64) {
      scf.yield %1985 : i64
    } else {
      %1990 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1991 = func.call @cc_nil_value() : () -> i64
      %1992 = func.call @cc_nil_value() : () -> i64
      %1993 = func.call @cc_errorp(%1991) : (i64) -> i64
      %1994 = arith.cmpi ne, %1993, %1992 : i64
      %1995 = scf.if %1994 -> (i64) {
        scf.yield %1991 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1996 = llvm.mlir.addressof @str188 : !llvm.ptr
        %1997 = arith.constant 11 : i64
        %1998 = func.call @cc_make_string(%1996, %1997) : (!llvm.ptr, i64) -> i64
        %1999 = func.call @cc_nil_value() : () -> i64
        %2000 = func.call @cc_intern(%1998, %1999) : (i64, i64) -> i64
        %2001 = func.call @cc_nil_value() : () -> i64
        %2002 = func.call @cc_cons(%2000, %2001) : (i64, i64) -> i64
        %2003 = func.call @cc_values_pack(%2002) : (i64) -> i64
        %2004 = func.call @cc_symbol_value(%2000) : (i64) -> i64
        func.call @stack_push_pointer(%2004) : (i64) -> ()
        %2005 = func.call @stack_pop_pointer() : () -> i64
        %2006 = llvm.mlir.addressof @str189 : !llvm.ptr
        %2007 = arith.constant 4 : i64
        %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
        %2009 = func.call @cc_nil_value() : () -> i64
        %2010 = func.call @cc_intern(%2008, %2009) : (i64, i64) -> i64
        %2011 = func.call @cc_nil_value() : () -> i64
        %2012 = func.call @cc_cons(%2010, %2011) : (i64, i64) -> i64
        %2013 = func.call @cc_values_pack(%2012) : (i64) -> i64
        func.call @stack_push_pointer(%2010) : (i64) -> ()
        %2014 = func.call @stack_pop_pointer() : () -> i64
        %2015 = func.call @cc_nil_value() : () -> i64
        %2016 = func.call @cc_errorp(%2005) : (i64) -> i64
        %2017 = arith.cmpi ne, %2016, %2015 : i64
        %2018 = arith.cmpi eq, %2015, %2015 : i64
        %2019 = arith.andi %2017, %2018 : i1
        %2020 = scf.if %2019 -> (i64) {
          scf.yield %2005 : i64
        } else {
          scf.yield %2015 : i64
        }
        %2021 = func.call @cc_errorp(%2014) : (i64) -> i64
        %2022 = arith.cmpi ne, %2021, %2015 : i64
        %2023 = arith.cmpi eq, %2020, %2015 : i64
        %2024 = arith.andi %2022, %2023 : i1
        %2025 = scf.if %2024 -> (i64) {
          scf.yield %2014 : i64
        } else {
          scf.yield %2020 : i64
        }
        %2026 = arith.cmpi ne, %2025, %2015 : i64
        scf.if %2026 {
          func.call @stack_push_pointer(%2025) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2005) : (i64) -> ()
          func.call @stack_push_pointer(%2014) : (i64) -> ()
          %2027 = llvm.mlir.addressof @str190 : !llvm.ptr
          %2028 = func.call @cc_make_function_ref_const(%2027) : (!llvm.ptr) -> i64
          %2029 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2028, %2029) : (i64, i64) -> ()
        }
        %2030 = func.call @stack_pop_pointer() : () -> i64
        %2031 = func.call @cc_errorp(%2030) : (i64) -> i64
        %2032 = func.call @cc_nil_value() : () -> i64
        %2033 = arith.cmpi ne, %2031, %2032 : i64
        scf.if %2033 {
          func.call @stack_push_pointer(%2030) : (i64) -> ()
        } else {
          %2034 = func.call @cc_multiple_value_list(%2030) : (i64) -> i64
          func.call @stack_push_pointer(%2034) : (i64) -> ()
        }
        %2035 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2036 = func.call @stack_pop_pointer() : () -> i64
        %2037 = func.call @cc_nil_value() : () -> i64
        %2038 = func.call @cc_maybe_error_from_multiple_value_list(%2035) : (i64) -> i64
        %2039 = func.call @cc_errorp(%2038) : (i64) -> i64
        %2040 = arith.cmpi ne, %2039, %2037 : i64
        %2041 = arith.cmpi eq, %2037, %2037 : i64
        %2042 = arith.andi %2040, %2041 : i1
        %2043 = scf.if %2042 -> (i64) {
          scf.yield %2038 : i64
        } else {
          scf.yield %2037 : i64
        }
        %2044 = arith.cmpi ne, %2043, %2037 : i64
        scf.if %2044 {
          func.call @stack_push_pointer(%2043) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2045 = func.call @stack_pop_pointer() : () -> i64
          %2046 = func.call @cc_cons(%2036, %2045) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2046) : (i64) -> ()
          %2047 = func.call @stack_pop_pointer() : () -> i64
          %2048 = func.call @cc_cons(%2035, %2047) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2048) : (i64) -> ()
          %2049 = func.call @stack_pop_pointer() : () -> i64
          %2050 = func.call @cc_values_pack(%2049) : (i64) -> i64
          func.call @stack_push_pointer(%2050) : (i64) -> ()
        }
        %2051 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2051 : i64
      }
      func.call @stack_push_pointer(%1995) : (i64) -> ()
      %2052 = func.call @stack_pop_pointer() : () -> i64
      %2053 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2054 = func.call @cc_errorp(%2052) : (i64) -> i64
      %2055 = func.call @cc_nil_value() : () -> i64
      %2056 = arith.cmpi ne, %2054, %2055 : i64
      scf.if %2056 {
        %2057 = func.call @cc_condition_value(%2052) : (i64) -> i64
        %2058 = func.call @cc_values2(%2055, %2057) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2058) : (i64) -> ()
      } else {
        %2059 = func.call @cc_multiple_value_list(%2052) : (i64) -> i64
        %2060 = func.call @cc_values_pack(%2059) : (i64) -> i64
        func.call @stack_push_pointer(%2060) : (i64) -> ()
      }
      %2061 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2061 : i64
    }
    func.call @stack_push_pointer(%1989) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852998_before"() {
    %2171 = func.call @stack_pop_pointer() : () -> i64
    %2172 = func.call @stack_pop_pointer() : () -> i64
    %2173 = func.call @stack_pop_pointer() : () -> i64
    %2174 = func.call @stack_pop_pointer() : () -> i64
    %2175 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    func.return
  }
  func.func @"__lambda_47863920852999"() {
    %2519 = func.call @cc_nil_value() : () -> i64
    %2520 = func.call @cc_nil_value() : () -> i64
    %2521 = func.call @cc_errorp(%2519) : (i64) -> i64
    %2522 = arith.cmpi ne, %2521, %2520 : i64
    %2523 = scf.if %2522 -> (i64) {
      scf.yield %2519 : i64
    } else {
      %2524 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2525 = arith.constant 11 : i64
      %2526 = func.call @cc_make_string(%2524, %2525) : (!llvm.ptr, i64) -> i64
      %2527 = func.call @cc_nil_value() : () -> i64
      %2528 = func.call @cc_intern(%2526, %2527) : (i64, i64) -> i64
      %2529 = func.call @cc_nil_value() : () -> i64
      %2530 = func.call @cc_cons(%2528, %2529) : (i64, i64) -> i64
      %2531 = func.call @cc_values_pack(%2530) : (i64) -> i64
      %2532 = func.call @cc_symbol_value(%2528) : (i64) -> i64
      func.call @stack_push_pointer(%2532) : (i64) -> ()
      %2533 = func.call @stack_pop_pointer() : () -> i64
      %2534 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2535 = arith.constant 4 : i64
      %2536 = func.call @cc_make_string(%2534, %2535) : (!llvm.ptr, i64) -> i64
      %2537 = func.call @cc_nil_value() : () -> i64
      %2538 = func.call @cc_intern(%2536, %2537) : (i64, i64) -> i64
      %2539 = func.call @cc_nil_value() : () -> i64
      %2540 = func.call @cc_cons(%2538, %2539) : (i64, i64) -> i64
      %2541 = func.call @cc_values_pack(%2540) : (i64) -> i64
      func.call @stack_push_pointer(%2538) : (i64) -> ()
      %2542 = func.call @stack_pop_pointer() : () -> i64
      %2543 = func.call @cc_nil_value() : () -> i64
      %2544 = func.call @cc_errorp(%2533) : (i64) -> i64
      %2545 = arith.cmpi ne, %2544, %2543 : i64
      %2546 = arith.cmpi eq, %2543, %2543 : i64
      %2547 = arith.andi %2545, %2546 : i1
      %2548 = scf.if %2547 -> (i64) {
        scf.yield %2533 : i64
      } else {
        scf.yield %2543 : i64
      }
      %2549 = func.call @cc_errorp(%2542) : (i64) -> i64
      %2550 = arith.cmpi ne, %2549, %2543 : i64
      %2551 = arith.cmpi eq, %2548, %2543 : i64
      %2552 = arith.andi %2550, %2551 : i1
      %2553 = scf.if %2552 -> (i64) {
        scf.yield %2542 : i64
      } else {
        scf.yield %2548 : i64
      }
      %2554 = arith.cmpi ne, %2553, %2543 : i64
      scf.if %2554 {
        func.call @stack_push_pointer(%2553) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2533) : (i64) -> ()
        func.call @stack_push_pointer(%2542) : (i64) -> ()
        %2555 = llvm.mlir.addressof @str237 : !llvm.ptr
        %2556 = func.call @cc_make_function_ref_const(%2555) : (!llvm.ptr) -> i64
        %2557 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2556, %2557) : (i64, i64) -> ()
      }
      %2558 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2558 : i64
    }
    func.call @stack_push_pointer(%2523) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853000_before"() {
    %2903 = func.call @stack_pop_pointer() : () -> i64
    %2904 = func.call @stack_pop_pointer() : () -> i64
    %2905 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %2906 = func.call @stack_depth() : () -> i64
    %2907 = arith.constant 0 : i64
    %2908 = arith.cmpi sgt, %2906, %2907 : i64
    scf.if %2908 {
      %2909 = func.call @stack_pop_pointer() : () -> i64
    }
    %2910 = llvm.mlir.addressof @str262 : !llvm.ptr
    %2911 = arith.constant 13 : i64
    %2912 = func.call @cc_make_string(%2910, %2911) : (!llvm.ptr, i64) -> i64
    %2913 = func.call @cc_nil_value() : () -> i64
    %2914 = func.call @cc_intern(%2912, %2913) : (i64, i64) -> i64
    %2915 = func.call @cc_nil_value() : () -> i64
    %2916 = func.call @cc_cons(%2914, %2915) : (i64, i64) -> i64
    %2917 = func.call @cc_values_pack(%2916) : (i64) -> i64
    func.call @stack_push_pointer(%2914) : (i64) -> ()
    %2918 = func.call @stack_pop_pointer() : () -> i64
    %2919 = func.call @cc_nil_value() : () -> i64
    %2920 = func.call @cc_errorp(%2918) : (i64) -> i64
    %2921 = arith.cmpi ne, %2920, %2919 : i64
    %2922 = arith.cmpi eq, %2919, %2919 : i64
    %2923 = arith.andi %2921, %2922 : i1
    %2924 = scf.if %2923 -> (i64) {
      scf.yield %2918 : i64
    } else {
      scf.yield %2919 : i64
    }
    %2925 = arith.cmpi ne, %2924, %2919 : i64
    scf.if %2925 {
      func.call @stack_push_pointer(%2924) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%2918) : (i64) -> ()
      %2926 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2927 = func.call @cc_make_function_ref_const(%2926) : (!llvm.ptr) -> i64
      %2928 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%2927, %2928) : (i64, i64) -> ()
    }
    func.return
  }
  func.func @"__lambda_47863920853001"() {
    %3331 = func.call @cc_nil_value() : () -> i64
    %3332 = func.call @cc_nil_value() : () -> i64
    %3333 = func.call @cc_errorp(%3331) : (i64) -> i64
    %3334 = arith.cmpi ne, %3333, %3332 : i64
    %3335 = scf.if %3334 -> (i64) {
      scf.yield %3331 : i64
    } else {
      %3336 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3337 = func.call @cc_nil_value() : () -> i64
      %3338 = func.call @cc_nil_value() : () -> i64
      %3339 = func.call @cc_errorp(%3337) : (i64) -> i64
      %3340 = arith.cmpi ne, %3339, %3338 : i64
      %3341 = scf.if %3340 -> (i64) {
        scf.yield %3337 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3342 = llvm.mlir.addressof @str304 : !llvm.ptr
        %3343 = arith.constant 11 : i64
        %3344 = func.call @cc_make_string(%3342, %3343) : (!llvm.ptr, i64) -> i64
        %3345 = func.call @cc_nil_value() : () -> i64
        %3346 = func.call @cc_intern(%3344, %3345) : (i64, i64) -> i64
        %3347 = func.call @cc_nil_value() : () -> i64
        %3348 = func.call @cc_cons(%3346, %3347) : (i64, i64) -> i64
        %3349 = func.call @cc_values_pack(%3348) : (i64) -> i64
        %3350 = func.call @cc_symbol_value(%3346) : (i64) -> i64
        func.call @stack_push_pointer(%3350) : (i64) -> ()
        %3351 = llvm.mlir.addressof @str305 : !llvm.ptr
        %3352 = arith.constant 9 : i64
        %3353 = func.call @cc_make_string(%3351, %3352) : (!llvm.ptr, i64) -> i64
        %3354 = func.call @cc_nil_value() : () -> i64
        %3355 = func.call @cc_intern(%3353, %3354) : (i64, i64) -> i64
        %3356 = func.call @cc_nil_value() : () -> i64
        %3357 = func.call @cc_cons(%3355, %3356) : (i64, i64) -> i64
        %3358 = func.call @cc_values_pack(%3357) : (i64) -> i64
        func.call @stack_push_pointer(%3355) : (i64) -> ()
        %3359 = func.call @stack_pop_pointer() : () -> i64
        %3360 = func.call @stack_pop_pointer() : () -> i64
        %3361 = func.call @cc_change_class(%3360, %3359) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3361) : (i64) -> ()
        %3362 = func.call @stack_pop_pointer() : () -> i64
        %3363 = func.call @cc_errorp(%3362) : (i64) -> i64
        %3364 = func.call @cc_nil_value() : () -> i64
        %3365 = arith.cmpi ne, %3363, %3364 : i64
        scf.if %3365 {
          func.call @stack_push_pointer(%3362) : (i64) -> ()
        } else {
          %3366 = func.call @cc_multiple_value_list(%3362) : (i64) -> i64
          func.call @stack_push_pointer(%3366) : (i64) -> ()
        }
        %3367 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3368 = func.call @stack_pop_pointer() : () -> i64
        %3369 = func.call @cc_nil_value() : () -> i64
        %3370 = func.call @cc_maybe_error_from_multiple_value_list(%3367) : (i64) -> i64
        %3371 = func.call @cc_errorp(%3370) : (i64) -> i64
        %3372 = arith.cmpi ne, %3371, %3369 : i64
        %3373 = arith.cmpi eq, %3369, %3369 : i64
        %3374 = arith.andi %3372, %3373 : i1
        %3375 = scf.if %3374 -> (i64) {
          scf.yield %3370 : i64
        } else {
          scf.yield %3369 : i64
        }
        %3376 = arith.cmpi ne, %3375, %3369 : i64
        scf.if %3376 {
          func.call @stack_push_pointer(%3375) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3377 = func.call @stack_pop_pointer() : () -> i64
          %3378 = func.call @cc_cons(%3368, %3377) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3378) : (i64) -> ()
          %3379 = func.call @stack_pop_pointer() : () -> i64
          %3380 = func.call @cc_cons(%3367, %3379) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3380) : (i64) -> ()
          %3381 = func.call @stack_pop_pointer() : () -> i64
          %3382 = func.call @cc_values_pack(%3381) : (i64) -> i64
          func.call @stack_push_pointer(%3382) : (i64) -> ()
        }
        %3383 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3383 : i64
      }
      func.call @stack_push_pointer(%3341) : (i64) -> ()
      %3384 = func.call @stack_pop_pointer() : () -> i64
      %3385 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3386 = func.call @cc_errorp(%3384) : (i64) -> i64
      %3387 = func.call @cc_nil_value() : () -> i64
      %3388 = arith.cmpi ne, %3386, %3387 : i64
      scf.if %3388 {
        %3389 = func.call @cc_condition_value(%3384) : (i64) -> i64
        %3390 = func.call @cc_values2(%3387, %3389) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3390) : (i64) -> ()
      } else {
        %3391 = func.call @cc_multiple_value_list(%3384) : (i64) -> i64
        %3392 = func.call @cc_values_pack(%3391) : (i64) -> i64
        func.call @stack_push_pointer(%3392) : (i64) -> ()
      }
      %3393 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3393 : i64
    }
    func.call @stack_push_pointer(%3335) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853002"() {
    %3535 = func.call @cc_nil_value() : () -> i64
    %3536 = func.call @cc_nil_value() : () -> i64
    %3537 = func.call @cc_errorp(%3535) : (i64) -> i64
    %3538 = arith.cmpi ne, %3537, %3536 : i64
    %3539 = scf.if %3538 -> (i64) {
      scf.yield %3535 : i64
    } else {
      %3540 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3541 = arith.constant 11 : i64
      %3542 = func.call @cc_make_string(%3540, %3541) : (!llvm.ptr, i64) -> i64
      %3543 = func.call @cc_nil_value() : () -> i64
      %3544 = func.call @cc_intern(%3542, %3543) : (i64, i64) -> i64
      %3545 = func.call @cc_nil_value() : () -> i64
      %3546 = func.call @cc_cons(%3544, %3545) : (i64, i64) -> i64
      %3547 = func.call @cc_values_pack(%3546) : (i64) -> i64
      %3548 = func.call @cc_symbol_value(%3544) : (i64) -> i64
      func.call @stack_push_pointer(%3548) : (i64) -> ()
      %3549 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3550 = func.call @stack_pop_pointer() : () -> i64
      %3551 = func.call @cc_cons(%3549, %3550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3551) : (i64) -> ()
      %3552 = func.call @stack_pop_pointer() : () -> i64
      %3553 = func.call @cc_values_pack(%3552) : (i64) -> i64
      func.call @stack_push_pointer(%3553) : (i64) -> ()
      %3554 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3554 : i64
    }
    func.call @stack_push_pointer(%3539) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853003"() {
    %3758 = func.call @cc_nil_value() : () -> i64
    %3759 = func.call @cc_nil_value() : () -> i64
    %3760 = func.call @cc_errorp(%3758) : (i64) -> i64
    %3761 = arith.cmpi ne, %3760, %3759 : i64
    %3762 = scf.if %3761 -> (i64) {
      scf.yield %3758 : i64
    } else {
      %3763 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3764 = func.call @cc_nil_value() : () -> i64
      %3765 = func.call @cc_nil_value() : () -> i64
      %3766 = func.call @cc_errorp(%3764) : (i64) -> i64
      %3767 = arith.cmpi ne, %3766, %3765 : i64
      %3768 = scf.if %3767 -> (i64) {
        scf.yield %3764 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3769 = llvm.mlir.addressof @str335 : !llvm.ptr
        %3770 = arith.constant 11 : i64
        %3771 = func.call @cc_make_string(%3769, %3770) : (!llvm.ptr, i64) -> i64
        %3772 = func.call @cc_nil_value() : () -> i64
        %3773 = func.call @cc_intern(%3771, %3772) : (i64, i64) -> i64
        %3774 = func.call @cc_nil_value() : () -> i64
        %3775 = func.call @cc_cons(%3773, %3774) : (i64, i64) -> i64
        %3776 = func.call @cc_values_pack(%3775) : (i64) -> i64
        %3777 = func.call @cc_symbol_value(%3773) : (i64) -> i64
        func.call @stack_push_pointer(%3777) : (i64) -> ()
        %3778 = llvm.mlir.addressof @str336 : !llvm.ptr
        %3779 = arith.constant 9 : i64
        %3780 = func.call @cc_make_string(%3778, %3779) : (!llvm.ptr, i64) -> i64
        %3781 = func.call @cc_nil_value() : () -> i64
        %3782 = func.call @cc_intern(%3780, %3781) : (i64, i64) -> i64
        %3783 = func.call @cc_nil_value() : () -> i64
        %3784 = func.call @cc_cons(%3782, %3783) : (i64, i64) -> i64
        %3785 = func.call @cc_values_pack(%3784) : (i64) -> i64
        func.call @stack_push_pointer(%3782) : (i64) -> ()
        %3786 = func.call @stack_pop_pointer() : () -> i64
        %3787 = func.call @stack_pop_pointer() : () -> i64
        %3788 = func.call @cc_change_class(%3787, %3786) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3788) : (i64) -> ()
        %3789 = func.call @stack_pop_pointer() : () -> i64
        %3790 = func.call @cc_errorp(%3789) : (i64) -> i64
        %3791 = func.call @cc_nil_value() : () -> i64
        %3792 = arith.cmpi ne, %3790, %3791 : i64
        scf.if %3792 {
          func.call @stack_push_pointer(%3789) : (i64) -> ()
        } else {
          %3793 = func.call @cc_multiple_value_list(%3789) : (i64) -> i64
          func.call @stack_push_pointer(%3793) : (i64) -> ()
        }
        %3794 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3795 = func.call @stack_pop_pointer() : () -> i64
        %3796 = func.call @cc_nil_value() : () -> i64
        %3797 = func.call @cc_maybe_error_from_multiple_value_list(%3794) : (i64) -> i64
        %3798 = func.call @cc_errorp(%3797) : (i64) -> i64
        %3799 = arith.cmpi ne, %3798, %3796 : i64
        %3800 = arith.cmpi eq, %3796, %3796 : i64
        %3801 = arith.andi %3799, %3800 : i1
        %3802 = scf.if %3801 -> (i64) {
          scf.yield %3797 : i64
        } else {
          scf.yield %3796 : i64
        }
        %3803 = arith.cmpi ne, %3802, %3796 : i64
        scf.if %3803 {
          func.call @stack_push_pointer(%3802) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3804 = func.call @stack_pop_pointer() : () -> i64
          %3805 = func.call @cc_cons(%3795, %3804) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3805) : (i64) -> ()
          %3806 = func.call @stack_pop_pointer() : () -> i64
          %3807 = func.call @cc_cons(%3794, %3806) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3807) : (i64) -> ()
          %3808 = func.call @stack_pop_pointer() : () -> i64
          %3809 = func.call @cc_values_pack(%3808) : (i64) -> i64
          func.call @stack_push_pointer(%3809) : (i64) -> ()
        }
        %3810 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3810 : i64
      }
      func.call @stack_push_pointer(%3768) : (i64) -> ()
      %3811 = func.call @stack_pop_pointer() : () -> i64
      %3812 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3813 = func.call @cc_errorp(%3811) : (i64) -> i64
      %3814 = func.call @cc_nil_value() : () -> i64
      %3815 = arith.cmpi ne, %3813, %3814 : i64
      scf.if %3815 {
        %3816 = func.call @cc_condition_value(%3811) : (i64) -> i64
        %3817 = func.call @cc_values2(%3814, %3816) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3817) : (i64) -> ()
      } else {
        %3818 = func.call @cc_multiple_value_list(%3811) : (i64) -> i64
        %3819 = func.call @cc_values_pack(%3818) : (i64) -> i64
        func.call @stack_push_pointer(%3819) : (i64) -> ()
      }
      %3820 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3820 : i64
    }
    func.call @stack_push_pointer(%3762) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853004"() {
    %3962 = func.call @cc_nil_value() : () -> i64
    %3963 = func.call @cc_nil_value() : () -> i64
    %3964 = func.call @cc_errorp(%3962) : (i64) -> i64
    %3965 = arith.cmpi ne, %3964, %3963 : i64
    %3966 = scf.if %3965 -> (i64) {
      scf.yield %3962 : i64
    } else {
      %3967 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3968 = arith.constant 11 : i64
      %3969 = func.call @cc_make_string(%3967, %3968) : (!llvm.ptr, i64) -> i64
      %3970 = func.call @cc_nil_value() : () -> i64
      %3971 = func.call @cc_intern(%3969, %3970) : (i64, i64) -> i64
      %3972 = func.call @cc_nil_value() : () -> i64
      %3973 = func.call @cc_cons(%3971, %3972) : (i64, i64) -> i64
      %3974 = func.call @cc_values_pack(%3973) : (i64) -> i64
      %3975 = func.call @cc_symbol_value(%3971) : (i64) -> i64
      func.call @stack_push_pointer(%3975) : (i64) -> ()
      %3976 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3977 = func.call @stack_pop_pointer() : () -> i64
      %3978 = func.call @cc_cons(%3976, %3977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3978) : (i64) -> ()
      %3979 = func.call @stack_pop_pointer() : () -> i64
      %3980 = func.call @cc_values_pack(%3979) : (i64) -> i64
      func.call @stack_push_pointer(%3980) : (i64) -> ()
      %3981 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3981 : i64
    }
    func.call @stack_push_pointer(%3966) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853005_before"() {
    %4080 = func.call @stack_pop_pointer() : () -> i64
    %4081 = func.call @stack_pop_pointer() : () -> i64
    %4082 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    func.return
  }
  func.func @"__lambda_47863920853006"() {
    %4433 = func.call @cc_nil_value() : () -> i64
    %4434 = func.call @cc_nil_value() : () -> i64
    %4435 = func.call @cc_errorp(%4433) : (i64) -> i64
    %4436 = arith.cmpi ne, %4435, %4434 : i64
    %4437 = scf.if %4436 -> (i64) {
      scf.yield %4433 : i64
    } else {
      %4438 = func.call @cc_nil_value() : () -> i64
      %4439 = func.call @cc_nil_value() : () -> i64
      %4440 = func.call @cc_errorp(%4438) : (i64) -> i64
      %4441 = arith.cmpi ne, %4440, %4439 : i64
      %4442 = scf.if %4441 -> (i64) {
        scf.yield %4438 : i64
      } else {
        %4443 = llvm.mlir.addressof @str392 : !llvm.ptr
        %4444 = arith.constant 11 : i64
        %4445 = func.call @cc_make_string(%4443, %4444) : (!llvm.ptr, i64) -> i64
        %4446 = func.call @cc_nil_value() : () -> i64
        %4447 = func.call @cc_intern(%4445, %4446) : (i64, i64) -> i64
        %4448 = func.call @cc_nil_value() : () -> i64
        %4449 = func.call @cc_cons(%4447, %4448) : (i64, i64) -> i64
        %4450 = func.call @cc_values_pack(%4449) : (i64) -> i64
        %4451 = func.call @cc_symbol_value(%4447) : (i64) -> i64
        func.call @stack_push_pointer(%4451) : (i64) -> ()
        %4452 = llvm.mlir.addressof @str393 : !llvm.ptr
        %4453 = arith.constant 9 : i64
        %4454 = func.call @cc_make_string(%4452, %4453) : (!llvm.ptr, i64) -> i64
        %4455 = func.call @cc_nil_value() : () -> i64
        %4456 = func.call @cc_intern(%4454, %4455) : (i64, i64) -> i64
        %4457 = func.call @cc_nil_value() : () -> i64
        %4458 = func.call @cc_cons(%4456, %4457) : (i64, i64) -> i64
        %4459 = func.call @cc_values_pack(%4458) : (i64) -> i64
        func.call @stack_push_pointer(%4456) : (i64) -> ()
        %4460 = func.call @stack_pop_pointer() : () -> i64
        %4461 = func.call @stack_pop_pointer() : () -> i64
        %4462 = func.call @cc_change_class(%4461, %4460) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4462) : (i64) -> ()
        %4463 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4463 : i64
      }
      %4464 = func.call @cc_nil_value() : () -> i64
      %4465 = func.call @cc_errorp(%4442) : (i64) -> i64
      %4466 = arith.cmpi ne, %4465, %4464 : i64
      %4467 = scf.if %4466 -> (i64) {
        scf.yield %4442 : i64
      } else {
        %4468 = llvm.mlir.addressof @str394 : !llvm.ptr
        %4469 = arith.constant 11 : i64
        %4470 = func.call @cc_make_string(%4468, %4469) : (!llvm.ptr, i64) -> i64
        %4471 = func.call @cc_nil_value() : () -> i64
        %4472 = func.call @cc_intern(%4470, %4471) : (i64, i64) -> i64
        %4473 = func.call @cc_nil_value() : () -> i64
        %4474 = func.call @cc_cons(%4472, %4473) : (i64, i64) -> i64
        %4475 = func.call @cc_values_pack(%4474) : (i64) -> i64
        %4476 = func.call @cc_symbol_value(%4472) : (i64) -> i64
        func.call @stack_push_pointer(%4476) : (i64) -> ()
        %4477 = func.call @stack_pop_pointer() : () -> i64
        %4478 = llvm.mlir.addressof @str395 : !llvm.ptr
        %4479 = arith.constant 4 : i64
        %4480 = func.call @cc_make_string(%4478, %4479) : (!llvm.ptr, i64) -> i64
        %4481 = func.call @cc_nil_value() : () -> i64
        %4482 = func.call @cc_intern(%4480, %4481) : (i64, i64) -> i64
        %4483 = func.call @cc_nil_value() : () -> i64
        %4484 = func.call @cc_cons(%4482, %4483) : (i64, i64) -> i64
        %4485 = func.call @cc_values_pack(%4484) : (i64) -> i64
        func.call @stack_push_pointer(%4482) : (i64) -> ()
        %4486 = func.call @stack_pop_pointer() : () -> i64
        %4487 = func.call @cc_nil_value() : () -> i64
        %4488 = func.call @cc_errorp(%4477) : (i64) -> i64
        %4489 = arith.cmpi ne, %4488, %4487 : i64
        %4490 = arith.cmpi eq, %4487, %4487 : i64
        %4491 = arith.andi %4489, %4490 : i1
        %4492 = scf.if %4491 -> (i64) {
          scf.yield %4477 : i64
        } else {
          scf.yield %4487 : i64
        }
        %4493 = func.call @cc_errorp(%4486) : (i64) -> i64
        %4494 = arith.cmpi ne, %4493, %4487 : i64
        %4495 = arith.cmpi eq, %4492, %4487 : i64
        %4496 = arith.andi %4494, %4495 : i1
        %4497 = scf.if %4496 -> (i64) {
          scf.yield %4486 : i64
        } else {
          scf.yield %4492 : i64
        }
        %4498 = arith.cmpi ne, %4497, %4487 : i64
        scf.if %4498 {
          func.call @stack_push_pointer(%4497) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4477) : (i64) -> ()
          func.call @stack_push_pointer(%4486) : (i64) -> ()
          %4499 = llvm.mlir.addressof @str396 : !llvm.ptr
          %4500 = func.call @cc_make_function_ref_const(%4499) : (!llvm.ptr) -> i64
          %4501 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4500, %4501) : (i64, i64) -> ()
        }
        %4502 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4502 : i64
      }
      func.call @stack_push_pointer(%4467) : (i64) -> ()
      %4503 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4503 : i64
    }
    func.call @stack_push_pointer(%4437) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853007"() {
    %4627 = func.call @cc_nil_value() : () -> i64
    %4628 = func.call @cc_nil_value() : () -> i64
    %4629 = func.call @cc_errorp(%4627) : (i64) -> i64
    %4630 = arith.cmpi ne, %4629, %4628 : i64
    %4631 = scf.if %4630 -> (i64) {
      scf.yield %4627 : i64
    } else {
      %4632 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4633 = arith.constant 11 : i64
      %4634 = func.call @cc_make_string(%4632, %4633) : (!llvm.ptr, i64) -> i64
      %4635 = func.call @cc_nil_value() : () -> i64
      %4636 = func.call @cc_intern(%4634, %4635) : (i64, i64) -> i64
      %4637 = func.call @cc_nil_value() : () -> i64
      %4638 = func.call @cc_cons(%4636, %4637) : (i64, i64) -> i64
      %4639 = func.call @cc_values_pack(%4638) : (i64) -> i64
      %4640 = func.call @cc_symbol_value(%4636) : (i64) -> i64
      func.call @stack_push_pointer(%4640) : (i64) -> ()
      %4641 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4642 = func.call @stack_pop_pointer() : () -> i64
      %4643 = func.call @cc_cons(%4641, %4642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4643) : (i64) -> ()
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = func.call @cc_values_pack(%4644) : (i64) -> i64
      func.call @stack_push_pointer(%4645) : (i64) -> ()
      %4646 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4646 : i64
    }
    func.call @stack_push_pointer(%4631) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_47863920852992*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_47863920852992*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_47863920852992*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str5("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str6("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str8("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str10("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str11("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str12("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str15("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str16("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str18("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @method_name_47863920852993("clos:validate-superclass_47863920852993_primary\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str20("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str21("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str23("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str25("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str28("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str29("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str30("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str31("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str32("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str33("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str34("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str36("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str37("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str38("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str39("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP:CALL-NEXT-METHOD\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str41("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str46("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str47("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @method_name_47863920852994("COMMON-LISP:SHARED-INITIALIZE_47863920852994_around\00") : !llvm.array<52 x i8>
  llvm.mlir.global private constant @str49("SHARED-INITIALIZE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str52("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str53("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str54("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str55("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str56("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str57("REST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str60("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str61("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str66("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("REMOVE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("SLOT-NAMES\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str78("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("CALL-NEXT-METHOD\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str83("APPLY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str86("&KEY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("REST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("SLOT-NAMES\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str93("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str94("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("AROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str97("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str98("SHARED-INITIALIZE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str101("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str102("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @method_name_47863920852995("COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852995_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str104("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str107("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str108("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str109("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str110("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str111("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str112("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str113("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str114("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str117("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str118("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str119("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str125("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str126("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str128("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str129("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str131("INSTANCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str132("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str137("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str138("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str139("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str140("METACLASS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str141("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str142("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str143("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str144("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str146("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str147("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str148("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str149("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str150("METACLASS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("INITFORM\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str156("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str157("UIFRC.ABORT.1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str158("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str159("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str160("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str161("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str162("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str163("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str165("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str166("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str167("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str170("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str171("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str172("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str173("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str174("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str176("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str177("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str178("UIFRC.ABORT.2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str179("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str180("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str181("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str183("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str184("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str185("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str188("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str190("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str191("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str193("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str198("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @method_name_47863920852998("COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852998_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str200("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str201("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str202("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str203("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str204("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str205("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str207("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str208("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str209("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str210("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str211("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str213("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str214("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str217("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str218("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str220("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str221("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str223("INSTANCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str224("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str225("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str229("UIFRC.ABORT.3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str230("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str234("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str235("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str237("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str238("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str240("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str241("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str242("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str243("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str244("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str247("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str248("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str249("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str250("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str251("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str252("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str253("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str254("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str255("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str256("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str257("INITFORM\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str261("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str262("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str263("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @method_name_47863920853000("COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853000_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str265("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str266("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str267("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str268("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str269("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str270("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str271("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str272("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str273("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str274("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str275("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str276("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str277("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str281("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str282("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str283("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str284("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str285("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str286("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str287("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str288("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str289("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str292("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str293("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str294("UIFDC.ABORT.1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str295("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str296("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str298("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str299("CHANGE-CLASS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str300("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str301("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str303("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str304("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str306("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str307("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str308("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str310("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str313("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str314("UIFDC-ABORT.2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str315("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str316("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str318("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str319("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str321("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str322("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str323("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str324("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str325("UIFDC.ABORT.3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str326("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str327("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str329("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str330("CHANGE-CLASS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str331("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str333("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str334("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str335("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str337("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str338("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str339("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str340("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str341("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str342("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str343("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str344("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str345("UIFDC-ABORT.4\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str346("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str347("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str348("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str349("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str350("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str351("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str352("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str353("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str354("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str355("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @method_name_47863920853005("COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853005_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str357("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str358("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str359("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str360("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str361("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str362("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str363("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str364("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str365("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str366("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str367("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str368("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str369("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str370("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str371("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str372("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str373("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str374("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str375("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str376("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str377("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str378("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str379("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str380("UIFDC.ABORT.5\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str381("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str382("CHANGE-CLASS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str383("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str386("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str387("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str388("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str389("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str390("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str391("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str392("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str393("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str394("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str395("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str396("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str397("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str398("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str399("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str400("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str401("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str402("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str403("UIFDC.ABORT.6\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str404("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str405("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str406("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str407("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str408("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str409("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str410("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str411("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str412("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str413("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str414("*__MLIR_BLOCK_RETFLAG_47863920852992*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str415("*__MLIR_BLOCK_RETMVLIST_47863920852992*\00") : !llvm.array<40 x i8>
}
