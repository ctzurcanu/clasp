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
  func.func private @cc_bits_to_single_float(i64) -> i64
  func.func private @cc_bits_to_double_float(i64) -> i64
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
  func.func @"%FN%qsort"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 5 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 26 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @stack_pop_pointer() : () -> i64
    %15 = func.call @stack_pop_pointer() : () -> i64
    %16 = func.call @cc_nil_value() : () -> i64
    %17 = llvm.mlir.addressof @str2 : !llvm.ptr
    %18 = arith.constant 38 : i64
    %19 = func.call @cc_make_string(%17, %18) : (!llvm.ptr, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = func.call @cc_intern(%19, %20) : (i64, i64) -> i64
    %22 = func.call @cc_nil_value() : () -> i64
    %23 = func.call @cc_cons(%21, %22) : (i64, i64) -> i64
    %24 = func.call @cc_values_pack(%23) : (i64) -> i64
    %25 = func.call @cc_set_symbol_value(%21, %16) : (i64, i64) -> i64
    %26 = llvm.mlir.addressof @str3 : !llvm.ptr
    %27 = arith.constant 39 : i64
    %28 = func.call @cc_make_string(%26, %27) : (!llvm.ptr, i64) -> i64
    %29 = func.call @cc_nil_value() : () -> i64
    %30 = func.call @cc_intern(%28, %29) : (i64, i64) -> i64
    %31 = func.call @cc_nil_value() : () -> i64
    %32 = func.call @cc_cons(%30, %31) : (i64, i64) -> i64
    %33 = func.call @cc_values_pack(%32) : (i64) -> i64
    %34 = func.call @cc_set_symbol_value(%30, %16) : (i64, i64) -> i64
    %35 = llvm.mlir.addressof @str4 : !llvm.ptr
    %36 = arith.constant 40 : i64
    %37 = func.call @cc_make_string(%35, %36) : (!llvm.ptr, i64) -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_intern(%37, %38) : (i64, i64) -> i64
    %40 = func.call @cc_nil_value() : () -> i64
    %41 = func.call @cc_cons(%39, %40) : (i64, i64) -> i64
    %42 = func.call @cc_values_pack(%41) : (i64) -> i64
    %43 = func.call @cc_set_symbol_value(%39, %16) : (i64, i64) -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = func.call @cc_errorp(%44) : (i64) -> i64
    %47 = arith.cmpi ne, %46, %45 : i64
    %48 = scf.if %47 -> (i64) {
      scf.yield %44 : i64
    } else {
      %49 = llvm.mlir.addressof @str5 : !llvm.ptr
      %50 = arith.constant 5 : i64
      %51 = func.call @cc_make_string(%49, %50) : (!llvm.ptr, i64) -> i64
      %52 = llvm.mlir.addressof @str6 : !llvm.ptr
      %53 = arith.constant 7 : i64
      %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
      %55 = llvm.mlir.addressof @str7 : !llvm.ptr
      %56 = arith.constant 7 : i64
      %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
      %58 = func.call @cc_intern(%54, %57) : (i64, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_cons(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_values_pack(%60) : (i64) -> i64
      %62 = llvm.mlir.addressof @str8 : !llvm.ptr
      %63 = arith.constant 3 : i64
      %64 = func.call @cc_make_string(%62, %63) : (!llvm.ptr, i64) -> i64
      %65 = llvm.mlir.addressof @str9 : !llvm.ptr
      %66 = arith.constant 7 : i64
      %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
      %68 = func.call @cc_intern(%64, %67) : (i64, i64) -> i64
      %69 = func.call @cc_nil_value() : () -> i64
      %70 = func.call @cc_cons(%68, %69) : (i64, i64) -> i64
      %71 = func.call @cc_values_pack(%70) : (i64) -> i64
      %72 = llvm.mlir.addressof @str10 : !llvm.ptr
      %73 = arith.constant 3 : i64
      %74 = func.call @cc_make_string(%72, %73) : (!llvm.ptr, i64) -> i64
      %75 = llvm.mlir.addressof @str11 : !llvm.ptr
      %76 = arith.constant 7 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = func.call @cc_intern(%74, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      %82 = llvm.mlir.addressof @str12 : !llvm.ptr
      %83 = arith.constant 7 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = llvm.mlir.addressof @str13 : !llvm.ptr
      %86 = arith.constant 7 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      %88 = func.call @cc_intern(%84, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      %92 = llvm.mlir.addressof @str14 : !llvm.ptr
      %93 = arith.constant 4 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = llvm.mlir.addressof @str15 : !llvm.ptr
      %96 = arith.constant 7 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = func.call @cc_intern(%94, %97) : (i64, i64) -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
      %101 = func.call @cc_values_pack(%100) : (i64) -> i64
      %102 = func.call @cc_nil_value() : () -> i64
      %103 = func.call @cc_errorp(%51) : (i64) -> i64
      %104 = arith.cmpi ne, %103, %102 : i64
      %105 = arith.cmpi eq, %102, %102 : i64
      %106 = arith.andi %104, %105 : i1
      %107 = scf.if %106 -> (i64) {
        scf.yield %51 : i64
      } else {
        scf.yield %102 : i64
      }
      %108 = func.call @cc_errorp(%58) : (i64) -> i64
      %109 = arith.cmpi ne, %108, %102 : i64
      %110 = arith.cmpi eq, %107, %102 : i64
      %111 = arith.andi %109, %110 : i1
      %112 = scf.if %111 -> (i64) {
        scf.yield %58 : i64
      } else {
        scf.yield %107 : i64
      }
      %113 = func.call @cc_errorp(%15) : (i64) -> i64
      %114 = arith.cmpi ne, %113, %102 : i64
      %115 = arith.cmpi eq, %112, %102 : i64
      %116 = arith.andi %114, %115 : i1
      %117 = scf.if %116 -> (i64) {
        scf.yield %15 : i64
      } else {
        scf.yield %112 : i64
      }
      %118 = func.call @cc_errorp(%68) : (i64) -> i64
      %119 = arith.cmpi ne, %118, %102 : i64
      %120 = arith.cmpi eq, %117, %102 : i64
      %121 = arith.andi %119, %120 : i1
      %122 = scf.if %121 -> (i64) {
        scf.yield %68 : i64
      } else {
        scf.yield %117 : i64
      }
      %123 = func.call @cc_errorp(%14) : (i64) -> i64
      %124 = arith.cmpi ne, %123, %102 : i64
      %125 = arith.cmpi eq, %122, %102 : i64
      %126 = arith.andi %124, %125 : i1
      %127 = scf.if %126 -> (i64) {
        scf.yield %14 : i64
      } else {
        scf.yield %122 : i64
      }
      %128 = func.call @cc_errorp(%78) : (i64) -> i64
      %129 = arith.cmpi ne, %128, %102 : i64
      %130 = arith.cmpi eq, %127, %102 : i64
      %131 = arith.andi %129, %130 : i1
      %132 = scf.if %131 -> (i64) {
        scf.yield %78 : i64
      } else {
        scf.yield %127 : i64
      }
      %133 = func.call @cc_errorp(%13) : (i64) -> i64
      %134 = arith.cmpi ne, %133, %102 : i64
      %135 = arith.cmpi eq, %132, %102 : i64
      %136 = arith.andi %134, %135 : i1
      %137 = scf.if %136 -> (i64) {
        scf.yield %13 : i64
      } else {
        scf.yield %132 : i64
      }
      %138 = func.call @cc_errorp(%88) : (i64) -> i64
      %139 = arith.cmpi ne, %138, %102 : i64
      %140 = arith.cmpi eq, %137, %102 : i64
      %141 = arith.andi %139, %140 : i1
      %142 = scf.if %141 -> (i64) {
        scf.yield %88 : i64
      } else {
        scf.yield %137 : i64
      }
      %143 = func.call @cc_errorp(%12) : (i64) -> i64
      %144 = arith.cmpi ne, %143, %102 : i64
      %145 = arith.cmpi eq, %142, %102 : i64
      %146 = arith.andi %144, %145 : i1
      %147 = scf.if %146 -> (i64) {
        scf.yield %12 : i64
      } else {
        scf.yield %142 : i64
      }
      %148 = func.call @cc_errorp(%98) : (i64) -> i64
      %149 = arith.cmpi ne, %148, %102 : i64
      %150 = arith.cmpi eq, %147, %102 : i64
      %151 = arith.andi %149, %150 : i1
      %152 = scf.if %151 -> (i64) {
        scf.yield %98 : i64
      } else {
        scf.yield %147 : i64
      }
      %153 = arith.cmpi ne, %152, %102 : i64
      scf.if %153 {
        func.call @stack_push_pointer(%152) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%51) : (i64) -> ()
        func.call @stack_push_pointer(%58) : (i64) -> ()
        func.call @stack_push_pointer(%15) : (i64) -> ()
        func.call @stack_push_pointer(%68) : (i64) -> ()
        func.call @stack_push_pointer(%14) : (i64) -> ()
        func.call @stack_push_pointer(%78) : (i64) -> ()
        func.call @stack_push_pointer(%13) : (i64) -> ()
        func.call @stack_push_pointer(%88) : (i64) -> ()
        func.call @stack_push_pointer(%12) : (i64) -> ()
        func.call @stack_push_pointer(%98) : (i64) -> ()
        %154 = llvm.mlir.addressof @str16 : !llvm.ptr
        %155 = func.call @cc_make_function_ref_const(%154) : (!llvm.ptr) -> i64
        %156 = arith.constant 10 : i64
        func.call @cc_funcall_stack(%155, %156) : (i64, i64) -> ()
      }
      %157 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %157 : i64
    }
    %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
    %158 = arith.addi %48, %__rlasp_stack_elide_zero_0 : i64
    %159 = func.call @cc_multiple_value_list(%158) : (i64) -> i64
    %160 = llvm.mlir.addressof @str17 : !llvm.ptr
    %161 = arith.constant 38 : i64
    %162 = func.call @cc_make_string(%160, %161) : (!llvm.ptr, i64) -> i64
    %163 = func.call @cc_nil_value() : () -> i64
    %164 = func.call @cc_intern(%162, %163) : (i64, i64) -> i64
    %165 = func.call @cc_nil_value() : () -> i64
    %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
    %167 = func.call @cc_values_pack(%166) : (i64) -> i64
    %168 = func.call @cc_symbol_value(%164) : (i64) -> i64
    %169 = llvm.mlir.addressof @str18 : !llvm.ptr
    %170 = arith.constant 40 : i64
    %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
    %172 = func.call @cc_nil_value() : () -> i64
    %173 = func.call @cc_intern(%171, %172) : (i64, i64) -> i64
    %174 = func.call @cc_nil_value() : () -> i64
    %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
    %176 = func.call @cc_values_pack(%175) : (i64) -> i64
    %177 = func.call @cc_symbol_value(%173) : (i64) -> i64
    %178 = func.call @cc_nil_value() : () -> i64
    %179 = arith.cmpi ne, %168, %178 : i64
    %180 = scf.if %179 -> (i64) {
      scf.yield %177 : i64
    } else {
      scf.yield %159 : i64
    }
    %181 = func.call @cc_values_pack(%180) : (i64) -> i64
    func.call @stack_push_pointer(%181) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %182 = llvm.mlir.addressof @str19 : !llvm.ptr
    %183 = arith.constant 6 : i64
    %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
    %185 = func.call @cc_nil_value() : () -> i64
    %186 = func.call @cc_intern(%184, %185) : (i64, i64) -> i64
    %187 = func.call @cc_nil_value() : () -> i64
    %188 = func.call @cc_cons(%186, %187) : (i64, i64) -> i64
    %189 = func.call @cc_values_pack(%188) : (i64) -> i64
    %190 = func.call @cc_nil_value() : () -> i64
    %191 = llvm.mlir.addressof @str20 : !llvm.ptr
    %192 = arith.constant 38 : i64
    %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
    %194 = func.call @cc_nil_value() : () -> i64
    %195 = func.call @cc_intern(%193, %194) : (i64, i64) -> i64
    %196 = func.call @cc_nil_value() : () -> i64
    %197 = func.call @cc_cons(%195, %196) : (i64, i64) -> i64
    %198 = func.call @cc_values_pack(%197) : (i64) -> i64
    %199 = func.call @cc_set_symbol_value(%195, %190) : (i64, i64) -> i64
    %200 = llvm.mlir.addressof @str21 : !llvm.ptr
    %201 = arith.constant 39 : i64
    %202 = func.call @cc_make_string(%200, %201) : (!llvm.ptr, i64) -> i64
    %203 = func.call @cc_nil_value() : () -> i64
    %204 = func.call @cc_intern(%202, %203) : (i64, i64) -> i64
    %205 = func.call @cc_nil_value() : () -> i64
    %206 = func.call @cc_cons(%204, %205) : (i64, i64) -> i64
    %207 = func.call @cc_values_pack(%206) : (i64) -> i64
    %208 = func.call @cc_set_symbol_value(%204, %190) : (i64, i64) -> i64
    %209 = llvm.mlir.addressof @str22 : !llvm.ptr
    %210 = arith.constant 40 : i64
    %211 = func.call @cc_make_string(%209, %210) : (!llvm.ptr, i64) -> i64
    %212 = func.call @cc_nil_value() : () -> i64
    %213 = func.call @cc_intern(%211, %212) : (i64, i64) -> i64
    %214 = func.call @cc_nil_value() : () -> i64
    %215 = func.call @cc_cons(%213, %214) : (i64, i64) -> i64
    %216 = func.call @cc_values_pack(%215) : (i64) -> i64
    %217 = func.call @cc_set_symbol_value(%213, %190) : (i64, i64) -> i64
    %218 = func.call @cc_nil_value() : () -> i64
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_errorp(%218) : (i64) -> i64
    %221 = arith.cmpi ne, %220, %219 : i64
    %222 = scf.if %221 -> (i64) {
      scf.yield %218 : i64
    } else {
      %223 = llvm.mlir.addressof @str23 : !llvm.ptr
      %224 = arith.constant 11 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %231 = arith.addi %227, %__rlasp_stack_elide_zero_1 : i64
      %232 = func.call @cc_in_package(%231) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %233 = arith.addi %232, %__rlasp_stack_elide_zero_2 : i64
      scf.yield %233 : i64
    }
    %234 = func.call @cc_nil_value() : () -> i64
    %235 = func.call @cc_errorp(%222) : (i64) -> i64
    %236 = arith.cmpi ne, %235, %234 : i64
    %237 = scf.if %236 -> (i64) {
      scf.yield %222 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %238 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %238 : i64
    }
    %239 = func.call @cc_nil_value() : () -> i64
    %240 = func.call @cc_errorp(%237) : (i64) -> i64
    %241 = arith.cmpi ne, %240, %239 : i64
    %242 = scf.if %241 -> (i64) {
      scf.yield %237 : i64
    } else {
      %243 = llvm.mlir.addressof @str24 : !llvm.ptr
      %244 = arith.constant 16 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = func.call @cc_nil_value() : () -> i64
      %247 = func.call @cc_intern(%245, %246) : (i64, i64) -> i64
      %248 = func.call @cc_nil_value() : () -> i64
      %249 = func.call @cc_cons(%247, %248) : (i64, i64) -> i64
      %250 = func.call @cc_values_pack(%249) : (i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %251 = arith.addi %247, %__rlasp_stack_elide_zero_3 : i64
      %252 = llvm.mlir.addressof @str25 : !llvm.ptr
      %253 = arith.constant 4 : i64
      %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
      %255 = func.call @cc_nil_value() : () -> i64
      %256 = func.call @cc_intern(%254, %255) : (i64, i64) -> i64
      %257 = func.call @cc_nil_value() : () -> i64
      %258 = func.call @cc_cons(%256, %257) : (i64, i64) -> i64
      %259 = func.call @cc_values_pack(%258) : (i64) -> i64
      func.call @stack_push_pointer(%256) : (i64) -> ()
      %260 = llvm.mlir.addressof @str26 : !llvm.ptr
      %261 = arith.constant 7 : i64
      %262 = func.call @cc_make_string(%260, %261) : (!llvm.ptr, i64) -> i64
      %263 = func.call @cc_nil_value() : () -> i64
      %264 = func.call @cc_intern(%262, %263) : (i64, i64) -> i64
      %265 = func.call @cc_nil_value() : () -> i64
      %266 = func.call @cc_cons(%264, %265) : (i64, i64) -> i64
      %267 = func.call @cc_values_pack(%266) : (i64) -> i64
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %268 = llvm.mlir.addressof @str27 : !llvm.ptr
      %269 = arith.constant 18 : i64
      %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
      %271 = llvm.mlir.addressof @str28 : !llvm.ptr
      %272 = arith.constant 9 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      %274 = func.call @cc_intern(%270, %273) : (i64, i64) -> i64
      %275 = func.call @cc_nil_value() : () -> i64
      %276 = func.call @cc_cons(%274, %275) : (i64, i64) -> i64
      %277 = func.call @cc_values_pack(%276) : (i64) -> i64
      func.call @stack_push_pointer(%274) : (i64) -> ()
      %278 = llvm.mlir.addressof @str29 : !llvm.ptr
      %279 = arith.constant 3 : i64
      %280 = func.call @cc_make_string(%278, %279) : (!llvm.ptr, i64) -> i64
      %281 = llvm.mlir.addressof @str30 : !llvm.ptr
      %282 = arith.constant 7 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = func.call @cc_intern(%280, %283) : (i64, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_cons(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_values_pack(%286) : (i64) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @stack_pop_pointer() : () -> i64
      %290 = func.call @cc_cons(%289, %288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %291 = arith.addi %290, %__rlasp_stack_elide_zero_4 : i64
      %292 = func.call @stack_pop_pointer() : () -> i64
      %293 = func.call @cc_cons(%292, %291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @cc_cons(%295, %294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %297 = arith.addi %296, %__rlasp_stack_elide_zero_5 : i64
      %298 = func.call @stack_pop_pointer() : () -> i64
      %299 = func.call @cc_cons(%298, %297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      %300 = llvm.mlir.addressof @str31 : !llvm.ptr
      %301 = arith.constant 5 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = llvm.mlir.addressof @str32 : !llvm.ptr
      %304 = arith.constant 11 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = func.call @cc_intern(%302, %305) : (i64, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_cons(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_values_pack(%308) : (i64) -> i64
      func.call @stack_push_pointer(%306) : (i64) -> ()
      %310 = llvm.mlir.addressof @str33 : !llvm.ptr
      %311 = arith.constant 14 : i64
      %312 = func.call @cc_make_string(%310, %311) : (!llvm.ptr, i64) -> i64
      %313 = llvm.mlir.addressof @str34 : !llvm.ptr
      %314 = arith.constant 9 : i64
      %315 = func.call @cc_make_string(%313, %314) : (!llvm.ptr, i64) -> i64
      %316 = func.call @cc_intern(%312, %315) : (i64, i64) -> i64
      %317 = func.call @cc_nil_value() : () -> i64
      %318 = func.call @cc_cons(%316, %317) : (i64, i64) -> i64
      %319 = func.call @cc_values_pack(%318) : (i64) -> i64
      func.call @stack_push_pointer(%316) : (i64) -> ()
      %320 = llvm.mlir.addressof @str35 : !llvm.ptr
      %321 = arith.constant 1 : i64
      %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
      %323 = llvm.mlir.addressof @str36 : !llvm.ptr
      %324 = arith.constant 11 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = func.call @cc_intern(%322, %325) : (i64, i64) -> i64
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_cons(%326, %327) : (i64, i64) -> i64
      %329 = func.call @cc_values_pack(%328) : (i64) -> i64
      func.call @stack_push_pointer(%326) : (i64) -> ()
      %330 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%330) : (i64) -> ()
      %331 = llvm.mlir.addressof @str37 : !llvm.ptr
      %332 = arith.constant 7 : i64
      %333 = func.call @cc_make_string(%331, %332) : (!llvm.ptr, i64) -> i64
      %334 = func.call @cc_nil_value() : () -> i64
      %335 = func.call @cc_intern(%333, %334) : (i64, i64) -> i64
      %336 = func.call @cc_nil_value() : () -> i64
      %337 = func.call @cc_cons(%335, %336) : (i64, i64) -> i64
      %338 = func.call @cc_values_pack(%337) : (i64) -> i64
      func.call @stack_push_pointer(%335) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %339 = func.call @stack_pop_pointer() : () -> i64
      %340 = func.call @stack_pop_pointer() : () -> i64
      %341 = func.call @cc_cons(%340, %339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %342 = arith.addi %341, %__rlasp_stack_elide_zero_6 : i64
      %343 = func.call @stack_pop_pointer() : () -> i64
      %344 = func.call @cc_cons(%343, %342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %345 = arith.addi %344, %__rlasp_stack_elide_zero_7 : i64
      %346 = func.call @stack_pop_pointer() : () -> i64
      %347 = func.call @cc_cons(%346, %345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %348 = func.call @stack_pop_pointer() : () -> i64
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = func.call @cc_cons(%349, %348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %351 = arith.addi %350, %__rlasp_stack_elide_zero_8 : i64
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @cc_cons(%352, %351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = func.call @cc_cons(%355, %354) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %357 = arith.addi %356, %__rlasp_stack_elide_zero_9 : i64
      %358 = func.call @stack_pop_pointer() : () -> i64
      %359 = func.call @cc_cons(%358, %357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @stack_pop_pointer() : () -> i64
      %362 = func.call @cc_cons(%361, %360) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %363 = arith.addi %362, %__rlasp_stack_elide_zero_10 : i64
      %364 = func.call @stack_pop_pointer() : () -> i64
      %365 = func.call @cc_cons(%364, %363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%365) : (i64) -> ()
      %366 = llvm.mlir.addressof @str38 : !llvm.ptr
      %367 = arith.constant 14 : i64
      %368 = func.call @cc_make_string(%366, %367) : (!llvm.ptr, i64) -> i64
      %369 = llvm.mlir.addressof @str39 : !llvm.ptr
      %370 = arith.constant 11 : i64
      %371 = func.call @cc_make_string(%369, %370) : (!llvm.ptr, i64) -> i64
      %372 = func.call @cc_intern(%368, %371) : (i64, i64) -> i64
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
      %375 = func.call @cc_values_pack(%374) : (i64) -> i64
      func.call @stack_push_pointer(%372) : (i64) -> ()
      %376 = llvm.mlir.addressof @str40 : !llvm.ptr
      %377 = arith.constant 5 : i64
      %378 = func.call @cc_make_string(%376, %377) : (!llvm.ptr, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_intern(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_nil_value() : () -> i64
      %382 = func.call @cc_cons(%380, %381) : (i64, i64) -> i64
      %383 = func.call @cc_values_pack(%382) : (i64) -> i64
      func.call @stack_push_pointer(%380) : (i64) -> ()
      %384 = llvm.mlir.addressof @str41 : !llvm.ptr
      %385 = arith.constant 4 : i64
      %386 = func.call @cc_make_string(%384, %385) : (!llvm.ptr, i64) -> i64
      %387 = func.call @cc_nil_value() : () -> i64
      %388 = func.call @cc_intern(%386, %387) : (i64, i64) -> i64
      %389 = func.call @cc_nil_value() : () -> i64
      %390 = func.call @cc_cons(%388, %389) : (i64, i64) -> i64
      %391 = func.call @cc_values_pack(%390) : (i64) -> i64
      func.call @stack_push_pointer(%388) : (i64) -> ()
      %392 = llvm.mlir.addressof @str42 : !llvm.ptr
      %393 = arith.constant 3 : i64
      %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
      %395 = func.call @cc_nil_value() : () -> i64
      %396 = func.call @cc_intern(%394, %395) : (i64, i64) -> i64
      %397 = func.call @cc_nil_value() : () -> i64
      %398 = func.call @cc_cons(%396, %397) : (i64, i64) -> i64
      %399 = func.call @cc_values_pack(%398) : (i64) -> i64
      func.call @stack_push_pointer(%396) : (i64) -> ()
      %400 = llvm.mlir.addressof @str43 : !llvm.ptr
      %401 = arith.constant 1 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_intern(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_nil_value() : () -> i64
      %406 = func.call @cc_cons(%404, %405) : (i64, i64) -> i64
      %407 = func.call @cc_values_pack(%406) : (i64) -> i64
      func.call @stack_push_pointer(%404) : (i64) -> ()
      %408 = llvm.mlir.addressof @str44 : !llvm.ptr
      %409 = arith.constant 4 : i64
      %410 = func.call @cc_make_string(%408, %409) : (!llvm.ptr, i64) -> i64
      %411 = func.call @cc_nil_value() : () -> i64
      %412 = func.call @cc_intern(%410, %411) : (i64, i64) -> i64
      %413 = func.call @cc_nil_value() : () -> i64
      %414 = func.call @cc_cons(%412, %413) : (i64, i64) -> i64
      %415 = func.call @cc_values_pack(%414) : (i64) -> i64
      func.call @stack_push_pointer(%412) : (i64) -> ()
      %416 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%416) : (i64) -> ()
      %417 = llvm.mlir.addressof @str45 : !llvm.ptr
      %418 = arith.constant 3 : i64
      %419 = func.call @cc_make_string(%417, %418) : (!llvm.ptr, i64) -> i64
      %420 = llvm.mlir.addressof @str46 : !llvm.ptr
      %421 = arith.constant 11 : i64
      %422 = func.call @cc_make_string(%420, %421) : (!llvm.ptr, i64) -> i64
      %423 = func.call @cc_intern(%419, %422) : (i64, i64) -> i64
      %424 = func.call @cc_nil_value() : () -> i64
      %425 = func.call @cc_cons(%423, %424) : (i64, i64) -> i64
      %426 = func.call @cc_values_pack(%425) : (i64) -> i64
      func.call @stack_push_pointer(%423) : (i64) -> ()
      %427 = llvm.mlir.addressof @str47 : !llvm.ptr
      %428 = arith.constant 1 : i64
      %429 = func.call @cc_make_string(%427, %428) : (!llvm.ptr, i64) -> i64
      %430 = func.call @cc_nil_value() : () -> i64
      %431 = func.call @cc_intern(%429, %430) : (i64, i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = func.call @cc_cons(%431, %432) : (i64, i64) -> i64
      %434 = func.call @cc_values_pack(%433) : (i64) -> i64
      func.call @stack_push_pointer(%431) : (i64) -> ()
      %435 = llvm.mlir.addressof @str48 : !llvm.ptr
      %436 = arith.constant 2 : i64
      %437 = func.call @cc_make_string(%435, %436) : (!llvm.ptr, i64) -> i64
      %438 = func.call @cc_nil_value() : () -> i64
      %439 = func.call @cc_intern(%437, %438) : (i64, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_values_pack(%441) : (i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %443 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      %444 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%444) : (i64) -> ()
      %445 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%445) : (i64) -> ()
      %446 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%446) : (i64) -> ()
      %447 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%447) : (i64) -> ()
      %448 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%448) : (i64) -> ()
      %449 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%449) : (i64) -> ()
      %450 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%450) : (i64) -> ()
      %451 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%451) : (i64) -> ()
      %452 = arith.constant 9 : i64
      func.call @stack_push_fixnum(%452) : (i64) -> ()
      %453 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%453) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %454 = func.call @stack_pop_pointer() : () -> i64
      %455 = func.call @stack_pop_pointer() : () -> i64
      %456 = func.call @cc_cons(%455, %454) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %457 = arith.addi %456, %__rlasp_stack_elide_zero_11 : i64
      %458 = func.call @stack_pop_pointer() : () -> i64
      %459 = func.call @cc_cons(%458, %457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %460 = arith.addi %459, %__rlasp_stack_elide_zero_12 : i64
      %461 = func.call @stack_pop_pointer() : () -> i64
      %462 = func.call @cc_cons(%461, %460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %463 = arith.addi %462, %__rlasp_stack_elide_zero_13 : i64
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%464, %463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %466 = arith.addi %465, %__rlasp_stack_elide_zero_14 : i64
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @cc_cons(%467, %466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %469 = arith.addi %468, %__rlasp_stack_elide_zero_15 : i64
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @cc_cons(%470, %469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %472 = arith.addi %471, %__rlasp_stack_elide_zero_16 : i64
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @cc_cons(%473, %472) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %475 = arith.addi %474, %__rlasp_stack_elide_zero_17 : i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %478 = arith.addi %477, %__rlasp_stack_elide_zero_18 : i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %481 = arith.addi %480, %__rlasp_stack_elide_zero_19 : i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %484 = arith.addi %483, %__rlasp_stack_elide_zero_20 : i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%484, %485) : (i64, i64) -> i64
      %487 = llvm.mlir.addressof @str49 : !llvm.ptr
      %488 = arith.constant 5 : i64
      %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
      %490 = func.call @cc_nil_value() : () -> i64
      %491 = func.call @cc_intern(%489, %490) : (i64, i64) -> i64
      %492 = func.call @cc_nil_value() : () -> i64
      %493 = func.call @cc_cons(%491, %492) : (i64, i64) -> i64
      %494 = func.call @cc_values_pack(%493) : (i64) -> i64
      %495 = func.call @cc_cons(%491, %486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      %496 = llvm.mlir.addressof @str50 : !llvm.ptr
      %497 = arith.constant 2 : i64
      %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
      %499 = llvm.mlir.addressof @str51 : !llvm.ptr
      %500 = arith.constant 11 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = func.call @cc_intern(%498, %501) : (i64, i64) -> i64
      %503 = func.call @cc_nil_value() : () -> i64
      %504 = func.call @cc_cons(%502, %503) : (i64, i64) -> i64
      %505 = func.call @cc_values_pack(%504) : (i64) -> i64
      func.call @stack_push_pointer(%502) : (i64) -> ()
      %506 = llvm.mlir.addressof @str52 : !llvm.ptr
      %507 = arith.constant 8 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = llvm.mlir.addressof @str53 : !llvm.ptr
      %510 = arith.constant 9 : i64
      %511 = func.call @cc_make_string(%509, %510) : (!llvm.ptr, i64) -> i64
      %512 = func.call @cc_intern(%508, %511) : (i64, i64) -> i64
      %513 = func.call @cc_nil_value() : () -> i64
      %514 = func.call @cc_cons(%512, %513) : (i64, i64) -> i64
      %515 = func.call @cc_values_pack(%514) : (i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
      %516 = llvm.mlir.addressof @str54 : !llvm.ptr
      %517 = arith.constant 5 : i64
      %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
      %519 = llvm.mlir.addressof @str55 : !llvm.ptr
      %520 = arith.constant 11 : i64
      %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
      %522 = func.call @cc_intern(%518, %521) : (i64, i64) -> i64
      %523 = func.call @cc_nil_value() : () -> i64
      %524 = func.call @cc_cons(%522, %523) : (i64, i64) -> i64
      %525 = func.call @cc_values_pack(%524) : (i64) -> i64
      func.call @stack_push_pointer(%522) : (i64) -> ()
      %526 = llvm.mlir.addressof @str56 : !llvm.ptr
      %527 = arith.constant 3 : i64
      %528 = func.call @cc_make_string(%526, %527) : (!llvm.ptr, i64) -> i64
      %529 = llvm.mlir.addressof @str57 : !llvm.ptr
      %530 = arith.constant 7 : i64
      %531 = func.call @cc_make_string(%529, %530) : (!llvm.ptr, i64) -> i64
      %532 = func.call @cc_intern(%528, %531) : (i64, i64) -> i64
      %533 = func.call @cc_nil_value() : () -> i64
      %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
      %535 = func.call @cc_values_pack(%534) : (i64) -> i64
      func.call @stack_push_pointer(%532) : (i64) -> ()
      %536 = llvm.mlir.addressof @str58 : !llvm.ptr
      %537 = arith.constant 1 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = func.call @cc_nil_value() : () -> i64
      %540 = func.call @cc_intern(%538, %539) : (i64, i64) -> i64
      %541 = func.call @cc_nil_value() : () -> i64
      %542 = func.call @cc_cons(%540, %541) : (i64, i64) -> i64
      %543 = func.call @cc_values_pack(%542) : (i64) -> i64
      func.call @stack_push_pointer(%540) : (i64) -> ()
      %544 = llvm.mlir.addressof @str59 : !llvm.ptr
      %545 = arith.constant 1 : i64
      %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
      %547 = llvm.mlir.addressof @str60 : !llvm.ptr
      %548 = arith.constant 11 : i64
      %549 = func.call @cc_make_string(%547, %548) : (!llvm.ptr, i64) -> i64
      %550 = func.call @cc_intern(%546, %549) : (i64, i64) -> i64
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_cons(%550, %551) : (i64, i64) -> i64
      %553 = func.call @cc_values_pack(%552) : (i64) -> i64
      func.call @stack_push_pointer(%550) : (i64) -> ()
      %554 = llvm.mlir.addressof @str61 : !llvm.ptr
      %555 = arith.constant 1 : i64
      %556 = func.call @cc_make_string(%554, %555) : (!llvm.ptr, i64) -> i64
      %557 = func.call @cc_nil_value() : () -> i64
      %558 = func.call @cc_intern(%556, %557) : (i64, i64) -> i64
      %559 = func.call @cc_nil_value() : () -> i64
      %560 = func.call @cc_cons(%558, %559) : (i64, i64) -> i64
      %561 = func.call @cc_values_pack(%560) : (i64) -> i64
      func.call @stack_push_pointer(%558) : (i64) -> ()
      %562 = llvm.mlir.addressof @str62 : !llvm.ptr
      %563 = arith.constant 7 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      %565 = func.call @cc_nil_value() : () -> i64
      %566 = func.call @cc_intern(%564, %565) : (i64, i64) -> i64
      %567 = func.call @cc_nil_value() : () -> i64
      %568 = func.call @cc_cons(%566, %567) : (i64, i64) -> i64
      %569 = func.call @cc_values_pack(%568) : (i64) -> i64
      func.call @stack_push_pointer(%566) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @cc_cons(%571, %570) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %573 = arith.addi %572, %__rlasp_stack_elide_zero_21 : i64
      %574 = func.call @stack_pop_pointer() : () -> i64
      %575 = func.call @cc_cons(%574, %573) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %576 = arith.addi %575, %__rlasp_stack_elide_zero_22 : i64
      %577 = func.call @stack_pop_pointer() : () -> i64
      %578 = func.call @cc_cons(%577, %576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = func.call @stack_pop_pointer() : () -> i64
      %581 = func.call @cc_cons(%580, %579) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %582 = arith.addi %581, %__rlasp_stack_elide_zero_23 : i64
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = func.call @cc_cons(%583, %582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %585 = arith.addi %584, %__rlasp_stack_elide_zero_24 : i64
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = func.call @cc_cons(%586, %585) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %588 = arith.addi %587, %__rlasp_stack_elide_zero_25 : i64
      %589 = func.call @stack_pop_pointer() : () -> i64
      %590 = func.call @cc_cons(%589, %588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %591 = arith.addi %590, %__rlasp_stack_elide_zero_26 : i64
      %592 = func.call @stack_pop_pointer() : () -> i64
      %593 = func.call @cc_cons(%592, %591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%593) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %594 = func.call @stack_pop_pointer() : () -> i64
      %595 = func.call @stack_pop_pointer() : () -> i64
      %596 = func.call @cc_cons(%595, %594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %597 = arith.addi %596, %__rlasp_stack_elide_zero_27 : i64
      %598 = func.call @stack_pop_pointer() : () -> i64
      %599 = func.call @cc_cons(%598, %597) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %600 = arith.addi %599, %__rlasp_stack_elide_zero_28 : i64
      %601 = func.call @stack_pop_pointer() : () -> i64
      %602 = func.call @cc_cons(%601, %600) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %603 = arith.addi %602, %__rlasp_stack_elide_zero_29 : i64
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @cc_cons(%604, %603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %606 = arith.addi %605, %__rlasp_stack_elide_zero_30 : i64
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @cc_cons(%607, %606) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %609 = arith.addi %608, %__rlasp_stack_elide_zero_31 : i64
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @cc_cons(%610, %609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %612 = arith.addi %611, %__rlasp_stack_elide_zero_32 : i64
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @cc_cons(%613, %612) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %615 = arith.addi %614, %__rlasp_stack_elide_zero_33 : i64
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = func.call @cc_cons(%616, %615) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %618 = arith.addi %617, %__rlasp_stack_elide_zero_34 : i64
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = func.call @cc_cons(%619, %618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %621 = arith.addi %620, %__rlasp_stack_elide_zero_35 : i64
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @cc_cons(%622, %621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %624 = arith.addi %623, %__rlasp_stack_elide_zero_36 : i64
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @cc_cons(%625, %624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%626) : (i64) -> ()
      %627 = llvm.mlir.addressof @str63 : !llvm.ptr
      %628 = arith.constant 5 : i64
      %629 = func.call @cc_make_string(%627, %628) : (!llvm.ptr, i64) -> i64
      %630 = func.call @cc_nil_value() : () -> i64
      %631 = func.call @cc_intern(%629, %630) : (i64, i64) -> i64
      %632 = func.call @cc_nil_value() : () -> i64
      %633 = func.call @cc_cons(%631, %632) : (i64, i64) -> i64
      %634 = func.call @cc_values_pack(%633) : (i64) -> i64
      func.call @stack_push_pointer(%631) : (i64) -> ()
      %635 = llvm.mlir.addressof @str64 : !llvm.ptr
      %636 = arith.constant 5 : i64
      %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
      %638 = llvm.mlir.addressof @str65 : !llvm.ptr
      %639 = arith.constant 11 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = func.call @cc_intern(%637, %640) : (i64, i64) -> i64
      %642 = func.call @cc_nil_value() : () -> i64
      %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
      %644 = func.call @cc_values_pack(%643) : (i64) -> i64
      func.call @stack_push_pointer(%641) : (i64) -> ()
      %645 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%645) : (i64) -> ()
      %646 = llvm.mlir.addressof @str66 : !llvm.ptr
      %647 = arith.constant 7 : i64
      %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
      %649 = func.call @cc_nil_value() : () -> i64
      %650 = func.call @cc_intern(%648, %649) : (i64, i64) -> i64
      %651 = func.call @cc_nil_value() : () -> i64
      %652 = func.call @cc_cons(%650, %651) : (i64, i64) -> i64
      %653 = func.call @cc_values_pack(%652) : (i64) -> i64
      func.call @stack_push_pointer(%650) : (i64) -> ()
      %654 = llvm.mlir.addressof @str67 : !llvm.ptr
      %655 = arith.constant 13 : i64
      %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
      %657 = llvm.mlir.addressof @str68 : !llvm.ptr
      %658 = arith.constant 9 : i64
      %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
      %660 = func.call @cc_intern(%656, %659) : (i64, i64) -> i64
      %661 = func.call @cc_nil_value() : () -> i64
      %662 = func.call @cc_cons(%660, %661) : (i64, i64) -> i64
      %663 = func.call @cc_values_pack(%662) : (i64) -> i64
      func.call @stack_push_pointer(%660) : (i64) -> ()
      %664 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%664) : (i64) -> ()
      %665 = llvm.mlir.addressof @str69 : !llvm.ptr
      %666 = arith.constant 1 : i64
      %667 = func.call @cc_make_string(%665, %666) : (!llvm.ptr, i64) -> i64
      %668 = llvm.mlir.addressof @str70 : !llvm.ptr
      %669 = arith.constant 11 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = func.call @cc_intern(%667, %670) : (i64, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_values_pack(%673) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %675 = arith.addi %671, %__rlasp_stack_elide_zero_37 : i64
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @cc_cons(%675, %676) : (i64, i64) -> i64
      %678 = llvm.mlir.addressof @str71 : !llvm.ptr
      %679 = arith.constant 5 : i64
      %680 = func.call @cc_make_string(%678, %679) : (!llvm.ptr, i64) -> i64
      %681 = func.call @cc_nil_value() : () -> i64
      %682 = func.call @cc_intern(%680, %681) : (i64, i64) -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_cons(%682, %683) : (i64, i64) -> i64
      %685 = func.call @cc_values_pack(%684) : (i64) -> i64
      %686 = func.call @cc_cons(%682, %677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%686) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %687 = func.call @stack_pop_pointer() : () -> i64
      %688 = func.call @stack_pop_pointer() : () -> i64
      %689 = func.call @cc_cons(%688, %687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %690 = arith.addi %689, %__rlasp_stack_elide_zero_38 : i64
      %691 = func.call @stack_pop_pointer() : () -> i64
      %692 = func.call @cc_cons(%691, %690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%692) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @stack_pop_pointer() : () -> i64
      %695 = func.call @cc_cons(%694, %693) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %696 = arith.addi %695, %__rlasp_stack_elide_zero_39 : i64
      %697 = func.call @stack_pop_pointer() : () -> i64
      %698 = func.call @cc_cons(%697, %696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %699 = arith.addi %698, %__rlasp_stack_elide_zero_40 : i64
      %700 = func.call @stack_pop_pointer() : () -> i64
      %701 = func.call @cc_cons(%700, %699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %702 = arith.addi %701, %__rlasp_stack_elide_zero_41 : i64
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = func.call @cc_cons(%703, %702) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %705 = arith.addi %704, %__rlasp_stack_elide_zero_42 : i64
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @cc_cons(%706, %705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %708 = llvm.mlir.addressof @str72 : !llvm.ptr
      %709 = arith.constant 4 : i64
      %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
      %711 = func.call @cc_nil_value() : () -> i64
      %712 = func.call @cc_intern(%710, %711) : (i64, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_values_pack(%714) : (i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %716 = llvm.mlir.addressof @str73 : !llvm.ptr
      %717 = arith.constant 3 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = func.call @cc_nil_value() : () -> i64
      %720 = func.call @cc_intern(%718, %719) : (i64, i64) -> i64
      %721 = func.call @cc_nil_value() : () -> i64
      %722 = func.call @cc_cons(%720, %721) : (i64, i64) -> i64
      %723 = func.call @cc_values_pack(%722) : (i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      %724 = llvm.mlir.addressof @str74 : !llvm.ptr
      %725 = arith.constant 1 : i64
      %726 = func.call @cc_make_string(%724, %725) : (!llvm.ptr, i64) -> i64
      %727 = func.call @cc_nil_value() : () -> i64
      %728 = func.call @cc_intern(%726, %727) : (i64, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_cons(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_values_pack(%730) : (i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %732 = llvm.mlir.addressof @str75 : !llvm.ptr
      %733 = arith.constant 4 : i64
      %734 = func.call @cc_make_string(%732, %733) : (!llvm.ptr, i64) -> i64
      %735 = func.call @cc_nil_value() : () -> i64
      %736 = func.call @cc_intern(%734, %735) : (i64, i64) -> i64
      %737 = func.call @cc_nil_value() : () -> i64
      %738 = func.call @cc_cons(%736, %737) : (i64, i64) -> i64
      %739 = func.call @cc_values_pack(%738) : (i64) -> i64
      func.call @stack_push_pointer(%736) : (i64) -> ()
      %740 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%740) : (i64) -> ()
      %741 = llvm.mlir.addressof @str76 : !llvm.ptr
      %742 = arith.constant 5 : i64
      %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
      %744 = func.call @cc_nil_value() : () -> i64
      %745 = func.call @cc_intern(%743, %744) : (i64, i64) -> i64
      %746 = func.call @cc_nil_value() : () -> i64
      %747 = func.call @cc_cons(%745, %746) : (i64, i64) -> i64
      %748 = func.call @cc_values_pack(%747) : (i64) -> i64
      func.call @stack_push_pointer(%745) : (i64) -> ()
      %749 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%749) : (i64) -> ()
      %750 = llvm.mlir.addressof @str77 : !llvm.ptr
      %751 = arith.constant 7 : i64
      %752 = func.call @cc_make_string(%750, %751) : (!llvm.ptr, i64) -> i64
      %753 = func.call @cc_nil_value() : () -> i64
      %754 = func.call @cc_intern(%752, %753) : (i64, i64) -> i64
      %755 = func.call @cc_nil_value() : () -> i64
      %756 = func.call @cc_cons(%754, %755) : (i64, i64) -> i64
      %757 = func.call @cc_values_pack(%756) : (i64) -> i64
      func.call @stack_push_pointer(%754) : (i64) -> ()
      %758 = llvm.mlir.addressof @str78 : !llvm.ptr
      %759 = arith.constant 8 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      %761 = llvm.mlir.addressof @str79 : !llvm.ptr
      %762 = arith.constant 9 : i64
      %763 = func.call @cc_make_string(%761, %762) : (!llvm.ptr, i64) -> i64
      %764 = func.call @cc_intern(%760, %763) : (i64, i64) -> i64
      %765 = func.call @cc_nil_value() : () -> i64
      %766 = func.call @cc_cons(%764, %765) : (i64, i64) -> i64
      %767 = func.call @cc_values_pack(%766) : (i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      %768 = llvm.mlir.addressof @str80 : !llvm.ptr
      %769 = arith.constant 5 : i64
      %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
      %771 = llvm.mlir.addressof @str81 : !llvm.ptr
      %772 = arith.constant 11 : i64
      %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
      %774 = func.call @cc_intern(%770, %773) : (i64, i64) -> i64
      %775 = func.call @cc_nil_value() : () -> i64
      %776 = func.call @cc_cons(%774, %775) : (i64, i64) -> i64
      %777 = func.call @cc_values_pack(%776) : (i64) -> i64
      func.call @stack_push_pointer(%774) : (i64) -> ()
      %778 = llvm.mlir.addressof @str82 : !llvm.ptr
      %779 = arith.constant 3 : i64
      %780 = func.call @cc_make_string(%778, %779) : (!llvm.ptr, i64) -> i64
      %781 = llvm.mlir.addressof @str83 : !llvm.ptr
      %782 = arith.constant 7 : i64
      %783 = func.call @cc_make_string(%781, %782) : (!llvm.ptr, i64) -> i64
      %784 = func.call @cc_intern(%780, %783) : (i64, i64) -> i64
      %785 = func.call @cc_nil_value() : () -> i64
      %786 = func.call @cc_cons(%784, %785) : (i64, i64) -> i64
      %787 = func.call @cc_values_pack(%786) : (i64) -> i64
      func.call @stack_push_pointer(%784) : (i64) -> ()
      %788 = llvm.mlir.addressof @str84 : !llvm.ptr
      %789 = arith.constant 1 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = llvm.mlir.addressof @str85 : !llvm.ptr
      %792 = arith.constant 11 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = func.call @cc_intern(%790, %793) : (i64, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_values_pack(%796) : (i64) -> i64
      func.call @stack_push_pointer(%794) : (i64) -> ()
      %798 = llvm.mlir.addressof @str86 : !llvm.ptr
      %799 = arith.constant 1 : i64
      %800 = func.call @cc_make_string(%798, %799) : (!llvm.ptr, i64) -> i64
      %801 = func.call @cc_nil_value() : () -> i64
      %802 = func.call @cc_intern(%800, %801) : (i64, i64) -> i64
      %803 = func.call @cc_nil_value() : () -> i64
      %804 = func.call @cc_cons(%802, %803) : (i64, i64) -> i64
      %805 = func.call @cc_values_pack(%804) : (i64) -> i64
      func.call @stack_push_pointer(%802) : (i64) -> ()
      %806 = llvm.mlir.addressof @str87 : !llvm.ptr
      %807 = arith.constant 7 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = func.call @cc_nil_value() : () -> i64
      %810 = func.call @cc_intern(%808, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      func.call @stack_push_pointer(%810) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = func.call @cc_cons(%815, %814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %817 = arith.addi %816, %__rlasp_stack_elide_zero_43 : i64
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @cc_cons(%818, %817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %820 = arith.addi %819, %__rlasp_stack_elide_zero_44 : i64
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_cons(%821, %820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%822) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @cc_cons(%824, %823) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %826 = arith.addi %825, %__rlasp_stack_elide_zero_45 : i64
      %827 = func.call @stack_pop_pointer() : () -> i64
      %828 = func.call @cc_cons(%827, %826) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %829 = arith.addi %828, %__rlasp_stack_elide_zero_46 : i64
      %830 = func.call @stack_pop_pointer() : () -> i64
      %831 = func.call @cc_cons(%830, %829) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %832 = arith.addi %831, %__rlasp_stack_elide_zero_47 : i64
      %833 = func.call @stack_pop_pointer() : () -> i64
      %834 = func.call @cc_cons(%833, %832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%834) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %835 = func.call @stack_pop_pointer() : () -> i64
      %836 = func.call @stack_pop_pointer() : () -> i64
      %837 = func.call @cc_cons(%836, %835) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %838 = arith.addi %837, %__rlasp_stack_elide_zero_48 : i64
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @cc_cons(%839, %838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %841 = arith.addi %840, %__rlasp_stack_elide_zero_49 : i64
      %842 = func.call @stack_pop_pointer() : () -> i64
      %843 = func.call @cc_cons(%842, %841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %844 = arith.addi %843, %__rlasp_stack_elide_zero_50 : i64
      %845 = func.call @stack_pop_pointer() : () -> i64
      %846 = func.call @cc_cons(%845, %844) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %847 = arith.addi %846, %__rlasp_stack_elide_zero_51 : i64
      %848 = func.call @stack_pop_pointer() : () -> i64
      %849 = func.call @cc_cons(%848, %847) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %850 = arith.addi %849, %__rlasp_stack_elide_zero_52 : i64
      %851 = func.call @stack_pop_pointer() : () -> i64
      %852 = func.call @cc_cons(%851, %850) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %853 = arith.addi %852, %__rlasp_stack_elide_zero_53 : i64
      %854 = func.call @stack_pop_pointer() : () -> i64
      %855 = func.call @cc_cons(%854, %853) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %856 = arith.addi %855, %__rlasp_stack_elide_zero_54 : i64
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @cc_cons(%857, %856) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %859 = arith.addi %858, %__rlasp_stack_elide_zero_55 : i64
      %860 = func.call @stack_pop_pointer() : () -> i64
      %861 = func.call @cc_cons(%860, %859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%861) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @cc_cons(%863, %862) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %865 = arith.addi %864, %__rlasp_stack_elide_zero_56 : i64
      %866 = func.call @stack_pop_pointer() : () -> i64
      %867 = func.call @cc_cons(%866, %865) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %868 = arith.addi %867, %__rlasp_stack_elide_zero_57 : i64
      %869 = func.call @stack_pop_pointer() : () -> i64
      %870 = func.call @cc_cons(%869, %868) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %871 = arith.addi %870, %__rlasp_stack_elide_zero_58 : i64
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = func.call @cc_cons(%872, %871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      %874 = llvm.mlir.addressof @str88 : !llvm.ptr
      %875 = arith.constant 13 : i64
      %876 = func.call @cc_make_string(%874, %875) : (!llvm.ptr, i64) -> i64
      %877 = llvm.mlir.addressof @str89 : !llvm.ptr
      %878 = arith.constant 9 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      %880 = func.call @cc_intern(%876, %879) : (i64, i64) -> i64
      %881 = func.call @cc_nil_value() : () -> i64
      %882 = func.call @cc_cons(%880, %881) : (i64, i64) -> i64
      %883 = func.call @cc_values_pack(%882) : (i64) -> i64
      func.call @stack_push_pointer(%880) : (i64) -> ()
      %884 = llvm.mlir.addressof @str90 : !llvm.ptr
      %885 = arith.constant 5 : i64
      %886 = func.call @cc_make_string(%884, %885) : (!llvm.ptr, i64) -> i64
      %887 = llvm.mlir.addressof @str91 : !llvm.ptr
      %888 = arith.constant 11 : i64
      %889 = func.call @cc_make_string(%887, %888) : (!llvm.ptr, i64) -> i64
      %890 = func.call @cc_intern(%886, %889) : (i64, i64) -> i64
      %891 = func.call @cc_nil_value() : () -> i64
      %892 = func.call @cc_cons(%890, %891) : (i64, i64) -> i64
      %893 = func.call @cc_values_pack(%892) : (i64) -> i64
      func.call @stack_push_pointer(%890) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %894 = func.call @stack_pop_pointer() : () -> i64
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @cc_cons(%895, %894) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %897 = arith.addi %896, %__rlasp_stack_elide_zero_59 : i64
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @cc_cons(%898, %897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%899) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %900 = func.call @stack_pop_pointer() : () -> i64
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = func.call @cc_cons(%901, %900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %903 = arith.addi %902, %__rlasp_stack_elide_zero_60 : i64
      %904 = func.call @stack_pop_pointer() : () -> i64
      %905 = func.call @cc_cons(%904, %903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %906 = arith.addi %905, %__rlasp_stack_elide_zero_61 : i64
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @cc_cons(%907, %906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%908) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %909 = func.call @stack_pop_pointer() : () -> i64
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = func.call @cc_cons(%910, %909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %912 = arith.addi %911, %__rlasp_stack_elide_zero_62 : i64
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @cc_cons(%913, %912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %915 = arith.addi %914, %__rlasp_stack_elide_zero_63 : i64
      %916 = func.call @stack_pop_pointer() : () -> i64
      %917 = func.call @cc_cons(%916, %915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %918 = arith.addi %917, %__rlasp_stack_elide_zero_64 : i64
      %1719 = arith.constant 201747314245634 : i64
      %1720 = arith.constant 0 : i64
      %1721 = func.call @cc_make_closure(%1719, %1720) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1722 = arith.addi %1721, %__rlasp_stack_elide_zero_65 : i64
      %1723 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1723) : (i64) -> ()
      %1724 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1724) : (i64) -> ()
      %1725 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1725) : (i64) -> ()
      %1726 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%1726) : (i64) -> ()
      %1727 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1727) : (i64) -> ()
      %1728 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%1728) : (i64) -> ()
      %1729 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%1729) : (i64) -> ()
      %1730 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%1730) : (i64) -> ()
      %1731 = arith.constant 9 : i64
      func.call @stack_push_fixnum(%1731) : (i64) -> ()
      %1732 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1732) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1733 = func.call @stack_pop_pointer() : () -> i64
      %1734 = func.call @stack_pop_pointer() : () -> i64
      %1735 = func.call @cc_cons(%1734, %1733) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1736 = arith.addi %1735, %__rlasp_stack_elide_zero_66 : i64
      %1737 = func.call @stack_pop_pointer() : () -> i64
      %1738 = func.call @cc_cons(%1737, %1736) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1739 = arith.addi %1738, %__rlasp_stack_elide_zero_67 : i64
      %1740 = func.call @stack_pop_pointer() : () -> i64
      %1741 = func.call @cc_cons(%1740, %1739) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1742 = arith.addi %1741, %__rlasp_stack_elide_zero_68 : i64
      %1743 = func.call @stack_pop_pointer() : () -> i64
      %1744 = func.call @cc_cons(%1743, %1742) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1745 = arith.addi %1744, %__rlasp_stack_elide_zero_69 : i64
      %1746 = func.call @stack_pop_pointer() : () -> i64
      %1747 = func.call @cc_cons(%1746, %1745) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1748 = arith.addi %1747, %__rlasp_stack_elide_zero_70 : i64
      %1749 = func.call @stack_pop_pointer() : () -> i64
      %1750 = func.call @cc_cons(%1749, %1748) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1751 = arith.addi %1750, %__rlasp_stack_elide_zero_71 : i64
      %1752 = func.call @stack_pop_pointer() : () -> i64
      %1753 = func.call @cc_cons(%1752, %1751) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1754 = arith.addi %1753, %__rlasp_stack_elide_zero_72 : i64
      %1755 = func.call @stack_pop_pointer() : () -> i64
      %1756 = func.call @cc_cons(%1755, %1754) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1757 = arith.addi %1756, %__rlasp_stack_elide_zero_73 : i64
      %1758 = func.call @stack_pop_pointer() : () -> i64
      %1759 = func.call @cc_cons(%1758, %1757) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1760 = arith.addi %1759, %__rlasp_stack_elide_zero_74 : i64
      %1761 = func.call @stack_pop_pointer() : () -> i64
      %1762 = func.call @cc_cons(%1761, %1760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1763 = func.call @stack_pop_pointer() : () -> i64
      %1764 = func.call @stack_pop_pointer() : () -> i64
      %1765 = func.call @cc_cons(%1764, %1763) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1766 = arith.addi %1765, %__rlasp_stack_elide_zero_75 : i64
      %1767 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1768 = arith.constant 11 : i64
      %1769 = func.call @cc_make_string(%1767, %1768) : (!llvm.ptr, i64) -> i64
      %1770 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1771 = arith.constant 7 : i64
      %1772 = func.call @cc_make_string(%1770, %1771) : (!llvm.ptr, i64) -> i64
      %1773 = func.call @cc_intern(%1769, %1772) : (i64, i64) -> i64
      %1774 = func.call @cc_nil_value() : () -> i64
      %1775 = func.call @cc_cons(%1773, %1774) : (i64, i64) -> i64
      %1776 = func.call @cc_values_pack(%1775) : (i64) -> i64
      %1777 = func.call @cc_nil_value() : () -> i64
      %1778 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1779 = arith.constant 4 : i64
      %1780 = func.call @cc_make_string(%1778, %1779) : (!llvm.ptr, i64) -> i64
      %1781 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1782 = arith.constant 7 : i64
      %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
      %1784 = func.call @cc_intern(%1780, %1783) : (i64, i64) -> i64
      %1785 = func.call @cc_nil_value() : () -> i64
      %1786 = func.call @cc_cons(%1784, %1785) : (i64, i64) -> i64
      %1787 = func.call @cc_values_pack(%1786) : (i64) -> i64
      %1788 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1789 = arith.constant 6 : i64
      %1790 = func.call @cc_make_string(%1788, %1789) : (!llvm.ptr, i64) -> i64
      %1791 = func.call @cc_nil_value() : () -> i64
      %1792 = func.call @cc_intern(%1790, %1791) : (i64, i64) -> i64
      %1793 = func.call @cc_nil_value() : () -> i64
      %1794 = func.call @cc_cons(%1792, %1793) : (i64, i64) -> i64
      %1795 = func.call @cc_values_pack(%1794) : (i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1796 = arith.addi %1792, %__rlasp_stack_elide_zero_76 : i64
      %1797 = func.call @cc_nil_value() : () -> i64
      %1798 = func.call @cc_errorp(%251) : (i64) -> i64
      %1799 = arith.cmpi ne, %1798, %1797 : i64
      %1800 = arith.cmpi eq, %1797, %1797 : i64
      %1801 = arith.andi %1799, %1800 : i1
      %1802 = scf.if %1801 -> (i64) {
        scf.yield %251 : i64
      } else {
        scf.yield %1797 : i64
      }
      %1803 = func.call @cc_errorp(%918) : (i64) -> i64
      %1804 = arith.cmpi ne, %1803, %1797 : i64
      %1805 = arith.cmpi eq, %1802, %1797 : i64
      %1806 = arith.andi %1804, %1805 : i1
      %1807 = scf.if %1806 -> (i64) {
        scf.yield %918 : i64
      } else {
        scf.yield %1802 : i64
      }
      %1808 = func.call @cc_errorp(%1722) : (i64) -> i64
      %1809 = arith.cmpi ne, %1808, %1797 : i64
      %1810 = arith.cmpi eq, %1807, %1797 : i64
      %1811 = arith.andi %1809, %1810 : i1
      %1812 = scf.if %1811 -> (i64) {
        scf.yield %1722 : i64
      } else {
        scf.yield %1807 : i64
      }
      %1813 = func.call @cc_errorp(%1766) : (i64) -> i64
      %1814 = arith.cmpi ne, %1813, %1797 : i64
      %1815 = arith.cmpi eq, %1812, %1797 : i64
      %1816 = arith.andi %1814, %1815 : i1
      %1817 = scf.if %1816 -> (i64) {
        scf.yield %1766 : i64
      } else {
        scf.yield %1812 : i64
      }
      %1818 = func.call @cc_errorp(%1773) : (i64) -> i64
      %1819 = arith.cmpi ne, %1818, %1797 : i64
      %1820 = arith.cmpi eq, %1817, %1797 : i64
      %1821 = arith.andi %1819, %1820 : i1
      %1822 = scf.if %1821 -> (i64) {
        scf.yield %1773 : i64
      } else {
        scf.yield %1817 : i64
      }
      %1823 = func.call @cc_errorp(%1777) : (i64) -> i64
      %1824 = arith.cmpi ne, %1823, %1797 : i64
      %1825 = arith.cmpi eq, %1822, %1797 : i64
      %1826 = arith.andi %1824, %1825 : i1
      %1827 = scf.if %1826 -> (i64) {
        scf.yield %1777 : i64
      } else {
        scf.yield %1822 : i64
      }
      %1828 = func.call @cc_errorp(%1784) : (i64) -> i64
      %1829 = arith.cmpi ne, %1828, %1797 : i64
      %1830 = arith.cmpi eq, %1827, %1797 : i64
      %1831 = arith.andi %1829, %1830 : i1
      %1832 = scf.if %1831 -> (i64) {
        scf.yield %1784 : i64
      } else {
        scf.yield %1827 : i64
      }
      %1833 = func.call @cc_errorp(%1796) : (i64) -> i64
      %1834 = arith.cmpi ne, %1833, %1797 : i64
      %1835 = arith.cmpi eq, %1832, %1797 : i64
      %1836 = arith.andi %1834, %1835 : i1
      %1837 = scf.if %1836 -> (i64) {
        scf.yield %1796 : i64
      } else {
        scf.yield %1832 : i64
      }
      %1838 = arith.cmpi ne, %1837, %1797 : i64
      scf.if %1838 {
        func.call @stack_push_pointer(%1837) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%251) : (i64) -> ()
        func.call @stack_push_pointer(%918) : (i64) -> ()
        func.call @stack_push_pointer(%1722) : (i64) -> ()
        func.call @stack_push_pointer(%1766) : (i64) -> ()
        func.call @stack_push_pointer(%1773) : (i64) -> ()
        func.call @stack_push_pointer(%1777) : (i64) -> ()
        func.call @stack_push_pointer(%1784) : (i64) -> ()
        func.call @stack_push_pointer(%1796) : (i64) -> ()
        %1839 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1840 = func.call @cc_make_function_ref_const(%1839) : (!llvm.ptr) -> i64
        %1841 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1840, %1841) : (i64, i64) -> ()
      }
      %1842 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1842 : i64
    }
    %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
    %1843 = arith.addi %242, %__rlasp_stack_elide_zero_77 : i64
    %1844 = func.call @cc_multiple_value_list(%1843) : (i64) -> i64
    %1845 = llvm.mlir.addressof @str134 : !llvm.ptr
    %1846 = arith.constant 38 : i64
    %1847 = func.call @cc_make_string(%1845, %1846) : (!llvm.ptr, i64) -> i64
    %1848 = func.call @cc_nil_value() : () -> i64
    %1849 = func.call @cc_intern(%1847, %1848) : (i64, i64) -> i64
    %1850 = func.call @cc_nil_value() : () -> i64
    %1851 = func.call @cc_cons(%1849, %1850) : (i64, i64) -> i64
    %1852 = func.call @cc_values_pack(%1851) : (i64) -> i64
    %1853 = func.call @cc_symbol_value(%1849) : (i64) -> i64
    %1854 = llvm.mlir.addressof @str135 : !llvm.ptr
    %1855 = arith.constant 40 : i64
    %1856 = func.call @cc_make_string(%1854, %1855) : (!llvm.ptr, i64) -> i64
    %1857 = func.call @cc_nil_value() : () -> i64
    %1858 = func.call @cc_intern(%1856, %1857) : (i64, i64) -> i64
    %1859 = func.call @cc_nil_value() : () -> i64
    %1860 = func.call @cc_cons(%1858, %1859) : (i64, i64) -> i64
    %1861 = func.call @cc_values_pack(%1860) : (i64) -> i64
    %1862 = func.call @cc_symbol_value(%1858) : (i64) -> i64
    %1863 = func.call @cc_nil_value() : () -> i64
    %1864 = arith.cmpi ne, %1853, %1863 : i64
    %1865 = scf.if %1864 -> (i64) {
      scf.yield %1862 : i64
    } else {
      scf.yield %1844 : i64
    }
    %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
    func.call @stack_push_pointer(%1866) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_201747314245634"() {
    %919 = func.call @cc_nil_value() : () -> i64
    %920 = func.call @cc_nil_value() : () -> i64
    %921 = func.call @cc_errorp(%919) : (i64) -> i64
    %922 = arith.cmpi ne, %921, %920 : i64
    %923 = scf.if %922 -> (i64) {
      scf.yield %919 : i64
    } else {
      %924 = llvm.mlir.addressof @str92 : !llvm.ptr
      %925 = arith.constant 3 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = llvm.mlir.addressof @str93 : !llvm.ptr
      %928 = arith.constant 7 : i64
      %929 = func.call @cc_make_string(%927, %928) : (!llvm.ptr, i64) -> i64
      %930 = func.call @cc_intern(%926, %929) : (i64, i64) -> i64
      %931 = func.call @cc_nil_value() : () -> i64
      %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
      %933 = func.call @cc_values_pack(%932) : (i64) -> i64
      %934 = func.call @cc_nil_value() : () -> i64
      %935 = func.call @cc_errorp(%930) : (i64) -> i64
      %936 = arith.cmpi ne, %935, %934 : i64
      %937 = arith.cmpi eq, %934, %934 : i64
      %938 = arith.andi %936, %937 : i1
      %939 = scf.if %938 -> (i64) {
        scf.yield %930 : i64
      } else {
        scf.yield %934 : i64
      }
      %940 = arith.cmpi ne, %939, %934 : i64
      scf.if %940 {
        func.call @stack_push_pointer(%939) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%930) : (i64) -> ()
        %941 = llvm.mlir.addressof @str94 : !llvm.ptr
        %942 = func.call @cc_make_function_ref_const(%941) : (!llvm.ptr) -> i64
        %943 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%942, %943) : (i64, i64) -> ()
      }
      %944 = func.call @stack_pop_pointer() : () -> i64
      %945 = arith.constant 10 : i64
      %946 = func.call @cc_box_fixnum(%945) : (i64) -> i64
      %948 = arith.constant 3 : i64
      %947 = arith.andi %946, %948 : i64
      %949 = arith.constant 0 : i64
      %950 = arith.cmpi eq, %947, %949 : i64
      %952 = arith.constant 3 : i64
      %951 = arith.andi %944, %952 : i64
      %953 = arith.constant 0 : i64
      %954 = arith.cmpi eq, %951, %953 : i64
      %955 = arith.andi %950, %954 : i1
      %956 = scf.if %955 -> (i64) {
        %957 = arith.constant 2 : i64
        %958 = arith.shrsi %946, %957 : i64
        %959 = arith.constant 2 : i64
        %960 = arith.shrsi %944, %959 : i64
        %961 = arith.constant 0 : i64
        %962 = arith.cmpi slt, %958, %961 : i64
        %963 = scf.if %962 -> (i64) {
          %964 = arith.subi %961, %958 : i64
          scf.yield %964 : i64
        } else {
          scf.yield %958 : i64
        }
        %965 = arith.constant 0 : i64
        %966 = arith.cmpi slt, %960, %965 : i64
        %967 = scf.if %966 -> (i64) {
          %968 = arith.subi %965, %960 : i64
          scf.yield %968 : i64
        } else {
          scf.yield %960 : i64
        }
        %969 = arith.constant 1518500249 : i64
        %970 = arith.cmpi sle, %963, %969 : i64
        %971 = arith.cmpi sle, %967, %969 : i64
        %972 = arith.andi %970, %971 : i1
        %973 = scf.if %972 -> (i64) {
          %974 = arith.muli %958, %960 : i64
          %975 = arith.constant 2 : i64
          %976 = arith.shli %974, %975 : i64
          scf.yield %976 : i64
        } else {
          %977 = func.call @cc_mul(%946, %944) : (i64, i64) -> i64
          scf.yield %977 : i64
        }
        scf.yield %973 : i64
      } else {
        %978 = func.call @cc_mul(%946, %944) : (i64, i64) -> i64
        scf.yield %978 : i64
      }
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %979 = arith.addi %956, %__rlasp_stack_elide_zero_78 : i64
      %980 = func.call @cc_nil_value() : () -> i64
      %981 = func.call @cc_errorp(%979) : (i64) -> i64
      %982 = arith.cmpi ne, %981, %980 : i64
      %983 = arith.cmpi eq, %980, %980 : i64
      %984 = arith.andi %982, %983 : i1
      %985 = scf.if %984 -> (i64) {
        scf.yield %979 : i64
      } else {
        scf.yield %980 : i64
      }
      %986 = arith.cmpi ne, %985, %980 : i64
      scf.if %986 {
        func.call @stack_push_pointer(%985) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%979) : (i64) -> ()
        %987 = llvm.mlir.addressof @str95 : !llvm.ptr
        %988 = func.call @cc_make_function_ref_const(%987) : (!llvm.ptr) -> i64
        %989 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%988, %989) : (i64, i64) -> ()
      }
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @cc_nil_value() : () -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_errorp(%991) : (i64) -> i64
      %994 = arith.cmpi ne, %993, %992 : i64
      %995 = scf.if %994 -> (i64) {
        scf.yield %991 : i64
      } else {
        %996 = func.call @cc_nil_value() : () -> i64
        %997 = func.call @cc_nil_value() : () -> i64
        %998 = func.call @cc_errorp(%996) : (i64) -> i64
        %999 = arith.cmpi ne, %998, %997 : i64
        %1000 = scf.if %999 -> (i64) {
          scf.yield %996 : i64
        } else {
          %1001 = arith.constant 0 : i64
          %1002 = func.call @cc_box_fixnum(%1001) : (i64) -> i64
          %1003 = func.call @cc_nil_value() : () -> i64
          %1004 = func.call @cc_nil_value() : () -> i64
          %1005 = arith.constant 7 : i64
          func.call @stack_push_fixnum(%1005) : (i64) -> ()
          %1006 = arith.constant 2 : i64
          func.call @stack_push_fixnum(%1006) : (i64) -> ()
          %1007 = arith.constant 10 : i64
          func.call @stack_push_fixnum(%1007) : (i64) -> ()
          %1008 = arith.constant 4 : i64
          func.call @stack_push_fixnum(%1008) : (i64) -> ()
          %1009 = arith.constant 3 : i64
          func.call @stack_push_fixnum(%1009) : (i64) -> ()
          %1010 = arith.constant 5 : i64
          func.call @stack_push_fixnum(%1010) : (i64) -> ()
          %1011 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%1011) : (i64) -> ()
          %1012 = arith.constant 6 : i64
          func.call @stack_push_fixnum(%1012) : (i64) -> ()
          %1013 = arith.constant 9 : i64
          func.call @stack_push_fixnum(%1013) : (i64) -> ()
          %1014 = arith.constant 8 : i64
          func.call @stack_push_fixnum(%1014) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %1015 = func.call @stack_pop_pointer() : () -> i64
          %1016 = func.call @stack_pop_pointer() : () -> i64
          %1017 = func.call @cc_cons(%1016, %1015) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
          %1018 = arith.addi %1017, %__rlasp_stack_elide_zero_79 : i64
          %1019 = func.call @stack_pop_pointer() : () -> i64
          %1020 = func.call @cc_cons(%1019, %1018) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
          %1021 = arith.addi %1020, %__rlasp_stack_elide_zero_80 : i64
          %1022 = func.call @stack_pop_pointer() : () -> i64
          %1023 = func.call @cc_cons(%1022, %1021) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
          %1024 = arith.addi %1023, %__rlasp_stack_elide_zero_81 : i64
          %1025 = func.call @stack_pop_pointer() : () -> i64
          %1026 = func.call @cc_cons(%1025, %1024) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
          %1027 = arith.addi %1026, %__rlasp_stack_elide_zero_82 : i64
          %1028 = func.call @stack_pop_pointer() : () -> i64
          %1029 = func.call @cc_cons(%1028, %1027) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
          %1030 = arith.addi %1029, %__rlasp_stack_elide_zero_83 : i64
          %1031 = func.call @stack_pop_pointer() : () -> i64
          %1032 = func.call @cc_cons(%1031, %1030) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
          %1033 = arith.addi %1032, %__rlasp_stack_elide_zero_84 : i64
          %1034 = func.call @stack_pop_pointer() : () -> i64
          %1035 = func.call @cc_cons(%1034, %1033) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
          %1036 = arith.addi %1035, %__rlasp_stack_elide_zero_85 : i64
          %1037 = func.call @stack_pop_pointer() : () -> i64
          %1038 = func.call @cc_cons(%1037, %1036) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
          %1039 = arith.addi %1038, %__rlasp_stack_elide_zero_86 : i64
          %1040 = func.call @stack_pop_pointer() : () -> i64
          %1041 = func.call @cc_cons(%1040, %1039) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
          %1042 = arith.addi %1041, %__rlasp_stack_elide_zero_87 : i64
          %1043 = func.call @stack_pop_pointer() : () -> i64
          %1044 = func.call @cc_cons(%1043, %1042) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
          %1045 = arith.addi %1044, %__rlasp_stack_elide_zero_88 : i64
          %1046 = func.call @cc_nil_value() : () -> i64
          %1047 = func.call @cc_nil_value() : () -> i64
          %1048 = func.call @cc_nil_value() : () -> i64
          %1049 = func.call @cc_errorp(%1047) : (i64) -> i64
          %1050 = arith.cmpi ne, %1049, %1048 : i64
          %1051 = scf.if %1050 -> (i64) {
            scf.yield %1047 : i64
          } else {
            %1052 = func.call @cc_nil_value() : () -> i64
            %1053 = llvm.mlir.addressof @str96 : !llvm.ptr
            %1054 = arith.constant 38 : i64
            %1055 = func.call @cc_make_string(%1053, %1054) : (!llvm.ptr, i64) -> i64
            %1056 = func.call @cc_nil_value() : () -> i64
            %1057 = func.call @cc_intern(%1055, %1056) : (i64, i64) -> i64
            %1058 = func.call @cc_nil_value() : () -> i64
            %1059 = func.call @cc_cons(%1057, %1058) : (i64, i64) -> i64
            %1060 = func.call @cc_values_pack(%1059) : (i64) -> i64
            %1061 = func.call @cc_set_symbol_value(%1057, %1052) : (i64, i64) -> i64
            %1062 = llvm.mlir.addressof @str97 : !llvm.ptr
            %1063 = arith.constant 39 : i64
            %1064 = func.call @cc_make_string(%1062, %1063) : (!llvm.ptr, i64) -> i64
            %1065 = func.call @cc_nil_value() : () -> i64
            %1066 = func.call @cc_intern(%1064, %1065) : (i64, i64) -> i64
            %1067 = func.call @cc_nil_value() : () -> i64
            %1068 = func.call @cc_cons(%1066, %1067) : (i64, i64) -> i64
            %1069 = func.call @cc_values_pack(%1068) : (i64) -> i64
            %1070 = func.call @cc_set_symbol_value(%1066, %1052) : (i64, i64) -> i64
            %1071 = llvm.mlir.addressof @str98 : !llvm.ptr
            %1072 = arith.constant 40 : i64
            %1073 = func.call @cc_make_string(%1071, %1072) : (!llvm.ptr, i64) -> i64
            %1074 = func.call @cc_nil_value() : () -> i64
            %1075 = func.call @cc_intern(%1073, %1074) : (i64, i64) -> i64
            %1076 = func.call @cc_nil_value() : () -> i64
            %1077 = func.call @cc_cons(%1075, %1076) : (i64, i64) -> i64
            %1078 = func.call @cc_values_pack(%1077) : (i64) -> i64
            %1079 = func.call @cc_set_symbol_value(%1075, %1052) : (i64, i64) -> i64
            %1080:5 = scf.while (%arg0 = %1004, %arg1 = %1046, %arg2 = %1003, %arg3 = %1002, %arg4 = %1045) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
              %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
              %1081 = arith.addi %arg4, %__rlasp_stack_elide_zero_89 : i64
              %1082 = func.call @cc_nil_value() : () -> i64
              %1083 = arith.cmpi ne, %1081, %1082 : i64
              %1084 = func.call @cc_nil_value() : () -> i64
              %1085 = llvm.mlir.addressof @str99 : !llvm.ptr
              %1086 = arith.constant 38 : i64
              %1087 = func.call @cc_make_string(%1085, %1086) : (!llvm.ptr, i64) -> i64
              %1088 = func.call @cc_nil_value() : () -> i64
              %1089 = func.call @cc_intern(%1087, %1088) : (i64, i64) -> i64
              %1090 = func.call @cc_nil_value() : () -> i64
              %1091 = func.call @cc_cons(%1089, %1090) : (i64, i64) -> i64
              %1092 = func.call @cc_values_pack(%1091) : (i64) -> i64
              %1093 = func.call @cc_symbol_value(%1089) : (i64) -> i64
              %1094 = arith.cmpi ne, %1093, %1084 : i64
              %1095 = llvm.mlir.addressof @str100 : !llvm.ptr
              %1096 = arith.constant 38 : i64
              %1097 = func.call @cc_make_string(%1095, %1096) : (!llvm.ptr, i64) -> i64
              %1098 = func.call @cc_nil_value() : () -> i64
              %1099 = func.call @cc_intern(%1097, %1098) : (i64, i64) -> i64
              %1100 = func.call @cc_nil_value() : () -> i64
              %1101 = func.call @cc_cons(%1099, %1100) : (i64, i64) -> i64
              %1102 = func.call @cc_values_pack(%1101) : (i64) -> i64
              %1103 = func.call @cc_symbol_value(%1099) : (i64) -> i64
              %1104 = arith.cmpi ne, %1103, %1084 : i64
              %1105 = arith.ori %1094, %1104 : i1
              %1106 = arith.constant 0 : i1
              %1107 = arith.cmpi eq, %1105, %1106 : i1
              %1108 = arith.andi %1083, %1107 : i1
              scf.condition(%1108) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
            } do {
              ^bb0(%1109: i64, %1110: i64, %1111: i64, %1112: i64, %1113: i64):
              %1114 = func.call @cc_nil_value() : () -> i64
              %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
              %1115 = arith.addi %1113, %__rlasp_stack_elide_zero_90 : i64
              %1116 = func.call @cc_nil_value() : () -> i64
              %1117 = arith.cmpi eq, %1115, %1116 : i64
              %1119 = func.call @cc_t_value() : () -> i64
              %1118 = arith.select %1117, %1119, %1116 : i64
              %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
              %1120 = arith.addi %1118, %__rlasp_stack_elide_zero_91 : i64
              %1121 = func.call @cc_nil_value() : () -> i64
              %1122 = func.call @cc_cons(%1120, %1121) : (i64, i64) -> i64
              %1123 = func.call @cc_not(%1122) : (i64) -> i64
              %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
              %1124 = arith.addi %1123, %__rlasp_stack_elide_zero_92 : i64
              %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
              %1125 = arith.addi %1113, %__rlasp_stack_elide_zero_93 : i64
              %1126 = func.call @cc_is_cons(%1125) : (i64) -> i32
              %1127 = arith.constant 0 : i32
              %1128 = arith.cmpi ne, %1126, %1127 : i32
              %1129 = func.call @cc_t_value() : () -> i64
              %1130 = func.call @cc_nil_value() : () -> i64
              %1131 = arith.select %1128, %1129, %1130 : i64
              %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
              %1132 = arith.addi %1131, %__rlasp_stack_elide_zero_94 : i64
              %1133 = func.call @cc_nil_value() : () -> i64
              %1134 = func.call @cc_cons(%1132, %1133) : (i64, i64) -> i64
              %1135 = func.call @cc_not(%1134) : (i64) -> i64
              %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
              %1136 = arith.addi %1135, %__rlasp_stack_elide_zero_95 : i64
              %1137 = func.call @cc_cons(%1136, %1114) : (i64, i64) -> i64
              %1138 = func.call @cc_cons(%1124, %1137) : (i64, i64) -> i64
              %1139 = func.call @cc_and(%1138) : (i64) -> i64
              %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
              %1140 = arith.addi %1139, %__rlasp_stack_elide_zero_96 : i64
              %1141 = func.call @cc_nil_value() : () -> i64
              %1142 = arith.cmpi ne, %1140, %1141 : i64
              scf.if %1142 {
                %1143 = llvm.mlir.addressof @str101 : !llvm.ptr
                %1144 = arith.constant 10 : i64
                %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
                %1146 = func.call @cc_nil_value() : () -> i64
                %1147 = func.call @cc_intern(%1145, %1146) : (i64, i64) -> i64
                %1148 = func.call @cc_nil_value() : () -> i64
                %1149 = func.call @cc_cons(%1147, %1148) : (i64, i64) -> i64
                %1150 = func.call @cc_values_pack(%1149) : (i64) -> i64
                %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
                %1151 = arith.addi %1147, %__rlasp_stack_elide_zero_97 : i64
                %1152 = func.call @cc_nil_value() : () -> i64
                %1153 = func.call @cc_errorp(%1151) : (i64) -> i64
                %1154 = arith.cmpi ne, %1153, %1152 : i64
                %1155 = arith.cmpi eq, %1152, %1152 : i64
                %1156 = arith.andi %1154, %1155 : i1
                %1157 = scf.if %1156 -> (i64) {
                  scf.yield %1151 : i64
                } else {
                  scf.yield %1152 : i64
                }
                %1158 = arith.cmpi ne, %1157, %1152 : i64
                scf.if %1158 {
                  func.call @stack_push_pointer(%1157) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%1151) : (i64) -> ()
                  %1159 = llvm.mlir.addressof @str102 : !llvm.ptr
                  %1160 = func.call @cc_make_function_ref_const(%1159) : (!llvm.ptr) -> i64
                  %1161 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%1160, %1161) : (i64, i64) -> ()
                }
                %1162 = func.call @stack_pop_pointer() : () -> i64
                %1163 = func.call @cc_multiple_value_list(%1162) : (i64) -> i64
                %1164 = func.call @cc_t_value() : () -> i64
                %1165 = llvm.mlir.addressof @str103 : !llvm.ptr
                %1166 = arith.constant 38 : i64
                %1167 = func.call @cc_make_string(%1165, %1166) : (!llvm.ptr, i64) -> i64
                %1168 = func.call @cc_nil_value() : () -> i64
                %1169 = func.call @cc_intern(%1167, %1168) : (i64, i64) -> i64
                %1170 = func.call @cc_nil_value() : () -> i64
                %1171 = func.call @cc_cons(%1169, %1170) : (i64, i64) -> i64
                %1172 = func.call @cc_values_pack(%1171) : (i64) -> i64
                %1173 = func.call @cc_set_symbol_value(%1169, %1164) : (i64, i64) -> i64
                %1174 = llvm.mlir.addressof @str104 : !llvm.ptr
                %1175 = arith.constant 39 : i64
                %1176 = func.call @cc_make_string(%1174, %1175) : (!llvm.ptr, i64) -> i64
                %1177 = func.call @cc_nil_value() : () -> i64
                %1178 = func.call @cc_intern(%1176, %1177) : (i64, i64) -> i64
                %1179 = func.call @cc_nil_value() : () -> i64
                %1180 = func.call @cc_cons(%1178, %1179) : (i64, i64) -> i64
                %1181 = func.call @cc_values_pack(%1180) : (i64) -> i64
                %1182 = func.call @cc_set_symbol_value(%1178, %1162) : (i64, i64) -> i64
                %1183 = llvm.mlir.addressof @str105 : !llvm.ptr
                %1184 = arith.constant 40 : i64
                %1185 = func.call @cc_make_string(%1183, %1184) : (!llvm.ptr, i64) -> i64
                %1186 = func.call @cc_nil_value() : () -> i64
                %1187 = func.call @cc_intern(%1185, %1186) : (i64, i64) -> i64
                %1188 = func.call @cc_nil_value() : () -> i64
                %1189 = func.call @cc_cons(%1187, %1188) : (i64, i64) -> i64
                %1190 = func.call @cc_values_pack(%1189) : (i64) -> i64
                %1191 = func.call @cc_set_symbol_value(%1187, %1163) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1162) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %1192 = func.call @stack_depth() : () -> i64
              %1193 = arith.constant 0 : i64
              %1194 = arith.cmpi sgt, %1192, %1193 : i64
              scf.if %1194 {
                %1195 = func.call @stack_pop_pointer() : () -> i64
              }
              %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
              %1196 = arith.addi %1113, %__rlasp_stack_elide_zero_98 : i64
              %1197 = func.call @cc_car(%1196) : (i64) -> i64
              %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
              %1198 = arith.addi %1197, %__rlasp_stack_elide_zero_99 : i64
              func.call @stack_push_pointer(%1198) : (i64) -> ()
              %1199 = func.call @stack_depth() : () -> i64
              %1200 = arith.constant 0 : i64
              %1201 = arith.cmpi sgt, %1199, %1200 : i64
              scf.if %1201 {
                %1202 = func.call @stack_pop_pointer() : () -> i64
              }
              %1203 = func.call @cc_t_value() : () -> i64
              func.call @stack_push_pointer(%1203) : (i64) -> ()
              %1204 = func.call @stack_depth() : () -> i64
              %1205 = arith.constant 0 : i64
              %1206 = arith.cmpi sgt, %1204, %1205 : i64
              scf.if %1206 {
                %1207 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1112) : (i64) -> ()
              %1208 = func.call @stack_depth() : () -> i64
              %1209 = arith.constant 0 : i64
              %1210 = arith.cmpi sgt, %1208, %1209 : i64
              scf.if %1210 {
                %1211 = func.call @stack_pop_pointer() : () -> i64
              }
              %1212 = llvm.mlir.addressof @str106 : !llvm.ptr
              %1213 = arith.constant 3 : i64
              %1214 = func.call @cc_make_string(%1212, %1213) : (!llvm.ptr, i64) -> i64
              %1215 = llvm.mlir.addressof @str107 : !llvm.ptr
              %1216 = arith.constant 7 : i64
              %1217 = func.call @cc_make_string(%1215, %1216) : (!llvm.ptr, i64) -> i64
              %1218 = func.call @cc_intern(%1214, %1217) : (i64, i64) -> i64
              %1219 = func.call @cc_nil_value() : () -> i64
              %1220 = func.call @cc_cons(%1218, %1219) : (i64, i64) -> i64
              %1221 = func.call @cc_values_pack(%1220) : (i64) -> i64
              %1223 = arith.constant 3 : i64
              %1222 = arith.andi %1112, %1223 : i64
              %1224 = arith.constant 0 : i64
              %1225 = arith.cmpi eq, %1222, %1224 : i64
              %1227 = arith.constant 3 : i64
              %1226 = arith.andi %944, %1227 : i64
              %1228 = arith.constant 0 : i64
              %1229 = arith.cmpi eq, %1226, %1228 : i64
              %1230 = arith.andi %1225, %1229 : i1
              %1231 = scf.if %1230 -> (i64) {
                %1232 = arith.constant 2 : i64
                %1233 = arith.shrsi %1112, %1232 : i64
                %1234 = arith.constant 2 : i64
                %1235 = arith.shrsi %944, %1234 : i64
                %1236 = arith.constant 0 : i64
                %1237 = arith.cmpi slt, %1233, %1236 : i64
                %1238 = scf.if %1237 -> (i64) {
                  %1239 = arith.subi %1236, %1233 : i64
                  scf.yield %1239 : i64
                } else {
                  scf.yield %1233 : i64
                }
                %1240 = arith.constant 0 : i64
                %1241 = arith.cmpi slt, %1235, %1240 : i64
                %1242 = scf.if %1241 -> (i64) {
                  %1243 = arith.subi %1240, %1235 : i64
                  scf.yield %1243 : i64
                } else {
                  scf.yield %1235 : i64
                }
                %1244 = arith.constant 1518500249 : i64
                %1245 = arith.cmpi sle, %1238, %1244 : i64
                %1246 = arith.cmpi sle, %1242, %1244 : i64
                %1247 = arith.andi %1245, %1246 : i1
                %1248 = scf.if %1247 -> (i64) {
                  %1249 = arith.muli %1233, %1235 : i64
                  %1250 = arith.constant 2 : i64
                  %1251 = arith.shli %1249, %1250 : i64
                  scf.yield %1251 : i64
                } else {
                  %1252 = func.call @cc_mul(%1112, %944) : (i64, i64) -> i64
                  scf.yield %1252 : i64
                }
                scf.yield %1248 : i64
              } else {
                %1253 = func.call @cc_mul(%1112, %944) : (i64, i64) -> i64
                scf.yield %1253 : i64
              }
              %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
              %1254 = arith.addi %1231, %__rlasp_stack_elide_zero_100 : i64
              %1255 = func.call @cc_nil_value() : () -> i64
              %1256 = func.call @cc_errorp(%990) : (i64) -> i64
              %1257 = arith.cmpi ne, %1256, %1255 : i64
              %1258 = arith.cmpi eq, %1255, %1255 : i64
              %1259 = arith.andi %1257, %1258 : i1
              %1260 = scf.if %1259 -> (i64) {
                scf.yield %990 : i64
              } else {
                scf.yield %1255 : i64
              }
              %1261 = func.call @cc_errorp(%1218) : (i64) -> i64
              %1262 = arith.cmpi ne, %1261, %1255 : i64
              %1263 = arith.cmpi eq, %1260, %1255 : i64
              %1264 = arith.andi %1262, %1263 : i1
              %1265 = scf.if %1264 -> (i64) {
                scf.yield %1218 : i64
              } else {
                scf.yield %1260 : i64
              }
              %1266 = func.call @cc_errorp(%1198) : (i64) -> i64
              %1267 = arith.cmpi ne, %1266, %1255 : i64
              %1268 = arith.cmpi eq, %1265, %1255 : i64
              %1269 = arith.andi %1267, %1268 : i1
              %1270 = scf.if %1269 -> (i64) {
                scf.yield %1198 : i64
              } else {
                scf.yield %1265 : i64
              }
              %1271 = func.call @cc_errorp(%1254) : (i64) -> i64
              %1272 = arith.cmpi ne, %1271, %1255 : i64
              %1273 = arith.cmpi eq, %1270, %1255 : i64
              %1274 = arith.andi %1272, %1273 : i1
              %1275 = scf.if %1274 -> (i64) {
                scf.yield %1254 : i64
              } else {
                scf.yield %1270 : i64
              }
              %1276 = arith.cmpi ne, %1275, %1255 : i64
              scf.if %1276 {
                func.call @stack_push_pointer(%1275) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%990) : (i64) -> ()
                func.call @stack_push_pointer(%1218) : (i64) -> ()
                func.call @stack_push_pointer(%1198) : (i64) -> ()
                func.call @stack_push_pointer(%1254) : (i64) -> ()
                %1277 = llvm.mlir.addressof @str108 : !llvm.ptr
                %1278 = func.call @cc_make_function_ref_const(%1277) : (!llvm.ptr) -> i64
                %1279 = arith.constant 4 : i64
                func.call @cc_funcall_stack(%1278, %1279) : (i64, i64) -> ()
              }
              %1280 = func.call @stack_depth() : () -> i64
              %1281 = arith.constant 0 : i64
              %1282 = arith.cmpi sgt, %1280, %1281 : i64
              scf.if %1282 {
                %1283 = func.call @stack_pop_pointer() : () -> i64
              }
              %1284 = arith.constant 1 : i64
              %1285 = func.call @cc_box_fixnum(%1284) : (i64) -> i64
              %1287 = arith.constant 3 : i64
              %1286 = arith.andi %1112, %1287 : i64
              %1288 = arith.constant 0 : i64
              %1289 = arith.cmpi eq, %1286, %1288 : i64
              %1291 = arith.constant 3 : i64
              %1290 = arith.andi %1285, %1291 : i64
              %1292 = arith.constant 0 : i64
              %1293 = arith.cmpi eq, %1290, %1292 : i64
              %1294 = arith.andi %1289, %1293 : i1
              %1295 = scf.if %1294 -> (i64) {
                %1296 = arith.constant 2 : i64
                %1297 = arith.shrsi %1112, %1296 : i64
                %1298 = arith.constant 2 : i64
                %1299 = arith.shrsi %1285, %1298 : i64
                %1300 = arith.addi %1297, %1299 : i64
                %1301 = arith.constant -2305843009213693952 : i64
                %1302 = arith.constant 2305843009213693951 : i64
                %1303 = arith.cmpi sge, %1300, %1301 : i64
                %1304 = arith.cmpi sle, %1300, %1302 : i64
                %1305 = arith.andi %1303, %1304 : i1
                %1306 = scf.if %1305 -> (i64) {
                  %1307 = arith.constant 2 : i64
                  %1308 = arith.shli %1300, %1307 : i64
                  scf.yield %1308 : i64
                } else {
                  %1309 = func.call @cc_add(%1112, %1285) : (i64, i64) -> i64
                  scf.yield %1309 : i64
                }
                scf.yield %1306 : i64
              } else {
                %1310 = func.call @cc_add(%1112, %1285) : (i64, i64) -> i64
                scf.yield %1310 : i64
              }
              %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
              %1311 = arith.addi %1295, %__rlasp_stack_elide_zero_101 : i64
              func.call @stack_push_pointer(%1311) : (i64) -> ()
              %1312 = func.call @stack_depth() : () -> i64
              %1313 = arith.constant 0 : i64
              %1314 = arith.cmpi sgt, %1312, %1313 : i64
              scf.if %1314 {
                %1315 = func.call @stack_pop_pointer() : () -> i64
              }
              %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
              %1316 = arith.addi %1113, %__rlasp_stack_elide_zero_102 : i64
              %1317 = func.call @cc_cdr(%1316) : (i64) -> i64
              %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
              %1318 = arith.addi %1317, %__rlasp_stack_elide_zero_103 : i64
              func.call @stack_push_pointer(%1318) : (i64) -> ()
              %1319 = func.call @stack_depth() : () -> i64
              %1320 = arith.constant 0 : i64
              %1321 = arith.cmpi sgt, %1319, %1320 : i64
              scf.if %1321 {
                %1322 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %1198, %1203, %1112, %1311, %1318 : i64, i64, i64, i64, i64
            }
            func.call @stack_push_nil() : () -> ()
            %1323 = func.call @stack_pop_pointer() : () -> i64
            %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
            %1324 = arith.addi %1080#1, %__rlasp_stack_elide_zero_104 : i64
            %1325 = func.call @cc_nil_value() : () -> i64
            %1326 = arith.cmpi ne, %1324, %1325 : i64
            %1327:2 = scf.if %1326 -> (i64, i64) {
              %1328 = func.call @cc_nil_value() : () -> i64
              %1329 = func.call @cc_nil_value() : () -> i64
              %1330 = func.call @cc_errorp(%1328) : (i64) -> i64
              %1331 = arith.cmpi ne, %1330, %1329 : i64
              %1332:2 = scf.if %1331 -> (i64, i64) {
                scf.yield %1328, %1080#3 : i64, i64
              } else {
                %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
                %1333 = arith.addi %1080#2, %__rlasp_stack_elide_zero_105 : i64
                scf.yield %1333, %1080#2 : i64, i64
              }
              %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
              %1334 = arith.addi %1332#0, %__rlasp_stack_elide_zero_106 : i64
              scf.yield %1334, %1332#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %1335 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1335, %1080#3 : i64, i64
            }
            %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
            %1336 = arith.addi %1327#0, %__rlasp_stack_elide_zero_107 : i64
            func.call @stack_push_nil() : () -> ()
            %1337 = func.call @stack_pop_pointer() : () -> i64
            %1338 = func.call @cc_multiple_value_list(%1337) : (i64) -> i64
            %1339 = llvm.mlir.addressof @str109 : !llvm.ptr
            %1340 = arith.constant 38 : i64
            %1341 = func.call @cc_make_string(%1339, %1340) : (!llvm.ptr, i64) -> i64
            %1342 = func.call @cc_nil_value() : () -> i64
            %1343 = func.call @cc_intern(%1341, %1342) : (i64, i64) -> i64
            %1344 = func.call @cc_nil_value() : () -> i64
            %1345 = func.call @cc_cons(%1343, %1344) : (i64, i64) -> i64
            %1346 = func.call @cc_values_pack(%1345) : (i64) -> i64
            %1347 = func.call @cc_symbol_value(%1343) : (i64) -> i64
            %1348 = llvm.mlir.addressof @str110 : !llvm.ptr
            %1349 = arith.constant 39 : i64
            %1350 = func.call @cc_make_string(%1348, %1349) : (!llvm.ptr, i64) -> i64
            %1351 = func.call @cc_nil_value() : () -> i64
            %1352 = func.call @cc_intern(%1350, %1351) : (i64, i64) -> i64
            %1353 = func.call @cc_nil_value() : () -> i64
            %1354 = func.call @cc_cons(%1352, %1353) : (i64, i64) -> i64
            %1355 = func.call @cc_values_pack(%1354) : (i64) -> i64
            %1356 = func.call @cc_symbol_value(%1352) : (i64) -> i64
            %1357 = llvm.mlir.addressof @str111 : !llvm.ptr
            %1358 = arith.constant 40 : i64
            %1359 = func.call @cc_make_string(%1357, %1358) : (!llvm.ptr, i64) -> i64
            %1360 = func.call @cc_nil_value() : () -> i64
            %1361 = func.call @cc_intern(%1359, %1360) : (i64, i64) -> i64
            %1362 = func.call @cc_nil_value() : () -> i64
            %1363 = func.call @cc_cons(%1361, %1362) : (i64, i64) -> i64
            %1364 = func.call @cc_values_pack(%1363) : (i64) -> i64
            %1365 = func.call @cc_symbol_value(%1361) : (i64) -> i64
            %1366 = func.call @cc_nil_value() : () -> i64
            %1367 = arith.cmpi ne, %1347, %1366 : i64
            %1368 = scf.if %1367 -> (i64) {
              scf.yield %1365 : i64
            } else {
              scf.yield %1338 : i64
            }
            %1369 = func.call @cc_values_pack(%1368) : (i64) -> i64
            %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
            %1370 = arith.addi %1369, %__rlasp_stack_elide_zero_108 : i64
            scf.yield %1370 : i64
          }
          %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
          %1371 = arith.addi %1051, %__rlasp_stack_elide_zero_109 : i64
          scf.yield %1371 : i64
        }
        %1372 = func.call @cc_nil_value() : () -> i64
        %1373 = func.call @cc_errorp(%1000) : (i64) -> i64
        %1374 = arith.cmpi ne, %1373, %1372 : i64
        %1375 = scf.if %1374 -> (i64) {
          scf.yield %1000 : i64
        } else {
          %1376 = arith.constant 10 : i64
          %1377 = func.call @cc_box_fixnum(%1376) : (i64) -> i64
          %1378 = llvm.mlir.addressof @str112 : !llvm.ptr
          %1379 = arith.constant 1 : i64
          %1380 = func.call @cc_make_string(%1378, %1379) : (!llvm.ptr, i64) -> i64
          %1381 = llvm.mlir.addressof @str113 : !llvm.ptr
          %1382 = arith.constant 11 : i64
          %1383 = func.call @cc_make_string(%1381, %1382) : (!llvm.ptr, i64) -> i64
          %1384 = func.call @cc_intern(%1380, %1383) : (i64, i64) -> i64
          %1385 = func.call @cc_nil_value() : () -> i64
          %1386 = func.call @cc_cons(%1384, %1385) : (i64, i64) -> i64
          %1387 = func.call @cc_values_pack(%1386) : (i64) -> i64
          %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
          %1388 = arith.addi %1384, %__rlasp_stack_elide_zero_110 : i64
          %1389 = func.call @cc_nil_value() : () -> i64
          %1390 = func.call @cc_errorp(%1388) : (i64) -> i64
          %1391 = arith.cmpi ne, %1390, %1389 : i64
          %1392 = arith.cmpi eq, %1389, %1389 : i64
          %1393 = arith.andi %1391, %1392 : i1
          %1394 = scf.if %1393 -> (i64) {
            scf.yield %1388 : i64
          } else {
            scf.yield %1389 : i64
          }
          %1395 = arith.cmpi ne, %1394, %1389 : i64
          scf.if %1395 {
            func.call @stack_push_pointer(%1394) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1388) : (i64) -> ()
            %1396 = llvm.mlir.addressof @str114 : !llvm.ptr
            %1397 = func.call @cc_make_function_ref_const(%1396) : (!llvm.ptr) -> i64
            %1398 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1397, %1398) : (i64, i64) -> ()
          }
          %1399 = func.call @stack_pop_pointer() : () -> i64
          %1400 = func.call @cc_nil_value() : () -> i64
          %1401 = func.call @cc_errorp(%990) : (i64) -> i64
          %1402 = arith.cmpi ne, %1401, %1400 : i64
          %1403 = arith.cmpi eq, %1400, %1400 : i64
          %1404 = arith.andi %1402, %1403 : i1
          %1405 = scf.if %1404 -> (i64) {
            scf.yield %990 : i64
          } else {
            scf.yield %1400 : i64
          }
          %1406 = func.call @cc_errorp(%1377) : (i64) -> i64
          %1407 = arith.cmpi ne, %1406, %1400 : i64
          %1408 = arith.cmpi eq, %1405, %1400 : i64
          %1409 = arith.andi %1407, %1408 : i1
          %1410 = scf.if %1409 -> (i64) {
            scf.yield %1377 : i64
          } else {
            scf.yield %1405 : i64
          }
          %1411 = func.call @cc_errorp(%944) : (i64) -> i64
          %1412 = arith.cmpi ne, %1411, %1400 : i64
          %1413 = arith.cmpi eq, %1410, %1400 : i64
          %1414 = arith.andi %1412, %1413 : i1
          %1415 = scf.if %1414 -> (i64) {
            scf.yield %944 : i64
          } else {
            scf.yield %1410 : i64
          }
          %1416 = func.call @cc_errorp(%1399) : (i64) -> i64
          %1417 = arith.cmpi ne, %1416, %1400 : i64
          %1418 = arith.cmpi eq, %1415, %1400 : i64
          %1419 = arith.andi %1417, %1418 : i1
          %1420 = scf.if %1419 -> (i64) {
            scf.yield %1399 : i64
          } else {
            scf.yield %1415 : i64
          }
          %1421 = arith.cmpi ne, %1420, %1400 : i64
          scf.if %1421 {
            func.call @stack_push_pointer(%1420) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%990) : (i64) -> ()
            func.call @stack_push_pointer(%1377) : (i64) -> ()
            func.call @stack_push_pointer(%944) : (i64) -> ()
            func.call @stack_push_pointer(%1399) : (i64) -> ()
            %1422 = llvm.mlir.addressof @str115 : !llvm.ptr
            %1423 = func.call @cc_make_function_ref_const(%1422) : (!llvm.ptr) -> i64
            %1424 = arith.constant 4 : i64
            func.call @cc_funcall_stack(%1423, %1424) : (i64, i64) -> ()
          }
          %1425 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1425 : i64
        }
        %1426 = func.call @cc_nil_value() : () -> i64
        %1427 = func.call @cc_errorp(%1375) : (i64) -> i64
        %1428 = arith.cmpi ne, %1427, %1426 : i64
        %1429 = scf.if %1428 -> (i64) {
          scf.yield %1375 : i64
        } else {
          %1430 = arith.constant 0 : i64
          %1431 = func.call @cc_box_fixnum(%1430) : (i64) -> i64
          %1432 = func.call @cc_nil_value() : () -> i64
          %1433 = func.call @cc_nil_value() : () -> i64
          %1434 = func.call @cc_nil_value() : () -> i64
          %1435 = func.call @cc_nil_value() : () -> i64
          %1436 = func.call @cc_nil_value() : () -> i64
          %1437 = func.call @cc_errorp(%1435) : (i64) -> i64
          %1438 = arith.cmpi ne, %1437, %1436 : i64
          %1439 = scf.if %1438 -> (i64) {
            scf.yield %1435 : i64
          } else {
            %1440 = func.call @cc_nil_value() : () -> i64
            %1441 = llvm.mlir.addressof @str116 : !llvm.ptr
            %1442 = arith.constant 38 : i64
            %1443 = func.call @cc_make_string(%1441, %1442) : (!llvm.ptr, i64) -> i64
            %1444 = func.call @cc_nil_value() : () -> i64
            %1445 = func.call @cc_intern(%1443, %1444) : (i64, i64) -> i64
            %1446 = func.call @cc_nil_value() : () -> i64
            %1447 = func.call @cc_cons(%1445, %1446) : (i64, i64) -> i64
            %1448 = func.call @cc_values_pack(%1447) : (i64) -> i64
            %1449 = func.call @cc_set_symbol_value(%1445, %1440) : (i64, i64) -> i64
            %1450 = llvm.mlir.addressof @str117 : !llvm.ptr
            %1451 = arith.constant 39 : i64
            %1452 = func.call @cc_make_string(%1450, %1451) : (!llvm.ptr, i64) -> i64
            %1453 = func.call @cc_nil_value() : () -> i64
            %1454 = func.call @cc_intern(%1452, %1453) : (i64, i64) -> i64
            %1455 = func.call @cc_nil_value() : () -> i64
            %1456 = func.call @cc_cons(%1454, %1455) : (i64, i64) -> i64
            %1457 = func.call @cc_values_pack(%1456) : (i64) -> i64
            %1458 = func.call @cc_set_symbol_value(%1454, %1440) : (i64, i64) -> i64
            %1459 = llvm.mlir.addressof @str118 : !llvm.ptr
            %1460 = arith.constant 40 : i64
            %1461 = func.call @cc_make_string(%1459, %1460) : (!llvm.ptr, i64) -> i64
            %1462 = func.call @cc_nil_value() : () -> i64
            %1463 = func.call @cc_intern(%1461, %1462) : (i64, i64) -> i64
            %1464 = func.call @cc_nil_value() : () -> i64
            %1465 = func.call @cc_cons(%1463, %1464) : (i64, i64) -> i64
            %1466 = func.call @cc_values_pack(%1465) : (i64) -> i64
            %1467 = func.call @cc_set_symbol_value(%1463, %1440) : (i64, i64) -> i64
            %1468:4 = scf.while (%arg0 = %1434, %arg1 = %1432, %arg2 = %1433, %arg3 = %1431) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
              %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
              %1469 = arith.addi %arg3, %__rlasp_stack_elide_zero_111 : i64
              %1470 = arith.constant 10 : i64
              func.call @stack_push_fixnum(%1470) : (i64) -> ()
              %1471 = func.call @stack_pop_pointer() : () -> i64
              %1472 = arith.constant 1 : i1
              %1474 = arith.constant 3 : i64
              %1473 = arith.andi %1469, %1474 : i64
              %1475 = arith.constant 0 : i64
              %1476 = arith.cmpi eq, %1473, %1475 : i64
              %1478 = arith.constant 3 : i64
              %1477 = arith.andi %1471, %1478 : i64
              %1479 = arith.constant 0 : i64
              %1480 = arith.cmpi eq, %1477, %1479 : i64
              %1481 = arith.andi %1476, %1480 : i1
              %1482 = scf.if %1481 -> (i1) {
                %1483 = arith.constant 2 : i64
                %1484 = arith.shrsi %1469, %1483 : i64
                %1485 = arith.constant 2 : i64
                %1486 = arith.shrsi %1471, %1485 : i64
                %1487 = arith.cmpi slt, %1484, %1486 : i64
                scf.yield %1487 : i1
              } else {
                %1488 = func.call @cc_lt(%1469, %1471) : (i64, i64) -> i64
                %1489 = func.call @cc_nil_value() : () -> i64
                %1490 = arith.cmpi ne, %1488, %1489 : i64
                scf.yield %1490 : i1
              }
              %1491 = arith.andi %1472, %1482 : i1
              %1492 = func.call @cc_nil_value() : () -> i64
              %1493 = func.call @cc_t_value() : () -> i64
              %1494 = scf.if %1491 -> (i64) {
                scf.yield %1493 : i64
              } else {
                scf.yield %1492 : i64
              }
              %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
              %1495 = arith.addi %1494, %__rlasp_stack_elide_zero_112 : i64
              %1496 = func.call @cc_nil_value() : () -> i64
              %1497 = arith.cmpi ne, %1495, %1496 : i64
              %1498 = func.call @cc_nil_value() : () -> i64
              %1499 = llvm.mlir.addressof @str119 : !llvm.ptr
              %1500 = arith.constant 38 : i64
              %1501 = func.call @cc_make_string(%1499, %1500) : (!llvm.ptr, i64) -> i64
              %1502 = func.call @cc_nil_value() : () -> i64
              %1503 = func.call @cc_intern(%1501, %1502) : (i64, i64) -> i64
              %1504 = func.call @cc_nil_value() : () -> i64
              %1505 = func.call @cc_cons(%1503, %1504) : (i64, i64) -> i64
              %1506 = func.call @cc_values_pack(%1505) : (i64) -> i64
              %1507 = func.call @cc_symbol_value(%1503) : (i64) -> i64
              %1508 = arith.cmpi ne, %1507, %1498 : i64
              %1509 = llvm.mlir.addressof @str120 : !llvm.ptr
              %1510 = arith.constant 38 : i64
              %1511 = func.call @cc_make_string(%1509, %1510) : (!llvm.ptr, i64) -> i64
              %1512 = func.call @cc_nil_value() : () -> i64
              %1513 = func.call @cc_intern(%1511, %1512) : (i64, i64) -> i64
              %1514 = func.call @cc_nil_value() : () -> i64
              %1515 = func.call @cc_cons(%1513, %1514) : (i64, i64) -> i64
              %1516 = func.call @cc_values_pack(%1515) : (i64) -> i64
              %1517 = func.call @cc_symbol_value(%1513) : (i64) -> i64
              %1518 = arith.cmpi ne, %1517, %1498 : i64
              %1519 = arith.ori %1508, %1518 : i1
              %1520 = arith.constant 0 : i1
              %1521 = arith.cmpi eq, %1519, %1520 : i1
              %1522 = arith.andi %1497, %1521 : i1
              scf.condition(%1522) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
            } do {
              ^bb0(%1523: i64, %1524: i64, %1525: i64, %1526: i64):
              %1527 = func.call @cc_t_value() : () -> i64
              func.call @stack_push_pointer(%1527) : (i64) -> ()
              %1528 = func.call @stack_depth() : () -> i64
              %1529 = arith.constant 0 : i64
              %1530 = arith.cmpi sgt, %1528, %1529 : i64
              scf.if %1530 {
                %1531 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1526) : (i64) -> ()
              %1532 = func.call @stack_depth() : () -> i64
              %1533 = arith.constant 0 : i64
              %1534 = arith.cmpi sgt, %1532, %1533 : i64
              scf.if %1534 {
                %1535 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1525) : (i64) -> ()
              %1536 = llvm.mlir.addressof @str121 : !llvm.ptr
              %1537 = arith.constant 3 : i64
              %1538 = func.call @cc_make_string(%1536, %1537) : (!llvm.ptr, i64) -> i64
              %1539 = llvm.mlir.addressof @str122 : !llvm.ptr
              %1540 = arith.constant 7 : i64
              %1541 = func.call @cc_make_string(%1539, %1540) : (!llvm.ptr, i64) -> i64
              %1542 = func.call @cc_intern(%1538, %1541) : (i64, i64) -> i64
              %1543 = func.call @cc_nil_value() : () -> i64
              %1544 = func.call @cc_cons(%1542, %1543) : (i64, i64) -> i64
              %1545 = func.call @cc_values_pack(%1544) : (i64) -> i64
              %1547 = arith.constant 3 : i64
              %1546 = arith.andi %1526, %1547 : i64
              %1548 = arith.constant 0 : i64
              %1549 = arith.cmpi eq, %1546, %1548 : i64
              %1551 = arith.constant 3 : i64
              %1550 = arith.andi %944, %1551 : i64
              %1552 = arith.constant 0 : i64
              %1553 = arith.cmpi eq, %1550, %1552 : i64
              %1554 = arith.andi %1549, %1553 : i1
              %1555 = scf.if %1554 -> (i64) {
                %1556 = arith.constant 2 : i64
                %1557 = arith.shrsi %1526, %1556 : i64
                %1558 = arith.constant 2 : i64
                %1559 = arith.shrsi %944, %1558 : i64
                %1560 = arith.constant 0 : i64
                %1561 = arith.cmpi slt, %1557, %1560 : i64
                %1562 = scf.if %1561 -> (i64) {
                  %1563 = arith.subi %1560, %1557 : i64
                  scf.yield %1563 : i64
                } else {
                  scf.yield %1557 : i64
                }
                %1564 = arith.constant 0 : i64
                %1565 = arith.cmpi slt, %1559, %1564 : i64
                %1566 = scf.if %1565 -> (i64) {
                  %1567 = arith.subi %1564, %1559 : i64
                  scf.yield %1567 : i64
                } else {
                  scf.yield %1559 : i64
                }
                %1568 = arith.constant 1518500249 : i64
                %1569 = arith.cmpi sle, %1562, %1568 : i64
                %1570 = arith.cmpi sle, %1566, %1568 : i64
                %1571 = arith.andi %1569, %1570 : i1
                %1572 = scf.if %1571 -> (i64) {
                  %1573 = arith.muli %1557, %1559 : i64
                  %1574 = arith.constant 2 : i64
                  %1575 = arith.shli %1573, %1574 : i64
                  scf.yield %1575 : i64
                } else {
                  %1576 = func.call @cc_mul(%1526, %944) : (i64, i64) -> i64
                  scf.yield %1576 : i64
                }
                scf.yield %1572 : i64
              } else {
                %1577 = func.call @cc_mul(%1526, %944) : (i64, i64) -> i64
                scf.yield %1577 : i64
              }
              %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
              %1578 = arith.addi %1555, %__rlasp_stack_elide_zero_113 : i64
              %1579 = func.call @cc_nil_value() : () -> i64
              %1580 = func.call @cc_errorp(%990) : (i64) -> i64
              %1581 = arith.cmpi ne, %1580, %1579 : i64
              %1582 = arith.cmpi eq, %1579, %1579 : i64
              %1583 = arith.andi %1581, %1582 : i1
              %1584 = scf.if %1583 -> (i64) {
                scf.yield %990 : i64
              } else {
                scf.yield %1579 : i64
              }
              %1585 = func.call @cc_errorp(%1542) : (i64) -> i64
              %1586 = arith.cmpi ne, %1585, %1579 : i64
              %1587 = arith.cmpi eq, %1584, %1579 : i64
              %1588 = arith.andi %1586, %1587 : i1
              %1589 = scf.if %1588 -> (i64) {
                scf.yield %1542 : i64
              } else {
                scf.yield %1584 : i64
              }
              %1590 = func.call @cc_errorp(%1578) : (i64) -> i64
              %1591 = arith.cmpi ne, %1590, %1579 : i64
              %1592 = arith.cmpi eq, %1589, %1579 : i64
              %1593 = arith.andi %1591, %1592 : i1
              %1594 = scf.if %1593 -> (i64) {
                scf.yield %1578 : i64
              } else {
                scf.yield %1589 : i64
              }
              %1595 = arith.cmpi ne, %1594, %1579 : i64
              scf.if %1595 {
                func.call @stack_push_pointer(%1594) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%990) : (i64) -> ()
                func.call @stack_push_pointer(%1542) : (i64) -> ()
                func.call @stack_push_pointer(%1578) : (i64) -> ()
                %1596 = llvm.mlir.addressof @str123 : !llvm.ptr
                %1597 = func.call @cc_make_function_ref_const(%1596) : (!llvm.ptr) -> i64
                %1598 = arith.constant 3 : i64
                func.call @cc_funcall_stack(%1597, %1598) : (i64, i64) -> ()
              }
              %1599 = func.call @stack_pop_pointer() : () -> i64
              %1600 = func.call @cc_nil_value() : () -> i64
              %1601 = func.call @cc_errorp(%1599) : (i64) -> i64
              %1602 = arith.cmpi ne, %1601, %1600 : i64
              %1603 = arith.cmpi eq, %1600, %1600 : i64
              %1604 = arith.andi %1602, %1603 : i1
              %1605 = scf.if %1604 -> (i64) {
                scf.yield %1599 : i64
              } else {
                scf.yield %1600 : i64
              }
              %1606 = arith.cmpi ne, %1605, %1600 : i64
              scf.if %1606 {
                func.call @stack_push_pointer(%1605) : (i64) -> ()
              } else {
                %1607 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1607) : (i64) -> ()
                %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
                %1608 = arith.addi %1599, %__rlasp_stack_elide_zero_114 : i64
                %1609 = func.call @stack_pop_pointer() : () -> i64
                %1610 = func.call @cc_cons(%1608, %1609) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1610) : (i64) -> ()
              }
              %1611 = func.call @stack_pop_pointer() : () -> i64
              %1612 = func.call @stack_pop_pointer() : () -> i64
              %1613 = func.call @cc_append(%1612, %1611) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
              %1614 = arith.addi %1613, %__rlasp_stack_elide_zero_115 : i64
              func.call @stack_push_pointer(%1614) : (i64) -> ()
              %1615 = func.call @stack_depth() : () -> i64
              %1616 = arith.constant 0 : i64
              %1617 = arith.cmpi sgt, %1615, %1616 : i64
              scf.if %1617 {
                %1618 = func.call @stack_pop_pointer() : () -> i64
              }
              %1619 = arith.constant 1 : i64
              %1620 = func.call @cc_box_fixnum(%1619) : (i64) -> i64
              %1622 = arith.constant 3 : i64
              %1621 = arith.andi %1526, %1622 : i64
              %1623 = arith.constant 0 : i64
              %1624 = arith.cmpi eq, %1621, %1623 : i64
              %1626 = arith.constant 3 : i64
              %1625 = arith.andi %1620, %1626 : i64
              %1627 = arith.constant 0 : i64
              %1628 = arith.cmpi eq, %1625, %1627 : i64
              %1629 = arith.andi %1624, %1628 : i1
              %1630 = scf.if %1629 -> (i64) {
                %1631 = arith.constant 2 : i64
                %1632 = arith.shrsi %1526, %1631 : i64
                %1633 = arith.constant 2 : i64
                %1634 = arith.shrsi %1620, %1633 : i64
                %1635 = arith.addi %1632, %1634 : i64
                %1636 = arith.constant -2305843009213693952 : i64
                %1637 = arith.constant 2305843009213693951 : i64
                %1638 = arith.cmpi sge, %1635, %1636 : i64
                %1639 = arith.cmpi sle, %1635, %1637 : i64
                %1640 = arith.andi %1638, %1639 : i1
                %1641 = scf.if %1640 -> (i64) {
                  %1642 = arith.constant 2 : i64
                  %1643 = arith.shli %1635, %1642 : i64
                  scf.yield %1643 : i64
                } else {
                  %1644 = func.call @cc_add(%1526, %1620) : (i64, i64) -> i64
                  scf.yield %1644 : i64
                }
                scf.yield %1641 : i64
              } else {
                %1645 = func.call @cc_add(%1526, %1620) : (i64, i64) -> i64
                scf.yield %1645 : i64
              }
              %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
              %1646 = arith.addi %1630, %__rlasp_stack_elide_zero_116 : i64
              func.call @stack_push_pointer(%1646) : (i64) -> ()
              %1647 = func.call @stack_depth() : () -> i64
              %1648 = arith.constant 0 : i64
              %1649 = arith.cmpi sgt, %1647, %1648 : i64
              scf.if %1649 {
                %1650 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %1527, %1526, %1614, %1646 : i64, i64, i64, i64
            }
            func.call @stack_push_nil() : () -> ()
            %1651 = func.call @stack_pop_pointer() : () -> i64
            %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
            %1652 = arith.addi %1468#0, %__rlasp_stack_elide_zero_117 : i64
            %1653 = func.call @cc_nil_value() : () -> i64
            %1654 = arith.cmpi ne, %1652, %1653 : i64
            %1655:2 = scf.if %1654 -> (i64, i64) {
              %1656 = func.call @cc_nil_value() : () -> i64
              %1657 = func.call @cc_nil_value() : () -> i64
              %1658 = func.call @cc_errorp(%1656) : (i64) -> i64
              %1659 = arith.cmpi ne, %1658, %1657 : i64
              %1660:2 = scf.if %1659 -> (i64, i64) {
                scf.yield %1656, %1468#3 : i64, i64
              } else {
                %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
                %1661 = arith.addi %1468#1, %__rlasp_stack_elide_zero_118 : i64
                scf.yield %1661, %1468#1 : i64, i64
              }
              %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
              %1662 = arith.addi %1660#0, %__rlasp_stack_elide_zero_119 : i64
              scf.yield %1662, %1660#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %1663 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1663, %1468#3 : i64, i64
            }
            %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
            %1664 = arith.addi %1655#0, %__rlasp_stack_elide_zero_120 : i64
            %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
            %1665 = arith.addi %1468#2, %__rlasp_stack_elide_zero_121 : i64
            %1666 = func.call @cc_multiple_value_list(%1665) : (i64) -> i64
            %1667 = llvm.mlir.addressof @str124 : !llvm.ptr
            %1668 = arith.constant 38 : i64
            %1669 = func.call @cc_make_string(%1667, %1668) : (!llvm.ptr, i64) -> i64
            %1670 = func.call @cc_nil_value() : () -> i64
            %1671 = func.call @cc_intern(%1669, %1670) : (i64, i64) -> i64
            %1672 = func.call @cc_nil_value() : () -> i64
            %1673 = func.call @cc_cons(%1671, %1672) : (i64, i64) -> i64
            %1674 = func.call @cc_values_pack(%1673) : (i64) -> i64
            %1675 = func.call @cc_symbol_value(%1671) : (i64) -> i64
            %1676 = llvm.mlir.addressof @str125 : !llvm.ptr
            %1677 = arith.constant 39 : i64
            %1678 = func.call @cc_make_string(%1676, %1677) : (!llvm.ptr, i64) -> i64
            %1679 = func.call @cc_nil_value() : () -> i64
            %1680 = func.call @cc_intern(%1678, %1679) : (i64, i64) -> i64
            %1681 = func.call @cc_nil_value() : () -> i64
            %1682 = func.call @cc_cons(%1680, %1681) : (i64, i64) -> i64
            %1683 = func.call @cc_values_pack(%1682) : (i64) -> i64
            %1684 = func.call @cc_symbol_value(%1680) : (i64) -> i64
            %1685 = llvm.mlir.addressof @str126 : !llvm.ptr
            %1686 = arith.constant 40 : i64
            %1687 = func.call @cc_make_string(%1685, %1686) : (!llvm.ptr, i64) -> i64
            %1688 = func.call @cc_nil_value() : () -> i64
            %1689 = func.call @cc_intern(%1687, %1688) : (i64, i64) -> i64
            %1690 = func.call @cc_nil_value() : () -> i64
            %1691 = func.call @cc_cons(%1689, %1690) : (i64, i64) -> i64
            %1692 = func.call @cc_values_pack(%1691) : (i64) -> i64
            %1693 = func.call @cc_symbol_value(%1689) : (i64) -> i64
            %1694 = func.call @cc_nil_value() : () -> i64
            %1695 = arith.cmpi ne, %1675, %1694 : i64
            %1696 = scf.if %1695 -> (i64) {
              scf.yield %1693 : i64
            } else {
              scf.yield %1666 : i64
            }
            %1697 = func.call @cc_values_pack(%1696) : (i64) -> i64
            %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
            %1698 = arith.addi %1697, %__rlasp_stack_elide_zero_122 : i64
            scf.yield %1698 : i64
          }
          %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
          %1699 = arith.addi %1439, %__rlasp_stack_elide_zero_123 : i64
          scf.yield %1699 : i64
        }
        %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
        %1700 = arith.addi %1429, %__rlasp_stack_elide_zero_124 : i64
        %1701 = func.call @cc_multiple_value_list(%1700) : (i64) -> i64
        %1702 = func.call @cc_nil_value() : () -> i64
        %1703 = func.call @cc_errorp(%990) : (i64) -> i64
        %1704 = arith.cmpi ne, %1703, %1702 : i64
        %1705 = arith.cmpi eq, %1702, %1702 : i64
        %1706 = arith.andi %1704, %1705 : i1
        %1707 = scf.if %1706 -> (i64) {
          scf.yield %990 : i64
        } else {
          scf.yield %1702 : i64
        }
        %1708 = arith.cmpi ne, %1707, %1702 : i64
        scf.if %1708 {
          func.call @stack_push_pointer(%1707) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%990) : (i64) -> ()
          %1709 = llvm.mlir.addressof @str127 : !llvm.ptr
          %1710 = func.call @cc_make_function_ref_const(%1709) : (!llvm.ptr) -> i64
          %1711 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1710, %1711) : (i64, i64) -> ()
        }
        %1712 = func.call @stack_depth() : () -> i64
        %1713 = arith.constant 0 : i64
        %1714 = arith.cmpi sgt, %1712, %1713 : i64
        scf.if %1714 {
          %1715 = func.call @stack_pop_pointer() : () -> i64
        }
        %1716 = func.call @cc_values_pack(%1701) : (i64) -> i64
        %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
        %1717 = arith.addi %1716, %__rlasp_stack_elide_zero_125 : i64
        scf.yield %1717 : i64
      }
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %1718 = arith.addi %995, %__rlasp_stack_elide_zero_126 : i64
      scf.yield %1718 : i64
    }
    func.call @stack_push_pointer(%923) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1("base\0Anmemb\0Asize\0Afun-compar\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_201747314245632*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_201747314245632*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_201747314245632*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("qsort\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str6("POINTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str7("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str9("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("POINTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str14("VOID\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("clasp-ffi:%foreign-funcall\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETFLAG_201747314245632*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_201747314245632*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str19("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_201747314245633*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETVALUE_201747314245633*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_201747314245633*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str23("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("CFFI-DEFCALLBACK\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str25("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("%FOREIGN-TYPE-SIZE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str28("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str29("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("%FOREIGN-ALLOC\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str34("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str35("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str39("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str40("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str43("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str44("FROM\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str48("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str49("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str50("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("%MEM-SET\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str53("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str54("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str57("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str58("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str59("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str62("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str63("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str64("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str67("%GET-CALLBACK\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str68("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str69("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str73("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str74("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str75("FROM\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("BELOW\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str77("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("%MEM-REF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str79("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str80("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str87("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("%FOREIGN-FREE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str89("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str90("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str94("clasp-ffi:%foreign-type-size\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str95("clasp-ffi:%foreign-alloc\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str96("*__MLIR_BLOCK_RETFLAG_201747314245635*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str97("*__MLIR_BLOCK_RETVALUE_201747314245635*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETMVLIST_201747314245635*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str99("*__MLIR_BLOCK_RETFLAG_201747314245633*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str100("*__MLIR_BLOCK_RETFLAG_201747314245635*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str101("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str102("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str103("*__MLIR_BLOCK_RETFLAG_201747314245635*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str104("*__MLIR_BLOCK_RETVALUE_201747314245635*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str105("*__MLIR_BLOCK_RETMVLIST_201747314245635*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str106("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str107("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str108("clasp-ffi:%mem-set\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str109("*__MLIR_BLOCK_RETFLAG_201747314245635*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str110("*__MLIR_BLOCK_RETVALUE_201747314245635*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str111("*__MLIR_BLOCK_RETMVLIST_201747314245635*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str112("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("clasp-ffi:%get-callback\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str115("%FN%qsort\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str116("*__MLIR_BLOCK_RETFLAG_201747314245636*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str117("*__MLIR_BLOCK_RETVALUE_201747314245636*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str118("*__MLIR_BLOCK_RETMVLIST_201747314245636*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str119("*__MLIR_BLOCK_RETFLAG_201747314245633*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str120("*__MLIR_BLOCK_RETFLAG_201747314245636*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str121("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("clasp-ffi:%mem-ref\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str124("*__MLIR_BLOCK_RETFLAG_201747314245636*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str125("*__MLIR_BLOCK_RETVALUE_201747314245636*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str126("*__MLIR_BLOCK_RETMVLIST_201747314245636*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str127("clasp-ffi:%foreign-free\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str128("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str130("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str131("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str133("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str134("*__MLIR_BLOCK_RETFLAG_201747314245633*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str135("*__MLIR_BLOCK_RETMVLIST_201747314245633*\00") : !llvm.array<41 x i8>
}
