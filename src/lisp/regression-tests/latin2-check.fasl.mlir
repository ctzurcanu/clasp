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
      %56 = func.call @cc_nil_value() : () -> i64
      %57 = func.call @cc_intern(%55, %56) : (i64, i64) -> i64
      %58 = func.call @cc_nil_value() : () -> i64
      %59 = func.call @cc_cons(%57, %58) : (i64, i64) -> i64
      %60 = func.call @cc_values_pack(%59) : (i64) -> i64
      %61 = func.call @cc_symbol_value(%57) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %62 = arith.addi %14, %__rlasp_stack_elide_zero_0 : i64
      %63 = func.call @stack_pop_pointer() : () -> i64
      %64 = func.call @cc_aref(%63, %62) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %65 = arith.addi %64, %__rlasp_stack_elide_zero_1 : i64
      %66 = func.call @cc_nil_value() : () -> i64
      %67 = func.call @cc_errorp(%65) : (i64) -> i64
      %68 = arith.cmpi ne, %67, %66 : i64
      %69 = arith.cmpi eq, %66, %66 : i64
      %70 = arith.andi %68, %69 : i1
      %71 = scf.if %70 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %66 : i64
      }
      %72 = func.call @cc_errorp(%13) : (i64) -> i64
      %73 = arith.cmpi ne, %72, %66 : i64
      %74 = arith.cmpi eq, %71, %66 : i64
      %75 = arith.andi %73, %74 : i1
      %76 = scf.if %75 -> (i64) {
        scf.yield %13 : i64
      } else {
        scf.yield %71 : i64
      }
      %77 = func.call @cc_errorp(%12) : (i64) -> i64
      %78 = arith.cmpi ne, %77, %66 : i64
      %79 = arith.cmpi eq, %76, %66 : i64
      %80 = arith.andi %78, %79 : i1
      %81 = scf.if %80 -> (i64) {
        scf.yield %12 : i64
      } else {
        scf.yield %76 : i64
      }
      %82 = arith.cmpi ne, %81, %66 : i64
      scf.if %82 {
        func.call @stack_push_pointer(%81) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%13) : (i64) -> ()
        func.call @stack_push_pointer(%12) : (i64) -> ()
        %83 = llvm.mlir.addressof @str6 : !llvm.ptr
        %84 = func.call @cc_make_function_ref_const(%83) : (!llvm.ptr) -> i64
        %85 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%84, %85) : (i64, i64) -> ()
      }
      %86 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %86 : i64
    }
    %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
    %87 = arith.addi %52, %__rlasp_stack_elide_zero_2 : i64
    %88 = func.call @cc_multiple_value_list(%87) : (i64) -> i64
    %89 = llvm.mlir.addressof @str7 : !llvm.ptr
    %90 = arith.constant 38 : i64
    %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
    %92 = func.call @cc_nil_value() : () -> i64
    %93 = func.call @cc_intern(%91, %92) : (i64, i64) -> i64
    %94 = func.call @cc_nil_value() : () -> i64
    %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
    %96 = func.call @cc_values_pack(%95) : (i64) -> i64
    %97 = func.call @cc_symbol_value(%93) : (i64) -> i64
    %98 = llvm.mlir.addressof @str8 : !llvm.ptr
    %99 = arith.constant 40 : i64
    %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_intern(%100, %101) : (i64, i64) -> i64
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
    %105 = func.call @cc_values_pack(%104) : (i64) -> i64
    %106 = func.call @cc_symbol_value(%102) : (i64) -> i64
    %107 = func.call @cc_nil_value() : () -> i64
    %108 = arith.cmpi ne, %97, %107 : i64
    %109 = scf.if %108 -> (i64) {
      scf.yield %106 : i64
    } else {
      scf.yield %88 : i64
    }
    %110 = func.call @cc_values_pack(%109) : (i64) -> i64
    func.call @stack_push_pointer(%110) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %111 = llvm.mlir.addressof @str9 : !llvm.ptr
    %112 = arith.constant 6 : i64
    %113 = func.call @cc_make_string(%111, %112) : (!llvm.ptr, i64) -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = func.call @cc_intern(%113, %114) : (i64, i64) -> i64
    %116 = func.call @cc_nil_value() : () -> i64
    %117 = func.call @cc_cons(%115, %116) : (i64, i64) -> i64
    %118 = func.call @cc_values_pack(%117) : (i64) -> i64
    %119 = func.call @cc_nil_value() : () -> i64
    %120 = llvm.mlir.addressof @str10 : !llvm.ptr
    %121 = arith.constant 38 : i64
    %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
    %123 = func.call @cc_nil_value() : () -> i64
    %124 = func.call @cc_intern(%122, %123) : (i64, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_cons(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_values_pack(%126) : (i64) -> i64
    %128 = func.call @cc_set_symbol_value(%124, %119) : (i64, i64) -> i64
    %129 = llvm.mlir.addressof @str11 : !llvm.ptr
    %130 = arith.constant 39 : i64
    %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
    %132 = func.call @cc_nil_value() : () -> i64
    %133 = func.call @cc_intern(%131, %132) : (i64, i64) -> i64
    %134 = func.call @cc_nil_value() : () -> i64
    %135 = func.call @cc_cons(%133, %134) : (i64, i64) -> i64
    %136 = func.call @cc_values_pack(%135) : (i64) -> i64
    %137 = func.call @cc_set_symbol_value(%133, %119) : (i64, i64) -> i64
    %138 = llvm.mlir.addressof @str12 : !llvm.ptr
    %139 = arith.constant 40 : i64
    %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
    %141 = func.call @cc_nil_value() : () -> i64
    %142 = func.call @cc_intern(%140, %141) : (i64, i64) -> i64
    %143 = func.call @cc_nil_value() : () -> i64
    %144 = func.call @cc_cons(%142, %143) : (i64, i64) -> i64
    %145 = func.call @cc_values_pack(%144) : (i64) -> i64
    %146 = func.call @cc_set_symbol_value(%142, %119) : (i64, i64) -> i64
    %147 = func.call @cc_nil_value() : () -> i64
    %148 = func.call @cc_nil_value() : () -> i64
    %149 = func.call @cc_errorp(%147) : (i64) -> i64
    %150 = arith.cmpi ne, %149, %148 : i64
    %151 = scf.if %150 -> (i64) {
      scf.yield %147 : i64
    } else {
      %152 = func.call @cc_nil_value() : () -> i64
      %153 = func.call @cc_nil_value() : () -> i64
      %154 = func.call @cc_errorp(%152) : (i64) -> i64
      %155 = arith.cmpi ne, %154, %153 : i64
      %156 = scf.if %155 -> (i64) {
        scf.yield %152 : i64
      } else {
        %157 = llvm.mlir.addressof @str13 : !llvm.ptr
        %158 = arith.constant 13 : i64
        %159 = func.call @cc_make_string(%157, %158) : (!llvm.ptr, i64) -> i64
        %160 = func.call @cc_nil_value() : () -> i64
        %161 = func.call @cc_intern(%159, %160) : (i64, i64) -> i64
        %162 = func.call @cc_nil_value() : () -> i64
        %163 = func.call @cc_cons(%161, %162) : (i64, i64) -> i64
        %164 = func.call @cc_values_pack(%163) : (i64) -> i64
        %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
        %165 = arith.addi %161, %__rlasp_stack_elide_zero_3 : i64
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
          %173 = llvm.mlir.addressof @str14 : !llvm.ptr
          %174 = func.call @cc_make_function_ref_const(%173) : (!llvm.ptr) -> i64
          %175 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%174, %175) : (i64, i64) -> ()
        }
        %176 = func.call @stack_pop_pointer() : () -> i64
        %177 = func.call @cc_nil_value() : () -> i64
        %178 = arith.cmpi ne, %176, %177 : i64
        scf.if %178 {
          %179 = llvm.mlir.addressof @str15 : !llvm.ptr
          %180 = arith.constant 13 : i64
          %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
          %182 = func.call @cc_nil_value() : () -> i64
          %183 = func.call @cc_intern(%181, %182) : (i64, i64) -> i64
          %184 = func.call @cc_nil_value() : () -> i64
          %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
          %186 = func.call @cc_values_pack(%185) : (i64) -> i64
          %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
          %187 = arith.addi %183, %__rlasp_stack_elide_zero_4 : i64
          %188 = func.call @cc_nil_value() : () -> i64
          %189 = func.call @cc_errorp(%187) : (i64) -> i64
          %190 = arith.cmpi ne, %189, %188 : i64
          %191 = arith.cmpi eq, %188, %188 : i64
          %192 = arith.andi %190, %191 : i1
          %193 = scf.if %192 -> (i64) {
            scf.yield %187 : i64
          } else {
            scf.yield %188 : i64
          }
          %194 = arith.cmpi ne, %193, %188 : i64
          scf.if %194 {
            func.call @stack_push_pointer(%193) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%187) : (i64) -> ()
            %195 = llvm.mlir.addressof @str16 : !llvm.ptr
            %196 = func.call @cc_make_function_ref_const(%195) : (!llvm.ptr) -> i64
            %197 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%196, %197) : (i64, i64) -> ()
          }
        } else {
          %198 = llvm.mlir.addressof @str17 : !llvm.ptr
          %199 = arith.constant 13 : i64
          %200 = func.call @cc_make_string(%198, %199) : (!llvm.ptr, i64) -> i64
          %201 = func.call @cc_nil_value() : () -> i64
          %202 = func.call @cc_intern(%200, %201) : (i64, i64) -> i64
          %203 = func.call @cc_nil_value() : () -> i64
          %204 = func.call @cc_cons(%202, %203) : (i64, i64) -> i64
          %205 = func.call @cc_values_pack(%204) : (i64) -> i64
          %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
          %206 = arith.addi %202, %__rlasp_stack_elide_zero_5 : i64
          %207 = func.call @cc_nil_value() : () -> i64
          %208 = func.call @cc_errorp(%206) : (i64) -> i64
          %209 = arith.cmpi ne, %208, %207 : i64
          %210 = arith.cmpi eq, %207, %207 : i64
          %211 = arith.andi %209, %210 : i1
          %212 = scf.if %211 -> (i64) {
            scf.yield %206 : i64
          } else {
            scf.yield %207 : i64
          }
          %213 = arith.cmpi ne, %212, %207 : i64
          scf.if %213 {
            func.call @stack_push_pointer(%212) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%206) : (i64) -> ()
            %214 = llvm.mlir.addressof @str18 : !llvm.ptr
            %215 = func.call @cc_make_function_ref_const(%214) : (!llvm.ptr) -> i64
            %216 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%215, %216) : (i64, i64) -> ()
          }
        }
        %217 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %217 : i64
      }
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_errorp(%156) : (i64) -> i64
      %220 = arith.cmpi ne, %219, %218 : i64
      %221 = scf.if %220 -> (i64) {
        scf.yield %156 : i64
      } else {
        %222 = llvm.mlir.addressof @str19 : !llvm.ptr
        %223 = arith.constant 2 : i64
        %224 = func.call @cc_make_string(%222, %223) : (!llvm.ptr, i64) -> i64
        %225 = llvm.mlir.addressof @str20 : !llvm.ptr
        %226 = arith.constant 7 : i64
        %227 = func.call @cc_make_string(%225, %226) : (!llvm.ptr, i64) -> i64
        %228 = func.call @cc_intern(%224, %227) : (i64, i64) -> i64
        %229 = func.call @cc_nil_value() : () -> i64
        %230 = func.call @cc_cons(%228, %229) : (i64, i64) -> i64
        %231 = func.call @cc_values_pack(%230) : (i64) -> i64
        %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
        %232 = arith.addi %228, %__rlasp_stack_elide_zero_6 : i64
        %233 = llvm.mlir.addressof @str21 : !llvm.ptr
        %234 = arith.constant 13 : i64
        %235 = func.call @cc_make_string(%233, %234) : (!llvm.ptr, i64) -> i64
        %236 = func.call @cc_nil_value() : () -> i64
        %237 = func.call @cc_intern(%235, %236) : (i64, i64) -> i64
        %238 = func.call @cc_nil_value() : () -> i64
        %239 = func.call @cc_cons(%237, %238) : (i64, i64) -> i64
        %240 = func.call @cc_values_pack(%239) : (i64) -> i64
        %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
        %241 = arith.addi %237, %__rlasp_stack_elide_zero_7 : i64
        %242 = func.call @cc_nil_value() : () -> i64
        %243 = func.call @cc_errorp(%232) : (i64) -> i64
        %244 = arith.cmpi ne, %243, %242 : i64
        %245 = arith.cmpi eq, %242, %242 : i64
        %246 = arith.andi %244, %245 : i1
        %247 = scf.if %246 -> (i64) {
          scf.yield %232 : i64
        } else {
          scf.yield %242 : i64
        }
        %248 = func.call @cc_errorp(%241) : (i64) -> i64
        %249 = arith.cmpi ne, %248, %242 : i64
        %250 = arith.cmpi eq, %247, %242 : i64
        %251 = arith.andi %249, %250 : i1
        %252 = scf.if %251 -> (i64) {
          scf.yield %241 : i64
        } else {
          scf.yield %247 : i64
        }
        %253 = arith.cmpi ne, %252, %242 : i64
        scf.if %253 {
          func.call @stack_push_pointer(%252) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%232) : (i64) -> ()
          func.call @stack_push_pointer(%241) : (i64) -> ()
          %254 = llvm.mlir.addressof @str22 : !llvm.ptr
          %255 = func.call @cc_make_function_ref_const(%254) : (!llvm.ptr) -> i64
          %256 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%255, %256) : (i64, i64) -> ()
        }
        %257 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %257 : i64
      }
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_errorp(%221) : (i64) -> i64
      %260 = arith.cmpi ne, %259, %258 : i64
      %261 = scf.if %260 -> (i64) {
        scf.yield %221 : i64
      } else {
        %262 = llvm.mlir.addressof @str23 : !llvm.ptr
        %263 = arith.constant 13 : i64
        %264 = func.call @cc_make_string(%262, %263) : (!llvm.ptr, i64) -> i64
        %265 = func.call @cc_nil_value() : () -> i64
        %266 = func.call @cc_intern(%264, %265) : (i64, i64) -> i64
        %267 = func.call @cc_nil_value() : () -> i64
        %268 = func.call @cc_cons(%266, %267) : (i64, i64) -> i64
        %269 = func.call @cc_values_pack(%268) : (i64) -> i64
        %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
        %270 = arith.addi %266, %__rlasp_stack_elide_zero_8 : i64
        %271 = func.call @cc_nil_value() : () -> i64
        %272 = func.call @cc_errorp(%270) : (i64) -> i64
        %273 = arith.cmpi ne, %272, %271 : i64
        %274 = arith.cmpi eq, %271, %271 : i64
        %275 = arith.andi %273, %274 : i1
        %276 = scf.if %275 -> (i64) {
          scf.yield %270 : i64
        } else {
          scf.yield %271 : i64
        }
        %277 = arith.cmpi ne, %276, %271 : i64
        scf.if %277 {
          func.call @stack_push_pointer(%276) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%270) : (i64) -> ()
          %278 = llvm.mlir.addressof @str24 : !llvm.ptr
          %279 = func.call @cc_make_function_ref_const(%278) : (!llvm.ptr) -> i64
          %280 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%279, %280) : (i64, i64) -> ()
        }
        %281 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %281 : i64
      }
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %282 = arith.addi %261, %__rlasp_stack_elide_zero_9 : i64
      scf.yield %282 : i64
    }
    %283 = func.call @cc_nil_value() : () -> i64
    %284 = func.call @cc_errorp(%151) : (i64) -> i64
    %285 = arith.cmpi ne, %284, %283 : i64
    %286 = scf.if %285 -> (i64) {
      scf.yield %151 : i64
    } else {
      %287 = llvm.mlir.addressof @str25 : !llvm.ptr
      %288 = arith.constant 13 : i64
      %289 = func.call @cc_make_string(%287, %288) : (!llvm.ptr, i64) -> i64
      %290 = llvm.mlir.addressof @str26 : !llvm.ptr
      %291 = arith.constant 7 : i64
      %292 = func.call @cc_make_string(%290, %291) : (!llvm.ptr, i64) -> i64
      %293 = func.call @cc_intern(%289, %292) : (i64, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_values_pack(%295) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %297 = arith.addi %293, %__rlasp_stack_elide_zero_10 : i64
      %298 = func.call @cc_in_package(%297) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %299 = arith.addi %298, %__rlasp_stack_elide_zero_11 : i64
      scf.yield %299 : i64
    }
    %300 = func.call @cc_nil_value() : () -> i64
    %301 = func.call @cc_errorp(%286) : (i64) -> i64
    %302 = arith.cmpi ne, %301, %300 : i64
    %303 = scf.if %302 -> (i64) {
      scf.yield %286 : i64
    } else {
      %304 = llvm.mlir.addressof @str27 : !llvm.ptr
      %305 = arith.constant 13 : i64
      %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_intern(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_nil_value() : () -> i64
      %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
      %311 = func.call @cc_values_pack(%310) : (i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %312 = arith.addi %308, %__rlasp_stack_elide_zero_12 : i64
      scf.yield %312 : i64
    }
    %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
    %313 = arith.addi %303, %__rlasp_stack_elide_zero_13 : i64
    %314 = func.call @cc_multiple_value_list(%313) : (i64) -> i64
    %315 = llvm.mlir.addressof @str28 : !llvm.ptr
    %316 = arith.constant 38 : i64
    %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
    %318 = func.call @cc_nil_value() : () -> i64
    %319 = func.call @cc_intern(%317, %318) : (i64, i64) -> i64
    %320 = func.call @cc_nil_value() : () -> i64
    %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
    %322 = func.call @cc_values_pack(%321) : (i64) -> i64
    %323 = func.call @cc_symbol_value(%319) : (i64) -> i64
    %324 = llvm.mlir.addressof @str29 : !llvm.ptr
    %325 = arith.constant 40 : i64
    %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
    %327 = func.call @cc_nil_value() : () -> i64
    %328 = func.call @cc_intern(%326, %327) : (i64, i64) -> i64
    %329 = func.call @cc_nil_value() : () -> i64
    %330 = func.call @cc_cons(%328, %329) : (i64, i64) -> i64
    %331 = func.call @cc_values_pack(%330) : (i64) -> i64
    %332 = func.call @cc_symbol_value(%328) : (i64) -> i64
    %333 = func.call @cc_nil_value() : () -> i64
    %334 = arith.cmpi ne, %323, %333 : i64
    %335 = scf.if %334 -> (i64) {
      scf.yield %332 : i64
    } else {
      scf.yield %314 : i64
    }
    %336 = func.call @cc_values_pack(%335) : (i64) -> i64
    func.call @stack_push_pointer(%336) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("op\0Ai1\0Ai2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_239118244118528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str6("BOOLE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str9("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_239118244118529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str13("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str14("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str16("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str18("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str19("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str22("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str24("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str25("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
}
