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
  func.func @"%FN%%string-char-codes"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 18 : i64
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
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = llvm.mlir.addressof @str2 : !llvm.ptr
    %15 = arith.constant 37 : i64
    %16 = func.call @cc_make_string(%14, %15) : (!llvm.ptr, i64) -> i64
    %17 = func.call @cc_nil_value() : () -> i64
    %18 = func.call @cc_intern(%16, %17) : (i64, i64) -> i64
    %19 = func.call @cc_nil_value() : () -> i64
    %20 = func.call @cc_cons(%18, %19) : (i64, i64) -> i64
    %21 = func.call @cc_values_pack(%20) : (i64) -> i64
    %22 = func.call @cc_set_symbol_value(%18, %13) : (i64, i64) -> i64
    %23 = llvm.mlir.addressof @str3 : !llvm.ptr
    %24 = arith.constant 38 : i64
    %25 = func.call @cc_make_string(%23, %24) : (!llvm.ptr, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_intern(%25, %26) : (i64, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_cons(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_values_pack(%29) : (i64) -> i64
    %31 = func.call @cc_set_symbol_value(%27, %13) : (i64, i64) -> i64
    %32 = llvm.mlir.addressof @str4 : !llvm.ptr
    %33 = arith.constant 39 : i64
    %34 = func.call @cc_make_string(%32, %33) : (!llvm.ptr, i64) -> i64
    %35 = func.call @cc_nil_value() : () -> i64
    %36 = func.call @cc_intern(%34, %35) : (i64, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_cons(%36, %37) : (i64, i64) -> i64
    %39 = func.call @cc_values_pack(%38) : (i64) -> i64
    %40 = func.call @cc_set_symbol_value(%36, %13) : (i64, i64) -> i64
    %41 = func.call @cc_nil_value() : () -> i64
    %42 = arith.constant 0 : i64
    %43 = func.call @cc_box_fixnum(%42) : (i64) -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_errorp(%45) : (i64) -> i64
    %48 = arith.cmpi ne, %47, %46 : i64
    %49 = scf.if %48 -> (i64) {
      scf.yield %45 : i64
    } else {
      %50 = func.call @cc_nil_value() : () -> i64
      %51 = llvm.mlir.addressof @str5 : !llvm.ptr
      %52 = arith.constant 37 : i64
      %53 = func.call @cc_make_string(%51, %52) : (!llvm.ptr, i64) -> i64
      %54 = func.call @cc_nil_value() : () -> i64
      %55 = func.call @cc_intern(%53, %54) : (i64, i64) -> i64
      %56 = func.call @cc_nil_value() : () -> i64
      %57 = func.call @cc_cons(%55, %56) : (i64, i64) -> i64
      %58 = func.call @cc_values_pack(%57) : (i64) -> i64
      %59 = func.call @cc_set_symbol_value(%55, %50) : (i64, i64) -> i64
      %60 = llvm.mlir.addressof @str6 : !llvm.ptr
      %61 = arith.constant 38 : i64
      %62 = func.call @cc_make_string(%60, %61) : (!llvm.ptr, i64) -> i64
      %63 = func.call @cc_nil_value() : () -> i64
      %64 = func.call @cc_intern(%62, %63) : (i64, i64) -> i64
      %65 = func.call @cc_nil_value() : () -> i64
      %66 = func.call @cc_cons(%64, %65) : (i64, i64) -> i64
      %67 = func.call @cc_values_pack(%66) : (i64) -> i64
      %68 = func.call @cc_set_symbol_value(%64, %50) : (i64, i64) -> i64
      %69 = llvm.mlir.addressof @str7 : !llvm.ptr
      %70 = arith.constant 39 : i64
      %71 = func.call @cc_make_string(%69, %70) : (!llvm.ptr, i64) -> i64
      %72 = func.call @cc_nil_value() : () -> i64
      %73 = func.call @cc_intern(%71, %72) : (i64, i64) -> i64
      %74 = func.call @cc_nil_value() : () -> i64
      %75 = func.call @cc_cons(%73, %74) : (i64, i64) -> i64
      %76 = func.call @cc_values_pack(%75) : (i64) -> i64
      %77 = func.call @cc_set_symbol_value(%73, %50) : (i64, i64) -> i64
      %78:3 = scf.while (%arg0 = %41, %arg1 = %44, %arg2 = %43) : (i64, i64, i64) -> (i64, i64, i64) {
        %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
        %79 = arith.addi %arg2, %__rlasp_stack_elide_zero_0 : i64
        %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
        %80 = arith.addi %12, %__rlasp_stack_elide_zero_1 : i64
        %81 = func.call @cc_length(%80) : (i64) -> i64
        %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
        %82 = arith.addi %81, %__rlasp_stack_elide_zero_2 : i64
        %83 = arith.constant 1 : i1
        %85 = arith.constant 3 : i64
        %84 = arith.andi %79, %85 : i64
        %86 = arith.constant 0 : i64
        %87 = arith.cmpi eq, %84, %86 : i64
        %89 = arith.constant 3 : i64
        %88 = arith.andi %82, %89 : i64
        %90 = arith.constant 0 : i64
        %91 = arith.cmpi eq, %88, %90 : i64
        %92 = arith.andi %87, %91 : i1
        %93 = scf.if %92 -> (i1) {
          %94 = arith.constant 2 : i64
          %95 = arith.shrsi %79, %94 : i64
          %96 = arith.constant 2 : i64
          %97 = arith.shrsi %82, %96 : i64
          %98 = arith.cmpi slt, %95, %97 : i64
          scf.yield %98 : i1
        } else {
          %99 = func.call @cc_lt(%79, %82) : (i64, i64) -> i64
          %100 = func.call @cc_nil_value() : () -> i64
          %101 = arith.cmpi ne, %99, %100 : i64
          scf.yield %101 : i1
        }
        %102 = arith.andi %83, %93 : i1
        %103 = func.call @cc_nil_value() : () -> i64
        %104 = func.call @cc_t_value() : () -> i64
        %105 = scf.if %102 -> (i64) {
          scf.yield %104 : i64
        } else {
          scf.yield %103 : i64
        }
        %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
        %106 = arith.addi %105, %__rlasp_stack_elide_zero_3 : i64
        %107 = func.call @cc_nil_value() : () -> i64
        %108 = arith.cmpi ne, %106, %107 : i64
        %109 = func.call @cc_nil_value() : () -> i64
        %110 = llvm.mlir.addressof @str8 : !llvm.ptr
        %111 = arith.constant 37 : i64
        %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
        %113 = func.call @cc_nil_value() : () -> i64
        %114 = func.call @cc_intern(%112, %113) : (i64, i64) -> i64
        %115 = func.call @cc_nil_value() : () -> i64
        %116 = func.call @cc_cons(%114, %115) : (i64, i64) -> i64
        %117 = func.call @cc_values_pack(%116) : (i64) -> i64
        %118 = func.call @cc_symbol_value(%114) : (i64) -> i64
        %119 = arith.cmpi ne, %118, %109 : i64
        %120 = llvm.mlir.addressof @str9 : !llvm.ptr
        %121 = arith.constant 37 : i64
        %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
        %123 = func.call @cc_nil_value() : () -> i64
        %124 = func.call @cc_intern(%122, %123) : (i64, i64) -> i64
        %125 = func.call @cc_nil_value() : () -> i64
        %126 = func.call @cc_cons(%124, %125) : (i64, i64) -> i64
        %127 = func.call @cc_values_pack(%126) : (i64) -> i64
        %128 = func.call @cc_symbol_value(%124) : (i64) -> i64
        %129 = arith.cmpi ne, %128, %109 : i64
        %130 = arith.ori %119, %129 : i1
        %131 = arith.constant 0 : i1
        %132 = arith.cmpi eq, %130, %131 : i1
        %133 = arith.andi %108, %132 : i1
        scf.condition(%133) %arg0, %arg1, %arg2 : i64, i64, i64
      } do {
        ^bb0(%134: i64, %135: i64, %136: i64):
        %137 = func.call @cc_nil_value() : () -> i64
        %138 = func.call @cc_nil_value() : () -> i64
        %139 = func.call @cc_errorp(%137) : (i64) -> i64
        %140 = arith.cmpi ne, %139, %138 : i64
        %141:3 = scf.if %140 -> (i64, i64, i64) {
          scf.yield %137, %135, %134 : i64, i64, i64
        } else {
          func.call @stack_push_pointer(%12) : (i64) -> ()
          %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
          %142 = arith.addi %136, %__rlasp_stack_elide_zero_4 : i64
          %143 = func.call @stack_pop_pointer() : () -> i64
          %144 = func.call @cc_elt(%143, %142) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
          %145 = arith.addi %144, %__rlasp_stack_elide_zero_5 : i64
          %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
          %146 = arith.addi %145, %__rlasp_stack_elide_zero_6 : i64
          scf.yield %146, %135, %145 : i64, i64, i64
        }
        %147 = func.call @cc_nil_value() : () -> i64
        %148 = func.call @cc_errorp(%141#0) : (i64) -> i64
        %149 = arith.cmpi ne, %148, %147 : i64
        %150:3 = scf.if %149 -> (i64, i64, i64) {
          scf.yield %141#0, %141#1, %141#2 : i64, i64, i64
        } else {
          func.call @stack_push_pointer(%141#1) : (i64) -> ()
          %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
          %151 = arith.addi %141#2, %__rlasp_stack_elide_zero_7 : i64
          %152 = func.call @cc_unbox_character(%151) : (i64) -> i64
          %153 = func.call @cc_box_fixnum(%152) : (i64) -> i64
          %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
          %154 = arith.addi %153, %__rlasp_stack_elide_zero_8 : i64
          %155 = func.call @cc_nil_value() : () -> i64
          %156 = func.call @cc_errorp(%154) : (i64) -> i64
          %157 = arith.cmpi ne, %156, %155 : i64
          %158 = arith.cmpi eq, %155, %155 : i64
          %159 = arith.andi %157, %158 : i1
          %160 = scf.if %159 -> (i64) {
            scf.yield %154 : i64
          } else {
            scf.yield %155 : i64
          }
          %161 = arith.cmpi ne, %160, %155 : i64
          scf.if %161 {
            func.call @stack_push_pointer(%160) : (i64) -> ()
          } else {
            %162 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%162) : (i64) -> ()
            %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
            %163 = arith.addi %154, %__rlasp_stack_elide_zero_9 : i64
            %164 = func.call @stack_pop_pointer() : () -> i64
            %165 = func.call @cc_cons(%163, %164) : (i64, i64) -> i64
            func.call @stack_push_pointer(%165) : (i64) -> ()
          }
          %166 = func.call @stack_pop_pointer() : () -> i64
          %167 = func.call @stack_pop_pointer() : () -> i64
          %168 = func.call @cc_append(%167, %166) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
          %169 = arith.addi %168, %__rlasp_stack_elide_zero_10 : i64
          %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
          %170 = arith.addi %169, %__rlasp_stack_elide_zero_11 : i64
          scf.yield %170, %169, %141#2 : i64, i64, i64
        }
        func.call @stack_push_pointer(%150#0) : (i64) -> ()
        %171 = func.call @stack_depth() : () -> i64
        %172 = arith.constant 0 : i64
        %173 = arith.cmpi sgt, %171, %172 : i64
        scf.if %173 {
          %174 = func.call @stack_pop_pointer() : () -> i64
        }
        %175 = arith.constant 1 : i64
        %176 = func.call @cc_box_fixnum(%175) : (i64) -> i64
        %178 = arith.constant 3 : i64
        %177 = arith.andi %136, %178 : i64
        %179 = arith.constant 0 : i64
        %180 = arith.cmpi eq, %177, %179 : i64
        %182 = arith.constant 3 : i64
        %181 = arith.andi %176, %182 : i64
        %183 = arith.constant 0 : i64
        %184 = arith.cmpi eq, %181, %183 : i64
        %185 = arith.andi %180, %184 : i1
        %186 = scf.if %185 -> (i64) {
          %187 = arith.constant 2 : i64
          %188 = arith.shrsi %136, %187 : i64
          %189 = arith.constant 2 : i64
          %190 = arith.shrsi %176, %189 : i64
          %191 = arith.addi %188, %190 : i64
          %192 = arith.constant -2305843009213693952 : i64
          %193 = arith.constant 2305843009213693951 : i64
          %194 = arith.cmpi sge, %191, %192 : i64
          %195 = arith.cmpi sle, %191, %193 : i64
          %196 = arith.andi %194, %195 : i1
          %197 = scf.if %196 -> (i64) {
            %198 = arith.constant 2 : i64
            %199 = arith.shli %191, %198 : i64
            scf.yield %199 : i64
          } else {
            %200 = func.call @cc_add(%136, %176) : (i64, i64) -> i64
            scf.yield %200 : i64
          }
          scf.yield %197 : i64
        } else {
          %201 = func.call @cc_add(%136, %176) : (i64, i64) -> i64
          scf.yield %201 : i64
        }
        %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
        %202 = arith.addi %186, %__rlasp_stack_elide_zero_12 : i64
        func.call @stack_push_pointer(%202) : (i64) -> ()
        %203 = func.call @stack_depth() : () -> i64
        %204 = arith.constant 0 : i64
        %205 = arith.cmpi sgt, %203, %204 : i64
        scf.if %205 {
          %206 = func.call @stack_pop_pointer() : () -> i64
        }
        scf.yield %150#2, %150#1, %202 : i64, i64, i64
      }
      func.call @stack_push_nil() : () -> ()
      %207 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %208 = arith.addi %78#1, %__rlasp_stack_elide_zero_13 : i64
      %209 = func.call @cc_multiple_value_list(%208) : (i64) -> i64
      %210 = llvm.mlir.addressof @str10 : !llvm.ptr
      %211 = arith.constant 37 : i64
      %212 = func.call @cc_make_string(%210, %211) : (!llvm.ptr, i64) -> i64
      %213 = func.call @cc_nil_value() : () -> i64
      %214 = func.call @cc_intern(%212, %213) : (i64, i64) -> i64
      %215 = func.call @cc_nil_value() : () -> i64
      %216 = func.call @cc_cons(%214, %215) : (i64, i64) -> i64
      %217 = func.call @cc_values_pack(%216) : (i64) -> i64
      %218 = func.call @cc_symbol_value(%214) : (i64) -> i64
      %219 = llvm.mlir.addressof @str11 : !llvm.ptr
      %220 = arith.constant 38 : i64
      %221 = func.call @cc_make_string(%219, %220) : (!llvm.ptr, i64) -> i64
      %222 = func.call @cc_nil_value() : () -> i64
      %223 = func.call @cc_intern(%221, %222) : (i64, i64) -> i64
      %224 = func.call @cc_nil_value() : () -> i64
      %225 = func.call @cc_cons(%223, %224) : (i64, i64) -> i64
      %226 = func.call @cc_values_pack(%225) : (i64) -> i64
      %227 = func.call @cc_symbol_value(%223) : (i64) -> i64
      %228 = llvm.mlir.addressof @str12 : !llvm.ptr
      %229 = arith.constant 39 : i64
      %230 = func.call @cc_make_string(%228, %229) : (!llvm.ptr, i64) -> i64
      %231 = func.call @cc_nil_value() : () -> i64
      %232 = func.call @cc_intern(%230, %231) : (i64, i64) -> i64
      %233 = func.call @cc_nil_value() : () -> i64
      %234 = func.call @cc_cons(%232, %233) : (i64, i64) -> i64
      %235 = func.call @cc_values_pack(%234) : (i64) -> i64
      %236 = func.call @cc_symbol_value(%232) : (i64) -> i64
      %237 = func.call @cc_nil_value() : () -> i64
      %238 = arith.cmpi ne, %218, %237 : i64
      %239 = scf.if %238 -> (i64) {
        scf.yield %236 : i64
      } else {
        scf.yield %209 : i64
      }
      %240 = func.call @cc_values_pack(%239) : (i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %241 = arith.addi %240, %__rlasp_stack_elide_zero_14 : i64
      scf.yield %241 : i64
    }
    %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
    %242 = arith.addi %49, %__rlasp_stack_elide_zero_15 : i64
    %243 = func.call @cc_multiple_value_list(%242) : (i64) -> i64
    %244 = llvm.mlir.addressof @str13 : !llvm.ptr
    %245 = arith.constant 37 : i64
    %246 = func.call @cc_make_string(%244, %245) : (!llvm.ptr, i64) -> i64
    %247 = func.call @cc_nil_value() : () -> i64
    %248 = func.call @cc_intern(%246, %247) : (i64, i64) -> i64
    %249 = func.call @cc_nil_value() : () -> i64
    %250 = func.call @cc_cons(%248, %249) : (i64, i64) -> i64
    %251 = func.call @cc_values_pack(%250) : (i64) -> i64
    %252 = func.call @cc_symbol_value(%248) : (i64) -> i64
    %253 = llvm.mlir.addressof @str14 : !llvm.ptr
    %254 = arith.constant 39 : i64
    %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
    %256 = func.call @cc_nil_value() : () -> i64
    %257 = func.call @cc_intern(%255, %256) : (i64, i64) -> i64
    %258 = func.call @cc_nil_value() : () -> i64
    %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
    %260 = func.call @cc_values_pack(%259) : (i64) -> i64
    %261 = func.call @cc_symbol_value(%257) : (i64) -> i64
    %262 = func.call @cc_nil_value() : () -> i64
    %263 = arith.cmpi ne, %252, %262 : i64
    %264 = scf.if %263 -> (i64) {
      scf.yield %261 : i64
    } else {
      scf.yield %243 : i64
    }
    %265 = func.call @cc_values_pack(%264) : (i64) -> i64
    func.call @stack_push_pointer(%265) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %266 = llvm.mlir.addressof @str15 : !llvm.ptr
    %267 = arith.constant 6 : i64
    %268 = func.call @cc_make_string(%266, %267) : (!llvm.ptr, i64) -> i64
    %269 = func.call @cc_nil_value() : () -> i64
    %270 = func.call @cc_intern(%268, %269) : (i64, i64) -> i64
    %271 = func.call @cc_nil_value() : () -> i64
    %272 = func.call @cc_cons(%270, %271) : (i64, i64) -> i64
    %273 = func.call @cc_values_pack(%272) : (i64) -> i64
    %274 = func.call @cc_nil_value() : () -> i64
    %275 = llvm.mlir.addressof @str16 : !llvm.ptr
    %276 = arith.constant 37 : i64
    %277 = func.call @cc_make_string(%275, %276) : (!llvm.ptr, i64) -> i64
    %278 = func.call @cc_nil_value() : () -> i64
    %279 = func.call @cc_intern(%277, %278) : (i64, i64) -> i64
    %280 = func.call @cc_nil_value() : () -> i64
    %281 = func.call @cc_cons(%279, %280) : (i64, i64) -> i64
    %282 = func.call @cc_values_pack(%281) : (i64) -> i64
    %283 = func.call @cc_set_symbol_value(%279, %274) : (i64, i64) -> i64
    %284 = llvm.mlir.addressof @str17 : !llvm.ptr
    %285 = arith.constant 38 : i64
    %286 = func.call @cc_make_string(%284, %285) : (!llvm.ptr, i64) -> i64
    %287 = func.call @cc_nil_value() : () -> i64
    %288 = func.call @cc_intern(%286, %287) : (i64, i64) -> i64
    %289 = func.call @cc_nil_value() : () -> i64
    %290 = func.call @cc_cons(%288, %289) : (i64, i64) -> i64
    %291 = func.call @cc_values_pack(%290) : (i64) -> i64
    %292 = func.call @cc_set_symbol_value(%288, %274) : (i64, i64) -> i64
    %293 = llvm.mlir.addressof @str18 : !llvm.ptr
    %294 = arith.constant 39 : i64
    %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
    %296 = func.call @cc_nil_value() : () -> i64
    %297 = func.call @cc_intern(%295, %296) : (i64, i64) -> i64
    %298 = func.call @cc_nil_value() : () -> i64
    %299 = func.call @cc_cons(%297, %298) : (i64, i64) -> i64
    %300 = func.call @cc_values_pack(%299) : (i64) -> i64
    %301 = func.call @cc_set_symbol_value(%297, %274) : (i64, i64) -> i64
    %302 = func.call @cc_nil_value() : () -> i64
    %303 = func.call @cc_nil_value() : () -> i64
    %304 = func.call @cc_errorp(%302) : (i64) -> i64
    %305 = arith.cmpi ne, %304, %303 : i64
    %306 = scf.if %305 -> (i64) {
      scf.yield %302 : i64
    } else {
      %307 = llvm.mlir.addressof @str19 : !llvm.ptr
      %308 = arith.constant 11 : i64
      %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_intern(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_values_pack(%313) : (i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %315 = arith.addi %311, %__rlasp_stack_elide_zero_16 : i64
      %316 = func.call @cc_in_package(%315) : (i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %317 = arith.addi %316, %__rlasp_stack_elide_zero_17 : i64
      scf.yield %317 : i64
    }
    %318 = func.call @cc_nil_value() : () -> i64
    %319 = func.call @cc_errorp(%306) : (i64) -> i64
    %320 = arith.cmpi ne, %319, %318 : i64
    %321 = scf.if %320 -> (i64) {
      scf.yield %306 : i64
    } else {
      %322 = func.call @cc_nil_value() : () -> i64
      %323 = func.call @cc_nil_value() : () -> i64
      %324 = func.call @cc_errorp(%322) : (i64) -> i64
      %325 = arith.cmpi ne, %324, %323 : i64
      %326 = scf.if %325 -> (i64) {
        scf.yield %322 : i64
      } else {
        %327 = llvm.mlir.addressof @str20 : !llvm.ptr
        %328 = arith.constant 9 : i64
        %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
        %330 = llvm.mlir.addressof @str21 : !llvm.ptr
        %331 = arith.constant 7 : i64
        %332 = func.call @cc_make_string(%330, %331) : (!llvm.ptr, i64) -> i64
        %333 = func.call @cc_intern(%329, %332) : (i64, i64) -> i64
        %334 = func.call @cc_nil_value() : () -> i64
        %335 = func.call @cc_cons(%333, %334) : (i64, i64) -> i64
        %336 = func.call @cc_values_pack(%335) : (i64) -> i64
        %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
        %337 = arith.addi %333, %__rlasp_stack_elide_zero_18 : i64
        %338 = func.call @cc_nil_value() : () -> i64
        %339 = func.call @cc_errorp(%337) : (i64) -> i64
        %340 = arith.cmpi ne, %339, %338 : i64
        %341 = arith.cmpi eq, %338, %338 : i64
        %342 = arith.andi %340, %341 : i1
        %343 = scf.if %342 -> (i64) {
          scf.yield %337 : i64
        } else {
          scf.yield %338 : i64
        }
        %344 = arith.cmpi ne, %343, %338 : i64
        scf.if %344 {
          func.call @stack_push_pointer(%343) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%337) : (i64) -> ()
          %345 = llvm.mlir.addressof @str22 : !llvm.ptr
          %346 = func.call @cc_make_function_ref_const(%345) : (!llvm.ptr) -> i64
          %347 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%346, %347) : (i64, i64) -> ()
        }
        %348 = func.call @stack_pop_pointer() : () -> i64
        %349 = func.call @cc_nil_value() : () -> i64
        %350 = arith.cmpi ne, %348, %349 : i64
        scf.if %350 {
          %351 = llvm.mlir.addressof @str23 : !llvm.ptr
          %352 = arith.constant 9 : i64
          %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
          %354 = llvm.mlir.addressof @str24 : !llvm.ptr
          %355 = arith.constant 7 : i64
          %356 = func.call @cc_make_string(%354, %355) : (!llvm.ptr, i64) -> i64
          %357 = func.call @cc_intern(%353, %356) : (i64, i64) -> i64
          %358 = func.call @cc_nil_value() : () -> i64
          %359 = func.call @cc_cons(%357, %358) : (i64, i64) -> i64
          %360 = func.call @cc_values_pack(%359) : (i64) -> i64
          %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
          %361 = arith.addi %357, %__rlasp_stack_elide_zero_19 : i64
          %362 = func.call @cc_nil_value() : () -> i64
          %363 = func.call @cc_errorp(%361) : (i64) -> i64
          %364 = arith.cmpi ne, %363, %362 : i64
          %365 = arith.cmpi eq, %362, %362 : i64
          %366 = arith.andi %364, %365 : i1
          %367 = scf.if %366 -> (i64) {
            scf.yield %361 : i64
          } else {
            scf.yield %362 : i64
          }
          %368 = arith.cmpi ne, %367, %362 : i64
          scf.if %368 {
            func.call @stack_push_pointer(%367) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%361) : (i64) -> ()
            %369 = llvm.mlir.addressof @str25 : !llvm.ptr
            %370 = func.call @cc_make_function_ref_const(%369) : (!llvm.ptr) -> i64
            %371 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%370, %371) : (i64, i64) -> ()
          }
        } else {
          %372 = llvm.mlir.addressof @str26 : !llvm.ptr
          %373 = arith.constant 9 : i64
          %374 = func.call @cc_make_string(%372, %373) : (!llvm.ptr, i64) -> i64
          %375 = llvm.mlir.addressof @str27 : !llvm.ptr
          %376 = arith.constant 7 : i64
          %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
          %378 = func.call @cc_intern(%374, %377) : (i64, i64) -> i64
          %379 = func.call @cc_nil_value() : () -> i64
          %380 = func.call @cc_cons(%378, %379) : (i64, i64) -> i64
          %381 = func.call @cc_values_pack(%380) : (i64) -> i64
          %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
          %382 = arith.addi %378, %__rlasp_stack_elide_zero_20 : i64
          %383 = func.call @cc_nil_value() : () -> i64
          %384 = func.call @cc_errorp(%382) : (i64) -> i64
          %385 = arith.cmpi ne, %384, %383 : i64
          %386 = arith.cmpi eq, %383, %383 : i64
          %387 = arith.andi %385, %386 : i1
          %388 = scf.if %387 -> (i64) {
            scf.yield %382 : i64
          } else {
            scf.yield %383 : i64
          }
          %389 = arith.cmpi ne, %388, %383 : i64
          scf.if %389 {
            func.call @stack_push_pointer(%388) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%382) : (i64) -> ()
            %390 = llvm.mlir.addressof @str28 : !llvm.ptr
            %391 = func.call @cc_make_function_ref_const(%390) : (!llvm.ptr) -> i64
            %392 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%391, %392) : (i64, i64) -> ()
          }
        }
        %393 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %393 : i64
      }
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_errorp(%326) : (i64) -> i64
      %396 = arith.cmpi ne, %395, %394 : i64
      %397 = scf.if %396 -> (i64) {
        scf.yield %326 : i64
      } else {
        %398 = llvm.mlir.addressof @str29 : !llvm.ptr
        %399 = arith.constant 2 : i64
        %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
        %401 = llvm.mlir.addressof @str30 : !llvm.ptr
        %402 = arith.constant 7 : i64
        %403 = func.call @cc_make_string(%401, %402) : (!llvm.ptr, i64) -> i64
        %404 = func.call @cc_intern(%400, %403) : (i64, i64) -> i64
        %405 = func.call @cc_nil_value() : () -> i64
        %406 = func.call @cc_cons(%404, %405) : (i64, i64) -> i64
        %407 = func.call @cc_values_pack(%406) : (i64) -> i64
        %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
        %408 = arith.addi %404, %__rlasp_stack_elide_zero_21 : i64
        %409 = llvm.mlir.addressof @str31 : !llvm.ptr
        %410 = arith.constant 9 : i64
        %411 = func.call @cc_make_string(%409, %410) : (!llvm.ptr, i64) -> i64
        %412 = llvm.mlir.addressof @str32 : !llvm.ptr
        %413 = arith.constant 7 : i64
        %414 = func.call @cc_make_string(%412, %413) : (!llvm.ptr, i64) -> i64
        %415 = func.call @cc_intern(%411, %414) : (i64, i64) -> i64
        %416 = func.call @cc_nil_value() : () -> i64
        %417 = func.call @cc_cons(%415, %416) : (i64, i64) -> i64
        %418 = func.call @cc_values_pack(%417) : (i64) -> i64
        %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
        %419 = arith.addi %415, %__rlasp_stack_elide_zero_22 : i64
        %420 = func.call @cc_nil_value() : () -> i64
        %421 = func.call @cc_errorp(%408) : (i64) -> i64
        %422 = arith.cmpi ne, %421, %420 : i64
        %423 = arith.cmpi eq, %420, %420 : i64
        %424 = arith.andi %422, %423 : i1
        %425 = scf.if %424 -> (i64) {
          scf.yield %408 : i64
        } else {
          scf.yield %420 : i64
        }
        %426 = func.call @cc_errorp(%419) : (i64) -> i64
        %427 = arith.cmpi ne, %426, %420 : i64
        %428 = arith.cmpi eq, %425, %420 : i64
        %429 = arith.andi %427, %428 : i1
        %430 = scf.if %429 -> (i64) {
          scf.yield %419 : i64
        } else {
          scf.yield %425 : i64
        }
        %431 = arith.cmpi ne, %430, %420 : i64
        scf.if %431 {
          func.call @stack_push_pointer(%430) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%408) : (i64) -> ()
          func.call @stack_push_pointer(%419) : (i64) -> ()
          %432 = llvm.mlir.addressof @str33 : !llvm.ptr
          %433 = func.call @cc_make_function_ref_const(%432) : (!llvm.ptr) -> i64
          %434 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%433, %434) : (i64, i64) -> ()
        }
        %435 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %435 : i64
      }
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_errorp(%397) : (i64) -> i64
      %438 = arith.cmpi ne, %437, %436 : i64
      %439 = scf.if %438 -> (i64) {
        scf.yield %397 : i64
      } else {
        %440 = llvm.mlir.addressof @str34 : !llvm.ptr
        %441 = arith.constant 9 : i64
        %442 = func.call @cc_make_string(%440, %441) : (!llvm.ptr, i64) -> i64
        %443 = llvm.mlir.addressof @str35 : !llvm.ptr
        %444 = arith.constant 7 : i64
        %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
        %446 = func.call @cc_intern(%442, %445) : (i64, i64) -> i64
        %447 = func.call @cc_nil_value() : () -> i64
        %448 = func.call @cc_cons(%446, %447) : (i64, i64) -> i64
        %449 = func.call @cc_values_pack(%448) : (i64) -> i64
        %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
        %450 = arith.addi %446, %__rlasp_stack_elide_zero_23 : i64
        %451 = func.call @cc_nil_value() : () -> i64
        %452 = func.call @cc_errorp(%450) : (i64) -> i64
        %453 = arith.cmpi ne, %452, %451 : i64
        %454 = arith.cmpi eq, %451, %451 : i64
        %455 = arith.andi %453, %454 : i1
        %456 = scf.if %455 -> (i64) {
          scf.yield %450 : i64
        } else {
          scf.yield %451 : i64
        }
        %457 = arith.cmpi ne, %456, %451 : i64
        scf.if %457 {
          func.call @stack_push_pointer(%456) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%450) : (i64) -> ()
          %458 = llvm.mlir.addressof @str36 : !llvm.ptr
          %459 = func.call @cc_make_function_ref_const(%458) : (!llvm.ptr) -> i64
          %460 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%459, %460) : (i64, i64) -> ()
        }
        %461 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %461 : i64
      }
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %462 = arith.addi %439, %__rlasp_stack_elide_zero_24 : i64
      scf.yield %462 : i64
    }
    %463 = func.call @cc_nil_value() : () -> i64
    %464 = func.call @cc_errorp(%321) : (i64) -> i64
    %465 = arith.cmpi ne, %464, %463 : i64
    %466 = scf.if %465 -> (i64) {
      scf.yield %321 : i64
    } else {
      %467 = llvm.mlir.addressof @str37 : !llvm.ptr
      %468 = arith.constant 15 : i64
      %469 = func.call @cc_make_string(%467, %468) : (!llvm.ptr, i64) -> i64
      %470 = llvm.mlir.addressof @str38 : !llvm.ptr
      %471 = arith.constant 9 : i64
      %472 = func.call @cc_make_string(%470, %471) : (!llvm.ptr, i64) -> i64
      %473 = func.call @cc_intern(%469, %472) : (i64, i64) -> i64
      %474 = func.call @cc_nil_value() : () -> i64
      %475 = func.call @cc_cons(%473, %474) : (i64, i64) -> i64
      %476 = func.call @cc_values_pack(%475) : (i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %477 = arith.addi %473, %__rlasp_stack_elide_zero_25 : i64
      scf.yield %477 : i64
    }
    %478 = func.call @cc_nil_value() : () -> i64
    %479 = func.call @cc_errorp(%466) : (i64) -> i64
    %480 = arith.cmpi ne, %479, %478 : i64
    %481 = scf.if %480 -> (i64) {
      scf.yield %466 : i64
    } else {
      %482 = llvm.mlir.addressof @str39 : !llvm.ptr
      %483 = arith.constant 16 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = func.call @cc_intern(%484, %485) : (i64, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_values_pack(%488) : (i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %490 = arith.addi %486, %__rlasp_stack_elide_zero_26 : i64
      %491 = llvm.mlir.addressof @str40 : !llvm.ptr
      %492 = arith.constant 3 : i64
      %493 = func.call @cc_make_string(%491, %492) : (!llvm.ptr, i64) -> i64
      %494 = func.call @cc_nil_value() : () -> i64
      %495 = func.call @cc_intern(%493, %494) : (i64, i64) -> i64
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
      %498 = func.call @cc_values_pack(%497) : (i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %499 = llvm.mlir.addressof @str41 : !llvm.ptr
      %500 = arith.constant 4 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      %502 = llvm.mlir.addressof @str42 : !llvm.ptr
      %503 = arith.constant 11 : i64
      %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
      %505 = func.call @cc_intern(%501, %504) : (i64, i64) -> i64
      %506 = func.call @cc_nil_value() : () -> i64
      %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
      %508 = func.call @cc_values_pack(%507) : (i64) -> i64
      func.call @stack_push_pointer(%505) : (i64) -> ()
      %509 = llvm.mlir.addressof @str43 : !llvm.ptr
      %510 = arith.constant 8 : i64
      %511 = func.call @cc_make_string(%509, %510) : (!llvm.ptr, i64) -> i64
      %512 = llvm.mlir.addressof @str44 : !llvm.ptr
      %513 = arith.constant 11 : i64
      %514 = func.call @cc_make_string(%512, %513) : (!llvm.ptr, i64) -> i64
      %515 = func.call @cc_intern(%511, %514) : (i64, i64) -> i64
      %516 = func.call @cc_nil_value() : () -> i64
      %517 = func.call @cc_cons(%515, %516) : (i64, i64) -> i64
      %518 = func.call @cc_values_pack(%517) : (i64) -> i64
      func.call @stack_push_pointer(%515) : (i64) -> ()
      %519 = llvm.mlir.addressof @str45 : !llvm.ptr
      %520 = arith.constant 42 : i64
      %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%521) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %522 = func.call @stack_pop_pointer() : () -> i64
      %523 = func.call @stack_pop_pointer() : () -> i64
      %524 = func.call @cc_cons(%523, %522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %525 = arith.addi %524, %__rlasp_stack_elide_zero_27 : i64
      %526 = func.call @stack_pop_pointer() : () -> i64
      %527 = func.call @cc_cons(%526, %525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%527) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @stack_pop_pointer() : () -> i64
      %530 = func.call @cc_cons(%529, %528) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %531 = arith.addi %530, %__rlasp_stack_elide_zero_28 : i64
      %532 = func.call @stack_pop_pointer() : () -> i64
      %533 = func.call @cc_cons(%532, %531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%533) : (i64) -> ()
      %534 = llvm.mlir.addressof @str46 : !llvm.ptr
      %535 = arith.constant 18 : i64
      %536 = func.call @cc_make_string(%534, %535) : (!llvm.ptr, i64) -> i64
      %537 = func.call @cc_nil_value() : () -> i64
      %538 = func.call @cc_intern(%536, %537) : (i64, i64) -> i64
      %539 = func.call @cc_nil_value() : () -> i64
      %540 = func.call @cc_cons(%538, %539) : (i64, i64) -> i64
      %541 = func.call @cc_values_pack(%540) : (i64) -> i64
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %542 = llvm.mlir.addressof @str47 : !llvm.ptr
      %543 = arith.constant 15 : i64
      %544 = func.call @cc_make_string(%542, %543) : (!llvm.ptr, i64) -> i64
      %545 = llvm.mlir.addressof @str48 : !llvm.ptr
      %546 = arith.constant 9 : i64
      %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
      %548 = func.call @cc_intern(%544, %547) : (i64, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_values_pack(%550) : (i64) -> i64
      func.call @stack_push_pointer(%548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %552 = func.call @stack_pop_pointer() : () -> i64
      %553 = func.call @stack_pop_pointer() : () -> i64
      %554 = func.call @cc_cons(%553, %552) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %555 = arith.addi %554, %__rlasp_stack_elide_zero_29 : i64
      %556 = func.call @stack_pop_pointer() : () -> i64
      %557 = func.call @cc_cons(%556, %555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%557) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @stack_pop_pointer() : () -> i64
      %560 = func.call @cc_cons(%559, %558) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %561 = arith.addi %560, %__rlasp_stack_elide_zero_30 : i64
      %562 = func.call @stack_pop_pointer() : () -> i64
      %563 = func.call @cc_cons(%562, %561) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %564 = arith.addi %563, %__rlasp_stack_elide_zero_31 : i64
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @cc_cons(%565, %564) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %567 = arith.addi %566, %__rlasp_stack_elide_zero_32 : i64
      %568 = func.call @stack_pop_pointer() : () -> i64
      %569 = func.call @cc_cons(%568, %567) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %570 = arith.addi %569, %__rlasp_stack_elide_zero_33 : i64
      %626 = arith.constant 57937766645763 : i64
      %627 = arith.constant 0 : i64
      %628 = func.call @cc_make_closure(%626, %627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %629 = arith.addi %628, %__rlasp_stack_elide_zero_34 : i64
      %630 = arith.constant 955 : i64
      func.call @stack_push_fixnum(%630) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @cc_cons(%632, %631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%633) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @stack_pop_pointer() : () -> i64
      %636 = func.call @cc_cons(%635, %634) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %637 = arith.addi %636, %__rlasp_stack_elide_zero_35 : i64
      %638 = llvm.mlir.addressof @str54 : !llvm.ptr
      %639 = arith.constant 11 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = llvm.mlir.addressof @str55 : !llvm.ptr
      %642 = arith.constant 7 : i64
      %643 = func.call @cc_make_string(%641, %642) : (!llvm.ptr, i64) -> i64
      %644 = func.call @cc_intern(%640, %643) : (i64, i64) -> i64
      %645 = func.call @cc_nil_value() : () -> i64
      %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
      %647 = func.call @cc_values_pack(%646) : (i64) -> i64
      %648 = func.call @cc_nil_value() : () -> i64
      %649 = llvm.mlir.addressof @str56 : !llvm.ptr
      %650 = arith.constant 4 : i64
      %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
      %652 = llvm.mlir.addressof @str57 : !llvm.ptr
      %653 = arith.constant 7 : i64
      %654 = func.call @cc_make_string(%652, %653) : (!llvm.ptr, i64) -> i64
      %655 = func.call @cc_intern(%651, %654) : (i64, i64) -> i64
      %656 = func.call @cc_nil_value() : () -> i64
      %657 = func.call @cc_cons(%655, %656) : (i64, i64) -> i64
      %658 = func.call @cc_values_pack(%657) : (i64) -> i64
      %659 = llvm.mlir.addressof @str58 : !llvm.ptr
      %660 = arith.constant 6 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_intern(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_nil_value() : () -> i64
      %665 = func.call @cc_cons(%663, %664) : (i64, i64) -> i64
      %666 = func.call @cc_values_pack(%665) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %667 = arith.addi %663, %__rlasp_stack_elide_zero_36 : i64
      %668 = func.call @cc_nil_value() : () -> i64
      %669 = func.call @cc_errorp(%490) : (i64) -> i64
      %670 = arith.cmpi ne, %669, %668 : i64
      %671 = arith.cmpi eq, %668, %668 : i64
      %672 = arith.andi %670, %671 : i1
      %673 = scf.if %672 -> (i64) {
        scf.yield %490 : i64
      } else {
        scf.yield %668 : i64
      }
      %674 = func.call @cc_errorp(%570) : (i64) -> i64
      %675 = arith.cmpi ne, %674, %668 : i64
      %676 = arith.cmpi eq, %673, %668 : i64
      %677 = arith.andi %675, %676 : i1
      %678 = scf.if %677 -> (i64) {
        scf.yield %570 : i64
      } else {
        scf.yield %673 : i64
      }
      %679 = func.call @cc_errorp(%629) : (i64) -> i64
      %680 = arith.cmpi ne, %679, %668 : i64
      %681 = arith.cmpi eq, %678, %668 : i64
      %682 = arith.andi %680, %681 : i1
      %683 = scf.if %682 -> (i64) {
        scf.yield %629 : i64
      } else {
        scf.yield %678 : i64
      }
      %684 = func.call @cc_errorp(%637) : (i64) -> i64
      %685 = arith.cmpi ne, %684, %668 : i64
      %686 = arith.cmpi eq, %683, %668 : i64
      %687 = arith.andi %685, %686 : i1
      %688 = scf.if %687 -> (i64) {
        scf.yield %637 : i64
      } else {
        scf.yield %683 : i64
      }
      %689 = func.call @cc_errorp(%644) : (i64) -> i64
      %690 = arith.cmpi ne, %689, %668 : i64
      %691 = arith.cmpi eq, %688, %668 : i64
      %692 = arith.andi %690, %691 : i1
      %693 = scf.if %692 -> (i64) {
        scf.yield %644 : i64
      } else {
        scf.yield %688 : i64
      }
      %694 = func.call @cc_errorp(%648) : (i64) -> i64
      %695 = arith.cmpi ne, %694, %668 : i64
      %696 = arith.cmpi eq, %693, %668 : i64
      %697 = arith.andi %695, %696 : i1
      %698 = scf.if %697 -> (i64) {
        scf.yield %648 : i64
      } else {
        scf.yield %693 : i64
      }
      %699 = func.call @cc_errorp(%655) : (i64) -> i64
      %700 = arith.cmpi ne, %699, %668 : i64
      %701 = arith.cmpi eq, %698, %668 : i64
      %702 = arith.andi %700, %701 : i1
      %703 = scf.if %702 -> (i64) {
        scf.yield %655 : i64
      } else {
        scf.yield %698 : i64
      }
      %704 = func.call @cc_errorp(%667) : (i64) -> i64
      %705 = arith.cmpi ne, %704, %668 : i64
      %706 = arith.cmpi eq, %703, %668 : i64
      %707 = arith.andi %705, %706 : i1
      %708 = scf.if %707 -> (i64) {
        scf.yield %667 : i64
      } else {
        scf.yield %703 : i64
      }
      %709 = arith.cmpi ne, %708, %668 : i64
      scf.if %709 {
        func.call @stack_push_pointer(%708) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%490) : (i64) -> ()
        func.call @stack_push_pointer(%570) : (i64) -> ()
        func.call @stack_push_pointer(%629) : (i64) -> ()
        func.call @stack_push_pointer(%637) : (i64) -> ()
        func.call @stack_push_pointer(%644) : (i64) -> ()
        func.call @stack_push_pointer(%648) : (i64) -> ()
        func.call @stack_push_pointer(%655) : (i64) -> ()
        func.call @stack_push_pointer(%667) : (i64) -> ()
        %710 = llvm.mlir.addressof @str59 : !llvm.ptr
        %711 = func.call @cc_make_function_ref_const(%710) : (!llvm.ptr) -> i64
        %712 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%711, %712) : (i64, i64) -> ()
      }
      %713 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %713 : i64
    }
    %714 = func.call @cc_nil_value() : () -> i64
    %715 = func.call @cc_errorp(%481) : (i64) -> i64
    %716 = arith.cmpi ne, %715, %714 : i64
    %717 = scf.if %716 -> (i64) {
      scf.yield %481 : i64
    } else {
      %718 = llvm.mlir.addressof @str60 : !llvm.ptr
      %719 = arith.constant 14 : i64
      %720 = func.call @cc_make_string(%718, %719) : (!llvm.ptr, i64) -> i64
      %721 = func.call @cc_nil_value() : () -> i64
      %722 = func.call @cc_intern(%720, %721) : (i64, i64) -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_cons(%722, %723) : (i64, i64) -> i64
      %725 = func.call @cc_values_pack(%724) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %726 = arith.addi %722, %__rlasp_stack_elide_zero_37 : i64
      %727 = llvm.mlir.addressof @str61 : !llvm.ptr
      %728 = arith.constant 3 : i64
      %729 = func.call @cc_make_string(%727, %728) : (!llvm.ptr, i64) -> i64
      %730 = func.call @cc_nil_value() : () -> i64
      %731 = func.call @cc_intern(%729, %730) : (i64, i64) -> i64
      %732 = func.call @cc_nil_value() : () -> i64
      %733 = func.call @cc_cons(%731, %732) : (i64, i64) -> i64
      %734 = func.call @cc_values_pack(%733) : (i64) -> i64
      func.call @stack_push_pointer(%731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %735 = llvm.mlir.addressof @str62 : !llvm.ptr
      %736 = arith.constant 4 : i64
      %737 = func.call @cc_make_string(%735, %736) : (!llvm.ptr, i64) -> i64
      %738 = llvm.mlir.addressof @str63 : !llvm.ptr
      %739 = arith.constant 11 : i64
      %740 = func.call @cc_make_string(%738, %739) : (!llvm.ptr, i64) -> i64
      %741 = func.call @cc_intern(%737, %740) : (i64, i64) -> i64
      %742 = func.call @cc_nil_value() : () -> i64
      %743 = func.call @cc_cons(%741, %742) : (i64, i64) -> i64
      %744 = func.call @cc_values_pack(%743) : (i64) -> i64
      func.call @stack_push_pointer(%741) : (i64) -> ()
      %745 = llvm.mlir.addressof @str64 : !llvm.ptr
      %746 = arith.constant 8 : i64
      %747 = func.call @cc_make_string(%745, %746) : (!llvm.ptr, i64) -> i64
      %748 = llvm.mlir.addressof @str65 : !llvm.ptr
      %749 = arith.constant 11 : i64
      %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
      %751 = func.call @cc_intern(%747, %750) : (i64, i64) -> i64
      %752 = func.call @cc_nil_value() : () -> i64
      %753 = func.call @cc_cons(%751, %752) : (i64, i64) -> i64
      %754 = func.call @cc_values_pack(%753) : (i64) -> i64
      func.call @stack_push_pointer(%751) : (i64) -> ()
      %755 = llvm.mlir.addressof @str66 : !llvm.ptr
      %756 = arith.constant 42 : i64
      %757 = func.call @cc_make_string(%755, %756) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @cc_cons(%759, %758) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %761 = arith.addi %760, %__rlasp_stack_elide_zero_38 : i64
      %762 = func.call @stack_pop_pointer() : () -> i64
      %763 = func.call @cc_cons(%762, %761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%763) : (i64) -> ()
      %764 = llvm.mlir.addressof @str67 : !llvm.ptr
      %765 = arith.constant 15 : i64
      %766 = func.call @cc_make_string(%764, %765) : (!llvm.ptr, i64) -> i64
      %767 = llvm.mlir.addressof @str68 : !llvm.ptr
      %768 = arith.constant 7 : i64
      %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
      %770 = func.call @cc_intern(%766, %769) : (i64, i64) -> i64
      %771 = func.call @cc_nil_value() : () -> i64
      %772 = func.call @cc_cons(%770, %771) : (i64, i64) -> i64
      %773 = func.call @cc_values_pack(%772) : (i64) -> i64
      func.call @stack_push_pointer(%770) : (i64) -> ()
      %774 = llvm.mlir.addressof @str69 : !llvm.ptr
      %775 = arith.constant 5 : i64
      %776 = func.call @cc_make_string(%774, %775) : (!llvm.ptr, i64) -> i64
      %777 = llvm.mlir.addressof @str70 : !llvm.ptr
      %778 = arith.constant 7 : i64
      %779 = func.call @cc_make_string(%777, %778) : (!llvm.ptr, i64) -> i64
      %780 = func.call @cc_intern(%776, %779) : (i64, i64) -> i64
      %781 = func.call @cc_nil_value() : () -> i64
      %782 = func.call @cc_cons(%780, %781) : (i64, i64) -> i64
      %783 = func.call @cc_values_pack(%782) : (i64) -> i64
      func.call @stack_push_pointer(%780) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %784 = func.call @stack_pop_pointer() : () -> i64
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = func.call @cc_cons(%785, %784) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %787 = arith.addi %786, %__rlasp_stack_elide_zero_39 : i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @cc_cons(%788, %787) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %790 = arith.addi %789, %__rlasp_stack_elide_zero_40 : i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %793 = arith.addi %792, %__rlasp_stack_elide_zero_41 : i64
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @cc_cons(%794, %793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      %796 = llvm.mlir.addressof @str71 : !llvm.ptr
      %797 = arith.constant 18 : i64
      %798 = func.call @cc_make_string(%796, %797) : (!llvm.ptr, i64) -> i64
      %799 = func.call @cc_nil_value() : () -> i64
      %800 = func.call @cc_intern(%798, %799) : (i64, i64) -> i64
      %801 = func.call @cc_nil_value() : () -> i64
      %802 = func.call @cc_cons(%800, %801) : (i64, i64) -> i64
      %803 = func.call @cc_values_pack(%802) : (i64) -> i64
      func.call @stack_push_pointer(%800) : (i64) -> ()
      %804 = llvm.mlir.addressof @str72 : !llvm.ptr
      %805 = arith.constant 15 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = llvm.mlir.addressof @str73 : !llvm.ptr
      %808 = arith.constant 9 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = func.call @cc_intern(%806, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      func.call @stack_push_pointer(%810) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = func.call @cc_cons(%815, %814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %817 = arith.addi %816, %__rlasp_stack_elide_zero_42 : i64
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @cc_cons(%818, %817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %820 = func.call @stack_pop_pointer() : () -> i64
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_cons(%821, %820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %823 = arith.addi %822, %__rlasp_stack_elide_zero_43 : i64
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @cc_cons(%824, %823) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %826 = arith.addi %825, %__rlasp_stack_elide_zero_44 : i64
      %827 = func.call @stack_pop_pointer() : () -> i64
      %828 = func.call @cc_cons(%827, %826) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %829 = arith.addi %828, %__rlasp_stack_elide_zero_45 : i64
      %830 = func.call @stack_pop_pointer() : () -> i64
      %831 = func.call @cc_cons(%830, %829) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %832 = arith.addi %831, %__rlasp_stack_elide_zero_46 : i64
      %912 = arith.constant 57937766645764 : i64
      %913 = arith.constant 0 : i64
      %914 = func.call @cc_make_closure(%912, %913) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %915 = arith.addi %914, %__rlasp_stack_elide_zero_47 : i64
      %916 = arith.constant 955 : i64
      func.call @stack_push_fixnum(%916) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %917 = func.call @stack_pop_pointer() : () -> i64
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = func.call @cc_cons(%918, %917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%919) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = func.call @stack_pop_pointer() : () -> i64
      %922 = func.call @cc_cons(%921, %920) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %923 = arith.addi %922, %__rlasp_stack_elide_zero_48 : i64
      %924 = llvm.mlir.addressof @str83 : !llvm.ptr
      %925 = arith.constant 11 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = llvm.mlir.addressof @str84 : !llvm.ptr
      %928 = arith.constant 7 : i64
      %929 = func.call @cc_make_string(%927, %928) : (!llvm.ptr, i64) -> i64
      %930 = func.call @cc_intern(%926, %929) : (i64, i64) -> i64
      %931 = func.call @cc_nil_value() : () -> i64
      %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
      %933 = func.call @cc_values_pack(%932) : (i64) -> i64
      %934 = func.call @cc_nil_value() : () -> i64
      %935 = llvm.mlir.addressof @str85 : !llvm.ptr
      %936 = arith.constant 4 : i64
      %937 = func.call @cc_make_string(%935, %936) : (!llvm.ptr, i64) -> i64
      %938 = llvm.mlir.addressof @str86 : !llvm.ptr
      %939 = arith.constant 7 : i64
      %940 = func.call @cc_make_string(%938, %939) : (!llvm.ptr, i64) -> i64
      %941 = func.call @cc_intern(%937, %940) : (i64, i64) -> i64
      %942 = func.call @cc_nil_value() : () -> i64
      %943 = func.call @cc_cons(%941, %942) : (i64, i64) -> i64
      %944 = func.call @cc_values_pack(%943) : (i64) -> i64
      %945 = llvm.mlir.addressof @str87 : !llvm.ptr
      %946 = arith.constant 6 : i64
      %947 = func.call @cc_make_string(%945, %946) : (!llvm.ptr, i64) -> i64
      %948 = func.call @cc_nil_value() : () -> i64
      %949 = func.call @cc_intern(%947, %948) : (i64, i64) -> i64
      %950 = func.call @cc_nil_value() : () -> i64
      %951 = func.call @cc_cons(%949, %950) : (i64, i64) -> i64
      %952 = func.call @cc_values_pack(%951) : (i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %953 = arith.addi %949, %__rlasp_stack_elide_zero_49 : i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_errorp(%726) : (i64) -> i64
      %956 = arith.cmpi ne, %955, %954 : i64
      %957 = arith.cmpi eq, %954, %954 : i64
      %958 = arith.andi %956, %957 : i1
      %959 = scf.if %958 -> (i64) {
        scf.yield %726 : i64
      } else {
        scf.yield %954 : i64
      }
      %960 = func.call @cc_errorp(%832) : (i64) -> i64
      %961 = arith.cmpi ne, %960, %954 : i64
      %962 = arith.cmpi eq, %959, %954 : i64
      %963 = arith.andi %961, %962 : i1
      %964 = scf.if %963 -> (i64) {
        scf.yield %832 : i64
      } else {
        scf.yield %959 : i64
      }
      %965 = func.call @cc_errorp(%915) : (i64) -> i64
      %966 = arith.cmpi ne, %965, %954 : i64
      %967 = arith.cmpi eq, %964, %954 : i64
      %968 = arith.andi %966, %967 : i1
      %969 = scf.if %968 -> (i64) {
        scf.yield %915 : i64
      } else {
        scf.yield %964 : i64
      }
      %970 = func.call @cc_errorp(%923) : (i64) -> i64
      %971 = arith.cmpi ne, %970, %954 : i64
      %972 = arith.cmpi eq, %969, %954 : i64
      %973 = arith.andi %971, %972 : i1
      %974 = scf.if %973 -> (i64) {
        scf.yield %923 : i64
      } else {
        scf.yield %969 : i64
      }
      %975 = func.call @cc_errorp(%930) : (i64) -> i64
      %976 = arith.cmpi ne, %975, %954 : i64
      %977 = arith.cmpi eq, %974, %954 : i64
      %978 = arith.andi %976, %977 : i1
      %979 = scf.if %978 -> (i64) {
        scf.yield %930 : i64
      } else {
        scf.yield %974 : i64
      }
      %980 = func.call @cc_errorp(%934) : (i64) -> i64
      %981 = arith.cmpi ne, %980, %954 : i64
      %982 = arith.cmpi eq, %979, %954 : i64
      %983 = arith.andi %981, %982 : i1
      %984 = scf.if %983 -> (i64) {
        scf.yield %934 : i64
      } else {
        scf.yield %979 : i64
      }
      %985 = func.call @cc_errorp(%941) : (i64) -> i64
      %986 = arith.cmpi ne, %985, %954 : i64
      %987 = arith.cmpi eq, %984, %954 : i64
      %988 = arith.andi %986, %987 : i1
      %989 = scf.if %988 -> (i64) {
        scf.yield %941 : i64
      } else {
        scf.yield %984 : i64
      }
      %990 = func.call @cc_errorp(%953) : (i64) -> i64
      %991 = arith.cmpi ne, %990, %954 : i64
      %992 = arith.cmpi eq, %989, %954 : i64
      %993 = arith.andi %991, %992 : i1
      %994 = scf.if %993 -> (i64) {
        scf.yield %953 : i64
      } else {
        scf.yield %989 : i64
      }
      %995 = arith.cmpi ne, %994, %954 : i64
      scf.if %995 {
        func.call @stack_push_pointer(%994) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%726) : (i64) -> ()
        func.call @stack_push_pointer(%832) : (i64) -> ()
        func.call @stack_push_pointer(%915) : (i64) -> ()
        func.call @stack_push_pointer(%923) : (i64) -> ()
        func.call @stack_push_pointer(%930) : (i64) -> ()
        func.call @stack_push_pointer(%934) : (i64) -> ()
        func.call @stack_push_pointer(%941) : (i64) -> ()
        func.call @stack_push_pointer(%953) : (i64) -> ()
        %996 = llvm.mlir.addressof @str88 : !llvm.ptr
        %997 = func.call @cc_make_function_ref_const(%996) : (!llvm.ptr) -> i64
        %998 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%997, %998) : (i64, i64) -> ()
      }
      %999 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %999 : i64
    }
    %1000 = func.call @cc_nil_value() : () -> i64
    %1001 = func.call @cc_errorp(%717) : (i64) -> i64
    %1002 = arith.cmpi ne, %1001, %1000 : i64
    %1003 = scf.if %1002 -> (i64) {
      scf.yield %717 : i64
    } else {
      %1004 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1005 = arith.constant 16 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = func.call @cc_nil_value() : () -> i64
      %1008 = func.call @cc_intern(%1006, %1007) : (i64, i64) -> i64
      %1009 = func.call @cc_nil_value() : () -> i64
      %1010 = func.call @cc_cons(%1008, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_values_pack(%1010) : (i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1012 = arith.addi %1008, %__rlasp_stack_elide_zero_50 : i64
      %1013 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1014 = arith.constant 3 : i64
      %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_intern(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_nil_value() : () -> i64
      %1019 = func.call @cc_cons(%1017, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_values_pack(%1019) : (i64) -> i64
      func.call @stack_push_pointer(%1017) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1021 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1022 = arith.constant 4 : i64
      %1023 = func.call @cc_make_string(%1021, %1022) : (!llvm.ptr, i64) -> i64
      %1024 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1025 = arith.constant 11 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = func.call @cc_intern(%1023, %1026) : (i64, i64) -> i64
      %1028 = func.call @cc_nil_value() : () -> i64
      %1029 = func.call @cc_cons(%1027, %1028) : (i64, i64) -> i64
      %1030 = func.call @cc_values_pack(%1029) : (i64) -> i64
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      %1031 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1032 = arith.constant 8 : i64
      %1033 = func.call @cc_make_string(%1031, %1032) : (!llvm.ptr, i64) -> i64
      %1034 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1035 = arith.constant 11 : i64
      %1036 = func.call @cc_make_string(%1034, %1035) : (!llvm.ptr, i64) -> i64
      %1037 = func.call @cc_intern(%1033, %1036) : (i64, i64) -> i64
      %1038 = func.call @cc_nil_value() : () -> i64
      %1039 = func.call @cc_cons(%1037, %1038) : (i64, i64) -> i64
      %1040 = func.call @cc_values_pack(%1039) : (i64) -> i64
      func.call @stack_push_pointer(%1037) : (i64) -> ()
      %1041 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1042 = arith.constant 42 : i64
      %1043 = func.call @cc_make_string(%1041, %1042) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1043) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1044 = func.call @stack_pop_pointer() : () -> i64
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @cc_cons(%1045, %1044) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1047 = arith.addi %1046, %__rlasp_stack_elide_zero_51 : i64
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @cc_cons(%1048, %1047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1049) : (i64) -> ()
      %1050 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1051 = arith.constant 15 : i64
      %1052 = func.call @cc_make_string(%1050, %1051) : (!llvm.ptr, i64) -> i64
      %1053 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1054 = arith.constant 7 : i64
      %1055 = func.call @cc_make_string(%1053, %1054) : (!llvm.ptr, i64) -> i64
      %1056 = func.call @cc_intern(%1052, %1055) : (i64, i64) -> i64
      %1057 = func.call @cc_nil_value() : () -> i64
      %1058 = func.call @cc_cons(%1056, %1057) : (i64, i64) -> i64
      %1059 = func.call @cc_values_pack(%1058) : (i64) -> i64
      func.call @stack_push_pointer(%1056) : (i64) -> ()
      %1060 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1061 = arith.constant 7 : i64
      %1062 = func.call @cc_make_string(%1060, %1061) : (!llvm.ptr, i64) -> i64
      %1063 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1064 = arith.constant 7 : i64
      %1065 = func.call @cc_make_string(%1063, %1064) : (!llvm.ptr, i64) -> i64
      %1066 = func.call @cc_intern(%1062, %1065) : (i64, i64) -> i64
      %1067 = func.call @cc_nil_value() : () -> i64
      %1068 = func.call @cc_cons(%1066, %1067) : (i64, i64) -> i64
      %1069 = func.call @cc_values_pack(%1068) : (i64) -> i64
      func.call @stack_push_pointer(%1066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @cc_cons(%1071, %1070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1073 = arith.addi %1072, %__rlasp_stack_elide_zero_52 : i64
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @cc_cons(%1074, %1073) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1076 = arith.addi %1075, %__rlasp_stack_elide_zero_53 : i64
      %1077 = func.call @stack_pop_pointer() : () -> i64
      %1078 = func.call @cc_cons(%1077, %1076) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1079 = arith.addi %1078, %__rlasp_stack_elide_zero_54 : i64
      %1080 = func.call @stack_pop_pointer() : () -> i64
      %1081 = func.call @cc_cons(%1080, %1079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1083 = arith.constant 18 : i64
      %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
      %1085 = func.call @cc_nil_value() : () -> i64
      %1086 = func.call @cc_intern(%1084, %1085) : (i64, i64) -> i64
      %1087 = func.call @cc_nil_value() : () -> i64
      %1088 = func.call @cc_cons(%1086, %1087) : (i64, i64) -> i64
      %1089 = func.call @cc_values_pack(%1088) : (i64) -> i64
      func.call @stack_push_pointer(%1086) : (i64) -> ()
      %1090 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1091 = arith.constant 15 : i64
      %1092 = func.call @cc_make_string(%1090, %1091) : (!llvm.ptr, i64) -> i64
      %1093 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1094 = arith.constant 9 : i64
      %1095 = func.call @cc_make_string(%1093, %1094) : (!llvm.ptr, i64) -> i64
      %1096 = func.call @cc_intern(%1092, %1095) : (i64, i64) -> i64
      %1097 = func.call @cc_nil_value() : () -> i64
      %1098 = func.call @cc_cons(%1096, %1097) : (i64, i64) -> i64
      %1099 = func.call @cc_values_pack(%1098) : (i64) -> i64
      func.call @stack_push_pointer(%1096) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @stack_pop_pointer() : () -> i64
      %1102 = func.call @cc_cons(%1101, %1100) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1103 = arith.addi %1102, %__rlasp_stack_elide_zero_55 : i64
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = func.call @cc_cons(%1104, %1103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @stack_pop_pointer() : () -> i64
      %1108 = func.call @cc_cons(%1107, %1106) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1109 = arith.addi %1108, %__rlasp_stack_elide_zero_56 : i64
      %1110 = func.call @stack_pop_pointer() : () -> i64
      %1111 = func.call @cc_cons(%1110, %1109) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1112 = arith.addi %1111, %__rlasp_stack_elide_zero_57 : i64
      %1113 = func.call @stack_pop_pointer() : () -> i64
      %1114 = func.call @cc_cons(%1113, %1112) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1115 = arith.addi %1114, %__rlasp_stack_elide_zero_58 : i64
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @cc_cons(%1116, %1115) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1118 = arith.addi %1117, %__rlasp_stack_elide_zero_59 : i64
      %1198 = arith.constant 57937766645765 : i64
      %1199 = arith.constant 0 : i64
      %1200 = func.call @cc_make_closure(%1198, %1199) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1201 = arith.addi %1200, %__rlasp_stack_elide_zero_60 : i64
      %1202 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%1202) : (i64) -> ()
      %1203 = arith.constant 187 : i64
      func.call @stack_push_fixnum(%1203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1204 = func.call @stack_pop_pointer() : () -> i64
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @cc_cons(%1205, %1204) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1207 = arith.addi %1206, %__rlasp_stack_elide_zero_61 : i64
      %1208 = func.call @stack_pop_pointer() : () -> i64
      %1209 = func.call @cc_cons(%1208, %1207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1209) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1210 = func.call @stack_pop_pointer() : () -> i64
      %1211 = func.call @stack_pop_pointer() : () -> i64
      %1212 = func.call @cc_cons(%1211, %1210) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1213 = arith.addi %1212, %__rlasp_stack_elide_zero_62 : i64
      %1214 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1215 = arith.constant 11 : i64
      %1216 = func.call @cc_make_string(%1214, %1215) : (!llvm.ptr, i64) -> i64
      %1217 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1218 = arith.constant 7 : i64
      %1219 = func.call @cc_make_string(%1217, %1218) : (!llvm.ptr, i64) -> i64
      %1220 = func.call @cc_intern(%1216, %1219) : (i64, i64) -> i64
      %1221 = func.call @cc_nil_value() : () -> i64
      %1222 = func.call @cc_cons(%1220, %1221) : (i64, i64) -> i64
      %1223 = func.call @cc_values_pack(%1222) : (i64) -> i64
      %1224 = func.call @cc_nil_value() : () -> i64
      %1225 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1226 = arith.constant 4 : i64
      %1227 = func.call @cc_make_string(%1225, %1226) : (!llvm.ptr, i64) -> i64
      %1228 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1229 = arith.constant 7 : i64
      %1230 = func.call @cc_make_string(%1228, %1229) : (!llvm.ptr, i64) -> i64
      %1231 = func.call @cc_intern(%1227, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_nil_value() : () -> i64
      %1233 = func.call @cc_cons(%1231, %1232) : (i64, i64) -> i64
      %1234 = func.call @cc_values_pack(%1233) : (i64) -> i64
      %1235 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1236 = arith.constant 6 : i64
      %1237 = func.call @cc_make_string(%1235, %1236) : (!llvm.ptr, i64) -> i64
      %1238 = func.call @cc_nil_value() : () -> i64
      %1239 = func.call @cc_intern(%1237, %1238) : (i64, i64) -> i64
      %1240 = func.call @cc_nil_value() : () -> i64
      %1241 = func.call @cc_cons(%1239, %1240) : (i64, i64) -> i64
      %1242 = func.call @cc_values_pack(%1241) : (i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1243 = arith.addi %1239, %__rlasp_stack_elide_zero_63 : i64
      %1244 = func.call @cc_nil_value() : () -> i64
      %1245 = func.call @cc_errorp(%1012) : (i64) -> i64
      %1246 = arith.cmpi ne, %1245, %1244 : i64
      %1247 = arith.cmpi eq, %1244, %1244 : i64
      %1248 = arith.andi %1246, %1247 : i1
      %1249 = scf.if %1248 -> (i64) {
        scf.yield %1012 : i64
      } else {
        scf.yield %1244 : i64
      }
      %1250 = func.call @cc_errorp(%1118) : (i64) -> i64
      %1251 = arith.cmpi ne, %1250, %1244 : i64
      %1252 = arith.cmpi eq, %1249, %1244 : i64
      %1253 = arith.andi %1251, %1252 : i1
      %1254 = scf.if %1253 -> (i64) {
        scf.yield %1118 : i64
      } else {
        scf.yield %1249 : i64
      }
      %1255 = func.call @cc_errorp(%1201) : (i64) -> i64
      %1256 = arith.cmpi ne, %1255, %1244 : i64
      %1257 = arith.cmpi eq, %1254, %1244 : i64
      %1258 = arith.andi %1256, %1257 : i1
      %1259 = scf.if %1258 -> (i64) {
        scf.yield %1201 : i64
      } else {
        scf.yield %1254 : i64
      }
      %1260 = func.call @cc_errorp(%1213) : (i64) -> i64
      %1261 = arith.cmpi ne, %1260, %1244 : i64
      %1262 = arith.cmpi eq, %1259, %1244 : i64
      %1263 = arith.andi %1261, %1262 : i1
      %1264 = scf.if %1263 -> (i64) {
        scf.yield %1213 : i64
      } else {
        scf.yield %1259 : i64
      }
      %1265 = func.call @cc_errorp(%1220) : (i64) -> i64
      %1266 = arith.cmpi ne, %1265, %1244 : i64
      %1267 = arith.cmpi eq, %1264, %1244 : i64
      %1268 = arith.andi %1266, %1267 : i1
      %1269 = scf.if %1268 -> (i64) {
        scf.yield %1220 : i64
      } else {
        scf.yield %1264 : i64
      }
      %1270 = func.call @cc_errorp(%1224) : (i64) -> i64
      %1271 = arith.cmpi ne, %1270, %1244 : i64
      %1272 = arith.cmpi eq, %1269, %1244 : i64
      %1273 = arith.andi %1271, %1272 : i1
      %1274 = scf.if %1273 -> (i64) {
        scf.yield %1224 : i64
      } else {
        scf.yield %1269 : i64
      }
      %1275 = func.call @cc_errorp(%1231) : (i64) -> i64
      %1276 = arith.cmpi ne, %1275, %1244 : i64
      %1277 = arith.cmpi eq, %1274, %1244 : i64
      %1278 = arith.andi %1276, %1277 : i1
      %1279 = scf.if %1278 -> (i64) {
        scf.yield %1231 : i64
      } else {
        scf.yield %1274 : i64
      }
      %1280 = func.call @cc_errorp(%1243) : (i64) -> i64
      %1281 = arith.cmpi ne, %1280, %1244 : i64
      %1282 = arith.cmpi eq, %1279, %1244 : i64
      %1283 = arith.andi %1281, %1282 : i1
      %1284 = scf.if %1283 -> (i64) {
        scf.yield %1243 : i64
      } else {
        scf.yield %1279 : i64
      }
      %1285 = arith.cmpi ne, %1284, %1244 : i64
      scf.if %1285 {
        func.call @stack_push_pointer(%1284) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1012) : (i64) -> ()
        func.call @stack_push_pointer(%1118) : (i64) -> ()
        func.call @stack_push_pointer(%1201) : (i64) -> ()
        func.call @stack_push_pointer(%1213) : (i64) -> ()
        func.call @stack_push_pointer(%1220) : (i64) -> ()
        func.call @stack_push_pointer(%1224) : (i64) -> ()
        func.call @stack_push_pointer(%1231) : (i64) -> ()
        func.call @stack_push_pointer(%1243) : (i64) -> ()
        %1286 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1287 = func.call @cc_make_function_ref_const(%1286) : (!llvm.ptr) -> i64
        %1288 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1287, %1288) : (i64, i64) -> ()
      }
      %1289 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1289 : i64
    }
    %1290 = func.call @cc_nil_value() : () -> i64
    %1291 = func.call @cc_errorp(%1003) : (i64) -> i64
    %1292 = arith.cmpi ne, %1291, %1290 : i64
    %1293 = scf.if %1292 -> (i64) {
      scf.yield %1003 : i64
    } else {
      %1294 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1295 = arith.constant 19 : i64
      %1296 = func.call @cc_make_string(%1294, %1295) : (!llvm.ptr, i64) -> i64
      %1297 = func.call @cc_nil_value() : () -> i64
      %1298 = func.call @cc_intern(%1296, %1297) : (i64, i64) -> i64
      %1299 = func.call @cc_nil_value() : () -> i64
      %1300 = func.call @cc_cons(%1298, %1299) : (i64, i64) -> i64
      %1301 = func.call @cc_values_pack(%1300) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1302 = arith.addi %1298, %__rlasp_stack_elide_zero_64 : i64
      %1303 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1304 = arith.constant 3 : i64
      %1305 = func.call @cc_make_string(%1303, %1304) : (!llvm.ptr, i64) -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_intern(%1305, %1306) : (i64, i64) -> i64
      %1308 = func.call @cc_nil_value() : () -> i64
      %1309 = func.call @cc_cons(%1307, %1308) : (i64, i64) -> i64
      %1310 = func.call @cc_values_pack(%1309) : (i64) -> i64
      func.call @stack_push_pointer(%1307) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1311 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1312 = arith.constant 4 : i64
      %1313 = func.call @cc_make_string(%1311, %1312) : (!llvm.ptr, i64) -> i64
      %1314 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1315 = arith.constant 11 : i64
      %1316 = func.call @cc_make_string(%1314, %1315) : (!llvm.ptr, i64) -> i64
      %1317 = func.call @cc_intern(%1313, %1316) : (i64, i64) -> i64
      %1318 = func.call @cc_nil_value() : () -> i64
      %1319 = func.call @cc_cons(%1317, %1318) : (i64, i64) -> i64
      %1320 = func.call @cc_values_pack(%1319) : (i64) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      %1321 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1322 = arith.constant 8 : i64
      %1323 = func.call @cc_make_string(%1321, %1322) : (!llvm.ptr, i64) -> i64
      %1324 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1325 = arith.constant 11 : i64
      %1326 = func.call @cc_make_string(%1324, %1325) : (!llvm.ptr, i64) -> i64
      %1327 = func.call @cc_intern(%1323, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_nil_value() : () -> i64
      %1329 = func.call @cc_cons(%1327, %1328) : (i64, i64) -> i64
      %1330 = func.call @cc_values_pack(%1329) : (i64) -> i64
      func.call @stack_push_pointer(%1327) : (i64) -> ()
      %1331 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1332 = arith.constant 42 : i64
      %1333 = func.call @cc_make_string(%1331, %1332) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1333) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1334 = func.call @stack_pop_pointer() : () -> i64
      %1335 = func.call @stack_pop_pointer() : () -> i64
      %1336 = func.call @cc_cons(%1335, %1334) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1337 = arith.addi %1336, %__rlasp_stack_elide_zero_65 : i64
      %1338 = func.call @stack_pop_pointer() : () -> i64
      %1339 = func.call @cc_cons(%1338, %1337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1339) : (i64) -> ()
      %1340 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1341 = arith.constant 15 : i64
      %1342 = func.call @cc_make_string(%1340, %1341) : (!llvm.ptr, i64) -> i64
      %1343 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1344 = arith.constant 7 : i64
      %1345 = func.call @cc_make_string(%1343, %1344) : (!llvm.ptr, i64) -> i64
      %1346 = func.call @cc_intern(%1342, %1345) : (i64, i64) -> i64
      %1347 = func.call @cc_nil_value() : () -> i64
      %1348 = func.call @cc_cons(%1346, %1347) : (i64, i64) -> i64
      %1349 = func.call @cc_values_pack(%1348) : (i64) -> i64
      func.call @stack_push_pointer(%1346) : (i64) -> ()
      %1350 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1351 = arith.constant 10 : i64
      %1352 = func.call @cc_make_string(%1350, %1351) : (!llvm.ptr, i64) -> i64
      %1353 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1354 = arith.constant 7 : i64
      %1355 = func.call @cc_make_string(%1353, %1354) : (!llvm.ptr, i64) -> i64
      %1356 = func.call @cc_intern(%1352, %1355) : (i64, i64) -> i64
      %1357 = func.call @cc_nil_value() : () -> i64
      %1358 = func.call @cc_cons(%1356, %1357) : (i64, i64) -> i64
      %1359 = func.call @cc_values_pack(%1358) : (i64) -> i64
      func.call @stack_push_pointer(%1356) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1360 = func.call @stack_pop_pointer() : () -> i64
      %1361 = func.call @stack_pop_pointer() : () -> i64
      %1362 = func.call @cc_cons(%1361, %1360) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1363 = arith.addi %1362, %__rlasp_stack_elide_zero_66 : i64
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @cc_cons(%1364, %1363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1366 = arith.addi %1365, %__rlasp_stack_elide_zero_67 : i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1369 = arith.addi %1368, %__rlasp_stack_elide_zero_68 : i64
      %1370 = func.call @stack_pop_pointer() : () -> i64
      %1371 = func.call @cc_cons(%1370, %1369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1371) : (i64) -> ()
      %1372 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1373 = arith.constant 18 : i64
      %1374 = func.call @cc_make_string(%1372, %1373) : (!llvm.ptr, i64) -> i64
      %1375 = func.call @cc_nil_value() : () -> i64
      %1376 = func.call @cc_intern(%1374, %1375) : (i64, i64) -> i64
      %1377 = func.call @cc_nil_value() : () -> i64
      %1378 = func.call @cc_cons(%1376, %1377) : (i64, i64) -> i64
      %1379 = func.call @cc_values_pack(%1378) : (i64) -> i64
      func.call @stack_push_pointer(%1376) : (i64) -> ()
      %1380 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1381 = arith.constant 15 : i64
      %1382 = func.call @cc_make_string(%1380, %1381) : (!llvm.ptr, i64) -> i64
      %1383 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1384 = arith.constant 9 : i64
      %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
      %1386 = func.call @cc_intern(%1382, %1385) : (i64, i64) -> i64
      %1387 = func.call @cc_nil_value() : () -> i64
      %1388 = func.call @cc_cons(%1386, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_values_pack(%1388) : (i64) -> i64
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1390 = func.call @stack_pop_pointer() : () -> i64
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @cc_cons(%1391, %1390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1393 = arith.addi %1392, %__rlasp_stack_elide_zero_69 : i64
      %1394 = func.call @stack_pop_pointer() : () -> i64
      %1395 = func.call @cc_cons(%1394, %1393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = func.call @cc_cons(%1397, %1396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1399 = arith.addi %1398, %__rlasp_stack_elide_zero_70 : i64
      %1400 = func.call @stack_pop_pointer() : () -> i64
      %1401 = func.call @cc_cons(%1400, %1399) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1402 = arith.addi %1401, %__rlasp_stack_elide_zero_71 : i64
      %1403 = func.call @stack_pop_pointer() : () -> i64
      %1404 = func.call @cc_cons(%1403, %1402) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1405 = arith.addi %1404, %__rlasp_stack_elide_zero_72 : i64
      %1406 = func.call @stack_pop_pointer() : () -> i64
      %1407 = func.call @cc_cons(%1406, %1405) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1408 = arith.addi %1407, %__rlasp_stack_elide_zero_73 : i64
      %1488 = arith.constant 57937766645766 : i64
      %1489 = arith.constant 0 : i64
      %1490 = func.call @cc_make_closure(%1488, %1489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1491 = arith.addi %1490, %__rlasp_stack_elide_zero_74 : i64
      %1492 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%1492) : (i64) -> ()
      %1493 = arith.constant 187 : i64
      func.call @stack_push_fixnum(%1493) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1494 = func.call @stack_pop_pointer() : () -> i64
      %1495 = func.call @stack_pop_pointer() : () -> i64
      %1496 = func.call @cc_cons(%1495, %1494) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1497 = arith.addi %1496, %__rlasp_stack_elide_zero_75 : i64
      %1498 = func.call @stack_pop_pointer() : () -> i64
      %1499 = func.call @cc_cons(%1498, %1497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1499) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1500 = func.call @stack_pop_pointer() : () -> i64
      %1501 = func.call @stack_pop_pointer() : () -> i64
      %1502 = func.call @cc_cons(%1501, %1500) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1503 = arith.addi %1502, %__rlasp_stack_elide_zero_76 : i64
      %1504 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1505 = arith.constant 11 : i64
      %1506 = func.call @cc_make_string(%1504, %1505) : (!llvm.ptr, i64) -> i64
      %1507 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1508 = arith.constant 7 : i64
      %1509 = func.call @cc_make_string(%1507, %1508) : (!llvm.ptr, i64) -> i64
      %1510 = func.call @cc_intern(%1506, %1509) : (i64, i64) -> i64
      %1511 = func.call @cc_nil_value() : () -> i64
      %1512 = func.call @cc_cons(%1510, %1511) : (i64, i64) -> i64
      %1513 = func.call @cc_values_pack(%1512) : (i64) -> i64
      %1514 = func.call @cc_nil_value() : () -> i64
      %1515 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1516 = arith.constant 4 : i64
      %1517 = func.call @cc_make_string(%1515, %1516) : (!llvm.ptr, i64) -> i64
      %1518 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1519 = arith.constant 7 : i64
      %1520 = func.call @cc_make_string(%1518, %1519) : (!llvm.ptr, i64) -> i64
      %1521 = func.call @cc_intern(%1517, %1520) : (i64, i64) -> i64
      %1522 = func.call @cc_nil_value() : () -> i64
      %1523 = func.call @cc_cons(%1521, %1522) : (i64, i64) -> i64
      %1524 = func.call @cc_values_pack(%1523) : (i64) -> i64
      %1525 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1526 = arith.constant 6 : i64
      %1527 = func.call @cc_make_string(%1525, %1526) : (!llvm.ptr, i64) -> i64
      %1528 = func.call @cc_nil_value() : () -> i64
      %1529 = func.call @cc_intern(%1527, %1528) : (i64, i64) -> i64
      %1530 = func.call @cc_nil_value() : () -> i64
      %1531 = func.call @cc_cons(%1529, %1530) : (i64, i64) -> i64
      %1532 = func.call @cc_values_pack(%1531) : (i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1533 = arith.addi %1529, %__rlasp_stack_elide_zero_77 : i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_errorp(%1302) : (i64) -> i64
      %1536 = arith.cmpi ne, %1535, %1534 : i64
      %1537 = arith.cmpi eq, %1534, %1534 : i64
      %1538 = arith.andi %1536, %1537 : i1
      %1539 = scf.if %1538 -> (i64) {
        scf.yield %1302 : i64
      } else {
        scf.yield %1534 : i64
      }
      %1540 = func.call @cc_errorp(%1408) : (i64) -> i64
      %1541 = arith.cmpi ne, %1540, %1534 : i64
      %1542 = arith.cmpi eq, %1539, %1534 : i64
      %1543 = arith.andi %1541, %1542 : i1
      %1544 = scf.if %1543 -> (i64) {
        scf.yield %1408 : i64
      } else {
        scf.yield %1539 : i64
      }
      %1545 = func.call @cc_errorp(%1491) : (i64) -> i64
      %1546 = arith.cmpi ne, %1545, %1534 : i64
      %1547 = arith.cmpi eq, %1544, %1534 : i64
      %1548 = arith.andi %1546, %1547 : i1
      %1549 = scf.if %1548 -> (i64) {
        scf.yield %1491 : i64
      } else {
        scf.yield %1544 : i64
      }
      %1550 = func.call @cc_errorp(%1503) : (i64) -> i64
      %1551 = arith.cmpi ne, %1550, %1534 : i64
      %1552 = arith.cmpi eq, %1549, %1534 : i64
      %1553 = arith.andi %1551, %1552 : i1
      %1554 = scf.if %1553 -> (i64) {
        scf.yield %1503 : i64
      } else {
        scf.yield %1549 : i64
      }
      %1555 = func.call @cc_errorp(%1510) : (i64) -> i64
      %1556 = arith.cmpi ne, %1555, %1534 : i64
      %1557 = arith.cmpi eq, %1554, %1534 : i64
      %1558 = arith.andi %1556, %1557 : i1
      %1559 = scf.if %1558 -> (i64) {
        scf.yield %1510 : i64
      } else {
        scf.yield %1554 : i64
      }
      %1560 = func.call @cc_errorp(%1514) : (i64) -> i64
      %1561 = arith.cmpi ne, %1560, %1534 : i64
      %1562 = arith.cmpi eq, %1559, %1534 : i64
      %1563 = arith.andi %1561, %1562 : i1
      %1564 = scf.if %1563 -> (i64) {
        scf.yield %1514 : i64
      } else {
        scf.yield %1559 : i64
      }
      %1565 = func.call @cc_errorp(%1521) : (i64) -> i64
      %1566 = arith.cmpi ne, %1565, %1534 : i64
      %1567 = arith.cmpi eq, %1564, %1534 : i64
      %1568 = arith.andi %1566, %1567 : i1
      %1569 = scf.if %1568 -> (i64) {
        scf.yield %1521 : i64
      } else {
        scf.yield %1564 : i64
      }
      %1570 = func.call @cc_errorp(%1533) : (i64) -> i64
      %1571 = arith.cmpi ne, %1570, %1534 : i64
      %1572 = arith.cmpi eq, %1569, %1534 : i64
      %1573 = arith.andi %1571, %1572 : i1
      %1574 = scf.if %1573 -> (i64) {
        scf.yield %1533 : i64
      } else {
        scf.yield %1569 : i64
      }
      %1575 = arith.cmpi ne, %1574, %1534 : i64
      scf.if %1575 {
        func.call @stack_push_pointer(%1574) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1302) : (i64) -> ()
        func.call @stack_push_pointer(%1408) : (i64) -> ()
        func.call @stack_push_pointer(%1491) : (i64) -> ()
        func.call @stack_push_pointer(%1503) : (i64) -> ()
        func.call @stack_push_pointer(%1510) : (i64) -> ()
        func.call @stack_push_pointer(%1514) : (i64) -> ()
        func.call @stack_push_pointer(%1521) : (i64) -> ()
        func.call @stack_push_pointer(%1533) : (i64) -> ()
        %1576 = llvm.mlir.addressof @str146 : !llvm.ptr
        %1577 = func.call @cc_make_function_ref_const(%1576) : (!llvm.ptr) -> i64
        %1578 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1577, %1578) : (i64, i64) -> ()
      }
      %1579 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1579 : i64
    }
    %1580 = func.call @cc_nil_value() : () -> i64
    %1581 = func.call @cc_errorp(%1293) : (i64) -> i64
    %1582 = arith.cmpi ne, %1581, %1580 : i64
    %1583 = scf.if %1582 -> (i64) {
      scf.yield %1293 : i64
    } else {
      %1584 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1585 = arith.constant 20 : i64
      %1586 = func.call @cc_make_string(%1584, %1585) : (!llvm.ptr, i64) -> i64
      %1587 = func.call @cc_nil_value() : () -> i64
      %1588 = func.call @cc_intern(%1586, %1587) : (i64, i64) -> i64
      %1589 = func.call @cc_nil_value() : () -> i64
      %1590 = func.call @cc_cons(%1588, %1589) : (i64, i64) -> i64
      %1591 = func.call @cc_values_pack(%1590) : (i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1592 = arith.addi %1588, %__rlasp_stack_elide_zero_78 : i64
      %1593 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1594 = arith.constant 13 : i64
      %1595 = func.call @cc_make_string(%1593, %1594) : (!llvm.ptr, i64) -> i64
      %1596 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1597 = arith.constant 11 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = func.call @cc_intern(%1595, %1598) : (i64, i64) -> i64
      %1600 = func.call @cc_nil_value() : () -> i64
      %1601 = func.call @cc_cons(%1599, %1600) : (i64, i64) -> i64
      %1602 = func.call @cc_values_pack(%1601) : (i64) -> i64
      func.call @stack_push_pointer(%1599) : (i64) -> ()
      %1603 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1604 = arith.constant 6 : i64
      %1605 = func.call @cc_make_string(%1603, %1604) : (!llvm.ptr, i64) -> i64
      %1606 = func.call @cc_nil_value() : () -> i64
      %1607 = func.call @cc_intern(%1605, %1606) : (i64, i64) -> i64
      %1608 = func.call @cc_nil_value() : () -> i64
      %1609 = func.call @cc_cons(%1607, %1608) : (i64, i64) -> i64
      %1610 = func.call @cc_values_pack(%1609) : (i64) -> i64
      func.call @stack_push_pointer(%1607) : (i64) -> ()
      %1611 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1612 = arith.constant 19 : i64
      %1613 = func.call @cc_make_string(%1611, %1612) : (!llvm.ptr, i64) -> i64
      %1614 = func.call @cc_nil_value() : () -> i64
      %1615 = func.call @cc_intern(%1613, %1614) : (i64, i64) -> i64
      %1616 = func.call @cc_nil_value() : () -> i64
      %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
      func.call @stack_push_pointer(%1615) : (i64) -> ()
      %1619 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1620 = arith.constant 4 : i64
      %1621 = func.call @cc_make_string(%1619, %1620) : (!llvm.ptr, i64) -> i64
      %1622 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1623 = arith.constant 11 : i64
      %1624 = func.call @cc_make_string(%1622, %1623) : (!llvm.ptr, i64) -> i64
      %1625 = func.call @cc_intern(%1621, %1624) : (i64, i64) -> i64
      %1626 = func.call @cc_nil_value() : () -> i64
      %1627 = func.call @cc_cons(%1625, %1626) : (i64, i64) -> i64
      %1628 = func.call @cc_values_pack(%1627) : (i64) -> i64
      func.call @stack_push_pointer(%1625) : (i64) -> ()
      %1629 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1630 = arith.constant 8 : i64
      %1631 = func.call @cc_make_string(%1629, %1630) : (!llvm.ptr, i64) -> i64
      %1632 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1633 = arith.constant 11 : i64
      %1634 = func.call @cc_make_string(%1632, %1633) : (!llvm.ptr, i64) -> i64
      %1635 = func.call @cc_intern(%1631, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_cons(%1635, %1636) : (i64, i64) -> i64
      %1638 = func.call @cc_values_pack(%1637) : (i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      %1639 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1640 = arith.constant 42 : i64
      %1641 = func.call @cc_make_string(%1639, %1640) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1645 = arith.addi %1644, %__rlasp_stack_elide_zero_79 : i64
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = func.call @cc_cons(%1646, %1645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1647) : (i64) -> ()
      %1648 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1649 = arith.constant 15 : i64
      %1650 = func.call @cc_make_string(%1648, %1649) : (!llvm.ptr, i64) -> i64
      %1651 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1652 = arith.constant 7 : i64
      %1653 = func.call @cc_make_string(%1651, %1652) : (!llvm.ptr, i64) -> i64
      %1654 = func.call @cc_intern(%1650, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_nil_value() : () -> i64
      %1656 = func.call @cc_cons(%1654, %1655) : (i64, i64) -> i64
      %1657 = func.call @cc_values_pack(%1656) : (i64) -> i64
      func.call @stack_push_pointer(%1654) : (i64) -> ()
      %1658 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1659 = arith.constant 8 : i64
      %1660 = func.call @cc_make_string(%1658, %1659) : (!llvm.ptr, i64) -> i64
      %1661 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1662 = arith.constant 7 : i64
      %1663 = func.call @cc_make_string(%1661, %1662) : (!llvm.ptr, i64) -> i64
      %1664 = func.call @cc_intern(%1660, %1663) : (i64, i64) -> i64
      %1665 = func.call @cc_nil_value() : () -> i64
      %1666 = func.call @cc_cons(%1664, %1665) : (i64, i64) -> i64
      %1667 = func.call @cc_values_pack(%1666) : (i64) -> i64
      func.call @stack_push_pointer(%1664) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1668 = func.call @stack_pop_pointer() : () -> i64
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = func.call @cc_cons(%1669, %1668) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1671 = arith.addi %1670, %__rlasp_stack_elide_zero_80 : i64
      %1672 = func.call @stack_pop_pointer() : () -> i64
      %1673 = func.call @cc_cons(%1672, %1671) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1674 = arith.addi %1673, %__rlasp_stack_elide_zero_81 : i64
      %1675 = func.call @stack_pop_pointer() : () -> i64
      %1676 = func.call @cc_cons(%1675, %1674) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1677 = arith.addi %1676, %__rlasp_stack_elide_zero_82 : i64
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @cc_cons(%1678, %1677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @cc_cons(%1681, %1680) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1683 = arith.addi %1682, %__rlasp_stack_elide_zero_83 : i64
      %1684 = func.call @stack_pop_pointer() : () -> i64
      %1685 = func.call @cc_cons(%1684, %1683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @cc_cons(%1687, %1686) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1689 = arith.addi %1688, %__rlasp_stack_elide_zero_84 : i64
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @cc_cons(%1690, %1689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1692 = arith.addi %1691, %__rlasp_stack_elide_zero_85 : i64
      %1693 = func.call @stack_pop_pointer() : () -> i64
      %1694 = func.call @cc_cons(%1693, %1692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @stack_pop_pointer() : () -> i64
      %1697 = func.call @cc_cons(%1696, %1695) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1698 = arith.addi %1697, %__rlasp_stack_elide_zero_86 : i64
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @cc_cons(%1699, %1698) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1701 = arith.addi %1700, %__rlasp_stack_elide_zero_87 : i64
      %1786 = arith.constant 57937766645767 : i64
      %1787 = arith.constant 0 : i64
      %1788 = func.call @cc_make_closure(%1786, %1787) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1789 = arith.addi %1788, %__rlasp_stack_elide_zero_88 : i64
      %1790 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1791 = arith.constant 4 : i64
      %1792 = func.call @cc_make_string(%1790, %1791) : (!llvm.ptr, i64) -> i64
      %1793 = func.call @cc_nil_value() : () -> i64
      %1794 = func.call @cc_intern(%1792, %1793) : (i64, i64) -> i64
      %1795 = func.call @cc_nil_value() : () -> i64
      %1796 = func.call @cc_cons(%1794, %1795) : (i64, i64) -> i64
      %1797 = func.call @cc_values_pack(%1796) : (i64) -> i64
      func.call @stack_push_pointer(%1794) : (i64) -> ()
      %1798 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1799 = arith.constant 21 : i64
      %1800 = func.call @cc_make_string(%1798, %1799) : (!llvm.ptr, i64) -> i64
      %1801 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1802 = arith.constant 3 : i64
      %1803 = func.call @cc_make_string(%1801, %1802) : (!llvm.ptr, i64) -> i64
      %1804 = func.call @cc_intern(%1800, %1803) : (i64, i64) -> i64
      %1805 = func.call @cc_nil_value() : () -> i64
      %1806 = func.call @cc_cons(%1804, %1805) : (i64, i64) -> i64
      %1807 = func.call @cc_values_pack(%1806) : (i64) -> i64
      func.call @stack_push_pointer(%1804) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1808 = func.call @stack_pop_pointer() : () -> i64
      %1809 = func.call @stack_pop_pointer() : () -> i64
      %1810 = func.call @cc_cons(%1809, %1808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1811 = arith.addi %1810, %__rlasp_stack_elide_zero_89 : i64
      %1812 = func.call @stack_pop_pointer() : () -> i64
      %1813 = func.call @cc_cons(%1812, %1811) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1814 = arith.addi %1813, %__rlasp_stack_elide_zero_90 : i64
      %1815 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1816 = arith.constant 11 : i64
      %1817 = func.call @cc_make_string(%1815, %1816) : (!llvm.ptr, i64) -> i64
      %1818 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1819 = arith.constant 7 : i64
      %1820 = func.call @cc_make_string(%1818, %1819) : (!llvm.ptr, i64) -> i64
      %1821 = func.call @cc_intern(%1817, %1820) : (i64, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_cons(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_values_pack(%1823) : (i64) -> i64
      %1825 = func.call @cc_nil_value() : () -> i64
      %1826 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1827 = arith.constant 4 : i64
      %1828 = func.call @cc_make_string(%1826, %1827) : (!llvm.ptr, i64) -> i64
      %1829 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1830 = arith.constant 7 : i64
      %1831 = func.call @cc_make_string(%1829, %1830) : (!llvm.ptr, i64) -> i64
      %1832 = func.call @cc_intern(%1828, %1831) : (i64, i64) -> i64
      %1833 = func.call @cc_nil_value() : () -> i64
      %1834 = func.call @cc_cons(%1832, %1833) : (i64, i64) -> i64
      %1835 = func.call @cc_values_pack(%1834) : (i64) -> i64
      %1836 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1837 = arith.constant 5 : i64
      %1838 = func.call @cc_make_string(%1836, %1837) : (!llvm.ptr, i64) -> i64
      %1839 = func.call @cc_nil_value() : () -> i64
      %1840 = func.call @cc_intern(%1838, %1839) : (i64, i64) -> i64
      %1841 = func.call @cc_nil_value() : () -> i64
      %1842 = func.call @cc_cons(%1840, %1841) : (i64, i64) -> i64
      %1843 = func.call @cc_values_pack(%1842) : (i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1844 = arith.addi %1840, %__rlasp_stack_elide_zero_91 : i64
      %1845 = func.call @cc_nil_value() : () -> i64
      %1846 = func.call @cc_errorp(%1592) : (i64) -> i64
      %1847 = arith.cmpi ne, %1846, %1845 : i64
      %1848 = arith.cmpi eq, %1845, %1845 : i64
      %1849 = arith.andi %1847, %1848 : i1
      %1850 = scf.if %1849 -> (i64) {
        scf.yield %1592 : i64
      } else {
        scf.yield %1845 : i64
      }
      %1851 = func.call @cc_errorp(%1701) : (i64) -> i64
      %1852 = arith.cmpi ne, %1851, %1845 : i64
      %1853 = arith.cmpi eq, %1850, %1845 : i64
      %1854 = arith.andi %1852, %1853 : i1
      %1855 = scf.if %1854 -> (i64) {
        scf.yield %1701 : i64
      } else {
        scf.yield %1850 : i64
      }
      %1856 = func.call @cc_errorp(%1789) : (i64) -> i64
      %1857 = arith.cmpi ne, %1856, %1845 : i64
      %1858 = arith.cmpi eq, %1855, %1845 : i64
      %1859 = arith.andi %1857, %1858 : i1
      %1860 = scf.if %1859 -> (i64) {
        scf.yield %1789 : i64
      } else {
        scf.yield %1855 : i64
      }
      %1861 = func.call @cc_errorp(%1814) : (i64) -> i64
      %1862 = arith.cmpi ne, %1861, %1845 : i64
      %1863 = arith.cmpi eq, %1860, %1845 : i64
      %1864 = arith.andi %1862, %1863 : i1
      %1865 = scf.if %1864 -> (i64) {
        scf.yield %1814 : i64
      } else {
        scf.yield %1860 : i64
      }
      %1866 = func.call @cc_errorp(%1821) : (i64) -> i64
      %1867 = arith.cmpi ne, %1866, %1845 : i64
      %1868 = arith.cmpi eq, %1865, %1845 : i64
      %1869 = arith.andi %1867, %1868 : i1
      %1870 = scf.if %1869 -> (i64) {
        scf.yield %1821 : i64
      } else {
        scf.yield %1865 : i64
      }
      %1871 = func.call @cc_errorp(%1825) : (i64) -> i64
      %1872 = arith.cmpi ne, %1871, %1845 : i64
      %1873 = arith.cmpi eq, %1870, %1845 : i64
      %1874 = arith.andi %1872, %1873 : i1
      %1875 = scf.if %1874 -> (i64) {
        scf.yield %1825 : i64
      } else {
        scf.yield %1870 : i64
      }
      %1876 = func.call @cc_errorp(%1832) : (i64) -> i64
      %1877 = arith.cmpi ne, %1876, %1845 : i64
      %1878 = arith.cmpi eq, %1875, %1845 : i64
      %1879 = arith.andi %1877, %1878 : i1
      %1880 = scf.if %1879 -> (i64) {
        scf.yield %1832 : i64
      } else {
        scf.yield %1875 : i64
      }
      %1881 = func.call @cc_errorp(%1844) : (i64) -> i64
      %1882 = arith.cmpi ne, %1881, %1845 : i64
      %1883 = arith.cmpi eq, %1880, %1845 : i64
      %1884 = arith.andi %1882, %1883 : i1
      %1885 = scf.if %1884 -> (i64) {
        scf.yield %1844 : i64
      } else {
        scf.yield %1880 : i64
      }
      %1886 = arith.cmpi ne, %1885, %1845 : i64
      scf.if %1886 {
        func.call @stack_push_pointer(%1885) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1592) : (i64) -> ()
        func.call @stack_push_pointer(%1701) : (i64) -> ()
        func.call @stack_push_pointer(%1789) : (i64) -> ()
        func.call @stack_push_pointer(%1814) : (i64) -> ()
        func.call @stack_push_pointer(%1821) : (i64) -> ()
        func.call @stack_push_pointer(%1825) : (i64) -> ()
        func.call @stack_push_pointer(%1832) : (i64) -> ()
        func.call @stack_push_pointer(%1844) : (i64) -> ()
        %1887 = llvm.mlir.addressof @str175 : !llvm.ptr
        %1888 = func.call @cc_make_function_ref_const(%1887) : (!llvm.ptr) -> i64
        %1889 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1888, %1889) : (i64, i64) -> ()
      }
      %1890 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1890 : i64
    }
    %1891 = func.call @cc_nil_value() : () -> i64
    %1892 = func.call @cc_errorp(%1583) : (i64) -> i64
    %1893 = arith.cmpi ne, %1892, %1891 : i64
    %1894 = scf.if %1893 -> (i64) {
      scf.yield %1583 : i64
    } else {
      %1895 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1896 = arith.constant 28 : i64
      %1897 = func.call @cc_make_string(%1895, %1896) : (!llvm.ptr, i64) -> i64
      %1898 = func.call @cc_nil_value() : () -> i64
      %1899 = func.call @cc_intern(%1897, %1898) : (i64, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_cons(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_values_pack(%1901) : (i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1903 = arith.addi %1899, %__rlasp_stack_elide_zero_92 : i64
      %1904 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1905 = arith.constant 3 : i64
      %1906 = func.call @cc_make_string(%1904, %1905) : (!llvm.ptr, i64) -> i64
      %1907 = func.call @cc_nil_value() : () -> i64
      %1908 = func.call @cc_intern(%1906, %1907) : (i64, i64) -> i64
      %1909 = func.call @cc_nil_value() : () -> i64
      %1910 = func.call @cc_cons(%1908, %1909) : (i64, i64) -> i64
      %1911 = func.call @cc_values_pack(%1910) : (i64) -> i64
      func.call @stack_push_pointer(%1908) : (i64) -> ()
      %1912 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1913 = arith.constant 4 : i64
      %1914 = func.call @cc_make_string(%1912, %1913) : (!llvm.ptr, i64) -> i64
      %1915 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1916 = arith.constant 11 : i64
      %1917 = func.call @cc_make_string(%1915, %1916) : (!llvm.ptr, i64) -> i64
      %1918 = func.call @cc_intern(%1914, %1917) : (i64, i64) -> i64
      %1919 = func.call @cc_nil_value() : () -> i64
      %1920 = func.call @cc_cons(%1918, %1919) : (i64, i64) -> i64
      %1921 = func.call @cc_values_pack(%1920) : (i64) -> i64
      func.call @stack_push_pointer(%1918) : (i64) -> ()
      %1922 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1923 = arith.constant 9 : i64
      %1924 = func.call @cc_make_string(%1922, %1923) : (!llvm.ptr, i64) -> i64
      %1925 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1926 = arith.constant 11 : i64
      %1927 = func.call @cc_make_string(%1925, %1926) : (!llvm.ptr, i64) -> i64
      %1928 = func.call @cc_intern(%1924, %1927) : (i64, i64) -> i64
      %1929 = func.call @cc_nil_value() : () -> i64
      %1930 = func.call @cc_cons(%1928, %1929) : (i64, i64) -> i64
      %1931 = func.call @cc_values_pack(%1930) : (i64) -> i64
      func.call @stack_push_pointer(%1928) : (i64) -> ()
      %1932 = arith.constant 65 : i64
      func.call @stack_push_fixnum(%1932) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = func.call @stack_pop_pointer() : () -> i64
      %1935 = func.call @cc_cons(%1934, %1933) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1936 = arith.addi %1935, %__rlasp_stack_elide_zero_93 : i64
      %1937 = func.call @stack_pop_pointer() : () -> i64
      %1938 = func.call @cc_cons(%1937, %1936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @stack_pop_pointer() : () -> i64
      %1941 = func.call @cc_cons(%1940, %1939) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1942 = arith.addi %1941, %__rlasp_stack_elide_zero_94 : i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      %1945 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1946 = arith.constant 8 : i64
      %1947 = func.call @cc_make_string(%1945, %1946) : (!llvm.ptr, i64) -> i64
      %1948 = func.call @cc_nil_value() : () -> i64
      %1949 = func.call @cc_intern(%1947, %1948) : (i64, i64) -> i64
      %1950 = func.call @cc_nil_value() : () -> i64
      %1951 = func.call @cc_cons(%1949, %1950) : (i64, i64) -> i64
      %1952 = func.call @cc_values_pack(%1951) : (i64) -> i64
      func.call @stack_push_pointer(%1949) : (i64) -> ()
      %1953 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1954 = arith.constant 47 : i64
      %1955 = func.call @cc_make_string(%1953, %1954) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @cc_cons(%1957, %1956) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1959 = arith.addi %1958, %__rlasp_stack_elide_zero_95 : i64
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_cons(%1960, %1959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1961) : (i64) -> ()
      %1962 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1963 = arith.constant 3 : i64
      %1964 = func.call @cc_make_string(%1962, %1963) : (!llvm.ptr, i64) -> i64
      %1965 = func.call @cc_nil_value() : () -> i64
      %1966 = func.call @cc_intern(%1964, %1965) : (i64, i64) -> i64
      %1967 = func.call @cc_nil_value() : () -> i64
      %1968 = func.call @cc_cons(%1966, %1967) : (i64, i64) -> i64
      %1969 = func.call @cc_values_pack(%1968) : (i64) -> i64
      func.call @stack_push_pointer(%1966) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1970 = func.call @stack_pop_pointer() : () -> i64
      %1971 = func.call @stack_pop_pointer() : () -> i64
      %1972 = func.call @cc_cons(%1971, %1970) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1973 = arith.addi %1972, %__rlasp_stack_elide_zero_96 : i64
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %1975 = func.call @cc_cons(%1974, %1973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1975) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1976 = func.call @stack_pop_pointer() : () -> i64
      %1977 = func.call @stack_pop_pointer() : () -> i64
      %1978 = func.call @cc_cons(%1977, %1976) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1979 = arith.addi %1978, %__rlasp_stack_elide_zero_97 : i64
      %1980 = func.call @stack_pop_pointer() : () -> i64
      %1981 = func.call @cc_cons(%1980, %1979) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %1982 = arith.addi %1981, %__rlasp_stack_elide_zero_98 : i64
      %1983 = func.call @stack_pop_pointer() : () -> i64
      %1984 = func.call @cc_cons(%1983, %1982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1984) : (i64) -> ()
      %1985 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1986 = arith.constant 14 : i64
      %1987 = func.call @cc_make_string(%1985, %1986) : (!llvm.ptr, i64) -> i64
      %1988 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1989 = arith.constant 11 : i64
      %1990 = func.call @cc_make_string(%1988, %1989) : (!llvm.ptr, i64) -> i64
      %1991 = func.call @cc_intern(%1987, %1990) : (i64, i64) -> i64
      %1992 = func.call @cc_nil_value() : () -> i64
      %1993 = func.call @cc_cons(%1991, %1992) : (i64, i64) -> i64
      %1994 = func.call @cc_values_pack(%1993) : (i64) -> i64
      func.call @stack_push_pointer(%1991) : (i64) -> ()
      %1995 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1996 = arith.constant 6 : i64
      %1997 = func.call @cc_make_string(%1995, %1996) : (!llvm.ptr, i64) -> i64
      %1998 = func.call @cc_nil_value() : () -> i64
      %1999 = func.call @cc_intern(%1997, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_nil_value() : () -> i64
      %2001 = func.call @cc_cons(%1999, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2003 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2004 = arith.constant 8 : i64
      %2005 = func.call @cc_make_string(%2003, %2004) : (!llvm.ptr, i64) -> i64
      %2006 = func.call @cc_nil_value() : () -> i64
      %2007 = func.call @cc_intern(%2005, %2006) : (i64, i64) -> i64
      %2008 = func.call @cc_nil_value() : () -> i64
      %2009 = func.call @cc_cons(%2007, %2008) : (i64, i64) -> i64
      %2010 = func.call @cc_values_pack(%2009) : (i64) -> i64
      func.call @stack_push_pointer(%2007) : (i64) -> ()
      %2011 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2012 = arith.constant 13 : i64
      %2013 = func.call @cc_make_string(%2011, %2012) : (!llvm.ptr, i64) -> i64
      %2014 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2015 = arith.constant 3 : i64
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
      func.call @stack_push_pointer(%2023) : (i64) -> ()
      %2024 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2025 = arith.constant 3 : i64
      %2026 = func.call @cc_make_string(%2024, %2025) : (!llvm.ptr, i64) -> i64
      %2027 = func.call @cc_nil_value() : () -> i64
      %2028 = func.call @cc_intern(%2026, %2027) : (i64, i64) -> i64
      %2029 = func.call @cc_nil_value() : () -> i64
      %2030 = func.call @cc_cons(%2028, %2029) : (i64, i64) -> i64
      %2031 = func.call @cc_values_pack(%2030) : (i64) -> i64
      func.call @stack_push_pointer(%2028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2032 = func.call @stack_pop_pointer() : () -> i64
      %2033 = func.call @stack_pop_pointer() : () -> i64
      %2034 = func.call @cc_cons(%2033, %2032) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2035 = arith.addi %2034, %__rlasp_stack_elide_zero_99 : i64
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = func.call @cc_cons(%2036, %2035) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2038 = arith.addi %2037, %__rlasp_stack_elide_zero_100 : i64
      %2039 = func.call @stack_pop_pointer() : () -> i64
      %2040 = func.call @cc_cons(%2039, %2038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2040) : (i64) -> ()
      %2041 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2042 = arith.constant 14 : i64
      %2043 = func.call @cc_make_string(%2041, %2042) : (!llvm.ptr, i64) -> i64
      %2044 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2045 = arith.constant 11 : i64
      %2046 = func.call @cc_make_string(%2044, %2045) : (!llvm.ptr, i64) -> i64
      %2047 = func.call @cc_intern(%2043, %2046) : (i64, i64) -> i64
      %2048 = func.call @cc_nil_value() : () -> i64
      %2049 = func.call @cc_cons(%2047, %2048) : (i64, i64) -> i64
      %2050 = func.call @cc_values_pack(%2049) : (i64) -> i64
      func.call @stack_push_pointer(%2047) : (i64) -> ()
      %2051 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2052 = arith.constant 6 : i64
      %2053 = func.call @cc_make_string(%2051, %2052) : (!llvm.ptr, i64) -> i64
      %2054 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2055 = arith.constant 11 : i64
      %2056 = func.call @cc_make_string(%2054, %2055) : (!llvm.ptr, i64) -> i64
      %2057 = func.call @cc_intern(%2053, %2056) : (i64, i64) -> i64
      %2058 = func.call @cc_nil_value() : () -> i64
      %2059 = func.call @cc_cons(%2057, %2058) : (i64, i64) -> i64
      %2060 = func.call @cc_values_pack(%2059) : (i64) -> i64
      func.call @stack_push_pointer(%2057) : (i64) -> ()
      %2061 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2062 = arith.constant 8 : i64
      %2063 = func.call @cc_make_string(%2061, %2062) : (!llvm.ptr, i64) -> i64
      %2064 = func.call @cc_nil_value() : () -> i64
      %2065 = func.call @cc_intern(%2063, %2064) : (i64, i64) -> i64
      %2066 = func.call @cc_nil_value() : () -> i64
      %2067 = func.call @cc_cons(%2065, %2066) : (i64, i64) -> i64
      %2068 = func.call @cc_values_pack(%2067) : (i64) -> i64
      func.call @stack_push_pointer(%2065) : (i64) -> ()
      %2069 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2070 = arith.constant 9 : i64
      %2071 = func.call @cc_make_string(%2069, %2070) : (!llvm.ptr, i64) -> i64
      %2072 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2073 = arith.constant 7 : i64
      %2074 = func.call @cc_make_string(%2072, %2073) : (!llvm.ptr, i64) -> i64
      %2075 = func.call @cc_intern(%2071, %2074) : (i64, i64) -> i64
      %2076 = func.call @cc_nil_value() : () -> i64
      %2077 = func.call @cc_cons(%2075, %2076) : (i64, i64) -> i64
      %2078 = func.call @cc_values_pack(%2077) : (i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2079 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2080 = arith.constant 6 : i64
      %2081 = func.call @cc_make_string(%2079, %2080) : (!llvm.ptr, i64) -> i64
      %2082 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2083 = arith.constant 7 : i64
      %2084 = func.call @cc_make_string(%2082, %2083) : (!llvm.ptr, i64) -> i64
      %2085 = func.call @cc_intern(%2081, %2084) : (i64, i64) -> i64
      %2086 = func.call @cc_nil_value() : () -> i64
      %2087 = func.call @cc_cons(%2085, %2086) : (i64, i64) -> i64
      %2088 = func.call @cc_values_pack(%2087) : (i64) -> i64
      func.call @stack_push_pointer(%2085) : (i64) -> ()
      %2089 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2090 = arith.constant 9 : i64
      %2091 = func.call @cc_make_string(%2089, %2090) : (!llvm.ptr, i64) -> i64
      %2092 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2093 = arith.constant 7 : i64
      %2094 = func.call @cc_make_string(%2092, %2093) : (!llvm.ptr, i64) -> i64
      %2095 = func.call @cc_intern(%2091, %2094) : (i64, i64) -> i64
      %2096 = func.call @cc_nil_value() : () -> i64
      %2097 = func.call @cc_cons(%2095, %2096) : (i64, i64) -> i64
      %2098 = func.call @cc_values_pack(%2097) : (i64) -> i64
      func.call @stack_push_pointer(%2095) : (i64) -> ()
      %2099 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2100 = arith.constant 9 : i64
      %2101 = func.call @cc_make_string(%2099, %2100) : (!llvm.ptr, i64) -> i64
      %2102 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2103 = arith.constant 7 : i64
      %2104 = func.call @cc_make_string(%2102, %2103) : (!llvm.ptr, i64) -> i64
      %2105 = func.call @cc_intern(%2101, %2104) : (i64, i64) -> i64
      %2106 = func.call @cc_nil_value() : () -> i64
      %2107 = func.call @cc_cons(%2105, %2106) : (i64, i64) -> i64
      %2108 = func.call @cc_values_pack(%2107) : (i64) -> i64
      func.call @stack_push_pointer(%2105) : (i64) -> ()
      %2109 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2110 = arith.constant 17 : i64
      %2111 = func.call @cc_make_string(%2109, %2110) : (!llvm.ptr, i64) -> i64
      %2112 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2113 = arith.constant 7 : i64
      %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
      %2115 = func.call @cc_intern(%2111, %2114) : (i64, i64) -> i64
      %2116 = func.call @cc_nil_value() : () -> i64
      %2117 = func.call @cc_cons(%2115, %2116) : (i64, i64) -> i64
      %2118 = func.call @cc_values_pack(%2117) : (i64) -> i64
      func.call @stack_push_pointer(%2115) : (i64) -> ()
      %2119 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2120 = arith.constant 6 : i64
      %2121 = func.call @cc_make_string(%2119, %2120) : (!llvm.ptr, i64) -> i64
      %2122 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2123 = arith.constant 7 : i64
      %2124 = func.call @cc_make_string(%2122, %2123) : (!llvm.ptr, i64) -> i64
      %2125 = func.call @cc_intern(%2121, %2124) : (i64, i64) -> i64
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = func.call @cc_cons(%2125, %2126) : (i64, i64) -> i64
      %2128 = func.call @cc_values_pack(%2127) : (i64) -> i64
      func.call @stack_push_pointer(%2125) : (i64) -> ()
      %2129 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2130 = arith.constant 15 : i64
      %2131 = func.call @cc_make_string(%2129, %2130) : (!llvm.ptr, i64) -> i64
      %2132 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2133 = arith.constant 7 : i64
      %2134 = func.call @cc_make_string(%2132, %2133) : (!llvm.ptr, i64) -> i64
      %2135 = func.call @cc_intern(%2131, %2134) : (i64, i64) -> i64
      %2136 = func.call @cc_nil_value() : () -> i64
      %2137 = func.call @cc_cons(%2135, %2136) : (i64, i64) -> i64
      %2138 = func.call @cc_values_pack(%2137) : (i64) -> i64
      func.call @stack_push_pointer(%2135) : (i64) -> ()
      %2139 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2140 = arith.constant 8 : i64
      %2141 = func.call @cc_make_string(%2139, %2140) : (!llvm.ptr, i64) -> i64
      %2142 = func.call @cc_nil_value() : () -> i64
      %2143 = func.call @cc_intern(%2141, %2142) : (i64, i64) -> i64
      %2144 = func.call @cc_nil_value() : () -> i64
      %2145 = func.call @cc_cons(%2143, %2144) : (i64, i64) -> i64
      %2146 = func.call @cc_values_pack(%2145) : (i64) -> i64
      func.call @stack_push_pointer(%2143) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2147 = func.call @stack_pop_pointer() : () -> i64
      %2148 = func.call @stack_pop_pointer() : () -> i64
      %2149 = func.call @cc_cons(%2148, %2147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2150 = arith.addi %2149, %__rlasp_stack_elide_zero_101 : i64
      %2151 = func.call @stack_pop_pointer() : () -> i64
      %2152 = func.call @cc_cons(%2151, %2150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2153 = arith.addi %2152, %__rlasp_stack_elide_zero_102 : i64
      %2154 = func.call @stack_pop_pointer() : () -> i64
      %2155 = func.call @cc_cons(%2154, %2153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2156 = arith.addi %2155, %__rlasp_stack_elide_zero_103 : i64
      %2157 = func.call @stack_pop_pointer() : () -> i64
      %2158 = func.call @cc_cons(%2157, %2156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2159 = arith.addi %2158, %__rlasp_stack_elide_zero_104 : i64
      %2160 = func.call @stack_pop_pointer() : () -> i64
      %2161 = func.call @cc_cons(%2160, %2159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2162 = arith.addi %2161, %__rlasp_stack_elide_zero_105 : i64
      %2163 = func.call @stack_pop_pointer() : () -> i64
      %2164 = func.call @cc_cons(%2163, %2162) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2165 = arith.addi %2164, %__rlasp_stack_elide_zero_106 : i64
      %2166 = func.call @stack_pop_pointer() : () -> i64
      %2167 = func.call @cc_cons(%2166, %2165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2168 = arith.addi %2167, %__rlasp_stack_elide_zero_107 : i64
      %2169 = func.call @stack_pop_pointer() : () -> i64
      %2170 = func.call @cc_cons(%2169, %2168) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2171 = arith.addi %2170, %__rlasp_stack_elide_zero_108 : i64
      %2172 = func.call @stack_pop_pointer() : () -> i64
      %2173 = func.call @cc_cons(%2172, %2171) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2174 = arith.addi %2173, %__rlasp_stack_elide_zero_109 : i64
      %2175 = func.call @stack_pop_pointer() : () -> i64
      %2176 = func.call @cc_cons(%2175, %2174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2176) : (i64) -> ()
      %2177 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2178 = arith.constant 10 : i64
      %2179 = func.call @cc_make_string(%2177, %2178) : (!llvm.ptr, i64) -> i64
      %2180 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2181 = arith.constant 11 : i64
      %2182 = func.call @cc_make_string(%2180, %2181) : (!llvm.ptr, i64) -> i64
      %2183 = func.call @cc_intern(%2179, %2182) : (i64, i64) -> i64
      %2184 = func.call @cc_nil_value() : () -> i64
      %2185 = func.call @cc_cons(%2183, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_values_pack(%2185) : (i64) -> i64
      func.call @stack_push_pointer(%2183) : (i64) -> ()
      %2187 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2188 = arith.constant 4 : i64
      %2189 = func.call @cc_make_string(%2187, %2188) : (!llvm.ptr, i64) -> i64
      %2190 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2191 = arith.constant 11 : i64
      %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
      %2193 = func.call @cc_intern(%2189, %2192) : (i64, i64) -> i64
      %2194 = func.call @cc_nil_value() : () -> i64
      %2195 = func.call @cc_cons(%2193, %2194) : (i64, i64) -> i64
      %2196 = func.call @cc_values_pack(%2195) : (i64) -> i64
      func.call @stack_push_pointer(%2193) : (i64) -> ()
      %2197 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2198 = arith.constant 6 : i64
      %2199 = func.call @cc_make_string(%2197, %2198) : (!llvm.ptr, i64) -> i64
      %2200 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2201 = arith.constant 11 : i64
      %2202 = func.call @cc_make_string(%2200, %2201) : (!llvm.ptr, i64) -> i64
      %2203 = func.call @cc_intern(%2199, %2202) : (i64, i64) -> i64
      %2204 = func.call @cc_nil_value() : () -> i64
      %2205 = func.call @cc_cons(%2203, %2204) : (i64, i64) -> i64
      %2206 = func.call @cc_values_pack(%2205) : (i64) -> i64
      func.call @stack_push_pointer(%2203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2207 = func.call @stack_pop_pointer() : () -> i64
      %2208 = func.call @stack_pop_pointer() : () -> i64
      %2209 = func.call @cc_cons(%2208, %2207) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2210 = arith.addi %2209, %__rlasp_stack_elide_zero_110 : i64
      %2211 = func.call @stack_pop_pointer() : () -> i64
      %2212 = func.call @cc_cons(%2211, %2210) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2213 = arith.addi %2212, %__rlasp_stack_elide_zero_111 : i64
      %2214 = func.call @stack_pop_pointer() : () -> i64
      %2215 = func.call @cc_cons(%2214, %2213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2216 = func.call @stack_pop_pointer() : () -> i64
      %2217 = func.call @stack_pop_pointer() : () -> i64
      %2218 = func.call @cc_cons(%2217, %2216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2219 = arith.addi %2218, %__rlasp_stack_elide_zero_112 : i64
      %2220 = func.call @stack_pop_pointer() : () -> i64
      %2221 = func.call @cc_cons(%2220, %2219) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2222 = arith.addi %2221, %__rlasp_stack_elide_zero_113 : i64
      %2223 = func.call @stack_pop_pointer() : () -> i64
      %2224 = func.call @cc_cons(%2223, %2222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2224) : (i64) -> ()
      %2225 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2226 = arith.constant 14 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2229 = arith.constant 11 : i64
      %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
      %2231 = func.call @cc_intern(%2227, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = func.call @cc_cons(%2231, %2232) : (i64, i64) -> i64
      %2234 = func.call @cc_values_pack(%2233) : (i64) -> i64
      func.call @stack_push_pointer(%2231) : (i64) -> ()
      %2235 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2236 = arith.constant 6 : i64
      %2237 = func.call @cc_make_string(%2235, %2236) : (!llvm.ptr, i64) -> i64
      %2238 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2239 = arith.constant 11 : i64
      %2240 = func.call @cc_make_string(%2238, %2239) : (!llvm.ptr, i64) -> i64
      %2241 = func.call @cc_intern(%2237, %2240) : (i64, i64) -> i64
      %2242 = func.call @cc_nil_value() : () -> i64
      %2243 = func.call @cc_cons(%2241, %2242) : (i64, i64) -> i64
      %2244 = func.call @cc_values_pack(%2243) : (i64) -> i64
      func.call @stack_push_pointer(%2241) : (i64) -> ()
      %2245 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2246 = arith.constant 8 : i64
      %2247 = func.call @cc_make_string(%2245, %2246) : (!llvm.ptr, i64) -> i64
      %2248 = func.call @cc_nil_value() : () -> i64
      %2249 = func.call @cc_intern(%2247, %2248) : (i64, i64) -> i64
      %2250 = func.call @cc_nil_value() : () -> i64
      %2251 = func.call @cc_cons(%2249, %2250) : (i64, i64) -> i64
      %2252 = func.call @cc_values_pack(%2251) : (i64) -> i64
      func.call @stack_push_pointer(%2249) : (i64) -> ()
      %2253 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2254 = arith.constant 9 : i64
      %2255 = func.call @cc_make_string(%2253, %2254) : (!llvm.ptr, i64) -> i64
      %2256 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2257 = arith.constant 7 : i64
      %2258 = func.call @cc_make_string(%2256, %2257) : (!llvm.ptr, i64) -> i64
      %2259 = func.call @cc_intern(%2255, %2258) : (i64, i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = func.call @cc_cons(%2259, %2260) : (i64, i64) -> i64
      %2262 = func.call @cc_values_pack(%2261) : (i64) -> i64
      func.call @stack_push_pointer(%2259) : (i64) -> ()
      %2263 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2264 = arith.constant 5 : i64
      %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
      %2266 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2267 = arith.constant 7 : i64
      %2268 = func.call @cc_make_string(%2266, %2267) : (!llvm.ptr, i64) -> i64
      %2269 = func.call @cc_intern(%2265, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_nil_value() : () -> i64
      %2271 = func.call @cc_cons(%2269, %2270) : (i64, i64) -> i64
      %2272 = func.call @cc_values_pack(%2271) : (i64) -> i64
      func.call @stack_push_pointer(%2269) : (i64) -> ()
      %2273 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2274 = arith.constant 15 : i64
      %2275 = func.call @cc_make_string(%2273, %2274) : (!llvm.ptr, i64) -> i64
      %2276 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2277 = arith.constant 7 : i64
      %2278 = func.call @cc_make_string(%2276, %2277) : (!llvm.ptr, i64) -> i64
      %2279 = func.call @cc_intern(%2275, %2278) : (i64, i64) -> i64
      %2280 = func.call @cc_nil_value() : () -> i64
      %2281 = func.call @cc_cons(%2279, %2280) : (i64, i64) -> i64
      %2282 = func.call @cc_values_pack(%2281) : (i64) -> i64
      func.call @stack_push_pointer(%2279) : (i64) -> ()
      %2283 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2284 = arith.constant 8 : i64
      %2285 = func.call @cc_make_string(%2283, %2284) : (!llvm.ptr, i64) -> i64
      %2286 = func.call @cc_nil_value() : () -> i64
      %2287 = func.call @cc_intern(%2285, %2286) : (i64, i64) -> i64
      %2288 = func.call @cc_nil_value() : () -> i64
      %2289 = func.call @cc_cons(%2287, %2288) : (i64, i64) -> i64
      %2290 = func.call @cc_values_pack(%2289) : (i64) -> i64
      func.call @stack_push_pointer(%2287) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2291 = func.call @stack_pop_pointer() : () -> i64
      %2292 = func.call @stack_pop_pointer() : () -> i64
      %2293 = func.call @cc_cons(%2292, %2291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2294 = arith.addi %2293, %__rlasp_stack_elide_zero_114 : i64
      %2295 = func.call @stack_pop_pointer() : () -> i64
      %2296 = func.call @cc_cons(%2295, %2294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2297 = arith.addi %2296, %__rlasp_stack_elide_zero_115 : i64
      %2298 = func.call @stack_pop_pointer() : () -> i64
      %2299 = func.call @cc_cons(%2298, %2297) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2300 = arith.addi %2299, %__rlasp_stack_elide_zero_116 : i64
      %2301 = func.call @stack_pop_pointer() : () -> i64
      %2302 = func.call @cc_cons(%2301, %2300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2303 = arith.addi %2302, %__rlasp_stack_elide_zero_117 : i64
      %2304 = func.call @stack_pop_pointer() : () -> i64
      %2305 = func.call @cc_cons(%2304, %2303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2306 = arith.addi %2305, %__rlasp_stack_elide_zero_118 : i64
      %2307 = func.call @stack_pop_pointer() : () -> i64
      %2308 = func.call @cc_cons(%2307, %2306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2308) : (i64) -> ()
      %2309 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2310 = arith.constant 3 : i64
      %2311 = func.call @cc_make_string(%2309, %2310) : (!llvm.ptr, i64) -> i64
      %2312 = func.call @cc_nil_value() : () -> i64
      %2313 = func.call @cc_intern(%2311, %2312) : (i64, i64) -> i64
      %2314 = func.call @cc_nil_value() : () -> i64
      %2315 = func.call @cc_cons(%2313, %2314) : (i64, i64) -> i64
      %2316 = func.call @cc_values_pack(%2315) : (i64) -> i64
      func.call @stack_push_pointer(%2313) : (i64) -> ()
      %2317 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2318 = arith.constant 9 : i64
      %2319 = func.call @cc_make_string(%2317, %2318) : (!llvm.ptr, i64) -> i64
      %2320 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2321 = arith.constant 11 : i64
      %2322 = func.call @cc_make_string(%2320, %2321) : (!llvm.ptr, i64) -> i64
      %2323 = func.call @cc_intern(%2319, %2322) : (i64, i64) -> i64
      %2324 = func.call @cc_nil_value() : () -> i64
      %2325 = func.call @cc_cons(%2323, %2324) : (i64, i64) -> i64
      %2326 = func.call @cc_values_pack(%2325) : (i64) -> i64
      func.call @stack_push_pointer(%2323) : (i64) -> ()
      %2327 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2328 = arith.constant 9 : i64
      %2329 = func.call @cc_make_string(%2327, %2328) : (!llvm.ptr, i64) -> i64
      %2330 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2331 = arith.constant 11 : i64
      %2332 = func.call @cc_make_string(%2330, %2331) : (!llvm.ptr, i64) -> i64
      %2333 = func.call @cc_intern(%2329, %2332) : (i64, i64) -> i64
      %2334 = func.call @cc_nil_value() : () -> i64
      %2335 = func.call @cc_cons(%2333, %2334) : (i64, i64) -> i64
      %2336 = func.call @cc_values_pack(%2335) : (i64) -> i64
      func.call @stack_push_pointer(%2333) : (i64) -> ()
      %2337 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2338 = arith.constant 6 : i64
      %2339 = func.call @cc_make_string(%2337, %2338) : (!llvm.ptr, i64) -> i64
      %2340 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2341 = arith.constant 11 : i64
      %2342 = func.call @cc_make_string(%2340, %2341) : (!llvm.ptr, i64) -> i64
      %2343 = func.call @cc_intern(%2339, %2342) : (i64, i64) -> i64
      %2344 = func.call @cc_nil_value() : () -> i64
      %2345 = func.call @cc_cons(%2343, %2344) : (i64, i64) -> i64
      %2346 = func.call @cc_values_pack(%2345) : (i64) -> i64
      func.call @stack_push_pointer(%2343) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = func.call @stack_pop_pointer() : () -> i64
      %2349 = func.call @cc_cons(%2348, %2347) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2350 = arith.addi %2349, %__rlasp_stack_elide_zero_119 : i64
      %2351 = func.call @stack_pop_pointer() : () -> i64
      %2352 = func.call @cc_cons(%2351, %2350) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2352) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @stack_pop_pointer() : () -> i64
      %2355 = func.call @cc_cons(%2354, %2353) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2356 = arith.addi %2355, %__rlasp_stack_elide_zero_120 : i64
      %2357 = func.call @stack_pop_pointer() : () -> i64
      %2358 = func.call @cc_cons(%2357, %2356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2358) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2359 = func.call @stack_pop_pointer() : () -> i64
      %2360 = func.call @stack_pop_pointer() : () -> i64
      %2361 = func.call @cc_cons(%2360, %2359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2361) : (i64) -> ()
      %2362 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2363 = arith.constant 2 : i64
      %2364 = func.call @cc_make_string(%2362, %2363) : (!llvm.ptr, i64) -> i64
      %2365 = func.call @cc_nil_value() : () -> i64
      %2366 = func.call @cc_intern(%2364, %2365) : (i64, i64) -> i64
      %2367 = func.call @cc_nil_value() : () -> i64
      %2368 = func.call @cc_cons(%2366, %2367) : (i64, i64) -> i64
      %2369 = func.call @cc_values_pack(%2368) : (i64) -> i64
      func.call @stack_push_pointer(%2366) : (i64) -> ()
      %2370 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2371 = arith.constant 3 : i64
      %2372 = func.call @cc_make_string(%2370, %2371) : (!llvm.ptr, i64) -> i64
      %2373 = func.call @cc_nil_value() : () -> i64
      %2374 = func.call @cc_intern(%2372, %2373) : (i64, i64) -> i64
      %2375 = func.call @cc_nil_value() : () -> i64
      %2376 = func.call @cc_cons(%2374, %2375) : (i64, i64) -> i64
      %2377 = func.call @cc_values_pack(%2376) : (i64) -> i64
      func.call @stack_push_pointer(%2374) : (i64) -> ()
      %2378 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2379 = arith.constant 6 : i64
      %2380 = func.call @cc_make_string(%2378, %2379) : (!llvm.ptr, i64) -> i64
      %2381 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2382 = arith.constant 11 : i64
      %2383 = func.call @cc_make_string(%2381, %2382) : (!llvm.ptr, i64) -> i64
      %2384 = func.call @cc_intern(%2380, %2383) : (i64, i64) -> i64
      %2385 = func.call @cc_nil_value() : () -> i64
      %2386 = func.call @cc_cons(%2384, %2385) : (i64, i64) -> i64
      %2387 = func.call @cc_values_pack(%2386) : (i64) -> i64
      func.call @stack_push_pointer(%2384) : (i64) -> ()
      %2388 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2389 = arith.constant 8 : i64
      %2390 = func.call @cc_make_string(%2388, %2389) : (!llvm.ptr, i64) -> i64
      %2391 = func.call @cc_nil_value() : () -> i64
      %2392 = func.call @cc_intern(%2390, %2391) : (i64, i64) -> i64
      %2393 = func.call @cc_nil_value() : () -> i64
      %2394 = func.call @cc_cons(%2392, %2393) : (i64, i64) -> i64
      %2395 = func.call @cc_values_pack(%2394) : (i64) -> i64
      func.call @stack_push_pointer(%2392) : (i64) -> ()
      %2396 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2396) : (i64) -> ()
      %2397 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2398 = arith.constant 5 : i64
      %2399 = func.call @cc_make_string(%2397, %2398) : (!llvm.ptr, i64) -> i64
      %2400 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2401 = arith.constant 7 : i64
      %2402 = func.call @cc_make_string(%2400, %2401) : (!llvm.ptr, i64) -> i64
      %2403 = func.call @cc_intern(%2399, %2402) : (i64, i64) -> i64
      %2404 = func.call @cc_nil_value() : () -> i64
      %2405 = func.call @cc_cons(%2403, %2404) : (i64, i64) -> i64
      %2406 = func.call @cc_values_pack(%2405) : (i64) -> i64
      func.call @stack_push_pointer(%2403) : (i64) -> ()
      %2407 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2408 = arith.constant 5 : i64
      %2409 = func.call @cc_make_string(%2407, %2408) : (!llvm.ptr, i64) -> i64
      %2410 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2411 = arith.constant 7 : i64
      %2412 = func.call @cc_make_string(%2410, %2411) : (!llvm.ptr, i64) -> i64
      %2413 = func.call @cc_intern(%2409, %2412) : (i64, i64) -> i64
      %2414 = func.call @cc_nil_value() : () -> i64
      %2415 = func.call @cc_cons(%2413, %2414) : (i64, i64) -> i64
      %2416 = func.call @cc_values_pack(%2415) : (i64) -> i64
      func.call @stack_push_pointer(%2413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2417 = func.call @stack_pop_pointer() : () -> i64
      %2418 = func.call @stack_pop_pointer() : () -> i64
      %2419 = func.call @cc_cons(%2418, %2417) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2420 = arith.addi %2419, %__rlasp_stack_elide_zero_121 : i64
      %2421 = func.call @stack_pop_pointer() : () -> i64
      %2422 = func.call @cc_cons(%2421, %2420) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2423 = arith.addi %2422, %__rlasp_stack_elide_zero_122 : i64
      %2424 = func.call @stack_pop_pointer() : () -> i64
      %2425 = func.call @cc_cons(%2423, %2424) : (i64, i64) -> i64
      %2426 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2427 = arith.constant 5 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = func.call @cc_nil_value() : () -> i64
      %2430 = func.call @cc_intern(%2428, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
      %2434 = func.call @cc_cons(%2430, %2425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2434) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2435 = func.call @stack_pop_pointer() : () -> i64
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @cc_cons(%2436, %2435) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2438 = arith.addi %2437, %__rlasp_stack_elide_zero_123 : i64
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @cc_cons(%2439, %2438) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2441 = arith.addi %2440, %__rlasp_stack_elide_zero_124 : i64
      %2442 = func.call @stack_pop_pointer() : () -> i64
      %2443 = func.call @cc_cons(%2442, %2441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2444 = func.call @stack_pop_pointer() : () -> i64
      %2445 = func.call @stack_pop_pointer() : () -> i64
      %2446 = func.call @cc_cons(%2445, %2444) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2447 = arith.addi %2446, %__rlasp_stack_elide_zero_125 : i64
      %2448 = func.call @stack_pop_pointer() : () -> i64
      %2449 = func.call @cc_cons(%2448, %2447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2449) : (i64) -> ()
      %2450 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2451 = arith.constant 5 : i64
      %2452 = func.call @cc_make_string(%2450, %2451) : (!llvm.ptr, i64) -> i64
      %2453 = func.call @cc_nil_value() : () -> i64
      %2454 = func.call @cc_intern(%2452, %2453) : (i64, i64) -> i64
      %2455 = func.call @cc_nil_value() : () -> i64
      %2456 = func.call @cc_cons(%2454, %2455) : (i64, i64) -> i64
      %2457 = func.call @cc_values_pack(%2456) : (i64) -> i64
      func.call @stack_push_pointer(%2454) : (i64) -> ()
      %2458 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2459 = arith.constant 2 : i64
      %2460 = func.call @cc_make_string(%2458, %2459) : (!llvm.ptr, i64) -> i64
      %2461 = func.call @cc_nil_value() : () -> i64
      %2462 = func.call @cc_intern(%2460, %2461) : (i64, i64) -> i64
      %2463 = func.call @cc_nil_value() : () -> i64
      %2464 = func.call @cc_cons(%2462, %2463) : (i64, i64) -> i64
      %2465 = func.call @cc_values_pack(%2464) : (i64) -> i64
      func.call @stack_push_pointer(%2462) : (i64) -> ()
      %2466 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2467 = arith.constant 3 : i64
      %2468 = func.call @cc_make_string(%2466, %2467) : (!llvm.ptr, i64) -> i64
      %2469 = func.call @cc_nil_value() : () -> i64
      %2470 = func.call @cc_intern(%2468, %2469) : (i64, i64) -> i64
      %2471 = func.call @cc_nil_value() : () -> i64
      %2472 = func.call @cc_cons(%2470, %2471) : (i64, i64) -> i64
      %2473 = func.call @cc_values_pack(%2472) : (i64) -> i64
      func.call @stack_push_pointer(%2470) : (i64) -> ()
      %2474 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2475 = arith.constant 5 : i64
      %2476 = func.call @cc_make_string(%2474, %2475) : (!llvm.ptr, i64) -> i64
      %2477 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2478 = arith.constant 11 : i64
      %2479 = func.call @cc_make_string(%2477, %2478) : (!llvm.ptr, i64) -> i64
      %2480 = func.call @cc_intern(%2476, %2479) : (i64, i64) -> i64
      %2481 = func.call @cc_nil_value() : () -> i64
      %2482 = func.call @cc_cons(%2480, %2481) : (i64, i64) -> i64
      %2483 = func.call @cc_values_pack(%2482) : (i64) -> i64
      func.call @stack_push_pointer(%2480) : (i64) -> ()
      %2484 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2485 = arith.constant 4 : i64
      %2486 = func.call @cc_make_string(%2484, %2485) : (!llvm.ptr, i64) -> i64
      %2487 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2488 = arith.constant 11 : i64
      %2489 = func.call @cc_make_string(%2487, %2488) : (!llvm.ptr, i64) -> i64
      %2490 = func.call @cc_intern(%2486, %2489) : (i64, i64) -> i64
      %2491 = func.call @cc_nil_value() : () -> i64
      %2492 = func.call @cc_cons(%2490, %2491) : (i64, i64) -> i64
      %2493 = func.call @cc_values_pack(%2492) : (i64) -> i64
      func.call @stack_push_pointer(%2490) : (i64) -> ()
      %2494 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2495 = arith.constant 9 : i64
      %2496 = func.call @cc_make_string(%2494, %2495) : (!llvm.ptr, i64) -> i64
      %2497 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2498 = arith.constant 11 : i64
      %2499 = func.call @cc_make_string(%2497, %2498) : (!llvm.ptr, i64) -> i64
      %2500 = func.call @cc_intern(%2496, %2499) : (i64, i64) -> i64
      %2501 = func.call @cc_nil_value() : () -> i64
      %2502 = func.call @cc_cons(%2500, %2501) : (i64, i64) -> i64
      %2503 = func.call @cc_values_pack(%2502) : (i64) -> i64
      func.call @stack_push_pointer(%2500) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2504 = func.call @stack_pop_pointer() : () -> i64
      %2505 = func.call @stack_pop_pointer() : () -> i64
      %2506 = func.call @cc_cons(%2505, %2504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2507 = arith.addi %2506, %__rlasp_stack_elide_zero_126 : i64
      %2508 = func.call @stack_pop_pointer() : () -> i64
      %2509 = func.call @cc_cons(%2508, %2507) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2510 = arith.addi %2509, %__rlasp_stack_elide_zero_127 : i64
      %2511 = func.call @stack_pop_pointer() : () -> i64
      %2512 = func.call @cc_cons(%2511, %2510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2512) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2513 = func.call @stack_pop_pointer() : () -> i64
      %2514 = func.call @stack_pop_pointer() : () -> i64
      %2515 = func.call @cc_cons(%2514, %2513) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2516 = arith.addi %2515, %__rlasp_stack_elide_zero_128 : i64
      %2517 = func.call @stack_pop_pointer() : () -> i64
      %2518 = func.call @cc_cons(%2517, %2516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2518) : (i64) -> ()
      %2519 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2520 = arith.constant 5 : i64
      %2521 = func.call @cc_make_string(%2519, %2520) : (!llvm.ptr, i64) -> i64
      %2522 = func.call @cc_nil_value() : () -> i64
      %2523 = func.call @cc_intern(%2521, %2522) : (i64, i64) -> i64
      %2524 = func.call @cc_nil_value() : () -> i64
      %2525 = func.call @cc_cons(%2523, %2524) : (i64, i64) -> i64
      %2526 = func.call @cc_values_pack(%2525) : (i64) -> i64
      func.call @stack_push_pointer(%2523) : (i64) -> ()
      %2527 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2528 = arith.constant 4 : i64
      %2529 = func.call @cc_make_string(%2527, %2528) : (!llvm.ptr, i64) -> i64
      %2530 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2531 = arith.constant 11 : i64
      %2532 = func.call @cc_make_string(%2530, %2531) : (!llvm.ptr, i64) -> i64
      %2533 = func.call @cc_intern(%2529, %2532) : (i64, i64) -> i64
      %2534 = func.call @cc_nil_value() : () -> i64
      %2535 = func.call @cc_cons(%2533, %2534) : (i64, i64) -> i64
      %2536 = func.call @cc_values_pack(%2535) : (i64) -> i64
      func.call @stack_push_pointer(%2533) : (i64) -> ()
      %2537 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2538 = arith.constant 4 : i64
      %2539 = func.call @cc_make_string(%2537, %2538) : (!llvm.ptr, i64) -> i64
      %2540 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2541 = arith.constant 11 : i64
      %2542 = func.call @cc_make_string(%2540, %2541) : (!llvm.ptr, i64) -> i64
      %2543 = func.call @cc_intern(%2539, %2542) : (i64, i64) -> i64
      %2544 = func.call @cc_nil_value() : () -> i64
      %2545 = func.call @cc_cons(%2543, %2544) : (i64, i64) -> i64
      %2546 = func.call @cc_values_pack(%2545) : (i64) -> i64
      func.call @stack_push_pointer(%2543) : (i64) -> ()
      %2547 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2548 = arith.constant 4 : i64
      %2549 = func.call @cc_make_string(%2547, %2548) : (!llvm.ptr, i64) -> i64
      %2550 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2551 = arith.constant 11 : i64
      %2552 = func.call @cc_make_string(%2550, %2551) : (!llvm.ptr, i64) -> i64
      %2553 = func.call @cc_intern(%2549, %2552) : (i64, i64) -> i64
      %2554 = func.call @cc_nil_value() : () -> i64
      %2555 = func.call @cc_cons(%2553, %2554) : (i64, i64) -> i64
      %2556 = func.call @cc_values_pack(%2555) : (i64) -> i64
      func.call @stack_push_pointer(%2553) : (i64) -> ()
      %2557 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2558 = arith.constant 9 : i64
      %2559 = func.call @cc_make_string(%2557, %2558) : (!llvm.ptr, i64) -> i64
      %2560 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2561 = arith.constant 11 : i64
      %2562 = func.call @cc_make_string(%2560, %2561) : (!llvm.ptr, i64) -> i64
      %2563 = func.call @cc_intern(%2559, %2562) : (i64, i64) -> i64
      %2564 = func.call @cc_nil_value() : () -> i64
      %2565 = func.call @cc_cons(%2563, %2564) : (i64, i64) -> i64
      %2566 = func.call @cc_values_pack(%2565) : (i64) -> i64
      func.call @stack_push_pointer(%2563) : (i64) -> ()
      %2567 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2568 = arith.constant 8 : i64
      %2569 = func.call @cc_make_string(%2567, %2568) : (!llvm.ptr, i64) -> i64
      %2570 = func.call @cc_nil_value() : () -> i64
      %2571 = func.call @cc_intern(%2569, %2570) : (i64, i64) -> i64
      %2572 = func.call @cc_nil_value() : () -> i64
      %2573 = func.call @cc_cons(%2571, %2572) : (i64, i64) -> i64
      %2574 = func.call @cc_values_pack(%2573) : (i64) -> i64
      func.call @stack_push_pointer(%2571) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2575 = func.call @stack_pop_pointer() : () -> i64
      %2576 = func.call @stack_pop_pointer() : () -> i64
      %2577 = func.call @cc_cons(%2576, %2575) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2578 = arith.addi %2577, %__rlasp_stack_elide_zero_129 : i64
      %2579 = func.call @stack_pop_pointer() : () -> i64
      %2580 = func.call @cc_cons(%2579, %2578) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2581 = arith.addi %2580, %__rlasp_stack_elide_zero_130 : i64
      %2582 = func.call @stack_pop_pointer() : () -> i64
      %2583 = func.call @cc_cons(%2582, %2581) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2584 = arith.addi %2583, %__rlasp_stack_elide_zero_131 : i64
      %2585 = func.call @stack_pop_pointer() : () -> i64
      %2586 = func.call @cc_cons(%2585, %2584) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2586) : (i64) -> ()
      %2587 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2588 = arith.constant 3 : i64
      %2589 = func.call @cc_make_string(%2587, %2588) : (!llvm.ptr, i64) -> i64
      %2590 = func.call @cc_nil_value() : () -> i64
      %2591 = func.call @cc_intern(%2589, %2590) : (i64, i64) -> i64
      %2592 = func.call @cc_nil_value() : () -> i64
      %2593 = func.call @cc_cons(%2591, %2592) : (i64, i64) -> i64
      %2594 = func.call @cc_values_pack(%2593) : (i64) -> i64
      func.call @stack_push_pointer(%2591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = func.call @stack_pop_pointer() : () -> i64
      %2597 = func.call @cc_cons(%2596, %2595) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2598 = arith.addi %2597, %__rlasp_stack_elide_zero_132 : i64
      %2599 = func.call @stack_pop_pointer() : () -> i64
      %2600 = func.call @cc_cons(%2599, %2598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2601 = arith.addi %2600, %__rlasp_stack_elide_zero_133 : i64
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @cc_cons(%2602, %2601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @stack_pop_pointer() : () -> i64
      %2606 = func.call @cc_cons(%2605, %2604) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2607 = arith.addi %2606, %__rlasp_stack_elide_zero_134 : i64
      %2608 = func.call @stack_pop_pointer() : () -> i64
      %2609 = func.call @cc_cons(%2608, %2607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2609) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @cc_cons(%2611, %2610) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2613 = arith.addi %2612, %__rlasp_stack_elide_zero_135 : i64
      %2614 = func.call @stack_pop_pointer() : () -> i64
      %2615 = func.call @cc_cons(%2614, %2613) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2616 = arith.addi %2615, %__rlasp_stack_elide_zero_136 : i64
      %2617 = func.call @stack_pop_pointer() : () -> i64
      %2618 = func.call @cc_cons(%2617, %2616) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2619 = arith.addi %2618, %__rlasp_stack_elide_zero_137 : i64
      %2620 = func.call @stack_pop_pointer() : () -> i64
      %2621 = func.call @cc_cons(%2620, %2619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2622 = func.call @stack_pop_pointer() : () -> i64
      %2623 = func.call @stack_pop_pointer() : () -> i64
      %2624 = func.call @cc_cons(%2623, %2622) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2625 = arith.addi %2624, %__rlasp_stack_elide_zero_138 : i64
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @cc_cons(%2626, %2625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2627) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2628 = func.call @stack_pop_pointer() : () -> i64
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @cc_cons(%2629, %2628) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2631 = arith.addi %2630, %__rlasp_stack_elide_zero_139 : i64
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = func.call @cc_cons(%2632, %2631) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2634 = arith.addi %2633, %__rlasp_stack_elide_zero_140 : i64
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = func.call @cc_cons(%2635, %2634) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2637 = arith.addi %2636, %__rlasp_stack_elide_zero_141 : i64
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @cc_cons(%2638, %2637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2640 = func.call @stack_pop_pointer() : () -> i64
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %2642 = func.call @cc_cons(%2641, %2640) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %2643 = arith.addi %2642, %__rlasp_stack_elide_zero_142 : i64
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_cons(%2644, %2643) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %2646 = arith.addi %2645, %__rlasp_stack_elide_zero_143 : i64
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = func.call @cc_cons(%2647, %2646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2649 = func.call @stack_pop_pointer() : () -> i64
      %2650 = func.call @stack_pop_pointer() : () -> i64
      %2651 = func.call @cc_cons(%2650, %2649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %2652 = arith.addi %2651, %__rlasp_stack_elide_zero_144 : i64
      %2653 = func.call @stack_pop_pointer() : () -> i64
      %2654 = func.call @cc_cons(%2653, %2652) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %2655 = arith.addi %2654, %__rlasp_stack_elide_zero_145 : i64
      %2656 = func.call @stack_pop_pointer() : () -> i64
      %2657 = func.call @cc_cons(%2656, %2655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2657) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2658 = func.call @stack_pop_pointer() : () -> i64
      %2659 = func.call @stack_pop_pointer() : () -> i64
      %2660 = func.call @cc_cons(%2659, %2658) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %2661 = arith.addi %2660, %__rlasp_stack_elide_zero_146 : i64
      %2662 = func.call @stack_pop_pointer() : () -> i64
      %2663 = func.call @cc_cons(%2662, %2661) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %2664 = arith.addi %2663, %__rlasp_stack_elide_zero_147 : i64
      %2665 = func.call @stack_pop_pointer() : () -> i64
      %2666 = func.call @cc_cons(%2665, %2664) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %2667 = arith.addi %2666, %__rlasp_stack_elide_zero_148 : i64
      %2668 = func.call @stack_pop_pointer() : () -> i64
      %2669 = func.call @cc_cons(%2668, %2667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2669) : (i64) -> ()
      %2670 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2671 = arith.constant 2 : i64
      %2672 = func.call @cc_make_string(%2670, %2671) : (!llvm.ptr, i64) -> i64
      %2673 = func.call @cc_nil_value() : () -> i64
      %2674 = func.call @cc_intern(%2672, %2673) : (i64, i64) -> i64
      %2675 = func.call @cc_nil_value() : () -> i64
      %2676 = func.call @cc_cons(%2674, %2675) : (i64, i64) -> i64
      %2677 = func.call @cc_values_pack(%2676) : (i64) -> i64
      func.call @stack_push_pointer(%2674) : (i64) -> ()
      %2678 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2679 = arith.constant 10 : i64
      %2680 = func.call @cc_make_string(%2678, %2679) : (!llvm.ptr, i64) -> i64
      %2681 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2682 = arith.constant 11 : i64
      %2683 = func.call @cc_make_string(%2681, %2682) : (!llvm.ptr, i64) -> i64
      %2684 = func.call @cc_intern(%2680, %2683) : (i64, i64) -> i64
      %2685 = func.call @cc_nil_value() : () -> i64
      %2686 = func.call @cc_cons(%2684, %2685) : (i64, i64) -> i64
      %2687 = func.call @cc_values_pack(%2686) : (i64) -> i64
      func.call @stack_push_pointer(%2684) : (i64) -> ()
      %2688 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2689 = arith.constant 8 : i64
      %2690 = func.call @cc_make_string(%2688, %2689) : (!llvm.ptr, i64) -> i64
      %2691 = func.call @cc_nil_value() : () -> i64
      %2692 = func.call @cc_intern(%2690, %2691) : (i64, i64) -> i64
      %2693 = func.call @cc_nil_value() : () -> i64
      %2694 = func.call @cc_cons(%2692, %2693) : (i64, i64) -> i64
      %2695 = func.call @cc_values_pack(%2694) : (i64) -> i64
      func.call @stack_push_pointer(%2692) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2696 = func.call @stack_pop_pointer() : () -> i64
      %2697 = func.call @stack_pop_pointer() : () -> i64
      %2698 = func.call @cc_cons(%2697, %2696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %2699 = arith.addi %2698, %__rlasp_stack_elide_zero_149 : i64
      %2700 = func.call @stack_pop_pointer() : () -> i64
      %2701 = func.call @cc_cons(%2700, %2699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2701) : (i64) -> ()
      %2702 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2703 = arith.constant 5 : i64
      %2704 = func.call @cc_make_string(%2702, %2703) : (!llvm.ptr, i64) -> i64
      %2705 = func.call @cc_nil_value() : () -> i64
      %2706 = func.call @cc_intern(%2704, %2705) : (i64, i64) -> i64
      %2707 = func.call @cc_nil_value() : () -> i64
      %2708 = func.call @cc_cons(%2706, %2707) : (i64, i64) -> i64
      %2709 = func.call @cc_values_pack(%2708) : (i64) -> i64
      func.call @stack_push_pointer(%2706) : (i64) -> ()
      %2710 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2711 = arith.constant 11 : i64
      %2712 = func.call @cc_make_string(%2710, %2711) : (!llvm.ptr, i64) -> i64
      %2713 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2714 = arith.constant 11 : i64
      %2715 = func.call @cc_make_string(%2713, %2714) : (!llvm.ptr, i64) -> i64
      %2716 = func.call @cc_intern(%2712, %2715) : (i64, i64) -> i64
      %2717 = func.call @cc_nil_value() : () -> i64
      %2718 = func.call @cc_cons(%2716, %2717) : (i64, i64) -> i64
      %2719 = func.call @cc_values_pack(%2718) : (i64) -> i64
      func.call @stack_push_pointer(%2716) : (i64) -> ()
      %2720 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2721 = arith.constant 8 : i64
      %2722 = func.call @cc_make_string(%2720, %2721) : (!llvm.ptr, i64) -> i64
      %2723 = func.call @cc_nil_value() : () -> i64
      %2724 = func.call @cc_intern(%2722, %2723) : (i64, i64) -> i64
      %2725 = func.call @cc_nil_value() : () -> i64
      %2726 = func.call @cc_cons(%2724, %2725) : (i64, i64) -> i64
      %2727 = func.call @cc_values_pack(%2726) : (i64) -> i64
      func.call @stack_push_pointer(%2724) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2728 = func.call @stack_pop_pointer() : () -> i64
      %2729 = func.call @stack_pop_pointer() : () -> i64
      %2730 = func.call @cc_cons(%2729, %2728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %2731 = arith.addi %2730, %__rlasp_stack_elide_zero_150 : i64
      %2732 = func.call @stack_pop_pointer() : () -> i64
      %2733 = func.call @cc_cons(%2732, %2731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2734 = func.call @stack_pop_pointer() : () -> i64
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @cc_cons(%2735, %2734) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %2737 = arith.addi %2736, %__rlasp_stack_elide_zero_151 : i64
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @cc_cons(%2738, %2737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2740 = func.call @stack_pop_pointer() : () -> i64
      %2741 = func.call @stack_pop_pointer() : () -> i64
      %2742 = func.call @cc_cons(%2741, %2740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %2743 = arith.addi %2742, %__rlasp_stack_elide_zero_152 : i64
      %2744 = func.call @stack_pop_pointer() : () -> i64
      %2745 = func.call @cc_cons(%2744, %2743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %2746 = arith.addi %2745, %__rlasp_stack_elide_zero_153 : i64
      %2747 = func.call @stack_pop_pointer() : () -> i64
      %2748 = func.call @cc_cons(%2747, %2746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %2749 = arith.addi %2748, %__rlasp_stack_elide_zero_154 : i64
      %2750 = func.call @stack_pop_pointer() : () -> i64
      %2751 = func.call @cc_cons(%2750, %2749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2752 = func.call @stack_pop_pointer() : () -> i64
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @cc_cons(%2753, %2752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %2755 = arith.addi %2754, %__rlasp_stack_elide_zero_155 : i64
      %2756 = func.call @stack_pop_pointer() : () -> i64
      %2757 = func.call @cc_cons(%2756, %2755) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %2758 = arith.addi %2757, %__rlasp_stack_elide_zero_156 : i64
      %2759 = func.call @stack_pop_pointer() : () -> i64
      %2760 = func.call @cc_cons(%2759, %2758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2761 = func.call @stack_pop_pointer() : () -> i64
      %2762 = func.call @stack_pop_pointer() : () -> i64
      %2763 = func.call @cc_cons(%2762, %2761) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %2764 = arith.addi %2763, %__rlasp_stack_elide_zero_157 : i64
      %2765 = func.call @stack_pop_pointer() : () -> i64
      %2766 = func.call @cc_cons(%2765, %2764) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %2767 = arith.addi %2766, %__rlasp_stack_elide_zero_158 : i64
      %2768 = func.call @stack_pop_pointer() : () -> i64
      %2769 = func.call @cc_cons(%2768, %2767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %2770 = arith.addi %2769, %__rlasp_stack_elide_zero_159 : i64
      %3207 = arith.constant 57937766645768 : i64
      %3208 = arith.constant 0 : i64
      %3209 = func.call @cc_make_closure(%3207, %3208) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3210 = arith.addi %3209, %__rlasp_stack_elide_zero_160 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3211 = func.call @stack_pop_pointer() : () -> i64
      %3212 = func.call @stack_pop_pointer() : () -> i64
      %3213 = func.call @cc_cons(%3212, %3211) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3214 = arith.addi %3213, %__rlasp_stack_elide_zero_161 : i64
      %3215 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3216 = arith.constant 11 : i64
      %3217 = func.call @cc_make_string(%3215, %3216) : (!llvm.ptr, i64) -> i64
      %3218 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3219 = arith.constant 7 : i64
      %3220 = func.call @cc_make_string(%3218, %3219) : (!llvm.ptr, i64) -> i64
      %3221 = func.call @cc_intern(%3217, %3220) : (i64, i64) -> i64
      %3222 = func.call @cc_nil_value() : () -> i64
      %3223 = func.call @cc_cons(%3221, %3222) : (i64, i64) -> i64
      %3224 = func.call @cc_values_pack(%3223) : (i64) -> i64
      %3225 = func.call @cc_nil_value() : () -> i64
      %3226 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3227 = arith.constant 4 : i64
      %3228 = func.call @cc_make_string(%3226, %3227) : (!llvm.ptr, i64) -> i64
      %3229 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3230 = arith.constant 7 : i64
      %3231 = func.call @cc_make_string(%3229, %3230) : (!llvm.ptr, i64) -> i64
      %3232 = func.call @cc_intern(%3228, %3231) : (i64, i64) -> i64
      %3233 = func.call @cc_nil_value() : () -> i64
      %3234 = func.call @cc_cons(%3232, %3233) : (i64, i64) -> i64
      %3235 = func.call @cc_values_pack(%3234) : (i64) -> i64
      %3236 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3237 = arith.constant 6 : i64
      %3238 = func.call @cc_make_string(%3236, %3237) : (!llvm.ptr, i64) -> i64
      %3239 = func.call @cc_nil_value() : () -> i64
      %3240 = func.call @cc_intern(%3238, %3239) : (i64, i64) -> i64
      %3241 = func.call @cc_nil_value() : () -> i64
      %3242 = func.call @cc_cons(%3240, %3241) : (i64, i64) -> i64
      %3243 = func.call @cc_values_pack(%3242) : (i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3244 = arith.addi %3240, %__rlasp_stack_elide_zero_162 : i64
      %3245 = func.call @cc_nil_value() : () -> i64
      %3246 = func.call @cc_errorp(%1903) : (i64) -> i64
      %3247 = arith.cmpi ne, %3246, %3245 : i64
      %3248 = arith.cmpi eq, %3245, %3245 : i64
      %3249 = arith.andi %3247, %3248 : i1
      %3250 = scf.if %3249 -> (i64) {
        scf.yield %1903 : i64
      } else {
        scf.yield %3245 : i64
      }
      %3251 = func.call @cc_errorp(%2770) : (i64) -> i64
      %3252 = arith.cmpi ne, %3251, %3245 : i64
      %3253 = arith.cmpi eq, %3250, %3245 : i64
      %3254 = arith.andi %3252, %3253 : i1
      %3255 = scf.if %3254 -> (i64) {
        scf.yield %2770 : i64
      } else {
        scf.yield %3250 : i64
      }
      %3256 = func.call @cc_errorp(%3210) : (i64) -> i64
      %3257 = arith.cmpi ne, %3256, %3245 : i64
      %3258 = arith.cmpi eq, %3255, %3245 : i64
      %3259 = arith.andi %3257, %3258 : i1
      %3260 = scf.if %3259 -> (i64) {
        scf.yield %3210 : i64
      } else {
        scf.yield %3255 : i64
      }
      %3261 = func.call @cc_errorp(%3214) : (i64) -> i64
      %3262 = arith.cmpi ne, %3261, %3245 : i64
      %3263 = arith.cmpi eq, %3260, %3245 : i64
      %3264 = arith.andi %3262, %3263 : i1
      %3265 = scf.if %3264 -> (i64) {
        scf.yield %3214 : i64
      } else {
        scf.yield %3260 : i64
      }
      %3266 = func.call @cc_errorp(%3221) : (i64) -> i64
      %3267 = arith.cmpi ne, %3266, %3245 : i64
      %3268 = arith.cmpi eq, %3265, %3245 : i64
      %3269 = arith.andi %3267, %3268 : i1
      %3270 = scf.if %3269 -> (i64) {
        scf.yield %3221 : i64
      } else {
        scf.yield %3265 : i64
      }
      %3271 = func.call @cc_errorp(%3225) : (i64) -> i64
      %3272 = arith.cmpi ne, %3271, %3245 : i64
      %3273 = arith.cmpi eq, %3270, %3245 : i64
      %3274 = arith.andi %3272, %3273 : i1
      %3275 = scf.if %3274 -> (i64) {
        scf.yield %3225 : i64
      } else {
        scf.yield %3270 : i64
      }
      %3276 = func.call @cc_errorp(%3232) : (i64) -> i64
      %3277 = arith.cmpi ne, %3276, %3245 : i64
      %3278 = arith.cmpi eq, %3275, %3245 : i64
      %3279 = arith.andi %3277, %3278 : i1
      %3280 = scf.if %3279 -> (i64) {
        scf.yield %3232 : i64
      } else {
        scf.yield %3275 : i64
      }
      %3281 = func.call @cc_errorp(%3244) : (i64) -> i64
      %3282 = arith.cmpi ne, %3281, %3245 : i64
      %3283 = arith.cmpi eq, %3280, %3245 : i64
      %3284 = arith.andi %3282, %3283 : i1
      %3285 = scf.if %3284 -> (i64) {
        scf.yield %3244 : i64
      } else {
        scf.yield %3280 : i64
      }
      %3286 = arith.cmpi ne, %3285, %3245 : i64
      scf.if %3286 {
        func.call @stack_push_pointer(%3285) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1903) : (i64) -> ()
        func.call @stack_push_pointer(%2770) : (i64) -> ()
        func.call @stack_push_pointer(%3210) : (i64) -> ()
        func.call @stack_push_pointer(%3214) : (i64) -> ()
        func.call @stack_push_pointer(%3221) : (i64) -> ()
        func.call @stack_push_pointer(%3225) : (i64) -> ()
        func.call @stack_push_pointer(%3232) : (i64) -> ()
        func.call @stack_push_pointer(%3244) : (i64) -> ()
        %3287 = llvm.mlir.addressof @str314 : !llvm.ptr
        %3288 = func.call @cc_make_function_ref_const(%3287) : (!llvm.ptr) -> i64
        %3289 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3288, %3289) : (i64, i64) -> ()
      }
      %3290 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3290 : i64
    }
    %3291 = func.call @cc_nil_value() : () -> i64
    %3292 = func.call @cc_errorp(%1894) : (i64) -> i64
    %3293 = arith.cmpi ne, %3292, %3291 : i64
    %3294 = scf.if %3293 -> (i64) {
      scf.yield %1894 : i64
    } else {
      %3295 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3296 = arith.constant 22 : i64
      %3297 = func.call @cc_make_string(%3295, %3296) : (!llvm.ptr, i64) -> i64
      %3298 = func.call @cc_nil_value() : () -> i64
      %3299 = func.call @cc_intern(%3297, %3298) : (i64, i64) -> i64
      %3300 = func.call @cc_nil_value() : () -> i64
      %3301 = func.call @cc_cons(%3299, %3300) : (i64, i64) -> i64
      %3302 = func.call @cc_values_pack(%3301) : (i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3303 = arith.addi %3299, %__rlasp_stack_elide_zero_163 : i64
      %3304 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3305 = arith.constant 14 : i64
      %3306 = func.call @cc_make_string(%3304, %3305) : (!llvm.ptr, i64) -> i64
      %3307 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3308 = arith.constant 11 : i64
      %3309 = func.call @cc_make_string(%3307, %3308) : (!llvm.ptr, i64) -> i64
      %3310 = func.call @cc_intern(%3306, %3309) : (i64, i64) -> i64
      %3311 = func.call @cc_nil_value() : () -> i64
      %3312 = func.call @cc_cons(%3310, %3311) : (i64, i64) -> i64
      %3313 = func.call @cc_values_pack(%3312) : (i64) -> i64
      func.call @stack_push_pointer(%3310) : (i64) -> ()
      %3314 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3315 = arith.constant 6 : i64
      %3316 = func.call @cc_make_string(%3314, %3315) : (!llvm.ptr, i64) -> i64
      %3317 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3318 = arith.constant 11 : i64
      %3319 = func.call @cc_make_string(%3317, %3318) : (!llvm.ptr, i64) -> i64
      %3320 = func.call @cc_intern(%3316, %3319) : (i64, i64) -> i64
      %3321 = func.call @cc_nil_value() : () -> i64
      %3322 = func.call @cc_cons(%3320, %3321) : (i64, i64) -> i64
      %3323 = func.call @cc_values_pack(%3322) : (i64) -> i64
      func.call @stack_push_pointer(%3320) : (i64) -> ()
      %3324 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3325 = arith.constant 46 : i64
      %3326 = func.call @cc_make_string(%3324, %3325) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3326) : (i64) -> ()
      %3327 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3328 = arith.constant 9 : i64
      %3329 = func.call @cc_make_string(%3327, %3328) : (!llvm.ptr, i64) -> i64
      %3330 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3331 = arith.constant 7 : i64
      %3332 = func.call @cc_make_string(%3330, %3331) : (!llvm.ptr, i64) -> i64
      %3333 = func.call @cc_intern(%3329, %3332) : (i64, i64) -> i64
      %3334 = func.call @cc_nil_value() : () -> i64
      %3335 = func.call @cc_cons(%3333, %3334) : (i64, i64) -> i64
      %3336 = func.call @cc_values_pack(%3335) : (i64) -> i64
      func.call @stack_push_pointer(%3333) : (i64) -> ()
      %3337 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3338 = arith.constant 6 : i64
      %3339 = func.call @cc_make_string(%3337, %3338) : (!llvm.ptr, i64) -> i64
      %3340 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3341 = arith.constant 7 : i64
      %3342 = func.call @cc_make_string(%3340, %3341) : (!llvm.ptr, i64) -> i64
      %3343 = func.call @cc_intern(%3339, %3342) : (i64, i64) -> i64
      %3344 = func.call @cc_nil_value() : () -> i64
      %3345 = func.call @cc_cons(%3343, %3344) : (i64, i64) -> i64
      %3346 = func.call @cc_values_pack(%3345) : (i64) -> i64
      func.call @stack_push_pointer(%3343) : (i64) -> ()
      %3347 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3348 = arith.constant 9 : i64
      %3349 = func.call @cc_make_string(%3347, %3348) : (!llvm.ptr, i64) -> i64
      %3350 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3351 = arith.constant 7 : i64
      %3352 = func.call @cc_make_string(%3350, %3351) : (!llvm.ptr, i64) -> i64
      %3353 = func.call @cc_intern(%3349, %3352) : (i64, i64) -> i64
      %3354 = func.call @cc_nil_value() : () -> i64
      %3355 = func.call @cc_cons(%3353, %3354) : (i64, i64) -> i64
      %3356 = func.call @cc_values_pack(%3355) : (i64) -> i64
      func.call @stack_push_pointer(%3353) : (i64) -> ()
      %3357 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3358 = arith.constant 9 : i64
      %3359 = func.call @cc_make_string(%3357, %3358) : (!llvm.ptr, i64) -> i64
      %3360 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3361 = arith.constant 7 : i64
      %3362 = func.call @cc_make_string(%3360, %3361) : (!llvm.ptr, i64) -> i64
      %3363 = func.call @cc_intern(%3359, %3362) : (i64, i64) -> i64
      %3364 = func.call @cc_nil_value() : () -> i64
      %3365 = func.call @cc_cons(%3363, %3364) : (i64, i64) -> i64
      %3366 = func.call @cc_values_pack(%3365) : (i64) -> i64
      func.call @stack_push_pointer(%3363) : (i64) -> ()
      %3367 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3368 = arith.constant 17 : i64
      %3369 = func.call @cc_make_string(%3367, %3368) : (!llvm.ptr, i64) -> i64
      %3370 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3371 = arith.constant 7 : i64
      %3372 = func.call @cc_make_string(%3370, %3371) : (!llvm.ptr, i64) -> i64
      %3373 = func.call @cc_intern(%3369, %3372) : (i64, i64) -> i64
      %3374 = func.call @cc_nil_value() : () -> i64
      %3375 = func.call @cc_cons(%3373, %3374) : (i64, i64) -> i64
      %3376 = func.call @cc_values_pack(%3375) : (i64) -> i64
      func.call @stack_push_pointer(%3373) : (i64) -> ()
      %3377 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3378 = arith.constant 6 : i64
      %3379 = func.call @cc_make_string(%3377, %3378) : (!llvm.ptr, i64) -> i64
      %3380 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3381 = arith.constant 7 : i64
      %3382 = func.call @cc_make_string(%3380, %3381) : (!llvm.ptr, i64) -> i64
      %3383 = func.call @cc_intern(%3379, %3382) : (i64, i64) -> i64
      %3384 = func.call @cc_nil_value() : () -> i64
      %3385 = func.call @cc_cons(%3383, %3384) : (i64, i64) -> i64
      %3386 = func.call @cc_values_pack(%3385) : (i64) -> i64
      func.call @stack_push_pointer(%3383) : (i64) -> ()
      %3387 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3388 = arith.constant 15 : i64
      %3389 = func.call @cc_make_string(%3387, %3388) : (!llvm.ptr, i64) -> i64
      %3390 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3391 = arith.constant 7 : i64
      %3392 = func.call @cc_make_string(%3390, %3391) : (!llvm.ptr, i64) -> i64
      %3393 = func.call @cc_intern(%3389, %3392) : (i64, i64) -> i64
      %3394 = func.call @cc_nil_value() : () -> i64
      %3395 = func.call @cc_cons(%3393, %3394) : (i64, i64) -> i64
      %3396 = func.call @cc_values_pack(%3395) : (i64) -> i64
      func.call @stack_push_pointer(%3393) : (i64) -> ()
      %3397 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3398 = arith.constant 7 : i64
      %3399 = func.call @cc_make_string(%3397, %3398) : (!llvm.ptr, i64) -> i64
      %3400 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3401 = arith.constant 7 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      %3403 = func.call @cc_intern(%3399, %3402) : (i64, i64) -> i64
      %3404 = func.call @cc_nil_value() : () -> i64
      %3405 = func.call @cc_cons(%3403, %3404) : (i64, i64) -> i64
      %3406 = func.call @cc_values_pack(%3405) : (i64) -> i64
      func.call @stack_push_pointer(%3403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3407 = func.call @stack_pop_pointer() : () -> i64
      %3408 = func.call @stack_pop_pointer() : () -> i64
      %3409 = func.call @cc_cons(%3408, %3407) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3410 = arith.addi %3409, %__rlasp_stack_elide_zero_164 : i64
      %3411 = func.call @stack_pop_pointer() : () -> i64
      %3412 = func.call @cc_cons(%3411, %3410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3413 = arith.addi %3412, %__rlasp_stack_elide_zero_165 : i64
      %3414 = func.call @stack_pop_pointer() : () -> i64
      %3415 = func.call @cc_cons(%3414, %3413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3416 = arith.addi %3415, %__rlasp_stack_elide_zero_166 : i64
      %3417 = func.call @stack_pop_pointer() : () -> i64
      %3418 = func.call @cc_cons(%3417, %3416) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3419 = arith.addi %3418, %__rlasp_stack_elide_zero_167 : i64
      %3420 = func.call @stack_pop_pointer() : () -> i64
      %3421 = func.call @cc_cons(%3420, %3419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3422 = arith.addi %3421, %__rlasp_stack_elide_zero_168 : i64
      %3423 = func.call @stack_pop_pointer() : () -> i64
      %3424 = func.call @cc_cons(%3423, %3422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3425 = arith.addi %3424, %__rlasp_stack_elide_zero_169 : i64
      %3426 = func.call @stack_pop_pointer() : () -> i64
      %3427 = func.call @cc_cons(%3426, %3425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3428 = arith.addi %3427, %__rlasp_stack_elide_zero_170 : i64
      %3429 = func.call @stack_pop_pointer() : () -> i64
      %3430 = func.call @cc_cons(%3429, %3428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3431 = arith.addi %3430, %__rlasp_stack_elide_zero_171 : i64
      %3432 = func.call @stack_pop_pointer() : () -> i64
      %3433 = func.call @cc_cons(%3432, %3431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3434 = arith.addi %3433, %__rlasp_stack_elide_zero_172 : i64
      %3435 = func.call @stack_pop_pointer() : () -> i64
      %3436 = func.call @cc_cons(%3435, %3434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3436) : (i64) -> ()
      %3437 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3438 = arith.constant 10 : i64
      %3439 = func.call @cc_make_string(%3437, %3438) : (!llvm.ptr, i64) -> i64
      %3440 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3441 = arith.constant 11 : i64
      %3442 = func.call @cc_make_string(%3440, %3441) : (!llvm.ptr, i64) -> i64
      %3443 = func.call @cc_intern(%3439, %3442) : (i64, i64) -> i64
      %3444 = func.call @cc_nil_value() : () -> i64
      %3445 = func.call @cc_cons(%3443, %3444) : (i64, i64) -> i64
      %3446 = func.call @cc_values_pack(%3445) : (i64) -> i64
      func.call @stack_push_pointer(%3443) : (i64) -> ()
      %3447 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3448 = arith.constant 9 : i64
      %3449 = func.call @cc_make_string(%3447, %3448) : (!llvm.ptr, i64) -> i64
      %3450 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3451 = arith.constant 11 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = func.call @cc_intern(%3449, %3452) : (i64, i64) -> i64
      %3454 = func.call @cc_nil_value() : () -> i64
      %3455 = func.call @cc_cons(%3453, %3454) : (i64, i64) -> i64
      %3456 = func.call @cc_values_pack(%3455) : (i64) -> i64
      func.call @stack_push_pointer(%3453) : (i64) -> ()
      %3457 = arith.constant 65 : i64
      func.call @stack_push_fixnum(%3457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3458 = func.call @stack_pop_pointer() : () -> i64
      %3459 = func.call @stack_pop_pointer() : () -> i64
      %3460 = func.call @cc_cons(%3459, %3458) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3461 = arith.addi %3460, %__rlasp_stack_elide_zero_173 : i64
      %3462 = func.call @stack_pop_pointer() : () -> i64
      %3463 = func.call @cc_cons(%3462, %3461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3463) : (i64) -> ()
      %3464 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3465 = arith.constant 6 : i64
      %3466 = func.call @cc_make_string(%3464, %3465) : (!llvm.ptr, i64) -> i64
      %3467 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3468 = arith.constant 11 : i64
      %3469 = func.call @cc_make_string(%3467, %3468) : (!llvm.ptr, i64) -> i64
      %3470 = func.call @cc_intern(%3466, %3469) : (i64, i64) -> i64
      %3471 = func.call @cc_nil_value() : () -> i64
      %3472 = func.call @cc_cons(%3470, %3471) : (i64, i64) -> i64
      %3473 = func.call @cc_values_pack(%3472) : (i64) -> i64
      func.call @stack_push_pointer(%3470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3474 = func.call @stack_pop_pointer() : () -> i64
      %3475 = func.call @stack_pop_pointer() : () -> i64
      %3476 = func.call @cc_cons(%3475, %3474) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3477 = arith.addi %3476, %__rlasp_stack_elide_zero_174 : i64
      %3478 = func.call @stack_pop_pointer() : () -> i64
      %3479 = func.call @cc_cons(%3478, %3477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %3480 = arith.addi %3479, %__rlasp_stack_elide_zero_175 : i64
      %3481 = func.call @stack_pop_pointer() : () -> i64
      %3482 = func.call @cc_cons(%3481, %3480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3483 = func.call @stack_pop_pointer() : () -> i64
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = func.call @cc_cons(%3484, %3483) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %3486 = arith.addi %3485, %__rlasp_stack_elide_zero_176 : i64
      %3487 = func.call @stack_pop_pointer() : () -> i64
      %3488 = func.call @cc_cons(%3487, %3486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %3489 = arith.addi %3488, %__rlasp_stack_elide_zero_177 : i64
      %3490 = func.call @stack_pop_pointer() : () -> i64
      %3491 = func.call @cc_cons(%3490, %3489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %3492 = arith.addi %3491, %__rlasp_stack_elide_zero_178 : i64
      %3676 = arith.constant 57937766645769 : i64
      %3677 = arith.constant 0 : i64
      %3678 = func.call @cc_make_closure(%3676, %3677) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %3679 = arith.addi %3678, %__rlasp_stack_elide_zero_179 : i64
      %3680 = arith.constant 65 : i64
      %3681 = func.call @cc_box_character(%3680) : (i64) -> i64
      func.call @stack_push_pointer(%3681) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3682 = func.call @stack_pop_pointer() : () -> i64
      %3683 = func.call @stack_pop_pointer() : () -> i64
      %3684 = func.call @cc_cons(%3683, %3682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %3685 = arith.addi %3684, %__rlasp_stack_elide_zero_180 : i64
      %3686 = llvm.mlir.addressof @str363 : !llvm.ptr
      %3687 = arith.constant 11 : i64
      %3688 = func.call @cc_make_string(%3686, %3687) : (!llvm.ptr, i64) -> i64
      %3689 = llvm.mlir.addressof @str364 : !llvm.ptr
      %3690 = arith.constant 7 : i64
      %3691 = func.call @cc_make_string(%3689, %3690) : (!llvm.ptr, i64) -> i64
      %3692 = func.call @cc_intern(%3688, %3691) : (i64, i64) -> i64
      %3693 = func.call @cc_nil_value() : () -> i64
      %3694 = func.call @cc_cons(%3692, %3693) : (i64, i64) -> i64
      %3695 = func.call @cc_values_pack(%3694) : (i64) -> i64
      %3696 = func.call @cc_nil_value() : () -> i64
      %3697 = llvm.mlir.addressof @str365 : !llvm.ptr
      %3698 = arith.constant 4 : i64
      %3699 = func.call @cc_make_string(%3697, %3698) : (!llvm.ptr, i64) -> i64
      %3700 = llvm.mlir.addressof @str366 : !llvm.ptr
      %3701 = arith.constant 7 : i64
      %3702 = func.call @cc_make_string(%3700, %3701) : (!llvm.ptr, i64) -> i64
      %3703 = func.call @cc_intern(%3699, %3702) : (i64, i64) -> i64
      %3704 = func.call @cc_nil_value() : () -> i64
      %3705 = func.call @cc_cons(%3703, %3704) : (i64, i64) -> i64
      %3706 = func.call @cc_values_pack(%3705) : (i64) -> i64
      %3707 = llvm.mlir.addressof @str367 : !llvm.ptr
      %3708 = arith.constant 6 : i64
      %3709 = func.call @cc_make_string(%3707, %3708) : (!llvm.ptr, i64) -> i64
      %3710 = func.call @cc_nil_value() : () -> i64
      %3711 = func.call @cc_intern(%3709, %3710) : (i64, i64) -> i64
      %3712 = func.call @cc_nil_value() : () -> i64
      %3713 = func.call @cc_cons(%3711, %3712) : (i64, i64) -> i64
      %3714 = func.call @cc_values_pack(%3713) : (i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %3715 = arith.addi %3711, %__rlasp_stack_elide_zero_181 : i64
      %3716 = func.call @cc_nil_value() : () -> i64
      %3717 = func.call @cc_errorp(%3303) : (i64) -> i64
      %3718 = arith.cmpi ne, %3717, %3716 : i64
      %3719 = arith.cmpi eq, %3716, %3716 : i64
      %3720 = arith.andi %3718, %3719 : i1
      %3721 = scf.if %3720 -> (i64) {
        scf.yield %3303 : i64
      } else {
        scf.yield %3716 : i64
      }
      %3722 = func.call @cc_errorp(%3492) : (i64) -> i64
      %3723 = arith.cmpi ne, %3722, %3716 : i64
      %3724 = arith.cmpi eq, %3721, %3716 : i64
      %3725 = arith.andi %3723, %3724 : i1
      %3726 = scf.if %3725 -> (i64) {
        scf.yield %3492 : i64
      } else {
        scf.yield %3721 : i64
      }
      %3727 = func.call @cc_errorp(%3679) : (i64) -> i64
      %3728 = arith.cmpi ne, %3727, %3716 : i64
      %3729 = arith.cmpi eq, %3726, %3716 : i64
      %3730 = arith.andi %3728, %3729 : i1
      %3731 = scf.if %3730 -> (i64) {
        scf.yield %3679 : i64
      } else {
        scf.yield %3726 : i64
      }
      %3732 = func.call @cc_errorp(%3685) : (i64) -> i64
      %3733 = arith.cmpi ne, %3732, %3716 : i64
      %3734 = arith.cmpi eq, %3731, %3716 : i64
      %3735 = arith.andi %3733, %3734 : i1
      %3736 = scf.if %3735 -> (i64) {
        scf.yield %3685 : i64
      } else {
        scf.yield %3731 : i64
      }
      %3737 = func.call @cc_errorp(%3692) : (i64) -> i64
      %3738 = arith.cmpi ne, %3737, %3716 : i64
      %3739 = arith.cmpi eq, %3736, %3716 : i64
      %3740 = arith.andi %3738, %3739 : i1
      %3741 = scf.if %3740 -> (i64) {
        scf.yield %3692 : i64
      } else {
        scf.yield %3736 : i64
      }
      %3742 = func.call @cc_errorp(%3696) : (i64) -> i64
      %3743 = arith.cmpi ne, %3742, %3716 : i64
      %3744 = arith.cmpi eq, %3741, %3716 : i64
      %3745 = arith.andi %3743, %3744 : i1
      %3746 = scf.if %3745 -> (i64) {
        scf.yield %3696 : i64
      } else {
        scf.yield %3741 : i64
      }
      %3747 = func.call @cc_errorp(%3703) : (i64) -> i64
      %3748 = arith.cmpi ne, %3747, %3716 : i64
      %3749 = arith.cmpi eq, %3746, %3716 : i64
      %3750 = arith.andi %3748, %3749 : i1
      %3751 = scf.if %3750 -> (i64) {
        scf.yield %3703 : i64
      } else {
        scf.yield %3746 : i64
      }
      %3752 = func.call @cc_errorp(%3715) : (i64) -> i64
      %3753 = arith.cmpi ne, %3752, %3716 : i64
      %3754 = arith.cmpi eq, %3751, %3716 : i64
      %3755 = arith.andi %3753, %3754 : i1
      %3756 = scf.if %3755 -> (i64) {
        scf.yield %3715 : i64
      } else {
        scf.yield %3751 : i64
      }
      %3757 = arith.cmpi ne, %3756, %3716 : i64
      scf.if %3757 {
        func.call @stack_push_pointer(%3756) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3303) : (i64) -> ()
        func.call @stack_push_pointer(%3492) : (i64) -> ()
        func.call @stack_push_pointer(%3679) : (i64) -> ()
        func.call @stack_push_pointer(%3685) : (i64) -> ()
        func.call @stack_push_pointer(%3692) : (i64) -> ()
        func.call @stack_push_pointer(%3696) : (i64) -> ()
        func.call @stack_push_pointer(%3703) : (i64) -> ()
        func.call @stack_push_pointer(%3715) : (i64) -> ()
        %3758 = llvm.mlir.addressof @str368 : !llvm.ptr
        %3759 = func.call @cc_make_function_ref_const(%3758) : (!llvm.ptr) -> i64
        %3760 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3759, %3760) : (i64, i64) -> ()
      }
      %3761 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3761 : i64
    }
    %3762 = func.call @cc_nil_value() : () -> i64
    %3763 = func.call @cc_errorp(%3294) : (i64) -> i64
    %3764 = arith.cmpi ne, %3763, %3762 : i64
    %3765 = scf.if %3764 -> (i64) {
      scf.yield %3294 : i64
    } else {
      %3766 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3767 = arith.constant 23 : i64
      %3768 = func.call @cc_make_string(%3766, %3767) : (!llvm.ptr, i64) -> i64
      %3769 = func.call @cc_nil_value() : () -> i64
      %3770 = func.call @cc_intern(%3768, %3769) : (i64, i64) -> i64
      %3771 = func.call @cc_nil_value() : () -> i64
      %3772 = func.call @cc_cons(%3770, %3771) : (i64, i64) -> i64
      %3773 = func.call @cc_values_pack(%3772) : (i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %3774 = arith.addi %3770, %__rlasp_stack_elide_zero_182 : i64
      %3775 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3776 = arith.constant 3 : i64
      %3777 = func.call @cc_make_string(%3775, %3776) : (!llvm.ptr, i64) -> i64
      %3778 = func.call @cc_nil_value() : () -> i64
      %3779 = func.call @cc_intern(%3777, %3778) : (i64, i64) -> i64
      %3780 = func.call @cc_nil_value() : () -> i64
      %3781 = func.call @cc_cons(%3779, %3780) : (i64, i64) -> i64
      %3782 = func.call @cc_values_pack(%3781) : (i64) -> i64
      func.call @stack_push_pointer(%3779) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3783 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3784 = arith.constant 4 : i64
      %3785 = func.call @cc_make_string(%3783, %3784) : (!llvm.ptr, i64) -> i64
      %3786 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3787 = arith.constant 11 : i64
      %3788 = func.call @cc_make_string(%3786, %3787) : (!llvm.ptr, i64) -> i64
      %3789 = func.call @cc_intern(%3785, %3788) : (i64, i64) -> i64
      %3790 = func.call @cc_nil_value() : () -> i64
      %3791 = func.call @cc_cons(%3789, %3790) : (i64, i64) -> i64
      %3792 = func.call @cc_values_pack(%3791) : (i64) -> i64
      func.call @stack_push_pointer(%3789) : (i64) -> ()
      %3793 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3794 = arith.constant 8 : i64
      %3795 = func.call @cc_make_string(%3793, %3794) : (!llvm.ptr, i64) -> i64
      %3796 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3797 = arith.constant 11 : i64
      %3798 = func.call @cc_make_string(%3796, %3797) : (!llvm.ptr, i64) -> i64
      %3799 = func.call @cc_intern(%3795, %3798) : (i64, i64) -> i64
      %3800 = func.call @cc_nil_value() : () -> i64
      %3801 = func.call @cc_cons(%3799, %3800) : (i64, i64) -> i64
      %3802 = func.call @cc_values_pack(%3801) : (i64) -> i64
      func.call @stack_push_pointer(%3799) : (i64) -> ()
      %3803 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3804 = arith.constant 42 : i64
      %3805 = func.call @cc_make_string(%3803, %3804) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3805) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3806 = func.call @stack_pop_pointer() : () -> i64
      %3807 = func.call @stack_pop_pointer() : () -> i64
      %3808 = func.call @cc_cons(%3807, %3806) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %3809 = arith.addi %3808, %__rlasp_stack_elide_zero_183 : i64
      %3810 = func.call @stack_pop_pointer() : () -> i64
      %3811 = func.call @cc_cons(%3810, %3809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3811) : (i64) -> ()
      %3812 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3813 = arith.constant 15 : i64
      %3814 = func.call @cc_make_string(%3812, %3813) : (!llvm.ptr, i64) -> i64
      %3815 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3816 = arith.constant 7 : i64
      %3817 = func.call @cc_make_string(%3815, %3816) : (!llvm.ptr, i64) -> i64
      %3818 = func.call @cc_intern(%3814, %3817) : (i64, i64) -> i64
      %3819 = func.call @cc_nil_value() : () -> i64
      %3820 = func.call @cc_cons(%3818, %3819) : (i64, i64) -> i64
      %3821 = func.call @cc_values_pack(%3820) : (i64) -> i64
      func.call @stack_push_pointer(%3818) : (i64) -> ()
      %3822 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3823 = arith.constant 7 : i64
      %3824 = func.call @cc_make_string(%3822, %3823) : (!llvm.ptr, i64) -> i64
      %3825 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3826 = arith.constant 7 : i64
      %3827 = func.call @cc_make_string(%3825, %3826) : (!llvm.ptr, i64) -> i64
      %3828 = func.call @cc_intern(%3824, %3827) : (i64, i64) -> i64
      %3829 = func.call @cc_nil_value() : () -> i64
      %3830 = func.call @cc_cons(%3828, %3829) : (i64, i64) -> i64
      %3831 = func.call @cc_values_pack(%3830) : (i64) -> i64
      func.call @stack_push_pointer(%3828) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3832 = func.call @stack_pop_pointer() : () -> i64
      %3833 = func.call @stack_pop_pointer() : () -> i64
      %3834 = func.call @cc_cons(%3833, %3832) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %3835 = arith.addi %3834, %__rlasp_stack_elide_zero_184 : i64
      %3836 = func.call @stack_pop_pointer() : () -> i64
      %3837 = func.call @cc_cons(%3836, %3835) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %3838 = arith.addi %3837, %__rlasp_stack_elide_zero_185 : i64
      %3839 = func.call @stack_pop_pointer() : () -> i64
      %3840 = func.call @cc_cons(%3839, %3838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %3841 = arith.addi %3840, %__rlasp_stack_elide_zero_186 : i64
      %3842 = func.call @stack_pop_pointer() : () -> i64
      %3843 = func.call @cc_cons(%3842, %3841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3843) : (i64) -> ()
      %3844 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3845 = arith.constant 18 : i64
      %3846 = func.call @cc_make_string(%3844, %3845) : (!llvm.ptr, i64) -> i64
      %3847 = func.call @cc_nil_value() : () -> i64
      %3848 = func.call @cc_intern(%3846, %3847) : (i64, i64) -> i64
      %3849 = func.call @cc_nil_value() : () -> i64
      %3850 = func.call @cc_cons(%3848, %3849) : (i64, i64) -> i64
      %3851 = func.call @cc_values_pack(%3850) : (i64) -> i64
      func.call @stack_push_pointer(%3848) : (i64) -> ()
      %3852 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3853 = arith.constant 15 : i64
      %3854 = func.call @cc_make_string(%3852, %3853) : (!llvm.ptr, i64) -> i64
      %3855 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3856 = arith.constant 9 : i64
      %3857 = func.call @cc_make_string(%3855, %3856) : (!llvm.ptr, i64) -> i64
      %3858 = func.call @cc_intern(%3854, %3857) : (i64, i64) -> i64
      %3859 = func.call @cc_nil_value() : () -> i64
      %3860 = func.call @cc_cons(%3858, %3859) : (i64, i64) -> i64
      %3861 = func.call @cc_values_pack(%3860) : (i64) -> i64
      func.call @stack_push_pointer(%3858) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3862 = func.call @stack_pop_pointer() : () -> i64
      %3863 = func.call @stack_pop_pointer() : () -> i64
      %3864 = func.call @cc_cons(%3863, %3862) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %3865 = arith.addi %3864, %__rlasp_stack_elide_zero_187 : i64
      %3866 = func.call @stack_pop_pointer() : () -> i64
      %3867 = func.call @cc_cons(%3866, %3865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3868 = func.call @stack_pop_pointer() : () -> i64
      %3869 = func.call @stack_pop_pointer() : () -> i64
      %3870 = func.call @cc_cons(%3869, %3868) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %3871 = arith.addi %3870, %__rlasp_stack_elide_zero_188 : i64
      %3872 = func.call @stack_pop_pointer() : () -> i64
      %3873 = func.call @cc_cons(%3872, %3871) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %3874 = arith.addi %3873, %__rlasp_stack_elide_zero_189 : i64
      %3875 = func.call @stack_pop_pointer() : () -> i64
      %3876 = func.call @cc_cons(%3875, %3874) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %3877 = arith.addi %3876, %__rlasp_stack_elide_zero_190 : i64
      %3878 = func.call @stack_pop_pointer() : () -> i64
      %3879 = func.call @cc_cons(%3878, %3877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %3880 = arith.addi %3879, %__rlasp_stack_elide_zero_191 : i64
      %3960 = arith.constant 57937766645770 : i64
      %3961 = arith.constant 0 : i64
      %3962 = func.call @cc_make_closure(%3960, %3961) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %3963 = arith.addi %3962, %__rlasp_stack_elide_zero_192 : i64
      %3964 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%3964) : (i64) -> ()
      %3965 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%3965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3966 = func.call @stack_pop_pointer() : () -> i64
      %3967 = func.call @stack_pop_pointer() : () -> i64
      %3968 = func.call @cc_cons(%3967, %3966) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %3969 = arith.addi %3968, %__rlasp_stack_elide_zero_193 : i64
      %3970 = func.call @stack_pop_pointer() : () -> i64
      %3971 = func.call @cc_cons(%3970, %3969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3971) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3972 = func.call @stack_pop_pointer() : () -> i64
      %3973 = func.call @stack_pop_pointer() : () -> i64
      %3974 = func.call @cc_cons(%3973, %3972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %3975 = arith.addi %3974, %__rlasp_stack_elide_zero_194 : i64
      %3976 = llvm.mlir.addressof @str392 : !llvm.ptr
      %3977 = arith.constant 11 : i64
      %3978 = func.call @cc_make_string(%3976, %3977) : (!llvm.ptr, i64) -> i64
      %3979 = llvm.mlir.addressof @str393 : !llvm.ptr
      %3980 = arith.constant 7 : i64
      %3981 = func.call @cc_make_string(%3979, %3980) : (!llvm.ptr, i64) -> i64
      %3982 = func.call @cc_intern(%3978, %3981) : (i64, i64) -> i64
      %3983 = func.call @cc_nil_value() : () -> i64
      %3984 = func.call @cc_cons(%3982, %3983) : (i64, i64) -> i64
      %3985 = func.call @cc_values_pack(%3984) : (i64) -> i64
      %3986 = func.call @cc_nil_value() : () -> i64
      %3987 = llvm.mlir.addressof @str394 : !llvm.ptr
      %3988 = arith.constant 4 : i64
      %3989 = func.call @cc_make_string(%3987, %3988) : (!llvm.ptr, i64) -> i64
      %3990 = llvm.mlir.addressof @str395 : !llvm.ptr
      %3991 = arith.constant 7 : i64
      %3992 = func.call @cc_make_string(%3990, %3991) : (!llvm.ptr, i64) -> i64
      %3993 = func.call @cc_intern(%3989, %3992) : (i64, i64) -> i64
      %3994 = func.call @cc_nil_value() : () -> i64
      %3995 = func.call @cc_cons(%3993, %3994) : (i64, i64) -> i64
      %3996 = func.call @cc_values_pack(%3995) : (i64) -> i64
      %3997 = llvm.mlir.addressof @str396 : !llvm.ptr
      %3998 = arith.constant 6 : i64
      %3999 = func.call @cc_make_string(%3997, %3998) : (!llvm.ptr, i64) -> i64
      %4000 = func.call @cc_nil_value() : () -> i64
      %4001 = func.call @cc_intern(%3999, %4000) : (i64, i64) -> i64
      %4002 = func.call @cc_nil_value() : () -> i64
      %4003 = func.call @cc_cons(%4001, %4002) : (i64, i64) -> i64
      %4004 = func.call @cc_values_pack(%4003) : (i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %4005 = arith.addi %4001, %__rlasp_stack_elide_zero_195 : i64
      %4006 = func.call @cc_nil_value() : () -> i64
      %4007 = func.call @cc_errorp(%3774) : (i64) -> i64
      %4008 = arith.cmpi ne, %4007, %4006 : i64
      %4009 = arith.cmpi eq, %4006, %4006 : i64
      %4010 = arith.andi %4008, %4009 : i1
      %4011 = scf.if %4010 -> (i64) {
        scf.yield %3774 : i64
      } else {
        scf.yield %4006 : i64
      }
      %4012 = func.call @cc_errorp(%3880) : (i64) -> i64
      %4013 = arith.cmpi ne, %4012, %4006 : i64
      %4014 = arith.cmpi eq, %4011, %4006 : i64
      %4015 = arith.andi %4013, %4014 : i1
      %4016 = scf.if %4015 -> (i64) {
        scf.yield %3880 : i64
      } else {
        scf.yield %4011 : i64
      }
      %4017 = func.call @cc_errorp(%3963) : (i64) -> i64
      %4018 = arith.cmpi ne, %4017, %4006 : i64
      %4019 = arith.cmpi eq, %4016, %4006 : i64
      %4020 = arith.andi %4018, %4019 : i1
      %4021 = scf.if %4020 -> (i64) {
        scf.yield %3963 : i64
      } else {
        scf.yield %4016 : i64
      }
      %4022 = func.call @cc_errorp(%3975) : (i64) -> i64
      %4023 = arith.cmpi ne, %4022, %4006 : i64
      %4024 = arith.cmpi eq, %4021, %4006 : i64
      %4025 = arith.andi %4023, %4024 : i1
      %4026 = scf.if %4025 -> (i64) {
        scf.yield %3975 : i64
      } else {
        scf.yield %4021 : i64
      }
      %4027 = func.call @cc_errorp(%3982) : (i64) -> i64
      %4028 = arith.cmpi ne, %4027, %4006 : i64
      %4029 = arith.cmpi eq, %4026, %4006 : i64
      %4030 = arith.andi %4028, %4029 : i1
      %4031 = scf.if %4030 -> (i64) {
        scf.yield %3982 : i64
      } else {
        scf.yield %4026 : i64
      }
      %4032 = func.call @cc_errorp(%3986) : (i64) -> i64
      %4033 = arith.cmpi ne, %4032, %4006 : i64
      %4034 = arith.cmpi eq, %4031, %4006 : i64
      %4035 = arith.andi %4033, %4034 : i1
      %4036 = scf.if %4035 -> (i64) {
        scf.yield %3986 : i64
      } else {
        scf.yield %4031 : i64
      }
      %4037 = func.call @cc_errorp(%3993) : (i64) -> i64
      %4038 = arith.cmpi ne, %4037, %4006 : i64
      %4039 = arith.cmpi eq, %4036, %4006 : i64
      %4040 = arith.andi %4038, %4039 : i1
      %4041 = scf.if %4040 -> (i64) {
        scf.yield %3993 : i64
      } else {
        scf.yield %4036 : i64
      }
      %4042 = func.call @cc_errorp(%4005) : (i64) -> i64
      %4043 = arith.cmpi ne, %4042, %4006 : i64
      %4044 = arith.cmpi eq, %4041, %4006 : i64
      %4045 = arith.andi %4043, %4044 : i1
      %4046 = scf.if %4045 -> (i64) {
        scf.yield %4005 : i64
      } else {
        scf.yield %4041 : i64
      }
      %4047 = arith.cmpi ne, %4046, %4006 : i64
      scf.if %4047 {
        func.call @stack_push_pointer(%4046) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3774) : (i64) -> ()
        func.call @stack_push_pointer(%3880) : (i64) -> ()
        func.call @stack_push_pointer(%3963) : (i64) -> ()
        func.call @stack_push_pointer(%3975) : (i64) -> ()
        func.call @stack_push_pointer(%3982) : (i64) -> ()
        func.call @stack_push_pointer(%3986) : (i64) -> ()
        func.call @stack_push_pointer(%3993) : (i64) -> ()
        func.call @stack_push_pointer(%4005) : (i64) -> ()
        %4048 = llvm.mlir.addressof @str397 : !llvm.ptr
        %4049 = func.call @cc_make_function_ref_const(%4048) : (!llvm.ptr) -> i64
        %4050 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4049, %4050) : (i64, i64) -> ()
      }
      %4051 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4051 : i64
    }
    %4052 = func.call @cc_nil_value() : () -> i64
    %4053 = func.call @cc_errorp(%3765) : (i64) -> i64
    %4054 = arith.cmpi ne, %4053, %4052 : i64
    %4055 = scf.if %4054 -> (i64) {
      scf.yield %3765 : i64
    } else {
      %4056 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4057 = arith.constant 26 : i64
      %4058 = func.call @cc_make_string(%4056, %4057) : (!llvm.ptr, i64) -> i64
      %4059 = func.call @cc_nil_value() : () -> i64
      %4060 = func.call @cc_intern(%4058, %4059) : (i64, i64) -> i64
      %4061 = func.call @cc_nil_value() : () -> i64
      %4062 = func.call @cc_cons(%4060, %4061) : (i64, i64) -> i64
      %4063 = func.call @cc_values_pack(%4062) : (i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %4064 = arith.addi %4060, %__rlasp_stack_elide_zero_196 : i64
      %4065 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4066 = arith.constant 3 : i64
      %4067 = func.call @cc_make_string(%4065, %4066) : (!llvm.ptr, i64) -> i64
      %4068 = func.call @cc_nil_value() : () -> i64
      %4069 = func.call @cc_intern(%4067, %4068) : (i64, i64) -> i64
      %4070 = func.call @cc_nil_value() : () -> i64
      %4071 = func.call @cc_cons(%4069, %4070) : (i64, i64) -> i64
      %4072 = func.call @cc_values_pack(%4071) : (i64) -> i64
      func.call @stack_push_pointer(%4069) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4073 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4074 = arith.constant 4 : i64
      %4075 = func.call @cc_make_string(%4073, %4074) : (!llvm.ptr, i64) -> i64
      %4076 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4077 = arith.constant 11 : i64
      %4078 = func.call @cc_make_string(%4076, %4077) : (!llvm.ptr, i64) -> i64
      %4079 = func.call @cc_intern(%4075, %4078) : (i64, i64) -> i64
      %4080 = func.call @cc_nil_value() : () -> i64
      %4081 = func.call @cc_cons(%4079, %4080) : (i64, i64) -> i64
      %4082 = func.call @cc_values_pack(%4081) : (i64) -> i64
      func.call @stack_push_pointer(%4079) : (i64) -> ()
      %4083 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4084 = arith.constant 8 : i64
      %4085 = func.call @cc_make_string(%4083, %4084) : (!llvm.ptr, i64) -> i64
      %4086 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4087 = arith.constant 11 : i64
      %4088 = func.call @cc_make_string(%4086, %4087) : (!llvm.ptr, i64) -> i64
      %4089 = func.call @cc_intern(%4085, %4088) : (i64, i64) -> i64
      %4090 = func.call @cc_nil_value() : () -> i64
      %4091 = func.call @cc_cons(%4089, %4090) : (i64, i64) -> i64
      %4092 = func.call @cc_values_pack(%4091) : (i64) -> i64
      func.call @stack_push_pointer(%4089) : (i64) -> ()
      %4093 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4094 = arith.constant 42 : i64
      %4095 = func.call @cc_make_string(%4093, %4094) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4095) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4096 = func.call @stack_pop_pointer() : () -> i64
      %4097 = func.call @stack_pop_pointer() : () -> i64
      %4098 = func.call @cc_cons(%4097, %4096) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %4099 = arith.addi %4098, %__rlasp_stack_elide_zero_197 : i64
      %4100 = func.call @stack_pop_pointer() : () -> i64
      %4101 = func.call @cc_cons(%4100, %4099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4101) : (i64) -> ()
      %4102 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4103 = arith.constant 15 : i64
      %4104 = func.call @cc_make_string(%4102, %4103) : (!llvm.ptr, i64) -> i64
      %4105 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4106 = arith.constant 7 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = func.call @cc_intern(%4104, %4107) : (i64, i64) -> i64
      %4109 = func.call @cc_nil_value() : () -> i64
      %4110 = func.call @cc_cons(%4108, %4109) : (i64, i64) -> i64
      %4111 = func.call @cc_values_pack(%4110) : (i64) -> i64
      func.call @stack_push_pointer(%4108) : (i64) -> ()
      %4112 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4113 = arith.constant 10 : i64
      %4114 = func.call @cc_make_string(%4112, %4113) : (!llvm.ptr, i64) -> i64
      %4115 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4116 = arith.constant 7 : i64
      %4117 = func.call @cc_make_string(%4115, %4116) : (!llvm.ptr, i64) -> i64
      %4118 = func.call @cc_intern(%4114, %4117) : (i64, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_cons(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_values_pack(%4120) : (i64) -> i64
      func.call @stack_push_pointer(%4118) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4122 = func.call @stack_pop_pointer() : () -> i64
      %4123 = func.call @stack_pop_pointer() : () -> i64
      %4124 = func.call @cc_cons(%4123, %4122) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %4125 = arith.addi %4124, %__rlasp_stack_elide_zero_198 : i64
      %4126 = func.call @stack_pop_pointer() : () -> i64
      %4127 = func.call @cc_cons(%4126, %4125) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %4128 = arith.addi %4127, %__rlasp_stack_elide_zero_199 : i64
      %4129 = func.call @stack_pop_pointer() : () -> i64
      %4130 = func.call @cc_cons(%4129, %4128) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %4131 = arith.addi %4130, %__rlasp_stack_elide_zero_200 : i64
      %4132 = func.call @stack_pop_pointer() : () -> i64
      %4133 = func.call @cc_cons(%4132, %4131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4133) : (i64) -> ()
      %4134 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4135 = arith.constant 18 : i64
      %4136 = func.call @cc_make_string(%4134, %4135) : (!llvm.ptr, i64) -> i64
      %4137 = func.call @cc_nil_value() : () -> i64
      %4138 = func.call @cc_intern(%4136, %4137) : (i64, i64) -> i64
      %4139 = func.call @cc_nil_value() : () -> i64
      %4140 = func.call @cc_cons(%4138, %4139) : (i64, i64) -> i64
      %4141 = func.call @cc_values_pack(%4140) : (i64) -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4142 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4143 = arith.constant 15 : i64
      %4144 = func.call @cc_make_string(%4142, %4143) : (!llvm.ptr, i64) -> i64
      %4145 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4146 = arith.constant 9 : i64
      %4147 = func.call @cc_make_string(%4145, %4146) : (!llvm.ptr, i64) -> i64
      %4148 = func.call @cc_intern(%4144, %4147) : (i64, i64) -> i64
      %4149 = func.call @cc_nil_value() : () -> i64
      %4150 = func.call @cc_cons(%4148, %4149) : (i64, i64) -> i64
      %4151 = func.call @cc_values_pack(%4150) : (i64) -> i64
      func.call @stack_push_pointer(%4148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4152 = func.call @stack_pop_pointer() : () -> i64
      %4153 = func.call @stack_pop_pointer() : () -> i64
      %4154 = func.call @cc_cons(%4153, %4152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %4155 = arith.addi %4154, %__rlasp_stack_elide_zero_201 : i64
      %4156 = func.call @stack_pop_pointer() : () -> i64
      %4157 = func.call @cc_cons(%4156, %4155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4157) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4158 = func.call @stack_pop_pointer() : () -> i64
      %4159 = func.call @stack_pop_pointer() : () -> i64
      %4160 = func.call @cc_cons(%4159, %4158) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %4161 = arith.addi %4160, %__rlasp_stack_elide_zero_202 : i64
      %4162 = func.call @stack_pop_pointer() : () -> i64
      %4163 = func.call @cc_cons(%4162, %4161) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %4164 = arith.addi %4163, %__rlasp_stack_elide_zero_203 : i64
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @cc_cons(%4165, %4164) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %4167 = arith.addi %4166, %__rlasp_stack_elide_zero_204 : i64
      %4168 = func.call @stack_pop_pointer() : () -> i64
      %4169 = func.call @cc_cons(%4168, %4167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %4170 = arith.addi %4169, %__rlasp_stack_elide_zero_205 : i64
      %4250 = arith.constant 57937766645771 : i64
      %4251 = arith.constant 0 : i64
      %4252 = func.call @cc_make_closure(%4250, %4251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %4253 = arith.addi %4252, %__rlasp_stack_elide_zero_206 : i64
      %4254 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%4254) : (i64) -> ()
      %4255 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%4255) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4256 = func.call @stack_pop_pointer() : () -> i64
      %4257 = func.call @stack_pop_pointer() : () -> i64
      %4258 = func.call @cc_cons(%4257, %4256) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %4259 = arith.addi %4258, %__rlasp_stack_elide_zero_207 : i64
      %4260 = func.call @stack_pop_pointer() : () -> i64
      %4261 = func.call @cc_cons(%4260, %4259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4261) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4262 = func.call @stack_pop_pointer() : () -> i64
      %4263 = func.call @stack_pop_pointer() : () -> i64
      %4264 = func.call @cc_cons(%4263, %4262) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %4265 = arith.addi %4264, %__rlasp_stack_elide_zero_208 : i64
      %4266 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4267 = arith.constant 11 : i64
      %4268 = func.call @cc_make_string(%4266, %4267) : (!llvm.ptr, i64) -> i64
      %4269 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4270 = arith.constant 7 : i64
      %4271 = func.call @cc_make_string(%4269, %4270) : (!llvm.ptr, i64) -> i64
      %4272 = func.call @cc_intern(%4268, %4271) : (i64, i64) -> i64
      %4273 = func.call @cc_nil_value() : () -> i64
      %4274 = func.call @cc_cons(%4272, %4273) : (i64, i64) -> i64
      %4275 = func.call @cc_values_pack(%4274) : (i64) -> i64
      %4276 = func.call @cc_nil_value() : () -> i64
      %4277 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4278 = arith.constant 4 : i64
      %4279 = func.call @cc_make_string(%4277, %4278) : (!llvm.ptr, i64) -> i64
      %4280 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4281 = arith.constant 7 : i64
      %4282 = func.call @cc_make_string(%4280, %4281) : (!llvm.ptr, i64) -> i64
      %4283 = func.call @cc_intern(%4279, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_nil_value() : () -> i64
      %4285 = func.call @cc_cons(%4283, %4284) : (i64, i64) -> i64
      %4286 = func.call @cc_values_pack(%4285) : (i64) -> i64
      %4287 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4288 = arith.constant 6 : i64
      %4289 = func.call @cc_make_string(%4287, %4288) : (!llvm.ptr, i64) -> i64
      %4290 = func.call @cc_nil_value() : () -> i64
      %4291 = func.call @cc_intern(%4289, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_nil_value() : () -> i64
      %4293 = func.call @cc_cons(%4291, %4292) : (i64, i64) -> i64
      %4294 = func.call @cc_values_pack(%4293) : (i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %4295 = arith.addi %4291, %__rlasp_stack_elide_zero_209 : i64
      %4296 = func.call @cc_nil_value() : () -> i64
      %4297 = func.call @cc_errorp(%4064) : (i64) -> i64
      %4298 = arith.cmpi ne, %4297, %4296 : i64
      %4299 = arith.cmpi eq, %4296, %4296 : i64
      %4300 = arith.andi %4298, %4299 : i1
      %4301 = scf.if %4300 -> (i64) {
        scf.yield %4064 : i64
      } else {
        scf.yield %4296 : i64
      }
      %4302 = func.call @cc_errorp(%4170) : (i64) -> i64
      %4303 = arith.cmpi ne, %4302, %4296 : i64
      %4304 = arith.cmpi eq, %4301, %4296 : i64
      %4305 = arith.andi %4303, %4304 : i1
      %4306 = scf.if %4305 -> (i64) {
        scf.yield %4170 : i64
      } else {
        scf.yield %4301 : i64
      }
      %4307 = func.call @cc_errorp(%4253) : (i64) -> i64
      %4308 = arith.cmpi ne, %4307, %4296 : i64
      %4309 = arith.cmpi eq, %4306, %4296 : i64
      %4310 = arith.andi %4308, %4309 : i1
      %4311 = scf.if %4310 -> (i64) {
        scf.yield %4253 : i64
      } else {
        scf.yield %4306 : i64
      }
      %4312 = func.call @cc_errorp(%4265) : (i64) -> i64
      %4313 = arith.cmpi ne, %4312, %4296 : i64
      %4314 = arith.cmpi eq, %4311, %4296 : i64
      %4315 = arith.andi %4313, %4314 : i1
      %4316 = scf.if %4315 -> (i64) {
        scf.yield %4265 : i64
      } else {
        scf.yield %4311 : i64
      }
      %4317 = func.call @cc_errorp(%4272) : (i64) -> i64
      %4318 = arith.cmpi ne, %4317, %4296 : i64
      %4319 = arith.cmpi eq, %4316, %4296 : i64
      %4320 = arith.andi %4318, %4319 : i1
      %4321 = scf.if %4320 -> (i64) {
        scf.yield %4272 : i64
      } else {
        scf.yield %4316 : i64
      }
      %4322 = func.call @cc_errorp(%4276) : (i64) -> i64
      %4323 = arith.cmpi ne, %4322, %4296 : i64
      %4324 = arith.cmpi eq, %4321, %4296 : i64
      %4325 = arith.andi %4323, %4324 : i1
      %4326 = scf.if %4325 -> (i64) {
        scf.yield %4276 : i64
      } else {
        scf.yield %4321 : i64
      }
      %4327 = func.call @cc_errorp(%4283) : (i64) -> i64
      %4328 = arith.cmpi ne, %4327, %4296 : i64
      %4329 = arith.cmpi eq, %4326, %4296 : i64
      %4330 = arith.andi %4328, %4329 : i1
      %4331 = scf.if %4330 -> (i64) {
        scf.yield %4283 : i64
      } else {
        scf.yield %4326 : i64
      }
      %4332 = func.call @cc_errorp(%4295) : (i64) -> i64
      %4333 = arith.cmpi ne, %4332, %4296 : i64
      %4334 = arith.cmpi eq, %4331, %4296 : i64
      %4335 = arith.andi %4333, %4334 : i1
      %4336 = scf.if %4335 -> (i64) {
        scf.yield %4295 : i64
      } else {
        scf.yield %4331 : i64
      }
      %4337 = arith.cmpi ne, %4336, %4296 : i64
      scf.if %4337 {
        func.call @stack_push_pointer(%4336) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4064) : (i64) -> ()
        func.call @stack_push_pointer(%4170) : (i64) -> ()
        func.call @stack_push_pointer(%4253) : (i64) -> ()
        func.call @stack_push_pointer(%4265) : (i64) -> ()
        func.call @stack_push_pointer(%4272) : (i64) -> ()
        func.call @stack_push_pointer(%4276) : (i64) -> ()
        func.call @stack_push_pointer(%4283) : (i64) -> ()
        func.call @stack_push_pointer(%4295) : (i64) -> ()
        %4338 = llvm.mlir.addressof @str426 : !llvm.ptr
        %4339 = func.call @cc_make_function_ref_const(%4338) : (!llvm.ptr) -> i64
        %4340 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4339, %4340) : (i64, i64) -> ()
      }
      %4341 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4341 : i64
    }
    %4342 = func.call @cc_nil_value() : () -> i64
    %4343 = func.call @cc_errorp(%4055) : (i64) -> i64
    %4344 = arith.cmpi ne, %4343, %4342 : i64
    %4345 = scf.if %4344 -> (i64) {
      scf.yield %4055 : i64
    } else {
      %4346 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4347 = arith.constant 24 : i64
      %4348 = func.call @cc_make_string(%4346, %4347) : (!llvm.ptr, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_intern(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_nil_value() : () -> i64
      %4352 = func.call @cc_cons(%4350, %4351) : (i64, i64) -> i64
      %4353 = func.call @cc_values_pack(%4352) : (i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %4354 = arith.addi %4350, %__rlasp_stack_elide_zero_210 : i64
      %4355 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4356 = arith.constant 3 : i64
      %4357 = func.call @cc_make_string(%4355, %4356) : (!llvm.ptr, i64) -> i64
      %4358 = func.call @cc_nil_value() : () -> i64
      %4359 = func.call @cc_intern(%4357, %4358) : (i64, i64) -> i64
      %4360 = func.call @cc_nil_value() : () -> i64
      %4361 = func.call @cc_cons(%4359, %4360) : (i64, i64) -> i64
      %4362 = func.call @cc_values_pack(%4361) : (i64) -> i64
      func.call @stack_push_pointer(%4359) : (i64) -> ()
      %4363 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4364 = arith.constant 3 : i64
      %4365 = func.call @cc_make_string(%4363, %4364) : (!llvm.ptr, i64) -> i64
      %4366 = func.call @cc_nil_value() : () -> i64
      %4367 = func.call @cc_intern(%4365, %4366) : (i64, i64) -> i64
      %4368 = func.call @cc_nil_value() : () -> i64
      %4369 = func.call @cc_cons(%4367, %4368) : (i64, i64) -> i64
      %4370 = func.call @cc_values_pack(%4369) : (i64) -> i64
      func.call @stack_push_pointer(%4367) : (i64) -> ()
      %4371 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4372 = arith.constant 3 : i64
      %4373 = func.call @cc_make_string(%4371, %4372) : (!llvm.ptr, i64) -> i64
      %4374 = func.call @cc_nil_value() : () -> i64
      %4375 = func.call @cc_intern(%4373, %4374) : (i64, i64) -> i64
      %4376 = func.call @cc_nil_value() : () -> i64
      %4377 = func.call @cc_cons(%4375, %4376) : (i64, i64) -> i64
      %4378 = func.call @cc_values_pack(%4377) : (i64) -> i64
      func.call @stack_push_pointer(%4375) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4379 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4380 = arith.constant 12 : i64
      %4381 = func.call @cc_make_string(%4379, %4380) : (!llvm.ptr, i64) -> i64
      %4382 = llvm.mlir.addressof @str432 : !llvm.ptr
      %4383 = arith.constant 11 : i64
      %4384 = func.call @cc_make_string(%4382, %4383) : (!llvm.ptr, i64) -> i64
      %4385 = func.call @cc_intern(%4381, %4384) : (i64, i64) -> i64
      %4386 = func.call @cc_nil_value() : () -> i64
      %4387 = func.call @cc_cons(%4385, %4386) : (i64, i64) -> i64
      %4388 = func.call @cc_values_pack(%4387) : (i64) -> i64
      func.call @stack_push_pointer(%4385) : (i64) -> ()
      %4389 = llvm.mlir.addressof @str433 : !llvm.ptr
      %4390 = arith.constant 8 : i64
      %4391 = func.call @cc_make_string(%4389, %4390) : (!llvm.ptr, i64) -> i64
      %4392 = llvm.mlir.addressof @str434 : !llvm.ptr
      %4393 = arith.constant 11 : i64
      %4394 = func.call @cc_make_string(%4392, %4393) : (!llvm.ptr, i64) -> i64
      %4395 = func.call @cc_intern(%4391, %4394) : (i64, i64) -> i64
      %4396 = func.call @cc_nil_value() : () -> i64
      %4397 = func.call @cc_cons(%4395, %4396) : (i64, i64) -> i64
      %4398 = func.call @cc_values_pack(%4397) : (i64) -> i64
      func.call @stack_push_pointer(%4395) : (i64) -> ()
      %4399 = llvm.mlir.addressof @str435 : !llvm.ptr
      %4400 = arith.constant 47 : i64
      %4401 = func.call @cc_make_string(%4399, %4400) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4401) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = func.call @stack_pop_pointer() : () -> i64
      %4404 = func.call @cc_cons(%4403, %4402) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4405 = arith.addi %4404, %__rlasp_stack_elide_zero_211 : i64
      %4406 = func.call @stack_pop_pointer() : () -> i64
      %4407 = func.call @cc_cons(%4406, %4405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4407) : (i64) -> ()
      %4408 = llvm.mlir.addressof @str436 : !llvm.ptr
      %4409 = arith.constant 15 : i64
      %4410 = func.call @cc_make_string(%4408, %4409) : (!llvm.ptr, i64) -> i64
      %4411 = llvm.mlir.addressof @str437 : !llvm.ptr
      %4412 = arith.constant 7 : i64
      %4413 = func.call @cc_make_string(%4411, %4412) : (!llvm.ptr, i64) -> i64
      %4414 = func.call @cc_intern(%4410, %4413) : (i64, i64) -> i64
      %4415 = func.call @cc_nil_value() : () -> i64
      %4416 = func.call @cc_cons(%4414, %4415) : (i64, i64) -> i64
      %4417 = func.call @cc_values_pack(%4416) : (i64) -> i64
      func.call @stack_push_pointer(%4414) : (i64) -> ()
      %4418 = llvm.mlir.addressof @str438 : !llvm.ptr
      %4419 = arith.constant 10 : i64
      %4420 = func.call @cc_make_string(%4418, %4419) : (!llvm.ptr, i64) -> i64
      %4421 = llvm.mlir.addressof @str439 : !llvm.ptr
      %4422 = arith.constant 7 : i64
      %4423 = func.call @cc_make_string(%4421, %4422) : (!llvm.ptr, i64) -> i64
      %4424 = func.call @cc_intern(%4420, %4423) : (i64, i64) -> i64
      %4425 = func.call @cc_nil_value() : () -> i64
      %4426 = func.call @cc_cons(%4424, %4425) : (i64, i64) -> i64
      %4427 = func.call @cc_values_pack(%4426) : (i64) -> i64
      func.call @stack_push_pointer(%4424) : (i64) -> ()
      %4428 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4429 = arith.constant 9 : i64
      %4430 = func.call @cc_make_string(%4428, %4429) : (!llvm.ptr, i64) -> i64
      %4431 = llvm.mlir.addressof @str441 : !llvm.ptr
      %4432 = arith.constant 7 : i64
      %4433 = func.call @cc_make_string(%4431, %4432) : (!llvm.ptr, i64) -> i64
      %4434 = func.call @cc_intern(%4430, %4433) : (i64, i64) -> i64
      %4435 = func.call @cc_nil_value() : () -> i64
      %4436 = func.call @cc_cons(%4434, %4435) : (i64, i64) -> i64
      %4437 = func.call @cc_values_pack(%4436) : (i64) -> i64
      func.call @stack_push_pointer(%4434) : (i64) -> ()
      %4438 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4439 = arith.constant 6 : i64
      %4440 = func.call @cc_make_string(%4438, %4439) : (!llvm.ptr, i64) -> i64
      %4441 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4442 = arith.constant 7 : i64
      %4443 = func.call @cc_make_string(%4441, %4442) : (!llvm.ptr, i64) -> i64
      %4444 = func.call @cc_intern(%4440, %4443) : (i64, i64) -> i64
      %4445 = func.call @cc_nil_value() : () -> i64
      %4446 = func.call @cc_cons(%4444, %4445) : (i64, i64) -> i64
      %4447 = func.call @cc_values_pack(%4446) : (i64) -> i64
      func.call @stack_push_pointer(%4444) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4448 = func.call @stack_pop_pointer() : () -> i64
      %4449 = func.call @stack_pop_pointer() : () -> i64
      %4450 = func.call @cc_cons(%4449, %4448) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4451 = arith.addi %4450, %__rlasp_stack_elide_zero_212 : i64
      %4452 = func.call @stack_pop_pointer() : () -> i64
      %4453 = func.call @cc_cons(%4452, %4451) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4454 = arith.addi %4453, %__rlasp_stack_elide_zero_213 : i64
      %4455 = func.call @stack_pop_pointer() : () -> i64
      %4456 = func.call @cc_cons(%4455, %4454) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4457 = arith.addi %4456, %__rlasp_stack_elide_zero_214 : i64
      %4458 = func.call @stack_pop_pointer() : () -> i64
      %4459 = func.call @cc_cons(%4458, %4457) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4460 = arith.addi %4459, %__rlasp_stack_elide_zero_215 : i64
      %4461 = func.call @stack_pop_pointer() : () -> i64
      %4462 = func.call @cc_cons(%4461, %4460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4463 = arith.addi %4462, %__rlasp_stack_elide_zero_216 : i64
      %4464 = func.call @stack_pop_pointer() : () -> i64
      %4465 = func.call @cc_cons(%4464, %4463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4465) : (i64) -> ()
      %4466 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4467 = arith.constant 12 : i64
      %4468 = func.call @cc_make_string(%4466, %4467) : (!llvm.ptr, i64) -> i64
      %4469 = llvm.mlir.addressof @str445 : !llvm.ptr
      %4470 = arith.constant 11 : i64
      %4471 = func.call @cc_make_string(%4469, %4470) : (!llvm.ptr, i64) -> i64
      %4472 = func.call @cc_intern(%4468, %4471) : (i64, i64) -> i64
      %4473 = func.call @cc_nil_value() : () -> i64
      %4474 = func.call @cc_cons(%4472, %4473) : (i64, i64) -> i64
      %4475 = func.call @cc_values_pack(%4474) : (i64) -> i64
      func.call @stack_push_pointer(%4472) : (i64) -> ()
      %4476 = llvm.mlir.addressof @str446 : !llvm.ptr
      %4477 = arith.constant 8 : i64
      %4478 = func.call @cc_make_string(%4476, %4477) : (!llvm.ptr, i64) -> i64
      %4479 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4480 = arith.constant 11 : i64
      %4481 = func.call @cc_make_string(%4479, %4480) : (!llvm.ptr, i64) -> i64
      %4482 = func.call @cc_intern(%4478, %4481) : (i64, i64) -> i64
      %4483 = func.call @cc_nil_value() : () -> i64
      %4484 = func.call @cc_cons(%4482, %4483) : (i64, i64) -> i64
      %4485 = func.call @cc_values_pack(%4484) : (i64) -> i64
      func.call @stack_push_pointer(%4482) : (i64) -> ()
      %4486 = llvm.mlir.addressof @str448 : !llvm.ptr
      %4487 = arith.constant 47 : i64
      %4488 = func.call @cc_make_string(%4486, %4487) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4489 = func.call @stack_pop_pointer() : () -> i64
      %4490 = func.call @stack_pop_pointer() : () -> i64
      %4491 = func.call @cc_cons(%4490, %4489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4492 = arith.addi %4491, %__rlasp_stack_elide_zero_217 : i64
      %4493 = func.call @stack_pop_pointer() : () -> i64
      %4494 = func.call @cc_cons(%4493, %4492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4494) : (i64) -> ()
      %4495 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4496 = arith.constant 15 : i64
      %4497 = func.call @cc_make_string(%4495, %4496) : (!llvm.ptr, i64) -> i64
      %4498 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4499 = arith.constant 7 : i64
      %4500 = func.call @cc_make_string(%4498, %4499) : (!llvm.ptr, i64) -> i64
      %4501 = func.call @cc_intern(%4497, %4500) : (i64, i64) -> i64
      %4502 = func.call @cc_nil_value() : () -> i64
      %4503 = func.call @cc_cons(%4501, %4502) : (i64, i64) -> i64
      %4504 = func.call @cc_values_pack(%4503) : (i64) -> i64
      func.call @stack_push_pointer(%4501) : (i64) -> ()
      %4505 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4506 = arith.constant 10 : i64
      %4507 = func.call @cc_make_string(%4505, %4506) : (!llvm.ptr, i64) -> i64
      %4508 = llvm.mlir.addressof @str452 : !llvm.ptr
      %4509 = arith.constant 7 : i64
      %4510 = func.call @cc_make_string(%4508, %4509) : (!llvm.ptr, i64) -> i64
      %4511 = func.call @cc_intern(%4507, %4510) : (i64, i64) -> i64
      %4512 = func.call @cc_nil_value() : () -> i64
      %4513 = func.call @cc_cons(%4511, %4512) : (i64, i64) -> i64
      %4514 = func.call @cc_values_pack(%4513) : (i64) -> i64
      func.call @stack_push_pointer(%4511) : (i64) -> ()
      %4515 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4516 = arith.constant 9 : i64
      %4517 = func.call @cc_make_string(%4515, %4516) : (!llvm.ptr, i64) -> i64
      %4518 = llvm.mlir.addressof @str454 : !llvm.ptr
      %4519 = arith.constant 7 : i64
      %4520 = func.call @cc_make_string(%4518, %4519) : (!llvm.ptr, i64) -> i64
      %4521 = func.call @cc_intern(%4517, %4520) : (i64, i64) -> i64
      %4522 = func.call @cc_nil_value() : () -> i64
      %4523 = func.call @cc_cons(%4521, %4522) : (i64, i64) -> i64
      %4524 = func.call @cc_values_pack(%4523) : (i64) -> i64
      func.call @stack_push_pointer(%4521) : (i64) -> ()
      %4525 = llvm.mlir.addressof @str455 : !llvm.ptr
      %4526 = arith.constant 8 : i64
      %4527 = func.call @cc_make_string(%4525, %4526) : (!llvm.ptr, i64) -> i64
      %4528 = llvm.mlir.addressof @str456 : !llvm.ptr
      %4529 = arith.constant 7 : i64
      %4530 = func.call @cc_make_string(%4528, %4529) : (!llvm.ptr, i64) -> i64
      %4531 = func.call @cc_intern(%4527, %4530) : (i64, i64) -> i64
      %4532 = func.call @cc_nil_value() : () -> i64
      %4533 = func.call @cc_cons(%4531, %4532) : (i64, i64) -> i64
      %4534 = func.call @cc_values_pack(%4533) : (i64) -> i64
      func.call @stack_push_pointer(%4531) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4535 = func.call @stack_pop_pointer() : () -> i64
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4537 = func.call @cc_cons(%4536, %4535) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4538 = arith.addi %4537, %__rlasp_stack_elide_zero_218 : i64
      %4539 = func.call @stack_pop_pointer() : () -> i64
      %4540 = func.call @cc_cons(%4539, %4538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4541 = arith.addi %4540, %__rlasp_stack_elide_zero_219 : i64
      %4542 = func.call @stack_pop_pointer() : () -> i64
      %4543 = func.call @cc_cons(%4542, %4541) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %4544 = arith.addi %4543, %__rlasp_stack_elide_zero_220 : i64
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = func.call @cc_cons(%4545, %4544) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %4547 = arith.addi %4546, %__rlasp_stack_elide_zero_221 : i64
      %4548 = func.call @stack_pop_pointer() : () -> i64
      %4549 = func.call @cc_cons(%4548, %4547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %4550 = arith.addi %4549, %__rlasp_stack_elide_zero_222 : i64
      %4551 = func.call @stack_pop_pointer() : () -> i64
      %4552 = func.call @cc_cons(%4551, %4550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4553 = func.call @stack_pop_pointer() : () -> i64
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = func.call @cc_cons(%4554, %4553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %4556 = arith.addi %4555, %__rlasp_stack_elide_zero_223 : i64
      %4557 = func.call @stack_pop_pointer() : () -> i64
      %4558 = func.call @cc_cons(%4557, %4556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %4559 = arith.addi %4558, %__rlasp_stack_elide_zero_224 : i64
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @cc_cons(%4560, %4559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %4562 = arith.addi %4561, %__rlasp_stack_elide_zero_225 : i64
      %4563 = func.call @stack_pop_pointer() : () -> i64
      %4564 = func.call @cc_cons(%4563, %4562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4564) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4565 = func.call @stack_pop_pointer() : () -> i64
      %4566 = func.call @stack_pop_pointer() : () -> i64
      %4567 = func.call @cc_cons(%4566, %4565) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %4568 = arith.addi %4567, %__rlasp_stack_elide_zero_226 : i64
      %4569 = func.call @stack_pop_pointer() : () -> i64
      %4570 = func.call @cc_cons(%4569, %4568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4570) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4571 = func.call @stack_pop_pointer() : () -> i64
      %4572 = func.call @stack_pop_pointer() : () -> i64
      %4573 = func.call @cc_cons(%4572, %4571) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %4574 = arith.addi %4573, %__rlasp_stack_elide_zero_227 : i64
      %4575 = func.call @stack_pop_pointer() : () -> i64
      %4576 = func.call @cc_cons(%4575, %4574) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %4577 = arith.addi %4576, %__rlasp_stack_elide_zero_228 : i64
      %4789 = arith.constant 57937766645772 : i64
      %4790 = arith.constant 0 : i64
      %4791 = func.call @cc_make_closure(%4789, %4790) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %4792 = arith.addi %4791, %__rlasp_stack_elide_zero_229 : i64
      %4793 = llvm.mlir.addressof @str481 : !llvm.ptr
      %4794 = arith.constant 1 : i64
      %4795 = func.call @cc_make_string(%4793, %4794) : (!llvm.ptr, i64) -> i64
      %4796 = func.call @cc_nil_value() : () -> i64
      %4797 = func.call @cc_intern(%4795, %4796) : (i64, i64) -> i64
      %4798 = func.call @cc_nil_value() : () -> i64
      %4799 = func.call @cc_cons(%4797, %4798) : (i64, i64) -> i64
      %4800 = func.call @cc_values_pack(%4799) : (i64) -> i64
      func.call @stack_push_pointer(%4797) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4801 = func.call @stack_pop_pointer() : () -> i64
      %4802 = func.call @stack_pop_pointer() : () -> i64
      %4803 = func.call @cc_cons(%4802, %4801) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %4804 = arith.addi %4803, %__rlasp_stack_elide_zero_230 : i64
      %4805 = llvm.mlir.addressof @str482 : !llvm.ptr
      %4806 = arith.constant 11 : i64
      %4807 = func.call @cc_make_string(%4805, %4806) : (!llvm.ptr, i64) -> i64
      %4808 = llvm.mlir.addressof @str483 : !llvm.ptr
      %4809 = arith.constant 7 : i64
      %4810 = func.call @cc_make_string(%4808, %4809) : (!llvm.ptr, i64) -> i64
      %4811 = func.call @cc_intern(%4807, %4810) : (i64, i64) -> i64
      %4812 = func.call @cc_nil_value() : () -> i64
      %4813 = func.call @cc_cons(%4811, %4812) : (i64, i64) -> i64
      %4814 = func.call @cc_values_pack(%4813) : (i64) -> i64
      %4815 = func.call @cc_nil_value() : () -> i64
      %4816 = llvm.mlir.addressof @str484 : !llvm.ptr
      %4817 = arith.constant 4 : i64
      %4818 = func.call @cc_make_string(%4816, %4817) : (!llvm.ptr, i64) -> i64
      %4819 = llvm.mlir.addressof @str485 : !llvm.ptr
      %4820 = arith.constant 7 : i64
      %4821 = func.call @cc_make_string(%4819, %4820) : (!llvm.ptr, i64) -> i64
      %4822 = func.call @cc_intern(%4818, %4821) : (i64, i64) -> i64
      %4823 = func.call @cc_nil_value() : () -> i64
      %4824 = func.call @cc_cons(%4822, %4823) : (i64, i64) -> i64
      %4825 = func.call @cc_values_pack(%4824) : (i64) -> i64
      %4826 = llvm.mlir.addressof @str486 : !llvm.ptr
      %4827 = arith.constant 6 : i64
      %4828 = func.call @cc_make_string(%4826, %4827) : (!llvm.ptr, i64) -> i64
      %4829 = func.call @cc_nil_value() : () -> i64
      %4830 = func.call @cc_intern(%4828, %4829) : (i64, i64) -> i64
      %4831 = func.call @cc_nil_value() : () -> i64
      %4832 = func.call @cc_cons(%4830, %4831) : (i64, i64) -> i64
      %4833 = func.call @cc_values_pack(%4832) : (i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %4834 = arith.addi %4830, %__rlasp_stack_elide_zero_231 : i64
      %4835 = func.call @cc_nil_value() : () -> i64
      %4836 = func.call @cc_errorp(%4354) : (i64) -> i64
      %4837 = arith.cmpi ne, %4836, %4835 : i64
      %4838 = arith.cmpi eq, %4835, %4835 : i64
      %4839 = arith.andi %4837, %4838 : i1
      %4840 = scf.if %4839 -> (i64) {
        scf.yield %4354 : i64
      } else {
        scf.yield %4835 : i64
      }
      %4841 = func.call @cc_errorp(%4577) : (i64) -> i64
      %4842 = arith.cmpi ne, %4841, %4835 : i64
      %4843 = arith.cmpi eq, %4840, %4835 : i64
      %4844 = arith.andi %4842, %4843 : i1
      %4845 = scf.if %4844 -> (i64) {
        scf.yield %4577 : i64
      } else {
        scf.yield %4840 : i64
      }
      %4846 = func.call @cc_errorp(%4792) : (i64) -> i64
      %4847 = arith.cmpi ne, %4846, %4835 : i64
      %4848 = arith.cmpi eq, %4845, %4835 : i64
      %4849 = arith.andi %4847, %4848 : i1
      %4850 = scf.if %4849 -> (i64) {
        scf.yield %4792 : i64
      } else {
        scf.yield %4845 : i64
      }
      %4851 = func.call @cc_errorp(%4804) : (i64) -> i64
      %4852 = arith.cmpi ne, %4851, %4835 : i64
      %4853 = arith.cmpi eq, %4850, %4835 : i64
      %4854 = arith.andi %4852, %4853 : i1
      %4855 = scf.if %4854 -> (i64) {
        scf.yield %4804 : i64
      } else {
        scf.yield %4850 : i64
      }
      %4856 = func.call @cc_errorp(%4811) : (i64) -> i64
      %4857 = arith.cmpi ne, %4856, %4835 : i64
      %4858 = arith.cmpi eq, %4855, %4835 : i64
      %4859 = arith.andi %4857, %4858 : i1
      %4860 = scf.if %4859 -> (i64) {
        scf.yield %4811 : i64
      } else {
        scf.yield %4855 : i64
      }
      %4861 = func.call @cc_errorp(%4815) : (i64) -> i64
      %4862 = arith.cmpi ne, %4861, %4835 : i64
      %4863 = arith.cmpi eq, %4860, %4835 : i64
      %4864 = arith.andi %4862, %4863 : i1
      %4865 = scf.if %4864 -> (i64) {
        scf.yield %4815 : i64
      } else {
        scf.yield %4860 : i64
      }
      %4866 = func.call @cc_errorp(%4822) : (i64) -> i64
      %4867 = arith.cmpi ne, %4866, %4835 : i64
      %4868 = arith.cmpi eq, %4865, %4835 : i64
      %4869 = arith.andi %4867, %4868 : i1
      %4870 = scf.if %4869 -> (i64) {
        scf.yield %4822 : i64
      } else {
        scf.yield %4865 : i64
      }
      %4871 = func.call @cc_errorp(%4834) : (i64) -> i64
      %4872 = arith.cmpi ne, %4871, %4835 : i64
      %4873 = arith.cmpi eq, %4870, %4835 : i64
      %4874 = arith.andi %4872, %4873 : i1
      %4875 = scf.if %4874 -> (i64) {
        scf.yield %4834 : i64
      } else {
        scf.yield %4870 : i64
      }
      %4876 = arith.cmpi ne, %4875, %4835 : i64
      scf.if %4876 {
        func.call @stack_push_pointer(%4875) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4354) : (i64) -> ()
        func.call @stack_push_pointer(%4577) : (i64) -> ()
        func.call @stack_push_pointer(%4792) : (i64) -> ()
        func.call @stack_push_pointer(%4804) : (i64) -> ()
        func.call @stack_push_pointer(%4811) : (i64) -> ()
        func.call @stack_push_pointer(%4815) : (i64) -> ()
        func.call @stack_push_pointer(%4822) : (i64) -> ()
        func.call @stack_push_pointer(%4834) : (i64) -> ()
        %4877 = llvm.mlir.addressof @str487 : !llvm.ptr
        %4878 = func.call @cc_make_function_ref_const(%4877) : (!llvm.ptr) -> i64
        %4879 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4878, %4879) : (i64, i64) -> ()
      }
      %4880 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4880 : i64
    }
    %4881 = func.call @cc_nil_value() : () -> i64
    %4882 = func.call @cc_errorp(%4345) : (i64) -> i64
    %4883 = arith.cmpi ne, %4882, %4881 : i64
    %4884 = scf.if %4883 -> (i64) {
      scf.yield %4345 : i64
    } else {
      %4885 = llvm.mlir.addressof @str488 : !llvm.ptr
      %4886 = arith.constant 41 : i64
      %4887 = func.call @cc_make_string(%4885, %4886) : (!llvm.ptr, i64) -> i64
      %4888 = func.call @cc_nil_value() : () -> i64
      %4889 = func.call @cc_intern(%4887, %4888) : (i64, i64) -> i64
      %4890 = func.call @cc_nil_value() : () -> i64
      %4891 = func.call @cc_cons(%4889, %4890) : (i64, i64) -> i64
      %4892 = func.call @cc_values_pack(%4891) : (i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %4893 = arith.addi %4889, %__rlasp_stack_elide_zero_232 : i64
      %4894 = llvm.mlir.addressof @str489 : !llvm.ptr
      %4895 = arith.constant 13 : i64
      %4896 = func.call @cc_make_string(%4894, %4895) : (!llvm.ptr, i64) -> i64
      %4897 = llvm.mlir.addressof @str490 : !llvm.ptr
      %4898 = arith.constant 11 : i64
      %4899 = func.call @cc_make_string(%4897, %4898) : (!llvm.ptr, i64) -> i64
      %4900 = func.call @cc_intern(%4896, %4899) : (i64, i64) -> i64
      %4901 = func.call @cc_nil_value() : () -> i64
      %4902 = func.call @cc_cons(%4900, %4901) : (i64, i64) -> i64
      %4903 = func.call @cc_values_pack(%4902) : (i64) -> i64
      func.call @stack_push_pointer(%4900) : (i64) -> ()
      %4904 = llvm.mlir.addressof @str491 : !llvm.ptr
      %4905 = arith.constant 6 : i64
      %4906 = func.call @cc_make_string(%4904, %4905) : (!llvm.ptr, i64) -> i64
      %4907 = func.call @cc_nil_value() : () -> i64
      %4908 = func.call @cc_intern(%4906, %4907) : (i64, i64) -> i64
      %4909 = func.call @cc_nil_value() : () -> i64
      %4910 = func.call @cc_cons(%4908, %4909) : (i64, i64) -> i64
      %4911 = func.call @cc_values_pack(%4910) : (i64) -> i64
      func.call @stack_push_pointer(%4908) : (i64) -> ()
      %4912 = llvm.mlir.addressof @str492 : !llvm.ptr
      %4913 = arith.constant 19 : i64
      %4914 = func.call @cc_make_string(%4912, %4913) : (!llvm.ptr, i64) -> i64
      %4915 = func.call @cc_nil_value() : () -> i64
      %4916 = func.call @cc_intern(%4914, %4915) : (i64, i64) -> i64
      %4917 = func.call @cc_nil_value() : () -> i64
      %4918 = func.call @cc_cons(%4916, %4917) : (i64, i64) -> i64
      %4919 = func.call @cc_values_pack(%4918) : (i64) -> i64
      func.call @stack_push_pointer(%4916) : (i64) -> ()
      %4920 = llvm.mlir.addressof @str493 : !llvm.ptr
      %4921 = arith.constant 12 : i64
      %4922 = func.call @cc_make_string(%4920, %4921) : (!llvm.ptr, i64) -> i64
      %4923 = llvm.mlir.addressof @str494 : !llvm.ptr
      %4924 = arith.constant 11 : i64
      %4925 = func.call @cc_make_string(%4923, %4924) : (!llvm.ptr, i64) -> i64
      %4926 = func.call @cc_intern(%4922, %4925) : (i64, i64) -> i64
      %4927 = func.call @cc_nil_value() : () -> i64
      %4928 = func.call @cc_cons(%4926, %4927) : (i64, i64) -> i64
      %4929 = func.call @cc_values_pack(%4928) : (i64) -> i64
      func.call @stack_push_pointer(%4926) : (i64) -> ()
      %4930 = llvm.mlir.addressof @str495 : !llvm.ptr
      %4931 = arith.constant 8 : i64
      %4932 = func.call @cc_make_string(%4930, %4931) : (!llvm.ptr, i64) -> i64
      %4933 = llvm.mlir.addressof @str496 : !llvm.ptr
      %4934 = arith.constant 11 : i64
      %4935 = func.call @cc_make_string(%4933, %4934) : (!llvm.ptr, i64) -> i64
      %4936 = func.call @cc_intern(%4932, %4935) : (i64, i64) -> i64
      %4937 = func.call @cc_nil_value() : () -> i64
      %4938 = func.call @cc_cons(%4936, %4937) : (i64, i64) -> i64
      %4939 = func.call @cc_values_pack(%4938) : (i64) -> i64
      func.call @stack_push_pointer(%4936) : (i64) -> ()
      %4940 = llvm.mlir.addressof @str497 : !llvm.ptr
      %4941 = arith.constant 47 : i64
      %4942 = func.call @cc_make_string(%4940, %4941) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4942) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4943 = func.call @stack_pop_pointer() : () -> i64
      %4944 = func.call @stack_pop_pointer() : () -> i64
      %4945 = func.call @cc_cons(%4944, %4943) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %4946 = arith.addi %4945, %__rlasp_stack_elide_zero_233 : i64
      %4947 = func.call @stack_pop_pointer() : () -> i64
      %4948 = func.call @cc_cons(%4947, %4946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4948) : (i64) -> ()
      %4949 = llvm.mlir.addressof @str498 : !llvm.ptr
      %4950 = arith.constant 15 : i64
      %4951 = func.call @cc_make_string(%4949, %4950) : (!llvm.ptr, i64) -> i64
      %4952 = llvm.mlir.addressof @str499 : !llvm.ptr
      %4953 = arith.constant 7 : i64
      %4954 = func.call @cc_make_string(%4952, %4953) : (!llvm.ptr, i64) -> i64
      %4955 = func.call @cc_intern(%4951, %4954) : (i64, i64) -> i64
      %4956 = func.call @cc_nil_value() : () -> i64
      %4957 = func.call @cc_cons(%4955, %4956) : (i64, i64) -> i64
      %4958 = func.call @cc_values_pack(%4957) : (i64) -> i64
      func.call @stack_push_pointer(%4955) : (i64) -> ()
      %4959 = llvm.mlir.addressof @str500 : !llvm.ptr
      %4960 = arith.constant 8 : i64
      %4961 = func.call @cc_make_string(%4959, %4960) : (!llvm.ptr, i64) -> i64
      %4962 = llvm.mlir.addressof @str501 : !llvm.ptr
      %4963 = arith.constant 7 : i64
      %4964 = func.call @cc_make_string(%4962, %4963) : (!llvm.ptr, i64) -> i64
      %4965 = func.call @cc_intern(%4961, %4964) : (i64, i64) -> i64
      %4966 = func.call @cc_nil_value() : () -> i64
      %4967 = func.call @cc_cons(%4965, %4966) : (i64, i64) -> i64
      %4968 = func.call @cc_values_pack(%4967) : (i64) -> i64
      func.call @stack_push_pointer(%4965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4969 = func.call @stack_pop_pointer() : () -> i64
      %4970 = func.call @stack_pop_pointer() : () -> i64
      %4971 = func.call @cc_cons(%4970, %4969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %4972 = arith.addi %4971, %__rlasp_stack_elide_zero_234 : i64
      %4973 = func.call @stack_pop_pointer() : () -> i64
      %4974 = func.call @cc_cons(%4973, %4972) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %4975 = arith.addi %4974, %__rlasp_stack_elide_zero_235 : i64
      %4976 = func.call @stack_pop_pointer() : () -> i64
      %4977 = func.call @cc_cons(%4976, %4975) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %4978 = arith.addi %4977, %__rlasp_stack_elide_zero_236 : i64
      %4979 = func.call @stack_pop_pointer() : () -> i64
      %4980 = func.call @cc_cons(%4979, %4978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4980) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4981 = func.call @stack_pop_pointer() : () -> i64
      %4982 = func.call @stack_pop_pointer() : () -> i64
      %4983 = func.call @cc_cons(%4982, %4981) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %4984 = arith.addi %4983, %__rlasp_stack_elide_zero_237 : i64
      %4985 = func.call @stack_pop_pointer() : () -> i64
      %4986 = func.call @cc_cons(%4985, %4984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4986) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4987 = func.call @stack_pop_pointer() : () -> i64
      %4988 = func.call @stack_pop_pointer() : () -> i64
      %4989 = func.call @cc_cons(%4988, %4987) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %4990 = arith.addi %4989, %__rlasp_stack_elide_zero_238 : i64
      %4991 = func.call @stack_pop_pointer() : () -> i64
      %4992 = func.call @cc_cons(%4991, %4990) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %4993 = arith.addi %4992, %__rlasp_stack_elide_zero_239 : i64
      %4994 = func.call @stack_pop_pointer() : () -> i64
      %4995 = func.call @cc_cons(%4994, %4993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4995) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4996 = func.call @stack_pop_pointer() : () -> i64
      %4997 = func.call @stack_pop_pointer() : () -> i64
      %4998 = func.call @cc_cons(%4997, %4996) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %4999 = arith.addi %4998, %__rlasp_stack_elide_zero_240 : i64
      %5000 = func.call @stack_pop_pointer() : () -> i64
      %5001 = func.call @cc_cons(%5000, %4999) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %5002 = arith.addi %5001, %__rlasp_stack_elide_zero_241 : i64
      %5113 = arith.constant 57937766645773 : i64
      %5114 = arith.constant 0 : i64
      %5115 = func.call @cc_make_closure(%5113, %5114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %5116 = arith.addi %5115, %__rlasp_stack_elide_zero_242 : i64
      %5117 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5118 = arith.constant 4 : i64
      %5119 = func.call @cc_make_string(%5117, %5118) : (!llvm.ptr, i64) -> i64
      %5120 = func.call @cc_nil_value() : () -> i64
      %5121 = func.call @cc_intern(%5119, %5120) : (i64, i64) -> i64
      %5122 = func.call @cc_nil_value() : () -> i64
      %5123 = func.call @cc_cons(%5121, %5122) : (i64, i64) -> i64
      %5124 = func.call @cc_values_pack(%5123) : (i64) -> i64
      func.call @stack_push_pointer(%5121) : (i64) -> ()
      %5125 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5126 = arith.constant 21 : i64
      %5127 = func.call @cc_make_string(%5125, %5126) : (!llvm.ptr, i64) -> i64
      %5128 = llvm.mlir.addressof @str512 : !llvm.ptr
      %5129 = arith.constant 3 : i64
      %5130 = func.call @cc_make_string(%5128, %5129) : (!llvm.ptr, i64) -> i64
      %5131 = func.call @cc_intern(%5127, %5130) : (i64, i64) -> i64
      %5132 = func.call @cc_nil_value() : () -> i64
      %5133 = func.call @cc_cons(%5131, %5132) : (i64, i64) -> i64
      %5134 = func.call @cc_values_pack(%5133) : (i64) -> i64
      func.call @stack_push_pointer(%5131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5135 = func.call @stack_pop_pointer() : () -> i64
      %5136 = func.call @stack_pop_pointer() : () -> i64
      %5137 = func.call @cc_cons(%5136, %5135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %5138 = arith.addi %5137, %__rlasp_stack_elide_zero_243 : i64
      %5139 = func.call @stack_pop_pointer() : () -> i64
      %5140 = func.call @cc_cons(%5139, %5138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %5141 = arith.addi %5140, %__rlasp_stack_elide_zero_244 : i64
      %5142 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5143 = arith.constant 11 : i64
      %5144 = func.call @cc_make_string(%5142, %5143) : (!llvm.ptr, i64) -> i64
      %5145 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5146 = arith.constant 7 : i64
      %5147 = func.call @cc_make_string(%5145, %5146) : (!llvm.ptr, i64) -> i64
      %5148 = func.call @cc_intern(%5144, %5147) : (i64, i64) -> i64
      %5149 = func.call @cc_nil_value() : () -> i64
      %5150 = func.call @cc_cons(%5148, %5149) : (i64, i64) -> i64
      %5151 = func.call @cc_values_pack(%5150) : (i64) -> i64
      %5152 = func.call @cc_nil_value() : () -> i64
      %5153 = llvm.mlir.addressof @str515 : !llvm.ptr
      %5154 = arith.constant 4 : i64
      %5155 = func.call @cc_make_string(%5153, %5154) : (!llvm.ptr, i64) -> i64
      %5156 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5157 = arith.constant 7 : i64
      %5158 = func.call @cc_make_string(%5156, %5157) : (!llvm.ptr, i64) -> i64
      %5159 = func.call @cc_intern(%5155, %5158) : (i64, i64) -> i64
      %5160 = func.call @cc_nil_value() : () -> i64
      %5161 = func.call @cc_cons(%5159, %5160) : (i64, i64) -> i64
      %5162 = func.call @cc_values_pack(%5161) : (i64) -> i64
      %5163 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5164 = arith.constant 5 : i64
      %5165 = func.call @cc_make_string(%5163, %5164) : (!llvm.ptr, i64) -> i64
      %5166 = func.call @cc_nil_value() : () -> i64
      %5167 = func.call @cc_intern(%5165, %5166) : (i64, i64) -> i64
      %5168 = func.call @cc_nil_value() : () -> i64
      %5169 = func.call @cc_cons(%5167, %5168) : (i64, i64) -> i64
      %5170 = func.call @cc_values_pack(%5169) : (i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %5171 = arith.addi %5167, %__rlasp_stack_elide_zero_245 : i64
      %5172 = func.call @cc_nil_value() : () -> i64
      %5173 = func.call @cc_errorp(%4893) : (i64) -> i64
      %5174 = arith.cmpi ne, %5173, %5172 : i64
      %5175 = arith.cmpi eq, %5172, %5172 : i64
      %5176 = arith.andi %5174, %5175 : i1
      %5177 = scf.if %5176 -> (i64) {
        scf.yield %4893 : i64
      } else {
        scf.yield %5172 : i64
      }
      %5178 = func.call @cc_errorp(%5002) : (i64) -> i64
      %5179 = arith.cmpi ne, %5178, %5172 : i64
      %5180 = arith.cmpi eq, %5177, %5172 : i64
      %5181 = arith.andi %5179, %5180 : i1
      %5182 = scf.if %5181 -> (i64) {
        scf.yield %5002 : i64
      } else {
        scf.yield %5177 : i64
      }
      %5183 = func.call @cc_errorp(%5116) : (i64) -> i64
      %5184 = arith.cmpi ne, %5183, %5172 : i64
      %5185 = arith.cmpi eq, %5182, %5172 : i64
      %5186 = arith.andi %5184, %5185 : i1
      %5187 = scf.if %5186 -> (i64) {
        scf.yield %5116 : i64
      } else {
        scf.yield %5182 : i64
      }
      %5188 = func.call @cc_errorp(%5141) : (i64) -> i64
      %5189 = arith.cmpi ne, %5188, %5172 : i64
      %5190 = arith.cmpi eq, %5187, %5172 : i64
      %5191 = arith.andi %5189, %5190 : i1
      %5192 = scf.if %5191 -> (i64) {
        scf.yield %5141 : i64
      } else {
        scf.yield %5187 : i64
      }
      %5193 = func.call @cc_errorp(%5148) : (i64) -> i64
      %5194 = arith.cmpi ne, %5193, %5172 : i64
      %5195 = arith.cmpi eq, %5192, %5172 : i64
      %5196 = arith.andi %5194, %5195 : i1
      %5197 = scf.if %5196 -> (i64) {
        scf.yield %5148 : i64
      } else {
        scf.yield %5192 : i64
      }
      %5198 = func.call @cc_errorp(%5152) : (i64) -> i64
      %5199 = arith.cmpi ne, %5198, %5172 : i64
      %5200 = arith.cmpi eq, %5197, %5172 : i64
      %5201 = arith.andi %5199, %5200 : i1
      %5202 = scf.if %5201 -> (i64) {
        scf.yield %5152 : i64
      } else {
        scf.yield %5197 : i64
      }
      %5203 = func.call @cc_errorp(%5159) : (i64) -> i64
      %5204 = arith.cmpi ne, %5203, %5172 : i64
      %5205 = arith.cmpi eq, %5202, %5172 : i64
      %5206 = arith.andi %5204, %5205 : i1
      %5207 = scf.if %5206 -> (i64) {
        scf.yield %5159 : i64
      } else {
        scf.yield %5202 : i64
      }
      %5208 = func.call @cc_errorp(%5171) : (i64) -> i64
      %5209 = arith.cmpi ne, %5208, %5172 : i64
      %5210 = arith.cmpi eq, %5207, %5172 : i64
      %5211 = arith.andi %5209, %5210 : i1
      %5212 = scf.if %5211 -> (i64) {
        scf.yield %5171 : i64
      } else {
        scf.yield %5207 : i64
      }
      %5213 = arith.cmpi ne, %5212, %5172 : i64
      scf.if %5213 {
        func.call @stack_push_pointer(%5212) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4893) : (i64) -> ()
        func.call @stack_push_pointer(%5002) : (i64) -> ()
        func.call @stack_push_pointer(%5116) : (i64) -> ()
        func.call @stack_push_pointer(%5141) : (i64) -> ()
        func.call @stack_push_pointer(%5148) : (i64) -> ()
        func.call @stack_push_pointer(%5152) : (i64) -> ()
        func.call @stack_push_pointer(%5159) : (i64) -> ()
        func.call @stack_push_pointer(%5171) : (i64) -> ()
        %5214 = llvm.mlir.addressof @str518 : !llvm.ptr
        %5215 = func.call @cc_make_function_ref_const(%5214) : (!llvm.ptr) -> i64
        %5216 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5215, %5216) : (i64, i64) -> ()
      }
      %5217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5217 : i64
    }
    %5218 = func.call @cc_nil_value() : () -> i64
    %5219 = func.call @cc_errorp(%4884) : (i64) -> i64
    %5220 = arith.cmpi ne, %5219, %5218 : i64
    %5221 = scf.if %5220 -> (i64) {
      scf.yield %4884 : i64
    } else {
      %5222 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5223 = arith.constant 9 : i64
      %5224 = func.call @cc_make_string(%5222, %5223) : (!llvm.ptr, i64) -> i64
      %5225 = llvm.mlir.addressof @str520 : !llvm.ptr
      %5226 = arith.constant 7 : i64
      %5227 = func.call @cc_make_string(%5225, %5226) : (!llvm.ptr, i64) -> i64
      %5228 = func.call @cc_intern(%5224, %5227) : (i64, i64) -> i64
      %5229 = func.call @cc_nil_value() : () -> i64
      %5230 = func.call @cc_cons(%5228, %5229) : (i64, i64) -> i64
      %5231 = func.call @cc_values_pack(%5230) : (i64) -> i64
      %5232 = func.call @cc_nil_value() : () -> i64
      %5233 = func.call @cc_errorp(%5228) : (i64) -> i64
      %5234 = arith.cmpi ne, %5233, %5232 : i64
      %5235 = arith.cmpi eq, %5232, %5232 : i64
      %5236 = arith.andi %5234, %5235 : i1
      %5237 = scf.if %5236 -> (i64) {
        scf.yield %5228 : i64
      } else {
        scf.yield %5232 : i64
      }
      %5238 = arith.cmpi ne, %5237, %5232 : i64
      scf.if %5238 {
        func.call @stack_push_pointer(%5237) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5228) : (i64) -> ()
        %5239 = llvm.mlir.addressof @str521 : !llvm.ptr
        %5240 = func.call @cc_make_function_ref_const(%5239) : (!llvm.ptr) -> i64
        %5241 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5240, %5241) : (i64, i64) -> ()
      }
      %5242 = func.call @stack_pop_pointer() : () -> i64
      %5243 = func.call @cc_nil_value() : () -> i64
      %5244 = func.call @cc_errorp(%5242) : (i64) -> i64
      %5245 = arith.cmpi ne, %5244, %5243 : i64
      %5246 = arith.cmpi eq, %5243, %5243 : i64
      %5247 = arith.andi %5245, %5246 : i1
      %5248 = scf.if %5247 -> (i64) {
        scf.yield %5242 : i64
      } else {
        scf.yield %5243 : i64
      }
      %5249 = arith.cmpi ne, %5248, %5243 : i64
      scf.if %5249 {
        func.call @stack_push_pointer(%5248) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5242) : (i64) -> ()
        %5250 = llvm.mlir.addressof @str522 : !llvm.ptr
        %5251 = func.call @cc_make_function_ref_const(%5250) : (!llvm.ptr) -> i64
        %5252 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5251, %5252) : (i64, i64) -> ()
      }
      %5253 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5253 : i64
    }
    %5254 = func.call @cc_nil_value() : () -> i64
    %5255 = func.call @cc_errorp(%5221) : (i64) -> i64
    %5256 = arith.cmpi ne, %5255, %5254 : i64
    %5257 = scf.if %5256 -> (i64) {
      scf.yield %5221 : i64
    } else {
      %5258 = llvm.mlir.addressof @str523 : !llvm.ptr
      %5259 = arith.constant 13 : i64
      %5260 = func.call @cc_make_string(%5258, %5259) : (!llvm.ptr, i64) -> i64
      %5261 = llvm.mlir.addressof @str524 : !llvm.ptr
      %5262 = arith.constant 7 : i64
      %5263 = func.call @cc_make_string(%5261, %5262) : (!llvm.ptr, i64) -> i64
      %5264 = func.call @cc_intern(%5260, %5263) : (i64, i64) -> i64
      %5265 = func.call @cc_nil_value() : () -> i64
      %5266 = func.call @cc_cons(%5264, %5265) : (i64, i64) -> i64
      %5267 = func.call @cc_values_pack(%5266) : (i64) -> i64
      %5268 = func.call @cc_nil_value() : () -> i64
      %5269 = func.call @cc_errorp(%5264) : (i64) -> i64
      %5270 = arith.cmpi ne, %5269, %5268 : i64
      %5271 = arith.cmpi eq, %5268, %5268 : i64
      %5272 = arith.andi %5270, %5271 : i1
      %5273 = scf.if %5272 -> (i64) {
        scf.yield %5264 : i64
      } else {
        scf.yield %5268 : i64
      }
      %5274 = arith.cmpi ne, %5273, %5268 : i64
      scf.if %5274 {
        func.call @stack_push_pointer(%5273) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5264) : (i64) -> ()
        %5275 = llvm.mlir.addressof @str525 : !llvm.ptr
        %5276 = func.call @cc_make_function_ref_const(%5275) : (!llvm.ptr) -> i64
        %5277 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5276, %5277) : (i64, i64) -> ()
      }
      %5278 = func.call @stack_pop_pointer() : () -> i64
      %5279 = func.call @cc_nil_value() : () -> i64
      %5280 = func.call @cc_errorp(%5278) : (i64) -> i64
      %5281 = arith.cmpi ne, %5280, %5279 : i64
      %5282 = arith.cmpi eq, %5279, %5279 : i64
      %5283 = arith.andi %5281, %5282 : i1
      %5284 = scf.if %5283 -> (i64) {
        scf.yield %5278 : i64
      } else {
        scf.yield %5279 : i64
      }
      %5285 = arith.cmpi ne, %5284, %5279 : i64
      scf.if %5285 {
        func.call @stack_push_pointer(%5284) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5278) : (i64) -> ()
        %5286 = llvm.mlir.addressof @str526 : !llvm.ptr
        %5287 = func.call @cc_make_function_ref_const(%5286) : (!llvm.ptr) -> i64
        %5288 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5287, %5288) : (i64, i64) -> ()
      }
      %5289 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5289 : i64
    }
    %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
    %5290 = arith.addi %5257, %__rlasp_stack_elide_zero_246 : i64
    %5291 = func.call @cc_multiple_value_list(%5290) : (i64) -> i64
    %5292 = llvm.mlir.addressof @str527 : !llvm.ptr
    %5293 = arith.constant 37 : i64
    %5294 = func.call @cc_make_string(%5292, %5293) : (!llvm.ptr, i64) -> i64
    %5295 = func.call @cc_nil_value() : () -> i64
    %5296 = func.call @cc_intern(%5294, %5295) : (i64, i64) -> i64
    %5297 = func.call @cc_nil_value() : () -> i64
    %5298 = func.call @cc_cons(%5296, %5297) : (i64, i64) -> i64
    %5299 = func.call @cc_values_pack(%5298) : (i64) -> i64
    %5300 = func.call @cc_symbol_value(%5296) : (i64) -> i64
    %5301 = llvm.mlir.addressof @str528 : !llvm.ptr
    %5302 = arith.constant 39 : i64
    %5303 = func.call @cc_make_string(%5301, %5302) : (!llvm.ptr, i64) -> i64
    %5304 = func.call @cc_nil_value() : () -> i64
    %5305 = func.call @cc_intern(%5303, %5304) : (i64, i64) -> i64
    %5306 = func.call @cc_nil_value() : () -> i64
    %5307 = func.call @cc_cons(%5305, %5306) : (i64, i64) -> i64
    %5308 = func.call @cc_values_pack(%5307) : (i64) -> i64
    %5309 = func.call @cc_symbol_value(%5305) : (i64) -> i64
    %5310 = func.call @cc_nil_value() : () -> i64
    %5311 = arith.cmpi ne, %5300, %5310 : i64
    %5312 = scf.if %5311 -> (i64) {
      scf.yield %5309 : i64
    } else {
      scf.yield %5291 : i64
    }
    %5313 = func.call @cc_values_pack(%5312) : (i64) -> i64
    func.call @stack_push_pointer(%5313) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645763"() {
    %571 = func.call @cc_nil_value() : () -> i64
    %572 = func.call @cc_nil_value() : () -> i64
    %573 = func.call @cc_errorp(%571) : (i64) -> i64
    %574 = arith.cmpi ne, %573, %572 : i64
    %575 = scf.if %574 -> (i64) {
      scf.yield %571 : i64
    } else {
      %576 = func.call @cc_nil_value() : () -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_errorp(%576) : (i64) -> i64
      %579 = arith.cmpi ne, %578, %577 : i64
      %580 = scf.if %579 -> (i64) {
        scf.yield %576 : i64
      } else {
        %581 = llvm.mlir.addressof @str49 : !llvm.ptr
        %582 = arith.constant 42 : i64
        %583 = func.call @cc_make_string(%581, %582) : (!llvm.ptr, i64) -> i64
        %584 = func.call @cc_nil_value() : () -> i64
        %585 = func.call @cc_errorp(%583) : (i64) -> i64
        %586 = arith.cmpi ne, %585, %584 : i64
        %587 = arith.cmpi eq, %584, %584 : i64
        %588 = arith.andi %586, %587 : i1
        %589 = scf.if %588 -> (i64) {
          scf.yield %583 : i64
        } else {
          scf.yield %584 : i64
        }
        %590 = arith.cmpi ne, %589, %584 : i64
        scf.if %590 {
          func.call @stack_push_pointer(%589) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%583) : (i64) -> ()
          %591 = llvm.mlir.addressof @str50 : !llvm.ptr
          %592 = func.call @cc_make_function_ref_const(%591) : (!llvm.ptr) -> i64
          %593 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%592, %593) : (i64, i64) -> ()
        }
        %594 = func.call @stack_pop_pointer() : () -> i64
        %595 = func.call @cc_nil_value() : () -> i64
        %596 = func.call @cc_cons(%594, %595) : (i64, i64) -> i64
        %597 = func.call @cc_load_stack(%596) : (i64) -> i64
        %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
        %598 = arith.addi %597, %__rlasp_stack_elide_zero_247 : i64
        scf.yield %598 : i64
      }
      %599 = func.call @cc_nil_value() : () -> i64
      %600 = func.call @cc_errorp(%580) : (i64) -> i64
      %601 = arith.cmpi ne, %600, %599 : i64
      %602 = scf.if %601 -> (i64) {
        scf.yield %580 : i64
      } else {
        %603 = llvm.mlir.addressof @str51 : !llvm.ptr
        %604 = arith.constant 15 : i64
        %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
        %606 = llvm.mlir.addressof @str52 : !llvm.ptr
        %607 = arith.constant 9 : i64
        %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
        %609 = func.call @cc_intern(%605, %608) : (i64, i64) -> i64
        %610 = func.call @cc_nil_value() : () -> i64
        %611 = func.call @cc_cons(%609, %610) : (i64, i64) -> i64
        %612 = func.call @cc_values_pack(%611) : (i64) -> i64
        %613 = func.call @cc_symbol_value(%609) : (i64) -> i64
        %614 = func.call @cc_nil_value() : () -> i64
        %615 = func.call @cc_errorp(%613) : (i64) -> i64
        %616 = arith.cmpi ne, %615, %614 : i64
        %617 = arith.cmpi eq, %614, %614 : i64
        %618 = arith.andi %616, %617 : i1
        %619 = scf.if %618 -> (i64) {
          scf.yield %613 : i64
        } else {
          scf.yield %614 : i64
        }
        %620 = arith.cmpi ne, %619, %614 : i64
        scf.if %620 {
          func.call @stack_push_pointer(%619) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%613) : (i64) -> ()
          %621 = llvm.mlir.addressof @str53 : !llvm.ptr
          %622 = func.call @cc_make_function_ref_const(%621) : (!llvm.ptr) -> i64
          %623 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%622, %623) : (i64, i64) -> ()
        }
        %624 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %624 : i64
      }
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %625 = arith.addi %602, %__rlasp_stack_elide_zero_248 : i64
      scf.yield %625 : i64
    }
    func.call @stack_push_pointer(%575) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645764"() {
    %833 = func.call @cc_nil_value() : () -> i64
    %834 = func.call @cc_nil_value() : () -> i64
    %835 = func.call @cc_errorp(%833) : (i64) -> i64
    %836 = arith.cmpi ne, %835, %834 : i64
    %837 = scf.if %836 -> (i64) {
      scf.yield %833 : i64
    } else {
      %838 = func.call @cc_nil_value() : () -> i64
      %839 = func.call @cc_nil_value() : () -> i64
      %840 = func.call @cc_errorp(%838) : (i64) -> i64
      %841 = arith.cmpi ne, %840, %839 : i64
      %842 = scf.if %841 -> (i64) {
        scf.yield %838 : i64
      } else {
        %843 = llvm.mlir.addressof @str74 : !llvm.ptr
        %844 = arith.constant 42 : i64
        %845 = func.call @cc_make_string(%843, %844) : (!llvm.ptr, i64) -> i64
        %846 = func.call @cc_nil_value() : () -> i64
        %847 = func.call @cc_errorp(%845) : (i64) -> i64
        %848 = arith.cmpi ne, %847, %846 : i64
        %849 = arith.cmpi eq, %846, %846 : i64
        %850 = arith.andi %848, %849 : i1
        %851 = scf.if %850 -> (i64) {
          scf.yield %845 : i64
        } else {
          scf.yield %846 : i64
        }
        %852 = arith.cmpi ne, %851, %846 : i64
        scf.if %852 {
          func.call @stack_push_pointer(%851) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%845) : (i64) -> ()
          %853 = llvm.mlir.addressof @str75 : !llvm.ptr
          %854 = func.call @cc_make_function_ref_const(%853) : (!llvm.ptr) -> i64
          %855 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%854, %855) : (i64, i64) -> ()
        }
        %856 = func.call @stack_pop_pointer() : () -> i64
        %857 = llvm.mlir.addressof @str76 : !llvm.ptr
        %858 = arith.constant 15 : i64
        %859 = func.call @cc_make_string(%857, %858) : (!llvm.ptr, i64) -> i64
        %860 = llvm.mlir.addressof @str77 : !llvm.ptr
        %861 = arith.constant 7 : i64
        %862 = func.call @cc_make_string(%860, %861) : (!llvm.ptr, i64) -> i64
        %863 = func.call @cc_intern(%859, %862) : (i64, i64) -> i64
        %864 = func.call @cc_nil_value() : () -> i64
        %865 = func.call @cc_cons(%863, %864) : (i64, i64) -> i64
        %866 = func.call @cc_values_pack(%865) : (i64) -> i64
        %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
        %867 = arith.addi %863, %__rlasp_stack_elide_zero_249 : i64
        %868 = llvm.mlir.addressof @str78 : !llvm.ptr
        %869 = arith.constant 5 : i64
        %870 = func.call @cc_make_string(%868, %869) : (!llvm.ptr, i64) -> i64
        %871 = llvm.mlir.addressof @str79 : !llvm.ptr
        %872 = arith.constant 7 : i64
        %873 = func.call @cc_make_string(%871, %872) : (!llvm.ptr, i64) -> i64
        %874 = func.call @cc_intern(%870, %873) : (i64, i64) -> i64
        %875 = func.call @cc_nil_value() : () -> i64
        %876 = func.call @cc_cons(%874, %875) : (i64, i64) -> i64
        %877 = func.call @cc_values_pack(%876) : (i64) -> i64
        %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
        %878 = arith.addi %874, %__rlasp_stack_elide_zero_250 : i64
        %879 = func.call @cc_nil_value() : () -> i64
        %880 = func.call @cc_cons(%878, %879) : (i64, i64) -> i64
        %881 = func.call @cc_cons(%867, %880) : (i64, i64) -> i64
        %882 = func.call @cc_cons(%856, %881) : (i64, i64) -> i64
        %883 = func.call @cc_load_stack(%882) : (i64) -> i64
        %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
        %884 = arith.addi %883, %__rlasp_stack_elide_zero_251 : i64
        scf.yield %884 : i64
      }
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_errorp(%842) : (i64) -> i64
      %887 = arith.cmpi ne, %886, %885 : i64
      %888 = scf.if %887 -> (i64) {
        scf.yield %842 : i64
      } else {
        %889 = llvm.mlir.addressof @str80 : !llvm.ptr
        %890 = arith.constant 15 : i64
        %891 = func.call @cc_make_string(%889, %890) : (!llvm.ptr, i64) -> i64
        %892 = llvm.mlir.addressof @str81 : !llvm.ptr
        %893 = arith.constant 9 : i64
        %894 = func.call @cc_make_string(%892, %893) : (!llvm.ptr, i64) -> i64
        %895 = func.call @cc_intern(%891, %894) : (i64, i64) -> i64
        %896 = func.call @cc_nil_value() : () -> i64
        %897 = func.call @cc_cons(%895, %896) : (i64, i64) -> i64
        %898 = func.call @cc_values_pack(%897) : (i64) -> i64
        %899 = func.call @cc_symbol_value(%895) : (i64) -> i64
        %900 = func.call @cc_nil_value() : () -> i64
        %901 = func.call @cc_errorp(%899) : (i64) -> i64
        %902 = arith.cmpi ne, %901, %900 : i64
        %903 = arith.cmpi eq, %900, %900 : i64
        %904 = arith.andi %902, %903 : i1
        %905 = scf.if %904 -> (i64) {
          scf.yield %899 : i64
        } else {
          scf.yield %900 : i64
        }
        %906 = arith.cmpi ne, %905, %900 : i64
        scf.if %906 {
          func.call @stack_push_pointer(%905) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%899) : (i64) -> ()
          %907 = llvm.mlir.addressof @str82 : !llvm.ptr
          %908 = func.call @cc_make_function_ref_const(%907) : (!llvm.ptr) -> i64
          %909 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%908, %909) : (i64, i64) -> ()
        }
        %910 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %910 : i64
      }
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %911 = arith.addi %888, %__rlasp_stack_elide_zero_252 : i64
      scf.yield %911 : i64
    }
    func.call @stack_push_pointer(%837) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645765"() {
    %1119 = func.call @cc_nil_value() : () -> i64
    %1120 = func.call @cc_nil_value() : () -> i64
    %1121 = func.call @cc_errorp(%1119) : (i64) -> i64
    %1122 = arith.cmpi ne, %1121, %1120 : i64
    %1123 = scf.if %1122 -> (i64) {
      scf.yield %1119 : i64
    } else {
      %1124 = func.call @cc_nil_value() : () -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_errorp(%1124) : (i64) -> i64
      %1127 = arith.cmpi ne, %1126, %1125 : i64
      %1128 = scf.if %1127 -> (i64) {
        scf.yield %1124 : i64
      } else {
        %1129 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1130 = arith.constant 42 : i64
        %1131 = func.call @cc_make_string(%1129, %1130) : (!llvm.ptr, i64) -> i64
        %1132 = func.call @cc_nil_value() : () -> i64
        %1133 = func.call @cc_errorp(%1131) : (i64) -> i64
        %1134 = arith.cmpi ne, %1133, %1132 : i64
        %1135 = arith.cmpi eq, %1132, %1132 : i64
        %1136 = arith.andi %1134, %1135 : i1
        %1137 = scf.if %1136 -> (i64) {
          scf.yield %1131 : i64
        } else {
          scf.yield %1132 : i64
        }
        %1138 = arith.cmpi ne, %1137, %1132 : i64
        scf.if %1138 {
          func.call @stack_push_pointer(%1137) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1131) : (i64) -> ()
          %1139 = llvm.mlir.addressof @str104 : !llvm.ptr
          %1140 = func.call @cc_make_function_ref_const(%1139) : (!llvm.ptr) -> i64
          %1141 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1140, %1141) : (i64, i64) -> ()
        }
        %1142 = func.call @stack_pop_pointer() : () -> i64
        %1143 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1144 = arith.constant 15 : i64
        %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
        %1146 = llvm.mlir.addressof @str106 : !llvm.ptr
        %1147 = arith.constant 7 : i64
        %1148 = func.call @cc_make_string(%1146, %1147) : (!llvm.ptr, i64) -> i64
        %1149 = func.call @cc_intern(%1145, %1148) : (i64, i64) -> i64
        %1150 = func.call @cc_nil_value() : () -> i64
        %1151 = func.call @cc_cons(%1149, %1150) : (i64, i64) -> i64
        %1152 = func.call @cc_values_pack(%1151) : (i64) -> i64
        %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
        %1153 = arith.addi %1149, %__rlasp_stack_elide_zero_253 : i64
        %1154 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1155 = arith.constant 7 : i64
        %1156 = func.call @cc_make_string(%1154, %1155) : (!llvm.ptr, i64) -> i64
        %1157 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1158 = arith.constant 7 : i64
        %1159 = func.call @cc_make_string(%1157, %1158) : (!llvm.ptr, i64) -> i64
        %1160 = func.call @cc_intern(%1156, %1159) : (i64, i64) -> i64
        %1161 = func.call @cc_nil_value() : () -> i64
        %1162 = func.call @cc_cons(%1160, %1161) : (i64, i64) -> i64
        %1163 = func.call @cc_values_pack(%1162) : (i64) -> i64
        %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
        %1164 = arith.addi %1160, %__rlasp_stack_elide_zero_254 : i64
        %1165 = func.call @cc_nil_value() : () -> i64
        %1166 = func.call @cc_cons(%1164, %1165) : (i64, i64) -> i64
        %1167 = func.call @cc_cons(%1153, %1166) : (i64, i64) -> i64
        %1168 = func.call @cc_cons(%1142, %1167) : (i64, i64) -> i64
        %1169 = func.call @cc_load_stack(%1168) : (i64) -> i64
        %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
        %1170 = arith.addi %1169, %__rlasp_stack_elide_zero_255 : i64
        scf.yield %1170 : i64
      }
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_errorp(%1128) : (i64) -> i64
      %1173 = arith.cmpi ne, %1172, %1171 : i64
      %1174 = scf.if %1173 -> (i64) {
        scf.yield %1128 : i64
      } else {
        %1175 = llvm.mlir.addressof @str109 : !llvm.ptr
        %1176 = arith.constant 15 : i64
        %1177 = func.call @cc_make_string(%1175, %1176) : (!llvm.ptr, i64) -> i64
        %1178 = llvm.mlir.addressof @str110 : !llvm.ptr
        %1179 = arith.constant 9 : i64
        %1180 = func.call @cc_make_string(%1178, %1179) : (!llvm.ptr, i64) -> i64
        %1181 = func.call @cc_intern(%1177, %1180) : (i64, i64) -> i64
        %1182 = func.call @cc_nil_value() : () -> i64
        %1183 = func.call @cc_cons(%1181, %1182) : (i64, i64) -> i64
        %1184 = func.call @cc_values_pack(%1183) : (i64) -> i64
        %1185 = func.call @cc_symbol_value(%1181) : (i64) -> i64
        %1186 = func.call @cc_nil_value() : () -> i64
        %1187 = func.call @cc_errorp(%1185) : (i64) -> i64
        %1188 = arith.cmpi ne, %1187, %1186 : i64
        %1189 = arith.cmpi eq, %1186, %1186 : i64
        %1190 = arith.andi %1188, %1189 : i1
        %1191 = scf.if %1190 -> (i64) {
          scf.yield %1185 : i64
        } else {
          scf.yield %1186 : i64
        }
        %1192 = arith.cmpi ne, %1191, %1186 : i64
        scf.if %1192 {
          func.call @stack_push_pointer(%1191) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1185) : (i64) -> ()
          %1193 = llvm.mlir.addressof @str111 : !llvm.ptr
          %1194 = func.call @cc_make_function_ref_const(%1193) : (!llvm.ptr) -> i64
          %1195 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1194, %1195) : (i64, i64) -> ()
        }
        %1196 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1196 : i64
      }
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %1197 = arith.addi %1174, %__rlasp_stack_elide_zero_256 : i64
      scf.yield %1197 : i64
    }
    func.call @stack_push_pointer(%1123) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645766"() {
    %1409 = func.call @cc_nil_value() : () -> i64
    %1410 = func.call @cc_nil_value() : () -> i64
    %1411 = func.call @cc_errorp(%1409) : (i64) -> i64
    %1412 = arith.cmpi ne, %1411, %1410 : i64
    %1413 = scf.if %1412 -> (i64) {
      scf.yield %1409 : i64
    } else {
      %1414 = func.call @cc_nil_value() : () -> i64
      %1415 = func.call @cc_nil_value() : () -> i64
      %1416 = func.call @cc_errorp(%1414) : (i64) -> i64
      %1417 = arith.cmpi ne, %1416, %1415 : i64
      %1418 = scf.if %1417 -> (i64) {
        scf.yield %1414 : i64
      } else {
        %1419 = llvm.mlir.addressof @str132 : !llvm.ptr
        %1420 = arith.constant 42 : i64
        %1421 = func.call @cc_make_string(%1419, %1420) : (!llvm.ptr, i64) -> i64
        %1422 = func.call @cc_nil_value() : () -> i64
        %1423 = func.call @cc_errorp(%1421) : (i64) -> i64
        %1424 = arith.cmpi ne, %1423, %1422 : i64
        %1425 = arith.cmpi eq, %1422, %1422 : i64
        %1426 = arith.andi %1424, %1425 : i1
        %1427 = scf.if %1426 -> (i64) {
          scf.yield %1421 : i64
        } else {
          scf.yield %1422 : i64
        }
        %1428 = arith.cmpi ne, %1427, %1422 : i64
        scf.if %1428 {
          func.call @stack_push_pointer(%1427) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1421) : (i64) -> ()
          %1429 = llvm.mlir.addressof @str133 : !llvm.ptr
          %1430 = func.call @cc_make_function_ref_const(%1429) : (!llvm.ptr) -> i64
          %1431 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1430, %1431) : (i64, i64) -> ()
        }
        %1432 = func.call @stack_pop_pointer() : () -> i64
        %1433 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1434 = arith.constant 15 : i64
        %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
        %1436 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1437 = arith.constant 7 : i64
        %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
        %1439 = func.call @cc_intern(%1435, %1438) : (i64, i64) -> i64
        %1440 = func.call @cc_nil_value() : () -> i64
        %1441 = func.call @cc_cons(%1439, %1440) : (i64, i64) -> i64
        %1442 = func.call @cc_values_pack(%1441) : (i64) -> i64
        %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
        %1443 = arith.addi %1439, %__rlasp_stack_elide_zero_257 : i64
        %1444 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1445 = arith.constant 10 : i64
        %1446 = func.call @cc_make_string(%1444, %1445) : (!llvm.ptr, i64) -> i64
        %1447 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1448 = arith.constant 7 : i64
        %1449 = func.call @cc_make_string(%1447, %1448) : (!llvm.ptr, i64) -> i64
        %1450 = func.call @cc_intern(%1446, %1449) : (i64, i64) -> i64
        %1451 = func.call @cc_nil_value() : () -> i64
        %1452 = func.call @cc_cons(%1450, %1451) : (i64, i64) -> i64
        %1453 = func.call @cc_values_pack(%1452) : (i64) -> i64
        %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
        %1454 = arith.addi %1450, %__rlasp_stack_elide_zero_258 : i64
        %1455 = func.call @cc_nil_value() : () -> i64
        %1456 = func.call @cc_cons(%1454, %1455) : (i64, i64) -> i64
        %1457 = func.call @cc_cons(%1443, %1456) : (i64, i64) -> i64
        %1458 = func.call @cc_cons(%1432, %1457) : (i64, i64) -> i64
        %1459 = func.call @cc_load_stack(%1458) : (i64) -> i64
        %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
        %1460 = arith.addi %1459, %__rlasp_stack_elide_zero_259 : i64
        scf.yield %1460 : i64
      }
      %1461 = func.call @cc_nil_value() : () -> i64
      %1462 = func.call @cc_errorp(%1418) : (i64) -> i64
      %1463 = arith.cmpi ne, %1462, %1461 : i64
      %1464 = scf.if %1463 -> (i64) {
        scf.yield %1418 : i64
      } else {
        %1465 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1466 = arith.constant 15 : i64
        %1467 = func.call @cc_make_string(%1465, %1466) : (!llvm.ptr, i64) -> i64
        %1468 = llvm.mlir.addressof @str139 : !llvm.ptr
        %1469 = arith.constant 9 : i64
        %1470 = func.call @cc_make_string(%1468, %1469) : (!llvm.ptr, i64) -> i64
        %1471 = func.call @cc_intern(%1467, %1470) : (i64, i64) -> i64
        %1472 = func.call @cc_nil_value() : () -> i64
        %1473 = func.call @cc_cons(%1471, %1472) : (i64, i64) -> i64
        %1474 = func.call @cc_values_pack(%1473) : (i64) -> i64
        %1475 = func.call @cc_symbol_value(%1471) : (i64) -> i64
        %1476 = func.call @cc_nil_value() : () -> i64
        %1477 = func.call @cc_errorp(%1475) : (i64) -> i64
        %1478 = arith.cmpi ne, %1477, %1476 : i64
        %1479 = arith.cmpi eq, %1476, %1476 : i64
        %1480 = arith.andi %1478, %1479 : i1
        %1481 = scf.if %1480 -> (i64) {
          scf.yield %1475 : i64
        } else {
          scf.yield %1476 : i64
        }
        %1482 = arith.cmpi ne, %1481, %1476 : i64
        scf.if %1482 {
          func.call @stack_push_pointer(%1481) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1475) : (i64) -> ()
          %1483 = llvm.mlir.addressof @str140 : !llvm.ptr
          %1484 = func.call @cc_make_function_ref_const(%1483) : (!llvm.ptr) -> i64
          %1485 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1484, %1485) : (i64, i64) -> ()
        }
        %1486 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1486 : i64
      }
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %1487 = arith.addi %1464, %__rlasp_stack_elide_zero_260 : i64
      scf.yield %1487 : i64
    }
    func.call @stack_push_pointer(%1413) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645767"() {
    %1702 = func.call @cc_nil_value() : () -> i64
    %1703 = func.call @cc_nil_value() : () -> i64
    %1704 = func.call @cc_errorp(%1702) : (i64) -> i64
    %1705 = arith.cmpi ne, %1704, %1703 : i64
    %1706 = scf.if %1705 -> (i64) {
      scf.yield %1702 : i64
    } else {
      %1707 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1708 = func.call @cc_nil_value() : () -> i64
      %1709 = func.call @cc_nil_value() : () -> i64
      %1710 = func.call @cc_errorp(%1708) : (i64) -> i64
      %1711 = arith.cmpi ne, %1710, %1709 : i64
      %1712 = scf.if %1711 -> (i64) {
        scf.yield %1708 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1713 = llvm.mlir.addressof @str161 : !llvm.ptr
        %1714 = arith.constant 42 : i64
        %1715 = func.call @cc_make_string(%1713, %1714) : (!llvm.ptr, i64) -> i64
        %1716 = func.call @cc_nil_value() : () -> i64
        %1717 = func.call @cc_errorp(%1715) : (i64) -> i64
        %1718 = arith.cmpi ne, %1717, %1716 : i64
        %1719 = arith.cmpi eq, %1716, %1716 : i64
        %1720 = arith.andi %1718, %1719 : i1
        %1721 = scf.if %1720 -> (i64) {
          scf.yield %1715 : i64
        } else {
          scf.yield %1716 : i64
        }
        %1722 = arith.cmpi ne, %1721, %1716 : i64
        scf.if %1722 {
          func.call @stack_push_pointer(%1721) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1715) : (i64) -> ()
          %1723 = llvm.mlir.addressof @str162 : !llvm.ptr
          %1724 = func.call @cc_make_function_ref_const(%1723) : (!llvm.ptr) -> i64
          %1725 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1724, %1725) : (i64, i64) -> ()
        }
        %1726 = func.call @stack_pop_pointer() : () -> i64
        %1727 = llvm.mlir.addressof @str163 : !llvm.ptr
        %1728 = arith.constant 15 : i64
        %1729 = func.call @cc_make_string(%1727, %1728) : (!llvm.ptr, i64) -> i64
        %1730 = llvm.mlir.addressof @str164 : !llvm.ptr
        %1731 = arith.constant 7 : i64
        %1732 = func.call @cc_make_string(%1730, %1731) : (!llvm.ptr, i64) -> i64
        %1733 = func.call @cc_intern(%1729, %1732) : (i64, i64) -> i64
        %1734 = func.call @cc_nil_value() : () -> i64
        %1735 = func.call @cc_cons(%1733, %1734) : (i64, i64) -> i64
        %1736 = func.call @cc_values_pack(%1735) : (i64) -> i64
        %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
        %1737 = arith.addi %1733, %__rlasp_stack_elide_zero_261 : i64
        %1738 = llvm.mlir.addressof @str165 : !llvm.ptr
        %1739 = arith.constant 8 : i64
        %1740 = func.call @cc_make_string(%1738, %1739) : (!llvm.ptr, i64) -> i64
        %1741 = llvm.mlir.addressof @str166 : !llvm.ptr
        %1742 = arith.constant 7 : i64
        %1743 = func.call @cc_make_string(%1741, %1742) : (!llvm.ptr, i64) -> i64
        %1744 = func.call @cc_intern(%1740, %1743) : (i64, i64) -> i64
        %1745 = func.call @cc_nil_value() : () -> i64
        %1746 = func.call @cc_cons(%1744, %1745) : (i64, i64) -> i64
        %1747 = func.call @cc_values_pack(%1746) : (i64) -> i64
        %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
        %1748 = arith.addi %1744, %__rlasp_stack_elide_zero_262 : i64
        %1749 = func.call @cc_nil_value() : () -> i64
        %1750 = func.call @cc_cons(%1748, %1749) : (i64, i64) -> i64
        %1751 = func.call @cc_cons(%1737, %1750) : (i64, i64) -> i64
        %1752 = func.call @cc_cons(%1726, %1751) : (i64, i64) -> i64
        %1753 = func.call @cc_load_stack(%1752) : (i64) -> i64
        %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
        %1754 = arith.addi %1753, %__rlasp_stack_elide_zero_263 : i64
        %1755 = func.call @cc_errorp(%1754) : (i64) -> i64
        %1756 = func.call @cc_nil_value() : () -> i64
        %1757 = arith.cmpi ne, %1755, %1756 : i64
        scf.if %1757 {
          func.call @stack_push_pointer(%1754) : (i64) -> ()
        } else {
          %1758 = func.call @cc_multiple_value_list(%1754) : (i64) -> i64
          func.call @stack_push_pointer(%1758) : (i64) -> ()
        }
        %1759 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1760 = func.call @stack_pop_pointer() : () -> i64
        %1761 = func.call @cc_nil_value() : () -> i64
        %1762 = func.call @cc_maybe_error_from_multiple_value_list(%1759) : (i64) -> i64
        %1763 = func.call @cc_errorp(%1762) : (i64) -> i64
        %1764 = arith.cmpi ne, %1763, %1761 : i64
        %1765 = arith.cmpi eq, %1761, %1761 : i64
        %1766 = arith.andi %1764, %1765 : i1
        %1767 = scf.if %1766 -> (i64) {
          scf.yield %1762 : i64
        } else {
          scf.yield %1761 : i64
        }
        %1768 = arith.cmpi ne, %1767, %1761 : i64
        scf.if %1768 {
          func.call @stack_push_pointer(%1767) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1769 = func.call @stack_pop_pointer() : () -> i64
          %1770 = func.call @cc_cons(%1760, %1769) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
          %1771 = arith.addi %1770, %__rlasp_stack_elide_zero_264 : i64
          %1772 = func.call @cc_cons(%1759, %1771) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
          %1773 = arith.addi %1772, %__rlasp_stack_elide_zero_265 : i64
          %1774 = func.call @cc_values_pack(%1773) : (i64) -> i64
          func.call @stack_push_pointer(%1774) : (i64) -> ()
        }
        %1775 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1775 : i64
      }
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %1776 = arith.addi %1712, %__rlasp_stack_elide_zero_266 : i64
      %1777 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1778 = func.call @cc_errorp(%1776) : (i64) -> i64
      %1779 = func.call @cc_nil_value() : () -> i64
      %1780 = arith.cmpi ne, %1778, %1779 : i64
      scf.if %1780 {
        %1781 = func.call @cc_condition_value(%1776) : (i64) -> i64
        %1782 = func.call @cc_values2(%1779, %1781) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1782) : (i64) -> ()
      } else {
        %1783 = func.call @cc_multiple_value_list(%1776) : (i64) -> i64
        %1784 = func.call @cc_values_pack(%1783) : (i64) -> i64
        func.call @stack_push_pointer(%1784) : (i64) -> ()
      }
      %1785 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1785 : i64
    }
    func.call @stack_push_pointer(%1706) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645768"() {
    %2771 = func.call @cc_nil_value() : () -> i64
    %2772 = func.call @cc_nil_value() : () -> i64
    %2773 = func.call @cc_errorp(%2771) : (i64) -> i64
    %2774 = arith.cmpi ne, %2773, %2772 : i64
    %2775 = scf.if %2774 -> (i64) {
      scf.yield %2771 : i64
    } else {
      %2776 = arith.constant 65 : i64
      func.call @stack_push_fixnum(%2776) : (i64) -> ()
      %2777 = func.call @stack_pop_pointer() : () -> i64
      %2778 = func.call @cc_unbox_fixnum(%2777) : (i64) -> i64
      %2779 = func.call @cc_box_character(%2778) : (i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %2780 = arith.addi %2779, %__rlasp_stack_elide_zero_267 : i64
      %2781 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2782 = arith.constant 47 : i64
      %2783 = func.call @cc_make_string(%2781, %2782) : (!llvm.ptr, i64) -> i64
      %2784 = func.call @cc_nil_value() : () -> i64
      %2785 = func.call @cc_nil_value() : () -> i64
      %2786 = func.call @cc_nil_value() : () -> i64
      %2787 = func.call @cc_errorp(%2785) : (i64) -> i64
      %2788 = arith.cmpi ne, %2787, %2786 : i64
      %2789:2 = scf.if %2788 -> (i64, i64) {
        scf.yield %2785, %2784 : i64, i64
      } else {
        %2790 = func.call @cc_nil_value() : () -> i64
        %2791 = arith.cmpi ne, %2790, %2790 : i64
        scf.if %2791 {
          func.call @stack_push_pointer(%2790) : (i64) -> ()
        } else {
          %2792 = llvm.mlir.addressof @str276 : !llvm.ptr
          %2793 = func.call @cc_make_function_ref_const(%2792) : (!llvm.ptr) -> i64
          %2794 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2793, %2794) : (i64, i64) -> ()
        }
        %2795 = func.call @stack_pop_pointer() : () -> i64
        %2796:2 = scf.while (%arg0 = %2795, %arg1 = %2784) : (i64, i64) -> (i64, i64) {
          %2797 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %2798 = arith.constant 0 : i32
          %2799 = arith.cmpi ne, %2797, %2798 : i32
          scf.condition(%2799) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%2800: i64, %2801: i64):
          %2802 = func.call @cc_car(%2800) : (i64) -> i64
          %2803 = llvm.mlir.addressof @str277 : !llvm.ptr
          %2804 = arith.constant 9 : i64
          %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
          %2806 = llvm.mlir.addressof @str278 : !llvm.ptr
          %2807 = arith.constant 7 : i64
          %2808 = func.call @cc_make_string(%2806, %2807) : (!llvm.ptr, i64) -> i64
          %2809 = func.call @cc_intern(%2805, %2808) : (i64, i64) -> i64
          %2810 = func.call @cc_nil_value() : () -> i64
          %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
          %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
          %2813 = llvm.mlir.addressof @str279 : !llvm.ptr
          %2814 = arith.constant 6 : i64
          %2815 = func.call @cc_make_string(%2813, %2814) : (!llvm.ptr, i64) -> i64
          %2816 = llvm.mlir.addressof @str280 : !llvm.ptr
          %2817 = arith.constant 7 : i64
          %2818 = func.call @cc_make_string(%2816, %2817) : (!llvm.ptr, i64) -> i64
          %2819 = func.call @cc_intern(%2815, %2818) : (i64, i64) -> i64
          %2820 = func.call @cc_nil_value() : () -> i64
          %2821 = func.call @cc_cons(%2819, %2820) : (i64, i64) -> i64
          %2822 = func.call @cc_values_pack(%2821) : (i64) -> i64
          %2823 = llvm.mlir.addressof @str281 : !llvm.ptr
          %2824 = arith.constant 9 : i64
          %2825 = func.call @cc_make_string(%2823, %2824) : (!llvm.ptr, i64) -> i64
          %2826 = llvm.mlir.addressof @str282 : !llvm.ptr
          %2827 = arith.constant 7 : i64
          %2828 = func.call @cc_make_string(%2826, %2827) : (!llvm.ptr, i64) -> i64
          %2829 = func.call @cc_intern(%2825, %2828) : (i64, i64) -> i64
          %2830 = func.call @cc_nil_value() : () -> i64
          %2831 = func.call @cc_cons(%2829, %2830) : (i64, i64) -> i64
          %2832 = func.call @cc_values_pack(%2831) : (i64) -> i64
          %2833 = llvm.mlir.addressof @str283 : !llvm.ptr
          %2834 = arith.constant 9 : i64
          %2835 = func.call @cc_make_string(%2833, %2834) : (!llvm.ptr, i64) -> i64
          %2836 = llvm.mlir.addressof @str284 : !llvm.ptr
          %2837 = arith.constant 7 : i64
          %2838 = func.call @cc_make_string(%2836, %2837) : (!llvm.ptr, i64) -> i64
          %2839 = func.call @cc_intern(%2835, %2838) : (i64, i64) -> i64
          %2840 = func.call @cc_nil_value() : () -> i64
          %2841 = func.call @cc_cons(%2839, %2840) : (i64, i64) -> i64
          %2842 = func.call @cc_values_pack(%2841) : (i64) -> i64
          %2843 = llvm.mlir.addressof @str285 : !llvm.ptr
          %2844 = arith.constant 17 : i64
          %2845 = func.call @cc_make_string(%2843, %2844) : (!llvm.ptr, i64) -> i64
          %2846 = llvm.mlir.addressof @str286 : !llvm.ptr
          %2847 = arith.constant 7 : i64
          %2848 = func.call @cc_make_string(%2846, %2847) : (!llvm.ptr, i64) -> i64
          %2849 = func.call @cc_intern(%2845, %2848) : (i64, i64) -> i64
          %2850 = func.call @cc_nil_value() : () -> i64
          %2851 = func.call @cc_cons(%2849, %2850) : (i64, i64) -> i64
          %2852 = func.call @cc_values_pack(%2851) : (i64) -> i64
          %2853 = llvm.mlir.addressof @str287 : !llvm.ptr
          %2854 = arith.constant 6 : i64
          %2855 = func.call @cc_make_string(%2853, %2854) : (!llvm.ptr, i64) -> i64
          %2856 = llvm.mlir.addressof @str288 : !llvm.ptr
          %2857 = arith.constant 7 : i64
          %2858 = func.call @cc_make_string(%2856, %2857) : (!llvm.ptr, i64) -> i64
          %2859 = func.call @cc_intern(%2855, %2858) : (i64, i64) -> i64
          %2860 = func.call @cc_nil_value() : () -> i64
          %2861 = func.call @cc_cons(%2859, %2860) : (i64, i64) -> i64
          %2862 = func.call @cc_values_pack(%2861) : (i64) -> i64
          %2863 = llvm.mlir.addressof @str289 : !llvm.ptr
          %2864 = arith.constant 15 : i64
          %2865 = func.call @cc_make_string(%2863, %2864) : (!llvm.ptr, i64) -> i64
          %2866 = llvm.mlir.addressof @str290 : !llvm.ptr
          %2867 = arith.constant 7 : i64
          %2868 = func.call @cc_make_string(%2866, %2867) : (!llvm.ptr, i64) -> i64
          %2869 = func.call @cc_intern(%2865, %2868) : (i64, i64) -> i64
          %2870 = func.call @cc_nil_value() : () -> i64
          %2871 = func.call @cc_cons(%2869, %2870) : (i64, i64) -> i64
          %2872 = func.call @cc_values_pack(%2871) : (i64) -> i64
          %2873 = func.call @cc_nil_value() : () -> i64
          %2874 = func.call @cc_errorp(%2783) : (i64) -> i64
          %2875 = arith.cmpi ne, %2874, %2873 : i64
          %2876 = arith.cmpi eq, %2873, %2873 : i64
          %2877 = arith.andi %2875, %2876 : i1
          %2878 = scf.if %2877 -> (i64) {
            scf.yield %2783 : i64
          } else {
            scf.yield %2873 : i64
          }
          %2879 = func.call @cc_errorp(%2809) : (i64) -> i64
          %2880 = arith.cmpi ne, %2879, %2873 : i64
          %2881 = arith.cmpi eq, %2878, %2873 : i64
          %2882 = arith.andi %2880, %2881 : i1
          %2883 = scf.if %2882 -> (i64) {
            scf.yield %2809 : i64
          } else {
            scf.yield %2878 : i64
          }
          %2884 = func.call @cc_errorp(%2819) : (i64) -> i64
          %2885 = arith.cmpi ne, %2884, %2873 : i64
          %2886 = arith.cmpi eq, %2883, %2873 : i64
          %2887 = arith.andi %2885, %2886 : i1
          %2888 = scf.if %2887 -> (i64) {
            scf.yield %2819 : i64
          } else {
            scf.yield %2883 : i64
          }
          %2889 = func.call @cc_errorp(%2829) : (i64) -> i64
          %2890 = arith.cmpi ne, %2889, %2873 : i64
          %2891 = arith.cmpi eq, %2888, %2873 : i64
          %2892 = arith.andi %2890, %2891 : i1
          %2893 = scf.if %2892 -> (i64) {
            scf.yield %2829 : i64
          } else {
            scf.yield %2888 : i64
          }
          %2894 = func.call @cc_errorp(%2839) : (i64) -> i64
          %2895 = arith.cmpi ne, %2894, %2873 : i64
          %2896 = arith.cmpi eq, %2893, %2873 : i64
          %2897 = arith.andi %2895, %2896 : i1
          %2898 = scf.if %2897 -> (i64) {
            scf.yield %2839 : i64
          } else {
            scf.yield %2893 : i64
          }
          %2899 = func.call @cc_errorp(%2849) : (i64) -> i64
          %2900 = arith.cmpi ne, %2899, %2873 : i64
          %2901 = arith.cmpi eq, %2898, %2873 : i64
          %2902 = arith.andi %2900, %2901 : i1
          %2903 = scf.if %2902 -> (i64) {
            scf.yield %2849 : i64
          } else {
            scf.yield %2898 : i64
          }
          %2904 = func.call @cc_errorp(%2859) : (i64) -> i64
          %2905 = arith.cmpi ne, %2904, %2873 : i64
          %2906 = arith.cmpi eq, %2903, %2873 : i64
          %2907 = arith.andi %2905, %2906 : i1
          %2908 = scf.if %2907 -> (i64) {
            scf.yield %2859 : i64
          } else {
            scf.yield %2903 : i64
          }
          %2909 = func.call @cc_errorp(%2869) : (i64) -> i64
          %2910 = arith.cmpi ne, %2909, %2873 : i64
          %2911 = arith.cmpi eq, %2908, %2873 : i64
          %2912 = arith.andi %2910, %2911 : i1
          %2913 = scf.if %2912 -> (i64) {
            scf.yield %2869 : i64
          } else {
            scf.yield %2908 : i64
          }
          %2914 = func.call @cc_errorp(%2802) : (i64) -> i64
          %2915 = arith.cmpi ne, %2914, %2873 : i64
          %2916 = arith.cmpi eq, %2913, %2873 : i64
          %2917 = arith.andi %2915, %2916 : i1
          %2918 = scf.if %2917 -> (i64) {
            scf.yield %2802 : i64
          } else {
            scf.yield %2913 : i64
          }
          %2919 = arith.cmpi ne, %2918, %2873 : i64
          scf.if %2919 {
            func.call @stack_push_pointer(%2918) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2783) : (i64) -> ()
            func.call @stack_push_pointer(%2809) : (i64) -> ()
            func.call @stack_push_pointer(%2819) : (i64) -> ()
            func.call @stack_push_pointer(%2829) : (i64) -> ()
            func.call @stack_push_pointer(%2839) : (i64) -> ()
            func.call @stack_push_pointer(%2849) : (i64) -> ()
            func.call @stack_push_pointer(%2859) : (i64) -> ()
            func.call @stack_push_pointer(%2869) : (i64) -> ()
            func.call @stack_push_pointer(%2802) : (i64) -> ()
            %2920 = llvm.mlir.addressof @str291 : !llvm.ptr
            %2921 = func.call @cc_make_function_ref_const(%2920) : (!llvm.ptr) -> i64
            %2922 = arith.constant 9 : i64
            func.call @cc_funcall_stack(%2921, %2922) : (i64, i64) -> ()
          }
          %2923 = func.call @stack_pop_pointer() : () -> i64
          %2924 = func.call @cc_nil_value() : () -> i64
          %2925 = func.call @cc_nil_value() : () -> i64
          %2926 = func.call @cc_errorp(%2924) : (i64) -> i64
          %2927 = arith.cmpi ne, %2926, %2925 : i64
          %2928 = scf.if %2927 -> (i64) {
            scf.yield %2924 : i64
          } else {
            %2929 = func.call @cc_nil_value() : () -> i64
            %2930 = func.call @cc_errorp(%2780) : (i64) -> i64
            %2931 = arith.cmpi ne, %2930, %2929 : i64
            %2932 = arith.cmpi eq, %2929, %2929 : i64
            %2933 = arith.andi %2931, %2932 : i1
            %2934 = scf.if %2933 -> (i64) {
              scf.yield %2780 : i64
            } else {
              scf.yield %2929 : i64
            }
            %2935 = func.call @cc_errorp(%2923) : (i64) -> i64
            %2936 = arith.cmpi ne, %2935, %2929 : i64
            %2937 = arith.cmpi eq, %2934, %2929 : i64
            %2938 = arith.andi %2936, %2937 : i1
            %2939 = scf.if %2938 -> (i64) {
              scf.yield %2923 : i64
            } else {
              scf.yield %2934 : i64
            }
            %2940 = arith.cmpi ne, %2939, %2929 : i64
            scf.if %2940 {
              func.call @stack_push_pointer(%2939) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2780) : (i64) -> ()
              func.call @stack_push_pointer(%2923) : (i64) -> ()
              %2941 = llvm.mlir.addressof @str292 : !llvm.ptr
              %2942 = func.call @cc_make_function_ref_const(%2941) : (!llvm.ptr) -> i64
              %2943 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%2942, %2943) : (i64, i64) -> ()
            }
            %2944 = func.call @stack_pop_pointer() : () -> i64
            %2945 = func.call @cc_multiple_value_list(%2944) : (i64) -> i64
            %2946 = func.call @cc_nil_value() : () -> i64
            %2947 = func.call @cc_errorp(%2923) : (i64) -> i64
            %2948 = arith.cmpi ne, %2947, %2946 : i64
            %2949 = arith.cmpi eq, %2946, %2946 : i64
            %2950 = arith.andi %2948, %2949 : i1
            %2951 = scf.if %2950 -> (i64) {
              scf.yield %2923 : i64
            } else {
              scf.yield %2946 : i64
            }
            %2952 = arith.cmpi ne, %2951, %2946 : i64
            scf.if %2952 {
              func.call @stack_push_pointer(%2951) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2923) : (i64) -> ()
              %2953 = llvm.mlir.addressof @str293 : !llvm.ptr
              %2954 = func.call @cc_make_function_ref_const(%2953) : (!llvm.ptr) -> i64
              %2955 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2954, %2955) : (i64, i64) -> ()
            }
            %2956 = func.call @stack_depth() : () -> i64
            %2957 = arith.constant 0 : i64
            %2958 = arith.cmpi sgt, %2956, %2957 : i64
            scf.if %2958 {
              %2959 = func.call @stack_pop_pointer() : () -> i64
            }
            %2960 = func.call @cc_values_pack(%2945) : (i64) -> i64
            %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
            %2961 = arith.addi %2960, %__rlasp_stack_elide_zero_268 : i64
            scf.yield %2961 : i64
          }
          func.call @stack_push_pointer(%2928) : (i64) -> ()
          %2962 = func.call @stack_depth() : () -> i64
          %2963 = arith.constant 0 : i64
          %2964 = arith.cmpi sgt, %2962, %2963 : i64
          scf.if %2964 {
            %2965 = func.call @stack_pop_pointer() : () -> i64
          }
          %2966 = llvm.mlir.addressof @str294 : !llvm.ptr
          %2967 = arith.constant 9 : i64
          %2968 = func.call @cc_make_string(%2966, %2967) : (!llvm.ptr, i64) -> i64
          %2969 = llvm.mlir.addressof @str295 : !llvm.ptr
          %2970 = arith.constant 7 : i64
          %2971 = func.call @cc_make_string(%2969, %2970) : (!llvm.ptr, i64) -> i64
          %2972 = func.call @cc_intern(%2968, %2971) : (i64, i64) -> i64
          %2973 = func.call @cc_nil_value() : () -> i64
          %2974 = func.call @cc_cons(%2972, %2973) : (i64, i64) -> i64
          %2975 = func.call @cc_values_pack(%2974) : (i64) -> i64
          %2976 = llvm.mlir.addressof @str296 : !llvm.ptr
          %2977 = arith.constant 5 : i64
          %2978 = func.call @cc_make_string(%2976, %2977) : (!llvm.ptr, i64) -> i64
          %2979 = llvm.mlir.addressof @str297 : !llvm.ptr
          %2980 = arith.constant 7 : i64
          %2981 = func.call @cc_make_string(%2979, %2980) : (!llvm.ptr, i64) -> i64
          %2982 = func.call @cc_intern(%2978, %2981) : (i64, i64) -> i64
          %2983 = func.call @cc_nil_value() : () -> i64
          %2984 = func.call @cc_cons(%2982, %2983) : (i64, i64) -> i64
          %2985 = func.call @cc_values_pack(%2984) : (i64) -> i64
          %2986 = llvm.mlir.addressof @str298 : !llvm.ptr
          %2987 = arith.constant 15 : i64
          %2988 = func.call @cc_make_string(%2986, %2987) : (!llvm.ptr, i64) -> i64
          %2989 = llvm.mlir.addressof @str299 : !llvm.ptr
          %2990 = arith.constant 7 : i64
          %2991 = func.call @cc_make_string(%2989, %2990) : (!llvm.ptr, i64) -> i64
          %2992 = func.call @cc_intern(%2988, %2991) : (i64, i64) -> i64
          %2993 = func.call @cc_nil_value() : () -> i64
          %2994 = func.call @cc_cons(%2992, %2993) : (i64, i64) -> i64
          %2995 = func.call @cc_values_pack(%2994) : (i64) -> i64
          %2996 = func.call @cc_nil_value() : () -> i64
          %2997 = func.call @cc_errorp(%2783) : (i64) -> i64
          %2998 = arith.cmpi ne, %2997, %2996 : i64
          %2999 = arith.cmpi eq, %2996, %2996 : i64
          %3000 = arith.andi %2998, %2999 : i1
          %3001 = scf.if %3000 -> (i64) {
            scf.yield %2783 : i64
          } else {
            scf.yield %2996 : i64
          }
          %3002 = func.call @cc_errorp(%2972) : (i64) -> i64
          %3003 = arith.cmpi ne, %3002, %2996 : i64
          %3004 = arith.cmpi eq, %3001, %2996 : i64
          %3005 = arith.andi %3003, %3004 : i1
          %3006 = scf.if %3005 -> (i64) {
            scf.yield %2972 : i64
          } else {
            scf.yield %3001 : i64
          }
          %3007 = func.call @cc_errorp(%2982) : (i64) -> i64
          %3008 = arith.cmpi ne, %3007, %2996 : i64
          %3009 = arith.cmpi eq, %3006, %2996 : i64
          %3010 = arith.andi %3008, %3009 : i1
          %3011 = scf.if %3010 -> (i64) {
            scf.yield %2982 : i64
          } else {
            scf.yield %3006 : i64
          }
          %3012 = func.call @cc_errorp(%2992) : (i64) -> i64
          %3013 = arith.cmpi ne, %3012, %2996 : i64
          %3014 = arith.cmpi eq, %3011, %2996 : i64
          %3015 = arith.andi %3013, %3014 : i1
          %3016 = scf.if %3015 -> (i64) {
            scf.yield %2992 : i64
          } else {
            scf.yield %3011 : i64
          }
          %3017 = func.call @cc_errorp(%2802) : (i64) -> i64
          %3018 = arith.cmpi ne, %3017, %2996 : i64
          %3019 = arith.cmpi eq, %3016, %2996 : i64
          %3020 = arith.andi %3018, %3019 : i1
          %3021 = scf.if %3020 -> (i64) {
            scf.yield %2802 : i64
          } else {
            scf.yield %3016 : i64
          }
          %3022 = arith.cmpi ne, %3021, %2996 : i64
          scf.if %3022 {
            func.call @stack_push_pointer(%3021) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2783) : (i64) -> ()
            func.call @stack_push_pointer(%2972) : (i64) -> ()
            func.call @stack_push_pointer(%2982) : (i64) -> ()
            func.call @stack_push_pointer(%2992) : (i64) -> ()
            func.call @stack_push_pointer(%2802) : (i64) -> ()
            %3023 = llvm.mlir.addressof @str300 : !llvm.ptr
            %3024 = func.call @cc_make_function_ref_const(%3023) : (!llvm.ptr) -> i64
            %3025 = arith.constant 5 : i64
            func.call @cc_funcall_stack(%3024, %3025) : (i64, i64) -> ()
          }
          %3026 = func.call @stack_pop_pointer() : () -> i64
          %3027 = func.call @cc_nil_value() : () -> i64
          %3028 = func.call @cc_nil_value() : () -> i64
          %3029 = func.call @cc_errorp(%3027) : (i64) -> i64
          %3030 = arith.cmpi ne, %3029, %3028 : i64
          %3031:2 = scf.if %3030 -> (i64, i64) {
            scf.yield %3027, %2801 : i64, i64
          } else {
            %3032 = func.call @cc_nil_value() : () -> i64
            %3033 = func.call @cc_errorp(%3026) : (i64) -> i64
            %3034 = arith.cmpi ne, %3033, %3032 : i64
            %3035 = arith.cmpi eq, %3032, %3032 : i64
            %3036 = arith.andi %3034, %3035 : i1
            %3037 = scf.if %3036 -> (i64) {
              scf.yield %3026 : i64
            } else {
              scf.yield %3032 : i64
            }
            %3038 = arith.cmpi ne, %3037, %3032 : i64
            scf.if %3038 {
              func.call @stack_push_pointer(%3037) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3026) : (i64) -> ()
              %3039 = llvm.mlir.addressof @str301 : !llvm.ptr
              %3040 = func.call @cc_make_function_ref_const(%3039) : (!llvm.ptr) -> i64
              %3041 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3040, %3041) : (i64, i64) -> ()
            }
            %3042 = func.call @stack_pop_pointer() : () -> i64
            %3043 = func.call @cc_nil_value() : () -> i64
            %3044 = func.call @cc_nil_value() : () -> i64
            %3045 = func.call @cc_errorp(%3043) : (i64) -> i64
            %3046 = arith.cmpi ne, %3045, %3044 : i64
            %3047:2 = scf.if %3046 -> (i64, i64) {
              scf.yield %3043, %2801 : i64, i64
            } else {
              func.call @stack_push_pointer(%2802) : (i64) -> ()
              %3048 = llvm.mlir.addressof @str302 : !llvm.ptr
              %3049 = arith.constant 5 : i64
              %3050 = func.call @cc_make_string(%3048, %3049) : (!llvm.ptr, i64) -> i64
              %3051 = llvm.mlir.addressof @str303 : !llvm.ptr
              %3052 = arith.constant 7 : i64
              %3053 = func.call @cc_make_string(%3051, %3052) : (!llvm.ptr, i64) -> i64
              %3054 = func.call @cc_intern(%3050, %3053) : (i64, i64) -> i64
              %3055 = func.call @cc_nil_value() : () -> i64
              %3056 = func.call @cc_cons(%3054, %3055) : (i64, i64) -> i64
              %3057 = func.call @cc_values_pack(%3056) : (i64) -> i64
              func.call @stack_push_pointer(%3054) : (i64) -> ()
              %3058 = llvm.mlir.addressof @str304 : !llvm.ptr
              %3059 = arith.constant 5 : i64
              %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
              %3061 = llvm.mlir.addressof @str305 : !llvm.ptr
              %3062 = arith.constant 7 : i64
              %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
              %3064 = func.call @cc_intern(%3060, %3063) : (i64, i64) -> i64
              %3065 = func.call @cc_nil_value() : () -> i64
              %3066 = func.call @cc_cons(%3064, %3065) : (i64, i64) -> i64
              %3067 = func.call @cc_values_pack(%3066) : (i64) -> i64
              func.call @stack_push_pointer(%3064) : (i64) -> ()
              func.call @stack_push_nil() : () -> ()
              %3068 = func.call @stack_pop_pointer() : () -> i64
              %3069 = func.call @stack_pop_pointer() : () -> i64
              %3070 = func.call @cc_cons(%3069, %3068) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
              %3071 = arith.addi %3070, %__rlasp_stack_elide_zero_269 : i64
              %3072 = func.call @stack_pop_pointer() : () -> i64
              %3073 = func.call @cc_cons(%3072, %3071) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
              %3074 = arith.addi %3073, %__rlasp_stack_elide_zero_270 : i64
              %3075 = func.call @stack_pop_pointer() : () -> i64
              %3076 = func.call @cc_member(%3075, %3074) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
              %3077 = arith.addi %3076, %__rlasp_stack_elide_zero_271 : i64
              %3078 = func.call @cc_nil_value() : () -> i64
              %3079 = func.call @cc_cons(%3077, %3078) : (i64, i64) -> i64
              %3080 = func.call @cc_not(%3079) : (i64) -> i64
              %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
              %3081 = arith.addi %3080, %__rlasp_stack_elide_zero_272 : i64
              %3082 = func.call @cc_nil_value() : () -> i64
              %3083 = arith.cmpi ne, %3081, %3082 : i64
              %3084:2 = scf.if %3083 -> (i64, i64) {
                %3085 = func.call @cc_nil_value() : () -> i64
                %3086 = func.call @cc_nil_value() : () -> i64
                %3087 = func.call @cc_errorp(%3085) : (i64) -> i64
                %3088 = arith.cmpi ne, %3087, %3086 : i64
                %3089:2 = scf.if %3088 -> (i64, i64) {
                  scf.yield %3085, %2801 : i64, i64
                } else {
                  func.call @stack_push_pointer(%2780) : (i64) -> ()
                  %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
                  %3090 = arith.addi %3042, %__rlasp_stack_elide_zero_273 : i64
                  %3091 = func.call @stack_pop_pointer() : () -> i64
                  %3092 = func.call @cc_char_eq(%3091, %3090) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
                  %3093 = arith.addi %3092, %__rlasp_stack_elide_zero_274 : i64
                  %3094 = func.call @cc_nil_value() : () -> i64
                  %3095 = func.call @cc_cons(%3093, %3094) : (i64, i64) -> i64
                  %3096 = func.call @cc_not(%3095) : (i64) -> i64
                  %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
                  %3097 = arith.addi %3096, %__rlasp_stack_elide_zero_275 : i64
                  %3098 = func.call @cc_nil_value() : () -> i64
                  %3099 = arith.cmpi ne, %3097, %3098 : i64
                  %3100:2 = scf.if %3099 -> (i64, i64) {
                    %3101 = func.call @cc_nil_value() : () -> i64
                    %3102 = func.call @cc_nil_value() : () -> i64
                    %3103 = func.call @cc_errorp(%3101) : (i64) -> i64
                    %3104 = arith.cmpi ne, %3103, %3102 : i64
                    %3105:2 = scf.if %3104 -> (i64, i64) {
                      scf.yield %3101, %2801 : i64, i64
                    } else {
                      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
                      %3106 = arith.addi %2780, %__rlasp_stack_elide_zero_276 : i64
                      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
                      %3107 = arith.addi %3042, %__rlasp_stack_elide_zero_277 : i64
                      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
                      %3108 = arith.addi %2802, %__rlasp_stack_elide_zero_278 : i64
                      %3109 = func.call @cc_nil_value() : () -> i64
                      %3110 = func.call @cc_errorp(%3106) : (i64) -> i64
                      %3111 = arith.cmpi ne, %3110, %3109 : i64
                      %3112 = arith.cmpi eq, %3109, %3109 : i64
                      %3113 = arith.andi %3111, %3112 : i1
                      %3114 = scf.if %3113 -> (i64) {
                        scf.yield %3106 : i64
                      } else {
                        scf.yield %3109 : i64
                      }
                      %3115 = func.call @cc_errorp(%3107) : (i64) -> i64
                      %3116 = arith.cmpi ne, %3115, %3109 : i64
                      %3117 = arith.cmpi eq, %3114, %3109 : i64
                      %3118 = arith.andi %3116, %3117 : i1
                      %3119 = scf.if %3118 -> (i64) {
                        scf.yield %3107 : i64
                      } else {
                        scf.yield %3114 : i64
                      }
                      %3120 = func.call @cc_errorp(%3108) : (i64) -> i64
                      %3121 = arith.cmpi ne, %3120, %3109 : i64
                      %3122 = arith.cmpi eq, %3119, %3109 : i64
                      %3123 = arith.andi %3121, %3122 : i1
                      %3124 = scf.if %3123 -> (i64) {
                        scf.yield %3108 : i64
                      } else {
                        scf.yield %3119 : i64
                      }
                      %3125 = arith.cmpi ne, %3124, %3109 : i64
                      scf.if %3125 {
                        func.call @stack_push_pointer(%3124) : (i64) -> ()
                      } else {
                        %3126 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%3126) : (i64) -> ()
                        %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
                        %3127 = arith.addi %3108, %__rlasp_stack_elide_zero_279 : i64
                        %3128 = func.call @stack_pop_pointer() : () -> i64
                        %3129 = func.call @cc_cons(%3127, %3128) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%3129) : (i64) -> ()
                        %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
                        %3130 = arith.addi %3107, %__rlasp_stack_elide_zero_280 : i64
                        %3131 = func.call @stack_pop_pointer() : () -> i64
                        %3132 = func.call @cc_cons(%3130, %3131) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%3132) : (i64) -> ()
                        %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
                        %3133 = arith.addi %3106, %__rlasp_stack_elide_zero_281 : i64
                        %3134 = func.call @stack_pop_pointer() : () -> i64
                        %3135 = func.call @cc_cons(%3133, %3134) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%3135) : (i64) -> ()
                      }
                      %3136 = func.call @stack_pop_pointer() : () -> i64
                      %3137 = func.call @cc_cons(%3136, %2801) : (i64, i64) -> i64
                      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
                      %3138 = arith.addi %3137, %__rlasp_stack_elide_zero_282 : i64
                      scf.yield %3138, %3137 : i64, i64
                    }
                    %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
                    %3139 = arith.addi %3105#0, %__rlasp_stack_elide_zero_283 : i64
                    scf.yield %3139, %3105#1 : i64, i64
                  } else {
                    func.call @stack_push_nil() : () -> ()
                    %3140 = func.call @stack_pop_pointer() : () -> i64
                    scf.yield %3140, %2801 : i64, i64
                  }
                  %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
                  %3141 = arith.addi %3100#0, %__rlasp_stack_elide_zero_284 : i64
                  scf.yield %3141, %3100#1 : i64, i64
                }
                %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
                %3142 = arith.addi %3089#0, %__rlasp_stack_elide_zero_285 : i64
                scf.yield %3142, %3089#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %3143 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %3143, %2801 : i64, i64
              }
              %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
              %3144 = arith.addi %3084#0, %__rlasp_stack_elide_zero_286 : i64
              scf.yield %3144, %3084#1 : i64, i64
            }
            %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
            %3145 = arith.addi %3047#0, %__rlasp_stack_elide_zero_287 : i64
            %3146 = func.call @cc_multiple_value_list(%3145) : (i64) -> i64
            %3147 = func.call @cc_nil_value() : () -> i64
            %3148 = func.call @cc_errorp(%3026) : (i64) -> i64
            %3149 = arith.cmpi ne, %3148, %3147 : i64
            %3150 = arith.cmpi eq, %3147, %3147 : i64
            %3151 = arith.andi %3149, %3150 : i1
            %3152 = scf.if %3151 -> (i64) {
              scf.yield %3026 : i64
            } else {
              scf.yield %3147 : i64
            }
            %3153 = arith.cmpi ne, %3152, %3147 : i64
            scf.if %3153 {
              func.call @stack_push_pointer(%3152) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3026) : (i64) -> ()
              %3154 = llvm.mlir.addressof @str306 : !llvm.ptr
              %3155 = func.call @cc_make_function_ref_const(%3154) : (!llvm.ptr) -> i64
              %3156 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3155, %3156) : (i64, i64) -> ()
            }
            %3157 = func.call @stack_depth() : () -> i64
            %3158 = arith.constant 0 : i64
            %3159 = arith.cmpi sgt, %3157, %3158 : i64
            scf.if %3159 {
              %3160 = func.call @stack_pop_pointer() : () -> i64
            }
            %3161 = func.call @cc_values_pack(%3146) : (i64) -> i64
            %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
            %3162 = arith.addi %3161, %__rlasp_stack_elide_zero_288 : i64
            scf.yield %3162, %3047#1 : i64, i64
          }
          func.call @stack_push_pointer(%3031#0) : (i64) -> ()
          %3163 = func.call @stack_depth() : () -> i64
          %3164 = arith.constant 0 : i64
          %3165 = arith.cmpi sgt, %3163, %3164 : i64
          scf.if %3165 {
            %3166 = func.call @stack_pop_pointer() : () -> i64
          }
          %3167 = func.call @cc_cdr(%2800) : (i64) -> i64
          scf.yield %3167, %3031#1 : i64, i64
        }
        %3168 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
        %3169 = arith.addi %2796#1, %__rlasp_stack_elide_zero_289 : i64
        %3170 = func.call @cc_multiple_value_list(%3169) : (i64) -> i64
        %3171 = func.call @cc_nil_value() : () -> i64
        %3172 = func.call @cc_errorp(%2783) : (i64) -> i64
        %3173 = arith.cmpi ne, %3172, %3171 : i64
        %3174 = arith.cmpi eq, %3171, %3171 : i64
        %3175 = arith.andi %3173, %3174 : i1
        %3176 = scf.if %3175 -> (i64) {
          scf.yield %2783 : i64
        } else {
          scf.yield %3171 : i64
        }
        %3177 = arith.cmpi ne, %3176, %3171 : i64
        scf.if %3177 {
          func.call @stack_push_pointer(%3176) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2783) : (i64) -> ()
          %3178 = llvm.mlir.addressof @str307 : !llvm.ptr
          %3179 = func.call @cc_make_function_ref_const(%3178) : (!llvm.ptr) -> i64
          %3180 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3179, %3180) : (i64, i64) -> ()
        }
        %3181 = func.call @stack_pop_pointer() : () -> i64
        %3182 = func.call @cc_nil_value() : () -> i64
        %3183 = arith.cmpi ne, %3181, %3182 : i64
        scf.if %3183 {
          %3184 = func.call @cc_nil_value() : () -> i64
          %3185 = func.call @cc_nil_value() : () -> i64
          %3186 = func.call @cc_errorp(%3184) : (i64) -> i64
          %3187 = arith.cmpi ne, %3186, %3185 : i64
          %3188 = scf.if %3187 -> (i64) {
            scf.yield %3184 : i64
          } else {
            %3189 = func.call @cc_nil_value() : () -> i64
            %3190 = func.call @cc_errorp(%2783) : (i64) -> i64
            %3191 = arith.cmpi ne, %3190, %3189 : i64
            %3192 = arith.cmpi eq, %3189, %3189 : i64
            %3193 = arith.andi %3191, %3192 : i1
            %3194 = scf.if %3193 -> (i64) {
              scf.yield %2783 : i64
            } else {
              scf.yield %3189 : i64
            }
            %3195 = arith.cmpi ne, %3194, %3189 : i64
            scf.if %3195 {
              func.call @stack_push_pointer(%3194) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2783) : (i64) -> ()
              %3196 = llvm.mlir.addressof @str308 : !llvm.ptr
              %3197 = func.call @cc_make_function_ref_const(%3196) : (!llvm.ptr) -> i64
              %3198 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3197, %3198) : (i64, i64) -> ()
            }
            %3199 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3199 : i64
          }
          func.call @stack_push_pointer(%3188) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
        }
        %3200 = func.call @stack_depth() : () -> i64
        %3201 = arith.constant 0 : i64
        %3202 = arith.cmpi sgt, %3200, %3201 : i64
        scf.if %3202 {
          %3203 = func.call @stack_pop_pointer() : () -> i64
        }
        %3204 = func.call @cc_values_pack(%3170) : (i64) -> i64
        %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
        %3205 = arith.addi %3204, %__rlasp_stack_elide_zero_290 : i64
        scf.yield %3205, %2796#1 : i64, i64
      }
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %3206 = arith.addi %2789#0, %__rlasp_stack_elide_zero_291 : i64
      scf.yield %3206 : i64
    }
    func.call @stack_push_pointer(%2775) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645769"() {
    %3493 = func.call @cc_nil_value() : () -> i64
    %3494 = func.call @cc_nil_value() : () -> i64
    %3495 = func.call @cc_errorp(%3493) : (i64) -> i64
    %3496 = arith.cmpi ne, %3495, %3494 : i64
    %3497 = scf.if %3496 -> (i64) {
      scf.yield %3493 : i64
    } else {
      %3498 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3499 = arith.constant 46 : i64
      %3500 = func.call @cc_make_string(%3498, %3499) : (!llvm.ptr, i64) -> i64
      %3501 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3502 = arith.constant 9 : i64
      %3503 = func.call @cc_make_string(%3501, %3502) : (!llvm.ptr, i64) -> i64
      %3504 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3505 = arith.constant 7 : i64
      %3506 = func.call @cc_make_string(%3504, %3505) : (!llvm.ptr, i64) -> i64
      %3507 = func.call @cc_intern(%3503, %3506) : (i64, i64) -> i64
      %3508 = func.call @cc_nil_value() : () -> i64
      %3509 = func.call @cc_cons(%3507, %3508) : (i64, i64) -> i64
      %3510 = func.call @cc_values_pack(%3509) : (i64) -> i64
      %3511 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3512 = arith.constant 6 : i64
      %3513 = func.call @cc_make_string(%3511, %3512) : (!llvm.ptr, i64) -> i64
      %3514 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3515 = arith.constant 7 : i64
      %3516 = func.call @cc_make_string(%3514, %3515) : (!llvm.ptr, i64) -> i64
      %3517 = func.call @cc_intern(%3513, %3516) : (i64, i64) -> i64
      %3518 = func.call @cc_nil_value() : () -> i64
      %3519 = func.call @cc_cons(%3517, %3518) : (i64, i64) -> i64
      %3520 = func.call @cc_values_pack(%3519) : (i64) -> i64
      %3521 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3522 = arith.constant 9 : i64
      %3523 = func.call @cc_make_string(%3521, %3522) : (!llvm.ptr, i64) -> i64
      %3524 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3525 = arith.constant 7 : i64
      %3526 = func.call @cc_make_string(%3524, %3525) : (!llvm.ptr, i64) -> i64
      %3527 = func.call @cc_intern(%3523, %3526) : (i64, i64) -> i64
      %3528 = func.call @cc_nil_value() : () -> i64
      %3529 = func.call @cc_cons(%3527, %3528) : (i64, i64) -> i64
      %3530 = func.call @cc_values_pack(%3529) : (i64) -> i64
      %3531 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3532 = arith.constant 9 : i64
      %3533 = func.call @cc_make_string(%3531, %3532) : (!llvm.ptr, i64) -> i64
      %3534 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3535 = arith.constant 7 : i64
      %3536 = func.call @cc_make_string(%3534, %3535) : (!llvm.ptr, i64) -> i64
      %3537 = func.call @cc_intern(%3533, %3536) : (i64, i64) -> i64
      %3538 = func.call @cc_nil_value() : () -> i64
      %3539 = func.call @cc_cons(%3537, %3538) : (i64, i64) -> i64
      %3540 = func.call @cc_values_pack(%3539) : (i64) -> i64
      %3541 = llvm.mlir.addressof @str352 : !llvm.ptr
      %3542 = arith.constant 17 : i64
      %3543 = func.call @cc_make_string(%3541, %3542) : (!llvm.ptr, i64) -> i64
      %3544 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3545 = arith.constant 7 : i64
      %3546 = func.call @cc_make_string(%3544, %3545) : (!llvm.ptr, i64) -> i64
      %3547 = func.call @cc_intern(%3543, %3546) : (i64, i64) -> i64
      %3548 = func.call @cc_nil_value() : () -> i64
      %3549 = func.call @cc_cons(%3547, %3548) : (i64, i64) -> i64
      %3550 = func.call @cc_values_pack(%3549) : (i64) -> i64
      %3551 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3552 = arith.constant 6 : i64
      %3553 = func.call @cc_make_string(%3551, %3552) : (!llvm.ptr, i64) -> i64
      %3554 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3555 = arith.constant 7 : i64
      %3556 = func.call @cc_make_string(%3554, %3555) : (!llvm.ptr, i64) -> i64
      %3557 = func.call @cc_intern(%3553, %3556) : (i64, i64) -> i64
      %3558 = func.call @cc_nil_value() : () -> i64
      %3559 = func.call @cc_cons(%3557, %3558) : (i64, i64) -> i64
      %3560 = func.call @cc_values_pack(%3559) : (i64) -> i64
      %3561 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3562 = arith.constant 15 : i64
      %3563 = func.call @cc_make_string(%3561, %3562) : (!llvm.ptr, i64) -> i64
      %3564 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3565 = arith.constant 7 : i64
      %3566 = func.call @cc_make_string(%3564, %3565) : (!llvm.ptr, i64) -> i64
      %3567 = func.call @cc_intern(%3563, %3566) : (i64, i64) -> i64
      %3568 = func.call @cc_nil_value() : () -> i64
      %3569 = func.call @cc_cons(%3567, %3568) : (i64, i64) -> i64
      %3570 = func.call @cc_values_pack(%3569) : (i64) -> i64
      %3571 = llvm.mlir.addressof @str358 : !llvm.ptr
      %3572 = arith.constant 7 : i64
      %3573 = func.call @cc_make_string(%3571, %3572) : (!llvm.ptr, i64) -> i64
      %3574 = llvm.mlir.addressof @str359 : !llvm.ptr
      %3575 = arith.constant 7 : i64
      %3576 = func.call @cc_make_string(%3574, %3575) : (!llvm.ptr, i64) -> i64
      %3577 = func.call @cc_intern(%3573, %3576) : (i64, i64) -> i64
      %3578 = func.call @cc_nil_value() : () -> i64
      %3579 = func.call @cc_cons(%3577, %3578) : (i64, i64) -> i64
      %3580 = func.call @cc_values_pack(%3579) : (i64) -> i64
      %3581 = func.call @cc_nil_value() : () -> i64
      %3582 = func.call @cc_errorp(%3500) : (i64) -> i64
      %3583 = arith.cmpi ne, %3582, %3581 : i64
      %3584 = arith.cmpi eq, %3581, %3581 : i64
      %3585 = arith.andi %3583, %3584 : i1
      %3586 = scf.if %3585 -> (i64) {
        scf.yield %3500 : i64
      } else {
        scf.yield %3581 : i64
      }
      %3587 = func.call @cc_errorp(%3507) : (i64) -> i64
      %3588 = arith.cmpi ne, %3587, %3581 : i64
      %3589 = arith.cmpi eq, %3586, %3581 : i64
      %3590 = arith.andi %3588, %3589 : i1
      %3591 = scf.if %3590 -> (i64) {
        scf.yield %3507 : i64
      } else {
        scf.yield %3586 : i64
      }
      %3592 = func.call @cc_errorp(%3517) : (i64) -> i64
      %3593 = arith.cmpi ne, %3592, %3581 : i64
      %3594 = arith.cmpi eq, %3591, %3581 : i64
      %3595 = arith.andi %3593, %3594 : i1
      %3596 = scf.if %3595 -> (i64) {
        scf.yield %3517 : i64
      } else {
        scf.yield %3591 : i64
      }
      %3597 = func.call @cc_errorp(%3527) : (i64) -> i64
      %3598 = arith.cmpi ne, %3597, %3581 : i64
      %3599 = arith.cmpi eq, %3596, %3581 : i64
      %3600 = arith.andi %3598, %3599 : i1
      %3601 = scf.if %3600 -> (i64) {
        scf.yield %3527 : i64
      } else {
        scf.yield %3596 : i64
      }
      %3602 = func.call @cc_errorp(%3537) : (i64) -> i64
      %3603 = arith.cmpi ne, %3602, %3581 : i64
      %3604 = arith.cmpi eq, %3601, %3581 : i64
      %3605 = arith.andi %3603, %3604 : i1
      %3606 = scf.if %3605 -> (i64) {
        scf.yield %3537 : i64
      } else {
        scf.yield %3601 : i64
      }
      %3607 = func.call @cc_errorp(%3547) : (i64) -> i64
      %3608 = arith.cmpi ne, %3607, %3581 : i64
      %3609 = arith.cmpi eq, %3606, %3581 : i64
      %3610 = arith.andi %3608, %3609 : i1
      %3611 = scf.if %3610 -> (i64) {
        scf.yield %3547 : i64
      } else {
        scf.yield %3606 : i64
      }
      %3612 = func.call @cc_errorp(%3557) : (i64) -> i64
      %3613 = arith.cmpi ne, %3612, %3581 : i64
      %3614 = arith.cmpi eq, %3611, %3581 : i64
      %3615 = arith.andi %3613, %3614 : i1
      %3616 = scf.if %3615 -> (i64) {
        scf.yield %3557 : i64
      } else {
        scf.yield %3611 : i64
      }
      %3617 = func.call @cc_errorp(%3567) : (i64) -> i64
      %3618 = arith.cmpi ne, %3617, %3581 : i64
      %3619 = arith.cmpi eq, %3616, %3581 : i64
      %3620 = arith.andi %3618, %3619 : i1
      %3621 = scf.if %3620 -> (i64) {
        scf.yield %3567 : i64
      } else {
        scf.yield %3616 : i64
      }
      %3622 = func.call @cc_errorp(%3577) : (i64) -> i64
      %3623 = arith.cmpi ne, %3622, %3581 : i64
      %3624 = arith.cmpi eq, %3621, %3581 : i64
      %3625 = arith.andi %3623, %3624 : i1
      %3626 = scf.if %3625 -> (i64) {
        scf.yield %3577 : i64
      } else {
        scf.yield %3621 : i64
      }
      %3627 = arith.cmpi ne, %3626, %3581 : i64
      scf.if %3627 {
        func.call @stack_push_pointer(%3626) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3500) : (i64) -> ()
        func.call @stack_push_pointer(%3507) : (i64) -> ()
        func.call @stack_push_pointer(%3517) : (i64) -> ()
        func.call @stack_push_pointer(%3527) : (i64) -> ()
        func.call @stack_push_pointer(%3537) : (i64) -> ()
        func.call @stack_push_pointer(%3547) : (i64) -> ()
        func.call @stack_push_pointer(%3557) : (i64) -> ()
        func.call @stack_push_pointer(%3567) : (i64) -> ()
        func.call @stack_push_pointer(%3577) : (i64) -> ()
        %3628 = llvm.mlir.addressof @str360 : !llvm.ptr
        %3629 = func.call @cc_make_function_ref_const(%3628) : (!llvm.ptr) -> i64
        %3630 = arith.constant 9 : i64
        func.call @cc_funcall_stack(%3629, %3630) : (i64, i64) -> ()
      }
      %3631 = func.call @stack_pop_pointer() : () -> i64
      %3632 = func.call @cc_nil_value() : () -> i64
      %3633 = func.call @cc_nil_value() : () -> i64
      %3634 = func.call @cc_errorp(%3632) : (i64) -> i64
      %3635 = arith.cmpi ne, %3634, %3633 : i64
      %3636 = scf.if %3635 -> (i64) {
        scf.yield %3632 : i64
      } else {
        %3637 = arith.constant 65 : i64
        func.call @stack_push_fixnum(%3637) : (i64) -> ()
        %3638 = func.call @stack_pop_pointer() : () -> i64
        %3639 = func.call @cc_unbox_fixnum(%3638) : (i64) -> i64
        %3640 = func.call @cc_box_character(%3639) : (i64) -> i64
        %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
        %3641 = arith.addi %3640, %__rlasp_stack_elide_zero_292 : i64
        %3642 = func.call @cc_nil_value() : () -> i64
        %3643 = func.call @cc_errorp(%3641) : (i64) -> i64
        %3644 = arith.cmpi ne, %3643, %3642 : i64
        %3645 = arith.cmpi eq, %3642, %3642 : i64
        %3646 = arith.andi %3644, %3645 : i1
        %3647 = scf.if %3646 -> (i64) {
          scf.yield %3641 : i64
        } else {
          scf.yield %3642 : i64
        }
        %3648 = func.call @cc_errorp(%3631) : (i64) -> i64
        %3649 = arith.cmpi ne, %3648, %3642 : i64
        %3650 = arith.cmpi eq, %3647, %3642 : i64
        %3651 = arith.andi %3649, %3650 : i1
        %3652 = scf.if %3651 -> (i64) {
          scf.yield %3631 : i64
        } else {
          scf.yield %3647 : i64
        }
        %3653 = arith.cmpi ne, %3652, %3642 : i64
        scf.if %3653 {
          func.call @stack_push_pointer(%3652) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3641) : (i64) -> ()
          func.call @stack_push_pointer(%3631) : (i64) -> ()
          %3654 = llvm.mlir.addressof @str361 : !llvm.ptr
          %3655 = func.call @cc_make_function_ref_const(%3654) : (!llvm.ptr) -> i64
          %3656 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3655, %3656) : (i64, i64) -> ()
        }
        %3657 = func.call @stack_pop_pointer() : () -> i64
        %3658 = func.call @cc_multiple_value_list(%3657) : (i64) -> i64
        %3659 = func.call @cc_nil_value() : () -> i64
        %3660 = func.call @cc_errorp(%3631) : (i64) -> i64
        %3661 = arith.cmpi ne, %3660, %3659 : i64
        %3662 = arith.cmpi eq, %3659, %3659 : i64
        %3663 = arith.andi %3661, %3662 : i1
        %3664 = scf.if %3663 -> (i64) {
          scf.yield %3631 : i64
        } else {
          scf.yield %3659 : i64
        }
        %3665 = arith.cmpi ne, %3664, %3659 : i64
        scf.if %3665 {
          func.call @stack_push_pointer(%3664) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3631) : (i64) -> ()
          %3666 = llvm.mlir.addressof @str362 : !llvm.ptr
          %3667 = func.call @cc_make_function_ref_const(%3666) : (!llvm.ptr) -> i64
          %3668 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3667, %3668) : (i64, i64) -> ()
        }
        %3669 = func.call @stack_depth() : () -> i64
        %3670 = arith.constant 0 : i64
        %3671 = arith.cmpi sgt, %3669, %3670 : i64
        scf.if %3671 {
          %3672 = func.call @stack_pop_pointer() : () -> i64
        }
        %3673 = func.call @cc_values_pack(%3658) : (i64) -> i64
        %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
        %3674 = arith.addi %3673, %__rlasp_stack_elide_zero_293 : i64
        scf.yield %3674 : i64
      }
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %3675 = arith.addi %3636, %__rlasp_stack_elide_zero_294 : i64
      scf.yield %3675 : i64
    }
    func.call @stack_push_pointer(%3497) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645770"() {
    %3881 = func.call @cc_nil_value() : () -> i64
    %3882 = func.call @cc_nil_value() : () -> i64
    %3883 = func.call @cc_errorp(%3881) : (i64) -> i64
    %3884 = arith.cmpi ne, %3883, %3882 : i64
    %3885 = scf.if %3884 -> (i64) {
      scf.yield %3881 : i64
    } else {
      %3886 = func.call @cc_nil_value() : () -> i64
      %3887 = func.call @cc_nil_value() : () -> i64
      %3888 = func.call @cc_errorp(%3886) : (i64) -> i64
      %3889 = arith.cmpi ne, %3888, %3887 : i64
      %3890 = scf.if %3889 -> (i64) {
        scf.yield %3886 : i64
      } else {
        %3891 = llvm.mlir.addressof @str383 : !llvm.ptr
        %3892 = arith.constant 42 : i64
        %3893 = func.call @cc_make_string(%3891, %3892) : (!llvm.ptr, i64) -> i64
        %3894 = func.call @cc_nil_value() : () -> i64
        %3895 = func.call @cc_errorp(%3893) : (i64) -> i64
        %3896 = arith.cmpi ne, %3895, %3894 : i64
        %3897 = arith.cmpi eq, %3894, %3894 : i64
        %3898 = arith.andi %3896, %3897 : i1
        %3899 = scf.if %3898 -> (i64) {
          scf.yield %3893 : i64
        } else {
          scf.yield %3894 : i64
        }
        %3900 = arith.cmpi ne, %3899, %3894 : i64
        scf.if %3900 {
          func.call @stack_push_pointer(%3899) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3893) : (i64) -> ()
          %3901 = llvm.mlir.addressof @str384 : !llvm.ptr
          %3902 = func.call @cc_make_function_ref_const(%3901) : (!llvm.ptr) -> i64
          %3903 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3902, %3903) : (i64, i64) -> ()
        }
        %3904 = func.call @stack_pop_pointer() : () -> i64
        %3905 = llvm.mlir.addressof @str385 : !llvm.ptr
        %3906 = arith.constant 15 : i64
        %3907 = func.call @cc_make_string(%3905, %3906) : (!llvm.ptr, i64) -> i64
        %3908 = llvm.mlir.addressof @str386 : !llvm.ptr
        %3909 = arith.constant 7 : i64
        %3910 = func.call @cc_make_string(%3908, %3909) : (!llvm.ptr, i64) -> i64
        %3911 = func.call @cc_intern(%3907, %3910) : (i64, i64) -> i64
        %3912 = func.call @cc_nil_value() : () -> i64
        %3913 = func.call @cc_cons(%3911, %3912) : (i64, i64) -> i64
        %3914 = func.call @cc_values_pack(%3913) : (i64) -> i64
        %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
        %3915 = arith.addi %3911, %__rlasp_stack_elide_zero_295 : i64
        %3916 = llvm.mlir.addressof @str387 : !llvm.ptr
        %3917 = arith.constant 7 : i64
        %3918 = func.call @cc_make_string(%3916, %3917) : (!llvm.ptr, i64) -> i64
        %3919 = llvm.mlir.addressof @str388 : !llvm.ptr
        %3920 = arith.constant 7 : i64
        %3921 = func.call @cc_make_string(%3919, %3920) : (!llvm.ptr, i64) -> i64
        %3922 = func.call @cc_intern(%3918, %3921) : (i64, i64) -> i64
        %3923 = func.call @cc_nil_value() : () -> i64
        %3924 = func.call @cc_cons(%3922, %3923) : (i64, i64) -> i64
        %3925 = func.call @cc_values_pack(%3924) : (i64) -> i64
        %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
        %3926 = arith.addi %3922, %__rlasp_stack_elide_zero_296 : i64
        %3927 = func.call @cc_nil_value() : () -> i64
        %3928 = func.call @cc_cons(%3926, %3927) : (i64, i64) -> i64
        %3929 = func.call @cc_cons(%3915, %3928) : (i64, i64) -> i64
        %3930 = func.call @cc_cons(%3904, %3929) : (i64, i64) -> i64
        %3931 = func.call @cc_load_stack(%3930) : (i64) -> i64
        %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
        %3932 = arith.addi %3931, %__rlasp_stack_elide_zero_297 : i64
        scf.yield %3932 : i64
      }
      %3933 = func.call @cc_nil_value() : () -> i64
      %3934 = func.call @cc_errorp(%3890) : (i64) -> i64
      %3935 = arith.cmpi ne, %3934, %3933 : i64
      %3936 = scf.if %3935 -> (i64) {
        scf.yield %3890 : i64
      } else {
        %3937 = llvm.mlir.addressof @str389 : !llvm.ptr
        %3938 = arith.constant 15 : i64
        %3939 = func.call @cc_make_string(%3937, %3938) : (!llvm.ptr, i64) -> i64
        %3940 = llvm.mlir.addressof @str390 : !llvm.ptr
        %3941 = arith.constant 9 : i64
        %3942 = func.call @cc_make_string(%3940, %3941) : (!llvm.ptr, i64) -> i64
        %3943 = func.call @cc_intern(%3939, %3942) : (i64, i64) -> i64
        %3944 = func.call @cc_nil_value() : () -> i64
        %3945 = func.call @cc_cons(%3943, %3944) : (i64, i64) -> i64
        %3946 = func.call @cc_values_pack(%3945) : (i64) -> i64
        %3947 = func.call @cc_symbol_value(%3943) : (i64) -> i64
        %3948 = func.call @cc_nil_value() : () -> i64
        %3949 = func.call @cc_errorp(%3947) : (i64) -> i64
        %3950 = arith.cmpi ne, %3949, %3948 : i64
        %3951 = arith.cmpi eq, %3948, %3948 : i64
        %3952 = arith.andi %3950, %3951 : i1
        %3953 = scf.if %3952 -> (i64) {
          scf.yield %3947 : i64
        } else {
          scf.yield %3948 : i64
        }
        %3954 = arith.cmpi ne, %3953, %3948 : i64
        scf.if %3954 {
          func.call @stack_push_pointer(%3953) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3947) : (i64) -> ()
          %3955 = llvm.mlir.addressof @str391 : !llvm.ptr
          %3956 = func.call @cc_make_function_ref_const(%3955) : (!llvm.ptr) -> i64
          %3957 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3956, %3957) : (i64, i64) -> ()
        }
        %3958 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3958 : i64
      }
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %3959 = arith.addi %3936, %__rlasp_stack_elide_zero_298 : i64
      scf.yield %3959 : i64
    }
    func.call @stack_push_pointer(%3885) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645771"() {
    %4171 = func.call @cc_nil_value() : () -> i64
    %4172 = func.call @cc_nil_value() : () -> i64
    %4173 = func.call @cc_errorp(%4171) : (i64) -> i64
    %4174 = arith.cmpi ne, %4173, %4172 : i64
    %4175 = scf.if %4174 -> (i64) {
      scf.yield %4171 : i64
    } else {
      %4176 = func.call @cc_nil_value() : () -> i64
      %4177 = func.call @cc_nil_value() : () -> i64
      %4178 = func.call @cc_errorp(%4176) : (i64) -> i64
      %4179 = arith.cmpi ne, %4178, %4177 : i64
      %4180 = scf.if %4179 -> (i64) {
        scf.yield %4176 : i64
      } else {
        %4181 = llvm.mlir.addressof @str412 : !llvm.ptr
        %4182 = arith.constant 42 : i64
        %4183 = func.call @cc_make_string(%4181, %4182) : (!llvm.ptr, i64) -> i64
        %4184 = func.call @cc_nil_value() : () -> i64
        %4185 = func.call @cc_errorp(%4183) : (i64) -> i64
        %4186 = arith.cmpi ne, %4185, %4184 : i64
        %4187 = arith.cmpi eq, %4184, %4184 : i64
        %4188 = arith.andi %4186, %4187 : i1
        %4189 = scf.if %4188 -> (i64) {
          scf.yield %4183 : i64
        } else {
          scf.yield %4184 : i64
        }
        %4190 = arith.cmpi ne, %4189, %4184 : i64
        scf.if %4190 {
          func.call @stack_push_pointer(%4189) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4183) : (i64) -> ()
          %4191 = llvm.mlir.addressof @str413 : !llvm.ptr
          %4192 = func.call @cc_make_function_ref_const(%4191) : (!llvm.ptr) -> i64
          %4193 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4192, %4193) : (i64, i64) -> ()
        }
        %4194 = func.call @stack_pop_pointer() : () -> i64
        %4195 = llvm.mlir.addressof @str414 : !llvm.ptr
        %4196 = arith.constant 15 : i64
        %4197 = func.call @cc_make_string(%4195, %4196) : (!llvm.ptr, i64) -> i64
        %4198 = llvm.mlir.addressof @str415 : !llvm.ptr
        %4199 = arith.constant 7 : i64
        %4200 = func.call @cc_make_string(%4198, %4199) : (!llvm.ptr, i64) -> i64
        %4201 = func.call @cc_intern(%4197, %4200) : (i64, i64) -> i64
        %4202 = func.call @cc_nil_value() : () -> i64
        %4203 = func.call @cc_cons(%4201, %4202) : (i64, i64) -> i64
        %4204 = func.call @cc_values_pack(%4203) : (i64) -> i64
        %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
        %4205 = arith.addi %4201, %__rlasp_stack_elide_zero_299 : i64
        %4206 = llvm.mlir.addressof @str416 : !llvm.ptr
        %4207 = arith.constant 10 : i64
        %4208 = func.call @cc_make_string(%4206, %4207) : (!llvm.ptr, i64) -> i64
        %4209 = llvm.mlir.addressof @str417 : !llvm.ptr
        %4210 = arith.constant 7 : i64
        %4211 = func.call @cc_make_string(%4209, %4210) : (!llvm.ptr, i64) -> i64
        %4212 = func.call @cc_intern(%4208, %4211) : (i64, i64) -> i64
        %4213 = func.call @cc_nil_value() : () -> i64
        %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
        %4215 = func.call @cc_values_pack(%4214) : (i64) -> i64
        %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
        %4216 = arith.addi %4212, %__rlasp_stack_elide_zero_300 : i64
        %4217 = func.call @cc_nil_value() : () -> i64
        %4218 = func.call @cc_cons(%4216, %4217) : (i64, i64) -> i64
        %4219 = func.call @cc_cons(%4205, %4218) : (i64, i64) -> i64
        %4220 = func.call @cc_cons(%4194, %4219) : (i64, i64) -> i64
        %4221 = func.call @cc_load_stack(%4220) : (i64) -> i64
        %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
        %4222 = arith.addi %4221, %__rlasp_stack_elide_zero_301 : i64
        scf.yield %4222 : i64
      }
      %4223 = func.call @cc_nil_value() : () -> i64
      %4224 = func.call @cc_errorp(%4180) : (i64) -> i64
      %4225 = arith.cmpi ne, %4224, %4223 : i64
      %4226 = scf.if %4225 -> (i64) {
        scf.yield %4180 : i64
      } else {
        %4227 = llvm.mlir.addressof @str418 : !llvm.ptr
        %4228 = arith.constant 15 : i64
        %4229 = func.call @cc_make_string(%4227, %4228) : (!llvm.ptr, i64) -> i64
        %4230 = llvm.mlir.addressof @str419 : !llvm.ptr
        %4231 = arith.constant 9 : i64
        %4232 = func.call @cc_make_string(%4230, %4231) : (!llvm.ptr, i64) -> i64
        %4233 = func.call @cc_intern(%4229, %4232) : (i64, i64) -> i64
        %4234 = func.call @cc_nil_value() : () -> i64
        %4235 = func.call @cc_cons(%4233, %4234) : (i64, i64) -> i64
        %4236 = func.call @cc_values_pack(%4235) : (i64) -> i64
        %4237 = func.call @cc_symbol_value(%4233) : (i64) -> i64
        %4238 = func.call @cc_nil_value() : () -> i64
        %4239 = func.call @cc_errorp(%4237) : (i64) -> i64
        %4240 = arith.cmpi ne, %4239, %4238 : i64
        %4241 = arith.cmpi eq, %4238, %4238 : i64
        %4242 = arith.andi %4240, %4241 : i1
        %4243 = scf.if %4242 -> (i64) {
          scf.yield %4237 : i64
        } else {
          scf.yield %4238 : i64
        }
        %4244 = arith.cmpi ne, %4243, %4238 : i64
        scf.if %4244 {
          func.call @stack_push_pointer(%4243) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4237) : (i64) -> ()
          %4245 = llvm.mlir.addressof @str420 : !llvm.ptr
          %4246 = func.call @cc_make_function_ref_const(%4245) : (!llvm.ptr) -> i64
          %4247 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4246, %4247) : (i64, i64) -> ()
        }
        %4248 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4248 : i64
      }
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %4249 = arith.addi %4226, %__rlasp_stack_elide_zero_302 : i64
      scf.yield %4249 : i64
    }
    func.call @stack_push_pointer(%4175) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645772"() {
    %4578 = func.call @cc_nil_value() : () -> i64
    %4579 = func.call @cc_nil_value() : () -> i64
    %4580 = func.call @cc_errorp(%4578) : (i64) -> i64
    %4581 = arith.cmpi ne, %4580, %4579 : i64
    %4582 = scf.if %4581 -> (i64) {
      scf.yield %4578 : i64
    } else {
      %4583 = func.call @cc_nil_value() : () -> i64
      %4584 = func.call @cc_nil_value() : () -> i64
      %4585 = func.call @cc_errorp(%4583) : (i64) -> i64
      %4586 = arith.cmpi ne, %4585, %4584 : i64
      %4587 = scf.if %4586 -> (i64) {
        scf.yield %4583 : i64
      } else {
        %4588 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4588) : (i64) -> ()
        %4589 = llvm.mlir.addressof @str457 : !llvm.ptr
        %4590 = arith.constant 6 : i64
        %4591 = func.call @cc_make_string(%4589, %4590) : (!llvm.ptr, i64) -> i64
        %4592 = llvm.mlir.addressof @str458 : !llvm.ptr
        %4593 = arith.constant 7 : i64
        %4594 = func.call @cc_make_string(%4592, %4593) : (!llvm.ptr, i64) -> i64
        %4595 = func.call @cc_intern(%4591, %4594) : (i64, i64) -> i64
        %4596 = func.call @cc_nil_value() : () -> i64
        %4597 = func.call @cc_cons(%4595, %4596) : (i64, i64) -> i64
        %4598 = func.call @cc_values_pack(%4597) : (i64) -> i64
        %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
        %4599 = arith.addi %4595, %__rlasp_stack_elide_zero_303 : i64
        %4600 = func.call @stack_pop_pointer() : () -> i64
        %4601 = func.call @cc_cons(%4599, %4600) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4601) : (i64) -> ()
        %4602 = llvm.mlir.addressof @str459 : !llvm.ptr
        %4603 = arith.constant 9 : i64
        %4604 = func.call @cc_make_string(%4602, %4603) : (!llvm.ptr, i64) -> i64
        %4605 = llvm.mlir.addressof @str460 : !llvm.ptr
        %4606 = arith.constant 7 : i64
        %4607 = func.call @cc_make_string(%4605, %4606) : (!llvm.ptr, i64) -> i64
        %4608 = func.call @cc_intern(%4604, %4607) : (i64, i64) -> i64
        %4609 = func.call @cc_nil_value() : () -> i64
        %4610 = func.call @cc_cons(%4608, %4609) : (i64, i64) -> i64
        %4611 = func.call @cc_values_pack(%4610) : (i64) -> i64
        %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
        %4612 = arith.addi %4608, %__rlasp_stack_elide_zero_304 : i64
        %4613 = func.call @stack_pop_pointer() : () -> i64
        %4614 = func.call @cc_cons(%4612, %4613) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4614) : (i64) -> ()
        %4615 = llvm.mlir.addressof @str461 : !llvm.ptr
        %4616 = arith.constant 10 : i64
        %4617 = func.call @cc_make_string(%4615, %4616) : (!llvm.ptr, i64) -> i64
        %4618 = llvm.mlir.addressof @str462 : !llvm.ptr
        %4619 = arith.constant 7 : i64
        %4620 = func.call @cc_make_string(%4618, %4619) : (!llvm.ptr, i64) -> i64
        %4621 = func.call @cc_intern(%4617, %4620) : (i64, i64) -> i64
        %4622 = func.call @cc_nil_value() : () -> i64
        %4623 = func.call @cc_cons(%4621, %4622) : (i64, i64) -> i64
        %4624 = func.call @cc_values_pack(%4623) : (i64) -> i64
        %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
        %4625 = arith.addi %4621, %__rlasp_stack_elide_zero_305 : i64
        %4626 = func.call @stack_pop_pointer() : () -> i64
        %4627 = func.call @cc_cons(%4625, %4626) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4627) : (i64) -> ()
        %4628 = llvm.mlir.addressof @str463 : !llvm.ptr
        %4629 = arith.constant 15 : i64
        %4630 = func.call @cc_make_string(%4628, %4629) : (!llvm.ptr, i64) -> i64
        %4631 = llvm.mlir.addressof @str464 : !llvm.ptr
        %4632 = arith.constant 7 : i64
        %4633 = func.call @cc_make_string(%4631, %4632) : (!llvm.ptr, i64) -> i64
        %4634 = func.call @cc_intern(%4630, %4633) : (i64, i64) -> i64
        %4635 = func.call @cc_nil_value() : () -> i64
        %4636 = func.call @cc_cons(%4634, %4635) : (i64, i64) -> i64
        %4637 = func.call @cc_values_pack(%4636) : (i64) -> i64
        %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
        %4638 = arith.addi %4634, %__rlasp_stack_elide_zero_306 : i64
        %4639 = func.call @stack_pop_pointer() : () -> i64
        %4640 = func.call @cc_cons(%4638, %4639) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4640) : (i64) -> ()
        %4641 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4641) : (i64) -> ()
        %4642 = llvm.mlir.addressof @str465 : !llvm.ptr
        %4643 = arith.constant 47 : i64
        %4644 = func.call @cc_make_string(%4642, %4643) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
        %4645 = arith.addi %4644, %__rlasp_stack_elide_zero_307 : i64
        %4646 = func.call @stack_pop_pointer() : () -> i64
        %4647 = func.call @cc_cons(%4645, %4646) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4647) : (i64) -> ()
        %4648 = llvm.mlir.addressof @str466 : !llvm.ptr
        %4649 = arith.constant 8 : i64
        %4650 = func.call @cc_make_string(%4648, %4649) : (!llvm.ptr, i64) -> i64
        %4651 = llvm.mlir.addressof @str467 : !llvm.ptr
        %4652 = arith.constant 11 : i64
        %4653 = func.call @cc_make_string(%4651, %4652) : (!llvm.ptr, i64) -> i64
        %4654 = func.call @cc_intern(%4650, %4653) : (i64, i64) -> i64
        %4655 = func.call @cc_nil_value() : () -> i64
        %4656 = func.call @cc_cons(%4654, %4655) : (i64, i64) -> i64
        %4657 = func.call @cc_values_pack(%4656) : (i64) -> i64
        %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
        %4658 = arith.addi %4654, %__rlasp_stack_elide_zero_308 : i64
        %4659 = func.call @stack_pop_pointer() : () -> i64
        %4660 = func.call @cc_cons(%4658, %4659) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
        %4661 = arith.addi %4660, %__rlasp_stack_elide_zero_309 : i64
        %4662 = func.call @stack_pop_pointer() : () -> i64
        %4663 = func.call @cc_cons(%4661, %4662) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4663) : (i64) -> ()
        %4664 = llvm.mlir.addressof @str468 : !llvm.ptr
        %4665 = arith.constant 12 : i64
        %4666 = func.call @cc_make_string(%4664, %4665) : (!llvm.ptr, i64) -> i64
        %4667 = func.call @cc_nil_value() : () -> i64
        %4668 = func.call @cc_intern(%4666, %4667) : (i64, i64) -> i64
        %4669 = func.call @cc_nil_value() : () -> i64
        %4670 = func.call @cc_cons(%4668, %4669) : (i64, i64) -> i64
        %4671 = func.call @cc_values_pack(%4670) : (i64) -> i64
        %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
        %4672 = arith.addi %4668, %__rlasp_stack_elide_zero_310 : i64
        %4673 = func.call @stack_pop_pointer() : () -> i64
        %4674 = func.call @cc_cons(%4672, %4673) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
        %4675 = arith.addi %4674, %__rlasp_stack_elide_zero_311 : i64
        %4676 = func.call @cc_nil_value() : () -> i64
        %4677 = func.call @cc_cons(%4675, %4676) : (i64, i64) -> i64
        %4678 = func.call @cc_eval(%4677) : (i64) -> i64
        %4679 = func.call @cc_multiple_value_list(%4678) : (i64) -> i64
        %4680 = func.call @cc_values_pack(%4679) : (i64) -> i64
        %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
        %4681 = arith.addi %4680, %__rlasp_stack_elide_zero_312 : i64
        scf.yield %4681 : i64
      }
      %4682 = func.call @cc_nil_value() : () -> i64
      %4683 = func.call @cc_errorp(%4587) : (i64) -> i64
      %4684 = arith.cmpi ne, %4683, %4682 : i64
      %4685 = scf.if %4684 -> (i64) {
        scf.yield %4587 : i64
      } else {
        %4686 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4686) : (i64) -> ()
        %4687 = llvm.mlir.addressof @str469 : !llvm.ptr
        %4688 = arith.constant 8 : i64
        %4689 = func.call @cc_make_string(%4687, %4688) : (!llvm.ptr, i64) -> i64
        %4690 = llvm.mlir.addressof @str470 : !llvm.ptr
        %4691 = arith.constant 7 : i64
        %4692 = func.call @cc_make_string(%4690, %4691) : (!llvm.ptr, i64) -> i64
        %4693 = func.call @cc_intern(%4689, %4692) : (i64, i64) -> i64
        %4694 = func.call @cc_nil_value() : () -> i64
        %4695 = func.call @cc_cons(%4693, %4694) : (i64, i64) -> i64
        %4696 = func.call @cc_values_pack(%4695) : (i64) -> i64
        %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
        %4697 = arith.addi %4693, %__rlasp_stack_elide_zero_313 : i64
        %4698 = func.call @stack_pop_pointer() : () -> i64
        %4699 = func.call @cc_cons(%4697, %4698) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4699) : (i64) -> ()
        %4700 = llvm.mlir.addressof @str471 : !llvm.ptr
        %4701 = arith.constant 9 : i64
        %4702 = func.call @cc_make_string(%4700, %4701) : (!llvm.ptr, i64) -> i64
        %4703 = llvm.mlir.addressof @str472 : !llvm.ptr
        %4704 = arith.constant 7 : i64
        %4705 = func.call @cc_make_string(%4703, %4704) : (!llvm.ptr, i64) -> i64
        %4706 = func.call @cc_intern(%4702, %4705) : (i64, i64) -> i64
        %4707 = func.call @cc_nil_value() : () -> i64
        %4708 = func.call @cc_cons(%4706, %4707) : (i64, i64) -> i64
        %4709 = func.call @cc_values_pack(%4708) : (i64) -> i64
        %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
        %4710 = arith.addi %4706, %__rlasp_stack_elide_zero_314 : i64
        %4711 = func.call @stack_pop_pointer() : () -> i64
        %4712 = func.call @cc_cons(%4710, %4711) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4712) : (i64) -> ()
        %4713 = llvm.mlir.addressof @str473 : !llvm.ptr
        %4714 = arith.constant 10 : i64
        %4715 = func.call @cc_make_string(%4713, %4714) : (!llvm.ptr, i64) -> i64
        %4716 = llvm.mlir.addressof @str474 : !llvm.ptr
        %4717 = arith.constant 7 : i64
        %4718 = func.call @cc_make_string(%4716, %4717) : (!llvm.ptr, i64) -> i64
        %4719 = func.call @cc_intern(%4715, %4718) : (i64, i64) -> i64
        %4720 = func.call @cc_nil_value() : () -> i64
        %4721 = func.call @cc_cons(%4719, %4720) : (i64, i64) -> i64
        %4722 = func.call @cc_values_pack(%4721) : (i64) -> i64
        %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
        %4723 = arith.addi %4719, %__rlasp_stack_elide_zero_315 : i64
        %4724 = func.call @stack_pop_pointer() : () -> i64
        %4725 = func.call @cc_cons(%4723, %4724) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4725) : (i64) -> ()
        %4726 = llvm.mlir.addressof @str475 : !llvm.ptr
        %4727 = arith.constant 15 : i64
        %4728 = func.call @cc_make_string(%4726, %4727) : (!llvm.ptr, i64) -> i64
        %4729 = llvm.mlir.addressof @str476 : !llvm.ptr
        %4730 = arith.constant 7 : i64
        %4731 = func.call @cc_make_string(%4729, %4730) : (!llvm.ptr, i64) -> i64
        %4732 = func.call @cc_intern(%4728, %4731) : (i64, i64) -> i64
        %4733 = func.call @cc_nil_value() : () -> i64
        %4734 = func.call @cc_cons(%4732, %4733) : (i64, i64) -> i64
        %4735 = func.call @cc_values_pack(%4734) : (i64) -> i64
        %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
        %4736 = arith.addi %4732, %__rlasp_stack_elide_zero_316 : i64
        %4737 = func.call @stack_pop_pointer() : () -> i64
        %4738 = func.call @cc_cons(%4736, %4737) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4738) : (i64) -> ()
        %4739 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4739) : (i64) -> ()
        %4740 = llvm.mlir.addressof @str477 : !llvm.ptr
        %4741 = arith.constant 47 : i64
        %4742 = func.call @cc_make_string(%4740, %4741) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
        %4743 = arith.addi %4742, %__rlasp_stack_elide_zero_317 : i64
        %4744 = func.call @stack_pop_pointer() : () -> i64
        %4745 = func.call @cc_cons(%4743, %4744) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4745) : (i64) -> ()
        %4746 = llvm.mlir.addressof @str478 : !llvm.ptr
        %4747 = arith.constant 8 : i64
        %4748 = func.call @cc_make_string(%4746, %4747) : (!llvm.ptr, i64) -> i64
        %4749 = llvm.mlir.addressof @str479 : !llvm.ptr
        %4750 = arith.constant 11 : i64
        %4751 = func.call @cc_make_string(%4749, %4750) : (!llvm.ptr, i64) -> i64
        %4752 = func.call @cc_intern(%4748, %4751) : (i64, i64) -> i64
        %4753 = func.call @cc_nil_value() : () -> i64
        %4754 = func.call @cc_cons(%4752, %4753) : (i64, i64) -> i64
        %4755 = func.call @cc_values_pack(%4754) : (i64) -> i64
        %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
        %4756 = arith.addi %4752, %__rlasp_stack_elide_zero_318 : i64
        %4757 = func.call @stack_pop_pointer() : () -> i64
        %4758 = func.call @cc_cons(%4756, %4757) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
        %4759 = arith.addi %4758, %__rlasp_stack_elide_zero_319 : i64
        %4760 = func.call @stack_pop_pointer() : () -> i64
        %4761 = func.call @cc_cons(%4759, %4760) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4761) : (i64) -> ()
        %4762 = llvm.mlir.addressof @str480 : !llvm.ptr
        %4763 = arith.constant 12 : i64
        %4764 = func.call @cc_make_string(%4762, %4763) : (!llvm.ptr, i64) -> i64
        %4765 = func.call @cc_nil_value() : () -> i64
        %4766 = func.call @cc_intern(%4764, %4765) : (i64, i64) -> i64
        %4767 = func.call @cc_nil_value() : () -> i64
        %4768 = func.call @cc_cons(%4766, %4767) : (i64, i64) -> i64
        %4769 = func.call @cc_values_pack(%4768) : (i64) -> i64
        %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
        %4770 = arith.addi %4766, %__rlasp_stack_elide_zero_320 : i64
        %4771 = func.call @stack_pop_pointer() : () -> i64
        %4772 = func.call @cc_cons(%4770, %4771) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
        %4773 = arith.addi %4772, %__rlasp_stack_elide_zero_321 : i64
        %4774 = func.call @cc_nil_value() : () -> i64
        %4775 = func.call @cc_cons(%4773, %4774) : (i64, i64) -> i64
        %4776 = func.call @cc_eval(%4775) : (i64) -> i64
        %4777 = func.call @cc_multiple_value_list(%4776) : (i64) -> i64
        %4778 = func.call @cc_values_pack(%4777) : (i64) -> i64
        %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
        %4779 = arith.addi %4778, %__rlasp_stack_elide_zero_322 : i64
        scf.yield %4779 : i64
      }
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %4780 = arith.addi %4685, %__rlasp_stack_elide_zero_323 : i64
      %4781 = func.call @cc_nil_value() : () -> i64
      %4782 = func.call @cc_cons(%4780, %4781) : (i64, i64) -> i64
      %4783 = func.call @cc_not(%4782) : (i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %4784 = arith.addi %4783, %__rlasp_stack_elide_zero_324 : i64
      %4785 = func.call @cc_nil_value() : () -> i64
      %4786 = func.call @cc_cons(%4784, %4785) : (i64, i64) -> i64
      %4787 = func.call @cc_not(%4786) : (i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %4788 = arith.addi %4787, %__rlasp_stack_elide_zero_325 : i64
      scf.yield %4788 : i64
    }
    func.call @stack_push_pointer(%4582) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645773"() {
    %5003 = func.call @cc_nil_value() : () -> i64
    %5004 = func.call @cc_nil_value() : () -> i64
    %5005 = func.call @cc_errorp(%5003) : (i64) -> i64
    %5006 = arith.cmpi ne, %5005, %5004 : i64
    %5007 = scf.if %5006 -> (i64) {
      scf.yield %5003 : i64
    } else {
      %5008 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5009 = func.call @cc_nil_value() : () -> i64
      %5010 = func.call @cc_nil_value() : () -> i64
      %5011 = func.call @cc_errorp(%5009) : (i64) -> i64
      %5012 = arith.cmpi ne, %5011, %5010 : i64
      %5013 = scf.if %5012 -> (i64) {
        scf.yield %5009 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5014 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5014) : (i64) -> ()
        %5015 = llvm.mlir.addressof @str502 : !llvm.ptr
        %5016 = arith.constant 8 : i64
        %5017 = func.call @cc_make_string(%5015, %5016) : (!llvm.ptr, i64) -> i64
        %5018 = llvm.mlir.addressof @str503 : !llvm.ptr
        %5019 = arith.constant 7 : i64
        %5020 = func.call @cc_make_string(%5018, %5019) : (!llvm.ptr, i64) -> i64
        %5021 = func.call @cc_intern(%5017, %5020) : (i64, i64) -> i64
        %5022 = func.call @cc_nil_value() : () -> i64
        %5023 = func.call @cc_cons(%5021, %5022) : (i64, i64) -> i64
        %5024 = func.call @cc_values_pack(%5023) : (i64) -> i64
        %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
        %5025 = arith.addi %5021, %__rlasp_stack_elide_zero_326 : i64
        %5026 = func.call @stack_pop_pointer() : () -> i64
        %5027 = func.call @cc_cons(%5025, %5026) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5027) : (i64) -> ()
        %5028 = llvm.mlir.addressof @str504 : !llvm.ptr
        %5029 = arith.constant 15 : i64
        %5030 = func.call @cc_make_string(%5028, %5029) : (!llvm.ptr, i64) -> i64
        %5031 = llvm.mlir.addressof @str505 : !llvm.ptr
        %5032 = arith.constant 7 : i64
        %5033 = func.call @cc_make_string(%5031, %5032) : (!llvm.ptr, i64) -> i64
        %5034 = func.call @cc_intern(%5030, %5033) : (i64, i64) -> i64
        %5035 = func.call @cc_nil_value() : () -> i64
        %5036 = func.call @cc_cons(%5034, %5035) : (i64, i64) -> i64
        %5037 = func.call @cc_values_pack(%5036) : (i64) -> i64
        %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
        %5038 = arith.addi %5034, %__rlasp_stack_elide_zero_327 : i64
        %5039 = func.call @stack_pop_pointer() : () -> i64
        %5040 = func.call @cc_cons(%5038, %5039) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5040) : (i64) -> ()
        %5041 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5041) : (i64) -> ()
        %5042 = llvm.mlir.addressof @str506 : !llvm.ptr
        %5043 = arith.constant 47 : i64
        %5044 = func.call @cc_make_string(%5042, %5043) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
        %5045 = arith.addi %5044, %__rlasp_stack_elide_zero_328 : i64
        %5046 = func.call @stack_pop_pointer() : () -> i64
        %5047 = func.call @cc_cons(%5045, %5046) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5047) : (i64) -> ()
        %5048 = llvm.mlir.addressof @str507 : !llvm.ptr
        %5049 = arith.constant 8 : i64
        %5050 = func.call @cc_make_string(%5048, %5049) : (!llvm.ptr, i64) -> i64
        %5051 = llvm.mlir.addressof @str508 : !llvm.ptr
        %5052 = arith.constant 11 : i64
        %5053 = func.call @cc_make_string(%5051, %5052) : (!llvm.ptr, i64) -> i64
        %5054 = func.call @cc_intern(%5050, %5053) : (i64, i64) -> i64
        %5055 = func.call @cc_nil_value() : () -> i64
        %5056 = func.call @cc_cons(%5054, %5055) : (i64, i64) -> i64
        %5057 = func.call @cc_values_pack(%5056) : (i64) -> i64
        %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
        %5058 = arith.addi %5054, %__rlasp_stack_elide_zero_329 : i64
        %5059 = func.call @stack_pop_pointer() : () -> i64
        %5060 = func.call @cc_cons(%5058, %5059) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
        %5061 = arith.addi %5060, %__rlasp_stack_elide_zero_330 : i64
        %5062 = func.call @stack_pop_pointer() : () -> i64
        %5063 = func.call @cc_cons(%5061, %5062) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5063) : (i64) -> ()
        %5064 = llvm.mlir.addressof @str509 : !llvm.ptr
        %5065 = arith.constant 12 : i64
        %5066 = func.call @cc_make_string(%5064, %5065) : (!llvm.ptr, i64) -> i64
        %5067 = func.call @cc_nil_value() : () -> i64
        %5068 = func.call @cc_intern(%5066, %5067) : (i64, i64) -> i64
        %5069 = func.call @cc_nil_value() : () -> i64
        %5070 = func.call @cc_cons(%5068, %5069) : (i64, i64) -> i64
        %5071 = func.call @cc_values_pack(%5070) : (i64) -> i64
        %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
        %5072 = arith.addi %5068, %__rlasp_stack_elide_zero_331 : i64
        %5073 = func.call @stack_pop_pointer() : () -> i64
        %5074 = func.call @cc_cons(%5072, %5073) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
        %5075 = arith.addi %5074, %__rlasp_stack_elide_zero_332 : i64
        %5076 = func.call @cc_nil_value() : () -> i64
        %5077 = func.call @cc_cons(%5075, %5076) : (i64, i64) -> i64
        %5078 = func.call @cc_eval(%5077) : (i64) -> i64
        %5079 = func.call @cc_multiple_value_list(%5078) : (i64) -> i64
        %5080 = func.call @cc_values_pack(%5079) : (i64) -> i64
        %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
        %5081 = arith.addi %5080, %__rlasp_stack_elide_zero_333 : i64
        %5082 = func.call @cc_errorp(%5081) : (i64) -> i64
        %5083 = func.call @cc_nil_value() : () -> i64
        %5084 = arith.cmpi ne, %5082, %5083 : i64
        scf.if %5084 {
          func.call @stack_push_pointer(%5081) : (i64) -> ()
        } else {
          %5085 = func.call @cc_multiple_value_list(%5081) : (i64) -> i64
          func.call @stack_push_pointer(%5085) : (i64) -> ()
        }
        %5086 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5087 = func.call @stack_pop_pointer() : () -> i64
        %5088 = func.call @cc_nil_value() : () -> i64
        %5089 = func.call @cc_maybe_error_from_multiple_value_list(%5086) : (i64) -> i64
        %5090 = func.call @cc_errorp(%5089) : (i64) -> i64
        %5091 = arith.cmpi ne, %5090, %5088 : i64
        %5092 = arith.cmpi eq, %5088, %5088 : i64
        %5093 = arith.andi %5091, %5092 : i1
        %5094 = scf.if %5093 -> (i64) {
          scf.yield %5089 : i64
        } else {
          scf.yield %5088 : i64
        }
        %5095 = arith.cmpi ne, %5094, %5088 : i64
        scf.if %5095 {
          func.call @stack_push_pointer(%5094) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5096 = func.call @stack_pop_pointer() : () -> i64
          %5097 = func.call @cc_cons(%5087, %5096) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
          %5098 = arith.addi %5097, %__rlasp_stack_elide_zero_334 : i64
          %5099 = func.call @cc_cons(%5086, %5098) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
          %5100 = arith.addi %5099, %__rlasp_stack_elide_zero_335 : i64
          %5101 = func.call @cc_values_pack(%5100) : (i64) -> i64
          func.call @stack_push_pointer(%5101) : (i64) -> ()
        }
        %5102 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5102 : i64
      }
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %5103 = arith.addi %5013, %__rlasp_stack_elide_zero_336 : i64
      %5104 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5105 = func.call @cc_errorp(%5103) : (i64) -> i64
      %5106 = func.call @cc_nil_value() : () -> i64
      %5107 = arith.cmpi ne, %5105, %5106 : i64
      scf.if %5107 {
        %5108 = func.call @cc_condition_value(%5103) : (i64) -> i64
        %5109 = func.call @cc_values2(%5106, %5108) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5109) : (i64) -> ()
      } else {
        %5110 = func.call @cc_multiple_value_list(%5103) : (i64) -> i64
        %5111 = func.call @cc_values_pack(%5110) : (i64) -> i64
        func.call @stack_push_pointer(%5111) : (i64) -> ()
      }
      %5112 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5112 : i64
    }
    func.call @stack_push_pointer(%5007) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1("s\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_57937766645760*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_57937766645760*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_57937766645760*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_57937766645761*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_57937766645761*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_57937766645761*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_57937766645760*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETFLAG_57937766645761*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_57937766645761*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_57937766645761*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_57937766645761*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_57937766645760*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETMVLIST_57937766645760*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str15("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETFLAG_57937766645762*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETVALUE_57937766645762*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_57937766645762*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str19("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str23("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str24("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str26("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str29("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str32("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str37("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str38("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str39("ENCODING-DEFAULT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str40("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str41("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str46("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str47("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str48("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str49("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str50("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str51("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str52("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str53("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str54("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str57("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str58("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str60("ENCODING-UTF-8\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str61("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str67("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str68("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("UTF-8\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str72("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str73("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str74("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str75("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str76("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str77("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("UTF-8\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str81("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str82("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str83("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str85("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str86("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str87("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str88("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str89("ENCODING-LATIN-1\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str90("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str91("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str96("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str97("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str98("LATIN-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str100("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str101("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str102("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str103("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str104("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str105("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("LATIN-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str108("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str110("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str111("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str112("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str118("ENCODING-ISO-8859-1\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str119("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str120("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str125("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str126("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str127("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str128("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str129("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str130("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str131("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str132("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str133("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str134("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str135("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str136("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str137("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str138("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str139("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str140("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str141("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str143("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str144("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str145("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str146("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str147("ENCODING-ASCII-ERROR\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str148("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str149("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str151("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str152("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str155("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str156("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str157("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str158("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str159("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str162("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str163("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str164("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str165("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str166("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str167("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str168("STREAM-DECODING-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str169("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str170("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str172("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str173("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str174("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str175("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str176("ENCODING-ALL-ENCODINGS-PLAIN\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str177("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str178("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str179("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str182("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str183("sys:src;lisp;regression-tests;encoding-test.txt\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str184("BAD\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str185("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str186("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str188("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str189("ALL-ENCODINGS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str190("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str191("BAD\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str192("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str193("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str195("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str197("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str198("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str199("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str200("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str201("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str202("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str203("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str204("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str205("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str206("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str207("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str208("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str209("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str210("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str211("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str212("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str213("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str214("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str223("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str224("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str225("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str226("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str228("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str229("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str230("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str231("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str234("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str235("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str238("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str239("MEMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str240("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str242("UCS-2\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str243("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str244("UCS-4\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str245("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str246("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str247("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str248("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str249("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str250("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str251("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str252("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str257("PUSH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str258("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str259("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str264("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str265("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str266("BAD\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str267("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str268("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str269("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str271("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str272("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str275("sys:src;lisp;regression-tests;encoding-test.txt\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str276("ext:all-encodings\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str277("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str278("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str279("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str280("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str281("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str282("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str283("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str284("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str285("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str288("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str289("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str290("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str292("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str293("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str294("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str295("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str296("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str297("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str298("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str299("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str300("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str301("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str302("UCS-2\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str303("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str304("UCS-4\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str305("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str306("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str307("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str308("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str310("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str311("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str312("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str313("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str314("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str315("ENCODING-LATIN-2-PLAIN\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str316("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str317("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str318("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str319("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("sys:src;lisp;regression-tests;latin-2-file.txt\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str321("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str322("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str323("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str324("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str325("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str326("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str327("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str328("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str329("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str330("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str331("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str332("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str333("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str334("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str335("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str336("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str337("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str338("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str339("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str340("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str341("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str342("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str343("sys:src;lisp;regression-tests;latin-2-file.txt\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str344("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str345("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str346("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str347("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str348("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str349("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str350("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str351("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str352("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str353("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str354("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str355("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str357("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str358("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str359("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str360("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str361("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str362("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str363("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str364("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str365("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str366("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str367("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str368("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str369("ENCODING-LATIN-2-LAMBDA\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str370("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str371("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str372("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str373("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str374("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str375("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str376("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str377("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str378("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str379("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str380("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str381("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str382("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str383("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str384("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str385("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str386("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str387("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str388("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str389("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str390("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str391("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str392("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str393("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str394("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str395("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str396("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str397("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str398("ENCODING-ISO-8859-2-LAMBDA\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str399("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str400("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str401("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str402("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str403("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str404("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str405("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str406("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str407("ISO-8859-2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str408("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str409("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str410("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str411("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str412("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str413("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str414("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str415("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str416("ISO-8859-2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str417("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str418("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str419("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str420("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str421("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str422("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str423("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str424("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str425("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str426("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str427("COMPILE-FILE-WITH-LAMBDA\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str428("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str429("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str430("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str431("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str432("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str433("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str434("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str436("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str437("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str438("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str439("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str440("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str441("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str442("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str443("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str444("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str445("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str446("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str447("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str448("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str449("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str450("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str451("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str452("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str453("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str454("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str455("PARALLEL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str456("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str457("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str458("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str459("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str460("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str461("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str462("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str463("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str464("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str465("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str466("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str467("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str469("PARALLEL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str470("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str471("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str472("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str473("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str474("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str475("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str476("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str477("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str478("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str479("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str480("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str481("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str482("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str483("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str484("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str485("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str486("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str487("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str488("COMPILE-FILE-WITH-LAMBDA-DEFAULT-ENCODING\00") : !llvm.array<42 x i8>
  llvm.mlir.global private constant @str489("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str490("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str491("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str492("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str493("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str494("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str495("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str496("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str497("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str498("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str499("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str500("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str501("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str502("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str503("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str504("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str505("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str506("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str507("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str508("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str509("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str510("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str511("STREAM-DECODING-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str512("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str513("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str514("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str515("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str516("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str517("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str518("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str519("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str520("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str521("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str522("delete-package\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str523("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str524("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str525("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str526("delete-package\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str527("*__MLIR_BLOCK_RETFLAG_57937766645762*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str528("*__MLIR_BLOCK_RETMVLIST_57937766645762*\00") : !llvm.array<40 x i8>
}
