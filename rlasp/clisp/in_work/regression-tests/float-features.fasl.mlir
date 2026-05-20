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
  func.func @"%FN%foo-ext-1"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 9 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 1 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = llvm.mlir.addressof @str2 : !llvm.ptr
    %16 = arith.constant 38 : i64
    %17 = func.call @cc_make_string(%15, %16) : (!llvm.ptr, i64) -> i64
    %18 = func.call @cc_nil_value() : () -> i64
    %19 = func.call @cc_intern(%17, %18) : (i64, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = func.call @cc_cons(%19, %20) : (i64, i64) -> i64
    %22 = func.call @cc_values_pack(%21) : (i64) -> i64
    %23 = func.call @cc_set_symbol_value(%19, %14) : (i64, i64) -> i64
    %24 = llvm.mlir.addressof @str3 : !llvm.ptr
    %25 = arith.constant 39 : i64
    %26 = func.call @cc_make_string(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = func.call @cc_nil_value() : () -> i64
    %28 = func.call @cc_intern(%26, %27) : (i64, i64) -> i64
    %29 = func.call @cc_nil_value() : () -> i64
    %30 = func.call @cc_cons(%28, %29) : (i64, i64) -> i64
    %31 = func.call @cc_values_pack(%30) : (i64) -> i64
    %32 = func.call @cc_set_symbol_value(%28, %14) : (i64, i64) -> i64
    %33 = llvm.mlir.addressof @str4 : !llvm.ptr
    %34 = arith.constant 40 : i64
    %35 = func.call @cc_make_string(%33, %34) : (!llvm.ptr, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_intern(%35, %36) : (i64, i64) -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_cons(%37, %38) : (i64, i64) -> i64
    %40 = func.call @cc_values_pack(%39) : (i64) -> i64
    %41 = func.call @cc_set_symbol_value(%37, %14) : (i64, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = llvm.mlir.addressof @str5 : !llvm.ptr
    %44 = arith.constant 38 : i64
    %45 = func.call @cc_make_string(%43, %44) : (!llvm.ptr, i64) -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_intern(%45, %46) : (i64, i64) -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_cons(%47, %48) : (i64, i64) -> i64
    %50 = func.call @cc_values_pack(%49) : (i64) -> i64
    %51 = func.call @cc_set_symbol_value(%47, %42) : (i64, i64) -> i64
    %52 = llvm.mlir.addressof @str6 : !llvm.ptr
    %53 = arith.constant 39 : i64
    %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
    %55 = func.call @cc_nil_value() : () -> i64
    %56 = func.call @cc_intern(%54, %55) : (i64, i64) -> i64
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_cons(%56, %57) : (i64, i64) -> i64
    %59 = func.call @cc_values_pack(%58) : (i64) -> i64
    %60 = func.call @cc_set_symbol_value(%56, %42) : (i64, i64) -> i64
    %61 = llvm.mlir.addressof @str7 : !llvm.ptr
    %62 = arith.constant 40 : i64
    %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = func.call @cc_intern(%63, %64) : (i64, i64) -> i64
    %66 = func.call @cc_nil_value() : () -> i64
    %67 = func.call @cc_cons(%65, %66) : (i64, i64) -> i64
    %68 = func.call @cc_values_pack(%67) : (i64) -> i64
    %69 = func.call @cc_set_symbol_value(%65, %42) : (i64, i64) -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %70 = func.call @stack_pop_pointer() : () -> i64
    %71 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%71) : (i64) -> ()
    %72 = func.call @stack_pop_pointer() : () -> i64
    %73 = func.call @cc_random(%72) : (i64) -> i64
    func.call @stack_push_pointer(%73) : (i64) -> ()
    %74 = func.call @stack_pop_pointer() : () -> i64
    %75 = arith.constant 1 : i1
    %77 = arith.constant 3 : i64
    %76 = arith.andi %70, %77 : i64
    %78 = arith.constant 0 : i64
    %79 = arith.cmpi eq, %76, %78 : i64
    %81 = arith.constant 3 : i64
    %80 = arith.andi %74, %81 : i64
    %82 = arith.constant 0 : i64
    %83 = arith.cmpi eq, %80, %82 : i64
    %84 = arith.andi %79, %83 : i1
    %85 = scf.if %84 -> (i1) {
      %86 = arith.constant 2 : i64
      %87 = arith.shrsi %70, %86 : i64
      %88 = arith.constant 2 : i64
      %89 = arith.shrsi %74, %88 : i64
      %90 = arith.cmpi sgt, %87, %89 : i64
      scf.yield %90 : i1
    } else {
      %91 = func.call @cc_gt(%70, %74) : (i64, i64) -> i64
      %92 = func.call @cc_nil_value() : () -> i64
      %93 = arith.cmpi ne, %91, %92 : i64
      scf.yield %93 : i1
    }
    %94 = arith.andi %75, %85 : i1
    %95 = func.call @cc_nil_value() : () -> i64
    %96 = func.call @cc_t_value() : () -> i64
    %97 = scf.if %94 -> (i64) {
      scf.yield %96 : i64
    } else {
      scf.yield %95 : i64
    }
    func.call @stack_push_pointer(%97) : (i64) -> ()
    %98 = func.call @stack_pop_pointer() : () -> i64
    %99 = func.call @cc_nil_value() : () -> i64
    %100 = arith.cmpi ne, %98, %99 : i64
    scf.if %100 {
      %101 = llvm.mlir.addressof @str8 : !llvm.ptr
      %102 = arith.constant 24 : i64
      %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
      %104 = llvm.mlir.addressof @str9 : !llvm.ptr
      %105 = arith.constant 11 : i64
      %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
      %107 = func.call @cc_intern(%103, %106) : (i64, i64) -> i64
      %108 = func.call @cc_nil_value() : () -> i64
      %109 = func.call @cc_cons(%107, %108) : (i64, i64) -> i64
      %110 = func.call @cc_values_pack(%109) : (i64) -> i64
      %111 = func.call @cc_symbol_value(%107) : (i64) -> i64
      func.call @stack_push_pointer(%111) : (i64) -> ()
    } else {
      %112 = llvm.mlir.addressof @str10 : !llvm.ptr
      %113 = arith.constant 24 : i64
      %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
      %115 = llvm.mlir.addressof @str11 : !llvm.ptr
      %116 = arith.constant 11 : i64
      %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
      %118 = func.call @cc_intern(%114, %117) : (i64, i64) -> i64
      %119 = func.call @cc_nil_value() : () -> i64
      %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
      %121 = func.call @cc_values_pack(%120) : (i64) -> i64
      %122 = func.call @cc_symbol_value(%118) : (i64) -> i64
      func.call @stack_push_pointer(%122) : (i64) -> ()
    }
    %123 = func.call @stack_pop_pointer() : () -> i64
    %124 = func.call @cc_multiple_value_list(%123) : (i64) -> i64
    %125 = llvm.mlir.addressof @str12 : !llvm.ptr
    %126 = arith.constant 38 : i64
    %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = func.call @cc_intern(%127, %128) : (i64, i64) -> i64
    %130 = func.call @cc_nil_value() : () -> i64
    %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
    %132 = func.call @cc_values_pack(%131) : (i64) -> i64
    %133 = func.call @cc_symbol_value(%129) : (i64) -> i64
    %134 = llvm.mlir.addressof @str13 : !llvm.ptr
    %135 = arith.constant 39 : i64
    %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
    %137 = func.call @cc_nil_value() : () -> i64
    %138 = func.call @cc_intern(%136, %137) : (i64, i64) -> i64
    %139 = func.call @cc_nil_value() : () -> i64
    %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
    %141 = func.call @cc_values_pack(%140) : (i64) -> i64
    %142 = func.call @cc_symbol_value(%138) : (i64) -> i64
    %143 = llvm.mlir.addressof @str14 : !llvm.ptr
    %144 = arith.constant 40 : i64
    %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
    %146 = func.call @cc_nil_value() : () -> i64
    %147 = func.call @cc_intern(%145, %146) : (i64, i64) -> i64
    %148 = func.call @cc_nil_value() : () -> i64
    %149 = func.call @cc_cons(%147, %148) : (i64, i64) -> i64
    %150 = func.call @cc_values_pack(%149) : (i64) -> i64
    %151 = func.call @cc_symbol_value(%147) : (i64) -> i64
    %152 = func.call @cc_nil_value() : () -> i64
    %153 = arith.cmpi ne, %133, %152 : i64
    %154 = scf.if %153 -> (i64) {
      scf.yield %151 : i64
    } else {
      scf.yield %124 : i64
    }
    %155 = func.call @cc_values_pack(%154) : (i64) -> i64
    func.call @stack_push_pointer(%155) : (i64) -> ()
    %156 = func.call @stack_pop_pointer() : () -> i64
    %157 = func.call @cc_multiple_value_list(%156) : (i64) -> i64
    %158 = llvm.mlir.addressof @str15 : !llvm.ptr
    %159 = arith.constant 38 : i64
    %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
    %161 = func.call @cc_nil_value() : () -> i64
    %162 = func.call @cc_intern(%160, %161) : (i64, i64) -> i64
    %163 = func.call @cc_nil_value() : () -> i64
    %164 = func.call @cc_cons(%162, %163) : (i64, i64) -> i64
    %165 = func.call @cc_values_pack(%164) : (i64) -> i64
    %166 = func.call @cc_symbol_value(%162) : (i64) -> i64
    %167 = llvm.mlir.addressof @str16 : !llvm.ptr
    %168 = arith.constant 40 : i64
    %169 = func.call @cc_make_string(%167, %168) : (!llvm.ptr, i64) -> i64
    %170 = func.call @cc_nil_value() : () -> i64
    %171 = func.call @cc_intern(%169, %170) : (i64, i64) -> i64
    %172 = func.call @cc_nil_value() : () -> i64
    %173 = func.call @cc_cons(%171, %172) : (i64, i64) -> i64
    %174 = func.call @cc_values_pack(%173) : (i64) -> i64
    %175 = func.call @cc_symbol_value(%171) : (i64) -> i64
    %176 = func.call @cc_nil_value() : () -> i64
    %177 = arith.cmpi ne, %166, %176 : i64
    %178 = scf.if %177 -> (i64) {
      scf.yield %175 : i64
    } else {
      scf.yield %157 : i64
    }
    %179 = func.call @cc_values_pack(%178) : (i64) -> i64
    func.call @stack_push_pointer(%179) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%bar-ext-1"() {
    %180 = llvm.mlir.addressof @str17 : !llvm.ptr
    %181 = arith.constant 9 : i64
    %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
    %183 = func.call @cc_nil_value() : () -> i64
    %184 = func.call @cc_intern(%182, %183) : (i64, i64) -> i64
    %185 = func.call @cc_nil_value() : () -> i64
    %186 = func.call @cc_cons(%184, %185) : (i64, i64) -> i64
    %187 = func.call @cc_values_pack(%186) : (i64) -> i64
    %188 = llvm.mlir.addressof @str18 : !llvm.ptr
    %189 = arith.constant 1 : i64
    %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
    %191 = func.call @cc_register_function_lambda_list_metadata_raw(%184, %190) : (i64, i64) -> i64
    %192 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%184, %192) : (i64, i64) -> ()
    %193 = func.call @stack_pop_pointer() : () -> i64
    %194 = func.call @cc_nil_value() : () -> i64
    %195 = llvm.mlir.addressof @str19 : !llvm.ptr
    %196 = arith.constant 38 : i64
    %197 = func.call @cc_make_string(%195, %196) : (!llvm.ptr, i64) -> i64
    %198 = func.call @cc_nil_value() : () -> i64
    %199 = func.call @cc_intern(%197, %198) : (i64, i64) -> i64
    %200 = func.call @cc_nil_value() : () -> i64
    %201 = func.call @cc_cons(%199, %200) : (i64, i64) -> i64
    %202 = func.call @cc_values_pack(%201) : (i64) -> i64
    %203 = func.call @cc_set_symbol_value(%199, %194) : (i64, i64) -> i64
    %204 = llvm.mlir.addressof @str20 : !llvm.ptr
    %205 = arith.constant 39 : i64
    %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
    %207 = func.call @cc_nil_value() : () -> i64
    %208 = func.call @cc_intern(%206, %207) : (i64, i64) -> i64
    %209 = func.call @cc_nil_value() : () -> i64
    %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
    %211 = func.call @cc_values_pack(%210) : (i64) -> i64
    %212 = func.call @cc_set_symbol_value(%208, %194) : (i64, i64) -> i64
    %213 = llvm.mlir.addressof @str21 : !llvm.ptr
    %214 = arith.constant 40 : i64
    %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
    %216 = func.call @cc_nil_value() : () -> i64
    %217 = func.call @cc_intern(%215, %216) : (i64, i64) -> i64
    %218 = func.call @cc_nil_value() : () -> i64
    %219 = func.call @cc_cons(%217, %218) : (i64, i64) -> i64
    %220 = func.call @cc_values_pack(%219) : (i64) -> i64
    %221 = func.call @cc_set_symbol_value(%217, %194) : (i64, i64) -> i64
    %222 = func.call @cc_nil_value() : () -> i64
    %223 = llvm.mlir.addressof @str22 : !llvm.ptr
    %224 = arith.constant 38 : i64
    %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
    %226 = func.call @cc_nil_value() : () -> i64
    %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
    %228 = func.call @cc_nil_value() : () -> i64
    %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
    %230 = func.call @cc_values_pack(%229) : (i64) -> i64
    %231 = func.call @cc_set_symbol_value(%227, %222) : (i64, i64) -> i64
    %232 = llvm.mlir.addressof @str23 : !llvm.ptr
    %233 = arith.constant 39 : i64
    %234 = func.call @cc_make_string(%232, %233) : (!llvm.ptr, i64) -> i64
    %235 = func.call @cc_nil_value() : () -> i64
    %236 = func.call @cc_intern(%234, %235) : (i64, i64) -> i64
    %237 = func.call @cc_nil_value() : () -> i64
    %238 = func.call @cc_cons(%236, %237) : (i64, i64) -> i64
    %239 = func.call @cc_values_pack(%238) : (i64) -> i64
    %240 = func.call @cc_set_symbol_value(%236, %222) : (i64, i64) -> i64
    %241 = llvm.mlir.addressof @str24 : !llvm.ptr
    %242 = arith.constant 40 : i64
    %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
    %244 = func.call @cc_nil_value() : () -> i64
    %245 = func.call @cc_intern(%243, %244) : (i64, i64) -> i64
    %246 = func.call @cc_nil_value() : () -> i64
    %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
    %248 = func.call @cc_values_pack(%247) : (i64) -> i64
    %249 = func.call @cc_set_symbol_value(%245, %222) : (i64, i64) -> i64
    func.call @stack_push_pointer(%193) : (i64) -> ()
    %250 = func.call @stack_pop_pointer() : () -> i64
    %251 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%251) : (i64) -> ()
    %252 = func.call @stack_pop_pointer() : () -> i64
    %253 = func.call @cc_random(%252) : (i64) -> i64
    func.call @stack_push_pointer(%253) : (i64) -> ()
    %254 = func.call @stack_pop_pointer() : () -> i64
    %255 = arith.constant 1 : i1
    %257 = arith.constant 3 : i64
    %256 = arith.andi %250, %257 : i64
    %258 = arith.constant 0 : i64
    %259 = arith.cmpi eq, %256, %258 : i64
    %261 = arith.constant 3 : i64
    %260 = arith.andi %254, %261 : i64
    %262 = arith.constant 0 : i64
    %263 = arith.cmpi eq, %260, %262 : i64
    %264 = arith.andi %259, %263 : i1
    %265 = scf.if %264 -> (i1) {
      %266 = arith.constant 2 : i64
      %267 = arith.shrsi %250, %266 : i64
      %268 = arith.constant 2 : i64
      %269 = arith.shrsi %254, %268 : i64
      %270 = arith.cmpi sgt, %267, %269 : i64
      scf.yield %270 : i1
    } else {
      %271 = func.call @cc_gt(%250, %254) : (i64, i64) -> i64
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = arith.cmpi ne, %271, %272 : i64
      scf.yield %273 : i1
    }
    %274 = arith.andi %255, %265 : i1
    %275 = func.call @cc_nil_value() : () -> i64
    %276 = func.call @cc_t_value() : () -> i64
    %277 = scf.if %274 -> (i64) {
      scf.yield %276 : i64
    } else {
      scf.yield %275 : i64
    }
    func.call @stack_push_pointer(%277) : (i64) -> ()
    %278 = func.call @stack_pop_pointer() : () -> i64
    %279 = func.call @cc_nil_value() : () -> i64
    %280 = arith.cmpi ne, %278, %279 : i64
    scf.if %280 {
      %281 = llvm.mlir.addressof @str25 : !llvm.ptr
      %282 = arith.constant 24 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = llvm.mlir.addressof @str26 : !llvm.ptr
      %285 = arith.constant 11 : i64
      %286 = func.call @cc_make_string(%284, %285) : (!llvm.ptr, i64) -> i64
      %287 = func.call @cc_intern(%283, %286) : (i64, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_cons(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_values_pack(%289) : (i64) -> i64
      %291 = func.call @cc_symbol_value(%287) : (i64) -> i64
      func.call @stack_push_pointer(%291) : (i64) -> ()
    } else {
      %292 = llvm.mlir.addressof @str27 : !llvm.ptr
      %293 = arith.constant 24 : i64
      %294 = func.call @cc_make_string(%292, %293) : (!llvm.ptr, i64) -> i64
      %295 = llvm.mlir.addressof @str28 : !llvm.ptr
      %296 = arith.constant 11 : i64
      %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
      %298 = func.call @cc_intern(%294, %297) : (i64, i64) -> i64
      %299 = func.call @cc_nil_value() : () -> i64
      %300 = func.call @cc_cons(%298, %299) : (i64, i64) -> i64
      %301 = func.call @cc_values_pack(%300) : (i64) -> i64
      %302 = func.call @cc_symbol_value(%298) : (i64) -> i64
      func.call @stack_push_pointer(%302) : (i64) -> ()
    }
    %303 = func.call @stack_pop_pointer() : () -> i64
    %304 = func.call @cc_multiple_value_list(%303) : (i64) -> i64
    %305 = llvm.mlir.addressof @str29 : !llvm.ptr
    %306 = arith.constant 38 : i64
    %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
    %308 = func.call @cc_nil_value() : () -> i64
    %309 = func.call @cc_intern(%307, %308) : (i64, i64) -> i64
    %310 = func.call @cc_nil_value() : () -> i64
    %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
    %312 = func.call @cc_values_pack(%311) : (i64) -> i64
    %313 = func.call @cc_symbol_value(%309) : (i64) -> i64
    %314 = llvm.mlir.addressof @str30 : !llvm.ptr
    %315 = arith.constant 39 : i64
    %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
    %317 = func.call @cc_nil_value() : () -> i64
    %318 = func.call @cc_intern(%316, %317) : (i64, i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
    %321 = func.call @cc_values_pack(%320) : (i64) -> i64
    %322 = func.call @cc_symbol_value(%318) : (i64) -> i64
    %323 = llvm.mlir.addressof @str31 : !llvm.ptr
    %324 = arith.constant 40 : i64
    %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
    %326 = func.call @cc_nil_value() : () -> i64
    %327 = func.call @cc_intern(%325, %326) : (i64, i64) -> i64
    %328 = func.call @cc_nil_value() : () -> i64
    %329 = func.call @cc_cons(%327, %328) : (i64, i64) -> i64
    %330 = func.call @cc_values_pack(%329) : (i64) -> i64
    %331 = func.call @cc_symbol_value(%327) : (i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = arith.cmpi ne, %313, %332 : i64
    %334 = scf.if %333 -> (i64) {
      scf.yield %331 : i64
    } else {
      scf.yield %304 : i64
    }
    %335 = func.call @cc_values_pack(%334) : (i64) -> i64
    func.call @stack_push_pointer(%335) : (i64) -> ()
    %336 = func.call @stack_pop_pointer() : () -> i64
    %337 = func.call @cc_multiple_value_list(%336) : (i64) -> i64
    %338 = llvm.mlir.addressof @str32 : !llvm.ptr
    %339 = arith.constant 38 : i64
    %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_intern(%340, %341) : (i64, i64) -> i64
    %343 = func.call @cc_nil_value() : () -> i64
    %344 = func.call @cc_cons(%342, %343) : (i64, i64) -> i64
    %345 = func.call @cc_values_pack(%344) : (i64) -> i64
    %346 = func.call @cc_symbol_value(%342) : (i64) -> i64
    %347 = llvm.mlir.addressof @str33 : !llvm.ptr
    %348 = arith.constant 40 : i64
    %349 = func.call @cc_make_string(%347, %348) : (!llvm.ptr, i64) -> i64
    %350 = func.call @cc_nil_value() : () -> i64
    %351 = func.call @cc_intern(%349, %350) : (i64, i64) -> i64
    %352 = func.call @cc_nil_value() : () -> i64
    %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
    %354 = func.call @cc_values_pack(%353) : (i64) -> i64
    %355 = func.call @cc_symbol_value(%351) : (i64) -> i64
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = arith.cmpi ne, %346, %356 : i64
    %358 = scf.if %357 -> (i64) {
      scf.yield %355 : i64
    } else {
      scf.yield %337 : i64
    }
    %359 = func.call @cc_values_pack(%358) : (i64) -> i64
    func.call @stack_push_pointer(%359) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%foo-ext-2"() {
    %360 = llvm.mlir.addressof @str34 : !llvm.ptr
    %361 = arith.constant 9 : i64
    %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
    %363 = func.call @cc_nil_value() : () -> i64
    %364 = func.call @cc_intern(%362, %363) : (i64, i64) -> i64
    %365 = func.call @cc_nil_value() : () -> i64
    %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
    %367 = func.call @cc_values_pack(%366) : (i64) -> i64
    %368 = llvm.mlir.addressof @str35 : !llvm.ptr
    %369 = arith.constant 1 : i64
    %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
    %371 = func.call @cc_register_function_lambda_list_metadata_raw(%364, %370) : (i64, i64) -> i64
    %372 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%364, %372) : (i64, i64) -> ()
    %373 = func.call @stack_pop_pointer() : () -> i64
    %374 = func.call @cc_nil_value() : () -> i64
    %375 = llvm.mlir.addressof @str36 : !llvm.ptr
    %376 = arith.constant 38 : i64
    %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
    %378 = func.call @cc_nil_value() : () -> i64
    %379 = func.call @cc_intern(%377, %378) : (i64, i64) -> i64
    %380 = func.call @cc_nil_value() : () -> i64
    %381 = func.call @cc_cons(%379, %380) : (i64, i64) -> i64
    %382 = func.call @cc_values_pack(%381) : (i64) -> i64
    %383 = func.call @cc_set_symbol_value(%379, %374) : (i64, i64) -> i64
    %384 = llvm.mlir.addressof @str37 : !llvm.ptr
    %385 = arith.constant 39 : i64
    %386 = func.call @cc_make_string(%384, %385) : (!llvm.ptr, i64) -> i64
    %387 = func.call @cc_nil_value() : () -> i64
    %388 = func.call @cc_intern(%386, %387) : (i64, i64) -> i64
    %389 = func.call @cc_nil_value() : () -> i64
    %390 = func.call @cc_cons(%388, %389) : (i64, i64) -> i64
    %391 = func.call @cc_values_pack(%390) : (i64) -> i64
    %392 = func.call @cc_set_symbol_value(%388, %374) : (i64, i64) -> i64
    %393 = llvm.mlir.addressof @str38 : !llvm.ptr
    %394 = arith.constant 40 : i64
    %395 = func.call @cc_make_string(%393, %394) : (!llvm.ptr, i64) -> i64
    %396 = func.call @cc_nil_value() : () -> i64
    %397 = func.call @cc_intern(%395, %396) : (i64, i64) -> i64
    %398 = func.call @cc_nil_value() : () -> i64
    %399 = func.call @cc_cons(%397, %398) : (i64, i64) -> i64
    %400 = func.call @cc_values_pack(%399) : (i64) -> i64
    %401 = func.call @cc_set_symbol_value(%397, %374) : (i64, i64) -> i64
    %402 = func.call @cc_nil_value() : () -> i64
    %403 = llvm.mlir.addressof @str39 : !llvm.ptr
    %404 = arith.constant 38 : i64
    %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
    %406 = func.call @cc_nil_value() : () -> i64
    %407 = func.call @cc_intern(%405, %406) : (i64, i64) -> i64
    %408 = func.call @cc_nil_value() : () -> i64
    %409 = func.call @cc_cons(%407, %408) : (i64, i64) -> i64
    %410 = func.call @cc_values_pack(%409) : (i64) -> i64
    %411 = func.call @cc_set_symbol_value(%407, %402) : (i64, i64) -> i64
    %412 = llvm.mlir.addressof @str40 : !llvm.ptr
    %413 = arith.constant 39 : i64
    %414 = func.call @cc_make_string(%412, %413) : (!llvm.ptr, i64) -> i64
    %415 = func.call @cc_nil_value() : () -> i64
    %416 = func.call @cc_intern(%414, %415) : (i64, i64) -> i64
    %417 = func.call @cc_nil_value() : () -> i64
    %418 = func.call @cc_cons(%416, %417) : (i64, i64) -> i64
    %419 = func.call @cc_values_pack(%418) : (i64) -> i64
    %420 = func.call @cc_set_symbol_value(%416, %402) : (i64, i64) -> i64
    %421 = llvm.mlir.addressof @str41 : !llvm.ptr
    %422 = arith.constant 40 : i64
    %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
    %424 = func.call @cc_nil_value() : () -> i64
    %425 = func.call @cc_intern(%423, %424) : (i64, i64) -> i64
    %426 = func.call @cc_nil_value() : () -> i64
    %427 = func.call @cc_cons(%425, %426) : (i64, i64) -> i64
    %428 = func.call @cc_values_pack(%427) : (i64) -> i64
    %429 = func.call @cc_set_symbol_value(%425, %402) : (i64, i64) -> i64
    func.call @stack_push_pointer(%373) : (i64) -> ()
    %430 = func.call @stack_pop_pointer() : () -> i64
    %431 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%431) : (i64) -> ()
    %432 = func.call @stack_pop_pointer() : () -> i64
    %433 = func.call @cc_random(%432) : (i64) -> i64
    func.call @stack_push_pointer(%433) : (i64) -> ()
    %434 = func.call @stack_pop_pointer() : () -> i64
    %435 = arith.constant 1 : i1
    %437 = arith.constant 3 : i64
    %436 = arith.andi %430, %437 : i64
    %438 = arith.constant 0 : i64
    %439 = arith.cmpi eq, %436, %438 : i64
    %441 = arith.constant 3 : i64
    %440 = arith.andi %434, %441 : i64
    %442 = arith.constant 0 : i64
    %443 = arith.cmpi eq, %440, %442 : i64
    %444 = arith.andi %439, %443 : i1
    %445 = scf.if %444 -> (i1) {
      %446 = arith.constant 2 : i64
      %447 = arith.shrsi %430, %446 : i64
      %448 = arith.constant 2 : i64
      %449 = arith.shrsi %434, %448 : i64
      %450 = arith.cmpi sgt, %447, %449 : i64
      scf.yield %450 : i1
    } else {
      %451 = func.call @cc_gt(%430, %434) : (i64, i64) -> i64
      %452 = func.call @cc_nil_value() : () -> i64
      %453 = arith.cmpi ne, %451, %452 : i64
      scf.yield %453 : i1
    }
    %454 = arith.andi %435, %445 : i1
    %455 = func.call @cc_nil_value() : () -> i64
    %456 = func.call @cc_t_value() : () -> i64
    %457 = scf.if %454 -> (i64) {
      scf.yield %456 : i64
    } else {
      scf.yield %455 : i64
    }
    func.call @stack_push_pointer(%457) : (i64) -> ()
    %458 = func.call @stack_pop_pointer() : () -> i64
    %459 = func.call @cc_nil_value() : () -> i64
    %460 = arith.cmpi ne, %458, %459 : i64
    scf.if %460 {
      %461 = llvm.mlir.addressof @str42 : !llvm.ptr
      %462 = arith.constant 24 : i64
      %463 = func.call @cc_make_string(%461, %462) : (!llvm.ptr, i64) -> i64
      %464 = llvm.mlir.addressof @str43 : !llvm.ptr
      %465 = arith.constant 11 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = func.call @cc_intern(%463, %466) : (i64, i64) -> i64
      %468 = func.call @cc_nil_value() : () -> i64
      %469 = func.call @cc_cons(%467, %468) : (i64, i64) -> i64
      %470 = func.call @cc_values_pack(%469) : (i64) -> i64
      %471 = func.call @cc_symbol_value(%467) : (i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%473) : (i64) -> ()
      %474 = func.call @stack_pop_pointer() : () -> i64
      %476 = arith.constant 3 : i64
      %475 = arith.andi %472, %476 : i64
      %477 = arith.constant 0 : i64
      %478 = arith.cmpi eq, %475, %477 : i64
      %480 = arith.constant 3 : i64
      %479 = arith.andi %474, %480 : i64
      %481 = arith.constant 0 : i64
      %482 = arith.cmpi eq, %479, %481 : i64
      %483 = arith.andi %478, %482 : i1
      %484 = scf.if %483 -> (i64) {
        %485 = arith.constant 2 : i64
        %486 = arith.shrsi %472, %485 : i64
        %487 = arith.constant 2 : i64
        %488 = arith.shrsi %474, %487 : i64
        %489 = arith.subi %486, %488 : i64
        %490 = arith.constant -2305843009213693952 : i64
        %491 = arith.constant 2305843009213693951 : i64
        %492 = arith.cmpi sge, %489, %490 : i64
        %493 = arith.cmpi sle, %489, %491 : i64
        %494 = arith.andi %492, %493 : i1
        %495 = scf.if %494 -> (i64) {
          %496 = arith.constant 2 : i64
          %497 = arith.shli %489, %496 : i64
          scf.yield %497 : i64
        } else {
          %498 = func.call @cc_sub(%472, %474) : (i64, i64) -> i64
          scf.yield %498 : i64
        }
        scf.yield %495 : i64
      } else {
        %499 = func.call @cc_sub(%472, %474) : (i64, i64) -> i64
        scf.yield %499 : i64
      }
      func.call @stack_push_pointer(%484) : (i64) -> ()
    } else {
      %500 = llvm.mlir.addressof @str44 : !llvm.ptr
      %501 = arith.constant 24 : i64
      %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
      %503 = llvm.mlir.addressof @str45 : !llvm.ptr
      %504 = arith.constant 11 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = func.call @cc_intern(%502, %505) : (i64, i64) -> i64
      %507 = func.call @cc_nil_value() : () -> i64
      %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
      %509 = func.call @cc_values_pack(%508) : (i64) -> i64
      %510 = func.call @cc_symbol_value(%506) : (i64) -> i64
      func.call @stack_push_pointer(%510) : (i64) -> ()
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%512) : (i64) -> ()
      %513 = func.call @stack_pop_pointer() : () -> i64
      %515 = arith.constant 3 : i64
      %514 = arith.andi %511, %515 : i64
      %516 = arith.constant 0 : i64
      %517 = arith.cmpi eq, %514, %516 : i64
      %519 = arith.constant 3 : i64
      %518 = arith.andi %513, %519 : i64
      %520 = arith.constant 0 : i64
      %521 = arith.cmpi eq, %518, %520 : i64
      %522 = arith.andi %517, %521 : i1
      %523 = scf.if %522 -> (i64) {
        %524 = arith.constant 2 : i64
        %525 = arith.shrsi %511, %524 : i64
        %526 = arith.constant 2 : i64
        %527 = arith.shrsi %513, %526 : i64
        %528 = arith.subi %525, %527 : i64
        %529 = arith.constant -2305843009213693952 : i64
        %530 = arith.constant 2305843009213693951 : i64
        %531 = arith.cmpi sge, %528, %529 : i64
        %532 = arith.cmpi sle, %528, %530 : i64
        %533 = arith.andi %531, %532 : i1
        %534 = scf.if %533 -> (i64) {
          %535 = arith.constant 2 : i64
          %536 = arith.shli %528, %535 : i64
          scf.yield %536 : i64
        } else {
          %537 = func.call @cc_sub(%511, %513) : (i64, i64) -> i64
          scf.yield %537 : i64
        }
        scf.yield %534 : i64
      } else {
        %538 = func.call @cc_sub(%511, %513) : (i64, i64) -> i64
        scf.yield %538 : i64
      }
      func.call @stack_push_pointer(%523) : (i64) -> ()
    }
    %539 = func.call @stack_pop_pointer() : () -> i64
    %540 = func.call @cc_multiple_value_list(%539) : (i64) -> i64
    %541 = llvm.mlir.addressof @str46 : !llvm.ptr
    %542 = arith.constant 38 : i64
    %543 = func.call @cc_make_string(%541, %542) : (!llvm.ptr, i64) -> i64
    %544 = func.call @cc_nil_value() : () -> i64
    %545 = func.call @cc_intern(%543, %544) : (i64, i64) -> i64
    %546 = func.call @cc_nil_value() : () -> i64
    %547 = func.call @cc_cons(%545, %546) : (i64, i64) -> i64
    %548 = func.call @cc_values_pack(%547) : (i64) -> i64
    %549 = func.call @cc_symbol_value(%545) : (i64) -> i64
    %550 = llvm.mlir.addressof @str47 : !llvm.ptr
    %551 = arith.constant 39 : i64
    %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
    %553 = func.call @cc_nil_value() : () -> i64
    %554 = func.call @cc_intern(%552, %553) : (i64, i64) -> i64
    %555 = func.call @cc_nil_value() : () -> i64
    %556 = func.call @cc_cons(%554, %555) : (i64, i64) -> i64
    %557 = func.call @cc_values_pack(%556) : (i64) -> i64
    %558 = func.call @cc_symbol_value(%554) : (i64) -> i64
    %559 = llvm.mlir.addressof @str48 : !llvm.ptr
    %560 = arith.constant 40 : i64
    %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
    %562 = func.call @cc_nil_value() : () -> i64
    %563 = func.call @cc_intern(%561, %562) : (i64, i64) -> i64
    %564 = func.call @cc_nil_value() : () -> i64
    %565 = func.call @cc_cons(%563, %564) : (i64, i64) -> i64
    %566 = func.call @cc_values_pack(%565) : (i64) -> i64
    %567 = func.call @cc_symbol_value(%563) : (i64) -> i64
    %568 = func.call @cc_nil_value() : () -> i64
    %569 = arith.cmpi ne, %549, %568 : i64
    %570 = scf.if %569 -> (i64) {
      scf.yield %567 : i64
    } else {
      scf.yield %540 : i64
    }
    %571 = func.call @cc_values_pack(%570) : (i64) -> i64
    func.call @stack_push_pointer(%571) : (i64) -> ()
    %572 = func.call @stack_pop_pointer() : () -> i64
    %573 = func.call @cc_multiple_value_list(%572) : (i64) -> i64
    %574 = llvm.mlir.addressof @str49 : !llvm.ptr
    %575 = arith.constant 38 : i64
    %576 = func.call @cc_make_string(%574, %575) : (!llvm.ptr, i64) -> i64
    %577 = func.call @cc_nil_value() : () -> i64
    %578 = func.call @cc_intern(%576, %577) : (i64, i64) -> i64
    %579 = func.call @cc_nil_value() : () -> i64
    %580 = func.call @cc_cons(%578, %579) : (i64, i64) -> i64
    %581 = func.call @cc_values_pack(%580) : (i64) -> i64
    %582 = func.call @cc_symbol_value(%578) : (i64) -> i64
    %583 = llvm.mlir.addressof @str50 : !llvm.ptr
    %584 = arith.constant 40 : i64
    %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
    %586 = func.call @cc_nil_value() : () -> i64
    %587 = func.call @cc_intern(%585, %586) : (i64, i64) -> i64
    %588 = func.call @cc_nil_value() : () -> i64
    %589 = func.call @cc_cons(%587, %588) : (i64, i64) -> i64
    %590 = func.call @cc_values_pack(%589) : (i64) -> i64
    %591 = func.call @cc_symbol_value(%587) : (i64) -> i64
    %592 = func.call @cc_nil_value() : () -> i64
    %593 = arith.cmpi ne, %582, %592 : i64
    %594 = scf.if %593 -> (i64) {
      scf.yield %591 : i64
    } else {
      scf.yield %573 : i64
    }
    %595 = func.call @cc_values_pack(%594) : (i64) -> i64
    func.call @stack_push_pointer(%595) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%bar-ext-2"() {
    %596 = llvm.mlir.addressof @str51 : !llvm.ptr
    %597 = arith.constant 9 : i64
    %598 = func.call @cc_make_string(%596, %597) : (!llvm.ptr, i64) -> i64
    %599 = func.call @cc_nil_value() : () -> i64
    %600 = func.call @cc_intern(%598, %599) : (i64, i64) -> i64
    %601 = func.call @cc_nil_value() : () -> i64
    %602 = func.call @cc_cons(%600, %601) : (i64, i64) -> i64
    %603 = func.call @cc_values_pack(%602) : (i64) -> i64
    %604 = llvm.mlir.addressof @str52 : !llvm.ptr
    %605 = arith.constant 1 : i64
    %606 = func.call @cc_make_string(%604, %605) : (!llvm.ptr, i64) -> i64
    %607 = func.call @cc_register_function_lambda_list_metadata_raw(%600, %606) : (i64, i64) -> i64
    %608 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%600, %608) : (i64, i64) -> ()
    %609 = func.call @stack_pop_pointer() : () -> i64
    %610 = func.call @cc_nil_value() : () -> i64
    %611 = llvm.mlir.addressof @str53 : !llvm.ptr
    %612 = arith.constant 38 : i64
    %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
    %614 = func.call @cc_nil_value() : () -> i64
    %615 = func.call @cc_intern(%613, %614) : (i64, i64) -> i64
    %616 = func.call @cc_nil_value() : () -> i64
    %617 = func.call @cc_cons(%615, %616) : (i64, i64) -> i64
    %618 = func.call @cc_values_pack(%617) : (i64) -> i64
    %619 = func.call @cc_set_symbol_value(%615, %610) : (i64, i64) -> i64
    %620 = llvm.mlir.addressof @str54 : !llvm.ptr
    %621 = arith.constant 39 : i64
    %622 = func.call @cc_make_string(%620, %621) : (!llvm.ptr, i64) -> i64
    %623 = func.call @cc_nil_value() : () -> i64
    %624 = func.call @cc_intern(%622, %623) : (i64, i64) -> i64
    %625 = func.call @cc_nil_value() : () -> i64
    %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
    %627 = func.call @cc_values_pack(%626) : (i64) -> i64
    %628 = func.call @cc_set_symbol_value(%624, %610) : (i64, i64) -> i64
    %629 = llvm.mlir.addressof @str55 : !llvm.ptr
    %630 = arith.constant 40 : i64
    %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
    %632 = func.call @cc_nil_value() : () -> i64
    %633 = func.call @cc_intern(%631, %632) : (i64, i64) -> i64
    %634 = func.call @cc_nil_value() : () -> i64
    %635 = func.call @cc_cons(%633, %634) : (i64, i64) -> i64
    %636 = func.call @cc_values_pack(%635) : (i64) -> i64
    %637 = func.call @cc_set_symbol_value(%633, %610) : (i64, i64) -> i64
    %638 = func.call @cc_nil_value() : () -> i64
    %639 = llvm.mlir.addressof @str56 : !llvm.ptr
    %640 = arith.constant 38 : i64
    %641 = func.call @cc_make_string(%639, %640) : (!llvm.ptr, i64) -> i64
    %642 = func.call @cc_nil_value() : () -> i64
    %643 = func.call @cc_intern(%641, %642) : (i64, i64) -> i64
    %644 = func.call @cc_nil_value() : () -> i64
    %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
    %646 = func.call @cc_values_pack(%645) : (i64) -> i64
    %647 = func.call @cc_set_symbol_value(%643, %638) : (i64, i64) -> i64
    %648 = llvm.mlir.addressof @str57 : !llvm.ptr
    %649 = arith.constant 39 : i64
    %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
    %651 = func.call @cc_nil_value() : () -> i64
    %652 = func.call @cc_intern(%650, %651) : (i64, i64) -> i64
    %653 = func.call @cc_nil_value() : () -> i64
    %654 = func.call @cc_cons(%652, %653) : (i64, i64) -> i64
    %655 = func.call @cc_values_pack(%654) : (i64) -> i64
    %656 = func.call @cc_set_symbol_value(%652, %638) : (i64, i64) -> i64
    %657 = llvm.mlir.addressof @str58 : !llvm.ptr
    %658 = arith.constant 40 : i64
    %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
    %660 = func.call @cc_nil_value() : () -> i64
    %661 = func.call @cc_intern(%659, %660) : (i64, i64) -> i64
    %662 = func.call @cc_nil_value() : () -> i64
    %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
    %664 = func.call @cc_values_pack(%663) : (i64) -> i64
    %665 = func.call @cc_set_symbol_value(%661, %638) : (i64, i64) -> i64
    func.call @stack_push_pointer(%609) : (i64) -> ()
    %666 = func.call @stack_pop_pointer() : () -> i64
    %667 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%667) : (i64) -> ()
    %668 = func.call @stack_pop_pointer() : () -> i64
    %669 = func.call @cc_random(%668) : (i64) -> i64
    func.call @stack_push_pointer(%669) : (i64) -> ()
    %670 = func.call @stack_pop_pointer() : () -> i64
    %671 = arith.constant 1 : i1
    %673 = arith.constant 3 : i64
    %672 = arith.andi %666, %673 : i64
    %674 = arith.constant 0 : i64
    %675 = arith.cmpi eq, %672, %674 : i64
    %677 = arith.constant 3 : i64
    %676 = arith.andi %670, %677 : i64
    %678 = arith.constant 0 : i64
    %679 = arith.cmpi eq, %676, %678 : i64
    %680 = arith.andi %675, %679 : i1
    %681 = scf.if %680 -> (i1) {
      %682 = arith.constant 2 : i64
      %683 = arith.shrsi %666, %682 : i64
      %684 = arith.constant 2 : i64
      %685 = arith.shrsi %670, %684 : i64
      %686 = arith.cmpi sgt, %683, %685 : i64
      scf.yield %686 : i1
    } else {
      %687 = func.call @cc_gt(%666, %670) : (i64, i64) -> i64
      %688 = func.call @cc_nil_value() : () -> i64
      %689 = arith.cmpi ne, %687, %688 : i64
      scf.yield %689 : i1
    }
    %690 = arith.andi %671, %681 : i1
    %691 = func.call @cc_nil_value() : () -> i64
    %692 = func.call @cc_t_value() : () -> i64
    %693 = scf.if %690 -> (i64) {
      scf.yield %692 : i64
    } else {
      scf.yield %691 : i64
    }
    func.call @stack_push_pointer(%693) : (i64) -> ()
    %694 = func.call @stack_pop_pointer() : () -> i64
    %695 = func.call @cc_nil_value() : () -> i64
    %696 = arith.cmpi ne, %694, %695 : i64
    scf.if %696 {
      %697 = llvm.mlir.addressof @str59 : !llvm.ptr
      %698 = arith.constant 24 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = llvm.mlir.addressof @str60 : !llvm.ptr
      %701 = arith.constant 11 : i64
      %702 = func.call @cc_make_string(%700, %701) : (!llvm.ptr, i64) -> i64
      %703 = func.call @cc_intern(%699, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      %707 = func.call @cc_symbol_value(%703) : (i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%709) : (i64) -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %712 = arith.constant 3 : i64
      %711 = arith.andi %708, %712 : i64
      %713 = arith.constant 0 : i64
      %714 = arith.cmpi eq, %711, %713 : i64
      %716 = arith.constant 3 : i64
      %715 = arith.andi %710, %716 : i64
      %717 = arith.constant 0 : i64
      %718 = arith.cmpi eq, %715, %717 : i64
      %719 = arith.andi %714, %718 : i1
      %720 = scf.if %719 -> (i64) {
        %721 = arith.constant 2 : i64
        %722 = arith.shrsi %708, %721 : i64
        %723 = arith.constant 2 : i64
        %724 = arith.shrsi %710, %723 : i64
        %725 = arith.subi %722, %724 : i64
        %726 = arith.constant -2305843009213693952 : i64
        %727 = arith.constant 2305843009213693951 : i64
        %728 = arith.cmpi sge, %725, %726 : i64
        %729 = arith.cmpi sle, %725, %727 : i64
        %730 = arith.andi %728, %729 : i1
        %731 = scf.if %730 -> (i64) {
          %732 = arith.constant 2 : i64
          %733 = arith.shli %725, %732 : i64
          scf.yield %733 : i64
        } else {
          %734 = func.call @cc_sub(%708, %710) : (i64, i64) -> i64
          scf.yield %734 : i64
        }
        scf.yield %731 : i64
      } else {
        %735 = func.call @cc_sub(%708, %710) : (i64, i64) -> i64
        scf.yield %735 : i64
      }
      func.call @stack_push_pointer(%720) : (i64) -> ()
    } else {
      %736 = llvm.mlir.addressof @str61 : !llvm.ptr
      %737 = arith.constant 24 : i64
      %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
      %739 = llvm.mlir.addressof @str62 : !llvm.ptr
      %740 = arith.constant 11 : i64
      %741 = func.call @cc_make_string(%739, %740) : (!llvm.ptr, i64) -> i64
      %742 = func.call @cc_intern(%738, %741) : (i64, i64) -> i64
      %743 = func.call @cc_nil_value() : () -> i64
      %744 = func.call @cc_cons(%742, %743) : (i64, i64) -> i64
      %745 = func.call @cc_values_pack(%744) : (i64) -> i64
      %746 = func.call @cc_symbol_value(%742) : (i64) -> i64
      func.call @stack_push_pointer(%746) : (i64) -> ()
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%748) : (i64) -> ()
      %749 = func.call @stack_pop_pointer() : () -> i64
      %751 = arith.constant 3 : i64
      %750 = arith.andi %747, %751 : i64
      %752 = arith.constant 0 : i64
      %753 = arith.cmpi eq, %750, %752 : i64
      %755 = arith.constant 3 : i64
      %754 = arith.andi %749, %755 : i64
      %756 = arith.constant 0 : i64
      %757 = arith.cmpi eq, %754, %756 : i64
      %758 = arith.andi %753, %757 : i1
      %759 = scf.if %758 -> (i64) {
        %760 = arith.constant 2 : i64
        %761 = arith.shrsi %747, %760 : i64
        %762 = arith.constant 2 : i64
        %763 = arith.shrsi %749, %762 : i64
        %764 = arith.subi %761, %763 : i64
        %765 = arith.constant -2305843009213693952 : i64
        %766 = arith.constant 2305843009213693951 : i64
        %767 = arith.cmpi sge, %764, %765 : i64
        %768 = arith.cmpi sle, %764, %766 : i64
        %769 = arith.andi %767, %768 : i1
        %770 = scf.if %769 -> (i64) {
          %771 = arith.constant 2 : i64
          %772 = arith.shli %764, %771 : i64
          scf.yield %772 : i64
        } else {
          %773 = func.call @cc_sub(%747, %749) : (i64, i64) -> i64
          scf.yield %773 : i64
        }
        scf.yield %770 : i64
      } else {
        %774 = func.call @cc_sub(%747, %749) : (i64, i64) -> i64
        scf.yield %774 : i64
      }
      func.call @stack_push_pointer(%759) : (i64) -> ()
    }
    %775 = func.call @stack_pop_pointer() : () -> i64
    %776 = func.call @cc_multiple_value_list(%775) : (i64) -> i64
    %777 = llvm.mlir.addressof @str63 : !llvm.ptr
    %778 = arith.constant 38 : i64
    %779 = func.call @cc_make_string(%777, %778) : (!llvm.ptr, i64) -> i64
    %780 = func.call @cc_nil_value() : () -> i64
    %781 = func.call @cc_intern(%779, %780) : (i64, i64) -> i64
    %782 = func.call @cc_nil_value() : () -> i64
    %783 = func.call @cc_cons(%781, %782) : (i64, i64) -> i64
    %784 = func.call @cc_values_pack(%783) : (i64) -> i64
    %785 = func.call @cc_symbol_value(%781) : (i64) -> i64
    %786 = llvm.mlir.addressof @str64 : !llvm.ptr
    %787 = arith.constant 39 : i64
    %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
    %789 = func.call @cc_nil_value() : () -> i64
    %790 = func.call @cc_intern(%788, %789) : (i64, i64) -> i64
    %791 = func.call @cc_nil_value() : () -> i64
    %792 = func.call @cc_cons(%790, %791) : (i64, i64) -> i64
    %793 = func.call @cc_values_pack(%792) : (i64) -> i64
    %794 = func.call @cc_symbol_value(%790) : (i64) -> i64
    %795 = llvm.mlir.addressof @str65 : !llvm.ptr
    %796 = arith.constant 40 : i64
    %797 = func.call @cc_make_string(%795, %796) : (!llvm.ptr, i64) -> i64
    %798 = func.call @cc_nil_value() : () -> i64
    %799 = func.call @cc_intern(%797, %798) : (i64, i64) -> i64
    %800 = func.call @cc_nil_value() : () -> i64
    %801 = func.call @cc_cons(%799, %800) : (i64, i64) -> i64
    %802 = func.call @cc_values_pack(%801) : (i64) -> i64
    %803 = func.call @cc_symbol_value(%799) : (i64) -> i64
    %804 = func.call @cc_nil_value() : () -> i64
    %805 = arith.cmpi ne, %785, %804 : i64
    %806 = scf.if %805 -> (i64) {
      scf.yield %803 : i64
    } else {
      scf.yield %776 : i64
    }
    %807 = func.call @cc_values_pack(%806) : (i64) -> i64
    func.call @stack_push_pointer(%807) : (i64) -> ()
    %808 = func.call @stack_pop_pointer() : () -> i64
    %809 = func.call @cc_multiple_value_list(%808) : (i64) -> i64
    %810 = llvm.mlir.addressof @str66 : !llvm.ptr
    %811 = arith.constant 38 : i64
    %812 = func.call @cc_make_string(%810, %811) : (!llvm.ptr, i64) -> i64
    %813 = func.call @cc_nil_value() : () -> i64
    %814 = func.call @cc_intern(%812, %813) : (i64, i64) -> i64
    %815 = func.call @cc_nil_value() : () -> i64
    %816 = func.call @cc_cons(%814, %815) : (i64, i64) -> i64
    %817 = func.call @cc_values_pack(%816) : (i64) -> i64
    %818 = func.call @cc_symbol_value(%814) : (i64) -> i64
    %819 = llvm.mlir.addressof @str67 : !llvm.ptr
    %820 = arith.constant 40 : i64
    %821 = func.call @cc_make_string(%819, %820) : (!llvm.ptr, i64) -> i64
    %822 = func.call @cc_nil_value() : () -> i64
    %823 = func.call @cc_intern(%821, %822) : (i64, i64) -> i64
    %824 = func.call @cc_nil_value() : () -> i64
    %825 = func.call @cc_cons(%823, %824) : (i64, i64) -> i64
    %826 = func.call @cc_values_pack(%825) : (i64) -> i64
    %827 = func.call @cc_symbol_value(%823) : (i64) -> i64
    %828 = func.call @cc_nil_value() : () -> i64
    %829 = arith.cmpi ne, %818, %828 : i64
    %830 = scf.if %829 -> (i64) {
      scf.yield %827 : i64
    } else {
      scf.yield %809 : i64
    }
    %831 = func.call @cc_values_pack(%830) : (i64) -> i64
    func.call @stack_push_pointer(%831) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%foo-ext-3"() {
    %832 = llvm.mlir.addressof @str68 : !llvm.ptr
    %833 = arith.constant 9 : i64
    %834 = func.call @cc_make_string(%832, %833) : (!llvm.ptr, i64) -> i64
    %835 = func.call @cc_nil_value() : () -> i64
    %836 = func.call @cc_intern(%834, %835) : (i64, i64) -> i64
    %837 = func.call @cc_nil_value() : () -> i64
    %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
    %839 = func.call @cc_values_pack(%838) : (i64) -> i64
    %840 = llvm.mlir.addressof @str69 : !llvm.ptr
    %841 = arith.constant 1 : i64
    %842 = func.call @cc_make_string(%840, %841) : (!llvm.ptr, i64) -> i64
    %843 = func.call @cc_register_function_lambda_list_metadata_raw(%836, %842) : (i64, i64) -> i64
    %844 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%836, %844) : (i64, i64) -> ()
    %845 = func.call @stack_pop_pointer() : () -> i64
    %846 = func.call @cc_nil_value() : () -> i64
    %847 = llvm.mlir.addressof @str70 : !llvm.ptr
    %848 = arith.constant 38 : i64
    %849 = func.call @cc_make_string(%847, %848) : (!llvm.ptr, i64) -> i64
    %850 = func.call @cc_nil_value() : () -> i64
    %851 = func.call @cc_intern(%849, %850) : (i64, i64) -> i64
    %852 = func.call @cc_nil_value() : () -> i64
    %853 = func.call @cc_cons(%851, %852) : (i64, i64) -> i64
    %854 = func.call @cc_values_pack(%853) : (i64) -> i64
    %855 = func.call @cc_set_symbol_value(%851, %846) : (i64, i64) -> i64
    %856 = llvm.mlir.addressof @str71 : !llvm.ptr
    %857 = arith.constant 39 : i64
    %858 = func.call @cc_make_string(%856, %857) : (!llvm.ptr, i64) -> i64
    %859 = func.call @cc_nil_value() : () -> i64
    %860 = func.call @cc_intern(%858, %859) : (i64, i64) -> i64
    %861 = func.call @cc_nil_value() : () -> i64
    %862 = func.call @cc_cons(%860, %861) : (i64, i64) -> i64
    %863 = func.call @cc_values_pack(%862) : (i64) -> i64
    %864 = func.call @cc_set_symbol_value(%860, %846) : (i64, i64) -> i64
    %865 = llvm.mlir.addressof @str72 : !llvm.ptr
    %866 = arith.constant 40 : i64
    %867 = func.call @cc_make_string(%865, %866) : (!llvm.ptr, i64) -> i64
    %868 = func.call @cc_nil_value() : () -> i64
    %869 = func.call @cc_intern(%867, %868) : (i64, i64) -> i64
    %870 = func.call @cc_nil_value() : () -> i64
    %871 = func.call @cc_cons(%869, %870) : (i64, i64) -> i64
    %872 = func.call @cc_values_pack(%871) : (i64) -> i64
    %873 = func.call @cc_set_symbol_value(%869, %846) : (i64, i64) -> i64
    %874 = func.call @cc_nil_value() : () -> i64
    %875 = llvm.mlir.addressof @str73 : !llvm.ptr
    %876 = arith.constant 38 : i64
    %877 = func.call @cc_make_string(%875, %876) : (!llvm.ptr, i64) -> i64
    %878 = func.call @cc_nil_value() : () -> i64
    %879 = func.call @cc_intern(%877, %878) : (i64, i64) -> i64
    %880 = func.call @cc_nil_value() : () -> i64
    %881 = func.call @cc_cons(%879, %880) : (i64, i64) -> i64
    %882 = func.call @cc_values_pack(%881) : (i64) -> i64
    %883 = func.call @cc_set_symbol_value(%879, %874) : (i64, i64) -> i64
    %884 = llvm.mlir.addressof @str74 : !llvm.ptr
    %885 = arith.constant 39 : i64
    %886 = func.call @cc_make_string(%884, %885) : (!llvm.ptr, i64) -> i64
    %887 = func.call @cc_nil_value() : () -> i64
    %888 = func.call @cc_intern(%886, %887) : (i64, i64) -> i64
    %889 = func.call @cc_nil_value() : () -> i64
    %890 = func.call @cc_cons(%888, %889) : (i64, i64) -> i64
    %891 = func.call @cc_values_pack(%890) : (i64) -> i64
    %892 = func.call @cc_set_symbol_value(%888, %874) : (i64, i64) -> i64
    %893 = llvm.mlir.addressof @str75 : !llvm.ptr
    %894 = arith.constant 40 : i64
    %895 = func.call @cc_make_string(%893, %894) : (!llvm.ptr, i64) -> i64
    %896 = func.call @cc_nil_value() : () -> i64
    %897 = func.call @cc_intern(%895, %896) : (i64, i64) -> i64
    %898 = func.call @cc_nil_value() : () -> i64
    %899 = func.call @cc_cons(%897, %898) : (i64, i64) -> i64
    %900 = func.call @cc_values_pack(%899) : (i64) -> i64
    %901 = func.call @cc_set_symbol_value(%897, %874) : (i64, i64) -> i64
    func.call @stack_push_pointer(%845) : (i64) -> ()
    %902 = func.call @stack_pop_pointer() : () -> i64
    %903 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%903) : (i64) -> ()
    %904 = func.call @stack_pop_pointer() : () -> i64
    %905 = func.call @cc_random(%904) : (i64) -> i64
    func.call @stack_push_pointer(%905) : (i64) -> ()
    %906 = func.call @stack_pop_pointer() : () -> i64
    %907 = arith.constant 1 : i1
    %909 = arith.constant 3 : i64
    %908 = arith.andi %902, %909 : i64
    %910 = arith.constant 0 : i64
    %911 = arith.cmpi eq, %908, %910 : i64
    %913 = arith.constant 3 : i64
    %912 = arith.andi %906, %913 : i64
    %914 = arith.constant 0 : i64
    %915 = arith.cmpi eq, %912, %914 : i64
    %916 = arith.andi %911, %915 : i1
    %917 = scf.if %916 -> (i1) {
      %918 = arith.constant 2 : i64
      %919 = arith.shrsi %902, %918 : i64
      %920 = arith.constant 2 : i64
      %921 = arith.shrsi %906, %920 : i64
      %922 = arith.cmpi sgt, %919, %921 : i64
      scf.yield %922 : i1
    } else {
      %923 = func.call @cc_gt(%902, %906) : (i64, i64) -> i64
      %924 = func.call @cc_nil_value() : () -> i64
      %925 = arith.cmpi ne, %923, %924 : i64
      scf.yield %925 : i1
    }
    %926 = arith.andi %907, %917 : i1
    %927 = func.call @cc_nil_value() : () -> i64
    %928 = func.call @cc_t_value() : () -> i64
    %929 = scf.if %926 -> (i64) {
      scf.yield %928 : i64
    } else {
      scf.yield %927 : i64
    }
    func.call @stack_push_pointer(%929) : (i64) -> ()
    %930 = func.call @stack_pop_pointer() : () -> i64
    %931 = func.call @cc_nil_value() : () -> i64
    %932 = arith.cmpi ne, %930, %931 : i64
    scf.if %932 {
      %933 = arith.constant 0.0 : f64
      %934 = func.call @cc_box_single_float(%933) : (f64) -> i64
      func.call @stack_push_pointer(%934) : (i64) -> ()
    } else {
      %935 = arith.constant 0.0 : f64
      %936 = func.call @cc_box_single_float(%935) : (f64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
    }
    %937 = func.call @stack_pop_pointer() : () -> i64
    %938 = func.call @cc_multiple_value_list(%937) : (i64) -> i64
    %939 = llvm.mlir.addressof @str76 : !llvm.ptr
    %940 = arith.constant 38 : i64
    %941 = func.call @cc_make_string(%939, %940) : (!llvm.ptr, i64) -> i64
    %942 = func.call @cc_nil_value() : () -> i64
    %943 = func.call @cc_intern(%941, %942) : (i64, i64) -> i64
    %944 = func.call @cc_nil_value() : () -> i64
    %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
    %946 = func.call @cc_values_pack(%945) : (i64) -> i64
    %947 = func.call @cc_symbol_value(%943) : (i64) -> i64
    %948 = llvm.mlir.addressof @str77 : !llvm.ptr
    %949 = arith.constant 39 : i64
    %950 = func.call @cc_make_string(%948, %949) : (!llvm.ptr, i64) -> i64
    %951 = func.call @cc_nil_value() : () -> i64
    %952 = func.call @cc_intern(%950, %951) : (i64, i64) -> i64
    %953 = func.call @cc_nil_value() : () -> i64
    %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
    %955 = func.call @cc_values_pack(%954) : (i64) -> i64
    %956 = func.call @cc_symbol_value(%952) : (i64) -> i64
    %957 = llvm.mlir.addressof @str78 : !llvm.ptr
    %958 = arith.constant 40 : i64
    %959 = func.call @cc_make_string(%957, %958) : (!llvm.ptr, i64) -> i64
    %960 = func.call @cc_nil_value() : () -> i64
    %961 = func.call @cc_intern(%959, %960) : (i64, i64) -> i64
    %962 = func.call @cc_nil_value() : () -> i64
    %963 = func.call @cc_cons(%961, %962) : (i64, i64) -> i64
    %964 = func.call @cc_values_pack(%963) : (i64) -> i64
    %965 = func.call @cc_symbol_value(%961) : (i64) -> i64
    %966 = func.call @cc_nil_value() : () -> i64
    %967 = arith.cmpi ne, %947, %966 : i64
    %968 = scf.if %967 -> (i64) {
      scf.yield %965 : i64
    } else {
      scf.yield %938 : i64
    }
    %969 = func.call @cc_values_pack(%968) : (i64) -> i64
    func.call @stack_push_pointer(%969) : (i64) -> ()
    %970 = func.call @stack_pop_pointer() : () -> i64
    %971 = func.call @cc_multiple_value_list(%970) : (i64) -> i64
    %972 = llvm.mlir.addressof @str79 : !llvm.ptr
    %973 = arith.constant 38 : i64
    %974 = func.call @cc_make_string(%972, %973) : (!llvm.ptr, i64) -> i64
    %975 = func.call @cc_nil_value() : () -> i64
    %976 = func.call @cc_intern(%974, %975) : (i64, i64) -> i64
    %977 = func.call @cc_nil_value() : () -> i64
    %978 = func.call @cc_cons(%976, %977) : (i64, i64) -> i64
    %979 = func.call @cc_values_pack(%978) : (i64) -> i64
    %980 = func.call @cc_symbol_value(%976) : (i64) -> i64
    %981 = llvm.mlir.addressof @str80 : !llvm.ptr
    %982 = arith.constant 40 : i64
    %983 = func.call @cc_make_string(%981, %982) : (!llvm.ptr, i64) -> i64
    %984 = func.call @cc_nil_value() : () -> i64
    %985 = func.call @cc_intern(%983, %984) : (i64, i64) -> i64
    %986 = func.call @cc_nil_value() : () -> i64
    %987 = func.call @cc_cons(%985, %986) : (i64, i64) -> i64
    %988 = func.call @cc_values_pack(%987) : (i64) -> i64
    %989 = func.call @cc_symbol_value(%985) : (i64) -> i64
    %990 = func.call @cc_nil_value() : () -> i64
    %991 = arith.cmpi ne, %980, %990 : i64
    %992 = scf.if %991 -> (i64) {
      scf.yield %989 : i64
    } else {
      scf.yield %971 : i64
    }
    %993 = func.call @cc_values_pack(%992) : (i64) -> i64
    func.call @stack_push_pointer(%993) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%bar-ext-3"() {
    %994 = llvm.mlir.addressof @str81 : !llvm.ptr
    %995 = arith.constant 9 : i64
    %996 = func.call @cc_make_string(%994, %995) : (!llvm.ptr, i64) -> i64
    %997 = func.call @cc_nil_value() : () -> i64
    %998 = func.call @cc_intern(%996, %997) : (i64, i64) -> i64
    %999 = func.call @cc_nil_value() : () -> i64
    %1000 = func.call @cc_cons(%998, %999) : (i64, i64) -> i64
    %1001 = func.call @cc_values_pack(%1000) : (i64) -> i64
    %1002 = llvm.mlir.addressof @str82 : !llvm.ptr
    %1003 = arith.constant 1 : i64
    %1004 = func.call @cc_make_string(%1002, %1003) : (!llvm.ptr, i64) -> i64
    %1005 = func.call @cc_register_function_lambda_list_metadata_raw(%998, %1004) : (i64, i64) -> i64
    %1006 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%998, %1006) : (i64, i64) -> ()
    %1007 = func.call @stack_pop_pointer() : () -> i64
    %1008 = func.call @cc_nil_value() : () -> i64
    %1009 = llvm.mlir.addressof @str83 : !llvm.ptr
    %1010 = arith.constant 38 : i64
    %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
    %1012 = func.call @cc_nil_value() : () -> i64
    %1013 = func.call @cc_intern(%1011, %1012) : (i64, i64) -> i64
    %1014 = func.call @cc_nil_value() : () -> i64
    %1015 = func.call @cc_cons(%1013, %1014) : (i64, i64) -> i64
    %1016 = func.call @cc_values_pack(%1015) : (i64) -> i64
    %1017 = func.call @cc_set_symbol_value(%1013, %1008) : (i64, i64) -> i64
    %1018 = llvm.mlir.addressof @str84 : !llvm.ptr
    %1019 = arith.constant 39 : i64
    %1020 = func.call @cc_make_string(%1018, %1019) : (!llvm.ptr, i64) -> i64
    %1021 = func.call @cc_nil_value() : () -> i64
    %1022 = func.call @cc_intern(%1020, %1021) : (i64, i64) -> i64
    %1023 = func.call @cc_nil_value() : () -> i64
    %1024 = func.call @cc_cons(%1022, %1023) : (i64, i64) -> i64
    %1025 = func.call @cc_values_pack(%1024) : (i64) -> i64
    %1026 = func.call @cc_set_symbol_value(%1022, %1008) : (i64, i64) -> i64
    %1027 = llvm.mlir.addressof @str85 : !llvm.ptr
    %1028 = arith.constant 40 : i64
    %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
    %1030 = func.call @cc_nil_value() : () -> i64
    %1031 = func.call @cc_intern(%1029, %1030) : (i64, i64) -> i64
    %1032 = func.call @cc_nil_value() : () -> i64
    %1033 = func.call @cc_cons(%1031, %1032) : (i64, i64) -> i64
    %1034 = func.call @cc_values_pack(%1033) : (i64) -> i64
    %1035 = func.call @cc_set_symbol_value(%1031, %1008) : (i64, i64) -> i64
    %1036 = func.call @cc_nil_value() : () -> i64
    %1037 = llvm.mlir.addressof @str86 : !llvm.ptr
    %1038 = arith.constant 38 : i64
    %1039 = func.call @cc_make_string(%1037, %1038) : (!llvm.ptr, i64) -> i64
    %1040 = func.call @cc_nil_value() : () -> i64
    %1041 = func.call @cc_intern(%1039, %1040) : (i64, i64) -> i64
    %1042 = func.call @cc_nil_value() : () -> i64
    %1043 = func.call @cc_cons(%1041, %1042) : (i64, i64) -> i64
    %1044 = func.call @cc_values_pack(%1043) : (i64) -> i64
    %1045 = func.call @cc_set_symbol_value(%1041, %1036) : (i64, i64) -> i64
    %1046 = llvm.mlir.addressof @str87 : !llvm.ptr
    %1047 = arith.constant 39 : i64
    %1048 = func.call @cc_make_string(%1046, %1047) : (!llvm.ptr, i64) -> i64
    %1049 = func.call @cc_nil_value() : () -> i64
    %1050 = func.call @cc_intern(%1048, %1049) : (i64, i64) -> i64
    %1051 = func.call @cc_nil_value() : () -> i64
    %1052 = func.call @cc_cons(%1050, %1051) : (i64, i64) -> i64
    %1053 = func.call @cc_values_pack(%1052) : (i64) -> i64
    %1054 = func.call @cc_set_symbol_value(%1050, %1036) : (i64, i64) -> i64
    %1055 = llvm.mlir.addressof @str88 : !llvm.ptr
    %1056 = arith.constant 40 : i64
    %1057 = func.call @cc_make_string(%1055, %1056) : (!llvm.ptr, i64) -> i64
    %1058 = func.call @cc_nil_value() : () -> i64
    %1059 = func.call @cc_intern(%1057, %1058) : (i64, i64) -> i64
    %1060 = func.call @cc_nil_value() : () -> i64
    %1061 = func.call @cc_cons(%1059, %1060) : (i64, i64) -> i64
    %1062 = func.call @cc_values_pack(%1061) : (i64) -> i64
    %1063 = func.call @cc_set_symbol_value(%1059, %1036) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1007) : (i64) -> ()
    %1064 = func.call @stack_pop_pointer() : () -> i64
    %1065 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%1065) : (i64) -> ()
    %1066 = func.call @stack_pop_pointer() : () -> i64
    %1067 = func.call @cc_random(%1066) : (i64) -> i64
    func.call @stack_push_pointer(%1067) : (i64) -> ()
    %1068 = func.call @stack_pop_pointer() : () -> i64
    %1069 = arith.constant 1 : i1
    %1071 = arith.constant 3 : i64
    %1070 = arith.andi %1064, %1071 : i64
    %1072 = arith.constant 0 : i64
    %1073 = arith.cmpi eq, %1070, %1072 : i64
    %1075 = arith.constant 3 : i64
    %1074 = arith.andi %1068, %1075 : i64
    %1076 = arith.constant 0 : i64
    %1077 = arith.cmpi eq, %1074, %1076 : i64
    %1078 = arith.andi %1073, %1077 : i1
    %1079 = scf.if %1078 -> (i1) {
      %1080 = arith.constant 2 : i64
      %1081 = arith.shrsi %1064, %1080 : i64
      %1082 = arith.constant 2 : i64
      %1083 = arith.shrsi %1068, %1082 : i64
      %1084 = arith.cmpi sgt, %1081, %1083 : i64
      scf.yield %1084 : i1
    } else {
      %1085 = func.call @cc_gt(%1064, %1068) : (i64, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = arith.cmpi ne, %1085, %1086 : i64
      scf.yield %1087 : i1
    }
    %1088 = arith.andi %1069, %1079 : i1
    %1089 = func.call @cc_nil_value() : () -> i64
    %1090 = func.call @cc_t_value() : () -> i64
    %1091 = scf.if %1088 -> (i64) {
      scf.yield %1090 : i64
    } else {
      scf.yield %1089 : i64
    }
    func.call @stack_push_pointer(%1091) : (i64) -> ()
    %1092 = func.call @stack_pop_pointer() : () -> i64
    %1093 = func.call @cc_nil_value() : () -> i64
    %1094 = arith.cmpi ne, %1092, %1093 : i64
    scf.if %1094 {
      %1095 = arith.constant 0.0 : f64
      %1096 = func.call @cc_box_single_float(%1095) : (f64) -> i64
      func.call @stack_push_pointer(%1096) : (i64) -> ()
    } else {
      %1097 = arith.constant 0.0 : f64
      %1098 = func.call @cc_box_single_float(%1097) : (f64) -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
    }
    %1099 = func.call @stack_pop_pointer() : () -> i64
    %1100 = func.call @cc_multiple_value_list(%1099) : (i64) -> i64
    %1101 = llvm.mlir.addressof @str89 : !llvm.ptr
    %1102 = arith.constant 38 : i64
    %1103 = func.call @cc_make_string(%1101, %1102) : (!llvm.ptr, i64) -> i64
    %1104 = func.call @cc_nil_value() : () -> i64
    %1105 = func.call @cc_intern(%1103, %1104) : (i64, i64) -> i64
    %1106 = func.call @cc_nil_value() : () -> i64
    %1107 = func.call @cc_cons(%1105, %1106) : (i64, i64) -> i64
    %1108 = func.call @cc_values_pack(%1107) : (i64) -> i64
    %1109 = func.call @cc_symbol_value(%1105) : (i64) -> i64
    %1110 = llvm.mlir.addressof @str90 : !llvm.ptr
    %1111 = arith.constant 39 : i64
    %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
    %1113 = func.call @cc_nil_value() : () -> i64
    %1114 = func.call @cc_intern(%1112, %1113) : (i64, i64) -> i64
    %1115 = func.call @cc_nil_value() : () -> i64
    %1116 = func.call @cc_cons(%1114, %1115) : (i64, i64) -> i64
    %1117 = func.call @cc_values_pack(%1116) : (i64) -> i64
    %1118 = func.call @cc_symbol_value(%1114) : (i64) -> i64
    %1119 = llvm.mlir.addressof @str91 : !llvm.ptr
    %1120 = arith.constant 40 : i64
    %1121 = func.call @cc_make_string(%1119, %1120) : (!llvm.ptr, i64) -> i64
    %1122 = func.call @cc_nil_value() : () -> i64
    %1123 = func.call @cc_intern(%1121, %1122) : (i64, i64) -> i64
    %1124 = func.call @cc_nil_value() : () -> i64
    %1125 = func.call @cc_cons(%1123, %1124) : (i64, i64) -> i64
    %1126 = func.call @cc_values_pack(%1125) : (i64) -> i64
    %1127 = func.call @cc_symbol_value(%1123) : (i64) -> i64
    %1128 = func.call @cc_nil_value() : () -> i64
    %1129 = arith.cmpi ne, %1109, %1128 : i64
    %1130 = scf.if %1129 -> (i64) {
      scf.yield %1127 : i64
    } else {
      scf.yield %1100 : i64
    }
    %1131 = func.call @cc_values_pack(%1130) : (i64) -> i64
    func.call @stack_push_pointer(%1131) : (i64) -> ()
    %1132 = func.call @stack_pop_pointer() : () -> i64
    %1133 = func.call @cc_multiple_value_list(%1132) : (i64) -> i64
    %1134 = llvm.mlir.addressof @str92 : !llvm.ptr
    %1135 = arith.constant 38 : i64
    %1136 = func.call @cc_make_string(%1134, %1135) : (!llvm.ptr, i64) -> i64
    %1137 = func.call @cc_nil_value() : () -> i64
    %1138 = func.call @cc_intern(%1136, %1137) : (i64, i64) -> i64
    %1139 = func.call @cc_nil_value() : () -> i64
    %1140 = func.call @cc_cons(%1138, %1139) : (i64, i64) -> i64
    %1141 = func.call @cc_values_pack(%1140) : (i64) -> i64
    %1142 = func.call @cc_symbol_value(%1138) : (i64) -> i64
    %1143 = llvm.mlir.addressof @str93 : !llvm.ptr
    %1144 = arith.constant 40 : i64
    %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
    %1146 = func.call @cc_nil_value() : () -> i64
    %1147 = func.call @cc_intern(%1145, %1146) : (i64, i64) -> i64
    %1148 = func.call @cc_nil_value() : () -> i64
    %1149 = func.call @cc_cons(%1147, %1148) : (i64, i64) -> i64
    %1150 = func.call @cc_values_pack(%1149) : (i64) -> i64
    %1151 = func.call @cc_symbol_value(%1147) : (i64) -> i64
    %1152 = func.call @cc_nil_value() : () -> i64
    %1153 = arith.cmpi ne, %1142, %1152 : i64
    %1154 = scf.if %1153 -> (i64) {
      scf.yield %1151 : i64
    } else {
      scf.yield %1133 : i64
    }
    %1155 = func.call @cc_values_pack(%1154) : (i64) -> i64
    func.call @stack_push_pointer(%1155) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %1156 = llvm.mlir.addressof @str94 : !llvm.ptr
    %1157 = arith.constant 6 : i64
    %1158 = func.call @cc_make_string(%1156, %1157) : (!llvm.ptr, i64) -> i64
    %1159 = func.call @cc_nil_value() : () -> i64
    %1160 = func.call @cc_intern(%1158, %1159) : (i64, i64) -> i64
    %1161 = func.call @cc_nil_value() : () -> i64
    %1162 = func.call @cc_cons(%1160, %1161) : (i64, i64) -> i64
    %1163 = func.call @cc_values_pack(%1162) : (i64) -> i64
    %1164 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%1160, %1164) : (i64, i64) -> ()
    %1165 = func.call @cc_nil_value() : () -> i64
    %1166 = llvm.mlir.addressof @str95 : !llvm.ptr
    %1167 = arith.constant 38 : i64
    %1168 = func.call @cc_make_string(%1166, %1167) : (!llvm.ptr, i64) -> i64
    %1169 = func.call @cc_nil_value() : () -> i64
    %1170 = func.call @cc_intern(%1168, %1169) : (i64, i64) -> i64
    %1171 = func.call @cc_nil_value() : () -> i64
    %1172 = func.call @cc_cons(%1170, %1171) : (i64, i64) -> i64
    %1173 = func.call @cc_values_pack(%1172) : (i64) -> i64
    %1174 = func.call @cc_set_symbol_value(%1170, %1165) : (i64, i64) -> i64
    %1175 = llvm.mlir.addressof @str96 : !llvm.ptr
    %1176 = arith.constant 39 : i64
    %1177 = func.call @cc_make_string(%1175, %1176) : (!llvm.ptr, i64) -> i64
    %1178 = func.call @cc_nil_value() : () -> i64
    %1179 = func.call @cc_intern(%1177, %1178) : (i64, i64) -> i64
    %1180 = func.call @cc_nil_value() : () -> i64
    %1181 = func.call @cc_cons(%1179, %1180) : (i64, i64) -> i64
    %1182 = func.call @cc_values_pack(%1181) : (i64) -> i64
    %1183 = func.call @cc_set_symbol_value(%1179, %1165) : (i64, i64) -> i64
    %1184 = llvm.mlir.addressof @str97 : !llvm.ptr
    %1185 = arith.constant 40 : i64
    %1186 = func.call @cc_make_string(%1184, %1185) : (!llvm.ptr, i64) -> i64
    %1187 = func.call @cc_nil_value() : () -> i64
    %1188 = func.call @cc_intern(%1186, %1187) : (i64, i64) -> i64
    %1189 = func.call @cc_nil_value() : () -> i64
    %1190 = func.call @cc_cons(%1188, %1189) : (i64, i64) -> i64
    %1191 = func.call @cc_values_pack(%1190) : (i64) -> i64
    %1192 = func.call @cc_set_symbol_value(%1188, %1165) : (i64, i64) -> i64
    %1193 = func.call @cc_nil_value() : () -> i64
    %1194 = func.call @cc_nil_value() : () -> i64
    %1195 = func.call @cc_errorp(%1193) : (i64) -> i64
    %1196 = arith.cmpi ne, %1195, %1194 : i64
    %1197 = scf.if %1196 -> (i64) {
      scf.yield %1193 : i64
    } else {
      %1198 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1199 = arith.constant 11 : i64
      %1200 = func.call @cc_make_string(%1198, %1199) : (!llvm.ptr, i64) -> i64
      %1201 = func.call @cc_nil_value() : () -> i64
      %1202 = func.call @cc_intern(%1200, %1201) : (i64, i64) -> i64
      %1203 = func.call @cc_nil_value() : () -> i64
      %1204 = func.call @cc_cons(%1202, %1203) : (i64, i64) -> i64
      %1205 = func.call @cc_values_pack(%1204) : (i64) -> i64
      func.call @stack_push_pointer(%1202) : (i64) -> ()
      %1206 = func.call @stack_pop_pointer() : () -> i64
      %1207 = func.call @cc_in_package(%1206) : (i64) -> i64
      func.call @stack_push_pointer(%1207) : (i64) -> ()
      %1208 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1208 : i64
    }
    %1209 = func.call @cc_nil_value() : () -> i64
    %1210 = func.call @cc_errorp(%1197) : (i64) -> i64
    %1211 = arith.cmpi ne, %1210, %1209 : i64
    %1212 = scf.if %1211 -> (i64) {
      scf.yield %1197 : i64
    } else {
      %1213 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1214 = arith.constant 17 : i64
      %1215 = func.call @cc_make_string(%1213, %1214) : (!llvm.ptr, i64) -> i64
      %1216 = func.call @cc_nil_value() : () -> i64
      %1217 = func.call @cc_intern(%1215, %1216) : (i64, i64) -> i64
      %1218 = func.call @cc_nil_value() : () -> i64
      %1219 = func.call @cc_cons(%1217, %1218) : (i64, i64) -> i64
      %1220 = func.call @cc_values_pack(%1219) : (i64) -> i64
      func.call @stack_push_pointer(%1217) : (i64) -> ()
      %1221 = func.call @stack_pop_pointer() : () -> i64
      %1222 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1223 = arith.constant 3 : i64
      %1224 = func.call @cc_make_string(%1222, %1223) : (!llvm.ptr, i64) -> i64
      %1225 = func.call @cc_nil_value() : () -> i64
      %1226 = func.call @cc_intern(%1224, %1225) : (i64, i64) -> i64
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_cons(%1226, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_values_pack(%1228) : (i64) -> i64
      func.call @stack_push_pointer(%1226) : (i64) -> ()
      %1230 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1231 = arith.constant 3 : i64
      %1232 = func.call @cc_make_string(%1230, %1231) : (!llvm.ptr, i64) -> i64
      %1233 = func.call @cc_nil_value() : () -> i64
      %1234 = func.call @cc_intern(%1232, %1233) : (i64, i64) -> i64
      %1235 = func.call @cc_nil_value() : () -> i64
      %1236 = func.call @cc_cons(%1234, %1235) : (i64, i64) -> i64
      %1237 = func.call @cc_values_pack(%1236) : (i64) -> i64
      func.call @stack_push_pointer(%1234) : (i64) -> ()
      %1238 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1239 = arith.constant 16 : i64
      %1240 = func.call @cc_make_string(%1238, %1239) : (!llvm.ptr, i64) -> i64
      %1241 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1242 = arith.constant 3 : i64
      %1243 = func.call @cc_make_string(%1241, %1242) : (!llvm.ptr, i64) -> i64
      %1244 = func.call @cc_intern(%1240, %1243) : (i64, i64) -> i64
      %1245 = func.call @cc_nil_value() : () -> i64
      %1246 = func.call @cc_cons(%1244, %1245) : (i64, i64) -> i64
      %1247 = func.call @cc_values_pack(%1246) : (i64) -> i64
      func.call @stack_push_pointer(%1244) : (i64) -> ()
      %1248 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1249 = arith.constant 4 : i64
      %1250 = func.call @cc_make_string(%1248, %1249) : (!llvm.ptr, i64) -> i64
      %1251 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1252 = arith.constant 11 : i64
      %1253 = func.call @cc_make_string(%1251, %1252) : (!llvm.ptr, i64) -> i64
      %1254 = func.call @cc_intern(%1250, %1253) : (i64, i64) -> i64
      %1255 = func.call @cc_nil_value() : () -> i64
      %1256 = func.call @cc_cons(%1254, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_values_pack(%1256) : (i64) -> i64
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      %1258 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1259 = arith.constant 3 : i64
      %1260 = func.call @cc_make_string(%1258, %1259) : (!llvm.ptr, i64) -> i64
      %1261 = func.call @cc_nil_value() : () -> i64
      %1262 = func.call @cc_intern(%1260, %1261) : (i64, i64) -> i64
      %1263 = func.call @cc_nil_value() : () -> i64
      %1264 = func.call @cc_cons(%1262, %1263) : (i64, i64) -> i64
      %1265 = func.call @cc_values_pack(%1264) : (i64) -> i64
      func.call @stack_push_pointer(%1262) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1266 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1267 = arith.constant 2 : i64
      %1268 = func.call @cc_make_string(%1266, %1267) : (!llvm.ptr, i64) -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_intern(%1268, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_nil_value() : () -> i64
      %1272 = func.call @cc_cons(%1270, %1271) : (i64, i64) -> i64
      %1273 = func.call @cc_values_pack(%1272) : (i64) -> i64
      func.call @stack_push_pointer(%1270) : (i64) -> ()
      %1274 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1275 = arith.constant 1 : i64
      %1276 = func.call @cc_make_string(%1274, %1275) : (!llvm.ptr, i64) -> i64
      %1277 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1278 = arith.constant 11 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = func.call @cc_intern(%1276, %1279) : (i64, i64) -> i64
      %1281 = func.call @cc_nil_value() : () -> i64
      %1282 = func.call @cc_cons(%1280, %1281) : (i64, i64) -> i64
      %1283 = func.call @cc_values_pack(%1282) : (i64) -> i64
      func.call @stack_push_pointer(%1280) : (i64) -> ()
      %1284 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1284) : (i64) -> ()
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
      %1295 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%1295) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1296 = func.call @stack_pop_pointer() : () -> i64
      %1297 = func.call @stack_pop_pointer() : () -> i64
      %1298 = func.call @cc_cons(%1297, %1296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      %1299 = func.call @stack_pop_pointer() : () -> i64
      %1300 = func.call @stack_pop_pointer() : () -> i64
      %1301 = func.call @cc_cons(%1300, %1299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1301) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1302 = func.call @stack_pop_pointer() : () -> i64
      %1303 = func.call @stack_pop_pointer() : () -> i64
      %1304 = func.call @cc_cons(%1303, %1302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1304) : (i64) -> ()
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %1306 = func.call @stack_pop_pointer() : () -> i64
      %1307 = func.call @cc_cons(%1306, %1305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1307) : (i64) -> ()
      %1308 = func.call @stack_pop_pointer() : () -> i64
      %1309 = func.call @stack_pop_pointer() : () -> i64
      %1310 = func.call @cc_cons(%1309, %1308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1310) : (i64) -> ()
      %1311 = arith.constant 0.0 : f64
      %1312 = func.call @cc_box_single_float(%1311) : (f64) -> i64
      func.call @stack_push_pointer(%1312) : (i64) -> ()
      %1313 = arith.constant 0.0 : f64
      %1314 = func.call @cc_box_single_float(%1313) : (f64) -> i64
      func.call @stack_push_pointer(%1314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1315 = func.call @stack_pop_pointer() : () -> i64
      %1316 = func.call @stack_pop_pointer() : () -> i64
      %1317 = func.call @cc_cons(%1316, %1315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      %1318 = func.call @stack_pop_pointer() : () -> i64
      %1319 = func.call @stack_pop_pointer() : () -> i64
      %1320 = func.call @cc_cons(%1319, %1318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1320) : (i64) -> ()
      %1321 = func.call @stack_pop_pointer() : () -> i64
      %1322 = func.call @stack_pop_pointer() : () -> i64
      %1323 = func.call @cc_cons(%1322, %1321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1323) : (i64) -> ()
      %1324 = func.call @stack_pop_pointer() : () -> i64
      %1325 = func.call @stack_pop_pointer() : () -> i64
      %1326 = func.call @cc_cons(%1325, %1324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1327 = func.call @stack_pop_pointer() : () -> i64
      %1328 = func.call @stack_pop_pointer() : () -> i64
      %1329 = func.call @cc_cons(%1328, %1327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1329) : (i64) -> ()
      %1330 = func.call @stack_pop_pointer() : () -> i64
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = func.call @cc_cons(%1331, %1330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1332) : (i64) -> ()
      %1333 = func.call @stack_pop_pointer() : () -> i64
      %1334 = func.call @stack_pop_pointer() : () -> i64
      %1335 = func.call @cc_cons(%1334, %1333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      %1336 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1337 = arith.constant 3 : i64
      %1338 = func.call @cc_make_string(%1336, %1337) : (!llvm.ptr, i64) -> i64
      %1339 = func.call @cc_nil_value() : () -> i64
      %1340 = func.call @cc_intern(%1338, %1339) : (i64, i64) -> i64
      %1341 = func.call @cc_nil_value() : () -> i64
      %1342 = func.call @cc_cons(%1340, %1341) : (i64, i64) -> i64
      %1343 = func.call @cc_values_pack(%1342) : (i64) -> i64
      func.call @stack_push_pointer(%1340) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1344 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1345 = arith.constant 2 : i64
      %1346 = func.call @cc_make_string(%1344, %1345) : (!llvm.ptr, i64) -> i64
      %1347 = func.call @cc_nil_value() : () -> i64
      %1348 = func.call @cc_intern(%1346, %1347) : (i64, i64) -> i64
      %1349 = func.call @cc_nil_value() : () -> i64
      %1350 = func.call @cc_cons(%1348, %1349) : (i64, i64) -> i64
      %1351 = func.call @cc_values_pack(%1350) : (i64) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      %1352 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1353 = arith.constant 1 : i64
      %1354 = func.call @cc_make_string(%1352, %1353) : (!llvm.ptr, i64) -> i64
      %1355 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1356 = arith.constant 11 : i64
      %1357 = func.call @cc_make_string(%1355, %1356) : (!llvm.ptr, i64) -> i64
      %1358 = func.call @cc_intern(%1354, %1357) : (i64, i64) -> i64
      %1359 = func.call @cc_nil_value() : () -> i64
      %1360 = func.call @cc_cons(%1358, %1359) : (i64, i64) -> i64
      %1361 = func.call @cc_values_pack(%1360) : (i64) -> i64
      func.call @stack_push_pointer(%1358) : (i64) -> ()
      %1362 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1362) : (i64) -> ()
      %1363 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1364 = arith.constant 6 : i64
      %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
      %1366 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1367 = arith.constant 11 : i64
      %1368 = func.call @cc_make_string(%1366, %1367) : (!llvm.ptr, i64) -> i64
      %1369 = func.call @cc_intern(%1365, %1368) : (i64, i64) -> i64
      %1370 = func.call @cc_nil_value() : () -> i64
      %1371 = func.call @cc_cons(%1369, %1370) : (i64, i64) -> i64
      %1372 = func.call @cc_values_pack(%1371) : (i64) -> i64
      func.call @stack_push_pointer(%1369) : (i64) -> ()
      %1373 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%1373) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1374 = func.call @stack_pop_pointer() : () -> i64
      %1375 = func.call @stack_pop_pointer() : () -> i64
      %1376 = func.call @cc_cons(%1375, %1374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1376) : (i64) -> ()
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @cc_cons(%1378, %1377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1379) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @cc_cons(%1381, %1380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @cc_cons(%1384, %1383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1385) : (i64) -> ()
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @cc_cons(%1387, %1386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1389 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1389) : (i64) -> ()
      %1390 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%1390) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @cc_cons(%1392, %1391) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1393) : (i64) -> ()
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
      %1409 = func.call @stack_pop_pointer() : () -> i64
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = func.call @cc_cons(%1410, %1409) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1411) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1412 = func.call @stack_pop_pointer() : () -> i64
      %1413 = func.call @stack_pop_pointer() : () -> i64
      %1414 = func.call @cc_cons(%1413, %1412) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1414) : (i64) -> ()
      %1415 = func.call @stack_pop_pointer() : () -> i64
      %1416 = func.call @stack_pop_pointer() : () -> i64
      %1417 = func.call @cc_cons(%1416, %1415) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1417) : (i64) -> ()
      %1418 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1419 = arith.constant 23 : i64
      %1420 = func.call @cc_make_string(%1418, %1419) : (!llvm.ptr, i64) -> i64
      %1421 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1422 = arith.constant 3 : i64
      %1423 = func.call @cc_make_string(%1421, %1422) : (!llvm.ptr, i64) -> i64
      %1424 = func.call @cc_intern(%1420, %1423) : (i64, i64) -> i64
      %1425 = func.call @cc_nil_value() : () -> i64
      %1426 = func.call @cc_cons(%1424, %1425) : (i64, i64) -> i64
      %1427 = func.call @cc_values_pack(%1426) : (i64) -> i64
      func.call @stack_push_pointer(%1424) : (i64) -> ()
      %1428 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1429 = arith.constant 14 : i64
      %1430 = func.call @cc_make_string(%1428, %1429) : (!llvm.ptr, i64) -> i64
      %1431 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1432 = arith.constant 7 : i64
      %1433 = func.call @cc_make_string(%1431, %1432) : (!llvm.ptr, i64) -> i64
      %1434 = func.call @cc_intern(%1430, %1433) : (i64, i64) -> i64
      %1435 = func.call @cc_nil_value() : () -> i64
      %1436 = func.call @cc_cons(%1434, %1435) : (i64, i64) -> i64
      %1437 = func.call @cc_values_pack(%1436) : (i64) -> i64
      func.call @stack_push_pointer(%1434) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1438 = func.call @stack_pop_pointer() : () -> i64
      %1439 = func.call @stack_pop_pointer() : () -> i64
      %1440 = func.call @cc_cons(%1439, %1438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1440) : (i64) -> ()
      %1441 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1442 = arith.constant 1 : i64
      %1443 = func.call @cc_make_string(%1441, %1442) : (!llvm.ptr, i64) -> i64
      %1444 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1445 = arith.constant 11 : i64
      %1446 = func.call @cc_make_string(%1444, %1445) : (!llvm.ptr, i64) -> i64
      %1447 = func.call @cc_intern(%1443, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_nil_value() : () -> i64
      %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
      %1450 = func.call @cc_values_pack(%1449) : (i64) -> i64
      func.call @stack_push_pointer(%1447) : (i64) -> ()
      %1451 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1452 = arith.constant 3 : i64
      %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
      %1454 = func.call @cc_nil_value() : () -> i64
      %1455 = func.call @cc_intern(%1453, %1454) : (i64, i64) -> i64
      %1456 = func.call @cc_nil_value() : () -> i64
      %1457 = func.call @cc_cons(%1455, %1456) : (i64, i64) -> i64
      %1458 = func.call @cc_values_pack(%1457) : (i64) -> i64
      func.call @stack_push_pointer(%1455) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1459 = func.call @stack_pop_pointer() : () -> i64
      %1460 = func.call @stack_pop_pointer() : () -> i64
      %1461 = func.call @cc_cons(%1460, %1459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1461) : (i64) -> ()
      %1462 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1463 = arith.constant 3 : i64
      %1464 = func.call @cc_make_string(%1462, %1463) : (!llvm.ptr, i64) -> i64
      %1465 = func.call @cc_nil_value() : () -> i64
      %1466 = func.call @cc_intern(%1464, %1465) : (i64, i64) -> i64
      %1467 = func.call @cc_nil_value() : () -> i64
      %1468 = func.call @cc_cons(%1466, %1467) : (i64, i64) -> i64
      %1469 = func.call @cc_values_pack(%1468) : (i64) -> i64
      func.call @stack_push_pointer(%1466) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1470 = func.call @stack_pop_pointer() : () -> i64
      %1471 = func.call @stack_pop_pointer() : () -> i64
      %1472 = func.call @cc_cons(%1471, %1470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1473 = func.call @stack_pop_pointer() : () -> i64
      %1474 = func.call @stack_pop_pointer() : () -> i64
      %1475 = func.call @cc_cons(%1474, %1473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1475) : (i64) -> ()
      %1476 = func.call @stack_pop_pointer() : () -> i64
      %1477 = func.call @stack_pop_pointer() : () -> i64
      %1478 = func.call @cc_cons(%1477, %1476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1478) : (i64) -> ()
      %1479 = func.call @stack_pop_pointer() : () -> i64
      %1480 = func.call @stack_pop_pointer() : () -> i64
      %1481 = func.call @cc_cons(%1480, %1479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1482 = func.call @stack_pop_pointer() : () -> i64
      %1483 = func.call @stack_pop_pointer() : () -> i64
      %1484 = func.call @cc_cons(%1483, %1482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1484) : (i64) -> ()
      %1485 = func.call @stack_pop_pointer() : () -> i64
      %1486 = func.call @stack_pop_pointer() : () -> i64
      %1487 = func.call @cc_cons(%1486, %1485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1487) : (i64) -> ()
      %1488 = func.call @stack_pop_pointer() : () -> i64
      %1489 = func.call @stack_pop_pointer() : () -> i64
      %1490 = func.call @cc_cons(%1489, %1488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1490) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1491 = func.call @stack_pop_pointer() : () -> i64
      %1492 = func.call @stack_pop_pointer() : () -> i64
      %1493 = func.call @cc_cons(%1492, %1491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1493) : (i64) -> ()
      %1494 = func.call @stack_pop_pointer() : () -> i64
      %1495 = func.call @stack_pop_pointer() : () -> i64
      %1496 = func.call @cc_cons(%1495, %1494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1496) : (i64) -> ()
      %1497 = func.call @stack_pop_pointer() : () -> i64
      %1498 = func.call @stack_pop_pointer() : () -> i64
      %1499 = func.call @cc_cons(%1498, %1497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1499) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1500 = func.call @stack_pop_pointer() : () -> i64
      %1501 = func.call @stack_pop_pointer() : () -> i64
      %1502 = func.call @cc_cons(%1501, %1500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1502) : (i64) -> ()
      %1503 = func.call @stack_pop_pointer() : () -> i64
      %1504 = func.call @stack_pop_pointer() : () -> i64
      %1505 = func.call @cc_cons(%1504, %1503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1505) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1506 = func.call @stack_pop_pointer() : () -> i64
      %1507 = func.call @stack_pop_pointer() : () -> i64
      %1508 = func.call @cc_cons(%1507, %1506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1508) : (i64) -> ()
      %1509 = func.call @stack_pop_pointer() : () -> i64
      %1510 = func.call @stack_pop_pointer() : () -> i64
      %1511 = func.call @cc_cons(%1510, %1509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1512 = func.call @stack_pop_pointer() : () -> i64
      %1513 = func.call @stack_pop_pointer() : () -> i64
      %1514 = func.call @cc_cons(%1513, %1512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1514) : (i64) -> ()
      %1515 = func.call @stack_pop_pointer() : () -> i64
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @cc_cons(%1516, %1515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1517) : (i64) -> ()
      %1518 = func.call @stack_pop_pointer() : () -> i64
      %1758 = arith.constant 152926823645197 : i64
      %1759 = arith.constant 0 : i64
      %1760 = func.call @cc_make_closure(%1758, %1759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1760) : (i64) -> ()
      %1761 = func.call @stack_pop_pointer() : () -> i64
      %1762 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1763 = arith.constant 1 : i64
      %1764 = func.call @cc_make_string(%1762, %1763) : (!llvm.ptr, i64) -> i64
      %1765 = func.call @cc_nil_value() : () -> i64
      %1766 = func.call @cc_intern(%1764, %1765) : (i64, i64) -> i64
      %1767 = func.call @cc_nil_value() : () -> i64
      %1768 = func.call @cc_cons(%1766, %1767) : (i64, i64) -> i64
      %1769 = func.call @cc_values_pack(%1768) : (i64) -> i64
      func.call @stack_push_pointer(%1766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1770 = func.call @stack_pop_pointer() : () -> i64
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = func.call @cc_cons(%1771, %1770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1772) : (i64) -> ()
      %1773 = func.call @stack_pop_pointer() : () -> i64
      %1774 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1775 = arith.constant 11 : i64
      %1776 = func.call @cc_make_string(%1774, %1775) : (!llvm.ptr, i64) -> i64
      %1777 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1778 = arith.constant 7 : i64
      %1779 = func.call @cc_make_string(%1777, %1778) : (!llvm.ptr, i64) -> i64
      %1780 = func.call @cc_intern(%1776, %1779) : (i64, i64) -> i64
      %1781 = func.call @cc_nil_value() : () -> i64
      %1782 = func.call @cc_cons(%1780, %1781) : (i64, i64) -> i64
      %1783 = func.call @cc_values_pack(%1782) : (i64) -> i64
      func.call @stack_push_pointer(%1780) : (i64) -> ()
      %1784 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1785 = func.call @stack_pop_pointer() : () -> i64
      %1786 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1787 = arith.constant 4 : i64
      %1788 = func.call @cc_make_string(%1786, %1787) : (!llvm.ptr, i64) -> i64
      %1789 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1790 = arith.constant 7 : i64
      %1791 = func.call @cc_make_string(%1789, %1790) : (!llvm.ptr, i64) -> i64
      %1792 = func.call @cc_intern(%1788, %1791) : (i64, i64) -> i64
      %1793 = func.call @cc_nil_value() : () -> i64
      %1794 = func.call @cc_cons(%1792, %1793) : (i64, i64) -> i64
      %1795 = func.call @cc_values_pack(%1794) : (i64) -> i64
      func.call @stack_push_pointer(%1792) : (i64) -> ()
      %1796 = func.call @stack_pop_pointer() : () -> i64
      %1797 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1798 = arith.constant 6 : i64
      %1799 = func.call @cc_make_string(%1797, %1798) : (!llvm.ptr, i64) -> i64
      %1800 = func.call @cc_nil_value() : () -> i64
      %1801 = func.call @cc_intern(%1799, %1800) : (i64, i64) -> i64
      %1802 = func.call @cc_nil_value() : () -> i64
      %1803 = func.call @cc_cons(%1801, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_values_pack(%1803) : (i64) -> i64
      func.call @stack_push_pointer(%1801) : (i64) -> ()
      %1805 = func.call @stack_pop_pointer() : () -> i64
      %1806 = func.call @cc_nil_value() : () -> i64
      %1807 = func.call @cc_errorp(%1221) : (i64) -> i64
      %1808 = arith.cmpi ne, %1807, %1806 : i64
      %1809 = arith.cmpi eq, %1806, %1806 : i64
      %1810 = arith.andi %1808, %1809 : i1
      %1811 = scf.if %1810 -> (i64) {
        scf.yield %1221 : i64
      } else {
        scf.yield %1806 : i64
      }
      %1812 = func.call @cc_errorp(%1518) : (i64) -> i64
      %1813 = arith.cmpi ne, %1812, %1806 : i64
      %1814 = arith.cmpi eq, %1811, %1806 : i64
      %1815 = arith.andi %1813, %1814 : i1
      %1816 = scf.if %1815 -> (i64) {
        scf.yield %1518 : i64
      } else {
        scf.yield %1811 : i64
      }
      %1817 = func.call @cc_errorp(%1761) : (i64) -> i64
      %1818 = arith.cmpi ne, %1817, %1806 : i64
      %1819 = arith.cmpi eq, %1816, %1806 : i64
      %1820 = arith.andi %1818, %1819 : i1
      %1821 = scf.if %1820 -> (i64) {
        scf.yield %1761 : i64
      } else {
        scf.yield %1816 : i64
      }
      %1822 = func.call @cc_errorp(%1773) : (i64) -> i64
      %1823 = arith.cmpi ne, %1822, %1806 : i64
      %1824 = arith.cmpi eq, %1821, %1806 : i64
      %1825 = arith.andi %1823, %1824 : i1
      %1826 = scf.if %1825 -> (i64) {
        scf.yield %1773 : i64
      } else {
        scf.yield %1821 : i64
      }
      %1827 = func.call @cc_errorp(%1784) : (i64) -> i64
      %1828 = arith.cmpi ne, %1827, %1806 : i64
      %1829 = arith.cmpi eq, %1826, %1806 : i64
      %1830 = arith.andi %1828, %1829 : i1
      %1831 = scf.if %1830 -> (i64) {
        scf.yield %1784 : i64
      } else {
        scf.yield %1826 : i64
      }
      %1832 = func.call @cc_errorp(%1785) : (i64) -> i64
      %1833 = arith.cmpi ne, %1832, %1806 : i64
      %1834 = arith.cmpi eq, %1831, %1806 : i64
      %1835 = arith.andi %1833, %1834 : i1
      %1836 = scf.if %1835 -> (i64) {
        scf.yield %1785 : i64
      } else {
        scf.yield %1831 : i64
      }
      %1837 = func.call @cc_errorp(%1796) : (i64) -> i64
      %1838 = arith.cmpi ne, %1837, %1806 : i64
      %1839 = arith.cmpi eq, %1836, %1806 : i64
      %1840 = arith.andi %1838, %1839 : i1
      %1841 = scf.if %1840 -> (i64) {
        scf.yield %1796 : i64
      } else {
        scf.yield %1836 : i64
      }
      %1842 = func.call @cc_errorp(%1805) : (i64) -> i64
      %1843 = arith.cmpi ne, %1842, %1806 : i64
      %1844 = arith.cmpi eq, %1841, %1806 : i64
      %1845 = arith.andi %1843, %1844 : i1
      %1846 = scf.if %1845 -> (i64) {
        scf.yield %1805 : i64
      } else {
        scf.yield %1841 : i64
      }
      %1847 = arith.cmpi ne, %1846, %1806 : i64
      scf.if %1847 {
        func.call @stack_push_pointer(%1846) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1221) : (i64) -> ()
        func.call @stack_push_pointer(%1518) : (i64) -> ()
        func.call @stack_push_pointer(%1761) : (i64) -> ()
        func.call @stack_push_pointer(%1773) : (i64) -> ()
        func.call @stack_push_pointer(%1784) : (i64) -> ()
        func.call @stack_push_pointer(%1785) : (i64) -> ()
        func.call @stack_push_pointer(%1796) : (i64) -> ()
        func.call @stack_push_pointer(%1805) : (i64) -> ()
        %1848 = llvm.mlir.addressof @str147 : !llvm.ptr
        %1849 = func.call @cc_make_function_ref_const(%1848) : (!llvm.ptr) -> i64
        %1850 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1849, %1850) : (i64, i64) -> ()
      }
      %1851 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1851 : i64
    }
    %1852 = func.call @cc_nil_value() : () -> i64
    %1853 = func.call @cc_errorp(%1212) : (i64) -> i64
    %1854 = arith.cmpi ne, %1853, %1852 : i64
    %1855 = scf.if %1854 -> (i64) {
      scf.yield %1212 : i64
    } else {
      %1856 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1857 = arith.constant 17 : i64
      %1858 = func.call @cc_make_string(%1856, %1857) : (!llvm.ptr, i64) -> i64
      %1859 = func.call @cc_nil_value() : () -> i64
      %1860 = func.call @cc_intern(%1858, %1859) : (i64, i64) -> i64
      %1861 = func.call @cc_nil_value() : () -> i64
      %1862 = func.call @cc_cons(%1860, %1861) : (i64, i64) -> i64
      %1863 = func.call @cc_values_pack(%1862) : (i64) -> i64
      func.call @stack_push_pointer(%1860) : (i64) -> ()
      %1864 = func.call @stack_pop_pointer() : () -> i64
      %1865 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1866 = arith.constant 13 : i64
      %1867 = func.call @cc_make_string(%1865, %1866) : (!llvm.ptr, i64) -> i64
      %1868 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1869 = arith.constant 11 : i64
      %1870 = func.call @cc_make_string(%1868, %1869) : (!llvm.ptr, i64) -> i64
      %1871 = func.call @cc_intern(%1867, %1870) : (i64, i64) -> i64
      %1872 = func.call @cc_nil_value() : () -> i64
      %1873 = func.call @cc_cons(%1871, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_values_pack(%1873) : (i64) -> i64
      func.call @stack_push_pointer(%1871) : (i64) -> ()
      %1875 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1876 = arith.constant 6 : i64
      %1877 = func.call @cc_make_string(%1875, %1876) : (!llvm.ptr, i64) -> i64
      %1878 = func.call @cc_nil_value() : () -> i64
      %1879 = func.call @cc_intern(%1877, %1878) : (i64, i64) -> i64
      %1880 = func.call @cc_nil_value() : () -> i64
      %1881 = func.call @cc_cons(%1879, %1880) : (i64, i64) -> i64
      %1882 = func.call @cc_values_pack(%1881) : (i64) -> i64
      func.call @stack_push_pointer(%1879) : (i64) -> ()
      %1883 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1884 = arith.constant 19 : i64
      %1885 = func.call @cc_make_string(%1883, %1884) : (!llvm.ptr, i64) -> i64
      %1886 = func.call @cc_nil_value() : () -> i64
      %1887 = func.call @cc_intern(%1885, %1886) : (i64, i64) -> i64
      %1888 = func.call @cc_nil_value() : () -> i64
      %1889 = func.call @cc_cons(%1887, %1888) : (i64, i64) -> i64
      %1890 = func.call @cc_values_pack(%1889) : (i64) -> i64
      func.call @stack_push_pointer(%1887) : (i64) -> ()
      %1891 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1892 = arith.constant 4 : i64
      %1893 = func.call @cc_make_string(%1891, %1892) : (!llvm.ptr, i64) -> i64
      %1894 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1895 = arith.constant 11 : i64
      %1896 = func.call @cc_make_string(%1894, %1895) : (!llvm.ptr, i64) -> i64
      %1897 = func.call @cc_intern(%1893, %1896) : (i64, i64) -> i64
      %1898 = func.call @cc_nil_value() : () -> i64
      %1899 = func.call @cc_cons(%1897, %1898) : (i64, i64) -> i64
      %1900 = func.call @cc_values_pack(%1899) : (i64) -> i64
      func.call @stack_push_pointer(%1897) : (i64) -> ()
      %1901 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1902 = arith.constant 3 : i64
      %1903 = func.call @cc_make_string(%1901, %1902) : (!llvm.ptr, i64) -> i64
      %1904 = func.call @cc_nil_value() : () -> i64
      %1905 = func.call @cc_intern(%1903, %1904) : (i64, i64) -> i64
      %1906 = func.call @cc_nil_value() : () -> i64
      %1907 = func.call @cc_cons(%1905, %1906) : (i64, i64) -> i64
      %1908 = func.call @cc_values_pack(%1907) : (i64) -> i64
      func.call @stack_push_pointer(%1905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1909 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1910 = arith.constant 2 : i64
      %1911 = func.call @cc_make_string(%1909, %1910) : (!llvm.ptr, i64) -> i64
      %1912 = func.call @cc_nil_value() : () -> i64
      %1913 = func.call @cc_intern(%1911, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_nil_value() : () -> i64
      %1915 = func.call @cc_cons(%1913, %1914) : (i64, i64) -> i64
      %1916 = func.call @cc_values_pack(%1915) : (i64) -> i64
      func.call @stack_push_pointer(%1913) : (i64) -> ()
      %1917 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1918 = arith.constant 1 : i64
      %1919 = func.call @cc_make_string(%1917, %1918) : (!llvm.ptr, i64) -> i64
      %1920 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1921 = arith.constant 11 : i64
      %1922 = func.call @cc_make_string(%1920, %1921) : (!llvm.ptr, i64) -> i64
      %1923 = func.call @cc_intern(%1919, %1922) : (i64, i64) -> i64
      %1924 = func.call @cc_nil_value() : () -> i64
      %1925 = func.call @cc_cons(%1923, %1924) : (i64, i64) -> i64
      %1926 = func.call @cc_values_pack(%1925) : (i64) -> i64
      func.call @stack_push_pointer(%1923) : (i64) -> ()
      %1927 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1927) : (i64) -> ()
      %1928 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1929 = arith.constant 6 : i64
      %1930 = func.call @cc_make_string(%1928, %1929) : (!llvm.ptr, i64) -> i64
      %1931 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1932 = arith.constant 11 : i64
      %1933 = func.call @cc_make_string(%1931, %1932) : (!llvm.ptr, i64) -> i64
      %1934 = func.call @cc_intern(%1930, %1933) : (i64, i64) -> i64
      %1935 = func.call @cc_nil_value() : () -> i64
      %1936 = func.call @cc_cons(%1934, %1935) : (i64, i64) -> i64
      %1937 = func.call @cc_values_pack(%1936) : (i64) -> i64
      func.call @stack_push_pointer(%1934) : (i64) -> ()
      %1938 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%1938) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @stack_pop_pointer() : () -> i64
      %1941 = func.call @cc_cons(%1940, %1939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1941) : (i64) -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @stack_pop_pointer() : () -> i64
      %1947 = func.call @cc_cons(%1946, %1945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1947) : (i64) -> ()
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @stack_pop_pointer() : () -> i64
      %1950 = func.call @cc_cons(%1949, %1948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1950) : (i64) -> ()
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @stack_pop_pointer() : () -> i64
      %1953 = func.call @cc_cons(%1952, %1951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      %1954 = arith.constant 0.0 : f64
      %1955 = func.call @cc_box_single_float(%1954) : (f64) -> i64
      func.call @stack_push_pointer(%1955) : (i64) -> ()
      %1956 = arith.constant 0.0 : f64
      %1957 = func.call @cc_box_single_float(%1956) : (f64) -> i64
      func.call @stack_push_pointer(%1957) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1958 = func.call @stack_pop_pointer() : () -> i64
      %1959 = func.call @stack_pop_pointer() : () -> i64
      %1960 = func.call @cc_cons(%1959, %1958) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1960) : (i64) -> ()
      %1961 = func.call @stack_pop_pointer() : () -> i64
      %1962 = func.call @stack_pop_pointer() : () -> i64
      %1963 = func.call @cc_cons(%1962, %1961) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1963) : (i64) -> ()
      %1964 = func.call @stack_pop_pointer() : () -> i64
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %1966 = func.call @cc_cons(%1965, %1964) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1966) : (i64) -> ()
      %1967 = func.call @stack_pop_pointer() : () -> i64
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = func.call @cc_cons(%1968, %1967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1969) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1970 = func.call @stack_pop_pointer() : () -> i64
      %1971 = func.call @stack_pop_pointer() : () -> i64
      %1972 = func.call @cc_cons(%1971, %1970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1972) : (i64) -> ()
      %1973 = func.call @stack_pop_pointer() : () -> i64
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %1975 = func.call @cc_cons(%1974, %1973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1975) : (i64) -> ()
      %1976 = func.call @stack_pop_pointer() : () -> i64
      %1977 = func.call @stack_pop_pointer() : () -> i64
      %1978 = func.call @cc_cons(%1977, %1976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1978) : (i64) -> ()
      %1979 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1980 = arith.constant 3 : i64
      %1981 = func.call @cc_make_string(%1979, %1980) : (!llvm.ptr, i64) -> i64
      %1982 = func.call @cc_nil_value() : () -> i64
      %1983 = func.call @cc_intern(%1981, %1982) : (i64, i64) -> i64
      %1984 = func.call @cc_nil_value() : () -> i64
      %1985 = func.call @cc_cons(%1983, %1984) : (i64, i64) -> i64
      %1986 = func.call @cc_values_pack(%1985) : (i64) -> i64
      func.call @stack_push_pointer(%1983) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1987 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1988 = arith.constant 2 : i64
      %1989 = func.call @cc_make_string(%1987, %1988) : (!llvm.ptr, i64) -> i64
      %1990 = func.call @cc_nil_value() : () -> i64
      %1991 = func.call @cc_intern(%1989, %1990) : (i64, i64) -> i64
      %1992 = func.call @cc_nil_value() : () -> i64
      %1993 = func.call @cc_cons(%1991, %1992) : (i64, i64) -> i64
      %1994 = func.call @cc_values_pack(%1993) : (i64) -> i64
      func.call @stack_push_pointer(%1991) : (i64) -> ()
      %1995 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1996 = arith.constant 1 : i64
      %1997 = func.call @cc_make_string(%1995, %1996) : (!llvm.ptr, i64) -> i64
      %1998 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1999 = arith.constant 11 : i64
      %2000 = func.call @cc_make_string(%1998, %1999) : (!llvm.ptr, i64) -> i64
      %2001 = func.call @cc_intern(%1997, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_nil_value() : () -> i64
      %2003 = func.call @cc_cons(%2001, %2002) : (i64, i64) -> i64
      %2004 = func.call @cc_values_pack(%2003) : (i64) -> i64
      func.call @stack_push_pointer(%2001) : (i64) -> ()
      %2005 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2005) : (i64) -> ()
      %2006 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2007 = arith.constant 6 : i64
      %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
      %2009 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2010 = arith.constant 11 : i64
      %2011 = func.call @cc_make_string(%2009, %2010) : (!llvm.ptr, i64) -> i64
      %2012 = func.call @cc_intern(%2008, %2011) : (i64, i64) -> i64
      %2013 = func.call @cc_nil_value() : () -> i64
      %2014 = func.call @cc_cons(%2012, %2013) : (i64, i64) -> i64
      %2015 = func.call @cc_values_pack(%2014) : (i64) -> i64
      func.call @stack_push_pointer(%2012) : (i64) -> ()
      %2016 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%2016) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2017 = func.call @stack_pop_pointer() : () -> i64
      %2018 = func.call @stack_pop_pointer() : () -> i64
      %2019 = func.call @cc_cons(%2018, %2017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2019) : (i64) -> ()
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2021 = func.call @stack_pop_pointer() : () -> i64
      %2022 = func.call @cc_cons(%2021, %2020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2022) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2023 = func.call @stack_pop_pointer() : () -> i64
      %2024 = func.call @stack_pop_pointer() : () -> i64
      %2025 = func.call @cc_cons(%2024, %2023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2025) : (i64) -> ()
      %2026 = func.call @stack_pop_pointer() : () -> i64
      %2027 = func.call @stack_pop_pointer() : () -> i64
      %2028 = func.call @cc_cons(%2027, %2026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2028) : (i64) -> ()
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @stack_pop_pointer() : () -> i64
      %2031 = func.call @cc_cons(%2030, %2029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2031) : (i64) -> ()
      %2032 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%2032) : (i64) -> ()
      %2033 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%2033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2034 = func.call @stack_pop_pointer() : () -> i64
      %2035 = func.call @stack_pop_pointer() : () -> i64
      %2036 = func.call @cc_cons(%2035, %2034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2036) : (i64) -> ()
      %2037 = func.call @stack_pop_pointer() : () -> i64
      %2038 = func.call @stack_pop_pointer() : () -> i64
      %2039 = func.call @cc_cons(%2038, %2037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2039) : (i64) -> ()
      %2040 = func.call @stack_pop_pointer() : () -> i64
      %2041 = func.call @stack_pop_pointer() : () -> i64
      %2042 = func.call @cc_cons(%2041, %2040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2042) : (i64) -> ()
      %2043 = func.call @stack_pop_pointer() : () -> i64
      %2044 = func.call @stack_pop_pointer() : () -> i64
      %2045 = func.call @cc_cons(%2044, %2043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2046 = func.call @stack_pop_pointer() : () -> i64
      %2047 = func.call @stack_pop_pointer() : () -> i64
      %2048 = func.call @cc_cons(%2047, %2046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2048) : (i64) -> ()
      %2049 = func.call @stack_pop_pointer() : () -> i64
      %2050 = func.call @stack_pop_pointer() : () -> i64
      %2051 = func.call @cc_cons(%2050, %2049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2051) : (i64) -> ()
      %2052 = func.call @stack_pop_pointer() : () -> i64
      %2053 = func.call @stack_pop_pointer() : () -> i64
      %2054 = func.call @cc_cons(%2053, %2052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2055 = func.call @stack_pop_pointer() : () -> i64
      %2056 = func.call @stack_pop_pointer() : () -> i64
      %2057 = func.call @cc_cons(%2056, %2055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2057) : (i64) -> ()
      %2058 = func.call @stack_pop_pointer() : () -> i64
      %2059 = func.call @stack_pop_pointer() : () -> i64
      %2060 = func.call @cc_cons(%2059, %2058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2060) : (i64) -> ()
      %2061 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2062 = arith.constant 1 : i64
      %2063 = func.call @cc_make_string(%2061, %2062) : (!llvm.ptr, i64) -> i64
      %2064 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2065 = arith.constant 11 : i64
      %2066 = func.call @cc_make_string(%2064, %2065) : (!llvm.ptr, i64) -> i64
      %2067 = func.call @cc_intern(%2063, %2066) : (i64, i64) -> i64
      %2068 = func.call @cc_nil_value() : () -> i64
      %2069 = func.call @cc_cons(%2067, %2068) : (i64, i64) -> i64
      %2070 = func.call @cc_values_pack(%2069) : (i64) -> i64
      func.call @stack_push_pointer(%2067) : (i64) -> ()
      %2071 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2072 = arith.constant 3 : i64
      %2073 = func.call @cc_make_string(%2071, %2072) : (!llvm.ptr, i64) -> i64
      %2074 = func.call @cc_nil_value() : () -> i64
      %2075 = func.call @cc_intern(%2073, %2074) : (i64, i64) -> i64
      %2076 = func.call @cc_nil_value() : () -> i64
      %2077 = func.call @cc_cons(%2075, %2076) : (i64, i64) -> i64
      %2078 = func.call @cc_values_pack(%2077) : (i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2079 = func.call @stack_pop_pointer() : () -> i64
      %2080 = func.call @stack_pop_pointer() : () -> i64
      %2081 = func.call @cc_cons(%2080, %2079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2081) : (i64) -> ()
      %2082 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2083 = arith.constant 3 : i64
      %2084 = func.call @cc_make_string(%2082, %2083) : (!llvm.ptr, i64) -> i64
      %2085 = func.call @cc_nil_value() : () -> i64
      %2086 = func.call @cc_intern(%2084, %2085) : (i64, i64) -> i64
      %2087 = func.call @cc_nil_value() : () -> i64
      %2088 = func.call @cc_cons(%2086, %2087) : (i64, i64) -> i64
      %2089 = func.call @cc_values_pack(%2088) : (i64) -> i64
      func.call @stack_push_pointer(%2086) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2090 = func.call @stack_pop_pointer() : () -> i64
      %2091 = func.call @stack_pop_pointer() : () -> i64
      %2092 = func.call @cc_cons(%2091, %2090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2092) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %2108 = func.call @stack_pop_pointer() : () -> i64
      %2109 = func.call @stack_pop_pointer() : () -> i64
      %2110 = func.call @cc_cons(%2109, %2108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2110) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2111 = func.call @stack_pop_pointer() : () -> i64
      %2112 = func.call @stack_pop_pointer() : () -> i64
      %2113 = func.call @cc_cons(%2112, %2111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2113) : (i64) -> ()
      %2114 = func.call @stack_pop_pointer() : () -> i64
      %2115 = func.call @stack_pop_pointer() : () -> i64
      %2116 = func.call @cc_cons(%2115, %2114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %2132 = func.call @stack_pop_pointer() : () -> i64
      %2374 = arith.constant 152926823645202 : i64
      %2375 = arith.constant 0 : i64
      %2376 = func.call @cc_make_closure(%2374, %2375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2376) : (i64) -> ()
      %2377 = func.call @stack_pop_pointer() : () -> i64
      %2378 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2379 = arith.constant 4 : i64
      %2380 = func.call @cc_make_string(%2378, %2379) : (!llvm.ptr, i64) -> i64
      %2381 = func.call @cc_nil_value() : () -> i64
      %2382 = func.call @cc_intern(%2380, %2381) : (i64, i64) -> i64
      %2383 = func.call @cc_nil_value() : () -> i64
      %2384 = func.call @cc_cons(%2382, %2383) : (i64, i64) -> i64
      %2385 = func.call @cc_values_pack(%2384) : (i64) -> i64
      func.call @stack_push_pointer(%2382) : (i64) -> ()
      %2386 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2387 = arith.constant 16 : i64
      %2388 = func.call @cc_make_string(%2386, %2387) : (!llvm.ptr, i64) -> i64
      %2389 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2390 = arith.constant 11 : i64
      %2391 = func.call @cc_make_string(%2389, %2390) : (!llvm.ptr, i64) -> i64
      %2392 = func.call @cc_intern(%2388, %2391) : (i64, i64) -> i64
      %2393 = func.call @cc_nil_value() : () -> i64
      %2394 = func.call @cc_cons(%2392, %2393) : (i64, i64) -> i64
      %2395 = func.call @cc_values_pack(%2394) : (i64) -> i64
      func.call @stack_push_pointer(%2392) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2396 = func.call @stack_pop_pointer() : () -> i64
      %2397 = func.call @stack_pop_pointer() : () -> i64
      %2398 = func.call @cc_cons(%2397, %2396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2398) : (i64) -> ()
      %2399 = func.call @stack_pop_pointer() : () -> i64
      %2400 = func.call @stack_pop_pointer() : () -> i64
      %2401 = func.call @cc_cons(%2400, %2399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2401) : (i64) -> ()
      %2402 = func.call @stack_pop_pointer() : () -> i64
      %2403 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2404 = arith.constant 11 : i64
      %2405 = func.call @cc_make_string(%2403, %2404) : (!llvm.ptr, i64) -> i64
      %2406 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2407 = arith.constant 7 : i64
      %2408 = func.call @cc_make_string(%2406, %2407) : (!llvm.ptr, i64) -> i64
      %2409 = func.call @cc_intern(%2405, %2408) : (i64, i64) -> i64
      %2410 = func.call @cc_nil_value() : () -> i64
      %2411 = func.call @cc_cons(%2409, %2410) : (i64, i64) -> i64
      %2412 = func.call @cc_values_pack(%2411) : (i64) -> i64
      func.call @stack_push_pointer(%2409) : (i64) -> ()
      %2413 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2414 = func.call @stack_pop_pointer() : () -> i64
      %2415 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2416 = arith.constant 4 : i64
      %2417 = func.call @cc_make_string(%2415, %2416) : (!llvm.ptr, i64) -> i64
      %2418 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2419 = arith.constant 7 : i64
      %2420 = func.call @cc_make_string(%2418, %2419) : (!llvm.ptr, i64) -> i64
      %2421 = func.call @cc_intern(%2417, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_nil_value() : () -> i64
      %2423 = func.call @cc_cons(%2421, %2422) : (i64, i64) -> i64
      %2424 = func.call @cc_values_pack(%2423) : (i64) -> i64
      func.call @stack_push_pointer(%2421) : (i64) -> ()
      %2425 = func.call @stack_pop_pointer() : () -> i64
      %2426 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2427 = arith.constant 5 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = func.call @cc_nil_value() : () -> i64
      %2430 = func.call @cc_intern(%2428, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
      func.call @stack_push_pointer(%2430) : (i64) -> ()
      %2434 = func.call @stack_pop_pointer() : () -> i64
      %2435 = func.call @cc_nil_value() : () -> i64
      %2436 = func.call @cc_errorp(%1864) : (i64) -> i64
      %2437 = arith.cmpi ne, %2436, %2435 : i64
      %2438 = arith.cmpi eq, %2435, %2435 : i64
      %2439 = arith.andi %2437, %2438 : i1
      %2440 = scf.if %2439 -> (i64) {
        scf.yield %1864 : i64
      } else {
        scf.yield %2435 : i64
      }
      %2441 = func.call @cc_errorp(%2132) : (i64) -> i64
      %2442 = arith.cmpi ne, %2441, %2435 : i64
      %2443 = arith.cmpi eq, %2440, %2435 : i64
      %2444 = arith.andi %2442, %2443 : i1
      %2445 = scf.if %2444 -> (i64) {
        scf.yield %2132 : i64
      } else {
        scf.yield %2440 : i64
      }
      %2446 = func.call @cc_errorp(%2377) : (i64) -> i64
      %2447 = arith.cmpi ne, %2446, %2435 : i64
      %2448 = arith.cmpi eq, %2445, %2435 : i64
      %2449 = arith.andi %2447, %2448 : i1
      %2450 = scf.if %2449 -> (i64) {
        scf.yield %2377 : i64
      } else {
        scf.yield %2445 : i64
      }
      %2451 = func.call @cc_errorp(%2402) : (i64) -> i64
      %2452 = arith.cmpi ne, %2451, %2435 : i64
      %2453 = arith.cmpi eq, %2450, %2435 : i64
      %2454 = arith.andi %2452, %2453 : i1
      %2455 = scf.if %2454 -> (i64) {
        scf.yield %2402 : i64
      } else {
        scf.yield %2450 : i64
      }
      %2456 = func.call @cc_errorp(%2413) : (i64) -> i64
      %2457 = arith.cmpi ne, %2456, %2435 : i64
      %2458 = arith.cmpi eq, %2455, %2435 : i64
      %2459 = arith.andi %2457, %2458 : i1
      %2460 = scf.if %2459 -> (i64) {
        scf.yield %2413 : i64
      } else {
        scf.yield %2455 : i64
      }
      %2461 = func.call @cc_errorp(%2414) : (i64) -> i64
      %2462 = arith.cmpi ne, %2461, %2435 : i64
      %2463 = arith.cmpi eq, %2460, %2435 : i64
      %2464 = arith.andi %2462, %2463 : i1
      %2465 = scf.if %2464 -> (i64) {
        scf.yield %2414 : i64
      } else {
        scf.yield %2460 : i64
      }
      %2466 = func.call @cc_errorp(%2425) : (i64) -> i64
      %2467 = arith.cmpi ne, %2466, %2435 : i64
      %2468 = arith.cmpi eq, %2465, %2435 : i64
      %2469 = arith.andi %2467, %2468 : i1
      %2470 = scf.if %2469 -> (i64) {
        scf.yield %2425 : i64
      } else {
        scf.yield %2465 : i64
      }
      %2471 = func.call @cc_errorp(%2434) : (i64) -> i64
      %2472 = arith.cmpi ne, %2471, %2435 : i64
      %2473 = arith.cmpi eq, %2470, %2435 : i64
      %2474 = arith.andi %2472, %2473 : i1
      %2475 = scf.if %2474 -> (i64) {
        scf.yield %2434 : i64
      } else {
        scf.yield %2470 : i64
      }
      %2476 = arith.cmpi ne, %2475, %2435 : i64
      scf.if %2476 {
        func.call @stack_push_pointer(%2475) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1864) : (i64) -> ()
        func.call @stack_push_pointer(%2132) : (i64) -> ()
        func.call @stack_push_pointer(%2377) : (i64) -> ()
        func.call @stack_push_pointer(%2402) : (i64) -> ()
        func.call @stack_push_pointer(%2413) : (i64) -> ()
        func.call @stack_push_pointer(%2414) : (i64) -> ()
        func.call @stack_push_pointer(%2425) : (i64) -> ()
        func.call @stack_push_pointer(%2434) : (i64) -> ()
        %2477 = llvm.mlir.addressof @str191 : !llvm.ptr
        %2478 = func.call @cc_make_function_ref_const(%2477) : (!llvm.ptr) -> i64
        %2479 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2478, %2479) : (i64, i64) -> ()
      }
      %2480 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2480 : i64
    }
    %2481 = func.call @cc_nil_value() : () -> i64
    %2482 = func.call @cc_errorp(%1855) : (i64) -> i64
    %2483 = arith.cmpi ne, %2482, %2481 : i64
    %2484 = scf.if %2483 -> (i64) {
      scf.yield %1855 : i64
    } else {
      %2485 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2486 = func.call @cc_make_function_ref_const(%2485) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2486) : (i64) -> ()
      %2487 = func.call @stack_pop_pointer() : () -> i64
      %2488 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2489 = arith.constant 9 : i64
      %2490 = func.call @cc_make_string(%2488, %2489) : (!llvm.ptr, i64) -> i64
      %2491 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2492 = arith.constant 15 : i64
      %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
      %2494 = func.call @cc_intern(%2490, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_nil_value() : () -> i64
      %2496 = func.call @cc_cons(%2494, %2495) : (i64, i64) -> i64
      %2497 = func.call @cc_values_pack(%2496) : (i64) -> i64
      %2498 = func.call @cc_set_symbol_value(%2494, %2487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2487) : (i64) -> ()
      %2499 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2499 : i64
    }
    %2500 = func.call @cc_nil_value() : () -> i64
    %2501 = func.call @cc_errorp(%2484) : (i64) -> i64
    %2502 = arith.cmpi ne, %2501, %2500 : i64
    %2503 = scf.if %2502 -> (i64) {
      scf.yield %2484 : i64
    } else {
      %2504 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2505 = func.call @cc_make_function_ref_const(%2504) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2505) : (i64) -> ()
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2508 = arith.constant 9 : i64
      %2509 = func.call @cc_make_string(%2507, %2508) : (!llvm.ptr, i64) -> i64
      %2510 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2511 = arith.constant 15 : i64
      %2512 = func.call @cc_make_string(%2510, %2511) : (!llvm.ptr, i64) -> i64
      %2513 = func.call @cc_intern(%2509, %2512) : (i64, i64) -> i64
      %2514 = func.call @cc_nil_value() : () -> i64
      %2515 = func.call @cc_cons(%2513, %2514) : (i64, i64) -> i64
      %2516 = func.call @cc_values_pack(%2515) : (i64) -> i64
      %2517 = func.call @cc_set_symbol_value(%2513, %2506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2506) : (i64) -> ()
      %2518 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2518 : i64
    }
    %2519 = func.call @cc_nil_value() : () -> i64
    %2520 = func.call @cc_errorp(%2503) : (i64) -> i64
    %2521 = arith.cmpi ne, %2520, %2519 : i64
    %2522 = scf.if %2521 -> (i64) {
      scf.yield %2503 : i64
    } else {
      %2523 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2524 = func.call @cc_make_function_ref_const(%2523) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2524) : (i64) -> ()
      %2525 = func.call @stack_pop_pointer() : () -> i64
      %2526 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2527 = arith.constant 9 : i64
      %2528 = func.call @cc_make_string(%2526, %2527) : (!llvm.ptr, i64) -> i64
      %2529 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2530 = arith.constant 15 : i64
      %2531 = func.call @cc_make_string(%2529, %2530) : (!llvm.ptr, i64) -> i64
      %2532 = func.call @cc_intern(%2528, %2531) : (i64, i64) -> i64
      %2533 = func.call @cc_nil_value() : () -> i64
      %2534 = func.call @cc_cons(%2532, %2533) : (i64, i64) -> i64
      %2535 = func.call @cc_values_pack(%2534) : (i64) -> i64
      %2536 = func.call @cc_set_symbol_value(%2532, %2525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2525) : (i64) -> ()
      %2537 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2537 : i64
    }
    %2538 = func.call @cc_nil_value() : () -> i64
    %2539 = func.call @cc_errorp(%2522) : (i64) -> i64
    %2540 = arith.cmpi ne, %2539, %2538 : i64
    %2541 = scf.if %2540 -> (i64) {
      scf.yield %2522 : i64
    } else {
      %2542 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2543 = func.call @cc_make_function_ref_const(%2542) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2543) : (i64) -> ()
      %2544 = func.call @stack_pop_pointer() : () -> i64
      %2545 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2546 = arith.constant 9 : i64
      %2547 = func.call @cc_make_string(%2545, %2546) : (!llvm.ptr, i64) -> i64
      %2548 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2549 = arith.constant 15 : i64
      %2550 = func.call @cc_make_string(%2548, %2549) : (!llvm.ptr, i64) -> i64
      %2551 = func.call @cc_intern(%2547, %2550) : (i64, i64) -> i64
      %2552 = func.call @cc_nil_value() : () -> i64
      %2553 = func.call @cc_cons(%2551, %2552) : (i64, i64) -> i64
      %2554 = func.call @cc_values_pack(%2553) : (i64) -> i64
      %2555 = func.call @cc_set_symbol_value(%2551, %2544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2544) : (i64) -> ()
      %2556 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2556 : i64
    }
    %2557 = func.call @cc_nil_value() : () -> i64
    %2558 = func.call @cc_errorp(%2541) : (i64) -> i64
    %2559 = arith.cmpi ne, %2558, %2557 : i64
    %2560 = scf.if %2559 -> (i64) {
      scf.yield %2541 : i64
    } else {
      %2561 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2562 = func.call @cc_make_function_ref_const(%2561) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2562) : (i64) -> ()
      %2563 = func.call @stack_pop_pointer() : () -> i64
      %2564 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2565 = arith.constant 9 : i64
      %2566 = func.call @cc_make_string(%2564, %2565) : (!llvm.ptr, i64) -> i64
      %2567 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2568 = arith.constant 15 : i64
      %2569 = func.call @cc_make_string(%2567, %2568) : (!llvm.ptr, i64) -> i64
      %2570 = func.call @cc_intern(%2566, %2569) : (i64, i64) -> i64
      %2571 = func.call @cc_nil_value() : () -> i64
      %2572 = func.call @cc_cons(%2570, %2571) : (i64, i64) -> i64
      %2573 = func.call @cc_values_pack(%2572) : (i64) -> i64
      %2574 = func.call @cc_set_symbol_value(%2570, %2563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2563) : (i64) -> ()
      %2575 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2575 : i64
    }
    %2576 = func.call @cc_nil_value() : () -> i64
    %2577 = func.call @cc_errorp(%2560) : (i64) -> i64
    %2578 = arith.cmpi ne, %2577, %2576 : i64
    %2579 = scf.if %2578 -> (i64) {
      scf.yield %2560 : i64
    } else {
      %2580 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2581 = func.call @cc_make_function_ref_const(%2580) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2581) : (i64) -> ()
      %2582 = func.call @stack_pop_pointer() : () -> i64
      %2583 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2584 = arith.constant 9 : i64
      %2585 = func.call @cc_make_string(%2583, %2584) : (!llvm.ptr, i64) -> i64
      %2586 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2587 = arith.constant 15 : i64
      %2588 = func.call @cc_make_string(%2586, %2587) : (!llvm.ptr, i64) -> i64
      %2589 = func.call @cc_intern(%2585, %2588) : (i64, i64) -> i64
      %2590 = func.call @cc_nil_value() : () -> i64
      %2591 = func.call @cc_cons(%2589, %2590) : (i64, i64) -> i64
      %2592 = func.call @cc_values_pack(%2591) : (i64) -> i64
      %2593 = func.call @cc_set_symbol_value(%2589, %2582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2582) : (i64) -> ()
      %2594 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2594 : i64
    }
    %2595 = func.call @cc_nil_value() : () -> i64
    %2596 = func.call @cc_errorp(%2579) : (i64) -> i64
    %2597 = arith.cmpi ne, %2596, %2595 : i64
    %2598 = scf.if %2597 -> (i64) {
      scf.yield %2579 : i64
    } else {
      %2599 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2600 = func.call @cc_make_function_ref_const(%2599) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2600) : (i64) -> ()
      %2601 = func.call @stack_pop_pointer() : () -> i64
      %2602 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2603 = arith.constant 9 : i64
      %2604 = func.call @cc_make_string(%2602, %2603) : (!llvm.ptr, i64) -> i64
      %2605 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2606 = arith.constant 15 : i64
      %2607 = func.call @cc_make_string(%2605, %2606) : (!llvm.ptr, i64) -> i64
      %2608 = func.call @cc_intern(%2604, %2607) : (i64, i64) -> i64
      %2609 = func.call @cc_nil_value() : () -> i64
      %2610 = func.call @cc_cons(%2608, %2609) : (i64, i64) -> i64
      %2611 = func.call @cc_values_pack(%2610) : (i64) -> i64
      %2612 = func.call @cc_set_symbol_value(%2608, %2601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2601) : (i64) -> ()
      %2613 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2613 : i64
    }
    %2614 = func.call @cc_nil_value() : () -> i64
    %2615 = func.call @cc_errorp(%2598) : (i64) -> i64
    %2616 = arith.cmpi ne, %2615, %2614 : i64
    %2617 = scf.if %2616 -> (i64) {
      scf.yield %2598 : i64
    } else {
      %2618 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2619 = func.call @cc_make_function_ref_const(%2618) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2619) : (i64) -> ()
      %2620 = func.call @stack_pop_pointer() : () -> i64
      %2621 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2622 = arith.constant 9 : i64
      %2623 = func.call @cc_make_string(%2621, %2622) : (!llvm.ptr, i64) -> i64
      %2624 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2625 = arith.constant 15 : i64
      %2626 = func.call @cc_make_string(%2624, %2625) : (!llvm.ptr, i64) -> i64
      %2627 = func.call @cc_intern(%2623, %2626) : (i64, i64) -> i64
      %2628 = func.call @cc_nil_value() : () -> i64
      %2629 = func.call @cc_cons(%2627, %2628) : (i64, i64) -> i64
      %2630 = func.call @cc_values_pack(%2629) : (i64) -> i64
      %2631 = func.call @cc_set_symbol_value(%2627, %2620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2620) : (i64) -> ()
      %2632 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2632 : i64
    }
    %2633 = func.call @cc_nil_value() : () -> i64
    %2634 = func.call @cc_errorp(%2617) : (i64) -> i64
    %2635 = arith.cmpi ne, %2634, %2633 : i64
    %2636 = scf.if %2635 -> (i64) {
      scf.yield %2617 : i64
    } else {
      %2637 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2638 = arith.constant 16 : i64
      %2639 = func.call @cc_make_string(%2637, %2638) : (!llvm.ptr, i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_intern(%2639, %2640) : (i64, i64) -> i64
      %2642 = func.call @cc_nil_value() : () -> i64
      %2643 = func.call @cc_cons(%2641, %2642) : (i64, i64) -> i64
      %2644 = func.call @cc_values_pack(%2643) : (i64) -> i64
      func.call @stack_push_pointer(%2641) : (i64) -> ()
      %2645 = func.call @stack_pop_pointer() : () -> i64
      %2646 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2647 = arith.constant 3 : i64
      %2648 = func.call @cc_make_string(%2646, %2647) : (!llvm.ptr, i64) -> i64
      %2649 = func.call @cc_nil_value() : () -> i64
      %2650 = func.call @cc_intern(%2648, %2649) : (i64, i64) -> i64
      %2651 = func.call @cc_nil_value() : () -> i64
      %2652 = func.call @cc_cons(%2650, %2651) : (i64, i64) -> i64
      %2653 = func.call @cc_values_pack(%2652) : (i64) -> i64
      func.call @stack_push_pointer(%2650) : (i64) -> ()
      %2654 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2655 = arith.constant 3 : i64
      %2656 = func.call @cc_make_string(%2654, %2655) : (!llvm.ptr, i64) -> i64
      %2657 = func.call @cc_nil_value() : () -> i64
      %2658 = func.call @cc_intern(%2656, %2657) : (i64, i64) -> i64
      %2659 = func.call @cc_nil_value() : () -> i64
      %2660 = func.call @cc_cons(%2658, %2659) : (i64, i64) -> i64
      %2661 = func.call @cc_values_pack(%2660) : (i64) -> i64
      func.call @stack_push_pointer(%2658) : (i64) -> ()
      %2662 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2663 = arith.constant 16 : i64
      %2664 = func.call @cc_make_string(%2662, %2663) : (!llvm.ptr, i64) -> i64
      %2665 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2666 = arith.constant 3 : i64
      %2667 = func.call @cc_make_string(%2665, %2666) : (!llvm.ptr, i64) -> i64
      %2668 = func.call @cc_intern(%2664, %2667) : (i64, i64) -> i64
      %2669 = func.call @cc_nil_value() : () -> i64
      %2670 = func.call @cc_cons(%2668, %2669) : (i64, i64) -> i64
      %2671 = func.call @cc_values_pack(%2670) : (i64) -> i64
      func.call @stack_push_pointer(%2668) : (i64) -> ()
      %2672 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2673 = arith.constant 23 : i64
      %2674 = func.call @cc_make_string(%2672, %2673) : (!llvm.ptr, i64) -> i64
      %2675 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2676 = arith.constant 3 : i64
      %2677 = func.call @cc_make_string(%2675, %2676) : (!llvm.ptr, i64) -> i64
      %2678 = func.call @cc_intern(%2674, %2677) : (i64, i64) -> i64
      %2679 = func.call @cc_nil_value() : () -> i64
      %2680 = func.call @cc_cons(%2678, %2679) : (i64, i64) -> i64
      %2681 = func.call @cc_values_pack(%2680) : (i64) -> i64
      func.call @stack_push_pointer(%2678) : (i64) -> ()
      %2682 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2683 = arith.constant 8 : i64
      %2684 = func.call @cc_make_string(%2682, %2683) : (!llvm.ptr, i64) -> i64
      %2685 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2686 = arith.constant 7 : i64
      %2687 = func.call @cc_make_string(%2685, %2686) : (!llvm.ptr, i64) -> i64
      %2688 = func.call @cc_intern(%2684, %2687) : (i64, i64) -> i64
      %2689 = func.call @cc_nil_value() : () -> i64
      %2690 = func.call @cc_cons(%2688, %2689) : (i64, i64) -> i64
      %2691 = func.call @cc_values_pack(%2690) : (i64) -> i64
      func.call @stack_push_pointer(%2688) : (i64) -> ()
      %2692 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2693 = arith.constant 7 : i64
      %2694 = func.call @cc_make_string(%2692, %2693) : (!llvm.ptr, i64) -> i64
      %2695 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2696 = arith.constant 7 : i64
      %2697 = func.call @cc_make_string(%2695, %2696) : (!llvm.ptr, i64) -> i64
      %2698 = func.call @cc_intern(%2694, %2697) : (i64, i64) -> i64
      %2699 = func.call @cc_nil_value() : () -> i64
      %2700 = func.call @cc_cons(%2698, %2699) : (i64, i64) -> i64
      %2701 = func.call @cc_values_pack(%2700) : (i64) -> i64
      func.call @stack_push_pointer(%2698) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2702 = func.call @stack_pop_pointer() : () -> i64
      %2703 = func.call @stack_pop_pointer() : () -> i64
      %2704 = func.call @cc_cons(%2703, %2702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2704) : (i64) -> ()
      %2705 = func.call @stack_pop_pointer() : () -> i64
      %2706 = func.call @stack_pop_pointer() : () -> i64
      %2707 = func.call @cc_cons(%2706, %2705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2707) : (i64) -> ()
      %2708 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2709 = arith.constant 3 : i64
      %2710 = func.call @cc_make_string(%2708, %2709) : (!llvm.ptr, i64) -> i64
      %2711 = func.call @cc_nil_value() : () -> i64
      %2712 = func.call @cc_intern(%2710, %2711) : (i64, i64) -> i64
      %2713 = func.call @cc_nil_value() : () -> i64
      %2714 = func.call @cc_cons(%2712, %2713) : (i64, i64) -> i64
      %2715 = func.call @cc_values_pack(%2714) : (i64) -> i64
      func.call @stack_push_pointer(%2712) : (i64) -> ()
      %2716 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2717 = arith.constant 1 : i64
      %2718 = func.call @cc_make_string(%2716, %2717) : (!llvm.ptr, i64) -> i64
      %2719 = func.call @cc_nil_value() : () -> i64
      %2720 = func.call @cc_intern(%2718, %2719) : (i64, i64) -> i64
      %2721 = func.call @cc_nil_value() : () -> i64
      %2722 = func.call @cc_cons(%2720, %2721) : (i64, i64) -> i64
      %2723 = func.call @cc_values_pack(%2722) : (i64) -> i64
      func.call @stack_push_pointer(%2720) : (i64) -> ()
      %2724 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2725 = arith.constant 6 : i64
      %2726 = func.call @cc_make_string(%2724, %2725) : (!llvm.ptr, i64) -> i64
      %2727 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2728 = arith.constant 11 : i64
      %2729 = func.call @cc_make_string(%2727, %2728) : (!llvm.ptr, i64) -> i64
      %2730 = func.call @cc_intern(%2726, %2729) : (i64, i64) -> i64
      %2731 = func.call @cc_nil_value() : () -> i64
      %2732 = func.call @cc_cons(%2730, %2731) : (i64, i64) -> i64
      %2733 = func.call @cc_values_pack(%2732) : (i64) -> i64
      func.call @stack_push_pointer(%2730) : (i64) -> ()
      %2734 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2734) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @stack_pop_pointer() : () -> i64
      %2737 = func.call @cc_cons(%2736, %2735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2737) : (i64) -> ()
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @stack_pop_pointer() : () -> i64
      %2740 = func.call @cc_cons(%2739, %2738) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2740) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2741 = func.call @stack_pop_pointer() : () -> i64
      %2742 = func.call @stack_pop_pointer() : () -> i64
      %2743 = func.call @cc_cons(%2742, %2741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2743) : (i64) -> ()
      %2744 = func.call @stack_pop_pointer() : () -> i64
      %2745 = func.call @stack_pop_pointer() : () -> i64
      %2746 = func.call @cc_cons(%2745, %2744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2746) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2747 = func.call @stack_pop_pointer() : () -> i64
      %2748 = func.call @stack_pop_pointer() : () -> i64
      %2749 = func.call @cc_cons(%2748, %2747) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2749) : (i64) -> ()
      %2750 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2751 = arith.constant 1 : i64
      %2752 = func.call @cc_make_string(%2750, %2751) : (!llvm.ptr, i64) -> i64
      %2753 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2754 = arith.constant 11 : i64
      %2755 = func.call @cc_make_string(%2753, %2754) : (!llvm.ptr, i64) -> i64
      %2756 = func.call @cc_intern(%2752, %2755) : (i64, i64) -> i64
      %2757 = func.call @cc_nil_value() : () -> i64
      %2758 = func.call @cc_cons(%2756, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_values_pack(%2758) : (i64) -> i64
      func.call @stack_push_pointer(%2756) : (i64) -> ()
      %2760 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2761 = arith.constant 9 : i64
      %2762 = func.call @cc_make_string(%2760, %2761) : (!llvm.ptr, i64) -> i64
      %2763 = func.call @cc_nil_value() : () -> i64
      %2764 = func.call @cc_intern(%2762, %2763) : (i64, i64) -> i64
      %2765 = func.call @cc_nil_value() : () -> i64
      %2766 = func.call @cc_cons(%2764, %2765) : (i64, i64) -> i64
      %2767 = func.call @cc_values_pack(%2766) : (i64) -> i64
      func.call @stack_push_pointer(%2764) : (i64) -> ()
      %2768 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2769 = arith.constant 1 : i64
      %2770 = func.call @cc_make_string(%2768, %2769) : (!llvm.ptr, i64) -> i64
      %2771 = func.call @cc_nil_value() : () -> i64
      %2772 = func.call @cc_intern(%2770, %2771) : (i64, i64) -> i64
      %2773 = func.call @cc_nil_value() : () -> i64
      %2774 = func.call @cc_cons(%2772, %2773) : (i64, i64) -> i64
      %2775 = func.call @cc_values_pack(%2774) : (i64) -> i64
      func.call @stack_push_pointer(%2772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @stack_pop_pointer() : () -> i64
      %2778 = func.call @cc_cons(%2777, %2776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2778) : (i64) -> ()
      %2779 = func.call @stack_pop_pointer() : () -> i64
      %2780 = func.call @stack_pop_pointer() : () -> i64
      %2781 = func.call @cc_cons(%2780, %2779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2781) : (i64) -> ()
      %2782 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2783 = arith.constant 9 : i64
      %2784 = func.call @cc_make_string(%2782, %2783) : (!llvm.ptr, i64) -> i64
      %2785 = func.call @cc_nil_value() : () -> i64
      %2786 = func.call @cc_intern(%2784, %2785) : (i64, i64) -> i64
      %2787 = func.call @cc_nil_value() : () -> i64
      %2788 = func.call @cc_cons(%2786, %2787) : (i64, i64) -> i64
      %2789 = func.call @cc_values_pack(%2788) : (i64) -> i64
      func.call @stack_push_pointer(%2786) : (i64) -> ()
      %2790 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2791 = arith.constant 1 : i64
      %2792 = func.call @cc_make_string(%2790, %2791) : (!llvm.ptr, i64) -> i64
      %2793 = func.call @cc_nil_value() : () -> i64
      %2794 = func.call @cc_intern(%2792, %2793) : (i64, i64) -> i64
      %2795 = func.call @cc_nil_value() : () -> i64
      %2796 = func.call @cc_cons(%2794, %2795) : (i64, i64) -> i64
      %2797 = func.call @cc_values_pack(%2796) : (i64) -> i64
      func.call @stack_push_pointer(%2794) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2798 = func.call @stack_pop_pointer() : () -> i64
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @cc_cons(%2799, %2798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2800) : (i64) -> ()
      %2801 = func.call @stack_pop_pointer() : () -> i64
      %2802 = func.call @stack_pop_pointer() : () -> i64
      %2803 = func.call @cc_cons(%2802, %2801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2803) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2804 = func.call @stack_pop_pointer() : () -> i64
      %2805 = func.call @stack_pop_pointer() : () -> i64
      %2806 = func.call @cc_cons(%2805, %2804) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2806) : (i64) -> ()
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
      %2816 = func.call @stack_pop_pointer() : () -> i64
      %2817 = func.call @stack_pop_pointer() : () -> i64
      %2818 = func.call @cc_cons(%2817, %2816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2818) : (i64) -> ()
      %2819 = func.call @stack_pop_pointer() : () -> i64
      %2820 = func.call @stack_pop_pointer() : () -> i64
      %2821 = func.call @cc_cons(%2820, %2819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2821) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2822 = func.call @stack_pop_pointer() : () -> i64
      %2823 = func.call @stack_pop_pointer() : () -> i64
      %2824 = func.call @cc_cons(%2823, %2822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2824) : (i64) -> ()
      %2825 = func.call @stack_pop_pointer() : () -> i64
      %2826 = func.call @stack_pop_pointer() : () -> i64
      %2827 = func.call @cc_cons(%2826, %2825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2827) : (i64) -> ()
      %2828 = func.call @stack_pop_pointer() : () -> i64
      %2829 = func.call @stack_pop_pointer() : () -> i64
      %2830 = func.call @cc_cons(%2829, %2828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2830) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2831 = func.call @stack_pop_pointer() : () -> i64
      %2832 = func.call @stack_pop_pointer() : () -> i64
      %2833 = func.call @cc_cons(%2832, %2831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2833) : (i64) -> ()
      %2834 = func.call @stack_pop_pointer() : () -> i64
      %2835 = func.call @stack_pop_pointer() : () -> i64
      %2836 = func.call @cc_cons(%2835, %2834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2836) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2837 = func.call @stack_pop_pointer() : () -> i64
      %2838 = func.call @stack_pop_pointer() : () -> i64
      %2839 = func.call @cc_cons(%2838, %2837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2839) : (i64) -> ()
      %2840 = func.call @stack_pop_pointer() : () -> i64
      %2841 = func.call @stack_pop_pointer() : () -> i64
      %2842 = func.call @cc_cons(%2841, %2840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2842) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2843 = func.call @stack_pop_pointer() : () -> i64
      %2844 = func.call @stack_pop_pointer() : () -> i64
      %2845 = func.call @cc_cons(%2844, %2843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2845) : (i64) -> ()
      %2846 = func.call @stack_pop_pointer() : () -> i64
      %2847 = func.call @stack_pop_pointer() : () -> i64
      %2848 = func.call @cc_cons(%2847, %2846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2848) : (i64) -> ()
      %2849 = func.call @stack_pop_pointer() : () -> i64
      %2963 = arith.constant 152926823645207 : i64
      %2964 = arith.constant 0 : i64
      %2965 = func.call @cc_make_closure(%2963, %2964) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2965) : (i64) -> ()
      %2966 = func.call @stack_pop_pointer() : () -> i64
      %2967 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2968 = arith.constant 1 : i64
      %2969 = func.call @cc_make_string(%2967, %2968) : (!llvm.ptr, i64) -> i64
      %2970 = func.call @cc_nil_value() : () -> i64
      %2971 = func.call @cc_intern(%2969, %2970) : (i64, i64) -> i64
      %2972 = func.call @cc_nil_value() : () -> i64
      %2973 = func.call @cc_cons(%2971, %2972) : (i64, i64) -> i64
      %2974 = func.call @cc_values_pack(%2973) : (i64) -> i64
      func.call @stack_push_pointer(%2971) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @stack_pop_pointer() : () -> i64
      %2977 = func.call @cc_cons(%2976, %2975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2977) : (i64) -> ()
      %2978 = func.call @stack_pop_pointer() : () -> i64
      %2979 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2980 = arith.constant 11 : i64
      %2981 = func.call @cc_make_string(%2979, %2980) : (!llvm.ptr, i64) -> i64
      %2982 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2983 = arith.constant 7 : i64
      %2984 = func.call @cc_make_string(%2982, %2983) : (!llvm.ptr, i64) -> i64
      %2985 = func.call @cc_intern(%2981, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_nil_value() : () -> i64
      %2987 = func.call @cc_cons(%2985, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_values_pack(%2987) : (i64) -> i64
      func.call @stack_push_pointer(%2985) : (i64) -> ()
      %2989 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2990 = func.call @stack_pop_pointer() : () -> i64
      %2991 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2992 = arith.constant 4 : i64
      %2993 = func.call @cc_make_string(%2991, %2992) : (!llvm.ptr, i64) -> i64
      %2994 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2995 = arith.constant 7 : i64
      %2996 = func.call @cc_make_string(%2994, %2995) : (!llvm.ptr, i64) -> i64
      %2997 = func.call @cc_intern(%2993, %2996) : (i64, i64) -> i64
      %2998 = func.call @cc_nil_value() : () -> i64
      %2999 = func.call @cc_cons(%2997, %2998) : (i64, i64) -> i64
      %3000 = func.call @cc_values_pack(%2999) : (i64) -> i64
      func.call @stack_push_pointer(%2997) : (i64) -> ()
      %3001 = func.call @stack_pop_pointer() : () -> i64
      %3002 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3003 = arith.constant 6 : i64
      %3004 = func.call @cc_make_string(%3002, %3003) : (!llvm.ptr, i64) -> i64
      %3005 = func.call @cc_nil_value() : () -> i64
      %3006 = func.call @cc_intern(%3004, %3005) : (i64, i64) -> i64
      %3007 = func.call @cc_nil_value() : () -> i64
      %3008 = func.call @cc_cons(%3006, %3007) : (i64, i64) -> i64
      %3009 = func.call @cc_values_pack(%3008) : (i64) -> i64
      func.call @stack_push_pointer(%3006) : (i64) -> ()
      %3010 = func.call @stack_pop_pointer() : () -> i64
      %3011 = func.call @cc_nil_value() : () -> i64
      %3012 = func.call @cc_errorp(%2645) : (i64) -> i64
      %3013 = arith.cmpi ne, %3012, %3011 : i64
      %3014 = arith.cmpi eq, %3011, %3011 : i64
      %3015 = arith.andi %3013, %3014 : i1
      %3016 = scf.if %3015 -> (i64) {
        scf.yield %2645 : i64
      } else {
        scf.yield %3011 : i64
      }
      %3017 = func.call @cc_errorp(%2849) : (i64) -> i64
      %3018 = arith.cmpi ne, %3017, %3011 : i64
      %3019 = arith.cmpi eq, %3016, %3011 : i64
      %3020 = arith.andi %3018, %3019 : i1
      %3021 = scf.if %3020 -> (i64) {
        scf.yield %2849 : i64
      } else {
        scf.yield %3016 : i64
      }
      %3022 = func.call @cc_errorp(%2966) : (i64) -> i64
      %3023 = arith.cmpi ne, %3022, %3011 : i64
      %3024 = arith.cmpi eq, %3021, %3011 : i64
      %3025 = arith.andi %3023, %3024 : i1
      %3026 = scf.if %3025 -> (i64) {
        scf.yield %2966 : i64
      } else {
        scf.yield %3021 : i64
      }
      %3027 = func.call @cc_errorp(%2978) : (i64) -> i64
      %3028 = arith.cmpi ne, %3027, %3011 : i64
      %3029 = arith.cmpi eq, %3026, %3011 : i64
      %3030 = arith.andi %3028, %3029 : i1
      %3031 = scf.if %3030 -> (i64) {
        scf.yield %2978 : i64
      } else {
        scf.yield %3026 : i64
      }
      %3032 = func.call @cc_errorp(%2989) : (i64) -> i64
      %3033 = arith.cmpi ne, %3032, %3011 : i64
      %3034 = arith.cmpi eq, %3031, %3011 : i64
      %3035 = arith.andi %3033, %3034 : i1
      %3036 = scf.if %3035 -> (i64) {
        scf.yield %2989 : i64
      } else {
        scf.yield %3031 : i64
      }
      %3037 = func.call @cc_errorp(%2990) : (i64) -> i64
      %3038 = arith.cmpi ne, %3037, %3011 : i64
      %3039 = arith.cmpi eq, %3036, %3011 : i64
      %3040 = arith.andi %3038, %3039 : i1
      %3041 = scf.if %3040 -> (i64) {
        scf.yield %2990 : i64
      } else {
        scf.yield %3036 : i64
      }
      %3042 = func.call @cc_errorp(%3001) : (i64) -> i64
      %3043 = arith.cmpi ne, %3042, %3011 : i64
      %3044 = arith.cmpi eq, %3041, %3011 : i64
      %3045 = arith.andi %3043, %3044 : i1
      %3046 = scf.if %3045 -> (i64) {
        scf.yield %3001 : i64
      } else {
        scf.yield %3041 : i64
      }
      %3047 = func.call @cc_errorp(%3010) : (i64) -> i64
      %3048 = arith.cmpi ne, %3047, %3011 : i64
      %3049 = arith.cmpi eq, %3046, %3011 : i64
      %3050 = arith.andi %3048, %3049 : i1
      %3051 = scf.if %3050 -> (i64) {
        scf.yield %3010 : i64
      } else {
        scf.yield %3046 : i64
      }
      %3052 = arith.cmpi ne, %3051, %3011 : i64
      scf.if %3052 {
        func.call @stack_push_pointer(%3051) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2645) : (i64) -> ()
        func.call @stack_push_pointer(%2849) : (i64) -> ()
        func.call @stack_push_pointer(%2966) : (i64) -> ()
        func.call @stack_push_pointer(%2978) : (i64) -> ()
        func.call @stack_push_pointer(%2989) : (i64) -> ()
        func.call @stack_push_pointer(%2990) : (i64) -> ()
        func.call @stack_push_pointer(%3001) : (i64) -> ()
        func.call @stack_push_pointer(%3010) : (i64) -> ()
        %3053 = llvm.mlir.addressof @str250 : !llvm.ptr
        %3054 = func.call @cc_make_function_ref_const(%3053) : (!llvm.ptr) -> i64
        %3055 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3054, %3055) : (i64, i64) -> ()
      }
      %3056 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3056 : i64
    }
    %3057 = func.call @cc_nil_value() : () -> i64
    %3058 = func.call @cc_errorp(%2636) : (i64) -> i64
    %3059 = arith.cmpi ne, %3058, %3057 : i64
    %3060 = scf.if %3059 -> (i64) {
      scf.yield %2636 : i64
    } else {
      %3061 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3062 = arith.constant 16 : i64
      %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
      %3064 = func.call @cc_nil_value() : () -> i64
      %3065 = func.call @cc_intern(%3063, %3064) : (i64, i64) -> i64
      %3066 = func.call @cc_nil_value() : () -> i64
      %3067 = func.call @cc_cons(%3065, %3066) : (i64, i64) -> i64
      %3068 = func.call @cc_values_pack(%3067) : (i64) -> i64
      func.call @stack_push_pointer(%3065) : (i64) -> ()
      %3069 = func.call @stack_pop_pointer() : () -> i64
      %3070 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3071 = arith.constant 13 : i64
      %3072 = func.call @cc_make_string(%3070, %3071) : (!llvm.ptr, i64) -> i64
      %3073 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3074 = arith.constant 11 : i64
      %3075 = func.call @cc_make_string(%3073, %3074) : (!llvm.ptr, i64) -> i64
      %3076 = func.call @cc_intern(%3072, %3075) : (i64, i64) -> i64
      %3077 = func.call @cc_nil_value() : () -> i64
      %3078 = func.call @cc_cons(%3076, %3077) : (i64, i64) -> i64
      %3079 = func.call @cc_values_pack(%3078) : (i64) -> i64
      func.call @stack_push_pointer(%3076) : (i64) -> ()
      %3080 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3081 = arith.constant 6 : i64
      %3082 = func.call @cc_make_string(%3080, %3081) : (!llvm.ptr, i64) -> i64
      %3083 = func.call @cc_nil_value() : () -> i64
      %3084 = func.call @cc_intern(%3082, %3083) : (i64, i64) -> i64
      %3085 = func.call @cc_nil_value() : () -> i64
      %3086 = func.call @cc_cons(%3084, %3085) : (i64, i64) -> i64
      %3087 = func.call @cc_values_pack(%3086) : (i64) -> i64
      func.call @stack_push_pointer(%3084) : (i64) -> ()
      %3088 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3089 = arith.constant 19 : i64
      %3090 = func.call @cc_make_string(%3088, %3089) : (!llvm.ptr, i64) -> i64
      %3091 = func.call @cc_nil_value() : () -> i64
      %3092 = func.call @cc_intern(%3090, %3091) : (i64, i64) -> i64
      %3093 = func.call @cc_nil_value() : () -> i64
      %3094 = func.call @cc_cons(%3092, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_values_pack(%3094) : (i64) -> i64
      func.call @stack_push_pointer(%3092) : (i64) -> ()
      %3096 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3097 = arith.constant 3 : i64
      %3098 = func.call @cc_make_string(%3096, %3097) : (!llvm.ptr, i64) -> i64
      %3099 = func.call @cc_nil_value() : () -> i64
      %3100 = func.call @cc_intern(%3098, %3099) : (i64, i64) -> i64
      %3101 = func.call @cc_nil_value() : () -> i64
      %3102 = func.call @cc_cons(%3100, %3101) : (i64, i64) -> i64
      %3103 = func.call @cc_values_pack(%3102) : (i64) -> i64
      func.call @stack_push_pointer(%3100) : (i64) -> ()
      %3104 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3105 = arith.constant 1 : i64
      %3106 = func.call @cc_make_string(%3104, %3105) : (!llvm.ptr, i64) -> i64
      %3107 = func.call @cc_nil_value() : () -> i64
      %3108 = func.call @cc_intern(%3106, %3107) : (i64, i64) -> i64
      %3109 = func.call @cc_nil_value() : () -> i64
      %3110 = func.call @cc_cons(%3108, %3109) : (i64, i64) -> i64
      %3111 = func.call @cc_values_pack(%3110) : (i64) -> i64
      func.call @stack_push_pointer(%3108) : (i64) -> ()
      %3112 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3113 = arith.constant 6 : i64
      %3114 = func.call @cc_make_string(%3112, %3113) : (!llvm.ptr, i64) -> i64
      %3115 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3116 = arith.constant 11 : i64
      %3117 = func.call @cc_make_string(%3115, %3116) : (!llvm.ptr, i64) -> i64
      %3118 = func.call @cc_intern(%3114, %3117) : (i64, i64) -> i64
      %3119 = func.call @cc_nil_value() : () -> i64
      %3120 = func.call @cc_cons(%3118, %3119) : (i64, i64) -> i64
      %3121 = func.call @cc_values_pack(%3120) : (i64) -> i64
      func.call @stack_push_pointer(%3118) : (i64) -> ()
      %3122 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%3122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3123 = func.call @stack_pop_pointer() : () -> i64
      %3124 = func.call @stack_pop_pointer() : () -> i64
      %3125 = func.call @cc_cons(%3124, %3123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3125) : (i64) -> ()
      %3126 = func.call @stack_pop_pointer() : () -> i64
      %3127 = func.call @stack_pop_pointer() : () -> i64
      %3128 = func.call @cc_cons(%3127, %3126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3129 = func.call @stack_pop_pointer() : () -> i64
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @cc_cons(%3130, %3129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3131) : (i64) -> ()
      %3132 = func.call @stack_pop_pointer() : () -> i64
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = func.call @cc_cons(%3133, %3132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3134) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3135 = func.call @stack_pop_pointer() : () -> i64
      %3136 = func.call @stack_pop_pointer() : () -> i64
      %3137 = func.call @cc_cons(%3136, %3135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3137) : (i64) -> ()
      %3138 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3139 = arith.constant 1 : i64
      %3140 = func.call @cc_make_string(%3138, %3139) : (!llvm.ptr, i64) -> i64
      %3141 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3142 = arith.constant 11 : i64
      %3143 = func.call @cc_make_string(%3141, %3142) : (!llvm.ptr, i64) -> i64
      %3144 = func.call @cc_intern(%3140, %3143) : (i64, i64) -> i64
      %3145 = func.call @cc_nil_value() : () -> i64
      %3146 = func.call @cc_cons(%3144, %3145) : (i64, i64) -> i64
      %3147 = func.call @cc_values_pack(%3146) : (i64) -> i64
      func.call @stack_push_pointer(%3144) : (i64) -> ()
      %3148 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3149 = arith.constant 9 : i64
      %3150 = func.call @cc_make_string(%3148, %3149) : (!llvm.ptr, i64) -> i64
      %3151 = func.call @cc_nil_value() : () -> i64
      %3152 = func.call @cc_intern(%3150, %3151) : (i64, i64) -> i64
      %3153 = func.call @cc_nil_value() : () -> i64
      %3154 = func.call @cc_cons(%3152, %3153) : (i64, i64) -> i64
      %3155 = func.call @cc_values_pack(%3154) : (i64) -> i64
      func.call @stack_push_pointer(%3152) : (i64) -> ()
      %3156 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3157 = arith.constant 1 : i64
      %3158 = func.call @cc_make_string(%3156, %3157) : (!llvm.ptr, i64) -> i64
      %3159 = func.call @cc_nil_value() : () -> i64
      %3160 = func.call @cc_intern(%3158, %3159) : (i64, i64) -> i64
      %3161 = func.call @cc_nil_value() : () -> i64
      %3162 = func.call @cc_cons(%3160, %3161) : (i64, i64) -> i64
      %3163 = func.call @cc_values_pack(%3162) : (i64) -> i64
      func.call @stack_push_pointer(%3160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3164 = func.call @stack_pop_pointer() : () -> i64
      %3165 = func.call @stack_pop_pointer() : () -> i64
      %3166 = func.call @cc_cons(%3165, %3164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3166) : (i64) -> ()
      %3167 = func.call @stack_pop_pointer() : () -> i64
      %3168 = func.call @stack_pop_pointer() : () -> i64
      %3169 = func.call @cc_cons(%3168, %3167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3169) : (i64) -> ()
      %3170 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3171 = arith.constant 9 : i64
      %3172 = func.call @cc_make_string(%3170, %3171) : (!llvm.ptr, i64) -> i64
      %3173 = func.call @cc_nil_value() : () -> i64
      %3174 = func.call @cc_intern(%3172, %3173) : (i64, i64) -> i64
      %3175 = func.call @cc_nil_value() : () -> i64
      %3176 = func.call @cc_cons(%3174, %3175) : (i64, i64) -> i64
      %3177 = func.call @cc_values_pack(%3176) : (i64) -> i64
      func.call @stack_push_pointer(%3174) : (i64) -> ()
      %3178 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3179 = arith.constant 1 : i64
      %3180 = func.call @cc_make_string(%3178, %3179) : (!llvm.ptr, i64) -> i64
      %3181 = func.call @cc_nil_value() : () -> i64
      %3182 = func.call @cc_intern(%3180, %3181) : (i64, i64) -> i64
      %3183 = func.call @cc_nil_value() : () -> i64
      %3184 = func.call @cc_cons(%3182, %3183) : (i64, i64) -> i64
      %3185 = func.call @cc_values_pack(%3184) : (i64) -> i64
      func.call @stack_push_pointer(%3182) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3186 = func.call @stack_pop_pointer() : () -> i64
      %3187 = func.call @stack_pop_pointer() : () -> i64
      %3188 = func.call @cc_cons(%3187, %3186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3188) : (i64) -> ()
      %3189 = func.call @stack_pop_pointer() : () -> i64
      %3190 = func.call @stack_pop_pointer() : () -> i64
      %3191 = func.call @cc_cons(%3190, %3189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3191) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3192 = func.call @stack_pop_pointer() : () -> i64
      %3193 = func.call @stack_pop_pointer() : () -> i64
      %3194 = func.call @cc_cons(%3193, %3192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3194) : (i64) -> ()
      %3195 = func.call @stack_pop_pointer() : () -> i64
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @cc_cons(%3196, %3195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3197) : (i64) -> ()
      %3198 = func.call @stack_pop_pointer() : () -> i64
      %3199 = func.call @stack_pop_pointer() : () -> i64
      %3200 = func.call @cc_cons(%3199, %3198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3200) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3201 = func.call @stack_pop_pointer() : () -> i64
      %3202 = func.call @stack_pop_pointer() : () -> i64
      %3203 = func.call @cc_cons(%3202, %3201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3203) : (i64) -> ()
      %3204 = func.call @stack_pop_pointer() : () -> i64
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @cc_cons(%3205, %3204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3206) : (i64) -> ()
      %3207 = func.call @stack_pop_pointer() : () -> i64
      %3208 = func.call @stack_pop_pointer() : () -> i64
      %3209 = func.call @cc_cons(%3208, %3207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3209) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3210 = func.call @stack_pop_pointer() : () -> i64
      %3211 = func.call @stack_pop_pointer() : () -> i64
      %3212 = func.call @cc_cons(%3211, %3210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3212) : (i64) -> ()
      %3213 = func.call @stack_pop_pointer() : () -> i64
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @cc_cons(%3214, %3213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @stack_pop_pointer() : () -> i64
      %3218 = func.call @cc_cons(%3217, %3216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3218) : (i64) -> ()
      %3219 = func.call @stack_pop_pointer() : () -> i64
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @cc_cons(%3220, %3219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3221) : (i64) -> ()
      %3222 = func.call @stack_pop_pointer() : () -> i64
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @cc_cons(%3223, %3222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3224) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3225 = func.call @stack_pop_pointer() : () -> i64
      %3226 = func.call @stack_pop_pointer() : () -> i64
      %3227 = func.call @cc_cons(%3226, %3225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3227) : (i64) -> ()
      %3228 = func.call @stack_pop_pointer() : () -> i64
      %3229 = func.call @stack_pop_pointer() : () -> i64
      %3230 = func.call @cc_cons(%3229, %3228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3230) : (i64) -> ()
      %3231 = func.call @stack_pop_pointer() : () -> i64
      %3334 = arith.constant 152926823645208 : i64
      %3335 = arith.constant 0 : i64
      %3336 = func.call @cc_make_closure(%3334, %3335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3336) : (i64) -> ()
      %3337 = func.call @stack_pop_pointer() : () -> i64
      %3338 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3339 = arith.constant 4 : i64
      %3340 = func.call @cc_make_string(%3338, %3339) : (!llvm.ptr, i64) -> i64
      %3341 = func.call @cc_nil_value() : () -> i64
      %3342 = func.call @cc_intern(%3340, %3341) : (i64, i64) -> i64
      %3343 = func.call @cc_nil_value() : () -> i64
      %3344 = func.call @cc_cons(%3342, %3343) : (i64, i64) -> i64
      %3345 = func.call @cc_values_pack(%3344) : (i64) -> i64
      func.call @stack_push_pointer(%3342) : (i64) -> ()
      %3346 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3347 = arith.constant 23 : i64
      %3348 = func.call @cc_make_string(%3346, %3347) : (!llvm.ptr, i64) -> i64
      %3349 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3350 = arith.constant 11 : i64
      %3351 = func.call @cc_make_string(%3349, %3350) : (!llvm.ptr, i64) -> i64
      %3352 = func.call @cc_intern(%3348, %3351) : (i64, i64) -> i64
      %3353 = func.call @cc_nil_value() : () -> i64
      %3354 = func.call @cc_cons(%3352, %3353) : (i64, i64) -> i64
      %3355 = func.call @cc_values_pack(%3354) : (i64) -> i64
      func.call @stack_push_pointer(%3352) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3356 = func.call @stack_pop_pointer() : () -> i64
      %3357 = func.call @stack_pop_pointer() : () -> i64
      %3358 = func.call @cc_cons(%3357, %3356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3358) : (i64) -> ()
      %3359 = func.call @stack_pop_pointer() : () -> i64
      %3360 = func.call @stack_pop_pointer() : () -> i64
      %3361 = func.call @cc_cons(%3360, %3359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3361) : (i64) -> ()
      %3362 = func.call @stack_pop_pointer() : () -> i64
      %3363 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3364 = arith.constant 11 : i64
      %3365 = func.call @cc_make_string(%3363, %3364) : (!llvm.ptr, i64) -> i64
      %3366 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3367 = arith.constant 7 : i64
      %3368 = func.call @cc_make_string(%3366, %3367) : (!llvm.ptr, i64) -> i64
      %3369 = func.call @cc_intern(%3365, %3368) : (i64, i64) -> i64
      %3370 = func.call @cc_nil_value() : () -> i64
      %3371 = func.call @cc_cons(%3369, %3370) : (i64, i64) -> i64
      %3372 = func.call @cc_values_pack(%3371) : (i64) -> i64
      func.call @stack_push_pointer(%3369) : (i64) -> ()
      %3373 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3374 = func.call @stack_pop_pointer() : () -> i64
      %3375 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3376 = arith.constant 4 : i64
      %3377 = func.call @cc_make_string(%3375, %3376) : (!llvm.ptr, i64) -> i64
      %3378 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3379 = arith.constant 7 : i64
      %3380 = func.call @cc_make_string(%3378, %3379) : (!llvm.ptr, i64) -> i64
      %3381 = func.call @cc_intern(%3377, %3380) : (i64, i64) -> i64
      %3382 = func.call @cc_nil_value() : () -> i64
      %3383 = func.call @cc_cons(%3381, %3382) : (i64, i64) -> i64
      %3384 = func.call @cc_values_pack(%3383) : (i64) -> i64
      func.call @stack_push_pointer(%3381) : (i64) -> ()
      %3385 = func.call @stack_pop_pointer() : () -> i64
      %3386 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3387 = arith.constant 5 : i64
      %3388 = func.call @cc_make_string(%3386, %3387) : (!llvm.ptr, i64) -> i64
      %3389 = func.call @cc_nil_value() : () -> i64
      %3390 = func.call @cc_intern(%3388, %3389) : (i64, i64) -> i64
      %3391 = func.call @cc_nil_value() : () -> i64
      %3392 = func.call @cc_cons(%3390, %3391) : (i64, i64) -> i64
      %3393 = func.call @cc_values_pack(%3392) : (i64) -> i64
      func.call @stack_push_pointer(%3390) : (i64) -> ()
      %3394 = func.call @stack_pop_pointer() : () -> i64
      %3395 = func.call @cc_nil_value() : () -> i64
      %3396 = func.call @cc_errorp(%3069) : (i64) -> i64
      %3397 = arith.cmpi ne, %3396, %3395 : i64
      %3398 = arith.cmpi eq, %3395, %3395 : i64
      %3399 = arith.andi %3397, %3398 : i1
      %3400 = scf.if %3399 -> (i64) {
        scf.yield %3069 : i64
      } else {
        scf.yield %3395 : i64
      }
      %3401 = func.call @cc_errorp(%3231) : (i64) -> i64
      %3402 = arith.cmpi ne, %3401, %3395 : i64
      %3403 = arith.cmpi eq, %3400, %3395 : i64
      %3404 = arith.andi %3402, %3403 : i1
      %3405 = scf.if %3404 -> (i64) {
        scf.yield %3231 : i64
      } else {
        scf.yield %3400 : i64
      }
      %3406 = func.call @cc_errorp(%3337) : (i64) -> i64
      %3407 = arith.cmpi ne, %3406, %3395 : i64
      %3408 = arith.cmpi eq, %3405, %3395 : i64
      %3409 = arith.andi %3407, %3408 : i1
      %3410 = scf.if %3409 -> (i64) {
        scf.yield %3337 : i64
      } else {
        scf.yield %3405 : i64
      }
      %3411 = func.call @cc_errorp(%3362) : (i64) -> i64
      %3412 = arith.cmpi ne, %3411, %3395 : i64
      %3413 = arith.cmpi eq, %3410, %3395 : i64
      %3414 = arith.andi %3412, %3413 : i1
      %3415 = scf.if %3414 -> (i64) {
        scf.yield %3362 : i64
      } else {
        scf.yield %3410 : i64
      }
      %3416 = func.call @cc_errorp(%3373) : (i64) -> i64
      %3417 = arith.cmpi ne, %3416, %3395 : i64
      %3418 = arith.cmpi eq, %3415, %3395 : i64
      %3419 = arith.andi %3417, %3418 : i1
      %3420 = scf.if %3419 -> (i64) {
        scf.yield %3373 : i64
      } else {
        scf.yield %3415 : i64
      }
      %3421 = func.call @cc_errorp(%3374) : (i64) -> i64
      %3422 = arith.cmpi ne, %3421, %3395 : i64
      %3423 = arith.cmpi eq, %3420, %3395 : i64
      %3424 = arith.andi %3422, %3423 : i1
      %3425 = scf.if %3424 -> (i64) {
        scf.yield %3374 : i64
      } else {
        scf.yield %3420 : i64
      }
      %3426 = func.call @cc_errorp(%3385) : (i64) -> i64
      %3427 = arith.cmpi ne, %3426, %3395 : i64
      %3428 = arith.cmpi eq, %3425, %3395 : i64
      %3429 = arith.andi %3427, %3428 : i1
      %3430 = scf.if %3429 -> (i64) {
        scf.yield %3385 : i64
      } else {
        scf.yield %3425 : i64
      }
      %3431 = func.call @cc_errorp(%3394) : (i64) -> i64
      %3432 = arith.cmpi ne, %3431, %3395 : i64
      %3433 = arith.cmpi eq, %3430, %3395 : i64
      %3434 = arith.andi %3432, %3433 : i1
      %3435 = scf.if %3434 -> (i64) {
        scf.yield %3394 : i64
      } else {
        scf.yield %3430 : i64
      }
      %3436 = arith.cmpi ne, %3435, %3395 : i64
      scf.if %3436 {
        func.call @stack_push_pointer(%3435) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3069) : (i64) -> ()
        func.call @stack_push_pointer(%3231) : (i64) -> ()
        func.call @stack_push_pointer(%3337) : (i64) -> ()
        func.call @stack_push_pointer(%3362) : (i64) -> ()
        func.call @stack_push_pointer(%3373) : (i64) -> ()
        func.call @stack_push_pointer(%3374) : (i64) -> ()
        func.call @stack_push_pointer(%3385) : (i64) -> ()
        func.call @stack_push_pointer(%3394) : (i64) -> ()
        %3437 = llvm.mlir.addressof @str276 : !llvm.ptr
        %3438 = func.call @cc_make_function_ref_const(%3437) : (!llvm.ptr) -> i64
        %3439 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3438, %3439) : (i64, i64) -> ()
      }
      %3440 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3440 : i64
    }
    %3441 = func.call @cc_nil_value() : () -> i64
    %3442 = func.call @cc_errorp(%3060) : (i64) -> i64
    %3443 = arith.cmpi ne, %3442, %3441 : i64
    %3444 = scf.if %3443 -> (i64) {
      scf.yield %3060 : i64
    } else {
      %3445 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3446 = func.call @cc_make_function_ref_const(%3445) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3446) : (i64) -> ()
      %3447 = func.call @stack_pop_pointer() : () -> i64
      %3448 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3449 = arith.constant 9 : i64
      %3450 = func.call @cc_make_string(%3448, %3449) : (!llvm.ptr, i64) -> i64
      %3451 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3452 = arith.constant 15 : i64
      %3453 = func.call @cc_make_string(%3451, %3452) : (!llvm.ptr, i64) -> i64
      %3454 = func.call @cc_intern(%3450, %3453) : (i64, i64) -> i64
      %3455 = func.call @cc_nil_value() : () -> i64
      %3456 = func.call @cc_cons(%3454, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_values_pack(%3456) : (i64) -> i64
      %3458 = func.call @cc_set_symbol_value(%3454, %3447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3447) : (i64) -> ()
      %3459 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3459 : i64
    }
    %3460 = func.call @cc_nil_value() : () -> i64
    %3461 = func.call @cc_errorp(%3444) : (i64) -> i64
    %3462 = arith.cmpi ne, %3461, %3460 : i64
    %3463 = scf.if %3462 -> (i64) {
      scf.yield %3444 : i64
    } else {
      %3464 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3465 = func.call @cc_make_function_ref_const(%3464) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3466 = func.call @stack_pop_pointer() : () -> i64
      %3467 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3468 = arith.constant 9 : i64
      %3469 = func.call @cc_make_string(%3467, %3468) : (!llvm.ptr, i64) -> i64
      %3470 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3471 = arith.constant 15 : i64
      %3472 = func.call @cc_make_string(%3470, %3471) : (!llvm.ptr, i64) -> i64
      %3473 = func.call @cc_intern(%3469, %3472) : (i64, i64) -> i64
      %3474 = func.call @cc_nil_value() : () -> i64
      %3475 = func.call @cc_cons(%3473, %3474) : (i64, i64) -> i64
      %3476 = func.call @cc_values_pack(%3475) : (i64) -> i64
      %3477 = func.call @cc_set_symbol_value(%3473, %3466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3466) : (i64) -> ()
      %3478 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3478 : i64
    }
    %3479 = func.call @cc_nil_value() : () -> i64
    %3480 = func.call @cc_errorp(%3463) : (i64) -> i64
    %3481 = arith.cmpi ne, %3480, %3479 : i64
    %3482 = scf.if %3481 -> (i64) {
      scf.yield %3463 : i64
    } else {
      %3483 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3484 = func.call @cc_make_function_ref_const(%3483) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3484) : (i64) -> ()
      %3485 = func.call @stack_pop_pointer() : () -> i64
      %3486 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3487 = arith.constant 9 : i64
      %3488 = func.call @cc_make_string(%3486, %3487) : (!llvm.ptr, i64) -> i64
      %3489 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3490 = arith.constant 15 : i64
      %3491 = func.call @cc_make_string(%3489, %3490) : (!llvm.ptr, i64) -> i64
      %3492 = func.call @cc_intern(%3488, %3491) : (i64, i64) -> i64
      %3493 = func.call @cc_nil_value() : () -> i64
      %3494 = func.call @cc_cons(%3492, %3493) : (i64, i64) -> i64
      %3495 = func.call @cc_values_pack(%3494) : (i64) -> i64
      %3496 = func.call @cc_set_symbol_value(%3492, %3485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3485) : (i64) -> ()
      %3497 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3497 : i64
    }
    %3498 = func.call @cc_nil_value() : () -> i64
    %3499 = func.call @cc_errorp(%3482) : (i64) -> i64
    %3500 = arith.cmpi ne, %3499, %3498 : i64
    %3501 = scf.if %3500 -> (i64) {
      scf.yield %3482 : i64
    } else {
      %3502 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3503 = func.call @cc_make_function_ref_const(%3502) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3503) : (i64) -> ()
      %3504 = func.call @stack_pop_pointer() : () -> i64
      %3505 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3506 = arith.constant 9 : i64
      %3507 = func.call @cc_make_string(%3505, %3506) : (!llvm.ptr, i64) -> i64
      %3508 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3509 = arith.constant 15 : i64
      %3510 = func.call @cc_make_string(%3508, %3509) : (!llvm.ptr, i64) -> i64
      %3511 = func.call @cc_intern(%3507, %3510) : (i64, i64) -> i64
      %3512 = func.call @cc_nil_value() : () -> i64
      %3513 = func.call @cc_cons(%3511, %3512) : (i64, i64) -> i64
      %3514 = func.call @cc_values_pack(%3513) : (i64) -> i64
      %3515 = func.call @cc_set_symbol_value(%3511, %3504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3504) : (i64) -> ()
      %3516 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3516 : i64
    }
    %3517 = func.call @cc_nil_value() : () -> i64
    %3518 = func.call @cc_errorp(%3501) : (i64) -> i64
    %3519 = arith.cmpi ne, %3518, %3517 : i64
    %3520 = scf.if %3519 -> (i64) {
      scf.yield %3501 : i64
    } else {
      %3521 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3522 = func.call @cc_make_function_ref_const(%3521) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3522) : (i64) -> ()
      %3523 = func.call @stack_pop_pointer() : () -> i64
      %3524 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3525 = arith.constant 9 : i64
      %3526 = func.call @cc_make_string(%3524, %3525) : (!llvm.ptr, i64) -> i64
      %3527 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3528 = arith.constant 15 : i64
      %3529 = func.call @cc_make_string(%3527, %3528) : (!llvm.ptr, i64) -> i64
      %3530 = func.call @cc_intern(%3526, %3529) : (i64, i64) -> i64
      %3531 = func.call @cc_nil_value() : () -> i64
      %3532 = func.call @cc_cons(%3530, %3531) : (i64, i64) -> i64
      %3533 = func.call @cc_values_pack(%3532) : (i64) -> i64
      %3534 = func.call @cc_set_symbol_value(%3530, %3523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3523) : (i64) -> ()
      %3535 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3535 : i64
    }
    %3536 = func.call @cc_nil_value() : () -> i64
    %3537 = func.call @cc_errorp(%3520) : (i64) -> i64
    %3538 = arith.cmpi ne, %3537, %3536 : i64
    %3539 = scf.if %3538 -> (i64) {
      scf.yield %3520 : i64
    } else {
      %3540 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3541 = func.call @cc_make_function_ref_const(%3540) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3541) : (i64) -> ()
      %3542 = func.call @stack_pop_pointer() : () -> i64
      %3543 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3544 = arith.constant 9 : i64
      %3545 = func.call @cc_make_string(%3543, %3544) : (!llvm.ptr, i64) -> i64
      %3546 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3547 = arith.constant 15 : i64
      %3548 = func.call @cc_make_string(%3546, %3547) : (!llvm.ptr, i64) -> i64
      %3549 = func.call @cc_intern(%3545, %3548) : (i64, i64) -> i64
      %3550 = func.call @cc_nil_value() : () -> i64
      %3551 = func.call @cc_cons(%3549, %3550) : (i64, i64) -> i64
      %3552 = func.call @cc_values_pack(%3551) : (i64) -> i64
      %3553 = func.call @cc_set_symbol_value(%3549, %3542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3542) : (i64) -> ()
      %3554 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3554 : i64
    }
    %3555 = func.call @cc_nil_value() : () -> i64
    %3556 = func.call @cc_errorp(%3539) : (i64) -> i64
    %3557 = arith.cmpi ne, %3556, %3555 : i64
    %3558 = scf.if %3557 -> (i64) {
      scf.yield %3539 : i64
    } else {
      %3559 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3560 = func.call @cc_make_function_ref_const(%3559) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3560) : (i64) -> ()
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3563 = arith.constant 9 : i64
      %3564 = func.call @cc_make_string(%3562, %3563) : (!llvm.ptr, i64) -> i64
      %3565 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3566 = arith.constant 15 : i64
      %3567 = func.call @cc_make_string(%3565, %3566) : (!llvm.ptr, i64) -> i64
      %3568 = func.call @cc_intern(%3564, %3567) : (i64, i64) -> i64
      %3569 = func.call @cc_nil_value() : () -> i64
      %3570 = func.call @cc_cons(%3568, %3569) : (i64, i64) -> i64
      %3571 = func.call @cc_values_pack(%3570) : (i64) -> i64
      %3572 = func.call @cc_set_symbol_value(%3568, %3561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3561) : (i64) -> ()
      %3573 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3573 : i64
    }
    %3574 = func.call @cc_nil_value() : () -> i64
    %3575 = func.call @cc_errorp(%3558) : (i64) -> i64
    %3576 = arith.cmpi ne, %3575, %3574 : i64
    %3577 = scf.if %3576 -> (i64) {
      scf.yield %3558 : i64
    } else {
      %3578 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3579 = func.call @cc_make_function_ref_const(%3578) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3579) : (i64) -> ()
      %3580 = func.call @stack_pop_pointer() : () -> i64
      %3581 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3582 = arith.constant 9 : i64
      %3583 = func.call @cc_make_string(%3581, %3582) : (!llvm.ptr, i64) -> i64
      %3584 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3585 = arith.constant 15 : i64
      %3586 = func.call @cc_make_string(%3584, %3585) : (!llvm.ptr, i64) -> i64
      %3587 = func.call @cc_intern(%3583, %3586) : (i64, i64) -> i64
      %3588 = func.call @cc_nil_value() : () -> i64
      %3589 = func.call @cc_cons(%3587, %3588) : (i64, i64) -> i64
      %3590 = func.call @cc_values_pack(%3589) : (i64) -> i64
      %3591 = func.call @cc_set_symbol_value(%3587, %3580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3580) : (i64) -> ()
      %3592 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3592 : i64
    }
    %3593 = func.call @cc_nil_value() : () -> i64
    %3594 = func.call @cc_errorp(%3577) : (i64) -> i64
    %3595 = arith.cmpi ne, %3594, %3593 : i64
    %3596 = scf.if %3595 -> (i64) {
      scf.yield %3577 : i64
    } else {
      %3597 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3598 = arith.constant 16 : i64
      %3599 = func.call @cc_make_string(%3597, %3598) : (!llvm.ptr, i64) -> i64
      %3600 = func.call @cc_nil_value() : () -> i64
      %3601 = func.call @cc_intern(%3599, %3600) : (i64, i64) -> i64
      %3602 = func.call @cc_nil_value() : () -> i64
      %3603 = func.call @cc_cons(%3601, %3602) : (i64, i64) -> i64
      %3604 = func.call @cc_values_pack(%3603) : (i64) -> i64
      func.call @stack_push_pointer(%3601) : (i64) -> ()
      %3605 = func.call @stack_pop_pointer() : () -> i64
      %3606 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3607 = arith.constant 3 : i64
      %3608 = func.call @cc_make_string(%3606, %3607) : (!llvm.ptr, i64) -> i64
      %3609 = func.call @cc_nil_value() : () -> i64
      %3610 = func.call @cc_intern(%3608, %3609) : (i64, i64) -> i64
      %3611 = func.call @cc_nil_value() : () -> i64
      %3612 = func.call @cc_cons(%3610, %3611) : (i64, i64) -> i64
      %3613 = func.call @cc_values_pack(%3612) : (i64) -> i64
      func.call @stack_push_pointer(%3610) : (i64) -> ()
      %3614 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3615 = arith.constant 3 : i64
      %3616 = func.call @cc_make_string(%3614, %3615) : (!llvm.ptr, i64) -> i64
      %3617 = func.call @cc_nil_value() : () -> i64
      %3618 = func.call @cc_intern(%3616, %3617) : (i64, i64) -> i64
      %3619 = func.call @cc_nil_value() : () -> i64
      %3620 = func.call @cc_cons(%3618, %3619) : (i64, i64) -> i64
      %3621 = func.call @cc_values_pack(%3620) : (i64) -> i64
      func.call @stack_push_pointer(%3618) : (i64) -> ()
      %3622 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3623 = arith.constant 16 : i64
      %3624 = func.call @cc_make_string(%3622, %3623) : (!llvm.ptr, i64) -> i64
      %3625 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3626 = arith.constant 3 : i64
      %3627 = func.call @cc_make_string(%3625, %3626) : (!llvm.ptr, i64) -> i64
      %3628 = func.call @cc_intern(%3624, %3627) : (i64, i64) -> i64
      %3629 = func.call @cc_nil_value() : () -> i64
      %3630 = func.call @cc_cons(%3628, %3629) : (i64, i64) -> i64
      %3631 = func.call @cc_values_pack(%3630) : (i64) -> i64
      func.call @stack_push_pointer(%3628) : (i64) -> ()
      %3632 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3633 = arith.constant 23 : i64
      %3634 = func.call @cc_make_string(%3632, %3633) : (!llvm.ptr, i64) -> i64
      %3635 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3636 = arith.constant 3 : i64
      %3637 = func.call @cc_make_string(%3635, %3636) : (!llvm.ptr, i64) -> i64
      %3638 = func.call @cc_intern(%3634, %3637) : (i64, i64) -> i64
      %3639 = func.call @cc_nil_value() : () -> i64
      %3640 = func.call @cc_cons(%3638, %3639) : (i64, i64) -> i64
      %3641 = func.call @cc_values_pack(%3640) : (i64) -> i64
      func.call @stack_push_pointer(%3638) : (i64) -> ()
      %3642 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3643 = arith.constant 8 : i64
      %3644 = func.call @cc_make_string(%3642, %3643) : (!llvm.ptr, i64) -> i64
      %3645 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3646 = arith.constant 7 : i64
      %3647 = func.call @cc_make_string(%3645, %3646) : (!llvm.ptr, i64) -> i64
      %3648 = func.call @cc_intern(%3644, %3647) : (i64, i64) -> i64
      %3649 = func.call @cc_nil_value() : () -> i64
      %3650 = func.call @cc_cons(%3648, %3649) : (i64, i64) -> i64
      %3651 = func.call @cc_values_pack(%3650) : (i64) -> i64
      func.call @stack_push_pointer(%3648) : (i64) -> ()
      %3652 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3653 = arith.constant 7 : i64
      %3654 = func.call @cc_make_string(%3652, %3653) : (!llvm.ptr, i64) -> i64
      %3655 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3656 = arith.constant 7 : i64
      %3657 = func.call @cc_make_string(%3655, %3656) : (!llvm.ptr, i64) -> i64
      %3658 = func.call @cc_intern(%3654, %3657) : (i64, i64) -> i64
      %3659 = func.call @cc_nil_value() : () -> i64
      %3660 = func.call @cc_cons(%3658, %3659) : (i64, i64) -> i64
      %3661 = func.call @cc_values_pack(%3660) : (i64) -> i64
      func.call @stack_push_pointer(%3658) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3662 = func.call @stack_pop_pointer() : () -> i64
      %3663 = func.call @stack_pop_pointer() : () -> i64
      %3664 = func.call @cc_cons(%3663, %3662) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3664) : (i64) -> ()
      %3665 = func.call @stack_pop_pointer() : () -> i64
      %3666 = func.call @stack_pop_pointer() : () -> i64
      %3667 = func.call @cc_cons(%3666, %3665) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3667) : (i64) -> ()
      %3668 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3669 = arith.constant 3 : i64
      %3670 = func.call @cc_make_string(%3668, %3669) : (!llvm.ptr, i64) -> i64
      %3671 = func.call @cc_nil_value() : () -> i64
      %3672 = func.call @cc_intern(%3670, %3671) : (i64, i64) -> i64
      %3673 = func.call @cc_nil_value() : () -> i64
      %3674 = func.call @cc_cons(%3672, %3673) : (i64, i64) -> i64
      %3675 = func.call @cc_values_pack(%3674) : (i64) -> i64
      func.call @stack_push_pointer(%3672) : (i64) -> ()
      %3676 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3677 = arith.constant 1 : i64
      %3678 = func.call @cc_make_string(%3676, %3677) : (!llvm.ptr, i64) -> i64
      %3679 = func.call @cc_nil_value() : () -> i64
      %3680 = func.call @cc_intern(%3678, %3679) : (i64, i64) -> i64
      %3681 = func.call @cc_nil_value() : () -> i64
      %3682 = func.call @cc_cons(%3680, %3681) : (i64, i64) -> i64
      %3683 = func.call @cc_values_pack(%3682) : (i64) -> i64
      func.call @stack_push_pointer(%3680) : (i64) -> ()
      %3684 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3685 = arith.constant 6 : i64
      %3686 = func.call @cc_make_string(%3684, %3685) : (!llvm.ptr, i64) -> i64
      %3687 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3688 = arith.constant 11 : i64
      %3689 = func.call @cc_make_string(%3687, %3688) : (!llvm.ptr, i64) -> i64
      %3690 = func.call @cc_intern(%3686, %3689) : (i64, i64) -> i64
      %3691 = func.call @cc_nil_value() : () -> i64
      %3692 = func.call @cc_cons(%3690, %3691) : (i64, i64) -> i64
      %3693 = func.call @cc_values_pack(%3692) : (i64) -> i64
      func.call @stack_push_pointer(%3690) : (i64) -> ()
      %3694 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%3694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3695 = func.call @stack_pop_pointer() : () -> i64
      %3696 = func.call @stack_pop_pointer() : () -> i64
      %3697 = func.call @cc_cons(%3696, %3695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3697) : (i64) -> ()
      %3698 = func.call @stack_pop_pointer() : () -> i64
      %3699 = func.call @stack_pop_pointer() : () -> i64
      %3700 = func.call @cc_cons(%3699, %3698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3700) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3701 = func.call @stack_pop_pointer() : () -> i64
      %3702 = func.call @stack_pop_pointer() : () -> i64
      %3703 = func.call @cc_cons(%3702, %3701) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3703) : (i64) -> ()
      %3704 = func.call @stack_pop_pointer() : () -> i64
      %3705 = func.call @stack_pop_pointer() : () -> i64
      %3706 = func.call @cc_cons(%3705, %3704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3707 = func.call @stack_pop_pointer() : () -> i64
      %3708 = func.call @stack_pop_pointer() : () -> i64
      %3709 = func.call @cc_cons(%3708, %3707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3709) : (i64) -> ()
      %3710 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3711 = arith.constant 1 : i64
      %3712 = func.call @cc_make_string(%3710, %3711) : (!llvm.ptr, i64) -> i64
      %3713 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3714 = arith.constant 11 : i64
      %3715 = func.call @cc_make_string(%3713, %3714) : (!llvm.ptr, i64) -> i64
      %3716 = func.call @cc_intern(%3712, %3715) : (i64, i64) -> i64
      %3717 = func.call @cc_nil_value() : () -> i64
      %3718 = func.call @cc_cons(%3716, %3717) : (i64, i64) -> i64
      %3719 = func.call @cc_values_pack(%3718) : (i64) -> i64
      func.call @stack_push_pointer(%3716) : (i64) -> ()
      %3720 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3721 = arith.constant 9 : i64
      %3722 = func.call @cc_make_string(%3720, %3721) : (!llvm.ptr, i64) -> i64
      %3723 = func.call @cc_nil_value() : () -> i64
      %3724 = func.call @cc_intern(%3722, %3723) : (i64, i64) -> i64
      %3725 = func.call @cc_nil_value() : () -> i64
      %3726 = func.call @cc_cons(%3724, %3725) : (i64, i64) -> i64
      %3727 = func.call @cc_values_pack(%3726) : (i64) -> i64
      func.call @stack_push_pointer(%3724) : (i64) -> ()
      %3728 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3729 = arith.constant 1 : i64
      %3730 = func.call @cc_make_string(%3728, %3729) : (!llvm.ptr, i64) -> i64
      %3731 = func.call @cc_nil_value() : () -> i64
      %3732 = func.call @cc_intern(%3730, %3731) : (i64, i64) -> i64
      %3733 = func.call @cc_nil_value() : () -> i64
      %3734 = func.call @cc_cons(%3732, %3733) : (i64, i64) -> i64
      %3735 = func.call @cc_values_pack(%3734) : (i64) -> i64
      func.call @stack_push_pointer(%3732) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3736 = func.call @stack_pop_pointer() : () -> i64
      %3737 = func.call @stack_pop_pointer() : () -> i64
      %3738 = func.call @cc_cons(%3737, %3736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3738) : (i64) -> ()
      %3739 = func.call @stack_pop_pointer() : () -> i64
      %3740 = func.call @stack_pop_pointer() : () -> i64
      %3741 = func.call @cc_cons(%3740, %3739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3741) : (i64) -> ()
      %3742 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3743 = arith.constant 9 : i64
      %3744 = func.call @cc_make_string(%3742, %3743) : (!llvm.ptr, i64) -> i64
      %3745 = func.call @cc_nil_value() : () -> i64
      %3746 = func.call @cc_intern(%3744, %3745) : (i64, i64) -> i64
      %3747 = func.call @cc_nil_value() : () -> i64
      %3748 = func.call @cc_cons(%3746, %3747) : (i64, i64) -> i64
      %3749 = func.call @cc_values_pack(%3748) : (i64) -> i64
      func.call @stack_push_pointer(%3746) : (i64) -> ()
      %3750 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3751 = arith.constant 1 : i64
      %3752 = func.call @cc_make_string(%3750, %3751) : (!llvm.ptr, i64) -> i64
      %3753 = func.call @cc_nil_value() : () -> i64
      %3754 = func.call @cc_intern(%3752, %3753) : (i64, i64) -> i64
      %3755 = func.call @cc_nil_value() : () -> i64
      %3756 = func.call @cc_cons(%3754, %3755) : (i64, i64) -> i64
      %3757 = func.call @cc_values_pack(%3756) : (i64) -> i64
      func.call @stack_push_pointer(%3754) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3758 = func.call @stack_pop_pointer() : () -> i64
      %3759 = func.call @stack_pop_pointer() : () -> i64
      %3760 = func.call @cc_cons(%3759, %3758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3760) : (i64) -> ()
      %3761 = func.call @stack_pop_pointer() : () -> i64
      %3762 = func.call @stack_pop_pointer() : () -> i64
      %3763 = func.call @cc_cons(%3762, %3761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3763) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3764 = func.call @stack_pop_pointer() : () -> i64
      %3765 = func.call @stack_pop_pointer() : () -> i64
      %3766 = func.call @cc_cons(%3765, %3764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3766) : (i64) -> ()
      %3767 = func.call @stack_pop_pointer() : () -> i64
      %3768 = func.call @stack_pop_pointer() : () -> i64
      %3769 = func.call @cc_cons(%3768, %3767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3769) : (i64) -> ()
      %3770 = func.call @stack_pop_pointer() : () -> i64
      %3771 = func.call @stack_pop_pointer() : () -> i64
      %3772 = func.call @cc_cons(%3771, %3770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3773 = func.call @stack_pop_pointer() : () -> i64
      %3774 = func.call @stack_pop_pointer() : () -> i64
      %3775 = func.call @cc_cons(%3774, %3773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3775) : (i64) -> ()
      %3776 = func.call @stack_pop_pointer() : () -> i64
      %3777 = func.call @stack_pop_pointer() : () -> i64
      %3778 = func.call @cc_cons(%3777, %3776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3778) : (i64) -> ()
      %3779 = func.call @stack_pop_pointer() : () -> i64
      %3780 = func.call @stack_pop_pointer() : () -> i64
      %3781 = func.call @cc_cons(%3780, %3779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3781) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3782 = func.call @stack_pop_pointer() : () -> i64
      %3783 = func.call @stack_pop_pointer() : () -> i64
      %3784 = func.call @cc_cons(%3783, %3782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3784) : (i64) -> ()
      %3785 = func.call @stack_pop_pointer() : () -> i64
      %3786 = func.call @stack_pop_pointer() : () -> i64
      %3787 = func.call @cc_cons(%3786, %3785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3787) : (i64) -> ()
      %3788 = func.call @stack_pop_pointer() : () -> i64
      %3789 = func.call @stack_pop_pointer() : () -> i64
      %3790 = func.call @cc_cons(%3789, %3788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3790) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3791 = func.call @stack_pop_pointer() : () -> i64
      %3792 = func.call @stack_pop_pointer() : () -> i64
      %3793 = func.call @cc_cons(%3792, %3791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3793) : (i64) -> ()
      %3794 = func.call @stack_pop_pointer() : () -> i64
      %3795 = func.call @stack_pop_pointer() : () -> i64
      %3796 = func.call @cc_cons(%3795, %3794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3796) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3797 = func.call @stack_pop_pointer() : () -> i64
      %3798 = func.call @stack_pop_pointer() : () -> i64
      %3799 = func.call @cc_cons(%3798, %3797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3799) : (i64) -> ()
      %3800 = func.call @stack_pop_pointer() : () -> i64
      %3801 = func.call @stack_pop_pointer() : () -> i64
      %3802 = func.call @cc_cons(%3801, %3800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3802) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3803 = func.call @stack_pop_pointer() : () -> i64
      %3804 = func.call @stack_pop_pointer() : () -> i64
      %3805 = func.call @cc_cons(%3804, %3803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3805) : (i64) -> ()
      %3806 = func.call @stack_pop_pointer() : () -> i64
      %3807 = func.call @stack_pop_pointer() : () -> i64
      %3808 = func.call @cc_cons(%3807, %3806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3808) : (i64) -> ()
      %3809 = func.call @stack_pop_pointer() : () -> i64
      %3923 = arith.constant 152926823645209 : i64
      %3924 = arith.constant 0 : i64
      %3925 = func.call @cc_make_closure(%3923, %3924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3925) : (i64) -> ()
      %3926 = func.call @stack_pop_pointer() : () -> i64
      %3927 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3928 = arith.constant 1 : i64
      %3929 = func.call @cc_make_string(%3927, %3928) : (!llvm.ptr, i64) -> i64
      %3930 = func.call @cc_nil_value() : () -> i64
      %3931 = func.call @cc_intern(%3929, %3930) : (i64, i64) -> i64
      %3932 = func.call @cc_nil_value() : () -> i64
      %3933 = func.call @cc_cons(%3931, %3932) : (i64, i64) -> i64
      %3934 = func.call @cc_values_pack(%3933) : (i64) -> i64
      func.call @stack_push_pointer(%3931) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3935 = func.call @stack_pop_pointer() : () -> i64
      %3936 = func.call @stack_pop_pointer() : () -> i64
      %3937 = func.call @cc_cons(%3936, %3935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3937) : (i64) -> ()
      %3938 = func.call @stack_pop_pointer() : () -> i64
      %3939 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3940 = arith.constant 11 : i64
      %3941 = func.call @cc_make_string(%3939, %3940) : (!llvm.ptr, i64) -> i64
      %3942 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3943 = arith.constant 7 : i64
      %3944 = func.call @cc_make_string(%3942, %3943) : (!llvm.ptr, i64) -> i64
      %3945 = func.call @cc_intern(%3941, %3944) : (i64, i64) -> i64
      %3946 = func.call @cc_nil_value() : () -> i64
      %3947 = func.call @cc_cons(%3945, %3946) : (i64, i64) -> i64
      %3948 = func.call @cc_values_pack(%3947) : (i64) -> i64
      func.call @stack_push_pointer(%3945) : (i64) -> ()
      %3949 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3950 = func.call @stack_pop_pointer() : () -> i64
      %3951 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3952 = arith.constant 4 : i64
      %3953 = func.call @cc_make_string(%3951, %3952) : (!llvm.ptr, i64) -> i64
      %3954 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3955 = arith.constant 7 : i64
      %3956 = func.call @cc_make_string(%3954, %3955) : (!llvm.ptr, i64) -> i64
      %3957 = func.call @cc_intern(%3953, %3956) : (i64, i64) -> i64
      %3958 = func.call @cc_nil_value() : () -> i64
      %3959 = func.call @cc_cons(%3957, %3958) : (i64, i64) -> i64
      %3960 = func.call @cc_values_pack(%3959) : (i64) -> i64
      func.call @stack_push_pointer(%3957) : (i64) -> ()
      %3961 = func.call @stack_pop_pointer() : () -> i64
      %3962 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3963 = arith.constant 6 : i64
      %3964 = func.call @cc_make_string(%3962, %3963) : (!llvm.ptr, i64) -> i64
      %3965 = func.call @cc_nil_value() : () -> i64
      %3966 = func.call @cc_intern(%3964, %3965) : (i64, i64) -> i64
      %3967 = func.call @cc_nil_value() : () -> i64
      %3968 = func.call @cc_cons(%3966, %3967) : (i64, i64) -> i64
      %3969 = func.call @cc_values_pack(%3968) : (i64) -> i64
      func.call @stack_push_pointer(%3966) : (i64) -> ()
      %3970 = func.call @stack_pop_pointer() : () -> i64
      %3971 = func.call @cc_nil_value() : () -> i64
      %3972 = func.call @cc_errorp(%3605) : (i64) -> i64
      %3973 = arith.cmpi ne, %3972, %3971 : i64
      %3974 = arith.cmpi eq, %3971, %3971 : i64
      %3975 = arith.andi %3973, %3974 : i1
      %3976 = scf.if %3975 -> (i64) {
        scf.yield %3605 : i64
      } else {
        scf.yield %3971 : i64
      }
      %3977 = func.call @cc_errorp(%3809) : (i64) -> i64
      %3978 = arith.cmpi ne, %3977, %3971 : i64
      %3979 = arith.cmpi eq, %3976, %3971 : i64
      %3980 = arith.andi %3978, %3979 : i1
      %3981 = scf.if %3980 -> (i64) {
        scf.yield %3809 : i64
      } else {
        scf.yield %3976 : i64
      }
      %3982 = func.call @cc_errorp(%3926) : (i64) -> i64
      %3983 = arith.cmpi ne, %3982, %3971 : i64
      %3984 = arith.cmpi eq, %3981, %3971 : i64
      %3985 = arith.andi %3983, %3984 : i1
      %3986 = scf.if %3985 -> (i64) {
        scf.yield %3926 : i64
      } else {
        scf.yield %3981 : i64
      }
      %3987 = func.call @cc_errorp(%3938) : (i64) -> i64
      %3988 = arith.cmpi ne, %3987, %3971 : i64
      %3989 = arith.cmpi eq, %3986, %3971 : i64
      %3990 = arith.andi %3988, %3989 : i1
      %3991 = scf.if %3990 -> (i64) {
        scf.yield %3938 : i64
      } else {
        scf.yield %3986 : i64
      }
      %3992 = func.call @cc_errorp(%3949) : (i64) -> i64
      %3993 = arith.cmpi ne, %3992, %3971 : i64
      %3994 = arith.cmpi eq, %3991, %3971 : i64
      %3995 = arith.andi %3993, %3994 : i1
      %3996 = scf.if %3995 -> (i64) {
        scf.yield %3949 : i64
      } else {
        scf.yield %3991 : i64
      }
      %3997 = func.call @cc_errorp(%3950) : (i64) -> i64
      %3998 = arith.cmpi ne, %3997, %3971 : i64
      %3999 = arith.cmpi eq, %3996, %3971 : i64
      %4000 = arith.andi %3998, %3999 : i1
      %4001 = scf.if %4000 -> (i64) {
        scf.yield %3950 : i64
      } else {
        scf.yield %3996 : i64
      }
      %4002 = func.call @cc_errorp(%3961) : (i64) -> i64
      %4003 = arith.cmpi ne, %4002, %3971 : i64
      %4004 = arith.cmpi eq, %4001, %3971 : i64
      %4005 = arith.andi %4003, %4004 : i1
      %4006 = scf.if %4005 -> (i64) {
        scf.yield %3961 : i64
      } else {
        scf.yield %4001 : i64
      }
      %4007 = func.call @cc_errorp(%3970) : (i64) -> i64
      %4008 = arith.cmpi ne, %4007, %3971 : i64
      %4009 = arith.cmpi eq, %4006, %3971 : i64
      %4010 = arith.andi %4008, %4009 : i1
      %4011 = scf.if %4010 -> (i64) {
        scf.yield %3970 : i64
      } else {
        scf.yield %4006 : i64
      }
      %4012 = arith.cmpi ne, %4011, %3971 : i64
      scf.if %4012 {
        func.call @stack_push_pointer(%4011) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3605) : (i64) -> ()
        func.call @stack_push_pointer(%3809) : (i64) -> ()
        func.call @stack_push_pointer(%3926) : (i64) -> ()
        func.call @stack_push_pointer(%3938) : (i64) -> ()
        func.call @stack_push_pointer(%3949) : (i64) -> ()
        func.call @stack_push_pointer(%3950) : (i64) -> ()
        func.call @stack_push_pointer(%3961) : (i64) -> ()
        func.call @stack_push_pointer(%3970) : (i64) -> ()
        %4013 = llvm.mlir.addressof @str335 : !llvm.ptr
        %4014 = func.call @cc_make_function_ref_const(%4013) : (!llvm.ptr) -> i64
        %4015 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4014, %4015) : (i64, i64) -> ()
      }
      %4016 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4016 : i64
    }
    %4017 = func.call @cc_nil_value() : () -> i64
    %4018 = func.call @cc_errorp(%3596) : (i64) -> i64
    %4019 = arith.cmpi ne, %4018, %4017 : i64
    %4020 = scf.if %4019 -> (i64) {
      scf.yield %3596 : i64
    } else {
      %4021 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4022 = arith.constant 16 : i64
      %4023 = func.call @cc_make_string(%4021, %4022) : (!llvm.ptr, i64) -> i64
      %4024 = func.call @cc_nil_value() : () -> i64
      %4025 = func.call @cc_intern(%4023, %4024) : (i64, i64) -> i64
      %4026 = func.call @cc_nil_value() : () -> i64
      %4027 = func.call @cc_cons(%4025, %4026) : (i64, i64) -> i64
      %4028 = func.call @cc_values_pack(%4027) : (i64) -> i64
      func.call @stack_push_pointer(%4025) : (i64) -> ()
      %4029 = func.call @stack_pop_pointer() : () -> i64
      %4030 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4031 = arith.constant 13 : i64
      %4032 = func.call @cc_make_string(%4030, %4031) : (!llvm.ptr, i64) -> i64
      %4033 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4034 = arith.constant 11 : i64
      %4035 = func.call @cc_make_string(%4033, %4034) : (!llvm.ptr, i64) -> i64
      %4036 = func.call @cc_intern(%4032, %4035) : (i64, i64) -> i64
      %4037 = func.call @cc_nil_value() : () -> i64
      %4038 = func.call @cc_cons(%4036, %4037) : (i64, i64) -> i64
      %4039 = func.call @cc_values_pack(%4038) : (i64) -> i64
      func.call @stack_push_pointer(%4036) : (i64) -> ()
      %4040 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4041 = arith.constant 6 : i64
      %4042 = func.call @cc_make_string(%4040, %4041) : (!llvm.ptr, i64) -> i64
      %4043 = func.call @cc_nil_value() : () -> i64
      %4044 = func.call @cc_intern(%4042, %4043) : (i64, i64) -> i64
      %4045 = func.call @cc_nil_value() : () -> i64
      %4046 = func.call @cc_cons(%4044, %4045) : (i64, i64) -> i64
      %4047 = func.call @cc_values_pack(%4046) : (i64) -> i64
      func.call @stack_push_pointer(%4044) : (i64) -> ()
      %4048 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4049 = arith.constant 19 : i64
      %4050 = func.call @cc_make_string(%4048, %4049) : (!llvm.ptr, i64) -> i64
      %4051 = func.call @cc_nil_value() : () -> i64
      %4052 = func.call @cc_intern(%4050, %4051) : (i64, i64) -> i64
      %4053 = func.call @cc_nil_value() : () -> i64
      %4054 = func.call @cc_cons(%4052, %4053) : (i64, i64) -> i64
      %4055 = func.call @cc_values_pack(%4054) : (i64) -> i64
      func.call @stack_push_pointer(%4052) : (i64) -> ()
      %4056 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4057 = arith.constant 3 : i64
      %4058 = func.call @cc_make_string(%4056, %4057) : (!llvm.ptr, i64) -> i64
      %4059 = func.call @cc_nil_value() : () -> i64
      %4060 = func.call @cc_intern(%4058, %4059) : (i64, i64) -> i64
      %4061 = func.call @cc_nil_value() : () -> i64
      %4062 = func.call @cc_cons(%4060, %4061) : (i64, i64) -> i64
      %4063 = func.call @cc_values_pack(%4062) : (i64) -> i64
      func.call @stack_push_pointer(%4060) : (i64) -> ()
      %4064 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4065 = arith.constant 1 : i64
      %4066 = func.call @cc_make_string(%4064, %4065) : (!llvm.ptr, i64) -> i64
      %4067 = func.call @cc_nil_value() : () -> i64
      %4068 = func.call @cc_intern(%4066, %4067) : (i64, i64) -> i64
      %4069 = func.call @cc_nil_value() : () -> i64
      %4070 = func.call @cc_cons(%4068, %4069) : (i64, i64) -> i64
      %4071 = func.call @cc_values_pack(%4070) : (i64) -> i64
      func.call @stack_push_pointer(%4068) : (i64) -> ()
      %4072 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4073 = arith.constant 6 : i64
      %4074 = func.call @cc_make_string(%4072, %4073) : (!llvm.ptr, i64) -> i64
      %4075 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4076 = arith.constant 11 : i64
      %4077 = func.call @cc_make_string(%4075, %4076) : (!llvm.ptr, i64) -> i64
      %4078 = func.call @cc_intern(%4074, %4077) : (i64, i64) -> i64
      %4079 = func.call @cc_nil_value() : () -> i64
      %4080 = func.call @cc_cons(%4078, %4079) : (i64, i64) -> i64
      %4081 = func.call @cc_values_pack(%4080) : (i64) -> i64
      func.call @stack_push_pointer(%4078) : (i64) -> ()
      %4082 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%4082) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4083 = func.call @stack_pop_pointer() : () -> i64
      %4084 = func.call @stack_pop_pointer() : () -> i64
      %4085 = func.call @cc_cons(%4084, %4083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4085) : (i64) -> ()
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @stack_pop_pointer() : () -> i64
      %4088 = func.call @cc_cons(%4087, %4086) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4088) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4089 = func.call @stack_pop_pointer() : () -> i64
      %4090 = func.call @stack_pop_pointer() : () -> i64
      %4091 = func.call @cc_cons(%4090, %4089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4091) : (i64) -> ()
      %4092 = func.call @stack_pop_pointer() : () -> i64
      %4093 = func.call @stack_pop_pointer() : () -> i64
      %4094 = func.call @cc_cons(%4093, %4092) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4094) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4095 = func.call @stack_pop_pointer() : () -> i64
      %4096 = func.call @stack_pop_pointer() : () -> i64
      %4097 = func.call @cc_cons(%4096, %4095) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4097) : (i64) -> ()
      %4098 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4099 = arith.constant 1 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4102 = arith.constant 11 : i64
      %4103 = func.call @cc_make_string(%4101, %4102) : (!llvm.ptr, i64) -> i64
      %4104 = func.call @cc_intern(%4100, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_nil_value() : () -> i64
      %4106 = func.call @cc_cons(%4104, %4105) : (i64, i64) -> i64
      %4107 = func.call @cc_values_pack(%4106) : (i64) -> i64
      func.call @stack_push_pointer(%4104) : (i64) -> ()
      %4108 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4109 = arith.constant 9 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = func.call @cc_nil_value() : () -> i64
      %4112 = func.call @cc_intern(%4110, %4111) : (i64, i64) -> i64
      %4113 = func.call @cc_nil_value() : () -> i64
      %4114 = func.call @cc_cons(%4112, %4113) : (i64, i64) -> i64
      %4115 = func.call @cc_values_pack(%4114) : (i64) -> i64
      func.call @stack_push_pointer(%4112) : (i64) -> ()
      %4116 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4117 = arith.constant 1 : i64
      %4118 = func.call @cc_make_string(%4116, %4117) : (!llvm.ptr, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_intern(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_nil_value() : () -> i64
      %4122 = func.call @cc_cons(%4120, %4121) : (i64, i64) -> i64
      %4123 = func.call @cc_values_pack(%4122) : (i64) -> i64
      func.call @stack_push_pointer(%4120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4124 = func.call @stack_pop_pointer() : () -> i64
      %4125 = func.call @stack_pop_pointer() : () -> i64
      %4126 = func.call @cc_cons(%4125, %4124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4126) : (i64) -> ()
      %4127 = func.call @stack_pop_pointer() : () -> i64
      %4128 = func.call @stack_pop_pointer() : () -> i64
      %4129 = func.call @cc_cons(%4128, %4127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4129) : (i64) -> ()
      %4130 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4131 = arith.constant 9 : i64
      %4132 = func.call @cc_make_string(%4130, %4131) : (!llvm.ptr, i64) -> i64
      %4133 = func.call @cc_nil_value() : () -> i64
      %4134 = func.call @cc_intern(%4132, %4133) : (i64, i64) -> i64
      %4135 = func.call @cc_nil_value() : () -> i64
      %4136 = func.call @cc_cons(%4134, %4135) : (i64, i64) -> i64
      %4137 = func.call @cc_values_pack(%4136) : (i64) -> i64
      func.call @stack_push_pointer(%4134) : (i64) -> ()
      %4138 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4139 = arith.constant 1 : i64
      %4140 = func.call @cc_make_string(%4138, %4139) : (!llvm.ptr, i64) -> i64
      %4141 = func.call @cc_nil_value() : () -> i64
      %4142 = func.call @cc_intern(%4140, %4141) : (i64, i64) -> i64
      %4143 = func.call @cc_nil_value() : () -> i64
      %4144 = func.call @cc_cons(%4142, %4143) : (i64, i64) -> i64
      %4145 = func.call @cc_values_pack(%4144) : (i64) -> i64
      func.call @stack_push_pointer(%4142) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4146 = func.call @stack_pop_pointer() : () -> i64
      %4147 = func.call @stack_pop_pointer() : () -> i64
      %4148 = func.call @cc_cons(%4147, %4146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4148) : (i64) -> ()
      %4149 = func.call @stack_pop_pointer() : () -> i64
      %4150 = func.call @stack_pop_pointer() : () -> i64
      %4151 = func.call @cc_cons(%4150, %4149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4151) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4152 = func.call @stack_pop_pointer() : () -> i64
      %4153 = func.call @stack_pop_pointer() : () -> i64
      %4154 = func.call @cc_cons(%4153, %4152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4154) : (i64) -> ()
      %4155 = func.call @stack_pop_pointer() : () -> i64
      %4156 = func.call @stack_pop_pointer() : () -> i64
      %4157 = func.call @cc_cons(%4156, %4155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4157) : (i64) -> ()
      %4158 = func.call @stack_pop_pointer() : () -> i64
      %4159 = func.call @stack_pop_pointer() : () -> i64
      %4160 = func.call @cc_cons(%4159, %4158) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4161 = func.call @stack_pop_pointer() : () -> i64
      %4162 = func.call @stack_pop_pointer() : () -> i64
      %4163 = func.call @cc_cons(%4162, %4161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4163) : (i64) -> ()
      %4164 = func.call @stack_pop_pointer() : () -> i64
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @cc_cons(%4165, %4164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4166) : (i64) -> ()
      %4167 = func.call @stack_pop_pointer() : () -> i64
      %4168 = func.call @stack_pop_pointer() : () -> i64
      %4169 = func.call @cc_cons(%4168, %4167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4169) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4170 = func.call @stack_pop_pointer() : () -> i64
      %4171 = func.call @stack_pop_pointer() : () -> i64
      %4172 = func.call @cc_cons(%4171, %4170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4172) : (i64) -> ()
      %4173 = func.call @stack_pop_pointer() : () -> i64
      %4174 = func.call @stack_pop_pointer() : () -> i64
      %4175 = func.call @cc_cons(%4174, %4173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %4191 = func.call @stack_pop_pointer() : () -> i64
      %4294 = arith.constant 152926823645210 : i64
      %4295 = arith.constant 0 : i64
      %4296 = func.call @cc_make_closure(%4294, %4295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4296) : (i64) -> ()
      %4297 = func.call @stack_pop_pointer() : () -> i64
      %4298 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4299 = arith.constant 4 : i64
      %4300 = func.call @cc_make_string(%4298, %4299) : (!llvm.ptr, i64) -> i64
      %4301 = func.call @cc_nil_value() : () -> i64
      %4302 = func.call @cc_intern(%4300, %4301) : (i64, i64) -> i64
      %4303 = func.call @cc_nil_value() : () -> i64
      %4304 = func.call @cc_cons(%4302, %4303) : (i64, i64) -> i64
      %4305 = func.call @cc_values_pack(%4304) : (i64) -> i64
      func.call @stack_push_pointer(%4302) : (i64) -> ()
      %4306 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4307 = arith.constant 2 : i64
      %4308 = func.call @cc_make_string(%4306, %4307) : (!llvm.ptr, i64) -> i64
      %4309 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4310 = arith.constant 11 : i64
      %4311 = func.call @cc_make_string(%4309, %4310) : (!llvm.ptr, i64) -> i64
      %4312 = func.call @cc_intern(%4308, %4311) : (i64, i64) -> i64
      %4313 = func.call @cc_nil_value() : () -> i64
      %4314 = func.call @cc_cons(%4312, %4313) : (i64, i64) -> i64
      %4315 = func.call @cc_values_pack(%4314) : (i64) -> i64
      func.call @stack_push_pointer(%4312) : (i64) -> ()
      %4316 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4317 = arith.constant 22 : i64
      %4318 = func.call @cc_make_string(%4316, %4317) : (!llvm.ptr, i64) -> i64
      %4319 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4320 = arith.constant 11 : i64
      %4321 = func.call @cc_make_string(%4319, %4320) : (!llvm.ptr, i64) -> i64
      %4322 = func.call @cc_intern(%4318, %4321) : (i64, i64) -> i64
      %4323 = func.call @cc_nil_value() : () -> i64
      %4324 = func.call @cc_cons(%4322, %4323) : (i64, i64) -> i64
      %4325 = func.call @cc_values_pack(%4324) : (i64) -> i64
      func.call @stack_push_pointer(%4322) : (i64) -> ()
      %4326 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4327 = arith.constant 23 : i64
      %4328 = func.call @cc_make_string(%4326, %4327) : (!llvm.ptr, i64) -> i64
      %4329 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4330 = arith.constant 11 : i64
      %4331 = func.call @cc_make_string(%4329, %4330) : (!llvm.ptr, i64) -> i64
      %4332 = func.call @cc_intern(%4328, %4331) : (i64, i64) -> i64
      %4333 = func.call @cc_nil_value() : () -> i64
      %4334 = func.call @cc_cons(%4332, %4333) : (i64, i64) -> i64
      %4335 = func.call @cc_values_pack(%4334) : (i64) -> i64
      func.call @stack_push_pointer(%4332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4336 = func.call @stack_pop_pointer() : () -> i64
      %4337 = func.call @stack_pop_pointer() : () -> i64
      %4338 = func.call @cc_cons(%4337, %4336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4338) : (i64) -> ()
      %4339 = func.call @stack_pop_pointer() : () -> i64
      %4340 = func.call @stack_pop_pointer() : () -> i64
      %4341 = func.call @cc_cons(%4340, %4339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4341) : (i64) -> ()
      %4342 = func.call @stack_pop_pointer() : () -> i64
      %4343 = func.call @stack_pop_pointer() : () -> i64
      %4344 = func.call @cc_cons(%4343, %4342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4345 = func.call @stack_pop_pointer() : () -> i64
      %4346 = func.call @stack_pop_pointer() : () -> i64
      %4347 = func.call @cc_cons(%4346, %4345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4347) : (i64) -> ()
      %4348 = func.call @stack_pop_pointer() : () -> i64
      %4349 = func.call @stack_pop_pointer() : () -> i64
      %4350 = func.call @cc_cons(%4349, %4348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4350) : (i64) -> ()
      %4351 = func.call @stack_pop_pointer() : () -> i64
      %4352 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4353 = arith.constant 11 : i64
      %4354 = func.call @cc_make_string(%4352, %4353) : (!llvm.ptr, i64) -> i64
      %4355 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4356 = arith.constant 7 : i64
      %4357 = func.call @cc_make_string(%4355, %4356) : (!llvm.ptr, i64) -> i64
      %4358 = func.call @cc_intern(%4354, %4357) : (i64, i64) -> i64
      %4359 = func.call @cc_nil_value() : () -> i64
      %4360 = func.call @cc_cons(%4358, %4359) : (i64, i64) -> i64
      %4361 = func.call @cc_values_pack(%4360) : (i64) -> i64
      func.call @stack_push_pointer(%4358) : (i64) -> ()
      %4362 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4363 = func.call @stack_pop_pointer() : () -> i64
      %4364 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4365 = arith.constant 4 : i64
      %4366 = func.call @cc_make_string(%4364, %4365) : (!llvm.ptr, i64) -> i64
      %4367 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4368 = arith.constant 7 : i64
      %4369 = func.call @cc_make_string(%4367, %4368) : (!llvm.ptr, i64) -> i64
      %4370 = func.call @cc_intern(%4366, %4369) : (i64, i64) -> i64
      %4371 = func.call @cc_nil_value() : () -> i64
      %4372 = func.call @cc_cons(%4370, %4371) : (i64, i64) -> i64
      %4373 = func.call @cc_values_pack(%4372) : (i64) -> i64
      func.call @stack_push_pointer(%4370) : (i64) -> ()
      %4374 = func.call @stack_pop_pointer() : () -> i64
      %4375 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4376 = arith.constant 5 : i64
      %4377 = func.call @cc_make_string(%4375, %4376) : (!llvm.ptr, i64) -> i64
      %4378 = func.call @cc_nil_value() : () -> i64
      %4379 = func.call @cc_intern(%4377, %4378) : (i64, i64) -> i64
      %4380 = func.call @cc_nil_value() : () -> i64
      %4381 = func.call @cc_cons(%4379, %4380) : (i64, i64) -> i64
      %4382 = func.call @cc_values_pack(%4381) : (i64) -> i64
      func.call @stack_push_pointer(%4379) : (i64) -> ()
      %4383 = func.call @stack_pop_pointer() : () -> i64
      %4384 = func.call @cc_nil_value() : () -> i64
      %4385 = func.call @cc_errorp(%4029) : (i64) -> i64
      %4386 = arith.cmpi ne, %4385, %4384 : i64
      %4387 = arith.cmpi eq, %4384, %4384 : i64
      %4388 = arith.andi %4386, %4387 : i1
      %4389 = scf.if %4388 -> (i64) {
        scf.yield %4029 : i64
      } else {
        scf.yield %4384 : i64
      }
      %4390 = func.call @cc_errorp(%4191) : (i64) -> i64
      %4391 = arith.cmpi ne, %4390, %4384 : i64
      %4392 = arith.cmpi eq, %4389, %4384 : i64
      %4393 = arith.andi %4391, %4392 : i1
      %4394 = scf.if %4393 -> (i64) {
        scf.yield %4191 : i64
      } else {
        scf.yield %4389 : i64
      }
      %4395 = func.call @cc_errorp(%4297) : (i64) -> i64
      %4396 = arith.cmpi ne, %4395, %4384 : i64
      %4397 = arith.cmpi eq, %4394, %4384 : i64
      %4398 = arith.andi %4396, %4397 : i1
      %4399 = scf.if %4398 -> (i64) {
        scf.yield %4297 : i64
      } else {
        scf.yield %4394 : i64
      }
      %4400 = func.call @cc_errorp(%4351) : (i64) -> i64
      %4401 = arith.cmpi ne, %4400, %4384 : i64
      %4402 = arith.cmpi eq, %4399, %4384 : i64
      %4403 = arith.andi %4401, %4402 : i1
      %4404 = scf.if %4403 -> (i64) {
        scf.yield %4351 : i64
      } else {
        scf.yield %4399 : i64
      }
      %4405 = func.call @cc_errorp(%4362) : (i64) -> i64
      %4406 = arith.cmpi ne, %4405, %4384 : i64
      %4407 = arith.cmpi eq, %4404, %4384 : i64
      %4408 = arith.andi %4406, %4407 : i1
      %4409 = scf.if %4408 -> (i64) {
        scf.yield %4362 : i64
      } else {
        scf.yield %4404 : i64
      }
      %4410 = func.call @cc_errorp(%4363) : (i64) -> i64
      %4411 = arith.cmpi ne, %4410, %4384 : i64
      %4412 = arith.cmpi eq, %4409, %4384 : i64
      %4413 = arith.andi %4411, %4412 : i1
      %4414 = scf.if %4413 -> (i64) {
        scf.yield %4363 : i64
      } else {
        scf.yield %4409 : i64
      }
      %4415 = func.call @cc_errorp(%4374) : (i64) -> i64
      %4416 = arith.cmpi ne, %4415, %4384 : i64
      %4417 = arith.cmpi eq, %4414, %4384 : i64
      %4418 = arith.andi %4416, %4417 : i1
      %4419 = scf.if %4418 -> (i64) {
        scf.yield %4374 : i64
      } else {
        scf.yield %4414 : i64
      }
      %4420 = func.call @cc_errorp(%4383) : (i64) -> i64
      %4421 = arith.cmpi ne, %4420, %4384 : i64
      %4422 = arith.cmpi eq, %4419, %4384 : i64
      %4423 = arith.andi %4421, %4422 : i1
      %4424 = scf.if %4423 -> (i64) {
        scf.yield %4383 : i64
      } else {
        scf.yield %4419 : i64
      }
      %4425 = arith.cmpi ne, %4424, %4384 : i64
      scf.if %4425 {
        func.call @stack_push_pointer(%4424) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4029) : (i64) -> ()
        func.call @stack_push_pointer(%4191) : (i64) -> ()
        func.call @stack_push_pointer(%4297) : (i64) -> ()
        func.call @stack_push_pointer(%4351) : (i64) -> ()
        func.call @stack_push_pointer(%4362) : (i64) -> ()
        func.call @stack_push_pointer(%4363) : (i64) -> ()
        func.call @stack_push_pointer(%4374) : (i64) -> ()
        func.call @stack_push_pointer(%4383) : (i64) -> ()
        %4426 = llvm.mlir.addressof @str365 : !llvm.ptr
        %4427 = func.call @cc_make_function_ref_const(%4426) : (!llvm.ptr) -> i64
        %4428 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4427, %4428) : (i64, i64) -> ()
      }
      %4429 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4429 : i64
    }
    %4430 = func.call @cc_nil_value() : () -> i64
    %4431 = func.call @cc_errorp(%4020) : (i64) -> i64
    %4432 = arith.cmpi ne, %4431, %4430 : i64
    %4433 = scf.if %4432 -> (i64) {
      scf.yield %4020 : i64
    } else {
      %4434 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4435 = func.call @cc_make_function_ref_const(%4434) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4435) : (i64) -> ()
      %4436 = func.call @stack_pop_pointer() : () -> i64
      %4437 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4438 = arith.constant 9 : i64
      %4439 = func.call @cc_make_string(%4437, %4438) : (!llvm.ptr, i64) -> i64
      %4440 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4441 = arith.constant 15 : i64
      %4442 = func.call @cc_make_string(%4440, %4441) : (!llvm.ptr, i64) -> i64
      %4443 = func.call @cc_intern(%4439, %4442) : (i64, i64) -> i64
      %4444 = func.call @cc_nil_value() : () -> i64
      %4445 = func.call @cc_cons(%4443, %4444) : (i64, i64) -> i64
      %4446 = func.call @cc_values_pack(%4445) : (i64) -> i64
      %4447 = func.call @cc_set_symbol_value(%4443, %4436) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4436) : (i64) -> ()
      %4448 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4448 : i64
    }
    %4449 = func.call @cc_nil_value() : () -> i64
    %4450 = func.call @cc_errorp(%4433) : (i64) -> i64
    %4451 = arith.cmpi ne, %4450, %4449 : i64
    %4452 = scf.if %4451 -> (i64) {
      scf.yield %4433 : i64
    } else {
      %4453 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4454 = func.call @cc_make_function_ref_const(%4453) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4454) : (i64) -> ()
      %4455 = func.call @stack_pop_pointer() : () -> i64
      %4456 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4457 = arith.constant 9 : i64
      %4458 = func.call @cc_make_string(%4456, %4457) : (!llvm.ptr, i64) -> i64
      %4459 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4460 = arith.constant 15 : i64
      %4461 = func.call @cc_make_string(%4459, %4460) : (!llvm.ptr, i64) -> i64
      %4462 = func.call @cc_intern(%4458, %4461) : (i64, i64) -> i64
      %4463 = func.call @cc_nil_value() : () -> i64
      %4464 = func.call @cc_cons(%4462, %4463) : (i64, i64) -> i64
      %4465 = func.call @cc_values_pack(%4464) : (i64) -> i64
      %4466 = func.call @cc_set_symbol_value(%4462, %4455) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4455) : (i64) -> ()
      %4467 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4467 : i64
    }
    %4468 = func.call @cc_nil_value() : () -> i64
    %4469 = func.call @cc_errorp(%4452) : (i64) -> i64
    %4470 = arith.cmpi ne, %4469, %4468 : i64
    %4471 = scf.if %4470 -> (i64) {
      scf.yield %4452 : i64
    } else {
      %4472 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4473 = func.call @cc_make_function_ref_const(%4472) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4473) : (i64) -> ()
      %4474 = func.call @stack_pop_pointer() : () -> i64
      %4475 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4476 = arith.constant 9 : i64
      %4477 = func.call @cc_make_string(%4475, %4476) : (!llvm.ptr, i64) -> i64
      %4478 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4479 = arith.constant 15 : i64
      %4480 = func.call @cc_make_string(%4478, %4479) : (!llvm.ptr, i64) -> i64
      %4481 = func.call @cc_intern(%4477, %4480) : (i64, i64) -> i64
      %4482 = func.call @cc_nil_value() : () -> i64
      %4483 = func.call @cc_cons(%4481, %4482) : (i64, i64) -> i64
      %4484 = func.call @cc_values_pack(%4483) : (i64) -> i64
      %4485 = func.call @cc_set_symbol_value(%4481, %4474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4474) : (i64) -> ()
      %4486 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4486 : i64
    }
    %4487 = func.call @cc_nil_value() : () -> i64
    %4488 = func.call @cc_errorp(%4471) : (i64) -> i64
    %4489 = arith.cmpi ne, %4488, %4487 : i64
    %4490 = scf.if %4489 -> (i64) {
      scf.yield %4471 : i64
    } else {
      %4491 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4492 = func.call @cc_make_function_ref_const(%4491) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4492) : (i64) -> ()
      %4493 = func.call @stack_pop_pointer() : () -> i64
      %4494 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4495 = arith.constant 9 : i64
      %4496 = func.call @cc_make_string(%4494, %4495) : (!llvm.ptr, i64) -> i64
      %4497 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4498 = arith.constant 15 : i64
      %4499 = func.call @cc_make_string(%4497, %4498) : (!llvm.ptr, i64) -> i64
      %4500 = func.call @cc_intern(%4496, %4499) : (i64, i64) -> i64
      %4501 = func.call @cc_nil_value() : () -> i64
      %4502 = func.call @cc_cons(%4500, %4501) : (i64, i64) -> i64
      %4503 = func.call @cc_values_pack(%4502) : (i64) -> i64
      %4504 = func.call @cc_set_symbol_value(%4500, %4493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4493) : (i64) -> ()
      %4505 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4505 : i64
    }
    %4506 = func.call @cc_nil_value() : () -> i64
    %4507 = func.call @cc_errorp(%4490) : (i64) -> i64
    %4508 = arith.cmpi ne, %4507, %4506 : i64
    %4509 = scf.if %4508 -> (i64) {
      scf.yield %4490 : i64
    } else {
      %4510 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4511 = func.call @cc_make_function_ref_const(%4510) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4511) : (i64) -> ()
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4514 = arith.constant 9 : i64
      %4515 = func.call @cc_make_string(%4513, %4514) : (!llvm.ptr, i64) -> i64
      %4516 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4517 = arith.constant 15 : i64
      %4518 = func.call @cc_make_string(%4516, %4517) : (!llvm.ptr, i64) -> i64
      %4519 = func.call @cc_intern(%4515, %4518) : (i64, i64) -> i64
      %4520 = func.call @cc_nil_value() : () -> i64
      %4521 = func.call @cc_cons(%4519, %4520) : (i64, i64) -> i64
      %4522 = func.call @cc_values_pack(%4521) : (i64) -> i64
      %4523 = func.call @cc_set_symbol_value(%4519, %4512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4512) : (i64) -> ()
      %4524 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4524 : i64
    }
    %4525 = func.call @cc_nil_value() : () -> i64
    %4526 = func.call @cc_errorp(%4509) : (i64) -> i64
    %4527 = arith.cmpi ne, %4526, %4525 : i64
    %4528 = scf.if %4527 -> (i64) {
      scf.yield %4509 : i64
    } else {
      %4529 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4530 = func.call @cc_make_function_ref_const(%4529) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4530) : (i64) -> ()
      %4531 = func.call @stack_pop_pointer() : () -> i64
      %4532 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4533 = arith.constant 9 : i64
      %4534 = func.call @cc_make_string(%4532, %4533) : (!llvm.ptr, i64) -> i64
      %4535 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4536 = arith.constant 15 : i64
      %4537 = func.call @cc_make_string(%4535, %4536) : (!llvm.ptr, i64) -> i64
      %4538 = func.call @cc_intern(%4534, %4537) : (i64, i64) -> i64
      %4539 = func.call @cc_nil_value() : () -> i64
      %4540 = func.call @cc_cons(%4538, %4539) : (i64, i64) -> i64
      %4541 = func.call @cc_values_pack(%4540) : (i64) -> i64
      %4542 = func.call @cc_set_symbol_value(%4538, %4531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4531) : (i64) -> ()
      %4543 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4543 : i64
    }
    %4544 = func.call @cc_nil_value() : () -> i64
    %4545 = func.call @cc_errorp(%4528) : (i64) -> i64
    %4546 = arith.cmpi ne, %4545, %4544 : i64
    %4547 = scf.if %4546 -> (i64) {
      scf.yield %4528 : i64
    } else {
      %4548 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4549 = func.call @cc_make_function_ref_const(%4548) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4549) : (i64) -> ()
      %4550 = func.call @stack_pop_pointer() : () -> i64
      %4551 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4552 = arith.constant 9 : i64
      %4553 = func.call @cc_make_string(%4551, %4552) : (!llvm.ptr, i64) -> i64
      %4554 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4555 = arith.constant 15 : i64
      %4556 = func.call @cc_make_string(%4554, %4555) : (!llvm.ptr, i64) -> i64
      %4557 = func.call @cc_intern(%4553, %4556) : (i64, i64) -> i64
      %4558 = func.call @cc_nil_value() : () -> i64
      %4559 = func.call @cc_cons(%4557, %4558) : (i64, i64) -> i64
      %4560 = func.call @cc_values_pack(%4559) : (i64) -> i64
      %4561 = func.call @cc_set_symbol_value(%4557, %4550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4550) : (i64) -> ()
      %4562 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4562 : i64
    }
    %4563 = func.call @cc_nil_value() : () -> i64
    %4564 = func.call @cc_errorp(%4547) : (i64) -> i64
    %4565 = arith.cmpi ne, %4564, %4563 : i64
    %4566 = scf.if %4565 -> (i64) {
      scf.yield %4547 : i64
    } else {
      %4567 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4568 = func.call @cc_make_function_ref_const(%4567) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4568) : (i64) -> ()
      %4569 = func.call @stack_pop_pointer() : () -> i64
      %4570 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4571 = arith.constant 9 : i64
      %4572 = func.call @cc_make_string(%4570, %4571) : (!llvm.ptr, i64) -> i64
      %4573 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4574 = arith.constant 15 : i64
      %4575 = func.call @cc_make_string(%4573, %4574) : (!llvm.ptr, i64) -> i64
      %4576 = func.call @cc_intern(%4572, %4575) : (i64, i64) -> i64
      %4577 = func.call @cc_nil_value() : () -> i64
      %4578 = func.call @cc_cons(%4576, %4577) : (i64, i64) -> i64
      %4579 = func.call @cc_values_pack(%4578) : (i64) -> i64
      %4580 = func.call @cc_set_symbol_value(%4576, %4569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4569) : (i64) -> ()
      %4581 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4581 : i64
    }
    %4582 = func.call @cc_nil_value() : () -> i64
    %4583 = func.call @cc_errorp(%4566) : (i64) -> i64
    %4584 = arith.cmpi ne, %4583, %4582 : i64
    %4585 = scf.if %4584 -> (i64) {
      scf.yield %4566 : i64
    } else {
      %4586 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4587 = arith.constant 16 : i64
      %4588 = func.call @cc_make_string(%4586, %4587) : (!llvm.ptr, i64) -> i64
      %4589 = func.call @cc_nil_value() : () -> i64
      %4590 = func.call @cc_intern(%4588, %4589) : (i64, i64) -> i64
      %4591 = func.call @cc_nil_value() : () -> i64
      %4592 = func.call @cc_cons(%4590, %4591) : (i64, i64) -> i64
      %4593 = func.call @cc_values_pack(%4592) : (i64) -> i64
      func.call @stack_push_pointer(%4590) : (i64) -> ()
      %4594 = func.call @stack_pop_pointer() : () -> i64
      %4595 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4596 = arith.constant 3 : i64
      %4597 = func.call @cc_make_string(%4595, %4596) : (!llvm.ptr, i64) -> i64
      %4598 = func.call @cc_nil_value() : () -> i64
      %4599 = func.call @cc_intern(%4597, %4598) : (i64, i64) -> i64
      %4600 = func.call @cc_nil_value() : () -> i64
      %4601 = func.call @cc_cons(%4599, %4600) : (i64, i64) -> i64
      %4602 = func.call @cc_values_pack(%4601) : (i64) -> i64
      func.call @stack_push_pointer(%4599) : (i64) -> ()
      %4603 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4604 = arith.constant 3 : i64
      %4605 = func.call @cc_make_string(%4603, %4604) : (!llvm.ptr, i64) -> i64
      %4606 = func.call @cc_nil_value() : () -> i64
      %4607 = func.call @cc_intern(%4605, %4606) : (i64, i64) -> i64
      %4608 = func.call @cc_nil_value() : () -> i64
      %4609 = func.call @cc_cons(%4607, %4608) : (i64, i64) -> i64
      %4610 = func.call @cc_values_pack(%4609) : (i64) -> i64
      func.call @stack_push_pointer(%4607) : (i64) -> ()
      %4611 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4612 = arith.constant 11 : i64
      %4613 = func.call @cc_make_string(%4611, %4612) : (!llvm.ptr, i64) -> i64
      %4614 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4615 = arith.constant 3 : i64
      %4616 = func.call @cc_make_string(%4614, %4615) : (!llvm.ptr, i64) -> i64
      %4617 = func.call @cc_intern(%4613, %4616) : (i64, i64) -> i64
      %4618 = func.call @cc_nil_value() : () -> i64
      %4619 = func.call @cc_cons(%4617, %4618) : (i64, i64) -> i64
      %4620 = func.call @cc_values_pack(%4619) : (i64) -> i64
      func.call @stack_push_pointer(%4617) : (i64) -> ()
      %4621 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4622 = arith.constant 23 : i64
      %4623 = func.call @cc_make_string(%4621, %4622) : (!llvm.ptr, i64) -> i64
      %4624 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4625 = arith.constant 3 : i64
      %4626 = func.call @cc_make_string(%4624, %4625) : (!llvm.ptr, i64) -> i64
      %4627 = func.call @cc_intern(%4623, %4626) : (i64, i64) -> i64
      %4628 = func.call @cc_nil_value() : () -> i64
      %4629 = func.call @cc_cons(%4627, %4628) : (i64, i64) -> i64
      %4630 = func.call @cc_values_pack(%4629) : (i64) -> i64
      func.call @stack_push_pointer(%4627) : (i64) -> ()
      %4631 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4632 = arith.constant 7 : i64
      %4633 = func.call @cc_make_string(%4631, %4632) : (!llvm.ptr, i64) -> i64
      %4634 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4635 = arith.constant 7 : i64
      %4636 = func.call @cc_make_string(%4634, %4635) : (!llvm.ptr, i64) -> i64
      %4637 = func.call @cc_intern(%4633, %4636) : (i64, i64) -> i64
      %4638 = func.call @cc_nil_value() : () -> i64
      %4639 = func.call @cc_cons(%4637, %4638) : (i64, i64) -> i64
      %4640 = func.call @cc_values_pack(%4639) : (i64) -> i64
      func.call @stack_push_pointer(%4637) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4641 = func.call @stack_pop_pointer() : () -> i64
      %4642 = func.call @stack_pop_pointer() : () -> i64
      %4643 = func.call @cc_cons(%4642, %4641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4643) : (i64) -> ()
      %4644 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4645 = arith.constant 3 : i64
      %4646 = func.call @cc_make_string(%4644, %4645) : (!llvm.ptr, i64) -> i64
      %4647 = func.call @cc_nil_value() : () -> i64
      %4648 = func.call @cc_intern(%4646, %4647) : (i64, i64) -> i64
      %4649 = func.call @cc_nil_value() : () -> i64
      %4650 = func.call @cc_cons(%4648, %4649) : (i64, i64) -> i64
      %4651 = func.call @cc_values_pack(%4650) : (i64) -> i64
      func.call @stack_push_pointer(%4648) : (i64) -> ()
      %4652 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4653 = arith.constant 1 : i64
      %4654 = func.call @cc_make_string(%4652, %4653) : (!llvm.ptr, i64) -> i64
      %4655 = func.call @cc_nil_value() : () -> i64
      %4656 = func.call @cc_intern(%4654, %4655) : (i64, i64) -> i64
      %4657 = func.call @cc_nil_value() : () -> i64
      %4658 = func.call @cc_cons(%4656, %4657) : (i64, i64) -> i64
      %4659 = func.call @cc_values_pack(%4658) : (i64) -> i64
      func.call @stack_push_pointer(%4656) : (i64) -> ()
      %4660 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4661 = arith.constant 6 : i64
      %4662 = func.call @cc_make_string(%4660, %4661) : (!llvm.ptr, i64) -> i64
      %4663 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4664 = arith.constant 11 : i64
      %4665 = func.call @cc_make_string(%4663, %4664) : (!llvm.ptr, i64) -> i64
      %4666 = func.call @cc_intern(%4662, %4665) : (i64, i64) -> i64
      %4667 = func.call @cc_nil_value() : () -> i64
      %4668 = func.call @cc_cons(%4666, %4667) : (i64, i64) -> i64
      %4669 = func.call @cc_values_pack(%4668) : (i64) -> i64
      func.call @stack_push_pointer(%4666) : (i64) -> ()
      %4670 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%4670) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4671 = func.call @stack_pop_pointer() : () -> i64
      %4672 = func.call @stack_pop_pointer() : () -> i64
      %4673 = func.call @cc_cons(%4672, %4671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4673) : (i64) -> ()
      %4674 = func.call @stack_pop_pointer() : () -> i64
      %4675 = func.call @stack_pop_pointer() : () -> i64
      %4676 = func.call @cc_cons(%4675, %4674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4676) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4677 = func.call @stack_pop_pointer() : () -> i64
      %4678 = func.call @stack_pop_pointer() : () -> i64
      %4679 = func.call @cc_cons(%4678, %4677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4679) : (i64) -> ()
      %4680 = func.call @stack_pop_pointer() : () -> i64
      %4681 = func.call @stack_pop_pointer() : () -> i64
      %4682 = func.call @cc_cons(%4681, %4680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4682) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4683 = func.call @stack_pop_pointer() : () -> i64
      %4684 = func.call @stack_pop_pointer() : () -> i64
      %4685 = func.call @cc_cons(%4684, %4683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4685) : (i64) -> ()
      %4686 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4687 = arith.constant 1 : i64
      %4688 = func.call @cc_make_string(%4686, %4687) : (!llvm.ptr, i64) -> i64
      %4689 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4690 = arith.constant 11 : i64
      %4691 = func.call @cc_make_string(%4689, %4690) : (!llvm.ptr, i64) -> i64
      %4692 = func.call @cc_intern(%4688, %4691) : (i64, i64) -> i64
      %4693 = func.call @cc_nil_value() : () -> i64
      %4694 = func.call @cc_cons(%4692, %4693) : (i64, i64) -> i64
      %4695 = func.call @cc_values_pack(%4694) : (i64) -> i64
      func.call @stack_push_pointer(%4692) : (i64) -> ()
      %4696 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4697 = arith.constant 9 : i64
      %4698 = func.call @cc_make_string(%4696, %4697) : (!llvm.ptr, i64) -> i64
      %4699 = func.call @cc_nil_value() : () -> i64
      %4700 = func.call @cc_intern(%4698, %4699) : (i64, i64) -> i64
      %4701 = func.call @cc_nil_value() : () -> i64
      %4702 = func.call @cc_cons(%4700, %4701) : (i64, i64) -> i64
      %4703 = func.call @cc_values_pack(%4702) : (i64) -> i64
      func.call @stack_push_pointer(%4700) : (i64) -> ()
      %4704 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4705 = arith.constant 1 : i64
      %4706 = func.call @cc_make_string(%4704, %4705) : (!llvm.ptr, i64) -> i64
      %4707 = func.call @cc_nil_value() : () -> i64
      %4708 = func.call @cc_intern(%4706, %4707) : (i64, i64) -> i64
      %4709 = func.call @cc_nil_value() : () -> i64
      %4710 = func.call @cc_cons(%4708, %4709) : (i64, i64) -> i64
      %4711 = func.call @cc_values_pack(%4710) : (i64) -> i64
      func.call @stack_push_pointer(%4708) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4712 = func.call @stack_pop_pointer() : () -> i64
      %4713 = func.call @stack_pop_pointer() : () -> i64
      %4714 = func.call @cc_cons(%4713, %4712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4714) : (i64) -> ()
      %4715 = func.call @stack_pop_pointer() : () -> i64
      %4716 = func.call @stack_pop_pointer() : () -> i64
      %4717 = func.call @cc_cons(%4716, %4715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4717) : (i64) -> ()
      %4718 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4719 = arith.constant 9 : i64
      %4720 = func.call @cc_make_string(%4718, %4719) : (!llvm.ptr, i64) -> i64
      %4721 = func.call @cc_nil_value() : () -> i64
      %4722 = func.call @cc_intern(%4720, %4721) : (i64, i64) -> i64
      %4723 = func.call @cc_nil_value() : () -> i64
      %4724 = func.call @cc_cons(%4722, %4723) : (i64, i64) -> i64
      %4725 = func.call @cc_values_pack(%4724) : (i64) -> i64
      func.call @stack_push_pointer(%4722) : (i64) -> ()
      %4726 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4727 = arith.constant 1 : i64
      %4728 = func.call @cc_make_string(%4726, %4727) : (!llvm.ptr, i64) -> i64
      %4729 = func.call @cc_nil_value() : () -> i64
      %4730 = func.call @cc_intern(%4728, %4729) : (i64, i64) -> i64
      %4731 = func.call @cc_nil_value() : () -> i64
      %4732 = func.call @cc_cons(%4730, %4731) : (i64, i64) -> i64
      %4733 = func.call @cc_values_pack(%4732) : (i64) -> i64
      func.call @stack_push_pointer(%4730) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4734 = func.call @stack_pop_pointer() : () -> i64
      %4735 = func.call @stack_pop_pointer() : () -> i64
      %4736 = func.call @cc_cons(%4735, %4734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4736) : (i64) -> ()
      %4737 = func.call @stack_pop_pointer() : () -> i64
      %4738 = func.call @stack_pop_pointer() : () -> i64
      %4739 = func.call @cc_cons(%4738, %4737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4740 = func.call @stack_pop_pointer() : () -> i64
      %4741 = func.call @stack_pop_pointer() : () -> i64
      %4742 = func.call @cc_cons(%4741, %4740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4742) : (i64) -> ()
      %4743 = func.call @stack_pop_pointer() : () -> i64
      %4744 = func.call @stack_pop_pointer() : () -> i64
      %4745 = func.call @cc_cons(%4744, %4743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4745) : (i64) -> ()
      %4746 = func.call @stack_pop_pointer() : () -> i64
      %4747 = func.call @stack_pop_pointer() : () -> i64
      %4748 = func.call @cc_cons(%4747, %4746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4748) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4749 = func.call @stack_pop_pointer() : () -> i64
      %4750 = func.call @stack_pop_pointer() : () -> i64
      %4751 = func.call @cc_cons(%4750, %4749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4751) : (i64) -> ()
      %4752 = func.call @stack_pop_pointer() : () -> i64
      %4753 = func.call @stack_pop_pointer() : () -> i64
      %4754 = func.call @cc_cons(%4753, %4752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4754) : (i64) -> ()
      %4755 = func.call @stack_pop_pointer() : () -> i64
      %4756 = func.call @stack_pop_pointer() : () -> i64
      %4757 = func.call @cc_cons(%4756, %4755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4757) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4758 = func.call @stack_pop_pointer() : () -> i64
      %4759 = func.call @stack_pop_pointer() : () -> i64
      %4760 = func.call @cc_cons(%4759, %4758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4760) : (i64) -> ()
      %4761 = func.call @stack_pop_pointer() : () -> i64
      %4762 = func.call @stack_pop_pointer() : () -> i64
      %4763 = func.call @cc_cons(%4762, %4761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4763) : (i64) -> ()
      %4764 = func.call @stack_pop_pointer() : () -> i64
      %4765 = func.call @stack_pop_pointer() : () -> i64
      %4766 = func.call @cc_cons(%4765, %4764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4767 = func.call @stack_pop_pointer() : () -> i64
      %4768 = func.call @stack_pop_pointer() : () -> i64
      %4769 = func.call @cc_cons(%4768, %4767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4769) : (i64) -> ()
      %4770 = func.call @stack_pop_pointer() : () -> i64
      %4771 = func.call @stack_pop_pointer() : () -> i64
      %4772 = func.call @cc_cons(%4771, %4770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4773 = func.call @stack_pop_pointer() : () -> i64
      %4774 = func.call @stack_pop_pointer() : () -> i64
      %4775 = func.call @cc_cons(%4774, %4773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4775) : (i64) -> ()
      %4776 = func.call @stack_pop_pointer() : () -> i64
      %4777 = func.call @stack_pop_pointer() : () -> i64
      %4778 = func.call @cc_cons(%4777, %4776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4779 = func.call @stack_pop_pointer() : () -> i64
      %4780 = func.call @stack_pop_pointer() : () -> i64
      %4781 = func.call @cc_cons(%4780, %4779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4781) : (i64) -> ()
      %4782 = func.call @stack_pop_pointer() : () -> i64
      %4783 = func.call @stack_pop_pointer() : () -> i64
      %4784 = func.call @cc_cons(%4783, %4782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4784) : (i64) -> ()
      %4785 = func.call @stack_pop_pointer() : () -> i64
      %4862 = arith.constant 152926823645211 : i64
      %4863 = arith.constant 0 : i64
      %4864 = func.call @cc_make_closure(%4862, %4863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4864) : (i64) -> ()
      %4865 = func.call @stack_pop_pointer() : () -> i64
      %4866 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4867 = arith.constant 1 : i64
      %4868 = func.call @cc_make_string(%4866, %4867) : (!llvm.ptr, i64) -> i64
      %4869 = func.call @cc_nil_value() : () -> i64
      %4870 = func.call @cc_intern(%4868, %4869) : (i64, i64) -> i64
      %4871 = func.call @cc_nil_value() : () -> i64
      %4872 = func.call @cc_cons(%4870, %4871) : (i64, i64) -> i64
      %4873 = func.call @cc_values_pack(%4872) : (i64) -> i64
      func.call @stack_push_pointer(%4870) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4874 = func.call @stack_pop_pointer() : () -> i64
      %4875 = func.call @stack_pop_pointer() : () -> i64
      %4876 = func.call @cc_cons(%4875, %4874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4876) : (i64) -> ()
      %4877 = func.call @stack_pop_pointer() : () -> i64
      %4878 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4879 = arith.constant 11 : i64
      %4880 = func.call @cc_make_string(%4878, %4879) : (!llvm.ptr, i64) -> i64
      %4881 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4882 = arith.constant 7 : i64
      %4883 = func.call @cc_make_string(%4881, %4882) : (!llvm.ptr, i64) -> i64
      %4884 = func.call @cc_intern(%4880, %4883) : (i64, i64) -> i64
      %4885 = func.call @cc_nil_value() : () -> i64
      %4886 = func.call @cc_cons(%4884, %4885) : (i64, i64) -> i64
      %4887 = func.call @cc_values_pack(%4886) : (i64) -> i64
      func.call @stack_push_pointer(%4884) : (i64) -> ()
      %4888 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4889 = func.call @stack_pop_pointer() : () -> i64
      %4890 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4891 = arith.constant 4 : i64
      %4892 = func.call @cc_make_string(%4890, %4891) : (!llvm.ptr, i64) -> i64
      %4893 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4894 = arith.constant 7 : i64
      %4895 = func.call @cc_make_string(%4893, %4894) : (!llvm.ptr, i64) -> i64
      %4896 = func.call @cc_intern(%4892, %4895) : (i64, i64) -> i64
      %4897 = func.call @cc_nil_value() : () -> i64
      %4898 = func.call @cc_cons(%4896, %4897) : (i64, i64) -> i64
      %4899 = func.call @cc_values_pack(%4898) : (i64) -> i64
      func.call @stack_push_pointer(%4896) : (i64) -> ()
      %4900 = func.call @stack_pop_pointer() : () -> i64
      %4901 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4902 = arith.constant 6 : i64
      %4903 = func.call @cc_make_string(%4901, %4902) : (!llvm.ptr, i64) -> i64
      %4904 = func.call @cc_nil_value() : () -> i64
      %4905 = func.call @cc_intern(%4903, %4904) : (i64, i64) -> i64
      %4906 = func.call @cc_nil_value() : () -> i64
      %4907 = func.call @cc_cons(%4905, %4906) : (i64, i64) -> i64
      %4908 = func.call @cc_values_pack(%4907) : (i64) -> i64
      func.call @stack_push_pointer(%4905) : (i64) -> ()
      %4909 = func.call @stack_pop_pointer() : () -> i64
      %4910 = func.call @cc_nil_value() : () -> i64
      %4911 = func.call @cc_errorp(%4594) : (i64) -> i64
      %4912 = arith.cmpi ne, %4911, %4910 : i64
      %4913 = arith.cmpi eq, %4910, %4910 : i64
      %4914 = arith.andi %4912, %4913 : i1
      %4915 = scf.if %4914 -> (i64) {
        scf.yield %4594 : i64
      } else {
        scf.yield %4910 : i64
      }
      %4916 = func.call @cc_errorp(%4785) : (i64) -> i64
      %4917 = arith.cmpi ne, %4916, %4910 : i64
      %4918 = arith.cmpi eq, %4915, %4910 : i64
      %4919 = arith.andi %4917, %4918 : i1
      %4920 = scf.if %4919 -> (i64) {
        scf.yield %4785 : i64
      } else {
        scf.yield %4915 : i64
      }
      %4921 = func.call @cc_errorp(%4865) : (i64) -> i64
      %4922 = arith.cmpi ne, %4921, %4910 : i64
      %4923 = arith.cmpi eq, %4920, %4910 : i64
      %4924 = arith.andi %4922, %4923 : i1
      %4925 = scf.if %4924 -> (i64) {
        scf.yield %4865 : i64
      } else {
        scf.yield %4920 : i64
      }
      %4926 = func.call @cc_errorp(%4877) : (i64) -> i64
      %4927 = arith.cmpi ne, %4926, %4910 : i64
      %4928 = arith.cmpi eq, %4925, %4910 : i64
      %4929 = arith.andi %4927, %4928 : i1
      %4930 = scf.if %4929 -> (i64) {
        scf.yield %4877 : i64
      } else {
        scf.yield %4925 : i64
      }
      %4931 = func.call @cc_errorp(%4888) : (i64) -> i64
      %4932 = arith.cmpi ne, %4931, %4910 : i64
      %4933 = arith.cmpi eq, %4930, %4910 : i64
      %4934 = arith.andi %4932, %4933 : i1
      %4935 = scf.if %4934 -> (i64) {
        scf.yield %4888 : i64
      } else {
        scf.yield %4930 : i64
      }
      %4936 = func.call @cc_errorp(%4889) : (i64) -> i64
      %4937 = arith.cmpi ne, %4936, %4910 : i64
      %4938 = arith.cmpi eq, %4935, %4910 : i64
      %4939 = arith.andi %4937, %4938 : i1
      %4940 = scf.if %4939 -> (i64) {
        scf.yield %4889 : i64
      } else {
        scf.yield %4935 : i64
      }
      %4941 = func.call @cc_errorp(%4900) : (i64) -> i64
      %4942 = arith.cmpi ne, %4941, %4910 : i64
      %4943 = arith.cmpi eq, %4940, %4910 : i64
      %4944 = arith.andi %4942, %4943 : i1
      %4945 = scf.if %4944 -> (i64) {
        scf.yield %4900 : i64
      } else {
        scf.yield %4940 : i64
      }
      %4946 = func.call @cc_errorp(%4909) : (i64) -> i64
      %4947 = arith.cmpi ne, %4946, %4910 : i64
      %4948 = arith.cmpi eq, %4945, %4910 : i64
      %4949 = arith.andi %4947, %4948 : i1
      %4950 = scf.if %4949 -> (i64) {
        scf.yield %4909 : i64
      } else {
        scf.yield %4945 : i64
      }
      %4951 = arith.cmpi ne, %4950, %4910 : i64
      scf.if %4951 {
        func.call @stack_push_pointer(%4950) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4594) : (i64) -> ()
        func.call @stack_push_pointer(%4785) : (i64) -> ()
        func.call @stack_push_pointer(%4865) : (i64) -> ()
        func.call @stack_push_pointer(%4877) : (i64) -> ()
        func.call @stack_push_pointer(%4888) : (i64) -> ()
        func.call @stack_push_pointer(%4889) : (i64) -> ()
        func.call @stack_push_pointer(%4900) : (i64) -> ()
        func.call @stack_push_pointer(%4909) : (i64) -> ()
        %4952 = llvm.mlir.addressof @str420 : !llvm.ptr
        %4953 = func.call @cc_make_function_ref_const(%4952) : (!llvm.ptr) -> i64
        %4954 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4953, %4954) : (i64, i64) -> ()
      }
      %4955 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4955 : i64
    }
    %4956 = func.call @cc_nil_value() : () -> i64
    %4957 = func.call @cc_errorp(%4585) : (i64) -> i64
    %4958 = arith.cmpi ne, %4957, %4956 : i64
    %4959 = scf.if %4958 -> (i64) {
      scf.yield %4585 : i64
    } else {
      %4960 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4961 = arith.constant 16 : i64
      %4962 = func.call @cc_make_string(%4960, %4961) : (!llvm.ptr, i64) -> i64
      %4963 = func.call @cc_nil_value() : () -> i64
      %4964 = func.call @cc_intern(%4962, %4963) : (i64, i64) -> i64
      %4965 = func.call @cc_nil_value() : () -> i64
      %4966 = func.call @cc_cons(%4964, %4965) : (i64, i64) -> i64
      %4967 = func.call @cc_values_pack(%4966) : (i64) -> i64
      func.call @stack_push_pointer(%4964) : (i64) -> ()
      %4968 = func.call @stack_pop_pointer() : () -> i64
      %4969 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4970 = arith.constant 13 : i64
      %4971 = func.call @cc_make_string(%4969, %4970) : (!llvm.ptr, i64) -> i64
      %4972 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4973 = arith.constant 11 : i64
      %4974 = func.call @cc_make_string(%4972, %4973) : (!llvm.ptr, i64) -> i64
      %4975 = func.call @cc_intern(%4971, %4974) : (i64, i64) -> i64
      %4976 = func.call @cc_nil_value() : () -> i64
      %4977 = func.call @cc_cons(%4975, %4976) : (i64, i64) -> i64
      %4978 = func.call @cc_values_pack(%4977) : (i64) -> i64
      func.call @stack_push_pointer(%4975) : (i64) -> ()
      %4979 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4980 = arith.constant 6 : i64
      %4981 = func.call @cc_make_string(%4979, %4980) : (!llvm.ptr, i64) -> i64
      %4982 = func.call @cc_nil_value() : () -> i64
      %4983 = func.call @cc_intern(%4981, %4982) : (i64, i64) -> i64
      %4984 = func.call @cc_nil_value() : () -> i64
      %4985 = func.call @cc_cons(%4983, %4984) : (i64, i64) -> i64
      %4986 = func.call @cc_values_pack(%4985) : (i64) -> i64
      func.call @stack_push_pointer(%4983) : (i64) -> ()
      %4987 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4988 = arith.constant 19 : i64
      %4989 = func.call @cc_make_string(%4987, %4988) : (!llvm.ptr, i64) -> i64
      %4990 = func.call @cc_nil_value() : () -> i64
      %4991 = func.call @cc_intern(%4989, %4990) : (i64, i64) -> i64
      %4992 = func.call @cc_nil_value() : () -> i64
      %4993 = func.call @cc_cons(%4991, %4992) : (i64, i64) -> i64
      %4994 = func.call @cc_values_pack(%4993) : (i64) -> i64
      func.call @stack_push_pointer(%4991) : (i64) -> ()
      %4995 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4996 = arith.constant 3 : i64
      %4997 = func.call @cc_make_string(%4995, %4996) : (!llvm.ptr, i64) -> i64
      %4998 = func.call @cc_nil_value() : () -> i64
      %4999 = func.call @cc_intern(%4997, %4998) : (i64, i64) -> i64
      %5000 = func.call @cc_nil_value() : () -> i64
      %5001 = func.call @cc_cons(%4999, %5000) : (i64, i64) -> i64
      %5002 = func.call @cc_values_pack(%5001) : (i64) -> i64
      func.call @stack_push_pointer(%4999) : (i64) -> ()
      %5003 = llvm.mlir.addressof @str427 : !llvm.ptr
      %5004 = arith.constant 1 : i64
      %5005 = func.call @cc_make_string(%5003, %5004) : (!llvm.ptr, i64) -> i64
      %5006 = func.call @cc_nil_value() : () -> i64
      %5007 = func.call @cc_intern(%5005, %5006) : (i64, i64) -> i64
      %5008 = func.call @cc_nil_value() : () -> i64
      %5009 = func.call @cc_cons(%5007, %5008) : (i64, i64) -> i64
      %5010 = func.call @cc_values_pack(%5009) : (i64) -> i64
      func.call @stack_push_pointer(%5007) : (i64) -> ()
      %5011 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5012 = arith.constant 6 : i64
      %5013 = func.call @cc_make_string(%5011, %5012) : (!llvm.ptr, i64) -> i64
      %5014 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5015 = arith.constant 11 : i64
      %5016 = func.call @cc_make_string(%5014, %5015) : (!llvm.ptr, i64) -> i64
      %5017 = func.call @cc_intern(%5013, %5016) : (i64, i64) -> i64
      %5018 = func.call @cc_nil_value() : () -> i64
      %5019 = func.call @cc_cons(%5017, %5018) : (i64, i64) -> i64
      %5020 = func.call @cc_values_pack(%5019) : (i64) -> i64
      func.call @stack_push_pointer(%5017) : (i64) -> ()
      %5021 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%5021) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5022 = func.call @stack_pop_pointer() : () -> i64
      %5023 = func.call @stack_pop_pointer() : () -> i64
      %5024 = func.call @cc_cons(%5023, %5022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5024) : (i64) -> ()
      %5025 = func.call @stack_pop_pointer() : () -> i64
      %5026 = func.call @stack_pop_pointer() : () -> i64
      %5027 = func.call @cc_cons(%5026, %5025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5027) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5028 = func.call @stack_pop_pointer() : () -> i64
      %5029 = func.call @stack_pop_pointer() : () -> i64
      %5030 = func.call @cc_cons(%5029, %5028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5030) : (i64) -> ()
      %5031 = func.call @stack_pop_pointer() : () -> i64
      %5032 = func.call @stack_pop_pointer() : () -> i64
      %5033 = func.call @cc_cons(%5032, %5031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5034 = func.call @stack_pop_pointer() : () -> i64
      %5035 = func.call @stack_pop_pointer() : () -> i64
      %5036 = func.call @cc_cons(%5035, %5034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5036) : (i64) -> ()
      %5037 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5038 = arith.constant 1 : i64
      %5039 = func.call @cc_make_string(%5037, %5038) : (!llvm.ptr, i64) -> i64
      %5040 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5041 = arith.constant 11 : i64
      %5042 = func.call @cc_make_string(%5040, %5041) : (!llvm.ptr, i64) -> i64
      %5043 = func.call @cc_intern(%5039, %5042) : (i64, i64) -> i64
      %5044 = func.call @cc_nil_value() : () -> i64
      %5045 = func.call @cc_cons(%5043, %5044) : (i64, i64) -> i64
      %5046 = func.call @cc_values_pack(%5045) : (i64) -> i64
      func.call @stack_push_pointer(%5043) : (i64) -> ()
      %5047 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5048 = arith.constant 9 : i64
      %5049 = func.call @cc_make_string(%5047, %5048) : (!llvm.ptr, i64) -> i64
      %5050 = func.call @cc_nil_value() : () -> i64
      %5051 = func.call @cc_intern(%5049, %5050) : (i64, i64) -> i64
      %5052 = func.call @cc_nil_value() : () -> i64
      %5053 = func.call @cc_cons(%5051, %5052) : (i64, i64) -> i64
      %5054 = func.call @cc_values_pack(%5053) : (i64) -> i64
      func.call @stack_push_pointer(%5051) : (i64) -> ()
      %5055 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5056 = arith.constant 1 : i64
      %5057 = func.call @cc_make_string(%5055, %5056) : (!llvm.ptr, i64) -> i64
      %5058 = func.call @cc_nil_value() : () -> i64
      %5059 = func.call @cc_intern(%5057, %5058) : (i64, i64) -> i64
      %5060 = func.call @cc_nil_value() : () -> i64
      %5061 = func.call @cc_cons(%5059, %5060) : (i64, i64) -> i64
      %5062 = func.call @cc_values_pack(%5061) : (i64) -> i64
      func.call @stack_push_pointer(%5059) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5063 = func.call @stack_pop_pointer() : () -> i64
      %5064 = func.call @stack_pop_pointer() : () -> i64
      %5065 = func.call @cc_cons(%5064, %5063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5065) : (i64) -> ()
      %5066 = func.call @stack_pop_pointer() : () -> i64
      %5067 = func.call @stack_pop_pointer() : () -> i64
      %5068 = func.call @cc_cons(%5067, %5066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5068) : (i64) -> ()
      %5069 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5070 = arith.constant 9 : i64
      %5071 = func.call @cc_make_string(%5069, %5070) : (!llvm.ptr, i64) -> i64
      %5072 = func.call @cc_nil_value() : () -> i64
      %5073 = func.call @cc_intern(%5071, %5072) : (i64, i64) -> i64
      %5074 = func.call @cc_nil_value() : () -> i64
      %5075 = func.call @cc_cons(%5073, %5074) : (i64, i64) -> i64
      %5076 = func.call @cc_values_pack(%5075) : (i64) -> i64
      func.call @stack_push_pointer(%5073) : (i64) -> ()
      %5077 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5078 = arith.constant 1 : i64
      %5079 = func.call @cc_make_string(%5077, %5078) : (!llvm.ptr, i64) -> i64
      %5080 = func.call @cc_nil_value() : () -> i64
      %5081 = func.call @cc_intern(%5079, %5080) : (i64, i64) -> i64
      %5082 = func.call @cc_nil_value() : () -> i64
      %5083 = func.call @cc_cons(%5081, %5082) : (i64, i64) -> i64
      %5084 = func.call @cc_values_pack(%5083) : (i64) -> i64
      func.call @stack_push_pointer(%5081) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5085 = func.call @stack_pop_pointer() : () -> i64
      %5086 = func.call @stack_pop_pointer() : () -> i64
      %5087 = func.call @cc_cons(%5086, %5085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5087) : (i64) -> ()
      %5088 = func.call @stack_pop_pointer() : () -> i64
      %5089 = func.call @stack_pop_pointer() : () -> i64
      %5090 = func.call @cc_cons(%5089, %5088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5090) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
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
      %5209 = arith.constant 152926823645212 : i64
      %5210 = arith.constant 0 : i64
      %5211 = func.call @cc_make_closure(%5209, %5210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5211) : (i64) -> ()
      %5212 = func.call @stack_pop_pointer() : () -> i64
      %5213 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5214 = arith.constant 4 : i64
      %5215 = func.call @cc_make_string(%5213, %5214) : (!llvm.ptr, i64) -> i64
      %5216 = func.call @cc_nil_value() : () -> i64
      %5217 = func.call @cc_intern(%5215, %5216) : (i64, i64) -> i64
      %5218 = func.call @cc_nil_value() : () -> i64
      %5219 = func.call @cc_cons(%5217, %5218) : (i64, i64) -> i64
      %5220 = func.call @cc_values_pack(%5219) : (i64) -> i64
      func.call @stack_push_pointer(%5217) : (i64) -> ()
      %5221 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5222 = arith.constant 2 : i64
      %5223 = func.call @cc_make_string(%5221, %5222) : (!llvm.ptr, i64) -> i64
      %5224 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5225 = arith.constant 11 : i64
      %5226 = func.call @cc_make_string(%5224, %5225) : (!llvm.ptr, i64) -> i64
      %5227 = func.call @cc_intern(%5223, %5226) : (i64, i64) -> i64
      %5228 = func.call @cc_nil_value() : () -> i64
      %5229 = func.call @cc_cons(%5227, %5228) : (i64, i64) -> i64
      %5230 = func.call @cc_values_pack(%5229) : (i64) -> i64
      func.call @stack_push_pointer(%5227) : (i64) -> ()
      %5231 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5232 = arith.constant 22 : i64
      %5233 = func.call @cc_make_string(%5231, %5232) : (!llvm.ptr, i64) -> i64
      %5234 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5235 = arith.constant 11 : i64
      %5236 = func.call @cc_make_string(%5234, %5235) : (!llvm.ptr, i64) -> i64
      %5237 = func.call @cc_intern(%5233, %5236) : (i64, i64) -> i64
      %5238 = func.call @cc_nil_value() : () -> i64
      %5239 = func.call @cc_cons(%5237, %5238) : (i64, i64) -> i64
      %5240 = func.call @cc_values_pack(%5239) : (i64) -> i64
      func.call @stack_push_pointer(%5237) : (i64) -> ()
      %5241 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5242 = arith.constant 32 : i64
      %5243 = func.call @cc_make_string(%5241, %5242) : (!llvm.ptr, i64) -> i64
      %5244 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5245 = arith.constant 11 : i64
      %5246 = func.call @cc_make_string(%5244, %5245) : (!llvm.ptr, i64) -> i64
      %5247 = func.call @cc_intern(%5243, %5246) : (i64, i64) -> i64
      %5248 = func.call @cc_nil_value() : () -> i64
      %5249 = func.call @cc_cons(%5247, %5248) : (i64, i64) -> i64
      %5250 = func.call @cc_values_pack(%5249) : (i64) -> i64
      func.call @stack_push_pointer(%5247) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5251 = func.call @stack_pop_pointer() : () -> i64
      %5252 = func.call @stack_pop_pointer() : () -> i64
      %5253 = func.call @cc_cons(%5252, %5251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5253) : (i64) -> ()
      %5254 = func.call @stack_pop_pointer() : () -> i64
      %5255 = func.call @stack_pop_pointer() : () -> i64
      %5256 = func.call @cc_cons(%5255, %5254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5256) : (i64) -> ()
      %5257 = func.call @stack_pop_pointer() : () -> i64
      %5258 = func.call @stack_pop_pointer() : () -> i64
      %5259 = func.call @cc_cons(%5258, %5257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5259) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5260 = func.call @stack_pop_pointer() : () -> i64
      %5261 = func.call @stack_pop_pointer() : () -> i64
      %5262 = func.call @cc_cons(%5261, %5260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5262) : (i64) -> ()
      %5263 = func.call @stack_pop_pointer() : () -> i64
      %5264 = func.call @stack_pop_pointer() : () -> i64
      %5265 = func.call @cc_cons(%5264, %5263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5265) : (i64) -> ()
      %5266 = func.call @stack_pop_pointer() : () -> i64
      %5267 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5268 = arith.constant 11 : i64
      %5269 = func.call @cc_make_string(%5267, %5268) : (!llvm.ptr, i64) -> i64
      %5270 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5271 = arith.constant 7 : i64
      %5272 = func.call @cc_make_string(%5270, %5271) : (!llvm.ptr, i64) -> i64
      %5273 = func.call @cc_intern(%5269, %5272) : (i64, i64) -> i64
      %5274 = func.call @cc_nil_value() : () -> i64
      %5275 = func.call @cc_cons(%5273, %5274) : (i64, i64) -> i64
      %5276 = func.call @cc_values_pack(%5275) : (i64) -> i64
      func.call @stack_push_pointer(%5273) : (i64) -> ()
      %5277 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5278 = func.call @stack_pop_pointer() : () -> i64
      %5279 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5280 = arith.constant 4 : i64
      %5281 = func.call @cc_make_string(%5279, %5280) : (!llvm.ptr, i64) -> i64
      %5282 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5283 = arith.constant 7 : i64
      %5284 = func.call @cc_make_string(%5282, %5283) : (!llvm.ptr, i64) -> i64
      %5285 = func.call @cc_intern(%5281, %5284) : (i64, i64) -> i64
      %5286 = func.call @cc_nil_value() : () -> i64
      %5287 = func.call @cc_cons(%5285, %5286) : (i64, i64) -> i64
      %5288 = func.call @cc_values_pack(%5287) : (i64) -> i64
      func.call @stack_push_pointer(%5285) : (i64) -> ()
      %5289 = func.call @stack_pop_pointer() : () -> i64
      %5290 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5291 = arith.constant 5 : i64
      %5292 = func.call @cc_make_string(%5290, %5291) : (!llvm.ptr, i64) -> i64
      %5293 = func.call @cc_nil_value() : () -> i64
      %5294 = func.call @cc_intern(%5292, %5293) : (i64, i64) -> i64
      %5295 = func.call @cc_nil_value() : () -> i64
      %5296 = func.call @cc_cons(%5294, %5295) : (i64, i64) -> i64
      %5297 = func.call @cc_values_pack(%5296) : (i64) -> i64
      func.call @stack_push_pointer(%5294) : (i64) -> ()
      %5298 = func.call @stack_pop_pointer() : () -> i64
      %5299 = func.call @cc_nil_value() : () -> i64
      %5300 = func.call @cc_errorp(%4968) : (i64) -> i64
      %5301 = arith.cmpi ne, %5300, %5299 : i64
      %5302 = arith.cmpi eq, %5299, %5299 : i64
      %5303 = arith.andi %5301, %5302 : i1
      %5304 = scf.if %5303 -> (i64) {
        scf.yield %4968 : i64
      } else {
        scf.yield %5299 : i64
      }
      %5305 = func.call @cc_errorp(%5130) : (i64) -> i64
      %5306 = arith.cmpi ne, %5305, %5299 : i64
      %5307 = arith.cmpi eq, %5304, %5299 : i64
      %5308 = arith.andi %5306, %5307 : i1
      %5309 = scf.if %5308 -> (i64) {
        scf.yield %5130 : i64
      } else {
        scf.yield %5304 : i64
      }
      %5310 = func.call @cc_errorp(%5212) : (i64) -> i64
      %5311 = arith.cmpi ne, %5310, %5299 : i64
      %5312 = arith.cmpi eq, %5309, %5299 : i64
      %5313 = arith.andi %5311, %5312 : i1
      %5314 = scf.if %5313 -> (i64) {
        scf.yield %5212 : i64
      } else {
        scf.yield %5309 : i64
      }
      %5315 = func.call @cc_errorp(%5266) : (i64) -> i64
      %5316 = arith.cmpi ne, %5315, %5299 : i64
      %5317 = arith.cmpi eq, %5314, %5299 : i64
      %5318 = arith.andi %5316, %5317 : i1
      %5319 = scf.if %5318 -> (i64) {
        scf.yield %5266 : i64
      } else {
        scf.yield %5314 : i64
      }
      %5320 = func.call @cc_errorp(%5277) : (i64) -> i64
      %5321 = arith.cmpi ne, %5320, %5299 : i64
      %5322 = arith.cmpi eq, %5319, %5299 : i64
      %5323 = arith.andi %5321, %5322 : i1
      %5324 = scf.if %5323 -> (i64) {
        scf.yield %5277 : i64
      } else {
        scf.yield %5319 : i64
      }
      %5325 = func.call @cc_errorp(%5278) : (i64) -> i64
      %5326 = arith.cmpi ne, %5325, %5299 : i64
      %5327 = arith.cmpi eq, %5324, %5299 : i64
      %5328 = arith.andi %5326, %5327 : i1
      %5329 = scf.if %5328 -> (i64) {
        scf.yield %5278 : i64
      } else {
        scf.yield %5324 : i64
      }
      %5330 = func.call @cc_errorp(%5289) : (i64) -> i64
      %5331 = arith.cmpi ne, %5330, %5299 : i64
      %5332 = arith.cmpi eq, %5329, %5299 : i64
      %5333 = arith.andi %5331, %5332 : i1
      %5334 = scf.if %5333 -> (i64) {
        scf.yield %5289 : i64
      } else {
        scf.yield %5329 : i64
      }
      %5335 = func.call @cc_errorp(%5298) : (i64) -> i64
      %5336 = arith.cmpi ne, %5335, %5299 : i64
      %5337 = arith.cmpi eq, %5334, %5299 : i64
      %5338 = arith.andi %5336, %5337 : i1
      %5339 = scf.if %5338 -> (i64) {
        scf.yield %5298 : i64
      } else {
        scf.yield %5334 : i64
      }
      %5340 = arith.cmpi ne, %5339, %5299 : i64
      scf.if %5340 {
        func.call @stack_push_pointer(%5339) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4968) : (i64) -> ()
        func.call @stack_push_pointer(%5130) : (i64) -> ()
        func.call @stack_push_pointer(%5212) : (i64) -> ()
        func.call @stack_push_pointer(%5266) : (i64) -> ()
        func.call @stack_push_pointer(%5277) : (i64) -> ()
        func.call @stack_push_pointer(%5278) : (i64) -> ()
        func.call @stack_push_pointer(%5289) : (i64) -> ()
        func.call @stack_push_pointer(%5298) : (i64) -> ()
        %5341 = llvm.mlir.addressof @str450 : !llvm.ptr
        %5342 = func.call @cc_make_function_ref_const(%5341) : (!llvm.ptr) -> i64
        %5343 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5342, %5343) : (i64, i64) -> ()
      }
      %5344 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5344 : i64
    }
    func.call @stack_push_pointer(%4959) : (i64) -> ()
    %5345 = func.call @stack_pop_pointer() : () -> i64
    %5346 = func.call @cc_multiple_value_list(%5345) : (i64) -> i64
    %5347 = llvm.mlir.addressof @str451 : !llvm.ptr
    %5348 = arith.constant 38 : i64
    %5349 = func.call @cc_make_string(%5347, %5348) : (!llvm.ptr, i64) -> i64
    %5350 = func.call @cc_nil_value() : () -> i64
    %5351 = func.call @cc_intern(%5349, %5350) : (i64, i64) -> i64
    %5352 = func.call @cc_nil_value() : () -> i64
    %5353 = func.call @cc_cons(%5351, %5352) : (i64, i64) -> i64
    %5354 = func.call @cc_values_pack(%5353) : (i64) -> i64
    %5355 = func.call @cc_symbol_value(%5351) : (i64) -> i64
    %5356 = llvm.mlir.addressof @str452 : !llvm.ptr
    %5357 = arith.constant 40 : i64
    %5358 = func.call @cc_make_string(%5356, %5357) : (!llvm.ptr, i64) -> i64
    %5359 = func.call @cc_nil_value() : () -> i64
    %5360 = func.call @cc_intern(%5358, %5359) : (i64, i64) -> i64
    %5361 = func.call @cc_nil_value() : () -> i64
    %5362 = func.call @cc_cons(%5360, %5361) : (i64, i64) -> i64
    %5363 = func.call @cc_values_pack(%5362) : (i64) -> i64
    %5364 = func.call @cc_symbol_value(%5360) : (i64) -> i64
    %5365 = func.call @cc_nil_value() : () -> i64
    %5366 = arith.cmpi ne, %5355, %5365 : i64
    %5367 = scf.if %5366 -> (i64) {
      scf.yield %5364 : i64
    } else {
      scf.yield %5346 : i64
    }
    %5368 = func.call @cc_values_pack(%5367) : (i64) -> i64
    func.call @stack_push_pointer(%5368) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"local_foo_152926823645198"() {
    %1524 = llvm.mlir.addressof @str126 : !llvm.ptr
    %1525 = arith.constant 25 : i64
    %1526 = func.call @cc_make_string(%1524, %1525) : (!llvm.ptr, i64) -> i64
    %1527 = func.call @cc_nil_value() : () -> i64
    %1528 = func.call @cc_intern(%1526, %1527) : (i64, i64) -> i64
    %1529 = func.call @cc_nil_value() : () -> i64
    %1530 = func.call @cc_cons(%1528, %1529) : (i64, i64) -> i64
    %1531 = func.call @cc_values_pack(%1530) : (i64) -> i64
    %1532 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%1528, %1532) : (i64, i64) -> ()
    %1533 = func.call @cc_nil_value() : () -> i64
    %1534 = llvm.mlir.addressof @str127 : !llvm.ptr
    %1535 = arith.constant 38 : i64
    %1536 = func.call @cc_make_string(%1534, %1535) : (!llvm.ptr, i64) -> i64
    %1537 = func.call @cc_nil_value() : () -> i64
    %1538 = func.call @cc_intern(%1536, %1537) : (i64, i64) -> i64
    %1539 = func.call @cc_nil_value() : () -> i64
    %1540 = func.call @cc_cons(%1538, %1539) : (i64, i64) -> i64
    %1541 = func.call @cc_values_pack(%1540) : (i64) -> i64
    %1542 = func.call @cc_set_symbol_value(%1538, %1533) : (i64, i64) -> i64
    %1543 = llvm.mlir.addressof @str128 : !llvm.ptr
    %1544 = arith.constant 39 : i64
    %1545 = func.call @cc_make_string(%1543, %1544) : (!llvm.ptr, i64) -> i64
    %1546 = func.call @cc_nil_value() : () -> i64
    %1547 = func.call @cc_intern(%1545, %1546) : (i64, i64) -> i64
    %1548 = func.call @cc_nil_value() : () -> i64
    %1549 = func.call @cc_cons(%1547, %1548) : (i64, i64) -> i64
    %1550 = func.call @cc_values_pack(%1549) : (i64) -> i64
    %1551 = func.call @cc_set_symbol_value(%1547, %1533) : (i64, i64) -> i64
    %1552 = llvm.mlir.addressof @str129 : !llvm.ptr
    %1553 = arith.constant 40 : i64
    %1554 = func.call @cc_make_string(%1552, %1553) : (!llvm.ptr, i64) -> i64
    %1555 = func.call @cc_nil_value() : () -> i64
    %1556 = func.call @cc_intern(%1554, %1555) : (i64, i64) -> i64
    %1557 = func.call @cc_nil_value() : () -> i64
    %1558 = func.call @cc_cons(%1556, %1557) : (i64, i64) -> i64
    %1559 = func.call @cc_values_pack(%1558) : (i64) -> i64
    %1560 = func.call @cc_set_symbol_value(%1556, %1533) : (i64, i64) -> i64
    %1561 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%1561) : (i64) -> ()
    %1562 = func.call @stack_pop_pointer() : () -> i64
    %1563 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%1563) : (i64) -> ()
    %1564 = func.call @stack_pop_pointer() : () -> i64
    %1565 = func.call @cc_random(%1564) : (i64) -> i64
    func.call @stack_push_pointer(%1565) : (i64) -> ()
    %1566 = func.call @stack_pop_pointer() : () -> i64
    %1567 = arith.constant 1 : i1
    %1569 = arith.constant 3 : i64
    %1568 = arith.andi %1562, %1569 : i64
    %1570 = arith.constant 0 : i64
    %1571 = arith.cmpi eq, %1568, %1570 : i64
    %1573 = arith.constant 3 : i64
    %1572 = arith.andi %1566, %1573 : i64
    %1574 = arith.constant 0 : i64
    %1575 = arith.cmpi eq, %1572, %1574 : i64
    %1576 = arith.andi %1571, %1575 : i1
    %1577 = scf.if %1576 -> (i1) {
      %1578 = arith.constant 2 : i64
      %1579 = arith.shrsi %1562, %1578 : i64
      %1580 = arith.constant 2 : i64
      %1581 = arith.shrsi %1566, %1580 : i64
      %1582 = arith.cmpi sgt, %1579, %1581 : i64
      scf.yield %1582 : i1
    } else {
      %1583 = func.call @cc_gt(%1562, %1566) : (i64, i64) -> i64
      %1584 = func.call @cc_nil_value() : () -> i64
      %1585 = arith.cmpi ne, %1583, %1584 : i64
      scf.yield %1585 : i1
    }
    %1586 = arith.andi %1567, %1577 : i1
    %1587 = func.call @cc_nil_value() : () -> i64
    %1588 = func.call @cc_t_value() : () -> i64
    %1589 = scf.if %1586 -> (i64) {
      scf.yield %1588 : i64
    } else {
      scf.yield %1587 : i64
    }
    func.call @stack_push_pointer(%1589) : (i64) -> ()
    %1590 = func.call @stack_pop_pointer() : () -> i64
    %1591 = func.call @cc_nil_value() : () -> i64
    %1592 = arith.cmpi ne, %1590, %1591 : i64
    scf.if %1592 {
      %1593 = arith.constant 0.0 : f64
      %1594 = func.call @cc_box_single_float(%1593) : (f64) -> i64
      func.call @stack_push_pointer(%1594) : (i64) -> ()
    } else {
      %1595 = arith.constant 0.0 : f64
      %1596 = func.call @cc_box_single_float(%1595) : (f64) -> i64
      func.call @stack_push_pointer(%1596) : (i64) -> ()
    }
    %1597 = func.call @stack_pop_pointer() : () -> i64
    %1598 = func.call @cc_multiple_value_list(%1597) : (i64) -> i64
    %1599 = llvm.mlir.addressof @str130 : !llvm.ptr
    %1600 = arith.constant 38 : i64
    %1601 = func.call @cc_make_string(%1599, %1600) : (!llvm.ptr, i64) -> i64
    %1602 = func.call @cc_nil_value() : () -> i64
    %1603 = func.call @cc_intern(%1601, %1602) : (i64, i64) -> i64
    %1604 = func.call @cc_nil_value() : () -> i64
    %1605 = func.call @cc_cons(%1603, %1604) : (i64, i64) -> i64
    %1606 = func.call @cc_values_pack(%1605) : (i64) -> i64
    %1607 = func.call @cc_symbol_value(%1603) : (i64) -> i64
    %1608 = llvm.mlir.addressof @str131 : !llvm.ptr
    %1609 = arith.constant 40 : i64
    %1610 = func.call @cc_make_string(%1608, %1609) : (!llvm.ptr, i64) -> i64
    %1611 = func.call @cc_nil_value() : () -> i64
    %1612 = func.call @cc_intern(%1610, %1611) : (i64, i64) -> i64
    %1613 = func.call @cc_nil_value() : () -> i64
    %1614 = func.call @cc_cons(%1612, %1613) : (i64, i64) -> i64
    %1615 = func.call @cc_values_pack(%1614) : (i64) -> i64
    %1616 = func.call @cc_symbol_value(%1612) : (i64) -> i64
    %1617 = func.call @cc_nil_value() : () -> i64
    %1618 = arith.cmpi ne, %1607, %1617 : i64
    %1619 = scf.if %1618 -> (i64) {
      scf.yield %1616 : i64
    } else {
      scf.yield %1598 : i64
    }
    %1620 = func.call @cc_values_pack(%1619) : (i64) -> i64
    func.call @stack_push_pointer(%1620) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"local_bar_152926823645199"() {
    %1621 = llvm.mlir.addressof @str132 : !llvm.ptr
    %1622 = arith.constant 25 : i64
    %1623 = func.call @cc_make_string(%1621, %1622) : (!llvm.ptr, i64) -> i64
    %1624 = func.call @cc_nil_value() : () -> i64
    %1625 = func.call @cc_intern(%1623, %1624) : (i64, i64) -> i64
    %1626 = func.call @cc_nil_value() : () -> i64
    %1627 = func.call @cc_cons(%1625, %1626) : (i64, i64) -> i64
    %1628 = func.call @cc_values_pack(%1627) : (i64) -> i64
    %1629 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%1625, %1629) : (i64, i64) -> ()
    %1630 = func.call @cc_nil_value() : () -> i64
    %1631 = llvm.mlir.addressof @str133 : !llvm.ptr
    %1632 = arith.constant 38 : i64
    %1633 = func.call @cc_make_string(%1631, %1632) : (!llvm.ptr, i64) -> i64
    %1634 = func.call @cc_nil_value() : () -> i64
    %1635 = func.call @cc_intern(%1633, %1634) : (i64, i64) -> i64
    %1636 = func.call @cc_nil_value() : () -> i64
    %1637 = func.call @cc_cons(%1635, %1636) : (i64, i64) -> i64
    %1638 = func.call @cc_values_pack(%1637) : (i64) -> i64
    %1639 = func.call @cc_set_symbol_value(%1635, %1630) : (i64, i64) -> i64
    %1640 = llvm.mlir.addressof @str134 : !llvm.ptr
    %1641 = arith.constant 39 : i64
    %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
    %1643 = func.call @cc_nil_value() : () -> i64
    %1644 = func.call @cc_intern(%1642, %1643) : (i64, i64) -> i64
    %1645 = func.call @cc_nil_value() : () -> i64
    %1646 = func.call @cc_cons(%1644, %1645) : (i64, i64) -> i64
    %1647 = func.call @cc_values_pack(%1646) : (i64) -> i64
    %1648 = func.call @cc_set_symbol_value(%1644, %1630) : (i64, i64) -> i64
    %1649 = llvm.mlir.addressof @str135 : !llvm.ptr
    %1650 = arith.constant 40 : i64
    %1651 = func.call @cc_make_string(%1649, %1650) : (!llvm.ptr, i64) -> i64
    %1652 = func.call @cc_nil_value() : () -> i64
    %1653 = func.call @cc_intern(%1651, %1652) : (i64, i64) -> i64
    %1654 = func.call @cc_nil_value() : () -> i64
    %1655 = func.call @cc_cons(%1653, %1654) : (i64, i64) -> i64
    %1656 = func.call @cc_values_pack(%1655) : (i64) -> i64
    %1657 = func.call @cc_set_symbol_value(%1653, %1630) : (i64, i64) -> i64
    %1658 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%1658) : (i64) -> ()
    %1659 = func.call @stack_pop_pointer() : () -> i64
    %1660 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%1660) : (i64) -> ()
    %1661 = func.call @stack_pop_pointer() : () -> i64
    %1662 = func.call @cc_random(%1661) : (i64) -> i64
    func.call @stack_push_pointer(%1662) : (i64) -> ()
    %1663 = func.call @stack_pop_pointer() : () -> i64
    %1664 = arith.constant 1 : i1
    %1666 = arith.constant 3 : i64
    %1665 = arith.andi %1659, %1666 : i64
    %1667 = arith.constant 0 : i64
    %1668 = arith.cmpi eq, %1665, %1667 : i64
    %1670 = arith.constant 3 : i64
    %1669 = arith.andi %1663, %1670 : i64
    %1671 = arith.constant 0 : i64
    %1672 = arith.cmpi eq, %1669, %1671 : i64
    %1673 = arith.andi %1668, %1672 : i1
    %1674 = scf.if %1673 -> (i1) {
      %1675 = arith.constant 2 : i64
      %1676 = arith.shrsi %1659, %1675 : i64
      %1677 = arith.constant 2 : i64
      %1678 = arith.shrsi %1663, %1677 : i64
      %1679 = arith.cmpi sgt, %1676, %1678 : i64
      scf.yield %1679 : i1
    } else {
      %1680 = func.call @cc_gt(%1659, %1663) : (i64, i64) -> i64
      %1681 = func.call @cc_nil_value() : () -> i64
      %1682 = arith.cmpi ne, %1680, %1681 : i64
      scf.yield %1682 : i1
    }
    %1683 = arith.andi %1664, %1674 : i1
    %1684 = func.call @cc_nil_value() : () -> i64
    %1685 = func.call @cc_t_value() : () -> i64
    %1686 = scf.if %1683 -> (i64) {
      scf.yield %1685 : i64
    } else {
      scf.yield %1684 : i64
    }
    func.call @stack_push_pointer(%1686) : (i64) -> ()
    %1687 = func.call @stack_pop_pointer() : () -> i64
    %1688 = func.call @cc_nil_value() : () -> i64
    %1689 = arith.cmpi ne, %1687, %1688 : i64
    scf.if %1689 {
      %1690 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1690) : (i64) -> ()
    } else {
      %1691 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%1691) : (i64) -> ()
    }
    %1692 = func.call @stack_pop_pointer() : () -> i64
    %1693 = func.call @cc_multiple_value_list(%1692) : (i64) -> i64
    %1694 = llvm.mlir.addressof @str136 : !llvm.ptr
    %1695 = arith.constant 38 : i64
    %1696 = func.call @cc_make_string(%1694, %1695) : (!llvm.ptr, i64) -> i64
    %1697 = func.call @cc_nil_value() : () -> i64
    %1698 = func.call @cc_intern(%1696, %1697) : (i64, i64) -> i64
    %1699 = func.call @cc_nil_value() : () -> i64
    %1700 = func.call @cc_cons(%1698, %1699) : (i64, i64) -> i64
    %1701 = func.call @cc_values_pack(%1700) : (i64) -> i64
    %1702 = func.call @cc_symbol_value(%1698) : (i64) -> i64
    %1703 = llvm.mlir.addressof @str137 : !llvm.ptr
    %1704 = arith.constant 40 : i64
    %1705 = func.call @cc_make_string(%1703, %1704) : (!llvm.ptr, i64) -> i64
    %1706 = func.call @cc_nil_value() : () -> i64
    %1707 = func.call @cc_intern(%1705, %1706) : (i64, i64) -> i64
    %1708 = func.call @cc_nil_value() : () -> i64
    %1709 = func.call @cc_cons(%1707, %1708) : (i64, i64) -> i64
    %1710 = func.call @cc_values_pack(%1709) : (i64) -> i64
    %1711 = func.call @cc_symbol_value(%1707) : (i64) -> i64
    %1712 = func.call @cc_nil_value() : () -> i64
    %1713 = arith.cmpi ne, %1702, %1712 : i64
    %1714 = scf.if %1713 -> (i64) {
      scf.yield %1711 : i64
    } else {
      scf.yield %1693 : i64
    }
    %1715 = func.call @cc_values_pack(%1714) : (i64) -> i64
    func.call @stack_push_pointer(%1715) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_152926823645197"() {
    %1519 = func.call @cc_nil_value() : () -> i64
    %1520 = func.call @cc_nil_value() : () -> i64
    %1521 = func.call @cc_errorp(%1519) : (i64) -> i64
    %1522 = arith.cmpi ne, %1521, %1520 : i64
    %1523 = scf.if %1522 -> (i64) {
      scf.yield %1519 : i64
    } else {
      %1716 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1717 = arith.constant 14 : i64
      %1718 = func.call @cc_make_string(%1716, %1717) : (!llvm.ptr, i64) -> i64
      %1719 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1720 = arith.constant 7 : i64
      %1721 = func.call @cc_make_string(%1719, %1720) : (!llvm.ptr, i64) -> i64
      %1722 = func.call @cc_intern(%1718, %1721) : (i64, i64) -> i64
      %1723 = func.call @cc_nil_value() : () -> i64
      %1724 = func.call @cc_cons(%1722, %1723) : (i64, i64) -> i64
      %1725 = func.call @cc_values_pack(%1724) : (i64) -> i64
      func.call @stack_push_pointer(%1722) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1726 = func.call @stack_pop_pointer() : () -> i64
      %1727 = func.call @stack_pop_pointer() : () -> i64
      %1728 = func.call @cc_cons(%1727, %1726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1728) : (i64) -> ()
      %1729 = func.call @stack_pop_pointer() : () -> i64
      %1730 = func.call @cc_push_float_trap_mask(%1729) : (i64) -> i64
      func.call @"local_bar_152926823645199"() : () -> ()
      %1731 = func.call @stack_pop_pointer() : () -> i64
      func.call @"local_foo_152926823645198"() : () -> ()
      %1732 = func.call @stack_pop_pointer() : () -> i64
      %1733 = func.call @cc_div(%1731, %1732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1733) : (i64) -> ()
      %1734 = func.call @cc_restore_float_trap_mask(%1730) : (i64) -> i64
      %1735 = func.call @stack_pop_pointer() : () -> i64
      %1736 = func.call @cc_multiple_value_list(%1735) : (i64) -> i64
      %1737 = func.call @cc_values_pack(%1736) : (i64) -> i64
      func.call @stack_push_pointer(%1737) : (i64) -> ()
      %1738 = func.call @stack_pop_pointer() : () -> i64
      %1739 = func.call @cc_nil_value() : () -> i64
      %1740 = func.call @cc_errorp(%1738) : (i64) -> i64
      %1741 = arith.cmpi ne, %1740, %1739 : i64
      %1742 = arith.cmpi eq, %1739, %1739 : i64
      %1743 = arith.andi %1741, %1742 : i1
      %1744 = scf.if %1743 -> (i64) {
        scf.yield %1738 : i64
      } else {
        scf.yield %1739 : i64
      }
      %1745 = arith.cmpi ne, %1744, %1739 : i64
      scf.if %1745 {
        func.call @stack_push_pointer(%1744) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1738) : (i64) -> ()
        %1746 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1747 = func.call @cc_make_function_ref_const(%1746) : (!llvm.ptr) -> i64
        %1748 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1747, %1748) : (i64, i64) -> ()
      }
      %1749 = func.call @stack_pop_pointer() : () -> i64
      %1750 = func.call @cc_nil_value() : () -> i64
      %1751 = func.call @cc_cons(%1749, %1750) : (i64, i64) -> i64
      %1752 = func.call @cc_not(%1751) : (i64) -> i64
      func.call @stack_push_pointer(%1752) : (i64) -> ()
      %1753 = func.call @stack_pop_pointer() : () -> i64
      %1754 = func.call @cc_nil_value() : () -> i64
      %1755 = func.call @cc_cons(%1753, %1754) : (i64, i64) -> i64
      %1756 = func.call @cc_not(%1755) : (i64) -> i64
      func.call @stack_push_pointer(%1756) : (i64) -> ()
      %1757 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1757 : i64
    }
    func.call @stack_push_pointer(%1523) : (i64) -> ()
    func.return
  }
  func.func @"local_foo_152926823645203"() {
    %2144 = llvm.mlir.addressof @str171 : !llvm.ptr
    %2145 = arith.constant 25 : i64
    %2146 = func.call @cc_make_string(%2144, %2145) : (!llvm.ptr, i64) -> i64
    %2147 = func.call @cc_nil_value() : () -> i64
    %2148 = func.call @cc_intern(%2146, %2147) : (i64, i64) -> i64
    %2149 = func.call @cc_nil_value() : () -> i64
    %2150 = func.call @cc_cons(%2148, %2149) : (i64, i64) -> i64
    %2151 = func.call @cc_values_pack(%2150) : (i64) -> i64
    %2152 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%2148, %2152) : (i64, i64) -> ()
    %2153 = func.call @cc_nil_value() : () -> i64
    %2154 = llvm.mlir.addressof @str172 : !llvm.ptr
    %2155 = arith.constant 38 : i64
    %2156 = func.call @cc_make_string(%2154, %2155) : (!llvm.ptr, i64) -> i64
    %2157 = func.call @cc_nil_value() : () -> i64
    %2158 = func.call @cc_intern(%2156, %2157) : (i64, i64) -> i64
    %2159 = func.call @cc_nil_value() : () -> i64
    %2160 = func.call @cc_cons(%2158, %2159) : (i64, i64) -> i64
    %2161 = func.call @cc_values_pack(%2160) : (i64) -> i64
    %2162 = func.call @cc_set_symbol_value(%2158, %2153) : (i64, i64) -> i64
    %2163 = llvm.mlir.addressof @str173 : !llvm.ptr
    %2164 = arith.constant 39 : i64
    %2165 = func.call @cc_make_string(%2163, %2164) : (!llvm.ptr, i64) -> i64
    %2166 = func.call @cc_nil_value() : () -> i64
    %2167 = func.call @cc_intern(%2165, %2166) : (i64, i64) -> i64
    %2168 = func.call @cc_nil_value() : () -> i64
    %2169 = func.call @cc_cons(%2167, %2168) : (i64, i64) -> i64
    %2170 = func.call @cc_values_pack(%2169) : (i64) -> i64
    %2171 = func.call @cc_set_symbol_value(%2167, %2153) : (i64, i64) -> i64
    %2172 = llvm.mlir.addressof @str174 : !llvm.ptr
    %2173 = arith.constant 40 : i64
    %2174 = func.call @cc_make_string(%2172, %2173) : (!llvm.ptr, i64) -> i64
    %2175 = func.call @cc_nil_value() : () -> i64
    %2176 = func.call @cc_intern(%2174, %2175) : (i64, i64) -> i64
    %2177 = func.call @cc_nil_value() : () -> i64
    %2178 = func.call @cc_cons(%2176, %2177) : (i64, i64) -> i64
    %2179 = func.call @cc_values_pack(%2178) : (i64) -> i64
    %2180 = func.call @cc_set_symbol_value(%2176, %2153) : (i64, i64) -> i64
    %2181 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%2181) : (i64) -> ()
    %2182 = func.call @stack_pop_pointer() : () -> i64
    %2183 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%2183) : (i64) -> ()
    %2184 = func.call @stack_pop_pointer() : () -> i64
    %2185 = func.call @cc_random(%2184) : (i64) -> i64
    func.call @stack_push_pointer(%2185) : (i64) -> ()
    %2186 = func.call @stack_pop_pointer() : () -> i64
    %2187 = arith.constant 1 : i1
    %2189 = arith.constant 3 : i64
    %2188 = arith.andi %2182, %2189 : i64
    %2190 = arith.constant 0 : i64
    %2191 = arith.cmpi eq, %2188, %2190 : i64
    %2193 = arith.constant 3 : i64
    %2192 = arith.andi %2186, %2193 : i64
    %2194 = arith.constant 0 : i64
    %2195 = arith.cmpi eq, %2192, %2194 : i64
    %2196 = arith.andi %2191, %2195 : i1
    %2197 = scf.if %2196 -> (i1) {
      %2198 = arith.constant 2 : i64
      %2199 = arith.shrsi %2182, %2198 : i64
      %2200 = arith.constant 2 : i64
      %2201 = arith.shrsi %2186, %2200 : i64
      %2202 = arith.cmpi sgt, %2199, %2201 : i64
      scf.yield %2202 : i1
    } else {
      %2203 = func.call @cc_gt(%2182, %2186) : (i64, i64) -> i64
      %2204 = func.call @cc_nil_value() : () -> i64
      %2205 = arith.cmpi ne, %2203, %2204 : i64
      scf.yield %2205 : i1
    }
    %2206 = arith.andi %2187, %2197 : i1
    %2207 = func.call @cc_nil_value() : () -> i64
    %2208 = func.call @cc_t_value() : () -> i64
    %2209 = scf.if %2206 -> (i64) {
      scf.yield %2208 : i64
    } else {
      scf.yield %2207 : i64
    }
    func.call @stack_push_pointer(%2209) : (i64) -> ()
    %2210 = func.call @stack_pop_pointer() : () -> i64
    %2211 = func.call @cc_nil_value() : () -> i64
    %2212 = arith.cmpi ne, %2210, %2211 : i64
    scf.if %2212 {
      %2213 = arith.constant 0.0 : f64
      %2214 = func.call @cc_box_single_float(%2213) : (f64) -> i64
      func.call @stack_push_pointer(%2214) : (i64) -> ()
    } else {
      %2215 = arith.constant 0.0 : f64
      %2216 = func.call @cc_box_single_float(%2215) : (f64) -> i64
      func.call @stack_push_pointer(%2216) : (i64) -> ()
    }
    %2217 = func.call @stack_pop_pointer() : () -> i64
    %2218 = func.call @cc_multiple_value_list(%2217) : (i64) -> i64
    %2219 = llvm.mlir.addressof @str175 : !llvm.ptr
    %2220 = arith.constant 38 : i64
    %2221 = func.call @cc_make_string(%2219, %2220) : (!llvm.ptr, i64) -> i64
    %2222 = func.call @cc_nil_value() : () -> i64
    %2223 = func.call @cc_intern(%2221, %2222) : (i64, i64) -> i64
    %2224 = func.call @cc_nil_value() : () -> i64
    %2225 = func.call @cc_cons(%2223, %2224) : (i64, i64) -> i64
    %2226 = func.call @cc_values_pack(%2225) : (i64) -> i64
    %2227 = func.call @cc_symbol_value(%2223) : (i64) -> i64
    %2228 = llvm.mlir.addressof @str176 : !llvm.ptr
    %2229 = arith.constant 40 : i64
    %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
    %2231 = func.call @cc_nil_value() : () -> i64
    %2232 = func.call @cc_intern(%2230, %2231) : (i64, i64) -> i64
    %2233 = func.call @cc_nil_value() : () -> i64
    %2234 = func.call @cc_cons(%2232, %2233) : (i64, i64) -> i64
    %2235 = func.call @cc_values_pack(%2234) : (i64) -> i64
    %2236 = func.call @cc_symbol_value(%2232) : (i64) -> i64
    %2237 = func.call @cc_nil_value() : () -> i64
    %2238 = arith.cmpi ne, %2227, %2237 : i64
    %2239 = scf.if %2238 -> (i64) {
      scf.yield %2236 : i64
    } else {
      scf.yield %2218 : i64
    }
    %2240 = func.call @cc_values_pack(%2239) : (i64) -> i64
    func.call @stack_push_pointer(%2240) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"local_bar_152926823645204"() {
    %2241 = llvm.mlir.addressof @str177 : !llvm.ptr
    %2242 = arith.constant 25 : i64
    %2243 = func.call @cc_make_string(%2241, %2242) : (!llvm.ptr, i64) -> i64
    %2244 = func.call @cc_nil_value() : () -> i64
    %2245 = func.call @cc_intern(%2243, %2244) : (i64, i64) -> i64
    %2246 = func.call @cc_nil_value() : () -> i64
    %2247 = func.call @cc_cons(%2245, %2246) : (i64, i64) -> i64
    %2248 = func.call @cc_values_pack(%2247) : (i64) -> i64
    %2249 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%2245, %2249) : (i64, i64) -> ()
    %2250 = func.call @cc_nil_value() : () -> i64
    %2251 = llvm.mlir.addressof @str178 : !llvm.ptr
    %2252 = arith.constant 38 : i64
    %2253 = func.call @cc_make_string(%2251, %2252) : (!llvm.ptr, i64) -> i64
    %2254 = func.call @cc_nil_value() : () -> i64
    %2255 = func.call @cc_intern(%2253, %2254) : (i64, i64) -> i64
    %2256 = func.call @cc_nil_value() : () -> i64
    %2257 = func.call @cc_cons(%2255, %2256) : (i64, i64) -> i64
    %2258 = func.call @cc_values_pack(%2257) : (i64) -> i64
    %2259 = func.call @cc_set_symbol_value(%2255, %2250) : (i64, i64) -> i64
    %2260 = llvm.mlir.addressof @str179 : !llvm.ptr
    %2261 = arith.constant 39 : i64
    %2262 = func.call @cc_make_string(%2260, %2261) : (!llvm.ptr, i64) -> i64
    %2263 = func.call @cc_nil_value() : () -> i64
    %2264 = func.call @cc_intern(%2262, %2263) : (i64, i64) -> i64
    %2265 = func.call @cc_nil_value() : () -> i64
    %2266 = func.call @cc_cons(%2264, %2265) : (i64, i64) -> i64
    %2267 = func.call @cc_values_pack(%2266) : (i64) -> i64
    %2268 = func.call @cc_set_symbol_value(%2264, %2250) : (i64, i64) -> i64
    %2269 = llvm.mlir.addressof @str180 : !llvm.ptr
    %2270 = arith.constant 40 : i64
    %2271 = func.call @cc_make_string(%2269, %2270) : (!llvm.ptr, i64) -> i64
    %2272 = func.call @cc_nil_value() : () -> i64
    %2273 = func.call @cc_intern(%2271, %2272) : (i64, i64) -> i64
    %2274 = func.call @cc_nil_value() : () -> i64
    %2275 = func.call @cc_cons(%2273, %2274) : (i64, i64) -> i64
    %2276 = func.call @cc_values_pack(%2275) : (i64) -> i64
    %2277 = func.call @cc_set_symbol_value(%2273, %2250) : (i64, i64) -> i64
    %2278 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%2278) : (i64) -> ()
    %2279 = func.call @stack_pop_pointer() : () -> i64
    %2280 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%2280) : (i64) -> ()
    %2281 = func.call @stack_pop_pointer() : () -> i64
    %2282 = func.call @cc_random(%2281) : (i64) -> i64
    func.call @stack_push_pointer(%2282) : (i64) -> ()
    %2283 = func.call @stack_pop_pointer() : () -> i64
    %2284 = arith.constant 1 : i1
    %2286 = arith.constant 3 : i64
    %2285 = arith.andi %2279, %2286 : i64
    %2287 = arith.constant 0 : i64
    %2288 = arith.cmpi eq, %2285, %2287 : i64
    %2290 = arith.constant 3 : i64
    %2289 = arith.andi %2283, %2290 : i64
    %2291 = arith.constant 0 : i64
    %2292 = arith.cmpi eq, %2289, %2291 : i64
    %2293 = arith.andi %2288, %2292 : i1
    %2294 = scf.if %2293 -> (i1) {
      %2295 = arith.constant 2 : i64
      %2296 = arith.shrsi %2279, %2295 : i64
      %2297 = arith.constant 2 : i64
      %2298 = arith.shrsi %2283, %2297 : i64
      %2299 = arith.cmpi sgt, %2296, %2298 : i64
      scf.yield %2299 : i1
    } else {
      %2300 = func.call @cc_gt(%2279, %2283) : (i64, i64) -> i64
      %2301 = func.call @cc_nil_value() : () -> i64
      %2302 = arith.cmpi ne, %2300, %2301 : i64
      scf.yield %2302 : i1
    }
    %2303 = arith.andi %2284, %2294 : i1
    %2304 = func.call @cc_nil_value() : () -> i64
    %2305 = func.call @cc_t_value() : () -> i64
    %2306 = scf.if %2303 -> (i64) {
      scf.yield %2305 : i64
    } else {
      scf.yield %2304 : i64
    }
    func.call @stack_push_pointer(%2306) : (i64) -> ()
    %2307 = func.call @stack_pop_pointer() : () -> i64
    %2308 = func.call @cc_nil_value() : () -> i64
    %2309 = arith.cmpi ne, %2307, %2308 : i64
    scf.if %2309 {
      %2310 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%2310) : (i64) -> ()
    } else {
      %2311 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%2311) : (i64) -> ()
    }
    %2312 = func.call @stack_pop_pointer() : () -> i64
    %2313 = func.call @cc_multiple_value_list(%2312) : (i64) -> i64
    %2314 = llvm.mlir.addressof @str181 : !llvm.ptr
    %2315 = arith.constant 38 : i64
    %2316 = func.call @cc_make_string(%2314, %2315) : (!llvm.ptr, i64) -> i64
    %2317 = func.call @cc_nil_value() : () -> i64
    %2318 = func.call @cc_intern(%2316, %2317) : (i64, i64) -> i64
    %2319 = func.call @cc_nil_value() : () -> i64
    %2320 = func.call @cc_cons(%2318, %2319) : (i64, i64) -> i64
    %2321 = func.call @cc_values_pack(%2320) : (i64) -> i64
    %2322 = func.call @cc_symbol_value(%2318) : (i64) -> i64
    %2323 = llvm.mlir.addressof @str182 : !llvm.ptr
    %2324 = arith.constant 40 : i64
    %2325 = func.call @cc_make_string(%2323, %2324) : (!llvm.ptr, i64) -> i64
    %2326 = func.call @cc_nil_value() : () -> i64
    %2327 = func.call @cc_intern(%2325, %2326) : (i64, i64) -> i64
    %2328 = func.call @cc_nil_value() : () -> i64
    %2329 = func.call @cc_cons(%2327, %2328) : (i64, i64) -> i64
    %2330 = func.call @cc_values_pack(%2329) : (i64) -> i64
    %2331 = func.call @cc_symbol_value(%2327) : (i64) -> i64
    %2332 = func.call @cc_nil_value() : () -> i64
    %2333 = arith.cmpi ne, %2322, %2332 : i64
    %2334 = scf.if %2333 -> (i64) {
      scf.yield %2331 : i64
    } else {
      scf.yield %2313 : i64
    }
    %2335 = func.call @cc_values_pack(%2334) : (i64) -> i64
    func.call @stack_push_pointer(%2335) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_152926823645202"() {
    %2133 = func.call @cc_nil_value() : () -> i64
    %2134 = func.call @cc_nil_value() : () -> i64
    %2135 = func.call @cc_errorp(%2133) : (i64) -> i64
    %2136 = arith.cmpi ne, %2135, %2134 : i64
    %2137 = scf.if %2136 -> (i64) {
      scf.yield %2133 : i64
    } else {
      %2138 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2139 = func.call @cc_nil_value() : () -> i64
      %2140 = func.call @cc_nil_value() : () -> i64
      %2141 = func.call @cc_errorp(%2139) : (i64) -> i64
      %2142 = arith.cmpi ne, %2141, %2140 : i64
      %2143 = scf.if %2142 -> (i64) {
        scf.yield %2139 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @"local_bar_152926823645204"() : () -> ()
        %2336 = func.call @stack_pop_pointer() : () -> i64
        func.call @"local_foo_152926823645203"() : () -> ()
        %2337 = func.call @stack_pop_pointer() : () -> i64
        %2338 = func.call @cc_div(%2336, %2337) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2338) : (i64) -> ()
        %2339 = func.call @stack_pop_pointer() : () -> i64
        %2340 = func.call @cc_multiple_value_list(%2339) : (i64) -> i64
        %2341 = func.call @cc_values_pack(%2340) : (i64) -> i64
        func.call @stack_push_pointer(%2341) : (i64) -> ()
        %2342 = func.call @stack_pop_pointer() : () -> i64
        %2343 = func.call @cc_errorp(%2342) : (i64) -> i64
        %2344 = func.call @cc_nil_value() : () -> i64
        %2345 = arith.cmpi ne, %2343, %2344 : i64
        scf.if %2345 {
          func.call @stack_push_pointer(%2342) : (i64) -> ()
        } else {
          %2346 = func.call @cc_multiple_value_list(%2342) : (i64) -> i64
          func.call @stack_push_pointer(%2346) : (i64) -> ()
        }
        %2347 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2348 = func.call @stack_pop_pointer() : () -> i64
        %2349 = func.call @cc_nil_value() : () -> i64
        %2350 = func.call @cc_maybe_error_from_multiple_value_list(%2347) : (i64) -> i64
        %2351 = func.call @cc_errorp(%2350) : (i64) -> i64
        %2352 = arith.cmpi ne, %2351, %2349 : i64
        %2353 = arith.cmpi eq, %2349, %2349 : i64
        %2354 = arith.andi %2352, %2353 : i1
        %2355 = scf.if %2354 -> (i64) {
          scf.yield %2350 : i64
        } else {
          scf.yield %2349 : i64
        }
        %2356 = arith.cmpi ne, %2355, %2349 : i64
        scf.if %2356 {
          func.call @stack_push_pointer(%2355) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2357 = func.call @stack_pop_pointer() : () -> i64
          %2358 = func.call @cc_cons(%2348, %2357) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2358) : (i64) -> ()
          %2359 = func.call @stack_pop_pointer() : () -> i64
          %2360 = func.call @cc_cons(%2347, %2359) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2360) : (i64) -> ()
          %2361 = func.call @stack_pop_pointer() : () -> i64
          %2362 = func.call @cc_values_pack(%2361) : (i64) -> i64
          func.call @stack_push_pointer(%2362) : (i64) -> ()
        }
        %2363 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2363 : i64
      }
      func.call @stack_push_pointer(%2143) : (i64) -> ()
      %2364 = func.call @stack_pop_pointer() : () -> i64
      %2365 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2366 = func.call @cc_errorp(%2364) : (i64) -> i64
      %2367 = func.call @cc_nil_value() : () -> i64
      %2368 = arith.cmpi ne, %2366, %2367 : i64
      scf.if %2368 {
        %2369 = func.call @cc_condition_value(%2364) : (i64) -> i64
        %2370 = func.call @cc_values2(%2367, %2369) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2370) : (i64) -> ()
      } else {
        %2371 = func.call @cc_multiple_value_list(%2364) : (i64) -> i64
        %2372 = func.call @cc_values_pack(%2371) : (i64) -> i64
        func.call @stack_push_pointer(%2372) : (i64) -> ()
      }
      %2373 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2373 : i64
    }
    func.call @stack_push_pointer(%2137) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645207"() {
    %2850 = func.call @cc_nil_value() : () -> i64
    %2851 = func.call @cc_nil_value() : () -> i64
    %2852 = func.call @cc_errorp(%2850) : (i64) -> i64
    %2853 = arith.cmpi ne, %2852, %2851 : i64
    %2854 = scf.if %2853 -> (i64) {
      scf.yield %2850 : i64
    } else {
      %2855 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2856 = arith.constant 8 : i64
      %2857 = func.call @cc_make_string(%2855, %2856) : (!llvm.ptr, i64) -> i64
      %2858 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2859 = arith.constant 7 : i64
      %2860 = func.call @cc_make_string(%2858, %2859) : (!llvm.ptr, i64) -> i64
      %2861 = func.call @cc_intern(%2857, %2860) : (i64, i64) -> i64
      %2862 = func.call @cc_nil_value() : () -> i64
      %2863 = func.call @cc_cons(%2861, %2862) : (i64, i64) -> i64
      %2864 = func.call @cc_values_pack(%2863) : (i64) -> i64
      func.call @stack_push_pointer(%2861) : (i64) -> ()
      %2865 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2866 = arith.constant 7 : i64
      %2867 = func.call @cc_make_string(%2865, %2866) : (!llvm.ptr, i64) -> i64
      %2868 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2869 = arith.constant 7 : i64
      %2870 = func.call @cc_make_string(%2868, %2869) : (!llvm.ptr, i64) -> i64
      %2871 = func.call @cc_intern(%2867, %2870) : (i64, i64) -> i64
      %2872 = func.call @cc_nil_value() : () -> i64
      %2873 = func.call @cc_cons(%2871, %2872) : (i64, i64) -> i64
      %2874 = func.call @cc_values_pack(%2873) : (i64) -> i64
      func.call @stack_push_pointer(%2871) : (i64) -> ()
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
      %2882 = func.call @cc_push_float_trap_mask(%2881) : (i64) -> i64
      %2883 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2883) : (i64) -> ()
      %2884 = func.call @stack_pop_pointer() : () -> i64
      %2885 = func.call @cc_random(%2884) : (i64) -> i64
      func.call @stack_push_pointer(%2885) : (i64) -> ()
      %2886 = func.call @stack_pop_pointer() : () -> i64
      %2887 = func.call @cc_nil_value() : () -> i64
      %2888 = func.call @cc_nil_value() : () -> i64
      %2889 = func.call @cc_errorp(%2887) : (i64) -> i64
      %2890 = arith.cmpi ne, %2889, %2888 : i64
      %2891 = scf.if %2890 -> (i64) {
        scf.yield %2887 : i64
      } else {
        func.call @stack_push_pointer(%2886) : (i64) -> ()
        %2892 = func.call @stack_pop_pointer() : () -> i64
        %2893 = func.call @cc_nil_value() : () -> i64
        %2894 = func.call @cc_errorp(%2892) : (i64) -> i64
        %2895 = arith.cmpi ne, %2894, %2893 : i64
        %2896 = arith.cmpi eq, %2893, %2893 : i64
        %2897 = arith.andi %2895, %2896 : i1
        %2898 = scf.if %2897 -> (i64) {
          scf.yield %2892 : i64
        } else {
          scf.yield %2893 : i64
        }
        %2899 = arith.cmpi ne, %2898, %2893 : i64
        scf.if %2899 {
          func.call @stack_push_pointer(%2898) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2892) : (i64) -> ()
          %2900 = llvm.mlir.addressof @str241 : !llvm.ptr
          %2901 = func.call @cc_make_function_ref_const(%2900) : (!llvm.ptr) -> i64
          %2902 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2901, %2902) : (i64, i64) -> ()
        }
        %2903 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2886) : (i64) -> ()
        %2904 = func.call @stack_pop_pointer() : () -> i64
        %2905 = func.call @cc_nil_value() : () -> i64
        %2906 = func.call @cc_errorp(%2904) : (i64) -> i64
        %2907 = arith.cmpi ne, %2906, %2905 : i64
        %2908 = arith.cmpi eq, %2905, %2905 : i64
        %2909 = arith.andi %2907, %2908 : i1
        %2910 = scf.if %2909 -> (i64) {
          scf.yield %2904 : i64
        } else {
          scf.yield %2905 : i64
        }
        %2911 = arith.cmpi ne, %2910, %2905 : i64
        scf.if %2911 {
          func.call @stack_push_pointer(%2910) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2904) : (i64) -> ()
          %2912 = llvm.mlir.addressof @str242 : !llvm.ptr
          %2913 = func.call @cc_make_function_ref_const(%2912) : (!llvm.ptr) -> i64
          %2914 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2913, %2914) : (i64, i64) -> ()
        }
        %2915 = func.call @stack_pop_pointer() : () -> i64
        %2917 = arith.constant 3 : i64
        %2916 = arith.andi %2903, %2917 : i64
        %2918 = arith.constant 0 : i64
        %2919 = arith.cmpi eq, %2916, %2918 : i64
        %2921 = arith.constant 3 : i64
        %2920 = arith.andi %2915, %2921 : i64
        %2922 = arith.constant 0 : i64
        %2923 = arith.cmpi eq, %2920, %2922 : i64
        %2924 = arith.andi %2919, %2923 : i1
        %2925 = scf.if %2924 -> (i64) {
          %2926 = arith.constant 2 : i64
          %2927 = arith.shrsi %2903, %2926 : i64
          %2928 = arith.constant 2 : i64
          %2929 = arith.shrsi %2915, %2928 : i64
          %2930 = arith.addi %2927, %2929 : i64
          %2931 = arith.constant -2305843009213693952 : i64
          %2932 = arith.constant 2305843009213693951 : i64
          %2933 = arith.cmpi sge, %2930, %2931 : i64
          %2934 = arith.cmpi sle, %2930, %2932 : i64
          %2935 = arith.andi %2933, %2934 : i1
          %2936 = scf.if %2935 -> (i64) {
            %2937 = arith.constant 2 : i64
            %2938 = arith.shli %2930, %2937 : i64
            scf.yield %2938 : i64
          } else {
            %2939 = func.call @cc_add(%2903, %2915) : (i64, i64) -> i64
            scf.yield %2939 : i64
          }
          scf.yield %2936 : i64
        } else {
          %2940 = func.call @cc_add(%2903, %2915) : (i64, i64) -> i64
          scf.yield %2940 : i64
        }
        func.call @stack_push_pointer(%2925) : (i64) -> ()
        %2941 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2941 : i64
      }
      func.call @stack_push_pointer(%2891) : (i64) -> ()
      %2942 = func.call @cc_restore_float_trap_mask(%2882) : (i64) -> i64
      %2943 = func.call @stack_pop_pointer() : () -> i64
      %2944 = func.call @cc_nil_value() : () -> i64
      %2945 = func.call @cc_errorp(%2943) : (i64) -> i64
      %2946 = arith.cmpi ne, %2945, %2944 : i64
      %2947 = arith.cmpi eq, %2944, %2944 : i64
      %2948 = arith.andi %2946, %2947 : i1
      %2949 = scf.if %2948 -> (i64) {
        scf.yield %2943 : i64
      } else {
        scf.yield %2944 : i64
      }
      %2950 = arith.cmpi ne, %2949, %2944 : i64
      scf.if %2950 {
        func.call @stack_push_pointer(%2949) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2943) : (i64) -> ()
        %2951 = llvm.mlir.addressof @str243 : !llvm.ptr
        %2952 = func.call @cc_make_function_ref_const(%2951) : (!llvm.ptr) -> i64
        %2953 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2952, %2953) : (i64, i64) -> ()
      }
      %2954 = func.call @stack_pop_pointer() : () -> i64
      %2955 = func.call @cc_nil_value() : () -> i64
      %2956 = func.call @cc_cons(%2954, %2955) : (i64, i64) -> i64
      %2957 = func.call @cc_not(%2956) : (i64) -> i64
      func.call @stack_push_pointer(%2957) : (i64) -> ()
      %2958 = func.call @stack_pop_pointer() : () -> i64
      %2959 = func.call @cc_nil_value() : () -> i64
      %2960 = func.call @cc_cons(%2958, %2959) : (i64, i64) -> i64
      %2961 = func.call @cc_not(%2960) : (i64) -> i64
      func.call @stack_push_pointer(%2961) : (i64) -> ()
      %2962 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2962 : i64
    }
    func.call @stack_push_pointer(%2854) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645208"() {
    %3232 = func.call @cc_nil_value() : () -> i64
    %3233 = func.call @cc_nil_value() : () -> i64
    %3234 = func.call @cc_errorp(%3232) : (i64) -> i64
    %3235 = arith.cmpi ne, %3234, %3233 : i64
    %3236 = scf.if %3235 -> (i64) {
      scf.yield %3232 : i64
    } else {
      %3237 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3238 = func.call @cc_nil_value() : () -> i64
      %3239 = func.call @cc_nil_value() : () -> i64
      %3240 = func.call @cc_errorp(%3238) : (i64) -> i64
      %3241 = arith.cmpi ne, %3240, %3239 : i64
      %3242 = scf.if %3241 -> (i64) {
        scf.yield %3238 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3243 = arith.constant 100 : i64
        func.call @stack_push_fixnum(%3243) : (i64) -> ()
        %3244 = func.call @stack_pop_pointer() : () -> i64
        %3245 = func.call @cc_random(%3244) : (i64) -> i64
        func.call @stack_push_pointer(%3245) : (i64) -> ()
        %3246 = func.call @stack_pop_pointer() : () -> i64
        %3247 = func.call @cc_nil_value() : () -> i64
        %3248 = func.call @cc_nil_value() : () -> i64
        %3249 = func.call @cc_errorp(%3247) : (i64) -> i64
        %3250 = arith.cmpi ne, %3249, %3248 : i64
        %3251 = scf.if %3250 -> (i64) {
          scf.yield %3247 : i64
        } else {
          func.call @stack_push_pointer(%3246) : (i64) -> ()
          %3252 = func.call @stack_pop_pointer() : () -> i64
          %3253 = func.call @cc_nil_value() : () -> i64
          %3254 = func.call @cc_errorp(%3252) : (i64) -> i64
          %3255 = arith.cmpi ne, %3254, %3253 : i64
          %3256 = arith.cmpi eq, %3253, %3253 : i64
          %3257 = arith.andi %3255, %3256 : i1
          %3258 = scf.if %3257 -> (i64) {
            scf.yield %3252 : i64
          } else {
            scf.yield %3253 : i64
          }
          %3259 = arith.cmpi ne, %3258, %3253 : i64
          scf.if %3259 {
            func.call @stack_push_pointer(%3258) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3252) : (i64) -> ()
            %3260 = llvm.mlir.addressof @str266 : !llvm.ptr
            %3261 = func.call @cc_make_function_ref_const(%3260) : (!llvm.ptr) -> i64
            %3262 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3261, %3262) : (i64, i64) -> ()
          }
          %3263 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3246) : (i64) -> ()
          %3264 = func.call @stack_pop_pointer() : () -> i64
          %3265 = func.call @cc_nil_value() : () -> i64
          %3266 = func.call @cc_errorp(%3264) : (i64) -> i64
          %3267 = arith.cmpi ne, %3266, %3265 : i64
          %3268 = arith.cmpi eq, %3265, %3265 : i64
          %3269 = arith.andi %3267, %3268 : i1
          %3270 = scf.if %3269 -> (i64) {
            scf.yield %3264 : i64
          } else {
            scf.yield %3265 : i64
          }
          %3271 = arith.cmpi ne, %3270, %3265 : i64
          scf.if %3271 {
            func.call @stack_push_pointer(%3270) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3264) : (i64) -> ()
            %3272 = llvm.mlir.addressof @str267 : !llvm.ptr
            %3273 = func.call @cc_make_function_ref_const(%3272) : (!llvm.ptr) -> i64
            %3274 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3273, %3274) : (i64, i64) -> ()
          }
          %3275 = func.call @stack_pop_pointer() : () -> i64
          %3277 = arith.constant 3 : i64
          %3276 = arith.andi %3263, %3277 : i64
          %3278 = arith.constant 0 : i64
          %3279 = arith.cmpi eq, %3276, %3278 : i64
          %3281 = arith.constant 3 : i64
          %3280 = arith.andi %3275, %3281 : i64
          %3282 = arith.constant 0 : i64
          %3283 = arith.cmpi eq, %3280, %3282 : i64
          %3284 = arith.andi %3279, %3283 : i1
          %3285 = scf.if %3284 -> (i64) {
            %3286 = arith.constant 2 : i64
            %3287 = arith.shrsi %3263, %3286 : i64
            %3288 = arith.constant 2 : i64
            %3289 = arith.shrsi %3275, %3288 : i64
            %3290 = arith.addi %3287, %3289 : i64
            %3291 = arith.constant -2305843009213693952 : i64
            %3292 = arith.constant 2305843009213693951 : i64
            %3293 = arith.cmpi sge, %3290, %3291 : i64
            %3294 = arith.cmpi sle, %3290, %3292 : i64
            %3295 = arith.andi %3293, %3294 : i1
            %3296 = scf.if %3295 -> (i64) {
              %3297 = arith.constant 2 : i64
              %3298 = arith.shli %3290, %3297 : i64
              scf.yield %3298 : i64
            } else {
              %3299 = func.call @cc_add(%3263, %3275) : (i64, i64) -> i64
              scf.yield %3299 : i64
            }
            scf.yield %3296 : i64
          } else {
            %3300 = func.call @cc_add(%3263, %3275) : (i64, i64) -> i64
            scf.yield %3300 : i64
          }
          func.call @stack_push_pointer(%3285) : (i64) -> ()
          %3301 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3301 : i64
        }
        func.call @stack_push_pointer(%3251) : (i64) -> ()
        %3302 = func.call @stack_pop_pointer() : () -> i64
        %3303 = func.call @cc_errorp(%3302) : (i64) -> i64
        %3304 = func.call @cc_nil_value() : () -> i64
        %3305 = arith.cmpi ne, %3303, %3304 : i64
        scf.if %3305 {
          func.call @stack_push_pointer(%3302) : (i64) -> ()
        } else {
          %3306 = func.call @cc_multiple_value_list(%3302) : (i64) -> i64
          func.call @stack_push_pointer(%3306) : (i64) -> ()
        }
        %3307 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3308 = func.call @stack_pop_pointer() : () -> i64
        %3309 = func.call @cc_nil_value() : () -> i64
        %3310 = func.call @cc_maybe_error_from_multiple_value_list(%3307) : (i64) -> i64
        %3311 = func.call @cc_errorp(%3310) : (i64) -> i64
        %3312 = arith.cmpi ne, %3311, %3309 : i64
        %3313 = arith.cmpi eq, %3309, %3309 : i64
        %3314 = arith.andi %3312, %3313 : i1
        %3315 = scf.if %3314 -> (i64) {
          scf.yield %3310 : i64
        } else {
          scf.yield %3309 : i64
        }
        %3316 = arith.cmpi ne, %3315, %3309 : i64
        scf.if %3316 {
          func.call @stack_push_pointer(%3315) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3317 = func.call @stack_pop_pointer() : () -> i64
          %3318 = func.call @cc_cons(%3308, %3317) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3318) : (i64) -> ()
          %3319 = func.call @stack_pop_pointer() : () -> i64
          %3320 = func.call @cc_cons(%3307, %3319) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3320) : (i64) -> ()
          %3321 = func.call @stack_pop_pointer() : () -> i64
          %3322 = func.call @cc_values_pack(%3321) : (i64) -> i64
          func.call @stack_push_pointer(%3322) : (i64) -> ()
        }
        %3323 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3323 : i64
      }
      func.call @stack_push_pointer(%3242) : (i64) -> ()
      %3324 = func.call @stack_pop_pointer() : () -> i64
      %3325 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3326 = func.call @cc_errorp(%3324) : (i64) -> i64
      %3327 = func.call @cc_nil_value() : () -> i64
      %3328 = arith.cmpi ne, %3326, %3327 : i64
      scf.if %3328 {
        %3329 = func.call @cc_condition_value(%3324) : (i64) -> i64
        %3330 = func.call @cc_values2(%3327, %3329) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3330) : (i64) -> ()
      } else {
        %3331 = func.call @cc_multiple_value_list(%3324) : (i64) -> i64
        %3332 = func.call @cc_values_pack(%3331) : (i64) -> i64
        func.call @stack_push_pointer(%3332) : (i64) -> ()
      }
      %3333 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3333 : i64
    }
    func.call @stack_push_pointer(%3236) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645209"() {
    %3810 = func.call @cc_nil_value() : () -> i64
    %3811 = func.call @cc_nil_value() : () -> i64
    %3812 = func.call @cc_errorp(%3810) : (i64) -> i64
    %3813 = arith.cmpi ne, %3812, %3811 : i64
    %3814 = scf.if %3813 -> (i64) {
      scf.yield %3810 : i64
    } else {
      %3815 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3816 = arith.constant 8 : i64
      %3817 = func.call @cc_make_string(%3815, %3816) : (!llvm.ptr, i64) -> i64
      %3818 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3819 = arith.constant 7 : i64
      %3820 = func.call @cc_make_string(%3818, %3819) : (!llvm.ptr, i64) -> i64
      %3821 = func.call @cc_intern(%3817, %3820) : (i64, i64) -> i64
      %3822 = func.call @cc_nil_value() : () -> i64
      %3823 = func.call @cc_cons(%3821, %3822) : (i64, i64) -> i64
      %3824 = func.call @cc_values_pack(%3823) : (i64) -> i64
      func.call @stack_push_pointer(%3821) : (i64) -> ()
      %3825 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3826 = arith.constant 7 : i64
      %3827 = func.call @cc_make_string(%3825, %3826) : (!llvm.ptr, i64) -> i64
      %3828 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3829 = arith.constant 7 : i64
      %3830 = func.call @cc_make_string(%3828, %3829) : (!llvm.ptr, i64) -> i64
      %3831 = func.call @cc_intern(%3827, %3830) : (i64, i64) -> i64
      %3832 = func.call @cc_nil_value() : () -> i64
      %3833 = func.call @cc_cons(%3831, %3832) : (i64, i64) -> i64
      %3834 = func.call @cc_values_pack(%3833) : (i64) -> i64
      func.call @stack_push_pointer(%3831) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3835 = func.call @stack_pop_pointer() : () -> i64
      %3836 = func.call @stack_pop_pointer() : () -> i64
      %3837 = func.call @cc_cons(%3836, %3835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3837) : (i64) -> ()
      %3838 = func.call @stack_pop_pointer() : () -> i64
      %3839 = func.call @stack_pop_pointer() : () -> i64
      %3840 = func.call @cc_cons(%3839, %3838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3840) : (i64) -> ()
      %3841 = func.call @stack_pop_pointer() : () -> i64
      %3842 = func.call @cc_push_float_trap_mask(%3841) : (i64) -> i64
      %3843 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%3843) : (i64) -> ()
      %3844 = func.call @stack_pop_pointer() : () -> i64
      %3845 = func.call @cc_random(%3844) : (i64) -> i64
      func.call @stack_push_pointer(%3845) : (i64) -> ()
      %3846 = func.call @stack_pop_pointer() : () -> i64
      %3847 = func.call @cc_nil_value() : () -> i64
      %3848 = func.call @cc_nil_value() : () -> i64
      %3849 = func.call @cc_errorp(%3847) : (i64) -> i64
      %3850 = arith.cmpi ne, %3849, %3848 : i64
      %3851 = scf.if %3850 -> (i64) {
        scf.yield %3847 : i64
      } else {
        func.call @stack_push_pointer(%3846) : (i64) -> ()
        %3852 = func.call @stack_pop_pointer() : () -> i64
        %3853 = func.call @cc_nil_value() : () -> i64
        %3854 = func.call @cc_errorp(%3852) : (i64) -> i64
        %3855 = arith.cmpi ne, %3854, %3853 : i64
        %3856 = arith.cmpi eq, %3853, %3853 : i64
        %3857 = arith.andi %3855, %3856 : i1
        %3858 = scf.if %3857 -> (i64) {
          scf.yield %3852 : i64
        } else {
          scf.yield %3853 : i64
        }
        %3859 = arith.cmpi ne, %3858, %3853 : i64
        scf.if %3859 {
          func.call @stack_push_pointer(%3858) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3852) : (i64) -> ()
          %3860 = llvm.mlir.addressof @str326 : !llvm.ptr
          %3861 = func.call @cc_make_function_ref_const(%3860) : (!llvm.ptr) -> i64
          %3862 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3861, %3862) : (i64, i64) -> ()
        }
        %3863 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3846) : (i64) -> ()
        %3864 = func.call @stack_pop_pointer() : () -> i64
        %3865 = func.call @cc_nil_value() : () -> i64
        %3866 = func.call @cc_errorp(%3864) : (i64) -> i64
        %3867 = arith.cmpi ne, %3866, %3865 : i64
        %3868 = arith.cmpi eq, %3865, %3865 : i64
        %3869 = arith.andi %3867, %3868 : i1
        %3870 = scf.if %3869 -> (i64) {
          scf.yield %3864 : i64
        } else {
          scf.yield %3865 : i64
        }
        %3871 = arith.cmpi ne, %3870, %3865 : i64
        scf.if %3871 {
          func.call @stack_push_pointer(%3870) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3864) : (i64) -> ()
          %3872 = llvm.mlir.addressof @str327 : !llvm.ptr
          %3873 = func.call @cc_make_function_ref_const(%3872) : (!llvm.ptr) -> i64
          %3874 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3873, %3874) : (i64, i64) -> ()
        }
        %3875 = func.call @stack_pop_pointer() : () -> i64
        %3877 = arith.constant 3 : i64
        %3876 = arith.andi %3863, %3877 : i64
        %3878 = arith.constant 0 : i64
        %3879 = arith.cmpi eq, %3876, %3878 : i64
        %3881 = arith.constant 3 : i64
        %3880 = arith.andi %3875, %3881 : i64
        %3882 = arith.constant 0 : i64
        %3883 = arith.cmpi eq, %3880, %3882 : i64
        %3884 = arith.andi %3879, %3883 : i1
        %3885 = scf.if %3884 -> (i64) {
          %3886 = arith.constant 2 : i64
          %3887 = arith.shrsi %3863, %3886 : i64
          %3888 = arith.constant 2 : i64
          %3889 = arith.shrsi %3875, %3888 : i64
          %3890 = arith.addi %3887, %3889 : i64
          %3891 = arith.constant -2305843009213693952 : i64
          %3892 = arith.constant 2305843009213693951 : i64
          %3893 = arith.cmpi sge, %3890, %3891 : i64
          %3894 = arith.cmpi sle, %3890, %3892 : i64
          %3895 = arith.andi %3893, %3894 : i1
          %3896 = scf.if %3895 -> (i64) {
            %3897 = arith.constant 2 : i64
            %3898 = arith.shli %3890, %3897 : i64
            scf.yield %3898 : i64
          } else {
            %3899 = func.call @cc_add(%3863, %3875) : (i64, i64) -> i64
            scf.yield %3899 : i64
          }
          scf.yield %3896 : i64
        } else {
          %3900 = func.call @cc_add(%3863, %3875) : (i64, i64) -> i64
          scf.yield %3900 : i64
        }
        func.call @stack_push_pointer(%3885) : (i64) -> ()
        %3901 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3901 : i64
      }
      func.call @stack_push_pointer(%3851) : (i64) -> ()
      %3902 = func.call @cc_restore_float_trap_mask(%3842) : (i64) -> i64
      %3903 = func.call @stack_pop_pointer() : () -> i64
      %3904 = func.call @cc_nil_value() : () -> i64
      %3905 = func.call @cc_errorp(%3903) : (i64) -> i64
      %3906 = arith.cmpi ne, %3905, %3904 : i64
      %3907 = arith.cmpi eq, %3904, %3904 : i64
      %3908 = arith.andi %3906, %3907 : i1
      %3909 = scf.if %3908 -> (i64) {
        scf.yield %3903 : i64
      } else {
        scf.yield %3904 : i64
      }
      %3910 = arith.cmpi ne, %3909, %3904 : i64
      scf.if %3910 {
        func.call @stack_push_pointer(%3909) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3903) : (i64) -> ()
        %3911 = llvm.mlir.addressof @str328 : !llvm.ptr
        %3912 = func.call @cc_make_function_ref_const(%3911) : (!llvm.ptr) -> i64
        %3913 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3912, %3913) : (i64, i64) -> ()
      }
      %3914 = func.call @stack_pop_pointer() : () -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = func.call @cc_cons(%3914, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_not(%3916) : (i64) -> i64
      func.call @stack_push_pointer(%3917) : (i64) -> ()
      %3918 = func.call @stack_pop_pointer() : () -> i64
      %3919 = func.call @cc_nil_value() : () -> i64
      %3920 = func.call @cc_cons(%3918, %3919) : (i64, i64) -> i64
      %3921 = func.call @cc_not(%3920) : (i64) -> i64
      func.call @stack_push_pointer(%3921) : (i64) -> ()
      %3922 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3922 : i64
    }
    func.call @stack_push_pointer(%3814) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645210"() {
    %4192 = func.call @cc_nil_value() : () -> i64
    %4193 = func.call @cc_nil_value() : () -> i64
    %4194 = func.call @cc_errorp(%4192) : (i64) -> i64
    %4195 = arith.cmpi ne, %4194, %4193 : i64
    %4196 = scf.if %4195 -> (i64) {
      scf.yield %4192 : i64
    } else {
      %4197 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4198 = func.call @cc_nil_value() : () -> i64
      %4199 = func.call @cc_nil_value() : () -> i64
      %4200 = func.call @cc_errorp(%4198) : (i64) -> i64
      %4201 = arith.cmpi ne, %4200, %4199 : i64
      %4202 = scf.if %4201 -> (i64) {
        scf.yield %4198 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4203 = arith.constant 100 : i64
        func.call @stack_push_fixnum(%4203) : (i64) -> ()
        %4204 = func.call @stack_pop_pointer() : () -> i64
        %4205 = func.call @cc_random(%4204) : (i64) -> i64
        func.call @stack_push_pointer(%4205) : (i64) -> ()
        %4206 = func.call @stack_pop_pointer() : () -> i64
        %4207 = func.call @cc_nil_value() : () -> i64
        %4208 = func.call @cc_nil_value() : () -> i64
        %4209 = func.call @cc_errorp(%4207) : (i64) -> i64
        %4210 = arith.cmpi ne, %4209, %4208 : i64
        %4211 = scf.if %4210 -> (i64) {
          scf.yield %4207 : i64
        } else {
          func.call @stack_push_pointer(%4206) : (i64) -> ()
          %4212 = func.call @stack_pop_pointer() : () -> i64
          %4213 = func.call @cc_nil_value() : () -> i64
          %4214 = func.call @cc_errorp(%4212) : (i64) -> i64
          %4215 = arith.cmpi ne, %4214, %4213 : i64
          %4216 = arith.cmpi eq, %4213, %4213 : i64
          %4217 = arith.andi %4215, %4216 : i1
          %4218 = scf.if %4217 -> (i64) {
            scf.yield %4212 : i64
          } else {
            scf.yield %4213 : i64
          }
          %4219 = arith.cmpi ne, %4218, %4213 : i64
          scf.if %4219 {
            func.call @stack_push_pointer(%4218) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4212) : (i64) -> ()
            %4220 = llvm.mlir.addressof @str351 : !llvm.ptr
            %4221 = func.call @cc_make_function_ref_const(%4220) : (!llvm.ptr) -> i64
            %4222 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4221, %4222) : (i64, i64) -> ()
          }
          %4223 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4206) : (i64) -> ()
          %4224 = func.call @stack_pop_pointer() : () -> i64
          %4225 = func.call @cc_nil_value() : () -> i64
          %4226 = func.call @cc_errorp(%4224) : (i64) -> i64
          %4227 = arith.cmpi ne, %4226, %4225 : i64
          %4228 = arith.cmpi eq, %4225, %4225 : i64
          %4229 = arith.andi %4227, %4228 : i1
          %4230 = scf.if %4229 -> (i64) {
            scf.yield %4224 : i64
          } else {
            scf.yield %4225 : i64
          }
          %4231 = arith.cmpi ne, %4230, %4225 : i64
          scf.if %4231 {
            func.call @stack_push_pointer(%4230) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4224) : (i64) -> ()
            %4232 = llvm.mlir.addressof @str352 : !llvm.ptr
            %4233 = func.call @cc_make_function_ref_const(%4232) : (!llvm.ptr) -> i64
            %4234 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4233, %4234) : (i64, i64) -> ()
          }
          %4235 = func.call @stack_pop_pointer() : () -> i64
          %4237 = arith.constant 3 : i64
          %4236 = arith.andi %4223, %4237 : i64
          %4238 = arith.constant 0 : i64
          %4239 = arith.cmpi eq, %4236, %4238 : i64
          %4241 = arith.constant 3 : i64
          %4240 = arith.andi %4235, %4241 : i64
          %4242 = arith.constant 0 : i64
          %4243 = arith.cmpi eq, %4240, %4242 : i64
          %4244 = arith.andi %4239, %4243 : i1
          %4245 = scf.if %4244 -> (i64) {
            %4246 = arith.constant 2 : i64
            %4247 = arith.shrsi %4223, %4246 : i64
            %4248 = arith.constant 2 : i64
            %4249 = arith.shrsi %4235, %4248 : i64
            %4250 = arith.addi %4247, %4249 : i64
            %4251 = arith.constant -2305843009213693952 : i64
            %4252 = arith.constant 2305843009213693951 : i64
            %4253 = arith.cmpi sge, %4250, %4251 : i64
            %4254 = arith.cmpi sle, %4250, %4252 : i64
            %4255 = arith.andi %4253, %4254 : i1
            %4256 = scf.if %4255 -> (i64) {
              %4257 = arith.constant 2 : i64
              %4258 = arith.shli %4250, %4257 : i64
              scf.yield %4258 : i64
            } else {
              %4259 = func.call @cc_add(%4223, %4235) : (i64, i64) -> i64
              scf.yield %4259 : i64
            }
            scf.yield %4256 : i64
          } else {
            %4260 = func.call @cc_add(%4223, %4235) : (i64, i64) -> i64
            scf.yield %4260 : i64
          }
          func.call @stack_push_pointer(%4245) : (i64) -> ()
          %4261 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4261 : i64
        }
        func.call @stack_push_pointer(%4211) : (i64) -> ()
        %4262 = func.call @stack_pop_pointer() : () -> i64
        %4263 = func.call @cc_errorp(%4262) : (i64) -> i64
        %4264 = func.call @cc_nil_value() : () -> i64
        %4265 = arith.cmpi ne, %4263, %4264 : i64
        scf.if %4265 {
          func.call @stack_push_pointer(%4262) : (i64) -> ()
        } else {
          %4266 = func.call @cc_multiple_value_list(%4262) : (i64) -> i64
          func.call @stack_push_pointer(%4266) : (i64) -> ()
        }
        %4267 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4268 = func.call @stack_pop_pointer() : () -> i64
        %4269 = func.call @cc_nil_value() : () -> i64
        %4270 = func.call @cc_maybe_error_from_multiple_value_list(%4267) : (i64) -> i64
        %4271 = func.call @cc_errorp(%4270) : (i64) -> i64
        %4272 = arith.cmpi ne, %4271, %4269 : i64
        %4273 = arith.cmpi eq, %4269, %4269 : i64
        %4274 = arith.andi %4272, %4273 : i1
        %4275 = scf.if %4274 -> (i64) {
          scf.yield %4270 : i64
        } else {
          scf.yield %4269 : i64
        }
        %4276 = arith.cmpi ne, %4275, %4269 : i64
        scf.if %4276 {
          func.call @stack_push_pointer(%4275) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4277 = func.call @stack_pop_pointer() : () -> i64
          %4278 = func.call @cc_cons(%4268, %4277) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4278) : (i64) -> ()
          %4279 = func.call @stack_pop_pointer() : () -> i64
          %4280 = func.call @cc_cons(%4267, %4279) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4280) : (i64) -> ()
          %4281 = func.call @stack_pop_pointer() : () -> i64
          %4282 = func.call @cc_values_pack(%4281) : (i64) -> i64
          func.call @stack_push_pointer(%4282) : (i64) -> ()
        }
        %4283 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4283 : i64
      }
      func.call @stack_push_pointer(%4202) : (i64) -> ()
      %4284 = func.call @stack_pop_pointer() : () -> i64
      %4285 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4286 = func.call @cc_errorp(%4284) : (i64) -> i64
      %4287 = func.call @cc_nil_value() : () -> i64
      %4288 = arith.cmpi ne, %4286, %4287 : i64
      scf.if %4288 {
        %4289 = func.call @cc_condition_value(%4284) : (i64) -> i64
        %4290 = func.call @cc_values2(%4287, %4289) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4290) : (i64) -> ()
      } else {
        %4291 = func.call @cc_multiple_value_list(%4284) : (i64) -> i64
        %4292 = func.call @cc_values_pack(%4291) : (i64) -> i64
        func.call @stack_push_pointer(%4292) : (i64) -> ()
      }
      %4293 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4293 : i64
    }
    func.call @stack_push_pointer(%4196) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645211"() {
    %4786 = func.call @cc_nil_value() : () -> i64
    %4787 = func.call @cc_nil_value() : () -> i64
    %4788 = func.call @cc_errorp(%4786) : (i64) -> i64
    %4789 = arith.cmpi ne, %4788, %4787 : i64
    %4790 = scf.if %4789 -> (i64) {
      scf.yield %4786 : i64
    } else {
      %4791 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4792 = arith.constant 7 : i64
      %4793 = func.call @cc_make_string(%4791, %4792) : (!llvm.ptr, i64) -> i64
      %4794 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4795 = arith.constant 7 : i64
      %4796 = func.call @cc_make_string(%4794, %4795) : (!llvm.ptr, i64) -> i64
      %4797 = func.call @cc_intern(%4793, %4796) : (i64, i64) -> i64
      %4798 = func.call @cc_nil_value() : () -> i64
      %4799 = func.call @cc_cons(%4797, %4798) : (i64, i64) -> i64
      %4800 = func.call @cc_values_pack(%4799) : (i64) -> i64
      func.call @stack_push_pointer(%4797) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4801 = func.call @stack_pop_pointer() : () -> i64
      %4802 = func.call @stack_pop_pointer() : () -> i64
      %4803 = func.call @cc_cons(%4802, %4801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4803) : (i64) -> ()
      %4804 = func.call @stack_pop_pointer() : () -> i64
      %4805 = func.call @cc_push_float_trap_mask(%4804) : (i64) -> i64
      %4806 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%4806) : (i64) -> ()
      %4807 = func.call @stack_pop_pointer() : () -> i64
      %4808 = func.call @cc_random(%4807) : (i64) -> i64
      func.call @stack_push_pointer(%4808) : (i64) -> ()
      %4809 = func.call @stack_pop_pointer() : () -> i64
      %4810 = func.call @cc_nil_value() : () -> i64
      %4811 = func.call @cc_nil_value() : () -> i64
      %4812 = func.call @cc_errorp(%4810) : (i64) -> i64
      %4813 = arith.cmpi ne, %4812, %4811 : i64
      %4814 = scf.if %4813 -> (i64) {
        scf.yield %4810 : i64
      } else {
        func.call @stack_push_pointer(%4809) : (i64) -> ()
        %4815 = func.call @stack_pop_pointer() : () -> i64
        %4816 = func.call @cc_nil_value() : () -> i64
        %4817 = func.call @cc_errorp(%4815) : (i64) -> i64
        %4818 = arith.cmpi ne, %4817, %4816 : i64
        %4819 = arith.cmpi eq, %4816, %4816 : i64
        %4820 = arith.andi %4818, %4819 : i1
        %4821 = scf.if %4820 -> (i64) {
          scf.yield %4815 : i64
        } else {
          scf.yield %4816 : i64
        }
        %4822 = arith.cmpi ne, %4821, %4816 : i64
        scf.if %4822 {
          func.call @stack_push_pointer(%4821) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4815) : (i64) -> ()
          %4823 = llvm.mlir.addressof @str411 : !llvm.ptr
          %4824 = func.call @cc_make_function_ref_const(%4823) : (!llvm.ptr) -> i64
          %4825 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4824, %4825) : (i64, i64) -> ()
        }
        %4826 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4809) : (i64) -> ()
        %4827 = func.call @stack_pop_pointer() : () -> i64
        %4828 = func.call @cc_nil_value() : () -> i64
        %4829 = func.call @cc_errorp(%4827) : (i64) -> i64
        %4830 = arith.cmpi ne, %4829, %4828 : i64
        %4831 = arith.cmpi eq, %4828, %4828 : i64
        %4832 = arith.andi %4830, %4831 : i1
        %4833 = scf.if %4832 -> (i64) {
          scf.yield %4827 : i64
        } else {
          scf.yield %4828 : i64
        }
        %4834 = arith.cmpi ne, %4833, %4828 : i64
        scf.if %4834 {
          func.call @stack_push_pointer(%4833) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4827) : (i64) -> ()
          %4835 = llvm.mlir.addressof @str412 : !llvm.ptr
          %4836 = func.call @cc_make_function_ref_const(%4835) : (!llvm.ptr) -> i64
          %4837 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4836, %4837) : (i64, i64) -> ()
        }
        %4838 = func.call @stack_pop_pointer() : () -> i64
        %4839 = func.call @cc_div(%4826, %4838) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4839) : (i64) -> ()
        %4840 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4840 : i64
      }
      func.call @stack_push_pointer(%4814) : (i64) -> ()
      %4841 = func.call @cc_restore_float_trap_mask(%4805) : (i64) -> i64
      %4842 = func.call @stack_pop_pointer() : () -> i64
      %4843 = func.call @cc_nil_value() : () -> i64
      %4844 = func.call @cc_errorp(%4842) : (i64) -> i64
      %4845 = arith.cmpi ne, %4844, %4843 : i64
      %4846 = arith.cmpi eq, %4843, %4843 : i64
      %4847 = arith.andi %4845, %4846 : i1
      %4848 = scf.if %4847 -> (i64) {
        scf.yield %4842 : i64
      } else {
        scf.yield %4843 : i64
      }
      %4849 = arith.cmpi ne, %4848, %4843 : i64
      scf.if %4849 {
        func.call @stack_push_pointer(%4848) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4842) : (i64) -> ()
        %4850 = llvm.mlir.addressof @str413 : !llvm.ptr
        %4851 = func.call @cc_make_function_ref_const(%4850) : (!llvm.ptr) -> i64
        %4852 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4851, %4852) : (i64, i64) -> ()
      }
      %4853 = func.call @stack_pop_pointer() : () -> i64
      %4854 = func.call @cc_nil_value() : () -> i64
      %4855 = func.call @cc_cons(%4853, %4854) : (i64, i64) -> i64
      %4856 = func.call @cc_not(%4855) : (i64) -> i64
      func.call @stack_push_pointer(%4856) : (i64) -> ()
      %4857 = func.call @stack_pop_pointer() : () -> i64
      %4858 = func.call @cc_nil_value() : () -> i64
      %4859 = func.call @cc_cons(%4857, %4858) : (i64, i64) -> i64
      %4860 = func.call @cc_not(%4859) : (i64) -> i64
      func.call @stack_push_pointer(%4860) : (i64) -> ()
      %4861 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4861 : i64
    }
    func.call @stack_push_pointer(%4790) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645212"() {
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
        %5142 = arith.constant 100 : i64
        func.call @stack_push_fixnum(%5142) : (i64) -> ()
        %5143 = func.call @stack_pop_pointer() : () -> i64
        %5144 = func.call @cc_random(%5143) : (i64) -> i64
        func.call @stack_push_pointer(%5144) : (i64) -> ()
        %5145 = func.call @stack_pop_pointer() : () -> i64
        %5146 = func.call @cc_nil_value() : () -> i64
        %5147 = func.call @cc_nil_value() : () -> i64
        %5148 = func.call @cc_errorp(%5146) : (i64) -> i64
        %5149 = arith.cmpi ne, %5148, %5147 : i64
        %5150 = scf.if %5149 -> (i64) {
          scf.yield %5146 : i64
        } else {
          func.call @stack_push_pointer(%5145) : (i64) -> ()
          %5151 = func.call @stack_pop_pointer() : () -> i64
          %5152 = func.call @cc_nil_value() : () -> i64
          %5153 = func.call @cc_errorp(%5151) : (i64) -> i64
          %5154 = arith.cmpi ne, %5153, %5152 : i64
          %5155 = arith.cmpi eq, %5152, %5152 : i64
          %5156 = arith.andi %5154, %5155 : i1
          %5157 = scf.if %5156 -> (i64) {
            scf.yield %5151 : i64
          } else {
            scf.yield %5152 : i64
          }
          %5158 = arith.cmpi ne, %5157, %5152 : i64
          scf.if %5158 {
            func.call @stack_push_pointer(%5157) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%5151) : (i64) -> ()
            %5159 = llvm.mlir.addressof @str436 : !llvm.ptr
            %5160 = func.call @cc_make_function_ref_const(%5159) : (!llvm.ptr) -> i64
            %5161 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%5160, %5161) : (i64, i64) -> ()
          }
          %5162 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%5145) : (i64) -> ()
          %5163 = func.call @stack_pop_pointer() : () -> i64
          %5164 = func.call @cc_nil_value() : () -> i64
          %5165 = func.call @cc_errorp(%5163) : (i64) -> i64
          %5166 = arith.cmpi ne, %5165, %5164 : i64
          %5167 = arith.cmpi eq, %5164, %5164 : i64
          %5168 = arith.andi %5166, %5167 : i1
          %5169 = scf.if %5168 -> (i64) {
            scf.yield %5163 : i64
          } else {
            scf.yield %5164 : i64
          }
          %5170 = arith.cmpi ne, %5169, %5164 : i64
          scf.if %5170 {
            func.call @stack_push_pointer(%5169) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%5163) : (i64) -> ()
            %5171 = llvm.mlir.addressof @str437 : !llvm.ptr
            %5172 = func.call @cc_make_function_ref_const(%5171) : (!llvm.ptr) -> i64
            %5173 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%5172, %5173) : (i64, i64) -> ()
          }
          %5174 = func.call @stack_pop_pointer() : () -> i64
          %5175 = func.call @cc_div(%5162, %5174) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5175) : (i64) -> ()
          %5176 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %5176 : i64
        }
        func.call @stack_push_pointer(%5150) : (i64) -> ()
        %5177 = func.call @stack_pop_pointer() : () -> i64
        %5178 = func.call @cc_errorp(%5177) : (i64) -> i64
        %5179 = func.call @cc_nil_value() : () -> i64
        %5180 = arith.cmpi ne, %5178, %5179 : i64
        scf.if %5180 {
          func.call @stack_push_pointer(%5177) : (i64) -> ()
        } else {
          %5181 = func.call @cc_multiple_value_list(%5177) : (i64) -> i64
          func.call @stack_push_pointer(%5181) : (i64) -> ()
        }
        %5182 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5183 = func.call @stack_pop_pointer() : () -> i64
        %5184 = func.call @cc_nil_value() : () -> i64
        %5185 = func.call @cc_maybe_error_from_multiple_value_list(%5182) : (i64) -> i64
        %5186 = func.call @cc_errorp(%5185) : (i64) -> i64
        %5187 = arith.cmpi ne, %5186, %5184 : i64
        %5188 = arith.cmpi eq, %5184, %5184 : i64
        %5189 = arith.andi %5187, %5188 : i1
        %5190 = scf.if %5189 -> (i64) {
          scf.yield %5185 : i64
        } else {
          scf.yield %5184 : i64
        }
        %5191 = arith.cmpi ne, %5190, %5184 : i64
        scf.if %5191 {
          func.call @stack_push_pointer(%5190) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5192 = func.call @stack_pop_pointer() : () -> i64
          %5193 = func.call @cc_cons(%5183, %5192) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5193) : (i64) -> ()
          %5194 = func.call @stack_pop_pointer() : () -> i64
          %5195 = func.call @cc_cons(%5182, %5194) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5195) : (i64) -> ()
          %5196 = func.call @stack_pop_pointer() : () -> i64
          %5197 = func.call @cc_values_pack(%5196) : (i64) -> i64
          func.call @stack_push_pointer(%5197) : (i64) -> ()
        }
        %5198 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5198 : i64
      }
      func.call @stack_push_pointer(%5141) : (i64) -> ()
      %5199 = func.call @stack_pop_pointer() : () -> i64
      %5200 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5201 = func.call @cc_errorp(%5199) : (i64) -> i64
      %5202 = func.call @cc_nil_value() : () -> i64
      %5203 = arith.cmpi ne, %5201, %5202 : i64
      scf.if %5203 {
        %5204 = func.call @cc_condition_value(%5199) : (i64) -> i64
        %5205 = func.call @cc_values2(%5202, %5204) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5205) : (i64) -> ()
      } else {
        %5206 = func.call @cc_multiple_value_list(%5199) : (i64) -> i64
        %5207 = func.call @cc_values_pack(%5206) : (i64) -> i64
        func.call @stack_push_pointer(%5207) : (i64) -> ()
      }
      %5208 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5208 : i64
    }
    func.call @stack_push_pointer(%5135) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_152926823645184*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_152926823645184*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_152926823645184*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_152926823645185*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_152926823645185*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_152926823645185*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETFLAG_152926823645185*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETVALUE_152926823645185*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETMVLIST_152926823645185*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETFLAG_152926823645184*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETMVLIST_152926823645184*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str17("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str18("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_152926823645186*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_152926823645186*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_152926823645186*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETFLAG_152926823645187*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETVALUE_152926823645187*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETMVLIST_152926823645187*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str25("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETFLAG_152926823645187*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str30("*__MLIR_BLOCK_RETVALUE_152926823645187*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETMVLIST_152926823645187*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETFLAG_152926823645186*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETMVLIST_152926823645186*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str34("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str35("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETFLAG_152926823645188*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETVALUE_152926823645188*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETMVLIST_152926823645188*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str39("*__MLIR_BLOCK_RETFLAG_152926823645189*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str40("*__MLIR_BLOCK_RETVALUE_152926823645189*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str41("*__MLIR_BLOCK_RETMVLIST_152926823645189*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str42("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str43("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str45("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str46("*__MLIR_BLOCK_RETFLAG_152926823645189*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str47("*__MLIR_BLOCK_RETVALUE_152926823645189*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETMVLIST_152926823645189*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETFLAG_152926823645188*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETMVLIST_152926823645188*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str51("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str52("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str53("*__MLIR_BLOCK_RETFLAG_152926823645190*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str54("*__MLIR_BLOCK_RETVALUE_152926823645190*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str55("*__MLIR_BLOCK_RETMVLIST_152926823645190*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str56("*__MLIR_BLOCK_RETFLAG_152926823645191*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str57("*__MLIR_BLOCK_RETVALUE_152926823645191*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETMVLIST_152926823645191*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str59("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETFLAG_152926823645191*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str64("*__MLIR_BLOCK_RETVALUE_152926823645191*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETMVLIST_152926823645191*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str66("*__MLIR_BLOCK_RETFLAG_152926823645190*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETMVLIST_152926823645190*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str68("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str69("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_152926823645192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETVALUE_152926823645192*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETMVLIST_152926823645192*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str73("*__MLIR_BLOCK_RETFLAG_152926823645193*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str74("*__MLIR_BLOCK_RETVALUE_152926823645193*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETMVLIST_152926823645193*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETFLAG_152926823645193*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str77("*__MLIR_BLOCK_RETVALUE_152926823645193*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str78("*__MLIR_BLOCK_RETMVLIST_152926823645193*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETFLAG_152926823645192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETMVLIST_152926823645192*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str81("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str82("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str83("*__MLIR_BLOCK_RETFLAG_152926823645194*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str84("*__MLIR_BLOCK_RETVALUE_152926823645194*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str85("*__MLIR_BLOCK_RETMVLIST_152926823645194*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str86("*__MLIR_BLOCK_RETFLAG_152926823645195*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str87("*__MLIR_BLOCK_RETVALUE_152926823645195*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str88("*__MLIR_BLOCK_RETMVLIST_152926823645195*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str89("*__MLIR_BLOCK_RETFLAG_152926823645195*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str90("*__MLIR_BLOCK_RETVALUE_152926823645195*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str91("*__MLIR_BLOCK_RETMVLIST_152926823645195*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str92("*__MLIR_BLOCK_RETFLAG_152926823645194*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str93("*__MLIR_BLOCK_RETMVLIST_152926823645194*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str94("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str95("*__MLIR_BLOCK_RETFLAG_152926823645196*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str96("*__MLIR_BLOCK_RETVALUE_152926823645196*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str97("*__MLIR_BLOCK_RETMVLIST_152926823645196*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str98("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("FLOAT-FEATURES-1A\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str100("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str101("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str102("FLOAT-INFINITY-P\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str103("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str104("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str107("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str108(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str113("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str114(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str119("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str120("DIVIDE-BY-ZERO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str121("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str122("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str125("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str126("LOCAL_FOO_152926823645198\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str127("*__MLIR_BLOCK_RETFLAG_152926823645200*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str128("*__MLIR_BLOCK_RETVALUE_152926823645200*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str129("*__MLIR_BLOCK_RETMVLIST_152926823645200*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str130("*__MLIR_BLOCK_RETFLAG_152926823645200*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str131("*__MLIR_BLOCK_RETMVLIST_152926823645200*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str132("LOCAL_BAR_152926823645199\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str133("*__MLIR_BLOCK_RETFLAG_152926823645201*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str134("*__MLIR_BLOCK_RETVALUE_152926823645201*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str135("*__MLIR_BLOCK_RETMVLIST_152926823645201*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str136("*__MLIR_BLOCK_RETFLAG_152926823645201*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str137("*__MLIR_BLOCK_RETMVLIST_152926823645201*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str138("DIVIDE-BY-ZERO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str139("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str140("ext:float-infinity-p\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str141("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str142("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str143("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str144("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str145("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str146("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str147("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str148("FLOAT-FEATURES-1B\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str149("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str150("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str151("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str152("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str153("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str154("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str155("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str156("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str157(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str160("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str162("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str163(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str164("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str165("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str168("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str170("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str171("LOCAL_FOO_152926823645203\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str172("*__MLIR_BLOCK_RETFLAG_152926823645205*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str173("*__MLIR_BLOCK_RETVALUE_152926823645205*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str174("*__MLIR_BLOCK_RETMVLIST_152926823645205*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str175("*__MLIR_BLOCK_RETFLAG_152926823645205*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str176("*__MLIR_BLOCK_RETMVLIST_152926823645205*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str177("LOCAL_BAR_152926823645204\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str178("*__MLIR_BLOCK_RETFLAG_152926823645206*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETVALUE_152926823645206*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str180("*__MLIR_BLOCK_RETMVLIST_152926823645206*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str181("*__MLIR_BLOCK_RETFLAG_152926823645206*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str182("*__MLIR_BLOCK_RETMVLIST_152926823645206*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str183("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str184("DIVISION-BY-ZERO\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str185("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str188("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str190("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str191("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str192("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str193("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str194("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str195("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str196("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str197("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str198("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str199("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str200("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str201("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str202("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str203("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str204("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str205("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str206("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str207("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str208("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str209("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str210("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str211("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str212("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str213("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str214("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str215("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str216("FLOAT-FEATURES-3\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str217("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str218("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str219("FLOAT-INFINITY-P\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str220("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str221("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str222("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str223("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str224("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str225("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str228("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str229("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str234("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str235("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str236("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str237("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str238("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str239("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str240("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str241("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str242("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str243("ext:float-infinity-p\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str244("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str245("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str247("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str248("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str249("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str250("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str251("FLOAT-FEATURES-4\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str252("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str253("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str255("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str256("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str257("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str258("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str259("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str260("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str261("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str262("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str263("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str264("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str265("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str266("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str267("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str268("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str269("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str270("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str271("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str272("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str273("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str274("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str275("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str276("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str277("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str278("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str279("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str280("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str281("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str282("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str283("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str284("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str285("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str286("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str287("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str288("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str289("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str290("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str291("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str292("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str293("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str294("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str295("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str296("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str297("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str298("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str299("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str300("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str301("FLOAT-FEATURES-5\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str302("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str303("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str304("FLOAT-INFINITY-P\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str305("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str306("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str307("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str308("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str309("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str310("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str313("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str314("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str315("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str317("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str318("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str319("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str320("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str321("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str322("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str323("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str324("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str325("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str326("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str327("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str328("ext:float-infinity-p\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str329("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str330("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str331("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str332("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str333("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str334("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str335("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str336("FLOAT-FEATURES-6\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str337("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str338("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str339("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str340("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str341("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str342("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str343("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str344("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str345("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str346("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str348("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str349("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str350("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str351("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str352("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str353("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str354("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str355("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str356("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str357("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str358("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str359("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str360("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str362("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str363("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str364("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str365("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str366("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str367("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str368("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str369("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str370("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str371("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str372("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str373("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str374("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str375("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str376("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str377("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str378("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str379("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str380("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str381("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str382("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str383("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str384("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str385("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str386("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str387("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str388("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str389("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str390("FLOAT-FEATURES-7\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str391("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str392("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str393("FLOAT-NAN-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str394("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str395("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str396("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str397("INVALID\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str398("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str399("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str400("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str401("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str404("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str406("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str407("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str408("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str409("INVALID\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str410("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str411("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str412("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str413("ext:float-nan-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str414("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str415("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str416("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str417("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str418("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str419("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str420("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str421("FLOAT-FEATURES-8\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str422("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str423("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str425("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str426("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str427("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str428("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str429("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str430("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str431("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str432("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str433("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str434("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str435("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str436("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str437("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str438("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str439("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str440("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str441("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str442("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str443("FLOATING-POINT-INVALID-OPERATION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str444("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str445("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str446("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str447("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str448("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str449("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str450("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str451("*__MLIR_BLOCK_RETFLAG_152926823645196*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str452("*__MLIR_BLOCK_RETMVLIST_152926823645196*\00") : !llvm.array<41 x i8>
}
