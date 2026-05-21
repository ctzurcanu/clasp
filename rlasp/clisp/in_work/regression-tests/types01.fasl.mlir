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
  func.func @"%FN%semaphore-p"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 11 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 6 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = llvm.mlir.addressof @str2 : !llvm.ptr
    %15 = arith.constant 38 : i64
    %16 = func.call @cc_make_string(%14, %15) : (!llvm.ptr, i64) -> i64
    %17 = func.call @cc_nil_value() : () -> i64
    %18 = func.call @cc_intern(%16, %17) : (i64, i64) -> i64
    %19 = func.call @cc_nil_value() : () -> i64
    %20 = func.call @cc_cons(%18, %19) : (i64, i64) -> i64
    %21 = func.call @cc_values_pack(%20) : (i64) -> i64
    %22 = func.call @cc_set_symbol_value(%18, %13) : (i64, i64) -> i64
    %23 = llvm.mlir.addressof @str3 : !llvm.ptr
    %24 = arith.constant 39 : i64
    %25 = func.call @cc_make_string(%23, %24) : (!llvm.ptr, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_intern(%25, %26) : (i64, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_cons(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_values_pack(%29) : (i64) -> i64
    %31 = func.call @cc_set_symbol_value(%27, %13) : (i64, i64) -> i64
    %32 = llvm.mlir.addressof @str4 : !llvm.ptr
    %33 = arith.constant 40 : i64
    %34 = func.call @cc_make_string(%32, %33) : (!llvm.ptr, i64) -> i64
    %35 = func.call @cc_nil_value() : () -> i64
    %36 = func.call @cc_intern(%34, %35) : (i64, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_cons(%36, %37) : (i64, i64) -> i64
    %39 = func.call @cc_values_pack(%38) : (i64) -> i64
    %40 = func.call @cc_set_symbol_value(%36, %13) : (i64, i64) -> i64
    %41 = func.call @cc_nil_value() : () -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = func.call @cc_errorp(%41) : (i64) -> i64
    %44 = arith.cmpi ne, %43, %42 : i64
    %45 = scf.if %44 -> (i64) {
      scf.yield %41 : i64
    } else {
      %46 = llvm.mlir.addressof @str5 : !llvm.ptr
      %47 = arith.constant 58 : i64
      %48 = func.call @cc_make_string(%46, %47) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %49 = arith.addi %48, %__rlasp_stack_elide_zero_0 : i64
      scf.yield %49 : i64
    }
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_errorp(%45) : (i64) -> i64
    %52 = arith.cmpi ne, %51, %50 : i64
    %53 = scf.if %52 -> (i64) {
      scf.yield %45 : i64
    } else {
      func.call @stack_push_pointer(%12) : (i64) -> ()
      %54 = llvm.mlir.addressof @str6 : !llvm.ptr
      %55 = arith.constant 9 : i64
      %56 = func.call @cc_make_string(%54, %55) : (!llvm.ptr, i64) -> i64
      %57 = func.call @cc_nil_value() : () -> i64
      %58 = func.call @cc_intern(%56, %57) : (i64, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_cons(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_values_pack(%60) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %62 = arith.addi %58, %__rlasp_stack_elide_zero_1 : i64
      %63 = func.call @stack_pop_pointer() : () -> i64
      %64 = func.call @cc_typep(%63, %62) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %65 = arith.addi %64, %__rlasp_stack_elide_zero_2 : i64
      scf.yield %65 : i64
    }
    %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
    %66 = arith.addi %53, %__rlasp_stack_elide_zero_3 : i64
    %67 = func.call @cc_multiple_value_list(%66) : (i64) -> i64
    %68 = llvm.mlir.addressof @str7 : !llvm.ptr
    %69 = arith.constant 38 : i64
    %70 = func.call @cc_make_string(%68, %69) : (!llvm.ptr, i64) -> i64
    %71 = func.call @cc_nil_value() : () -> i64
    %72 = func.call @cc_intern(%70, %71) : (i64, i64) -> i64
    %73 = func.call @cc_nil_value() : () -> i64
    %74 = func.call @cc_cons(%72, %73) : (i64, i64) -> i64
    %75 = func.call @cc_values_pack(%74) : (i64) -> i64
    %76 = func.call @cc_symbol_value(%72) : (i64) -> i64
    %77 = llvm.mlir.addressof @str8 : !llvm.ptr
    %78 = arith.constant 40 : i64
    %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
    %80 = func.call @cc_nil_value() : () -> i64
    %81 = func.call @cc_intern(%79, %80) : (i64, i64) -> i64
    %82 = func.call @cc_nil_value() : () -> i64
    %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
    %84 = func.call @cc_values_pack(%83) : (i64) -> i64
    %85 = func.call @cc_symbol_value(%81) : (i64) -> i64
    %86 = func.call @cc_nil_value() : () -> i64
    %87 = arith.cmpi ne, %76, %86 : i64
    %88 = scf.if %87 -> (i64) {
      scf.yield %85 : i64
    } else {
      scf.yield %67 : i64
    }
    %89 = func.call @cc_values_pack(%88) : (i64) -> i64
    func.call @stack_push_pointer(%89) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %90 = llvm.mlir.addressof @str9 : !llvm.ptr
    %91 = arith.constant 6 : i64
    %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
    %93 = func.call @cc_nil_value() : () -> i64
    %94 = func.call @cc_intern(%92, %93) : (i64, i64) -> i64
    %95 = func.call @cc_nil_value() : () -> i64
    %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
    %97 = func.call @cc_values_pack(%96) : (i64) -> i64
    %98 = func.call @cc_nil_value() : () -> i64
    %99 = llvm.mlir.addressof @str10 : !llvm.ptr
    %100 = arith.constant 38 : i64
    %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
    %102 = func.call @cc_nil_value() : () -> i64
    %103 = func.call @cc_intern(%101, %102) : (i64, i64) -> i64
    %104 = func.call @cc_nil_value() : () -> i64
    %105 = func.call @cc_cons(%103, %104) : (i64, i64) -> i64
    %106 = func.call @cc_values_pack(%105) : (i64) -> i64
    %107 = func.call @cc_set_symbol_value(%103, %98) : (i64, i64) -> i64
    %108 = llvm.mlir.addressof @str11 : !llvm.ptr
    %109 = arith.constant 39 : i64
    %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
    %111 = func.call @cc_nil_value() : () -> i64
    %112 = func.call @cc_intern(%110, %111) : (i64, i64) -> i64
    %113 = func.call @cc_nil_value() : () -> i64
    %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
    %115 = func.call @cc_values_pack(%114) : (i64) -> i64
    %116 = func.call @cc_set_symbol_value(%112, %98) : (i64, i64) -> i64
    %117 = llvm.mlir.addressof @str12 : !llvm.ptr
    %118 = arith.constant 40 : i64
    %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
    %120 = func.call @cc_nil_value() : () -> i64
    %121 = func.call @cc_intern(%119, %120) : (i64, i64) -> i64
    %122 = func.call @cc_nil_value() : () -> i64
    %123 = func.call @cc_cons(%121, %122) : (i64, i64) -> i64
    %124 = func.call @cc_values_pack(%123) : (i64) -> i64
    %125 = func.call @cc_set_symbol_value(%121, %98) : (i64, i64) -> i64
    %126 = func.call @cc_nil_value() : () -> i64
    %127 = func.call @cc_nil_value() : () -> i64
    %128 = func.call @cc_errorp(%126) : (i64) -> i64
    %129 = arith.cmpi ne, %128, %127 : i64
    %130 = scf.if %129 -> (i64) {
      scf.yield %126 : i64
    } else {
      %131 = llvm.mlir.addressof @str13 : !llvm.ptr
      %132 = arith.constant 11 : i64
      %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
      %134 = func.call @cc_nil_value() : () -> i64
      %135 = func.call @cc_intern(%133, %134) : (i64, i64) -> i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_cons(%135, %136) : (i64, i64) -> i64
      %138 = func.call @cc_values_pack(%137) : (i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %139 = arith.addi %135, %__rlasp_stack_elide_zero_4 : i64
      %140 = func.call @cc_in_package(%139) : (i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %141 = arith.addi %140, %__rlasp_stack_elide_zero_5 : i64
      scf.yield %141 : i64
    }
    %142 = func.call @cc_nil_value() : () -> i64
    %143 = func.call @cc_errorp(%130) : (i64) -> i64
    %144 = arith.cmpi ne, %143, %142 : i64
    %145 = scf.if %144 -> (i64) {
      scf.yield %130 : i64
    } else {
      %146 = llvm.mlir.addressof @str14 : !llvm.ptr
      %147 = arith.constant 15 : i64
      %148 = func.call @cc_make_string(%146, %147) : (!llvm.ptr, i64) -> i64
      %149 = func.call @cc_nil_value() : () -> i64
      %150 = func.call @cc_intern(%148, %149) : (i64, i64) -> i64
      %151 = func.call @cc_nil_value() : () -> i64
      %152 = func.call @cc_cons(%150, %151) : (i64, i64) -> i64
      %153 = func.call @cc_values_pack(%152) : (i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %154 = arith.addi %150, %__rlasp_stack_elide_zero_6 : i64
      %155 = llvm.mlir.addressof @str15 : !llvm.ptr
      %156 = arith.constant 3 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = func.call @cc_nil_value() : () -> i64
      %159 = func.call @cc_intern(%157, %158) : (i64, i64) -> i64
      %160 = func.call @cc_nil_value() : () -> i64
      %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
      %162 = func.call @cc_values_pack(%161) : (i64) -> i64
      func.call @stack_push_pointer(%159) : (i64) -> ()
      %163 = llvm.mlir.addressof @str16 : !llvm.ptr
      %164 = arith.constant 3 : i64
      %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_intern(%165, %166) : (i64, i64) -> i64
      %168 = func.call @cc_nil_value() : () -> i64
      %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
      %170 = func.call @cc_values_pack(%169) : (i64) -> i64
      func.call @stack_push_pointer(%167) : (i64) -> ()
      %171 = llvm.mlir.addressof @str17 : !llvm.ptr
      %172 = arith.constant 19 : i64
      %173 = func.call @cc_make_string(%171, %172) : (!llvm.ptr, i64) -> i64
      %174 = llvm.mlir.addressof @str18 : !llvm.ptr
      %175 = arith.constant 11 : i64
      %176 = func.call @cc_make_string(%174, %175) : (!llvm.ptr, i64) -> i64
      %177 = func.call @cc_intern(%173, %176) : (i64, i64) -> i64
      %178 = func.call @cc_nil_value() : () -> i64
      %179 = func.call @cc_cons(%177, %178) : (i64, i64) -> i64
      %180 = func.call @cc_values_pack(%179) : (i64) -> i64
      func.call @stack_push_pointer(%177) : (i64) -> ()
      %181 = llvm.mlir.addressof @str19 : !llvm.ptr
      %182 = arith.constant 2 : i64
      %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
      %184 = llvm.mlir.addressof @str20 : !llvm.ptr
      %185 = arith.constant 11 : i64
      %186 = func.call @cc_make_string(%184, %185) : (!llvm.ptr, i64) -> i64
      %187 = func.call @cc_intern(%183, %186) : (i64, i64) -> i64
      %188 = func.call @cc_nil_value() : () -> i64
      %189 = func.call @cc_cons(%187, %188) : (i64, i64) -> i64
      %190 = func.call @cc_values_pack(%189) : (i64) -> i64
      func.call @stack_push_pointer(%187) : (i64) -> ()
      %191 = llvm.mlir.addressof @str21 : !llvm.ptr
      %192 = arith.constant 2 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = llvm.mlir.addressof @str22 : !llvm.ptr
      %195 = arith.constant 11 : i64
      %196 = func.call @cc_make_string(%194, %195) : (!llvm.ptr, i64) -> i64
      %197 = func.call @cc_intern(%193, %196) : (i64, i64) -> i64
      %198 = func.call @cc_nil_value() : () -> i64
      %199 = func.call @cc_cons(%197, %198) : (i64, i64) -> i64
      %200 = func.call @cc_values_pack(%199) : (i64) -> i64
      func.call @stack_push_pointer(%197) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @cc_cons(%202, %201) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %204 = arith.addi %203, %__rlasp_stack_elide_zero_7 : i64
      %205 = func.call @stack_pop_pointer() : () -> i64
      %206 = func.call @cc_cons(%205, %204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %207 = llvm.mlir.addressof @str23 : !llvm.ptr
      %208 = arith.constant 8 : i64
      %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
      %210 = llvm.mlir.addressof @str24 : !llvm.ptr
      %211 = arith.constant 11 : i64
      %212 = func.call @cc_make_string(%210, %211) : (!llvm.ptr, i64) -> i64
      %213 = func.call @cc_intern(%209, %212) : (i64, i64) -> i64
      %214 = func.call @cc_nil_value() : () -> i64
      %215 = func.call @cc_cons(%213, %214) : (i64, i64) -> i64
      %216 = func.call @cc_values_pack(%215) : (i64) -> i64
      func.call @stack_push_pointer(%213) : (i64) -> ()
      %217 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %218 = llvm.mlir.addressof @str25 : !llvm.ptr
      %219 = arith.constant 6 : i64
      %220 = func.call @cc_make_string(%218, %219) : (!llvm.ptr, i64) -> i64
      %221 = llvm.mlir.addressof @str26 : !llvm.ptr
      %222 = arith.constant 11 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = func.call @cc_intern(%220, %223) : (i64, i64) -> i64
      %225 = func.call @cc_nil_value() : () -> i64
      %226 = func.call @cc_cons(%224, %225) : (i64, i64) -> i64
      %227 = func.call @cc_values_pack(%226) : (i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %228 = arith.addi %224, %__rlasp_stack_elide_zero_8 : i64
      %229 = func.call @stack_pop_pointer() : () -> i64
      %230 = func.call @cc_cons(%228, %229) : (i64, i64) -> i64
      %231 = llvm.mlir.addressof @str27 : !llvm.ptr
      %232 = arith.constant 5 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_intern(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_nil_value() : () -> i64
      %237 = func.call @cc_cons(%235, %236) : (i64, i64) -> i64
      %238 = func.call @cc_values_pack(%237) : (i64) -> i64
      %239 = func.call @cc_cons(%235, %230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %240 = llvm.mlir.addressof @str28 : !llvm.ptr
      %241 = arith.constant 10 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      %243 = llvm.mlir.addressof @str29 : !llvm.ptr
      %244 = arith.constant 11 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = func.call @cc_intern(%242, %245) : (i64, i64) -> i64
      %247 = func.call @cc_nil_value() : () -> i64
      %248 = func.call @cc_cons(%246, %247) : (i64, i64) -> i64
      %249 = func.call @cc_values_pack(%248) : (i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      %250 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      %251 = llvm.mlir.addressof @str30 : !llvm.ptr
      %252 = arith.constant 6 : i64
      %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
      %254 = llvm.mlir.addressof @str31 : !llvm.ptr
      %255 = arith.constant 11 : i64
      %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
      %257 = func.call @cc_intern(%253, %256) : (i64, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_values_pack(%259) : (i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %261 = arith.addi %257, %__rlasp_stack_elide_zero_9 : i64
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @cc_cons(%261, %262) : (i64, i64) -> i64
      %264 = llvm.mlir.addressof @str32 : !llvm.ptr
      %265 = arith.constant 5 : i64
      %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_intern(%266, %267) : (i64, i64) -> i64
      %269 = func.call @cc_nil_value() : () -> i64
      %270 = func.call @cc_cons(%268, %269) : (i64, i64) -> i64
      %271 = func.call @cc_values_pack(%270) : (i64) -> i64
      %272 = func.call @cc_cons(%268, %263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = func.call @stack_pop_pointer() : () -> i64
      %275 = func.call @cc_cons(%274, %273) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %276 = arith.addi %275, %__rlasp_stack_elide_zero_10 : i64
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = func.call @cc_cons(%277, %276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %279 = func.call @stack_pop_pointer() : () -> i64
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @cc_cons(%280, %279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %282 = arith.addi %281, %__rlasp_stack_elide_zero_11 : i64
      %283 = func.call @stack_pop_pointer() : () -> i64
      %284 = func.call @cc_cons(%283, %282) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %285 = arith.addi %284, %__rlasp_stack_elide_zero_12 : i64
      %286 = func.call @stack_pop_pointer() : () -> i64
      %287 = func.call @cc_cons(%286, %285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%287) : (i64) -> ()
      %288 = llvm.mlir.addressof @str33 : !llvm.ptr
      %289 = arith.constant 3 : i64
      %290 = func.call @cc_make_string(%288, %289) : (!llvm.ptr, i64) -> i64
      %291 = llvm.mlir.addressof @str34 : !llvm.ptr
      %292 = arith.constant 11 : i64
      %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
      %294 = func.call @cc_intern(%290, %293) : (i64, i64) -> i64
      %295 = func.call @cc_nil_value() : () -> i64
      %296 = func.call @cc_cons(%294, %295) : (i64, i64) -> i64
      %297 = func.call @cc_values_pack(%296) : (i64) -> i64
      func.call @stack_push_pointer(%294) : (i64) -> ()
      %298 = llvm.mlir.addressof @str35 : !llvm.ptr
      %299 = arith.constant 2 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = llvm.mlir.addressof @str36 : !llvm.ptr
      %302 = arith.constant 11 : i64
      %303 = func.call @cc_make_string(%301, %302) : (!llvm.ptr, i64) -> i64
      %304 = func.call @cc_intern(%300, %303) : (i64, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_cons(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_values_pack(%306) : (i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      %308 = llvm.mlir.addressof @str37 : !llvm.ptr
      %309 = arith.constant 2 : i64
      %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
      %311 = llvm.mlir.addressof @str38 : !llvm.ptr
      %312 = arith.constant 11 : i64
      %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
      %314 = func.call @cc_intern(%310, %313) : (i64, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_cons(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_values_pack(%316) : (i64) -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @stack_pop_pointer() : () -> i64
      %320 = func.call @cc_cons(%319, %318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %321 = arith.addi %320, %__rlasp_stack_elide_zero_13 : i64
      %322 = func.call @stack_pop_pointer() : () -> i64
      %323 = func.call @cc_cons(%322, %321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %324 = arith.addi %323, %__rlasp_stack_elide_zero_14 : i64
      %325 = func.call @stack_pop_pointer() : () -> i64
      %326 = func.call @cc_cons(%325, %324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %327 = func.call @stack_pop_pointer() : () -> i64
      %328 = func.call @stack_pop_pointer() : () -> i64
      %329 = func.call @cc_cons(%328, %327) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %330 = arith.addi %329, %__rlasp_stack_elide_zero_15 : i64
      %331 = func.call @stack_pop_pointer() : () -> i64
      %332 = func.call @cc_cons(%331, %330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %333 = arith.addi %332, %__rlasp_stack_elide_zero_16 : i64
      %334 = func.call @stack_pop_pointer() : () -> i64
      %335 = func.call @cc_cons(%334, %333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %336 = arith.addi %335, %__rlasp_stack_elide_zero_17 : i64
      %337 = func.call @stack_pop_pointer() : () -> i64
      %338 = func.call @cc_cons(%337, %336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%338) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %339 = func.call @stack_pop_pointer() : () -> i64
      %340 = func.call @stack_pop_pointer() : () -> i64
      %341 = func.call @cc_cons(%340, %339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %342 = arith.addi %341, %__rlasp_stack_elide_zero_18 : i64
      %343 = func.call @stack_pop_pointer() : () -> i64
      %344 = func.call @cc_cons(%343, %342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %345 = func.call @stack_pop_pointer() : () -> i64
      %346 = func.call @stack_pop_pointer() : () -> i64
      %347 = func.call @cc_cons(%346, %345) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %348 = arith.addi %347, %__rlasp_stack_elide_zero_19 : i64
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = func.call @cc_cons(%349, %348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %351 = arith.addi %350, %__rlasp_stack_elide_zero_20 : i64
      %414 = arith.constant 206494159077378 : i64
      %415 = arith.constant 0 : i64
      %416 = func.call @cc_make_closure(%414, %415) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %417 = arith.addi %416, %__rlasp_stack_elide_zero_21 : i64
      %418 = llvm.mlir.addressof @str44 : !llvm.ptr
      %419 = arith.constant 1 : i64
      %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
      %421 = func.call @cc_nil_value() : () -> i64
      %422 = func.call @cc_intern(%420, %421) : (i64, i64) -> i64
      %423 = func.call @cc_nil_value() : () -> i64
      %424 = func.call @cc_cons(%422, %423) : (i64, i64) -> i64
      %425 = func.call @cc_values_pack(%424) : (i64) -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%427, %426) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %429 = arith.addi %428, %__rlasp_stack_elide_zero_22 : i64
      %430 = llvm.mlir.addressof @str45 : !llvm.ptr
      %431 = arith.constant 11 : i64
      %432 = func.call @cc_make_string(%430, %431) : (!llvm.ptr, i64) -> i64
      %433 = llvm.mlir.addressof @str46 : !llvm.ptr
      %434 = arith.constant 7 : i64
      %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
      %436 = func.call @cc_intern(%432, %435) : (i64, i64) -> i64
      %437 = func.call @cc_nil_value() : () -> i64
      %438 = func.call @cc_cons(%436, %437) : (i64, i64) -> i64
      %439 = func.call @cc_values_pack(%438) : (i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = llvm.mlir.addressof @str47 : !llvm.ptr
      %442 = arith.constant 4 : i64
      %443 = func.call @cc_make_string(%441, %442) : (!llvm.ptr, i64) -> i64
      %444 = llvm.mlir.addressof @str48 : !llvm.ptr
      %445 = arith.constant 7 : i64
      %446 = func.call @cc_make_string(%444, %445) : (!llvm.ptr, i64) -> i64
      %447 = func.call @cc_intern(%443, %446) : (i64, i64) -> i64
      %448 = func.call @cc_nil_value() : () -> i64
      %449 = func.call @cc_cons(%447, %448) : (i64, i64) -> i64
      %450 = func.call @cc_values_pack(%449) : (i64) -> i64
      %451 = llvm.mlir.addressof @str49 : !llvm.ptr
      %452 = arith.constant 6 : i64
      %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
      %454 = func.call @cc_nil_value() : () -> i64
      %455 = func.call @cc_intern(%453, %454) : (i64, i64) -> i64
      %456 = func.call @cc_nil_value() : () -> i64
      %457 = func.call @cc_cons(%455, %456) : (i64, i64) -> i64
      %458 = func.call @cc_values_pack(%457) : (i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %459 = arith.addi %455, %__rlasp_stack_elide_zero_23 : i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_errorp(%154) : (i64) -> i64
      %462 = arith.cmpi ne, %461, %460 : i64
      %463 = arith.cmpi eq, %460, %460 : i64
      %464 = arith.andi %462, %463 : i1
      %465 = scf.if %464 -> (i64) {
        scf.yield %154 : i64
      } else {
        scf.yield %460 : i64
      }
      %466 = func.call @cc_errorp(%351) : (i64) -> i64
      %467 = arith.cmpi ne, %466, %460 : i64
      %468 = arith.cmpi eq, %465, %460 : i64
      %469 = arith.andi %467, %468 : i1
      %470 = scf.if %469 -> (i64) {
        scf.yield %351 : i64
      } else {
        scf.yield %465 : i64
      }
      %471 = func.call @cc_errorp(%417) : (i64) -> i64
      %472 = arith.cmpi ne, %471, %460 : i64
      %473 = arith.cmpi eq, %470, %460 : i64
      %474 = arith.andi %472, %473 : i1
      %475 = scf.if %474 -> (i64) {
        scf.yield %417 : i64
      } else {
        scf.yield %470 : i64
      }
      %476 = func.call @cc_errorp(%429) : (i64) -> i64
      %477 = arith.cmpi ne, %476, %460 : i64
      %478 = arith.cmpi eq, %475, %460 : i64
      %479 = arith.andi %477, %478 : i1
      %480 = scf.if %479 -> (i64) {
        scf.yield %429 : i64
      } else {
        scf.yield %475 : i64
      }
      %481 = func.call @cc_errorp(%436) : (i64) -> i64
      %482 = arith.cmpi ne, %481, %460 : i64
      %483 = arith.cmpi eq, %480, %460 : i64
      %484 = arith.andi %482, %483 : i1
      %485 = scf.if %484 -> (i64) {
        scf.yield %436 : i64
      } else {
        scf.yield %480 : i64
      }
      %486 = func.call @cc_errorp(%440) : (i64) -> i64
      %487 = arith.cmpi ne, %486, %460 : i64
      %488 = arith.cmpi eq, %485, %460 : i64
      %489 = arith.andi %487, %488 : i1
      %490 = scf.if %489 -> (i64) {
        scf.yield %440 : i64
      } else {
        scf.yield %485 : i64
      }
      %491 = func.call @cc_errorp(%447) : (i64) -> i64
      %492 = arith.cmpi ne, %491, %460 : i64
      %493 = arith.cmpi eq, %490, %460 : i64
      %494 = arith.andi %492, %493 : i1
      %495 = scf.if %494 -> (i64) {
        scf.yield %447 : i64
      } else {
        scf.yield %490 : i64
      }
      %496 = func.call @cc_errorp(%459) : (i64) -> i64
      %497 = arith.cmpi ne, %496, %460 : i64
      %498 = arith.cmpi eq, %495, %460 : i64
      %499 = arith.andi %497, %498 : i1
      %500 = scf.if %499 -> (i64) {
        scf.yield %459 : i64
      } else {
        scf.yield %495 : i64
      }
      %501 = arith.cmpi ne, %500, %460 : i64
      scf.if %501 {
        func.call @stack_push_pointer(%500) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%154) : (i64) -> ()
        func.call @stack_push_pointer(%351) : (i64) -> ()
        func.call @stack_push_pointer(%417) : (i64) -> ()
        func.call @stack_push_pointer(%429) : (i64) -> ()
        func.call @stack_push_pointer(%436) : (i64) -> ()
        func.call @stack_push_pointer(%440) : (i64) -> ()
        func.call @stack_push_pointer(%447) : (i64) -> ()
        func.call @stack_push_pointer(%459) : (i64) -> ()
        %502 = llvm.mlir.addressof @str50 : !llvm.ptr
        %503 = func.call @cc_make_function_ref_const(%502) : (!llvm.ptr) -> i64
        %504 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%503, %504) : (i64, i64) -> ()
      }
      %505 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %505 : i64
    }
    %506 = func.call @cc_nil_value() : () -> i64
    %507 = func.call @cc_errorp(%145) : (i64) -> i64
    %508 = arith.cmpi ne, %507, %506 : i64
    %509 = scf.if %508 -> (i64) {
      scf.yield %145 : i64
    } else {
      %510 = llvm.mlir.addressof @str51 : !llvm.ptr
      %511 = arith.constant 15 : i64
      %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
      %513 = func.call @cc_nil_value() : () -> i64
      %514 = func.call @cc_intern(%512, %513) : (i64, i64) -> i64
      %515 = func.call @cc_nil_value() : () -> i64
      %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
      %517 = func.call @cc_values_pack(%516) : (i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %518 = arith.addi %514, %__rlasp_stack_elide_zero_24 : i64
      %519 = llvm.mlir.addressof @str52 : !llvm.ptr
      %520 = arith.constant 3 : i64
      %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
      %522 = func.call @cc_nil_value() : () -> i64
      %523 = func.call @cc_intern(%521, %522) : (i64, i64) -> i64
      %524 = func.call @cc_nil_value() : () -> i64
      %525 = func.call @cc_cons(%523, %524) : (i64, i64) -> i64
      %526 = func.call @cc_values_pack(%525) : (i64) -> i64
      func.call @stack_push_pointer(%523) : (i64) -> ()
      %527 = llvm.mlir.addressof @str53 : !llvm.ptr
      %528 = arith.constant 3 : i64
      %529 = func.call @cc_make_string(%527, %528) : (!llvm.ptr, i64) -> i64
      %530 = func.call @cc_nil_value() : () -> i64
      %531 = func.call @cc_intern(%529, %530) : (i64, i64) -> i64
      %532 = func.call @cc_nil_value() : () -> i64
      %533 = func.call @cc_cons(%531, %532) : (i64, i64) -> i64
      %534 = func.call @cc_values_pack(%533) : (i64) -> i64
      func.call @stack_push_pointer(%531) : (i64) -> ()
      %535 = llvm.mlir.addressof @str54 : !llvm.ptr
      %536 = arith.constant 19 : i64
      %537 = func.call @cc_make_string(%535, %536) : (!llvm.ptr, i64) -> i64
      %538 = llvm.mlir.addressof @str55 : !llvm.ptr
      %539 = arith.constant 11 : i64
      %540 = func.call @cc_make_string(%538, %539) : (!llvm.ptr, i64) -> i64
      %541 = func.call @cc_intern(%537, %540) : (i64, i64) -> i64
      %542 = func.call @cc_nil_value() : () -> i64
      %543 = func.call @cc_cons(%541, %542) : (i64, i64) -> i64
      %544 = func.call @cc_values_pack(%543) : (i64) -> i64
      func.call @stack_push_pointer(%541) : (i64) -> ()
      %545 = llvm.mlir.addressof @str56 : !llvm.ptr
      %546 = arith.constant 2 : i64
      %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
      %548 = llvm.mlir.addressof @str57 : !llvm.ptr
      %549 = arith.constant 11 : i64
      %550 = func.call @cc_make_string(%548, %549) : (!llvm.ptr, i64) -> i64
      %551 = func.call @cc_intern(%547, %550) : (i64, i64) -> i64
      %552 = func.call @cc_nil_value() : () -> i64
      %553 = func.call @cc_cons(%551, %552) : (i64, i64) -> i64
      %554 = func.call @cc_values_pack(%553) : (i64) -> i64
      func.call @stack_push_pointer(%551) : (i64) -> ()
      %555 = llvm.mlir.addressof @str58 : !llvm.ptr
      %556 = arith.constant 2 : i64
      %557 = func.call @cc_make_string(%555, %556) : (!llvm.ptr, i64) -> i64
      %558 = llvm.mlir.addressof @str59 : !llvm.ptr
      %559 = arith.constant 11 : i64
      %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
      %561 = func.call @cc_intern(%557, %560) : (i64, i64) -> i64
      %562 = func.call @cc_nil_value() : () -> i64
      %563 = func.call @cc_cons(%561, %562) : (i64, i64) -> i64
      %564 = func.call @cc_values_pack(%563) : (i64) -> i64
      func.call @stack_push_pointer(%561) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @stack_pop_pointer() : () -> i64
      %567 = func.call @cc_cons(%566, %565) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %568 = arith.addi %567, %__rlasp_stack_elide_zero_25 : i64
      %569 = func.call @stack_pop_pointer() : () -> i64
      %570 = func.call @cc_cons(%569, %568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%570) : (i64) -> ()
      %571 = llvm.mlir.addressof @str60 : !llvm.ptr
      %572 = arith.constant 8 : i64
      %573 = func.call @cc_make_string(%571, %572) : (!llvm.ptr, i64) -> i64
      %574 = llvm.mlir.addressof @str61 : !llvm.ptr
      %575 = arith.constant 11 : i64
      %576 = func.call @cc_make_string(%574, %575) : (!llvm.ptr, i64) -> i64
      %577 = func.call @cc_intern(%573, %576) : (i64, i64) -> i64
      %578 = func.call @cc_nil_value() : () -> i64
      %579 = func.call @cc_cons(%577, %578) : (i64, i64) -> i64
      %580 = func.call @cc_values_pack(%579) : (i64) -> i64
      func.call @stack_push_pointer(%577) : (i64) -> ()
      %581 = llvm.mlir.addressof @str62 : !llvm.ptr
      %582 = arith.constant 10 : i64
      %583 = func.call @cc_make_string(%581, %582) : (!llvm.ptr, i64) -> i64
      %584 = llvm.mlir.addressof @str63 : !llvm.ptr
      %585 = arith.constant 11 : i64
      %586 = func.call @cc_make_string(%584, %585) : (!llvm.ptr, i64) -> i64
      %587 = func.call @cc_intern(%583, %586) : (i64, i64) -> i64
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_cons(%587, %588) : (i64, i64) -> i64
      %590 = func.call @cc_values_pack(%589) : (i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      %591 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      %592 = llvm.mlir.addressof @str64 : !llvm.ptr
      %593 = arith.constant 6 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = llvm.mlir.addressof @str65 : !llvm.ptr
      %596 = arith.constant 11 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = func.call @cc_intern(%594, %597) : (i64, i64) -> i64
      %599 = func.call @cc_nil_value() : () -> i64
      %600 = func.call @cc_cons(%598, %599) : (i64, i64) -> i64
      %601 = func.call @cc_values_pack(%600) : (i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %602 = arith.addi %598, %__rlasp_stack_elide_zero_26 : i64
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @cc_cons(%602, %603) : (i64, i64) -> i64
      %605 = llvm.mlir.addressof @str66 : !llvm.ptr
      %606 = arith.constant 5 : i64
      %607 = func.call @cc_make_string(%605, %606) : (!llvm.ptr, i64) -> i64
      %608 = func.call @cc_nil_value() : () -> i64
      %609 = func.call @cc_intern(%607, %608) : (i64, i64) -> i64
      %610 = func.call @cc_nil_value() : () -> i64
      %611 = func.call @cc_cons(%609, %610) : (i64, i64) -> i64
      %612 = func.call @cc_values_pack(%611) : (i64) -> i64
      %613 = func.call @cc_cons(%609, %604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%613) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @stack_pop_pointer() : () -> i64
      %616 = func.call @cc_cons(%615, %614) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %617 = arith.addi %616, %__rlasp_stack_elide_zero_27 : i64
      %618 = func.call @stack_pop_pointer() : () -> i64
      %619 = func.call @cc_cons(%618, %617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%619) : (i64) -> ()
      %620 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%620) : (i64) -> ()
      %621 = llvm.mlir.addressof @str67 : !llvm.ptr
      %622 = arith.constant 6 : i64
      %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
      %624 = llvm.mlir.addressof @str68 : !llvm.ptr
      %625 = arith.constant 11 : i64
      %626 = func.call @cc_make_string(%624, %625) : (!llvm.ptr, i64) -> i64
      %627 = func.call @cc_intern(%623, %626) : (i64, i64) -> i64
      %628 = func.call @cc_nil_value() : () -> i64
      %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
      %630 = func.call @cc_values_pack(%629) : (i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %631 = arith.addi %627, %__rlasp_stack_elide_zero_28 : i64
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @cc_cons(%631, %632) : (i64, i64) -> i64
      %634 = llvm.mlir.addressof @str69 : !llvm.ptr
      %635 = arith.constant 5 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = func.call @cc_nil_value() : () -> i64
      %638 = func.call @cc_intern(%636, %637) : (i64, i64) -> i64
      %639 = func.call @cc_nil_value() : () -> i64
      %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
      %641 = func.call @cc_values_pack(%640) : (i64) -> i64
      %642 = func.call @cc_cons(%638, %633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%642) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @stack_pop_pointer() : () -> i64
      %645 = func.call @cc_cons(%644, %643) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %646 = arith.addi %645, %__rlasp_stack_elide_zero_29 : i64
      %647 = func.call @stack_pop_pointer() : () -> i64
      %648 = func.call @cc_cons(%647, %646) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %649 = arith.addi %648, %__rlasp_stack_elide_zero_30 : i64
      %650 = func.call @stack_pop_pointer() : () -> i64
      %651 = func.call @cc_cons(%650, %649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %652 = llvm.mlir.addressof @str70 : !llvm.ptr
      %653 = arith.constant 3 : i64
      %654 = func.call @cc_make_string(%652, %653) : (!llvm.ptr, i64) -> i64
      %655 = llvm.mlir.addressof @str71 : !llvm.ptr
      %656 = arith.constant 11 : i64
      %657 = func.call @cc_make_string(%655, %656) : (!llvm.ptr, i64) -> i64
      %658 = func.call @cc_intern(%654, %657) : (i64, i64) -> i64
      %659 = func.call @cc_nil_value() : () -> i64
      %660 = func.call @cc_cons(%658, %659) : (i64, i64) -> i64
      %661 = func.call @cc_values_pack(%660) : (i64) -> i64
      func.call @stack_push_pointer(%658) : (i64) -> ()
      %662 = llvm.mlir.addressof @str72 : !llvm.ptr
      %663 = arith.constant 2 : i64
      %664 = func.call @cc_make_string(%662, %663) : (!llvm.ptr, i64) -> i64
      %665 = llvm.mlir.addressof @str73 : !llvm.ptr
      %666 = arith.constant 11 : i64
      %667 = func.call @cc_make_string(%665, %666) : (!llvm.ptr, i64) -> i64
      %668 = func.call @cc_intern(%664, %667) : (i64, i64) -> i64
      %669 = func.call @cc_nil_value() : () -> i64
      %670 = func.call @cc_cons(%668, %669) : (i64, i64) -> i64
      %671 = func.call @cc_values_pack(%670) : (i64) -> i64
      func.call @stack_push_pointer(%668) : (i64) -> ()
      %672 = llvm.mlir.addressof @str74 : !llvm.ptr
      %673 = arith.constant 2 : i64
      %674 = func.call @cc_make_string(%672, %673) : (!llvm.ptr, i64) -> i64
      %675 = llvm.mlir.addressof @str75 : !llvm.ptr
      %676 = arith.constant 11 : i64
      %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
      %678 = func.call @cc_intern(%674, %677) : (i64, i64) -> i64
      %679 = func.call @cc_nil_value() : () -> i64
      %680 = func.call @cc_cons(%678, %679) : (i64, i64) -> i64
      %681 = func.call @cc_values_pack(%680) : (i64) -> i64
      func.call @stack_push_pointer(%678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @cc_cons(%683, %682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %685 = arith.addi %684, %__rlasp_stack_elide_zero_31 : i64
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @cc_cons(%686, %685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %688 = arith.addi %687, %__rlasp_stack_elide_zero_32 : i64
      %689 = func.call @stack_pop_pointer() : () -> i64
      %690 = func.call @cc_cons(%689, %688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%690) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %691 = func.call @stack_pop_pointer() : () -> i64
      %692 = func.call @stack_pop_pointer() : () -> i64
      %693 = func.call @cc_cons(%692, %691) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %694 = arith.addi %693, %__rlasp_stack_elide_zero_33 : i64
      %695 = func.call @stack_pop_pointer() : () -> i64
      %696 = func.call @cc_cons(%695, %694) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %697 = arith.addi %696, %__rlasp_stack_elide_zero_34 : i64
      %698 = func.call @stack_pop_pointer() : () -> i64
      %699 = func.call @cc_cons(%698, %697) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %700 = arith.addi %699, %__rlasp_stack_elide_zero_35 : i64
      %701 = func.call @stack_pop_pointer() : () -> i64
      %702 = func.call @cc_cons(%701, %700) : (i64, i64) -> i64
      func.call @stack_push_pointer(%702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = func.call @stack_pop_pointer() : () -> i64
      %705 = func.call @cc_cons(%704, %703) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %706 = arith.addi %705, %__rlasp_stack_elide_zero_36 : i64
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = func.call @cc_cons(%707, %706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%708) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %709 = func.call @stack_pop_pointer() : () -> i64
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @cc_cons(%710, %709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %712 = arith.addi %711, %__rlasp_stack_elide_zero_37 : i64
      %713 = func.call @stack_pop_pointer() : () -> i64
      %714 = func.call @cc_cons(%713, %712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %715 = arith.addi %714, %__rlasp_stack_elide_zero_38 : i64
      %778 = arith.constant 206494159077379 : i64
      %779 = arith.constant 0 : i64
      %780 = func.call @cc_make_closure(%778, %779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %781 = arith.addi %780, %__rlasp_stack_elide_zero_39 : i64
      %782 = llvm.mlir.addressof @str81 : !llvm.ptr
      %783 = arith.constant 1 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      %785 = func.call @cc_nil_value() : () -> i64
      %786 = func.call @cc_intern(%784, %785) : (i64, i64) -> i64
      %787 = func.call @cc_nil_value() : () -> i64
      %788 = func.call @cc_cons(%786, %787) : (i64, i64) -> i64
      %789 = func.call @cc_values_pack(%788) : (i64) -> i64
      func.call @stack_push_pointer(%786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %793 = arith.addi %792, %__rlasp_stack_elide_zero_40 : i64
      %794 = llvm.mlir.addressof @str82 : !llvm.ptr
      %795 = arith.constant 11 : i64
      %796 = func.call @cc_make_string(%794, %795) : (!llvm.ptr, i64) -> i64
      %797 = llvm.mlir.addressof @str83 : !llvm.ptr
      %798 = arith.constant 7 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = func.call @cc_intern(%796, %799) : (i64, i64) -> i64
      %801 = func.call @cc_nil_value() : () -> i64
      %802 = func.call @cc_cons(%800, %801) : (i64, i64) -> i64
      %803 = func.call @cc_values_pack(%802) : (i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = llvm.mlir.addressof @str84 : !llvm.ptr
      %806 = arith.constant 4 : i64
      %807 = func.call @cc_make_string(%805, %806) : (!llvm.ptr, i64) -> i64
      %808 = llvm.mlir.addressof @str85 : !llvm.ptr
      %809 = arith.constant 7 : i64
      %810 = func.call @cc_make_string(%808, %809) : (!llvm.ptr, i64) -> i64
      %811 = func.call @cc_intern(%807, %810) : (i64, i64) -> i64
      %812 = func.call @cc_nil_value() : () -> i64
      %813 = func.call @cc_cons(%811, %812) : (i64, i64) -> i64
      %814 = func.call @cc_values_pack(%813) : (i64) -> i64
      %815 = llvm.mlir.addressof @str86 : !llvm.ptr
      %816 = arith.constant 6 : i64
      %817 = func.call @cc_make_string(%815, %816) : (!llvm.ptr, i64) -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_intern(%817, %818) : (i64, i64) -> i64
      %820 = func.call @cc_nil_value() : () -> i64
      %821 = func.call @cc_cons(%819, %820) : (i64, i64) -> i64
      %822 = func.call @cc_values_pack(%821) : (i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %823 = arith.addi %819, %__rlasp_stack_elide_zero_41 : i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_errorp(%518) : (i64) -> i64
      %826 = arith.cmpi ne, %825, %824 : i64
      %827 = arith.cmpi eq, %824, %824 : i64
      %828 = arith.andi %826, %827 : i1
      %829 = scf.if %828 -> (i64) {
        scf.yield %518 : i64
      } else {
        scf.yield %824 : i64
      }
      %830 = func.call @cc_errorp(%715) : (i64) -> i64
      %831 = arith.cmpi ne, %830, %824 : i64
      %832 = arith.cmpi eq, %829, %824 : i64
      %833 = arith.andi %831, %832 : i1
      %834 = scf.if %833 -> (i64) {
        scf.yield %715 : i64
      } else {
        scf.yield %829 : i64
      }
      %835 = func.call @cc_errorp(%781) : (i64) -> i64
      %836 = arith.cmpi ne, %835, %824 : i64
      %837 = arith.cmpi eq, %834, %824 : i64
      %838 = arith.andi %836, %837 : i1
      %839 = scf.if %838 -> (i64) {
        scf.yield %781 : i64
      } else {
        scf.yield %834 : i64
      }
      %840 = func.call @cc_errorp(%793) : (i64) -> i64
      %841 = arith.cmpi ne, %840, %824 : i64
      %842 = arith.cmpi eq, %839, %824 : i64
      %843 = arith.andi %841, %842 : i1
      %844 = scf.if %843 -> (i64) {
        scf.yield %793 : i64
      } else {
        scf.yield %839 : i64
      }
      %845 = func.call @cc_errorp(%800) : (i64) -> i64
      %846 = arith.cmpi ne, %845, %824 : i64
      %847 = arith.cmpi eq, %844, %824 : i64
      %848 = arith.andi %846, %847 : i1
      %849 = scf.if %848 -> (i64) {
        scf.yield %800 : i64
      } else {
        scf.yield %844 : i64
      }
      %850 = func.call @cc_errorp(%804) : (i64) -> i64
      %851 = arith.cmpi ne, %850, %824 : i64
      %852 = arith.cmpi eq, %849, %824 : i64
      %853 = arith.andi %851, %852 : i1
      %854 = scf.if %853 -> (i64) {
        scf.yield %804 : i64
      } else {
        scf.yield %849 : i64
      }
      %855 = func.call @cc_errorp(%811) : (i64) -> i64
      %856 = arith.cmpi ne, %855, %824 : i64
      %857 = arith.cmpi eq, %854, %824 : i64
      %858 = arith.andi %856, %857 : i1
      %859 = scf.if %858 -> (i64) {
        scf.yield %811 : i64
      } else {
        scf.yield %854 : i64
      }
      %860 = func.call @cc_errorp(%823) : (i64) -> i64
      %861 = arith.cmpi ne, %860, %824 : i64
      %862 = arith.cmpi eq, %859, %824 : i64
      %863 = arith.andi %861, %862 : i1
      %864 = scf.if %863 -> (i64) {
        scf.yield %823 : i64
      } else {
        scf.yield %859 : i64
      }
      %865 = arith.cmpi ne, %864, %824 : i64
      scf.if %865 {
        func.call @stack_push_pointer(%864) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%518) : (i64) -> ()
        func.call @stack_push_pointer(%715) : (i64) -> ()
        func.call @stack_push_pointer(%781) : (i64) -> ()
        func.call @stack_push_pointer(%793) : (i64) -> ()
        func.call @stack_push_pointer(%800) : (i64) -> ()
        func.call @stack_push_pointer(%804) : (i64) -> ()
        func.call @stack_push_pointer(%811) : (i64) -> ()
        func.call @stack_push_pointer(%823) : (i64) -> ()
        %866 = llvm.mlir.addressof @str87 : !llvm.ptr
        %867 = func.call @cc_make_function_ref_const(%866) : (!llvm.ptr) -> i64
        %868 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%867, %868) : (i64, i64) -> ()
      }
      %869 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %869 : i64
    }
    %870 = func.call @cc_nil_value() : () -> i64
    %871 = func.call @cc_errorp(%509) : (i64) -> i64
    %872 = arith.cmpi ne, %871, %870 : i64
    %873 = scf.if %872 -> (i64) {
      scf.yield %509 : i64
    } else {
      %874 = llvm.mlir.addressof @str88 : !llvm.ptr
      %875 = arith.constant 15 : i64
      %876 = func.call @cc_make_string(%874, %875) : (!llvm.ptr, i64) -> i64
      %877 = func.call @cc_nil_value() : () -> i64
      %878 = func.call @cc_intern(%876, %877) : (i64, i64) -> i64
      %879 = func.call @cc_nil_value() : () -> i64
      %880 = func.call @cc_cons(%878, %879) : (i64, i64) -> i64
      %881 = func.call @cc_values_pack(%880) : (i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %882 = arith.addi %878, %__rlasp_stack_elide_zero_42 : i64
      %883 = llvm.mlir.addressof @str89 : !llvm.ptr
      %884 = arith.constant 3 : i64
      %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
      %886 = func.call @cc_nil_value() : () -> i64
      %887 = func.call @cc_intern(%885, %886) : (i64, i64) -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_cons(%887, %888) : (i64, i64) -> i64
      %890 = func.call @cc_values_pack(%889) : (i64) -> i64
      func.call @stack_push_pointer(%887) : (i64) -> ()
      %891 = llvm.mlir.addressof @str90 : !llvm.ptr
      %892 = arith.constant 3 : i64
      %893 = func.call @cc_make_string(%891, %892) : (!llvm.ptr, i64) -> i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = func.call @cc_intern(%893, %894) : (i64, i64) -> i64
      %896 = func.call @cc_nil_value() : () -> i64
      %897 = func.call @cc_cons(%895, %896) : (i64, i64) -> i64
      %898 = func.call @cc_values_pack(%897) : (i64) -> i64
      func.call @stack_push_pointer(%895) : (i64) -> ()
      %899 = llvm.mlir.addressof @str91 : !llvm.ptr
      %900 = arith.constant 19 : i64
      %901 = func.call @cc_make_string(%899, %900) : (!llvm.ptr, i64) -> i64
      %902 = llvm.mlir.addressof @str92 : !llvm.ptr
      %903 = arith.constant 11 : i64
      %904 = func.call @cc_make_string(%902, %903) : (!llvm.ptr, i64) -> i64
      %905 = func.call @cc_intern(%901, %904) : (i64, i64) -> i64
      %906 = func.call @cc_nil_value() : () -> i64
      %907 = func.call @cc_cons(%905, %906) : (i64, i64) -> i64
      %908 = func.call @cc_values_pack(%907) : (i64) -> i64
      func.call @stack_push_pointer(%905) : (i64) -> ()
      %909 = llvm.mlir.addressof @str93 : !llvm.ptr
      %910 = arith.constant 2 : i64
      %911 = func.call @cc_make_string(%909, %910) : (!llvm.ptr, i64) -> i64
      %912 = llvm.mlir.addressof @str94 : !llvm.ptr
      %913 = arith.constant 11 : i64
      %914 = func.call @cc_make_string(%912, %913) : (!llvm.ptr, i64) -> i64
      %915 = func.call @cc_intern(%911, %914) : (i64, i64) -> i64
      %916 = func.call @cc_nil_value() : () -> i64
      %917 = func.call @cc_cons(%915, %916) : (i64, i64) -> i64
      %918 = func.call @cc_values_pack(%917) : (i64) -> i64
      func.call @stack_push_pointer(%915) : (i64) -> ()
      %919 = llvm.mlir.addressof @str95 : !llvm.ptr
      %920 = arith.constant 2 : i64
      %921 = func.call @cc_make_string(%919, %920) : (!llvm.ptr, i64) -> i64
      %922 = llvm.mlir.addressof @str96 : !llvm.ptr
      %923 = arith.constant 11 : i64
      %924 = func.call @cc_make_string(%922, %923) : (!llvm.ptr, i64) -> i64
      %925 = func.call @cc_intern(%921, %924) : (i64, i64) -> i64
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_cons(%925, %926) : (i64, i64) -> i64
      %928 = func.call @cc_values_pack(%927) : (i64) -> i64
      func.call @stack_push_pointer(%925) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = func.call @stack_pop_pointer() : () -> i64
      %931 = func.call @cc_cons(%930, %929) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %932 = arith.addi %931, %__rlasp_stack_elide_zero_43 : i64
      %933 = func.call @stack_pop_pointer() : () -> i64
      %934 = func.call @cc_cons(%933, %932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%934) : (i64) -> ()
      %935 = llvm.mlir.addressof @str97 : !llvm.ptr
      %936 = arith.constant 8 : i64
      %937 = func.call @cc_make_string(%935, %936) : (!llvm.ptr, i64) -> i64
      %938 = llvm.mlir.addressof @str98 : !llvm.ptr
      %939 = arith.constant 11 : i64
      %940 = func.call @cc_make_string(%938, %939) : (!llvm.ptr, i64) -> i64
      %941 = func.call @cc_intern(%937, %940) : (i64, i64) -> i64
      %942 = func.call @cc_nil_value() : () -> i64
      %943 = func.call @cc_cons(%941, %942) : (i64, i64) -> i64
      %944 = func.call @cc_values_pack(%943) : (i64) -> i64
      func.call @stack_push_pointer(%941) : (i64) -> ()
      %945 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%945) : (i64) -> ()
      %946 = llvm.mlir.addressof @str99 : !llvm.ptr
      %947 = arith.constant 6 : i64
      %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
      %949 = llvm.mlir.addressof @str100 : !llvm.ptr
      %950 = arith.constant 11 : i64
      %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
      %952 = func.call @cc_intern(%948, %951) : (i64, i64) -> i64
      %953 = func.call @cc_nil_value() : () -> i64
      %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
      %955 = func.call @cc_values_pack(%954) : (i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %956 = arith.addi %952, %__rlasp_stack_elide_zero_44 : i64
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @cc_cons(%956, %957) : (i64, i64) -> i64
      %959 = llvm.mlir.addressof @str101 : !llvm.ptr
      %960 = arith.constant 5 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = func.call @cc_nil_value() : () -> i64
      %963 = func.call @cc_intern(%961, %962) : (i64, i64) -> i64
      %964 = func.call @cc_nil_value() : () -> i64
      %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
      %966 = func.call @cc_values_pack(%965) : (i64) -> i64
      %967 = func.call @cc_cons(%963, %958) : (i64, i64) -> i64
      func.call @stack_push_pointer(%967) : (i64) -> ()
      %968 = llvm.mlir.addressof @str102 : !llvm.ptr
      %969 = arith.constant 10 : i64
      %970 = func.call @cc_make_string(%968, %969) : (!llvm.ptr, i64) -> i64
      %971 = llvm.mlir.addressof @str103 : !llvm.ptr
      %972 = arith.constant 11 : i64
      %973 = func.call @cc_make_string(%971, %972) : (!llvm.ptr, i64) -> i64
      %974 = func.call @cc_intern(%970, %973) : (i64, i64) -> i64
      %975 = func.call @cc_nil_value() : () -> i64
      %976 = func.call @cc_cons(%974, %975) : (i64, i64) -> i64
      %977 = func.call @cc_values_pack(%976) : (i64) -> i64
      func.call @stack_push_pointer(%974) : (i64) -> ()
      %978 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %979 = llvm.mlir.addressof @str104 : !llvm.ptr
      %980 = arith.constant 6 : i64
      %981 = func.call @cc_make_string(%979, %980) : (!llvm.ptr, i64) -> i64
      %982 = llvm.mlir.addressof @str105 : !llvm.ptr
      %983 = arith.constant 11 : i64
      %984 = func.call @cc_make_string(%982, %983) : (!llvm.ptr, i64) -> i64
      %985 = func.call @cc_intern(%981, %984) : (i64, i64) -> i64
      %986 = func.call @cc_nil_value() : () -> i64
      %987 = func.call @cc_cons(%985, %986) : (i64, i64) -> i64
      %988 = func.call @cc_values_pack(%987) : (i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %989 = arith.addi %985, %__rlasp_stack_elide_zero_45 : i64
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @cc_cons(%989, %990) : (i64, i64) -> i64
      %992 = llvm.mlir.addressof @str106 : !llvm.ptr
      %993 = arith.constant 5 : i64
      %994 = func.call @cc_make_string(%992, %993) : (!llvm.ptr, i64) -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_intern(%994, %995) : (i64, i64) -> i64
      %997 = func.call @cc_nil_value() : () -> i64
      %998 = func.call @cc_cons(%996, %997) : (i64, i64) -> i64
      %999 = func.call @cc_values_pack(%998) : (i64) -> i64
      %1000 = func.call @cc_cons(%996, %991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1000) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @stack_pop_pointer() : () -> i64
      %1003 = func.call @cc_cons(%1002, %1001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1004 = arith.addi %1003, %__rlasp_stack_elide_zero_46 : i64
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = func.call @cc_cons(%1005, %1004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1006) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1007 = func.call @stack_pop_pointer() : () -> i64
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_cons(%1008, %1007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1010 = arith.addi %1009, %__rlasp_stack_elide_zero_47 : i64
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = func.call @cc_cons(%1011, %1010) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1013 = arith.addi %1012, %__rlasp_stack_elide_zero_48 : i64
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @cc_cons(%1014, %1013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1016 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1017 = arith.constant 3 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1020 = arith.constant 11 : i64
      %1021 = func.call @cc_make_string(%1019, %1020) : (!llvm.ptr, i64) -> i64
      %1022 = func.call @cc_intern(%1018, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_cons(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_values_pack(%1024) : (i64) -> i64
      func.call @stack_push_pointer(%1022) : (i64) -> ()
      %1026 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1027 = arith.constant 2 : i64
      %1028 = func.call @cc_make_string(%1026, %1027) : (!llvm.ptr, i64) -> i64
      %1029 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1030 = arith.constant 11 : i64
      %1031 = func.call @cc_make_string(%1029, %1030) : (!llvm.ptr, i64) -> i64
      %1032 = func.call @cc_intern(%1028, %1031) : (i64, i64) -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_cons(%1032, %1033) : (i64, i64) -> i64
      %1035 = func.call @cc_values_pack(%1034) : (i64) -> i64
      func.call @stack_push_pointer(%1032) : (i64) -> ()
      %1036 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1037 = arith.constant 2 : i64
      %1038 = func.call @cc_make_string(%1036, %1037) : (!llvm.ptr, i64) -> i64
      %1039 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1040 = arith.constant 11 : i64
      %1041 = func.call @cc_make_string(%1039, %1040) : (!llvm.ptr, i64) -> i64
      %1042 = func.call @cc_intern(%1038, %1041) : (i64, i64) -> i64
      %1043 = func.call @cc_nil_value() : () -> i64
      %1044 = func.call @cc_cons(%1042, %1043) : (i64, i64) -> i64
      %1045 = func.call @cc_values_pack(%1044) : (i64) -> i64
      func.call @stack_push_pointer(%1042) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @cc_cons(%1047, %1046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1049 = arith.addi %1048, %__rlasp_stack_elide_zero_49 : i64
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @cc_cons(%1050, %1049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1052 = arith.addi %1051, %__rlasp_stack_elide_zero_50 : i64
      %1053 = func.call @stack_pop_pointer() : () -> i64
      %1054 = func.call @cc_cons(%1053, %1052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1055 = func.call @stack_pop_pointer() : () -> i64
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = func.call @cc_cons(%1056, %1055) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1058 = arith.addi %1057, %__rlasp_stack_elide_zero_51 : i64
      %1059 = func.call @stack_pop_pointer() : () -> i64
      %1060 = func.call @cc_cons(%1059, %1058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1061 = arith.addi %1060, %__rlasp_stack_elide_zero_52 : i64
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @cc_cons(%1062, %1061) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1064 = arith.addi %1063, %__rlasp_stack_elide_zero_53 : i64
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @cc_cons(%1065, %1064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1067 = func.call @stack_pop_pointer() : () -> i64
      %1068 = func.call @stack_pop_pointer() : () -> i64
      %1069 = func.call @cc_cons(%1068, %1067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1070 = arith.addi %1069, %__rlasp_stack_elide_zero_54 : i64
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @cc_cons(%1071, %1070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1073 = func.call @stack_pop_pointer() : () -> i64
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @cc_cons(%1074, %1073) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1076 = arith.addi %1075, %__rlasp_stack_elide_zero_55 : i64
      %1077 = func.call @stack_pop_pointer() : () -> i64
      %1078 = func.call @cc_cons(%1077, %1076) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1079 = arith.addi %1078, %__rlasp_stack_elide_zero_56 : i64
      %1142 = arith.constant 206494159077380 : i64
      %1143 = arith.constant 0 : i64
      %1144 = func.call @cc_make_closure(%1142, %1143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1145 = arith.addi %1144, %__rlasp_stack_elide_zero_57 : i64
      %1146 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1147 = arith.constant 1 : i64
      %1148 = func.call @cc_make_string(%1146, %1147) : (!llvm.ptr, i64) -> i64
      %1149 = func.call @cc_nil_value() : () -> i64
      %1150 = func.call @cc_intern(%1148, %1149) : (i64, i64) -> i64
      %1151 = func.call @cc_nil_value() : () -> i64
      %1152 = func.call @cc_cons(%1150, %1151) : (i64, i64) -> i64
      %1153 = func.call @cc_values_pack(%1152) : (i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @stack_pop_pointer() : () -> i64
      %1156 = func.call @cc_cons(%1155, %1154) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1157 = arith.addi %1156, %__rlasp_stack_elide_zero_58 : i64
      %1158 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1159 = arith.constant 11 : i64
      %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
      %1161 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1162 = arith.constant 7 : i64
      %1163 = func.call @cc_make_string(%1161, %1162) : (!llvm.ptr, i64) -> i64
      %1164 = func.call @cc_intern(%1160, %1163) : (i64, i64) -> i64
      %1165 = func.call @cc_nil_value() : () -> i64
      %1166 = func.call @cc_cons(%1164, %1165) : (i64, i64) -> i64
      %1167 = func.call @cc_values_pack(%1166) : (i64) -> i64
      %1168 = func.call @cc_nil_value() : () -> i64
      %1169 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1170 = arith.constant 4 : i64
      %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
      %1172 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1173 = arith.constant 7 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = func.call @cc_intern(%1171, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_cons(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_values_pack(%1177) : (i64) -> i64
      %1179 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1180 = arith.constant 6 : i64
      %1181 = func.call @cc_make_string(%1179, %1180) : (!llvm.ptr, i64) -> i64
      %1182 = func.call @cc_nil_value() : () -> i64
      %1183 = func.call @cc_intern(%1181, %1182) : (i64, i64) -> i64
      %1184 = func.call @cc_nil_value() : () -> i64
      %1185 = func.call @cc_cons(%1183, %1184) : (i64, i64) -> i64
      %1186 = func.call @cc_values_pack(%1185) : (i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1187 = arith.addi %1183, %__rlasp_stack_elide_zero_59 : i64
      %1188 = func.call @cc_nil_value() : () -> i64
      %1189 = func.call @cc_errorp(%882) : (i64) -> i64
      %1190 = arith.cmpi ne, %1189, %1188 : i64
      %1191 = arith.cmpi eq, %1188, %1188 : i64
      %1192 = arith.andi %1190, %1191 : i1
      %1193 = scf.if %1192 -> (i64) {
        scf.yield %882 : i64
      } else {
        scf.yield %1188 : i64
      }
      %1194 = func.call @cc_errorp(%1079) : (i64) -> i64
      %1195 = arith.cmpi ne, %1194, %1188 : i64
      %1196 = arith.cmpi eq, %1193, %1188 : i64
      %1197 = arith.andi %1195, %1196 : i1
      %1198 = scf.if %1197 -> (i64) {
        scf.yield %1079 : i64
      } else {
        scf.yield %1193 : i64
      }
      %1199 = func.call @cc_errorp(%1145) : (i64) -> i64
      %1200 = arith.cmpi ne, %1199, %1188 : i64
      %1201 = arith.cmpi eq, %1198, %1188 : i64
      %1202 = arith.andi %1200, %1201 : i1
      %1203 = scf.if %1202 -> (i64) {
        scf.yield %1145 : i64
      } else {
        scf.yield %1198 : i64
      }
      %1204 = func.call @cc_errorp(%1157) : (i64) -> i64
      %1205 = arith.cmpi ne, %1204, %1188 : i64
      %1206 = arith.cmpi eq, %1203, %1188 : i64
      %1207 = arith.andi %1205, %1206 : i1
      %1208 = scf.if %1207 -> (i64) {
        scf.yield %1157 : i64
      } else {
        scf.yield %1203 : i64
      }
      %1209 = func.call @cc_errorp(%1164) : (i64) -> i64
      %1210 = arith.cmpi ne, %1209, %1188 : i64
      %1211 = arith.cmpi eq, %1208, %1188 : i64
      %1212 = arith.andi %1210, %1211 : i1
      %1213 = scf.if %1212 -> (i64) {
        scf.yield %1164 : i64
      } else {
        scf.yield %1208 : i64
      }
      %1214 = func.call @cc_errorp(%1168) : (i64) -> i64
      %1215 = arith.cmpi ne, %1214, %1188 : i64
      %1216 = arith.cmpi eq, %1213, %1188 : i64
      %1217 = arith.andi %1215, %1216 : i1
      %1218 = scf.if %1217 -> (i64) {
        scf.yield %1168 : i64
      } else {
        scf.yield %1213 : i64
      }
      %1219 = func.call @cc_errorp(%1175) : (i64) -> i64
      %1220 = arith.cmpi ne, %1219, %1188 : i64
      %1221 = arith.cmpi eq, %1218, %1188 : i64
      %1222 = arith.andi %1220, %1221 : i1
      %1223 = scf.if %1222 -> (i64) {
        scf.yield %1175 : i64
      } else {
        scf.yield %1218 : i64
      }
      %1224 = func.call @cc_errorp(%1187) : (i64) -> i64
      %1225 = arith.cmpi ne, %1224, %1188 : i64
      %1226 = arith.cmpi eq, %1223, %1188 : i64
      %1227 = arith.andi %1225, %1226 : i1
      %1228 = scf.if %1227 -> (i64) {
        scf.yield %1187 : i64
      } else {
        scf.yield %1223 : i64
      }
      %1229 = arith.cmpi ne, %1228, %1188 : i64
      scf.if %1229 {
        func.call @stack_push_pointer(%1228) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%882) : (i64) -> ()
        func.call @stack_push_pointer(%1079) : (i64) -> ()
        func.call @stack_push_pointer(%1145) : (i64) -> ()
        func.call @stack_push_pointer(%1157) : (i64) -> ()
        func.call @stack_push_pointer(%1164) : (i64) -> ()
        func.call @stack_push_pointer(%1168) : (i64) -> ()
        func.call @stack_push_pointer(%1175) : (i64) -> ()
        func.call @stack_push_pointer(%1187) : (i64) -> ()
        %1230 = llvm.mlir.addressof @str124 : !llvm.ptr
        %1231 = func.call @cc_make_function_ref_const(%1230) : (!llvm.ptr) -> i64
        %1232 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1231, %1232) : (i64, i64) -> ()
      }
      %1233 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1233 : i64
    }
    %1234 = func.call @cc_nil_value() : () -> i64
    %1235 = func.call @cc_errorp(%873) : (i64) -> i64
    %1236 = arith.cmpi ne, %1235, %1234 : i64
    %1237 = scf.if %1236 -> (i64) {
      scf.yield %873 : i64
    } else {
      %1238 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1239 = arith.constant 15 : i64
      %1240 = func.call @cc_make_string(%1238, %1239) : (!llvm.ptr, i64) -> i64
      %1241 = func.call @cc_nil_value() : () -> i64
      %1242 = func.call @cc_intern(%1240, %1241) : (i64, i64) -> i64
      %1243 = func.call @cc_nil_value() : () -> i64
      %1244 = func.call @cc_cons(%1242, %1243) : (i64, i64) -> i64
      %1245 = func.call @cc_values_pack(%1244) : (i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1246 = arith.addi %1242, %__rlasp_stack_elide_zero_60 : i64
      %1247 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1248 = arith.constant 3 : i64
      %1249 = func.call @cc_make_string(%1247, %1248) : (!llvm.ptr, i64) -> i64
      %1250 = func.call @cc_nil_value() : () -> i64
      %1251 = func.call @cc_intern(%1249, %1250) : (i64, i64) -> i64
      %1252 = func.call @cc_nil_value() : () -> i64
      %1253 = func.call @cc_cons(%1251, %1252) : (i64, i64) -> i64
      %1254 = func.call @cc_values_pack(%1253) : (i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1255 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1256 = arith.constant 3 : i64
      %1257 = func.call @cc_make_string(%1255, %1256) : (!llvm.ptr, i64) -> i64
      %1258 = func.call @cc_nil_value() : () -> i64
      %1259 = func.call @cc_intern(%1257, %1258) : (i64, i64) -> i64
      %1260 = func.call @cc_nil_value() : () -> i64
      %1261 = func.call @cc_cons(%1259, %1260) : (i64, i64) -> i64
      %1262 = func.call @cc_values_pack(%1261) : (i64) -> i64
      func.call @stack_push_pointer(%1259) : (i64) -> ()
      %1263 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1264 = arith.constant 19 : i64
      %1265 = func.call @cc_make_string(%1263, %1264) : (!llvm.ptr, i64) -> i64
      %1266 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1267 = arith.constant 11 : i64
      %1268 = func.call @cc_make_string(%1266, %1267) : (!llvm.ptr, i64) -> i64
      %1269 = func.call @cc_intern(%1265, %1268) : (i64, i64) -> i64
      %1270 = func.call @cc_nil_value() : () -> i64
      %1271 = func.call @cc_cons(%1269, %1270) : (i64, i64) -> i64
      %1272 = func.call @cc_values_pack(%1271) : (i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      %1273 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1274 = arith.constant 2 : i64
      %1275 = func.call @cc_make_string(%1273, %1274) : (!llvm.ptr, i64) -> i64
      %1276 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1277 = arith.constant 11 : i64
      %1278 = func.call @cc_make_string(%1276, %1277) : (!llvm.ptr, i64) -> i64
      %1279 = func.call @cc_intern(%1275, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_nil_value() : () -> i64
      %1281 = func.call @cc_cons(%1279, %1280) : (i64, i64) -> i64
      %1282 = func.call @cc_values_pack(%1281) : (i64) -> i64
      func.call @stack_push_pointer(%1279) : (i64) -> ()
      %1283 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1284 = arith.constant 2 : i64
      %1285 = func.call @cc_make_string(%1283, %1284) : (!llvm.ptr, i64) -> i64
      %1286 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1287 = arith.constant 11 : i64
      %1288 = func.call @cc_make_string(%1286, %1287) : (!llvm.ptr, i64) -> i64
      %1289 = func.call @cc_intern(%1285, %1288) : (i64, i64) -> i64
      %1290 = func.call @cc_nil_value() : () -> i64
      %1291 = func.call @cc_cons(%1289, %1290) : (i64, i64) -> i64
      %1292 = func.call @cc_values_pack(%1291) : (i64) -> i64
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1293 = func.call @stack_pop_pointer() : () -> i64
      %1294 = func.call @stack_pop_pointer() : () -> i64
      %1295 = func.call @cc_cons(%1294, %1293) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1296 = arith.addi %1295, %__rlasp_stack_elide_zero_61 : i64
      %1297 = func.call @stack_pop_pointer() : () -> i64
      %1298 = func.call @cc_cons(%1297, %1296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      %1299 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1300 = arith.constant 8 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1303 = arith.constant 11 : i64
      %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
      %1305 = func.call @cc_intern(%1301, %1304) : (i64, i64) -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_cons(%1305, %1306) : (i64, i64) -> i64
      %1308 = func.call @cc_values_pack(%1307) : (i64) -> i64
      func.call @stack_push_pointer(%1305) : (i64) -> ()
      %1309 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1310 = arith.constant 10 : i64
      %1311 = func.call @cc_make_string(%1309, %1310) : (!llvm.ptr, i64) -> i64
      %1312 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1313 = arith.constant 11 : i64
      %1314 = func.call @cc_make_string(%1312, %1313) : (!llvm.ptr, i64) -> i64
      %1315 = func.call @cc_intern(%1311, %1314) : (i64, i64) -> i64
      %1316 = func.call @cc_nil_value() : () -> i64
      %1317 = func.call @cc_cons(%1315, %1316) : (i64, i64) -> i64
      %1318 = func.call @cc_values_pack(%1317) : (i64) -> i64
      func.call @stack_push_pointer(%1315) : (i64) -> ()
      %1319 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1319) : (i64) -> ()
      %1320 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1321 = arith.constant 6 : i64
      %1322 = func.call @cc_make_string(%1320, %1321) : (!llvm.ptr, i64) -> i64
      %1323 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1324 = arith.constant 11 : i64
      %1325 = func.call @cc_make_string(%1323, %1324) : (!llvm.ptr, i64) -> i64
      %1326 = func.call @cc_intern(%1322, %1325) : (i64, i64) -> i64
      %1327 = func.call @cc_nil_value() : () -> i64
      %1328 = func.call @cc_cons(%1326, %1327) : (i64, i64) -> i64
      %1329 = func.call @cc_values_pack(%1328) : (i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1330 = arith.addi %1326, %__rlasp_stack_elide_zero_62 : i64
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = func.call @cc_cons(%1330, %1331) : (i64, i64) -> i64
      %1333 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1334 = arith.constant 5 : i64
      %1335 = func.call @cc_make_string(%1333, %1334) : (!llvm.ptr, i64) -> i64
      %1336 = func.call @cc_nil_value() : () -> i64
      %1337 = func.call @cc_intern(%1335, %1336) : (i64, i64) -> i64
      %1338 = func.call @cc_nil_value() : () -> i64
      %1339 = func.call @cc_cons(%1337, %1338) : (i64, i64) -> i64
      %1340 = func.call @cc_values_pack(%1339) : (i64) -> i64
      %1341 = func.call @cc_cons(%1337, %1332) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1342 = func.call @stack_pop_pointer() : () -> i64
      %1343 = func.call @stack_pop_pointer() : () -> i64
      %1344 = func.call @cc_cons(%1343, %1342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1345 = arith.addi %1344, %__rlasp_stack_elide_zero_63 : i64
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = func.call @cc_cons(%1346, %1345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1347) : (i64) -> ()
      %1348 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      %1349 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1350 = arith.constant 6 : i64
      %1351 = func.call @cc_make_string(%1349, %1350) : (!llvm.ptr, i64) -> i64
      %1352 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1353 = arith.constant 11 : i64
      %1354 = func.call @cc_make_string(%1352, %1353) : (!llvm.ptr, i64) -> i64
      %1355 = func.call @cc_intern(%1351, %1354) : (i64, i64) -> i64
      %1356 = func.call @cc_nil_value() : () -> i64
      %1357 = func.call @cc_cons(%1355, %1356) : (i64, i64) -> i64
      %1358 = func.call @cc_values_pack(%1357) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1359 = arith.addi %1355, %__rlasp_stack_elide_zero_64 : i64
      %1360 = func.call @stack_pop_pointer() : () -> i64
      %1361 = func.call @cc_cons(%1359, %1360) : (i64, i64) -> i64
      %1362 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1363 = arith.constant 5 : i64
      %1364 = func.call @cc_make_string(%1362, %1363) : (!llvm.ptr, i64) -> i64
      %1365 = func.call @cc_nil_value() : () -> i64
      %1366 = func.call @cc_intern(%1364, %1365) : (i64, i64) -> i64
      %1367 = func.call @cc_nil_value() : () -> i64
      %1368 = func.call @cc_cons(%1366, %1367) : (i64, i64) -> i64
      %1369 = func.call @cc_values_pack(%1368) : (i64) -> i64
      %1370 = func.call @cc_cons(%1366, %1361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1370) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1371 = func.call @stack_pop_pointer() : () -> i64
      %1372 = func.call @stack_pop_pointer() : () -> i64
      %1373 = func.call @cc_cons(%1372, %1371) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1374 = arith.addi %1373, %__rlasp_stack_elide_zero_65 : i64
      %1375 = func.call @stack_pop_pointer() : () -> i64
      %1376 = func.call @cc_cons(%1375, %1374) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1377 = arith.addi %1376, %__rlasp_stack_elide_zero_66 : i64
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @cc_cons(%1378, %1377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1379) : (i64) -> ()
      %1380 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1381 = arith.constant 3 : i64
      %1382 = func.call @cc_make_string(%1380, %1381) : (!llvm.ptr, i64) -> i64
      %1383 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1384 = arith.constant 11 : i64
      %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
      %1386 = func.call @cc_intern(%1382, %1385) : (i64, i64) -> i64
      %1387 = func.call @cc_nil_value() : () -> i64
      %1388 = func.call @cc_cons(%1386, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_values_pack(%1388) : (i64) -> i64
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      %1390 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1391 = arith.constant 2 : i64
      %1392 = func.call @cc_make_string(%1390, %1391) : (!llvm.ptr, i64) -> i64
      %1393 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1394 = arith.constant 11 : i64
      %1395 = func.call @cc_make_string(%1393, %1394) : (!llvm.ptr, i64) -> i64
      %1396 = func.call @cc_intern(%1392, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_nil_value() : () -> i64
      %1398 = func.call @cc_cons(%1396, %1397) : (i64, i64) -> i64
      %1399 = func.call @cc_values_pack(%1398) : (i64) -> i64
      func.call @stack_push_pointer(%1396) : (i64) -> ()
      %1400 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1401 = arith.constant 2 : i64
      %1402 = func.call @cc_make_string(%1400, %1401) : (!llvm.ptr, i64) -> i64
      %1403 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1404 = arith.constant 11 : i64
      %1405 = func.call @cc_make_string(%1403, %1404) : (!llvm.ptr, i64) -> i64
      %1406 = func.call @cc_intern(%1402, %1405) : (i64, i64) -> i64
      %1407 = func.call @cc_nil_value() : () -> i64
      %1408 = func.call @cc_cons(%1406, %1407) : (i64, i64) -> i64
      %1409 = func.call @cc_values_pack(%1408) : (i64) -> i64
      func.call @stack_push_pointer(%1406) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = func.call @stack_pop_pointer() : () -> i64
      %1412 = func.call @cc_cons(%1411, %1410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1413 = arith.addi %1412, %__rlasp_stack_elide_zero_67 : i64
      %1414 = func.call @stack_pop_pointer() : () -> i64
      %1415 = func.call @cc_cons(%1414, %1413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1416 = arith.addi %1415, %__rlasp_stack_elide_zero_68 : i64
      %1417 = func.call @stack_pop_pointer() : () -> i64
      %1418 = func.call @cc_cons(%1417, %1416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1419 = func.call @stack_pop_pointer() : () -> i64
      %1420 = func.call @stack_pop_pointer() : () -> i64
      %1421 = func.call @cc_cons(%1420, %1419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1422 = arith.addi %1421, %__rlasp_stack_elide_zero_69 : i64
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = func.call @cc_cons(%1423, %1422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1425 = arith.addi %1424, %__rlasp_stack_elide_zero_70 : i64
      %1426 = func.call @stack_pop_pointer() : () -> i64
      %1427 = func.call @cc_cons(%1426, %1425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1428 = arith.addi %1427, %__rlasp_stack_elide_zero_71 : i64
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @cc_cons(%1429, %1428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1430) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1431 = func.call @stack_pop_pointer() : () -> i64
      %1432 = func.call @stack_pop_pointer() : () -> i64
      %1433 = func.call @cc_cons(%1432, %1431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1434 = arith.addi %1433, %__rlasp_stack_elide_zero_72 : i64
      %1435 = func.call @stack_pop_pointer() : () -> i64
      %1436 = func.call @cc_cons(%1435, %1434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1437 = func.call @stack_pop_pointer() : () -> i64
      %1438 = func.call @stack_pop_pointer() : () -> i64
      %1439 = func.call @cc_cons(%1438, %1437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1440 = arith.addi %1439, %__rlasp_stack_elide_zero_73 : i64
      %1441 = func.call @stack_pop_pointer() : () -> i64
      %1442 = func.call @cc_cons(%1441, %1440) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1443 = arith.addi %1442, %__rlasp_stack_elide_zero_74 : i64
      %1506 = arith.constant 206494159077381 : i64
      %1507 = arith.constant 0 : i64
      %1508 = func.call @cc_make_closure(%1506, %1507) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1509 = arith.addi %1508, %__rlasp_stack_elide_zero_75 : i64
      %1510 = llvm.mlir.addressof @str155 : !llvm.ptr
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
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1521 = arith.addi %1520, %__rlasp_stack_elide_zero_76 : i64
      %1522 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1523 = arith.constant 11 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1526 = arith.constant 7 : i64
      %1527 = func.call @cc_make_string(%1525, %1526) : (!llvm.ptr, i64) -> i64
      %1528 = func.call @cc_intern(%1524, %1527) : (i64, i64) -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_cons(%1528, %1529) : (i64, i64) -> i64
      %1531 = func.call @cc_values_pack(%1530) : (i64) -> i64
      %1532 = func.call @cc_nil_value() : () -> i64
      %1533 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1534 = arith.constant 4 : i64
      %1535 = func.call @cc_make_string(%1533, %1534) : (!llvm.ptr, i64) -> i64
      %1536 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1537 = arith.constant 7 : i64
      %1538 = func.call @cc_make_string(%1536, %1537) : (!llvm.ptr, i64) -> i64
      %1539 = func.call @cc_intern(%1535, %1538) : (i64, i64) -> i64
      %1540 = func.call @cc_nil_value() : () -> i64
      %1541 = func.call @cc_cons(%1539, %1540) : (i64, i64) -> i64
      %1542 = func.call @cc_values_pack(%1541) : (i64) -> i64
      %1543 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1544 = arith.constant 6 : i64
      %1545 = func.call @cc_make_string(%1543, %1544) : (!llvm.ptr, i64) -> i64
      %1546 = func.call @cc_nil_value() : () -> i64
      %1547 = func.call @cc_intern(%1545, %1546) : (i64, i64) -> i64
      %1548 = func.call @cc_nil_value() : () -> i64
      %1549 = func.call @cc_cons(%1547, %1548) : (i64, i64) -> i64
      %1550 = func.call @cc_values_pack(%1549) : (i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1551 = arith.addi %1547, %__rlasp_stack_elide_zero_77 : i64
      %1552 = func.call @cc_nil_value() : () -> i64
      %1553 = func.call @cc_errorp(%1246) : (i64) -> i64
      %1554 = arith.cmpi ne, %1553, %1552 : i64
      %1555 = arith.cmpi eq, %1552, %1552 : i64
      %1556 = arith.andi %1554, %1555 : i1
      %1557 = scf.if %1556 -> (i64) {
        scf.yield %1246 : i64
      } else {
        scf.yield %1552 : i64
      }
      %1558 = func.call @cc_errorp(%1443) : (i64) -> i64
      %1559 = arith.cmpi ne, %1558, %1552 : i64
      %1560 = arith.cmpi eq, %1557, %1552 : i64
      %1561 = arith.andi %1559, %1560 : i1
      %1562 = scf.if %1561 -> (i64) {
        scf.yield %1443 : i64
      } else {
        scf.yield %1557 : i64
      }
      %1563 = func.call @cc_errorp(%1509) : (i64) -> i64
      %1564 = arith.cmpi ne, %1563, %1552 : i64
      %1565 = arith.cmpi eq, %1562, %1552 : i64
      %1566 = arith.andi %1564, %1565 : i1
      %1567 = scf.if %1566 -> (i64) {
        scf.yield %1509 : i64
      } else {
        scf.yield %1562 : i64
      }
      %1568 = func.call @cc_errorp(%1521) : (i64) -> i64
      %1569 = arith.cmpi ne, %1568, %1552 : i64
      %1570 = arith.cmpi eq, %1567, %1552 : i64
      %1571 = arith.andi %1569, %1570 : i1
      %1572 = scf.if %1571 -> (i64) {
        scf.yield %1521 : i64
      } else {
        scf.yield %1567 : i64
      }
      %1573 = func.call @cc_errorp(%1528) : (i64) -> i64
      %1574 = arith.cmpi ne, %1573, %1552 : i64
      %1575 = arith.cmpi eq, %1572, %1552 : i64
      %1576 = arith.andi %1574, %1575 : i1
      %1577 = scf.if %1576 -> (i64) {
        scf.yield %1528 : i64
      } else {
        scf.yield %1572 : i64
      }
      %1578 = func.call @cc_errorp(%1532) : (i64) -> i64
      %1579 = arith.cmpi ne, %1578, %1552 : i64
      %1580 = arith.cmpi eq, %1577, %1552 : i64
      %1581 = arith.andi %1579, %1580 : i1
      %1582 = scf.if %1581 -> (i64) {
        scf.yield %1532 : i64
      } else {
        scf.yield %1577 : i64
      }
      %1583 = func.call @cc_errorp(%1539) : (i64) -> i64
      %1584 = arith.cmpi ne, %1583, %1552 : i64
      %1585 = arith.cmpi eq, %1582, %1552 : i64
      %1586 = arith.andi %1584, %1585 : i1
      %1587 = scf.if %1586 -> (i64) {
        scf.yield %1539 : i64
      } else {
        scf.yield %1582 : i64
      }
      %1588 = func.call @cc_errorp(%1551) : (i64) -> i64
      %1589 = arith.cmpi ne, %1588, %1552 : i64
      %1590 = arith.cmpi eq, %1587, %1552 : i64
      %1591 = arith.andi %1589, %1590 : i1
      %1592 = scf.if %1591 -> (i64) {
        scf.yield %1551 : i64
      } else {
        scf.yield %1587 : i64
      }
      %1593 = arith.cmpi ne, %1592, %1552 : i64
      scf.if %1593 {
        func.call @stack_push_pointer(%1592) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1246) : (i64) -> ()
        func.call @stack_push_pointer(%1443) : (i64) -> ()
        func.call @stack_push_pointer(%1509) : (i64) -> ()
        func.call @stack_push_pointer(%1521) : (i64) -> ()
        func.call @stack_push_pointer(%1528) : (i64) -> ()
        func.call @stack_push_pointer(%1532) : (i64) -> ()
        func.call @stack_push_pointer(%1539) : (i64) -> ()
        func.call @stack_push_pointer(%1551) : (i64) -> ()
        %1594 = llvm.mlir.addressof @str161 : !llvm.ptr
        %1595 = func.call @cc_make_function_ref_const(%1594) : (!llvm.ptr) -> i64
        %1596 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1595, %1596) : (i64, i64) -> ()
      }
      %1597 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1597 : i64
    }
    %1598 = func.call @cc_nil_value() : () -> i64
    %1599 = func.call @cc_errorp(%1237) : (i64) -> i64
    %1600 = arith.cmpi ne, %1599, %1598 : i64
    %1601 = scf.if %1600 -> (i64) {
      scf.yield %1237 : i64
    } else {
      %1602 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1603 = arith.constant 15 : i64
      %1604 = func.call @cc_make_string(%1602, %1603) : (!llvm.ptr, i64) -> i64
      %1605 = func.call @cc_nil_value() : () -> i64
      %1606 = func.call @cc_intern(%1604, %1605) : (i64, i64) -> i64
      %1607 = func.call @cc_nil_value() : () -> i64
      %1608 = func.call @cc_cons(%1606, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_values_pack(%1608) : (i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1610 = arith.addi %1606, %__rlasp_stack_elide_zero_78 : i64
      %1611 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1612 = arith.constant 3 : i64
      %1613 = func.call @cc_make_string(%1611, %1612) : (!llvm.ptr, i64) -> i64
      %1614 = func.call @cc_nil_value() : () -> i64
      %1615 = func.call @cc_intern(%1613, %1614) : (i64, i64) -> i64
      %1616 = func.call @cc_nil_value() : () -> i64
      %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
      func.call @stack_push_pointer(%1615) : (i64) -> ()
      %1619 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1620 = arith.constant 3 : i64
      %1621 = func.call @cc_make_string(%1619, %1620) : (!llvm.ptr, i64) -> i64
      %1622 = func.call @cc_nil_value() : () -> i64
      %1623 = func.call @cc_intern(%1621, %1622) : (i64, i64) -> i64
      %1624 = func.call @cc_nil_value() : () -> i64
      %1625 = func.call @cc_cons(%1623, %1624) : (i64, i64) -> i64
      %1626 = func.call @cc_values_pack(%1625) : (i64) -> i64
      func.call @stack_push_pointer(%1623) : (i64) -> ()
      %1627 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1628 = arith.constant 19 : i64
      %1629 = func.call @cc_make_string(%1627, %1628) : (!llvm.ptr, i64) -> i64
      %1630 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1631 = arith.constant 11 : i64
      %1632 = func.call @cc_make_string(%1630, %1631) : (!llvm.ptr, i64) -> i64
      %1633 = func.call @cc_intern(%1629, %1632) : (i64, i64) -> i64
      %1634 = func.call @cc_nil_value() : () -> i64
      %1635 = func.call @cc_cons(%1633, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_values_pack(%1635) : (i64) -> i64
      func.call @stack_push_pointer(%1633) : (i64) -> ()
      %1637 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1638 = arith.constant 2 : i64
      %1639 = func.call @cc_make_string(%1637, %1638) : (!llvm.ptr, i64) -> i64
      %1640 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1641 = arith.constant 11 : i64
      %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
      %1643 = func.call @cc_intern(%1639, %1642) : (i64, i64) -> i64
      %1644 = func.call @cc_nil_value() : () -> i64
      %1645 = func.call @cc_cons(%1643, %1644) : (i64, i64) -> i64
      %1646 = func.call @cc_values_pack(%1645) : (i64) -> i64
      func.call @stack_push_pointer(%1643) : (i64) -> ()
      %1647 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1648 = arith.constant 2 : i64
      %1649 = func.call @cc_make_string(%1647, %1648) : (!llvm.ptr, i64) -> i64
      %1650 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1651 = arith.constant 11 : i64
      %1652 = func.call @cc_make_string(%1650, %1651) : (!llvm.ptr, i64) -> i64
      %1653 = func.call @cc_intern(%1649, %1652) : (i64, i64) -> i64
      %1654 = func.call @cc_nil_value() : () -> i64
      %1655 = func.call @cc_cons(%1653, %1654) : (i64, i64) -> i64
      %1656 = func.call @cc_values_pack(%1655) : (i64) -> i64
      func.call @stack_push_pointer(%1653) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @stack_pop_pointer() : () -> i64
      %1659 = func.call @cc_cons(%1658, %1657) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1660 = arith.addi %1659, %__rlasp_stack_elide_zero_79 : i64
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = func.call @cc_cons(%1661, %1660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      %1663 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1664 = arith.constant 8 : i64
      %1665 = func.call @cc_make_string(%1663, %1664) : (!llvm.ptr, i64) -> i64
      %1666 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1667 = arith.constant 11 : i64
      %1668 = func.call @cc_make_string(%1666, %1667) : (!llvm.ptr, i64) -> i64
      %1669 = func.call @cc_intern(%1665, %1668) : (i64, i64) -> i64
      %1670 = func.call @cc_nil_value() : () -> i64
      %1671 = func.call @cc_cons(%1669, %1670) : (i64, i64) -> i64
      %1672 = func.call @cc_values_pack(%1671) : (i64) -> i64
      func.call @stack_push_pointer(%1669) : (i64) -> ()
      %1673 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1673) : (i64) -> ()
      %1674 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1675 = arith.constant 10 : i64
      %1676 = func.call @cc_make_string(%1674, %1675) : (!llvm.ptr, i64) -> i64
      %1677 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1678 = arith.constant 11 : i64
      %1679 = func.call @cc_make_string(%1677, %1678) : (!llvm.ptr, i64) -> i64
      %1680 = func.call @cc_intern(%1676, %1679) : (i64, i64) -> i64
      %1681 = func.call @cc_nil_value() : () -> i64
      %1682 = func.call @cc_cons(%1680, %1681) : (i64, i64) -> i64
      %1683 = func.call @cc_values_pack(%1682) : (i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1684 = arith.addi %1680, %__rlasp_stack_elide_zero_80 : i64
      %1685 = func.call @stack_pop_pointer() : () -> i64
      %1686 = func.call @cc_cons(%1684, %1685) : (i64, i64) -> i64
      %1687 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1688 = arith.constant 5 : i64
      %1689 = func.call @cc_make_string(%1687, %1688) : (!llvm.ptr, i64) -> i64
      %1690 = func.call @cc_nil_value() : () -> i64
      %1691 = func.call @cc_intern(%1689, %1690) : (i64, i64) -> i64
      %1692 = func.call @cc_nil_value() : () -> i64
      %1693 = func.call @cc_cons(%1691, %1692) : (i64, i64) -> i64
      %1694 = func.call @cc_values_pack(%1693) : (i64) -> i64
      %1695 = func.call @cc_cons(%1691, %1686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1695) : (i64) -> ()
      %1696 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1697 = arith.constant 10 : i64
      %1698 = func.call @cc_make_string(%1696, %1697) : (!llvm.ptr, i64) -> i64
      %1699 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1700 = arith.constant 11 : i64
      %1701 = func.call @cc_make_string(%1699, %1700) : (!llvm.ptr, i64) -> i64
      %1702 = func.call @cc_intern(%1698, %1701) : (i64, i64) -> i64
      %1703 = func.call @cc_nil_value() : () -> i64
      %1704 = func.call @cc_cons(%1702, %1703) : (i64, i64) -> i64
      %1705 = func.call @cc_values_pack(%1704) : (i64) -> i64
      func.call @stack_push_pointer(%1702) : (i64) -> ()
      %1706 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      %1707 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1708 = arith.constant 10 : i64
      %1709 = func.call @cc_make_string(%1707, %1708) : (!llvm.ptr, i64) -> i64
      %1710 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1711 = arith.constant 11 : i64
      %1712 = func.call @cc_make_string(%1710, %1711) : (!llvm.ptr, i64) -> i64
      %1713 = func.call @cc_intern(%1709, %1712) : (i64, i64) -> i64
      %1714 = func.call @cc_nil_value() : () -> i64
      %1715 = func.call @cc_cons(%1713, %1714) : (i64, i64) -> i64
      %1716 = func.call @cc_values_pack(%1715) : (i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1717 = arith.addi %1713, %__rlasp_stack_elide_zero_81 : i64
      %1718 = func.call @stack_pop_pointer() : () -> i64
      %1719 = func.call @cc_cons(%1717, %1718) : (i64, i64) -> i64
      %1720 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1721 = arith.constant 5 : i64
      %1722 = func.call @cc_make_string(%1720, %1721) : (!llvm.ptr, i64) -> i64
      %1723 = func.call @cc_nil_value() : () -> i64
      %1724 = func.call @cc_intern(%1722, %1723) : (i64, i64) -> i64
      %1725 = func.call @cc_nil_value() : () -> i64
      %1726 = func.call @cc_cons(%1724, %1725) : (i64, i64) -> i64
      %1727 = func.call @cc_values_pack(%1726) : (i64) -> i64
      %1728 = func.call @cc_cons(%1724, %1719) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1728) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1729 = func.call @stack_pop_pointer() : () -> i64
      %1730 = func.call @stack_pop_pointer() : () -> i64
      %1731 = func.call @cc_cons(%1730, %1729) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1732 = arith.addi %1731, %__rlasp_stack_elide_zero_82 : i64
      %1733 = func.call @stack_pop_pointer() : () -> i64
      %1734 = func.call @cc_cons(%1733, %1732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1734) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1735 = func.call @stack_pop_pointer() : () -> i64
      %1736 = func.call @stack_pop_pointer() : () -> i64
      %1737 = func.call @cc_cons(%1736, %1735) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1738 = arith.addi %1737, %__rlasp_stack_elide_zero_83 : i64
      %1739 = func.call @stack_pop_pointer() : () -> i64
      %1740 = func.call @cc_cons(%1739, %1738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1741 = arith.addi %1740, %__rlasp_stack_elide_zero_84 : i64
      %1742 = func.call @stack_pop_pointer() : () -> i64
      %1743 = func.call @cc_cons(%1742, %1741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1743) : (i64) -> ()
      %1744 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1745 = arith.constant 3 : i64
      %1746 = func.call @cc_make_string(%1744, %1745) : (!llvm.ptr, i64) -> i64
      %1747 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1748 = arith.constant 11 : i64
      %1749 = func.call @cc_make_string(%1747, %1748) : (!llvm.ptr, i64) -> i64
      %1750 = func.call @cc_intern(%1746, %1749) : (i64, i64) -> i64
      %1751 = func.call @cc_nil_value() : () -> i64
      %1752 = func.call @cc_cons(%1750, %1751) : (i64, i64) -> i64
      %1753 = func.call @cc_values_pack(%1752) : (i64) -> i64
      func.call @stack_push_pointer(%1750) : (i64) -> ()
      %1754 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1755 = arith.constant 2 : i64
      %1756 = func.call @cc_make_string(%1754, %1755) : (!llvm.ptr, i64) -> i64
      %1757 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1758 = arith.constant 11 : i64
      %1759 = func.call @cc_make_string(%1757, %1758) : (!llvm.ptr, i64) -> i64
      %1760 = func.call @cc_intern(%1756, %1759) : (i64, i64) -> i64
      %1761 = func.call @cc_nil_value() : () -> i64
      %1762 = func.call @cc_cons(%1760, %1761) : (i64, i64) -> i64
      %1763 = func.call @cc_values_pack(%1762) : (i64) -> i64
      func.call @stack_push_pointer(%1760) : (i64) -> ()
      %1764 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1765 = arith.constant 2 : i64
      %1766 = func.call @cc_make_string(%1764, %1765) : (!llvm.ptr, i64) -> i64
      %1767 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1768 = arith.constant 11 : i64
      %1769 = func.call @cc_make_string(%1767, %1768) : (!llvm.ptr, i64) -> i64
      %1770 = func.call @cc_intern(%1766, %1769) : (i64, i64) -> i64
      %1771 = func.call @cc_nil_value() : () -> i64
      %1772 = func.call @cc_cons(%1770, %1771) : (i64, i64) -> i64
      %1773 = func.call @cc_values_pack(%1772) : (i64) -> i64
      func.call @stack_push_pointer(%1770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = func.call @stack_pop_pointer() : () -> i64
      %1776 = func.call @cc_cons(%1775, %1774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1777 = arith.addi %1776, %__rlasp_stack_elide_zero_85 : i64
      %1778 = func.call @stack_pop_pointer() : () -> i64
      %1779 = func.call @cc_cons(%1778, %1777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1780 = arith.addi %1779, %__rlasp_stack_elide_zero_86 : i64
      %1781 = func.call @stack_pop_pointer() : () -> i64
      %1782 = func.call @cc_cons(%1781, %1780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1782) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1783 = func.call @stack_pop_pointer() : () -> i64
      %1784 = func.call @stack_pop_pointer() : () -> i64
      %1785 = func.call @cc_cons(%1784, %1783) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1786 = arith.addi %1785, %__rlasp_stack_elide_zero_87 : i64
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = func.call @cc_cons(%1787, %1786) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1789 = arith.addi %1788, %__rlasp_stack_elide_zero_88 : i64
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @cc_cons(%1790, %1789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1792 = arith.addi %1791, %__rlasp_stack_elide_zero_89 : i64
      %1793 = func.call @stack_pop_pointer() : () -> i64
      %1794 = func.call @cc_cons(%1793, %1792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1794) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @stack_pop_pointer() : () -> i64
      %1797 = func.call @cc_cons(%1796, %1795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1798 = arith.addi %1797, %__rlasp_stack_elide_zero_90 : i64
      %1799 = func.call @stack_pop_pointer() : () -> i64
      %1800 = func.call @cc_cons(%1799, %1798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1800) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1801 = func.call @stack_pop_pointer() : () -> i64
      %1802 = func.call @stack_pop_pointer() : () -> i64
      %1803 = func.call @cc_cons(%1802, %1801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1804 = arith.addi %1803, %__rlasp_stack_elide_zero_91 : i64
      %1805 = func.call @stack_pop_pointer() : () -> i64
      %1806 = func.call @cc_cons(%1805, %1804) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1807 = arith.addi %1806, %__rlasp_stack_elide_zero_92 : i64
      %1870 = arith.constant 206494159077382 : i64
      %1871 = arith.constant 0 : i64
      %1872 = func.call @cc_make_closure(%1870, %1871) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1873 = arith.addi %1872, %__rlasp_stack_elide_zero_93 : i64
      %1874 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1875 = arith.constant 1 : i64
      %1876 = func.call @cc_make_string(%1874, %1875) : (!llvm.ptr, i64) -> i64
      %1877 = func.call @cc_nil_value() : () -> i64
      %1878 = func.call @cc_intern(%1876, %1877) : (i64, i64) -> i64
      %1879 = func.call @cc_nil_value() : () -> i64
      %1880 = func.call @cc_cons(%1878, %1879) : (i64, i64) -> i64
      %1881 = func.call @cc_values_pack(%1880) : (i64) -> i64
      func.call @stack_push_pointer(%1878) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1882 = func.call @stack_pop_pointer() : () -> i64
      %1883 = func.call @stack_pop_pointer() : () -> i64
      %1884 = func.call @cc_cons(%1883, %1882) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1885 = arith.addi %1884, %__rlasp_stack_elide_zero_94 : i64
      %1886 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1887 = arith.constant 11 : i64
      %1888 = func.call @cc_make_string(%1886, %1887) : (!llvm.ptr, i64) -> i64
      %1889 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1890 = arith.constant 7 : i64
      %1891 = func.call @cc_make_string(%1889, %1890) : (!llvm.ptr, i64) -> i64
      %1892 = func.call @cc_intern(%1888, %1891) : (i64, i64) -> i64
      %1893 = func.call @cc_nil_value() : () -> i64
      %1894 = func.call @cc_cons(%1892, %1893) : (i64, i64) -> i64
      %1895 = func.call @cc_values_pack(%1894) : (i64) -> i64
      %1896 = func.call @cc_nil_value() : () -> i64
      %1897 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1898 = arith.constant 4 : i64
      %1899 = func.call @cc_make_string(%1897, %1898) : (!llvm.ptr, i64) -> i64
      %1900 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1901 = arith.constant 7 : i64
      %1902 = func.call @cc_make_string(%1900, %1901) : (!llvm.ptr, i64) -> i64
      %1903 = func.call @cc_intern(%1899, %1902) : (i64, i64) -> i64
      %1904 = func.call @cc_nil_value() : () -> i64
      %1905 = func.call @cc_cons(%1903, %1904) : (i64, i64) -> i64
      %1906 = func.call @cc_values_pack(%1905) : (i64) -> i64
      %1907 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1908 = arith.constant 6 : i64
      %1909 = func.call @cc_make_string(%1907, %1908) : (!llvm.ptr, i64) -> i64
      %1910 = func.call @cc_nil_value() : () -> i64
      %1911 = func.call @cc_intern(%1909, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_nil_value() : () -> i64
      %1913 = func.call @cc_cons(%1911, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_values_pack(%1913) : (i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1915 = arith.addi %1911, %__rlasp_stack_elide_zero_95 : i64
      %1916 = func.call @cc_nil_value() : () -> i64
      %1917 = func.call @cc_errorp(%1610) : (i64) -> i64
      %1918 = arith.cmpi ne, %1917, %1916 : i64
      %1919 = arith.cmpi eq, %1916, %1916 : i64
      %1920 = arith.andi %1918, %1919 : i1
      %1921 = scf.if %1920 -> (i64) {
        scf.yield %1610 : i64
      } else {
        scf.yield %1916 : i64
      }
      %1922 = func.call @cc_errorp(%1807) : (i64) -> i64
      %1923 = arith.cmpi ne, %1922, %1916 : i64
      %1924 = arith.cmpi eq, %1921, %1916 : i64
      %1925 = arith.andi %1923, %1924 : i1
      %1926 = scf.if %1925 -> (i64) {
        scf.yield %1807 : i64
      } else {
        scf.yield %1921 : i64
      }
      %1927 = func.call @cc_errorp(%1873) : (i64) -> i64
      %1928 = arith.cmpi ne, %1927, %1916 : i64
      %1929 = arith.cmpi eq, %1926, %1916 : i64
      %1930 = arith.andi %1928, %1929 : i1
      %1931 = scf.if %1930 -> (i64) {
        scf.yield %1873 : i64
      } else {
        scf.yield %1926 : i64
      }
      %1932 = func.call @cc_errorp(%1885) : (i64) -> i64
      %1933 = arith.cmpi ne, %1932, %1916 : i64
      %1934 = arith.cmpi eq, %1931, %1916 : i64
      %1935 = arith.andi %1933, %1934 : i1
      %1936 = scf.if %1935 -> (i64) {
        scf.yield %1885 : i64
      } else {
        scf.yield %1931 : i64
      }
      %1937 = func.call @cc_errorp(%1892) : (i64) -> i64
      %1938 = arith.cmpi ne, %1937, %1916 : i64
      %1939 = arith.cmpi eq, %1936, %1916 : i64
      %1940 = arith.andi %1938, %1939 : i1
      %1941 = scf.if %1940 -> (i64) {
        scf.yield %1892 : i64
      } else {
        scf.yield %1936 : i64
      }
      %1942 = func.call @cc_errorp(%1896) : (i64) -> i64
      %1943 = arith.cmpi ne, %1942, %1916 : i64
      %1944 = arith.cmpi eq, %1941, %1916 : i64
      %1945 = arith.andi %1943, %1944 : i1
      %1946 = scf.if %1945 -> (i64) {
        scf.yield %1896 : i64
      } else {
        scf.yield %1941 : i64
      }
      %1947 = func.call @cc_errorp(%1903) : (i64) -> i64
      %1948 = arith.cmpi ne, %1947, %1916 : i64
      %1949 = arith.cmpi eq, %1946, %1916 : i64
      %1950 = arith.andi %1948, %1949 : i1
      %1951 = scf.if %1950 -> (i64) {
        scf.yield %1903 : i64
      } else {
        scf.yield %1946 : i64
      }
      %1952 = func.call @cc_errorp(%1915) : (i64) -> i64
      %1953 = arith.cmpi ne, %1952, %1916 : i64
      %1954 = arith.cmpi eq, %1951, %1916 : i64
      %1955 = arith.andi %1953, %1954 : i1
      %1956 = scf.if %1955 -> (i64) {
        scf.yield %1915 : i64
      } else {
        scf.yield %1951 : i64
      }
      %1957 = arith.cmpi ne, %1956, %1916 : i64
      scf.if %1957 {
        func.call @stack_push_pointer(%1956) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1610) : (i64) -> ()
        func.call @stack_push_pointer(%1807) : (i64) -> ()
        func.call @stack_push_pointer(%1873) : (i64) -> ()
        func.call @stack_push_pointer(%1885) : (i64) -> ()
        func.call @stack_push_pointer(%1892) : (i64) -> ()
        func.call @stack_push_pointer(%1896) : (i64) -> ()
        func.call @stack_push_pointer(%1903) : (i64) -> ()
        func.call @stack_push_pointer(%1915) : (i64) -> ()
        %1958 = llvm.mlir.addressof @str198 : !llvm.ptr
        %1959 = func.call @cc_make_function_ref_const(%1958) : (!llvm.ptr) -> i64
        %1960 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1959, %1960) : (i64, i64) -> ()
      }
      %1961 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1961 : i64
    }
    %1962 = func.call @cc_nil_value() : () -> i64
    %1963 = func.call @cc_errorp(%1601) : (i64) -> i64
    %1964 = arith.cmpi ne, %1963, %1962 : i64
    %1965 = scf.if %1964 -> (i64) {
      scf.yield %1601 : i64
    } else {
      %1966 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1967 = arith.constant 15 : i64
      %1968 = func.call @cc_make_string(%1966, %1967) : (!llvm.ptr, i64) -> i64
      %1969 = func.call @cc_nil_value() : () -> i64
      %1970 = func.call @cc_intern(%1968, %1969) : (i64, i64) -> i64
      %1971 = func.call @cc_nil_value() : () -> i64
      %1972 = func.call @cc_cons(%1970, %1971) : (i64, i64) -> i64
      %1973 = func.call @cc_values_pack(%1972) : (i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1974 = arith.addi %1970, %__rlasp_stack_elide_zero_96 : i64
      %1975 = llvm.mlir.addressof @str200 : !llvm.ptr
      %1976 = arith.constant 3 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      %1978 = func.call @cc_nil_value() : () -> i64
      %1979 = func.call @cc_intern(%1977, %1978) : (i64, i64) -> i64
      %1980 = func.call @cc_nil_value() : () -> i64
      %1981 = func.call @cc_cons(%1979, %1980) : (i64, i64) -> i64
      %1982 = func.call @cc_values_pack(%1981) : (i64) -> i64
      func.call @stack_push_pointer(%1979) : (i64) -> ()
      %1983 = llvm.mlir.addressof @str201 : !llvm.ptr
      %1984 = arith.constant 3 : i64
      %1985 = func.call @cc_make_string(%1983, %1984) : (!llvm.ptr, i64) -> i64
      %1986 = func.call @cc_nil_value() : () -> i64
      %1987 = func.call @cc_intern(%1985, %1986) : (i64, i64) -> i64
      %1988 = func.call @cc_nil_value() : () -> i64
      %1989 = func.call @cc_cons(%1987, %1988) : (i64, i64) -> i64
      %1990 = func.call @cc_values_pack(%1989) : (i64) -> i64
      func.call @stack_push_pointer(%1987) : (i64) -> ()
      %1991 = llvm.mlir.addressof @str202 : !llvm.ptr
      %1992 = arith.constant 19 : i64
      %1993 = func.call @cc_make_string(%1991, %1992) : (!llvm.ptr, i64) -> i64
      %1994 = llvm.mlir.addressof @str203 : !llvm.ptr
      %1995 = arith.constant 11 : i64
      %1996 = func.call @cc_make_string(%1994, %1995) : (!llvm.ptr, i64) -> i64
      %1997 = func.call @cc_intern(%1993, %1996) : (i64, i64) -> i64
      %1998 = func.call @cc_nil_value() : () -> i64
      %1999 = func.call @cc_cons(%1997, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_values_pack(%1999) : (i64) -> i64
      func.call @stack_push_pointer(%1997) : (i64) -> ()
      %2001 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2002 = arith.constant 2 : i64
      %2003 = func.call @cc_make_string(%2001, %2002) : (!llvm.ptr, i64) -> i64
      %2004 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2005 = arith.constant 11 : i64
      %2006 = func.call @cc_make_string(%2004, %2005) : (!llvm.ptr, i64) -> i64
      %2007 = func.call @cc_intern(%2003, %2006) : (i64, i64) -> i64
      %2008 = func.call @cc_nil_value() : () -> i64
      %2009 = func.call @cc_cons(%2007, %2008) : (i64, i64) -> i64
      %2010 = func.call @cc_values_pack(%2009) : (i64) -> i64
      func.call @stack_push_pointer(%2007) : (i64) -> ()
      %2011 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2012 = arith.constant 2 : i64
      %2013 = func.call @cc_make_string(%2011, %2012) : (!llvm.ptr, i64) -> i64
      %2014 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2015 = arith.constant 11 : i64
      %2016 = func.call @cc_make_string(%2014, %2015) : (!llvm.ptr, i64) -> i64
      %2017 = func.call @cc_intern(%2013, %2016) : (i64, i64) -> i64
      %2018 = func.call @cc_nil_value() : () -> i64
      %2019 = func.call @cc_cons(%2017, %2018) : (i64, i64) -> i64
      %2020 = func.call @cc_values_pack(%2019) : (i64) -> i64
      func.call @stack_push_pointer(%2017) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2021 = func.call @stack_pop_pointer() : () -> i64
      %2022 = func.call @stack_pop_pointer() : () -> i64
      %2023 = func.call @cc_cons(%2022, %2021) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2024 = arith.addi %2023, %__rlasp_stack_elide_zero_97 : i64
      %2025 = func.call @stack_pop_pointer() : () -> i64
      %2026 = func.call @cc_cons(%2025, %2024) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2026) : (i64) -> ()
      %2027 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2028 = arith.constant 8 : i64
      %2029 = func.call @cc_make_string(%2027, %2028) : (!llvm.ptr, i64) -> i64
      %2030 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2031 = arith.constant 11 : i64
      %2032 = func.call @cc_make_string(%2030, %2031) : (!llvm.ptr, i64) -> i64
      %2033 = func.call @cc_intern(%2029, %2032) : (i64, i64) -> i64
      %2034 = func.call @cc_nil_value() : () -> i64
      %2035 = func.call @cc_cons(%2033, %2034) : (i64, i64) -> i64
      %2036 = func.call @cc_values_pack(%2035) : (i64) -> i64
      func.call @stack_push_pointer(%2033) : (i64) -> ()
      %2037 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2038 = arith.constant 10 : i64
      %2039 = func.call @cc_make_string(%2037, %2038) : (!llvm.ptr, i64) -> i64
      %2040 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2041 = arith.constant 11 : i64
      %2042 = func.call @cc_make_string(%2040, %2041) : (!llvm.ptr, i64) -> i64
      %2043 = func.call @cc_intern(%2039, %2042) : (i64, i64) -> i64
      %2044 = func.call @cc_nil_value() : () -> i64
      %2045 = func.call @cc_cons(%2043, %2044) : (i64, i64) -> i64
      %2046 = func.call @cc_values_pack(%2045) : (i64) -> i64
      func.call @stack_push_pointer(%2043) : (i64) -> ()
      %2047 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2047) : (i64) -> ()
      %2048 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2049 = arith.constant 10 : i64
      %2050 = func.call @cc_make_string(%2048, %2049) : (!llvm.ptr, i64) -> i64
      %2051 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2052 = arith.constant 11 : i64
      %2053 = func.call @cc_make_string(%2051, %2052) : (!llvm.ptr, i64) -> i64
      %2054 = func.call @cc_intern(%2050, %2053) : (i64, i64) -> i64
      %2055 = func.call @cc_nil_value() : () -> i64
      %2056 = func.call @cc_cons(%2054, %2055) : (i64, i64) -> i64
      %2057 = func.call @cc_values_pack(%2056) : (i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2058 = arith.addi %2054, %__rlasp_stack_elide_zero_98 : i64
      %2059 = func.call @stack_pop_pointer() : () -> i64
      %2060 = func.call @cc_cons(%2058, %2059) : (i64, i64) -> i64
      %2061 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2062 = arith.constant 5 : i64
      %2063 = func.call @cc_make_string(%2061, %2062) : (!llvm.ptr, i64) -> i64
      %2064 = func.call @cc_nil_value() : () -> i64
      %2065 = func.call @cc_intern(%2063, %2064) : (i64, i64) -> i64
      %2066 = func.call @cc_nil_value() : () -> i64
      %2067 = func.call @cc_cons(%2065, %2066) : (i64, i64) -> i64
      %2068 = func.call @cc_values_pack(%2067) : (i64) -> i64
      %2069 = func.call @cc_cons(%2065, %2060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2069) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @stack_pop_pointer() : () -> i64
      %2072 = func.call @cc_cons(%2071, %2070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2073 = arith.addi %2072, %__rlasp_stack_elide_zero_99 : i64
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @cc_cons(%2074, %2073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2076 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2076) : (i64) -> ()
      %2077 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2078 = arith.constant 10 : i64
      %2079 = func.call @cc_make_string(%2077, %2078) : (!llvm.ptr, i64) -> i64
      %2080 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2081 = arith.constant 11 : i64
      %2082 = func.call @cc_make_string(%2080, %2081) : (!llvm.ptr, i64) -> i64
      %2083 = func.call @cc_intern(%2079, %2082) : (i64, i64) -> i64
      %2084 = func.call @cc_nil_value() : () -> i64
      %2085 = func.call @cc_cons(%2083, %2084) : (i64, i64) -> i64
      %2086 = func.call @cc_values_pack(%2085) : (i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2087 = arith.addi %2083, %__rlasp_stack_elide_zero_100 : i64
      %2088 = func.call @stack_pop_pointer() : () -> i64
      %2089 = func.call @cc_cons(%2087, %2088) : (i64, i64) -> i64
      %2090 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2091 = arith.constant 5 : i64
      %2092 = func.call @cc_make_string(%2090, %2091) : (!llvm.ptr, i64) -> i64
      %2093 = func.call @cc_nil_value() : () -> i64
      %2094 = func.call @cc_intern(%2092, %2093) : (i64, i64) -> i64
      %2095 = func.call @cc_nil_value() : () -> i64
      %2096 = func.call @cc_cons(%2094, %2095) : (i64, i64) -> i64
      %2097 = func.call @cc_values_pack(%2096) : (i64) -> i64
      %2098 = func.call @cc_cons(%2094, %2089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2098) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2099 = func.call @stack_pop_pointer() : () -> i64
      %2100 = func.call @stack_pop_pointer() : () -> i64
      %2101 = func.call @cc_cons(%2100, %2099) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2102 = arith.addi %2101, %__rlasp_stack_elide_zero_101 : i64
      %2103 = func.call @stack_pop_pointer() : () -> i64
      %2104 = func.call @cc_cons(%2103, %2102) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2105 = arith.addi %2104, %__rlasp_stack_elide_zero_102 : i64
      %2106 = func.call @stack_pop_pointer() : () -> i64
      %2107 = func.call @cc_cons(%2106, %2105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2107) : (i64) -> ()
      %2108 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2109 = arith.constant 3 : i64
      %2110 = func.call @cc_make_string(%2108, %2109) : (!llvm.ptr, i64) -> i64
      %2111 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2112 = arith.constant 11 : i64
      %2113 = func.call @cc_make_string(%2111, %2112) : (!llvm.ptr, i64) -> i64
      %2114 = func.call @cc_intern(%2110, %2113) : (i64, i64) -> i64
      %2115 = func.call @cc_nil_value() : () -> i64
      %2116 = func.call @cc_cons(%2114, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_values_pack(%2116) : (i64) -> i64
      func.call @stack_push_pointer(%2114) : (i64) -> ()
      %2118 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2119 = arith.constant 2 : i64
      %2120 = func.call @cc_make_string(%2118, %2119) : (!llvm.ptr, i64) -> i64
      %2121 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2122 = arith.constant 11 : i64
      %2123 = func.call @cc_make_string(%2121, %2122) : (!llvm.ptr, i64) -> i64
      %2124 = func.call @cc_intern(%2120, %2123) : (i64, i64) -> i64
      %2125 = func.call @cc_nil_value() : () -> i64
      %2126 = func.call @cc_cons(%2124, %2125) : (i64, i64) -> i64
      %2127 = func.call @cc_values_pack(%2126) : (i64) -> i64
      func.call @stack_push_pointer(%2124) : (i64) -> ()
      %2128 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2129 = arith.constant 2 : i64
      %2130 = func.call @cc_make_string(%2128, %2129) : (!llvm.ptr, i64) -> i64
      %2131 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2132 = arith.constant 11 : i64
      %2133 = func.call @cc_make_string(%2131, %2132) : (!llvm.ptr, i64) -> i64
      %2134 = func.call @cc_intern(%2130, %2133) : (i64, i64) -> i64
      %2135 = func.call @cc_nil_value() : () -> i64
      %2136 = func.call @cc_cons(%2134, %2135) : (i64, i64) -> i64
      %2137 = func.call @cc_values_pack(%2136) : (i64) -> i64
      func.call @stack_push_pointer(%2134) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2138 = func.call @stack_pop_pointer() : () -> i64
      %2139 = func.call @stack_pop_pointer() : () -> i64
      %2140 = func.call @cc_cons(%2139, %2138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2141 = arith.addi %2140, %__rlasp_stack_elide_zero_103 : i64
      %2142 = func.call @stack_pop_pointer() : () -> i64
      %2143 = func.call @cc_cons(%2142, %2141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2144 = arith.addi %2143, %__rlasp_stack_elide_zero_104 : i64
      %2145 = func.call @stack_pop_pointer() : () -> i64
      %2146 = func.call @cc_cons(%2145, %2144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2147 = func.call @stack_pop_pointer() : () -> i64
      %2148 = func.call @stack_pop_pointer() : () -> i64
      %2149 = func.call @cc_cons(%2148, %2147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2150 = arith.addi %2149, %__rlasp_stack_elide_zero_105 : i64
      %2151 = func.call @stack_pop_pointer() : () -> i64
      %2152 = func.call @cc_cons(%2151, %2150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2153 = arith.addi %2152, %__rlasp_stack_elide_zero_106 : i64
      %2154 = func.call @stack_pop_pointer() : () -> i64
      %2155 = func.call @cc_cons(%2154, %2153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2156 = arith.addi %2155, %__rlasp_stack_elide_zero_107 : i64
      %2157 = func.call @stack_pop_pointer() : () -> i64
      %2158 = func.call @cc_cons(%2157, %2156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2159 = func.call @stack_pop_pointer() : () -> i64
      %2160 = func.call @stack_pop_pointer() : () -> i64
      %2161 = func.call @cc_cons(%2160, %2159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2162 = arith.addi %2161, %__rlasp_stack_elide_zero_108 : i64
      %2163 = func.call @stack_pop_pointer() : () -> i64
      %2164 = func.call @cc_cons(%2163, %2162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2165 = func.call @stack_pop_pointer() : () -> i64
      %2166 = func.call @stack_pop_pointer() : () -> i64
      %2167 = func.call @cc_cons(%2166, %2165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2168 = arith.addi %2167, %__rlasp_stack_elide_zero_109 : i64
      %2169 = func.call @stack_pop_pointer() : () -> i64
      %2170 = func.call @cc_cons(%2169, %2168) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2171 = arith.addi %2170, %__rlasp_stack_elide_zero_110 : i64
      %2234 = arith.constant 206494159077383 : i64
      %2235 = arith.constant 0 : i64
      %2236 = func.call @cc_make_closure(%2234, %2235) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2237 = arith.addi %2236, %__rlasp_stack_elide_zero_111 : i64
      %2238 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2239 = arith.constant 1 : i64
      %2240 = func.call @cc_make_string(%2238, %2239) : (!llvm.ptr, i64) -> i64
      %2241 = func.call @cc_nil_value() : () -> i64
      %2242 = func.call @cc_intern(%2240, %2241) : (i64, i64) -> i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_cons(%2242, %2243) : (i64, i64) -> i64
      %2245 = func.call @cc_values_pack(%2244) : (i64) -> i64
      func.call @stack_push_pointer(%2242) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2246 = func.call @stack_pop_pointer() : () -> i64
      %2247 = func.call @stack_pop_pointer() : () -> i64
      %2248 = func.call @cc_cons(%2247, %2246) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2249 = arith.addi %2248, %__rlasp_stack_elide_zero_112 : i64
      %2250 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2251 = arith.constant 11 : i64
      %2252 = func.call @cc_make_string(%2250, %2251) : (!llvm.ptr, i64) -> i64
      %2253 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2254 = arith.constant 7 : i64
      %2255 = func.call @cc_make_string(%2253, %2254) : (!llvm.ptr, i64) -> i64
      %2256 = func.call @cc_intern(%2252, %2255) : (i64, i64) -> i64
      %2257 = func.call @cc_nil_value() : () -> i64
      %2258 = func.call @cc_cons(%2256, %2257) : (i64, i64) -> i64
      %2259 = func.call @cc_values_pack(%2258) : (i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2262 = arith.constant 4 : i64
      %2263 = func.call @cc_make_string(%2261, %2262) : (!llvm.ptr, i64) -> i64
      %2264 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2265 = arith.constant 7 : i64
      %2266 = func.call @cc_make_string(%2264, %2265) : (!llvm.ptr, i64) -> i64
      %2267 = func.call @cc_intern(%2263, %2266) : (i64, i64) -> i64
      %2268 = func.call @cc_nil_value() : () -> i64
      %2269 = func.call @cc_cons(%2267, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_values_pack(%2269) : (i64) -> i64
      %2271 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2272 = arith.constant 6 : i64
      %2273 = func.call @cc_make_string(%2271, %2272) : (!llvm.ptr, i64) -> i64
      %2274 = func.call @cc_nil_value() : () -> i64
      %2275 = func.call @cc_intern(%2273, %2274) : (i64, i64) -> i64
      %2276 = func.call @cc_nil_value() : () -> i64
      %2277 = func.call @cc_cons(%2275, %2276) : (i64, i64) -> i64
      %2278 = func.call @cc_values_pack(%2277) : (i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2279 = arith.addi %2275, %__rlasp_stack_elide_zero_113 : i64
      %2280 = func.call @cc_nil_value() : () -> i64
      %2281 = func.call @cc_errorp(%1974) : (i64) -> i64
      %2282 = arith.cmpi ne, %2281, %2280 : i64
      %2283 = arith.cmpi eq, %2280, %2280 : i64
      %2284 = arith.andi %2282, %2283 : i1
      %2285 = scf.if %2284 -> (i64) {
        scf.yield %1974 : i64
      } else {
        scf.yield %2280 : i64
      }
      %2286 = func.call @cc_errorp(%2171) : (i64) -> i64
      %2287 = arith.cmpi ne, %2286, %2280 : i64
      %2288 = arith.cmpi eq, %2285, %2280 : i64
      %2289 = arith.andi %2287, %2288 : i1
      %2290 = scf.if %2289 -> (i64) {
        scf.yield %2171 : i64
      } else {
        scf.yield %2285 : i64
      }
      %2291 = func.call @cc_errorp(%2237) : (i64) -> i64
      %2292 = arith.cmpi ne, %2291, %2280 : i64
      %2293 = arith.cmpi eq, %2290, %2280 : i64
      %2294 = arith.andi %2292, %2293 : i1
      %2295 = scf.if %2294 -> (i64) {
        scf.yield %2237 : i64
      } else {
        scf.yield %2290 : i64
      }
      %2296 = func.call @cc_errorp(%2249) : (i64) -> i64
      %2297 = arith.cmpi ne, %2296, %2280 : i64
      %2298 = arith.cmpi eq, %2295, %2280 : i64
      %2299 = arith.andi %2297, %2298 : i1
      %2300 = scf.if %2299 -> (i64) {
        scf.yield %2249 : i64
      } else {
        scf.yield %2295 : i64
      }
      %2301 = func.call @cc_errorp(%2256) : (i64) -> i64
      %2302 = arith.cmpi ne, %2301, %2280 : i64
      %2303 = arith.cmpi eq, %2300, %2280 : i64
      %2304 = arith.andi %2302, %2303 : i1
      %2305 = scf.if %2304 -> (i64) {
        scf.yield %2256 : i64
      } else {
        scf.yield %2300 : i64
      }
      %2306 = func.call @cc_errorp(%2260) : (i64) -> i64
      %2307 = arith.cmpi ne, %2306, %2280 : i64
      %2308 = arith.cmpi eq, %2305, %2280 : i64
      %2309 = arith.andi %2307, %2308 : i1
      %2310 = scf.if %2309 -> (i64) {
        scf.yield %2260 : i64
      } else {
        scf.yield %2305 : i64
      }
      %2311 = func.call @cc_errorp(%2267) : (i64) -> i64
      %2312 = arith.cmpi ne, %2311, %2280 : i64
      %2313 = arith.cmpi eq, %2310, %2280 : i64
      %2314 = arith.andi %2312, %2313 : i1
      %2315 = scf.if %2314 -> (i64) {
        scf.yield %2267 : i64
      } else {
        scf.yield %2310 : i64
      }
      %2316 = func.call @cc_errorp(%2279) : (i64) -> i64
      %2317 = arith.cmpi ne, %2316, %2280 : i64
      %2318 = arith.cmpi eq, %2315, %2280 : i64
      %2319 = arith.andi %2317, %2318 : i1
      %2320 = scf.if %2319 -> (i64) {
        scf.yield %2279 : i64
      } else {
        scf.yield %2315 : i64
      }
      %2321 = arith.cmpi ne, %2320, %2280 : i64
      scf.if %2321 {
        func.call @stack_push_pointer(%2320) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1974) : (i64) -> ()
        func.call @stack_push_pointer(%2171) : (i64) -> ()
        func.call @stack_push_pointer(%2237) : (i64) -> ()
        func.call @stack_push_pointer(%2249) : (i64) -> ()
        func.call @stack_push_pointer(%2256) : (i64) -> ()
        func.call @stack_push_pointer(%2260) : (i64) -> ()
        func.call @stack_push_pointer(%2267) : (i64) -> ()
        func.call @stack_push_pointer(%2279) : (i64) -> ()
        %2322 = llvm.mlir.addressof @str235 : !llvm.ptr
        %2323 = func.call @cc_make_function_ref_const(%2322) : (!llvm.ptr) -> i64
        %2324 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2323, %2324) : (i64, i64) -> ()
      }
      %2325 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2325 : i64
    }
    %2326 = func.call @cc_nil_value() : () -> i64
    %2327 = func.call @cc_errorp(%1965) : (i64) -> i64
    %2328 = arith.cmpi ne, %2327, %2326 : i64
    %2329 = scf.if %2328 -> (i64) {
      scf.yield %1965 : i64
    } else {
      %2330 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2331 = arith.constant 15 : i64
      %2332 = func.call @cc_make_string(%2330, %2331) : (!llvm.ptr, i64) -> i64
      %2333 = func.call @cc_nil_value() : () -> i64
      %2334 = func.call @cc_intern(%2332, %2333) : (i64, i64) -> i64
      %2335 = func.call @cc_nil_value() : () -> i64
      %2336 = func.call @cc_cons(%2334, %2335) : (i64, i64) -> i64
      %2337 = func.call @cc_values_pack(%2336) : (i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2338 = arith.addi %2334, %__rlasp_stack_elide_zero_114 : i64
      %2339 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2340 = arith.constant 3 : i64
      %2341 = func.call @cc_make_string(%2339, %2340) : (!llvm.ptr, i64) -> i64
      %2342 = func.call @cc_nil_value() : () -> i64
      %2343 = func.call @cc_intern(%2341, %2342) : (i64, i64) -> i64
      %2344 = func.call @cc_nil_value() : () -> i64
      %2345 = func.call @cc_cons(%2343, %2344) : (i64, i64) -> i64
      %2346 = func.call @cc_values_pack(%2345) : (i64) -> i64
      func.call @stack_push_pointer(%2343) : (i64) -> ()
      %2347 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2348 = arith.constant 3 : i64
      %2349 = func.call @cc_make_string(%2347, %2348) : (!llvm.ptr, i64) -> i64
      %2350 = func.call @cc_nil_value() : () -> i64
      %2351 = func.call @cc_intern(%2349, %2350) : (i64, i64) -> i64
      %2352 = func.call @cc_nil_value() : () -> i64
      %2353 = func.call @cc_cons(%2351, %2352) : (i64, i64) -> i64
      %2354 = func.call @cc_values_pack(%2353) : (i64) -> i64
      func.call @stack_push_pointer(%2351) : (i64) -> ()
      %2355 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2356 = arith.constant 19 : i64
      %2357 = func.call @cc_make_string(%2355, %2356) : (!llvm.ptr, i64) -> i64
      %2358 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2359 = arith.constant 11 : i64
      %2360 = func.call @cc_make_string(%2358, %2359) : (!llvm.ptr, i64) -> i64
      %2361 = func.call @cc_intern(%2357, %2360) : (i64, i64) -> i64
      %2362 = func.call @cc_nil_value() : () -> i64
      %2363 = func.call @cc_cons(%2361, %2362) : (i64, i64) -> i64
      %2364 = func.call @cc_values_pack(%2363) : (i64) -> i64
      func.call @stack_push_pointer(%2361) : (i64) -> ()
      %2365 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2366 = arith.constant 2 : i64
      %2367 = func.call @cc_make_string(%2365, %2366) : (!llvm.ptr, i64) -> i64
      %2368 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2369 = arith.constant 11 : i64
      %2370 = func.call @cc_make_string(%2368, %2369) : (!llvm.ptr, i64) -> i64
      %2371 = func.call @cc_intern(%2367, %2370) : (i64, i64) -> i64
      %2372 = func.call @cc_nil_value() : () -> i64
      %2373 = func.call @cc_cons(%2371, %2372) : (i64, i64) -> i64
      %2374 = func.call @cc_values_pack(%2373) : (i64) -> i64
      func.call @stack_push_pointer(%2371) : (i64) -> ()
      %2375 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2376 = arith.constant 2 : i64
      %2377 = func.call @cc_make_string(%2375, %2376) : (!llvm.ptr, i64) -> i64
      %2378 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2379 = arith.constant 11 : i64
      %2380 = func.call @cc_make_string(%2378, %2379) : (!llvm.ptr, i64) -> i64
      %2381 = func.call @cc_intern(%2377, %2380) : (i64, i64) -> i64
      %2382 = func.call @cc_nil_value() : () -> i64
      %2383 = func.call @cc_cons(%2381, %2382) : (i64, i64) -> i64
      %2384 = func.call @cc_values_pack(%2383) : (i64) -> i64
      func.call @stack_push_pointer(%2381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2385 = func.call @stack_pop_pointer() : () -> i64
      %2386 = func.call @stack_pop_pointer() : () -> i64
      %2387 = func.call @cc_cons(%2386, %2385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2388 = arith.addi %2387, %__rlasp_stack_elide_zero_115 : i64
      %2389 = func.call @stack_pop_pointer() : () -> i64
      %2390 = func.call @cc_cons(%2389, %2388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2390) : (i64) -> ()
      %2391 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2392 = arith.constant 8 : i64
      %2393 = func.call @cc_make_string(%2391, %2392) : (!llvm.ptr, i64) -> i64
      %2394 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2395 = arith.constant 11 : i64
      %2396 = func.call @cc_make_string(%2394, %2395) : (!llvm.ptr, i64) -> i64
      %2397 = func.call @cc_intern(%2393, %2396) : (i64, i64) -> i64
      %2398 = func.call @cc_nil_value() : () -> i64
      %2399 = func.call @cc_cons(%2397, %2398) : (i64, i64) -> i64
      %2400 = func.call @cc_values_pack(%2399) : (i64) -> i64
      func.call @stack_push_pointer(%2397) : (i64) -> ()
      %2401 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2401) : (i64) -> ()
      %2402 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2403 = arith.constant 11 : i64
      %2404 = func.call @cc_make_string(%2402, %2403) : (!llvm.ptr, i64) -> i64
      %2405 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2406 = arith.constant 11 : i64
      %2407 = func.call @cc_make_string(%2405, %2406) : (!llvm.ptr, i64) -> i64
      %2408 = func.call @cc_intern(%2404, %2407) : (i64, i64) -> i64
      %2409 = func.call @cc_nil_value() : () -> i64
      %2410 = func.call @cc_cons(%2408, %2409) : (i64, i64) -> i64
      %2411 = func.call @cc_values_pack(%2410) : (i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2412 = arith.addi %2408, %__rlasp_stack_elide_zero_116 : i64
      %2413 = func.call @stack_pop_pointer() : () -> i64
      %2414 = func.call @cc_cons(%2412, %2413) : (i64, i64) -> i64
      %2415 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2416 = arith.constant 5 : i64
      %2417 = func.call @cc_make_string(%2415, %2416) : (!llvm.ptr, i64) -> i64
      %2418 = func.call @cc_nil_value() : () -> i64
      %2419 = func.call @cc_intern(%2417, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_values_pack(%2421) : (i64) -> i64
      %2423 = func.call @cc_cons(%2419, %2414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2423) : (i64) -> ()
      %2424 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2425 = arith.constant 10 : i64
      %2426 = func.call @cc_make_string(%2424, %2425) : (!llvm.ptr, i64) -> i64
      %2427 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2428 = arith.constant 11 : i64
      %2429 = func.call @cc_make_string(%2427, %2428) : (!llvm.ptr, i64) -> i64
      %2430 = func.call @cc_intern(%2426, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
      func.call @stack_push_pointer(%2430) : (i64) -> ()
      %2434 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2434) : (i64) -> ()
      %2435 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2436 = arith.constant 11 : i64
      %2437 = func.call @cc_make_string(%2435, %2436) : (!llvm.ptr, i64) -> i64
      %2438 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2439 = arith.constant 11 : i64
      %2440 = func.call @cc_make_string(%2438, %2439) : (!llvm.ptr, i64) -> i64
      %2441 = func.call @cc_intern(%2437, %2440) : (i64, i64) -> i64
      %2442 = func.call @cc_nil_value() : () -> i64
      %2443 = func.call @cc_cons(%2441, %2442) : (i64, i64) -> i64
      %2444 = func.call @cc_values_pack(%2443) : (i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2445 = arith.addi %2441, %__rlasp_stack_elide_zero_117 : i64
      %2446 = func.call @stack_pop_pointer() : () -> i64
      %2447 = func.call @cc_cons(%2445, %2446) : (i64, i64) -> i64
      %2448 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2449 = arith.constant 5 : i64
      %2450 = func.call @cc_make_string(%2448, %2449) : (!llvm.ptr, i64) -> i64
      %2451 = func.call @cc_nil_value() : () -> i64
      %2452 = func.call @cc_intern(%2450, %2451) : (i64, i64) -> i64
      %2453 = func.call @cc_nil_value() : () -> i64
      %2454 = func.call @cc_cons(%2452, %2453) : (i64, i64) -> i64
      %2455 = func.call @cc_values_pack(%2454) : (i64) -> i64
      %2456 = func.call @cc_cons(%2452, %2447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2456) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2457 = func.call @stack_pop_pointer() : () -> i64
      %2458 = func.call @stack_pop_pointer() : () -> i64
      %2459 = func.call @cc_cons(%2458, %2457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2460 = arith.addi %2459, %__rlasp_stack_elide_zero_118 : i64
      %2461 = func.call @stack_pop_pointer() : () -> i64
      %2462 = func.call @cc_cons(%2461, %2460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2462) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2463 = func.call @stack_pop_pointer() : () -> i64
      %2464 = func.call @stack_pop_pointer() : () -> i64
      %2465 = func.call @cc_cons(%2464, %2463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2466 = arith.addi %2465, %__rlasp_stack_elide_zero_119 : i64
      %2467 = func.call @stack_pop_pointer() : () -> i64
      %2468 = func.call @cc_cons(%2467, %2466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2469 = arith.addi %2468, %__rlasp_stack_elide_zero_120 : i64
      %2470 = func.call @stack_pop_pointer() : () -> i64
      %2471 = func.call @cc_cons(%2470, %2469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2471) : (i64) -> ()
      %2472 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2473 = arith.constant 3 : i64
      %2474 = func.call @cc_make_string(%2472, %2473) : (!llvm.ptr, i64) -> i64
      %2475 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2476 = arith.constant 11 : i64
      %2477 = func.call @cc_make_string(%2475, %2476) : (!llvm.ptr, i64) -> i64
      %2478 = func.call @cc_intern(%2474, %2477) : (i64, i64) -> i64
      %2479 = func.call @cc_nil_value() : () -> i64
      %2480 = func.call @cc_cons(%2478, %2479) : (i64, i64) -> i64
      %2481 = func.call @cc_values_pack(%2480) : (i64) -> i64
      func.call @stack_push_pointer(%2478) : (i64) -> ()
      %2482 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2483 = arith.constant 2 : i64
      %2484 = func.call @cc_make_string(%2482, %2483) : (!llvm.ptr, i64) -> i64
      %2485 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2486 = arith.constant 11 : i64
      %2487 = func.call @cc_make_string(%2485, %2486) : (!llvm.ptr, i64) -> i64
      %2488 = func.call @cc_intern(%2484, %2487) : (i64, i64) -> i64
      %2489 = func.call @cc_nil_value() : () -> i64
      %2490 = func.call @cc_cons(%2488, %2489) : (i64, i64) -> i64
      %2491 = func.call @cc_values_pack(%2490) : (i64) -> i64
      func.call @stack_push_pointer(%2488) : (i64) -> ()
      %2492 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2493 = arith.constant 2 : i64
      %2494 = func.call @cc_make_string(%2492, %2493) : (!llvm.ptr, i64) -> i64
      %2495 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2496 = arith.constant 11 : i64
      %2497 = func.call @cc_make_string(%2495, %2496) : (!llvm.ptr, i64) -> i64
      %2498 = func.call @cc_intern(%2494, %2497) : (i64, i64) -> i64
      %2499 = func.call @cc_nil_value() : () -> i64
      %2500 = func.call @cc_cons(%2498, %2499) : (i64, i64) -> i64
      %2501 = func.call @cc_values_pack(%2500) : (i64) -> i64
      func.call @stack_push_pointer(%2498) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2502 = func.call @stack_pop_pointer() : () -> i64
      %2503 = func.call @stack_pop_pointer() : () -> i64
      %2504 = func.call @cc_cons(%2503, %2502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2505 = arith.addi %2504, %__rlasp_stack_elide_zero_121 : i64
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = func.call @cc_cons(%2506, %2505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2508 = arith.addi %2507, %__rlasp_stack_elide_zero_122 : i64
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @cc_cons(%2509, %2508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2511 = func.call @stack_pop_pointer() : () -> i64
      %2512 = func.call @stack_pop_pointer() : () -> i64
      %2513 = func.call @cc_cons(%2512, %2511) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2514 = arith.addi %2513, %__rlasp_stack_elide_zero_123 : i64
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @cc_cons(%2515, %2514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2517 = arith.addi %2516, %__rlasp_stack_elide_zero_124 : i64
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = func.call @cc_cons(%2518, %2517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2520 = arith.addi %2519, %__rlasp_stack_elide_zero_125 : i64
      %2521 = func.call @stack_pop_pointer() : () -> i64
      %2522 = func.call @cc_cons(%2521, %2520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2523 = func.call @stack_pop_pointer() : () -> i64
      %2524 = func.call @stack_pop_pointer() : () -> i64
      %2525 = func.call @cc_cons(%2524, %2523) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2526 = arith.addi %2525, %__rlasp_stack_elide_zero_126 : i64
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @cc_cons(%2527, %2526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2529 = func.call @stack_pop_pointer() : () -> i64
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @cc_cons(%2530, %2529) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2532 = arith.addi %2531, %__rlasp_stack_elide_zero_127 : i64
      %2533 = func.call @stack_pop_pointer() : () -> i64
      %2534 = func.call @cc_cons(%2533, %2532) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2535 = arith.addi %2534, %__rlasp_stack_elide_zero_128 : i64
      %2598 = arith.constant 206494159077384 : i64
      %2599 = arith.constant 0 : i64
      %2600 = func.call @cc_make_closure(%2598, %2599) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2601 = arith.addi %2600, %__rlasp_stack_elide_zero_129 : i64
      %2602 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2603 = arith.constant 1 : i64
      %2604 = func.call @cc_make_string(%2602, %2603) : (!llvm.ptr, i64) -> i64
      %2605 = func.call @cc_nil_value() : () -> i64
      %2606 = func.call @cc_intern(%2604, %2605) : (i64, i64) -> i64
      %2607 = func.call @cc_nil_value() : () -> i64
      %2608 = func.call @cc_cons(%2606, %2607) : (i64, i64) -> i64
      %2609 = func.call @cc_values_pack(%2608) : (i64) -> i64
      func.call @stack_push_pointer(%2606) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @cc_cons(%2611, %2610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2613 = arith.addi %2612, %__rlasp_stack_elide_zero_130 : i64
      %2614 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2615 = arith.constant 11 : i64
      %2616 = func.call @cc_make_string(%2614, %2615) : (!llvm.ptr, i64) -> i64
      %2617 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2618 = arith.constant 7 : i64
      %2619 = func.call @cc_make_string(%2617, %2618) : (!llvm.ptr, i64) -> i64
      %2620 = func.call @cc_intern(%2616, %2619) : (i64, i64) -> i64
      %2621 = func.call @cc_nil_value() : () -> i64
      %2622 = func.call @cc_cons(%2620, %2621) : (i64, i64) -> i64
      %2623 = func.call @cc_values_pack(%2622) : (i64) -> i64
      %2624 = func.call @cc_nil_value() : () -> i64
      %2625 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2626 = arith.constant 4 : i64
      %2627 = func.call @cc_make_string(%2625, %2626) : (!llvm.ptr, i64) -> i64
      %2628 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2629 = arith.constant 7 : i64
      %2630 = func.call @cc_make_string(%2628, %2629) : (!llvm.ptr, i64) -> i64
      %2631 = func.call @cc_intern(%2627, %2630) : (i64, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_cons(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_values_pack(%2633) : (i64) -> i64
      %2635 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2636 = arith.constant 6 : i64
      %2637 = func.call @cc_make_string(%2635, %2636) : (!llvm.ptr, i64) -> i64
      %2638 = func.call @cc_nil_value() : () -> i64
      %2639 = func.call @cc_intern(%2637, %2638) : (i64, i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_cons(%2639, %2640) : (i64, i64) -> i64
      %2642 = func.call @cc_values_pack(%2641) : (i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2643 = arith.addi %2639, %__rlasp_stack_elide_zero_131 : i64
      %2644 = func.call @cc_nil_value() : () -> i64
      %2645 = func.call @cc_errorp(%2338) : (i64) -> i64
      %2646 = arith.cmpi ne, %2645, %2644 : i64
      %2647 = arith.cmpi eq, %2644, %2644 : i64
      %2648 = arith.andi %2646, %2647 : i1
      %2649 = scf.if %2648 -> (i64) {
        scf.yield %2338 : i64
      } else {
        scf.yield %2644 : i64
      }
      %2650 = func.call @cc_errorp(%2535) : (i64) -> i64
      %2651 = arith.cmpi ne, %2650, %2644 : i64
      %2652 = arith.cmpi eq, %2649, %2644 : i64
      %2653 = arith.andi %2651, %2652 : i1
      %2654 = scf.if %2653 -> (i64) {
        scf.yield %2535 : i64
      } else {
        scf.yield %2649 : i64
      }
      %2655 = func.call @cc_errorp(%2601) : (i64) -> i64
      %2656 = arith.cmpi ne, %2655, %2644 : i64
      %2657 = arith.cmpi eq, %2654, %2644 : i64
      %2658 = arith.andi %2656, %2657 : i1
      %2659 = scf.if %2658 -> (i64) {
        scf.yield %2601 : i64
      } else {
        scf.yield %2654 : i64
      }
      %2660 = func.call @cc_errorp(%2613) : (i64) -> i64
      %2661 = arith.cmpi ne, %2660, %2644 : i64
      %2662 = arith.cmpi eq, %2659, %2644 : i64
      %2663 = arith.andi %2661, %2662 : i1
      %2664 = scf.if %2663 -> (i64) {
        scf.yield %2613 : i64
      } else {
        scf.yield %2659 : i64
      }
      %2665 = func.call @cc_errorp(%2620) : (i64) -> i64
      %2666 = arith.cmpi ne, %2665, %2644 : i64
      %2667 = arith.cmpi eq, %2664, %2644 : i64
      %2668 = arith.andi %2666, %2667 : i1
      %2669 = scf.if %2668 -> (i64) {
        scf.yield %2620 : i64
      } else {
        scf.yield %2664 : i64
      }
      %2670 = func.call @cc_errorp(%2624) : (i64) -> i64
      %2671 = arith.cmpi ne, %2670, %2644 : i64
      %2672 = arith.cmpi eq, %2669, %2644 : i64
      %2673 = arith.andi %2671, %2672 : i1
      %2674 = scf.if %2673 -> (i64) {
        scf.yield %2624 : i64
      } else {
        scf.yield %2669 : i64
      }
      %2675 = func.call @cc_errorp(%2631) : (i64) -> i64
      %2676 = arith.cmpi ne, %2675, %2644 : i64
      %2677 = arith.cmpi eq, %2674, %2644 : i64
      %2678 = arith.andi %2676, %2677 : i1
      %2679 = scf.if %2678 -> (i64) {
        scf.yield %2631 : i64
      } else {
        scf.yield %2674 : i64
      }
      %2680 = func.call @cc_errorp(%2643) : (i64) -> i64
      %2681 = arith.cmpi ne, %2680, %2644 : i64
      %2682 = arith.cmpi eq, %2679, %2644 : i64
      %2683 = arith.andi %2681, %2682 : i1
      %2684 = scf.if %2683 -> (i64) {
        scf.yield %2643 : i64
      } else {
        scf.yield %2679 : i64
      }
      %2685 = arith.cmpi ne, %2684, %2644 : i64
      scf.if %2685 {
        func.call @stack_push_pointer(%2684) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2338) : (i64) -> ()
        func.call @stack_push_pointer(%2535) : (i64) -> ()
        func.call @stack_push_pointer(%2601) : (i64) -> ()
        func.call @stack_push_pointer(%2613) : (i64) -> ()
        func.call @stack_push_pointer(%2620) : (i64) -> ()
        func.call @stack_push_pointer(%2624) : (i64) -> ()
        func.call @stack_push_pointer(%2631) : (i64) -> ()
        func.call @stack_push_pointer(%2643) : (i64) -> ()
        %2686 = llvm.mlir.addressof @str272 : !llvm.ptr
        %2687 = func.call @cc_make_function_ref_const(%2686) : (!llvm.ptr) -> i64
        %2688 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2687, %2688) : (i64, i64) -> ()
      }
      %2689 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2689 : i64
    }
    %2690 = func.call @cc_nil_value() : () -> i64
    %2691 = func.call @cc_errorp(%2329) : (i64) -> i64
    %2692 = arith.cmpi ne, %2691, %2690 : i64
    %2693 = scf.if %2692 -> (i64) {
      scf.yield %2329 : i64
    } else {
      %2694 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2695 = arith.constant 15 : i64
      %2696 = func.call @cc_make_string(%2694, %2695) : (!llvm.ptr, i64) -> i64
      %2697 = func.call @cc_nil_value() : () -> i64
      %2698 = func.call @cc_intern(%2696, %2697) : (i64, i64) -> i64
      %2699 = func.call @cc_nil_value() : () -> i64
      %2700 = func.call @cc_cons(%2698, %2699) : (i64, i64) -> i64
      %2701 = func.call @cc_values_pack(%2700) : (i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2702 = arith.addi %2698, %__rlasp_stack_elide_zero_132 : i64
      %2703 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2704 = arith.constant 3 : i64
      %2705 = func.call @cc_make_string(%2703, %2704) : (!llvm.ptr, i64) -> i64
      %2706 = func.call @cc_nil_value() : () -> i64
      %2707 = func.call @cc_intern(%2705, %2706) : (i64, i64) -> i64
      %2708 = func.call @cc_nil_value() : () -> i64
      %2709 = func.call @cc_cons(%2707, %2708) : (i64, i64) -> i64
      %2710 = func.call @cc_values_pack(%2709) : (i64) -> i64
      func.call @stack_push_pointer(%2707) : (i64) -> ()
      %2711 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2712 = arith.constant 3 : i64
      %2713 = func.call @cc_make_string(%2711, %2712) : (!llvm.ptr, i64) -> i64
      %2714 = func.call @cc_nil_value() : () -> i64
      %2715 = func.call @cc_intern(%2713, %2714) : (i64, i64) -> i64
      %2716 = func.call @cc_nil_value() : () -> i64
      %2717 = func.call @cc_cons(%2715, %2716) : (i64, i64) -> i64
      %2718 = func.call @cc_values_pack(%2717) : (i64) -> i64
      func.call @stack_push_pointer(%2715) : (i64) -> ()
      %2719 = llvm.mlir.addressof @str276 : !llvm.ptr
      %2720 = arith.constant 19 : i64
      %2721 = func.call @cc_make_string(%2719, %2720) : (!llvm.ptr, i64) -> i64
      %2722 = llvm.mlir.addressof @str277 : !llvm.ptr
      %2723 = arith.constant 11 : i64
      %2724 = func.call @cc_make_string(%2722, %2723) : (!llvm.ptr, i64) -> i64
      %2725 = func.call @cc_intern(%2721, %2724) : (i64, i64) -> i64
      %2726 = func.call @cc_nil_value() : () -> i64
      %2727 = func.call @cc_cons(%2725, %2726) : (i64, i64) -> i64
      %2728 = func.call @cc_values_pack(%2727) : (i64) -> i64
      func.call @stack_push_pointer(%2725) : (i64) -> ()
      %2729 = llvm.mlir.addressof @str278 : !llvm.ptr
      %2730 = arith.constant 2 : i64
      %2731 = func.call @cc_make_string(%2729, %2730) : (!llvm.ptr, i64) -> i64
      %2732 = llvm.mlir.addressof @str279 : !llvm.ptr
      %2733 = arith.constant 11 : i64
      %2734 = func.call @cc_make_string(%2732, %2733) : (!llvm.ptr, i64) -> i64
      %2735 = func.call @cc_intern(%2731, %2734) : (i64, i64) -> i64
      %2736 = func.call @cc_nil_value() : () -> i64
      %2737 = func.call @cc_cons(%2735, %2736) : (i64, i64) -> i64
      %2738 = func.call @cc_values_pack(%2737) : (i64) -> i64
      func.call @stack_push_pointer(%2735) : (i64) -> ()
      %2739 = llvm.mlir.addressof @str280 : !llvm.ptr
      %2740 = arith.constant 2 : i64
      %2741 = func.call @cc_make_string(%2739, %2740) : (!llvm.ptr, i64) -> i64
      %2742 = llvm.mlir.addressof @str281 : !llvm.ptr
      %2743 = arith.constant 11 : i64
      %2744 = func.call @cc_make_string(%2742, %2743) : (!llvm.ptr, i64) -> i64
      %2745 = func.call @cc_intern(%2741, %2744) : (i64, i64) -> i64
      %2746 = func.call @cc_nil_value() : () -> i64
      %2747 = func.call @cc_cons(%2745, %2746) : (i64, i64) -> i64
      %2748 = func.call @cc_values_pack(%2747) : (i64) -> i64
      func.call @stack_push_pointer(%2745) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2749 = func.call @stack_pop_pointer() : () -> i64
      %2750 = func.call @stack_pop_pointer() : () -> i64
      %2751 = func.call @cc_cons(%2750, %2749) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2752 = arith.addi %2751, %__rlasp_stack_elide_zero_133 : i64
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @cc_cons(%2753, %2752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2754) : (i64) -> ()
      %2755 = llvm.mlir.addressof @str282 : !llvm.ptr
      %2756 = arith.constant 8 : i64
      %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
      %2758 = llvm.mlir.addressof @str283 : !llvm.ptr
      %2759 = arith.constant 11 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = func.call @cc_intern(%2757, %2760) : (i64, i64) -> i64
      %2762 = func.call @cc_nil_value() : () -> i64
      %2763 = func.call @cc_cons(%2761, %2762) : (i64, i64) -> i64
      %2764 = func.call @cc_values_pack(%2763) : (i64) -> i64
      func.call @stack_push_pointer(%2761) : (i64) -> ()
      %2765 = llvm.mlir.addressof @str284 : !llvm.ptr
      %2766 = arith.constant 10 : i64
      %2767 = func.call @cc_make_string(%2765, %2766) : (!llvm.ptr, i64) -> i64
      %2768 = llvm.mlir.addressof @str285 : !llvm.ptr
      %2769 = arith.constant 11 : i64
      %2770 = func.call @cc_make_string(%2768, %2769) : (!llvm.ptr, i64) -> i64
      %2771 = func.call @cc_intern(%2767, %2770) : (i64, i64) -> i64
      %2772 = func.call @cc_nil_value() : () -> i64
      %2773 = func.call @cc_cons(%2771, %2772) : (i64, i64) -> i64
      %2774 = func.call @cc_values_pack(%2773) : (i64) -> i64
      func.call @stack_push_pointer(%2771) : (i64) -> ()
      %2775 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2775) : (i64) -> ()
      %2776 = llvm.mlir.addressof @str286 : !llvm.ptr
      %2777 = arith.constant 11 : i64
      %2778 = func.call @cc_make_string(%2776, %2777) : (!llvm.ptr, i64) -> i64
      %2779 = llvm.mlir.addressof @str287 : !llvm.ptr
      %2780 = arith.constant 11 : i64
      %2781 = func.call @cc_make_string(%2779, %2780) : (!llvm.ptr, i64) -> i64
      %2782 = func.call @cc_intern(%2778, %2781) : (i64, i64) -> i64
      %2783 = func.call @cc_nil_value() : () -> i64
      %2784 = func.call @cc_cons(%2782, %2783) : (i64, i64) -> i64
      %2785 = func.call @cc_values_pack(%2784) : (i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2786 = arith.addi %2782, %__rlasp_stack_elide_zero_134 : i64
      %2787 = func.call @stack_pop_pointer() : () -> i64
      %2788 = func.call @cc_cons(%2786, %2787) : (i64, i64) -> i64
      %2789 = llvm.mlir.addressof @str288 : !llvm.ptr
      %2790 = arith.constant 5 : i64
      %2791 = func.call @cc_make_string(%2789, %2790) : (!llvm.ptr, i64) -> i64
      %2792 = func.call @cc_nil_value() : () -> i64
      %2793 = func.call @cc_intern(%2791, %2792) : (i64, i64) -> i64
      %2794 = func.call @cc_nil_value() : () -> i64
      %2795 = func.call @cc_cons(%2793, %2794) : (i64, i64) -> i64
      %2796 = func.call @cc_values_pack(%2795) : (i64) -> i64
      %2797 = func.call @cc_cons(%2793, %2788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2797) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2798 = func.call @stack_pop_pointer() : () -> i64
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @cc_cons(%2799, %2798) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2801 = arith.addi %2800, %__rlasp_stack_elide_zero_135 : i64
      %2802 = func.call @stack_pop_pointer() : () -> i64
      %2803 = func.call @cc_cons(%2802, %2801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2803) : (i64) -> ()
      %2804 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2804) : (i64) -> ()
      %2805 = llvm.mlir.addressof @str289 : !llvm.ptr
      %2806 = arith.constant 11 : i64
      %2807 = func.call @cc_make_string(%2805, %2806) : (!llvm.ptr, i64) -> i64
      %2808 = llvm.mlir.addressof @str290 : !llvm.ptr
      %2809 = arith.constant 11 : i64
      %2810 = func.call @cc_make_string(%2808, %2809) : (!llvm.ptr, i64) -> i64
      %2811 = func.call @cc_intern(%2807, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_nil_value() : () -> i64
      %2813 = func.call @cc_cons(%2811, %2812) : (i64, i64) -> i64
      %2814 = func.call @cc_values_pack(%2813) : (i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2815 = arith.addi %2811, %__rlasp_stack_elide_zero_136 : i64
      %2816 = func.call @stack_pop_pointer() : () -> i64
      %2817 = func.call @cc_cons(%2815, %2816) : (i64, i64) -> i64
      %2818 = llvm.mlir.addressof @str291 : !llvm.ptr
      %2819 = arith.constant 5 : i64
      %2820 = func.call @cc_make_string(%2818, %2819) : (!llvm.ptr, i64) -> i64
      %2821 = func.call @cc_nil_value() : () -> i64
      %2822 = func.call @cc_intern(%2820, %2821) : (i64, i64) -> i64
      %2823 = func.call @cc_nil_value() : () -> i64
      %2824 = func.call @cc_cons(%2822, %2823) : (i64, i64) -> i64
      %2825 = func.call @cc_values_pack(%2824) : (i64) -> i64
      %2826 = func.call @cc_cons(%2822, %2817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2826) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2827 = func.call @stack_pop_pointer() : () -> i64
      %2828 = func.call @stack_pop_pointer() : () -> i64
      %2829 = func.call @cc_cons(%2828, %2827) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2830 = arith.addi %2829, %__rlasp_stack_elide_zero_137 : i64
      %2831 = func.call @stack_pop_pointer() : () -> i64
      %2832 = func.call @cc_cons(%2831, %2830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2833 = arith.addi %2832, %__rlasp_stack_elide_zero_138 : i64
      %2834 = func.call @stack_pop_pointer() : () -> i64
      %2835 = func.call @cc_cons(%2834, %2833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      %2836 = llvm.mlir.addressof @str292 : !llvm.ptr
      %2837 = arith.constant 3 : i64
      %2838 = func.call @cc_make_string(%2836, %2837) : (!llvm.ptr, i64) -> i64
      %2839 = llvm.mlir.addressof @str293 : !llvm.ptr
      %2840 = arith.constant 11 : i64
      %2841 = func.call @cc_make_string(%2839, %2840) : (!llvm.ptr, i64) -> i64
      %2842 = func.call @cc_intern(%2838, %2841) : (i64, i64) -> i64
      %2843 = func.call @cc_nil_value() : () -> i64
      %2844 = func.call @cc_cons(%2842, %2843) : (i64, i64) -> i64
      %2845 = func.call @cc_values_pack(%2844) : (i64) -> i64
      func.call @stack_push_pointer(%2842) : (i64) -> ()
      %2846 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2847 = arith.constant 2 : i64
      %2848 = func.call @cc_make_string(%2846, %2847) : (!llvm.ptr, i64) -> i64
      %2849 = llvm.mlir.addressof @str295 : !llvm.ptr
      %2850 = arith.constant 11 : i64
      %2851 = func.call @cc_make_string(%2849, %2850) : (!llvm.ptr, i64) -> i64
      %2852 = func.call @cc_intern(%2848, %2851) : (i64, i64) -> i64
      %2853 = func.call @cc_nil_value() : () -> i64
      %2854 = func.call @cc_cons(%2852, %2853) : (i64, i64) -> i64
      %2855 = func.call @cc_values_pack(%2854) : (i64) -> i64
      func.call @stack_push_pointer(%2852) : (i64) -> ()
      %2856 = llvm.mlir.addressof @str296 : !llvm.ptr
      %2857 = arith.constant 2 : i64
      %2858 = func.call @cc_make_string(%2856, %2857) : (!llvm.ptr, i64) -> i64
      %2859 = llvm.mlir.addressof @str297 : !llvm.ptr
      %2860 = arith.constant 11 : i64
      %2861 = func.call @cc_make_string(%2859, %2860) : (!llvm.ptr, i64) -> i64
      %2862 = func.call @cc_intern(%2858, %2861) : (i64, i64) -> i64
      %2863 = func.call @cc_nil_value() : () -> i64
      %2864 = func.call @cc_cons(%2862, %2863) : (i64, i64) -> i64
      %2865 = func.call @cc_values_pack(%2864) : (i64) -> i64
      func.call @stack_push_pointer(%2862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2866 = func.call @stack_pop_pointer() : () -> i64
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @cc_cons(%2867, %2866) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2869 = arith.addi %2868, %__rlasp_stack_elide_zero_139 : i64
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_cons(%2870, %2869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2872 = arith.addi %2871, %__rlasp_stack_elide_zero_140 : i64
      %2873 = func.call @stack_pop_pointer() : () -> i64
      %2874 = func.call @cc_cons(%2873, %2872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2874) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2875 = func.call @stack_pop_pointer() : () -> i64
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @cc_cons(%2876, %2875) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2878 = arith.addi %2877, %__rlasp_stack_elide_zero_141 : i64
      %2879 = func.call @stack_pop_pointer() : () -> i64
      %2880 = func.call @cc_cons(%2879, %2878) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %2881 = arith.addi %2880, %__rlasp_stack_elide_zero_142 : i64
      %2882 = func.call @stack_pop_pointer() : () -> i64
      %2883 = func.call @cc_cons(%2882, %2881) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %2884 = arith.addi %2883, %__rlasp_stack_elide_zero_143 : i64
      %2885 = func.call @stack_pop_pointer() : () -> i64
      %2886 = func.call @cc_cons(%2885, %2884) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2886) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2887 = func.call @stack_pop_pointer() : () -> i64
      %2888 = func.call @stack_pop_pointer() : () -> i64
      %2889 = func.call @cc_cons(%2888, %2887) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %2890 = arith.addi %2889, %__rlasp_stack_elide_zero_144 : i64
      %2891 = func.call @stack_pop_pointer() : () -> i64
      %2892 = func.call @cc_cons(%2891, %2890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2892) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2893 = func.call @stack_pop_pointer() : () -> i64
      %2894 = func.call @stack_pop_pointer() : () -> i64
      %2895 = func.call @cc_cons(%2894, %2893) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %2896 = arith.addi %2895, %__rlasp_stack_elide_zero_145 : i64
      %2897 = func.call @stack_pop_pointer() : () -> i64
      %2898 = func.call @cc_cons(%2897, %2896) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %2899 = arith.addi %2898, %__rlasp_stack_elide_zero_146 : i64
      %2962 = arith.constant 206494159077385 : i64
      %2963 = arith.constant 0 : i64
      %2964 = func.call @cc_make_closure(%2962, %2963) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %2965 = arith.addi %2964, %__rlasp_stack_elide_zero_147 : i64
      %2966 = llvm.mlir.addressof @str303 : !llvm.ptr
      %2967 = arith.constant 1 : i64
      %2968 = func.call @cc_make_string(%2966, %2967) : (!llvm.ptr, i64) -> i64
      %2969 = func.call @cc_nil_value() : () -> i64
      %2970 = func.call @cc_intern(%2968, %2969) : (i64, i64) -> i64
      %2971 = func.call @cc_nil_value() : () -> i64
      %2972 = func.call @cc_cons(%2970, %2971) : (i64, i64) -> i64
      %2973 = func.call @cc_values_pack(%2972) : (i64) -> i64
      func.call @stack_push_pointer(%2970) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2974 = func.call @stack_pop_pointer() : () -> i64
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @cc_cons(%2975, %2974) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %2977 = arith.addi %2976, %__rlasp_stack_elide_zero_148 : i64
      %2978 = llvm.mlir.addressof @str304 : !llvm.ptr
      %2979 = arith.constant 11 : i64
      %2980 = func.call @cc_make_string(%2978, %2979) : (!llvm.ptr, i64) -> i64
      %2981 = llvm.mlir.addressof @str305 : !llvm.ptr
      %2982 = arith.constant 7 : i64
      %2983 = func.call @cc_make_string(%2981, %2982) : (!llvm.ptr, i64) -> i64
      %2984 = func.call @cc_intern(%2980, %2983) : (i64, i64) -> i64
      %2985 = func.call @cc_nil_value() : () -> i64
      %2986 = func.call @cc_cons(%2984, %2985) : (i64, i64) -> i64
      %2987 = func.call @cc_values_pack(%2986) : (i64) -> i64
      %2988 = func.call @cc_nil_value() : () -> i64
      %2989 = llvm.mlir.addressof @str306 : !llvm.ptr
      %2990 = arith.constant 4 : i64
      %2991 = func.call @cc_make_string(%2989, %2990) : (!llvm.ptr, i64) -> i64
      %2992 = llvm.mlir.addressof @str307 : !llvm.ptr
      %2993 = arith.constant 7 : i64
      %2994 = func.call @cc_make_string(%2992, %2993) : (!llvm.ptr, i64) -> i64
      %2995 = func.call @cc_intern(%2991, %2994) : (i64, i64) -> i64
      %2996 = func.call @cc_nil_value() : () -> i64
      %2997 = func.call @cc_cons(%2995, %2996) : (i64, i64) -> i64
      %2998 = func.call @cc_values_pack(%2997) : (i64) -> i64
      %2999 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3000 = arith.constant 6 : i64
      %3001 = func.call @cc_make_string(%2999, %3000) : (!llvm.ptr, i64) -> i64
      %3002 = func.call @cc_nil_value() : () -> i64
      %3003 = func.call @cc_intern(%3001, %3002) : (i64, i64) -> i64
      %3004 = func.call @cc_nil_value() : () -> i64
      %3005 = func.call @cc_cons(%3003, %3004) : (i64, i64) -> i64
      %3006 = func.call @cc_values_pack(%3005) : (i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3007 = arith.addi %3003, %__rlasp_stack_elide_zero_149 : i64
      %3008 = func.call @cc_nil_value() : () -> i64
      %3009 = func.call @cc_errorp(%2702) : (i64) -> i64
      %3010 = arith.cmpi ne, %3009, %3008 : i64
      %3011 = arith.cmpi eq, %3008, %3008 : i64
      %3012 = arith.andi %3010, %3011 : i1
      %3013 = scf.if %3012 -> (i64) {
        scf.yield %2702 : i64
      } else {
        scf.yield %3008 : i64
      }
      %3014 = func.call @cc_errorp(%2899) : (i64) -> i64
      %3015 = arith.cmpi ne, %3014, %3008 : i64
      %3016 = arith.cmpi eq, %3013, %3008 : i64
      %3017 = arith.andi %3015, %3016 : i1
      %3018 = scf.if %3017 -> (i64) {
        scf.yield %2899 : i64
      } else {
        scf.yield %3013 : i64
      }
      %3019 = func.call @cc_errorp(%2965) : (i64) -> i64
      %3020 = arith.cmpi ne, %3019, %3008 : i64
      %3021 = arith.cmpi eq, %3018, %3008 : i64
      %3022 = arith.andi %3020, %3021 : i1
      %3023 = scf.if %3022 -> (i64) {
        scf.yield %2965 : i64
      } else {
        scf.yield %3018 : i64
      }
      %3024 = func.call @cc_errorp(%2977) : (i64) -> i64
      %3025 = arith.cmpi ne, %3024, %3008 : i64
      %3026 = arith.cmpi eq, %3023, %3008 : i64
      %3027 = arith.andi %3025, %3026 : i1
      %3028 = scf.if %3027 -> (i64) {
        scf.yield %2977 : i64
      } else {
        scf.yield %3023 : i64
      }
      %3029 = func.call @cc_errorp(%2984) : (i64) -> i64
      %3030 = arith.cmpi ne, %3029, %3008 : i64
      %3031 = arith.cmpi eq, %3028, %3008 : i64
      %3032 = arith.andi %3030, %3031 : i1
      %3033 = scf.if %3032 -> (i64) {
        scf.yield %2984 : i64
      } else {
        scf.yield %3028 : i64
      }
      %3034 = func.call @cc_errorp(%2988) : (i64) -> i64
      %3035 = arith.cmpi ne, %3034, %3008 : i64
      %3036 = arith.cmpi eq, %3033, %3008 : i64
      %3037 = arith.andi %3035, %3036 : i1
      %3038 = scf.if %3037 -> (i64) {
        scf.yield %2988 : i64
      } else {
        scf.yield %3033 : i64
      }
      %3039 = func.call @cc_errorp(%2995) : (i64) -> i64
      %3040 = arith.cmpi ne, %3039, %3008 : i64
      %3041 = arith.cmpi eq, %3038, %3008 : i64
      %3042 = arith.andi %3040, %3041 : i1
      %3043 = scf.if %3042 -> (i64) {
        scf.yield %2995 : i64
      } else {
        scf.yield %3038 : i64
      }
      %3044 = func.call @cc_errorp(%3007) : (i64) -> i64
      %3045 = arith.cmpi ne, %3044, %3008 : i64
      %3046 = arith.cmpi eq, %3043, %3008 : i64
      %3047 = arith.andi %3045, %3046 : i1
      %3048 = scf.if %3047 -> (i64) {
        scf.yield %3007 : i64
      } else {
        scf.yield %3043 : i64
      }
      %3049 = arith.cmpi ne, %3048, %3008 : i64
      scf.if %3049 {
        func.call @stack_push_pointer(%3048) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2702) : (i64) -> ()
        func.call @stack_push_pointer(%2899) : (i64) -> ()
        func.call @stack_push_pointer(%2965) : (i64) -> ()
        func.call @stack_push_pointer(%2977) : (i64) -> ()
        func.call @stack_push_pointer(%2984) : (i64) -> ()
        func.call @stack_push_pointer(%2988) : (i64) -> ()
        func.call @stack_push_pointer(%2995) : (i64) -> ()
        func.call @stack_push_pointer(%3007) : (i64) -> ()
        %3050 = llvm.mlir.addressof @str309 : !llvm.ptr
        %3051 = func.call @cc_make_function_ref_const(%3050) : (!llvm.ptr) -> i64
        %3052 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3051, %3052) : (i64, i64) -> ()
      }
      %3053 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3053 : i64
    }
    %3054 = func.call @cc_nil_value() : () -> i64
    %3055 = func.call @cc_errorp(%2693) : (i64) -> i64
    %3056 = arith.cmpi ne, %3055, %3054 : i64
    %3057 = scf.if %3056 -> (i64) {
      scf.yield %2693 : i64
    } else {
      %3058 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3059 = arith.constant 15 : i64
      %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
      %3061 = func.call @cc_nil_value() : () -> i64
      %3062 = func.call @cc_intern(%3060, %3061) : (i64, i64) -> i64
      %3063 = func.call @cc_nil_value() : () -> i64
      %3064 = func.call @cc_cons(%3062, %3063) : (i64, i64) -> i64
      %3065 = func.call @cc_values_pack(%3064) : (i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3066 = arith.addi %3062, %__rlasp_stack_elide_zero_150 : i64
      %3067 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3068 = arith.constant 8 : i64
      %3069 = func.call @cc_make_string(%3067, %3068) : (!llvm.ptr, i64) -> i64
      %3070 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3071 = arith.constant 11 : i64
      %3072 = func.call @cc_make_string(%3070, %3071) : (!llvm.ptr, i64) -> i64
      %3073 = func.call @cc_intern(%3069, %3072) : (i64, i64) -> i64
      %3074 = func.call @cc_nil_value() : () -> i64
      %3075 = func.call @cc_cons(%3073, %3074) : (i64, i64) -> i64
      %3076 = func.call @cc_values_pack(%3075) : (i64) -> i64
      func.call @stack_push_pointer(%3073) : (i64) -> ()
      %3077 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3078 = arith.constant 7 : i64
      %3079 = func.call @cc_make_string(%3077, %3078) : (!llvm.ptr, i64) -> i64
      %3080 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3081 = arith.constant 11 : i64
      %3082 = func.call @cc_make_string(%3080, %3081) : (!llvm.ptr, i64) -> i64
      %3083 = func.call @cc_intern(%3079, %3082) : (i64, i64) -> i64
      %3084 = func.call @cc_nil_value() : () -> i64
      %3085 = func.call @cc_cons(%3083, %3084) : (i64, i64) -> i64
      %3086 = func.call @cc_values_pack(%3085) : (i64) -> i64
      func.call @stack_push_pointer(%3083) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3087 = arith.constant 4 : i64
      %3088 = func.call @cc_box_fixnum(%3087) : (i64) -> i64
      %3089 = func.call @cc_make_vector(%3088) : (i64) -> i64
      %3090 = func.call @stack_pop_pointer() : () -> i64
      %3091 = arith.constant 3 : i64
      %3092 = func.call @cc_box_fixnum(%3091) : (i64) -> i64
      %3093 = func.call @cc_svset(%3089, %3092, %3090) : (i64, i64, i64) -> i64
      %3094 = func.call @stack_pop_pointer() : () -> i64
      %3095 = arith.constant 2 : i64
      %3096 = func.call @cc_box_fixnum(%3095) : (i64) -> i64
      %3097 = func.call @cc_svset(%3089, %3096, %3094) : (i64, i64, i64) -> i64
      %3098 = func.call @stack_pop_pointer() : () -> i64
      %3099 = arith.constant 1 : i64
      %3100 = func.call @cc_box_fixnum(%3099) : (i64) -> i64
      %3101 = func.call @cc_svset(%3089, %3100, %3098) : (i64, i64, i64) -> i64
      %3102 = func.call @stack_pop_pointer() : () -> i64
      %3103 = arith.constant 0 : i64
      %3104 = func.call @cc_box_fixnum(%3103) : (i64) -> i64
      %3105 = func.call @cc_svset(%3089, %3104, %3102) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3089) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3106 = func.call @stack_pop_pointer() : () -> i64
      %3107 = func.call @stack_pop_pointer() : () -> i64
      %3108 = func.call @cc_cons(%3107, %3106) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3109 = arith.addi %3108, %__rlasp_stack_elide_zero_151 : i64
      %3110 = func.call @stack_pop_pointer() : () -> i64
      %3111 = func.call @cc_cons(%3110, %3109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3111) : (i64) -> ()
      %3112 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3113 = arith.constant 8 : i64
      %3114 = func.call @cc_make_string(%3112, %3113) : (!llvm.ptr, i64) -> i64
      %3115 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3116 = arith.constant 11 : i64
      %3117 = func.call @cc_make_string(%3115, %3116) : (!llvm.ptr, i64) -> i64
      %3118 = func.call @cc_intern(%3114, %3117) : (i64, i64) -> i64
      %3119 = func.call @cc_nil_value() : () -> i64
      %3120 = func.call @cc_cons(%3118, %3119) : (i64, i64) -> i64
      %3121 = func.call @cc_values_pack(%3120) : (i64) -> i64
      func.call @stack_push_pointer(%3118) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3122 = arith.constant 4 : i64
      %3123 = func.call @cc_box_fixnum(%3122) : (i64) -> i64
      %3124 = func.call @cc_make_vector(%3123) : (i64) -> i64
      %3125 = func.call @stack_pop_pointer() : () -> i64
      %3126 = arith.constant 3 : i64
      %3127 = func.call @cc_box_fixnum(%3126) : (i64) -> i64
      %3128 = func.call @cc_svset(%3124, %3127, %3125) : (i64, i64, i64) -> i64
      %3129 = func.call @stack_pop_pointer() : () -> i64
      %3130 = arith.constant 2 : i64
      %3131 = func.call @cc_box_fixnum(%3130) : (i64) -> i64
      %3132 = func.call @cc_svset(%3124, %3131, %3129) : (i64, i64, i64) -> i64
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = arith.constant 1 : i64
      %3135 = func.call @cc_box_fixnum(%3134) : (i64) -> i64
      %3136 = func.call @cc_svset(%3124, %3135, %3133) : (i64, i64, i64) -> i64
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = arith.constant 0 : i64
      %3139 = func.call @cc_box_fixnum(%3138) : (i64) -> i64
      %3140 = func.call @cc_svset(%3124, %3139, %3137) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3124) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3141 = func.call @stack_pop_pointer() : () -> i64
      %3142 = func.call @stack_pop_pointer() : () -> i64
      %3143 = func.call @cc_cons(%3142, %3141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3144 = arith.addi %3143, %__rlasp_stack_elide_zero_152 : i64
      %3145 = func.call @stack_pop_pointer() : () -> i64
      %3146 = func.call @cc_cons(%3145, %3144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3147 = func.call @stack_pop_pointer() : () -> i64
      %3148 = func.call @stack_pop_pointer() : () -> i64
      %3149 = func.call @cc_cons(%3148, %3147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3150 = arith.addi %3149, %__rlasp_stack_elide_zero_153 : i64
      %3151 = func.call @stack_pop_pointer() : () -> i64
      %3152 = func.call @cc_cons(%3151, %3150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3153 = arith.addi %3152, %__rlasp_stack_elide_zero_154 : i64
      %3154 = func.call @stack_pop_pointer() : () -> i64
      %3155 = func.call @cc_cons(%3154, %3153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3156 = arith.addi %3155, %__rlasp_stack_elide_zero_155 : i64
      %3208 = arith.constant 206494159077386 : i64
      %3209 = arith.constant 0 : i64
      %3210 = func.call @cc_make_closure(%3208, %3209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3211 = arith.addi %3210, %__rlasp_stack_elide_zero_156 : i64
      %3212 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3212) : (i64) -> ()
      %3213 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3213) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @cc_cons(%3215, %3214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3217 = arith.addi %3216, %__rlasp_stack_elide_zero_157 : i64
      %3218 = func.call @stack_pop_pointer() : () -> i64
      %3219 = func.call @cc_cons(%3218, %3217) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3220 = arith.addi %3219, %__rlasp_stack_elide_zero_158 : i64
      %3221 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3222 = arith.constant 11 : i64
      %3223 = func.call @cc_make_string(%3221, %3222) : (!llvm.ptr, i64) -> i64
      %3224 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3225 = arith.constant 7 : i64
      %3226 = func.call @cc_make_string(%3224, %3225) : (!llvm.ptr, i64) -> i64
      %3227 = func.call @cc_intern(%3223, %3226) : (i64, i64) -> i64
      %3228 = func.call @cc_nil_value() : () -> i64
      %3229 = func.call @cc_cons(%3227, %3228) : (i64, i64) -> i64
      %3230 = func.call @cc_values_pack(%3229) : (i64) -> i64
      %3231 = func.call @cc_nil_value() : () -> i64
      %3232 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3233 = arith.constant 4 : i64
      %3234 = func.call @cc_make_string(%3232, %3233) : (!llvm.ptr, i64) -> i64
      %3235 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3236 = arith.constant 7 : i64
      %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
      %3238 = func.call @cc_intern(%3234, %3237) : (i64, i64) -> i64
      %3239 = func.call @cc_nil_value() : () -> i64
      %3240 = func.call @cc_cons(%3238, %3239) : (i64, i64) -> i64
      %3241 = func.call @cc_values_pack(%3240) : (i64) -> i64
      %3242 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3243 = arith.constant 6 : i64
      %3244 = func.call @cc_make_string(%3242, %3243) : (!llvm.ptr, i64) -> i64
      %3245 = func.call @cc_nil_value() : () -> i64
      %3246 = func.call @cc_intern(%3244, %3245) : (i64, i64) -> i64
      %3247 = func.call @cc_nil_value() : () -> i64
      %3248 = func.call @cc_cons(%3246, %3247) : (i64, i64) -> i64
      %3249 = func.call @cc_values_pack(%3248) : (i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3250 = arith.addi %3246, %__rlasp_stack_elide_zero_159 : i64
      %3251 = func.call @cc_nil_value() : () -> i64
      %3252 = func.call @cc_errorp(%3066) : (i64) -> i64
      %3253 = arith.cmpi ne, %3252, %3251 : i64
      %3254 = arith.cmpi eq, %3251, %3251 : i64
      %3255 = arith.andi %3253, %3254 : i1
      %3256 = scf.if %3255 -> (i64) {
        scf.yield %3066 : i64
      } else {
        scf.yield %3251 : i64
      }
      %3257 = func.call @cc_errorp(%3156) : (i64) -> i64
      %3258 = arith.cmpi ne, %3257, %3251 : i64
      %3259 = arith.cmpi eq, %3256, %3251 : i64
      %3260 = arith.andi %3258, %3259 : i1
      %3261 = scf.if %3260 -> (i64) {
        scf.yield %3156 : i64
      } else {
        scf.yield %3256 : i64
      }
      %3262 = func.call @cc_errorp(%3211) : (i64) -> i64
      %3263 = arith.cmpi ne, %3262, %3251 : i64
      %3264 = arith.cmpi eq, %3261, %3251 : i64
      %3265 = arith.andi %3263, %3264 : i1
      %3266 = scf.if %3265 -> (i64) {
        scf.yield %3211 : i64
      } else {
        scf.yield %3261 : i64
      }
      %3267 = func.call @cc_errorp(%3220) : (i64) -> i64
      %3268 = arith.cmpi ne, %3267, %3251 : i64
      %3269 = arith.cmpi eq, %3266, %3251 : i64
      %3270 = arith.andi %3268, %3269 : i1
      %3271 = scf.if %3270 -> (i64) {
        scf.yield %3220 : i64
      } else {
        scf.yield %3266 : i64
      }
      %3272 = func.call @cc_errorp(%3227) : (i64) -> i64
      %3273 = arith.cmpi ne, %3272, %3251 : i64
      %3274 = arith.cmpi eq, %3271, %3251 : i64
      %3275 = arith.andi %3273, %3274 : i1
      %3276 = scf.if %3275 -> (i64) {
        scf.yield %3227 : i64
      } else {
        scf.yield %3271 : i64
      }
      %3277 = func.call @cc_errorp(%3231) : (i64) -> i64
      %3278 = arith.cmpi ne, %3277, %3251 : i64
      %3279 = arith.cmpi eq, %3276, %3251 : i64
      %3280 = arith.andi %3278, %3279 : i1
      %3281 = scf.if %3280 -> (i64) {
        scf.yield %3231 : i64
      } else {
        scf.yield %3276 : i64
      }
      %3282 = func.call @cc_errorp(%3238) : (i64) -> i64
      %3283 = arith.cmpi ne, %3282, %3251 : i64
      %3284 = arith.cmpi eq, %3281, %3251 : i64
      %3285 = arith.andi %3283, %3284 : i1
      %3286 = scf.if %3285 -> (i64) {
        scf.yield %3238 : i64
      } else {
        scf.yield %3281 : i64
      }
      %3287 = func.call @cc_errorp(%3250) : (i64) -> i64
      %3288 = arith.cmpi ne, %3287, %3251 : i64
      %3289 = arith.cmpi eq, %3286, %3251 : i64
      %3290 = arith.andi %3288, %3289 : i1
      %3291 = scf.if %3290 -> (i64) {
        scf.yield %3250 : i64
      } else {
        scf.yield %3286 : i64
      }
      %3292 = arith.cmpi ne, %3291, %3251 : i64
      scf.if %3292 {
        func.call @stack_push_pointer(%3291) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3066) : (i64) -> ()
        func.call @stack_push_pointer(%3156) : (i64) -> ()
        func.call @stack_push_pointer(%3211) : (i64) -> ()
        func.call @stack_push_pointer(%3220) : (i64) -> ()
        func.call @stack_push_pointer(%3227) : (i64) -> ()
        func.call @stack_push_pointer(%3231) : (i64) -> ()
        func.call @stack_push_pointer(%3238) : (i64) -> ()
        func.call @stack_push_pointer(%3250) : (i64) -> ()
        %3293 = llvm.mlir.addressof @str322 : !llvm.ptr
        %3294 = func.call @cc_make_function_ref_const(%3293) : (!llvm.ptr) -> i64
        %3295 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3294, %3295) : (i64, i64) -> ()
      }
      %3296 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3296 : i64
    }
    %3297 = func.call @cc_nil_value() : () -> i64
    %3298 = func.call @cc_errorp(%3057) : (i64) -> i64
    %3299 = arith.cmpi ne, %3298, %3297 : i64
    %3300 = scf.if %3299 -> (i64) {
      scf.yield %3057 : i64
    } else {
      %3301 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3302 = arith.constant 16 : i64
      %3303 = func.call @cc_make_string(%3301, %3302) : (!llvm.ptr, i64) -> i64
      %3304 = func.call @cc_nil_value() : () -> i64
      %3305 = func.call @cc_intern(%3303, %3304) : (i64, i64) -> i64
      %3306 = func.call @cc_nil_value() : () -> i64
      %3307 = func.call @cc_cons(%3305, %3306) : (i64, i64) -> i64
      %3308 = func.call @cc_values_pack(%3307) : (i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3309 = arith.addi %3305, %__rlasp_stack_elide_zero_160 : i64
      %3310 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3311 = arith.constant 8 : i64
      %3312 = func.call @cc_make_string(%3310, %3311) : (!llvm.ptr, i64) -> i64
      %3313 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3314 = arith.constant 11 : i64
      %3315 = func.call @cc_make_string(%3313, %3314) : (!llvm.ptr, i64) -> i64
      %3316 = func.call @cc_intern(%3312, %3315) : (i64, i64) -> i64
      %3317 = func.call @cc_nil_value() : () -> i64
      %3318 = func.call @cc_cons(%3316, %3317) : (i64, i64) -> i64
      %3319 = func.call @cc_values_pack(%3318) : (i64) -> i64
      func.call @stack_push_pointer(%3316) : (i64) -> ()
      %3320 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3321 = arith.constant 7 : i64
      %3322 = func.call @cc_make_string(%3320, %3321) : (!llvm.ptr, i64) -> i64
      %3323 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3324 = arith.constant 11 : i64
      %3325 = func.call @cc_make_string(%3323, %3324) : (!llvm.ptr, i64) -> i64
      %3326 = func.call @cc_intern(%3322, %3325) : (i64, i64) -> i64
      %3327 = func.call @cc_nil_value() : () -> i64
      %3328 = func.call @cc_cons(%3326, %3327) : (i64, i64) -> i64
      %3329 = func.call @cc_values_pack(%3328) : (i64) -> i64
      func.call @stack_push_pointer(%3326) : (i64) -> ()
      %3330 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3331 = arith.constant 8 : i64
      %3332 = func.call @cc_make_string(%3330, %3331) : (!llvm.ptr, i64) -> i64
      %3333 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3334 = arith.constant 11 : i64
      %3335 = func.call @cc_make_string(%3333, %3334) : (!llvm.ptr, i64) -> i64
      %3336 = func.call @cc_intern(%3332, %3335) : (i64, i64) -> i64
      %3337 = func.call @cc_nil_value() : () -> i64
      %3338 = func.call @cc_cons(%3336, %3337) : (i64, i64) -> i64
      %3339 = func.call @cc_values_pack(%3338) : (i64) -> i64
      func.call @stack_push_pointer(%3336) : (i64) -> ()
      %3340 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3341 = arith.constant 3 : i64
      %3342 = func.call @cc_make_string(%3340, %3341) : (!llvm.ptr, i64) -> i64
      %3343 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3344 = arith.constant 11 : i64
      %3345 = func.call @cc_make_string(%3343, %3344) : (!llvm.ptr, i64) -> i64
      %3346 = func.call @cc_intern(%3342, %3345) : (i64, i64) -> i64
      %3347 = func.call @cc_nil_value() : () -> i64
      %3348 = func.call @cc_cons(%3346, %3347) : (i64, i64) -> i64
      %3349 = func.call @cc_values_pack(%3348) : (i64) -> i64
      func.call @stack_push_pointer(%3346) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3350 = func.call @stack_pop_pointer() : () -> i64
      %3351 = func.call @stack_pop_pointer() : () -> i64
      %3352 = func.call @cc_cons(%3351, %3350) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3353 = arith.addi %3352, %__rlasp_stack_elide_zero_161 : i64
      %3354 = func.call @stack_pop_pointer() : () -> i64
      %3355 = func.call @cc_cons(%3354, %3353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3355) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3356 = func.call @stack_pop_pointer() : () -> i64
      %3357 = func.call @stack_pop_pointer() : () -> i64
      %3358 = func.call @cc_cons(%3357, %3356) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3359 = arith.addi %3358, %__rlasp_stack_elide_zero_162 : i64
      %3360 = func.call @stack_pop_pointer() : () -> i64
      %3361 = func.call @cc_cons(%3360, %3359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3361) : (i64) -> ()
      %3362 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3362) : (i64) -> ()
      %3363 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3364 = arith.constant 8 : i64
      %3365 = func.call @cc_make_string(%3363, %3364) : (!llvm.ptr, i64) -> i64
      %3366 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3367 = arith.constant 11 : i64
      %3368 = func.call @cc_make_string(%3366, %3367) : (!llvm.ptr, i64) -> i64
      %3369 = func.call @cc_intern(%3365, %3368) : (i64, i64) -> i64
      %3370 = func.call @cc_nil_value() : () -> i64
      %3371 = func.call @cc_cons(%3369, %3370) : (i64, i64) -> i64
      %3372 = func.call @cc_values_pack(%3371) : (i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3373 = arith.addi %3369, %__rlasp_stack_elide_zero_163 : i64
      %3374 = func.call @stack_pop_pointer() : () -> i64
      %3375 = func.call @cc_cons(%3373, %3374) : (i64, i64) -> i64
      %3376 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3377 = arith.constant 5 : i64
      %3378 = func.call @cc_make_string(%3376, %3377) : (!llvm.ptr, i64) -> i64
      %3379 = func.call @cc_nil_value() : () -> i64
      %3380 = func.call @cc_intern(%3378, %3379) : (i64, i64) -> i64
      %3381 = func.call @cc_nil_value() : () -> i64
      %3382 = func.call @cc_cons(%3380, %3381) : (i64, i64) -> i64
      %3383 = func.call @cc_values_pack(%3382) : (i64) -> i64
      %3384 = func.call @cc_cons(%3380, %3375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3384) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3385 = func.call @stack_pop_pointer() : () -> i64
      %3386 = func.call @stack_pop_pointer() : () -> i64
      %3387 = func.call @cc_cons(%3386, %3385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3388 = arith.addi %3387, %__rlasp_stack_elide_zero_164 : i64
      %3389 = func.call @stack_pop_pointer() : () -> i64
      %3390 = func.call @cc_cons(%3389, %3388) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3391 = arith.addi %3390, %__rlasp_stack_elide_zero_165 : i64
      %3392 = func.call @stack_pop_pointer() : () -> i64
      %3393 = func.call @cc_cons(%3392, %3391) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3394 = arith.addi %3393, %__rlasp_stack_elide_zero_166 : i64
      %3418 = arith.constant 206494159077387 : i64
      %3419 = arith.constant 0 : i64
      %3420 = func.call @cc_make_closure(%3418, %3419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3421 = arith.addi %3420, %__rlasp_stack_elide_zero_167 : i64
      %3422 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3422) : (i64) -> ()
      %3423 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3423) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3424 = func.call @stack_pop_pointer() : () -> i64
      %3425 = func.call @stack_pop_pointer() : () -> i64
      %3426 = func.call @cc_cons(%3425, %3424) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3427 = arith.addi %3426, %__rlasp_stack_elide_zero_168 : i64
      %3428 = func.call @stack_pop_pointer() : () -> i64
      %3429 = func.call @cc_cons(%3428, %3427) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3430 = arith.addi %3429, %__rlasp_stack_elide_zero_169 : i64
      %3431 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3432 = arith.constant 11 : i64
      %3433 = func.call @cc_make_string(%3431, %3432) : (!llvm.ptr, i64) -> i64
      %3434 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3435 = arith.constant 7 : i64
      %3436 = func.call @cc_make_string(%3434, %3435) : (!llvm.ptr, i64) -> i64
      %3437 = func.call @cc_intern(%3433, %3436) : (i64, i64) -> i64
      %3438 = func.call @cc_nil_value() : () -> i64
      %3439 = func.call @cc_cons(%3437, %3438) : (i64, i64) -> i64
      %3440 = func.call @cc_values_pack(%3439) : (i64) -> i64
      %3441 = func.call @cc_nil_value() : () -> i64
      %3442 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3443 = arith.constant 4 : i64
      %3444 = func.call @cc_make_string(%3442, %3443) : (!llvm.ptr, i64) -> i64
      %3445 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3446 = arith.constant 7 : i64
      %3447 = func.call @cc_make_string(%3445, %3446) : (!llvm.ptr, i64) -> i64
      %3448 = func.call @cc_intern(%3444, %3447) : (i64, i64) -> i64
      %3449 = func.call @cc_nil_value() : () -> i64
      %3450 = func.call @cc_cons(%3448, %3449) : (i64, i64) -> i64
      %3451 = func.call @cc_values_pack(%3450) : (i64) -> i64
      %3452 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3453 = arith.constant 6 : i64
      %3454 = func.call @cc_make_string(%3452, %3453) : (!llvm.ptr, i64) -> i64
      %3455 = func.call @cc_nil_value() : () -> i64
      %3456 = func.call @cc_intern(%3454, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_nil_value() : () -> i64
      %3458 = func.call @cc_cons(%3456, %3457) : (i64, i64) -> i64
      %3459 = func.call @cc_values_pack(%3458) : (i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3460 = arith.addi %3456, %__rlasp_stack_elide_zero_170 : i64
      %3461 = func.call @cc_nil_value() : () -> i64
      %3462 = func.call @cc_errorp(%3309) : (i64) -> i64
      %3463 = arith.cmpi ne, %3462, %3461 : i64
      %3464 = arith.cmpi eq, %3461, %3461 : i64
      %3465 = arith.andi %3463, %3464 : i1
      %3466 = scf.if %3465 -> (i64) {
        scf.yield %3309 : i64
      } else {
        scf.yield %3461 : i64
      }
      %3467 = func.call @cc_errorp(%3394) : (i64) -> i64
      %3468 = arith.cmpi ne, %3467, %3461 : i64
      %3469 = arith.cmpi eq, %3466, %3461 : i64
      %3470 = arith.andi %3468, %3469 : i1
      %3471 = scf.if %3470 -> (i64) {
        scf.yield %3394 : i64
      } else {
        scf.yield %3466 : i64
      }
      %3472 = func.call @cc_errorp(%3421) : (i64) -> i64
      %3473 = arith.cmpi ne, %3472, %3461 : i64
      %3474 = arith.cmpi eq, %3471, %3461 : i64
      %3475 = arith.andi %3473, %3474 : i1
      %3476 = scf.if %3475 -> (i64) {
        scf.yield %3421 : i64
      } else {
        scf.yield %3471 : i64
      }
      %3477 = func.call @cc_errorp(%3430) : (i64) -> i64
      %3478 = arith.cmpi ne, %3477, %3461 : i64
      %3479 = arith.cmpi eq, %3476, %3461 : i64
      %3480 = arith.andi %3478, %3479 : i1
      %3481 = scf.if %3480 -> (i64) {
        scf.yield %3430 : i64
      } else {
        scf.yield %3476 : i64
      }
      %3482 = func.call @cc_errorp(%3437) : (i64) -> i64
      %3483 = arith.cmpi ne, %3482, %3461 : i64
      %3484 = arith.cmpi eq, %3481, %3461 : i64
      %3485 = arith.andi %3483, %3484 : i1
      %3486 = scf.if %3485 -> (i64) {
        scf.yield %3437 : i64
      } else {
        scf.yield %3481 : i64
      }
      %3487 = func.call @cc_errorp(%3441) : (i64) -> i64
      %3488 = arith.cmpi ne, %3487, %3461 : i64
      %3489 = arith.cmpi eq, %3486, %3461 : i64
      %3490 = arith.andi %3488, %3489 : i1
      %3491 = scf.if %3490 -> (i64) {
        scf.yield %3441 : i64
      } else {
        scf.yield %3486 : i64
      }
      %3492 = func.call @cc_errorp(%3448) : (i64) -> i64
      %3493 = arith.cmpi ne, %3492, %3461 : i64
      %3494 = arith.cmpi eq, %3491, %3461 : i64
      %3495 = arith.andi %3493, %3494 : i1
      %3496 = scf.if %3495 -> (i64) {
        scf.yield %3448 : i64
      } else {
        scf.yield %3491 : i64
      }
      %3497 = func.call @cc_errorp(%3460) : (i64) -> i64
      %3498 = arith.cmpi ne, %3497, %3461 : i64
      %3499 = arith.cmpi eq, %3496, %3461 : i64
      %3500 = arith.andi %3498, %3499 : i1
      %3501 = scf.if %3500 -> (i64) {
        scf.yield %3460 : i64
      } else {
        scf.yield %3496 : i64
      }
      %3502 = arith.cmpi ne, %3501, %3461 : i64
      scf.if %3502 {
        func.call @stack_push_pointer(%3501) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3309) : (i64) -> ()
        func.call @stack_push_pointer(%3394) : (i64) -> ()
        func.call @stack_push_pointer(%3421) : (i64) -> ()
        func.call @stack_push_pointer(%3430) : (i64) -> ()
        func.call @stack_push_pointer(%3437) : (i64) -> ()
        func.call @stack_push_pointer(%3441) : (i64) -> ()
        func.call @stack_push_pointer(%3448) : (i64) -> ()
        func.call @stack_push_pointer(%3460) : (i64) -> ()
        %3503 = llvm.mlir.addressof @str343 : !llvm.ptr
        %3504 = func.call @cc_make_function_ref_const(%3503) : (!llvm.ptr) -> i64
        %3505 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3504, %3505) : (i64, i64) -> ()
      }
      %3506 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3506 : i64
    }
    %3507 = func.call @cc_nil_value() : () -> i64
    %3508 = func.call @cc_errorp(%3300) : (i64) -> i64
    %3509 = arith.cmpi ne, %3508, %3507 : i64
    %3510 = scf.if %3509 -> (i64) {
      scf.yield %3300 : i64
    } else {
      %3511 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3512 = arith.constant 9 : i64
      %3513 = func.call @cc_make_string(%3511, %3512) : (!llvm.ptr, i64) -> i64
      %3514 = func.call @cc_nil_value() : () -> i64
      %3515 = func.call @cc_intern(%3513, %3514) : (i64, i64) -> i64
      %3516 = func.call @cc_nil_value() : () -> i64
      %3517 = func.call @cc_cons(%3515, %3516) : (i64, i64) -> i64
      %3518 = func.call @cc_values_pack(%3517) : (i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3519 = arith.addi %3515, %__rlasp_stack_elide_zero_171 : i64
      %3520 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3521 = arith.constant 3 : i64
      %3522 = func.call @cc_make_string(%3520, %3521) : (!llvm.ptr, i64) -> i64
      %3523 = func.call @cc_nil_value() : () -> i64
      %3524 = func.call @cc_intern(%3522, %3523) : (i64, i64) -> i64
      %3525 = func.call @cc_nil_value() : () -> i64
      %3526 = func.call @cc_cons(%3524, %3525) : (i64, i64) -> i64
      %3527 = func.call @cc_values_pack(%3526) : (i64) -> i64
      func.call @stack_push_pointer(%3524) : (i64) -> ()
      %3528 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3529 = arith.constant 3 : i64
      %3530 = func.call @cc_make_string(%3528, %3529) : (!llvm.ptr, i64) -> i64
      %3531 = func.call @cc_nil_value() : () -> i64
      %3532 = func.call @cc_intern(%3530, %3531) : (i64, i64) -> i64
      %3533 = func.call @cc_nil_value() : () -> i64
      %3534 = func.call @cc_cons(%3532, %3533) : (i64, i64) -> i64
      %3535 = func.call @cc_values_pack(%3534) : (i64) -> i64
      func.call @stack_push_pointer(%3532) : (i64) -> ()
      %3536 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3537 = arith.constant 3 : i64
      %3538 = func.call @cc_make_string(%3536, %3537) : (!llvm.ptr, i64) -> i64
      %3539 = func.call @cc_nil_value() : () -> i64
      %3540 = func.call @cc_intern(%3538, %3539) : (i64, i64) -> i64
      %3541 = func.call @cc_nil_value() : () -> i64
      %3542 = func.call @cc_cons(%3540, %3541) : (i64, i64) -> i64
      %3543 = func.call @cc_values_pack(%3542) : (i64) -> i64
      func.call @stack_push_pointer(%3540) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3544 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3545 = arith.constant 5 : i64
      %3546 = func.call @cc_make_string(%3544, %3545) : (!llvm.ptr, i64) -> i64
      %3547 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3548 = arith.constant 11 : i64
      %3549 = func.call @cc_make_string(%3547, %3548) : (!llvm.ptr, i64) -> i64
      %3550 = func.call @cc_intern(%3546, %3549) : (i64, i64) -> i64
      %3551 = func.call @cc_nil_value() : () -> i64
      %3552 = func.call @cc_cons(%3550, %3551) : (i64, i64) -> i64
      %3553 = func.call @cc_values_pack(%3552) : (i64) -> i64
      func.call @stack_push_pointer(%3550) : (i64) -> ()
      %3554 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3555 = arith.constant 1 : i64
      %3556 = func.call @cc_make_string(%3554, %3555) : (!llvm.ptr, i64) -> i64
      %3557 = func.call @cc_nil_value() : () -> i64
      %3558 = func.call @cc_intern(%3556, %3557) : (i64, i64) -> i64
      %3559 = func.call @cc_nil_value() : () -> i64
      %3560 = func.call @cc_cons(%3558, %3559) : (i64, i64) -> i64
      %3561 = func.call @cc_values_pack(%3560) : (i64) -> i64
      %3562 = func.call @cc_symbol_value(%3558) : (i64) -> i64
      func.call @stack_push_pointer(%3562) : (i64) -> ()
      %3563 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3564 = arith.constant 1 : i64
      %3565 = func.call @cc_make_string(%3563, %3564) : (!llvm.ptr, i64) -> i64
      %3566 = func.call @cc_nil_value() : () -> i64
      %3567 = func.call @cc_intern(%3565, %3566) : (i64, i64) -> i64
      %3568 = func.call @cc_nil_value() : () -> i64
      %3569 = func.call @cc_cons(%3567, %3568) : (i64, i64) -> i64
      %3570 = func.call @cc_values_pack(%3569) : (i64) -> i64
      %3571 = func.call @cc_symbol_value(%3567) : (i64) -> i64
      func.call @stack_push_pointer(%3571) : (i64) -> ()
      %3572 = llvm.mlir.addressof @str352 : !llvm.ptr
      %3573 = arith.constant 1 : i64
      %3574 = func.call @cc_make_string(%3572, %3573) : (!llvm.ptr, i64) -> i64
      %3575 = func.call @cc_nil_value() : () -> i64
      %3576 = func.call @cc_intern(%3574, %3575) : (i64, i64) -> i64
      %3577 = func.call @cc_nil_value() : () -> i64
      %3578 = func.call @cc_cons(%3576, %3577) : (i64, i64) -> i64
      %3579 = func.call @cc_values_pack(%3578) : (i64) -> i64
      %3580 = func.call @cc_symbol_value(%3576) : (i64) -> i64
      func.call @stack_push_pointer(%3580) : (i64) -> ()
      %3581 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3582 = arith.constant 1 : i64
      %3583 = func.call @cc_make_string(%3581, %3582) : (!llvm.ptr, i64) -> i64
      %3584 = func.call @cc_nil_value() : () -> i64
      %3585 = func.call @cc_intern(%3583, %3584) : (i64, i64) -> i64
      %3586 = func.call @cc_nil_value() : () -> i64
      %3587 = func.call @cc_cons(%3585, %3586) : (i64, i64) -> i64
      %3588 = func.call @cc_values_pack(%3587) : (i64) -> i64
      %3589 = func.call @cc_symbol_value(%3585) : (i64) -> i64
      func.call @stack_push_pointer(%3589) : (i64) -> ()
      %3590 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3591 = arith.constant 1 : i64
      %3592 = func.call @cc_make_string(%3590, %3591) : (!llvm.ptr, i64) -> i64
      %3593 = func.call @cc_nil_value() : () -> i64
      %3594 = func.call @cc_intern(%3592, %3593) : (i64, i64) -> i64
      %3595 = func.call @cc_nil_value() : () -> i64
      %3596 = func.call @cc_cons(%3594, %3595) : (i64, i64) -> i64
      %3597 = func.call @cc_values_pack(%3596) : (i64) -> i64
      %3598 = func.call @cc_symbol_value(%3594) : (i64) -> i64
      func.call @stack_push_pointer(%3598) : (i64) -> ()
      %3599 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3600 = arith.constant 1 : i64
      %3601 = func.call @cc_make_string(%3599, %3600) : (!llvm.ptr, i64) -> i64
      %3602 = func.call @cc_nil_value() : () -> i64
      %3603 = func.call @cc_intern(%3601, %3602) : (i64, i64) -> i64
      %3604 = func.call @cc_nil_value() : () -> i64
      %3605 = func.call @cc_cons(%3603, %3604) : (i64, i64) -> i64
      %3606 = func.call @cc_values_pack(%3605) : (i64) -> i64
      %3607 = func.call @cc_symbol_value(%3603) : (i64) -> i64
      func.call @stack_push_pointer(%3607) : (i64) -> ()
      %3608 = arith.constant 6 : i64
      %3609 = func.call @cc_box_fixnum(%3608) : (i64) -> i64
      %3610 = func.call @cc_make_vector(%3609) : (i64) -> i64
      %3611 = func.call @stack_pop_pointer() : () -> i64
      %3612 = arith.constant 5 : i64
      %3613 = func.call @cc_box_fixnum(%3612) : (i64) -> i64
      %3614 = func.call @cc_svset(%3610, %3613, %3611) : (i64, i64, i64) -> i64
      %3615 = func.call @stack_pop_pointer() : () -> i64
      %3616 = arith.constant 4 : i64
      %3617 = func.call @cc_box_fixnum(%3616) : (i64) -> i64
      %3618 = func.call @cc_svset(%3610, %3617, %3615) : (i64, i64, i64) -> i64
      %3619 = func.call @stack_pop_pointer() : () -> i64
      %3620 = arith.constant 3 : i64
      %3621 = func.call @cc_box_fixnum(%3620) : (i64) -> i64
      %3622 = func.call @cc_svset(%3610, %3621, %3619) : (i64, i64, i64) -> i64
      %3623 = func.call @stack_pop_pointer() : () -> i64
      %3624 = arith.constant 2 : i64
      %3625 = func.call @cc_box_fixnum(%3624) : (i64) -> i64
      %3626 = func.call @cc_svset(%3610, %3625, %3623) : (i64, i64, i64) -> i64
      %3627 = func.call @stack_pop_pointer() : () -> i64
      %3628 = arith.constant 1 : i64
      %3629 = func.call @cc_box_fixnum(%3628) : (i64) -> i64
      %3630 = func.call @cc_svset(%3610, %3629, %3627) : (i64, i64, i64) -> i64
      %3631 = func.call @stack_pop_pointer() : () -> i64
      %3632 = arith.constant 0 : i64
      %3633 = func.call @cc_box_fixnum(%3632) : (i64) -> i64
      %3634 = func.call @cc_svset(%3610, %3633, %3631) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3610) : (i64) -> ()
      %3635 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3635) : (i64) -> ()
      %3636 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3637 = arith.constant 12 : i64
      %3638 = func.call @cc_make_string(%3636, %3637) : (!llvm.ptr, i64) -> i64
      %3639 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3640 = arith.constant 11 : i64
      %3641 = func.call @cc_make_string(%3639, %3640) : (!llvm.ptr, i64) -> i64
      %3642 = func.call @cc_intern(%3638, %3641) : (i64, i64) -> i64
      %3643 = func.call @cc_nil_value() : () -> i64
      %3644 = func.call @cc_cons(%3642, %3643) : (i64, i64) -> i64
      %3645 = func.call @cc_values_pack(%3644) : (i64) -> i64
      func.call @stack_push_pointer(%3642) : (i64) -> ()
      %3646 = llvm.mlir.addressof @str358 : !llvm.ptr
      %3647 = arith.constant 1 : i64
      %3648 = func.call @cc_make_string(%3646, %3647) : (!llvm.ptr, i64) -> i64
      %3649 = llvm.mlir.addressof @str359 : !llvm.ptr
      %3650 = arith.constant 11 : i64
      %3651 = func.call @cc_make_string(%3649, %3650) : (!llvm.ptr, i64) -> i64
      %3652 = func.call @cc_intern(%3648, %3651) : (i64, i64) -> i64
      %3653 = func.call @cc_nil_value() : () -> i64
      %3654 = func.call @cc_cons(%3652, %3653) : (i64, i64) -> i64
      %3655 = func.call @cc_values_pack(%3654) : (i64) -> i64
      func.call @stack_push_pointer(%3652) : (i64) -> ()
      %3656 = llvm.mlir.addressof @str360 : !llvm.ptr
      %3657 = arith.constant 1 : i64
      %3658 = func.call @cc_make_string(%3656, %3657) : (!llvm.ptr, i64) -> i64
      %3659 = llvm.mlir.addressof @str361 : !llvm.ptr
      %3660 = arith.constant 11 : i64
      %3661 = func.call @cc_make_string(%3659, %3660) : (!llvm.ptr, i64) -> i64
      %3662 = func.call @cc_intern(%3658, %3661) : (i64, i64) -> i64
      %3663 = func.call @cc_nil_value() : () -> i64
      %3664 = func.call @cc_cons(%3662, %3663) : (i64, i64) -> i64
      %3665 = func.call @cc_values_pack(%3664) : (i64) -> i64
      func.call @stack_push_pointer(%3662) : (i64) -> ()
      %3666 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3666) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3667 = func.call @stack_pop_pointer() : () -> i64
      %3668 = func.call @stack_pop_pointer() : () -> i64
      %3669 = func.call @cc_cons(%3668, %3667) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3670 = arith.addi %3669, %__rlasp_stack_elide_zero_172 : i64
      %3671 = func.call @stack_pop_pointer() : () -> i64
      %3672 = func.call @cc_cons(%3671, %3670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3672) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3673 = func.call @stack_pop_pointer() : () -> i64
      %3674 = func.call @stack_pop_pointer() : () -> i64
      %3675 = func.call @cc_cons(%3674, %3673) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3676 = arith.addi %3675, %__rlasp_stack_elide_zero_173 : i64
      %3677 = func.call @stack_pop_pointer() : () -> i64
      %3678 = func.call @cc_cons(%3677, %3676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3679 = arith.addi %3678, %__rlasp_stack_elide_zero_174 : i64
      %3680 = func.call @stack_pop_pointer() : () -> i64
      %3681 = func.call @cc_cons(%3680, %3679) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3682 = arith.addi %3681, %__rlasp_stack_elide_zero_175 : i64
      %3683 = func.call @stack_pop_pointer() : () -> i64
      %3684 = func.call @cc_cons(%3682, %3683) : (i64, i64) -> i64
      %3685 = llvm.mlir.addressof @str362 : !llvm.ptr
      %3686 = arith.constant 5 : i64
      %3687 = func.call @cc_make_string(%3685, %3686) : (!llvm.ptr, i64) -> i64
      %3688 = func.call @cc_nil_value() : () -> i64
      %3689 = func.call @cc_intern(%3687, %3688) : (i64, i64) -> i64
      %3690 = func.call @cc_nil_value() : () -> i64
      %3691 = func.call @cc_cons(%3689, %3690) : (i64, i64) -> i64
      %3692 = func.call @cc_values_pack(%3691) : (i64) -> i64
      %3693 = func.call @cc_cons(%3689, %3684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3693) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3694 = func.call @stack_pop_pointer() : () -> i64
      %3695 = func.call @stack_pop_pointer() : () -> i64
      %3696 = func.call @cc_cons(%3695, %3694) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3697 = arith.addi %3696, %__rlasp_stack_elide_zero_176 : i64
      %3698 = func.call @stack_pop_pointer() : () -> i64
      %3699 = func.call @cc_cons(%3698, %3697) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3700 = arith.addi %3699, %__rlasp_stack_elide_zero_177 : i64
      %3701 = func.call @stack_pop_pointer() : () -> i64
      %3702 = func.call @cc_cons(%3701, %3700) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3703 = func.call @stack_pop_pointer() : () -> i64
      %3704 = func.call @stack_pop_pointer() : () -> i64
      %3705 = func.call @cc_cons(%3704, %3703) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3706 = arith.addi %3705, %__rlasp_stack_elide_zero_178 : i64
      %3707 = func.call @stack_pop_pointer() : () -> i64
      %3708 = func.call @cc_cons(%3707, %3706) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3709 = arith.addi %3708, %__rlasp_stack_elide_zero_179 : i64
      %3710 = func.call @stack_pop_pointer() : () -> i64
      %3711 = func.call @cc_cons(%3710, %3709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3712 = func.call @stack_pop_pointer() : () -> i64
      %3713 = func.call @stack_pop_pointer() : () -> i64
      %3714 = func.call @cc_cons(%3713, %3712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3715 = arith.addi %3714, %__rlasp_stack_elide_zero_180 : i64
      %3716 = func.call @stack_pop_pointer() : () -> i64
      %3717 = func.call @cc_cons(%3716, %3715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3717) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3718 = func.call @stack_pop_pointer() : () -> i64
      %3719 = func.call @stack_pop_pointer() : () -> i64
      %3720 = func.call @cc_cons(%3719, %3718) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3721 = arith.addi %3720, %__rlasp_stack_elide_zero_181 : i64
      %3722 = func.call @stack_pop_pointer() : () -> i64
      %3723 = func.call @cc_cons(%3722, %3721) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3724 = arith.addi %3723, %__rlasp_stack_elide_zero_182 : i64
      %3833 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3834 = arith.constant 30 : i64
      %3835 = func.call @cc_make_symbol(%3833, %3834) : (!llvm.ptr, i64) -> i64
      %3836 = func.call @cc_persistent_root_value(%3835) : (i64) -> i64
      func.call @stack_push_pointer(%3836) : (i64) -> ()
      %3837 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3838 = arith.constant 30 : i64
      %3839 = func.call @cc_make_symbol(%3837, %3838) : (!llvm.ptr, i64) -> i64
      %3840 = func.call @cc_persistent_root_value(%3839) : (i64) -> i64
      func.call @stack_push_pointer(%3840) : (i64) -> ()
      %3841 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3842 = arith.constant 30 : i64
      %3843 = func.call @cc_make_symbol(%3841, %3842) : (!llvm.ptr, i64) -> i64
      %3844 = func.call @cc_persistent_root_value(%3843) : (i64) -> i64
      func.call @stack_push_pointer(%3844) : (i64) -> ()
      %3845 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3846 = arith.constant 30 : i64
      %3847 = func.call @cc_make_symbol(%3845, %3846) : (!llvm.ptr, i64) -> i64
      %3848 = func.call @cc_persistent_root_value(%3847) : (i64) -> i64
      func.call @stack_push_pointer(%3848) : (i64) -> ()
      %3849 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3850 = arith.constant 30 : i64
      %3851 = func.call @cc_make_symbol(%3849, %3850) : (!llvm.ptr, i64) -> i64
      %3852 = func.call @cc_persistent_root_value(%3851) : (i64) -> i64
      func.call @stack_push_pointer(%3852) : (i64) -> ()
      %3853 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3854 = arith.constant 30 : i64
      %3855 = func.call @cc_make_symbol(%3853, %3854) : (!llvm.ptr, i64) -> i64
      %3856 = func.call @cc_persistent_root_value(%3855) : (i64) -> i64
      func.call @stack_push_pointer(%3856) : (i64) -> ()
      %3857 = arith.constant 206494159077388 : i64
      %3858 = arith.constant 6 : i64
      %3859 = func.call @cc_make_closure(%3857, %3858) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3860 = arith.addi %3859, %__rlasp_stack_elide_zero_183 : i64
      %3861 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3862 = arith.constant 1 : i64
      %3863 = func.call @cc_make_string(%3861, %3862) : (!llvm.ptr, i64) -> i64
      %3864 = func.call @cc_nil_value() : () -> i64
      %3865 = func.call @cc_intern(%3863, %3864) : (i64, i64) -> i64
      %3866 = func.call @cc_nil_value() : () -> i64
      %3867 = func.call @cc_cons(%3865, %3866) : (i64, i64) -> i64
      %3868 = func.call @cc_values_pack(%3867) : (i64) -> i64
      func.call @stack_push_pointer(%3865) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3869 = func.call @stack_pop_pointer() : () -> i64
      %3870 = func.call @stack_pop_pointer() : () -> i64
      %3871 = func.call @cc_cons(%3870, %3869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3872 = arith.addi %3871, %__rlasp_stack_elide_zero_184 : i64
      %3873 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3874 = arith.constant 11 : i64
      %3875 = func.call @cc_make_string(%3873, %3874) : (!llvm.ptr, i64) -> i64
      %3876 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3877 = arith.constant 7 : i64
      %3878 = func.call @cc_make_string(%3876, %3877) : (!llvm.ptr, i64) -> i64
      %3879 = func.call @cc_intern(%3875, %3878) : (i64, i64) -> i64
      %3880 = func.call @cc_nil_value() : () -> i64
      %3881 = func.call @cc_cons(%3879, %3880) : (i64, i64) -> i64
      %3882 = func.call @cc_values_pack(%3881) : (i64) -> i64
      %3883 = func.call @cc_nil_value() : () -> i64
      %3884 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3885 = arith.constant 4 : i64
      %3886 = func.call @cc_make_string(%3884, %3885) : (!llvm.ptr, i64) -> i64
      %3887 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3888 = arith.constant 7 : i64
      %3889 = func.call @cc_make_string(%3887, %3888) : (!llvm.ptr, i64) -> i64
      %3890 = func.call @cc_intern(%3886, %3889) : (i64, i64) -> i64
      %3891 = func.call @cc_nil_value() : () -> i64
      %3892 = func.call @cc_cons(%3890, %3891) : (i64, i64) -> i64
      %3893 = func.call @cc_values_pack(%3892) : (i64) -> i64
      %3894 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3895 = arith.constant 6 : i64
      %3896 = func.call @cc_make_string(%3894, %3895) : (!llvm.ptr, i64) -> i64
      %3897 = func.call @cc_nil_value() : () -> i64
      %3898 = func.call @cc_intern(%3896, %3897) : (i64, i64) -> i64
      %3899 = func.call @cc_nil_value() : () -> i64
      %3900 = func.call @cc_cons(%3898, %3899) : (i64, i64) -> i64
      %3901 = func.call @cc_values_pack(%3900) : (i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3902 = arith.addi %3898, %__rlasp_stack_elide_zero_185 : i64
      %3903 = func.call @cc_nil_value() : () -> i64
      %3904 = func.call @cc_errorp(%3519) : (i64) -> i64
      %3905 = arith.cmpi ne, %3904, %3903 : i64
      %3906 = arith.cmpi eq, %3903, %3903 : i64
      %3907 = arith.andi %3905, %3906 : i1
      %3908 = scf.if %3907 -> (i64) {
        scf.yield %3519 : i64
      } else {
        scf.yield %3903 : i64
      }
      %3909 = func.call @cc_errorp(%3724) : (i64) -> i64
      %3910 = arith.cmpi ne, %3909, %3903 : i64
      %3911 = arith.cmpi eq, %3908, %3903 : i64
      %3912 = arith.andi %3910, %3911 : i1
      %3913 = scf.if %3912 -> (i64) {
        scf.yield %3724 : i64
      } else {
        scf.yield %3908 : i64
      }
      %3914 = func.call @cc_errorp(%3860) : (i64) -> i64
      %3915 = arith.cmpi ne, %3914, %3903 : i64
      %3916 = arith.cmpi eq, %3913, %3903 : i64
      %3917 = arith.andi %3915, %3916 : i1
      %3918 = scf.if %3917 -> (i64) {
        scf.yield %3860 : i64
      } else {
        scf.yield %3913 : i64
      }
      %3919 = func.call @cc_errorp(%3872) : (i64) -> i64
      %3920 = arith.cmpi ne, %3919, %3903 : i64
      %3921 = arith.cmpi eq, %3918, %3903 : i64
      %3922 = arith.andi %3920, %3921 : i1
      %3923 = scf.if %3922 -> (i64) {
        scf.yield %3872 : i64
      } else {
        scf.yield %3918 : i64
      }
      %3924 = func.call @cc_errorp(%3879) : (i64) -> i64
      %3925 = arith.cmpi ne, %3924, %3903 : i64
      %3926 = arith.cmpi eq, %3923, %3903 : i64
      %3927 = arith.andi %3925, %3926 : i1
      %3928 = scf.if %3927 -> (i64) {
        scf.yield %3879 : i64
      } else {
        scf.yield %3923 : i64
      }
      %3929 = func.call @cc_errorp(%3883) : (i64) -> i64
      %3930 = arith.cmpi ne, %3929, %3903 : i64
      %3931 = arith.cmpi eq, %3928, %3903 : i64
      %3932 = arith.andi %3930, %3931 : i1
      %3933 = scf.if %3932 -> (i64) {
        scf.yield %3883 : i64
      } else {
        scf.yield %3928 : i64
      }
      %3934 = func.call @cc_errorp(%3890) : (i64) -> i64
      %3935 = arith.cmpi ne, %3934, %3903 : i64
      %3936 = arith.cmpi eq, %3933, %3903 : i64
      %3937 = arith.andi %3935, %3936 : i1
      %3938 = scf.if %3937 -> (i64) {
        scf.yield %3890 : i64
      } else {
        scf.yield %3933 : i64
      }
      %3939 = func.call @cc_errorp(%3902) : (i64) -> i64
      %3940 = arith.cmpi ne, %3939, %3903 : i64
      %3941 = arith.cmpi eq, %3938, %3903 : i64
      %3942 = arith.andi %3940, %3941 : i1
      %3943 = scf.if %3942 -> (i64) {
        scf.yield %3902 : i64
      } else {
        scf.yield %3938 : i64
      }
      %3944 = arith.cmpi ne, %3943, %3903 : i64
      scf.if %3944 {
        func.call @stack_push_pointer(%3943) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3519) : (i64) -> ()
        func.call @stack_push_pointer(%3724) : (i64) -> ()
        func.call @stack_push_pointer(%3860) : (i64) -> ()
        func.call @stack_push_pointer(%3872) : (i64) -> ()
        func.call @stack_push_pointer(%3879) : (i64) -> ()
        func.call @stack_push_pointer(%3883) : (i64) -> ()
        func.call @stack_push_pointer(%3890) : (i64) -> ()
        func.call @stack_push_pointer(%3902) : (i64) -> ()
        %3945 = llvm.mlir.addressof @str381 : !llvm.ptr
        %3946 = func.call @cc_make_function_ref_const(%3945) : (!llvm.ptr) -> i64
        %3947 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3946, %3947) : (i64, i64) -> ()
      }
      %3948 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3948 : i64
    }
    %3949 = func.call @cc_nil_value() : () -> i64
    %3950 = func.call @cc_errorp(%3510) : (i64) -> i64
    %3951 = arith.cmpi ne, %3950, %3949 : i64
    %3952 = scf.if %3951 -> (i64) {
      scf.yield %3510 : i64
    } else {
      %3953 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3954 = arith.constant 18 : i64
      %3955 = func.call @cc_make_string(%3953, %3954) : (!llvm.ptr, i64) -> i64
      %3956 = func.call @cc_nil_value() : () -> i64
      %3957 = func.call @cc_intern(%3955, %3956) : (i64, i64) -> i64
      %3958 = func.call @cc_nil_value() : () -> i64
      %3959 = func.call @cc_cons(%3957, %3958) : (i64, i64) -> i64
      %3960 = func.call @cc_values_pack(%3959) : (i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3961 = arith.addi %3957, %__rlasp_stack_elide_zero_186 : i64
      %3962 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3963 = arith.constant 3 : i64
      %3964 = func.call @cc_make_string(%3962, %3963) : (!llvm.ptr, i64) -> i64
      %3965 = func.call @cc_nil_value() : () -> i64
      %3966 = func.call @cc_intern(%3964, %3965) : (i64, i64) -> i64
      %3967 = func.call @cc_nil_value() : () -> i64
      %3968 = func.call @cc_cons(%3966, %3967) : (i64, i64) -> i64
      %3969 = func.call @cc_values_pack(%3968) : (i64) -> i64
      func.call @stack_push_pointer(%3966) : (i64) -> ()
      %3970 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3971 = arith.constant 3 : i64
      %3972 = func.call @cc_make_string(%3970, %3971) : (!llvm.ptr, i64) -> i64
      %3973 = func.call @cc_nil_value() : () -> i64
      %3974 = func.call @cc_intern(%3972, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_nil_value() : () -> i64
      %3976 = func.call @cc_cons(%3974, %3975) : (i64, i64) -> i64
      %3977 = func.call @cc_values_pack(%3976) : (i64) -> i64
      func.call @stack_push_pointer(%3974) : (i64) -> ()
      %3978 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3979 = arith.constant 19 : i64
      %3980 = func.call @cc_make_string(%3978, %3979) : (!llvm.ptr, i64) -> i64
      %3981 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3982 = arith.constant 11 : i64
      %3983 = func.call @cc_make_string(%3981, %3982) : (!llvm.ptr, i64) -> i64
      %3984 = func.call @cc_intern(%3980, %3983) : (i64, i64) -> i64
      %3985 = func.call @cc_nil_value() : () -> i64
      %3986 = func.call @cc_cons(%3984, %3985) : (i64, i64) -> i64
      %3987 = func.call @cc_values_pack(%3986) : (i64) -> i64
      func.call @stack_push_pointer(%3984) : (i64) -> ()
      %3988 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3989 = arith.constant 2 : i64
      %3990 = func.call @cc_make_string(%3988, %3989) : (!llvm.ptr, i64) -> i64
      %3991 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3992 = arith.constant 11 : i64
      %3993 = func.call @cc_make_string(%3991, %3992) : (!llvm.ptr, i64) -> i64
      %3994 = func.call @cc_intern(%3990, %3993) : (i64, i64) -> i64
      %3995 = func.call @cc_nil_value() : () -> i64
      %3996 = func.call @cc_cons(%3994, %3995) : (i64, i64) -> i64
      %3997 = func.call @cc_values_pack(%3996) : (i64) -> i64
      func.call @stack_push_pointer(%3994) : (i64) -> ()
      %3998 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3999 = arith.constant 2 : i64
      %4000 = func.call @cc_make_string(%3998, %3999) : (!llvm.ptr, i64) -> i64
      %4001 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4002 = arith.constant 11 : i64
      %4003 = func.call @cc_make_string(%4001, %4002) : (!llvm.ptr, i64) -> i64
      %4004 = func.call @cc_intern(%4000, %4003) : (i64, i64) -> i64
      %4005 = func.call @cc_nil_value() : () -> i64
      %4006 = func.call @cc_cons(%4004, %4005) : (i64, i64) -> i64
      %4007 = func.call @cc_values_pack(%4006) : (i64) -> i64
      func.call @stack_push_pointer(%4004) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4008 = func.call @stack_pop_pointer() : () -> i64
      %4009 = func.call @stack_pop_pointer() : () -> i64
      %4010 = func.call @cc_cons(%4009, %4008) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %4011 = arith.addi %4010, %__rlasp_stack_elide_zero_187 : i64
      %4012 = func.call @stack_pop_pointer() : () -> i64
      %4013 = func.call @cc_cons(%4012, %4011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4013) : (i64) -> ()
      %4014 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4015 = arith.constant 8 : i64
      %4016 = func.call @cc_make_string(%4014, %4015) : (!llvm.ptr, i64) -> i64
      %4017 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4018 = arith.constant 11 : i64
      %4019 = func.call @cc_make_string(%4017, %4018) : (!llvm.ptr, i64) -> i64
      %4020 = func.call @cc_intern(%4016, %4019) : (i64, i64) -> i64
      %4021 = func.call @cc_nil_value() : () -> i64
      %4022 = func.call @cc_cons(%4020, %4021) : (i64, i64) -> i64
      %4023 = func.call @cc_values_pack(%4022) : (i64) -> i64
      func.call @stack_push_pointer(%4020) : (i64) -> ()
      %4024 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4024) : (i64) -> ()
      %4025 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4026 = arith.constant 6 : i64
      %4027 = func.call @cc_make_string(%4025, %4026) : (!llvm.ptr, i64) -> i64
      %4028 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4029 = arith.constant 11 : i64
      %4030 = func.call @cc_make_string(%4028, %4029) : (!llvm.ptr, i64) -> i64
      %4031 = func.call @cc_intern(%4027, %4030) : (i64, i64) -> i64
      %4032 = func.call @cc_nil_value() : () -> i64
      %4033 = func.call @cc_cons(%4031, %4032) : (i64, i64) -> i64
      %4034 = func.call @cc_values_pack(%4033) : (i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %4035 = arith.addi %4031, %__rlasp_stack_elide_zero_188 : i64
      %4036 = func.call @stack_pop_pointer() : () -> i64
      %4037 = func.call @cc_cons(%4035, %4036) : (i64, i64) -> i64
      %4038 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4039 = arith.constant 5 : i64
      %4040 = func.call @cc_make_string(%4038, %4039) : (!llvm.ptr, i64) -> i64
      %4041 = func.call @cc_nil_value() : () -> i64
      %4042 = func.call @cc_intern(%4040, %4041) : (i64, i64) -> i64
      %4043 = func.call @cc_nil_value() : () -> i64
      %4044 = func.call @cc_cons(%4042, %4043) : (i64, i64) -> i64
      %4045 = func.call @cc_values_pack(%4044) : (i64) -> i64
      %4046 = func.call @cc_cons(%4042, %4037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4046) : (i64) -> ()
      %4047 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4048 = arith.constant 10 : i64
      %4049 = func.call @cc_make_string(%4047, %4048) : (!llvm.ptr, i64) -> i64
      %4050 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4051 = arith.constant 11 : i64
      %4052 = func.call @cc_make_string(%4050, %4051) : (!llvm.ptr, i64) -> i64
      %4053 = func.call @cc_intern(%4049, %4052) : (i64, i64) -> i64
      %4054 = func.call @cc_nil_value() : () -> i64
      %4055 = func.call @cc_cons(%4053, %4054) : (i64, i64) -> i64
      %4056 = func.call @cc_values_pack(%4055) : (i64) -> i64
      func.call @stack_push_pointer(%4053) : (i64) -> ()
      %4057 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4057) : (i64) -> ()
      %4058 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4059 = arith.constant 6 : i64
      %4060 = func.call @cc_make_string(%4058, %4059) : (!llvm.ptr, i64) -> i64
      %4061 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4062 = arith.constant 11 : i64
      %4063 = func.call @cc_make_string(%4061, %4062) : (!llvm.ptr, i64) -> i64
      %4064 = func.call @cc_intern(%4060, %4063) : (i64, i64) -> i64
      %4065 = func.call @cc_nil_value() : () -> i64
      %4066 = func.call @cc_cons(%4064, %4065) : (i64, i64) -> i64
      %4067 = func.call @cc_values_pack(%4066) : (i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %4068 = arith.addi %4064, %__rlasp_stack_elide_zero_189 : i64
      %4069 = func.call @stack_pop_pointer() : () -> i64
      %4070 = func.call @cc_cons(%4068, %4069) : (i64, i64) -> i64
      %4071 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4072 = arith.constant 5 : i64
      %4073 = func.call @cc_make_string(%4071, %4072) : (!llvm.ptr, i64) -> i64
      %4074 = func.call @cc_nil_value() : () -> i64
      %4075 = func.call @cc_intern(%4073, %4074) : (i64, i64) -> i64
      %4076 = func.call @cc_nil_value() : () -> i64
      %4077 = func.call @cc_cons(%4075, %4076) : (i64, i64) -> i64
      %4078 = func.call @cc_values_pack(%4077) : (i64) -> i64
      %4079 = func.call @cc_cons(%4075, %4070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4079) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4080 = func.call @stack_pop_pointer() : () -> i64
      %4081 = func.call @stack_pop_pointer() : () -> i64
      %4082 = func.call @cc_cons(%4081, %4080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %4083 = arith.addi %4082, %__rlasp_stack_elide_zero_190 : i64
      %4084 = func.call @stack_pop_pointer() : () -> i64
      %4085 = func.call @cc_cons(%4084, %4083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4085) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @stack_pop_pointer() : () -> i64
      %4088 = func.call @cc_cons(%4087, %4086) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %4089 = arith.addi %4088, %__rlasp_stack_elide_zero_191 : i64
      %4090 = func.call @stack_pop_pointer() : () -> i64
      %4091 = func.call @cc_cons(%4090, %4089) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %4092 = arith.addi %4091, %__rlasp_stack_elide_zero_192 : i64
      %4093 = func.call @stack_pop_pointer() : () -> i64
      %4094 = func.call @cc_cons(%4093, %4092) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4094) : (i64) -> ()
      %4095 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4096 = arith.constant 3 : i64
      %4097 = func.call @cc_make_string(%4095, %4096) : (!llvm.ptr, i64) -> i64
      %4098 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4099 = arith.constant 11 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = func.call @cc_intern(%4097, %4100) : (i64, i64) -> i64
      %4102 = func.call @cc_nil_value() : () -> i64
      %4103 = func.call @cc_cons(%4101, %4102) : (i64, i64) -> i64
      %4104 = func.call @cc_values_pack(%4103) : (i64) -> i64
      func.call @stack_push_pointer(%4101) : (i64) -> ()
      %4105 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4106 = arith.constant 2 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4109 = arith.constant 11 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = func.call @cc_intern(%4107, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_nil_value() : () -> i64
      %4113 = func.call @cc_cons(%4111, %4112) : (i64, i64) -> i64
      %4114 = func.call @cc_values_pack(%4113) : (i64) -> i64
      func.call @stack_push_pointer(%4111) : (i64) -> ()
      %4115 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4116 = arith.constant 2 : i64
      %4117 = func.call @cc_make_string(%4115, %4116) : (!llvm.ptr, i64) -> i64
      %4118 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4119 = arith.constant 11 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = func.call @cc_intern(%4117, %4120) : (i64, i64) -> i64
      %4122 = func.call @cc_nil_value() : () -> i64
      %4123 = func.call @cc_cons(%4121, %4122) : (i64, i64) -> i64
      %4124 = func.call @cc_values_pack(%4123) : (i64) -> i64
      func.call @stack_push_pointer(%4121) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4125 = func.call @stack_pop_pointer() : () -> i64
      %4126 = func.call @stack_pop_pointer() : () -> i64
      %4127 = func.call @cc_cons(%4126, %4125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %4128 = arith.addi %4127, %__rlasp_stack_elide_zero_193 : i64
      %4129 = func.call @stack_pop_pointer() : () -> i64
      %4130 = func.call @cc_cons(%4129, %4128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %4131 = arith.addi %4130, %__rlasp_stack_elide_zero_194 : i64
      %4132 = func.call @stack_pop_pointer() : () -> i64
      %4133 = func.call @cc_cons(%4132, %4131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4133) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4134 = func.call @stack_pop_pointer() : () -> i64
      %4135 = func.call @stack_pop_pointer() : () -> i64
      %4136 = func.call @cc_cons(%4135, %4134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %4137 = arith.addi %4136, %__rlasp_stack_elide_zero_195 : i64
      %4138 = func.call @stack_pop_pointer() : () -> i64
      %4139 = func.call @cc_cons(%4138, %4137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %4140 = arith.addi %4139, %__rlasp_stack_elide_zero_196 : i64
      %4141 = func.call @stack_pop_pointer() : () -> i64
      %4142 = func.call @cc_cons(%4141, %4140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %4143 = arith.addi %4142, %__rlasp_stack_elide_zero_197 : i64
      %4144 = func.call @stack_pop_pointer() : () -> i64
      %4145 = func.call @cc_cons(%4144, %4143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4145) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4146 = func.call @stack_pop_pointer() : () -> i64
      %4147 = func.call @stack_pop_pointer() : () -> i64
      %4148 = func.call @cc_cons(%4147, %4146) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %4149 = arith.addi %4148, %__rlasp_stack_elide_zero_198 : i64
      %4150 = func.call @stack_pop_pointer() : () -> i64
      %4151 = func.call @cc_cons(%4150, %4149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4151) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4152 = func.call @stack_pop_pointer() : () -> i64
      %4153 = func.call @stack_pop_pointer() : () -> i64
      %4154 = func.call @cc_cons(%4153, %4152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %4155 = arith.addi %4154, %__rlasp_stack_elide_zero_199 : i64
      %4156 = func.call @stack_pop_pointer() : () -> i64
      %4157 = func.call @cc_cons(%4156, %4155) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %4158 = arith.addi %4157, %__rlasp_stack_elide_zero_200 : i64
      %4221 = arith.constant 206494159077395 : i64
      %4222 = arith.constant 0 : i64
      %4223 = func.call @cc_make_closure(%4221, %4222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %4224 = arith.addi %4223, %__rlasp_stack_elide_zero_201 : i64
      %4225 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4226 = arith.constant 1 : i64
      %4227 = func.call @cc_make_string(%4225, %4226) : (!llvm.ptr, i64) -> i64
      %4228 = func.call @cc_nil_value() : () -> i64
      %4229 = func.call @cc_intern(%4227, %4228) : (i64, i64) -> i64
      %4230 = func.call @cc_nil_value() : () -> i64
      %4231 = func.call @cc_cons(%4229, %4230) : (i64, i64) -> i64
      %4232 = func.call @cc_values_pack(%4231) : (i64) -> i64
      func.call @stack_push_pointer(%4229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4233 = func.call @stack_pop_pointer() : () -> i64
      %4234 = func.call @stack_pop_pointer() : () -> i64
      %4235 = func.call @cc_cons(%4234, %4233) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %4236 = arith.addi %4235, %__rlasp_stack_elide_zero_202 : i64
      %4237 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4238 = arith.constant 11 : i64
      %4239 = func.call @cc_make_string(%4237, %4238) : (!llvm.ptr, i64) -> i64
      %4240 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4241 = arith.constant 7 : i64
      %4242 = func.call @cc_make_string(%4240, %4241) : (!llvm.ptr, i64) -> i64
      %4243 = func.call @cc_intern(%4239, %4242) : (i64, i64) -> i64
      %4244 = func.call @cc_nil_value() : () -> i64
      %4245 = func.call @cc_cons(%4243, %4244) : (i64, i64) -> i64
      %4246 = func.call @cc_values_pack(%4245) : (i64) -> i64
      %4247 = func.call @cc_nil_value() : () -> i64
      %4248 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4249 = arith.constant 4 : i64
      %4250 = func.call @cc_make_string(%4248, %4249) : (!llvm.ptr, i64) -> i64
      %4251 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4252 = arith.constant 7 : i64
      %4253 = func.call @cc_make_string(%4251, %4252) : (!llvm.ptr, i64) -> i64
      %4254 = func.call @cc_intern(%4250, %4253) : (i64, i64) -> i64
      %4255 = func.call @cc_nil_value() : () -> i64
      %4256 = func.call @cc_cons(%4254, %4255) : (i64, i64) -> i64
      %4257 = func.call @cc_values_pack(%4256) : (i64) -> i64
      %4258 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4259 = arith.constant 6 : i64
      %4260 = func.call @cc_make_string(%4258, %4259) : (!llvm.ptr, i64) -> i64
      %4261 = func.call @cc_nil_value() : () -> i64
      %4262 = func.call @cc_intern(%4260, %4261) : (i64, i64) -> i64
      %4263 = func.call @cc_nil_value() : () -> i64
      %4264 = func.call @cc_cons(%4262, %4263) : (i64, i64) -> i64
      %4265 = func.call @cc_values_pack(%4264) : (i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %4266 = arith.addi %4262, %__rlasp_stack_elide_zero_203 : i64
      %4267 = func.call @cc_nil_value() : () -> i64
      %4268 = func.call @cc_errorp(%3961) : (i64) -> i64
      %4269 = arith.cmpi ne, %4268, %4267 : i64
      %4270 = arith.cmpi eq, %4267, %4267 : i64
      %4271 = arith.andi %4269, %4270 : i1
      %4272 = scf.if %4271 -> (i64) {
        scf.yield %3961 : i64
      } else {
        scf.yield %4267 : i64
      }
      %4273 = func.call @cc_errorp(%4158) : (i64) -> i64
      %4274 = arith.cmpi ne, %4273, %4267 : i64
      %4275 = arith.cmpi eq, %4272, %4267 : i64
      %4276 = arith.andi %4274, %4275 : i1
      %4277 = scf.if %4276 -> (i64) {
        scf.yield %4158 : i64
      } else {
        scf.yield %4272 : i64
      }
      %4278 = func.call @cc_errorp(%4224) : (i64) -> i64
      %4279 = arith.cmpi ne, %4278, %4267 : i64
      %4280 = arith.cmpi eq, %4277, %4267 : i64
      %4281 = arith.andi %4279, %4280 : i1
      %4282 = scf.if %4281 -> (i64) {
        scf.yield %4224 : i64
      } else {
        scf.yield %4277 : i64
      }
      %4283 = func.call @cc_errorp(%4236) : (i64) -> i64
      %4284 = arith.cmpi ne, %4283, %4267 : i64
      %4285 = arith.cmpi eq, %4282, %4267 : i64
      %4286 = arith.andi %4284, %4285 : i1
      %4287 = scf.if %4286 -> (i64) {
        scf.yield %4236 : i64
      } else {
        scf.yield %4282 : i64
      }
      %4288 = func.call @cc_errorp(%4243) : (i64) -> i64
      %4289 = arith.cmpi ne, %4288, %4267 : i64
      %4290 = arith.cmpi eq, %4287, %4267 : i64
      %4291 = arith.andi %4289, %4290 : i1
      %4292 = scf.if %4291 -> (i64) {
        scf.yield %4243 : i64
      } else {
        scf.yield %4287 : i64
      }
      %4293 = func.call @cc_errorp(%4247) : (i64) -> i64
      %4294 = arith.cmpi ne, %4293, %4267 : i64
      %4295 = arith.cmpi eq, %4292, %4267 : i64
      %4296 = arith.andi %4294, %4295 : i1
      %4297 = scf.if %4296 -> (i64) {
        scf.yield %4247 : i64
      } else {
        scf.yield %4292 : i64
      }
      %4298 = func.call @cc_errorp(%4254) : (i64) -> i64
      %4299 = arith.cmpi ne, %4298, %4267 : i64
      %4300 = arith.cmpi eq, %4297, %4267 : i64
      %4301 = arith.andi %4299, %4300 : i1
      %4302 = scf.if %4301 -> (i64) {
        scf.yield %4254 : i64
      } else {
        scf.yield %4297 : i64
      }
      %4303 = func.call @cc_errorp(%4266) : (i64) -> i64
      %4304 = arith.cmpi ne, %4303, %4267 : i64
      %4305 = arith.cmpi eq, %4302, %4267 : i64
      %4306 = arith.andi %4304, %4305 : i1
      %4307 = scf.if %4306 -> (i64) {
        scf.yield %4266 : i64
      } else {
        scf.yield %4302 : i64
      }
      %4308 = arith.cmpi ne, %4307, %4267 : i64
      scf.if %4308 {
        func.call @stack_push_pointer(%4307) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3961) : (i64) -> ()
        func.call @stack_push_pointer(%4158) : (i64) -> ()
        func.call @stack_push_pointer(%4224) : (i64) -> ()
        func.call @stack_push_pointer(%4236) : (i64) -> ()
        func.call @stack_push_pointer(%4243) : (i64) -> ()
        func.call @stack_push_pointer(%4247) : (i64) -> ()
        func.call @stack_push_pointer(%4254) : (i64) -> ()
        func.call @stack_push_pointer(%4266) : (i64) -> ()
        %4309 = llvm.mlir.addressof @str418 : !llvm.ptr
        %4310 = func.call @cc_make_function_ref_const(%4309) : (!llvm.ptr) -> i64
        %4311 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4310, %4311) : (i64, i64) -> ()
      }
      %4312 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4312 : i64
    }
    %4313 = func.call @cc_nil_value() : () -> i64
    %4314 = func.call @cc_errorp(%3952) : (i64) -> i64
    %4315 = arith.cmpi ne, %4314, %4313 : i64
    %4316 = scf.if %4315 -> (i64) {
      scf.yield %3952 : i64
    } else {
      %4317 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4318 = arith.constant 18 : i64
      %4319 = func.call @cc_make_string(%4317, %4318) : (!llvm.ptr, i64) -> i64
      %4320 = func.call @cc_nil_value() : () -> i64
      %4321 = func.call @cc_intern(%4319, %4320) : (i64, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_cons(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_values_pack(%4323) : (i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %4325 = arith.addi %4321, %__rlasp_stack_elide_zero_204 : i64
      %4326 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4327 = arith.constant 3 : i64
      %4328 = func.call @cc_make_string(%4326, %4327) : (!llvm.ptr, i64) -> i64
      %4329 = func.call @cc_nil_value() : () -> i64
      %4330 = func.call @cc_intern(%4328, %4329) : (i64, i64) -> i64
      %4331 = func.call @cc_nil_value() : () -> i64
      %4332 = func.call @cc_cons(%4330, %4331) : (i64, i64) -> i64
      %4333 = func.call @cc_values_pack(%4332) : (i64) -> i64
      func.call @stack_push_pointer(%4330) : (i64) -> ()
      %4334 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4335 = arith.constant 3 : i64
      %4336 = func.call @cc_make_string(%4334, %4335) : (!llvm.ptr, i64) -> i64
      %4337 = func.call @cc_nil_value() : () -> i64
      %4338 = func.call @cc_intern(%4336, %4337) : (i64, i64) -> i64
      %4339 = func.call @cc_nil_value() : () -> i64
      %4340 = func.call @cc_cons(%4338, %4339) : (i64, i64) -> i64
      %4341 = func.call @cc_values_pack(%4340) : (i64) -> i64
      func.call @stack_push_pointer(%4338) : (i64) -> ()
      %4342 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4343 = arith.constant 19 : i64
      %4344 = func.call @cc_make_string(%4342, %4343) : (!llvm.ptr, i64) -> i64
      %4345 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4346 = arith.constant 11 : i64
      %4347 = func.call @cc_make_string(%4345, %4346) : (!llvm.ptr, i64) -> i64
      %4348 = func.call @cc_intern(%4344, %4347) : (i64, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_cons(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_values_pack(%4350) : (i64) -> i64
      func.call @stack_push_pointer(%4348) : (i64) -> ()
      %4352 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4353 = arith.constant 2 : i64
      %4354 = func.call @cc_make_string(%4352, %4353) : (!llvm.ptr, i64) -> i64
      %4355 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4356 = arith.constant 11 : i64
      %4357 = func.call @cc_make_string(%4355, %4356) : (!llvm.ptr, i64) -> i64
      %4358 = func.call @cc_intern(%4354, %4357) : (i64, i64) -> i64
      %4359 = func.call @cc_nil_value() : () -> i64
      %4360 = func.call @cc_cons(%4358, %4359) : (i64, i64) -> i64
      %4361 = func.call @cc_values_pack(%4360) : (i64) -> i64
      func.call @stack_push_pointer(%4358) : (i64) -> ()
      %4362 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4363 = arith.constant 2 : i64
      %4364 = func.call @cc_make_string(%4362, %4363) : (!llvm.ptr, i64) -> i64
      %4365 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4366 = arith.constant 11 : i64
      %4367 = func.call @cc_make_string(%4365, %4366) : (!llvm.ptr, i64) -> i64
      %4368 = func.call @cc_intern(%4364, %4367) : (i64, i64) -> i64
      %4369 = func.call @cc_nil_value() : () -> i64
      %4370 = func.call @cc_cons(%4368, %4369) : (i64, i64) -> i64
      %4371 = func.call @cc_values_pack(%4370) : (i64) -> i64
      func.call @stack_push_pointer(%4368) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4372 = func.call @stack_pop_pointer() : () -> i64
      %4373 = func.call @stack_pop_pointer() : () -> i64
      %4374 = func.call @cc_cons(%4373, %4372) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %4375 = arith.addi %4374, %__rlasp_stack_elide_zero_205 : i64
      %4376 = func.call @stack_pop_pointer() : () -> i64
      %4377 = func.call @cc_cons(%4376, %4375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4377) : (i64) -> ()
      %4378 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4379 = arith.constant 8 : i64
      %4380 = func.call @cc_make_string(%4378, %4379) : (!llvm.ptr, i64) -> i64
      %4381 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4382 = arith.constant 11 : i64
      %4383 = func.call @cc_make_string(%4381, %4382) : (!llvm.ptr, i64) -> i64
      %4384 = func.call @cc_intern(%4380, %4383) : (i64, i64) -> i64
      %4385 = func.call @cc_nil_value() : () -> i64
      %4386 = func.call @cc_cons(%4384, %4385) : (i64, i64) -> i64
      %4387 = func.call @cc_values_pack(%4386) : (i64) -> i64
      func.call @stack_push_pointer(%4384) : (i64) -> ()
      %4388 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4389 = arith.constant 10 : i64
      %4390 = func.call @cc_make_string(%4388, %4389) : (!llvm.ptr, i64) -> i64
      %4391 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4392 = arith.constant 11 : i64
      %4393 = func.call @cc_make_string(%4391, %4392) : (!llvm.ptr, i64) -> i64
      %4394 = func.call @cc_intern(%4390, %4393) : (i64, i64) -> i64
      %4395 = func.call @cc_nil_value() : () -> i64
      %4396 = func.call @cc_cons(%4394, %4395) : (i64, i64) -> i64
      %4397 = func.call @cc_values_pack(%4396) : (i64) -> i64
      func.call @stack_push_pointer(%4394) : (i64) -> ()
      %4398 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4398) : (i64) -> ()
      %4399 = llvm.mlir.addressof @str432 : !llvm.ptr
      %4400 = arith.constant 6 : i64
      %4401 = func.call @cc_make_string(%4399, %4400) : (!llvm.ptr, i64) -> i64
      %4402 = llvm.mlir.addressof @str433 : !llvm.ptr
      %4403 = arith.constant 11 : i64
      %4404 = func.call @cc_make_string(%4402, %4403) : (!llvm.ptr, i64) -> i64
      %4405 = func.call @cc_intern(%4401, %4404) : (i64, i64) -> i64
      %4406 = func.call @cc_nil_value() : () -> i64
      %4407 = func.call @cc_cons(%4405, %4406) : (i64, i64) -> i64
      %4408 = func.call @cc_values_pack(%4407) : (i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %4409 = arith.addi %4405, %__rlasp_stack_elide_zero_206 : i64
      %4410 = func.call @stack_pop_pointer() : () -> i64
      %4411 = func.call @cc_cons(%4409, %4410) : (i64, i64) -> i64
      %4412 = llvm.mlir.addressof @str434 : !llvm.ptr
      %4413 = arith.constant 5 : i64
      %4414 = func.call @cc_make_string(%4412, %4413) : (!llvm.ptr, i64) -> i64
      %4415 = func.call @cc_nil_value() : () -> i64
      %4416 = func.call @cc_intern(%4414, %4415) : (i64, i64) -> i64
      %4417 = func.call @cc_nil_value() : () -> i64
      %4418 = func.call @cc_cons(%4416, %4417) : (i64, i64) -> i64
      %4419 = func.call @cc_values_pack(%4418) : (i64) -> i64
      %4420 = func.call @cc_cons(%4416, %4411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4420) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4421 = func.call @stack_pop_pointer() : () -> i64
      %4422 = func.call @stack_pop_pointer() : () -> i64
      %4423 = func.call @cc_cons(%4422, %4421) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %4424 = arith.addi %4423, %__rlasp_stack_elide_zero_207 : i64
      %4425 = func.call @stack_pop_pointer() : () -> i64
      %4426 = func.call @cc_cons(%4425, %4424) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4426) : (i64) -> ()
      %4427 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4427) : (i64) -> ()
      %4428 = llvm.mlir.addressof @str435 : !llvm.ptr
      %4429 = arith.constant 6 : i64
      %4430 = func.call @cc_make_string(%4428, %4429) : (!llvm.ptr, i64) -> i64
      %4431 = llvm.mlir.addressof @str436 : !llvm.ptr
      %4432 = arith.constant 11 : i64
      %4433 = func.call @cc_make_string(%4431, %4432) : (!llvm.ptr, i64) -> i64
      %4434 = func.call @cc_intern(%4430, %4433) : (i64, i64) -> i64
      %4435 = func.call @cc_nil_value() : () -> i64
      %4436 = func.call @cc_cons(%4434, %4435) : (i64, i64) -> i64
      %4437 = func.call @cc_values_pack(%4436) : (i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %4438 = arith.addi %4434, %__rlasp_stack_elide_zero_208 : i64
      %4439 = func.call @stack_pop_pointer() : () -> i64
      %4440 = func.call @cc_cons(%4438, %4439) : (i64, i64) -> i64
      %4441 = llvm.mlir.addressof @str437 : !llvm.ptr
      %4442 = arith.constant 5 : i64
      %4443 = func.call @cc_make_string(%4441, %4442) : (!llvm.ptr, i64) -> i64
      %4444 = func.call @cc_nil_value() : () -> i64
      %4445 = func.call @cc_intern(%4443, %4444) : (i64, i64) -> i64
      %4446 = func.call @cc_nil_value() : () -> i64
      %4447 = func.call @cc_cons(%4445, %4446) : (i64, i64) -> i64
      %4448 = func.call @cc_values_pack(%4447) : (i64) -> i64
      %4449 = func.call @cc_cons(%4445, %4440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4449) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4450 = func.call @stack_pop_pointer() : () -> i64
      %4451 = func.call @stack_pop_pointer() : () -> i64
      %4452 = func.call @cc_cons(%4451, %4450) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %4453 = arith.addi %4452, %__rlasp_stack_elide_zero_209 : i64
      %4454 = func.call @stack_pop_pointer() : () -> i64
      %4455 = func.call @cc_cons(%4454, %4453) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %4456 = arith.addi %4455, %__rlasp_stack_elide_zero_210 : i64
      %4457 = func.call @stack_pop_pointer() : () -> i64
      %4458 = func.call @cc_cons(%4457, %4456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4458) : (i64) -> ()
      %4459 = llvm.mlir.addressof @str438 : !llvm.ptr
      %4460 = arith.constant 3 : i64
      %4461 = func.call @cc_make_string(%4459, %4460) : (!llvm.ptr, i64) -> i64
      %4462 = llvm.mlir.addressof @str439 : !llvm.ptr
      %4463 = arith.constant 11 : i64
      %4464 = func.call @cc_make_string(%4462, %4463) : (!llvm.ptr, i64) -> i64
      %4465 = func.call @cc_intern(%4461, %4464) : (i64, i64) -> i64
      %4466 = func.call @cc_nil_value() : () -> i64
      %4467 = func.call @cc_cons(%4465, %4466) : (i64, i64) -> i64
      %4468 = func.call @cc_values_pack(%4467) : (i64) -> i64
      func.call @stack_push_pointer(%4465) : (i64) -> ()
      %4469 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4470 = arith.constant 2 : i64
      %4471 = func.call @cc_make_string(%4469, %4470) : (!llvm.ptr, i64) -> i64
      %4472 = llvm.mlir.addressof @str441 : !llvm.ptr
      %4473 = arith.constant 11 : i64
      %4474 = func.call @cc_make_string(%4472, %4473) : (!llvm.ptr, i64) -> i64
      %4475 = func.call @cc_intern(%4471, %4474) : (i64, i64) -> i64
      %4476 = func.call @cc_nil_value() : () -> i64
      %4477 = func.call @cc_cons(%4475, %4476) : (i64, i64) -> i64
      %4478 = func.call @cc_values_pack(%4477) : (i64) -> i64
      func.call @stack_push_pointer(%4475) : (i64) -> ()
      %4479 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4480 = arith.constant 2 : i64
      %4481 = func.call @cc_make_string(%4479, %4480) : (!llvm.ptr, i64) -> i64
      %4482 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4483 = arith.constant 11 : i64
      %4484 = func.call @cc_make_string(%4482, %4483) : (!llvm.ptr, i64) -> i64
      %4485 = func.call @cc_intern(%4481, %4484) : (i64, i64) -> i64
      %4486 = func.call @cc_nil_value() : () -> i64
      %4487 = func.call @cc_cons(%4485, %4486) : (i64, i64) -> i64
      %4488 = func.call @cc_values_pack(%4487) : (i64) -> i64
      func.call @stack_push_pointer(%4485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4489 = func.call @stack_pop_pointer() : () -> i64
      %4490 = func.call @stack_pop_pointer() : () -> i64
      %4491 = func.call @cc_cons(%4490, %4489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4492 = arith.addi %4491, %__rlasp_stack_elide_zero_211 : i64
      %4493 = func.call @stack_pop_pointer() : () -> i64
      %4494 = func.call @cc_cons(%4493, %4492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4495 = arith.addi %4494, %__rlasp_stack_elide_zero_212 : i64
      %4496 = func.call @stack_pop_pointer() : () -> i64
      %4497 = func.call @cc_cons(%4496, %4495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4497) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4498 = func.call @stack_pop_pointer() : () -> i64
      %4499 = func.call @stack_pop_pointer() : () -> i64
      %4500 = func.call @cc_cons(%4499, %4498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4501 = arith.addi %4500, %__rlasp_stack_elide_zero_213 : i64
      %4502 = func.call @stack_pop_pointer() : () -> i64
      %4503 = func.call @cc_cons(%4502, %4501) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4504 = arith.addi %4503, %__rlasp_stack_elide_zero_214 : i64
      %4505 = func.call @stack_pop_pointer() : () -> i64
      %4506 = func.call @cc_cons(%4505, %4504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4507 = arith.addi %4506, %__rlasp_stack_elide_zero_215 : i64
      %4508 = func.call @stack_pop_pointer() : () -> i64
      %4509 = func.call @cc_cons(%4508, %4507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4509) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4510 = func.call @stack_pop_pointer() : () -> i64
      %4511 = func.call @stack_pop_pointer() : () -> i64
      %4512 = func.call @cc_cons(%4511, %4510) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4513 = arith.addi %4512, %__rlasp_stack_elide_zero_216 : i64
      %4514 = func.call @stack_pop_pointer() : () -> i64
      %4515 = func.call @cc_cons(%4514, %4513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4516 = func.call @stack_pop_pointer() : () -> i64
      %4517 = func.call @stack_pop_pointer() : () -> i64
      %4518 = func.call @cc_cons(%4517, %4516) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4519 = arith.addi %4518, %__rlasp_stack_elide_zero_217 : i64
      %4520 = func.call @stack_pop_pointer() : () -> i64
      %4521 = func.call @cc_cons(%4520, %4519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4522 = arith.addi %4521, %__rlasp_stack_elide_zero_218 : i64
      %4585 = arith.constant 206494159077396 : i64
      %4586 = arith.constant 0 : i64
      %4587 = func.call @cc_make_closure(%4585, %4586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4588 = arith.addi %4587, %__rlasp_stack_elide_zero_219 : i64
      %4589 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4590 = arith.constant 1 : i64
      %4591 = func.call @cc_make_string(%4589, %4590) : (!llvm.ptr, i64) -> i64
      %4592 = func.call @cc_nil_value() : () -> i64
      %4593 = func.call @cc_intern(%4591, %4592) : (i64, i64) -> i64
      %4594 = func.call @cc_nil_value() : () -> i64
      %4595 = func.call @cc_cons(%4593, %4594) : (i64, i64) -> i64
      %4596 = func.call @cc_values_pack(%4595) : (i64) -> i64
      func.call @stack_push_pointer(%4593) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4597 = func.call @stack_pop_pointer() : () -> i64
      %4598 = func.call @stack_pop_pointer() : () -> i64
      %4599 = func.call @cc_cons(%4598, %4597) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %4600 = arith.addi %4599, %__rlasp_stack_elide_zero_220 : i64
      %4601 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4602 = arith.constant 11 : i64
      %4603 = func.call @cc_make_string(%4601, %4602) : (!llvm.ptr, i64) -> i64
      %4604 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4605 = arith.constant 7 : i64
      %4606 = func.call @cc_make_string(%4604, %4605) : (!llvm.ptr, i64) -> i64
      %4607 = func.call @cc_intern(%4603, %4606) : (i64, i64) -> i64
      %4608 = func.call @cc_nil_value() : () -> i64
      %4609 = func.call @cc_cons(%4607, %4608) : (i64, i64) -> i64
      %4610 = func.call @cc_values_pack(%4609) : (i64) -> i64
      %4611 = func.call @cc_nil_value() : () -> i64
      %4612 = llvm.mlir.addressof @str452 : !llvm.ptr
      %4613 = arith.constant 4 : i64
      %4614 = func.call @cc_make_string(%4612, %4613) : (!llvm.ptr, i64) -> i64
      %4615 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4616 = arith.constant 7 : i64
      %4617 = func.call @cc_make_string(%4615, %4616) : (!llvm.ptr, i64) -> i64
      %4618 = func.call @cc_intern(%4614, %4617) : (i64, i64) -> i64
      %4619 = func.call @cc_nil_value() : () -> i64
      %4620 = func.call @cc_cons(%4618, %4619) : (i64, i64) -> i64
      %4621 = func.call @cc_values_pack(%4620) : (i64) -> i64
      %4622 = llvm.mlir.addressof @str454 : !llvm.ptr
      %4623 = arith.constant 6 : i64
      %4624 = func.call @cc_make_string(%4622, %4623) : (!llvm.ptr, i64) -> i64
      %4625 = func.call @cc_nil_value() : () -> i64
      %4626 = func.call @cc_intern(%4624, %4625) : (i64, i64) -> i64
      %4627 = func.call @cc_nil_value() : () -> i64
      %4628 = func.call @cc_cons(%4626, %4627) : (i64, i64) -> i64
      %4629 = func.call @cc_values_pack(%4628) : (i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %4630 = arith.addi %4626, %__rlasp_stack_elide_zero_221 : i64
      %4631 = func.call @cc_nil_value() : () -> i64
      %4632 = func.call @cc_errorp(%4325) : (i64) -> i64
      %4633 = arith.cmpi ne, %4632, %4631 : i64
      %4634 = arith.cmpi eq, %4631, %4631 : i64
      %4635 = arith.andi %4633, %4634 : i1
      %4636 = scf.if %4635 -> (i64) {
        scf.yield %4325 : i64
      } else {
        scf.yield %4631 : i64
      }
      %4637 = func.call @cc_errorp(%4522) : (i64) -> i64
      %4638 = arith.cmpi ne, %4637, %4631 : i64
      %4639 = arith.cmpi eq, %4636, %4631 : i64
      %4640 = arith.andi %4638, %4639 : i1
      %4641 = scf.if %4640 -> (i64) {
        scf.yield %4522 : i64
      } else {
        scf.yield %4636 : i64
      }
      %4642 = func.call @cc_errorp(%4588) : (i64) -> i64
      %4643 = arith.cmpi ne, %4642, %4631 : i64
      %4644 = arith.cmpi eq, %4641, %4631 : i64
      %4645 = arith.andi %4643, %4644 : i1
      %4646 = scf.if %4645 -> (i64) {
        scf.yield %4588 : i64
      } else {
        scf.yield %4641 : i64
      }
      %4647 = func.call @cc_errorp(%4600) : (i64) -> i64
      %4648 = arith.cmpi ne, %4647, %4631 : i64
      %4649 = arith.cmpi eq, %4646, %4631 : i64
      %4650 = arith.andi %4648, %4649 : i1
      %4651 = scf.if %4650 -> (i64) {
        scf.yield %4600 : i64
      } else {
        scf.yield %4646 : i64
      }
      %4652 = func.call @cc_errorp(%4607) : (i64) -> i64
      %4653 = arith.cmpi ne, %4652, %4631 : i64
      %4654 = arith.cmpi eq, %4651, %4631 : i64
      %4655 = arith.andi %4653, %4654 : i1
      %4656 = scf.if %4655 -> (i64) {
        scf.yield %4607 : i64
      } else {
        scf.yield %4651 : i64
      }
      %4657 = func.call @cc_errorp(%4611) : (i64) -> i64
      %4658 = arith.cmpi ne, %4657, %4631 : i64
      %4659 = arith.cmpi eq, %4656, %4631 : i64
      %4660 = arith.andi %4658, %4659 : i1
      %4661 = scf.if %4660 -> (i64) {
        scf.yield %4611 : i64
      } else {
        scf.yield %4656 : i64
      }
      %4662 = func.call @cc_errorp(%4618) : (i64) -> i64
      %4663 = arith.cmpi ne, %4662, %4631 : i64
      %4664 = arith.cmpi eq, %4661, %4631 : i64
      %4665 = arith.andi %4663, %4664 : i1
      %4666 = scf.if %4665 -> (i64) {
        scf.yield %4618 : i64
      } else {
        scf.yield %4661 : i64
      }
      %4667 = func.call @cc_errorp(%4630) : (i64) -> i64
      %4668 = arith.cmpi ne, %4667, %4631 : i64
      %4669 = arith.cmpi eq, %4666, %4631 : i64
      %4670 = arith.andi %4668, %4669 : i1
      %4671 = scf.if %4670 -> (i64) {
        scf.yield %4630 : i64
      } else {
        scf.yield %4666 : i64
      }
      %4672 = arith.cmpi ne, %4671, %4631 : i64
      scf.if %4672 {
        func.call @stack_push_pointer(%4671) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4325) : (i64) -> ()
        func.call @stack_push_pointer(%4522) : (i64) -> ()
        func.call @stack_push_pointer(%4588) : (i64) -> ()
        func.call @stack_push_pointer(%4600) : (i64) -> ()
        func.call @stack_push_pointer(%4607) : (i64) -> ()
        func.call @stack_push_pointer(%4611) : (i64) -> ()
        func.call @stack_push_pointer(%4618) : (i64) -> ()
        func.call @stack_push_pointer(%4630) : (i64) -> ()
        %4673 = llvm.mlir.addressof @str455 : !llvm.ptr
        %4674 = func.call @cc_make_function_ref_const(%4673) : (!llvm.ptr) -> i64
        %4675 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4674, %4675) : (i64, i64) -> ()
      }
      %4676 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4676 : i64
    }
    %4677 = func.call @cc_nil_value() : () -> i64
    %4678 = func.call @cc_errorp(%4316) : (i64) -> i64
    %4679 = arith.cmpi ne, %4678, %4677 : i64
    %4680 = scf.if %4679 -> (i64) {
      scf.yield %4316 : i64
    } else {
      %4681 = llvm.mlir.addressof @str456 : !llvm.ptr
      %4682 = arith.constant 18 : i64
      %4683 = func.call @cc_make_string(%4681, %4682) : (!llvm.ptr, i64) -> i64
      %4684 = func.call @cc_nil_value() : () -> i64
      %4685 = func.call @cc_intern(%4683, %4684) : (i64, i64) -> i64
      %4686 = func.call @cc_nil_value() : () -> i64
      %4687 = func.call @cc_cons(%4685, %4686) : (i64, i64) -> i64
      %4688 = func.call @cc_values_pack(%4687) : (i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %4689 = arith.addi %4685, %__rlasp_stack_elide_zero_222 : i64
      %4690 = llvm.mlir.addressof @str457 : !llvm.ptr
      %4691 = arith.constant 3 : i64
      %4692 = func.call @cc_make_string(%4690, %4691) : (!llvm.ptr, i64) -> i64
      %4693 = func.call @cc_nil_value() : () -> i64
      %4694 = func.call @cc_intern(%4692, %4693) : (i64, i64) -> i64
      %4695 = func.call @cc_nil_value() : () -> i64
      %4696 = func.call @cc_cons(%4694, %4695) : (i64, i64) -> i64
      %4697 = func.call @cc_values_pack(%4696) : (i64) -> i64
      func.call @stack_push_pointer(%4694) : (i64) -> ()
      %4698 = llvm.mlir.addressof @str458 : !llvm.ptr
      %4699 = arith.constant 3 : i64
      %4700 = func.call @cc_make_string(%4698, %4699) : (!llvm.ptr, i64) -> i64
      %4701 = func.call @cc_nil_value() : () -> i64
      %4702 = func.call @cc_intern(%4700, %4701) : (i64, i64) -> i64
      %4703 = func.call @cc_nil_value() : () -> i64
      %4704 = func.call @cc_cons(%4702, %4703) : (i64, i64) -> i64
      %4705 = func.call @cc_values_pack(%4704) : (i64) -> i64
      func.call @stack_push_pointer(%4702) : (i64) -> ()
      %4706 = llvm.mlir.addressof @str459 : !llvm.ptr
      %4707 = arith.constant 19 : i64
      %4708 = func.call @cc_make_string(%4706, %4707) : (!llvm.ptr, i64) -> i64
      %4709 = llvm.mlir.addressof @str460 : !llvm.ptr
      %4710 = arith.constant 11 : i64
      %4711 = func.call @cc_make_string(%4709, %4710) : (!llvm.ptr, i64) -> i64
      %4712 = func.call @cc_intern(%4708, %4711) : (i64, i64) -> i64
      %4713 = func.call @cc_nil_value() : () -> i64
      %4714 = func.call @cc_cons(%4712, %4713) : (i64, i64) -> i64
      %4715 = func.call @cc_values_pack(%4714) : (i64) -> i64
      func.call @stack_push_pointer(%4712) : (i64) -> ()
      %4716 = llvm.mlir.addressof @str461 : !llvm.ptr
      %4717 = arith.constant 2 : i64
      %4718 = func.call @cc_make_string(%4716, %4717) : (!llvm.ptr, i64) -> i64
      %4719 = llvm.mlir.addressof @str462 : !llvm.ptr
      %4720 = arith.constant 11 : i64
      %4721 = func.call @cc_make_string(%4719, %4720) : (!llvm.ptr, i64) -> i64
      %4722 = func.call @cc_intern(%4718, %4721) : (i64, i64) -> i64
      %4723 = func.call @cc_nil_value() : () -> i64
      %4724 = func.call @cc_cons(%4722, %4723) : (i64, i64) -> i64
      %4725 = func.call @cc_values_pack(%4724) : (i64) -> i64
      func.call @stack_push_pointer(%4722) : (i64) -> ()
      %4726 = llvm.mlir.addressof @str463 : !llvm.ptr
      %4727 = arith.constant 2 : i64
      %4728 = func.call @cc_make_string(%4726, %4727) : (!llvm.ptr, i64) -> i64
      %4729 = llvm.mlir.addressof @str464 : !llvm.ptr
      %4730 = arith.constant 11 : i64
      %4731 = func.call @cc_make_string(%4729, %4730) : (!llvm.ptr, i64) -> i64
      %4732 = func.call @cc_intern(%4728, %4731) : (i64, i64) -> i64
      %4733 = func.call @cc_nil_value() : () -> i64
      %4734 = func.call @cc_cons(%4732, %4733) : (i64, i64) -> i64
      %4735 = func.call @cc_values_pack(%4734) : (i64) -> i64
      func.call @stack_push_pointer(%4732) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4736 = func.call @stack_pop_pointer() : () -> i64
      %4737 = func.call @stack_pop_pointer() : () -> i64
      %4738 = func.call @cc_cons(%4737, %4736) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %4739 = arith.addi %4738, %__rlasp_stack_elide_zero_223 : i64
      %4740 = func.call @stack_pop_pointer() : () -> i64
      %4741 = func.call @cc_cons(%4740, %4739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4741) : (i64) -> ()
      %4742 = llvm.mlir.addressof @str465 : !llvm.ptr
      %4743 = arith.constant 8 : i64
      %4744 = func.call @cc_make_string(%4742, %4743) : (!llvm.ptr, i64) -> i64
      %4745 = llvm.mlir.addressof @str466 : !llvm.ptr
      %4746 = arith.constant 11 : i64
      %4747 = func.call @cc_make_string(%4745, %4746) : (!llvm.ptr, i64) -> i64
      %4748 = func.call @cc_intern(%4744, %4747) : (i64, i64) -> i64
      %4749 = func.call @cc_nil_value() : () -> i64
      %4750 = func.call @cc_cons(%4748, %4749) : (i64, i64) -> i64
      %4751 = func.call @cc_values_pack(%4750) : (i64) -> i64
      func.call @stack_push_pointer(%4748) : (i64) -> ()
      %4752 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4752) : (i64) -> ()
      %4753 = llvm.mlir.addressof @str467 : !llvm.ptr
      %4754 = arith.constant 11 : i64
      %4755 = func.call @cc_make_string(%4753, %4754) : (!llvm.ptr, i64) -> i64
      %4756 = llvm.mlir.addressof @str468 : !llvm.ptr
      %4757 = arith.constant 11 : i64
      %4758 = func.call @cc_make_string(%4756, %4757) : (!llvm.ptr, i64) -> i64
      %4759 = func.call @cc_intern(%4755, %4758) : (i64, i64) -> i64
      %4760 = func.call @cc_nil_value() : () -> i64
      %4761 = func.call @cc_cons(%4759, %4760) : (i64, i64) -> i64
      %4762 = func.call @cc_values_pack(%4761) : (i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %4763 = arith.addi %4759, %__rlasp_stack_elide_zero_224 : i64
      %4764 = func.call @stack_pop_pointer() : () -> i64
      %4765 = func.call @cc_cons(%4763, %4764) : (i64, i64) -> i64
      %4766 = llvm.mlir.addressof @str469 : !llvm.ptr
      %4767 = arith.constant 5 : i64
      %4768 = func.call @cc_make_string(%4766, %4767) : (!llvm.ptr, i64) -> i64
      %4769 = func.call @cc_nil_value() : () -> i64
      %4770 = func.call @cc_intern(%4768, %4769) : (i64, i64) -> i64
      %4771 = func.call @cc_nil_value() : () -> i64
      %4772 = func.call @cc_cons(%4770, %4771) : (i64, i64) -> i64
      %4773 = func.call @cc_values_pack(%4772) : (i64) -> i64
      %4774 = func.call @cc_cons(%4770, %4765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4774) : (i64) -> ()
      %4775 = llvm.mlir.addressof @str470 : !llvm.ptr
      %4776 = arith.constant 10 : i64
      %4777 = func.call @cc_make_string(%4775, %4776) : (!llvm.ptr, i64) -> i64
      %4778 = llvm.mlir.addressof @str471 : !llvm.ptr
      %4779 = arith.constant 11 : i64
      %4780 = func.call @cc_make_string(%4778, %4779) : (!llvm.ptr, i64) -> i64
      %4781 = func.call @cc_intern(%4777, %4780) : (i64, i64) -> i64
      %4782 = func.call @cc_nil_value() : () -> i64
      %4783 = func.call @cc_cons(%4781, %4782) : (i64, i64) -> i64
      %4784 = func.call @cc_values_pack(%4783) : (i64) -> i64
      func.call @stack_push_pointer(%4781) : (i64) -> ()
      %4785 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4785) : (i64) -> ()
      %4786 = llvm.mlir.addressof @str472 : !llvm.ptr
      %4787 = arith.constant 11 : i64
      %4788 = func.call @cc_make_string(%4786, %4787) : (!llvm.ptr, i64) -> i64
      %4789 = llvm.mlir.addressof @str473 : !llvm.ptr
      %4790 = arith.constant 11 : i64
      %4791 = func.call @cc_make_string(%4789, %4790) : (!llvm.ptr, i64) -> i64
      %4792 = func.call @cc_intern(%4788, %4791) : (i64, i64) -> i64
      %4793 = func.call @cc_nil_value() : () -> i64
      %4794 = func.call @cc_cons(%4792, %4793) : (i64, i64) -> i64
      %4795 = func.call @cc_values_pack(%4794) : (i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %4796 = arith.addi %4792, %__rlasp_stack_elide_zero_225 : i64
      %4797 = func.call @stack_pop_pointer() : () -> i64
      %4798 = func.call @cc_cons(%4796, %4797) : (i64, i64) -> i64
      %4799 = llvm.mlir.addressof @str474 : !llvm.ptr
      %4800 = arith.constant 5 : i64
      %4801 = func.call @cc_make_string(%4799, %4800) : (!llvm.ptr, i64) -> i64
      %4802 = func.call @cc_nil_value() : () -> i64
      %4803 = func.call @cc_intern(%4801, %4802) : (i64, i64) -> i64
      %4804 = func.call @cc_nil_value() : () -> i64
      %4805 = func.call @cc_cons(%4803, %4804) : (i64, i64) -> i64
      %4806 = func.call @cc_values_pack(%4805) : (i64) -> i64
      %4807 = func.call @cc_cons(%4803, %4798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4808 = func.call @stack_pop_pointer() : () -> i64
      %4809 = func.call @stack_pop_pointer() : () -> i64
      %4810 = func.call @cc_cons(%4809, %4808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %4811 = arith.addi %4810, %__rlasp_stack_elide_zero_226 : i64
      %4812 = func.call @stack_pop_pointer() : () -> i64
      %4813 = func.call @cc_cons(%4812, %4811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4814 = func.call @stack_pop_pointer() : () -> i64
      %4815 = func.call @stack_pop_pointer() : () -> i64
      %4816 = func.call @cc_cons(%4815, %4814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %4817 = arith.addi %4816, %__rlasp_stack_elide_zero_227 : i64
      %4818 = func.call @stack_pop_pointer() : () -> i64
      %4819 = func.call @cc_cons(%4818, %4817) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %4820 = arith.addi %4819, %__rlasp_stack_elide_zero_228 : i64
      %4821 = func.call @stack_pop_pointer() : () -> i64
      %4822 = func.call @cc_cons(%4821, %4820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4822) : (i64) -> ()
      %4823 = llvm.mlir.addressof @str475 : !llvm.ptr
      %4824 = arith.constant 3 : i64
      %4825 = func.call @cc_make_string(%4823, %4824) : (!llvm.ptr, i64) -> i64
      %4826 = llvm.mlir.addressof @str476 : !llvm.ptr
      %4827 = arith.constant 11 : i64
      %4828 = func.call @cc_make_string(%4826, %4827) : (!llvm.ptr, i64) -> i64
      %4829 = func.call @cc_intern(%4825, %4828) : (i64, i64) -> i64
      %4830 = func.call @cc_nil_value() : () -> i64
      %4831 = func.call @cc_cons(%4829, %4830) : (i64, i64) -> i64
      %4832 = func.call @cc_values_pack(%4831) : (i64) -> i64
      func.call @stack_push_pointer(%4829) : (i64) -> ()
      %4833 = llvm.mlir.addressof @str477 : !llvm.ptr
      %4834 = arith.constant 2 : i64
      %4835 = func.call @cc_make_string(%4833, %4834) : (!llvm.ptr, i64) -> i64
      %4836 = llvm.mlir.addressof @str478 : !llvm.ptr
      %4837 = arith.constant 11 : i64
      %4838 = func.call @cc_make_string(%4836, %4837) : (!llvm.ptr, i64) -> i64
      %4839 = func.call @cc_intern(%4835, %4838) : (i64, i64) -> i64
      %4840 = func.call @cc_nil_value() : () -> i64
      %4841 = func.call @cc_cons(%4839, %4840) : (i64, i64) -> i64
      %4842 = func.call @cc_values_pack(%4841) : (i64) -> i64
      func.call @stack_push_pointer(%4839) : (i64) -> ()
      %4843 = llvm.mlir.addressof @str479 : !llvm.ptr
      %4844 = arith.constant 2 : i64
      %4845 = func.call @cc_make_string(%4843, %4844) : (!llvm.ptr, i64) -> i64
      %4846 = llvm.mlir.addressof @str480 : !llvm.ptr
      %4847 = arith.constant 11 : i64
      %4848 = func.call @cc_make_string(%4846, %4847) : (!llvm.ptr, i64) -> i64
      %4849 = func.call @cc_intern(%4845, %4848) : (i64, i64) -> i64
      %4850 = func.call @cc_nil_value() : () -> i64
      %4851 = func.call @cc_cons(%4849, %4850) : (i64, i64) -> i64
      %4852 = func.call @cc_values_pack(%4851) : (i64) -> i64
      func.call @stack_push_pointer(%4849) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4853 = func.call @stack_pop_pointer() : () -> i64
      %4854 = func.call @stack_pop_pointer() : () -> i64
      %4855 = func.call @cc_cons(%4854, %4853) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %4856 = arith.addi %4855, %__rlasp_stack_elide_zero_229 : i64
      %4857 = func.call @stack_pop_pointer() : () -> i64
      %4858 = func.call @cc_cons(%4857, %4856) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %4859 = arith.addi %4858, %__rlasp_stack_elide_zero_230 : i64
      %4860 = func.call @stack_pop_pointer() : () -> i64
      %4861 = func.call @cc_cons(%4860, %4859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4861) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4862 = func.call @stack_pop_pointer() : () -> i64
      %4863 = func.call @stack_pop_pointer() : () -> i64
      %4864 = func.call @cc_cons(%4863, %4862) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %4865 = arith.addi %4864, %__rlasp_stack_elide_zero_231 : i64
      %4866 = func.call @stack_pop_pointer() : () -> i64
      %4867 = func.call @cc_cons(%4866, %4865) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %4868 = arith.addi %4867, %__rlasp_stack_elide_zero_232 : i64
      %4869 = func.call @stack_pop_pointer() : () -> i64
      %4870 = func.call @cc_cons(%4869, %4868) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %4871 = arith.addi %4870, %__rlasp_stack_elide_zero_233 : i64
      %4872 = func.call @stack_pop_pointer() : () -> i64
      %4873 = func.call @cc_cons(%4872, %4871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4874 = func.call @stack_pop_pointer() : () -> i64
      %4875 = func.call @stack_pop_pointer() : () -> i64
      %4876 = func.call @cc_cons(%4875, %4874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %4877 = arith.addi %4876, %__rlasp_stack_elide_zero_234 : i64
      %4878 = func.call @stack_pop_pointer() : () -> i64
      %4879 = func.call @cc_cons(%4878, %4877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4879) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4880 = func.call @stack_pop_pointer() : () -> i64
      %4881 = func.call @stack_pop_pointer() : () -> i64
      %4882 = func.call @cc_cons(%4881, %4880) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %4883 = arith.addi %4882, %__rlasp_stack_elide_zero_235 : i64
      %4884 = func.call @stack_pop_pointer() : () -> i64
      %4885 = func.call @cc_cons(%4884, %4883) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %4886 = arith.addi %4885, %__rlasp_stack_elide_zero_236 : i64
      %4949 = arith.constant 206494159077397 : i64
      %4950 = arith.constant 0 : i64
      %4951 = func.call @cc_make_closure(%4949, %4950) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %4952 = arith.addi %4951, %__rlasp_stack_elide_zero_237 : i64
      %4953 = llvm.mlir.addressof @str486 : !llvm.ptr
      %4954 = arith.constant 1 : i64
      %4955 = func.call @cc_make_string(%4953, %4954) : (!llvm.ptr, i64) -> i64
      %4956 = func.call @cc_nil_value() : () -> i64
      %4957 = func.call @cc_intern(%4955, %4956) : (i64, i64) -> i64
      %4958 = func.call @cc_nil_value() : () -> i64
      %4959 = func.call @cc_cons(%4957, %4958) : (i64, i64) -> i64
      %4960 = func.call @cc_values_pack(%4959) : (i64) -> i64
      func.call @stack_push_pointer(%4957) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4961 = func.call @stack_pop_pointer() : () -> i64
      %4962 = func.call @stack_pop_pointer() : () -> i64
      %4963 = func.call @cc_cons(%4962, %4961) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %4964 = arith.addi %4963, %__rlasp_stack_elide_zero_238 : i64
      %4965 = llvm.mlir.addressof @str487 : !llvm.ptr
      %4966 = arith.constant 11 : i64
      %4967 = func.call @cc_make_string(%4965, %4966) : (!llvm.ptr, i64) -> i64
      %4968 = llvm.mlir.addressof @str488 : !llvm.ptr
      %4969 = arith.constant 7 : i64
      %4970 = func.call @cc_make_string(%4968, %4969) : (!llvm.ptr, i64) -> i64
      %4971 = func.call @cc_intern(%4967, %4970) : (i64, i64) -> i64
      %4972 = func.call @cc_nil_value() : () -> i64
      %4973 = func.call @cc_cons(%4971, %4972) : (i64, i64) -> i64
      %4974 = func.call @cc_values_pack(%4973) : (i64) -> i64
      %4975 = func.call @cc_nil_value() : () -> i64
      %4976 = llvm.mlir.addressof @str489 : !llvm.ptr
      %4977 = arith.constant 4 : i64
      %4978 = func.call @cc_make_string(%4976, %4977) : (!llvm.ptr, i64) -> i64
      %4979 = llvm.mlir.addressof @str490 : !llvm.ptr
      %4980 = arith.constant 7 : i64
      %4981 = func.call @cc_make_string(%4979, %4980) : (!llvm.ptr, i64) -> i64
      %4982 = func.call @cc_intern(%4978, %4981) : (i64, i64) -> i64
      %4983 = func.call @cc_nil_value() : () -> i64
      %4984 = func.call @cc_cons(%4982, %4983) : (i64, i64) -> i64
      %4985 = func.call @cc_values_pack(%4984) : (i64) -> i64
      %4986 = llvm.mlir.addressof @str491 : !llvm.ptr
      %4987 = arith.constant 6 : i64
      %4988 = func.call @cc_make_string(%4986, %4987) : (!llvm.ptr, i64) -> i64
      %4989 = func.call @cc_nil_value() : () -> i64
      %4990 = func.call @cc_intern(%4988, %4989) : (i64, i64) -> i64
      %4991 = func.call @cc_nil_value() : () -> i64
      %4992 = func.call @cc_cons(%4990, %4991) : (i64, i64) -> i64
      %4993 = func.call @cc_values_pack(%4992) : (i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %4994 = arith.addi %4990, %__rlasp_stack_elide_zero_239 : i64
      %4995 = func.call @cc_nil_value() : () -> i64
      %4996 = func.call @cc_errorp(%4689) : (i64) -> i64
      %4997 = arith.cmpi ne, %4996, %4995 : i64
      %4998 = arith.cmpi eq, %4995, %4995 : i64
      %4999 = arith.andi %4997, %4998 : i1
      %5000 = scf.if %4999 -> (i64) {
        scf.yield %4689 : i64
      } else {
        scf.yield %4995 : i64
      }
      %5001 = func.call @cc_errorp(%4886) : (i64) -> i64
      %5002 = arith.cmpi ne, %5001, %4995 : i64
      %5003 = arith.cmpi eq, %5000, %4995 : i64
      %5004 = arith.andi %5002, %5003 : i1
      %5005 = scf.if %5004 -> (i64) {
        scf.yield %4886 : i64
      } else {
        scf.yield %5000 : i64
      }
      %5006 = func.call @cc_errorp(%4952) : (i64) -> i64
      %5007 = arith.cmpi ne, %5006, %4995 : i64
      %5008 = arith.cmpi eq, %5005, %4995 : i64
      %5009 = arith.andi %5007, %5008 : i1
      %5010 = scf.if %5009 -> (i64) {
        scf.yield %4952 : i64
      } else {
        scf.yield %5005 : i64
      }
      %5011 = func.call @cc_errorp(%4964) : (i64) -> i64
      %5012 = arith.cmpi ne, %5011, %4995 : i64
      %5013 = arith.cmpi eq, %5010, %4995 : i64
      %5014 = arith.andi %5012, %5013 : i1
      %5015 = scf.if %5014 -> (i64) {
        scf.yield %4964 : i64
      } else {
        scf.yield %5010 : i64
      }
      %5016 = func.call @cc_errorp(%4971) : (i64) -> i64
      %5017 = arith.cmpi ne, %5016, %4995 : i64
      %5018 = arith.cmpi eq, %5015, %4995 : i64
      %5019 = arith.andi %5017, %5018 : i1
      %5020 = scf.if %5019 -> (i64) {
        scf.yield %4971 : i64
      } else {
        scf.yield %5015 : i64
      }
      %5021 = func.call @cc_errorp(%4975) : (i64) -> i64
      %5022 = arith.cmpi ne, %5021, %4995 : i64
      %5023 = arith.cmpi eq, %5020, %4995 : i64
      %5024 = arith.andi %5022, %5023 : i1
      %5025 = scf.if %5024 -> (i64) {
        scf.yield %4975 : i64
      } else {
        scf.yield %5020 : i64
      }
      %5026 = func.call @cc_errorp(%4982) : (i64) -> i64
      %5027 = arith.cmpi ne, %5026, %4995 : i64
      %5028 = arith.cmpi eq, %5025, %4995 : i64
      %5029 = arith.andi %5027, %5028 : i1
      %5030 = scf.if %5029 -> (i64) {
        scf.yield %4982 : i64
      } else {
        scf.yield %5025 : i64
      }
      %5031 = func.call @cc_errorp(%4994) : (i64) -> i64
      %5032 = arith.cmpi ne, %5031, %4995 : i64
      %5033 = arith.cmpi eq, %5030, %4995 : i64
      %5034 = arith.andi %5032, %5033 : i1
      %5035 = scf.if %5034 -> (i64) {
        scf.yield %4994 : i64
      } else {
        scf.yield %5030 : i64
      }
      %5036 = arith.cmpi ne, %5035, %4995 : i64
      scf.if %5036 {
        func.call @stack_push_pointer(%5035) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4689) : (i64) -> ()
        func.call @stack_push_pointer(%4886) : (i64) -> ()
        func.call @stack_push_pointer(%4952) : (i64) -> ()
        func.call @stack_push_pointer(%4964) : (i64) -> ()
        func.call @stack_push_pointer(%4971) : (i64) -> ()
        func.call @stack_push_pointer(%4975) : (i64) -> ()
        func.call @stack_push_pointer(%4982) : (i64) -> ()
        func.call @stack_push_pointer(%4994) : (i64) -> ()
        %5037 = llvm.mlir.addressof @str492 : !llvm.ptr
        %5038 = func.call @cc_make_function_ref_const(%5037) : (!llvm.ptr) -> i64
        %5039 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5038, %5039) : (i64, i64) -> ()
      }
      %5040 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5040 : i64
    }
    %5041 = func.call @cc_nil_value() : () -> i64
    %5042 = func.call @cc_errorp(%4680) : (i64) -> i64
    %5043 = arith.cmpi ne, %5042, %5041 : i64
    %5044 = scf.if %5043 -> (i64) {
      scf.yield %4680 : i64
    } else {
      %5045 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5046 = arith.constant 18 : i64
      %5047 = func.call @cc_make_string(%5045, %5046) : (!llvm.ptr, i64) -> i64
      %5048 = func.call @cc_nil_value() : () -> i64
      %5049 = func.call @cc_intern(%5047, %5048) : (i64, i64) -> i64
      %5050 = func.call @cc_nil_value() : () -> i64
      %5051 = func.call @cc_cons(%5049, %5050) : (i64, i64) -> i64
      %5052 = func.call @cc_values_pack(%5051) : (i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %5053 = arith.addi %5049, %__rlasp_stack_elide_zero_240 : i64
      %5054 = llvm.mlir.addressof @str494 : !llvm.ptr
      %5055 = arith.constant 3 : i64
      %5056 = func.call @cc_make_string(%5054, %5055) : (!llvm.ptr, i64) -> i64
      %5057 = func.call @cc_nil_value() : () -> i64
      %5058 = func.call @cc_intern(%5056, %5057) : (i64, i64) -> i64
      %5059 = func.call @cc_nil_value() : () -> i64
      %5060 = func.call @cc_cons(%5058, %5059) : (i64, i64) -> i64
      %5061 = func.call @cc_values_pack(%5060) : (i64) -> i64
      func.call @stack_push_pointer(%5058) : (i64) -> ()
      %5062 = llvm.mlir.addressof @str495 : !llvm.ptr
      %5063 = arith.constant 3 : i64
      %5064 = func.call @cc_make_string(%5062, %5063) : (!llvm.ptr, i64) -> i64
      %5065 = func.call @cc_nil_value() : () -> i64
      %5066 = func.call @cc_intern(%5064, %5065) : (i64, i64) -> i64
      %5067 = func.call @cc_nil_value() : () -> i64
      %5068 = func.call @cc_cons(%5066, %5067) : (i64, i64) -> i64
      %5069 = func.call @cc_values_pack(%5068) : (i64) -> i64
      func.call @stack_push_pointer(%5066) : (i64) -> ()
      %5070 = llvm.mlir.addressof @str496 : !llvm.ptr
      %5071 = arith.constant 19 : i64
      %5072 = func.call @cc_make_string(%5070, %5071) : (!llvm.ptr, i64) -> i64
      %5073 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5074 = arith.constant 11 : i64
      %5075 = func.call @cc_make_string(%5073, %5074) : (!llvm.ptr, i64) -> i64
      %5076 = func.call @cc_intern(%5072, %5075) : (i64, i64) -> i64
      %5077 = func.call @cc_nil_value() : () -> i64
      %5078 = func.call @cc_cons(%5076, %5077) : (i64, i64) -> i64
      %5079 = func.call @cc_values_pack(%5078) : (i64) -> i64
      func.call @stack_push_pointer(%5076) : (i64) -> ()
      %5080 = llvm.mlir.addressof @str498 : !llvm.ptr
      %5081 = arith.constant 2 : i64
      %5082 = func.call @cc_make_string(%5080, %5081) : (!llvm.ptr, i64) -> i64
      %5083 = llvm.mlir.addressof @str499 : !llvm.ptr
      %5084 = arith.constant 11 : i64
      %5085 = func.call @cc_make_string(%5083, %5084) : (!llvm.ptr, i64) -> i64
      %5086 = func.call @cc_intern(%5082, %5085) : (i64, i64) -> i64
      %5087 = func.call @cc_nil_value() : () -> i64
      %5088 = func.call @cc_cons(%5086, %5087) : (i64, i64) -> i64
      %5089 = func.call @cc_values_pack(%5088) : (i64) -> i64
      func.call @stack_push_pointer(%5086) : (i64) -> ()
      %5090 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5091 = arith.constant 2 : i64
      %5092 = func.call @cc_make_string(%5090, %5091) : (!llvm.ptr, i64) -> i64
      %5093 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5094 = arith.constant 11 : i64
      %5095 = func.call @cc_make_string(%5093, %5094) : (!llvm.ptr, i64) -> i64
      %5096 = func.call @cc_intern(%5092, %5095) : (i64, i64) -> i64
      %5097 = func.call @cc_nil_value() : () -> i64
      %5098 = func.call @cc_cons(%5096, %5097) : (i64, i64) -> i64
      %5099 = func.call @cc_values_pack(%5098) : (i64) -> i64
      func.call @stack_push_pointer(%5096) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5100 = func.call @stack_pop_pointer() : () -> i64
      %5101 = func.call @stack_pop_pointer() : () -> i64
      %5102 = func.call @cc_cons(%5101, %5100) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %5103 = arith.addi %5102, %__rlasp_stack_elide_zero_241 : i64
      %5104 = func.call @stack_pop_pointer() : () -> i64
      %5105 = func.call @cc_cons(%5104, %5103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5105) : (i64) -> ()
      %5106 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5107 = arith.constant 8 : i64
      %5108 = func.call @cc_make_string(%5106, %5107) : (!llvm.ptr, i64) -> i64
      %5109 = llvm.mlir.addressof @str503 : !llvm.ptr
      %5110 = arith.constant 11 : i64
      %5111 = func.call @cc_make_string(%5109, %5110) : (!llvm.ptr, i64) -> i64
      %5112 = func.call @cc_intern(%5108, %5111) : (i64, i64) -> i64
      %5113 = func.call @cc_nil_value() : () -> i64
      %5114 = func.call @cc_cons(%5112, %5113) : (i64, i64) -> i64
      %5115 = func.call @cc_values_pack(%5114) : (i64) -> i64
      func.call @stack_push_pointer(%5112) : (i64) -> ()
      %5116 = llvm.mlir.addressof @str504 : !llvm.ptr
      %5117 = arith.constant 10 : i64
      %5118 = func.call @cc_make_string(%5116, %5117) : (!llvm.ptr, i64) -> i64
      %5119 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5120 = arith.constant 11 : i64
      %5121 = func.call @cc_make_string(%5119, %5120) : (!llvm.ptr, i64) -> i64
      %5122 = func.call @cc_intern(%5118, %5121) : (i64, i64) -> i64
      %5123 = func.call @cc_nil_value() : () -> i64
      %5124 = func.call @cc_cons(%5122, %5123) : (i64, i64) -> i64
      %5125 = func.call @cc_values_pack(%5124) : (i64) -> i64
      func.call @stack_push_pointer(%5122) : (i64) -> ()
      %5126 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5126) : (i64) -> ()
      %5127 = llvm.mlir.addressof @str506 : !llvm.ptr
      %5128 = arith.constant 11 : i64
      %5129 = func.call @cc_make_string(%5127, %5128) : (!llvm.ptr, i64) -> i64
      %5130 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5131 = arith.constant 11 : i64
      %5132 = func.call @cc_make_string(%5130, %5131) : (!llvm.ptr, i64) -> i64
      %5133 = func.call @cc_intern(%5129, %5132) : (i64, i64) -> i64
      %5134 = func.call @cc_nil_value() : () -> i64
      %5135 = func.call @cc_cons(%5133, %5134) : (i64, i64) -> i64
      %5136 = func.call @cc_values_pack(%5135) : (i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %5137 = arith.addi %5133, %__rlasp_stack_elide_zero_242 : i64
      %5138 = func.call @stack_pop_pointer() : () -> i64
      %5139 = func.call @cc_cons(%5137, %5138) : (i64, i64) -> i64
      %5140 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5141 = arith.constant 5 : i64
      %5142 = func.call @cc_make_string(%5140, %5141) : (!llvm.ptr, i64) -> i64
      %5143 = func.call @cc_nil_value() : () -> i64
      %5144 = func.call @cc_intern(%5142, %5143) : (i64, i64) -> i64
      %5145 = func.call @cc_nil_value() : () -> i64
      %5146 = func.call @cc_cons(%5144, %5145) : (i64, i64) -> i64
      %5147 = func.call @cc_values_pack(%5146) : (i64) -> i64
      %5148 = func.call @cc_cons(%5144, %5139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5149 = func.call @stack_pop_pointer() : () -> i64
      %5150 = func.call @stack_pop_pointer() : () -> i64
      %5151 = func.call @cc_cons(%5150, %5149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %5152 = arith.addi %5151, %__rlasp_stack_elide_zero_243 : i64
      %5153 = func.call @stack_pop_pointer() : () -> i64
      %5154 = func.call @cc_cons(%5153, %5152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5154) : (i64) -> ()
      %5155 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5155) : (i64) -> ()
      %5156 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5157 = arith.constant 11 : i64
      %5158 = func.call @cc_make_string(%5156, %5157) : (!llvm.ptr, i64) -> i64
      %5159 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5160 = arith.constant 11 : i64
      %5161 = func.call @cc_make_string(%5159, %5160) : (!llvm.ptr, i64) -> i64
      %5162 = func.call @cc_intern(%5158, %5161) : (i64, i64) -> i64
      %5163 = func.call @cc_nil_value() : () -> i64
      %5164 = func.call @cc_cons(%5162, %5163) : (i64, i64) -> i64
      %5165 = func.call @cc_values_pack(%5164) : (i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %5166 = arith.addi %5162, %__rlasp_stack_elide_zero_244 : i64
      %5167 = func.call @stack_pop_pointer() : () -> i64
      %5168 = func.call @cc_cons(%5166, %5167) : (i64, i64) -> i64
      %5169 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5170 = arith.constant 5 : i64
      %5171 = func.call @cc_make_string(%5169, %5170) : (!llvm.ptr, i64) -> i64
      %5172 = func.call @cc_nil_value() : () -> i64
      %5173 = func.call @cc_intern(%5171, %5172) : (i64, i64) -> i64
      %5174 = func.call @cc_nil_value() : () -> i64
      %5175 = func.call @cc_cons(%5173, %5174) : (i64, i64) -> i64
      %5176 = func.call @cc_values_pack(%5175) : (i64) -> i64
      %5177 = func.call @cc_cons(%5173, %5168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5178 = func.call @stack_pop_pointer() : () -> i64
      %5179 = func.call @stack_pop_pointer() : () -> i64
      %5180 = func.call @cc_cons(%5179, %5178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %5181 = arith.addi %5180, %__rlasp_stack_elide_zero_245 : i64
      %5182 = func.call @stack_pop_pointer() : () -> i64
      %5183 = func.call @cc_cons(%5182, %5181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %5184 = arith.addi %5183, %__rlasp_stack_elide_zero_246 : i64
      %5185 = func.call @stack_pop_pointer() : () -> i64
      %5186 = func.call @cc_cons(%5185, %5184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5186) : (i64) -> ()
      %5187 = llvm.mlir.addressof @str512 : !llvm.ptr
      %5188 = arith.constant 3 : i64
      %5189 = func.call @cc_make_string(%5187, %5188) : (!llvm.ptr, i64) -> i64
      %5190 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5191 = arith.constant 11 : i64
      %5192 = func.call @cc_make_string(%5190, %5191) : (!llvm.ptr, i64) -> i64
      %5193 = func.call @cc_intern(%5189, %5192) : (i64, i64) -> i64
      %5194 = func.call @cc_nil_value() : () -> i64
      %5195 = func.call @cc_cons(%5193, %5194) : (i64, i64) -> i64
      %5196 = func.call @cc_values_pack(%5195) : (i64) -> i64
      func.call @stack_push_pointer(%5193) : (i64) -> ()
      %5197 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5198 = arith.constant 2 : i64
      %5199 = func.call @cc_make_string(%5197, %5198) : (!llvm.ptr, i64) -> i64
      %5200 = llvm.mlir.addressof @str515 : !llvm.ptr
      %5201 = arith.constant 11 : i64
      %5202 = func.call @cc_make_string(%5200, %5201) : (!llvm.ptr, i64) -> i64
      %5203 = func.call @cc_intern(%5199, %5202) : (i64, i64) -> i64
      %5204 = func.call @cc_nil_value() : () -> i64
      %5205 = func.call @cc_cons(%5203, %5204) : (i64, i64) -> i64
      %5206 = func.call @cc_values_pack(%5205) : (i64) -> i64
      func.call @stack_push_pointer(%5203) : (i64) -> ()
      %5207 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5208 = arith.constant 2 : i64
      %5209 = func.call @cc_make_string(%5207, %5208) : (!llvm.ptr, i64) -> i64
      %5210 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5211 = arith.constant 11 : i64
      %5212 = func.call @cc_make_string(%5210, %5211) : (!llvm.ptr, i64) -> i64
      %5213 = func.call @cc_intern(%5209, %5212) : (i64, i64) -> i64
      %5214 = func.call @cc_nil_value() : () -> i64
      %5215 = func.call @cc_cons(%5213, %5214) : (i64, i64) -> i64
      %5216 = func.call @cc_values_pack(%5215) : (i64) -> i64
      func.call @stack_push_pointer(%5213) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5217 = func.call @stack_pop_pointer() : () -> i64
      %5218 = func.call @stack_pop_pointer() : () -> i64
      %5219 = func.call @cc_cons(%5218, %5217) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %5220 = arith.addi %5219, %__rlasp_stack_elide_zero_247 : i64
      %5221 = func.call @stack_pop_pointer() : () -> i64
      %5222 = func.call @cc_cons(%5221, %5220) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %5223 = arith.addi %5222, %__rlasp_stack_elide_zero_248 : i64
      %5224 = func.call @stack_pop_pointer() : () -> i64
      %5225 = func.call @cc_cons(%5224, %5223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5225) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5226 = func.call @stack_pop_pointer() : () -> i64
      %5227 = func.call @stack_pop_pointer() : () -> i64
      %5228 = func.call @cc_cons(%5227, %5226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %5229 = arith.addi %5228, %__rlasp_stack_elide_zero_249 : i64
      %5230 = func.call @stack_pop_pointer() : () -> i64
      %5231 = func.call @cc_cons(%5230, %5229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %5232 = arith.addi %5231, %__rlasp_stack_elide_zero_250 : i64
      %5233 = func.call @stack_pop_pointer() : () -> i64
      %5234 = func.call @cc_cons(%5233, %5232) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %5235 = arith.addi %5234, %__rlasp_stack_elide_zero_251 : i64
      %5236 = func.call @stack_pop_pointer() : () -> i64
      %5237 = func.call @cc_cons(%5236, %5235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5238 = func.call @stack_pop_pointer() : () -> i64
      %5239 = func.call @stack_pop_pointer() : () -> i64
      %5240 = func.call @cc_cons(%5239, %5238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %5241 = arith.addi %5240, %__rlasp_stack_elide_zero_252 : i64
      %5242 = func.call @stack_pop_pointer() : () -> i64
      %5243 = func.call @cc_cons(%5242, %5241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5244 = func.call @stack_pop_pointer() : () -> i64
      %5245 = func.call @stack_pop_pointer() : () -> i64
      %5246 = func.call @cc_cons(%5245, %5244) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %5247 = arith.addi %5246, %__rlasp_stack_elide_zero_253 : i64
      %5248 = func.call @stack_pop_pointer() : () -> i64
      %5249 = func.call @cc_cons(%5248, %5247) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %5250 = arith.addi %5249, %__rlasp_stack_elide_zero_254 : i64
      %5313 = arith.constant 206494159077398 : i64
      %5314 = arith.constant 0 : i64
      %5315 = func.call @cc_make_closure(%5313, %5314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %5316 = arith.addi %5315, %__rlasp_stack_elide_zero_255 : i64
      %5317 = llvm.mlir.addressof @str523 : !llvm.ptr
      %5318 = arith.constant 1 : i64
      %5319 = func.call @cc_make_string(%5317, %5318) : (!llvm.ptr, i64) -> i64
      %5320 = func.call @cc_nil_value() : () -> i64
      %5321 = func.call @cc_intern(%5319, %5320) : (i64, i64) -> i64
      %5322 = func.call @cc_nil_value() : () -> i64
      %5323 = func.call @cc_cons(%5321, %5322) : (i64, i64) -> i64
      %5324 = func.call @cc_values_pack(%5323) : (i64) -> i64
      func.call @stack_push_pointer(%5321) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5325 = func.call @stack_pop_pointer() : () -> i64
      %5326 = func.call @stack_pop_pointer() : () -> i64
      %5327 = func.call @cc_cons(%5326, %5325) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %5328 = arith.addi %5327, %__rlasp_stack_elide_zero_256 : i64
      %5329 = llvm.mlir.addressof @str524 : !llvm.ptr
      %5330 = arith.constant 11 : i64
      %5331 = func.call @cc_make_string(%5329, %5330) : (!llvm.ptr, i64) -> i64
      %5332 = llvm.mlir.addressof @str525 : !llvm.ptr
      %5333 = arith.constant 7 : i64
      %5334 = func.call @cc_make_string(%5332, %5333) : (!llvm.ptr, i64) -> i64
      %5335 = func.call @cc_intern(%5331, %5334) : (i64, i64) -> i64
      %5336 = func.call @cc_nil_value() : () -> i64
      %5337 = func.call @cc_cons(%5335, %5336) : (i64, i64) -> i64
      %5338 = func.call @cc_values_pack(%5337) : (i64) -> i64
      %5339 = func.call @cc_nil_value() : () -> i64
      %5340 = llvm.mlir.addressof @str526 : !llvm.ptr
      %5341 = arith.constant 4 : i64
      %5342 = func.call @cc_make_string(%5340, %5341) : (!llvm.ptr, i64) -> i64
      %5343 = llvm.mlir.addressof @str527 : !llvm.ptr
      %5344 = arith.constant 7 : i64
      %5345 = func.call @cc_make_string(%5343, %5344) : (!llvm.ptr, i64) -> i64
      %5346 = func.call @cc_intern(%5342, %5345) : (i64, i64) -> i64
      %5347 = func.call @cc_nil_value() : () -> i64
      %5348 = func.call @cc_cons(%5346, %5347) : (i64, i64) -> i64
      %5349 = func.call @cc_values_pack(%5348) : (i64) -> i64
      %5350 = llvm.mlir.addressof @str528 : !llvm.ptr
      %5351 = arith.constant 6 : i64
      %5352 = func.call @cc_make_string(%5350, %5351) : (!llvm.ptr, i64) -> i64
      %5353 = func.call @cc_nil_value() : () -> i64
      %5354 = func.call @cc_intern(%5352, %5353) : (i64, i64) -> i64
      %5355 = func.call @cc_nil_value() : () -> i64
      %5356 = func.call @cc_cons(%5354, %5355) : (i64, i64) -> i64
      %5357 = func.call @cc_values_pack(%5356) : (i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %5358 = arith.addi %5354, %__rlasp_stack_elide_zero_257 : i64
      %5359 = func.call @cc_nil_value() : () -> i64
      %5360 = func.call @cc_errorp(%5053) : (i64) -> i64
      %5361 = arith.cmpi ne, %5360, %5359 : i64
      %5362 = arith.cmpi eq, %5359, %5359 : i64
      %5363 = arith.andi %5361, %5362 : i1
      %5364 = scf.if %5363 -> (i64) {
        scf.yield %5053 : i64
      } else {
        scf.yield %5359 : i64
      }
      %5365 = func.call @cc_errorp(%5250) : (i64) -> i64
      %5366 = arith.cmpi ne, %5365, %5359 : i64
      %5367 = arith.cmpi eq, %5364, %5359 : i64
      %5368 = arith.andi %5366, %5367 : i1
      %5369 = scf.if %5368 -> (i64) {
        scf.yield %5250 : i64
      } else {
        scf.yield %5364 : i64
      }
      %5370 = func.call @cc_errorp(%5316) : (i64) -> i64
      %5371 = arith.cmpi ne, %5370, %5359 : i64
      %5372 = arith.cmpi eq, %5369, %5359 : i64
      %5373 = arith.andi %5371, %5372 : i1
      %5374 = scf.if %5373 -> (i64) {
        scf.yield %5316 : i64
      } else {
        scf.yield %5369 : i64
      }
      %5375 = func.call @cc_errorp(%5328) : (i64) -> i64
      %5376 = arith.cmpi ne, %5375, %5359 : i64
      %5377 = arith.cmpi eq, %5374, %5359 : i64
      %5378 = arith.andi %5376, %5377 : i1
      %5379 = scf.if %5378 -> (i64) {
        scf.yield %5328 : i64
      } else {
        scf.yield %5374 : i64
      }
      %5380 = func.call @cc_errorp(%5335) : (i64) -> i64
      %5381 = arith.cmpi ne, %5380, %5359 : i64
      %5382 = arith.cmpi eq, %5379, %5359 : i64
      %5383 = arith.andi %5381, %5382 : i1
      %5384 = scf.if %5383 -> (i64) {
        scf.yield %5335 : i64
      } else {
        scf.yield %5379 : i64
      }
      %5385 = func.call @cc_errorp(%5339) : (i64) -> i64
      %5386 = arith.cmpi ne, %5385, %5359 : i64
      %5387 = arith.cmpi eq, %5384, %5359 : i64
      %5388 = arith.andi %5386, %5387 : i1
      %5389 = scf.if %5388 -> (i64) {
        scf.yield %5339 : i64
      } else {
        scf.yield %5384 : i64
      }
      %5390 = func.call @cc_errorp(%5346) : (i64) -> i64
      %5391 = arith.cmpi ne, %5390, %5359 : i64
      %5392 = arith.cmpi eq, %5389, %5359 : i64
      %5393 = arith.andi %5391, %5392 : i1
      %5394 = scf.if %5393 -> (i64) {
        scf.yield %5346 : i64
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
        func.call @stack_push_pointer(%5053) : (i64) -> ()
        func.call @stack_push_pointer(%5250) : (i64) -> ()
        func.call @stack_push_pointer(%5316) : (i64) -> ()
        func.call @stack_push_pointer(%5328) : (i64) -> ()
        func.call @stack_push_pointer(%5335) : (i64) -> ()
        func.call @stack_push_pointer(%5339) : (i64) -> ()
        func.call @stack_push_pointer(%5346) : (i64) -> ()
        func.call @stack_push_pointer(%5358) : (i64) -> ()
        %5401 = llvm.mlir.addressof @str529 : !llvm.ptr
        %5402 = func.call @cc_make_function_ref_const(%5401) : (!llvm.ptr) -> i64
        %5403 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5402, %5403) : (i64, i64) -> ()
      }
      %5404 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5404 : i64
    }
    %5405 = func.call @cc_nil_value() : () -> i64
    %5406 = func.call @cc_errorp(%5044) : (i64) -> i64
    %5407 = arith.cmpi ne, %5406, %5405 : i64
    %5408 = scf.if %5407 -> (i64) {
      scf.yield %5044 : i64
    } else {
      %5409 = llvm.mlir.addressof @str530 : !llvm.ptr
      %5410 = arith.constant 18 : i64
      %5411 = func.call @cc_make_string(%5409, %5410) : (!llvm.ptr, i64) -> i64
      %5412 = func.call @cc_nil_value() : () -> i64
      %5413 = func.call @cc_intern(%5411, %5412) : (i64, i64) -> i64
      %5414 = func.call @cc_nil_value() : () -> i64
      %5415 = func.call @cc_cons(%5413, %5414) : (i64, i64) -> i64
      %5416 = func.call @cc_values_pack(%5415) : (i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %5417 = arith.addi %5413, %__rlasp_stack_elide_zero_258 : i64
      %5418 = llvm.mlir.addressof @str531 : !llvm.ptr
      %5419 = arith.constant 3 : i64
      %5420 = func.call @cc_make_string(%5418, %5419) : (!llvm.ptr, i64) -> i64
      %5421 = func.call @cc_nil_value() : () -> i64
      %5422 = func.call @cc_intern(%5420, %5421) : (i64, i64) -> i64
      %5423 = func.call @cc_nil_value() : () -> i64
      %5424 = func.call @cc_cons(%5422, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_values_pack(%5424) : (i64) -> i64
      func.call @stack_push_pointer(%5422) : (i64) -> ()
      %5426 = llvm.mlir.addressof @str532 : !llvm.ptr
      %5427 = arith.constant 3 : i64
      %5428 = func.call @cc_make_string(%5426, %5427) : (!llvm.ptr, i64) -> i64
      %5429 = func.call @cc_nil_value() : () -> i64
      %5430 = func.call @cc_intern(%5428, %5429) : (i64, i64) -> i64
      %5431 = func.call @cc_nil_value() : () -> i64
      %5432 = func.call @cc_cons(%5430, %5431) : (i64, i64) -> i64
      %5433 = func.call @cc_values_pack(%5432) : (i64) -> i64
      func.call @stack_push_pointer(%5430) : (i64) -> ()
      %5434 = llvm.mlir.addressof @str533 : !llvm.ptr
      %5435 = arith.constant 19 : i64
      %5436 = func.call @cc_make_string(%5434, %5435) : (!llvm.ptr, i64) -> i64
      %5437 = llvm.mlir.addressof @str534 : !llvm.ptr
      %5438 = arith.constant 11 : i64
      %5439 = func.call @cc_make_string(%5437, %5438) : (!llvm.ptr, i64) -> i64
      %5440 = func.call @cc_intern(%5436, %5439) : (i64, i64) -> i64
      %5441 = func.call @cc_nil_value() : () -> i64
      %5442 = func.call @cc_cons(%5440, %5441) : (i64, i64) -> i64
      %5443 = func.call @cc_values_pack(%5442) : (i64) -> i64
      func.call @stack_push_pointer(%5440) : (i64) -> ()
      %5444 = llvm.mlir.addressof @str535 : !llvm.ptr
      %5445 = arith.constant 2 : i64
      %5446 = func.call @cc_make_string(%5444, %5445) : (!llvm.ptr, i64) -> i64
      %5447 = llvm.mlir.addressof @str536 : !llvm.ptr
      %5448 = arith.constant 11 : i64
      %5449 = func.call @cc_make_string(%5447, %5448) : (!llvm.ptr, i64) -> i64
      %5450 = func.call @cc_intern(%5446, %5449) : (i64, i64) -> i64
      %5451 = func.call @cc_nil_value() : () -> i64
      %5452 = func.call @cc_cons(%5450, %5451) : (i64, i64) -> i64
      %5453 = func.call @cc_values_pack(%5452) : (i64) -> i64
      func.call @stack_push_pointer(%5450) : (i64) -> ()
      %5454 = llvm.mlir.addressof @str537 : !llvm.ptr
      %5455 = arith.constant 2 : i64
      %5456 = func.call @cc_make_string(%5454, %5455) : (!llvm.ptr, i64) -> i64
      %5457 = llvm.mlir.addressof @str538 : !llvm.ptr
      %5458 = arith.constant 11 : i64
      %5459 = func.call @cc_make_string(%5457, %5458) : (!llvm.ptr, i64) -> i64
      %5460 = func.call @cc_intern(%5456, %5459) : (i64, i64) -> i64
      %5461 = func.call @cc_nil_value() : () -> i64
      %5462 = func.call @cc_cons(%5460, %5461) : (i64, i64) -> i64
      %5463 = func.call @cc_values_pack(%5462) : (i64) -> i64
      func.call @stack_push_pointer(%5460) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5464 = func.call @stack_pop_pointer() : () -> i64
      %5465 = func.call @stack_pop_pointer() : () -> i64
      %5466 = func.call @cc_cons(%5465, %5464) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %5467 = arith.addi %5466, %__rlasp_stack_elide_zero_259 : i64
      %5468 = func.call @stack_pop_pointer() : () -> i64
      %5469 = func.call @cc_cons(%5468, %5467) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5469) : (i64) -> ()
      %5470 = llvm.mlir.addressof @str539 : !llvm.ptr
      %5471 = arith.constant 8 : i64
      %5472 = func.call @cc_make_string(%5470, %5471) : (!llvm.ptr, i64) -> i64
      %5473 = llvm.mlir.addressof @str540 : !llvm.ptr
      %5474 = arith.constant 11 : i64
      %5475 = func.call @cc_make_string(%5473, %5474) : (!llvm.ptr, i64) -> i64
      %5476 = func.call @cc_intern(%5472, %5475) : (i64, i64) -> i64
      %5477 = func.call @cc_nil_value() : () -> i64
      %5478 = func.call @cc_cons(%5476, %5477) : (i64, i64) -> i64
      %5479 = func.call @cc_values_pack(%5478) : (i64) -> i64
      func.call @stack_push_pointer(%5476) : (i64) -> ()
      %5480 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5480) : (i64) -> ()
      %5481 = llvm.mlir.addressof @str541 : !llvm.ptr
      %5482 = arith.constant 13 : i64
      %5483 = func.call @cc_make_string(%5481, %5482) : (!llvm.ptr, i64) -> i64
      %5484 = llvm.mlir.addressof @str542 : !llvm.ptr
      %5485 = arith.constant 11 : i64
      %5486 = func.call @cc_make_string(%5484, %5485) : (!llvm.ptr, i64) -> i64
      %5487 = func.call @cc_intern(%5483, %5486) : (i64, i64) -> i64
      %5488 = func.call @cc_nil_value() : () -> i64
      %5489 = func.call @cc_cons(%5487, %5488) : (i64, i64) -> i64
      %5490 = func.call @cc_values_pack(%5489) : (i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %5491 = arith.addi %5487, %__rlasp_stack_elide_zero_260 : i64
      %5492 = func.call @stack_pop_pointer() : () -> i64
      %5493 = func.call @cc_cons(%5491, %5492) : (i64, i64) -> i64
      %5494 = llvm.mlir.addressof @str543 : !llvm.ptr
      %5495 = arith.constant 5 : i64
      %5496 = func.call @cc_make_string(%5494, %5495) : (!llvm.ptr, i64) -> i64
      %5497 = func.call @cc_nil_value() : () -> i64
      %5498 = func.call @cc_intern(%5496, %5497) : (i64, i64) -> i64
      %5499 = func.call @cc_nil_value() : () -> i64
      %5500 = func.call @cc_cons(%5498, %5499) : (i64, i64) -> i64
      %5501 = func.call @cc_values_pack(%5500) : (i64) -> i64
      %5502 = func.call @cc_cons(%5498, %5493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5502) : (i64) -> ()
      %5503 = llvm.mlir.addressof @str544 : !llvm.ptr
      %5504 = arith.constant 10 : i64
      %5505 = func.call @cc_make_string(%5503, %5504) : (!llvm.ptr, i64) -> i64
      %5506 = llvm.mlir.addressof @str545 : !llvm.ptr
      %5507 = arith.constant 11 : i64
      %5508 = func.call @cc_make_string(%5506, %5507) : (!llvm.ptr, i64) -> i64
      %5509 = func.call @cc_intern(%5505, %5508) : (i64, i64) -> i64
      %5510 = func.call @cc_nil_value() : () -> i64
      %5511 = func.call @cc_cons(%5509, %5510) : (i64, i64) -> i64
      %5512 = func.call @cc_values_pack(%5511) : (i64) -> i64
      func.call @stack_push_pointer(%5509) : (i64) -> ()
      %5513 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5513) : (i64) -> ()
      %5514 = llvm.mlir.addressof @str546 : !llvm.ptr
      %5515 = arith.constant 13 : i64
      %5516 = func.call @cc_make_string(%5514, %5515) : (!llvm.ptr, i64) -> i64
      %5517 = llvm.mlir.addressof @str547 : !llvm.ptr
      %5518 = arith.constant 11 : i64
      %5519 = func.call @cc_make_string(%5517, %5518) : (!llvm.ptr, i64) -> i64
      %5520 = func.call @cc_intern(%5516, %5519) : (i64, i64) -> i64
      %5521 = func.call @cc_nil_value() : () -> i64
      %5522 = func.call @cc_cons(%5520, %5521) : (i64, i64) -> i64
      %5523 = func.call @cc_values_pack(%5522) : (i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %5524 = arith.addi %5520, %__rlasp_stack_elide_zero_261 : i64
      %5525 = func.call @stack_pop_pointer() : () -> i64
      %5526 = func.call @cc_cons(%5524, %5525) : (i64, i64) -> i64
      %5527 = llvm.mlir.addressof @str548 : !llvm.ptr
      %5528 = arith.constant 5 : i64
      %5529 = func.call @cc_make_string(%5527, %5528) : (!llvm.ptr, i64) -> i64
      %5530 = func.call @cc_nil_value() : () -> i64
      %5531 = func.call @cc_intern(%5529, %5530) : (i64, i64) -> i64
      %5532 = func.call @cc_nil_value() : () -> i64
      %5533 = func.call @cc_cons(%5531, %5532) : (i64, i64) -> i64
      %5534 = func.call @cc_values_pack(%5533) : (i64) -> i64
      %5535 = func.call @cc_cons(%5531, %5526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5535) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5536 = func.call @stack_pop_pointer() : () -> i64
      %5537 = func.call @stack_pop_pointer() : () -> i64
      %5538 = func.call @cc_cons(%5537, %5536) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %5539 = arith.addi %5538, %__rlasp_stack_elide_zero_262 : i64
      %5540 = func.call @stack_pop_pointer() : () -> i64
      %5541 = func.call @cc_cons(%5540, %5539) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5541) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5542 = func.call @stack_pop_pointer() : () -> i64
      %5543 = func.call @stack_pop_pointer() : () -> i64
      %5544 = func.call @cc_cons(%5543, %5542) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %5545 = arith.addi %5544, %__rlasp_stack_elide_zero_263 : i64
      %5546 = func.call @stack_pop_pointer() : () -> i64
      %5547 = func.call @cc_cons(%5546, %5545) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %5548 = arith.addi %5547, %__rlasp_stack_elide_zero_264 : i64
      %5549 = func.call @stack_pop_pointer() : () -> i64
      %5550 = func.call @cc_cons(%5549, %5548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5550) : (i64) -> ()
      %5551 = llvm.mlir.addressof @str549 : !llvm.ptr
      %5552 = arith.constant 3 : i64
      %5553 = func.call @cc_make_string(%5551, %5552) : (!llvm.ptr, i64) -> i64
      %5554 = llvm.mlir.addressof @str550 : !llvm.ptr
      %5555 = arith.constant 11 : i64
      %5556 = func.call @cc_make_string(%5554, %5555) : (!llvm.ptr, i64) -> i64
      %5557 = func.call @cc_intern(%5553, %5556) : (i64, i64) -> i64
      %5558 = func.call @cc_nil_value() : () -> i64
      %5559 = func.call @cc_cons(%5557, %5558) : (i64, i64) -> i64
      %5560 = func.call @cc_values_pack(%5559) : (i64) -> i64
      func.call @stack_push_pointer(%5557) : (i64) -> ()
      %5561 = llvm.mlir.addressof @str551 : !llvm.ptr
      %5562 = arith.constant 2 : i64
      %5563 = func.call @cc_make_string(%5561, %5562) : (!llvm.ptr, i64) -> i64
      %5564 = llvm.mlir.addressof @str552 : !llvm.ptr
      %5565 = arith.constant 11 : i64
      %5566 = func.call @cc_make_string(%5564, %5565) : (!llvm.ptr, i64) -> i64
      %5567 = func.call @cc_intern(%5563, %5566) : (i64, i64) -> i64
      %5568 = func.call @cc_nil_value() : () -> i64
      %5569 = func.call @cc_cons(%5567, %5568) : (i64, i64) -> i64
      %5570 = func.call @cc_values_pack(%5569) : (i64) -> i64
      func.call @stack_push_pointer(%5567) : (i64) -> ()
      %5571 = llvm.mlir.addressof @str553 : !llvm.ptr
      %5572 = arith.constant 2 : i64
      %5573 = func.call @cc_make_string(%5571, %5572) : (!llvm.ptr, i64) -> i64
      %5574 = llvm.mlir.addressof @str554 : !llvm.ptr
      %5575 = arith.constant 11 : i64
      %5576 = func.call @cc_make_string(%5574, %5575) : (!llvm.ptr, i64) -> i64
      %5577 = func.call @cc_intern(%5573, %5576) : (i64, i64) -> i64
      %5578 = func.call @cc_nil_value() : () -> i64
      %5579 = func.call @cc_cons(%5577, %5578) : (i64, i64) -> i64
      %5580 = func.call @cc_values_pack(%5579) : (i64) -> i64
      func.call @stack_push_pointer(%5577) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5581 = func.call @stack_pop_pointer() : () -> i64
      %5582 = func.call @stack_pop_pointer() : () -> i64
      %5583 = func.call @cc_cons(%5582, %5581) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %5584 = arith.addi %5583, %__rlasp_stack_elide_zero_265 : i64
      %5585 = func.call @stack_pop_pointer() : () -> i64
      %5586 = func.call @cc_cons(%5585, %5584) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %5587 = arith.addi %5586, %__rlasp_stack_elide_zero_266 : i64
      %5588 = func.call @stack_pop_pointer() : () -> i64
      %5589 = func.call @cc_cons(%5588, %5587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5589) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5590 = func.call @stack_pop_pointer() : () -> i64
      %5591 = func.call @stack_pop_pointer() : () -> i64
      %5592 = func.call @cc_cons(%5591, %5590) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %5593 = arith.addi %5592, %__rlasp_stack_elide_zero_267 : i64
      %5594 = func.call @stack_pop_pointer() : () -> i64
      %5595 = func.call @cc_cons(%5594, %5593) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %5596 = arith.addi %5595, %__rlasp_stack_elide_zero_268 : i64
      %5597 = func.call @stack_pop_pointer() : () -> i64
      %5598 = func.call @cc_cons(%5597, %5596) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %5599 = arith.addi %5598, %__rlasp_stack_elide_zero_269 : i64
      %5600 = func.call @stack_pop_pointer() : () -> i64
      %5601 = func.call @cc_cons(%5600, %5599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5601) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5602 = func.call @stack_pop_pointer() : () -> i64
      %5603 = func.call @stack_pop_pointer() : () -> i64
      %5604 = func.call @cc_cons(%5603, %5602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %5605 = arith.addi %5604, %__rlasp_stack_elide_zero_270 : i64
      %5606 = func.call @stack_pop_pointer() : () -> i64
      %5607 = func.call @cc_cons(%5606, %5605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5607) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5608 = func.call @stack_pop_pointer() : () -> i64
      %5609 = func.call @stack_pop_pointer() : () -> i64
      %5610 = func.call @cc_cons(%5609, %5608) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %5611 = arith.addi %5610, %__rlasp_stack_elide_zero_271 : i64
      %5612 = func.call @stack_pop_pointer() : () -> i64
      %5613 = func.call @cc_cons(%5612, %5611) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %5614 = arith.addi %5613, %__rlasp_stack_elide_zero_272 : i64
      %5677 = arith.constant 206494159077399 : i64
      %5678 = arith.constant 0 : i64
      %5679 = func.call @cc_make_closure(%5677, %5678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %5680 = arith.addi %5679, %__rlasp_stack_elide_zero_273 : i64
      %5681 = llvm.mlir.addressof @str560 : !llvm.ptr
      %5682 = arith.constant 1 : i64
      %5683 = func.call @cc_make_string(%5681, %5682) : (!llvm.ptr, i64) -> i64
      %5684 = func.call @cc_nil_value() : () -> i64
      %5685 = func.call @cc_intern(%5683, %5684) : (i64, i64) -> i64
      %5686 = func.call @cc_nil_value() : () -> i64
      %5687 = func.call @cc_cons(%5685, %5686) : (i64, i64) -> i64
      %5688 = func.call @cc_values_pack(%5687) : (i64) -> i64
      func.call @stack_push_pointer(%5685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5689 = func.call @stack_pop_pointer() : () -> i64
      %5690 = func.call @stack_pop_pointer() : () -> i64
      %5691 = func.call @cc_cons(%5690, %5689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %5692 = arith.addi %5691, %__rlasp_stack_elide_zero_274 : i64
      %5693 = llvm.mlir.addressof @str561 : !llvm.ptr
      %5694 = arith.constant 11 : i64
      %5695 = func.call @cc_make_string(%5693, %5694) : (!llvm.ptr, i64) -> i64
      %5696 = llvm.mlir.addressof @str562 : !llvm.ptr
      %5697 = arith.constant 7 : i64
      %5698 = func.call @cc_make_string(%5696, %5697) : (!llvm.ptr, i64) -> i64
      %5699 = func.call @cc_intern(%5695, %5698) : (i64, i64) -> i64
      %5700 = func.call @cc_nil_value() : () -> i64
      %5701 = func.call @cc_cons(%5699, %5700) : (i64, i64) -> i64
      %5702 = func.call @cc_values_pack(%5701) : (i64) -> i64
      %5703 = func.call @cc_nil_value() : () -> i64
      %5704 = llvm.mlir.addressof @str563 : !llvm.ptr
      %5705 = arith.constant 4 : i64
      %5706 = func.call @cc_make_string(%5704, %5705) : (!llvm.ptr, i64) -> i64
      %5707 = llvm.mlir.addressof @str564 : !llvm.ptr
      %5708 = arith.constant 7 : i64
      %5709 = func.call @cc_make_string(%5707, %5708) : (!llvm.ptr, i64) -> i64
      %5710 = func.call @cc_intern(%5706, %5709) : (i64, i64) -> i64
      %5711 = func.call @cc_nil_value() : () -> i64
      %5712 = func.call @cc_cons(%5710, %5711) : (i64, i64) -> i64
      %5713 = func.call @cc_values_pack(%5712) : (i64) -> i64
      %5714 = llvm.mlir.addressof @str565 : !llvm.ptr
      %5715 = arith.constant 6 : i64
      %5716 = func.call @cc_make_string(%5714, %5715) : (!llvm.ptr, i64) -> i64
      %5717 = func.call @cc_nil_value() : () -> i64
      %5718 = func.call @cc_intern(%5716, %5717) : (i64, i64) -> i64
      %5719 = func.call @cc_nil_value() : () -> i64
      %5720 = func.call @cc_cons(%5718, %5719) : (i64, i64) -> i64
      %5721 = func.call @cc_values_pack(%5720) : (i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %5722 = arith.addi %5718, %__rlasp_stack_elide_zero_275 : i64
      %5723 = func.call @cc_nil_value() : () -> i64
      %5724 = func.call @cc_errorp(%5417) : (i64) -> i64
      %5725 = arith.cmpi ne, %5724, %5723 : i64
      %5726 = arith.cmpi eq, %5723, %5723 : i64
      %5727 = arith.andi %5725, %5726 : i1
      %5728 = scf.if %5727 -> (i64) {
        scf.yield %5417 : i64
      } else {
        scf.yield %5723 : i64
      }
      %5729 = func.call @cc_errorp(%5614) : (i64) -> i64
      %5730 = arith.cmpi ne, %5729, %5723 : i64
      %5731 = arith.cmpi eq, %5728, %5723 : i64
      %5732 = arith.andi %5730, %5731 : i1
      %5733 = scf.if %5732 -> (i64) {
        scf.yield %5614 : i64
      } else {
        scf.yield %5728 : i64
      }
      %5734 = func.call @cc_errorp(%5680) : (i64) -> i64
      %5735 = arith.cmpi ne, %5734, %5723 : i64
      %5736 = arith.cmpi eq, %5733, %5723 : i64
      %5737 = arith.andi %5735, %5736 : i1
      %5738 = scf.if %5737 -> (i64) {
        scf.yield %5680 : i64
      } else {
        scf.yield %5733 : i64
      }
      %5739 = func.call @cc_errorp(%5692) : (i64) -> i64
      %5740 = arith.cmpi ne, %5739, %5723 : i64
      %5741 = arith.cmpi eq, %5738, %5723 : i64
      %5742 = arith.andi %5740, %5741 : i1
      %5743 = scf.if %5742 -> (i64) {
        scf.yield %5692 : i64
      } else {
        scf.yield %5738 : i64
      }
      %5744 = func.call @cc_errorp(%5699) : (i64) -> i64
      %5745 = arith.cmpi ne, %5744, %5723 : i64
      %5746 = arith.cmpi eq, %5743, %5723 : i64
      %5747 = arith.andi %5745, %5746 : i1
      %5748 = scf.if %5747 -> (i64) {
        scf.yield %5699 : i64
      } else {
        scf.yield %5743 : i64
      }
      %5749 = func.call @cc_errorp(%5703) : (i64) -> i64
      %5750 = arith.cmpi ne, %5749, %5723 : i64
      %5751 = arith.cmpi eq, %5748, %5723 : i64
      %5752 = arith.andi %5750, %5751 : i1
      %5753 = scf.if %5752 -> (i64) {
        scf.yield %5703 : i64
      } else {
        scf.yield %5748 : i64
      }
      %5754 = func.call @cc_errorp(%5710) : (i64) -> i64
      %5755 = arith.cmpi ne, %5754, %5723 : i64
      %5756 = arith.cmpi eq, %5753, %5723 : i64
      %5757 = arith.andi %5755, %5756 : i1
      %5758 = scf.if %5757 -> (i64) {
        scf.yield %5710 : i64
      } else {
        scf.yield %5753 : i64
      }
      %5759 = func.call @cc_errorp(%5722) : (i64) -> i64
      %5760 = arith.cmpi ne, %5759, %5723 : i64
      %5761 = arith.cmpi eq, %5758, %5723 : i64
      %5762 = arith.andi %5760, %5761 : i1
      %5763 = scf.if %5762 -> (i64) {
        scf.yield %5722 : i64
      } else {
        scf.yield %5758 : i64
      }
      %5764 = arith.cmpi ne, %5763, %5723 : i64
      scf.if %5764 {
        func.call @stack_push_pointer(%5763) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5417) : (i64) -> ()
        func.call @stack_push_pointer(%5614) : (i64) -> ()
        func.call @stack_push_pointer(%5680) : (i64) -> ()
        func.call @stack_push_pointer(%5692) : (i64) -> ()
        func.call @stack_push_pointer(%5699) : (i64) -> ()
        func.call @stack_push_pointer(%5703) : (i64) -> ()
        func.call @stack_push_pointer(%5710) : (i64) -> ()
        func.call @stack_push_pointer(%5722) : (i64) -> ()
        %5765 = llvm.mlir.addressof @str566 : !llvm.ptr
        %5766 = func.call @cc_make_function_ref_const(%5765) : (!llvm.ptr) -> i64
        %5767 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5766, %5767) : (i64, i64) -> ()
      }
      %5768 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5768 : i64
    }
    %5769 = func.call @cc_nil_value() : () -> i64
    %5770 = func.call @cc_errorp(%5408) : (i64) -> i64
    %5771 = arith.cmpi ne, %5770, %5769 : i64
    %5772 = scf.if %5771 -> (i64) {
      scf.yield %5408 : i64
    } else {
      %5773 = llvm.mlir.addressof @str567 : !llvm.ptr
      %5774 = arith.constant 18 : i64
      %5775 = func.call @cc_make_string(%5773, %5774) : (!llvm.ptr, i64) -> i64
      %5776 = func.call @cc_nil_value() : () -> i64
      %5777 = func.call @cc_intern(%5775, %5776) : (i64, i64) -> i64
      %5778 = func.call @cc_nil_value() : () -> i64
      %5779 = func.call @cc_cons(%5777, %5778) : (i64, i64) -> i64
      %5780 = func.call @cc_values_pack(%5779) : (i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %5781 = arith.addi %5777, %__rlasp_stack_elide_zero_276 : i64
      %5782 = llvm.mlir.addressof @str568 : !llvm.ptr
      %5783 = arith.constant 3 : i64
      %5784 = func.call @cc_make_string(%5782, %5783) : (!llvm.ptr, i64) -> i64
      %5785 = func.call @cc_nil_value() : () -> i64
      %5786 = func.call @cc_intern(%5784, %5785) : (i64, i64) -> i64
      %5787 = func.call @cc_nil_value() : () -> i64
      %5788 = func.call @cc_cons(%5786, %5787) : (i64, i64) -> i64
      %5789 = func.call @cc_values_pack(%5788) : (i64) -> i64
      func.call @stack_push_pointer(%5786) : (i64) -> ()
      %5790 = llvm.mlir.addressof @str569 : !llvm.ptr
      %5791 = arith.constant 3 : i64
      %5792 = func.call @cc_make_string(%5790, %5791) : (!llvm.ptr, i64) -> i64
      %5793 = func.call @cc_nil_value() : () -> i64
      %5794 = func.call @cc_intern(%5792, %5793) : (i64, i64) -> i64
      %5795 = func.call @cc_nil_value() : () -> i64
      %5796 = func.call @cc_cons(%5794, %5795) : (i64, i64) -> i64
      %5797 = func.call @cc_values_pack(%5796) : (i64) -> i64
      func.call @stack_push_pointer(%5794) : (i64) -> ()
      %5798 = llvm.mlir.addressof @str570 : !llvm.ptr
      %5799 = arith.constant 19 : i64
      %5800 = func.call @cc_make_string(%5798, %5799) : (!llvm.ptr, i64) -> i64
      %5801 = llvm.mlir.addressof @str571 : !llvm.ptr
      %5802 = arith.constant 11 : i64
      %5803 = func.call @cc_make_string(%5801, %5802) : (!llvm.ptr, i64) -> i64
      %5804 = func.call @cc_intern(%5800, %5803) : (i64, i64) -> i64
      %5805 = func.call @cc_nil_value() : () -> i64
      %5806 = func.call @cc_cons(%5804, %5805) : (i64, i64) -> i64
      %5807 = func.call @cc_values_pack(%5806) : (i64) -> i64
      func.call @stack_push_pointer(%5804) : (i64) -> ()
      %5808 = llvm.mlir.addressof @str572 : !llvm.ptr
      %5809 = arith.constant 2 : i64
      %5810 = func.call @cc_make_string(%5808, %5809) : (!llvm.ptr, i64) -> i64
      %5811 = llvm.mlir.addressof @str573 : !llvm.ptr
      %5812 = arith.constant 11 : i64
      %5813 = func.call @cc_make_string(%5811, %5812) : (!llvm.ptr, i64) -> i64
      %5814 = func.call @cc_intern(%5810, %5813) : (i64, i64) -> i64
      %5815 = func.call @cc_nil_value() : () -> i64
      %5816 = func.call @cc_cons(%5814, %5815) : (i64, i64) -> i64
      %5817 = func.call @cc_values_pack(%5816) : (i64) -> i64
      func.call @stack_push_pointer(%5814) : (i64) -> ()
      %5818 = llvm.mlir.addressof @str574 : !llvm.ptr
      %5819 = arith.constant 2 : i64
      %5820 = func.call @cc_make_string(%5818, %5819) : (!llvm.ptr, i64) -> i64
      %5821 = llvm.mlir.addressof @str575 : !llvm.ptr
      %5822 = arith.constant 11 : i64
      %5823 = func.call @cc_make_string(%5821, %5822) : (!llvm.ptr, i64) -> i64
      %5824 = func.call @cc_intern(%5820, %5823) : (i64, i64) -> i64
      %5825 = func.call @cc_nil_value() : () -> i64
      %5826 = func.call @cc_cons(%5824, %5825) : (i64, i64) -> i64
      %5827 = func.call @cc_values_pack(%5826) : (i64) -> i64
      func.call @stack_push_pointer(%5824) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5828 = func.call @stack_pop_pointer() : () -> i64
      %5829 = func.call @stack_pop_pointer() : () -> i64
      %5830 = func.call @cc_cons(%5829, %5828) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %5831 = arith.addi %5830, %__rlasp_stack_elide_zero_277 : i64
      %5832 = func.call @stack_pop_pointer() : () -> i64
      %5833 = func.call @cc_cons(%5832, %5831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5833) : (i64) -> ()
      %5834 = llvm.mlir.addressof @str576 : !llvm.ptr
      %5835 = arith.constant 8 : i64
      %5836 = func.call @cc_make_string(%5834, %5835) : (!llvm.ptr, i64) -> i64
      %5837 = llvm.mlir.addressof @str577 : !llvm.ptr
      %5838 = arith.constant 11 : i64
      %5839 = func.call @cc_make_string(%5837, %5838) : (!llvm.ptr, i64) -> i64
      %5840 = func.call @cc_intern(%5836, %5839) : (i64, i64) -> i64
      %5841 = func.call @cc_nil_value() : () -> i64
      %5842 = func.call @cc_cons(%5840, %5841) : (i64, i64) -> i64
      %5843 = func.call @cc_values_pack(%5842) : (i64) -> i64
      func.call @stack_push_pointer(%5840) : (i64) -> ()
      %5844 = llvm.mlir.addressof @str578 : !llvm.ptr
      %5845 = arith.constant 10 : i64
      %5846 = func.call @cc_make_string(%5844, %5845) : (!llvm.ptr, i64) -> i64
      %5847 = llvm.mlir.addressof @str579 : !llvm.ptr
      %5848 = arith.constant 11 : i64
      %5849 = func.call @cc_make_string(%5847, %5848) : (!llvm.ptr, i64) -> i64
      %5850 = func.call @cc_intern(%5846, %5849) : (i64, i64) -> i64
      %5851 = func.call @cc_nil_value() : () -> i64
      %5852 = func.call @cc_cons(%5850, %5851) : (i64, i64) -> i64
      %5853 = func.call @cc_values_pack(%5852) : (i64) -> i64
      func.call @stack_push_pointer(%5850) : (i64) -> ()
      %5854 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5854) : (i64) -> ()
      %5855 = llvm.mlir.addressof @str580 : !llvm.ptr
      %5856 = arith.constant 13 : i64
      %5857 = func.call @cc_make_string(%5855, %5856) : (!llvm.ptr, i64) -> i64
      %5858 = llvm.mlir.addressof @str581 : !llvm.ptr
      %5859 = arith.constant 11 : i64
      %5860 = func.call @cc_make_string(%5858, %5859) : (!llvm.ptr, i64) -> i64
      %5861 = func.call @cc_intern(%5857, %5860) : (i64, i64) -> i64
      %5862 = func.call @cc_nil_value() : () -> i64
      %5863 = func.call @cc_cons(%5861, %5862) : (i64, i64) -> i64
      %5864 = func.call @cc_values_pack(%5863) : (i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %5865 = arith.addi %5861, %__rlasp_stack_elide_zero_278 : i64
      %5866 = func.call @stack_pop_pointer() : () -> i64
      %5867 = func.call @cc_cons(%5865, %5866) : (i64, i64) -> i64
      %5868 = llvm.mlir.addressof @str582 : !llvm.ptr
      %5869 = arith.constant 5 : i64
      %5870 = func.call @cc_make_string(%5868, %5869) : (!llvm.ptr, i64) -> i64
      %5871 = func.call @cc_nil_value() : () -> i64
      %5872 = func.call @cc_intern(%5870, %5871) : (i64, i64) -> i64
      %5873 = func.call @cc_nil_value() : () -> i64
      %5874 = func.call @cc_cons(%5872, %5873) : (i64, i64) -> i64
      %5875 = func.call @cc_values_pack(%5874) : (i64) -> i64
      %5876 = func.call @cc_cons(%5872, %5867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5876) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5877 = func.call @stack_pop_pointer() : () -> i64
      %5878 = func.call @stack_pop_pointer() : () -> i64
      %5879 = func.call @cc_cons(%5878, %5877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %5880 = arith.addi %5879, %__rlasp_stack_elide_zero_279 : i64
      %5881 = func.call @stack_pop_pointer() : () -> i64
      %5882 = func.call @cc_cons(%5881, %5880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5882) : (i64) -> ()
      %5883 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5883) : (i64) -> ()
      %5884 = llvm.mlir.addressof @str583 : !llvm.ptr
      %5885 = arith.constant 13 : i64
      %5886 = func.call @cc_make_string(%5884, %5885) : (!llvm.ptr, i64) -> i64
      %5887 = llvm.mlir.addressof @str584 : !llvm.ptr
      %5888 = arith.constant 11 : i64
      %5889 = func.call @cc_make_string(%5887, %5888) : (!llvm.ptr, i64) -> i64
      %5890 = func.call @cc_intern(%5886, %5889) : (i64, i64) -> i64
      %5891 = func.call @cc_nil_value() : () -> i64
      %5892 = func.call @cc_cons(%5890, %5891) : (i64, i64) -> i64
      %5893 = func.call @cc_values_pack(%5892) : (i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %5894 = arith.addi %5890, %__rlasp_stack_elide_zero_280 : i64
      %5895 = func.call @stack_pop_pointer() : () -> i64
      %5896 = func.call @cc_cons(%5894, %5895) : (i64, i64) -> i64
      %5897 = llvm.mlir.addressof @str585 : !llvm.ptr
      %5898 = arith.constant 5 : i64
      %5899 = func.call @cc_make_string(%5897, %5898) : (!llvm.ptr, i64) -> i64
      %5900 = func.call @cc_nil_value() : () -> i64
      %5901 = func.call @cc_intern(%5899, %5900) : (i64, i64) -> i64
      %5902 = func.call @cc_nil_value() : () -> i64
      %5903 = func.call @cc_cons(%5901, %5902) : (i64, i64) -> i64
      %5904 = func.call @cc_values_pack(%5903) : (i64) -> i64
      %5905 = func.call @cc_cons(%5901, %5896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5906 = func.call @stack_pop_pointer() : () -> i64
      %5907 = func.call @stack_pop_pointer() : () -> i64
      %5908 = func.call @cc_cons(%5907, %5906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %5909 = arith.addi %5908, %__rlasp_stack_elide_zero_281 : i64
      %5910 = func.call @stack_pop_pointer() : () -> i64
      %5911 = func.call @cc_cons(%5910, %5909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %5912 = arith.addi %5911, %__rlasp_stack_elide_zero_282 : i64
      %5913 = func.call @stack_pop_pointer() : () -> i64
      %5914 = func.call @cc_cons(%5913, %5912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5914) : (i64) -> ()
      %5915 = llvm.mlir.addressof @str586 : !llvm.ptr
      %5916 = arith.constant 3 : i64
      %5917 = func.call @cc_make_string(%5915, %5916) : (!llvm.ptr, i64) -> i64
      %5918 = llvm.mlir.addressof @str587 : !llvm.ptr
      %5919 = arith.constant 11 : i64
      %5920 = func.call @cc_make_string(%5918, %5919) : (!llvm.ptr, i64) -> i64
      %5921 = func.call @cc_intern(%5917, %5920) : (i64, i64) -> i64
      %5922 = func.call @cc_nil_value() : () -> i64
      %5923 = func.call @cc_cons(%5921, %5922) : (i64, i64) -> i64
      %5924 = func.call @cc_values_pack(%5923) : (i64) -> i64
      func.call @stack_push_pointer(%5921) : (i64) -> ()
      %5925 = llvm.mlir.addressof @str588 : !llvm.ptr
      %5926 = arith.constant 2 : i64
      %5927 = func.call @cc_make_string(%5925, %5926) : (!llvm.ptr, i64) -> i64
      %5928 = llvm.mlir.addressof @str589 : !llvm.ptr
      %5929 = arith.constant 11 : i64
      %5930 = func.call @cc_make_string(%5928, %5929) : (!llvm.ptr, i64) -> i64
      %5931 = func.call @cc_intern(%5927, %5930) : (i64, i64) -> i64
      %5932 = func.call @cc_nil_value() : () -> i64
      %5933 = func.call @cc_cons(%5931, %5932) : (i64, i64) -> i64
      %5934 = func.call @cc_values_pack(%5933) : (i64) -> i64
      func.call @stack_push_pointer(%5931) : (i64) -> ()
      %5935 = llvm.mlir.addressof @str590 : !llvm.ptr
      %5936 = arith.constant 2 : i64
      %5937 = func.call @cc_make_string(%5935, %5936) : (!llvm.ptr, i64) -> i64
      %5938 = llvm.mlir.addressof @str591 : !llvm.ptr
      %5939 = arith.constant 11 : i64
      %5940 = func.call @cc_make_string(%5938, %5939) : (!llvm.ptr, i64) -> i64
      %5941 = func.call @cc_intern(%5937, %5940) : (i64, i64) -> i64
      %5942 = func.call @cc_nil_value() : () -> i64
      %5943 = func.call @cc_cons(%5941, %5942) : (i64, i64) -> i64
      %5944 = func.call @cc_values_pack(%5943) : (i64) -> i64
      func.call @stack_push_pointer(%5941) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5945 = func.call @stack_pop_pointer() : () -> i64
      %5946 = func.call @stack_pop_pointer() : () -> i64
      %5947 = func.call @cc_cons(%5946, %5945) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %5948 = arith.addi %5947, %__rlasp_stack_elide_zero_283 : i64
      %5949 = func.call @stack_pop_pointer() : () -> i64
      %5950 = func.call @cc_cons(%5949, %5948) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %5951 = arith.addi %5950, %__rlasp_stack_elide_zero_284 : i64
      %5952 = func.call @stack_pop_pointer() : () -> i64
      %5953 = func.call @cc_cons(%5952, %5951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5953) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5954 = func.call @stack_pop_pointer() : () -> i64
      %5955 = func.call @stack_pop_pointer() : () -> i64
      %5956 = func.call @cc_cons(%5955, %5954) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %5957 = arith.addi %5956, %__rlasp_stack_elide_zero_285 : i64
      %5958 = func.call @stack_pop_pointer() : () -> i64
      %5959 = func.call @cc_cons(%5958, %5957) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %5960 = arith.addi %5959, %__rlasp_stack_elide_zero_286 : i64
      %5961 = func.call @stack_pop_pointer() : () -> i64
      %5962 = func.call @cc_cons(%5961, %5960) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %5963 = arith.addi %5962, %__rlasp_stack_elide_zero_287 : i64
      %5964 = func.call @stack_pop_pointer() : () -> i64
      %5965 = func.call @cc_cons(%5964, %5963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5966 = func.call @stack_pop_pointer() : () -> i64
      %5967 = func.call @stack_pop_pointer() : () -> i64
      %5968 = func.call @cc_cons(%5967, %5966) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %5969 = arith.addi %5968, %__rlasp_stack_elide_zero_288 : i64
      %5970 = func.call @stack_pop_pointer() : () -> i64
      %5971 = func.call @cc_cons(%5970, %5969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5971) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5972 = func.call @stack_pop_pointer() : () -> i64
      %5973 = func.call @stack_pop_pointer() : () -> i64
      %5974 = func.call @cc_cons(%5973, %5972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %5975 = arith.addi %5974, %__rlasp_stack_elide_zero_289 : i64
      %5976 = func.call @stack_pop_pointer() : () -> i64
      %5977 = func.call @cc_cons(%5976, %5975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %5978 = arith.addi %5977, %__rlasp_stack_elide_zero_290 : i64
      %6041 = arith.constant 206494159077400 : i64
      %6042 = arith.constant 0 : i64
      %6043 = func.call @cc_make_closure(%6041, %6042) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %6044 = arith.addi %6043, %__rlasp_stack_elide_zero_291 : i64
      %6045 = llvm.mlir.addressof @str597 : !llvm.ptr
      %6046 = arith.constant 1 : i64
      %6047 = func.call @cc_make_string(%6045, %6046) : (!llvm.ptr, i64) -> i64
      %6048 = func.call @cc_nil_value() : () -> i64
      %6049 = func.call @cc_intern(%6047, %6048) : (i64, i64) -> i64
      %6050 = func.call @cc_nil_value() : () -> i64
      %6051 = func.call @cc_cons(%6049, %6050) : (i64, i64) -> i64
      %6052 = func.call @cc_values_pack(%6051) : (i64) -> i64
      func.call @stack_push_pointer(%6049) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6053 = func.call @stack_pop_pointer() : () -> i64
      %6054 = func.call @stack_pop_pointer() : () -> i64
      %6055 = func.call @cc_cons(%6054, %6053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %6056 = arith.addi %6055, %__rlasp_stack_elide_zero_292 : i64
      %6057 = llvm.mlir.addressof @str598 : !llvm.ptr
      %6058 = arith.constant 11 : i64
      %6059 = func.call @cc_make_string(%6057, %6058) : (!llvm.ptr, i64) -> i64
      %6060 = llvm.mlir.addressof @str599 : !llvm.ptr
      %6061 = arith.constant 7 : i64
      %6062 = func.call @cc_make_string(%6060, %6061) : (!llvm.ptr, i64) -> i64
      %6063 = func.call @cc_intern(%6059, %6062) : (i64, i64) -> i64
      %6064 = func.call @cc_nil_value() : () -> i64
      %6065 = func.call @cc_cons(%6063, %6064) : (i64, i64) -> i64
      %6066 = func.call @cc_values_pack(%6065) : (i64) -> i64
      %6067 = func.call @cc_nil_value() : () -> i64
      %6068 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6069 = arith.constant 4 : i64
      %6070 = func.call @cc_make_string(%6068, %6069) : (!llvm.ptr, i64) -> i64
      %6071 = llvm.mlir.addressof @str601 : !llvm.ptr
      %6072 = arith.constant 7 : i64
      %6073 = func.call @cc_make_string(%6071, %6072) : (!llvm.ptr, i64) -> i64
      %6074 = func.call @cc_intern(%6070, %6073) : (i64, i64) -> i64
      %6075 = func.call @cc_nil_value() : () -> i64
      %6076 = func.call @cc_cons(%6074, %6075) : (i64, i64) -> i64
      %6077 = func.call @cc_values_pack(%6076) : (i64) -> i64
      %6078 = llvm.mlir.addressof @str602 : !llvm.ptr
      %6079 = arith.constant 6 : i64
      %6080 = func.call @cc_make_string(%6078, %6079) : (!llvm.ptr, i64) -> i64
      %6081 = func.call @cc_nil_value() : () -> i64
      %6082 = func.call @cc_intern(%6080, %6081) : (i64, i64) -> i64
      %6083 = func.call @cc_nil_value() : () -> i64
      %6084 = func.call @cc_cons(%6082, %6083) : (i64, i64) -> i64
      %6085 = func.call @cc_values_pack(%6084) : (i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %6086 = arith.addi %6082, %__rlasp_stack_elide_zero_293 : i64
      %6087 = func.call @cc_nil_value() : () -> i64
      %6088 = func.call @cc_errorp(%5781) : (i64) -> i64
      %6089 = arith.cmpi ne, %6088, %6087 : i64
      %6090 = arith.cmpi eq, %6087, %6087 : i64
      %6091 = arith.andi %6089, %6090 : i1
      %6092 = scf.if %6091 -> (i64) {
        scf.yield %5781 : i64
      } else {
        scf.yield %6087 : i64
      }
      %6093 = func.call @cc_errorp(%5978) : (i64) -> i64
      %6094 = arith.cmpi ne, %6093, %6087 : i64
      %6095 = arith.cmpi eq, %6092, %6087 : i64
      %6096 = arith.andi %6094, %6095 : i1
      %6097 = scf.if %6096 -> (i64) {
        scf.yield %5978 : i64
      } else {
        scf.yield %6092 : i64
      }
      %6098 = func.call @cc_errorp(%6044) : (i64) -> i64
      %6099 = arith.cmpi ne, %6098, %6087 : i64
      %6100 = arith.cmpi eq, %6097, %6087 : i64
      %6101 = arith.andi %6099, %6100 : i1
      %6102 = scf.if %6101 -> (i64) {
        scf.yield %6044 : i64
      } else {
        scf.yield %6097 : i64
      }
      %6103 = func.call @cc_errorp(%6056) : (i64) -> i64
      %6104 = arith.cmpi ne, %6103, %6087 : i64
      %6105 = arith.cmpi eq, %6102, %6087 : i64
      %6106 = arith.andi %6104, %6105 : i1
      %6107 = scf.if %6106 -> (i64) {
        scf.yield %6056 : i64
      } else {
        scf.yield %6102 : i64
      }
      %6108 = func.call @cc_errorp(%6063) : (i64) -> i64
      %6109 = arith.cmpi ne, %6108, %6087 : i64
      %6110 = arith.cmpi eq, %6107, %6087 : i64
      %6111 = arith.andi %6109, %6110 : i1
      %6112 = scf.if %6111 -> (i64) {
        scf.yield %6063 : i64
      } else {
        scf.yield %6107 : i64
      }
      %6113 = func.call @cc_errorp(%6067) : (i64) -> i64
      %6114 = arith.cmpi ne, %6113, %6087 : i64
      %6115 = arith.cmpi eq, %6112, %6087 : i64
      %6116 = arith.andi %6114, %6115 : i1
      %6117 = scf.if %6116 -> (i64) {
        scf.yield %6067 : i64
      } else {
        scf.yield %6112 : i64
      }
      %6118 = func.call @cc_errorp(%6074) : (i64) -> i64
      %6119 = arith.cmpi ne, %6118, %6087 : i64
      %6120 = arith.cmpi eq, %6117, %6087 : i64
      %6121 = arith.andi %6119, %6120 : i1
      %6122 = scf.if %6121 -> (i64) {
        scf.yield %6074 : i64
      } else {
        scf.yield %6117 : i64
      }
      %6123 = func.call @cc_errorp(%6086) : (i64) -> i64
      %6124 = arith.cmpi ne, %6123, %6087 : i64
      %6125 = arith.cmpi eq, %6122, %6087 : i64
      %6126 = arith.andi %6124, %6125 : i1
      %6127 = scf.if %6126 -> (i64) {
        scf.yield %6086 : i64
      } else {
        scf.yield %6122 : i64
      }
      %6128 = arith.cmpi ne, %6127, %6087 : i64
      scf.if %6128 {
        func.call @stack_push_pointer(%6127) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5781) : (i64) -> ()
        func.call @stack_push_pointer(%5978) : (i64) -> ()
        func.call @stack_push_pointer(%6044) : (i64) -> ()
        func.call @stack_push_pointer(%6056) : (i64) -> ()
        func.call @stack_push_pointer(%6063) : (i64) -> ()
        func.call @stack_push_pointer(%6067) : (i64) -> ()
        func.call @stack_push_pointer(%6074) : (i64) -> ()
        func.call @stack_push_pointer(%6086) : (i64) -> ()
        %6129 = llvm.mlir.addressof @str603 : !llvm.ptr
        %6130 = func.call @cc_make_function_ref_const(%6129) : (!llvm.ptr) -> i64
        %6131 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6130, %6131) : (i64, i64) -> ()
      }
      %6132 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6132 : i64
    }
    %6133 = func.call @cc_nil_value() : () -> i64
    %6134 = func.call @cc_errorp(%5772) : (i64) -> i64
    %6135 = arith.cmpi ne, %6134, %6133 : i64
    %6136 = scf.if %6135 -> (i64) {
      scf.yield %5772 : i64
    } else {
      %6137 = llvm.mlir.addressof @str604 : !llvm.ptr
      %6138 = arith.constant 18 : i64
      %6139 = func.call @cc_make_string(%6137, %6138) : (!llvm.ptr, i64) -> i64
      %6140 = func.call @cc_nil_value() : () -> i64
      %6141 = func.call @cc_intern(%6139, %6140) : (i64, i64) -> i64
      %6142 = func.call @cc_nil_value() : () -> i64
      %6143 = func.call @cc_cons(%6141, %6142) : (i64, i64) -> i64
      %6144 = func.call @cc_values_pack(%6143) : (i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %6145 = arith.addi %6141, %__rlasp_stack_elide_zero_294 : i64
      %6146 = llvm.mlir.addressof @str605 : !llvm.ptr
      %6147 = arith.constant 3 : i64
      %6148 = func.call @cc_make_string(%6146, %6147) : (!llvm.ptr, i64) -> i64
      %6149 = func.call @cc_nil_value() : () -> i64
      %6150 = func.call @cc_intern(%6148, %6149) : (i64, i64) -> i64
      %6151 = func.call @cc_nil_value() : () -> i64
      %6152 = func.call @cc_cons(%6150, %6151) : (i64, i64) -> i64
      %6153 = func.call @cc_values_pack(%6152) : (i64) -> i64
      func.call @stack_push_pointer(%6150) : (i64) -> ()
      %6154 = llvm.mlir.addressof @str606 : !llvm.ptr
      %6155 = arith.constant 3 : i64
      %6156 = func.call @cc_make_string(%6154, %6155) : (!llvm.ptr, i64) -> i64
      %6157 = func.call @cc_nil_value() : () -> i64
      %6158 = func.call @cc_intern(%6156, %6157) : (i64, i64) -> i64
      %6159 = func.call @cc_nil_value() : () -> i64
      %6160 = func.call @cc_cons(%6158, %6159) : (i64, i64) -> i64
      %6161 = func.call @cc_values_pack(%6160) : (i64) -> i64
      func.call @stack_push_pointer(%6158) : (i64) -> ()
      %6162 = llvm.mlir.addressof @str607 : !llvm.ptr
      %6163 = arith.constant 19 : i64
      %6164 = func.call @cc_make_string(%6162, %6163) : (!llvm.ptr, i64) -> i64
      %6165 = llvm.mlir.addressof @str608 : !llvm.ptr
      %6166 = arith.constant 11 : i64
      %6167 = func.call @cc_make_string(%6165, %6166) : (!llvm.ptr, i64) -> i64
      %6168 = func.call @cc_intern(%6164, %6167) : (i64, i64) -> i64
      %6169 = func.call @cc_nil_value() : () -> i64
      %6170 = func.call @cc_cons(%6168, %6169) : (i64, i64) -> i64
      %6171 = func.call @cc_values_pack(%6170) : (i64) -> i64
      func.call @stack_push_pointer(%6168) : (i64) -> ()
      %6172 = llvm.mlir.addressof @str609 : !llvm.ptr
      %6173 = arith.constant 2 : i64
      %6174 = func.call @cc_make_string(%6172, %6173) : (!llvm.ptr, i64) -> i64
      %6175 = llvm.mlir.addressof @str610 : !llvm.ptr
      %6176 = arith.constant 11 : i64
      %6177 = func.call @cc_make_string(%6175, %6176) : (!llvm.ptr, i64) -> i64
      %6178 = func.call @cc_intern(%6174, %6177) : (i64, i64) -> i64
      %6179 = func.call @cc_nil_value() : () -> i64
      %6180 = func.call @cc_cons(%6178, %6179) : (i64, i64) -> i64
      %6181 = func.call @cc_values_pack(%6180) : (i64) -> i64
      func.call @stack_push_pointer(%6178) : (i64) -> ()
      %6182 = llvm.mlir.addressof @str611 : !llvm.ptr
      %6183 = arith.constant 2 : i64
      %6184 = func.call @cc_make_string(%6182, %6183) : (!llvm.ptr, i64) -> i64
      %6185 = llvm.mlir.addressof @str612 : !llvm.ptr
      %6186 = arith.constant 11 : i64
      %6187 = func.call @cc_make_string(%6185, %6186) : (!llvm.ptr, i64) -> i64
      %6188 = func.call @cc_intern(%6184, %6187) : (i64, i64) -> i64
      %6189 = func.call @cc_nil_value() : () -> i64
      %6190 = func.call @cc_cons(%6188, %6189) : (i64, i64) -> i64
      %6191 = func.call @cc_values_pack(%6190) : (i64) -> i64
      func.call @stack_push_pointer(%6188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6192 = func.call @stack_pop_pointer() : () -> i64
      %6193 = func.call @stack_pop_pointer() : () -> i64
      %6194 = func.call @cc_cons(%6193, %6192) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %6195 = arith.addi %6194, %__rlasp_stack_elide_zero_295 : i64
      %6196 = func.call @stack_pop_pointer() : () -> i64
      %6197 = func.call @cc_cons(%6196, %6195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6197) : (i64) -> ()
      %6198 = llvm.mlir.addressof @str613 : !llvm.ptr
      %6199 = arith.constant 8 : i64
      %6200 = func.call @cc_make_string(%6198, %6199) : (!llvm.ptr, i64) -> i64
      %6201 = llvm.mlir.addressof @str614 : !llvm.ptr
      %6202 = arith.constant 11 : i64
      %6203 = func.call @cc_make_string(%6201, %6202) : (!llvm.ptr, i64) -> i64
      %6204 = func.call @cc_intern(%6200, %6203) : (i64, i64) -> i64
      %6205 = func.call @cc_nil_value() : () -> i64
      %6206 = func.call @cc_cons(%6204, %6205) : (i64, i64) -> i64
      %6207 = func.call @cc_values_pack(%6206) : (i64) -> i64
      func.call @stack_push_pointer(%6204) : (i64) -> ()
      %6208 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6208) : (i64) -> ()
      %6209 = llvm.mlir.addressof @str615 : !llvm.ptr
      %6210 = arith.constant 18 : i64
      %6211 = func.call @cc_make_string(%6209, %6210) : (!llvm.ptr, i64) -> i64
      %6212 = llvm.mlir.addressof @str616 : !llvm.ptr
      %6213 = arith.constant 11 : i64
      %6214 = func.call @cc_make_string(%6212, %6213) : (!llvm.ptr, i64) -> i64
      %6215 = func.call @cc_intern(%6211, %6214) : (i64, i64) -> i64
      %6216 = func.call @cc_nil_value() : () -> i64
      %6217 = func.call @cc_cons(%6215, %6216) : (i64, i64) -> i64
      %6218 = func.call @cc_values_pack(%6217) : (i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %6219 = arith.addi %6215, %__rlasp_stack_elide_zero_296 : i64
      %6220 = func.call @stack_pop_pointer() : () -> i64
      %6221 = func.call @cc_cons(%6219, %6220) : (i64, i64) -> i64
      %6222 = llvm.mlir.addressof @str617 : !llvm.ptr
      %6223 = arith.constant 5 : i64
      %6224 = func.call @cc_make_string(%6222, %6223) : (!llvm.ptr, i64) -> i64
      %6225 = func.call @cc_nil_value() : () -> i64
      %6226 = func.call @cc_intern(%6224, %6225) : (i64, i64) -> i64
      %6227 = func.call @cc_nil_value() : () -> i64
      %6228 = func.call @cc_cons(%6226, %6227) : (i64, i64) -> i64
      %6229 = func.call @cc_values_pack(%6228) : (i64) -> i64
      %6230 = func.call @cc_cons(%6226, %6221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6230) : (i64) -> ()
      %6231 = llvm.mlir.addressof @str618 : !llvm.ptr
      %6232 = arith.constant 10 : i64
      %6233 = func.call @cc_make_string(%6231, %6232) : (!llvm.ptr, i64) -> i64
      %6234 = llvm.mlir.addressof @str619 : !llvm.ptr
      %6235 = arith.constant 11 : i64
      %6236 = func.call @cc_make_string(%6234, %6235) : (!llvm.ptr, i64) -> i64
      %6237 = func.call @cc_intern(%6233, %6236) : (i64, i64) -> i64
      %6238 = func.call @cc_nil_value() : () -> i64
      %6239 = func.call @cc_cons(%6237, %6238) : (i64, i64) -> i64
      %6240 = func.call @cc_values_pack(%6239) : (i64) -> i64
      func.call @stack_push_pointer(%6237) : (i64) -> ()
      %6241 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6241) : (i64) -> ()
      %6242 = llvm.mlir.addressof @str620 : !llvm.ptr
      %6243 = arith.constant 18 : i64
      %6244 = func.call @cc_make_string(%6242, %6243) : (!llvm.ptr, i64) -> i64
      %6245 = llvm.mlir.addressof @str621 : !llvm.ptr
      %6246 = arith.constant 11 : i64
      %6247 = func.call @cc_make_string(%6245, %6246) : (!llvm.ptr, i64) -> i64
      %6248 = func.call @cc_intern(%6244, %6247) : (i64, i64) -> i64
      %6249 = func.call @cc_nil_value() : () -> i64
      %6250 = func.call @cc_cons(%6248, %6249) : (i64, i64) -> i64
      %6251 = func.call @cc_values_pack(%6250) : (i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %6252 = arith.addi %6248, %__rlasp_stack_elide_zero_297 : i64
      %6253 = func.call @stack_pop_pointer() : () -> i64
      %6254 = func.call @cc_cons(%6252, %6253) : (i64, i64) -> i64
      %6255 = llvm.mlir.addressof @str622 : !llvm.ptr
      %6256 = arith.constant 5 : i64
      %6257 = func.call @cc_make_string(%6255, %6256) : (!llvm.ptr, i64) -> i64
      %6258 = func.call @cc_nil_value() : () -> i64
      %6259 = func.call @cc_intern(%6257, %6258) : (i64, i64) -> i64
      %6260 = func.call @cc_nil_value() : () -> i64
      %6261 = func.call @cc_cons(%6259, %6260) : (i64, i64) -> i64
      %6262 = func.call @cc_values_pack(%6261) : (i64) -> i64
      %6263 = func.call @cc_cons(%6259, %6254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6264 = func.call @stack_pop_pointer() : () -> i64
      %6265 = func.call @stack_pop_pointer() : () -> i64
      %6266 = func.call @cc_cons(%6265, %6264) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %6267 = arith.addi %6266, %__rlasp_stack_elide_zero_298 : i64
      %6268 = func.call @stack_pop_pointer() : () -> i64
      %6269 = func.call @cc_cons(%6268, %6267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6269) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6270 = func.call @stack_pop_pointer() : () -> i64
      %6271 = func.call @stack_pop_pointer() : () -> i64
      %6272 = func.call @cc_cons(%6271, %6270) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %6273 = arith.addi %6272, %__rlasp_stack_elide_zero_299 : i64
      %6274 = func.call @stack_pop_pointer() : () -> i64
      %6275 = func.call @cc_cons(%6274, %6273) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %6276 = arith.addi %6275, %__rlasp_stack_elide_zero_300 : i64
      %6277 = func.call @stack_pop_pointer() : () -> i64
      %6278 = func.call @cc_cons(%6277, %6276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6278) : (i64) -> ()
      %6279 = llvm.mlir.addressof @str623 : !llvm.ptr
      %6280 = arith.constant 3 : i64
      %6281 = func.call @cc_make_string(%6279, %6280) : (!llvm.ptr, i64) -> i64
      %6282 = llvm.mlir.addressof @str624 : !llvm.ptr
      %6283 = arith.constant 11 : i64
      %6284 = func.call @cc_make_string(%6282, %6283) : (!llvm.ptr, i64) -> i64
      %6285 = func.call @cc_intern(%6281, %6284) : (i64, i64) -> i64
      %6286 = func.call @cc_nil_value() : () -> i64
      %6287 = func.call @cc_cons(%6285, %6286) : (i64, i64) -> i64
      %6288 = func.call @cc_values_pack(%6287) : (i64) -> i64
      func.call @stack_push_pointer(%6285) : (i64) -> ()
      %6289 = llvm.mlir.addressof @str625 : !llvm.ptr
      %6290 = arith.constant 2 : i64
      %6291 = func.call @cc_make_string(%6289, %6290) : (!llvm.ptr, i64) -> i64
      %6292 = llvm.mlir.addressof @str626 : !llvm.ptr
      %6293 = arith.constant 11 : i64
      %6294 = func.call @cc_make_string(%6292, %6293) : (!llvm.ptr, i64) -> i64
      %6295 = func.call @cc_intern(%6291, %6294) : (i64, i64) -> i64
      %6296 = func.call @cc_nil_value() : () -> i64
      %6297 = func.call @cc_cons(%6295, %6296) : (i64, i64) -> i64
      %6298 = func.call @cc_values_pack(%6297) : (i64) -> i64
      func.call @stack_push_pointer(%6295) : (i64) -> ()
      %6299 = llvm.mlir.addressof @str627 : !llvm.ptr
      %6300 = arith.constant 2 : i64
      %6301 = func.call @cc_make_string(%6299, %6300) : (!llvm.ptr, i64) -> i64
      %6302 = llvm.mlir.addressof @str628 : !llvm.ptr
      %6303 = arith.constant 11 : i64
      %6304 = func.call @cc_make_string(%6302, %6303) : (!llvm.ptr, i64) -> i64
      %6305 = func.call @cc_intern(%6301, %6304) : (i64, i64) -> i64
      %6306 = func.call @cc_nil_value() : () -> i64
      %6307 = func.call @cc_cons(%6305, %6306) : (i64, i64) -> i64
      %6308 = func.call @cc_values_pack(%6307) : (i64) -> i64
      func.call @stack_push_pointer(%6305) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6309 = func.call @stack_pop_pointer() : () -> i64
      %6310 = func.call @stack_pop_pointer() : () -> i64
      %6311 = func.call @cc_cons(%6310, %6309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %6312 = arith.addi %6311, %__rlasp_stack_elide_zero_301 : i64
      %6313 = func.call @stack_pop_pointer() : () -> i64
      %6314 = func.call @cc_cons(%6313, %6312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %6315 = arith.addi %6314, %__rlasp_stack_elide_zero_302 : i64
      %6316 = func.call @stack_pop_pointer() : () -> i64
      %6317 = func.call @cc_cons(%6316, %6315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6318 = func.call @stack_pop_pointer() : () -> i64
      %6319 = func.call @stack_pop_pointer() : () -> i64
      %6320 = func.call @cc_cons(%6319, %6318) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %6321 = arith.addi %6320, %__rlasp_stack_elide_zero_303 : i64
      %6322 = func.call @stack_pop_pointer() : () -> i64
      %6323 = func.call @cc_cons(%6322, %6321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %6324 = arith.addi %6323, %__rlasp_stack_elide_zero_304 : i64
      %6325 = func.call @stack_pop_pointer() : () -> i64
      %6326 = func.call @cc_cons(%6325, %6324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %6327 = arith.addi %6326, %__rlasp_stack_elide_zero_305 : i64
      %6328 = func.call @stack_pop_pointer() : () -> i64
      %6329 = func.call @cc_cons(%6328, %6327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6329) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6330 = func.call @stack_pop_pointer() : () -> i64
      %6331 = func.call @stack_pop_pointer() : () -> i64
      %6332 = func.call @cc_cons(%6331, %6330) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %6333 = arith.addi %6332, %__rlasp_stack_elide_zero_306 : i64
      %6334 = func.call @stack_pop_pointer() : () -> i64
      %6335 = func.call @cc_cons(%6334, %6333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6335) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6336 = func.call @stack_pop_pointer() : () -> i64
      %6337 = func.call @stack_pop_pointer() : () -> i64
      %6338 = func.call @cc_cons(%6337, %6336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %6339 = arith.addi %6338, %__rlasp_stack_elide_zero_307 : i64
      %6340 = func.call @stack_pop_pointer() : () -> i64
      %6341 = func.call @cc_cons(%6340, %6339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %6342 = arith.addi %6341, %__rlasp_stack_elide_zero_308 : i64
      %6405 = arith.constant 206494159077401 : i64
      %6406 = arith.constant 0 : i64
      %6407 = func.call @cc_make_closure(%6405, %6406) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %6408 = arith.addi %6407, %__rlasp_stack_elide_zero_309 : i64
      %6409 = llvm.mlir.addressof @str634 : !llvm.ptr
      %6410 = arith.constant 1 : i64
      %6411 = func.call @cc_make_string(%6409, %6410) : (!llvm.ptr, i64) -> i64
      %6412 = func.call @cc_nil_value() : () -> i64
      %6413 = func.call @cc_intern(%6411, %6412) : (i64, i64) -> i64
      %6414 = func.call @cc_nil_value() : () -> i64
      %6415 = func.call @cc_cons(%6413, %6414) : (i64, i64) -> i64
      %6416 = func.call @cc_values_pack(%6415) : (i64) -> i64
      func.call @stack_push_pointer(%6413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6417 = func.call @stack_pop_pointer() : () -> i64
      %6418 = func.call @stack_pop_pointer() : () -> i64
      %6419 = func.call @cc_cons(%6418, %6417) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %6420 = arith.addi %6419, %__rlasp_stack_elide_zero_310 : i64
      %6421 = llvm.mlir.addressof @str635 : !llvm.ptr
      %6422 = arith.constant 11 : i64
      %6423 = func.call @cc_make_string(%6421, %6422) : (!llvm.ptr, i64) -> i64
      %6424 = llvm.mlir.addressof @str636 : !llvm.ptr
      %6425 = arith.constant 7 : i64
      %6426 = func.call @cc_make_string(%6424, %6425) : (!llvm.ptr, i64) -> i64
      %6427 = func.call @cc_intern(%6423, %6426) : (i64, i64) -> i64
      %6428 = func.call @cc_nil_value() : () -> i64
      %6429 = func.call @cc_cons(%6427, %6428) : (i64, i64) -> i64
      %6430 = func.call @cc_values_pack(%6429) : (i64) -> i64
      %6431 = func.call @cc_nil_value() : () -> i64
      %6432 = llvm.mlir.addressof @str637 : !llvm.ptr
      %6433 = arith.constant 4 : i64
      %6434 = func.call @cc_make_string(%6432, %6433) : (!llvm.ptr, i64) -> i64
      %6435 = llvm.mlir.addressof @str638 : !llvm.ptr
      %6436 = arith.constant 7 : i64
      %6437 = func.call @cc_make_string(%6435, %6436) : (!llvm.ptr, i64) -> i64
      %6438 = func.call @cc_intern(%6434, %6437) : (i64, i64) -> i64
      %6439 = func.call @cc_nil_value() : () -> i64
      %6440 = func.call @cc_cons(%6438, %6439) : (i64, i64) -> i64
      %6441 = func.call @cc_values_pack(%6440) : (i64) -> i64
      %6442 = llvm.mlir.addressof @str639 : !llvm.ptr
      %6443 = arith.constant 6 : i64
      %6444 = func.call @cc_make_string(%6442, %6443) : (!llvm.ptr, i64) -> i64
      %6445 = func.call @cc_nil_value() : () -> i64
      %6446 = func.call @cc_intern(%6444, %6445) : (i64, i64) -> i64
      %6447 = func.call @cc_nil_value() : () -> i64
      %6448 = func.call @cc_cons(%6446, %6447) : (i64, i64) -> i64
      %6449 = func.call @cc_values_pack(%6448) : (i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %6450 = arith.addi %6446, %__rlasp_stack_elide_zero_311 : i64
      %6451 = func.call @cc_nil_value() : () -> i64
      %6452 = func.call @cc_errorp(%6145) : (i64) -> i64
      %6453 = arith.cmpi ne, %6452, %6451 : i64
      %6454 = arith.cmpi eq, %6451, %6451 : i64
      %6455 = arith.andi %6453, %6454 : i1
      %6456 = scf.if %6455 -> (i64) {
        scf.yield %6145 : i64
      } else {
        scf.yield %6451 : i64
      }
      %6457 = func.call @cc_errorp(%6342) : (i64) -> i64
      %6458 = arith.cmpi ne, %6457, %6451 : i64
      %6459 = arith.cmpi eq, %6456, %6451 : i64
      %6460 = arith.andi %6458, %6459 : i1
      %6461 = scf.if %6460 -> (i64) {
        scf.yield %6342 : i64
      } else {
        scf.yield %6456 : i64
      }
      %6462 = func.call @cc_errorp(%6408) : (i64) -> i64
      %6463 = arith.cmpi ne, %6462, %6451 : i64
      %6464 = arith.cmpi eq, %6461, %6451 : i64
      %6465 = arith.andi %6463, %6464 : i1
      %6466 = scf.if %6465 -> (i64) {
        scf.yield %6408 : i64
      } else {
        scf.yield %6461 : i64
      }
      %6467 = func.call @cc_errorp(%6420) : (i64) -> i64
      %6468 = arith.cmpi ne, %6467, %6451 : i64
      %6469 = arith.cmpi eq, %6466, %6451 : i64
      %6470 = arith.andi %6468, %6469 : i1
      %6471 = scf.if %6470 -> (i64) {
        scf.yield %6420 : i64
      } else {
        scf.yield %6466 : i64
      }
      %6472 = func.call @cc_errorp(%6427) : (i64) -> i64
      %6473 = arith.cmpi ne, %6472, %6451 : i64
      %6474 = arith.cmpi eq, %6471, %6451 : i64
      %6475 = arith.andi %6473, %6474 : i1
      %6476 = scf.if %6475 -> (i64) {
        scf.yield %6427 : i64
      } else {
        scf.yield %6471 : i64
      }
      %6477 = func.call @cc_errorp(%6431) : (i64) -> i64
      %6478 = arith.cmpi ne, %6477, %6451 : i64
      %6479 = arith.cmpi eq, %6476, %6451 : i64
      %6480 = arith.andi %6478, %6479 : i1
      %6481 = scf.if %6480 -> (i64) {
        scf.yield %6431 : i64
      } else {
        scf.yield %6476 : i64
      }
      %6482 = func.call @cc_errorp(%6438) : (i64) -> i64
      %6483 = arith.cmpi ne, %6482, %6451 : i64
      %6484 = arith.cmpi eq, %6481, %6451 : i64
      %6485 = arith.andi %6483, %6484 : i1
      %6486 = scf.if %6485 -> (i64) {
        scf.yield %6438 : i64
      } else {
        scf.yield %6481 : i64
      }
      %6487 = func.call @cc_errorp(%6450) : (i64) -> i64
      %6488 = arith.cmpi ne, %6487, %6451 : i64
      %6489 = arith.cmpi eq, %6486, %6451 : i64
      %6490 = arith.andi %6488, %6489 : i1
      %6491 = scf.if %6490 -> (i64) {
        scf.yield %6450 : i64
      } else {
        scf.yield %6486 : i64
      }
      %6492 = arith.cmpi ne, %6491, %6451 : i64
      scf.if %6492 {
        func.call @stack_push_pointer(%6491) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6145) : (i64) -> ()
        func.call @stack_push_pointer(%6342) : (i64) -> ()
        func.call @stack_push_pointer(%6408) : (i64) -> ()
        func.call @stack_push_pointer(%6420) : (i64) -> ()
        func.call @stack_push_pointer(%6427) : (i64) -> ()
        func.call @stack_push_pointer(%6431) : (i64) -> ()
        func.call @stack_push_pointer(%6438) : (i64) -> ()
        func.call @stack_push_pointer(%6450) : (i64) -> ()
        %6493 = llvm.mlir.addressof @str640 : !llvm.ptr
        %6494 = func.call @cc_make_function_ref_const(%6493) : (!llvm.ptr) -> i64
        %6495 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6494, %6495) : (i64, i64) -> ()
      }
      %6496 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6496 : i64
    }
    %6497 = func.call @cc_nil_value() : () -> i64
    %6498 = func.call @cc_errorp(%6136) : (i64) -> i64
    %6499 = arith.cmpi ne, %6498, %6497 : i64
    %6500 = scf.if %6499 -> (i64) {
      scf.yield %6136 : i64
    } else {
      %6501 = llvm.mlir.addressof @str641 : !llvm.ptr
      %6502 = arith.constant 18 : i64
      %6503 = func.call @cc_make_string(%6501, %6502) : (!llvm.ptr, i64) -> i64
      %6504 = func.call @cc_nil_value() : () -> i64
      %6505 = func.call @cc_intern(%6503, %6504) : (i64, i64) -> i64
      %6506 = func.call @cc_nil_value() : () -> i64
      %6507 = func.call @cc_cons(%6505, %6506) : (i64, i64) -> i64
      %6508 = func.call @cc_values_pack(%6507) : (i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %6509 = arith.addi %6505, %__rlasp_stack_elide_zero_312 : i64
      %6510 = llvm.mlir.addressof @str642 : !llvm.ptr
      %6511 = arith.constant 3 : i64
      %6512 = func.call @cc_make_string(%6510, %6511) : (!llvm.ptr, i64) -> i64
      %6513 = func.call @cc_nil_value() : () -> i64
      %6514 = func.call @cc_intern(%6512, %6513) : (i64, i64) -> i64
      %6515 = func.call @cc_nil_value() : () -> i64
      %6516 = func.call @cc_cons(%6514, %6515) : (i64, i64) -> i64
      %6517 = func.call @cc_values_pack(%6516) : (i64) -> i64
      func.call @stack_push_pointer(%6514) : (i64) -> ()
      %6518 = llvm.mlir.addressof @str643 : !llvm.ptr
      %6519 = arith.constant 3 : i64
      %6520 = func.call @cc_make_string(%6518, %6519) : (!llvm.ptr, i64) -> i64
      %6521 = func.call @cc_nil_value() : () -> i64
      %6522 = func.call @cc_intern(%6520, %6521) : (i64, i64) -> i64
      %6523 = func.call @cc_nil_value() : () -> i64
      %6524 = func.call @cc_cons(%6522, %6523) : (i64, i64) -> i64
      %6525 = func.call @cc_values_pack(%6524) : (i64) -> i64
      func.call @stack_push_pointer(%6522) : (i64) -> ()
      %6526 = llvm.mlir.addressof @str644 : !llvm.ptr
      %6527 = arith.constant 19 : i64
      %6528 = func.call @cc_make_string(%6526, %6527) : (!llvm.ptr, i64) -> i64
      %6529 = llvm.mlir.addressof @str645 : !llvm.ptr
      %6530 = arith.constant 11 : i64
      %6531 = func.call @cc_make_string(%6529, %6530) : (!llvm.ptr, i64) -> i64
      %6532 = func.call @cc_intern(%6528, %6531) : (i64, i64) -> i64
      %6533 = func.call @cc_nil_value() : () -> i64
      %6534 = func.call @cc_cons(%6532, %6533) : (i64, i64) -> i64
      %6535 = func.call @cc_values_pack(%6534) : (i64) -> i64
      func.call @stack_push_pointer(%6532) : (i64) -> ()
      %6536 = llvm.mlir.addressof @str646 : !llvm.ptr
      %6537 = arith.constant 2 : i64
      %6538 = func.call @cc_make_string(%6536, %6537) : (!llvm.ptr, i64) -> i64
      %6539 = llvm.mlir.addressof @str647 : !llvm.ptr
      %6540 = arith.constant 11 : i64
      %6541 = func.call @cc_make_string(%6539, %6540) : (!llvm.ptr, i64) -> i64
      %6542 = func.call @cc_intern(%6538, %6541) : (i64, i64) -> i64
      %6543 = func.call @cc_nil_value() : () -> i64
      %6544 = func.call @cc_cons(%6542, %6543) : (i64, i64) -> i64
      %6545 = func.call @cc_values_pack(%6544) : (i64) -> i64
      func.call @stack_push_pointer(%6542) : (i64) -> ()
      %6546 = llvm.mlir.addressof @str648 : !llvm.ptr
      %6547 = arith.constant 2 : i64
      %6548 = func.call @cc_make_string(%6546, %6547) : (!llvm.ptr, i64) -> i64
      %6549 = llvm.mlir.addressof @str649 : !llvm.ptr
      %6550 = arith.constant 11 : i64
      %6551 = func.call @cc_make_string(%6549, %6550) : (!llvm.ptr, i64) -> i64
      %6552 = func.call @cc_intern(%6548, %6551) : (i64, i64) -> i64
      %6553 = func.call @cc_nil_value() : () -> i64
      %6554 = func.call @cc_cons(%6552, %6553) : (i64, i64) -> i64
      %6555 = func.call @cc_values_pack(%6554) : (i64) -> i64
      func.call @stack_push_pointer(%6552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6556 = func.call @stack_pop_pointer() : () -> i64
      %6557 = func.call @stack_pop_pointer() : () -> i64
      %6558 = func.call @cc_cons(%6557, %6556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %6559 = arith.addi %6558, %__rlasp_stack_elide_zero_313 : i64
      %6560 = func.call @stack_pop_pointer() : () -> i64
      %6561 = func.call @cc_cons(%6560, %6559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6561) : (i64) -> ()
      %6562 = llvm.mlir.addressof @str650 : !llvm.ptr
      %6563 = arith.constant 8 : i64
      %6564 = func.call @cc_make_string(%6562, %6563) : (!llvm.ptr, i64) -> i64
      %6565 = llvm.mlir.addressof @str651 : !llvm.ptr
      %6566 = arith.constant 11 : i64
      %6567 = func.call @cc_make_string(%6565, %6566) : (!llvm.ptr, i64) -> i64
      %6568 = func.call @cc_intern(%6564, %6567) : (i64, i64) -> i64
      %6569 = func.call @cc_nil_value() : () -> i64
      %6570 = func.call @cc_cons(%6568, %6569) : (i64, i64) -> i64
      %6571 = func.call @cc_values_pack(%6570) : (i64) -> i64
      func.call @stack_push_pointer(%6568) : (i64) -> ()
      %6572 = llvm.mlir.addressof @str652 : !llvm.ptr
      %6573 = arith.constant 10 : i64
      %6574 = func.call @cc_make_string(%6572, %6573) : (!llvm.ptr, i64) -> i64
      %6575 = llvm.mlir.addressof @str653 : !llvm.ptr
      %6576 = arith.constant 11 : i64
      %6577 = func.call @cc_make_string(%6575, %6576) : (!llvm.ptr, i64) -> i64
      %6578 = func.call @cc_intern(%6574, %6577) : (i64, i64) -> i64
      %6579 = func.call @cc_nil_value() : () -> i64
      %6580 = func.call @cc_cons(%6578, %6579) : (i64, i64) -> i64
      %6581 = func.call @cc_values_pack(%6580) : (i64) -> i64
      func.call @stack_push_pointer(%6578) : (i64) -> ()
      %6582 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6582) : (i64) -> ()
      %6583 = llvm.mlir.addressof @str654 : !llvm.ptr
      %6584 = arith.constant 18 : i64
      %6585 = func.call @cc_make_string(%6583, %6584) : (!llvm.ptr, i64) -> i64
      %6586 = llvm.mlir.addressof @str655 : !llvm.ptr
      %6587 = arith.constant 11 : i64
      %6588 = func.call @cc_make_string(%6586, %6587) : (!llvm.ptr, i64) -> i64
      %6589 = func.call @cc_intern(%6585, %6588) : (i64, i64) -> i64
      %6590 = func.call @cc_nil_value() : () -> i64
      %6591 = func.call @cc_cons(%6589, %6590) : (i64, i64) -> i64
      %6592 = func.call @cc_values_pack(%6591) : (i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %6593 = arith.addi %6589, %__rlasp_stack_elide_zero_314 : i64
      %6594 = func.call @stack_pop_pointer() : () -> i64
      %6595 = func.call @cc_cons(%6593, %6594) : (i64, i64) -> i64
      %6596 = llvm.mlir.addressof @str656 : !llvm.ptr
      %6597 = arith.constant 5 : i64
      %6598 = func.call @cc_make_string(%6596, %6597) : (!llvm.ptr, i64) -> i64
      %6599 = func.call @cc_nil_value() : () -> i64
      %6600 = func.call @cc_intern(%6598, %6599) : (i64, i64) -> i64
      %6601 = func.call @cc_nil_value() : () -> i64
      %6602 = func.call @cc_cons(%6600, %6601) : (i64, i64) -> i64
      %6603 = func.call @cc_values_pack(%6602) : (i64) -> i64
      %6604 = func.call @cc_cons(%6600, %6595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6605 = func.call @stack_pop_pointer() : () -> i64
      %6606 = func.call @stack_pop_pointer() : () -> i64
      %6607 = func.call @cc_cons(%6606, %6605) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %6608 = arith.addi %6607, %__rlasp_stack_elide_zero_315 : i64
      %6609 = func.call @stack_pop_pointer() : () -> i64
      %6610 = func.call @cc_cons(%6609, %6608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6610) : (i64) -> ()
      %6611 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6611) : (i64) -> ()
      %6612 = llvm.mlir.addressof @str657 : !llvm.ptr
      %6613 = arith.constant 18 : i64
      %6614 = func.call @cc_make_string(%6612, %6613) : (!llvm.ptr, i64) -> i64
      %6615 = llvm.mlir.addressof @str658 : !llvm.ptr
      %6616 = arith.constant 11 : i64
      %6617 = func.call @cc_make_string(%6615, %6616) : (!llvm.ptr, i64) -> i64
      %6618 = func.call @cc_intern(%6614, %6617) : (i64, i64) -> i64
      %6619 = func.call @cc_nil_value() : () -> i64
      %6620 = func.call @cc_cons(%6618, %6619) : (i64, i64) -> i64
      %6621 = func.call @cc_values_pack(%6620) : (i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %6622 = arith.addi %6618, %__rlasp_stack_elide_zero_316 : i64
      %6623 = func.call @stack_pop_pointer() : () -> i64
      %6624 = func.call @cc_cons(%6622, %6623) : (i64, i64) -> i64
      %6625 = llvm.mlir.addressof @str659 : !llvm.ptr
      %6626 = arith.constant 5 : i64
      %6627 = func.call @cc_make_string(%6625, %6626) : (!llvm.ptr, i64) -> i64
      %6628 = func.call @cc_nil_value() : () -> i64
      %6629 = func.call @cc_intern(%6627, %6628) : (i64, i64) -> i64
      %6630 = func.call @cc_nil_value() : () -> i64
      %6631 = func.call @cc_cons(%6629, %6630) : (i64, i64) -> i64
      %6632 = func.call @cc_values_pack(%6631) : (i64) -> i64
      %6633 = func.call @cc_cons(%6629, %6624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6633) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6634 = func.call @stack_pop_pointer() : () -> i64
      %6635 = func.call @stack_pop_pointer() : () -> i64
      %6636 = func.call @cc_cons(%6635, %6634) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %6637 = arith.addi %6636, %__rlasp_stack_elide_zero_317 : i64
      %6638 = func.call @stack_pop_pointer() : () -> i64
      %6639 = func.call @cc_cons(%6638, %6637) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %6640 = arith.addi %6639, %__rlasp_stack_elide_zero_318 : i64
      %6641 = func.call @stack_pop_pointer() : () -> i64
      %6642 = func.call @cc_cons(%6641, %6640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6642) : (i64) -> ()
      %6643 = llvm.mlir.addressof @str660 : !llvm.ptr
      %6644 = arith.constant 3 : i64
      %6645 = func.call @cc_make_string(%6643, %6644) : (!llvm.ptr, i64) -> i64
      %6646 = llvm.mlir.addressof @str661 : !llvm.ptr
      %6647 = arith.constant 11 : i64
      %6648 = func.call @cc_make_string(%6646, %6647) : (!llvm.ptr, i64) -> i64
      %6649 = func.call @cc_intern(%6645, %6648) : (i64, i64) -> i64
      %6650 = func.call @cc_nil_value() : () -> i64
      %6651 = func.call @cc_cons(%6649, %6650) : (i64, i64) -> i64
      %6652 = func.call @cc_values_pack(%6651) : (i64) -> i64
      func.call @stack_push_pointer(%6649) : (i64) -> ()
      %6653 = llvm.mlir.addressof @str662 : !llvm.ptr
      %6654 = arith.constant 2 : i64
      %6655 = func.call @cc_make_string(%6653, %6654) : (!llvm.ptr, i64) -> i64
      %6656 = llvm.mlir.addressof @str663 : !llvm.ptr
      %6657 = arith.constant 11 : i64
      %6658 = func.call @cc_make_string(%6656, %6657) : (!llvm.ptr, i64) -> i64
      %6659 = func.call @cc_intern(%6655, %6658) : (i64, i64) -> i64
      %6660 = func.call @cc_nil_value() : () -> i64
      %6661 = func.call @cc_cons(%6659, %6660) : (i64, i64) -> i64
      %6662 = func.call @cc_values_pack(%6661) : (i64) -> i64
      func.call @stack_push_pointer(%6659) : (i64) -> ()
      %6663 = llvm.mlir.addressof @str664 : !llvm.ptr
      %6664 = arith.constant 2 : i64
      %6665 = func.call @cc_make_string(%6663, %6664) : (!llvm.ptr, i64) -> i64
      %6666 = llvm.mlir.addressof @str665 : !llvm.ptr
      %6667 = arith.constant 11 : i64
      %6668 = func.call @cc_make_string(%6666, %6667) : (!llvm.ptr, i64) -> i64
      %6669 = func.call @cc_intern(%6665, %6668) : (i64, i64) -> i64
      %6670 = func.call @cc_nil_value() : () -> i64
      %6671 = func.call @cc_cons(%6669, %6670) : (i64, i64) -> i64
      %6672 = func.call @cc_values_pack(%6671) : (i64) -> i64
      func.call @stack_push_pointer(%6669) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6673 = func.call @stack_pop_pointer() : () -> i64
      %6674 = func.call @stack_pop_pointer() : () -> i64
      %6675 = func.call @cc_cons(%6674, %6673) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %6676 = arith.addi %6675, %__rlasp_stack_elide_zero_319 : i64
      %6677 = func.call @stack_pop_pointer() : () -> i64
      %6678 = func.call @cc_cons(%6677, %6676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %6679 = arith.addi %6678, %__rlasp_stack_elide_zero_320 : i64
      %6680 = func.call @stack_pop_pointer() : () -> i64
      %6681 = func.call @cc_cons(%6680, %6679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6681) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6682 = func.call @stack_pop_pointer() : () -> i64
      %6683 = func.call @stack_pop_pointer() : () -> i64
      %6684 = func.call @cc_cons(%6683, %6682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %6685 = arith.addi %6684, %__rlasp_stack_elide_zero_321 : i64
      %6686 = func.call @stack_pop_pointer() : () -> i64
      %6687 = func.call @cc_cons(%6686, %6685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %6688 = arith.addi %6687, %__rlasp_stack_elide_zero_322 : i64
      %6689 = func.call @stack_pop_pointer() : () -> i64
      %6690 = func.call @cc_cons(%6689, %6688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %6691 = arith.addi %6690, %__rlasp_stack_elide_zero_323 : i64
      %6692 = func.call @stack_pop_pointer() : () -> i64
      %6693 = func.call @cc_cons(%6692, %6691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6693) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6694 = func.call @stack_pop_pointer() : () -> i64
      %6695 = func.call @stack_pop_pointer() : () -> i64
      %6696 = func.call @cc_cons(%6695, %6694) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %6697 = arith.addi %6696, %__rlasp_stack_elide_zero_324 : i64
      %6698 = func.call @stack_pop_pointer() : () -> i64
      %6699 = func.call @cc_cons(%6698, %6697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6699) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6700 = func.call @stack_pop_pointer() : () -> i64
      %6701 = func.call @stack_pop_pointer() : () -> i64
      %6702 = func.call @cc_cons(%6701, %6700) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %6703 = arith.addi %6702, %__rlasp_stack_elide_zero_325 : i64
      %6704 = func.call @stack_pop_pointer() : () -> i64
      %6705 = func.call @cc_cons(%6704, %6703) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %6706 = arith.addi %6705, %__rlasp_stack_elide_zero_326 : i64
      %6769 = arith.constant 206494159077402 : i64
      %6770 = arith.constant 0 : i64
      %6771 = func.call @cc_make_closure(%6769, %6770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %6772 = arith.addi %6771, %__rlasp_stack_elide_zero_327 : i64
      %6773 = llvm.mlir.addressof @str671 : !llvm.ptr
      %6774 = arith.constant 1 : i64
      %6775 = func.call @cc_make_string(%6773, %6774) : (!llvm.ptr, i64) -> i64
      %6776 = func.call @cc_nil_value() : () -> i64
      %6777 = func.call @cc_intern(%6775, %6776) : (i64, i64) -> i64
      %6778 = func.call @cc_nil_value() : () -> i64
      %6779 = func.call @cc_cons(%6777, %6778) : (i64, i64) -> i64
      %6780 = func.call @cc_values_pack(%6779) : (i64) -> i64
      func.call @stack_push_pointer(%6777) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6781 = func.call @stack_pop_pointer() : () -> i64
      %6782 = func.call @stack_pop_pointer() : () -> i64
      %6783 = func.call @cc_cons(%6782, %6781) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %6784 = arith.addi %6783, %__rlasp_stack_elide_zero_328 : i64
      %6785 = llvm.mlir.addressof @str672 : !llvm.ptr
      %6786 = arith.constant 11 : i64
      %6787 = func.call @cc_make_string(%6785, %6786) : (!llvm.ptr, i64) -> i64
      %6788 = llvm.mlir.addressof @str673 : !llvm.ptr
      %6789 = arith.constant 7 : i64
      %6790 = func.call @cc_make_string(%6788, %6789) : (!llvm.ptr, i64) -> i64
      %6791 = func.call @cc_intern(%6787, %6790) : (i64, i64) -> i64
      %6792 = func.call @cc_nil_value() : () -> i64
      %6793 = func.call @cc_cons(%6791, %6792) : (i64, i64) -> i64
      %6794 = func.call @cc_values_pack(%6793) : (i64) -> i64
      %6795 = func.call @cc_nil_value() : () -> i64
      %6796 = llvm.mlir.addressof @str674 : !llvm.ptr
      %6797 = arith.constant 4 : i64
      %6798 = func.call @cc_make_string(%6796, %6797) : (!llvm.ptr, i64) -> i64
      %6799 = llvm.mlir.addressof @str675 : !llvm.ptr
      %6800 = arith.constant 7 : i64
      %6801 = func.call @cc_make_string(%6799, %6800) : (!llvm.ptr, i64) -> i64
      %6802 = func.call @cc_intern(%6798, %6801) : (i64, i64) -> i64
      %6803 = func.call @cc_nil_value() : () -> i64
      %6804 = func.call @cc_cons(%6802, %6803) : (i64, i64) -> i64
      %6805 = func.call @cc_values_pack(%6804) : (i64) -> i64
      %6806 = llvm.mlir.addressof @str676 : !llvm.ptr
      %6807 = arith.constant 6 : i64
      %6808 = func.call @cc_make_string(%6806, %6807) : (!llvm.ptr, i64) -> i64
      %6809 = func.call @cc_nil_value() : () -> i64
      %6810 = func.call @cc_intern(%6808, %6809) : (i64, i64) -> i64
      %6811 = func.call @cc_nil_value() : () -> i64
      %6812 = func.call @cc_cons(%6810, %6811) : (i64, i64) -> i64
      %6813 = func.call @cc_values_pack(%6812) : (i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %6814 = arith.addi %6810, %__rlasp_stack_elide_zero_329 : i64
      %6815 = func.call @cc_nil_value() : () -> i64
      %6816 = func.call @cc_errorp(%6509) : (i64) -> i64
      %6817 = arith.cmpi ne, %6816, %6815 : i64
      %6818 = arith.cmpi eq, %6815, %6815 : i64
      %6819 = arith.andi %6817, %6818 : i1
      %6820 = scf.if %6819 -> (i64) {
        scf.yield %6509 : i64
      } else {
        scf.yield %6815 : i64
      }
      %6821 = func.call @cc_errorp(%6706) : (i64) -> i64
      %6822 = arith.cmpi ne, %6821, %6815 : i64
      %6823 = arith.cmpi eq, %6820, %6815 : i64
      %6824 = arith.andi %6822, %6823 : i1
      %6825 = scf.if %6824 -> (i64) {
        scf.yield %6706 : i64
      } else {
        scf.yield %6820 : i64
      }
      %6826 = func.call @cc_errorp(%6772) : (i64) -> i64
      %6827 = arith.cmpi ne, %6826, %6815 : i64
      %6828 = arith.cmpi eq, %6825, %6815 : i64
      %6829 = arith.andi %6827, %6828 : i1
      %6830 = scf.if %6829 -> (i64) {
        scf.yield %6772 : i64
      } else {
        scf.yield %6825 : i64
      }
      %6831 = func.call @cc_errorp(%6784) : (i64) -> i64
      %6832 = arith.cmpi ne, %6831, %6815 : i64
      %6833 = arith.cmpi eq, %6830, %6815 : i64
      %6834 = arith.andi %6832, %6833 : i1
      %6835 = scf.if %6834 -> (i64) {
        scf.yield %6784 : i64
      } else {
        scf.yield %6830 : i64
      }
      %6836 = func.call @cc_errorp(%6791) : (i64) -> i64
      %6837 = arith.cmpi ne, %6836, %6815 : i64
      %6838 = arith.cmpi eq, %6835, %6815 : i64
      %6839 = arith.andi %6837, %6838 : i1
      %6840 = scf.if %6839 -> (i64) {
        scf.yield %6791 : i64
      } else {
        scf.yield %6835 : i64
      }
      %6841 = func.call @cc_errorp(%6795) : (i64) -> i64
      %6842 = arith.cmpi ne, %6841, %6815 : i64
      %6843 = arith.cmpi eq, %6840, %6815 : i64
      %6844 = arith.andi %6842, %6843 : i1
      %6845 = scf.if %6844 -> (i64) {
        scf.yield %6795 : i64
      } else {
        scf.yield %6840 : i64
      }
      %6846 = func.call @cc_errorp(%6802) : (i64) -> i64
      %6847 = arith.cmpi ne, %6846, %6815 : i64
      %6848 = arith.cmpi eq, %6845, %6815 : i64
      %6849 = arith.andi %6847, %6848 : i1
      %6850 = scf.if %6849 -> (i64) {
        scf.yield %6802 : i64
      } else {
        scf.yield %6845 : i64
      }
      %6851 = func.call @cc_errorp(%6814) : (i64) -> i64
      %6852 = arith.cmpi ne, %6851, %6815 : i64
      %6853 = arith.cmpi eq, %6850, %6815 : i64
      %6854 = arith.andi %6852, %6853 : i1
      %6855 = scf.if %6854 -> (i64) {
        scf.yield %6814 : i64
      } else {
        scf.yield %6850 : i64
      }
      %6856 = arith.cmpi ne, %6855, %6815 : i64
      scf.if %6856 {
        func.call @stack_push_pointer(%6855) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6509) : (i64) -> ()
        func.call @stack_push_pointer(%6706) : (i64) -> ()
        func.call @stack_push_pointer(%6772) : (i64) -> ()
        func.call @stack_push_pointer(%6784) : (i64) -> ()
        func.call @stack_push_pointer(%6791) : (i64) -> ()
        func.call @stack_push_pointer(%6795) : (i64) -> ()
        func.call @stack_push_pointer(%6802) : (i64) -> ()
        func.call @stack_push_pointer(%6814) : (i64) -> ()
        %6857 = llvm.mlir.addressof @str677 : !llvm.ptr
        %6858 = func.call @cc_make_function_ref_const(%6857) : (!llvm.ptr) -> i64
        %6859 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6858, %6859) : (i64, i64) -> ()
      }
      %6860 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6860 : i64
    }
    %6861 = func.call @cc_nil_value() : () -> i64
    %6862 = func.call @cc_errorp(%6500) : (i64) -> i64
    %6863 = arith.cmpi ne, %6862, %6861 : i64
    %6864 = scf.if %6863 -> (i64) {
      scf.yield %6500 : i64
    } else {
      %6865 = llvm.mlir.addressof @str678 : !llvm.ptr
      %6866 = arith.constant 18 : i64
      %6867 = func.call @cc_make_string(%6865, %6866) : (!llvm.ptr, i64) -> i64
      %6868 = func.call @cc_nil_value() : () -> i64
      %6869 = func.call @cc_intern(%6867, %6868) : (i64, i64) -> i64
      %6870 = func.call @cc_nil_value() : () -> i64
      %6871 = func.call @cc_cons(%6869, %6870) : (i64, i64) -> i64
      %6872 = func.call @cc_values_pack(%6871) : (i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %6873 = arith.addi %6869, %__rlasp_stack_elide_zero_330 : i64
      %6874 = llvm.mlir.addressof @str679 : !llvm.ptr
      %6875 = arith.constant 3 : i64
      %6876 = func.call @cc_make_string(%6874, %6875) : (!llvm.ptr, i64) -> i64
      %6877 = func.call @cc_nil_value() : () -> i64
      %6878 = func.call @cc_intern(%6876, %6877) : (i64, i64) -> i64
      %6879 = func.call @cc_nil_value() : () -> i64
      %6880 = func.call @cc_cons(%6878, %6879) : (i64, i64) -> i64
      %6881 = func.call @cc_values_pack(%6880) : (i64) -> i64
      func.call @stack_push_pointer(%6878) : (i64) -> ()
      %6882 = llvm.mlir.addressof @str680 : !llvm.ptr
      %6883 = arith.constant 3 : i64
      %6884 = func.call @cc_make_string(%6882, %6883) : (!llvm.ptr, i64) -> i64
      %6885 = func.call @cc_nil_value() : () -> i64
      %6886 = func.call @cc_intern(%6884, %6885) : (i64, i64) -> i64
      %6887 = func.call @cc_nil_value() : () -> i64
      %6888 = func.call @cc_cons(%6886, %6887) : (i64, i64) -> i64
      %6889 = func.call @cc_values_pack(%6888) : (i64) -> i64
      func.call @stack_push_pointer(%6886) : (i64) -> ()
      %6890 = llvm.mlir.addressof @str681 : !llvm.ptr
      %6891 = arith.constant 19 : i64
      %6892 = func.call @cc_make_string(%6890, %6891) : (!llvm.ptr, i64) -> i64
      %6893 = llvm.mlir.addressof @str682 : !llvm.ptr
      %6894 = arith.constant 11 : i64
      %6895 = func.call @cc_make_string(%6893, %6894) : (!llvm.ptr, i64) -> i64
      %6896 = func.call @cc_intern(%6892, %6895) : (i64, i64) -> i64
      %6897 = func.call @cc_nil_value() : () -> i64
      %6898 = func.call @cc_cons(%6896, %6897) : (i64, i64) -> i64
      %6899 = func.call @cc_values_pack(%6898) : (i64) -> i64
      func.call @stack_push_pointer(%6896) : (i64) -> ()
      %6900 = llvm.mlir.addressof @str683 : !llvm.ptr
      %6901 = arith.constant 2 : i64
      %6902 = func.call @cc_make_string(%6900, %6901) : (!llvm.ptr, i64) -> i64
      %6903 = llvm.mlir.addressof @str684 : !llvm.ptr
      %6904 = arith.constant 11 : i64
      %6905 = func.call @cc_make_string(%6903, %6904) : (!llvm.ptr, i64) -> i64
      %6906 = func.call @cc_intern(%6902, %6905) : (i64, i64) -> i64
      %6907 = func.call @cc_nil_value() : () -> i64
      %6908 = func.call @cc_cons(%6906, %6907) : (i64, i64) -> i64
      %6909 = func.call @cc_values_pack(%6908) : (i64) -> i64
      func.call @stack_push_pointer(%6906) : (i64) -> ()
      %6910 = llvm.mlir.addressof @str685 : !llvm.ptr
      %6911 = arith.constant 2 : i64
      %6912 = func.call @cc_make_string(%6910, %6911) : (!llvm.ptr, i64) -> i64
      %6913 = llvm.mlir.addressof @str686 : !llvm.ptr
      %6914 = arith.constant 11 : i64
      %6915 = func.call @cc_make_string(%6913, %6914) : (!llvm.ptr, i64) -> i64
      %6916 = func.call @cc_intern(%6912, %6915) : (i64, i64) -> i64
      %6917 = func.call @cc_nil_value() : () -> i64
      %6918 = func.call @cc_cons(%6916, %6917) : (i64, i64) -> i64
      %6919 = func.call @cc_values_pack(%6918) : (i64) -> i64
      func.call @stack_push_pointer(%6916) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6920 = func.call @stack_pop_pointer() : () -> i64
      %6921 = func.call @stack_pop_pointer() : () -> i64
      %6922 = func.call @cc_cons(%6921, %6920) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %6923 = arith.addi %6922, %__rlasp_stack_elide_zero_331 : i64
      %6924 = func.call @stack_pop_pointer() : () -> i64
      %6925 = func.call @cc_cons(%6924, %6923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6925) : (i64) -> ()
      %6926 = llvm.mlir.addressof @str687 : !llvm.ptr
      %6927 = arith.constant 8 : i64
      %6928 = func.call @cc_make_string(%6926, %6927) : (!llvm.ptr, i64) -> i64
      %6929 = llvm.mlir.addressof @str688 : !llvm.ptr
      %6930 = arith.constant 11 : i64
      %6931 = func.call @cc_make_string(%6929, %6930) : (!llvm.ptr, i64) -> i64
      %6932 = func.call @cc_intern(%6928, %6931) : (i64, i64) -> i64
      %6933 = func.call @cc_nil_value() : () -> i64
      %6934 = func.call @cc_cons(%6932, %6933) : (i64, i64) -> i64
      %6935 = func.call @cc_values_pack(%6934) : (i64) -> i64
      func.call @stack_push_pointer(%6932) : (i64) -> ()
      %6936 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6936) : (i64) -> ()
      %6937 = llvm.mlir.addressof @str689 : !llvm.ptr
      %6938 = arith.constant 10 : i64
      %6939 = func.call @cc_make_string(%6937, %6938) : (!llvm.ptr, i64) -> i64
      %6940 = llvm.mlir.addressof @str690 : !llvm.ptr
      %6941 = arith.constant 11 : i64
      %6942 = func.call @cc_make_string(%6940, %6941) : (!llvm.ptr, i64) -> i64
      %6943 = func.call @cc_intern(%6939, %6942) : (i64, i64) -> i64
      %6944 = func.call @cc_nil_value() : () -> i64
      %6945 = func.call @cc_cons(%6943, %6944) : (i64, i64) -> i64
      %6946 = func.call @cc_values_pack(%6945) : (i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %6947 = arith.addi %6943, %__rlasp_stack_elide_zero_332 : i64
      %6948 = func.call @stack_pop_pointer() : () -> i64
      %6949 = func.call @cc_cons(%6947, %6948) : (i64, i64) -> i64
      %6950 = llvm.mlir.addressof @str691 : !llvm.ptr
      %6951 = arith.constant 5 : i64
      %6952 = func.call @cc_make_string(%6950, %6951) : (!llvm.ptr, i64) -> i64
      %6953 = func.call @cc_nil_value() : () -> i64
      %6954 = func.call @cc_intern(%6952, %6953) : (i64, i64) -> i64
      %6955 = func.call @cc_nil_value() : () -> i64
      %6956 = func.call @cc_cons(%6954, %6955) : (i64, i64) -> i64
      %6957 = func.call @cc_values_pack(%6956) : (i64) -> i64
      %6958 = func.call @cc_cons(%6954, %6949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6958) : (i64) -> ()
      %6959 = llvm.mlir.addressof @str692 : !llvm.ptr
      %6960 = arith.constant 10 : i64
      %6961 = func.call @cc_make_string(%6959, %6960) : (!llvm.ptr, i64) -> i64
      %6962 = llvm.mlir.addressof @str693 : !llvm.ptr
      %6963 = arith.constant 11 : i64
      %6964 = func.call @cc_make_string(%6962, %6963) : (!llvm.ptr, i64) -> i64
      %6965 = func.call @cc_intern(%6961, %6964) : (i64, i64) -> i64
      %6966 = func.call @cc_nil_value() : () -> i64
      %6967 = func.call @cc_cons(%6965, %6966) : (i64, i64) -> i64
      %6968 = func.call @cc_values_pack(%6967) : (i64) -> i64
      func.call @stack_push_pointer(%6965) : (i64) -> ()
      %6969 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6969) : (i64) -> ()
      %6970 = llvm.mlir.addressof @str694 : !llvm.ptr
      %6971 = arith.constant 10 : i64
      %6972 = func.call @cc_make_string(%6970, %6971) : (!llvm.ptr, i64) -> i64
      %6973 = llvm.mlir.addressof @str695 : !llvm.ptr
      %6974 = arith.constant 11 : i64
      %6975 = func.call @cc_make_string(%6973, %6974) : (!llvm.ptr, i64) -> i64
      %6976 = func.call @cc_intern(%6972, %6975) : (i64, i64) -> i64
      %6977 = func.call @cc_nil_value() : () -> i64
      %6978 = func.call @cc_cons(%6976, %6977) : (i64, i64) -> i64
      %6979 = func.call @cc_values_pack(%6978) : (i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %6980 = arith.addi %6976, %__rlasp_stack_elide_zero_333 : i64
      %6981 = func.call @stack_pop_pointer() : () -> i64
      %6982 = func.call @cc_cons(%6980, %6981) : (i64, i64) -> i64
      %6983 = llvm.mlir.addressof @str696 : !llvm.ptr
      %6984 = arith.constant 5 : i64
      %6985 = func.call @cc_make_string(%6983, %6984) : (!llvm.ptr, i64) -> i64
      %6986 = func.call @cc_nil_value() : () -> i64
      %6987 = func.call @cc_intern(%6985, %6986) : (i64, i64) -> i64
      %6988 = func.call @cc_nil_value() : () -> i64
      %6989 = func.call @cc_cons(%6987, %6988) : (i64, i64) -> i64
      %6990 = func.call @cc_values_pack(%6989) : (i64) -> i64
      %6991 = func.call @cc_cons(%6987, %6982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6992 = func.call @stack_pop_pointer() : () -> i64
      %6993 = func.call @stack_pop_pointer() : () -> i64
      %6994 = func.call @cc_cons(%6993, %6992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %6995 = arith.addi %6994, %__rlasp_stack_elide_zero_334 : i64
      %6996 = func.call @stack_pop_pointer() : () -> i64
      %6997 = func.call @cc_cons(%6996, %6995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6998 = func.call @stack_pop_pointer() : () -> i64
      %6999 = func.call @stack_pop_pointer() : () -> i64
      %7000 = func.call @cc_cons(%6999, %6998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %7001 = arith.addi %7000, %__rlasp_stack_elide_zero_335 : i64
      %7002 = func.call @stack_pop_pointer() : () -> i64
      %7003 = func.call @cc_cons(%7002, %7001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %7004 = arith.addi %7003, %__rlasp_stack_elide_zero_336 : i64
      %7005 = func.call @stack_pop_pointer() : () -> i64
      %7006 = func.call @cc_cons(%7005, %7004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7006) : (i64) -> ()
      %7007 = llvm.mlir.addressof @str697 : !llvm.ptr
      %7008 = arith.constant 3 : i64
      %7009 = func.call @cc_make_string(%7007, %7008) : (!llvm.ptr, i64) -> i64
      %7010 = llvm.mlir.addressof @str698 : !llvm.ptr
      %7011 = arith.constant 11 : i64
      %7012 = func.call @cc_make_string(%7010, %7011) : (!llvm.ptr, i64) -> i64
      %7013 = func.call @cc_intern(%7009, %7012) : (i64, i64) -> i64
      %7014 = func.call @cc_nil_value() : () -> i64
      %7015 = func.call @cc_cons(%7013, %7014) : (i64, i64) -> i64
      %7016 = func.call @cc_values_pack(%7015) : (i64) -> i64
      func.call @stack_push_pointer(%7013) : (i64) -> ()
      %7017 = llvm.mlir.addressof @str699 : !llvm.ptr
      %7018 = arith.constant 2 : i64
      %7019 = func.call @cc_make_string(%7017, %7018) : (!llvm.ptr, i64) -> i64
      %7020 = llvm.mlir.addressof @str700 : !llvm.ptr
      %7021 = arith.constant 11 : i64
      %7022 = func.call @cc_make_string(%7020, %7021) : (!llvm.ptr, i64) -> i64
      %7023 = func.call @cc_intern(%7019, %7022) : (i64, i64) -> i64
      %7024 = func.call @cc_nil_value() : () -> i64
      %7025 = func.call @cc_cons(%7023, %7024) : (i64, i64) -> i64
      %7026 = func.call @cc_values_pack(%7025) : (i64) -> i64
      func.call @stack_push_pointer(%7023) : (i64) -> ()
      %7027 = llvm.mlir.addressof @str701 : !llvm.ptr
      %7028 = arith.constant 2 : i64
      %7029 = func.call @cc_make_string(%7027, %7028) : (!llvm.ptr, i64) -> i64
      %7030 = llvm.mlir.addressof @str702 : !llvm.ptr
      %7031 = arith.constant 11 : i64
      %7032 = func.call @cc_make_string(%7030, %7031) : (!llvm.ptr, i64) -> i64
      %7033 = func.call @cc_intern(%7029, %7032) : (i64, i64) -> i64
      %7034 = func.call @cc_nil_value() : () -> i64
      %7035 = func.call @cc_cons(%7033, %7034) : (i64, i64) -> i64
      %7036 = func.call @cc_values_pack(%7035) : (i64) -> i64
      func.call @stack_push_pointer(%7033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7037 = func.call @stack_pop_pointer() : () -> i64
      %7038 = func.call @stack_pop_pointer() : () -> i64
      %7039 = func.call @cc_cons(%7038, %7037) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %7040 = arith.addi %7039, %__rlasp_stack_elide_zero_337 : i64
      %7041 = func.call @stack_pop_pointer() : () -> i64
      %7042 = func.call @cc_cons(%7041, %7040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %7043 = arith.addi %7042, %__rlasp_stack_elide_zero_338 : i64
      %7044 = func.call @stack_pop_pointer() : () -> i64
      %7045 = func.call @cc_cons(%7044, %7043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7046 = func.call @stack_pop_pointer() : () -> i64
      %7047 = func.call @stack_pop_pointer() : () -> i64
      %7048 = func.call @cc_cons(%7047, %7046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %7049 = arith.addi %7048, %__rlasp_stack_elide_zero_339 : i64
      %7050 = func.call @stack_pop_pointer() : () -> i64
      %7051 = func.call @cc_cons(%7050, %7049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %7052 = arith.addi %7051, %__rlasp_stack_elide_zero_340 : i64
      %7053 = func.call @stack_pop_pointer() : () -> i64
      %7054 = func.call @cc_cons(%7053, %7052) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %7055 = arith.addi %7054, %__rlasp_stack_elide_zero_341 : i64
      %7056 = func.call @stack_pop_pointer() : () -> i64
      %7057 = func.call @cc_cons(%7056, %7055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7058 = func.call @stack_pop_pointer() : () -> i64
      %7059 = func.call @stack_pop_pointer() : () -> i64
      %7060 = func.call @cc_cons(%7059, %7058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %7061 = arith.addi %7060, %__rlasp_stack_elide_zero_342 : i64
      %7062 = func.call @stack_pop_pointer() : () -> i64
      %7063 = func.call @cc_cons(%7062, %7061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7063) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7064 = func.call @stack_pop_pointer() : () -> i64
      %7065 = func.call @stack_pop_pointer() : () -> i64
      %7066 = func.call @cc_cons(%7065, %7064) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %7067 = arith.addi %7066, %__rlasp_stack_elide_zero_343 : i64
      %7068 = func.call @stack_pop_pointer() : () -> i64
      %7069 = func.call @cc_cons(%7068, %7067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %7070 = arith.addi %7069, %__rlasp_stack_elide_zero_344 : i64
      %7133 = arith.constant 206494159077403 : i64
      %7134 = arith.constant 0 : i64
      %7135 = func.call @cc_make_closure(%7133, %7134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %7136 = arith.addi %7135, %__rlasp_stack_elide_zero_345 : i64
      %7137 = llvm.mlir.addressof @str708 : !llvm.ptr
      %7138 = arith.constant 1 : i64
      %7139 = func.call @cc_make_string(%7137, %7138) : (!llvm.ptr, i64) -> i64
      %7140 = func.call @cc_nil_value() : () -> i64
      %7141 = func.call @cc_intern(%7139, %7140) : (i64, i64) -> i64
      %7142 = func.call @cc_nil_value() : () -> i64
      %7143 = func.call @cc_cons(%7141, %7142) : (i64, i64) -> i64
      %7144 = func.call @cc_values_pack(%7143) : (i64) -> i64
      func.call @stack_push_pointer(%7141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7145 = func.call @stack_pop_pointer() : () -> i64
      %7146 = func.call @stack_pop_pointer() : () -> i64
      %7147 = func.call @cc_cons(%7146, %7145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %7148 = arith.addi %7147, %__rlasp_stack_elide_zero_346 : i64
      %7149 = llvm.mlir.addressof @str709 : !llvm.ptr
      %7150 = arith.constant 11 : i64
      %7151 = func.call @cc_make_string(%7149, %7150) : (!llvm.ptr, i64) -> i64
      %7152 = llvm.mlir.addressof @str710 : !llvm.ptr
      %7153 = arith.constant 7 : i64
      %7154 = func.call @cc_make_string(%7152, %7153) : (!llvm.ptr, i64) -> i64
      %7155 = func.call @cc_intern(%7151, %7154) : (i64, i64) -> i64
      %7156 = func.call @cc_nil_value() : () -> i64
      %7157 = func.call @cc_cons(%7155, %7156) : (i64, i64) -> i64
      %7158 = func.call @cc_values_pack(%7157) : (i64) -> i64
      %7159 = func.call @cc_nil_value() : () -> i64
      %7160 = llvm.mlir.addressof @str711 : !llvm.ptr
      %7161 = arith.constant 4 : i64
      %7162 = func.call @cc_make_string(%7160, %7161) : (!llvm.ptr, i64) -> i64
      %7163 = llvm.mlir.addressof @str712 : !llvm.ptr
      %7164 = arith.constant 7 : i64
      %7165 = func.call @cc_make_string(%7163, %7164) : (!llvm.ptr, i64) -> i64
      %7166 = func.call @cc_intern(%7162, %7165) : (i64, i64) -> i64
      %7167 = func.call @cc_nil_value() : () -> i64
      %7168 = func.call @cc_cons(%7166, %7167) : (i64, i64) -> i64
      %7169 = func.call @cc_values_pack(%7168) : (i64) -> i64
      %7170 = llvm.mlir.addressof @str713 : !llvm.ptr
      %7171 = arith.constant 6 : i64
      %7172 = func.call @cc_make_string(%7170, %7171) : (!llvm.ptr, i64) -> i64
      %7173 = func.call @cc_nil_value() : () -> i64
      %7174 = func.call @cc_intern(%7172, %7173) : (i64, i64) -> i64
      %7175 = func.call @cc_nil_value() : () -> i64
      %7176 = func.call @cc_cons(%7174, %7175) : (i64, i64) -> i64
      %7177 = func.call @cc_values_pack(%7176) : (i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %7178 = arith.addi %7174, %__rlasp_stack_elide_zero_347 : i64
      %7179 = func.call @cc_nil_value() : () -> i64
      %7180 = func.call @cc_errorp(%6873) : (i64) -> i64
      %7181 = arith.cmpi ne, %7180, %7179 : i64
      %7182 = arith.cmpi eq, %7179, %7179 : i64
      %7183 = arith.andi %7181, %7182 : i1
      %7184 = scf.if %7183 -> (i64) {
        scf.yield %6873 : i64
      } else {
        scf.yield %7179 : i64
      }
      %7185 = func.call @cc_errorp(%7070) : (i64) -> i64
      %7186 = arith.cmpi ne, %7185, %7179 : i64
      %7187 = arith.cmpi eq, %7184, %7179 : i64
      %7188 = arith.andi %7186, %7187 : i1
      %7189 = scf.if %7188 -> (i64) {
        scf.yield %7070 : i64
      } else {
        scf.yield %7184 : i64
      }
      %7190 = func.call @cc_errorp(%7136) : (i64) -> i64
      %7191 = arith.cmpi ne, %7190, %7179 : i64
      %7192 = arith.cmpi eq, %7189, %7179 : i64
      %7193 = arith.andi %7191, %7192 : i1
      %7194 = scf.if %7193 -> (i64) {
        scf.yield %7136 : i64
      } else {
        scf.yield %7189 : i64
      }
      %7195 = func.call @cc_errorp(%7148) : (i64) -> i64
      %7196 = arith.cmpi ne, %7195, %7179 : i64
      %7197 = arith.cmpi eq, %7194, %7179 : i64
      %7198 = arith.andi %7196, %7197 : i1
      %7199 = scf.if %7198 -> (i64) {
        scf.yield %7148 : i64
      } else {
        scf.yield %7194 : i64
      }
      %7200 = func.call @cc_errorp(%7155) : (i64) -> i64
      %7201 = arith.cmpi ne, %7200, %7179 : i64
      %7202 = arith.cmpi eq, %7199, %7179 : i64
      %7203 = arith.andi %7201, %7202 : i1
      %7204 = scf.if %7203 -> (i64) {
        scf.yield %7155 : i64
      } else {
        scf.yield %7199 : i64
      }
      %7205 = func.call @cc_errorp(%7159) : (i64) -> i64
      %7206 = arith.cmpi ne, %7205, %7179 : i64
      %7207 = arith.cmpi eq, %7204, %7179 : i64
      %7208 = arith.andi %7206, %7207 : i1
      %7209 = scf.if %7208 -> (i64) {
        scf.yield %7159 : i64
      } else {
        scf.yield %7204 : i64
      }
      %7210 = func.call @cc_errorp(%7166) : (i64) -> i64
      %7211 = arith.cmpi ne, %7210, %7179 : i64
      %7212 = arith.cmpi eq, %7209, %7179 : i64
      %7213 = arith.andi %7211, %7212 : i1
      %7214 = scf.if %7213 -> (i64) {
        scf.yield %7166 : i64
      } else {
        scf.yield %7209 : i64
      }
      %7215 = func.call @cc_errorp(%7178) : (i64) -> i64
      %7216 = arith.cmpi ne, %7215, %7179 : i64
      %7217 = arith.cmpi eq, %7214, %7179 : i64
      %7218 = arith.andi %7216, %7217 : i1
      %7219 = scf.if %7218 -> (i64) {
        scf.yield %7178 : i64
      } else {
        scf.yield %7214 : i64
      }
      %7220 = arith.cmpi ne, %7219, %7179 : i64
      scf.if %7220 {
        func.call @stack_push_pointer(%7219) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6873) : (i64) -> ()
        func.call @stack_push_pointer(%7070) : (i64) -> ()
        func.call @stack_push_pointer(%7136) : (i64) -> ()
        func.call @stack_push_pointer(%7148) : (i64) -> ()
        func.call @stack_push_pointer(%7155) : (i64) -> ()
        func.call @stack_push_pointer(%7159) : (i64) -> ()
        func.call @stack_push_pointer(%7166) : (i64) -> ()
        func.call @stack_push_pointer(%7178) : (i64) -> ()
        %7221 = llvm.mlir.addressof @str714 : !llvm.ptr
        %7222 = func.call @cc_make_function_ref_const(%7221) : (!llvm.ptr) -> i64
        %7223 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7222, %7223) : (i64, i64) -> ()
      }
      %7224 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7224 : i64
    }
    %7225 = func.call @cc_nil_value() : () -> i64
    %7226 = func.call @cc_errorp(%6864) : (i64) -> i64
    %7227 = arith.cmpi ne, %7226, %7225 : i64
    %7228 = scf.if %7227 -> (i64) {
      scf.yield %6864 : i64
    } else {
      %7229 = llvm.mlir.addressof @str715 : !llvm.ptr
      %7230 = arith.constant 18 : i64
      %7231 = func.call @cc_make_string(%7229, %7230) : (!llvm.ptr, i64) -> i64
      %7232 = func.call @cc_nil_value() : () -> i64
      %7233 = func.call @cc_intern(%7231, %7232) : (i64, i64) -> i64
      %7234 = func.call @cc_nil_value() : () -> i64
      %7235 = func.call @cc_cons(%7233, %7234) : (i64, i64) -> i64
      %7236 = func.call @cc_values_pack(%7235) : (i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %7237 = arith.addi %7233, %__rlasp_stack_elide_zero_348 : i64
      %7238 = llvm.mlir.addressof @str716 : !llvm.ptr
      %7239 = arith.constant 3 : i64
      %7240 = func.call @cc_make_string(%7238, %7239) : (!llvm.ptr, i64) -> i64
      %7241 = func.call @cc_nil_value() : () -> i64
      %7242 = func.call @cc_intern(%7240, %7241) : (i64, i64) -> i64
      %7243 = func.call @cc_nil_value() : () -> i64
      %7244 = func.call @cc_cons(%7242, %7243) : (i64, i64) -> i64
      %7245 = func.call @cc_values_pack(%7244) : (i64) -> i64
      func.call @stack_push_pointer(%7242) : (i64) -> ()
      %7246 = llvm.mlir.addressof @str717 : !llvm.ptr
      %7247 = arith.constant 3 : i64
      %7248 = func.call @cc_make_string(%7246, %7247) : (!llvm.ptr, i64) -> i64
      %7249 = func.call @cc_nil_value() : () -> i64
      %7250 = func.call @cc_intern(%7248, %7249) : (i64, i64) -> i64
      %7251 = func.call @cc_nil_value() : () -> i64
      %7252 = func.call @cc_cons(%7250, %7251) : (i64, i64) -> i64
      %7253 = func.call @cc_values_pack(%7252) : (i64) -> i64
      func.call @stack_push_pointer(%7250) : (i64) -> ()
      %7254 = llvm.mlir.addressof @str718 : !llvm.ptr
      %7255 = arith.constant 19 : i64
      %7256 = func.call @cc_make_string(%7254, %7255) : (!llvm.ptr, i64) -> i64
      %7257 = llvm.mlir.addressof @str719 : !llvm.ptr
      %7258 = arith.constant 11 : i64
      %7259 = func.call @cc_make_string(%7257, %7258) : (!llvm.ptr, i64) -> i64
      %7260 = func.call @cc_intern(%7256, %7259) : (i64, i64) -> i64
      %7261 = func.call @cc_nil_value() : () -> i64
      %7262 = func.call @cc_cons(%7260, %7261) : (i64, i64) -> i64
      %7263 = func.call @cc_values_pack(%7262) : (i64) -> i64
      func.call @stack_push_pointer(%7260) : (i64) -> ()
      %7264 = llvm.mlir.addressof @str720 : !llvm.ptr
      %7265 = arith.constant 2 : i64
      %7266 = func.call @cc_make_string(%7264, %7265) : (!llvm.ptr, i64) -> i64
      %7267 = llvm.mlir.addressof @str721 : !llvm.ptr
      %7268 = arith.constant 11 : i64
      %7269 = func.call @cc_make_string(%7267, %7268) : (!llvm.ptr, i64) -> i64
      %7270 = func.call @cc_intern(%7266, %7269) : (i64, i64) -> i64
      %7271 = func.call @cc_nil_value() : () -> i64
      %7272 = func.call @cc_cons(%7270, %7271) : (i64, i64) -> i64
      %7273 = func.call @cc_values_pack(%7272) : (i64) -> i64
      func.call @stack_push_pointer(%7270) : (i64) -> ()
      %7274 = llvm.mlir.addressof @str722 : !llvm.ptr
      %7275 = arith.constant 2 : i64
      %7276 = func.call @cc_make_string(%7274, %7275) : (!llvm.ptr, i64) -> i64
      %7277 = llvm.mlir.addressof @str723 : !llvm.ptr
      %7278 = arith.constant 11 : i64
      %7279 = func.call @cc_make_string(%7277, %7278) : (!llvm.ptr, i64) -> i64
      %7280 = func.call @cc_intern(%7276, %7279) : (i64, i64) -> i64
      %7281 = func.call @cc_nil_value() : () -> i64
      %7282 = func.call @cc_cons(%7280, %7281) : (i64, i64) -> i64
      %7283 = func.call @cc_values_pack(%7282) : (i64) -> i64
      func.call @stack_push_pointer(%7280) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7284 = func.call @stack_pop_pointer() : () -> i64
      %7285 = func.call @stack_pop_pointer() : () -> i64
      %7286 = func.call @cc_cons(%7285, %7284) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %7287 = arith.addi %7286, %__rlasp_stack_elide_zero_349 : i64
      %7288 = func.call @stack_pop_pointer() : () -> i64
      %7289 = func.call @cc_cons(%7288, %7287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7289) : (i64) -> ()
      %7290 = llvm.mlir.addressof @str724 : !llvm.ptr
      %7291 = arith.constant 8 : i64
      %7292 = func.call @cc_make_string(%7290, %7291) : (!llvm.ptr, i64) -> i64
      %7293 = llvm.mlir.addressof @str725 : !llvm.ptr
      %7294 = arith.constant 11 : i64
      %7295 = func.call @cc_make_string(%7293, %7294) : (!llvm.ptr, i64) -> i64
      %7296 = func.call @cc_intern(%7292, %7295) : (i64, i64) -> i64
      %7297 = func.call @cc_nil_value() : () -> i64
      %7298 = func.call @cc_cons(%7296, %7297) : (i64, i64) -> i64
      %7299 = func.call @cc_values_pack(%7298) : (i64) -> i64
      func.call @stack_push_pointer(%7296) : (i64) -> ()
      %7300 = llvm.mlir.addressof @str726 : !llvm.ptr
      %7301 = arith.constant 10 : i64
      %7302 = func.call @cc_make_string(%7300, %7301) : (!llvm.ptr, i64) -> i64
      %7303 = llvm.mlir.addressof @str727 : !llvm.ptr
      %7304 = arith.constant 11 : i64
      %7305 = func.call @cc_make_string(%7303, %7304) : (!llvm.ptr, i64) -> i64
      %7306 = func.call @cc_intern(%7302, %7305) : (i64, i64) -> i64
      %7307 = func.call @cc_nil_value() : () -> i64
      %7308 = func.call @cc_cons(%7306, %7307) : (i64, i64) -> i64
      %7309 = func.call @cc_values_pack(%7308) : (i64) -> i64
      func.call @stack_push_pointer(%7306) : (i64) -> ()
      %7310 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7310) : (i64) -> ()
      %7311 = llvm.mlir.addressof @str728 : !llvm.ptr
      %7312 = arith.constant 10 : i64
      %7313 = func.call @cc_make_string(%7311, %7312) : (!llvm.ptr, i64) -> i64
      %7314 = llvm.mlir.addressof @str729 : !llvm.ptr
      %7315 = arith.constant 11 : i64
      %7316 = func.call @cc_make_string(%7314, %7315) : (!llvm.ptr, i64) -> i64
      %7317 = func.call @cc_intern(%7313, %7316) : (i64, i64) -> i64
      %7318 = func.call @cc_nil_value() : () -> i64
      %7319 = func.call @cc_cons(%7317, %7318) : (i64, i64) -> i64
      %7320 = func.call @cc_values_pack(%7319) : (i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %7321 = arith.addi %7317, %__rlasp_stack_elide_zero_350 : i64
      %7322 = func.call @stack_pop_pointer() : () -> i64
      %7323 = func.call @cc_cons(%7321, %7322) : (i64, i64) -> i64
      %7324 = llvm.mlir.addressof @str730 : !llvm.ptr
      %7325 = arith.constant 5 : i64
      %7326 = func.call @cc_make_string(%7324, %7325) : (!llvm.ptr, i64) -> i64
      %7327 = func.call @cc_nil_value() : () -> i64
      %7328 = func.call @cc_intern(%7326, %7327) : (i64, i64) -> i64
      %7329 = func.call @cc_nil_value() : () -> i64
      %7330 = func.call @cc_cons(%7328, %7329) : (i64, i64) -> i64
      %7331 = func.call @cc_values_pack(%7330) : (i64) -> i64
      %7332 = func.call @cc_cons(%7328, %7323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7333 = func.call @stack_pop_pointer() : () -> i64
      %7334 = func.call @stack_pop_pointer() : () -> i64
      %7335 = func.call @cc_cons(%7334, %7333) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %7336 = arith.addi %7335, %__rlasp_stack_elide_zero_351 : i64
      %7337 = func.call @stack_pop_pointer() : () -> i64
      %7338 = func.call @cc_cons(%7337, %7336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7338) : (i64) -> ()
      %7339 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7339) : (i64) -> ()
      %7340 = llvm.mlir.addressof @str731 : !llvm.ptr
      %7341 = arith.constant 10 : i64
      %7342 = func.call @cc_make_string(%7340, %7341) : (!llvm.ptr, i64) -> i64
      %7343 = llvm.mlir.addressof @str732 : !llvm.ptr
      %7344 = arith.constant 11 : i64
      %7345 = func.call @cc_make_string(%7343, %7344) : (!llvm.ptr, i64) -> i64
      %7346 = func.call @cc_intern(%7342, %7345) : (i64, i64) -> i64
      %7347 = func.call @cc_nil_value() : () -> i64
      %7348 = func.call @cc_cons(%7346, %7347) : (i64, i64) -> i64
      %7349 = func.call @cc_values_pack(%7348) : (i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %7350 = arith.addi %7346, %__rlasp_stack_elide_zero_352 : i64
      %7351 = func.call @stack_pop_pointer() : () -> i64
      %7352 = func.call @cc_cons(%7350, %7351) : (i64, i64) -> i64
      %7353 = llvm.mlir.addressof @str733 : !llvm.ptr
      %7354 = arith.constant 5 : i64
      %7355 = func.call @cc_make_string(%7353, %7354) : (!llvm.ptr, i64) -> i64
      %7356 = func.call @cc_nil_value() : () -> i64
      %7357 = func.call @cc_intern(%7355, %7356) : (i64, i64) -> i64
      %7358 = func.call @cc_nil_value() : () -> i64
      %7359 = func.call @cc_cons(%7357, %7358) : (i64, i64) -> i64
      %7360 = func.call @cc_values_pack(%7359) : (i64) -> i64
      %7361 = func.call @cc_cons(%7357, %7352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7361) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7362 = func.call @stack_pop_pointer() : () -> i64
      %7363 = func.call @stack_pop_pointer() : () -> i64
      %7364 = func.call @cc_cons(%7363, %7362) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %7365 = arith.addi %7364, %__rlasp_stack_elide_zero_353 : i64
      %7366 = func.call @stack_pop_pointer() : () -> i64
      %7367 = func.call @cc_cons(%7366, %7365) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %7368 = arith.addi %7367, %__rlasp_stack_elide_zero_354 : i64
      %7369 = func.call @stack_pop_pointer() : () -> i64
      %7370 = func.call @cc_cons(%7369, %7368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7370) : (i64) -> ()
      %7371 = llvm.mlir.addressof @str734 : !llvm.ptr
      %7372 = arith.constant 3 : i64
      %7373 = func.call @cc_make_string(%7371, %7372) : (!llvm.ptr, i64) -> i64
      %7374 = llvm.mlir.addressof @str735 : !llvm.ptr
      %7375 = arith.constant 11 : i64
      %7376 = func.call @cc_make_string(%7374, %7375) : (!llvm.ptr, i64) -> i64
      %7377 = func.call @cc_intern(%7373, %7376) : (i64, i64) -> i64
      %7378 = func.call @cc_nil_value() : () -> i64
      %7379 = func.call @cc_cons(%7377, %7378) : (i64, i64) -> i64
      %7380 = func.call @cc_values_pack(%7379) : (i64) -> i64
      func.call @stack_push_pointer(%7377) : (i64) -> ()
      %7381 = llvm.mlir.addressof @str736 : !llvm.ptr
      %7382 = arith.constant 2 : i64
      %7383 = func.call @cc_make_string(%7381, %7382) : (!llvm.ptr, i64) -> i64
      %7384 = llvm.mlir.addressof @str737 : !llvm.ptr
      %7385 = arith.constant 11 : i64
      %7386 = func.call @cc_make_string(%7384, %7385) : (!llvm.ptr, i64) -> i64
      %7387 = func.call @cc_intern(%7383, %7386) : (i64, i64) -> i64
      %7388 = func.call @cc_nil_value() : () -> i64
      %7389 = func.call @cc_cons(%7387, %7388) : (i64, i64) -> i64
      %7390 = func.call @cc_values_pack(%7389) : (i64) -> i64
      func.call @stack_push_pointer(%7387) : (i64) -> ()
      %7391 = llvm.mlir.addressof @str738 : !llvm.ptr
      %7392 = arith.constant 2 : i64
      %7393 = func.call @cc_make_string(%7391, %7392) : (!llvm.ptr, i64) -> i64
      %7394 = llvm.mlir.addressof @str739 : !llvm.ptr
      %7395 = arith.constant 11 : i64
      %7396 = func.call @cc_make_string(%7394, %7395) : (!llvm.ptr, i64) -> i64
      %7397 = func.call @cc_intern(%7393, %7396) : (i64, i64) -> i64
      %7398 = func.call @cc_nil_value() : () -> i64
      %7399 = func.call @cc_cons(%7397, %7398) : (i64, i64) -> i64
      %7400 = func.call @cc_values_pack(%7399) : (i64) -> i64
      func.call @stack_push_pointer(%7397) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7401 = func.call @stack_pop_pointer() : () -> i64
      %7402 = func.call @stack_pop_pointer() : () -> i64
      %7403 = func.call @cc_cons(%7402, %7401) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %7404 = arith.addi %7403, %__rlasp_stack_elide_zero_355 : i64
      %7405 = func.call @stack_pop_pointer() : () -> i64
      %7406 = func.call @cc_cons(%7405, %7404) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %7407 = arith.addi %7406, %__rlasp_stack_elide_zero_356 : i64
      %7408 = func.call @stack_pop_pointer() : () -> i64
      %7409 = func.call @cc_cons(%7408, %7407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7410 = func.call @stack_pop_pointer() : () -> i64
      %7411 = func.call @stack_pop_pointer() : () -> i64
      %7412 = func.call @cc_cons(%7411, %7410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %7413 = arith.addi %7412, %__rlasp_stack_elide_zero_357 : i64
      %7414 = func.call @stack_pop_pointer() : () -> i64
      %7415 = func.call @cc_cons(%7414, %7413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %7416 = arith.addi %7415, %__rlasp_stack_elide_zero_358 : i64
      %7417 = func.call @stack_pop_pointer() : () -> i64
      %7418 = func.call @cc_cons(%7417, %7416) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %7419 = arith.addi %7418, %__rlasp_stack_elide_zero_359 : i64
      %7420 = func.call @stack_pop_pointer() : () -> i64
      %7421 = func.call @cc_cons(%7420, %7419) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7421) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7422 = func.call @stack_pop_pointer() : () -> i64
      %7423 = func.call @stack_pop_pointer() : () -> i64
      %7424 = func.call @cc_cons(%7423, %7422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %7425 = arith.addi %7424, %__rlasp_stack_elide_zero_360 : i64
      %7426 = func.call @stack_pop_pointer() : () -> i64
      %7427 = func.call @cc_cons(%7426, %7425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7428 = func.call @stack_pop_pointer() : () -> i64
      %7429 = func.call @stack_pop_pointer() : () -> i64
      %7430 = func.call @cc_cons(%7429, %7428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %7431 = arith.addi %7430, %__rlasp_stack_elide_zero_361 : i64
      %7432 = func.call @stack_pop_pointer() : () -> i64
      %7433 = func.call @cc_cons(%7432, %7431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %7434 = arith.addi %7433, %__rlasp_stack_elide_zero_362 : i64
      %7497 = arith.constant 206494159077404 : i64
      %7498 = arith.constant 0 : i64
      %7499 = func.call @cc_make_closure(%7497, %7498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %7500 = arith.addi %7499, %__rlasp_stack_elide_zero_363 : i64
      %7501 = llvm.mlir.addressof @str745 : !llvm.ptr
      %7502 = arith.constant 1 : i64
      %7503 = func.call @cc_make_string(%7501, %7502) : (!llvm.ptr, i64) -> i64
      %7504 = func.call @cc_nil_value() : () -> i64
      %7505 = func.call @cc_intern(%7503, %7504) : (i64, i64) -> i64
      %7506 = func.call @cc_nil_value() : () -> i64
      %7507 = func.call @cc_cons(%7505, %7506) : (i64, i64) -> i64
      %7508 = func.call @cc_values_pack(%7507) : (i64) -> i64
      func.call @stack_push_pointer(%7505) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7509 = func.call @stack_pop_pointer() : () -> i64
      %7510 = func.call @stack_pop_pointer() : () -> i64
      %7511 = func.call @cc_cons(%7510, %7509) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %7512 = arith.addi %7511, %__rlasp_stack_elide_zero_364 : i64
      %7513 = llvm.mlir.addressof @str746 : !llvm.ptr
      %7514 = arith.constant 11 : i64
      %7515 = func.call @cc_make_string(%7513, %7514) : (!llvm.ptr, i64) -> i64
      %7516 = llvm.mlir.addressof @str747 : !llvm.ptr
      %7517 = arith.constant 7 : i64
      %7518 = func.call @cc_make_string(%7516, %7517) : (!llvm.ptr, i64) -> i64
      %7519 = func.call @cc_intern(%7515, %7518) : (i64, i64) -> i64
      %7520 = func.call @cc_nil_value() : () -> i64
      %7521 = func.call @cc_cons(%7519, %7520) : (i64, i64) -> i64
      %7522 = func.call @cc_values_pack(%7521) : (i64) -> i64
      %7523 = func.call @cc_nil_value() : () -> i64
      %7524 = llvm.mlir.addressof @str748 : !llvm.ptr
      %7525 = arith.constant 4 : i64
      %7526 = func.call @cc_make_string(%7524, %7525) : (!llvm.ptr, i64) -> i64
      %7527 = llvm.mlir.addressof @str749 : !llvm.ptr
      %7528 = arith.constant 7 : i64
      %7529 = func.call @cc_make_string(%7527, %7528) : (!llvm.ptr, i64) -> i64
      %7530 = func.call @cc_intern(%7526, %7529) : (i64, i64) -> i64
      %7531 = func.call @cc_nil_value() : () -> i64
      %7532 = func.call @cc_cons(%7530, %7531) : (i64, i64) -> i64
      %7533 = func.call @cc_values_pack(%7532) : (i64) -> i64
      %7534 = llvm.mlir.addressof @str750 : !llvm.ptr
      %7535 = arith.constant 6 : i64
      %7536 = func.call @cc_make_string(%7534, %7535) : (!llvm.ptr, i64) -> i64
      %7537 = func.call @cc_nil_value() : () -> i64
      %7538 = func.call @cc_intern(%7536, %7537) : (i64, i64) -> i64
      %7539 = func.call @cc_nil_value() : () -> i64
      %7540 = func.call @cc_cons(%7538, %7539) : (i64, i64) -> i64
      %7541 = func.call @cc_values_pack(%7540) : (i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %7542 = arith.addi %7538, %__rlasp_stack_elide_zero_365 : i64
      %7543 = func.call @cc_nil_value() : () -> i64
      %7544 = func.call @cc_errorp(%7237) : (i64) -> i64
      %7545 = arith.cmpi ne, %7544, %7543 : i64
      %7546 = arith.cmpi eq, %7543, %7543 : i64
      %7547 = arith.andi %7545, %7546 : i1
      %7548 = scf.if %7547 -> (i64) {
        scf.yield %7237 : i64
      } else {
        scf.yield %7543 : i64
      }
      %7549 = func.call @cc_errorp(%7434) : (i64) -> i64
      %7550 = arith.cmpi ne, %7549, %7543 : i64
      %7551 = arith.cmpi eq, %7548, %7543 : i64
      %7552 = arith.andi %7550, %7551 : i1
      %7553 = scf.if %7552 -> (i64) {
        scf.yield %7434 : i64
      } else {
        scf.yield %7548 : i64
      }
      %7554 = func.call @cc_errorp(%7500) : (i64) -> i64
      %7555 = arith.cmpi ne, %7554, %7543 : i64
      %7556 = arith.cmpi eq, %7553, %7543 : i64
      %7557 = arith.andi %7555, %7556 : i1
      %7558 = scf.if %7557 -> (i64) {
        scf.yield %7500 : i64
      } else {
        scf.yield %7553 : i64
      }
      %7559 = func.call @cc_errorp(%7512) : (i64) -> i64
      %7560 = arith.cmpi ne, %7559, %7543 : i64
      %7561 = arith.cmpi eq, %7558, %7543 : i64
      %7562 = arith.andi %7560, %7561 : i1
      %7563 = scf.if %7562 -> (i64) {
        scf.yield %7512 : i64
      } else {
        scf.yield %7558 : i64
      }
      %7564 = func.call @cc_errorp(%7519) : (i64) -> i64
      %7565 = arith.cmpi ne, %7564, %7543 : i64
      %7566 = arith.cmpi eq, %7563, %7543 : i64
      %7567 = arith.andi %7565, %7566 : i1
      %7568 = scf.if %7567 -> (i64) {
        scf.yield %7519 : i64
      } else {
        scf.yield %7563 : i64
      }
      %7569 = func.call @cc_errorp(%7523) : (i64) -> i64
      %7570 = arith.cmpi ne, %7569, %7543 : i64
      %7571 = arith.cmpi eq, %7568, %7543 : i64
      %7572 = arith.andi %7570, %7571 : i1
      %7573 = scf.if %7572 -> (i64) {
        scf.yield %7523 : i64
      } else {
        scf.yield %7568 : i64
      }
      %7574 = func.call @cc_errorp(%7530) : (i64) -> i64
      %7575 = arith.cmpi ne, %7574, %7543 : i64
      %7576 = arith.cmpi eq, %7573, %7543 : i64
      %7577 = arith.andi %7575, %7576 : i1
      %7578 = scf.if %7577 -> (i64) {
        scf.yield %7530 : i64
      } else {
        scf.yield %7573 : i64
      }
      %7579 = func.call @cc_errorp(%7542) : (i64) -> i64
      %7580 = arith.cmpi ne, %7579, %7543 : i64
      %7581 = arith.cmpi eq, %7578, %7543 : i64
      %7582 = arith.andi %7580, %7581 : i1
      %7583 = scf.if %7582 -> (i64) {
        scf.yield %7542 : i64
      } else {
        scf.yield %7578 : i64
      }
      %7584 = arith.cmpi ne, %7583, %7543 : i64
      scf.if %7584 {
        func.call @stack_push_pointer(%7583) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7237) : (i64) -> ()
        func.call @stack_push_pointer(%7434) : (i64) -> ()
        func.call @stack_push_pointer(%7500) : (i64) -> ()
        func.call @stack_push_pointer(%7512) : (i64) -> ()
        func.call @stack_push_pointer(%7519) : (i64) -> ()
        func.call @stack_push_pointer(%7523) : (i64) -> ()
        func.call @stack_push_pointer(%7530) : (i64) -> ()
        func.call @stack_push_pointer(%7542) : (i64) -> ()
        %7585 = llvm.mlir.addressof @str751 : !llvm.ptr
        %7586 = func.call @cc_make_function_ref_const(%7585) : (!llvm.ptr) -> i64
        %7587 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7586, %7587) : (i64, i64) -> ()
      }
      %7588 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7588 : i64
    }
    %7589 = func.call @cc_nil_value() : () -> i64
    %7590 = func.call @cc_errorp(%7228) : (i64) -> i64
    %7591 = arith.cmpi ne, %7590, %7589 : i64
    %7592 = scf.if %7591 -> (i64) {
      scf.yield %7228 : i64
    } else {
      %7593 = llvm.mlir.addressof @str752 : !llvm.ptr
      %7594 = arith.constant 16 : i64
      %7595 = func.call @cc_make_string(%7593, %7594) : (!llvm.ptr, i64) -> i64
      %7596 = func.call @cc_nil_value() : () -> i64
      %7597 = func.call @cc_intern(%7595, %7596) : (i64, i64) -> i64
      %7598 = func.call @cc_nil_value() : () -> i64
      %7599 = func.call @cc_cons(%7597, %7598) : (i64, i64) -> i64
      %7600 = func.call @cc_values_pack(%7599) : (i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %7601 = arith.addi %7597, %__rlasp_stack_elide_zero_366 : i64
      %7602 = llvm.mlir.addressof @str753 : !llvm.ptr
      %7603 = arith.constant 8 : i64
      %7604 = func.call @cc_make_string(%7602, %7603) : (!llvm.ptr, i64) -> i64
      %7605 = llvm.mlir.addressof @str754 : !llvm.ptr
      %7606 = arith.constant 11 : i64
      %7607 = func.call @cc_make_string(%7605, %7606) : (!llvm.ptr, i64) -> i64
      %7608 = func.call @cc_intern(%7604, %7607) : (i64, i64) -> i64
      %7609 = func.call @cc_nil_value() : () -> i64
      %7610 = func.call @cc_cons(%7608, %7609) : (i64, i64) -> i64
      %7611 = func.call @cc_values_pack(%7610) : (i64) -> i64
      func.call @stack_push_pointer(%7608) : (i64) -> ()
      %7612 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7612) : (i64) -> ()
      %7613 = llvm.mlir.addressof @str755 : !llvm.ptr
      %7614 = arith.constant 1 : i64
      %7615 = func.call @cc_make_string(%7613, %7614) : (!llvm.ptr, i64) -> i64
      %7616 = func.call @cc_nil_value() : () -> i64
      %7617 = func.call @cc_intern(%7615, %7616) : (i64, i64) -> i64
      %7618 = func.call @cc_nil_value() : () -> i64
      %7619 = func.call @cc_cons(%7617, %7618) : (i64, i64) -> i64
      %7620 = func.call @cc_values_pack(%7619) : (i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %7621 = arith.addi %7617, %__rlasp_stack_elide_zero_367 : i64
      %7622 = func.call @stack_pop_pointer() : () -> i64
      %7623 = func.call @cc_cons(%7621, %7622) : (i64, i64) -> i64
      %7624 = llvm.mlir.addressof @str756 : !llvm.ptr
      %7625 = arith.constant 5 : i64
      %7626 = func.call @cc_make_string(%7624, %7625) : (!llvm.ptr, i64) -> i64
      %7627 = func.call @cc_nil_value() : () -> i64
      %7628 = func.call @cc_intern(%7626, %7627) : (i64, i64) -> i64
      %7629 = func.call @cc_nil_value() : () -> i64
      %7630 = func.call @cc_cons(%7628, %7629) : (i64, i64) -> i64
      %7631 = func.call @cc_values_pack(%7630) : (i64) -> i64
      %7632 = func.call @cc_cons(%7628, %7623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7632) : (i64) -> ()
      %7633 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7633) : (i64) -> ()
      %7634 = llvm.mlir.addressof @str757 : !llvm.ptr
      %7635 = arith.constant 4 : i64
      %7636 = func.call @cc_make_string(%7634, %7635) : (!llvm.ptr, i64) -> i64
      %7637 = llvm.mlir.addressof @str758 : !llvm.ptr
      %7638 = arith.constant 11 : i64
      %7639 = func.call @cc_make_string(%7637, %7638) : (!llvm.ptr, i64) -> i64
      %7640 = func.call @cc_intern(%7636, %7639) : (i64, i64) -> i64
      %7641 = func.call @cc_nil_value() : () -> i64
      %7642 = func.call @cc_cons(%7640, %7641) : (i64, i64) -> i64
      %7643 = func.call @cc_values_pack(%7642) : (i64) -> i64
      func.call @stack_push_pointer(%7640) : (i64) -> ()
      %7644 = llvm.mlir.addressof @str759 : !llvm.ptr
      %7645 = arith.constant 3 : i64
      %7646 = func.call @cc_make_string(%7644, %7645) : (!llvm.ptr, i64) -> i64
      %7647 = llvm.mlir.addressof @str760 : !llvm.ptr
      %7648 = arith.constant 11 : i64
      %7649 = func.call @cc_make_string(%7647, %7648) : (!llvm.ptr, i64) -> i64
      %7650 = func.call @cc_intern(%7646, %7649) : (i64, i64) -> i64
      %7651 = func.call @cc_nil_value() : () -> i64
      %7652 = func.call @cc_cons(%7650, %7651) : (i64, i64) -> i64
      %7653 = func.call @cc_values_pack(%7652) : (i64) -> i64
      func.call @stack_push_pointer(%7650) : (i64) -> ()
      %7654 = llvm.mlir.addressof @str761 : !llvm.ptr
      %7655 = arith.constant 13 : i64
      %7656 = func.call @cc_make_string(%7654, %7655) : (!llvm.ptr, i64) -> i64
      %7657 = llvm.mlir.addressof @str762 : !llvm.ptr
      %7658 = arith.constant 11 : i64
      %7659 = func.call @cc_make_string(%7657, %7658) : (!llvm.ptr, i64) -> i64
      %7660 = func.call @cc_intern(%7656, %7659) : (i64, i64) -> i64
      %7661 = func.call @cc_nil_value() : () -> i64
      %7662 = func.call @cc_cons(%7660, %7661) : (i64, i64) -> i64
      %7663 = func.call @cc_values_pack(%7662) : (i64) -> i64
      func.call @stack_push_pointer(%7660) : (i64) -> ()
      %7664 = llvm.mlir.addressof @str763 : !llvm.ptr
      %7665 = arith.constant 6 : i64
      %7666 = func.call @cc_make_string(%7664, %7665) : (!llvm.ptr, i64) -> i64
      %7667 = llvm.mlir.addressof @str764 : !llvm.ptr
      %7668 = arith.constant 11 : i64
      %7669 = func.call @cc_make_string(%7667, %7668) : (!llvm.ptr, i64) -> i64
      %7670 = func.call @cc_intern(%7666, %7669) : (i64, i64) -> i64
      %7671 = func.call @cc_nil_value() : () -> i64
      %7672 = func.call @cc_cons(%7670, %7671) : (i64, i64) -> i64
      %7673 = func.call @cc_values_pack(%7672) : (i64) -> i64
      func.call @stack_push_pointer(%7670) : (i64) -> ()
      %7674 = arith.constant 64 : i64
      %7675 = func.call @cc_box_character(%7674) : (i64) -> i64
      func.call @stack_push_pointer(%7675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7676 = func.call @stack_pop_pointer() : () -> i64
      %7677 = func.call @stack_pop_pointer() : () -> i64
      %7678 = func.call @cc_cons(%7677, %7676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %7679 = arith.addi %7678, %__rlasp_stack_elide_zero_368 : i64
      %7680 = func.call @stack_pop_pointer() : () -> i64
      %7681 = func.call @cc_cons(%7680, %7679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7681) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7682 = func.call @stack_pop_pointer() : () -> i64
      %7683 = func.call @stack_pop_pointer() : () -> i64
      %7684 = func.call @cc_cons(%7683, %7682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
      %7685 = arith.addi %7684, %__rlasp_stack_elide_zero_369 : i64
      %7686 = func.call @stack_pop_pointer() : () -> i64
      %7687 = func.call @cc_cons(%7686, %7685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
      %7688 = arith.addi %7687, %__rlasp_stack_elide_zero_370 : i64
      %7689 = func.call @stack_pop_pointer() : () -> i64
      %7690 = func.call @cc_cons(%7689, %7688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7690) : (i64) -> ()
      %7691 = llvm.mlir.addressof @str765 : !llvm.ptr
      %7692 = arith.constant 4 : i64
      %7693 = func.call @cc_make_string(%7691, %7692) : (!llvm.ptr, i64) -> i64
      %7694 = llvm.mlir.addressof @str766 : !llvm.ptr
      %7695 = arith.constant 11 : i64
      %7696 = func.call @cc_make_string(%7694, %7695) : (!llvm.ptr, i64) -> i64
      %7697 = func.call @cc_intern(%7693, %7696) : (i64, i64) -> i64
      %7698 = func.call @cc_nil_value() : () -> i64
      %7699 = func.call @cc_cons(%7697, %7698) : (i64, i64) -> i64
      %7700 = func.call @cc_values_pack(%7699) : (i64) -> i64
      func.call @stack_push_pointer(%7697) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7701 = func.call @stack_pop_pointer() : () -> i64
      %7702 = func.call @stack_pop_pointer() : () -> i64
      %7703 = func.call @cc_cons(%7702, %7701) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
      %7704 = arith.addi %7703, %__rlasp_stack_elide_zero_371 : i64
      %7705 = func.call @stack_pop_pointer() : () -> i64
      %7706 = func.call @cc_cons(%7705, %7704) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
      %7707 = arith.addi %7706, %__rlasp_stack_elide_zero_372 : i64
      %7708 = func.call @stack_pop_pointer() : () -> i64
      %7709 = func.call @cc_cons(%7708, %7707) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
      %7710 = arith.addi %7709, %__rlasp_stack_elide_zero_373 : i64
      %7711 = func.call @stack_pop_pointer() : () -> i64
      %7712 = func.call @cc_cons(%7710, %7711) : (i64, i64) -> i64
      %7713 = llvm.mlir.addressof @str767 : !llvm.ptr
      %7714 = arith.constant 5 : i64
      %7715 = func.call @cc_make_string(%7713, %7714) : (!llvm.ptr, i64) -> i64
      %7716 = func.call @cc_nil_value() : () -> i64
      %7717 = func.call @cc_intern(%7715, %7716) : (i64, i64) -> i64
      %7718 = func.call @cc_nil_value() : () -> i64
      %7719 = func.call @cc_cons(%7717, %7718) : (i64, i64) -> i64
      %7720 = func.call @cc_values_pack(%7719) : (i64) -> i64
      %7721 = func.call @cc_cons(%7717, %7712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7722 = func.call @stack_pop_pointer() : () -> i64
      %7723 = func.call @stack_pop_pointer() : () -> i64
      %7724 = func.call @cc_cons(%7723, %7722) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
      %7725 = arith.addi %7724, %__rlasp_stack_elide_zero_374 : i64
      %7726 = func.call @stack_pop_pointer() : () -> i64
      %7727 = func.call @cc_cons(%7726, %7725) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
      %7728 = arith.addi %7727, %__rlasp_stack_elide_zero_375 : i64
      %7729 = func.call @stack_pop_pointer() : () -> i64
      %7730 = func.call @cc_cons(%7729, %7728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
      %7731 = arith.addi %7730, %__rlasp_stack_elide_zero_376 : i64
      %7825 = arith.constant 206494159077405 : i64
      %7826 = arith.constant 0 : i64
      %7827 = func.call @cc_make_closure(%7825, %7826) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
      %7828 = arith.addi %7827, %__rlasp_stack_elide_zero_377 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7829 = func.call @stack_pop_pointer() : () -> i64
      %7830 = func.call @stack_pop_pointer() : () -> i64
      %7831 = func.call @cc_cons(%7830, %7829) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
      %7832 = arith.addi %7831, %__rlasp_stack_elide_zero_378 : i64
      %7833 = func.call @stack_pop_pointer() : () -> i64
      %7834 = func.call @cc_cons(%7833, %7832) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
      %7835 = arith.addi %7834, %__rlasp_stack_elide_zero_379 : i64
      %7836 = llvm.mlir.addressof @str779 : !llvm.ptr
      %7837 = arith.constant 11 : i64
      %7838 = func.call @cc_make_string(%7836, %7837) : (!llvm.ptr, i64) -> i64
      %7839 = llvm.mlir.addressof @str780 : !llvm.ptr
      %7840 = arith.constant 7 : i64
      %7841 = func.call @cc_make_string(%7839, %7840) : (!llvm.ptr, i64) -> i64
      %7842 = func.call @cc_intern(%7838, %7841) : (i64, i64) -> i64
      %7843 = func.call @cc_nil_value() : () -> i64
      %7844 = func.call @cc_cons(%7842, %7843) : (i64, i64) -> i64
      %7845 = func.call @cc_values_pack(%7844) : (i64) -> i64
      %7846 = func.call @cc_nil_value() : () -> i64
      %7847 = llvm.mlir.addressof @str781 : !llvm.ptr
      %7848 = arith.constant 4 : i64
      %7849 = func.call @cc_make_string(%7847, %7848) : (!llvm.ptr, i64) -> i64
      %7850 = llvm.mlir.addressof @str782 : !llvm.ptr
      %7851 = arith.constant 7 : i64
      %7852 = func.call @cc_make_string(%7850, %7851) : (!llvm.ptr, i64) -> i64
      %7853 = func.call @cc_intern(%7849, %7852) : (i64, i64) -> i64
      %7854 = func.call @cc_nil_value() : () -> i64
      %7855 = func.call @cc_cons(%7853, %7854) : (i64, i64) -> i64
      %7856 = func.call @cc_values_pack(%7855) : (i64) -> i64
      %7857 = llvm.mlir.addressof @str783 : !llvm.ptr
      %7858 = arith.constant 6 : i64
      %7859 = func.call @cc_make_string(%7857, %7858) : (!llvm.ptr, i64) -> i64
      %7860 = func.call @cc_nil_value() : () -> i64
      %7861 = func.call @cc_intern(%7859, %7860) : (i64, i64) -> i64
      %7862 = func.call @cc_nil_value() : () -> i64
      %7863 = func.call @cc_cons(%7861, %7862) : (i64, i64) -> i64
      %7864 = func.call @cc_values_pack(%7863) : (i64) -> i64
      %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
      %7865 = arith.addi %7861, %__rlasp_stack_elide_zero_380 : i64
      %7866 = func.call @cc_nil_value() : () -> i64
      %7867 = func.call @cc_errorp(%7601) : (i64) -> i64
      %7868 = arith.cmpi ne, %7867, %7866 : i64
      %7869 = arith.cmpi eq, %7866, %7866 : i64
      %7870 = arith.andi %7868, %7869 : i1
      %7871 = scf.if %7870 -> (i64) {
        scf.yield %7601 : i64
      } else {
        scf.yield %7866 : i64
      }
      %7872 = func.call @cc_errorp(%7731) : (i64) -> i64
      %7873 = arith.cmpi ne, %7872, %7866 : i64
      %7874 = arith.cmpi eq, %7871, %7866 : i64
      %7875 = arith.andi %7873, %7874 : i1
      %7876 = scf.if %7875 -> (i64) {
        scf.yield %7731 : i64
      } else {
        scf.yield %7871 : i64
      }
      %7877 = func.call @cc_errorp(%7828) : (i64) -> i64
      %7878 = arith.cmpi ne, %7877, %7866 : i64
      %7879 = arith.cmpi eq, %7876, %7866 : i64
      %7880 = arith.andi %7878, %7879 : i1
      %7881 = scf.if %7880 -> (i64) {
        scf.yield %7828 : i64
      } else {
        scf.yield %7876 : i64
      }
      %7882 = func.call @cc_errorp(%7835) : (i64) -> i64
      %7883 = arith.cmpi ne, %7882, %7866 : i64
      %7884 = arith.cmpi eq, %7881, %7866 : i64
      %7885 = arith.andi %7883, %7884 : i1
      %7886 = scf.if %7885 -> (i64) {
        scf.yield %7835 : i64
      } else {
        scf.yield %7881 : i64
      }
      %7887 = func.call @cc_errorp(%7842) : (i64) -> i64
      %7888 = arith.cmpi ne, %7887, %7866 : i64
      %7889 = arith.cmpi eq, %7886, %7866 : i64
      %7890 = arith.andi %7888, %7889 : i1
      %7891 = scf.if %7890 -> (i64) {
        scf.yield %7842 : i64
      } else {
        scf.yield %7886 : i64
      }
      %7892 = func.call @cc_errorp(%7846) : (i64) -> i64
      %7893 = arith.cmpi ne, %7892, %7866 : i64
      %7894 = arith.cmpi eq, %7891, %7866 : i64
      %7895 = arith.andi %7893, %7894 : i1
      %7896 = scf.if %7895 -> (i64) {
        scf.yield %7846 : i64
      } else {
        scf.yield %7891 : i64
      }
      %7897 = func.call @cc_errorp(%7853) : (i64) -> i64
      %7898 = arith.cmpi ne, %7897, %7866 : i64
      %7899 = arith.cmpi eq, %7896, %7866 : i64
      %7900 = arith.andi %7898, %7899 : i1
      %7901 = scf.if %7900 -> (i64) {
        scf.yield %7853 : i64
      } else {
        scf.yield %7896 : i64
      }
      %7902 = func.call @cc_errorp(%7865) : (i64) -> i64
      %7903 = arith.cmpi ne, %7902, %7866 : i64
      %7904 = arith.cmpi eq, %7901, %7866 : i64
      %7905 = arith.andi %7903, %7904 : i1
      %7906 = scf.if %7905 -> (i64) {
        scf.yield %7865 : i64
      } else {
        scf.yield %7901 : i64
      }
      %7907 = arith.cmpi ne, %7906, %7866 : i64
      scf.if %7907 {
        func.call @stack_push_pointer(%7906) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7601) : (i64) -> ()
        func.call @stack_push_pointer(%7731) : (i64) -> ()
        func.call @stack_push_pointer(%7828) : (i64) -> ()
        func.call @stack_push_pointer(%7835) : (i64) -> ()
        func.call @stack_push_pointer(%7842) : (i64) -> ()
        func.call @stack_push_pointer(%7846) : (i64) -> ()
        func.call @stack_push_pointer(%7853) : (i64) -> ()
        func.call @stack_push_pointer(%7865) : (i64) -> ()
        %7908 = llvm.mlir.addressof @str784 : !llvm.ptr
        %7909 = func.call @cc_make_function_ref_const(%7908) : (!llvm.ptr) -> i64
        %7910 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7909, %7910) : (i64, i64) -> ()
      }
      %7911 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7911 : i64
    }
    %7912 = func.call @cc_nil_value() : () -> i64
    %7913 = func.call @cc_errorp(%7592) : (i64) -> i64
    %7914 = arith.cmpi ne, %7913, %7912 : i64
    %7915 = scf.if %7914 -> (i64) {
      scf.yield %7592 : i64
    } else {
      %7916 = func.call @cc_nil_value() : () -> i64
      %7917 = func.call @cc_nil_value() : () -> i64
      %7918 = func.call @cc_errorp(%7916) : (i64) -> i64
      %7919 = arith.cmpi ne, %7918, %7917 : i64
      %7920 = scf.if %7919 -> (i64) {
        scf.yield %7916 : i64
      } else {
        %8202 = llvm.mlir.addressof @str807 : !llvm.ptr
        %8203 = arith.constant 31 : i64
        %8204 = func.call @cc_make_string(%8202, %8203) : (!llvm.ptr, i64) -> i64
        %8205 = llvm.mlir.addressof @str808 : !llvm.ptr
        %8206 = arith.constant 15 : i64
        %8207 = func.call @cc_make_string(%8205, %8206) : (!llvm.ptr, i64) -> i64
        %8208 = func.call @cc_nil_value() : () -> i64
        %8209 = func.call @cc_intern(%8207, %8208) : (i64, i64) -> i64
        %8210 = func.call @cc_nil_value() : () -> i64
        %8211 = func.call @cc_cons(%8209, %8210) : (i64, i64) -> i64
        %8212 = func.call @cc_values_pack(%8211) : (i64) -> i64
        %8213 = func.call @cc_register_function_lambda_list_metadata_raw(%8209, %8204) : (i64, i64) -> i64
        %8214 = llvm.mlir.addressof @str809 : !llvm.ptr
        %8215 = func.call @cc_make_function_ref_const(%8214) : (!llvm.ptr) -> i64
        %8216 = llvm.mlir.addressof @str810 : !llvm.ptr
        %8217 = arith.constant 15 : i64
        %8218 = func.call @cc_make_string(%8216, %8217) : (!llvm.ptr, i64) -> i64
        %8219 = func.call @cc_nil_value() : () -> i64
        %8220 = func.call @cc_intern(%8218, %8219) : (i64, i64) -> i64
        %8221 = func.call @cc_nil_value() : () -> i64
        %8222 = func.call @cc_cons(%8220, %8221) : (i64, i64) -> i64
        %8223 = func.call @cc_values_pack(%8222) : (i64) -> i64
        %8224 = func.call @cc_set_symbol_value(%8220, %8215) : (i64, i64) -> i64
        %8225 = llvm.mlir.addressof @str811 : !llvm.ptr
        %8226 = arith.constant 15 : i64
        %8227 = func.call @cc_make_string(%8225, %8226) : (!llvm.ptr, i64) -> i64
        %8228 = func.call @cc_nil_value() : () -> i64
        %8229 = func.call @cc_intern(%8227, %8228) : (i64, i64) -> i64
        %8230 = func.call @cc_nil_value() : () -> i64
        %8231 = func.call @cc_cons(%8229, %8230) : (i64, i64) -> i64
        %8232 = func.call @cc_values_pack(%8231) : (i64) -> i64
        %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
        %8233 = arith.addi %8229, %__rlasp_stack_elide_zero_381 : i64
        scf.yield %8233 : i64
      }
      %8234 = func.call @cc_nil_value() : () -> i64
      %8235 = func.call @cc_errorp(%7920) : (i64) -> i64
      %8236 = arith.cmpi ne, %8235, %8234 : i64
      %8237 = scf.if %8236 -> (i64) {
        scf.yield %7920 : i64
      } else {
        %8314 = llvm.mlir.addressof @str820 : !llvm.ptr
        %8315 = arith.constant 3 : i64
        %8316 = func.call @cc_make_string(%8314, %8315) : (!llvm.ptr, i64) -> i64
        %8317 = llvm.mlir.addressof @str821 : !llvm.ptr
        %8318 = arith.constant 12 : i64
        %8319 = func.call @cc_make_string(%8317, %8318) : (!llvm.ptr, i64) -> i64
        %8320 = func.call @cc_nil_value() : () -> i64
        %8321 = func.call @cc_intern(%8319, %8320) : (i64, i64) -> i64
        %8322 = func.call @cc_nil_value() : () -> i64
        %8323 = func.call @cc_cons(%8321, %8322) : (i64, i64) -> i64
        %8324 = func.call @cc_values_pack(%8323) : (i64) -> i64
        %8325 = func.call @cc_register_function_lambda_list_metadata_raw(%8321, %8316) : (i64, i64) -> i64
        %8326 = llvm.mlir.addressof @str822 : !llvm.ptr
        %8327 = func.call @cc_make_function_ref_const(%8326) : (!llvm.ptr) -> i64
        %8328 = llvm.mlir.addressof @str823 : !llvm.ptr
        %8329 = arith.constant 12 : i64
        %8330 = func.call @cc_make_string(%8328, %8329) : (!llvm.ptr, i64) -> i64
        %8331 = func.call @cc_nil_value() : () -> i64
        %8332 = func.call @cc_intern(%8330, %8331) : (i64, i64) -> i64
        %8333 = func.call @cc_nil_value() : () -> i64
        %8334 = func.call @cc_cons(%8332, %8333) : (i64, i64) -> i64
        %8335 = func.call @cc_values_pack(%8334) : (i64) -> i64
        %8336 = func.call @cc_set_symbol_value(%8332, %8327) : (i64, i64) -> i64
        %8337 = llvm.mlir.addressof @str824 : !llvm.ptr
        %8338 = arith.constant 12 : i64
        %8339 = func.call @cc_make_string(%8337, %8338) : (!llvm.ptr, i64) -> i64
        %8340 = func.call @cc_nil_value() : () -> i64
        %8341 = func.call @cc_intern(%8339, %8340) : (i64, i64) -> i64
        %8342 = func.call @cc_nil_value() : () -> i64
        %8343 = func.call @cc_cons(%8341, %8342) : (i64, i64) -> i64
        %8344 = func.call @cc_values_pack(%8343) : (i64) -> i64
        %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
        %8345 = arith.addi %8341, %__rlasp_stack_elide_zero_382 : i64
        scf.yield %8345 : i64
      }
      %8346 = func.call @cc_nil_value() : () -> i64
      %8347 = func.call @cc_errorp(%8237) : (i64) -> i64
      %8348 = arith.cmpi ne, %8347, %8346 : i64
      %8349 = scf.if %8348 -> (i64) {
        scf.yield %8237 : i64
      } else {
        %8432 = llvm.mlir.addressof @str833 : !llvm.ptr
        %8433 = arith.constant 3 : i64
        %8434 = func.call @cc_make_string(%8432, %8433) : (!llvm.ptr, i64) -> i64
        %8435 = llvm.mlir.addressof @str834 : !llvm.ptr
        %8436 = arith.constant 15 : i64
        %8437 = func.call @cc_make_string(%8435, %8436) : (!llvm.ptr, i64) -> i64
        %8438 = func.call @cc_nil_value() : () -> i64
        %8439 = func.call @cc_intern(%8437, %8438) : (i64, i64) -> i64
        %8440 = func.call @cc_nil_value() : () -> i64
        %8441 = func.call @cc_cons(%8439, %8440) : (i64, i64) -> i64
        %8442 = func.call @cc_values_pack(%8441) : (i64) -> i64
        %8443 = func.call @cc_register_function_lambda_list_metadata_raw(%8439, %8434) : (i64, i64) -> i64
        %8444 = llvm.mlir.addressof @str835 : !llvm.ptr
        %8445 = func.call @cc_make_function_ref_const(%8444) : (!llvm.ptr) -> i64
        %8446 = llvm.mlir.addressof @str836 : !llvm.ptr
        %8447 = arith.constant 15 : i64
        %8448 = func.call @cc_make_string(%8446, %8447) : (!llvm.ptr, i64) -> i64
        %8449 = func.call @cc_nil_value() : () -> i64
        %8450 = func.call @cc_intern(%8448, %8449) : (i64, i64) -> i64
        %8451 = func.call @cc_nil_value() : () -> i64
        %8452 = func.call @cc_cons(%8450, %8451) : (i64, i64) -> i64
        %8453 = func.call @cc_values_pack(%8452) : (i64) -> i64
        %8454 = func.call @cc_set_symbol_value(%8450, %8445) : (i64, i64) -> i64
        %8455 = llvm.mlir.addressof @str837 : !llvm.ptr
        %8456 = arith.constant 15 : i64
        %8457 = func.call @cc_make_string(%8455, %8456) : (!llvm.ptr, i64) -> i64
        %8458 = func.call @cc_nil_value() : () -> i64
        %8459 = func.call @cc_intern(%8457, %8458) : (i64, i64) -> i64
        %8460 = func.call @cc_nil_value() : () -> i64
        %8461 = func.call @cc_cons(%8459, %8460) : (i64, i64) -> i64
        %8462 = func.call @cc_values_pack(%8461) : (i64) -> i64
        %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
        %8463 = arith.addi %8459, %__rlasp_stack_elide_zero_383 : i64
        scf.yield %8463 : i64
      }
      %8464 = func.call @cc_nil_value() : () -> i64
      %8465 = func.call @cc_errorp(%8349) : (i64) -> i64
      %8466 = arith.cmpi ne, %8465, %8464 : i64
      %8467 = scf.if %8466 -> (i64) {
        scf.yield %8349 : i64
      } else {
        %8557 = llvm.mlir.addressof @str846 : !llvm.ptr
        %8558 = arith.constant 13 : i64
        %8559 = func.call @cc_make_string(%8557, %8558) : (!llvm.ptr, i64) -> i64
        %8560 = llvm.mlir.addressof @str847 : !llvm.ptr
        %8561 = arith.constant 22 : i64
        %8562 = func.call @cc_make_string(%8560, %8561) : (!llvm.ptr, i64) -> i64
        %8563 = func.call @cc_nil_value() : () -> i64
        %8564 = func.call @cc_intern(%8562, %8563) : (i64, i64) -> i64
        %8565 = func.call @cc_nil_value() : () -> i64
        %8566 = func.call @cc_cons(%8564, %8565) : (i64, i64) -> i64
        %8567 = func.call @cc_values_pack(%8566) : (i64) -> i64
        %8568 = func.call @cc_register_function_lambda_list_metadata_raw(%8564, %8559) : (i64, i64) -> i64
        %8569 = llvm.mlir.addressof @str848 : !llvm.ptr
        %8570 = func.call @cc_make_function_ref_const(%8569) : (!llvm.ptr) -> i64
        %8571 = llvm.mlir.addressof @str849 : !llvm.ptr
        %8572 = arith.constant 22 : i64
        %8573 = func.call @cc_make_string(%8571, %8572) : (!llvm.ptr, i64) -> i64
        %8574 = func.call @cc_nil_value() : () -> i64
        %8575 = func.call @cc_intern(%8573, %8574) : (i64, i64) -> i64
        %8576 = func.call @cc_nil_value() : () -> i64
        %8577 = func.call @cc_cons(%8575, %8576) : (i64, i64) -> i64
        %8578 = func.call @cc_values_pack(%8577) : (i64) -> i64
        %8579 = func.call @cc_set_symbol_value(%8575, %8570) : (i64, i64) -> i64
        %8580 = llvm.mlir.addressof @str850 : !llvm.ptr
        %8581 = arith.constant 22 : i64
        %8582 = func.call @cc_make_string(%8580, %8581) : (!llvm.ptr, i64) -> i64
        %8583 = func.call @cc_nil_value() : () -> i64
        %8584 = func.call @cc_intern(%8582, %8583) : (i64, i64) -> i64
        %8585 = func.call @cc_nil_value() : () -> i64
        %8586 = func.call @cc_cons(%8584, %8585) : (i64, i64) -> i64
        %8587 = func.call @cc_values_pack(%8586) : (i64) -> i64
        %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
        %8588 = arith.addi %8584, %__rlasp_stack_elide_zero_384 : i64
        scf.yield %8588 : i64
      }
      %8589 = func.call @cc_nil_value() : () -> i64
      %8590 = func.call @cc_errorp(%8467) : (i64) -> i64
      %8591 = arith.cmpi ne, %8590, %8589 : i64
      %8592 = scf.if %8591 -> (i64) {
        scf.yield %8467 : i64
      } else {
        %8675 = llvm.mlir.addressof @str859 : !llvm.ptr
        %8676 = arith.constant 3 : i64
        %8677 = func.call @cc_make_string(%8675, %8676) : (!llvm.ptr, i64) -> i64
        %8678 = llvm.mlir.addressof @str860 : !llvm.ptr
        %8679 = arith.constant 29 : i64
        %8680 = func.call @cc_make_string(%8678, %8679) : (!llvm.ptr, i64) -> i64
        %8681 = func.call @cc_nil_value() : () -> i64
        %8682 = func.call @cc_intern(%8680, %8681) : (i64, i64) -> i64
        %8683 = func.call @cc_nil_value() : () -> i64
        %8684 = func.call @cc_cons(%8682, %8683) : (i64, i64) -> i64
        %8685 = func.call @cc_values_pack(%8684) : (i64) -> i64
        %8686 = func.call @cc_register_function_lambda_list_metadata_raw(%8682, %8677) : (i64, i64) -> i64
        %8687 = llvm.mlir.addressof @str861 : !llvm.ptr
        %8688 = func.call @cc_make_function_ref_const(%8687) : (!llvm.ptr) -> i64
        %8689 = llvm.mlir.addressof @str862 : !llvm.ptr
        %8690 = arith.constant 29 : i64
        %8691 = func.call @cc_make_string(%8689, %8690) : (!llvm.ptr, i64) -> i64
        %8692 = func.call @cc_nil_value() : () -> i64
        %8693 = func.call @cc_intern(%8691, %8692) : (i64, i64) -> i64
        %8694 = func.call @cc_nil_value() : () -> i64
        %8695 = func.call @cc_cons(%8693, %8694) : (i64, i64) -> i64
        %8696 = func.call @cc_values_pack(%8695) : (i64) -> i64
        %8697 = func.call @cc_set_symbol_value(%8693, %8688) : (i64, i64) -> i64
        %8698 = llvm.mlir.addressof @str863 : !llvm.ptr
        %8699 = arith.constant 29 : i64
        %8700 = func.call @cc_make_string(%8698, %8699) : (!llvm.ptr, i64) -> i64
        %8701 = func.call @cc_nil_value() : () -> i64
        %8702 = func.call @cc_intern(%8700, %8701) : (i64, i64) -> i64
        %8703 = func.call @cc_nil_value() : () -> i64
        %8704 = func.call @cc_cons(%8702, %8703) : (i64, i64) -> i64
        %8705 = func.call @cc_values_pack(%8704) : (i64) -> i64
        %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
        %8706 = arith.addi %8702, %__rlasp_stack_elide_zero_385 : i64
        scf.yield %8706 : i64
      }
      %8707 = func.call @cc_nil_value() : () -> i64
      %8708 = func.call @cc_errorp(%8592) : (i64) -> i64
      %8709 = arith.cmpi ne, %8708, %8707 : i64
      %8710 = scf.if %8709 -> (i64) {
        scf.yield %8592 : i64
      } else {
        %8800 = llvm.mlir.addressof @str872 : !llvm.ptr
        %8801 = arith.constant 13 : i64
        %8802 = func.call @cc_make_string(%8800, %8801) : (!llvm.ptr, i64) -> i64
        %8803 = llvm.mlir.addressof @str873 : !llvm.ptr
        %8804 = arith.constant 36 : i64
        %8805 = func.call @cc_make_string(%8803, %8804) : (!llvm.ptr, i64) -> i64
        %8806 = func.call @cc_nil_value() : () -> i64
        %8807 = func.call @cc_intern(%8805, %8806) : (i64, i64) -> i64
        %8808 = func.call @cc_nil_value() : () -> i64
        %8809 = func.call @cc_cons(%8807, %8808) : (i64, i64) -> i64
        %8810 = func.call @cc_values_pack(%8809) : (i64) -> i64
        %8811 = func.call @cc_register_function_lambda_list_metadata_raw(%8807, %8802) : (i64, i64) -> i64
        %8812 = llvm.mlir.addressof @str874 : !llvm.ptr
        %8813 = func.call @cc_make_function_ref_const(%8812) : (!llvm.ptr) -> i64
        %8814 = llvm.mlir.addressof @str875 : !llvm.ptr
        %8815 = arith.constant 36 : i64
        %8816 = func.call @cc_make_string(%8814, %8815) : (!llvm.ptr, i64) -> i64
        %8817 = func.call @cc_nil_value() : () -> i64
        %8818 = func.call @cc_intern(%8816, %8817) : (i64, i64) -> i64
        %8819 = func.call @cc_nil_value() : () -> i64
        %8820 = func.call @cc_cons(%8818, %8819) : (i64, i64) -> i64
        %8821 = func.call @cc_values_pack(%8820) : (i64) -> i64
        %8822 = func.call @cc_set_symbol_value(%8818, %8813) : (i64, i64) -> i64
        %8823 = llvm.mlir.addressof @str876 : !llvm.ptr
        %8824 = arith.constant 36 : i64
        %8825 = func.call @cc_make_string(%8823, %8824) : (!llvm.ptr, i64) -> i64
        %8826 = func.call @cc_nil_value() : () -> i64
        %8827 = func.call @cc_intern(%8825, %8826) : (i64, i64) -> i64
        %8828 = func.call @cc_nil_value() : () -> i64
        %8829 = func.call @cc_cons(%8827, %8828) : (i64, i64) -> i64
        %8830 = func.call @cc_values_pack(%8829) : (i64) -> i64
        %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
        %8831 = arith.addi %8827, %__rlasp_stack_elide_zero_386 : i64
        scf.yield %8831 : i64
      }
      %8832 = func.call @cc_nil_value() : () -> i64
      %8833 = func.call @cc_errorp(%8710) : (i64) -> i64
      %8834 = arith.cmpi ne, %8833, %8832 : i64
      %8835 = scf.if %8834 -> (i64) {
        scf.yield %8710 : i64
      } else {
        %8918 = llvm.mlir.addressof @str885 : !llvm.ptr
        %8919 = arith.constant 3 : i64
        %8920 = func.call @cc_make_string(%8918, %8919) : (!llvm.ptr, i64) -> i64
        %8921 = llvm.mlir.addressof @str886 : !llvm.ptr
        %8922 = arith.constant 18 : i64
        %8923 = func.call @cc_make_string(%8921, %8922) : (!llvm.ptr, i64) -> i64
        %8924 = func.call @cc_nil_value() : () -> i64
        %8925 = func.call @cc_intern(%8923, %8924) : (i64, i64) -> i64
        %8926 = func.call @cc_nil_value() : () -> i64
        %8927 = func.call @cc_cons(%8925, %8926) : (i64, i64) -> i64
        %8928 = func.call @cc_values_pack(%8927) : (i64) -> i64
        %8929 = func.call @cc_register_function_lambda_list_metadata_raw(%8925, %8920) : (i64, i64) -> i64
        %8930 = llvm.mlir.addressof @str887 : !llvm.ptr
        %8931 = func.call @cc_make_function_ref_const(%8930) : (!llvm.ptr) -> i64
        %8932 = llvm.mlir.addressof @str888 : !llvm.ptr
        %8933 = arith.constant 18 : i64
        %8934 = func.call @cc_make_string(%8932, %8933) : (!llvm.ptr, i64) -> i64
        %8935 = func.call @cc_nil_value() : () -> i64
        %8936 = func.call @cc_intern(%8934, %8935) : (i64, i64) -> i64
        %8937 = func.call @cc_nil_value() : () -> i64
        %8938 = func.call @cc_cons(%8936, %8937) : (i64, i64) -> i64
        %8939 = func.call @cc_values_pack(%8938) : (i64) -> i64
        %8940 = func.call @cc_set_symbol_value(%8936, %8931) : (i64, i64) -> i64
        %8941 = llvm.mlir.addressof @str889 : !llvm.ptr
        %8942 = arith.constant 18 : i64
        %8943 = func.call @cc_make_string(%8941, %8942) : (!llvm.ptr, i64) -> i64
        %8944 = func.call @cc_nil_value() : () -> i64
        %8945 = func.call @cc_intern(%8943, %8944) : (i64, i64) -> i64
        %8946 = func.call @cc_nil_value() : () -> i64
        %8947 = func.call @cc_cons(%8945, %8946) : (i64, i64) -> i64
        %8948 = func.call @cc_values_pack(%8947) : (i64) -> i64
        %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
        %8949 = arith.addi %8945, %__rlasp_stack_elide_zero_387 : i64
        scf.yield %8949 : i64
      }
      %8950 = func.call @cc_nil_value() : () -> i64
      %8951 = func.call @cc_errorp(%8835) : (i64) -> i64
      %8952 = arith.cmpi ne, %8951, %8950 : i64
      %8953 = scf.if %8952 -> (i64) {
        scf.yield %8835 : i64
      } else {
        %9043 = llvm.mlir.addressof @str898 : !llvm.ptr
        %9044 = arith.constant 13 : i64
        %9045 = func.call @cc_make_string(%9043, %9044) : (!llvm.ptr, i64) -> i64
        %9046 = llvm.mlir.addressof @str899 : !llvm.ptr
        %9047 = arith.constant 25 : i64
        %9048 = func.call @cc_make_string(%9046, %9047) : (!llvm.ptr, i64) -> i64
        %9049 = func.call @cc_nil_value() : () -> i64
        %9050 = func.call @cc_intern(%9048, %9049) : (i64, i64) -> i64
        %9051 = func.call @cc_nil_value() : () -> i64
        %9052 = func.call @cc_cons(%9050, %9051) : (i64, i64) -> i64
        %9053 = func.call @cc_values_pack(%9052) : (i64) -> i64
        %9054 = func.call @cc_register_function_lambda_list_metadata_raw(%9050, %9045) : (i64, i64) -> i64
        %9055 = llvm.mlir.addressof @str900 : !llvm.ptr
        %9056 = func.call @cc_make_function_ref_const(%9055) : (!llvm.ptr) -> i64
        %9057 = llvm.mlir.addressof @str901 : !llvm.ptr
        %9058 = arith.constant 25 : i64
        %9059 = func.call @cc_make_string(%9057, %9058) : (!llvm.ptr, i64) -> i64
        %9060 = func.call @cc_nil_value() : () -> i64
        %9061 = func.call @cc_intern(%9059, %9060) : (i64, i64) -> i64
        %9062 = func.call @cc_nil_value() : () -> i64
        %9063 = func.call @cc_cons(%9061, %9062) : (i64, i64) -> i64
        %9064 = func.call @cc_values_pack(%9063) : (i64) -> i64
        %9065 = func.call @cc_set_symbol_value(%9061, %9056) : (i64, i64) -> i64
        %9066 = llvm.mlir.addressof @str902 : !llvm.ptr
        %9067 = arith.constant 25 : i64
        %9068 = func.call @cc_make_string(%9066, %9067) : (!llvm.ptr, i64) -> i64
        %9069 = func.call @cc_nil_value() : () -> i64
        %9070 = func.call @cc_intern(%9068, %9069) : (i64, i64) -> i64
        %9071 = func.call @cc_nil_value() : () -> i64
        %9072 = func.call @cc_cons(%9070, %9071) : (i64, i64) -> i64
        %9073 = func.call @cc_values_pack(%9072) : (i64) -> i64
        %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
        %9074 = arith.addi %9070, %__rlasp_stack_elide_zero_388 : i64
        scf.yield %9074 : i64
      }
      %9075 = func.call @cc_nil_value() : () -> i64
      %9076 = func.call @cc_errorp(%8953) : (i64) -> i64
      %9077 = arith.cmpi ne, %9076, %9075 : i64
      %9078 = scf.if %9077 -> (i64) {
        scf.yield %8953 : i64
      } else {
        %9079 = llvm.mlir.addressof @str903 : !llvm.ptr
        %9080 = arith.constant 10 : i64
        %9081 = func.call @cc_make_string(%9079, %9080) : (!llvm.ptr, i64) -> i64
        %9082 = func.call @cc_nil_value() : () -> i64
        %9083 = func.call @cc_intern(%9081, %9082) : (i64, i64) -> i64
        %9084 = func.call @cc_nil_value() : () -> i64
        %9085 = func.call @cc_cons(%9083, %9084) : (i64, i64) -> i64
        %9086 = func.call @cc_values_pack(%9085) : (i64) -> i64
        %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
        %9087 = arith.addi %9083, %__rlasp_stack_elide_zero_389 : i64
        %9088 = llvm.mlir.addressof @str904 : !llvm.ptr
        %9089 = arith.constant 4 : i64
        %9090 = func.call @cc_make_string(%9088, %9089) : (!llvm.ptr, i64) -> i64
        %9091 = func.call @cc_nil_value() : () -> i64
        %9092 = func.call @cc_intern(%9090, %9091) : (i64, i64) -> i64
        %9093 = func.call @cc_nil_value() : () -> i64
        %9094 = func.call @cc_cons(%9092, %9093) : (i64, i64) -> i64
        %9095 = func.call @cc_values_pack(%9094) : (i64) -> i64
        %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
        %9096 = arith.addi %9092, %__rlasp_stack_elide_zero_390 : i64
        %9097 = llvm.mlir.addressof @str905 : !llvm.ptr
        %9098 = arith.constant 18 : i64
        %9099 = func.call @cc_make_string(%9097, %9098) : (!llvm.ptr, i64) -> i64
        %9100 = func.call @cc_nil_value() : () -> i64
        %9101 = func.call @cc_intern(%9099, %9100) : (i64, i64) -> i64
        %9102 = func.call @cc_nil_value() : () -> i64
        %9103 = func.call @cc_cons(%9101, %9102) : (i64, i64) -> i64
        %9104 = func.call @cc_values_pack(%9103) : (i64) -> i64
        %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
        %9105 = arith.addi %9101, %__rlasp_stack_elide_zero_391 : i64
        %9106 = llvm.mlir.addressof @str906 : !llvm.ptr
        %9107 = arith.constant 7 : i64
        %9108 = func.call @cc_make_string(%9106, %9107) : (!llvm.ptr, i64) -> i64
        %9109 = func.call @cc_nil_value() : () -> i64
        %9110 = func.call @cc_intern(%9108, %9109) : (i64, i64) -> i64
        %9111 = func.call @cc_nil_value() : () -> i64
        %9112 = func.call @cc_cons(%9110, %9111) : (i64, i64) -> i64
        %9113 = func.call @cc_values_pack(%9112) : (i64) -> i64
        %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
        %9114 = arith.addi %9110, %__rlasp_stack_elide_zero_392 : i64
        %9115 = func.call @cc_nil_value() : () -> i64
        %9116 = func.call @cc_errorp(%9096) : (i64) -> i64
        %9117 = arith.cmpi ne, %9116, %9115 : i64
        %9118 = arith.cmpi eq, %9115, %9115 : i64
        %9119 = arith.andi %9117, %9118 : i1
        %9120 = scf.if %9119 -> (i64) {
          scf.yield %9096 : i64
        } else {
          scf.yield %9115 : i64
        }
        %9121 = func.call @cc_errorp(%9105) : (i64) -> i64
        %9122 = arith.cmpi ne, %9121, %9115 : i64
        %9123 = arith.cmpi eq, %9120, %9115 : i64
        %9124 = arith.andi %9122, %9123 : i1
        %9125 = scf.if %9124 -> (i64) {
          scf.yield %9105 : i64
        } else {
          scf.yield %9120 : i64
        }
        %9126 = func.call @cc_errorp(%9114) : (i64) -> i64
        %9127 = arith.cmpi ne, %9126, %9115 : i64
        %9128 = arith.cmpi eq, %9125, %9115 : i64
        %9129 = arith.andi %9127, %9128 : i1
        %9130 = scf.if %9129 -> (i64) {
          scf.yield %9114 : i64
        } else {
          scf.yield %9125 : i64
        }
        %9131 = arith.cmpi ne, %9130, %9115 : i64
        scf.if %9131 {
          func.call @stack_push_pointer(%9130) : (i64) -> ()
        } else {
          %9132 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9132) : (i64) -> ()
          %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
          %9133 = arith.addi %9114, %__rlasp_stack_elide_zero_393 : i64
          %9134 = func.call @stack_pop_pointer() : () -> i64
          %9135 = func.call @cc_cons(%9133, %9134) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9135) : (i64) -> ()
          %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
          %9136 = arith.addi %9105, %__rlasp_stack_elide_zero_394 : i64
          %9137 = func.call @stack_pop_pointer() : () -> i64
          %9138 = func.call @cc_cons(%9136, %9137) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9138) : (i64) -> ()
          %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
          %9139 = arith.addi %9096, %__rlasp_stack_elide_zero_395 : i64
          %9140 = func.call @stack_pop_pointer() : () -> i64
          %9141 = func.call @cc_cons(%9139, %9140) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9141) : (i64) -> ()
        }
        %9142 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9143 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9144 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9145 = func.call @stack_pop_pointer() : () -> i64
        %9146 = func.call @cc_nil_value() : () -> i64
        %9147 = func.call @cc_errorp(%9143) : (i64) -> i64
        %9148 = arith.cmpi ne, %9147, %9146 : i64
        %9149 = arith.cmpi eq, %9146, %9146 : i64
        %9150 = arith.andi %9148, %9149 : i1
        %9151 = scf.if %9150 -> (i64) {
          scf.yield %9143 : i64
        } else {
          scf.yield %9146 : i64
        }
        %9152 = func.call @cc_errorp(%9144) : (i64) -> i64
        %9153 = arith.cmpi ne, %9152, %9146 : i64
        %9154 = arith.cmpi eq, %9151, %9146 : i64
        %9155 = arith.andi %9153, %9154 : i1
        %9156 = scf.if %9155 -> (i64) {
          scf.yield %9144 : i64
        } else {
          scf.yield %9151 : i64
        }
        %9157 = func.call @cc_errorp(%9145) : (i64) -> i64
        %9158 = arith.cmpi ne, %9157, %9146 : i64
        %9159 = arith.cmpi eq, %9156, %9146 : i64
        %9160 = arith.andi %9158, %9159 : i1
        %9161 = scf.if %9160 -> (i64) {
          scf.yield %9145 : i64
        } else {
          scf.yield %9156 : i64
        }
        %9162 = arith.cmpi ne, %9161, %9146 : i64
        scf.if %9162 {
          func.call @stack_push_pointer(%9161) : (i64) -> ()
        } else {
          %9163 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9163) : (i64) -> ()
          %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
          %9164 = arith.addi %9145, %__rlasp_stack_elide_zero_396 : i64
          %9165 = func.call @stack_pop_pointer() : () -> i64
          %9166 = func.call @cc_cons(%9164, %9165) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9166) : (i64) -> ()
          %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
          %9167 = arith.addi %9144, %__rlasp_stack_elide_zero_397 : i64
          %9168 = func.call @stack_pop_pointer() : () -> i64
          %9169 = func.call @cc_cons(%9167, %9168) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9169) : (i64) -> ()
          %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
          %9170 = arith.addi %9143, %__rlasp_stack_elide_zero_398 : i64
          %9171 = func.call @stack_pop_pointer() : () -> i64
          %9172 = func.call @cc_cons(%9170, %9171) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9172) : (i64) -> ()
        }
        %9173 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9174 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9175 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9176 = func.call @stack_pop_pointer() : () -> i64
        %9177 = func.call @cc_nil_value() : () -> i64
        %9178 = func.call @cc_errorp(%9174) : (i64) -> i64
        %9179 = arith.cmpi ne, %9178, %9177 : i64
        %9180 = arith.cmpi eq, %9177, %9177 : i64
        %9181 = arith.andi %9179, %9180 : i1
        %9182 = scf.if %9181 -> (i64) {
          scf.yield %9174 : i64
        } else {
          scf.yield %9177 : i64
        }
        %9183 = func.call @cc_errorp(%9175) : (i64) -> i64
        %9184 = arith.cmpi ne, %9183, %9177 : i64
        %9185 = arith.cmpi eq, %9182, %9177 : i64
        %9186 = arith.andi %9184, %9185 : i1
        %9187 = scf.if %9186 -> (i64) {
          scf.yield %9175 : i64
        } else {
          scf.yield %9182 : i64
        }
        %9188 = func.call @cc_errorp(%9176) : (i64) -> i64
        %9189 = arith.cmpi ne, %9188, %9177 : i64
        %9190 = arith.cmpi eq, %9187, %9177 : i64
        %9191 = arith.andi %9189, %9190 : i1
        %9192 = scf.if %9191 -> (i64) {
          scf.yield %9176 : i64
        } else {
          scf.yield %9187 : i64
        }
        %9193 = arith.cmpi ne, %9192, %9177 : i64
        scf.if %9193 {
          func.call @stack_push_pointer(%9192) : (i64) -> ()
        } else {
          %9194 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9194) : (i64) -> ()
          %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
          %9195 = arith.addi %9176, %__rlasp_stack_elide_zero_399 : i64
          %9196 = func.call @stack_pop_pointer() : () -> i64
          %9197 = func.call @cc_cons(%9195, %9196) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9197) : (i64) -> ()
          %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
          %9198 = arith.addi %9175, %__rlasp_stack_elide_zero_400 : i64
          %9199 = func.call @stack_pop_pointer() : () -> i64
          %9200 = func.call @cc_cons(%9198, %9199) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9200) : (i64) -> ()
          %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
          %9201 = arith.addi %9174, %__rlasp_stack_elide_zero_401 : i64
          %9202 = func.call @stack_pop_pointer() : () -> i64
          %9203 = func.call @cc_cons(%9201, %9202) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9203) : (i64) -> ()
        }
        %9204 = func.call @stack_pop_pointer() : () -> i64
        %9205 = llvm.mlir.addressof @str907 : !llvm.ptr
        %9206 = arith.constant 15 : i64
        %9207 = func.call @cc_make_string(%9205, %9206) : (!llvm.ptr, i64) -> i64
        %9208 = func.call @cc_nil_value() : () -> i64
        %9209 = func.call @cc_intern(%9207, %9208) : (i64, i64) -> i64
        %9210 = func.call @cc_nil_value() : () -> i64
        %9211 = func.call @cc_cons(%9209, %9210) : (i64, i64) -> i64
        %9212 = func.call @cc_values_pack(%9211) : (i64) -> i64
        %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
        %9213 = arith.addi %9209, %__rlasp_stack_elide_zero_402 : i64
        %9214 = func.call @cc_nil_value() : () -> i64
        %9215 = func.call @cc_errorp(%9213) : (i64) -> i64
        %9216 = arith.cmpi ne, %9215, %9214 : i64
        %9217 = arith.cmpi eq, %9214, %9214 : i64
        %9218 = arith.andi %9216, %9217 : i1
        %9219 = scf.if %9218 -> (i64) {
          scf.yield %9213 : i64
        } else {
          scf.yield %9214 : i64
        }
        %9220 = arith.cmpi ne, %9219, %9214 : i64
        scf.if %9220 {
          func.call @stack_push_pointer(%9219) : (i64) -> ()
        } else {
          %9221 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9221) : (i64) -> ()
          %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
          %9222 = arith.addi %9213, %__rlasp_stack_elide_zero_403 : i64
          %9223 = func.call @stack_pop_pointer() : () -> i64
          %9224 = func.call @cc_cons(%9222, %9223) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9224) : (i64) -> ()
        }
        %9225 = func.call @stack_pop_pointer() : () -> i64
        %9226 = llvm.mlir.addressof @str908 : !llvm.ptr
        %9227 = arith.constant 29 : i64
        %9228 = func.call @cc_make_string(%9226, %9227) : (!llvm.ptr, i64) -> i64
        %9229 = func.call @cc_nil_value() : () -> i64
        %9230 = func.call @cc_intern(%9228, %9229) : (i64, i64) -> i64
        %9231 = func.call @cc_nil_value() : () -> i64
        %9232 = func.call @cc_cons(%9230, %9231) : (i64, i64) -> i64
        %9233 = func.call @cc_values_pack(%9232) : (i64) -> i64
        %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
        %9234 = arith.addi %9230, %__rlasp_stack_elide_zero_404 : i64
        %9235 = func.call @cc_nil_value() : () -> i64
        %9236 = func.call @cc_errorp(%9234) : (i64) -> i64
        %9237 = arith.cmpi ne, %9236, %9235 : i64
        %9238 = arith.cmpi eq, %9235, %9235 : i64
        %9239 = arith.andi %9237, %9238 : i1
        %9240 = scf.if %9239 -> (i64) {
          scf.yield %9234 : i64
        } else {
          scf.yield %9235 : i64
        }
        %9241 = arith.cmpi ne, %9240, %9235 : i64
        scf.if %9241 {
          func.call @stack_push_pointer(%9240) : (i64) -> ()
        } else {
          %9242 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9242) : (i64) -> ()
          %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
          %9243 = arith.addi %9234, %__rlasp_stack_elide_zero_405 : i64
          %9244 = func.call @stack_pop_pointer() : () -> i64
          %9245 = func.call @cc_cons(%9243, %9244) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9245) : (i64) -> ()
        }
        %9246 = func.call @stack_pop_pointer() : () -> i64
        %9247 = llvm.mlir.addressof @str909 : !llvm.ptr
        %9248 = arith.constant 18 : i64
        %9249 = func.call @cc_make_string(%9247, %9248) : (!llvm.ptr, i64) -> i64
        %9250 = func.call @cc_nil_value() : () -> i64
        %9251 = func.call @cc_intern(%9249, %9250) : (i64, i64) -> i64
        %9252 = func.call @cc_nil_value() : () -> i64
        %9253 = func.call @cc_cons(%9251, %9252) : (i64, i64) -> i64
        %9254 = func.call @cc_values_pack(%9253) : (i64) -> i64
        %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
        %9255 = arith.addi %9251, %__rlasp_stack_elide_zero_406 : i64
        %9256 = func.call @cc_nil_value() : () -> i64
        %9257 = func.call @cc_errorp(%9255) : (i64) -> i64
        %9258 = arith.cmpi ne, %9257, %9256 : i64
        %9259 = arith.cmpi eq, %9256, %9256 : i64
        %9260 = arith.andi %9258, %9259 : i1
        %9261 = scf.if %9260 -> (i64) {
          scf.yield %9255 : i64
        } else {
          scf.yield %9256 : i64
        }
        %9262 = arith.cmpi ne, %9261, %9256 : i64
        scf.if %9262 {
          func.call @stack_push_pointer(%9261) : (i64) -> ()
        } else {
          %9263 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9263) : (i64) -> ()
          %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
          %9264 = arith.addi %9255, %__rlasp_stack_elide_zero_407 : i64
          %9265 = func.call @stack_pop_pointer() : () -> i64
          %9266 = func.call @cc_cons(%9264, %9265) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9266) : (i64) -> ()
        }
        %9267 = func.call @stack_pop_pointer() : () -> i64
        %9268 = func.call @cc_nil_value() : () -> i64
        %9269 = func.call @cc_errorp(%9225) : (i64) -> i64
        %9270 = arith.cmpi ne, %9269, %9268 : i64
        %9271 = arith.cmpi eq, %9268, %9268 : i64
        %9272 = arith.andi %9270, %9271 : i1
        %9273 = scf.if %9272 -> (i64) {
          scf.yield %9225 : i64
        } else {
          scf.yield %9268 : i64
        }
        %9274 = func.call @cc_errorp(%9246) : (i64) -> i64
        %9275 = arith.cmpi ne, %9274, %9268 : i64
        %9276 = arith.cmpi eq, %9273, %9268 : i64
        %9277 = arith.andi %9275, %9276 : i1
        %9278 = scf.if %9277 -> (i64) {
          scf.yield %9246 : i64
        } else {
          scf.yield %9273 : i64
        }
        %9279 = func.call @cc_errorp(%9267) : (i64) -> i64
        %9280 = arith.cmpi ne, %9279, %9268 : i64
        %9281 = arith.cmpi eq, %9278, %9268 : i64
        %9282 = arith.andi %9280, %9281 : i1
        %9283 = scf.if %9282 -> (i64) {
          scf.yield %9267 : i64
        } else {
          scf.yield %9278 : i64
        }
        %9284 = arith.cmpi ne, %9283, %9268 : i64
        scf.if %9284 {
          func.call @stack_push_pointer(%9283) : (i64) -> ()
        } else {
          %9285 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9285) : (i64) -> ()
          %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
          %9286 = arith.addi %9267, %__rlasp_stack_elide_zero_408 : i64
          %9287 = func.call @stack_pop_pointer() : () -> i64
          %9288 = func.call @cc_cons(%9286, %9287) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9288) : (i64) -> ()
          %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
          %9289 = arith.addi %9246, %__rlasp_stack_elide_zero_409 : i64
          %9290 = func.call @stack_pop_pointer() : () -> i64
          %9291 = func.call @cc_cons(%9289, %9290) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9291) : (i64) -> ()
          %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
          %9292 = arith.addi %9225, %__rlasp_stack_elide_zero_410 : i64
          %9293 = func.call @stack_pop_pointer() : () -> i64
          %9294 = func.call @cc_cons(%9292, %9293) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9294) : (i64) -> ()
        }
        %9295 = func.call @stack_pop_pointer() : () -> i64
        %9296 = llvm.mlir.addressof @str910 : !llvm.ptr
        %9297 = arith.constant 10 : i64
        %9298 = func.call @cc_make_string(%9296, %9297) : (!llvm.ptr, i64) -> i64
        %9299 = func.call @cc_nil_value() : () -> i64
        %9300 = func.call @cc_intern(%9298, %9299) : (i64, i64) -> i64
        %9301 = func.call @cc_nil_value() : () -> i64
        %9302 = func.call @cc_cons(%9300, %9301) : (i64, i64) -> i64
        %9303 = func.call @cc_values_pack(%9302) : (i64) -> i64
        %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
        %9304 = arith.addi %9300, %__rlasp_stack_elide_zero_411 : i64
        %9305 = llvm.mlir.addressof @str911 : !llvm.ptr
        %9306 = arith.constant 10 : i64
        %9307 = func.call @cc_make_string(%9305, %9306) : (!llvm.ptr, i64) -> i64
        %9308 = func.call @cc_nil_value() : () -> i64
        %9309 = func.call @cc_intern(%9307, %9308) : (i64, i64) -> i64
        %9310 = func.call @cc_nil_value() : () -> i64
        %9311 = func.call @cc_cons(%9309, %9310) : (i64, i64) -> i64
        %9312 = func.call @cc_values_pack(%9311) : (i64) -> i64
        %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
        %9313 = arith.addi %9309, %__rlasp_stack_elide_zero_412 : i64
        %9314 = llvm.mlir.addressof @str912 : !llvm.ptr
        %9315 = arith.constant 16 : i64
        %9316 = func.call @cc_make_string(%9314, %9315) : (!llvm.ptr, i64) -> i64
        %9317 = func.call @cc_nil_value() : () -> i64
        %9318 = func.call @cc_intern(%9316, %9317) : (i64, i64) -> i64
        %9319 = func.call @cc_nil_value() : () -> i64
        %9320 = func.call @cc_cons(%9318, %9319) : (i64, i64) -> i64
        %9321 = func.call @cc_values_pack(%9320) : (i64) -> i64
        %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
        %9322 = arith.addi %9318, %__rlasp_stack_elide_zero_413 : i64
        %9323 = func.call @cc_nil_value() : () -> i64
        %9324 = func.call @cc_errorp(%9313) : (i64) -> i64
        %9325 = arith.cmpi ne, %9324, %9323 : i64
        %9326 = arith.cmpi eq, %9323, %9323 : i64
        %9327 = arith.andi %9325, %9326 : i1
        %9328 = scf.if %9327 -> (i64) {
          scf.yield %9313 : i64
        } else {
          scf.yield %9323 : i64
        }
        %9329 = func.call @cc_errorp(%9322) : (i64) -> i64
        %9330 = arith.cmpi ne, %9329, %9323 : i64
        %9331 = arith.cmpi eq, %9328, %9323 : i64
        %9332 = arith.andi %9330, %9331 : i1
        %9333 = scf.if %9332 -> (i64) {
          scf.yield %9322 : i64
        } else {
          scf.yield %9328 : i64
        }
        %9334 = arith.cmpi ne, %9333, %9323 : i64
        scf.if %9334 {
          func.call @stack_push_pointer(%9333) : (i64) -> ()
        } else {
          %9335 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9335) : (i64) -> ()
          %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
          %9336 = arith.addi %9322, %__rlasp_stack_elide_zero_414 : i64
          %9337 = func.call @stack_pop_pointer() : () -> i64
          %9338 = func.call @cc_cons(%9336, %9337) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9338) : (i64) -> ()
          %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
          %9339 = arith.addi %9313, %__rlasp_stack_elide_zero_415 : i64
          %9340 = func.call @stack_pop_pointer() : () -> i64
          %9341 = func.call @cc_cons(%9339, %9340) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9341) : (i64) -> ()
        }
        %9342 = func.call @stack_pop_pointer() : () -> i64
        %9343 = func.call @cc_nil_value() : () -> i64
        %9344 = func.call @cc_errorp(%9087) : (i64) -> i64
        %9345 = arith.cmpi ne, %9344, %9343 : i64
        %9346 = arith.cmpi eq, %9343, %9343 : i64
        %9347 = arith.andi %9345, %9346 : i1
        %9348 = scf.if %9347 -> (i64) {
          scf.yield %9087 : i64
        } else {
          scf.yield %9343 : i64
        }
        %9349 = func.call @cc_errorp(%9142) : (i64) -> i64
        %9350 = arith.cmpi ne, %9349, %9343 : i64
        %9351 = arith.cmpi eq, %9348, %9343 : i64
        %9352 = arith.andi %9350, %9351 : i1
        %9353 = scf.if %9352 -> (i64) {
          scf.yield %9142 : i64
        } else {
          scf.yield %9348 : i64
        }
        %9354 = func.call @cc_errorp(%9173) : (i64) -> i64
        %9355 = arith.cmpi ne, %9354, %9343 : i64
        %9356 = arith.cmpi eq, %9353, %9343 : i64
        %9357 = arith.andi %9355, %9356 : i1
        %9358 = scf.if %9357 -> (i64) {
          scf.yield %9173 : i64
        } else {
          scf.yield %9353 : i64
        }
        %9359 = func.call @cc_errorp(%9204) : (i64) -> i64
        %9360 = arith.cmpi ne, %9359, %9343 : i64
        %9361 = arith.cmpi eq, %9358, %9343 : i64
        %9362 = arith.andi %9360, %9361 : i1
        %9363 = scf.if %9362 -> (i64) {
          scf.yield %9204 : i64
        } else {
          scf.yield %9358 : i64
        }
        %9364 = func.call @cc_errorp(%9295) : (i64) -> i64
        %9365 = arith.cmpi ne, %9364, %9343 : i64
        %9366 = arith.cmpi eq, %9363, %9343 : i64
        %9367 = arith.andi %9365, %9366 : i1
        %9368 = scf.if %9367 -> (i64) {
          scf.yield %9295 : i64
        } else {
          scf.yield %9363 : i64
        }
        %9369 = func.call @cc_errorp(%9304) : (i64) -> i64
        %9370 = arith.cmpi ne, %9369, %9343 : i64
        %9371 = arith.cmpi eq, %9368, %9343 : i64
        %9372 = arith.andi %9370, %9371 : i1
        %9373 = scf.if %9372 -> (i64) {
          scf.yield %9304 : i64
        } else {
          scf.yield %9368 : i64
        }
        %9374 = func.call @cc_errorp(%9342) : (i64) -> i64
        %9375 = arith.cmpi ne, %9374, %9343 : i64
        %9376 = arith.cmpi eq, %9373, %9343 : i64
        %9377 = arith.andi %9375, %9376 : i1
        %9378 = scf.if %9377 -> (i64) {
          scf.yield %9342 : i64
        } else {
          scf.yield %9373 : i64
        }
        %9379 = arith.cmpi ne, %9378, %9343 : i64
        scf.if %9379 {
          func.call @stack_push_pointer(%9378) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%9087) : (i64) -> ()
          func.call @stack_push_pointer(%9142) : (i64) -> ()
          func.call @stack_push_pointer(%9173) : (i64) -> ()
          func.call @stack_push_pointer(%9204) : (i64) -> ()
          func.call @stack_push_pointer(%9295) : (i64) -> ()
          func.call @stack_push_pointer(%9304) : (i64) -> ()
          func.call @stack_push_pointer(%9342) : (i64) -> ()
          %9380 = llvm.mlir.addressof @str913 : !llvm.ptr
          %9381 = func.call @cc_make_function_ref_const(%9380) : (!llvm.ptr) -> i64
          %9382 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%9381, %9382) : (i64, i64) -> ()
        }
        %9383 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9383 : i64
      }
      %9384 = func.call @cc_nil_value() : () -> i64
      %9385 = func.call @cc_errorp(%9078) : (i64) -> i64
      %9386 = arith.cmpi ne, %9385, %9384 : i64
      %9387 = scf.if %9386 -> (i64) {
        scf.yield %9078 : i64
      } else {
        %9463 = llvm.mlir.addressof @str922 : !llvm.ptr
        %9464 = arith.constant 3 : i64
        %9465 = func.call @cc_make_string(%9463, %9464) : (!llvm.ptr, i64) -> i64
        %9466 = llvm.mlir.addressof @str923 : !llvm.ptr
        %9467 = arith.constant 15 : i64
        %9468 = func.call @cc_make_string(%9466, %9467) : (!llvm.ptr, i64) -> i64
        %9469 = func.call @cc_nil_value() : () -> i64
        %9470 = func.call @cc_intern(%9468, %9469) : (i64, i64) -> i64
        %9471 = func.call @cc_nil_value() : () -> i64
        %9472 = func.call @cc_cons(%9470, %9471) : (i64, i64) -> i64
        %9473 = func.call @cc_values_pack(%9472) : (i64) -> i64
        %9474 = func.call @cc_register_function_lambda_list_metadata_raw(%9470, %9465) : (i64, i64) -> i64
        %9475 = llvm.mlir.addressof @str924 : !llvm.ptr
        %9476 = func.call @cc_make_function_ref_const(%9475) : (!llvm.ptr) -> i64
        %9477 = llvm.mlir.addressof @str925 : !llvm.ptr
        %9478 = arith.constant 15 : i64
        %9479 = func.call @cc_make_string(%9477, %9478) : (!llvm.ptr, i64) -> i64
        %9480 = func.call @cc_nil_value() : () -> i64
        %9481 = func.call @cc_intern(%9479, %9480) : (i64, i64) -> i64
        %9482 = func.call @cc_nil_value() : () -> i64
        %9483 = func.call @cc_cons(%9481, %9482) : (i64, i64) -> i64
        %9484 = func.call @cc_values_pack(%9483) : (i64) -> i64
        %9485 = func.call @cc_set_symbol_value(%9481, %9476) : (i64, i64) -> i64
        %9486 = llvm.mlir.addressof @str926 : !llvm.ptr
        %9487 = arith.constant 15 : i64
        %9488 = func.call @cc_make_string(%9486, %9487) : (!llvm.ptr, i64) -> i64
        %9489 = func.call @cc_nil_value() : () -> i64
        %9490 = func.call @cc_intern(%9488, %9489) : (i64, i64) -> i64
        %9491 = func.call @cc_nil_value() : () -> i64
        %9492 = func.call @cc_cons(%9490, %9491) : (i64, i64) -> i64
        %9493 = func.call @cc_values_pack(%9492) : (i64) -> i64
        %__rlasp_stack_elide_zero_416 = arith.constant 0 : i64
        %9494 = arith.addi %9490, %__rlasp_stack_elide_zero_416 : i64
        scf.yield %9494 : i64
      }
      %9495 = func.call @cc_nil_value() : () -> i64
      %9496 = func.call @cc_errorp(%9387) : (i64) -> i64
      %9497 = arith.cmpi ne, %9496, %9495 : i64
      %9498 = scf.if %9497 -> (i64) {
        scf.yield %9387 : i64
      } else {
        %9499 = llvm.mlir.addressof @str927 : !llvm.ptr
        %9500 = arith.constant 10 : i64
        %9501 = func.call @cc_make_string(%9499, %9500) : (!llvm.ptr, i64) -> i64
        %9502 = func.call @cc_nil_value() : () -> i64
        %9503 = func.call @cc_intern(%9501, %9502) : (i64, i64) -> i64
        %9504 = func.call @cc_nil_value() : () -> i64
        %9505 = func.call @cc_cons(%9503, %9504) : (i64, i64) -> i64
        %9506 = func.call @cc_values_pack(%9505) : (i64) -> i64
        %__rlasp_stack_elide_zero_417 = arith.constant 0 : i64
        %9507 = arith.addi %9503, %__rlasp_stack_elide_zero_417 : i64
        scf.yield %9507 : i64
      }
      %__rlasp_stack_elide_zero_418 = arith.constant 0 : i64
      %9508 = arith.addi %9498, %__rlasp_stack_elide_zero_418 : i64
      scf.yield %9508 : i64
    }
    %9509 = func.call @cc_nil_value() : () -> i64
    %9510 = func.call @cc_errorp(%7915) : (i64) -> i64
    %9511 = arith.cmpi ne, %9510, %9509 : i64
    %9512 = scf.if %9511 -> (i64) {
      scf.yield %7915 : i64
    } else {
      %9513 = llvm.mlir.addressof @str928 : !llvm.ptr
      %9514 = arith.constant 9 : i64
      %9515 = func.call @cc_make_string(%9513, %9514) : (!llvm.ptr, i64) -> i64
      %9516 = func.call @cc_nil_value() : () -> i64
      %9517 = func.call @cc_intern(%9515, %9516) : (i64, i64) -> i64
      %9518 = func.call @cc_nil_value() : () -> i64
      %9519 = func.call @cc_cons(%9517, %9518) : (i64, i64) -> i64
      %9520 = func.call @cc_values_pack(%9519) : (i64) -> i64
      %__rlasp_stack_elide_zero_419 = arith.constant 0 : i64
      %9521 = arith.addi %9517, %__rlasp_stack_elide_zero_419 : i64
      %9536 = arith.constant 206494159077415 : i64
      %9537 = arith.constant 0 : i64
      %9538 = func.call @cc_make_closure(%9536, %9537) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_420 = arith.constant 0 : i64
      %9539 = arith.addi %9538, %__rlasp_stack_elide_zero_420 : i64
      %9540 = func.call @cc_nil_value() : () -> i64
      %9541 = func.call @cc_errorp(%9521) : (i64) -> i64
      %9542 = arith.cmpi ne, %9541, %9540 : i64
      %9543 = arith.cmpi eq, %9540, %9540 : i64
      %9544 = arith.andi %9542, %9543 : i1
      %9545 = scf.if %9544 -> (i64) {
        scf.yield %9521 : i64
      } else {
        scf.yield %9540 : i64
      }
      %9546 = func.call @cc_errorp(%9539) : (i64) -> i64
      %9547 = arith.cmpi ne, %9546, %9540 : i64
      %9548 = arith.cmpi eq, %9545, %9540 : i64
      %9549 = arith.andi %9547, %9548 : i1
      %9550 = scf.if %9549 -> (i64) {
        scf.yield %9539 : i64
      } else {
        scf.yield %9545 : i64
      }
      %9551 = arith.cmpi ne, %9550, %9540 : i64
      scf.if %9551 {
        func.call @stack_push_pointer(%9550) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9521) : (i64) -> ()
        func.call @stack_push_pointer(%9539) : (i64) -> ()
        %9552 = llvm.mlir.addressof @str930 : !llvm.ptr
        %9553 = func.call @cc_make_function_ref_const(%9552) : (!llvm.ptr) -> i64
        %9554 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%9553, %9554) : (i64, i64) -> ()
      }
      %9555 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9555 : i64
    }
    %9556 = func.call @cc_nil_value() : () -> i64
    %9557 = func.call @cc_errorp(%9512) : (i64) -> i64
    %9558 = arith.cmpi ne, %9557, %9556 : i64
    %9559 = scf.if %9558 -> (i64) {
      scf.yield %9512 : i64
    } else {
      %9560 = llvm.mlir.addressof @str931 : !llvm.ptr
      %9561 = arith.constant 10 : i64
      %9562 = func.call @cc_make_string(%9560, %9561) : (!llvm.ptr, i64) -> i64
      %9563 = func.call @cc_nil_value() : () -> i64
      %9564 = func.call @cc_intern(%9562, %9563) : (i64, i64) -> i64
      %9565 = func.call @cc_nil_value() : () -> i64
      %9566 = func.call @cc_cons(%9564, %9565) : (i64, i64) -> i64
      %9567 = func.call @cc_values_pack(%9566) : (i64) -> i64
      %__rlasp_stack_elide_zero_421 = arith.constant 0 : i64
      %9568 = arith.addi %9564, %__rlasp_stack_elide_zero_421 : i64
      %9569 = llvm.mlir.addressof @str932 : !llvm.ptr
      %9570 = arith.constant 3 : i64
      %9571 = func.call @cc_make_string(%9569, %9570) : (!llvm.ptr, i64) -> i64
      %9572 = func.call @cc_nil_value() : () -> i64
      %9573 = func.call @cc_intern(%9571, %9572) : (i64, i64) -> i64
      %9574 = func.call @cc_nil_value() : () -> i64
      %9575 = func.call @cc_cons(%9573, %9574) : (i64, i64) -> i64
      %9576 = func.call @cc_values_pack(%9575) : (i64) -> i64
      func.call @stack_push_pointer(%9573) : (i64) -> ()
      %9577 = llvm.mlir.addressof @str933 : !llvm.ptr
      %9578 = arith.constant 3 : i64
      %9579 = func.call @cc_make_string(%9577, %9578) : (!llvm.ptr, i64) -> i64
      %9580 = func.call @cc_nil_value() : () -> i64
      %9581 = func.call @cc_intern(%9579, %9580) : (i64, i64) -> i64
      %9582 = func.call @cc_nil_value() : () -> i64
      %9583 = func.call @cc_cons(%9581, %9582) : (i64, i64) -> i64
      %9584 = func.call @cc_values_pack(%9583) : (i64) -> i64
      func.call @stack_push_pointer(%9581) : (i64) -> ()
      %9585 = llvm.mlir.addressof @str934 : !llvm.ptr
      %9586 = arith.constant 11 : i64
      %9587 = func.call @cc_make_string(%9585, %9586) : (!llvm.ptr, i64) -> i64
      %9588 = func.call @cc_nil_value() : () -> i64
      %9589 = func.call @cc_intern(%9587, %9588) : (i64, i64) -> i64
      %9590 = func.call @cc_nil_value() : () -> i64
      %9591 = func.call @cc_cons(%9589, %9590) : (i64, i64) -> i64
      %9592 = func.call @cc_values_pack(%9591) : (i64) -> i64
      func.call @stack_push_pointer(%9589) : (i64) -> ()
      %9593 = llvm.mlir.addressof @str935 : !llvm.ptr
      %9594 = arith.constant 15 : i64
      %9595 = func.call @cc_make_string(%9593, %9594) : (!llvm.ptr, i64) -> i64
      %9596 = func.call @cc_nil_value() : () -> i64
      %9597 = func.call @cc_intern(%9595, %9596) : (i64, i64) -> i64
      %9598 = func.call @cc_nil_value() : () -> i64
      %9599 = func.call @cc_cons(%9597, %9598) : (i64, i64) -> i64
      %9600 = func.call @cc_values_pack(%9599) : (i64) -> i64
      func.call @stack_push_pointer(%9597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9601 = func.call @stack_pop_pointer() : () -> i64
      %9602 = func.call @stack_pop_pointer() : () -> i64
      %9603 = func.call @cc_cons(%9602, %9601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9604 = func.call @stack_pop_pointer() : () -> i64
      %9605 = func.call @stack_pop_pointer() : () -> i64
      %9606 = func.call @cc_cons(%9605, %9604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_422 = arith.constant 0 : i64
      %9607 = arith.addi %9606, %__rlasp_stack_elide_zero_422 : i64
      %9608 = func.call @stack_pop_pointer() : () -> i64
      %9609 = func.call @cc_cons(%9608, %9607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9609) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9610 = func.call @stack_pop_pointer() : () -> i64
      %9611 = func.call @stack_pop_pointer() : () -> i64
      %9612 = func.call @cc_cons(%9611, %9610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_423 = arith.constant 0 : i64
      %9613 = arith.addi %9612, %__rlasp_stack_elide_zero_423 : i64
      %9614 = func.call @stack_pop_pointer() : () -> i64
      %9615 = func.call @cc_cons(%9614, %9613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9615) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9616 = func.call @stack_pop_pointer() : () -> i64
      %9617 = func.call @stack_pop_pointer() : () -> i64
      %9618 = func.call @cc_cons(%9617, %9616) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_424 = arith.constant 0 : i64
      %9619 = arith.addi %9618, %__rlasp_stack_elide_zero_424 : i64
      %9620 = func.call @stack_pop_pointer() : () -> i64
      %9621 = func.call @cc_cons(%9620, %9619) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_425 = arith.constant 0 : i64
      %9622 = arith.addi %9621, %__rlasp_stack_elide_zero_425 : i64
      %9653 = arith.constant 206494159077416 : i64
      %9654 = arith.constant 0 : i64
      %9655 = func.call @cc_make_closure(%9653, %9654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_426 = arith.constant 0 : i64
      %9656 = arith.addi %9655, %__rlasp_stack_elide_zero_426 : i64
      %9657 = llvm.mlir.addressof @str938 : !llvm.ptr
      %9658 = arith.constant 1 : i64
      %9659 = func.call @cc_make_string(%9657, %9658) : (!llvm.ptr, i64) -> i64
      %9660 = func.call @cc_nil_value() : () -> i64
      %9661 = func.call @cc_intern(%9659, %9660) : (i64, i64) -> i64
      %9662 = func.call @cc_nil_value() : () -> i64
      %9663 = func.call @cc_cons(%9661, %9662) : (i64, i64) -> i64
      %9664 = func.call @cc_values_pack(%9663) : (i64) -> i64
      func.call @stack_push_pointer(%9661) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9665 = func.call @stack_pop_pointer() : () -> i64
      %9666 = func.call @stack_pop_pointer() : () -> i64
      %9667 = func.call @cc_cons(%9666, %9665) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_427 = arith.constant 0 : i64
      %9668 = arith.addi %9667, %__rlasp_stack_elide_zero_427 : i64
      %9669 = llvm.mlir.addressof @str939 : !llvm.ptr
      %9670 = arith.constant 11 : i64
      %9671 = func.call @cc_make_string(%9669, %9670) : (!llvm.ptr, i64) -> i64
      %9672 = llvm.mlir.addressof @str940 : !llvm.ptr
      %9673 = arith.constant 7 : i64
      %9674 = func.call @cc_make_string(%9672, %9673) : (!llvm.ptr, i64) -> i64
      %9675 = func.call @cc_intern(%9671, %9674) : (i64, i64) -> i64
      %9676 = func.call @cc_nil_value() : () -> i64
      %9677 = func.call @cc_cons(%9675, %9676) : (i64, i64) -> i64
      %9678 = func.call @cc_values_pack(%9677) : (i64) -> i64
      %9679 = func.call @cc_nil_value() : () -> i64
      %9680 = llvm.mlir.addressof @str941 : !llvm.ptr
      %9681 = arith.constant 4 : i64
      %9682 = func.call @cc_make_string(%9680, %9681) : (!llvm.ptr, i64) -> i64
      %9683 = llvm.mlir.addressof @str942 : !llvm.ptr
      %9684 = arith.constant 7 : i64
      %9685 = func.call @cc_make_string(%9683, %9684) : (!llvm.ptr, i64) -> i64
      %9686 = func.call @cc_intern(%9682, %9685) : (i64, i64) -> i64
      %9687 = func.call @cc_nil_value() : () -> i64
      %9688 = func.call @cc_cons(%9686, %9687) : (i64, i64) -> i64
      %9689 = func.call @cc_values_pack(%9688) : (i64) -> i64
      %9690 = llvm.mlir.addressof @str943 : !llvm.ptr
      %9691 = arith.constant 6 : i64
      %9692 = func.call @cc_make_string(%9690, %9691) : (!llvm.ptr, i64) -> i64
      %9693 = func.call @cc_nil_value() : () -> i64
      %9694 = func.call @cc_intern(%9692, %9693) : (i64, i64) -> i64
      %9695 = func.call @cc_nil_value() : () -> i64
      %9696 = func.call @cc_cons(%9694, %9695) : (i64, i64) -> i64
      %9697 = func.call @cc_values_pack(%9696) : (i64) -> i64
      %__rlasp_stack_elide_zero_428 = arith.constant 0 : i64
      %9698 = arith.addi %9694, %__rlasp_stack_elide_zero_428 : i64
      %9699 = func.call @cc_nil_value() : () -> i64
      %9700 = func.call @cc_errorp(%9568) : (i64) -> i64
      %9701 = arith.cmpi ne, %9700, %9699 : i64
      %9702 = arith.cmpi eq, %9699, %9699 : i64
      %9703 = arith.andi %9701, %9702 : i1
      %9704 = scf.if %9703 -> (i64) {
        scf.yield %9568 : i64
      } else {
        scf.yield %9699 : i64
      }
      %9705 = func.call @cc_errorp(%9622) : (i64) -> i64
      %9706 = arith.cmpi ne, %9705, %9699 : i64
      %9707 = arith.cmpi eq, %9704, %9699 : i64
      %9708 = arith.andi %9706, %9707 : i1
      %9709 = scf.if %9708 -> (i64) {
        scf.yield %9622 : i64
      } else {
        scf.yield %9704 : i64
      }
      %9710 = func.call @cc_errorp(%9656) : (i64) -> i64
      %9711 = arith.cmpi ne, %9710, %9699 : i64
      %9712 = arith.cmpi eq, %9709, %9699 : i64
      %9713 = arith.andi %9711, %9712 : i1
      %9714 = scf.if %9713 -> (i64) {
        scf.yield %9656 : i64
      } else {
        scf.yield %9709 : i64
      }
      %9715 = func.call @cc_errorp(%9668) : (i64) -> i64
      %9716 = arith.cmpi ne, %9715, %9699 : i64
      %9717 = arith.cmpi eq, %9714, %9699 : i64
      %9718 = arith.andi %9716, %9717 : i1
      %9719 = scf.if %9718 -> (i64) {
        scf.yield %9668 : i64
      } else {
        scf.yield %9714 : i64
      }
      %9720 = func.call @cc_errorp(%9675) : (i64) -> i64
      %9721 = arith.cmpi ne, %9720, %9699 : i64
      %9722 = arith.cmpi eq, %9719, %9699 : i64
      %9723 = arith.andi %9721, %9722 : i1
      %9724 = scf.if %9723 -> (i64) {
        scf.yield %9675 : i64
      } else {
        scf.yield %9719 : i64
      }
      %9725 = func.call @cc_errorp(%9679) : (i64) -> i64
      %9726 = arith.cmpi ne, %9725, %9699 : i64
      %9727 = arith.cmpi eq, %9724, %9699 : i64
      %9728 = arith.andi %9726, %9727 : i1
      %9729 = scf.if %9728 -> (i64) {
        scf.yield %9679 : i64
      } else {
        scf.yield %9724 : i64
      }
      %9730 = func.call @cc_errorp(%9686) : (i64) -> i64
      %9731 = arith.cmpi ne, %9730, %9699 : i64
      %9732 = arith.cmpi eq, %9729, %9699 : i64
      %9733 = arith.andi %9731, %9732 : i1
      %9734 = scf.if %9733 -> (i64) {
        scf.yield %9686 : i64
      } else {
        scf.yield %9729 : i64
      }
      %9735 = func.call @cc_errorp(%9698) : (i64) -> i64
      %9736 = arith.cmpi ne, %9735, %9699 : i64
      %9737 = arith.cmpi eq, %9734, %9699 : i64
      %9738 = arith.andi %9736, %9737 : i1
      %9739 = scf.if %9738 -> (i64) {
        scf.yield %9698 : i64
      } else {
        scf.yield %9734 : i64
      }
      %9740 = arith.cmpi ne, %9739, %9699 : i64
      scf.if %9740 {
        func.call @stack_push_pointer(%9739) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9568) : (i64) -> ()
        func.call @stack_push_pointer(%9622) : (i64) -> ()
        func.call @stack_push_pointer(%9656) : (i64) -> ()
        func.call @stack_push_pointer(%9668) : (i64) -> ()
        func.call @stack_push_pointer(%9675) : (i64) -> ()
        func.call @stack_push_pointer(%9679) : (i64) -> ()
        func.call @stack_push_pointer(%9686) : (i64) -> ()
        func.call @stack_push_pointer(%9698) : (i64) -> ()
        %9741 = llvm.mlir.addressof @str944 : !llvm.ptr
        %9742 = func.call @cc_make_function_ref_const(%9741) : (!llvm.ptr) -> i64
        %9743 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9742, %9743) : (i64, i64) -> ()
      }
      %9744 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9744 : i64
    }
    %9745 = func.call @cc_nil_value() : () -> i64
    %9746 = func.call @cc_errorp(%9559) : (i64) -> i64
    %9747 = arith.cmpi ne, %9746, %9745 : i64
    %9748 = scf.if %9747 -> (i64) {
      scf.yield %9559 : i64
    } else {
      %9749 = llvm.mlir.addressof @str945 : !llvm.ptr
      %9750 = arith.constant 12 : i64
      %9751 = func.call @cc_make_string(%9749, %9750) : (!llvm.ptr, i64) -> i64
      %9752 = func.call @cc_nil_value() : () -> i64
      %9753 = func.call @cc_intern(%9751, %9752) : (i64, i64) -> i64
      %9754 = func.call @cc_nil_value() : () -> i64
      %9755 = func.call @cc_cons(%9753, %9754) : (i64, i64) -> i64
      %9756 = func.call @cc_values_pack(%9755) : (i64) -> i64
      %__rlasp_stack_elide_zero_429 = arith.constant 0 : i64
      %9757 = arith.addi %9753, %__rlasp_stack_elide_zero_429 : i64
      %9774 = arith.constant 206494159077417 : i64
      %9775 = arith.constant 0 : i64
      %9776 = func.call @cc_make_closure(%9774, %9775) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_430 = arith.constant 0 : i64
      %9777 = arith.addi %9776, %__rlasp_stack_elide_zero_430 : i64
      %9778 = func.call @cc_nil_value() : () -> i64
      %9779 = func.call @cc_errorp(%9757) : (i64) -> i64
      %9780 = arith.cmpi ne, %9779, %9778 : i64
      %9781 = arith.cmpi eq, %9778, %9778 : i64
      %9782 = arith.andi %9780, %9781 : i1
      %9783 = scf.if %9782 -> (i64) {
        scf.yield %9757 : i64
      } else {
        scf.yield %9778 : i64
      }
      %9784 = func.call @cc_errorp(%9777) : (i64) -> i64
      %9785 = arith.cmpi ne, %9784, %9778 : i64
      %9786 = arith.cmpi eq, %9783, %9778 : i64
      %9787 = arith.andi %9785, %9786 : i1
      %9788 = scf.if %9787 -> (i64) {
        scf.yield %9777 : i64
      } else {
        scf.yield %9783 : i64
      }
      %9789 = arith.cmpi ne, %9788, %9778 : i64
      scf.if %9789 {
        func.call @stack_push_pointer(%9788) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9757) : (i64) -> ()
        func.call @stack_push_pointer(%9777) : (i64) -> ()
        %9790 = llvm.mlir.addressof @str948 : !llvm.ptr
        %9791 = func.call @cc_make_function_ref_const(%9790) : (!llvm.ptr) -> i64
        %9792 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%9791, %9792) : (i64, i64) -> ()
      }
      %9793 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9793 : i64
    }
    %9794 = func.call @cc_nil_value() : () -> i64
    %9795 = func.call @cc_errorp(%9748) : (i64) -> i64
    %9796 = arith.cmpi ne, %9795, %9794 : i64
    %9797 = scf.if %9796 -> (i64) {
      scf.yield %9748 : i64
    } else {
      %9798 = llvm.mlir.addressof @str949 : !llvm.ptr
      %9799 = arith.constant 11 : i64
      %9800 = func.call @cc_make_string(%9798, %9799) : (!llvm.ptr, i64) -> i64
      %9801 = func.call @cc_nil_value() : () -> i64
      %9802 = func.call @cc_intern(%9800, %9801) : (i64, i64) -> i64
      %9803 = func.call @cc_nil_value() : () -> i64
      %9804 = func.call @cc_cons(%9802, %9803) : (i64, i64) -> i64
      %9805 = func.call @cc_values_pack(%9804) : (i64) -> i64
      %__rlasp_stack_elide_zero_431 = arith.constant 0 : i64
      %9806 = arith.addi %9802, %__rlasp_stack_elide_zero_431 : i64
      %9807 = llvm.mlir.addressof @str950 : !llvm.ptr
      %9808 = arith.constant 3 : i64
      %9809 = func.call @cc_make_string(%9807, %9808) : (!llvm.ptr, i64) -> i64
      %9810 = func.call @cc_nil_value() : () -> i64
      %9811 = func.call @cc_intern(%9809, %9810) : (i64, i64) -> i64
      %9812 = func.call @cc_nil_value() : () -> i64
      %9813 = func.call @cc_cons(%9811, %9812) : (i64, i64) -> i64
      %9814 = func.call @cc_values_pack(%9813) : (i64) -> i64
      func.call @stack_push_pointer(%9811) : (i64) -> ()
      %9815 = llvm.mlir.addressof @str951 : !llvm.ptr
      %9816 = arith.constant 3 : i64
      %9817 = func.call @cc_make_string(%9815, %9816) : (!llvm.ptr, i64) -> i64
      %9818 = func.call @cc_nil_value() : () -> i64
      %9819 = func.call @cc_intern(%9817, %9818) : (i64, i64) -> i64
      %9820 = func.call @cc_nil_value() : () -> i64
      %9821 = func.call @cc_cons(%9819, %9820) : (i64, i64) -> i64
      %9822 = func.call @cc_values_pack(%9821) : (i64) -> i64
      func.call @stack_push_pointer(%9819) : (i64) -> ()
      %9823 = llvm.mlir.addressof @str952 : !llvm.ptr
      %9824 = arith.constant 3 : i64
      %9825 = func.call @cc_make_string(%9823, %9824) : (!llvm.ptr, i64) -> i64
      %9826 = func.call @cc_nil_value() : () -> i64
      %9827 = func.call @cc_intern(%9825, %9826) : (i64, i64) -> i64
      %9828 = func.call @cc_nil_value() : () -> i64
      %9829 = func.call @cc_cons(%9827, %9828) : (i64, i64) -> i64
      %9830 = func.call @cc_values_pack(%9829) : (i64) -> i64
      func.call @stack_push_pointer(%9827) : (i64) -> ()
      %9831 = llvm.mlir.addressof @str953 : !llvm.ptr
      %9832 = arith.constant 4 : i64
      %9833 = func.call @cc_make_string(%9831, %9832) : (!llvm.ptr, i64) -> i64
      %9834 = func.call @cc_nil_value() : () -> i64
      %9835 = func.call @cc_intern(%9833, %9834) : (i64, i64) -> i64
      %9836 = func.call @cc_nil_value() : () -> i64
      %9837 = func.call @cc_cons(%9835, %9836) : (i64, i64) -> i64
      %9838 = func.call @cc_values_pack(%9837) : (i64) -> i64
      func.call @stack_push_pointer(%9835) : (i64) -> ()
      %9839 = llvm.mlir.addressof @str954 : !llvm.ptr
      %9840 = arith.constant 5 : i64
      %9841 = func.call @cc_make_string(%9839, %9840) : (!llvm.ptr, i64) -> i64
      %9842 = llvm.mlir.addressof @str955 : !llvm.ptr
      %9843 = arith.constant 7 : i64
      %9844 = func.call @cc_make_string(%9842, %9843) : (!llvm.ptr, i64) -> i64
      %9845 = func.call @cc_intern(%9841, %9844) : (i64, i64) -> i64
      %9846 = func.call @cc_nil_value() : () -> i64
      %9847 = func.call @cc_cons(%9845, %9846) : (i64, i64) -> i64
      %9848 = func.call @cc_values_pack(%9847) : (i64) -> i64
      func.call @stack_push_pointer(%9845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9849 = func.call @stack_pop_pointer() : () -> i64
      %9850 = func.call @stack_pop_pointer() : () -> i64
      %9851 = func.call @cc_cons(%9850, %9849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_432 = arith.constant 0 : i64
      %9852 = arith.addi %9851, %__rlasp_stack_elide_zero_432 : i64
      %9853 = func.call @stack_pop_pointer() : () -> i64
      %9854 = func.call @cc_cons(%9853, %9852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9854) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9855 = func.call @stack_pop_pointer() : () -> i64
      %9856 = func.call @stack_pop_pointer() : () -> i64
      %9857 = func.call @cc_cons(%9856, %9855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9857) : (i64) -> ()
      %9858 = llvm.mlir.addressof @str956 : !llvm.ptr
      %9859 = arith.constant 5 : i64
      %9860 = func.call @cc_make_string(%9858, %9859) : (!llvm.ptr, i64) -> i64
      %9861 = llvm.mlir.addressof @str957 : !llvm.ptr
      %9862 = arith.constant 11 : i64
      %9863 = func.call @cc_make_string(%9861, %9862) : (!llvm.ptr, i64) -> i64
      %9864 = func.call @cc_intern(%9860, %9863) : (i64, i64) -> i64
      %9865 = func.call @cc_nil_value() : () -> i64
      %9866 = func.call @cc_cons(%9864, %9865) : (i64, i64) -> i64
      %9867 = func.call @cc_values_pack(%9866) : (i64) -> i64
      func.call @stack_push_pointer(%9864) : (i64) -> ()
      %9868 = llvm.mlir.addressof @str958 : !llvm.ptr
      %9869 = arith.constant 4 : i64
      %9870 = func.call @cc_make_string(%9868, %9869) : (!llvm.ptr, i64) -> i64
      %9871 = func.call @cc_nil_value() : () -> i64
      %9872 = func.call @cc_intern(%9870, %9871) : (i64, i64) -> i64
      %9873 = func.call @cc_nil_value() : () -> i64
      %9874 = func.call @cc_cons(%9872, %9873) : (i64, i64) -> i64
      %9875 = func.call @cc_values_pack(%9874) : (i64) -> i64
      func.call @stack_push_pointer(%9872) : (i64) -> ()
      %9876 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%9876) : (i64) -> ()
      %9877 = llvm.mlir.addressof @str959 : !llvm.ptr
      %9878 = arith.constant 12 : i64
      %9879 = func.call @cc_make_string(%9877, %9878) : (!llvm.ptr, i64) -> i64
      %9880 = func.call @cc_nil_value() : () -> i64
      %9881 = func.call @cc_intern(%9879, %9880) : (i64, i64) -> i64
      %9882 = func.call @cc_nil_value() : () -> i64
      %9883 = func.call @cc_cons(%9881, %9882) : (i64, i64) -> i64
      %9884 = func.call @cc_values_pack(%9883) : (i64) -> i64
      %__rlasp_stack_elide_zero_433 = arith.constant 0 : i64
      %9885 = arith.addi %9881, %__rlasp_stack_elide_zero_433 : i64
      %9886 = func.call @stack_pop_pointer() : () -> i64
      %9887 = func.call @cc_cons(%9885, %9886) : (i64, i64) -> i64
      %9888 = llvm.mlir.addressof @str960 : !llvm.ptr
      %9889 = arith.constant 5 : i64
      %9890 = func.call @cc_make_string(%9888, %9889) : (!llvm.ptr, i64) -> i64
      %9891 = func.call @cc_nil_value() : () -> i64
      %9892 = func.call @cc_intern(%9890, %9891) : (i64, i64) -> i64
      %9893 = func.call @cc_nil_value() : () -> i64
      %9894 = func.call @cc_cons(%9892, %9893) : (i64, i64) -> i64
      %9895 = func.call @cc_values_pack(%9894) : (i64) -> i64
      %9896 = func.call @cc_cons(%9892, %9887) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9897 = func.call @stack_pop_pointer() : () -> i64
      %9898 = func.call @stack_pop_pointer() : () -> i64
      %9899 = func.call @cc_cons(%9898, %9897) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_434 = arith.constant 0 : i64
      %9900 = arith.addi %9899, %__rlasp_stack_elide_zero_434 : i64
      %9901 = func.call @stack_pop_pointer() : () -> i64
      %9902 = func.call @cc_cons(%9901, %9900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_435 = arith.constant 0 : i64
      %9903 = arith.addi %9902, %__rlasp_stack_elide_zero_435 : i64
      %9904 = func.call @stack_pop_pointer() : () -> i64
      %9905 = func.call @cc_cons(%9904, %9903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9906 = func.call @stack_pop_pointer() : () -> i64
      %9907 = func.call @stack_pop_pointer() : () -> i64
      %9908 = func.call @cc_cons(%9907, %9906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_436 = arith.constant 0 : i64
      %9909 = arith.addi %9908, %__rlasp_stack_elide_zero_436 : i64
      %9910 = func.call @stack_pop_pointer() : () -> i64
      %9911 = func.call @cc_cons(%9910, %9909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_437 = arith.constant 0 : i64
      %9912 = arith.addi %9911, %__rlasp_stack_elide_zero_437 : i64
      %9913 = func.call @stack_pop_pointer() : () -> i64
      %9914 = func.call @cc_cons(%9913, %9912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9914) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9915 = func.call @stack_pop_pointer() : () -> i64
      %9916 = func.call @stack_pop_pointer() : () -> i64
      %9917 = func.call @cc_cons(%9916, %9915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_438 = arith.constant 0 : i64
      %9918 = arith.addi %9917, %__rlasp_stack_elide_zero_438 : i64
      %9919 = func.call @stack_pop_pointer() : () -> i64
      %9920 = func.call @cc_cons(%9919, %9918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9920) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9921 = func.call @stack_pop_pointer() : () -> i64
      %9922 = func.call @stack_pop_pointer() : () -> i64
      %9923 = func.call @cc_cons(%9922, %9921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_439 = arith.constant 0 : i64
      %9924 = arith.addi %9923, %__rlasp_stack_elide_zero_439 : i64
      %9925 = func.call @stack_pop_pointer() : () -> i64
      %9926 = func.call @cc_cons(%9925, %9924) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_440 = arith.constant 0 : i64
      %9927 = arith.addi %9926, %__rlasp_stack_elide_zero_440 : i64
      %9969 = arith.constant 206494159077418 : i64
      %9970 = arith.constant 0 : i64
      %9971 = func.call @cc_make_closure(%9969, %9970) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_441 = arith.constant 0 : i64
      %9972 = arith.addi %9971, %__rlasp_stack_elide_zero_441 : i64
      %9973 = llvm.mlir.addressof @str964 : !llvm.ptr
      %9974 = arith.constant 1 : i64
      %9975 = func.call @cc_make_string(%9973, %9974) : (!llvm.ptr, i64) -> i64
      %9976 = func.call @cc_nil_value() : () -> i64
      %9977 = func.call @cc_intern(%9975, %9976) : (i64, i64) -> i64
      %9978 = func.call @cc_nil_value() : () -> i64
      %9979 = func.call @cc_cons(%9977, %9978) : (i64, i64) -> i64
      %9980 = func.call @cc_values_pack(%9979) : (i64) -> i64
      func.call @stack_push_pointer(%9977) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9981 = func.call @stack_pop_pointer() : () -> i64
      %9982 = func.call @stack_pop_pointer() : () -> i64
      %9983 = func.call @cc_cons(%9982, %9981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_442 = arith.constant 0 : i64
      %9984 = arith.addi %9983, %__rlasp_stack_elide_zero_442 : i64
      %9985 = llvm.mlir.addressof @str965 : !llvm.ptr
      %9986 = arith.constant 11 : i64
      %9987 = func.call @cc_make_string(%9985, %9986) : (!llvm.ptr, i64) -> i64
      %9988 = llvm.mlir.addressof @str966 : !llvm.ptr
      %9989 = arith.constant 7 : i64
      %9990 = func.call @cc_make_string(%9988, %9989) : (!llvm.ptr, i64) -> i64
      %9991 = func.call @cc_intern(%9987, %9990) : (i64, i64) -> i64
      %9992 = func.call @cc_nil_value() : () -> i64
      %9993 = func.call @cc_cons(%9991, %9992) : (i64, i64) -> i64
      %9994 = func.call @cc_values_pack(%9993) : (i64) -> i64
      %9995 = func.call @cc_nil_value() : () -> i64
      %9996 = llvm.mlir.addressof @str967 : !llvm.ptr
      %9997 = arith.constant 4 : i64
      %9998 = func.call @cc_make_string(%9996, %9997) : (!llvm.ptr, i64) -> i64
      %9999 = llvm.mlir.addressof @str968 : !llvm.ptr
      %10000 = arith.constant 7 : i64
      %10001 = func.call @cc_make_string(%9999, %10000) : (!llvm.ptr, i64) -> i64
      %10002 = func.call @cc_intern(%9998, %10001) : (i64, i64) -> i64
      %10003 = func.call @cc_nil_value() : () -> i64
      %10004 = func.call @cc_cons(%10002, %10003) : (i64, i64) -> i64
      %10005 = func.call @cc_values_pack(%10004) : (i64) -> i64
      %10006 = llvm.mlir.addressof @str969 : !llvm.ptr
      %10007 = arith.constant 6 : i64
      %10008 = func.call @cc_make_string(%10006, %10007) : (!llvm.ptr, i64) -> i64
      %10009 = func.call @cc_nil_value() : () -> i64
      %10010 = func.call @cc_intern(%10008, %10009) : (i64, i64) -> i64
      %10011 = func.call @cc_nil_value() : () -> i64
      %10012 = func.call @cc_cons(%10010, %10011) : (i64, i64) -> i64
      %10013 = func.call @cc_values_pack(%10012) : (i64) -> i64
      %__rlasp_stack_elide_zero_443 = arith.constant 0 : i64
      %10014 = arith.addi %10010, %__rlasp_stack_elide_zero_443 : i64
      %10015 = func.call @cc_nil_value() : () -> i64
      %10016 = func.call @cc_errorp(%9806) : (i64) -> i64
      %10017 = arith.cmpi ne, %10016, %10015 : i64
      %10018 = arith.cmpi eq, %10015, %10015 : i64
      %10019 = arith.andi %10017, %10018 : i1
      %10020 = scf.if %10019 -> (i64) {
        scf.yield %9806 : i64
      } else {
        scf.yield %10015 : i64
      }
      %10021 = func.call @cc_errorp(%9927) : (i64) -> i64
      %10022 = arith.cmpi ne, %10021, %10015 : i64
      %10023 = arith.cmpi eq, %10020, %10015 : i64
      %10024 = arith.andi %10022, %10023 : i1
      %10025 = scf.if %10024 -> (i64) {
        scf.yield %9927 : i64
      } else {
        scf.yield %10020 : i64
      }
      %10026 = func.call @cc_errorp(%9972) : (i64) -> i64
      %10027 = arith.cmpi ne, %10026, %10015 : i64
      %10028 = arith.cmpi eq, %10025, %10015 : i64
      %10029 = arith.andi %10027, %10028 : i1
      %10030 = scf.if %10029 -> (i64) {
        scf.yield %9972 : i64
      } else {
        scf.yield %10025 : i64
      }
      %10031 = func.call @cc_errorp(%9984) : (i64) -> i64
      %10032 = arith.cmpi ne, %10031, %10015 : i64
      %10033 = arith.cmpi eq, %10030, %10015 : i64
      %10034 = arith.andi %10032, %10033 : i1
      %10035 = scf.if %10034 -> (i64) {
        scf.yield %9984 : i64
      } else {
        scf.yield %10030 : i64
      }
      %10036 = func.call @cc_errorp(%9991) : (i64) -> i64
      %10037 = arith.cmpi ne, %10036, %10015 : i64
      %10038 = arith.cmpi eq, %10035, %10015 : i64
      %10039 = arith.andi %10037, %10038 : i1
      %10040 = scf.if %10039 -> (i64) {
        scf.yield %9991 : i64
      } else {
        scf.yield %10035 : i64
      }
      %10041 = func.call @cc_errorp(%9995) : (i64) -> i64
      %10042 = arith.cmpi ne, %10041, %10015 : i64
      %10043 = arith.cmpi eq, %10040, %10015 : i64
      %10044 = arith.andi %10042, %10043 : i1
      %10045 = scf.if %10044 -> (i64) {
        scf.yield %9995 : i64
      } else {
        scf.yield %10040 : i64
      }
      %10046 = func.call @cc_errorp(%10002) : (i64) -> i64
      %10047 = arith.cmpi ne, %10046, %10015 : i64
      %10048 = arith.cmpi eq, %10045, %10015 : i64
      %10049 = arith.andi %10047, %10048 : i1
      %10050 = scf.if %10049 -> (i64) {
        scf.yield %10002 : i64
      } else {
        scf.yield %10045 : i64
      }
      %10051 = func.call @cc_errorp(%10014) : (i64) -> i64
      %10052 = arith.cmpi ne, %10051, %10015 : i64
      %10053 = arith.cmpi eq, %10050, %10015 : i64
      %10054 = arith.andi %10052, %10053 : i1
      %10055 = scf.if %10054 -> (i64) {
        scf.yield %10014 : i64
      } else {
        scf.yield %10050 : i64
      }
      %10056 = arith.cmpi ne, %10055, %10015 : i64
      scf.if %10056 {
        func.call @stack_push_pointer(%10055) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9806) : (i64) -> ()
        func.call @stack_push_pointer(%9927) : (i64) -> ()
        func.call @stack_push_pointer(%9972) : (i64) -> ()
        func.call @stack_push_pointer(%9984) : (i64) -> ()
        func.call @stack_push_pointer(%9991) : (i64) -> ()
        func.call @stack_push_pointer(%9995) : (i64) -> ()
        func.call @stack_push_pointer(%10002) : (i64) -> ()
        func.call @stack_push_pointer(%10014) : (i64) -> ()
        %10057 = llvm.mlir.addressof @str970 : !llvm.ptr
        %10058 = func.call @cc_make_function_ref_const(%10057) : (!llvm.ptr) -> i64
        %10059 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10058, %10059) : (i64, i64) -> ()
      }
      %10060 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10060 : i64
    }
    %10061 = func.call @cc_nil_value() : () -> i64
    %10062 = func.call @cc_errorp(%9797) : (i64) -> i64
    %10063 = arith.cmpi ne, %10062, %10061 : i64
    %10064 = scf.if %10063 -> (i64) {
      scf.yield %9797 : i64
    } else {
      %10065 = llvm.mlir.addressof @str971 : !llvm.ptr
      %10066 = arith.constant 10 : i64
      %10067 = func.call @cc_make_string(%10065, %10066) : (!llvm.ptr, i64) -> i64
      %10068 = func.call @cc_nil_value() : () -> i64
      %10069 = func.call @cc_intern(%10067, %10068) : (i64, i64) -> i64
      %10070 = func.call @cc_nil_value() : () -> i64
      %10071 = func.call @cc_cons(%10069, %10070) : (i64, i64) -> i64
      %10072 = func.call @cc_values_pack(%10071) : (i64) -> i64
      %__rlasp_stack_elide_zero_444 = arith.constant 0 : i64
      %10073 = arith.addi %10069, %__rlasp_stack_elide_zero_444 : i64
      %10074 = llvm.mlir.addressof @str972 : !llvm.ptr
      %10075 = arith.constant 3 : i64
      %10076 = func.call @cc_make_string(%10074, %10075) : (!llvm.ptr, i64) -> i64
      %10077 = func.call @cc_nil_value() : () -> i64
      %10078 = func.call @cc_intern(%10076, %10077) : (i64, i64) -> i64
      %10079 = func.call @cc_nil_value() : () -> i64
      %10080 = func.call @cc_cons(%10078, %10079) : (i64, i64) -> i64
      %10081 = func.call @cc_values_pack(%10080) : (i64) -> i64
      func.call @stack_push_pointer(%10078) : (i64) -> ()
      %10082 = llvm.mlir.addressof @str973 : !llvm.ptr
      %10083 = arith.constant 3 : i64
      %10084 = func.call @cc_make_string(%10082, %10083) : (!llvm.ptr, i64) -> i64
      %10085 = func.call @cc_nil_value() : () -> i64
      %10086 = func.call @cc_intern(%10084, %10085) : (i64, i64) -> i64
      %10087 = func.call @cc_nil_value() : () -> i64
      %10088 = func.call @cc_cons(%10086, %10087) : (i64, i64) -> i64
      %10089 = func.call @cc_values_pack(%10088) : (i64) -> i64
      func.call @stack_push_pointer(%10086) : (i64) -> ()
      %10090 = llvm.mlir.addressof @str974 : !llvm.ptr
      %10091 = arith.constant 3 : i64
      %10092 = func.call @cc_make_string(%10090, %10091) : (!llvm.ptr, i64) -> i64
      %10093 = func.call @cc_nil_value() : () -> i64
      %10094 = func.call @cc_intern(%10092, %10093) : (i64, i64) -> i64
      %10095 = func.call @cc_nil_value() : () -> i64
      %10096 = func.call @cc_cons(%10094, %10095) : (i64, i64) -> i64
      %10097 = func.call @cc_values_pack(%10096) : (i64) -> i64
      func.call @stack_push_pointer(%10094) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10098 = llvm.mlir.addressof @str975 : !llvm.ptr
      %10099 = arith.constant 4 : i64
      %10100 = func.call @cc_make_string(%10098, %10099) : (!llvm.ptr, i64) -> i64
      %10101 = llvm.mlir.addressof @str976 : !llvm.ptr
      %10102 = arith.constant 11 : i64
      %10103 = func.call @cc_make_string(%10101, %10102) : (!llvm.ptr, i64) -> i64
      %10104 = func.call @cc_intern(%10100, %10103) : (i64, i64) -> i64
      %10105 = func.call @cc_nil_value() : () -> i64
      %10106 = func.call @cc_cons(%10104, %10105) : (i64, i64) -> i64
      %10107 = func.call @cc_values_pack(%10106) : (i64) -> i64
      func.call @stack_push_pointer(%10104) : (i64) -> ()
      %10108 = llvm.mlir.addressof @str977 : !llvm.ptr
      %10109 = arith.constant 5 : i64
      %10110 = func.call @cc_make_string(%10108, %10109) : (!llvm.ptr, i64) -> i64
      %10111 = llvm.mlir.addressof @str978 : !llvm.ptr
      %10112 = arith.constant 11 : i64
      %10113 = func.call @cc_make_string(%10111, %10112) : (!llvm.ptr, i64) -> i64
      %10114 = func.call @cc_intern(%10110, %10113) : (i64, i64) -> i64
      %10115 = func.call @cc_nil_value() : () -> i64
      %10116 = func.call @cc_cons(%10114, %10115) : (i64, i64) -> i64
      %10117 = func.call @cc_values_pack(%10116) : (i64) -> i64
      func.call @stack_push_pointer(%10114) : (i64) -> ()
      %10118 = arith.constant 0 : i64
      %10119 = func.call @cc_box_fixnum(%10118) : (i64) -> i64
      %10120 = func.call @cc_make_vector(%10119) : (i64) -> i64
      func.call @stack_push_pointer(%10120) : (i64) -> ()
      %10121 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%10121) : (i64) -> ()
      %10122 = llvm.mlir.addressof @str979 : !llvm.ptr
      %10123 = arith.constant 5 : i64
      %10124 = func.call @cc_make_string(%10122, %10123) : (!llvm.ptr, i64) -> i64
      %10125 = llvm.mlir.addressof @str980 : !llvm.ptr
      %10126 = arith.constant 11 : i64
      %10127 = func.call @cc_make_string(%10125, %10126) : (!llvm.ptr, i64) -> i64
      %10128 = func.call @cc_intern(%10124, %10127) : (i64, i64) -> i64
      %10129 = func.call @cc_nil_value() : () -> i64
      %10130 = func.call @cc_cons(%10128, %10129) : (i64, i64) -> i64
      %10131 = func.call @cc_values_pack(%10130) : (i64) -> i64
      func.call @stack_push_pointer(%10128) : (i64) -> ()
      %10132 = llvm.mlir.addressof @str981 : !llvm.ptr
      %10133 = arith.constant 1 : i64
      %10134 = func.call @cc_make_string(%10132, %10133) : (!llvm.ptr, i64) -> i64
      %10135 = llvm.mlir.addressof @str982 : !llvm.ptr
      %10136 = arith.constant 11 : i64
      %10137 = func.call @cc_make_string(%10135, %10136) : (!llvm.ptr, i64) -> i64
      %10138 = func.call @cc_intern(%10134, %10137) : (i64, i64) -> i64
      %10139 = func.call @cc_nil_value() : () -> i64
      %10140 = func.call @cc_cons(%10138, %10139) : (i64, i64) -> i64
      %10141 = func.call @cc_values_pack(%10140) : (i64) -> i64
      func.call @stack_push_pointer(%10138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10142 = func.call @stack_pop_pointer() : () -> i64
      %10143 = func.call @stack_pop_pointer() : () -> i64
      %10144 = func.call @cc_cons(%10143, %10142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_445 = arith.constant 0 : i64
      %10145 = arith.addi %10144, %__rlasp_stack_elide_zero_445 : i64
      %10146 = func.call @stack_pop_pointer() : () -> i64
      %10147 = func.call @cc_cons(%10146, %10145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_446 = arith.constant 0 : i64
      %10148 = arith.addi %10147, %__rlasp_stack_elide_zero_446 : i64
      %10149 = func.call @stack_pop_pointer() : () -> i64
      %10150 = func.call @cc_cons(%10149, %10148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_447 = arith.constant 0 : i64
      %10151 = arith.addi %10150, %__rlasp_stack_elide_zero_447 : i64
      %10152 = func.call @stack_pop_pointer() : () -> i64
      %10153 = func.call @cc_cons(%10151, %10152) : (i64, i64) -> i64
      %10154 = llvm.mlir.addressof @str983 : !llvm.ptr
      %10155 = arith.constant 5 : i64
      %10156 = func.call @cc_make_string(%10154, %10155) : (!llvm.ptr, i64) -> i64
      %10157 = func.call @cc_nil_value() : () -> i64
      %10158 = func.call @cc_intern(%10156, %10157) : (i64, i64) -> i64
      %10159 = func.call @cc_nil_value() : () -> i64
      %10160 = func.call @cc_cons(%10158, %10159) : (i64, i64) -> i64
      %10161 = func.call @cc_values_pack(%10160) : (i64) -> i64
      %10162 = func.call @cc_cons(%10158, %10153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10162) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10163 = func.call @stack_pop_pointer() : () -> i64
      %10164 = func.call @stack_pop_pointer() : () -> i64
      %10165 = func.call @cc_cons(%10164, %10163) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_448 = arith.constant 0 : i64
      %10166 = arith.addi %10165, %__rlasp_stack_elide_zero_448 : i64
      %10167 = func.call @stack_pop_pointer() : () -> i64
      %10168 = func.call @cc_cons(%10167, %10166) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_449 = arith.constant 0 : i64
      %10169 = arith.addi %10168, %__rlasp_stack_elide_zero_449 : i64
      %10170 = func.call @stack_pop_pointer() : () -> i64
      %10171 = func.call @cc_cons(%10170, %10169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10171) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10172 = func.call @stack_pop_pointer() : () -> i64
      %10173 = func.call @stack_pop_pointer() : () -> i64
      %10174 = func.call @cc_cons(%10173, %10172) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_450 = arith.constant 0 : i64
      %10175 = arith.addi %10174, %__rlasp_stack_elide_zero_450 : i64
      %10176 = func.call @stack_pop_pointer() : () -> i64
      %10177 = func.call @cc_cons(%10176, %10175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10178 = func.call @stack_pop_pointer() : () -> i64
      %10179 = func.call @stack_pop_pointer() : () -> i64
      %10180 = func.call @cc_cons(%10179, %10178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_451 = arith.constant 0 : i64
      %10181 = arith.addi %10180, %__rlasp_stack_elide_zero_451 : i64
      %10182 = func.call @stack_pop_pointer() : () -> i64
      %10183 = func.call @cc_cons(%10182, %10181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_452 = arith.constant 0 : i64
      %10184 = arith.addi %10183, %__rlasp_stack_elide_zero_452 : i64
      %10185 = func.call @stack_pop_pointer() : () -> i64
      %10186 = func.call @cc_cons(%10185, %10184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10186) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10187 = func.call @stack_pop_pointer() : () -> i64
      %10188 = func.call @stack_pop_pointer() : () -> i64
      %10189 = func.call @cc_cons(%10188, %10187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_453 = arith.constant 0 : i64
      %10190 = arith.addi %10189, %__rlasp_stack_elide_zero_453 : i64
      %10191 = func.call @stack_pop_pointer() : () -> i64
      %10192 = func.call @cc_cons(%10191, %10190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10193 = func.call @stack_pop_pointer() : () -> i64
      %10194 = func.call @stack_pop_pointer() : () -> i64
      %10195 = func.call @cc_cons(%10194, %10193) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_454 = arith.constant 0 : i64
      %10196 = arith.addi %10195, %__rlasp_stack_elide_zero_454 : i64
      %10197 = func.call @stack_pop_pointer() : () -> i64
      %10198 = func.call @cc_cons(%10197, %10196) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_455 = arith.constant 0 : i64
      %10199 = arith.addi %10198, %__rlasp_stack_elide_zero_455 : i64
      %10260 = arith.constant 206494159077419 : i64
      %10261 = arith.constant 0 : i64
      %10262 = func.call @cc_make_closure(%10260, %10261) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_456 = arith.constant 0 : i64
      %10263 = arith.addi %10262, %__rlasp_stack_elide_zero_456 : i64
      %10264 = llvm.mlir.addressof @str988 : !llvm.ptr
      %10265 = arith.constant 1 : i64
      %10266 = func.call @cc_make_string(%10264, %10265) : (!llvm.ptr, i64) -> i64
      %10267 = func.call @cc_nil_value() : () -> i64
      %10268 = func.call @cc_intern(%10266, %10267) : (i64, i64) -> i64
      %10269 = func.call @cc_nil_value() : () -> i64
      %10270 = func.call @cc_cons(%10268, %10269) : (i64, i64) -> i64
      %10271 = func.call @cc_values_pack(%10270) : (i64) -> i64
      func.call @stack_push_pointer(%10268) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10272 = func.call @stack_pop_pointer() : () -> i64
      %10273 = func.call @stack_pop_pointer() : () -> i64
      %10274 = func.call @cc_cons(%10273, %10272) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_457 = arith.constant 0 : i64
      %10275 = arith.addi %10274, %__rlasp_stack_elide_zero_457 : i64
      %10276 = llvm.mlir.addressof @str989 : !llvm.ptr
      %10277 = arith.constant 11 : i64
      %10278 = func.call @cc_make_string(%10276, %10277) : (!llvm.ptr, i64) -> i64
      %10279 = llvm.mlir.addressof @str990 : !llvm.ptr
      %10280 = arith.constant 7 : i64
      %10281 = func.call @cc_make_string(%10279, %10280) : (!llvm.ptr, i64) -> i64
      %10282 = func.call @cc_intern(%10278, %10281) : (i64, i64) -> i64
      %10283 = func.call @cc_nil_value() : () -> i64
      %10284 = func.call @cc_cons(%10282, %10283) : (i64, i64) -> i64
      %10285 = func.call @cc_values_pack(%10284) : (i64) -> i64
      %10286 = func.call @cc_nil_value() : () -> i64
      %10287 = llvm.mlir.addressof @str991 : !llvm.ptr
      %10288 = arith.constant 4 : i64
      %10289 = func.call @cc_make_string(%10287, %10288) : (!llvm.ptr, i64) -> i64
      %10290 = llvm.mlir.addressof @str992 : !llvm.ptr
      %10291 = arith.constant 7 : i64
      %10292 = func.call @cc_make_string(%10290, %10291) : (!llvm.ptr, i64) -> i64
      %10293 = func.call @cc_intern(%10289, %10292) : (i64, i64) -> i64
      %10294 = func.call @cc_nil_value() : () -> i64
      %10295 = func.call @cc_cons(%10293, %10294) : (i64, i64) -> i64
      %10296 = func.call @cc_values_pack(%10295) : (i64) -> i64
      %10297 = llvm.mlir.addressof @str993 : !llvm.ptr
      %10298 = arith.constant 6 : i64
      %10299 = func.call @cc_make_string(%10297, %10298) : (!llvm.ptr, i64) -> i64
      %10300 = func.call @cc_nil_value() : () -> i64
      %10301 = func.call @cc_intern(%10299, %10300) : (i64, i64) -> i64
      %10302 = func.call @cc_nil_value() : () -> i64
      %10303 = func.call @cc_cons(%10301, %10302) : (i64, i64) -> i64
      %10304 = func.call @cc_values_pack(%10303) : (i64) -> i64
      %__rlasp_stack_elide_zero_458 = arith.constant 0 : i64
      %10305 = arith.addi %10301, %__rlasp_stack_elide_zero_458 : i64
      %10306 = func.call @cc_nil_value() : () -> i64
      %10307 = func.call @cc_errorp(%10073) : (i64) -> i64
      %10308 = arith.cmpi ne, %10307, %10306 : i64
      %10309 = arith.cmpi eq, %10306, %10306 : i64
      %10310 = arith.andi %10308, %10309 : i1
      %10311 = scf.if %10310 -> (i64) {
        scf.yield %10073 : i64
      } else {
        scf.yield %10306 : i64
      }
      %10312 = func.call @cc_errorp(%10199) : (i64) -> i64
      %10313 = arith.cmpi ne, %10312, %10306 : i64
      %10314 = arith.cmpi eq, %10311, %10306 : i64
      %10315 = arith.andi %10313, %10314 : i1
      %10316 = scf.if %10315 -> (i64) {
        scf.yield %10199 : i64
      } else {
        scf.yield %10311 : i64
      }
      %10317 = func.call @cc_errorp(%10263) : (i64) -> i64
      %10318 = arith.cmpi ne, %10317, %10306 : i64
      %10319 = arith.cmpi eq, %10316, %10306 : i64
      %10320 = arith.andi %10318, %10319 : i1
      %10321 = scf.if %10320 -> (i64) {
        scf.yield %10263 : i64
      } else {
        scf.yield %10316 : i64
      }
      %10322 = func.call @cc_errorp(%10275) : (i64) -> i64
      %10323 = arith.cmpi ne, %10322, %10306 : i64
      %10324 = arith.cmpi eq, %10321, %10306 : i64
      %10325 = arith.andi %10323, %10324 : i1
      %10326 = scf.if %10325 -> (i64) {
        scf.yield %10275 : i64
      } else {
        scf.yield %10321 : i64
      }
      %10327 = func.call @cc_errorp(%10282) : (i64) -> i64
      %10328 = arith.cmpi ne, %10327, %10306 : i64
      %10329 = arith.cmpi eq, %10326, %10306 : i64
      %10330 = arith.andi %10328, %10329 : i1
      %10331 = scf.if %10330 -> (i64) {
        scf.yield %10282 : i64
      } else {
        scf.yield %10326 : i64
      }
      %10332 = func.call @cc_errorp(%10286) : (i64) -> i64
      %10333 = arith.cmpi ne, %10332, %10306 : i64
      %10334 = arith.cmpi eq, %10331, %10306 : i64
      %10335 = arith.andi %10333, %10334 : i1
      %10336 = scf.if %10335 -> (i64) {
        scf.yield %10286 : i64
      } else {
        scf.yield %10331 : i64
      }
      %10337 = func.call @cc_errorp(%10293) : (i64) -> i64
      %10338 = arith.cmpi ne, %10337, %10306 : i64
      %10339 = arith.cmpi eq, %10336, %10306 : i64
      %10340 = arith.andi %10338, %10339 : i1
      %10341 = scf.if %10340 -> (i64) {
        scf.yield %10293 : i64
      } else {
        scf.yield %10336 : i64
      }
      %10342 = func.call @cc_errorp(%10305) : (i64) -> i64
      %10343 = arith.cmpi ne, %10342, %10306 : i64
      %10344 = arith.cmpi eq, %10341, %10306 : i64
      %10345 = arith.andi %10343, %10344 : i1
      %10346 = scf.if %10345 -> (i64) {
        scf.yield %10305 : i64
      } else {
        scf.yield %10341 : i64
      }
      %10347 = arith.cmpi ne, %10346, %10306 : i64
      scf.if %10347 {
        func.call @stack_push_pointer(%10346) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10073) : (i64) -> ()
        func.call @stack_push_pointer(%10199) : (i64) -> ()
        func.call @stack_push_pointer(%10263) : (i64) -> ()
        func.call @stack_push_pointer(%10275) : (i64) -> ()
        func.call @stack_push_pointer(%10282) : (i64) -> ()
        func.call @stack_push_pointer(%10286) : (i64) -> ()
        func.call @stack_push_pointer(%10293) : (i64) -> ()
        func.call @stack_push_pointer(%10305) : (i64) -> ()
        %10348 = llvm.mlir.addressof @str994 : !llvm.ptr
        %10349 = func.call @cc_make_function_ref_const(%10348) : (!llvm.ptr) -> i64
        %10350 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10349, %10350) : (i64, i64) -> ()
      }
      %10351 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10351 : i64
    }
    %__rlasp_stack_elide_zero_459 = arith.constant 0 : i64
    %10352 = arith.addi %10064, %__rlasp_stack_elide_zero_459 : i64
    %10353 = func.call @cc_multiple_value_list(%10352) : (i64) -> i64
    %10354 = llvm.mlir.addressof @str995 : !llvm.ptr
    %10355 = arith.constant 38 : i64
    %10356 = func.call @cc_make_string(%10354, %10355) : (!llvm.ptr, i64) -> i64
    %10357 = func.call @cc_nil_value() : () -> i64
    %10358 = func.call @cc_intern(%10356, %10357) : (i64, i64) -> i64
    %10359 = func.call @cc_nil_value() : () -> i64
    %10360 = func.call @cc_cons(%10358, %10359) : (i64, i64) -> i64
    %10361 = func.call @cc_values_pack(%10360) : (i64) -> i64
    %10362 = func.call @cc_symbol_value(%10358) : (i64) -> i64
    %10363 = llvm.mlir.addressof @str996 : !llvm.ptr
    %10364 = arith.constant 40 : i64
    %10365 = func.call @cc_make_string(%10363, %10364) : (!llvm.ptr, i64) -> i64
    %10366 = func.call @cc_nil_value() : () -> i64
    %10367 = func.call @cc_intern(%10365, %10366) : (i64, i64) -> i64
    %10368 = func.call @cc_nil_value() : () -> i64
    %10369 = func.call @cc_cons(%10367, %10368) : (i64, i64) -> i64
    %10370 = func.call @cc_values_pack(%10369) : (i64) -> i64
    %10371 = func.call @cc_symbol_value(%10367) : (i64) -> i64
    %10372 = func.call @cc_nil_value() : () -> i64
    %10373 = arith.cmpi ne, %10362, %10372 : i64
    %10374 = scf.if %10373 -> (i64) {
      scf.yield %10371 : i64
    } else {
      scf.yield %10353 : i64
    }
    %10375 = func.call @cc_values_pack(%10374) : (i64) -> i64
    func.call @stack_push_pointer(%10375) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077378"() {
    %352 = func.call @cc_nil_value() : () -> i64
    %353 = func.call @cc_nil_value() : () -> i64
    %354 = func.call @cc_errorp(%352) : (i64) -> i64
    %355 = arith.cmpi ne, %354, %353 : i64
    %356 = scf.if %355 -> (i64) {
      scf.yield %352 : i64
    } else {
      %357 = llvm.mlir.addressof @str39 : !llvm.ptr
      %358 = arith.constant 6 : i64
      %359 = func.call @cc_make_string(%357, %358) : (!llvm.ptr, i64) -> i64
      %360 = llvm.mlir.addressof @str40 : !llvm.ptr
      %361 = arith.constant 11 : i64
      %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
      %363 = func.call @cc_intern(%359, %362) : (i64, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_cons(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_values_pack(%365) : (i64) -> i64
      func.call @stack_push_pointer(%363) : (i64) -> ()
      %367 = llvm.mlir.addressof @str41 : !llvm.ptr
      %368 = arith.constant 6 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = llvm.mlir.addressof @str42 : !llvm.ptr
      %371 = arith.constant 11 : i64
      %372 = func.call @cc_make_string(%370, %371) : (!llvm.ptr, i64) -> i64
      %373 = func.call @cc_intern(%369, %372) : (i64, i64) -> i64
      %374 = func.call @cc_nil_value() : () -> i64
      %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
      %376 = func.call @cc_values_pack(%375) : (i64) -> i64
      %__rlasp_stack_elide_zero_460 = arith.constant 0 : i64
      %377 = arith.addi %373, %__rlasp_stack_elide_zero_460 : i64
      %378 = func.call @cc_nil_value() : () -> i64
      %379 = func.call @cc_errorp(%377) : (i64) -> i64
      %380 = arith.cmpi ne, %379, %378 : i64
      %381 = arith.cmpi eq, %378, %378 : i64
      %382 = arith.andi %380, %381 : i1
      %383 = scf.if %382 -> (i64) {
        scf.yield %377 : i64
      } else {
        scf.yield %378 : i64
      }
      %384 = arith.cmpi ne, %383, %378 : i64
      scf.if %384 {
        func.call @stack_push_pointer(%383) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%377) : (i64) -> ()
        %385 = llvm.mlir.addressof @str43 : !llvm.ptr
        %386 = func.call @cc_make_function_ref_const(%385) : (!llvm.ptr) -> i64
        %387 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%386, %387) : (i64, i64) -> ()
      }
      %388 = func.call @stack_pop_pointer() : () -> i64
      %389 = func.call @stack_pop_pointer() : () -> i64
      %390 = func.call @cc_subtypep(%389, %388) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_461 = arith.constant 0 : i64
      %391 = arith.addi %390, %__rlasp_stack_elide_zero_461 : i64
      %392 = func.call @cc_multiple_value_list(%391) : (i64) -> i64
      %393 = arith.constant 0 : i64
      %394 = func.call @cc_box_fixnum(%393) : (i64) -> i64
      %395 = func.call @cc_nth(%394, %392) : (i64, i64) -> i64
      %396 = arith.constant 1 : i64
      %397 = func.call @cc_box_fixnum(%396) : (i64) -> i64
      %398 = func.call @cc_nth(%397, %392) : (i64, i64) -> i64
      %399 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_462 = arith.constant 0 : i64
      %400 = arith.addi %395, %__rlasp_stack_elide_zero_462 : i64
      %__rlasp_stack_elide_zero_463 = arith.constant 0 : i64
      %401 = arith.addi %398, %__rlasp_stack_elide_zero_463 : i64
      %402 = func.call @cc_cons(%401, %399) : (i64, i64) -> i64
      %403 = func.call @cc_cons(%400, %402) : (i64, i64) -> i64
      %404 = func.call @cc_and(%403) : (i64) -> i64
      %__rlasp_stack_elide_zero_464 = arith.constant 0 : i64
      %405 = arith.addi %404, %__rlasp_stack_elide_zero_464 : i64
      %406 = func.call @cc_nil_value() : () -> i64
      %407 = func.call @cc_cons(%405, %406) : (i64, i64) -> i64
      %408 = func.call @cc_not(%407) : (i64) -> i64
      %__rlasp_stack_elide_zero_465 = arith.constant 0 : i64
      %409 = arith.addi %408, %__rlasp_stack_elide_zero_465 : i64
      %410 = func.call @cc_nil_value() : () -> i64
      %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
      %412 = func.call @cc_not(%411) : (i64) -> i64
      %__rlasp_stack_elide_zero_466 = arith.constant 0 : i64
      %413 = arith.addi %412, %__rlasp_stack_elide_zero_466 : i64
      scf.yield %413 : i64
    }
    func.call @stack_push_pointer(%356) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077379"() {
    %716 = func.call @cc_nil_value() : () -> i64
    %717 = func.call @cc_nil_value() : () -> i64
    %718 = func.call @cc_errorp(%716) : (i64) -> i64
    %719 = arith.cmpi ne, %718, %717 : i64
    %720 = scf.if %719 -> (i64) {
      scf.yield %716 : i64
    } else {
      %721 = llvm.mlir.addressof @str76 : !llvm.ptr
      %722 = arith.constant 6 : i64
      %723 = func.call @cc_make_string(%721, %722) : (!llvm.ptr, i64) -> i64
      %724 = llvm.mlir.addressof @str77 : !llvm.ptr
      %725 = arith.constant 11 : i64
      %726 = func.call @cc_make_string(%724, %725) : (!llvm.ptr, i64) -> i64
      %727 = func.call @cc_intern(%723, %726) : (i64, i64) -> i64
      %728 = func.call @cc_nil_value() : () -> i64
      %729 = func.call @cc_cons(%727, %728) : (i64, i64) -> i64
      %730 = func.call @cc_values_pack(%729) : (i64) -> i64
      %__rlasp_stack_elide_zero_467 = arith.constant 0 : i64
      %731 = arith.addi %727, %__rlasp_stack_elide_zero_467 : i64
      %732 = func.call @cc_nil_value() : () -> i64
      %733 = func.call @cc_errorp(%731) : (i64) -> i64
      %734 = arith.cmpi ne, %733, %732 : i64
      %735 = arith.cmpi eq, %732, %732 : i64
      %736 = arith.andi %734, %735 : i1
      %737 = scf.if %736 -> (i64) {
        scf.yield %731 : i64
      } else {
        scf.yield %732 : i64
      }
      %738 = arith.cmpi ne, %737, %732 : i64
      scf.if %738 {
        func.call @stack_push_pointer(%737) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%731) : (i64) -> ()
        %739 = llvm.mlir.addressof @str78 : !llvm.ptr
        %740 = func.call @cc_make_function_ref_const(%739) : (!llvm.ptr) -> i64
        %741 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%740, %741) : (i64, i64) -> ()
      }
      %742 = llvm.mlir.addressof @str79 : !llvm.ptr
      %743 = arith.constant 6 : i64
      %744 = func.call @cc_make_string(%742, %743) : (!llvm.ptr, i64) -> i64
      %745 = llvm.mlir.addressof @str80 : !llvm.ptr
      %746 = arith.constant 11 : i64
      %747 = func.call @cc_make_string(%745, %746) : (!llvm.ptr, i64) -> i64
      %748 = func.call @cc_intern(%744, %747) : (i64, i64) -> i64
      %749 = func.call @cc_nil_value() : () -> i64
      %750 = func.call @cc_cons(%748, %749) : (i64, i64) -> i64
      %751 = func.call @cc_values_pack(%750) : (i64) -> i64
      %__rlasp_stack_elide_zero_468 = arith.constant 0 : i64
      %752 = arith.addi %748, %__rlasp_stack_elide_zero_468 : i64
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @cc_subtypep(%753, %752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_469 = arith.constant 0 : i64
      %755 = arith.addi %754, %__rlasp_stack_elide_zero_469 : i64
      %756 = func.call @cc_multiple_value_list(%755) : (i64) -> i64
      %757 = arith.constant 0 : i64
      %758 = func.call @cc_box_fixnum(%757) : (i64) -> i64
      %759 = func.call @cc_nth(%758, %756) : (i64, i64) -> i64
      %760 = arith.constant 1 : i64
      %761 = func.call @cc_box_fixnum(%760) : (i64) -> i64
      %762 = func.call @cc_nth(%761, %756) : (i64, i64) -> i64
      %763 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_470 = arith.constant 0 : i64
      %764 = arith.addi %759, %__rlasp_stack_elide_zero_470 : i64
      %__rlasp_stack_elide_zero_471 = arith.constant 0 : i64
      %765 = arith.addi %762, %__rlasp_stack_elide_zero_471 : i64
      %766 = func.call @cc_cons(%765, %763) : (i64, i64) -> i64
      %767 = func.call @cc_cons(%764, %766) : (i64, i64) -> i64
      %768 = func.call @cc_and(%767) : (i64) -> i64
      %__rlasp_stack_elide_zero_472 = arith.constant 0 : i64
      %769 = arith.addi %768, %__rlasp_stack_elide_zero_472 : i64
      %770 = func.call @cc_nil_value() : () -> i64
      %771 = func.call @cc_cons(%769, %770) : (i64, i64) -> i64
      %772 = func.call @cc_not(%771) : (i64) -> i64
      %__rlasp_stack_elide_zero_473 = arith.constant 0 : i64
      %773 = arith.addi %772, %__rlasp_stack_elide_zero_473 : i64
      %774 = func.call @cc_nil_value() : () -> i64
      %775 = func.call @cc_cons(%773, %774) : (i64, i64) -> i64
      %776 = func.call @cc_not(%775) : (i64) -> i64
      %__rlasp_stack_elide_zero_474 = arith.constant 0 : i64
      %777 = arith.addi %776, %__rlasp_stack_elide_zero_474 : i64
      scf.yield %777 : i64
    }
    func.call @stack_push_pointer(%720) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077380"() {
    %1080 = func.call @cc_nil_value() : () -> i64
    %1081 = func.call @cc_nil_value() : () -> i64
    %1082 = func.call @cc_errorp(%1080) : (i64) -> i64
    %1083 = arith.cmpi ne, %1082, %1081 : i64
    %1084 = scf.if %1083 -> (i64) {
      scf.yield %1080 : i64
    } else {
      %1085 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1086 = arith.constant 6 : i64
      %1087 = func.call @cc_make_string(%1085, %1086) : (!llvm.ptr, i64) -> i64
      %1088 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1089 = arith.constant 11 : i64
      %1090 = func.call @cc_make_string(%1088, %1089) : (!llvm.ptr, i64) -> i64
      %1091 = func.call @cc_intern(%1087, %1090) : (i64, i64) -> i64
      %1092 = func.call @cc_nil_value() : () -> i64
      %1093 = func.call @cc_cons(%1091, %1092) : (i64, i64) -> i64
      %1094 = func.call @cc_values_pack(%1093) : (i64) -> i64
      func.call @stack_push_pointer(%1091) : (i64) -> ()
      %1095 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1096 = arith.constant 6 : i64
      %1097 = func.call @cc_make_string(%1095, %1096) : (!llvm.ptr, i64) -> i64
      %1098 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1099 = arith.constant 11 : i64
      %1100 = func.call @cc_make_string(%1098, %1099) : (!llvm.ptr, i64) -> i64
      %1101 = func.call @cc_intern(%1097, %1100) : (i64, i64) -> i64
      %1102 = func.call @cc_nil_value() : () -> i64
      %1103 = func.call @cc_cons(%1101, %1102) : (i64, i64) -> i64
      %1104 = func.call @cc_values_pack(%1103) : (i64) -> i64
      %__rlasp_stack_elide_zero_475 = arith.constant 0 : i64
      %1105 = arith.addi %1101, %__rlasp_stack_elide_zero_475 : i64
      %1106 = func.call @cc_nil_value() : () -> i64
      %1107 = func.call @cc_errorp(%1105) : (i64) -> i64
      %1108 = arith.cmpi ne, %1107, %1106 : i64
      %1109 = arith.cmpi eq, %1106, %1106 : i64
      %1110 = arith.andi %1108, %1109 : i1
      %1111 = scf.if %1110 -> (i64) {
        scf.yield %1105 : i64
      } else {
        scf.yield %1106 : i64
      }
      %1112 = arith.cmpi ne, %1111, %1106 : i64
      scf.if %1112 {
        func.call @stack_push_pointer(%1111) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1105) : (i64) -> ()
        %1113 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1114 = func.call @cc_make_function_ref_const(%1113) : (!llvm.ptr) -> i64
        %1115 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1114, %1115) : (i64, i64) -> ()
      }
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @stack_pop_pointer() : () -> i64
      %1118 = func.call @cc_subtypep(%1117, %1116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_476 = arith.constant 0 : i64
      %1119 = arith.addi %1118, %__rlasp_stack_elide_zero_476 : i64
      %1120 = func.call @cc_multiple_value_list(%1119) : (i64) -> i64
      %1121 = arith.constant 0 : i64
      %1122 = func.call @cc_box_fixnum(%1121) : (i64) -> i64
      %1123 = func.call @cc_nth(%1122, %1120) : (i64, i64) -> i64
      %1124 = arith.constant 1 : i64
      %1125 = func.call @cc_box_fixnum(%1124) : (i64) -> i64
      %1126 = func.call @cc_nth(%1125, %1120) : (i64, i64) -> i64
      %1127 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_477 = arith.constant 0 : i64
      %1128 = arith.addi %1123, %__rlasp_stack_elide_zero_477 : i64
      %__rlasp_stack_elide_zero_478 = arith.constant 0 : i64
      %1129 = arith.addi %1126, %__rlasp_stack_elide_zero_478 : i64
      %1130 = func.call @cc_cons(%1129, %1127) : (i64, i64) -> i64
      %1131 = func.call @cc_cons(%1128, %1130) : (i64, i64) -> i64
      %1132 = func.call @cc_and(%1131) : (i64) -> i64
      %__rlasp_stack_elide_zero_479 = arith.constant 0 : i64
      %1133 = arith.addi %1132, %__rlasp_stack_elide_zero_479 : i64
      %1134 = func.call @cc_nil_value() : () -> i64
      %1135 = func.call @cc_cons(%1133, %1134) : (i64, i64) -> i64
      %1136 = func.call @cc_not(%1135) : (i64) -> i64
      %__rlasp_stack_elide_zero_480 = arith.constant 0 : i64
      %1137 = arith.addi %1136, %__rlasp_stack_elide_zero_480 : i64
      %1138 = func.call @cc_nil_value() : () -> i64
      %1139 = func.call @cc_cons(%1137, %1138) : (i64, i64) -> i64
      %1140 = func.call @cc_not(%1139) : (i64) -> i64
      %__rlasp_stack_elide_zero_481 = arith.constant 0 : i64
      %1141 = arith.addi %1140, %__rlasp_stack_elide_zero_481 : i64
      scf.yield %1141 : i64
    }
    func.call @stack_push_pointer(%1084) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077381"() {
    %1444 = func.call @cc_nil_value() : () -> i64
    %1445 = func.call @cc_nil_value() : () -> i64
    %1446 = func.call @cc_errorp(%1444) : (i64) -> i64
    %1447 = arith.cmpi ne, %1446, %1445 : i64
    %1448 = scf.if %1447 -> (i64) {
      scf.yield %1444 : i64
    } else {
      %1449 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1450 = arith.constant 6 : i64
      %1451 = func.call @cc_make_string(%1449, %1450) : (!llvm.ptr, i64) -> i64
      %1452 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1453 = arith.constant 11 : i64
      %1454 = func.call @cc_make_string(%1452, %1453) : (!llvm.ptr, i64) -> i64
      %1455 = func.call @cc_intern(%1451, %1454) : (i64, i64) -> i64
      %1456 = func.call @cc_nil_value() : () -> i64
      %1457 = func.call @cc_cons(%1455, %1456) : (i64, i64) -> i64
      %1458 = func.call @cc_values_pack(%1457) : (i64) -> i64
      %__rlasp_stack_elide_zero_482 = arith.constant 0 : i64
      %1459 = arith.addi %1455, %__rlasp_stack_elide_zero_482 : i64
      %1460 = func.call @cc_nil_value() : () -> i64
      %1461 = func.call @cc_errorp(%1459) : (i64) -> i64
      %1462 = arith.cmpi ne, %1461, %1460 : i64
      %1463 = arith.cmpi eq, %1460, %1460 : i64
      %1464 = arith.andi %1462, %1463 : i1
      %1465 = scf.if %1464 -> (i64) {
        scf.yield %1459 : i64
      } else {
        scf.yield %1460 : i64
      }
      %1466 = arith.cmpi ne, %1465, %1460 : i64
      scf.if %1466 {
        func.call @stack_push_pointer(%1465) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1459) : (i64) -> ()
        %1467 = llvm.mlir.addressof @str152 : !llvm.ptr
        %1468 = func.call @cc_make_function_ref_const(%1467) : (!llvm.ptr) -> i64
        %1469 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1468, %1469) : (i64, i64) -> ()
      }
      %1470 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1471 = arith.constant 6 : i64
      %1472 = func.call @cc_make_string(%1470, %1471) : (!llvm.ptr, i64) -> i64
      %1473 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1474 = arith.constant 11 : i64
      %1475 = func.call @cc_make_string(%1473, %1474) : (!llvm.ptr, i64) -> i64
      %1476 = func.call @cc_intern(%1472, %1475) : (i64, i64) -> i64
      %1477 = func.call @cc_nil_value() : () -> i64
      %1478 = func.call @cc_cons(%1476, %1477) : (i64, i64) -> i64
      %1479 = func.call @cc_values_pack(%1478) : (i64) -> i64
      %__rlasp_stack_elide_zero_483 = arith.constant 0 : i64
      %1480 = arith.addi %1476, %__rlasp_stack_elide_zero_483 : i64
      %1481 = func.call @stack_pop_pointer() : () -> i64
      %1482 = func.call @cc_subtypep(%1481, %1480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_484 = arith.constant 0 : i64
      %1483 = arith.addi %1482, %__rlasp_stack_elide_zero_484 : i64
      %1484 = func.call @cc_multiple_value_list(%1483) : (i64) -> i64
      %1485 = arith.constant 0 : i64
      %1486 = func.call @cc_box_fixnum(%1485) : (i64) -> i64
      %1487 = func.call @cc_nth(%1486, %1484) : (i64, i64) -> i64
      %1488 = arith.constant 1 : i64
      %1489 = func.call @cc_box_fixnum(%1488) : (i64) -> i64
      %1490 = func.call @cc_nth(%1489, %1484) : (i64, i64) -> i64
      %1491 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_485 = arith.constant 0 : i64
      %1492 = arith.addi %1487, %__rlasp_stack_elide_zero_485 : i64
      %__rlasp_stack_elide_zero_486 = arith.constant 0 : i64
      %1493 = arith.addi %1490, %__rlasp_stack_elide_zero_486 : i64
      %1494 = func.call @cc_cons(%1493, %1491) : (i64, i64) -> i64
      %1495 = func.call @cc_cons(%1492, %1494) : (i64, i64) -> i64
      %1496 = func.call @cc_and(%1495) : (i64) -> i64
      %__rlasp_stack_elide_zero_487 = arith.constant 0 : i64
      %1497 = arith.addi %1496, %__rlasp_stack_elide_zero_487 : i64
      %1498 = func.call @cc_nil_value() : () -> i64
      %1499 = func.call @cc_cons(%1497, %1498) : (i64, i64) -> i64
      %1500 = func.call @cc_not(%1499) : (i64) -> i64
      %__rlasp_stack_elide_zero_488 = arith.constant 0 : i64
      %1501 = arith.addi %1500, %__rlasp_stack_elide_zero_488 : i64
      %1502 = func.call @cc_nil_value() : () -> i64
      %1503 = func.call @cc_cons(%1501, %1502) : (i64, i64) -> i64
      %1504 = func.call @cc_not(%1503) : (i64) -> i64
      %__rlasp_stack_elide_zero_489 = arith.constant 0 : i64
      %1505 = arith.addi %1504, %__rlasp_stack_elide_zero_489 : i64
      scf.yield %1505 : i64
    }
    func.call @stack_push_pointer(%1448) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077382"() {
    %1808 = func.call @cc_nil_value() : () -> i64
    %1809 = func.call @cc_nil_value() : () -> i64
    %1810 = func.call @cc_errorp(%1808) : (i64) -> i64
    %1811 = arith.cmpi ne, %1810, %1809 : i64
    %1812 = scf.if %1811 -> (i64) {
      scf.yield %1808 : i64
    } else {
      %1813 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1814 = arith.constant 10 : i64
      %1815 = func.call @cc_make_string(%1813, %1814) : (!llvm.ptr, i64) -> i64
      %1816 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1817 = arith.constant 11 : i64
      %1818 = func.call @cc_make_string(%1816, %1817) : (!llvm.ptr, i64) -> i64
      %1819 = func.call @cc_intern(%1815, %1818) : (i64, i64) -> i64
      %1820 = func.call @cc_nil_value() : () -> i64
      %1821 = func.call @cc_cons(%1819, %1820) : (i64, i64) -> i64
      %1822 = func.call @cc_values_pack(%1821) : (i64) -> i64
      func.call @stack_push_pointer(%1819) : (i64) -> ()
      %1823 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1824 = arith.constant 10 : i64
      %1825 = func.call @cc_make_string(%1823, %1824) : (!llvm.ptr, i64) -> i64
      %1826 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1827 = arith.constant 11 : i64
      %1828 = func.call @cc_make_string(%1826, %1827) : (!llvm.ptr, i64) -> i64
      %1829 = func.call @cc_intern(%1825, %1828) : (i64, i64) -> i64
      %1830 = func.call @cc_nil_value() : () -> i64
      %1831 = func.call @cc_cons(%1829, %1830) : (i64, i64) -> i64
      %1832 = func.call @cc_values_pack(%1831) : (i64) -> i64
      %__rlasp_stack_elide_zero_490 = arith.constant 0 : i64
      %1833 = arith.addi %1829, %__rlasp_stack_elide_zero_490 : i64
      %1834 = func.call @cc_nil_value() : () -> i64
      %1835 = func.call @cc_errorp(%1833) : (i64) -> i64
      %1836 = arith.cmpi ne, %1835, %1834 : i64
      %1837 = arith.cmpi eq, %1834, %1834 : i64
      %1838 = arith.andi %1836, %1837 : i1
      %1839 = scf.if %1838 -> (i64) {
        scf.yield %1833 : i64
      } else {
        scf.yield %1834 : i64
      }
      %1840 = arith.cmpi ne, %1839, %1834 : i64
      scf.if %1840 {
        func.call @stack_push_pointer(%1839) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1833) : (i64) -> ()
        %1841 = llvm.mlir.addressof @str191 : !llvm.ptr
        %1842 = func.call @cc_make_function_ref_const(%1841) : (!llvm.ptr) -> i64
        %1843 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1842, %1843) : (i64, i64) -> ()
      }
      %1844 = func.call @stack_pop_pointer() : () -> i64
      %1845 = func.call @stack_pop_pointer() : () -> i64
      %1846 = func.call @cc_subtypep(%1845, %1844) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_491 = arith.constant 0 : i64
      %1847 = arith.addi %1846, %__rlasp_stack_elide_zero_491 : i64
      %1848 = func.call @cc_multiple_value_list(%1847) : (i64) -> i64
      %1849 = arith.constant 0 : i64
      %1850 = func.call @cc_box_fixnum(%1849) : (i64) -> i64
      %1851 = func.call @cc_nth(%1850, %1848) : (i64, i64) -> i64
      %1852 = arith.constant 1 : i64
      %1853 = func.call @cc_box_fixnum(%1852) : (i64) -> i64
      %1854 = func.call @cc_nth(%1853, %1848) : (i64, i64) -> i64
      %1855 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_492 = arith.constant 0 : i64
      %1856 = arith.addi %1851, %__rlasp_stack_elide_zero_492 : i64
      %__rlasp_stack_elide_zero_493 = arith.constant 0 : i64
      %1857 = arith.addi %1854, %__rlasp_stack_elide_zero_493 : i64
      %1858 = func.call @cc_cons(%1857, %1855) : (i64, i64) -> i64
      %1859 = func.call @cc_cons(%1856, %1858) : (i64, i64) -> i64
      %1860 = func.call @cc_and(%1859) : (i64) -> i64
      %__rlasp_stack_elide_zero_494 = arith.constant 0 : i64
      %1861 = arith.addi %1860, %__rlasp_stack_elide_zero_494 : i64
      %1862 = func.call @cc_nil_value() : () -> i64
      %1863 = func.call @cc_cons(%1861, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_not(%1863) : (i64) -> i64
      %__rlasp_stack_elide_zero_495 = arith.constant 0 : i64
      %1865 = arith.addi %1864, %__rlasp_stack_elide_zero_495 : i64
      %1866 = func.call @cc_nil_value() : () -> i64
      %1867 = func.call @cc_cons(%1865, %1866) : (i64, i64) -> i64
      %1868 = func.call @cc_not(%1867) : (i64) -> i64
      %__rlasp_stack_elide_zero_496 = arith.constant 0 : i64
      %1869 = arith.addi %1868, %__rlasp_stack_elide_zero_496 : i64
      scf.yield %1869 : i64
    }
    func.call @stack_push_pointer(%1812) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077383"() {
    %2172 = func.call @cc_nil_value() : () -> i64
    %2173 = func.call @cc_nil_value() : () -> i64
    %2174 = func.call @cc_errorp(%2172) : (i64) -> i64
    %2175 = arith.cmpi ne, %2174, %2173 : i64
    %2176 = scf.if %2175 -> (i64) {
      scf.yield %2172 : i64
    } else {
      %2177 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2178 = arith.constant 10 : i64
      %2179 = func.call @cc_make_string(%2177, %2178) : (!llvm.ptr, i64) -> i64
      %2180 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2181 = arith.constant 11 : i64
      %2182 = func.call @cc_make_string(%2180, %2181) : (!llvm.ptr, i64) -> i64
      %2183 = func.call @cc_intern(%2179, %2182) : (i64, i64) -> i64
      %2184 = func.call @cc_nil_value() : () -> i64
      %2185 = func.call @cc_cons(%2183, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_values_pack(%2185) : (i64) -> i64
      %__rlasp_stack_elide_zero_497 = arith.constant 0 : i64
      %2187 = arith.addi %2183, %__rlasp_stack_elide_zero_497 : i64
      %2188 = func.call @cc_nil_value() : () -> i64
      %2189 = func.call @cc_errorp(%2187) : (i64) -> i64
      %2190 = arith.cmpi ne, %2189, %2188 : i64
      %2191 = arith.cmpi eq, %2188, %2188 : i64
      %2192 = arith.andi %2190, %2191 : i1
      %2193 = scf.if %2192 -> (i64) {
        scf.yield %2187 : i64
      } else {
        scf.yield %2188 : i64
      }
      %2194 = arith.cmpi ne, %2193, %2188 : i64
      scf.if %2194 {
        func.call @stack_push_pointer(%2193) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2187) : (i64) -> ()
        %2195 = llvm.mlir.addressof @str226 : !llvm.ptr
        %2196 = func.call @cc_make_function_ref_const(%2195) : (!llvm.ptr) -> i64
        %2197 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2196, %2197) : (i64, i64) -> ()
      }
      %2198 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2199 = arith.constant 10 : i64
      %2200 = func.call @cc_make_string(%2198, %2199) : (!llvm.ptr, i64) -> i64
      %2201 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2202 = arith.constant 11 : i64
      %2203 = func.call @cc_make_string(%2201, %2202) : (!llvm.ptr, i64) -> i64
      %2204 = func.call @cc_intern(%2200, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_nil_value() : () -> i64
      %2206 = func.call @cc_cons(%2204, %2205) : (i64, i64) -> i64
      %2207 = func.call @cc_values_pack(%2206) : (i64) -> i64
      %__rlasp_stack_elide_zero_498 = arith.constant 0 : i64
      %2208 = arith.addi %2204, %__rlasp_stack_elide_zero_498 : i64
      %2209 = func.call @stack_pop_pointer() : () -> i64
      %2210 = func.call @cc_subtypep(%2209, %2208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_499 = arith.constant 0 : i64
      %2211 = arith.addi %2210, %__rlasp_stack_elide_zero_499 : i64
      %2212 = func.call @cc_multiple_value_list(%2211) : (i64) -> i64
      %2213 = arith.constant 0 : i64
      %2214 = func.call @cc_box_fixnum(%2213) : (i64) -> i64
      %2215 = func.call @cc_nth(%2214, %2212) : (i64, i64) -> i64
      %2216 = arith.constant 1 : i64
      %2217 = func.call @cc_box_fixnum(%2216) : (i64) -> i64
      %2218 = func.call @cc_nth(%2217, %2212) : (i64, i64) -> i64
      %2219 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_500 = arith.constant 0 : i64
      %2220 = arith.addi %2215, %__rlasp_stack_elide_zero_500 : i64
      %__rlasp_stack_elide_zero_501 = arith.constant 0 : i64
      %2221 = arith.addi %2218, %__rlasp_stack_elide_zero_501 : i64
      %2222 = func.call @cc_cons(%2221, %2219) : (i64, i64) -> i64
      %2223 = func.call @cc_cons(%2220, %2222) : (i64, i64) -> i64
      %2224 = func.call @cc_and(%2223) : (i64) -> i64
      %__rlasp_stack_elide_zero_502 = arith.constant 0 : i64
      %2225 = arith.addi %2224, %__rlasp_stack_elide_zero_502 : i64
      %2226 = func.call @cc_nil_value() : () -> i64
      %2227 = func.call @cc_cons(%2225, %2226) : (i64, i64) -> i64
      %2228 = func.call @cc_not(%2227) : (i64) -> i64
      %__rlasp_stack_elide_zero_503 = arith.constant 0 : i64
      %2229 = arith.addi %2228, %__rlasp_stack_elide_zero_503 : i64
      %2230 = func.call @cc_nil_value() : () -> i64
      %2231 = func.call @cc_cons(%2229, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_not(%2231) : (i64) -> i64
      %__rlasp_stack_elide_zero_504 = arith.constant 0 : i64
      %2233 = arith.addi %2232, %__rlasp_stack_elide_zero_504 : i64
      scf.yield %2233 : i64
    }
    func.call @stack_push_pointer(%2176) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077384"() {
    %2536 = func.call @cc_nil_value() : () -> i64
    %2537 = func.call @cc_nil_value() : () -> i64
    %2538 = func.call @cc_errorp(%2536) : (i64) -> i64
    %2539 = arith.cmpi ne, %2538, %2537 : i64
    %2540 = scf.if %2539 -> (i64) {
      scf.yield %2536 : i64
    } else {
      %2541 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2542 = arith.constant 11 : i64
      %2543 = func.call @cc_make_string(%2541, %2542) : (!llvm.ptr, i64) -> i64
      %2544 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2545 = arith.constant 11 : i64
      %2546 = func.call @cc_make_string(%2544, %2545) : (!llvm.ptr, i64) -> i64
      %2547 = func.call @cc_intern(%2543, %2546) : (i64, i64) -> i64
      %2548 = func.call @cc_nil_value() : () -> i64
      %2549 = func.call @cc_cons(%2547, %2548) : (i64, i64) -> i64
      %2550 = func.call @cc_values_pack(%2549) : (i64) -> i64
      func.call @stack_push_pointer(%2547) : (i64) -> ()
      %2551 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2552 = arith.constant 11 : i64
      %2553 = func.call @cc_make_string(%2551, %2552) : (!llvm.ptr, i64) -> i64
      %2554 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2555 = arith.constant 11 : i64
      %2556 = func.call @cc_make_string(%2554, %2555) : (!llvm.ptr, i64) -> i64
      %2557 = func.call @cc_intern(%2553, %2556) : (i64, i64) -> i64
      %2558 = func.call @cc_nil_value() : () -> i64
      %2559 = func.call @cc_cons(%2557, %2558) : (i64, i64) -> i64
      %2560 = func.call @cc_values_pack(%2559) : (i64) -> i64
      %__rlasp_stack_elide_zero_505 = arith.constant 0 : i64
      %2561 = arith.addi %2557, %__rlasp_stack_elide_zero_505 : i64
      %2562 = func.call @cc_nil_value() : () -> i64
      %2563 = func.call @cc_errorp(%2561) : (i64) -> i64
      %2564 = arith.cmpi ne, %2563, %2562 : i64
      %2565 = arith.cmpi eq, %2562, %2562 : i64
      %2566 = arith.andi %2564, %2565 : i1
      %2567 = scf.if %2566 -> (i64) {
        scf.yield %2561 : i64
      } else {
        scf.yield %2562 : i64
      }
      %2568 = arith.cmpi ne, %2567, %2562 : i64
      scf.if %2568 {
        func.call @stack_push_pointer(%2567) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2561) : (i64) -> ()
        %2569 = llvm.mlir.addressof @str265 : !llvm.ptr
        %2570 = func.call @cc_make_function_ref_const(%2569) : (!llvm.ptr) -> i64
        %2571 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2570, %2571) : (i64, i64) -> ()
      }
      %2572 = func.call @stack_pop_pointer() : () -> i64
      %2573 = func.call @stack_pop_pointer() : () -> i64
      %2574 = func.call @cc_subtypep(%2573, %2572) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_506 = arith.constant 0 : i64
      %2575 = arith.addi %2574, %__rlasp_stack_elide_zero_506 : i64
      %2576 = func.call @cc_multiple_value_list(%2575) : (i64) -> i64
      %2577 = arith.constant 0 : i64
      %2578 = func.call @cc_box_fixnum(%2577) : (i64) -> i64
      %2579 = func.call @cc_nth(%2578, %2576) : (i64, i64) -> i64
      %2580 = arith.constant 1 : i64
      %2581 = func.call @cc_box_fixnum(%2580) : (i64) -> i64
      %2582 = func.call @cc_nth(%2581, %2576) : (i64, i64) -> i64
      %2583 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_507 = arith.constant 0 : i64
      %2584 = arith.addi %2579, %__rlasp_stack_elide_zero_507 : i64
      %__rlasp_stack_elide_zero_508 = arith.constant 0 : i64
      %2585 = arith.addi %2582, %__rlasp_stack_elide_zero_508 : i64
      %2586 = func.call @cc_cons(%2585, %2583) : (i64, i64) -> i64
      %2587 = func.call @cc_cons(%2584, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_and(%2587) : (i64) -> i64
      %__rlasp_stack_elide_zero_509 = arith.constant 0 : i64
      %2589 = arith.addi %2588, %__rlasp_stack_elide_zero_509 : i64
      %2590 = func.call @cc_nil_value() : () -> i64
      %2591 = func.call @cc_cons(%2589, %2590) : (i64, i64) -> i64
      %2592 = func.call @cc_not(%2591) : (i64) -> i64
      %__rlasp_stack_elide_zero_510 = arith.constant 0 : i64
      %2593 = arith.addi %2592, %__rlasp_stack_elide_zero_510 : i64
      %2594 = func.call @cc_nil_value() : () -> i64
      %2595 = func.call @cc_cons(%2593, %2594) : (i64, i64) -> i64
      %2596 = func.call @cc_not(%2595) : (i64) -> i64
      %__rlasp_stack_elide_zero_511 = arith.constant 0 : i64
      %2597 = arith.addi %2596, %__rlasp_stack_elide_zero_511 : i64
      scf.yield %2597 : i64
    }
    func.call @stack_push_pointer(%2540) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077385"() {
    %2900 = func.call @cc_nil_value() : () -> i64
    %2901 = func.call @cc_nil_value() : () -> i64
    %2902 = func.call @cc_errorp(%2900) : (i64) -> i64
    %2903 = arith.cmpi ne, %2902, %2901 : i64
    %2904 = scf.if %2903 -> (i64) {
      scf.yield %2900 : i64
    } else {
      %2905 = llvm.mlir.addressof @str298 : !llvm.ptr
      %2906 = arith.constant 11 : i64
      %2907 = func.call @cc_make_string(%2905, %2906) : (!llvm.ptr, i64) -> i64
      %2908 = llvm.mlir.addressof @str299 : !llvm.ptr
      %2909 = arith.constant 11 : i64
      %2910 = func.call @cc_make_string(%2908, %2909) : (!llvm.ptr, i64) -> i64
      %2911 = func.call @cc_intern(%2907, %2910) : (i64, i64) -> i64
      %2912 = func.call @cc_nil_value() : () -> i64
      %2913 = func.call @cc_cons(%2911, %2912) : (i64, i64) -> i64
      %2914 = func.call @cc_values_pack(%2913) : (i64) -> i64
      %__rlasp_stack_elide_zero_512 = arith.constant 0 : i64
      %2915 = arith.addi %2911, %__rlasp_stack_elide_zero_512 : i64
      %2916 = func.call @cc_nil_value() : () -> i64
      %2917 = func.call @cc_errorp(%2915) : (i64) -> i64
      %2918 = arith.cmpi ne, %2917, %2916 : i64
      %2919 = arith.cmpi eq, %2916, %2916 : i64
      %2920 = arith.andi %2918, %2919 : i1
      %2921 = scf.if %2920 -> (i64) {
        scf.yield %2915 : i64
      } else {
        scf.yield %2916 : i64
      }
      %2922 = arith.cmpi ne, %2921, %2916 : i64
      scf.if %2922 {
        func.call @stack_push_pointer(%2921) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2915) : (i64) -> ()
        %2923 = llvm.mlir.addressof @str300 : !llvm.ptr
        %2924 = func.call @cc_make_function_ref_const(%2923) : (!llvm.ptr) -> i64
        %2925 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2924, %2925) : (i64, i64) -> ()
      }
      %2926 = llvm.mlir.addressof @str301 : !llvm.ptr
      %2927 = arith.constant 11 : i64
      %2928 = func.call @cc_make_string(%2926, %2927) : (!llvm.ptr, i64) -> i64
      %2929 = llvm.mlir.addressof @str302 : !llvm.ptr
      %2930 = arith.constant 11 : i64
      %2931 = func.call @cc_make_string(%2929, %2930) : (!llvm.ptr, i64) -> i64
      %2932 = func.call @cc_intern(%2928, %2931) : (i64, i64) -> i64
      %2933 = func.call @cc_nil_value() : () -> i64
      %2934 = func.call @cc_cons(%2932, %2933) : (i64, i64) -> i64
      %2935 = func.call @cc_values_pack(%2934) : (i64) -> i64
      %__rlasp_stack_elide_zero_513 = arith.constant 0 : i64
      %2936 = arith.addi %2932, %__rlasp_stack_elide_zero_513 : i64
      %2937 = func.call @stack_pop_pointer() : () -> i64
      %2938 = func.call @cc_subtypep(%2937, %2936) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_514 = arith.constant 0 : i64
      %2939 = arith.addi %2938, %__rlasp_stack_elide_zero_514 : i64
      %2940 = func.call @cc_multiple_value_list(%2939) : (i64) -> i64
      %2941 = arith.constant 0 : i64
      %2942 = func.call @cc_box_fixnum(%2941) : (i64) -> i64
      %2943 = func.call @cc_nth(%2942, %2940) : (i64, i64) -> i64
      %2944 = arith.constant 1 : i64
      %2945 = func.call @cc_box_fixnum(%2944) : (i64) -> i64
      %2946 = func.call @cc_nth(%2945, %2940) : (i64, i64) -> i64
      %2947 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_515 = arith.constant 0 : i64
      %2948 = arith.addi %2943, %__rlasp_stack_elide_zero_515 : i64
      %__rlasp_stack_elide_zero_516 = arith.constant 0 : i64
      %2949 = arith.addi %2946, %__rlasp_stack_elide_zero_516 : i64
      %2950 = func.call @cc_cons(%2949, %2947) : (i64, i64) -> i64
      %2951 = func.call @cc_cons(%2948, %2950) : (i64, i64) -> i64
      %2952 = func.call @cc_and(%2951) : (i64) -> i64
      %__rlasp_stack_elide_zero_517 = arith.constant 0 : i64
      %2953 = arith.addi %2952, %__rlasp_stack_elide_zero_517 : i64
      %2954 = func.call @cc_nil_value() : () -> i64
      %2955 = func.call @cc_cons(%2953, %2954) : (i64, i64) -> i64
      %2956 = func.call @cc_not(%2955) : (i64) -> i64
      %__rlasp_stack_elide_zero_518 = arith.constant 0 : i64
      %2957 = arith.addi %2956, %__rlasp_stack_elide_zero_518 : i64
      %2958 = func.call @cc_nil_value() : () -> i64
      %2959 = func.call @cc_cons(%2957, %2958) : (i64, i64) -> i64
      %2960 = func.call @cc_not(%2959) : (i64) -> i64
      %__rlasp_stack_elide_zero_519 = arith.constant 0 : i64
      %2961 = arith.addi %2960, %__rlasp_stack_elide_zero_519 : i64
      scf.yield %2961 : i64
    }
    func.call @stack_push_pointer(%2904) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077386"() {
    %3157 = func.call @cc_nil_value() : () -> i64
    %3158 = func.call @cc_nil_value() : () -> i64
    %3159 = func.call @cc_errorp(%3157) : (i64) -> i64
    %3160 = arith.cmpi ne, %3159, %3158 : i64
    %3161 = scf.if %3160 -> (i64) {
      scf.yield %3157 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3162 = arith.constant 4 : i64
      %3163 = func.call @cc_box_fixnum(%3162) : (i64) -> i64
      %3164 = func.call @cc_make_vector(%3163) : (i64) -> i64
      %3165 = func.call @stack_pop_pointer() : () -> i64
      %3166 = arith.constant 3 : i64
      %3167 = func.call @cc_box_fixnum(%3166) : (i64) -> i64
      %3168 = func.call @cc_svset(%3164, %3167, %3165) : (i64, i64, i64) -> i64
      %3169 = func.call @stack_pop_pointer() : () -> i64
      %3170 = arith.constant 2 : i64
      %3171 = func.call @cc_box_fixnum(%3170) : (i64) -> i64
      %3172 = func.call @cc_svset(%3164, %3171, %3169) : (i64, i64, i64) -> i64
      %3173 = func.call @stack_pop_pointer() : () -> i64
      %3174 = arith.constant 1 : i64
      %3175 = func.call @cc_box_fixnum(%3174) : (i64) -> i64
      %3176 = func.call @cc_svset(%3164, %3175, %3173) : (i64, i64, i64) -> i64
      %3177 = func.call @stack_pop_pointer() : () -> i64
      %3178 = arith.constant 0 : i64
      %3179 = func.call @cc_box_fixnum(%3178) : (i64) -> i64
      %3180 = func.call @cc_svset(%3164, %3179, %3177) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_520 = arith.constant 0 : i64
      %3181 = arith.addi %3164, %__rlasp_stack_elide_zero_520 : i64
      %3182 = func.call @cc_type_of(%3181) : (i64) -> i64
      func.call @stack_push_pointer(%3182) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3183 = arith.constant 4 : i64
      %3184 = func.call @cc_box_fixnum(%3183) : (i64) -> i64
      %3185 = func.call @cc_make_vector(%3184) : (i64) -> i64
      %3186 = func.call @stack_pop_pointer() : () -> i64
      %3187 = arith.constant 3 : i64
      %3188 = func.call @cc_box_fixnum(%3187) : (i64) -> i64
      %3189 = func.call @cc_svset(%3185, %3188, %3186) : (i64, i64, i64) -> i64
      %3190 = func.call @stack_pop_pointer() : () -> i64
      %3191 = arith.constant 2 : i64
      %3192 = func.call @cc_box_fixnum(%3191) : (i64) -> i64
      %3193 = func.call @cc_svset(%3185, %3192, %3190) : (i64, i64, i64) -> i64
      %3194 = func.call @stack_pop_pointer() : () -> i64
      %3195 = arith.constant 1 : i64
      %3196 = func.call @cc_box_fixnum(%3195) : (i64) -> i64
      %3197 = func.call @cc_svset(%3185, %3196, %3194) : (i64, i64, i64) -> i64
      %3198 = func.call @stack_pop_pointer() : () -> i64
      %3199 = arith.constant 0 : i64
      %3200 = func.call @cc_box_fixnum(%3199) : (i64) -> i64
      %3201 = func.call @cc_svset(%3185, %3200, %3198) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_521 = arith.constant 0 : i64
      %3202 = arith.addi %3185, %__rlasp_stack_elide_zero_521 : i64
      %3203 = func.call @cc_class_of(%3202) : (i64) -> i64
      %__rlasp_stack_elide_zero_522 = arith.constant 0 : i64
      %3204 = arith.addi %3203, %__rlasp_stack_elide_zero_522 : i64
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @cc_subtypep(%3205, %3204) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_523 = arith.constant 0 : i64
      %3207 = arith.addi %3206, %__rlasp_stack_elide_zero_523 : i64
      scf.yield %3207 : i64
    }
    func.call @stack_push_pointer(%3161) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077387"() {
    %3395 = func.call @cc_nil_value() : () -> i64
    %3396 = func.call @cc_nil_value() : () -> i64
    %3397 = func.call @cc_errorp(%3395) : (i64) -> i64
    %3398 = arith.cmpi ne, %3397, %3396 : i64
    %3399 = scf.if %3398 -> (i64) {
      scf.yield %3395 : i64
    } else {
      %3400 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3401 = func.call @cc_make_function_ref_const(%3400) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_524 = arith.constant 0 : i64
      %3402 = arith.addi %3401, %__rlasp_stack_elide_zero_524 : i64
      %3403 = func.call @cc_type_of(%3402) : (i64) -> i64
      func.call @stack_push_pointer(%3403) : (i64) -> ()
      %3404 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3405 = arith.constant 8 : i64
      %3406 = func.call @cc_make_string(%3404, %3405) : (!llvm.ptr, i64) -> i64
      %3407 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3408 = arith.constant 11 : i64
      %3409 = func.call @cc_make_string(%3407, %3408) : (!llvm.ptr, i64) -> i64
      %3410 = func.call @cc_intern(%3406, %3409) : (i64, i64) -> i64
      %3411 = func.call @cc_nil_value() : () -> i64
      %3412 = func.call @cc_cons(%3410, %3411) : (i64, i64) -> i64
      %3413 = func.call @cc_values_pack(%3412) : (i64) -> i64
      %__rlasp_stack_elide_zero_525 = arith.constant 0 : i64
      %3414 = arith.addi %3410, %__rlasp_stack_elide_zero_525 : i64
      %3415 = func.call @stack_pop_pointer() : () -> i64
      %3416 = func.call @cc_subtypep(%3415, %3414) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_526 = arith.constant 0 : i64
      %3417 = arith.addi %3416, %__rlasp_stack_elide_zero_526 : i64
      scf.yield %3417 : i64
    }
    func.call @stack_push_pointer(%3399) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077388"() {
    %3725 = func.call @stack_pop_pointer() : () -> i64
    %3726 = func.call @stack_pop_pointer() : () -> i64
    %3727 = func.call @stack_pop_pointer() : () -> i64
    %3728 = func.call @stack_pop_pointer() : () -> i64
    %3729 = func.call @stack_pop_pointer() : () -> i64
    %3730 = func.call @stack_pop_pointer() : () -> i64
    %3731 = func.call @cc_nil_value() : () -> i64
    %3732 = func.call @cc_nil_value() : () -> i64
    %3733 = func.call @cc_errorp(%3731) : (i64) -> i64
    %3734 = arith.cmpi ne, %3733, %3732 : i64
    %3735 = scf.if %3734 -> (i64) {
      scf.yield %3731 : i64
    } else {
      %3736 = func.call @cc_nil_value() : () -> i64
      %3737 = func.call @cc_nil_value() : () -> i64
      %3738 = func.call @cc_errorp(%3736) : (i64) -> i64
      %3739 = arith.cmpi ne, %3738, %3737 : i64
      %3740 = scf.if %3739 -> (i64) {
        scf.yield %3736 : i64
      } else {
        %3741 = func.call @cc_symbol_value(%3730) : (i64) -> i64
        func.call @stack_push_pointer(%3741) : (i64) -> ()
        %3742 = func.call @cc_symbol_value(%3729) : (i64) -> i64
        func.call @stack_push_pointer(%3742) : (i64) -> ()
        %3743 = func.call @cc_symbol_value(%3728) : (i64) -> i64
        func.call @stack_push_pointer(%3743) : (i64) -> ()
        %3744 = func.call @cc_symbol_value(%3727) : (i64) -> i64
        func.call @stack_push_pointer(%3744) : (i64) -> ()
        %3745 = func.call @cc_symbol_value(%3726) : (i64) -> i64
        func.call @stack_push_pointer(%3745) : (i64) -> ()
        %3746 = func.call @cc_symbol_value(%3725) : (i64) -> i64
        func.call @stack_push_pointer(%3746) : (i64) -> ()
        %3747 = arith.constant 6 : i64
        %3748 = func.call @cc_box_fixnum(%3747) : (i64) -> i64
        %3749 = func.call @cc_make_vector(%3748) : (i64) -> i64
        %3750 = func.call @stack_pop_pointer() : () -> i64
        %3751 = arith.constant 5 : i64
        %3752 = func.call @cc_box_fixnum(%3751) : (i64) -> i64
        %3753 = func.call @cc_svset(%3749, %3752, %3750) : (i64, i64, i64) -> i64
        %3754 = func.call @stack_pop_pointer() : () -> i64
        %3755 = arith.constant 4 : i64
        %3756 = func.call @cc_box_fixnum(%3755) : (i64) -> i64
        %3757 = func.call @cc_svset(%3749, %3756, %3754) : (i64, i64, i64) -> i64
        %3758 = func.call @stack_pop_pointer() : () -> i64
        %3759 = arith.constant 3 : i64
        %3760 = func.call @cc_box_fixnum(%3759) : (i64) -> i64
        %3761 = func.call @cc_svset(%3749, %3760, %3758) : (i64, i64, i64) -> i64
        %3762 = func.call @stack_pop_pointer() : () -> i64
        %3763 = arith.constant 2 : i64
        %3764 = func.call @cc_box_fixnum(%3763) : (i64) -> i64
        %3765 = func.call @cc_svset(%3749, %3764, %3762) : (i64, i64, i64) -> i64
        %3766 = func.call @stack_pop_pointer() : () -> i64
        %3767 = arith.constant 1 : i64
        %3768 = func.call @cc_box_fixnum(%3767) : (i64) -> i64
        %3769 = func.call @cc_svset(%3749, %3768, %3766) : (i64, i64, i64) -> i64
        %3770 = func.call @stack_pop_pointer() : () -> i64
        %3771 = arith.constant 0 : i64
        %3772 = func.call @cc_box_fixnum(%3771) : (i64) -> i64
        %3773 = func.call @cc_svset(%3749, %3772, %3770) : (i64, i64, i64) -> i64
        func.call @stack_push_pointer(%3749) : (i64) -> ()
        %3774 = llvm.mlir.addressof @str363 : !llvm.ptr
        %3775 = arith.constant 12 : i64
        %3776 = func.call @cc_make_string(%3774, %3775) : (!llvm.ptr, i64) -> i64
        %3777 = llvm.mlir.addressof @str364 : !llvm.ptr
        %3778 = arith.constant 11 : i64
        %3779 = func.call @cc_make_string(%3777, %3778) : (!llvm.ptr, i64) -> i64
        %3780 = func.call @cc_intern(%3776, %3779) : (i64, i64) -> i64
        %3781 = func.call @cc_nil_value() : () -> i64
        %3782 = func.call @cc_cons(%3780, %3781) : (i64, i64) -> i64
        %3783 = func.call @cc_values_pack(%3782) : (i64) -> i64
        func.call @stack_push_pointer(%3780) : (i64) -> ()
        %3784 = llvm.mlir.addressof @str365 : !llvm.ptr
        %3785 = arith.constant 1 : i64
        %3786 = func.call @cc_make_string(%3784, %3785) : (!llvm.ptr, i64) -> i64
        %3787 = llvm.mlir.addressof @str366 : !llvm.ptr
        %3788 = arith.constant 11 : i64
        %3789 = func.call @cc_make_string(%3787, %3788) : (!llvm.ptr, i64) -> i64
        %3790 = func.call @cc_intern(%3786, %3789) : (i64, i64) -> i64
        %3791 = func.call @cc_nil_value() : () -> i64
        %3792 = func.call @cc_cons(%3790, %3791) : (i64, i64) -> i64
        %3793 = func.call @cc_values_pack(%3792) : (i64) -> i64
        func.call @stack_push_pointer(%3790) : (i64) -> ()
        %3794 = llvm.mlir.addressof @str367 : !llvm.ptr
        %3795 = arith.constant 1 : i64
        %3796 = func.call @cc_make_string(%3794, %3795) : (!llvm.ptr, i64) -> i64
        %3797 = llvm.mlir.addressof @str368 : !llvm.ptr
        %3798 = arith.constant 11 : i64
        %3799 = func.call @cc_make_string(%3797, %3798) : (!llvm.ptr, i64) -> i64
        %3800 = func.call @cc_intern(%3796, %3799) : (i64, i64) -> i64
        %3801 = func.call @cc_nil_value() : () -> i64
        %3802 = func.call @cc_cons(%3800, %3801) : (i64, i64) -> i64
        %3803 = func.call @cc_values_pack(%3802) : (i64) -> i64
        func.call @stack_push_pointer(%3800) : (i64) -> ()
        %3804 = arith.constant 2 : i64
        func.call @stack_push_fixnum(%3804) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %3805 = func.call @stack_pop_pointer() : () -> i64
        %3806 = func.call @stack_pop_pointer() : () -> i64
        %3807 = func.call @cc_cons(%3806, %3805) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_527 = arith.constant 0 : i64
        %3808 = arith.addi %3807, %__rlasp_stack_elide_zero_527 : i64
        %3809 = func.call @stack_pop_pointer() : () -> i64
        %3810 = func.call @cc_cons(%3809, %3808) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3810) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %3811 = func.call @stack_pop_pointer() : () -> i64
        %3812 = func.call @stack_pop_pointer() : () -> i64
        %3813 = func.call @cc_cons(%3812, %3811) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_528 = arith.constant 0 : i64
        %3814 = arith.addi %3813, %__rlasp_stack_elide_zero_528 : i64
        %3815 = func.call @stack_pop_pointer() : () -> i64
        %3816 = func.call @cc_cons(%3815, %3814) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_529 = arith.constant 0 : i64
        %3817 = arith.addi %3816, %__rlasp_stack_elide_zero_529 : i64
        %3818 = func.call @stack_pop_pointer() : () -> i64
        %3819 = func.call @cc_cons(%3818, %3817) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_530 = arith.constant 0 : i64
        %3820 = arith.addi %3819, %__rlasp_stack_elide_zero_530 : i64
        %3821 = func.call @stack_pop_pointer() : () -> i64
        %3822 = func.call @cc_typep(%3821, %3820) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_531 = arith.constant 0 : i64
        %3823 = arith.addi %3822, %__rlasp_stack_elide_zero_531 : i64
        scf.yield %3823 : i64
      }
      %__rlasp_stack_elide_zero_532 = arith.constant 0 : i64
      %3824 = arith.addi %3740, %__rlasp_stack_elide_zero_532 : i64
      %3825 = func.call @cc_nil_value() : () -> i64
      %3826 = func.call @cc_cons(%3824, %3825) : (i64, i64) -> i64
      %3827 = func.call @cc_not(%3826) : (i64) -> i64
      %__rlasp_stack_elide_zero_533 = arith.constant 0 : i64
      %3828 = arith.addi %3827, %__rlasp_stack_elide_zero_533 : i64
      %3829 = func.call @cc_nil_value() : () -> i64
      %3830 = func.call @cc_cons(%3828, %3829) : (i64, i64) -> i64
      %3831 = func.call @cc_not(%3830) : (i64) -> i64
      %__rlasp_stack_elide_zero_534 = arith.constant 0 : i64
      %3832 = arith.addi %3831, %__rlasp_stack_elide_zero_534 : i64
      scf.yield %3832 : i64
    }
    func.call @stack_push_pointer(%3735) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077395"() {
    %4159 = func.call @cc_nil_value() : () -> i64
    %4160 = func.call @cc_nil_value() : () -> i64
    %4161 = func.call @cc_errorp(%4159) : (i64) -> i64
    %4162 = arith.cmpi ne, %4161, %4160 : i64
    %4163 = scf.if %4162 -> (i64) {
      scf.yield %4159 : i64
    } else {
      %4164 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4165 = arith.constant 6 : i64
      %4166 = func.call @cc_make_string(%4164, %4165) : (!llvm.ptr, i64) -> i64
      %4167 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4168 = arith.constant 11 : i64
      %4169 = func.call @cc_make_string(%4167, %4168) : (!llvm.ptr, i64) -> i64
      %4170 = func.call @cc_intern(%4166, %4169) : (i64, i64) -> i64
      %4171 = func.call @cc_nil_value() : () -> i64
      %4172 = func.call @cc_cons(%4170, %4171) : (i64, i64) -> i64
      %4173 = func.call @cc_values_pack(%4172) : (i64) -> i64
      func.call @stack_push_pointer(%4170) : (i64) -> ()
      %4174 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4175 = arith.constant 6 : i64
      %4176 = func.call @cc_make_string(%4174, %4175) : (!llvm.ptr, i64) -> i64
      %4177 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4178 = arith.constant 11 : i64
      %4179 = func.call @cc_make_string(%4177, %4178) : (!llvm.ptr, i64) -> i64
      %4180 = func.call @cc_intern(%4176, %4179) : (i64, i64) -> i64
      %4181 = func.call @cc_nil_value() : () -> i64
      %4182 = func.call @cc_cons(%4180, %4181) : (i64, i64) -> i64
      %4183 = func.call @cc_values_pack(%4182) : (i64) -> i64
      %__rlasp_stack_elide_zero_535 = arith.constant 0 : i64
      %4184 = arith.addi %4180, %__rlasp_stack_elide_zero_535 : i64
      %4185 = func.call @cc_nil_value() : () -> i64
      %4186 = func.call @cc_errorp(%4184) : (i64) -> i64
      %4187 = arith.cmpi ne, %4186, %4185 : i64
      %4188 = arith.cmpi eq, %4185, %4185 : i64
      %4189 = arith.andi %4187, %4188 : i1
      %4190 = scf.if %4189 -> (i64) {
        scf.yield %4184 : i64
      } else {
        scf.yield %4185 : i64
      }
      %4191 = arith.cmpi ne, %4190, %4185 : i64
      scf.if %4191 {
        func.call @stack_push_pointer(%4190) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4184) : (i64) -> ()
        %4192 = llvm.mlir.addressof @str411 : !llvm.ptr
        %4193 = func.call @cc_make_function_ref_const(%4192) : (!llvm.ptr) -> i64
        %4194 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4193, %4194) : (i64, i64) -> ()
      }
      %4195 = func.call @stack_pop_pointer() : () -> i64
      %4196 = func.call @stack_pop_pointer() : () -> i64
      %4197 = func.call @cc_subtypep(%4196, %4195) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_536 = arith.constant 0 : i64
      %4198 = arith.addi %4197, %__rlasp_stack_elide_zero_536 : i64
      %4199 = func.call @cc_multiple_value_list(%4198) : (i64) -> i64
      %4200 = arith.constant 0 : i64
      %4201 = func.call @cc_box_fixnum(%4200) : (i64) -> i64
      %4202 = func.call @cc_nth(%4201, %4199) : (i64, i64) -> i64
      %4203 = arith.constant 1 : i64
      %4204 = func.call @cc_box_fixnum(%4203) : (i64) -> i64
      %4205 = func.call @cc_nth(%4204, %4199) : (i64, i64) -> i64
      %4206 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_537 = arith.constant 0 : i64
      %4207 = arith.addi %4202, %__rlasp_stack_elide_zero_537 : i64
      %__rlasp_stack_elide_zero_538 = arith.constant 0 : i64
      %4208 = arith.addi %4205, %__rlasp_stack_elide_zero_538 : i64
      %4209 = func.call @cc_cons(%4208, %4206) : (i64, i64) -> i64
      %4210 = func.call @cc_cons(%4207, %4209) : (i64, i64) -> i64
      %4211 = func.call @cc_and(%4210) : (i64) -> i64
      %__rlasp_stack_elide_zero_539 = arith.constant 0 : i64
      %4212 = arith.addi %4211, %__rlasp_stack_elide_zero_539 : i64
      %4213 = func.call @cc_nil_value() : () -> i64
      %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
      %4215 = func.call @cc_not(%4214) : (i64) -> i64
      %__rlasp_stack_elide_zero_540 = arith.constant 0 : i64
      %4216 = arith.addi %4215, %__rlasp_stack_elide_zero_540 : i64
      %4217 = func.call @cc_nil_value() : () -> i64
      %4218 = func.call @cc_cons(%4216, %4217) : (i64, i64) -> i64
      %4219 = func.call @cc_not(%4218) : (i64) -> i64
      %__rlasp_stack_elide_zero_541 = arith.constant 0 : i64
      %4220 = arith.addi %4219, %__rlasp_stack_elide_zero_541 : i64
      scf.yield %4220 : i64
    }
    func.call @stack_push_pointer(%4163) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077396"() {
    %4523 = func.call @cc_nil_value() : () -> i64
    %4524 = func.call @cc_nil_value() : () -> i64
    %4525 = func.call @cc_errorp(%4523) : (i64) -> i64
    %4526 = arith.cmpi ne, %4525, %4524 : i64
    %4527 = scf.if %4526 -> (i64) {
      scf.yield %4523 : i64
    } else {
      %4528 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4529 = arith.constant 6 : i64
      %4530 = func.call @cc_make_string(%4528, %4529) : (!llvm.ptr, i64) -> i64
      %4531 = llvm.mlir.addressof @str445 : !llvm.ptr
      %4532 = arith.constant 11 : i64
      %4533 = func.call @cc_make_string(%4531, %4532) : (!llvm.ptr, i64) -> i64
      %4534 = func.call @cc_intern(%4530, %4533) : (i64, i64) -> i64
      %4535 = func.call @cc_nil_value() : () -> i64
      %4536 = func.call @cc_cons(%4534, %4535) : (i64, i64) -> i64
      %4537 = func.call @cc_values_pack(%4536) : (i64) -> i64
      %__rlasp_stack_elide_zero_542 = arith.constant 0 : i64
      %4538 = arith.addi %4534, %__rlasp_stack_elide_zero_542 : i64
      %4539 = func.call @cc_nil_value() : () -> i64
      %4540 = func.call @cc_errorp(%4538) : (i64) -> i64
      %4541 = arith.cmpi ne, %4540, %4539 : i64
      %4542 = arith.cmpi eq, %4539, %4539 : i64
      %4543 = arith.andi %4541, %4542 : i1
      %4544 = scf.if %4543 -> (i64) {
        scf.yield %4538 : i64
      } else {
        scf.yield %4539 : i64
      }
      %4545 = arith.cmpi ne, %4544, %4539 : i64
      scf.if %4545 {
        func.call @stack_push_pointer(%4544) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4538) : (i64) -> ()
        %4546 = llvm.mlir.addressof @str446 : !llvm.ptr
        %4547 = func.call @cc_make_function_ref_const(%4546) : (!llvm.ptr) -> i64
        %4548 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4547, %4548) : (i64, i64) -> ()
      }
      %4549 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4550 = arith.constant 6 : i64
      %4551 = func.call @cc_make_string(%4549, %4550) : (!llvm.ptr, i64) -> i64
      %4552 = llvm.mlir.addressof @str448 : !llvm.ptr
      %4553 = arith.constant 11 : i64
      %4554 = func.call @cc_make_string(%4552, %4553) : (!llvm.ptr, i64) -> i64
      %4555 = func.call @cc_intern(%4551, %4554) : (i64, i64) -> i64
      %4556 = func.call @cc_nil_value() : () -> i64
      %4557 = func.call @cc_cons(%4555, %4556) : (i64, i64) -> i64
      %4558 = func.call @cc_values_pack(%4557) : (i64) -> i64
      %__rlasp_stack_elide_zero_543 = arith.constant 0 : i64
      %4559 = arith.addi %4555, %__rlasp_stack_elide_zero_543 : i64
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @cc_subtypep(%4560, %4559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_544 = arith.constant 0 : i64
      %4562 = arith.addi %4561, %__rlasp_stack_elide_zero_544 : i64
      %4563 = func.call @cc_multiple_value_list(%4562) : (i64) -> i64
      %4564 = arith.constant 0 : i64
      %4565 = func.call @cc_box_fixnum(%4564) : (i64) -> i64
      %4566 = func.call @cc_nth(%4565, %4563) : (i64, i64) -> i64
      %4567 = arith.constant 1 : i64
      %4568 = func.call @cc_box_fixnum(%4567) : (i64) -> i64
      %4569 = func.call @cc_nth(%4568, %4563) : (i64, i64) -> i64
      %4570 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_545 = arith.constant 0 : i64
      %4571 = arith.addi %4566, %__rlasp_stack_elide_zero_545 : i64
      %__rlasp_stack_elide_zero_546 = arith.constant 0 : i64
      %4572 = arith.addi %4569, %__rlasp_stack_elide_zero_546 : i64
      %4573 = func.call @cc_cons(%4572, %4570) : (i64, i64) -> i64
      %4574 = func.call @cc_cons(%4571, %4573) : (i64, i64) -> i64
      %4575 = func.call @cc_and(%4574) : (i64) -> i64
      %__rlasp_stack_elide_zero_547 = arith.constant 0 : i64
      %4576 = arith.addi %4575, %__rlasp_stack_elide_zero_547 : i64
      %4577 = func.call @cc_nil_value() : () -> i64
      %4578 = func.call @cc_cons(%4576, %4577) : (i64, i64) -> i64
      %4579 = func.call @cc_not(%4578) : (i64) -> i64
      %__rlasp_stack_elide_zero_548 = arith.constant 0 : i64
      %4580 = arith.addi %4579, %__rlasp_stack_elide_zero_548 : i64
      %4581 = func.call @cc_nil_value() : () -> i64
      %4582 = func.call @cc_cons(%4580, %4581) : (i64, i64) -> i64
      %4583 = func.call @cc_not(%4582) : (i64) -> i64
      %__rlasp_stack_elide_zero_549 = arith.constant 0 : i64
      %4584 = arith.addi %4583, %__rlasp_stack_elide_zero_549 : i64
      scf.yield %4584 : i64
    }
    func.call @stack_push_pointer(%4527) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077397"() {
    %4887 = func.call @cc_nil_value() : () -> i64
    %4888 = func.call @cc_nil_value() : () -> i64
    %4889 = func.call @cc_errorp(%4887) : (i64) -> i64
    %4890 = arith.cmpi ne, %4889, %4888 : i64
    %4891 = scf.if %4890 -> (i64) {
      scf.yield %4887 : i64
    } else {
      %4892 = llvm.mlir.addressof @str481 : !llvm.ptr
      %4893 = arith.constant 11 : i64
      %4894 = func.call @cc_make_string(%4892, %4893) : (!llvm.ptr, i64) -> i64
      %4895 = llvm.mlir.addressof @str482 : !llvm.ptr
      %4896 = arith.constant 11 : i64
      %4897 = func.call @cc_make_string(%4895, %4896) : (!llvm.ptr, i64) -> i64
      %4898 = func.call @cc_intern(%4894, %4897) : (i64, i64) -> i64
      %4899 = func.call @cc_nil_value() : () -> i64
      %4900 = func.call @cc_cons(%4898, %4899) : (i64, i64) -> i64
      %4901 = func.call @cc_values_pack(%4900) : (i64) -> i64
      func.call @stack_push_pointer(%4898) : (i64) -> ()
      %4902 = llvm.mlir.addressof @str483 : !llvm.ptr
      %4903 = arith.constant 11 : i64
      %4904 = func.call @cc_make_string(%4902, %4903) : (!llvm.ptr, i64) -> i64
      %4905 = llvm.mlir.addressof @str484 : !llvm.ptr
      %4906 = arith.constant 11 : i64
      %4907 = func.call @cc_make_string(%4905, %4906) : (!llvm.ptr, i64) -> i64
      %4908 = func.call @cc_intern(%4904, %4907) : (i64, i64) -> i64
      %4909 = func.call @cc_nil_value() : () -> i64
      %4910 = func.call @cc_cons(%4908, %4909) : (i64, i64) -> i64
      %4911 = func.call @cc_values_pack(%4910) : (i64) -> i64
      %__rlasp_stack_elide_zero_550 = arith.constant 0 : i64
      %4912 = arith.addi %4908, %__rlasp_stack_elide_zero_550 : i64
      %4913 = func.call @cc_nil_value() : () -> i64
      %4914 = func.call @cc_errorp(%4912) : (i64) -> i64
      %4915 = arith.cmpi ne, %4914, %4913 : i64
      %4916 = arith.cmpi eq, %4913, %4913 : i64
      %4917 = arith.andi %4915, %4916 : i1
      %4918 = scf.if %4917 -> (i64) {
        scf.yield %4912 : i64
      } else {
        scf.yield %4913 : i64
      }
      %4919 = arith.cmpi ne, %4918, %4913 : i64
      scf.if %4919 {
        func.call @stack_push_pointer(%4918) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4912) : (i64) -> ()
        %4920 = llvm.mlir.addressof @str485 : !llvm.ptr
        %4921 = func.call @cc_make_function_ref_const(%4920) : (!llvm.ptr) -> i64
        %4922 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4921, %4922) : (i64, i64) -> ()
      }
      %4923 = func.call @stack_pop_pointer() : () -> i64
      %4924 = func.call @stack_pop_pointer() : () -> i64
      %4925 = func.call @cc_subtypep(%4924, %4923) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_551 = arith.constant 0 : i64
      %4926 = arith.addi %4925, %__rlasp_stack_elide_zero_551 : i64
      %4927 = func.call @cc_multiple_value_list(%4926) : (i64) -> i64
      %4928 = arith.constant 0 : i64
      %4929 = func.call @cc_box_fixnum(%4928) : (i64) -> i64
      %4930 = func.call @cc_nth(%4929, %4927) : (i64, i64) -> i64
      %4931 = arith.constant 1 : i64
      %4932 = func.call @cc_box_fixnum(%4931) : (i64) -> i64
      %4933 = func.call @cc_nth(%4932, %4927) : (i64, i64) -> i64
      %4934 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_552 = arith.constant 0 : i64
      %4935 = arith.addi %4930, %__rlasp_stack_elide_zero_552 : i64
      %__rlasp_stack_elide_zero_553 = arith.constant 0 : i64
      %4936 = arith.addi %4933, %__rlasp_stack_elide_zero_553 : i64
      %4937 = func.call @cc_cons(%4936, %4934) : (i64, i64) -> i64
      %4938 = func.call @cc_cons(%4935, %4937) : (i64, i64) -> i64
      %4939 = func.call @cc_and(%4938) : (i64) -> i64
      %__rlasp_stack_elide_zero_554 = arith.constant 0 : i64
      %4940 = arith.addi %4939, %__rlasp_stack_elide_zero_554 : i64
      %4941 = func.call @cc_nil_value() : () -> i64
      %4942 = func.call @cc_cons(%4940, %4941) : (i64, i64) -> i64
      %4943 = func.call @cc_not(%4942) : (i64) -> i64
      %__rlasp_stack_elide_zero_555 = arith.constant 0 : i64
      %4944 = arith.addi %4943, %__rlasp_stack_elide_zero_555 : i64
      %4945 = func.call @cc_nil_value() : () -> i64
      %4946 = func.call @cc_cons(%4944, %4945) : (i64, i64) -> i64
      %4947 = func.call @cc_not(%4946) : (i64) -> i64
      %__rlasp_stack_elide_zero_556 = arith.constant 0 : i64
      %4948 = arith.addi %4947, %__rlasp_stack_elide_zero_556 : i64
      scf.yield %4948 : i64
    }
    func.call @stack_push_pointer(%4891) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077398"() {
    %5251 = func.call @cc_nil_value() : () -> i64
    %5252 = func.call @cc_nil_value() : () -> i64
    %5253 = func.call @cc_errorp(%5251) : (i64) -> i64
    %5254 = arith.cmpi ne, %5253, %5252 : i64
    %5255 = scf.if %5254 -> (i64) {
      scf.yield %5251 : i64
    } else {
      %5256 = llvm.mlir.addressof @str518 : !llvm.ptr
      %5257 = arith.constant 11 : i64
      %5258 = func.call @cc_make_string(%5256, %5257) : (!llvm.ptr, i64) -> i64
      %5259 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5260 = arith.constant 11 : i64
      %5261 = func.call @cc_make_string(%5259, %5260) : (!llvm.ptr, i64) -> i64
      %5262 = func.call @cc_intern(%5258, %5261) : (i64, i64) -> i64
      %5263 = func.call @cc_nil_value() : () -> i64
      %5264 = func.call @cc_cons(%5262, %5263) : (i64, i64) -> i64
      %5265 = func.call @cc_values_pack(%5264) : (i64) -> i64
      %__rlasp_stack_elide_zero_557 = arith.constant 0 : i64
      %5266 = arith.addi %5262, %__rlasp_stack_elide_zero_557 : i64
      %5267 = func.call @cc_nil_value() : () -> i64
      %5268 = func.call @cc_errorp(%5266) : (i64) -> i64
      %5269 = arith.cmpi ne, %5268, %5267 : i64
      %5270 = arith.cmpi eq, %5267, %5267 : i64
      %5271 = arith.andi %5269, %5270 : i1
      %5272 = scf.if %5271 -> (i64) {
        scf.yield %5266 : i64
      } else {
        scf.yield %5267 : i64
      }
      %5273 = arith.cmpi ne, %5272, %5267 : i64
      scf.if %5273 {
        func.call @stack_push_pointer(%5272) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5266) : (i64) -> ()
        %5274 = llvm.mlir.addressof @str520 : !llvm.ptr
        %5275 = func.call @cc_make_function_ref_const(%5274) : (!llvm.ptr) -> i64
        %5276 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5275, %5276) : (i64, i64) -> ()
      }
      %5277 = llvm.mlir.addressof @str521 : !llvm.ptr
      %5278 = arith.constant 11 : i64
      %5279 = func.call @cc_make_string(%5277, %5278) : (!llvm.ptr, i64) -> i64
      %5280 = llvm.mlir.addressof @str522 : !llvm.ptr
      %5281 = arith.constant 11 : i64
      %5282 = func.call @cc_make_string(%5280, %5281) : (!llvm.ptr, i64) -> i64
      %5283 = func.call @cc_intern(%5279, %5282) : (i64, i64) -> i64
      %5284 = func.call @cc_nil_value() : () -> i64
      %5285 = func.call @cc_cons(%5283, %5284) : (i64, i64) -> i64
      %5286 = func.call @cc_values_pack(%5285) : (i64) -> i64
      %__rlasp_stack_elide_zero_558 = arith.constant 0 : i64
      %5287 = arith.addi %5283, %__rlasp_stack_elide_zero_558 : i64
      %5288 = func.call @stack_pop_pointer() : () -> i64
      %5289 = func.call @cc_subtypep(%5288, %5287) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_559 = arith.constant 0 : i64
      %5290 = arith.addi %5289, %__rlasp_stack_elide_zero_559 : i64
      %5291 = func.call @cc_multiple_value_list(%5290) : (i64) -> i64
      %5292 = arith.constant 0 : i64
      %5293 = func.call @cc_box_fixnum(%5292) : (i64) -> i64
      %5294 = func.call @cc_nth(%5293, %5291) : (i64, i64) -> i64
      %5295 = arith.constant 1 : i64
      %5296 = func.call @cc_box_fixnum(%5295) : (i64) -> i64
      %5297 = func.call @cc_nth(%5296, %5291) : (i64, i64) -> i64
      %5298 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_560 = arith.constant 0 : i64
      %5299 = arith.addi %5294, %__rlasp_stack_elide_zero_560 : i64
      %__rlasp_stack_elide_zero_561 = arith.constant 0 : i64
      %5300 = arith.addi %5297, %__rlasp_stack_elide_zero_561 : i64
      %5301 = func.call @cc_cons(%5300, %5298) : (i64, i64) -> i64
      %5302 = func.call @cc_cons(%5299, %5301) : (i64, i64) -> i64
      %5303 = func.call @cc_and(%5302) : (i64) -> i64
      %__rlasp_stack_elide_zero_562 = arith.constant 0 : i64
      %5304 = arith.addi %5303, %__rlasp_stack_elide_zero_562 : i64
      %5305 = func.call @cc_nil_value() : () -> i64
      %5306 = func.call @cc_cons(%5304, %5305) : (i64, i64) -> i64
      %5307 = func.call @cc_not(%5306) : (i64) -> i64
      %__rlasp_stack_elide_zero_563 = arith.constant 0 : i64
      %5308 = arith.addi %5307, %__rlasp_stack_elide_zero_563 : i64
      %5309 = func.call @cc_nil_value() : () -> i64
      %5310 = func.call @cc_cons(%5308, %5309) : (i64, i64) -> i64
      %5311 = func.call @cc_not(%5310) : (i64) -> i64
      %__rlasp_stack_elide_zero_564 = arith.constant 0 : i64
      %5312 = arith.addi %5311, %__rlasp_stack_elide_zero_564 : i64
      scf.yield %5312 : i64
    }
    func.call @stack_push_pointer(%5255) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077399"() {
    %5615 = func.call @cc_nil_value() : () -> i64
    %5616 = func.call @cc_nil_value() : () -> i64
    %5617 = func.call @cc_errorp(%5615) : (i64) -> i64
    %5618 = arith.cmpi ne, %5617, %5616 : i64
    %5619 = scf.if %5618 -> (i64) {
      scf.yield %5615 : i64
    } else {
      %5620 = llvm.mlir.addressof @str555 : !llvm.ptr
      %5621 = arith.constant 13 : i64
      %5622 = func.call @cc_make_string(%5620, %5621) : (!llvm.ptr, i64) -> i64
      %5623 = llvm.mlir.addressof @str556 : !llvm.ptr
      %5624 = arith.constant 11 : i64
      %5625 = func.call @cc_make_string(%5623, %5624) : (!llvm.ptr, i64) -> i64
      %5626 = func.call @cc_intern(%5622, %5625) : (i64, i64) -> i64
      %5627 = func.call @cc_nil_value() : () -> i64
      %5628 = func.call @cc_cons(%5626, %5627) : (i64, i64) -> i64
      %5629 = func.call @cc_values_pack(%5628) : (i64) -> i64
      func.call @stack_push_pointer(%5626) : (i64) -> ()
      %5630 = llvm.mlir.addressof @str557 : !llvm.ptr
      %5631 = arith.constant 13 : i64
      %5632 = func.call @cc_make_string(%5630, %5631) : (!llvm.ptr, i64) -> i64
      %5633 = llvm.mlir.addressof @str558 : !llvm.ptr
      %5634 = arith.constant 11 : i64
      %5635 = func.call @cc_make_string(%5633, %5634) : (!llvm.ptr, i64) -> i64
      %5636 = func.call @cc_intern(%5632, %5635) : (i64, i64) -> i64
      %5637 = func.call @cc_nil_value() : () -> i64
      %5638 = func.call @cc_cons(%5636, %5637) : (i64, i64) -> i64
      %5639 = func.call @cc_values_pack(%5638) : (i64) -> i64
      %__rlasp_stack_elide_zero_565 = arith.constant 0 : i64
      %5640 = arith.addi %5636, %__rlasp_stack_elide_zero_565 : i64
      %5641 = func.call @cc_nil_value() : () -> i64
      %5642 = func.call @cc_errorp(%5640) : (i64) -> i64
      %5643 = arith.cmpi ne, %5642, %5641 : i64
      %5644 = arith.cmpi eq, %5641, %5641 : i64
      %5645 = arith.andi %5643, %5644 : i1
      %5646 = scf.if %5645 -> (i64) {
        scf.yield %5640 : i64
      } else {
        scf.yield %5641 : i64
      }
      %5647 = arith.cmpi ne, %5646, %5641 : i64
      scf.if %5647 {
        func.call @stack_push_pointer(%5646) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5640) : (i64) -> ()
        %5648 = llvm.mlir.addressof @str559 : !llvm.ptr
        %5649 = func.call @cc_make_function_ref_const(%5648) : (!llvm.ptr) -> i64
        %5650 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5649, %5650) : (i64, i64) -> ()
      }
      %5651 = func.call @stack_pop_pointer() : () -> i64
      %5652 = func.call @stack_pop_pointer() : () -> i64
      %5653 = func.call @cc_subtypep(%5652, %5651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_566 = arith.constant 0 : i64
      %5654 = arith.addi %5653, %__rlasp_stack_elide_zero_566 : i64
      %5655 = func.call @cc_multiple_value_list(%5654) : (i64) -> i64
      %5656 = arith.constant 0 : i64
      %5657 = func.call @cc_box_fixnum(%5656) : (i64) -> i64
      %5658 = func.call @cc_nth(%5657, %5655) : (i64, i64) -> i64
      %5659 = arith.constant 1 : i64
      %5660 = func.call @cc_box_fixnum(%5659) : (i64) -> i64
      %5661 = func.call @cc_nth(%5660, %5655) : (i64, i64) -> i64
      %5662 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_567 = arith.constant 0 : i64
      %5663 = arith.addi %5658, %__rlasp_stack_elide_zero_567 : i64
      %__rlasp_stack_elide_zero_568 = arith.constant 0 : i64
      %5664 = arith.addi %5661, %__rlasp_stack_elide_zero_568 : i64
      %5665 = func.call @cc_cons(%5664, %5662) : (i64, i64) -> i64
      %5666 = func.call @cc_cons(%5663, %5665) : (i64, i64) -> i64
      %5667 = func.call @cc_and(%5666) : (i64) -> i64
      %__rlasp_stack_elide_zero_569 = arith.constant 0 : i64
      %5668 = arith.addi %5667, %__rlasp_stack_elide_zero_569 : i64
      %5669 = func.call @cc_nil_value() : () -> i64
      %5670 = func.call @cc_cons(%5668, %5669) : (i64, i64) -> i64
      %5671 = func.call @cc_not(%5670) : (i64) -> i64
      %__rlasp_stack_elide_zero_570 = arith.constant 0 : i64
      %5672 = arith.addi %5671, %__rlasp_stack_elide_zero_570 : i64
      %5673 = func.call @cc_nil_value() : () -> i64
      %5674 = func.call @cc_cons(%5672, %5673) : (i64, i64) -> i64
      %5675 = func.call @cc_not(%5674) : (i64) -> i64
      %__rlasp_stack_elide_zero_571 = arith.constant 0 : i64
      %5676 = arith.addi %5675, %__rlasp_stack_elide_zero_571 : i64
      scf.yield %5676 : i64
    }
    func.call @stack_push_pointer(%5619) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077400"() {
    %5979 = func.call @cc_nil_value() : () -> i64
    %5980 = func.call @cc_nil_value() : () -> i64
    %5981 = func.call @cc_errorp(%5979) : (i64) -> i64
    %5982 = arith.cmpi ne, %5981, %5980 : i64
    %5983 = scf.if %5982 -> (i64) {
      scf.yield %5979 : i64
    } else {
      %5984 = llvm.mlir.addressof @str592 : !llvm.ptr
      %5985 = arith.constant 13 : i64
      %5986 = func.call @cc_make_string(%5984, %5985) : (!llvm.ptr, i64) -> i64
      %5987 = llvm.mlir.addressof @str593 : !llvm.ptr
      %5988 = arith.constant 11 : i64
      %5989 = func.call @cc_make_string(%5987, %5988) : (!llvm.ptr, i64) -> i64
      %5990 = func.call @cc_intern(%5986, %5989) : (i64, i64) -> i64
      %5991 = func.call @cc_nil_value() : () -> i64
      %5992 = func.call @cc_cons(%5990, %5991) : (i64, i64) -> i64
      %5993 = func.call @cc_values_pack(%5992) : (i64) -> i64
      %__rlasp_stack_elide_zero_572 = arith.constant 0 : i64
      %5994 = arith.addi %5990, %__rlasp_stack_elide_zero_572 : i64
      %5995 = func.call @cc_nil_value() : () -> i64
      %5996 = func.call @cc_errorp(%5994) : (i64) -> i64
      %5997 = arith.cmpi ne, %5996, %5995 : i64
      %5998 = arith.cmpi eq, %5995, %5995 : i64
      %5999 = arith.andi %5997, %5998 : i1
      %6000 = scf.if %5999 -> (i64) {
        scf.yield %5994 : i64
      } else {
        scf.yield %5995 : i64
      }
      %6001 = arith.cmpi ne, %6000, %5995 : i64
      scf.if %6001 {
        func.call @stack_push_pointer(%6000) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5994) : (i64) -> ()
        %6002 = llvm.mlir.addressof @str594 : !llvm.ptr
        %6003 = func.call @cc_make_function_ref_const(%6002) : (!llvm.ptr) -> i64
        %6004 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6003, %6004) : (i64, i64) -> ()
      }
      %6005 = llvm.mlir.addressof @str595 : !llvm.ptr
      %6006 = arith.constant 13 : i64
      %6007 = func.call @cc_make_string(%6005, %6006) : (!llvm.ptr, i64) -> i64
      %6008 = llvm.mlir.addressof @str596 : !llvm.ptr
      %6009 = arith.constant 11 : i64
      %6010 = func.call @cc_make_string(%6008, %6009) : (!llvm.ptr, i64) -> i64
      %6011 = func.call @cc_intern(%6007, %6010) : (i64, i64) -> i64
      %6012 = func.call @cc_nil_value() : () -> i64
      %6013 = func.call @cc_cons(%6011, %6012) : (i64, i64) -> i64
      %6014 = func.call @cc_values_pack(%6013) : (i64) -> i64
      %__rlasp_stack_elide_zero_573 = arith.constant 0 : i64
      %6015 = arith.addi %6011, %__rlasp_stack_elide_zero_573 : i64
      %6016 = func.call @stack_pop_pointer() : () -> i64
      %6017 = func.call @cc_subtypep(%6016, %6015) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_574 = arith.constant 0 : i64
      %6018 = arith.addi %6017, %__rlasp_stack_elide_zero_574 : i64
      %6019 = func.call @cc_multiple_value_list(%6018) : (i64) -> i64
      %6020 = arith.constant 0 : i64
      %6021 = func.call @cc_box_fixnum(%6020) : (i64) -> i64
      %6022 = func.call @cc_nth(%6021, %6019) : (i64, i64) -> i64
      %6023 = arith.constant 1 : i64
      %6024 = func.call @cc_box_fixnum(%6023) : (i64) -> i64
      %6025 = func.call @cc_nth(%6024, %6019) : (i64, i64) -> i64
      %6026 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_575 = arith.constant 0 : i64
      %6027 = arith.addi %6022, %__rlasp_stack_elide_zero_575 : i64
      %__rlasp_stack_elide_zero_576 = arith.constant 0 : i64
      %6028 = arith.addi %6025, %__rlasp_stack_elide_zero_576 : i64
      %6029 = func.call @cc_cons(%6028, %6026) : (i64, i64) -> i64
      %6030 = func.call @cc_cons(%6027, %6029) : (i64, i64) -> i64
      %6031 = func.call @cc_and(%6030) : (i64) -> i64
      %__rlasp_stack_elide_zero_577 = arith.constant 0 : i64
      %6032 = arith.addi %6031, %__rlasp_stack_elide_zero_577 : i64
      %6033 = func.call @cc_nil_value() : () -> i64
      %6034 = func.call @cc_cons(%6032, %6033) : (i64, i64) -> i64
      %6035 = func.call @cc_not(%6034) : (i64) -> i64
      %__rlasp_stack_elide_zero_578 = arith.constant 0 : i64
      %6036 = arith.addi %6035, %__rlasp_stack_elide_zero_578 : i64
      %6037 = func.call @cc_nil_value() : () -> i64
      %6038 = func.call @cc_cons(%6036, %6037) : (i64, i64) -> i64
      %6039 = func.call @cc_not(%6038) : (i64) -> i64
      %__rlasp_stack_elide_zero_579 = arith.constant 0 : i64
      %6040 = arith.addi %6039, %__rlasp_stack_elide_zero_579 : i64
      scf.yield %6040 : i64
    }
    func.call @stack_push_pointer(%5983) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077401"() {
    %6343 = func.call @cc_nil_value() : () -> i64
    %6344 = func.call @cc_nil_value() : () -> i64
    %6345 = func.call @cc_errorp(%6343) : (i64) -> i64
    %6346 = arith.cmpi ne, %6345, %6344 : i64
    %6347 = scf.if %6346 -> (i64) {
      scf.yield %6343 : i64
    } else {
      %6348 = llvm.mlir.addressof @str629 : !llvm.ptr
      %6349 = arith.constant 18 : i64
      %6350 = func.call @cc_make_string(%6348, %6349) : (!llvm.ptr, i64) -> i64
      %6351 = llvm.mlir.addressof @str630 : !llvm.ptr
      %6352 = arith.constant 11 : i64
      %6353 = func.call @cc_make_string(%6351, %6352) : (!llvm.ptr, i64) -> i64
      %6354 = func.call @cc_intern(%6350, %6353) : (i64, i64) -> i64
      %6355 = func.call @cc_nil_value() : () -> i64
      %6356 = func.call @cc_cons(%6354, %6355) : (i64, i64) -> i64
      %6357 = func.call @cc_values_pack(%6356) : (i64) -> i64
      func.call @stack_push_pointer(%6354) : (i64) -> ()
      %6358 = llvm.mlir.addressof @str631 : !llvm.ptr
      %6359 = arith.constant 18 : i64
      %6360 = func.call @cc_make_string(%6358, %6359) : (!llvm.ptr, i64) -> i64
      %6361 = llvm.mlir.addressof @str632 : !llvm.ptr
      %6362 = arith.constant 11 : i64
      %6363 = func.call @cc_make_string(%6361, %6362) : (!llvm.ptr, i64) -> i64
      %6364 = func.call @cc_intern(%6360, %6363) : (i64, i64) -> i64
      %6365 = func.call @cc_nil_value() : () -> i64
      %6366 = func.call @cc_cons(%6364, %6365) : (i64, i64) -> i64
      %6367 = func.call @cc_values_pack(%6366) : (i64) -> i64
      %__rlasp_stack_elide_zero_580 = arith.constant 0 : i64
      %6368 = arith.addi %6364, %__rlasp_stack_elide_zero_580 : i64
      %6369 = func.call @cc_nil_value() : () -> i64
      %6370 = func.call @cc_errorp(%6368) : (i64) -> i64
      %6371 = arith.cmpi ne, %6370, %6369 : i64
      %6372 = arith.cmpi eq, %6369, %6369 : i64
      %6373 = arith.andi %6371, %6372 : i1
      %6374 = scf.if %6373 -> (i64) {
        scf.yield %6368 : i64
      } else {
        scf.yield %6369 : i64
      }
      %6375 = arith.cmpi ne, %6374, %6369 : i64
      scf.if %6375 {
        func.call @stack_push_pointer(%6374) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6368) : (i64) -> ()
        %6376 = llvm.mlir.addressof @str633 : !llvm.ptr
        %6377 = func.call @cc_make_function_ref_const(%6376) : (!llvm.ptr) -> i64
        %6378 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6377, %6378) : (i64, i64) -> ()
      }
      %6379 = func.call @stack_pop_pointer() : () -> i64
      %6380 = func.call @stack_pop_pointer() : () -> i64
      %6381 = func.call @cc_subtypep(%6380, %6379) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_581 = arith.constant 0 : i64
      %6382 = arith.addi %6381, %__rlasp_stack_elide_zero_581 : i64
      %6383 = func.call @cc_multiple_value_list(%6382) : (i64) -> i64
      %6384 = arith.constant 0 : i64
      %6385 = func.call @cc_box_fixnum(%6384) : (i64) -> i64
      %6386 = func.call @cc_nth(%6385, %6383) : (i64, i64) -> i64
      %6387 = arith.constant 1 : i64
      %6388 = func.call @cc_box_fixnum(%6387) : (i64) -> i64
      %6389 = func.call @cc_nth(%6388, %6383) : (i64, i64) -> i64
      %6390 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_582 = arith.constant 0 : i64
      %6391 = arith.addi %6386, %__rlasp_stack_elide_zero_582 : i64
      %__rlasp_stack_elide_zero_583 = arith.constant 0 : i64
      %6392 = arith.addi %6389, %__rlasp_stack_elide_zero_583 : i64
      %6393 = func.call @cc_cons(%6392, %6390) : (i64, i64) -> i64
      %6394 = func.call @cc_cons(%6391, %6393) : (i64, i64) -> i64
      %6395 = func.call @cc_and(%6394) : (i64) -> i64
      %__rlasp_stack_elide_zero_584 = arith.constant 0 : i64
      %6396 = arith.addi %6395, %__rlasp_stack_elide_zero_584 : i64
      %6397 = func.call @cc_nil_value() : () -> i64
      %6398 = func.call @cc_cons(%6396, %6397) : (i64, i64) -> i64
      %6399 = func.call @cc_not(%6398) : (i64) -> i64
      %__rlasp_stack_elide_zero_585 = arith.constant 0 : i64
      %6400 = arith.addi %6399, %__rlasp_stack_elide_zero_585 : i64
      %6401 = func.call @cc_nil_value() : () -> i64
      %6402 = func.call @cc_cons(%6400, %6401) : (i64, i64) -> i64
      %6403 = func.call @cc_not(%6402) : (i64) -> i64
      %__rlasp_stack_elide_zero_586 = arith.constant 0 : i64
      %6404 = arith.addi %6403, %__rlasp_stack_elide_zero_586 : i64
      scf.yield %6404 : i64
    }
    func.call @stack_push_pointer(%6347) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077402"() {
    %6707 = func.call @cc_nil_value() : () -> i64
    %6708 = func.call @cc_nil_value() : () -> i64
    %6709 = func.call @cc_errorp(%6707) : (i64) -> i64
    %6710 = arith.cmpi ne, %6709, %6708 : i64
    %6711 = scf.if %6710 -> (i64) {
      scf.yield %6707 : i64
    } else {
      %6712 = llvm.mlir.addressof @str666 : !llvm.ptr
      %6713 = arith.constant 18 : i64
      %6714 = func.call @cc_make_string(%6712, %6713) : (!llvm.ptr, i64) -> i64
      %6715 = llvm.mlir.addressof @str667 : !llvm.ptr
      %6716 = arith.constant 11 : i64
      %6717 = func.call @cc_make_string(%6715, %6716) : (!llvm.ptr, i64) -> i64
      %6718 = func.call @cc_intern(%6714, %6717) : (i64, i64) -> i64
      %6719 = func.call @cc_nil_value() : () -> i64
      %6720 = func.call @cc_cons(%6718, %6719) : (i64, i64) -> i64
      %6721 = func.call @cc_values_pack(%6720) : (i64) -> i64
      %__rlasp_stack_elide_zero_587 = arith.constant 0 : i64
      %6722 = arith.addi %6718, %__rlasp_stack_elide_zero_587 : i64
      %6723 = func.call @cc_nil_value() : () -> i64
      %6724 = func.call @cc_errorp(%6722) : (i64) -> i64
      %6725 = arith.cmpi ne, %6724, %6723 : i64
      %6726 = arith.cmpi eq, %6723, %6723 : i64
      %6727 = arith.andi %6725, %6726 : i1
      %6728 = scf.if %6727 -> (i64) {
        scf.yield %6722 : i64
      } else {
        scf.yield %6723 : i64
      }
      %6729 = arith.cmpi ne, %6728, %6723 : i64
      scf.if %6729 {
        func.call @stack_push_pointer(%6728) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6722) : (i64) -> ()
        %6730 = llvm.mlir.addressof @str668 : !llvm.ptr
        %6731 = func.call @cc_make_function_ref_const(%6730) : (!llvm.ptr) -> i64
        %6732 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6731, %6732) : (i64, i64) -> ()
      }
      %6733 = llvm.mlir.addressof @str669 : !llvm.ptr
      %6734 = arith.constant 18 : i64
      %6735 = func.call @cc_make_string(%6733, %6734) : (!llvm.ptr, i64) -> i64
      %6736 = llvm.mlir.addressof @str670 : !llvm.ptr
      %6737 = arith.constant 11 : i64
      %6738 = func.call @cc_make_string(%6736, %6737) : (!llvm.ptr, i64) -> i64
      %6739 = func.call @cc_intern(%6735, %6738) : (i64, i64) -> i64
      %6740 = func.call @cc_nil_value() : () -> i64
      %6741 = func.call @cc_cons(%6739, %6740) : (i64, i64) -> i64
      %6742 = func.call @cc_values_pack(%6741) : (i64) -> i64
      %__rlasp_stack_elide_zero_588 = arith.constant 0 : i64
      %6743 = arith.addi %6739, %__rlasp_stack_elide_zero_588 : i64
      %6744 = func.call @stack_pop_pointer() : () -> i64
      %6745 = func.call @cc_subtypep(%6744, %6743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_589 = arith.constant 0 : i64
      %6746 = arith.addi %6745, %__rlasp_stack_elide_zero_589 : i64
      %6747 = func.call @cc_multiple_value_list(%6746) : (i64) -> i64
      %6748 = arith.constant 0 : i64
      %6749 = func.call @cc_box_fixnum(%6748) : (i64) -> i64
      %6750 = func.call @cc_nth(%6749, %6747) : (i64, i64) -> i64
      %6751 = arith.constant 1 : i64
      %6752 = func.call @cc_box_fixnum(%6751) : (i64) -> i64
      %6753 = func.call @cc_nth(%6752, %6747) : (i64, i64) -> i64
      %6754 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_590 = arith.constant 0 : i64
      %6755 = arith.addi %6750, %__rlasp_stack_elide_zero_590 : i64
      %__rlasp_stack_elide_zero_591 = arith.constant 0 : i64
      %6756 = arith.addi %6753, %__rlasp_stack_elide_zero_591 : i64
      %6757 = func.call @cc_cons(%6756, %6754) : (i64, i64) -> i64
      %6758 = func.call @cc_cons(%6755, %6757) : (i64, i64) -> i64
      %6759 = func.call @cc_and(%6758) : (i64) -> i64
      %__rlasp_stack_elide_zero_592 = arith.constant 0 : i64
      %6760 = arith.addi %6759, %__rlasp_stack_elide_zero_592 : i64
      %6761 = func.call @cc_nil_value() : () -> i64
      %6762 = func.call @cc_cons(%6760, %6761) : (i64, i64) -> i64
      %6763 = func.call @cc_not(%6762) : (i64) -> i64
      %__rlasp_stack_elide_zero_593 = arith.constant 0 : i64
      %6764 = arith.addi %6763, %__rlasp_stack_elide_zero_593 : i64
      %6765 = func.call @cc_nil_value() : () -> i64
      %6766 = func.call @cc_cons(%6764, %6765) : (i64, i64) -> i64
      %6767 = func.call @cc_not(%6766) : (i64) -> i64
      %__rlasp_stack_elide_zero_594 = arith.constant 0 : i64
      %6768 = arith.addi %6767, %__rlasp_stack_elide_zero_594 : i64
      scf.yield %6768 : i64
    }
    func.call @stack_push_pointer(%6711) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077403"() {
    %7071 = func.call @cc_nil_value() : () -> i64
    %7072 = func.call @cc_nil_value() : () -> i64
    %7073 = func.call @cc_errorp(%7071) : (i64) -> i64
    %7074 = arith.cmpi ne, %7073, %7072 : i64
    %7075 = scf.if %7074 -> (i64) {
      scf.yield %7071 : i64
    } else {
      %7076 = llvm.mlir.addressof @str703 : !llvm.ptr
      %7077 = arith.constant 10 : i64
      %7078 = func.call @cc_make_string(%7076, %7077) : (!llvm.ptr, i64) -> i64
      %7079 = llvm.mlir.addressof @str704 : !llvm.ptr
      %7080 = arith.constant 11 : i64
      %7081 = func.call @cc_make_string(%7079, %7080) : (!llvm.ptr, i64) -> i64
      %7082 = func.call @cc_intern(%7078, %7081) : (i64, i64) -> i64
      %7083 = func.call @cc_nil_value() : () -> i64
      %7084 = func.call @cc_cons(%7082, %7083) : (i64, i64) -> i64
      %7085 = func.call @cc_values_pack(%7084) : (i64) -> i64
      func.call @stack_push_pointer(%7082) : (i64) -> ()
      %7086 = llvm.mlir.addressof @str705 : !llvm.ptr
      %7087 = arith.constant 10 : i64
      %7088 = func.call @cc_make_string(%7086, %7087) : (!llvm.ptr, i64) -> i64
      %7089 = llvm.mlir.addressof @str706 : !llvm.ptr
      %7090 = arith.constant 11 : i64
      %7091 = func.call @cc_make_string(%7089, %7090) : (!llvm.ptr, i64) -> i64
      %7092 = func.call @cc_intern(%7088, %7091) : (i64, i64) -> i64
      %7093 = func.call @cc_nil_value() : () -> i64
      %7094 = func.call @cc_cons(%7092, %7093) : (i64, i64) -> i64
      %7095 = func.call @cc_values_pack(%7094) : (i64) -> i64
      %__rlasp_stack_elide_zero_595 = arith.constant 0 : i64
      %7096 = arith.addi %7092, %__rlasp_stack_elide_zero_595 : i64
      %7097 = func.call @cc_nil_value() : () -> i64
      %7098 = func.call @cc_errorp(%7096) : (i64) -> i64
      %7099 = arith.cmpi ne, %7098, %7097 : i64
      %7100 = arith.cmpi eq, %7097, %7097 : i64
      %7101 = arith.andi %7099, %7100 : i1
      %7102 = scf.if %7101 -> (i64) {
        scf.yield %7096 : i64
      } else {
        scf.yield %7097 : i64
      }
      %7103 = arith.cmpi ne, %7102, %7097 : i64
      scf.if %7103 {
        func.call @stack_push_pointer(%7102) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7096) : (i64) -> ()
        %7104 = llvm.mlir.addressof @str707 : !llvm.ptr
        %7105 = func.call @cc_make_function_ref_const(%7104) : (!llvm.ptr) -> i64
        %7106 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%7105, %7106) : (i64, i64) -> ()
      }
      %7107 = func.call @stack_pop_pointer() : () -> i64
      %7108 = func.call @stack_pop_pointer() : () -> i64
      %7109 = func.call @cc_subtypep(%7108, %7107) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_596 = arith.constant 0 : i64
      %7110 = arith.addi %7109, %__rlasp_stack_elide_zero_596 : i64
      %7111 = func.call @cc_multiple_value_list(%7110) : (i64) -> i64
      %7112 = arith.constant 0 : i64
      %7113 = func.call @cc_box_fixnum(%7112) : (i64) -> i64
      %7114 = func.call @cc_nth(%7113, %7111) : (i64, i64) -> i64
      %7115 = arith.constant 1 : i64
      %7116 = func.call @cc_box_fixnum(%7115) : (i64) -> i64
      %7117 = func.call @cc_nth(%7116, %7111) : (i64, i64) -> i64
      %7118 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_597 = arith.constant 0 : i64
      %7119 = arith.addi %7114, %__rlasp_stack_elide_zero_597 : i64
      %__rlasp_stack_elide_zero_598 = arith.constant 0 : i64
      %7120 = arith.addi %7117, %__rlasp_stack_elide_zero_598 : i64
      %7121 = func.call @cc_cons(%7120, %7118) : (i64, i64) -> i64
      %7122 = func.call @cc_cons(%7119, %7121) : (i64, i64) -> i64
      %7123 = func.call @cc_and(%7122) : (i64) -> i64
      %__rlasp_stack_elide_zero_599 = arith.constant 0 : i64
      %7124 = arith.addi %7123, %__rlasp_stack_elide_zero_599 : i64
      %7125 = func.call @cc_nil_value() : () -> i64
      %7126 = func.call @cc_cons(%7124, %7125) : (i64, i64) -> i64
      %7127 = func.call @cc_not(%7126) : (i64) -> i64
      %__rlasp_stack_elide_zero_600 = arith.constant 0 : i64
      %7128 = arith.addi %7127, %__rlasp_stack_elide_zero_600 : i64
      %7129 = func.call @cc_nil_value() : () -> i64
      %7130 = func.call @cc_cons(%7128, %7129) : (i64, i64) -> i64
      %7131 = func.call @cc_not(%7130) : (i64) -> i64
      %__rlasp_stack_elide_zero_601 = arith.constant 0 : i64
      %7132 = arith.addi %7131, %__rlasp_stack_elide_zero_601 : i64
      scf.yield %7132 : i64
    }
    func.call @stack_push_pointer(%7075) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077404"() {
    %7435 = func.call @cc_nil_value() : () -> i64
    %7436 = func.call @cc_nil_value() : () -> i64
    %7437 = func.call @cc_errorp(%7435) : (i64) -> i64
    %7438 = arith.cmpi ne, %7437, %7436 : i64
    %7439 = scf.if %7438 -> (i64) {
      scf.yield %7435 : i64
    } else {
      %7440 = llvm.mlir.addressof @str740 : !llvm.ptr
      %7441 = arith.constant 10 : i64
      %7442 = func.call @cc_make_string(%7440, %7441) : (!llvm.ptr, i64) -> i64
      %7443 = llvm.mlir.addressof @str741 : !llvm.ptr
      %7444 = arith.constant 11 : i64
      %7445 = func.call @cc_make_string(%7443, %7444) : (!llvm.ptr, i64) -> i64
      %7446 = func.call @cc_intern(%7442, %7445) : (i64, i64) -> i64
      %7447 = func.call @cc_nil_value() : () -> i64
      %7448 = func.call @cc_cons(%7446, %7447) : (i64, i64) -> i64
      %7449 = func.call @cc_values_pack(%7448) : (i64) -> i64
      %__rlasp_stack_elide_zero_602 = arith.constant 0 : i64
      %7450 = arith.addi %7446, %__rlasp_stack_elide_zero_602 : i64
      %7451 = func.call @cc_nil_value() : () -> i64
      %7452 = func.call @cc_errorp(%7450) : (i64) -> i64
      %7453 = arith.cmpi ne, %7452, %7451 : i64
      %7454 = arith.cmpi eq, %7451, %7451 : i64
      %7455 = arith.andi %7453, %7454 : i1
      %7456 = scf.if %7455 -> (i64) {
        scf.yield %7450 : i64
      } else {
        scf.yield %7451 : i64
      }
      %7457 = arith.cmpi ne, %7456, %7451 : i64
      scf.if %7457 {
        func.call @stack_push_pointer(%7456) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7450) : (i64) -> ()
        %7458 = llvm.mlir.addressof @str742 : !llvm.ptr
        %7459 = func.call @cc_make_function_ref_const(%7458) : (!llvm.ptr) -> i64
        %7460 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%7459, %7460) : (i64, i64) -> ()
      }
      %7461 = llvm.mlir.addressof @str743 : !llvm.ptr
      %7462 = arith.constant 10 : i64
      %7463 = func.call @cc_make_string(%7461, %7462) : (!llvm.ptr, i64) -> i64
      %7464 = llvm.mlir.addressof @str744 : !llvm.ptr
      %7465 = arith.constant 11 : i64
      %7466 = func.call @cc_make_string(%7464, %7465) : (!llvm.ptr, i64) -> i64
      %7467 = func.call @cc_intern(%7463, %7466) : (i64, i64) -> i64
      %7468 = func.call @cc_nil_value() : () -> i64
      %7469 = func.call @cc_cons(%7467, %7468) : (i64, i64) -> i64
      %7470 = func.call @cc_values_pack(%7469) : (i64) -> i64
      %__rlasp_stack_elide_zero_603 = arith.constant 0 : i64
      %7471 = arith.addi %7467, %__rlasp_stack_elide_zero_603 : i64
      %7472 = func.call @stack_pop_pointer() : () -> i64
      %7473 = func.call @cc_subtypep(%7472, %7471) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_604 = arith.constant 0 : i64
      %7474 = arith.addi %7473, %__rlasp_stack_elide_zero_604 : i64
      %7475 = func.call @cc_multiple_value_list(%7474) : (i64) -> i64
      %7476 = arith.constant 0 : i64
      %7477 = func.call @cc_box_fixnum(%7476) : (i64) -> i64
      %7478 = func.call @cc_nth(%7477, %7475) : (i64, i64) -> i64
      %7479 = arith.constant 1 : i64
      %7480 = func.call @cc_box_fixnum(%7479) : (i64) -> i64
      %7481 = func.call @cc_nth(%7480, %7475) : (i64, i64) -> i64
      %7482 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_605 = arith.constant 0 : i64
      %7483 = arith.addi %7478, %__rlasp_stack_elide_zero_605 : i64
      %__rlasp_stack_elide_zero_606 = arith.constant 0 : i64
      %7484 = arith.addi %7481, %__rlasp_stack_elide_zero_606 : i64
      %7485 = func.call @cc_cons(%7484, %7482) : (i64, i64) -> i64
      %7486 = func.call @cc_cons(%7483, %7485) : (i64, i64) -> i64
      %7487 = func.call @cc_and(%7486) : (i64) -> i64
      %__rlasp_stack_elide_zero_607 = arith.constant 0 : i64
      %7488 = arith.addi %7487, %__rlasp_stack_elide_zero_607 : i64
      %7489 = func.call @cc_nil_value() : () -> i64
      %7490 = func.call @cc_cons(%7488, %7489) : (i64, i64) -> i64
      %7491 = func.call @cc_not(%7490) : (i64) -> i64
      %__rlasp_stack_elide_zero_608 = arith.constant 0 : i64
      %7492 = arith.addi %7491, %__rlasp_stack_elide_zero_608 : i64
      %7493 = func.call @cc_nil_value() : () -> i64
      %7494 = func.call @cc_cons(%7492, %7493) : (i64, i64) -> i64
      %7495 = func.call @cc_not(%7494) : (i64) -> i64
      %__rlasp_stack_elide_zero_609 = arith.constant 0 : i64
      %7496 = arith.addi %7495, %__rlasp_stack_elide_zero_609 : i64
      scf.yield %7496 : i64
    }
    func.call @stack_push_pointer(%7439) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077405"() {
    %7732 = func.call @cc_nil_value() : () -> i64
    %7733 = func.call @cc_nil_value() : () -> i64
    %7734 = func.call @cc_errorp(%7732) : (i64) -> i64
    %7735 = arith.cmpi ne, %7734, %7733 : i64
    %7736 = scf.if %7735 -> (i64) {
      scf.yield %7732 : i64
    } else {
      %7737 = llvm.mlir.addressof @str768 : !llvm.ptr
      %7738 = arith.constant 1 : i64
      %7739 = func.call @cc_make_string(%7737, %7738) : (!llvm.ptr, i64) -> i64
      %7740 = func.call @cc_nil_value() : () -> i64
      %7741 = func.call @cc_intern(%7739, %7740) : (i64, i64) -> i64
      %7742 = func.call @cc_nil_value() : () -> i64
      %7743 = func.call @cc_cons(%7741, %7742) : (i64, i64) -> i64
      %7744 = func.call @cc_values_pack(%7743) : (i64) -> i64
      func.call @stack_push_pointer(%7741) : (i64) -> ()
      %7745 = llvm.mlir.addressof @str769 : !llvm.ptr
      %7746 = arith.constant 4 : i64
      %7747 = func.call @cc_make_string(%7745, %7746) : (!llvm.ptr, i64) -> i64
      %7748 = llvm.mlir.addressof @str770 : !llvm.ptr
      %7749 = arith.constant 11 : i64
      %7750 = func.call @cc_make_string(%7748, %7749) : (!llvm.ptr, i64) -> i64
      %7751 = func.call @cc_intern(%7747, %7750) : (i64, i64) -> i64
      %7752 = func.call @cc_nil_value() : () -> i64
      %7753 = func.call @cc_cons(%7751, %7752) : (i64, i64) -> i64
      %7754 = func.call @cc_values_pack(%7753) : (i64) -> i64
      func.call @stack_push_pointer(%7751) : (i64) -> ()
      %7755 = llvm.mlir.addressof @str771 : !llvm.ptr
      %7756 = arith.constant 3 : i64
      %7757 = func.call @cc_make_string(%7755, %7756) : (!llvm.ptr, i64) -> i64
      %7758 = llvm.mlir.addressof @str772 : !llvm.ptr
      %7759 = arith.constant 11 : i64
      %7760 = func.call @cc_make_string(%7758, %7759) : (!llvm.ptr, i64) -> i64
      %7761 = func.call @cc_intern(%7757, %7760) : (i64, i64) -> i64
      %7762 = func.call @cc_nil_value() : () -> i64
      %7763 = func.call @cc_cons(%7761, %7762) : (i64, i64) -> i64
      %7764 = func.call @cc_values_pack(%7763) : (i64) -> i64
      func.call @stack_push_pointer(%7761) : (i64) -> ()
      %7765 = llvm.mlir.addressof @str773 : !llvm.ptr
      %7766 = arith.constant 13 : i64
      %7767 = func.call @cc_make_string(%7765, %7766) : (!llvm.ptr, i64) -> i64
      %7768 = llvm.mlir.addressof @str774 : !llvm.ptr
      %7769 = arith.constant 11 : i64
      %7770 = func.call @cc_make_string(%7768, %7769) : (!llvm.ptr, i64) -> i64
      %7771 = func.call @cc_intern(%7767, %7770) : (i64, i64) -> i64
      %7772 = func.call @cc_nil_value() : () -> i64
      %7773 = func.call @cc_cons(%7771, %7772) : (i64, i64) -> i64
      %7774 = func.call @cc_values_pack(%7773) : (i64) -> i64
      func.call @stack_push_pointer(%7771) : (i64) -> ()
      %7775 = llvm.mlir.addressof @str775 : !llvm.ptr
      %7776 = arith.constant 6 : i64
      %7777 = func.call @cc_make_string(%7775, %7776) : (!llvm.ptr, i64) -> i64
      %7778 = llvm.mlir.addressof @str776 : !llvm.ptr
      %7779 = arith.constant 11 : i64
      %7780 = func.call @cc_make_string(%7778, %7779) : (!llvm.ptr, i64) -> i64
      %7781 = func.call @cc_intern(%7777, %7780) : (i64, i64) -> i64
      %7782 = func.call @cc_nil_value() : () -> i64
      %7783 = func.call @cc_cons(%7781, %7782) : (i64, i64) -> i64
      %7784 = func.call @cc_values_pack(%7783) : (i64) -> i64
      func.call @stack_push_pointer(%7781) : (i64) -> ()
      %7785 = arith.constant 64 : i64
      %7786 = func.call @cc_box_character(%7785) : (i64) -> i64
      func.call @stack_push_pointer(%7786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7787 = func.call @stack_pop_pointer() : () -> i64
      %7788 = func.call @stack_pop_pointer() : () -> i64
      %7789 = func.call @cc_cons(%7788, %7787) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_610 = arith.constant 0 : i64
      %7790 = arith.addi %7789, %__rlasp_stack_elide_zero_610 : i64
      %7791 = func.call @stack_pop_pointer() : () -> i64
      %7792 = func.call @cc_cons(%7791, %7790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7792) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7793 = func.call @stack_pop_pointer() : () -> i64
      %7794 = func.call @stack_pop_pointer() : () -> i64
      %7795 = func.call @cc_cons(%7794, %7793) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_611 = arith.constant 0 : i64
      %7796 = arith.addi %7795, %__rlasp_stack_elide_zero_611 : i64
      %7797 = func.call @stack_pop_pointer() : () -> i64
      %7798 = func.call @cc_cons(%7797, %7796) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_612 = arith.constant 0 : i64
      %7799 = arith.addi %7798, %__rlasp_stack_elide_zero_612 : i64
      %7800 = func.call @stack_pop_pointer() : () -> i64
      %7801 = func.call @cc_cons(%7800, %7799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7801) : (i64) -> ()
      %7802 = llvm.mlir.addressof @str777 : !llvm.ptr
      %7803 = arith.constant 4 : i64
      %7804 = func.call @cc_make_string(%7802, %7803) : (!llvm.ptr, i64) -> i64
      %7805 = llvm.mlir.addressof @str778 : !llvm.ptr
      %7806 = arith.constant 11 : i64
      %7807 = func.call @cc_make_string(%7805, %7806) : (!llvm.ptr, i64) -> i64
      %7808 = func.call @cc_intern(%7804, %7807) : (i64, i64) -> i64
      %7809 = func.call @cc_nil_value() : () -> i64
      %7810 = func.call @cc_cons(%7808, %7809) : (i64, i64) -> i64
      %7811 = func.call @cc_values_pack(%7810) : (i64) -> i64
      func.call @stack_push_pointer(%7808) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7812 = func.call @stack_pop_pointer() : () -> i64
      %7813 = func.call @stack_pop_pointer() : () -> i64
      %7814 = func.call @cc_cons(%7813, %7812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_613 = arith.constant 0 : i64
      %7815 = arith.addi %7814, %__rlasp_stack_elide_zero_613 : i64
      %7816 = func.call @stack_pop_pointer() : () -> i64
      %7817 = func.call @cc_cons(%7816, %7815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_614 = arith.constant 0 : i64
      %7818 = arith.addi %7817, %__rlasp_stack_elide_zero_614 : i64
      %7819 = func.call @stack_pop_pointer() : () -> i64
      %7820 = func.call @cc_cons(%7819, %7818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_615 = arith.constant 0 : i64
      %7821 = arith.addi %7820, %__rlasp_stack_elide_zero_615 : i64
      %7822 = func.call @stack_pop_pointer() : () -> i64
      %7823 = func.call @cc_subtypep(%7822, %7821) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_616 = arith.constant 0 : i64
      %7824 = arith.addi %7823, %__rlasp_stack_elide_zero_616 : i64
      scf.yield %7824 : i64
    }
    func.call @stack_push_pointer(%7736) : (i64) -> ()
    func.return
  }
  func.func @"%FN%make-%semaphore"() {
    %7921 = llvm.mlir.addressof @str785 : !llvm.ptr
    %7922 = arith.constant 15 : i64
    %7923 = func.call @cc_make_string(%7921, %7922) : (!llvm.ptr, i64) -> i64
    %7924 = func.call @cc_nil_value() : () -> i64
    %7925 = func.call @cc_intern(%7923, %7924) : (i64, i64) -> i64
    %7926 = func.call @cc_nil_value() : () -> i64
    %7927 = func.call @cc_cons(%7925, %7926) : (i64, i64) -> i64
    %7928 = func.call @cc_values_pack(%7927) : (i64) -> i64
    %7929 = llvm.mlir.addressof @str786 : !llvm.ptr
    %7930 = arith.constant 31 : i64
    %7931 = func.call @cc_make_string(%7929, %7930) : (!llvm.ptr, i64) -> i64
    %7932 = func.call @cc_register_function_lambda_list_metadata_raw(%7925, %7931) : (i64, i64) -> i64
    %7933 = func.call @stack_pop_pointer() : () -> i64
    %7934 = llvm.mlir.addressof @str787 : !llvm.ptr
    %7935 = arith.constant 4 : i64
    %7936 = func.call @cc_make_string(%7934, %7935) : (!llvm.ptr, i64) -> i64
    %7937 = func.call @cc_nil_value() : () -> i64
    %7938 = func.call @cc_intern(%7936, %7937) : (i64, i64) -> i64
    %7939 = func.call @cc_nil_value() : () -> i64
    %7940 = func.call @cc_cons(%7938, %7939) : (i64, i64) -> i64
    %7941 = func.call @cc_values_pack(%7940) : (i64) -> i64
    %7942 = func.call @cc_arg(%7933, %7938) : (i64, i64) -> i64
    %7943 = func.call @cc_arg_present(%7933, %7938) : (i64, i64) -> i64
    %7944 = func.call @cc_nil_value() : () -> i64
    %7945 = arith.cmpi ne, %7943, %7944 : i64
    %7946 = scf.if %7945 -> (i64) {
      scf.yield %7942 : i64
    } else {
      scf.yield %7944 : i64
    }
    %7947 = llvm.mlir.addressof @str788 : !llvm.ptr
    %7948 = arith.constant 18 : i64
    %7949 = func.call @cc_make_string(%7947, %7948) : (!llvm.ptr, i64) -> i64
    %7950 = func.call @cc_nil_value() : () -> i64
    %7951 = func.call @cc_intern(%7949, %7950) : (i64, i64) -> i64
    %7952 = func.call @cc_nil_value() : () -> i64
    %7953 = func.call @cc_cons(%7951, %7952) : (i64, i64) -> i64
    %7954 = func.call @cc_values_pack(%7953) : (i64) -> i64
    %7955 = func.call @cc_arg(%7933, %7951) : (i64, i64) -> i64
    %7956 = func.call @cc_arg_present(%7933, %7951) : (i64, i64) -> i64
    %7957 = func.call @cc_nil_value() : () -> i64
    %7958 = arith.cmpi ne, %7956, %7957 : i64
    %7959 = scf.if %7958 -> (i64) {
      scf.yield %7955 : i64
    } else {
      scf.yield %7957 : i64
    }
    %7960 = llvm.mlir.addressof @str789 : !llvm.ptr
    %7961 = arith.constant 7 : i64
    %7962 = func.call @cc_make_string(%7960, %7961) : (!llvm.ptr, i64) -> i64
    %7963 = func.call @cc_nil_value() : () -> i64
    %7964 = func.call @cc_intern(%7962, %7963) : (i64, i64) -> i64
    %7965 = func.call @cc_nil_value() : () -> i64
    %7966 = func.call @cc_cons(%7964, %7965) : (i64, i64) -> i64
    %7967 = func.call @cc_values_pack(%7966) : (i64) -> i64
    %7968 = func.call @cc_arg(%7933, %7964) : (i64, i64) -> i64
    %7969 = func.call @cc_arg_present(%7933, %7964) : (i64, i64) -> i64
    %7970 = func.call @cc_nil_value() : () -> i64
    %7971 = arith.cmpi ne, %7969, %7970 : i64
    %7972 = scf.if %7971 -> (i64) {
      scf.yield %7968 : i64
    } else {
      scf.yield %7970 : i64
    }
    %7973 = func.call @cc_nil_value() : () -> i64
    %7974 = llvm.mlir.addressof @str790 : !llvm.ptr
    %7975 = arith.constant 38 : i64
    %7976 = func.call @cc_make_string(%7974, %7975) : (!llvm.ptr, i64) -> i64
    %7977 = func.call @cc_nil_value() : () -> i64
    %7978 = func.call @cc_intern(%7976, %7977) : (i64, i64) -> i64
    %7979 = func.call @cc_nil_value() : () -> i64
    %7980 = func.call @cc_cons(%7978, %7979) : (i64, i64) -> i64
    %7981 = func.call @cc_values_pack(%7980) : (i64) -> i64
    %7982 = func.call @cc_set_symbol_value(%7978, %7973) : (i64, i64) -> i64
    %7983 = llvm.mlir.addressof @str791 : !llvm.ptr
    %7984 = arith.constant 39 : i64
    %7985 = func.call @cc_make_string(%7983, %7984) : (!llvm.ptr, i64) -> i64
    %7986 = func.call @cc_nil_value() : () -> i64
    %7987 = func.call @cc_intern(%7985, %7986) : (i64, i64) -> i64
    %7988 = func.call @cc_nil_value() : () -> i64
    %7989 = func.call @cc_cons(%7987, %7988) : (i64, i64) -> i64
    %7990 = func.call @cc_values_pack(%7989) : (i64) -> i64
    %7991 = func.call @cc_set_symbol_value(%7987, %7973) : (i64, i64) -> i64
    %7992 = llvm.mlir.addressof @str792 : !llvm.ptr
    %7993 = arith.constant 40 : i64
    %7994 = func.call @cc_make_string(%7992, %7993) : (!llvm.ptr, i64) -> i64
    %7995 = func.call @cc_nil_value() : () -> i64
    %7996 = func.call @cc_intern(%7994, %7995) : (i64, i64) -> i64
    %7997 = func.call @cc_nil_value() : () -> i64
    %7998 = func.call @cc_cons(%7996, %7997) : (i64, i64) -> i64
    %7999 = func.call @cc_values_pack(%7998) : (i64) -> i64
    %8000 = func.call @cc_set_symbol_value(%7996, %7973) : (i64, i64) -> i64
    %8001 = func.call @cc_nil_value() : () -> i64
    %8002 = func.call @cc_nil_value() : () -> i64
    %8003 = func.call @cc_errorp(%8001) : (i64) -> i64
    %8004 = arith.cmpi ne, %8003, %8002 : i64
    %8005 = scf.if %8004 -> (i64) {
      scf.yield %8001 : i64
    } else {
      %8006 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8006) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %8007 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_617 = arith.constant 0 : i64
      %8008 = arith.addi %8007, %__rlasp_stack_elide_zero_617 : i64
      %8009 = llvm.mlir.addressof @str793 : !llvm.ptr
      %8010 = arith.constant 3 : i64
      %8011 = func.call @cc_make_string(%8009, %8010) : (!llvm.ptr, i64) -> i64
      %8012 = func.call @cc_nil_value() : () -> i64
      %8013 = func.call @cc_intern(%8011, %8012) : (i64, i64) -> i64
      %8014 = func.call @cc_nil_value() : () -> i64
      %8015 = func.call @cc_cons(%8013, %8014) : (i64, i64) -> i64
      %8016 = func.call @cc_values_pack(%8015) : (i64) -> i64
      %8017 = func.call @cc_set_symbol_value(%8013, %8008) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_618 = arith.constant 0 : i64
      %8018 = arith.addi %8008, %__rlasp_stack_elide_zero_618 : i64
      scf.yield %8018 : i64
    }
    %8019 = func.call @cc_nil_value() : () -> i64
    %8020 = func.call @cc_errorp(%8005) : (i64) -> i64
    %8021 = arith.cmpi ne, %8020, %8019 : i64
    %8022 = scf.if %8021 -> (i64) {
      scf.yield %8005 : i64
    } else {
      %8023 = llvm.mlir.addressof @str794 : !llvm.ptr
      %8024 = arith.constant 3 : i64
      %8025 = func.call @cc_make_string(%8023, %8024) : (!llvm.ptr, i64) -> i64
      %8026 = func.call @cc_nil_value() : () -> i64
      %8027 = func.call @cc_intern(%8025, %8026) : (i64, i64) -> i64
      %8028 = func.call @cc_nil_value() : () -> i64
      %8029 = func.call @cc_cons(%8027, %8028) : (i64, i64) -> i64
      %8030 = func.call @cc_values_pack(%8029) : (i64) -> i64
      %8031 = func.call @cc_symbol_value(%8027) : (i64) -> i64
      %8032 = llvm.mlir.addressof @str795 : !llvm.ptr
      %8033 = arith.constant 10 : i64
      %8034 = func.call @cc_make_string(%8032, %8033) : (!llvm.ptr, i64) -> i64
      %8035 = func.call @cc_nil_value() : () -> i64
      %8036 = func.call @cc_intern(%8034, %8035) : (i64, i64) -> i64
      %8037 = func.call @cc_nil_value() : () -> i64
      %8038 = func.call @cc_cons(%8036, %8037) : (i64, i64) -> i64
      %8039 = func.call @cc_values_pack(%8038) : (i64) -> i64
      %__rlasp_stack_elide_zero_619 = arith.constant 0 : i64
      %8040 = arith.addi %8036, %__rlasp_stack_elide_zero_619 : i64
      %8041 = llvm.mlir.addressof @str796 : !llvm.ptr
      %8042 = arith.constant 16 : i64
      %8043 = func.call @cc_make_string(%8041, %8042) : (!llvm.ptr, i64) -> i64
      %8044 = func.call @cc_nil_value() : () -> i64
      %8045 = func.call @cc_intern(%8043, %8044) : (i64, i64) -> i64
      %8046 = func.call @cc_nil_value() : () -> i64
      %8047 = func.call @cc_cons(%8045, %8046) : (i64, i64) -> i64
      %8048 = func.call @cc_values_pack(%8047) : (i64) -> i64
      %__rlasp_stack_elide_zero_620 = arith.constant 0 : i64
      %8049 = arith.addi %8045, %__rlasp_stack_elide_zero_620 : i64
      %8050 = func.call @cc_nil_value() : () -> i64
      %8051 = func.call @cc_errorp(%8040) : (i64) -> i64
      %8052 = arith.cmpi ne, %8051, %8050 : i64
      %8053 = arith.cmpi eq, %8050, %8050 : i64
      %8054 = arith.andi %8052, %8053 : i1
      %8055 = scf.if %8054 -> (i64) {
        scf.yield %8040 : i64
      } else {
        scf.yield %8050 : i64
      }
      %8056 = func.call @cc_errorp(%8049) : (i64) -> i64
      %8057 = arith.cmpi ne, %8056, %8050 : i64
      %8058 = arith.cmpi eq, %8055, %8050 : i64
      %8059 = arith.andi %8057, %8058 : i1
      %8060 = scf.if %8059 -> (i64) {
        scf.yield %8049 : i64
      } else {
        scf.yield %8055 : i64
      }
      %8061 = arith.cmpi ne, %8060, %8050 : i64
      scf.if %8061 {
        func.call @stack_push_pointer(%8060) : (i64) -> ()
      } else {
        %8062 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%8062) : (i64) -> ()
        %__rlasp_stack_elide_zero_621 = arith.constant 0 : i64
        %8063 = arith.addi %8049, %__rlasp_stack_elide_zero_621 : i64
        %8064 = func.call @stack_pop_pointer() : () -> i64
        %8065 = func.call @cc_cons(%8063, %8064) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8065) : (i64) -> ()
        %__rlasp_stack_elide_zero_622 = arith.constant 0 : i64
        %8066 = arith.addi %8040, %__rlasp_stack_elide_zero_622 : i64
        %8067 = func.call @stack_pop_pointer() : () -> i64
        %8068 = func.call @cc_cons(%8066, %8067) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8068) : (i64) -> ()
      }
      %8069 = func.call @stack_pop_pointer() : () -> i64
      %8070 = func.call @cc_nil_value() : () -> i64
      %8071 = func.call @cc_errorp(%8031) : (i64) -> i64
      %8072 = arith.cmpi ne, %8071, %8070 : i64
      %8073 = arith.cmpi eq, %8070, %8070 : i64
      %8074 = arith.andi %8072, %8073 : i1
      %8075 = scf.if %8074 -> (i64) {
        scf.yield %8031 : i64
      } else {
        scf.yield %8070 : i64
      }
      %8076 = func.call @cc_errorp(%8069) : (i64) -> i64
      %8077 = arith.cmpi ne, %8076, %8070 : i64
      %8078 = arith.cmpi eq, %8075, %8070 : i64
      %8079 = arith.andi %8077, %8078 : i1
      %8080 = scf.if %8079 -> (i64) {
        scf.yield %8069 : i64
      } else {
        scf.yield %8075 : i64
      }
      %8081 = arith.cmpi ne, %8080, %8070 : i64
      scf.if %8081 {
        func.call @stack_push_pointer(%8080) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8031) : (i64) -> ()
        func.call @stack_push_pointer(%8069) : (i64) -> ()
        %8082 = llvm.mlir.addressof @str797 : !llvm.ptr
        %8083 = func.call @cc_make_function_ref_const(%8082) : (!llvm.ptr) -> i64
        %8084 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%8083, %8084) : (i64, i64) -> ()
      }
      %8085 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8085 : i64
    }
    %8086 = func.call @cc_nil_value() : () -> i64
    %8087 = func.call @cc_errorp(%8022) : (i64) -> i64
    %8088 = arith.cmpi ne, %8087, %8086 : i64
    %8089 = scf.if %8088 -> (i64) {
      scf.yield %8022 : i64
    } else {
      %8090 = llvm.mlir.addressof @str798 : !llvm.ptr
      %8091 = arith.constant 4 : i64
      %8092 = func.call @cc_make_string(%8090, %8091) : (!llvm.ptr, i64) -> i64
      %8093 = func.call @cc_nil_value() : () -> i64
      %8094 = func.call @cc_intern(%8092, %8093) : (i64, i64) -> i64
      %8095 = func.call @cc_nil_value() : () -> i64
      %8096 = func.call @cc_cons(%8094, %8095) : (i64, i64) -> i64
      %8097 = func.call @cc_values_pack(%8096) : (i64) -> i64
      func.call @stack_push_pointer(%8094) : (i64) -> ()
      %8098 = llvm.mlir.addressof @str799 : !llvm.ptr
      %8099 = arith.constant 3 : i64
      %8100 = func.call @cc_make_string(%8098, %8099) : (!llvm.ptr, i64) -> i64
      %8101 = func.call @cc_nil_value() : () -> i64
      %8102 = func.call @cc_intern(%8100, %8101) : (i64, i64) -> i64
      %8103 = func.call @cc_nil_value() : () -> i64
      %8104 = func.call @cc_cons(%8102, %8103) : (i64, i64) -> i64
      %8105 = func.call @cc_values_pack(%8104) : (i64) -> i64
      %8106 = func.call @cc_symbol_value(%8102) : (i64) -> i64
      func.call @stack_push_pointer(%8106) : (i64) -> ()
      %__rlasp_stack_elide_zero_623 = arith.constant 0 : i64
      %8107 = arith.addi %7946, %__rlasp_stack_elide_zero_623 : i64
      %8108 = func.call @stack_pop_pointer() : () -> i64
      %8109 = func.call @stack_pop_pointer() : () -> i64
      %8110 = func.call @cc_puthash(%8109, %8107, %8108) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_624 = arith.constant 0 : i64
      %8111 = arith.addi %8110, %__rlasp_stack_elide_zero_624 : i64
      scf.yield %8111 : i64
    }
    %8112 = func.call @cc_nil_value() : () -> i64
    %8113 = func.call @cc_errorp(%8089) : (i64) -> i64
    %8114 = arith.cmpi ne, %8113, %8112 : i64
    %8115 = scf.if %8114 -> (i64) {
      scf.yield %8089 : i64
    } else {
      %8116 = llvm.mlir.addressof @str800 : !llvm.ptr
      %8117 = arith.constant 18 : i64
      %8118 = func.call @cc_make_string(%8116, %8117) : (!llvm.ptr, i64) -> i64
      %8119 = func.call @cc_nil_value() : () -> i64
      %8120 = func.call @cc_intern(%8118, %8119) : (i64, i64) -> i64
      %8121 = func.call @cc_nil_value() : () -> i64
      %8122 = func.call @cc_cons(%8120, %8121) : (i64, i64) -> i64
      %8123 = func.call @cc_values_pack(%8122) : (i64) -> i64
      func.call @stack_push_pointer(%8120) : (i64) -> ()
      %8124 = llvm.mlir.addressof @str801 : !llvm.ptr
      %8125 = arith.constant 3 : i64
      %8126 = func.call @cc_make_string(%8124, %8125) : (!llvm.ptr, i64) -> i64
      %8127 = func.call @cc_nil_value() : () -> i64
      %8128 = func.call @cc_intern(%8126, %8127) : (i64, i64) -> i64
      %8129 = func.call @cc_nil_value() : () -> i64
      %8130 = func.call @cc_cons(%8128, %8129) : (i64, i64) -> i64
      %8131 = func.call @cc_values_pack(%8130) : (i64) -> i64
      %8132 = func.call @cc_symbol_value(%8128) : (i64) -> i64
      func.call @stack_push_pointer(%8132) : (i64) -> ()
      %__rlasp_stack_elide_zero_625 = arith.constant 0 : i64
      %8133 = arith.addi %7959, %__rlasp_stack_elide_zero_625 : i64
      %8134 = func.call @stack_pop_pointer() : () -> i64
      %8135 = func.call @stack_pop_pointer() : () -> i64
      %8136 = func.call @cc_puthash(%8135, %8133, %8134) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_626 = arith.constant 0 : i64
      %8137 = arith.addi %8136, %__rlasp_stack_elide_zero_626 : i64
      scf.yield %8137 : i64
    }
    %8138 = func.call @cc_nil_value() : () -> i64
    %8139 = func.call @cc_errorp(%8115) : (i64) -> i64
    %8140 = arith.cmpi ne, %8139, %8138 : i64
    %8141 = scf.if %8140 -> (i64) {
      scf.yield %8115 : i64
    } else {
      %8142 = llvm.mlir.addressof @str802 : !llvm.ptr
      %8143 = arith.constant 7 : i64
      %8144 = func.call @cc_make_string(%8142, %8143) : (!llvm.ptr, i64) -> i64
      %8145 = func.call @cc_nil_value() : () -> i64
      %8146 = func.call @cc_intern(%8144, %8145) : (i64, i64) -> i64
      %8147 = func.call @cc_nil_value() : () -> i64
      %8148 = func.call @cc_cons(%8146, %8147) : (i64, i64) -> i64
      %8149 = func.call @cc_values_pack(%8148) : (i64) -> i64
      func.call @stack_push_pointer(%8146) : (i64) -> ()
      %8150 = llvm.mlir.addressof @str803 : !llvm.ptr
      %8151 = arith.constant 3 : i64
      %8152 = func.call @cc_make_string(%8150, %8151) : (!llvm.ptr, i64) -> i64
      %8153 = func.call @cc_nil_value() : () -> i64
      %8154 = func.call @cc_intern(%8152, %8153) : (i64, i64) -> i64
      %8155 = func.call @cc_nil_value() : () -> i64
      %8156 = func.call @cc_cons(%8154, %8155) : (i64, i64) -> i64
      %8157 = func.call @cc_values_pack(%8156) : (i64) -> i64
      %8158 = func.call @cc_symbol_value(%8154) : (i64) -> i64
      func.call @stack_push_pointer(%8158) : (i64) -> ()
      %__rlasp_stack_elide_zero_627 = arith.constant 0 : i64
      %8159 = arith.addi %7972, %__rlasp_stack_elide_zero_627 : i64
      %8160 = func.call @stack_pop_pointer() : () -> i64
      %8161 = func.call @stack_pop_pointer() : () -> i64
      %8162 = func.call @cc_puthash(%8161, %8159, %8160) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_628 = arith.constant 0 : i64
      %8163 = arith.addi %8162, %__rlasp_stack_elide_zero_628 : i64
      scf.yield %8163 : i64
    }
    %8164 = func.call @cc_nil_value() : () -> i64
    %8165 = func.call @cc_errorp(%8141) : (i64) -> i64
    %8166 = arith.cmpi ne, %8165, %8164 : i64
    %8167 = scf.if %8166 -> (i64) {
      scf.yield %8141 : i64
    } else {
      %8168 = llvm.mlir.addressof @str804 : !llvm.ptr
      %8169 = arith.constant 3 : i64
      %8170 = func.call @cc_make_string(%8168, %8169) : (!llvm.ptr, i64) -> i64
      %8171 = func.call @cc_nil_value() : () -> i64
      %8172 = func.call @cc_intern(%8170, %8171) : (i64, i64) -> i64
      %8173 = func.call @cc_nil_value() : () -> i64
      %8174 = func.call @cc_cons(%8172, %8173) : (i64, i64) -> i64
      %8175 = func.call @cc_values_pack(%8174) : (i64) -> i64
      %8176 = func.call @cc_symbol_value(%8172) : (i64) -> i64
      %__rlasp_stack_elide_zero_629 = arith.constant 0 : i64
      %8177 = arith.addi %8176, %__rlasp_stack_elide_zero_629 : i64
      scf.yield %8177 : i64
    }
    %__rlasp_stack_elide_zero_630 = arith.constant 0 : i64
    %8178 = arith.addi %8167, %__rlasp_stack_elide_zero_630 : i64
    %8179 = func.call @cc_multiple_value_list(%8178) : (i64) -> i64
    %8180 = llvm.mlir.addressof @str805 : !llvm.ptr
    %8181 = arith.constant 38 : i64
    %8182 = func.call @cc_make_string(%8180, %8181) : (!llvm.ptr, i64) -> i64
    %8183 = func.call @cc_nil_value() : () -> i64
    %8184 = func.call @cc_intern(%8182, %8183) : (i64, i64) -> i64
    %8185 = func.call @cc_nil_value() : () -> i64
    %8186 = func.call @cc_cons(%8184, %8185) : (i64, i64) -> i64
    %8187 = func.call @cc_values_pack(%8186) : (i64) -> i64
    %8188 = func.call @cc_symbol_value(%8184) : (i64) -> i64
    %8189 = llvm.mlir.addressof @str806 : !llvm.ptr
    %8190 = arith.constant 40 : i64
    %8191 = func.call @cc_make_string(%8189, %8190) : (!llvm.ptr, i64) -> i64
    %8192 = func.call @cc_nil_value() : () -> i64
    %8193 = func.call @cc_intern(%8191, %8192) : (i64, i64) -> i64
    %8194 = func.call @cc_nil_value() : () -> i64
    %8195 = func.call @cc_cons(%8193, %8194) : (i64, i64) -> i64
    %8196 = func.call @cc_values_pack(%8195) : (i64) -> i64
    %8197 = func.call @cc_symbol_value(%8193) : (i64) -> i64
    %8198 = func.call @cc_nil_value() : () -> i64
    %8199 = arith.cmpi ne, %8188, %8198 : i64
    %8200 = scf.if %8199 -> (i64) {
      scf.yield %8197 : i64
    } else {
      scf.yield %8179 : i64
    }
    %8201 = func.call @cc_values_pack(%8200) : (i64) -> i64
    func.call @stack_push_pointer(%8201) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%semaphore-p"() {
    %8238 = llvm.mlir.addressof @str812 : !llvm.ptr
    %8239 = arith.constant 12 : i64
    %8240 = func.call @cc_make_string(%8238, %8239) : (!llvm.ptr, i64) -> i64
    %8241 = func.call @cc_nil_value() : () -> i64
    %8242 = func.call @cc_intern(%8240, %8241) : (i64, i64) -> i64
    %8243 = func.call @cc_nil_value() : () -> i64
    %8244 = func.call @cc_cons(%8242, %8243) : (i64, i64) -> i64
    %8245 = func.call @cc_values_pack(%8244) : (i64) -> i64
    %8246 = llvm.mlir.addressof @str813 : !llvm.ptr
    %8247 = arith.constant 3 : i64
    %8248 = func.call @cc_make_string(%8246, %8247) : (!llvm.ptr, i64) -> i64
    %8249 = func.call @cc_register_function_lambda_list_metadata_raw(%8242, %8248) : (i64, i64) -> i64
    %8250 = func.call @stack_pop_pointer() : () -> i64
    %8251 = func.call @cc_nil_value() : () -> i64
    %8252 = llvm.mlir.addressof @str814 : !llvm.ptr
    %8253 = arith.constant 38 : i64
    %8254 = func.call @cc_make_string(%8252, %8253) : (!llvm.ptr, i64) -> i64
    %8255 = func.call @cc_nil_value() : () -> i64
    %8256 = func.call @cc_intern(%8254, %8255) : (i64, i64) -> i64
    %8257 = func.call @cc_nil_value() : () -> i64
    %8258 = func.call @cc_cons(%8256, %8257) : (i64, i64) -> i64
    %8259 = func.call @cc_values_pack(%8258) : (i64) -> i64
    %8260 = func.call @cc_set_symbol_value(%8256, %8251) : (i64, i64) -> i64
    %8261 = llvm.mlir.addressof @str815 : !llvm.ptr
    %8262 = arith.constant 39 : i64
    %8263 = func.call @cc_make_string(%8261, %8262) : (!llvm.ptr, i64) -> i64
    %8264 = func.call @cc_nil_value() : () -> i64
    %8265 = func.call @cc_intern(%8263, %8264) : (i64, i64) -> i64
    %8266 = func.call @cc_nil_value() : () -> i64
    %8267 = func.call @cc_cons(%8265, %8266) : (i64, i64) -> i64
    %8268 = func.call @cc_values_pack(%8267) : (i64) -> i64
    %8269 = func.call @cc_set_symbol_value(%8265, %8251) : (i64, i64) -> i64
    %8270 = llvm.mlir.addressof @str816 : !llvm.ptr
    %8271 = arith.constant 40 : i64
    %8272 = func.call @cc_make_string(%8270, %8271) : (!llvm.ptr, i64) -> i64
    %8273 = func.call @cc_nil_value() : () -> i64
    %8274 = func.call @cc_intern(%8272, %8273) : (i64, i64) -> i64
    %8275 = func.call @cc_nil_value() : () -> i64
    %8276 = func.call @cc_cons(%8274, %8275) : (i64, i64) -> i64
    %8277 = func.call @cc_values_pack(%8276) : (i64) -> i64
    %8278 = func.call @cc_set_symbol_value(%8274, %8251) : (i64, i64) -> i64
    func.call @stack_push_pointer(%8250) : (i64) -> ()
    %8279 = llvm.mlir.addressof @str817 : !llvm.ptr
    %8280 = arith.constant 10 : i64
    %8281 = func.call @cc_make_string(%8279, %8280) : (!llvm.ptr, i64) -> i64
    %8282 = func.call @cc_nil_value() : () -> i64
    %8283 = func.call @cc_intern(%8281, %8282) : (i64, i64) -> i64
    %8284 = func.call @cc_nil_value() : () -> i64
    %8285 = func.call @cc_cons(%8283, %8284) : (i64, i64) -> i64
    %8286 = func.call @cc_values_pack(%8285) : (i64) -> i64
    %__rlasp_stack_elide_zero_631 = arith.constant 0 : i64
    %8287 = arith.addi %8283, %__rlasp_stack_elide_zero_631 : i64
    %8288 = func.call @stack_pop_pointer() : () -> i64
    %8289 = func.call @cc_typep(%8288, %8287) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_632 = arith.constant 0 : i64
    %8290 = arith.addi %8289, %__rlasp_stack_elide_zero_632 : i64
    %8291 = func.call @cc_multiple_value_list(%8290) : (i64) -> i64
    %8292 = llvm.mlir.addressof @str818 : !llvm.ptr
    %8293 = arith.constant 38 : i64
    %8294 = func.call @cc_make_string(%8292, %8293) : (!llvm.ptr, i64) -> i64
    %8295 = func.call @cc_nil_value() : () -> i64
    %8296 = func.call @cc_intern(%8294, %8295) : (i64, i64) -> i64
    %8297 = func.call @cc_nil_value() : () -> i64
    %8298 = func.call @cc_cons(%8296, %8297) : (i64, i64) -> i64
    %8299 = func.call @cc_values_pack(%8298) : (i64) -> i64
    %8300 = func.call @cc_symbol_value(%8296) : (i64) -> i64
    %8301 = llvm.mlir.addressof @str819 : !llvm.ptr
    %8302 = arith.constant 40 : i64
    %8303 = func.call @cc_make_string(%8301, %8302) : (!llvm.ptr, i64) -> i64
    %8304 = func.call @cc_nil_value() : () -> i64
    %8305 = func.call @cc_intern(%8303, %8304) : (i64, i64) -> i64
    %8306 = func.call @cc_nil_value() : () -> i64
    %8307 = func.call @cc_cons(%8305, %8306) : (i64, i64) -> i64
    %8308 = func.call @cc_values_pack(%8307) : (i64) -> i64
    %8309 = func.call @cc_symbol_value(%8305) : (i64) -> i64
    %8310 = func.call @cc_nil_value() : () -> i64
    %8311 = arith.cmpi ne, %8300, %8310 : i64
    %8312 = scf.if %8311 -> (i64) {
      scf.yield %8309 : i64
    } else {
      scf.yield %8291 : i64
    }
    %8313 = func.call @cc_values_pack(%8312) : (i64) -> i64
    func.call @stack_push_pointer(%8313) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%semaphore-lock"() {
    %8350 = llvm.mlir.addressof @str825 : !llvm.ptr
    %8351 = arith.constant 15 : i64
    %8352 = func.call @cc_make_string(%8350, %8351) : (!llvm.ptr, i64) -> i64
    %8353 = func.call @cc_nil_value() : () -> i64
    %8354 = func.call @cc_intern(%8352, %8353) : (i64, i64) -> i64
    %8355 = func.call @cc_nil_value() : () -> i64
    %8356 = func.call @cc_cons(%8354, %8355) : (i64, i64) -> i64
    %8357 = func.call @cc_values_pack(%8356) : (i64) -> i64
    %8358 = llvm.mlir.addressof @str826 : !llvm.ptr
    %8359 = arith.constant 3 : i64
    %8360 = func.call @cc_make_string(%8358, %8359) : (!llvm.ptr, i64) -> i64
    %8361 = func.call @cc_register_function_lambda_list_metadata_raw(%8354, %8360) : (i64, i64) -> i64
    %8362 = func.call @stack_pop_pointer() : () -> i64
    %8363 = func.call @cc_nil_value() : () -> i64
    %8364 = llvm.mlir.addressof @str827 : !llvm.ptr
    %8365 = arith.constant 38 : i64
    %8366 = func.call @cc_make_string(%8364, %8365) : (!llvm.ptr, i64) -> i64
    %8367 = func.call @cc_nil_value() : () -> i64
    %8368 = func.call @cc_intern(%8366, %8367) : (i64, i64) -> i64
    %8369 = func.call @cc_nil_value() : () -> i64
    %8370 = func.call @cc_cons(%8368, %8369) : (i64, i64) -> i64
    %8371 = func.call @cc_values_pack(%8370) : (i64) -> i64
    %8372 = func.call @cc_set_symbol_value(%8368, %8363) : (i64, i64) -> i64
    %8373 = llvm.mlir.addressof @str828 : !llvm.ptr
    %8374 = arith.constant 39 : i64
    %8375 = func.call @cc_make_string(%8373, %8374) : (!llvm.ptr, i64) -> i64
    %8376 = func.call @cc_nil_value() : () -> i64
    %8377 = func.call @cc_intern(%8375, %8376) : (i64, i64) -> i64
    %8378 = func.call @cc_nil_value() : () -> i64
    %8379 = func.call @cc_cons(%8377, %8378) : (i64, i64) -> i64
    %8380 = func.call @cc_values_pack(%8379) : (i64) -> i64
    %8381 = func.call @cc_set_symbol_value(%8377, %8363) : (i64, i64) -> i64
    %8382 = llvm.mlir.addressof @str829 : !llvm.ptr
    %8383 = arith.constant 40 : i64
    %8384 = func.call @cc_make_string(%8382, %8383) : (!llvm.ptr, i64) -> i64
    %8385 = func.call @cc_nil_value() : () -> i64
    %8386 = func.call @cc_intern(%8384, %8385) : (i64, i64) -> i64
    %8387 = func.call @cc_nil_value() : () -> i64
    %8388 = func.call @cc_cons(%8386, %8387) : (i64, i64) -> i64
    %8389 = func.call @cc_values_pack(%8388) : (i64) -> i64
    %8390 = func.call @cc_set_symbol_value(%8386, %8363) : (i64, i64) -> i64
    %8391 = llvm.mlir.addressof @str830 : !llvm.ptr
    %8392 = arith.constant 4 : i64
    %8393 = func.call @cc_make_string(%8391, %8392) : (!llvm.ptr, i64) -> i64
    %8394 = func.call @cc_nil_value() : () -> i64
    %8395 = func.call @cc_intern(%8393, %8394) : (i64, i64) -> i64
    %8396 = func.call @cc_nil_value() : () -> i64
    %8397 = func.call @cc_cons(%8395, %8396) : (i64, i64) -> i64
    %8398 = func.call @cc_values_pack(%8397) : (i64) -> i64
    func.call @stack_push_pointer(%8395) : (i64) -> ()
    func.call @stack_push_pointer(%8362) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %8399 = func.call @stack_pop_pointer() : () -> i64
    %8400 = func.call @stack_pop_pointer() : () -> i64
    %8401 = func.call @stack_pop_pointer() : () -> i64
    %8402 = func.call @cc_gethash(%8401, %8400, %8399) : (i64, i64, i64) -> i64
    %__rlasp_stack_elide_zero_633 = arith.constant 0 : i64
    %8403 = arith.addi %8402, %__rlasp_stack_elide_zero_633 : i64
    func.call @stack_push_nil() : () -> ()
    %8404 = func.call @stack_pop_pointer() : () -> i64
    %8405 = func.call @cc_cons(%8403, %8404) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_634 = arith.constant 0 : i64
    %8406 = arith.addi %8405, %__rlasp_stack_elide_zero_634 : i64
    %8407 = func.call @cc_values_pack(%8406) : (i64) -> i64
    %__rlasp_stack_elide_zero_635 = arith.constant 0 : i64
    %8408 = arith.addi %8407, %__rlasp_stack_elide_zero_635 : i64
    %8409 = func.call @cc_multiple_value_list(%8408) : (i64) -> i64
    %8410 = llvm.mlir.addressof @str831 : !llvm.ptr
    %8411 = arith.constant 38 : i64
    %8412 = func.call @cc_make_string(%8410, %8411) : (!llvm.ptr, i64) -> i64
    %8413 = func.call @cc_nil_value() : () -> i64
    %8414 = func.call @cc_intern(%8412, %8413) : (i64, i64) -> i64
    %8415 = func.call @cc_nil_value() : () -> i64
    %8416 = func.call @cc_cons(%8414, %8415) : (i64, i64) -> i64
    %8417 = func.call @cc_values_pack(%8416) : (i64) -> i64
    %8418 = func.call @cc_symbol_value(%8414) : (i64) -> i64
    %8419 = llvm.mlir.addressof @str832 : !llvm.ptr
    %8420 = arith.constant 40 : i64
    %8421 = func.call @cc_make_string(%8419, %8420) : (!llvm.ptr, i64) -> i64
    %8422 = func.call @cc_nil_value() : () -> i64
    %8423 = func.call @cc_intern(%8421, %8422) : (i64, i64) -> i64
    %8424 = func.call @cc_nil_value() : () -> i64
    %8425 = func.call @cc_cons(%8423, %8424) : (i64, i64) -> i64
    %8426 = func.call @cc_values_pack(%8425) : (i64) -> i64
    %8427 = func.call @cc_symbol_value(%8423) : (i64) -> i64
    %8428 = func.call @cc_nil_value() : () -> i64
    %8429 = arith.cmpi ne, %8418, %8428 : i64
    %8430 = scf.if %8429 -> (i64) {
      scf.yield %8427 : i64
    } else {
      scf.yield %8409 : i64
    }
    %8431 = func.call @cc_values_pack(%8430) : (i64) -> i64
    func.call @stack_push_pointer(%8431) : (i64) -> ()
    func.return
  }
  func.func @"%FN%(setf %semaphore-lock)"() {
    %8468 = llvm.mlir.addressof @str838 : !llvm.ptr
    %8469 = arith.constant 22 : i64
    %8470 = func.call @cc_make_string(%8468, %8469) : (!llvm.ptr, i64) -> i64
    %8471 = func.call @cc_nil_value() : () -> i64
    %8472 = func.call @cc_intern(%8470, %8471) : (i64, i64) -> i64
    %8473 = func.call @cc_nil_value() : () -> i64
    %8474 = func.call @cc_cons(%8472, %8473) : (i64, i64) -> i64
    %8475 = func.call @cc_values_pack(%8474) : (i64) -> i64
    %8476 = llvm.mlir.addressof @str839 : !llvm.ptr
    %8477 = arith.constant 13 : i64
    %8478 = func.call @cc_make_string(%8476, %8477) : (!llvm.ptr, i64) -> i64
    %8479 = func.call @cc_register_function_lambda_list_metadata_raw(%8472, %8478) : (i64, i64) -> i64
    %8480 = func.call @stack_pop_pointer() : () -> i64
    %8481 = func.call @stack_pop_pointer() : () -> i64
    %8482 = func.call @cc_nil_value() : () -> i64
    %8483 = llvm.mlir.addressof @str840 : !llvm.ptr
    %8484 = arith.constant 38 : i64
    %8485 = func.call @cc_make_string(%8483, %8484) : (!llvm.ptr, i64) -> i64
    %8486 = func.call @cc_nil_value() : () -> i64
    %8487 = func.call @cc_intern(%8485, %8486) : (i64, i64) -> i64
    %8488 = func.call @cc_nil_value() : () -> i64
    %8489 = func.call @cc_cons(%8487, %8488) : (i64, i64) -> i64
    %8490 = func.call @cc_values_pack(%8489) : (i64) -> i64
    %8491 = func.call @cc_set_symbol_value(%8487, %8482) : (i64, i64) -> i64
    %8492 = llvm.mlir.addressof @str841 : !llvm.ptr
    %8493 = arith.constant 39 : i64
    %8494 = func.call @cc_make_string(%8492, %8493) : (!llvm.ptr, i64) -> i64
    %8495 = func.call @cc_nil_value() : () -> i64
    %8496 = func.call @cc_intern(%8494, %8495) : (i64, i64) -> i64
    %8497 = func.call @cc_nil_value() : () -> i64
    %8498 = func.call @cc_cons(%8496, %8497) : (i64, i64) -> i64
    %8499 = func.call @cc_values_pack(%8498) : (i64) -> i64
    %8500 = func.call @cc_set_symbol_value(%8496, %8482) : (i64, i64) -> i64
    %8501 = llvm.mlir.addressof @str842 : !llvm.ptr
    %8502 = arith.constant 40 : i64
    %8503 = func.call @cc_make_string(%8501, %8502) : (!llvm.ptr, i64) -> i64
    %8504 = func.call @cc_nil_value() : () -> i64
    %8505 = func.call @cc_intern(%8503, %8504) : (i64, i64) -> i64
    %8506 = func.call @cc_nil_value() : () -> i64
    %8507 = func.call @cc_cons(%8505, %8506) : (i64, i64) -> i64
    %8508 = func.call @cc_values_pack(%8507) : (i64) -> i64
    %8509 = func.call @cc_set_symbol_value(%8505, %8482) : (i64, i64) -> i64
    %8510 = func.call @cc_nil_value() : () -> i64
    %8511 = func.call @cc_nil_value() : () -> i64
    %8512 = func.call @cc_errorp(%8510) : (i64) -> i64
    %8513 = arith.cmpi ne, %8512, %8511 : i64
    %8514 = scf.if %8513 -> (i64) {
      scf.yield %8510 : i64
    } else {
      %8515 = llvm.mlir.addressof @str843 : !llvm.ptr
      %8516 = arith.constant 4 : i64
      %8517 = func.call @cc_make_string(%8515, %8516) : (!llvm.ptr, i64) -> i64
      %8518 = func.call @cc_nil_value() : () -> i64
      %8519 = func.call @cc_intern(%8517, %8518) : (i64, i64) -> i64
      %8520 = func.call @cc_nil_value() : () -> i64
      %8521 = func.call @cc_cons(%8519, %8520) : (i64, i64) -> i64
      %8522 = func.call @cc_values_pack(%8521) : (i64) -> i64
      func.call @stack_push_pointer(%8519) : (i64) -> ()
      func.call @stack_push_pointer(%8480) : (i64) -> ()
      %__rlasp_stack_elide_zero_636 = arith.constant 0 : i64
      %8523 = arith.addi %8481, %__rlasp_stack_elide_zero_636 : i64
      %8524 = func.call @stack_pop_pointer() : () -> i64
      %8525 = func.call @stack_pop_pointer() : () -> i64
      %8526 = func.call @cc_puthash(%8525, %8523, %8524) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_637 = arith.constant 0 : i64
      %8527 = arith.addi %8526, %__rlasp_stack_elide_zero_637 : i64
      scf.yield %8527 : i64
    }
    %8528 = func.call @cc_nil_value() : () -> i64
    %8529 = func.call @cc_errorp(%8514) : (i64) -> i64
    %8530 = arith.cmpi ne, %8529, %8528 : i64
    %8531 = scf.if %8530 -> (i64) {
      scf.yield %8514 : i64
    } else {
      %__rlasp_stack_elide_zero_638 = arith.constant 0 : i64
      %8532 = arith.addi %8481, %__rlasp_stack_elide_zero_638 : i64
      scf.yield %8532 : i64
    }
    %__rlasp_stack_elide_zero_639 = arith.constant 0 : i64
    %8533 = arith.addi %8531, %__rlasp_stack_elide_zero_639 : i64
    %8534 = func.call @cc_multiple_value_list(%8533) : (i64) -> i64
    %8535 = llvm.mlir.addressof @str844 : !llvm.ptr
    %8536 = arith.constant 38 : i64
    %8537 = func.call @cc_make_string(%8535, %8536) : (!llvm.ptr, i64) -> i64
    %8538 = func.call @cc_nil_value() : () -> i64
    %8539 = func.call @cc_intern(%8537, %8538) : (i64, i64) -> i64
    %8540 = func.call @cc_nil_value() : () -> i64
    %8541 = func.call @cc_cons(%8539, %8540) : (i64, i64) -> i64
    %8542 = func.call @cc_values_pack(%8541) : (i64) -> i64
    %8543 = func.call @cc_symbol_value(%8539) : (i64) -> i64
    %8544 = llvm.mlir.addressof @str845 : !llvm.ptr
    %8545 = arith.constant 40 : i64
    %8546 = func.call @cc_make_string(%8544, %8545) : (!llvm.ptr, i64) -> i64
    %8547 = func.call @cc_nil_value() : () -> i64
    %8548 = func.call @cc_intern(%8546, %8547) : (i64, i64) -> i64
    %8549 = func.call @cc_nil_value() : () -> i64
    %8550 = func.call @cc_cons(%8548, %8549) : (i64, i64) -> i64
    %8551 = func.call @cc_values_pack(%8550) : (i64) -> i64
    %8552 = func.call @cc_symbol_value(%8548) : (i64) -> i64
    %8553 = func.call @cc_nil_value() : () -> i64
    %8554 = arith.cmpi ne, %8543, %8553 : i64
    %8555 = scf.if %8554 -> (i64) {
      scf.yield %8552 : i64
    } else {
      scf.yield %8534 : i64
    }
    %8556 = func.call @cc_values_pack(%8555) : (i64) -> i64
    func.call @stack_push_pointer(%8556) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%semaphore-condition-variable"() {
    %8593 = llvm.mlir.addressof @str851 : !llvm.ptr
    %8594 = arith.constant 29 : i64
    %8595 = func.call @cc_make_string(%8593, %8594) : (!llvm.ptr, i64) -> i64
    %8596 = func.call @cc_nil_value() : () -> i64
    %8597 = func.call @cc_intern(%8595, %8596) : (i64, i64) -> i64
    %8598 = func.call @cc_nil_value() : () -> i64
    %8599 = func.call @cc_cons(%8597, %8598) : (i64, i64) -> i64
    %8600 = func.call @cc_values_pack(%8599) : (i64) -> i64
    %8601 = llvm.mlir.addressof @str852 : !llvm.ptr
    %8602 = arith.constant 3 : i64
    %8603 = func.call @cc_make_string(%8601, %8602) : (!llvm.ptr, i64) -> i64
    %8604 = func.call @cc_register_function_lambda_list_metadata_raw(%8597, %8603) : (i64, i64) -> i64
    %8605 = func.call @stack_pop_pointer() : () -> i64
    %8606 = func.call @cc_nil_value() : () -> i64
    %8607 = llvm.mlir.addressof @str853 : !llvm.ptr
    %8608 = arith.constant 38 : i64
    %8609 = func.call @cc_make_string(%8607, %8608) : (!llvm.ptr, i64) -> i64
    %8610 = func.call @cc_nil_value() : () -> i64
    %8611 = func.call @cc_intern(%8609, %8610) : (i64, i64) -> i64
    %8612 = func.call @cc_nil_value() : () -> i64
    %8613 = func.call @cc_cons(%8611, %8612) : (i64, i64) -> i64
    %8614 = func.call @cc_values_pack(%8613) : (i64) -> i64
    %8615 = func.call @cc_set_symbol_value(%8611, %8606) : (i64, i64) -> i64
    %8616 = llvm.mlir.addressof @str854 : !llvm.ptr
    %8617 = arith.constant 39 : i64
    %8618 = func.call @cc_make_string(%8616, %8617) : (!llvm.ptr, i64) -> i64
    %8619 = func.call @cc_nil_value() : () -> i64
    %8620 = func.call @cc_intern(%8618, %8619) : (i64, i64) -> i64
    %8621 = func.call @cc_nil_value() : () -> i64
    %8622 = func.call @cc_cons(%8620, %8621) : (i64, i64) -> i64
    %8623 = func.call @cc_values_pack(%8622) : (i64) -> i64
    %8624 = func.call @cc_set_symbol_value(%8620, %8606) : (i64, i64) -> i64
    %8625 = llvm.mlir.addressof @str855 : !llvm.ptr
    %8626 = arith.constant 40 : i64
    %8627 = func.call @cc_make_string(%8625, %8626) : (!llvm.ptr, i64) -> i64
    %8628 = func.call @cc_nil_value() : () -> i64
    %8629 = func.call @cc_intern(%8627, %8628) : (i64, i64) -> i64
    %8630 = func.call @cc_nil_value() : () -> i64
    %8631 = func.call @cc_cons(%8629, %8630) : (i64, i64) -> i64
    %8632 = func.call @cc_values_pack(%8631) : (i64) -> i64
    %8633 = func.call @cc_set_symbol_value(%8629, %8606) : (i64, i64) -> i64
    %8634 = llvm.mlir.addressof @str856 : !llvm.ptr
    %8635 = arith.constant 18 : i64
    %8636 = func.call @cc_make_string(%8634, %8635) : (!llvm.ptr, i64) -> i64
    %8637 = func.call @cc_nil_value() : () -> i64
    %8638 = func.call @cc_intern(%8636, %8637) : (i64, i64) -> i64
    %8639 = func.call @cc_nil_value() : () -> i64
    %8640 = func.call @cc_cons(%8638, %8639) : (i64, i64) -> i64
    %8641 = func.call @cc_values_pack(%8640) : (i64) -> i64
    func.call @stack_push_pointer(%8638) : (i64) -> ()
    func.call @stack_push_pointer(%8605) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %8642 = func.call @stack_pop_pointer() : () -> i64
    %8643 = func.call @stack_pop_pointer() : () -> i64
    %8644 = func.call @stack_pop_pointer() : () -> i64
    %8645 = func.call @cc_gethash(%8644, %8643, %8642) : (i64, i64, i64) -> i64
    %__rlasp_stack_elide_zero_640 = arith.constant 0 : i64
    %8646 = arith.addi %8645, %__rlasp_stack_elide_zero_640 : i64
    func.call @stack_push_nil() : () -> ()
    %8647 = func.call @stack_pop_pointer() : () -> i64
    %8648 = func.call @cc_cons(%8646, %8647) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_641 = arith.constant 0 : i64
    %8649 = arith.addi %8648, %__rlasp_stack_elide_zero_641 : i64
    %8650 = func.call @cc_values_pack(%8649) : (i64) -> i64
    %__rlasp_stack_elide_zero_642 = arith.constant 0 : i64
    %8651 = arith.addi %8650, %__rlasp_stack_elide_zero_642 : i64
    %8652 = func.call @cc_multiple_value_list(%8651) : (i64) -> i64
    %8653 = llvm.mlir.addressof @str857 : !llvm.ptr
    %8654 = arith.constant 38 : i64
    %8655 = func.call @cc_make_string(%8653, %8654) : (!llvm.ptr, i64) -> i64
    %8656 = func.call @cc_nil_value() : () -> i64
    %8657 = func.call @cc_intern(%8655, %8656) : (i64, i64) -> i64
    %8658 = func.call @cc_nil_value() : () -> i64
    %8659 = func.call @cc_cons(%8657, %8658) : (i64, i64) -> i64
    %8660 = func.call @cc_values_pack(%8659) : (i64) -> i64
    %8661 = func.call @cc_symbol_value(%8657) : (i64) -> i64
    %8662 = llvm.mlir.addressof @str858 : !llvm.ptr
    %8663 = arith.constant 40 : i64
    %8664 = func.call @cc_make_string(%8662, %8663) : (!llvm.ptr, i64) -> i64
    %8665 = func.call @cc_nil_value() : () -> i64
    %8666 = func.call @cc_intern(%8664, %8665) : (i64, i64) -> i64
    %8667 = func.call @cc_nil_value() : () -> i64
    %8668 = func.call @cc_cons(%8666, %8667) : (i64, i64) -> i64
    %8669 = func.call @cc_values_pack(%8668) : (i64) -> i64
    %8670 = func.call @cc_symbol_value(%8666) : (i64) -> i64
    %8671 = func.call @cc_nil_value() : () -> i64
    %8672 = arith.cmpi ne, %8661, %8671 : i64
    %8673 = scf.if %8672 -> (i64) {
      scf.yield %8670 : i64
    } else {
      scf.yield %8652 : i64
    }
    %8674 = func.call @cc_values_pack(%8673) : (i64) -> i64
    func.call @stack_push_pointer(%8674) : (i64) -> ()
    func.return
  }
  func.func @"%FN%(setf %semaphore-condition-variable)"() {
    %8711 = llvm.mlir.addressof @str864 : !llvm.ptr
    %8712 = arith.constant 36 : i64
    %8713 = func.call @cc_make_string(%8711, %8712) : (!llvm.ptr, i64) -> i64
    %8714 = func.call @cc_nil_value() : () -> i64
    %8715 = func.call @cc_intern(%8713, %8714) : (i64, i64) -> i64
    %8716 = func.call @cc_nil_value() : () -> i64
    %8717 = func.call @cc_cons(%8715, %8716) : (i64, i64) -> i64
    %8718 = func.call @cc_values_pack(%8717) : (i64) -> i64
    %8719 = llvm.mlir.addressof @str865 : !llvm.ptr
    %8720 = arith.constant 13 : i64
    %8721 = func.call @cc_make_string(%8719, %8720) : (!llvm.ptr, i64) -> i64
    %8722 = func.call @cc_register_function_lambda_list_metadata_raw(%8715, %8721) : (i64, i64) -> i64
    %8723 = func.call @stack_pop_pointer() : () -> i64
    %8724 = func.call @stack_pop_pointer() : () -> i64
    %8725 = func.call @cc_nil_value() : () -> i64
    %8726 = llvm.mlir.addressof @str866 : !llvm.ptr
    %8727 = arith.constant 38 : i64
    %8728 = func.call @cc_make_string(%8726, %8727) : (!llvm.ptr, i64) -> i64
    %8729 = func.call @cc_nil_value() : () -> i64
    %8730 = func.call @cc_intern(%8728, %8729) : (i64, i64) -> i64
    %8731 = func.call @cc_nil_value() : () -> i64
    %8732 = func.call @cc_cons(%8730, %8731) : (i64, i64) -> i64
    %8733 = func.call @cc_values_pack(%8732) : (i64) -> i64
    %8734 = func.call @cc_set_symbol_value(%8730, %8725) : (i64, i64) -> i64
    %8735 = llvm.mlir.addressof @str867 : !llvm.ptr
    %8736 = arith.constant 39 : i64
    %8737 = func.call @cc_make_string(%8735, %8736) : (!llvm.ptr, i64) -> i64
    %8738 = func.call @cc_nil_value() : () -> i64
    %8739 = func.call @cc_intern(%8737, %8738) : (i64, i64) -> i64
    %8740 = func.call @cc_nil_value() : () -> i64
    %8741 = func.call @cc_cons(%8739, %8740) : (i64, i64) -> i64
    %8742 = func.call @cc_values_pack(%8741) : (i64) -> i64
    %8743 = func.call @cc_set_symbol_value(%8739, %8725) : (i64, i64) -> i64
    %8744 = llvm.mlir.addressof @str868 : !llvm.ptr
    %8745 = arith.constant 40 : i64
    %8746 = func.call @cc_make_string(%8744, %8745) : (!llvm.ptr, i64) -> i64
    %8747 = func.call @cc_nil_value() : () -> i64
    %8748 = func.call @cc_intern(%8746, %8747) : (i64, i64) -> i64
    %8749 = func.call @cc_nil_value() : () -> i64
    %8750 = func.call @cc_cons(%8748, %8749) : (i64, i64) -> i64
    %8751 = func.call @cc_values_pack(%8750) : (i64) -> i64
    %8752 = func.call @cc_set_symbol_value(%8748, %8725) : (i64, i64) -> i64
    %8753 = func.call @cc_nil_value() : () -> i64
    %8754 = func.call @cc_nil_value() : () -> i64
    %8755 = func.call @cc_errorp(%8753) : (i64) -> i64
    %8756 = arith.cmpi ne, %8755, %8754 : i64
    %8757 = scf.if %8756 -> (i64) {
      scf.yield %8753 : i64
    } else {
      %8758 = llvm.mlir.addressof @str869 : !llvm.ptr
      %8759 = arith.constant 18 : i64
      %8760 = func.call @cc_make_string(%8758, %8759) : (!llvm.ptr, i64) -> i64
      %8761 = func.call @cc_nil_value() : () -> i64
      %8762 = func.call @cc_intern(%8760, %8761) : (i64, i64) -> i64
      %8763 = func.call @cc_nil_value() : () -> i64
      %8764 = func.call @cc_cons(%8762, %8763) : (i64, i64) -> i64
      %8765 = func.call @cc_values_pack(%8764) : (i64) -> i64
      func.call @stack_push_pointer(%8762) : (i64) -> ()
      func.call @stack_push_pointer(%8723) : (i64) -> ()
      %__rlasp_stack_elide_zero_643 = arith.constant 0 : i64
      %8766 = arith.addi %8724, %__rlasp_stack_elide_zero_643 : i64
      %8767 = func.call @stack_pop_pointer() : () -> i64
      %8768 = func.call @stack_pop_pointer() : () -> i64
      %8769 = func.call @cc_puthash(%8768, %8766, %8767) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_644 = arith.constant 0 : i64
      %8770 = arith.addi %8769, %__rlasp_stack_elide_zero_644 : i64
      scf.yield %8770 : i64
    }
    %8771 = func.call @cc_nil_value() : () -> i64
    %8772 = func.call @cc_errorp(%8757) : (i64) -> i64
    %8773 = arith.cmpi ne, %8772, %8771 : i64
    %8774 = scf.if %8773 -> (i64) {
      scf.yield %8757 : i64
    } else {
      %__rlasp_stack_elide_zero_645 = arith.constant 0 : i64
      %8775 = arith.addi %8724, %__rlasp_stack_elide_zero_645 : i64
      scf.yield %8775 : i64
    }
    %__rlasp_stack_elide_zero_646 = arith.constant 0 : i64
    %8776 = arith.addi %8774, %__rlasp_stack_elide_zero_646 : i64
    %8777 = func.call @cc_multiple_value_list(%8776) : (i64) -> i64
    %8778 = llvm.mlir.addressof @str870 : !llvm.ptr
    %8779 = arith.constant 38 : i64
    %8780 = func.call @cc_make_string(%8778, %8779) : (!llvm.ptr, i64) -> i64
    %8781 = func.call @cc_nil_value() : () -> i64
    %8782 = func.call @cc_intern(%8780, %8781) : (i64, i64) -> i64
    %8783 = func.call @cc_nil_value() : () -> i64
    %8784 = func.call @cc_cons(%8782, %8783) : (i64, i64) -> i64
    %8785 = func.call @cc_values_pack(%8784) : (i64) -> i64
    %8786 = func.call @cc_symbol_value(%8782) : (i64) -> i64
    %8787 = llvm.mlir.addressof @str871 : !llvm.ptr
    %8788 = arith.constant 40 : i64
    %8789 = func.call @cc_make_string(%8787, %8788) : (!llvm.ptr, i64) -> i64
    %8790 = func.call @cc_nil_value() : () -> i64
    %8791 = func.call @cc_intern(%8789, %8790) : (i64, i64) -> i64
    %8792 = func.call @cc_nil_value() : () -> i64
    %8793 = func.call @cc_cons(%8791, %8792) : (i64, i64) -> i64
    %8794 = func.call @cc_values_pack(%8793) : (i64) -> i64
    %8795 = func.call @cc_symbol_value(%8791) : (i64) -> i64
    %8796 = func.call @cc_nil_value() : () -> i64
    %8797 = arith.cmpi ne, %8786, %8796 : i64
    %8798 = scf.if %8797 -> (i64) {
      scf.yield %8795 : i64
    } else {
      scf.yield %8777 : i64
    }
    %8799 = func.call @cc_values_pack(%8798) : (i64) -> i64
    func.call @stack_push_pointer(%8799) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%semaphore-counter"() {
    %8836 = llvm.mlir.addressof @str877 : !llvm.ptr
    %8837 = arith.constant 18 : i64
    %8838 = func.call @cc_make_string(%8836, %8837) : (!llvm.ptr, i64) -> i64
    %8839 = func.call @cc_nil_value() : () -> i64
    %8840 = func.call @cc_intern(%8838, %8839) : (i64, i64) -> i64
    %8841 = func.call @cc_nil_value() : () -> i64
    %8842 = func.call @cc_cons(%8840, %8841) : (i64, i64) -> i64
    %8843 = func.call @cc_values_pack(%8842) : (i64) -> i64
    %8844 = llvm.mlir.addressof @str878 : !llvm.ptr
    %8845 = arith.constant 3 : i64
    %8846 = func.call @cc_make_string(%8844, %8845) : (!llvm.ptr, i64) -> i64
    %8847 = func.call @cc_register_function_lambda_list_metadata_raw(%8840, %8846) : (i64, i64) -> i64
    %8848 = func.call @stack_pop_pointer() : () -> i64
    %8849 = func.call @cc_nil_value() : () -> i64
    %8850 = llvm.mlir.addressof @str879 : !llvm.ptr
    %8851 = arith.constant 38 : i64
    %8852 = func.call @cc_make_string(%8850, %8851) : (!llvm.ptr, i64) -> i64
    %8853 = func.call @cc_nil_value() : () -> i64
    %8854 = func.call @cc_intern(%8852, %8853) : (i64, i64) -> i64
    %8855 = func.call @cc_nil_value() : () -> i64
    %8856 = func.call @cc_cons(%8854, %8855) : (i64, i64) -> i64
    %8857 = func.call @cc_values_pack(%8856) : (i64) -> i64
    %8858 = func.call @cc_set_symbol_value(%8854, %8849) : (i64, i64) -> i64
    %8859 = llvm.mlir.addressof @str880 : !llvm.ptr
    %8860 = arith.constant 39 : i64
    %8861 = func.call @cc_make_string(%8859, %8860) : (!llvm.ptr, i64) -> i64
    %8862 = func.call @cc_nil_value() : () -> i64
    %8863 = func.call @cc_intern(%8861, %8862) : (i64, i64) -> i64
    %8864 = func.call @cc_nil_value() : () -> i64
    %8865 = func.call @cc_cons(%8863, %8864) : (i64, i64) -> i64
    %8866 = func.call @cc_values_pack(%8865) : (i64) -> i64
    %8867 = func.call @cc_set_symbol_value(%8863, %8849) : (i64, i64) -> i64
    %8868 = llvm.mlir.addressof @str881 : !llvm.ptr
    %8869 = arith.constant 40 : i64
    %8870 = func.call @cc_make_string(%8868, %8869) : (!llvm.ptr, i64) -> i64
    %8871 = func.call @cc_nil_value() : () -> i64
    %8872 = func.call @cc_intern(%8870, %8871) : (i64, i64) -> i64
    %8873 = func.call @cc_nil_value() : () -> i64
    %8874 = func.call @cc_cons(%8872, %8873) : (i64, i64) -> i64
    %8875 = func.call @cc_values_pack(%8874) : (i64) -> i64
    %8876 = func.call @cc_set_symbol_value(%8872, %8849) : (i64, i64) -> i64
    %8877 = llvm.mlir.addressof @str882 : !llvm.ptr
    %8878 = arith.constant 7 : i64
    %8879 = func.call @cc_make_string(%8877, %8878) : (!llvm.ptr, i64) -> i64
    %8880 = func.call @cc_nil_value() : () -> i64
    %8881 = func.call @cc_intern(%8879, %8880) : (i64, i64) -> i64
    %8882 = func.call @cc_nil_value() : () -> i64
    %8883 = func.call @cc_cons(%8881, %8882) : (i64, i64) -> i64
    %8884 = func.call @cc_values_pack(%8883) : (i64) -> i64
    func.call @stack_push_pointer(%8881) : (i64) -> ()
    func.call @stack_push_pointer(%8848) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %8885 = func.call @stack_pop_pointer() : () -> i64
    %8886 = func.call @stack_pop_pointer() : () -> i64
    %8887 = func.call @stack_pop_pointer() : () -> i64
    %8888 = func.call @cc_gethash(%8887, %8886, %8885) : (i64, i64, i64) -> i64
    %__rlasp_stack_elide_zero_647 = arith.constant 0 : i64
    %8889 = arith.addi %8888, %__rlasp_stack_elide_zero_647 : i64
    func.call @stack_push_nil() : () -> ()
    %8890 = func.call @stack_pop_pointer() : () -> i64
    %8891 = func.call @cc_cons(%8889, %8890) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_648 = arith.constant 0 : i64
    %8892 = arith.addi %8891, %__rlasp_stack_elide_zero_648 : i64
    %8893 = func.call @cc_values_pack(%8892) : (i64) -> i64
    %__rlasp_stack_elide_zero_649 = arith.constant 0 : i64
    %8894 = arith.addi %8893, %__rlasp_stack_elide_zero_649 : i64
    %8895 = func.call @cc_multiple_value_list(%8894) : (i64) -> i64
    %8896 = llvm.mlir.addressof @str883 : !llvm.ptr
    %8897 = arith.constant 38 : i64
    %8898 = func.call @cc_make_string(%8896, %8897) : (!llvm.ptr, i64) -> i64
    %8899 = func.call @cc_nil_value() : () -> i64
    %8900 = func.call @cc_intern(%8898, %8899) : (i64, i64) -> i64
    %8901 = func.call @cc_nil_value() : () -> i64
    %8902 = func.call @cc_cons(%8900, %8901) : (i64, i64) -> i64
    %8903 = func.call @cc_values_pack(%8902) : (i64) -> i64
    %8904 = func.call @cc_symbol_value(%8900) : (i64) -> i64
    %8905 = llvm.mlir.addressof @str884 : !llvm.ptr
    %8906 = arith.constant 40 : i64
    %8907 = func.call @cc_make_string(%8905, %8906) : (!llvm.ptr, i64) -> i64
    %8908 = func.call @cc_nil_value() : () -> i64
    %8909 = func.call @cc_intern(%8907, %8908) : (i64, i64) -> i64
    %8910 = func.call @cc_nil_value() : () -> i64
    %8911 = func.call @cc_cons(%8909, %8910) : (i64, i64) -> i64
    %8912 = func.call @cc_values_pack(%8911) : (i64) -> i64
    %8913 = func.call @cc_symbol_value(%8909) : (i64) -> i64
    %8914 = func.call @cc_nil_value() : () -> i64
    %8915 = arith.cmpi ne, %8904, %8914 : i64
    %8916 = scf.if %8915 -> (i64) {
      scf.yield %8913 : i64
    } else {
      scf.yield %8895 : i64
    }
    %8917 = func.call @cc_values_pack(%8916) : (i64) -> i64
    func.call @stack_push_pointer(%8917) : (i64) -> ()
    func.return
  }
  func.func @"%FN%(setf %semaphore-counter)"() {
    %8954 = llvm.mlir.addressof @str890 : !llvm.ptr
    %8955 = arith.constant 25 : i64
    %8956 = func.call @cc_make_string(%8954, %8955) : (!llvm.ptr, i64) -> i64
    %8957 = func.call @cc_nil_value() : () -> i64
    %8958 = func.call @cc_intern(%8956, %8957) : (i64, i64) -> i64
    %8959 = func.call @cc_nil_value() : () -> i64
    %8960 = func.call @cc_cons(%8958, %8959) : (i64, i64) -> i64
    %8961 = func.call @cc_values_pack(%8960) : (i64) -> i64
    %8962 = llvm.mlir.addressof @str891 : !llvm.ptr
    %8963 = arith.constant 13 : i64
    %8964 = func.call @cc_make_string(%8962, %8963) : (!llvm.ptr, i64) -> i64
    %8965 = func.call @cc_register_function_lambda_list_metadata_raw(%8958, %8964) : (i64, i64) -> i64
    %8966 = func.call @stack_pop_pointer() : () -> i64
    %8967 = func.call @stack_pop_pointer() : () -> i64
    %8968 = func.call @cc_nil_value() : () -> i64
    %8969 = llvm.mlir.addressof @str892 : !llvm.ptr
    %8970 = arith.constant 38 : i64
    %8971 = func.call @cc_make_string(%8969, %8970) : (!llvm.ptr, i64) -> i64
    %8972 = func.call @cc_nil_value() : () -> i64
    %8973 = func.call @cc_intern(%8971, %8972) : (i64, i64) -> i64
    %8974 = func.call @cc_nil_value() : () -> i64
    %8975 = func.call @cc_cons(%8973, %8974) : (i64, i64) -> i64
    %8976 = func.call @cc_values_pack(%8975) : (i64) -> i64
    %8977 = func.call @cc_set_symbol_value(%8973, %8968) : (i64, i64) -> i64
    %8978 = llvm.mlir.addressof @str893 : !llvm.ptr
    %8979 = arith.constant 39 : i64
    %8980 = func.call @cc_make_string(%8978, %8979) : (!llvm.ptr, i64) -> i64
    %8981 = func.call @cc_nil_value() : () -> i64
    %8982 = func.call @cc_intern(%8980, %8981) : (i64, i64) -> i64
    %8983 = func.call @cc_nil_value() : () -> i64
    %8984 = func.call @cc_cons(%8982, %8983) : (i64, i64) -> i64
    %8985 = func.call @cc_values_pack(%8984) : (i64) -> i64
    %8986 = func.call @cc_set_symbol_value(%8982, %8968) : (i64, i64) -> i64
    %8987 = llvm.mlir.addressof @str894 : !llvm.ptr
    %8988 = arith.constant 40 : i64
    %8989 = func.call @cc_make_string(%8987, %8988) : (!llvm.ptr, i64) -> i64
    %8990 = func.call @cc_nil_value() : () -> i64
    %8991 = func.call @cc_intern(%8989, %8990) : (i64, i64) -> i64
    %8992 = func.call @cc_nil_value() : () -> i64
    %8993 = func.call @cc_cons(%8991, %8992) : (i64, i64) -> i64
    %8994 = func.call @cc_values_pack(%8993) : (i64) -> i64
    %8995 = func.call @cc_set_symbol_value(%8991, %8968) : (i64, i64) -> i64
    %8996 = func.call @cc_nil_value() : () -> i64
    %8997 = func.call @cc_nil_value() : () -> i64
    %8998 = func.call @cc_errorp(%8996) : (i64) -> i64
    %8999 = arith.cmpi ne, %8998, %8997 : i64
    %9000 = scf.if %8999 -> (i64) {
      scf.yield %8996 : i64
    } else {
      %9001 = llvm.mlir.addressof @str895 : !llvm.ptr
      %9002 = arith.constant 7 : i64
      %9003 = func.call @cc_make_string(%9001, %9002) : (!llvm.ptr, i64) -> i64
      %9004 = func.call @cc_nil_value() : () -> i64
      %9005 = func.call @cc_intern(%9003, %9004) : (i64, i64) -> i64
      %9006 = func.call @cc_nil_value() : () -> i64
      %9007 = func.call @cc_cons(%9005, %9006) : (i64, i64) -> i64
      %9008 = func.call @cc_values_pack(%9007) : (i64) -> i64
      func.call @stack_push_pointer(%9005) : (i64) -> ()
      func.call @stack_push_pointer(%8966) : (i64) -> ()
      %__rlasp_stack_elide_zero_650 = arith.constant 0 : i64
      %9009 = arith.addi %8967, %__rlasp_stack_elide_zero_650 : i64
      %9010 = func.call @stack_pop_pointer() : () -> i64
      %9011 = func.call @stack_pop_pointer() : () -> i64
      %9012 = func.call @cc_puthash(%9011, %9009, %9010) : (i64, i64, i64) -> i64
      %__rlasp_stack_elide_zero_651 = arith.constant 0 : i64
      %9013 = arith.addi %9012, %__rlasp_stack_elide_zero_651 : i64
      scf.yield %9013 : i64
    }
    %9014 = func.call @cc_nil_value() : () -> i64
    %9015 = func.call @cc_errorp(%9000) : (i64) -> i64
    %9016 = arith.cmpi ne, %9015, %9014 : i64
    %9017 = scf.if %9016 -> (i64) {
      scf.yield %9000 : i64
    } else {
      %__rlasp_stack_elide_zero_652 = arith.constant 0 : i64
      %9018 = arith.addi %8967, %__rlasp_stack_elide_zero_652 : i64
      scf.yield %9018 : i64
    }
    %__rlasp_stack_elide_zero_653 = arith.constant 0 : i64
    %9019 = arith.addi %9017, %__rlasp_stack_elide_zero_653 : i64
    %9020 = func.call @cc_multiple_value_list(%9019) : (i64) -> i64
    %9021 = llvm.mlir.addressof @str896 : !llvm.ptr
    %9022 = arith.constant 38 : i64
    %9023 = func.call @cc_make_string(%9021, %9022) : (!llvm.ptr, i64) -> i64
    %9024 = func.call @cc_nil_value() : () -> i64
    %9025 = func.call @cc_intern(%9023, %9024) : (i64, i64) -> i64
    %9026 = func.call @cc_nil_value() : () -> i64
    %9027 = func.call @cc_cons(%9025, %9026) : (i64, i64) -> i64
    %9028 = func.call @cc_values_pack(%9027) : (i64) -> i64
    %9029 = func.call @cc_symbol_value(%9025) : (i64) -> i64
    %9030 = llvm.mlir.addressof @str897 : !llvm.ptr
    %9031 = arith.constant 40 : i64
    %9032 = func.call @cc_make_string(%9030, %9031) : (!llvm.ptr, i64) -> i64
    %9033 = func.call @cc_nil_value() : () -> i64
    %9034 = func.call @cc_intern(%9032, %9033) : (i64, i64) -> i64
    %9035 = func.call @cc_nil_value() : () -> i64
    %9036 = func.call @cc_cons(%9034, %9035) : (i64, i64) -> i64
    %9037 = func.call @cc_values_pack(%9036) : (i64) -> i64
    %9038 = func.call @cc_symbol_value(%9034) : (i64) -> i64
    %9039 = func.call @cc_nil_value() : () -> i64
    %9040 = arith.cmpi ne, %9029, %9039 : i64
    %9041 = scf.if %9040 -> (i64) {
      scf.yield %9038 : i64
    } else {
      scf.yield %9020 : i64
    }
    %9042 = func.call @cc_values_pack(%9041) : (i64) -> i64
    func.call @stack_push_pointer(%9042) : (i64) -> ()
    func.return
  }
  func.func @"%FN%copy-%semaphore"() {
    %9388 = llvm.mlir.addressof @str914 : !llvm.ptr
    %9389 = arith.constant 15 : i64
    %9390 = func.call @cc_make_string(%9388, %9389) : (!llvm.ptr, i64) -> i64
    %9391 = func.call @cc_nil_value() : () -> i64
    %9392 = func.call @cc_intern(%9390, %9391) : (i64, i64) -> i64
    %9393 = func.call @cc_nil_value() : () -> i64
    %9394 = func.call @cc_cons(%9392, %9393) : (i64, i64) -> i64
    %9395 = func.call @cc_values_pack(%9394) : (i64) -> i64
    %9396 = llvm.mlir.addressof @str915 : !llvm.ptr
    %9397 = arith.constant 3 : i64
    %9398 = func.call @cc_make_string(%9396, %9397) : (!llvm.ptr, i64) -> i64
    %9399 = func.call @cc_register_function_lambda_list_metadata_raw(%9392, %9398) : (i64, i64) -> i64
    %9400 = func.call @stack_pop_pointer() : () -> i64
    %9401 = func.call @cc_nil_value() : () -> i64
    %9402 = llvm.mlir.addressof @str916 : !llvm.ptr
    %9403 = arith.constant 38 : i64
    %9404 = func.call @cc_make_string(%9402, %9403) : (!llvm.ptr, i64) -> i64
    %9405 = func.call @cc_nil_value() : () -> i64
    %9406 = func.call @cc_intern(%9404, %9405) : (i64, i64) -> i64
    %9407 = func.call @cc_nil_value() : () -> i64
    %9408 = func.call @cc_cons(%9406, %9407) : (i64, i64) -> i64
    %9409 = func.call @cc_values_pack(%9408) : (i64) -> i64
    %9410 = func.call @cc_set_symbol_value(%9406, %9401) : (i64, i64) -> i64
    %9411 = llvm.mlir.addressof @str917 : !llvm.ptr
    %9412 = arith.constant 39 : i64
    %9413 = func.call @cc_make_string(%9411, %9412) : (!llvm.ptr, i64) -> i64
    %9414 = func.call @cc_nil_value() : () -> i64
    %9415 = func.call @cc_intern(%9413, %9414) : (i64, i64) -> i64
    %9416 = func.call @cc_nil_value() : () -> i64
    %9417 = func.call @cc_cons(%9415, %9416) : (i64, i64) -> i64
    %9418 = func.call @cc_values_pack(%9417) : (i64) -> i64
    %9419 = func.call @cc_set_symbol_value(%9415, %9401) : (i64, i64) -> i64
    %9420 = llvm.mlir.addressof @str918 : !llvm.ptr
    %9421 = arith.constant 40 : i64
    %9422 = func.call @cc_make_string(%9420, %9421) : (!llvm.ptr, i64) -> i64
    %9423 = func.call @cc_nil_value() : () -> i64
    %9424 = func.call @cc_intern(%9422, %9423) : (i64, i64) -> i64
    %9425 = func.call @cc_nil_value() : () -> i64
    %9426 = func.call @cc_cons(%9424, %9425) : (i64, i64) -> i64
    %9427 = func.call @cc_values_pack(%9426) : (i64) -> i64
    %9428 = func.call @cc_set_symbol_value(%9424, %9401) : (i64, i64) -> i64
    %9429 = func.call @cc_nil_value() : () -> i64
    %9430 = func.call @cc_errorp(%9400) : (i64) -> i64
    %9431 = arith.cmpi ne, %9430, %9429 : i64
    %9432 = arith.cmpi eq, %9429, %9429 : i64
    %9433 = arith.andi %9431, %9432 : i1
    %9434 = scf.if %9433 -> (i64) {
      scf.yield %9400 : i64
    } else {
      scf.yield %9429 : i64
    }
    %9435 = arith.cmpi ne, %9434, %9429 : i64
    scf.if %9435 {
      func.call @stack_push_pointer(%9434) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%9400) : (i64) -> ()
      %9436 = llvm.mlir.addressof @str919 : !llvm.ptr
      %9437 = func.call @cc_make_function_ref_const(%9436) : (!llvm.ptr) -> i64
      %9438 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%9437, %9438) : (i64, i64) -> ()
    }
    %9439 = func.call @stack_pop_pointer() : () -> i64
    %9440 = func.call @cc_multiple_value_list(%9439) : (i64) -> i64
    %9441 = llvm.mlir.addressof @str920 : !llvm.ptr
    %9442 = arith.constant 38 : i64
    %9443 = func.call @cc_make_string(%9441, %9442) : (!llvm.ptr, i64) -> i64
    %9444 = func.call @cc_nil_value() : () -> i64
    %9445 = func.call @cc_intern(%9443, %9444) : (i64, i64) -> i64
    %9446 = func.call @cc_nil_value() : () -> i64
    %9447 = func.call @cc_cons(%9445, %9446) : (i64, i64) -> i64
    %9448 = func.call @cc_values_pack(%9447) : (i64) -> i64
    %9449 = func.call @cc_symbol_value(%9445) : (i64) -> i64
    %9450 = llvm.mlir.addressof @str921 : !llvm.ptr
    %9451 = arith.constant 40 : i64
    %9452 = func.call @cc_make_string(%9450, %9451) : (!llvm.ptr, i64) -> i64
    %9453 = func.call @cc_nil_value() : () -> i64
    %9454 = func.call @cc_intern(%9452, %9453) : (i64, i64) -> i64
    %9455 = func.call @cc_nil_value() : () -> i64
    %9456 = func.call @cc_cons(%9454, %9455) : (i64, i64) -> i64
    %9457 = func.call @cc_values_pack(%9456) : (i64) -> i64
    %9458 = func.call @cc_symbol_value(%9454) : (i64) -> i64
    %9459 = func.call @cc_nil_value() : () -> i64
    %9460 = arith.cmpi ne, %9449, %9459 : i64
    %9461 = scf.if %9460 -> (i64) {
      scf.yield %9458 : i64
    } else {
      scf.yield %9440 : i64
    }
    %9462 = func.call @cc_values_pack(%9461) : (i64) -> i64
    func.call @stack_push_pointer(%9462) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077415"() {
    %9522 = func.call @cc_nil_value() : () -> i64
    %9523 = func.call @cc_nil_value() : () -> i64
    %9524 = func.call @cc_errorp(%9522) : (i64) -> i64
    %9525 = arith.cmpi ne, %9524, %9523 : i64
    %9526 = scf.if %9525 -> (i64) {
      scf.yield %9522 : i64
    } else {
      %9527 = llvm.mlir.addressof @str929 : !llvm.ptr
      %9528 = arith.constant 10 : i64
      %9529 = func.call @cc_make_string(%9527, %9528) : (!llvm.ptr, i64) -> i64
      %9530 = func.call @cc_nil_value() : () -> i64
      %9531 = func.call @cc_intern(%9529, %9530) : (i64, i64) -> i64
      %9532 = func.call @cc_nil_value() : () -> i64
      %9533 = func.call @cc_cons(%9531, %9532) : (i64, i64) -> i64
      %9534 = func.call @cc_values_pack(%9533) : (i64) -> i64
      %__rlasp_stack_elide_zero_654 = arith.constant 0 : i64
      %9535 = arith.addi %9531, %__rlasp_stack_elide_zero_654 : i64
      scf.yield %9535 : i64
    }
    func.call @stack_push_pointer(%9526) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077416"() {
    %9623 = func.call @cc_nil_value() : () -> i64
    %9624 = func.call @cc_nil_value() : () -> i64
    %9625 = func.call @cc_errorp(%9623) : (i64) -> i64
    %9626 = arith.cmpi ne, %9625, %9624 : i64
    %9627 = scf.if %9626 -> (i64) {
      scf.yield %9623 : i64
    } else {
      %9628 = func.call @cc_nil_value() : () -> i64
      %9629 = arith.cmpi ne, %9628, %9628 : i64
      scf.if %9629 {
        func.call @stack_push_pointer(%9628) : (i64) -> ()
      } else {
        %9630 = llvm.mlir.addressof @str936 : !llvm.ptr
        %9631 = func.call @cc_make_function_ref_const(%9630) : (!llvm.ptr) -> i64
        %9632 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%9631, %9632) : (i64, i64) -> ()
      }
      %9633 = func.call @stack_pop_pointer() : () -> i64
      %9634 = func.call @cc_nil_value() : () -> i64
      %9635 = func.call @cc_errorp(%9633) : (i64) -> i64
      %9636 = arith.cmpi ne, %9635, %9634 : i64
      %9637 = arith.cmpi eq, %9634, %9634 : i64
      %9638 = arith.andi %9636, %9637 : i1
      %9639 = scf.if %9638 -> (i64) {
        scf.yield %9633 : i64
      } else {
        scf.yield %9634 : i64
      }
      %9640 = arith.cmpi ne, %9639, %9634 : i64
      scf.if %9640 {
        func.call @stack_push_pointer(%9639) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9633) : (i64) -> ()
        %9641 = llvm.mlir.addressof @str937 : !llvm.ptr
        %9642 = func.call @cc_make_function_ref_const(%9641) : (!llvm.ptr) -> i64
        %9643 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9642, %9643) : (i64, i64) -> ()
      }
      %9644 = func.call @stack_pop_pointer() : () -> i64
      %9645 = func.call @cc_nil_value() : () -> i64
      %9646 = func.call @cc_cons(%9644, %9645) : (i64, i64) -> i64
      %9647 = func.call @cc_not(%9646) : (i64) -> i64
      %__rlasp_stack_elide_zero_655 = arith.constant 0 : i64
      %9648 = arith.addi %9647, %__rlasp_stack_elide_zero_655 : i64
      %9649 = func.call @cc_nil_value() : () -> i64
      %9650 = func.call @cc_cons(%9648, %9649) : (i64, i64) -> i64
      %9651 = func.call @cc_not(%9650) : (i64) -> i64
      %__rlasp_stack_elide_zero_656 = arith.constant 0 : i64
      %9652 = arith.addi %9651, %__rlasp_stack_elide_zero_656 : i64
      scf.yield %9652 : i64
    }
    func.call @stack_push_pointer(%9627) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077417"() {
    %9758 = func.call @cc_nil_value() : () -> i64
    %9759 = func.call @cc_nil_value() : () -> i64
    %9760 = func.call @cc_errorp(%9758) : (i64) -> i64
    %9761 = arith.cmpi ne, %9760, %9759 : i64
    %9762 = scf.if %9761 -> (i64) {
      scf.yield %9758 : i64
    } else {
      %9763 = llvm.mlir.addressof @str946 : !llvm.ptr
      %9764 = arith.constant 6 : i64
      %9765 = func.call @cc_make_string(%9763, %9764) : (!llvm.ptr, i64) -> i64
      %9766 = llvm.mlir.addressof @str947 : !llvm.ptr
      %9767 = arith.constant 11 : i64
      %9768 = func.call @cc_make_string(%9766, %9767) : (!llvm.ptr, i64) -> i64
      %9769 = func.call @cc_intern(%9765, %9768) : (i64, i64) -> i64
      %9770 = func.call @cc_nil_value() : () -> i64
      %9771 = func.call @cc_cons(%9769, %9770) : (i64, i64) -> i64
      %9772 = func.call @cc_values_pack(%9771) : (i64) -> i64
      %__rlasp_stack_elide_zero_657 = arith.constant 0 : i64
      %9773 = arith.addi %9769, %__rlasp_stack_elide_zero_657 : i64
      scf.yield %9773 : i64
    }
    func.call @stack_push_pointer(%9762) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077418"() {
    %9928 = func.call @cc_nil_value() : () -> i64
    %9929 = func.call @cc_nil_value() : () -> i64
    %9930 = func.call @cc_errorp(%9928) : (i64) -> i64
    %9931 = arith.cmpi ne, %9930, %9929 : i64
    %9932 = scf.if %9931 -> (i64) {
      scf.yield %9928 : i64
    } else {
      %9933 = llvm.mlir.addressof @str961 : !llvm.ptr
      %9934 = arith.constant 5 : i64
      %9935 = func.call @cc_make_string(%9933, %9934) : (!llvm.ptr, i64) -> i64
      %9936 = llvm.mlir.addressof @str962 : !llvm.ptr
      %9937 = arith.constant 7 : i64
      %9938 = func.call @cc_make_string(%9936, %9937) : (!llvm.ptr, i64) -> i64
      %9939 = func.call @cc_intern(%9935, %9938) : (i64, i64) -> i64
      %9940 = func.call @cc_nil_value() : () -> i64
      %9941 = func.call @cc_cons(%9939, %9940) : (i64, i64) -> i64
      %9942 = func.call @cc_values_pack(%9941) : (i64) -> i64
      %9943 = func.call @cc_nil_value() : () -> i64
      %9944 = func.call @cc_nil_value() : () -> i64
      %9945 = func.call @cc_errorp(%9943) : (i64) -> i64
      %9946 = arith.cmpi ne, %9945, %9944 : i64
      %9947 = scf.if %9946 -> (i64) {
        scf.yield %9943 : i64
      } else {
        func.call @stack_push_pointer(%9939) : (i64) -> ()
        %9948 = llvm.mlir.addressof @str963 : !llvm.ptr
        %9949 = arith.constant 12 : i64
        %9950 = func.call @cc_make_string(%9948, %9949) : (!llvm.ptr, i64) -> i64
        %9951 = func.call @cc_nil_value() : () -> i64
        %9952 = func.call @cc_intern(%9950, %9951) : (i64, i64) -> i64
        %9953 = func.call @cc_nil_value() : () -> i64
        %9954 = func.call @cc_cons(%9952, %9953) : (i64, i64) -> i64
        %9955 = func.call @cc_values_pack(%9954) : (i64) -> i64
        %__rlasp_stack_elide_zero_658 = arith.constant 0 : i64
        %9956 = arith.addi %9952, %__rlasp_stack_elide_zero_658 : i64
        %9957 = func.call @stack_pop_pointer() : () -> i64
        %9958 = func.call @cc_typep(%9957, %9956) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_659 = arith.constant 0 : i64
        %9959 = arith.addi %9958, %__rlasp_stack_elide_zero_659 : i64
        scf.yield %9959 : i64
      }
      %__rlasp_stack_elide_zero_660 = arith.constant 0 : i64
      %9960 = arith.addi %9947, %__rlasp_stack_elide_zero_660 : i64
      %9961 = func.call @cc_nil_value() : () -> i64
      %9962 = func.call @cc_cons(%9960, %9961) : (i64, i64) -> i64
      %9963 = func.call @cc_not(%9962) : (i64) -> i64
      %__rlasp_stack_elide_zero_661 = arith.constant 0 : i64
      %9964 = arith.addi %9963, %__rlasp_stack_elide_zero_661 : i64
      %9965 = func.call @cc_nil_value() : () -> i64
      %9966 = func.call @cc_cons(%9964, %9965) : (i64, i64) -> i64
      %9967 = func.call @cc_not(%9966) : (i64) -> i64
      %__rlasp_stack_elide_zero_662 = arith.constant 0 : i64
      %9968 = arith.addi %9967, %__rlasp_stack_elide_zero_662 : i64
      scf.yield %9968 : i64
    }
    func.call @stack_push_pointer(%9932) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077419"() {
    %10200 = func.call @cc_nil_value() : () -> i64
    %10201 = func.call @cc_nil_value() : () -> i64
    %10202 = func.call @cc_errorp(%10200) : (i64) -> i64
    %10203 = arith.cmpi ne, %10202, %10201 : i64
    %10204 = scf.if %10203 -> (i64) {
      scf.yield %10200 : i64
    } else {
      %10205 = func.call @cc_nil_value() : () -> i64
      %10206 = func.call @cc_nil_value() : () -> i64
      %10207 = func.call @cc_errorp(%10205) : (i64) -> i64
      %10208 = arith.cmpi ne, %10207, %10206 : i64
      %10209 = scf.if %10208 -> (i64) {
        scf.yield %10205 : i64
      } else {
        %10210 = arith.constant 0 : i64
        %10211 = func.call @cc_box_fixnum(%10210) : (i64) -> i64
        %10212 = func.call @cc_make_vector(%10211) : (i64) -> i64
        func.call @stack_push_pointer(%10212) : (i64) -> ()
        %10213 = llvm.mlir.addressof @str984 : !llvm.ptr
        %10214 = arith.constant 5 : i64
        %10215 = func.call @cc_make_string(%10213, %10214) : (!llvm.ptr, i64) -> i64
        %10216 = llvm.mlir.addressof @str985 : !llvm.ptr
        %10217 = arith.constant 11 : i64
        %10218 = func.call @cc_make_string(%10216, %10217) : (!llvm.ptr, i64) -> i64
        %10219 = func.call @cc_intern(%10215, %10218) : (i64, i64) -> i64
        %10220 = func.call @cc_nil_value() : () -> i64
        %10221 = func.call @cc_cons(%10219, %10220) : (i64, i64) -> i64
        %10222 = func.call @cc_values_pack(%10221) : (i64) -> i64
        func.call @stack_push_pointer(%10219) : (i64) -> ()
        %10223 = llvm.mlir.addressof @str986 : !llvm.ptr
        %10224 = arith.constant 1 : i64
        %10225 = func.call @cc_make_string(%10223, %10224) : (!llvm.ptr, i64) -> i64
        %10226 = llvm.mlir.addressof @str987 : !llvm.ptr
        %10227 = arith.constant 11 : i64
        %10228 = func.call @cc_make_string(%10226, %10227) : (!llvm.ptr, i64) -> i64
        %10229 = func.call @cc_intern(%10225, %10228) : (i64, i64) -> i64
        %10230 = func.call @cc_nil_value() : () -> i64
        %10231 = func.call @cc_cons(%10229, %10230) : (i64, i64) -> i64
        %10232 = func.call @cc_values_pack(%10231) : (i64) -> i64
        func.call @stack_push_pointer(%10229) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %10233 = func.call @stack_pop_pointer() : () -> i64
        %10234 = func.call @stack_pop_pointer() : () -> i64
        %10235 = func.call @cc_cons(%10234, %10233) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_663 = arith.constant 0 : i64
        %10236 = arith.addi %10235, %__rlasp_stack_elide_zero_663 : i64
        %10237 = func.call @stack_pop_pointer() : () -> i64
        %10238 = func.call @cc_cons(%10237, %10236) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_664 = arith.constant 0 : i64
        %10239 = arith.addi %10238, %__rlasp_stack_elide_zero_664 : i64
        %10240 = func.call @stack_pop_pointer() : () -> i64
        %10241 = func.call @cc_cons(%10240, %10239) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_665 = arith.constant 0 : i64
        %10242 = arith.addi %10241, %__rlasp_stack_elide_zero_665 : i64
        %10243 = func.call @stack_pop_pointer() : () -> i64
        %10244 = func.call @cc_typep(%10243, %10242) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_666 = arith.constant 0 : i64
        %10245 = arith.addi %10244, %__rlasp_stack_elide_zero_666 : i64
        %10246 = func.call @cc_nil_value() : () -> i64
        %10247 = arith.cmpi eq, %10245, %10246 : i64
        %10249 = func.call @cc_t_value() : () -> i64
        %10248 = arith.select %10247, %10249, %10246 : i64
        %__rlasp_stack_elide_zero_667 = arith.constant 0 : i64
        %10250 = arith.addi %10248, %__rlasp_stack_elide_zero_667 : i64
        scf.yield %10250 : i64
      }
      %__rlasp_stack_elide_zero_668 = arith.constant 0 : i64
      %10251 = arith.addi %10209, %__rlasp_stack_elide_zero_668 : i64
      %10252 = func.call @cc_nil_value() : () -> i64
      %10253 = func.call @cc_cons(%10251, %10252) : (i64, i64) -> i64
      %10254 = func.call @cc_not(%10253) : (i64) -> i64
      %__rlasp_stack_elide_zero_669 = arith.constant 0 : i64
      %10255 = arith.addi %10254, %__rlasp_stack_elide_zero_669 : i64
      %10256 = func.call @cc_nil_value() : () -> i64
      %10257 = func.call @cc_cons(%10255, %10256) : (i64, i64) -> i64
      %10258 = func.call @cc_not(%10257) : (i64) -> i64
      %__rlasp_stack_elide_zero_670 = arith.constant 0 : i64
      %10259 = arith.addi %10258, %__rlasp_stack_elide_zero_670 : i64
      scf.yield %10259 : i64
    }
    func.call @stack_push_pointer(%10204) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1("object\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_206494159077376*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_206494159077376*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_206494159077376*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("Returns T if OBJECT is a semaphore; returns NIL otherwise.\00") : !llvm.array<59 x i8>
  llvm.mlir.global private constant @str6("SEMAPHORE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_206494159077376*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETMVLIST_206494159077376*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str9("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_206494159077377*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_206494159077377*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_206494159077377*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str13("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("TYPES-CLASSES-1\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str15("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str16("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str17("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str18("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str19("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str20("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str22("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str28("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str33("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str34("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str36("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str38("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str44("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str45("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str49("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str51("TYPES-CLASSES-2\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str52("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str53("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str54("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str57("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str59("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str61("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str67("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str68("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str70("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str71("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str73("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str75("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str79("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str80("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str81("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str82("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str88("TYPES-CLASSES-3\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str89("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str90("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str91("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str94("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str96("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str97("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str100("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str102("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str107("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str108("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str110("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str112("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str114("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str116("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str117("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str118("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str119("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str124("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str125("TYPES-CLASSES-4\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str126("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str127("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str131("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str133("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str141("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str142("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str143("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str144("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str145("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str147("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str149("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str153("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str154("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str155("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str156("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str158("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str159("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str160("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str161("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str162("TYPES-CLASSES-5\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str163("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str164("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str168("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str170("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str172("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str173("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str176("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str179("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str181("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str182("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str184("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str185("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str186("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str188("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str190("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str191("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str192("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str193("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str198("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str199("TYPES-CLASSES-6\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str200("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str201("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str202("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str203("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str204("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str205("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str207("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str208("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str209("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str210("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str211("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str213("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str214("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str215("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str216("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str217("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str218("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str221("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str223("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str226("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str227("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str228("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str229("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str230("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str232("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str233("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str234("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str235("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str236("TYPES-CLASSES-7\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str237("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str238("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str239("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str240("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str242("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str243("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str244("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str245("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str249("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str250("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str251("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str252("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str255("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str256("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str257("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str258("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str259("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str260("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str264("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str265("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str266("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str267("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str268("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str269("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str270("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str271("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str272("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str273("TYPES-CLASSES-8\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str274("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str275("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str276("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str277("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str279("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str281("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str283("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str285("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str286("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str287("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str288("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str289("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str292("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str293("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str295("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str296("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str297("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str299("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str300("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str301("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str304("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str306("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str307("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str308("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str309("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str310("TYPES-CLASSES-9\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str311("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str312("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str313("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("CLASS-OF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str316("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str318("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str319("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str320("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str321("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str322("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str323("TYPES-CLASSES-10\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str324("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str325("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str326("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str331("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str333("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str335("COMMON-LISP::CAR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str336("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str337("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str338("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str339("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str340("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str341("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str342("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str343("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str344("ARRAY.9.8\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str345("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str346("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str347("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str348("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str349("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str350("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str351("B\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str352("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str353("D\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str354("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str355("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str356("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str357("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str358("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str359("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str360("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str361("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str362("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str363("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str364("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str365("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str366("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str367("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str368("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str369("#:%%DYN-CELL-206494159077389-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str370("#:%%DYN-CELL-206494159077390-B\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str371("#:%%DYN-CELL-206494159077391-C\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str372("#:%%DYN-CELL-206494159077392-D\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str373("#:%%DYN-CELL-206494159077393-E\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str374("#:%%DYN-CELL-206494159077394-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str375("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str376("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str377("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str378("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str379("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str380("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str381("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str382("TYPES-CLASSES-11-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str383("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str384("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str385("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str386("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str387("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str388("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str389("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str390("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str391("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str392("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str393("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str394("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str395("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str396("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str397("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str398("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str399("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str400("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str401("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str404("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str406("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str407("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str408("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str409("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str410("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str411("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str412("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str413("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str414("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str415("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str416("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str417("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str418("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str419("TYPES-CLASSES-11-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str420("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str421("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str422("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str423("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str425("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str427("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str428("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str429("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str430("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str431("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str432("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str433("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str434("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str435("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str436("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str437("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str438("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str439("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str440("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str441("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str443("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str445("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str446("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str447("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str448("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str449("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str450("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str451("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str452("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str453("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str454("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str455("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str456("TYPES-CLASSES-12-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str457("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str458("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str459("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str460("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str461("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str462("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str463("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str464("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str465("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str469("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str470("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str471("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str473("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str475("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str476("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str477("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str478("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str479("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str480("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str482("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str483("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str485("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str486("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str487("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str488("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str489("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str490("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str491("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str492("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str493("TYPES-CLASSES-12-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str494("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str495("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str496("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str497("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str498("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str499("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str501("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str502("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str503("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str504("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str505("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str506("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str507("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str508("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str509("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str510("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str511("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str512("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str513("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str514("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str515("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str516("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str517("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str518("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str519("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str520("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str521("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str522("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str523("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str524("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str525("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str526("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str527("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str528("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str529("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str530("TYPES-CLASSES-13-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str531("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str532("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str533("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str534("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str535("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str536("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str538("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str539("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str540("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str541("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str542("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str543("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str544("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str545("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str547("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str549("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str550("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str551("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str552("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str553("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str554("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str555("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str556("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str557("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str558("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str559("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str560("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str561("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str562("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str563("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str564("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str565("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str566("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str567("TYPES-CLASSES-13-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str568("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str569("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str570("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str571("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str572("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str573("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str574("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str575("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str577("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str578("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str579("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str580("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str581("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str582("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str583("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str584("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str585("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str586("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str587("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str588("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str589("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str590("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str591("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str592("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str593("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str594("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str595("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str596("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str597("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str598("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str599("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str600("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str601("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str602("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str603("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str604("TYPES-CLASSES-14-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str605("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str606("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str607("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str608("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str609("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str610("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str611("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str612("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str613("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str614("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str615("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str616("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str617("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str618("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str619("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str620("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str621("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str622("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str623("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str624("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str625("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str626("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str627("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str628("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str629("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str630("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str631("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str632("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str633("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str634("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str635("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str636("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str637("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str638("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str639("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str640("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str641("TYPES-CLASSES-14-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str642("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str643("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str644("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str645("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str646("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str647("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str648("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str649("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str650("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str651("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str652("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str655("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str656("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str657("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str658("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str659("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str660("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str661("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str662("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str663("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str664("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str665("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str666("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str667("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str668("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str669("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str670("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str671("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str672("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str673("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str674("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str675("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str676("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str677("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str678("TYPES-CLASSES-15-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str679("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str680("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str681("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str682("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str683("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str684("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str685("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str686("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str687("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str688("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str689("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str690("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str691("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str692("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str693("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str694("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str695("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str696("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str697("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str698("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str699("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str700("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str701("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str702("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str703("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str704("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str705("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str706("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str707("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str708("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str709("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str710("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str711("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str712("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str713("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str714("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str715("TYPES-CLASSES-15-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str716("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str717("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str718("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str719("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str720("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str721("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str722("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str723("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str724("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str725("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str726("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str727("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str729("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str730("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str731("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str732("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str733("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str734("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str735("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str736("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str737("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str738("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str739("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str740("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str741("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str742("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str743("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str744("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str745("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str746("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str747("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str748("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str749("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str750("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str751("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str752("SUBTYPEP-BUG-979\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str753("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str754("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str755("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str756("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str757("CONS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str758("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str759("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str760("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str761("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str762("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str763("MEMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str764("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str765("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str766("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str767("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str768("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str769("CONS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str770("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str771("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str772("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str773("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str774("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str775("MEMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str776("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str777("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str778("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str779("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str780("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str781("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str782("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str783("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str784("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str785("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str786("lock\0Acondition-variable\0Acounter\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str787("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str788("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str789("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str790("*__MLIR_BLOCK_RETFLAG_206494159077406*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str791("*__MLIR_BLOCK_RETVALUE_206494159077406*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str792("*__MLIR_BLOCK_RETMVLIST_206494159077406*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str793("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str794("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str795("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str796("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str797("si::mark-hash-table-structure\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str798("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str799("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str800("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str801("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str802("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str803("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str804("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str805("*__MLIR_BLOCK_RETFLAG_206494159077406*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str806("*__MLIR_BLOCK_RETMVLIST_206494159077406*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str807("lock\0Acondition-variable\0Acounter\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str808("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str809("%FN%make-%semaphore\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str810("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str811("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str812("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str813("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str814("*__MLIR_BLOCK_RETFLAG_206494159077407*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str815("*__MLIR_BLOCK_RETVALUE_206494159077407*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str816("*__MLIR_BLOCK_RETMVLIST_206494159077407*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str817("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str818("*__MLIR_BLOCK_RETFLAG_206494159077407*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str819("*__MLIR_BLOCK_RETMVLIST_206494159077407*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str820("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str821("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str822("%FN%%semaphore-p\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str823("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str824("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str825("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str826("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str827("*__MLIR_BLOCK_RETFLAG_206494159077408*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str828("*__MLIR_BLOCK_RETVALUE_206494159077408*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str829("*__MLIR_BLOCK_RETMVLIST_206494159077408*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str830("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str831("*__MLIR_BLOCK_RETFLAG_206494159077408*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str832("*__MLIR_BLOCK_RETMVLIST_206494159077408*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str833("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str834("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str835("%FN%%semaphore-lock\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str836("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str837("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str838("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str839("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str840("*__MLIR_BLOCK_RETFLAG_206494159077409*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str841("*__MLIR_BLOCK_RETVALUE_206494159077409*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str842("*__MLIR_BLOCK_RETMVLIST_206494159077409*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str843("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str844("*__MLIR_BLOCK_RETFLAG_206494159077409*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str845("*__MLIR_BLOCK_RETMVLIST_206494159077409*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str846("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str847("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str848("%FN%(setf %semaphore-lock)\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str849("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str850("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str851("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str852("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str853("*__MLIR_BLOCK_RETFLAG_206494159077410*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str854("*__MLIR_BLOCK_RETVALUE_206494159077410*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str855("*__MLIR_BLOCK_RETMVLIST_206494159077410*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str856("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str857("*__MLIR_BLOCK_RETFLAG_206494159077410*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str858("*__MLIR_BLOCK_RETMVLIST_206494159077410*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str859("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str860("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str861("%FN%%semaphore-condition-variable\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str862("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str863("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str864("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str865("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str866("*__MLIR_BLOCK_RETFLAG_206494159077411*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str867("*__MLIR_BLOCK_RETVALUE_206494159077411*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str868("*__MLIR_BLOCK_RETMVLIST_206494159077411*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str869("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str870("*__MLIR_BLOCK_RETFLAG_206494159077411*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str871("*__MLIR_BLOCK_RETMVLIST_206494159077411*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str872("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str873("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str874("%FN%(setf %semaphore-condition-variable)\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str875("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str876("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str877("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str878("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str879("*__MLIR_BLOCK_RETFLAG_206494159077412*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str880("*__MLIR_BLOCK_RETVALUE_206494159077412*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str881("*__MLIR_BLOCK_RETMVLIST_206494159077412*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str882("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str883("*__MLIR_BLOCK_RETFLAG_206494159077412*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str884("*__MLIR_BLOCK_RETMVLIST_206494159077412*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str885("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str886("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str887("%FN%%semaphore-counter\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str888("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str889("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str890("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str891("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str892("*__MLIR_BLOCK_RETFLAG_206494159077413*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str893("*__MLIR_BLOCK_RETVALUE_206494159077413*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str894("*__MLIR_BLOCK_RETMVLIST_206494159077413*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str895("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str896("*__MLIR_BLOCK_RETFLAG_206494159077413*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str897("*__MLIR_BLOCK_RETMVLIST_206494159077413*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str898("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str899("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str900("%FN%(setf %semaphore-counter)\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str901("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str902("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str903("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str904("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str905("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str906("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str907("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str908("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str909("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str910("HASH-TABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str911("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str912("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str913("si::register-struct-definition\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str914("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str915("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str916("*__MLIR_BLOCK_RETFLAG_206494159077414*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str917("*__MLIR_BLOCK_RETVALUE_206494159077414*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str918("*__MLIR_BLOCK_RETMVLIST_206494159077414*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str919("copy-hash-table\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str920("*__MLIR_BLOCK_RETFLAG_206494159077414*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str921("*__MLIR_BLOCK_RETMVLIST_206494159077414*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str922("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str923("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str924("%FN%copy-%semaphore\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str925("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str926("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str927("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str928("SEMAPHORE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str929("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str930("register-deftype-alias\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str931("ISSUE-1252\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str932("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str933("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str934("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str935("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str936("%FN%make-%semaphore\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str937("%FN%semaphore-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str938("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str939("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str940("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str941("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str942("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str943("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str944("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str945("GESTURE-NAME\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str946("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str947("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str948("register-deftype-alias\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str949("ISSUE-1252A\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str950("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str951("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str952("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str953("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str954("ABORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str955("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str956("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str957("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str958("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str959("GESTURE-NAME\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str960("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str961("ABORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str962("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str963("GESTURE-NAME\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str964("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str965("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str966("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str967("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str968("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str969("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str970("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str971("ISSUE-1308\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str972("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str973("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str974("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str975("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str976("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str977("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str978("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str979("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str980("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str981("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str982("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str983("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str984("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str985("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str986("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str987("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str988("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str989("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str990("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str991("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str992("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str993("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str994("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str995("*__MLIR_BLOCK_RETFLAG_206494159077377*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str996("*__MLIR_BLOCK_RETMVLIST_206494159077377*\00") : !llvm.array<41 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%make-%semaphore\00%FN%make-%semaphore\00\00") : !llvm.array<41 x i8>
}
