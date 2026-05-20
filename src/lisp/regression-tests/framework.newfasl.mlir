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
  func.func @"%FN%message"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 7 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 25 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = arith.constant 3 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = arith.constant 0 : i64
    %15 = func.call @cc_arg(%13, %14) : (i64, i64) -> i64
    %16 = arith.constant 4 : i64
    %17 = func.call @cc_arg(%13, %16) : (i64, i64) -> i64
    %18 = arith.constant 2 : i64
    %19 = func.call @cc_box_fixnum(%18) : (i64) -> i64
    %20 = func.call @cc_collect_rest_args(%13, %19) : (i64, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = llvm.mlir.addressof @str2 : !llvm.ptr
    %23 = arith.constant 37 : i64
    %24 = func.call @cc_make_string(%22, %23) : (!llvm.ptr, i64) -> i64
    %25 = func.call @cc_nil_value() : () -> i64
    %26 = func.call @cc_intern(%24, %25) : (i64, i64) -> i64
    %27 = func.call @cc_nil_value() : () -> i64
    %28 = func.call @cc_cons(%26, %27) : (i64, i64) -> i64
    %29 = func.call @cc_values_pack(%28) : (i64) -> i64
    %30 = func.call @cc_set_symbol_value(%26, %21) : (i64, i64) -> i64
    %31 = llvm.mlir.addressof @str3 : !llvm.ptr
    %32 = arith.constant 38 : i64
    %33 = func.call @cc_make_string(%31, %32) : (!llvm.ptr, i64) -> i64
    %34 = func.call @cc_nil_value() : () -> i64
    %35 = func.call @cc_intern(%33, %34) : (i64, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_cons(%35, %36) : (i64, i64) -> i64
    %38 = func.call @cc_values_pack(%37) : (i64) -> i64
    %39 = func.call @cc_set_symbol_value(%35, %21) : (i64, i64) -> i64
    %40 = llvm.mlir.addressof @str4 : !llvm.ptr
    %41 = arith.constant 39 : i64
    %42 = func.call @cc_make_string(%40, %41) : (!llvm.ptr, i64) -> i64
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_intern(%42, %43) : (i64, i64) -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = func.call @cc_cons(%44, %45) : (i64, i64) -> i64
    %47 = func.call @cc_values_pack(%46) : (i64) -> i64
    %48 = func.call @cc_set_symbol_value(%44, %21) : (i64, i64) -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = llvm.mlir.addressof @str5 : !llvm.ptr
    %51 = arith.constant 37 : i64
    %52 = func.call @cc_make_string(%50, %51) : (!llvm.ptr, i64) -> i64
    %53 = func.call @cc_nil_value() : () -> i64
    %54 = func.call @cc_intern(%52, %53) : (i64, i64) -> i64
    %55 = func.call @cc_nil_value() : () -> i64
    %56 = func.call @cc_cons(%54, %55) : (i64, i64) -> i64
    %57 = func.call @cc_values_pack(%56) : (i64) -> i64
    %58 = func.call @cc_set_symbol_value(%54, %49) : (i64, i64) -> i64
    %59 = llvm.mlir.addressof @str6 : !llvm.ptr
    %60 = arith.constant 38 : i64
    %61 = func.call @cc_make_string(%59, %60) : (!llvm.ptr, i64) -> i64
    %62 = func.call @cc_nil_value() : () -> i64
    %63 = func.call @cc_intern(%61, %62) : (i64, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = func.call @cc_cons(%63, %64) : (i64, i64) -> i64
    %66 = func.call @cc_values_pack(%65) : (i64) -> i64
    %67 = func.call @cc_set_symbol_value(%63, %49) : (i64, i64) -> i64
    %68 = llvm.mlir.addressof @str7 : !llvm.ptr
    %69 = arith.constant 39 : i64
    %70 = func.call @cc_make_string(%68, %69) : (!llvm.ptr, i64) -> i64
    %71 = func.call @cc_nil_value() : () -> i64
    %72 = func.call @cc_intern(%70, %71) : (i64, i64) -> i64
    %73 = func.call @cc_nil_value() : () -> i64
    %74 = func.call @cc_cons(%72, %73) : (i64, i64) -> i64
    %75 = func.call @cc_values_pack(%74) : (i64) -> i64
    %76 = func.call @cc_set_symbol_value(%72, %49) : (i64, i64) -> i64
    %77 = llvm.mlir.addressof @str8 : !llvm.ptr
    %78 = arith.constant 97 : i64
    %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%79) : (i64) -> ()
    %80 = func.call @stack_pop_pointer() : () -> i64
    %81 = llvm.mlir.addressof @str9 : !llvm.ptr
    %82 = arith.constant 17 : i64
    %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
    %84 = llvm.mlir.addressof @str10 : !llvm.ptr
    %85 = arith.constant 11 : i64
    %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
    %87 = func.call @cc_intern(%83, %86) : (i64, i64) -> i64
    %88 = func.call @cc_nil_value() : () -> i64
    %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
    %90 = func.call @cc_values_pack(%89) : (i64) -> i64
    %91 = func.call @cc_symbol_value(%87) : (i64) -> i64
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
      %100 = llvm.mlir.addressof @str11 : !llvm.ptr
      %101 = func.call @cc_make_function_ref_const(%100) : (!llvm.ptr) -> i64
      %102 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%101, %102) : (i64, i64) -> ()
    }
    %103 = func.call @stack_pop_pointer() : () -> i64
    %104 = llvm.mlir.addressof @str12 : !llvm.ptr
    %105 = arith.constant 17 : i64
    %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
    %107 = llvm.mlir.addressof @str13 : !llvm.ptr
    %108 = arith.constant 11 : i64
    %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
    %110 = func.call @cc_intern(%106, %109) : (i64, i64) -> i64
    %111 = func.call @cc_nil_value() : () -> i64
    %112 = func.call @cc_cons(%110, %111) : (i64, i64) -> i64
    %113 = func.call @cc_values_pack(%112) : (i64) -> i64
    %114 = func.call @cc_symbol_value(%110) : (i64) -> i64
    func.call @stack_push_pointer(%114) : (i64) -> ()
    %115 = func.call @stack_pop_pointer() : () -> i64
    %116 = func.call @cc_nil_value() : () -> i64
    %117 = func.call @cc_errorp(%115) : (i64) -> i64
    %118 = arith.cmpi ne, %117, %116 : i64
    %119 = arith.cmpi eq, %116, %116 : i64
    %120 = arith.andi %118, %119 : i1
    %121 = scf.if %120 -> (i64) {
      scf.yield %115 : i64
    } else {
      scf.yield %116 : i64
    }
    %122 = arith.cmpi ne, %121, %116 : i64
    scf.if %122 {
      func.call @stack_push_pointer(%121) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%115) : (i64) -> ()
      %123 = llvm.mlir.addressof @str14 : !llvm.ptr
      %124 = func.call @cc_make_function_ref_const(%123) : (!llvm.ptr) -> i64
      %125 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%124, %125) : (i64, i64) -> ()
    }
    %126 = func.call @stack_pop_pointer() : () -> i64
    %127 = func.call @cc_nil_value() : () -> i64
    %128 = arith.cmpi ne, %126, %127 : i64
    scf.if %128 {
      %129 = func.call @cc_nil_value() : () -> i64
      %130 = func.call @cc_nil_value() : () -> i64
      %131 = func.call @cc_errorp(%129) : (i64) -> i64
      %132 = arith.cmpi ne, %131, %130 : i64
      %133 = scf.if %132 -> (i64) {
        scf.yield %129 : i64
      } else {
        %134 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%134) : (i64) -> ()
        %135 = func.call @stack_pop_pointer() : () -> i64
        %136 = llvm.mlir.addressof @str15 : !llvm.ptr
        %137 = arith.constant 6 : i64
        %138 = func.call @cc_make_string(%136, %137) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%138) : (i64) -> ()
        %139 = func.call @stack_pop_pointer() : () -> i64
        %140 = arith.constant 27 : i64
        %141 = func.call @cc_box_character(%140) : (i64) -> i64
        func.call @stack_push_pointer(%141) : (i64) -> ()
        %142 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%15) : (i64) -> ()
        %143 = func.call @stack_pop_pointer() : () -> i64
        %144 = func.call @cc_nil_value() : () -> i64
        %145 = func.call @cc_nil_value() : () -> i64
        %146 = func.call @cc_errorp(%144) : (i64) -> i64
        %147 = arith.cmpi ne, %146, %145 : i64
        %148 = scf.if %147 -> (i64) {
          scf.yield %144 : i64
        } else {
          func.call @stack_push_pointer(%143) : (i64) -> ()
          %149 = llvm.mlir.addressof @str16 : !llvm.ptr
          %150 = arith.constant 3 : i64
          %151 = func.call @cc_make_string(%149, %150) : (!llvm.ptr, i64) -> i64
          %152 = llvm.mlir.addressof @str17 : !llvm.ptr
          %153 = arith.constant 7 : i64
          %154 = func.call @cc_make_string(%152, %153) : (!llvm.ptr, i64) -> i64
          %155 = func.call @cc_intern(%151, %154) : (i64, i64) -> i64
          %156 = func.call @cc_nil_value() : () -> i64
          %157 = func.call @cc_cons(%155, %156) : (i64, i64) -> i64
          %158 = func.call @cc_values_pack(%157) : (i64) -> i64
          func.call @stack_push_pointer(%155) : (i64) -> ()
          %159 = func.call @stack_pop_pointer() : () -> i64
          %160 = func.call @stack_pop_pointer() : () -> i64
          %161 = func.call @cc_eq(%160, %159) : (i64, i64) -> i64
          func.call @stack_push_pointer(%161) : (i64) -> ()
          %162 = func.call @stack_pop_pointer() : () -> i64
          %163 = func.call @cc_nil_value() : () -> i64
          %164 = arith.cmpi ne, %162, %163 : i64
          scf.if %164 {
            %165 = arith.constant 31 : i64
            func.call @stack_push_fixnum(%165) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%143) : (i64) -> ()
            %166 = llvm.mlir.addressof @str18 : !llvm.ptr
            %167 = arith.constant 4 : i64
            %168 = func.call @cc_make_string(%166, %167) : (!llvm.ptr, i64) -> i64
            %169 = llvm.mlir.addressof @str19 : !llvm.ptr
            %170 = arith.constant 7 : i64
            %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
            %172 = func.call @cc_intern(%168, %171) : (i64, i64) -> i64
            %173 = func.call @cc_nil_value() : () -> i64
            %174 = func.call @cc_cons(%172, %173) : (i64, i64) -> i64
            %175 = func.call @cc_values_pack(%174) : (i64) -> i64
            func.call @stack_push_pointer(%172) : (i64) -> ()
            %176 = func.call @stack_pop_pointer() : () -> i64
            %177 = func.call @stack_pop_pointer() : () -> i64
            %178 = func.call @cc_eq(%177, %176) : (i64, i64) -> i64
            func.call @stack_push_pointer(%178) : (i64) -> ()
            %179 = func.call @stack_pop_pointer() : () -> i64
            %180 = func.call @cc_nil_value() : () -> i64
            %181 = arith.cmpi ne, %179, %180 : i64
            scf.if %181 {
              %182 = arith.constant 33 : i64
              func.call @stack_push_fixnum(%182) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%143) : (i64) -> ()
              %183 = llvm.mlir.addressof @str20 : !llvm.ptr
              %184 = arith.constant 4 : i64
              %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
              %186 = llvm.mlir.addressof @str21 : !llvm.ptr
              %187 = arith.constant 7 : i64
              %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
              %189 = func.call @cc_intern(%185, %188) : (i64, i64) -> i64
              %190 = func.call @cc_nil_value() : () -> i64
              %191 = func.call @cc_cons(%189, %190) : (i64, i64) -> i64
              %192 = func.call @cc_values_pack(%191) : (i64) -> i64
              func.call @stack_push_pointer(%189) : (i64) -> ()
              %193 = func.call @stack_pop_pointer() : () -> i64
              %194 = func.call @stack_pop_pointer() : () -> i64
              %195 = func.call @cc_eq(%194, %193) : (i64, i64) -> i64
              func.call @stack_push_pointer(%195) : (i64) -> ()
              %196 = func.call @stack_pop_pointer() : () -> i64
              %197 = func.call @cc_nil_value() : () -> i64
              %198 = arith.cmpi ne, %196, %197 : i64
              scf.if %198 {
                %199 = arith.constant 32 : i64
                func.call @stack_push_fixnum(%199) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%143) : (i64) -> ()
                %200 = llvm.mlir.addressof @str22 : !llvm.ptr
                %201 = arith.constant 9 : i64
                %202 = func.call @cc_make_string(%200, %201) : (!llvm.ptr, i64) -> i64
                %203 = llvm.mlir.addressof @str23 : !llvm.ptr
                %204 = arith.constant 11 : i64
                %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
                %206 = func.call @cc_intern(%202, %205) : (i64, i64) -> i64
                %207 = func.call @cc_nil_value() : () -> i64
                %208 = func.call @cc_cons(%206, %207) : (i64, i64) -> i64
                %209 = func.call @cc_values_pack(%208) : (i64) -> i64
                func.call @stack_push_pointer(%206) : (i64) -> ()
                %210 = func.call @stack_pop_pointer() : () -> i64
                %211 = func.call @stack_pop_pointer() : () -> i64
                %212 = func.call @cc_eq(%211, %210) : (i64, i64) -> i64
                func.call @stack_push_pointer(%212) : (i64) -> ()
                %213 = func.call @stack_pop_pointer() : () -> i64
                %214 = func.call @cc_nil_value() : () -> i64
                %215 = arith.cmpi ne, %213, %214 : i64
                scf.if %215 {
                  %216 = arith.constant 0 : i64
                  func.call @stack_push_fixnum(%216) : (i64) -> ()
              }
            }
          }
          }
          %217 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %217 : i64
        }
        func.call @stack_push_pointer(%148) : (i64) -> ()
        %218 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%135) : (i64) -> ()
        func.call @stack_push_pointer(%139) : (i64) -> ()
        func.call @stack_push_pointer(%142) : (i64) -> ()
        func.call @stack_push_pointer(%218) : (i64) -> ()
        %219 = llvm.mlir.addressof @str24 : !llvm.ptr
        %220 = func.call @cc_make_function_ref_const(%219) : (!llvm.ptr) -> i64
        %221 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%220, %221) : (i64, i64) -> ()
        %222 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %222 : i64
      }
      func.call @stack_push_pointer(%133) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %223 = func.call @stack_pop_pointer() : () -> i64
    %224 = llvm.mlir.addressof @str25 : !llvm.ptr
    %225 = func.call @cc_make_function_ref_const(%224) : (!llvm.ptr) -> i64
    func.call @stack_push_pointer(%225) : (i64) -> ()
    %226 = func.call @stack_pop_pointer() : () -> i64
    %227 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%227) : (i64) -> ()
    func.call @stack_push_pointer(%17) : (i64) -> ()
    func.call @stack_push_pointer(%20) : (i64) -> ()
    %228 = func.call @stack_pop_pointer() : () -> i64
    %229 = func.call @stack_pop_pointer() : () -> i64
    %230 = func.call @cc_cons(%229, %228) : (i64, i64) -> i64
    %231 = func.call @stack_pop_pointer() : () -> i64
    %232 = func.call @cc_cons(%231, %230) : (i64, i64) -> i64
    %233 = func.call @cc_apply(%226, %232) : (i64, i64) -> i64
    func.call @stack_push_pointer(%233) : (i64) -> ()
    %234 = func.call @stack_pop_pointer() : () -> i64
    %235 = llvm.mlir.addressof @str26 : !llvm.ptr
    %236 = arith.constant 17 : i64
    %237 = func.call @cc_make_string(%235, %236) : (!llvm.ptr, i64) -> i64
    %238 = llvm.mlir.addressof @str27 : !llvm.ptr
    %239 = arith.constant 11 : i64
    %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
    %241 = func.call @cc_intern(%237, %240) : (i64, i64) -> i64
    %242 = func.call @cc_nil_value() : () -> i64
    %243 = func.call @cc_cons(%241, %242) : (i64, i64) -> i64
    %244 = func.call @cc_values_pack(%243) : (i64) -> i64
    %245 = func.call @cc_symbol_value(%241) : (i64) -> i64
    func.call @stack_push_pointer(%245) : (i64) -> ()
    %246 = func.call @stack_pop_pointer() : () -> i64
    %247 = func.call @cc_nil_value() : () -> i64
    %248 = func.call @cc_errorp(%246) : (i64) -> i64
    %249 = arith.cmpi ne, %248, %247 : i64
    %250 = arith.cmpi eq, %247, %247 : i64
    %251 = arith.andi %249, %250 : i1
    %252 = scf.if %251 -> (i64) {
      scf.yield %246 : i64
    } else {
      scf.yield %247 : i64
    }
    %253 = arith.cmpi ne, %252, %247 : i64
    scf.if %253 {
      func.call @stack_push_pointer(%252) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%246) : (i64) -> ()
      %254 = llvm.mlir.addressof @str28 : !llvm.ptr
      %255 = func.call @cc_make_function_ref_const(%254) : (!llvm.ptr) -> i64
      %256 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%255, %256) : (i64, i64) -> ()
    }
    %257 = func.call @stack_pop_pointer() : () -> i64
    %258 = func.call @cc_nil_value() : () -> i64
    %259 = arith.cmpi ne, %257, %258 : i64
    scf.if %259 {
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_nil_value() : () -> i64
      %262 = func.call @cc_errorp(%260) : (i64) -> i64
      %263 = arith.cmpi ne, %262, %261 : i64
      %264 = scf.if %263 -> (i64) {
        scf.yield %260 : i64
      } else {
        %265 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%265) : (i64) -> ()
        %266 = func.call @stack_pop_pointer() : () -> i64
        %267 = llvm.mlir.addressof @str29 : !llvm.ptr
        %268 = arith.constant 5 : i64
        %269 = func.call @cc_make_string(%267, %268) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%269) : (i64) -> ()
        %270 = func.call @stack_pop_pointer() : () -> i64
        %271 = arith.constant 27 : i64
        %272 = func.call @cc_box_character(%271) : (i64) -> i64
        func.call @stack_push_pointer(%272) : (i64) -> ()
        %273 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%266) : (i64) -> ()
        func.call @stack_push_pointer(%270) : (i64) -> ()
        func.call @stack_push_pointer(%273) : (i64) -> ()
        %274 = llvm.mlir.addressof @str30 : !llvm.ptr
        %275 = func.call @cc_make_function_ref_const(%274) : (!llvm.ptr) -> i64
        %276 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%275, %276) : (i64, i64) -> ()
        %277 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %277 : i64
      }
      func.call @stack_push_pointer(%264) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %278 = func.call @stack_pop_pointer() : () -> i64
    %279 = llvm.mlir.addressof @str31 : !llvm.ptr
    %280 = arith.constant 17 : i64
    %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
    %282 = llvm.mlir.addressof @str32 : !llvm.ptr
    %283 = arith.constant 11 : i64
    %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
    %285 = func.call @cc_intern(%281, %284) : (i64, i64) -> i64
    %286 = func.call @cc_nil_value() : () -> i64
    %287 = func.call @cc_cons(%285, %286) : (i64, i64) -> i64
    %288 = func.call @cc_values_pack(%287) : (i64) -> i64
    %289 = func.call @cc_symbol_value(%285) : (i64) -> i64
    func.call @stack_push_pointer(%289) : (i64) -> ()
    %290 = func.call @stack_pop_pointer() : () -> i64
    %291 = func.call @cc_nil_value() : () -> i64
    %292 = func.call @cc_errorp(%290) : (i64) -> i64
    %293 = arith.cmpi ne, %292, %291 : i64
    %294 = arith.cmpi eq, %291, %291 : i64
    %295 = arith.andi %293, %294 : i1
    %296 = scf.if %295 -> (i64) {
      scf.yield %290 : i64
    } else {
      scf.yield %291 : i64
    }
    %297 = arith.cmpi ne, %296, %291 : i64
    scf.if %297 {
      func.call @stack_push_pointer(%296) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%290) : (i64) -> ()
      %298 = llvm.mlir.addressof @str33 : !llvm.ptr
      %299 = func.call @cc_make_function_ref_const(%298) : (!llvm.ptr) -> i64
      %300 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%299, %300) : (i64, i64) -> ()
    }
    %301 = func.call @stack_pop_pointer() : () -> i64
    %302 = func.call @cc_multiple_value_list(%301) : (i64) -> i64
    %303 = llvm.mlir.addressof @str34 : !llvm.ptr
    %304 = arith.constant 37 : i64
    %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
    %306 = func.call @cc_nil_value() : () -> i64
    %307 = func.call @cc_intern(%305, %306) : (i64, i64) -> i64
    %308 = func.call @cc_nil_value() : () -> i64
    %309 = func.call @cc_cons(%307, %308) : (i64, i64) -> i64
    %310 = func.call @cc_values_pack(%309) : (i64) -> i64
    %311 = func.call @cc_symbol_value(%307) : (i64) -> i64
    %312 = llvm.mlir.addressof @str35 : !llvm.ptr
    %313 = arith.constant 38 : i64
    %314 = func.call @cc_make_string(%312, %313) : (!llvm.ptr, i64) -> i64
    %315 = func.call @cc_nil_value() : () -> i64
    %316 = func.call @cc_intern(%314, %315) : (i64, i64) -> i64
    %317 = func.call @cc_nil_value() : () -> i64
    %318 = func.call @cc_cons(%316, %317) : (i64, i64) -> i64
    %319 = func.call @cc_values_pack(%318) : (i64) -> i64
    %320 = func.call @cc_symbol_value(%316) : (i64) -> i64
    %321 = llvm.mlir.addressof @str36 : !llvm.ptr
    %322 = arith.constant 39 : i64
    %323 = func.call @cc_make_string(%321, %322) : (!llvm.ptr, i64) -> i64
    %324 = func.call @cc_nil_value() : () -> i64
    %325 = func.call @cc_intern(%323, %324) : (i64, i64) -> i64
    %326 = func.call @cc_nil_value() : () -> i64
    %327 = func.call @cc_cons(%325, %326) : (i64, i64) -> i64
    %328 = func.call @cc_values_pack(%327) : (i64) -> i64
    %329 = func.call @cc_symbol_value(%325) : (i64) -> i64
    %330 = func.call @cc_nil_value() : () -> i64
    %331 = arith.cmpi ne, %311, %330 : i64
    %332 = scf.if %331 -> (i64) {
      scf.yield %329 : i64
    } else {
      scf.yield %302 : i64
    }
    %333 = func.call @cc_values_pack(%332) : (i64) -> i64
    func.call @stack_push_pointer(%333) : (i64) -> ()
    %334 = func.call @stack_pop_pointer() : () -> i64
    %335 = func.call @cc_multiple_value_list(%334) : (i64) -> i64
    %336 = llvm.mlir.addressof @str37 : !llvm.ptr
    %337 = arith.constant 37 : i64
    %338 = func.call @cc_make_string(%336, %337) : (!llvm.ptr, i64) -> i64
    %339 = func.call @cc_nil_value() : () -> i64
    %340 = func.call @cc_intern(%338, %339) : (i64, i64) -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_cons(%340, %341) : (i64, i64) -> i64
    %343 = func.call @cc_values_pack(%342) : (i64) -> i64
    %344 = func.call @cc_symbol_value(%340) : (i64) -> i64
    %345 = llvm.mlir.addressof @str38 : !llvm.ptr
    %346 = arith.constant 39 : i64
    %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
    %348 = func.call @cc_nil_value() : () -> i64
    %349 = func.call @cc_intern(%347, %348) : (i64, i64) -> i64
    %350 = func.call @cc_nil_value() : () -> i64
    %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
    %352 = func.call @cc_values_pack(%351) : (i64) -> i64
    %353 = func.call @cc_symbol_value(%349) : (i64) -> i64
    %354 = func.call @cc_nil_value() : () -> i64
    %355 = arith.cmpi ne, %344, %354 : i64
    %356 = scf.if %355 -> (i64) {
      scf.yield %353 : i64
    } else {
      scf.yield %335 : i64
    }
    %357 = func.call @cc_values_pack(%356) : (i64) -> i64
    func.call @stack_push_pointer(%357) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%reset-clasp-tests"() {
    %358 = llvm.mlir.addressof @str39 : !llvm.ptr
    %359 = arith.constant 17 : i64
    %360 = func.call @cc_make_string(%358, %359) : (!llvm.ptr, i64) -> i64
    %361 = func.call @cc_nil_value() : () -> i64
    %362 = func.call @cc_intern(%360, %361) : (i64, i64) -> i64
    %363 = func.call @cc_nil_value() : () -> i64
    %364 = func.call @cc_cons(%362, %363) : (i64, i64) -> i64
    %365 = func.call @cc_values_pack(%364) : (i64) -> i64
    %366 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%362, %366) : (i64, i64) -> ()
    %367 = func.call @cc_nil_value() : () -> i64
    %368 = llvm.mlir.addressof @str40 : !llvm.ptr
    %369 = arith.constant 37 : i64
    %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
    %371 = func.call @cc_nil_value() : () -> i64
    %372 = func.call @cc_intern(%370, %371) : (i64, i64) -> i64
    %373 = func.call @cc_nil_value() : () -> i64
    %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
    %375 = func.call @cc_values_pack(%374) : (i64) -> i64
    %376 = func.call @cc_set_symbol_value(%372, %367) : (i64, i64) -> i64
    %377 = llvm.mlir.addressof @str41 : !llvm.ptr
    %378 = arith.constant 38 : i64
    %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
    %380 = func.call @cc_nil_value() : () -> i64
    %381 = func.call @cc_intern(%379, %380) : (i64, i64) -> i64
    %382 = func.call @cc_nil_value() : () -> i64
    %383 = func.call @cc_cons(%381, %382) : (i64, i64) -> i64
    %384 = func.call @cc_values_pack(%383) : (i64) -> i64
    %385 = func.call @cc_set_symbol_value(%381, %367) : (i64, i64) -> i64
    %386 = llvm.mlir.addressof @str42 : !llvm.ptr
    %387 = arith.constant 39 : i64
    %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
    %389 = func.call @cc_nil_value() : () -> i64
    %390 = func.call @cc_intern(%388, %389) : (i64, i64) -> i64
    %391 = func.call @cc_nil_value() : () -> i64
    %392 = func.call @cc_cons(%390, %391) : (i64, i64) -> i64
    %393 = func.call @cc_values_pack(%392) : (i64) -> i64
    %394 = func.call @cc_set_symbol_value(%390, %367) : (i64, i64) -> i64
    %395 = func.call @cc_nil_value() : () -> i64
    %396 = llvm.mlir.addressof @str43 : !llvm.ptr
    %397 = arith.constant 37 : i64
    %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
    %399 = func.call @cc_nil_value() : () -> i64
    %400 = func.call @cc_intern(%398, %399) : (i64, i64) -> i64
    %401 = func.call @cc_nil_value() : () -> i64
    %402 = func.call @cc_cons(%400, %401) : (i64, i64) -> i64
    %403 = func.call @cc_values_pack(%402) : (i64) -> i64
    %404 = func.call @cc_set_symbol_value(%400, %395) : (i64, i64) -> i64
    %405 = llvm.mlir.addressof @str44 : !llvm.ptr
    %406 = arith.constant 38 : i64
    %407 = func.call @cc_make_string(%405, %406) : (!llvm.ptr, i64) -> i64
    %408 = func.call @cc_nil_value() : () -> i64
    %409 = func.call @cc_intern(%407, %408) : (i64, i64) -> i64
    %410 = func.call @cc_nil_value() : () -> i64
    %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
    %412 = func.call @cc_values_pack(%411) : (i64) -> i64
    %413 = func.call @cc_set_symbol_value(%409, %395) : (i64, i64) -> i64
    %414 = llvm.mlir.addressof @str45 : !llvm.ptr
    %415 = arith.constant 39 : i64
    %416 = func.call @cc_make_string(%414, %415) : (!llvm.ptr, i64) -> i64
    %417 = func.call @cc_nil_value() : () -> i64
    %418 = func.call @cc_intern(%416, %417) : (i64, i64) -> i64
    %419 = func.call @cc_nil_value() : () -> i64
    %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
    %421 = func.call @cc_values_pack(%420) : (i64) -> i64
    %422 = func.call @cc_set_symbol_value(%418, %395) : (i64, i64) -> i64
    %423 = func.call @cc_nil_value() : () -> i64
    %424 = func.call @cc_nil_value() : () -> i64
    %425 = func.call @cc_errorp(%423) : (i64) -> i64
    %426 = arith.cmpi ne, %425, %424 : i64
    %427 = scf.if %426 -> (i64) {
      scf.yield %423 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %429 = llvm.mlir.addressof @str46 : !llvm.ptr
      %430 = arith.constant 23 : i64
      %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = func.call @cc_intern(%431, %432) : (i64, i64) -> i64
      %434 = func.call @cc_nil_value() : () -> i64
      %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
      %436 = func.call @cc_values_pack(%435) : (i64) -> i64
      %437 = func.call @cc_set_symbol_value(%433, %428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      %438 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %438 : i64
    }
    %439 = func.call @cc_nil_value() : () -> i64
    %440 = func.call @cc_errorp(%427) : (i64) -> i64
    %441 = arith.cmpi ne, %440, %439 : i64
    %442 = scf.if %441 -> (i64) {
      scf.yield %427 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %443 = func.call @stack_pop_pointer() : () -> i64
      %444 = llvm.mlir.addressof @str47 : !llvm.ptr
      %445 = arith.constant 25 : i64
      %446 = func.call @cc_make_string(%444, %445) : (!llvm.ptr, i64) -> i64
      %447 = func.call @cc_nil_value() : () -> i64
      %448 = func.call @cc_intern(%446, %447) : (i64, i64) -> i64
      %449 = func.call @cc_nil_value() : () -> i64
      %450 = func.call @cc_cons(%448, %449) : (i64, i64) -> i64
      %451 = func.call @cc_values_pack(%450) : (i64) -> i64
      %452 = func.call @cc_set_symbol_value(%448, %443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      %453 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %453 : i64
    }
    %454 = func.call @cc_nil_value() : () -> i64
    %455 = func.call @cc_errorp(%442) : (i64) -> i64
    %456 = arith.cmpi ne, %455, %454 : i64
    %457 = scf.if %456 -> (i64) {
      scf.yield %442 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %458 = func.call @stack_pop_pointer() : () -> i64
      %459 = llvm.mlir.addressof @str48 : !llvm.ptr
      %460 = arith.constant 23 : i64
      %461 = func.call @cc_make_string(%459, %460) : (!llvm.ptr, i64) -> i64
      %462 = func.call @cc_nil_value() : () -> i64
      %463 = func.call @cc_intern(%461, %462) : (i64, i64) -> i64
      %464 = func.call @cc_nil_value() : () -> i64
      %465 = func.call @cc_cons(%463, %464) : (i64, i64) -> i64
      %466 = func.call @cc_values_pack(%465) : (i64) -> i64
      %467 = func.call @cc_set_symbol_value(%463, %458) : (i64, i64) -> i64
      func.call @stack_push_pointer(%458) : (i64) -> ()
      %468 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %468 : i64
    }
    %469 = func.call @cc_nil_value() : () -> i64
    %470 = func.call @cc_errorp(%457) : (i64) -> i64
    %471 = arith.cmpi ne, %470, %469 : i64
    %472 = scf.if %471 -> (i64) {
      scf.yield %457 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = llvm.mlir.addressof @str49 : !llvm.ptr
      %475 = arith.constant 25 : i64
      %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
      %477 = func.call @cc_nil_value() : () -> i64
      %478 = func.call @cc_intern(%476, %477) : (i64, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_values_pack(%480) : (i64) -> i64
      %482 = func.call @cc_set_symbol_value(%478, %473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%473) : (i64) -> ()
      %483 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %483 : i64
    }
    %484 = func.call @cc_nil_value() : () -> i64
    %485 = func.call @cc_errorp(%472) : (i64) -> i64
    %486 = arith.cmpi ne, %485, %484 : i64
    %487 = scf.if %486 -> (i64) {
      scf.yield %472 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = llvm.mlir.addressof @str50 : !llvm.ptr
      %490 = arith.constant 25 : i64
      %491 = func.call @cc_make_string(%489, %490) : (!llvm.ptr, i64) -> i64
      %492 = func.call @cc_nil_value() : () -> i64
      %493 = func.call @cc_intern(%491, %492) : (i64, i64) -> i64
      %494 = func.call @cc_nil_value() : () -> i64
      %495 = func.call @cc_cons(%493, %494) : (i64, i64) -> i64
      %496 = func.call @cc_values_pack(%495) : (i64) -> i64
      %497 = func.call @cc_set_symbol_value(%493, %488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %498 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %498 : i64
    }
    %499 = func.call @cc_nil_value() : () -> i64
    %500 = func.call @cc_errorp(%487) : (i64) -> i64
    %501 = arith.cmpi ne, %500, %499 : i64
    %502 = scf.if %501 -> (i64) {
      scf.yield %487 : i64
    } else {
      %503 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%503) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %504 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%504) : (i64) -> ()
      %505 = func.call @stack_pop_pointer() : () -> i64
      %506 = llvm.mlir.addressof @str51 : !llvm.ptr
      %507 = arith.constant 19 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = func.call @cc_nil_value() : () -> i64
      %510 = func.call @cc_intern(%508, %509) : (i64, i64) -> i64
      %511 = func.call @cc_nil_value() : () -> i64
      %512 = func.call @cc_cons(%510, %511) : (i64, i64) -> i64
      %513 = func.call @cc_values_pack(%512) : (i64) -> i64
      %514 = func.call @cc_set_symbol_value(%510, %505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%505) : (i64) -> ()
      %515 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %515 : i64
    }
    %516 = func.call @cc_nil_value() : () -> i64
    %517 = func.call @cc_errorp(%502) : (i64) -> i64
    %518 = arith.cmpi ne, %517, %516 : i64
    %519 = scf.if %518 -> (i64) {
      scf.yield %502 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %520 = func.call @stack_pop_pointer() : () -> i64
      %521 = llvm.mlir.addressof @str52 : !llvm.ptr
      %522 = arith.constant 17 : i64
      %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
      %524 = func.call @cc_nil_value() : () -> i64
      %525 = func.call @cc_intern(%523, %524) : (i64, i64) -> i64
      %526 = func.call @cc_nil_value() : () -> i64
      %527 = func.call @cc_cons(%525, %526) : (i64, i64) -> i64
      %528 = func.call @cc_values_pack(%527) : (i64) -> i64
      %529 = func.call @cc_set_symbol_value(%525, %520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%520) : (i64) -> ()
      %530 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %530 : i64
    }
    func.call @stack_push_pointer(%519) : (i64) -> ()
    %531 = func.call @stack_pop_pointer() : () -> i64
    %532 = func.call @cc_multiple_value_list(%531) : (i64) -> i64
    %533 = llvm.mlir.addressof @str53 : !llvm.ptr
    %534 = arith.constant 37 : i64
    %535 = func.call @cc_make_string(%533, %534) : (!llvm.ptr, i64) -> i64
    %536 = func.call @cc_nil_value() : () -> i64
    %537 = func.call @cc_intern(%535, %536) : (i64, i64) -> i64
    %538 = func.call @cc_nil_value() : () -> i64
    %539 = func.call @cc_cons(%537, %538) : (i64, i64) -> i64
    %540 = func.call @cc_values_pack(%539) : (i64) -> i64
    %541 = func.call @cc_symbol_value(%537) : (i64) -> i64
    %542 = llvm.mlir.addressof @str54 : !llvm.ptr
    %543 = arith.constant 38 : i64
    %544 = func.call @cc_make_string(%542, %543) : (!llvm.ptr, i64) -> i64
    %545 = func.call @cc_nil_value() : () -> i64
    %546 = func.call @cc_intern(%544, %545) : (i64, i64) -> i64
    %547 = func.call @cc_nil_value() : () -> i64
    %548 = func.call @cc_cons(%546, %547) : (i64, i64) -> i64
    %549 = func.call @cc_values_pack(%548) : (i64) -> i64
    %550 = func.call @cc_symbol_value(%546) : (i64) -> i64
    %551 = llvm.mlir.addressof @str55 : !llvm.ptr
    %552 = arith.constant 39 : i64
    %553 = func.call @cc_make_string(%551, %552) : (!llvm.ptr, i64) -> i64
    %554 = func.call @cc_nil_value() : () -> i64
    %555 = func.call @cc_intern(%553, %554) : (i64, i64) -> i64
    %556 = func.call @cc_nil_value() : () -> i64
    %557 = func.call @cc_cons(%555, %556) : (i64, i64) -> i64
    %558 = func.call @cc_values_pack(%557) : (i64) -> i64
    %559 = func.call @cc_symbol_value(%555) : (i64) -> i64
    %560 = func.call @cc_nil_value() : () -> i64
    %561 = arith.cmpi ne, %541, %560 : i64
    %562 = scf.if %561 -> (i64) {
      scf.yield %559 : i64
    } else {
      scf.yield %532 : i64
    }
    %563 = func.call @cc_values_pack(%562) : (i64) -> i64
    func.call @stack_push_pointer(%563) : (i64) -> ()
    %564 = func.call @stack_pop_pointer() : () -> i64
    %565 = func.call @cc_multiple_value_list(%564) : (i64) -> i64
    %566 = llvm.mlir.addressof @str56 : !llvm.ptr
    %567 = arith.constant 37 : i64
    %568 = func.call @cc_make_string(%566, %567) : (!llvm.ptr, i64) -> i64
    %569 = func.call @cc_nil_value() : () -> i64
    %570 = func.call @cc_intern(%568, %569) : (i64, i64) -> i64
    %571 = func.call @cc_nil_value() : () -> i64
    %572 = func.call @cc_cons(%570, %571) : (i64, i64) -> i64
    %573 = func.call @cc_values_pack(%572) : (i64) -> i64
    %574 = func.call @cc_symbol_value(%570) : (i64) -> i64
    %575 = llvm.mlir.addressof @str57 : !llvm.ptr
    %576 = arith.constant 39 : i64
    %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
    %578 = func.call @cc_nil_value() : () -> i64
    %579 = func.call @cc_intern(%577, %578) : (i64, i64) -> i64
    %580 = func.call @cc_nil_value() : () -> i64
    %581 = func.call @cc_cons(%579, %580) : (i64, i64) -> i64
    %582 = func.call @cc_values_pack(%581) : (i64) -> i64
    %583 = func.call @cc_symbol_value(%579) : (i64) -> i64
    %584 = func.call @cc_nil_value() : () -> i64
    %585 = arith.cmpi ne, %574, %584 : i64
    %586 = scf.if %585 -> (i64) {
      scf.yield %583 : i64
    } else {
      scf.yield %565 : i64
    }
    %587 = func.call @cc_values_pack(%586) : (i64) -> i64
    func.call @stack_push_pointer(%587) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%note-compile-error"() {
    %588 = llvm.mlir.addressof @str58 : !llvm.ptr
    %589 = arith.constant 18 : i64
    %590 = func.call @cc_make_string(%588, %589) : (!llvm.ptr, i64) -> i64
    %591 = func.call @cc_nil_value() : () -> i64
    %592 = func.call @cc_intern(%590, %591) : (i64, i64) -> i64
    %593 = func.call @cc_nil_value() : () -> i64
    %594 = func.call @cc_cons(%592, %593) : (i64, i64) -> i64
    %595 = func.call @cc_values_pack(%594) : (i64) -> i64
    %596 = llvm.mlir.addressof @str59 : !llvm.ptr
    %597 = arith.constant 10 : i64
    %598 = func.call @cc_make_string(%596, %597) : (!llvm.ptr, i64) -> i64
    %599 = func.call @cc_register_function_lambda_list_metadata_raw(%592, %598) : (i64, i64) -> i64
    %600 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%592, %600) : (i64, i64) -> ()
    %601 = func.call @stack_pop_pointer() : () -> i64
    %602 = func.call @cc_nil_value() : () -> i64
    %603 = llvm.mlir.addressof @str60 : !llvm.ptr
    %604 = arith.constant 37 : i64
    %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
    %606 = func.call @cc_nil_value() : () -> i64
    %607 = func.call @cc_intern(%605, %606) : (i64, i64) -> i64
    %608 = func.call @cc_nil_value() : () -> i64
    %609 = func.call @cc_cons(%607, %608) : (i64, i64) -> i64
    %610 = func.call @cc_values_pack(%609) : (i64) -> i64
    %611 = func.call @cc_set_symbol_value(%607, %602) : (i64, i64) -> i64
    %612 = llvm.mlir.addressof @str61 : !llvm.ptr
    %613 = arith.constant 38 : i64
    %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
    %615 = func.call @cc_nil_value() : () -> i64
    %616 = func.call @cc_intern(%614, %615) : (i64, i64) -> i64
    %617 = func.call @cc_nil_value() : () -> i64
    %618 = func.call @cc_cons(%616, %617) : (i64, i64) -> i64
    %619 = func.call @cc_values_pack(%618) : (i64) -> i64
    %620 = func.call @cc_set_symbol_value(%616, %602) : (i64, i64) -> i64
    %621 = llvm.mlir.addressof @str62 : !llvm.ptr
    %622 = arith.constant 39 : i64
    %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
    %624 = func.call @cc_nil_value() : () -> i64
    %625 = func.call @cc_intern(%623, %624) : (i64, i64) -> i64
    %626 = func.call @cc_nil_value() : () -> i64
    %627 = func.call @cc_cons(%625, %626) : (i64, i64) -> i64
    %628 = func.call @cc_values_pack(%627) : (i64) -> i64
    %629 = func.call @cc_set_symbol_value(%625, %602) : (i64, i64) -> i64
    %630 = func.call @cc_nil_value() : () -> i64
    %631 = llvm.mlir.addressof @str63 : !llvm.ptr
    %632 = arith.constant 37 : i64
    %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
    %634 = func.call @cc_nil_value() : () -> i64
    %635 = func.call @cc_intern(%633, %634) : (i64, i64) -> i64
    %636 = func.call @cc_nil_value() : () -> i64
    %637 = func.call @cc_cons(%635, %636) : (i64, i64) -> i64
    %638 = func.call @cc_values_pack(%637) : (i64) -> i64
    %639 = func.call @cc_set_symbol_value(%635, %630) : (i64, i64) -> i64
    %640 = llvm.mlir.addressof @str64 : !llvm.ptr
    %641 = arith.constant 38 : i64
    %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
    %643 = func.call @cc_nil_value() : () -> i64
    %644 = func.call @cc_intern(%642, %643) : (i64, i64) -> i64
    %645 = func.call @cc_nil_value() : () -> i64
    %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
    %647 = func.call @cc_values_pack(%646) : (i64) -> i64
    %648 = func.call @cc_set_symbol_value(%644, %630) : (i64, i64) -> i64
    %649 = llvm.mlir.addressof @str65 : !llvm.ptr
    %650 = arith.constant 39 : i64
    %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
    %652 = func.call @cc_nil_value() : () -> i64
    %653 = func.call @cc_intern(%651, %652) : (i64, i64) -> i64
    %654 = func.call @cc_nil_value() : () -> i64
    %655 = func.call @cc_cons(%653, %654) : (i64, i64) -> i64
    %656 = func.call @cc_values_pack(%655) : (i64) -> i64
    %657 = func.call @cc_set_symbol_value(%653, %630) : (i64, i64) -> i64
    func.call @stack_push_pointer(%601) : (i64) -> ()
    %658 = func.call @stack_pop_pointer() : () -> i64
    %659 = llvm.mlir.addressof @str66 : !llvm.ptr
    %660 = arith.constant 25 : i64
    %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
    %662 = llvm.mlir.addressof @str67 : !llvm.ptr
    %663 = arith.constant 11 : i64
    %664 = func.call @cc_make_string(%662, %663) : (!llvm.ptr, i64) -> i64
    %665 = func.call @cc_intern(%661, %664) : (i64, i64) -> i64
    %666 = func.call @cc_nil_value() : () -> i64
    %667 = func.call @cc_cons(%665, %666) : (i64, i64) -> i64
    %668 = func.call @cc_values_pack(%667) : (i64) -> i64
    %669 = func.call @cc_symbol_value(%665) : (i64) -> i64
    %670 = func.call @cc_cons(%658, %669) : (i64, i64) -> i64
    %671 = llvm.mlir.addressof @str68 : !llvm.ptr
    %672 = arith.constant 25 : i64
    %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
    %674 = llvm.mlir.addressof @str69 : !llvm.ptr
    %675 = arith.constant 11 : i64
    %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
    %677 = func.call @cc_intern(%673, %676) : (i64, i64) -> i64
    %678 = func.call @cc_nil_value() : () -> i64
    %679 = func.call @cc_cons(%677, %678) : (i64, i64) -> i64
    %680 = func.call @cc_values_pack(%679) : (i64) -> i64
    %681 = func.call @cc_set_symbol_value(%677, %670) : (i64, i64) -> i64
    func.call @stack_push_pointer(%670) : (i64) -> ()
    %682 = func.call @stack_pop_pointer() : () -> i64
    %683 = func.call @cc_multiple_value_list(%682) : (i64) -> i64
    %684 = llvm.mlir.addressof @str70 : !llvm.ptr
    %685 = arith.constant 37 : i64
    %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
    %687 = func.call @cc_nil_value() : () -> i64
    %688 = func.call @cc_intern(%686, %687) : (i64, i64) -> i64
    %689 = func.call @cc_nil_value() : () -> i64
    %690 = func.call @cc_cons(%688, %689) : (i64, i64) -> i64
    %691 = func.call @cc_values_pack(%690) : (i64) -> i64
    %692 = func.call @cc_symbol_value(%688) : (i64) -> i64
    %693 = llvm.mlir.addressof @str71 : !llvm.ptr
    %694 = arith.constant 38 : i64
    %695 = func.call @cc_make_string(%693, %694) : (!llvm.ptr, i64) -> i64
    %696 = func.call @cc_nil_value() : () -> i64
    %697 = func.call @cc_intern(%695, %696) : (i64, i64) -> i64
    %698 = func.call @cc_nil_value() : () -> i64
    %699 = func.call @cc_cons(%697, %698) : (i64, i64) -> i64
    %700 = func.call @cc_values_pack(%699) : (i64) -> i64
    %701 = func.call @cc_symbol_value(%697) : (i64) -> i64
    %702 = llvm.mlir.addressof @str72 : !llvm.ptr
    %703 = arith.constant 39 : i64
    %704 = func.call @cc_make_string(%702, %703) : (!llvm.ptr, i64) -> i64
    %705 = func.call @cc_nil_value() : () -> i64
    %706 = func.call @cc_intern(%704, %705) : (i64, i64) -> i64
    %707 = func.call @cc_nil_value() : () -> i64
    %708 = func.call @cc_cons(%706, %707) : (i64, i64) -> i64
    %709 = func.call @cc_values_pack(%708) : (i64) -> i64
    %710 = func.call @cc_symbol_value(%706) : (i64) -> i64
    %711 = func.call @cc_nil_value() : () -> i64
    %712 = arith.cmpi ne, %692, %711 : i64
    %713 = scf.if %712 -> (i64) {
      scf.yield %710 : i64
    } else {
      scf.yield %683 : i64
    }
    %714 = func.call @cc_values_pack(%713) : (i64) -> i64
    func.call @stack_push_pointer(%714) : (i64) -> ()
    %715 = func.call @stack_pop_pointer() : () -> i64
    %716 = func.call @cc_multiple_value_list(%715) : (i64) -> i64
    %717 = llvm.mlir.addressof @str73 : !llvm.ptr
    %718 = arith.constant 37 : i64
    %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
    %720 = func.call @cc_nil_value() : () -> i64
    %721 = func.call @cc_intern(%719, %720) : (i64, i64) -> i64
    %722 = func.call @cc_nil_value() : () -> i64
    %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
    %724 = func.call @cc_values_pack(%723) : (i64) -> i64
    %725 = func.call @cc_symbol_value(%721) : (i64) -> i64
    %726 = llvm.mlir.addressof @str74 : !llvm.ptr
    %727 = arith.constant 39 : i64
    %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
    %729 = func.call @cc_nil_value() : () -> i64
    %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
    %731 = func.call @cc_nil_value() : () -> i64
    %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
    %733 = func.call @cc_values_pack(%732) : (i64) -> i64
    %734 = func.call @cc_symbol_value(%730) : (i64) -> i64
    %735 = func.call @cc_nil_value() : () -> i64
    %736 = arith.cmpi ne, %725, %735 : i64
    %737 = scf.if %736 -> (i64) {
      scf.yield %734 : i64
    } else {
      scf.yield %716 : i64
    }
    %738 = func.call @cc_values_pack(%737) : (i64) -> i64
    func.call @stack_push_pointer(%738) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%show-test-summary"() {
    %739 = llvm.mlir.addressof @str75 : !llvm.ptr
    %740 = arith.constant 17 : i64
    %741 = func.call @cc_make_string(%739, %740) : (!llvm.ptr, i64) -> i64
    %742 = func.call @cc_nil_value() : () -> i64
    %743 = func.call @cc_intern(%741, %742) : (i64, i64) -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = func.call @cc_cons(%743, %744) : (i64, i64) -> i64
    %746 = func.call @cc_values_pack(%745) : (i64) -> i64
    %747 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%743, %747) : (i64, i64) -> ()
    %748 = func.call @cc_nil_value() : () -> i64
    %749 = llvm.mlir.addressof @str76 : !llvm.ptr
    %750 = arith.constant 37 : i64
    %751 = func.call @cc_make_string(%749, %750) : (!llvm.ptr, i64) -> i64
    %752 = func.call @cc_nil_value() : () -> i64
    %753 = func.call @cc_intern(%751, %752) : (i64, i64) -> i64
    %754 = func.call @cc_nil_value() : () -> i64
    %755 = func.call @cc_cons(%753, %754) : (i64, i64) -> i64
    %756 = func.call @cc_values_pack(%755) : (i64) -> i64
    %757 = func.call @cc_set_symbol_value(%753, %748) : (i64, i64) -> i64
    %758 = llvm.mlir.addressof @str77 : !llvm.ptr
    %759 = arith.constant 38 : i64
    %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
    %761 = func.call @cc_nil_value() : () -> i64
    %762 = func.call @cc_intern(%760, %761) : (i64, i64) -> i64
    %763 = func.call @cc_nil_value() : () -> i64
    %764 = func.call @cc_cons(%762, %763) : (i64, i64) -> i64
    %765 = func.call @cc_values_pack(%764) : (i64) -> i64
    %766 = func.call @cc_set_symbol_value(%762, %748) : (i64, i64) -> i64
    %767 = llvm.mlir.addressof @str78 : !llvm.ptr
    %768 = arith.constant 39 : i64
    %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
    %770 = func.call @cc_nil_value() : () -> i64
    %771 = func.call @cc_intern(%769, %770) : (i64, i64) -> i64
    %772 = func.call @cc_nil_value() : () -> i64
    %773 = func.call @cc_cons(%771, %772) : (i64, i64) -> i64
    %774 = func.call @cc_values_pack(%773) : (i64) -> i64
    %775 = func.call @cc_set_symbol_value(%771, %748) : (i64, i64) -> i64
    %776 = func.call @cc_nil_value() : () -> i64
    %777 = llvm.mlir.addressof @str79 : !llvm.ptr
    %778 = arith.constant 37 : i64
    %779 = func.call @cc_make_string(%777, %778) : (!llvm.ptr, i64) -> i64
    %780 = func.call @cc_nil_value() : () -> i64
    %781 = func.call @cc_intern(%779, %780) : (i64, i64) -> i64
    %782 = func.call @cc_nil_value() : () -> i64
    %783 = func.call @cc_cons(%781, %782) : (i64, i64) -> i64
    %784 = func.call @cc_values_pack(%783) : (i64) -> i64
    %785 = func.call @cc_set_symbol_value(%781, %776) : (i64, i64) -> i64
    %786 = llvm.mlir.addressof @str80 : !llvm.ptr
    %787 = arith.constant 38 : i64
    %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
    %789 = func.call @cc_nil_value() : () -> i64
    %790 = func.call @cc_intern(%788, %789) : (i64, i64) -> i64
    %791 = func.call @cc_nil_value() : () -> i64
    %792 = func.call @cc_cons(%790, %791) : (i64, i64) -> i64
    %793 = func.call @cc_values_pack(%792) : (i64) -> i64
    %794 = func.call @cc_set_symbol_value(%790, %776) : (i64, i64) -> i64
    %795 = llvm.mlir.addressof @str81 : !llvm.ptr
    %796 = arith.constant 39 : i64
    %797 = func.call @cc_make_string(%795, %796) : (!llvm.ptr, i64) -> i64
    %798 = func.call @cc_nil_value() : () -> i64
    %799 = func.call @cc_intern(%797, %798) : (i64, i64) -> i64
    %800 = func.call @cc_nil_value() : () -> i64
    %801 = func.call @cc_cons(%799, %800) : (i64, i64) -> i64
    %802 = func.call @cc_values_pack(%801) : (i64) -> i64
    %803 = func.call @cc_set_symbol_value(%799, %776) : (i64, i64) -> i64
    %804 = llvm.mlir.addressof @str82 : !llvm.ptr
    %805 = arith.constant 4 : i64
    %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
    %807 = llvm.mlir.addressof @str83 : !llvm.ptr
    %808 = arith.constant 7 : i64
    %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
    %810 = func.call @cc_intern(%806, %809) : (i64, i64) -> i64
    %811 = func.call @cc_nil_value() : () -> i64
    %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
    %813 = func.call @cc_values_pack(%812) : (i64) -> i64
    func.call @stack_push_pointer(%810) : (i64) -> ()
    %814 = func.call @stack_pop_pointer() : () -> i64
    %815 = llvm.mlir.addressof @str84 : !llvm.ptr
    %816 = arith.constant 147 : i64
    %817 = func.call @cc_make_string(%815, %816) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%817) : (i64) -> ()
    %818 = func.call @stack_pop_pointer() : () -> i64
    %819 = llvm.mlir.addressof @str85 : !llvm.ptr
    %820 = arith.constant 25 : i64
    %821 = func.call @cc_make_string(%819, %820) : (!llvm.ptr, i64) -> i64
    %822 = llvm.mlir.addressof @str86 : !llvm.ptr
    %823 = arith.constant 11 : i64
    %824 = func.call @cc_make_string(%822, %823) : (!llvm.ptr, i64) -> i64
    %825 = func.call @cc_intern(%821, %824) : (i64, i64) -> i64
    %826 = func.call @cc_nil_value() : () -> i64
    %827 = func.call @cc_cons(%825, %826) : (i64, i64) -> i64
    %828 = func.call @cc_values_pack(%827) : (i64) -> i64
    %829 = func.call @cc_symbol_value(%825) : (i64) -> i64
    func.call @stack_push_pointer(%829) : (i64) -> ()
    %830 = func.call @stack_pop_pointer() : () -> i64
    %831 = func.call @cc_reverse(%830) : (i64) -> i64
    func.call @stack_push_pointer(%831) : (i64) -> ()
    %832 = func.call @stack_pop_pointer() : () -> i64
    %833 = llvm.mlir.addressof @str87 : !llvm.ptr
    %834 = arith.constant 25 : i64
    %835 = func.call @cc_make_string(%833, %834) : (!llvm.ptr, i64) -> i64
    %836 = llvm.mlir.addressof @str88 : !llvm.ptr
    %837 = arith.constant 11 : i64
    %838 = func.call @cc_make_string(%836, %837) : (!llvm.ptr, i64) -> i64
    %839 = func.call @cc_intern(%835, %838) : (i64, i64) -> i64
    %840 = func.call @cc_nil_value() : () -> i64
    %841 = func.call @cc_cons(%839, %840) : (i64, i64) -> i64
    %842 = func.call @cc_values_pack(%841) : (i64) -> i64
    %843 = func.call @cc_symbol_value(%839) : (i64) -> i64
    func.call @stack_push_pointer(%843) : (i64) -> ()
    %844 = func.call @stack_pop_pointer() : () -> i64
    %845 = func.call @cc_reverse(%844) : (i64) -> i64
    func.call @stack_push_pointer(%845) : (i64) -> ()
    %846 = func.call @stack_pop_pointer() : () -> i64
    %847 = llvm.mlir.addressof @str89 : !llvm.ptr
    %848 = arith.constant 23 : i64
    %849 = func.call @cc_make_string(%847, %848) : (!llvm.ptr, i64) -> i64
    %850 = llvm.mlir.addressof @str90 : !llvm.ptr
    %851 = arith.constant 11 : i64
    %852 = func.call @cc_make_string(%850, %851) : (!llvm.ptr, i64) -> i64
    %853 = func.call @cc_intern(%849, %852) : (i64, i64) -> i64
    %854 = func.call @cc_nil_value() : () -> i64
    %855 = func.call @cc_cons(%853, %854) : (i64, i64) -> i64
    %856 = func.call @cc_values_pack(%855) : (i64) -> i64
    %857 = func.call @cc_symbol_value(%853) : (i64) -> i64
    func.call @stack_push_pointer(%857) : (i64) -> ()
    %858 = func.call @stack_pop_pointer() : () -> i64
    %859 = func.call @cc_reverse(%858) : (i64) -> i64
    func.call @stack_push_pointer(%859) : (i64) -> ()
    %860 = func.call @stack_pop_pointer() : () -> i64
    %861 = llvm.mlir.addressof @str91 : !llvm.ptr
    %862 = arith.constant 23 : i64
    %863 = func.call @cc_make_string(%861, %862) : (!llvm.ptr, i64) -> i64
    %864 = llvm.mlir.addressof @str92 : !llvm.ptr
    %865 = arith.constant 11 : i64
    %866 = func.call @cc_make_string(%864, %865) : (!llvm.ptr, i64) -> i64
    %867 = func.call @cc_intern(%863, %866) : (i64, i64) -> i64
    %868 = func.call @cc_nil_value() : () -> i64
    %869 = func.call @cc_cons(%867, %868) : (i64, i64) -> i64
    %870 = func.call @cc_values_pack(%869) : (i64) -> i64
    %871 = func.call @cc_symbol_value(%867) : (i64) -> i64
    func.call @stack_push_pointer(%871) : (i64) -> ()
    %872 = func.call @stack_pop_pointer() : () -> i64
    %873 = func.call @cc_length(%872) : (i64) -> i64
    func.call @stack_push_pointer(%873) : (i64) -> ()
    %874 = func.call @stack_pop_pointer() : () -> i64
    %875 = func.call @cc_nil_value() : () -> i64
    %876 = func.call @cc_errorp(%814) : (i64) -> i64
    %877 = arith.cmpi ne, %876, %875 : i64
    %878 = arith.cmpi eq, %875, %875 : i64
    %879 = arith.andi %877, %878 : i1
    %880 = scf.if %879 -> (i64) {
      scf.yield %814 : i64
    } else {
      scf.yield %875 : i64
    }
    %881 = func.call @cc_errorp(%818) : (i64) -> i64
    %882 = arith.cmpi ne, %881, %875 : i64
    %883 = arith.cmpi eq, %880, %875 : i64
    %884 = arith.andi %882, %883 : i1
    %885 = scf.if %884 -> (i64) {
      scf.yield %818 : i64
    } else {
      scf.yield %880 : i64
    }
    %886 = func.call @cc_errorp(%832) : (i64) -> i64
    %887 = arith.cmpi ne, %886, %875 : i64
    %888 = arith.cmpi eq, %885, %875 : i64
    %889 = arith.andi %887, %888 : i1
    %890 = scf.if %889 -> (i64) {
      scf.yield %832 : i64
    } else {
      scf.yield %885 : i64
    }
    %891 = func.call @cc_errorp(%846) : (i64) -> i64
    %892 = arith.cmpi ne, %891, %875 : i64
    %893 = arith.cmpi eq, %890, %875 : i64
    %894 = arith.andi %892, %893 : i1
    %895 = scf.if %894 -> (i64) {
      scf.yield %846 : i64
    } else {
      scf.yield %890 : i64
    }
    %896 = func.call @cc_errorp(%860) : (i64) -> i64
    %897 = arith.cmpi ne, %896, %875 : i64
    %898 = arith.cmpi eq, %895, %875 : i64
    %899 = arith.andi %897, %898 : i1
    %900 = scf.if %899 -> (i64) {
      scf.yield %860 : i64
    } else {
      scf.yield %895 : i64
    }
    %901 = func.call @cc_errorp(%874) : (i64) -> i64
    %902 = arith.cmpi ne, %901, %875 : i64
    %903 = arith.cmpi eq, %900, %875 : i64
    %904 = arith.andi %902, %903 : i1
    %905 = scf.if %904 -> (i64) {
      scf.yield %874 : i64
    } else {
      scf.yield %900 : i64
    }
    %906 = arith.cmpi ne, %905, %875 : i64
    scf.if %906 {
      func.call @stack_push_pointer(%905) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%814) : (i64) -> ()
      func.call @stack_push_pointer(%818) : (i64) -> ()
      func.call @stack_push_pointer(%832) : (i64) -> ()
      func.call @stack_push_pointer(%846) : (i64) -> ()
      func.call @stack_push_pointer(%860) : (i64) -> ()
      func.call @stack_push_pointer(%874) : (i64) -> ()
      %907 = llvm.mlir.addressof @str93 : !llvm.ptr
      %908 = func.call @cc_make_function_ref_const(%907) : (!llvm.ptr) -> i64
      %909 = arith.constant 6 : i64
      func.call @cc_funcall_stack(%908, %909) : (i64, i64) -> ()
    }
    %910 = func.call @stack_pop_pointer() : () -> i64
    %911 = llvm.mlir.addressof @str94 : !llvm.ptr
    %912 = arith.constant 25 : i64
    %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
    %914 = llvm.mlir.addressof @str95 : !llvm.ptr
    %915 = arith.constant 11 : i64
    %916 = func.call @cc_make_string(%914, %915) : (!llvm.ptr, i64) -> i64
    %917 = func.call @cc_intern(%913, %916) : (i64, i64) -> i64
    %918 = func.call @cc_nil_value() : () -> i64
    %919 = func.call @cc_cons(%917, %918) : (i64, i64) -> i64
    %920 = func.call @cc_values_pack(%919) : (i64) -> i64
    %921 = func.call @cc_symbol_value(%917) : (i64) -> i64
    func.call @stack_push_pointer(%921) : (i64) -> ()
    %922 = func.call @stack_pop_pointer() : () -> i64
    %923 = func.call @cc_nil_value() : () -> i64
    %924 = arith.cmpi ne, %922, %923 : i64
    scf.if %924 {
      %925 = func.call @cc_nil_value() : () -> i64
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_errorp(%925) : (i64) -> i64
      %928 = arith.cmpi ne, %927, %926 : i64
      %929 = scf.if %928 -> (i64) {
        scf.yield %925 : i64
      } else {
        %930 = llvm.mlir.addressof @str96 : !llvm.ptr
        %931 = arith.constant 25 : i64
        %932 = func.call @cc_make_string(%930, %931) : (!llvm.ptr, i64) -> i64
        %933 = func.call @cc_nil_value() : () -> i64
        %934 = func.call @cc_intern(%932, %933) : (i64, i64) -> i64
        %935 = func.call @cc_nil_value() : () -> i64
        %936 = func.call @cc_cons(%934, %935) : (i64, i64) -> i64
        %937 = func.call @cc_values_pack(%936) : (i64) -> i64
        %938 = func.call @cc_symbol_value(%934) : (i64) -> i64
        func.call @stack_push_pointer(%938) : (i64) -> ()
        %939 = func.call @stack_pop_pointer() : () -> i64
        %940:1 = scf.while (%arg0 = %939) : (i64) -> (i64) {
          %941 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %942 = arith.constant 0 : i32
          %943 = arith.cmpi ne, %941, %942 : i32
          scf.condition(%943) %arg0 : i64
        } do {
          ^bb0(%944: i64):
          %945 = func.call @cc_car(%944) : (i64) -> i64
          %946 = llvm.mlir.addressof @str97 : !llvm.ptr
          %947 = arith.constant 3 : i64
          %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
          %949 = llvm.mlir.addressof @str98 : !llvm.ptr
          %950 = arith.constant 7 : i64
          %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
          %952 = func.call @cc_intern(%948, %951) : (i64, i64) -> i64
          %953 = func.call @cc_nil_value() : () -> i64
          %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
          %955 = func.call @cc_values_pack(%954) : (i64) -> i64
          func.call @stack_push_pointer(%952) : (i64) -> ()
          %956 = func.call @stack_pop_pointer() : () -> i64
          %957 = llvm.mlir.addressof @str99 : !llvm.ptr
          %958 = arith.constant 44 : i64
          %959 = func.call @cc_make_string(%957, %958) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%959) : (i64) -> ()
          %960 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%945) : (i64) -> ()
          %961 = func.call @stack_pop_pointer() : () -> i64
          %962 = func.call @cc_car(%961) : (i64) -> i64
          func.call @stack_push_pointer(%962) : (i64) -> ()
          %963 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%945) : (i64) -> ()
          %964 = func.call @stack_pop_pointer() : () -> i64
          %965 = func.call @cc_cdr(%964) : (i64) -> i64
          %966 = func.call @cc_car(%965) : (i64) -> i64
          func.call @stack_push_pointer(%966) : (i64) -> ()
          %967 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%956) : (i64) -> ()
          func.call @stack_push_pointer(%960) : (i64) -> ()
          func.call @stack_push_pointer(%963) : (i64) -> ()
          func.call @stack_push_pointer(%967) : (i64) -> ()
          %968 = llvm.mlir.addressof @str100 : !llvm.ptr
          %969 = func.call @cc_make_function_ref_const(%968) : (!llvm.ptr) -> i64
          %970 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%969, %970) : (i64, i64) -> ()
          %971 = func.call @stack_depth() : () -> i64
          %972 = arith.constant 0 : i64
          %973 = arith.cmpi sgt, %971, %972 : i64
          scf.if %973 {
            %974 = func.call @stack_pop_pointer() : () -> i64
          }
          %975 = func.call @cc_cdr(%944) : (i64) -> i64
          scf.yield %975 : i64
        }
        func.call @stack_push_nil() : () -> ()
        %976 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %976 : i64
      }
      func.call @stack_push_pointer(%929) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %977 = func.call @stack_pop_pointer() : () -> i64
    %978 = llvm.mlir.addressof @str101 : !llvm.ptr
    %979 = arith.constant 17 : i64
    %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
    %981 = llvm.mlir.addressof @str102 : !llvm.ptr
    %982 = arith.constant 11 : i64
    %983 = func.call @cc_make_string(%981, %982) : (!llvm.ptr, i64) -> i64
    %984 = func.call @cc_intern(%980, %983) : (i64, i64) -> i64
    %985 = func.call @cc_nil_value() : () -> i64
    %986 = func.call @cc_cons(%984, %985) : (i64, i64) -> i64
    %987 = func.call @cc_values_pack(%986) : (i64) -> i64
    %988 = func.call @cc_symbol_value(%984) : (i64) -> i64
    func.call @stack_push_pointer(%988) : (i64) -> ()
    %989 = func.call @stack_pop_pointer() : () -> i64
    %990 = func.call @cc_nil_value() : () -> i64
    %991 = arith.cmpi ne, %989, %990 : i64
    scf.if %991 {
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_errorp(%992) : (i64) -> i64
      %995 = arith.cmpi ne, %994, %993 : i64
      %996 = scf.if %995 -> (i64) {
        scf.yield %992 : i64
      } else {
        %997 = llvm.mlir.addressof @str103 : !llvm.ptr
        %998 = arith.constant 17 : i64
        %999 = func.call @cc_make_string(%997, %998) : (!llvm.ptr, i64) -> i64
        %1000 = func.call @cc_nil_value() : () -> i64
        %1001 = func.call @cc_intern(%999, %1000) : (i64, i64) -> i64
        %1002 = func.call @cc_nil_value() : () -> i64
        %1003 = func.call @cc_cons(%1001, %1002) : (i64, i64) -> i64
        %1004 = func.call @cc_values_pack(%1003) : (i64) -> i64
        %1005 = func.call @cc_symbol_value(%1001) : (i64) -> i64
        func.call @stack_push_pointer(%1005) : (i64) -> ()
        %1006 = func.call @stack_pop_pointer() : () -> i64
        %1007:1 = scf.while (%arg0 = %1006) : (i64) -> (i64) {
          %1008 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %1009 = arith.constant 0 : i32
          %1010 = arith.cmpi ne, %1008, %1009 : i32
          scf.condition(%1010) %arg0 : i64
        } do {
          ^bb0(%1011: i64):
          %1012 = func.call @cc_car(%1011) : (i64) -> i64
          %1013 = llvm.mlir.addressof @str104 : !llvm.ptr
          %1014 = arith.constant 4 : i64
          %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
          %1016 = llvm.mlir.addressof @str105 : !llvm.ptr
          %1017 = arith.constant 7 : i64
          %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
          %1019 = func.call @cc_intern(%1015, %1018) : (i64, i64) -> i64
          %1020 = func.call @cc_nil_value() : () -> i64
          %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
          %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
          func.call @stack_push_pointer(%1019) : (i64) -> ()
          %1023 = func.call @stack_pop_pointer() : () -> i64
          %1024 = llvm.mlir.addressof @str106 : !llvm.ptr
          %1025 = arith.constant 17 : i64
          %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1026) : (i64) -> ()
          %1027 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1012) : (i64) -> ()
          %1028 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1023) : (i64) -> ()
          func.call @stack_push_pointer(%1027) : (i64) -> ()
          func.call @stack_push_pointer(%1028) : (i64) -> ()
          %1029 = llvm.mlir.addressof @str107 : !llvm.ptr
          %1030 = func.call @cc_make_function_ref_const(%1029) : (!llvm.ptr) -> i64
          %1031 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1030, %1031) : (i64, i64) -> ()
          %1032 = func.call @stack_depth() : () -> i64
          %1033 = arith.constant 0 : i64
          %1034 = arith.cmpi sgt, %1032, %1033 : i64
          scf.if %1034 {
            %1035 = func.call @stack_pop_pointer() : () -> i64
          }
          %1036 = func.call @cc_cdr(%1011) : (i64) -> i64
          scf.yield %1036 : i64
        }
        func.call @stack_push_nil() : () -> ()
        %1037 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1037 : i64
      }
      func.call @stack_push_pointer(%996) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1038 = func.call @stack_pop_pointer() : () -> i64
    %1039 = llvm.mlir.addressof @str108 : !llvm.ptr
    %1040 = arith.constant 25 : i64
    %1041 = func.call @cc_make_string(%1039, %1040) : (!llvm.ptr, i64) -> i64
    %1042 = llvm.mlir.addressof @str109 : !llvm.ptr
    %1043 = arith.constant 11 : i64
    %1044 = func.call @cc_make_string(%1042, %1043) : (!llvm.ptr, i64) -> i64
    %1045 = func.call @cc_intern(%1041, %1044) : (i64, i64) -> i64
    %1046 = func.call @cc_nil_value() : () -> i64
    %1047 = func.call @cc_cons(%1045, %1046) : (i64, i64) -> i64
    %1048 = func.call @cc_values_pack(%1047) : (i64) -> i64
    %1049 = func.call @cc_symbol_value(%1045) : (i64) -> i64
    func.call @stack_push_pointer(%1049) : (i64) -> ()
    %1050 = func.call @stack_pop_pointer() : () -> i64
    %1051 = func.call @cc_nil_value() : () -> i64
    %1052 = func.call @cc_cons(%1050, %1051) : (i64, i64) -> i64
    %1053 = func.call @cc_not(%1052) : (i64) -> i64
    func.call @stack_push_pointer(%1053) : (i64) -> ()
    %1054 = func.call @stack_pop_pointer() : () -> i64
    %1055 = func.call @cc_multiple_value_list(%1054) : (i64) -> i64
    %1056 = llvm.mlir.addressof @str110 : !llvm.ptr
    %1057 = arith.constant 37 : i64
    %1058 = func.call @cc_make_string(%1056, %1057) : (!llvm.ptr, i64) -> i64
    %1059 = func.call @cc_nil_value() : () -> i64
    %1060 = func.call @cc_intern(%1058, %1059) : (i64, i64) -> i64
    %1061 = func.call @cc_nil_value() : () -> i64
    %1062 = func.call @cc_cons(%1060, %1061) : (i64, i64) -> i64
    %1063 = func.call @cc_values_pack(%1062) : (i64) -> i64
    %1064 = func.call @cc_symbol_value(%1060) : (i64) -> i64
    %1065 = llvm.mlir.addressof @str111 : !llvm.ptr
    %1066 = arith.constant 38 : i64
    %1067 = func.call @cc_make_string(%1065, %1066) : (!llvm.ptr, i64) -> i64
    %1068 = func.call @cc_nil_value() : () -> i64
    %1069 = func.call @cc_intern(%1067, %1068) : (i64, i64) -> i64
    %1070 = func.call @cc_nil_value() : () -> i64
    %1071 = func.call @cc_cons(%1069, %1070) : (i64, i64) -> i64
    %1072 = func.call @cc_values_pack(%1071) : (i64) -> i64
    %1073 = func.call @cc_symbol_value(%1069) : (i64) -> i64
    %1074 = llvm.mlir.addressof @str112 : !llvm.ptr
    %1075 = arith.constant 39 : i64
    %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
    %1077 = func.call @cc_nil_value() : () -> i64
    %1078 = func.call @cc_intern(%1076, %1077) : (i64, i64) -> i64
    %1079 = func.call @cc_nil_value() : () -> i64
    %1080 = func.call @cc_cons(%1078, %1079) : (i64, i64) -> i64
    %1081 = func.call @cc_values_pack(%1080) : (i64) -> i64
    %1082 = func.call @cc_symbol_value(%1078) : (i64) -> i64
    %1083 = func.call @cc_nil_value() : () -> i64
    %1084 = arith.cmpi ne, %1064, %1083 : i64
    %1085 = scf.if %1084 -> (i64) {
      scf.yield %1082 : i64
    } else {
      scf.yield %1055 : i64
    }
    %1086 = func.call @cc_values_pack(%1085) : (i64) -> i64
    func.call @stack_push_pointer(%1086) : (i64) -> ()
    %1087 = func.call @stack_pop_pointer() : () -> i64
    %1088 = func.call @cc_multiple_value_list(%1087) : (i64) -> i64
    %1089 = llvm.mlir.addressof @str113 : !llvm.ptr
    %1090 = arith.constant 37 : i64
    %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
    %1092 = func.call @cc_nil_value() : () -> i64
    %1093 = func.call @cc_intern(%1091, %1092) : (i64, i64) -> i64
    %1094 = func.call @cc_nil_value() : () -> i64
    %1095 = func.call @cc_cons(%1093, %1094) : (i64, i64) -> i64
    %1096 = func.call @cc_values_pack(%1095) : (i64) -> i64
    %1097 = func.call @cc_symbol_value(%1093) : (i64) -> i64
    %1098 = llvm.mlir.addressof @str114 : !llvm.ptr
    %1099 = arith.constant 39 : i64
    %1100 = func.call @cc_make_string(%1098, %1099) : (!llvm.ptr, i64) -> i64
    %1101 = func.call @cc_nil_value() : () -> i64
    %1102 = func.call @cc_intern(%1100, %1101) : (i64, i64) -> i64
    %1103 = func.call @cc_nil_value() : () -> i64
    %1104 = func.call @cc_cons(%1102, %1103) : (i64, i64) -> i64
    %1105 = func.call @cc_values_pack(%1104) : (i64) -> i64
    %1106 = func.call @cc_symbol_value(%1102) : (i64) -> i64
    %1107 = func.call @cc_nil_value() : () -> i64
    %1108 = arith.cmpi ne, %1097, %1107 : i64
    %1109 = scf.if %1108 -> (i64) {
      scf.yield %1106 : i64
    } else {
      scf.yield %1088 : i64
    }
    %1110 = func.call @cc_values_pack(%1109) : (i64) -> i64
    func.call @stack_push_pointer(%1110) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%fail-test-with-error"() {
    %1111 = llvm.mlir.addressof @str115 : !llvm.ptr
    %1112 = arith.constant 21 : i64
    %1113 = func.call @cc_make_string(%1111, %1112) : (!llvm.ptr, i64) -> i64
    %1114 = func.call @cc_nil_value() : () -> i64
    %1115 = func.call @cc_intern(%1113, %1114) : (i64, i64) -> i64
    %1116 = func.call @cc_nil_value() : () -> i64
    %1117 = func.call @cc_cons(%1115, %1116) : (i64, i64) -> i64
    %1118 = func.call @cc_values_pack(%1117) : (i64) -> i64
    %1119 = llvm.mlir.addressof @str116 : !llvm.ptr
    %1120 = arith.constant 48 : i64
    %1121 = func.call @cc_make_string(%1119, %1120) : (!llvm.ptr, i64) -> i64
    %1122 = func.call @cc_register_function_lambda_list_metadata_raw(%1115, %1121) : (i64, i64) -> i64
    %1123 = arith.constant 5 : i64
    func.call @cc_runtime_debug_stack_push_call(%1115, %1123) : (i64, i64) -> ()
    %1124 = func.call @stack_pop_pointer() : () -> i64
    %1125 = func.call @stack_pop_pointer() : () -> i64
    %1126 = func.call @stack_pop_pointer() : () -> i64
    %1127 = func.call @stack_pop_pointer() : () -> i64
    %1128 = func.call @stack_pop_pointer() : () -> i64
    %1129 = func.call @cc_nil_value() : () -> i64
    %1130 = llvm.mlir.addressof @str117 : !llvm.ptr
    %1131 = arith.constant 37 : i64
    %1132 = func.call @cc_make_string(%1130, %1131) : (!llvm.ptr, i64) -> i64
    %1133 = func.call @cc_nil_value() : () -> i64
    %1134 = func.call @cc_intern(%1132, %1133) : (i64, i64) -> i64
    %1135 = func.call @cc_nil_value() : () -> i64
    %1136 = func.call @cc_cons(%1134, %1135) : (i64, i64) -> i64
    %1137 = func.call @cc_values_pack(%1136) : (i64) -> i64
    %1138 = func.call @cc_set_symbol_value(%1134, %1129) : (i64, i64) -> i64
    %1139 = llvm.mlir.addressof @str118 : !llvm.ptr
    %1140 = arith.constant 38 : i64
    %1141 = func.call @cc_make_string(%1139, %1140) : (!llvm.ptr, i64) -> i64
    %1142 = func.call @cc_nil_value() : () -> i64
    %1143 = func.call @cc_intern(%1141, %1142) : (i64, i64) -> i64
    %1144 = func.call @cc_nil_value() : () -> i64
    %1145 = func.call @cc_cons(%1143, %1144) : (i64, i64) -> i64
    %1146 = func.call @cc_values_pack(%1145) : (i64) -> i64
    %1147 = func.call @cc_set_symbol_value(%1143, %1129) : (i64, i64) -> i64
    %1148 = llvm.mlir.addressof @str119 : !llvm.ptr
    %1149 = arith.constant 39 : i64
    %1150 = func.call @cc_make_string(%1148, %1149) : (!llvm.ptr, i64) -> i64
    %1151 = func.call @cc_nil_value() : () -> i64
    %1152 = func.call @cc_intern(%1150, %1151) : (i64, i64) -> i64
    %1153 = func.call @cc_nil_value() : () -> i64
    %1154 = func.call @cc_cons(%1152, %1153) : (i64, i64) -> i64
    %1155 = func.call @cc_values_pack(%1154) : (i64) -> i64
    %1156 = func.call @cc_set_symbol_value(%1152, %1129) : (i64, i64) -> i64
    %1157 = func.call @cc_nil_value() : () -> i64
    %1158 = llvm.mlir.addressof @str120 : !llvm.ptr
    %1159 = arith.constant 37 : i64
    %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
    %1161 = func.call @cc_nil_value() : () -> i64
    %1162 = func.call @cc_intern(%1160, %1161) : (i64, i64) -> i64
    %1163 = func.call @cc_nil_value() : () -> i64
    %1164 = func.call @cc_cons(%1162, %1163) : (i64, i64) -> i64
    %1165 = func.call @cc_values_pack(%1164) : (i64) -> i64
    %1166 = func.call @cc_set_symbol_value(%1162, %1157) : (i64, i64) -> i64
    %1167 = llvm.mlir.addressof @str121 : !llvm.ptr
    %1168 = arith.constant 38 : i64
    %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
    %1170 = func.call @cc_nil_value() : () -> i64
    %1171 = func.call @cc_intern(%1169, %1170) : (i64, i64) -> i64
    %1172 = func.call @cc_nil_value() : () -> i64
    %1173 = func.call @cc_cons(%1171, %1172) : (i64, i64) -> i64
    %1174 = func.call @cc_values_pack(%1173) : (i64) -> i64
    %1175 = func.call @cc_set_symbol_value(%1171, %1157) : (i64, i64) -> i64
    %1176 = llvm.mlir.addressof @str122 : !llvm.ptr
    %1177 = arith.constant 39 : i64
    %1178 = func.call @cc_make_string(%1176, %1177) : (!llvm.ptr, i64) -> i64
    %1179 = func.call @cc_nil_value() : () -> i64
    %1180 = func.call @cc_intern(%1178, %1179) : (i64, i64) -> i64
    %1181 = func.call @cc_nil_value() : () -> i64
    %1182 = func.call @cc_cons(%1180, %1181) : (i64, i64) -> i64
    %1183 = func.call @cc_values_pack(%1182) : (i64) -> i64
    %1184 = func.call @cc_set_symbol_value(%1180, %1157) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %1185 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1128) : (i64) -> ()
    %1186 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1125) : (i64) -> ()
    %1187 = func.call @stack_pop_pointer() : () -> i64
    %1188 = func.call @cc_nil_value() : () -> i64
    %1189 = func.call @cc_errorp(%1186) : (i64) -> i64
    %1190 = arith.cmpi ne, %1189, %1188 : i64
    %1191 = arith.cmpi eq, %1188, %1188 : i64
    %1192 = arith.andi %1190, %1191 : i1
    %1193 = scf.if %1192 -> (i64) {
      scf.yield %1186 : i64
    } else {
      scf.yield %1188 : i64
    }
    %1194 = func.call @cc_errorp(%1187) : (i64) -> i64
    %1195 = arith.cmpi ne, %1194, %1188 : i64
    %1196 = arith.cmpi eq, %1193, %1188 : i64
    %1197 = arith.andi %1195, %1196 : i1
    %1198 = scf.if %1197 -> (i64) {
      scf.yield %1187 : i64
    } else {
      scf.yield %1193 : i64
    }
    %1199 = arith.cmpi ne, %1198, %1188 : i64
    scf.if %1199 {
      func.call @stack_push_pointer(%1198) : (i64) -> ()
    } else {
      %1200 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1200) : (i64) -> ()
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      %1201 = func.call @stack_pop_pointer() : () -> i64
      %1202 = func.call @stack_pop_pointer() : () -> i64
      %1203 = func.call @cc_cons(%1201, %1202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1203) : (i64) -> ()
      func.call @stack_push_pointer(%1186) : (i64) -> ()
      %1204 = func.call @stack_pop_pointer() : () -> i64
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @cc_cons(%1204, %1205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1206) : (i64) -> ()
    }
    %1207 = func.call @stack_pop_pointer() : () -> i64
    %1208 = llvm.mlir.addressof @str123 : !llvm.ptr
    %1209 = arith.constant 20 : i64
    %1210 = func.call @cc_make_string(%1208, %1209) : (!llvm.ptr, i64) -> i64
    %1211 = llvm.mlir.addressof @str124 : !llvm.ptr
    %1212 = arith.constant 11 : i64
    %1213 = func.call @cc_make_string(%1211, %1212) : (!llvm.ptr, i64) -> i64
    %1214 = func.call @cc_intern(%1210, %1213) : (i64, i64) -> i64
    %1215 = func.call @cc_nil_value() : () -> i64
    %1216 = func.call @cc_cons(%1214, %1215) : (i64, i64) -> i64
    %1217 = func.call @cc_values_pack(%1216) : (i64) -> i64
    %1218 = func.call @cc_symbol_value(%1214) : (i64) -> i64
    %1219 = func.call @cc_cons(%1207, %1218) : (i64, i64) -> i64
    %1220 = llvm.mlir.addressof @str125 : !llvm.ptr
    %1221 = arith.constant 20 : i64
    %1222 = func.call @cc_make_string(%1220, %1221) : (!llvm.ptr, i64) -> i64
    %1223 = llvm.mlir.addressof @str126 : !llvm.ptr
    %1224 = arith.constant 11 : i64
    %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
    %1226 = func.call @cc_intern(%1222, %1225) : (i64, i64) -> i64
    %1227 = func.call @cc_nil_value() : () -> i64
    %1228 = func.call @cc_cons(%1226, %1227) : (i64, i64) -> i64
    %1229 = func.call @cc_values_pack(%1228) : (i64) -> i64
    %1230 = func.call @cc_set_symbol_value(%1226, %1219) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1219) : (i64) -> ()
    %1231 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1128) : (i64) -> ()
    %1232 = llvm.mlir.addressof @str127 : !llvm.ptr
    %1233 = arith.constant 19 : i64
    %1234 = func.call @cc_make_string(%1232, %1233) : (!llvm.ptr, i64) -> i64
    %1235 = llvm.mlir.addressof @str128 : !llvm.ptr
    %1236 = arith.constant 11 : i64
    %1237 = func.call @cc_make_string(%1235, %1236) : (!llvm.ptr, i64) -> i64
    %1238 = func.call @cc_intern(%1234, %1237) : (i64, i64) -> i64
    %1239 = func.call @cc_nil_value() : () -> i64
    %1240 = func.call @cc_cons(%1238, %1239) : (i64, i64) -> i64
    %1241 = func.call @cc_values_pack(%1240) : (i64) -> i64
    %1242 = func.call @cc_symbol_value(%1238) : (i64) -> i64
    func.call @stack_push_pointer(%1242) : (i64) -> ()
    %1243 = func.call @stack_pop_pointer() : () -> i64
    %1244 = func.call @stack_pop_pointer() : () -> i64
    %1245 = func.call @cc_member(%1244, %1243) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1245) : (i64) -> ()
    %1246 = func.call @stack_pop_pointer() : () -> i64
    %1247 = func.call @cc_nil_value() : () -> i64
    %1248 = arith.cmpi ne, %1246, %1247 : i64
    scf.if %1248 {
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1249 = func.call @stack_pop_pointer() : () -> i64
      %1250 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1251 = arith.constant 23 : i64
      %1252 = func.call @cc_make_string(%1250, %1251) : (!llvm.ptr, i64) -> i64
      %1253 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1254 = arith.constant 11 : i64
      %1255 = func.call @cc_make_string(%1253, %1254) : (!llvm.ptr, i64) -> i64
      %1256 = func.call @cc_intern(%1252, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_nil_value() : () -> i64
      %1258 = func.call @cc_cons(%1256, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
      %1260 = func.call @cc_symbol_value(%1256) : (i64) -> i64
      %1261 = func.call @cc_cons(%1249, %1260) : (i64, i64) -> i64
      %1262 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1263 = arith.constant 23 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1266 = arith.constant 11 : i64
      %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
      %1268 = func.call @cc_intern(%1264, %1267) : (i64, i64) -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_cons(%1268, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_values_pack(%1270) : (i64) -> i64
      %1272 = func.call @cc_set_symbol_value(%1268, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1261) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1275 = arith.constant 25 : i64
      %1276 = func.call @cc_make_string(%1274, %1275) : (!llvm.ptr, i64) -> i64
      %1277 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1278 = arith.constant 11 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = func.call @cc_intern(%1276, %1279) : (i64, i64) -> i64
      %1281 = func.call @cc_nil_value() : () -> i64
      %1282 = func.call @cc_cons(%1280, %1281) : (i64, i64) -> i64
      %1283 = func.call @cc_values_pack(%1282) : (i64) -> i64
      %1284 = func.call @cc_symbol_value(%1280) : (i64) -> i64
      %1285 = func.call @cc_cons(%1273, %1284) : (i64, i64) -> i64
      %1286 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1287 = arith.constant 25 : i64
      %1288 = func.call @cc_make_string(%1286, %1287) : (!llvm.ptr, i64) -> i64
      %1289 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1290 = arith.constant 11 : i64
      %1291 = func.call @cc_make_string(%1289, %1290) : (!llvm.ptr, i64) -> i64
      %1292 = func.call @cc_intern(%1288, %1291) : (i64, i64) -> i64
      %1293 = func.call @cc_nil_value() : () -> i64
      %1294 = func.call @cc_cons(%1292, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_values_pack(%1294) : (i64) -> i64
      %1296 = func.call @cc_set_symbol_value(%1292, %1285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1285) : (i64) -> ()
    }
    %1297 = func.call @stack_pop_pointer() : () -> i64
    %1298 = llvm.mlir.addressof @str137 : !llvm.ptr
    %1299 = arith.constant 3 : i64
    %1300 = func.call @cc_make_string(%1298, %1299) : (!llvm.ptr, i64) -> i64
    %1301 = llvm.mlir.addressof @str138 : !llvm.ptr
    %1302 = arith.constant 7 : i64
    %1303 = func.call @cc_make_string(%1301, %1302) : (!llvm.ptr, i64) -> i64
    %1304 = func.call @cc_intern(%1300, %1303) : (i64, i64) -> i64
    %1305 = func.call @cc_nil_value() : () -> i64
    %1306 = func.call @cc_cons(%1304, %1305) : (i64, i64) -> i64
    %1307 = func.call @cc_values_pack(%1306) : (i64) -> i64
    func.call @stack_push_pointer(%1304) : (i64) -> ()
    %1308 = func.call @stack_pop_pointer() : () -> i64
    %1309 = llvm.mlir.addressof @str139 : !llvm.ptr
    %1310 = arith.constant 9 : i64
    %1311 = func.call @cc_make_string(%1309, %1310) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1311) : (i64) -> ()
    %1312 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1128) : (i64) -> ()
    %1313 = func.call @stack_pop_pointer() : () -> i64
    %1314 = func.call @cc_nil_value() : () -> i64
    %1315 = func.call @cc_errorp(%1308) : (i64) -> i64
    %1316 = arith.cmpi ne, %1315, %1314 : i64
    %1317 = arith.cmpi eq, %1314, %1314 : i64
    %1318 = arith.andi %1316, %1317 : i1
    %1319 = scf.if %1318 -> (i64) {
      scf.yield %1308 : i64
    } else {
      scf.yield %1314 : i64
    }
    %1320 = func.call @cc_errorp(%1312) : (i64) -> i64
    %1321 = arith.cmpi ne, %1320, %1314 : i64
    %1322 = arith.cmpi eq, %1319, %1314 : i64
    %1323 = arith.andi %1321, %1322 : i1
    %1324 = scf.if %1323 -> (i64) {
      scf.yield %1312 : i64
    } else {
      scf.yield %1319 : i64
    }
    %1325 = func.call @cc_errorp(%1313) : (i64) -> i64
    %1326 = arith.cmpi ne, %1325, %1314 : i64
    %1327 = arith.cmpi eq, %1324, %1314 : i64
    %1328 = arith.andi %1326, %1327 : i1
    %1329 = scf.if %1328 -> (i64) {
      scf.yield %1313 : i64
    } else {
      scf.yield %1324 : i64
    }
    %1330 = arith.cmpi ne, %1329, %1314 : i64
    scf.if %1330 {
      func.call @stack_push_pointer(%1329) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1308) : (i64) -> ()
      func.call @stack_push_pointer(%1312) : (i64) -> ()
      func.call @stack_push_pointer(%1313) : (i64) -> ()
      %1331 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1332 = func.call @cc_make_function_ref_const(%1331) : (!llvm.ptr) -> i64
      %1333 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1332, %1333) : (i64, i64) -> ()
    }
    %1334 = func.call @stack_pop_pointer() : () -> i64
    %1335 = llvm.mlir.addressof @str141 : !llvm.ptr
    %1336 = arith.constant 4 : i64
    %1337 = func.call @cc_make_string(%1335, %1336) : (!llvm.ptr, i64) -> i64
    %1338 = llvm.mlir.addressof @str142 : !llvm.ptr
    %1339 = arith.constant 7 : i64
    %1340 = func.call @cc_make_string(%1338, %1339) : (!llvm.ptr, i64) -> i64
    %1341 = func.call @cc_intern(%1337, %1340) : (i64, i64) -> i64
    %1342 = func.call @cc_nil_value() : () -> i64
    %1343 = func.call @cc_cons(%1341, %1342) : (i64, i64) -> i64
    %1344 = func.call @cc_values_pack(%1343) : (i64) -> i64
    func.call @stack_push_pointer(%1341) : (i64) -> ()
    %1345 = func.call @stack_pop_pointer() : () -> i64
    %1346 = llvm.mlir.addressof @str143 : !llvm.ptr
    %1347 = arith.constant 46 : i64
    %1348 = func.call @cc_make_string(%1346, %1347) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1348) : (i64) -> ()
    %1349 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1125) : (i64) -> ()
    %1350 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1127) : (i64) -> ()
    %1351 = func.call @stack_pop_pointer() : () -> i64
    %1352 = func.call @cc_nil_value() : () -> i64
    %1353 = func.call @cc_errorp(%1345) : (i64) -> i64
    %1354 = arith.cmpi ne, %1353, %1352 : i64
    %1355 = arith.cmpi eq, %1352, %1352 : i64
    %1356 = arith.andi %1354, %1355 : i1
    %1357 = scf.if %1356 -> (i64) {
      scf.yield %1345 : i64
    } else {
      scf.yield %1352 : i64
    }
    %1358 = func.call @cc_errorp(%1349) : (i64) -> i64
    %1359 = arith.cmpi ne, %1358, %1352 : i64
    %1360 = arith.cmpi eq, %1357, %1352 : i64
    %1361 = arith.andi %1359, %1360 : i1
    %1362 = scf.if %1361 -> (i64) {
      scf.yield %1349 : i64
    } else {
      scf.yield %1357 : i64
    }
    %1363 = func.call @cc_errorp(%1350) : (i64) -> i64
    %1364 = arith.cmpi ne, %1363, %1352 : i64
    %1365 = arith.cmpi eq, %1362, %1352 : i64
    %1366 = arith.andi %1364, %1365 : i1
    %1367 = scf.if %1366 -> (i64) {
      scf.yield %1350 : i64
    } else {
      scf.yield %1362 : i64
    }
    %1368 = func.call @cc_errorp(%1351) : (i64) -> i64
    %1369 = arith.cmpi ne, %1368, %1352 : i64
    %1370 = arith.cmpi eq, %1367, %1352 : i64
    %1371 = arith.andi %1369, %1370 : i1
    %1372 = scf.if %1371 -> (i64) {
      scf.yield %1351 : i64
    } else {
      scf.yield %1367 : i64
    }
    %1373 = arith.cmpi ne, %1372, %1352 : i64
    scf.if %1373 {
      func.call @stack_push_pointer(%1372) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      func.call @stack_push_pointer(%1349) : (i64) -> ()
      func.call @stack_push_pointer(%1350) : (i64) -> ()
      func.call @stack_push_pointer(%1351) : (i64) -> ()
      %1374 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1375 = func.call @cc_make_function_ref_const(%1374) : (!llvm.ptr) -> i64
      %1376 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%1375, %1376) : (i64, i64) -> ()
    }
    %1377 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1124) : (i64) -> ()
    %1378 = func.call @stack_pop_pointer() : () -> i64
    %1379 = func.call @cc_nil_value() : () -> i64
    %1380 = arith.cmpi ne, %1378, %1379 : i64
    scf.if %1380 {
      %1381 = func.call @cc_nil_value() : () -> i64
      %1382 = func.call @cc_nil_value() : () -> i64
      %1383 = func.call @cc_errorp(%1381) : (i64) -> i64
      %1384 = arith.cmpi ne, %1383, %1382 : i64
      %1385 = scf.if %1384 -> (i64) {
        scf.yield %1381 : i64
      } else {
        %1386 = llvm.mlir.addressof @str145 : !llvm.ptr
        %1387 = arith.constant 4 : i64
        %1388 = func.call @cc_make_string(%1386, %1387) : (!llvm.ptr, i64) -> i64
        %1389 = llvm.mlir.addressof @str146 : !llvm.ptr
        %1390 = arith.constant 7 : i64
        %1391 = func.call @cc_make_string(%1389, %1390) : (!llvm.ptr, i64) -> i64
        %1392 = func.call @cc_intern(%1388, %1391) : (i64, i64) -> i64
        %1393 = func.call @cc_nil_value() : () -> i64
        %1394 = func.call @cc_cons(%1392, %1393) : (i64, i64) -> i64
        %1395 = func.call @cc_values_pack(%1394) : (i64) -> i64
        func.call @stack_push_pointer(%1392) : (i64) -> ()
        %1396 = func.call @stack_pop_pointer() : () -> i64
        %1397 = llvm.mlir.addressof @str147 : !llvm.ptr
        %1398 = arith.constant 2 : i64
        %1399 = func.call @cc_make_string(%1397, %1398) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1399) : (i64) -> ()
        %1400 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1124) : (i64) -> ()
        %1401 = func.call @stack_pop_pointer() : () -> i64
        %1402 = func.call @cc_nil_value() : () -> i64
        %1403 = func.call @cc_errorp(%1396) : (i64) -> i64
        %1404 = arith.cmpi ne, %1403, %1402 : i64
        %1405 = arith.cmpi eq, %1402, %1402 : i64
        %1406 = arith.andi %1404, %1405 : i1
        %1407 = scf.if %1406 -> (i64) {
          scf.yield %1396 : i64
        } else {
          scf.yield %1402 : i64
        }
        %1408 = func.call @cc_errorp(%1400) : (i64) -> i64
        %1409 = arith.cmpi ne, %1408, %1402 : i64
        %1410 = arith.cmpi eq, %1407, %1402 : i64
        %1411 = arith.andi %1409, %1410 : i1
        %1412 = scf.if %1411 -> (i64) {
          scf.yield %1400 : i64
        } else {
          scf.yield %1407 : i64
        }
        %1413 = func.call @cc_errorp(%1401) : (i64) -> i64
        %1414 = arith.cmpi ne, %1413, %1402 : i64
        %1415 = arith.cmpi eq, %1412, %1402 : i64
        %1416 = arith.andi %1414, %1415 : i1
        %1417 = scf.if %1416 -> (i64) {
          scf.yield %1401 : i64
        } else {
          scf.yield %1412 : i64
        }
        %1418 = arith.cmpi ne, %1417, %1402 : i64
        scf.if %1418 {
          func.call @stack_push_pointer(%1417) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1396) : (i64) -> ()
          func.call @stack_push_pointer(%1400) : (i64) -> ()
          func.call @stack_push_pointer(%1401) : (i64) -> ()
          %1419 = llvm.mlir.addressof @str148 : !llvm.ptr
          %1420 = func.call @cc_make_function_ref_const(%1419) : (!llvm.ptr) -> i64
          %1421 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1420, %1421) : (i64, i64) -> ()
        }
        %1422 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1422 : i64
      }
      func.call @stack_push_pointer(%1385) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1423 = func.call @stack_pop_pointer() : () -> i64
    %1424 = func.call @cc_multiple_value_list(%1423) : (i64) -> i64
    %1425 = llvm.mlir.addressof @str149 : !llvm.ptr
    %1426 = arith.constant 37 : i64
    %1427 = func.call @cc_make_string(%1425, %1426) : (!llvm.ptr, i64) -> i64
    %1428 = func.call @cc_nil_value() : () -> i64
    %1429 = func.call @cc_intern(%1427, %1428) : (i64, i64) -> i64
    %1430 = func.call @cc_nil_value() : () -> i64
    %1431 = func.call @cc_cons(%1429, %1430) : (i64, i64) -> i64
    %1432 = func.call @cc_values_pack(%1431) : (i64) -> i64
    %1433 = func.call @cc_symbol_value(%1429) : (i64) -> i64
    %1434 = llvm.mlir.addressof @str150 : !llvm.ptr
    %1435 = arith.constant 38 : i64
    %1436 = func.call @cc_make_string(%1434, %1435) : (!llvm.ptr, i64) -> i64
    %1437 = func.call @cc_nil_value() : () -> i64
    %1438 = func.call @cc_intern(%1436, %1437) : (i64, i64) -> i64
    %1439 = func.call @cc_nil_value() : () -> i64
    %1440 = func.call @cc_cons(%1438, %1439) : (i64, i64) -> i64
    %1441 = func.call @cc_values_pack(%1440) : (i64) -> i64
    %1442 = func.call @cc_symbol_value(%1438) : (i64) -> i64
    %1443 = llvm.mlir.addressof @str151 : !llvm.ptr
    %1444 = arith.constant 39 : i64
    %1445 = func.call @cc_make_string(%1443, %1444) : (!llvm.ptr, i64) -> i64
    %1446 = func.call @cc_nil_value() : () -> i64
    %1447 = func.call @cc_intern(%1445, %1446) : (i64, i64) -> i64
    %1448 = func.call @cc_nil_value() : () -> i64
    %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
    %1450 = func.call @cc_values_pack(%1449) : (i64) -> i64
    %1451 = func.call @cc_symbol_value(%1447) : (i64) -> i64
    %1452 = func.call @cc_nil_value() : () -> i64
    %1453 = arith.cmpi ne, %1433, %1452 : i64
    %1454 = scf.if %1453 -> (i64) {
      scf.yield %1451 : i64
    } else {
      scf.yield %1424 : i64
    }
    %1455 = func.call @cc_values_pack(%1454) : (i64) -> i64
    func.call @stack_push_pointer(%1455) : (i64) -> ()
    %1456 = func.call @stack_pop_pointer() : () -> i64
    %1457 = func.call @cc_multiple_value_list(%1456) : (i64) -> i64
    %1458 = llvm.mlir.addressof @str152 : !llvm.ptr
    %1459 = arith.constant 37 : i64
    %1460 = func.call @cc_make_string(%1458, %1459) : (!llvm.ptr, i64) -> i64
    %1461 = func.call @cc_nil_value() : () -> i64
    %1462 = func.call @cc_intern(%1460, %1461) : (i64, i64) -> i64
    %1463 = func.call @cc_nil_value() : () -> i64
    %1464 = func.call @cc_cons(%1462, %1463) : (i64, i64) -> i64
    %1465 = func.call @cc_values_pack(%1464) : (i64) -> i64
    %1466 = func.call @cc_symbol_value(%1462) : (i64) -> i64
    %1467 = llvm.mlir.addressof @str153 : !llvm.ptr
    %1468 = arith.constant 39 : i64
    %1469 = func.call @cc_make_string(%1467, %1468) : (!llvm.ptr, i64) -> i64
    %1470 = func.call @cc_nil_value() : () -> i64
    %1471 = func.call @cc_intern(%1469, %1470) : (i64, i64) -> i64
    %1472 = func.call @cc_nil_value() : () -> i64
    %1473 = func.call @cc_cons(%1471, %1472) : (i64, i64) -> i64
    %1474 = func.call @cc_values_pack(%1473) : (i64) -> i64
    %1475 = func.call @cc_symbol_value(%1471) : (i64) -> i64
    %1476 = func.call @cc_nil_value() : () -> i64
    %1477 = arith.cmpi ne, %1466, %1476 : i64
    %1478 = scf.if %1477 -> (i64) {
      scf.yield %1475 : i64
    } else {
      scf.yield %1457 : i64
    }
    %1479 = func.call @cc_values_pack(%1478) : (i64) -> i64
    func.call @stack_push_pointer(%1479) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%fail-test"() {
    %1480 = llvm.mlir.addressof @str154 : !llvm.ptr
    %1481 = arith.constant 10 : i64
    %1482 = func.call @cc_make_string(%1480, %1481) : (!llvm.ptr, i64) -> i64
    %1483 = func.call @cc_nil_value() : () -> i64
    %1484 = func.call @cc_intern(%1482, %1483) : (i64, i64) -> i64
    %1485 = func.call @cc_nil_value() : () -> i64
    %1486 = func.call @cc_cons(%1484, %1485) : (i64, i64) -> i64
    %1487 = func.call @cc_values_pack(%1486) : (i64) -> i64
    %1488 = llvm.mlir.addressof @str155 : !llvm.ptr
    %1489 = arith.constant 42 : i64
    %1490 = func.call @cc_make_string(%1488, %1489) : (!llvm.ptr, i64) -> i64
    %1491 = func.call @cc_register_function_lambda_list_metadata_raw(%1484, %1490) : (i64, i64) -> i64
    %1492 = arith.constant 6 : i64
    func.call @cc_runtime_debug_stack_push_call(%1484, %1492) : (i64, i64) -> ()
    %1493 = func.call @stack_pop_pointer() : () -> i64
    %1494 = func.call @stack_pop_pointer() : () -> i64
    %1495 = func.call @stack_pop_pointer() : () -> i64
    %1496 = func.call @stack_pop_pointer() : () -> i64
    %1497 = func.call @stack_pop_pointer() : () -> i64
    %1498 = func.call @stack_pop_pointer() : () -> i64
    %1499 = func.call @cc_nil_value() : () -> i64
    %1500 = llvm.mlir.addressof @str156 : !llvm.ptr
    %1501 = arith.constant 37 : i64
    %1502 = func.call @cc_make_string(%1500, %1501) : (!llvm.ptr, i64) -> i64
    %1503 = func.call @cc_nil_value() : () -> i64
    %1504 = func.call @cc_intern(%1502, %1503) : (i64, i64) -> i64
    %1505 = func.call @cc_nil_value() : () -> i64
    %1506 = func.call @cc_cons(%1504, %1505) : (i64, i64) -> i64
    %1507 = func.call @cc_values_pack(%1506) : (i64) -> i64
    %1508 = func.call @cc_set_symbol_value(%1504, %1499) : (i64, i64) -> i64
    %1509 = llvm.mlir.addressof @str157 : !llvm.ptr
    %1510 = arith.constant 38 : i64
    %1511 = func.call @cc_make_string(%1509, %1510) : (!llvm.ptr, i64) -> i64
    %1512 = func.call @cc_nil_value() : () -> i64
    %1513 = func.call @cc_intern(%1511, %1512) : (i64, i64) -> i64
    %1514 = func.call @cc_nil_value() : () -> i64
    %1515 = func.call @cc_cons(%1513, %1514) : (i64, i64) -> i64
    %1516 = func.call @cc_values_pack(%1515) : (i64) -> i64
    %1517 = func.call @cc_set_symbol_value(%1513, %1499) : (i64, i64) -> i64
    %1518 = llvm.mlir.addressof @str158 : !llvm.ptr
    %1519 = arith.constant 39 : i64
    %1520 = func.call @cc_make_string(%1518, %1519) : (!llvm.ptr, i64) -> i64
    %1521 = func.call @cc_nil_value() : () -> i64
    %1522 = func.call @cc_intern(%1520, %1521) : (i64, i64) -> i64
    %1523 = func.call @cc_nil_value() : () -> i64
    %1524 = func.call @cc_cons(%1522, %1523) : (i64, i64) -> i64
    %1525 = func.call @cc_values_pack(%1524) : (i64) -> i64
    %1526 = func.call @cc_set_symbol_value(%1522, %1499) : (i64, i64) -> i64
    %1527 = func.call @cc_nil_value() : () -> i64
    %1528 = llvm.mlir.addressof @str159 : !llvm.ptr
    %1529 = arith.constant 37 : i64
    %1530 = func.call @cc_make_string(%1528, %1529) : (!llvm.ptr, i64) -> i64
    %1531 = func.call @cc_nil_value() : () -> i64
    %1532 = func.call @cc_intern(%1530, %1531) : (i64, i64) -> i64
    %1533 = func.call @cc_nil_value() : () -> i64
    %1534 = func.call @cc_cons(%1532, %1533) : (i64, i64) -> i64
    %1535 = func.call @cc_values_pack(%1534) : (i64) -> i64
    %1536 = func.call @cc_set_symbol_value(%1532, %1527) : (i64, i64) -> i64
    %1537 = llvm.mlir.addressof @str160 : !llvm.ptr
    %1538 = arith.constant 38 : i64
    %1539 = func.call @cc_make_string(%1537, %1538) : (!llvm.ptr, i64) -> i64
    %1540 = func.call @cc_nil_value() : () -> i64
    %1541 = func.call @cc_intern(%1539, %1540) : (i64, i64) -> i64
    %1542 = func.call @cc_nil_value() : () -> i64
    %1543 = func.call @cc_cons(%1541, %1542) : (i64, i64) -> i64
    %1544 = func.call @cc_values_pack(%1543) : (i64) -> i64
    %1545 = func.call @cc_set_symbol_value(%1541, %1527) : (i64, i64) -> i64
    %1546 = llvm.mlir.addressof @str161 : !llvm.ptr
    %1547 = arith.constant 39 : i64
    %1548 = func.call @cc_make_string(%1546, %1547) : (!llvm.ptr, i64) -> i64
    %1549 = func.call @cc_nil_value() : () -> i64
    %1550 = func.call @cc_intern(%1548, %1549) : (i64, i64) -> i64
    %1551 = func.call @cc_nil_value() : () -> i64
    %1552 = func.call @cc_cons(%1550, %1551) : (i64, i64) -> i64
    %1553 = func.call @cc_values_pack(%1552) : (i64) -> i64
    %1554 = func.call @cc_set_symbol_value(%1550, %1527) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1498) : (i64) -> ()
    %1555 = llvm.mlir.addressof @str162 : !llvm.ptr
    %1556 = arith.constant 19 : i64
    %1557 = func.call @cc_make_string(%1555, %1556) : (!llvm.ptr, i64) -> i64
    %1558 = llvm.mlir.addressof @str163 : !llvm.ptr
    %1559 = arith.constant 11 : i64
    %1560 = func.call @cc_make_string(%1558, %1559) : (!llvm.ptr, i64) -> i64
    %1561 = func.call @cc_intern(%1557, %1560) : (i64, i64) -> i64
    %1562 = func.call @cc_nil_value() : () -> i64
    %1563 = func.call @cc_cons(%1561, %1562) : (i64, i64) -> i64
    %1564 = func.call @cc_values_pack(%1563) : (i64) -> i64
    %1565 = func.call @cc_symbol_value(%1561) : (i64) -> i64
    func.call @stack_push_pointer(%1565) : (i64) -> ()
    %1566 = func.call @stack_pop_pointer() : () -> i64
    %1567 = func.call @stack_pop_pointer() : () -> i64
    %1568 = func.call @cc_member(%1567, %1566) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1568) : (i64) -> ()
    %1569 = func.call @stack_pop_pointer() : () -> i64
    %1570 = func.call @cc_nil_value() : () -> i64
    %1571 = arith.cmpi ne, %1569, %1570 : i64
    scf.if %1571 {
      func.call @stack_push_pointer(%1498) : (i64) -> ()
      %1572 = func.call @stack_pop_pointer() : () -> i64
      %1573 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1574 = arith.constant 23 : i64
      %1575 = func.call @cc_make_string(%1573, %1574) : (!llvm.ptr, i64) -> i64
      %1576 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1577 = arith.constant 11 : i64
      %1578 = func.call @cc_make_string(%1576, %1577) : (!llvm.ptr, i64) -> i64
      %1579 = func.call @cc_intern(%1575, %1578) : (i64, i64) -> i64
      %1580 = func.call @cc_nil_value() : () -> i64
      %1581 = func.call @cc_cons(%1579, %1580) : (i64, i64) -> i64
      %1582 = func.call @cc_values_pack(%1581) : (i64) -> i64
      %1583 = func.call @cc_symbol_value(%1579) : (i64) -> i64
      %1584 = func.call @cc_cons(%1572, %1583) : (i64, i64) -> i64
      %1585 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1586 = arith.constant 23 : i64
      %1587 = func.call @cc_make_string(%1585, %1586) : (!llvm.ptr, i64) -> i64
      %1588 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1589 = arith.constant 11 : i64
      %1590 = func.call @cc_make_string(%1588, %1589) : (!llvm.ptr, i64) -> i64
      %1591 = func.call @cc_intern(%1587, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = func.call @cc_cons(%1591, %1592) : (i64, i64) -> i64
      %1594 = func.call @cc_values_pack(%1593) : (i64) -> i64
      %1595 = func.call @cc_set_symbol_value(%1591, %1584) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1584) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1498) : (i64) -> ()
      %1596 = func.call @stack_pop_pointer() : () -> i64
      %1597 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1598 = arith.constant 25 : i64
      %1599 = func.call @cc_make_string(%1597, %1598) : (!llvm.ptr, i64) -> i64
      %1600 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1601 = arith.constant 11 : i64
      %1602 = func.call @cc_make_string(%1600, %1601) : (!llvm.ptr, i64) -> i64
      %1603 = func.call @cc_intern(%1599, %1602) : (i64, i64) -> i64
      %1604 = func.call @cc_nil_value() : () -> i64
      %1605 = func.call @cc_cons(%1603, %1604) : (i64, i64) -> i64
      %1606 = func.call @cc_values_pack(%1605) : (i64) -> i64
      %1607 = func.call @cc_symbol_value(%1603) : (i64) -> i64
      %1608 = func.call @cc_cons(%1596, %1607) : (i64, i64) -> i64
      %1609 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1610 = arith.constant 25 : i64
      %1611 = func.call @cc_make_string(%1609, %1610) : (!llvm.ptr, i64) -> i64
      %1612 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1613 = arith.constant 11 : i64
      %1614 = func.call @cc_make_string(%1612, %1613) : (!llvm.ptr, i64) -> i64
      %1615 = func.call @cc_intern(%1611, %1614) : (i64, i64) -> i64
      %1616 = func.call @cc_nil_value() : () -> i64
      %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
      %1619 = func.call @cc_set_symbol_value(%1615, %1608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
    }
    %1620 = func.call @stack_pop_pointer() : () -> i64
    %1621 = llvm.mlir.addressof @str172 : !llvm.ptr
    %1622 = arith.constant 3 : i64
    %1623 = func.call @cc_make_string(%1621, %1622) : (!llvm.ptr, i64) -> i64
    %1624 = llvm.mlir.addressof @str173 : !llvm.ptr
    %1625 = arith.constant 7 : i64
    %1626 = func.call @cc_make_string(%1624, %1625) : (!llvm.ptr, i64) -> i64
    %1627 = func.call @cc_intern(%1623, %1626) : (i64, i64) -> i64
    %1628 = func.call @cc_nil_value() : () -> i64
    %1629 = func.call @cc_cons(%1627, %1628) : (i64, i64) -> i64
    %1630 = func.call @cc_values_pack(%1629) : (i64) -> i64
    func.call @stack_push_pointer(%1627) : (i64) -> ()
    %1631 = func.call @stack_pop_pointer() : () -> i64
    %1632 = llvm.mlir.addressof @str174 : !llvm.ptr
    %1633 = arith.constant 9 : i64
    %1634 = func.call @cc_make_string(%1632, %1633) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1634) : (i64) -> ()
    %1635 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1498) : (i64) -> ()
    %1636 = func.call @stack_pop_pointer() : () -> i64
    %1637 = func.call @cc_nil_value() : () -> i64
    %1638 = func.call @cc_errorp(%1631) : (i64) -> i64
    %1639 = arith.cmpi ne, %1638, %1637 : i64
    %1640 = arith.cmpi eq, %1637, %1637 : i64
    %1641 = arith.andi %1639, %1640 : i1
    %1642 = scf.if %1641 -> (i64) {
      scf.yield %1631 : i64
    } else {
      scf.yield %1637 : i64
    }
    %1643 = func.call @cc_errorp(%1635) : (i64) -> i64
    %1644 = arith.cmpi ne, %1643, %1637 : i64
    %1645 = arith.cmpi eq, %1642, %1637 : i64
    %1646 = arith.andi %1644, %1645 : i1
    %1647 = scf.if %1646 -> (i64) {
      scf.yield %1635 : i64
    } else {
      scf.yield %1642 : i64
    }
    %1648 = func.call @cc_errorp(%1636) : (i64) -> i64
    %1649 = arith.cmpi ne, %1648, %1637 : i64
    %1650 = arith.cmpi eq, %1647, %1637 : i64
    %1651 = arith.andi %1649, %1650 : i1
    %1652 = scf.if %1651 -> (i64) {
      scf.yield %1636 : i64
    } else {
      scf.yield %1647 : i64
    }
    %1653 = arith.cmpi ne, %1652, %1637 : i64
    scf.if %1653 {
      func.call @stack_push_pointer(%1652) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1631) : (i64) -> ()
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      func.call @stack_push_pointer(%1636) : (i64) -> ()
      %1654 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1655 = func.call @cc_make_function_ref_const(%1654) : (!llvm.ptr) -> i64
      %1656 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1655, %1656) : (i64, i64) -> ()
    }
    %1657 = func.call @stack_pop_pointer() : () -> i64
    %1658 = llvm.mlir.addressof @str176 : !llvm.ptr
    %1659 = arith.constant 4 : i64
    %1660 = func.call @cc_make_string(%1658, %1659) : (!llvm.ptr, i64) -> i64
    %1661 = llvm.mlir.addressof @str177 : !llvm.ptr
    %1662 = arith.constant 7 : i64
    %1663 = func.call @cc_make_string(%1661, %1662) : (!llvm.ptr, i64) -> i64
    %1664 = func.call @cc_intern(%1660, %1663) : (i64, i64) -> i64
    %1665 = func.call @cc_nil_value() : () -> i64
    %1666 = func.call @cc_cons(%1664, %1665) : (i64, i64) -> i64
    %1667 = func.call @cc_values_pack(%1666) : (i64) -> i64
    func.call @stack_push_pointer(%1664) : (i64) -> ()
    %1668 = func.call @stack_pop_pointer() : () -> i64
    %1669 = llvm.mlir.addressof @str178 : !llvm.ptr
    %1670 = arith.constant 50 : i64
    %1671 = func.call @cc_make_string(%1669, %1670) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1671) : (i64) -> ()
    %1672 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1493) : (i64) -> ()
    %1673 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1496) : (i64) -> ()
    %1674 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1495) : (i64) -> ()
    %1675 = func.call @stack_pop_pointer() : () -> i64
    %1676 = func.call @cc_nil_value() : () -> i64
    %1677 = func.call @cc_errorp(%1668) : (i64) -> i64
    %1678 = arith.cmpi ne, %1677, %1676 : i64
    %1679 = arith.cmpi eq, %1676, %1676 : i64
    %1680 = arith.andi %1678, %1679 : i1
    %1681 = scf.if %1680 -> (i64) {
      scf.yield %1668 : i64
    } else {
      scf.yield %1676 : i64
    }
    %1682 = func.call @cc_errorp(%1672) : (i64) -> i64
    %1683 = arith.cmpi ne, %1682, %1676 : i64
    %1684 = arith.cmpi eq, %1681, %1676 : i64
    %1685 = arith.andi %1683, %1684 : i1
    %1686 = scf.if %1685 -> (i64) {
      scf.yield %1672 : i64
    } else {
      scf.yield %1681 : i64
    }
    %1687 = func.call @cc_errorp(%1673) : (i64) -> i64
    %1688 = arith.cmpi ne, %1687, %1676 : i64
    %1689 = arith.cmpi eq, %1686, %1676 : i64
    %1690 = arith.andi %1688, %1689 : i1
    %1691 = scf.if %1690 -> (i64) {
      scf.yield %1673 : i64
    } else {
      scf.yield %1686 : i64
    }
    %1692 = func.call @cc_errorp(%1674) : (i64) -> i64
    %1693 = arith.cmpi ne, %1692, %1676 : i64
    %1694 = arith.cmpi eq, %1691, %1676 : i64
    %1695 = arith.andi %1693, %1694 : i1
    %1696 = scf.if %1695 -> (i64) {
      scf.yield %1674 : i64
    } else {
      scf.yield %1691 : i64
    }
    %1697 = func.call @cc_errorp(%1675) : (i64) -> i64
    %1698 = arith.cmpi ne, %1697, %1676 : i64
    %1699 = arith.cmpi eq, %1696, %1676 : i64
    %1700 = arith.andi %1698, %1699 : i1
    %1701 = scf.if %1700 -> (i64) {
      scf.yield %1675 : i64
    } else {
      scf.yield %1696 : i64
    }
    %1702 = arith.cmpi ne, %1701, %1676 : i64
    scf.if %1702 {
      func.call @stack_push_pointer(%1701) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1668) : (i64) -> ()
      func.call @stack_push_pointer(%1672) : (i64) -> ()
      func.call @stack_push_pointer(%1673) : (i64) -> ()
      func.call @stack_push_pointer(%1674) : (i64) -> ()
      func.call @stack_push_pointer(%1675) : (i64) -> ()
      %1703 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1704 = func.call @cc_make_function_ref_const(%1703) : (!llvm.ptr) -> i64
      %1705 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1704, %1705) : (i64, i64) -> ()
    }
    %1706 = func.call @stack_pop_pointer() : () -> i64
    %1707 = llvm.mlir.addressof @str180 : !llvm.ptr
    %1708 = arith.constant 4 : i64
    %1709 = func.call @cc_make_string(%1707, %1708) : (!llvm.ptr, i64) -> i64
    %1710 = llvm.mlir.addressof @str181 : !llvm.ptr
    %1711 = arith.constant 7 : i64
    %1712 = func.call @cc_make_string(%1710, %1711) : (!llvm.ptr, i64) -> i64
    %1713 = func.call @cc_intern(%1709, %1712) : (i64, i64) -> i64
    %1714 = func.call @cc_nil_value() : () -> i64
    %1715 = func.call @cc_cons(%1713, %1714) : (i64, i64) -> i64
    %1716 = func.call @cc_values_pack(%1715) : (i64) -> i64
    func.call @stack_push_pointer(%1713) : (i64) -> ()
    %1717 = func.call @stack_pop_pointer() : () -> i64
    %1718 = llvm.mlir.addressof @str182 : !llvm.ptr
    %1719 = arith.constant 24 : i64
    %1720 = func.call @cc_make_string(%1718, %1719) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1720) : (i64) -> ()
    %1721 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1497) : (i64) -> ()
    %1722 = func.call @stack_pop_pointer() : () -> i64
    %1723 = func.call @cc_nil_value() : () -> i64
    %1724 = func.call @cc_errorp(%1717) : (i64) -> i64
    %1725 = arith.cmpi ne, %1724, %1723 : i64
    %1726 = arith.cmpi eq, %1723, %1723 : i64
    %1727 = arith.andi %1725, %1726 : i1
    %1728 = scf.if %1727 -> (i64) {
      scf.yield %1717 : i64
    } else {
      scf.yield %1723 : i64
    }
    %1729 = func.call @cc_errorp(%1721) : (i64) -> i64
    %1730 = arith.cmpi ne, %1729, %1723 : i64
    %1731 = arith.cmpi eq, %1728, %1723 : i64
    %1732 = arith.andi %1730, %1731 : i1
    %1733 = scf.if %1732 -> (i64) {
      scf.yield %1721 : i64
    } else {
      scf.yield %1728 : i64
    }
    %1734 = func.call @cc_errorp(%1722) : (i64) -> i64
    %1735 = arith.cmpi ne, %1734, %1723 : i64
    %1736 = arith.cmpi eq, %1733, %1723 : i64
    %1737 = arith.andi %1735, %1736 : i1
    %1738 = scf.if %1737 -> (i64) {
      scf.yield %1722 : i64
    } else {
      scf.yield %1733 : i64
    }
    %1739 = arith.cmpi ne, %1738, %1723 : i64
    scf.if %1739 {
      func.call @stack_push_pointer(%1738) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1717) : (i64) -> ()
      func.call @stack_push_pointer(%1721) : (i64) -> ()
      func.call @stack_push_pointer(%1722) : (i64) -> ()
      %1740 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1741 = func.call @cc_make_function_ref_const(%1740) : (!llvm.ptr) -> i64
      %1742 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1741, %1742) : (i64, i64) -> ()
    }
    %1743 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1494) : (i64) -> ()
    %1744 = func.call @stack_pop_pointer() : () -> i64
    %1745 = func.call @cc_nil_value() : () -> i64
    %1746 = arith.cmpi ne, %1744, %1745 : i64
    scf.if %1746 {
      %1747 = func.call @cc_nil_value() : () -> i64
      %1748 = func.call @cc_nil_value() : () -> i64
      %1749 = func.call @cc_errorp(%1747) : (i64) -> i64
      %1750 = arith.cmpi ne, %1749, %1748 : i64
      %1751 = scf.if %1750 -> (i64) {
        scf.yield %1747 : i64
      } else {
        %1752 = llvm.mlir.addressof @str184 : !llvm.ptr
        %1753 = arith.constant 4 : i64
        %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
        %1755 = llvm.mlir.addressof @str185 : !llvm.ptr
        %1756 = arith.constant 7 : i64
        %1757 = func.call @cc_make_string(%1755, %1756) : (!llvm.ptr, i64) -> i64
        %1758 = func.call @cc_intern(%1754, %1757) : (i64, i64) -> i64
        %1759 = func.call @cc_nil_value() : () -> i64
        %1760 = func.call @cc_cons(%1758, %1759) : (i64, i64) -> i64
        %1761 = func.call @cc_values_pack(%1760) : (i64) -> i64
        func.call @stack_push_pointer(%1758) : (i64) -> ()
        %1762 = func.call @stack_pop_pointer() : () -> i64
        %1763 = llvm.mlir.addressof @str186 : !llvm.ptr
        %1764 = arith.constant 2 : i64
        %1765 = func.call @cc_make_string(%1763, %1764) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1765) : (i64) -> ()
        %1766 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1494) : (i64) -> ()
        %1767 = func.call @stack_pop_pointer() : () -> i64
        %1768 = func.call @cc_nil_value() : () -> i64
        %1769 = func.call @cc_errorp(%1762) : (i64) -> i64
        %1770 = arith.cmpi ne, %1769, %1768 : i64
        %1771 = arith.cmpi eq, %1768, %1768 : i64
        %1772 = arith.andi %1770, %1771 : i1
        %1773 = scf.if %1772 -> (i64) {
          scf.yield %1762 : i64
        } else {
          scf.yield %1768 : i64
        }
        %1774 = func.call @cc_errorp(%1766) : (i64) -> i64
        %1775 = arith.cmpi ne, %1774, %1768 : i64
        %1776 = arith.cmpi eq, %1773, %1768 : i64
        %1777 = arith.andi %1775, %1776 : i1
        %1778 = scf.if %1777 -> (i64) {
          scf.yield %1766 : i64
        } else {
          scf.yield %1773 : i64
        }
        %1779 = func.call @cc_errorp(%1767) : (i64) -> i64
        %1780 = arith.cmpi ne, %1779, %1768 : i64
        %1781 = arith.cmpi eq, %1778, %1768 : i64
        %1782 = arith.andi %1780, %1781 : i1
        %1783 = scf.if %1782 -> (i64) {
          scf.yield %1767 : i64
        } else {
          scf.yield %1778 : i64
        }
        %1784 = arith.cmpi ne, %1783, %1768 : i64
        scf.if %1784 {
          func.call @stack_push_pointer(%1783) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1762) : (i64) -> ()
          func.call @stack_push_pointer(%1766) : (i64) -> ()
          func.call @stack_push_pointer(%1767) : (i64) -> ()
          %1785 = llvm.mlir.addressof @str187 : !llvm.ptr
          %1786 = func.call @cc_make_function_ref_const(%1785) : (!llvm.ptr) -> i64
          %1787 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1786, %1787) : (i64, i64) -> ()
        }
        %1788 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1788 : i64
      }
      func.call @stack_push_pointer(%1751) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1789 = func.call @stack_pop_pointer() : () -> i64
    %1790 = func.call @cc_multiple_value_list(%1789) : (i64) -> i64
    %1791 = llvm.mlir.addressof @str188 : !llvm.ptr
    %1792 = arith.constant 37 : i64
    %1793 = func.call @cc_make_string(%1791, %1792) : (!llvm.ptr, i64) -> i64
    %1794 = func.call @cc_nil_value() : () -> i64
    %1795 = func.call @cc_intern(%1793, %1794) : (i64, i64) -> i64
    %1796 = func.call @cc_nil_value() : () -> i64
    %1797 = func.call @cc_cons(%1795, %1796) : (i64, i64) -> i64
    %1798 = func.call @cc_values_pack(%1797) : (i64) -> i64
    %1799 = func.call @cc_symbol_value(%1795) : (i64) -> i64
    %1800 = llvm.mlir.addressof @str189 : !llvm.ptr
    %1801 = arith.constant 38 : i64
    %1802 = func.call @cc_make_string(%1800, %1801) : (!llvm.ptr, i64) -> i64
    %1803 = func.call @cc_nil_value() : () -> i64
    %1804 = func.call @cc_intern(%1802, %1803) : (i64, i64) -> i64
    %1805 = func.call @cc_nil_value() : () -> i64
    %1806 = func.call @cc_cons(%1804, %1805) : (i64, i64) -> i64
    %1807 = func.call @cc_values_pack(%1806) : (i64) -> i64
    %1808 = func.call @cc_symbol_value(%1804) : (i64) -> i64
    %1809 = llvm.mlir.addressof @str190 : !llvm.ptr
    %1810 = arith.constant 39 : i64
    %1811 = func.call @cc_make_string(%1809, %1810) : (!llvm.ptr, i64) -> i64
    %1812 = func.call @cc_nil_value() : () -> i64
    %1813 = func.call @cc_intern(%1811, %1812) : (i64, i64) -> i64
    %1814 = func.call @cc_nil_value() : () -> i64
    %1815 = func.call @cc_cons(%1813, %1814) : (i64, i64) -> i64
    %1816 = func.call @cc_values_pack(%1815) : (i64) -> i64
    %1817 = func.call @cc_symbol_value(%1813) : (i64) -> i64
    %1818 = func.call @cc_nil_value() : () -> i64
    %1819 = arith.cmpi ne, %1799, %1818 : i64
    %1820 = scf.if %1819 -> (i64) {
      scf.yield %1817 : i64
    } else {
      scf.yield %1790 : i64
    }
    %1821 = func.call @cc_values_pack(%1820) : (i64) -> i64
    func.call @stack_push_pointer(%1821) : (i64) -> ()
    %1822 = func.call @stack_pop_pointer() : () -> i64
    %1823 = func.call @cc_multiple_value_list(%1822) : (i64) -> i64
    %1824 = llvm.mlir.addressof @str191 : !llvm.ptr
    %1825 = arith.constant 37 : i64
    %1826 = func.call @cc_make_string(%1824, %1825) : (!llvm.ptr, i64) -> i64
    %1827 = func.call @cc_nil_value() : () -> i64
    %1828 = func.call @cc_intern(%1826, %1827) : (i64, i64) -> i64
    %1829 = func.call @cc_nil_value() : () -> i64
    %1830 = func.call @cc_cons(%1828, %1829) : (i64, i64) -> i64
    %1831 = func.call @cc_values_pack(%1830) : (i64) -> i64
    %1832 = func.call @cc_symbol_value(%1828) : (i64) -> i64
    %1833 = llvm.mlir.addressof @str192 : !llvm.ptr
    %1834 = arith.constant 39 : i64
    %1835 = func.call @cc_make_string(%1833, %1834) : (!llvm.ptr, i64) -> i64
    %1836 = func.call @cc_nil_value() : () -> i64
    %1837 = func.call @cc_intern(%1835, %1836) : (i64, i64) -> i64
    %1838 = func.call @cc_nil_value() : () -> i64
    %1839 = func.call @cc_cons(%1837, %1838) : (i64, i64) -> i64
    %1840 = func.call @cc_values_pack(%1839) : (i64) -> i64
    %1841 = func.call @cc_symbol_value(%1837) : (i64) -> i64
    %1842 = func.call @cc_nil_value() : () -> i64
    %1843 = arith.cmpi ne, %1832, %1842 : i64
    %1844 = scf.if %1843 -> (i64) {
      scf.yield %1841 : i64
    } else {
      scf.yield %1823 : i64
    }
    %1845 = func.call @cc_values_pack(%1844) : (i64) -> i64
    func.call @stack_push_pointer(%1845) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%succeed-test"() {
    %1846 = llvm.mlir.addressof @str193 : !llvm.ptr
    %1847 = arith.constant 13 : i64
    %1848 = func.call @cc_make_string(%1846, %1847) : (!llvm.ptr, i64) -> i64
    %1849 = func.call @cc_nil_value() : () -> i64
    %1850 = func.call @cc_intern(%1848, %1849) : (i64, i64) -> i64
    %1851 = func.call @cc_nil_value() : () -> i64
    %1852 = func.call @cc_cons(%1850, %1851) : (i64, i64) -> i64
    %1853 = func.call @cc_values_pack(%1852) : (i64) -> i64
    %1854 = llvm.mlir.addressof @str194 : !llvm.ptr
    %1855 = arith.constant 4 : i64
    %1856 = func.call @cc_make_string(%1854, %1855) : (!llvm.ptr, i64) -> i64
    %1857 = func.call @cc_register_function_lambda_list_metadata_raw(%1850, %1856) : (i64, i64) -> i64
    %1858 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%1850, %1858) : (i64, i64) -> ()
    %1859 = func.call @stack_pop_pointer() : () -> i64
    %1860 = func.call @cc_nil_value() : () -> i64
    %1861 = llvm.mlir.addressof @str195 : !llvm.ptr
    %1862 = arith.constant 37 : i64
    %1863 = func.call @cc_make_string(%1861, %1862) : (!llvm.ptr, i64) -> i64
    %1864 = func.call @cc_nil_value() : () -> i64
    %1865 = func.call @cc_intern(%1863, %1864) : (i64, i64) -> i64
    %1866 = func.call @cc_nil_value() : () -> i64
    %1867 = func.call @cc_cons(%1865, %1866) : (i64, i64) -> i64
    %1868 = func.call @cc_values_pack(%1867) : (i64) -> i64
    %1869 = func.call @cc_set_symbol_value(%1865, %1860) : (i64, i64) -> i64
    %1870 = llvm.mlir.addressof @str196 : !llvm.ptr
    %1871 = arith.constant 38 : i64
    %1872 = func.call @cc_make_string(%1870, %1871) : (!llvm.ptr, i64) -> i64
    %1873 = func.call @cc_nil_value() : () -> i64
    %1874 = func.call @cc_intern(%1872, %1873) : (i64, i64) -> i64
    %1875 = func.call @cc_nil_value() : () -> i64
    %1876 = func.call @cc_cons(%1874, %1875) : (i64, i64) -> i64
    %1877 = func.call @cc_values_pack(%1876) : (i64) -> i64
    %1878 = func.call @cc_set_symbol_value(%1874, %1860) : (i64, i64) -> i64
    %1879 = llvm.mlir.addressof @str197 : !llvm.ptr
    %1880 = arith.constant 39 : i64
    %1881 = func.call @cc_make_string(%1879, %1880) : (!llvm.ptr, i64) -> i64
    %1882 = func.call @cc_nil_value() : () -> i64
    %1883 = func.call @cc_intern(%1881, %1882) : (i64, i64) -> i64
    %1884 = func.call @cc_nil_value() : () -> i64
    %1885 = func.call @cc_cons(%1883, %1884) : (i64, i64) -> i64
    %1886 = func.call @cc_values_pack(%1885) : (i64) -> i64
    %1887 = func.call @cc_set_symbol_value(%1883, %1860) : (i64, i64) -> i64
    %1888 = func.call @cc_nil_value() : () -> i64
    %1889 = llvm.mlir.addressof @str198 : !llvm.ptr
    %1890 = arith.constant 37 : i64
    %1891 = func.call @cc_make_string(%1889, %1890) : (!llvm.ptr, i64) -> i64
    %1892 = func.call @cc_nil_value() : () -> i64
    %1893 = func.call @cc_intern(%1891, %1892) : (i64, i64) -> i64
    %1894 = func.call @cc_nil_value() : () -> i64
    %1895 = func.call @cc_cons(%1893, %1894) : (i64, i64) -> i64
    %1896 = func.call @cc_values_pack(%1895) : (i64) -> i64
    %1897 = func.call @cc_set_symbol_value(%1893, %1888) : (i64, i64) -> i64
    %1898 = llvm.mlir.addressof @str199 : !llvm.ptr
    %1899 = arith.constant 38 : i64
    %1900 = func.call @cc_make_string(%1898, %1899) : (!llvm.ptr, i64) -> i64
    %1901 = func.call @cc_nil_value() : () -> i64
    %1902 = func.call @cc_intern(%1900, %1901) : (i64, i64) -> i64
    %1903 = func.call @cc_nil_value() : () -> i64
    %1904 = func.call @cc_cons(%1902, %1903) : (i64, i64) -> i64
    %1905 = func.call @cc_values_pack(%1904) : (i64) -> i64
    %1906 = func.call @cc_set_symbol_value(%1902, %1888) : (i64, i64) -> i64
    %1907 = llvm.mlir.addressof @str200 : !llvm.ptr
    %1908 = arith.constant 39 : i64
    %1909 = func.call @cc_make_string(%1907, %1908) : (!llvm.ptr, i64) -> i64
    %1910 = func.call @cc_nil_value() : () -> i64
    %1911 = func.call @cc_intern(%1909, %1910) : (i64, i64) -> i64
    %1912 = func.call @cc_nil_value() : () -> i64
    %1913 = func.call @cc_cons(%1911, %1912) : (i64, i64) -> i64
    %1914 = func.call @cc_values_pack(%1913) : (i64) -> i64
    %1915 = func.call @cc_set_symbol_value(%1911, %1888) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1859) : (i64) -> ()
    %1916 = llvm.mlir.addressof @str201 : !llvm.ptr
    %1917 = arith.constant 19 : i64
    %1918 = func.call @cc_make_string(%1916, %1917) : (!llvm.ptr, i64) -> i64
    %1919 = llvm.mlir.addressof @str202 : !llvm.ptr
    %1920 = arith.constant 11 : i64
    %1921 = func.call @cc_make_string(%1919, %1920) : (!llvm.ptr, i64) -> i64
    %1922 = func.call @cc_intern(%1918, %1921) : (i64, i64) -> i64
    %1923 = func.call @cc_nil_value() : () -> i64
    %1924 = func.call @cc_cons(%1922, %1923) : (i64, i64) -> i64
    %1925 = func.call @cc_values_pack(%1924) : (i64) -> i64
    %1926 = func.call @cc_symbol_value(%1922) : (i64) -> i64
    func.call @stack_push_pointer(%1926) : (i64) -> ()
    %1927 = func.call @stack_pop_pointer() : () -> i64
    %1928 = func.call @stack_pop_pointer() : () -> i64
    %1929 = func.call @cc_member(%1928, %1927) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1929) : (i64) -> ()
    %1930 = func.call @stack_pop_pointer() : () -> i64
    %1931 = func.call @cc_nil_value() : () -> i64
    %1932 = arith.cmpi ne, %1930, %1931 : i64
    scf.if %1932 {
      func.call @stack_push_pointer(%1859) : (i64) -> ()
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = llvm.mlir.addressof @str203 : !llvm.ptr
      %1935 = arith.constant 25 : i64
      %1936 = func.call @cc_make_string(%1934, %1935) : (!llvm.ptr, i64) -> i64
      %1937 = llvm.mlir.addressof @str204 : !llvm.ptr
      %1938 = arith.constant 11 : i64
      %1939 = func.call @cc_make_string(%1937, %1938) : (!llvm.ptr, i64) -> i64
      %1940 = func.call @cc_intern(%1936, %1939) : (i64, i64) -> i64
      %1941 = func.call @cc_nil_value() : () -> i64
      %1942 = func.call @cc_cons(%1940, %1941) : (i64, i64) -> i64
      %1943 = func.call @cc_values_pack(%1942) : (i64) -> i64
      %1944 = func.call @cc_symbol_value(%1940) : (i64) -> i64
      %1945 = func.call @cc_cons(%1933, %1944) : (i64, i64) -> i64
      %1946 = llvm.mlir.addressof @str205 : !llvm.ptr
      %1947 = arith.constant 25 : i64
      %1948 = func.call @cc_make_string(%1946, %1947) : (!llvm.ptr, i64) -> i64
      %1949 = llvm.mlir.addressof @str206 : !llvm.ptr
      %1950 = arith.constant 11 : i64
      %1951 = func.call @cc_make_string(%1949, %1950) : (!llvm.ptr, i64) -> i64
      %1952 = func.call @cc_intern(%1948, %1951) : (i64, i64) -> i64
      %1953 = func.call @cc_nil_value() : () -> i64
      %1954 = func.call @cc_cons(%1952, %1953) : (i64, i64) -> i64
      %1955 = func.call @cc_values_pack(%1954) : (i64) -> i64
      %1956 = func.call @cc_set_symbol_value(%1952, %1945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1945) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1859) : (i64) -> ()
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = llvm.mlir.addressof @str207 : !llvm.ptr
      %1959 = arith.constant 23 : i64
      %1960 = func.call @cc_make_string(%1958, %1959) : (!llvm.ptr, i64) -> i64
      %1961 = llvm.mlir.addressof @str208 : !llvm.ptr
      %1962 = arith.constant 11 : i64
      %1963 = func.call @cc_make_string(%1961, %1962) : (!llvm.ptr, i64) -> i64
      %1964 = func.call @cc_intern(%1960, %1963) : (i64, i64) -> i64
      %1965 = func.call @cc_nil_value() : () -> i64
      %1966 = func.call @cc_cons(%1964, %1965) : (i64, i64) -> i64
      %1967 = func.call @cc_values_pack(%1966) : (i64) -> i64
      %1968 = func.call @cc_symbol_value(%1964) : (i64) -> i64
      %1969 = func.call @cc_cons(%1957, %1968) : (i64, i64) -> i64
      %1970 = llvm.mlir.addressof @str209 : !llvm.ptr
      %1971 = arith.constant 23 : i64
      %1972 = func.call @cc_make_string(%1970, %1971) : (!llvm.ptr, i64) -> i64
      %1973 = llvm.mlir.addressof @str210 : !llvm.ptr
      %1974 = arith.constant 11 : i64
      %1975 = func.call @cc_make_string(%1973, %1974) : (!llvm.ptr, i64) -> i64
      %1976 = func.call @cc_intern(%1972, %1975) : (i64, i64) -> i64
      %1977 = func.call @cc_nil_value() : () -> i64
      %1978 = func.call @cc_cons(%1976, %1977) : (i64, i64) -> i64
      %1979 = func.call @cc_values_pack(%1978) : (i64) -> i64
      %1980 = func.call @cc_set_symbol_value(%1976, %1969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1969) : (i64) -> ()
    }
    %1981 = func.call @stack_pop_pointer() : () -> i64
    %1982 = llvm.mlir.addressof @str211 : !llvm.ptr
    %1983 = arith.constant 4 : i64
    %1984 = func.call @cc_make_string(%1982, %1983) : (!llvm.ptr, i64) -> i64
    %1985 = llvm.mlir.addressof @str212 : !llvm.ptr
    %1986 = arith.constant 7 : i64
    %1987 = func.call @cc_make_string(%1985, %1986) : (!llvm.ptr, i64) -> i64
    %1988 = func.call @cc_intern(%1984, %1987) : (i64, i64) -> i64
    %1989 = func.call @cc_nil_value() : () -> i64
    %1990 = func.call @cc_cons(%1988, %1989) : (i64, i64) -> i64
    %1991 = func.call @cc_values_pack(%1990) : (i64) -> i64
    func.call @stack_push_pointer(%1988) : (i64) -> ()
    %1992 = func.call @stack_pop_pointer() : () -> i64
    %1993 = llvm.mlir.addressof @str213 : !llvm.ptr
    %1994 = arith.constant 9 : i64
    %1995 = func.call @cc_make_string(%1993, %1994) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1995) : (i64) -> ()
    %1996 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1859) : (i64) -> ()
    %1997 = func.call @stack_pop_pointer() : () -> i64
    %1998 = func.call @cc_nil_value() : () -> i64
    %1999 = func.call @cc_errorp(%1992) : (i64) -> i64
    %2000 = arith.cmpi ne, %1999, %1998 : i64
    %2001 = arith.cmpi eq, %1998, %1998 : i64
    %2002 = arith.andi %2000, %2001 : i1
    %2003 = scf.if %2002 -> (i64) {
      scf.yield %1992 : i64
    } else {
      scf.yield %1998 : i64
    }
    %2004 = func.call @cc_errorp(%1996) : (i64) -> i64
    %2005 = arith.cmpi ne, %2004, %1998 : i64
    %2006 = arith.cmpi eq, %2003, %1998 : i64
    %2007 = arith.andi %2005, %2006 : i1
    %2008 = scf.if %2007 -> (i64) {
      scf.yield %1996 : i64
    } else {
      scf.yield %2003 : i64
    }
    %2009 = func.call @cc_errorp(%1997) : (i64) -> i64
    %2010 = arith.cmpi ne, %2009, %1998 : i64
    %2011 = arith.cmpi eq, %2008, %1998 : i64
    %2012 = arith.andi %2010, %2011 : i1
    %2013 = scf.if %2012 -> (i64) {
      scf.yield %1997 : i64
    } else {
      scf.yield %2008 : i64
    }
    %2014 = arith.cmpi ne, %2013, %1998 : i64
    scf.if %2014 {
      func.call @stack_push_pointer(%2013) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1992) : (i64) -> ()
      func.call @stack_push_pointer(%1996) : (i64) -> ()
      func.call @stack_push_pointer(%1997) : (i64) -> ()
      %2015 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2016 = func.call @cc_make_function_ref_const(%2015) : (!llvm.ptr) -> i64
      %2017 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%2016, %2017) : (i64, i64) -> ()
    }
    %2018 = func.call @stack_pop_pointer() : () -> i64
    %2019 = func.call @cc_multiple_value_list(%2018) : (i64) -> i64
    %2020 = llvm.mlir.addressof @str215 : !llvm.ptr
    %2021 = arith.constant 37 : i64
    %2022 = func.call @cc_make_string(%2020, %2021) : (!llvm.ptr, i64) -> i64
    %2023 = func.call @cc_nil_value() : () -> i64
    %2024 = func.call @cc_intern(%2022, %2023) : (i64, i64) -> i64
    %2025 = func.call @cc_nil_value() : () -> i64
    %2026 = func.call @cc_cons(%2024, %2025) : (i64, i64) -> i64
    %2027 = func.call @cc_values_pack(%2026) : (i64) -> i64
    %2028 = func.call @cc_symbol_value(%2024) : (i64) -> i64
    %2029 = llvm.mlir.addressof @str216 : !llvm.ptr
    %2030 = arith.constant 38 : i64
    %2031 = func.call @cc_make_string(%2029, %2030) : (!llvm.ptr, i64) -> i64
    %2032 = func.call @cc_nil_value() : () -> i64
    %2033 = func.call @cc_intern(%2031, %2032) : (i64, i64) -> i64
    %2034 = func.call @cc_nil_value() : () -> i64
    %2035 = func.call @cc_cons(%2033, %2034) : (i64, i64) -> i64
    %2036 = func.call @cc_values_pack(%2035) : (i64) -> i64
    %2037 = func.call @cc_symbol_value(%2033) : (i64) -> i64
    %2038 = llvm.mlir.addressof @str217 : !llvm.ptr
    %2039 = arith.constant 39 : i64
    %2040 = func.call @cc_make_string(%2038, %2039) : (!llvm.ptr, i64) -> i64
    %2041 = func.call @cc_nil_value() : () -> i64
    %2042 = func.call @cc_intern(%2040, %2041) : (i64, i64) -> i64
    %2043 = func.call @cc_nil_value() : () -> i64
    %2044 = func.call @cc_cons(%2042, %2043) : (i64, i64) -> i64
    %2045 = func.call @cc_values_pack(%2044) : (i64) -> i64
    %2046 = func.call @cc_symbol_value(%2042) : (i64) -> i64
    %2047 = func.call @cc_nil_value() : () -> i64
    %2048 = arith.cmpi ne, %2028, %2047 : i64
    %2049 = scf.if %2048 -> (i64) {
      scf.yield %2046 : i64
    } else {
      scf.yield %2019 : i64
    }
    %2050 = func.call @cc_values_pack(%2049) : (i64) -> i64
    func.call @stack_push_pointer(%2050) : (i64) -> ()
    %2051 = func.call @stack_pop_pointer() : () -> i64
    %2052 = func.call @cc_multiple_value_list(%2051) : (i64) -> i64
    %2053 = llvm.mlir.addressof @str218 : !llvm.ptr
    %2054 = arith.constant 37 : i64
    %2055 = func.call @cc_make_string(%2053, %2054) : (!llvm.ptr, i64) -> i64
    %2056 = func.call @cc_nil_value() : () -> i64
    %2057 = func.call @cc_intern(%2055, %2056) : (i64, i64) -> i64
    %2058 = func.call @cc_nil_value() : () -> i64
    %2059 = func.call @cc_cons(%2057, %2058) : (i64, i64) -> i64
    %2060 = func.call @cc_values_pack(%2059) : (i64) -> i64
    %2061 = func.call @cc_symbol_value(%2057) : (i64) -> i64
    %2062 = llvm.mlir.addressof @str219 : !llvm.ptr
    %2063 = arith.constant 39 : i64
    %2064 = func.call @cc_make_string(%2062, %2063) : (!llvm.ptr, i64) -> i64
    %2065 = func.call @cc_nil_value() : () -> i64
    %2066 = func.call @cc_intern(%2064, %2065) : (i64, i64) -> i64
    %2067 = func.call @cc_nil_value() : () -> i64
    %2068 = func.call @cc_cons(%2066, %2067) : (i64, i64) -> i64
    %2069 = func.call @cc_values_pack(%2068) : (i64) -> i64
    %2070 = func.call @cc_symbol_value(%2066) : (i64) -> i64
    %2071 = func.call @cc_nil_value() : () -> i64
    %2072 = arith.cmpi ne, %2061, %2071 : i64
    %2073 = scf.if %2072 -> (i64) {
      scf.yield %2070 : i64
    } else {
      scf.yield %2052 : i64
    }
    %2074 = func.call @cc_values_pack(%2073) : (i64) -> i64
    func.call @stack_push_pointer(%2074) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%test"() {
    %2075 = llvm.mlir.addressof @str220 : !llvm.ptr
    %2076 = arith.constant 5 : i64
    %2077 = func.call @cc_make_string(%2075, %2076) : (!llvm.ptr, i64) -> i64
    %2078 = func.call @cc_nil_value() : () -> i64
    %2079 = func.call @cc_intern(%2077, %2078) : (i64, i64) -> i64
    %2080 = func.call @cc_nil_value() : () -> i64
    %2081 = func.call @cc_cons(%2079, %2080) : (i64, i64) -> i64
    %2082 = func.call @cc_values_pack(%2081) : (i64) -> i64
    %2083 = llvm.mlir.addressof @str221 : !llvm.ptr
    %2084 = arith.constant 41 : i64
    %2085 = func.call @cc_make_string(%2083, %2084) : (!llvm.ptr, i64) -> i64
    %2086 = func.call @cc_register_function_lambda_list_metadata_raw(%2079, %2085) : (i64, i64) -> i64
    %2087 = arith.constant 6 : i64
    func.call @cc_runtime_debug_stack_push_call(%2079, %2087) : (i64, i64) -> ()
    %2088 = func.call @stack_pop_pointer() : () -> i64
    %2089 = arith.constant 0 : i64
    %2090 = func.call @cc_arg(%2088, %2089) : (i64, i64) -> i64
    %2091 = arith.constant 4 : i64
    %2092 = func.call @cc_arg(%2088, %2091) : (i64, i64) -> i64
    %2093 = arith.constant 8 : i64
    %2094 = func.call @cc_arg(%2088, %2093) : (i64, i64) -> i64
    %2095 = arith.constant 12 : i64
    %2096 = func.call @cc_arg(%2088, %2095) : (i64, i64) -> i64
    %2097 = llvm.mlir.addressof @str222 : !llvm.ptr
    %2098 = arith.constant 11 : i64
    %2099 = func.call @cc_make_string(%2097, %2098) : (!llvm.ptr, i64) -> i64
    %2100 = func.call @cc_nil_value() : () -> i64
    %2101 = func.call @cc_intern(%2099, %2100) : (i64, i64) -> i64
    %2102 = func.call @cc_nil_value() : () -> i64
    %2103 = func.call @cc_cons(%2101, %2102) : (i64, i64) -> i64
    %2104 = func.call @cc_values_pack(%2103) : (i64) -> i64
    %2105 = func.call @cc_arg(%2088, %2101) : (i64, i64) -> i64
    %2106 = func.call @cc_arg_present(%2088, %2101) : (i64, i64) -> i64
    %2107 = func.call @cc_nil_value() : () -> i64
    %2108 = arith.cmpi ne, %2106, %2107 : i64
    %2109 = scf.if %2108 -> (i64) {
      scf.yield %2105 : i64
    } else {
      scf.yield %2107 : i64
    }
    %2110 = llvm.mlir.addressof @str223 : !llvm.ptr
    %2111 = arith.constant 4 : i64
    %2112 = func.call @cc_make_string(%2110, %2111) : (!llvm.ptr, i64) -> i64
    %2113 = func.call @cc_nil_value() : () -> i64
    %2114 = func.call @cc_intern(%2112, %2113) : (i64, i64) -> i64
    %2115 = func.call @cc_nil_value() : () -> i64
    %2116 = func.call @cc_cons(%2114, %2115) : (i64, i64) -> i64
    %2117 = func.call @cc_values_pack(%2116) : (i64) -> i64
    %2118 = func.call @cc_arg(%2088, %2114) : (i64, i64) -> i64
    %2119 = func.call @cc_arg_present(%2088, %2114) : (i64, i64) -> i64
    %2120 = func.call @cc_nil_value() : () -> i64
    %2121 = arith.cmpi ne, %2119, %2120 : i64
    %2122 = scf.if %2121 -> (i64) {
      scf.yield %2118 : i64
    } else {
      %2123 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2124 = arith.constant 6 : i64
      %2125 = func.call @cc_make_string(%2123, %2124) : (!llvm.ptr, i64) -> i64
      %2126 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2127 = arith.constant 11 : i64
      %2128 = func.call @cc_make_string(%2126, %2127) : (!llvm.ptr, i64) -> i64
      %2129 = func.call @cc_intern(%2125, %2128) : (i64, i64) -> i64
      %2130 = func.call @cc_nil_value() : () -> i64
      %2131 = func.call @cc_cons(%2129, %2130) : (i64, i64) -> i64
      %2132 = func.call @cc_values_pack(%2131) : (i64) -> i64
      func.call @stack_push_pointer(%2129) : (i64) -> ()
      %2133 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2133 : i64
    }
    %2134 = func.call @cc_nil_value() : () -> i64
    %2135 = llvm.mlir.addressof @str226 : !llvm.ptr
    %2136 = arith.constant 37 : i64
    %2137 = func.call @cc_make_string(%2135, %2136) : (!llvm.ptr, i64) -> i64
    %2138 = func.call @cc_nil_value() : () -> i64
    %2139 = func.call @cc_intern(%2137, %2138) : (i64, i64) -> i64
    %2140 = func.call @cc_nil_value() : () -> i64
    %2141 = func.call @cc_cons(%2139, %2140) : (i64, i64) -> i64
    %2142 = func.call @cc_values_pack(%2141) : (i64) -> i64
    %2143 = func.call @cc_set_symbol_value(%2139, %2134) : (i64, i64) -> i64
    %2144 = llvm.mlir.addressof @str227 : !llvm.ptr
    %2145 = arith.constant 38 : i64
    %2146 = func.call @cc_make_string(%2144, %2145) : (!llvm.ptr, i64) -> i64
    %2147 = func.call @cc_nil_value() : () -> i64
    %2148 = func.call @cc_intern(%2146, %2147) : (i64, i64) -> i64
    %2149 = func.call @cc_nil_value() : () -> i64
    %2150 = func.call @cc_cons(%2148, %2149) : (i64, i64) -> i64
    %2151 = func.call @cc_values_pack(%2150) : (i64) -> i64
    %2152 = func.call @cc_set_symbol_value(%2148, %2134) : (i64, i64) -> i64
    %2153 = llvm.mlir.addressof @str228 : !llvm.ptr
    %2154 = arith.constant 39 : i64
    %2155 = func.call @cc_make_string(%2153, %2154) : (!llvm.ptr, i64) -> i64
    %2156 = func.call @cc_nil_value() : () -> i64
    %2157 = func.call @cc_intern(%2155, %2156) : (i64, i64) -> i64
    %2158 = func.call @cc_nil_value() : () -> i64
    %2159 = func.call @cc_cons(%2157, %2158) : (i64, i64) -> i64
    %2160 = func.call @cc_values_pack(%2159) : (i64) -> i64
    %2161 = func.call @cc_set_symbol_value(%2157, %2134) : (i64, i64) -> i64
    %2162 = func.call @cc_nil_value() : () -> i64
    %2163 = llvm.mlir.addressof @str229 : !llvm.ptr
    %2164 = arith.constant 37 : i64
    %2165 = func.call @cc_make_string(%2163, %2164) : (!llvm.ptr, i64) -> i64
    %2166 = func.call @cc_nil_value() : () -> i64
    %2167 = func.call @cc_intern(%2165, %2166) : (i64, i64) -> i64
    %2168 = func.call @cc_nil_value() : () -> i64
    %2169 = func.call @cc_cons(%2167, %2168) : (i64, i64) -> i64
    %2170 = func.call @cc_values_pack(%2169) : (i64) -> i64
    %2171 = func.call @cc_set_symbol_value(%2167, %2162) : (i64, i64) -> i64
    %2172 = llvm.mlir.addressof @str230 : !llvm.ptr
    %2173 = arith.constant 38 : i64
    %2174 = func.call @cc_make_string(%2172, %2173) : (!llvm.ptr, i64) -> i64
    %2175 = func.call @cc_nil_value() : () -> i64
    %2176 = func.call @cc_intern(%2174, %2175) : (i64, i64) -> i64
    %2177 = func.call @cc_nil_value() : () -> i64
    %2178 = func.call @cc_cons(%2176, %2177) : (i64, i64) -> i64
    %2179 = func.call @cc_values_pack(%2178) : (i64) -> i64
    %2180 = func.call @cc_set_symbol_value(%2176, %2162) : (i64, i64) -> i64
    %2181 = llvm.mlir.addressof @str231 : !llvm.ptr
    %2182 = arith.constant 39 : i64
    %2183 = func.call @cc_make_string(%2181, %2182) : (!llvm.ptr, i64) -> i64
    %2184 = func.call @cc_nil_value() : () -> i64
    %2185 = func.call @cc_intern(%2183, %2184) : (i64, i64) -> i64
    %2186 = func.call @cc_nil_value() : () -> i64
    %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
    %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
    %2189 = func.call @cc_set_symbol_value(%2185, %2162) : (i64, i64) -> i64
    func.call @stack_push_pointer(%2090) : (i64) -> ()
    %2190 = func.call @stack_pop_pointer() : () -> i64
    %2191 = func.call @cc_nil_value() : () -> i64
    %2192 = func.call @cc_errorp(%2190) : (i64) -> i64
    %2193 = arith.cmpi ne, %2192, %2191 : i64
    %2194 = arith.cmpi eq, %2191, %2191 : i64
    %2195 = arith.andi %2193, %2194 : i1
    %2196 = scf.if %2195 -> (i64) {
      scf.yield %2190 : i64
    } else {
      scf.yield %2191 : i64
    }
    %2197 = arith.cmpi ne, %2196, %2191 : i64
    scf.if %2197 {
      func.call @stack_push_pointer(%2196) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%2190) : (i64) -> ()
      %2198 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2199 = func.call @cc_make_function_ref_const(%2198) : (!llvm.ptr) -> i64
      %2200 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%2199, %2200) : (i64, i64) -> ()
    }
    %2201 = func.call @stack_pop_pointer() : () -> i64
    %2202 = func.call @cc_push_ignore_errors_trap() : () -> i64
    func.call @cc_clear_multiple_values() : () -> ()
    %2203 = func.call @cc_nil_value() : () -> i64
    %2204 = func.call @cc_nil_value() : () -> i64
    %2205 = func.call @cc_errorp(%2203) : (i64) -> i64
    %2206 = arith.cmpi ne, %2205, %2204 : i64
    %2207 = scf.if %2206 -> (i64) {
      scf.yield %2203 : i64
    } else {
      func.call @cc_clear_multiple_values() : () -> ()
      func.call @stack_push_pointer(%2094) : (i64) -> ()
      %2208 = func.call @stack_pop_pointer() : () -> i64
      %2209 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%2208, %2209) : (i64, i64) -> ()
      %2210 = func.call @stack_pop_pointer() : () -> i64
      %2211 = func.call @cc_errorp(%2210) : (i64) -> i64
      %2212 = func.call @cc_nil_value() : () -> i64
      %2213 = arith.cmpi ne, %2211, %2212 : i64
      scf.if %2213 {
        func.call @stack_push_pointer(%2210) : (i64) -> ()
      } else {
        %2214 = func.call @cc_multiple_value_list(%2210) : (i64) -> i64
        func.call @stack_push_pointer(%2214) : (i64) -> ()
      }
      %2215 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2216 = func.call @stack_pop_pointer() : () -> i64
      %2217 = func.call @cc_nil_value() : () -> i64
      %2218 = func.call @cc_maybe_error_from_multiple_value_list(%2215) : (i64) -> i64
      %2219 = func.call @cc_errorp(%2218) : (i64) -> i64
      %2220 = arith.cmpi ne, %2219, %2217 : i64
      %2221 = arith.cmpi eq, %2217, %2217 : i64
      %2222 = arith.andi %2220, %2221 : i1
      %2223 = scf.if %2222 -> (i64) {
        scf.yield %2218 : i64
      } else {
        scf.yield %2217 : i64
      }
      %2224 = arith.cmpi ne, %2223, %2217 : i64
      scf.if %2224 {
        func.call @stack_push_pointer(%2223) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
        %2225 = func.call @stack_pop_pointer() : () -> i64
        %2226 = func.call @cc_cons(%2216, %2225) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2226) : (i64) -> ()
        %2227 = func.call @stack_pop_pointer() : () -> i64
        %2228 = func.call @cc_cons(%2215, %2227) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2228) : (i64) -> ()
        %2229 = func.call @stack_pop_pointer() : () -> i64
        %2230 = func.call @cc_values_pack(%2229) : (i64) -> i64
        func.call @stack_push_pointer(%2230) : (i64) -> ()
      }
      %2231 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2231 : i64
    }
    func.call @stack_push_pointer(%2207) : (i64) -> ()
    %2232 = func.call @stack_pop_pointer() : () -> i64
    %2233 = func.call @cc_pop_ignore_errors_trap() : () -> i64
    %2234 = func.call @cc_errorp(%2232) : (i64) -> i64
    %2235 = func.call @cc_nil_value() : () -> i64
    %2236 = arith.cmpi ne, %2234, %2235 : i64
    scf.if %2236 {
      %2237 = func.call @cc_condition_value(%2232) : (i64) -> i64
      %2238 = func.call @cc_values2(%2235, %2237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2238) : (i64) -> ()
    } else {
      %2239 = func.call @cc_multiple_value_list(%2232) : (i64) -> i64
      %2240 = func.call @cc_values_pack(%2239) : (i64) -> i64
      func.call @stack_push_pointer(%2240) : (i64) -> ()
    }
    %2241 = func.call @stack_pop_pointer() : () -> i64
    %2242 = func.call @cc_multiple_value_list(%2241) : (i64) -> i64
    %2243 = arith.constant 0 : i64
    %2244 = func.call @cc_box_fixnum(%2243) : (i64) -> i64
    %2245 = func.call @cc_nth(%2244, %2242) : (i64, i64) -> i64
    %2246 = arith.constant 1 : i64
    %2247 = func.call @cc_box_fixnum(%2246) : (i64) -> i64
    %2248 = func.call @cc_nth(%2247, %2242) : (i64, i64) -> i64
    func.call @stack_push_pointer(%2248) : (i64) -> ()
    %2249 = func.call @stack_pop_pointer() : () -> i64
    %2250 = func.call @cc_nil_value() : () -> i64
    %2251 = arith.cmpi ne, %2249, %2250 : i64
    scf.if %2251 {
      func.call @stack_push_pointer(%2090) : (i64) -> ()
      %2252 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2092) : (i64) -> ()
      %2253 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2254 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2248) : (i64) -> ()
      %2255 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2109) : (i64) -> ()
      %2256 = func.call @stack_pop_pointer() : () -> i64
      %2257 = func.call @cc_nil_value() : () -> i64
      %2258 = func.call @cc_errorp(%2252) : (i64) -> i64
      %2259 = arith.cmpi ne, %2258, %2257 : i64
      %2260 = arith.cmpi eq, %2257, %2257 : i64
      %2261 = arith.andi %2259, %2260 : i1
      %2262 = scf.if %2261 -> (i64) {
        scf.yield %2252 : i64
      } else {
        scf.yield %2257 : i64
      }
      %2263 = func.call @cc_errorp(%2253) : (i64) -> i64
      %2264 = arith.cmpi ne, %2263, %2257 : i64
      %2265 = arith.cmpi eq, %2262, %2257 : i64
      %2266 = arith.andi %2264, %2265 : i1
      %2267 = scf.if %2266 -> (i64) {
        scf.yield %2253 : i64
      } else {
        scf.yield %2262 : i64
      }
      %2268 = func.call @cc_errorp(%2254) : (i64) -> i64
      %2269 = arith.cmpi ne, %2268, %2257 : i64
      %2270 = arith.cmpi eq, %2267, %2257 : i64
      %2271 = arith.andi %2269, %2270 : i1
      %2272 = scf.if %2271 -> (i64) {
        scf.yield %2254 : i64
      } else {
        scf.yield %2267 : i64
      }
      %2273 = func.call @cc_errorp(%2255) : (i64) -> i64
      %2274 = arith.cmpi ne, %2273, %2257 : i64
      %2275 = arith.cmpi eq, %2272, %2257 : i64
      %2276 = arith.andi %2274, %2275 : i1
      %2277 = scf.if %2276 -> (i64) {
        scf.yield %2255 : i64
      } else {
        scf.yield %2272 : i64
      }
      %2278 = func.call @cc_errorp(%2256) : (i64) -> i64
      %2279 = arith.cmpi ne, %2278, %2257 : i64
      %2280 = arith.cmpi eq, %2277, %2257 : i64
      %2281 = arith.andi %2279, %2280 : i1
      %2282 = scf.if %2281 -> (i64) {
        scf.yield %2256 : i64
      } else {
        scf.yield %2277 : i64
      }
      %2283 = arith.cmpi ne, %2282, %2257 : i64
      scf.if %2283 {
        func.call @stack_push_pointer(%2282) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2252) : (i64) -> ()
        func.call @stack_push_pointer(%2253) : (i64) -> ()
        func.call @stack_push_pointer(%2254) : (i64) -> ()
        func.call @stack_push_pointer(%2255) : (i64) -> ()
        func.call @stack_push_pointer(%2256) : (i64) -> ()
        %2284 = llvm.mlir.addressof @str233 : !llvm.ptr
        %2285 = func.call @cc_make_function_ref_const(%2284) : (!llvm.ptr) -> i64
        %2286 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2285, %2286) : (i64, i64) -> ()
      }
    } else {
      %2287 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2288 = func.call @stack_pop_pointer() : () -> i64
      %2289 = func.call @cc_length(%2288) : (i64) -> i64
      func.call @stack_push_pointer(%2289) : (i64) -> ()
      %2290 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2245) : (i64) -> ()
      %2291 = func.call @stack_pop_pointer() : () -> i64
      %2292 = func.call @cc_length(%2291) : (i64) -> i64
      func.call @stack_push_pointer(%2292) : (i64) -> ()
      %2293 = func.call @stack_pop_pointer() : () -> i64
      %2294 = arith.constant 1 : i1
      %2296 = arith.constant 3 : i64
      %2295 = arith.andi %2290, %2296 : i64
      %2297 = arith.constant 0 : i64
      %2298 = arith.cmpi eq, %2295, %2297 : i64
      %2300 = arith.constant 3 : i64
      %2299 = arith.andi %2293, %2300 : i64
      %2301 = arith.constant 0 : i64
      %2302 = arith.cmpi eq, %2299, %2301 : i64
      %2303 = arith.andi %2298, %2302 : i1
      %2304 = scf.if %2303 -> (i1) {
        %2305 = arith.constant 2 : i64
        %2306 = arith.shrsi %2290, %2305 : i64
        %2307 = arith.constant 2 : i64
        %2308 = arith.shrsi %2293, %2307 : i64
        %2309 = arith.cmpi eq, %2306, %2308 : i64
        scf.yield %2309 : i1
      } else {
        %2310 = func.call @cc_eq(%2290, %2293) : (i64, i64) -> i64
        %2311 = func.call @cc_nil_value() : () -> i64
        %2312 = arith.cmpi ne, %2310, %2311 : i64
        scf.yield %2312 : i1
      }
      %2313 = arith.andi %2294, %2304 : i1
      %2314 = func.call @cc_nil_value() : () -> i64
      %2315 = func.call @cc_t_value() : () -> i64
      %2316 = scf.if %2313 -> (i64) {
        scf.yield %2315 : i64
      } else {
        scf.yield %2314 : i64
      }
      func.call @stack_push_pointer(%2316) : (i64) -> ()
      %2317 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2122) : (i64) -> ()
      func.call @stack_push_pointer(%2245) : (i64) -> ()
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2318 = func.call @stack_pop_pointer() : () -> i64
      %2319 = func.call @stack_pop_pointer() : () -> i64
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @cc_every2(%2320, %2319, %2318) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%2321) : (i64) -> ()
      %2322 = func.call @stack_pop_pointer() : () -> i64
      %2323 = func.call @cc_cons(%2322, %2287) : (i64, i64) -> i64
      %2324 = func.call @cc_cons(%2317, %2323) : (i64, i64) -> i64
      %2325 = func.call @cc_and(%2324) : (i64) -> i64
      func.call @stack_push_pointer(%2325) : (i64) -> ()
      %2326 = func.call @stack_pop_pointer() : () -> i64
      %2327 = func.call @cc_nil_value() : () -> i64
      %2328 = arith.cmpi ne, %2326, %2327 : i64
      scf.if %2328 {
        func.call @stack_push_pointer(%2090) : (i64) -> ()
        %2329 = func.call @stack_pop_pointer() : () -> i64
        %2330 = func.call @cc_nil_value() : () -> i64
        %2331 = func.call @cc_errorp(%2329) : (i64) -> i64
        %2332 = arith.cmpi ne, %2331, %2330 : i64
        %2333 = arith.cmpi eq, %2330, %2330 : i64
        %2334 = arith.andi %2332, %2333 : i1
        %2335 = scf.if %2334 -> (i64) {
          scf.yield %2329 : i64
        } else {
          scf.yield %2330 : i64
        }
        %2336 = arith.cmpi ne, %2335, %2330 : i64
        scf.if %2336 {
          func.call @stack_push_pointer(%2335) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2329) : (i64) -> ()
          %2337 = llvm.mlir.addressof @str234 : !llvm.ptr
          %2338 = func.call @cc_make_function_ref_const(%2337) : (!llvm.ptr) -> i64
          %2339 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2338, %2339) : (i64, i64) -> ()
        }
      } else {
        %2340 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%2340) : (i64) -> ()
        %2341 = func.call @stack_pop_pointer() : () -> i64
        %2342 = func.call @cc_nil_value() : () -> i64
        %2343 = arith.cmpi ne, %2341, %2342 : i64
        scf.if %2343 {
          func.call @stack_push_pointer(%2090) : (i64) -> ()
          %2344 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2092) : (i64) -> ()
          %2345 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2096) : (i64) -> ()
          %2346 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2245) : (i64) -> ()
          %2347 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2109) : (i64) -> ()
          %2348 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2122) : (i64) -> ()
          %2349 = func.call @stack_pop_pointer() : () -> i64
          %2350 = func.call @cc_nil_value() : () -> i64
          %2351 = func.call @cc_errorp(%2344) : (i64) -> i64
          %2352 = arith.cmpi ne, %2351, %2350 : i64
          %2353 = arith.cmpi eq, %2350, %2350 : i64
          %2354 = arith.andi %2352, %2353 : i1
          %2355 = scf.if %2354 -> (i64) {
            scf.yield %2344 : i64
          } else {
            scf.yield %2350 : i64
          }
          %2356 = func.call @cc_errorp(%2345) : (i64) -> i64
          %2357 = arith.cmpi ne, %2356, %2350 : i64
          %2358 = arith.cmpi eq, %2355, %2350 : i64
          %2359 = arith.andi %2357, %2358 : i1
          %2360 = scf.if %2359 -> (i64) {
            scf.yield %2345 : i64
          } else {
            scf.yield %2355 : i64
          }
          %2361 = func.call @cc_errorp(%2346) : (i64) -> i64
          %2362 = arith.cmpi ne, %2361, %2350 : i64
          %2363 = arith.cmpi eq, %2360, %2350 : i64
          %2364 = arith.andi %2362, %2363 : i1
          %2365 = scf.if %2364 -> (i64) {
            scf.yield %2346 : i64
          } else {
            scf.yield %2360 : i64
          }
          %2366 = func.call @cc_errorp(%2347) : (i64) -> i64
          %2367 = arith.cmpi ne, %2366, %2350 : i64
          %2368 = arith.cmpi eq, %2365, %2350 : i64
          %2369 = arith.andi %2367, %2368 : i1
          %2370 = scf.if %2369 -> (i64) {
            scf.yield %2347 : i64
          } else {
            scf.yield %2365 : i64
          }
          %2371 = func.call @cc_errorp(%2348) : (i64) -> i64
          %2372 = arith.cmpi ne, %2371, %2350 : i64
          %2373 = arith.cmpi eq, %2370, %2350 : i64
          %2374 = arith.andi %2372, %2373 : i1
          %2375 = scf.if %2374 -> (i64) {
            scf.yield %2348 : i64
          } else {
            scf.yield %2370 : i64
          }
          %2376 = func.call @cc_errorp(%2349) : (i64) -> i64
          %2377 = arith.cmpi ne, %2376, %2350 : i64
          %2378 = arith.cmpi eq, %2375, %2350 : i64
          %2379 = arith.andi %2377, %2378 : i1
          %2380 = scf.if %2379 -> (i64) {
            scf.yield %2349 : i64
          } else {
            scf.yield %2375 : i64
          }
          %2381 = arith.cmpi ne, %2380, %2350 : i64
          scf.if %2381 {
            func.call @stack_push_pointer(%2380) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2344) : (i64) -> ()
            func.call @stack_push_pointer(%2345) : (i64) -> ()
            func.call @stack_push_pointer(%2346) : (i64) -> ()
            func.call @stack_push_pointer(%2347) : (i64) -> ()
            func.call @stack_push_pointer(%2348) : (i64) -> ()
            func.call @stack_push_pointer(%2349) : (i64) -> ()
            %2382 = llvm.mlir.addressof @str235 : !llvm.ptr
            %2383 = func.call @cc_make_function_ref_const(%2382) : (!llvm.ptr) -> i64
            %2384 = arith.constant 6 : i64
            func.call @cc_funcall_stack(%2383, %2384) : (i64, i64) -> ()
          }
      }
    }
    }
    %2385 = func.call @stack_pop_pointer() : () -> i64
    %2386 = func.call @cc_multiple_value_list(%2385) : (i64) -> i64
    %2387 = llvm.mlir.addressof @str236 : !llvm.ptr
    %2388 = arith.constant 37 : i64
    %2389 = func.call @cc_make_string(%2387, %2388) : (!llvm.ptr, i64) -> i64
    %2390 = func.call @cc_nil_value() : () -> i64
    %2391 = func.call @cc_intern(%2389, %2390) : (i64, i64) -> i64
    %2392 = func.call @cc_nil_value() : () -> i64
    %2393 = func.call @cc_cons(%2391, %2392) : (i64, i64) -> i64
    %2394 = func.call @cc_values_pack(%2393) : (i64) -> i64
    %2395 = func.call @cc_symbol_value(%2391) : (i64) -> i64
    %2396 = llvm.mlir.addressof @str237 : !llvm.ptr
    %2397 = arith.constant 38 : i64
    %2398 = func.call @cc_make_string(%2396, %2397) : (!llvm.ptr, i64) -> i64
    %2399 = func.call @cc_nil_value() : () -> i64
    %2400 = func.call @cc_intern(%2398, %2399) : (i64, i64) -> i64
    %2401 = func.call @cc_nil_value() : () -> i64
    %2402 = func.call @cc_cons(%2400, %2401) : (i64, i64) -> i64
    %2403 = func.call @cc_values_pack(%2402) : (i64) -> i64
    %2404 = func.call @cc_symbol_value(%2400) : (i64) -> i64
    %2405 = llvm.mlir.addressof @str238 : !llvm.ptr
    %2406 = arith.constant 39 : i64
    %2407 = func.call @cc_make_string(%2405, %2406) : (!llvm.ptr, i64) -> i64
    %2408 = func.call @cc_nil_value() : () -> i64
    %2409 = func.call @cc_intern(%2407, %2408) : (i64, i64) -> i64
    %2410 = func.call @cc_nil_value() : () -> i64
    %2411 = func.call @cc_cons(%2409, %2410) : (i64, i64) -> i64
    %2412 = func.call @cc_values_pack(%2411) : (i64) -> i64
    %2413 = func.call @cc_symbol_value(%2409) : (i64) -> i64
    %2414 = func.call @cc_nil_value() : () -> i64
    %2415 = arith.cmpi ne, %2395, %2414 : i64
    %2416 = scf.if %2415 -> (i64) {
      scf.yield %2413 : i64
    } else {
      scf.yield %2386 : i64
    }
    %2417 = func.call @cc_values_pack(%2416) : (i64) -> i64
    func.call @stack_push_pointer(%2417) : (i64) -> ()
    %2418 = func.call @stack_pop_pointer() : () -> i64
    %2419 = func.call @cc_multiple_value_list(%2418) : (i64) -> i64
    %2420 = llvm.mlir.addressof @str239 : !llvm.ptr
    %2421 = arith.constant 37 : i64
    %2422 = func.call @cc_make_string(%2420, %2421) : (!llvm.ptr, i64) -> i64
    %2423 = func.call @cc_nil_value() : () -> i64
    %2424 = func.call @cc_intern(%2422, %2423) : (i64, i64) -> i64
    %2425 = func.call @cc_nil_value() : () -> i64
    %2426 = func.call @cc_cons(%2424, %2425) : (i64, i64) -> i64
    %2427 = func.call @cc_values_pack(%2426) : (i64) -> i64
    %2428 = func.call @cc_symbol_value(%2424) : (i64) -> i64
    %2429 = llvm.mlir.addressof @str240 : !llvm.ptr
    %2430 = arith.constant 39 : i64
    %2431 = func.call @cc_make_string(%2429, %2430) : (!llvm.ptr, i64) -> i64
    %2432 = func.call @cc_nil_value() : () -> i64
    %2433 = func.call @cc_intern(%2431, %2432) : (i64, i64) -> i64
    %2434 = func.call @cc_nil_value() : () -> i64
    %2435 = func.call @cc_cons(%2433, %2434) : (i64, i64) -> i64
    %2436 = func.call @cc_values_pack(%2435) : (i64) -> i64
    %2437 = func.call @cc_symbol_value(%2433) : (i64) -> i64
    %2438 = func.call @cc_nil_value() : () -> i64
    %2439 = arith.cmpi ne, %2428, %2438 : i64
    %2440 = scf.if %2439 -> (i64) {
      scf.yield %2437 : i64
    } else {
      scf.yield %2419 : i64
    }
    %2441 = func.call @cc_values_pack(%2440) : (i64) -> i64
    func.call @stack_push_pointer(%2441) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%load-if-compiled-correctly"() {
    %2442 = llvm.mlir.addressof @str241 : !llvm.ptr
    %2443 = arith.constant 26 : i64
    %2444 = func.call @cc_make_string(%2442, %2443) : (!llvm.ptr, i64) -> i64
    %2445 = func.call @cc_nil_value() : () -> i64
    %2446 = func.call @cc_intern(%2444, %2445) : (i64, i64) -> i64
    %2447 = func.call @cc_nil_value() : () -> i64
    %2448 = func.call @cc_cons(%2446, %2447) : (i64, i64) -> i64
    %2449 = func.call @cc_values_pack(%2448) : (i64) -> i64
    %2450 = llvm.mlir.addressof @str242 : !llvm.ptr
    %2451 = arith.constant 4 : i64
    %2452 = func.call @cc_make_string(%2450, %2451) : (!llvm.ptr, i64) -> i64
    %2453 = func.call @cc_register_function_lambda_list_metadata_raw(%2446, %2452) : (i64, i64) -> i64
    %2454 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%2446, %2454) : (i64, i64) -> ()
    %2455 = func.call @stack_pop_pointer() : () -> i64
    %2456 = func.call @cc_nil_value() : () -> i64
    %2457 = llvm.mlir.addressof @str243 : !llvm.ptr
    %2458 = arith.constant 37 : i64
    %2459 = func.call @cc_make_string(%2457, %2458) : (!llvm.ptr, i64) -> i64
    %2460 = func.call @cc_nil_value() : () -> i64
    %2461 = func.call @cc_intern(%2459, %2460) : (i64, i64) -> i64
    %2462 = func.call @cc_nil_value() : () -> i64
    %2463 = func.call @cc_cons(%2461, %2462) : (i64, i64) -> i64
    %2464 = func.call @cc_values_pack(%2463) : (i64) -> i64
    %2465 = func.call @cc_set_symbol_value(%2461, %2456) : (i64, i64) -> i64
    %2466 = llvm.mlir.addressof @str244 : !llvm.ptr
    %2467 = arith.constant 38 : i64
    %2468 = func.call @cc_make_string(%2466, %2467) : (!llvm.ptr, i64) -> i64
    %2469 = func.call @cc_nil_value() : () -> i64
    %2470 = func.call @cc_intern(%2468, %2469) : (i64, i64) -> i64
    %2471 = func.call @cc_nil_value() : () -> i64
    %2472 = func.call @cc_cons(%2470, %2471) : (i64, i64) -> i64
    %2473 = func.call @cc_values_pack(%2472) : (i64) -> i64
    %2474 = func.call @cc_set_symbol_value(%2470, %2456) : (i64, i64) -> i64
    %2475 = llvm.mlir.addressof @str245 : !llvm.ptr
    %2476 = arith.constant 39 : i64
    %2477 = func.call @cc_make_string(%2475, %2476) : (!llvm.ptr, i64) -> i64
    %2478 = func.call @cc_nil_value() : () -> i64
    %2479 = func.call @cc_intern(%2477, %2478) : (i64, i64) -> i64
    %2480 = func.call @cc_nil_value() : () -> i64
    %2481 = func.call @cc_cons(%2479, %2480) : (i64, i64) -> i64
    %2482 = func.call @cc_values_pack(%2481) : (i64) -> i64
    %2483 = func.call @cc_set_symbol_value(%2479, %2456) : (i64, i64) -> i64
    %2484 = func.call @cc_nil_value() : () -> i64
    %2485 = llvm.mlir.addressof @str246 : !llvm.ptr
    %2486 = arith.constant 37 : i64
    %2487 = func.call @cc_make_string(%2485, %2486) : (!llvm.ptr, i64) -> i64
    %2488 = func.call @cc_nil_value() : () -> i64
    %2489 = func.call @cc_intern(%2487, %2488) : (i64, i64) -> i64
    %2490 = func.call @cc_nil_value() : () -> i64
    %2491 = func.call @cc_cons(%2489, %2490) : (i64, i64) -> i64
    %2492 = func.call @cc_values_pack(%2491) : (i64) -> i64
    %2493 = func.call @cc_set_symbol_value(%2489, %2484) : (i64, i64) -> i64
    %2494 = llvm.mlir.addressof @str247 : !llvm.ptr
    %2495 = arith.constant 38 : i64
    %2496 = func.call @cc_make_string(%2494, %2495) : (!llvm.ptr, i64) -> i64
    %2497 = func.call @cc_nil_value() : () -> i64
    %2498 = func.call @cc_intern(%2496, %2497) : (i64, i64) -> i64
    %2499 = func.call @cc_nil_value() : () -> i64
    %2500 = func.call @cc_cons(%2498, %2499) : (i64, i64) -> i64
    %2501 = func.call @cc_values_pack(%2500) : (i64) -> i64
    %2502 = func.call @cc_set_symbol_value(%2498, %2484) : (i64, i64) -> i64
    %2503 = llvm.mlir.addressof @str248 : !llvm.ptr
    %2504 = arith.constant 39 : i64
    %2505 = func.call @cc_make_string(%2503, %2504) : (!llvm.ptr, i64) -> i64
    %2506 = func.call @cc_nil_value() : () -> i64
    %2507 = func.call @cc_intern(%2505, %2506) : (i64, i64) -> i64
    %2508 = func.call @cc_nil_value() : () -> i64
    %2509 = func.call @cc_cons(%2507, %2508) : (i64, i64) -> i64
    %2510 = func.call @cc_values_pack(%2509) : (i64) -> i64
    %2511 = func.call @cc_set_symbol_value(%2507, %2484) : (i64, i64) -> i64
    %2512 = func.call @cc_nil_value() : () -> i64
    %2513 = func.call @cc_nil_value() : () -> i64
    %2514 = func.call @cc_errorp(%2512) : (i64) -> i64
    %2515 = arith.cmpi ne, %2514, %2513 : i64
    %2516 = scf.if %2515 -> (i64) {
      scf.yield %2512 : i64
    } else {
      %2517 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2517) : (i64) -> ()
      %2518 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2519 = arith.constant 4 : i64
      %2520 = func.call @cc_make_string(%2518, %2519) : (!llvm.ptr, i64) -> i64
      %2521 = func.call @cc_nil_value() : () -> i64
      %2522 = func.call @cc_intern(%2520, %2521) : (i64, i64) -> i64
      %2523 = func.call @cc_nil_value() : () -> i64
      %2524 = func.call @cc_cons(%2522, %2523) : (i64, i64) -> i64
      %2525 = func.call @cc_values_pack(%2524) : (i64) -> i64
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      %2526 = func.call @stack_pop_pointer() : () -> i64
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @cc_cons(%2526, %2527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2528) : (i64) -> ()
      %2529 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2530 = arith.constant 12 : i64
      %2531 = func.call @cc_make_string(%2529, %2530) : (!llvm.ptr, i64) -> i64
      %2532 = func.call @cc_nil_value() : () -> i64
      %2533 = func.call @cc_intern(%2531, %2532) : (i64, i64) -> i64
      %2534 = func.call @cc_nil_value() : () -> i64
      %2535 = func.call @cc_cons(%2533, %2534) : (i64, i64) -> i64
      %2536 = func.call @cc_values_pack(%2535) : (i64) -> i64
      func.call @stack_push_pointer(%2533) : (i64) -> ()
      %2537 = func.call @stack_pop_pointer() : () -> i64
      %2538 = func.call @stack_pop_pointer() : () -> i64
      %2539 = func.call @cc_cons(%2537, %2538) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2539) : (i64) -> ()
      %2540 = func.call @stack_pop_pointer() : () -> i64
      %2541 = func.call @cc_nil_value() : () -> i64
      %2542 = func.call @cc_cons(%2540, %2541) : (i64, i64) -> i64
      %2543 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2544 = arith.constant 4 : i64
      %2545 = func.call @cc_make_string(%2543, %2544) : (!llvm.ptr, i64) -> i64
      %2546 = func.call @cc_nil_value() : () -> i64
      %2547 = func.call @cc_intern(%2545, %2546) : (i64, i64) -> i64
      %2548 = func.call @cc_nil_value() : () -> i64
      %2549 = func.call @cc_cons(%2547, %2548) : (i64, i64) -> i64
      %2550 = func.call @cc_values_pack(%2549) : (i64) -> i64
      %2551 = func.call @cc_symbol_value(%2547) : (i64) -> i64
      %2552 = func.call @cc_set_symbol_value(%2547, %2455) : (i64, i64) -> i64
      %2553 = func.call @cc_eval(%2542) : (i64) -> i64
      %2554 = func.call @cc_multiple_value_list(%2553) : (i64) -> i64
      %2555 = func.call @cc_symbol_value(%2547) : (i64) -> i64
      %2556 = func.call @cc_set_symbol_value(%2547, %2551) : (i64, i64) -> i64
      %2557 = func.call @cc_values_pack(%2554) : (i64) -> i64
      func.call @stack_push_pointer(%2557) : (i64) -> ()
      %2558 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2558 : i64
    }
    func.call @stack_push_pointer(%2516) : (i64) -> ()
    %2559 = func.call @stack_pop_pointer() : () -> i64
    %2560 = func.call @cc_multiple_value_list(%2559) : (i64) -> i64
    %2561 = arith.constant 0 : i64
    %2562 = func.call @cc_box_fixnum(%2561) : (i64) -> i64
    %2563 = func.call @cc_nth(%2562, %2560) : (i64, i64) -> i64
    %2564 = arith.constant 1 : i64
    %2565 = func.call @cc_box_fixnum(%2564) : (i64) -> i64
    %2566 = func.call @cc_nth(%2565, %2560) : (i64, i64) -> i64
    %2567 = arith.constant 2 : i64
    %2568 = func.call @cc_box_fixnum(%2567) : (i64) -> i64
    %2569 = func.call @cc_nth(%2568, %2560) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %2570 = func.call @stack_depth() : () -> i64
    %2571 = arith.constant 0 : i64
    %2572 = arith.cmpi sgt, %2570, %2571 : i64
    scf.if %2572 {
      %2573 = func.call @stack_pop_pointer() : () -> i64
    }
    func.call @stack_push_pointer(%2563) : (i64) -> ()
    %2574 = func.call @stack_pop_pointer() : () -> i64
    %2575 = func.call @cc_nil_value() : () -> i64
    %2576 = arith.cmpi ne, %2574, %2575 : i64
    scf.if %2576 {
      %2577 = func.call @cc_nil_value() : () -> i64
      %2578 = func.call @cc_nil_value() : () -> i64
      %2579 = func.call @cc_errorp(%2577) : (i64) -> i64
      %2580 = arith.cmpi ne, %2579, %2578 : i64
      %2581 = scf.if %2580 -> (i64) {
        scf.yield %2577 : i64
      } else {
        func.call @stack_push_pointer(%2563) : (i64) -> ()
        %2582 = func.call @stack_pop_pointer() : () -> i64
        %2583 = func.call @cc_nil_value() : () -> i64
        %2584 = func.call @cc_cons(%2582, %2583) : (i64, i64) -> i64
        %2585 = func.call @cc_load_stack(%2584) : (i64) -> i64
        func.call @stack_push_pointer(%2585) : (i64) -> ()
        %2586 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2586 : i64
      }
      func.call @stack_push_pointer(%2581) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2587 = func.call @stack_pop_pointer() : () -> i64
    %2588 = func.call @cc_errorp(%2587) : (i64) -> i64
    %2589 = func.call @cc_nil_value() : () -> i64
    %2590 = arith.cmpi ne, %2588, %2589 : i64
    %2591 = scf.if %2590 -> (i64) {
      %2592 = func.call @cc_condition_value(%2587) : (i64) -> i64
      %2593 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2594 = arith.constant 5 : i64
      %2595 = func.call @cc_make_string(%2593, %2594) : (!llvm.ptr, i64) -> i64
      %2596 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2597 = arith.constant 11 : i64
      %2598 = func.call @cc_make_string(%2596, %2597) : (!llvm.ptr, i64) -> i64
      %2599 = func.call @cc_intern(%2595, %2598) : (i64, i64) -> i64
      %2600 = func.call @cc_nil_value() : () -> i64
      %2601 = func.call @cc_cons(%2599, %2600) : (i64, i64) -> i64
      %2602 = func.call @cc_values_pack(%2601) : (i64) -> i64
      func.call @stack_push_pointer(%2599) : (i64) -> ()
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @cc_typep(%2592, %2603) : (i64, i64) -> i64
      %2605 = func.call @cc_nil_value() : () -> i64
      %2606 = arith.cmpi ne, %2604, %2605 : i64
      %2607 = scf.if %2606 -> (i64) {
        func.call @stack_push_pointer(%2455) : (i64) -> ()
        %2608 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2592) : (i64) -> ()
        %2609 = func.call @stack_pop_pointer() : () -> i64
        %2610 = func.call @cc_nil_value() : () -> i64
        %2611 = func.call @cc_errorp(%2608) : (i64) -> i64
        %2612 = arith.cmpi ne, %2611, %2610 : i64
        %2613 = arith.cmpi eq, %2610, %2610 : i64
        %2614 = arith.andi %2612, %2613 : i1
        %2615 = scf.if %2614 -> (i64) {
          scf.yield %2608 : i64
        } else {
          scf.yield %2610 : i64
        }
        %2616 = func.call @cc_errorp(%2609) : (i64) -> i64
        %2617 = arith.cmpi ne, %2616, %2610 : i64
        %2618 = arith.cmpi eq, %2615, %2610 : i64
        %2619 = arith.andi %2617, %2618 : i1
        %2620 = scf.if %2619 -> (i64) {
          scf.yield %2609 : i64
        } else {
          scf.yield %2615 : i64
        }
        %2621 = arith.cmpi ne, %2620, %2610 : i64
        scf.if %2621 {
          func.call @stack_push_pointer(%2620) : (i64) -> ()
        } else {
          %2622 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%2622) : (i64) -> ()
          func.call @stack_push_pointer(%2609) : (i64) -> ()
          %2623 = func.call @stack_pop_pointer() : () -> i64
          %2624 = func.call @stack_pop_pointer() : () -> i64
          %2625 = func.call @cc_cons(%2623, %2624) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2625) : (i64) -> ()
          func.call @stack_push_pointer(%2608) : (i64) -> ()
          %2626 = func.call @stack_pop_pointer() : () -> i64
          %2627 = func.call @stack_pop_pointer() : () -> i64
          %2628 = func.call @cc_cons(%2626, %2627) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2628) : (i64) -> ()
        }
        %2629 = func.call @stack_pop_pointer() : () -> i64
        %2630 = func.call @cc_nil_value() : () -> i64
        %2631 = func.call @cc_errorp(%2629) : (i64) -> i64
        %2632 = arith.cmpi ne, %2631, %2630 : i64
        %2633 = arith.cmpi eq, %2630, %2630 : i64
        %2634 = arith.andi %2632, %2633 : i1
        %2635 = scf.if %2634 -> (i64) {
          scf.yield %2629 : i64
        } else {
          scf.yield %2630 : i64
        }
        %2636 = arith.cmpi ne, %2635, %2630 : i64
        scf.if %2636 {
          func.call @stack_push_pointer(%2635) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2629) : (i64) -> ()
          %2637 = llvm.mlir.addressof @str254 : !llvm.ptr
          %2638 = func.call @cc_make_function_ref_const(%2637) : (!llvm.ptr) -> i64
          %2639 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2638, %2639) : (i64, i64) -> ()
        }
        %2640 = func.call @stack_depth() : () -> i64
        %2641 = arith.constant 0 : i64
        %2642 = arith.cmpi sgt, %2640, %2641 : i64
        scf.if %2642 {
          %2643 = func.call @stack_pop_pointer() : () -> i64
        }
        %2644 = llvm.mlir.addressof @str255 : !llvm.ptr
        %2645 = arith.constant 3 : i64
        %2646 = func.call @cc_make_string(%2644, %2645) : (!llvm.ptr, i64) -> i64
        %2647 = llvm.mlir.addressof @str256 : !llvm.ptr
        %2648 = arith.constant 7 : i64
        %2649 = func.call @cc_make_string(%2647, %2648) : (!llvm.ptr, i64) -> i64
        %2650 = func.call @cc_intern(%2646, %2649) : (i64, i64) -> i64
        %2651 = func.call @cc_nil_value() : () -> i64
        %2652 = func.call @cc_cons(%2650, %2651) : (i64, i64) -> i64
        %2653 = func.call @cc_values_pack(%2652) : (i64) -> i64
        func.call @stack_push_pointer(%2650) : (i64) -> ()
        %2654 = func.call @stack_pop_pointer() : () -> i64
        %2655 = llvm.mlir.addressof @str257 : !llvm.ptr
        %2656 = arith.constant 45 : i64
        %2657 = func.call @cc_make_string(%2655, %2656) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2657) : (i64) -> ()
        %2658 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2455) : (i64) -> ()
        %2659 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2592) : (i64) -> ()
        %2660 = func.call @stack_pop_pointer() : () -> i64
        %2661 = func.call @cc_nil_value() : () -> i64
        %2662 = func.call @cc_errorp(%2654) : (i64) -> i64
        %2663 = arith.cmpi ne, %2662, %2661 : i64
        %2664 = arith.cmpi eq, %2661, %2661 : i64
        %2665 = arith.andi %2663, %2664 : i1
        %2666 = scf.if %2665 -> (i64) {
          scf.yield %2654 : i64
        } else {
          scf.yield %2661 : i64
        }
        %2667 = func.call @cc_errorp(%2658) : (i64) -> i64
        %2668 = arith.cmpi ne, %2667, %2661 : i64
        %2669 = arith.cmpi eq, %2666, %2661 : i64
        %2670 = arith.andi %2668, %2669 : i1
        %2671 = scf.if %2670 -> (i64) {
          scf.yield %2658 : i64
        } else {
          scf.yield %2666 : i64
        }
        %2672 = func.call @cc_errorp(%2659) : (i64) -> i64
        %2673 = arith.cmpi ne, %2672, %2661 : i64
        %2674 = arith.cmpi eq, %2671, %2661 : i64
        %2675 = arith.andi %2673, %2674 : i1
        %2676 = scf.if %2675 -> (i64) {
          scf.yield %2659 : i64
        } else {
          scf.yield %2671 : i64
        }
        %2677 = func.call @cc_errorp(%2660) : (i64) -> i64
        %2678 = arith.cmpi ne, %2677, %2661 : i64
        %2679 = arith.cmpi eq, %2676, %2661 : i64
        %2680 = arith.andi %2678, %2679 : i1
        %2681 = scf.if %2680 -> (i64) {
          scf.yield %2660 : i64
        } else {
          scf.yield %2676 : i64
        }
        %2682 = arith.cmpi ne, %2681, %2661 : i64
        scf.if %2682 {
          func.call @stack_push_pointer(%2681) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2654) : (i64) -> ()
          func.call @stack_push_pointer(%2658) : (i64) -> ()
          func.call @stack_push_pointer(%2659) : (i64) -> ()
          func.call @stack_push_pointer(%2660) : (i64) -> ()
          %2683 = llvm.mlir.addressof @str258 : !llvm.ptr
          %2684 = func.call @cc_make_function_ref_const(%2683) : (!llvm.ptr) -> i64
          %2685 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%2684, %2685) : (i64, i64) -> ()
        }
        %2686 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2686 : i64
      } else {
        scf.yield %2587 : i64
      }
      scf.yield %2607 : i64
    } else {
      scf.yield %2587 : i64
    }
    func.call @stack_push_pointer(%2591) : (i64) -> ()
    %2687 = func.call @stack_pop_pointer() : () -> i64
    %2688 = func.call @cc_multiple_value_list(%2687) : (i64) -> i64
    %2689 = llvm.mlir.addressof @str259 : !llvm.ptr
    %2690 = arith.constant 37 : i64
    %2691 = func.call @cc_make_string(%2689, %2690) : (!llvm.ptr, i64) -> i64
    %2692 = func.call @cc_nil_value() : () -> i64
    %2693 = func.call @cc_intern(%2691, %2692) : (i64, i64) -> i64
    %2694 = func.call @cc_nil_value() : () -> i64
    %2695 = func.call @cc_cons(%2693, %2694) : (i64, i64) -> i64
    %2696 = func.call @cc_values_pack(%2695) : (i64) -> i64
    %2697 = func.call @cc_symbol_value(%2693) : (i64) -> i64
    %2698 = llvm.mlir.addressof @str260 : !llvm.ptr
    %2699 = arith.constant 38 : i64
    %2700 = func.call @cc_make_string(%2698, %2699) : (!llvm.ptr, i64) -> i64
    %2701 = func.call @cc_nil_value() : () -> i64
    %2702 = func.call @cc_intern(%2700, %2701) : (i64, i64) -> i64
    %2703 = func.call @cc_nil_value() : () -> i64
    %2704 = func.call @cc_cons(%2702, %2703) : (i64, i64) -> i64
    %2705 = func.call @cc_values_pack(%2704) : (i64) -> i64
    %2706 = func.call @cc_symbol_value(%2702) : (i64) -> i64
    %2707 = llvm.mlir.addressof @str261 : !llvm.ptr
    %2708 = arith.constant 39 : i64
    %2709 = func.call @cc_make_string(%2707, %2708) : (!llvm.ptr, i64) -> i64
    %2710 = func.call @cc_nil_value() : () -> i64
    %2711 = func.call @cc_intern(%2709, %2710) : (i64, i64) -> i64
    %2712 = func.call @cc_nil_value() : () -> i64
    %2713 = func.call @cc_cons(%2711, %2712) : (i64, i64) -> i64
    %2714 = func.call @cc_values_pack(%2713) : (i64) -> i64
    %2715 = func.call @cc_symbol_value(%2711) : (i64) -> i64
    %2716 = func.call @cc_nil_value() : () -> i64
    %2717 = arith.cmpi ne, %2697, %2716 : i64
    %2718 = scf.if %2717 -> (i64) {
      scf.yield %2715 : i64
    } else {
      scf.yield %2688 : i64
    }
    %2719 = func.call @cc_values_pack(%2718) : (i64) -> i64
    func.call @stack_push_pointer(%2719) : (i64) -> ()
    %2720 = func.call @stack_pop_pointer() : () -> i64
    %2721 = func.call @cc_multiple_value_list(%2720) : (i64) -> i64
    %2722 = llvm.mlir.addressof @str262 : !llvm.ptr
    %2723 = arith.constant 37 : i64
    %2724 = func.call @cc_make_string(%2722, %2723) : (!llvm.ptr, i64) -> i64
    %2725 = func.call @cc_nil_value() : () -> i64
    %2726 = func.call @cc_intern(%2724, %2725) : (i64, i64) -> i64
    %2727 = func.call @cc_nil_value() : () -> i64
    %2728 = func.call @cc_cons(%2726, %2727) : (i64, i64) -> i64
    %2729 = func.call @cc_values_pack(%2728) : (i64) -> i64
    %2730 = func.call @cc_symbol_value(%2726) : (i64) -> i64
    %2731 = llvm.mlir.addressof @str263 : !llvm.ptr
    %2732 = arith.constant 39 : i64
    %2733 = func.call @cc_make_string(%2731, %2732) : (!llvm.ptr, i64) -> i64
    %2734 = func.call @cc_nil_value() : () -> i64
    %2735 = func.call @cc_intern(%2733, %2734) : (i64, i64) -> i64
    %2736 = func.call @cc_nil_value() : () -> i64
    %2737 = func.call @cc_cons(%2735, %2736) : (i64, i64) -> i64
    %2738 = func.call @cc_values_pack(%2737) : (i64) -> i64
    %2739 = func.call @cc_symbol_value(%2735) : (i64) -> i64
    %2740 = func.call @cc_nil_value() : () -> i64
    %2741 = arith.cmpi ne, %2730, %2740 : i64
    %2742 = scf.if %2741 -> (i64) {
      scf.yield %2739 : i64
    } else {
      scf.yield %2721 : i64
    }
    %2743 = func.call @cc_values_pack(%2742) : (i64) -> i64
    func.call @stack_push_pointer(%2743) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%no-handler-case-load-if-compiled-correctly"() {
    %2744 = llvm.mlir.addressof @str264 : !llvm.ptr
    %2745 = arith.constant 42 : i64
    %2746 = func.call @cc_make_string(%2744, %2745) : (!llvm.ptr, i64) -> i64
    %2747 = func.call @cc_nil_value() : () -> i64
    %2748 = func.call @cc_intern(%2746, %2747) : (i64, i64) -> i64
    %2749 = func.call @cc_nil_value() : () -> i64
    %2750 = func.call @cc_cons(%2748, %2749) : (i64, i64) -> i64
    %2751 = func.call @cc_values_pack(%2750) : (i64) -> i64
    %2752 = llvm.mlir.addressof @str265 : !llvm.ptr
    %2753 = arith.constant 4 : i64
    %2754 = func.call @cc_make_string(%2752, %2753) : (!llvm.ptr, i64) -> i64
    %2755 = func.call @cc_register_function_lambda_list_metadata_raw(%2748, %2754) : (i64, i64) -> i64
    %2756 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%2748, %2756) : (i64, i64) -> ()
    %2757 = func.call @stack_pop_pointer() : () -> i64
    %2758 = func.call @cc_nil_value() : () -> i64
    %2759 = llvm.mlir.addressof @str266 : !llvm.ptr
    %2760 = arith.constant 37 : i64
    %2761 = func.call @cc_make_string(%2759, %2760) : (!llvm.ptr, i64) -> i64
    %2762 = func.call @cc_nil_value() : () -> i64
    %2763 = func.call @cc_intern(%2761, %2762) : (i64, i64) -> i64
    %2764 = func.call @cc_nil_value() : () -> i64
    %2765 = func.call @cc_cons(%2763, %2764) : (i64, i64) -> i64
    %2766 = func.call @cc_values_pack(%2765) : (i64) -> i64
    %2767 = func.call @cc_set_symbol_value(%2763, %2758) : (i64, i64) -> i64
    %2768 = llvm.mlir.addressof @str267 : !llvm.ptr
    %2769 = arith.constant 38 : i64
    %2770 = func.call @cc_make_string(%2768, %2769) : (!llvm.ptr, i64) -> i64
    %2771 = func.call @cc_nil_value() : () -> i64
    %2772 = func.call @cc_intern(%2770, %2771) : (i64, i64) -> i64
    %2773 = func.call @cc_nil_value() : () -> i64
    %2774 = func.call @cc_cons(%2772, %2773) : (i64, i64) -> i64
    %2775 = func.call @cc_values_pack(%2774) : (i64) -> i64
    %2776 = func.call @cc_set_symbol_value(%2772, %2758) : (i64, i64) -> i64
    %2777 = llvm.mlir.addressof @str268 : !llvm.ptr
    %2778 = arith.constant 39 : i64
    %2779 = func.call @cc_make_string(%2777, %2778) : (!llvm.ptr, i64) -> i64
    %2780 = func.call @cc_nil_value() : () -> i64
    %2781 = func.call @cc_intern(%2779, %2780) : (i64, i64) -> i64
    %2782 = func.call @cc_nil_value() : () -> i64
    %2783 = func.call @cc_cons(%2781, %2782) : (i64, i64) -> i64
    %2784 = func.call @cc_values_pack(%2783) : (i64) -> i64
    %2785 = func.call @cc_set_symbol_value(%2781, %2758) : (i64, i64) -> i64
    %2786 = func.call @cc_nil_value() : () -> i64
    %2787 = llvm.mlir.addressof @str269 : !llvm.ptr
    %2788 = arith.constant 37 : i64
    %2789 = func.call @cc_make_string(%2787, %2788) : (!llvm.ptr, i64) -> i64
    %2790 = func.call @cc_nil_value() : () -> i64
    %2791 = func.call @cc_intern(%2789, %2790) : (i64, i64) -> i64
    %2792 = func.call @cc_nil_value() : () -> i64
    %2793 = func.call @cc_cons(%2791, %2792) : (i64, i64) -> i64
    %2794 = func.call @cc_values_pack(%2793) : (i64) -> i64
    %2795 = func.call @cc_set_symbol_value(%2791, %2786) : (i64, i64) -> i64
    %2796 = llvm.mlir.addressof @str270 : !llvm.ptr
    %2797 = arith.constant 38 : i64
    %2798 = func.call @cc_make_string(%2796, %2797) : (!llvm.ptr, i64) -> i64
    %2799 = func.call @cc_nil_value() : () -> i64
    %2800 = func.call @cc_intern(%2798, %2799) : (i64, i64) -> i64
    %2801 = func.call @cc_nil_value() : () -> i64
    %2802 = func.call @cc_cons(%2800, %2801) : (i64, i64) -> i64
    %2803 = func.call @cc_values_pack(%2802) : (i64) -> i64
    %2804 = func.call @cc_set_symbol_value(%2800, %2786) : (i64, i64) -> i64
    %2805 = llvm.mlir.addressof @str271 : !llvm.ptr
    %2806 = arith.constant 39 : i64
    %2807 = func.call @cc_make_string(%2805, %2806) : (!llvm.ptr, i64) -> i64
    %2808 = func.call @cc_nil_value() : () -> i64
    %2809 = func.call @cc_intern(%2807, %2808) : (i64, i64) -> i64
    %2810 = func.call @cc_nil_value() : () -> i64
    %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
    %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
    %2813 = func.call @cc_set_symbol_value(%2809, %2786) : (i64, i64) -> i64
    %2814 = func.call @cc_nil_value() : () -> i64
    %2815 = func.call @cc_nil_value() : () -> i64
    %2816 = func.call @cc_errorp(%2814) : (i64) -> i64
    %2817 = arith.cmpi ne, %2816, %2815 : i64
    %2818 = scf.if %2817 -> (i64) {
      scf.yield %2814 : i64
    } else {
      %2819 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2819) : (i64) -> ()
      %2820 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2821 = arith.constant 4 : i64
      %2822 = func.call @cc_make_string(%2820, %2821) : (!llvm.ptr, i64) -> i64
      %2823 = func.call @cc_nil_value() : () -> i64
      %2824 = func.call @cc_intern(%2822, %2823) : (i64, i64) -> i64
      %2825 = func.call @cc_nil_value() : () -> i64
      %2826 = func.call @cc_cons(%2824, %2825) : (i64, i64) -> i64
      %2827 = func.call @cc_values_pack(%2826) : (i64) -> i64
      func.call @stack_push_pointer(%2824) : (i64) -> ()
      %2828 = func.call @stack_pop_pointer() : () -> i64
      %2829 = func.call @stack_pop_pointer() : () -> i64
      %2830 = func.call @cc_cons(%2828, %2829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2830) : (i64) -> ()
      %2831 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2832 = arith.constant 12 : i64
      %2833 = func.call @cc_make_string(%2831, %2832) : (!llvm.ptr, i64) -> i64
      %2834 = func.call @cc_nil_value() : () -> i64
      %2835 = func.call @cc_intern(%2833, %2834) : (i64, i64) -> i64
      %2836 = func.call @cc_nil_value() : () -> i64
      %2837 = func.call @cc_cons(%2835, %2836) : (i64, i64) -> i64
      %2838 = func.call @cc_values_pack(%2837) : (i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      %2839 = func.call @stack_pop_pointer() : () -> i64
      %2840 = func.call @stack_pop_pointer() : () -> i64
      %2841 = func.call @cc_cons(%2839, %2840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2841) : (i64) -> ()
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = func.call @cc_nil_value() : () -> i64
      %2844 = func.call @cc_cons(%2842, %2843) : (i64, i64) -> i64
      %2845 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2846 = arith.constant 4 : i64
      %2847 = func.call @cc_make_string(%2845, %2846) : (!llvm.ptr, i64) -> i64
      %2848 = func.call @cc_nil_value() : () -> i64
      %2849 = func.call @cc_intern(%2847, %2848) : (i64, i64) -> i64
      %2850 = func.call @cc_nil_value() : () -> i64
      %2851 = func.call @cc_cons(%2849, %2850) : (i64, i64) -> i64
      %2852 = func.call @cc_values_pack(%2851) : (i64) -> i64
      %2853 = func.call @cc_symbol_value(%2849) : (i64) -> i64
      %2854 = func.call @cc_set_symbol_value(%2849, %2757) : (i64, i64) -> i64
      %2855 = func.call @cc_eval(%2844) : (i64) -> i64
      %2856 = func.call @cc_multiple_value_list(%2855) : (i64) -> i64
      %2857 = func.call @cc_symbol_value(%2849) : (i64) -> i64
      %2858 = func.call @cc_set_symbol_value(%2849, %2853) : (i64, i64) -> i64
      %2859 = func.call @cc_values_pack(%2856) : (i64) -> i64
      func.call @stack_push_pointer(%2859) : (i64) -> ()
      %2860 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2860 : i64
    }
    func.call @stack_push_pointer(%2818) : (i64) -> ()
    %2861 = func.call @stack_pop_pointer() : () -> i64
    %2862 = func.call @cc_multiple_value_list(%2861) : (i64) -> i64
    %2863 = arith.constant 0 : i64
    %2864 = func.call @cc_box_fixnum(%2863) : (i64) -> i64
    %2865 = func.call @cc_nth(%2864, %2862) : (i64, i64) -> i64
    %2866 = arith.constant 1 : i64
    %2867 = func.call @cc_box_fixnum(%2866) : (i64) -> i64
    %2868 = func.call @cc_nth(%2867, %2862) : (i64, i64) -> i64
    %2869 = arith.constant 2 : i64
    %2870 = func.call @cc_box_fixnum(%2869) : (i64) -> i64
    %2871 = func.call @cc_nth(%2870, %2862) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %2872 = func.call @stack_depth() : () -> i64
    %2873 = arith.constant 0 : i64
    %2874 = arith.cmpi sgt, %2872, %2873 : i64
    scf.if %2874 {
      %2875 = func.call @stack_pop_pointer() : () -> i64
    }
    func.call @stack_push_pointer(%2865) : (i64) -> ()
    %2876 = func.call @stack_pop_pointer() : () -> i64
    %2877 = func.call @cc_nil_value() : () -> i64
    %2878 = arith.cmpi ne, %2876, %2877 : i64
    scf.if %2878 {
      %2879 = func.call @cc_nil_value() : () -> i64
      %2880 = func.call @cc_nil_value() : () -> i64
      %2881 = func.call @cc_errorp(%2879) : (i64) -> i64
      %2882 = arith.cmpi ne, %2881, %2880 : i64
      %2883 = scf.if %2882 -> (i64) {
        scf.yield %2879 : i64
      } else {
        func.call @stack_push_pointer(%2865) : (i64) -> ()
        %2884 = func.call @stack_pop_pointer() : () -> i64
        %2885 = func.call @cc_nil_value() : () -> i64
        %2886 = func.call @cc_cons(%2884, %2885) : (i64, i64) -> i64
        %2887 = func.call @cc_load_stack(%2886) : (i64) -> i64
        func.call @stack_push_pointer(%2887) : (i64) -> ()
        %2888 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2888 : i64
      }
      func.call @stack_push_pointer(%2883) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2889 = func.call @stack_pop_pointer() : () -> i64
    %2890 = func.call @cc_multiple_value_list(%2889) : (i64) -> i64
    %2891 = llvm.mlir.addressof @str275 : !llvm.ptr
    %2892 = arith.constant 37 : i64
    %2893 = func.call @cc_make_string(%2891, %2892) : (!llvm.ptr, i64) -> i64
    %2894 = func.call @cc_nil_value() : () -> i64
    %2895 = func.call @cc_intern(%2893, %2894) : (i64, i64) -> i64
    %2896 = func.call @cc_nil_value() : () -> i64
    %2897 = func.call @cc_cons(%2895, %2896) : (i64, i64) -> i64
    %2898 = func.call @cc_values_pack(%2897) : (i64) -> i64
    %2899 = func.call @cc_symbol_value(%2895) : (i64) -> i64
    %2900 = llvm.mlir.addressof @str276 : !llvm.ptr
    %2901 = arith.constant 38 : i64
    %2902 = func.call @cc_make_string(%2900, %2901) : (!llvm.ptr, i64) -> i64
    %2903 = func.call @cc_nil_value() : () -> i64
    %2904 = func.call @cc_intern(%2902, %2903) : (i64, i64) -> i64
    %2905 = func.call @cc_nil_value() : () -> i64
    %2906 = func.call @cc_cons(%2904, %2905) : (i64, i64) -> i64
    %2907 = func.call @cc_values_pack(%2906) : (i64) -> i64
    %2908 = func.call @cc_symbol_value(%2904) : (i64) -> i64
    %2909 = llvm.mlir.addressof @str277 : !llvm.ptr
    %2910 = arith.constant 39 : i64
    %2911 = func.call @cc_make_string(%2909, %2910) : (!llvm.ptr, i64) -> i64
    %2912 = func.call @cc_nil_value() : () -> i64
    %2913 = func.call @cc_intern(%2911, %2912) : (i64, i64) -> i64
    %2914 = func.call @cc_nil_value() : () -> i64
    %2915 = func.call @cc_cons(%2913, %2914) : (i64, i64) -> i64
    %2916 = func.call @cc_values_pack(%2915) : (i64) -> i64
    %2917 = func.call @cc_symbol_value(%2913) : (i64) -> i64
    %2918 = func.call @cc_nil_value() : () -> i64
    %2919 = arith.cmpi ne, %2899, %2918 : i64
    %2920 = scf.if %2919 -> (i64) {
      scf.yield %2917 : i64
    } else {
      scf.yield %2890 : i64
    }
    %2921 = func.call @cc_values_pack(%2920) : (i64) -> i64
    func.call @stack_push_pointer(%2921) : (i64) -> ()
    %2922 = func.call @stack_pop_pointer() : () -> i64
    %2923 = func.call @cc_multiple_value_list(%2922) : (i64) -> i64
    %2924 = llvm.mlir.addressof @str278 : !llvm.ptr
    %2925 = arith.constant 37 : i64
    %2926 = func.call @cc_make_string(%2924, %2925) : (!llvm.ptr, i64) -> i64
    %2927 = func.call @cc_nil_value() : () -> i64
    %2928 = func.call @cc_intern(%2926, %2927) : (i64, i64) -> i64
    %2929 = func.call @cc_nil_value() : () -> i64
    %2930 = func.call @cc_cons(%2928, %2929) : (i64, i64) -> i64
    %2931 = func.call @cc_values_pack(%2930) : (i64) -> i64
    %2932 = func.call @cc_symbol_value(%2928) : (i64) -> i64
    %2933 = llvm.mlir.addressof @str279 : !llvm.ptr
    %2934 = arith.constant 39 : i64
    %2935 = func.call @cc_make_string(%2933, %2934) : (!llvm.ptr, i64) -> i64
    %2936 = func.call @cc_nil_value() : () -> i64
    %2937 = func.call @cc_intern(%2935, %2936) : (i64, i64) -> i64
    %2938 = func.call @cc_nil_value() : () -> i64
    %2939 = func.call @cc_cons(%2937, %2938) : (i64, i64) -> i64
    %2940 = func.call @cc_values_pack(%2939) : (i64) -> i64
    %2941 = func.call @cc_symbol_value(%2937) : (i64) -> i64
    %2942 = func.call @cc_nil_value() : () -> i64
    %2943 = arith.cmpi ne, %2932, %2942 : i64
    %2944 = scf.if %2943 -> (i64) {
      scf.yield %2941 : i64
    } else {
      scf.yield %2923 : i64
    }
    %2945 = func.call @cc_values_pack(%2944) : (i64) -> i64
    func.call @stack_push_pointer(%2945) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %2946 = llvm.mlir.addressof @str280 : !llvm.ptr
    %2947 = arith.constant 6 : i64
    %2948 = func.call @cc_make_string(%2946, %2947) : (!llvm.ptr, i64) -> i64
    %2949 = func.call @cc_nil_value() : () -> i64
    %2950 = func.call @cc_intern(%2948, %2949) : (i64, i64) -> i64
    %2951 = func.call @cc_nil_value() : () -> i64
    %2952 = func.call @cc_cons(%2950, %2951) : (i64, i64) -> i64
    %2953 = func.call @cc_values_pack(%2952) : (i64) -> i64
    %2954 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%2950, %2954) : (i64, i64) -> ()
    %2955 = func.call @cc_nil_value() : () -> i64
    %2956 = llvm.mlir.addressof @str281 : !llvm.ptr
    %2957 = arith.constant 37 : i64
    %2958 = func.call @cc_make_string(%2956, %2957) : (!llvm.ptr, i64) -> i64
    %2959 = func.call @cc_nil_value() : () -> i64
    %2960 = func.call @cc_intern(%2958, %2959) : (i64, i64) -> i64
    %2961 = func.call @cc_nil_value() : () -> i64
    %2962 = func.call @cc_cons(%2960, %2961) : (i64, i64) -> i64
    %2963 = func.call @cc_values_pack(%2962) : (i64) -> i64
    %2964 = func.call @cc_set_symbol_value(%2960, %2955) : (i64, i64) -> i64
    %2965 = llvm.mlir.addressof @str282 : !llvm.ptr
    %2966 = arith.constant 38 : i64
    %2967 = func.call @cc_make_string(%2965, %2966) : (!llvm.ptr, i64) -> i64
    %2968 = func.call @cc_nil_value() : () -> i64
    %2969 = func.call @cc_intern(%2967, %2968) : (i64, i64) -> i64
    %2970 = func.call @cc_nil_value() : () -> i64
    %2971 = func.call @cc_cons(%2969, %2970) : (i64, i64) -> i64
    %2972 = func.call @cc_values_pack(%2971) : (i64) -> i64
    %2973 = func.call @cc_set_symbol_value(%2969, %2955) : (i64, i64) -> i64
    %2974 = llvm.mlir.addressof @str283 : !llvm.ptr
    %2975 = arith.constant 39 : i64
    %2976 = func.call @cc_make_string(%2974, %2975) : (!llvm.ptr, i64) -> i64
    %2977 = func.call @cc_nil_value() : () -> i64
    %2978 = func.call @cc_intern(%2976, %2977) : (i64, i64) -> i64
    %2979 = func.call @cc_nil_value() : () -> i64
    %2980 = func.call @cc_cons(%2978, %2979) : (i64, i64) -> i64
    %2981 = func.call @cc_values_pack(%2980) : (i64) -> i64
    %2982 = func.call @cc_set_symbol_value(%2978, %2955) : (i64, i64) -> i64
    %2983 = func.call @cc_nil_value() : () -> i64
    %2984 = func.call @cc_nil_value() : () -> i64
    %2985 = func.call @cc_errorp(%2983) : (i64) -> i64
    %2986 = arith.cmpi ne, %2985, %2984 : i64
    %2987 = scf.if %2986 -> (i64) {
      scf.yield %2983 : i64
    } else {
      %2988 = func.call @cc_nil_value() : () -> i64
      %2989 = func.call @cc_nil_value() : () -> i64
      %2990 = func.call @cc_errorp(%2988) : (i64) -> i64
      %2991 = arith.cmpi ne, %2990, %2989 : i64
      %2992 = scf.if %2991 -> (i64) {
        scf.yield %2988 : i64
      } else {
        %2993 = llvm.mlir.addressof @str284 : !llvm.ptr
        %2994 = arith.constant 11 : i64
        %2995 = func.call @cc_make_string(%2993, %2994) : (!llvm.ptr, i64) -> i64
        %2996 = func.call @cc_nil_value() : () -> i64
        %2997 = func.call @cc_intern(%2995, %2996) : (i64, i64) -> i64
        %2998 = func.call @cc_nil_value() : () -> i64
        %2999 = func.call @cc_cons(%2997, %2998) : (i64, i64) -> i64
        %3000 = func.call @cc_values_pack(%2999) : (i64) -> i64
        func.call @stack_push_pointer(%2997) : (i64) -> ()
        %3001 = func.call @stack_pop_pointer() : () -> i64
        %3002 = func.call @cc_nil_value() : () -> i64
        %3003 = func.call @cc_errorp(%3001) : (i64) -> i64
        %3004 = arith.cmpi ne, %3003, %3002 : i64
        %3005 = arith.cmpi eq, %3002, %3002 : i64
        %3006 = arith.andi %3004, %3005 : i1
        %3007 = scf.if %3006 -> (i64) {
          scf.yield %3001 : i64
        } else {
          scf.yield %3002 : i64
        }
        %3008 = arith.cmpi ne, %3007, %3002 : i64
        scf.if %3008 {
          func.call @stack_push_pointer(%3007) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3001) : (i64) -> ()
          %3009 = llvm.mlir.addressof @str285 : !llvm.ptr
          %3010 = func.call @cc_make_function_ref_const(%3009) : (!llvm.ptr) -> i64
          %3011 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3010, %3011) : (i64, i64) -> ()
        }
        %3012 = func.call @stack_pop_pointer() : () -> i64
        %3013 = func.call @cc_nil_value() : () -> i64
        %3014 = arith.cmpi ne, %3012, %3013 : i64
        scf.if %3014 {
          %3015 = llvm.mlir.addressof @str286 : !llvm.ptr
          %3016 = arith.constant 11 : i64
          %3017 = func.call @cc_make_string(%3015, %3016) : (!llvm.ptr, i64) -> i64
          %3018 = func.call @cc_nil_value() : () -> i64
          %3019 = func.call @cc_intern(%3017, %3018) : (i64, i64) -> i64
          %3020 = func.call @cc_nil_value() : () -> i64
          %3021 = func.call @cc_cons(%3019, %3020) : (i64, i64) -> i64
          %3022 = func.call @cc_values_pack(%3021) : (i64) -> i64
          func.call @stack_push_pointer(%3019) : (i64) -> ()
          %3023 = func.call @stack_pop_pointer() : () -> i64
          %3024 = func.call @cc_nil_value() : () -> i64
          %3025 = func.call @cc_errorp(%3023) : (i64) -> i64
          %3026 = arith.cmpi ne, %3025, %3024 : i64
          %3027 = arith.cmpi eq, %3024, %3024 : i64
          %3028 = arith.andi %3026, %3027 : i1
          %3029 = scf.if %3028 -> (i64) {
            scf.yield %3023 : i64
          } else {
            scf.yield %3024 : i64
          }
          %3030 = arith.cmpi ne, %3029, %3024 : i64
          scf.if %3030 {
            func.call @stack_push_pointer(%3029) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3023) : (i64) -> ()
            %3031 = llvm.mlir.addressof @str287 : !llvm.ptr
            %3032 = func.call @cc_make_function_ref_const(%3031) : (!llvm.ptr) -> i64
            %3033 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3032, %3033) : (i64, i64) -> ()
          }
        } else {
          %3034 = llvm.mlir.addressof @str288 : !llvm.ptr
          %3035 = arith.constant 11 : i64
          %3036 = func.call @cc_make_string(%3034, %3035) : (!llvm.ptr, i64) -> i64
          %3037 = func.call @cc_nil_value() : () -> i64
          %3038 = func.call @cc_intern(%3036, %3037) : (i64, i64) -> i64
          %3039 = func.call @cc_nil_value() : () -> i64
          %3040 = func.call @cc_cons(%3038, %3039) : (i64, i64) -> i64
          %3041 = func.call @cc_values_pack(%3040) : (i64) -> i64
          func.call @stack_push_pointer(%3038) : (i64) -> ()
          %3042 = func.call @stack_pop_pointer() : () -> i64
          %3043 = func.call @cc_nil_value() : () -> i64
          %3044 = func.call @cc_errorp(%3042) : (i64) -> i64
          %3045 = arith.cmpi ne, %3044, %3043 : i64
          %3046 = arith.cmpi eq, %3043, %3043 : i64
          %3047 = arith.andi %3045, %3046 : i1
          %3048 = scf.if %3047 -> (i64) {
            scf.yield %3042 : i64
          } else {
            scf.yield %3043 : i64
          }
          %3049 = arith.cmpi ne, %3048, %3043 : i64
          scf.if %3049 {
            func.call @stack_push_pointer(%3048) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3042) : (i64) -> ()
            %3050 = llvm.mlir.addressof @str289 : !llvm.ptr
            %3051 = func.call @cc_make_function_ref_const(%3050) : (!llvm.ptr) -> i64
            %3052 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3051, %3052) : (i64, i64) -> ()
          }
        }
        %3053 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3053 : i64
      }
      %3054 = func.call @cc_nil_value() : () -> i64
      %3055 = func.call @cc_errorp(%2992) : (i64) -> i64
      %3056 = arith.cmpi ne, %3055, %3054 : i64
      %3057 = scf.if %3056 -> (i64) {
        scf.yield %2992 : i64
      } else {
        %3058 = llvm.mlir.addressof @str290 : !llvm.ptr
        %3059 = arith.constant 2 : i64
        %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
        %3061 = llvm.mlir.addressof @str291 : !llvm.ptr
        %3062 = arith.constant 7 : i64
        %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
        %3064 = func.call @cc_intern(%3060, %3063) : (i64, i64) -> i64
        %3065 = func.call @cc_nil_value() : () -> i64
        %3066 = func.call @cc_cons(%3064, %3065) : (i64, i64) -> i64
        %3067 = func.call @cc_values_pack(%3066) : (i64) -> i64
        func.call @stack_push_pointer(%3064) : (i64) -> ()
        %3068 = func.call @stack_pop_pointer() : () -> i64
        %3069 = llvm.mlir.addressof @str292 : !llvm.ptr
        %3070 = arith.constant 11 : i64
        %3071 = func.call @cc_make_string(%3069, %3070) : (!llvm.ptr, i64) -> i64
        %3072 = func.call @cc_nil_value() : () -> i64
        %3073 = func.call @cc_intern(%3071, %3072) : (i64, i64) -> i64
        %3074 = func.call @cc_nil_value() : () -> i64
        %3075 = func.call @cc_cons(%3073, %3074) : (i64, i64) -> i64
        %3076 = func.call @cc_values_pack(%3075) : (i64) -> i64
        func.call @stack_push_pointer(%3073) : (i64) -> ()
        %3077 = func.call @stack_pop_pointer() : () -> i64
        %3078 = func.call @cc_nil_value() : () -> i64
        %3079 = func.call @cc_errorp(%3068) : (i64) -> i64
        %3080 = arith.cmpi ne, %3079, %3078 : i64
        %3081 = arith.cmpi eq, %3078, %3078 : i64
        %3082 = arith.andi %3080, %3081 : i1
        %3083 = scf.if %3082 -> (i64) {
          scf.yield %3068 : i64
        } else {
          scf.yield %3078 : i64
        }
        %3084 = func.call @cc_errorp(%3077) : (i64) -> i64
        %3085 = arith.cmpi ne, %3084, %3078 : i64
        %3086 = arith.cmpi eq, %3083, %3078 : i64
        %3087 = arith.andi %3085, %3086 : i1
        %3088 = scf.if %3087 -> (i64) {
          scf.yield %3077 : i64
        } else {
          scf.yield %3083 : i64
        }
        %3089 = arith.cmpi ne, %3088, %3078 : i64
        scf.if %3089 {
          func.call @stack_push_pointer(%3088) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3068) : (i64) -> ()
          func.call @stack_push_pointer(%3077) : (i64) -> ()
          %3090 = llvm.mlir.addressof @str293 : !llvm.ptr
          %3091 = func.call @cc_make_function_ref_const(%3090) : (!llvm.ptr) -> i64
          %3092 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3091, %3092) : (i64, i64) -> ()
        }
        %3093 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3093 : i64
      }
      %3094 = func.call @cc_nil_value() : () -> i64
      %3095 = func.call @cc_errorp(%3057) : (i64) -> i64
      %3096 = arith.cmpi ne, %3095, %3094 : i64
      %3097 = scf.if %3096 -> (i64) {
        scf.yield %3057 : i64
      } else {
        %3098 = llvm.mlir.addressof @str294 : !llvm.ptr
        %3099 = arith.constant 4 : i64
        %3100 = func.call @cc_make_string(%3098, %3099) : (!llvm.ptr, i64) -> i64
        %3101 = func.call @cc_nil_value() : () -> i64
        %3102 = func.call @cc_intern(%3100, %3101) : (i64, i64) -> i64
        %3103 = func.call @cc_nil_value() : () -> i64
        %3104 = func.call @cc_cons(%3102, %3103) : (i64, i64) -> i64
        %3105 = func.call @cc_values_pack(%3104) : (i64) -> i64
        func.call @stack_push_pointer(%3102) : (i64) -> ()
        %3106 = func.call @stack_pop_pointer() : () -> i64
        %3107 = func.call @cc_string(%3106) : (i64) -> i64
        func.call @stack_push_pointer(%3107) : (i64) -> ()
        %3108 = func.call @stack_pop_pointer() : () -> i64
        %3109 = llvm.mlir.addressof @str295 : !llvm.ptr
        %3110 = arith.constant 11 : i64
        %3111 = func.call @cc_make_string(%3109, %3110) : (!llvm.ptr, i64) -> i64
        %3112 = func.call @cc_nil_value() : () -> i64
        %3113 = func.call @cc_intern(%3111, %3112) : (i64, i64) -> i64
        %3114 = func.call @cc_nil_value() : () -> i64
        %3115 = func.call @cc_cons(%3113, %3114) : (i64, i64) -> i64
        %3116 = func.call @cc_values_pack(%3115) : (i64) -> i64
        func.call @stack_push_pointer(%3113) : (i64) -> ()
        %3117 = func.call @stack_pop_pointer() : () -> i64
        %3118 = func.call @cc_nil_value() : () -> i64
        %3119 = func.call @cc_errorp(%3108) : (i64) -> i64
        %3120 = arith.cmpi ne, %3119, %3118 : i64
        %3121 = arith.cmpi eq, %3118, %3118 : i64
        %3122 = arith.andi %3120, %3121 : i1
        %3123 = scf.if %3122 -> (i64) {
          scf.yield %3108 : i64
        } else {
          scf.yield %3118 : i64
        }
        %3124 = func.call @cc_errorp(%3117) : (i64) -> i64
        %3125 = arith.cmpi ne, %3124, %3118 : i64
        %3126 = arith.cmpi eq, %3123, %3118 : i64
        %3127 = arith.andi %3125, %3126 : i1
        %3128 = scf.if %3127 -> (i64) {
          scf.yield %3117 : i64
        } else {
          scf.yield %3123 : i64
        }
        %3129 = arith.cmpi ne, %3128, %3118 : i64
        scf.if %3129 {
          func.call @stack_push_pointer(%3128) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3108) : (i64) -> ()
          func.call @stack_push_pointer(%3117) : (i64) -> ()
          %3130 = llvm.mlir.addressof @str296 : !llvm.ptr
          %3131 = func.call @cc_make_function_ref_const(%3130) : (!llvm.ptr) -> i64
          %3132 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3131, %3132) : (i64, i64) -> ()
        }
        %3133 = func.call @stack_pop_pointer() : () -> i64
        %3134 = llvm.mlir.addressof @str297 : !llvm.ptr
        %3135 = arith.constant 11 : i64
        %3136 = func.call @cc_make_string(%3134, %3135) : (!llvm.ptr, i64) -> i64
        %3137 = func.call @cc_nil_value() : () -> i64
        %3138 = func.call @cc_intern(%3136, %3137) : (i64, i64) -> i64
        %3139 = func.call @cc_nil_value() : () -> i64
        %3140 = func.call @cc_cons(%3138, %3139) : (i64, i64) -> i64
        %3141 = func.call @cc_values_pack(%3140) : (i64) -> i64
        func.call @stack_push_pointer(%3138) : (i64) -> ()
        %3142 = func.call @stack_pop_pointer() : () -> i64
        %3143 = func.call @cc_nil_value() : () -> i64
        %3144 = func.call @cc_errorp(%3133) : (i64) -> i64
        %3145 = arith.cmpi ne, %3144, %3143 : i64
        %3146 = arith.cmpi eq, %3143, %3143 : i64
        %3147 = arith.andi %3145, %3146 : i1
        %3148 = scf.if %3147 -> (i64) {
          scf.yield %3133 : i64
        } else {
          scf.yield %3143 : i64
        }
        %3149 = func.call @cc_errorp(%3142) : (i64) -> i64
        %3150 = arith.cmpi ne, %3149, %3143 : i64
        %3151 = arith.cmpi eq, %3148, %3143 : i64
        %3152 = arith.andi %3150, %3151 : i1
        %3153 = scf.if %3152 -> (i64) {
          scf.yield %3142 : i64
        } else {
          scf.yield %3148 : i64
        }
        %3154 = arith.cmpi ne, %3153, %3143 : i64
        scf.if %3154 {
          func.call @stack_push_pointer(%3153) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3133) : (i64) -> ()
          func.call @stack_push_pointer(%3142) : (i64) -> ()
          %3155 = llvm.mlir.addressof @str298 : !llvm.ptr
          %3156 = func.call @cc_make_function_ref_const(%3155) : (!llvm.ptr) -> i64
          %3157 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3156, %3157) : (i64, i64) -> ()
        }
        %3158 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3158 : i64
      }
      %3159 = func.call @cc_nil_value() : () -> i64
      %3160 = func.call @cc_errorp(%3097) : (i64) -> i64
      %3161 = arith.cmpi ne, %3160, %3159 : i64
      %3162 = scf.if %3161 -> (i64) {
        scf.yield %3097 : i64
      } else {
        %3163 = llvm.mlir.addressof @str299 : !llvm.ptr
        %3164 = arith.constant 17 : i64
        %3165 = func.call @cc_make_string(%3163, %3164) : (!llvm.ptr, i64) -> i64
        %3166 = func.call @cc_nil_value() : () -> i64
        %3167 = func.call @cc_intern(%3165, %3166) : (i64, i64) -> i64
        %3168 = func.call @cc_nil_value() : () -> i64
        %3169 = func.call @cc_cons(%3167, %3168) : (i64, i64) -> i64
        %3170 = func.call @cc_values_pack(%3169) : (i64) -> i64
        func.call @stack_push_pointer(%3167) : (i64) -> ()
        %3171 = func.call @stack_pop_pointer() : () -> i64
        %3172 = func.call @cc_string(%3171) : (i64) -> i64
        func.call @stack_push_pointer(%3172) : (i64) -> ()
        %3173 = func.call @stack_pop_pointer() : () -> i64
        %3174 = llvm.mlir.addressof @str300 : !llvm.ptr
        %3175 = arith.constant 11 : i64
        %3176 = func.call @cc_make_string(%3174, %3175) : (!llvm.ptr, i64) -> i64
        %3177 = func.call @cc_nil_value() : () -> i64
        %3178 = func.call @cc_intern(%3176, %3177) : (i64, i64) -> i64
        %3179 = func.call @cc_nil_value() : () -> i64
        %3180 = func.call @cc_cons(%3178, %3179) : (i64, i64) -> i64
        %3181 = func.call @cc_values_pack(%3180) : (i64) -> i64
        func.call @stack_push_pointer(%3178) : (i64) -> ()
        %3182 = func.call @stack_pop_pointer() : () -> i64
        %3183 = func.call @cc_nil_value() : () -> i64
        %3184 = func.call @cc_errorp(%3173) : (i64) -> i64
        %3185 = arith.cmpi ne, %3184, %3183 : i64
        %3186 = arith.cmpi eq, %3183, %3183 : i64
        %3187 = arith.andi %3185, %3186 : i1
        %3188 = scf.if %3187 -> (i64) {
          scf.yield %3173 : i64
        } else {
          scf.yield %3183 : i64
        }
        %3189 = func.call @cc_errorp(%3182) : (i64) -> i64
        %3190 = arith.cmpi ne, %3189, %3183 : i64
        %3191 = arith.cmpi eq, %3188, %3183 : i64
        %3192 = arith.andi %3190, %3191 : i1
        %3193 = scf.if %3192 -> (i64) {
          scf.yield %3182 : i64
        } else {
          scf.yield %3188 : i64
        }
        %3194 = arith.cmpi ne, %3193, %3183 : i64
        scf.if %3194 {
          func.call @stack_push_pointer(%3193) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3173) : (i64) -> ()
          func.call @stack_push_pointer(%3182) : (i64) -> ()
          %3195 = llvm.mlir.addressof @str301 : !llvm.ptr
          %3196 = func.call @cc_make_function_ref_const(%3195) : (!llvm.ptr) -> i64
          %3197 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3196, %3197) : (i64, i64) -> ()
        }
        %3198 = func.call @stack_pop_pointer() : () -> i64
        %3199 = llvm.mlir.addressof @str302 : !llvm.ptr
        %3200 = arith.constant 11 : i64
        %3201 = func.call @cc_make_string(%3199, %3200) : (!llvm.ptr, i64) -> i64
        %3202 = func.call @cc_nil_value() : () -> i64
        %3203 = func.call @cc_intern(%3201, %3202) : (i64, i64) -> i64
        %3204 = func.call @cc_nil_value() : () -> i64
        %3205 = func.call @cc_cons(%3203, %3204) : (i64, i64) -> i64
        %3206 = func.call @cc_values_pack(%3205) : (i64) -> i64
        func.call @stack_push_pointer(%3203) : (i64) -> ()
        %3207 = func.call @stack_pop_pointer() : () -> i64
        %3208 = func.call @cc_nil_value() : () -> i64
        %3209 = func.call @cc_errorp(%3198) : (i64) -> i64
        %3210 = arith.cmpi ne, %3209, %3208 : i64
        %3211 = arith.cmpi eq, %3208, %3208 : i64
        %3212 = arith.andi %3210, %3211 : i1
        %3213 = scf.if %3212 -> (i64) {
          scf.yield %3198 : i64
        } else {
          scf.yield %3208 : i64
        }
        %3214 = func.call @cc_errorp(%3207) : (i64) -> i64
        %3215 = arith.cmpi ne, %3214, %3208 : i64
        %3216 = arith.cmpi eq, %3213, %3208 : i64
        %3217 = arith.andi %3215, %3216 : i1
        %3218 = scf.if %3217 -> (i64) {
          scf.yield %3207 : i64
        } else {
          scf.yield %3213 : i64
        }
        %3219 = arith.cmpi ne, %3218, %3208 : i64
        scf.if %3219 {
          func.call @stack_push_pointer(%3218) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3198) : (i64) -> ()
          func.call @stack_push_pointer(%3207) : (i64) -> ()
          %3220 = llvm.mlir.addressof @str303 : !llvm.ptr
          %3221 = func.call @cc_make_function_ref_const(%3220) : (!llvm.ptr) -> i64
          %3222 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3221, %3222) : (i64, i64) -> ()
        }
        %3223 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3223 : i64
      }
      %3224 = func.call @cc_nil_value() : () -> i64
      %3225 = func.call @cc_errorp(%3162) : (i64) -> i64
      %3226 = arith.cmpi ne, %3225, %3224 : i64
      %3227 = scf.if %3226 -> (i64) {
        scf.yield %3162 : i64
      } else {
        %3228 = llvm.mlir.addressof @str304 : !llvm.ptr
        %3229 = arith.constant 11 : i64
        %3230 = func.call @cc_make_string(%3228, %3229) : (!llvm.ptr, i64) -> i64
        %3231 = func.call @cc_nil_value() : () -> i64
        %3232 = func.call @cc_intern(%3230, %3231) : (i64, i64) -> i64
        %3233 = func.call @cc_nil_value() : () -> i64
        %3234 = func.call @cc_cons(%3232, %3233) : (i64, i64) -> i64
        %3235 = func.call @cc_values_pack(%3234) : (i64) -> i64
        func.call @stack_push_pointer(%3232) : (i64) -> ()
        %3236 = func.call @stack_pop_pointer() : () -> i64
        %3237 = func.call @cc_nil_value() : () -> i64
        %3238 = func.call @cc_errorp(%3236) : (i64) -> i64
        %3239 = arith.cmpi ne, %3238, %3237 : i64
        %3240 = arith.cmpi eq, %3237, %3237 : i64
        %3241 = arith.andi %3239, %3240 : i1
        %3242 = scf.if %3241 -> (i64) {
          scf.yield %3236 : i64
        } else {
          scf.yield %3237 : i64
        }
        %3243 = arith.cmpi ne, %3242, %3237 : i64
        scf.if %3243 {
          func.call @stack_push_pointer(%3242) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3236) : (i64) -> ()
          %3244 = llvm.mlir.addressof @str305 : !llvm.ptr
          %3245 = func.call @cc_make_function_ref_const(%3244) : (!llvm.ptr) -> i64
          %3246 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3245, %3246) : (i64, i64) -> ()
        }
        %3247 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3247 : i64
      }
      func.call @stack_push_pointer(%3227) : (i64) -> ()
      %3248 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3248 : i64
    }
    %3249 = func.call @cc_nil_value() : () -> i64
    %3250 = func.call @cc_errorp(%2987) : (i64) -> i64
    %3251 = arith.cmpi ne, %3250, %3249 : i64
    %3252 = scf.if %3251 -> (i64) {
      scf.yield %2987 : i64
    } else {
      %3253 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3254 = arith.constant 11 : i64
      %3255 = func.call @cc_make_string(%3253, %3254) : (!llvm.ptr, i64) -> i64
      %3256 = func.call @cc_nil_value() : () -> i64
      %3257 = func.call @cc_intern(%3255, %3256) : (i64, i64) -> i64
      %3258 = func.call @cc_nil_value() : () -> i64
      %3259 = func.call @cc_cons(%3257, %3258) : (i64, i64) -> i64
      %3260 = func.call @cc_values_pack(%3259) : (i64) -> i64
      func.call @stack_push_pointer(%3257) : (i64) -> ()
      %3261 = func.call @stack_pop_pointer() : () -> i64
      %3262 = func.call @cc_in_package(%3261) : (i64) -> i64
      func.call @stack_push_pointer(%3262) : (i64) -> ()
      %3263 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3263 : i64
    }
    %3264 = func.call @cc_nil_value() : () -> i64
    %3265 = func.call @cc_errorp(%3252) : (i64) -> i64
    %3266 = arith.cmpi ne, %3265, %3264 : i64
    %3267 = scf.if %3266 -> (i64) {
      scf.yield %3252 : i64
    } else {
      %3268 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3269 = arith.constant 23 : i64
      %3270 = func.call @cc_make_string(%3268, %3269) : (!llvm.ptr, i64) -> i64
      %3271 = func.call @cc_nil_value() : () -> i64
      %3272 = func.call @cc_intern(%3270, %3271) : (i64, i64) -> i64
      %3273 = func.call @cc_nil_value() : () -> i64
      %3274 = func.call @cc_cons(%3272, %3273) : (i64, i64) -> i64
      %3275 = func.call @cc_values_pack(%3274) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3276 = func.call @stack_pop_pointer() : () -> i64
      %3277 = func.call @cc_set_symbol_value(%3272, %3276) : (i64, i64) -> i64
      %3278 = func.call @cc_errorp(%3277) : (i64) -> i64
      %3279 = func.call @cc_nil_value() : () -> i64
      %3280 = arith.cmpi ne, %3278, %3279 : i64
      scf.if %3280 {
        func.call @stack_push_pointer(%3277) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3272) : (i64) -> ()
      }
      %3281 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3281 : i64
    }
    %3282 = func.call @cc_nil_value() : () -> i64
    %3283 = func.call @cc_errorp(%3267) : (i64) -> i64
    %3284 = arith.cmpi ne, %3283, %3282 : i64
    %3285 = scf.if %3284 -> (i64) {
      scf.yield %3267 : i64
    } else {
      %3286 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3287 = arith.constant 25 : i64
      %3288 = func.call @cc_make_string(%3286, %3287) : (!llvm.ptr, i64) -> i64
      %3289 = func.call @cc_nil_value() : () -> i64
      %3290 = func.call @cc_intern(%3288, %3289) : (i64, i64) -> i64
      %3291 = func.call @cc_nil_value() : () -> i64
      %3292 = func.call @cc_cons(%3290, %3291) : (i64, i64) -> i64
      %3293 = func.call @cc_values_pack(%3292) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3294 = func.call @stack_pop_pointer() : () -> i64
      %3295 = func.call @cc_set_symbol_value(%3290, %3294) : (i64, i64) -> i64
      %3296 = func.call @cc_errorp(%3295) : (i64) -> i64
      %3297 = func.call @cc_nil_value() : () -> i64
      %3298 = arith.cmpi ne, %3296, %3297 : i64
      scf.if %3298 {
        func.call @stack_push_pointer(%3295) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3290) : (i64) -> ()
      }
      %3299 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3299 : i64
    }
    %3300 = func.call @cc_nil_value() : () -> i64
    %3301 = func.call @cc_errorp(%3285) : (i64) -> i64
    %3302 = arith.cmpi ne, %3301, %3300 : i64
    %3303 = scf.if %3302 -> (i64) {
      scf.yield %3285 : i64
    } else {
      %3304 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3305 = arith.constant 23 : i64
      %3306 = func.call @cc_make_string(%3304, %3305) : (!llvm.ptr, i64) -> i64
      %3307 = func.call @cc_nil_value() : () -> i64
      %3308 = func.call @cc_intern(%3306, %3307) : (i64, i64) -> i64
      %3309 = func.call @cc_nil_value() : () -> i64
      %3310 = func.call @cc_cons(%3308, %3309) : (i64, i64) -> i64
      %3311 = func.call @cc_values_pack(%3310) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3312 = func.call @stack_pop_pointer() : () -> i64
      %3313 = func.call @cc_set_symbol_value(%3308, %3312) : (i64, i64) -> i64
      %3314 = func.call @cc_errorp(%3313) : (i64) -> i64
      %3315 = func.call @cc_nil_value() : () -> i64
      %3316 = arith.cmpi ne, %3314, %3315 : i64
      scf.if %3316 {
        func.call @stack_push_pointer(%3313) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3308) : (i64) -> ()
      }
      %3317 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3317 : i64
    }
    %3318 = func.call @cc_nil_value() : () -> i64
    %3319 = func.call @cc_errorp(%3303) : (i64) -> i64
    %3320 = arith.cmpi ne, %3319, %3318 : i64
    %3321 = scf.if %3320 -> (i64) {
      scf.yield %3303 : i64
    } else {
      %3322 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3323 = arith.constant 25 : i64
      %3324 = func.call @cc_make_string(%3322, %3323) : (!llvm.ptr, i64) -> i64
      %3325 = func.call @cc_nil_value() : () -> i64
      %3326 = func.call @cc_intern(%3324, %3325) : (i64, i64) -> i64
      %3327 = func.call @cc_nil_value() : () -> i64
      %3328 = func.call @cc_cons(%3326, %3327) : (i64, i64) -> i64
      %3329 = func.call @cc_values_pack(%3328) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3330 = func.call @stack_pop_pointer() : () -> i64
      %3331 = func.call @cc_set_symbol_value(%3326, %3330) : (i64, i64) -> i64
      %3332 = func.call @cc_errorp(%3331) : (i64) -> i64
      %3333 = func.call @cc_nil_value() : () -> i64
      %3334 = arith.cmpi ne, %3332, %3333 : i64
      scf.if %3334 {
        func.call @stack_push_pointer(%3331) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3326) : (i64) -> ()
      }
      %3335 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3335 : i64
    }
    %3336 = func.call @cc_nil_value() : () -> i64
    %3337 = func.call @cc_errorp(%3321) : (i64) -> i64
    %3338 = arith.cmpi ne, %3337, %3336 : i64
    %3339 = scf.if %3338 -> (i64) {
      scf.yield %3321 : i64
    } else {
      %3340 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3341 = arith.constant 19 : i64
      %3342 = func.call @cc_make_string(%3340, %3341) : (!llvm.ptr, i64) -> i64
      %3343 = func.call @cc_nil_value() : () -> i64
      %3344 = func.call @cc_intern(%3342, %3343) : (i64, i64) -> i64
      %3345 = func.call @cc_nil_value() : () -> i64
      %3346 = func.call @cc_cons(%3344, %3345) : (i64, i64) -> i64
      %3347 = func.call @cc_values_pack(%3346) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3348 = func.call @stack_pop_pointer() : () -> i64
      %3349 = func.call @cc_set_symbol_value(%3344, %3348) : (i64, i64) -> i64
      %3350 = func.call @cc_errorp(%3349) : (i64) -> i64
      %3351 = func.call @cc_nil_value() : () -> i64
      %3352 = arith.cmpi ne, %3350, %3351 : i64
      scf.if %3352 {
        func.call @stack_push_pointer(%3349) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3344) : (i64) -> ()
      }
      %3353 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3353 : i64
    }
    %3354 = func.call @cc_nil_value() : () -> i64
    %3355 = func.call @cc_errorp(%3339) : (i64) -> i64
    %3356 = arith.cmpi ne, %3355, %3354 : i64
    %3357 = scf.if %3356 -> (i64) {
      scf.yield %3339 : i64
    } else {
      %3358 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3359 = arith.constant 25 : i64
      %3360 = func.call @cc_make_string(%3358, %3359) : (!llvm.ptr, i64) -> i64
      %3361 = func.call @cc_nil_value() : () -> i64
      %3362 = func.call @cc_intern(%3360, %3361) : (i64, i64) -> i64
      %3363 = func.call @cc_nil_value() : () -> i64
      %3364 = func.call @cc_cons(%3362, %3363) : (i64, i64) -> i64
      %3365 = func.call @cc_values_pack(%3364) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3366 = func.call @stack_pop_pointer() : () -> i64
      %3367 = func.call @cc_set_symbol_value(%3362, %3366) : (i64, i64) -> i64
      %3368 = func.call @cc_errorp(%3367) : (i64) -> i64
      %3369 = func.call @cc_nil_value() : () -> i64
      %3370 = arith.cmpi ne, %3368, %3369 : i64
      scf.if %3370 {
        func.call @stack_push_pointer(%3367) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3362) : (i64) -> ()
      }
      %3371 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3371 : i64
    }
    %3372 = func.call @cc_nil_value() : () -> i64
    %3373 = func.call @cc_errorp(%3357) : (i64) -> i64
    %3374 = arith.cmpi ne, %3373, %3372 : i64
    %3375 = scf.if %3374 -> (i64) {
      scf.yield %3357 : i64
    } else {
      %3376 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3377 = arith.constant 19 : i64
      %3378 = func.call @cc_make_string(%3376, %3377) : (!llvm.ptr, i64) -> i64
      %3379 = func.call @cc_nil_value() : () -> i64
      %3380 = func.call @cc_intern(%3378, %3379) : (i64, i64) -> i64
      %3381 = func.call @cc_nil_value() : () -> i64
      %3382 = func.call @cc_cons(%3380, %3381) : (i64, i64) -> i64
      %3383 = func.call @cc_values_pack(%3382) : (i64) -> i64
      %3384 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3384) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %3385 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3385) : (i64) -> ()
      %3386 = func.call @stack_pop_pointer() : () -> i64
      %3387 = func.call @cc_set_symbol_value(%3380, %3386) : (i64, i64) -> i64
      %3388 = func.call @cc_errorp(%3387) : (i64) -> i64
      %3389 = func.call @cc_nil_value() : () -> i64
      %3390 = arith.cmpi ne, %3388, %3389 : i64
      scf.if %3390 {
        func.call @stack_push_pointer(%3387) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3380) : (i64) -> ()
      }
      %3391 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3391 : i64
    }
    %3392 = func.call @cc_nil_value() : () -> i64
    %3393 = func.call @cc_errorp(%3375) : (i64) -> i64
    %3394 = arith.cmpi ne, %3393, %3392 : i64
    %3395 = scf.if %3394 -> (i64) {
      scf.yield %3375 : i64
    } else {
      %3396 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3397 = arith.constant 17 : i64
      %3398 = func.call @cc_make_string(%3396, %3397) : (!llvm.ptr, i64) -> i64
      %3399 = func.call @cc_nil_value() : () -> i64
      %3400 = func.call @cc_intern(%3398, %3399) : (i64, i64) -> i64
      %3401 = func.call @cc_nil_value() : () -> i64
      %3402 = func.call @cc_cons(%3400, %3401) : (i64, i64) -> i64
      %3403 = func.call @cc_values_pack(%3402) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3404 = func.call @stack_pop_pointer() : () -> i64
      %3405 = func.call @cc_set_symbol_value(%3400, %3404) : (i64, i64) -> i64
      %3406 = func.call @cc_errorp(%3405) : (i64) -> i64
      %3407 = func.call @cc_nil_value() : () -> i64
      %3408 = arith.cmpi ne, %3406, %3407 : i64
      scf.if %3408 {
        func.call @stack_push_pointer(%3405) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3400) : (i64) -> ()
      }
      %3409 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3409 : i64
    }
    %3410 = func.call @cc_nil_value() : () -> i64
    %3411 = func.call @cc_errorp(%3395) : (i64) -> i64
    %3412 = arith.cmpi ne, %3411, %3410 : i64
    %3413 = scf.if %3412 -> (i64) {
      scf.yield %3395 : i64
    } else {
      %3414 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3415 = func.call @cc_make_function_ref_const(%3414) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3415) : (i64) -> ()
      %3416 = func.call @stack_pop_pointer() : () -> i64
      %3417 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3418 = arith.constant 7 : i64
      %3419 = func.call @cc_make_string(%3417, %3418) : (!llvm.ptr, i64) -> i64
      %3420 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3421 = arith.constant 15 : i64
      %3422 = func.call @cc_make_string(%3420, %3421) : (!llvm.ptr, i64) -> i64
      %3423 = func.call @cc_intern(%3419, %3422) : (i64, i64) -> i64
      %3424 = func.call @cc_nil_value() : () -> i64
      %3425 = func.call @cc_cons(%3423, %3424) : (i64, i64) -> i64
      %3426 = func.call @cc_values_pack(%3425) : (i64) -> i64
      %3427 = func.call @cc_set_symbol_value(%3423, %3416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3416) : (i64) -> ()
      %3428 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3428 : i64
    }
    %3429 = func.call @cc_nil_value() : () -> i64
    %3430 = func.call @cc_errorp(%3413) : (i64) -> i64
    %3431 = arith.cmpi ne, %3430, %3429 : i64
    %3432 = scf.if %3431 -> (i64) {
      scf.yield %3413 : i64
    } else {
      %3433 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3434 = func.call @cc_make_function_ref_const(%3433) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3434) : (i64) -> ()
      %3435 = func.call @stack_pop_pointer() : () -> i64
      %3436 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3437 = arith.constant 7 : i64
      %3438 = func.call @cc_make_string(%3436, %3437) : (!llvm.ptr, i64) -> i64
      %3439 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3440 = arith.constant 15 : i64
      %3441 = func.call @cc_make_string(%3439, %3440) : (!llvm.ptr, i64) -> i64
      %3442 = func.call @cc_intern(%3438, %3441) : (i64, i64) -> i64
      %3443 = func.call @cc_nil_value() : () -> i64
      %3444 = func.call @cc_cons(%3442, %3443) : (i64, i64) -> i64
      %3445 = func.call @cc_values_pack(%3444) : (i64) -> i64
      %3446 = func.call @cc_set_symbol_value(%3442, %3435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3435) : (i64) -> ()
      %3447 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3447 : i64
    }
    %3448 = func.call @cc_nil_value() : () -> i64
    %3449 = func.call @cc_errorp(%3432) : (i64) -> i64
    %3450 = arith.cmpi ne, %3449, %3448 : i64
    %3451 = scf.if %3450 -> (i64) {
      scf.yield %3432 : i64
    } else {
      %3452 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3453 = func.call @cc_make_function_ref_const(%3452) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3453) : (i64) -> ()
      %3454 = func.call @stack_pop_pointer() : () -> i64
      %3455 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3456 = arith.constant 7 : i64
      %3457 = func.call @cc_make_string(%3455, %3456) : (!llvm.ptr, i64) -> i64
      %3458 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3459 = arith.constant 15 : i64
      %3460 = func.call @cc_make_string(%3458, %3459) : (!llvm.ptr, i64) -> i64
      %3461 = func.call @cc_intern(%3457, %3460) : (i64, i64) -> i64
      %3462 = func.call @cc_nil_value() : () -> i64
      %3463 = func.call @cc_cons(%3461, %3462) : (i64, i64) -> i64
      %3464 = func.call @cc_values_pack(%3463) : (i64) -> i64
      %3465 = func.call @cc_set_symbol_value(%3461, %3454) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3454) : (i64) -> ()
      %3466 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3466 : i64
    }
    %3467 = func.call @cc_nil_value() : () -> i64
    %3468 = func.call @cc_errorp(%3451) : (i64) -> i64
    %3469 = arith.cmpi ne, %3468, %3467 : i64
    %3470 = scf.if %3469 -> (i64) {
      scf.yield %3451 : i64
    } else {
      %3471 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3472 = func.call @cc_make_function_ref_const(%3471) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3472) : (i64) -> ()
      %3473 = func.call @stack_pop_pointer() : () -> i64
      %3474 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3475 = arith.constant 7 : i64
      %3476 = func.call @cc_make_string(%3474, %3475) : (!llvm.ptr, i64) -> i64
      %3477 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3478 = arith.constant 15 : i64
      %3479 = func.call @cc_make_string(%3477, %3478) : (!llvm.ptr, i64) -> i64
      %3480 = func.call @cc_intern(%3476, %3479) : (i64, i64) -> i64
      %3481 = func.call @cc_nil_value() : () -> i64
      %3482 = func.call @cc_cons(%3480, %3481) : (i64, i64) -> i64
      %3483 = func.call @cc_values_pack(%3482) : (i64) -> i64
      %3484 = func.call @cc_set_symbol_value(%3480, %3473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3473) : (i64) -> ()
      %3485 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3485 : i64
    }
    %3486 = func.call @cc_nil_value() : () -> i64
    %3487 = func.call @cc_errorp(%3470) : (i64) -> i64
    %3488 = arith.cmpi ne, %3487, %3486 : i64
    %3489 = scf.if %3488 -> (i64) {
      scf.yield %3470 : i64
    } else {
      %3490 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3491 = func.call @cc_make_function_ref_const(%3490) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3491) : (i64) -> ()
      %3492 = func.call @stack_pop_pointer() : () -> i64
      %3493 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3494 = arith.constant 17 : i64
      %3495 = func.call @cc_make_string(%3493, %3494) : (!llvm.ptr, i64) -> i64
      %3496 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3497 = arith.constant 15 : i64
      %3498 = func.call @cc_make_string(%3496, %3497) : (!llvm.ptr, i64) -> i64
      %3499 = func.call @cc_intern(%3495, %3498) : (i64, i64) -> i64
      %3500 = func.call @cc_nil_value() : () -> i64
      %3501 = func.call @cc_cons(%3499, %3500) : (i64, i64) -> i64
      %3502 = func.call @cc_values_pack(%3501) : (i64) -> i64
      %3503 = func.call @cc_set_symbol_value(%3499, %3492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3492) : (i64) -> ()
      %3504 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3504 : i64
    }
    %3505 = func.call @cc_nil_value() : () -> i64
    %3506 = func.call @cc_errorp(%3489) : (i64) -> i64
    %3507 = arith.cmpi ne, %3506, %3505 : i64
    %3508 = scf.if %3507 -> (i64) {
      scf.yield %3489 : i64
    } else {
      %3509 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3510 = func.call @cc_make_function_ref_const(%3509) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3510) : (i64) -> ()
      %3511 = func.call @stack_pop_pointer() : () -> i64
      %3512 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3513 = arith.constant 17 : i64
      %3514 = func.call @cc_make_string(%3512, %3513) : (!llvm.ptr, i64) -> i64
      %3515 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3516 = arith.constant 15 : i64
      %3517 = func.call @cc_make_string(%3515, %3516) : (!llvm.ptr, i64) -> i64
      %3518 = func.call @cc_intern(%3514, %3517) : (i64, i64) -> i64
      %3519 = func.call @cc_nil_value() : () -> i64
      %3520 = func.call @cc_cons(%3518, %3519) : (i64, i64) -> i64
      %3521 = func.call @cc_values_pack(%3520) : (i64) -> i64
      %3522 = func.call @cc_set_symbol_value(%3518, %3511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3511) : (i64) -> ()
      %3523 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3523 : i64
    }
    %3524 = func.call @cc_nil_value() : () -> i64
    %3525 = func.call @cc_errorp(%3508) : (i64) -> i64
    %3526 = arith.cmpi ne, %3525, %3524 : i64
    %3527 = scf.if %3526 -> (i64) {
      scf.yield %3508 : i64
    } else {
      %3528 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3529 = func.call @cc_make_function_ref_const(%3528) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3529) : (i64) -> ()
      %3530 = func.call @stack_pop_pointer() : () -> i64
      %3531 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3532 = arith.constant 17 : i64
      %3533 = func.call @cc_make_string(%3531, %3532) : (!llvm.ptr, i64) -> i64
      %3534 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3535 = arith.constant 15 : i64
      %3536 = func.call @cc_make_string(%3534, %3535) : (!llvm.ptr, i64) -> i64
      %3537 = func.call @cc_intern(%3533, %3536) : (i64, i64) -> i64
      %3538 = func.call @cc_nil_value() : () -> i64
      %3539 = func.call @cc_cons(%3537, %3538) : (i64, i64) -> i64
      %3540 = func.call @cc_values_pack(%3539) : (i64) -> i64
      %3541 = func.call @cc_set_symbol_value(%3537, %3530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3530) : (i64) -> ()
      %3542 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3542 : i64
    }
    %3543 = func.call @cc_nil_value() : () -> i64
    %3544 = func.call @cc_errorp(%3527) : (i64) -> i64
    %3545 = arith.cmpi ne, %3544, %3543 : i64
    %3546 = scf.if %3545 -> (i64) {
      scf.yield %3527 : i64
    } else {
      %3547 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3548 = func.call @cc_make_function_ref_const(%3547) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3548) : (i64) -> ()
      %3549 = func.call @stack_pop_pointer() : () -> i64
      %3550 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3551 = arith.constant 17 : i64
      %3552 = func.call @cc_make_string(%3550, %3551) : (!llvm.ptr, i64) -> i64
      %3553 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3554 = arith.constant 15 : i64
      %3555 = func.call @cc_make_string(%3553, %3554) : (!llvm.ptr, i64) -> i64
      %3556 = func.call @cc_intern(%3552, %3555) : (i64, i64) -> i64
      %3557 = func.call @cc_nil_value() : () -> i64
      %3558 = func.call @cc_cons(%3556, %3557) : (i64, i64) -> i64
      %3559 = func.call @cc_values_pack(%3558) : (i64) -> i64
      %3560 = func.call @cc_set_symbol_value(%3556, %3549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3549) : (i64) -> ()
      %3561 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3561 : i64
    }
    %3562 = func.call @cc_nil_value() : () -> i64
    %3563 = func.call @cc_errorp(%3546) : (i64) -> i64
    %3564 = arith.cmpi ne, %3563, %3562 : i64
    %3565 = scf.if %3564 -> (i64) {
      scf.yield %3546 : i64
    } else {
      %3719 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3720 = arith.constant 4 : i64
      %3721 = func.call @cc_make_string(%3719, %3720) : (!llvm.ptr, i64) -> i64
      %3722 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3723 = arith.constant 9 : i64
      %3724 = func.call @cc_make_string(%3722, %3723) : (!llvm.ptr, i64) -> i64
      %3725 = func.call @cc_nil_value() : () -> i64
      %3726 = func.call @cc_intern(%3724, %3725) : (i64, i64) -> i64
      %3727 = func.call @cc_nil_value() : () -> i64
      %3728 = func.call @cc_cons(%3726, %3727) : (i64, i64) -> i64
      %3729 = func.call @cc_values_pack(%3728) : (i64) -> i64
      %3730 = func.call @cc_register_function_lambda_list_metadata_raw(%3726, %3721) : (i64, i64) -> i64
      %3731 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3732 = func.call @cc_make_function_ref_const(%3731) : (!llvm.ptr) -> i64
      %3733 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3734 = arith.constant 9 : i64
      %3735 = func.call @cc_make_string(%3733, %3734) : (!llvm.ptr, i64) -> i64
      %3736 = func.call @cc_nil_value() : () -> i64
      %3737 = func.call @cc_intern(%3735, %3736) : (i64, i64) -> i64
      %3738 = func.call @cc_nil_value() : () -> i64
      %3739 = func.call @cc_cons(%3737, %3738) : (i64, i64) -> i64
      %3740 = func.call @cc_values_pack(%3739) : (i64) -> i64
      %3741 = func.call @cc_set_symbol_value(%3737, %3732) : (i64, i64) -> i64
      %3742 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3743 = arith.constant 9 : i64
      %3744 = func.call @cc_make_string(%3742, %3743) : (!llvm.ptr, i64) -> i64
      %3745 = func.call @cc_nil_value() : () -> i64
      %3746 = func.call @cc_intern(%3744, %3745) : (i64, i64) -> i64
      %3747 = func.call @cc_nil_value() : () -> i64
      %3748 = func.call @cc_cons(%3746, %3747) : (i64, i64) -> i64
      %3749 = func.call @cc_values_pack(%3748) : (i64) -> i64
      func.call @stack_push_pointer(%3746) : (i64) -> ()
      %3750 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3750 : i64
    }
    %3751 = func.call @cc_nil_value() : () -> i64
    %3752 = func.call @cc_errorp(%3565) : (i64) -> i64
    %3753 = arith.cmpi ne, %3752, %3751 : i64
    %3754 = scf.if %3753 -> (i64) {
      scf.yield %3565 : i64
    } else {
      %3755 = llvm.mlir.addressof @str358 : !llvm.ptr
      %3756 = func.call @cc_make_function_ref_const(%3755) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3756) : (i64) -> ()
      %3757 = func.call @stack_pop_pointer() : () -> i64
      %3758 = llvm.mlir.addressof @str359 : !llvm.ptr
      %3759 = arith.constant 18 : i64
      %3760 = func.call @cc_make_string(%3758, %3759) : (!llvm.ptr, i64) -> i64
      %3761 = llvm.mlir.addressof @str360 : !llvm.ptr
      %3762 = arith.constant 15 : i64
      %3763 = func.call @cc_make_string(%3761, %3762) : (!llvm.ptr, i64) -> i64
      %3764 = func.call @cc_intern(%3760, %3763) : (i64, i64) -> i64
      %3765 = func.call @cc_nil_value() : () -> i64
      %3766 = func.call @cc_cons(%3764, %3765) : (i64, i64) -> i64
      %3767 = func.call @cc_values_pack(%3766) : (i64) -> i64
      %3768 = func.call @cc_set_symbol_value(%3764, %3757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3757) : (i64) -> ()
      %3769 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3769 : i64
    }
    %3770 = func.call @cc_nil_value() : () -> i64
    %3771 = func.call @cc_errorp(%3754) : (i64) -> i64
    %3772 = arith.cmpi ne, %3771, %3770 : i64
    %3773 = scf.if %3772 -> (i64) {
      scf.yield %3754 : i64
    } else {
      %3774 = llvm.mlir.addressof @str361 : !llvm.ptr
      %3775 = func.call @cc_make_function_ref_const(%3774) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3775) : (i64) -> ()
      %3776 = func.call @stack_pop_pointer() : () -> i64
      %3777 = llvm.mlir.addressof @str362 : !llvm.ptr
      %3778 = arith.constant 18 : i64
      %3779 = func.call @cc_make_string(%3777, %3778) : (!llvm.ptr, i64) -> i64
      %3780 = llvm.mlir.addressof @str363 : !llvm.ptr
      %3781 = arith.constant 15 : i64
      %3782 = func.call @cc_make_string(%3780, %3781) : (!llvm.ptr, i64) -> i64
      %3783 = func.call @cc_intern(%3779, %3782) : (i64, i64) -> i64
      %3784 = func.call @cc_nil_value() : () -> i64
      %3785 = func.call @cc_cons(%3783, %3784) : (i64, i64) -> i64
      %3786 = func.call @cc_values_pack(%3785) : (i64) -> i64
      %3787 = func.call @cc_set_symbol_value(%3783, %3776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3776) : (i64) -> ()
      %3788 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3788 : i64
    }
    %3789 = func.call @cc_nil_value() : () -> i64
    %3790 = func.call @cc_errorp(%3773) : (i64) -> i64
    %3791 = arith.cmpi ne, %3790, %3789 : i64
    %3792 = scf.if %3791 -> (i64) {
      scf.yield %3773 : i64
    } else {
      %3793 = llvm.mlir.addressof @str364 : !llvm.ptr
      %3794 = func.call @cc_make_function_ref_const(%3793) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3794) : (i64) -> ()
      %3795 = func.call @stack_pop_pointer() : () -> i64
      %3796 = llvm.mlir.addressof @str365 : !llvm.ptr
      %3797 = arith.constant 18 : i64
      %3798 = func.call @cc_make_string(%3796, %3797) : (!llvm.ptr, i64) -> i64
      %3799 = llvm.mlir.addressof @str366 : !llvm.ptr
      %3800 = arith.constant 15 : i64
      %3801 = func.call @cc_make_string(%3799, %3800) : (!llvm.ptr, i64) -> i64
      %3802 = func.call @cc_intern(%3798, %3801) : (i64, i64) -> i64
      %3803 = func.call @cc_nil_value() : () -> i64
      %3804 = func.call @cc_cons(%3802, %3803) : (i64, i64) -> i64
      %3805 = func.call @cc_values_pack(%3804) : (i64) -> i64
      %3806 = func.call @cc_set_symbol_value(%3802, %3795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3795) : (i64) -> ()
      %3807 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3807 : i64
    }
    %3808 = func.call @cc_nil_value() : () -> i64
    %3809 = func.call @cc_errorp(%3792) : (i64) -> i64
    %3810 = arith.cmpi ne, %3809, %3808 : i64
    %3811 = scf.if %3810 -> (i64) {
      scf.yield %3792 : i64
    } else {
      %3812 = llvm.mlir.addressof @str367 : !llvm.ptr
      %3813 = func.call @cc_make_function_ref_const(%3812) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3813) : (i64) -> ()
      %3814 = func.call @stack_pop_pointer() : () -> i64
      %3815 = llvm.mlir.addressof @str368 : !llvm.ptr
      %3816 = arith.constant 18 : i64
      %3817 = func.call @cc_make_string(%3815, %3816) : (!llvm.ptr, i64) -> i64
      %3818 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3819 = arith.constant 15 : i64
      %3820 = func.call @cc_make_string(%3818, %3819) : (!llvm.ptr, i64) -> i64
      %3821 = func.call @cc_intern(%3817, %3820) : (i64, i64) -> i64
      %3822 = func.call @cc_nil_value() : () -> i64
      %3823 = func.call @cc_cons(%3821, %3822) : (i64, i64) -> i64
      %3824 = func.call @cc_values_pack(%3823) : (i64) -> i64
      %3825 = func.call @cc_set_symbol_value(%3821, %3814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3814) : (i64) -> ()
      %3826 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3826 : i64
    }
    %3827 = func.call @cc_nil_value() : () -> i64
    %3828 = func.call @cc_errorp(%3811) : (i64) -> i64
    %3829 = arith.cmpi ne, %3828, %3827 : i64
    %3830 = scf.if %3829 -> (i64) {
      scf.yield %3811 : i64
    } else {
      %3831 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3832 = func.call @cc_make_function_ref_const(%3831) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3832) : (i64) -> ()
      %3833 = func.call @stack_pop_pointer() : () -> i64
      %3834 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3835 = arith.constant 17 : i64
      %3836 = func.call @cc_make_string(%3834, %3835) : (!llvm.ptr, i64) -> i64
      %3837 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3838 = arith.constant 15 : i64
      %3839 = func.call @cc_make_string(%3837, %3838) : (!llvm.ptr, i64) -> i64
      %3840 = func.call @cc_intern(%3836, %3839) : (i64, i64) -> i64
      %3841 = func.call @cc_nil_value() : () -> i64
      %3842 = func.call @cc_cons(%3840, %3841) : (i64, i64) -> i64
      %3843 = func.call @cc_values_pack(%3842) : (i64) -> i64
      %3844 = func.call @cc_set_symbol_value(%3840, %3833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3833) : (i64) -> ()
      %3845 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3845 : i64
    }
    %3846 = func.call @cc_nil_value() : () -> i64
    %3847 = func.call @cc_errorp(%3830) : (i64) -> i64
    %3848 = arith.cmpi ne, %3847, %3846 : i64
    %3849 = scf.if %3848 -> (i64) {
      scf.yield %3830 : i64
    } else {
      %3850 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3851 = func.call @cc_make_function_ref_const(%3850) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3851) : (i64) -> ()
      %3852 = func.call @stack_pop_pointer() : () -> i64
      %3853 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3854 = arith.constant 17 : i64
      %3855 = func.call @cc_make_string(%3853, %3854) : (!llvm.ptr, i64) -> i64
      %3856 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3857 = arith.constant 15 : i64
      %3858 = func.call @cc_make_string(%3856, %3857) : (!llvm.ptr, i64) -> i64
      %3859 = func.call @cc_intern(%3855, %3858) : (i64, i64) -> i64
      %3860 = func.call @cc_nil_value() : () -> i64
      %3861 = func.call @cc_cons(%3859, %3860) : (i64, i64) -> i64
      %3862 = func.call @cc_values_pack(%3861) : (i64) -> i64
      %3863 = func.call @cc_set_symbol_value(%3859, %3852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3852) : (i64) -> ()
      %3864 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3864 : i64
    }
    %3865 = func.call @cc_nil_value() : () -> i64
    %3866 = func.call @cc_errorp(%3849) : (i64) -> i64
    %3867 = arith.cmpi ne, %3866, %3865 : i64
    %3868 = scf.if %3867 -> (i64) {
      scf.yield %3849 : i64
    } else {
      %3869 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3870 = func.call @cc_make_function_ref_const(%3869) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3870) : (i64) -> ()
      %3871 = func.call @stack_pop_pointer() : () -> i64
      %3872 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3873 = arith.constant 17 : i64
      %3874 = func.call @cc_make_string(%3872, %3873) : (!llvm.ptr, i64) -> i64
      %3875 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3876 = arith.constant 15 : i64
      %3877 = func.call @cc_make_string(%3875, %3876) : (!llvm.ptr, i64) -> i64
      %3878 = func.call @cc_intern(%3874, %3877) : (i64, i64) -> i64
      %3879 = func.call @cc_nil_value() : () -> i64
      %3880 = func.call @cc_cons(%3878, %3879) : (i64, i64) -> i64
      %3881 = func.call @cc_values_pack(%3880) : (i64) -> i64
      %3882 = func.call @cc_set_symbol_value(%3878, %3871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3871) : (i64) -> ()
      %3883 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3883 : i64
    }
    %3884 = func.call @cc_nil_value() : () -> i64
    %3885 = func.call @cc_errorp(%3868) : (i64) -> i64
    %3886 = arith.cmpi ne, %3885, %3884 : i64
    %3887 = scf.if %3886 -> (i64) {
      scf.yield %3868 : i64
    } else {
      %3888 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3889 = func.call @cc_make_function_ref_const(%3888) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3889) : (i64) -> ()
      %3890 = func.call @stack_pop_pointer() : () -> i64
      %3891 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3892 = arith.constant 17 : i64
      %3893 = func.call @cc_make_string(%3891, %3892) : (!llvm.ptr, i64) -> i64
      %3894 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3895 = arith.constant 15 : i64
      %3896 = func.call @cc_make_string(%3894, %3895) : (!llvm.ptr, i64) -> i64
      %3897 = func.call @cc_intern(%3893, %3896) : (i64, i64) -> i64
      %3898 = func.call @cc_nil_value() : () -> i64
      %3899 = func.call @cc_cons(%3897, %3898) : (i64, i64) -> i64
      %3900 = func.call @cc_values_pack(%3899) : (i64) -> i64
      %3901 = func.call @cc_set_symbol_value(%3897, %3890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3890) : (i64) -> ()
      %3902 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3902 : i64
    }
    %3903 = func.call @cc_nil_value() : () -> i64
    %3904 = func.call @cc_errorp(%3887) : (i64) -> i64
    %3905 = arith.cmpi ne, %3904, %3903 : i64
    %3906 = scf.if %3905 -> (i64) {
      scf.yield %3887 : i64
    } else {
      %3907 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3908 = arith.constant 20 : i64
      %3909 = func.call @cc_make_string(%3907, %3908) : (!llvm.ptr, i64) -> i64
      %3910 = func.call @cc_nil_value() : () -> i64
      %3911 = func.call @cc_intern(%3909, %3910) : (i64, i64) -> i64
      %3912 = func.call @cc_nil_value() : () -> i64
      %3913 = func.call @cc_cons(%3911, %3912) : (i64, i64) -> i64
      %3914 = func.call @cc_values_pack(%3913) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3915 = func.call @stack_pop_pointer() : () -> i64
      %3916 = func.call @cc_set_symbol_value(%3911, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_errorp(%3916) : (i64) -> i64
      %3918 = func.call @cc_nil_value() : () -> i64
      %3919 = arith.cmpi ne, %3917, %3918 : i64
      scf.if %3919 {
        func.call @stack_push_pointer(%3916) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3911) : (i64) -> ()
      }
      %3920 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3920 : i64
    }
    %3921 = func.call @cc_nil_value() : () -> i64
    %3922 = func.call @cc_errorp(%3906) : (i64) -> i64
    %3923 = arith.cmpi ne, %3922, %3921 : i64
    %3924 = scf.if %3923 -> (i64) {
      scf.yield %3906 : i64
    } else {
      %3925 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3926 = func.call @cc_make_function_ref_const(%3925) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3926) : (i64) -> ()
      %3927 = func.call @stack_pop_pointer() : () -> i64
      %3928 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3929 = arith.constant 21 : i64
      %3930 = func.call @cc_make_string(%3928, %3929) : (!llvm.ptr, i64) -> i64
      %3931 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3932 = arith.constant 15 : i64
      %3933 = func.call @cc_make_string(%3931, %3932) : (!llvm.ptr, i64) -> i64
      %3934 = func.call @cc_intern(%3930, %3933) : (i64, i64) -> i64
      %3935 = func.call @cc_nil_value() : () -> i64
      %3936 = func.call @cc_cons(%3934, %3935) : (i64, i64) -> i64
      %3937 = func.call @cc_values_pack(%3936) : (i64) -> i64
      %3938 = func.call @cc_set_symbol_value(%3934, %3927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3927) : (i64) -> ()
      %3939 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3939 : i64
    }
    %3940 = func.call @cc_nil_value() : () -> i64
    %3941 = func.call @cc_errorp(%3924) : (i64) -> i64
    %3942 = arith.cmpi ne, %3941, %3940 : i64
    %3943 = scf.if %3942 -> (i64) {
      scf.yield %3924 : i64
    } else {
      %3944 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3945 = func.call @cc_make_function_ref_const(%3944) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3945) : (i64) -> ()
      %3946 = func.call @stack_pop_pointer() : () -> i64
      %3947 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3948 = arith.constant 21 : i64
      %3949 = func.call @cc_make_string(%3947, %3948) : (!llvm.ptr, i64) -> i64
      %3950 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3951 = arith.constant 15 : i64
      %3952 = func.call @cc_make_string(%3950, %3951) : (!llvm.ptr, i64) -> i64
      %3953 = func.call @cc_intern(%3949, %3952) : (i64, i64) -> i64
      %3954 = func.call @cc_nil_value() : () -> i64
      %3955 = func.call @cc_cons(%3953, %3954) : (i64, i64) -> i64
      %3956 = func.call @cc_values_pack(%3955) : (i64) -> i64
      %3957 = func.call @cc_set_symbol_value(%3953, %3946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3946) : (i64) -> ()
      %3958 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3958 : i64
    }
    %3959 = func.call @cc_nil_value() : () -> i64
    %3960 = func.call @cc_errorp(%3943) : (i64) -> i64
    %3961 = arith.cmpi ne, %3960, %3959 : i64
    %3962 = scf.if %3961 -> (i64) {
      scf.yield %3943 : i64
    } else {
      %3963 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3964 = func.call @cc_make_function_ref_const(%3963) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3964) : (i64) -> ()
      %3965 = func.call @stack_pop_pointer() : () -> i64
      %3966 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3967 = arith.constant 21 : i64
      %3968 = func.call @cc_make_string(%3966, %3967) : (!llvm.ptr, i64) -> i64
      %3969 = llvm.mlir.addressof @str391 : !llvm.ptr
      %3970 = arith.constant 15 : i64
      %3971 = func.call @cc_make_string(%3969, %3970) : (!llvm.ptr, i64) -> i64
      %3972 = func.call @cc_intern(%3968, %3971) : (i64, i64) -> i64
      %3973 = func.call @cc_nil_value() : () -> i64
      %3974 = func.call @cc_cons(%3972, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_values_pack(%3974) : (i64) -> i64
      %3976 = func.call @cc_set_symbol_value(%3972, %3965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3965) : (i64) -> ()
      %3977 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3977 : i64
    }
    %3978 = func.call @cc_nil_value() : () -> i64
    %3979 = func.call @cc_errorp(%3962) : (i64) -> i64
    %3980 = arith.cmpi ne, %3979, %3978 : i64
    %3981 = scf.if %3980 -> (i64) {
      scf.yield %3962 : i64
    } else {
      %3982 = llvm.mlir.addressof @str392 : !llvm.ptr
      %3983 = func.call @cc_make_function_ref_const(%3982) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3983) : (i64) -> ()
      %3984 = func.call @stack_pop_pointer() : () -> i64
      %3985 = llvm.mlir.addressof @str393 : !llvm.ptr
      %3986 = arith.constant 21 : i64
      %3987 = func.call @cc_make_string(%3985, %3986) : (!llvm.ptr, i64) -> i64
      %3988 = llvm.mlir.addressof @str394 : !llvm.ptr
      %3989 = arith.constant 15 : i64
      %3990 = func.call @cc_make_string(%3988, %3989) : (!llvm.ptr, i64) -> i64
      %3991 = func.call @cc_intern(%3987, %3990) : (i64, i64) -> i64
      %3992 = func.call @cc_nil_value() : () -> i64
      %3993 = func.call @cc_cons(%3991, %3992) : (i64, i64) -> i64
      %3994 = func.call @cc_values_pack(%3993) : (i64) -> i64
      %3995 = func.call @cc_set_symbol_value(%3991, %3984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3984) : (i64) -> ()
      %3996 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3996 : i64
    }
    %3997 = func.call @cc_nil_value() : () -> i64
    %3998 = func.call @cc_errorp(%3981) : (i64) -> i64
    %3999 = arith.cmpi ne, %3998, %3997 : i64
    %4000 = scf.if %3999 -> (i64) {
      scf.yield %3981 : i64
    } else {
      %4001 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4002 = func.call @cc_make_function_ref_const(%4001) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4002) : (i64) -> ()
      %4003 = func.call @stack_pop_pointer() : () -> i64
      %4004 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4005 = arith.constant 10 : i64
      %4006 = func.call @cc_make_string(%4004, %4005) : (!llvm.ptr, i64) -> i64
      %4007 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4008 = arith.constant 15 : i64
      %4009 = func.call @cc_make_string(%4007, %4008) : (!llvm.ptr, i64) -> i64
      %4010 = func.call @cc_intern(%4006, %4009) : (i64, i64) -> i64
      %4011 = func.call @cc_nil_value() : () -> i64
      %4012 = func.call @cc_cons(%4010, %4011) : (i64, i64) -> i64
      %4013 = func.call @cc_values_pack(%4012) : (i64) -> i64
      %4014 = func.call @cc_set_symbol_value(%4010, %4003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4003) : (i64) -> ()
      %4015 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4015 : i64
    }
    %4016 = func.call @cc_nil_value() : () -> i64
    %4017 = func.call @cc_errorp(%4000) : (i64) -> i64
    %4018 = arith.cmpi ne, %4017, %4016 : i64
    %4019 = scf.if %4018 -> (i64) {
      scf.yield %4000 : i64
    } else {
      %4020 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4021 = func.call @cc_make_function_ref_const(%4020) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4021) : (i64) -> ()
      %4022 = func.call @stack_pop_pointer() : () -> i64
      %4023 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4024 = arith.constant 10 : i64
      %4025 = func.call @cc_make_string(%4023, %4024) : (!llvm.ptr, i64) -> i64
      %4026 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4027 = arith.constant 15 : i64
      %4028 = func.call @cc_make_string(%4026, %4027) : (!llvm.ptr, i64) -> i64
      %4029 = func.call @cc_intern(%4025, %4028) : (i64, i64) -> i64
      %4030 = func.call @cc_nil_value() : () -> i64
      %4031 = func.call @cc_cons(%4029, %4030) : (i64, i64) -> i64
      %4032 = func.call @cc_values_pack(%4031) : (i64) -> i64
      %4033 = func.call @cc_set_symbol_value(%4029, %4022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4022) : (i64) -> ()
      %4034 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4034 : i64
    }
    %4035 = func.call @cc_nil_value() : () -> i64
    %4036 = func.call @cc_errorp(%4019) : (i64) -> i64
    %4037 = arith.cmpi ne, %4036, %4035 : i64
    %4038 = scf.if %4037 -> (i64) {
      scf.yield %4019 : i64
    } else {
      %4039 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4040 = func.call @cc_make_function_ref_const(%4039) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4040) : (i64) -> ()
      %4041 = func.call @stack_pop_pointer() : () -> i64
      %4042 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4043 = arith.constant 10 : i64
      %4044 = func.call @cc_make_string(%4042, %4043) : (!llvm.ptr, i64) -> i64
      %4045 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4046 = arith.constant 15 : i64
      %4047 = func.call @cc_make_string(%4045, %4046) : (!llvm.ptr, i64) -> i64
      %4048 = func.call @cc_intern(%4044, %4047) : (i64, i64) -> i64
      %4049 = func.call @cc_nil_value() : () -> i64
      %4050 = func.call @cc_cons(%4048, %4049) : (i64, i64) -> i64
      %4051 = func.call @cc_values_pack(%4050) : (i64) -> i64
      %4052 = func.call @cc_set_symbol_value(%4048, %4041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4041) : (i64) -> ()
      %4053 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4053 : i64
    }
    %4054 = func.call @cc_nil_value() : () -> i64
    %4055 = func.call @cc_errorp(%4038) : (i64) -> i64
    %4056 = arith.cmpi ne, %4055, %4054 : i64
    %4057 = scf.if %4056 -> (i64) {
      scf.yield %4038 : i64
    } else {
      %4058 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4059 = func.call @cc_make_function_ref_const(%4058) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4059) : (i64) -> ()
      %4060 = func.call @stack_pop_pointer() : () -> i64
      %4061 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4062 = arith.constant 10 : i64
      %4063 = func.call @cc_make_string(%4061, %4062) : (!llvm.ptr, i64) -> i64
      %4064 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4065 = arith.constant 15 : i64
      %4066 = func.call @cc_make_string(%4064, %4065) : (!llvm.ptr, i64) -> i64
      %4067 = func.call @cc_intern(%4063, %4066) : (i64, i64) -> i64
      %4068 = func.call @cc_nil_value() : () -> i64
      %4069 = func.call @cc_cons(%4067, %4068) : (i64, i64) -> i64
      %4070 = func.call @cc_values_pack(%4069) : (i64) -> i64
      %4071 = func.call @cc_set_symbol_value(%4067, %4060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4060) : (i64) -> ()
      %4072 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4072 : i64
    }
    %4073 = func.call @cc_nil_value() : () -> i64
    %4074 = func.call @cc_errorp(%4057) : (i64) -> i64
    %4075 = arith.cmpi ne, %4074, %4073 : i64
    %4076 = scf.if %4075 -> (i64) {
      scf.yield %4057 : i64
    } else {
      %4077 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4078 = func.call @cc_make_function_ref_const(%4077) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4078) : (i64) -> ()
      %4079 = func.call @stack_pop_pointer() : () -> i64
      %4080 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4081 = arith.constant 13 : i64
      %4082 = func.call @cc_make_string(%4080, %4081) : (!llvm.ptr, i64) -> i64
      %4083 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4084 = arith.constant 15 : i64
      %4085 = func.call @cc_make_string(%4083, %4084) : (!llvm.ptr, i64) -> i64
      %4086 = func.call @cc_intern(%4082, %4085) : (i64, i64) -> i64
      %4087 = func.call @cc_nil_value() : () -> i64
      %4088 = func.call @cc_cons(%4086, %4087) : (i64, i64) -> i64
      %4089 = func.call @cc_values_pack(%4088) : (i64) -> i64
      %4090 = func.call @cc_set_symbol_value(%4086, %4079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4079) : (i64) -> ()
      %4091 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4091 : i64
    }
    %4092 = func.call @cc_nil_value() : () -> i64
    %4093 = func.call @cc_errorp(%4076) : (i64) -> i64
    %4094 = arith.cmpi ne, %4093, %4092 : i64
    %4095 = scf.if %4094 -> (i64) {
      scf.yield %4076 : i64
    } else {
      %4096 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4097 = func.call @cc_make_function_ref_const(%4096) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4097) : (i64) -> ()
      %4098 = func.call @stack_pop_pointer() : () -> i64
      %4099 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4100 = arith.constant 13 : i64
      %4101 = func.call @cc_make_string(%4099, %4100) : (!llvm.ptr, i64) -> i64
      %4102 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4103 = arith.constant 15 : i64
      %4104 = func.call @cc_make_string(%4102, %4103) : (!llvm.ptr, i64) -> i64
      %4105 = func.call @cc_intern(%4101, %4104) : (i64, i64) -> i64
      %4106 = func.call @cc_nil_value() : () -> i64
      %4107 = func.call @cc_cons(%4105, %4106) : (i64, i64) -> i64
      %4108 = func.call @cc_values_pack(%4107) : (i64) -> i64
      %4109 = func.call @cc_set_symbol_value(%4105, %4098) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4098) : (i64) -> ()
      %4110 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4110 : i64
    }
    %4111 = func.call @cc_nil_value() : () -> i64
    %4112 = func.call @cc_errorp(%4095) : (i64) -> i64
    %4113 = arith.cmpi ne, %4112, %4111 : i64
    %4114 = scf.if %4113 -> (i64) {
      scf.yield %4095 : i64
    } else {
      %4115 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4116 = func.call @cc_make_function_ref_const(%4115) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4116) : (i64) -> ()
      %4117 = func.call @stack_pop_pointer() : () -> i64
      %4118 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4119 = arith.constant 13 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4122 = arith.constant 15 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_intern(%4120, %4123) : (i64, i64) -> i64
      %4125 = func.call @cc_nil_value() : () -> i64
      %4126 = func.call @cc_cons(%4124, %4125) : (i64, i64) -> i64
      %4127 = func.call @cc_values_pack(%4126) : (i64) -> i64
      %4128 = func.call @cc_set_symbol_value(%4124, %4117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4117) : (i64) -> ()
      %4129 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4129 : i64
    }
    %4130 = func.call @cc_nil_value() : () -> i64
    %4131 = func.call @cc_errorp(%4114) : (i64) -> i64
    %4132 = arith.cmpi ne, %4131, %4130 : i64
    %4133 = scf.if %4132 -> (i64) {
      scf.yield %4114 : i64
    } else {
      %4134 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4135 = func.call @cc_make_function_ref_const(%4134) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4135) : (i64) -> ()
      %4136 = func.call @stack_pop_pointer() : () -> i64
      %4137 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4138 = arith.constant 13 : i64
      %4139 = func.call @cc_make_string(%4137, %4138) : (!llvm.ptr, i64) -> i64
      %4140 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4141 = arith.constant 15 : i64
      %4142 = func.call @cc_make_string(%4140, %4141) : (!llvm.ptr, i64) -> i64
      %4143 = func.call @cc_intern(%4139, %4142) : (i64, i64) -> i64
      %4144 = func.call @cc_nil_value() : () -> i64
      %4145 = func.call @cc_cons(%4143, %4144) : (i64, i64) -> i64
      %4146 = func.call @cc_values_pack(%4145) : (i64) -> i64
      %4147 = func.call @cc_set_symbol_value(%4143, %4136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4136) : (i64) -> ()
      %4148 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4148 : i64
    }
    %4149 = func.call @cc_nil_value() : () -> i64
    %4150 = func.call @cc_errorp(%4133) : (i64) -> i64
    %4151 = arith.cmpi ne, %4150, %4149 : i64
    %4152 = scf.if %4151 -> (i64) {
      scf.yield %4133 : i64
    } else {
      %4153 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4154 = func.call @cc_make_function_ref_const(%4153) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4154) : (i64) -> ()
      %4155 = func.call @stack_pop_pointer() : () -> i64
      %4156 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4157 = arith.constant 5 : i64
      %4158 = func.call @cc_make_string(%4156, %4157) : (!llvm.ptr, i64) -> i64
      %4159 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4160 = arith.constant 15 : i64
      %4161 = func.call @cc_make_string(%4159, %4160) : (!llvm.ptr, i64) -> i64
      %4162 = func.call @cc_intern(%4158, %4161) : (i64, i64) -> i64
      %4163 = func.call @cc_nil_value() : () -> i64
      %4164 = func.call @cc_cons(%4162, %4163) : (i64, i64) -> i64
      %4165 = func.call @cc_values_pack(%4164) : (i64) -> i64
      %4166 = func.call @cc_set_symbol_value(%4162, %4155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4155) : (i64) -> ()
      %4167 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4167 : i64
    }
    %4168 = func.call @cc_nil_value() : () -> i64
    %4169 = func.call @cc_errorp(%4152) : (i64) -> i64
    %4170 = arith.cmpi ne, %4169, %4168 : i64
    %4171 = scf.if %4170 -> (i64) {
      scf.yield %4152 : i64
    } else {
      %4172 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4173 = func.call @cc_make_function_ref_const(%4172) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4173) : (i64) -> ()
      %4174 = func.call @stack_pop_pointer() : () -> i64
      %4175 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4176 = arith.constant 5 : i64
      %4177 = func.call @cc_make_string(%4175, %4176) : (!llvm.ptr, i64) -> i64
      %4178 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4179 = arith.constant 15 : i64
      %4180 = func.call @cc_make_string(%4178, %4179) : (!llvm.ptr, i64) -> i64
      %4181 = func.call @cc_intern(%4177, %4180) : (i64, i64) -> i64
      %4182 = func.call @cc_nil_value() : () -> i64
      %4183 = func.call @cc_cons(%4181, %4182) : (i64, i64) -> i64
      %4184 = func.call @cc_values_pack(%4183) : (i64) -> i64
      %4185 = func.call @cc_set_symbol_value(%4181, %4174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4174) : (i64) -> ()
      %4186 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4186 : i64
    }
    %4187 = func.call @cc_nil_value() : () -> i64
    %4188 = func.call @cc_errorp(%4171) : (i64) -> i64
    %4189 = arith.cmpi ne, %4188, %4187 : i64
    %4190 = scf.if %4189 -> (i64) {
      scf.yield %4171 : i64
    } else {
      %4191 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4192 = func.call @cc_make_function_ref_const(%4191) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4192) : (i64) -> ()
      %4193 = func.call @stack_pop_pointer() : () -> i64
      %4194 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4195 = arith.constant 5 : i64
      %4196 = func.call @cc_make_string(%4194, %4195) : (!llvm.ptr, i64) -> i64
      %4197 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4198 = arith.constant 15 : i64
      %4199 = func.call @cc_make_string(%4197, %4198) : (!llvm.ptr, i64) -> i64
      %4200 = func.call @cc_intern(%4196, %4199) : (i64, i64) -> i64
      %4201 = func.call @cc_nil_value() : () -> i64
      %4202 = func.call @cc_cons(%4200, %4201) : (i64, i64) -> i64
      %4203 = func.call @cc_values_pack(%4202) : (i64) -> i64
      %4204 = func.call @cc_set_symbol_value(%4200, %4193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4193) : (i64) -> ()
      %4205 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4205 : i64
    }
    %4206 = func.call @cc_nil_value() : () -> i64
    %4207 = func.call @cc_errorp(%4190) : (i64) -> i64
    %4208 = arith.cmpi ne, %4207, %4206 : i64
    %4209 = scf.if %4208 -> (i64) {
      scf.yield %4190 : i64
    } else {
      %4210 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4211 = func.call @cc_make_function_ref_const(%4210) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4211) : (i64) -> ()
      %4212 = func.call @stack_pop_pointer() : () -> i64
      %4213 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4214 = arith.constant 5 : i64
      %4215 = func.call @cc_make_string(%4213, %4214) : (!llvm.ptr, i64) -> i64
      %4216 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4217 = arith.constant 15 : i64
      %4218 = func.call @cc_make_string(%4216, %4217) : (!llvm.ptr, i64) -> i64
      %4219 = func.call @cc_intern(%4215, %4218) : (i64, i64) -> i64
      %4220 = func.call @cc_nil_value() : () -> i64
      %4221 = func.call @cc_cons(%4219, %4220) : (i64, i64) -> i64
      %4222 = func.call @cc_values_pack(%4221) : (i64) -> i64
      %4223 = func.call @cc_set_symbol_value(%4219, %4212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4224 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4224 : i64
    }
    %4225 = func.call @cc_nil_value() : () -> i64
    %4226 = func.call @cc_errorp(%4209) : (i64) -> i64
    %4227 = arith.cmpi ne, %4226, %4225 : i64
    %4228 = scf.if %4227 -> (i64) {
      scf.yield %4209 : i64
    } else {
      %4229 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4230 = func.call @cc_make_function_ref_const(%4229) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4230) : (i64) -> ()
      %4231 = func.call @stack_pop_pointer() : () -> i64
      %4232 = llvm.mlir.addressof @str432 : !llvm.ptr
      %4233 = arith.constant 4 : i64
      %4234 = func.call @cc_make_string(%4232, %4233) : (!llvm.ptr, i64) -> i64
      %4235 = llvm.mlir.addressof @str433 : !llvm.ptr
      %4236 = arith.constant 15 : i64
      %4237 = func.call @cc_make_string(%4235, %4236) : (!llvm.ptr, i64) -> i64
      %4238 = func.call @cc_intern(%4234, %4237) : (i64, i64) -> i64
      %4239 = func.call @cc_nil_value() : () -> i64
      %4240 = func.call @cc_cons(%4238, %4239) : (i64, i64) -> i64
      %4241 = func.call @cc_values_pack(%4240) : (i64) -> i64
      %4242 = func.call @cc_set_symbol_value(%4238, %4231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4231) : (i64) -> ()
      %4243 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4243 : i64
    }
    %4244 = func.call @cc_nil_value() : () -> i64
    %4245 = func.call @cc_errorp(%4228) : (i64) -> i64
    %4246 = arith.cmpi ne, %4245, %4244 : i64
    %4247 = scf.if %4246 -> (i64) {
      scf.yield %4228 : i64
    } else {
      %4248 = llvm.mlir.addressof @str434 : !llvm.ptr
      %4249 = func.call @cc_make_function_ref_const(%4248) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4249) : (i64) -> ()
      %4250 = func.call @stack_pop_pointer() : () -> i64
      %4251 = llvm.mlir.addressof @str435 : !llvm.ptr
      %4252 = arith.constant 4 : i64
      %4253 = func.call @cc_make_string(%4251, %4252) : (!llvm.ptr, i64) -> i64
      %4254 = llvm.mlir.addressof @str436 : !llvm.ptr
      %4255 = arith.constant 15 : i64
      %4256 = func.call @cc_make_string(%4254, %4255) : (!llvm.ptr, i64) -> i64
      %4257 = func.call @cc_intern(%4253, %4256) : (i64, i64) -> i64
      %4258 = func.call @cc_nil_value() : () -> i64
      %4259 = func.call @cc_cons(%4257, %4258) : (i64, i64) -> i64
      %4260 = func.call @cc_values_pack(%4259) : (i64) -> i64
      %4261 = func.call @cc_set_symbol_value(%4257, %4250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4250) : (i64) -> ()
      %4262 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4262 : i64
    }
    %4263 = func.call @cc_nil_value() : () -> i64
    %4264 = func.call @cc_errorp(%4247) : (i64) -> i64
    %4265 = arith.cmpi ne, %4264, %4263 : i64
    %4266 = scf.if %4265 -> (i64) {
      scf.yield %4247 : i64
    } else {
      %4267 = llvm.mlir.addressof @str437 : !llvm.ptr
      %4268 = func.call @cc_make_function_ref_const(%4267) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4268) : (i64) -> ()
      %4269 = func.call @stack_pop_pointer() : () -> i64
      %4270 = llvm.mlir.addressof @str438 : !llvm.ptr
      %4271 = arith.constant 4 : i64
      %4272 = func.call @cc_make_string(%4270, %4271) : (!llvm.ptr, i64) -> i64
      %4273 = llvm.mlir.addressof @str439 : !llvm.ptr
      %4274 = arith.constant 15 : i64
      %4275 = func.call @cc_make_string(%4273, %4274) : (!llvm.ptr, i64) -> i64
      %4276 = func.call @cc_intern(%4272, %4275) : (i64, i64) -> i64
      %4277 = func.call @cc_nil_value() : () -> i64
      %4278 = func.call @cc_cons(%4276, %4277) : (i64, i64) -> i64
      %4279 = func.call @cc_values_pack(%4278) : (i64) -> i64
      %4280 = func.call @cc_set_symbol_value(%4276, %4269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4269) : (i64) -> ()
      %4281 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4281 : i64
    }
    %4282 = func.call @cc_nil_value() : () -> i64
    %4283 = func.call @cc_errorp(%4266) : (i64) -> i64
    %4284 = arith.cmpi ne, %4283, %4282 : i64
    %4285 = scf.if %4284 -> (i64) {
      scf.yield %4266 : i64
    } else {
      %4286 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4287 = func.call @cc_make_function_ref_const(%4286) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4287) : (i64) -> ()
      %4288 = func.call @stack_pop_pointer() : () -> i64
      %4289 = llvm.mlir.addressof @str441 : !llvm.ptr
      %4290 = arith.constant 4 : i64
      %4291 = func.call @cc_make_string(%4289, %4290) : (!llvm.ptr, i64) -> i64
      %4292 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4293 = arith.constant 15 : i64
      %4294 = func.call @cc_make_string(%4292, %4293) : (!llvm.ptr, i64) -> i64
      %4295 = func.call @cc_intern(%4291, %4294) : (i64, i64) -> i64
      %4296 = func.call @cc_nil_value() : () -> i64
      %4297 = func.call @cc_cons(%4295, %4296) : (i64, i64) -> i64
      %4298 = func.call @cc_values_pack(%4297) : (i64) -> i64
      %4299 = func.call @cc_set_symbol_value(%4295, %4288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4288) : (i64) -> ()
      %4300 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4300 : i64
    }
    %4301 = func.call @cc_nil_value() : () -> i64
    %4302 = func.call @cc_errorp(%4285) : (i64) -> i64
    %4303 = arith.cmpi ne, %4302, %4301 : i64
    %4304 = scf.if %4303 -> (i64) {
      scf.yield %4285 : i64
    } else {
      %4305 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4306 = func.call @cc_make_function_ref_const(%4305) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4306) : (i64) -> ()
      %4307 = func.call @stack_pop_pointer() : () -> i64
      %4308 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4309 = arith.constant 17 : i64
      %4310 = func.call @cc_make_string(%4308, %4309) : (!llvm.ptr, i64) -> i64
      %4311 = llvm.mlir.addressof @str445 : !llvm.ptr
      %4312 = arith.constant 15 : i64
      %4313 = func.call @cc_make_string(%4311, %4312) : (!llvm.ptr, i64) -> i64
      %4314 = func.call @cc_intern(%4310, %4313) : (i64, i64) -> i64
      %4315 = func.call @cc_nil_value() : () -> i64
      %4316 = func.call @cc_cons(%4314, %4315) : (i64, i64) -> i64
      %4317 = func.call @cc_values_pack(%4316) : (i64) -> i64
      %4318 = func.call @cc_set_symbol_value(%4314, %4307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4307) : (i64) -> ()
      %4319 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4319 : i64
    }
    %4320 = func.call @cc_nil_value() : () -> i64
    %4321 = func.call @cc_errorp(%4304) : (i64) -> i64
    %4322 = arith.cmpi ne, %4321, %4320 : i64
    %4323 = scf.if %4322 -> (i64) {
      scf.yield %4304 : i64
    } else {
      %4324 = llvm.mlir.addressof @str446 : !llvm.ptr
      %4325 = func.call @cc_make_function_ref_const(%4324) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4325) : (i64) -> ()
      %4326 = func.call @stack_pop_pointer() : () -> i64
      %4327 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4328 = arith.constant 17 : i64
      %4329 = func.call @cc_make_string(%4327, %4328) : (!llvm.ptr, i64) -> i64
      %4330 = llvm.mlir.addressof @str448 : !llvm.ptr
      %4331 = arith.constant 15 : i64
      %4332 = func.call @cc_make_string(%4330, %4331) : (!llvm.ptr, i64) -> i64
      %4333 = func.call @cc_intern(%4329, %4332) : (i64, i64) -> i64
      %4334 = func.call @cc_nil_value() : () -> i64
      %4335 = func.call @cc_cons(%4333, %4334) : (i64, i64) -> i64
      %4336 = func.call @cc_values_pack(%4335) : (i64) -> i64
      %4337 = func.call @cc_set_symbol_value(%4333, %4326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4326) : (i64) -> ()
      %4338 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4338 : i64
    }
    %4339 = func.call @cc_nil_value() : () -> i64
    %4340 = func.call @cc_errorp(%4323) : (i64) -> i64
    %4341 = arith.cmpi ne, %4340, %4339 : i64
    %4342 = scf.if %4341 -> (i64) {
      scf.yield %4323 : i64
    } else {
      %4343 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4344 = func.call @cc_make_function_ref_const(%4343) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4344) : (i64) -> ()
      %4345 = func.call @stack_pop_pointer() : () -> i64
      %4346 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4347 = arith.constant 17 : i64
      %4348 = func.call @cc_make_string(%4346, %4347) : (!llvm.ptr, i64) -> i64
      %4349 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4350 = arith.constant 15 : i64
      %4351 = func.call @cc_make_string(%4349, %4350) : (!llvm.ptr, i64) -> i64
      %4352 = func.call @cc_intern(%4348, %4351) : (i64, i64) -> i64
      %4353 = func.call @cc_nil_value() : () -> i64
      %4354 = func.call @cc_cons(%4352, %4353) : (i64, i64) -> i64
      %4355 = func.call @cc_values_pack(%4354) : (i64) -> i64
      %4356 = func.call @cc_set_symbol_value(%4352, %4345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4345) : (i64) -> ()
      %4357 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4357 : i64
    }
    %4358 = func.call @cc_nil_value() : () -> i64
    %4359 = func.call @cc_errorp(%4342) : (i64) -> i64
    %4360 = arith.cmpi ne, %4359, %4358 : i64
    %4361 = scf.if %4360 -> (i64) {
      scf.yield %4342 : i64
    } else {
      %4362 = llvm.mlir.addressof @str452 : !llvm.ptr
      %4363 = func.call @cc_make_function_ref_const(%4362) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4363) : (i64) -> ()
      %4364 = func.call @stack_pop_pointer() : () -> i64
      %4365 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4366 = arith.constant 17 : i64
      %4367 = func.call @cc_make_string(%4365, %4366) : (!llvm.ptr, i64) -> i64
      %4368 = llvm.mlir.addressof @str454 : !llvm.ptr
      %4369 = arith.constant 15 : i64
      %4370 = func.call @cc_make_string(%4368, %4369) : (!llvm.ptr, i64) -> i64
      %4371 = func.call @cc_intern(%4367, %4370) : (i64, i64) -> i64
      %4372 = func.call @cc_nil_value() : () -> i64
      %4373 = func.call @cc_cons(%4371, %4372) : (i64, i64) -> i64
      %4374 = func.call @cc_values_pack(%4373) : (i64) -> i64
      %4375 = func.call @cc_set_symbol_value(%4371, %4364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4364) : (i64) -> ()
      %4376 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4376 : i64
    }
    %4377 = func.call @cc_nil_value() : () -> i64
    %4378 = func.call @cc_errorp(%4361) : (i64) -> i64
    %4379 = arith.cmpi ne, %4378, %4377 : i64
    %4380 = scf.if %4379 -> (i64) {
      scf.yield %4361 : i64
    } else {
      %4381 = llvm.mlir.addressof @str455 : !llvm.ptr
      %4382 = func.call @cc_make_function_ref_const(%4381) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4382) : (i64) -> ()
      %4383 = func.call @stack_pop_pointer() : () -> i64
      %4384 = llvm.mlir.addressof @str456 : !llvm.ptr
      %4385 = arith.constant 9 : i64
      %4386 = func.call @cc_make_string(%4384, %4385) : (!llvm.ptr, i64) -> i64
      %4387 = llvm.mlir.addressof @str457 : !llvm.ptr
      %4388 = arith.constant 15 : i64
      %4389 = func.call @cc_make_string(%4387, %4388) : (!llvm.ptr, i64) -> i64
      %4390 = func.call @cc_intern(%4386, %4389) : (i64, i64) -> i64
      %4391 = func.call @cc_nil_value() : () -> i64
      %4392 = func.call @cc_cons(%4390, %4391) : (i64, i64) -> i64
      %4393 = func.call @cc_values_pack(%4392) : (i64) -> i64
      %4394 = func.call @cc_set_symbol_value(%4390, %4383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4383) : (i64) -> ()
      %4395 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4395 : i64
    }
    %4396 = func.call @cc_nil_value() : () -> i64
    %4397 = func.call @cc_errorp(%4380) : (i64) -> i64
    %4398 = arith.cmpi ne, %4397, %4396 : i64
    %4399 = scf.if %4398 -> (i64) {
      scf.yield %4380 : i64
    } else {
      %4400 = llvm.mlir.addressof @str458 : !llvm.ptr
      %4401 = func.call @cc_make_function_ref_const(%4400) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4401) : (i64) -> ()
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = llvm.mlir.addressof @str459 : !llvm.ptr
      %4404 = arith.constant 9 : i64
      %4405 = func.call @cc_make_string(%4403, %4404) : (!llvm.ptr, i64) -> i64
      %4406 = llvm.mlir.addressof @str460 : !llvm.ptr
      %4407 = arith.constant 15 : i64
      %4408 = func.call @cc_make_string(%4406, %4407) : (!llvm.ptr, i64) -> i64
      %4409 = func.call @cc_intern(%4405, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_nil_value() : () -> i64
      %4411 = func.call @cc_cons(%4409, %4410) : (i64, i64) -> i64
      %4412 = func.call @cc_values_pack(%4411) : (i64) -> i64
      %4413 = func.call @cc_set_symbol_value(%4409, %4402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4402) : (i64) -> ()
      %4414 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4414 : i64
    }
    %4415 = func.call @cc_nil_value() : () -> i64
    %4416 = func.call @cc_errorp(%4399) : (i64) -> i64
    %4417 = arith.cmpi ne, %4416, %4415 : i64
    %4418 = scf.if %4417 -> (i64) {
      scf.yield %4399 : i64
    } else {
      %4419 = llvm.mlir.addressof @str461 : !llvm.ptr
      %4420 = func.call @cc_make_function_ref_const(%4419) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4420) : (i64) -> ()
      %4421 = func.call @stack_pop_pointer() : () -> i64
      %4422 = llvm.mlir.addressof @str462 : !llvm.ptr
      %4423 = arith.constant 9 : i64
      %4424 = func.call @cc_make_string(%4422, %4423) : (!llvm.ptr, i64) -> i64
      %4425 = llvm.mlir.addressof @str463 : !llvm.ptr
      %4426 = arith.constant 15 : i64
      %4427 = func.call @cc_make_string(%4425, %4426) : (!llvm.ptr, i64) -> i64
      %4428 = func.call @cc_intern(%4424, %4427) : (i64, i64) -> i64
      %4429 = func.call @cc_nil_value() : () -> i64
      %4430 = func.call @cc_cons(%4428, %4429) : (i64, i64) -> i64
      %4431 = func.call @cc_values_pack(%4430) : (i64) -> i64
      %4432 = func.call @cc_set_symbol_value(%4428, %4421) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4421) : (i64) -> ()
      %4433 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4433 : i64
    }
    %4434 = func.call @cc_nil_value() : () -> i64
    %4435 = func.call @cc_errorp(%4418) : (i64) -> i64
    %4436 = arith.cmpi ne, %4435, %4434 : i64
    %4437 = scf.if %4436 -> (i64) {
      scf.yield %4418 : i64
    } else {
      %4438 = llvm.mlir.addressof @str464 : !llvm.ptr
      %4439 = func.call @cc_make_function_ref_const(%4438) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4439) : (i64) -> ()
      %4440 = func.call @stack_pop_pointer() : () -> i64
      %4441 = llvm.mlir.addressof @str465 : !llvm.ptr
      %4442 = arith.constant 9 : i64
      %4443 = func.call @cc_make_string(%4441, %4442) : (!llvm.ptr, i64) -> i64
      %4444 = llvm.mlir.addressof @str466 : !llvm.ptr
      %4445 = arith.constant 15 : i64
      %4446 = func.call @cc_make_string(%4444, %4445) : (!llvm.ptr, i64) -> i64
      %4447 = func.call @cc_intern(%4443, %4446) : (i64, i64) -> i64
      %4448 = func.call @cc_nil_value() : () -> i64
      %4449 = func.call @cc_cons(%4447, %4448) : (i64, i64) -> i64
      %4450 = func.call @cc_values_pack(%4449) : (i64) -> i64
      %4451 = func.call @cc_set_symbol_value(%4447, %4440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4440) : (i64) -> ()
      %4452 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4452 : i64
    }
    %4453 = func.call @cc_nil_value() : () -> i64
    %4454 = func.call @cc_errorp(%4437) : (i64) -> i64
    %4455 = arith.cmpi ne, %4454, %4453 : i64
    %4456 = scf.if %4455 -> (i64) {
      scf.yield %4437 : i64
    } else {
      %4457 = llvm.mlir.addressof @str467 : !llvm.ptr
      %4458 = func.call @cc_make_function_ref_const(%4457) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4458) : (i64) -> ()
      %4459 = func.call @stack_pop_pointer() : () -> i64
      %4460 = llvm.mlir.addressof @str468 : !llvm.ptr
      %4461 = arith.constant 8 : i64
      %4462 = func.call @cc_make_string(%4460, %4461) : (!llvm.ptr, i64) -> i64
      %4463 = llvm.mlir.addressof @str469 : !llvm.ptr
      %4464 = arith.constant 15 : i64
      %4465 = func.call @cc_make_string(%4463, %4464) : (!llvm.ptr, i64) -> i64
      %4466 = func.call @cc_intern(%4462, %4465) : (i64, i64) -> i64
      %4467 = func.call @cc_nil_value() : () -> i64
      %4468 = func.call @cc_cons(%4466, %4467) : (i64, i64) -> i64
      %4469 = func.call @cc_values_pack(%4468) : (i64) -> i64
      %4470 = func.call @cc_set_symbol_value(%4466, %4459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4459) : (i64) -> ()
      %4471 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4471 : i64
    }
    %4472 = func.call @cc_nil_value() : () -> i64
    %4473 = func.call @cc_errorp(%4456) : (i64) -> i64
    %4474 = arith.cmpi ne, %4473, %4472 : i64
    %4475 = scf.if %4474 -> (i64) {
      scf.yield %4456 : i64
    } else {
      %4476 = llvm.mlir.addressof @str470 : !llvm.ptr
      %4477 = func.call @cc_make_function_ref_const(%4476) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4477) : (i64) -> ()
      %4478 = func.call @stack_pop_pointer() : () -> i64
      %4479 = llvm.mlir.addressof @str471 : !llvm.ptr
      %4480 = arith.constant 8 : i64
      %4481 = func.call @cc_make_string(%4479, %4480) : (!llvm.ptr, i64) -> i64
      %4482 = llvm.mlir.addressof @str472 : !llvm.ptr
      %4483 = arith.constant 15 : i64
      %4484 = func.call @cc_make_string(%4482, %4483) : (!llvm.ptr, i64) -> i64
      %4485 = func.call @cc_intern(%4481, %4484) : (i64, i64) -> i64
      %4486 = func.call @cc_nil_value() : () -> i64
      %4487 = func.call @cc_cons(%4485, %4486) : (i64, i64) -> i64
      %4488 = func.call @cc_values_pack(%4487) : (i64) -> i64
      %4489 = func.call @cc_set_symbol_value(%4485, %4478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4478) : (i64) -> ()
      %4490 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4490 : i64
    }
    %4491 = func.call @cc_nil_value() : () -> i64
    %4492 = func.call @cc_errorp(%4475) : (i64) -> i64
    %4493 = arith.cmpi ne, %4492, %4491 : i64
    %4494 = scf.if %4493 -> (i64) {
      scf.yield %4475 : i64
    } else {
      %4495 = llvm.mlir.addressof @str473 : !llvm.ptr
      %4496 = func.call @cc_make_function_ref_const(%4495) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4496) : (i64) -> ()
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = llvm.mlir.addressof @str474 : !llvm.ptr
      %4499 = arith.constant 8 : i64
      %4500 = func.call @cc_make_string(%4498, %4499) : (!llvm.ptr, i64) -> i64
      %4501 = llvm.mlir.addressof @str475 : !llvm.ptr
      %4502 = arith.constant 15 : i64
      %4503 = func.call @cc_make_string(%4501, %4502) : (!llvm.ptr, i64) -> i64
      %4504 = func.call @cc_intern(%4500, %4503) : (i64, i64) -> i64
      %4505 = func.call @cc_nil_value() : () -> i64
      %4506 = func.call @cc_cons(%4504, %4505) : (i64, i64) -> i64
      %4507 = func.call @cc_values_pack(%4506) : (i64) -> i64
      %4508 = func.call @cc_set_symbol_value(%4504, %4497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4497) : (i64) -> ()
      %4509 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4509 : i64
    }
    %4510 = func.call @cc_nil_value() : () -> i64
    %4511 = func.call @cc_errorp(%4494) : (i64) -> i64
    %4512 = arith.cmpi ne, %4511, %4510 : i64
    %4513 = scf.if %4512 -> (i64) {
      scf.yield %4494 : i64
    } else {
      %4514 = llvm.mlir.addressof @str476 : !llvm.ptr
      %4515 = func.call @cc_make_function_ref_const(%4514) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4515) : (i64) -> ()
      %4516 = func.call @stack_pop_pointer() : () -> i64
      %4517 = llvm.mlir.addressof @str477 : !llvm.ptr
      %4518 = arith.constant 8 : i64
      %4519 = func.call @cc_make_string(%4517, %4518) : (!llvm.ptr, i64) -> i64
      %4520 = llvm.mlir.addressof @str478 : !llvm.ptr
      %4521 = arith.constant 15 : i64
      %4522 = func.call @cc_make_string(%4520, %4521) : (!llvm.ptr, i64) -> i64
      %4523 = func.call @cc_intern(%4519, %4522) : (i64, i64) -> i64
      %4524 = func.call @cc_nil_value() : () -> i64
      %4525 = func.call @cc_cons(%4523, %4524) : (i64, i64) -> i64
      %4526 = func.call @cc_values_pack(%4525) : (i64) -> i64
      %4527 = func.call @cc_set_symbol_value(%4523, %4516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4516) : (i64) -> ()
      %4528 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4528 : i64
    }
    %4529 = func.call @cc_nil_value() : () -> i64
    %4530 = func.call @cc_errorp(%4513) : (i64) -> i64
    %4531 = arith.cmpi ne, %4530, %4529 : i64
    %4532 = scf.if %4531 -> (i64) {
      scf.yield %4513 : i64
    } else {
      %4533 = llvm.mlir.addressof @str479 : !llvm.ptr
      %4534 = func.call @cc_make_function_ref_const(%4533) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4534) : (i64) -> ()
      %4535 = func.call @stack_pop_pointer() : () -> i64
      %4536 = llvm.mlir.addressof @str480 : !llvm.ptr
      %4537 = arith.constant 9 : i64
      %4538 = func.call @cc_make_string(%4536, %4537) : (!llvm.ptr, i64) -> i64
      %4539 = llvm.mlir.addressof @str481 : !llvm.ptr
      %4540 = arith.constant 15 : i64
      %4541 = func.call @cc_make_string(%4539, %4540) : (!llvm.ptr, i64) -> i64
      %4542 = func.call @cc_intern(%4538, %4541) : (i64, i64) -> i64
      %4543 = func.call @cc_nil_value() : () -> i64
      %4544 = func.call @cc_cons(%4542, %4543) : (i64, i64) -> i64
      %4545 = func.call @cc_values_pack(%4544) : (i64) -> i64
      %4546 = func.call @cc_set_symbol_value(%4542, %4535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4535) : (i64) -> ()
      %4547 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4547 : i64
    }
    %4548 = func.call @cc_nil_value() : () -> i64
    %4549 = func.call @cc_errorp(%4532) : (i64) -> i64
    %4550 = arith.cmpi ne, %4549, %4548 : i64
    %4551 = scf.if %4550 -> (i64) {
      scf.yield %4532 : i64
    } else {
      %4552 = llvm.mlir.addressof @str482 : !llvm.ptr
      %4553 = func.call @cc_make_function_ref_const(%4552) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4553) : (i64) -> ()
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = llvm.mlir.addressof @str483 : !llvm.ptr
      %4556 = arith.constant 9 : i64
      %4557 = func.call @cc_make_string(%4555, %4556) : (!llvm.ptr, i64) -> i64
      %4558 = llvm.mlir.addressof @str484 : !llvm.ptr
      %4559 = arith.constant 15 : i64
      %4560 = func.call @cc_make_string(%4558, %4559) : (!llvm.ptr, i64) -> i64
      %4561 = func.call @cc_intern(%4557, %4560) : (i64, i64) -> i64
      %4562 = func.call @cc_nil_value() : () -> i64
      %4563 = func.call @cc_cons(%4561, %4562) : (i64, i64) -> i64
      %4564 = func.call @cc_values_pack(%4563) : (i64) -> i64
      %4565 = func.call @cc_set_symbol_value(%4561, %4554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4554) : (i64) -> ()
      %4566 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4566 : i64
    }
    %4567 = func.call @cc_nil_value() : () -> i64
    %4568 = func.call @cc_errorp(%4551) : (i64) -> i64
    %4569 = arith.cmpi ne, %4568, %4567 : i64
    %4570 = scf.if %4569 -> (i64) {
      scf.yield %4551 : i64
    } else {
      %4571 = llvm.mlir.addressof @str485 : !llvm.ptr
      %4572 = func.call @cc_make_function_ref_const(%4571) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4572) : (i64) -> ()
      %4573 = func.call @stack_pop_pointer() : () -> i64
      %4574 = llvm.mlir.addressof @str486 : !llvm.ptr
      %4575 = arith.constant 9 : i64
      %4576 = func.call @cc_make_string(%4574, %4575) : (!llvm.ptr, i64) -> i64
      %4577 = llvm.mlir.addressof @str487 : !llvm.ptr
      %4578 = arith.constant 15 : i64
      %4579 = func.call @cc_make_string(%4577, %4578) : (!llvm.ptr, i64) -> i64
      %4580 = func.call @cc_intern(%4576, %4579) : (i64, i64) -> i64
      %4581 = func.call @cc_nil_value() : () -> i64
      %4582 = func.call @cc_cons(%4580, %4581) : (i64, i64) -> i64
      %4583 = func.call @cc_values_pack(%4582) : (i64) -> i64
      %4584 = func.call @cc_set_symbol_value(%4580, %4573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4573) : (i64) -> ()
      %4585 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4585 : i64
    }
    %4586 = func.call @cc_nil_value() : () -> i64
    %4587 = func.call @cc_errorp(%4570) : (i64) -> i64
    %4588 = arith.cmpi ne, %4587, %4586 : i64
    %4589 = scf.if %4588 -> (i64) {
      scf.yield %4570 : i64
    } else {
      %4590 = llvm.mlir.addressof @str488 : !llvm.ptr
      %4591 = func.call @cc_make_function_ref_const(%4590) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4591) : (i64) -> ()
      %4592 = func.call @stack_pop_pointer() : () -> i64
      %4593 = llvm.mlir.addressof @str489 : !llvm.ptr
      %4594 = arith.constant 9 : i64
      %4595 = func.call @cc_make_string(%4593, %4594) : (!llvm.ptr, i64) -> i64
      %4596 = llvm.mlir.addressof @str490 : !llvm.ptr
      %4597 = arith.constant 15 : i64
      %4598 = func.call @cc_make_string(%4596, %4597) : (!llvm.ptr, i64) -> i64
      %4599 = func.call @cc_intern(%4595, %4598) : (i64, i64) -> i64
      %4600 = func.call @cc_nil_value() : () -> i64
      %4601 = func.call @cc_cons(%4599, %4600) : (i64, i64) -> i64
      %4602 = func.call @cc_values_pack(%4601) : (i64) -> i64
      %4603 = func.call @cc_set_symbol_value(%4599, %4592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4592) : (i64) -> ()
      %4604 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4604 : i64
    }
    %4605 = func.call @cc_nil_value() : () -> i64
    %4606 = func.call @cc_errorp(%4589) : (i64) -> i64
    %4607 = arith.cmpi ne, %4606, %4605 : i64
    %4608 = scf.if %4607 -> (i64) {
      scf.yield %4589 : i64
    } else {
      %4609 = llvm.mlir.addressof @str491 : !llvm.ptr
      %4610 = func.call @cc_make_function_ref_const(%4609) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4610) : (i64) -> ()
      %4611 = func.call @stack_pop_pointer() : () -> i64
      %4612 = llvm.mlir.addressof @str492 : !llvm.ptr
      %4613 = arith.constant 13 : i64
      %4614 = func.call @cc_make_string(%4612, %4613) : (!llvm.ptr, i64) -> i64
      %4615 = llvm.mlir.addressof @str493 : !llvm.ptr
      %4616 = arith.constant 15 : i64
      %4617 = func.call @cc_make_string(%4615, %4616) : (!llvm.ptr, i64) -> i64
      %4618 = func.call @cc_intern(%4614, %4617) : (i64, i64) -> i64
      %4619 = func.call @cc_nil_value() : () -> i64
      %4620 = func.call @cc_cons(%4618, %4619) : (i64, i64) -> i64
      %4621 = func.call @cc_values_pack(%4620) : (i64) -> i64
      %4622 = func.call @cc_set_symbol_value(%4618, %4611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4611) : (i64) -> ()
      %4623 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4623 : i64
    }
    %4624 = func.call @cc_nil_value() : () -> i64
    %4625 = func.call @cc_errorp(%4608) : (i64) -> i64
    %4626 = arith.cmpi ne, %4625, %4624 : i64
    %4627 = scf.if %4626 -> (i64) {
      scf.yield %4608 : i64
    } else {
      %4628 = llvm.mlir.addressof @str494 : !llvm.ptr
      %4629 = func.call @cc_make_function_ref_const(%4628) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4629) : (i64) -> ()
      %4630 = func.call @stack_pop_pointer() : () -> i64
      %4631 = llvm.mlir.addressof @str495 : !llvm.ptr
      %4632 = arith.constant 13 : i64
      %4633 = func.call @cc_make_string(%4631, %4632) : (!llvm.ptr, i64) -> i64
      %4634 = llvm.mlir.addressof @str496 : !llvm.ptr
      %4635 = arith.constant 15 : i64
      %4636 = func.call @cc_make_string(%4634, %4635) : (!llvm.ptr, i64) -> i64
      %4637 = func.call @cc_intern(%4633, %4636) : (i64, i64) -> i64
      %4638 = func.call @cc_nil_value() : () -> i64
      %4639 = func.call @cc_cons(%4637, %4638) : (i64, i64) -> i64
      %4640 = func.call @cc_values_pack(%4639) : (i64) -> i64
      %4641 = func.call @cc_set_symbol_value(%4637, %4630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4630) : (i64) -> ()
      %4642 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4642 : i64
    }
    %4643 = func.call @cc_nil_value() : () -> i64
    %4644 = func.call @cc_errorp(%4627) : (i64) -> i64
    %4645 = arith.cmpi ne, %4644, %4643 : i64
    %4646 = scf.if %4645 -> (i64) {
      scf.yield %4627 : i64
    } else {
      %4647 = llvm.mlir.addressof @str497 : !llvm.ptr
      %4648 = func.call @cc_make_function_ref_const(%4647) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4648) : (i64) -> ()
      %4649 = func.call @stack_pop_pointer() : () -> i64
      %4650 = llvm.mlir.addressof @str498 : !llvm.ptr
      %4651 = arith.constant 13 : i64
      %4652 = func.call @cc_make_string(%4650, %4651) : (!llvm.ptr, i64) -> i64
      %4653 = llvm.mlir.addressof @str499 : !llvm.ptr
      %4654 = arith.constant 15 : i64
      %4655 = func.call @cc_make_string(%4653, %4654) : (!llvm.ptr, i64) -> i64
      %4656 = func.call @cc_intern(%4652, %4655) : (i64, i64) -> i64
      %4657 = func.call @cc_nil_value() : () -> i64
      %4658 = func.call @cc_cons(%4656, %4657) : (i64, i64) -> i64
      %4659 = func.call @cc_values_pack(%4658) : (i64) -> i64
      %4660 = func.call @cc_set_symbol_value(%4656, %4649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4649) : (i64) -> ()
      %4661 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4661 : i64
    }
    %4662 = func.call @cc_nil_value() : () -> i64
    %4663 = func.call @cc_errorp(%4646) : (i64) -> i64
    %4664 = arith.cmpi ne, %4663, %4662 : i64
    %4665 = scf.if %4664 -> (i64) {
      scf.yield %4646 : i64
    } else {
      %4666 = llvm.mlir.addressof @str500 : !llvm.ptr
      %4667 = func.call @cc_make_function_ref_const(%4666) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4667) : (i64) -> ()
      %4668 = func.call @stack_pop_pointer() : () -> i64
      %4669 = llvm.mlir.addressof @str501 : !llvm.ptr
      %4670 = arith.constant 13 : i64
      %4671 = func.call @cc_make_string(%4669, %4670) : (!llvm.ptr, i64) -> i64
      %4672 = llvm.mlir.addressof @str502 : !llvm.ptr
      %4673 = arith.constant 15 : i64
      %4674 = func.call @cc_make_string(%4672, %4673) : (!llvm.ptr, i64) -> i64
      %4675 = func.call @cc_intern(%4671, %4674) : (i64, i64) -> i64
      %4676 = func.call @cc_nil_value() : () -> i64
      %4677 = func.call @cc_cons(%4675, %4676) : (i64, i64) -> i64
      %4678 = func.call @cc_values_pack(%4677) : (i64) -> i64
      %4679 = func.call @cc_set_symbol_value(%4675, %4668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4668) : (i64) -> ()
      %4680 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4680 : i64
    }
    %4681 = func.call @cc_nil_value() : () -> i64
    %4682 = func.call @cc_errorp(%4665) : (i64) -> i64
    %4683 = arith.cmpi ne, %4682, %4681 : i64
    %4684 = scf.if %4683 -> (i64) {
      scf.yield %4665 : i64
    } else {
      %4685 = llvm.mlir.addressof @str503 : !llvm.ptr
      %4686 = func.call @cc_make_function_ref_const(%4685) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4686) : (i64) -> ()
      %4687 = func.call @stack_pop_pointer() : () -> i64
      %4688 = llvm.mlir.addressof @str504 : !llvm.ptr
      %4689 = arith.constant 26 : i64
      %4690 = func.call @cc_make_string(%4688, %4689) : (!llvm.ptr, i64) -> i64
      %4691 = llvm.mlir.addressof @str505 : !llvm.ptr
      %4692 = arith.constant 15 : i64
      %4693 = func.call @cc_make_string(%4691, %4692) : (!llvm.ptr, i64) -> i64
      %4694 = func.call @cc_intern(%4690, %4693) : (i64, i64) -> i64
      %4695 = func.call @cc_nil_value() : () -> i64
      %4696 = func.call @cc_cons(%4694, %4695) : (i64, i64) -> i64
      %4697 = func.call @cc_values_pack(%4696) : (i64) -> i64
      %4698 = func.call @cc_set_symbol_value(%4694, %4687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4687) : (i64) -> ()
      %4699 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4699 : i64
    }
    %4700 = func.call @cc_nil_value() : () -> i64
    %4701 = func.call @cc_errorp(%4684) : (i64) -> i64
    %4702 = arith.cmpi ne, %4701, %4700 : i64
    %4703 = scf.if %4702 -> (i64) {
      scf.yield %4684 : i64
    } else {
      %4704 = llvm.mlir.addressof @str506 : !llvm.ptr
      %4705 = func.call @cc_make_function_ref_const(%4704) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4705) : (i64) -> ()
      %4706 = func.call @stack_pop_pointer() : () -> i64
      %4707 = llvm.mlir.addressof @str507 : !llvm.ptr
      %4708 = arith.constant 26 : i64
      %4709 = func.call @cc_make_string(%4707, %4708) : (!llvm.ptr, i64) -> i64
      %4710 = llvm.mlir.addressof @str508 : !llvm.ptr
      %4711 = arith.constant 15 : i64
      %4712 = func.call @cc_make_string(%4710, %4711) : (!llvm.ptr, i64) -> i64
      %4713 = func.call @cc_intern(%4709, %4712) : (i64, i64) -> i64
      %4714 = func.call @cc_nil_value() : () -> i64
      %4715 = func.call @cc_cons(%4713, %4714) : (i64, i64) -> i64
      %4716 = func.call @cc_values_pack(%4715) : (i64) -> i64
      %4717 = func.call @cc_set_symbol_value(%4713, %4706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4706) : (i64) -> ()
      %4718 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4718 : i64
    }
    %4719 = func.call @cc_nil_value() : () -> i64
    %4720 = func.call @cc_errorp(%4703) : (i64) -> i64
    %4721 = arith.cmpi ne, %4720, %4719 : i64
    %4722 = scf.if %4721 -> (i64) {
      scf.yield %4703 : i64
    } else {
      %4723 = llvm.mlir.addressof @str509 : !llvm.ptr
      %4724 = func.call @cc_make_function_ref_const(%4723) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4724) : (i64) -> ()
      %4725 = func.call @stack_pop_pointer() : () -> i64
      %4726 = llvm.mlir.addressof @str510 : !llvm.ptr
      %4727 = arith.constant 26 : i64
      %4728 = func.call @cc_make_string(%4726, %4727) : (!llvm.ptr, i64) -> i64
      %4729 = llvm.mlir.addressof @str511 : !llvm.ptr
      %4730 = arith.constant 15 : i64
      %4731 = func.call @cc_make_string(%4729, %4730) : (!llvm.ptr, i64) -> i64
      %4732 = func.call @cc_intern(%4728, %4731) : (i64, i64) -> i64
      %4733 = func.call @cc_nil_value() : () -> i64
      %4734 = func.call @cc_cons(%4732, %4733) : (i64, i64) -> i64
      %4735 = func.call @cc_values_pack(%4734) : (i64) -> i64
      %4736 = func.call @cc_set_symbol_value(%4732, %4725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4725) : (i64) -> ()
      %4737 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4737 : i64
    }
    %4738 = func.call @cc_nil_value() : () -> i64
    %4739 = func.call @cc_errorp(%4722) : (i64) -> i64
    %4740 = arith.cmpi ne, %4739, %4738 : i64
    %4741 = scf.if %4740 -> (i64) {
      scf.yield %4722 : i64
    } else {
      %4742 = llvm.mlir.addressof @str512 : !llvm.ptr
      %4743 = func.call @cc_make_function_ref_const(%4742) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4743) : (i64) -> ()
      %4744 = func.call @stack_pop_pointer() : () -> i64
      %4745 = llvm.mlir.addressof @str513 : !llvm.ptr
      %4746 = arith.constant 26 : i64
      %4747 = func.call @cc_make_string(%4745, %4746) : (!llvm.ptr, i64) -> i64
      %4748 = llvm.mlir.addressof @str514 : !llvm.ptr
      %4749 = arith.constant 15 : i64
      %4750 = func.call @cc_make_string(%4748, %4749) : (!llvm.ptr, i64) -> i64
      %4751 = func.call @cc_intern(%4747, %4750) : (i64, i64) -> i64
      %4752 = func.call @cc_nil_value() : () -> i64
      %4753 = func.call @cc_cons(%4751, %4752) : (i64, i64) -> i64
      %4754 = func.call @cc_values_pack(%4753) : (i64) -> i64
      %4755 = func.call @cc_set_symbol_value(%4751, %4744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4744) : (i64) -> ()
      %4756 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4756 : i64
    }
    %4757 = func.call @cc_nil_value() : () -> i64
    %4758 = func.call @cc_errorp(%4741) : (i64) -> i64
    %4759 = arith.cmpi ne, %4758, %4757 : i64
    %4760 = scf.if %4759 -> (i64) {
      scf.yield %4741 : i64
    } else {
      %4761 = llvm.mlir.addressof @str515 : !llvm.ptr
      %4762 = func.call @cc_make_function_ref_const(%4761) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4762) : (i64) -> ()
      %4763 = func.call @stack_pop_pointer() : () -> i64
      %4764 = llvm.mlir.addressof @str516 : !llvm.ptr
      %4765 = arith.constant 42 : i64
      %4766 = func.call @cc_make_string(%4764, %4765) : (!llvm.ptr, i64) -> i64
      %4767 = llvm.mlir.addressof @str517 : !llvm.ptr
      %4768 = arith.constant 15 : i64
      %4769 = func.call @cc_make_string(%4767, %4768) : (!llvm.ptr, i64) -> i64
      %4770 = func.call @cc_intern(%4766, %4769) : (i64, i64) -> i64
      %4771 = func.call @cc_nil_value() : () -> i64
      %4772 = func.call @cc_cons(%4770, %4771) : (i64, i64) -> i64
      %4773 = func.call @cc_values_pack(%4772) : (i64) -> i64
      %4774 = func.call @cc_set_symbol_value(%4770, %4763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4763) : (i64) -> ()
      %4775 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4775 : i64
    }
    %4776 = func.call @cc_nil_value() : () -> i64
    %4777 = func.call @cc_errorp(%4760) : (i64) -> i64
    %4778 = arith.cmpi ne, %4777, %4776 : i64
    %4779 = scf.if %4778 -> (i64) {
      scf.yield %4760 : i64
    } else {
      %4780 = llvm.mlir.addressof @str518 : !llvm.ptr
      %4781 = func.call @cc_make_function_ref_const(%4780) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4781) : (i64) -> ()
      %4782 = func.call @stack_pop_pointer() : () -> i64
      %4783 = llvm.mlir.addressof @str519 : !llvm.ptr
      %4784 = arith.constant 42 : i64
      %4785 = func.call @cc_make_string(%4783, %4784) : (!llvm.ptr, i64) -> i64
      %4786 = llvm.mlir.addressof @str520 : !llvm.ptr
      %4787 = arith.constant 15 : i64
      %4788 = func.call @cc_make_string(%4786, %4787) : (!llvm.ptr, i64) -> i64
      %4789 = func.call @cc_intern(%4785, %4788) : (i64, i64) -> i64
      %4790 = func.call @cc_nil_value() : () -> i64
      %4791 = func.call @cc_cons(%4789, %4790) : (i64, i64) -> i64
      %4792 = func.call @cc_values_pack(%4791) : (i64) -> i64
      %4793 = func.call @cc_set_symbol_value(%4789, %4782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4782) : (i64) -> ()
      %4794 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4794 : i64
    }
    %4795 = func.call @cc_nil_value() : () -> i64
    %4796 = func.call @cc_errorp(%4779) : (i64) -> i64
    %4797 = arith.cmpi ne, %4796, %4795 : i64
    %4798 = scf.if %4797 -> (i64) {
      scf.yield %4779 : i64
    } else {
      %4799 = llvm.mlir.addressof @str521 : !llvm.ptr
      %4800 = func.call @cc_make_function_ref_const(%4799) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4800) : (i64) -> ()
      %4801 = func.call @stack_pop_pointer() : () -> i64
      %4802 = llvm.mlir.addressof @str522 : !llvm.ptr
      %4803 = arith.constant 42 : i64
      %4804 = func.call @cc_make_string(%4802, %4803) : (!llvm.ptr, i64) -> i64
      %4805 = llvm.mlir.addressof @str523 : !llvm.ptr
      %4806 = arith.constant 15 : i64
      %4807 = func.call @cc_make_string(%4805, %4806) : (!llvm.ptr, i64) -> i64
      %4808 = func.call @cc_intern(%4804, %4807) : (i64, i64) -> i64
      %4809 = func.call @cc_nil_value() : () -> i64
      %4810 = func.call @cc_cons(%4808, %4809) : (i64, i64) -> i64
      %4811 = func.call @cc_values_pack(%4810) : (i64) -> i64
      %4812 = func.call @cc_set_symbol_value(%4808, %4801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4801) : (i64) -> ()
      %4813 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4813 : i64
    }
    %4814 = func.call @cc_nil_value() : () -> i64
    %4815 = func.call @cc_errorp(%4798) : (i64) -> i64
    %4816 = arith.cmpi ne, %4815, %4814 : i64
    %4817 = scf.if %4816 -> (i64) {
      scf.yield %4798 : i64
    } else {
      %4818 = llvm.mlir.addressof @str524 : !llvm.ptr
      %4819 = func.call @cc_make_function_ref_const(%4818) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4819) : (i64) -> ()
      %4820 = func.call @stack_pop_pointer() : () -> i64
      %4821 = llvm.mlir.addressof @str525 : !llvm.ptr
      %4822 = arith.constant 42 : i64
      %4823 = func.call @cc_make_string(%4821, %4822) : (!llvm.ptr, i64) -> i64
      %4824 = llvm.mlir.addressof @str526 : !llvm.ptr
      %4825 = arith.constant 15 : i64
      %4826 = func.call @cc_make_string(%4824, %4825) : (!llvm.ptr, i64) -> i64
      %4827 = func.call @cc_intern(%4823, %4826) : (i64, i64) -> i64
      %4828 = func.call @cc_nil_value() : () -> i64
      %4829 = func.call @cc_cons(%4827, %4828) : (i64, i64) -> i64
      %4830 = func.call @cc_values_pack(%4829) : (i64) -> i64
      %4831 = func.call @cc_set_symbol_value(%4827, %4820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4820) : (i64) -> ()
      %4832 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4832 : i64
    }
    func.call @stack_push_pointer(%4817) : (i64) -> ()
    %4833 = func.call @stack_pop_pointer() : () -> i64
    %4834 = func.call @cc_multiple_value_list(%4833) : (i64) -> i64
    %4835 = llvm.mlir.addressof @str527 : !llvm.ptr
    %4836 = arith.constant 37 : i64
    %4837 = func.call @cc_make_string(%4835, %4836) : (!llvm.ptr, i64) -> i64
    %4838 = func.call @cc_nil_value() : () -> i64
    %4839 = func.call @cc_intern(%4837, %4838) : (i64, i64) -> i64
    %4840 = func.call @cc_nil_value() : () -> i64
    %4841 = func.call @cc_cons(%4839, %4840) : (i64, i64) -> i64
    %4842 = func.call @cc_values_pack(%4841) : (i64) -> i64
    %4843 = func.call @cc_symbol_value(%4839) : (i64) -> i64
    %4844 = llvm.mlir.addressof @str528 : !llvm.ptr
    %4845 = arith.constant 39 : i64
    %4846 = func.call @cc_make_string(%4844, %4845) : (!llvm.ptr, i64) -> i64
    %4847 = func.call @cc_nil_value() : () -> i64
    %4848 = func.call @cc_intern(%4846, %4847) : (i64, i64) -> i64
    %4849 = func.call @cc_nil_value() : () -> i64
    %4850 = func.call @cc_cons(%4848, %4849) : (i64, i64) -> i64
    %4851 = func.call @cc_values_pack(%4850) : (i64) -> i64
    %4852 = func.call @cc_symbol_value(%4848) : (i64) -> i64
    %4853 = func.call @cc_nil_value() : () -> i64
    %4854 = arith.cmpi ne, %4843, %4853 : i64
    %4855 = scf.if %4854 -> (i64) {
      scf.yield %4852 : i64
    } else {
      scf.yield %4834 : i64
    }
    %4856 = func.call @cc_values_pack(%4855) : (i64) -> i64
    func.call @stack_push_pointer(%4856) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%note-test"() {
    %3566 = llvm.mlir.addressof @str339 : !llvm.ptr
    %3567 = arith.constant 9 : i64
    %3568 = func.call @cc_make_string(%3566, %3567) : (!llvm.ptr, i64) -> i64
    %3569 = func.call @cc_nil_value() : () -> i64
    %3570 = func.call @cc_intern(%3568, %3569) : (i64, i64) -> i64
    %3571 = func.call @cc_nil_value() : () -> i64
    %3572 = func.call @cc_cons(%3570, %3571) : (i64, i64) -> i64
    %3573 = func.call @cc_values_pack(%3572) : (i64) -> i64
    %3574 = llvm.mlir.addressof @str340 : !llvm.ptr
    %3575 = arith.constant 4 : i64
    %3576 = func.call @cc_make_string(%3574, %3575) : (!llvm.ptr, i64) -> i64
    %3577 = func.call @cc_register_function_lambda_list_metadata_raw(%3570, %3576) : (i64, i64) -> i64
    %3578 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%3570, %3578) : (i64, i64) -> ()
    %3579 = func.call @stack_pop_pointer() : () -> i64
    %3580 = func.call @cc_nil_value() : () -> i64
    %3581 = llvm.mlir.addressof @str341 : !llvm.ptr
    %3582 = arith.constant 37 : i64
    %3583 = func.call @cc_make_string(%3581, %3582) : (!llvm.ptr, i64) -> i64
    %3584 = func.call @cc_nil_value() : () -> i64
    %3585 = func.call @cc_intern(%3583, %3584) : (i64, i64) -> i64
    %3586 = func.call @cc_nil_value() : () -> i64
    %3587 = func.call @cc_cons(%3585, %3586) : (i64, i64) -> i64
    %3588 = func.call @cc_values_pack(%3587) : (i64) -> i64
    %3589 = func.call @cc_set_symbol_value(%3585, %3580) : (i64, i64) -> i64
    %3590 = llvm.mlir.addressof @str342 : !llvm.ptr
    %3591 = arith.constant 38 : i64
    %3592 = func.call @cc_make_string(%3590, %3591) : (!llvm.ptr, i64) -> i64
    %3593 = func.call @cc_nil_value() : () -> i64
    %3594 = func.call @cc_intern(%3592, %3593) : (i64, i64) -> i64
    %3595 = func.call @cc_nil_value() : () -> i64
    %3596 = func.call @cc_cons(%3594, %3595) : (i64, i64) -> i64
    %3597 = func.call @cc_values_pack(%3596) : (i64) -> i64
    %3598 = func.call @cc_set_symbol_value(%3594, %3580) : (i64, i64) -> i64
    %3599 = llvm.mlir.addressof @str343 : !llvm.ptr
    %3600 = arith.constant 39 : i64
    %3601 = func.call @cc_make_string(%3599, %3600) : (!llvm.ptr, i64) -> i64
    %3602 = func.call @cc_nil_value() : () -> i64
    %3603 = func.call @cc_intern(%3601, %3602) : (i64, i64) -> i64
    %3604 = func.call @cc_nil_value() : () -> i64
    %3605 = func.call @cc_cons(%3603, %3604) : (i64, i64) -> i64
    %3606 = func.call @cc_values_pack(%3605) : (i64) -> i64
    %3607 = func.call @cc_set_symbol_value(%3603, %3580) : (i64, i64) -> i64
    func.call @stack_push_pointer(%3579) : (i64) -> ()
    %3608 = llvm.mlir.addressof @str344 : !llvm.ptr
    %3609 = arith.constant 19 : i64
    %3610 = func.call @cc_make_string(%3608, %3609) : (!llvm.ptr, i64) -> i64
    %3611 = func.call @cc_nil_value() : () -> i64
    %3612 = func.call @cc_intern(%3610, %3611) : (i64, i64) -> i64
    %3613 = func.call @cc_nil_value() : () -> i64
    %3614 = func.call @cc_cons(%3612, %3613) : (i64, i64) -> i64
    %3615 = func.call @cc_values_pack(%3614) : (i64) -> i64
    %3616 = func.call @cc_symbol_value(%3612) : (i64) -> i64
    func.call @stack_push_pointer(%3616) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %3617 = func.call @stack_pop_pointer() : () -> i64
    %3618 = func.call @stack_pop_pointer() : () -> i64
    %3619 = func.call @stack_pop_pointer() : () -> i64
    %3620 = func.call @cc_gethash(%3619, %3618, %3617) : (i64, i64, i64) -> i64
    func.call @stack_push_pointer(%3620) : (i64) -> ()
    %3621 = func.call @stack_pop_pointer() : () -> i64
    %3622 = func.call @cc_nil_value() : () -> i64
    %3623 = arith.cmpi ne, %3621, %3622 : i64
    scf.if %3623 {
      %3624 = func.call @cc_nil_value() : () -> i64
      %3625 = func.call @cc_nil_value() : () -> i64
      %3626 = func.call @cc_errorp(%3624) : (i64) -> i64
      %3627 = arith.cmpi ne, %3626, %3625 : i64
      %3628 = scf.if %3627 -> (i64) {
        scf.yield %3624 : i64
      } else {
        func.call @stack_push_pointer(%3579) : (i64) -> ()
        %3629 = func.call @stack_pop_pointer() : () -> i64
        %3630 = llvm.mlir.addressof @str345 : !llvm.ptr
        %3631 = arith.constant 17 : i64
        %3632 = func.call @cc_make_string(%3630, %3631) : (!llvm.ptr, i64) -> i64
        %3633 = func.call @cc_nil_value() : () -> i64
        %3634 = func.call @cc_intern(%3632, %3633) : (i64, i64) -> i64
        %3635 = func.call @cc_nil_value() : () -> i64
        %3636 = func.call @cc_cons(%3634, %3635) : (i64, i64) -> i64
        %3637 = func.call @cc_values_pack(%3636) : (i64) -> i64
        %3638 = func.call @cc_symbol_value(%3634) : (i64) -> i64
        %3639 = func.call @cc_cons(%3629, %3638) : (i64, i64) -> i64
        %3640 = llvm.mlir.addressof @str346 : !llvm.ptr
        %3641 = arith.constant 17 : i64
        %3642 = func.call @cc_make_string(%3640, %3641) : (!llvm.ptr, i64) -> i64
        %3643 = func.call @cc_nil_value() : () -> i64
        %3644 = func.call @cc_intern(%3642, %3643) : (i64, i64) -> i64
        %3645 = func.call @cc_nil_value() : () -> i64
        %3646 = func.call @cc_cons(%3644, %3645) : (i64, i64) -> i64
        %3647 = func.call @cc_values_pack(%3646) : (i64) -> i64
        %3648 = func.call @cc_set_symbol_value(%3644, %3639) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3639) : (i64) -> ()
        %3649 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3649 : i64
      }
      %3650 = func.call @cc_nil_value() : () -> i64
      %3651 = func.call @cc_errorp(%3628) : (i64) -> i64
      %3652 = arith.cmpi ne, %3651, %3650 : i64
      %3653 = scf.if %3652 -> (i64) {
        scf.yield %3628 : i64
      } else {
        %3654 = llvm.mlir.addressof @str347 : !llvm.ptr
        %3655 = arith.constant 21 : i64
        %3656 = func.call @cc_make_string(%3654, %3655) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%3656) : (i64) -> ()
        %3657 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3579) : (i64) -> ()
        %3658 = func.call @stack_pop_pointer() : () -> i64
        %3659 = func.call @cc_nil_value() : () -> i64
        %3660 = func.call @cc_errorp(%3657) : (i64) -> i64
        %3661 = arith.cmpi ne, %3660, %3659 : i64
        %3662 = arith.cmpi eq, %3659, %3659 : i64
        %3663 = arith.andi %3661, %3662 : i1
        %3664 = scf.if %3663 -> (i64) {
          scf.yield %3657 : i64
        } else {
          scf.yield %3659 : i64
        }
        %3665 = func.call @cc_errorp(%3658) : (i64) -> i64
        %3666 = arith.cmpi ne, %3665, %3659 : i64
        %3667 = arith.cmpi eq, %3664, %3659 : i64
        %3668 = arith.andi %3666, %3667 : i1
        %3669 = scf.if %3668 -> (i64) {
          scf.yield %3658 : i64
        } else {
          scf.yield %3664 : i64
        }
        %3670 = arith.cmpi ne, %3669, %3659 : i64
        scf.if %3670 {
          func.call @stack_push_pointer(%3669) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3657) : (i64) -> ()
          func.call @stack_push_pointer(%3658) : (i64) -> ()
          %3671 = llvm.mlir.addressof @str348 : !llvm.ptr
          %3672 = func.call @cc_make_function_ref_const(%3671) : (!llvm.ptr) -> i64
          %3673 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3672, %3673) : (i64, i64) -> ()
        }
        %3674 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3674 : i64
      }
      func.call @stack_push_pointer(%3653) : (i64) -> ()
    } else {
      %3675 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3675) : (i64) -> ()
      %3676 = func.call @stack_pop_pointer() : () -> i64
      %3677 = func.call @cc_nil_value() : () -> i64
      %3678 = arith.cmpi ne, %3676, %3677 : i64
      scf.if %3678 {
        func.call @stack_push_pointer(%3579) : (i64) -> ()
        %3679 = llvm.mlir.addressof @str349 : !llvm.ptr
        %3680 = arith.constant 19 : i64
        %3681 = func.call @cc_make_string(%3679, %3680) : (!llvm.ptr, i64) -> i64
        %3682 = func.call @cc_nil_value() : () -> i64
        %3683 = func.call @cc_intern(%3681, %3682) : (i64, i64) -> i64
        %3684 = func.call @cc_nil_value() : () -> i64
        %3685 = func.call @cc_cons(%3683, %3684) : (i64, i64) -> i64
        %3686 = func.call @cc_values_pack(%3685) : (i64) -> i64
        %3687 = func.call @cc_symbol_value(%3683) : (i64) -> i64
        func.call @stack_push_pointer(%3687) : (i64) -> ()
        %3688 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%3688) : (i64) -> ()
        %3689 = func.call @stack_pop_pointer() : () -> i64
        %3690 = func.call @stack_pop_pointer() : () -> i64
        %3691 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3689) : (i64) -> ()
        func.call @stack_push_pointer(%3691) : (i64) -> ()
        func.call @stack_push_pointer(%3690) : (i64) -> ()
        %3692 = llvm.mlir.addressof @str350 : !llvm.ptr
        %3693 = func.call @cc_make_function_ref_const(%3692) : (!llvm.ptr) -> i64
        %3694 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%3693, %3694) : (i64, i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
    }
    %3695 = func.call @stack_pop_pointer() : () -> i64
    %3696 = func.call @cc_multiple_value_list(%3695) : (i64) -> i64
    %3697 = llvm.mlir.addressof @str351 : !llvm.ptr
    %3698 = arith.constant 37 : i64
    %3699 = func.call @cc_make_string(%3697, %3698) : (!llvm.ptr, i64) -> i64
    %3700 = func.call @cc_nil_value() : () -> i64
    %3701 = func.call @cc_intern(%3699, %3700) : (i64, i64) -> i64
    %3702 = func.call @cc_nil_value() : () -> i64
    %3703 = func.call @cc_cons(%3701, %3702) : (i64, i64) -> i64
    %3704 = func.call @cc_values_pack(%3703) : (i64) -> i64
    %3705 = func.call @cc_symbol_value(%3701) : (i64) -> i64
    %3706 = llvm.mlir.addressof @str352 : !llvm.ptr
    %3707 = arith.constant 39 : i64
    %3708 = func.call @cc_make_string(%3706, %3707) : (!llvm.ptr, i64) -> i64
    %3709 = func.call @cc_nil_value() : () -> i64
    %3710 = func.call @cc_intern(%3708, %3709) : (i64, i64) -> i64
    %3711 = func.call @cc_nil_value() : () -> i64
    %3712 = func.call @cc_cons(%3710, %3711) : (i64, i64) -> i64
    %3713 = func.call @cc_values_pack(%3712) : (i64) -> i64
    %3714 = func.call @cc_symbol_value(%3710) : (i64) -> i64
    %3715 = func.call @cc_nil_value() : () -> i64
    %3716 = arith.cmpi ne, %3705, %3715 : i64
    %3717 = scf.if %3716 -> (i64) {
      scf.yield %3714 : i64
    } else {
      scf.yield %3696 : i64
    }
    %3718 = func.call @cc_values_pack(%3717) : (i64) -> i64
    func.call @stack_push_pointer(%3718) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1("level\0Acontrol-string\0Aargs\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_96868088414208*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_96868088414209*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str8("Display a message using ANSI highlighting if possible. LEVEL should be NIL, :ERR,\0A:WARN or :EMPH.\00") : !llvm.array<98 x i8>
  llvm.mlir.global private constant @str9("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("FRESH-LINE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str12("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str15("~c[~dm\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str16("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str23("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("COMMON-LISP:FORMAT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str26("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str29("~c[0m\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str30("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("TERPRI\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str34("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETVALUE_96868088414209*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str39("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str40("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str41("*__MLIR_BLOCK_RETVALUE_96868088414210*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str42("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETVALUE_96868088414211*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str46("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str47("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str48("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str49("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str50("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str51("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str52("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str53("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str54("*__MLIR_BLOCK_RETVALUE_96868088414211*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str55("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str56("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str57("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str58("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str59("file&error\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str60("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str61("*__MLIR_BLOCK_RETVALUE_96868088414212*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str64("*__MLIR_BLOCK_RETVALUE_96868088414213*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str66("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str67("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str69("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETVALUE_96868088414213*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str73("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str74("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str75("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str77("*__MLIR_BLOCK_RETVALUE_96868088414214*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str78("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETVALUE_96868088414215*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str81("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str82("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("~@[~%Failures:~%  ~/pprint-fill/~%~]~\0A~@[~%Unexpected Successes:~%  ~/pprint-fill/~%~]~\0A~@[~%Expected Failures:~%  ~/pprint-fill/~%~]\0ASuccesses: ~d\00") : !llvm.array<148 x i8>
  llvm.mlir.global private constant @str85("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str86("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str88("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str90("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str92("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str94("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str95("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str97("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("Compilation error for file ~a with error  ~a\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str100("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str102("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str104("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str105("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str106("Duplicate test ~a\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str107("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str109("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str111("*__MLIR_BLOCK_RETVALUE_96868088414215*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str112("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str113("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str114("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str115("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str116("name\0Aform\0Aexpected\0ACOMMON-LISP:ERROR\0Adescription\00") : !llvm.array<49 x i8>
  llvm.mlir.global private constant @str117("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str118("*__MLIR_BLOCK_RETVALUE_96868088414216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str119("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str120("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str121("*__MLIR_BLOCK_RETVALUE_96868088414217*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str122("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str123("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str124("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str126("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str128("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str130("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str132("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str133("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str134("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str136("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str137("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str140("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str141("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str142("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str143("Unexpected error~%~t~a~%while evaluating~%~t~a\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str144("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str145("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str146("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str147("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str148("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str149("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str150("*__MLIR_BLOCK_RETVALUE_96868088414217*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str151("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str152("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str153("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str154("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str155("name\0Aform\0Aexpected\0Aactual\0Adescription\0Atest\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str156("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str157("*__MLIR_BLOCK_RETVALUE_96868088414218*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str158("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str159("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str160("*__MLIR_BLOCK_RETVALUE_96868088414219*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str161("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str162("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str163("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str165("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str167("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str169("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str171("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str173("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str174("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str175("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str176("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str178("Wanted values ~s to~%~{~t~a~%~}but got~%~{~t~a~%~}\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str179("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str180("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str181("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str182("while evaluating~%~t~a~%\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str183("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str184("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str185("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str186("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str187("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str188("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str189("*__MLIR_BLOCK_RETVALUE_96868088414219*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str190("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str191("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str192("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str193("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str194("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str195("*__MLIR_BLOCK_RETFLAG_96868088414220*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str196("*__MLIR_BLOCK_RETVALUE_96868088414220*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str197("*__MLIR_BLOCK_RETMVLIST_96868088414220*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str198("*__MLIR_BLOCK_RETFLAG_96868088414221*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str199("*__MLIR_BLOCK_RETVALUE_96868088414221*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str200("*__MLIR_BLOCK_RETMVLIST_96868088414221*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str201("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str202("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str203("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str204("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str206("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str208("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str210("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str211("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str212("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str213("Passed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str214("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str215("*__MLIR_BLOCK_RETFLAG_96868088414221*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str216("*__MLIR_BLOCK_RETVALUE_96868088414221*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str217("*__MLIR_BLOCK_RETMVLIST_96868088414221*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str218("*__MLIR_BLOCK_RETFLAG_96868088414220*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str219("*__MLIR_BLOCK_RETMVLIST_96868088414220*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str220("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str221("name\0Aform\0Athunk\0Aexpected\0Adescription\0Atest\00") : !llvm.array<42 x i8>
  llvm.mlir.global private constant @str222("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str223("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str224("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str226("*__MLIR_BLOCK_RETFLAG_96868088414222*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str227("*__MLIR_BLOCK_RETVALUE_96868088414222*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str228("*__MLIR_BLOCK_RETMVLIST_96868088414222*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str229("*__MLIR_BLOCK_RETFLAG_96868088414223*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str230("*__MLIR_BLOCK_RETVALUE_96868088414223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str231("*__MLIR_BLOCK_RETMVLIST_96868088414223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str232("CLASP-TESTS::note-test\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str233("CLASP-TESTS::%fail-test-with-error\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str234("CLASP-TESTS::%succeed-test\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str235("CLASP-TESTS::%fail-test\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str236("*__MLIR_BLOCK_RETFLAG_96868088414223*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str237("*__MLIR_BLOCK_RETVALUE_96868088414223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str238("*__MLIR_BLOCK_RETMVLIST_96868088414223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str239("*__MLIR_BLOCK_RETFLAG_96868088414222*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str240("*__MLIR_BLOCK_RETMVLIST_96868088414222*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str241("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str242("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str243("*__MLIR_BLOCK_RETFLAG_96868088414224*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str244("*__MLIR_BLOCK_RETVALUE_96868088414224*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str245("*__MLIR_BLOCK_RETMVLIST_96868088414224*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str246("*__MLIR_BLOCK_RETFLAG_96868088414225*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str247("*__MLIR_BLOCK_RETVALUE_96868088414225*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str248("*__MLIR_BLOCK_RETMVLIST_96868088414225*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str249("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str250("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str251("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str252("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("CLASP-TESTS::note-compile-error\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str255("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str256("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str257("Regression: compile-file of ~a failed with ~a\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str258("CLASP-TESTS::message\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str259("*__MLIR_BLOCK_RETFLAG_96868088414225*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str260("*__MLIR_BLOCK_RETVALUE_96868088414225*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str261("*__MLIR_BLOCK_RETMVLIST_96868088414225*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str262("*__MLIR_BLOCK_RETFLAG_96868088414224*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str263("*__MLIR_BLOCK_RETMVLIST_96868088414224*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str264("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str265("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str266("*__MLIR_BLOCK_RETFLAG_96868088414226*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str267("*__MLIR_BLOCK_RETVALUE_96868088414226*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str268("*__MLIR_BLOCK_RETMVLIST_96868088414226*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str269("*__MLIR_BLOCK_RETFLAG_96868088414227*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str270("*__MLIR_BLOCK_RETVALUE_96868088414227*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str271("*__MLIR_BLOCK_RETMVLIST_96868088414227*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str272("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str273("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str274("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str275("*__MLIR_BLOCK_RETFLAG_96868088414227*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str276("*__MLIR_BLOCK_RETVALUE_96868088414227*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str277("*__MLIR_BLOCK_RETMVLIST_96868088414227*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str278("*__MLIR_BLOCK_RETFLAG_96868088414226*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str279("*__MLIR_BLOCK_RETMVLIST_96868088414226*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str280("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str281("*__MLIR_BLOCK_RETFLAG_96868088414228*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str282("*__MLIR_BLOCK_RETVALUE_96868088414228*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str283("*__MLIR_BLOCK_RETMVLIST_96868088414228*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str284("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str286("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str287("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str288("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str290("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str291("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str292("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str293("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str295("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str296("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str297("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str300("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str301("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str302("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str304("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str306("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str307("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str308("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str309("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str310("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str311("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str312("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str313("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str314("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str315("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str317("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str318("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str320("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str321("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str323("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str324("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str326("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str327("%FN%reset-clasp-tests\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str328("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str329("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str330("%FN%reset-clasp-tests\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str331("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str332("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str333("%FN%reset-clasp-tests\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str334("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str335("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str336("%FN%reset-clasp-tests\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str337("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str338("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str339("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str340("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str341("*__MLIR_BLOCK_RETFLAG_96868088414229*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str342("*__MLIR_BLOCK_RETVALUE_96868088414229*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str343("*__MLIR_BLOCK_RETMVLIST_96868088414229*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str344("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str345("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str346("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str347("~%Duplicate test ~a~%\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str348("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str349("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str350("%FN%(setf COMMON-LISP:GETHASH)\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str351("*__MLIR_BLOCK_RETFLAG_96868088414229*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str352("*__MLIR_BLOCK_RETMVLIST_96868088414229*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str353("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str354("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str355("%FN%note-test\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str356("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str357("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str358("%FN%note-compile-error\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str359("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str360("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str361("%FN%note-compile-error\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str362("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str363("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str364("%FN%note-compile-error\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str365("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str366("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str367("%FN%note-compile-error\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str368("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str369("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str370("%FN%show-test-summary\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str371("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str372("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str373("%FN%show-test-summary\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str374("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str375("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str376("%FN%show-test-summary\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str377("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str378("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str379("%FN%show-test-summary\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str380("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str381("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str382("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str383("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str384("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str385("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str386("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str387("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str388("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str389("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str390("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str391("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str392("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str393("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str394("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str395("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str396("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str397("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str398("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str399("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str400("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str401("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str402("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str403("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str404("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str405("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str406("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str407("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str408("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str409("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str410("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str411("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str412("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str413("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str414("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str415("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str416("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str417("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str418("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str419("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str420("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str421("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str422("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str423("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str424("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str425("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str426("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str427("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str428("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str429("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str430("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str431("%FN%test\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str432("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str433("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str434("%FN%test\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str435("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str436("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str437("%FN%test\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str438("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str439("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str440("%FN%test\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str441("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str442("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str443("%FN%test-expect-error\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str444("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str445("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str446("%FN%test-expect-error\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str447("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str448("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str449("%FN%test-expect-error\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str450("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str451("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str452("%FN%test-expect-error\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str453("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str454("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str455("%FN%test-true\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str456("TEST-TRUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str457("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str458("%FN%test-true\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str459("TEST-TRUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str460("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str461("%FN%test-true\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str462("TEST-TRUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str463("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str464("%FN%test-true\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str465("TEST-TRUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str466("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str467("%FN%test-nil\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str468("TEST-NIL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str469("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str470("%FN%test-nil\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str471("TEST-NIL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str472("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str473("%FN%test-nil\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str474("TEST-NIL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str475("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str476("%FN%test-nil\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str477("TEST-NIL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str478("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str479("%FN%test-type\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str480("TEST-TYPE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str481("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str482("%FN%test-type\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str483("TEST-TYPE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str484("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str485("%FN%test-type\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str486("TEST-TYPE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str487("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str488("%FN%test-type\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str489("TEST-TYPE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str490("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str491("%FN%test-finishes\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str492("TEST-FINISHES\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str493("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str494("%FN%test-finishes\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str495("TEST-FINISHES\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str496("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str497("%FN%test-finishes\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str498("TEST-FINISHES\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str499("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str500("%FN%test-finishes\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str501("TEST-FINISHES\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str502("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str503("%FN%load-if-compiled-correctly\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str504("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str505("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str506("%FN%load-if-compiled-correctly\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str507("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str508("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str509("%FN%load-if-compiled-correctly\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str510("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str511("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str512("%FN%load-if-compiled-correctly\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str513("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str514("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str515("%FN%no-handler-case-load-if-compiled-correctly\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str516("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str517("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str518("%FN%no-handler-case-load-if-compiled-correctly\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str519("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str520("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str521("%FN%no-handler-case-load-if-compiled-correctly\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str522("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str523("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str524("%FN%no-handler-case-load-if-compiled-correctly\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str525("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str526("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str527("*__MLIR_BLOCK_RETFLAG_96868088414228*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str528("*__MLIR_BLOCK_RETMVLIST_96868088414228*\00") : !llvm.array<40 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%message\00%FN%%test\00%FN%%test\00%FN%message\00\00") : !llvm.array<45 x i8>
}
