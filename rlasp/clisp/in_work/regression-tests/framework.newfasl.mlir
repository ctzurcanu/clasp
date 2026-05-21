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
  func.func @"%FN%CLASP-TESTS::MESSAGE"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 7 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = llvm.mlir.addressof @str1 : !llvm.ptr
    %4 = arith.constant 11 : i64
    %5 = func.call @cc_make_string(%3, %4) : (!llvm.ptr, i64) -> i64
    %6 = func.call @cc_intern(%2, %5) : (i64, i64) -> i64
    %7 = func.call @cc_nil_value() : () -> i64
    %8 = func.call @cc_cons(%6, %7) : (i64, i64) -> i64
    %9 = func.call @cc_values_pack(%8) : (i64) -> i64
    %10 = llvm.mlir.addressof @str2 : !llvm.ptr
    %11 = arith.constant 25 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    %13 = func.call @cc_register_function_lambda_list_metadata_raw(%6, %12) : (i64, i64) -> i64
    %14 = func.call @stack_pop_pointer() : () -> i64
    %15 = arith.constant 0 : i64
    %16 = func.call @cc_arg(%14, %15) : (i64, i64) -> i64
    %17 = arith.constant 4 : i64
    %18 = func.call @cc_arg(%14, %17) : (i64, i64) -> i64
    %19 = arith.constant 2 : i64
    %20 = func.call @cc_box_fixnum(%19) : (i64) -> i64
    %21 = func.call @cc_collect_rest_args(%14, %20) : (i64, i64) -> i64
    %22 = func.call @cc_nil_value() : () -> i64
    %23 = llvm.mlir.addressof @str3 : !llvm.ptr
    %24 = arith.constant 37 : i64
    %25 = func.call @cc_make_string(%23, %24) : (!llvm.ptr, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_intern(%25, %26) : (i64, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_cons(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_values_pack(%29) : (i64) -> i64
    %31 = func.call @cc_set_symbol_value(%27, %22) : (i64, i64) -> i64
    %32 = llvm.mlir.addressof @str4 : !llvm.ptr
    %33 = arith.constant 38 : i64
    %34 = func.call @cc_make_string(%32, %33) : (!llvm.ptr, i64) -> i64
    %35 = func.call @cc_nil_value() : () -> i64
    %36 = func.call @cc_intern(%34, %35) : (i64, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_cons(%36, %37) : (i64, i64) -> i64
    %39 = func.call @cc_values_pack(%38) : (i64) -> i64
    %40 = func.call @cc_set_symbol_value(%36, %22) : (i64, i64) -> i64
    %41 = llvm.mlir.addressof @str5 : !llvm.ptr
    %42 = arith.constant 39 : i64
    %43 = func.call @cc_make_string(%41, %42) : (!llvm.ptr, i64) -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_intern(%43, %44) : (i64, i64) -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_cons(%45, %46) : (i64, i64) -> i64
    %48 = func.call @cc_values_pack(%47) : (i64) -> i64
    %49 = func.call @cc_set_symbol_value(%45, %22) : (i64, i64) -> i64
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_nil_value() : () -> i64
    %52 = func.call @cc_errorp(%50) : (i64) -> i64
    %53 = arith.cmpi ne, %52, %51 : i64
    %54 = scf.if %53 -> (i64) {
      scf.yield %50 : i64
    } else {
      %55 = llvm.mlir.addressof @str6 : !llvm.ptr
      %56 = arith.constant 97 : i64
      %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %58 = arith.addi %57, %__rlasp_stack_elide_zero_0 : i64
      scf.yield %58 : i64
    }
    %59 = func.call @cc_nil_value() : () -> i64
    %60 = func.call @cc_errorp(%54) : (i64) -> i64
    %61 = arith.cmpi ne, %60, %59 : i64
    %62 = scf.if %61 -> (i64) {
      scf.yield %54 : i64
    } else {
      %63 = llvm.mlir.addressof @str7 : !llvm.ptr
      %64 = arith.constant 17 : i64
      %65 = func.call @cc_make_string(%63, %64) : (!llvm.ptr, i64) -> i64
      %66 = llvm.mlir.addressof @str8 : !llvm.ptr
      %67 = arith.constant 11 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = func.call @cc_intern(%65, %68) : (i64, i64) -> i64
      %70 = func.call @cc_nil_value() : () -> i64
      %71 = func.call @cc_cons(%69, %70) : (i64, i64) -> i64
      %72 = func.call @cc_values_pack(%71) : (i64) -> i64
      %73 = func.call @cc_symbol_value(%69) : (i64) -> i64
      %74 = func.call @cc_nil_value() : () -> i64
      %75 = func.call @cc_errorp(%73) : (i64) -> i64
      %76 = arith.cmpi ne, %75, %74 : i64
      %77 = arith.cmpi eq, %74, %74 : i64
      %78 = arith.andi %76, %77 : i1
      %79 = scf.if %78 -> (i64) {
        scf.yield %73 : i64
      } else {
        scf.yield %74 : i64
      }
      %80 = arith.cmpi ne, %79, %74 : i64
      scf.if %80 {
        func.call @stack_push_pointer(%79) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%73) : (i64) -> ()
        %81 = llvm.mlir.addressof @str9 : !llvm.ptr
        %82 = func.call @cc_make_function_ref_const(%81) : (!llvm.ptr) -> i64
        %83 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%82, %83) : (i64, i64) -> ()
      }
      %84 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %84 : i64
    }
    %85 = func.call @cc_nil_value() : () -> i64
    %86 = func.call @cc_errorp(%62) : (i64) -> i64
    %87 = arith.cmpi ne, %86, %85 : i64
    %88 = scf.if %87 -> (i64) {
      scf.yield %62 : i64
    } else {
      %89 = llvm.mlir.addressof @str10 : !llvm.ptr
      %90 = arith.constant 17 : i64
      %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
      %92 = llvm.mlir.addressof @str11 : !llvm.ptr
      %93 = arith.constant 11 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = func.call @cc_intern(%91, %94) : (i64, i64) -> i64
      %96 = func.call @cc_nil_value() : () -> i64
      %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
      %98 = func.call @cc_values_pack(%97) : (i64) -> i64
      %99 = func.call @cc_symbol_value(%95) : (i64) -> i64
      %100 = func.call @cc_nil_value() : () -> i64
      %101 = func.call @cc_errorp(%99) : (i64) -> i64
      %102 = arith.cmpi ne, %101, %100 : i64
      %103 = arith.cmpi eq, %100, %100 : i64
      %104 = arith.andi %102, %103 : i1
      %105 = scf.if %104 -> (i64) {
        scf.yield %99 : i64
      } else {
        scf.yield %100 : i64
      }
      %106 = arith.cmpi ne, %105, %100 : i64
      scf.if %106 {
        func.call @stack_push_pointer(%105) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%99) : (i64) -> ()
        %107 = llvm.mlir.addressof @str12 : !llvm.ptr
        %108 = func.call @cc_make_function_ref_const(%107) : (!llvm.ptr) -> i64
        %109 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%108, %109) : (i64, i64) -> ()
      }
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @cc_nil_value() : () -> i64
      %112 = arith.cmpi ne, %110, %111 : i64
      scf.if %112 {
        %113 = func.call @cc_nil_value() : () -> i64
        %114 = func.call @cc_nil_value() : () -> i64
        %115 = func.call @cc_errorp(%113) : (i64) -> i64
        %116 = arith.cmpi ne, %115, %114 : i64
        %117 = scf.if %116 -> (i64) {
          scf.yield %113 : i64
        } else {
          %118 = func.call @cc_t_value() : () -> i64
          %119 = llvm.mlir.addressof @str13 : !llvm.ptr
          %120 = arith.constant 6 : i64
          %121 = func.call @cc_make_string(%119, %120) : (!llvm.ptr, i64) -> i64
          %122 = arith.constant 27 : i64
          %123 = func.call @cc_box_character(%122) : (i64) -> i64
          %124 = func.call @cc_nil_value() : () -> i64
          %125 = func.call @cc_nil_value() : () -> i64
          %126 = func.call @cc_errorp(%124) : (i64) -> i64
          %127 = arith.cmpi ne, %126, %125 : i64
          %128 = scf.if %127 -> (i64) {
            scf.yield %124 : i64
          } else {
            func.call @stack_push_pointer(%16) : (i64) -> ()
            %129 = llvm.mlir.addressof @str14 : !llvm.ptr
            %130 = arith.constant 3 : i64
            %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
            %132 = llvm.mlir.addressof @str15 : !llvm.ptr
            %133 = arith.constant 7 : i64
            %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
            %135 = func.call @cc_intern(%131, %134) : (i64, i64) -> i64
            %136 = func.call @cc_nil_value() : () -> i64
            %137 = func.call @cc_cons(%135, %136) : (i64, i64) -> i64
            %138 = func.call @cc_values_pack(%137) : (i64) -> i64
            %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
            %139 = arith.addi %135, %__rlasp_stack_elide_zero_1 : i64
            %140 = func.call @stack_pop_pointer() : () -> i64
            %141 = func.call @cc_eq(%140, %139) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
            %142 = arith.addi %141, %__rlasp_stack_elide_zero_2 : i64
            %143 = func.call @cc_nil_value() : () -> i64
            %144 = arith.cmpi ne, %142, %143 : i64
            scf.if %144 {
              %145 = arith.constant 31 : i64
              func.call @stack_push_fixnum(%145) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%16) : (i64) -> ()
              %146 = llvm.mlir.addressof @str16 : !llvm.ptr
              %147 = arith.constant 4 : i64
              %148 = func.call @cc_make_string(%146, %147) : (!llvm.ptr, i64) -> i64
              %149 = llvm.mlir.addressof @str17 : !llvm.ptr
              %150 = arith.constant 7 : i64
              %151 = func.call @cc_make_string(%149, %150) : (!llvm.ptr, i64) -> i64
              %152 = func.call @cc_intern(%148, %151) : (i64, i64) -> i64
              %153 = func.call @cc_nil_value() : () -> i64
              %154 = func.call @cc_cons(%152, %153) : (i64, i64) -> i64
              %155 = func.call @cc_values_pack(%154) : (i64) -> i64
              %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
              %156 = arith.addi %152, %__rlasp_stack_elide_zero_3 : i64
              %157 = func.call @stack_pop_pointer() : () -> i64
              %158 = func.call @cc_eq(%157, %156) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
              %159 = arith.addi %158, %__rlasp_stack_elide_zero_4 : i64
              %160 = func.call @cc_nil_value() : () -> i64
              %161 = arith.cmpi ne, %159, %160 : i64
              scf.if %161 {
                %162 = arith.constant 33 : i64
                func.call @stack_push_fixnum(%162) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%16) : (i64) -> ()
                %163 = llvm.mlir.addressof @str18 : !llvm.ptr
                %164 = arith.constant 4 : i64
                %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
                %166 = llvm.mlir.addressof @str19 : !llvm.ptr
                %167 = arith.constant 7 : i64
                %168 = func.call @cc_make_string(%166, %167) : (!llvm.ptr, i64) -> i64
                %169 = func.call @cc_intern(%165, %168) : (i64, i64) -> i64
                %170 = func.call @cc_nil_value() : () -> i64
                %171 = func.call @cc_cons(%169, %170) : (i64, i64) -> i64
                %172 = func.call @cc_values_pack(%171) : (i64) -> i64
                %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
                %173 = arith.addi %169, %__rlasp_stack_elide_zero_5 : i64
                %174 = func.call @stack_pop_pointer() : () -> i64
                %175 = func.call @cc_eq(%174, %173) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
                %176 = arith.addi %175, %__rlasp_stack_elide_zero_6 : i64
                %177 = func.call @cc_nil_value() : () -> i64
                %178 = arith.cmpi ne, %176, %177 : i64
                scf.if %178 {
                  %179 = arith.constant 32 : i64
                  func.call @stack_push_fixnum(%179) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%16) : (i64) -> ()
                  %180 = llvm.mlir.addressof @str20 : !llvm.ptr
                  %181 = arith.constant 9 : i64
                  %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
                  %183 = llvm.mlir.addressof @str21 : !llvm.ptr
                  %184 = arith.constant 11 : i64
                  %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
                  %186 = func.call @cc_intern(%182, %185) : (i64, i64) -> i64
                  %187 = func.call @cc_nil_value() : () -> i64
                  %188 = func.call @cc_cons(%186, %187) : (i64, i64) -> i64
                  %189 = func.call @cc_values_pack(%188) : (i64) -> i64
                  %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
                  %190 = arith.addi %186, %__rlasp_stack_elide_zero_7 : i64
                  %191 = func.call @stack_pop_pointer() : () -> i64
                  %192 = func.call @cc_eq(%191, %190) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
                  %193 = arith.addi %192, %__rlasp_stack_elide_zero_8 : i64
                  %194 = func.call @cc_nil_value() : () -> i64
                  %195 = arith.cmpi ne, %193, %194 : i64
                  scf.if %195 {
                    %196 = arith.constant 0 : i64
                    func.call @stack_push_fixnum(%196) : (i64) -> ()
                }
              }
            }
            }
            %197 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %197 : i64
          }
          %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
          %198 = arith.addi %128, %__rlasp_stack_elide_zero_9 : i64
          func.call @stack_push_pointer(%118) : (i64) -> ()
          func.call @stack_push_pointer(%121) : (i64) -> ()
          func.call @stack_push_pointer(%123) : (i64) -> ()
          func.call @stack_push_pointer(%198) : (i64) -> ()
          %199 = llvm.mlir.addressof @str22 : !llvm.ptr
          %200 = func.call @cc_make_function_ref_const(%199) : (!llvm.ptr) -> i64
          %201 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%200, %201) : (i64, i64) -> ()
          %202 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %202 : i64
        }
        func.call @stack_push_pointer(%117) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %203 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %203 : i64
    }
    %204 = func.call @cc_nil_value() : () -> i64
    %205 = func.call @cc_errorp(%88) : (i64) -> i64
    %206 = arith.cmpi ne, %205, %204 : i64
    %207 = scf.if %206 -> (i64) {
      scf.yield %88 : i64
    } else {
      %208 = llvm.mlir.addressof @str23 : !llvm.ptr
      %209 = func.call @cc_make_function_ref_const(%208) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %210 = arith.addi %209, %__rlasp_stack_elide_zero_10 : i64
      %211 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      func.call @stack_push_pointer(%18) : (i64) -> ()
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %212 = arith.addi %21, %__rlasp_stack_elide_zero_11 : i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      %215 = func.call @stack_pop_pointer() : () -> i64
      %216 = func.call @cc_cons(%215, %214) : (i64, i64) -> i64
      %217 = func.call @cc_apply(%210, %216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %218 = arith.addi %217, %__rlasp_stack_elide_zero_12 : i64
      scf.yield %218 : i64
    }
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_errorp(%207) : (i64) -> i64
    %221 = arith.cmpi ne, %220, %219 : i64
    %222 = scf.if %221 -> (i64) {
      scf.yield %207 : i64
    } else {
      %223 = llvm.mlir.addressof @str24 : !llvm.ptr
      %224 = arith.constant 17 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = llvm.mlir.addressof @str25 : !llvm.ptr
      %227 = arith.constant 11 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_intern(%225, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      %233 = func.call @cc_symbol_value(%229) : (i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_errorp(%233) : (i64) -> i64
      %236 = arith.cmpi ne, %235, %234 : i64
      %237 = arith.cmpi eq, %234, %234 : i64
      %238 = arith.andi %236, %237 : i1
      %239 = scf.if %238 -> (i64) {
        scf.yield %233 : i64
      } else {
        scf.yield %234 : i64
      }
      %240 = arith.cmpi ne, %239, %234 : i64
      scf.if %240 {
        func.call @stack_push_pointer(%239) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%233) : (i64) -> ()
        %241 = llvm.mlir.addressof @str26 : !llvm.ptr
        %242 = func.call @cc_make_function_ref_const(%241) : (!llvm.ptr) -> i64
        %243 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%242, %243) : (i64, i64) -> ()
      }
      %244 = func.call @stack_pop_pointer() : () -> i64
      %245 = func.call @cc_nil_value() : () -> i64
      %246 = arith.cmpi ne, %244, %245 : i64
      scf.if %246 {
        %247 = func.call @cc_nil_value() : () -> i64
        %248 = func.call @cc_nil_value() : () -> i64
        %249 = func.call @cc_errorp(%247) : (i64) -> i64
        %250 = arith.cmpi ne, %249, %248 : i64
        %251 = scf.if %250 -> (i64) {
          scf.yield %247 : i64
        } else {
          %252 = func.call @cc_t_value() : () -> i64
          %253 = llvm.mlir.addressof @str27 : !llvm.ptr
          %254 = arith.constant 5 : i64
          %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
          %256 = arith.constant 27 : i64
          %257 = func.call @cc_box_character(%256) : (i64) -> i64
          func.call @stack_push_pointer(%252) : (i64) -> ()
          func.call @stack_push_pointer(%255) : (i64) -> ()
          func.call @stack_push_pointer(%257) : (i64) -> ()
          %258 = llvm.mlir.addressof @str28 : !llvm.ptr
          %259 = func.call @cc_make_function_ref_const(%258) : (!llvm.ptr) -> i64
          %260 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%259, %260) : (i64, i64) -> ()
          %261 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %261 : i64
        }
        func.call @stack_push_pointer(%251) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %262 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %262 : i64
    }
    %263 = func.call @cc_nil_value() : () -> i64
    %264 = func.call @cc_errorp(%222) : (i64) -> i64
    %265 = arith.cmpi ne, %264, %263 : i64
    %266 = scf.if %265 -> (i64) {
      scf.yield %222 : i64
    } else {
      %267 = llvm.mlir.addressof @str29 : !llvm.ptr
      %268 = arith.constant 17 : i64
      %269 = func.call @cc_make_string(%267, %268) : (!llvm.ptr, i64) -> i64
      %270 = llvm.mlir.addressof @str30 : !llvm.ptr
      %271 = arith.constant 11 : i64
      %272 = func.call @cc_make_string(%270, %271) : (!llvm.ptr, i64) -> i64
      %273 = func.call @cc_intern(%269, %272) : (i64, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_cons(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_values_pack(%275) : (i64) -> i64
      %277 = func.call @cc_symbol_value(%273) : (i64) -> i64
      %278 = func.call @cc_nil_value() : () -> i64
      %279 = func.call @cc_errorp(%277) : (i64) -> i64
      %280 = arith.cmpi ne, %279, %278 : i64
      %281 = arith.cmpi eq, %278, %278 : i64
      %282 = arith.andi %280, %281 : i1
      %283 = scf.if %282 -> (i64) {
        scf.yield %277 : i64
      } else {
        scf.yield %278 : i64
      }
      %284 = arith.cmpi ne, %283, %278 : i64
      scf.if %284 {
        func.call @stack_push_pointer(%283) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%277) : (i64) -> ()
        %285 = llvm.mlir.addressof @str31 : !llvm.ptr
        %286 = func.call @cc_make_function_ref_const(%285) : (!llvm.ptr) -> i64
        %287 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%286, %287) : (i64, i64) -> ()
      }
      %288 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %288 : i64
    }
    %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
    %289 = arith.addi %266, %__rlasp_stack_elide_zero_13 : i64
    %290 = func.call @cc_multiple_value_list(%289) : (i64) -> i64
    %291 = llvm.mlir.addressof @str32 : !llvm.ptr
    %292 = arith.constant 37 : i64
    %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
    %294 = func.call @cc_nil_value() : () -> i64
    %295 = func.call @cc_intern(%293, %294) : (i64, i64) -> i64
    %296 = func.call @cc_nil_value() : () -> i64
    %297 = func.call @cc_cons(%295, %296) : (i64, i64) -> i64
    %298 = func.call @cc_values_pack(%297) : (i64) -> i64
    %299 = func.call @cc_symbol_value(%295) : (i64) -> i64
    %300 = llvm.mlir.addressof @str33 : !llvm.ptr
    %301 = arith.constant 39 : i64
    %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
    %303 = func.call @cc_nil_value() : () -> i64
    %304 = func.call @cc_intern(%302, %303) : (i64, i64) -> i64
    %305 = func.call @cc_nil_value() : () -> i64
    %306 = func.call @cc_cons(%304, %305) : (i64, i64) -> i64
    %307 = func.call @cc_values_pack(%306) : (i64) -> i64
    %308 = func.call @cc_symbol_value(%304) : (i64) -> i64
    %309 = func.call @cc_nil_value() : () -> i64
    %310 = arith.cmpi ne, %299, %309 : i64
    %311 = scf.if %310 -> (i64) {
      scf.yield %308 : i64
    } else {
      scf.yield %290 : i64
    }
    %312 = func.call @cc_values_pack(%311) : (i64) -> i64
    func.call @stack_push_pointer(%312) : (i64) -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::RESET-CLASP-TESTS"() {
    %313 = llvm.mlir.addressof @str34 : !llvm.ptr
    %314 = arith.constant 17 : i64
    %315 = func.call @cc_make_string(%313, %314) : (!llvm.ptr, i64) -> i64
    %316 = llvm.mlir.addressof @str35 : !llvm.ptr
    %317 = arith.constant 11 : i64
    %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
    %319 = func.call @cc_intern(%315, %318) : (i64, i64) -> i64
    %320 = func.call @cc_nil_value() : () -> i64
    %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
    %322 = func.call @cc_values_pack(%321) : (i64) -> i64
    %323 = func.call @cc_nil_value() : () -> i64
    %324 = llvm.mlir.addressof @str36 : !llvm.ptr
    %325 = arith.constant 37 : i64
    %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
    %327 = func.call @cc_nil_value() : () -> i64
    %328 = func.call @cc_intern(%326, %327) : (i64, i64) -> i64
    %329 = func.call @cc_nil_value() : () -> i64
    %330 = func.call @cc_cons(%328, %329) : (i64, i64) -> i64
    %331 = func.call @cc_values_pack(%330) : (i64) -> i64
    %332 = func.call @cc_set_symbol_value(%328, %323) : (i64, i64) -> i64
    %333 = llvm.mlir.addressof @str37 : !llvm.ptr
    %334 = arith.constant 38 : i64
    %335 = func.call @cc_make_string(%333, %334) : (!llvm.ptr, i64) -> i64
    %336 = func.call @cc_nil_value() : () -> i64
    %337 = func.call @cc_intern(%335, %336) : (i64, i64) -> i64
    %338 = func.call @cc_nil_value() : () -> i64
    %339 = func.call @cc_cons(%337, %338) : (i64, i64) -> i64
    %340 = func.call @cc_values_pack(%339) : (i64) -> i64
    %341 = func.call @cc_set_symbol_value(%337, %323) : (i64, i64) -> i64
    %342 = llvm.mlir.addressof @str38 : !llvm.ptr
    %343 = arith.constant 39 : i64
    %344 = func.call @cc_make_string(%342, %343) : (!llvm.ptr, i64) -> i64
    %345 = func.call @cc_nil_value() : () -> i64
    %346 = func.call @cc_intern(%344, %345) : (i64, i64) -> i64
    %347 = func.call @cc_nil_value() : () -> i64
    %348 = func.call @cc_cons(%346, %347) : (i64, i64) -> i64
    %349 = func.call @cc_values_pack(%348) : (i64) -> i64
    %350 = func.call @cc_set_symbol_value(%346, %323) : (i64, i64) -> i64
    %351 = func.call @cc_nil_value() : () -> i64
    %352 = func.call @cc_nil_value() : () -> i64
    %353 = func.call @cc_errorp(%351) : (i64) -> i64
    %354 = arith.cmpi ne, %353, %352 : i64
    %355 = scf.if %354 -> (i64) {
      scf.yield %351 : i64
    } else {
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = llvm.mlir.addressof @str39 : !llvm.ptr
      %358 = arith.constant 23 : i64
      %359 = func.call @cc_make_string(%357, %358) : (!llvm.ptr, i64) -> i64
      %360 = llvm.mlir.addressof @str40 : !llvm.ptr
      %361 = arith.constant 11 : i64
      %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
      %363 = func.call @cc_intern(%359, %362) : (i64, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_cons(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_values_pack(%365) : (i64) -> i64
      %367 = func.call @cc_set_symbol_value(%363, %356) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %368 = arith.addi %356, %__rlasp_stack_elide_zero_14 : i64
      scf.yield %368 : i64
    }
    %369 = func.call @cc_nil_value() : () -> i64
    %370 = func.call @cc_errorp(%355) : (i64) -> i64
    %371 = arith.cmpi ne, %370, %369 : i64
    %372 = scf.if %371 -> (i64) {
      scf.yield %355 : i64
    } else {
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = llvm.mlir.addressof @str41 : !llvm.ptr
      %375 = arith.constant 25 : i64
      %376 = func.call @cc_make_string(%374, %375) : (!llvm.ptr, i64) -> i64
      %377 = llvm.mlir.addressof @str42 : !llvm.ptr
      %378 = arith.constant 11 : i64
      %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
      %380 = func.call @cc_intern(%376, %379) : (i64, i64) -> i64
      %381 = func.call @cc_nil_value() : () -> i64
      %382 = func.call @cc_cons(%380, %381) : (i64, i64) -> i64
      %383 = func.call @cc_values_pack(%382) : (i64) -> i64
      %384 = func.call @cc_set_symbol_value(%380, %373) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %385 = arith.addi %373, %__rlasp_stack_elide_zero_15 : i64
      scf.yield %385 : i64
    }
    %386 = func.call @cc_nil_value() : () -> i64
    %387 = func.call @cc_errorp(%372) : (i64) -> i64
    %388 = arith.cmpi ne, %387, %386 : i64
    %389 = scf.if %388 -> (i64) {
      scf.yield %372 : i64
    } else {
      %390 = func.call @cc_nil_value() : () -> i64
      %391 = llvm.mlir.addressof @str43 : !llvm.ptr
      %392 = arith.constant 23 : i64
      %393 = func.call @cc_make_string(%391, %392) : (!llvm.ptr, i64) -> i64
      %394 = llvm.mlir.addressof @str44 : !llvm.ptr
      %395 = arith.constant 11 : i64
      %396 = func.call @cc_make_string(%394, %395) : (!llvm.ptr, i64) -> i64
      %397 = func.call @cc_intern(%393, %396) : (i64, i64) -> i64
      %398 = func.call @cc_nil_value() : () -> i64
      %399 = func.call @cc_cons(%397, %398) : (i64, i64) -> i64
      %400 = func.call @cc_values_pack(%399) : (i64) -> i64
      %401 = func.call @cc_set_symbol_value(%397, %390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %402 = arith.addi %390, %__rlasp_stack_elide_zero_16 : i64
      scf.yield %402 : i64
    }
    %403 = func.call @cc_nil_value() : () -> i64
    %404 = func.call @cc_errorp(%389) : (i64) -> i64
    %405 = arith.cmpi ne, %404, %403 : i64
    %406 = scf.if %405 -> (i64) {
      scf.yield %389 : i64
    } else {
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = llvm.mlir.addressof @str45 : !llvm.ptr
      %409 = arith.constant 25 : i64
      %410 = func.call @cc_make_string(%408, %409) : (!llvm.ptr, i64) -> i64
      %411 = llvm.mlir.addressof @str46 : !llvm.ptr
      %412 = arith.constant 11 : i64
      %413 = func.call @cc_make_string(%411, %412) : (!llvm.ptr, i64) -> i64
      %414 = func.call @cc_intern(%410, %413) : (i64, i64) -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_cons(%414, %415) : (i64, i64) -> i64
      %417 = func.call @cc_values_pack(%416) : (i64) -> i64
      %418 = func.call @cc_set_symbol_value(%414, %407) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %419 = arith.addi %407, %__rlasp_stack_elide_zero_17 : i64
      scf.yield %419 : i64
    }
    %420 = func.call @cc_nil_value() : () -> i64
    %421 = func.call @cc_errorp(%406) : (i64) -> i64
    %422 = arith.cmpi ne, %421, %420 : i64
    %423 = scf.if %422 -> (i64) {
      scf.yield %406 : i64
    } else {
      %424 = func.call @cc_nil_value() : () -> i64
      %425 = llvm.mlir.addressof @str47 : !llvm.ptr
      %426 = arith.constant 25 : i64
      %427 = func.call @cc_make_string(%425, %426) : (!llvm.ptr, i64) -> i64
      %428 = llvm.mlir.addressof @str48 : !llvm.ptr
      %429 = arith.constant 11 : i64
      %430 = func.call @cc_make_string(%428, %429) : (!llvm.ptr, i64) -> i64
      %431 = func.call @cc_intern(%427, %430) : (i64, i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = func.call @cc_cons(%431, %432) : (i64, i64) -> i64
      %434 = func.call @cc_values_pack(%433) : (i64) -> i64
      %435 = func.call @cc_set_symbol_value(%431, %424) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %436 = arith.addi %424, %__rlasp_stack_elide_zero_18 : i64
      scf.yield %436 : i64
    }
    %437 = func.call @cc_nil_value() : () -> i64
    %438 = func.call @cc_errorp(%423) : (i64) -> i64
    %439 = arith.cmpi ne, %438, %437 : i64
    %440 = scf.if %439 -> (i64) {
      scf.yield %423 : i64
    } else {
      %441 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%441) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %442 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %443 = arith.addi %442, %__rlasp_stack_elide_zero_19 : i64
      %444 = llvm.mlir.addressof @str49 : !llvm.ptr
      %445 = arith.constant 19 : i64
      %446 = func.call @cc_make_string(%444, %445) : (!llvm.ptr, i64) -> i64
      %447 = llvm.mlir.addressof @str50 : !llvm.ptr
      %448 = arith.constant 11 : i64
      %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
      %450 = func.call @cc_intern(%446, %449) : (i64, i64) -> i64
      %451 = func.call @cc_nil_value() : () -> i64
      %452 = func.call @cc_cons(%450, %451) : (i64, i64) -> i64
      %453 = func.call @cc_values_pack(%452) : (i64) -> i64
      %454 = func.call @cc_set_symbol_value(%450, %443) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %455 = arith.addi %443, %__rlasp_stack_elide_zero_20 : i64
      scf.yield %455 : i64
    }
    %456 = func.call @cc_nil_value() : () -> i64
    %457 = func.call @cc_errorp(%440) : (i64) -> i64
    %458 = arith.cmpi ne, %457, %456 : i64
    %459 = scf.if %458 -> (i64) {
      scf.yield %440 : i64
    } else {
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = llvm.mlir.addressof @str51 : !llvm.ptr
      %462 = arith.constant 17 : i64
      %463 = func.call @cc_make_string(%461, %462) : (!llvm.ptr, i64) -> i64
      %464 = llvm.mlir.addressof @str52 : !llvm.ptr
      %465 = arith.constant 11 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = func.call @cc_intern(%463, %466) : (i64, i64) -> i64
      %468 = func.call @cc_nil_value() : () -> i64
      %469 = func.call @cc_cons(%467, %468) : (i64, i64) -> i64
      %470 = func.call @cc_values_pack(%469) : (i64) -> i64
      %471 = func.call @cc_set_symbol_value(%467, %460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %472 = arith.addi %460, %__rlasp_stack_elide_zero_21 : i64
      scf.yield %472 : i64
    }
    %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
    %473 = arith.addi %459, %__rlasp_stack_elide_zero_22 : i64
    %474 = func.call @cc_multiple_value_list(%473) : (i64) -> i64
    %475 = llvm.mlir.addressof @str53 : !llvm.ptr
    %476 = arith.constant 37 : i64
    %477 = func.call @cc_make_string(%475, %476) : (!llvm.ptr, i64) -> i64
    %478 = func.call @cc_nil_value() : () -> i64
    %479 = func.call @cc_intern(%477, %478) : (i64, i64) -> i64
    %480 = func.call @cc_nil_value() : () -> i64
    %481 = func.call @cc_cons(%479, %480) : (i64, i64) -> i64
    %482 = func.call @cc_values_pack(%481) : (i64) -> i64
    %483 = func.call @cc_symbol_value(%479) : (i64) -> i64
    %484 = llvm.mlir.addressof @str54 : !llvm.ptr
    %485 = arith.constant 39 : i64
    %486 = func.call @cc_make_string(%484, %485) : (!llvm.ptr, i64) -> i64
    %487 = func.call @cc_nil_value() : () -> i64
    %488 = func.call @cc_intern(%486, %487) : (i64, i64) -> i64
    %489 = func.call @cc_nil_value() : () -> i64
    %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
    %491 = func.call @cc_values_pack(%490) : (i64) -> i64
    %492 = func.call @cc_symbol_value(%488) : (i64) -> i64
    %493 = func.call @cc_nil_value() : () -> i64
    %494 = arith.cmpi ne, %483, %493 : i64
    %495 = scf.if %494 -> (i64) {
      scf.yield %492 : i64
    } else {
      scf.yield %474 : i64
    }
    %496 = func.call @cc_values_pack(%495) : (i64) -> i64
    func.call @stack_push_pointer(%496) : (i64) -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::NOTE-TEST"() {
    %497 = llvm.mlir.addressof @str55 : !llvm.ptr
    %498 = arith.constant 9 : i64
    %499 = func.call @cc_make_string(%497, %498) : (!llvm.ptr, i64) -> i64
    %500 = llvm.mlir.addressof @str56 : !llvm.ptr
    %501 = arith.constant 11 : i64
    %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
    %503 = func.call @cc_intern(%499, %502) : (i64, i64) -> i64
    %504 = func.call @cc_nil_value() : () -> i64
    %505 = func.call @cc_cons(%503, %504) : (i64, i64) -> i64
    %506 = func.call @cc_values_pack(%505) : (i64) -> i64
    %507 = llvm.mlir.addressof @str57 : !llvm.ptr
    %508 = arith.constant 4 : i64
    %509 = func.call @cc_make_string(%507, %508) : (!llvm.ptr, i64) -> i64
    %510 = func.call @cc_register_function_lambda_list_metadata_raw(%503, %509) : (i64, i64) -> i64
    %511 = func.call @stack_pop_pointer() : () -> i64
    %512 = func.call @cc_nil_value() : () -> i64
    %513 = llvm.mlir.addressof @str58 : !llvm.ptr
    %514 = arith.constant 37 : i64
    %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
    %516 = func.call @cc_nil_value() : () -> i64
    %517 = func.call @cc_intern(%515, %516) : (i64, i64) -> i64
    %518 = func.call @cc_nil_value() : () -> i64
    %519 = func.call @cc_cons(%517, %518) : (i64, i64) -> i64
    %520 = func.call @cc_values_pack(%519) : (i64) -> i64
    %521 = func.call @cc_set_symbol_value(%517, %512) : (i64, i64) -> i64
    %522 = llvm.mlir.addressof @str59 : !llvm.ptr
    %523 = arith.constant 38 : i64
    %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
    %525 = func.call @cc_nil_value() : () -> i64
    %526 = func.call @cc_intern(%524, %525) : (i64, i64) -> i64
    %527 = func.call @cc_nil_value() : () -> i64
    %528 = func.call @cc_cons(%526, %527) : (i64, i64) -> i64
    %529 = func.call @cc_values_pack(%528) : (i64) -> i64
    %530 = func.call @cc_set_symbol_value(%526, %512) : (i64, i64) -> i64
    %531 = llvm.mlir.addressof @str60 : !llvm.ptr
    %532 = arith.constant 39 : i64
    %533 = func.call @cc_make_string(%531, %532) : (!llvm.ptr, i64) -> i64
    %534 = func.call @cc_nil_value() : () -> i64
    %535 = func.call @cc_intern(%533, %534) : (i64, i64) -> i64
    %536 = func.call @cc_nil_value() : () -> i64
    %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
    %538 = func.call @cc_values_pack(%537) : (i64) -> i64
    %539 = func.call @cc_set_symbol_value(%535, %512) : (i64, i64) -> i64
    func.call @stack_push_pointer(%511) : (i64) -> ()
    %540 = llvm.mlir.addressof @str61 : !llvm.ptr
    %541 = arith.constant 19 : i64
    %542 = func.call @cc_make_string(%540, %541) : (!llvm.ptr, i64) -> i64
    %543 = llvm.mlir.addressof @str62 : !llvm.ptr
    %544 = arith.constant 11 : i64
    %545 = func.call @cc_make_string(%543, %544) : (!llvm.ptr, i64) -> i64
    %546 = func.call @cc_intern(%542, %545) : (i64, i64) -> i64
    %547 = func.call @cc_nil_value() : () -> i64
    %548 = func.call @cc_cons(%546, %547) : (i64, i64) -> i64
    %549 = func.call @cc_values_pack(%548) : (i64) -> i64
    %550 = func.call @cc_symbol_value(%546) : (i64) -> i64
    func.call @stack_push_pointer(%550) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %551 = func.call @stack_pop_pointer() : () -> i64
    %552 = func.call @stack_pop_pointer() : () -> i64
    %553 = func.call @stack_pop_pointer() : () -> i64
    %554 = func.call @cc_gethash(%553, %552, %551) : (i64, i64, i64) -> i64
    %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
    %555 = arith.addi %554, %__rlasp_stack_elide_zero_23 : i64
    %556 = func.call @cc_nil_value() : () -> i64
    %557 = arith.cmpi ne, %555, %556 : i64
    scf.if %557 {
      %558 = func.call @cc_nil_value() : () -> i64
      %559 = func.call @cc_nil_value() : () -> i64
      %560 = func.call @cc_errorp(%558) : (i64) -> i64
      %561 = arith.cmpi ne, %560, %559 : i64
      %562 = scf.if %561 -> (i64) {
        scf.yield %558 : i64
      } else {
        %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
        %563 = arith.addi %511, %__rlasp_stack_elide_zero_24 : i64
        %564 = llvm.mlir.addressof @str63 : !llvm.ptr
        %565 = arith.constant 17 : i64
        %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
        %567 = llvm.mlir.addressof @str64 : !llvm.ptr
        %568 = arith.constant 11 : i64
        %569 = func.call @cc_make_string(%567, %568) : (!llvm.ptr, i64) -> i64
        %570 = func.call @cc_intern(%566, %569) : (i64, i64) -> i64
        %571 = func.call @cc_nil_value() : () -> i64
        %572 = func.call @cc_cons(%570, %571) : (i64, i64) -> i64
        %573 = func.call @cc_values_pack(%572) : (i64) -> i64
        %574 = func.call @cc_symbol_value(%570) : (i64) -> i64
        %575 = func.call @cc_cons(%563, %574) : (i64, i64) -> i64
        %576 = llvm.mlir.addressof @str65 : !llvm.ptr
        %577 = arith.constant 17 : i64
        %578 = func.call @cc_make_string(%576, %577) : (!llvm.ptr, i64) -> i64
        %579 = llvm.mlir.addressof @str66 : !llvm.ptr
        %580 = arith.constant 11 : i64
        %581 = func.call @cc_make_string(%579, %580) : (!llvm.ptr, i64) -> i64
        %582 = func.call @cc_intern(%578, %581) : (i64, i64) -> i64
        %583 = func.call @cc_nil_value() : () -> i64
        %584 = func.call @cc_cons(%582, %583) : (i64, i64) -> i64
        %585 = func.call @cc_values_pack(%584) : (i64) -> i64
        %586 = func.call @cc_set_symbol_value(%582, %575) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
        %587 = arith.addi %575, %__rlasp_stack_elide_zero_25 : i64
        scf.yield %587 : i64
      }
      %588 = func.call @cc_nil_value() : () -> i64
      %589 = func.call @cc_errorp(%562) : (i64) -> i64
      %590 = arith.cmpi ne, %589, %588 : i64
      %591 = scf.if %590 -> (i64) {
        scf.yield %562 : i64
      } else {
        %592 = llvm.mlir.addressof @str67 : !llvm.ptr
        %593 = arith.constant 21 : i64
        %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
        %595 = func.call @cc_nil_value() : () -> i64
        %596 = func.call @cc_errorp(%594) : (i64) -> i64
        %597 = arith.cmpi ne, %596, %595 : i64
        %598 = arith.cmpi eq, %595, %595 : i64
        %599 = arith.andi %597, %598 : i1
        %600 = scf.if %599 -> (i64) {
          scf.yield %594 : i64
        } else {
          scf.yield %595 : i64
        }
        %601 = func.call @cc_errorp(%511) : (i64) -> i64
        %602 = arith.cmpi ne, %601, %595 : i64
        %603 = arith.cmpi eq, %600, %595 : i64
        %604 = arith.andi %602, %603 : i1
        %605 = scf.if %604 -> (i64) {
          scf.yield %511 : i64
        } else {
          scf.yield %600 : i64
        }
        %606 = arith.cmpi ne, %605, %595 : i64
        scf.if %606 {
          func.call @stack_push_pointer(%605) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%594) : (i64) -> ()
          func.call @stack_push_pointer(%511) : (i64) -> ()
          %607 = llvm.mlir.addressof @str68 : !llvm.ptr
          %608 = func.call @cc_make_function_ref_const(%607) : (!llvm.ptr) -> i64
          %609 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%608, %609) : (i64, i64) -> ()
        }
        %610 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %610 : i64
      }
      func.call @stack_push_pointer(%591) : (i64) -> ()
    } else {
      %611 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %612 = arith.addi %611, %__rlasp_stack_elide_zero_26 : i64
      %613 = func.call @cc_nil_value() : () -> i64
      %614 = arith.cmpi ne, %612, %613 : i64
      scf.if %614 {
        func.call @stack_push_pointer(%511) : (i64) -> ()
        %615 = llvm.mlir.addressof @str69 : !llvm.ptr
        %616 = arith.constant 19 : i64
        %617 = func.call @cc_make_string(%615, %616) : (!llvm.ptr, i64) -> i64
        %618 = llvm.mlir.addressof @str70 : !llvm.ptr
        %619 = arith.constant 11 : i64
        %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
        %621 = func.call @cc_intern(%617, %620) : (i64, i64) -> i64
        %622 = func.call @cc_nil_value() : () -> i64
        %623 = func.call @cc_cons(%621, %622) : (i64, i64) -> i64
        %624 = func.call @cc_values_pack(%623) : (i64) -> i64
        %625 = func.call @cc_symbol_value(%621) : (i64) -> i64
        func.call @stack_push_pointer(%625) : (i64) -> ()
        %626 = func.call @cc_t_value() : () -> i64
        %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
        %627 = arith.addi %626, %__rlasp_stack_elide_zero_27 : i64
        %628 = func.call @stack_pop_pointer() : () -> i64
        %629 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%627) : (i64) -> ()
        func.call @stack_push_pointer(%629) : (i64) -> ()
        func.call @stack_push_pointer(%628) : (i64) -> ()
        %630 = llvm.mlir.addressof @str71 : !llvm.ptr
        %631 = func.call @cc_make_function_ref_const(%630) : (!llvm.ptr) -> i64
        %632 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%631, %632) : (i64, i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
    }
    %633 = func.call @stack_pop_pointer() : () -> i64
    %634 = func.call @cc_multiple_value_list(%633) : (i64) -> i64
    %635 = llvm.mlir.addressof @str72 : !llvm.ptr
    %636 = arith.constant 37 : i64
    %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
    %638 = func.call @cc_nil_value() : () -> i64
    %639 = func.call @cc_intern(%637, %638) : (i64, i64) -> i64
    %640 = func.call @cc_nil_value() : () -> i64
    %641 = func.call @cc_cons(%639, %640) : (i64, i64) -> i64
    %642 = func.call @cc_values_pack(%641) : (i64) -> i64
    %643 = func.call @cc_symbol_value(%639) : (i64) -> i64
    %644 = llvm.mlir.addressof @str73 : !llvm.ptr
    %645 = arith.constant 39 : i64
    %646 = func.call @cc_make_string(%644, %645) : (!llvm.ptr, i64) -> i64
    %647 = func.call @cc_nil_value() : () -> i64
    %648 = func.call @cc_intern(%646, %647) : (i64, i64) -> i64
    %649 = func.call @cc_nil_value() : () -> i64
    %650 = func.call @cc_cons(%648, %649) : (i64, i64) -> i64
    %651 = func.call @cc_values_pack(%650) : (i64) -> i64
    %652 = func.call @cc_symbol_value(%648) : (i64) -> i64
    %653 = func.call @cc_nil_value() : () -> i64
    %654 = arith.cmpi ne, %643, %653 : i64
    %655 = scf.if %654 -> (i64) {
      scf.yield %652 : i64
    } else {
      scf.yield %634 : i64
    }
    %656 = func.call @cc_values_pack(%655) : (i64) -> i64
    func.call @stack_push_pointer(%656) : (i64) -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::NOTE-COMPILE-ERROR"() {
    %657 = llvm.mlir.addressof @str74 : !llvm.ptr
    %658 = arith.constant 18 : i64
    %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
    %660 = llvm.mlir.addressof @str75 : !llvm.ptr
    %661 = arith.constant 11 : i64
    %662 = func.call @cc_make_string(%660, %661) : (!llvm.ptr, i64) -> i64
    %663 = func.call @cc_intern(%659, %662) : (i64, i64) -> i64
    %664 = func.call @cc_nil_value() : () -> i64
    %665 = func.call @cc_cons(%663, %664) : (i64, i64) -> i64
    %666 = func.call @cc_values_pack(%665) : (i64) -> i64
    %667 = llvm.mlir.addressof @str76 : !llvm.ptr
    %668 = arith.constant 10 : i64
    %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
    %670 = func.call @cc_register_function_lambda_list_metadata_raw(%663, %669) : (i64, i64) -> i64
    %671 = func.call @stack_pop_pointer() : () -> i64
    %672 = func.call @cc_nil_value() : () -> i64
    %673 = llvm.mlir.addressof @str77 : !llvm.ptr
    %674 = arith.constant 37 : i64
    %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
    %676 = func.call @cc_nil_value() : () -> i64
    %677 = func.call @cc_intern(%675, %676) : (i64, i64) -> i64
    %678 = func.call @cc_nil_value() : () -> i64
    %679 = func.call @cc_cons(%677, %678) : (i64, i64) -> i64
    %680 = func.call @cc_values_pack(%679) : (i64) -> i64
    %681 = func.call @cc_set_symbol_value(%677, %672) : (i64, i64) -> i64
    %682 = llvm.mlir.addressof @str78 : !llvm.ptr
    %683 = arith.constant 38 : i64
    %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
    %685 = func.call @cc_nil_value() : () -> i64
    %686 = func.call @cc_intern(%684, %685) : (i64, i64) -> i64
    %687 = func.call @cc_nil_value() : () -> i64
    %688 = func.call @cc_cons(%686, %687) : (i64, i64) -> i64
    %689 = func.call @cc_values_pack(%688) : (i64) -> i64
    %690 = func.call @cc_set_symbol_value(%686, %672) : (i64, i64) -> i64
    %691 = llvm.mlir.addressof @str79 : !llvm.ptr
    %692 = arith.constant 39 : i64
    %693 = func.call @cc_make_string(%691, %692) : (!llvm.ptr, i64) -> i64
    %694 = func.call @cc_nil_value() : () -> i64
    %695 = func.call @cc_intern(%693, %694) : (i64, i64) -> i64
    %696 = func.call @cc_nil_value() : () -> i64
    %697 = func.call @cc_cons(%695, %696) : (i64, i64) -> i64
    %698 = func.call @cc_values_pack(%697) : (i64) -> i64
    %699 = func.call @cc_set_symbol_value(%695, %672) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
    %700 = arith.addi %671, %__rlasp_stack_elide_zero_28 : i64
    %701 = llvm.mlir.addressof @str80 : !llvm.ptr
    %702 = arith.constant 25 : i64
    %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
    %704 = llvm.mlir.addressof @str81 : !llvm.ptr
    %705 = arith.constant 11 : i64
    %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
    %707 = func.call @cc_intern(%703, %706) : (i64, i64) -> i64
    %708 = func.call @cc_nil_value() : () -> i64
    %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
    %710 = func.call @cc_values_pack(%709) : (i64) -> i64
    %711 = func.call @cc_symbol_value(%707) : (i64) -> i64
    %712 = func.call @cc_cons(%700, %711) : (i64, i64) -> i64
    %713 = llvm.mlir.addressof @str82 : !llvm.ptr
    %714 = arith.constant 25 : i64
    %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
    %716 = llvm.mlir.addressof @str83 : !llvm.ptr
    %717 = arith.constant 11 : i64
    %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
    %719 = func.call @cc_intern(%715, %718) : (i64, i64) -> i64
    %720 = func.call @cc_nil_value() : () -> i64
    %721 = func.call @cc_cons(%719, %720) : (i64, i64) -> i64
    %722 = func.call @cc_values_pack(%721) : (i64) -> i64
    %723 = func.call @cc_set_symbol_value(%719, %712) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
    %724 = arith.addi %712, %__rlasp_stack_elide_zero_29 : i64
    %725 = func.call @cc_multiple_value_list(%724) : (i64) -> i64
    %726 = llvm.mlir.addressof @str84 : !llvm.ptr
    %727 = arith.constant 37 : i64
    %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
    %729 = func.call @cc_nil_value() : () -> i64
    %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
    %731 = func.call @cc_nil_value() : () -> i64
    %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
    %733 = func.call @cc_values_pack(%732) : (i64) -> i64
    %734 = func.call @cc_symbol_value(%730) : (i64) -> i64
    %735 = llvm.mlir.addressof @str85 : !llvm.ptr
    %736 = arith.constant 39 : i64
    %737 = func.call @cc_make_string(%735, %736) : (!llvm.ptr, i64) -> i64
    %738 = func.call @cc_nil_value() : () -> i64
    %739 = func.call @cc_intern(%737, %738) : (i64, i64) -> i64
    %740 = func.call @cc_nil_value() : () -> i64
    %741 = func.call @cc_cons(%739, %740) : (i64, i64) -> i64
    %742 = func.call @cc_values_pack(%741) : (i64) -> i64
    %743 = func.call @cc_symbol_value(%739) : (i64) -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = arith.cmpi ne, %734, %744 : i64
    %746 = scf.if %745 -> (i64) {
      scf.yield %743 : i64
    } else {
      scf.yield %725 : i64
    }
    %747 = func.call @cc_values_pack(%746) : (i64) -> i64
    func.call @stack_push_pointer(%747) : (i64) -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::SHOW-TEST-SUMMARY"() {
    %748 = llvm.mlir.addressof @str86 : !llvm.ptr
    %749 = arith.constant 17 : i64
    %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
    %751 = llvm.mlir.addressof @str87 : !llvm.ptr
    %752 = arith.constant 11 : i64
    %753 = func.call @cc_make_string(%751, %752) : (!llvm.ptr, i64) -> i64
    %754 = func.call @cc_intern(%750, %753) : (i64, i64) -> i64
    %755 = func.call @cc_nil_value() : () -> i64
    %756 = func.call @cc_cons(%754, %755) : (i64, i64) -> i64
    %757 = func.call @cc_values_pack(%756) : (i64) -> i64
    %758 = func.call @cc_nil_value() : () -> i64
    %759 = llvm.mlir.addressof @str88 : !llvm.ptr
    %760 = arith.constant 37 : i64
    %761 = func.call @cc_make_string(%759, %760) : (!llvm.ptr, i64) -> i64
    %762 = func.call @cc_nil_value() : () -> i64
    %763 = func.call @cc_intern(%761, %762) : (i64, i64) -> i64
    %764 = func.call @cc_nil_value() : () -> i64
    %765 = func.call @cc_cons(%763, %764) : (i64, i64) -> i64
    %766 = func.call @cc_values_pack(%765) : (i64) -> i64
    %767 = func.call @cc_set_symbol_value(%763, %758) : (i64, i64) -> i64
    %768 = llvm.mlir.addressof @str89 : !llvm.ptr
    %769 = arith.constant 38 : i64
    %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
    %771 = func.call @cc_nil_value() : () -> i64
    %772 = func.call @cc_intern(%770, %771) : (i64, i64) -> i64
    %773 = func.call @cc_nil_value() : () -> i64
    %774 = func.call @cc_cons(%772, %773) : (i64, i64) -> i64
    %775 = func.call @cc_values_pack(%774) : (i64) -> i64
    %776 = func.call @cc_set_symbol_value(%772, %758) : (i64, i64) -> i64
    %777 = llvm.mlir.addressof @str90 : !llvm.ptr
    %778 = arith.constant 39 : i64
    %779 = func.call @cc_make_string(%777, %778) : (!llvm.ptr, i64) -> i64
    %780 = func.call @cc_nil_value() : () -> i64
    %781 = func.call @cc_intern(%779, %780) : (i64, i64) -> i64
    %782 = func.call @cc_nil_value() : () -> i64
    %783 = func.call @cc_cons(%781, %782) : (i64, i64) -> i64
    %784 = func.call @cc_values_pack(%783) : (i64) -> i64
    %785 = func.call @cc_set_symbol_value(%781, %758) : (i64, i64) -> i64
    %786 = func.call @cc_nil_value() : () -> i64
    %787 = func.call @cc_nil_value() : () -> i64
    %788 = func.call @cc_errorp(%786) : (i64) -> i64
    %789 = arith.cmpi ne, %788, %787 : i64
    %790 = scf.if %789 -> (i64) {
      scf.yield %786 : i64
    } else {
      %791 = llvm.mlir.addressof @str91 : !llvm.ptr
      %792 = arith.constant 4 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = llvm.mlir.addressof @str92 : !llvm.ptr
      %795 = arith.constant 7 : i64
      %796 = func.call @cc_make_string(%794, %795) : (!llvm.ptr, i64) -> i64
      %797 = func.call @cc_intern(%793, %796) : (i64, i64) -> i64
      %798 = func.call @cc_nil_value() : () -> i64
      %799 = func.call @cc_cons(%797, %798) : (i64, i64) -> i64
      %800 = func.call @cc_values_pack(%799) : (i64) -> i64
      %801 = llvm.mlir.addressof @str93 : !llvm.ptr
      %802 = arith.constant 147 : i64
      %803 = func.call @cc_make_string(%801, %802) : (!llvm.ptr, i64) -> i64
      %804 = llvm.mlir.addressof @str94 : !llvm.ptr
      %805 = arith.constant 25 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = llvm.mlir.addressof @str95 : !llvm.ptr
      %808 = arith.constant 11 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = func.call @cc_intern(%806, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      %814 = func.call @cc_symbol_value(%810) : (i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %815 = arith.addi %814, %__rlasp_stack_elide_zero_30 : i64
      %816 = func.call @cc_reverse(%815) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %817 = arith.addi %816, %__rlasp_stack_elide_zero_31 : i64
      %818 = llvm.mlir.addressof @str96 : !llvm.ptr
      %819 = arith.constant 25 : i64
      %820 = func.call @cc_make_string(%818, %819) : (!llvm.ptr, i64) -> i64
      %821 = llvm.mlir.addressof @str97 : !llvm.ptr
      %822 = arith.constant 11 : i64
      %823 = func.call @cc_make_string(%821, %822) : (!llvm.ptr, i64) -> i64
      %824 = func.call @cc_intern(%820, %823) : (i64, i64) -> i64
      %825 = func.call @cc_nil_value() : () -> i64
      %826 = func.call @cc_cons(%824, %825) : (i64, i64) -> i64
      %827 = func.call @cc_values_pack(%826) : (i64) -> i64
      %828 = func.call @cc_symbol_value(%824) : (i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %829 = arith.addi %828, %__rlasp_stack_elide_zero_32 : i64
      %830 = func.call @cc_reverse(%829) : (i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %831 = arith.addi %830, %__rlasp_stack_elide_zero_33 : i64
      %832 = llvm.mlir.addressof @str98 : !llvm.ptr
      %833 = arith.constant 23 : i64
      %834 = func.call @cc_make_string(%832, %833) : (!llvm.ptr, i64) -> i64
      %835 = llvm.mlir.addressof @str99 : !llvm.ptr
      %836 = arith.constant 11 : i64
      %837 = func.call @cc_make_string(%835, %836) : (!llvm.ptr, i64) -> i64
      %838 = func.call @cc_intern(%834, %837) : (i64, i64) -> i64
      %839 = func.call @cc_nil_value() : () -> i64
      %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
      %841 = func.call @cc_values_pack(%840) : (i64) -> i64
      %842 = func.call @cc_symbol_value(%838) : (i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %843 = arith.addi %842, %__rlasp_stack_elide_zero_34 : i64
      %844 = func.call @cc_reverse(%843) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %845 = arith.addi %844, %__rlasp_stack_elide_zero_35 : i64
      %846 = llvm.mlir.addressof @str100 : !llvm.ptr
      %847 = arith.constant 23 : i64
      %848 = func.call @cc_make_string(%846, %847) : (!llvm.ptr, i64) -> i64
      %849 = llvm.mlir.addressof @str101 : !llvm.ptr
      %850 = arith.constant 11 : i64
      %851 = func.call @cc_make_string(%849, %850) : (!llvm.ptr, i64) -> i64
      %852 = func.call @cc_intern(%848, %851) : (i64, i64) -> i64
      %853 = func.call @cc_nil_value() : () -> i64
      %854 = func.call @cc_cons(%852, %853) : (i64, i64) -> i64
      %855 = func.call @cc_values_pack(%854) : (i64) -> i64
      %856 = func.call @cc_symbol_value(%852) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %857 = arith.addi %856, %__rlasp_stack_elide_zero_36 : i64
      %858 = func.call @cc_length(%857) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %859 = arith.addi %858, %__rlasp_stack_elide_zero_37 : i64
      %860 = func.call @cc_nil_value() : () -> i64
      %861 = func.call @cc_errorp(%797) : (i64) -> i64
      %862 = arith.cmpi ne, %861, %860 : i64
      %863 = arith.cmpi eq, %860, %860 : i64
      %864 = arith.andi %862, %863 : i1
      %865 = scf.if %864 -> (i64) {
        scf.yield %797 : i64
      } else {
        scf.yield %860 : i64
      }
      %866 = func.call @cc_errorp(%803) : (i64) -> i64
      %867 = arith.cmpi ne, %866, %860 : i64
      %868 = arith.cmpi eq, %865, %860 : i64
      %869 = arith.andi %867, %868 : i1
      %870 = scf.if %869 -> (i64) {
        scf.yield %803 : i64
      } else {
        scf.yield %865 : i64
      }
      %871 = func.call @cc_errorp(%817) : (i64) -> i64
      %872 = arith.cmpi ne, %871, %860 : i64
      %873 = arith.cmpi eq, %870, %860 : i64
      %874 = arith.andi %872, %873 : i1
      %875 = scf.if %874 -> (i64) {
        scf.yield %817 : i64
      } else {
        scf.yield %870 : i64
      }
      %876 = func.call @cc_errorp(%831) : (i64) -> i64
      %877 = arith.cmpi ne, %876, %860 : i64
      %878 = arith.cmpi eq, %875, %860 : i64
      %879 = arith.andi %877, %878 : i1
      %880 = scf.if %879 -> (i64) {
        scf.yield %831 : i64
      } else {
        scf.yield %875 : i64
      }
      %881 = func.call @cc_errorp(%845) : (i64) -> i64
      %882 = arith.cmpi ne, %881, %860 : i64
      %883 = arith.cmpi eq, %880, %860 : i64
      %884 = arith.andi %882, %883 : i1
      %885 = scf.if %884 -> (i64) {
        scf.yield %845 : i64
      } else {
        scf.yield %880 : i64
      }
      %886 = func.call @cc_errorp(%859) : (i64) -> i64
      %887 = arith.cmpi ne, %886, %860 : i64
      %888 = arith.cmpi eq, %885, %860 : i64
      %889 = arith.andi %887, %888 : i1
      %890 = scf.if %889 -> (i64) {
        scf.yield %859 : i64
      } else {
        scf.yield %885 : i64
      }
      %891 = arith.cmpi ne, %890, %860 : i64
      scf.if %891 {
        func.call @stack_push_pointer(%890) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%797) : (i64) -> ()
        func.call @stack_push_pointer(%803) : (i64) -> ()
        func.call @stack_push_pointer(%817) : (i64) -> ()
        func.call @stack_push_pointer(%831) : (i64) -> ()
        func.call @stack_push_pointer(%845) : (i64) -> ()
        func.call @stack_push_pointer(%859) : (i64) -> ()
        %892 = llvm.mlir.addressof @str102 : !llvm.ptr
        %893 = func.call @cc_make_function_ref_const(%892) : (!llvm.ptr) -> i64
        %894 = arith.constant 6 : i64
        func.call @cc_funcall_stack(%893, %894) : (i64, i64) -> ()
      }
      %895 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %895 : i64
    }
    %896 = func.call @cc_nil_value() : () -> i64
    %897 = func.call @cc_errorp(%790) : (i64) -> i64
    %898 = arith.cmpi ne, %897, %896 : i64
    %899 = scf.if %898 -> (i64) {
      scf.yield %790 : i64
    } else {
      %900 = llvm.mlir.addressof @str103 : !llvm.ptr
      %901 = arith.constant 25 : i64
      %902 = func.call @cc_make_string(%900, %901) : (!llvm.ptr, i64) -> i64
      %903 = llvm.mlir.addressof @str104 : !llvm.ptr
      %904 = arith.constant 11 : i64
      %905 = func.call @cc_make_string(%903, %904) : (!llvm.ptr, i64) -> i64
      %906 = func.call @cc_intern(%902, %905) : (i64, i64) -> i64
      %907 = func.call @cc_nil_value() : () -> i64
      %908 = func.call @cc_cons(%906, %907) : (i64, i64) -> i64
      %909 = func.call @cc_values_pack(%908) : (i64) -> i64
      %910 = func.call @cc_symbol_value(%906) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %911 = arith.addi %910, %__rlasp_stack_elide_zero_38 : i64
      %912 = func.call @cc_nil_value() : () -> i64
      %913 = arith.cmpi ne, %911, %912 : i64
      scf.if %913 {
        %914 = func.call @cc_nil_value() : () -> i64
        %915 = func.call @cc_nil_value() : () -> i64
        %916 = func.call @cc_errorp(%914) : (i64) -> i64
        %917 = arith.cmpi ne, %916, %915 : i64
        %918 = scf.if %917 -> (i64) {
          scf.yield %914 : i64
        } else {
          %919 = llvm.mlir.addressof @str105 : !llvm.ptr
          %920 = arith.constant 25 : i64
          %921 = func.call @cc_make_string(%919, %920) : (!llvm.ptr, i64) -> i64
          %922 = llvm.mlir.addressof @str106 : !llvm.ptr
          %923 = arith.constant 11 : i64
          %924 = func.call @cc_make_string(%922, %923) : (!llvm.ptr, i64) -> i64
          %925 = func.call @cc_intern(%921, %924) : (i64, i64) -> i64
          %926 = func.call @cc_nil_value() : () -> i64
          %927 = func.call @cc_cons(%925, %926) : (i64, i64) -> i64
          %928 = func.call @cc_values_pack(%927) : (i64) -> i64
          %929 = func.call @cc_symbol_value(%925) : (i64) -> i64
          %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
          %930 = arith.addi %929, %__rlasp_stack_elide_zero_39 : i64
          %931:1 = scf.while (%arg0 = %930) : (i64) -> (i64) {
            %932 = func.call @cc_is_cons(%arg0) : (i64) -> i32
            %933 = arith.constant 0 : i32
            %934 = arith.cmpi ne, %932, %933 : i32
            scf.condition(%934) %arg0 : i64
          } do {
            ^bb0(%935: i64):
            %936 = func.call @cc_car(%935) : (i64) -> i64
            %937 = llvm.mlir.addressof @str107 : !llvm.ptr
            %938 = arith.constant 3 : i64
            %939 = func.call @cc_make_string(%937, %938) : (!llvm.ptr, i64) -> i64
            %940 = llvm.mlir.addressof @str108 : !llvm.ptr
            %941 = arith.constant 7 : i64
            %942 = func.call @cc_make_string(%940, %941) : (!llvm.ptr, i64) -> i64
            %943 = func.call @cc_intern(%939, %942) : (i64, i64) -> i64
            %944 = func.call @cc_nil_value() : () -> i64
            %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
            %946 = func.call @cc_values_pack(%945) : (i64) -> i64
            %947 = llvm.mlir.addressof @str109 : !llvm.ptr
            %948 = arith.constant 44 : i64
            %949 = func.call @cc_make_string(%947, %948) : (!llvm.ptr, i64) -> i64
            %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
            %950 = arith.addi %936, %__rlasp_stack_elide_zero_40 : i64
            %951 = func.call @cc_car(%950) : (i64) -> i64
            %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
            %952 = arith.addi %951, %__rlasp_stack_elide_zero_41 : i64
            %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
            %953 = arith.addi %936, %__rlasp_stack_elide_zero_42 : i64
            %954 = func.call @cc_cdr(%953) : (i64) -> i64
            %955 = func.call @cc_car(%954) : (i64) -> i64
            %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
            %956 = arith.addi %955, %__rlasp_stack_elide_zero_43 : i64
            %957 = func.call @cc_nil_value() : () -> i64
            %958 = func.call @cc_errorp(%943) : (i64) -> i64
            %959 = arith.cmpi ne, %958, %957 : i64
            %960 = arith.cmpi eq, %957, %957 : i64
            %961 = arith.andi %959, %960 : i1
            %962 = scf.if %961 -> (i64) {
              scf.yield %943 : i64
            } else {
              scf.yield %957 : i64
            }
            %963 = func.call @cc_errorp(%949) : (i64) -> i64
            %964 = arith.cmpi ne, %963, %957 : i64
            %965 = arith.cmpi eq, %962, %957 : i64
            %966 = arith.andi %964, %965 : i1
            %967 = scf.if %966 -> (i64) {
              scf.yield %949 : i64
            } else {
              scf.yield %962 : i64
            }
            %968 = func.call @cc_errorp(%952) : (i64) -> i64
            %969 = arith.cmpi ne, %968, %957 : i64
            %970 = arith.cmpi eq, %967, %957 : i64
            %971 = arith.andi %969, %970 : i1
            %972 = scf.if %971 -> (i64) {
              scf.yield %952 : i64
            } else {
              scf.yield %967 : i64
            }
            %973 = func.call @cc_errorp(%956) : (i64) -> i64
            %974 = arith.cmpi ne, %973, %957 : i64
            %975 = arith.cmpi eq, %972, %957 : i64
            %976 = arith.andi %974, %975 : i1
            %977 = scf.if %976 -> (i64) {
              scf.yield %956 : i64
            } else {
              scf.yield %972 : i64
            }
            %978 = arith.cmpi ne, %977, %957 : i64
            scf.if %978 {
              func.call @stack_push_pointer(%977) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%943) : (i64) -> ()
              func.call @stack_push_pointer(%949) : (i64) -> ()
              func.call @stack_push_pointer(%952) : (i64) -> ()
              func.call @stack_push_pointer(%956) : (i64) -> ()
              %979 = llvm.mlir.addressof @str110 : !llvm.ptr
              %980 = func.call @cc_make_function_ref_const(%979) : (!llvm.ptr) -> i64
              %981 = arith.constant 4 : i64
              func.call @cc_funcall_stack(%980, %981) : (i64, i64) -> ()
            }
            %982 = func.call @stack_depth() : () -> i64
            %983 = arith.constant 0 : i64
            %984 = arith.cmpi sgt, %982, %983 : i64
            scf.if %984 {
              %985 = func.call @stack_pop_pointer() : () -> i64
            }
            %986 = func.call @cc_cdr(%935) : (i64) -> i64
            scf.yield %986 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %987 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %987 : i64
        }
        func.call @stack_push_pointer(%918) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %988 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %988 : i64
    }
    %989 = func.call @cc_nil_value() : () -> i64
    %990 = func.call @cc_errorp(%899) : (i64) -> i64
    %991 = arith.cmpi ne, %990, %989 : i64
    %992 = scf.if %991 -> (i64) {
      scf.yield %899 : i64
    } else {
      %993 = llvm.mlir.addressof @str111 : !llvm.ptr
      %994 = arith.constant 17 : i64
      %995 = func.call @cc_make_string(%993, %994) : (!llvm.ptr, i64) -> i64
      %996 = llvm.mlir.addressof @str112 : !llvm.ptr
      %997 = arith.constant 11 : i64
      %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
      %999 = func.call @cc_intern(%995, %998) : (i64, i64) -> i64
      %1000 = func.call @cc_nil_value() : () -> i64
      %1001 = func.call @cc_cons(%999, %1000) : (i64, i64) -> i64
      %1002 = func.call @cc_values_pack(%1001) : (i64) -> i64
      %1003 = func.call @cc_symbol_value(%999) : (i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %1004 = arith.addi %1003, %__rlasp_stack_elide_zero_44 : i64
      %1005 = func.call @cc_nil_value() : () -> i64
      %1006 = arith.cmpi ne, %1004, %1005 : i64
      scf.if %1006 {
        %1007 = func.call @cc_nil_value() : () -> i64
        %1008 = func.call @cc_nil_value() : () -> i64
        %1009 = func.call @cc_errorp(%1007) : (i64) -> i64
        %1010 = arith.cmpi ne, %1009, %1008 : i64
        %1011 = scf.if %1010 -> (i64) {
          scf.yield %1007 : i64
        } else {
          %1012 = llvm.mlir.addressof @str113 : !llvm.ptr
          %1013 = arith.constant 17 : i64
          %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
          %1015 = llvm.mlir.addressof @str114 : !llvm.ptr
          %1016 = arith.constant 11 : i64
          %1017 = func.call @cc_make_string(%1015, %1016) : (!llvm.ptr, i64) -> i64
          %1018 = func.call @cc_intern(%1014, %1017) : (i64, i64) -> i64
          %1019 = func.call @cc_nil_value() : () -> i64
          %1020 = func.call @cc_cons(%1018, %1019) : (i64, i64) -> i64
          %1021 = func.call @cc_values_pack(%1020) : (i64) -> i64
          %1022 = func.call @cc_symbol_value(%1018) : (i64) -> i64
          %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
          %1023 = arith.addi %1022, %__rlasp_stack_elide_zero_45 : i64
          %1024:1 = scf.while (%arg0 = %1023) : (i64) -> (i64) {
            %1025 = func.call @cc_is_cons(%arg0) : (i64) -> i32
            %1026 = arith.constant 0 : i32
            %1027 = arith.cmpi ne, %1025, %1026 : i32
            scf.condition(%1027) %arg0 : i64
          } do {
            ^bb0(%1028: i64):
            %1029 = func.call @cc_car(%1028) : (i64) -> i64
            %1030 = llvm.mlir.addressof @str115 : !llvm.ptr
            %1031 = arith.constant 4 : i64
            %1032 = func.call @cc_make_string(%1030, %1031) : (!llvm.ptr, i64) -> i64
            %1033 = llvm.mlir.addressof @str116 : !llvm.ptr
            %1034 = arith.constant 7 : i64
            %1035 = func.call @cc_make_string(%1033, %1034) : (!llvm.ptr, i64) -> i64
            %1036 = func.call @cc_intern(%1032, %1035) : (i64, i64) -> i64
            %1037 = func.call @cc_nil_value() : () -> i64
            %1038 = func.call @cc_cons(%1036, %1037) : (i64, i64) -> i64
            %1039 = func.call @cc_values_pack(%1038) : (i64) -> i64
            %1040 = llvm.mlir.addressof @str117 : !llvm.ptr
            %1041 = arith.constant 17 : i64
            %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
            %1043 = func.call @cc_nil_value() : () -> i64
            %1044 = func.call @cc_errorp(%1036) : (i64) -> i64
            %1045 = arith.cmpi ne, %1044, %1043 : i64
            %1046 = arith.cmpi eq, %1043, %1043 : i64
            %1047 = arith.andi %1045, %1046 : i1
            %1048 = scf.if %1047 -> (i64) {
              scf.yield %1036 : i64
            } else {
              scf.yield %1043 : i64
            }
            %1049 = func.call @cc_errorp(%1042) : (i64) -> i64
            %1050 = arith.cmpi ne, %1049, %1043 : i64
            %1051 = arith.cmpi eq, %1048, %1043 : i64
            %1052 = arith.andi %1050, %1051 : i1
            %1053 = scf.if %1052 -> (i64) {
              scf.yield %1042 : i64
            } else {
              scf.yield %1048 : i64
            }
            %1054 = func.call @cc_errorp(%1029) : (i64) -> i64
            %1055 = arith.cmpi ne, %1054, %1043 : i64
            %1056 = arith.cmpi eq, %1053, %1043 : i64
            %1057 = arith.andi %1055, %1056 : i1
            %1058 = scf.if %1057 -> (i64) {
              scf.yield %1029 : i64
            } else {
              scf.yield %1053 : i64
            }
            %1059 = arith.cmpi ne, %1058, %1043 : i64
            scf.if %1059 {
              func.call @stack_push_pointer(%1058) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1036) : (i64) -> ()
              func.call @stack_push_pointer(%1042) : (i64) -> ()
              func.call @stack_push_pointer(%1029) : (i64) -> ()
              %1060 = llvm.mlir.addressof @str118 : !llvm.ptr
              %1061 = func.call @cc_make_function_ref_const(%1060) : (!llvm.ptr) -> i64
              %1062 = arith.constant 3 : i64
              func.call @cc_funcall_stack(%1061, %1062) : (i64, i64) -> ()
            }
            %1063 = func.call @stack_depth() : () -> i64
            %1064 = arith.constant 0 : i64
            %1065 = arith.cmpi sgt, %1063, %1064 : i64
            scf.if %1065 {
              %1066 = func.call @stack_pop_pointer() : () -> i64
            }
            %1067 = func.call @cc_cdr(%1028) : (i64) -> i64
            scf.yield %1067 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %1068 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1068 : i64
        }
        func.call @stack_push_pointer(%1011) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1069 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1069 : i64
    }
    %1070 = func.call @cc_nil_value() : () -> i64
    %1071 = func.call @cc_errorp(%992) : (i64) -> i64
    %1072 = arith.cmpi ne, %1071, %1070 : i64
    %1073 = scf.if %1072 -> (i64) {
      scf.yield %992 : i64
    } else {
      %1074 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1075 = arith.constant 25 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      %1077 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1078 = arith.constant 11 : i64
      %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
      %1080 = func.call @cc_intern(%1076, %1079) : (i64, i64) -> i64
      %1081 = func.call @cc_nil_value() : () -> i64
      %1082 = func.call @cc_cons(%1080, %1081) : (i64, i64) -> i64
      %1083 = func.call @cc_values_pack(%1082) : (i64) -> i64
      %1084 = func.call @cc_symbol_value(%1080) : (i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1085 = arith.addi %1084, %__rlasp_stack_elide_zero_46 : i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_cons(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_not(%1087) : (i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1089 = arith.addi %1088, %__rlasp_stack_elide_zero_47 : i64
      scf.yield %1089 : i64
    }
    %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
    %1090 = arith.addi %1073, %__rlasp_stack_elide_zero_48 : i64
    %1091 = func.call @cc_multiple_value_list(%1090) : (i64) -> i64
    %1092 = llvm.mlir.addressof @str121 : !llvm.ptr
    %1093 = arith.constant 37 : i64
    %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
    %1095 = func.call @cc_nil_value() : () -> i64
    %1096 = func.call @cc_intern(%1094, %1095) : (i64, i64) -> i64
    %1097 = func.call @cc_nil_value() : () -> i64
    %1098 = func.call @cc_cons(%1096, %1097) : (i64, i64) -> i64
    %1099 = func.call @cc_values_pack(%1098) : (i64) -> i64
    %1100 = func.call @cc_symbol_value(%1096) : (i64) -> i64
    %1101 = llvm.mlir.addressof @str122 : !llvm.ptr
    %1102 = arith.constant 39 : i64
    %1103 = func.call @cc_make_string(%1101, %1102) : (!llvm.ptr, i64) -> i64
    %1104 = func.call @cc_nil_value() : () -> i64
    %1105 = func.call @cc_intern(%1103, %1104) : (i64, i64) -> i64
    %1106 = func.call @cc_nil_value() : () -> i64
    %1107 = func.call @cc_cons(%1105, %1106) : (i64, i64) -> i64
    %1108 = func.call @cc_values_pack(%1107) : (i64) -> i64
    %1109 = func.call @cc_symbol_value(%1105) : (i64) -> i64
    %1110 = func.call @cc_nil_value() : () -> i64
    %1111 = arith.cmpi ne, %1100, %1110 : i64
    %1112 = scf.if %1111 -> (i64) {
      scf.yield %1109 : i64
    } else {
      scf.yield %1091 : i64
    }
    %1113 = func.call @cc_values_pack(%1112) : (i64) -> i64
    func.call @stack_push_pointer(%1113) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%fail-test-with-error"() {
    %1114 = llvm.mlir.addressof @str123 : !llvm.ptr
    %1115 = arith.constant 21 : i64
    %1116 = func.call @cc_make_string(%1114, %1115) : (!llvm.ptr, i64) -> i64
    %1117 = func.call @cc_nil_value() : () -> i64
    %1118 = func.call @cc_intern(%1116, %1117) : (i64, i64) -> i64
    %1119 = func.call @cc_nil_value() : () -> i64
    %1120 = func.call @cc_cons(%1118, %1119) : (i64, i64) -> i64
    %1121 = func.call @cc_values_pack(%1120) : (i64) -> i64
    %1122 = llvm.mlir.addressof @str124 : !llvm.ptr
    %1123 = arith.constant 48 : i64
    %1124 = func.call @cc_make_string(%1122, %1123) : (!llvm.ptr, i64) -> i64
    %1125 = func.call @cc_register_function_lambda_list_metadata_raw(%1118, %1124) : (i64, i64) -> i64
    %1126 = func.call @stack_pop_pointer() : () -> i64
    %1127 = func.call @stack_pop_pointer() : () -> i64
    %1128 = func.call @stack_pop_pointer() : () -> i64
    %1129 = func.call @stack_pop_pointer() : () -> i64
    %1130 = func.call @stack_pop_pointer() : () -> i64
    %1131 = func.call @cc_nil_value() : () -> i64
    %1132 = llvm.mlir.addressof @str125 : !llvm.ptr
    %1133 = arith.constant 37 : i64
    %1134 = func.call @cc_make_string(%1132, %1133) : (!llvm.ptr, i64) -> i64
    %1135 = func.call @cc_nil_value() : () -> i64
    %1136 = func.call @cc_intern(%1134, %1135) : (i64, i64) -> i64
    %1137 = func.call @cc_nil_value() : () -> i64
    %1138 = func.call @cc_cons(%1136, %1137) : (i64, i64) -> i64
    %1139 = func.call @cc_values_pack(%1138) : (i64) -> i64
    %1140 = func.call @cc_set_symbol_value(%1136, %1131) : (i64, i64) -> i64
    %1141 = llvm.mlir.addressof @str126 : !llvm.ptr
    %1142 = arith.constant 38 : i64
    %1143 = func.call @cc_make_string(%1141, %1142) : (!llvm.ptr, i64) -> i64
    %1144 = func.call @cc_nil_value() : () -> i64
    %1145 = func.call @cc_intern(%1143, %1144) : (i64, i64) -> i64
    %1146 = func.call @cc_nil_value() : () -> i64
    %1147 = func.call @cc_cons(%1145, %1146) : (i64, i64) -> i64
    %1148 = func.call @cc_values_pack(%1147) : (i64) -> i64
    %1149 = func.call @cc_set_symbol_value(%1145, %1131) : (i64, i64) -> i64
    %1150 = llvm.mlir.addressof @str127 : !llvm.ptr
    %1151 = arith.constant 39 : i64
    %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
    %1153 = func.call @cc_nil_value() : () -> i64
    %1154 = func.call @cc_intern(%1152, %1153) : (i64, i64) -> i64
    %1155 = func.call @cc_nil_value() : () -> i64
    %1156 = func.call @cc_cons(%1154, %1155) : (i64, i64) -> i64
    %1157 = func.call @cc_values_pack(%1156) : (i64) -> i64
    %1158 = func.call @cc_set_symbol_value(%1154, %1131) : (i64, i64) -> i64
    %1159 = func.call @cc_nil_value() : () -> i64
    %1160 = func.call @cc_nil_value() : () -> i64
    %1161 = func.call @cc_errorp(%1159) : (i64) -> i64
    %1162 = arith.cmpi ne, %1161, %1160 : i64
    %1163 = scf.if %1162 -> (i64) {
      scf.yield %1159 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1164 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1164 : i64
    }
    %1165 = func.call @cc_nil_value() : () -> i64
    %1166 = func.call @cc_errorp(%1163) : (i64) -> i64
    %1167 = arith.cmpi ne, %1166, %1165 : i64
    %1168 = scf.if %1167 -> (i64) {
      scf.yield %1163 : i64
    } else {
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1169 = arith.addi %1130, %__rlasp_stack_elide_zero_49 : i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1170 = arith.addi %1127, %__rlasp_stack_elide_zero_50 : i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_errorp(%1169) : (i64) -> i64
      %1173 = arith.cmpi ne, %1172, %1171 : i64
      %1174 = arith.cmpi eq, %1171, %1171 : i64
      %1175 = arith.andi %1173, %1174 : i1
      %1176 = scf.if %1175 -> (i64) {
        scf.yield %1169 : i64
      } else {
        scf.yield %1171 : i64
      }
      %1177 = func.call @cc_errorp(%1170) : (i64) -> i64
      %1178 = arith.cmpi ne, %1177, %1171 : i64
      %1179 = arith.cmpi eq, %1176, %1171 : i64
      %1180 = arith.andi %1178, %1179 : i1
      %1181 = scf.if %1180 -> (i64) {
        scf.yield %1170 : i64
      } else {
        scf.yield %1176 : i64
      }
      %1182 = arith.cmpi ne, %1181, %1171 : i64
      scf.if %1182 {
        func.call @stack_push_pointer(%1181) : (i64) -> ()
      } else {
        %1183 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1183) : (i64) -> ()
        %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
        %1184 = arith.addi %1170, %__rlasp_stack_elide_zero_51 : i64
        %1185 = func.call @stack_pop_pointer() : () -> i64
        %1186 = func.call @cc_cons(%1184, %1185) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1186) : (i64) -> ()
        %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
        %1187 = arith.addi %1169, %__rlasp_stack_elide_zero_52 : i64
        %1188 = func.call @stack_pop_pointer() : () -> i64
        %1189 = func.call @cc_cons(%1187, %1188) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1189) : (i64) -> ()
      }
      %1190 = func.call @stack_pop_pointer() : () -> i64
      %1191 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1192 = arith.constant 20 : i64
      %1193 = func.call @cc_make_string(%1191, %1192) : (!llvm.ptr, i64) -> i64
      %1194 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1195 = arith.constant 11 : i64
      %1196 = func.call @cc_make_string(%1194, %1195) : (!llvm.ptr, i64) -> i64
      %1197 = func.call @cc_intern(%1193, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_nil_value() : () -> i64
      %1199 = func.call @cc_cons(%1197, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_values_pack(%1199) : (i64) -> i64
      %1201 = func.call @cc_symbol_value(%1197) : (i64) -> i64
      %1202 = func.call @cc_cons(%1190, %1201) : (i64, i64) -> i64
      %1203 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1204 = arith.constant 20 : i64
      %1205 = func.call @cc_make_string(%1203, %1204) : (!llvm.ptr, i64) -> i64
      %1206 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1207 = arith.constant 11 : i64
      %1208 = func.call @cc_make_string(%1206, %1207) : (!llvm.ptr, i64) -> i64
      %1209 = func.call @cc_intern(%1205, %1208) : (i64, i64) -> i64
      %1210 = func.call @cc_nil_value() : () -> i64
      %1211 = func.call @cc_cons(%1209, %1210) : (i64, i64) -> i64
      %1212 = func.call @cc_values_pack(%1211) : (i64) -> i64
      %1213 = func.call @cc_set_symbol_value(%1209, %1202) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1214 = arith.addi %1202, %__rlasp_stack_elide_zero_53 : i64
      scf.yield %1214 : i64
    }
    %1215 = func.call @cc_nil_value() : () -> i64
    %1216 = func.call @cc_errorp(%1168) : (i64) -> i64
    %1217 = arith.cmpi ne, %1216, %1215 : i64
    %1218 = scf.if %1217 -> (i64) {
      scf.yield %1168 : i64
    } else {
      func.call @stack_push_pointer(%1130) : (i64) -> ()
      %1219 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1220 = arith.constant 19 : i64
      %1221 = func.call @cc_make_string(%1219, %1220) : (!llvm.ptr, i64) -> i64
      %1222 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1223 = arith.constant 11 : i64
      %1224 = func.call @cc_make_string(%1222, %1223) : (!llvm.ptr, i64) -> i64
      %1225 = func.call @cc_intern(%1221, %1224) : (i64, i64) -> i64
      %1226 = func.call @cc_nil_value() : () -> i64
      %1227 = func.call @cc_cons(%1225, %1226) : (i64, i64) -> i64
      %1228 = func.call @cc_values_pack(%1227) : (i64) -> i64
      %1229 = func.call @cc_symbol_value(%1225) : (i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1230 = arith.addi %1229, %__rlasp_stack_elide_zero_54 : i64
      %1231 = func.call @stack_pop_pointer() : () -> i64
      %1232 = func.call @cc_member(%1231, %1230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1233 = arith.addi %1232, %__rlasp_stack_elide_zero_55 : i64
      %1234 = func.call @cc_nil_value() : () -> i64
      %1235 = arith.cmpi ne, %1233, %1234 : i64
      scf.if %1235 {
        %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
        %1236 = arith.addi %1130, %__rlasp_stack_elide_zero_56 : i64
        %1237 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1238 = arith.constant 23 : i64
        %1239 = func.call @cc_make_string(%1237, %1238) : (!llvm.ptr, i64) -> i64
        %1240 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1241 = arith.constant 11 : i64
        %1242 = func.call @cc_make_string(%1240, %1241) : (!llvm.ptr, i64) -> i64
        %1243 = func.call @cc_intern(%1239, %1242) : (i64, i64) -> i64
        %1244 = func.call @cc_nil_value() : () -> i64
        %1245 = func.call @cc_cons(%1243, %1244) : (i64, i64) -> i64
        %1246 = func.call @cc_values_pack(%1245) : (i64) -> i64
        %1247 = func.call @cc_symbol_value(%1243) : (i64) -> i64
        %1248 = func.call @cc_cons(%1236, %1247) : (i64, i64) -> i64
        %1249 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1250 = arith.constant 23 : i64
        %1251 = func.call @cc_make_string(%1249, %1250) : (!llvm.ptr, i64) -> i64
        %1252 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1253 = arith.constant 11 : i64
        %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
        %1255 = func.call @cc_intern(%1251, %1254) : (i64, i64) -> i64
        %1256 = func.call @cc_nil_value() : () -> i64
        %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
        %1258 = func.call @cc_values_pack(%1257) : (i64) -> i64
        %1259 = func.call @cc_set_symbol_value(%1255, %1248) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1248) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
        %1260 = arith.addi %1130, %__rlasp_stack_elide_zero_57 : i64
        %1261 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1262 = arith.constant 25 : i64
        %1263 = func.call @cc_make_string(%1261, %1262) : (!llvm.ptr, i64) -> i64
        %1264 = llvm.mlir.addressof @str139 : !llvm.ptr
        %1265 = arith.constant 11 : i64
        %1266 = func.call @cc_make_string(%1264, %1265) : (!llvm.ptr, i64) -> i64
        %1267 = func.call @cc_intern(%1263, %1266) : (i64, i64) -> i64
        %1268 = func.call @cc_nil_value() : () -> i64
        %1269 = func.call @cc_cons(%1267, %1268) : (i64, i64) -> i64
        %1270 = func.call @cc_values_pack(%1269) : (i64) -> i64
        %1271 = func.call @cc_symbol_value(%1267) : (i64) -> i64
        %1272 = func.call @cc_cons(%1260, %1271) : (i64, i64) -> i64
        %1273 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1274 = arith.constant 25 : i64
        %1275 = func.call @cc_make_string(%1273, %1274) : (!llvm.ptr, i64) -> i64
        %1276 = llvm.mlir.addressof @str141 : !llvm.ptr
        %1277 = arith.constant 11 : i64
        %1278 = func.call @cc_make_string(%1276, %1277) : (!llvm.ptr, i64) -> i64
        %1279 = func.call @cc_intern(%1275, %1278) : (i64, i64) -> i64
        %1280 = func.call @cc_nil_value() : () -> i64
        %1281 = func.call @cc_cons(%1279, %1280) : (i64, i64) -> i64
        %1282 = func.call @cc_values_pack(%1281) : (i64) -> i64
        %1283 = func.call @cc_set_symbol_value(%1279, %1272) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1272) : (i64) -> ()
      }
      %1284 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1284 : i64
    }
    %1285 = func.call @cc_nil_value() : () -> i64
    %1286 = func.call @cc_errorp(%1218) : (i64) -> i64
    %1287 = arith.cmpi ne, %1286, %1285 : i64
    %1288 = scf.if %1287 -> (i64) {
      scf.yield %1218 : i64
    } else {
      %1289 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1290 = arith.constant 3 : i64
      %1291 = func.call @cc_make_string(%1289, %1290) : (!llvm.ptr, i64) -> i64
      %1292 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1293 = arith.constant 7 : i64
      %1294 = func.call @cc_make_string(%1292, %1293) : (!llvm.ptr, i64) -> i64
      %1295 = func.call @cc_intern(%1291, %1294) : (i64, i64) -> i64
      %1296 = func.call @cc_nil_value() : () -> i64
      %1297 = func.call @cc_cons(%1295, %1296) : (i64, i64) -> i64
      %1298 = func.call @cc_values_pack(%1297) : (i64) -> i64
      %1299 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1300 = arith.constant 9 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = func.call @cc_nil_value() : () -> i64
      %1303 = func.call @cc_errorp(%1295) : (i64) -> i64
      %1304 = arith.cmpi ne, %1303, %1302 : i64
      %1305 = arith.cmpi eq, %1302, %1302 : i64
      %1306 = arith.andi %1304, %1305 : i1
      %1307 = scf.if %1306 -> (i64) {
        scf.yield %1295 : i64
      } else {
        scf.yield %1302 : i64
      }
      %1308 = func.call @cc_errorp(%1301) : (i64) -> i64
      %1309 = arith.cmpi ne, %1308, %1302 : i64
      %1310 = arith.cmpi eq, %1307, %1302 : i64
      %1311 = arith.andi %1309, %1310 : i1
      %1312 = scf.if %1311 -> (i64) {
        scf.yield %1301 : i64
      } else {
        scf.yield %1307 : i64
      }
      %1313 = func.call @cc_errorp(%1130) : (i64) -> i64
      %1314 = arith.cmpi ne, %1313, %1302 : i64
      %1315 = arith.cmpi eq, %1312, %1302 : i64
      %1316 = arith.andi %1314, %1315 : i1
      %1317 = scf.if %1316 -> (i64) {
        scf.yield %1130 : i64
      } else {
        scf.yield %1312 : i64
      }
      %1318 = arith.cmpi ne, %1317, %1302 : i64
      scf.if %1318 {
        func.call @stack_push_pointer(%1317) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1295) : (i64) -> ()
        func.call @stack_push_pointer(%1301) : (i64) -> ()
        func.call @stack_push_pointer(%1130) : (i64) -> ()
        %1319 = llvm.mlir.addressof @str145 : !llvm.ptr
        %1320 = func.call @cc_make_function_ref_const(%1319) : (!llvm.ptr) -> i64
        %1321 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1320, %1321) : (i64, i64) -> ()
      }
      %1322 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1322 : i64
    }
    %1323 = func.call @cc_nil_value() : () -> i64
    %1324 = func.call @cc_errorp(%1288) : (i64) -> i64
    %1325 = arith.cmpi ne, %1324, %1323 : i64
    %1326 = scf.if %1325 -> (i64) {
      scf.yield %1288 : i64
    } else {
      %1327 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1328 = arith.constant 4 : i64
      %1329 = func.call @cc_make_string(%1327, %1328) : (!llvm.ptr, i64) -> i64
      %1330 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1331 = arith.constant 7 : i64
      %1332 = func.call @cc_make_string(%1330, %1331) : (!llvm.ptr, i64) -> i64
      %1333 = func.call @cc_intern(%1329, %1332) : (i64, i64) -> i64
      %1334 = func.call @cc_nil_value() : () -> i64
      %1335 = func.call @cc_cons(%1333, %1334) : (i64, i64) -> i64
      %1336 = func.call @cc_values_pack(%1335) : (i64) -> i64
      %1337 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1338 = arith.constant 46 : i64
      %1339 = func.call @cc_make_string(%1337, %1338) : (!llvm.ptr, i64) -> i64
      %1340 = func.call @cc_nil_value() : () -> i64
      %1341 = func.call @cc_errorp(%1333) : (i64) -> i64
      %1342 = arith.cmpi ne, %1341, %1340 : i64
      %1343 = arith.cmpi eq, %1340, %1340 : i64
      %1344 = arith.andi %1342, %1343 : i1
      %1345 = scf.if %1344 -> (i64) {
        scf.yield %1333 : i64
      } else {
        scf.yield %1340 : i64
      }
      %1346 = func.call @cc_errorp(%1339) : (i64) -> i64
      %1347 = arith.cmpi ne, %1346, %1340 : i64
      %1348 = arith.cmpi eq, %1345, %1340 : i64
      %1349 = arith.andi %1347, %1348 : i1
      %1350 = scf.if %1349 -> (i64) {
        scf.yield %1339 : i64
      } else {
        scf.yield %1345 : i64
      }
      %1351 = func.call @cc_errorp(%1127) : (i64) -> i64
      %1352 = arith.cmpi ne, %1351, %1340 : i64
      %1353 = arith.cmpi eq, %1350, %1340 : i64
      %1354 = arith.andi %1352, %1353 : i1
      %1355 = scf.if %1354 -> (i64) {
        scf.yield %1127 : i64
      } else {
        scf.yield %1350 : i64
      }
      %1356 = func.call @cc_errorp(%1129) : (i64) -> i64
      %1357 = arith.cmpi ne, %1356, %1340 : i64
      %1358 = arith.cmpi eq, %1355, %1340 : i64
      %1359 = arith.andi %1357, %1358 : i1
      %1360 = scf.if %1359 -> (i64) {
        scf.yield %1129 : i64
      } else {
        scf.yield %1355 : i64
      }
      %1361 = arith.cmpi ne, %1360, %1340 : i64
      scf.if %1361 {
        func.call @stack_push_pointer(%1360) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1333) : (i64) -> ()
        func.call @stack_push_pointer(%1339) : (i64) -> ()
        func.call @stack_push_pointer(%1127) : (i64) -> ()
        func.call @stack_push_pointer(%1129) : (i64) -> ()
        %1362 = llvm.mlir.addressof @str149 : !llvm.ptr
        %1363 = func.call @cc_make_function_ref_const(%1362) : (!llvm.ptr) -> i64
        %1364 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%1363, %1364) : (i64, i64) -> ()
      }
      %1365 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1365 : i64
    }
    %1366 = func.call @cc_nil_value() : () -> i64
    %1367 = func.call @cc_errorp(%1326) : (i64) -> i64
    %1368 = arith.cmpi ne, %1367, %1366 : i64
    %1369 = scf.if %1368 -> (i64) {
      scf.yield %1326 : i64
    } else {
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1370 = arith.addi %1126, %__rlasp_stack_elide_zero_58 : i64
      %1371 = func.call @cc_nil_value() : () -> i64
      %1372 = arith.cmpi ne, %1370, %1371 : i64
      scf.if %1372 {
        %1373 = func.call @cc_nil_value() : () -> i64
        %1374 = func.call @cc_nil_value() : () -> i64
        %1375 = func.call @cc_errorp(%1373) : (i64) -> i64
        %1376 = arith.cmpi ne, %1375, %1374 : i64
        %1377 = scf.if %1376 -> (i64) {
          scf.yield %1373 : i64
        } else {
          %1378 = llvm.mlir.addressof @str150 : !llvm.ptr
          %1379 = arith.constant 4 : i64
          %1380 = func.call @cc_make_string(%1378, %1379) : (!llvm.ptr, i64) -> i64
          %1381 = llvm.mlir.addressof @str151 : !llvm.ptr
          %1382 = arith.constant 7 : i64
          %1383 = func.call @cc_make_string(%1381, %1382) : (!llvm.ptr, i64) -> i64
          %1384 = func.call @cc_intern(%1380, %1383) : (i64, i64) -> i64
          %1385 = func.call @cc_nil_value() : () -> i64
          %1386 = func.call @cc_cons(%1384, %1385) : (i64, i64) -> i64
          %1387 = func.call @cc_values_pack(%1386) : (i64) -> i64
          %1388 = llvm.mlir.addressof @str152 : !llvm.ptr
          %1389 = arith.constant 2 : i64
          %1390 = func.call @cc_make_string(%1388, %1389) : (!llvm.ptr, i64) -> i64
          %1391 = func.call @cc_nil_value() : () -> i64
          %1392 = func.call @cc_errorp(%1384) : (i64) -> i64
          %1393 = arith.cmpi ne, %1392, %1391 : i64
          %1394 = arith.cmpi eq, %1391, %1391 : i64
          %1395 = arith.andi %1393, %1394 : i1
          %1396 = scf.if %1395 -> (i64) {
            scf.yield %1384 : i64
          } else {
            scf.yield %1391 : i64
          }
          %1397 = func.call @cc_errorp(%1390) : (i64) -> i64
          %1398 = arith.cmpi ne, %1397, %1391 : i64
          %1399 = arith.cmpi eq, %1396, %1391 : i64
          %1400 = arith.andi %1398, %1399 : i1
          %1401 = scf.if %1400 -> (i64) {
            scf.yield %1390 : i64
          } else {
            scf.yield %1396 : i64
          }
          %1402 = func.call @cc_errorp(%1126) : (i64) -> i64
          %1403 = arith.cmpi ne, %1402, %1391 : i64
          %1404 = arith.cmpi eq, %1401, %1391 : i64
          %1405 = arith.andi %1403, %1404 : i1
          %1406 = scf.if %1405 -> (i64) {
            scf.yield %1126 : i64
          } else {
            scf.yield %1401 : i64
          }
          %1407 = arith.cmpi ne, %1406, %1391 : i64
          scf.if %1407 {
            func.call @stack_push_pointer(%1406) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1384) : (i64) -> ()
            func.call @stack_push_pointer(%1390) : (i64) -> ()
            func.call @stack_push_pointer(%1126) : (i64) -> ()
            %1408 = llvm.mlir.addressof @str153 : !llvm.ptr
            %1409 = func.call @cc_make_function_ref_const(%1408) : (!llvm.ptr) -> i64
            %1410 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%1409, %1410) : (i64, i64) -> ()
          }
          %1411 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1411 : i64
        }
        func.call @stack_push_pointer(%1377) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1412 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1412 : i64
    }
    %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
    %1413 = arith.addi %1369, %__rlasp_stack_elide_zero_59 : i64
    %1414 = func.call @cc_multiple_value_list(%1413) : (i64) -> i64
    %1415 = llvm.mlir.addressof @str154 : !llvm.ptr
    %1416 = arith.constant 37 : i64
    %1417 = func.call @cc_make_string(%1415, %1416) : (!llvm.ptr, i64) -> i64
    %1418 = func.call @cc_nil_value() : () -> i64
    %1419 = func.call @cc_intern(%1417, %1418) : (i64, i64) -> i64
    %1420 = func.call @cc_nil_value() : () -> i64
    %1421 = func.call @cc_cons(%1419, %1420) : (i64, i64) -> i64
    %1422 = func.call @cc_values_pack(%1421) : (i64) -> i64
    %1423 = func.call @cc_symbol_value(%1419) : (i64) -> i64
    %1424 = llvm.mlir.addressof @str155 : !llvm.ptr
    %1425 = arith.constant 39 : i64
    %1426 = func.call @cc_make_string(%1424, %1425) : (!llvm.ptr, i64) -> i64
    %1427 = func.call @cc_nil_value() : () -> i64
    %1428 = func.call @cc_intern(%1426, %1427) : (i64, i64) -> i64
    %1429 = func.call @cc_nil_value() : () -> i64
    %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
    %1431 = func.call @cc_values_pack(%1430) : (i64) -> i64
    %1432 = func.call @cc_symbol_value(%1428) : (i64) -> i64
    %1433 = func.call @cc_nil_value() : () -> i64
    %1434 = arith.cmpi ne, %1423, %1433 : i64
    %1435 = scf.if %1434 -> (i64) {
      scf.yield %1432 : i64
    } else {
      scf.yield %1414 : i64
    }
    %1436 = func.call @cc_values_pack(%1435) : (i64) -> i64
    func.call @stack_push_pointer(%1436) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%fail-test"() {
    %1437 = llvm.mlir.addressof @str156 : !llvm.ptr
    %1438 = arith.constant 10 : i64
    %1439 = func.call @cc_make_string(%1437, %1438) : (!llvm.ptr, i64) -> i64
    %1440 = func.call @cc_nil_value() : () -> i64
    %1441 = func.call @cc_intern(%1439, %1440) : (i64, i64) -> i64
    %1442 = func.call @cc_nil_value() : () -> i64
    %1443 = func.call @cc_cons(%1441, %1442) : (i64, i64) -> i64
    %1444 = func.call @cc_values_pack(%1443) : (i64) -> i64
    %1445 = llvm.mlir.addressof @str157 : !llvm.ptr
    %1446 = arith.constant 54 : i64
    %1447 = func.call @cc_make_string(%1445, %1446) : (!llvm.ptr, i64) -> i64
    %1448 = func.call @cc_register_function_lambda_list_metadata_raw(%1441, %1447) : (i64, i64) -> i64
    %1449 = func.call @stack_pop_pointer() : () -> i64
    %1450 = func.call @stack_pop_pointer() : () -> i64
    %1451 = func.call @stack_pop_pointer() : () -> i64
    %1452 = func.call @stack_pop_pointer() : () -> i64
    %1453 = func.call @stack_pop_pointer() : () -> i64
    %1454 = func.call @stack_pop_pointer() : () -> i64
    %1455 = func.call @cc_nil_value() : () -> i64
    %1456 = llvm.mlir.addressof @str158 : !llvm.ptr
    %1457 = arith.constant 37 : i64
    %1458 = func.call @cc_make_string(%1456, %1457) : (!llvm.ptr, i64) -> i64
    %1459 = func.call @cc_nil_value() : () -> i64
    %1460 = func.call @cc_intern(%1458, %1459) : (i64, i64) -> i64
    %1461 = func.call @cc_nil_value() : () -> i64
    %1462 = func.call @cc_cons(%1460, %1461) : (i64, i64) -> i64
    %1463 = func.call @cc_values_pack(%1462) : (i64) -> i64
    %1464 = func.call @cc_set_symbol_value(%1460, %1455) : (i64, i64) -> i64
    %1465 = llvm.mlir.addressof @str159 : !llvm.ptr
    %1466 = arith.constant 38 : i64
    %1467 = func.call @cc_make_string(%1465, %1466) : (!llvm.ptr, i64) -> i64
    %1468 = func.call @cc_nil_value() : () -> i64
    %1469 = func.call @cc_intern(%1467, %1468) : (i64, i64) -> i64
    %1470 = func.call @cc_nil_value() : () -> i64
    %1471 = func.call @cc_cons(%1469, %1470) : (i64, i64) -> i64
    %1472 = func.call @cc_values_pack(%1471) : (i64) -> i64
    %1473 = func.call @cc_set_symbol_value(%1469, %1455) : (i64, i64) -> i64
    %1474 = llvm.mlir.addressof @str160 : !llvm.ptr
    %1475 = arith.constant 39 : i64
    %1476 = func.call @cc_make_string(%1474, %1475) : (!llvm.ptr, i64) -> i64
    %1477 = func.call @cc_nil_value() : () -> i64
    %1478 = func.call @cc_intern(%1476, %1477) : (i64, i64) -> i64
    %1479 = func.call @cc_nil_value() : () -> i64
    %1480 = func.call @cc_cons(%1478, %1479) : (i64, i64) -> i64
    %1481 = func.call @cc_values_pack(%1480) : (i64) -> i64
    %1482 = func.call @cc_set_symbol_value(%1478, %1455) : (i64, i64) -> i64
    %1483 = func.call @cc_nil_value() : () -> i64
    %1484 = func.call @cc_nil_value() : () -> i64
    %1485 = func.call @cc_errorp(%1483) : (i64) -> i64
    %1486 = arith.cmpi ne, %1485, %1484 : i64
    %1487 = scf.if %1486 -> (i64) {
      scf.yield %1483 : i64
    } else {
      func.call @stack_push_pointer(%1454) : (i64) -> ()
      %1488 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1489 = arith.constant 19 : i64
      %1490 = func.call @cc_make_string(%1488, %1489) : (!llvm.ptr, i64) -> i64
      %1491 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1492 = arith.constant 11 : i64
      %1493 = func.call @cc_make_string(%1491, %1492) : (!llvm.ptr, i64) -> i64
      %1494 = func.call @cc_intern(%1490, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_nil_value() : () -> i64
      %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_values_pack(%1496) : (i64) -> i64
      %1498 = func.call @cc_symbol_value(%1494) : (i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1499 = arith.addi %1498, %__rlasp_stack_elide_zero_60 : i64
      %1500 = func.call @stack_pop_pointer() : () -> i64
      %1501 = func.call @cc_member(%1500, %1499) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1502 = arith.addi %1501, %__rlasp_stack_elide_zero_61 : i64
      %1503 = func.call @cc_nil_value() : () -> i64
      %1504 = arith.cmpi ne, %1502, %1503 : i64
      scf.if %1504 {
        %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
        %1505 = arith.addi %1454, %__rlasp_stack_elide_zero_62 : i64
        %1506 = llvm.mlir.addressof @str163 : !llvm.ptr
        %1507 = arith.constant 23 : i64
        %1508 = func.call @cc_make_string(%1506, %1507) : (!llvm.ptr, i64) -> i64
        %1509 = llvm.mlir.addressof @str164 : !llvm.ptr
        %1510 = arith.constant 11 : i64
        %1511 = func.call @cc_make_string(%1509, %1510) : (!llvm.ptr, i64) -> i64
        %1512 = func.call @cc_intern(%1508, %1511) : (i64, i64) -> i64
        %1513 = func.call @cc_nil_value() : () -> i64
        %1514 = func.call @cc_cons(%1512, %1513) : (i64, i64) -> i64
        %1515 = func.call @cc_values_pack(%1514) : (i64) -> i64
        %1516 = func.call @cc_symbol_value(%1512) : (i64) -> i64
        %1517 = func.call @cc_cons(%1505, %1516) : (i64, i64) -> i64
        %1518 = llvm.mlir.addressof @str165 : !llvm.ptr
        %1519 = arith.constant 23 : i64
        %1520 = func.call @cc_make_string(%1518, %1519) : (!llvm.ptr, i64) -> i64
        %1521 = llvm.mlir.addressof @str166 : !llvm.ptr
        %1522 = arith.constant 11 : i64
        %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
        %1524 = func.call @cc_intern(%1520, %1523) : (i64, i64) -> i64
        %1525 = func.call @cc_nil_value() : () -> i64
        %1526 = func.call @cc_cons(%1524, %1525) : (i64, i64) -> i64
        %1527 = func.call @cc_values_pack(%1526) : (i64) -> i64
        %1528 = func.call @cc_set_symbol_value(%1524, %1517) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1517) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
        %1529 = arith.addi %1454, %__rlasp_stack_elide_zero_63 : i64
        %1530 = llvm.mlir.addressof @str167 : !llvm.ptr
        %1531 = arith.constant 25 : i64
        %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
        %1533 = llvm.mlir.addressof @str168 : !llvm.ptr
        %1534 = arith.constant 11 : i64
        %1535 = func.call @cc_make_string(%1533, %1534) : (!llvm.ptr, i64) -> i64
        %1536 = func.call @cc_intern(%1532, %1535) : (i64, i64) -> i64
        %1537 = func.call @cc_nil_value() : () -> i64
        %1538 = func.call @cc_cons(%1536, %1537) : (i64, i64) -> i64
        %1539 = func.call @cc_values_pack(%1538) : (i64) -> i64
        %1540 = func.call @cc_symbol_value(%1536) : (i64) -> i64
        %1541 = func.call @cc_cons(%1529, %1540) : (i64, i64) -> i64
        %1542 = llvm.mlir.addressof @str169 : !llvm.ptr
        %1543 = arith.constant 25 : i64
        %1544 = func.call @cc_make_string(%1542, %1543) : (!llvm.ptr, i64) -> i64
        %1545 = llvm.mlir.addressof @str170 : !llvm.ptr
        %1546 = arith.constant 11 : i64
        %1547 = func.call @cc_make_string(%1545, %1546) : (!llvm.ptr, i64) -> i64
        %1548 = func.call @cc_intern(%1544, %1547) : (i64, i64) -> i64
        %1549 = func.call @cc_nil_value() : () -> i64
        %1550 = func.call @cc_cons(%1548, %1549) : (i64, i64) -> i64
        %1551 = func.call @cc_values_pack(%1550) : (i64) -> i64
        %1552 = func.call @cc_set_symbol_value(%1548, %1541) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1541) : (i64) -> ()
      }
      %1553 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1553 : i64
    }
    %1554 = func.call @cc_nil_value() : () -> i64
    %1555 = func.call @cc_errorp(%1487) : (i64) -> i64
    %1556 = arith.cmpi ne, %1555, %1554 : i64
    %1557 = scf.if %1556 -> (i64) {
      scf.yield %1487 : i64
    } else {
      %1558 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1559 = arith.constant 3 : i64
      %1560 = func.call @cc_make_string(%1558, %1559) : (!llvm.ptr, i64) -> i64
      %1561 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1562 = arith.constant 7 : i64
      %1563 = func.call @cc_make_string(%1561, %1562) : (!llvm.ptr, i64) -> i64
      %1564 = func.call @cc_intern(%1560, %1563) : (i64, i64) -> i64
      %1565 = func.call @cc_nil_value() : () -> i64
      %1566 = func.call @cc_cons(%1564, %1565) : (i64, i64) -> i64
      %1567 = func.call @cc_values_pack(%1566) : (i64) -> i64
      %1568 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1569 = arith.constant 9 : i64
      %1570 = func.call @cc_make_string(%1568, %1569) : (!llvm.ptr, i64) -> i64
      %1571 = func.call @cc_nil_value() : () -> i64
      %1572 = func.call @cc_errorp(%1564) : (i64) -> i64
      %1573 = arith.cmpi ne, %1572, %1571 : i64
      %1574 = arith.cmpi eq, %1571, %1571 : i64
      %1575 = arith.andi %1573, %1574 : i1
      %1576 = scf.if %1575 -> (i64) {
        scf.yield %1564 : i64
      } else {
        scf.yield %1571 : i64
      }
      %1577 = func.call @cc_errorp(%1570) : (i64) -> i64
      %1578 = arith.cmpi ne, %1577, %1571 : i64
      %1579 = arith.cmpi eq, %1576, %1571 : i64
      %1580 = arith.andi %1578, %1579 : i1
      %1581 = scf.if %1580 -> (i64) {
        scf.yield %1570 : i64
      } else {
        scf.yield %1576 : i64
      }
      %1582 = func.call @cc_errorp(%1454) : (i64) -> i64
      %1583 = arith.cmpi ne, %1582, %1571 : i64
      %1584 = arith.cmpi eq, %1581, %1571 : i64
      %1585 = arith.andi %1583, %1584 : i1
      %1586 = scf.if %1585 -> (i64) {
        scf.yield %1454 : i64
      } else {
        scf.yield %1581 : i64
      }
      %1587 = arith.cmpi ne, %1586, %1571 : i64
      scf.if %1587 {
        func.call @stack_push_pointer(%1586) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1564) : (i64) -> ()
        func.call @stack_push_pointer(%1570) : (i64) -> ()
        func.call @stack_push_pointer(%1454) : (i64) -> ()
        %1588 = llvm.mlir.addressof @str174 : !llvm.ptr
        %1589 = func.call @cc_make_function_ref_const(%1588) : (!llvm.ptr) -> i64
        %1590 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1589, %1590) : (i64, i64) -> ()
      }
      %1591 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1591 : i64
    }
    %1592 = func.call @cc_nil_value() : () -> i64
    %1593 = func.call @cc_errorp(%1557) : (i64) -> i64
    %1594 = arith.cmpi ne, %1593, %1592 : i64
    %1595 = scf.if %1594 -> (i64) {
      scf.yield %1557 : i64
    } else {
      %1596 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1597 = arith.constant 4 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1600 = arith.constant 7 : i64
      %1601 = func.call @cc_make_string(%1599, %1600) : (!llvm.ptr, i64) -> i64
      %1602 = func.call @cc_intern(%1598, %1601) : (i64, i64) -> i64
      %1603 = func.call @cc_nil_value() : () -> i64
      %1604 = func.call @cc_cons(%1602, %1603) : (i64, i64) -> i64
      %1605 = func.call @cc_values_pack(%1604) : (i64) -> i64
      %1606 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1607 = arith.constant 50 : i64
      %1608 = func.call @cc_make_string(%1606, %1607) : (!llvm.ptr, i64) -> i64
      %1609 = func.call @cc_nil_value() : () -> i64
      %1610 = func.call @cc_errorp(%1602) : (i64) -> i64
      %1611 = arith.cmpi ne, %1610, %1609 : i64
      %1612 = arith.cmpi eq, %1609, %1609 : i64
      %1613 = arith.andi %1611, %1612 : i1
      %1614 = scf.if %1613 -> (i64) {
        scf.yield %1602 : i64
      } else {
        scf.yield %1609 : i64
      }
      %1615 = func.call @cc_errorp(%1608) : (i64) -> i64
      %1616 = arith.cmpi ne, %1615, %1609 : i64
      %1617 = arith.cmpi eq, %1614, %1609 : i64
      %1618 = arith.andi %1616, %1617 : i1
      %1619 = scf.if %1618 -> (i64) {
        scf.yield %1608 : i64
      } else {
        scf.yield %1614 : i64
      }
      %1620 = func.call @cc_errorp(%1449) : (i64) -> i64
      %1621 = arith.cmpi ne, %1620, %1609 : i64
      %1622 = arith.cmpi eq, %1619, %1609 : i64
      %1623 = arith.andi %1621, %1622 : i1
      %1624 = scf.if %1623 -> (i64) {
        scf.yield %1449 : i64
      } else {
        scf.yield %1619 : i64
      }
      %1625 = func.call @cc_errorp(%1452) : (i64) -> i64
      %1626 = arith.cmpi ne, %1625, %1609 : i64
      %1627 = arith.cmpi eq, %1624, %1609 : i64
      %1628 = arith.andi %1626, %1627 : i1
      %1629 = scf.if %1628 -> (i64) {
        scf.yield %1452 : i64
      } else {
        scf.yield %1624 : i64
      }
      %1630 = func.call @cc_errorp(%1451) : (i64) -> i64
      %1631 = arith.cmpi ne, %1630, %1609 : i64
      %1632 = arith.cmpi eq, %1629, %1609 : i64
      %1633 = arith.andi %1631, %1632 : i1
      %1634 = scf.if %1633 -> (i64) {
        scf.yield %1451 : i64
      } else {
        scf.yield %1629 : i64
      }
      %1635 = arith.cmpi ne, %1634, %1609 : i64
      scf.if %1635 {
        func.call @stack_push_pointer(%1634) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1602) : (i64) -> ()
        func.call @stack_push_pointer(%1608) : (i64) -> ()
        func.call @stack_push_pointer(%1449) : (i64) -> ()
        func.call @stack_push_pointer(%1452) : (i64) -> ()
        func.call @stack_push_pointer(%1451) : (i64) -> ()
        %1636 = llvm.mlir.addressof @str178 : !llvm.ptr
        %1637 = func.call @cc_make_function_ref_const(%1636) : (!llvm.ptr) -> i64
        %1638 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1637, %1638) : (i64, i64) -> ()
      }
      %1639 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1639 : i64
    }
    %1640 = func.call @cc_nil_value() : () -> i64
    %1641 = func.call @cc_errorp(%1595) : (i64) -> i64
    %1642 = arith.cmpi ne, %1641, %1640 : i64
    %1643 = scf.if %1642 -> (i64) {
      scf.yield %1595 : i64
    } else {
      %1644 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1645 = arith.constant 4 : i64
      %1646 = func.call @cc_make_string(%1644, %1645) : (!llvm.ptr, i64) -> i64
      %1647 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1648 = arith.constant 7 : i64
      %1649 = func.call @cc_make_string(%1647, %1648) : (!llvm.ptr, i64) -> i64
      %1650 = func.call @cc_intern(%1646, %1649) : (i64, i64) -> i64
      %1651 = func.call @cc_nil_value() : () -> i64
      %1652 = func.call @cc_cons(%1650, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_values_pack(%1652) : (i64) -> i64
      %1654 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1655 = arith.constant 24 : i64
      %1656 = func.call @cc_make_string(%1654, %1655) : (!llvm.ptr, i64) -> i64
      %1657 = func.call @cc_nil_value() : () -> i64
      %1658 = func.call @cc_errorp(%1650) : (i64) -> i64
      %1659 = arith.cmpi ne, %1658, %1657 : i64
      %1660 = arith.cmpi eq, %1657, %1657 : i64
      %1661 = arith.andi %1659, %1660 : i1
      %1662 = scf.if %1661 -> (i64) {
        scf.yield %1650 : i64
      } else {
        scf.yield %1657 : i64
      }
      %1663 = func.call @cc_errorp(%1656) : (i64) -> i64
      %1664 = arith.cmpi ne, %1663, %1657 : i64
      %1665 = arith.cmpi eq, %1662, %1657 : i64
      %1666 = arith.andi %1664, %1665 : i1
      %1667 = scf.if %1666 -> (i64) {
        scf.yield %1656 : i64
      } else {
        scf.yield %1662 : i64
      }
      %1668 = func.call @cc_errorp(%1453) : (i64) -> i64
      %1669 = arith.cmpi ne, %1668, %1657 : i64
      %1670 = arith.cmpi eq, %1667, %1657 : i64
      %1671 = arith.andi %1669, %1670 : i1
      %1672 = scf.if %1671 -> (i64) {
        scf.yield %1453 : i64
      } else {
        scf.yield %1667 : i64
      }
      %1673 = arith.cmpi ne, %1672, %1657 : i64
      scf.if %1673 {
        func.call @stack_push_pointer(%1672) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1650) : (i64) -> ()
        func.call @stack_push_pointer(%1656) : (i64) -> ()
        func.call @stack_push_pointer(%1453) : (i64) -> ()
        %1674 = llvm.mlir.addressof @str182 : !llvm.ptr
        %1675 = func.call @cc_make_function_ref_const(%1674) : (!llvm.ptr) -> i64
        %1676 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1675, %1676) : (i64, i64) -> ()
      }
      %1677 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1677 : i64
    }
    %1678 = func.call @cc_nil_value() : () -> i64
    %1679 = func.call @cc_errorp(%1643) : (i64) -> i64
    %1680 = arith.cmpi ne, %1679, %1678 : i64
    %1681 = scf.if %1680 -> (i64) {
      scf.yield %1643 : i64
    } else {
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1682 = arith.addi %1450, %__rlasp_stack_elide_zero_64 : i64
      %1683 = func.call @cc_nil_value() : () -> i64
      %1684 = arith.cmpi ne, %1682, %1683 : i64
      scf.if %1684 {
        %1685 = func.call @cc_nil_value() : () -> i64
        %1686 = func.call @cc_nil_value() : () -> i64
        %1687 = func.call @cc_errorp(%1685) : (i64) -> i64
        %1688 = arith.cmpi ne, %1687, %1686 : i64
        %1689 = scf.if %1688 -> (i64) {
          scf.yield %1685 : i64
        } else {
          %1690 = llvm.mlir.addressof @str183 : !llvm.ptr
          %1691 = arith.constant 4 : i64
          %1692 = func.call @cc_make_string(%1690, %1691) : (!llvm.ptr, i64) -> i64
          %1693 = llvm.mlir.addressof @str184 : !llvm.ptr
          %1694 = arith.constant 7 : i64
          %1695 = func.call @cc_make_string(%1693, %1694) : (!llvm.ptr, i64) -> i64
          %1696 = func.call @cc_intern(%1692, %1695) : (i64, i64) -> i64
          %1697 = func.call @cc_nil_value() : () -> i64
          %1698 = func.call @cc_cons(%1696, %1697) : (i64, i64) -> i64
          %1699 = func.call @cc_values_pack(%1698) : (i64) -> i64
          %1700 = llvm.mlir.addressof @str185 : !llvm.ptr
          %1701 = arith.constant 2 : i64
          %1702 = func.call @cc_make_string(%1700, %1701) : (!llvm.ptr, i64) -> i64
          %1703 = func.call @cc_nil_value() : () -> i64
          %1704 = func.call @cc_errorp(%1696) : (i64) -> i64
          %1705 = arith.cmpi ne, %1704, %1703 : i64
          %1706 = arith.cmpi eq, %1703, %1703 : i64
          %1707 = arith.andi %1705, %1706 : i1
          %1708 = scf.if %1707 -> (i64) {
            scf.yield %1696 : i64
          } else {
            scf.yield %1703 : i64
          }
          %1709 = func.call @cc_errorp(%1702) : (i64) -> i64
          %1710 = arith.cmpi ne, %1709, %1703 : i64
          %1711 = arith.cmpi eq, %1708, %1703 : i64
          %1712 = arith.andi %1710, %1711 : i1
          %1713 = scf.if %1712 -> (i64) {
            scf.yield %1702 : i64
          } else {
            scf.yield %1708 : i64
          }
          %1714 = func.call @cc_errorp(%1450) : (i64) -> i64
          %1715 = arith.cmpi ne, %1714, %1703 : i64
          %1716 = arith.cmpi eq, %1713, %1703 : i64
          %1717 = arith.andi %1715, %1716 : i1
          %1718 = scf.if %1717 -> (i64) {
            scf.yield %1450 : i64
          } else {
            scf.yield %1713 : i64
          }
          %1719 = arith.cmpi ne, %1718, %1703 : i64
          scf.if %1719 {
            func.call @stack_push_pointer(%1718) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1696) : (i64) -> ()
            func.call @stack_push_pointer(%1702) : (i64) -> ()
            func.call @stack_push_pointer(%1450) : (i64) -> ()
            %1720 = llvm.mlir.addressof @str186 : !llvm.ptr
            %1721 = func.call @cc_make_function_ref_const(%1720) : (!llvm.ptr) -> i64
            %1722 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%1721, %1722) : (i64, i64) -> ()
          }
          %1723 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1723 : i64
        }
        func.call @stack_push_pointer(%1689) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1724 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1724 : i64
    }
    %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
    %1725 = arith.addi %1681, %__rlasp_stack_elide_zero_65 : i64
    %1726 = func.call @cc_multiple_value_list(%1725) : (i64) -> i64
    %1727 = llvm.mlir.addressof @str187 : !llvm.ptr
    %1728 = arith.constant 37 : i64
    %1729 = func.call @cc_make_string(%1727, %1728) : (!llvm.ptr, i64) -> i64
    %1730 = func.call @cc_nil_value() : () -> i64
    %1731 = func.call @cc_intern(%1729, %1730) : (i64, i64) -> i64
    %1732 = func.call @cc_nil_value() : () -> i64
    %1733 = func.call @cc_cons(%1731, %1732) : (i64, i64) -> i64
    %1734 = func.call @cc_values_pack(%1733) : (i64) -> i64
    %1735 = func.call @cc_symbol_value(%1731) : (i64) -> i64
    %1736 = llvm.mlir.addressof @str188 : !llvm.ptr
    %1737 = arith.constant 39 : i64
    %1738 = func.call @cc_make_string(%1736, %1737) : (!llvm.ptr, i64) -> i64
    %1739 = func.call @cc_nil_value() : () -> i64
    %1740 = func.call @cc_intern(%1738, %1739) : (i64, i64) -> i64
    %1741 = func.call @cc_nil_value() : () -> i64
    %1742 = func.call @cc_cons(%1740, %1741) : (i64, i64) -> i64
    %1743 = func.call @cc_values_pack(%1742) : (i64) -> i64
    %1744 = func.call @cc_symbol_value(%1740) : (i64) -> i64
    %1745 = func.call @cc_nil_value() : () -> i64
    %1746 = arith.cmpi ne, %1735, %1745 : i64
    %1747 = scf.if %1746 -> (i64) {
      scf.yield %1744 : i64
    } else {
      scf.yield %1726 : i64
    }
    %1748 = func.call @cc_values_pack(%1747) : (i64) -> i64
    func.call @stack_push_pointer(%1748) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%succeed-test"() {
    %1749 = llvm.mlir.addressof @str189 : !llvm.ptr
    %1750 = arith.constant 13 : i64
    %1751 = func.call @cc_make_string(%1749, %1750) : (!llvm.ptr, i64) -> i64
    %1752 = func.call @cc_nil_value() : () -> i64
    %1753 = func.call @cc_intern(%1751, %1752) : (i64, i64) -> i64
    %1754 = func.call @cc_nil_value() : () -> i64
    %1755 = func.call @cc_cons(%1753, %1754) : (i64, i64) -> i64
    %1756 = func.call @cc_values_pack(%1755) : (i64) -> i64
    %1757 = llvm.mlir.addressof @str190 : !llvm.ptr
    %1758 = arith.constant 4 : i64
    %1759 = func.call @cc_make_string(%1757, %1758) : (!llvm.ptr, i64) -> i64
    %1760 = func.call @cc_register_function_lambda_list_metadata_raw(%1753, %1759) : (i64, i64) -> i64
    %1761 = func.call @stack_pop_pointer() : () -> i64
    %1762 = func.call @cc_nil_value() : () -> i64
    %1763 = llvm.mlir.addressof @str191 : !llvm.ptr
    %1764 = arith.constant 37 : i64
    %1765 = func.call @cc_make_string(%1763, %1764) : (!llvm.ptr, i64) -> i64
    %1766 = func.call @cc_nil_value() : () -> i64
    %1767 = func.call @cc_intern(%1765, %1766) : (i64, i64) -> i64
    %1768 = func.call @cc_nil_value() : () -> i64
    %1769 = func.call @cc_cons(%1767, %1768) : (i64, i64) -> i64
    %1770 = func.call @cc_values_pack(%1769) : (i64) -> i64
    %1771 = func.call @cc_set_symbol_value(%1767, %1762) : (i64, i64) -> i64
    %1772 = llvm.mlir.addressof @str192 : !llvm.ptr
    %1773 = arith.constant 38 : i64
    %1774 = func.call @cc_make_string(%1772, %1773) : (!llvm.ptr, i64) -> i64
    %1775 = func.call @cc_nil_value() : () -> i64
    %1776 = func.call @cc_intern(%1774, %1775) : (i64, i64) -> i64
    %1777 = func.call @cc_nil_value() : () -> i64
    %1778 = func.call @cc_cons(%1776, %1777) : (i64, i64) -> i64
    %1779 = func.call @cc_values_pack(%1778) : (i64) -> i64
    %1780 = func.call @cc_set_symbol_value(%1776, %1762) : (i64, i64) -> i64
    %1781 = llvm.mlir.addressof @str193 : !llvm.ptr
    %1782 = arith.constant 39 : i64
    %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
    %1784 = func.call @cc_nil_value() : () -> i64
    %1785 = func.call @cc_intern(%1783, %1784) : (i64, i64) -> i64
    %1786 = func.call @cc_nil_value() : () -> i64
    %1787 = func.call @cc_cons(%1785, %1786) : (i64, i64) -> i64
    %1788 = func.call @cc_values_pack(%1787) : (i64) -> i64
    %1789 = func.call @cc_set_symbol_value(%1785, %1762) : (i64, i64) -> i64
    %1790 = func.call @cc_nil_value() : () -> i64
    %1791 = func.call @cc_nil_value() : () -> i64
    %1792 = func.call @cc_errorp(%1790) : (i64) -> i64
    %1793 = arith.cmpi ne, %1792, %1791 : i64
    %1794 = scf.if %1793 -> (i64) {
      scf.yield %1790 : i64
    } else {
      func.call @stack_push_pointer(%1761) : (i64) -> ()
      %1795 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1796 = arith.constant 19 : i64
      %1797 = func.call @cc_make_string(%1795, %1796) : (!llvm.ptr, i64) -> i64
      %1798 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1799 = arith.constant 11 : i64
      %1800 = func.call @cc_make_string(%1798, %1799) : (!llvm.ptr, i64) -> i64
      %1801 = func.call @cc_intern(%1797, %1800) : (i64, i64) -> i64
      %1802 = func.call @cc_nil_value() : () -> i64
      %1803 = func.call @cc_cons(%1801, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_values_pack(%1803) : (i64) -> i64
      %1805 = func.call @cc_symbol_value(%1801) : (i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1806 = arith.addi %1805, %__rlasp_stack_elide_zero_66 : i64
      %1807 = func.call @stack_pop_pointer() : () -> i64
      %1808 = func.call @cc_member(%1807, %1806) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1809 = arith.addi %1808, %__rlasp_stack_elide_zero_67 : i64
      %1810 = func.call @cc_nil_value() : () -> i64
      %1811 = arith.cmpi ne, %1809, %1810 : i64
      scf.if %1811 {
        %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
        %1812 = arith.addi %1761, %__rlasp_stack_elide_zero_68 : i64
        %1813 = llvm.mlir.addressof @str196 : !llvm.ptr
        %1814 = arith.constant 25 : i64
        %1815 = func.call @cc_make_string(%1813, %1814) : (!llvm.ptr, i64) -> i64
        %1816 = llvm.mlir.addressof @str197 : !llvm.ptr
        %1817 = arith.constant 11 : i64
        %1818 = func.call @cc_make_string(%1816, %1817) : (!llvm.ptr, i64) -> i64
        %1819 = func.call @cc_intern(%1815, %1818) : (i64, i64) -> i64
        %1820 = func.call @cc_nil_value() : () -> i64
        %1821 = func.call @cc_cons(%1819, %1820) : (i64, i64) -> i64
        %1822 = func.call @cc_values_pack(%1821) : (i64) -> i64
        %1823 = func.call @cc_symbol_value(%1819) : (i64) -> i64
        %1824 = func.call @cc_cons(%1812, %1823) : (i64, i64) -> i64
        %1825 = llvm.mlir.addressof @str198 : !llvm.ptr
        %1826 = arith.constant 25 : i64
        %1827 = func.call @cc_make_string(%1825, %1826) : (!llvm.ptr, i64) -> i64
        %1828 = llvm.mlir.addressof @str199 : !llvm.ptr
        %1829 = arith.constant 11 : i64
        %1830 = func.call @cc_make_string(%1828, %1829) : (!llvm.ptr, i64) -> i64
        %1831 = func.call @cc_intern(%1827, %1830) : (i64, i64) -> i64
        %1832 = func.call @cc_nil_value() : () -> i64
        %1833 = func.call @cc_cons(%1831, %1832) : (i64, i64) -> i64
        %1834 = func.call @cc_values_pack(%1833) : (i64) -> i64
        %1835 = func.call @cc_set_symbol_value(%1831, %1824) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1824) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
        %1836 = arith.addi %1761, %__rlasp_stack_elide_zero_69 : i64
        %1837 = llvm.mlir.addressof @str200 : !llvm.ptr
        %1838 = arith.constant 23 : i64
        %1839 = func.call @cc_make_string(%1837, %1838) : (!llvm.ptr, i64) -> i64
        %1840 = llvm.mlir.addressof @str201 : !llvm.ptr
        %1841 = arith.constant 11 : i64
        %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
        %1843 = func.call @cc_intern(%1839, %1842) : (i64, i64) -> i64
        %1844 = func.call @cc_nil_value() : () -> i64
        %1845 = func.call @cc_cons(%1843, %1844) : (i64, i64) -> i64
        %1846 = func.call @cc_values_pack(%1845) : (i64) -> i64
        %1847 = func.call @cc_symbol_value(%1843) : (i64) -> i64
        %1848 = func.call @cc_cons(%1836, %1847) : (i64, i64) -> i64
        %1849 = llvm.mlir.addressof @str202 : !llvm.ptr
        %1850 = arith.constant 23 : i64
        %1851 = func.call @cc_make_string(%1849, %1850) : (!llvm.ptr, i64) -> i64
        %1852 = llvm.mlir.addressof @str203 : !llvm.ptr
        %1853 = arith.constant 11 : i64
        %1854 = func.call @cc_make_string(%1852, %1853) : (!llvm.ptr, i64) -> i64
        %1855 = func.call @cc_intern(%1851, %1854) : (i64, i64) -> i64
        %1856 = func.call @cc_nil_value() : () -> i64
        %1857 = func.call @cc_cons(%1855, %1856) : (i64, i64) -> i64
        %1858 = func.call @cc_values_pack(%1857) : (i64) -> i64
        %1859 = func.call @cc_set_symbol_value(%1855, %1848) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1848) : (i64) -> ()
      }
      %1860 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1860 : i64
    }
    %1861 = func.call @cc_nil_value() : () -> i64
    %1862 = func.call @cc_errorp(%1794) : (i64) -> i64
    %1863 = arith.cmpi ne, %1862, %1861 : i64
    %1864 = scf.if %1863 -> (i64) {
      scf.yield %1794 : i64
    } else {
      %1865 = llvm.mlir.addressof @str204 : !llvm.ptr
      %1866 = arith.constant 4 : i64
      %1867 = func.call @cc_make_string(%1865, %1866) : (!llvm.ptr, i64) -> i64
      %1868 = llvm.mlir.addressof @str205 : !llvm.ptr
      %1869 = arith.constant 7 : i64
      %1870 = func.call @cc_make_string(%1868, %1869) : (!llvm.ptr, i64) -> i64
      %1871 = func.call @cc_intern(%1867, %1870) : (i64, i64) -> i64
      %1872 = func.call @cc_nil_value() : () -> i64
      %1873 = func.call @cc_cons(%1871, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_values_pack(%1873) : (i64) -> i64
      %1875 = llvm.mlir.addressof @str206 : !llvm.ptr
      %1876 = arith.constant 9 : i64
      %1877 = func.call @cc_make_string(%1875, %1876) : (!llvm.ptr, i64) -> i64
      %1878 = func.call @cc_nil_value() : () -> i64
      %1879 = func.call @cc_errorp(%1871) : (i64) -> i64
      %1880 = arith.cmpi ne, %1879, %1878 : i64
      %1881 = arith.cmpi eq, %1878, %1878 : i64
      %1882 = arith.andi %1880, %1881 : i1
      %1883 = scf.if %1882 -> (i64) {
        scf.yield %1871 : i64
      } else {
        scf.yield %1878 : i64
      }
      %1884 = func.call @cc_errorp(%1877) : (i64) -> i64
      %1885 = arith.cmpi ne, %1884, %1878 : i64
      %1886 = arith.cmpi eq, %1883, %1878 : i64
      %1887 = arith.andi %1885, %1886 : i1
      %1888 = scf.if %1887 -> (i64) {
        scf.yield %1877 : i64
      } else {
        scf.yield %1883 : i64
      }
      %1889 = func.call @cc_errorp(%1761) : (i64) -> i64
      %1890 = arith.cmpi ne, %1889, %1878 : i64
      %1891 = arith.cmpi eq, %1888, %1878 : i64
      %1892 = arith.andi %1890, %1891 : i1
      %1893 = scf.if %1892 -> (i64) {
        scf.yield %1761 : i64
      } else {
        scf.yield %1888 : i64
      }
      %1894 = arith.cmpi ne, %1893, %1878 : i64
      scf.if %1894 {
        func.call @stack_push_pointer(%1893) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1871) : (i64) -> ()
        func.call @stack_push_pointer(%1877) : (i64) -> ()
        func.call @stack_push_pointer(%1761) : (i64) -> ()
        %1895 = llvm.mlir.addressof @str207 : !llvm.ptr
        %1896 = func.call @cc_make_function_ref_const(%1895) : (!llvm.ptr) -> i64
        %1897 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1896, %1897) : (i64, i64) -> ()
      }
      %1898 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1898 : i64
    }
    %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
    %1899 = arith.addi %1864, %__rlasp_stack_elide_zero_70 : i64
    %1900 = func.call @cc_multiple_value_list(%1899) : (i64) -> i64
    %1901 = llvm.mlir.addressof @str208 : !llvm.ptr
    %1902 = arith.constant 37 : i64
    %1903 = func.call @cc_make_string(%1901, %1902) : (!llvm.ptr, i64) -> i64
    %1904 = func.call @cc_nil_value() : () -> i64
    %1905 = func.call @cc_intern(%1903, %1904) : (i64, i64) -> i64
    %1906 = func.call @cc_nil_value() : () -> i64
    %1907 = func.call @cc_cons(%1905, %1906) : (i64, i64) -> i64
    %1908 = func.call @cc_values_pack(%1907) : (i64) -> i64
    %1909 = func.call @cc_symbol_value(%1905) : (i64) -> i64
    %1910 = llvm.mlir.addressof @str209 : !llvm.ptr
    %1911 = arith.constant 39 : i64
    %1912 = func.call @cc_make_string(%1910, %1911) : (!llvm.ptr, i64) -> i64
    %1913 = func.call @cc_nil_value() : () -> i64
    %1914 = func.call @cc_intern(%1912, %1913) : (i64, i64) -> i64
    %1915 = func.call @cc_nil_value() : () -> i64
    %1916 = func.call @cc_cons(%1914, %1915) : (i64, i64) -> i64
    %1917 = func.call @cc_values_pack(%1916) : (i64) -> i64
    %1918 = func.call @cc_symbol_value(%1914) : (i64) -> i64
    %1919 = func.call @cc_nil_value() : () -> i64
    %1920 = arith.cmpi ne, %1909, %1919 : i64
    %1921 = scf.if %1920 -> (i64) {
      scf.yield %1918 : i64
    } else {
      scf.yield %1900 : i64
    }
    %1922 = func.call @cc_values_pack(%1921) : (i64) -> i64
    func.call @stack_push_pointer(%1922) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%test"() {
    %1923 = llvm.mlir.addressof @str210 : !llvm.ptr
    %1924 = arith.constant 5 : i64
    %1925 = func.call @cc_make_string(%1923, %1924) : (!llvm.ptr, i64) -> i64
    %1926 = func.call @cc_nil_value() : () -> i64
    %1927 = func.call @cc_intern(%1925, %1926) : (i64, i64) -> i64
    %1928 = func.call @cc_nil_value() : () -> i64
    %1929 = func.call @cc_cons(%1927, %1928) : (i64, i64) -> i64
    %1930 = func.call @cc_values_pack(%1929) : (i64) -> i64
    %1931 = llvm.mlir.addressof @str211 : !llvm.ptr
    %1932 = arith.constant 41 : i64
    %1933 = func.call @cc_make_string(%1931, %1932) : (!llvm.ptr, i64) -> i64
    %1934 = func.call @cc_register_function_lambda_list_metadata_raw(%1927, %1933) : (i64, i64) -> i64
    %1935 = func.call @stack_pop_pointer() : () -> i64
    %1936 = arith.constant 0 : i64
    %1937 = func.call @cc_arg(%1935, %1936) : (i64, i64) -> i64
    %1938 = arith.constant 4 : i64
    %1939 = func.call @cc_arg(%1935, %1938) : (i64, i64) -> i64
    %1940 = arith.constant 8 : i64
    %1941 = func.call @cc_arg(%1935, %1940) : (i64, i64) -> i64
    %1942 = arith.constant 12 : i64
    %1943 = func.call @cc_arg(%1935, %1942) : (i64, i64) -> i64
    %1944 = llvm.mlir.addressof @str212 : !llvm.ptr
    %1945 = arith.constant 11 : i64
    %1946 = func.call @cc_make_string(%1944, %1945) : (!llvm.ptr, i64) -> i64
    %1947 = func.call @cc_nil_value() : () -> i64
    %1948 = func.call @cc_intern(%1946, %1947) : (i64, i64) -> i64
    %1949 = func.call @cc_nil_value() : () -> i64
    %1950 = func.call @cc_cons(%1948, %1949) : (i64, i64) -> i64
    %1951 = func.call @cc_values_pack(%1950) : (i64) -> i64
    %1952 = func.call @cc_arg(%1935, %1948) : (i64, i64) -> i64
    %1953 = func.call @cc_arg_present(%1935, %1948) : (i64, i64) -> i64
    %1954 = func.call @cc_nil_value() : () -> i64
    %1955 = arith.cmpi ne, %1953, %1954 : i64
    %1956 = scf.if %1955 -> (i64) {
      scf.yield %1952 : i64
    } else {
      scf.yield %1954 : i64
    }
    %1957 = llvm.mlir.addressof @str213 : !llvm.ptr
    %1958 = arith.constant 4 : i64
    %1959 = func.call @cc_make_string(%1957, %1958) : (!llvm.ptr, i64) -> i64
    %1960 = func.call @cc_nil_value() : () -> i64
    %1961 = func.call @cc_intern(%1959, %1960) : (i64, i64) -> i64
    %1962 = func.call @cc_nil_value() : () -> i64
    %1963 = func.call @cc_cons(%1961, %1962) : (i64, i64) -> i64
    %1964 = func.call @cc_values_pack(%1963) : (i64) -> i64
    %1965 = func.call @cc_arg(%1935, %1961) : (i64, i64) -> i64
    %1966 = func.call @cc_arg_present(%1935, %1961) : (i64, i64) -> i64
    %1967 = func.call @cc_nil_value() : () -> i64
    %1968 = arith.cmpi ne, %1966, %1967 : i64
    %1969 = scf.if %1968 -> (i64) {
      scf.yield %1965 : i64
    } else {
      %1970 = llvm.mlir.addressof @str214 : !llvm.ptr
      %1971 = arith.constant 6 : i64
      %1972 = func.call @cc_make_string(%1970, %1971) : (!llvm.ptr, i64) -> i64
      %1973 = llvm.mlir.addressof @str215 : !llvm.ptr
      %1974 = arith.constant 11 : i64
      %1975 = func.call @cc_make_string(%1973, %1974) : (!llvm.ptr, i64) -> i64
      %1976 = func.call @cc_intern(%1972, %1975) : (i64, i64) -> i64
      %1977 = func.call @cc_nil_value() : () -> i64
      %1978 = func.call @cc_cons(%1976, %1977) : (i64, i64) -> i64
      %1979 = func.call @cc_values_pack(%1978) : (i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1980 = arith.addi %1976, %__rlasp_stack_elide_zero_71 : i64
      scf.yield %1980 : i64
    }
    %1981 = func.call @cc_nil_value() : () -> i64
    %1982 = llvm.mlir.addressof @str216 : !llvm.ptr
    %1983 = arith.constant 37 : i64
    %1984 = func.call @cc_make_string(%1982, %1983) : (!llvm.ptr, i64) -> i64
    %1985 = func.call @cc_nil_value() : () -> i64
    %1986 = func.call @cc_intern(%1984, %1985) : (i64, i64) -> i64
    %1987 = func.call @cc_nil_value() : () -> i64
    %1988 = func.call @cc_cons(%1986, %1987) : (i64, i64) -> i64
    %1989 = func.call @cc_values_pack(%1988) : (i64) -> i64
    %1990 = func.call @cc_set_symbol_value(%1986, %1981) : (i64, i64) -> i64
    %1991 = llvm.mlir.addressof @str217 : !llvm.ptr
    %1992 = arith.constant 38 : i64
    %1993 = func.call @cc_make_string(%1991, %1992) : (!llvm.ptr, i64) -> i64
    %1994 = func.call @cc_nil_value() : () -> i64
    %1995 = func.call @cc_intern(%1993, %1994) : (i64, i64) -> i64
    %1996 = func.call @cc_nil_value() : () -> i64
    %1997 = func.call @cc_cons(%1995, %1996) : (i64, i64) -> i64
    %1998 = func.call @cc_values_pack(%1997) : (i64) -> i64
    %1999 = func.call @cc_set_symbol_value(%1995, %1981) : (i64, i64) -> i64
    %2000 = llvm.mlir.addressof @str218 : !llvm.ptr
    %2001 = arith.constant 39 : i64
    %2002 = func.call @cc_make_string(%2000, %2001) : (!llvm.ptr, i64) -> i64
    %2003 = func.call @cc_nil_value() : () -> i64
    %2004 = func.call @cc_intern(%2002, %2003) : (i64, i64) -> i64
    %2005 = func.call @cc_nil_value() : () -> i64
    %2006 = func.call @cc_cons(%2004, %2005) : (i64, i64) -> i64
    %2007 = func.call @cc_values_pack(%2006) : (i64) -> i64
    %2008 = func.call @cc_set_symbol_value(%2004, %1981) : (i64, i64) -> i64
    %2009 = func.call @cc_nil_value() : () -> i64
    %2010 = func.call @cc_nil_value() : () -> i64
    %2011 = func.call @cc_errorp(%2009) : (i64) -> i64
    %2012 = arith.cmpi ne, %2011, %2010 : i64
    %2013 = scf.if %2012 -> (i64) {
      scf.yield %2009 : i64
    } else {
      %2014 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2015 = arith.constant 21 : i64
      %2016 = func.call @cc_make_string(%2014, %2015) : (!llvm.ptr, i64) -> i64
      %2017 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2018 = arith.constant 11 : i64
      %2019 = func.call @cc_make_string(%2017, %2018) : (!llvm.ptr, i64) -> i64
      %2020 = func.call @cc_intern(%2016, %2019) : (i64, i64) -> i64
      %2021 = func.call @cc_nil_value() : () -> i64
      %2022 = func.call @cc_cons(%2020, %2021) : (i64, i64) -> i64
      %2023 = func.call @cc_values_pack(%2022) : (i64) -> i64
      %2024 = func.call @cc_symbol_value(%2020) : (i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %2025 = arith.addi %2024, %__rlasp_stack_elide_zero_72 : i64
      %2026 = func.call @cc_nil_value() : () -> i64
      %2027 = arith.cmpi ne, %2025, %2026 : i64
      scf.if %2027 {
        %2028 = func.call @cc_nil_value() : () -> i64
        %2029 = func.call @cc_nil_value() : () -> i64
        %2030 = func.call @cc_errorp(%2028) : (i64) -> i64
        %2031 = arith.cmpi ne, %2030, %2029 : i64
        %2032 = scf.if %2031 -> (i64) {
          scf.yield %2028 : i64
        } else {
          %2033 = llvm.mlir.addressof @str221 : !llvm.ptr
          %2034 = arith.constant 14 : i64
          %2035 = func.call @cc_make_string(%2033, %2034) : (!llvm.ptr, i64) -> i64
          %2036 = llvm.mlir.addressof @str222 : !llvm.ptr
          %2037 = arith.constant 11 : i64
          %2038 = func.call @cc_make_string(%2036, %2037) : (!llvm.ptr, i64) -> i64
          %2039 = func.call @cc_intern(%2035, %2038) : (i64, i64) -> i64
          %2040 = func.call @cc_nil_value() : () -> i64
          %2041 = func.call @cc_cons(%2039, %2040) : (i64, i64) -> i64
          %2042 = func.call @cc_values_pack(%2041) : (i64) -> i64
          %2043 = func.call @cc_symbol_value(%2039) : (i64) -> i64
          %2044 = llvm.mlir.addressof @str223 : !llvm.ptr
          %2045 = arith.constant 21 : i64
          %2046 = func.call @cc_make_string(%2044, %2045) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%2043) : (i64) -> ()
          func.call @stack_push_pointer(%2046) : (i64) -> ()
          func.call @stack_push_pointer(%1937) : (i64) -> ()
          %2047 = llvm.mlir.addressof @str224 : !llvm.ptr
          %2048 = func.call @cc_make_function_ref_const(%2047) : (!llvm.ptr) -> i64
          %2049 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%2048, %2049) : (i64, i64) -> ()
          %2050 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2050 : i64
        }
        func.call @stack_push_pointer(%2032) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %2051 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2051 : i64
    }
    %2052 = func.call @cc_nil_value() : () -> i64
    %2053 = func.call @cc_errorp(%2013) : (i64) -> i64
    %2054 = arith.cmpi ne, %2053, %2052 : i64
    %2055 = scf.if %2054 -> (i64) {
      scf.yield %2013 : i64
    } else {
      %2056 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2057 = arith.constant 13 : i64
      %2058 = func.call @cc_make_string(%2056, %2057) : (!llvm.ptr, i64) -> i64
      %2059 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2060 = arith.constant 11 : i64
      %2061 = func.call @cc_make_string(%2059, %2060) : (!llvm.ptr, i64) -> i64
      %2062 = func.call @cc_intern(%2058, %2061) : (i64, i64) -> i64
      %2063 = func.call @cc_nil_value() : () -> i64
      %2064 = func.call @cc_cons(%2062, %2063) : (i64, i64) -> i64
      %2065 = func.call @cc_values_pack(%2064) : (i64) -> i64
      %2066 = func.call @cc_symbol_value(%2062) : (i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %2067 = arith.addi %2066, %__rlasp_stack_elide_zero_73 : i64
      %2068 = func.call @cc_nil_value() : () -> i64
      %2069 = arith.cmpi ne, %2067, %2068 : i64
      scf.if %2069 {
        %2070 = func.call @cc_nil_value() : () -> i64
        %2071 = func.call @cc_nil_value() : () -> i64
        %2072 = func.call @cc_errorp(%2070) : (i64) -> i64
        %2073 = arith.cmpi ne, %2072, %2071 : i64
        %2074 = scf.if %2073 -> (i64) {
          scf.yield %2070 : i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %2075 = func.call @stack_pop_pointer() : () -> i64
          %2076 = func.call @cc_multiple_value_list(%2075) : (i64) -> i64
          %2077 = func.call @cc_t_value() : () -> i64
          %2078 = llvm.mlir.addressof @str227 : !llvm.ptr
          %2079 = arith.constant 37 : i64
          %2080 = func.call @cc_make_string(%2078, %2079) : (!llvm.ptr, i64) -> i64
          %2081 = func.call @cc_nil_value() : () -> i64
          %2082 = func.call @cc_intern(%2080, %2081) : (i64, i64) -> i64
          %2083 = func.call @cc_nil_value() : () -> i64
          %2084 = func.call @cc_cons(%2082, %2083) : (i64, i64) -> i64
          %2085 = func.call @cc_values_pack(%2084) : (i64) -> i64
          %2086 = func.call @cc_set_symbol_value(%2082, %2077) : (i64, i64) -> i64
          %2087 = llvm.mlir.addressof @str228 : !llvm.ptr
          %2088 = arith.constant 38 : i64
          %2089 = func.call @cc_make_string(%2087, %2088) : (!llvm.ptr, i64) -> i64
          %2090 = func.call @cc_nil_value() : () -> i64
          %2091 = func.call @cc_intern(%2089, %2090) : (i64, i64) -> i64
          %2092 = func.call @cc_nil_value() : () -> i64
          %2093 = func.call @cc_cons(%2091, %2092) : (i64, i64) -> i64
          %2094 = func.call @cc_values_pack(%2093) : (i64) -> i64
          %2095 = func.call @cc_set_symbol_value(%2091, %2075) : (i64, i64) -> i64
          %2096 = llvm.mlir.addressof @str229 : !llvm.ptr
          %2097 = arith.constant 39 : i64
          %2098 = func.call @cc_make_string(%2096, %2097) : (!llvm.ptr, i64) -> i64
          %2099 = func.call @cc_nil_value() : () -> i64
          %2100 = func.call @cc_intern(%2098, %2099) : (i64, i64) -> i64
          %2101 = func.call @cc_nil_value() : () -> i64
          %2102 = func.call @cc_cons(%2100, %2101) : (i64, i64) -> i64
          %2103 = func.call @cc_values_pack(%2102) : (i64) -> i64
          %2104 = func.call @cc_set_symbol_value(%2100, %2076) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
          %2105 = arith.addi %2075, %__rlasp_stack_elide_zero_74 : i64
          scf.yield %2105 : i64
        }
        func.call @stack_push_pointer(%2074) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %2106 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2106 : i64
    }
    %2107 = func.call @cc_nil_value() : () -> i64
    %2108 = func.call @cc_errorp(%2055) : (i64) -> i64
    %2109 = arith.cmpi ne, %2108, %2107 : i64
    %2110 = scf.if %2109 -> (i64) {
      scf.yield %2055 : i64
    } else {
      %2111 = func.call @cc_nil_value() : () -> i64
      %2112 = func.call @cc_errorp(%1937) : (i64) -> i64
      %2113 = arith.cmpi ne, %2112, %2111 : i64
      %2114 = arith.cmpi eq, %2111, %2111 : i64
      %2115 = arith.andi %2113, %2114 : i1
      %2116 = scf.if %2115 -> (i64) {
        scf.yield %1937 : i64
      } else {
        scf.yield %2111 : i64
      }
      %2117 = arith.cmpi ne, %2116, %2111 : i64
      scf.if %2117 {
        func.call @stack_push_pointer(%2116) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1937) : (i64) -> ()
        %2118 = llvm.mlir.addressof @str230 : !llvm.ptr
        %2119 = func.call @cc_make_function_ref_const(%2118) : (!llvm.ptr) -> i64
        %2120 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2119, %2120) : (i64, i64) -> ()
      }
      %2121 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2121 : i64
    }
    %2122 = func.call @cc_nil_value() : () -> i64
    %2123 = func.call @cc_errorp(%2110) : (i64) -> i64
    %2124 = arith.cmpi ne, %2123, %2122 : i64
    %2125 = scf.if %2124 -> (i64) {
      scf.yield %2110 : i64
    } else {
      %2126 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2127 = func.call @cc_nil_value() : () -> i64
      %2128 = func.call @cc_nil_value() : () -> i64
      %2129 = func.call @cc_errorp(%2127) : (i64) -> i64
      %2130 = arith.cmpi ne, %2129, %2128 : i64
      %2131 = scf.if %2130 -> (i64) {
        scf.yield %2127 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
        %2132 = arith.addi %1941, %__rlasp_stack_elide_zero_75 : i64
        %2133 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%2132, %2133) : (i64, i64) -> ()
        %2134 = func.call @stack_pop_pointer() : () -> i64
        %2135 = func.call @cc_errorp(%2134) : (i64) -> i64
        %2136 = func.call @cc_nil_value() : () -> i64
        %2137 = arith.cmpi ne, %2135, %2136 : i64
        scf.if %2137 {
          func.call @stack_push_pointer(%2134) : (i64) -> ()
        } else {
          %2138 = func.call @cc_multiple_value_list(%2134) : (i64) -> i64
          func.call @stack_push_pointer(%2138) : (i64) -> ()
        }
        %2139 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2140 = func.call @stack_pop_pointer() : () -> i64
        %2141 = func.call @cc_nil_value() : () -> i64
        %2142 = func.call @cc_maybe_error_from_multiple_value_list(%2139) : (i64) -> i64
        %2143 = func.call @cc_errorp(%2142) : (i64) -> i64
        %2144 = arith.cmpi ne, %2143, %2141 : i64
        %2145 = arith.cmpi eq, %2141, %2141 : i64
        %2146 = arith.andi %2144, %2145 : i1
        %2147 = scf.if %2146 -> (i64) {
          scf.yield %2142 : i64
        } else {
          scf.yield %2141 : i64
        }
        %2148 = arith.cmpi ne, %2147, %2141 : i64
        scf.if %2148 {
          func.call @stack_push_pointer(%2147) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2149 = func.call @stack_pop_pointer() : () -> i64
          %2150 = func.call @cc_cons(%2140, %2149) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
          %2151 = arith.addi %2150, %__rlasp_stack_elide_zero_76 : i64
          %2152 = func.call @cc_cons(%2139, %2151) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
          %2153 = arith.addi %2152, %__rlasp_stack_elide_zero_77 : i64
          %2154 = func.call @cc_values_pack(%2153) : (i64) -> i64
          func.call @stack_push_pointer(%2154) : (i64) -> ()
        }
        %2155 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2155 : i64
      }
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %2156 = arith.addi %2131, %__rlasp_stack_elide_zero_78 : i64
      %2157 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2158 = func.call @cc_errorp(%2156) : (i64) -> i64
      %2159 = func.call @cc_nil_value() : () -> i64
      %2160 = arith.cmpi ne, %2158, %2159 : i64
      scf.if %2160 {
        %2161 = func.call @cc_condition_value(%2156) : (i64) -> i64
        %2162 = func.call @cc_values2(%2159, %2161) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2162) : (i64) -> ()
      } else {
        %2163 = func.call @cc_multiple_value_list(%2156) : (i64) -> i64
        %2164 = func.call @cc_values_pack(%2163) : (i64) -> i64
        func.call @stack_push_pointer(%2164) : (i64) -> ()
      }
      %2165 = func.call @stack_pop_pointer() : () -> i64
      %2166 = func.call @cc_multiple_value_list(%2165) : (i64) -> i64
      %2167 = arith.constant 0 : i64
      %2168 = func.call @cc_box_fixnum(%2167) : (i64) -> i64
      %2169 = func.call @cc_nth(%2168, %2166) : (i64, i64) -> i64
      %2170 = arith.constant 1 : i64
      %2171 = func.call @cc_box_fixnum(%2170) : (i64) -> i64
      %2172 = func.call @cc_nth(%2171, %2166) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %2173 = arith.addi %2172, %__rlasp_stack_elide_zero_79 : i64
      %2174 = func.call @cc_nil_value() : () -> i64
      %2175 = arith.cmpi ne, %2173, %2174 : i64
      scf.if %2175 {
        func.call @stack_push_pointer(%1937) : (i64) -> ()
        func.call @stack_push_pointer(%1939) : (i64) -> ()
        func.call @stack_push_pointer(%1943) : (i64) -> ()
        func.call @stack_push_pointer(%2172) : (i64) -> ()
        func.call @stack_push_pointer(%1956) : (i64) -> ()
        %2176 = llvm.mlir.addressof @str231 : !llvm.ptr
        %2177 = func.call @cc_make_function_ref_const(%2176) : (!llvm.ptr) -> i64
        %2178 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2177, %2178) : (i64, i64) -> ()
      } else {
        %2179 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
        %2180 = arith.addi %1943, %__rlasp_stack_elide_zero_80 : i64
        %2181 = func.call @cc_length(%2180) : (i64) -> i64
        %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
        %2182 = arith.addi %2181, %__rlasp_stack_elide_zero_81 : i64
        %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
        %2183 = arith.addi %2169, %__rlasp_stack_elide_zero_82 : i64
        %2184 = func.call @cc_length(%2183) : (i64) -> i64
        %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
        %2185 = arith.addi %2184, %__rlasp_stack_elide_zero_83 : i64
        %2186 = arith.constant 1 : i1
        %2188 = arith.constant 3 : i64
        %2187 = arith.andi %2182, %2188 : i64
        %2189 = arith.constant 0 : i64
        %2190 = arith.cmpi eq, %2187, %2189 : i64
        %2192 = arith.constant 3 : i64
        %2191 = arith.andi %2185, %2192 : i64
        %2193 = arith.constant 0 : i64
        %2194 = arith.cmpi eq, %2191, %2193 : i64
        %2195 = arith.andi %2190, %2194 : i1
        %2196 = scf.if %2195 -> (i1) {
          %2197 = arith.constant 2 : i64
          %2198 = arith.shrsi %2182, %2197 : i64
          %2199 = arith.constant 2 : i64
          %2200 = arith.shrsi %2185, %2199 : i64
          %2201 = arith.cmpi eq, %2198, %2200 : i64
          scf.yield %2201 : i1
        } else {
          %2202 = func.call @cc_eq(%2182, %2185) : (i64, i64) -> i64
          %2203 = func.call @cc_nil_value() : () -> i64
          %2204 = arith.cmpi ne, %2202, %2203 : i64
          scf.yield %2204 : i1
        }
        %2205 = arith.andi %2186, %2196 : i1
        %2206 = func.call @cc_nil_value() : () -> i64
        %2207 = func.call @cc_t_value() : () -> i64
        %2208 = scf.if %2205 -> (i64) {
          scf.yield %2207 : i64
        } else {
          scf.yield %2206 : i64
        }
        %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
        %2209 = arith.addi %2208, %__rlasp_stack_elide_zero_84 : i64
        func.call @stack_push_pointer(%1969) : (i64) -> ()
        func.call @stack_push_pointer(%2169) : (i64) -> ()
        %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
        %2210 = arith.addi %1943, %__rlasp_stack_elide_zero_85 : i64
        %2211 = func.call @stack_pop_pointer() : () -> i64
        %2212 = func.call @stack_pop_pointer() : () -> i64
        %2213 = func.call @cc_every2(%2212, %2211, %2210) : (i64, i64, i64) -> i64
        %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
        %2214 = arith.addi %2213, %__rlasp_stack_elide_zero_86 : i64
        %2215 = func.call @cc_cons(%2214, %2179) : (i64, i64) -> i64
        %2216 = func.call @cc_cons(%2209, %2215) : (i64, i64) -> i64
        %2217 = func.call @cc_and(%2216) : (i64) -> i64
        %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
        %2218 = arith.addi %2217, %__rlasp_stack_elide_zero_87 : i64
        %2219 = func.call @cc_nil_value() : () -> i64
        %2220 = arith.cmpi ne, %2218, %2219 : i64
        scf.if %2220 {
          %2221 = func.call @cc_nil_value() : () -> i64
          %2222 = func.call @cc_errorp(%1937) : (i64) -> i64
          %2223 = arith.cmpi ne, %2222, %2221 : i64
          %2224 = arith.cmpi eq, %2221, %2221 : i64
          %2225 = arith.andi %2223, %2224 : i1
          %2226 = scf.if %2225 -> (i64) {
            scf.yield %1937 : i64
          } else {
            scf.yield %2221 : i64
          }
          %2227 = arith.cmpi ne, %2226, %2221 : i64
          scf.if %2227 {
            func.call @stack_push_pointer(%2226) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1937) : (i64) -> ()
            %2228 = llvm.mlir.addressof @str232 : !llvm.ptr
            %2229 = func.call @cc_make_function_ref_const(%2228) : (!llvm.ptr) -> i64
            %2230 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2229, %2230) : (i64, i64) -> ()
          }
        } else {
          %2231 = func.call @cc_t_value() : () -> i64
          %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
          %2232 = arith.addi %2231, %__rlasp_stack_elide_zero_88 : i64
          %2233 = func.call @cc_nil_value() : () -> i64
          %2234 = arith.cmpi ne, %2232, %2233 : i64
          scf.if %2234 {
            func.call @stack_push_pointer(%1937) : (i64) -> ()
            func.call @stack_push_pointer(%1939) : (i64) -> ()
            func.call @stack_push_pointer(%1943) : (i64) -> ()
            func.call @stack_push_pointer(%2169) : (i64) -> ()
            func.call @stack_push_pointer(%1956) : (i64) -> ()
            func.call @stack_push_pointer(%1969) : (i64) -> ()
            %2235 = llvm.mlir.addressof @str233 : !llvm.ptr
            %2236 = func.call @cc_make_function_ref_const(%2235) : (!llvm.ptr) -> i64
            %2237 = arith.constant 6 : i64
            func.call @cc_funcall_stack(%2236, %2237) : (i64, i64) -> ()
        }
      }
      }
      %2238 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2238 : i64
    }
    %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
    %2239 = arith.addi %2125, %__rlasp_stack_elide_zero_89 : i64
    %2240 = func.call @cc_multiple_value_list(%2239) : (i64) -> i64
    %2241 = llvm.mlir.addressof @str234 : !llvm.ptr
    %2242 = arith.constant 37 : i64
    %2243 = func.call @cc_make_string(%2241, %2242) : (!llvm.ptr, i64) -> i64
    %2244 = func.call @cc_nil_value() : () -> i64
    %2245 = func.call @cc_intern(%2243, %2244) : (i64, i64) -> i64
    %2246 = func.call @cc_nil_value() : () -> i64
    %2247 = func.call @cc_cons(%2245, %2246) : (i64, i64) -> i64
    %2248 = func.call @cc_values_pack(%2247) : (i64) -> i64
    %2249 = func.call @cc_symbol_value(%2245) : (i64) -> i64
    %2250 = llvm.mlir.addressof @str235 : !llvm.ptr
    %2251 = arith.constant 39 : i64
    %2252 = func.call @cc_make_string(%2250, %2251) : (!llvm.ptr, i64) -> i64
    %2253 = func.call @cc_nil_value() : () -> i64
    %2254 = func.call @cc_intern(%2252, %2253) : (i64, i64) -> i64
    %2255 = func.call @cc_nil_value() : () -> i64
    %2256 = func.call @cc_cons(%2254, %2255) : (i64, i64) -> i64
    %2257 = func.call @cc_values_pack(%2256) : (i64) -> i64
    %2258 = func.call @cc_symbol_value(%2254) : (i64) -> i64
    %2259 = func.call @cc_nil_value() : () -> i64
    %2260 = arith.cmpi ne, %2249, %2259 : i64
    %2261 = scf.if %2260 -> (i64) {
      scf.yield %2258 : i64
    } else {
      scf.yield %2240 : i64
    }
    %2262 = func.call @cc_values_pack(%2261) : (i64) -> i64
    func.call @stack_push_pointer(%2262) : (i64) -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::LOAD-IF-COMPILED-CORRECTLY"() {
    %2263 = llvm.mlir.addressof @str236 : !llvm.ptr
    %2264 = arith.constant 26 : i64
    %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
    %2266 = llvm.mlir.addressof @str237 : !llvm.ptr
    %2267 = arith.constant 11 : i64
    %2268 = func.call @cc_make_string(%2266, %2267) : (!llvm.ptr, i64) -> i64
    %2269 = func.call @cc_intern(%2265, %2268) : (i64, i64) -> i64
    %2270 = func.call @cc_nil_value() : () -> i64
    %2271 = func.call @cc_cons(%2269, %2270) : (i64, i64) -> i64
    %2272 = func.call @cc_values_pack(%2271) : (i64) -> i64
    %2273 = llvm.mlir.addressof @str238 : !llvm.ptr
    %2274 = arith.constant 4 : i64
    %2275 = func.call @cc_make_string(%2273, %2274) : (!llvm.ptr, i64) -> i64
    %2276 = func.call @cc_register_function_lambda_list_metadata_raw(%2269, %2275) : (i64, i64) -> i64
    %2277 = func.call @stack_pop_pointer() : () -> i64
    %2278 = func.call @cc_nil_value() : () -> i64
    %2279 = llvm.mlir.addressof @str239 : !llvm.ptr
    %2280 = arith.constant 37 : i64
    %2281 = func.call @cc_make_string(%2279, %2280) : (!llvm.ptr, i64) -> i64
    %2282 = func.call @cc_nil_value() : () -> i64
    %2283 = func.call @cc_intern(%2281, %2282) : (i64, i64) -> i64
    %2284 = func.call @cc_nil_value() : () -> i64
    %2285 = func.call @cc_cons(%2283, %2284) : (i64, i64) -> i64
    %2286 = func.call @cc_values_pack(%2285) : (i64) -> i64
    %2287 = func.call @cc_set_symbol_value(%2283, %2278) : (i64, i64) -> i64
    %2288 = llvm.mlir.addressof @str240 : !llvm.ptr
    %2289 = arith.constant 38 : i64
    %2290 = func.call @cc_make_string(%2288, %2289) : (!llvm.ptr, i64) -> i64
    %2291 = func.call @cc_nil_value() : () -> i64
    %2292 = func.call @cc_intern(%2290, %2291) : (i64, i64) -> i64
    %2293 = func.call @cc_nil_value() : () -> i64
    %2294 = func.call @cc_cons(%2292, %2293) : (i64, i64) -> i64
    %2295 = func.call @cc_values_pack(%2294) : (i64) -> i64
    %2296 = func.call @cc_set_symbol_value(%2292, %2278) : (i64, i64) -> i64
    %2297 = llvm.mlir.addressof @str241 : !llvm.ptr
    %2298 = arith.constant 39 : i64
    %2299 = func.call @cc_make_string(%2297, %2298) : (!llvm.ptr, i64) -> i64
    %2300 = func.call @cc_nil_value() : () -> i64
    %2301 = func.call @cc_intern(%2299, %2300) : (i64, i64) -> i64
    %2302 = func.call @cc_nil_value() : () -> i64
    %2303 = func.call @cc_cons(%2301, %2302) : (i64, i64) -> i64
    %2304 = func.call @cc_values_pack(%2303) : (i64) -> i64
    %2305 = func.call @cc_set_symbol_value(%2301, %2278) : (i64, i64) -> i64
    %2306 = func.call @cc_nil_value() : () -> i64
    %2307 = func.call @cc_nil_value() : () -> i64
    %2308 = func.call @cc_errorp(%2306) : (i64) -> i64
    %2309 = arith.cmpi ne, %2308, %2307 : i64
    %2310 = scf.if %2309 -> (i64) {
      scf.yield %2306 : i64
    } else {
      %2311 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2311) : (i64) -> ()
      %2312 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2313 = arith.constant 4 : i64
      %2314 = func.call @cc_make_string(%2312, %2313) : (!llvm.ptr, i64) -> i64
      %2315 = func.call @cc_nil_value() : () -> i64
      %2316 = func.call @cc_intern(%2314, %2315) : (i64, i64) -> i64
      %2317 = func.call @cc_nil_value() : () -> i64
      %2318 = func.call @cc_cons(%2316, %2317) : (i64, i64) -> i64
      %2319 = func.call @cc_values_pack(%2318) : (i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2320 = arith.addi %2316, %__rlasp_stack_elide_zero_90 : i64
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @cc_cons(%2320, %2321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2323 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2324 = arith.constant 12 : i64
      %2325 = func.call @cc_make_string(%2323, %2324) : (!llvm.ptr, i64) -> i64
      %2326 = func.call @cc_nil_value() : () -> i64
      %2327 = func.call @cc_intern(%2325, %2326) : (i64, i64) -> i64
      %2328 = func.call @cc_nil_value() : () -> i64
      %2329 = func.call @cc_cons(%2327, %2328) : (i64, i64) -> i64
      %2330 = func.call @cc_values_pack(%2329) : (i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2331 = arith.addi %2327, %__rlasp_stack_elide_zero_91 : i64
      %2332 = func.call @stack_pop_pointer() : () -> i64
      %2333 = func.call @cc_cons(%2331, %2332) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2334 = arith.addi %2333, %__rlasp_stack_elide_zero_92 : i64
      %2335 = func.call @cc_nil_value() : () -> i64
      %2336 = func.call @cc_cons(%2334, %2335) : (i64, i64) -> i64
      %2337 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2338 = arith.constant 4 : i64
      %2339 = func.call @cc_make_string(%2337, %2338) : (!llvm.ptr, i64) -> i64
      %2340 = func.call @cc_nil_value() : () -> i64
      %2341 = func.call @cc_intern(%2339, %2340) : (i64, i64) -> i64
      %2342 = func.call @cc_nil_value() : () -> i64
      %2343 = func.call @cc_cons(%2341, %2342) : (i64, i64) -> i64
      %2344 = func.call @cc_values_pack(%2343) : (i64) -> i64
      %2345 = func.call @cc_symbol_value(%2341) : (i64) -> i64
      %2346 = func.call @cc_set_symbol_value(%2341, %2277) : (i64, i64) -> i64
      %2347 = func.call @cc_eval(%2336) : (i64) -> i64
      %2348 = func.call @cc_multiple_value_list(%2347) : (i64) -> i64
      %2349 = func.call @cc_symbol_value(%2341) : (i64) -> i64
      %2350 = func.call @cc_set_symbol_value(%2341, %2345) : (i64, i64) -> i64
      %2351 = func.call @cc_values_pack(%2348) : (i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2352 = arith.addi %2351, %__rlasp_stack_elide_zero_93 : i64
      scf.yield %2352 : i64
    }
    %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
    %2353 = arith.addi %2310, %__rlasp_stack_elide_zero_94 : i64
    %2354 = func.call @cc_multiple_value_list(%2353) : (i64) -> i64
    %2355 = arith.constant 0 : i64
    %2356 = func.call @cc_box_fixnum(%2355) : (i64) -> i64
    %2357 = func.call @cc_nth(%2356, %2354) : (i64, i64) -> i64
    %2358 = arith.constant 1 : i64
    %2359 = func.call @cc_box_fixnum(%2358) : (i64) -> i64
    %2360 = func.call @cc_nth(%2359, %2354) : (i64, i64) -> i64
    %2361 = arith.constant 2 : i64
    %2362 = func.call @cc_box_fixnum(%2361) : (i64) -> i64
    %2363 = func.call @cc_nth(%2362, %2354) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %2364 = func.call @stack_depth() : () -> i64
    %2365 = arith.constant 0 : i64
    %2366 = arith.cmpi sgt, %2364, %2365 : i64
    scf.if %2366 {
      %2367 = func.call @stack_pop_pointer() : () -> i64
    }
    %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
    %2368 = arith.addi %2357, %__rlasp_stack_elide_zero_95 : i64
    %2369 = func.call @cc_nil_value() : () -> i64
    %2370 = arith.cmpi ne, %2368, %2369 : i64
    scf.if %2370 {
      %2371 = func.call @cc_nil_value() : () -> i64
      %2372 = func.call @cc_nil_value() : () -> i64
      %2373 = func.call @cc_errorp(%2371) : (i64) -> i64
      %2374 = arith.cmpi ne, %2373, %2372 : i64
      %2375 = scf.if %2374 -> (i64) {
        scf.yield %2371 : i64
      } else {
        %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
        %2376 = arith.addi %2357, %__rlasp_stack_elide_zero_96 : i64
        %2377 = func.call @cc_nil_value() : () -> i64
        %2378 = func.call @cc_cons(%2376, %2377) : (i64, i64) -> i64
        %2379 = func.call @cc_load_stack(%2378) : (i64) -> i64
        %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
        %2380 = arith.addi %2379, %__rlasp_stack_elide_zero_97 : i64
        scf.yield %2380 : i64
      }
      func.call @stack_push_pointer(%2375) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2381 = func.call @stack_pop_pointer() : () -> i64
    %2382 = func.call @cc_errorp(%2381) : (i64) -> i64
    %2383 = func.call @cc_nil_value() : () -> i64
    %2384 = arith.cmpi ne, %2382, %2383 : i64
    %2385 = scf.if %2384 -> (i64) {
      %2386 = func.call @cc_condition_value(%2381) : (i64) -> i64
      %2387 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2388 = arith.constant 5 : i64
      %2389 = func.call @cc_make_string(%2387, %2388) : (!llvm.ptr, i64) -> i64
      %2390 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2391 = arith.constant 11 : i64
      %2392 = func.call @cc_make_string(%2390, %2391) : (!llvm.ptr, i64) -> i64
      %2393 = func.call @cc_intern(%2389, %2392) : (i64, i64) -> i64
      %2394 = func.call @cc_nil_value() : () -> i64
      %2395 = func.call @cc_cons(%2393, %2394) : (i64, i64) -> i64
      %2396 = func.call @cc_values_pack(%2395) : (i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2397 = arith.addi %2393, %__rlasp_stack_elide_zero_98 : i64
      %2398 = func.call @cc_typep(%2386, %2397) : (i64, i64) -> i64
      %2399 = func.call @cc_nil_value() : () -> i64
      %2400 = arith.cmpi ne, %2398, %2399 : i64
      %2401 = scf.if %2400 -> (i64) {
        %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
        %2402 = arith.addi %2277, %__rlasp_stack_elide_zero_99 : i64
        %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
        %2403 = arith.addi %2386, %__rlasp_stack_elide_zero_100 : i64
        %2404 = func.call @cc_nil_value() : () -> i64
        %2405 = func.call @cc_errorp(%2402) : (i64) -> i64
        %2406 = arith.cmpi ne, %2405, %2404 : i64
        %2407 = arith.cmpi eq, %2404, %2404 : i64
        %2408 = arith.andi %2406, %2407 : i1
        %2409 = scf.if %2408 -> (i64) {
          scf.yield %2402 : i64
        } else {
          scf.yield %2404 : i64
        }
        %2410 = func.call @cc_errorp(%2403) : (i64) -> i64
        %2411 = arith.cmpi ne, %2410, %2404 : i64
        %2412 = arith.cmpi eq, %2409, %2404 : i64
        %2413 = arith.andi %2411, %2412 : i1
        %2414 = scf.if %2413 -> (i64) {
          scf.yield %2403 : i64
        } else {
          scf.yield %2409 : i64
        }
        %2415 = arith.cmpi ne, %2414, %2404 : i64
        scf.if %2415 {
          func.call @stack_push_pointer(%2414) : (i64) -> ()
        } else {
          %2416 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%2416) : (i64) -> ()
          %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
          %2417 = arith.addi %2403, %__rlasp_stack_elide_zero_101 : i64
          %2418 = func.call @stack_pop_pointer() : () -> i64
          %2419 = func.call @cc_cons(%2417, %2418) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2419) : (i64) -> ()
          %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
          %2420 = arith.addi %2402, %__rlasp_stack_elide_zero_102 : i64
          %2421 = func.call @stack_pop_pointer() : () -> i64
          %2422 = func.call @cc_cons(%2420, %2421) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2422) : (i64) -> ()
        }
        %2423 = func.call @stack_pop_pointer() : () -> i64
        %2424 = func.call @cc_nil_value() : () -> i64
        %2425 = func.call @cc_errorp(%2423) : (i64) -> i64
        %2426 = arith.cmpi ne, %2425, %2424 : i64
        %2427 = arith.cmpi eq, %2424, %2424 : i64
        %2428 = arith.andi %2426, %2427 : i1
        %2429 = scf.if %2428 -> (i64) {
          scf.yield %2423 : i64
        } else {
          scf.yield %2424 : i64
        }
        %2430 = arith.cmpi ne, %2429, %2424 : i64
        scf.if %2430 {
          func.call @stack_push_pointer(%2429) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2423) : (i64) -> ()
          %2431 = llvm.mlir.addressof @str247 : !llvm.ptr
          %2432 = func.call @cc_make_function_ref_const(%2431) : (!llvm.ptr) -> i64
          %2433 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2432, %2433) : (i64, i64) -> ()
        }
        %2434 = func.call @stack_depth() : () -> i64
        %2435 = arith.constant 0 : i64
        %2436 = arith.cmpi sgt, %2434, %2435 : i64
        scf.if %2436 {
          %2437 = func.call @stack_pop_pointer() : () -> i64
        }
        %2438 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2439 = arith.constant 3 : i64
        %2440 = func.call @cc_make_string(%2438, %2439) : (!llvm.ptr, i64) -> i64
        %2441 = llvm.mlir.addressof @str249 : !llvm.ptr
        %2442 = arith.constant 7 : i64
        %2443 = func.call @cc_make_string(%2441, %2442) : (!llvm.ptr, i64) -> i64
        %2444 = func.call @cc_intern(%2440, %2443) : (i64, i64) -> i64
        %2445 = func.call @cc_nil_value() : () -> i64
        %2446 = func.call @cc_cons(%2444, %2445) : (i64, i64) -> i64
        %2447 = func.call @cc_values_pack(%2446) : (i64) -> i64
        %2448 = llvm.mlir.addressof @str250 : !llvm.ptr
        %2449 = arith.constant 45 : i64
        %2450 = func.call @cc_make_string(%2448, %2449) : (!llvm.ptr, i64) -> i64
        %2451 = func.call @cc_nil_value() : () -> i64
        %2452 = func.call @cc_errorp(%2444) : (i64) -> i64
        %2453 = arith.cmpi ne, %2452, %2451 : i64
        %2454 = arith.cmpi eq, %2451, %2451 : i64
        %2455 = arith.andi %2453, %2454 : i1
        %2456 = scf.if %2455 -> (i64) {
          scf.yield %2444 : i64
        } else {
          scf.yield %2451 : i64
        }
        %2457 = func.call @cc_errorp(%2450) : (i64) -> i64
        %2458 = arith.cmpi ne, %2457, %2451 : i64
        %2459 = arith.cmpi eq, %2456, %2451 : i64
        %2460 = arith.andi %2458, %2459 : i1
        %2461 = scf.if %2460 -> (i64) {
          scf.yield %2450 : i64
        } else {
          scf.yield %2456 : i64
        }
        %2462 = func.call @cc_errorp(%2277) : (i64) -> i64
        %2463 = arith.cmpi ne, %2462, %2451 : i64
        %2464 = arith.cmpi eq, %2461, %2451 : i64
        %2465 = arith.andi %2463, %2464 : i1
        %2466 = scf.if %2465 -> (i64) {
          scf.yield %2277 : i64
        } else {
          scf.yield %2461 : i64
        }
        %2467 = func.call @cc_errorp(%2386) : (i64) -> i64
        %2468 = arith.cmpi ne, %2467, %2451 : i64
        %2469 = arith.cmpi eq, %2466, %2451 : i64
        %2470 = arith.andi %2468, %2469 : i1
        %2471 = scf.if %2470 -> (i64) {
          scf.yield %2386 : i64
        } else {
          scf.yield %2466 : i64
        }
        %2472 = arith.cmpi ne, %2471, %2451 : i64
        scf.if %2472 {
          func.call @stack_push_pointer(%2471) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2444) : (i64) -> ()
          func.call @stack_push_pointer(%2450) : (i64) -> ()
          func.call @stack_push_pointer(%2277) : (i64) -> ()
          func.call @stack_push_pointer(%2386) : (i64) -> ()
          %2473 = llvm.mlir.addressof @str251 : !llvm.ptr
          %2474 = func.call @cc_make_function_ref_const(%2473) : (!llvm.ptr) -> i64
          %2475 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%2474, %2475) : (i64, i64) -> ()
        }
        %2476 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2476 : i64
      } else {
        scf.yield %2381 : i64
      }
      scf.yield %2401 : i64
    } else {
      scf.yield %2381 : i64
    }
    %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
    %2477 = arith.addi %2385, %__rlasp_stack_elide_zero_103 : i64
    %2478 = func.call @cc_multiple_value_list(%2477) : (i64) -> i64
    %2479 = llvm.mlir.addressof @str252 : !llvm.ptr
    %2480 = arith.constant 37 : i64
    %2481 = func.call @cc_make_string(%2479, %2480) : (!llvm.ptr, i64) -> i64
    %2482 = func.call @cc_nil_value() : () -> i64
    %2483 = func.call @cc_intern(%2481, %2482) : (i64, i64) -> i64
    %2484 = func.call @cc_nil_value() : () -> i64
    %2485 = func.call @cc_cons(%2483, %2484) : (i64, i64) -> i64
    %2486 = func.call @cc_values_pack(%2485) : (i64) -> i64
    %2487 = func.call @cc_symbol_value(%2483) : (i64) -> i64
    %2488 = llvm.mlir.addressof @str253 : !llvm.ptr
    %2489 = arith.constant 39 : i64
    %2490 = func.call @cc_make_string(%2488, %2489) : (!llvm.ptr, i64) -> i64
    %2491 = func.call @cc_nil_value() : () -> i64
    %2492 = func.call @cc_intern(%2490, %2491) : (i64, i64) -> i64
    %2493 = func.call @cc_nil_value() : () -> i64
    %2494 = func.call @cc_cons(%2492, %2493) : (i64, i64) -> i64
    %2495 = func.call @cc_values_pack(%2494) : (i64) -> i64
    %2496 = func.call @cc_symbol_value(%2492) : (i64) -> i64
    %2497 = func.call @cc_nil_value() : () -> i64
    %2498 = arith.cmpi ne, %2487, %2497 : i64
    %2499 = scf.if %2498 -> (i64) {
      scf.yield %2496 : i64
    } else {
      scf.yield %2478 : i64
    }
    %2500 = func.call @cc_values_pack(%2499) : (i64) -> i64
    func.call @stack_push_pointer(%2500) : (i64) -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY"() {
    %2501 = llvm.mlir.addressof @str254 : !llvm.ptr
    %2502 = arith.constant 42 : i64
    %2503 = func.call @cc_make_string(%2501, %2502) : (!llvm.ptr, i64) -> i64
    %2504 = llvm.mlir.addressof @str255 : !llvm.ptr
    %2505 = arith.constant 11 : i64
    %2506 = func.call @cc_make_string(%2504, %2505) : (!llvm.ptr, i64) -> i64
    %2507 = func.call @cc_intern(%2503, %2506) : (i64, i64) -> i64
    %2508 = func.call @cc_nil_value() : () -> i64
    %2509 = func.call @cc_cons(%2507, %2508) : (i64, i64) -> i64
    %2510 = func.call @cc_values_pack(%2509) : (i64) -> i64
    %2511 = llvm.mlir.addressof @str256 : !llvm.ptr
    %2512 = arith.constant 4 : i64
    %2513 = func.call @cc_make_string(%2511, %2512) : (!llvm.ptr, i64) -> i64
    %2514 = func.call @cc_register_function_lambda_list_metadata_raw(%2507, %2513) : (i64, i64) -> i64
    %2515 = func.call @stack_pop_pointer() : () -> i64
    %2516 = func.call @cc_nil_value() : () -> i64
    %2517 = llvm.mlir.addressof @str257 : !llvm.ptr
    %2518 = arith.constant 37 : i64
    %2519 = func.call @cc_make_string(%2517, %2518) : (!llvm.ptr, i64) -> i64
    %2520 = func.call @cc_nil_value() : () -> i64
    %2521 = func.call @cc_intern(%2519, %2520) : (i64, i64) -> i64
    %2522 = func.call @cc_nil_value() : () -> i64
    %2523 = func.call @cc_cons(%2521, %2522) : (i64, i64) -> i64
    %2524 = func.call @cc_values_pack(%2523) : (i64) -> i64
    %2525 = func.call @cc_set_symbol_value(%2521, %2516) : (i64, i64) -> i64
    %2526 = llvm.mlir.addressof @str258 : !llvm.ptr
    %2527 = arith.constant 38 : i64
    %2528 = func.call @cc_make_string(%2526, %2527) : (!llvm.ptr, i64) -> i64
    %2529 = func.call @cc_nil_value() : () -> i64
    %2530 = func.call @cc_intern(%2528, %2529) : (i64, i64) -> i64
    %2531 = func.call @cc_nil_value() : () -> i64
    %2532 = func.call @cc_cons(%2530, %2531) : (i64, i64) -> i64
    %2533 = func.call @cc_values_pack(%2532) : (i64) -> i64
    %2534 = func.call @cc_set_symbol_value(%2530, %2516) : (i64, i64) -> i64
    %2535 = llvm.mlir.addressof @str259 : !llvm.ptr
    %2536 = arith.constant 39 : i64
    %2537 = func.call @cc_make_string(%2535, %2536) : (!llvm.ptr, i64) -> i64
    %2538 = func.call @cc_nil_value() : () -> i64
    %2539 = func.call @cc_intern(%2537, %2538) : (i64, i64) -> i64
    %2540 = func.call @cc_nil_value() : () -> i64
    %2541 = func.call @cc_cons(%2539, %2540) : (i64, i64) -> i64
    %2542 = func.call @cc_values_pack(%2541) : (i64) -> i64
    %2543 = func.call @cc_set_symbol_value(%2539, %2516) : (i64, i64) -> i64
    %2544 = func.call @cc_nil_value() : () -> i64
    %2545 = func.call @cc_nil_value() : () -> i64
    %2546 = func.call @cc_errorp(%2544) : (i64) -> i64
    %2547 = arith.cmpi ne, %2546, %2545 : i64
    %2548 = scf.if %2547 -> (i64) {
      scf.yield %2544 : i64
    } else {
      %2549 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2549) : (i64) -> ()
      %2550 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2551 = arith.constant 4 : i64
      %2552 = func.call @cc_make_string(%2550, %2551) : (!llvm.ptr, i64) -> i64
      %2553 = func.call @cc_nil_value() : () -> i64
      %2554 = func.call @cc_intern(%2552, %2553) : (i64, i64) -> i64
      %2555 = func.call @cc_nil_value() : () -> i64
      %2556 = func.call @cc_cons(%2554, %2555) : (i64, i64) -> i64
      %2557 = func.call @cc_values_pack(%2556) : (i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2558 = arith.addi %2554, %__rlasp_stack_elide_zero_104 : i64
      %2559 = func.call @stack_pop_pointer() : () -> i64
      %2560 = func.call @cc_cons(%2558, %2559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2560) : (i64) -> ()
      %2561 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2562 = arith.constant 12 : i64
      %2563 = func.call @cc_make_string(%2561, %2562) : (!llvm.ptr, i64) -> i64
      %2564 = func.call @cc_nil_value() : () -> i64
      %2565 = func.call @cc_intern(%2563, %2564) : (i64, i64) -> i64
      %2566 = func.call @cc_nil_value() : () -> i64
      %2567 = func.call @cc_cons(%2565, %2566) : (i64, i64) -> i64
      %2568 = func.call @cc_values_pack(%2567) : (i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2569 = arith.addi %2565, %__rlasp_stack_elide_zero_105 : i64
      %2570 = func.call @stack_pop_pointer() : () -> i64
      %2571 = func.call @cc_cons(%2569, %2570) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2572 = arith.addi %2571, %__rlasp_stack_elide_zero_106 : i64
      %2573 = func.call @cc_nil_value() : () -> i64
      %2574 = func.call @cc_cons(%2572, %2573) : (i64, i64) -> i64
      %2575 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2576 = arith.constant 4 : i64
      %2577 = func.call @cc_make_string(%2575, %2576) : (!llvm.ptr, i64) -> i64
      %2578 = func.call @cc_nil_value() : () -> i64
      %2579 = func.call @cc_intern(%2577, %2578) : (i64, i64) -> i64
      %2580 = func.call @cc_nil_value() : () -> i64
      %2581 = func.call @cc_cons(%2579, %2580) : (i64, i64) -> i64
      %2582 = func.call @cc_values_pack(%2581) : (i64) -> i64
      %2583 = func.call @cc_symbol_value(%2579) : (i64) -> i64
      %2584 = func.call @cc_set_symbol_value(%2579, %2515) : (i64, i64) -> i64
      %2585 = func.call @cc_eval(%2574) : (i64) -> i64
      %2586 = func.call @cc_multiple_value_list(%2585) : (i64) -> i64
      %2587 = func.call @cc_symbol_value(%2579) : (i64) -> i64
      %2588 = func.call @cc_set_symbol_value(%2579, %2583) : (i64, i64) -> i64
      %2589 = func.call @cc_values_pack(%2586) : (i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2590 = arith.addi %2589, %__rlasp_stack_elide_zero_107 : i64
      scf.yield %2590 : i64
    }
    %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
    %2591 = arith.addi %2548, %__rlasp_stack_elide_zero_108 : i64
    %2592 = func.call @cc_multiple_value_list(%2591) : (i64) -> i64
    %2593 = arith.constant 0 : i64
    %2594 = func.call @cc_box_fixnum(%2593) : (i64) -> i64
    %2595 = func.call @cc_nth(%2594, %2592) : (i64, i64) -> i64
    %2596 = arith.constant 1 : i64
    %2597 = func.call @cc_box_fixnum(%2596) : (i64) -> i64
    %2598 = func.call @cc_nth(%2597, %2592) : (i64, i64) -> i64
    %2599 = arith.constant 2 : i64
    %2600 = func.call @cc_box_fixnum(%2599) : (i64) -> i64
    %2601 = func.call @cc_nth(%2600, %2592) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %2602 = func.call @stack_depth() : () -> i64
    %2603 = arith.constant 0 : i64
    %2604 = arith.cmpi sgt, %2602, %2603 : i64
    scf.if %2604 {
      %2605 = func.call @stack_pop_pointer() : () -> i64
    }
    %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
    %2606 = arith.addi %2595, %__rlasp_stack_elide_zero_109 : i64
    %2607 = func.call @cc_nil_value() : () -> i64
    %2608 = arith.cmpi ne, %2606, %2607 : i64
    scf.if %2608 {
      %2609 = func.call @cc_nil_value() : () -> i64
      %2610 = func.call @cc_nil_value() : () -> i64
      %2611 = func.call @cc_errorp(%2609) : (i64) -> i64
      %2612 = arith.cmpi ne, %2611, %2610 : i64
      %2613 = scf.if %2612 -> (i64) {
        scf.yield %2609 : i64
      } else {
        %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
        %2614 = arith.addi %2595, %__rlasp_stack_elide_zero_110 : i64
        %2615 = func.call @cc_nil_value() : () -> i64
        %2616 = func.call @cc_cons(%2614, %2615) : (i64, i64) -> i64
        %2617 = func.call @cc_load_stack(%2616) : (i64) -> i64
        %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
        %2618 = arith.addi %2617, %__rlasp_stack_elide_zero_111 : i64
        scf.yield %2618 : i64
      }
      func.call @stack_push_pointer(%2613) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2619 = func.call @stack_pop_pointer() : () -> i64
    %2620 = func.call @cc_multiple_value_list(%2619) : (i64) -> i64
    %2621 = llvm.mlir.addressof @str263 : !llvm.ptr
    %2622 = arith.constant 37 : i64
    %2623 = func.call @cc_make_string(%2621, %2622) : (!llvm.ptr, i64) -> i64
    %2624 = func.call @cc_nil_value() : () -> i64
    %2625 = func.call @cc_intern(%2623, %2624) : (i64, i64) -> i64
    %2626 = func.call @cc_nil_value() : () -> i64
    %2627 = func.call @cc_cons(%2625, %2626) : (i64, i64) -> i64
    %2628 = func.call @cc_values_pack(%2627) : (i64) -> i64
    %2629 = func.call @cc_symbol_value(%2625) : (i64) -> i64
    %2630 = llvm.mlir.addressof @str264 : !llvm.ptr
    %2631 = arith.constant 39 : i64
    %2632 = func.call @cc_make_string(%2630, %2631) : (!llvm.ptr, i64) -> i64
    %2633 = func.call @cc_nil_value() : () -> i64
    %2634 = func.call @cc_intern(%2632, %2633) : (i64, i64) -> i64
    %2635 = func.call @cc_nil_value() : () -> i64
    %2636 = func.call @cc_cons(%2634, %2635) : (i64, i64) -> i64
    %2637 = func.call @cc_values_pack(%2636) : (i64) -> i64
    %2638 = func.call @cc_symbol_value(%2634) : (i64) -> i64
    %2639 = func.call @cc_nil_value() : () -> i64
    %2640 = arith.cmpi ne, %2629, %2639 : i64
    %2641 = scf.if %2640 -> (i64) {
      scf.yield %2638 : i64
    } else {
      scf.yield %2620 : i64
    }
    %2642 = func.call @cc_values_pack(%2641) : (i64) -> i64
    func.call @stack_push_pointer(%2642) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %2643 = llvm.mlir.addressof @str265 : !llvm.ptr
    %2644 = arith.constant 6 : i64
    %2645 = func.call @cc_make_string(%2643, %2644) : (!llvm.ptr, i64) -> i64
    %2646 = func.call @cc_nil_value() : () -> i64
    %2647 = func.call @cc_intern(%2645, %2646) : (i64, i64) -> i64
    %2648 = func.call @cc_nil_value() : () -> i64
    %2649 = func.call @cc_cons(%2647, %2648) : (i64, i64) -> i64
    %2650 = func.call @cc_values_pack(%2649) : (i64) -> i64
    %2651 = func.call @cc_nil_value() : () -> i64
    %2652 = llvm.mlir.addressof @str266 : !llvm.ptr
    %2653 = arith.constant 37 : i64
    %2654 = func.call @cc_make_string(%2652, %2653) : (!llvm.ptr, i64) -> i64
    %2655 = func.call @cc_nil_value() : () -> i64
    %2656 = func.call @cc_intern(%2654, %2655) : (i64, i64) -> i64
    %2657 = func.call @cc_nil_value() : () -> i64
    %2658 = func.call @cc_cons(%2656, %2657) : (i64, i64) -> i64
    %2659 = func.call @cc_values_pack(%2658) : (i64) -> i64
    %2660 = func.call @cc_set_symbol_value(%2656, %2651) : (i64, i64) -> i64
    %2661 = llvm.mlir.addressof @str267 : !llvm.ptr
    %2662 = arith.constant 38 : i64
    %2663 = func.call @cc_make_string(%2661, %2662) : (!llvm.ptr, i64) -> i64
    %2664 = func.call @cc_nil_value() : () -> i64
    %2665 = func.call @cc_intern(%2663, %2664) : (i64, i64) -> i64
    %2666 = func.call @cc_nil_value() : () -> i64
    %2667 = func.call @cc_cons(%2665, %2666) : (i64, i64) -> i64
    %2668 = func.call @cc_values_pack(%2667) : (i64) -> i64
    %2669 = func.call @cc_set_symbol_value(%2665, %2651) : (i64, i64) -> i64
    %2670 = llvm.mlir.addressof @str268 : !llvm.ptr
    %2671 = arith.constant 39 : i64
    %2672 = func.call @cc_make_string(%2670, %2671) : (!llvm.ptr, i64) -> i64
    %2673 = func.call @cc_nil_value() : () -> i64
    %2674 = func.call @cc_intern(%2672, %2673) : (i64, i64) -> i64
    %2675 = func.call @cc_nil_value() : () -> i64
    %2676 = func.call @cc_cons(%2674, %2675) : (i64, i64) -> i64
    %2677 = func.call @cc_values_pack(%2676) : (i64) -> i64
    %2678 = func.call @cc_set_symbol_value(%2674, %2651) : (i64, i64) -> i64
    %2679 = func.call @cc_nil_value() : () -> i64
    %2680 = func.call @cc_nil_value() : () -> i64
    %2681 = func.call @cc_errorp(%2679) : (i64) -> i64
    %2682 = arith.cmpi ne, %2681, %2680 : i64
    %2683 = scf.if %2682 -> (i64) {
      scf.yield %2679 : i64
    } else {
      %2684 = func.call @cc_nil_value() : () -> i64
      %2685 = func.call @cc_nil_value() : () -> i64
      %2686 = func.call @cc_errorp(%2684) : (i64) -> i64
      %2687 = arith.cmpi ne, %2686, %2685 : i64
      %2688 = scf.if %2687 -> (i64) {
        scf.yield %2684 : i64
      } else {
        %2689 = llvm.mlir.addressof @str269 : !llvm.ptr
        %2690 = arith.constant 11 : i64
        %2691 = func.call @cc_make_string(%2689, %2690) : (!llvm.ptr, i64) -> i64
        %2692 = func.call @cc_nil_value() : () -> i64
        %2693 = func.call @cc_intern(%2691, %2692) : (i64, i64) -> i64
        %2694 = func.call @cc_nil_value() : () -> i64
        %2695 = func.call @cc_cons(%2693, %2694) : (i64, i64) -> i64
        %2696 = func.call @cc_values_pack(%2695) : (i64) -> i64
        %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
        %2697 = arith.addi %2693, %__rlasp_stack_elide_zero_112 : i64
        %2698 = func.call @cc_nil_value() : () -> i64
        %2699 = func.call @cc_errorp(%2697) : (i64) -> i64
        %2700 = arith.cmpi ne, %2699, %2698 : i64
        %2701 = arith.cmpi eq, %2698, %2698 : i64
        %2702 = arith.andi %2700, %2701 : i1
        %2703 = scf.if %2702 -> (i64) {
          scf.yield %2697 : i64
        } else {
          scf.yield %2698 : i64
        }
        %2704 = arith.cmpi ne, %2703, %2698 : i64
        scf.if %2704 {
          func.call @stack_push_pointer(%2703) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2697) : (i64) -> ()
          %2705 = llvm.mlir.addressof @str270 : !llvm.ptr
          %2706 = func.call @cc_make_function_ref_const(%2705) : (!llvm.ptr) -> i64
          %2707 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2706, %2707) : (i64, i64) -> ()
        }
        %2708 = func.call @stack_pop_pointer() : () -> i64
        %2709 = func.call @cc_nil_value() : () -> i64
        %2710 = arith.cmpi ne, %2708, %2709 : i64
        scf.if %2710 {
          %2711 = llvm.mlir.addressof @str271 : !llvm.ptr
          %2712 = arith.constant 11 : i64
          %2713 = func.call @cc_make_string(%2711, %2712) : (!llvm.ptr, i64) -> i64
          %2714 = func.call @cc_nil_value() : () -> i64
          %2715 = func.call @cc_intern(%2713, %2714) : (i64, i64) -> i64
          %2716 = func.call @cc_nil_value() : () -> i64
          %2717 = func.call @cc_cons(%2715, %2716) : (i64, i64) -> i64
          %2718 = func.call @cc_values_pack(%2717) : (i64) -> i64
          %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
          %2719 = arith.addi %2715, %__rlasp_stack_elide_zero_113 : i64
          %2720 = func.call @cc_nil_value() : () -> i64
          %2721 = func.call @cc_errorp(%2719) : (i64) -> i64
          %2722 = arith.cmpi ne, %2721, %2720 : i64
          %2723 = arith.cmpi eq, %2720, %2720 : i64
          %2724 = arith.andi %2722, %2723 : i1
          %2725 = scf.if %2724 -> (i64) {
            scf.yield %2719 : i64
          } else {
            scf.yield %2720 : i64
          }
          %2726 = arith.cmpi ne, %2725, %2720 : i64
          scf.if %2726 {
            func.call @stack_push_pointer(%2725) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2719) : (i64) -> ()
            %2727 = llvm.mlir.addressof @str272 : !llvm.ptr
            %2728 = func.call @cc_make_function_ref_const(%2727) : (!llvm.ptr) -> i64
            %2729 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2728, %2729) : (i64, i64) -> ()
          }
        } else {
          %2730 = llvm.mlir.addressof @str273 : !llvm.ptr
          %2731 = arith.constant 11 : i64
          %2732 = func.call @cc_make_string(%2730, %2731) : (!llvm.ptr, i64) -> i64
          %2733 = func.call @cc_nil_value() : () -> i64
          %2734 = func.call @cc_intern(%2732, %2733) : (i64, i64) -> i64
          %2735 = func.call @cc_nil_value() : () -> i64
          %2736 = func.call @cc_cons(%2734, %2735) : (i64, i64) -> i64
          %2737 = func.call @cc_values_pack(%2736) : (i64) -> i64
          %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
          %2738 = arith.addi %2734, %__rlasp_stack_elide_zero_114 : i64
          %2739 = func.call @cc_nil_value() : () -> i64
          %2740 = func.call @cc_errorp(%2738) : (i64) -> i64
          %2741 = arith.cmpi ne, %2740, %2739 : i64
          %2742 = arith.cmpi eq, %2739, %2739 : i64
          %2743 = arith.andi %2741, %2742 : i1
          %2744 = scf.if %2743 -> (i64) {
            scf.yield %2738 : i64
          } else {
            scf.yield %2739 : i64
          }
          %2745 = arith.cmpi ne, %2744, %2739 : i64
          scf.if %2745 {
            func.call @stack_push_pointer(%2744) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2738) : (i64) -> ()
            %2746 = llvm.mlir.addressof @str274 : !llvm.ptr
            %2747 = func.call @cc_make_function_ref_const(%2746) : (!llvm.ptr) -> i64
            %2748 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2747, %2748) : (i64, i64) -> ()
          }
        }
        %2749 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2749 : i64
      }
      %2750 = func.call @cc_nil_value() : () -> i64
      %2751 = func.call @cc_errorp(%2688) : (i64) -> i64
      %2752 = arith.cmpi ne, %2751, %2750 : i64
      %2753 = scf.if %2752 -> (i64) {
        scf.yield %2688 : i64
      } else {
        %2754 = llvm.mlir.addressof @str275 : !llvm.ptr
        %2755 = arith.constant 2 : i64
        %2756 = func.call @cc_make_string(%2754, %2755) : (!llvm.ptr, i64) -> i64
        %2757 = llvm.mlir.addressof @str276 : !llvm.ptr
        %2758 = arith.constant 7 : i64
        %2759 = func.call @cc_make_string(%2757, %2758) : (!llvm.ptr, i64) -> i64
        %2760 = func.call @cc_intern(%2756, %2759) : (i64, i64) -> i64
        %2761 = func.call @cc_nil_value() : () -> i64
        %2762 = func.call @cc_cons(%2760, %2761) : (i64, i64) -> i64
        %2763 = func.call @cc_values_pack(%2762) : (i64) -> i64
        %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
        %2764 = arith.addi %2760, %__rlasp_stack_elide_zero_115 : i64
        %2765 = llvm.mlir.addressof @str277 : !llvm.ptr
        %2766 = arith.constant 11 : i64
        %2767 = func.call @cc_make_string(%2765, %2766) : (!llvm.ptr, i64) -> i64
        %2768 = func.call @cc_nil_value() : () -> i64
        %2769 = func.call @cc_intern(%2767, %2768) : (i64, i64) -> i64
        %2770 = func.call @cc_nil_value() : () -> i64
        %2771 = func.call @cc_cons(%2769, %2770) : (i64, i64) -> i64
        %2772 = func.call @cc_values_pack(%2771) : (i64) -> i64
        %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
        %2773 = arith.addi %2769, %__rlasp_stack_elide_zero_116 : i64
        %2774 = func.call @cc_nil_value() : () -> i64
        %2775 = func.call @cc_errorp(%2764) : (i64) -> i64
        %2776 = arith.cmpi ne, %2775, %2774 : i64
        %2777 = arith.cmpi eq, %2774, %2774 : i64
        %2778 = arith.andi %2776, %2777 : i1
        %2779 = scf.if %2778 -> (i64) {
          scf.yield %2764 : i64
        } else {
          scf.yield %2774 : i64
        }
        %2780 = func.call @cc_errorp(%2773) : (i64) -> i64
        %2781 = arith.cmpi ne, %2780, %2774 : i64
        %2782 = arith.cmpi eq, %2779, %2774 : i64
        %2783 = arith.andi %2781, %2782 : i1
        %2784 = scf.if %2783 -> (i64) {
          scf.yield %2773 : i64
        } else {
          scf.yield %2779 : i64
        }
        %2785 = arith.cmpi ne, %2784, %2774 : i64
        scf.if %2785 {
          func.call @stack_push_pointer(%2784) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2764) : (i64) -> ()
          func.call @stack_push_pointer(%2773) : (i64) -> ()
          %2786 = llvm.mlir.addressof @str278 : !llvm.ptr
          %2787 = func.call @cc_make_function_ref_const(%2786) : (!llvm.ptr) -> i64
          %2788 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2787, %2788) : (i64, i64) -> ()
        }
        %2789 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2789 : i64
      }
      %2790 = func.call @cc_nil_value() : () -> i64
      %2791 = func.call @cc_errorp(%2753) : (i64) -> i64
      %2792 = arith.cmpi ne, %2791, %2790 : i64
      %2793 = scf.if %2792 -> (i64) {
        scf.yield %2753 : i64
      } else {
        %2794 = llvm.mlir.addressof @str279 : !llvm.ptr
        %2795 = arith.constant 4 : i64
        %2796 = func.call @cc_make_string(%2794, %2795) : (!llvm.ptr, i64) -> i64
        %2797 = llvm.mlir.addressof @str280 : !llvm.ptr
        %2798 = arith.constant 11 : i64
        %2799 = func.call @cc_make_string(%2797, %2798) : (!llvm.ptr, i64) -> i64
        %2800 = func.call @cc_intern(%2796, %2799) : (i64, i64) -> i64
        %2801 = func.call @cc_nil_value() : () -> i64
        %2802 = func.call @cc_cons(%2800, %2801) : (i64, i64) -> i64
        %2803 = func.call @cc_values_pack(%2802) : (i64) -> i64
        %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
        %2804 = arith.addi %2800, %__rlasp_stack_elide_zero_117 : i64
        %2805 = func.call @cc_string(%2804) : (i64) -> i64
        %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
        %2806 = arith.addi %2805, %__rlasp_stack_elide_zero_118 : i64
        %2807 = llvm.mlir.addressof @str281 : !llvm.ptr
        %2808 = arith.constant 11 : i64
        %2809 = func.call @cc_make_string(%2807, %2808) : (!llvm.ptr, i64) -> i64
        %2810 = func.call @cc_nil_value() : () -> i64
        %2811 = func.call @cc_intern(%2809, %2810) : (i64, i64) -> i64
        %2812 = func.call @cc_nil_value() : () -> i64
        %2813 = func.call @cc_cons(%2811, %2812) : (i64, i64) -> i64
        %2814 = func.call @cc_values_pack(%2813) : (i64) -> i64
        %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
        %2815 = arith.addi %2811, %__rlasp_stack_elide_zero_119 : i64
        %2816 = func.call @cc_nil_value() : () -> i64
        %2817 = func.call @cc_errorp(%2806) : (i64) -> i64
        %2818 = arith.cmpi ne, %2817, %2816 : i64
        %2819 = arith.cmpi eq, %2816, %2816 : i64
        %2820 = arith.andi %2818, %2819 : i1
        %2821 = scf.if %2820 -> (i64) {
          scf.yield %2806 : i64
        } else {
          scf.yield %2816 : i64
        }
        %2822 = func.call @cc_errorp(%2815) : (i64) -> i64
        %2823 = arith.cmpi ne, %2822, %2816 : i64
        %2824 = arith.cmpi eq, %2821, %2816 : i64
        %2825 = arith.andi %2823, %2824 : i1
        %2826 = scf.if %2825 -> (i64) {
          scf.yield %2815 : i64
        } else {
          scf.yield %2821 : i64
        }
        %2827 = arith.cmpi ne, %2826, %2816 : i64
        scf.if %2827 {
          func.call @stack_push_pointer(%2826) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2806) : (i64) -> ()
          func.call @stack_push_pointer(%2815) : (i64) -> ()
          %2828 = llvm.mlir.addressof @str282 : !llvm.ptr
          %2829 = func.call @cc_make_function_ref_const(%2828) : (!llvm.ptr) -> i64
          %2830 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2829, %2830) : (i64, i64) -> ()
        }
        %2831 = func.call @stack_pop_pointer() : () -> i64
        %2832 = llvm.mlir.addressof @str283 : !llvm.ptr
        %2833 = arith.constant 11 : i64
        %2834 = func.call @cc_make_string(%2832, %2833) : (!llvm.ptr, i64) -> i64
        %2835 = func.call @cc_nil_value() : () -> i64
        %2836 = func.call @cc_intern(%2834, %2835) : (i64, i64) -> i64
        %2837 = func.call @cc_nil_value() : () -> i64
        %2838 = func.call @cc_cons(%2836, %2837) : (i64, i64) -> i64
        %2839 = func.call @cc_values_pack(%2838) : (i64) -> i64
        %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
        %2840 = arith.addi %2836, %__rlasp_stack_elide_zero_120 : i64
        %2841 = func.call @cc_nil_value() : () -> i64
        %2842 = func.call @cc_errorp(%2831) : (i64) -> i64
        %2843 = arith.cmpi ne, %2842, %2841 : i64
        %2844 = arith.cmpi eq, %2841, %2841 : i64
        %2845 = arith.andi %2843, %2844 : i1
        %2846 = scf.if %2845 -> (i64) {
          scf.yield %2831 : i64
        } else {
          scf.yield %2841 : i64
        }
        %2847 = func.call @cc_errorp(%2840) : (i64) -> i64
        %2848 = arith.cmpi ne, %2847, %2841 : i64
        %2849 = arith.cmpi eq, %2846, %2841 : i64
        %2850 = arith.andi %2848, %2849 : i1
        %2851 = scf.if %2850 -> (i64) {
          scf.yield %2840 : i64
        } else {
          scf.yield %2846 : i64
        }
        %2852 = arith.cmpi ne, %2851, %2841 : i64
        scf.if %2852 {
          func.call @stack_push_pointer(%2851) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2831) : (i64) -> ()
          func.call @stack_push_pointer(%2840) : (i64) -> ()
          %2853 = llvm.mlir.addressof @str284 : !llvm.ptr
          %2854 = func.call @cc_make_function_ref_const(%2853) : (!llvm.ptr) -> i64
          %2855 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2854, %2855) : (i64, i64) -> ()
        }
        %2856 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2856 : i64
      }
      %2857 = func.call @cc_nil_value() : () -> i64
      %2858 = func.call @cc_errorp(%2793) : (i64) -> i64
      %2859 = arith.cmpi ne, %2858, %2857 : i64
      %2860 = scf.if %2859 -> (i64) {
        scf.yield %2793 : i64
      } else {
        %2861 = llvm.mlir.addressof @str285 : !llvm.ptr
        %2862 = arith.constant 17 : i64
        %2863 = func.call @cc_make_string(%2861, %2862) : (!llvm.ptr, i64) -> i64
        %2864 = llvm.mlir.addressof @str286 : !llvm.ptr
        %2865 = arith.constant 11 : i64
        %2866 = func.call @cc_make_string(%2864, %2865) : (!llvm.ptr, i64) -> i64
        %2867 = func.call @cc_intern(%2863, %2866) : (i64, i64) -> i64
        %2868 = func.call @cc_nil_value() : () -> i64
        %2869 = func.call @cc_cons(%2867, %2868) : (i64, i64) -> i64
        %2870 = func.call @cc_values_pack(%2869) : (i64) -> i64
        %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
        %2871 = arith.addi %2867, %__rlasp_stack_elide_zero_121 : i64
        %2872 = func.call @cc_string(%2871) : (i64) -> i64
        %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
        %2873 = arith.addi %2872, %__rlasp_stack_elide_zero_122 : i64
        %2874 = llvm.mlir.addressof @str287 : !llvm.ptr
        %2875 = arith.constant 11 : i64
        %2876 = func.call @cc_make_string(%2874, %2875) : (!llvm.ptr, i64) -> i64
        %2877 = func.call @cc_nil_value() : () -> i64
        %2878 = func.call @cc_intern(%2876, %2877) : (i64, i64) -> i64
        %2879 = func.call @cc_nil_value() : () -> i64
        %2880 = func.call @cc_cons(%2878, %2879) : (i64, i64) -> i64
        %2881 = func.call @cc_values_pack(%2880) : (i64) -> i64
        %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
        %2882 = arith.addi %2878, %__rlasp_stack_elide_zero_123 : i64
        %2883 = func.call @cc_nil_value() : () -> i64
        %2884 = func.call @cc_errorp(%2873) : (i64) -> i64
        %2885 = arith.cmpi ne, %2884, %2883 : i64
        %2886 = arith.cmpi eq, %2883, %2883 : i64
        %2887 = arith.andi %2885, %2886 : i1
        %2888 = scf.if %2887 -> (i64) {
          scf.yield %2873 : i64
        } else {
          scf.yield %2883 : i64
        }
        %2889 = func.call @cc_errorp(%2882) : (i64) -> i64
        %2890 = arith.cmpi ne, %2889, %2883 : i64
        %2891 = arith.cmpi eq, %2888, %2883 : i64
        %2892 = arith.andi %2890, %2891 : i1
        %2893 = scf.if %2892 -> (i64) {
          scf.yield %2882 : i64
        } else {
          scf.yield %2888 : i64
        }
        %2894 = arith.cmpi ne, %2893, %2883 : i64
        scf.if %2894 {
          func.call @stack_push_pointer(%2893) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2873) : (i64) -> ()
          func.call @stack_push_pointer(%2882) : (i64) -> ()
          %2895 = llvm.mlir.addressof @str288 : !llvm.ptr
          %2896 = func.call @cc_make_function_ref_const(%2895) : (!llvm.ptr) -> i64
          %2897 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2896, %2897) : (i64, i64) -> ()
        }
        %2898 = func.call @stack_pop_pointer() : () -> i64
        %2899 = llvm.mlir.addressof @str289 : !llvm.ptr
        %2900 = arith.constant 11 : i64
        %2901 = func.call @cc_make_string(%2899, %2900) : (!llvm.ptr, i64) -> i64
        %2902 = func.call @cc_nil_value() : () -> i64
        %2903 = func.call @cc_intern(%2901, %2902) : (i64, i64) -> i64
        %2904 = func.call @cc_nil_value() : () -> i64
        %2905 = func.call @cc_cons(%2903, %2904) : (i64, i64) -> i64
        %2906 = func.call @cc_values_pack(%2905) : (i64) -> i64
        %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
        %2907 = arith.addi %2903, %__rlasp_stack_elide_zero_124 : i64
        %2908 = func.call @cc_nil_value() : () -> i64
        %2909 = func.call @cc_errorp(%2898) : (i64) -> i64
        %2910 = arith.cmpi ne, %2909, %2908 : i64
        %2911 = arith.cmpi eq, %2908, %2908 : i64
        %2912 = arith.andi %2910, %2911 : i1
        %2913 = scf.if %2912 -> (i64) {
          scf.yield %2898 : i64
        } else {
          scf.yield %2908 : i64
        }
        %2914 = func.call @cc_errorp(%2907) : (i64) -> i64
        %2915 = arith.cmpi ne, %2914, %2908 : i64
        %2916 = arith.cmpi eq, %2913, %2908 : i64
        %2917 = arith.andi %2915, %2916 : i1
        %2918 = scf.if %2917 -> (i64) {
          scf.yield %2907 : i64
        } else {
          scf.yield %2913 : i64
        }
        %2919 = arith.cmpi ne, %2918, %2908 : i64
        scf.if %2919 {
          func.call @stack_push_pointer(%2918) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2898) : (i64) -> ()
          func.call @stack_push_pointer(%2907) : (i64) -> ()
          %2920 = llvm.mlir.addressof @str290 : !llvm.ptr
          %2921 = func.call @cc_make_function_ref_const(%2920) : (!llvm.ptr) -> i64
          %2922 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2921, %2922) : (i64, i64) -> ()
        }
        %2923 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2923 : i64
      }
      %2924 = func.call @cc_nil_value() : () -> i64
      %2925 = func.call @cc_errorp(%2860) : (i64) -> i64
      %2926 = arith.cmpi ne, %2925, %2924 : i64
      %2927 = scf.if %2926 -> (i64) {
        scf.yield %2860 : i64
      } else {
        %2928 = llvm.mlir.addressof @str291 : !llvm.ptr
        %2929 = arith.constant 11 : i64
        %2930 = func.call @cc_make_string(%2928, %2929) : (!llvm.ptr, i64) -> i64
        %2931 = func.call @cc_nil_value() : () -> i64
        %2932 = func.call @cc_intern(%2930, %2931) : (i64, i64) -> i64
        %2933 = func.call @cc_nil_value() : () -> i64
        %2934 = func.call @cc_cons(%2932, %2933) : (i64, i64) -> i64
        %2935 = func.call @cc_values_pack(%2934) : (i64) -> i64
        %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
        %2936 = arith.addi %2932, %__rlasp_stack_elide_zero_125 : i64
        %2937 = func.call @cc_nil_value() : () -> i64
        %2938 = func.call @cc_errorp(%2936) : (i64) -> i64
        %2939 = arith.cmpi ne, %2938, %2937 : i64
        %2940 = arith.cmpi eq, %2937, %2937 : i64
        %2941 = arith.andi %2939, %2940 : i1
        %2942 = scf.if %2941 -> (i64) {
          scf.yield %2936 : i64
        } else {
          scf.yield %2937 : i64
        }
        %2943 = arith.cmpi ne, %2942, %2937 : i64
        scf.if %2943 {
          func.call @stack_push_pointer(%2942) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2936) : (i64) -> ()
          %2944 = llvm.mlir.addressof @str292 : !llvm.ptr
          %2945 = func.call @cc_make_function_ref_const(%2944) : (!llvm.ptr) -> i64
          %2946 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2945, %2946) : (i64, i64) -> ()
        }
        %2947 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2947 : i64
      }
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2948 = arith.addi %2927, %__rlasp_stack_elide_zero_126 : i64
      scf.yield %2948 : i64
    }
    %2949 = func.call @cc_nil_value() : () -> i64
    %2950 = func.call @cc_errorp(%2683) : (i64) -> i64
    %2951 = arith.cmpi ne, %2950, %2949 : i64
    %2952 = scf.if %2951 -> (i64) {
      scf.yield %2683 : i64
    } else {
      %2953 = llvm.mlir.addressof @str293 : !llvm.ptr
      %2954 = arith.constant 11 : i64
      %2955 = func.call @cc_make_string(%2953, %2954) : (!llvm.ptr, i64) -> i64
      %2956 = func.call @cc_nil_value() : () -> i64
      %2957 = func.call @cc_intern(%2955, %2956) : (i64, i64) -> i64
      %2958 = func.call @cc_nil_value() : () -> i64
      %2959 = func.call @cc_cons(%2957, %2958) : (i64, i64) -> i64
      %2960 = func.call @cc_values_pack(%2959) : (i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2961 = arith.addi %2957, %__rlasp_stack_elide_zero_127 : i64
      %2962 = func.call @cc_in_package(%2961) : (i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2963 = arith.addi %2962, %__rlasp_stack_elide_zero_128 : i64
      scf.yield %2963 : i64
    }
    %2964 = func.call @cc_nil_value() : () -> i64
    %2965 = func.call @cc_errorp(%2952) : (i64) -> i64
    %2966 = arith.cmpi ne, %2965, %2964 : i64
    %2967 = scf.if %2966 -> (i64) {
      scf.yield %2952 : i64
    } else {
      %2968 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2969 = arith.constant 23 : i64
      %2970 = func.call @cc_make_string(%2968, %2969) : (!llvm.ptr, i64) -> i64
      %2971 = llvm.mlir.addressof @str295 : !llvm.ptr
      %2972 = arith.constant 11 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = func.call @cc_intern(%2970, %2973) : (i64, i64) -> i64
      %2975 = func.call @cc_nil_value() : () -> i64
      %2976 = func.call @cc_cons(%2974, %2975) : (i64, i64) -> i64
      %2977 = func.call @cc_values_pack(%2976) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2978 = func.call @stack_pop_pointer() : () -> i64
      %2979 = func.call @cc_set_symbol_value(%2974, %2978) : (i64, i64) -> i64
      %2980 = func.call @cc_errorp(%2979) : (i64) -> i64
      %2981 = func.call @cc_nil_value() : () -> i64
      %2982 = arith.cmpi ne, %2980, %2981 : i64
      scf.if %2982 {
        func.call @stack_push_pointer(%2979) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2974) : (i64) -> ()
      }
      %2983 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2983 : i64
    }
    %2984 = func.call @cc_nil_value() : () -> i64
    %2985 = func.call @cc_errorp(%2967) : (i64) -> i64
    %2986 = arith.cmpi ne, %2985, %2984 : i64
    %2987 = scf.if %2986 -> (i64) {
      scf.yield %2967 : i64
    } else {
      %2988 = llvm.mlir.addressof @str296 : !llvm.ptr
      %2989 = arith.constant 25 : i64
      %2990 = func.call @cc_make_string(%2988, %2989) : (!llvm.ptr, i64) -> i64
      %2991 = llvm.mlir.addressof @str297 : !llvm.ptr
      %2992 = arith.constant 11 : i64
      %2993 = func.call @cc_make_string(%2991, %2992) : (!llvm.ptr, i64) -> i64
      %2994 = func.call @cc_intern(%2990, %2993) : (i64, i64) -> i64
      %2995 = func.call @cc_nil_value() : () -> i64
      %2996 = func.call @cc_cons(%2994, %2995) : (i64, i64) -> i64
      %2997 = func.call @cc_values_pack(%2996) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2998 = func.call @stack_pop_pointer() : () -> i64
      %2999 = func.call @cc_set_symbol_value(%2994, %2998) : (i64, i64) -> i64
      %3000 = func.call @cc_errorp(%2999) : (i64) -> i64
      %3001 = func.call @cc_nil_value() : () -> i64
      %3002 = arith.cmpi ne, %3000, %3001 : i64
      scf.if %3002 {
        func.call @stack_push_pointer(%2999) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2994) : (i64) -> ()
      }
      %3003 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3003 : i64
    }
    %3004 = func.call @cc_nil_value() : () -> i64
    %3005 = func.call @cc_errorp(%2987) : (i64) -> i64
    %3006 = arith.cmpi ne, %3005, %3004 : i64
    %3007 = scf.if %3006 -> (i64) {
      scf.yield %2987 : i64
    } else {
      %3008 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3009 = arith.constant 23 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3012 = arith.constant 11 : i64
      %3013 = func.call @cc_make_string(%3011, %3012) : (!llvm.ptr, i64) -> i64
      %3014 = func.call @cc_intern(%3010, %3013) : (i64, i64) -> i64
      %3015 = func.call @cc_nil_value() : () -> i64
      %3016 = func.call @cc_cons(%3014, %3015) : (i64, i64) -> i64
      %3017 = func.call @cc_values_pack(%3016) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3018 = func.call @stack_pop_pointer() : () -> i64
      %3019 = func.call @cc_set_symbol_value(%3014, %3018) : (i64, i64) -> i64
      %3020 = func.call @cc_errorp(%3019) : (i64) -> i64
      %3021 = func.call @cc_nil_value() : () -> i64
      %3022 = arith.cmpi ne, %3020, %3021 : i64
      scf.if %3022 {
        func.call @stack_push_pointer(%3019) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3014) : (i64) -> ()
      }
      %3023 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3023 : i64
    }
    %3024 = func.call @cc_nil_value() : () -> i64
    %3025 = func.call @cc_errorp(%3007) : (i64) -> i64
    %3026 = arith.cmpi ne, %3025, %3024 : i64
    %3027 = scf.if %3026 -> (i64) {
      scf.yield %3007 : i64
    } else {
      %3028 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3029 = arith.constant 25 : i64
      %3030 = func.call @cc_make_string(%3028, %3029) : (!llvm.ptr, i64) -> i64
      %3031 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3032 = arith.constant 11 : i64
      %3033 = func.call @cc_make_string(%3031, %3032) : (!llvm.ptr, i64) -> i64
      %3034 = func.call @cc_intern(%3030, %3033) : (i64, i64) -> i64
      %3035 = func.call @cc_nil_value() : () -> i64
      %3036 = func.call @cc_cons(%3034, %3035) : (i64, i64) -> i64
      %3037 = func.call @cc_values_pack(%3036) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3038 = func.call @stack_pop_pointer() : () -> i64
      %3039 = func.call @cc_set_symbol_value(%3034, %3038) : (i64, i64) -> i64
      %3040 = func.call @cc_errorp(%3039) : (i64) -> i64
      %3041 = func.call @cc_nil_value() : () -> i64
      %3042 = arith.cmpi ne, %3040, %3041 : i64
      scf.if %3042 {
        func.call @stack_push_pointer(%3039) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3034) : (i64) -> ()
      }
      %3043 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3043 : i64
    }
    %3044 = func.call @cc_nil_value() : () -> i64
    %3045 = func.call @cc_errorp(%3027) : (i64) -> i64
    %3046 = arith.cmpi ne, %3045, %3044 : i64
    %3047 = scf.if %3046 -> (i64) {
      scf.yield %3027 : i64
    } else {
      %3048 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3049 = arith.constant 19 : i64
      %3050 = func.call @cc_make_string(%3048, %3049) : (!llvm.ptr, i64) -> i64
      %3051 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3052 = arith.constant 11 : i64
      %3053 = func.call @cc_make_string(%3051, %3052) : (!llvm.ptr, i64) -> i64
      %3054 = func.call @cc_intern(%3050, %3053) : (i64, i64) -> i64
      %3055 = func.call @cc_nil_value() : () -> i64
      %3056 = func.call @cc_cons(%3054, %3055) : (i64, i64) -> i64
      %3057 = func.call @cc_values_pack(%3056) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3058 = func.call @stack_pop_pointer() : () -> i64
      %3059 = func.call @cc_set_symbol_value(%3054, %3058) : (i64, i64) -> i64
      %3060 = func.call @cc_errorp(%3059) : (i64) -> i64
      %3061 = func.call @cc_nil_value() : () -> i64
      %3062 = arith.cmpi ne, %3060, %3061 : i64
      scf.if %3062 {
        func.call @stack_push_pointer(%3059) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3054) : (i64) -> ()
      }
      %3063 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3063 : i64
    }
    %3064 = func.call @cc_nil_value() : () -> i64
    %3065 = func.call @cc_errorp(%3047) : (i64) -> i64
    %3066 = arith.cmpi ne, %3065, %3064 : i64
    %3067 = scf.if %3066 -> (i64) {
      scf.yield %3047 : i64
    } else {
      %3068 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3069 = arith.constant 21 : i64
      %3070 = func.call @cc_make_string(%3068, %3069) : (!llvm.ptr, i64) -> i64
      %3071 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3072 = arith.constant 11 : i64
      %3073 = func.call @cc_make_string(%3071, %3072) : (!llvm.ptr, i64) -> i64
      %3074 = func.call @cc_intern(%3070, %3073) : (i64, i64) -> i64
      %3075 = func.call @cc_nil_value() : () -> i64
      %3076 = func.call @cc_cons(%3074, %3075) : (i64, i64) -> i64
      %3077 = func.call @cc_values_pack(%3076) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3078 = func.call @stack_pop_pointer() : () -> i64
      %3079 = func.call @cc_set_symbol_value(%3074, %3078) : (i64, i64) -> i64
      %3080 = func.call @cc_errorp(%3079) : (i64) -> i64
      %3081 = func.call @cc_nil_value() : () -> i64
      %3082 = arith.cmpi ne, %3080, %3081 : i64
      scf.if %3082 {
        func.call @stack_push_pointer(%3079) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3074) : (i64) -> ()
      }
      %3083 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3083 : i64
    }
    %3084 = func.call @cc_nil_value() : () -> i64
    %3085 = func.call @cc_errorp(%3067) : (i64) -> i64
    %3086 = arith.cmpi ne, %3085, %3084 : i64
    %3087 = scf.if %3086 -> (i64) {
      scf.yield %3067 : i64
    } else {
      %3088 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3089 = arith.constant 25 : i64
      %3090 = func.call @cc_make_string(%3088, %3089) : (!llvm.ptr, i64) -> i64
      %3091 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3092 = arith.constant 11 : i64
      %3093 = func.call @cc_make_string(%3091, %3092) : (!llvm.ptr, i64) -> i64
      %3094 = func.call @cc_intern(%3090, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_nil_value() : () -> i64
      %3096 = func.call @cc_cons(%3094, %3095) : (i64, i64) -> i64
      %3097 = func.call @cc_values_pack(%3096) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3098 = func.call @stack_pop_pointer() : () -> i64
      %3099 = func.call @cc_set_symbol_value(%3094, %3098) : (i64, i64) -> i64
      %3100 = func.call @cc_errorp(%3099) : (i64) -> i64
      %3101 = func.call @cc_nil_value() : () -> i64
      %3102 = arith.cmpi ne, %3100, %3101 : i64
      scf.if %3102 {
        func.call @stack_push_pointer(%3099) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3094) : (i64) -> ()
      }
      %3103 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3103 : i64
    }
    %3104 = func.call @cc_nil_value() : () -> i64
    %3105 = func.call @cc_errorp(%3087) : (i64) -> i64
    %3106 = arith.cmpi ne, %3105, %3104 : i64
    %3107 = scf.if %3106 -> (i64) {
      scf.yield %3087 : i64
    } else {
      %3108 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3109 = arith.constant 19 : i64
      %3110 = func.call @cc_make_string(%3108, %3109) : (!llvm.ptr, i64) -> i64
      %3111 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3112 = arith.constant 11 : i64
      %3113 = func.call @cc_make_string(%3111, %3112) : (!llvm.ptr, i64) -> i64
      %3114 = func.call @cc_intern(%3110, %3113) : (i64, i64) -> i64
      %3115 = func.call @cc_nil_value() : () -> i64
      %3116 = func.call @cc_cons(%3114, %3115) : (i64, i64) -> i64
      %3117 = func.call @cc_values_pack(%3116) : (i64) -> i64
      %3118 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3118) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %3119 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %3120 = arith.addi %3119, %__rlasp_stack_elide_zero_129 : i64
      %3121 = func.call @cc_set_symbol_value(%3114, %3120) : (i64, i64) -> i64
      %3122 = func.call @cc_errorp(%3121) : (i64) -> i64
      %3123 = func.call @cc_nil_value() : () -> i64
      %3124 = arith.cmpi ne, %3122, %3123 : i64
      scf.if %3124 {
        func.call @stack_push_pointer(%3121) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3114) : (i64) -> ()
      }
      %3125 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3125 : i64
    }
    %3126 = func.call @cc_nil_value() : () -> i64
    %3127 = func.call @cc_errorp(%3107) : (i64) -> i64
    %3128 = arith.cmpi ne, %3127, %3126 : i64
    %3129 = scf.if %3128 -> (i64) {
      scf.yield %3107 : i64
    } else {
      %3130 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3131 = arith.constant 17 : i64
      %3132 = func.call @cc_make_string(%3130, %3131) : (!llvm.ptr, i64) -> i64
      %3133 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3134 = arith.constant 11 : i64
      %3135 = func.call @cc_make_string(%3133, %3134) : (!llvm.ptr, i64) -> i64
      %3136 = func.call @cc_intern(%3132, %3135) : (i64, i64) -> i64
      %3137 = func.call @cc_nil_value() : () -> i64
      %3138 = func.call @cc_cons(%3136, %3137) : (i64, i64) -> i64
      %3139 = func.call @cc_values_pack(%3138) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3140 = func.call @stack_pop_pointer() : () -> i64
      %3141 = func.call @cc_set_symbol_value(%3136, %3140) : (i64, i64) -> i64
      %3142 = func.call @cc_errorp(%3141) : (i64) -> i64
      %3143 = func.call @cc_nil_value() : () -> i64
      %3144 = arith.cmpi ne, %3142, %3143 : i64
      scf.if %3144 {
        func.call @stack_push_pointer(%3141) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3136) : (i64) -> ()
      }
      %3145 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3145 : i64
    }
    %3146 = func.call @cc_nil_value() : () -> i64
    %3147 = func.call @cc_errorp(%3129) : (i64) -> i64
    %3148 = arith.cmpi ne, %3147, %3146 : i64
    %3149 = scf.if %3148 -> (i64) {
      scf.yield %3129 : i64
    } else {
      %3150 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3151 = arith.constant 13 : i64
      %3152 = func.call @cc_make_string(%3150, %3151) : (!llvm.ptr, i64) -> i64
      %3153 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3154 = arith.constant 11 : i64
      %3155 = func.call @cc_make_string(%3153, %3154) : (!llvm.ptr, i64) -> i64
      %3156 = func.call @cc_intern(%3152, %3155) : (i64, i64) -> i64
      %3157 = func.call @cc_nil_value() : () -> i64
      %3158 = func.call @cc_cons(%3156, %3157) : (i64, i64) -> i64
      %3159 = func.call @cc_values_pack(%3158) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3160 = func.call @stack_pop_pointer() : () -> i64
      %3161 = func.call @cc_set_symbol_value(%3156, %3160) : (i64, i64) -> i64
      %3162 = func.call @cc_errorp(%3161) : (i64) -> i64
      %3163 = func.call @cc_nil_value() : () -> i64
      %3164 = arith.cmpi ne, %3162, %3163 : i64
      scf.if %3164 {
        func.call @stack_push_pointer(%3161) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3156) : (i64) -> ()
      }
      %3165 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3165 : i64
    }
    %3166 = func.call @cc_nil_value() : () -> i64
    %3167 = func.call @cc_errorp(%3149) : (i64) -> i64
    %3168 = arith.cmpi ne, %3167, %3166 : i64
    %3169 = scf.if %3168 -> (i64) {
      scf.yield %3149 : i64
    } else {
      %3170 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3171 = arith.constant 20 : i64
      %3172 = func.call @cc_make_string(%3170, %3171) : (!llvm.ptr, i64) -> i64
      %3173 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3174 = arith.constant 11 : i64
      %3175 = func.call @cc_make_string(%3173, %3174) : (!llvm.ptr, i64) -> i64
      %3176 = func.call @cc_intern(%3172, %3175) : (i64, i64) -> i64
      %3177 = func.call @cc_nil_value() : () -> i64
      %3178 = func.call @cc_cons(%3176, %3177) : (i64, i64) -> i64
      %3179 = func.call @cc_values_pack(%3178) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3180 = func.call @stack_pop_pointer() : () -> i64
      %3181 = func.call @cc_set_symbol_value(%3176, %3180) : (i64, i64) -> i64
      %3182 = func.call @cc_errorp(%3181) : (i64) -> i64
      %3183 = func.call @cc_nil_value() : () -> i64
      %3184 = arith.cmpi ne, %3182, %3183 : i64
      scf.if %3184 {
        func.call @stack_push_pointer(%3181) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3176) : (i64) -> ()
      }
      %3185 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3185 : i64
    }
    %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
    %3186 = arith.addi %3169, %__rlasp_stack_elide_zero_130 : i64
    %3187 = func.call @cc_multiple_value_list(%3186) : (i64) -> i64
    %3188 = llvm.mlir.addressof @str316 : !llvm.ptr
    %3189 = arith.constant 37 : i64
    %3190 = func.call @cc_make_string(%3188, %3189) : (!llvm.ptr, i64) -> i64
    %3191 = func.call @cc_nil_value() : () -> i64
    %3192 = func.call @cc_intern(%3190, %3191) : (i64, i64) -> i64
    %3193 = func.call @cc_nil_value() : () -> i64
    %3194 = func.call @cc_cons(%3192, %3193) : (i64, i64) -> i64
    %3195 = func.call @cc_values_pack(%3194) : (i64) -> i64
    %3196 = func.call @cc_symbol_value(%3192) : (i64) -> i64
    %3197 = llvm.mlir.addressof @str317 : !llvm.ptr
    %3198 = arith.constant 39 : i64
    %3199 = func.call @cc_make_string(%3197, %3198) : (!llvm.ptr, i64) -> i64
    %3200 = func.call @cc_nil_value() : () -> i64
    %3201 = func.call @cc_intern(%3199, %3200) : (i64, i64) -> i64
    %3202 = func.call @cc_nil_value() : () -> i64
    %3203 = func.call @cc_cons(%3201, %3202) : (i64, i64) -> i64
    %3204 = func.call @cc_values_pack(%3203) : (i64) -> i64
    %3205 = func.call @cc_symbol_value(%3201) : (i64) -> i64
    %3206 = func.call @cc_nil_value() : () -> i64
    %3207 = arith.cmpi ne, %3196, %3206 : i64
    %3208 = scf.if %3207 -> (i64) {
      scf.yield %3205 : i64
    } else {
      scf.yield %3187 : i64
    }
    %3209 = func.call @cc_values_pack(%3208) : (i64) -> i64
    func.call @stack_push_pointer(%3209) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("level\0Acontrol-string\0Aargs\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETVALUE_96868088414208*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str6("Display a message using ANSI highlighting if possible. LEVEL should be NIL, :ERR,\0A:WARN or :EMPH.\00") : !llvm.array<98 x i8>
  llvm.mlir.global private constant @str7("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str8("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("FRESH-LINE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str10("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str13("~c[~dm\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str23("COMMON-LISP:FORMAT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str24("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str25("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str27("~c[0m\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str28("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str29("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("TERPRI\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str34("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str35("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETVALUE_96868088414209*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str39("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str40("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str42("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str44("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str46("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str48("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str50("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str52("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str54("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str55("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str56("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETVALUE_96868088414210*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str60("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str61("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str62("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str64("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str66("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("~%Duplicate test ~a~%\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str68("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str69("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str70("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("%FN%(setf COMMON-LISP:GETHASH)\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str73("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str74("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str75("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("file&error\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str77("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str78("*__MLIR_BLOCK_RETVALUE_96868088414211*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str80("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str81("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str83("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str85("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str86("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str87("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str89("*__MLIR_BLOCK_RETVALUE_96868088414212*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str90("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str91("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("~@[~%Failures:~%  ~/pprint-fill/~%~]~\0A~@[~%Unexpected Successes:~%  ~/pprint-fill/~%~]~\0A~@[~%Expected Failures:~%  ~/pprint-fill/~%~]\0ASuccesses: ~d\00") : !llvm.array<148 x i8>
  llvm.mlir.global private constant @str94("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str95("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str97("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str99("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str101("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str103("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str104("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str105("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str106("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str108("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("Compilation error for file ~a with error  ~a\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str110("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str111("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str112("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str114("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("Duplicate test ~a\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str118("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str119("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str120("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str121("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str122("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str123("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str124("name\0Aform\0Aexpected\0ACOMMON-LISP:ERROR\0Adescription\00") : !llvm.array<49 x i8>
  llvm.mlir.global private constant @str125("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str126("*__MLIR_BLOCK_RETVALUE_96868088414213*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str127("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str128("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str129("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str131("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str133("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str135("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str137("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str139("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str141("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str143("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str144("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str145("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str146("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str147("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str148("Unexpected error~%~t~a~%while evaluating~%~t~a\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str149("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str150("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str153("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str154("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str155("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str156("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str157("name\0Aform\0Aexpected\0Aactual\0Adescription\0ACLASP-TESTS:TEST\00") : !llvm.array<55 x i8>
  llvm.mlir.global private constant @str158("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str159("*__MLIR_BLOCK_RETVALUE_96868088414214*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str160("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str161("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str162("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str164("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str165("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str166("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str168("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str170("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str172("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str173("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str174("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str175("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str176("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str177("Wanted values ~s to~%~{~t~a~%~}but got~%~{~t~a~%~}\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str178("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str179("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("while evaluating~%~t~a~%\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str182("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str183("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str184("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str186("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str187("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str188("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str189("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str190("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str191("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str192("*__MLIR_BLOCK_RETVALUE_96868088414215*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str193("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str194("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str195("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str197("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str198("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str199("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str201("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str202("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str203("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str204("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str205("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str206("Passed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str207("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str208("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str209("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str210("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str211("name\0Aform\0Athunk\0Aexpected\0Adescription\0ATEST\00") : !llvm.array<42 x i8>
  llvm.mlir.global private constant @str212("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str214("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str217("*__MLIR_BLOCK_RETVALUE_96868088414216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str218("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str219("*TRACE-TEST-PROGRESS*\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str220("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("*ERROR-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str222("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str223("TRACE-TEST-BEGIN ~s~%\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str224("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str225("*SEED-NO-RUN*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str226("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str227("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str228("*__MLIR_BLOCK_RETVALUE_96868088414216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str229("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str230("%FN%CLASP-TESTS::NOTE-TEST\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str231("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str232("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str233("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str234("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str235("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str236("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str237("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str239("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str240("*__MLIR_BLOCK_RETVALUE_96868088414217*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str241("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str242("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str243("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str244("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str245("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("%FN%CLASP-TESTS::NOTE-COMPILE-ERROR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str248("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str249("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str250("Regression: compile-file of ~a failed with ~a\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str251("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str252("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str253("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str254("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str255("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str257("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str258("*__MLIR_BLOCK_RETVALUE_96868088414218*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str259("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str260("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str261("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str262("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str263("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str264("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str265("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str266("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str267("*__MLIR_BLOCK_RETVALUE_96868088414219*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str268("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str269("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str271("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str272("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str273("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str275("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str276("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str277("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str280("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str281("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str283("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str285("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str286("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str287("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str288("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str289("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str290("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str291("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str292("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str293("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str295("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str296("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str297("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str299("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str300("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str301("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str303("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str304("*TRACE-TEST-PROGRESS*\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str305("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str306("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str307("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str308("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str309("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str310("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str311("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str312("*SEED-NO-RUN*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str313("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str315("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str317("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%CLASP-TESTS::MESSAGE\00%FN%%test\00%FN%%test\00%FN%CLASP-TESTS::MESSAGE\00\00") : !llvm.array<71 x i8>
}
