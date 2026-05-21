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
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = arith.constant 0 : i64
    %14 = func.call @cc_arg(%12, %13) : (i64, i64) -> i64
    %15 = arith.constant 4 : i64
    %16 = func.call @cc_arg(%12, %15) : (i64, i64) -> i64
    %17 = arith.constant 2 : i64
    %18 = func.call @cc_box_fixnum(%17) : (i64) -> i64
    %19 = func.call @cc_collect_rest_args(%12, %18) : (i64, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = llvm.mlir.addressof @str2 : !llvm.ptr
    %22 = arith.constant 37 : i64
    %23 = func.call @cc_make_string(%21, %22) : (!llvm.ptr, i64) -> i64
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_intern(%23, %24) : (i64, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_cons(%25, %26) : (i64, i64) -> i64
    %28 = func.call @cc_values_pack(%27) : (i64) -> i64
    %29 = func.call @cc_set_symbol_value(%25, %20) : (i64, i64) -> i64
    %30 = llvm.mlir.addressof @str3 : !llvm.ptr
    %31 = arith.constant 38 : i64
    %32 = func.call @cc_make_string(%30, %31) : (!llvm.ptr, i64) -> i64
    %33 = func.call @cc_nil_value() : () -> i64
    %34 = func.call @cc_intern(%32, %33) : (i64, i64) -> i64
    %35 = func.call @cc_nil_value() : () -> i64
    %36 = func.call @cc_cons(%34, %35) : (i64, i64) -> i64
    %37 = func.call @cc_values_pack(%36) : (i64) -> i64
    %38 = func.call @cc_set_symbol_value(%34, %20) : (i64, i64) -> i64
    %39 = llvm.mlir.addressof @str4 : !llvm.ptr
    %40 = arith.constant 39 : i64
    %41 = func.call @cc_make_string(%39, %40) : (!llvm.ptr, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = func.call @cc_intern(%41, %42) : (i64, i64) -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_cons(%43, %44) : (i64, i64) -> i64
    %46 = func.call @cc_values_pack(%45) : (i64) -> i64
    %47 = func.call @cc_set_symbol_value(%43, %20) : (i64, i64) -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_errorp(%48) : (i64) -> i64
    %51 = arith.cmpi ne, %50, %49 : i64
    %52 = scf.if %51 -> (i64) {
      scf.yield %48 : i64
    } else {
      %53 = llvm.mlir.addressof @str5 : !llvm.ptr
      %54 = arith.constant 97 : i64
      %55 = func.call @cc_make_string(%53, %54) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %56 = arith.addi %55, %__rlasp_stack_elide_zero_0 : i64
      scf.yield %56 : i64
    }
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_errorp(%52) : (i64) -> i64
    %59 = arith.cmpi ne, %58, %57 : i64
    %60 = scf.if %59 -> (i64) {
      scf.yield %52 : i64
    } else {
      %61 = llvm.mlir.addressof @str6 : !llvm.ptr
      %62 = arith.constant 17 : i64
      %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
      %64 = llvm.mlir.addressof @str7 : !llvm.ptr
      %65 = arith.constant 11 : i64
      %66 = func.call @cc_make_string(%64, %65) : (!llvm.ptr, i64) -> i64
      %67 = func.call @cc_intern(%63, %66) : (i64, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_cons(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_values_pack(%69) : (i64) -> i64
      %71 = func.call @cc_symbol_value(%67) : (i64) -> i64
      %72 = func.call @cc_nil_value() : () -> i64
      %73 = func.call @cc_errorp(%71) : (i64) -> i64
      %74 = arith.cmpi ne, %73, %72 : i64
      %75 = arith.cmpi eq, %72, %72 : i64
      %76 = arith.andi %74, %75 : i1
      %77 = scf.if %76 -> (i64) {
        scf.yield %71 : i64
      } else {
        scf.yield %72 : i64
      }
      %78 = arith.cmpi ne, %77, %72 : i64
      scf.if %78 {
        func.call @stack_push_pointer(%77) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%71) : (i64) -> ()
        %79 = llvm.mlir.addressof @str8 : !llvm.ptr
        %80 = func.call @cc_make_function_ref_const(%79) : (!llvm.ptr) -> i64
        %81 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%80, %81) : (i64, i64) -> ()
      }
      %82 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %82 : i64
    }
    %83 = func.call @cc_nil_value() : () -> i64
    %84 = func.call @cc_errorp(%60) : (i64) -> i64
    %85 = arith.cmpi ne, %84, %83 : i64
    %86 = scf.if %85 -> (i64) {
      scf.yield %60 : i64
    } else {
      %87 = llvm.mlir.addressof @str9 : !llvm.ptr
      %88 = arith.constant 17 : i64
      %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
      %90 = llvm.mlir.addressof @str10 : !llvm.ptr
      %91 = arith.constant 11 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = func.call @cc_intern(%89, %92) : (i64, i64) -> i64
      %94 = func.call @cc_nil_value() : () -> i64
      %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
      %96 = func.call @cc_values_pack(%95) : (i64) -> i64
      %97 = func.call @cc_symbol_value(%93) : (i64) -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_errorp(%97) : (i64) -> i64
      %100 = arith.cmpi ne, %99, %98 : i64
      %101 = arith.cmpi eq, %98, %98 : i64
      %102 = arith.andi %100, %101 : i1
      %103 = scf.if %102 -> (i64) {
        scf.yield %97 : i64
      } else {
        scf.yield %98 : i64
      }
      %104 = arith.cmpi ne, %103, %98 : i64
      scf.if %104 {
        func.call @stack_push_pointer(%103) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%97) : (i64) -> ()
        %105 = llvm.mlir.addressof @str11 : !llvm.ptr
        %106 = func.call @cc_make_function_ref_const(%105) : (!llvm.ptr) -> i64
        %107 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%106, %107) : (i64, i64) -> ()
      }
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = arith.cmpi ne, %108, %109 : i64
      scf.if %110 {
        %111 = func.call @cc_nil_value() : () -> i64
        %112 = func.call @cc_nil_value() : () -> i64
        %113 = func.call @cc_errorp(%111) : (i64) -> i64
        %114 = arith.cmpi ne, %113, %112 : i64
        %115 = scf.if %114 -> (i64) {
          scf.yield %111 : i64
        } else {
          %116 = func.call @cc_t_value() : () -> i64
          %117 = llvm.mlir.addressof @str12 : !llvm.ptr
          %118 = arith.constant 6 : i64
          %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
          %120 = arith.constant 27 : i64
          %121 = func.call @cc_box_character(%120) : (i64) -> i64
          %122 = func.call @cc_nil_value() : () -> i64
          %123 = func.call @cc_nil_value() : () -> i64
          %124 = func.call @cc_errorp(%122) : (i64) -> i64
          %125 = arith.cmpi ne, %124, %123 : i64
          %126 = scf.if %125 -> (i64) {
            scf.yield %122 : i64
          } else {
            func.call @stack_push_pointer(%14) : (i64) -> ()
            %127 = llvm.mlir.addressof @str13 : !llvm.ptr
            %128 = arith.constant 3 : i64
            %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
            %130 = llvm.mlir.addressof @str14 : !llvm.ptr
            %131 = arith.constant 7 : i64
            %132 = func.call @cc_make_string(%130, %131) : (!llvm.ptr, i64) -> i64
            %133 = func.call @cc_intern(%129, %132) : (i64, i64) -> i64
            %134 = func.call @cc_nil_value() : () -> i64
            %135 = func.call @cc_cons(%133, %134) : (i64, i64) -> i64
            %136 = func.call @cc_values_pack(%135) : (i64) -> i64
            %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
            %137 = arith.addi %133, %__rlasp_stack_elide_zero_1 : i64
            %138 = func.call @stack_pop_pointer() : () -> i64
            %139 = func.call @cc_eq(%138, %137) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
            %140 = arith.addi %139, %__rlasp_stack_elide_zero_2 : i64
            %141 = func.call @cc_nil_value() : () -> i64
            %142 = arith.cmpi ne, %140, %141 : i64
            scf.if %142 {
              %143 = arith.constant 31 : i64
              func.call @stack_push_fixnum(%143) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%14) : (i64) -> ()
              %144 = llvm.mlir.addressof @str15 : !llvm.ptr
              %145 = arith.constant 4 : i64
              %146 = func.call @cc_make_string(%144, %145) : (!llvm.ptr, i64) -> i64
              %147 = llvm.mlir.addressof @str16 : !llvm.ptr
              %148 = arith.constant 7 : i64
              %149 = func.call @cc_make_string(%147, %148) : (!llvm.ptr, i64) -> i64
              %150 = func.call @cc_intern(%146, %149) : (i64, i64) -> i64
              %151 = func.call @cc_nil_value() : () -> i64
              %152 = func.call @cc_cons(%150, %151) : (i64, i64) -> i64
              %153 = func.call @cc_values_pack(%152) : (i64) -> i64
              %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
              %154 = arith.addi %150, %__rlasp_stack_elide_zero_3 : i64
              %155 = func.call @stack_pop_pointer() : () -> i64
              %156 = func.call @cc_eq(%155, %154) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
              %157 = arith.addi %156, %__rlasp_stack_elide_zero_4 : i64
              %158 = func.call @cc_nil_value() : () -> i64
              %159 = arith.cmpi ne, %157, %158 : i64
              scf.if %159 {
                %160 = arith.constant 33 : i64
                func.call @stack_push_fixnum(%160) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%14) : (i64) -> ()
                %161 = llvm.mlir.addressof @str17 : !llvm.ptr
                %162 = arith.constant 4 : i64
                %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
                %164 = llvm.mlir.addressof @str18 : !llvm.ptr
                %165 = arith.constant 7 : i64
                %166 = func.call @cc_make_string(%164, %165) : (!llvm.ptr, i64) -> i64
                %167 = func.call @cc_intern(%163, %166) : (i64, i64) -> i64
                %168 = func.call @cc_nil_value() : () -> i64
                %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
                %170 = func.call @cc_values_pack(%169) : (i64) -> i64
                %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
                %171 = arith.addi %167, %__rlasp_stack_elide_zero_5 : i64
                %172 = func.call @stack_pop_pointer() : () -> i64
                %173 = func.call @cc_eq(%172, %171) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
                %174 = arith.addi %173, %__rlasp_stack_elide_zero_6 : i64
                %175 = func.call @cc_nil_value() : () -> i64
                %176 = arith.cmpi ne, %174, %175 : i64
                scf.if %176 {
                  %177 = arith.constant 32 : i64
                  func.call @stack_push_fixnum(%177) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%14) : (i64) -> ()
                  %178 = llvm.mlir.addressof @str19 : !llvm.ptr
                  %179 = arith.constant 9 : i64
                  %180 = func.call @cc_make_string(%178, %179) : (!llvm.ptr, i64) -> i64
                  %181 = llvm.mlir.addressof @str20 : !llvm.ptr
                  %182 = arith.constant 11 : i64
                  %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
                  %184 = func.call @cc_intern(%180, %183) : (i64, i64) -> i64
                  %185 = func.call @cc_nil_value() : () -> i64
                  %186 = func.call @cc_cons(%184, %185) : (i64, i64) -> i64
                  %187 = func.call @cc_values_pack(%186) : (i64) -> i64
                  %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
                  %188 = arith.addi %184, %__rlasp_stack_elide_zero_7 : i64
                  %189 = func.call @stack_pop_pointer() : () -> i64
                  %190 = func.call @cc_eq(%189, %188) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
                  %191 = arith.addi %190, %__rlasp_stack_elide_zero_8 : i64
                  %192 = func.call @cc_nil_value() : () -> i64
                  %193 = arith.cmpi ne, %191, %192 : i64
                  scf.if %193 {
                    %194 = arith.constant 0 : i64
                    func.call @stack_push_fixnum(%194) : (i64) -> ()
                }
              }
            }
            }
            %195 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %195 : i64
          }
          %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
          %196 = arith.addi %126, %__rlasp_stack_elide_zero_9 : i64
          func.call @stack_push_pointer(%116) : (i64) -> ()
          func.call @stack_push_pointer(%119) : (i64) -> ()
          func.call @stack_push_pointer(%121) : (i64) -> ()
          func.call @stack_push_pointer(%196) : (i64) -> ()
          %197 = llvm.mlir.addressof @str21 : !llvm.ptr
          %198 = func.call @cc_make_function_ref_const(%197) : (!llvm.ptr) -> i64
          %199 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%198, %199) : (i64, i64) -> ()
          %200 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %200 : i64
        }
        func.call @stack_push_pointer(%115) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %201 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %201 : i64
    }
    %202 = func.call @cc_nil_value() : () -> i64
    %203 = func.call @cc_errorp(%86) : (i64) -> i64
    %204 = arith.cmpi ne, %203, %202 : i64
    %205 = scf.if %204 -> (i64) {
      scf.yield %86 : i64
    } else {
      %206 = llvm.mlir.addressof @str22 : !llvm.ptr
      %207 = func.call @cc_make_function_ref_const(%206) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %208 = arith.addi %207, %__rlasp_stack_elide_zero_10 : i64
      %209 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      func.call @stack_push_pointer(%16) : (i64) -> ()
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %210 = arith.addi %19, %__rlasp_stack_elide_zero_11 : i64
      %211 = func.call @stack_pop_pointer() : () -> i64
      %212 = func.call @cc_cons(%211, %210) : (i64, i64) -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      %215 = func.call @cc_apply(%208, %214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %216 = arith.addi %215, %__rlasp_stack_elide_zero_12 : i64
      scf.yield %216 : i64
    }
    %217 = func.call @cc_nil_value() : () -> i64
    %218 = func.call @cc_errorp(%205) : (i64) -> i64
    %219 = arith.cmpi ne, %218, %217 : i64
    %220 = scf.if %219 -> (i64) {
      scf.yield %205 : i64
    } else {
      %221 = llvm.mlir.addressof @str23 : !llvm.ptr
      %222 = arith.constant 17 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = llvm.mlir.addressof @str24 : !llvm.ptr
      %225 = arith.constant 11 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = func.call @cc_intern(%223, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      %231 = func.call @cc_symbol_value(%227) : (i64) -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_errorp(%231) : (i64) -> i64
      %234 = arith.cmpi ne, %233, %232 : i64
      %235 = arith.cmpi eq, %232, %232 : i64
      %236 = arith.andi %234, %235 : i1
      %237 = scf.if %236 -> (i64) {
        scf.yield %231 : i64
      } else {
        scf.yield %232 : i64
      }
      %238 = arith.cmpi ne, %237, %232 : i64
      scf.if %238 {
        func.call @stack_push_pointer(%237) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%231) : (i64) -> ()
        %239 = llvm.mlir.addressof @str25 : !llvm.ptr
        %240 = func.call @cc_make_function_ref_const(%239) : (!llvm.ptr) -> i64
        %241 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%240, %241) : (i64, i64) -> ()
      }
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @cc_nil_value() : () -> i64
      %244 = arith.cmpi ne, %242, %243 : i64
      scf.if %244 {
        %245 = func.call @cc_nil_value() : () -> i64
        %246 = func.call @cc_nil_value() : () -> i64
        %247 = func.call @cc_errorp(%245) : (i64) -> i64
        %248 = arith.cmpi ne, %247, %246 : i64
        %249 = scf.if %248 -> (i64) {
          scf.yield %245 : i64
        } else {
          %250 = func.call @cc_t_value() : () -> i64
          %251 = llvm.mlir.addressof @str26 : !llvm.ptr
          %252 = arith.constant 5 : i64
          %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
          %254 = arith.constant 27 : i64
          %255 = func.call @cc_box_character(%254) : (i64) -> i64
          func.call @stack_push_pointer(%250) : (i64) -> ()
          func.call @stack_push_pointer(%253) : (i64) -> ()
          func.call @stack_push_pointer(%255) : (i64) -> ()
          %256 = llvm.mlir.addressof @str27 : !llvm.ptr
          %257 = func.call @cc_make_function_ref_const(%256) : (!llvm.ptr) -> i64
          %258 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%257, %258) : (i64, i64) -> ()
          %259 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %259 : i64
        }
        func.call @stack_push_pointer(%249) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %260 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %260 : i64
    }
    %261 = func.call @cc_nil_value() : () -> i64
    %262 = func.call @cc_errorp(%220) : (i64) -> i64
    %263 = arith.cmpi ne, %262, %261 : i64
    %264 = scf.if %263 -> (i64) {
      scf.yield %220 : i64
    } else {
      %265 = llvm.mlir.addressof @str28 : !llvm.ptr
      %266 = arith.constant 17 : i64
      %267 = func.call @cc_make_string(%265, %266) : (!llvm.ptr, i64) -> i64
      %268 = llvm.mlir.addressof @str29 : !llvm.ptr
      %269 = arith.constant 11 : i64
      %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
      %271 = func.call @cc_intern(%267, %270) : (i64, i64) -> i64
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = func.call @cc_cons(%271, %272) : (i64, i64) -> i64
      %274 = func.call @cc_values_pack(%273) : (i64) -> i64
      %275 = func.call @cc_symbol_value(%271) : (i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_errorp(%275) : (i64) -> i64
      %278 = arith.cmpi ne, %277, %276 : i64
      %279 = arith.cmpi eq, %276, %276 : i64
      %280 = arith.andi %278, %279 : i1
      %281 = scf.if %280 -> (i64) {
        scf.yield %275 : i64
      } else {
        scf.yield %276 : i64
      }
      %282 = arith.cmpi ne, %281, %276 : i64
      scf.if %282 {
        func.call @stack_push_pointer(%281) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%275) : (i64) -> ()
        %283 = llvm.mlir.addressof @str30 : !llvm.ptr
        %284 = func.call @cc_make_function_ref_const(%283) : (!llvm.ptr) -> i64
        %285 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%284, %285) : (i64, i64) -> ()
      }
      %286 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %286 : i64
    }
    %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
    %287 = arith.addi %264, %__rlasp_stack_elide_zero_13 : i64
    %288 = func.call @cc_multiple_value_list(%287) : (i64) -> i64
    %289 = llvm.mlir.addressof @str31 : !llvm.ptr
    %290 = arith.constant 37 : i64
    %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
    %292 = func.call @cc_nil_value() : () -> i64
    %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
    %294 = func.call @cc_nil_value() : () -> i64
    %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
    %296 = func.call @cc_values_pack(%295) : (i64) -> i64
    %297 = func.call @cc_symbol_value(%293) : (i64) -> i64
    %298 = llvm.mlir.addressof @str32 : !llvm.ptr
    %299 = arith.constant 39 : i64
    %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
    %301 = func.call @cc_nil_value() : () -> i64
    %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
    %303 = func.call @cc_nil_value() : () -> i64
    %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
    %305 = func.call @cc_values_pack(%304) : (i64) -> i64
    %306 = func.call @cc_symbol_value(%302) : (i64) -> i64
    %307 = func.call @cc_nil_value() : () -> i64
    %308 = arith.cmpi ne, %297, %307 : i64
    %309 = scf.if %308 -> (i64) {
      scf.yield %306 : i64
    } else {
      scf.yield %288 : i64
    }
    %310 = func.call @cc_values_pack(%309) : (i64) -> i64
    func.call @stack_push_pointer(%310) : (i64) -> ()
    func.return
  }
  func.func @"%FN%reset-clasp-tests"() {
    %311 = llvm.mlir.addressof @str33 : !llvm.ptr
    %312 = arith.constant 17 : i64
    %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
    %314 = func.call @cc_nil_value() : () -> i64
    %315 = func.call @cc_intern(%313, %314) : (i64, i64) -> i64
    %316 = func.call @cc_nil_value() : () -> i64
    %317 = func.call @cc_cons(%315, %316) : (i64, i64) -> i64
    %318 = func.call @cc_values_pack(%317) : (i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = llvm.mlir.addressof @str34 : !llvm.ptr
    %321 = arith.constant 37 : i64
    %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
    %323 = func.call @cc_nil_value() : () -> i64
    %324 = func.call @cc_intern(%322, %323) : (i64, i64) -> i64
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = func.call @cc_cons(%324, %325) : (i64, i64) -> i64
    %327 = func.call @cc_values_pack(%326) : (i64) -> i64
    %328 = func.call @cc_set_symbol_value(%324, %319) : (i64, i64) -> i64
    %329 = llvm.mlir.addressof @str35 : !llvm.ptr
    %330 = arith.constant 38 : i64
    %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = func.call @cc_intern(%331, %332) : (i64, i64) -> i64
    %334 = func.call @cc_nil_value() : () -> i64
    %335 = func.call @cc_cons(%333, %334) : (i64, i64) -> i64
    %336 = func.call @cc_values_pack(%335) : (i64) -> i64
    %337 = func.call @cc_set_symbol_value(%333, %319) : (i64, i64) -> i64
    %338 = llvm.mlir.addressof @str36 : !llvm.ptr
    %339 = arith.constant 39 : i64
    %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_intern(%340, %341) : (i64, i64) -> i64
    %343 = func.call @cc_nil_value() : () -> i64
    %344 = func.call @cc_cons(%342, %343) : (i64, i64) -> i64
    %345 = func.call @cc_values_pack(%344) : (i64) -> i64
    %346 = func.call @cc_set_symbol_value(%342, %319) : (i64, i64) -> i64
    %347 = func.call @cc_nil_value() : () -> i64
    %348 = func.call @cc_nil_value() : () -> i64
    %349 = func.call @cc_errorp(%347) : (i64) -> i64
    %350 = arith.cmpi ne, %349, %348 : i64
    %351 = scf.if %350 -> (i64) {
      scf.yield %347 : i64
    } else {
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = llvm.mlir.addressof @str37 : !llvm.ptr
      %354 = arith.constant 23 : i64
      %355 = func.call @cc_make_string(%353, %354) : (!llvm.ptr, i64) -> i64
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = func.call @cc_intern(%355, %356) : (i64, i64) -> i64
      %358 = func.call @cc_nil_value() : () -> i64
      %359 = func.call @cc_cons(%357, %358) : (i64, i64) -> i64
      %360 = func.call @cc_values_pack(%359) : (i64) -> i64
      %361 = func.call @cc_set_symbol_value(%357, %352) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %362 = arith.addi %352, %__rlasp_stack_elide_zero_14 : i64
      scf.yield %362 : i64
    }
    %363 = func.call @cc_nil_value() : () -> i64
    %364 = func.call @cc_errorp(%351) : (i64) -> i64
    %365 = arith.cmpi ne, %364, %363 : i64
    %366 = scf.if %365 -> (i64) {
      scf.yield %351 : i64
    } else {
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = llvm.mlir.addressof @str38 : !llvm.ptr
      %369 = arith.constant 25 : i64
      %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_intern(%370, %371) : (i64, i64) -> i64
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
      %375 = func.call @cc_values_pack(%374) : (i64) -> i64
      %376 = func.call @cc_set_symbol_value(%372, %367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %377 = arith.addi %367, %__rlasp_stack_elide_zero_15 : i64
      scf.yield %377 : i64
    }
    %378 = func.call @cc_nil_value() : () -> i64
    %379 = func.call @cc_errorp(%366) : (i64) -> i64
    %380 = arith.cmpi ne, %379, %378 : i64
    %381 = scf.if %380 -> (i64) {
      scf.yield %366 : i64
    } else {
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = llvm.mlir.addressof @str39 : !llvm.ptr
      %384 = arith.constant 23 : i64
      %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
      %386 = func.call @cc_nil_value() : () -> i64
      %387 = func.call @cc_intern(%385, %386) : (i64, i64) -> i64
      %388 = func.call @cc_nil_value() : () -> i64
      %389 = func.call @cc_cons(%387, %388) : (i64, i64) -> i64
      %390 = func.call @cc_values_pack(%389) : (i64) -> i64
      %391 = func.call @cc_set_symbol_value(%387, %382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %392 = arith.addi %382, %__rlasp_stack_elide_zero_16 : i64
      scf.yield %392 : i64
    }
    %393 = func.call @cc_nil_value() : () -> i64
    %394 = func.call @cc_errorp(%381) : (i64) -> i64
    %395 = arith.cmpi ne, %394, %393 : i64
    %396 = scf.if %395 -> (i64) {
      scf.yield %381 : i64
    } else {
      %397 = func.call @cc_nil_value() : () -> i64
      %398 = llvm.mlir.addressof @str40 : !llvm.ptr
      %399 = arith.constant 25 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_intern(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      %406 = func.call @cc_set_symbol_value(%402, %397) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %407 = arith.addi %397, %__rlasp_stack_elide_zero_17 : i64
      scf.yield %407 : i64
    }
    %408 = func.call @cc_nil_value() : () -> i64
    %409 = func.call @cc_errorp(%396) : (i64) -> i64
    %410 = arith.cmpi ne, %409, %408 : i64
    %411 = scf.if %410 -> (i64) {
      scf.yield %396 : i64
    } else {
      %412 = func.call @cc_nil_value() : () -> i64
      %413 = llvm.mlir.addressof @str41 : !llvm.ptr
      %414 = arith.constant 25 : i64
      %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
      %416 = func.call @cc_nil_value() : () -> i64
      %417 = func.call @cc_intern(%415, %416) : (i64, i64) -> i64
      %418 = func.call @cc_nil_value() : () -> i64
      %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
      %420 = func.call @cc_values_pack(%419) : (i64) -> i64
      %421 = func.call @cc_set_symbol_value(%417, %412) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %422 = arith.addi %412, %__rlasp_stack_elide_zero_18 : i64
      scf.yield %422 : i64
    }
    %423 = func.call @cc_nil_value() : () -> i64
    %424 = func.call @cc_errorp(%411) : (i64) -> i64
    %425 = arith.cmpi ne, %424, %423 : i64
    %426 = scf.if %425 -> (i64) {
      scf.yield %411 : i64
    } else {
      %427 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %429 = arith.addi %428, %__rlasp_stack_elide_zero_19 : i64
      %430 = llvm.mlir.addressof @str42 : !llvm.ptr
      %431 = arith.constant 19 : i64
      %432 = func.call @cc_make_string(%430, %431) : (!llvm.ptr, i64) -> i64
      %433 = func.call @cc_nil_value() : () -> i64
      %434 = func.call @cc_intern(%432, %433) : (i64, i64) -> i64
      %435 = func.call @cc_nil_value() : () -> i64
      %436 = func.call @cc_cons(%434, %435) : (i64, i64) -> i64
      %437 = func.call @cc_values_pack(%436) : (i64) -> i64
      %438 = func.call @cc_set_symbol_value(%434, %429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %439 = arith.addi %429, %__rlasp_stack_elide_zero_20 : i64
      scf.yield %439 : i64
    }
    %440 = func.call @cc_nil_value() : () -> i64
    %441 = func.call @cc_errorp(%426) : (i64) -> i64
    %442 = arith.cmpi ne, %441, %440 : i64
    %443 = scf.if %442 -> (i64) {
      scf.yield %426 : i64
    } else {
      %444 = func.call @cc_nil_value() : () -> i64
      %445 = llvm.mlir.addressof @str43 : !llvm.ptr
      %446 = arith.constant 17 : i64
      %447 = func.call @cc_make_string(%445, %446) : (!llvm.ptr, i64) -> i64
      %448 = func.call @cc_nil_value() : () -> i64
      %449 = func.call @cc_intern(%447, %448) : (i64, i64) -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
      %452 = func.call @cc_values_pack(%451) : (i64) -> i64
      %453 = func.call @cc_set_symbol_value(%449, %444) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %454 = arith.addi %444, %__rlasp_stack_elide_zero_21 : i64
      scf.yield %454 : i64
    }
    %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
    %455 = arith.addi %443, %__rlasp_stack_elide_zero_22 : i64
    %456 = func.call @cc_multiple_value_list(%455) : (i64) -> i64
    %457 = llvm.mlir.addressof @str44 : !llvm.ptr
    %458 = arith.constant 37 : i64
    %459 = func.call @cc_make_string(%457, %458) : (!llvm.ptr, i64) -> i64
    %460 = func.call @cc_nil_value() : () -> i64
    %461 = func.call @cc_intern(%459, %460) : (i64, i64) -> i64
    %462 = func.call @cc_nil_value() : () -> i64
    %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
    %464 = func.call @cc_values_pack(%463) : (i64) -> i64
    %465 = func.call @cc_symbol_value(%461) : (i64) -> i64
    %466 = llvm.mlir.addressof @str45 : !llvm.ptr
    %467 = arith.constant 39 : i64
    %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
    %469 = func.call @cc_nil_value() : () -> i64
    %470 = func.call @cc_intern(%468, %469) : (i64, i64) -> i64
    %471 = func.call @cc_nil_value() : () -> i64
    %472 = func.call @cc_cons(%470, %471) : (i64, i64) -> i64
    %473 = func.call @cc_values_pack(%472) : (i64) -> i64
    %474 = func.call @cc_symbol_value(%470) : (i64) -> i64
    %475 = func.call @cc_nil_value() : () -> i64
    %476 = arith.cmpi ne, %465, %475 : i64
    %477 = scf.if %476 -> (i64) {
      scf.yield %474 : i64
    } else {
      scf.yield %456 : i64
    }
    %478 = func.call @cc_values_pack(%477) : (i64) -> i64
    func.call @stack_push_pointer(%478) : (i64) -> ()
    func.return
  }
  func.func @"%FN%note-test"() {
    %479 = llvm.mlir.addressof @str46 : !llvm.ptr
    %480 = arith.constant 9 : i64
    %481 = func.call @cc_make_string(%479, %480) : (!llvm.ptr, i64) -> i64
    %482 = func.call @cc_nil_value() : () -> i64
    %483 = func.call @cc_intern(%481, %482) : (i64, i64) -> i64
    %484 = func.call @cc_nil_value() : () -> i64
    %485 = func.call @cc_cons(%483, %484) : (i64, i64) -> i64
    %486 = func.call @cc_values_pack(%485) : (i64) -> i64
    %487 = llvm.mlir.addressof @str47 : !llvm.ptr
    %488 = arith.constant 4 : i64
    %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
    %490 = func.call @cc_register_function_lambda_list_metadata_raw(%483, %489) : (i64, i64) -> i64
    %491 = func.call @stack_pop_pointer() : () -> i64
    %492 = func.call @cc_nil_value() : () -> i64
    %493 = llvm.mlir.addressof @str48 : !llvm.ptr
    %494 = arith.constant 37 : i64
    %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
    %496 = func.call @cc_nil_value() : () -> i64
    %497 = func.call @cc_intern(%495, %496) : (i64, i64) -> i64
    %498 = func.call @cc_nil_value() : () -> i64
    %499 = func.call @cc_cons(%497, %498) : (i64, i64) -> i64
    %500 = func.call @cc_values_pack(%499) : (i64) -> i64
    %501 = func.call @cc_set_symbol_value(%497, %492) : (i64, i64) -> i64
    %502 = llvm.mlir.addressof @str49 : !llvm.ptr
    %503 = arith.constant 38 : i64
    %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
    %505 = func.call @cc_nil_value() : () -> i64
    %506 = func.call @cc_intern(%504, %505) : (i64, i64) -> i64
    %507 = func.call @cc_nil_value() : () -> i64
    %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
    %509 = func.call @cc_values_pack(%508) : (i64) -> i64
    %510 = func.call @cc_set_symbol_value(%506, %492) : (i64, i64) -> i64
    %511 = llvm.mlir.addressof @str50 : !llvm.ptr
    %512 = arith.constant 39 : i64
    %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
    %514 = func.call @cc_nil_value() : () -> i64
    %515 = func.call @cc_intern(%513, %514) : (i64, i64) -> i64
    %516 = func.call @cc_nil_value() : () -> i64
    %517 = func.call @cc_cons(%515, %516) : (i64, i64) -> i64
    %518 = func.call @cc_values_pack(%517) : (i64) -> i64
    %519 = func.call @cc_set_symbol_value(%515, %492) : (i64, i64) -> i64
    func.call @stack_push_pointer(%491) : (i64) -> ()
    %520 = llvm.mlir.addressof @str51 : !llvm.ptr
    %521 = arith.constant 19 : i64
    %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
    %523 = func.call @cc_nil_value() : () -> i64
    %524 = func.call @cc_intern(%522, %523) : (i64, i64) -> i64
    %525 = func.call @cc_nil_value() : () -> i64
    %526 = func.call @cc_cons(%524, %525) : (i64, i64) -> i64
    %527 = func.call @cc_values_pack(%526) : (i64) -> i64
    %528 = func.call @cc_symbol_value(%524) : (i64) -> i64
    func.call @stack_push_pointer(%528) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %529 = func.call @stack_pop_pointer() : () -> i64
    %530 = func.call @stack_pop_pointer() : () -> i64
    %531 = func.call @stack_pop_pointer() : () -> i64
    %532 = func.call @cc_gethash(%531, %530, %529) : (i64, i64, i64) -> i64
    %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
    %533 = arith.addi %532, %__rlasp_stack_elide_zero_23 : i64
    %534 = func.call @cc_nil_value() : () -> i64
    %535 = arith.cmpi ne, %533, %534 : i64
    scf.if %535 {
      %536 = func.call @cc_nil_value() : () -> i64
      %537 = func.call @cc_nil_value() : () -> i64
      %538 = func.call @cc_errorp(%536) : (i64) -> i64
      %539 = arith.cmpi ne, %538, %537 : i64
      %540 = scf.if %539 -> (i64) {
        scf.yield %536 : i64
      } else {
        %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
        %541 = arith.addi %491, %__rlasp_stack_elide_zero_24 : i64
        %542 = llvm.mlir.addressof @str52 : !llvm.ptr
        %543 = arith.constant 17 : i64
        %544 = func.call @cc_make_string(%542, %543) : (!llvm.ptr, i64) -> i64
        %545 = func.call @cc_nil_value() : () -> i64
        %546 = func.call @cc_intern(%544, %545) : (i64, i64) -> i64
        %547 = func.call @cc_nil_value() : () -> i64
        %548 = func.call @cc_cons(%546, %547) : (i64, i64) -> i64
        %549 = func.call @cc_values_pack(%548) : (i64) -> i64
        %550 = func.call @cc_symbol_value(%546) : (i64) -> i64
        %551 = func.call @cc_cons(%541, %550) : (i64, i64) -> i64
        %552 = llvm.mlir.addressof @str53 : !llvm.ptr
        %553 = arith.constant 17 : i64
        %554 = func.call @cc_make_string(%552, %553) : (!llvm.ptr, i64) -> i64
        %555 = func.call @cc_nil_value() : () -> i64
        %556 = func.call @cc_intern(%554, %555) : (i64, i64) -> i64
        %557 = func.call @cc_nil_value() : () -> i64
        %558 = func.call @cc_cons(%556, %557) : (i64, i64) -> i64
        %559 = func.call @cc_values_pack(%558) : (i64) -> i64
        %560 = func.call @cc_set_symbol_value(%556, %551) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
        %561 = arith.addi %551, %__rlasp_stack_elide_zero_25 : i64
        scf.yield %561 : i64
      }
      %562 = func.call @cc_nil_value() : () -> i64
      %563 = func.call @cc_errorp(%540) : (i64) -> i64
      %564 = arith.cmpi ne, %563, %562 : i64
      %565 = scf.if %564 -> (i64) {
        scf.yield %540 : i64
      } else {
        %566 = llvm.mlir.addressof @str54 : !llvm.ptr
        %567 = arith.constant 21 : i64
        %568 = func.call @cc_make_string(%566, %567) : (!llvm.ptr, i64) -> i64
        %569 = func.call @cc_nil_value() : () -> i64
        %570 = func.call @cc_errorp(%568) : (i64) -> i64
        %571 = arith.cmpi ne, %570, %569 : i64
        %572 = arith.cmpi eq, %569, %569 : i64
        %573 = arith.andi %571, %572 : i1
        %574 = scf.if %573 -> (i64) {
          scf.yield %568 : i64
        } else {
          scf.yield %569 : i64
        }
        %575 = func.call @cc_errorp(%491) : (i64) -> i64
        %576 = arith.cmpi ne, %575, %569 : i64
        %577 = arith.cmpi eq, %574, %569 : i64
        %578 = arith.andi %576, %577 : i1
        %579 = scf.if %578 -> (i64) {
          scf.yield %491 : i64
        } else {
          scf.yield %574 : i64
        }
        %580 = arith.cmpi ne, %579, %569 : i64
        scf.if %580 {
          func.call @stack_push_pointer(%579) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%568) : (i64) -> ()
          func.call @stack_push_pointer(%491) : (i64) -> ()
          %581 = llvm.mlir.addressof @str55 : !llvm.ptr
          %582 = func.call @cc_make_function_ref_const(%581) : (!llvm.ptr) -> i64
          %583 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%582, %583) : (i64, i64) -> ()
        }
        %584 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %584 : i64
      }
      func.call @stack_push_pointer(%565) : (i64) -> ()
    } else {
      %585 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %586 = arith.addi %585, %__rlasp_stack_elide_zero_26 : i64
      %587 = func.call @cc_nil_value() : () -> i64
      %588 = arith.cmpi ne, %586, %587 : i64
      scf.if %588 {
        func.call @stack_push_pointer(%491) : (i64) -> ()
        %589 = llvm.mlir.addressof @str56 : !llvm.ptr
        %590 = arith.constant 19 : i64
        %591 = func.call @cc_make_string(%589, %590) : (!llvm.ptr, i64) -> i64
        %592 = func.call @cc_nil_value() : () -> i64
        %593 = func.call @cc_intern(%591, %592) : (i64, i64) -> i64
        %594 = func.call @cc_nil_value() : () -> i64
        %595 = func.call @cc_cons(%593, %594) : (i64, i64) -> i64
        %596 = func.call @cc_values_pack(%595) : (i64) -> i64
        %597 = func.call @cc_symbol_value(%593) : (i64) -> i64
        func.call @stack_push_pointer(%597) : (i64) -> ()
        %598 = func.call @cc_t_value() : () -> i64
        %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
        %599 = arith.addi %598, %__rlasp_stack_elide_zero_27 : i64
        %600 = func.call @stack_pop_pointer() : () -> i64
        %601 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%599) : (i64) -> ()
        func.call @stack_push_pointer(%601) : (i64) -> ()
        func.call @stack_push_pointer(%600) : (i64) -> ()
        %602 = llvm.mlir.addressof @str57 : !llvm.ptr
        %603 = func.call @cc_make_function_ref_const(%602) : (!llvm.ptr) -> i64
        %604 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%603, %604) : (i64, i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
    }
    %605 = func.call @stack_pop_pointer() : () -> i64
    %606 = func.call @cc_multiple_value_list(%605) : (i64) -> i64
    %607 = llvm.mlir.addressof @str58 : !llvm.ptr
    %608 = arith.constant 37 : i64
    %609 = func.call @cc_make_string(%607, %608) : (!llvm.ptr, i64) -> i64
    %610 = func.call @cc_nil_value() : () -> i64
    %611 = func.call @cc_intern(%609, %610) : (i64, i64) -> i64
    %612 = func.call @cc_nil_value() : () -> i64
    %613 = func.call @cc_cons(%611, %612) : (i64, i64) -> i64
    %614 = func.call @cc_values_pack(%613) : (i64) -> i64
    %615 = func.call @cc_symbol_value(%611) : (i64) -> i64
    %616 = llvm.mlir.addressof @str59 : !llvm.ptr
    %617 = arith.constant 39 : i64
    %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
    %619 = func.call @cc_nil_value() : () -> i64
    %620 = func.call @cc_intern(%618, %619) : (i64, i64) -> i64
    %621 = func.call @cc_nil_value() : () -> i64
    %622 = func.call @cc_cons(%620, %621) : (i64, i64) -> i64
    %623 = func.call @cc_values_pack(%622) : (i64) -> i64
    %624 = func.call @cc_symbol_value(%620) : (i64) -> i64
    %625 = func.call @cc_nil_value() : () -> i64
    %626 = arith.cmpi ne, %615, %625 : i64
    %627 = scf.if %626 -> (i64) {
      scf.yield %624 : i64
    } else {
      scf.yield %606 : i64
    }
    %628 = func.call @cc_values_pack(%627) : (i64) -> i64
    func.call @stack_push_pointer(%628) : (i64) -> ()
    func.return
  }
  func.func @"%FN%note-compile-error"() {
    %629 = llvm.mlir.addressof @str60 : !llvm.ptr
    %630 = arith.constant 18 : i64
    %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
    %632 = func.call @cc_nil_value() : () -> i64
    %633 = func.call @cc_intern(%631, %632) : (i64, i64) -> i64
    %634 = func.call @cc_nil_value() : () -> i64
    %635 = func.call @cc_cons(%633, %634) : (i64, i64) -> i64
    %636 = func.call @cc_values_pack(%635) : (i64) -> i64
    %637 = llvm.mlir.addressof @str61 : !llvm.ptr
    %638 = arith.constant 10 : i64
    %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
    %640 = func.call @cc_register_function_lambda_list_metadata_raw(%633, %639) : (i64, i64) -> i64
    %641 = func.call @stack_pop_pointer() : () -> i64
    %642 = func.call @cc_nil_value() : () -> i64
    %643 = llvm.mlir.addressof @str62 : !llvm.ptr
    %644 = arith.constant 37 : i64
    %645 = func.call @cc_make_string(%643, %644) : (!llvm.ptr, i64) -> i64
    %646 = func.call @cc_nil_value() : () -> i64
    %647 = func.call @cc_intern(%645, %646) : (i64, i64) -> i64
    %648 = func.call @cc_nil_value() : () -> i64
    %649 = func.call @cc_cons(%647, %648) : (i64, i64) -> i64
    %650 = func.call @cc_values_pack(%649) : (i64) -> i64
    %651 = func.call @cc_set_symbol_value(%647, %642) : (i64, i64) -> i64
    %652 = llvm.mlir.addressof @str63 : !llvm.ptr
    %653 = arith.constant 38 : i64
    %654 = func.call @cc_make_string(%652, %653) : (!llvm.ptr, i64) -> i64
    %655 = func.call @cc_nil_value() : () -> i64
    %656 = func.call @cc_intern(%654, %655) : (i64, i64) -> i64
    %657 = func.call @cc_nil_value() : () -> i64
    %658 = func.call @cc_cons(%656, %657) : (i64, i64) -> i64
    %659 = func.call @cc_values_pack(%658) : (i64) -> i64
    %660 = func.call @cc_set_symbol_value(%656, %642) : (i64, i64) -> i64
    %661 = llvm.mlir.addressof @str64 : !llvm.ptr
    %662 = arith.constant 39 : i64
    %663 = func.call @cc_make_string(%661, %662) : (!llvm.ptr, i64) -> i64
    %664 = func.call @cc_nil_value() : () -> i64
    %665 = func.call @cc_intern(%663, %664) : (i64, i64) -> i64
    %666 = func.call @cc_nil_value() : () -> i64
    %667 = func.call @cc_cons(%665, %666) : (i64, i64) -> i64
    %668 = func.call @cc_values_pack(%667) : (i64) -> i64
    %669 = func.call @cc_set_symbol_value(%665, %642) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
    %670 = arith.addi %641, %__rlasp_stack_elide_zero_28 : i64
    %671 = llvm.mlir.addressof @str65 : !llvm.ptr
    %672 = arith.constant 25 : i64
    %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
    %674 = func.call @cc_nil_value() : () -> i64
    %675 = func.call @cc_intern(%673, %674) : (i64, i64) -> i64
    %676 = func.call @cc_nil_value() : () -> i64
    %677 = func.call @cc_cons(%675, %676) : (i64, i64) -> i64
    %678 = func.call @cc_values_pack(%677) : (i64) -> i64
    %679 = func.call @cc_symbol_value(%675) : (i64) -> i64
    %680 = func.call @cc_cons(%670, %679) : (i64, i64) -> i64
    %681 = llvm.mlir.addressof @str66 : !llvm.ptr
    %682 = arith.constant 25 : i64
    %683 = func.call @cc_make_string(%681, %682) : (!llvm.ptr, i64) -> i64
    %684 = func.call @cc_nil_value() : () -> i64
    %685 = func.call @cc_intern(%683, %684) : (i64, i64) -> i64
    %686 = func.call @cc_nil_value() : () -> i64
    %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
    %688 = func.call @cc_values_pack(%687) : (i64) -> i64
    %689 = func.call @cc_set_symbol_value(%685, %680) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
    %690 = arith.addi %680, %__rlasp_stack_elide_zero_29 : i64
    %691 = func.call @cc_multiple_value_list(%690) : (i64) -> i64
    %692 = llvm.mlir.addressof @str67 : !llvm.ptr
    %693 = arith.constant 37 : i64
    %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
    %695 = func.call @cc_nil_value() : () -> i64
    %696 = func.call @cc_intern(%694, %695) : (i64, i64) -> i64
    %697 = func.call @cc_nil_value() : () -> i64
    %698 = func.call @cc_cons(%696, %697) : (i64, i64) -> i64
    %699 = func.call @cc_values_pack(%698) : (i64) -> i64
    %700 = func.call @cc_symbol_value(%696) : (i64) -> i64
    %701 = llvm.mlir.addressof @str68 : !llvm.ptr
    %702 = arith.constant 39 : i64
    %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
    %704 = func.call @cc_nil_value() : () -> i64
    %705 = func.call @cc_intern(%703, %704) : (i64, i64) -> i64
    %706 = func.call @cc_nil_value() : () -> i64
    %707 = func.call @cc_cons(%705, %706) : (i64, i64) -> i64
    %708 = func.call @cc_values_pack(%707) : (i64) -> i64
    %709 = func.call @cc_symbol_value(%705) : (i64) -> i64
    %710 = func.call @cc_nil_value() : () -> i64
    %711 = arith.cmpi ne, %700, %710 : i64
    %712 = scf.if %711 -> (i64) {
      scf.yield %709 : i64
    } else {
      scf.yield %691 : i64
    }
    %713 = func.call @cc_values_pack(%712) : (i64) -> i64
    func.call @stack_push_pointer(%713) : (i64) -> ()
    func.return
  }
  func.func @"%FN%show-test-summary"() {
    %714 = llvm.mlir.addressof @str69 : !llvm.ptr
    %715 = arith.constant 17 : i64
    %716 = func.call @cc_make_string(%714, %715) : (!llvm.ptr, i64) -> i64
    %717 = func.call @cc_nil_value() : () -> i64
    %718 = func.call @cc_intern(%716, %717) : (i64, i64) -> i64
    %719 = func.call @cc_nil_value() : () -> i64
    %720 = func.call @cc_cons(%718, %719) : (i64, i64) -> i64
    %721 = func.call @cc_values_pack(%720) : (i64) -> i64
    %722 = func.call @cc_nil_value() : () -> i64
    %723 = llvm.mlir.addressof @str70 : !llvm.ptr
    %724 = arith.constant 37 : i64
    %725 = func.call @cc_make_string(%723, %724) : (!llvm.ptr, i64) -> i64
    %726 = func.call @cc_nil_value() : () -> i64
    %727 = func.call @cc_intern(%725, %726) : (i64, i64) -> i64
    %728 = func.call @cc_nil_value() : () -> i64
    %729 = func.call @cc_cons(%727, %728) : (i64, i64) -> i64
    %730 = func.call @cc_values_pack(%729) : (i64) -> i64
    %731 = func.call @cc_set_symbol_value(%727, %722) : (i64, i64) -> i64
    %732 = llvm.mlir.addressof @str71 : !llvm.ptr
    %733 = arith.constant 38 : i64
    %734 = func.call @cc_make_string(%732, %733) : (!llvm.ptr, i64) -> i64
    %735 = func.call @cc_nil_value() : () -> i64
    %736 = func.call @cc_intern(%734, %735) : (i64, i64) -> i64
    %737 = func.call @cc_nil_value() : () -> i64
    %738 = func.call @cc_cons(%736, %737) : (i64, i64) -> i64
    %739 = func.call @cc_values_pack(%738) : (i64) -> i64
    %740 = func.call @cc_set_symbol_value(%736, %722) : (i64, i64) -> i64
    %741 = llvm.mlir.addressof @str72 : !llvm.ptr
    %742 = arith.constant 39 : i64
    %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = func.call @cc_intern(%743, %744) : (i64, i64) -> i64
    %746 = func.call @cc_nil_value() : () -> i64
    %747 = func.call @cc_cons(%745, %746) : (i64, i64) -> i64
    %748 = func.call @cc_values_pack(%747) : (i64) -> i64
    %749 = func.call @cc_set_symbol_value(%745, %722) : (i64, i64) -> i64
    %750 = func.call @cc_nil_value() : () -> i64
    %751 = func.call @cc_nil_value() : () -> i64
    %752 = func.call @cc_errorp(%750) : (i64) -> i64
    %753 = arith.cmpi ne, %752, %751 : i64
    %754 = scf.if %753 -> (i64) {
      scf.yield %750 : i64
    } else {
      %755 = llvm.mlir.addressof @str73 : !llvm.ptr
      %756 = arith.constant 4 : i64
      %757 = func.call @cc_make_string(%755, %756) : (!llvm.ptr, i64) -> i64
      %758 = llvm.mlir.addressof @str74 : !llvm.ptr
      %759 = arith.constant 7 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      %761 = func.call @cc_intern(%757, %760) : (i64, i64) -> i64
      %762 = func.call @cc_nil_value() : () -> i64
      %763 = func.call @cc_cons(%761, %762) : (i64, i64) -> i64
      %764 = func.call @cc_values_pack(%763) : (i64) -> i64
      %765 = llvm.mlir.addressof @str75 : !llvm.ptr
      %766 = arith.constant 147 : i64
      %767 = func.call @cc_make_string(%765, %766) : (!llvm.ptr, i64) -> i64
      %768 = llvm.mlir.addressof @str76 : !llvm.ptr
      %769 = arith.constant 25 : i64
      %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
      %771 = func.call @cc_nil_value() : () -> i64
      %772 = func.call @cc_intern(%770, %771) : (i64, i64) -> i64
      %773 = func.call @cc_nil_value() : () -> i64
      %774 = func.call @cc_cons(%772, %773) : (i64, i64) -> i64
      %775 = func.call @cc_values_pack(%774) : (i64) -> i64
      %776 = func.call @cc_symbol_value(%772) : (i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %777 = arith.addi %776, %__rlasp_stack_elide_zero_30 : i64
      %778 = func.call @cc_reverse(%777) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %779 = arith.addi %778, %__rlasp_stack_elide_zero_31 : i64
      %780 = llvm.mlir.addressof @str77 : !llvm.ptr
      %781 = arith.constant 25 : i64
      %782 = func.call @cc_make_string(%780, %781) : (!llvm.ptr, i64) -> i64
      %783 = func.call @cc_nil_value() : () -> i64
      %784 = func.call @cc_intern(%782, %783) : (i64, i64) -> i64
      %785 = func.call @cc_nil_value() : () -> i64
      %786 = func.call @cc_cons(%784, %785) : (i64, i64) -> i64
      %787 = func.call @cc_values_pack(%786) : (i64) -> i64
      %788 = func.call @cc_symbol_value(%784) : (i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %789 = arith.addi %788, %__rlasp_stack_elide_zero_32 : i64
      %790 = func.call @cc_reverse(%789) : (i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %791 = arith.addi %790, %__rlasp_stack_elide_zero_33 : i64
      %792 = llvm.mlir.addressof @str78 : !llvm.ptr
      %793 = arith.constant 23 : i64
      %794 = func.call @cc_make_string(%792, %793) : (!llvm.ptr, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_intern(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_nil_value() : () -> i64
      %798 = func.call @cc_cons(%796, %797) : (i64, i64) -> i64
      %799 = func.call @cc_values_pack(%798) : (i64) -> i64
      %800 = func.call @cc_symbol_value(%796) : (i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %801 = arith.addi %800, %__rlasp_stack_elide_zero_34 : i64
      %802 = func.call @cc_reverse(%801) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %803 = arith.addi %802, %__rlasp_stack_elide_zero_35 : i64
      %804 = llvm.mlir.addressof @str79 : !llvm.ptr
      %805 = arith.constant 23 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = func.call @cc_nil_value() : () -> i64
      %808 = func.call @cc_intern(%806, %807) : (i64, i64) -> i64
      %809 = func.call @cc_nil_value() : () -> i64
      %810 = func.call @cc_cons(%808, %809) : (i64, i64) -> i64
      %811 = func.call @cc_values_pack(%810) : (i64) -> i64
      %812 = func.call @cc_symbol_value(%808) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %813 = arith.addi %812, %__rlasp_stack_elide_zero_36 : i64
      %814 = func.call @cc_length(%813) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %815 = arith.addi %814, %__rlasp_stack_elide_zero_37 : i64
      func.call @stack_push_pointer(%761) : (i64) -> ()
      func.call @stack_push_pointer(%767) : (i64) -> ()
      func.call @stack_push_pointer(%779) : (i64) -> ()
      func.call @stack_push_pointer(%791) : (i64) -> ()
      func.call @stack_push_pointer(%803) : (i64) -> ()
      func.call @stack_push_pointer(%815) : (i64) -> ()
      %816 = llvm.mlir.addressof @str80 : !llvm.ptr
      %817 = func.call @cc_make_function_ref_const(%816) : (!llvm.ptr) -> i64
      %818 = arith.constant 6 : i64
      func.call @cc_funcall_stack(%817, %818) : (i64, i64) -> ()
      %819 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %819 : i64
    }
    %820 = func.call @cc_nil_value() : () -> i64
    %821 = func.call @cc_errorp(%754) : (i64) -> i64
    %822 = arith.cmpi ne, %821, %820 : i64
    %823 = scf.if %822 -> (i64) {
      scf.yield %754 : i64
    } else {
      %824 = llvm.mlir.addressof @str81 : !llvm.ptr
      %825 = arith.constant 25 : i64
      %826 = func.call @cc_make_string(%824, %825) : (!llvm.ptr, i64) -> i64
      %827 = func.call @cc_nil_value() : () -> i64
      %828 = func.call @cc_intern(%826, %827) : (i64, i64) -> i64
      %829 = func.call @cc_nil_value() : () -> i64
      %830 = func.call @cc_cons(%828, %829) : (i64, i64) -> i64
      %831 = func.call @cc_values_pack(%830) : (i64) -> i64
      %832 = func.call @cc_symbol_value(%828) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %833 = arith.addi %832, %__rlasp_stack_elide_zero_38 : i64
      %834 = func.call @cc_nil_value() : () -> i64
      %835 = arith.cmpi ne, %833, %834 : i64
      scf.if %835 {
        %836 = func.call @cc_nil_value() : () -> i64
        %837 = func.call @cc_nil_value() : () -> i64
        %838 = func.call @cc_errorp(%836) : (i64) -> i64
        %839 = arith.cmpi ne, %838, %837 : i64
        %840 = scf.if %839 -> (i64) {
          scf.yield %836 : i64
        } else {
          %841 = llvm.mlir.addressof @str82 : !llvm.ptr
          %842 = arith.constant 25 : i64
          %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
          %844 = func.call @cc_nil_value() : () -> i64
          %845 = func.call @cc_intern(%843, %844) : (i64, i64) -> i64
          %846 = func.call @cc_nil_value() : () -> i64
          %847 = func.call @cc_cons(%845, %846) : (i64, i64) -> i64
          %848 = func.call @cc_values_pack(%847) : (i64) -> i64
          %849 = func.call @cc_symbol_value(%845) : (i64) -> i64
          %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
          %850 = arith.addi %849, %__rlasp_stack_elide_zero_39 : i64
          %851:1 = scf.while (%arg0 = %850) : (i64) -> (i64) {
            %852 = func.call @cc_is_cons(%arg0) : (i64) -> i32
            %853 = arith.constant 0 : i32
            %854 = arith.cmpi ne, %852, %853 : i32
            scf.condition(%854) %arg0 : i64
          } do {
            ^bb0(%855: i64):
            %856 = func.call @cc_car(%855) : (i64) -> i64
            %857 = llvm.mlir.addressof @str83 : !llvm.ptr
            %858 = arith.constant 3 : i64
            %859 = func.call @cc_make_string(%857, %858) : (!llvm.ptr, i64) -> i64
            %860 = llvm.mlir.addressof @str84 : !llvm.ptr
            %861 = arith.constant 7 : i64
            %862 = func.call @cc_make_string(%860, %861) : (!llvm.ptr, i64) -> i64
            %863 = func.call @cc_intern(%859, %862) : (i64, i64) -> i64
            %864 = func.call @cc_nil_value() : () -> i64
            %865 = func.call @cc_cons(%863, %864) : (i64, i64) -> i64
            %866 = func.call @cc_values_pack(%865) : (i64) -> i64
            %867 = llvm.mlir.addressof @str85 : !llvm.ptr
            %868 = arith.constant 44 : i64
            %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
            %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
            %870 = arith.addi %856, %__rlasp_stack_elide_zero_40 : i64
            %871 = func.call @cc_car(%870) : (i64) -> i64
            %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
            %872 = arith.addi %871, %__rlasp_stack_elide_zero_41 : i64
            %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
            %873 = arith.addi %856, %__rlasp_stack_elide_zero_42 : i64
            %874 = func.call @cc_cdr(%873) : (i64) -> i64
            %875 = func.call @cc_car(%874) : (i64) -> i64
            %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
            %876 = arith.addi %875, %__rlasp_stack_elide_zero_43 : i64
            func.call @stack_push_pointer(%863) : (i64) -> ()
            func.call @stack_push_pointer(%869) : (i64) -> ()
            func.call @stack_push_pointer(%872) : (i64) -> ()
            func.call @stack_push_pointer(%876) : (i64) -> ()
            %877 = llvm.mlir.addressof @str86 : !llvm.ptr
            %878 = func.call @cc_make_function_ref_const(%877) : (!llvm.ptr) -> i64
            %879 = arith.constant 4 : i64
            func.call @cc_funcall_stack(%878, %879) : (i64, i64) -> ()
            %880 = func.call @stack_depth() : () -> i64
            %881 = arith.constant 0 : i64
            %882 = arith.cmpi sgt, %880, %881 : i64
            scf.if %882 {
              %883 = func.call @stack_pop_pointer() : () -> i64
            }
            %884 = func.call @cc_cdr(%855) : (i64) -> i64
            scf.yield %884 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %885 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %885 : i64
        }
        func.call @stack_push_pointer(%840) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %886 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %886 : i64
    }
    %887 = func.call @cc_nil_value() : () -> i64
    %888 = func.call @cc_errorp(%823) : (i64) -> i64
    %889 = arith.cmpi ne, %888, %887 : i64
    %890 = scf.if %889 -> (i64) {
      scf.yield %823 : i64
    } else {
      %891 = llvm.mlir.addressof @str87 : !llvm.ptr
      %892 = arith.constant 17 : i64
      %893 = func.call @cc_make_string(%891, %892) : (!llvm.ptr, i64) -> i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = func.call @cc_intern(%893, %894) : (i64, i64) -> i64
      %896 = func.call @cc_nil_value() : () -> i64
      %897 = func.call @cc_cons(%895, %896) : (i64, i64) -> i64
      %898 = func.call @cc_values_pack(%897) : (i64) -> i64
      %899 = func.call @cc_symbol_value(%895) : (i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %900 = arith.addi %899, %__rlasp_stack_elide_zero_44 : i64
      %901 = func.call @cc_nil_value() : () -> i64
      %902 = arith.cmpi ne, %900, %901 : i64
      scf.if %902 {
        %903 = func.call @cc_nil_value() : () -> i64
        %904 = func.call @cc_nil_value() : () -> i64
        %905 = func.call @cc_errorp(%903) : (i64) -> i64
        %906 = arith.cmpi ne, %905, %904 : i64
        %907 = scf.if %906 -> (i64) {
          scf.yield %903 : i64
        } else {
          %908 = llvm.mlir.addressof @str88 : !llvm.ptr
          %909 = arith.constant 17 : i64
          %910 = func.call @cc_make_string(%908, %909) : (!llvm.ptr, i64) -> i64
          %911 = func.call @cc_nil_value() : () -> i64
          %912 = func.call @cc_intern(%910, %911) : (i64, i64) -> i64
          %913 = func.call @cc_nil_value() : () -> i64
          %914 = func.call @cc_cons(%912, %913) : (i64, i64) -> i64
          %915 = func.call @cc_values_pack(%914) : (i64) -> i64
          %916 = func.call @cc_symbol_value(%912) : (i64) -> i64
          %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
          %917 = arith.addi %916, %__rlasp_stack_elide_zero_45 : i64
          %918:1 = scf.while (%arg0 = %917) : (i64) -> (i64) {
            %919 = func.call @cc_is_cons(%arg0) : (i64) -> i32
            %920 = arith.constant 0 : i32
            %921 = arith.cmpi ne, %919, %920 : i32
            scf.condition(%921) %arg0 : i64
          } do {
            ^bb0(%922: i64):
            %923 = func.call @cc_car(%922) : (i64) -> i64
            %924 = llvm.mlir.addressof @str89 : !llvm.ptr
            %925 = arith.constant 4 : i64
            %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
            %927 = llvm.mlir.addressof @str90 : !llvm.ptr
            %928 = arith.constant 7 : i64
            %929 = func.call @cc_make_string(%927, %928) : (!llvm.ptr, i64) -> i64
            %930 = func.call @cc_intern(%926, %929) : (i64, i64) -> i64
            %931 = func.call @cc_nil_value() : () -> i64
            %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
            %933 = func.call @cc_values_pack(%932) : (i64) -> i64
            %934 = llvm.mlir.addressof @str91 : !llvm.ptr
            %935 = arith.constant 17 : i64
            %936 = func.call @cc_make_string(%934, %935) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%930) : (i64) -> ()
            func.call @stack_push_pointer(%936) : (i64) -> ()
            func.call @stack_push_pointer(%923) : (i64) -> ()
            %937 = llvm.mlir.addressof @str92 : !llvm.ptr
            %938 = func.call @cc_make_function_ref_const(%937) : (!llvm.ptr) -> i64
            %939 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%938, %939) : (i64, i64) -> ()
            %940 = func.call @stack_depth() : () -> i64
            %941 = arith.constant 0 : i64
            %942 = arith.cmpi sgt, %940, %941 : i64
            scf.if %942 {
              %943 = func.call @stack_pop_pointer() : () -> i64
            }
            %944 = func.call @cc_cdr(%922) : (i64) -> i64
            scf.yield %944 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %945 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %945 : i64
        }
        func.call @stack_push_pointer(%907) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %946 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %946 : i64
    }
    %947 = func.call @cc_nil_value() : () -> i64
    %948 = func.call @cc_errorp(%890) : (i64) -> i64
    %949 = arith.cmpi ne, %948, %947 : i64
    %950 = scf.if %949 -> (i64) {
      scf.yield %890 : i64
    } else {
      %951 = llvm.mlir.addressof @str93 : !llvm.ptr
      %952 = arith.constant 25 : i64
      %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      %959 = func.call @cc_symbol_value(%955) : (i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %960 = arith.addi %959, %__rlasp_stack_elide_zero_46 : i64
      %961 = func.call @cc_nil_value() : () -> i64
      %962 = func.call @cc_cons(%960, %961) : (i64, i64) -> i64
      %963 = func.call @cc_not(%962) : (i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %964 = arith.addi %963, %__rlasp_stack_elide_zero_47 : i64
      scf.yield %964 : i64
    }
    %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
    %965 = arith.addi %950, %__rlasp_stack_elide_zero_48 : i64
    %966 = func.call @cc_multiple_value_list(%965) : (i64) -> i64
    %967 = llvm.mlir.addressof @str94 : !llvm.ptr
    %968 = arith.constant 37 : i64
    %969 = func.call @cc_make_string(%967, %968) : (!llvm.ptr, i64) -> i64
    %970 = func.call @cc_nil_value() : () -> i64
    %971 = func.call @cc_intern(%969, %970) : (i64, i64) -> i64
    %972 = func.call @cc_nil_value() : () -> i64
    %973 = func.call @cc_cons(%971, %972) : (i64, i64) -> i64
    %974 = func.call @cc_values_pack(%973) : (i64) -> i64
    %975 = func.call @cc_symbol_value(%971) : (i64) -> i64
    %976 = llvm.mlir.addressof @str95 : !llvm.ptr
    %977 = arith.constant 39 : i64
    %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
    %979 = func.call @cc_nil_value() : () -> i64
    %980 = func.call @cc_intern(%978, %979) : (i64, i64) -> i64
    %981 = func.call @cc_nil_value() : () -> i64
    %982 = func.call @cc_cons(%980, %981) : (i64, i64) -> i64
    %983 = func.call @cc_values_pack(%982) : (i64) -> i64
    %984 = func.call @cc_symbol_value(%980) : (i64) -> i64
    %985 = func.call @cc_nil_value() : () -> i64
    %986 = arith.cmpi ne, %975, %985 : i64
    %987 = scf.if %986 -> (i64) {
      scf.yield %984 : i64
    } else {
      scf.yield %966 : i64
    }
    %988 = func.call @cc_values_pack(%987) : (i64) -> i64
    func.call @stack_push_pointer(%988) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%fail-test-with-error"() {
    %989 = llvm.mlir.addressof @str96 : !llvm.ptr
    %990 = arith.constant 21 : i64
    %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
    %992 = func.call @cc_nil_value() : () -> i64
    %993 = func.call @cc_intern(%991, %992) : (i64, i64) -> i64
    %994 = func.call @cc_nil_value() : () -> i64
    %995 = func.call @cc_cons(%993, %994) : (i64, i64) -> i64
    %996 = func.call @cc_values_pack(%995) : (i64) -> i64
    %997 = llvm.mlir.addressof @str97 : !llvm.ptr
    %998 = arith.constant 48 : i64
    %999 = func.call @cc_make_string(%997, %998) : (!llvm.ptr, i64) -> i64
    %1000 = func.call @cc_register_function_lambda_list_metadata_raw(%993, %999) : (i64, i64) -> i64
    %1001 = func.call @stack_pop_pointer() : () -> i64
    %1002 = func.call @stack_pop_pointer() : () -> i64
    %1003 = func.call @stack_pop_pointer() : () -> i64
    %1004 = func.call @stack_pop_pointer() : () -> i64
    %1005 = func.call @stack_pop_pointer() : () -> i64
    %1006 = func.call @cc_nil_value() : () -> i64
    %1007 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1008 = arith.constant 37 : i64
    %1009 = func.call @cc_make_string(%1007, %1008) : (!llvm.ptr, i64) -> i64
    %1010 = func.call @cc_nil_value() : () -> i64
    %1011 = func.call @cc_intern(%1009, %1010) : (i64, i64) -> i64
    %1012 = func.call @cc_nil_value() : () -> i64
    %1013 = func.call @cc_cons(%1011, %1012) : (i64, i64) -> i64
    %1014 = func.call @cc_values_pack(%1013) : (i64) -> i64
    %1015 = func.call @cc_set_symbol_value(%1011, %1006) : (i64, i64) -> i64
    %1016 = llvm.mlir.addressof @str99 : !llvm.ptr
    %1017 = arith.constant 38 : i64
    %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
    %1019 = func.call @cc_nil_value() : () -> i64
    %1020 = func.call @cc_intern(%1018, %1019) : (i64, i64) -> i64
    %1021 = func.call @cc_nil_value() : () -> i64
    %1022 = func.call @cc_cons(%1020, %1021) : (i64, i64) -> i64
    %1023 = func.call @cc_values_pack(%1022) : (i64) -> i64
    %1024 = func.call @cc_set_symbol_value(%1020, %1006) : (i64, i64) -> i64
    %1025 = llvm.mlir.addressof @str100 : !llvm.ptr
    %1026 = arith.constant 39 : i64
    %1027 = func.call @cc_make_string(%1025, %1026) : (!llvm.ptr, i64) -> i64
    %1028 = func.call @cc_nil_value() : () -> i64
    %1029 = func.call @cc_intern(%1027, %1028) : (i64, i64) -> i64
    %1030 = func.call @cc_nil_value() : () -> i64
    %1031 = func.call @cc_cons(%1029, %1030) : (i64, i64) -> i64
    %1032 = func.call @cc_values_pack(%1031) : (i64) -> i64
    %1033 = func.call @cc_set_symbol_value(%1029, %1006) : (i64, i64) -> i64
    %1034 = func.call @cc_nil_value() : () -> i64
    %1035 = func.call @cc_nil_value() : () -> i64
    %1036 = func.call @cc_errorp(%1034) : (i64) -> i64
    %1037 = arith.cmpi ne, %1036, %1035 : i64
    %1038 = scf.if %1037 -> (i64) {
      scf.yield %1034 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1039 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1039 : i64
    }
    %1040 = func.call @cc_nil_value() : () -> i64
    %1041 = func.call @cc_errorp(%1038) : (i64) -> i64
    %1042 = arith.cmpi ne, %1041, %1040 : i64
    %1043 = scf.if %1042 -> (i64) {
      scf.yield %1038 : i64
    } else {
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1044 = arith.addi %1005, %__rlasp_stack_elide_zero_49 : i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1045 = arith.addi %1002, %__rlasp_stack_elide_zero_50 : i64
      %1046 = func.call @cc_nil_value() : () -> i64
      %1047 = func.call @cc_errorp(%1044) : (i64) -> i64
      %1048 = arith.cmpi ne, %1047, %1046 : i64
      %1049 = arith.cmpi eq, %1046, %1046 : i64
      %1050 = arith.andi %1048, %1049 : i1
      %1051 = scf.if %1050 -> (i64) {
        scf.yield %1044 : i64
      } else {
        scf.yield %1046 : i64
      }
      %1052 = func.call @cc_errorp(%1045) : (i64) -> i64
      %1053 = arith.cmpi ne, %1052, %1046 : i64
      %1054 = arith.cmpi eq, %1051, %1046 : i64
      %1055 = arith.andi %1053, %1054 : i1
      %1056 = scf.if %1055 -> (i64) {
        scf.yield %1045 : i64
      } else {
        scf.yield %1051 : i64
      }
      %1057 = arith.cmpi ne, %1056, %1046 : i64
      scf.if %1057 {
        func.call @stack_push_pointer(%1056) : (i64) -> ()
      } else {
        %1058 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1058) : (i64) -> ()
        %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
        %1059 = arith.addi %1045, %__rlasp_stack_elide_zero_51 : i64
        %1060 = func.call @stack_pop_pointer() : () -> i64
        %1061 = func.call @cc_cons(%1059, %1060) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1061) : (i64) -> ()
        %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
        %1062 = arith.addi %1044, %__rlasp_stack_elide_zero_52 : i64
        %1063 = func.call @stack_pop_pointer() : () -> i64
        %1064 = func.call @cc_cons(%1062, %1063) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1064) : (i64) -> ()
      }
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1067 = arith.constant 20 : i64
      %1068 = func.call @cc_make_string(%1066, %1067) : (!llvm.ptr, i64) -> i64
      %1069 = func.call @cc_nil_value() : () -> i64
      %1070 = func.call @cc_intern(%1068, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_values_pack(%1072) : (i64) -> i64
      %1074 = func.call @cc_symbol_value(%1070) : (i64) -> i64
      %1075 = func.call @cc_cons(%1065, %1074) : (i64, i64) -> i64
      %1076 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1077 = arith.constant 20 : i64
      %1078 = func.call @cc_make_string(%1076, %1077) : (!llvm.ptr, i64) -> i64
      %1079 = func.call @cc_nil_value() : () -> i64
      %1080 = func.call @cc_intern(%1078, %1079) : (i64, i64) -> i64
      %1081 = func.call @cc_nil_value() : () -> i64
      %1082 = func.call @cc_cons(%1080, %1081) : (i64, i64) -> i64
      %1083 = func.call @cc_values_pack(%1082) : (i64) -> i64
      %1084 = func.call @cc_set_symbol_value(%1080, %1075) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1085 = arith.addi %1075, %__rlasp_stack_elide_zero_53 : i64
      scf.yield %1085 : i64
    }
    %1086 = func.call @cc_nil_value() : () -> i64
    %1087 = func.call @cc_errorp(%1043) : (i64) -> i64
    %1088 = arith.cmpi ne, %1087, %1086 : i64
    %1089 = scf.if %1088 -> (i64) {
      scf.yield %1043 : i64
    } else {
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1090 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1091 = arith.constant 19 : i64
      %1092 = func.call @cc_make_string(%1090, %1091) : (!llvm.ptr, i64) -> i64
      %1093 = func.call @cc_nil_value() : () -> i64
      %1094 = func.call @cc_intern(%1092, %1093) : (i64, i64) -> i64
      %1095 = func.call @cc_nil_value() : () -> i64
      %1096 = func.call @cc_cons(%1094, %1095) : (i64, i64) -> i64
      %1097 = func.call @cc_values_pack(%1096) : (i64) -> i64
      %1098 = func.call @cc_symbol_value(%1094) : (i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1099 = arith.addi %1098, %__rlasp_stack_elide_zero_54 : i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_member(%1100, %1099) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1102 = arith.addi %1101, %__rlasp_stack_elide_zero_55 : i64
      %1103 = func.call @cc_nil_value() : () -> i64
      %1104 = arith.cmpi ne, %1102, %1103 : i64
      scf.if %1104 {
        %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
        %1105 = arith.addi %1005, %__rlasp_stack_elide_zero_56 : i64
        %1106 = llvm.mlir.addressof @str104 : !llvm.ptr
        %1107 = arith.constant 23 : i64
        %1108 = func.call @cc_make_string(%1106, %1107) : (!llvm.ptr, i64) -> i64
        %1109 = func.call @cc_nil_value() : () -> i64
        %1110 = func.call @cc_intern(%1108, %1109) : (i64, i64) -> i64
        %1111 = func.call @cc_nil_value() : () -> i64
        %1112 = func.call @cc_cons(%1110, %1111) : (i64, i64) -> i64
        %1113 = func.call @cc_values_pack(%1112) : (i64) -> i64
        %1114 = func.call @cc_symbol_value(%1110) : (i64) -> i64
        %1115 = func.call @cc_cons(%1105, %1114) : (i64, i64) -> i64
        %1116 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1117 = arith.constant 23 : i64
        %1118 = func.call @cc_make_string(%1116, %1117) : (!llvm.ptr, i64) -> i64
        %1119 = func.call @cc_nil_value() : () -> i64
        %1120 = func.call @cc_intern(%1118, %1119) : (i64, i64) -> i64
        %1121 = func.call @cc_nil_value() : () -> i64
        %1122 = func.call @cc_cons(%1120, %1121) : (i64, i64) -> i64
        %1123 = func.call @cc_values_pack(%1122) : (i64) -> i64
        %1124 = func.call @cc_set_symbol_value(%1120, %1115) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1115) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
        %1125 = arith.addi %1005, %__rlasp_stack_elide_zero_57 : i64
        %1126 = llvm.mlir.addressof @str106 : !llvm.ptr
        %1127 = arith.constant 25 : i64
        %1128 = func.call @cc_make_string(%1126, %1127) : (!llvm.ptr, i64) -> i64
        %1129 = func.call @cc_nil_value() : () -> i64
        %1130 = func.call @cc_intern(%1128, %1129) : (i64, i64) -> i64
        %1131 = func.call @cc_nil_value() : () -> i64
        %1132 = func.call @cc_cons(%1130, %1131) : (i64, i64) -> i64
        %1133 = func.call @cc_values_pack(%1132) : (i64) -> i64
        %1134 = func.call @cc_symbol_value(%1130) : (i64) -> i64
        %1135 = func.call @cc_cons(%1125, %1134) : (i64, i64) -> i64
        %1136 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1137 = arith.constant 25 : i64
        %1138 = func.call @cc_make_string(%1136, %1137) : (!llvm.ptr, i64) -> i64
        %1139 = func.call @cc_nil_value() : () -> i64
        %1140 = func.call @cc_intern(%1138, %1139) : (i64, i64) -> i64
        %1141 = func.call @cc_nil_value() : () -> i64
        %1142 = func.call @cc_cons(%1140, %1141) : (i64, i64) -> i64
        %1143 = func.call @cc_values_pack(%1142) : (i64) -> i64
        %1144 = func.call @cc_set_symbol_value(%1140, %1135) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1135) : (i64) -> ()
      }
      %1145 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1145 : i64
    }
    %1146 = func.call @cc_nil_value() : () -> i64
    %1147 = func.call @cc_errorp(%1089) : (i64) -> i64
    %1148 = arith.cmpi ne, %1147, %1146 : i64
    %1149 = scf.if %1148 -> (i64) {
      scf.yield %1089 : i64
    } else {
      %1150 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1151 = arith.constant 3 : i64
      %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
      %1153 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1154 = arith.constant 7 : i64
      %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
      %1156 = func.call @cc_intern(%1152, %1155) : (i64, i64) -> i64
      %1157 = func.call @cc_nil_value() : () -> i64
      %1158 = func.call @cc_cons(%1156, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_values_pack(%1158) : (i64) -> i64
      %1160 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1161 = arith.constant 9 : i64
      %1162 = func.call @cc_make_string(%1160, %1161) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1156) : (i64) -> ()
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1163 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1164 = func.call @cc_make_function_ref_const(%1163) : (!llvm.ptr) -> i64
      %1165 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1164, %1165) : (i64, i64) -> ()
      %1166 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1166 : i64
    }
    %1167 = func.call @cc_nil_value() : () -> i64
    %1168 = func.call @cc_errorp(%1149) : (i64) -> i64
    %1169 = arith.cmpi ne, %1168, %1167 : i64
    %1170 = scf.if %1169 -> (i64) {
      scf.yield %1149 : i64
    } else {
      %1171 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1172 = arith.constant 4 : i64
      %1173 = func.call @cc_make_string(%1171, %1172) : (!llvm.ptr, i64) -> i64
      %1174 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1175 = arith.constant 7 : i64
      %1176 = func.call @cc_make_string(%1174, %1175) : (!llvm.ptr, i64) -> i64
      %1177 = func.call @cc_intern(%1173, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_nil_value() : () -> i64
      %1179 = func.call @cc_cons(%1177, %1178) : (i64, i64) -> i64
      %1180 = func.call @cc_values_pack(%1179) : (i64) -> i64
      %1181 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1182 = arith.constant 46 : i64
      %1183 = func.call @cc_make_string(%1181, %1182) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1177) : (i64) -> ()
      func.call @stack_push_pointer(%1183) : (i64) -> ()
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      func.call @stack_push_pointer(%1004) : (i64) -> ()
      %1184 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1185 = func.call @cc_make_function_ref_const(%1184) : (!llvm.ptr) -> i64
      %1186 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%1185, %1186) : (i64, i64) -> ()
      %1187 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1187 : i64
    }
    %1188 = func.call @cc_nil_value() : () -> i64
    %1189 = func.call @cc_errorp(%1170) : (i64) -> i64
    %1190 = arith.cmpi ne, %1189, %1188 : i64
    %1191 = scf.if %1190 -> (i64) {
      scf.yield %1170 : i64
    } else {
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1192 = arith.addi %1001, %__rlasp_stack_elide_zero_58 : i64
      %1193 = func.call @cc_nil_value() : () -> i64
      %1194 = arith.cmpi ne, %1192, %1193 : i64
      scf.if %1194 {
        %1195 = func.call @cc_nil_value() : () -> i64
        %1196 = func.call @cc_nil_value() : () -> i64
        %1197 = func.call @cc_errorp(%1195) : (i64) -> i64
        %1198 = arith.cmpi ne, %1197, %1196 : i64
        %1199 = scf.if %1198 -> (i64) {
          scf.yield %1195 : i64
        } else {
          %1200 = llvm.mlir.addressof @str116 : !llvm.ptr
          %1201 = arith.constant 4 : i64
          %1202 = func.call @cc_make_string(%1200, %1201) : (!llvm.ptr, i64) -> i64
          %1203 = llvm.mlir.addressof @str117 : !llvm.ptr
          %1204 = arith.constant 7 : i64
          %1205 = func.call @cc_make_string(%1203, %1204) : (!llvm.ptr, i64) -> i64
          %1206 = func.call @cc_intern(%1202, %1205) : (i64, i64) -> i64
          %1207 = func.call @cc_nil_value() : () -> i64
          %1208 = func.call @cc_cons(%1206, %1207) : (i64, i64) -> i64
          %1209 = func.call @cc_values_pack(%1208) : (i64) -> i64
          %1210 = llvm.mlir.addressof @str118 : !llvm.ptr
          %1211 = arith.constant 2 : i64
          %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1206) : (i64) -> ()
          func.call @stack_push_pointer(%1212) : (i64) -> ()
          func.call @stack_push_pointer(%1001) : (i64) -> ()
          %1213 = llvm.mlir.addressof @str119 : !llvm.ptr
          %1214 = func.call @cc_make_function_ref_const(%1213) : (!llvm.ptr) -> i64
          %1215 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1214, %1215) : (i64, i64) -> ()
          %1216 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1216 : i64
        }
        func.call @stack_push_pointer(%1199) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1217 : i64
    }
    %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
    %1218 = arith.addi %1191, %__rlasp_stack_elide_zero_59 : i64
    %1219 = func.call @cc_multiple_value_list(%1218) : (i64) -> i64
    %1220 = llvm.mlir.addressof @str120 : !llvm.ptr
    %1221 = arith.constant 37 : i64
    %1222 = func.call @cc_make_string(%1220, %1221) : (!llvm.ptr, i64) -> i64
    %1223 = func.call @cc_nil_value() : () -> i64
    %1224 = func.call @cc_intern(%1222, %1223) : (i64, i64) -> i64
    %1225 = func.call @cc_nil_value() : () -> i64
    %1226 = func.call @cc_cons(%1224, %1225) : (i64, i64) -> i64
    %1227 = func.call @cc_values_pack(%1226) : (i64) -> i64
    %1228 = func.call @cc_symbol_value(%1224) : (i64) -> i64
    %1229 = llvm.mlir.addressof @str121 : !llvm.ptr
    %1230 = arith.constant 39 : i64
    %1231 = func.call @cc_make_string(%1229, %1230) : (!llvm.ptr, i64) -> i64
    %1232 = func.call @cc_nil_value() : () -> i64
    %1233 = func.call @cc_intern(%1231, %1232) : (i64, i64) -> i64
    %1234 = func.call @cc_nil_value() : () -> i64
    %1235 = func.call @cc_cons(%1233, %1234) : (i64, i64) -> i64
    %1236 = func.call @cc_values_pack(%1235) : (i64) -> i64
    %1237 = func.call @cc_symbol_value(%1233) : (i64) -> i64
    %1238 = func.call @cc_nil_value() : () -> i64
    %1239 = arith.cmpi ne, %1228, %1238 : i64
    %1240 = scf.if %1239 -> (i64) {
      scf.yield %1237 : i64
    } else {
      scf.yield %1219 : i64
    }
    %1241 = func.call @cc_values_pack(%1240) : (i64) -> i64
    func.call @stack_push_pointer(%1241) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%fail-test"() {
    %1242 = llvm.mlir.addressof @str122 : !llvm.ptr
    %1243 = arith.constant 10 : i64
    %1244 = func.call @cc_make_string(%1242, %1243) : (!llvm.ptr, i64) -> i64
    %1245 = func.call @cc_nil_value() : () -> i64
    %1246 = func.call @cc_intern(%1244, %1245) : (i64, i64) -> i64
    %1247 = func.call @cc_nil_value() : () -> i64
    %1248 = func.call @cc_cons(%1246, %1247) : (i64, i64) -> i64
    %1249 = func.call @cc_values_pack(%1248) : (i64) -> i64
    %1250 = llvm.mlir.addressof @str123 : !llvm.ptr
    %1251 = arith.constant 42 : i64
    %1252 = func.call @cc_make_string(%1250, %1251) : (!llvm.ptr, i64) -> i64
    %1253 = func.call @cc_register_function_lambda_list_metadata_raw(%1246, %1252) : (i64, i64) -> i64
    %1254 = func.call @stack_pop_pointer() : () -> i64
    %1255 = func.call @stack_pop_pointer() : () -> i64
    %1256 = func.call @stack_pop_pointer() : () -> i64
    %1257 = func.call @stack_pop_pointer() : () -> i64
    %1258 = func.call @stack_pop_pointer() : () -> i64
    %1259 = func.call @stack_pop_pointer() : () -> i64
    %1260 = func.call @cc_nil_value() : () -> i64
    %1261 = llvm.mlir.addressof @str124 : !llvm.ptr
    %1262 = arith.constant 37 : i64
    %1263 = func.call @cc_make_string(%1261, %1262) : (!llvm.ptr, i64) -> i64
    %1264 = func.call @cc_nil_value() : () -> i64
    %1265 = func.call @cc_intern(%1263, %1264) : (i64, i64) -> i64
    %1266 = func.call @cc_nil_value() : () -> i64
    %1267 = func.call @cc_cons(%1265, %1266) : (i64, i64) -> i64
    %1268 = func.call @cc_values_pack(%1267) : (i64) -> i64
    %1269 = func.call @cc_set_symbol_value(%1265, %1260) : (i64, i64) -> i64
    %1270 = llvm.mlir.addressof @str125 : !llvm.ptr
    %1271 = arith.constant 38 : i64
    %1272 = func.call @cc_make_string(%1270, %1271) : (!llvm.ptr, i64) -> i64
    %1273 = func.call @cc_nil_value() : () -> i64
    %1274 = func.call @cc_intern(%1272, %1273) : (i64, i64) -> i64
    %1275 = func.call @cc_nil_value() : () -> i64
    %1276 = func.call @cc_cons(%1274, %1275) : (i64, i64) -> i64
    %1277 = func.call @cc_values_pack(%1276) : (i64) -> i64
    %1278 = func.call @cc_set_symbol_value(%1274, %1260) : (i64, i64) -> i64
    %1279 = llvm.mlir.addressof @str126 : !llvm.ptr
    %1280 = arith.constant 39 : i64
    %1281 = func.call @cc_make_string(%1279, %1280) : (!llvm.ptr, i64) -> i64
    %1282 = func.call @cc_nil_value() : () -> i64
    %1283 = func.call @cc_intern(%1281, %1282) : (i64, i64) -> i64
    %1284 = func.call @cc_nil_value() : () -> i64
    %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
    %1286 = func.call @cc_values_pack(%1285) : (i64) -> i64
    %1287 = func.call @cc_set_symbol_value(%1283, %1260) : (i64, i64) -> i64
    %1288 = func.call @cc_nil_value() : () -> i64
    %1289 = func.call @cc_nil_value() : () -> i64
    %1290 = func.call @cc_errorp(%1288) : (i64) -> i64
    %1291 = arith.cmpi ne, %1290, %1289 : i64
    %1292 = scf.if %1291 -> (i64) {
      scf.yield %1288 : i64
    } else {
      func.call @stack_push_pointer(%1259) : (i64) -> ()
      %1293 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1294 = arith.constant 19 : i64
      %1295 = func.call @cc_make_string(%1293, %1294) : (!llvm.ptr, i64) -> i64
      %1296 = func.call @cc_nil_value() : () -> i64
      %1297 = func.call @cc_intern(%1295, %1296) : (i64, i64) -> i64
      %1298 = func.call @cc_nil_value() : () -> i64
      %1299 = func.call @cc_cons(%1297, %1298) : (i64, i64) -> i64
      %1300 = func.call @cc_values_pack(%1299) : (i64) -> i64
      %1301 = func.call @cc_symbol_value(%1297) : (i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1302 = arith.addi %1301, %__rlasp_stack_elide_zero_60 : i64
      %1303 = func.call @stack_pop_pointer() : () -> i64
      %1304 = func.call @cc_member(%1303, %1302) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1305 = arith.addi %1304, %__rlasp_stack_elide_zero_61 : i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = arith.cmpi ne, %1305, %1306 : i64
      scf.if %1307 {
        %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
        %1308 = arith.addi %1259, %__rlasp_stack_elide_zero_62 : i64
        %1309 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1310 = arith.constant 23 : i64
        %1311 = func.call @cc_make_string(%1309, %1310) : (!llvm.ptr, i64) -> i64
        %1312 = func.call @cc_nil_value() : () -> i64
        %1313 = func.call @cc_intern(%1311, %1312) : (i64, i64) -> i64
        %1314 = func.call @cc_nil_value() : () -> i64
        %1315 = func.call @cc_cons(%1313, %1314) : (i64, i64) -> i64
        %1316 = func.call @cc_values_pack(%1315) : (i64) -> i64
        %1317 = func.call @cc_symbol_value(%1313) : (i64) -> i64
        %1318 = func.call @cc_cons(%1308, %1317) : (i64, i64) -> i64
        %1319 = llvm.mlir.addressof @str129 : !llvm.ptr
        %1320 = arith.constant 23 : i64
        %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
        %1322 = func.call @cc_nil_value() : () -> i64
        %1323 = func.call @cc_intern(%1321, %1322) : (i64, i64) -> i64
        %1324 = func.call @cc_nil_value() : () -> i64
        %1325 = func.call @cc_cons(%1323, %1324) : (i64, i64) -> i64
        %1326 = func.call @cc_values_pack(%1325) : (i64) -> i64
        %1327 = func.call @cc_set_symbol_value(%1323, %1318) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1318) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
        %1328 = arith.addi %1259, %__rlasp_stack_elide_zero_63 : i64
        %1329 = llvm.mlir.addressof @str130 : !llvm.ptr
        %1330 = arith.constant 25 : i64
        %1331 = func.call @cc_make_string(%1329, %1330) : (!llvm.ptr, i64) -> i64
        %1332 = func.call @cc_nil_value() : () -> i64
        %1333 = func.call @cc_intern(%1331, %1332) : (i64, i64) -> i64
        %1334 = func.call @cc_nil_value() : () -> i64
        %1335 = func.call @cc_cons(%1333, %1334) : (i64, i64) -> i64
        %1336 = func.call @cc_values_pack(%1335) : (i64) -> i64
        %1337 = func.call @cc_symbol_value(%1333) : (i64) -> i64
        %1338 = func.call @cc_cons(%1328, %1337) : (i64, i64) -> i64
        %1339 = llvm.mlir.addressof @str131 : !llvm.ptr
        %1340 = arith.constant 25 : i64
        %1341 = func.call @cc_make_string(%1339, %1340) : (!llvm.ptr, i64) -> i64
        %1342 = func.call @cc_nil_value() : () -> i64
        %1343 = func.call @cc_intern(%1341, %1342) : (i64, i64) -> i64
        %1344 = func.call @cc_nil_value() : () -> i64
        %1345 = func.call @cc_cons(%1343, %1344) : (i64, i64) -> i64
        %1346 = func.call @cc_values_pack(%1345) : (i64) -> i64
        %1347 = func.call @cc_set_symbol_value(%1343, %1338) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1338) : (i64) -> ()
      }
      %1348 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1348 : i64
    }
    %1349 = func.call @cc_nil_value() : () -> i64
    %1350 = func.call @cc_errorp(%1292) : (i64) -> i64
    %1351 = arith.cmpi ne, %1350, %1349 : i64
    %1352 = scf.if %1351 -> (i64) {
      scf.yield %1292 : i64
    } else {
      %1353 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1354 = arith.constant 3 : i64
      %1355 = func.call @cc_make_string(%1353, %1354) : (!llvm.ptr, i64) -> i64
      %1356 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1357 = arith.constant 7 : i64
      %1358 = func.call @cc_make_string(%1356, %1357) : (!llvm.ptr, i64) -> i64
      %1359 = func.call @cc_intern(%1355, %1358) : (i64, i64) -> i64
      %1360 = func.call @cc_nil_value() : () -> i64
      %1361 = func.call @cc_cons(%1359, %1360) : (i64, i64) -> i64
      %1362 = func.call @cc_values_pack(%1361) : (i64) -> i64
      %1363 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1364 = arith.constant 9 : i64
      %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      func.call @stack_push_pointer(%1365) : (i64) -> ()
      func.call @stack_push_pointer(%1259) : (i64) -> ()
      %1366 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1367 = func.call @cc_make_function_ref_const(%1366) : (!llvm.ptr) -> i64
      %1368 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1367, %1368) : (i64, i64) -> ()
      %1369 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1369 : i64
    }
    %1370 = func.call @cc_nil_value() : () -> i64
    %1371 = func.call @cc_errorp(%1352) : (i64) -> i64
    %1372 = arith.cmpi ne, %1371, %1370 : i64
    %1373 = scf.if %1372 -> (i64) {
      scf.yield %1352 : i64
    } else {
      %1374 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1375 = arith.constant 4 : i64
      %1376 = func.call @cc_make_string(%1374, %1375) : (!llvm.ptr, i64) -> i64
      %1377 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1378 = arith.constant 7 : i64
      %1379 = func.call @cc_make_string(%1377, %1378) : (!llvm.ptr, i64) -> i64
      %1380 = func.call @cc_intern(%1376, %1379) : (i64, i64) -> i64
      %1381 = func.call @cc_nil_value() : () -> i64
      %1382 = func.call @cc_cons(%1380, %1381) : (i64, i64) -> i64
      %1383 = func.call @cc_values_pack(%1382) : (i64) -> i64
      %1384 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1385 = arith.constant 50 : i64
      %1386 = func.call @cc_make_string(%1384, %1385) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1380) : (i64) -> ()
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      func.call @stack_push_pointer(%1256) : (i64) -> ()
      %1387 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1388 = func.call @cc_make_function_ref_const(%1387) : (!llvm.ptr) -> i64
      %1389 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1388, %1389) : (i64, i64) -> ()
      %1390 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1390 : i64
    }
    %1391 = func.call @cc_nil_value() : () -> i64
    %1392 = func.call @cc_errorp(%1373) : (i64) -> i64
    %1393 = arith.cmpi ne, %1392, %1391 : i64
    %1394 = scf.if %1393 -> (i64) {
      scf.yield %1373 : i64
    } else {
      %1395 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1396 = arith.constant 4 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      %1398 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1399 = arith.constant 7 : i64
      %1400 = func.call @cc_make_string(%1398, %1399) : (!llvm.ptr, i64) -> i64
      %1401 = func.call @cc_intern(%1397, %1400) : (i64, i64) -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_cons(%1401, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_values_pack(%1403) : (i64) -> i64
      %1405 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1406 = arith.constant 24 : i64
      %1407 = func.call @cc_make_string(%1405, %1406) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1401) : (i64) -> ()
      func.call @stack_push_pointer(%1407) : (i64) -> ()
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1408 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1409 = func.call @cc_make_function_ref_const(%1408) : (!llvm.ptr) -> i64
      %1410 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1409, %1410) : (i64, i64) -> ()
      %1411 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1411 : i64
    }
    %1412 = func.call @cc_nil_value() : () -> i64
    %1413 = func.call @cc_errorp(%1394) : (i64) -> i64
    %1414 = arith.cmpi ne, %1413, %1412 : i64
    %1415 = scf.if %1414 -> (i64) {
      scf.yield %1394 : i64
    } else {
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1416 = arith.addi %1255, %__rlasp_stack_elide_zero_64 : i64
      %1417 = func.call @cc_nil_value() : () -> i64
      %1418 = arith.cmpi ne, %1416, %1417 : i64
      scf.if %1418 {
        %1419 = func.call @cc_nil_value() : () -> i64
        %1420 = func.call @cc_nil_value() : () -> i64
        %1421 = func.call @cc_errorp(%1419) : (i64) -> i64
        %1422 = arith.cmpi ne, %1421, %1420 : i64
        %1423 = scf.if %1422 -> (i64) {
          scf.yield %1419 : i64
        } else {
          %1424 = llvm.mlir.addressof @str144 : !llvm.ptr
          %1425 = arith.constant 4 : i64
          %1426 = func.call @cc_make_string(%1424, %1425) : (!llvm.ptr, i64) -> i64
          %1427 = llvm.mlir.addressof @str145 : !llvm.ptr
          %1428 = arith.constant 7 : i64
          %1429 = func.call @cc_make_string(%1427, %1428) : (!llvm.ptr, i64) -> i64
          %1430 = func.call @cc_intern(%1426, %1429) : (i64, i64) -> i64
          %1431 = func.call @cc_nil_value() : () -> i64
          %1432 = func.call @cc_cons(%1430, %1431) : (i64, i64) -> i64
          %1433 = func.call @cc_values_pack(%1432) : (i64) -> i64
          %1434 = llvm.mlir.addressof @str146 : !llvm.ptr
          %1435 = arith.constant 2 : i64
          %1436 = func.call @cc_make_string(%1434, %1435) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1430) : (i64) -> ()
          func.call @stack_push_pointer(%1436) : (i64) -> ()
          func.call @stack_push_pointer(%1255) : (i64) -> ()
          %1437 = llvm.mlir.addressof @str147 : !llvm.ptr
          %1438 = func.call @cc_make_function_ref_const(%1437) : (!llvm.ptr) -> i64
          %1439 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1438, %1439) : (i64, i64) -> ()
          %1440 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1440 : i64
        }
        func.call @stack_push_pointer(%1423) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1441 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1441 : i64
    }
    %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
    %1442 = arith.addi %1415, %__rlasp_stack_elide_zero_65 : i64
    %1443 = func.call @cc_multiple_value_list(%1442) : (i64) -> i64
    %1444 = llvm.mlir.addressof @str148 : !llvm.ptr
    %1445 = arith.constant 37 : i64
    %1446 = func.call @cc_make_string(%1444, %1445) : (!llvm.ptr, i64) -> i64
    %1447 = func.call @cc_nil_value() : () -> i64
    %1448 = func.call @cc_intern(%1446, %1447) : (i64, i64) -> i64
    %1449 = func.call @cc_nil_value() : () -> i64
    %1450 = func.call @cc_cons(%1448, %1449) : (i64, i64) -> i64
    %1451 = func.call @cc_values_pack(%1450) : (i64) -> i64
    %1452 = func.call @cc_symbol_value(%1448) : (i64) -> i64
    %1453 = llvm.mlir.addressof @str149 : !llvm.ptr
    %1454 = arith.constant 39 : i64
    %1455 = func.call @cc_make_string(%1453, %1454) : (!llvm.ptr, i64) -> i64
    %1456 = func.call @cc_nil_value() : () -> i64
    %1457 = func.call @cc_intern(%1455, %1456) : (i64, i64) -> i64
    %1458 = func.call @cc_nil_value() : () -> i64
    %1459 = func.call @cc_cons(%1457, %1458) : (i64, i64) -> i64
    %1460 = func.call @cc_values_pack(%1459) : (i64) -> i64
    %1461 = func.call @cc_symbol_value(%1457) : (i64) -> i64
    %1462 = func.call @cc_nil_value() : () -> i64
    %1463 = arith.cmpi ne, %1452, %1462 : i64
    %1464 = scf.if %1463 -> (i64) {
      scf.yield %1461 : i64
    } else {
      scf.yield %1443 : i64
    }
    %1465 = func.call @cc_values_pack(%1464) : (i64) -> i64
    func.call @stack_push_pointer(%1465) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%succeed-test"() {
    %1466 = llvm.mlir.addressof @str150 : !llvm.ptr
    %1467 = arith.constant 13 : i64
    %1468 = func.call @cc_make_string(%1466, %1467) : (!llvm.ptr, i64) -> i64
    %1469 = func.call @cc_nil_value() : () -> i64
    %1470 = func.call @cc_intern(%1468, %1469) : (i64, i64) -> i64
    %1471 = func.call @cc_nil_value() : () -> i64
    %1472 = func.call @cc_cons(%1470, %1471) : (i64, i64) -> i64
    %1473 = func.call @cc_values_pack(%1472) : (i64) -> i64
    %1474 = llvm.mlir.addressof @str151 : !llvm.ptr
    %1475 = arith.constant 4 : i64
    %1476 = func.call @cc_make_string(%1474, %1475) : (!llvm.ptr, i64) -> i64
    %1477 = func.call @cc_register_function_lambda_list_metadata_raw(%1470, %1476) : (i64, i64) -> i64
    %1478 = func.call @stack_pop_pointer() : () -> i64
    %1479 = func.call @cc_nil_value() : () -> i64
    %1480 = llvm.mlir.addressof @str152 : !llvm.ptr
    %1481 = arith.constant 37 : i64
    %1482 = func.call @cc_make_string(%1480, %1481) : (!llvm.ptr, i64) -> i64
    %1483 = func.call @cc_nil_value() : () -> i64
    %1484 = func.call @cc_intern(%1482, %1483) : (i64, i64) -> i64
    %1485 = func.call @cc_nil_value() : () -> i64
    %1486 = func.call @cc_cons(%1484, %1485) : (i64, i64) -> i64
    %1487 = func.call @cc_values_pack(%1486) : (i64) -> i64
    %1488 = func.call @cc_set_symbol_value(%1484, %1479) : (i64, i64) -> i64
    %1489 = llvm.mlir.addressof @str153 : !llvm.ptr
    %1490 = arith.constant 38 : i64
    %1491 = func.call @cc_make_string(%1489, %1490) : (!llvm.ptr, i64) -> i64
    %1492 = func.call @cc_nil_value() : () -> i64
    %1493 = func.call @cc_intern(%1491, %1492) : (i64, i64) -> i64
    %1494 = func.call @cc_nil_value() : () -> i64
    %1495 = func.call @cc_cons(%1493, %1494) : (i64, i64) -> i64
    %1496 = func.call @cc_values_pack(%1495) : (i64) -> i64
    %1497 = func.call @cc_set_symbol_value(%1493, %1479) : (i64, i64) -> i64
    %1498 = llvm.mlir.addressof @str154 : !llvm.ptr
    %1499 = arith.constant 39 : i64
    %1500 = func.call @cc_make_string(%1498, %1499) : (!llvm.ptr, i64) -> i64
    %1501 = func.call @cc_nil_value() : () -> i64
    %1502 = func.call @cc_intern(%1500, %1501) : (i64, i64) -> i64
    %1503 = func.call @cc_nil_value() : () -> i64
    %1504 = func.call @cc_cons(%1502, %1503) : (i64, i64) -> i64
    %1505 = func.call @cc_values_pack(%1504) : (i64) -> i64
    %1506 = func.call @cc_set_symbol_value(%1502, %1479) : (i64, i64) -> i64
    %1507 = func.call @cc_nil_value() : () -> i64
    %1508 = func.call @cc_nil_value() : () -> i64
    %1509 = func.call @cc_errorp(%1507) : (i64) -> i64
    %1510 = arith.cmpi ne, %1509, %1508 : i64
    %1511 = scf.if %1510 -> (i64) {
      scf.yield %1507 : i64
    } else {
      func.call @stack_push_pointer(%1478) : (i64) -> ()
      %1512 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1513 = arith.constant 19 : i64
      %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
      %1515 = func.call @cc_nil_value() : () -> i64
      %1516 = func.call @cc_intern(%1514, %1515) : (i64, i64) -> i64
      %1517 = func.call @cc_nil_value() : () -> i64
      %1518 = func.call @cc_cons(%1516, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_values_pack(%1518) : (i64) -> i64
      %1520 = func.call @cc_symbol_value(%1516) : (i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1521 = arith.addi %1520, %__rlasp_stack_elide_zero_66 : i64
      %1522 = func.call @stack_pop_pointer() : () -> i64
      %1523 = func.call @cc_member(%1522, %1521) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1524 = arith.addi %1523, %__rlasp_stack_elide_zero_67 : i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = arith.cmpi ne, %1524, %1525 : i64
      scf.if %1526 {
        %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
        %1527 = arith.addi %1478, %__rlasp_stack_elide_zero_68 : i64
        %1528 = llvm.mlir.addressof @str156 : !llvm.ptr
        %1529 = arith.constant 25 : i64
        %1530 = func.call @cc_make_string(%1528, %1529) : (!llvm.ptr, i64) -> i64
        %1531 = func.call @cc_nil_value() : () -> i64
        %1532 = func.call @cc_intern(%1530, %1531) : (i64, i64) -> i64
        %1533 = func.call @cc_nil_value() : () -> i64
        %1534 = func.call @cc_cons(%1532, %1533) : (i64, i64) -> i64
        %1535 = func.call @cc_values_pack(%1534) : (i64) -> i64
        %1536 = func.call @cc_symbol_value(%1532) : (i64) -> i64
        %1537 = func.call @cc_cons(%1527, %1536) : (i64, i64) -> i64
        %1538 = llvm.mlir.addressof @str157 : !llvm.ptr
        %1539 = arith.constant 25 : i64
        %1540 = func.call @cc_make_string(%1538, %1539) : (!llvm.ptr, i64) -> i64
        %1541 = func.call @cc_nil_value() : () -> i64
        %1542 = func.call @cc_intern(%1540, %1541) : (i64, i64) -> i64
        %1543 = func.call @cc_nil_value() : () -> i64
        %1544 = func.call @cc_cons(%1542, %1543) : (i64, i64) -> i64
        %1545 = func.call @cc_values_pack(%1544) : (i64) -> i64
        %1546 = func.call @cc_set_symbol_value(%1542, %1537) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1537) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
        %1547 = arith.addi %1478, %__rlasp_stack_elide_zero_69 : i64
        %1548 = llvm.mlir.addressof @str158 : !llvm.ptr
        %1549 = arith.constant 23 : i64
        %1550 = func.call @cc_make_string(%1548, %1549) : (!llvm.ptr, i64) -> i64
        %1551 = func.call @cc_nil_value() : () -> i64
        %1552 = func.call @cc_intern(%1550, %1551) : (i64, i64) -> i64
        %1553 = func.call @cc_nil_value() : () -> i64
        %1554 = func.call @cc_cons(%1552, %1553) : (i64, i64) -> i64
        %1555 = func.call @cc_values_pack(%1554) : (i64) -> i64
        %1556 = func.call @cc_symbol_value(%1552) : (i64) -> i64
        %1557 = func.call @cc_cons(%1547, %1556) : (i64, i64) -> i64
        %1558 = llvm.mlir.addressof @str159 : !llvm.ptr
        %1559 = arith.constant 23 : i64
        %1560 = func.call @cc_make_string(%1558, %1559) : (!llvm.ptr, i64) -> i64
        %1561 = func.call @cc_nil_value() : () -> i64
        %1562 = func.call @cc_intern(%1560, %1561) : (i64, i64) -> i64
        %1563 = func.call @cc_nil_value() : () -> i64
        %1564 = func.call @cc_cons(%1562, %1563) : (i64, i64) -> i64
        %1565 = func.call @cc_values_pack(%1564) : (i64) -> i64
        %1566 = func.call @cc_set_symbol_value(%1562, %1557) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1557) : (i64) -> ()
      }
      %1567 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1567 : i64
    }
    %1568 = func.call @cc_nil_value() : () -> i64
    %1569 = func.call @cc_errorp(%1511) : (i64) -> i64
    %1570 = arith.cmpi ne, %1569, %1568 : i64
    %1571 = scf.if %1570 -> (i64) {
      scf.yield %1511 : i64
    } else {
      %1572 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1573 = arith.constant 4 : i64
      %1574 = func.call @cc_make_string(%1572, %1573) : (!llvm.ptr, i64) -> i64
      %1575 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1576 = arith.constant 7 : i64
      %1577 = func.call @cc_make_string(%1575, %1576) : (!llvm.ptr, i64) -> i64
      %1578 = func.call @cc_intern(%1574, %1577) : (i64, i64) -> i64
      %1579 = func.call @cc_nil_value() : () -> i64
      %1580 = func.call @cc_cons(%1578, %1579) : (i64, i64) -> i64
      %1581 = func.call @cc_values_pack(%1580) : (i64) -> i64
      %1582 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1583 = arith.constant 9 : i64
      %1584 = func.call @cc_make_string(%1582, %1583) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1578) : (i64) -> ()
      func.call @stack_push_pointer(%1584) : (i64) -> ()
      func.call @stack_push_pointer(%1478) : (i64) -> ()
      %1585 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1586 = func.call @cc_make_function_ref_const(%1585) : (!llvm.ptr) -> i64
      %1587 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1586, %1587) : (i64, i64) -> ()
      %1588 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1588 : i64
    }
    %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
    %1589 = arith.addi %1571, %__rlasp_stack_elide_zero_70 : i64
    %1590 = func.call @cc_multiple_value_list(%1589) : (i64) -> i64
    %1591 = llvm.mlir.addressof @str164 : !llvm.ptr
    %1592 = arith.constant 37 : i64
    %1593 = func.call @cc_make_string(%1591, %1592) : (!llvm.ptr, i64) -> i64
    %1594 = func.call @cc_nil_value() : () -> i64
    %1595 = func.call @cc_intern(%1593, %1594) : (i64, i64) -> i64
    %1596 = func.call @cc_nil_value() : () -> i64
    %1597 = func.call @cc_cons(%1595, %1596) : (i64, i64) -> i64
    %1598 = func.call @cc_values_pack(%1597) : (i64) -> i64
    %1599 = func.call @cc_symbol_value(%1595) : (i64) -> i64
    %1600 = llvm.mlir.addressof @str165 : !llvm.ptr
    %1601 = arith.constant 39 : i64
    %1602 = func.call @cc_make_string(%1600, %1601) : (!llvm.ptr, i64) -> i64
    %1603 = func.call @cc_nil_value() : () -> i64
    %1604 = func.call @cc_intern(%1602, %1603) : (i64, i64) -> i64
    %1605 = func.call @cc_nil_value() : () -> i64
    %1606 = func.call @cc_cons(%1604, %1605) : (i64, i64) -> i64
    %1607 = func.call @cc_values_pack(%1606) : (i64) -> i64
    %1608 = func.call @cc_symbol_value(%1604) : (i64) -> i64
    %1609 = func.call @cc_nil_value() : () -> i64
    %1610 = arith.cmpi ne, %1599, %1609 : i64
    %1611 = scf.if %1610 -> (i64) {
      scf.yield %1608 : i64
    } else {
      scf.yield %1590 : i64
    }
    %1612 = func.call @cc_values_pack(%1611) : (i64) -> i64
    func.call @stack_push_pointer(%1612) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%test"() {
    %1613 = llvm.mlir.addressof @str166 : !llvm.ptr
    %1614 = arith.constant 5 : i64
    %1615 = func.call @cc_make_string(%1613, %1614) : (!llvm.ptr, i64) -> i64
    %1616 = func.call @cc_nil_value() : () -> i64
    %1617 = func.call @cc_intern(%1615, %1616) : (i64, i64) -> i64
    %1618 = func.call @cc_nil_value() : () -> i64
    %1619 = func.call @cc_cons(%1617, %1618) : (i64, i64) -> i64
    %1620 = func.call @cc_values_pack(%1619) : (i64) -> i64
    %1621 = llvm.mlir.addressof @str167 : !llvm.ptr
    %1622 = arith.constant 41 : i64
    %1623 = func.call @cc_make_string(%1621, %1622) : (!llvm.ptr, i64) -> i64
    %1624 = func.call @cc_register_function_lambda_list_metadata_raw(%1617, %1623) : (i64, i64) -> i64
    %1625 = func.call @stack_pop_pointer() : () -> i64
    %1626 = arith.constant 0 : i64
    %1627 = func.call @cc_arg(%1625, %1626) : (i64, i64) -> i64
    %1628 = arith.constant 4 : i64
    %1629 = func.call @cc_arg(%1625, %1628) : (i64, i64) -> i64
    %1630 = arith.constant 8 : i64
    %1631 = func.call @cc_arg(%1625, %1630) : (i64, i64) -> i64
    %1632 = arith.constant 12 : i64
    %1633 = func.call @cc_arg(%1625, %1632) : (i64, i64) -> i64
    %1634 = llvm.mlir.addressof @str168 : !llvm.ptr
    %1635 = arith.constant 11 : i64
    %1636 = func.call @cc_make_string(%1634, %1635) : (!llvm.ptr, i64) -> i64
    %1637 = func.call @cc_nil_value() : () -> i64
    %1638 = func.call @cc_intern(%1636, %1637) : (i64, i64) -> i64
    %1639 = func.call @cc_nil_value() : () -> i64
    %1640 = func.call @cc_cons(%1638, %1639) : (i64, i64) -> i64
    %1641 = func.call @cc_values_pack(%1640) : (i64) -> i64
    %1642 = func.call @cc_arg(%1625, %1638) : (i64, i64) -> i64
    %1643 = func.call @cc_arg_present(%1625, %1638) : (i64, i64) -> i64
    %1644 = func.call @cc_nil_value() : () -> i64
    %1645 = arith.cmpi ne, %1643, %1644 : i64
    %1646 = scf.if %1645 -> (i64) {
      scf.yield %1642 : i64
    } else {
      scf.yield %1644 : i64
    }
    %1647 = llvm.mlir.addressof @str169 : !llvm.ptr
    %1648 = arith.constant 4 : i64
    %1649 = func.call @cc_make_string(%1647, %1648) : (!llvm.ptr, i64) -> i64
    %1650 = func.call @cc_nil_value() : () -> i64
    %1651 = func.call @cc_intern(%1649, %1650) : (i64, i64) -> i64
    %1652 = func.call @cc_nil_value() : () -> i64
    %1653 = func.call @cc_cons(%1651, %1652) : (i64, i64) -> i64
    %1654 = func.call @cc_values_pack(%1653) : (i64) -> i64
    %1655 = func.call @cc_arg(%1625, %1651) : (i64, i64) -> i64
    %1656 = func.call @cc_arg_present(%1625, %1651) : (i64, i64) -> i64
    %1657 = func.call @cc_nil_value() : () -> i64
    %1658 = arith.cmpi ne, %1656, %1657 : i64
    %1659 = scf.if %1658 -> (i64) {
      scf.yield %1655 : i64
    } else {
      %1660 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1661 = arith.constant 6 : i64
      %1662 = func.call @cc_make_string(%1660, %1661) : (!llvm.ptr, i64) -> i64
      %1663 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1664 = arith.constant 11 : i64
      %1665 = func.call @cc_make_string(%1663, %1664) : (!llvm.ptr, i64) -> i64
      %1666 = func.call @cc_intern(%1662, %1665) : (i64, i64) -> i64
      %1667 = func.call @cc_nil_value() : () -> i64
      %1668 = func.call @cc_cons(%1666, %1667) : (i64, i64) -> i64
      %1669 = func.call @cc_values_pack(%1668) : (i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1670 = arith.addi %1666, %__rlasp_stack_elide_zero_71 : i64
      scf.yield %1670 : i64
    }
    %1671 = func.call @cc_nil_value() : () -> i64
    %1672 = llvm.mlir.addressof @str172 : !llvm.ptr
    %1673 = arith.constant 37 : i64
    %1674 = func.call @cc_make_string(%1672, %1673) : (!llvm.ptr, i64) -> i64
    %1675 = func.call @cc_nil_value() : () -> i64
    %1676 = func.call @cc_intern(%1674, %1675) : (i64, i64) -> i64
    %1677 = func.call @cc_nil_value() : () -> i64
    %1678 = func.call @cc_cons(%1676, %1677) : (i64, i64) -> i64
    %1679 = func.call @cc_values_pack(%1678) : (i64) -> i64
    %1680 = func.call @cc_set_symbol_value(%1676, %1671) : (i64, i64) -> i64
    %1681 = llvm.mlir.addressof @str173 : !llvm.ptr
    %1682 = arith.constant 38 : i64
    %1683 = func.call @cc_make_string(%1681, %1682) : (!llvm.ptr, i64) -> i64
    %1684 = func.call @cc_nil_value() : () -> i64
    %1685 = func.call @cc_intern(%1683, %1684) : (i64, i64) -> i64
    %1686 = func.call @cc_nil_value() : () -> i64
    %1687 = func.call @cc_cons(%1685, %1686) : (i64, i64) -> i64
    %1688 = func.call @cc_values_pack(%1687) : (i64) -> i64
    %1689 = func.call @cc_set_symbol_value(%1685, %1671) : (i64, i64) -> i64
    %1690 = llvm.mlir.addressof @str174 : !llvm.ptr
    %1691 = arith.constant 39 : i64
    %1692 = func.call @cc_make_string(%1690, %1691) : (!llvm.ptr, i64) -> i64
    %1693 = func.call @cc_nil_value() : () -> i64
    %1694 = func.call @cc_intern(%1692, %1693) : (i64, i64) -> i64
    %1695 = func.call @cc_nil_value() : () -> i64
    %1696 = func.call @cc_cons(%1694, %1695) : (i64, i64) -> i64
    %1697 = func.call @cc_values_pack(%1696) : (i64) -> i64
    %1698 = func.call @cc_set_symbol_value(%1694, %1671) : (i64, i64) -> i64
    %1699 = func.call @cc_nil_value() : () -> i64
    %1700 = func.call @cc_nil_value() : () -> i64
    %1701 = func.call @cc_errorp(%1699) : (i64) -> i64
    %1702 = arith.cmpi ne, %1701, %1700 : i64
    %1703 = scf.if %1702 -> (i64) {
      scf.yield %1699 : i64
    } else {
      %1704 = func.call @cc_nil_value() : () -> i64
      %1705 = func.call @cc_errorp(%1627) : (i64) -> i64
      %1706 = arith.cmpi ne, %1705, %1704 : i64
      %1707 = arith.cmpi eq, %1704, %1704 : i64
      %1708 = arith.andi %1706, %1707 : i1
      %1709 = scf.if %1708 -> (i64) {
        scf.yield %1627 : i64
      } else {
        scf.yield %1704 : i64
      }
      %1710 = arith.cmpi ne, %1709, %1704 : i64
      scf.if %1710 {
        func.call @stack_push_pointer(%1709) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1627) : (i64) -> ()
        %1711 = llvm.mlir.addressof @str175 : !llvm.ptr
        %1712 = func.call @cc_make_function_ref_const(%1711) : (!llvm.ptr) -> i64
        %1713 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1712, %1713) : (i64, i64) -> ()
      }
      %1714 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1714 : i64
    }
    %1715 = func.call @cc_nil_value() : () -> i64
    %1716 = func.call @cc_errorp(%1703) : (i64) -> i64
    %1717 = arith.cmpi ne, %1716, %1715 : i64
    %1718 = scf.if %1717 -> (i64) {
      scf.yield %1703 : i64
    } else {
      %1719 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1720 = func.call @cc_nil_value() : () -> i64
      %1721 = func.call @cc_nil_value() : () -> i64
      %1722 = func.call @cc_errorp(%1720) : (i64) -> i64
      %1723 = arith.cmpi ne, %1722, %1721 : i64
      %1724 = scf.if %1723 -> (i64) {
        scf.yield %1720 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
        %1725 = arith.addi %1631, %__rlasp_stack_elide_zero_72 : i64
        %1726 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1725, %1726) : (i64, i64) -> ()
        %1727 = func.call @stack_pop_pointer() : () -> i64
        %1728 = func.call @cc_errorp(%1727) : (i64) -> i64
        %1729 = func.call @cc_nil_value() : () -> i64
        %1730 = arith.cmpi ne, %1728, %1729 : i64
        scf.if %1730 {
          func.call @stack_push_pointer(%1727) : (i64) -> ()
        } else {
          %1731 = func.call @cc_multiple_value_list(%1727) : (i64) -> i64
          func.call @stack_push_pointer(%1731) : (i64) -> ()
        }
        %1732 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1733 = func.call @stack_pop_pointer() : () -> i64
        %1734 = func.call @cc_nil_value() : () -> i64
        %1735 = func.call @cc_maybe_error_from_multiple_value_list(%1732) : (i64) -> i64
        %1736 = func.call @cc_errorp(%1735) : (i64) -> i64
        %1737 = arith.cmpi ne, %1736, %1734 : i64
        %1738 = arith.cmpi eq, %1734, %1734 : i64
        %1739 = arith.andi %1737, %1738 : i1
        %1740 = scf.if %1739 -> (i64) {
          scf.yield %1735 : i64
        } else {
          scf.yield %1734 : i64
        }
        %1741 = arith.cmpi ne, %1740, %1734 : i64
        scf.if %1741 {
          func.call @stack_push_pointer(%1740) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1742 = func.call @stack_pop_pointer() : () -> i64
          %1743 = func.call @cc_cons(%1733, %1742) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
          %1744 = arith.addi %1743, %__rlasp_stack_elide_zero_73 : i64
          %1745 = func.call @cc_cons(%1732, %1744) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
          %1746 = arith.addi %1745, %__rlasp_stack_elide_zero_74 : i64
          %1747 = func.call @cc_values_pack(%1746) : (i64) -> i64
          func.call @stack_push_pointer(%1747) : (i64) -> ()
        }
        %1748 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1748 : i64
      }
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1749 = arith.addi %1724, %__rlasp_stack_elide_zero_75 : i64
      %1750 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1751 = func.call @cc_errorp(%1749) : (i64) -> i64
      %1752 = func.call @cc_nil_value() : () -> i64
      %1753 = arith.cmpi ne, %1751, %1752 : i64
      scf.if %1753 {
        %1754 = func.call @cc_condition_value(%1749) : (i64) -> i64
        %1755 = func.call @cc_values2(%1752, %1754) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1755) : (i64) -> ()
      } else {
        %1756 = func.call @cc_multiple_value_list(%1749) : (i64) -> i64
        %1757 = func.call @cc_values_pack(%1756) : (i64) -> i64
        func.call @stack_push_pointer(%1757) : (i64) -> ()
      }
      %1758 = func.call @stack_pop_pointer() : () -> i64
      %1759 = func.call @cc_multiple_value_list(%1758) : (i64) -> i64
      %1760 = arith.constant 0 : i64
      %1761 = func.call @cc_box_fixnum(%1760) : (i64) -> i64
      %1762 = func.call @cc_nth(%1761, %1759) : (i64, i64) -> i64
      %1763 = arith.constant 1 : i64
      %1764 = func.call @cc_box_fixnum(%1763) : (i64) -> i64
      %1765 = func.call @cc_nth(%1764, %1759) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1766 = arith.addi %1765, %__rlasp_stack_elide_zero_76 : i64
      %1767 = func.call @cc_nil_value() : () -> i64
      %1768 = arith.cmpi ne, %1766, %1767 : i64
      scf.if %1768 {
        func.call @stack_push_pointer(%1627) : (i64) -> ()
        func.call @stack_push_pointer(%1629) : (i64) -> ()
        func.call @stack_push_pointer(%1633) : (i64) -> ()
        func.call @stack_push_pointer(%1765) : (i64) -> ()
        func.call @stack_push_pointer(%1646) : (i64) -> ()
        %1769 = llvm.mlir.addressof @str176 : !llvm.ptr
        %1770 = func.call @cc_make_function_ref_const(%1769) : (!llvm.ptr) -> i64
        %1771 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1770, %1771) : (i64, i64) -> ()
      } else {
        %1772 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
        %1773 = arith.addi %1633, %__rlasp_stack_elide_zero_77 : i64
        %1774 = func.call @cc_length(%1773) : (i64) -> i64
        %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
        %1775 = arith.addi %1774, %__rlasp_stack_elide_zero_78 : i64
        %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
        %1776 = arith.addi %1762, %__rlasp_stack_elide_zero_79 : i64
        %1777 = func.call @cc_length(%1776) : (i64) -> i64
        %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
        %1778 = arith.addi %1777, %__rlasp_stack_elide_zero_80 : i64
        %1779 = arith.constant 1 : i1
        %1781 = arith.constant 3 : i64
        %1780 = arith.andi %1775, %1781 : i64
        %1782 = arith.constant 0 : i64
        %1783 = arith.cmpi eq, %1780, %1782 : i64
        %1785 = arith.constant 3 : i64
        %1784 = arith.andi %1778, %1785 : i64
        %1786 = arith.constant 0 : i64
        %1787 = arith.cmpi eq, %1784, %1786 : i64
        %1788 = arith.andi %1783, %1787 : i1
        %1789 = scf.if %1788 -> (i1) {
          %1790 = arith.constant 2 : i64
          %1791 = arith.shrsi %1775, %1790 : i64
          %1792 = arith.constant 2 : i64
          %1793 = arith.shrsi %1778, %1792 : i64
          %1794 = arith.cmpi eq, %1791, %1793 : i64
          scf.yield %1794 : i1
        } else {
          %1795 = func.call @cc_eq(%1775, %1778) : (i64, i64) -> i64
          %1796 = func.call @cc_nil_value() : () -> i64
          %1797 = arith.cmpi ne, %1795, %1796 : i64
          scf.yield %1797 : i1
        }
        %1798 = arith.andi %1779, %1789 : i1
        %1799 = func.call @cc_nil_value() : () -> i64
        %1800 = func.call @cc_t_value() : () -> i64
        %1801 = scf.if %1798 -> (i64) {
          scf.yield %1800 : i64
        } else {
          scf.yield %1799 : i64
        }
        %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
        %1802 = arith.addi %1801, %__rlasp_stack_elide_zero_81 : i64
        func.call @stack_push_pointer(%1659) : (i64) -> ()
        func.call @stack_push_pointer(%1762) : (i64) -> ()
        %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
        %1803 = arith.addi %1633, %__rlasp_stack_elide_zero_82 : i64
        %1804 = func.call @stack_pop_pointer() : () -> i64
        %1805 = func.call @stack_pop_pointer() : () -> i64
        %1806 = func.call @cc_every2(%1805, %1804, %1803) : (i64, i64, i64) -> i64
        %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
        %1807 = arith.addi %1806, %__rlasp_stack_elide_zero_83 : i64
        %1808 = func.call @cc_cons(%1807, %1772) : (i64, i64) -> i64
        %1809 = func.call @cc_cons(%1802, %1808) : (i64, i64) -> i64
        %1810 = func.call @cc_and(%1809) : (i64) -> i64
        %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
        %1811 = arith.addi %1810, %__rlasp_stack_elide_zero_84 : i64
        %1812 = func.call @cc_nil_value() : () -> i64
        %1813 = arith.cmpi ne, %1811, %1812 : i64
        scf.if %1813 {
          %1814 = func.call @cc_nil_value() : () -> i64
          %1815 = func.call @cc_errorp(%1627) : (i64) -> i64
          %1816 = arith.cmpi ne, %1815, %1814 : i64
          %1817 = arith.cmpi eq, %1814, %1814 : i64
          %1818 = arith.andi %1816, %1817 : i1
          %1819 = scf.if %1818 -> (i64) {
            scf.yield %1627 : i64
          } else {
            scf.yield %1814 : i64
          }
          %1820 = arith.cmpi ne, %1819, %1814 : i64
          scf.if %1820 {
            func.call @stack_push_pointer(%1819) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1627) : (i64) -> ()
            %1821 = llvm.mlir.addressof @str177 : !llvm.ptr
            %1822 = func.call @cc_make_function_ref_const(%1821) : (!llvm.ptr) -> i64
            %1823 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1822, %1823) : (i64, i64) -> ()
          }
        } else {
          %1824 = func.call @cc_t_value() : () -> i64
          %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
          %1825 = arith.addi %1824, %__rlasp_stack_elide_zero_85 : i64
          %1826 = func.call @cc_nil_value() : () -> i64
          %1827 = arith.cmpi ne, %1825, %1826 : i64
          scf.if %1827 {
            func.call @stack_push_pointer(%1627) : (i64) -> ()
            func.call @stack_push_pointer(%1629) : (i64) -> ()
            func.call @stack_push_pointer(%1633) : (i64) -> ()
            func.call @stack_push_pointer(%1762) : (i64) -> ()
            func.call @stack_push_pointer(%1646) : (i64) -> ()
            func.call @stack_push_pointer(%1659) : (i64) -> ()
            %1828 = llvm.mlir.addressof @str178 : !llvm.ptr
            %1829 = func.call @cc_make_function_ref_const(%1828) : (!llvm.ptr) -> i64
            %1830 = arith.constant 6 : i64
            func.call @cc_funcall_stack(%1829, %1830) : (i64, i64) -> ()
        }
      }
      }
      %1831 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1831 : i64
    }
    %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
    %1832 = arith.addi %1718, %__rlasp_stack_elide_zero_86 : i64
    %1833 = func.call @cc_multiple_value_list(%1832) : (i64) -> i64
    %1834 = llvm.mlir.addressof @str179 : !llvm.ptr
    %1835 = arith.constant 37 : i64
    %1836 = func.call @cc_make_string(%1834, %1835) : (!llvm.ptr, i64) -> i64
    %1837 = func.call @cc_nil_value() : () -> i64
    %1838 = func.call @cc_intern(%1836, %1837) : (i64, i64) -> i64
    %1839 = func.call @cc_nil_value() : () -> i64
    %1840 = func.call @cc_cons(%1838, %1839) : (i64, i64) -> i64
    %1841 = func.call @cc_values_pack(%1840) : (i64) -> i64
    %1842 = func.call @cc_symbol_value(%1838) : (i64) -> i64
    %1843 = llvm.mlir.addressof @str180 : !llvm.ptr
    %1844 = arith.constant 39 : i64
    %1845 = func.call @cc_make_string(%1843, %1844) : (!llvm.ptr, i64) -> i64
    %1846 = func.call @cc_nil_value() : () -> i64
    %1847 = func.call @cc_intern(%1845, %1846) : (i64, i64) -> i64
    %1848 = func.call @cc_nil_value() : () -> i64
    %1849 = func.call @cc_cons(%1847, %1848) : (i64, i64) -> i64
    %1850 = func.call @cc_values_pack(%1849) : (i64) -> i64
    %1851 = func.call @cc_symbol_value(%1847) : (i64) -> i64
    %1852 = func.call @cc_nil_value() : () -> i64
    %1853 = arith.cmpi ne, %1842, %1852 : i64
    %1854 = scf.if %1853 -> (i64) {
      scf.yield %1851 : i64
    } else {
      scf.yield %1833 : i64
    }
    %1855 = func.call @cc_values_pack(%1854) : (i64) -> i64
    func.call @stack_push_pointer(%1855) : (i64) -> ()
    func.return
  }
  func.func @"%FN%load-if-compiled-correctly"() {
    %1856 = llvm.mlir.addressof @str181 : !llvm.ptr
    %1857 = arith.constant 26 : i64
    %1858 = func.call @cc_make_string(%1856, %1857) : (!llvm.ptr, i64) -> i64
    %1859 = func.call @cc_nil_value() : () -> i64
    %1860 = func.call @cc_intern(%1858, %1859) : (i64, i64) -> i64
    %1861 = func.call @cc_nil_value() : () -> i64
    %1862 = func.call @cc_cons(%1860, %1861) : (i64, i64) -> i64
    %1863 = func.call @cc_values_pack(%1862) : (i64) -> i64
    %1864 = llvm.mlir.addressof @str182 : !llvm.ptr
    %1865 = arith.constant 4 : i64
    %1866 = func.call @cc_make_string(%1864, %1865) : (!llvm.ptr, i64) -> i64
    %1867 = func.call @cc_register_function_lambda_list_metadata_raw(%1860, %1866) : (i64, i64) -> i64
    %1868 = func.call @stack_pop_pointer() : () -> i64
    %1869 = func.call @cc_nil_value() : () -> i64
    %1870 = llvm.mlir.addressof @str183 : !llvm.ptr
    %1871 = arith.constant 37 : i64
    %1872 = func.call @cc_make_string(%1870, %1871) : (!llvm.ptr, i64) -> i64
    %1873 = func.call @cc_nil_value() : () -> i64
    %1874 = func.call @cc_intern(%1872, %1873) : (i64, i64) -> i64
    %1875 = func.call @cc_nil_value() : () -> i64
    %1876 = func.call @cc_cons(%1874, %1875) : (i64, i64) -> i64
    %1877 = func.call @cc_values_pack(%1876) : (i64) -> i64
    %1878 = func.call @cc_set_symbol_value(%1874, %1869) : (i64, i64) -> i64
    %1879 = llvm.mlir.addressof @str184 : !llvm.ptr
    %1880 = arith.constant 38 : i64
    %1881 = func.call @cc_make_string(%1879, %1880) : (!llvm.ptr, i64) -> i64
    %1882 = func.call @cc_nil_value() : () -> i64
    %1883 = func.call @cc_intern(%1881, %1882) : (i64, i64) -> i64
    %1884 = func.call @cc_nil_value() : () -> i64
    %1885 = func.call @cc_cons(%1883, %1884) : (i64, i64) -> i64
    %1886 = func.call @cc_values_pack(%1885) : (i64) -> i64
    %1887 = func.call @cc_set_symbol_value(%1883, %1869) : (i64, i64) -> i64
    %1888 = llvm.mlir.addressof @str185 : !llvm.ptr
    %1889 = arith.constant 39 : i64
    %1890 = func.call @cc_make_string(%1888, %1889) : (!llvm.ptr, i64) -> i64
    %1891 = func.call @cc_nil_value() : () -> i64
    %1892 = func.call @cc_intern(%1890, %1891) : (i64, i64) -> i64
    %1893 = func.call @cc_nil_value() : () -> i64
    %1894 = func.call @cc_cons(%1892, %1893) : (i64, i64) -> i64
    %1895 = func.call @cc_values_pack(%1894) : (i64) -> i64
    %1896 = func.call @cc_set_symbol_value(%1892, %1869) : (i64, i64) -> i64
    %1897 = func.call @cc_nil_value() : () -> i64
    %1898 = func.call @cc_nil_value() : () -> i64
    %1899 = func.call @cc_errorp(%1897) : (i64) -> i64
    %1900 = arith.cmpi ne, %1899, %1898 : i64
    %1901 = scf.if %1900 -> (i64) {
      scf.yield %1897 : i64
    } else {
      %1902 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1902) : (i64) -> ()
      %1903 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1904 = arith.constant 4 : i64
      %1905 = func.call @cc_make_string(%1903, %1904) : (!llvm.ptr, i64) -> i64
      %1906 = func.call @cc_nil_value() : () -> i64
      %1907 = func.call @cc_intern(%1905, %1906) : (i64, i64) -> i64
      %1908 = func.call @cc_nil_value() : () -> i64
      %1909 = func.call @cc_cons(%1907, %1908) : (i64, i64) -> i64
      %1910 = func.call @cc_values_pack(%1909) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1911 = arith.addi %1907, %__rlasp_stack_elide_zero_87 : i64
      %1912 = func.call @stack_pop_pointer() : () -> i64
      %1913 = func.call @cc_cons(%1911, %1912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1913) : (i64) -> ()
      %1914 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1915 = arith.constant 12 : i64
      %1916 = func.call @cc_make_string(%1914, %1915) : (!llvm.ptr, i64) -> i64
      %1917 = func.call @cc_nil_value() : () -> i64
      %1918 = func.call @cc_intern(%1916, %1917) : (i64, i64) -> i64
      %1919 = func.call @cc_nil_value() : () -> i64
      %1920 = func.call @cc_cons(%1918, %1919) : (i64, i64) -> i64
      %1921 = func.call @cc_values_pack(%1920) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1922 = arith.addi %1918, %__rlasp_stack_elide_zero_88 : i64
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @cc_cons(%1922, %1923) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1925 = arith.addi %1924, %__rlasp_stack_elide_zero_89 : i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_cons(%1925, %1926) : (i64, i64) -> i64
      %1928 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1929 = arith.constant 4 : i64
      %1930 = func.call @cc_make_string(%1928, %1929) : (!llvm.ptr, i64) -> i64
      %1931 = func.call @cc_nil_value() : () -> i64
      %1932 = func.call @cc_intern(%1930, %1931) : (i64, i64) -> i64
      %1933 = func.call @cc_nil_value() : () -> i64
      %1934 = func.call @cc_cons(%1932, %1933) : (i64, i64) -> i64
      %1935 = func.call @cc_values_pack(%1934) : (i64) -> i64
      %1936 = func.call @cc_symbol_value(%1932) : (i64) -> i64
      %1937 = func.call @cc_set_symbol_value(%1932, %1868) : (i64, i64) -> i64
      %1938 = func.call @cc_eval(%1927) : (i64) -> i64
      %1939 = func.call @cc_multiple_value_list(%1938) : (i64) -> i64
      %1940 = func.call @cc_symbol_value(%1932) : (i64) -> i64
      %1941 = func.call @cc_set_symbol_value(%1932, %1936) : (i64, i64) -> i64
      %1942 = func.call @cc_values_pack(%1939) : (i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1943 = arith.addi %1942, %__rlasp_stack_elide_zero_90 : i64
      scf.yield %1943 : i64
    }
    %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
    %1944 = arith.addi %1901, %__rlasp_stack_elide_zero_91 : i64
    %1945 = func.call @cc_multiple_value_list(%1944) : (i64) -> i64
    %1946 = arith.constant 0 : i64
    %1947 = func.call @cc_box_fixnum(%1946) : (i64) -> i64
    %1948 = func.call @cc_nth(%1947, %1945) : (i64, i64) -> i64
    %1949 = arith.constant 1 : i64
    %1950 = func.call @cc_box_fixnum(%1949) : (i64) -> i64
    %1951 = func.call @cc_nth(%1950, %1945) : (i64, i64) -> i64
    %1952 = arith.constant 2 : i64
    %1953 = func.call @cc_box_fixnum(%1952) : (i64) -> i64
    %1954 = func.call @cc_nth(%1953, %1945) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %1955 = func.call @stack_depth() : () -> i64
    %1956 = arith.constant 0 : i64
    %1957 = arith.cmpi sgt, %1955, %1956 : i64
    scf.if %1957 {
      %1958 = func.call @stack_pop_pointer() : () -> i64
    }
    %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
    %1959 = arith.addi %1948, %__rlasp_stack_elide_zero_92 : i64
    %1960 = func.call @cc_nil_value() : () -> i64
    %1961 = arith.cmpi ne, %1959, %1960 : i64
    scf.if %1961 {
      %1962 = func.call @cc_nil_value() : () -> i64
      %1963 = func.call @cc_nil_value() : () -> i64
      %1964 = func.call @cc_errorp(%1962) : (i64) -> i64
      %1965 = arith.cmpi ne, %1964, %1963 : i64
      %1966 = scf.if %1965 -> (i64) {
        scf.yield %1962 : i64
      } else {
        %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
        %1967 = arith.addi %1948, %__rlasp_stack_elide_zero_93 : i64
        %1968 = func.call @cc_nil_value() : () -> i64
        %1969 = func.call @cc_cons(%1967, %1968) : (i64, i64) -> i64
        %1970 = func.call @cc_load_stack(%1969) : (i64) -> i64
        %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
        %1971 = arith.addi %1970, %__rlasp_stack_elide_zero_94 : i64
        scf.yield %1971 : i64
      }
      func.call @stack_push_pointer(%1966) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1972 = func.call @stack_pop_pointer() : () -> i64
    %1973 = func.call @cc_errorp(%1972) : (i64) -> i64
    %1974 = func.call @cc_nil_value() : () -> i64
    %1975 = arith.cmpi ne, %1973, %1974 : i64
    %1976 = scf.if %1975 -> (i64) {
      %1977 = func.call @cc_condition_value(%1972) : (i64) -> i64
      %1978 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1979 = arith.constant 5 : i64
      %1980 = func.call @cc_make_string(%1978, %1979) : (!llvm.ptr, i64) -> i64
      %1981 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1982 = arith.constant 11 : i64
      %1983 = func.call @cc_make_string(%1981, %1982) : (!llvm.ptr, i64) -> i64
      %1984 = func.call @cc_intern(%1980, %1983) : (i64, i64) -> i64
      %1985 = func.call @cc_nil_value() : () -> i64
      %1986 = func.call @cc_cons(%1984, %1985) : (i64, i64) -> i64
      %1987 = func.call @cc_values_pack(%1986) : (i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1988 = arith.addi %1984, %__rlasp_stack_elide_zero_95 : i64
      %1989 = func.call @cc_typep(%1977, %1988) : (i64, i64) -> i64
      %1990 = func.call @cc_nil_value() : () -> i64
      %1991 = arith.cmpi ne, %1989, %1990 : i64
      %1992 = scf.if %1991 -> (i64) {
        %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
        %1993 = arith.addi %1868, %__rlasp_stack_elide_zero_96 : i64
        %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
        %1994 = arith.addi %1977, %__rlasp_stack_elide_zero_97 : i64
        %1995 = func.call @cc_nil_value() : () -> i64
        %1996 = func.call @cc_errorp(%1993) : (i64) -> i64
        %1997 = arith.cmpi ne, %1996, %1995 : i64
        %1998 = arith.cmpi eq, %1995, %1995 : i64
        %1999 = arith.andi %1997, %1998 : i1
        %2000 = scf.if %1999 -> (i64) {
          scf.yield %1993 : i64
        } else {
          scf.yield %1995 : i64
        }
        %2001 = func.call @cc_errorp(%1994) : (i64) -> i64
        %2002 = arith.cmpi ne, %2001, %1995 : i64
        %2003 = arith.cmpi eq, %2000, %1995 : i64
        %2004 = arith.andi %2002, %2003 : i1
        %2005 = scf.if %2004 -> (i64) {
          scf.yield %1994 : i64
        } else {
          scf.yield %2000 : i64
        }
        %2006 = arith.cmpi ne, %2005, %1995 : i64
        scf.if %2006 {
          func.call @stack_push_pointer(%2005) : (i64) -> ()
        } else {
          %2007 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%2007) : (i64) -> ()
          %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
          %2008 = arith.addi %1994, %__rlasp_stack_elide_zero_98 : i64
          %2009 = func.call @stack_pop_pointer() : () -> i64
          %2010 = func.call @cc_cons(%2008, %2009) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2010) : (i64) -> ()
          %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
          %2011 = arith.addi %1993, %__rlasp_stack_elide_zero_99 : i64
          %2012 = func.call @stack_pop_pointer() : () -> i64
          %2013 = func.call @cc_cons(%2011, %2012) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2013) : (i64) -> ()
        }
        %2014 = func.call @stack_pop_pointer() : () -> i64
        %2015 = func.call @cc_nil_value() : () -> i64
        %2016 = func.call @cc_errorp(%2014) : (i64) -> i64
        %2017 = arith.cmpi ne, %2016, %2015 : i64
        %2018 = arith.cmpi eq, %2015, %2015 : i64
        %2019 = arith.andi %2017, %2018 : i1
        %2020 = scf.if %2019 -> (i64) {
          scf.yield %2014 : i64
        } else {
          scf.yield %2015 : i64
        }
        %2021 = arith.cmpi ne, %2020, %2015 : i64
        scf.if %2021 {
          func.call @stack_push_pointer(%2020) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2014) : (i64) -> ()
          %2022 = llvm.mlir.addressof @str191 : !llvm.ptr
          %2023 = func.call @cc_make_function_ref_const(%2022) : (!llvm.ptr) -> i64
          %2024 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2023, %2024) : (i64, i64) -> ()
        }
        %2025 = func.call @stack_depth() : () -> i64
        %2026 = arith.constant 0 : i64
        %2027 = arith.cmpi sgt, %2025, %2026 : i64
        scf.if %2027 {
          %2028 = func.call @stack_pop_pointer() : () -> i64
        }
        %2029 = llvm.mlir.addressof @str192 : !llvm.ptr
        %2030 = arith.constant 3 : i64
        %2031 = func.call @cc_make_string(%2029, %2030) : (!llvm.ptr, i64) -> i64
        %2032 = llvm.mlir.addressof @str193 : !llvm.ptr
        %2033 = arith.constant 7 : i64
        %2034 = func.call @cc_make_string(%2032, %2033) : (!llvm.ptr, i64) -> i64
        %2035 = func.call @cc_intern(%2031, %2034) : (i64, i64) -> i64
        %2036 = func.call @cc_nil_value() : () -> i64
        %2037 = func.call @cc_cons(%2035, %2036) : (i64, i64) -> i64
        %2038 = func.call @cc_values_pack(%2037) : (i64) -> i64
        %2039 = llvm.mlir.addressof @str194 : !llvm.ptr
        %2040 = arith.constant 45 : i64
        %2041 = func.call @cc_make_string(%2039, %2040) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2035) : (i64) -> ()
        func.call @stack_push_pointer(%2041) : (i64) -> ()
        func.call @stack_push_pointer(%1868) : (i64) -> ()
        func.call @stack_push_pointer(%1977) : (i64) -> ()
        %2042 = llvm.mlir.addressof @str195 : !llvm.ptr
        %2043 = func.call @cc_make_function_ref_const(%2042) : (!llvm.ptr) -> i64
        %2044 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%2043, %2044) : (i64, i64) -> ()
        %2045 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2045 : i64
      } else {
        scf.yield %1972 : i64
      }
      scf.yield %1992 : i64
    } else {
      scf.yield %1972 : i64
    }
    %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
    %2046 = arith.addi %1976, %__rlasp_stack_elide_zero_100 : i64
    %2047 = func.call @cc_multiple_value_list(%2046) : (i64) -> i64
    %2048 = llvm.mlir.addressof @str196 : !llvm.ptr
    %2049 = arith.constant 37 : i64
    %2050 = func.call @cc_make_string(%2048, %2049) : (!llvm.ptr, i64) -> i64
    %2051 = func.call @cc_nil_value() : () -> i64
    %2052 = func.call @cc_intern(%2050, %2051) : (i64, i64) -> i64
    %2053 = func.call @cc_nil_value() : () -> i64
    %2054 = func.call @cc_cons(%2052, %2053) : (i64, i64) -> i64
    %2055 = func.call @cc_values_pack(%2054) : (i64) -> i64
    %2056 = func.call @cc_symbol_value(%2052) : (i64) -> i64
    %2057 = llvm.mlir.addressof @str197 : !llvm.ptr
    %2058 = arith.constant 39 : i64
    %2059 = func.call @cc_make_string(%2057, %2058) : (!llvm.ptr, i64) -> i64
    %2060 = func.call @cc_nil_value() : () -> i64
    %2061 = func.call @cc_intern(%2059, %2060) : (i64, i64) -> i64
    %2062 = func.call @cc_nil_value() : () -> i64
    %2063 = func.call @cc_cons(%2061, %2062) : (i64, i64) -> i64
    %2064 = func.call @cc_values_pack(%2063) : (i64) -> i64
    %2065 = func.call @cc_symbol_value(%2061) : (i64) -> i64
    %2066 = func.call @cc_nil_value() : () -> i64
    %2067 = arith.cmpi ne, %2056, %2066 : i64
    %2068 = scf.if %2067 -> (i64) {
      scf.yield %2065 : i64
    } else {
      scf.yield %2047 : i64
    }
    %2069 = func.call @cc_values_pack(%2068) : (i64) -> i64
    func.call @stack_push_pointer(%2069) : (i64) -> ()
    func.return
  }
  func.func @"%FN%no-handler-case-load-if-compiled-correctly"() {
    %2070 = llvm.mlir.addressof @str198 : !llvm.ptr
    %2071 = arith.constant 42 : i64
    %2072 = func.call @cc_make_string(%2070, %2071) : (!llvm.ptr, i64) -> i64
    %2073 = func.call @cc_nil_value() : () -> i64
    %2074 = func.call @cc_intern(%2072, %2073) : (i64, i64) -> i64
    %2075 = func.call @cc_nil_value() : () -> i64
    %2076 = func.call @cc_cons(%2074, %2075) : (i64, i64) -> i64
    %2077 = func.call @cc_values_pack(%2076) : (i64) -> i64
    %2078 = llvm.mlir.addressof @str199 : !llvm.ptr
    %2079 = arith.constant 4 : i64
    %2080 = func.call @cc_make_string(%2078, %2079) : (!llvm.ptr, i64) -> i64
    %2081 = func.call @cc_register_function_lambda_list_metadata_raw(%2074, %2080) : (i64, i64) -> i64
    %2082 = func.call @stack_pop_pointer() : () -> i64
    %2083 = func.call @cc_nil_value() : () -> i64
    %2084 = llvm.mlir.addressof @str200 : !llvm.ptr
    %2085 = arith.constant 37 : i64
    %2086 = func.call @cc_make_string(%2084, %2085) : (!llvm.ptr, i64) -> i64
    %2087 = func.call @cc_nil_value() : () -> i64
    %2088 = func.call @cc_intern(%2086, %2087) : (i64, i64) -> i64
    %2089 = func.call @cc_nil_value() : () -> i64
    %2090 = func.call @cc_cons(%2088, %2089) : (i64, i64) -> i64
    %2091 = func.call @cc_values_pack(%2090) : (i64) -> i64
    %2092 = func.call @cc_set_symbol_value(%2088, %2083) : (i64, i64) -> i64
    %2093 = llvm.mlir.addressof @str201 : !llvm.ptr
    %2094 = arith.constant 38 : i64
    %2095 = func.call @cc_make_string(%2093, %2094) : (!llvm.ptr, i64) -> i64
    %2096 = func.call @cc_nil_value() : () -> i64
    %2097 = func.call @cc_intern(%2095, %2096) : (i64, i64) -> i64
    %2098 = func.call @cc_nil_value() : () -> i64
    %2099 = func.call @cc_cons(%2097, %2098) : (i64, i64) -> i64
    %2100 = func.call @cc_values_pack(%2099) : (i64) -> i64
    %2101 = func.call @cc_set_symbol_value(%2097, %2083) : (i64, i64) -> i64
    %2102 = llvm.mlir.addressof @str202 : !llvm.ptr
    %2103 = arith.constant 39 : i64
    %2104 = func.call @cc_make_string(%2102, %2103) : (!llvm.ptr, i64) -> i64
    %2105 = func.call @cc_nil_value() : () -> i64
    %2106 = func.call @cc_intern(%2104, %2105) : (i64, i64) -> i64
    %2107 = func.call @cc_nil_value() : () -> i64
    %2108 = func.call @cc_cons(%2106, %2107) : (i64, i64) -> i64
    %2109 = func.call @cc_values_pack(%2108) : (i64) -> i64
    %2110 = func.call @cc_set_symbol_value(%2106, %2083) : (i64, i64) -> i64
    %2111 = func.call @cc_nil_value() : () -> i64
    %2112 = func.call @cc_nil_value() : () -> i64
    %2113 = func.call @cc_errorp(%2111) : (i64) -> i64
    %2114 = arith.cmpi ne, %2113, %2112 : i64
    %2115 = scf.if %2114 -> (i64) {
      scf.yield %2111 : i64
    } else {
      %2116 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2116) : (i64) -> ()
      %2117 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2118 = arith.constant 4 : i64
      %2119 = func.call @cc_make_string(%2117, %2118) : (!llvm.ptr, i64) -> i64
      %2120 = func.call @cc_nil_value() : () -> i64
      %2121 = func.call @cc_intern(%2119, %2120) : (i64, i64) -> i64
      %2122 = func.call @cc_nil_value() : () -> i64
      %2123 = func.call @cc_cons(%2121, %2122) : (i64, i64) -> i64
      %2124 = func.call @cc_values_pack(%2123) : (i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2125 = arith.addi %2121, %__rlasp_stack_elide_zero_101 : i64
      %2126 = func.call @stack_pop_pointer() : () -> i64
      %2127 = func.call @cc_cons(%2125, %2126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2127) : (i64) -> ()
      %2128 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2129 = arith.constant 12 : i64
      %2130 = func.call @cc_make_string(%2128, %2129) : (!llvm.ptr, i64) -> i64
      %2131 = func.call @cc_nil_value() : () -> i64
      %2132 = func.call @cc_intern(%2130, %2131) : (i64, i64) -> i64
      %2133 = func.call @cc_nil_value() : () -> i64
      %2134 = func.call @cc_cons(%2132, %2133) : (i64, i64) -> i64
      %2135 = func.call @cc_values_pack(%2134) : (i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2136 = arith.addi %2132, %__rlasp_stack_elide_zero_102 : i64
      %2137 = func.call @stack_pop_pointer() : () -> i64
      %2138 = func.call @cc_cons(%2136, %2137) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2139 = arith.addi %2138, %__rlasp_stack_elide_zero_103 : i64
      %2140 = func.call @cc_nil_value() : () -> i64
      %2141 = func.call @cc_cons(%2139, %2140) : (i64, i64) -> i64
      %2142 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2143 = arith.constant 4 : i64
      %2144 = func.call @cc_make_string(%2142, %2143) : (!llvm.ptr, i64) -> i64
      %2145 = func.call @cc_nil_value() : () -> i64
      %2146 = func.call @cc_intern(%2144, %2145) : (i64, i64) -> i64
      %2147 = func.call @cc_nil_value() : () -> i64
      %2148 = func.call @cc_cons(%2146, %2147) : (i64, i64) -> i64
      %2149 = func.call @cc_values_pack(%2148) : (i64) -> i64
      %2150 = func.call @cc_symbol_value(%2146) : (i64) -> i64
      %2151 = func.call @cc_set_symbol_value(%2146, %2082) : (i64, i64) -> i64
      %2152 = func.call @cc_eval(%2141) : (i64) -> i64
      %2153 = func.call @cc_multiple_value_list(%2152) : (i64) -> i64
      %2154 = func.call @cc_symbol_value(%2146) : (i64) -> i64
      %2155 = func.call @cc_set_symbol_value(%2146, %2150) : (i64, i64) -> i64
      %2156 = func.call @cc_values_pack(%2153) : (i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2157 = arith.addi %2156, %__rlasp_stack_elide_zero_104 : i64
      scf.yield %2157 : i64
    }
    %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
    %2158 = arith.addi %2115, %__rlasp_stack_elide_zero_105 : i64
    %2159 = func.call @cc_multiple_value_list(%2158) : (i64) -> i64
    %2160 = arith.constant 0 : i64
    %2161 = func.call @cc_box_fixnum(%2160) : (i64) -> i64
    %2162 = func.call @cc_nth(%2161, %2159) : (i64, i64) -> i64
    %2163 = arith.constant 1 : i64
    %2164 = func.call @cc_box_fixnum(%2163) : (i64) -> i64
    %2165 = func.call @cc_nth(%2164, %2159) : (i64, i64) -> i64
    %2166 = arith.constant 2 : i64
    %2167 = func.call @cc_box_fixnum(%2166) : (i64) -> i64
    %2168 = func.call @cc_nth(%2167, %2159) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %2169 = func.call @stack_depth() : () -> i64
    %2170 = arith.constant 0 : i64
    %2171 = arith.cmpi sgt, %2169, %2170 : i64
    scf.if %2171 {
      %2172 = func.call @stack_pop_pointer() : () -> i64
    }
    %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
    %2173 = arith.addi %2162, %__rlasp_stack_elide_zero_106 : i64
    %2174 = func.call @cc_nil_value() : () -> i64
    %2175 = arith.cmpi ne, %2173, %2174 : i64
    scf.if %2175 {
      %2176 = func.call @cc_nil_value() : () -> i64
      %2177 = func.call @cc_nil_value() : () -> i64
      %2178 = func.call @cc_errorp(%2176) : (i64) -> i64
      %2179 = arith.cmpi ne, %2178, %2177 : i64
      %2180 = scf.if %2179 -> (i64) {
        scf.yield %2176 : i64
      } else {
        %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
        %2181 = arith.addi %2162, %__rlasp_stack_elide_zero_107 : i64
        %2182 = func.call @cc_nil_value() : () -> i64
        %2183 = func.call @cc_cons(%2181, %2182) : (i64, i64) -> i64
        %2184 = func.call @cc_load_stack(%2183) : (i64) -> i64
        %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
        %2185 = arith.addi %2184, %__rlasp_stack_elide_zero_108 : i64
        scf.yield %2185 : i64
      }
      func.call @stack_push_pointer(%2180) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2186 = func.call @stack_pop_pointer() : () -> i64
    %2187 = func.call @cc_multiple_value_list(%2186) : (i64) -> i64
    %2188 = llvm.mlir.addressof @str206 : !llvm.ptr
    %2189 = arith.constant 37 : i64
    %2190 = func.call @cc_make_string(%2188, %2189) : (!llvm.ptr, i64) -> i64
    %2191 = func.call @cc_nil_value() : () -> i64
    %2192 = func.call @cc_intern(%2190, %2191) : (i64, i64) -> i64
    %2193 = func.call @cc_nil_value() : () -> i64
    %2194 = func.call @cc_cons(%2192, %2193) : (i64, i64) -> i64
    %2195 = func.call @cc_values_pack(%2194) : (i64) -> i64
    %2196 = func.call @cc_symbol_value(%2192) : (i64) -> i64
    %2197 = llvm.mlir.addressof @str207 : !llvm.ptr
    %2198 = arith.constant 39 : i64
    %2199 = func.call @cc_make_string(%2197, %2198) : (!llvm.ptr, i64) -> i64
    %2200 = func.call @cc_nil_value() : () -> i64
    %2201 = func.call @cc_intern(%2199, %2200) : (i64, i64) -> i64
    %2202 = func.call @cc_nil_value() : () -> i64
    %2203 = func.call @cc_cons(%2201, %2202) : (i64, i64) -> i64
    %2204 = func.call @cc_values_pack(%2203) : (i64) -> i64
    %2205 = func.call @cc_symbol_value(%2201) : (i64) -> i64
    %2206 = func.call @cc_nil_value() : () -> i64
    %2207 = arith.cmpi ne, %2196, %2206 : i64
    %2208 = scf.if %2207 -> (i64) {
      scf.yield %2205 : i64
    } else {
      scf.yield %2187 : i64
    }
    %2209 = func.call @cc_values_pack(%2208) : (i64) -> i64
    func.call @stack_push_pointer(%2209) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %2210 = llvm.mlir.addressof @str208 : !llvm.ptr
    %2211 = arith.constant 6 : i64
    %2212 = func.call @cc_make_string(%2210, %2211) : (!llvm.ptr, i64) -> i64
    %2213 = func.call @cc_nil_value() : () -> i64
    %2214 = func.call @cc_intern(%2212, %2213) : (i64, i64) -> i64
    %2215 = func.call @cc_nil_value() : () -> i64
    %2216 = func.call @cc_cons(%2214, %2215) : (i64, i64) -> i64
    %2217 = func.call @cc_values_pack(%2216) : (i64) -> i64
    %2218 = func.call @cc_nil_value() : () -> i64
    %2219 = llvm.mlir.addressof @str209 : !llvm.ptr
    %2220 = arith.constant 37 : i64
    %2221 = func.call @cc_make_string(%2219, %2220) : (!llvm.ptr, i64) -> i64
    %2222 = func.call @cc_nil_value() : () -> i64
    %2223 = func.call @cc_intern(%2221, %2222) : (i64, i64) -> i64
    %2224 = func.call @cc_nil_value() : () -> i64
    %2225 = func.call @cc_cons(%2223, %2224) : (i64, i64) -> i64
    %2226 = func.call @cc_values_pack(%2225) : (i64) -> i64
    %2227 = func.call @cc_set_symbol_value(%2223, %2218) : (i64, i64) -> i64
    %2228 = llvm.mlir.addressof @str210 : !llvm.ptr
    %2229 = arith.constant 38 : i64
    %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
    %2231 = func.call @cc_nil_value() : () -> i64
    %2232 = func.call @cc_intern(%2230, %2231) : (i64, i64) -> i64
    %2233 = func.call @cc_nil_value() : () -> i64
    %2234 = func.call @cc_cons(%2232, %2233) : (i64, i64) -> i64
    %2235 = func.call @cc_values_pack(%2234) : (i64) -> i64
    %2236 = func.call @cc_set_symbol_value(%2232, %2218) : (i64, i64) -> i64
    %2237 = llvm.mlir.addressof @str211 : !llvm.ptr
    %2238 = arith.constant 39 : i64
    %2239 = func.call @cc_make_string(%2237, %2238) : (!llvm.ptr, i64) -> i64
    %2240 = func.call @cc_nil_value() : () -> i64
    %2241 = func.call @cc_intern(%2239, %2240) : (i64, i64) -> i64
    %2242 = func.call @cc_nil_value() : () -> i64
    %2243 = func.call @cc_cons(%2241, %2242) : (i64, i64) -> i64
    %2244 = func.call @cc_values_pack(%2243) : (i64) -> i64
    %2245 = func.call @cc_set_symbol_value(%2241, %2218) : (i64, i64) -> i64
    %2246 = func.call @cc_nil_value() : () -> i64
    %2247 = func.call @cc_nil_value() : () -> i64
    %2248 = func.call @cc_errorp(%2246) : (i64) -> i64
    %2249 = arith.cmpi ne, %2248, %2247 : i64
    %2250 = scf.if %2249 -> (i64) {
      scf.yield %2246 : i64
    } else {
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = func.call @cc_errorp(%2251) : (i64) -> i64
      %2254 = arith.cmpi ne, %2253, %2252 : i64
      %2255 = scf.if %2254 -> (i64) {
        scf.yield %2251 : i64
      } else {
        %2256 = llvm.mlir.addressof @str212 : !llvm.ptr
        %2257 = arith.constant 11 : i64
        %2258 = func.call @cc_make_string(%2256, %2257) : (!llvm.ptr, i64) -> i64
        %2259 = func.call @cc_nil_value() : () -> i64
        %2260 = func.call @cc_intern(%2258, %2259) : (i64, i64) -> i64
        %2261 = func.call @cc_nil_value() : () -> i64
        %2262 = func.call @cc_cons(%2260, %2261) : (i64, i64) -> i64
        %2263 = func.call @cc_values_pack(%2262) : (i64) -> i64
        %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
        %2264 = arith.addi %2260, %__rlasp_stack_elide_zero_109 : i64
        %2265 = func.call @cc_nil_value() : () -> i64
        %2266 = func.call @cc_errorp(%2264) : (i64) -> i64
        %2267 = arith.cmpi ne, %2266, %2265 : i64
        %2268 = arith.cmpi eq, %2265, %2265 : i64
        %2269 = arith.andi %2267, %2268 : i1
        %2270 = scf.if %2269 -> (i64) {
          scf.yield %2264 : i64
        } else {
          scf.yield %2265 : i64
        }
        %2271 = arith.cmpi ne, %2270, %2265 : i64
        scf.if %2271 {
          func.call @stack_push_pointer(%2270) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2264) : (i64) -> ()
          %2272 = llvm.mlir.addressof @str213 : !llvm.ptr
          %2273 = func.call @cc_make_function_ref_const(%2272) : (!llvm.ptr) -> i64
          %2274 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2273, %2274) : (i64, i64) -> ()
        }
        %2275 = func.call @stack_pop_pointer() : () -> i64
        %2276 = func.call @cc_nil_value() : () -> i64
        %2277 = arith.cmpi ne, %2275, %2276 : i64
        scf.if %2277 {
          %2278 = llvm.mlir.addressof @str214 : !llvm.ptr
          %2279 = arith.constant 11 : i64
          %2280 = func.call @cc_make_string(%2278, %2279) : (!llvm.ptr, i64) -> i64
          %2281 = func.call @cc_nil_value() : () -> i64
          %2282 = func.call @cc_intern(%2280, %2281) : (i64, i64) -> i64
          %2283 = func.call @cc_nil_value() : () -> i64
          %2284 = func.call @cc_cons(%2282, %2283) : (i64, i64) -> i64
          %2285 = func.call @cc_values_pack(%2284) : (i64) -> i64
          %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
          %2286 = arith.addi %2282, %__rlasp_stack_elide_zero_110 : i64
          %2287 = func.call @cc_nil_value() : () -> i64
          %2288 = func.call @cc_errorp(%2286) : (i64) -> i64
          %2289 = arith.cmpi ne, %2288, %2287 : i64
          %2290 = arith.cmpi eq, %2287, %2287 : i64
          %2291 = arith.andi %2289, %2290 : i1
          %2292 = scf.if %2291 -> (i64) {
            scf.yield %2286 : i64
          } else {
            scf.yield %2287 : i64
          }
          %2293 = arith.cmpi ne, %2292, %2287 : i64
          scf.if %2293 {
            func.call @stack_push_pointer(%2292) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2286) : (i64) -> ()
            %2294 = llvm.mlir.addressof @str215 : !llvm.ptr
            %2295 = func.call @cc_make_function_ref_const(%2294) : (!llvm.ptr) -> i64
            %2296 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2295, %2296) : (i64, i64) -> ()
          }
        } else {
          %2297 = llvm.mlir.addressof @str216 : !llvm.ptr
          %2298 = arith.constant 11 : i64
          %2299 = func.call @cc_make_string(%2297, %2298) : (!llvm.ptr, i64) -> i64
          %2300 = func.call @cc_nil_value() : () -> i64
          %2301 = func.call @cc_intern(%2299, %2300) : (i64, i64) -> i64
          %2302 = func.call @cc_nil_value() : () -> i64
          %2303 = func.call @cc_cons(%2301, %2302) : (i64, i64) -> i64
          %2304 = func.call @cc_values_pack(%2303) : (i64) -> i64
          %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
          %2305 = arith.addi %2301, %__rlasp_stack_elide_zero_111 : i64
          %2306 = func.call @cc_nil_value() : () -> i64
          %2307 = func.call @cc_errorp(%2305) : (i64) -> i64
          %2308 = arith.cmpi ne, %2307, %2306 : i64
          %2309 = arith.cmpi eq, %2306, %2306 : i64
          %2310 = arith.andi %2308, %2309 : i1
          %2311 = scf.if %2310 -> (i64) {
            scf.yield %2305 : i64
          } else {
            scf.yield %2306 : i64
          }
          %2312 = arith.cmpi ne, %2311, %2306 : i64
          scf.if %2312 {
            func.call @stack_push_pointer(%2311) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2305) : (i64) -> ()
            %2313 = llvm.mlir.addressof @str217 : !llvm.ptr
            %2314 = func.call @cc_make_function_ref_const(%2313) : (!llvm.ptr) -> i64
            %2315 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2314, %2315) : (i64, i64) -> ()
          }
        }
        %2316 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2316 : i64
      }
      %2317 = func.call @cc_nil_value() : () -> i64
      %2318 = func.call @cc_errorp(%2255) : (i64) -> i64
      %2319 = arith.cmpi ne, %2318, %2317 : i64
      %2320 = scf.if %2319 -> (i64) {
        scf.yield %2255 : i64
      } else {
        %2321 = llvm.mlir.addressof @str218 : !llvm.ptr
        %2322 = arith.constant 2 : i64
        %2323 = func.call @cc_make_string(%2321, %2322) : (!llvm.ptr, i64) -> i64
        %2324 = llvm.mlir.addressof @str219 : !llvm.ptr
        %2325 = arith.constant 7 : i64
        %2326 = func.call @cc_make_string(%2324, %2325) : (!llvm.ptr, i64) -> i64
        %2327 = func.call @cc_intern(%2323, %2326) : (i64, i64) -> i64
        %2328 = func.call @cc_nil_value() : () -> i64
        %2329 = func.call @cc_cons(%2327, %2328) : (i64, i64) -> i64
        %2330 = func.call @cc_values_pack(%2329) : (i64) -> i64
        %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
        %2331 = arith.addi %2327, %__rlasp_stack_elide_zero_112 : i64
        %2332 = llvm.mlir.addressof @str220 : !llvm.ptr
        %2333 = arith.constant 11 : i64
        %2334 = func.call @cc_make_string(%2332, %2333) : (!llvm.ptr, i64) -> i64
        %2335 = func.call @cc_nil_value() : () -> i64
        %2336 = func.call @cc_intern(%2334, %2335) : (i64, i64) -> i64
        %2337 = func.call @cc_nil_value() : () -> i64
        %2338 = func.call @cc_cons(%2336, %2337) : (i64, i64) -> i64
        %2339 = func.call @cc_values_pack(%2338) : (i64) -> i64
        %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
        %2340 = arith.addi %2336, %__rlasp_stack_elide_zero_113 : i64
        %2341 = func.call @cc_nil_value() : () -> i64
        %2342 = func.call @cc_errorp(%2331) : (i64) -> i64
        %2343 = arith.cmpi ne, %2342, %2341 : i64
        %2344 = arith.cmpi eq, %2341, %2341 : i64
        %2345 = arith.andi %2343, %2344 : i1
        %2346 = scf.if %2345 -> (i64) {
          scf.yield %2331 : i64
        } else {
          scf.yield %2341 : i64
        }
        %2347 = func.call @cc_errorp(%2340) : (i64) -> i64
        %2348 = arith.cmpi ne, %2347, %2341 : i64
        %2349 = arith.cmpi eq, %2346, %2341 : i64
        %2350 = arith.andi %2348, %2349 : i1
        %2351 = scf.if %2350 -> (i64) {
          scf.yield %2340 : i64
        } else {
          scf.yield %2346 : i64
        }
        %2352 = arith.cmpi ne, %2351, %2341 : i64
        scf.if %2352 {
          func.call @stack_push_pointer(%2351) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2331) : (i64) -> ()
          func.call @stack_push_pointer(%2340) : (i64) -> ()
          %2353 = llvm.mlir.addressof @str221 : !llvm.ptr
          %2354 = func.call @cc_make_function_ref_const(%2353) : (!llvm.ptr) -> i64
          %2355 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2354, %2355) : (i64, i64) -> ()
        }
        %2356 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2356 : i64
      }
      %2357 = func.call @cc_nil_value() : () -> i64
      %2358 = func.call @cc_errorp(%2320) : (i64) -> i64
      %2359 = arith.cmpi ne, %2358, %2357 : i64
      %2360 = scf.if %2359 -> (i64) {
        scf.yield %2320 : i64
      } else {
        %2361 = llvm.mlir.addressof @str222 : !llvm.ptr
        %2362 = arith.constant 4 : i64
        %2363 = func.call @cc_make_string(%2361, %2362) : (!llvm.ptr, i64) -> i64
        %2364 = func.call @cc_nil_value() : () -> i64
        %2365 = func.call @cc_intern(%2363, %2364) : (i64, i64) -> i64
        %2366 = func.call @cc_nil_value() : () -> i64
        %2367 = func.call @cc_cons(%2365, %2366) : (i64, i64) -> i64
        %2368 = func.call @cc_values_pack(%2367) : (i64) -> i64
        %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
        %2369 = arith.addi %2365, %__rlasp_stack_elide_zero_114 : i64
        %2370 = func.call @cc_string(%2369) : (i64) -> i64
        %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
        %2371 = arith.addi %2370, %__rlasp_stack_elide_zero_115 : i64
        %2372 = llvm.mlir.addressof @str223 : !llvm.ptr
        %2373 = arith.constant 11 : i64
        %2374 = func.call @cc_make_string(%2372, %2373) : (!llvm.ptr, i64) -> i64
        %2375 = func.call @cc_nil_value() : () -> i64
        %2376 = func.call @cc_intern(%2374, %2375) : (i64, i64) -> i64
        %2377 = func.call @cc_nil_value() : () -> i64
        %2378 = func.call @cc_cons(%2376, %2377) : (i64, i64) -> i64
        %2379 = func.call @cc_values_pack(%2378) : (i64) -> i64
        %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
        %2380 = arith.addi %2376, %__rlasp_stack_elide_zero_116 : i64
        %2381 = func.call @cc_nil_value() : () -> i64
        %2382 = func.call @cc_errorp(%2371) : (i64) -> i64
        %2383 = arith.cmpi ne, %2382, %2381 : i64
        %2384 = arith.cmpi eq, %2381, %2381 : i64
        %2385 = arith.andi %2383, %2384 : i1
        %2386 = scf.if %2385 -> (i64) {
          scf.yield %2371 : i64
        } else {
          scf.yield %2381 : i64
        }
        %2387 = func.call @cc_errorp(%2380) : (i64) -> i64
        %2388 = arith.cmpi ne, %2387, %2381 : i64
        %2389 = arith.cmpi eq, %2386, %2381 : i64
        %2390 = arith.andi %2388, %2389 : i1
        %2391 = scf.if %2390 -> (i64) {
          scf.yield %2380 : i64
        } else {
          scf.yield %2386 : i64
        }
        %2392 = arith.cmpi ne, %2391, %2381 : i64
        scf.if %2392 {
          func.call @stack_push_pointer(%2391) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2371) : (i64) -> ()
          func.call @stack_push_pointer(%2380) : (i64) -> ()
          %2393 = llvm.mlir.addressof @str224 : !llvm.ptr
          %2394 = func.call @cc_make_function_ref_const(%2393) : (!llvm.ptr) -> i64
          %2395 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2394, %2395) : (i64, i64) -> ()
        }
        %2396 = func.call @stack_pop_pointer() : () -> i64
        %2397 = llvm.mlir.addressof @str225 : !llvm.ptr
        %2398 = arith.constant 11 : i64
        %2399 = func.call @cc_make_string(%2397, %2398) : (!llvm.ptr, i64) -> i64
        %2400 = func.call @cc_nil_value() : () -> i64
        %2401 = func.call @cc_intern(%2399, %2400) : (i64, i64) -> i64
        %2402 = func.call @cc_nil_value() : () -> i64
        %2403 = func.call @cc_cons(%2401, %2402) : (i64, i64) -> i64
        %2404 = func.call @cc_values_pack(%2403) : (i64) -> i64
        %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
        %2405 = arith.addi %2401, %__rlasp_stack_elide_zero_117 : i64
        %2406 = func.call @cc_nil_value() : () -> i64
        %2407 = func.call @cc_errorp(%2396) : (i64) -> i64
        %2408 = arith.cmpi ne, %2407, %2406 : i64
        %2409 = arith.cmpi eq, %2406, %2406 : i64
        %2410 = arith.andi %2408, %2409 : i1
        %2411 = scf.if %2410 -> (i64) {
          scf.yield %2396 : i64
        } else {
          scf.yield %2406 : i64
        }
        %2412 = func.call @cc_errorp(%2405) : (i64) -> i64
        %2413 = arith.cmpi ne, %2412, %2406 : i64
        %2414 = arith.cmpi eq, %2411, %2406 : i64
        %2415 = arith.andi %2413, %2414 : i1
        %2416 = scf.if %2415 -> (i64) {
          scf.yield %2405 : i64
        } else {
          scf.yield %2411 : i64
        }
        %2417 = arith.cmpi ne, %2416, %2406 : i64
        scf.if %2417 {
          func.call @stack_push_pointer(%2416) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2396) : (i64) -> ()
          func.call @stack_push_pointer(%2405) : (i64) -> ()
          %2418 = llvm.mlir.addressof @str226 : !llvm.ptr
          %2419 = func.call @cc_make_function_ref_const(%2418) : (!llvm.ptr) -> i64
          %2420 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2419, %2420) : (i64, i64) -> ()
        }
        %2421 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2421 : i64
      }
      %2422 = func.call @cc_nil_value() : () -> i64
      %2423 = func.call @cc_errorp(%2360) : (i64) -> i64
      %2424 = arith.cmpi ne, %2423, %2422 : i64
      %2425 = scf.if %2424 -> (i64) {
        scf.yield %2360 : i64
      } else {
        %2426 = llvm.mlir.addressof @str227 : !llvm.ptr
        %2427 = arith.constant 17 : i64
        %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
        %2429 = func.call @cc_nil_value() : () -> i64
        %2430 = func.call @cc_intern(%2428, %2429) : (i64, i64) -> i64
        %2431 = func.call @cc_nil_value() : () -> i64
        %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
        %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
        %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
        %2434 = arith.addi %2430, %__rlasp_stack_elide_zero_118 : i64
        %2435 = func.call @cc_string(%2434) : (i64) -> i64
        %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
        %2436 = arith.addi %2435, %__rlasp_stack_elide_zero_119 : i64
        %2437 = llvm.mlir.addressof @str228 : !llvm.ptr
        %2438 = arith.constant 11 : i64
        %2439 = func.call @cc_make_string(%2437, %2438) : (!llvm.ptr, i64) -> i64
        %2440 = func.call @cc_nil_value() : () -> i64
        %2441 = func.call @cc_intern(%2439, %2440) : (i64, i64) -> i64
        %2442 = func.call @cc_nil_value() : () -> i64
        %2443 = func.call @cc_cons(%2441, %2442) : (i64, i64) -> i64
        %2444 = func.call @cc_values_pack(%2443) : (i64) -> i64
        %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
        %2445 = arith.addi %2441, %__rlasp_stack_elide_zero_120 : i64
        %2446 = func.call @cc_nil_value() : () -> i64
        %2447 = func.call @cc_errorp(%2436) : (i64) -> i64
        %2448 = arith.cmpi ne, %2447, %2446 : i64
        %2449 = arith.cmpi eq, %2446, %2446 : i64
        %2450 = arith.andi %2448, %2449 : i1
        %2451 = scf.if %2450 -> (i64) {
          scf.yield %2436 : i64
        } else {
          scf.yield %2446 : i64
        }
        %2452 = func.call @cc_errorp(%2445) : (i64) -> i64
        %2453 = arith.cmpi ne, %2452, %2446 : i64
        %2454 = arith.cmpi eq, %2451, %2446 : i64
        %2455 = arith.andi %2453, %2454 : i1
        %2456 = scf.if %2455 -> (i64) {
          scf.yield %2445 : i64
        } else {
          scf.yield %2451 : i64
        }
        %2457 = arith.cmpi ne, %2456, %2446 : i64
        scf.if %2457 {
          func.call @stack_push_pointer(%2456) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2436) : (i64) -> ()
          func.call @stack_push_pointer(%2445) : (i64) -> ()
          %2458 = llvm.mlir.addressof @str229 : !llvm.ptr
          %2459 = func.call @cc_make_function_ref_const(%2458) : (!llvm.ptr) -> i64
          %2460 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2459, %2460) : (i64, i64) -> ()
        }
        %2461 = func.call @stack_pop_pointer() : () -> i64
        %2462 = llvm.mlir.addressof @str230 : !llvm.ptr
        %2463 = arith.constant 11 : i64
        %2464 = func.call @cc_make_string(%2462, %2463) : (!llvm.ptr, i64) -> i64
        %2465 = func.call @cc_nil_value() : () -> i64
        %2466 = func.call @cc_intern(%2464, %2465) : (i64, i64) -> i64
        %2467 = func.call @cc_nil_value() : () -> i64
        %2468 = func.call @cc_cons(%2466, %2467) : (i64, i64) -> i64
        %2469 = func.call @cc_values_pack(%2468) : (i64) -> i64
        %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
        %2470 = arith.addi %2466, %__rlasp_stack_elide_zero_121 : i64
        %2471 = func.call @cc_nil_value() : () -> i64
        %2472 = func.call @cc_errorp(%2461) : (i64) -> i64
        %2473 = arith.cmpi ne, %2472, %2471 : i64
        %2474 = arith.cmpi eq, %2471, %2471 : i64
        %2475 = arith.andi %2473, %2474 : i1
        %2476 = scf.if %2475 -> (i64) {
          scf.yield %2461 : i64
        } else {
          scf.yield %2471 : i64
        }
        %2477 = func.call @cc_errorp(%2470) : (i64) -> i64
        %2478 = arith.cmpi ne, %2477, %2471 : i64
        %2479 = arith.cmpi eq, %2476, %2471 : i64
        %2480 = arith.andi %2478, %2479 : i1
        %2481 = scf.if %2480 -> (i64) {
          scf.yield %2470 : i64
        } else {
          scf.yield %2476 : i64
        }
        %2482 = arith.cmpi ne, %2481, %2471 : i64
        scf.if %2482 {
          func.call @stack_push_pointer(%2481) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2461) : (i64) -> ()
          func.call @stack_push_pointer(%2470) : (i64) -> ()
          %2483 = llvm.mlir.addressof @str231 : !llvm.ptr
          %2484 = func.call @cc_make_function_ref_const(%2483) : (!llvm.ptr) -> i64
          %2485 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2484, %2485) : (i64, i64) -> ()
        }
        %2486 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2486 : i64
      }
      %2487 = func.call @cc_nil_value() : () -> i64
      %2488 = func.call @cc_errorp(%2425) : (i64) -> i64
      %2489 = arith.cmpi ne, %2488, %2487 : i64
      %2490 = scf.if %2489 -> (i64) {
        scf.yield %2425 : i64
      } else {
        %2491 = llvm.mlir.addressof @str232 : !llvm.ptr
        %2492 = arith.constant 11 : i64
        %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
        %2494 = func.call @cc_nil_value() : () -> i64
        %2495 = func.call @cc_intern(%2493, %2494) : (i64, i64) -> i64
        %2496 = func.call @cc_nil_value() : () -> i64
        %2497 = func.call @cc_cons(%2495, %2496) : (i64, i64) -> i64
        %2498 = func.call @cc_values_pack(%2497) : (i64) -> i64
        %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
        %2499 = arith.addi %2495, %__rlasp_stack_elide_zero_122 : i64
        %2500 = func.call @cc_nil_value() : () -> i64
        %2501 = func.call @cc_errorp(%2499) : (i64) -> i64
        %2502 = arith.cmpi ne, %2501, %2500 : i64
        %2503 = arith.cmpi eq, %2500, %2500 : i64
        %2504 = arith.andi %2502, %2503 : i1
        %2505 = scf.if %2504 -> (i64) {
          scf.yield %2499 : i64
        } else {
          scf.yield %2500 : i64
        }
        %2506 = arith.cmpi ne, %2505, %2500 : i64
        scf.if %2506 {
          func.call @stack_push_pointer(%2505) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2499) : (i64) -> ()
          %2507 = llvm.mlir.addressof @str233 : !llvm.ptr
          %2508 = func.call @cc_make_function_ref_const(%2507) : (!llvm.ptr) -> i64
          %2509 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2508, %2509) : (i64, i64) -> ()
        }
        %2510 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2510 : i64
      }
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2511 = arith.addi %2490, %__rlasp_stack_elide_zero_123 : i64
      scf.yield %2511 : i64
    }
    %2512 = func.call @cc_nil_value() : () -> i64
    %2513 = func.call @cc_errorp(%2250) : (i64) -> i64
    %2514 = arith.cmpi ne, %2513, %2512 : i64
    %2515 = scf.if %2514 -> (i64) {
      scf.yield %2250 : i64
    } else {
      %2516 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2517 = arith.constant 11 : i64
      %2518 = func.call @cc_make_string(%2516, %2517) : (!llvm.ptr, i64) -> i64
      %2519 = func.call @cc_nil_value() : () -> i64
      %2520 = func.call @cc_intern(%2518, %2519) : (i64, i64) -> i64
      %2521 = func.call @cc_nil_value() : () -> i64
      %2522 = func.call @cc_cons(%2520, %2521) : (i64, i64) -> i64
      %2523 = func.call @cc_values_pack(%2522) : (i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2524 = arith.addi %2520, %__rlasp_stack_elide_zero_124 : i64
      %2525 = func.call @cc_in_package(%2524) : (i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2526 = arith.addi %2525, %__rlasp_stack_elide_zero_125 : i64
      scf.yield %2526 : i64
    }
    %2527 = func.call @cc_nil_value() : () -> i64
    %2528 = func.call @cc_errorp(%2515) : (i64) -> i64
    %2529 = arith.cmpi ne, %2528, %2527 : i64
    %2530 = scf.if %2529 -> (i64) {
      scf.yield %2515 : i64
    } else {
      %2531 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2532 = arith.constant 23 : i64
      %2533 = func.call @cc_make_string(%2531, %2532) : (!llvm.ptr, i64) -> i64
      %2534 = func.call @cc_nil_value() : () -> i64
      %2535 = func.call @cc_intern(%2533, %2534) : (i64, i64) -> i64
      %2536 = func.call @cc_nil_value() : () -> i64
      %2537 = func.call @cc_cons(%2535, %2536) : (i64, i64) -> i64
      %2538 = func.call @cc_values_pack(%2537) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2539 = func.call @stack_pop_pointer() : () -> i64
      %2540 = func.call @cc_set_symbol_value(%2535, %2539) : (i64, i64) -> i64
      %2541 = func.call @cc_errorp(%2540) : (i64) -> i64
      %2542 = func.call @cc_nil_value() : () -> i64
      %2543 = arith.cmpi ne, %2541, %2542 : i64
      scf.if %2543 {
        func.call @stack_push_pointer(%2540) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2535) : (i64) -> ()
      }
      %2544 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2544 : i64
    }
    %2545 = func.call @cc_nil_value() : () -> i64
    %2546 = func.call @cc_errorp(%2530) : (i64) -> i64
    %2547 = arith.cmpi ne, %2546, %2545 : i64
    %2548 = scf.if %2547 -> (i64) {
      scf.yield %2530 : i64
    } else {
      %2549 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2550 = arith.constant 25 : i64
      %2551 = func.call @cc_make_string(%2549, %2550) : (!llvm.ptr, i64) -> i64
      %2552 = func.call @cc_nil_value() : () -> i64
      %2553 = func.call @cc_intern(%2551, %2552) : (i64, i64) -> i64
      %2554 = func.call @cc_nil_value() : () -> i64
      %2555 = func.call @cc_cons(%2553, %2554) : (i64, i64) -> i64
      %2556 = func.call @cc_values_pack(%2555) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @cc_set_symbol_value(%2553, %2557) : (i64, i64) -> i64
      %2559 = func.call @cc_errorp(%2558) : (i64) -> i64
      %2560 = func.call @cc_nil_value() : () -> i64
      %2561 = arith.cmpi ne, %2559, %2560 : i64
      scf.if %2561 {
        func.call @stack_push_pointer(%2558) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2553) : (i64) -> ()
      }
      %2562 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2562 : i64
    }
    %2563 = func.call @cc_nil_value() : () -> i64
    %2564 = func.call @cc_errorp(%2548) : (i64) -> i64
    %2565 = arith.cmpi ne, %2564, %2563 : i64
    %2566 = scf.if %2565 -> (i64) {
      scf.yield %2548 : i64
    } else {
      %2567 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2568 = arith.constant 23 : i64
      %2569 = func.call @cc_make_string(%2567, %2568) : (!llvm.ptr, i64) -> i64
      %2570 = func.call @cc_nil_value() : () -> i64
      %2571 = func.call @cc_intern(%2569, %2570) : (i64, i64) -> i64
      %2572 = func.call @cc_nil_value() : () -> i64
      %2573 = func.call @cc_cons(%2571, %2572) : (i64, i64) -> i64
      %2574 = func.call @cc_values_pack(%2573) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2575 = func.call @stack_pop_pointer() : () -> i64
      %2576 = func.call @cc_set_symbol_value(%2571, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_errorp(%2576) : (i64) -> i64
      %2578 = func.call @cc_nil_value() : () -> i64
      %2579 = arith.cmpi ne, %2577, %2578 : i64
      scf.if %2579 {
        func.call @stack_push_pointer(%2576) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2571) : (i64) -> ()
      }
      %2580 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2580 : i64
    }
    %2581 = func.call @cc_nil_value() : () -> i64
    %2582 = func.call @cc_errorp(%2566) : (i64) -> i64
    %2583 = arith.cmpi ne, %2582, %2581 : i64
    %2584 = scf.if %2583 -> (i64) {
      scf.yield %2566 : i64
    } else {
      %2585 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2586 = arith.constant 25 : i64
      %2587 = func.call @cc_make_string(%2585, %2586) : (!llvm.ptr, i64) -> i64
      %2588 = func.call @cc_nil_value() : () -> i64
      %2589 = func.call @cc_intern(%2587, %2588) : (i64, i64) -> i64
      %2590 = func.call @cc_nil_value() : () -> i64
      %2591 = func.call @cc_cons(%2589, %2590) : (i64, i64) -> i64
      %2592 = func.call @cc_values_pack(%2591) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2593 = func.call @stack_pop_pointer() : () -> i64
      %2594 = func.call @cc_set_symbol_value(%2589, %2593) : (i64, i64) -> i64
      %2595 = func.call @cc_errorp(%2594) : (i64) -> i64
      %2596 = func.call @cc_nil_value() : () -> i64
      %2597 = arith.cmpi ne, %2595, %2596 : i64
      scf.if %2597 {
        func.call @stack_push_pointer(%2594) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2589) : (i64) -> ()
      }
      %2598 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2598 : i64
    }
    %2599 = func.call @cc_nil_value() : () -> i64
    %2600 = func.call @cc_errorp(%2584) : (i64) -> i64
    %2601 = arith.cmpi ne, %2600, %2599 : i64
    %2602 = scf.if %2601 -> (i64) {
      scf.yield %2584 : i64
    } else {
      %2603 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2604 = arith.constant 19 : i64
      %2605 = func.call @cc_make_string(%2603, %2604) : (!llvm.ptr, i64) -> i64
      %2606 = func.call @cc_nil_value() : () -> i64
      %2607 = func.call @cc_intern(%2605, %2606) : (i64, i64) -> i64
      %2608 = func.call @cc_nil_value() : () -> i64
      %2609 = func.call @cc_cons(%2607, %2608) : (i64, i64) -> i64
      %2610 = func.call @cc_values_pack(%2609) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @cc_set_symbol_value(%2607, %2611) : (i64, i64) -> i64
      %2613 = func.call @cc_errorp(%2612) : (i64) -> i64
      %2614 = func.call @cc_nil_value() : () -> i64
      %2615 = arith.cmpi ne, %2613, %2614 : i64
      scf.if %2615 {
        func.call @stack_push_pointer(%2612) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2607) : (i64) -> ()
      }
      %2616 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2616 : i64
    }
    %2617 = func.call @cc_nil_value() : () -> i64
    %2618 = func.call @cc_errorp(%2602) : (i64) -> i64
    %2619 = arith.cmpi ne, %2618, %2617 : i64
    %2620 = scf.if %2619 -> (i64) {
      scf.yield %2602 : i64
    } else {
      %2621 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2622 = arith.constant 25 : i64
      %2623 = func.call @cc_make_string(%2621, %2622) : (!llvm.ptr, i64) -> i64
      %2624 = func.call @cc_nil_value() : () -> i64
      %2625 = func.call @cc_intern(%2623, %2624) : (i64, i64) -> i64
      %2626 = func.call @cc_nil_value() : () -> i64
      %2627 = func.call @cc_cons(%2625, %2626) : (i64, i64) -> i64
      %2628 = func.call @cc_values_pack(%2627) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @cc_set_symbol_value(%2625, %2629) : (i64, i64) -> i64
      %2631 = func.call @cc_errorp(%2630) : (i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = arith.cmpi ne, %2631, %2632 : i64
      scf.if %2633 {
        func.call @stack_push_pointer(%2630) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2625) : (i64) -> ()
      }
      %2634 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2634 : i64
    }
    %2635 = func.call @cc_nil_value() : () -> i64
    %2636 = func.call @cc_errorp(%2620) : (i64) -> i64
    %2637 = arith.cmpi ne, %2636, %2635 : i64
    %2638 = scf.if %2637 -> (i64) {
      scf.yield %2620 : i64
    } else {
      %2639 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2640 = arith.constant 19 : i64
      %2641 = func.call @cc_make_string(%2639, %2640) : (!llvm.ptr, i64) -> i64
      %2642 = func.call @cc_nil_value() : () -> i64
      %2643 = func.call @cc_intern(%2641, %2642) : (i64, i64) -> i64
      %2644 = func.call @cc_nil_value() : () -> i64
      %2645 = func.call @cc_cons(%2643, %2644) : (i64, i64) -> i64
      %2646 = func.call @cc_values_pack(%2645) : (i64) -> i64
      %2647 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2647) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %2648 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2649 = arith.addi %2648, %__rlasp_stack_elide_zero_126 : i64
      %2650 = func.call @cc_set_symbol_value(%2643, %2649) : (i64, i64) -> i64
      %2651 = func.call @cc_errorp(%2650) : (i64) -> i64
      %2652 = func.call @cc_nil_value() : () -> i64
      %2653 = arith.cmpi ne, %2651, %2652 : i64
      scf.if %2653 {
        func.call @stack_push_pointer(%2650) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2643) : (i64) -> ()
      }
      %2654 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2654 : i64
    }
    %2655 = func.call @cc_nil_value() : () -> i64
    %2656 = func.call @cc_errorp(%2638) : (i64) -> i64
    %2657 = arith.cmpi ne, %2656, %2655 : i64
    %2658 = scf.if %2657 -> (i64) {
      scf.yield %2638 : i64
    } else {
      %2659 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2660 = arith.constant 17 : i64
      %2661 = func.call @cc_make_string(%2659, %2660) : (!llvm.ptr, i64) -> i64
      %2662 = func.call @cc_nil_value() : () -> i64
      %2663 = func.call @cc_intern(%2661, %2662) : (i64, i64) -> i64
      %2664 = func.call @cc_nil_value() : () -> i64
      %2665 = func.call @cc_cons(%2663, %2664) : (i64, i64) -> i64
      %2666 = func.call @cc_values_pack(%2665) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2667 = func.call @stack_pop_pointer() : () -> i64
      %2668 = func.call @cc_set_symbol_value(%2663, %2667) : (i64, i64) -> i64
      %2669 = func.call @cc_errorp(%2668) : (i64) -> i64
      %2670 = func.call @cc_nil_value() : () -> i64
      %2671 = arith.cmpi ne, %2669, %2670 : i64
      scf.if %2671 {
        func.call @stack_push_pointer(%2668) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2663) : (i64) -> ()
      }
      %2672 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2672 : i64
    }
    %2673 = func.call @cc_nil_value() : () -> i64
    %2674 = func.call @cc_errorp(%2658) : (i64) -> i64
    %2675 = arith.cmpi ne, %2674, %2673 : i64
    %2676 = scf.if %2675 -> (i64) {
      scf.yield %2658 : i64
    } else {
      %2677 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2678 = arith.constant 20 : i64
      %2679 = func.call @cc_make_string(%2677, %2678) : (!llvm.ptr, i64) -> i64
      %2680 = func.call @cc_nil_value() : () -> i64
      %2681 = func.call @cc_intern(%2679, %2680) : (i64, i64) -> i64
      %2682 = func.call @cc_nil_value() : () -> i64
      %2683 = func.call @cc_cons(%2681, %2682) : (i64, i64) -> i64
      %2684 = func.call @cc_values_pack(%2683) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @cc_set_symbol_value(%2681, %2685) : (i64, i64) -> i64
      %2687 = func.call @cc_errorp(%2686) : (i64) -> i64
      %2688 = func.call @cc_nil_value() : () -> i64
      %2689 = arith.cmpi ne, %2687, %2688 : i64
      scf.if %2689 {
        func.call @stack_push_pointer(%2686) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2681) : (i64) -> ()
      }
      %2690 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2690 : i64
    }
    %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
    %2691 = arith.addi %2676, %__rlasp_stack_elide_zero_127 : i64
    %2692 = func.call @cc_multiple_value_list(%2691) : (i64) -> i64
    %2693 = llvm.mlir.addressof @str244 : !llvm.ptr
    %2694 = arith.constant 37 : i64
    %2695 = func.call @cc_make_string(%2693, %2694) : (!llvm.ptr, i64) -> i64
    %2696 = func.call @cc_nil_value() : () -> i64
    %2697 = func.call @cc_intern(%2695, %2696) : (i64, i64) -> i64
    %2698 = func.call @cc_nil_value() : () -> i64
    %2699 = func.call @cc_cons(%2697, %2698) : (i64, i64) -> i64
    %2700 = func.call @cc_values_pack(%2699) : (i64) -> i64
    %2701 = func.call @cc_symbol_value(%2697) : (i64) -> i64
    %2702 = llvm.mlir.addressof @str245 : !llvm.ptr
    %2703 = arith.constant 39 : i64
    %2704 = func.call @cc_make_string(%2702, %2703) : (!llvm.ptr, i64) -> i64
    %2705 = func.call @cc_nil_value() : () -> i64
    %2706 = func.call @cc_intern(%2704, %2705) : (i64, i64) -> i64
    %2707 = func.call @cc_nil_value() : () -> i64
    %2708 = func.call @cc_cons(%2706, %2707) : (i64, i64) -> i64
    %2709 = func.call @cc_values_pack(%2708) : (i64) -> i64
    %2710 = func.call @cc_symbol_value(%2706) : (i64) -> i64
    %2711 = func.call @cc_nil_value() : () -> i64
    %2712 = arith.cmpi ne, %2701, %2711 : i64
    %2713 = scf.if %2712 -> (i64) {
      scf.yield %2710 : i64
    } else {
      scf.yield %2692 : i64
    }
    %2714 = func.call @cc_values_pack(%2713) : (i64) -> i64
    func.call @stack_push_pointer(%2714) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1("level\0Acontrol-string\0Aargs\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_96868088414208*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("Display a message using ANSI highlighting if possible. LEVEL should be NIL, :ERR,\0A:WARN or :EMPH.\00") : !llvm.array<98 x i8>
  llvm.mlir.global private constant @str6("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("FRESH-LINE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str9("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str12("~c[~dm\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str20("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP:FORMAT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str23("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str26("~c[0m\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str27("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str28("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("TERPRI\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str33("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str34("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETVALUE_96868088414209*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str37("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str38("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str39("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str40("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str41("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str42("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str43("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str46("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str47("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETVALUE_96868088414210*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str51("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str52("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str53("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str54("~%Duplicate test ~a~%\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str55("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str56("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str57("%FN%(setf COMMON-LISP:GETHASH)\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str60("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str61("file&error\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETVALUE_96868088414211*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str64("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str65("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str66("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str69("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETVALUE_96868088414212*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str73("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str74("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("~@[~%Failures:~%  ~/pprint-fill/~%~]~\0A~@[~%Unexpected Successes:~%  ~/pprint-fill/~%~]~\0A~@[~%Expected Failures:~%  ~/pprint-fill/~%~]\0ASuccesses: ~d\00") : !llvm.array<148 x i8>
  llvm.mlir.global private constant @str76("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str77("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str78("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str79("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str80("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str81("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str82("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str83("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str84("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str85("Compilation error for file ~a with error  ~a\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str86("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str88("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str89("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str90("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("Duplicate test ~a\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str92("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str94("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str95("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str96("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str97("name\0Aform\0Aexpected\0ACOMMON-LISP:ERROR\0Adescription\00") : !llvm.array<49 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str99("*__MLIR_BLOCK_RETVALUE_96868088414213*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str100("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str101("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str102("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str103("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str104("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str105("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str106("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str107("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str108("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str109("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str110("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str111("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("Unexpected error~%~t~a~%while evaluating~%~t~a\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str115("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str117("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str119("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str121("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str122("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str123("name\0Aform\0Aexpected\0Aactual\0Adescription\0Atest\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str124("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str125("*__MLIR_BLOCK_RETVALUE_96868088414214*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str126("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str127("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str128("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str129("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str130("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str131("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str132("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str135("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str137("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str138("Wanted values ~s to~%~{~t~a~%~}but got~%~{~t~a~%~}\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str139("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str141("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str142("while evaluating~%~t~a~%\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str143("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str145("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str146("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str147("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str149("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str150("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str151("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str152("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str153("*__MLIR_BLOCK_RETVALUE_96868088414215*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str154("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str155("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str156("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str157("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str158("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str159("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str160("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str161("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str162("Passed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str163("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str165("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str166("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str167("name\0Aform\0Athunk\0Aexpected\0Adescription\0Atest\00") : !llvm.array<42 x i8>
  llvm.mlir.global private constant @str168("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str170("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str173("*__MLIR_BLOCK_RETVALUE_96868088414216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str174("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str175("%FN%note-test\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str176("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str177("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str178("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str180("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str181("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str182("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str183("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str184("*__MLIR_BLOCK_RETVALUE_96868088414217*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str185("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str186("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str188("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str190("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str191("%FN%note-compile-error\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str192("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str193("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str194("Regression: compile-file of ~a failed with ~a\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str195("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str197("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str198("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str199("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str200("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str201("*__MLIR_BLOCK_RETVALUE_96868088414218*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str202("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str203("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str205("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str206("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str207("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str208("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str209("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str210("*__MLIR_BLOCK_RETVALUE_96868088414219*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str211("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str212("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str214("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str216("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str217("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str218("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str219("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str220("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str223("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str225("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str226("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str227("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str228("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str229("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str230("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str232("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str234("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str235("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str236("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str237("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str238("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str239("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str240("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str241("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str242("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str243("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str244("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str245("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%message\00%FN%message\00%FN%%test\00%FN%%test\00\00") : !llvm.array<45 x i8>
}
