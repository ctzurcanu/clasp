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
  func.func @"%FN%slurp"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 5 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 18 : i64
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
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_t_value() : () -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_errorp(%48) : (i64) -> i64
    %51 = arith.cmpi ne, %50, %49 : i64
    %52 = scf.if %51 -> (i64) {
      scf.yield %48 : i64
    } else {
      %53 = func.call @cc_nil_value() : () -> i64
      %54 = llvm.mlir.addressof @str5 : !llvm.ptr
      %55 = arith.constant 38 : i64
      %56 = func.call @cc_make_string(%54, %55) : (!llvm.ptr, i64) -> i64
      %57 = func.call @cc_nil_value() : () -> i64
      %58 = func.call @cc_intern(%56, %57) : (i64, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_cons(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_values_pack(%60) : (i64) -> i64
      %62 = func.call @cc_set_symbol_value(%58, %53) : (i64, i64) -> i64
      %63 = llvm.mlir.addressof @str6 : !llvm.ptr
      %64 = arith.constant 39 : i64
      %65 = func.call @cc_make_string(%63, %64) : (!llvm.ptr, i64) -> i64
      %66 = func.call @cc_nil_value() : () -> i64
      %67 = func.call @cc_intern(%65, %66) : (i64, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_cons(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_values_pack(%69) : (i64) -> i64
      %71 = func.call @cc_set_symbol_value(%67, %53) : (i64, i64) -> i64
      %72 = llvm.mlir.addressof @str7 : !llvm.ptr
      %73 = arith.constant 40 : i64
      %74 = func.call @cc_make_string(%72, %73) : (!llvm.ptr, i64) -> i64
      %75 = func.call @cc_nil_value() : () -> i64
      %76 = func.call @cc_intern(%74, %75) : (i64, i64) -> i64
      %77 = func.call @cc_nil_value() : () -> i64
      %78 = func.call @cc_cons(%76, %77) : (i64, i64) -> i64
      %79 = func.call @cc_values_pack(%78) : (i64) -> i64
      %80 = func.call @cc_set_symbol_value(%76, %53) : (i64, i64) -> i64
      %81:4 = scf.while (%arg0 = %41, %arg1 = %42, %arg2 = %43, %arg3 = %47) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
        %82 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
        %83 = arith.addi %arg2, %__rlasp_stack_elide_zero_0 : i64
        %84 = func.call @cc_nil_value() : () -> i64
        %85 = func.call @cc_cons(%83, %84) : (i64, i64) -> i64
        %86 = func.call @cc_not(%85) : (i64) -> i64
        %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
        %87 = arith.addi %86, %__rlasp_stack_elide_zero_1 : i64
        %88 = func.call @cc_t_value() : () -> i64
        %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
        %89 = arith.addi %88, %__rlasp_stack_elide_zero_2 : i64
        %90 = func.call @cc_cons(%89, %82) : (i64, i64) -> i64
        %91 = func.call @cc_cons(%87, %90) : (i64, i64) -> i64
        %92 = func.call @cc_and(%91) : (i64) -> i64
        %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
        %93 = arith.addi %92, %__rlasp_stack_elide_zero_3 : i64
        %94 = func.call @cc_nil_value() : () -> i64
        %95 = arith.cmpi ne, %93, %94 : i64
        %96 = func.call @cc_nil_value() : () -> i64
        %97 = llvm.mlir.addressof @str8 : !llvm.ptr
        %98 = arith.constant 38 : i64
        %99 = func.call @cc_make_string(%97, %98) : (!llvm.ptr, i64) -> i64
        %100 = func.call @cc_nil_value() : () -> i64
        %101 = func.call @cc_intern(%99, %100) : (i64, i64) -> i64
        %102 = func.call @cc_nil_value() : () -> i64
        %103 = func.call @cc_cons(%101, %102) : (i64, i64) -> i64
        %104 = func.call @cc_values_pack(%103) : (i64) -> i64
        %105 = func.call @cc_symbol_value(%101) : (i64) -> i64
        %106 = arith.cmpi ne, %105, %96 : i64
        %107 = llvm.mlir.addressof @str9 : !llvm.ptr
        %108 = arith.constant 38 : i64
        %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
        %110 = func.call @cc_nil_value() : () -> i64
        %111 = func.call @cc_intern(%109, %110) : (i64, i64) -> i64
        %112 = func.call @cc_nil_value() : () -> i64
        %113 = func.call @cc_cons(%111, %112) : (i64, i64) -> i64
        %114 = func.call @cc_values_pack(%113) : (i64) -> i64
        %115 = func.call @cc_symbol_value(%111) : (i64) -> i64
        %116 = arith.cmpi ne, %115, %96 : i64
        %117 = arith.ori %106, %116 : i1
        %118 = arith.constant 0 : i1
        %119 = arith.cmpi eq, %117, %118 : i1
        %120 = arith.andi %95, %119 : i1
        scf.condition(%120) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
      } do {
        ^bb0(%121: i64, %122: i64, %123: i64, %124: i64):
        %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
        %125 = arith.addi %124, %__rlasp_stack_elide_zero_4 : i64
        %126 = func.call @cc_nil_value() : () -> i64
        %127 = arith.cmpi ne, %125, %126 : i64
        %128:2 = scf.if %127 -> (i64, i64) {
          %129 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
          %130 = arith.addi %129, %__rlasp_stack_elide_zero_5 : i64
          scf.yield %130, %129 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %131 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %131, %121 : i64, i64
        }
        func.call @stack_push_pointer(%128#0) : (i64) -> ()
        %132 = func.call @stack_depth() : () -> i64
        %133 = arith.constant 0 : i64
        %134 = arith.cmpi sgt, %132, %133 : i64
        scf.if %134 {
          %135 = func.call @stack_pop_pointer() : () -> i64
        }
        %136 = func.call @cc_nil_value() : () -> i64
        %137 = llvm.mlir.addressof @str10 : !llvm.ptr
        %138 = arith.constant 3 : i64
        %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
        %140 = llvm.mlir.addressof @str11 : !llvm.ptr
        %141 = arith.constant 7 : i64
        %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
        %143 = func.call @cc_intern(%139, %142) : (i64, i64) -> i64
        %144 = func.call @cc_nil_value() : () -> i64
        %145 = func.call @cc_cons(%143, %144) : (i64, i64) -> i64
        %146 = func.call @cc_values_pack(%145) : (i64) -> i64
        %147 = func.call @cc_nil_value() : () -> i64
        %148 = func.call @cc_errorp(%12) : (i64) -> i64
        %149 = arith.cmpi ne, %148, %147 : i64
        %150 = arith.cmpi eq, %147, %147 : i64
        %151 = arith.andi %149, %150 : i1
        %152 = scf.if %151 -> (i64) {
          scf.yield %12 : i64
        } else {
          scf.yield %147 : i64
        }
        %153 = func.call @cc_errorp(%136) : (i64) -> i64
        %154 = arith.cmpi ne, %153, %147 : i64
        %155 = arith.cmpi eq, %152, %147 : i64
        %156 = arith.andi %154, %155 : i1
        %157 = scf.if %156 -> (i64) {
          scf.yield %136 : i64
        } else {
          scf.yield %152 : i64
        }
        %158 = func.call @cc_errorp(%143) : (i64) -> i64
        %159 = arith.cmpi ne, %158, %147 : i64
        %160 = arith.cmpi eq, %157, %147 : i64
        %161 = arith.andi %159, %160 : i1
        %162 = scf.if %161 -> (i64) {
          scf.yield %143 : i64
        } else {
          scf.yield %157 : i64
        }
        %163 = arith.cmpi ne, %162, %147 : i64
        scf.if %163 {
          func.call @stack_push_pointer(%162) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%12) : (i64) -> ()
          func.call @stack_push_pointer(%136) : (i64) -> ()
          func.call @stack_push_pointer(%143) : (i64) -> ()
          %164 = llvm.mlir.addressof @str12 : !llvm.ptr
          %165 = func.call @cc_make_function_ref_const(%164) : (!llvm.ptr) -> i64
          %166 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%165, %166) : (i64, i64) -> ()
        }
        %167 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%167) : (i64) -> ()
        %168 = func.call @stack_depth() : () -> i64
        %169 = arith.constant 0 : i64
        %170 = arith.cmpi sgt, %168, %169 : i64
        scf.if %170 {
          %171 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%167) : (i64) -> ()
        %172 = llvm.mlir.addressof @str13 : !llvm.ptr
        %173 = arith.constant 3 : i64
        %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
        %175 = llvm.mlir.addressof @str14 : !llvm.ptr
        %176 = arith.constant 7 : i64
        %177 = func.call @cc_make_string(%175, %176) : (!llvm.ptr, i64) -> i64
        %178 = func.call @cc_intern(%174, %177) : (i64, i64) -> i64
        %179 = func.call @cc_nil_value() : () -> i64
        %180 = func.call @cc_cons(%178, %179) : (i64, i64) -> i64
        %181 = func.call @cc_values_pack(%180) : (i64) -> i64
        %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
        %182 = arith.addi %178, %__rlasp_stack_elide_zero_6 : i64
        %183 = func.call @stack_pop_pointer() : () -> i64
        %184 = func.call @cc_eq(%183, %182) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
        %185 = arith.addi %184, %__rlasp_stack_elide_zero_7 : i64
        %186 = func.call @cc_nil_value() : () -> i64
        %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
        %188 = func.call @cc_not(%187) : (i64) -> i64
        %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
        %189 = arith.addi %188, %__rlasp_stack_elide_zero_8 : i64
        %190 = func.call @cc_nil_value() : () -> i64
        %191 = arith.cmpi ne, %189, %190 : i64
        %192:2 = scf.if %191 -> (i64, i64) {
          func.call @stack_push_nil() : () -> ()
          %193 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %193, %123 : i64, i64
        } else {
          %194 = func.call @cc_nil_value() : () -> i64
          %195 = func.call @cc_nil_value() : () -> i64
          %196 = func.call @cc_errorp(%194) : (i64) -> i64
          %197 = arith.cmpi ne, %196, %195 : i64
          %198:2 = scf.if %197 -> (i64, i64) {
            scf.yield %194, %123 : i64, i64
          } else {
            %199 = func.call @cc_t_value() : () -> i64
            %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
            %200 = arith.addi %199, %__rlasp_stack_elide_zero_9 : i64
            scf.yield %200, %199 : i64, i64
          }
          %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
          %201 = arith.addi %198#0, %__rlasp_stack_elide_zero_10 : i64
          scf.yield %201, %198#1 : i64, i64
        }
        func.call @stack_push_pointer(%192#0) : (i64) -> ()
        %202 = func.call @stack_depth() : () -> i64
        %203 = arith.constant 0 : i64
        %204 = arith.cmpi sgt, %202, %203 : i64
        scf.if %204 {
          %205 = func.call @stack_pop_pointer() : () -> i64
        }
        %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
        %206 = arith.addi %192#1, %__rlasp_stack_elide_zero_11 : i64
        %207 = func.call @cc_nil_value() : () -> i64
        %208 = arith.cmpi ne, %206, %207 : i64
        %209:2 = scf.if %208 -> (i64, i64) {
          func.call @stack_push_nil() : () -> ()
          %210 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %210, %128#1 : i64, i64
        } else {
          %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
          %211 = arith.addi %167, %__rlasp_stack_elide_zero_12 : i64
          scf.yield %211, %167 : i64, i64
        }
        func.call @stack_push_pointer(%209#0) : (i64) -> ()
        %212 = func.call @stack_depth() : () -> i64
        %213 = arith.constant 0 : i64
        %214 = arith.cmpi sgt, %212, %213 : i64
        scf.if %214 {
          %215 = func.call @stack_pop_pointer() : () -> i64
        }
        %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
        %216 = arith.addi %192#1, %__rlasp_stack_elide_zero_13 : i64
        %217 = func.call @cc_nil_value() : () -> i64
        %218 = arith.cmpi ne, %216, %217 : i64
        %219:2 = scf.if %218 -> (i64, i64) {
          func.call @stack_push_nil() : () -> ()
          %220 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %220, %124 : i64, i64
        } else {
          %221 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
          %222 = arith.addi %221, %__rlasp_stack_elide_zero_14 : i64
          scf.yield %222, %221 : i64, i64
        }
        func.call @stack_push_pointer(%219#0) : (i64) -> ()
        %223 = func.call @stack_depth() : () -> i64
        %224 = arith.constant 0 : i64
        %225 = arith.cmpi sgt, %223, %224 : i64
        scf.if %225 {
          %226 = func.call @stack_pop_pointer() : () -> i64
        }
        scf.yield %209#1, %167, %192#1, %219#1 : i64, i64, i64, i64
      }
      func.call @stack_push_nil() : () -> ()
      %227 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %228 = arith.addi %44, %__rlasp_stack_elide_zero_15 : i64
      %229 = func.call @cc_nil_value() : () -> i64
      %230 = arith.cmpi ne, %228, %229 : i64
      scf.if %230 {
        %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
        %231 = arith.addi %46, %__rlasp_stack_elide_zero_16 : i64
        %232 = func.call @cc_values_pack(%231) : (i64) -> i64
        func.call @stack_push_pointer(%232) : (i64) -> ()
      } else {
        %233 = func.call @cc_nil_value() : () -> i64
        %234 = func.call @cc_nil_value() : () -> i64
        %235 = func.call @cc_errorp(%233) : (i64) -> i64
        %236 = arith.cmpi ne, %235, %234 : i64
        %237 = scf.if %236 -> (i64) {
          scf.yield %233 : i64
        } else {
          %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
          %238 = arith.addi %81#0, %__rlasp_stack_elide_zero_17 : i64
          %239 = func.call @cc_multiple_value_list(%238) : (i64) -> i64
          %240 = func.call @cc_t_value() : () -> i64
          %241 = llvm.mlir.addressof @str15 : !llvm.ptr
          %242 = arith.constant 38 : i64
          %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
          %244 = func.call @cc_nil_value() : () -> i64
          %245 = func.call @cc_intern(%243, %244) : (i64, i64) -> i64
          %246 = func.call @cc_nil_value() : () -> i64
          %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
          %248 = func.call @cc_values_pack(%247) : (i64) -> i64
          %249 = func.call @cc_set_symbol_value(%245, %240) : (i64, i64) -> i64
          %250 = llvm.mlir.addressof @str16 : !llvm.ptr
          %251 = arith.constant 39 : i64
          %252 = func.call @cc_make_string(%250, %251) : (!llvm.ptr, i64) -> i64
          %253 = func.call @cc_nil_value() : () -> i64
          %254 = func.call @cc_intern(%252, %253) : (i64, i64) -> i64
          %255 = func.call @cc_nil_value() : () -> i64
          %256 = func.call @cc_cons(%254, %255) : (i64, i64) -> i64
          %257 = func.call @cc_values_pack(%256) : (i64) -> i64
          %258 = func.call @cc_set_symbol_value(%254, %238) : (i64, i64) -> i64
          %259 = llvm.mlir.addressof @str17 : !llvm.ptr
          %260 = arith.constant 40 : i64
          %261 = func.call @cc_make_string(%259, %260) : (!llvm.ptr, i64) -> i64
          %262 = func.call @cc_nil_value() : () -> i64
          %263 = func.call @cc_intern(%261, %262) : (i64, i64) -> i64
          %264 = func.call @cc_nil_value() : () -> i64
          %265 = func.call @cc_cons(%263, %264) : (i64, i64) -> i64
          %266 = func.call @cc_values_pack(%265) : (i64) -> i64
          %267 = func.call @cc_set_symbol_value(%263, %239) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
          %268 = arith.addi %238, %__rlasp_stack_elide_zero_18 : i64
          scf.yield %268 : i64
        }
        func.call @stack_push_pointer(%237) : (i64) -> ()
      }
      %269 = func.call @stack_pop_pointer() : () -> i64
      %270 = func.call @cc_multiple_value_list(%269) : (i64) -> i64
      %271 = llvm.mlir.addressof @str18 : !llvm.ptr
      %272 = arith.constant 38 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_intern(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
      %278 = func.call @cc_values_pack(%277) : (i64) -> i64
      %279 = func.call @cc_symbol_value(%275) : (i64) -> i64
      %280 = llvm.mlir.addressof @str19 : !llvm.ptr
      %281 = arith.constant 39 : i64
      %282 = func.call @cc_make_string(%280, %281) : (!llvm.ptr, i64) -> i64
      %283 = func.call @cc_nil_value() : () -> i64
      %284 = func.call @cc_intern(%282, %283) : (i64, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_cons(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_values_pack(%286) : (i64) -> i64
      %288 = func.call @cc_symbol_value(%284) : (i64) -> i64
      %289 = llvm.mlir.addressof @str20 : !llvm.ptr
      %290 = arith.constant 40 : i64
      %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_values_pack(%295) : (i64) -> i64
      %297 = func.call @cc_symbol_value(%293) : (i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = arith.cmpi ne, %279, %298 : i64
      %300 = scf.if %299 -> (i64) {
        scf.yield %297 : i64
      } else {
        scf.yield %270 : i64
      }
      %301 = func.call @cc_values_pack(%300) : (i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %302 = arith.addi %301, %__rlasp_stack_elide_zero_19 : i64
      scf.yield %302 : i64
    }
    %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
    %303 = arith.addi %52, %__rlasp_stack_elide_zero_20 : i64
    %304 = func.call @cc_multiple_value_list(%303) : (i64) -> i64
    %305 = llvm.mlir.addressof @str21 : !llvm.ptr
    %306 = arith.constant 38 : i64
    %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
    %308 = func.call @cc_nil_value() : () -> i64
    %309 = func.call @cc_intern(%307, %308) : (i64, i64) -> i64
    %310 = func.call @cc_nil_value() : () -> i64
    %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
    %312 = func.call @cc_values_pack(%311) : (i64) -> i64
    %313 = func.call @cc_symbol_value(%309) : (i64) -> i64
    %314 = llvm.mlir.addressof @str22 : !llvm.ptr
    %315 = arith.constant 40 : i64
    %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
    %317 = func.call @cc_nil_value() : () -> i64
    %318 = func.call @cc_intern(%316, %317) : (i64, i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
    %321 = func.call @cc_values_pack(%320) : (i64) -> i64
    %322 = func.call @cc_symbol_value(%318) : (i64) -> i64
    %323 = func.call @cc_nil_value() : () -> i64
    %324 = arith.cmpi ne, %313, %323 : i64
    %325 = scf.if %324 -> (i64) {
      scf.yield %322 : i64
    } else {
      scf.yield %304 : i64
    }
    %326 = func.call @cc_values_pack(%325) : (i64) -> i64
    func.call @stack_push_pointer(%326) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %327 = llvm.mlir.addressof @str23 : !llvm.ptr
    %328 = arith.constant 6 : i64
    %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
    %330 = func.call @cc_nil_value() : () -> i64
    %331 = func.call @cc_intern(%329, %330) : (i64, i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = func.call @cc_cons(%331, %332) : (i64, i64) -> i64
    %334 = func.call @cc_values_pack(%333) : (i64) -> i64
    %335 = func.call @cc_nil_value() : () -> i64
    %336 = llvm.mlir.addressof @str24 : !llvm.ptr
    %337 = arith.constant 38 : i64
    %338 = func.call @cc_make_string(%336, %337) : (!llvm.ptr, i64) -> i64
    %339 = func.call @cc_nil_value() : () -> i64
    %340 = func.call @cc_intern(%338, %339) : (i64, i64) -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_cons(%340, %341) : (i64, i64) -> i64
    %343 = func.call @cc_values_pack(%342) : (i64) -> i64
    %344 = func.call @cc_set_symbol_value(%340, %335) : (i64, i64) -> i64
    %345 = llvm.mlir.addressof @str25 : !llvm.ptr
    %346 = arith.constant 39 : i64
    %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
    %348 = func.call @cc_nil_value() : () -> i64
    %349 = func.call @cc_intern(%347, %348) : (i64, i64) -> i64
    %350 = func.call @cc_nil_value() : () -> i64
    %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
    %352 = func.call @cc_values_pack(%351) : (i64) -> i64
    %353 = func.call @cc_set_symbol_value(%349, %335) : (i64, i64) -> i64
    %354 = llvm.mlir.addressof @str26 : !llvm.ptr
    %355 = arith.constant 40 : i64
    %356 = func.call @cc_make_string(%354, %355) : (!llvm.ptr, i64) -> i64
    %357 = func.call @cc_nil_value() : () -> i64
    %358 = func.call @cc_intern(%356, %357) : (i64, i64) -> i64
    %359 = func.call @cc_nil_value() : () -> i64
    %360 = func.call @cc_cons(%358, %359) : (i64, i64) -> i64
    %361 = func.call @cc_values_pack(%360) : (i64) -> i64
    %362 = func.call @cc_set_symbol_value(%358, %335) : (i64, i64) -> i64
    %363 = func.call @cc_nil_value() : () -> i64
    %364 = func.call @cc_nil_value() : () -> i64
    %365 = func.call @cc_errorp(%363) : (i64) -> i64
    %366 = arith.cmpi ne, %365, %364 : i64
    %367 = scf.if %366 -> (i64) {
      scf.yield %363 : i64
    } else {
      %368 = llvm.mlir.addressof @str27 : !llvm.ptr
      %369 = arith.constant 11 : i64
      %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_intern(%370, %371) : (i64, i64) -> i64
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
      %375 = func.call @cc_values_pack(%374) : (i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %376 = arith.addi %372, %__rlasp_stack_elide_zero_21 : i64
      %377 = func.call @cc_in_package(%376) : (i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %378 = arith.addi %377, %__rlasp_stack_elide_zero_22 : i64
      scf.yield %378 : i64
    }
    %379 = func.call @cc_nil_value() : () -> i64
    %380 = func.call @cc_errorp(%367) : (i64) -> i64
    %381 = arith.cmpi ne, %380, %379 : i64
    %382 = scf.if %381 -> (i64) {
      scf.yield %367 : i64
    } else {
      %383 = llvm.mlir.addressof @str28 : !llvm.ptr
      %384 = arith.constant 8 : i64
      %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
      %386 = func.call @cc_nil_value() : () -> i64
      %387 = func.call @cc_intern(%385, %386) : (i64, i64) -> i64
      %388 = func.call @cc_nil_value() : () -> i64
      %389 = func.call @cc_cons(%387, %388) : (i64, i64) -> i64
      %390 = func.call @cc_values_pack(%389) : (i64) -> i64
      %391 = arith.constant 0 : i64
      %392 = func.call @cc_box_fixnum(%391) : (i64) -> i64
      %393 = func.call @cc_nil_value() : () -> i64
      %394 = func.call @cc_errorp(%392) : (i64) -> i64
      %395 = arith.cmpi ne, %394, %393 : i64
      %396 = arith.cmpi eq, %393, %393 : i64
      %397 = arith.andi %395, %396 : i1
      %398 = scf.if %397 -> (i64) {
        scf.yield %392 : i64
      } else {
        scf.yield %393 : i64
      }
      %399 = arith.cmpi ne, %398, %393 : i64
      scf.if %399 {
        func.call @stack_push_pointer(%398) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%392) : (i64) -> ()
        %400 = llvm.mlir.addressof @str29 : !llvm.ptr
        %401 = func.call @cc_make_function_ref_const(%400) : (!llvm.ptr) -> i64
        %402 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%401, %402) : (i64, i64) -> ()
      }
      %403 = func.call @stack_pop_pointer() : () -> i64
      %404 = func.call @cc_set_symbol_value(%387, %403) : (i64, i64) -> i64
      %405 = func.call @cc_errorp(%404) : (i64) -> i64
      %406 = func.call @cc_nil_value() : () -> i64
      %407 = arith.cmpi ne, %405, %406 : i64
      scf.if %407 {
        func.call @stack_push_pointer(%404) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%387) : (i64) -> ()
      }
      %408 = func.call @stack_pop_pointer() : () -> i64
      %409 = func.call @cc_nil_value() : () -> i64
      %410 = func.call @cc_errorp(%408) : (i64) -> i64
      %411 = arith.cmpi ne, %410, %409 : i64
      %412 = scf.if %411 -> (i64) {
        scf.yield %408 : i64
      } else {
        %413 = llvm.mlir.addressof @str30 : !llvm.ptr
        %414 = arith.constant 18 : i64
        %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
        %416 = func.call @cc_nil_value() : () -> i64
        %417 = func.call @cc_intern(%415, %416) : (i64, i64) -> i64
        %418 = func.call @cc_nil_value() : () -> i64
        %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
        %420 = func.call @cc_values_pack(%419) : (i64) -> i64
        %421 = llvm.mlir.addressof @str31 : !llvm.ptr
        %422 = arith.constant 60 : i64
        %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
        %424 = arith.addi %423, %__rlasp_stack_elide_zero_23 : i64
        %425 = func.call @cc_set_symbol_value(%417, %424) : (i64, i64) -> i64
        %426 = func.call @cc_errorp(%425) : (i64) -> i64
        %427 = func.call @cc_nil_value() : () -> i64
        %428 = arith.cmpi ne, %426, %427 : i64
        scf.if %428 {
          func.call @stack_push_pointer(%425) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%417) : (i64) -> ()
        }
        %429 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %429 : i64
      }
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %430 = arith.addi %412, %__rlasp_stack_elide_zero_24 : i64
      scf.yield %430 : i64
    }
    %431 = func.call @cc_nil_value() : () -> i64
    %432 = func.call @cc_errorp(%382) : (i64) -> i64
    %433 = arith.cmpi ne, %432, %431 : i64
    %434 = scf.if %433 -> (i64) {
      scf.yield %382 : i64
    } else {
      %435 = llvm.mlir.addressof @str32 : !llvm.ptr
      %436 = arith.constant 20 : i64
      %437 = func.call @cc_make_string(%435, %436) : (!llvm.ptr, i64) -> i64
      %438 = func.call @cc_nil_value() : () -> i64
      %439 = func.call @cc_intern(%437, %438) : (i64, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_values_pack(%441) : (i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %443 = arith.addi %439, %__rlasp_stack_elide_zero_25 : i64
      %444 = llvm.mlir.addressof @str33 : !llvm.ptr
      %445 = arith.constant 16 : i64
      %446 = func.call @cc_make_string(%444, %445) : (!llvm.ptr, i64) -> i64
      %447 = func.call @cc_nil_value() : () -> i64
      %448 = func.call @cc_intern(%446, %447) : (i64, i64) -> i64
      %449 = func.call @cc_nil_value() : () -> i64
      %450 = func.call @cc_cons(%448, %449) : (i64, i64) -> i64
      %451 = func.call @cc_values_pack(%450) : (i64) -> i64
      func.call @stack_push_pointer(%448) : (i64) -> ()
      %452 = llvm.mlir.addressof @str34 : !llvm.ptr
      %453 = arith.constant 13 : i64
      %454 = func.call @cc_make_string(%452, %453) : (!llvm.ptr, i64) -> i64
      %455 = func.call @cc_nil_value() : () -> i64
      %456 = func.call @cc_intern(%454, %455) : (i64, i64) -> i64
      %457 = func.call @cc_nil_value() : () -> i64
      %458 = func.call @cc_cons(%456, %457) : (i64, i64) -> i64
      %459 = func.call @cc_values_pack(%458) : (i64) -> i64
      func.call @stack_push_pointer(%456) : (i64) -> ()
      %460 = llvm.mlir.addressof @str35 : !llvm.ptr
      %461 = arith.constant 1 : i64
      %462 = func.call @cc_make_string(%460, %461) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%462) : (i64) -> ()
      %463 = llvm.mlir.addressof @str36 : !llvm.ptr
      %464 = arith.constant 3 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      %466 = llvm.mlir.addressof @str37 : !llvm.ptr
      %467 = arith.constant 3 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %469 = llvm.mlir.addressof @str38 : !llvm.ptr
      %470 = arith.constant 5 : i64
      %471 = func.call @cc_make_string(%469, %470) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @cc_cons(%473, %472) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %475 = arith.addi %474, %__rlasp_stack_elide_zero_26 : i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %478 = arith.addi %477, %__rlasp_stack_elide_zero_27 : i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %481 = arith.addi %480, %__rlasp_stack_elide_zero_28 : i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %487 = arith.addi %486, %__rlasp_stack_elide_zero_29 : i64
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @cc_cons(%488, %487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%489) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %490 = func.call @stack_pop_pointer() : () -> i64
      %491 = func.call @stack_pop_pointer() : () -> i64
      %492 = func.call @cc_cons(%491, %490) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %493 = arith.addi %492, %__rlasp_stack_elide_zero_30 : i64
      %494 = func.call @stack_pop_pointer() : () -> i64
      %495 = func.call @cc_cons(%494, %493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %496 = arith.addi %495, %__rlasp_stack_elide_zero_31 : i64
      %733 = llvm.mlir.addressof @str66 : !llvm.ptr
      %734 = arith.constant 42 : i64
      %735 = func.call @cc_make_symbol(%733, %734) : (!llvm.ptr, i64) -> i64
      %736 = func.call @cc_persistent_root_value(%735) : (i64) -> i64
      func.call @stack_push_pointer(%736) : (i64) -> ()
      %737 = arith.constant 263377075044355 : i64
      %738 = arith.constant 1 : i64
      %739 = func.call @cc_make_closure(%737, %738) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %740 = arith.addi %739, %__rlasp_stack_elide_zero_32 : i64
      func.call @stack_push_nil() : () -> ()
      %741 = llvm.mlir.addressof @str67 : !llvm.ptr
      %742 = arith.constant 6 : i64
      %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
      %744 = llvm.mlir.addressof @str68 : !llvm.ptr
      %745 = arith.constant 7 : i64
      %746 = func.call @cc_make_string(%744, %745) : (!llvm.ptr, i64) -> i64
      %747 = func.call @cc_intern(%743, %746) : (i64, i64) -> i64
      %748 = func.call @cc_nil_value() : () -> i64
      %749 = func.call @cc_cons(%747, %748) : (i64, i64) -> i64
      %750 = func.call @cc_values_pack(%749) : (i64) -> i64
      func.call @stack_push_pointer(%747) : (i64) -> ()
      %751 = arith.constant 19 : i64
      func.call @stack_push_fixnum(%751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @cc_cons(%753, %752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %755 = arith.addi %754, %__rlasp_stack_elide_zero_33 : i64
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @cc_cons(%756, %755) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %758 = arith.addi %757, %__rlasp_stack_elide_zero_34 : i64
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @cc_cons(%759, %758) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %761 = arith.addi %760, %__rlasp_stack_elide_zero_35 : i64
      %762 = llvm.mlir.addressof @str69 : !llvm.ptr
      %763 = arith.constant 11 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = llvm.mlir.addressof @str70 : !llvm.ptr
      %766 = arith.constant 7 : i64
      %767 = func.call @cc_make_string(%765, %766) : (!llvm.ptr, i64) -> i64
      %768 = func.call @cc_intern(%764, %767) : (i64, i64) -> i64
      %769 = func.call @cc_nil_value() : () -> i64
      %770 = func.call @cc_cons(%768, %769) : (i64, i64) -> i64
      %771 = func.call @cc_values_pack(%770) : (i64) -> i64
      %772 = func.call @cc_nil_value() : () -> i64
      %773 = llvm.mlir.addressof @str71 : !llvm.ptr
      %774 = arith.constant 4 : i64
      %775 = func.call @cc_make_string(%773, %774) : (!llvm.ptr, i64) -> i64
      %776 = llvm.mlir.addressof @str72 : !llvm.ptr
      %777 = arith.constant 7 : i64
      %778 = func.call @cc_make_string(%776, %777) : (!llvm.ptr, i64) -> i64
      %779 = func.call @cc_intern(%775, %778) : (i64, i64) -> i64
      %780 = func.call @cc_nil_value() : () -> i64
      %781 = func.call @cc_cons(%779, %780) : (i64, i64) -> i64
      %782 = func.call @cc_values_pack(%781) : (i64) -> i64
      %783 = llvm.mlir.addressof @str73 : !llvm.ptr
      %784 = arith.constant 6 : i64
      %785 = func.call @cc_make_string(%783, %784) : (!llvm.ptr, i64) -> i64
      %786 = func.call @cc_nil_value() : () -> i64
      %787 = func.call @cc_intern(%785, %786) : (i64, i64) -> i64
      %788 = func.call @cc_nil_value() : () -> i64
      %789 = func.call @cc_cons(%787, %788) : (i64, i64) -> i64
      %790 = func.call @cc_values_pack(%789) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %791 = arith.addi %787, %__rlasp_stack_elide_zero_36 : i64
      %792 = func.call @cc_nil_value() : () -> i64
      %793 = func.call @cc_errorp(%443) : (i64) -> i64
      %794 = arith.cmpi ne, %793, %792 : i64
      %795 = arith.cmpi eq, %792, %792 : i64
      %796 = arith.andi %794, %795 : i1
      %797 = scf.if %796 -> (i64) {
        scf.yield %443 : i64
      } else {
        scf.yield %792 : i64
      }
      %798 = func.call @cc_errorp(%496) : (i64) -> i64
      %799 = arith.cmpi ne, %798, %792 : i64
      %800 = arith.cmpi eq, %797, %792 : i64
      %801 = arith.andi %799, %800 : i1
      %802 = scf.if %801 -> (i64) {
        scf.yield %496 : i64
      } else {
        scf.yield %797 : i64
      }
      %803 = func.call @cc_errorp(%740) : (i64) -> i64
      %804 = arith.cmpi ne, %803, %792 : i64
      %805 = arith.cmpi eq, %802, %792 : i64
      %806 = arith.andi %804, %805 : i1
      %807 = scf.if %806 -> (i64) {
        scf.yield %740 : i64
      } else {
        scf.yield %802 : i64
      }
      %808 = func.call @cc_errorp(%761) : (i64) -> i64
      %809 = arith.cmpi ne, %808, %792 : i64
      %810 = arith.cmpi eq, %807, %792 : i64
      %811 = arith.andi %809, %810 : i1
      %812 = scf.if %811 -> (i64) {
        scf.yield %761 : i64
      } else {
        scf.yield %807 : i64
      }
      %813 = func.call @cc_errorp(%768) : (i64) -> i64
      %814 = arith.cmpi ne, %813, %792 : i64
      %815 = arith.cmpi eq, %812, %792 : i64
      %816 = arith.andi %814, %815 : i1
      %817 = scf.if %816 -> (i64) {
        scf.yield %768 : i64
      } else {
        scf.yield %812 : i64
      }
      %818 = func.call @cc_errorp(%772) : (i64) -> i64
      %819 = arith.cmpi ne, %818, %792 : i64
      %820 = arith.cmpi eq, %817, %792 : i64
      %821 = arith.andi %819, %820 : i1
      %822 = scf.if %821 -> (i64) {
        scf.yield %772 : i64
      } else {
        scf.yield %817 : i64
      }
      %823 = func.call @cc_errorp(%779) : (i64) -> i64
      %824 = arith.cmpi ne, %823, %792 : i64
      %825 = arith.cmpi eq, %822, %792 : i64
      %826 = arith.andi %824, %825 : i1
      %827 = scf.if %826 -> (i64) {
        scf.yield %779 : i64
      } else {
        scf.yield %822 : i64
      }
      %828 = func.call @cc_errorp(%791) : (i64) -> i64
      %829 = arith.cmpi ne, %828, %792 : i64
      %830 = arith.cmpi eq, %827, %792 : i64
      %831 = arith.andi %829, %830 : i1
      %832 = scf.if %831 -> (i64) {
        scf.yield %791 : i64
      } else {
        scf.yield %827 : i64
      }
      %833 = arith.cmpi ne, %832, %792 : i64
      scf.if %833 {
        func.call @stack_push_pointer(%832) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%443) : (i64) -> ()
        func.call @stack_push_pointer(%496) : (i64) -> ()
        func.call @stack_push_pointer(%740) : (i64) -> ()
        func.call @stack_push_pointer(%761) : (i64) -> ()
        func.call @stack_push_pointer(%768) : (i64) -> ()
        func.call @stack_push_pointer(%772) : (i64) -> ()
        func.call @stack_push_pointer(%779) : (i64) -> ()
        func.call @stack_push_pointer(%791) : (i64) -> ()
        %834 = llvm.mlir.addressof @str74 : !llvm.ptr
        %835 = func.call @cc_make_function_ref_const(%834) : (!llvm.ptr) -> i64
        %836 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%835, %836) : (i64, i64) -> ()
      }
      %837 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %837 : i64
    }
    %838 = func.call @cc_nil_value() : () -> i64
    %839 = func.call @cc_errorp(%434) : (i64) -> i64
    %840 = arith.cmpi ne, %839, %838 : i64
    %841 = scf.if %840 -> (i64) {
      scf.yield %434 : i64
    } else {
      %842 = llvm.mlir.addressof @str75 : !llvm.ptr
      %843 = arith.constant 16 : i64
      %844 = func.call @cc_make_string(%842, %843) : (!llvm.ptr, i64) -> i64
      %845 = func.call @cc_nil_value() : () -> i64
      %846 = func.call @cc_intern(%844, %845) : (i64, i64) -> i64
      %847 = func.call @cc_nil_value() : () -> i64
      %848 = func.call @cc_cons(%846, %847) : (i64, i64) -> i64
      %849 = func.call @cc_values_pack(%848) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %850 = arith.addi %846, %__rlasp_stack_elide_zero_37 : i64
      %851 = llvm.mlir.addressof @str76 : !llvm.ptr
      %852 = arith.constant 16 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = func.call @cc_nil_value() : () -> i64
      %855 = func.call @cc_intern(%853, %854) : (i64, i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = func.call @cc_cons(%855, %856) : (i64, i64) -> i64
      %858 = func.call @cc_values_pack(%857) : (i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %859 = llvm.mlir.addressof @str77 : !llvm.ptr
      %860 = arith.constant 10 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = func.call @cc_nil_value() : () -> i64
      %863 = func.call @cc_intern(%861, %862) : (i64, i64) -> i64
      %864 = func.call @cc_nil_value() : () -> i64
      %865 = func.call @cc_cons(%863, %864) : (i64, i64) -> i64
      %866 = func.call @cc_values_pack(%865) : (i64) -> i64
      func.call @stack_push_pointer(%863) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %867 = llvm.mlir.addressof @str78 : !llvm.ptr
      %868 = arith.constant 6 : i64
      %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
      %870 = llvm.mlir.addressof @str79 : !llvm.ptr
      %871 = arith.constant 7 : i64
      %872 = func.call @cc_make_string(%870, %871) : (!llvm.ptr, i64) -> i64
      %873 = func.call @cc_intern(%869, %872) : (i64, i64) -> i64
      %874 = func.call @cc_nil_value() : () -> i64
      %875 = func.call @cc_cons(%873, %874) : (i64, i64) -> i64
      %876 = func.call @cc_values_pack(%875) : (i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      %877 = llvm.mlir.addressof @str80 : !llvm.ptr
      %878 = arith.constant 6 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      %880 = llvm.mlir.addressof @str81 : !llvm.ptr
      %881 = arith.constant 7 : i64
      %882 = func.call @cc_make_string(%880, %881) : (!llvm.ptr, i64) -> i64
      %883 = func.call @cc_intern(%879, %882) : (i64, i64) -> i64
      %884 = func.call @cc_nil_value() : () -> i64
      %885 = func.call @cc_cons(%883, %884) : (i64, i64) -> i64
      %886 = func.call @cc_values_pack(%885) : (i64) -> i64
      func.call @stack_push_pointer(%883) : (i64) -> ()
      %887 = llvm.mlir.addressof @str82 : !llvm.ptr
      %888 = arith.constant 5 : i64
      %889 = func.call @cc_make_string(%887, %888) : (!llvm.ptr, i64) -> i64
      %890 = llvm.mlir.addressof @str83 : !llvm.ptr
      %891 = arith.constant 7 : i64
      %892 = func.call @cc_make_string(%890, %891) : (!llvm.ptr, i64) -> i64
      %893 = func.call @cc_intern(%889, %892) : (i64, i64) -> i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = func.call @cc_cons(%893, %894) : (i64, i64) -> i64
      %896 = func.call @cc_values_pack(%895) : (i64) -> i64
      func.call @stack_push_pointer(%893) : (i64) -> ()
      %897 = llvm.mlir.addressof @str84 : !llvm.ptr
      %898 = arith.constant 6 : i64
      %899 = func.call @cc_make_string(%897, %898) : (!llvm.ptr, i64) -> i64
      %900 = llvm.mlir.addressof @str85 : !llvm.ptr
      %901 = arith.constant 7 : i64
      %902 = func.call @cc_make_string(%900, %901) : (!llvm.ptr, i64) -> i64
      %903 = func.call @cc_intern(%899, %902) : (i64, i64) -> i64
      %904 = func.call @cc_nil_value() : () -> i64
      %905 = func.call @cc_cons(%903, %904) : (i64, i64) -> i64
      %906 = func.call @cc_values_pack(%905) : (i64) -> i64
      func.call @stack_push_pointer(%903) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @stack_pop_pointer() : () -> i64
      %909 = func.call @cc_cons(%908, %907) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %910 = arith.addi %909, %__rlasp_stack_elide_zero_38 : i64
      %911 = func.call @stack_pop_pointer() : () -> i64
      %912 = func.call @cc_cons(%911, %910) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %913 = arith.addi %912, %__rlasp_stack_elide_zero_39 : i64
      %914 = func.call @stack_pop_pointer() : () -> i64
      %915 = func.call @cc_cons(%914, %913) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %916 = arith.addi %915, %__rlasp_stack_elide_zero_40 : i64
      %917 = func.call @stack_pop_pointer() : () -> i64
      %918 = func.call @cc_cons(%917, %916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %919 = arith.addi %918, %__rlasp_stack_elide_zero_41 : i64
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = func.call @cc_cons(%920, %919) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %922 = arith.addi %921, %__rlasp_stack_elide_zero_42 : i64
      %923 = func.call @stack_pop_pointer() : () -> i64
      %924 = func.call @cc_cons(%923, %922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%924) : (i64) -> ()
      %925 = llvm.mlir.addressof @str86 : !llvm.ptr
      %926 = arith.constant 3 : i64
      %927 = func.call @cc_make_string(%925, %926) : (!llvm.ptr, i64) -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      %929 = func.call @cc_intern(%927, %928) : (i64, i64) -> i64
      %930 = func.call @cc_nil_value() : () -> i64
      %931 = func.call @cc_cons(%929, %930) : (i64, i64) -> i64
      %932 = func.call @cc_values_pack(%931) : (i64) -> i64
      func.call @stack_push_pointer(%929) : (i64) -> ()
      %933 = llvm.mlir.addressof @str87 : !llvm.ptr
      %934 = arith.constant 14 : i64
      %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
      %936 = func.call @cc_nil_value() : () -> i64
      %937 = func.call @cc_intern(%935, %936) : (i64, i64) -> i64
      %938 = func.call @cc_nil_value() : () -> i64
      %939 = func.call @cc_cons(%937, %938) : (i64, i64) -> i64
      %940 = func.call @cc_values_pack(%939) : (i64) -> i64
      func.call @stack_push_pointer(%937) : (i64) -> ()
      %941 = llvm.mlir.addressof @str88 : !llvm.ptr
      %942 = arith.constant 29 : i64
      %943 = func.call @cc_make_string(%941, %942) : (!llvm.ptr, i64) -> i64
      %944 = llvm.mlir.addressof @str89 : !llvm.ptr
      %945 = arith.constant 3 : i64
      %946 = func.call @cc_make_string(%944, %945) : (!llvm.ptr, i64) -> i64
      %947 = func.call @cc_intern(%943, %946) : (i64, i64) -> i64
      %948 = func.call @cc_nil_value() : () -> i64
      %949 = func.call @cc_cons(%947, %948) : (i64, i64) -> i64
      %950 = func.call @cc_values_pack(%949) : (i64) -> i64
      func.call @stack_push_pointer(%947) : (i64) -> ()
      %951 = llvm.mlir.addressof @str90 : !llvm.ptr
      %952 = arith.constant 7 : i64
      %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      func.call @stack_push_pointer(%955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %959 = func.call @stack_pop_pointer() : () -> i64
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = func.call @cc_cons(%960, %959) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %962 = arith.addi %961, %__rlasp_stack_elide_zero_43 : i64
      %963 = func.call @stack_pop_pointer() : () -> i64
      %964 = func.call @cc_cons(%963, %962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%964) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %965 = func.call @stack_pop_pointer() : () -> i64
      %966 = func.call @stack_pop_pointer() : () -> i64
      %967 = func.call @cc_cons(%966, %965) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %968 = arith.addi %967, %__rlasp_stack_elide_zero_44 : i64
      %969 = func.call @stack_pop_pointer() : () -> i64
      %970 = func.call @cc_cons(%969, %968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%970) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %971 = func.call @stack_pop_pointer() : () -> i64
      %972 = func.call @stack_pop_pointer() : () -> i64
      %973 = func.call @cc_cons(%972, %971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%973) : (i64) -> ()
      %974 = llvm.mlir.addressof @str91 : !llvm.ptr
      %975 = arith.constant 6 : i64
      %976 = func.call @cc_make_string(%974, %975) : (!llvm.ptr, i64) -> i64
      %977 = llvm.mlir.addressof @str92 : !llvm.ptr
      %978 = arith.constant 11 : i64
      %979 = func.call @cc_make_string(%977, %978) : (!llvm.ptr, i64) -> i64
      %980 = func.call @cc_intern(%976, %979) : (i64, i64) -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_cons(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_values_pack(%982) : (i64) -> i64
      func.call @stack_push_pointer(%980) : (i64) -> ()
      %984 = llvm.mlir.addressof @str93 : !llvm.ptr
      %985 = arith.constant 5 : i64
      %986 = func.call @cc_make_string(%984, %985) : (!llvm.ptr, i64) -> i64
      %987 = func.call @cc_nil_value() : () -> i64
      %988 = func.call @cc_intern(%986, %987) : (i64, i64) -> i64
      %989 = func.call @cc_nil_value() : () -> i64
      %990 = func.call @cc_cons(%988, %989) : (i64, i64) -> i64
      %991 = func.call @cc_values_pack(%990) : (i64) -> i64
      func.call @stack_push_pointer(%988) : (i64) -> ()
      %992 = llvm.mlir.addressof @str94 : !llvm.ptr
      %993 = arith.constant 10 : i64
      %994 = func.call @cc_make_string(%992, %993) : (!llvm.ptr, i64) -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_intern(%994, %995) : (i64, i64) -> i64
      %997 = func.call @cc_nil_value() : () -> i64
      %998 = func.call @cc_cons(%996, %997) : (i64, i64) -> i64
      %999 = func.call @cc_values_pack(%998) : (i64) -> i64
      func.call @stack_push_pointer(%996) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1000 = func.call @stack_pop_pointer() : () -> i64
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @cc_cons(%1001, %1000) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1003 = arith.addi %1002, %__rlasp_stack_elide_zero_45 : i64
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = func.call @cc_cons(%1004, %1003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1006 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1007 = arith.constant 5 : i64
      %1008 = func.call @cc_make_string(%1006, %1007) : (!llvm.ptr, i64) -> i64
      %1009 = func.call @cc_nil_value() : () -> i64
      %1010 = func.call @cc_intern(%1008, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_nil_value() : () -> i64
      %1012 = func.call @cc_cons(%1010, %1011) : (i64, i64) -> i64
      %1013 = func.call @cc_values_pack(%1012) : (i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1014 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1015 = arith.constant 14 : i64
      %1016 = func.call @cc_make_string(%1014, %1015) : (!llvm.ptr, i64) -> i64
      %1017 = func.call @cc_nil_value() : () -> i64
      %1018 = func.call @cc_intern(%1016, %1017) : (i64, i64) -> i64
      %1019 = func.call @cc_nil_value() : () -> i64
      %1020 = func.call @cc_cons(%1018, %1019) : (i64, i64) -> i64
      %1021 = func.call @cc_values_pack(%1020) : (i64) -> i64
      func.call @stack_push_pointer(%1018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1022 = func.call @stack_pop_pointer() : () -> i64
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = func.call @cc_cons(%1023, %1022) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1025 = arith.addi %1024, %__rlasp_stack_elide_zero_46 : i64
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @cc_cons(%1026, %1025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1028 = func.call @stack_pop_pointer() : () -> i64
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = func.call @cc_cons(%1029, %1028) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1031 = arith.addi %1030, %__rlasp_stack_elide_zero_47 : i64
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @cc_cons(%1032, %1031) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1034 = arith.addi %1033, %__rlasp_stack_elide_zero_48 : i64
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @cc_cons(%1035, %1034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1039 = func.call @cc_cons(%1038, %1037) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1040 = arith.addi %1039, %__rlasp_stack_elide_zero_49 : i64
      %1041 = func.call @stack_pop_pointer() : () -> i64
      %1042 = func.call @cc_cons(%1041, %1040) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1043 = arith.addi %1042, %__rlasp_stack_elide_zero_50 : i64
      %1044 = func.call @stack_pop_pointer() : () -> i64
      %1045 = func.call @cc_cons(%1044, %1043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @cc_cons(%1047, %1046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1049 = arith.addi %1048, %__rlasp_stack_elide_zero_51 : i64
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @cc_cons(%1050, %1049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1052 = arith.addi %1051, %__rlasp_stack_elide_zero_52 : i64
      %1053 = func.call @stack_pop_pointer() : () -> i64
      %1054 = func.call @cc_cons(%1053, %1052) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1055 = arith.addi %1054, %__rlasp_stack_elide_zero_53 : i64
      %1380 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1381 = arith.constant 39 : i64
      %1382 = func.call @cc_make_symbol(%1380, %1381) : (!llvm.ptr, i64) -> i64
      %1383 = func.call @cc_persistent_root_value(%1382) : (i64) -> i64
      func.call @stack_push_pointer(%1383) : (i64) -> ()
      %1384 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1385 = arith.constant 36 : i64
      %1386 = func.call @cc_make_symbol(%1384, %1385) : (!llvm.ptr, i64) -> i64
      %1387 = func.call @cc_persistent_root_value(%1386) : (i64) -> i64
      func.call @stack_push_pointer(%1387) : (i64) -> ()
      %1388 = arith.constant 263377075044357 : i64
      %1389 = arith.constant 2 : i64
      %1390 = func.call @cc_make_closure(%1388, %1389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1391 = arith.addi %1390, %__rlasp_stack_elide_zero_54 : i64
      %1392 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1393 = arith.constant 12 : i64
      %1394 = func.call @cc_make_string(%1392, %1393) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      %1395 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1396 = arith.constant 12 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1397) : (i64) -> ()
      %1398 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1399 = arith.constant 6 : i64
      %1400 = func.call @cc_make_string(%1398, %1399) : (!llvm.ptr, i64) -> i64
      %1401 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1402 = arith.constant 7 : i64
      %1403 = func.call @cc_make_string(%1401, %1402) : (!llvm.ptr, i64) -> i64
      %1404 = func.call @cc_intern(%1400, %1403) : (i64, i64) -> i64
      %1405 = func.call @cc_nil_value() : () -> i64
      %1406 = func.call @cc_cons(%1404, %1405) : (i64, i64) -> i64
      %1407 = func.call @cc_values_pack(%1406) : (i64) -> i64
      func.call @stack_push_pointer(%1404) : (i64) -> ()
      %1408 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1408) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1409 = func.call @stack_pop_pointer() : () -> i64
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = func.call @cc_cons(%1410, %1409) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1412 = arith.addi %1411, %__rlasp_stack_elide_zero_55 : i64
      %1413 = func.call @stack_pop_pointer() : () -> i64
      %1414 = func.call @cc_cons(%1413, %1412) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1415 = arith.addi %1414, %__rlasp_stack_elide_zero_56 : i64
      %1416 = func.call @stack_pop_pointer() : () -> i64
      %1417 = func.call @cc_cons(%1416, %1415) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1418 = arith.addi %1417, %__rlasp_stack_elide_zero_57 : i64
      %1419 = func.call @stack_pop_pointer() : () -> i64
      %1420 = func.call @cc_cons(%1419, %1418) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1421 = arith.addi %1420, %__rlasp_stack_elide_zero_58 : i64
      %1422 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1423 = arith.constant 11 : i64
      %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
      %1425 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1426 = arith.constant 7 : i64
      %1427 = func.call @cc_make_string(%1425, %1426) : (!llvm.ptr, i64) -> i64
      %1428 = func.call @cc_intern(%1424, %1427) : (i64, i64) -> i64
      %1429 = func.call @cc_nil_value() : () -> i64
      %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
      %1431 = func.call @cc_values_pack(%1430) : (i64) -> i64
      %1432 = func.call @cc_nil_value() : () -> i64
      %1433 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1434 = arith.constant 4 : i64
      %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
      %1436 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1437 = arith.constant 7 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = func.call @cc_intern(%1435, %1438) : (i64, i64) -> i64
      %1440 = func.call @cc_nil_value() : () -> i64
      %1441 = func.call @cc_cons(%1439, %1440) : (i64, i64) -> i64
      %1442 = func.call @cc_values_pack(%1441) : (i64) -> i64
      %1443 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1444 = arith.constant 6 : i64
      %1445 = func.call @cc_make_string(%1443, %1444) : (!llvm.ptr, i64) -> i64
      %1446 = func.call @cc_nil_value() : () -> i64
      %1447 = func.call @cc_intern(%1445, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_nil_value() : () -> i64
      %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
      %1450 = func.call @cc_values_pack(%1449) : (i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1451 = arith.addi %1447, %__rlasp_stack_elide_zero_59 : i64
      %1452 = func.call @cc_nil_value() : () -> i64
      %1453 = func.call @cc_errorp(%850) : (i64) -> i64
      %1454 = arith.cmpi ne, %1453, %1452 : i64
      %1455 = arith.cmpi eq, %1452, %1452 : i64
      %1456 = arith.andi %1454, %1455 : i1
      %1457 = scf.if %1456 -> (i64) {
        scf.yield %850 : i64
      } else {
        scf.yield %1452 : i64
      }
      %1458 = func.call @cc_errorp(%1055) : (i64) -> i64
      %1459 = arith.cmpi ne, %1458, %1452 : i64
      %1460 = arith.cmpi eq, %1457, %1452 : i64
      %1461 = arith.andi %1459, %1460 : i1
      %1462 = scf.if %1461 -> (i64) {
        scf.yield %1055 : i64
      } else {
        scf.yield %1457 : i64
      }
      %1463 = func.call @cc_errorp(%1391) : (i64) -> i64
      %1464 = arith.cmpi ne, %1463, %1452 : i64
      %1465 = arith.cmpi eq, %1462, %1452 : i64
      %1466 = arith.andi %1464, %1465 : i1
      %1467 = scf.if %1466 -> (i64) {
        scf.yield %1391 : i64
      } else {
        scf.yield %1462 : i64
      }
      %1468 = func.call @cc_errorp(%1421) : (i64) -> i64
      %1469 = arith.cmpi ne, %1468, %1452 : i64
      %1470 = arith.cmpi eq, %1467, %1452 : i64
      %1471 = arith.andi %1469, %1470 : i1
      %1472 = scf.if %1471 -> (i64) {
        scf.yield %1421 : i64
      } else {
        scf.yield %1467 : i64
      }
      %1473 = func.call @cc_errorp(%1428) : (i64) -> i64
      %1474 = arith.cmpi ne, %1473, %1452 : i64
      %1475 = arith.cmpi eq, %1472, %1452 : i64
      %1476 = arith.andi %1474, %1475 : i1
      %1477 = scf.if %1476 -> (i64) {
        scf.yield %1428 : i64
      } else {
        scf.yield %1472 : i64
      }
      %1478 = func.call @cc_errorp(%1432) : (i64) -> i64
      %1479 = arith.cmpi ne, %1478, %1452 : i64
      %1480 = arith.cmpi eq, %1477, %1452 : i64
      %1481 = arith.andi %1479, %1480 : i1
      %1482 = scf.if %1481 -> (i64) {
        scf.yield %1432 : i64
      } else {
        scf.yield %1477 : i64
      }
      %1483 = func.call @cc_errorp(%1439) : (i64) -> i64
      %1484 = arith.cmpi ne, %1483, %1452 : i64
      %1485 = arith.cmpi eq, %1482, %1452 : i64
      %1486 = arith.andi %1484, %1485 : i1
      %1487 = scf.if %1486 -> (i64) {
        scf.yield %1439 : i64
      } else {
        scf.yield %1482 : i64
      }
      %1488 = func.call @cc_errorp(%1451) : (i64) -> i64
      %1489 = arith.cmpi ne, %1488, %1452 : i64
      %1490 = arith.cmpi eq, %1487, %1452 : i64
      %1491 = arith.andi %1489, %1490 : i1
      %1492 = scf.if %1491 -> (i64) {
        scf.yield %1451 : i64
      } else {
        scf.yield %1487 : i64
      }
      %1493 = arith.cmpi ne, %1492, %1452 : i64
      scf.if %1493 {
        func.call @stack_push_pointer(%1492) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%850) : (i64) -> ()
        func.call @stack_push_pointer(%1055) : (i64) -> ()
        func.call @stack_push_pointer(%1391) : (i64) -> ()
        func.call @stack_push_pointer(%1421) : (i64) -> ()
        func.call @stack_push_pointer(%1428) : (i64) -> ()
        func.call @stack_push_pointer(%1432) : (i64) -> ()
        func.call @stack_push_pointer(%1439) : (i64) -> ()
        func.call @stack_push_pointer(%1451) : (i64) -> ()
        %1494 = llvm.mlir.addressof @str142 : !llvm.ptr
        %1495 = func.call @cc_make_function_ref_const(%1494) : (!llvm.ptr) -> i64
        %1496 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1495, %1496) : (i64, i64) -> ()
      }
      %1497 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1497 : i64
    }
    %1498 = func.call @cc_nil_value() : () -> i64
    %1499 = func.call @cc_errorp(%841) : (i64) -> i64
    %1500 = arith.cmpi ne, %1499, %1498 : i64
    %1501 = scf.if %1500 -> (i64) {
      scf.yield %841 : i64
    } else {
      %1502 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1503 = arith.constant 16 : i64
      %1504 = func.call @cc_make_string(%1502, %1503) : (!llvm.ptr, i64) -> i64
      %1505 = func.call @cc_nil_value() : () -> i64
      %1506 = func.call @cc_intern(%1504, %1505) : (i64, i64) -> i64
      %1507 = func.call @cc_nil_value() : () -> i64
      %1508 = func.call @cc_cons(%1506, %1507) : (i64, i64) -> i64
      %1509 = func.call @cc_values_pack(%1508) : (i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1510 = arith.addi %1506, %__rlasp_stack_elide_zero_60 : i64
      %1511 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1512 = arith.constant 16 : i64
      %1513 = func.call @cc_make_string(%1511, %1512) : (!llvm.ptr, i64) -> i64
      %1514 = func.call @cc_nil_value() : () -> i64
      %1515 = func.call @cc_intern(%1513, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = func.call @cc_cons(%1515, %1516) : (i64, i64) -> i64
      %1518 = func.call @cc_values_pack(%1517) : (i64) -> i64
      func.call @stack_push_pointer(%1515) : (i64) -> ()
      %1519 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1520 = arith.constant 10 : i64
      %1521 = func.call @cc_make_string(%1519, %1520) : (!llvm.ptr, i64) -> i64
      %1522 = func.call @cc_nil_value() : () -> i64
      %1523 = func.call @cc_intern(%1521, %1522) : (i64, i64) -> i64
      %1524 = func.call @cc_nil_value() : () -> i64
      %1525 = func.call @cc_cons(%1523, %1524) : (i64, i64) -> i64
      %1526 = func.call @cc_values_pack(%1525) : (i64) -> i64
      func.call @stack_push_pointer(%1523) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1527 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1528 = arith.constant 6 : i64
      %1529 = func.call @cc_make_string(%1527, %1528) : (!llvm.ptr, i64) -> i64
      %1530 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1531 = arith.constant 7 : i64
      %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
      %1533 = func.call @cc_intern(%1529, %1532) : (i64, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_cons(%1533, %1534) : (i64, i64) -> i64
      %1536 = func.call @cc_values_pack(%1535) : (i64) -> i64
      func.call @stack_push_pointer(%1533) : (i64) -> ()
      %1537 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1538 = arith.constant 6 : i64
      %1539 = func.call @cc_make_string(%1537, %1538) : (!llvm.ptr, i64) -> i64
      %1540 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1541 = arith.constant 7 : i64
      %1542 = func.call @cc_make_string(%1540, %1541) : (!llvm.ptr, i64) -> i64
      %1543 = func.call @cc_intern(%1539, %1542) : (i64, i64) -> i64
      %1544 = func.call @cc_nil_value() : () -> i64
      %1545 = func.call @cc_cons(%1543, %1544) : (i64, i64) -> i64
      %1546 = func.call @cc_values_pack(%1545) : (i64) -> i64
      func.call @stack_push_pointer(%1543) : (i64) -> ()
      %1547 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1548 = arith.constant 5 : i64
      %1549 = func.call @cc_make_string(%1547, %1548) : (!llvm.ptr, i64) -> i64
      %1550 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1551 = arith.constant 7 : i64
      %1552 = func.call @cc_make_string(%1550, %1551) : (!llvm.ptr, i64) -> i64
      %1553 = func.call @cc_intern(%1549, %1552) : (i64, i64) -> i64
      %1554 = func.call @cc_nil_value() : () -> i64
      %1555 = func.call @cc_cons(%1553, %1554) : (i64, i64) -> i64
      %1556 = func.call @cc_values_pack(%1555) : (i64) -> i64
      func.call @stack_push_pointer(%1553) : (i64) -> ()
      %1557 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1558 = arith.constant 6 : i64
      %1559 = func.call @cc_make_string(%1557, %1558) : (!llvm.ptr, i64) -> i64
      %1560 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1561 = arith.constant 7 : i64
      %1562 = func.call @cc_make_string(%1560, %1561) : (!llvm.ptr, i64) -> i64
      %1563 = func.call @cc_intern(%1559, %1562) : (i64, i64) -> i64
      %1564 = func.call @cc_nil_value() : () -> i64
      %1565 = func.call @cc_cons(%1563, %1564) : (i64, i64) -> i64
      %1566 = func.call @cc_values_pack(%1565) : (i64) -> i64
      func.call @stack_push_pointer(%1563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1567 = func.call @stack_pop_pointer() : () -> i64
      %1568 = func.call @stack_pop_pointer() : () -> i64
      %1569 = func.call @cc_cons(%1568, %1567) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1570 = arith.addi %1569, %__rlasp_stack_elide_zero_61 : i64
      %1571 = func.call @stack_pop_pointer() : () -> i64
      %1572 = func.call @cc_cons(%1571, %1570) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1573 = arith.addi %1572, %__rlasp_stack_elide_zero_62 : i64
      %1574 = func.call @stack_pop_pointer() : () -> i64
      %1575 = func.call @cc_cons(%1574, %1573) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1576 = arith.addi %1575, %__rlasp_stack_elide_zero_63 : i64
      %1577 = func.call @stack_pop_pointer() : () -> i64
      %1578 = func.call @cc_cons(%1577, %1576) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1579 = arith.addi %1578, %__rlasp_stack_elide_zero_64 : i64
      %1580 = func.call @stack_pop_pointer() : () -> i64
      %1581 = func.call @cc_cons(%1580, %1579) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1582 = arith.addi %1581, %__rlasp_stack_elide_zero_65 : i64
      %1583 = func.call @stack_pop_pointer() : () -> i64
      %1584 = func.call @cc_cons(%1583, %1582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1584) : (i64) -> ()
      %1585 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1586 = arith.constant 3 : i64
      %1587 = func.call @cc_make_string(%1585, %1586) : (!llvm.ptr, i64) -> i64
      %1588 = func.call @cc_nil_value() : () -> i64
      %1589 = func.call @cc_intern(%1587, %1588) : (i64, i64) -> i64
      %1590 = func.call @cc_nil_value() : () -> i64
      %1591 = func.call @cc_cons(%1589, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_values_pack(%1591) : (i64) -> i64
      func.call @stack_push_pointer(%1589) : (i64) -> ()
      %1593 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1594 = arith.constant 14 : i64
      %1595 = func.call @cc_make_string(%1593, %1594) : (!llvm.ptr, i64) -> i64
      %1596 = func.call @cc_nil_value() : () -> i64
      %1597 = func.call @cc_intern(%1595, %1596) : (i64, i64) -> i64
      %1598 = func.call @cc_nil_value() : () -> i64
      %1599 = func.call @cc_cons(%1597, %1598) : (i64, i64) -> i64
      %1600 = func.call @cc_values_pack(%1599) : (i64) -> i64
      func.call @stack_push_pointer(%1597) : (i64) -> ()
      %1601 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1602 = arith.constant 29 : i64
      %1603 = func.call @cc_make_string(%1601, %1602) : (!llvm.ptr, i64) -> i64
      %1604 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1605 = arith.constant 3 : i64
      %1606 = func.call @cc_make_string(%1604, %1605) : (!llvm.ptr, i64) -> i64
      %1607 = func.call @cc_intern(%1603, %1606) : (i64, i64) -> i64
      %1608 = func.call @cc_nil_value() : () -> i64
      %1609 = func.call @cc_cons(%1607, %1608) : (i64, i64) -> i64
      %1610 = func.call @cc_values_pack(%1609) : (i64) -> i64
      func.call @stack_push_pointer(%1607) : (i64) -> ()
      %1611 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1612 = arith.constant 7 : i64
      %1613 = func.call @cc_make_string(%1611, %1612) : (!llvm.ptr, i64) -> i64
      %1614 = func.call @cc_nil_value() : () -> i64
      %1615 = func.call @cc_intern(%1613, %1614) : (i64, i64) -> i64
      %1616 = func.call @cc_nil_value() : () -> i64
      %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
      func.call @stack_push_pointer(%1615) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @stack_pop_pointer() : () -> i64
      %1621 = func.call @cc_cons(%1620, %1619) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1622 = arith.addi %1621, %__rlasp_stack_elide_zero_66 : i64
      %1623 = func.call @stack_pop_pointer() : () -> i64
      %1624 = func.call @cc_cons(%1623, %1622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1624) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = func.call @stack_pop_pointer() : () -> i64
      %1627 = func.call @cc_cons(%1626, %1625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1628 = arith.addi %1627, %__rlasp_stack_elide_zero_67 : i64
      %1629 = func.call @stack_pop_pointer() : () -> i64
      %1630 = func.call @cc_cons(%1629, %1628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1630) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1631 = func.call @stack_pop_pointer() : () -> i64
      %1632 = func.call @stack_pop_pointer() : () -> i64
      %1633 = func.call @cc_cons(%1632, %1631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1633) : (i64) -> ()
      %1634 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1635 = arith.constant 6 : i64
      %1636 = func.call @cc_make_string(%1634, %1635) : (!llvm.ptr, i64) -> i64
      %1637 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1638 = arith.constant 11 : i64
      %1639 = func.call @cc_make_string(%1637, %1638) : (!llvm.ptr, i64) -> i64
      %1640 = func.call @cc_intern(%1636, %1639) : (i64, i64) -> i64
      %1641 = func.call @cc_nil_value() : () -> i64
      %1642 = func.call @cc_cons(%1640, %1641) : (i64, i64) -> i64
      %1643 = func.call @cc_values_pack(%1642) : (i64) -> i64
      func.call @stack_push_pointer(%1640) : (i64) -> ()
      %1644 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1645 = arith.constant 5 : i64
      %1646 = func.call @cc_make_string(%1644, %1645) : (!llvm.ptr, i64) -> i64
      %1647 = func.call @cc_nil_value() : () -> i64
      %1648 = func.call @cc_intern(%1646, %1647) : (i64, i64) -> i64
      %1649 = func.call @cc_nil_value() : () -> i64
      %1650 = func.call @cc_cons(%1648, %1649) : (i64, i64) -> i64
      %1651 = func.call @cc_values_pack(%1650) : (i64) -> i64
      func.call @stack_push_pointer(%1648) : (i64) -> ()
      %1652 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1653 = arith.constant 10 : i64
      %1654 = func.call @cc_make_string(%1652, %1653) : (!llvm.ptr, i64) -> i64
      %1655 = func.call @cc_nil_value() : () -> i64
      %1656 = func.call @cc_intern(%1654, %1655) : (i64, i64) -> i64
      %1657 = func.call @cc_nil_value() : () -> i64
      %1658 = func.call @cc_cons(%1656, %1657) : (i64, i64) -> i64
      %1659 = func.call @cc_values_pack(%1658) : (i64) -> i64
      func.call @stack_push_pointer(%1656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = func.call @cc_cons(%1661, %1660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1663 = arith.addi %1662, %__rlasp_stack_elide_zero_68 : i64
      %1664 = func.call @stack_pop_pointer() : () -> i64
      %1665 = func.call @cc_cons(%1664, %1663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1665) : (i64) -> ()
      %1666 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1667 = arith.constant 5 : i64
      %1668 = func.call @cc_make_string(%1666, %1667) : (!llvm.ptr, i64) -> i64
      %1669 = func.call @cc_nil_value() : () -> i64
      %1670 = func.call @cc_intern(%1668, %1669) : (i64, i64) -> i64
      %1671 = func.call @cc_nil_value() : () -> i64
      %1672 = func.call @cc_cons(%1670, %1671) : (i64, i64) -> i64
      %1673 = func.call @cc_values_pack(%1672) : (i64) -> i64
      func.call @stack_push_pointer(%1670) : (i64) -> ()
      %1674 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1675 = arith.constant 14 : i64
      %1676 = func.call @cc_make_string(%1674, %1675) : (!llvm.ptr, i64) -> i64
      %1677 = func.call @cc_nil_value() : () -> i64
      %1678 = func.call @cc_intern(%1676, %1677) : (i64, i64) -> i64
      %1679 = func.call @cc_nil_value() : () -> i64
      %1680 = func.call @cc_cons(%1678, %1679) : (i64, i64) -> i64
      %1681 = func.call @cc_values_pack(%1680) : (i64) -> i64
      func.call @stack_push_pointer(%1678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @cc_cons(%1683, %1682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1685 = arith.addi %1684, %__rlasp_stack_elide_zero_69 : i64
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @cc_cons(%1686, %1685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1687) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1688 = func.call @stack_pop_pointer() : () -> i64
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @cc_cons(%1689, %1688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1691 = arith.addi %1690, %__rlasp_stack_elide_zero_70 : i64
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = func.call @cc_cons(%1692, %1691) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1694 = arith.addi %1693, %__rlasp_stack_elide_zero_71 : i64
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @cc_cons(%1695, %1694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1696) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1697 = func.call @stack_pop_pointer() : () -> i64
      %1698 = func.call @stack_pop_pointer() : () -> i64
      %1699 = func.call @cc_cons(%1698, %1697) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1700 = arith.addi %1699, %__rlasp_stack_elide_zero_72 : i64
      %1701 = func.call @stack_pop_pointer() : () -> i64
      %1702 = func.call @cc_cons(%1701, %1700) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1703 = arith.addi %1702, %__rlasp_stack_elide_zero_73 : i64
      %1704 = func.call @stack_pop_pointer() : () -> i64
      %1705 = func.call @cc_cons(%1704, %1703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1705) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1706 = func.call @stack_pop_pointer() : () -> i64
      %1707 = func.call @stack_pop_pointer() : () -> i64
      %1708 = func.call @cc_cons(%1707, %1706) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1709 = arith.addi %1708, %__rlasp_stack_elide_zero_74 : i64
      %1710 = func.call @stack_pop_pointer() : () -> i64
      %1711 = func.call @cc_cons(%1710, %1709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1712 = arith.addi %1711, %__rlasp_stack_elide_zero_75 : i64
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @cc_cons(%1713, %1712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1715 = arith.addi %1714, %__rlasp_stack_elide_zero_76 : i64
      %2040 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2041 = arith.constant 39 : i64
      %2042 = func.call @cc_make_symbol(%2040, %2041) : (!llvm.ptr, i64) -> i64
      %2043 = func.call @cc_persistent_root_value(%2042) : (i64) -> i64
      func.call @stack_push_pointer(%2043) : (i64) -> ()
      %2044 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2045 = arith.constant 36 : i64
      %2046 = func.call @cc_make_symbol(%2044, %2045) : (!llvm.ptr, i64) -> i64
      %2047 = func.call @cc_persistent_root_value(%2046) : (i64) -> i64
      func.call @stack_push_pointer(%2047) : (i64) -> ()
      %2048 = arith.constant 263377075044360 : i64
      %2049 = arith.constant 2 : i64
      %2050 = func.call @cc_make_closure(%2048, %2049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %2051 = arith.addi %2050, %__rlasp_stack_elide_zero_77 : i64
      %2052 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2053 = arith.constant 12 : i64
      %2054 = func.call @cc_make_string(%2052, %2053) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2055 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2056 = arith.constant 6 : i64
      %2057 = func.call @cc_make_string(%2055, %2056) : (!llvm.ptr, i64) -> i64
      %2058 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2059 = arith.constant 7 : i64
      %2060 = func.call @cc_make_string(%2058, %2059) : (!llvm.ptr, i64) -> i64
      %2061 = func.call @cc_intern(%2057, %2060) : (i64, i64) -> i64
      %2062 = func.call @cc_nil_value() : () -> i64
      %2063 = func.call @cc_cons(%2061, %2062) : (i64, i64) -> i64
      %2064 = func.call @cc_values_pack(%2063) : (i64) -> i64
      func.call @stack_push_pointer(%2061) : (i64) -> ()
      %2065 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2065) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2066 = func.call @stack_pop_pointer() : () -> i64
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @cc_cons(%2067, %2066) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %2069 = arith.addi %2068, %__rlasp_stack_elide_zero_78 : i64
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @cc_cons(%2070, %2069) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %2072 = arith.addi %2071, %__rlasp_stack_elide_zero_79 : i64
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = func.call @cc_cons(%2073, %2072) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %2075 = arith.addi %2074, %__rlasp_stack_elide_zero_80 : i64
      %2076 = func.call @stack_pop_pointer() : () -> i64
      %2077 = func.call @cc_cons(%2076, %2075) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %2078 = arith.addi %2077, %__rlasp_stack_elide_zero_81 : i64
      %2079 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2080 = arith.constant 11 : i64
      %2081 = func.call @cc_make_string(%2079, %2080) : (!llvm.ptr, i64) -> i64
      %2082 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2083 = arith.constant 7 : i64
      %2084 = func.call @cc_make_string(%2082, %2083) : (!llvm.ptr, i64) -> i64
      %2085 = func.call @cc_intern(%2081, %2084) : (i64, i64) -> i64
      %2086 = func.call @cc_nil_value() : () -> i64
      %2087 = func.call @cc_cons(%2085, %2086) : (i64, i64) -> i64
      %2088 = func.call @cc_values_pack(%2087) : (i64) -> i64
      %2089 = func.call @cc_nil_value() : () -> i64
      %2090 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2091 = arith.constant 4 : i64
      %2092 = func.call @cc_make_string(%2090, %2091) : (!llvm.ptr, i64) -> i64
      %2093 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2094 = arith.constant 7 : i64
      %2095 = func.call @cc_make_string(%2093, %2094) : (!llvm.ptr, i64) -> i64
      %2096 = func.call @cc_intern(%2092, %2095) : (i64, i64) -> i64
      %2097 = func.call @cc_nil_value() : () -> i64
      %2098 = func.call @cc_cons(%2096, %2097) : (i64, i64) -> i64
      %2099 = func.call @cc_values_pack(%2098) : (i64) -> i64
      %2100 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2101 = arith.constant 6 : i64
      %2102 = func.call @cc_make_string(%2100, %2101) : (!llvm.ptr, i64) -> i64
      %2103 = func.call @cc_nil_value() : () -> i64
      %2104 = func.call @cc_intern(%2102, %2103) : (i64, i64) -> i64
      %2105 = func.call @cc_nil_value() : () -> i64
      %2106 = func.call @cc_cons(%2104, %2105) : (i64, i64) -> i64
      %2107 = func.call @cc_values_pack(%2106) : (i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %2108 = arith.addi %2104, %__rlasp_stack_elide_zero_82 : i64
      %2109 = func.call @cc_nil_value() : () -> i64
      %2110 = func.call @cc_errorp(%1510) : (i64) -> i64
      %2111 = arith.cmpi ne, %2110, %2109 : i64
      %2112 = arith.cmpi eq, %2109, %2109 : i64
      %2113 = arith.andi %2111, %2112 : i1
      %2114 = scf.if %2113 -> (i64) {
        scf.yield %1510 : i64
      } else {
        scf.yield %2109 : i64
      }
      %2115 = func.call @cc_errorp(%1715) : (i64) -> i64
      %2116 = arith.cmpi ne, %2115, %2109 : i64
      %2117 = arith.cmpi eq, %2114, %2109 : i64
      %2118 = arith.andi %2116, %2117 : i1
      %2119 = scf.if %2118 -> (i64) {
        scf.yield %1715 : i64
      } else {
        scf.yield %2114 : i64
      }
      %2120 = func.call @cc_errorp(%2051) : (i64) -> i64
      %2121 = arith.cmpi ne, %2120, %2109 : i64
      %2122 = arith.cmpi eq, %2119, %2109 : i64
      %2123 = arith.andi %2121, %2122 : i1
      %2124 = scf.if %2123 -> (i64) {
        scf.yield %2051 : i64
      } else {
        scf.yield %2119 : i64
      }
      %2125 = func.call @cc_errorp(%2078) : (i64) -> i64
      %2126 = arith.cmpi ne, %2125, %2109 : i64
      %2127 = arith.cmpi eq, %2124, %2109 : i64
      %2128 = arith.andi %2126, %2127 : i1
      %2129 = scf.if %2128 -> (i64) {
        scf.yield %2078 : i64
      } else {
        scf.yield %2124 : i64
      }
      %2130 = func.call @cc_errorp(%2085) : (i64) -> i64
      %2131 = arith.cmpi ne, %2130, %2109 : i64
      %2132 = arith.cmpi eq, %2129, %2109 : i64
      %2133 = arith.andi %2131, %2132 : i1
      %2134 = scf.if %2133 -> (i64) {
        scf.yield %2085 : i64
      } else {
        scf.yield %2129 : i64
      }
      %2135 = func.call @cc_errorp(%2089) : (i64) -> i64
      %2136 = arith.cmpi ne, %2135, %2109 : i64
      %2137 = arith.cmpi eq, %2134, %2109 : i64
      %2138 = arith.andi %2136, %2137 : i1
      %2139 = scf.if %2138 -> (i64) {
        scf.yield %2089 : i64
      } else {
        scf.yield %2134 : i64
      }
      %2140 = func.call @cc_errorp(%2096) : (i64) -> i64
      %2141 = arith.cmpi ne, %2140, %2109 : i64
      %2142 = arith.cmpi eq, %2139, %2109 : i64
      %2143 = arith.andi %2141, %2142 : i1
      %2144 = scf.if %2143 -> (i64) {
        scf.yield %2096 : i64
      } else {
        scf.yield %2139 : i64
      }
      %2145 = func.call @cc_errorp(%2108) : (i64) -> i64
      %2146 = arith.cmpi ne, %2145, %2109 : i64
      %2147 = arith.cmpi eq, %2144, %2109 : i64
      %2148 = arith.andi %2146, %2147 : i1
      %2149 = scf.if %2148 -> (i64) {
        scf.yield %2108 : i64
      } else {
        scf.yield %2144 : i64
      }
      %2150 = arith.cmpi ne, %2149, %2109 : i64
      scf.if %2150 {
        func.call @stack_push_pointer(%2149) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1510) : (i64) -> ()
        func.call @stack_push_pointer(%1715) : (i64) -> ()
        func.call @stack_push_pointer(%2051) : (i64) -> ()
        func.call @stack_push_pointer(%2078) : (i64) -> ()
        func.call @stack_push_pointer(%2085) : (i64) -> ()
        func.call @stack_push_pointer(%2089) : (i64) -> ()
        func.call @stack_push_pointer(%2096) : (i64) -> ()
        func.call @stack_push_pointer(%2108) : (i64) -> ()
        %2151 = llvm.mlir.addressof @str209 : !llvm.ptr
        %2152 = func.call @cc_make_function_ref_const(%2151) : (!llvm.ptr) -> i64
        %2153 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2152, %2153) : (i64, i64) -> ()
      }
      %2154 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2154 : i64
    }
    %2155 = func.call @cc_nil_value() : () -> i64
    %2156 = func.call @cc_errorp(%1501) : (i64) -> i64
    %2157 = arith.cmpi ne, %2156, %2155 : i64
    %2158 = scf.if %2157 -> (i64) {
      scf.yield %1501 : i64
    } else {
      %2159 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2160 = arith.constant 19 : i64
      %2161 = func.call @cc_make_string(%2159, %2160) : (!llvm.ptr, i64) -> i64
      %2162 = func.call @cc_nil_value() : () -> i64
      %2163 = func.call @cc_intern(%2161, %2162) : (i64, i64) -> i64
      %2164 = func.call @cc_nil_value() : () -> i64
      %2165 = func.call @cc_cons(%2163, %2164) : (i64, i64) -> i64
      %2166 = func.call @cc_values_pack(%2165) : (i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %2167 = arith.addi %2163, %__rlasp_stack_elide_zero_83 : i64
      %2168 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2169 = arith.constant 16 : i64
      %2170 = func.call @cc_make_string(%2168, %2169) : (!llvm.ptr, i64) -> i64
      %2171 = func.call @cc_nil_value() : () -> i64
      %2172 = func.call @cc_intern(%2170, %2171) : (i64, i64) -> i64
      %2173 = func.call @cc_nil_value() : () -> i64
      %2174 = func.call @cc_cons(%2172, %2173) : (i64, i64) -> i64
      %2175 = func.call @cc_values_pack(%2174) : (i64) -> i64
      func.call @stack_push_pointer(%2172) : (i64) -> ()
      %2176 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2177 = arith.constant 6 : i64
      %2178 = func.call @cc_make_string(%2176, %2177) : (!llvm.ptr, i64) -> i64
      %2179 = func.call @cc_nil_value() : () -> i64
      %2180 = func.call @cc_intern(%2178, %2179) : (i64, i64) -> i64
      %2181 = func.call @cc_nil_value() : () -> i64
      %2182 = func.call @cc_cons(%2180, %2181) : (i64, i64) -> i64
      %2183 = func.call @cc_values_pack(%2182) : (i64) -> i64
      func.call @stack_push_pointer(%2180) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2184 = func.call @stack_pop_pointer() : () -> i64
      %2185 = func.call @stack_pop_pointer() : () -> i64
      %2186 = func.call @cc_cons(%2185, %2184) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %2187 = arith.addi %2186, %__rlasp_stack_elide_zero_84 : i64
      %2188 = func.call @stack_pop_pointer() : () -> i64
      %2189 = func.call @cc_cons(%2188, %2187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2189) : (i64) -> ()
      %2190 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2191 = arith.constant 6 : i64
      %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
      %2193 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2194 = arith.constant 11 : i64
      %2195 = func.call @cc_make_string(%2193, %2194) : (!llvm.ptr, i64) -> i64
      %2196 = func.call @cc_intern(%2192, %2195) : (i64, i64) -> i64
      %2197 = func.call @cc_nil_value() : () -> i64
      %2198 = func.call @cc_cons(%2196, %2197) : (i64, i64) -> i64
      %2199 = func.call @cc_values_pack(%2198) : (i64) -> i64
      func.call @stack_push_pointer(%2196) : (i64) -> ()
      %2200 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2201 = arith.constant 6 : i64
      %2202 = func.call @cc_make_string(%2200, %2201) : (!llvm.ptr, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_intern(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_nil_value() : () -> i64
      %2206 = func.call @cc_cons(%2204, %2205) : (i64, i64) -> i64
      %2207 = func.call @cc_values_pack(%2206) : (i64) -> i64
      func.call @stack_push_pointer(%2204) : (i64) -> ()
      %2208 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2209 = arith.constant 4 : i64
      %2210 = func.call @cc_make_string(%2208, %2209) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2211 = func.call @stack_pop_pointer() : () -> i64
      %2212 = func.call @stack_pop_pointer() : () -> i64
      %2213 = func.call @cc_cons(%2212, %2211) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %2214 = arith.addi %2213, %__rlasp_stack_elide_zero_85 : i64
      %2215 = func.call @stack_pop_pointer() : () -> i64
      %2216 = func.call @cc_cons(%2215, %2214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %2217 = arith.addi %2216, %__rlasp_stack_elide_zero_86 : i64
      %2218 = func.call @stack_pop_pointer() : () -> i64
      %2219 = func.call @cc_cons(%2218, %2217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2219) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2220 = func.call @stack_pop_pointer() : () -> i64
      %2221 = func.call @stack_pop_pointer() : () -> i64
      %2222 = func.call @cc_cons(%2221, %2220) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %2223 = arith.addi %2222, %__rlasp_stack_elide_zero_87 : i64
      %2224 = func.call @stack_pop_pointer() : () -> i64
      %2225 = func.call @cc_cons(%2224, %2223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %2226 = arith.addi %2225, %__rlasp_stack_elide_zero_88 : i64
      %2227 = func.call @stack_pop_pointer() : () -> i64
      %2228 = func.call @cc_cons(%2227, %2226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %2229 = arith.addi %2228, %__rlasp_stack_elide_zero_89 : i64
      %2454 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2455 = arith.constant 35 : i64
      %2456 = func.call @cc_make_symbol(%2454, %2455) : (!llvm.ptr, i64) -> i64
      %2457 = func.call @cc_persistent_root_value(%2456) : (i64) -> i64
      func.call @stack_push_pointer(%2457) : (i64) -> ()
      %2458 = arith.constant 263377075044363 : i64
      %2459 = arith.constant 1 : i64
      %2460 = func.call @cc_make_closure(%2458, %2459) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2461 = arith.addi %2460, %__rlasp_stack_elide_zero_90 : i64
      func.call @stack_push_nil() : () -> ()
      %2462 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2463 = arith.constant 6 : i64
      %2464 = func.call @cc_make_string(%2462, %2463) : (!llvm.ptr, i64) -> i64
      %2465 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2466 = arith.constant 7 : i64
      %2467 = func.call @cc_make_string(%2465, %2466) : (!llvm.ptr, i64) -> i64
      %2468 = func.call @cc_intern(%2464, %2467) : (i64, i64) -> i64
      %2469 = func.call @cc_nil_value() : () -> i64
      %2470 = func.call @cc_cons(%2468, %2469) : (i64, i64) -> i64
      %2471 = func.call @cc_values_pack(%2470) : (i64) -> i64
      func.call @stack_push_pointer(%2468) : (i64) -> ()
      %2472 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2473 = func.call @stack_pop_pointer() : () -> i64
      %2474 = func.call @stack_pop_pointer() : () -> i64
      %2475 = func.call @cc_cons(%2474, %2473) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2476 = arith.addi %2475, %__rlasp_stack_elide_zero_91 : i64
      %2477 = func.call @stack_pop_pointer() : () -> i64
      %2478 = func.call @cc_cons(%2477, %2476) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2479 = arith.addi %2478, %__rlasp_stack_elide_zero_92 : i64
      %2480 = func.call @stack_pop_pointer() : () -> i64
      %2481 = func.call @cc_cons(%2480, %2479) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2482 = arith.addi %2481, %__rlasp_stack_elide_zero_93 : i64
      %2483 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2484 = arith.constant 11 : i64
      %2485 = func.call @cc_make_string(%2483, %2484) : (!llvm.ptr, i64) -> i64
      %2486 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2487 = arith.constant 7 : i64
      %2488 = func.call @cc_make_string(%2486, %2487) : (!llvm.ptr, i64) -> i64
      %2489 = func.call @cc_intern(%2485, %2488) : (i64, i64) -> i64
      %2490 = func.call @cc_nil_value() : () -> i64
      %2491 = func.call @cc_cons(%2489, %2490) : (i64, i64) -> i64
      %2492 = func.call @cc_values_pack(%2491) : (i64) -> i64
      %2493 = func.call @cc_nil_value() : () -> i64
      %2494 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2495 = arith.constant 4 : i64
      %2496 = func.call @cc_make_string(%2494, %2495) : (!llvm.ptr, i64) -> i64
      %2497 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2498 = arith.constant 7 : i64
      %2499 = func.call @cc_make_string(%2497, %2498) : (!llvm.ptr, i64) -> i64
      %2500 = func.call @cc_intern(%2496, %2499) : (i64, i64) -> i64
      %2501 = func.call @cc_nil_value() : () -> i64
      %2502 = func.call @cc_cons(%2500, %2501) : (i64, i64) -> i64
      %2503 = func.call @cc_values_pack(%2502) : (i64) -> i64
      %2504 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2505 = arith.constant 6 : i64
      %2506 = func.call @cc_make_string(%2504, %2505) : (!llvm.ptr, i64) -> i64
      %2507 = func.call @cc_nil_value() : () -> i64
      %2508 = func.call @cc_intern(%2506, %2507) : (i64, i64) -> i64
      %2509 = func.call @cc_nil_value() : () -> i64
      %2510 = func.call @cc_cons(%2508, %2509) : (i64, i64) -> i64
      %2511 = func.call @cc_values_pack(%2510) : (i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %2512 = arith.addi %2508, %__rlasp_stack_elide_zero_94 : i64
      %2513 = func.call @cc_nil_value() : () -> i64
      %2514 = func.call @cc_errorp(%2167) : (i64) -> i64
      %2515 = arith.cmpi ne, %2514, %2513 : i64
      %2516 = arith.cmpi eq, %2513, %2513 : i64
      %2517 = arith.andi %2515, %2516 : i1
      %2518 = scf.if %2517 -> (i64) {
        scf.yield %2167 : i64
      } else {
        scf.yield %2513 : i64
      }
      %2519 = func.call @cc_errorp(%2229) : (i64) -> i64
      %2520 = arith.cmpi ne, %2519, %2513 : i64
      %2521 = arith.cmpi eq, %2518, %2513 : i64
      %2522 = arith.andi %2520, %2521 : i1
      %2523 = scf.if %2522 -> (i64) {
        scf.yield %2229 : i64
      } else {
        scf.yield %2518 : i64
      }
      %2524 = func.call @cc_errorp(%2461) : (i64) -> i64
      %2525 = arith.cmpi ne, %2524, %2513 : i64
      %2526 = arith.cmpi eq, %2523, %2513 : i64
      %2527 = arith.andi %2525, %2526 : i1
      %2528 = scf.if %2527 -> (i64) {
        scf.yield %2461 : i64
      } else {
        scf.yield %2523 : i64
      }
      %2529 = func.call @cc_errorp(%2482) : (i64) -> i64
      %2530 = arith.cmpi ne, %2529, %2513 : i64
      %2531 = arith.cmpi eq, %2528, %2513 : i64
      %2532 = arith.andi %2530, %2531 : i1
      %2533 = scf.if %2532 -> (i64) {
        scf.yield %2482 : i64
      } else {
        scf.yield %2528 : i64
      }
      %2534 = func.call @cc_errorp(%2489) : (i64) -> i64
      %2535 = arith.cmpi ne, %2534, %2513 : i64
      %2536 = arith.cmpi eq, %2533, %2513 : i64
      %2537 = arith.andi %2535, %2536 : i1
      %2538 = scf.if %2537 -> (i64) {
        scf.yield %2489 : i64
      } else {
        scf.yield %2533 : i64
      }
      %2539 = func.call @cc_errorp(%2493) : (i64) -> i64
      %2540 = arith.cmpi ne, %2539, %2513 : i64
      %2541 = arith.cmpi eq, %2538, %2513 : i64
      %2542 = arith.andi %2540, %2541 : i1
      %2543 = scf.if %2542 -> (i64) {
        scf.yield %2493 : i64
      } else {
        scf.yield %2538 : i64
      }
      %2544 = func.call @cc_errorp(%2500) : (i64) -> i64
      %2545 = arith.cmpi ne, %2544, %2513 : i64
      %2546 = arith.cmpi eq, %2543, %2513 : i64
      %2547 = arith.andi %2545, %2546 : i1
      %2548 = scf.if %2547 -> (i64) {
        scf.yield %2500 : i64
      } else {
        scf.yield %2543 : i64
      }
      %2549 = func.call @cc_errorp(%2512) : (i64) -> i64
      %2550 = arith.cmpi ne, %2549, %2513 : i64
      %2551 = arith.cmpi eq, %2548, %2513 : i64
      %2552 = arith.andi %2550, %2551 : i1
      %2553 = scf.if %2552 -> (i64) {
        scf.yield %2512 : i64
      } else {
        scf.yield %2548 : i64
      }
      %2554 = arith.cmpi ne, %2553, %2513 : i64
      scf.if %2554 {
        func.call @stack_push_pointer(%2553) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2167) : (i64) -> ()
        func.call @stack_push_pointer(%2229) : (i64) -> ()
        func.call @stack_push_pointer(%2461) : (i64) -> ()
        func.call @stack_push_pointer(%2482) : (i64) -> ()
        func.call @stack_push_pointer(%2489) : (i64) -> ()
        func.call @stack_push_pointer(%2493) : (i64) -> ()
        func.call @stack_push_pointer(%2500) : (i64) -> ()
        func.call @stack_push_pointer(%2512) : (i64) -> ()
        %2555 = llvm.mlir.addressof @str250 : !llvm.ptr
        %2556 = func.call @cc_make_function_ref_const(%2555) : (!llvm.ptr) -> i64
        %2557 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2556, %2557) : (i64, i64) -> ()
      }
      %2558 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2558 : i64
    }
    %2559 = func.call @cc_nil_value() : () -> i64
    %2560 = func.call @cc_errorp(%2158) : (i64) -> i64
    %2561 = arith.cmpi ne, %2560, %2559 : i64
    %2562 = scf.if %2561 -> (i64) {
      scf.yield %2158 : i64
    } else {
      %2563 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2564 = arith.constant 19 : i64
      %2565 = func.call @cc_make_string(%2563, %2564) : (!llvm.ptr, i64) -> i64
      %2566 = func.call @cc_nil_value() : () -> i64
      %2567 = func.call @cc_intern(%2565, %2566) : (i64, i64) -> i64
      %2568 = func.call @cc_nil_value() : () -> i64
      %2569 = func.call @cc_cons(%2567, %2568) : (i64, i64) -> i64
      %2570 = func.call @cc_values_pack(%2569) : (i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %2571 = arith.addi %2567, %__rlasp_stack_elide_zero_95 : i64
      %2572 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2573 = arith.constant 16 : i64
      %2574 = func.call @cc_make_string(%2572, %2573) : (!llvm.ptr, i64) -> i64
      %2575 = func.call @cc_nil_value() : () -> i64
      %2576 = func.call @cc_intern(%2574, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_nil_value() : () -> i64
      %2578 = func.call @cc_cons(%2576, %2577) : (i64, i64) -> i64
      %2579 = func.call @cc_values_pack(%2578) : (i64) -> i64
      func.call @stack_push_pointer(%2576) : (i64) -> ()
      %2580 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2581 = arith.constant 6 : i64
      %2582 = func.call @cc_make_string(%2580, %2581) : (!llvm.ptr, i64) -> i64
      %2583 = func.call @cc_nil_value() : () -> i64
      %2584 = func.call @cc_intern(%2582, %2583) : (i64, i64) -> i64
      %2585 = func.call @cc_nil_value() : () -> i64
      %2586 = func.call @cc_cons(%2584, %2585) : (i64, i64) -> i64
      %2587 = func.call @cc_values_pack(%2586) : (i64) -> i64
      func.call @stack_push_pointer(%2584) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2588 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2589 = arith.constant 5 : i64
      %2590 = func.call @cc_make_string(%2588, %2589) : (!llvm.ptr, i64) -> i64
      %2591 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2592 = arith.constant 7 : i64
      %2593 = func.call @cc_make_string(%2591, %2592) : (!llvm.ptr, i64) -> i64
      %2594 = func.call @cc_intern(%2590, %2593) : (i64, i64) -> i64
      %2595 = func.call @cc_nil_value() : () -> i64
      %2596 = func.call @cc_cons(%2594, %2595) : (i64, i64) -> i64
      %2597 = func.call @cc_values_pack(%2596) : (i64) -> i64
      func.call @stack_push_pointer(%2594) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2598 = func.call @stack_pop_pointer() : () -> i64
      %2599 = func.call @stack_pop_pointer() : () -> i64
      %2600 = func.call @cc_cons(%2599, %2598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2601 = arith.addi %2600, %__rlasp_stack_elide_zero_96 : i64
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @cc_cons(%2602, %2601) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2604 = arith.addi %2603, %__rlasp_stack_elide_zero_97 : i64
      %2605 = func.call @stack_pop_pointer() : () -> i64
      %2606 = func.call @cc_cons(%2605, %2604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2607 = arith.addi %2606, %__rlasp_stack_elide_zero_98 : i64
      %2608 = func.call @stack_pop_pointer() : () -> i64
      %2609 = func.call @cc_cons(%2608, %2607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2609) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @cc_cons(%2611, %2610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2613 = arith.addi %2612, %__rlasp_stack_elide_zero_99 : i64
      %2614 = func.call @stack_pop_pointer() : () -> i64
      %2615 = func.call @cc_cons(%2614, %2613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2616 = arith.addi %2615, %__rlasp_stack_elide_zero_100 : i64
      %2850 = llvm.mlir.addressof @str281 : !llvm.ptr
      %2851 = arith.constant 35 : i64
      %2852 = func.call @cc_make_symbol(%2850, %2851) : (!llvm.ptr, i64) -> i64
      %2853 = func.call @cc_persistent_root_value(%2852) : (i64) -> i64
      func.call @stack_push_pointer(%2853) : (i64) -> ()
      %2854 = arith.constant 263377075044365 : i64
      %2855 = arith.constant 1 : i64
      %2856 = func.call @cc_make_closure(%2854, %2855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2857 = arith.addi %2856, %__rlasp_stack_elide_zero_101 : i64
      func.call @stack_push_nil() : () -> ()
      %2858 = llvm.mlir.addressof @str282 : !llvm.ptr
      %2859 = arith.constant 6 : i64
      %2860 = func.call @cc_make_string(%2858, %2859) : (!llvm.ptr, i64) -> i64
      %2861 = llvm.mlir.addressof @str283 : !llvm.ptr
      %2862 = arith.constant 7 : i64
      %2863 = func.call @cc_make_string(%2861, %2862) : (!llvm.ptr, i64) -> i64
      %2864 = func.call @cc_intern(%2860, %2863) : (i64, i64) -> i64
      %2865 = func.call @cc_nil_value() : () -> i64
      %2866 = func.call @cc_cons(%2864, %2865) : (i64, i64) -> i64
      %2867 = func.call @cc_values_pack(%2866) : (i64) -> i64
      func.call @stack_push_pointer(%2864) : (i64) -> ()
      %2868 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2868) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2869 = func.call @stack_pop_pointer() : () -> i64
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_cons(%2870, %2869) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2872 = arith.addi %2871, %__rlasp_stack_elide_zero_102 : i64
      %2873 = func.call @stack_pop_pointer() : () -> i64
      %2874 = func.call @cc_cons(%2873, %2872) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2875 = arith.addi %2874, %__rlasp_stack_elide_zero_103 : i64
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @cc_cons(%2876, %2875) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2878 = arith.addi %2877, %__rlasp_stack_elide_zero_104 : i64
      %2879 = llvm.mlir.addressof @str284 : !llvm.ptr
      %2880 = arith.constant 11 : i64
      %2881 = func.call @cc_make_string(%2879, %2880) : (!llvm.ptr, i64) -> i64
      %2882 = llvm.mlir.addressof @str285 : !llvm.ptr
      %2883 = arith.constant 7 : i64
      %2884 = func.call @cc_make_string(%2882, %2883) : (!llvm.ptr, i64) -> i64
      %2885 = func.call @cc_intern(%2881, %2884) : (i64, i64) -> i64
      %2886 = func.call @cc_nil_value() : () -> i64
      %2887 = func.call @cc_cons(%2885, %2886) : (i64, i64) -> i64
      %2888 = func.call @cc_values_pack(%2887) : (i64) -> i64
      %2889 = func.call @cc_nil_value() : () -> i64
      %2890 = llvm.mlir.addressof @str286 : !llvm.ptr
      %2891 = arith.constant 4 : i64
      %2892 = func.call @cc_make_string(%2890, %2891) : (!llvm.ptr, i64) -> i64
      %2893 = llvm.mlir.addressof @str287 : !llvm.ptr
      %2894 = arith.constant 7 : i64
      %2895 = func.call @cc_make_string(%2893, %2894) : (!llvm.ptr, i64) -> i64
      %2896 = func.call @cc_intern(%2892, %2895) : (i64, i64) -> i64
      %2897 = func.call @cc_nil_value() : () -> i64
      %2898 = func.call @cc_cons(%2896, %2897) : (i64, i64) -> i64
      %2899 = func.call @cc_values_pack(%2898) : (i64) -> i64
      %2900 = llvm.mlir.addressof @str288 : !llvm.ptr
      %2901 = arith.constant 6 : i64
      %2902 = func.call @cc_make_string(%2900, %2901) : (!llvm.ptr, i64) -> i64
      %2903 = func.call @cc_nil_value() : () -> i64
      %2904 = func.call @cc_intern(%2902, %2903) : (i64, i64) -> i64
      %2905 = func.call @cc_nil_value() : () -> i64
      %2906 = func.call @cc_cons(%2904, %2905) : (i64, i64) -> i64
      %2907 = func.call @cc_values_pack(%2906) : (i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2908 = arith.addi %2904, %__rlasp_stack_elide_zero_105 : i64
      %2909 = func.call @cc_nil_value() : () -> i64
      %2910 = func.call @cc_errorp(%2571) : (i64) -> i64
      %2911 = arith.cmpi ne, %2910, %2909 : i64
      %2912 = arith.cmpi eq, %2909, %2909 : i64
      %2913 = arith.andi %2911, %2912 : i1
      %2914 = scf.if %2913 -> (i64) {
        scf.yield %2571 : i64
      } else {
        scf.yield %2909 : i64
      }
      %2915 = func.call @cc_errorp(%2616) : (i64) -> i64
      %2916 = arith.cmpi ne, %2915, %2909 : i64
      %2917 = arith.cmpi eq, %2914, %2909 : i64
      %2918 = arith.andi %2916, %2917 : i1
      %2919 = scf.if %2918 -> (i64) {
        scf.yield %2616 : i64
      } else {
        scf.yield %2914 : i64
      }
      %2920 = func.call @cc_errorp(%2857) : (i64) -> i64
      %2921 = arith.cmpi ne, %2920, %2909 : i64
      %2922 = arith.cmpi eq, %2919, %2909 : i64
      %2923 = arith.andi %2921, %2922 : i1
      %2924 = scf.if %2923 -> (i64) {
        scf.yield %2857 : i64
      } else {
        scf.yield %2919 : i64
      }
      %2925 = func.call @cc_errorp(%2878) : (i64) -> i64
      %2926 = arith.cmpi ne, %2925, %2909 : i64
      %2927 = arith.cmpi eq, %2924, %2909 : i64
      %2928 = arith.andi %2926, %2927 : i1
      %2929 = scf.if %2928 -> (i64) {
        scf.yield %2878 : i64
      } else {
        scf.yield %2924 : i64
      }
      %2930 = func.call @cc_errorp(%2885) : (i64) -> i64
      %2931 = arith.cmpi ne, %2930, %2909 : i64
      %2932 = arith.cmpi eq, %2929, %2909 : i64
      %2933 = arith.andi %2931, %2932 : i1
      %2934 = scf.if %2933 -> (i64) {
        scf.yield %2885 : i64
      } else {
        scf.yield %2929 : i64
      }
      %2935 = func.call @cc_errorp(%2889) : (i64) -> i64
      %2936 = arith.cmpi ne, %2935, %2909 : i64
      %2937 = arith.cmpi eq, %2934, %2909 : i64
      %2938 = arith.andi %2936, %2937 : i1
      %2939 = scf.if %2938 -> (i64) {
        scf.yield %2889 : i64
      } else {
        scf.yield %2934 : i64
      }
      %2940 = func.call @cc_errorp(%2896) : (i64) -> i64
      %2941 = arith.cmpi ne, %2940, %2909 : i64
      %2942 = arith.cmpi eq, %2939, %2909 : i64
      %2943 = arith.andi %2941, %2942 : i1
      %2944 = scf.if %2943 -> (i64) {
        scf.yield %2896 : i64
      } else {
        scf.yield %2939 : i64
      }
      %2945 = func.call @cc_errorp(%2908) : (i64) -> i64
      %2946 = arith.cmpi ne, %2945, %2909 : i64
      %2947 = arith.cmpi eq, %2944, %2909 : i64
      %2948 = arith.andi %2946, %2947 : i1
      %2949 = scf.if %2948 -> (i64) {
        scf.yield %2908 : i64
      } else {
        scf.yield %2944 : i64
      }
      %2950 = arith.cmpi ne, %2949, %2909 : i64
      scf.if %2950 {
        func.call @stack_push_pointer(%2949) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2571) : (i64) -> ()
        func.call @stack_push_pointer(%2616) : (i64) -> ()
        func.call @stack_push_pointer(%2857) : (i64) -> ()
        func.call @stack_push_pointer(%2878) : (i64) -> ()
        func.call @stack_push_pointer(%2885) : (i64) -> ()
        func.call @stack_push_pointer(%2889) : (i64) -> ()
        func.call @stack_push_pointer(%2896) : (i64) -> ()
        func.call @stack_push_pointer(%2908) : (i64) -> ()
        %2951 = llvm.mlir.addressof @str289 : !llvm.ptr
        %2952 = func.call @cc_make_function_ref_const(%2951) : (!llvm.ptr) -> i64
        %2953 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2952, %2953) : (i64, i64) -> ()
      }
      %2954 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2954 : i64
    }
    %2955 = func.call @cc_nil_value() : () -> i64
    %2956 = func.call @cc_errorp(%2562) : (i64) -> i64
    %2957 = arith.cmpi ne, %2956, %2955 : i64
    %2958 = scf.if %2957 -> (i64) {
      scf.yield %2562 : i64
    } else {
      %2959 = llvm.mlir.addressof @str290 : !llvm.ptr
      %2960 = arith.constant 14 : i64
      %2961 = func.call @cc_make_string(%2959, %2960) : (!llvm.ptr, i64) -> i64
      %2962 = func.call @cc_nil_value() : () -> i64
      %2963 = func.call @cc_intern(%2961, %2962) : (i64, i64) -> i64
      %2964 = func.call @cc_nil_value() : () -> i64
      %2965 = func.call @cc_cons(%2963, %2964) : (i64, i64) -> i64
      %2966 = func.call @cc_values_pack(%2965) : (i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2967 = arith.addi %2963, %__rlasp_stack_elide_zero_106 : i64
      %2968 = llvm.mlir.addressof @str291 : !llvm.ptr
      %2969 = arith.constant 5 : i64
      %2970 = func.call @cc_make_string(%2968, %2969) : (!llvm.ptr, i64) -> i64
      %2971 = func.call @cc_nil_value() : () -> i64
      %2972 = func.call @cc_intern(%2970, %2971) : (i64, i64) -> i64
      %2973 = func.call @cc_nil_value() : () -> i64
      %2974 = func.call @cc_cons(%2972, %2973) : (i64, i64) -> i64
      %2975 = func.call @cc_values_pack(%2974) : (i64) -> i64
      func.call @stack_push_pointer(%2972) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2976 = llvm.mlir.addressof @str292 : !llvm.ptr
      %2977 = arith.constant 21 : i64
      %2978 = func.call @cc_make_string(%2976, %2977) : (!llvm.ptr, i64) -> i64
      %2979 = llvm.mlir.addressof @str293 : !llvm.ptr
      %2980 = arith.constant 11 : i64
      %2981 = func.call @cc_make_string(%2979, %2980) : (!llvm.ptr, i64) -> i64
      %2982 = func.call @cc_intern(%2978, %2981) : (i64, i64) -> i64
      %2983 = func.call @cc_nil_value() : () -> i64
      %2984 = func.call @cc_cons(%2982, %2983) : (i64, i64) -> i64
      %2985 = func.call @cc_values_pack(%2984) : (i64) -> i64
      func.call @stack_push_pointer(%2982) : (i64) -> ()
      %2986 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2987 = arith.constant 13 : i64
      %2988 = func.call @cc_make_string(%2986, %2987) : (!llvm.ptr, i64) -> i64
      %2989 = func.call @cc_nil_value() : () -> i64
      %2990 = func.call @cc_intern(%2988, %2989) : (i64, i64) -> i64
      %2991 = func.call @cc_nil_value() : () -> i64
      %2992 = func.call @cc_cons(%2990, %2991) : (i64, i64) -> i64
      %2993 = func.call @cc_values_pack(%2992) : (i64) -> i64
      func.call @stack_push_pointer(%2990) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2994 = func.call @stack_pop_pointer() : () -> i64
      %2995 = func.call @stack_pop_pointer() : () -> i64
      %2996 = func.call @cc_cons(%2995, %2994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2996) : (i64) -> ()
      %2997 = llvm.mlir.addressof @str295 : !llvm.ptr
      %2998 = arith.constant 21 : i64
      %2999 = func.call @cc_make_string(%2997, %2998) : (!llvm.ptr, i64) -> i64
      %3000 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3001 = arith.constant 11 : i64
      %3002 = func.call @cc_make_string(%3000, %3001) : (!llvm.ptr, i64) -> i64
      %3003 = func.call @cc_intern(%2999, %3002) : (i64, i64) -> i64
      %3004 = func.call @cc_nil_value() : () -> i64
      %3005 = func.call @cc_cons(%3003, %3004) : (i64, i64) -> i64
      %3006 = func.call @cc_values_pack(%3005) : (i64) -> i64
      func.call @stack_push_pointer(%3003) : (i64) -> ()
      %3007 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3008 = arith.constant 12 : i64
      %3009 = func.call @cc_make_string(%3007, %3008) : (!llvm.ptr, i64) -> i64
      %3010 = func.call @cc_nil_value() : () -> i64
      %3011 = func.call @cc_intern(%3009, %3010) : (i64, i64) -> i64
      %3012 = func.call @cc_nil_value() : () -> i64
      %3013 = func.call @cc_cons(%3011, %3012) : (i64, i64) -> i64
      %3014 = func.call @cc_values_pack(%3013) : (i64) -> i64
      func.call @stack_push_pointer(%3011) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3015 = func.call @stack_pop_pointer() : () -> i64
      %3016 = func.call @stack_pop_pointer() : () -> i64
      %3017 = func.call @cc_cons(%3016, %3015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3017) : (i64) -> ()
      %3018 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3019 = arith.constant 22 : i64
      %3020 = func.call @cc_make_string(%3018, %3019) : (!llvm.ptr, i64) -> i64
      %3021 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3022 = arith.constant 11 : i64
      %3023 = func.call @cc_make_string(%3021, %3022) : (!llvm.ptr, i64) -> i64
      %3024 = func.call @cc_intern(%3020, %3023) : (i64, i64) -> i64
      %3025 = func.call @cc_nil_value() : () -> i64
      %3026 = func.call @cc_cons(%3024, %3025) : (i64, i64) -> i64
      %3027 = func.call @cc_values_pack(%3026) : (i64) -> i64
      func.call @stack_push_pointer(%3024) : (i64) -> ()
      %3028 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3029 = arith.constant 12 : i64
      %3030 = func.call @cc_make_string(%3028, %3029) : (!llvm.ptr, i64) -> i64
      %3031 = func.call @cc_nil_value() : () -> i64
      %3032 = func.call @cc_intern(%3030, %3031) : (i64, i64) -> i64
      %3033 = func.call @cc_nil_value() : () -> i64
      %3034 = func.call @cc_cons(%3032, %3033) : (i64, i64) -> i64
      %3035 = func.call @cc_values_pack(%3034) : (i64) -> i64
      func.call @stack_push_pointer(%3032) : (i64) -> ()
      %3036 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3037 = arith.constant 3 : i64
      %3038 = func.call @cc_make_string(%3036, %3037) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3038) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3039 = func.call @stack_pop_pointer() : () -> i64
      %3040 = func.call @stack_pop_pointer() : () -> i64
      %3041 = func.call @cc_cons(%3040, %3039) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %3042 = arith.addi %3041, %__rlasp_stack_elide_zero_107 : i64
      %3043 = func.call @stack_pop_pointer() : () -> i64
      %3044 = func.call @cc_cons(%3043, %3042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3044) : (i64) -> ()
      %3045 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3046 = arith.constant 16 : i64
      %3047 = func.call @cc_make_string(%3045, %3046) : (!llvm.ptr, i64) -> i64
      %3048 = func.call @cc_nil_value() : () -> i64
      %3049 = func.call @cc_intern(%3047, %3048) : (i64, i64) -> i64
      %3050 = func.call @cc_nil_value() : () -> i64
      %3051 = func.call @cc_cons(%3049, %3050) : (i64, i64) -> i64
      %3052 = func.call @cc_values_pack(%3051) : (i64) -> i64
      func.call @stack_push_pointer(%3049) : (i64) -> ()
      %3053 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3054 = arith.constant 6 : i64
      %3055 = func.call @cc_make_string(%3053, %3054) : (!llvm.ptr, i64) -> i64
      %3056 = func.call @cc_nil_value() : () -> i64
      %3057 = func.call @cc_intern(%3055, %3056) : (i64, i64) -> i64
      %3058 = func.call @cc_nil_value() : () -> i64
      %3059 = func.call @cc_cons(%3057, %3058) : (i64, i64) -> i64
      %3060 = func.call @cc_values_pack(%3059) : (i64) -> i64
      func.call @stack_push_pointer(%3057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3061 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3062 = arith.constant 5 : i64
      %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
      %3064 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3065 = arith.constant 7 : i64
      %3066 = func.call @cc_make_string(%3064, %3065) : (!llvm.ptr, i64) -> i64
      %3067 = func.call @cc_intern(%3063, %3066) : (i64, i64) -> i64
      %3068 = func.call @cc_nil_value() : () -> i64
      %3069 = func.call @cc_cons(%3067, %3068) : (i64, i64) -> i64
      %3070 = func.call @cc_values_pack(%3069) : (i64) -> i64
      func.call @stack_push_pointer(%3067) : (i64) -> ()
      %3071 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3072 = arith.constant 12 : i64
      %3073 = func.call @cc_make_string(%3071, %3072) : (!llvm.ptr, i64) -> i64
      %3074 = func.call @cc_nil_value() : () -> i64
      %3075 = func.call @cc_intern(%3073, %3074) : (i64, i64) -> i64
      %3076 = func.call @cc_nil_value() : () -> i64
      %3077 = func.call @cc_cons(%3075, %3076) : (i64, i64) -> i64
      %3078 = func.call @cc_values_pack(%3077) : (i64) -> i64
      func.call @stack_push_pointer(%3075) : (i64) -> ()
      %3079 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3080 = arith.constant 6 : i64
      %3081 = func.call @cc_make_string(%3079, %3080) : (!llvm.ptr, i64) -> i64
      %3082 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3083 = arith.constant 7 : i64
      %3084 = func.call @cc_make_string(%3082, %3083) : (!llvm.ptr, i64) -> i64
      %3085 = func.call @cc_intern(%3081, %3084) : (i64, i64) -> i64
      %3086 = func.call @cc_nil_value() : () -> i64
      %3087 = func.call @cc_cons(%3085, %3086) : (i64, i64) -> i64
      %3088 = func.call @cc_values_pack(%3087) : (i64) -> i64
      func.call @stack_push_pointer(%3085) : (i64) -> ()
      %3089 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3090 = arith.constant 13 : i64
      %3091 = func.call @cc_make_string(%3089, %3090) : (!llvm.ptr, i64) -> i64
      %3092 = func.call @cc_nil_value() : () -> i64
      %3093 = func.call @cc_intern(%3091, %3092) : (i64, i64) -> i64
      %3094 = func.call @cc_nil_value() : () -> i64
      %3095 = func.call @cc_cons(%3093, %3094) : (i64, i64) -> i64
      %3096 = func.call @cc_values_pack(%3095) : (i64) -> i64
      func.call @stack_push_pointer(%3093) : (i64) -> ()
      %3097 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3098 = arith.constant 5 : i64
      %3099 = func.call @cc_make_string(%3097, %3098) : (!llvm.ptr, i64) -> i64
      %3100 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3101 = arith.constant 7 : i64
      %3102 = func.call @cc_make_string(%3100, %3101) : (!llvm.ptr, i64) -> i64
      %3103 = func.call @cc_intern(%3099, %3102) : (i64, i64) -> i64
      %3104 = func.call @cc_nil_value() : () -> i64
      %3105 = func.call @cc_cons(%3103, %3104) : (i64, i64) -> i64
      %3106 = func.call @cc_values_pack(%3105) : (i64) -> i64
      func.call @stack_push_pointer(%3103) : (i64) -> ()
      %3107 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3108 = arith.constant 12 : i64
      %3109 = func.call @cc_make_string(%3107, %3108) : (!llvm.ptr, i64) -> i64
      %3110 = func.call @cc_nil_value() : () -> i64
      %3111 = func.call @cc_intern(%3109, %3110) : (i64, i64) -> i64
      %3112 = func.call @cc_nil_value() : () -> i64
      %3113 = func.call @cc_cons(%3111, %3112) : (i64, i64) -> i64
      %3114 = func.call @cc_values_pack(%3113) : (i64) -> i64
      func.call @stack_push_pointer(%3111) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3115 = func.call @stack_pop_pointer() : () -> i64
      %3116 = func.call @stack_pop_pointer() : () -> i64
      %3117 = func.call @cc_cons(%3116, %3115) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %3118 = arith.addi %3117, %__rlasp_stack_elide_zero_108 : i64
      %3119 = func.call @stack_pop_pointer() : () -> i64
      %3120 = func.call @cc_cons(%3119, %3118) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %3121 = arith.addi %3120, %__rlasp_stack_elide_zero_109 : i64
      %3122 = func.call @stack_pop_pointer() : () -> i64
      %3123 = func.call @cc_cons(%3122, %3121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %3124 = arith.addi %3123, %__rlasp_stack_elide_zero_110 : i64
      %3125 = func.call @stack_pop_pointer() : () -> i64
      %3126 = func.call @cc_cons(%3125, %3124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %3127 = arith.addi %3126, %__rlasp_stack_elide_zero_111 : i64
      %3128 = func.call @stack_pop_pointer() : () -> i64
      %3129 = func.call @cc_cons(%3128, %3127) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %3130 = arith.addi %3129, %__rlasp_stack_elide_zero_112 : i64
      %3131 = func.call @stack_pop_pointer() : () -> i64
      %3132 = func.call @cc_cons(%3131, %3130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %3133 = arith.addi %3132, %__rlasp_stack_elide_zero_113 : i64
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @cc_cons(%3134, %3133) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %3136 = arith.addi %3135, %__rlasp_stack_elide_zero_114 : i64
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = func.call @cc_cons(%3137, %3136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3139 = func.call @stack_pop_pointer() : () -> i64
      %3140 = func.call @stack_pop_pointer() : () -> i64
      %3141 = func.call @cc_cons(%3140, %3139) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %3142 = arith.addi %3141, %__rlasp_stack_elide_zero_115 : i64
      %3143 = func.call @stack_pop_pointer() : () -> i64
      %3144 = func.call @cc_cons(%3143, %3142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3144) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3145 = func.call @stack_pop_pointer() : () -> i64
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @cc_cons(%3146, %3145) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %3148 = arith.addi %3147, %__rlasp_stack_elide_zero_116 : i64
      %3149 = func.call @stack_pop_pointer() : () -> i64
      %3150 = func.call @cc_cons(%3149, %3148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %3151 = arith.addi %3150, %__rlasp_stack_elide_zero_117 : i64
      %3152 = func.call @stack_pop_pointer() : () -> i64
      %3153 = func.call @cc_cons(%3152, %3151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3153) : (i64) -> ()
      %3154 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3155 = arith.constant 11 : i64
      %3156 = func.call @cc_make_string(%3154, %3155) : (!llvm.ptr, i64) -> i64
      %3157 = func.call @cc_nil_value() : () -> i64
      %3158 = func.call @cc_intern(%3156, %3157) : (i64, i64) -> i64
      %3159 = func.call @cc_nil_value() : () -> i64
      %3160 = func.call @cc_cons(%3158, %3159) : (i64, i64) -> i64
      %3161 = func.call @cc_values_pack(%3160) : (i64) -> i64
      func.call @stack_push_pointer(%3158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3162 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3163 = arith.constant 6 : i64
      %3164 = func.call @cc_make_string(%3162, %3163) : (!llvm.ptr, i64) -> i64
      %3165 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3166 = arith.constant 11 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = func.call @cc_intern(%3164, %3167) : (i64, i64) -> i64
      %3169 = func.call @cc_nil_value() : () -> i64
      %3170 = func.call @cc_cons(%3168, %3169) : (i64, i64) -> i64
      %3171 = func.call @cc_values_pack(%3170) : (i64) -> i64
      func.call @stack_push_pointer(%3168) : (i64) -> ()
      %3172 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3173 = arith.constant 5 : i64
      %3174 = func.call @cc_make_string(%3172, %3173) : (!llvm.ptr, i64) -> i64
      %3175 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3176 = arith.constant 11 : i64
      %3177 = func.call @cc_make_string(%3175, %3176) : (!llvm.ptr, i64) -> i64
      %3178 = func.call @cc_intern(%3174, %3177) : (i64, i64) -> i64
      %3179 = func.call @cc_nil_value() : () -> i64
      %3180 = func.call @cc_cons(%3178, %3179) : (i64, i64) -> i64
      %3181 = func.call @cc_values_pack(%3180) : (i64) -> i64
      func.call @stack_push_pointer(%3178) : (i64) -> ()
      %3182 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3183 = arith.constant 6 : i64
      %3184 = func.call @cc_make_string(%3182, %3183) : (!llvm.ptr, i64) -> i64
      %3185 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3186 = arith.constant 11 : i64
      %3187 = func.call @cc_make_string(%3185, %3186) : (!llvm.ptr, i64) -> i64
      %3188 = func.call @cc_intern(%3184, %3187) : (i64, i64) -> i64
      %3189 = func.call @cc_nil_value() : () -> i64
      %3190 = func.call @cc_cons(%3188, %3189) : (i64, i64) -> i64
      %3191 = func.call @cc_values_pack(%3190) : (i64) -> i64
      func.call @stack_push_pointer(%3188) : (i64) -> ()
      %3192 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3193 = arith.constant 24 : i64
      %3194 = func.call @cc_make_string(%3192, %3193) : (!llvm.ptr, i64) -> i64
      %3195 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3196 = arith.constant 11 : i64
      %3197 = func.call @cc_make_string(%3195, %3196) : (!llvm.ptr, i64) -> i64
      %3198 = func.call @cc_intern(%3194, %3197) : (i64, i64) -> i64
      %3199 = func.call @cc_nil_value() : () -> i64
      %3200 = func.call @cc_cons(%3198, %3199) : (i64, i64) -> i64
      %3201 = func.call @cc_values_pack(%3200) : (i64) -> i64
      func.call @stack_push_pointer(%3198) : (i64) -> ()
      %3202 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3203 = arith.constant 13 : i64
      %3204 = func.call @cc_make_string(%3202, %3203) : (!llvm.ptr, i64) -> i64
      %3205 = func.call @cc_nil_value() : () -> i64
      %3206 = func.call @cc_intern(%3204, %3205) : (i64, i64) -> i64
      %3207 = func.call @cc_nil_value() : () -> i64
      %3208 = func.call @cc_cons(%3206, %3207) : (i64, i64) -> i64
      %3209 = func.call @cc_values_pack(%3208) : (i64) -> i64
      func.call @stack_push_pointer(%3206) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3210 = func.call @stack_pop_pointer() : () -> i64
      %3211 = func.call @stack_pop_pointer() : () -> i64
      %3212 = func.call @cc_cons(%3211, %3210) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %3213 = arith.addi %3212, %__rlasp_stack_elide_zero_118 : i64
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @cc_cons(%3214, %3213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @stack_pop_pointer() : () -> i64
      %3218 = func.call @cc_cons(%3217, %3216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %3219 = arith.addi %3218, %__rlasp_stack_elide_zero_119 : i64
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @cc_cons(%3220, %3219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3221) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3222 = func.call @stack_pop_pointer() : () -> i64
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @cc_cons(%3223, %3222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %3225 = arith.addi %3224, %__rlasp_stack_elide_zero_120 : i64
      %3226 = func.call @stack_pop_pointer() : () -> i64
      %3227 = func.call @cc_cons(%3226, %3225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3227) : (i64) -> ()
      %3228 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3229 = arith.constant 5 : i64
      %3230 = func.call @cc_make_string(%3228, %3229) : (!llvm.ptr, i64) -> i64
      %3231 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3232 = arith.constant 11 : i64
      %3233 = func.call @cc_make_string(%3231, %3232) : (!llvm.ptr, i64) -> i64
      %3234 = func.call @cc_intern(%3230, %3233) : (i64, i64) -> i64
      %3235 = func.call @cc_nil_value() : () -> i64
      %3236 = func.call @cc_cons(%3234, %3235) : (i64, i64) -> i64
      %3237 = func.call @cc_values_pack(%3236) : (i64) -> i64
      func.call @stack_push_pointer(%3234) : (i64) -> ()
      %3238 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3239 = arith.constant 6 : i64
      %3240 = func.call @cc_make_string(%3238, %3239) : (!llvm.ptr, i64) -> i64
      %3241 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3242 = arith.constant 11 : i64
      %3243 = func.call @cc_make_string(%3241, %3242) : (!llvm.ptr, i64) -> i64
      %3244 = func.call @cc_intern(%3240, %3243) : (i64, i64) -> i64
      %3245 = func.call @cc_nil_value() : () -> i64
      %3246 = func.call @cc_cons(%3244, %3245) : (i64, i64) -> i64
      %3247 = func.call @cc_values_pack(%3246) : (i64) -> i64
      func.call @stack_push_pointer(%3244) : (i64) -> ()
      %3248 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3249 = arith.constant 24 : i64
      %3250 = func.call @cc_make_string(%3248, %3249) : (!llvm.ptr, i64) -> i64
      %3251 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3252 = arith.constant 11 : i64
      %3253 = func.call @cc_make_string(%3251, %3252) : (!llvm.ptr, i64) -> i64
      %3254 = func.call @cc_intern(%3250, %3253) : (i64, i64) -> i64
      %3255 = func.call @cc_nil_value() : () -> i64
      %3256 = func.call @cc_cons(%3254, %3255) : (i64, i64) -> i64
      %3257 = func.call @cc_values_pack(%3256) : (i64) -> i64
      func.call @stack_push_pointer(%3254) : (i64) -> ()
      %3258 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3259 = arith.constant 12 : i64
      %3260 = func.call @cc_make_string(%3258, %3259) : (!llvm.ptr, i64) -> i64
      %3261 = func.call @cc_nil_value() : () -> i64
      %3262 = func.call @cc_intern(%3260, %3261) : (i64, i64) -> i64
      %3263 = func.call @cc_nil_value() : () -> i64
      %3264 = func.call @cc_cons(%3262, %3263) : (i64, i64) -> i64
      %3265 = func.call @cc_values_pack(%3264) : (i64) -> i64
      func.call @stack_push_pointer(%3262) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3266 = func.call @stack_pop_pointer() : () -> i64
      %3267 = func.call @stack_pop_pointer() : () -> i64
      %3268 = func.call @cc_cons(%3267, %3266) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %3269 = arith.addi %3268, %__rlasp_stack_elide_zero_121 : i64
      %3270 = func.call @stack_pop_pointer() : () -> i64
      %3271 = func.call @cc_cons(%3270, %3269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3271) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3272 = func.call @stack_pop_pointer() : () -> i64
      %3273 = func.call @stack_pop_pointer() : () -> i64
      %3274 = func.call @cc_cons(%3273, %3272) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %3275 = arith.addi %3274, %__rlasp_stack_elide_zero_122 : i64
      %3276 = func.call @stack_pop_pointer() : () -> i64
      %3277 = func.call @cc_cons(%3276, %3275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3278 = func.call @stack_pop_pointer() : () -> i64
      %3279 = func.call @stack_pop_pointer() : () -> i64
      %3280 = func.call @cc_cons(%3279, %3278) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %3281 = arith.addi %3280, %__rlasp_stack_elide_zero_123 : i64
      %3282 = func.call @stack_pop_pointer() : () -> i64
      %3283 = func.call @cc_cons(%3282, %3281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3283) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3284 = func.call @stack_pop_pointer() : () -> i64
      %3285 = func.call @stack_pop_pointer() : () -> i64
      %3286 = func.call @cc_cons(%3285, %3284) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %3287 = arith.addi %3286, %__rlasp_stack_elide_zero_124 : i64
      %3288 = func.call @stack_pop_pointer() : () -> i64
      %3289 = func.call @cc_cons(%3288, %3287) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %3290 = arith.addi %3289, %__rlasp_stack_elide_zero_125 : i64
      %3291 = func.call @stack_pop_pointer() : () -> i64
      %3292 = func.call @cc_cons(%3291, %3290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3292) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3293 = func.call @stack_pop_pointer() : () -> i64
      %3294 = func.call @stack_pop_pointer() : () -> i64
      %3295 = func.call @cc_cons(%3294, %3293) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %3296 = arith.addi %3295, %__rlasp_stack_elide_zero_126 : i64
      %3297 = func.call @stack_pop_pointer() : () -> i64
      %3298 = func.call @cc_cons(%3297, %3296) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %3299 = arith.addi %3298, %__rlasp_stack_elide_zero_127 : i64
      %3300 = func.call @stack_pop_pointer() : () -> i64
      %3301 = func.call @cc_cons(%3300, %3299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3301) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3302 = func.call @stack_pop_pointer() : () -> i64
      %3303 = func.call @stack_pop_pointer() : () -> i64
      %3304 = func.call @cc_cons(%3303, %3302) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %3305 = arith.addi %3304, %__rlasp_stack_elide_zero_128 : i64
      %3306 = func.call @stack_pop_pointer() : () -> i64
      %3307 = func.call @cc_cons(%3306, %3305) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %3308 = arith.addi %3307, %__rlasp_stack_elide_zero_129 : i64
      %3309 = func.call @stack_pop_pointer() : () -> i64
      %3310 = func.call @cc_cons(%3309, %3308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %3311 = arith.addi %3310, %__rlasp_stack_elide_zero_130 : i64
      %3312 = func.call @stack_pop_pointer() : () -> i64
      %3313 = func.call @cc_cons(%3312, %3311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3314 = func.call @stack_pop_pointer() : () -> i64
      %3315 = func.call @stack_pop_pointer() : () -> i64
      %3316 = func.call @cc_cons(%3315, %3314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %3317 = arith.addi %3316, %__rlasp_stack_elide_zero_131 : i64
      %3318 = func.call @stack_pop_pointer() : () -> i64
      %3319 = func.call @cc_cons(%3318, %3317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %3320 = arith.addi %3319, %__rlasp_stack_elide_zero_132 : i64
      %3321 = func.call @stack_pop_pointer() : () -> i64
      %3322 = func.call @cc_cons(%3321, %3320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3322) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3323 = func.call @stack_pop_pointer() : () -> i64
      %3324 = func.call @stack_pop_pointer() : () -> i64
      %3325 = func.call @cc_cons(%3324, %3323) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %3326 = arith.addi %3325, %__rlasp_stack_elide_zero_133 : i64
      %3327 = func.call @stack_pop_pointer() : () -> i64
      %3328 = func.call @cc_cons(%3327, %3326) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %3329 = arith.addi %3328, %__rlasp_stack_elide_zero_134 : i64
      %3330 = func.call @stack_pop_pointer() : () -> i64
      %3331 = func.call @cc_cons(%3330, %3329) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %3332 = arith.addi %3331, %__rlasp_stack_elide_zero_135 : i64
      %3788 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3789 = arith.constant 35 : i64
      %3790 = func.call @cc_make_symbol(%3788, %3789) : (!llvm.ptr, i64) -> i64
      %3791 = func.call @cc_persistent_root_value(%3790) : (i64) -> i64
      func.call @stack_push_pointer(%3791) : (i64) -> ()
      %3792 = arith.constant 263377075044367 : i64
      %3793 = arith.constant 1 : i64
      %3794 = func.call @cc_make_closure(%3792, %3793) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %3795 = arith.addi %3794, %__rlasp_stack_elide_zero_136 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3796 = func.call @stack_pop_pointer() : () -> i64
      %3797 = func.call @stack_pop_pointer() : () -> i64
      %3798 = func.call @cc_cons(%3797, %3796) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %3799 = arith.addi %3798, %__rlasp_stack_elide_zero_137 : i64
      %3800 = func.call @stack_pop_pointer() : () -> i64
      %3801 = func.call @cc_cons(%3800, %3799) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %3802 = arith.addi %3801, %__rlasp_stack_elide_zero_138 : i64
      %3803 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3804 = arith.constant 11 : i64
      %3805 = func.call @cc_make_string(%3803, %3804) : (!llvm.ptr, i64) -> i64
      %3806 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3807 = arith.constant 7 : i64
      %3808 = func.call @cc_make_string(%3806, %3807) : (!llvm.ptr, i64) -> i64
      %3809 = func.call @cc_intern(%3805, %3808) : (i64, i64) -> i64
      %3810 = func.call @cc_nil_value() : () -> i64
      %3811 = func.call @cc_cons(%3809, %3810) : (i64, i64) -> i64
      %3812 = func.call @cc_values_pack(%3811) : (i64) -> i64
      %3813 = func.call @cc_nil_value() : () -> i64
      %3814 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3815 = arith.constant 4 : i64
      %3816 = func.call @cc_make_string(%3814, %3815) : (!llvm.ptr, i64) -> i64
      %3817 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3818 = arith.constant 7 : i64
      %3819 = func.call @cc_make_string(%3817, %3818) : (!llvm.ptr, i64) -> i64
      %3820 = func.call @cc_intern(%3816, %3819) : (i64, i64) -> i64
      %3821 = func.call @cc_nil_value() : () -> i64
      %3822 = func.call @cc_cons(%3820, %3821) : (i64, i64) -> i64
      %3823 = func.call @cc_values_pack(%3822) : (i64) -> i64
      %3824 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3825 = arith.constant 6 : i64
      %3826 = func.call @cc_make_string(%3824, %3825) : (!llvm.ptr, i64) -> i64
      %3827 = func.call @cc_nil_value() : () -> i64
      %3828 = func.call @cc_intern(%3826, %3827) : (i64, i64) -> i64
      %3829 = func.call @cc_nil_value() : () -> i64
      %3830 = func.call @cc_cons(%3828, %3829) : (i64, i64) -> i64
      %3831 = func.call @cc_values_pack(%3830) : (i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %3832 = arith.addi %3828, %__rlasp_stack_elide_zero_139 : i64
      %3833 = func.call @cc_nil_value() : () -> i64
      %3834 = func.call @cc_errorp(%2967) : (i64) -> i64
      %3835 = arith.cmpi ne, %3834, %3833 : i64
      %3836 = arith.cmpi eq, %3833, %3833 : i64
      %3837 = arith.andi %3835, %3836 : i1
      %3838 = scf.if %3837 -> (i64) {
        scf.yield %2967 : i64
      } else {
        scf.yield %3833 : i64
      }
      %3839 = func.call @cc_errorp(%3332) : (i64) -> i64
      %3840 = arith.cmpi ne, %3839, %3833 : i64
      %3841 = arith.cmpi eq, %3838, %3833 : i64
      %3842 = arith.andi %3840, %3841 : i1
      %3843 = scf.if %3842 -> (i64) {
        scf.yield %3332 : i64
      } else {
        scf.yield %3838 : i64
      }
      %3844 = func.call @cc_errorp(%3795) : (i64) -> i64
      %3845 = arith.cmpi ne, %3844, %3833 : i64
      %3846 = arith.cmpi eq, %3843, %3833 : i64
      %3847 = arith.andi %3845, %3846 : i1
      %3848 = scf.if %3847 -> (i64) {
        scf.yield %3795 : i64
      } else {
        scf.yield %3843 : i64
      }
      %3849 = func.call @cc_errorp(%3802) : (i64) -> i64
      %3850 = arith.cmpi ne, %3849, %3833 : i64
      %3851 = arith.cmpi eq, %3848, %3833 : i64
      %3852 = arith.andi %3850, %3851 : i1
      %3853 = scf.if %3852 -> (i64) {
        scf.yield %3802 : i64
      } else {
        scf.yield %3848 : i64
      }
      %3854 = func.call @cc_errorp(%3809) : (i64) -> i64
      %3855 = arith.cmpi ne, %3854, %3833 : i64
      %3856 = arith.cmpi eq, %3853, %3833 : i64
      %3857 = arith.andi %3855, %3856 : i1
      %3858 = scf.if %3857 -> (i64) {
        scf.yield %3809 : i64
      } else {
        scf.yield %3853 : i64
      }
      %3859 = func.call @cc_errorp(%3813) : (i64) -> i64
      %3860 = arith.cmpi ne, %3859, %3833 : i64
      %3861 = arith.cmpi eq, %3858, %3833 : i64
      %3862 = arith.andi %3860, %3861 : i1
      %3863 = scf.if %3862 -> (i64) {
        scf.yield %3813 : i64
      } else {
        scf.yield %3858 : i64
      }
      %3864 = func.call @cc_errorp(%3820) : (i64) -> i64
      %3865 = arith.cmpi ne, %3864, %3833 : i64
      %3866 = arith.cmpi eq, %3863, %3833 : i64
      %3867 = arith.andi %3865, %3866 : i1
      %3868 = scf.if %3867 -> (i64) {
        scf.yield %3820 : i64
      } else {
        scf.yield %3863 : i64
      }
      %3869 = func.call @cc_errorp(%3832) : (i64) -> i64
      %3870 = arith.cmpi ne, %3869, %3833 : i64
      %3871 = arith.cmpi eq, %3868, %3833 : i64
      %3872 = arith.andi %3870, %3871 : i1
      %3873 = scf.if %3872 -> (i64) {
        scf.yield %3832 : i64
      } else {
        scf.yield %3868 : i64
      }
      %3874 = arith.cmpi ne, %3873, %3833 : i64
      scf.if %3874 {
        func.call @stack_push_pointer(%3873) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2967) : (i64) -> ()
        func.call @stack_push_pointer(%3332) : (i64) -> ()
        func.call @stack_push_pointer(%3795) : (i64) -> ()
        func.call @stack_push_pointer(%3802) : (i64) -> ()
        func.call @stack_push_pointer(%3809) : (i64) -> ()
        func.call @stack_push_pointer(%3813) : (i64) -> ()
        func.call @stack_push_pointer(%3820) : (i64) -> ()
        func.call @stack_push_pointer(%3832) : (i64) -> ()
        %3875 = llvm.mlir.addressof @str379 : !llvm.ptr
        %3876 = func.call @cc_make_function_ref_const(%3875) : (!llvm.ptr) -> i64
        %3877 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3876, %3877) : (i64, i64) -> ()
      }
      %3878 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3878 : i64
    }
    %3879 = func.call @cc_nil_value() : () -> i64
    %3880 = func.call @cc_errorp(%2958) : (i64) -> i64
    %3881 = arith.cmpi ne, %3880, %3879 : i64
    %3882 = scf.if %3881 -> (i64) {
      scf.yield %2958 : i64
    } else {
      %3883 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3884 = arith.constant 25 : i64
      %3885 = func.call @cc_make_string(%3883, %3884) : (!llvm.ptr, i64) -> i64
      %3886 = func.call @cc_nil_value() : () -> i64
      %3887 = func.call @cc_intern(%3885, %3886) : (i64, i64) -> i64
      %3888 = func.call @cc_nil_value() : () -> i64
      %3889 = func.call @cc_cons(%3887, %3888) : (i64, i64) -> i64
      %3890 = func.call @cc_values_pack(%3889) : (i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3891 = arith.addi %3887, %__rlasp_stack_elide_zero_140 : i64
      %3892 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3893 = arith.constant 5 : i64
      %3894 = func.call @cc_make_string(%3892, %3893) : (!llvm.ptr, i64) -> i64
      %3895 = func.call @cc_nil_value() : () -> i64
      %3896 = func.call @cc_intern(%3894, %3895) : (i64, i64) -> i64
      %3897 = func.call @cc_nil_value() : () -> i64
      %3898 = func.call @cc_cons(%3896, %3897) : (i64, i64) -> i64
      %3899 = func.call @cc_values_pack(%3898) : (i64) -> i64
      func.call @stack_push_pointer(%3896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3900 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3901 = arith.constant 21 : i64
      %3902 = func.call @cc_make_string(%3900, %3901) : (!llvm.ptr, i64) -> i64
      %3903 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3904 = arith.constant 11 : i64
      %3905 = func.call @cc_make_string(%3903, %3904) : (!llvm.ptr, i64) -> i64
      %3906 = func.call @cc_intern(%3902, %3905) : (i64, i64) -> i64
      %3907 = func.call @cc_nil_value() : () -> i64
      %3908 = func.call @cc_cons(%3906, %3907) : (i64, i64) -> i64
      %3909 = func.call @cc_values_pack(%3908) : (i64) -> i64
      func.call @stack_push_pointer(%3906) : (i64) -> ()
      %3910 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3911 = arith.constant 13 : i64
      %3912 = func.call @cc_make_string(%3910, %3911) : (!llvm.ptr, i64) -> i64
      %3913 = func.call @cc_nil_value() : () -> i64
      %3914 = func.call @cc_intern(%3912, %3913) : (i64, i64) -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = func.call @cc_cons(%3914, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_values_pack(%3916) : (i64) -> i64
      func.call @stack_push_pointer(%3914) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3918 = func.call @stack_pop_pointer() : () -> i64
      %3919 = func.call @stack_pop_pointer() : () -> i64
      %3920 = func.call @cc_cons(%3919, %3918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3920) : (i64) -> ()
      %3921 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3922 = arith.constant 21 : i64
      %3923 = func.call @cc_make_string(%3921, %3922) : (!llvm.ptr, i64) -> i64
      %3924 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3925 = arith.constant 11 : i64
      %3926 = func.call @cc_make_string(%3924, %3925) : (!llvm.ptr, i64) -> i64
      %3927 = func.call @cc_intern(%3923, %3926) : (i64, i64) -> i64
      %3928 = func.call @cc_nil_value() : () -> i64
      %3929 = func.call @cc_cons(%3927, %3928) : (i64, i64) -> i64
      %3930 = func.call @cc_values_pack(%3929) : (i64) -> i64
      func.call @stack_push_pointer(%3927) : (i64) -> ()
      %3931 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3932 = arith.constant 12 : i64
      %3933 = func.call @cc_make_string(%3931, %3932) : (!llvm.ptr, i64) -> i64
      %3934 = func.call @cc_nil_value() : () -> i64
      %3935 = func.call @cc_intern(%3933, %3934) : (i64, i64) -> i64
      %3936 = func.call @cc_nil_value() : () -> i64
      %3937 = func.call @cc_cons(%3935, %3936) : (i64, i64) -> i64
      %3938 = func.call @cc_values_pack(%3937) : (i64) -> i64
      func.call @stack_push_pointer(%3935) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3939 = func.call @stack_pop_pointer() : () -> i64
      %3940 = func.call @stack_pop_pointer() : () -> i64
      %3941 = func.call @cc_cons(%3940, %3939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3941) : (i64) -> ()
      %3942 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3943 = arith.constant 22 : i64
      %3944 = func.call @cc_make_string(%3942, %3943) : (!llvm.ptr, i64) -> i64
      %3945 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3946 = arith.constant 11 : i64
      %3947 = func.call @cc_make_string(%3945, %3946) : (!llvm.ptr, i64) -> i64
      %3948 = func.call @cc_intern(%3944, %3947) : (i64, i64) -> i64
      %3949 = func.call @cc_nil_value() : () -> i64
      %3950 = func.call @cc_cons(%3948, %3949) : (i64, i64) -> i64
      %3951 = func.call @cc_values_pack(%3950) : (i64) -> i64
      func.call @stack_push_pointer(%3948) : (i64) -> ()
      %3952 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3953 = arith.constant 12 : i64
      %3954 = func.call @cc_make_string(%3952, %3953) : (!llvm.ptr, i64) -> i64
      %3955 = func.call @cc_nil_value() : () -> i64
      %3956 = func.call @cc_intern(%3954, %3955) : (i64, i64) -> i64
      %3957 = func.call @cc_nil_value() : () -> i64
      %3958 = func.call @cc_cons(%3956, %3957) : (i64, i64) -> i64
      %3959 = func.call @cc_values_pack(%3958) : (i64) -> i64
      func.call @stack_push_pointer(%3956) : (i64) -> ()
      %3960 = llvm.mlir.addressof @str391 : !llvm.ptr
      %3961 = arith.constant 0 : i64
      %3962 = func.call @cc_make_string(%3960, %3961) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3962) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3963 = func.call @stack_pop_pointer() : () -> i64
      %3964 = func.call @stack_pop_pointer() : () -> i64
      %3965 = func.call @cc_cons(%3964, %3963) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3966 = arith.addi %3965, %__rlasp_stack_elide_zero_141 : i64
      %3967 = func.call @stack_pop_pointer() : () -> i64
      %3968 = func.call @cc_cons(%3967, %3966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3968) : (i64) -> ()
      %3969 = llvm.mlir.addressof @str392 : !llvm.ptr
      %3970 = arith.constant 16 : i64
      %3971 = func.call @cc_make_string(%3969, %3970) : (!llvm.ptr, i64) -> i64
      %3972 = func.call @cc_nil_value() : () -> i64
      %3973 = func.call @cc_intern(%3971, %3972) : (i64, i64) -> i64
      %3974 = func.call @cc_nil_value() : () -> i64
      %3975 = func.call @cc_cons(%3973, %3974) : (i64, i64) -> i64
      %3976 = func.call @cc_values_pack(%3975) : (i64) -> i64
      func.call @stack_push_pointer(%3973) : (i64) -> ()
      %3977 = llvm.mlir.addressof @str393 : !llvm.ptr
      %3978 = arith.constant 6 : i64
      %3979 = func.call @cc_make_string(%3977, %3978) : (!llvm.ptr, i64) -> i64
      %3980 = func.call @cc_nil_value() : () -> i64
      %3981 = func.call @cc_intern(%3979, %3980) : (i64, i64) -> i64
      %3982 = func.call @cc_nil_value() : () -> i64
      %3983 = func.call @cc_cons(%3981, %3982) : (i64, i64) -> i64
      %3984 = func.call @cc_values_pack(%3983) : (i64) -> i64
      func.call @stack_push_pointer(%3981) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3985 = llvm.mlir.addressof @str394 : !llvm.ptr
      %3986 = arith.constant 5 : i64
      %3987 = func.call @cc_make_string(%3985, %3986) : (!llvm.ptr, i64) -> i64
      %3988 = llvm.mlir.addressof @str395 : !llvm.ptr
      %3989 = arith.constant 7 : i64
      %3990 = func.call @cc_make_string(%3988, %3989) : (!llvm.ptr, i64) -> i64
      %3991 = func.call @cc_intern(%3987, %3990) : (i64, i64) -> i64
      %3992 = func.call @cc_nil_value() : () -> i64
      %3993 = func.call @cc_cons(%3991, %3992) : (i64, i64) -> i64
      %3994 = func.call @cc_values_pack(%3993) : (i64) -> i64
      func.call @stack_push_pointer(%3991) : (i64) -> ()
      %3995 = llvm.mlir.addressof @str396 : !llvm.ptr
      %3996 = arith.constant 12 : i64
      %3997 = func.call @cc_make_string(%3995, %3996) : (!llvm.ptr, i64) -> i64
      %3998 = func.call @cc_nil_value() : () -> i64
      %3999 = func.call @cc_intern(%3997, %3998) : (i64, i64) -> i64
      %4000 = func.call @cc_nil_value() : () -> i64
      %4001 = func.call @cc_cons(%3999, %4000) : (i64, i64) -> i64
      %4002 = func.call @cc_values_pack(%4001) : (i64) -> i64
      func.call @stack_push_pointer(%3999) : (i64) -> ()
      %4003 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4004 = arith.constant 6 : i64
      %4005 = func.call @cc_make_string(%4003, %4004) : (!llvm.ptr, i64) -> i64
      %4006 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4007 = arith.constant 7 : i64
      %4008 = func.call @cc_make_string(%4006, %4007) : (!llvm.ptr, i64) -> i64
      %4009 = func.call @cc_intern(%4005, %4008) : (i64, i64) -> i64
      %4010 = func.call @cc_nil_value() : () -> i64
      %4011 = func.call @cc_cons(%4009, %4010) : (i64, i64) -> i64
      %4012 = func.call @cc_values_pack(%4011) : (i64) -> i64
      func.call @stack_push_pointer(%4009) : (i64) -> ()
      %4013 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4014 = arith.constant 13 : i64
      %4015 = func.call @cc_make_string(%4013, %4014) : (!llvm.ptr, i64) -> i64
      %4016 = func.call @cc_nil_value() : () -> i64
      %4017 = func.call @cc_intern(%4015, %4016) : (i64, i64) -> i64
      %4018 = func.call @cc_nil_value() : () -> i64
      %4019 = func.call @cc_cons(%4017, %4018) : (i64, i64) -> i64
      %4020 = func.call @cc_values_pack(%4019) : (i64) -> i64
      func.call @stack_push_pointer(%4017) : (i64) -> ()
      %4021 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4022 = arith.constant 5 : i64
      %4023 = func.call @cc_make_string(%4021, %4022) : (!llvm.ptr, i64) -> i64
      %4024 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4025 = arith.constant 7 : i64
      %4026 = func.call @cc_make_string(%4024, %4025) : (!llvm.ptr, i64) -> i64
      %4027 = func.call @cc_intern(%4023, %4026) : (i64, i64) -> i64
      %4028 = func.call @cc_nil_value() : () -> i64
      %4029 = func.call @cc_cons(%4027, %4028) : (i64, i64) -> i64
      %4030 = func.call @cc_values_pack(%4029) : (i64) -> i64
      func.call @stack_push_pointer(%4027) : (i64) -> ()
      %4031 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4032 = arith.constant 12 : i64
      %4033 = func.call @cc_make_string(%4031, %4032) : (!llvm.ptr, i64) -> i64
      %4034 = func.call @cc_nil_value() : () -> i64
      %4035 = func.call @cc_intern(%4033, %4034) : (i64, i64) -> i64
      %4036 = func.call @cc_nil_value() : () -> i64
      %4037 = func.call @cc_cons(%4035, %4036) : (i64, i64) -> i64
      %4038 = func.call @cc_values_pack(%4037) : (i64) -> i64
      func.call @stack_push_pointer(%4035) : (i64) -> ()
      %4039 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4040 = arith.constant 4 : i64
      %4041 = func.call @cc_make_string(%4039, %4040) : (!llvm.ptr, i64) -> i64
      %4042 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4043 = arith.constant 7 : i64
      %4044 = func.call @cc_make_string(%4042, %4043) : (!llvm.ptr, i64) -> i64
      %4045 = func.call @cc_intern(%4041, %4044) : (i64, i64) -> i64
      %4046 = func.call @cc_nil_value() : () -> i64
      %4047 = func.call @cc_cons(%4045, %4046) : (i64, i64) -> i64
      %4048 = func.call @cc_values_pack(%4047) : (i64) -> i64
      func.call @stack_push_pointer(%4045) : (i64) -> ()
      %4049 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4049) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4050 = func.call @stack_pop_pointer() : () -> i64
      %4051 = func.call @stack_pop_pointer() : () -> i64
      %4052 = func.call @cc_cons(%4051, %4050) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %4053 = arith.addi %4052, %__rlasp_stack_elide_zero_142 : i64
      %4054 = func.call @stack_pop_pointer() : () -> i64
      %4055 = func.call @cc_cons(%4054, %4053) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %4056 = arith.addi %4055, %__rlasp_stack_elide_zero_143 : i64
      %4057 = func.call @stack_pop_pointer() : () -> i64
      %4058 = func.call @cc_cons(%4057, %4056) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %4059 = arith.addi %4058, %__rlasp_stack_elide_zero_144 : i64
      %4060 = func.call @stack_pop_pointer() : () -> i64
      %4061 = func.call @cc_cons(%4060, %4059) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %4062 = arith.addi %4061, %__rlasp_stack_elide_zero_145 : i64
      %4063 = func.call @stack_pop_pointer() : () -> i64
      %4064 = func.call @cc_cons(%4063, %4062) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %4065 = arith.addi %4064, %__rlasp_stack_elide_zero_146 : i64
      %4066 = func.call @stack_pop_pointer() : () -> i64
      %4067 = func.call @cc_cons(%4066, %4065) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %4068 = arith.addi %4067, %__rlasp_stack_elide_zero_147 : i64
      %4069 = func.call @stack_pop_pointer() : () -> i64
      %4070 = func.call @cc_cons(%4069, %4068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %4071 = arith.addi %4070, %__rlasp_stack_elide_zero_148 : i64
      %4072 = func.call @stack_pop_pointer() : () -> i64
      %4073 = func.call @cc_cons(%4072, %4071) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %4074 = arith.addi %4073, %__rlasp_stack_elide_zero_149 : i64
      %4075 = func.call @stack_pop_pointer() : () -> i64
      %4076 = func.call @cc_cons(%4075, %4074) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %4077 = arith.addi %4076, %__rlasp_stack_elide_zero_150 : i64
      %4078 = func.call @stack_pop_pointer() : () -> i64
      %4079 = func.call @cc_cons(%4078, %4077) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4079) : (i64) -> ()
      %4080 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4081 = arith.constant 11 : i64
      %4082 = func.call @cc_make_string(%4080, %4081) : (!llvm.ptr, i64) -> i64
      %4083 = func.call @cc_nil_value() : () -> i64
      %4084 = func.call @cc_intern(%4082, %4083) : (i64, i64) -> i64
      %4085 = func.call @cc_nil_value() : () -> i64
      %4086 = func.call @cc_cons(%4084, %4085) : (i64, i64) -> i64
      %4087 = func.call @cc_values_pack(%4086) : (i64) -> i64
      func.call @stack_push_pointer(%4084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4088 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4089 = arith.constant 6 : i64
      %4090 = func.call @cc_make_string(%4088, %4089) : (!llvm.ptr, i64) -> i64
      %4091 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4092 = arith.constant 11 : i64
      %4093 = func.call @cc_make_string(%4091, %4092) : (!llvm.ptr, i64) -> i64
      %4094 = func.call @cc_intern(%4090, %4093) : (i64, i64) -> i64
      %4095 = func.call @cc_nil_value() : () -> i64
      %4096 = func.call @cc_cons(%4094, %4095) : (i64, i64) -> i64
      %4097 = func.call @cc_values_pack(%4096) : (i64) -> i64
      func.call @stack_push_pointer(%4094) : (i64) -> ()
      %4098 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4099 = arith.constant 5 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4102 = arith.constant 11 : i64
      %4103 = func.call @cc_make_string(%4101, %4102) : (!llvm.ptr, i64) -> i64
      %4104 = func.call @cc_intern(%4100, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_nil_value() : () -> i64
      %4106 = func.call @cc_cons(%4104, %4105) : (i64, i64) -> i64
      %4107 = func.call @cc_values_pack(%4106) : (i64) -> i64
      func.call @stack_push_pointer(%4104) : (i64) -> ()
      %4108 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4109 = arith.constant 6 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4112 = arith.constant 11 : i64
      %4113 = func.call @cc_make_string(%4111, %4112) : (!llvm.ptr, i64) -> i64
      %4114 = func.call @cc_intern(%4110, %4113) : (i64, i64) -> i64
      %4115 = func.call @cc_nil_value() : () -> i64
      %4116 = func.call @cc_cons(%4114, %4115) : (i64, i64) -> i64
      %4117 = func.call @cc_values_pack(%4116) : (i64) -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4118 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4119 = arith.constant 24 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4122 = arith.constant 11 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_intern(%4120, %4123) : (i64, i64) -> i64
      %4125 = func.call @cc_nil_value() : () -> i64
      %4126 = func.call @cc_cons(%4124, %4125) : (i64, i64) -> i64
      %4127 = func.call @cc_values_pack(%4126) : (i64) -> i64
      func.call @stack_push_pointer(%4124) : (i64) -> ()
      %4128 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4129 = arith.constant 13 : i64
      %4130 = func.call @cc_make_string(%4128, %4129) : (!llvm.ptr, i64) -> i64
      %4131 = func.call @cc_nil_value() : () -> i64
      %4132 = func.call @cc_intern(%4130, %4131) : (i64, i64) -> i64
      %4133 = func.call @cc_nil_value() : () -> i64
      %4134 = func.call @cc_cons(%4132, %4133) : (i64, i64) -> i64
      %4135 = func.call @cc_values_pack(%4134) : (i64) -> i64
      func.call @stack_push_pointer(%4132) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4136 = func.call @stack_pop_pointer() : () -> i64
      %4137 = func.call @stack_pop_pointer() : () -> i64
      %4138 = func.call @cc_cons(%4137, %4136) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %4139 = arith.addi %4138, %__rlasp_stack_elide_zero_151 : i64
      %4140 = func.call @stack_pop_pointer() : () -> i64
      %4141 = func.call @cc_cons(%4140, %4139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4142 = func.call @stack_pop_pointer() : () -> i64
      %4143 = func.call @stack_pop_pointer() : () -> i64
      %4144 = func.call @cc_cons(%4143, %4142) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %4145 = arith.addi %4144, %__rlasp_stack_elide_zero_152 : i64
      %4146 = func.call @stack_pop_pointer() : () -> i64
      %4147 = func.call @cc_cons(%4146, %4145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4147) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4148 = func.call @stack_pop_pointer() : () -> i64
      %4149 = func.call @stack_pop_pointer() : () -> i64
      %4150 = func.call @cc_cons(%4149, %4148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %4151 = arith.addi %4150, %__rlasp_stack_elide_zero_153 : i64
      %4152 = func.call @stack_pop_pointer() : () -> i64
      %4153 = func.call @cc_cons(%4152, %4151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4153) : (i64) -> ()
      %4154 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4155 = arith.constant 5 : i64
      %4156 = func.call @cc_make_string(%4154, %4155) : (!llvm.ptr, i64) -> i64
      %4157 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4158 = arith.constant 11 : i64
      %4159 = func.call @cc_make_string(%4157, %4158) : (!llvm.ptr, i64) -> i64
      %4160 = func.call @cc_intern(%4156, %4159) : (i64, i64) -> i64
      %4161 = func.call @cc_nil_value() : () -> i64
      %4162 = func.call @cc_cons(%4160, %4161) : (i64, i64) -> i64
      %4163 = func.call @cc_values_pack(%4162) : (i64) -> i64
      func.call @stack_push_pointer(%4160) : (i64) -> ()
      %4164 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4165 = arith.constant 6 : i64
      %4166 = func.call @cc_make_string(%4164, %4165) : (!llvm.ptr, i64) -> i64
      %4167 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4168 = arith.constant 11 : i64
      %4169 = func.call @cc_make_string(%4167, %4168) : (!llvm.ptr, i64) -> i64
      %4170 = func.call @cc_intern(%4166, %4169) : (i64, i64) -> i64
      %4171 = func.call @cc_nil_value() : () -> i64
      %4172 = func.call @cc_cons(%4170, %4171) : (i64, i64) -> i64
      %4173 = func.call @cc_values_pack(%4172) : (i64) -> i64
      func.call @stack_push_pointer(%4170) : (i64) -> ()
      %4174 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4175 = arith.constant 24 : i64
      %4176 = func.call @cc_make_string(%4174, %4175) : (!llvm.ptr, i64) -> i64
      %4177 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4178 = arith.constant 11 : i64
      %4179 = func.call @cc_make_string(%4177, %4178) : (!llvm.ptr, i64) -> i64
      %4180 = func.call @cc_intern(%4176, %4179) : (i64, i64) -> i64
      %4181 = func.call @cc_nil_value() : () -> i64
      %4182 = func.call @cc_cons(%4180, %4181) : (i64, i64) -> i64
      %4183 = func.call @cc_values_pack(%4182) : (i64) -> i64
      func.call @stack_push_pointer(%4180) : (i64) -> ()
      %4184 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4185 = arith.constant 12 : i64
      %4186 = func.call @cc_make_string(%4184, %4185) : (!llvm.ptr, i64) -> i64
      %4187 = func.call @cc_nil_value() : () -> i64
      %4188 = func.call @cc_intern(%4186, %4187) : (i64, i64) -> i64
      %4189 = func.call @cc_nil_value() : () -> i64
      %4190 = func.call @cc_cons(%4188, %4189) : (i64, i64) -> i64
      %4191 = func.call @cc_values_pack(%4190) : (i64) -> i64
      func.call @stack_push_pointer(%4188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4192 = func.call @stack_pop_pointer() : () -> i64
      %4193 = func.call @stack_pop_pointer() : () -> i64
      %4194 = func.call @cc_cons(%4193, %4192) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %4195 = arith.addi %4194, %__rlasp_stack_elide_zero_154 : i64
      %4196 = func.call @stack_pop_pointer() : () -> i64
      %4197 = func.call @cc_cons(%4196, %4195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4197) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4198 = func.call @stack_pop_pointer() : () -> i64
      %4199 = func.call @stack_pop_pointer() : () -> i64
      %4200 = func.call @cc_cons(%4199, %4198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %4201 = arith.addi %4200, %__rlasp_stack_elide_zero_155 : i64
      %4202 = func.call @stack_pop_pointer() : () -> i64
      %4203 = func.call @cc_cons(%4202, %4201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4204 = func.call @stack_pop_pointer() : () -> i64
      %4205 = func.call @stack_pop_pointer() : () -> i64
      %4206 = func.call @cc_cons(%4205, %4204) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %4207 = arith.addi %4206, %__rlasp_stack_elide_zero_156 : i64
      %4208 = func.call @stack_pop_pointer() : () -> i64
      %4209 = func.call @cc_cons(%4208, %4207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4209) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4210 = func.call @stack_pop_pointer() : () -> i64
      %4211 = func.call @stack_pop_pointer() : () -> i64
      %4212 = func.call @cc_cons(%4211, %4210) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %4213 = arith.addi %4212, %__rlasp_stack_elide_zero_157 : i64
      %4214 = func.call @stack_pop_pointer() : () -> i64
      %4215 = func.call @cc_cons(%4214, %4213) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %4216 = arith.addi %4215, %__rlasp_stack_elide_zero_158 : i64
      %4217 = func.call @stack_pop_pointer() : () -> i64
      %4218 = func.call @cc_cons(%4217, %4216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4218) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4219 = func.call @stack_pop_pointer() : () -> i64
      %4220 = func.call @stack_pop_pointer() : () -> i64
      %4221 = func.call @cc_cons(%4220, %4219) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %4222 = arith.addi %4221, %__rlasp_stack_elide_zero_159 : i64
      %4223 = func.call @stack_pop_pointer() : () -> i64
      %4224 = func.call @cc_cons(%4223, %4222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %4225 = arith.addi %4224, %__rlasp_stack_elide_zero_160 : i64
      %4226 = func.call @stack_pop_pointer() : () -> i64
      %4227 = func.call @cc_cons(%4226, %4225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4227) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4228 = func.call @stack_pop_pointer() : () -> i64
      %4229 = func.call @stack_pop_pointer() : () -> i64
      %4230 = func.call @cc_cons(%4229, %4228) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %4231 = arith.addi %4230, %__rlasp_stack_elide_zero_161 : i64
      %4232 = func.call @stack_pop_pointer() : () -> i64
      %4233 = func.call @cc_cons(%4232, %4231) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %4234 = arith.addi %4233, %__rlasp_stack_elide_zero_162 : i64
      %4235 = func.call @stack_pop_pointer() : () -> i64
      %4236 = func.call @cc_cons(%4235, %4234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4236) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4237 = func.call @stack_pop_pointer() : () -> i64
      %4238 = func.call @stack_pop_pointer() : () -> i64
      %4239 = func.call @cc_cons(%4238, %4237) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %4240 = arith.addi %4239, %__rlasp_stack_elide_zero_163 : i64
      %4241 = func.call @stack_pop_pointer() : () -> i64
      %4242 = func.call @cc_cons(%4241, %4240) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %4243 = arith.addi %4242, %__rlasp_stack_elide_zero_164 : i64
      %4244 = func.call @stack_pop_pointer() : () -> i64
      %4245 = func.call @cc_cons(%4244, %4243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4246 = func.call @stack_pop_pointer() : () -> i64
      %4247 = func.call @stack_pop_pointer() : () -> i64
      %4248 = func.call @cc_cons(%4247, %4246) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %4249 = arith.addi %4248, %__rlasp_stack_elide_zero_165 : i64
      %4250 = func.call @stack_pop_pointer() : () -> i64
      %4251 = func.call @cc_cons(%4250, %4249) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %4252 = arith.addi %4251, %__rlasp_stack_elide_zero_166 : i64
      %4253 = func.call @stack_pop_pointer() : () -> i64
      %4254 = func.call @cc_cons(%4253, %4252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4254) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4255 = func.call @stack_pop_pointer() : () -> i64
      %4256 = func.call @stack_pop_pointer() : () -> i64
      %4257 = func.call @cc_cons(%4256, %4255) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %4258 = arith.addi %4257, %__rlasp_stack_elide_zero_167 : i64
      %4259 = func.call @stack_pop_pointer() : () -> i64
      %4260 = func.call @cc_cons(%4259, %4258) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %4261 = arith.addi %4260, %__rlasp_stack_elide_zero_168 : i64
      %4262 = func.call @stack_pop_pointer() : () -> i64
      %4263 = func.call @cc_cons(%4262, %4261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4264 = func.call @stack_pop_pointer() : () -> i64
      %4265 = func.call @stack_pop_pointer() : () -> i64
      %4266 = func.call @cc_cons(%4265, %4264) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %4267 = arith.addi %4266, %__rlasp_stack_elide_zero_169 : i64
      %4268 = func.call @stack_pop_pointer() : () -> i64
      %4269 = func.call @cc_cons(%4268, %4267) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %4270 = arith.addi %4269, %__rlasp_stack_elide_zero_170 : i64
      %4271 = func.call @stack_pop_pointer() : () -> i64
      %4272 = func.call @cc_cons(%4271, %4270) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %4273 = arith.addi %4272, %__rlasp_stack_elide_zero_171 : i64
      %4751 = llvm.mlir.addressof @str467 : !llvm.ptr
      %4752 = arith.constant 35 : i64
      %4753 = func.call @cc_make_symbol(%4751, %4752) : (!llvm.ptr, i64) -> i64
      %4754 = func.call @cc_persistent_root_value(%4753) : (i64) -> i64
      func.call @stack_push_pointer(%4754) : (i64) -> ()
      %4755 = arith.constant 263377075044370 : i64
      %4756 = arith.constant 1 : i64
      %4757 = func.call @cc_make_closure(%4755, %4756) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %4758 = arith.addi %4757, %__rlasp_stack_elide_zero_172 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4759 = func.call @stack_pop_pointer() : () -> i64
      %4760 = func.call @stack_pop_pointer() : () -> i64
      %4761 = func.call @cc_cons(%4760, %4759) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %4762 = arith.addi %4761, %__rlasp_stack_elide_zero_173 : i64
      %4763 = func.call @stack_pop_pointer() : () -> i64
      %4764 = func.call @cc_cons(%4763, %4762) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %4765 = arith.addi %4764, %__rlasp_stack_elide_zero_174 : i64
      %4766 = llvm.mlir.addressof @str468 : !llvm.ptr
      %4767 = arith.constant 11 : i64
      %4768 = func.call @cc_make_string(%4766, %4767) : (!llvm.ptr, i64) -> i64
      %4769 = llvm.mlir.addressof @str469 : !llvm.ptr
      %4770 = arith.constant 7 : i64
      %4771 = func.call @cc_make_string(%4769, %4770) : (!llvm.ptr, i64) -> i64
      %4772 = func.call @cc_intern(%4768, %4771) : (i64, i64) -> i64
      %4773 = func.call @cc_nil_value() : () -> i64
      %4774 = func.call @cc_cons(%4772, %4773) : (i64, i64) -> i64
      %4775 = func.call @cc_values_pack(%4774) : (i64) -> i64
      %4776 = func.call @cc_nil_value() : () -> i64
      %4777 = llvm.mlir.addressof @str470 : !llvm.ptr
      %4778 = arith.constant 4 : i64
      %4779 = func.call @cc_make_string(%4777, %4778) : (!llvm.ptr, i64) -> i64
      %4780 = llvm.mlir.addressof @str471 : !llvm.ptr
      %4781 = arith.constant 7 : i64
      %4782 = func.call @cc_make_string(%4780, %4781) : (!llvm.ptr, i64) -> i64
      %4783 = func.call @cc_intern(%4779, %4782) : (i64, i64) -> i64
      %4784 = func.call @cc_nil_value() : () -> i64
      %4785 = func.call @cc_cons(%4783, %4784) : (i64, i64) -> i64
      %4786 = func.call @cc_values_pack(%4785) : (i64) -> i64
      %4787 = llvm.mlir.addressof @str472 : !llvm.ptr
      %4788 = arith.constant 6 : i64
      %4789 = func.call @cc_make_string(%4787, %4788) : (!llvm.ptr, i64) -> i64
      %4790 = func.call @cc_nil_value() : () -> i64
      %4791 = func.call @cc_intern(%4789, %4790) : (i64, i64) -> i64
      %4792 = func.call @cc_nil_value() : () -> i64
      %4793 = func.call @cc_cons(%4791, %4792) : (i64, i64) -> i64
      %4794 = func.call @cc_values_pack(%4793) : (i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %4795 = arith.addi %4791, %__rlasp_stack_elide_zero_175 : i64
      %4796 = func.call @cc_nil_value() : () -> i64
      %4797 = func.call @cc_errorp(%3891) : (i64) -> i64
      %4798 = arith.cmpi ne, %4797, %4796 : i64
      %4799 = arith.cmpi eq, %4796, %4796 : i64
      %4800 = arith.andi %4798, %4799 : i1
      %4801 = scf.if %4800 -> (i64) {
        scf.yield %3891 : i64
      } else {
        scf.yield %4796 : i64
      }
      %4802 = func.call @cc_errorp(%4273) : (i64) -> i64
      %4803 = arith.cmpi ne, %4802, %4796 : i64
      %4804 = arith.cmpi eq, %4801, %4796 : i64
      %4805 = arith.andi %4803, %4804 : i1
      %4806 = scf.if %4805 -> (i64) {
        scf.yield %4273 : i64
      } else {
        scf.yield %4801 : i64
      }
      %4807 = func.call @cc_errorp(%4758) : (i64) -> i64
      %4808 = arith.cmpi ne, %4807, %4796 : i64
      %4809 = arith.cmpi eq, %4806, %4796 : i64
      %4810 = arith.andi %4808, %4809 : i1
      %4811 = scf.if %4810 -> (i64) {
        scf.yield %4758 : i64
      } else {
        scf.yield %4806 : i64
      }
      %4812 = func.call @cc_errorp(%4765) : (i64) -> i64
      %4813 = arith.cmpi ne, %4812, %4796 : i64
      %4814 = arith.cmpi eq, %4811, %4796 : i64
      %4815 = arith.andi %4813, %4814 : i1
      %4816 = scf.if %4815 -> (i64) {
        scf.yield %4765 : i64
      } else {
        scf.yield %4811 : i64
      }
      %4817 = func.call @cc_errorp(%4772) : (i64) -> i64
      %4818 = arith.cmpi ne, %4817, %4796 : i64
      %4819 = arith.cmpi eq, %4816, %4796 : i64
      %4820 = arith.andi %4818, %4819 : i1
      %4821 = scf.if %4820 -> (i64) {
        scf.yield %4772 : i64
      } else {
        scf.yield %4816 : i64
      }
      %4822 = func.call @cc_errorp(%4776) : (i64) -> i64
      %4823 = arith.cmpi ne, %4822, %4796 : i64
      %4824 = arith.cmpi eq, %4821, %4796 : i64
      %4825 = arith.andi %4823, %4824 : i1
      %4826 = scf.if %4825 -> (i64) {
        scf.yield %4776 : i64
      } else {
        scf.yield %4821 : i64
      }
      %4827 = func.call @cc_errorp(%4783) : (i64) -> i64
      %4828 = arith.cmpi ne, %4827, %4796 : i64
      %4829 = arith.cmpi eq, %4826, %4796 : i64
      %4830 = arith.andi %4828, %4829 : i1
      %4831 = scf.if %4830 -> (i64) {
        scf.yield %4783 : i64
      } else {
        scf.yield %4826 : i64
      }
      %4832 = func.call @cc_errorp(%4795) : (i64) -> i64
      %4833 = arith.cmpi ne, %4832, %4796 : i64
      %4834 = arith.cmpi eq, %4831, %4796 : i64
      %4835 = arith.andi %4833, %4834 : i1
      %4836 = scf.if %4835 -> (i64) {
        scf.yield %4795 : i64
      } else {
        scf.yield %4831 : i64
      }
      %4837 = arith.cmpi ne, %4836, %4796 : i64
      scf.if %4837 {
        func.call @stack_push_pointer(%4836) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3891) : (i64) -> ()
        func.call @stack_push_pointer(%4273) : (i64) -> ()
        func.call @stack_push_pointer(%4758) : (i64) -> ()
        func.call @stack_push_pointer(%4765) : (i64) -> ()
        func.call @stack_push_pointer(%4772) : (i64) -> ()
        func.call @stack_push_pointer(%4776) : (i64) -> ()
        func.call @stack_push_pointer(%4783) : (i64) -> ()
        func.call @stack_push_pointer(%4795) : (i64) -> ()
        %4838 = llvm.mlir.addressof @str473 : !llvm.ptr
        %4839 = func.call @cc_make_function_ref_const(%4838) : (!llvm.ptr) -> i64
        %4840 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4839, %4840) : (i64, i64) -> ()
      }
      %4841 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4841 : i64
    }
    %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
    %4842 = arith.addi %3882, %__rlasp_stack_elide_zero_176 : i64
    %4843 = func.call @cc_multiple_value_list(%4842) : (i64) -> i64
    %4844 = llvm.mlir.addressof @str474 : !llvm.ptr
    %4845 = arith.constant 38 : i64
    %4846 = func.call @cc_make_string(%4844, %4845) : (!llvm.ptr, i64) -> i64
    %4847 = func.call @cc_nil_value() : () -> i64
    %4848 = func.call @cc_intern(%4846, %4847) : (i64, i64) -> i64
    %4849 = func.call @cc_nil_value() : () -> i64
    %4850 = func.call @cc_cons(%4848, %4849) : (i64, i64) -> i64
    %4851 = func.call @cc_values_pack(%4850) : (i64) -> i64
    %4852 = func.call @cc_symbol_value(%4848) : (i64) -> i64
    %4853 = llvm.mlir.addressof @str475 : !llvm.ptr
    %4854 = arith.constant 40 : i64
    %4855 = func.call @cc_make_string(%4853, %4854) : (!llvm.ptr, i64) -> i64
    %4856 = func.call @cc_nil_value() : () -> i64
    %4857 = func.call @cc_intern(%4855, %4856) : (i64, i64) -> i64
    %4858 = func.call @cc_nil_value() : () -> i64
    %4859 = func.call @cc_cons(%4857, %4858) : (i64, i64) -> i64
    %4860 = func.call @cc_values_pack(%4859) : (i64) -> i64
    %4861 = func.call @cc_symbol_value(%4857) : (i64) -> i64
    %4862 = func.call @cc_nil_value() : () -> i64
    %4863 = arith.cmpi ne, %4852, %4862 : i64
    %4864 = scf.if %4863 -> (i64) {
      scf.yield %4861 : i64
    } else {
      scf.yield %4843 : i64
    }
    %4865 = func.call @cc_values_pack(%4864) : (i64) -> i64
    func.call @stack_push_pointer(%4865) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044355"() {
    %497 = func.call @stack_pop_pointer() : () -> i64
    %498 = func.call @cc_nil_value() : () -> i64
    %499 = func.call @cc_nil_value() : () -> i64
    %500 = func.call @cc_errorp(%498) : (i64) -> i64
    %501 = arith.cmpi ne, %500, %499 : i64
    %502 = scf.if %501 -> (i64) {
      scf.yield %498 : i64
    } else {
      %503 = llvm.mlir.addressof @str39 : !llvm.ptr
      %504 = arith.constant 8 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = llvm.mlir.addressof @str40 : !llvm.ptr
      %507 = arith.constant 11 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = func.call @cc_intern(%505, %508) : (i64, i64) -> i64
      %510 = func.call @cc_nil_value() : () -> i64
      %511 = func.call @cc_cons(%509, %510) : (i64, i64) -> i64
      %512 = func.call @cc_values_pack(%511) : (i64) -> i64
      %513 = func.call @cc_symbol_value(%509) : (i64) -> i64
      %514 = llvm.mlir.addressof @str41 : !llvm.ptr
      %515 = arith.constant 6 : i64
      %516 = func.call @cc_make_string(%514, %515) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%516) : (i64) -> ()
      %517 = llvm.mlir.addressof @str42 : !llvm.ptr
      %518 = arith.constant 6 : i64
      %519 = func.call @cc_make_string(%517, %518) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      %520 = llvm.mlir.addressof @str43 : !llvm.ptr
      %521 = arith.constant 9 : i64
      %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%522) : (i64) -> ()
      %523 = llvm.mlir.addressof @str44 : !llvm.ptr
      %524 = arith.constant 17 : i64
      %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%525) : (i64) -> ()
      %526 = llvm.mlir.addressof @str45 : !llvm.ptr
      %527 = arith.constant 6 : i64
      %528 = func.call @cc_make_string(%526, %527) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%528) : (i64) -> ()
      %529 = llvm.mlir.addressof @str46 : !llvm.ptr
      %530 = arith.constant 31 : i64
      %531 = func.call @cc_make_string(%529, %530) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%531) : (i64) -> ()
      %532 = llvm.mlir.addressof @str47 : !llvm.ptr
      %533 = arith.constant 6 : i64
      %534 = func.call @cc_make_string(%532, %533) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      %535 = llvm.mlir.addressof @str48 : !llvm.ptr
      %536 = arith.constant 25 : i64
      %537 = func.call @cc_make_string(%535, %536) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%537) : (i64) -> ()
      %538 = llvm.mlir.addressof @str49 : !llvm.ptr
      %539 = arith.constant 6 : i64
      %540 = func.call @cc_make_string(%538, %539) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%540) : (i64) -> ()
      %541 = llvm.mlir.addressof @str50 : !llvm.ptr
      %542 = arith.constant 60 : i64
      %543 = func.call @cc_make_string(%541, %542) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%543) : (i64) -> ()
      %544 = llvm.mlir.addressof @str51 : !llvm.ptr
      %545 = arith.constant 6 : i64
      %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      %547 = llvm.mlir.addressof @str52 : !llvm.ptr
      %548 = arith.constant 15 : i64
      %549 = func.call @cc_make_string(%547, %548) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%549) : (i64) -> ()
      %550 = llvm.mlir.addressof @str53 : !llvm.ptr
      %551 = arith.constant 6 : i64
      %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%552) : (i64) -> ()
      %553 = llvm.mlir.addressof @str54 : !llvm.ptr
      %554 = arith.constant 2 : i64
      %555 = func.call @cc_make_string(%553, %554) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%555) : (i64) -> ()
      %556 = llvm.mlir.addressof @str55 : !llvm.ptr
      %557 = arith.constant 1 : i64
      %558 = func.call @cc_make_string(%556, %557) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%558) : (i64) -> ()
      %559 = llvm.mlir.addressof @str56 : !llvm.ptr
      %560 = arith.constant 3 : i64
      %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%561) : (i64) -> ()
      %562 = llvm.mlir.addressof @str57 : !llvm.ptr
      %563 = arith.constant 3 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%564) : (i64) -> ()
      %565 = llvm.mlir.addressof @str58 : !llvm.ptr
      %566 = arith.constant 5 : i64
      %567 = func.call @cc_make_string(%565, %566) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%567) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %568 = func.call @stack_pop_pointer() : () -> i64
      %569 = func.call @stack_pop_pointer() : () -> i64
      %570 = func.call @cc_cons(%569, %568) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %571 = arith.addi %570, %__rlasp_stack_elide_zero_177 : i64
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @cc_cons(%572, %571) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %574 = arith.addi %573, %__rlasp_stack_elide_zero_178 : i64
      %575 = func.call @stack_pop_pointer() : () -> i64
      %576 = func.call @cc_cons(%575, %574) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %577 = arith.addi %576, %__rlasp_stack_elide_zero_179 : i64
      %578 = func.call @stack_pop_pointer() : () -> i64
      %579 = func.call @cc_cons(%578, %577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %580 = arith.addi %579, %__rlasp_stack_elide_zero_180 : i64
      %581 = func.call @stack_pop_pointer() : () -> i64
      %582 = func.call @cc_cons(%581, %580) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %583 = arith.addi %582, %__rlasp_stack_elide_zero_181 : i64
      %584 = func.call @stack_pop_pointer() : () -> i64
      %585 = func.call @cc_cons(%584, %583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %586 = arith.addi %585, %__rlasp_stack_elide_zero_182 : i64
      %587 = func.call @stack_pop_pointer() : () -> i64
      %588 = func.call @cc_cons(%587, %586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %589 = arith.addi %588, %__rlasp_stack_elide_zero_183 : i64
      %590 = func.call @stack_pop_pointer() : () -> i64
      %591 = func.call @cc_cons(%590, %589) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %592 = arith.addi %591, %__rlasp_stack_elide_zero_184 : i64
      %593 = func.call @stack_pop_pointer() : () -> i64
      %594 = func.call @cc_cons(%593, %592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %595 = arith.addi %594, %__rlasp_stack_elide_zero_185 : i64
      %596 = func.call @stack_pop_pointer() : () -> i64
      %597 = func.call @cc_cons(%596, %595) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %598 = arith.addi %597, %__rlasp_stack_elide_zero_186 : i64
      %599 = func.call @stack_pop_pointer() : () -> i64
      %600 = func.call @cc_cons(%599, %598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %601 = arith.addi %600, %__rlasp_stack_elide_zero_187 : i64
      %602 = func.call @stack_pop_pointer() : () -> i64
      %603 = func.call @cc_cons(%602, %601) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %604 = arith.addi %603, %__rlasp_stack_elide_zero_188 : i64
      %605 = func.call @stack_pop_pointer() : () -> i64
      %606 = func.call @cc_cons(%605, %604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %607 = arith.addi %606, %__rlasp_stack_elide_zero_189 : i64
      %608 = func.call @stack_pop_pointer() : () -> i64
      %609 = func.call @cc_cons(%608, %607) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %610 = arith.addi %609, %__rlasp_stack_elide_zero_190 : i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%611, %610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %613 = arith.addi %612, %__rlasp_stack_elide_zero_191 : i64
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_cons(%614, %613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %616 = arith.addi %615, %__rlasp_stack_elide_zero_192 : i64
      %617 = func.call @stack_pop_pointer() : () -> i64
      %618 = func.call @cc_cons(%617, %616) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %619 = arith.addi %618, %__rlasp_stack_elide_zero_193 : i64
      %620 = func.call @stack_pop_pointer() : () -> i64
      %621 = func.call @cc_cons(%620, %619) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %622 = arith.addi %621, %__rlasp_stack_elide_zero_194 : i64
      %623 = llvm.mlir.addressof @str59 : !llvm.ptr
      %624 = arith.constant 4 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      %626 = llvm.mlir.addressof @str60 : !llvm.ptr
      %627 = arith.constant 7 : i64
      %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
      %629 = func.call @cc_intern(%625, %628) : (i64, i64) -> i64
      %630 = func.call @cc_nil_value() : () -> i64
      %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
      %632 = func.call @cc_values_pack(%631) : (i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_nil_value() : () -> i64
      %635 = func.call @cc_errorp(%513) : (i64) -> i64
      %636 = arith.cmpi ne, %635, %634 : i64
      %637 = arith.cmpi eq, %634, %634 : i64
      %638 = arith.andi %636, %637 : i1
      %639 = scf.if %638 -> (i64) {
        scf.yield %513 : i64
      } else {
        scf.yield %634 : i64
      }
      %640 = func.call @cc_errorp(%622) : (i64) -> i64
      %641 = arith.cmpi ne, %640, %634 : i64
      %642 = arith.cmpi eq, %639, %634 : i64
      %643 = arith.andi %641, %642 : i1
      %644 = scf.if %643 -> (i64) {
        scf.yield %622 : i64
      } else {
        scf.yield %639 : i64
      }
      %645 = func.call @cc_errorp(%629) : (i64) -> i64
      %646 = arith.cmpi ne, %645, %634 : i64
      %647 = arith.cmpi eq, %644, %634 : i64
      %648 = arith.andi %646, %647 : i1
      %649 = scf.if %648 -> (i64) {
        scf.yield %629 : i64
      } else {
        scf.yield %644 : i64
      }
      %650 = func.call @cc_errorp(%633) : (i64) -> i64
      %651 = arith.cmpi ne, %650, %634 : i64
      %652 = arith.cmpi eq, %649, %634 : i64
      %653 = arith.andi %651, %652 : i1
      %654 = scf.if %653 -> (i64) {
        scf.yield %633 : i64
      } else {
        scf.yield %649 : i64
      }
      %655 = arith.cmpi ne, %654, %634 : i64
      scf.if %655 {
        func.call @stack_push_pointer(%654) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%513) : (i64) -> ()
        func.call @stack_push_pointer(%622) : (i64) -> ()
        func.call @stack_push_pointer(%629) : (i64) -> ()
        func.call @stack_push_pointer(%633) : (i64) -> ()
        %656 = llvm.mlir.addressof @str61 : !llvm.ptr
        %657 = func.call @cc_make_function_ref_const(%656) : (!llvm.ptr) -> i64
        %658 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%657, %658) : (i64, i64) -> ()
      }
      %659 = func.call @stack_pop_pointer() : () -> i64
      %660 = func.call @cc_multiple_value_list(%659) : (i64) -> i64
      %661 = arith.constant 0 : i64
      %662 = func.call @cc_box_fixnum(%661) : (i64) -> i64
      %663 = func.call @cc_nth(%662, %660) : (i64, i64) -> i64
      %664 = arith.constant 1 : i64
      %665 = func.call @cc_box_fixnum(%664) : (i64) -> i64
      %666 = func.call @cc_nth(%665, %660) : (i64, i64) -> i64
      %667 = arith.constant 2 : i64
      %668 = func.call @cc_box_fixnum(%667) : (i64) -> i64
      %669 = func.call @cc_nth(%668, %660) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %670 = func.call @stack_depth() : () -> i64
      %671 = arith.constant 0 : i64
      %672 = arith.cmpi sgt, %670, %671 : i64
      scf.if %672 {
        %673 = func.call @stack_pop_pointer() : () -> i64
      }
      %674 = llvm.mlir.addressof @str62 : !llvm.ptr
      %675 = func.call @cc_make_function_ref_const(%674) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %676 = arith.addi %675, %__rlasp_stack_elide_zero_195 : i64
      %677 = func.call @cc_nil_value() : () -> i64
      %678 = arith.constant 1 : i1
      %679 = arith.constant 0 : i1
      %680 = arith.constant 1 : i1
      %681:2 = scf.if %678 -> (i64, i1) {
        func.call @stack_push_nil() : () -> ()
        %682 = func.call @stack_pop_pointer() : () -> i64
        %683 = func.call @cc_multiple_value_list(%682) : (i64) -> i64
        %684 = func.call @cc_nil_value() : () -> i64
        %685 = llvm.mlir.addressof @str63 : !llvm.ptr
        %686 = arith.constant 38 : i64
        %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
        %688 = func.call @cc_nil_value() : () -> i64
        %689 = func.call @cc_intern(%687, %688) : (i64, i64) -> i64
        %690 = func.call @cc_nil_value() : () -> i64
        %691 = func.call @cc_cons(%689, %690) : (i64, i64) -> i64
        %692 = func.call @cc_values_pack(%691) : (i64) -> i64
        %693 = func.call @cc_symbol_value(%689) : (i64) -> i64
        %694 = arith.cmpi ne, %693, %684 : i64
        %695:2 = scf.if %694 -> (i64, i1) {
          %696 = func.call @cc_values_pack(%683) : (i64) -> i64
          func.call @stack_push_pointer(%696) : (i64) -> ()
          scf.yield %677, %679 : i64, i1
        } else {
          %697 = func.call @cc_append(%677, %683) : (i64, i64) -> i64
          scf.yield %697, %680 : i64, i1
        }
        scf.yield %695#0, %695#1 : i64, i1
      } else {
        scf.yield %677, %679 : i64, i1
      }
      %698:2 = scf.if %681#1 -> (i64, i1) {
        %699 = func.call @cc_t_value() : () -> i64
        %700 = func.call @cc_nil_value() : () -> i64
        %701 = func.call @cc_errorp(%669) : (i64) -> i64
        %702 = arith.cmpi ne, %701, %700 : i64
        %703 = arith.cmpi eq, %700, %700 : i64
        %704 = arith.andi %702, %703 : i1
        %705 = scf.if %704 -> (i64) {
          scf.yield %669 : i64
        } else {
          scf.yield %700 : i64
        }
        %706 = func.call @cc_errorp(%699) : (i64) -> i64
        %707 = arith.cmpi ne, %706, %700 : i64
        %708 = arith.cmpi eq, %705, %700 : i64
        %709 = arith.andi %707, %708 : i1
        %710 = scf.if %709 -> (i64) {
          scf.yield %699 : i64
        } else {
          scf.yield %705 : i64
        }
        %711 = arith.cmpi ne, %710, %700 : i64
        scf.if %711 {
          func.call @stack_push_pointer(%710) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%669) : (i64) -> ()
          func.call @stack_push_pointer(%699) : (i64) -> ()
          %712 = llvm.mlir.addressof @str64 : !llvm.ptr
          %713 = func.call @cc_make_function_ref_const(%712) : (!llvm.ptr) -> i64
          %714 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%713, %714) : (i64, i64) -> ()
        }
        %715 = func.call @stack_pop_pointer() : () -> i64
        %716 = func.call @cc_multiple_value_list(%715) : (i64) -> i64
        %717 = func.call @cc_nil_value() : () -> i64
        %718 = llvm.mlir.addressof @str65 : !llvm.ptr
        %719 = arith.constant 38 : i64
        %720 = func.call @cc_make_string(%718, %719) : (!llvm.ptr, i64) -> i64
        %721 = func.call @cc_nil_value() : () -> i64
        %722 = func.call @cc_intern(%720, %721) : (i64, i64) -> i64
        %723 = func.call @cc_nil_value() : () -> i64
        %724 = func.call @cc_cons(%722, %723) : (i64, i64) -> i64
        %725 = func.call @cc_values_pack(%724) : (i64) -> i64
        %726 = func.call @cc_symbol_value(%722) : (i64) -> i64
        %727 = arith.cmpi ne, %726, %717 : i64
        %728:2 = scf.if %727 -> (i64, i1) {
          %729 = func.call @cc_values_pack(%716) : (i64) -> i64
          func.call @stack_push_pointer(%729) : (i64) -> ()
          scf.yield %681#0, %679 : i64, i1
        } else {
          %730 = func.call @cc_append(%681#0, %716) : (i64, i64) -> i64
          scf.yield %730, %680 : i64, i1
        }
        scf.yield %728#0, %728#1 : i64, i1
      } else {
        scf.yield %681#0, %679 : i64, i1
      }
      scf.if %698#1 {
        %731 = func.call @cc_apply(%676, %698#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%731) : (i64) -> ()
      } else {
      }
      %732 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %732 : i64
    }
    func.call @stack_push_pointer(%502) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044357"() {
    %1056 = func.call @stack_pop_pointer() : () -> i64
    %1057 = func.call @stack_pop_pointer() : () -> i64
    %1058 = func.call @cc_nil_value() : () -> i64
    %1059 = func.call @cc_nil_value() : () -> i64
    %1060 = func.call @cc_errorp(%1058) : (i64) -> i64
    %1061 = arith.cmpi ne, %1060, %1059 : i64
    %1062 = scf.if %1061 -> (i64) {
      scf.yield %1058 : i64
    } else {
      %1063 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1064 = arith.constant 8 : i64
      %1065 = func.call @cc_make_string(%1063, %1064) : (!llvm.ptr, i64) -> i64
      %1066 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1067 = arith.constant 11 : i64
      %1068 = func.call @cc_make_string(%1066, %1067) : (!llvm.ptr, i64) -> i64
      %1069 = func.call @cc_intern(%1065, %1068) : (i64, i64) -> i64
      %1070 = func.call @cc_nil_value() : () -> i64
      %1071 = func.call @cc_cons(%1069, %1070) : (i64, i64) -> i64
      %1072 = func.call @cc_values_pack(%1071) : (i64) -> i64
      %1073 = func.call @cc_symbol_value(%1069) : (i64) -> i64
      %1074 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1075 = arith.constant 6 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1076) : (i64) -> ()
      %1077 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1078 = arith.constant 6 : i64
      %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      %1080 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1081 = arith.constant 9 : i64
      %1082 = func.call @cc_make_string(%1080, %1081) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1082) : (i64) -> ()
      %1083 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1084 = arith.constant 17 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1085) : (i64) -> ()
      %1086 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1087 = arith.constant 6 : i64
      %1088 = func.call @cc_make_string(%1086, %1087) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1088) : (i64) -> ()
      %1089 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1090 = arith.constant 31 : i64
      %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1091) : (i64) -> ()
      %1092 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1093 = arith.constant 6 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1094) : (i64) -> ()
      %1095 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1096 = arith.constant 25 : i64
      %1097 = func.call @cc_make_string(%1095, %1096) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1097) : (i64) -> ()
      %1098 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1099 = arith.constant 6 : i64
      %1100 = func.call @cc_make_string(%1098, %1099) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1100) : (i64) -> ()
      %1101 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1102 = arith.constant 60 : i64
      %1103 = func.call @cc_make_string(%1101, %1102) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1103) : (i64) -> ()
      %1104 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1105 = arith.constant 6 : i64
      %1106 = func.call @cc_make_string(%1104, %1105) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1106) : (i64) -> ()
      %1107 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1108 = arith.constant 12 : i64
      %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1109) : (i64) -> ()
      %1110 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1111 = arith.constant 6 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1112) : (i64) -> ()
      %1113 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1114 = arith.constant 2 : i64
      %1115 = func.call @cc_make_string(%1113, %1114) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1115) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @stack_pop_pointer() : () -> i64
      %1118 = func.call @cc_cons(%1117, %1116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %1119 = arith.addi %1118, %__rlasp_stack_elide_zero_196 : i64
      %1120 = func.call @stack_pop_pointer() : () -> i64
      %1121 = func.call @cc_cons(%1120, %1119) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %1122 = arith.addi %1121, %__rlasp_stack_elide_zero_197 : i64
      %1123 = func.call @stack_pop_pointer() : () -> i64
      %1124 = func.call @cc_cons(%1123, %1122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %1125 = arith.addi %1124, %__rlasp_stack_elide_zero_198 : i64
      %1126 = func.call @stack_pop_pointer() : () -> i64
      %1127 = func.call @cc_cons(%1126, %1125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %1128 = arith.addi %1127, %__rlasp_stack_elide_zero_199 : i64
      %1129 = func.call @stack_pop_pointer() : () -> i64
      %1130 = func.call @cc_cons(%1129, %1128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %1131 = arith.addi %1130, %__rlasp_stack_elide_zero_200 : i64
      %1132 = func.call @stack_pop_pointer() : () -> i64
      %1133 = func.call @cc_cons(%1132, %1131) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %1134 = arith.addi %1133, %__rlasp_stack_elide_zero_201 : i64
      %1135 = func.call @stack_pop_pointer() : () -> i64
      %1136 = func.call @cc_cons(%1135, %1134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %1137 = arith.addi %1136, %__rlasp_stack_elide_zero_202 : i64
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @cc_cons(%1138, %1137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %1140 = arith.addi %1139, %__rlasp_stack_elide_zero_203 : i64
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @cc_cons(%1141, %1140) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %1143 = arith.addi %1142, %__rlasp_stack_elide_zero_204 : i64
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @cc_cons(%1144, %1143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %1146 = arith.addi %1145, %__rlasp_stack_elide_zero_205 : i64
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @cc_cons(%1147, %1146) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %1149 = arith.addi %1148, %__rlasp_stack_elide_zero_206 : i64
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @cc_cons(%1150, %1149) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %1152 = arith.addi %1151, %__rlasp_stack_elide_zero_207 : i64
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @cc_cons(%1153, %1152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %1155 = arith.addi %1154, %__rlasp_stack_elide_zero_208 : i64
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @cc_cons(%1156, %1155) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %1158 = arith.addi %1157, %__rlasp_stack_elide_zero_209 : i64
      %1159 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1160 = arith.constant 6 : i64
      %1161 = func.call @cc_make_string(%1159, %1160) : (!llvm.ptr, i64) -> i64
      %1162 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1163 = arith.constant 7 : i64
      %1164 = func.call @cc_make_string(%1162, %1163) : (!llvm.ptr, i64) -> i64
      %1165 = func.call @cc_intern(%1161, %1164) : (i64, i64) -> i64
      %1166 = func.call @cc_nil_value() : () -> i64
      %1167 = func.call @cc_cons(%1165, %1166) : (i64, i64) -> i64
      %1168 = func.call @cc_values_pack(%1167) : (i64) -> i64
      %1169 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1170 = arith.constant 6 : i64
      %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
      %1172 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1173 = arith.constant 7 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = func.call @cc_intern(%1171, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_cons(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_values_pack(%1177) : (i64) -> i64
      %1179 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1180 = arith.constant 5 : i64
      %1181 = func.call @cc_make_string(%1179, %1180) : (!llvm.ptr, i64) -> i64
      %1182 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1183 = arith.constant 7 : i64
      %1184 = func.call @cc_make_string(%1182, %1183) : (!llvm.ptr, i64) -> i64
      %1185 = func.call @cc_intern(%1181, %1184) : (i64, i64) -> i64
      %1186 = func.call @cc_nil_value() : () -> i64
      %1187 = func.call @cc_cons(%1185, %1186) : (i64, i64) -> i64
      %1188 = func.call @cc_values_pack(%1187) : (i64) -> i64
      %1189 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1190 = arith.constant 6 : i64
      %1191 = func.call @cc_make_string(%1189, %1190) : (!llvm.ptr, i64) -> i64
      %1192 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1193 = arith.constant 7 : i64
      %1194 = func.call @cc_make_string(%1192, %1193) : (!llvm.ptr, i64) -> i64
      %1195 = func.call @cc_intern(%1191, %1194) : (i64, i64) -> i64
      %1196 = func.call @cc_nil_value() : () -> i64
      %1197 = func.call @cc_cons(%1195, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_values_pack(%1197) : (i64) -> i64
      %1199 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1200 = arith.constant 4 : i64
      %1201 = func.call @cc_make_string(%1199, %1200) : (!llvm.ptr, i64) -> i64
      %1202 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1203 = arith.constant 7 : i64
      %1204 = func.call @cc_make_string(%1202, %1203) : (!llvm.ptr, i64) -> i64
      %1205 = func.call @cc_intern(%1201, %1204) : (i64, i64) -> i64
      %1206 = func.call @cc_nil_value() : () -> i64
      %1207 = func.call @cc_cons(%1205, %1206) : (i64, i64) -> i64
      %1208 = func.call @cc_values_pack(%1207) : (i64) -> i64
      %1209 = func.call @cc_nil_value() : () -> i64
      %1210 = func.call @cc_nil_value() : () -> i64
      %1211 = func.call @cc_errorp(%1073) : (i64) -> i64
      %1212 = arith.cmpi ne, %1211, %1210 : i64
      %1213 = arith.cmpi eq, %1210, %1210 : i64
      %1214 = arith.andi %1212, %1213 : i1
      %1215 = scf.if %1214 -> (i64) {
        scf.yield %1073 : i64
      } else {
        scf.yield %1210 : i64
      }
      %1216 = func.call @cc_errorp(%1158) : (i64) -> i64
      %1217 = arith.cmpi ne, %1216, %1210 : i64
      %1218 = arith.cmpi eq, %1215, %1210 : i64
      %1219 = arith.andi %1217, %1218 : i1
      %1220 = scf.if %1219 -> (i64) {
        scf.yield %1158 : i64
      } else {
        scf.yield %1215 : i64
      }
      %1221 = func.call @cc_errorp(%1165) : (i64) -> i64
      %1222 = arith.cmpi ne, %1221, %1210 : i64
      %1223 = arith.cmpi eq, %1220, %1210 : i64
      %1224 = arith.andi %1222, %1223 : i1
      %1225 = scf.if %1224 -> (i64) {
        scf.yield %1165 : i64
      } else {
        scf.yield %1220 : i64
      }
      %1226 = func.call @cc_errorp(%1175) : (i64) -> i64
      %1227 = arith.cmpi ne, %1226, %1210 : i64
      %1228 = arith.cmpi eq, %1225, %1210 : i64
      %1229 = arith.andi %1227, %1228 : i1
      %1230 = scf.if %1229 -> (i64) {
        scf.yield %1175 : i64
      } else {
        scf.yield %1225 : i64
      }
      %1231 = func.call @cc_errorp(%1185) : (i64) -> i64
      %1232 = arith.cmpi ne, %1231, %1210 : i64
      %1233 = arith.cmpi eq, %1230, %1210 : i64
      %1234 = arith.andi %1232, %1233 : i1
      %1235 = scf.if %1234 -> (i64) {
        scf.yield %1185 : i64
      } else {
        scf.yield %1230 : i64
      }
      %1236 = func.call @cc_errorp(%1195) : (i64) -> i64
      %1237 = arith.cmpi ne, %1236, %1210 : i64
      %1238 = arith.cmpi eq, %1235, %1210 : i64
      %1239 = arith.andi %1237, %1238 : i1
      %1240 = scf.if %1239 -> (i64) {
        scf.yield %1195 : i64
      } else {
        scf.yield %1235 : i64
      }
      %1241 = func.call @cc_errorp(%1205) : (i64) -> i64
      %1242 = arith.cmpi ne, %1241, %1210 : i64
      %1243 = arith.cmpi eq, %1240, %1210 : i64
      %1244 = arith.andi %1242, %1243 : i1
      %1245 = scf.if %1244 -> (i64) {
        scf.yield %1205 : i64
      } else {
        scf.yield %1240 : i64
      }
      %1246 = func.call @cc_errorp(%1209) : (i64) -> i64
      %1247 = arith.cmpi ne, %1246, %1210 : i64
      %1248 = arith.cmpi eq, %1245, %1210 : i64
      %1249 = arith.andi %1247, %1248 : i1
      %1250 = scf.if %1249 -> (i64) {
        scf.yield %1209 : i64
      } else {
        scf.yield %1245 : i64
      }
      %1251 = arith.cmpi ne, %1250, %1210 : i64
      scf.if %1251 {
        func.call @stack_push_pointer(%1250) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1073) : (i64) -> ()
        func.call @stack_push_pointer(%1158) : (i64) -> ()
        func.call @stack_push_pointer(%1165) : (i64) -> ()
        func.call @stack_push_pointer(%1175) : (i64) -> ()
        func.call @stack_push_pointer(%1185) : (i64) -> ()
        func.call @stack_push_pointer(%1195) : (i64) -> ()
        func.call @stack_push_pointer(%1205) : (i64) -> ()
        func.call @stack_push_pointer(%1209) : (i64) -> ()
        %1252 = llvm.mlir.addressof @str123 : !llvm.ptr
        %1253 = func.call @cc_make_function_ref_const(%1252) : (!llvm.ptr) -> i64
        %1254 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1253, %1254) : (i64, i64) -> ()
      }
      %1255 = func.call @stack_pop_pointer() : () -> i64
      %1256 = func.call @cc_multiple_value_list(%1255) : (i64) -> i64
      %1257 = arith.constant 0 : i64
      %1258 = func.call @cc_box_fixnum(%1257) : (i64) -> i64
      %1259 = func.call @cc_nth(%1258, %1256) : (i64, i64) -> i64
      %1260 = arith.constant 1 : i64
      %1261 = func.call @cc_box_fixnum(%1260) : (i64) -> i64
      %1262 = func.call @cc_nth(%1261, %1256) : (i64, i64) -> i64
      %1263 = arith.constant 2 : i64
      %1264 = func.call @cc_box_fixnum(%1263) : (i64) -> i64
      %1265 = func.call @cc_nth(%1264, %1256) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %1266 = func.call @stack_depth() : () -> i64
      %1267 = arith.constant 0 : i64
      %1268 = arith.cmpi sgt, %1266, %1267 : i64
      scf.if %1268 {
        %1269 = func.call @stack_pop_pointer() : () -> i64
      }
      %1270 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1271 = func.call @cc_make_function_ref_const(%1270) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %1272 = arith.addi %1271, %__rlasp_stack_elide_zero_210 : i64
      %1273 = func.call @cc_nil_value() : () -> i64
      %1274 = arith.constant 1 : i1
      %1275 = arith.constant 0 : i1
      %1276 = arith.constant 1 : i1
      %1277:2 = scf.if %1274 -> (i64, i1) {
        %1278 = func.call @cc_nil_value() : () -> i64
        %1279 = func.call @cc_nil_value() : () -> i64
        %1280 = func.call @cc_errorp(%1278) : (i64) -> i64
        %1281 = arith.cmpi ne, %1280, %1279 : i64
        %1282 = scf.if %1281 -> (i64) {
          scf.yield %1278 : i64
        } else {
          %1283 = func.call @cc_nil_value() : () -> i64
          %1284 = func.call @cc_errorp(%1265) : (i64) -> i64
          %1285 = arith.cmpi ne, %1284, %1283 : i64
          %1286 = arith.cmpi eq, %1283, %1283 : i64
          %1287 = arith.andi %1285, %1286 : i1
          %1288 = scf.if %1287 -> (i64) {
            scf.yield %1265 : i64
          } else {
            scf.yield %1283 : i64
          }
          %1289 = arith.cmpi ne, %1288, %1283 : i64
          scf.if %1289 {
            func.call @stack_push_pointer(%1288) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1265) : (i64) -> ()
            %1290 = llvm.mlir.addressof @str125 : !llvm.ptr
            %1291 = func.call @cc_make_function_ref_const(%1290) : (!llvm.ptr) -> i64
            %1292 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1291, %1292) : (i64, i64) -> ()
          }
          %1293 = func.call @stack_pop_pointer() : () -> i64
          %1294 = func.call @cc_nil_value() : () -> i64
          %1295 = func.call @cc_nil_value() : () -> i64
          %1296 = func.call @cc_errorp(%1294) : (i64) -> i64
          %1297 = arith.cmpi ne, %1296, %1295 : i64
          %1298 = scf.if %1297 -> (i64) {
            scf.yield %1294 : i64
          } else {
            %1299 = func.call @cc_nil_value() : () -> i64
            %1300 = func.call @cc_errorp(%1259) : (i64) -> i64
            %1301 = arith.cmpi ne, %1300, %1299 : i64
            %1302 = arith.cmpi eq, %1299, %1299 : i64
            %1303 = arith.andi %1301, %1302 : i1
            %1304 = scf.if %1303 -> (i64) {
              scf.yield %1259 : i64
            } else {
              scf.yield %1299 : i64
            }
            %1305 = arith.cmpi ne, %1304, %1299 : i64
            scf.if %1305 {
              func.call @stack_push_pointer(%1304) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1259) : (i64) -> ()
              %1306 = llvm.mlir.addressof @str126 : !llvm.ptr
              %1307 = func.call @cc_make_function_ref_const(%1306) : (!llvm.ptr) -> i64
              %1308 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1307, %1308) : (i64, i64) -> ()
            }
            %1309 = func.call @stack_pop_pointer() : () -> i64
            %1310 = func.call @cc_nil_value() : () -> i64
            %1311 = func.call @cc_errorp(%1293) : (i64) -> i64
            %1312 = arith.cmpi ne, %1311, %1310 : i64
            %1313 = arith.cmpi eq, %1310, %1310 : i64
            %1314 = arith.andi %1312, %1313 : i1
            %1315 = scf.if %1314 -> (i64) {
              scf.yield %1293 : i64
            } else {
              scf.yield %1310 : i64
            }
            %1316 = arith.cmpi ne, %1315, %1310 : i64
            scf.if %1316 {
              func.call @stack_push_pointer(%1315) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1293) : (i64) -> ()
              %1317 = llvm.mlir.addressof @str127 : !llvm.ptr
              %1318 = func.call @cc_make_function_ref_const(%1317) : (!llvm.ptr) -> i64
              %1319 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1318, %1319) : (i64, i64) -> ()
            }
            %1320 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1321 = func.call @stack_pop_pointer() : () -> i64
            %1322 = func.call @cc_cons(%1320, %1321) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
            %1323 = arith.addi %1322, %__rlasp_stack_elide_zero_211 : i64
            %1324 = func.call @cc_cons(%1309, %1323) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
            %1325 = arith.addi %1324, %__rlasp_stack_elide_zero_212 : i64
            %1326 = func.call @cc_values_pack(%1325) : (i64) -> i64
            %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
            %1327 = arith.addi %1326, %__rlasp_stack_elide_zero_213 : i64
            scf.yield %1327 : i64
          }
          %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
          %1328 = arith.addi %1298, %__rlasp_stack_elide_zero_214 : i64
          scf.yield %1328 : i64
        }
        %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
        %1329 = arith.addi %1282, %__rlasp_stack_elide_zero_215 : i64
        %1330 = func.call @cc_multiple_value_list(%1329) : (i64) -> i64
        %1331 = func.call @cc_nil_value() : () -> i64
        %1332 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1333 = arith.constant 38 : i64
        %1334 = func.call @cc_make_string(%1332, %1333) : (!llvm.ptr, i64) -> i64
        %1335 = func.call @cc_nil_value() : () -> i64
        %1336 = func.call @cc_intern(%1334, %1335) : (i64, i64) -> i64
        %1337 = func.call @cc_nil_value() : () -> i64
        %1338 = func.call @cc_cons(%1336, %1337) : (i64, i64) -> i64
        %1339 = func.call @cc_values_pack(%1338) : (i64) -> i64
        %1340 = func.call @cc_symbol_value(%1336) : (i64) -> i64
        %1341 = arith.cmpi ne, %1340, %1331 : i64
        %1342:2 = scf.if %1341 -> (i64, i1) {
          %1343 = func.call @cc_values_pack(%1330) : (i64) -> i64
          func.call @stack_push_pointer(%1343) : (i64) -> ()
          scf.yield %1273, %1275 : i64, i1
        } else {
          %1344 = func.call @cc_append(%1273, %1330) : (i64, i64) -> i64
          scf.yield %1344, %1276 : i64, i1
        }
        scf.yield %1342#0, %1342#1 : i64, i1
      } else {
        scf.yield %1273, %1275 : i64, i1
      }
      %1345:2 = scf.if %1277#1 -> (i64, i1) {
        %1346 = func.call @cc_t_value() : () -> i64
        %1347 = func.call @cc_nil_value() : () -> i64
        %1348 = func.call @cc_errorp(%1265) : (i64) -> i64
        %1349 = arith.cmpi ne, %1348, %1347 : i64
        %1350 = arith.cmpi eq, %1347, %1347 : i64
        %1351 = arith.andi %1349, %1350 : i1
        %1352 = scf.if %1351 -> (i64) {
          scf.yield %1265 : i64
        } else {
          scf.yield %1347 : i64
        }
        %1353 = func.call @cc_errorp(%1346) : (i64) -> i64
        %1354 = arith.cmpi ne, %1353, %1347 : i64
        %1355 = arith.cmpi eq, %1352, %1347 : i64
        %1356 = arith.andi %1354, %1355 : i1
        %1357 = scf.if %1356 -> (i64) {
          scf.yield %1346 : i64
        } else {
          scf.yield %1352 : i64
        }
        %1358 = arith.cmpi ne, %1357, %1347 : i64
        scf.if %1358 {
          func.call @stack_push_pointer(%1357) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1265) : (i64) -> ()
          func.call @stack_push_pointer(%1346) : (i64) -> ()
          %1359 = llvm.mlir.addressof @str129 : !llvm.ptr
          %1360 = func.call @cc_make_function_ref_const(%1359) : (!llvm.ptr) -> i64
          %1361 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1360, %1361) : (i64, i64) -> ()
        }
        %1362 = func.call @stack_pop_pointer() : () -> i64
        %1363 = func.call @cc_multiple_value_list(%1362) : (i64) -> i64
        %1364 = func.call @cc_nil_value() : () -> i64
        %1365 = llvm.mlir.addressof @str130 : !llvm.ptr
        %1366 = arith.constant 38 : i64
        %1367 = func.call @cc_make_string(%1365, %1366) : (!llvm.ptr, i64) -> i64
        %1368 = func.call @cc_nil_value() : () -> i64
        %1369 = func.call @cc_intern(%1367, %1368) : (i64, i64) -> i64
        %1370 = func.call @cc_nil_value() : () -> i64
        %1371 = func.call @cc_cons(%1369, %1370) : (i64, i64) -> i64
        %1372 = func.call @cc_values_pack(%1371) : (i64) -> i64
        %1373 = func.call @cc_symbol_value(%1369) : (i64) -> i64
        %1374 = arith.cmpi ne, %1373, %1364 : i64
        %1375:2 = scf.if %1374 -> (i64, i1) {
          %1376 = func.call @cc_values_pack(%1363) : (i64) -> i64
          func.call @stack_push_pointer(%1376) : (i64) -> ()
          scf.yield %1277#0, %1275 : i64, i1
        } else {
          %1377 = func.call @cc_append(%1277#0, %1363) : (i64, i64) -> i64
          scf.yield %1377, %1276 : i64, i1
        }
        scf.yield %1375#0, %1375#1 : i64, i1
      } else {
        scf.yield %1277#0, %1275 : i64, i1
      }
      scf.if %1345#1 {
        %1378 = func.call @cc_apply(%1272, %1345#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1378) : (i64) -> ()
      } else {
      }
      %1379 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1379 : i64
    }
    func.call @stack_push_pointer(%1062) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044360"() {
    %1716 = func.call @stack_pop_pointer() : () -> i64
    %1717 = func.call @stack_pop_pointer() : () -> i64
    %1718 = func.call @cc_nil_value() : () -> i64
    %1719 = func.call @cc_nil_value() : () -> i64
    %1720 = func.call @cc_errorp(%1718) : (i64) -> i64
    %1721 = arith.cmpi ne, %1720, %1719 : i64
    %1722 = scf.if %1721 -> (i64) {
      scf.yield %1718 : i64
    } else {
      %1723 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1724 = arith.constant 8 : i64
      %1725 = func.call @cc_make_string(%1723, %1724) : (!llvm.ptr, i64) -> i64
      %1726 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1727 = arith.constant 11 : i64
      %1728 = func.call @cc_make_string(%1726, %1727) : (!llvm.ptr, i64) -> i64
      %1729 = func.call @cc_intern(%1725, %1728) : (i64, i64) -> i64
      %1730 = func.call @cc_nil_value() : () -> i64
      %1731 = func.call @cc_cons(%1729, %1730) : (i64, i64) -> i64
      %1732 = func.call @cc_values_pack(%1731) : (i64) -> i64
      %1733 = func.call @cc_symbol_value(%1729) : (i64) -> i64
      %1734 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1735 = arith.constant 6 : i64
      %1736 = func.call @cc_make_string(%1734, %1735) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1736) : (i64) -> ()
      %1737 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1738 = arith.constant 6 : i64
      %1739 = func.call @cc_make_string(%1737, %1738) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1739) : (i64) -> ()
      %1740 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1741 = arith.constant 9 : i64
      %1742 = func.call @cc_make_string(%1740, %1741) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1742) : (i64) -> ()
      %1743 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1744 = arith.constant 17 : i64
      %1745 = func.call @cc_make_string(%1743, %1744) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1745) : (i64) -> ()
      %1746 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1747 = arith.constant 6 : i64
      %1748 = func.call @cc_make_string(%1746, %1747) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1748) : (i64) -> ()
      %1749 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1750 = arith.constant 31 : i64
      %1751 = func.call @cc_make_string(%1749, %1750) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1751) : (i64) -> ()
      %1752 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1753 = arith.constant 6 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1754) : (i64) -> ()
      %1755 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1756 = arith.constant 25 : i64
      %1757 = func.call @cc_make_string(%1755, %1756) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1757) : (i64) -> ()
      %1758 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1759 = arith.constant 6 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1760) : (i64) -> ()
      %1761 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1762 = arith.constant 60 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1763) : (i64) -> ()
      %1764 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1765 = arith.constant 6 : i64
      %1766 = func.call @cc_make_string(%1764, %1765) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1766) : (i64) -> ()
      %1767 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1768 = arith.constant 12 : i64
      %1769 = func.call @cc_make_string(%1767, %1768) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1769) : (i64) -> ()
      %1770 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1771 = arith.constant 6 : i64
      %1772 = func.call @cc_make_string(%1770, %1771) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1772) : (i64) -> ()
      %1773 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1774 = arith.constant 2 : i64
      %1775 = func.call @cc_make_string(%1773, %1774) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1775) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1776 = func.call @stack_pop_pointer() : () -> i64
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = func.call @cc_cons(%1777, %1776) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %1779 = arith.addi %1778, %__rlasp_stack_elide_zero_216 : i64
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @cc_cons(%1780, %1779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %1782 = arith.addi %1781, %__rlasp_stack_elide_zero_217 : i64
      %1783 = func.call @stack_pop_pointer() : () -> i64
      %1784 = func.call @cc_cons(%1783, %1782) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %1785 = arith.addi %1784, %__rlasp_stack_elide_zero_218 : i64
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = func.call @cc_cons(%1786, %1785) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %1788 = arith.addi %1787, %__rlasp_stack_elide_zero_219 : i64
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @cc_cons(%1789, %1788) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %1791 = arith.addi %1790, %__rlasp_stack_elide_zero_220 : i64
      %1792 = func.call @stack_pop_pointer() : () -> i64
      %1793 = func.call @cc_cons(%1792, %1791) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %1794 = arith.addi %1793, %__rlasp_stack_elide_zero_221 : i64
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @cc_cons(%1795, %1794) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %1797 = arith.addi %1796, %__rlasp_stack_elide_zero_222 : i64
      %1798 = func.call @stack_pop_pointer() : () -> i64
      %1799 = func.call @cc_cons(%1798, %1797) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %1800 = arith.addi %1799, %__rlasp_stack_elide_zero_223 : i64
      %1801 = func.call @stack_pop_pointer() : () -> i64
      %1802 = func.call @cc_cons(%1801, %1800) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %1803 = arith.addi %1802, %__rlasp_stack_elide_zero_224 : i64
      %1804 = func.call @stack_pop_pointer() : () -> i64
      %1805 = func.call @cc_cons(%1804, %1803) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %1806 = arith.addi %1805, %__rlasp_stack_elide_zero_225 : i64
      %1807 = func.call @stack_pop_pointer() : () -> i64
      %1808 = func.call @cc_cons(%1807, %1806) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %1809 = arith.addi %1808, %__rlasp_stack_elide_zero_226 : i64
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = func.call @cc_cons(%1810, %1809) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %1812 = arith.addi %1811, %__rlasp_stack_elide_zero_227 : i64
      %1813 = func.call @stack_pop_pointer() : () -> i64
      %1814 = func.call @cc_cons(%1813, %1812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %1815 = arith.addi %1814, %__rlasp_stack_elide_zero_228 : i64
      %1816 = func.call @stack_pop_pointer() : () -> i64
      %1817 = func.call @cc_cons(%1816, %1815) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %1818 = arith.addi %1817, %__rlasp_stack_elide_zero_229 : i64
      %1819 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1820 = arith.constant 6 : i64
      %1821 = func.call @cc_make_string(%1819, %1820) : (!llvm.ptr, i64) -> i64
      %1822 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1823 = arith.constant 7 : i64
      %1824 = func.call @cc_make_string(%1822, %1823) : (!llvm.ptr, i64) -> i64
      %1825 = func.call @cc_intern(%1821, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_nil_value() : () -> i64
      %1827 = func.call @cc_cons(%1825, %1826) : (i64, i64) -> i64
      %1828 = func.call @cc_values_pack(%1827) : (i64) -> i64
      %1829 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1830 = arith.constant 6 : i64
      %1831 = func.call @cc_make_string(%1829, %1830) : (!llvm.ptr, i64) -> i64
      %1832 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1833 = arith.constant 7 : i64
      %1834 = func.call @cc_make_string(%1832, %1833) : (!llvm.ptr, i64) -> i64
      %1835 = func.call @cc_intern(%1831, %1834) : (i64, i64) -> i64
      %1836 = func.call @cc_nil_value() : () -> i64
      %1837 = func.call @cc_cons(%1835, %1836) : (i64, i64) -> i64
      %1838 = func.call @cc_values_pack(%1837) : (i64) -> i64
      %1839 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1840 = arith.constant 5 : i64
      %1841 = func.call @cc_make_string(%1839, %1840) : (!llvm.ptr, i64) -> i64
      %1842 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1843 = arith.constant 7 : i64
      %1844 = func.call @cc_make_string(%1842, %1843) : (!llvm.ptr, i64) -> i64
      %1845 = func.call @cc_intern(%1841, %1844) : (i64, i64) -> i64
      %1846 = func.call @cc_nil_value() : () -> i64
      %1847 = func.call @cc_cons(%1845, %1846) : (i64, i64) -> i64
      %1848 = func.call @cc_values_pack(%1847) : (i64) -> i64
      %1849 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1850 = arith.constant 6 : i64
      %1851 = func.call @cc_make_string(%1849, %1850) : (!llvm.ptr, i64) -> i64
      %1852 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1853 = arith.constant 7 : i64
      %1854 = func.call @cc_make_string(%1852, %1853) : (!llvm.ptr, i64) -> i64
      %1855 = func.call @cc_intern(%1851, %1854) : (i64, i64) -> i64
      %1856 = func.call @cc_nil_value() : () -> i64
      %1857 = func.call @cc_cons(%1855, %1856) : (i64, i64) -> i64
      %1858 = func.call @cc_values_pack(%1857) : (i64) -> i64
      %1859 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1860 = arith.constant 4 : i64
      %1861 = func.call @cc_make_string(%1859, %1860) : (!llvm.ptr, i64) -> i64
      %1862 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1863 = arith.constant 7 : i64
      %1864 = func.call @cc_make_string(%1862, %1863) : (!llvm.ptr, i64) -> i64
      %1865 = func.call @cc_intern(%1861, %1864) : (i64, i64) -> i64
      %1866 = func.call @cc_nil_value() : () -> i64
      %1867 = func.call @cc_cons(%1865, %1866) : (i64, i64) -> i64
      %1868 = func.call @cc_values_pack(%1867) : (i64) -> i64
      %1869 = func.call @cc_nil_value() : () -> i64
      %1870 = func.call @cc_nil_value() : () -> i64
      %1871 = func.call @cc_errorp(%1733) : (i64) -> i64
      %1872 = arith.cmpi ne, %1871, %1870 : i64
      %1873 = arith.cmpi eq, %1870, %1870 : i64
      %1874 = arith.andi %1872, %1873 : i1
      %1875 = scf.if %1874 -> (i64) {
        scf.yield %1733 : i64
      } else {
        scf.yield %1870 : i64
      }
      %1876 = func.call @cc_errorp(%1818) : (i64) -> i64
      %1877 = arith.cmpi ne, %1876, %1870 : i64
      %1878 = arith.cmpi eq, %1875, %1870 : i64
      %1879 = arith.andi %1877, %1878 : i1
      %1880 = scf.if %1879 -> (i64) {
        scf.yield %1818 : i64
      } else {
        scf.yield %1875 : i64
      }
      %1881 = func.call @cc_errorp(%1825) : (i64) -> i64
      %1882 = arith.cmpi ne, %1881, %1870 : i64
      %1883 = arith.cmpi eq, %1880, %1870 : i64
      %1884 = arith.andi %1882, %1883 : i1
      %1885 = scf.if %1884 -> (i64) {
        scf.yield %1825 : i64
      } else {
        scf.yield %1880 : i64
      }
      %1886 = func.call @cc_errorp(%1835) : (i64) -> i64
      %1887 = arith.cmpi ne, %1886, %1870 : i64
      %1888 = arith.cmpi eq, %1885, %1870 : i64
      %1889 = arith.andi %1887, %1888 : i1
      %1890 = scf.if %1889 -> (i64) {
        scf.yield %1835 : i64
      } else {
        scf.yield %1885 : i64
      }
      %1891 = func.call @cc_errorp(%1845) : (i64) -> i64
      %1892 = arith.cmpi ne, %1891, %1870 : i64
      %1893 = arith.cmpi eq, %1890, %1870 : i64
      %1894 = arith.andi %1892, %1893 : i1
      %1895 = scf.if %1894 -> (i64) {
        scf.yield %1845 : i64
      } else {
        scf.yield %1890 : i64
      }
      %1896 = func.call @cc_errorp(%1855) : (i64) -> i64
      %1897 = arith.cmpi ne, %1896, %1870 : i64
      %1898 = arith.cmpi eq, %1895, %1870 : i64
      %1899 = arith.andi %1897, %1898 : i1
      %1900 = scf.if %1899 -> (i64) {
        scf.yield %1855 : i64
      } else {
        scf.yield %1895 : i64
      }
      %1901 = func.call @cc_errorp(%1865) : (i64) -> i64
      %1902 = arith.cmpi ne, %1901, %1870 : i64
      %1903 = arith.cmpi eq, %1900, %1870 : i64
      %1904 = arith.andi %1902, %1903 : i1
      %1905 = scf.if %1904 -> (i64) {
        scf.yield %1865 : i64
      } else {
        scf.yield %1900 : i64
      }
      %1906 = func.call @cc_errorp(%1869) : (i64) -> i64
      %1907 = arith.cmpi ne, %1906, %1870 : i64
      %1908 = arith.cmpi eq, %1905, %1870 : i64
      %1909 = arith.andi %1907, %1908 : i1
      %1910 = scf.if %1909 -> (i64) {
        scf.yield %1869 : i64
      } else {
        scf.yield %1905 : i64
      }
      %1911 = arith.cmpi ne, %1910, %1870 : i64
      scf.if %1911 {
        func.call @stack_push_pointer(%1910) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1733) : (i64) -> ()
        func.call @stack_push_pointer(%1818) : (i64) -> ()
        func.call @stack_push_pointer(%1825) : (i64) -> ()
        func.call @stack_push_pointer(%1835) : (i64) -> ()
        func.call @stack_push_pointer(%1845) : (i64) -> ()
        func.call @stack_push_pointer(%1855) : (i64) -> ()
        func.call @stack_push_pointer(%1865) : (i64) -> ()
        func.call @stack_push_pointer(%1869) : (i64) -> ()
        %1912 = llvm.mlir.addressof @str191 : !llvm.ptr
        %1913 = func.call @cc_make_function_ref_const(%1912) : (!llvm.ptr) -> i64
        %1914 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1913, %1914) : (i64, i64) -> ()
      }
      %1915 = func.call @stack_pop_pointer() : () -> i64
      %1916 = func.call @cc_multiple_value_list(%1915) : (i64) -> i64
      %1917 = arith.constant 0 : i64
      %1918 = func.call @cc_box_fixnum(%1917) : (i64) -> i64
      %1919 = func.call @cc_nth(%1918, %1916) : (i64, i64) -> i64
      %1920 = arith.constant 1 : i64
      %1921 = func.call @cc_box_fixnum(%1920) : (i64) -> i64
      %1922 = func.call @cc_nth(%1921, %1916) : (i64, i64) -> i64
      %1923 = arith.constant 2 : i64
      %1924 = func.call @cc_box_fixnum(%1923) : (i64) -> i64
      %1925 = func.call @cc_nth(%1924, %1916) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %1926 = func.call @stack_depth() : () -> i64
      %1927 = arith.constant 0 : i64
      %1928 = arith.cmpi sgt, %1926, %1927 : i64
      scf.if %1928 {
        %1929 = func.call @stack_pop_pointer() : () -> i64
      }
      %1930 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1931 = func.call @cc_make_function_ref_const(%1930) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %1932 = arith.addi %1931, %__rlasp_stack_elide_zero_230 : i64
      %1933 = func.call @cc_nil_value() : () -> i64
      %1934 = arith.constant 1 : i1
      %1935 = arith.constant 0 : i1
      %1936 = arith.constant 1 : i1
      %1937:2 = scf.if %1934 -> (i64, i1) {
        %1938 = func.call @cc_nil_value() : () -> i64
        %1939 = func.call @cc_nil_value() : () -> i64
        %1940 = func.call @cc_errorp(%1938) : (i64) -> i64
        %1941 = arith.cmpi ne, %1940, %1939 : i64
        %1942 = scf.if %1941 -> (i64) {
          scf.yield %1938 : i64
        } else {
          %1943 = func.call @cc_nil_value() : () -> i64
          %1944 = func.call @cc_errorp(%1925) : (i64) -> i64
          %1945 = arith.cmpi ne, %1944, %1943 : i64
          %1946 = arith.cmpi eq, %1943, %1943 : i64
          %1947 = arith.andi %1945, %1946 : i1
          %1948 = scf.if %1947 -> (i64) {
            scf.yield %1925 : i64
          } else {
            scf.yield %1943 : i64
          }
          %1949 = arith.cmpi ne, %1948, %1943 : i64
          scf.if %1949 {
            func.call @stack_push_pointer(%1948) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1925) : (i64) -> ()
            %1950 = llvm.mlir.addressof @str193 : !llvm.ptr
            %1951 = func.call @cc_make_function_ref_const(%1950) : (!llvm.ptr) -> i64
            %1952 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1951, %1952) : (i64, i64) -> ()
          }
          %1953 = func.call @stack_pop_pointer() : () -> i64
          %1954 = func.call @cc_nil_value() : () -> i64
          %1955 = func.call @cc_nil_value() : () -> i64
          %1956 = func.call @cc_errorp(%1954) : (i64) -> i64
          %1957 = arith.cmpi ne, %1956, %1955 : i64
          %1958 = scf.if %1957 -> (i64) {
            scf.yield %1954 : i64
          } else {
            %1959 = func.call @cc_nil_value() : () -> i64
            %1960 = func.call @cc_errorp(%1919) : (i64) -> i64
            %1961 = arith.cmpi ne, %1960, %1959 : i64
            %1962 = arith.cmpi eq, %1959, %1959 : i64
            %1963 = arith.andi %1961, %1962 : i1
            %1964 = scf.if %1963 -> (i64) {
              scf.yield %1919 : i64
            } else {
              scf.yield %1959 : i64
            }
            %1965 = arith.cmpi ne, %1964, %1959 : i64
            scf.if %1965 {
              func.call @stack_push_pointer(%1964) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1919) : (i64) -> ()
              %1966 = llvm.mlir.addressof @str194 : !llvm.ptr
              %1967 = func.call @cc_make_function_ref_const(%1966) : (!llvm.ptr) -> i64
              %1968 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1967, %1968) : (i64, i64) -> ()
            }
            %1969 = func.call @stack_pop_pointer() : () -> i64
            %1970 = func.call @cc_nil_value() : () -> i64
            %1971 = func.call @cc_errorp(%1953) : (i64) -> i64
            %1972 = arith.cmpi ne, %1971, %1970 : i64
            %1973 = arith.cmpi eq, %1970, %1970 : i64
            %1974 = arith.andi %1972, %1973 : i1
            %1975 = scf.if %1974 -> (i64) {
              scf.yield %1953 : i64
            } else {
              scf.yield %1970 : i64
            }
            %1976 = arith.cmpi ne, %1975, %1970 : i64
            scf.if %1976 {
              func.call @stack_push_pointer(%1975) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1953) : (i64) -> ()
              %1977 = llvm.mlir.addressof @str195 : !llvm.ptr
              %1978 = func.call @cc_make_function_ref_const(%1977) : (!llvm.ptr) -> i64
              %1979 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1978, %1979) : (i64, i64) -> ()
            }
            %1980 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1981 = func.call @stack_pop_pointer() : () -> i64
            %1982 = func.call @cc_cons(%1980, %1981) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
            %1983 = arith.addi %1982, %__rlasp_stack_elide_zero_231 : i64
            %1984 = func.call @cc_cons(%1969, %1983) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
            %1985 = arith.addi %1984, %__rlasp_stack_elide_zero_232 : i64
            %1986 = func.call @cc_values_pack(%1985) : (i64) -> i64
            %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
            %1987 = arith.addi %1986, %__rlasp_stack_elide_zero_233 : i64
            scf.yield %1987 : i64
          }
          %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
          %1988 = arith.addi %1958, %__rlasp_stack_elide_zero_234 : i64
          scf.yield %1988 : i64
        }
        %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
        %1989 = arith.addi %1942, %__rlasp_stack_elide_zero_235 : i64
        %1990 = func.call @cc_multiple_value_list(%1989) : (i64) -> i64
        %1991 = func.call @cc_nil_value() : () -> i64
        %1992 = llvm.mlir.addressof @str196 : !llvm.ptr
        %1993 = arith.constant 38 : i64
        %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
        %1995 = func.call @cc_nil_value() : () -> i64
        %1996 = func.call @cc_intern(%1994, %1995) : (i64, i64) -> i64
        %1997 = func.call @cc_nil_value() : () -> i64
        %1998 = func.call @cc_cons(%1996, %1997) : (i64, i64) -> i64
        %1999 = func.call @cc_values_pack(%1998) : (i64) -> i64
        %2000 = func.call @cc_symbol_value(%1996) : (i64) -> i64
        %2001 = arith.cmpi ne, %2000, %1991 : i64
        %2002:2 = scf.if %2001 -> (i64, i1) {
          %2003 = func.call @cc_values_pack(%1990) : (i64) -> i64
          func.call @stack_push_pointer(%2003) : (i64) -> ()
          scf.yield %1933, %1935 : i64, i1
        } else {
          %2004 = func.call @cc_append(%1933, %1990) : (i64, i64) -> i64
          scf.yield %2004, %1936 : i64, i1
        }
        scf.yield %2002#0, %2002#1 : i64, i1
      } else {
        scf.yield %1933, %1935 : i64, i1
      }
      %2005:2 = scf.if %1937#1 -> (i64, i1) {
        %2006 = func.call @cc_t_value() : () -> i64
        %2007 = func.call @cc_nil_value() : () -> i64
        %2008 = func.call @cc_errorp(%1925) : (i64) -> i64
        %2009 = arith.cmpi ne, %2008, %2007 : i64
        %2010 = arith.cmpi eq, %2007, %2007 : i64
        %2011 = arith.andi %2009, %2010 : i1
        %2012 = scf.if %2011 -> (i64) {
          scf.yield %1925 : i64
        } else {
          scf.yield %2007 : i64
        }
        %2013 = func.call @cc_errorp(%2006) : (i64) -> i64
        %2014 = arith.cmpi ne, %2013, %2007 : i64
        %2015 = arith.cmpi eq, %2012, %2007 : i64
        %2016 = arith.andi %2014, %2015 : i1
        %2017 = scf.if %2016 -> (i64) {
          scf.yield %2006 : i64
        } else {
          scf.yield %2012 : i64
        }
        %2018 = arith.cmpi ne, %2017, %2007 : i64
        scf.if %2018 {
          func.call @stack_push_pointer(%2017) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1925) : (i64) -> ()
          func.call @stack_push_pointer(%2006) : (i64) -> ()
          %2019 = llvm.mlir.addressof @str197 : !llvm.ptr
          %2020 = func.call @cc_make_function_ref_const(%2019) : (!llvm.ptr) -> i64
          %2021 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2020, %2021) : (i64, i64) -> ()
        }
        %2022 = func.call @stack_pop_pointer() : () -> i64
        %2023 = func.call @cc_multiple_value_list(%2022) : (i64) -> i64
        %2024 = func.call @cc_nil_value() : () -> i64
        %2025 = llvm.mlir.addressof @str198 : !llvm.ptr
        %2026 = arith.constant 38 : i64
        %2027 = func.call @cc_make_string(%2025, %2026) : (!llvm.ptr, i64) -> i64
        %2028 = func.call @cc_nil_value() : () -> i64
        %2029 = func.call @cc_intern(%2027, %2028) : (i64, i64) -> i64
        %2030 = func.call @cc_nil_value() : () -> i64
        %2031 = func.call @cc_cons(%2029, %2030) : (i64, i64) -> i64
        %2032 = func.call @cc_values_pack(%2031) : (i64) -> i64
        %2033 = func.call @cc_symbol_value(%2029) : (i64) -> i64
        %2034 = arith.cmpi ne, %2033, %2024 : i64
        %2035:2 = scf.if %2034 -> (i64, i1) {
          %2036 = func.call @cc_values_pack(%2023) : (i64) -> i64
          func.call @stack_push_pointer(%2036) : (i64) -> ()
          scf.yield %1937#0, %1935 : i64, i1
        } else {
          %2037 = func.call @cc_append(%1937#0, %2023) : (i64, i64) -> i64
          scf.yield %2037, %1936 : i64, i1
        }
        scf.yield %2035#0, %2035#1 : i64, i1
      } else {
        scf.yield %1937#0, %1935 : i64, i1
      }
      scf.if %2005#1 {
        %2038 = func.call @cc_apply(%1932, %2005#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2038) : (i64) -> ()
      } else {
      }
      %2039 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2039 : i64
    }
    func.call @stack_push_pointer(%1722) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044363"() {
    %2230 = func.call @stack_pop_pointer() : () -> i64
    %2231 = func.call @cc_nil_value() : () -> i64
    %2232 = func.call @cc_nil_value() : () -> i64
    %2233 = func.call @cc_errorp(%2231) : (i64) -> i64
    %2234 = arith.cmpi ne, %2233, %2232 : i64
    %2235 = scf.if %2234 -> (i64) {
      scf.yield %2231 : i64
    } else {
      %2236 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2237 = arith.constant 8 : i64
      %2238 = func.call @cc_make_string(%2236, %2237) : (!llvm.ptr, i64) -> i64
      %2239 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2240 = arith.constant 11 : i64
      %2241 = func.call @cc_make_string(%2239, %2240) : (!llvm.ptr, i64) -> i64
      %2242 = func.call @cc_intern(%2238, %2241) : (i64, i64) -> i64
      %2243 = func.call @cc_nil_value() : () -> i64
      %2244 = func.call @cc_cons(%2242, %2243) : (i64, i64) -> i64
      %2245 = func.call @cc_values_pack(%2244) : (i64) -> i64
      %2246 = func.call @cc_symbol_value(%2242) : (i64) -> i64
      %2247 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2248 = arith.constant 6 : i64
      %2249 = func.call @cc_make_string(%2247, %2248) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2249) : (i64) -> ()
      %2250 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2251 = arith.constant 6 : i64
      %2252 = func.call @cc_make_string(%2250, %2251) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2252) : (i64) -> ()
      %2253 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2254 = arith.constant 9 : i64
      %2255 = func.call @cc_make_string(%2253, %2254) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2255) : (i64) -> ()
      %2256 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2257 = arith.constant 17 : i64
      %2258 = func.call @cc_make_string(%2256, %2257) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2258) : (i64) -> ()
      %2259 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2260 = arith.constant 6 : i64
      %2261 = func.call @cc_make_string(%2259, %2260) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2261) : (i64) -> ()
      %2262 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2263 = arith.constant 31 : i64
      %2264 = func.call @cc_make_string(%2262, %2263) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2264) : (i64) -> ()
      %2265 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2266 = arith.constant 6 : i64
      %2267 = func.call @cc_make_string(%2265, %2266) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2267) : (i64) -> ()
      %2268 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2269 = arith.constant 25 : i64
      %2270 = func.call @cc_make_string(%2268, %2269) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2270) : (i64) -> ()
      %2271 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2272 = arith.constant 6 : i64
      %2273 = func.call @cc_make_string(%2271, %2272) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2273) : (i64) -> ()
      %2274 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2275 = arith.constant 60 : i64
      %2276 = func.call @cc_make_string(%2274, %2275) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2276) : (i64) -> ()
      %2277 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2278 = arith.constant 6 : i64
      %2279 = func.call @cc_make_string(%2277, %2278) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2279) : (i64) -> ()
      %2280 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2281 = arith.constant 8 : i64
      %2282 = func.call @cc_make_string(%2280, %2281) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2282) : (i64) -> ()
      %2283 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2284 = arith.constant 6 : i64
      %2285 = func.call @cc_make_string(%2283, %2284) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2285) : (i64) -> ()
      %2286 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2287 = arith.constant 2 : i64
      %2288 = func.call @cc_make_string(%2286, %2287) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2288) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2289 = func.call @stack_pop_pointer() : () -> i64
      %2290 = func.call @stack_pop_pointer() : () -> i64
      %2291 = func.call @cc_cons(%2290, %2289) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %2292 = arith.addi %2291, %__rlasp_stack_elide_zero_236 : i64
      %2293 = func.call @stack_pop_pointer() : () -> i64
      %2294 = func.call @cc_cons(%2293, %2292) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %2295 = arith.addi %2294, %__rlasp_stack_elide_zero_237 : i64
      %2296 = func.call @stack_pop_pointer() : () -> i64
      %2297 = func.call @cc_cons(%2296, %2295) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %2298 = arith.addi %2297, %__rlasp_stack_elide_zero_238 : i64
      %2299 = func.call @stack_pop_pointer() : () -> i64
      %2300 = func.call @cc_cons(%2299, %2298) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %2301 = arith.addi %2300, %__rlasp_stack_elide_zero_239 : i64
      %2302 = func.call @stack_pop_pointer() : () -> i64
      %2303 = func.call @cc_cons(%2302, %2301) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %2304 = arith.addi %2303, %__rlasp_stack_elide_zero_240 : i64
      %2305 = func.call @stack_pop_pointer() : () -> i64
      %2306 = func.call @cc_cons(%2305, %2304) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %2307 = arith.addi %2306, %__rlasp_stack_elide_zero_241 : i64
      %2308 = func.call @stack_pop_pointer() : () -> i64
      %2309 = func.call @cc_cons(%2308, %2307) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %2310 = arith.addi %2309, %__rlasp_stack_elide_zero_242 : i64
      %2311 = func.call @stack_pop_pointer() : () -> i64
      %2312 = func.call @cc_cons(%2311, %2310) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %2313 = arith.addi %2312, %__rlasp_stack_elide_zero_243 : i64
      %2314 = func.call @stack_pop_pointer() : () -> i64
      %2315 = func.call @cc_cons(%2314, %2313) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %2316 = arith.addi %2315, %__rlasp_stack_elide_zero_244 : i64
      %2317 = func.call @stack_pop_pointer() : () -> i64
      %2318 = func.call @cc_cons(%2317, %2316) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %2319 = arith.addi %2318, %__rlasp_stack_elide_zero_245 : i64
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @cc_cons(%2320, %2319) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %2322 = arith.addi %2321, %__rlasp_stack_elide_zero_246 : i64
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2324 = func.call @cc_cons(%2323, %2322) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %2325 = arith.addi %2324, %__rlasp_stack_elide_zero_247 : i64
      %2326 = func.call @stack_pop_pointer() : () -> i64
      %2327 = func.call @cc_cons(%2326, %2325) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %2328 = arith.addi %2327, %__rlasp_stack_elide_zero_248 : i64
      %2329 = func.call @stack_pop_pointer() : () -> i64
      %2330 = func.call @cc_cons(%2329, %2328) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %2331 = arith.addi %2330, %__rlasp_stack_elide_zero_249 : i64
      %2332 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2333 = arith.constant 4 : i64
      %2334 = func.call @cc_make_string(%2332, %2333) : (!llvm.ptr, i64) -> i64
      %2335 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2336 = arith.constant 7 : i64
      %2337 = func.call @cc_make_string(%2335, %2336) : (!llvm.ptr, i64) -> i64
      %2338 = func.call @cc_intern(%2334, %2337) : (i64, i64) -> i64
      %2339 = func.call @cc_nil_value() : () -> i64
      %2340 = func.call @cc_cons(%2338, %2339) : (i64, i64) -> i64
      %2341 = func.call @cc_values_pack(%2340) : (i64) -> i64
      %2342 = func.call @cc_nil_value() : () -> i64
      %2343 = func.call @cc_nil_value() : () -> i64
      %2344 = func.call @cc_errorp(%2246) : (i64) -> i64
      %2345 = arith.cmpi ne, %2344, %2343 : i64
      %2346 = arith.cmpi eq, %2343, %2343 : i64
      %2347 = arith.andi %2345, %2346 : i1
      %2348 = scf.if %2347 -> (i64) {
        scf.yield %2246 : i64
      } else {
        scf.yield %2343 : i64
      }
      %2349 = func.call @cc_errorp(%2331) : (i64) -> i64
      %2350 = arith.cmpi ne, %2349, %2343 : i64
      %2351 = arith.cmpi eq, %2348, %2343 : i64
      %2352 = arith.andi %2350, %2351 : i1
      %2353 = scf.if %2352 -> (i64) {
        scf.yield %2331 : i64
      } else {
        scf.yield %2348 : i64
      }
      %2354 = func.call @cc_errorp(%2338) : (i64) -> i64
      %2355 = arith.cmpi ne, %2354, %2343 : i64
      %2356 = arith.cmpi eq, %2353, %2343 : i64
      %2357 = arith.andi %2355, %2356 : i1
      %2358 = scf.if %2357 -> (i64) {
        scf.yield %2338 : i64
      } else {
        scf.yield %2353 : i64
      }
      %2359 = func.call @cc_errorp(%2342) : (i64) -> i64
      %2360 = arith.cmpi ne, %2359, %2343 : i64
      %2361 = arith.cmpi eq, %2358, %2343 : i64
      %2362 = arith.andi %2360, %2361 : i1
      %2363 = scf.if %2362 -> (i64) {
        scf.yield %2342 : i64
      } else {
        scf.yield %2358 : i64
      }
      %2364 = arith.cmpi ne, %2363, %2343 : i64
      scf.if %2364 {
        func.call @stack_push_pointer(%2363) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2246) : (i64) -> ()
        func.call @stack_push_pointer(%2331) : (i64) -> ()
        func.call @stack_push_pointer(%2338) : (i64) -> ()
        func.call @stack_push_pointer(%2342) : (i64) -> ()
        %2365 = llvm.mlir.addressof @str235 : !llvm.ptr
        %2366 = func.call @cc_make_function_ref_const(%2365) : (!llvm.ptr) -> i64
        %2367 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%2366, %2367) : (i64, i64) -> ()
      }
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @cc_multiple_value_list(%2368) : (i64) -> i64
      %2370 = arith.constant 0 : i64
      %2371 = func.call @cc_box_fixnum(%2370) : (i64) -> i64
      %2372 = func.call @cc_nth(%2371, %2369) : (i64, i64) -> i64
      %2373 = arith.constant 1 : i64
      %2374 = func.call @cc_box_fixnum(%2373) : (i64) -> i64
      %2375 = func.call @cc_nth(%2374, %2369) : (i64, i64) -> i64
      %2376 = arith.constant 2 : i64
      %2377 = func.call @cc_box_fixnum(%2376) : (i64) -> i64
      %2378 = func.call @cc_nth(%2377, %2369) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2379 = func.call @stack_depth() : () -> i64
      %2380 = arith.constant 0 : i64
      %2381 = arith.cmpi sgt, %2379, %2380 : i64
      scf.if %2381 {
        %2382 = func.call @stack_pop_pointer() : () -> i64
      }
      %2383 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2384 = func.call @cc_make_function_ref_const(%2383) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %2385 = arith.addi %2384, %__rlasp_stack_elide_zero_250 : i64
      %2386 = func.call @cc_nil_value() : () -> i64
      %2387 = arith.constant 1 : i1
      %2388 = arith.constant 0 : i1
      %2389 = arith.constant 1 : i1
      %2390:2 = scf.if %2387 -> (i64, i1) {
        %2391 = func.call @cc_nil_value() : () -> i64
        %2392 = func.call @cc_nil_value() : () -> i64
        %2393 = func.call @cc_errorp(%2391) : (i64) -> i64
        %2394 = arith.cmpi ne, %2393, %2392 : i64
        %2395 = scf.if %2394 -> (i64) {
          scf.yield %2391 : i64
        } else {
          %2396 = llvm.mlir.addressof @str237 : !llvm.ptr
          %2397 = arith.constant 4 : i64
          %2398 = func.call @cc_make_string(%2396, %2397) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%2372) : (i64) -> ()
          func.call @stack_push_pointer(%2398) : (i64) -> ()
          %2399 = llvm.mlir.addressof @str238 : !llvm.ptr
          %2400 = func.call @cc_make_function_ref_const(%2399) : (!llvm.ptr) -> i64
          %2401 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2400, %2401) : (i64, i64) -> ()
          %2402 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2402 : i64
        }
        %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
        %2403 = arith.addi %2395, %__rlasp_stack_elide_zero_251 : i64
        %2404 = func.call @cc_multiple_value_list(%2403) : (i64) -> i64
        %2405 = func.call @cc_nil_value() : () -> i64
        %2406 = llvm.mlir.addressof @str239 : !llvm.ptr
        %2407 = arith.constant 38 : i64
        %2408 = func.call @cc_make_string(%2406, %2407) : (!llvm.ptr, i64) -> i64
        %2409 = func.call @cc_nil_value() : () -> i64
        %2410 = func.call @cc_intern(%2408, %2409) : (i64, i64) -> i64
        %2411 = func.call @cc_nil_value() : () -> i64
        %2412 = func.call @cc_cons(%2410, %2411) : (i64, i64) -> i64
        %2413 = func.call @cc_values_pack(%2412) : (i64) -> i64
        %2414 = func.call @cc_symbol_value(%2410) : (i64) -> i64
        %2415 = arith.cmpi ne, %2414, %2405 : i64
        %2416:2 = scf.if %2415 -> (i64, i1) {
          %2417 = func.call @cc_values_pack(%2404) : (i64) -> i64
          func.call @stack_push_pointer(%2417) : (i64) -> ()
          scf.yield %2386, %2388 : i64, i1
        } else {
          %2418 = func.call @cc_append(%2386, %2404) : (i64, i64) -> i64
          scf.yield %2418, %2389 : i64, i1
        }
        scf.yield %2416#0, %2416#1 : i64, i1
      } else {
        scf.yield %2386, %2388 : i64, i1
      }
      %2419:2 = scf.if %2390#1 -> (i64, i1) {
        %2420 = func.call @cc_t_value() : () -> i64
        %2421 = func.call @cc_nil_value() : () -> i64
        %2422 = func.call @cc_errorp(%2378) : (i64) -> i64
        %2423 = arith.cmpi ne, %2422, %2421 : i64
        %2424 = arith.cmpi eq, %2421, %2421 : i64
        %2425 = arith.andi %2423, %2424 : i1
        %2426 = scf.if %2425 -> (i64) {
          scf.yield %2378 : i64
        } else {
          scf.yield %2421 : i64
        }
        %2427 = func.call @cc_errorp(%2420) : (i64) -> i64
        %2428 = arith.cmpi ne, %2427, %2421 : i64
        %2429 = arith.cmpi eq, %2426, %2421 : i64
        %2430 = arith.andi %2428, %2429 : i1
        %2431 = scf.if %2430 -> (i64) {
          scf.yield %2420 : i64
        } else {
          scf.yield %2426 : i64
        }
        %2432 = arith.cmpi ne, %2431, %2421 : i64
        scf.if %2432 {
          func.call @stack_push_pointer(%2431) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2378) : (i64) -> ()
          func.call @stack_push_pointer(%2420) : (i64) -> ()
          %2433 = llvm.mlir.addressof @str240 : !llvm.ptr
          %2434 = func.call @cc_make_function_ref_const(%2433) : (!llvm.ptr) -> i64
          %2435 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2434, %2435) : (i64, i64) -> ()
        }
        %2436 = func.call @stack_pop_pointer() : () -> i64
        %2437 = func.call @cc_multiple_value_list(%2436) : (i64) -> i64
        %2438 = func.call @cc_nil_value() : () -> i64
        %2439 = llvm.mlir.addressof @str241 : !llvm.ptr
        %2440 = arith.constant 38 : i64
        %2441 = func.call @cc_make_string(%2439, %2440) : (!llvm.ptr, i64) -> i64
        %2442 = func.call @cc_nil_value() : () -> i64
        %2443 = func.call @cc_intern(%2441, %2442) : (i64, i64) -> i64
        %2444 = func.call @cc_nil_value() : () -> i64
        %2445 = func.call @cc_cons(%2443, %2444) : (i64, i64) -> i64
        %2446 = func.call @cc_values_pack(%2445) : (i64) -> i64
        %2447 = func.call @cc_symbol_value(%2443) : (i64) -> i64
        %2448 = arith.cmpi ne, %2447, %2438 : i64
        %2449:2 = scf.if %2448 -> (i64, i1) {
          %2450 = func.call @cc_values_pack(%2437) : (i64) -> i64
          func.call @stack_push_pointer(%2450) : (i64) -> ()
          scf.yield %2390#0, %2388 : i64, i1
        } else {
          %2451 = func.call @cc_append(%2390#0, %2437) : (i64, i64) -> i64
          scf.yield %2451, %2389 : i64, i1
        }
        scf.yield %2449#0, %2449#1 : i64, i1
      } else {
        scf.yield %2390#0, %2388 : i64, i1
      }
      scf.if %2419#1 {
        %2452 = func.call @cc_apply(%2385, %2419#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2452) : (i64) -> ()
      } else {
      }
      %2453 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2453 : i64
    }
    func.call @stack_push_pointer(%2235) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044365"() {
    %2617 = func.call @stack_pop_pointer() : () -> i64
    %2618 = func.call @cc_nil_value() : () -> i64
    %2619 = func.call @cc_nil_value() : () -> i64
    %2620 = func.call @cc_errorp(%2618) : (i64) -> i64
    %2621 = arith.cmpi ne, %2620, %2619 : i64
    %2622 = scf.if %2621 -> (i64) {
      scf.yield %2618 : i64
    } else {
      %2623 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2624 = arith.constant 8 : i64
      %2625 = func.call @cc_make_string(%2623, %2624) : (!llvm.ptr, i64) -> i64
      %2626 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2627 = arith.constant 11 : i64
      %2628 = func.call @cc_make_string(%2626, %2627) : (!llvm.ptr, i64) -> i64
      %2629 = func.call @cc_intern(%2625, %2628) : (i64, i64) -> i64
      %2630 = func.call @cc_nil_value() : () -> i64
      %2631 = func.call @cc_cons(%2629, %2630) : (i64, i64) -> i64
      %2632 = func.call @cc_values_pack(%2631) : (i64) -> i64
      %2633 = func.call @cc_symbol_value(%2629) : (i64) -> i64
      %2634 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2635 = arith.constant 6 : i64
      %2636 = func.call @cc_make_string(%2634, %2635) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2636) : (i64) -> ()
      %2637 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2638 = arith.constant 6 : i64
      %2639 = func.call @cc_make_string(%2637, %2638) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      %2640 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2641 = arith.constant 9 : i64
      %2642 = func.call @cc_make_string(%2640, %2641) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      %2643 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2644 = arith.constant 17 : i64
      %2645 = func.call @cc_make_string(%2643, %2644) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2645) : (i64) -> ()
      %2646 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2647 = arith.constant 6 : i64
      %2648 = func.call @cc_make_string(%2646, %2647) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2648) : (i64) -> ()
      %2649 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2650 = arith.constant 31 : i64
      %2651 = func.call @cc_make_string(%2649, %2650) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2651) : (i64) -> ()
      %2652 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2653 = arith.constant 6 : i64
      %2654 = func.call @cc_make_string(%2652, %2653) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2654) : (i64) -> ()
      %2655 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2656 = arith.constant 25 : i64
      %2657 = func.call @cc_make_string(%2655, %2656) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2657) : (i64) -> ()
      %2658 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2659 = arith.constant 6 : i64
      %2660 = func.call @cc_make_string(%2658, %2659) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2660) : (i64) -> ()
      %2661 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2662 = arith.constant 60 : i64
      %2663 = func.call @cc_make_string(%2661, %2662) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2663) : (i64) -> ()
      %2664 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2665 = arith.constant 6 : i64
      %2666 = func.call @cc_make_string(%2664, %2665) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2666) : (i64) -> ()
      %2667 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2668 = arith.constant 8 : i64
      %2669 = func.call @cc_make_string(%2667, %2668) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2669) : (i64) -> ()
      %2670 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2671 = arith.constant 6 : i64
      %2672 = func.call @cc_make_string(%2670, %2671) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2672) : (i64) -> ()
      %2673 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2674 = arith.constant 2 : i64
      %2675 = func.call @cc_make_string(%2673, %2674) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2676 = func.call @stack_pop_pointer() : () -> i64
      %2677 = func.call @stack_pop_pointer() : () -> i64
      %2678 = func.call @cc_cons(%2677, %2676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %2679 = arith.addi %2678, %__rlasp_stack_elide_zero_252 : i64
      %2680 = func.call @stack_pop_pointer() : () -> i64
      %2681 = func.call @cc_cons(%2680, %2679) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %2682 = arith.addi %2681, %__rlasp_stack_elide_zero_253 : i64
      %2683 = func.call @stack_pop_pointer() : () -> i64
      %2684 = func.call @cc_cons(%2683, %2682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %2685 = arith.addi %2684, %__rlasp_stack_elide_zero_254 : i64
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @cc_cons(%2686, %2685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %2688 = arith.addi %2687, %__rlasp_stack_elide_zero_255 : i64
      %2689 = func.call @stack_pop_pointer() : () -> i64
      %2690 = func.call @cc_cons(%2689, %2688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %2691 = arith.addi %2690, %__rlasp_stack_elide_zero_256 : i64
      %2692 = func.call @stack_pop_pointer() : () -> i64
      %2693 = func.call @cc_cons(%2692, %2691) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %2694 = arith.addi %2693, %__rlasp_stack_elide_zero_257 : i64
      %2695 = func.call @stack_pop_pointer() : () -> i64
      %2696 = func.call @cc_cons(%2695, %2694) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %2697 = arith.addi %2696, %__rlasp_stack_elide_zero_258 : i64
      %2698 = func.call @stack_pop_pointer() : () -> i64
      %2699 = func.call @cc_cons(%2698, %2697) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %2700 = arith.addi %2699, %__rlasp_stack_elide_zero_259 : i64
      %2701 = func.call @stack_pop_pointer() : () -> i64
      %2702 = func.call @cc_cons(%2701, %2700) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %2703 = arith.addi %2702, %__rlasp_stack_elide_zero_260 : i64
      %2704 = func.call @stack_pop_pointer() : () -> i64
      %2705 = func.call @cc_cons(%2704, %2703) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %2706 = arith.addi %2705, %__rlasp_stack_elide_zero_261 : i64
      %2707 = func.call @stack_pop_pointer() : () -> i64
      %2708 = func.call @cc_cons(%2707, %2706) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %2709 = arith.addi %2708, %__rlasp_stack_elide_zero_262 : i64
      %2710 = func.call @stack_pop_pointer() : () -> i64
      %2711 = func.call @cc_cons(%2710, %2709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %2712 = arith.addi %2711, %__rlasp_stack_elide_zero_263 : i64
      %2713 = func.call @stack_pop_pointer() : () -> i64
      %2714 = func.call @cc_cons(%2713, %2712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %2715 = arith.addi %2714, %__rlasp_stack_elide_zero_264 : i64
      %2716 = func.call @stack_pop_pointer() : () -> i64
      %2717 = func.call @cc_cons(%2716, %2715) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %2718 = arith.addi %2717, %__rlasp_stack_elide_zero_265 : i64
      %2719 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2720 = arith.constant 5 : i64
      %2721 = func.call @cc_make_string(%2719, %2720) : (!llvm.ptr, i64) -> i64
      %2722 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2723 = arith.constant 7 : i64
      %2724 = func.call @cc_make_string(%2722, %2723) : (!llvm.ptr, i64) -> i64
      %2725 = func.call @cc_intern(%2721, %2724) : (i64, i64) -> i64
      %2726 = func.call @cc_nil_value() : () -> i64
      %2727 = func.call @cc_cons(%2725, %2726) : (i64, i64) -> i64
      %2728 = func.call @cc_values_pack(%2727) : (i64) -> i64
      %2729 = func.call @cc_nil_value() : () -> i64
      %2730 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2731 = arith.constant 4 : i64
      %2732 = func.call @cc_make_string(%2730, %2731) : (!llvm.ptr, i64) -> i64
      %2733 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2734 = arith.constant 7 : i64
      %2735 = func.call @cc_make_string(%2733, %2734) : (!llvm.ptr, i64) -> i64
      %2736 = func.call @cc_intern(%2732, %2735) : (i64, i64) -> i64
      %2737 = func.call @cc_nil_value() : () -> i64
      %2738 = func.call @cc_cons(%2736, %2737) : (i64, i64) -> i64
      %2739 = func.call @cc_values_pack(%2738) : (i64) -> i64
      %2740 = func.call @cc_nil_value() : () -> i64
      %2741 = func.call @cc_nil_value() : () -> i64
      %2742 = func.call @cc_errorp(%2633) : (i64) -> i64
      %2743 = arith.cmpi ne, %2742, %2741 : i64
      %2744 = arith.cmpi eq, %2741, %2741 : i64
      %2745 = arith.andi %2743, %2744 : i1
      %2746 = scf.if %2745 -> (i64) {
        scf.yield %2633 : i64
      } else {
        scf.yield %2741 : i64
      }
      %2747 = func.call @cc_errorp(%2718) : (i64) -> i64
      %2748 = arith.cmpi ne, %2747, %2741 : i64
      %2749 = arith.cmpi eq, %2746, %2741 : i64
      %2750 = arith.andi %2748, %2749 : i1
      %2751 = scf.if %2750 -> (i64) {
        scf.yield %2718 : i64
      } else {
        scf.yield %2746 : i64
      }
      %2752 = func.call @cc_errorp(%2725) : (i64) -> i64
      %2753 = arith.cmpi ne, %2752, %2741 : i64
      %2754 = arith.cmpi eq, %2751, %2741 : i64
      %2755 = arith.andi %2753, %2754 : i1
      %2756 = scf.if %2755 -> (i64) {
        scf.yield %2725 : i64
      } else {
        scf.yield %2751 : i64
      }
      %2757 = func.call @cc_errorp(%2729) : (i64) -> i64
      %2758 = arith.cmpi ne, %2757, %2741 : i64
      %2759 = arith.cmpi eq, %2756, %2741 : i64
      %2760 = arith.andi %2758, %2759 : i1
      %2761 = scf.if %2760 -> (i64) {
        scf.yield %2729 : i64
      } else {
        scf.yield %2756 : i64
      }
      %2762 = func.call @cc_errorp(%2736) : (i64) -> i64
      %2763 = arith.cmpi ne, %2762, %2741 : i64
      %2764 = arith.cmpi eq, %2761, %2741 : i64
      %2765 = arith.andi %2763, %2764 : i1
      %2766 = scf.if %2765 -> (i64) {
        scf.yield %2736 : i64
      } else {
        scf.yield %2761 : i64
      }
      %2767 = func.call @cc_errorp(%2740) : (i64) -> i64
      %2768 = arith.cmpi ne, %2767, %2741 : i64
      %2769 = arith.cmpi eq, %2766, %2741 : i64
      %2770 = arith.andi %2768, %2769 : i1
      %2771 = scf.if %2770 -> (i64) {
        scf.yield %2740 : i64
      } else {
        scf.yield %2766 : i64
      }
      %2772 = arith.cmpi ne, %2771, %2741 : i64
      scf.if %2772 {
        func.call @stack_push_pointer(%2771) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2633) : (i64) -> ()
        func.call @stack_push_pointer(%2718) : (i64) -> ()
        func.call @stack_push_pointer(%2725) : (i64) -> ()
        func.call @stack_push_pointer(%2729) : (i64) -> ()
        func.call @stack_push_pointer(%2736) : (i64) -> ()
        func.call @stack_push_pointer(%2740) : (i64) -> ()
        %2773 = llvm.mlir.addressof @str276 : !llvm.ptr
        %2774 = func.call @cc_make_function_ref_const(%2773) : (!llvm.ptr) -> i64
        %2775 = arith.constant 6 : i64
        func.call @cc_funcall_stack(%2774, %2775) : (i64, i64) -> ()
      }
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @cc_multiple_value_list(%2776) : (i64) -> i64
      %2778 = arith.constant 0 : i64
      %2779 = func.call @cc_box_fixnum(%2778) : (i64) -> i64
      %2780 = func.call @cc_nth(%2779, %2777) : (i64, i64) -> i64
      %2781 = arith.constant 1 : i64
      %2782 = func.call @cc_box_fixnum(%2781) : (i64) -> i64
      %2783 = func.call @cc_nth(%2782, %2777) : (i64, i64) -> i64
      %2784 = arith.constant 2 : i64
      %2785 = func.call @cc_box_fixnum(%2784) : (i64) -> i64
      %2786 = func.call @cc_nth(%2785, %2777) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2787 = func.call @stack_depth() : () -> i64
      %2788 = arith.constant 0 : i64
      %2789 = arith.cmpi sgt, %2787, %2788 : i64
      scf.if %2789 {
        %2790 = func.call @stack_pop_pointer() : () -> i64
      }
      %2791 = llvm.mlir.addressof @str277 : !llvm.ptr
      %2792 = func.call @cc_make_function_ref_const(%2791) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %2793 = arith.addi %2792, %__rlasp_stack_elide_zero_266 : i64
      %2794 = func.call @cc_nil_value() : () -> i64
      %2795 = arith.constant 1 : i1
      %2796 = arith.constant 0 : i1
      %2797 = arith.constant 1 : i1
      %2798:2 = scf.if %2795 -> (i64, i1) {
        func.call @stack_push_nil() : () -> ()
        %2799 = func.call @stack_pop_pointer() : () -> i64
        %2800 = func.call @cc_multiple_value_list(%2799) : (i64) -> i64
        %2801 = func.call @cc_nil_value() : () -> i64
        %2802 = llvm.mlir.addressof @str278 : !llvm.ptr
        %2803 = arith.constant 38 : i64
        %2804 = func.call @cc_make_string(%2802, %2803) : (!llvm.ptr, i64) -> i64
        %2805 = func.call @cc_nil_value() : () -> i64
        %2806 = func.call @cc_intern(%2804, %2805) : (i64, i64) -> i64
        %2807 = func.call @cc_nil_value() : () -> i64
        %2808 = func.call @cc_cons(%2806, %2807) : (i64, i64) -> i64
        %2809 = func.call @cc_values_pack(%2808) : (i64) -> i64
        %2810 = func.call @cc_symbol_value(%2806) : (i64) -> i64
        %2811 = arith.cmpi ne, %2810, %2801 : i64
        %2812:2 = scf.if %2811 -> (i64, i1) {
          %2813 = func.call @cc_values_pack(%2800) : (i64) -> i64
          func.call @stack_push_pointer(%2813) : (i64) -> ()
          scf.yield %2794, %2796 : i64, i1
        } else {
          %2814 = func.call @cc_append(%2794, %2800) : (i64, i64) -> i64
          scf.yield %2814, %2797 : i64, i1
        }
        scf.yield %2812#0, %2812#1 : i64, i1
      } else {
        scf.yield %2794, %2796 : i64, i1
      }
      %2815:2 = scf.if %2798#1 -> (i64, i1) {
        %2816 = func.call @cc_t_value() : () -> i64
        %2817 = func.call @cc_nil_value() : () -> i64
        %2818 = func.call @cc_errorp(%2786) : (i64) -> i64
        %2819 = arith.cmpi ne, %2818, %2817 : i64
        %2820 = arith.cmpi eq, %2817, %2817 : i64
        %2821 = arith.andi %2819, %2820 : i1
        %2822 = scf.if %2821 -> (i64) {
          scf.yield %2786 : i64
        } else {
          scf.yield %2817 : i64
        }
        %2823 = func.call @cc_errorp(%2816) : (i64) -> i64
        %2824 = arith.cmpi ne, %2823, %2817 : i64
        %2825 = arith.cmpi eq, %2822, %2817 : i64
        %2826 = arith.andi %2824, %2825 : i1
        %2827 = scf.if %2826 -> (i64) {
          scf.yield %2816 : i64
        } else {
          scf.yield %2822 : i64
        }
        %2828 = arith.cmpi ne, %2827, %2817 : i64
        scf.if %2828 {
          func.call @stack_push_pointer(%2827) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2786) : (i64) -> ()
          func.call @stack_push_pointer(%2816) : (i64) -> ()
          %2829 = llvm.mlir.addressof @str279 : !llvm.ptr
          %2830 = func.call @cc_make_function_ref_const(%2829) : (!llvm.ptr) -> i64
          %2831 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2830, %2831) : (i64, i64) -> ()
        }
        %2832 = func.call @stack_pop_pointer() : () -> i64
        %2833 = func.call @cc_multiple_value_list(%2832) : (i64) -> i64
        %2834 = func.call @cc_nil_value() : () -> i64
        %2835 = llvm.mlir.addressof @str280 : !llvm.ptr
        %2836 = arith.constant 38 : i64
        %2837 = func.call @cc_make_string(%2835, %2836) : (!llvm.ptr, i64) -> i64
        %2838 = func.call @cc_nil_value() : () -> i64
        %2839 = func.call @cc_intern(%2837, %2838) : (i64, i64) -> i64
        %2840 = func.call @cc_nil_value() : () -> i64
        %2841 = func.call @cc_cons(%2839, %2840) : (i64, i64) -> i64
        %2842 = func.call @cc_values_pack(%2841) : (i64) -> i64
        %2843 = func.call @cc_symbol_value(%2839) : (i64) -> i64
        %2844 = arith.cmpi ne, %2843, %2834 : i64
        %2845:2 = scf.if %2844 -> (i64, i1) {
          %2846 = func.call @cc_values_pack(%2833) : (i64) -> i64
          func.call @stack_push_pointer(%2846) : (i64) -> ()
          scf.yield %2798#0, %2796 : i64, i1
        } else {
          %2847 = func.call @cc_append(%2798#0, %2833) : (i64, i64) -> i64
          scf.yield %2847, %2797 : i64, i1
        }
        scf.yield %2845#0, %2845#1 : i64, i1
      } else {
        scf.yield %2798#0, %2796 : i64, i1
      }
      scf.if %2815#1 {
        %2848 = func.call @cc_apply(%2793, %2815#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2848) : (i64) -> ()
      } else {
      }
      %2849 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2849 : i64
    }
    func.call @stack_push_pointer(%2622) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044367"() {
    %3333 = func.call @stack_pop_pointer() : () -> i64
    %3334 = func.call @cc_nil_value() : () -> i64
    %3335 = func.call @cc_nil_value() : () -> i64
    %3336 = func.call @cc_errorp(%3334) : (i64) -> i64
    %3337 = arith.cmpi ne, %3336, %3335 : i64
    %3338 = scf.if %3337 -> (i64) {
      scf.yield %3334 : i64
    } else {
      %3339 = func.call @cc_nil_value() : () -> i64
      %3340 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3341 = arith.constant 38 : i64
      %3342 = func.call @cc_make_string(%3340, %3341) : (!llvm.ptr, i64) -> i64
      %3343 = func.call @cc_nil_value() : () -> i64
      %3344 = func.call @cc_intern(%3342, %3343) : (i64, i64) -> i64
      %3345 = func.call @cc_nil_value() : () -> i64
      %3346 = func.call @cc_cons(%3344, %3345) : (i64, i64) -> i64
      %3347 = func.call @cc_values_pack(%3346) : (i64) -> i64
      %3348 = func.call @cc_set_symbol_value(%3344, %3339) : (i64, i64) -> i64
      %3349 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3350 = arith.constant 39 : i64
      %3351 = func.call @cc_make_string(%3349, %3350) : (!llvm.ptr, i64) -> i64
      %3352 = func.call @cc_nil_value() : () -> i64
      %3353 = func.call @cc_intern(%3351, %3352) : (i64, i64) -> i64
      %3354 = func.call @cc_nil_value() : () -> i64
      %3355 = func.call @cc_cons(%3353, %3354) : (i64, i64) -> i64
      %3356 = func.call @cc_values_pack(%3355) : (i64) -> i64
      %3357 = func.call @cc_set_symbol_value(%3353, %3339) : (i64, i64) -> i64
      %3358 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3359 = arith.constant 40 : i64
      %3360 = func.call @cc_make_string(%3358, %3359) : (!llvm.ptr, i64) -> i64
      %3361 = func.call @cc_nil_value() : () -> i64
      %3362 = func.call @cc_intern(%3360, %3361) : (i64, i64) -> i64
      %3363 = func.call @cc_nil_value() : () -> i64
      %3364 = func.call @cc_cons(%3362, %3363) : (i64, i64) -> i64
      %3365 = func.call @cc_values_pack(%3364) : (i64) -> i64
      %3366 = func.call @cc_set_symbol_value(%3362, %3339) : (i64, i64) -> i64
      %3367 = func.call @cc_make_string_output_stream() : () -> i64
      %3368 = func.call @cc_make_string_output_stream() : () -> i64
      %3369 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3370 = arith.constant 3 : i64
      %3371 = func.call @cc_make_string(%3369, %3370) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %3372 = arith.addi %3371, %__rlasp_stack_elide_zero_267 : i64
      %3373 = func.call @cc_make_string_input_stream(%3372) : (i64) -> i64
      %3374 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3375 = arith.constant 8 : i64
      %3376 = func.call @cc_make_string(%3374, %3375) : (!llvm.ptr, i64) -> i64
      %3377 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3378 = arith.constant 11 : i64
      %3379 = func.call @cc_make_string(%3377, %3378) : (!llvm.ptr, i64) -> i64
      %3380 = func.call @cc_intern(%3376, %3379) : (i64, i64) -> i64
      %3381 = func.call @cc_nil_value() : () -> i64
      %3382 = func.call @cc_cons(%3380, %3381) : (i64, i64) -> i64
      %3383 = func.call @cc_values_pack(%3382) : (i64) -> i64
      %3384 = func.call @cc_symbol_value(%3380) : (i64) -> i64
      %3385 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3386 = arith.constant 6 : i64
      %3387 = func.call @cc_make_string(%3385, %3386) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3387) : (i64) -> ()
      %3388 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3389 = arith.constant 6 : i64
      %3390 = func.call @cc_make_string(%3388, %3389) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3390) : (i64) -> ()
      %3391 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3392 = arith.constant 9 : i64
      %3393 = func.call @cc_make_string(%3391, %3392) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3393) : (i64) -> ()
      %3394 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3395 = arith.constant 17 : i64
      %3396 = func.call @cc_make_string(%3394, %3395) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3396) : (i64) -> ()
      %3397 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3398 = arith.constant 6 : i64
      %3399 = func.call @cc_make_string(%3397, %3398) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3399) : (i64) -> ()
      %3400 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3401 = arith.constant 31 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3402) : (i64) -> ()
      %3403 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3404 = arith.constant 6 : i64
      %3405 = func.call @cc_make_string(%3403, %3404) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3405) : (i64) -> ()
      %3406 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3407 = arith.constant 25 : i64
      %3408 = func.call @cc_make_string(%3406, %3407) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3408) : (i64) -> ()
      %3409 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3410 = arith.constant 6 : i64
      %3411 = func.call @cc_make_string(%3409, %3410) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3411) : (i64) -> ()
      %3412 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3413 = arith.constant 60 : i64
      %3414 = func.call @cc_make_string(%3412, %3413) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3414) : (i64) -> ()
      %3415 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3416 = arith.constant 6 : i64
      %3417 = func.call @cc_make_string(%3415, %3416) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3417) : (i64) -> ()
      %3418 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3419 = arith.constant 8 : i64
      %3420 = func.call @cc_make_string(%3418, %3419) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3420) : (i64) -> ()
      %3421 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3422 = arith.constant 6 : i64
      %3423 = func.call @cc_make_string(%3421, %3422) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3423) : (i64) -> ()
      %3424 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3425 = arith.constant 2 : i64
      %3426 = func.call @cc_make_string(%3424, %3425) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3426) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3427 = func.call @stack_pop_pointer() : () -> i64
      %3428 = func.call @stack_pop_pointer() : () -> i64
      %3429 = func.call @cc_cons(%3428, %3427) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %3430 = arith.addi %3429, %__rlasp_stack_elide_zero_268 : i64
      %3431 = func.call @stack_pop_pointer() : () -> i64
      %3432 = func.call @cc_cons(%3431, %3430) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %3433 = arith.addi %3432, %__rlasp_stack_elide_zero_269 : i64
      %3434 = func.call @stack_pop_pointer() : () -> i64
      %3435 = func.call @cc_cons(%3434, %3433) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %3436 = arith.addi %3435, %__rlasp_stack_elide_zero_270 : i64
      %3437 = func.call @stack_pop_pointer() : () -> i64
      %3438 = func.call @cc_cons(%3437, %3436) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %3439 = arith.addi %3438, %__rlasp_stack_elide_zero_271 : i64
      %3440 = func.call @stack_pop_pointer() : () -> i64
      %3441 = func.call @cc_cons(%3440, %3439) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %3442 = arith.addi %3441, %__rlasp_stack_elide_zero_272 : i64
      %3443 = func.call @stack_pop_pointer() : () -> i64
      %3444 = func.call @cc_cons(%3443, %3442) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %3445 = arith.addi %3444, %__rlasp_stack_elide_zero_273 : i64
      %3446 = func.call @stack_pop_pointer() : () -> i64
      %3447 = func.call @cc_cons(%3446, %3445) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %3448 = arith.addi %3447, %__rlasp_stack_elide_zero_274 : i64
      %3449 = func.call @stack_pop_pointer() : () -> i64
      %3450 = func.call @cc_cons(%3449, %3448) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %3451 = arith.addi %3450, %__rlasp_stack_elide_zero_275 : i64
      %3452 = func.call @stack_pop_pointer() : () -> i64
      %3453 = func.call @cc_cons(%3452, %3451) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %3454 = arith.addi %3453, %__rlasp_stack_elide_zero_276 : i64
      %3455 = func.call @stack_pop_pointer() : () -> i64
      %3456 = func.call @cc_cons(%3455, %3454) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %3457 = arith.addi %3456, %__rlasp_stack_elide_zero_277 : i64
      %3458 = func.call @stack_pop_pointer() : () -> i64
      %3459 = func.call @cc_cons(%3458, %3457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %3460 = arith.addi %3459, %__rlasp_stack_elide_zero_278 : i64
      %3461 = func.call @stack_pop_pointer() : () -> i64
      %3462 = func.call @cc_cons(%3461, %3460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %3463 = arith.addi %3462, %__rlasp_stack_elide_zero_279 : i64
      %3464 = func.call @stack_pop_pointer() : () -> i64
      %3465 = func.call @cc_cons(%3464, %3463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %3466 = arith.addi %3465, %__rlasp_stack_elide_zero_280 : i64
      %3467 = func.call @stack_pop_pointer() : () -> i64
      %3468 = func.call @cc_cons(%3467, %3466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %3469 = arith.addi %3468, %__rlasp_stack_elide_zero_281 : i64
      %3470 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3471 = arith.constant 5 : i64
      %3472 = func.call @cc_make_string(%3470, %3471) : (!llvm.ptr, i64) -> i64
      %3473 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3474 = arith.constant 7 : i64
      %3475 = func.call @cc_make_string(%3473, %3474) : (!llvm.ptr, i64) -> i64
      %3476 = func.call @cc_intern(%3472, %3475) : (i64, i64) -> i64
      %3477 = func.call @cc_nil_value() : () -> i64
      %3478 = func.call @cc_cons(%3476, %3477) : (i64, i64) -> i64
      %3479 = func.call @cc_values_pack(%3478) : (i64) -> i64
      %3480 = llvm.mlir.addressof @str352 : !llvm.ptr
      %3481 = arith.constant 6 : i64
      %3482 = func.call @cc_make_string(%3480, %3481) : (!llvm.ptr, i64) -> i64
      %3483 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3484 = arith.constant 7 : i64
      %3485 = func.call @cc_make_string(%3483, %3484) : (!llvm.ptr, i64) -> i64
      %3486 = func.call @cc_intern(%3482, %3485) : (i64, i64) -> i64
      %3487 = func.call @cc_nil_value() : () -> i64
      %3488 = func.call @cc_cons(%3486, %3487) : (i64, i64) -> i64
      %3489 = func.call @cc_values_pack(%3488) : (i64) -> i64
      %3490 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3491 = arith.constant 5 : i64
      %3492 = func.call @cc_make_string(%3490, %3491) : (!llvm.ptr, i64) -> i64
      %3493 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3494 = arith.constant 7 : i64
      %3495 = func.call @cc_make_string(%3493, %3494) : (!llvm.ptr, i64) -> i64
      %3496 = func.call @cc_intern(%3492, %3495) : (i64, i64) -> i64
      %3497 = func.call @cc_nil_value() : () -> i64
      %3498 = func.call @cc_cons(%3496, %3497) : (i64, i64) -> i64
      %3499 = func.call @cc_values_pack(%3498) : (i64) -> i64
      %3500 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3501 = arith.constant 4 : i64
      %3502 = func.call @cc_make_string(%3500, %3501) : (!llvm.ptr, i64) -> i64
      %3503 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3504 = arith.constant 7 : i64
      %3505 = func.call @cc_make_string(%3503, %3504) : (!llvm.ptr, i64) -> i64
      %3506 = func.call @cc_intern(%3502, %3505) : (i64, i64) -> i64
      %3507 = func.call @cc_nil_value() : () -> i64
      %3508 = func.call @cc_cons(%3506, %3507) : (i64, i64) -> i64
      %3509 = func.call @cc_values_pack(%3508) : (i64) -> i64
      %3510 = func.call @cc_nil_value() : () -> i64
      %3511 = func.call @cc_nil_value() : () -> i64
      %3512 = func.call @cc_errorp(%3384) : (i64) -> i64
      %3513 = arith.cmpi ne, %3512, %3511 : i64
      %3514 = arith.cmpi eq, %3511, %3511 : i64
      %3515 = arith.andi %3513, %3514 : i1
      %3516 = scf.if %3515 -> (i64) {
        scf.yield %3384 : i64
      } else {
        scf.yield %3511 : i64
      }
      %3517 = func.call @cc_errorp(%3469) : (i64) -> i64
      %3518 = arith.cmpi ne, %3517, %3511 : i64
      %3519 = arith.cmpi eq, %3516, %3511 : i64
      %3520 = arith.andi %3518, %3519 : i1
      %3521 = scf.if %3520 -> (i64) {
        scf.yield %3469 : i64
      } else {
        scf.yield %3516 : i64
      }
      %3522 = func.call @cc_errorp(%3476) : (i64) -> i64
      %3523 = arith.cmpi ne, %3522, %3511 : i64
      %3524 = arith.cmpi eq, %3521, %3511 : i64
      %3525 = arith.andi %3523, %3524 : i1
      %3526 = scf.if %3525 -> (i64) {
        scf.yield %3476 : i64
      } else {
        scf.yield %3521 : i64
      }
      %3527 = func.call @cc_errorp(%3373) : (i64) -> i64
      %3528 = arith.cmpi ne, %3527, %3511 : i64
      %3529 = arith.cmpi eq, %3526, %3511 : i64
      %3530 = arith.andi %3528, %3529 : i1
      %3531 = scf.if %3530 -> (i64) {
        scf.yield %3373 : i64
      } else {
        scf.yield %3526 : i64
      }
      %3532 = func.call @cc_errorp(%3486) : (i64) -> i64
      %3533 = arith.cmpi ne, %3532, %3511 : i64
      %3534 = arith.cmpi eq, %3531, %3511 : i64
      %3535 = arith.andi %3533, %3534 : i1
      %3536 = scf.if %3535 -> (i64) {
        scf.yield %3486 : i64
      } else {
        scf.yield %3531 : i64
      }
      %3537 = func.call @cc_errorp(%3367) : (i64) -> i64
      %3538 = arith.cmpi ne, %3537, %3511 : i64
      %3539 = arith.cmpi eq, %3536, %3511 : i64
      %3540 = arith.andi %3538, %3539 : i1
      %3541 = scf.if %3540 -> (i64) {
        scf.yield %3367 : i64
      } else {
        scf.yield %3536 : i64
      }
      %3542 = func.call @cc_errorp(%3496) : (i64) -> i64
      %3543 = arith.cmpi ne, %3542, %3511 : i64
      %3544 = arith.cmpi eq, %3541, %3511 : i64
      %3545 = arith.andi %3543, %3544 : i1
      %3546 = scf.if %3545 -> (i64) {
        scf.yield %3496 : i64
      } else {
        scf.yield %3541 : i64
      }
      %3547 = func.call @cc_errorp(%3368) : (i64) -> i64
      %3548 = arith.cmpi ne, %3547, %3511 : i64
      %3549 = arith.cmpi eq, %3546, %3511 : i64
      %3550 = arith.andi %3548, %3549 : i1
      %3551 = scf.if %3550 -> (i64) {
        scf.yield %3368 : i64
      } else {
        scf.yield %3546 : i64
      }
      %3552 = func.call @cc_errorp(%3506) : (i64) -> i64
      %3553 = arith.cmpi ne, %3552, %3511 : i64
      %3554 = arith.cmpi eq, %3551, %3511 : i64
      %3555 = arith.andi %3553, %3554 : i1
      %3556 = scf.if %3555 -> (i64) {
        scf.yield %3506 : i64
      } else {
        scf.yield %3551 : i64
      }
      %3557 = func.call @cc_errorp(%3510) : (i64) -> i64
      %3558 = arith.cmpi ne, %3557, %3511 : i64
      %3559 = arith.cmpi eq, %3556, %3511 : i64
      %3560 = arith.andi %3558, %3559 : i1
      %3561 = scf.if %3560 -> (i64) {
        scf.yield %3510 : i64
      } else {
        scf.yield %3556 : i64
      }
      %3562 = arith.cmpi ne, %3561, %3511 : i64
      scf.if %3562 {
        func.call @stack_push_pointer(%3561) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3384) : (i64) -> ()
        func.call @stack_push_pointer(%3469) : (i64) -> ()
        func.call @stack_push_pointer(%3476) : (i64) -> ()
        func.call @stack_push_pointer(%3373) : (i64) -> ()
        func.call @stack_push_pointer(%3486) : (i64) -> ()
        func.call @stack_push_pointer(%3367) : (i64) -> ()
        func.call @stack_push_pointer(%3496) : (i64) -> ()
        func.call @stack_push_pointer(%3368) : (i64) -> ()
        func.call @stack_push_pointer(%3506) : (i64) -> ()
        func.call @stack_push_pointer(%3510) : (i64) -> ()
        %3563 = llvm.mlir.addressof @str358 : !llvm.ptr
        %3564 = func.call @cc_make_function_ref_const(%3563) : (!llvm.ptr) -> i64
        %3565 = arith.constant 10 : i64
        func.call @cc_funcall_stack(%3564, %3565) : (i64, i64) -> ()
      }
      %3566 = func.call @stack_pop_pointer() : () -> i64
      %3567 = func.call @cc_multiple_value_list(%3566) : (i64) -> i64
      %3568 = arith.constant 0 : i64
      %3569 = func.call @cc_box_fixnum(%3568) : (i64) -> i64
      %3570 = func.call @cc_nth(%3569, %3567) : (i64, i64) -> i64
      %3571 = arith.constant 1 : i64
      %3572 = func.call @cc_box_fixnum(%3571) : (i64) -> i64
      %3573 = func.call @cc_nth(%3572, %3567) : (i64, i64) -> i64
      %3574 = arith.constant 2 : i64
      %3575 = func.call @cc_box_fixnum(%3574) : (i64) -> i64
      %3576 = func.call @cc_nth(%3575, %3567) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3577 = func.call @stack_depth() : () -> i64
      %3578 = arith.constant 0 : i64
      %3579 = arith.cmpi sgt, %3577, %3578 : i64
      scf.if %3579 {
        %3580 = func.call @stack_pop_pointer() : () -> i64
      }
      %3581 = llvm.mlir.addressof @str359 : !llvm.ptr
      %3582 = func.call @cc_make_function_ref_const(%3581) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %3583 = arith.addi %3582, %__rlasp_stack_elide_zero_282 : i64
      %3584 = func.call @cc_nil_value() : () -> i64
      %3585 = arith.constant 1 : i1
      %3586 = arith.constant 0 : i1
      %3587 = arith.constant 1 : i1
      %3588:2 = scf.if %3585 -> (i64, i1) {
        func.call @stack_push_nil() : () -> ()
        %3589 = func.call @stack_pop_pointer() : () -> i64
        %3590 = func.call @cc_multiple_value_list(%3589) : (i64) -> i64
        %3591 = func.call @cc_nil_value() : () -> i64
        %3592 = llvm.mlir.addressof @str360 : !llvm.ptr
        %3593 = arith.constant 38 : i64
        %3594 = func.call @cc_make_string(%3592, %3593) : (!llvm.ptr, i64) -> i64
        %3595 = func.call @cc_nil_value() : () -> i64
        %3596 = func.call @cc_intern(%3594, %3595) : (i64, i64) -> i64
        %3597 = func.call @cc_nil_value() : () -> i64
        %3598 = func.call @cc_cons(%3596, %3597) : (i64, i64) -> i64
        %3599 = func.call @cc_values_pack(%3598) : (i64) -> i64
        %3600 = func.call @cc_symbol_value(%3596) : (i64) -> i64
        %3601 = arith.cmpi ne, %3600, %3591 : i64
        %3602 = llvm.mlir.addressof @str361 : !llvm.ptr
        %3603 = arith.constant 38 : i64
        %3604 = func.call @cc_make_string(%3602, %3603) : (!llvm.ptr, i64) -> i64
        %3605 = func.call @cc_nil_value() : () -> i64
        %3606 = func.call @cc_intern(%3604, %3605) : (i64, i64) -> i64
        %3607 = func.call @cc_nil_value() : () -> i64
        %3608 = func.call @cc_cons(%3606, %3607) : (i64, i64) -> i64
        %3609 = func.call @cc_values_pack(%3608) : (i64) -> i64
        %3610 = func.call @cc_symbol_value(%3606) : (i64) -> i64
        %3611 = arith.cmpi ne, %3610, %3591 : i64
        %3612 = arith.ori %3601, %3611 : i1
        %3613:2 = scf.if %3612 -> (i64, i1) {
          %3614 = func.call @cc_values_pack(%3590) : (i64) -> i64
          func.call @stack_push_pointer(%3614) : (i64) -> ()
          scf.yield %3584, %3586 : i64, i1
        } else {
          %3615 = func.call @cc_append(%3584, %3590) : (i64, i64) -> i64
          scf.yield %3615, %3587 : i64, i1
        }
        scf.yield %3613#0, %3613#1 : i64, i1
      } else {
        scf.yield %3584, %3586 : i64, i1
      }
      %3616:2 = scf.if %3588#1 -> (i64, i1) {
        %3617 = func.call @cc_t_value() : () -> i64
        %3618 = func.call @cc_nil_value() : () -> i64
        %3619 = func.call @cc_errorp(%3576) : (i64) -> i64
        %3620 = arith.cmpi ne, %3619, %3618 : i64
        %3621 = arith.cmpi eq, %3618, %3618 : i64
        %3622 = arith.andi %3620, %3621 : i1
        %3623 = scf.if %3622 -> (i64) {
          scf.yield %3576 : i64
        } else {
          scf.yield %3618 : i64
        }
        %3624 = func.call @cc_errorp(%3617) : (i64) -> i64
        %3625 = arith.cmpi ne, %3624, %3618 : i64
        %3626 = arith.cmpi eq, %3623, %3618 : i64
        %3627 = arith.andi %3625, %3626 : i1
        %3628 = scf.if %3627 -> (i64) {
          scf.yield %3617 : i64
        } else {
          scf.yield %3623 : i64
        }
        %3629 = arith.cmpi ne, %3628, %3618 : i64
        scf.if %3629 {
          func.call @stack_push_pointer(%3628) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3576) : (i64) -> ()
          func.call @stack_push_pointer(%3617) : (i64) -> ()
          %3630 = llvm.mlir.addressof @str362 : !llvm.ptr
          %3631 = func.call @cc_make_function_ref_const(%3630) : (!llvm.ptr) -> i64
          %3632 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3631, %3632) : (i64, i64) -> ()
        }
        %3633 = func.call @stack_pop_pointer() : () -> i64
        %3634 = func.call @cc_multiple_value_list(%3633) : (i64) -> i64
        %3635 = func.call @cc_nil_value() : () -> i64
        %3636 = llvm.mlir.addressof @str363 : !llvm.ptr
        %3637 = arith.constant 38 : i64
        %3638 = func.call @cc_make_string(%3636, %3637) : (!llvm.ptr, i64) -> i64
        %3639 = func.call @cc_nil_value() : () -> i64
        %3640 = func.call @cc_intern(%3638, %3639) : (i64, i64) -> i64
        %3641 = func.call @cc_nil_value() : () -> i64
        %3642 = func.call @cc_cons(%3640, %3641) : (i64, i64) -> i64
        %3643 = func.call @cc_values_pack(%3642) : (i64) -> i64
        %3644 = func.call @cc_symbol_value(%3640) : (i64) -> i64
        %3645 = arith.cmpi ne, %3644, %3635 : i64
        %3646 = llvm.mlir.addressof @str364 : !llvm.ptr
        %3647 = arith.constant 38 : i64
        %3648 = func.call @cc_make_string(%3646, %3647) : (!llvm.ptr, i64) -> i64
        %3649 = func.call @cc_nil_value() : () -> i64
        %3650 = func.call @cc_intern(%3648, %3649) : (i64, i64) -> i64
        %3651 = func.call @cc_nil_value() : () -> i64
        %3652 = func.call @cc_cons(%3650, %3651) : (i64, i64) -> i64
        %3653 = func.call @cc_values_pack(%3652) : (i64) -> i64
        %3654 = func.call @cc_symbol_value(%3650) : (i64) -> i64
        %3655 = arith.cmpi ne, %3654, %3635 : i64
        %3656 = arith.ori %3645, %3655 : i1
        %3657:2 = scf.if %3656 -> (i64, i1) {
          %3658 = func.call @cc_values_pack(%3634) : (i64) -> i64
          func.call @stack_push_pointer(%3658) : (i64) -> ()
          scf.yield %3588#0, %3586 : i64, i1
        } else {
          %3659 = func.call @cc_append(%3588#0, %3634) : (i64, i64) -> i64
          scf.yield %3659, %3587 : i64, i1
        }
        scf.yield %3657#0, %3657#1 : i64, i1
      } else {
        scf.yield %3588#0, %3586 : i64, i1
      }
      scf.if %3616#1 {
        %3660 = func.call @cc_apply(%3583, %3616#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3660) : (i64) -> ()
      } else {
      }
      %3661 = func.call @stack_pop_pointer() : () -> i64
      %3662 = func.call @cc_nil_value() : () -> i64
      %3663 = func.call @cc_errorp(%3661) : (i64) -> i64
      %3664 = arith.cmpi ne, %3663, %3662 : i64
      %3665 = scf.if %3664 -> (i64) {
        scf.yield %3661 : i64
      } else {
        %3666 = func.call @cc_nil_value() : () -> i64
        %3667 = func.call @cc_errorp(%3367) : (i64) -> i64
        %3668 = arith.cmpi ne, %3667, %3666 : i64
        %3669 = arith.cmpi eq, %3666, %3666 : i64
        %3670 = arith.andi %3668, %3669 : i1
        %3671 = scf.if %3670 -> (i64) {
          scf.yield %3367 : i64
        } else {
          scf.yield %3666 : i64
        }
        %3672 = arith.cmpi ne, %3671, %3666 : i64
        scf.if %3672 {
          func.call @stack_push_pointer(%3671) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3367) : (i64) -> ()
          %3673 = llvm.mlir.addressof @str365 : !llvm.ptr
          %3674 = func.call @cc_make_function_ref_const(%3673) : (!llvm.ptr) -> i64
          %3675 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3674, %3675) : (i64, i64) -> ()
        }
        %3676 = func.call @stack_pop_pointer() : () -> i64
        %3677 = func.call @cc_length(%3676) : (i64) -> i64
        %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
        %3678 = arith.addi %3677, %__rlasp_stack_elide_zero_283 : i64
        %3679 = func.call @cc_unbox_fixnum(%3678) : (i64) -> i64
        %3680 = arith.constant 0 : i64
        %3681 = arith.cmpi eq, %3679, %3680 : i64
        %3682 = func.call @cc_t_value() : () -> i64
        %3683 = func.call @cc_nil_value() : () -> i64
        %3684 = arith.select %3681, %3682, %3683 : i64
        %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
        %3685 = arith.addi %3684, %__rlasp_stack_elide_zero_284 : i64
        %3686 = func.call @cc_nil_value() : () -> i64
        %3687 = func.call @cc_errorp(%3368) : (i64) -> i64
        %3688 = arith.cmpi ne, %3687, %3686 : i64
        %3689 = arith.cmpi eq, %3686, %3686 : i64
        %3690 = arith.andi %3688, %3689 : i1
        %3691 = scf.if %3690 -> (i64) {
          scf.yield %3368 : i64
        } else {
          scf.yield %3686 : i64
        }
        %3692 = arith.cmpi ne, %3691, %3686 : i64
        scf.if %3692 {
          func.call @stack_push_pointer(%3691) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3368) : (i64) -> ()
          %3693 = llvm.mlir.addressof @str366 : !llvm.ptr
          %3694 = func.call @cc_make_function_ref_const(%3693) : (!llvm.ptr) -> i64
          %3695 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3694, %3695) : (i64, i64) -> ()
        }
        %3696 = func.call @stack_pop_pointer() : () -> i64
        %3697 = func.call @cc_length(%3696) : (i64) -> i64
        %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
        %3698 = arith.addi %3697, %__rlasp_stack_elide_zero_285 : i64
        %3699 = func.call @cc_unbox_fixnum(%3698) : (i64) -> i64
        %3700 = arith.constant 0 : i64
        %3701 = arith.cmpi eq, %3699, %3700 : i64
        %3702 = func.call @cc_t_value() : () -> i64
        %3703 = func.call @cc_nil_value() : () -> i64
        %3704 = arith.select %3701, %3702, %3703 : i64
        %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
        %3705 = arith.addi %3704, %__rlasp_stack_elide_zero_286 : i64
        func.call @stack_push_nil() : () -> ()
        %3706 = func.call @stack_pop_pointer() : () -> i64
        %3707 = func.call @cc_cons(%3705, %3706) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
        %3708 = arith.addi %3707, %__rlasp_stack_elide_zero_287 : i64
        %3709 = func.call @cc_cons(%3685, %3708) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
        %3710 = arith.addi %3709, %__rlasp_stack_elide_zero_288 : i64
        %3711 = func.call @cc_values_pack(%3710) : (i64) -> i64
        %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
        %3712 = arith.addi %3711, %__rlasp_stack_elide_zero_289 : i64
        %3713 = func.call @cc_multiple_value_list(%3712) : (i64) -> i64
        %3714 = func.call @cc_t_value() : () -> i64
        %3715 = llvm.mlir.addressof @str367 : !llvm.ptr
        %3716 = arith.constant 38 : i64
        %3717 = func.call @cc_make_string(%3715, %3716) : (!llvm.ptr, i64) -> i64
        %3718 = func.call @cc_nil_value() : () -> i64
        %3719 = func.call @cc_intern(%3717, %3718) : (i64, i64) -> i64
        %3720 = func.call @cc_nil_value() : () -> i64
        %3721 = func.call @cc_cons(%3719, %3720) : (i64, i64) -> i64
        %3722 = func.call @cc_values_pack(%3721) : (i64) -> i64
        %3723 = func.call @cc_set_symbol_value(%3719, %3714) : (i64, i64) -> i64
        %3724 = llvm.mlir.addressof @str368 : !llvm.ptr
        %3725 = arith.constant 39 : i64
        %3726 = func.call @cc_make_string(%3724, %3725) : (!llvm.ptr, i64) -> i64
        %3727 = func.call @cc_nil_value() : () -> i64
        %3728 = func.call @cc_intern(%3726, %3727) : (i64, i64) -> i64
        %3729 = func.call @cc_nil_value() : () -> i64
        %3730 = func.call @cc_cons(%3728, %3729) : (i64, i64) -> i64
        %3731 = func.call @cc_values_pack(%3730) : (i64) -> i64
        %3732 = func.call @cc_set_symbol_value(%3728, %3712) : (i64, i64) -> i64
        %3733 = llvm.mlir.addressof @str369 : !llvm.ptr
        %3734 = arith.constant 40 : i64
        %3735 = func.call @cc_make_string(%3733, %3734) : (!llvm.ptr, i64) -> i64
        %3736 = func.call @cc_nil_value() : () -> i64
        %3737 = func.call @cc_intern(%3735, %3736) : (i64, i64) -> i64
        %3738 = func.call @cc_nil_value() : () -> i64
        %3739 = func.call @cc_cons(%3737, %3738) : (i64, i64) -> i64
        %3740 = func.call @cc_values_pack(%3739) : (i64) -> i64
        %3741 = func.call @cc_set_symbol_value(%3737, %3713) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
        %3742 = arith.addi %3712, %__rlasp_stack_elide_zero_290 : i64
        scf.yield %3742 : i64
      }
      %3743 = func.call @cc_nil_value() : () -> i64
      %3744 = func.call @cc_errorp(%3665) : (i64) -> i64
      %3745 = arith.cmpi ne, %3744, %3743 : i64
      %3746 = scf.if %3745 -> (i64) {
        scf.yield %3665 : i64
      } else {
        %3747 = func.call @cc_get_output_stream_string(%3368) : (i64) -> i64
        scf.yield %3747 : i64
      }
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %3748 = arith.addi %3746, %__rlasp_stack_elide_zero_291 : i64
      %3749 = func.call @cc_nil_value() : () -> i64
      %3750 = func.call @cc_errorp(%3748) : (i64) -> i64
      %3751 = arith.cmpi ne, %3750, %3749 : i64
      %3752 = scf.if %3751 -> (i64) {
        scf.yield %3748 : i64
      } else {
        %3753 = func.call @cc_get_output_stream_string(%3367) : (i64) -> i64
        scf.yield %3753 : i64
      }
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %3754 = arith.addi %3752, %__rlasp_stack_elide_zero_292 : i64
      %3755 = func.call @cc_multiple_value_list(%3754) : (i64) -> i64
      %3756 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3757 = arith.constant 38 : i64
      %3758 = func.call @cc_make_string(%3756, %3757) : (!llvm.ptr, i64) -> i64
      %3759 = func.call @cc_nil_value() : () -> i64
      %3760 = func.call @cc_intern(%3758, %3759) : (i64, i64) -> i64
      %3761 = func.call @cc_nil_value() : () -> i64
      %3762 = func.call @cc_cons(%3760, %3761) : (i64, i64) -> i64
      %3763 = func.call @cc_values_pack(%3762) : (i64) -> i64
      %3764 = func.call @cc_symbol_value(%3760) : (i64) -> i64
      %3765 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3766 = arith.constant 39 : i64
      %3767 = func.call @cc_make_string(%3765, %3766) : (!llvm.ptr, i64) -> i64
      %3768 = func.call @cc_nil_value() : () -> i64
      %3769 = func.call @cc_intern(%3767, %3768) : (i64, i64) -> i64
      %3770 = func.call @cc_nil_value() : () -> i64
      %3771 = func.call @cc_cons(%3769, %3770) : (i64, i64) -> i64
      %3772 = func.call @cc_values_pack(%3771) : (i64) -> i64
      %3773 = func.call @cc_symbol_value(%3769) : (i64) -> i64
      %3774 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3775 = arith.constant 40 : i64
      %3776 = func.call @cc_make_string(%3774, %3775) : (!llvm.ptr, i64) -> i64
      %3777 = func.call @cc_nil_value() : () -> i64
      %3778 = func.call @cc_intern(%3776, %3777) : (i64, i64) -> i64
      %3779 = func.call @cc_nil_value() : () -> i64
      %3780 = func.call @cc_cons(%3778, %3779) : (i64, i64) -> i64
      %3781 = func.call @cc_values_pack(%3780) : (i64) -> i64
      %3782 = func.call @cc_symbol_value(%3778) : (i64) -> i64
      %3783 = func.call @cc_nil_value() : () -> i64
      %3784 = arith.cmpi ne, %3764, %3783 : i64
      %3785 = scf.if %3784 -> (i64) {
        scf.yield %3782 : i64
      } else {
        scf.yield %3755 : i64
      }
      %3786 = func.call @cc_values_pack(%3785) : (i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %3787 = arith.addi %3786, %__rlasp_stack_elide_zero_293 : i64
      scf.yield %3787 : i64
    }
    func.call @stack_push_pointer(%3338) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044370"() {
    %4274 = func.call @stack_pop_pointer() : () -> i64
    %4275 = func.call @cc_nil_value() : () -> i64
    %4276 = func.call @cc_nil_value() : () -> i64
    %4277 = func.call @cc_errorp(%4275) : (i64) -> i64
    %4278 = arith.cmpi ne, %4277, %4276 : i64
    %4279 = scf.if %4278 -> (i64) {
      scf.yield %4275 : i64
    } else {
      %4280 = func.call @cc_nil_value() : () -> i64
      %4281 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4282 = arith.constant 38 : i64
      %4283 = func.call @cc_make_string(%4281, %4282) : (!llvm.ptr, i64) -> i64
      %4284 = func.call @cc_nil_value() : () -> i64
      %4285 = func.call @cc_intern(%4283, %4284) : (i64, i64) -> i64
      %4286 = func.call @cc_nil_value() : () -> i64
      %4287 = func.call @cc_cons(%4285, %4286) : (i64, i64) -> i64
      %4288 = func.call @cc_values_pack(%4287) : (i64) -> i64
      %4289 = func.call @cc_set_symbol_value(%4285, %4280) : (i64, i64) -> i64
      %4290 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4291 = arith.constant 39 : i64
      %4292 = func.call @cc_make_string(%4290, %4291) : (!llvm.ptr, i64) -> i64
      %4293 = func.call @cc_nil_value() : () -> i64
      %4294 = func.call @cc_intern(%4292, %4293) : (i64, i64) -> i64
      %4295 = func.call @cc_nil_value() : () -> i64
      %4296 = func.call @cc_cons(%4294, %4295) : (i64, i64) -> i64
      %4297 = func.call @cc_values_pack(%4296) : (i64) -> i64
      %4298 = func.call @cc_set_symbol_value(%4294, %4280) : (i64, i64) -> i64
      %4299 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4300 = arith.constant 40 : i64
      %4301 = func.call @cc_make_string(%4299, %4300) : (!llvm.ptr, i64) -> i64
      %4302 = func.call @cc_nil_value() : () -> i64
      %4303 = func.call @cc_intern(%4301, %4302) : (i64, i64) -> i64
      %4304 = func.call @cc_nil_value() : () -> i64
      %4305 = func.call @cc_cons(%4303, %4304) : (i64, i64) -> i64
      %4306 = func.call @cc_values_pack(%4305) : (i64) -> i64
      %4307 = func.call @cc_set_symbol_value(%4303, %4280) : (i64, i64) -> i64
      %4308 = func.call @cc_make_string_output_stream() : () -> i64
      %4309 = func.call @cc_make_string_output_stream() : () -> i64
      %4310 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4311 = arith.constant 0 : i64
      %4312 = func.call @cc_make_string(%4310, %4311) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %4313 = arith.addi %4312, %__rlasp_stack_elide_zero_294 : i64
      %4314 = func.call @cc_make_string_input_stream(%4313) : (i64) -> i64
      %4315 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4316 = arith.constant 8 : i64
      %4317 = func.call @cc_make_string(%4315, %4316) : (!llvm.ptr, i64) -> i64
      %4318 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4319 = arith.constant 11 : i64
      %4320 = func.call @cc_make_string(%4318, %4319) : (!llvm.ptr, i64) -> i64
      %4321 = func.call @cc_intern(%4317, %4320) : (i64, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_cons(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_values_pack(%4323) : (i64) -> i64
      %4325 = func.call @cc_symbol_value(%4321) : (i64) -> i64
      %4326 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4327 = arith.constant 6 : i64
      %4328 = func.call @cc_make_string(%4326, %4327) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4328) : (i64) -> ()
      %4329 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4330 = arith.constant 6 : i64
      %4331 = func.call @cc_make_string(%4329, %4330) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4331) : (i64) -> ()
      %4332 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4333 = arith.constant 9 : i64
      %4334 = func.call @cc_make_string(%4332, %4333) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4334) : (i64) -> ()
      %4335 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4336 = arith.constant 17 : i64
      %4337 = func.call @cc_make_string(%4335, %4336) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4337) : (i64) -> ()
      %4338 = llvm.mlir.addressof @str432 : !llvm.ptr
      %4339 = arith.constant 6 : i64
      %4340 = func.call @cc_make_string(%4338, %4339) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4340) : (i64) -> ()
      %4341 = llvm.mlir.addressof @str433 : !llvm.ptr
      %4342 = arith.constant 31 : i64
      %4343 = func.call @cc_make_string(%4341, %4342) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4343) : (i64) -> ()
      %4344 = llvm.mlir.addressof @str434 : !llvm.ptr
      %4345 = arith.constant 6 : i64
      %4346 = func.call @cc_make_string(%4344, %4345) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4346) : (i64) -> ()
      %4347 = llvm.mlir.addressof @str435 : !llvm.ptr
      %4348 = arith.constant 25 : i64
      %4349 = func.call @cc_make_string(%4347, %4348) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4349) : (i64) -> ()
      %4350 = llvm.mlir.addressof @str436 : !llvm.ptr
      %4351 = arith.constant 6 : i64
      %4352 = func.call @cc_make_string(%4350, %4351) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4352) : (i64) -> ()
      %4353 = llvm.mlir.addressof @str437 : !llvm.ptr
      %4354 = arith.constant 60 : i64
      %4355 = func.call @cc_make_string(%4353, %4354) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4355) : (i64) -> ()
      %4356 = llvm.mlir.addressof @str438 : !llvm.ptr
      %4357 = arith.constant 6 : i64
      %4358 = func.call @cc_make_string(%4356, %4357) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4358) : (i64) -> ()
      %4359 = llvm.mlir.addressof @str439 : !llvm.ptr
      %4360 = arith.constant 8 : i64
      %4361 = func.call @cc_make_string(%4359, %4360) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4361) : (i64) -> ()
      %4362 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4363 = arith.constant 6 : i64
      %4364 = func.call @cc_make_string(%4362, %4363) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4364) : (i64) -> ()
      %4365 = llvm.mlir.addressof @str441 : !llvm.ptr
      %4366 = arith.constant 2 : i64
      %4367 = func.call @cc_make_string(%4365, %4366) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4368 = func.call @stack_pop_pointer() : () -> i64
      %4369 = func.call @stack_pop_pointer() : () -> i64
      %4370 = func.call @cc_cons(%4369, %4368) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %4371 = arith.addi %4370, %__rlasp_stack_elide_zero_295 : i64
      %4372 = func.call @stack_pop_pointer() : () -> i64
      %4373 = func.call @cc_cons(%4372, %4371) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %4374 = arith.addi %4373, %__rlasp_stack_elide_zero_296 : i64
      %4375 = func.call @stack_pop_pointer() : () -> i64
      %4376 = func.call @cc_cons(%4375, %4374) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %4377 = arith.addi %4376, %__rlasp_stack_elide_zero_297 : i64
      %4378 = func.call @stack_pop_pointer() : () -> i64
      %4379 = func.call @cc_cons(%4378, %4377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %4380 = arith.addi %4379, %__rlasp_stack_elide_zero_298 : i64
      %4381 = func.call @stack_pop_pointer() : () -> i64
      %4382 = func.call @cc_cons(%4381, %4380) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %4383 = arith.addi %4382, %__rlasp_stack_elide_zero_299 : i64
      %4384 = func.call @stack_pop_pointer() : () -> i64
      %4385 = func.call @cc_cons(%4384, %4383) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %4386 = arith.addi %4385, %__rlasp_stack_elide_zero_300 : i64
      %4387 = func.call @stack_pop_pointer() : () -> i64
      %4388 = func.call @cc_cons(%4387, %4386) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %4389 = arith.addi %4388, %__rlasp_stack_elide_zero_301 : i64
      %4390 = func.call @stack_pop_pointer() : () -> i64
      %4391 = func.call @cc_cons(%4390, %4389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %4392 = arith.addi %4391, %__rlasp_stack_elide_zero_302 : i64
      %4393 = func.call @stack_pop_pointer() : () -> i64
      %4394 = func.call @cc_cons(%4393, %4392) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %4395 = arith.addi %4394, %__rlasp_stack_elide_zero_303 : i64
      %4396 = func.call @stack_pop_pointer() : () -> i64
      %4397 = func.call @cc_cons(%4396, %4395) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %4398 = arith.addi %4397, %__rlasp_stack_elide_zero_304 : i64
      %4399 = func.call @stack_pop_pointer() : () -> i64
      %4400 = func.call @cc_cons(%4399, %4398) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %4401 = arith.addi %4400, %__rlasp_stack_elide_zero_305 : i64
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = func.call @cc_cons(%4402, %4401) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %4404 = arith.addi %4403, %__rlasp_stack_elide_zero_306 : i64
      %4405 = func.call @stack_pop_pointer() : () -> i64
      %4406 = func.call @cc_cons(%4405, %4404) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %4407 = arith.addi %4406, %__rlasp_stack_elide_zero_307 : i64
      %4408 = func.call @stack_pop_pointer() : () -> i64
      %4409 = func.call @cc_cons(%4408, %4407) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %4410 = arith.addi %4409, %__rlasp_stack_elide_zero_308 : i64
      %4411 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4412 = arith.constant 5 : i64
      %4413 = func.call @cc_make_string(%4411, %4412) : (!llvm.ptr, i64) -> i64
      %4414 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4415 = arith.constant 7 : i64
      %4416 = func.call @cc_make_string(%4414, %4415) : (!llvm.ptr, i64) -> i64
      %4417 = func.call @cc_intern(%4413, %4416) : (i64, i64) -> i64
      %4418 = func.call @cc_nil_value() : () -> i64
      %4419 = func.call @cc_cons(%4417, %4418) : (i64, i64) -> i64
      %4420 = func.call @cc_values_pack(%4419) : (i64) -> i64
      %4421 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4422 = arith.constant 6 : i64
      %4423 = func.call @cc_make_string(%4421, %4422) : (!llvm.ptr, i64) -> i64
      %4424 = llvm.mlir.addressof @str445 : !llvm.ptr
      %4425 = arith.constant 7 : i64
      %4426 = func.call @cc_make_string(%4424, %4425) : (!llvm.ptr, i64) -> i64
      %4427 = func.call @cc_intern(%4423, %4426) : (i64, i64) -> i64
      %4428 = func.call @cc_nil_value() : () -> i64
      %4429 = func.call @cc_cons(%4427, %4428) : (i64, i64) -> i64
      %4430 = func.call @cc_values_pack(%4429) : (i64) -> i64
      %4431 = llvm.mlir.addressof @str446 : !llvm.ptr
      %4432 = arith.constant 5 : i64
      %4433 = func.call @cc_make_string(%4431, %4432) : (!llvm.ptr, i64) -> i64
      %4434 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4435 = arith.constant 7 : i64
      %4436 = func.call @cc_make_string(%4434, %4435) : (!llvm.ptr, i64) -> i64
      %4437 = func.call @cc_intern(%4433, %4436) : (i64, i64) -> i64
      %4438 = func.call @cc_nil_value() : () -> i64
      %4439 = func.call @cc_cons(%4437, %4438) : (i64, i64) -> i64
      %4440 = func.call @cc_values_pack(%4439) : (i64) -> i64
      %4441 = llvm.mlir.addressof @str448 : !llvm.ptr
      %4442 = arith.constant 4 : i64
      %4443 = func.call @cc_make_string(%4441, %4442) : (!llvm.ptr, i64) -> i64
      %4444 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4445 = arith.constant 7 : i64
      %4446 = func.call @cc_make_string(%4444, %4445) : (!llvm.ptr, i64) -> i64
      %4447 = func.call @cc_intern(%4443, %4446) : (i64, i64) -> i64
      %4448 = func.call @cc_nil_value() : () -> i64
      %4449 = func.call @cc_cons(%4447, %4448) : (i64, i64) -> i64
      %4450 = func.call @cc_values_pack(%4449) : (i64) -> i64
      %4451 = func.call @cc_t_value() : () -> i64
      %4452 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4453 = arith.constant 4 : i64
      %4454 = func.call @cc_make_string(%4452, %4453) : (!llvm.ptr, i64) -> i64
      %4455 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4456 = arith.constant 7 : i64
      %4457 = func.call @cc_make_string(%4455, %4456) : (!llvm.ptr, i64) -> i64
      %4458 = func.call @cc_intern(%4454, %4457) : (i64, i64) -> i64
      %4459 = func.call @cc_nil_value() : () -> i64
      %4460 = func.call @cc_cons(%4458, %4459) : (i64, i64) -> i64
      %4461 = func.call @cc_values_pack(%4460) : (i64) -> i64
      %4462 = func.call @cc_nil_value() : () -> i64
      %4463 = func.call @cc_nil_value() : () -> i64
      %4464 = func.call @cc_errorp(%4325) : (i64) -> i64
      %4465 = arith.cmpi ne, %4464, %4463 : i64
      %4466 = arith.cmpi eq, %4463, %4463 : i64
      %4467 = arith.andi %4465, %4466 : i1
      %4468 = scf.if %4467 -> (i64) {
        scf.yield %4325 : i64
      } else {
        scf.yield %4463 : i64
      }
      %4469 = func.call @cc_errorp(%4410) : (i64) -> i64
      %4470 = arith.cmpi ne, %4469, %4463 : i64
      %4471 = arith.cmpi eq, %4468, %4463 : i64
      %4472 = arith.andi %4470, %4471 : i1
      %4473 = scf.if %4472 -> (i64) {
        scf.yield %4410 : i64
      } else {
        scf.yield %4468 : i64
      }
      %4474 = func.call @cc_errorp(%4417) : (i64) -> i64
      %4475 = arith.cmpi ne, %4474, %4463 : i64
      %4476 = arith.cmpi eq, %4473, %4463 : i64
      %4477 = arith.andi %4475, %4476 : i1
      %4478 = scf.if %4477 -> (i64) {
        scf.yield %4417 : i64
      } else {
        scf.yield %4473 : i64
      }
      %4479 = func.call @cc_errorp(%4314) : (i64) -> i64
      %4480 = arith.cmpi ne, %4479, %4463 : i64
      %4481 = arith.cmpi eq, %4478, %4463 : i64
      %4482 = arith.andi %4480, %4481 : i1
      %4483 = scf.if %4482 -> (i64) {
        scf.yield %4314 : i64
      } else {
        scf.yield %4478 : i64
      }
      %4484 = func.call @cc_errorp(%4427) : (i64) -> i64
      %4485 = arith.cmpi ne, %4484, %4463 : i64
      %4486 = arith.cmpi eq, %4483, %4463 : i64
      %4487 = arith.andi %4485, %4486 : i1
      %4488 = scf.if %4487 -> (i64) {
        scf.yield %4427 : i64
      } else {
        scf.yield %4483 : i64
      }
      %4489 = func.call @cc_errorp(%4308) : (i64) -> i64
      %4490 = arith.cmpi ne, %4489, %4463 : i64
      %4491 = arith.cmpi eq, %4488, %4463 : i64
      %4492 = arith.andi %4490, %4491 : i1
      %4493 = scf.if %4492 -> (i64) {
        scf.yield %4308 : i64
      } else {
        scf.yield %4488 : i64
      }
      %4494 = func.call @cc_errorp(%4437) : (i64) -> i64
      %4495 = arith.cmpi ne, %4494, %4463 : i64
      %4496 = arith.cmpi eq, %4493, %4463 : i64
      %4497 = arith.andi %4495, %4496 : i1
      %4498 = scf.if %4497 -> (i64) {
        scf.yield %4437 : i64
      } else {
        scf.yield %4493 : i64
      }
      %4499 = func.call @cc_errorp(%4309) : (i64) -> i64
      %4500 = arith.cmpi ne, %4499, %4463 : i64
      %4501 = arith.cmpi eq, %4498, %4463 : i64
      %4502 = arith.andi %4500, %4501 : i1
      %4503 = scf.if %4502 -> (i64) {
        scf.yield %4309 : i64
      } else {
        scf.yield %4498 : i64
      }
      %4504 = func.call @cc_errorp(%4447) : (i64) -> i64
      %4505 = arith.cmpi ne, %4504, %4463 : i64
      %4506 = arith.cmpi eq, %4503, %4463 : i64
      %4507 = arith.andi %4505, %4506 : i1
      %4508 = scf.if %4507 -> (i64) {
        scf.yield %4447 : i64
      } else {
        scf.yield %4503 : i64
      }
      %4509 = func.call @cc_errorp(%4451) : (i64) -> i64
      %4510 = arith.cmpi ne, %4509, %4463 : i64
      %4511 = arith.cmpi eq, %4508, %4463 : i64
      %4512 = arith.andi %4510, %4511 : i1
      %4513 = scf.if %4512 -> (i64) {
        scf.yield %4451 : i64
      } else {
        scf.yield %4508 : i64
      }
      %4514 = func.call @cc_errorp(%4458) : (i64) -> i64
      %4515 = arith.cmpi ne, %4514, %4463 : i64
      %4516 = arith.cmpi eq, %4513, %4463 : i64
      %4517 = arith.andi %4515, %4516 : i1
      %4518 = scf.if %4517 -> (i64) {
        scf.yield %4458 : i64
      } else {
        scf.yield %4513 : i64
      }
      %4519 = func.call @cc_errorp(%4462) : (i64) -> i64
      %4520 = arith.cmpi ne, %4519, %4463 : i64
      %4521 = arith.cmpi eq, %4518, %4463 : i64
      %4522 = arith.andi %4520, %4521 : i1
      %4523 = scf.if %4522 -> (i64) {
        scf.yield %4462 : i64
      } else {
        scf.yield %4518 : i64
      }
      %4524 = arith.cmpi ne, %4523, %4463 : i64
      scf.if %4524 {
        func.call @stack_push_pointer(%4523) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4325) : (i64) -> ()
        func.call @stack_push_pointer(%4410) : (i64) -> ()
        func.call @stack_push_pointer(%4417) : (i64) -> ()
        func.call @stack_push_pointer(%4314) : (i64) -> ()
        func.call @stack_push_pointer(%4427) : (i64) -> ()
        func.call @stack_push_pointer(%4308) : (i64) -> ()
        func.call @stack_push_pointer(%4437) : (i64) -> ()
        func.call @stack_push_pointer(%4309) : (i64) -> ()
        func.call @stack_push_pointer(%4447) : (i64) -> ()
        func.call @stack_push_pointer(%4451) : (i64) -> ()
        func.call @stack_push_pointer(%4458) : (i64) -> ()
        func.call @stack_push_pointer(%4462) : (i64) -> ()
        %4525 = llvm.mlir.addressof @str452 : !llvm.ptr
        %4526 = func.call @cc_make_function_ref_const(%4525) : (!llvm.ptr) -> i64
        %4527 = arith.constant 12 : i64
        func.call @cc_funcall_stack(%4526, %4527) : (i64, i64) -> ()
      }
      %4528 = func.call @stack_pop_pointer() : () -> i64
      %4529 = func.call @cc_multiple_value_list(%4528) : (i64) -> i64
      %4530 = arith.constant 0 : i64
      %4531 = func.call @cc_box_fixnum(%4530) : (i64) -> i64
      %4532 = func.call @cc_nth(%4531, %4529) : (i64, i64) -> i64
      %4533 = arith.constant 1 : i64
      %4534 = func.call @cc_box_fixnum(%4533) : (i64) -> i64
      %4535 = func.call @cc_nth(%4534, %4529) : (i64, i64) -> i64
      %4536 = arith.constant 2 : i64
      %4537 = func.call @cc_box_fixnum(%4536) : (i64) -> i64
      %4538 = func.call @cc_nth(%4537, %4529) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %4539 = func.call @stack_depth() : () -> i64
      %4540 = arith.constant 0 : i64
      %4541 = arith.cmpi sgt, %4539, %4540 : i64
      scf.if %4541 {
        %4542 = func.call @stack_pop_pointer() : () -> i64
      }
      %4543 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4544 = func.call @cc_make_function_ref_const(%4543) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %4545 = arith.addi %4544, %__rlasp_stack_elide_zero_309 : i64
      %4546 = func.call @cc_nil_value() : () -> i64
      %4547 = arith.constant 1 : i1
      %4548 = arith.constant 0 : i1
      %4549 = arith.constant 1 : i1
      %4550:2 = scf.if %4547 -> (i64, i1) {
        %4551 = func.call @cc_nil_value() : () -> i64
        %4552 = func.call @cc_nil_value() : () -> i64
        %4553 = func.call @cc_errorp(%4551) : (i64) -> i64
        %4554 = arith.cmpi ne, %4553, %4552 : i64
        %4555 = scf.if %4554 -> (i64) {
          scf.yield %4551 : i64
        } else {
          %4556 = func.call @cc_nil_value() : () -> i64
          %4557 = func.call @cc_errorp(%4308) : (i64) -> i64
          %4558 = arith.cmpi ne, %4557, %4556 : i64
          %4559 = arith.cmpi eq, %4556, %4556 : i64
          %4560 = arith.andi %4558, %4559 : i1
          %4561 = scf.if %4560 -> (i64) {
            scf.yield %4308 : i64
          } else {
            scf.yield %4556 : i64
          }
          %4562 = arith.cmpi ne, %4561, %4556 : i64
          scf.if %4562 {
            func.call @stack_push_pointer(%4561) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4308) : (i64) -> ()
            %4563 = llvm.mlir.addressof @str454 : !llvm.ptr
            %4564 = func.call @cc_make_function_ref_const(%4563) : (!llvm.ptr) -> i64
            %4565 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4564, %4565) : (i64, i64) -> ()
          }
          %4566 = func.call @stack_pop_pointer() : () -> i64
          %4567 = func.call @cc_length(%4566) : (i64) -> i64
          %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
          %4568 = arith.addi %4567, %__rlasp_stack_elide_zero_310 : i64
          %4569 = func.call @cc_unbox_fixnum(%4568) : (i64) -> i64
          %4570 = arith.constant 0 : i64
          %4571 = arith.cmpi eq, %4569, %4570 : i64
          %4572 = func.call @cc_t_value() : () -> i64
          %4573 = func.call @cc_nil_value() : () -> i64
          %4574 = arith.select %4571, %4572, %4573 : i64
          %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
          %4575 = arith.addi %4574, %__rlasp_stack_elide_zero_311 : i64
          %4576 = func.call @cc_nil_value() : () -> i64
          %4577 = func.call @cc_errorp(%4309) : (i64) -> i64
          %4578 = arith.cmpi ne, %4577, %4576 : i64
          %4579 = arith.cmpi eq, %4576, %4576 : i64
          %4580 = arith.andi %4578, %4579 : i1
          %4581 = scf.if %4580 -> (i64) {
            scf.yield %4309 : i64
          } else {
            scf.yield %4576 : i64
          }
          %4582 = arith.cmpi ne, %4581, %4576 : i64
          scf.if %4582 {
            func.call @stack_push_pointer(%4581) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4309) : (i64) -> ()
            %4583 = llvm.mlir.addressof @str455 : !llvm.ptr
            %4584 = func.call @cc_make_function_ref_const(%4583) : (!llvm.ptr) -> i64
            %4585 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4584, %4585) : (i64, i64) -> ()
          }
          %4586 = func.call @stack_pop_pointer() : () -> i64
          %4587 = func.call @cc_length(%4586) : (i64) -> i64
          %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
          %4588 = arith.addi %4587, %__rlasp_stack_elide_zero_312 : i64
          %4589 = func.call @cc_unbox_fixnum(%4588) : (i64) -> i64
          %4590 = arith.constant 0 : i64
          %4591 = arith.cmpi eq, %4589, %4590 : i64
          %4592 = func.call @cc_t_value() : () -> i64
          %4593 = func.call @cc_nil_value() : () -> i64
          %4594 = arith.select %4591, %4592, %4593 : i64
          %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
          %4595 = arith.addi %4594, %__rlasp_stack_elide_zero_313 : i64
          func.call @stack_push_nil() : () -> ()
          %4596 = func.call @stack_pop_pointer() : () -> i64
          %4597 = func.call @cc_cons(%4595, %4596) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
          %4598 = arith.addi %4597, %__rlasp_stack_elide_zero_314 : i64
          %4599 = func.call @cc_cons(%4575, %4598) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
          %4600 = arith.addi %4599, %__rlasp_stack_elide_zero_315 : i64
          %4601 = func.call @cc_values_pack(%4600) : (i64) -> i64
          %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
          %4602 = arith.addi %4601, %__rlasp_stack_elide_zero_316 : i64
          %4603 = func.call @cc_multiple_value_list(%4602) : (i64) -> i64
          %4604 = func.call @cc_t_value() : () -> i64
          %4605 = llvm.mlir.addressof @str456 : !llvm.ptr
          %4606 = arith.constant 38 : i64
          %4607 = func.call @cc_make_string(%4605, %4606) : (!llvm.ptr, i64) -> i64
          %4608 = func.call @cc_nil_value() : () -> i64
          %4609 = func.call @cc_intern(%4607, %4608) : (i64, i64) -> i64
          %4610 = func.call @cc_nil_value() : () -> i64
          %4611 = func.call @cc_cons(%4609, %4610) : (i64, i64) -> i64
          %4612 = func.call @cc_values_pack(%4611) : (i64) -> i64
          %4613 = func.call @cc_set_symbol_value(%4609, %4604) : (i64, i64) -> i64
          %4614 = llvm.mlir.addressof @str457 : !llvm.ptr
          %4615 = arith.constant 39 : i64
          %4616 = func.call @cc_make_string(%4614, %4615) : (!llvm.ptr, i64) -> i64
          %4617 = func.call @cc_nil_value() : () -> i64
          %4618 = func.call @cc_intern(%4616, %4617) : (i64, i64) -> i64
          %4619 = func.call @cc_nil_value() : () -> i64
          %4620 = func.call @cc_cons(%4618, %4619) : (i64, i64) -> i64
          %4621 = func.call @cc_values_pack(%4620) : (i64) -> i64
          %4622 = func.call @cc_set_symbol_value(%4618, %4602) : (i64, i64) -> i64
          %4623 = llvm.mlir.addressof @str458 : !llvm.ptr
          %4624 = arith.constant 40 : i64
          %4625 = func.call @cc_make_string(%4623, %4624) : (!llvm.ptr, i64) -> i64
          %4626 = func.call @cc_nil_value() : () -> i64
          %4627 = func.call @cc_intern(%4625, %4626) : (i64, i64) -> i64
          %4628 = func.call @cc_nil_value() : () -> i64
          %4629 = func.call @cc_cons(%4627, %4628) : (i64, i64) -> i64
          %4630 = func.call @cc_values_pack(%4629) : (i64) -> i64
          %4631 = func.call @cc_set_symbol_value(%4627, %4603) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
          %4632 = arith.addi %4602, %__rlasp_stack_elide_zero_317 : i64
          scf.yield %4632 : i64
        }
        %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
        %4633 = arith.addi %4555, %__rlasp_stack_elide_zero_318 : i64
        %4634 = func.call @cc_multiple_value_list(%4633) : (i64) -> i64
        %4635 = func.call @cc_nil_value() : () -> i64
        %4636 = llvm.mlir.addressof @str459 : !llvm.ptr
        %4637 = arith.constant 38 : i64
        %4638 = func.call @cc_make_string(%4636, %4637) : (!llvm.ptr, i64) -> i64
        %4639 = func.call @cc_nil_value() : () -> i64
        %4640 = func.call @cc_intern(%4638, %4639) : (i64, i64) -> i64
        %4641 = func.call @cc_nil_value() : () -> i64
        %4642 = func.call @cc_cons(%4640, %4641) : (i64, i64) -> i64
        %4643 = func.call @cc_values_pack(%4642) : (i64) -> i64
        %4644 = func.call @cc_symbol_value(%4640) : (i64) -> i64
        %4645 = arith.cmpi ne, %4644, %4635 : i64
        %4646 = llvm.mlir.addressof @str460 : !llvm.ptr
        %4647 = arith.constant 38 : i64
        %4648 = func.call @cc_make_string(%4646, %4647) : (!llvm.ptr, i64) -> i64
        %4649 = func.call @cc_nil_value() : () -> i64
        %4650 = func.call @cc_intern(%4648, %4649) : (i64, i64) -> i64
        %4651 = func.call @cc_nil_value() : () -> i64
        %4652 = func.call @cc_cons(%4650, %4651) : (i64, i64) -> i64
        %4653 = func.call @cc_values_pack(%4652) : (i64) -> i64
        %4654 = func.call @cc_symbol_value(%4650) : (i64) -> i64
        %4655 = arith.cmpi ne, %4654, %4635 : i64
        %4656 = arith.ori %4645, %4655 : i1
        %4657:2 = scf.if %4656 -> (i64, i1) {
          %4658 = func.call @cc_values_pack(%4634) : (i64) -> i64
          func.call @stack_push_pointer(%4658) : (i64) -> ()
          scf.yield %4546, %4548 : i64, i1
        } else {
          %4659 = func.call @cc_append(%4546, %4634) : (i64, i64) -> i64
          scf.yield %4659, %4549 : i64, i1
        }
        scf.yield %4657#0, %4657#1 : i64, i1
      } else {
        scf.yield %4546, %4548 : i64, i1
      }
      %4660:2 = scf.if %4550#1 -> (i64, i1) {
        %4661 = func.call @cc_t_value() : () -> i64
        %4662 = func.call @cc_nil_value() : () -> i64
        %4663 = func.call @cc_errorp(%4538) : (i64) -> i64
        %4664 = arith.cmpi ne, %4663, %4662 : i64
        %4665 = arith.cmpi eq, %4662, %4662 : i64
        %4666 = arith.andi %4664, %4665 : i1
        %4667 = scf.if %4666 -> (i64) {
          scf.yield %4538 : i64
        } else {
          scf.yield %4662 : i64
        }
        %4668 = func.call @cc_errorp(%4661) : (i64) -> i64
        %4669 = arith.cmpi ne, %4668, %4662 : i64
        %4670 = arith.cmpi eq, %4667, %4662 : i64
        %4671 = arith.andi %4669, %4670 : i1
        %4672 = scf.if %4671 -> (i64) {
          scf.yield %4661 : i64
        } else {
          scf.yield %4667 : i64
        }
        %4673 = arith.cmpi ne, %4672, %4662 : i64
        scf.if %4673 {
          func.call @stack_push_pointer(%4672) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4538) : (i64) -> ()
          func.call @stack_push_pointer(%4661) : (i64) -> ()
          %4674 = llvm.mlir.addressof @str461 : !llvm.ptr
          %4675 = func.call @cc_make_function_ref_const(%4674) : (!llvm.ptr) -> i64
          %4676 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4675, %4676) : (i64, i64) -> ()
        }
        %4677 = func.call @stack_pop_pointer() : () -> i64
        %4678 = func.call @cc_multiple_value_list(%4677) : (i64) -> i64
        %4679 = func.call @cc_nil_value() : () -> i64
        %4680 = llvm.mlir.addressof @str462 : !llvm.ptr
        %4681 = arith.constant 38 : i64
        %4682 = func.call @cc_make_string(%4680, %4681) : (!llvm.ptr, i64) -> i64
        %4683 = func.call @cc_nil_value() : () -> i64
        %4684 = func.call @cc_intern(%4682, %4683) : (i64, i64) -> i64
        %4685 = func.call @cc_nil_value() : () -> i64
        %4686 = func.call @cc_cons(%4684, %4685) : (i64, i64) -> i64
        %4687 = func.call @cc_values_pack(%4686) : (i64) -> i64
        %4688 = func.call @cc_symbol_value(%4684) : (i64) -> i64
        %4689 = arith.cmpi ne, %4688, %4679 : i64
        %4690 = llvm.mlir.addressof @str463 : !llvm.ptr
        %4691 = arith.constant 38 : i64
        %4692 = func.call @cc_make_string(%4690, %4691) : (!llvm.ptr, i64) -> i64
        %4693 = func.call @cc_nil_value() : () -> i64
        %4694 = func.call @cc_intern(%4692, %4693) : (i64, i64) -> i64
        %4695 = func.call @cc_nil_value() : () -> i64
        %4696 = func.call @cc_cons(%4694, %4695) : (i64, i64) -> i64
        %4697 = func.call @cc_values_pack(%4696) : (i64) -> i64
        %4698 = func.call @cc_symbol_value(%4694) : (i64) -> i64
        %4699 = arith.cmpi ne, %4698, %4679 : i64
        %4700 = arith.ori %4689, %4699 : i1
        %4701:2 = scf.if %4700 -> (i64, i1) {
          %4702 = func.call @cc_values_pack(%4678) : (i64) -> i64
          func.call @stack_push_pointer(%4702) : (i64) -> ()
          scf.yield %4550#0, %4548 : i64, i1
        } else {
          %4703 = func.call @cc_append(%4550#0, %4678) : (i64, i64) -> i64
          scf.yield %4703, %4549 : i64, i1
        }
        scf.yield %4701#0, %4701#1 : i64, i1
      } else {
        scf.yield %4550#0, %4548 : i64, i1
      }
      scf.if %4660#1 {
        %4704 = func.call @cc_apply(%4545, %4660#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4704) : (i64) -> ()
      } else {
      }
      %4705 = func.call @stack_pop_pointer() : () -> i64
      %4706 = func.call @cc_nil_value() : () -> i64
      %4707 = func.call @cc_errorp(%4705) : (i64) -> i64
      %4708 = arith.cmpi ne, %4707, %4706 : i64
      %4709 = scf.if %4708 -> (i64) {
        scf.yield %4705 : i64
      } else {
        %4710 = func.call @cc_get_output_stream_string(%4309) : (i64) -> i64
        scf.yield %4710 : i64
      }
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %4711 = arith.addi %4709, %__rlasp_stack_elide_zero_319 : i64
      %4712 = func.call @cc_nil_value() : () -> i64
      %4713 = func.call @cc_errorp(%4711) : (i64) -> i64
      %4714 = arith.cmpi ne, %4713, %4712 : i64
      %4715 = scf.if %4714 -> (i64) {
        scf.yield %4711 : i64
      } else {
        %4716 = func.call @cc_get_output_stream_string(%4308) : (i64) -> i64
        scf.yield %4716 : i64
      }
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %4717 = arith.addi %4715, %__rlasp_stack_elide_zero_320 : i64
      %4718 = func.call @cc_multiple_value_list(%4717) : (i64) -> i64
      %4719 = llvm.mlir.addressof @str464 : !llvm.ptr
      %4720 = arith.constant 38 : i64
      %4721 = func.call @cc_make_string(%4719, %4720) : (!llvm.ptr, i64) -> i64
      %4722 = func.call @cc_nil_value() : () -> i64
      %4723 = func.call @cc_intern(%4721, %4722) : (i64, i64) -> i64
      %4724 = func.call @cc_nil_value() : () -> i64
      %4725 = func.call @cc_cons(%4723, %4724) : (i64, i64) -> i64
      %4726 = func.call @cc_values_pack(%4725) : (i64) -> i64
      %4727 = func.call @cc_symbol_value(%4723) : (i64) -> i64
      %4728 = llvm.mlir.addressof @str465 : !llvm.ptr
      %4729 = arith.constant 39 : i64
      %4730 = func.call @cc_make_string(%4728, %4729) : (!llvm.ptr, i64) -> i64
      %4731 = func.call @cc_nil_value() : () -> i64
      %4732 = func.call @cc_intern(%4730, %4731) : (i64, i64) -> i64
      %4733 = func.call @cc_nil_value() : () -> i64
      %4734 = func.call @cc_cons(%4732, %4733) : (i64, i64) -> i64
      %4735 = func.call @cc_values_pack(%4734) : (i64) -> i64
      %4736 = func.call @cc_symbol_value(%4732) : (i64) -> i64
      %4737 = llvm.mlir.addressof @str466 : !llvm.ptr
      %4738 = arith.constant 40 : i64
      %4739 = func.call @cc_make_string(%4737, %4738) : (!llvm.ptr, i64) -> i64
      %4740 = func.call @cc_nil_value() : () -> i64
      %4741 = func.call @cc_intern(%4739, %4740) : (i64, i64) -> i64
      %4742 = func.call @cc_nil_value() : () -> i64
      %4743 = func.call @cc_cons(%4741, %4742) : (i64, i64) -> i64
      %4744 = func.call @cc_values_pack(%4743) : (i64) -> i64
      %4745 = func.call @cc_symbol_value(%4741) : (i64) -> i64
      %4746 = func.call @cc_nil_value() : () -> i64
      %4747 = arith.cmpi ne, %4727, %4746 : i64
      %4748 = scf.if %4747 -> (i64) {
        scf.yield %4745 : i64
      } else {
        scf.yield %4718 : i64
      }
      %4749 = func.call @cc_values_pack(%4748) : (i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %4750 = arith.addi %4749, %__rlasp_stack_elide_zero_321 : i64
      scf.yield %4750 : i64
    }
    func.call @stack_push_pointer(%4279) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1("COMMON-LISP:STREAM\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_263377075044352*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_263377075044352*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_263377075044352*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_263377075044353*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_263377075044353*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_263377075044353*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_263377075044352*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETFLAG_263377075044353*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str10("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str13("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETFLAG_263377075044353*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETVALUE_263377075044353*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETMVLIST_263377075044353*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETFLAG_263377075044353*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETVALUE_263377075044353*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETMVLIST_263377075044353*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETFLAG_263377075044352*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_263377075044352*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str23("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETVALUE_263377075044354*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETMVLIST_263377075044354*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str27("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str29("si:argv\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("*PROGRAM-FILENAME*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str31("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str32("RUN-PROGRAM-ARGCOUNT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str33("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str34("ARGCOUNT-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str35("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str36("b c\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str37("d \5C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str38("e 4\5C\0A\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str39("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str40("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str42("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str43("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str44("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str45("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("(defparameter *args-number* 18)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str47("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str48("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str49("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str51("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str52("(ARGCOUNT-TEST)\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str53("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str54("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str55("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str56("b c\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str57("d \5C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str58("e 4\5C\0A\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str59("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str64("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str66("#:%%DYN-CELL-263377075044356-ARGCOUNT-TEST\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str67("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str68("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str73("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str75("OUTPUT-STREAMS.1\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str76("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str77("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str78("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str82("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str87("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str88("EXTERNAL-PROCESS-ERROR-STREAM\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str89("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str90("PROCESS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str94("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str95("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str96("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str97("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str98("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str100("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str101("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str102("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str103("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str104("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str105("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str106("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str107("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str109("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str110("(PRINT-TEST)\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str111("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str112("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str113("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str114("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str118("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str119("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str120("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str125("ext::external-process-error-stream\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str126("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str127("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str128("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str129("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str130("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str131("#:%%DYN-CELL-263377075044358-PRINT-TEST\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str132("#:%%DYN-CELL-263377075044359-PROCESS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str133("Hello stdout\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str134("Hello stderr\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str135("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str136("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str142("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str143("OUTPUT-STREAMS.2\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str144("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str145("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str146("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str147("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str148("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str149("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str155("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str156("EXTERNAL-PROCESS-ERROR-STREAM\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str157("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str158("PROCESS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str160("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str162("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str163("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str164("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str165("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str166("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str168("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str170("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str171("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str172("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str173("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str174("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str175("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str176("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str177("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str178("(PRINT-TEST)\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str179("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str180("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str181("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str183("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str184("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str188("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str189("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str192("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str193("ext::external-process-error-stream\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str194("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str195("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str196("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str197("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str198("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str199("#:%%DYN-CELL-263377075044361-PRINT-TEST\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str200("#:%%DYN-CELL-263377075044362-PROCESS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str201("Hello stderr\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str202("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str203("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str204("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str206("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str207("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str208("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str209("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str210("INTERACTIVE-INPUT.1\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str211("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str212("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str213("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str214("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str216("42~%\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str217("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str218("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str220("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str221("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str222("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str223("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str224("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str225("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str226("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str227("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str228("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str229("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str230("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str231("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str232("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str233("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str237("42~%\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str238("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str239("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str240("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str241("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str242("#:%%DYN-CELL-263377075044364-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str243("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str244("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str245("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str247("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str248("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str249("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str250("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str251("INTERACTIVE-INPUT.2\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str252("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str253("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str254("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str255("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str256("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str257("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str258("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str259("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str260("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str261("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str262("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str263("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str264("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str265("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str266("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str267("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str268("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str269("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str270("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str271("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str272("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str273("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str274("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str275("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str276("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str277("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str278("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str279("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str280("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str281("#:%%DYN-CELL-263377075044366-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str282("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str283("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str284("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str286("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str287("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str288("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str289("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str290("NON-FD-STREAMS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str291("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str292("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str293("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str295("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str296("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str298("WITH-INPUT-FROM-STRING\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str299("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str300("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str301("42 \00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str302("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str303("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str304("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str305("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str306("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str307("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str308("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str309("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str310("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str313("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str315("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str317("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str318("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str319("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str323("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str326("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str327("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str328("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str329("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str330("*__MLIR_BLOCK_RETFLAG_263377075044368*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str331("*__MLIR_BLOCK_RETVALUE_263377075044368*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str332("*__MLIR_BLOCK_RETMVLIST_263377075044368*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str333("42 \00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str334("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str335("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str337("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str338("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str339("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str340("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str341("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str342("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str343("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str344("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str345("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str346("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str347("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str348("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str349("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str350("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str351("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str352("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str353("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str354("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str355("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str357("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str358("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str359("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str360("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str361("*__MLIR_BLOCK_RETFLAG_263377075044368*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str362("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str363("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str364("*__MLIR_BLOCK_RETFLAG_263377075044368*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str365("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str366("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str367("*__MLIR_BLOCK_RETFLAG_263377075044368*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str368("*__MLIR_BLOCK_RETVALUE_263377075044368*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str369("*__MLIR_BLOCK_RETMVLIST_263377075044368*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str370("*__MLIR_BLOCK_RETFLAG_263377075044368*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str371("*__MLIR_BLOCK_RETVALUE_263377075044368*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str372("*__MLIR_BLOCK_RETMVLIST_263377075044368*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str373("#:%%DYN-CELL-263377075044369-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str374("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str375("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str376("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str377("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str378("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str379("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str380("EMPTY-STRING-INPUT-STREAM\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str381("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str382("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str383("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str385("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str386("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str387("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str388("WITH-INPUT-FROM-STRING\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str389("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str390("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str391("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str392("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str393("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str394("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str395("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str396("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str397("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str398("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str399("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str400("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str401("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str402("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str403("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str404("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str405("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str406("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str407("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str408("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str409("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str410("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str411("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str412("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str413("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str414("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str415("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str416("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str417("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str418("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str419("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str420("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str422("*__MLIR_BLOCK_RETFLAG_263377075044371*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str423("*__MLIR_BLOCK_RETVALUE_263377075044371*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str424("*__MLIR_BLOCK_RETMVLIST_263377075044371*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str425("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str426("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str427("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str428("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str429("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str430("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str431("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str432("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str433("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str434("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str435("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str436("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str437("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str438("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str439("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str440("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str441("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str442("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str443("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str444("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str445("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str446("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str447("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str448("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str449("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str450("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str451("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str452("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str454("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str455("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str456("*__MLIR_BLOCK_RETFLAG_263377075044371*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str457("*__MLIR_BLOCK_RETVALUE_263377075044371*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str458("*__MLIR_BLOCK_RETMVLIST_263377075044371*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str459("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str460("*__MLIR_BLOCK_RETFLAG_263377075044371*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str461("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str462("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str463("*__MLIR_BLOCK_RETFLAG_263377075044371*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str464("*__MLIR_BLOCK_RETFLAG_263377075044371*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str465("*__MLIR_BLOCK_RETVALUE_263377075044371*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str466("*__MLIR_BLOCK_RETMVLIST_263377075044371*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str467("#:%%DYN-CELL-263377075044372-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str468("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str469("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str470("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str471("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str472("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str473("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str474("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str475("*__MLIR_BLOCK_RETMVLIST_263377075044354*\00") : !llvm.array<41 x i8>
}
