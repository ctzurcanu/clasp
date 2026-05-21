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
  func.func @"%FN%boole$"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 6 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 8 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @stack_pop_pointer() : () -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = llvm.mlir.addressof @str2 : !llvm.ptr
    %17 = arith.constant 38 : i64
    %18 = func.call @cc_make_string(%16, %17) : (!llvm.ptr, i64) -> i64
    %19 = func.call @cc_nil_value() : () -> i64
    %20 = func.call @cc_intern(%18, %19) : (i64, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_cons(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_values_pack(%22) : (i64) -> i64
    %24 = func.call @cc_set_symbol_value(%20, %15) : (i64, i64) -> i64
    %25 = llvm.mlir.addressof @str3 : !llvm.ptr
    %26 = arith.constant 39 : i64
    %27 = func.call @cc_make_string(%25, %26) : (!llvm.ptr, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_intern(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_cons(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_values_pack(%31) : (i64) -> i64
    %33 = func.call @cc_set_symbol_value(%29, %15) : (i64, i64) -> i64
    %34 = llvm.mlir.addressof @str4 : !llvm.ptr
    %35 = arith.constant 40 : i64
    %36 = func.call @cc_make_string(%34, %35) : (!llvm.ptr, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_intern(%36, %37) : (i64, i64) -> i64
    %39 = func.call @cc_nil_value() : () -> i64
    %40 = func.call @cc_cons(%38, %39) : (i64, i64) -> i64
    %41 = func.call @cc_values_pack(%40) : (i64) -> i64
    %42 = func.call @cc_set_symbol_value(%38, %15) : (i64, i64) -> i64
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_errorp(%43) : (i64) -> i64
    %46 = arith.cmpi ne, %45, %44 : i64
    %47 = scf.if %46 -> (i64) {
      scf.yield %43 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %48 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %48 : i64
    }
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_errorp(%47) : (i64) -> i64
    %51 = arith.cmpi ne, %50, %49 : i64
    %52 = scf.if %51 -> (i64) {
      scf.yield %47 : i64
    } else {
      %53 = llvm.mlir.addressof @str5 : !llvm.ptr
      %54 = arith.constant 13 : i64
      %55 = func.call @cc_make_string(%53, %54) : (!llvm.ptr, i64) -> i64
      %56 = llvm.mlir.addressof @str6 : !llvm.ptr
      %57 = arith.constant 13 : i64
      %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
      %59 = func.call @cc_intern(%55, %58) : (i64, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_cons(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_values_pack(%61) : (i64) -> i64
      %63 = func.call @cc_symbol_value(%59) : (i64) -> i64
      func.call @stack_push_pointer(%63) : (i64) -> ()
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %64 = arith.addi %14, %__rlasp_stack_elide_zero_0 : i64
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = func.call @cc_aref(%65, %64) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %67 = arith.addi %66, %__rlasp_stack_elide_zero_1 : i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_errorp(%67) : (i64) -> i64
      %70 = arith.cmpi ne, %69, %68 : i64
      %71 = arith.cmpi eq, %68, %68 : i64
      %72 = arith.andi %70, %71 : i1
      %73 = scf.if %72 -> (i64) {
        scf.yield %67 : i64
      } else {
        scf.yield %68 : i64
      }
      %74 = func.call @cc_errorp(%13) : (i64) -> i64
      %75 = arith.cmpi ne, %74, %68 : i64
      %76 = arith.cmpi eq, %73, %68 : i64
      %77 = arith.andi %75, %76 : i1
      %78 = scf.if %77 -> (i64) {
        scf.yield %13 : i64
      } else {
        scf.yield %73 : i64
      }
      %79 = func.call @cc_errorp(%12) : (i64) -> i64
      %80 = arith.cmpi ne, %79, %68 : i64
      %81 = arith.cmpi eq, %78, %68 : i64
      %82 = arith.andi %80, %81 : i1
      %83 = scf.if %82 -> (i64) {
        scf.yield %12 : i64
      } else {
        scf.yield %78 : i64
      }
      %84 = arith.cmpi ne, %83, %68 : i64
      scf.if %84 {
        func.call @stack_push_pointer(%83) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%67) : (i64) -> ()
        func.call @stack_push_pointer(%13) : (i64) -> ()
        func.call @stack_push_pointer(%12) : (i64) -> ()
        %85 = llvm.mlir.addressof @str7 : !llvm.ptr
        %86 = func.call @cc_make_function_ref_const(%85) : (!llvm.ptr) -> i64
        %87 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%86, %87) : (i64, i64) -> ()
      }
      %88 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %88 : i64
    }
    %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
    %89 = arith.addi %52, %__rlasp_stack_elide_zero_2 : i64
    %90 = func.call @cc_multiple_value_list(%89) : (i64) -> i64
    %91 = llvm.mlir.addressof @str8 : !llvm.ptr
    %92 = arith.constant 38 : i64
    %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
    %94 = func.call @cc_nil_value() : () -> i64
    %95 = func.call @cc_intern(%93, %94) : (i64, i64) -> i64
    %96 = func.call @cc_nil_value() : () -> i64
    %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
    %98 = func.call @cc_values_pack(%97) : (i64) -> i64
    %99 = func.call @cc_symbol_value(%95) : (i64) -> i64
    %100 = llvm.mlir.addressof @str9 : !llvm.ptr
    %101 = arith.constant 40 : i64
    %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = func.call @cc_intern(%102, %103) : (i64, i64) -> i64
    %105 = func.call @cc_nil_value() : () -> i64
    %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
    %107 = func.call @cc_values_pack(%106) : (i64) -> i64
    %108 = func.call @cc_symbol_value(%104) : (i64) -> i64
    %109 = func.call @cc_nil_value() : () -> i64
    %110 = arith.cmpi ne, %99, %109 : i64
    %111 = scf.if %110 -> (i64) {
      scf.yield %108 : i64
    } else {
      scf.yield %90 : i64
    }
    %112 = func.call @cc_values_pack(%111) : (i64) -> i64
    func.call @stack_push_pointer(%112) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %113 = llvm.mlir.addressof @str10 : !llvm.ptr
    %114 = arith.constant 6 : i64
    %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
    %116 = func.call @cc_nil_value() : () -> i64
    %117 = func.call @cc_intern(%115, %116) : (i64, i64) -> i64
    %118 = func.call @cc_nil_value() : () -> i64
    %119 = func.call @cc_cons(%117, %118) : (i64, i64) -> i64
    %120 = func.call @cc_values_pack(%119) : (i64) -> i64
    %121 = func.call @cc_nil_value() : () -> i64
    %122 = llvm.mlir.addressof @str11 : !llvm.ptr
    %123 = arith.constant 38 : i64
    %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_intern(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_nil_value() : () -> i64
    %128 = func.call @cc_cons(%126, %127) : (i64, i64) -> i64
    %129 = func.call @cc_values_pack(%128) : (i64) -> i64
    %130 = func.call @cc_set_symbol_value(%126, %121) : (i64, i64) -> i64
    %131 = llvm.mlir.addressof @str12 : !llvm.ptr
    %132 = arith.constant 39 : i64
    %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
    %134 = func.call @cc_nil_value() : () -> i64
    %135 = func.call @cc_intern(%133, %134) : (i64, i64) -> i64
    %136 = func.call @cc_nil_value() : () -> i64
    %137 = func.call @cc_cons(%135, %136) : (i64, i64) -> i64
    %138 = func.call @cc_values_pack(%137) : (i64) -> i64
    %139 = func.call @cc_set_symbol_value(%135, %121) : (i64, i64) -> i64
    %140 = llvm.mlir.addressof @str13 : !llvm.ptr
    %141 = arith.constant 40 : i64
    %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
    %143 = func.call @cc_nil_value() : () -> i64
    %144 = func.call @cc_intern(%142, %143) : (i64, i64) -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
    %147 = func.call @cc_values_pack(%146) : (i64) -> i64
    %148 = func.call @cc_set_symbol_value(%144, %121) : (i64, i64) -> i64
    %149 = func.call @cc_nil_value() : () -> i64
    %150 = func.call @cc_nil_value() : () -> i64
    %151 = func.call @cc_errorp(%149) : (i64) -> i64
    %152 = arith.cmpi ne, %151, %150 : i64
    %153 = scf.if %152 -> (i64) {
      scf.yield %149 : i64
    } else {
      %154 = func.call @cc_nil_value() : () -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_errorp(%154) : (i64) -> i64
      %157 = arith.cmpi ne, %156, %155 : i64
      %158 = scf.if %157 -> (i64) {
        scf.yield %154 : i64
      } else {
        %159 = llvm.mlir.addressof @str14 : !llvm.ptr
        %160 = arith.constant 13 : i64
        %161 = func.call @cc_make_string(%159, %160) : (!llvm.ptr, i64) -> i64
        %162 = func.call @cc_nil_value() : () -> i64
        %163 = func.call @cc_intern(%161, %162) : (i64, i64) -> i64
        %164 = func.call @cc_nil_value() : () -> i64
        %165 = func.call @cc_cons(%163, %164) : (i64, i64) -> i64
        %166 = func.call @cc_values_pack(%165) : (i64) -> i64
        %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
        %167 = arith.addi %163, %__rlasp_stack_elide_zero_3 : i64
        %168 = func.call @cc_nil_value() : () -> i64
        %169 = func.call @cc_errorp(%167) : (i64) -> i64
        %170 = arith.cmpi ne, %169, %168 : i64
        %171 = arith.cmpi eq, %168, %168 : i64
        %172 = arith.andi %170, %171 : i1
        %173 = scf.if %172 -> (i64) {
          scf.yield %167 : i64
        } else {
          scf.yield %168 : i64
        }
        %174 = arith.cmpi ne, %173, %168 : i64
        scf.if %174 {
          func.call @stack_push_pointer(%173) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%167) : (i64) -> ()
          %175 = llvm.mlir.addressof @str15 : !llvm.ptr
          %176 = func.call @cc_make_function_ref_const(%175) : (!llvm.ptr) -> i64
          %177 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%176, %177) : (i64, i64) -> ()
        }
        %178 = func.call @stack_pop_pointer() : () -> i64
        %179 = func.call @cc_nil_value() : () -> i64
        %180 = arith.cmpi ne, %178, %179 : i64
        scf.if %180 {
          %181 = llvm.mlir.addressof @str16 : !llvm.ptr
          %182 = arith.constant 13 : i64
          %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
          %184 = func.call @cc_nil_value() : () -> i64
          %185 = func.call @cc_intern(%183, %184) : (i64, i64) -> i64
          %186 = func.call @cc_nil_value() : () -> i64
          %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
          %188 = func.call @cc_values_pack(%187) : (i64) -> i64
          %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
          %189 = arith.addi %185, %__rlasp_stack_elide_zero_4 : i64
          %190 = func.call @cc_nil_value() : () -> i64
          %191 = func.call @cc_errorp(%189) : (i64) -> i64
          %192 = arith.cmpi ne, %191, %190 : i64
          %193 = arith.cmpi eq, %190, %190 : i64
          %194 = arith.andi %192, %193 : i1
          %195 = scf.if %194 -> (i64) {
            scf.yield %189 : i64
          } else {
            scf.yield %190 : i64
          }
          %196 = arith.cmpi ne, %195, %190 : i64
          scf.if %196 {
            func.call @stack_push_pointer(%195) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%189) : (i64) -> ()
            %197 = llvm.mlir.addressof @str17 : !llvm.ptr
            %198 = func.call @cc_make_function_ref_const(%197) : (!llvm.ptr) -> i64
            %199 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%198, %199) : (i64, i64) -> ()
          }
        } else {
          %200 = llvm.mlir.addressof @str18 : !llvm.ptr
          %201 = arith.constant 13 : i64
          %202 = func.call @cc_make_string(%200, %201) : (!llvm.ptr, i64) -> i64
          %203 = func.call @cc_nil_value() : () -> i64
          %204 = func.call @cc_intern(%202, %203) : (i64, i64) -> i64
          %205 = func.call @cc_nil_value() : () -> i64
          %206 = func.call @cc_cons(%204, %205) : (i64, i64) -> i64
          %207 = func.call @cc_values_pack(%206) : (i64) -> i64
          %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
          %208 = arith.addi %204, %__rlasp_stack_elide_zero_5 : i64
          %209 = func.call @cc_nil_value() : () -> i64
          %210 = func.call @cc_errorp(%208) : (i64) -> i64
          %211 = arith.cmpi ne, %210, %209 : i64
          %212 = arith.cmpi eq, %209, %209 : i64
          %213 = arith.andi %211, %212 : i1
          %214 = scf.if %213 -> (i64) {
            scf.yield %208 : i64
          } else {
            scf.yield %209 : i64
          }
          %215 = arith.cmpi ne, %214, %209 : i64
          scf.if %215 {
            func.call @stack_push_pointer(%214) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%208) : (i64) -> ()
            %216 = llvm.mlir.addressof @str19 : !llvm.ptr
            %217 = func.call @cc_make_function_ref_const(%216) : (!llvm.ptr) -> i64
            %218 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%217, %218) : (i64, i64) -> ()
          }
        }
        %219 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %219 : i64
      }
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_errorp(%158) : (i64) -> i64
      %222 = arith.cmpi ne, %221, %220 : i64
      %223 = scf.if %222 -> (i64) {
        scf.yield %158 : i64
      } else {
        %224 = llvm.mlir.addressof @str20 : !llvm.ptr
        %225 = arith.constant 2 : i64
        %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
        %227 = llvm.mlir.addressof @str21 : !llvm.ptr
        %228 = arith.constant 7 : i64
        %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
        %230 = func.call @cc_intern(%226, %229) : (i64, i64) -> i64
        %231 = func.call @cc_nil_value() : () -> i64
        %232 = func.call @cc_cons(%230, %231) : (i64, i64) -> i64
        %233 = func.call @cc_values_pack(%232) : (i64) -> i64
        %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
        %234 = arith.addi %230, %__rlasp_stack_elide_zero_6 : i64
        %235 = llvm.mlir.addressof @str22 : !llvm.ptr
        %236 = arith.constant 13 : i64
        %237 = func.call @cc_make_string(%235, %236) : (!llvm.ptr, i64) -> i64
        %238 = func.call @cc_nil_value() : () -> i64
        %239 = func.call @cc_intern(%237, %238) : (i64, i64) -> i64
        %240 = func.call @cc_nil_value() : () -> i64
        %241 = func.call @cc_cons(%239, %240) : (i64, i64) -> i64
        %242 = func.call @cc_values_pack(%241) : (i64) -> i64
        %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
        %243 = arith.addi %239, %__rlasp_stack_elide_zero_7 : i64
        %244 = func.call @cc_nil_value() : () -> i64
        %245 = func.call @cc_errorp(%234) : (i64) -> i64
        %246 = arith.cmpi ne, %245, %244 : i64
        %247 = arith.cmpi eq, %244, %244 : i64
        %248 = arith.andi %246, %247 : i1
        %249 = scf.if %248 -> (i64) {
          scf.yield %234 : i64
        } else {
          scf.yield %244 : i64
        }
        %250 = func.call @cc_errorp(%243) : (i64) -> i64
        %251 = arith.cmpi ne, %250, %244 : i64
        %252 = arith.cmpi eq, %249, %244 : i64
        %253 = arith.andi %251, %252 : i1
        %254 = scf.if %253 -> (i64) {
          scf.yield %243 : i64
        } else {
          scf.yield %249 : i64
        }
        %255 = arith.cmpi ne, %254, %244 : i64
        scf.if %255 {
          func.call @stack_push_pointer(%254) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%234) : (i64) -> ()
          func.call @stack_push_pointer(%243) : (i64) -> ()
          %256 = llvm.mlir.addressof @str23 : !llvm.ptr
          %257 = func.call @cc_make_function_ref_const(%256) : (!llvm.ptr) -> i64
          %258 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%257, %258) : (i64, i64) -> ()
        }
        %259 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %259 : i64
      }
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_errorp(%223) : (i64) -> i64
      %262 = arith.cmpi ne, %261, %260 : i64
      %263 = scf.if %262 -> (i64) {
        scf.yield %223 : i64
      } else {
        %264 = llvm.mlir.addressof @str24 : !llvm.ptr
        %265 = arith.constant 13 : i64
        %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
        %267 = func.call @cc_nil_value() : () -> i64
        %268 = func.call @cc_intern(%266, %267) : (i64, i64) -> i64
        %269 = func.call @cc_nil_value() : () -> i64
        %270 = func.call @cc_cons(%268, %269) : (i64, i64) -> i64
        %271 = func.call @cc_values_pack(%270) : (i64) -> i64
        %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
        %272 = arith.addi %268, %__rlasp_stack_elide_zero_8 : i64
        %273 = func.call @cc_nil_value() : () -> i64
        %274 = func.call @cc_errorp(%272) : (i64) -> i64
        %275 = arith.cmpi ne, %274, %273 : i64
        %276 = arith.cmpi eq, %273, %273 : i64
        %277 = arith.andi %275, %276 : i1
        %278 = scf.if %277 -> (i64) {
          scf.yield %272 : i64
        } else {
          scf.yield %273 : i64
        }
        %279 = arith.cmpi ne, %278, %273 : i64
        scf.if %279 {
          func.call @stack_push_pointer(%278) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%272) : (i64) -> ()
          %280 = llvm.mlir.addressof @str25 : !llvm.ptr
          %281 = func.call @cc_make_function_ref_const(%280) : (!llvm.ptr) -> i64
          %282 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%281, %282) : (i64, i64) -> ()
        }
        %283 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %283 : i64
      }
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %284 = arith.addi %263, %__rlasp_stack_elide_zero_9 : i64
      scf.yield %284 : i64
    }
    %285 = func.call @cc_nil_value() : () -> i64
    %286 = func.call @cc_errorp(%153) : (i64) -> i64
    %287 = arith.cmpi ne, %286, %285 : i64
    %288 = scf.if %287 -> (i64) {
      scf.yield %153 : i64
    } else {
      %289 = llvm.mlir.addressof @str26 : !llvm.ptr
      %290 = arith.constant 13 : i64
      %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
      %292 = llvm.mlir.addressof @str27 : !llvm.ptr
      %293 = arith.constant 7 : i64
      %294 = func.call @cc_make_string(%292, %293) : (!llvm.ptr, i64) -> i64
      %295 = func.call @cc_intern(%291, %294) : (i64, i64) -> i64
      %296 = func.call @cc_nil_value() : () -> i64
      %297 = func.call @cc_cons(%295, %296) : (i64, i64) -> i64
      %298 = func.call @cc_values_pack(%297) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %299 = arith.addi %295, %__rlasp_stack_elide_zero_10 : i64
      %300 = func.call @cc_in_package(%299) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %301 = arith.addi %300, %__rlasp_stack_elide_zero_11 : i64
      scf.yield %301 : i64
    }
    %302 = func.call @cc_nil_value() : () -> i64
    %303 = func.call @cc_errorp(%288) : (i64) -> i64
    %304 = arith.cmpi ne, %303, %302 : i64
    %305 = scf.if %304 -> (i64) {
      scf.yield %288 : i64
    } else {
      %306 = llvm.mlir.addressof @str28 : !llvm.ptr
      %307 = arith.constant 13 : i64
      %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
      %309 = llvm.mlir.addressof @str29 : !llvm.ptr
      %310 = arith.constant 13 : i64
      %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
      %312 = func.call @cc_intern(%308, %311) : (i64, i64) -> i64
      %313 = func.call @cc_nil_value() : () -> i64
      %314 = func.call @cc_cons(%312, %313) : (i64, i64) -> i64
      %315 = func.call @cc_values_pack(%314) : (i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %316 = arith.addi %312, %__rlasp_stack_elide_zero_12 : i64
      scf.yield %316 : i64
    }
    %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
    %317 = arith.addi %305, %__rlasp_stack_elide_zero_13 : i64
    %318 = func.call @cc_multiple_value_list(%317) : (i64) -> i64
    %319 = llvm.mlir.addressof @str30 : !llvm.ptr
    %320 = arith.constant 38 : i64
    %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
    %322 = func.call @cc_nil_value() : () -> i64
    %323 = func.call @cc_intern(%321, %322) : (i64, i64) -> i64
    %324 = func.call @cc_nil_value() : () -> i64
    %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
    %326 = func.call @cc_values_pack(%325) : (i64) -> i64
    %327 = func.call @cc_symbol_value(%323) : (i64) -> i64
    %328 = llvm.mlir.addressof @str31 : !llvm.ptr
    %329 = arith.constant 40 : i64
    %330 = func.call @cc_make_string(%328, %329) : (!llvm.ptr, i64) -> i64
    %331 = func.call @cc_nil_value() : () -> i64
    %332 = func.call @cc_intern(%330, %331) : (i64, i64) -> i64
    %333 = func.call @cc_nil_value() : () -> i64
    %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
    %335 = func.call @cc_values_pack(%334) : (i64) -> i64
    %336 = func.call @cc_symbol_value(%332) : (i64) -> i64
    %337 = func.call @cc_nil_value() : () -> i64
    %338 = arith.cmpi ne, %327, %337 : i64
    %339 = scf.if %338 -> (i64) {
      scf.yield %336 : i64
    } else {
      scf.yield %318 : i64
    }
    %340 = func.call @cc_values_pack(%339) : (i64) -> i64
    func.call @stack_push_pointer(%340) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("op\0Ai1\0Ai2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_239118244118528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str6("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("BOOLE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str10("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETVALUE_239118244118529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str14("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str15("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str16("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str17("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str18("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str19("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str20("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str23("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str25("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str26("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str29("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str30("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
}
