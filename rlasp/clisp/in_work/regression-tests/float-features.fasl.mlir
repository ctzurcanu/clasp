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
    %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
    %41 = arith.addi %12, %__rlasp_stack_elide_zero_0 : i64
    %42 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%42) : (i64) -> ()
    %43 = func.call @stack_pop_pointer() : () -> i64
    %44 = func.call @cc_random(%43) : (i64) -> i64
    %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
    %45 = arith.addi %44, %__rlasp_stack_elide_zero_1 : i64
    %46 = arith.constant 1 : i1
    %48 = arith.constant 3 : i64
    %47 = arith.andi %41, %48 : i64
    %49 = arith.constant 0 : i64
    %50 = arith.cmpi eq, %47, %49 : i64
    %52 = arith.constant 3 : i64
    %51 = arith.andi %45, %52 : i64
    %53 = arith.constant 0 : i64
    %54 = arith.cmpi eq, %51, %53 : i64
    %55 = arith.andi %50, %54 : i1
    %56 = scf.if %55 -> (i1) {
      %57 = arith.constant 2 : i64
      %58 = arith.shrsi %41, %57 : i64
      %59 = arith.constant 2 : i64
      %60 = arith.shrsi %45, %59 : i64
      %61 = arith.cmpi sgt, %58, %60 : i64
      scf.yield %61 : i1
    } else {
      %62 = func.call @cc_gt(%41, %45) : (i64, i64) -> i64
      %63 = func.call @cc_nil_value() : () -> i64
      %64 = arith.cmpi ne, %62, %63 : i64
      scf.yield %64 : i1
    }
    %65 = arith.andi %46, %56 : i1
    %66 = func.call @cc_nil_value() : () -> i64
    %67 = func.call @cc_t_value() : () -> i64
    %68 = scf.if %65 -> (i64) {
      scf.yield %67 : i64
    } else {
      scf.yield %66 : i64
    }
    %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
    %69 = arith.addi %68, %__rlasp_stack_elide_zero_2 : i64
    %70 = func.call @cc_nil_value() : () -> i64
    %71 = arith.cmpi ne, %69, %70 : i64
    scf.if %71 {
      %72 = llvm.mlir.addressof @str5 : !llvm.ptr
      %73 = arith.constant 24 : i64
      %74 = func.call @cc_make_string(%72, %73) : (!llvm.ptr, i64) -> i64
      %75 = llvm.mlir.addressof @str6 : !llvm.ptr
      %76 = arith.constant 11 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = func.call @cc_intern(%74, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      %82 = func.call @cc_symbol_value(%78) : (i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
    } else {
      %83 = llvm.mlir.addressof @str7 : !llvm.ptr
      %84 = arith.constant 24 : i64
      %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
      %86 = llvm.mlir.addressof @str8 : !llvm.ptr
      %87 = arith.constant 11 : i64
      %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
      %89 = func.call @cc_intern(%85, %88) : (i64, i64) -> i64
      %90 = func.call @cc_nil_value() : () -> i64
      %91 = func.call @cc_cons(%89, %90) : (i64, i64) -> i64
      %92 = func.call @cc_values_pack(%91) : (i64) -> i64
      %93 = func.call @cc_symbol_value(%89) : (i64) -> i64
      func.call @stack_push_pointer(%93) : (i64) -> ()
    }
    %94 = func.call @stack_pop_pointer() : () -> i64
    %95 = func.call @cc_multiple_value_list(%94) : (i64) -> i64
    %96 = llvm.mlir.addressof @str9 : !llvm.ptr
    %97 = arith.constant 38 : i64
    %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
    %99 = func.call @cc_nil_value() : () -> i64
    %100 = func.call @cc_intern(%98, %99) : (i64, i64) -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
    %103 = func.call @cc_values_pack(%102) : (i64) -> i64
    %104 = func.call @cc_symbol_value(%100) : (i64) -> i64
    %105 = llvm.mlir.addressof @str10 : !llvm.ptr
    %106 = arith.constant 40 : i64
    %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
    %108 = func.call @cc_nil_value() : () -> i64
    %109 = func.call @cc_intern(%107, %108) : (i64, i64) -> i64
    %110 = func.call @cc_nil_value() : () -> i64
    %111 = func.call @cc_cons(%109, %110) : (i64, i64) -> i64
    %112 = func.call @cc_values_pack(%111) : (i64) -> i64
    %113 = func.call @cc_symbol_value(%109) : (i64) -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = arith.cmpi ne, %104, %114 : i64
    %116 = scf.if %115 -> (i64) {
      scf.yield %113 : i64
    } else {
      scf.yield %95 : i64
    }
    %117 = func.call @cc_values_pack(%116) : (i64) -> i64
    func.call @stack_push_pointer(%117) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bar-ext-1"() {
    %118 = llvm.mlir.addressof @str11 : !llvm.ptr
    %119 = arith.constant 9 : i64
    %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
    %121 = func.call @cc_nil_value() : () -> i64
    %122 = func.call @cc_intern(%120, %121) : (i64, i64) -> i64
    %123 = func.call @cc_nil_value() : () -> i64
    %124 = func.call @cc_cons(%122, %123) : (i64, i64) -> i64
    %125 = func.call @cc_values_pack(%124) : (i64) -> i64
    %126 = llvm.mlir.addressof @str12 : !llvm.ptr
    %127 = arith.constant 1 : i64
    %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
    %129 = func.call @cc_register_function_lambda_list_metadata_raw(%122, %128) : (i64, i64) -> i64
    %130 = func.call @stack_pop_pointer() : () -> i64
    %131 = func.call @cc_nil_value() : () -> i64
    %132 = llvm.mlir.addressof @str13 : !llvm.ptr
    %133 = arith.constant 38 : i64
    %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
    %135 = func.call @cc_nil_value() : () -> i64
    %136 = func.call @cc_intern(%134, %135) : (i64, i64) -> i64
    %137 = func.call @cc_nil_value() : () -> i64
    %138 = func.call @cc_cons(%136, %137) : (i64, i64) -> i64
    %139 = func.call @cc_values_pack(%138) : (i64) -> i64
    %140 = func.call @cc_set_symbol_value(%136, %131) : (i64, i64) -> i64
    %141 = llvm.mlir.addressof @str14 : !llvm.ptr
    %142 = arith.constant 39 : i64
    %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
    %144 = func.call @cc_nil_value() : () -> i64
    %145 = func.call @cc_intern(%143, %144) : (i64, i64) -> i64
    %146 = func.call @cc_nil_value() : () -> i64
    %147 = func.call @cc_cons(%145, %146) : (i64, i64) -> i64
    %148 = func.call @cc_values_pack(%147) : (i64) -> i64
    %149 = func.call @cc_set_symbol_value(%145, %131) : (i64, i64) -> i64
    %150 = llvm.mlir.addressof @str15 : !llvm.ptr
    %151 = arith.constant 40 : i64
    %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
    %153 = func.call @cc_nil_value() : () -> i64
    %154 = func.call @cc_intern(%152, %153) : (i64, i64) -> i64
    %155 = func.call @cc_nil_value() : () -> i64
    %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
    %157 = func.call @cc_values_pack(%156) : (i64) -> i64
    %158 = func.call @cc_set_symbol_value(%154, %131) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
    %159 = arith.addi %130, %__rlasp_stack_elide_zero_3 : i64
    %160 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%160) : (i64) -> ()
    %161 = func.call @stack_pop_pointer() : () -> i64
    %162 = func.call @cc_random(%161) : (i64) -> i64
    %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
    %163 = arith.addi %162, %__rlasp_stack_elide_zero_4 : i64
    %164 = arith.constant 1 : i1
    %166 = arith.constant 3 : i64
    %165 = arith.andi %159, %166 : i64
    %167 = arith.constant 0 : i64
    %168 = arith.cmpi eq, %165, %167 : i64
    %170 = arith.constant 3 : i64
    %169 = arith.andi %163, %170 : i64
    %171 = arith.constant 0 : i64
    %172 = arith.cmpi eq, %169, %171 : i64
    %173 = arith.andi %168, %172 : i1
    %174 = scf.if %173 -> (i1) {
      %175 = arith.constant 2 : i64
      %176 = arith.shrsi %159, %175 : i64
      %177 = arith.constant 2 : i64
      %178 = arith.shrsi %163, %177 : i64
      %179 = arith.cmpi sgt, %176, %178 : i64
      scf.yield %179 : i1
    } else {
      %180 = func.call @cc_gt(%159, %163) : (i64, i64) -> i64
      %181 = func.call @cc_nil_value() : () -> i64
      %182 = arith.cmpi ne, %180, %181 : i64
      scf.yield %182 : i1
    }
    %183 = arith.andi %164, %174 : i1
    %184 = func.call @cc_nil_value() : () -> i64
    %185 = func.call @cc_t_value() : () -> i64
    %186 = scf.if %183 -> (i64) {
      scf.yield %185 : i64
    } else {
      scf.yield %184 : i64
    }
    %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
    %187 = arith.addi %186, %__rlasp_stack_elide_zero_5 : i64
    %188 = func.call @cc_nil_value() : () -> i64
    %189 = arith.cmpi ne, %187, %188 : i64
    scf.if %189 {
      %190 = llvm.mlir.addressof @str16 : !llvm.ptr
      %191 = arith.constant 24 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = llvm.mlir.addressof @str17 : !llvm.ptr
      %194 = arith.constant 11 : i64
      %195 = func.call @cc_make_string(%193, %194) : (!llvm.ptr, i64) -> i64
      %196 = func.call @cc_intern(%192, %195) : (i64, i64) -> i64
      %197 = func.call @cc_nil_value() : () -> i64
      %198 = func.call @cc_cons(%196, %197) : (i64, i64) -> i64
      %199 = func.call @cc_values_pack(%198) : (i64) -> i64
      %200 = func.call @cc_symbol_value(%196) : (i64) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
    } else {
      %201 = llvm.mlir.addressof @str18 : !llvm.ptr
      %202 = arith.constant 24 : i64
      %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
      %204 = llvm.mlir.addressof @str19 : !llvm.ptr
      %205 = arith.constant 11 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = func.call @cc_intern(%203, %206) : (i64, i64) -> i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_cons(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_values_pack(%209) : (i64) -> i64
      %211 = func.call @cc_symbol_value(%207) : (i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
    }
    %212 = func.call @stack_pop_pointer() : () -> i64
    %213 = func.call @cc_multiple_value_list(%212) : (i64) -> i64
    %214 = llvm.mlir.addressof @str20 : !llvm.ptr
    %215 = arith.constant 38 : i64
    %216 = func.call @cc_make_string(%214, %215) : (!llvm.ptr, i64) -> i64
    %217 = func.call @cc_nil_value() : () -> i64
    %218 = func.call @cc_intern(%216, %217) : (i64, i64) -> i64
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
    %221 = func.call @cc_values_pack(%220) : (i64) -> i64
    %222 = func.call @cc_symbol_value(%218) : (i64) -> i64
    %223 = llvm.mlir.addressof @str21 : !llvm.ptr
    %224 = arith.constant 40 : i64
    %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
    %226 = func.call @cc_nil_value() : () -> i64
    %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
    %228 = func.call @cc_nil_value() : () -> i64
    %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
    %230 = func.call @cc_values_pack(%229) : (i64) -> i64
    %231 = func.call @cc_symbol_value(%227) : (i64) -> i64
    %232 = func.call @cc_nil_value() : () -> i64
    %233 = arith.cmpi ne, %222, %232 : i64
    %234 = scf.if %233 -> (i64) {
      scf.yield %231 : i64
    } else {
      scf.yield %213 : i64
    }
    %235 = func.call @cc_values_pack(%234) : (i64) -> i64
    func.call @stack_push_pointer(%235) : (i64) -> ()
    func.return
  }
  func.func @"%FN%foo-ext-2"() {
    %236 = llvm.mlir.addressof @str22 : !llvm.ptr
    %237 = arith.constant 9 : i64
    %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
    %239 = func.call @cc_nil_value() : () -> i64
    %240 = func.call @cc_intern(%238, %239) : (i64, i64) -> i64
    %241 = func.call @cc_nil_value() : () -> i64
    %242 = func.call @cc_cons(%240, %241) : (i64, i64) -> i64
    %243 = func.call @cc_values_pack(%242) : (i64) -> i64
    %244 = llvm.mlir.addressof @str23 : !llvm.ptr
    %245 = arith.constant 1 : i64
    %246 = func.call @cc_make_string(%244, %245) : (!llvm.ptr, i64) -> i64
    %247 = func.call @cc_register_function_lambda_list_metadata_raw(%240, %246) : (i64, i64) -> i64
    %248 = func.call @stack_pop_pointer() : () -> i64
    %249 = func.call @cc_nil_value() : () -> i64
    %250 = llvm.mlir.addressof @str24 : !llvm.ptr
    %251 = arith.constant 38 : i64
    %252 = func.call @cc_make_string(%250, %251) : (!llvm.ptr, i64) -> i64
    %253 = func.call @cc_nil_value() : () -> i64
    %254 = func.call @cc_intern(%252, %253) : (i64, i64) -> i64
    %255 = func.call @cc_nil_value() : () -> i64
    %256 = func.call @cc_cons(%254, %255) : (i64, i64) -> i64
    %257 = func.call @cc_values_pack(%256) : (i64) -> i64
    %258 = func.call @cc_set_symbol_value(%254, %249) : (i64, i64) -> i64
    %259 = llvm.mlir.addressof @str25 : !llvm.ptr
    %260 = arith.constant 39 : i64
    %261 = func.call @cc_make_string(%259, %260) : (!llvm.ptr, i64) -> i64
    %262 = func.call @cc_nil_value() : () -> i64
    %263 = func.call @cc_intern(%261, %262) : (i64, i64) -> i64
    %264 = func.call @cc_nil_value() : () -> i64
    %265 = func.call @cc_cons(%263, %264) : (i64, i64) -> i64
    %266 = func.call @cc_values_pack(%265) : (i64) -> i64
    %267 = func.call @cc_set_symbol_value(%263, %249) : (i64, i64) -> i64
    %268 = llvm.mlir.addressof @str26 : !llvm.ptr
    %269 = arith.constant 40 : i64
    %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
    %271 = func.call @cc_nil_value() : () -> i64
    %272 = func.call @cc_intern(%270, %271) : (i64, i64) -> i64
    %273 = func.call @cc_nil_value() : () -> i64
    %274 = func.call @cc_cons(%272, %273) : (i64, i64) -> i64
    %275 = func.call @cc_values_pack(%274) : (i64) -> i64
    %276 = func.call @cc_set_symbol_value(%272, %249) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
    %277 = arith.addi %248, %__rlasp_stack_elide_zero_6 : i64
    %278 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%278) : (i64) -> ()
    %279 = func.call @stack_pop_pointer() : () -> i64
    %280 = func.call @cc_random(%279) : (i64) -> i64
    %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
    %281 = arith.addi %280, %__rlasp_stack_elide_zero_7 : i64
    %282 = arith.constant 1 : i1
    %284 = arith.constant 3 : i64
    %283 = arith.andi %277, %284 : i64
    %285 = arith.constant 0 : i64
    %286 = arith.cmpi eq, %283, %285 : i64
    %288 = arith.constant 3 : i64
    %287 = arith.andi %281, %288 : i64
    %289 = arith.constant 0 : i64
    %290 = arith.cmpi eq, %287, %289 : i64
    %291 = arith.andi %286, %290 : i1
    %292 = scf.if %291 -> (i1) {
      %293 = arith.constant 2 : i64
      %294 = arith.shrsi %277, %293 : i64
      %295 = arith.constant 2 : i64
      %296 = arith.shrsi %281, %295 : i64
      %297 = arith.cmpi sgt, %294, %296 : i64
      scf.yield %297 : i1
    } else {
      %298 = func.call @cc_gt(%277, %281) : (i64, i64) -> i64
      %299 = func.call @cc_nil_value() : () -> i64
      %300 = arith.cmpi ne, %298, %299 : i64
      scf.yield %300 : i1
    }
    %301 = arith.andi %282, %292 : i1
    %302 = func.call @cc_nil_value() : () -> i64
    %303 = func.call @cc_t_value() : () -> i64
    %304 = scf.if %301 -> (i64) {
      scf.yield %303 : i64
    } else {
      scf.yield %302 : i64
    }
    %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
    %305 = arith.addi %304, %__rlasp_stack_elide_zero_8 : i64
    %306 = func.call @cc_nil_value() : () -> i64
    %307 = arith.cmpi ne, %305, %306 : i64
    scf.if %307 {
      %308 = llvm.mlir.addressof @str27 : !llvm.ptr
      %309 = arith.constant 24 : i64
      %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
      %311 = llvm.mlir.addressof @str28 : !llvm.ptr
      %312 = arith.constant 11 : i64
      %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
      %314 = func.call @cc_intern(%310, %313) : (i64, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_cons(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_values_pack(%316) : (i64) -> i64
      %318 = func.call @cc_symbol_value(%314) : (i64) -> i64
      %319 = arith.constant 3 : i64
      %320 = func.call @cc_box_fixnum(%319) : (i64) -> i64
      %322 = arith.constant 3 : i64
      %321 = arith.andi %318, %322 : i64
      %323 = arith.constant 0 : i64
      %324 = arith.cmpi eq, %321, %323 : i64
      %326 = arith.constant 3 : i64
      %325 = arith.andi %320, %326 : i64
      %327 = arith.constant 0 : i64
      %328 = arith.cmpi eq, %325, %327 : i64
      %329 = arith.andi %324, %328 : i1
      %330 = scf.if %329 -> (i64) {
        %331 = arith.constant 2 : i64
        %332 = arith.shrsi %318, %331 : i64
        %333 = arith.constant 2 : i64
        %334 = arith.shrsi %320, %333 : i64
        %335 = arith.subi %332, %334 : i64
        %336 = arith.constant -2305843009213693952 : i64
        %337 = arith.constant 2305843009213693951 : i64
        %338 = arith.cmpi sge, %335, %336 : i64
        %339 = arith.cmpi sle, %335, %337 : i64
        %340 = arith.andi %338, %339 : i1
        %341 = scf.if %340 -> (i64) {
          %342 = arith.constant 2 : i64
          %343 = arith.shli %335, %342 : i64
          scf.yield %343 : i64
        } else {
          %344 = func.call @cc_sub(%318, %320) : (i64, i64) -> i64
          scf.yield %344 : i64
        }
        scf.yield %341 : i64
      } else {
        %345 = func.call @cc_sub(%318, %320) : (i64, i64) -> i64
        scf.yield %345 : i64
      }
      func.call @stack_push_pointer(%330) : (i64) -> ()
    } else {
      %346 = llvm.mlir.addressof @str29 : !llvm.ptr
      %347 = arith.constant 24 : i64
      %348 = func.call @cc_make_string(%346, %347) : (!llvm.ptr, i64) -> i64
      %349 = llvm.mlir.addressof @str30 : !llvm.ptr
      %350 = arith.constant 11 : i64
      %351 = func.call @cc_make_string(%349, %350) : (!llvm.ptr, i64) -> i64
      %352 = func.call @cc_intern(%348, %351) : (i64, i64) -> i64
      %353 = func.call @cc_nil_value() : () -> i64
      %354 = func.call @cc_cons(%352, %353) : (i64, i64) -> i64
      %355 = func.call @cc_values_pack(%354) : (i64) -> i64
      %356 = func.call @cc_symbol_value(%352) : (i64) -> i64
      %357 = arith.constant 3 : i64
      %358 = func.call @cc_box_fixnum(%357) : (i64) -> i64
      %360 = arith.constant 3 : i64
      %359 = arith.andi %356, %360 : i64
      %361 = arith.constant 0 : i64
      %362 = arith.cmpi eq, %359, %361 : i64
      %364 = arith.constant 3 : i64
      %363 = arith.andi %358, %364 : i64
      %365 = arith.constant 0 : i64
      %366 = arith.cmpi eq, %363, %365 : i64
      %367 = arith.andi %362, %366 : i1
      %368 = scf.if %367 -> (i64) {
        %369 = arith.constant 2 : i64
        %370 = arith.shrsi %356, %369 : i64
        %371 = arith.constant 2 : i64
        %372 = arith.shrsi %358, %371 : i64
        %373 = arith.subi %370, %372 : i64
        %374 = arith.constant -2305843009213693952 : i64
        %375 = arith.constant 2305843009213693951 : i64
        %376 = arith.cmpi sge, %373, %374 : i64
        %377 = arith.cmpi sle, %373, %375 : i64
        %378 = arith.andi %376, %377 : i1
        %379 = scf.if %378 -> (i64) {
          %380 = arith.constant 2 : i64
          %381 = arith.shli %373, %380 : i64
          scf.yield %381 : i64
        } else {
          %382 = func.call @cc_sub(%356, %358) : (i64, i64) -> i64
          scf.yield %382 : i64
        }
        scf.yield %379 : i64
      } else {
        %383 = func.call @cc_sub(%356, %358) : (i64, i64) -> i64
        scf.yield %383 : i64
      }
      func.call @stack_push_pointer(%368) : (i64) -> ()
    }
    %384 = func.call @stack_pop_pointer() : () -> i64
    %385 = func.call @cc_multiple_value_list(%384) : (i64) -> i64
    %386 = llvm.mlir.addressof @str31 : !llvm.ptr
    %387 = arith.constant 38 : i64
    %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
    %389 = func.call @cc_nil_value() : () -> i64
    %390 = func.call @cc_intern(%388, %389) : (i64, i64) -> i64
    %391 = func.call @cc_nil_value() : () -> i64
    %392 = func.call @cc_cons(%390, %391) : (i64, i64) -> i64
    %393 = func.call @cc_values_pack(%392) : (i64) -> i64
    %394 = func.call @cc_symbol_value(%390) : (i64) -> i64
    %395 = llvm.mlir.addressof @str32 : !llvm.ptr
    %396 = arith.constant 40 : i64
    %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
    %398 = func.call @cc_nil_value() : () -> i64
    %399 = func.call @cc_intern(%397, %398) : (i64, i64) -> i64
    %400 = func.call @cc_nil_value() : () -> i64
    %401 = func.call @cc_cons(%399, %400) : (i64, i64) -> i64
    %402 = func.call @cc_values_pack(%401) : (i64) -> i64
    %403 = func.call @cc_symbol_value(%399) : (i64) -> i64
    %404 = func.call @cc_nil_value() : () -> i64
    %405 = arith.cmpi ne, %394, %404 : i64
    %406 = scf.if %405 -> (i64) {
      scf.yield %403 : i64
    } else {
      scf.yield %385 : i64
    }
    %407 = func.call @cc_values_pack(%406) : (i64) -> i64
    func.call @stack_push_pointer(%407) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bar-ext-2"() {
    %408 = llvm.mlir.addressof @str33 : !llvm.ptr
    %409 = arith.constant 9 : i64
    %410 = func.call @cc_make_string(%408, %409) : (!llvm.ptr, i64) -> i64
    %411 = func.call @cc_nil_value() : () -> i64
    %412 = func.call @cc_intern(%410, %411) : (i64, i64) -> i64
    %413 = func.call @cc_nil_value() : () -> i64
    %414 = func.call @cc_cons(%412, %413) : (i64, i64) -> i64
    %415 = func.call @cc_values_pack(%414) : (i64) -> i64
    %416 = llvm.mlir.addressof @str34 : !llvm.ptr
    %417 = arith.constant 1 : i64
    %418 = func.call @cc_make_string(%416, %417) : (!llvm.ptr, i64) -> i64
    %419 = func.call @cc_register_function_lambda_list_metadata_raw(%412, %418) : (i64, i64) -> i64
    %420 = func.call @stack_pop_pointer() : () -> i64
    %421 = func.call @cc_nil_value() : () -> i64
    %422 = llvm.mlir.addressof @str35 : !llvm.ptr
    %423 = arith.constant 38 : i64
    %424 = func.call @cc_make_string(%422, %423) : (!llvm.ptr, i64) -> i64
    %425 = func.call @cc_nil_value() : () -> i64
    %426 = func.call @cc_intern(%424, %425) : (i64, i64) -> i64
    %427 = func.call @cc_nil_value() : () -> i64
    %428 = func.call @cc_cons(%426, %427) : (i64, i64) -> i64
    %429 = func.call @cc_values_pack(%428) : (i64) -> i64
    %430 = func.call @cc_set_symbol_value(%426, %421) : (i64, i64) -> i64
    %431 = llvm.mlir.addressof @str36 : !llvm.ptr
    %432 = arith.constant 39 : i64
    %433 = func.call @cc_make_string(%431, %432) : (!llvm.ptr, i64) -> i64
    %434 = func.call @cc_nil_value() : () -> i64
    %435 = func.call @cc_intern(%433, %434) : (i64, i64) -> i64
    %436 = func.call @cc_nil_value() : () -> i64
    %437 = func.call @cc_cons(%435, %436) : (i64, i64) -> i64
    %438 = func.call @cc_values_pack(%437) : (i64) -> i64
    %439 = func.call @cc_set_symbol_value(%435, %421) : (i64, i64) -> i64
    %440 = llvm.mlir.addressof @str37 : !llvm.ptr
    %441 = arith.constant 40 : i64
    %442 = func.call @cc_make_string(%440, %441) : (!llvm.ptr, i64) -> i64
    %443 = func.call @cc_nil_value() : () -> i64
    %444 = func.call @cc_intern(%442, %443) : (i64, i64) -> i64
    %445 = func.call @cc_nil_value() : () -> i64
    %446 = func.call @cc_cons(%444, %445) : (i64, i64) -> i64
    %447 = func.call @cc_values_pack(%446) : (i64) -> i64
    %448 = func.call @cc_set_symbol_value(%444, %421) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
    %449 = arith.addi %420, %__rlasp_stack_elide_zero_9 : i64
    %450 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%450) : (i64) -> ()
    %451 = func.call @stack_pop_pointer() : () -> i64
    %452 = func.call @cc_random(%451) : (i64) -> i64
    %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
    %453 = arith.addi %452, %__rlasp_stack_elide_zero_10 : i64
    %454 = arith.constant 1 : i1
    %456 = arith.constant 3 : i64
    %455 = arith.andi %449, %456 : i64
    %457 = arith.constant 0 : i64
    %458 = arith.cmpi eq, %455, %457 : i64
    %460 = arith.constant 3 : i64
    %459 = arith.andi %453, %460 : i64
    %461 = arith.constant 0 : i64
    %462 = arith.cmpi eq, %459, %461 : i64
    %463 = arith.andi %458, %462 : i1
    %464 = scf.if %463 -> (i1) {
      %465 = arith.constant 2 : i64
      %466 = arith.shrsi %449, %465 : i64
      %467 = arith.constant 2 : i64
      %468 = arith.shrsi %453, %467 : i64
      %469 = arith.cmpi sgt, %466, %468 : i64
      scf.yield %469 : i1
    } else {
      %470 = func.call @cc_gt(%449, %453) : (i64, i64) -> i64
      %471 = func.call @cc_nil_value() : () -> i64
      %472 = arith.cmpi ne, %470, %471 : i64
      scf.yield %472 : i1
    }
    %473 = arith.andi %454, %464 : i1
    %474 = func.call @cc_nil_value() : () -> i64
    %475 = func.call @cc_t_value() : () -> i64
    %476 = scf.if %473 -> (i64) {
      scf.yield %475 : i64
    } else {
      scf.yield %474 : i64
    }
    %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
    %477 = arith.addi %476, %__rlasp_stack_elide_zero_11 : i64
    %478 = func.call @cc_nil_value() : () -> i64
    %479 = arith.cmpi ne, %477, %478 : i64
    scf.if %479 {
      %480 = llvm.mlir.addressof @str38 : !llvm.ptr
      %481 = arith.constant 24 : i64
      %482 = func.call @cc_make_string(%480, %481) : (!llvm.ptr, i64) -> i64
      %483 = llvm.mlir.addressof @str39 : !llvm.ptr
      %484 = arith.constant 11 : i64
      %485 = func.call @cc_make_string(%483, %484) : (!llvm.ptr, i64) -> i64
      %486 = func.call @cc_intern(%482, %485) : (i64, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_values_pack(%488) : (i64) -> i64
      %490 = func.call @cc_symbol_value(%486) : (i64) -> i64
      %491 = arith.constant 3 : i64
      %492 = func.call @cc_box_fixnum(%491) : (i64) -> i64
      %494 = arith.constant 3 : i64
      %493 = arith.andi %490, %494 : i64
      %495 = arith.constant 0 : i64
      %496 = arith.cmpi eq, %493, %495 : i64
      %498 = arith.constant 3 : i64
      %497 = arith.andi %492, %498 : i64
      %499 = arith.constant 0 : i64
      %500 = arith.cmpi eq, %497, %499 : i64
      %501 = arith.andi %496, %500 : i1
      %502 = scf.if %501 -> (i64) {
        %503 = arith.constant 2 : i64
        %504 = arith.shrsi %490, %503 : i64
        %505 = arith.constant 2 : i64
        %506 = arith.shrsi %492, %505 : i64
        %507 = arith.subi %504, %506 : i64
        %508 = arith.constant -2305843009213693952 : i64
        %509 = arith.constant 2305843009213693951 : i64
        %510 = arith.cmpi sge, %507, %508 : i64
        %511 = arith.cmpi sle, %507, %509 : i64
        %512 = arith.andi %510, %511 : i1
        %513 = scf.if %512 -> (i64) {
          %514 = arith.constant 2 : i64
          %515 = arith.shli %507, %514 : i64
          scf.yield %515 : i64
        } else {
          %516 = func.call @cc_sub(%490, %492) : (i64, i64) -> i64
          scf.yield %516 : i64
        }
        scf.yield %513 : i64
      } else {
        %517 = func.call @cc_sub(%490, %492) : (i64, i64) -> i64
        scf.yield %517 : i64
      }
      func.call @stack_push_pointer(%502) : (i64) -> ()
    } else {
      %518 = llvm.mlir.addressof @str40 : !llvm.ptr
      %519 = arith.constant 24 : i64
      %520 = func.call @cc_make_string(%518, %519) : (!llvm.ptr, i64) -> i64
      %521 = llvm.mlir.addressof @str41 : !llvm.ptr
      %522 = arith.constant 11 : i64
      %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
      %524 = func.call @cc_intern(%520, %523) : (i64, i64) -> i64
      %525 = func.call @cc_nil_value() : () -> i64
      %526 = func.call @cc_cons(%524, %525) : (i64, i64) -> i64
      %527 = func.call @cc_values_pack(%526) : (i64) -> i64
      %528 = func.call @cc_symbol_value(%524) : (i64) -> i64
      %529 = arith.constant 3 : i64
      %530 = func.call @cc_box_fixnum(%529) : (i64) -> i64
      %532 = arith.constant 3 : i64
      %531 = arith.andi %528, %532 : i64
      %533 = arith.constant 0 : i64
      %534 = arith.cmpi eq, %531, %533 : i64
      %536 = arith.constant 3 : i64
      %535 = arith.andi %530, %536 : i64
      %537 = arith.constant 0 : i64
      %538 = arith.cmpi eq, %535, %537 : i64
      %539 = arith.andi %534, %538 : i1
      %540 = scf.if %539 -> (i64) {
        %541 = arith.constant 2 : i64
        %542 = arith.shrsi %528, %541 : i64
        %543 = arith.constant 2 : i64
        %544 = arith.shrsi %530, %543 : i64
        %545 = arith.subi %542, %544 : i64
        %546 = arith.constant -2305843009213693952 : i64
        %547 = arith.constant 2305843009213693951 : i64
        %548 = arith.cmpi sge, %545, %546 : i64
        %549 = arith.cmpi sle, %545, %547 : i64
        %550 = arith.andi %548, %549 : i1
        %551 = scf.if %550 -> (i64) {
          %552 = arith.constant 2 : i64
          %553 = arith.shli %545, %552 : i64
          scf.yield %553 : i64
        } else {
          %554 = func.call @cc_sub(%528, %530) : (i64, i64) -> i64
          scf.yield %554 : i64
        }
        scf.yield %551 : i64
      } else {
        %555 = func.call @cc_sub(%528, %530) : (i64, i64) -> i64
        scf.yield %555 : i64
      }
      func.call @stack_push_pointer(%540) : (i64) -> ()
    }
    %556 = func.call @stack_pop_pointer() : () -> i64
    %557 = func.call @cc_multiple_value_list(%556) : (i64) -> i64
    %558 = llvm.mlir.addressof @str42 : !llvm.ptr
    %559 = arith.constant 38 : i64
    %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
    %561 = func.call @cc_nil_value() : () -> i64
    %562 = func.call @cc_intern(%560, %561) : (i64, i64) -> i64
    %563 = func.call @cc_nil_value() : () -> i64
    %564 = func.call @cc_cons(%562, %563) : (i64, i64) -> i64
    %565 = func.call @cc_values_pack(%564) : (i64) -> i64
    %566 = func.call @cc_symbol_value(%562) : (i64) -> i64
    %567 = llvm.mlir.addressof @str43 : !llvm.ptr
    %568 = arith.constant 40 : i64
    %569 = func.call @cc_make_string(%567, %568) : (!llvm.ptr, i64) -> i64
    %570 = func.call @cc_nil_value() : () -> i64
    %571 = func.call @cc_intern(%569, %570) : (i64, i64) -> i64
    %572 = func.call @cc_nil_value() : () -> i64
    %573 = func.call @cc_cons(%571, %572) : (i64, i64) -> i64
    %574 = func.call @cc_values_pack(%573) : (i64) -> i64
    %575 = func.call @cc_symbol_value(%571) : (i64) -> i64
    %576 = func.call @cc_nil_value() : () -> i64
    %577 = arith.cmpi ne, %566, %576 : i64
    %578 = scf.if %577 -> (i64) {
      scf.yield %575 : i64
    } else {
      scf.yield %557 : i64
    }
    %579 = func.call @cc_values_pack(%578) : (i64) -> i64
    func.call @stack_push_pointer(%579) : (i64) -> ()
    func.return
  }
  func.func @"%FN%foo-ext-3"() {
    %580 = llvm.mlir.addressof @str44 : !llvm.ptr
    %581 = arith.constant 9 : i64
    %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
    %583 = func.call @cc_nil_value() : () -> i64
    %584 = func.call @cc_intern(%582, %583) : (i64, i64) -> i64
    %585 = func.call @cc_nil_value() : () -> i64
    %586 = func.call @cc_cons(%584, %585) : (i64, i64) -> i64
    %587 = func.call @cc_values_pack(%586) : (i64) -> i64
    %588 = llvm.mlir.addressof @str45 : !llvm.ptr
    %589 = arith.constant 1 : i64
    %590 = func.call @cc_make_string(%588, %589) : (!llvm.ptr, i64) -> i64
    %591 = func.call @cc_register_function_lambda_list_metadata_raw(%584, %590) : (i64, i64) -> i64
    %592 = func.call @stack_pop_pointer() : () -> i64
    %593 = func.call @cc_nil_value() : () -> i64
    %594 = llvm.mlir.addressof @str46 : !llvm.ptr
    %595 = arith.constant 38 : i64
    %596 = func.call @cc_make_string(%594, %595) : (!llvm.ptr, i64) -> i64
    %597 = func.call @cc_nil_value() : () -> i64
    %598 = func.call @cc_intern(%596, %597) : (i64, i64) -> i64
    %599 = func.call @cc_nil_value() : () -> i64
    %600 = func.call @cc_cons(%598, %599) : (i64, i64) -> i64
    %601 = func.call @cc_values_pack(%600) : (i64) -> i64
    %602 = func.call @cc_set_symbol_value(%598, %593) : (i64, i64) -> i64
    %603 = llvm.mlir.addressof @str47 : !llvm.ptr
    %604 = arith.constant 39 : i64
    %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
    %606 = func.call @cc_nil_value() : () -> i64
    %607 = func.call @cc_intern(%605, %606) : (i64, i64) -> i64
    %608 = func.call @cc_nil_value() : () -> i64
    %609 = func.call @cc_cons(%607, %608) : (i64, i64) -> i64
    %610 = func.call @cc_values_pack(%609) : (i64) -> i64
    %611 = func.call @cc_set_symbol_value(%607, %593) : (i64, i64) -> i64
    %612 = llvm.mlir.addressof @str48 : !llvm.ptr
    %613 = arith.constant 40 : i64
    %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
    %615 = func.call @cc_nil_value() : () -> i64
    %616 = func.call @cc_intern(%614, %615) : (i64, i64) -> i64
    %617 = func.call @cc_nil_value() : () -> i64
    %618 = func.call @cc_cons(%616, %617) : (i64, i64) -> i64
    %619 = func.call @cc_values_pack(%618) : (i64) -> i64
    %620 = func.call @cc_set_symbol_value(%616, %593) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
    %621 = arith.addi %592, %__rlasp_stack_elide_zero_12 : i64
    %622 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%622) : (i64) -> ()
    %623 = func.call @stack_pop_pointer() : () -> i64
    %624 = func.call @cc_random(%623) : (i64) -> i64
    %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
    %625 = arith.addi %624, %__rlasp_stack_elide_zero_13 : i64
    %626 = arith.constant 1 : i1
    %628 = arith.constant 3 : i64
    %627 = arith.andi %621, %628 : i64
    %629 = arith.constant 0 : i64
    %630 = arith.cmpi eq, %627, %629 : i64
    %632 = arith.constant 3 : i64
    %631 = arith.andi %625, %632 : i64
    %633 = arith.constant 0 : i64
    %634 = arith.cmpi eq, %631, %633 : i64
    %635 = arith.andi %630, %634 : i1
    %636 = scf.if %635 -> (i1) {
      %637 = arith.constant 2 : i64
      %638 = arith.shrsi %621, %637 : i64
      %639 = arith.constant 2 : i64
      %640 = arith.shrsi %625, %639 : i64
      %641 = arith.cmpi sgt, %638, %640 : i64
      scf.yield %641 : i1
    } else {
      %642 = func.call @cc_gt(%621, %625) : (i64, i64) -> i64
      %643 = func.call @cc_nil_value() : () -> i64
      %644 = arith.cmpi ne, %642, %643 : i64
      scf.yield %644 : i1
    }
    %645 = arith.andi %626, %636 : i1
    %646 = func.call @cc_nil_value() : () -> i64
    %647 = func.call @cc_t_value() : () -> i64
    %648 = scf.if %645 -> (i64) {
      scf.yield %647 : i64
    } else {
      scf.yield %646 : i64
    }
    %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
    %649 = arith.addi %648, %__rlasp_stack_elide_zero_14 : i64
    %650 = func.call @cc_nil_value() : () -> i64
    %651 = arith.cmpi ne, %649, %650 : i64
    scf.if %651 {
      %652 = arith.constant 0.0 : f64
      %653 = func.call @cc_box_single_float(%652) : (f64) -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
    } else {
      %654 = arith.constant 0.0 : f64
      %655 = func.call @cc_box_single_float(%654) : (f64) -> i64
      func.call @stack_push_pointer(%655) : (i64) -> ()
    }
    %656 = func.call @stack_pop_pointer() : () -> i64
    %657 = func.call @cc_multiple_value_list(%656) : (i64) -> i64
    %658 = llvm.mlir.addressof @str49 : !llvm.ptr
    %659 = arith.constant 38 : i64
    %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
    %661 = func.call @cc_nil_value() : () -> i64
    %662 = func.call @cc_intern(%660, %661) : (i64, i64) -> i64
    %663 = func.call @cc_nil_value() : () -> i64
    %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
    %665 = func.call @cc_values_pack(%664) : (i64) -> i64
    %666 = func.call @cc_symbol_value(%662) : (i64) -> i64
    %667 = llvm.mlir.addressof @str50 : !llvm.ptr
    %668 = arith.constant 40 : i64
    %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
    %670 = func.call @cc_nil_value() : () -> i64
    %671 = func.call @cc_intern(%669, %670) : (i64, i64) -> i64
    %672 = func.call @cc_nil_value() : () -> i64
    %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
    %674 = func.call @cc_values_pack(%673) : (i64) -> i64
    %675 = func.call @cc_symbol_value(%671) : (i64) -> i64
    %676 = func.call @cc_nil_value() : () -> i64
    %677 = arith.cmpi ne, %666, %676 : i64
    %678 = scf.if %677 -> (i64) {
      scf.yield %675 : i64
    } else {
      scf.yield %657 : i64
    }
    %679 = func.call @cc_values_pack(%678) : (i64) -> i64
    func.call @stack_push_pointer(%679) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bar-ext-3"() {
    %680 = llvm.mlir.addressof @str51 : !llvm.ptr
    %681 = arith.constant 9 : i64
    %682 = func.call @cc_make_string(%680, %681) : (!llvm.ptr, i64) -> i64
    %683 = func.call @cc_nil_value() : () -> i64
    %684 = func.call @cc_intern(%682, %683) : (i64, i64) -> i64
    %685 = func.call @cc_nil_value() : () -> i64
    %686 = func.call @cc_cons(%684, %685) : (i64, i64) -> i64
    %687 = func.call @cc_values_pack(%686) : (i64) -> i64
    %688 = llvm.mlir.addressof @str52 : !llvm.ptr
    %689 = arith.constant 1 : i64
    %690 = func.call @cc_make_string(%688, %689) : (!llvm.ptr, i64) -> i64
    %691 = func.call @cc_register_function_lambda_list_metadata_raw(%684, %690) : (i64, i64) -> i64
    %692 = func.call @stack_pop_pointer() : () -> i64
    %693 = func.call @cc_nil_value() : () -> i64
    %694 = llvm.mlir.addressof @str53 : !llvm.ptr
    %695 = arith.constant 38 : i64
    %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
    %697 = func.call @cc_nil_value() : () -> i64
    %698 = func.call @cc_intern(%696, %697) : (i64, i64) -> i64
    %699 = func.call @cc_nil_value() : () -> i64
    %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
    %701 = func.call @cc_values_pack(%700) : (i64) -> i64
    %702 = func.call @cc_set_symbol_value(%698, %693) : (i64, i64) -> i64
    %703 = llvm.mlir.addressof @str54 : !llvm.ptr
    %704 = arith.constant 39 : i64
    %705 = func.call @cc_make_string(%703, %704) : (!llvm.ptr, i64) -> i64
    %706 = func.call @cc_nil_value() : () -> i64
    %707 = func.call @cc_intern(%705, %706) : (i64, i64) -> i64
    %708 = func.call @cc_nil_value() : () -> i64
    %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
    %710 = func.call @cc_values_pack(%709) : (i64) -> i64
    %711 = func.call @cc_set_symbol_value(%707, %693) : (i64, i64) -> i64
    %712 = llvm.mlir.addressof @str55 : !llvm.ptr
    %713 = arith.constant 40 : i64
    %714 = func.call @cc_make_string(%712, %713) : (!llvm.ptr, i64) -> i64
    %715 = func.call @cc_nil_value() : () -> i64
    %716 = func.call @cc_intern(%714, %715) : (i64, i64) -> i64
    %717 = func.call @cc_nil_value() : () -> i64
    %718 = func.call @cc_cons(%716, %717) : (i64, i64) -> i64
    %719 = func.call @cc_values_pack(%718) : (i64) -> i64
    %720 = func.call @cc_set_symbol_value(%716, %693) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
    %721 = arith.addi %692, %__rlasp_stack_elide_zero_15 : i64
    %722 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%722) : (i64) -> ()
    %723 = func.call @stack_pop_pointer() : () -> i64
    %724 = func.call @cc_random(%723) : (i64) -> i64
    %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
    %725 = arith.addi %724, %__rlasp_stack_elide_zero_16 : i64
    %726 = arith.constant 1 : i1
    %728 = arith.constant 3 : i64
    %727 = arith.andi %721, %728 : i64
    %729 = arith.constant 0 : i64
    %730 = arith.cmpi eq, %727, %729 : i64
    %732 = arith.constant 3 : i64
    %731 = arith.andi %725, %732 : i64
    %733 = arith.constant 0 : i64
    %734 = arith.cmpi eq, %731, %733 : i64
    %735 = arith.andi %730, %734 : i1
    %736 = scf.if %735 -> (i1) {
      %737 = arith.constant 2 : i64
      %738 = arith.shrsi %721, %737 : i64
      %739 = arith.constant 2 : i64
      %740 = arith.shrsi %725, %739 : i64
      %741 = arith.cmpi sgt, %738, %740 : i64
      scf.yield %741 : i1
    } else {
      %742 = func.call @cc_gt(%721, %725) : (i64, i64) -> i64
      %743 = func.call @cc_nil_value() : () -> i64
      %744 = arith.cmpi ne, %742, %743 : i64
      scf.yield %744 : i1
    }
    %745 = arith.andi %726, %736 : i1
    %746 = func.call @cc_nil_value() : () -> i64
    %747 = func.call @cc_t_value() : () -> i64
    %748 = scf.if %745 -> (i64) {
      scf.yield %747 : i64
    } else {
      scf.yield %746 : i64
    }
    %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
    %749 = arith.addi %748, %__rlasp_stack_elide_zero_17 : i64
    %750 = func.call @cc_nil_value() : () -> i64
    %751 = arith.cmpi ne, %749, %750 : i64
    scf.if %751 {
      %752 = arith.constant 0.0 : f64
      %753 = func.call @cc_box_single_float(%752) : (f64) -> i64
      func.call @stack_push_pointer(%753) : (i64) -> ()
    } else {
      %754 = arith.constant 0.0 : f64
      %755 = func.call @cc_box_single_float(%754) : (f64) -> i64
      func.call @stack_push_pointer(%755) : (i64) -> ()
    }
    %756 = func.call @stack_pop_pointer() : () -> i64
    %757 = func.call @cc_multiple_value_list(%756) : (i64) -> i64
    %758 = llvm.mlir.addressof @str56 : !llvm.ptr
    %759 = arith.constant 38 : i64
    %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
    %761 = func.call @cc_nil_value() : () -> i64
    %762 = func.call @cc_intern(%760, %761) : (i64, i64) -> i64
    %763 = func.call @cc_nil_value() : () -> i64
    %764 = func.call @cc_cons(%762, %763) : (i64, i64) -> i64
    %765 = func.call @cc_values_pack(%764) : (i64) -> i64
    %766 = func.call @cc_symbol_value(%762) : (i64) -> i64
    %767 = llvm.mlir.addressof @str57 : !llvm.ptr
    %768 = arith.constant 40 : i64
    %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
    %770 = func.call @cc_nil_value() : () -> i64
    %771 = func.call @cc_intern(%769, %770) : (i64, i64) -> i64
    %772 = func.call @cc_nil_value() : () -> i64
    %773 = func.call @cc_cons(%771, %772) : (i64, i64) -> i64
    %774 = func.call @cc_values_pack(%773) : (i64) -> i64
    %775 = func.call @cc_symbol_value(%771) : (i64) -> i64
    %776 = func.call @cc_nil_value() : () -> i64
    %777 = arith.cmpi ne, %766, %776 : i64
    %778 = scf.if %777 -> (i64) {
      scf.yield %775 : i64
    } else {
      scf.yield %757 : i64
    }
    %779 = func.call @cc_values_pack(%778) : (i64) -> i64
    func.call @stack_push_pointer(%779) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %780 = llvm.mlir.addressof @str58 : !llvm.ptr
    %781 = arith.constant 6 : i64
    %782 = func.call @cc_make_string(%780, %781) : (!llvm.ptr, i64) -> i64
    %783 = func.call @cc_nil_value() : () -> i64
    %784 = func.call @cc_intern(%782, %783) : (i64, i64) -> i64
    %785 = func.call @cc_nil_value() : () -> i64
    %786 = func.call @cc_cons(%784, %785) : (i64, i64) -> i64
    %787 = func.call @cc_values_pack(%786) : (i64) -> i64
    %788 = func.call @cc_nil_value() : () -> i64
    %789 = llvm.mlir.addressof @str59 : !llvm.ptr
    %790 = arith.constant 38 : i64
    %791 = func.call @cc_make_string(%789, %790) : (!llvm.ptr, i64) -> i64
    %792 = func.call @cc_nil_value() : () -> i64
    %793 = func.call @cc_intern(%791, %792) : (i64, i64) -> i64
    %794 = func.call @cc_nil_value() : () -> i64
    %795 = func.call @cc_cons(%793, %794) : (i64, i64) -> i64
    %796 = func.call @cc_values_pack(%795) : (i64) -> i64
    %797 = func.call @cc_set_symbol_value(%793, %788) : (i64, i64) -> i64
    %798 = llvm.mlir.addressof @str60 : !llvm.ptr
    %799 = arith.constant 39 : i64
    %800 = func.call @cc_make_string(%798, %799) : (!llvm.ptr, i64) -> i64
    %801 = func.call @cc_nil_value() : () -> i64
    %802 = func.call @cc_intern(%800, %801) : (i64, i64) -> i64
    %803 = func.call @cc_nil_value() : () -> i64
    %804 = func.call @cc_cons(%802, %803) : (i64, i64) -> i64
    %805 = func.call @cc_values_pack(%804) : (i64) -> i64
    %806 = func.call @cc_set_symbol_value(%802, %788) : (i64, i64) -> i64
    %807 = llvm.mlir.addressof @str61 : !llvm.ptr
    %808 = arith.constant 40 : i64
    %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
    %810 = func.call @cc_nil_value() : () -> i64
    %811 = func.call @cc_intern(%809, %810) : (i64, i64) -> i64
    %812 = func.call @cc_nil_value() : () -> i64
    %813 = func.call @cc_cons(%811, %812) : (i64, i64) -> i64
    %814 = func.call @cc_values_pack(%813) : (i64) -> i64
    %815 = func.call @cc_set_symbol_value(%811, %788) : (i64, i64) -> i64
    %816 = func.call @cc_nil_value() : () -> i64
    %817 = func.call @cc_nil_value() : () -> i64
    %818 = func.call @cc_errorp(%816) : (i64) -> i64
    %819 = arith.cmpi ne, %818, %817 : i64
    %820 = scf.if %819 -> (i64) {
      scf.yield %816 : i64
    } else {
      %821 = llvm.mlir.addressof @str62 : !llvm.ptr
      %822 = arith.constant 11 : i64
      %823 = func.call @cc_make_string(%821, %822) : (!llvm.ptr, i64) -> i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_intern(%823, %824) : (i64, i64) -> i64
      %826 = func.call @cc_nil_value() : () -> i64
      %827 = func.call @cc_cons(%825, %826) : (i64, i64) -> i64
      %828 = func.call @cc_values_pack(%827) : (i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %829 = arith.addi %825, %__rlasp_stack_elide_zero_18 : i64
      %830 = func.call @cc_in_package(%829) : (i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %831 = arith.addi %830, %__rlasp_stack_elide_zero_19 : i64
      scf.yield %831 : i64
    }
    %832 = func.call @cc_nil_value() : () -> i64
    %833 = func.call @cc_errorp(%820) : (i64) -> i64
    %834 = arith.cmpi ne, %833, %832 : i64
    %835 = scf.if %834 -> (i64) {
      scf.yield %820 : i64
    } else {
      %836 = llvm.mlir.addressof @str63 : !llvm.ptr
      %837 = arith.constant 17 : i64
      %838 = func.call @cc_make_string(%836, %837) : (!llvm.ptr, i64) -> i64
      %839 = func.call @cc_nil_value() : () -> i64
      %840 = func.call @cc_intern(%838, %839) : (i64, i64) -> i64
      %841 = func.call @cc_nil_value() : () -> i64
      %842 = func.call @cc_cons(%840, %841) : (i64, i64) -> i64
      %843 = func.call @cc_values_pack(%842) : (i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %844 = arith.addi %840, %__rlasp_stack_elide_zero_20 : i64
      %845 = llvm.mlir.addressof @str64 : !llvm.ptr
      %846 = arith.constant 3 : i64
      %847 = func.call @cc_make_string(%845, %846) : (!llvm.ptr, i64) -> i64
      %848 = func.call @cc_nil_value() : () -> i64
      %849 = func.call @cc_intern(%847, %848) : (i64, i64) -> i64
      %850 = func.call @cc_nil_value() : () -> i64
      %851 = func.call @cc_cons(%849, %850) : (i64, i64) -> i64
      %852 = func.call @cc_values_pack(%851) : (i64) -> i64
      func.call @stack_push_pointer(%849) : (i64) -> ()
      %853 = llvm.mlir.addressof @str65 : !llvm.ptr
      %854 = arith.constant 3 : i64
      %855 = func.call @cc_make_string(%853, %854) : (!llvm.ptr, i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = func.call @cc_intern(%855, %856) : (i64, i64) -> i64
      %858 = func.call @cc_nil_value() : () -> i64
      %859 = func.call @cc_cons(%857, %858) : (i64, i64) -> i64
      %860 = func.call @cc_values_pack(%859) : (i64) -> i64
      func.call @stack_push_pointer(%857) : (i64) -> ()
      %861 = llvm.mlir.addressof @str66 : !llvm.ptr
      %862 = arith.constant 16 : i64
      %863 = func.call @cc_make_string(%861, %862) : (!llvm.ptr, i64) -> i64
      %864 = llvm.mlir.addressof @str67 : !llvm.ptr
      %865 = arith.constant 3 : i64
      %866 = func.call @cc_make_string(%864, %865) : (!llvm.ptr, i64) -> i64
      %867 = func.call @cc_intern(%863, %866) : (i64, i64) -> i64
      %868 = func.call @cc_nil_value() : () -> i64
      %869 = func.call @cc_cons(%867, %868) : (i64, i64) -> i64
      %870 = func.call @cc_values_pack(%869) : (i64) -> i64
      func.call @stack_push_pointer(%867) : (i64) -> ()
      %871 = llvm.mlir.addressof @str68 : !llvm.ptr
      %872 = arith.constant 4 : i64
      %873 = func.call @cc_make_string(%871, %872) : (!llvm.ptr, i64) -> i64
      %874 = llvm.mlir.addressof @str69 : !llvm.ptr
      %875 = arith.constant 11 : i64
      %876 = func.call @cc_make_string(%874, %875) : (!llvm.ptr, i64) -> i64
      %877 = func.call @cc_intern(%873, %876) : (i64, i64) -> i64
      %878 = func.call @cc_nil_value() : () -> i64
      %879 = func.call @cc_cons(%877, %878) : (i64, i64) -> i64
      %880 = func.call @cc_values_pack(%879) : (i64) -> i64
      func.call @stack_push_pointer(%877) : (i64) -> ()
      %881 = llvm.mlir.addressof @str70 : !llvm.ptr
      %882 = arith.constant 3 : i64
      %883 = func.call @cc_make_string(%881, %882) : (!llvm.ptr, i64) -> i64
      %884 = func.call @cc_nil_value() : () -> i64
      %885 = func.call @cc_intern(%883, %884) : (i64, i64) -> i64
      %886 = func.call @cc_nil_value() : () -> i64
      %887 = func.call @cc_cons(%885, %886) : (i64, i64) -> i64
      %888 = func.call @cc_values_pack(%887) : (i64) -> i64
      func.call @stack_push_pointer(%885) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %889 = llvm.mlir.addressof @str71 : !llvm.ptr
      %890 = arith.constant 2 : i64
      %891 = func.call @cc_make_string(%889, %890) : (!llvm.ptr, i64) -> i64
      %892 = func.call @cc_nil_value() : () -> i64
      %893 = func.call @cc_intern(%891, %892) : (i64, i64) -> i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = func.call @cc_cons(%893, %894) : (i64, i64) -> i64
      %896 = func.call @cc_values_pack(%895) : (i64) -> i64
      func.call @stack_push_pointer(%893) : (i64) -> ()
      %897 = llvm.mlir.addressof @str72 : !llvm.ptr
      %898 = arith.constant 1 : i64
      %899 = func.call @cc_make_string(%897, %898) : (!llvm.ptr, i64) -> i64
      %900 = llvm.mlir.addressof @str73 : !llvm.ptr
      %901 = arith.constant 11 : i64
      %902 = func.call @cc_make_string(%900, %901) : (!llvm.ptr, i64) -> i64
      %903 = func.call @cc_intern(%899, %902) : (i64, i64) -> i64
      %904 = func.call @cc_nil_value() : () -> i64
      %905 = func.call @cc_cons(%903, %904) : (i64, i64) -> i64
      %906 = func.call @cc_values_pack(%905) : (i64) -> i64
      func.call @stack_push_pointer(%903) : (i64) -> ()
      %907 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%907) : (i64) -> ()
      %908 = llvm.mlir.addressof @str74 : !llvm.ptr
      %909 = arith.constant 6 : i64
      %910 = func.call @cc_make_string(%908, %909) : (!llvm.ptr, i64) -> i64
      %911 = llvm.mlir.addressof @str75 : !llvm.ptr
      %912 = arith.constant 11 : i64
      %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
      %914 = func.call @cc_intern(%910, %913) : (i64, i64) -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      %917 = func.call @cc_values_pack(%916) : (i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %918 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%918) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %919 = func.call @stack_pop_pointer() : () -> i64
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = func.call @cc_cons(%920, %919) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %922 = arith.addi %921, %__rlasp_stack_elide_zero_21 : i64
      %923 = func.call @stack_pop_pointer() : () -> i64
      %924 = func.call @cc_cons(%923, %922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%924) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %925 = func.call @stack_pop_pointer() : () -> i64
      %926 = func.call @stack_pop_pointer() : () -> i64
      %927 = func.call @cc_cons(%926, %925) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %928 = arith.addi %927, %__rlasp_stack_elide_zero_22 : i64
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = func.call @cc_cons(%929, %928) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %931 = arith.addi %930, %__rlasp_stack_elide_zero_23 : i64
      %932 = func.call @stack_pop_pointer() : () -> i64
      %933 = func.call @cc_cons(%932, %931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%933) : (i64) -> ()
      %934 = arith.constant 0.0 : f64
      %935 = func.call @cc_box_single_float(%934) : (f64) -> i64
      func.call @stack_push_pointer(%935) : (i64) -> ()
      %936 = arith.constant 0.0 : f64
      %937 = func.call @cc_box_single_float(%936) : (f64) -> i64
      func.call @stack_push_pointer(%937) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %938 = func.call @stack_pop_pointer() : () -> i64
      %939 = func.call @stack_pop_pointer() : () -> i64
      %940 = func.call @cc_cons(%939, %938) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %941 = arith.addi %940, %__rlasp_stack_elide_zero_24 : i64
      %942 = func.call @stack_pop_pointer() : () -> i64
      %943 = func.call @cc_cons(%942, %941) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %944 = arith.addi %943, %__rlasp_stack_elide_zero_25 : i64
      %945 = func.call @stack_pop_pointer() : () -> i64
      %946 = func.call @cc_cons(%945, %944) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %947 = arith.addi %946, %__rlasp_stack_elide_zero_26 : i64
      %948 = func.call @stack_pop_pointer() : () -> i64
      %949 = func.call @cc_cons(%948, %947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %950 = func.call @stack_pop_pointer() : () -> i64
      %951 = func.call @stack_pop_pointer() : () -> i64
      %952 = func.call @cc_cons(%951, %950) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %953 = arith.addi %952, %__rlasp_stack_elide_zero_27 : i64
      %954 = func.call @stack_pop_pointer() : () -> i64
      %955 = func.call @cc_cons(%954, %953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %956 = arith.addi %955, %__rlasp_stack_elide_zero_28 : i64
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @cc_cons(%957, %956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%958) : (i64) -> ()
      %959 = llvm.mlir.addressof @str76 : !llvm.ptr
      %960 = arith.constant 3 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = func.call @cc_nil_value() : () -> i64
      %963 = func.call @cc_intern(%961, %962) : (i64, i64) -> i64
      %964 = func.call @cc_nil_value() : () -> i64
      %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
      %966 = func.call @cc_values_pack(%965) : (i64) -> i64
      func.call @stack_push_pointer(%963) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %967 = llvm.mlir.addressof @str77 : !llvm.ptr
      %968 = arith.constant 2 : i64
      %969 = func.call @cc_make_string(%967, %968) : (!llvm.ptr, i64) -> i64
      %970 = func.call @cc_nil_value() : () -> i64
      %971 = func.call @cc_intern(%969, %970) : (i64, i64) -> i64
      %972 = func.call @cc_nil_value() : () -> i64
      %973 = func.call @cc_cons(%971, %972) : (i64, i64) -> i64
      %974 = func.call @cc_values_pack(%973) : (i64) -> i64
      func.call @stack_push_pointer(%971) : (i64) -> ()
      %975 = llvm.mlir.addressof @str78 : !llvm.ptr
      %976 = arith.constant 1 : i64
      %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
      %978 = llvm.mlir.addressof @str79 : !llvm.ptr
      %979 = arith.constant 11 : i64
      %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
      %981 = func.call @cc_intern(%977, %980) : (i64, i64) -> i64
      %982 = func.call @cc_nil_value() : () -> i64
      %983 = func.call @cc_cons(%981, %982) : (i64, i64) -> i64
      %984 = func.call @cc_values_pack(%983) : (i64) -> i64
      func.call @stack_push_pointer(%981) : (i64) -> ()
      %985 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%985) : (i64) -> ()
      %986 = llvm.mlir.addressof @str80 : !llvm.ptr
      %987 = arith.constant 6 : i64
      %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
      %989 = llvm.mlir.addressof @str81 : !llvm.ptr
      %990 = arith.constant 11 : i64
      %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
      %992 = func.call @cc_intern(%988, %991) : (i64, i64) -> i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_cons(%992, %993) : (i64, i64) -> i64
      %995 = func.call @cc_values_pack(%994) : (i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %996 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%996) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %997 = func.call @stack_pop_pointer() : () -> i64
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = func.call @cc_cons(%998, %997) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %1000 = arith.addi %999, %__rlasp_stack_elide_zero_29 : i64
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @cc_cons(%1001, %1000) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1003 = func.call @stack_pop_pointer() : () -> i64
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = func.call @cc_cons(%1004, %1003) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %1006 = arith.addi %1005, %__rlasp_stack_elide_zero_30 : i64
      %1007 = func.call @stack_pop_pointer() : () -> i64
      %1008 = func.call @cc_cons(%1007, %1006) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %1009 = arith.addi %1008, %__rlasp_stack_elide_zero_31 : i64
      %1010 = func.call @stack_pop_pointer() : () -> i64
      %1011 = func.call @cc_cons(%1010, %1009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1011) : (i64) -> ()
      %1012 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1012) : (i64) -> ()
      %1013 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%1013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @stack_pop_pointer() : () -> i64
      %1016 = func.call @cc_cons(%1015, %1014) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %1017 = arith.addi %1016, %__rlasp_stack_elide_zero_32 : i64
      %1018 = func.call @stack_pop_pointer() : () -> i64
      %1019 = func.call @cc_cons(%1018, %1017) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %1020 = arith.addi %1019, %__rlasp_stack_elide_zero_33 : i64
      %1021 = func.call @stack_pop_pointer() : () -> i64
      %1022 = func.call @cc_cons(%1021, %1020) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %1023 = arith.addi %1022, %__rlasp_stack_elide_zero_34 : i64
      %1024 = func.call @stack_pop_pointer() : () -> i64
      %1025 = func.call @cc_cons(%1024, %1023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @cc_cons(%1027, %1026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %1029 = arith.addi %1028, %__rlasp_stack_elide_zero_35 : i64
      %1030 = func.call @stack_pop_pointer() : () -> i64
      %1031 = func.call @cc_cons(%1030, %1029) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %1032 = arith.addi %1031, %__rlasp_stack_elide_zero_36 : i64
      %1033 = func.call @stack_pop_pointer() : () -> i64
      %1034 = func.call @cc_cons(%1033, %1032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @cc_cons(%1036, %1035) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %1038 = arith.addi %1037, %__rlasp_stack_elide_zero_37 : i64
      %1039 = func.call @stack_pop_pointer() : () -> i64
      %1040 = func.call @cc_cons(%1039, %1038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1040) : (i64) -> ()
      %1041 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1042 = arith.constant 23 : i64
      %1043 = func.call @cc_make_string(%1041, %1042) : (!llvm.ptr, i64) -> i64
      %1044 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1045 = arith.constant 3 : i64
      %1046 = func.call @cc_make_string(%1044, %1045) : (!llvm.ptr, i64) -> i64
      %1047 = func.call @cc_intern(%1043, %1046) : (i64, i64) -> i64
      %1048 = func.call @cc_nil_value() : () -> i64
      %1049 = func.call @cc_cons(%1047, %1048) : (i64, i64) -> i64
      %1050 = func.call @cc_values_pack(%1049) : (i64) -> i64
      func.call @stack_push_pointer(%1047) : (i64) -> ()
      %1051 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1052 = arith.constant 14 : i64
      %1053 = func.call @cc_make_string(%1051, %1052) : (!llvm.ptr, i64) -> i64
      %1054 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1055 = arith.constant 7 : i64
      %1056 = func.call @cc_make_string(%1054, %1055) : (!llvm.ptr, i64) -> i64
      %1057 = func.call @cc_intern(%1053, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_nil_value() : () -> i64
      %1059 = func.call @cc_cons(%1057, %1058) : (i64, i64) -> i64
      %1060 = func.call @cc_values_pack(%1059) : (i64) -> i64
      func.call @stack_push_pointer(%1057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @cc_cons(%1062, %1061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1064 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1065 = arith.constant 1 : i64
      %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
      %1067 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1068 = arith.constant 11 : i64
      %1069 = func.call @cc_make_string(%1067, %1068) : (!llvm.ptr, i64) -> i64
      %1070 = func.call @cc_intern(%1066, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_values_pack(%1072) : (i64) -> i64
      func.call @stack_push_pointer(%1070) : (i64) -> ()
      %1074 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1075 = arith.constant 3 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      %1077 = func.call @cc_nil_value() : () -> i64
      %1078 = func.call @cc_intern(%1076, %1077) : (i64, i64) -> i64
      %1079 = func.call @cc_nil_value() : () -> i64
      %1080 = func.call @cc_cons(%1078, %1079) : (i64, i64) -> i64
      %1081 = func.call @cc_values_pack(%1080) : (i64) -> i64
      func.call @stack_push_pointer(%1078) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1082 = func.call @stack_pop_pointer() : () -> i64
      %1083 = func.call @stack_pop_pointer() : () -> i64
      %1084 = func.call @cc_cons(%1083, %1082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1084) : (i64) -> ()
      %1085 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1086 = arith.constant 3 : i64
      %1087 = func.call @cc_make_string(%1085, %1086) : (!llvm.ptr, i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_intern(%1087, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_nil_value() : () -> i64
      %1091 = func.call @cc_cons(%1089, %1090) : (i64, i64) -> i64
      %1092 = func.call @cc_values_pack(%1091) : (i64) -> i64
      func.call @stack_push_pointer(%1089) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @cc_cons(%1094, %1093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1095) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1096 = func.call @stack_pop_pointer() : () -> i64
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @cc_cons(%1097, %1096) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %1099 = arith.addi %1098, %__rlasp_stack_elide_zero_38 : i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_cons(%1100, %1099) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %1102 = arith.addi %1101, %__rlasp_stack_elide_zero_39 : i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1103, %1102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1105 = func.call @stack_pop_pointer() : () -> i64
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @cc_cons(%1106, %1105) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %1108 = arith.addi %1107, %__rlasp_stack_elide_zero_40 : i64
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = func.call @cc_cons(%1109, %1108) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %1111 = arith.addi %1110, %__rlasp_stack_elide_zero_41 : i64
      %1112 = func.call @stack_pop_pointer() : () -> i64
      %1113 = func.call @cc_cons(%1112, %1111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1114 = func.call @stack_pop_pointer() : () -> i64
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1116 = func.call @cc_cons(%1115, %1114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %1117 = arith.addi %1116, %__rlasp_stack_elide_zero_42 : i64
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_cons(%1118, %1117) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %1120 = arith.addi %1119, %__rlasp_stack_elide_zero_43 : i64
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @cc_cons(%1121, %1120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1123 = func.call @stack_pop_pointer() : () -> i64
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @cc_cons(%1124, %1123) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %1126 = arith.addi %1125, %__rlasp_stack_elide_zero_44 : i64
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_cons(%1127, %1126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1129 = func.call @stack_pop_pointer() : () -> i64
      %1130 = func.call @stack_pop_pointer() : () -> i64
      %1131 = func.call @cc_cons(%1130, %1129) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1132 = arith.addi %1131, %__rlasp_stack_elide_zero_45 : i64
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @cc_cons(%1133, %1132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1134) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1135 = func.call @stack_pop_pointer() : () -> i64
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @cc_cons(%1136, %1135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1138 = arith.addi %1137, %__rlasp_stack_elide_zero_46 : i64
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @cc_cons(%1139, %1138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1141 = arith.addi %1140, %__rlasp_stack_elide_zero_47 : i64
      %1379 = arith.constant 152926823645191 : i64
      %1380 = arith.constant 0 : i64
      %1381 = func.call @cc_make_closure(%1379, %1380) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1382 = arith.addi %1381, %__rlasp_stack_elide_zero_48 : i64
      %1383 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1384 = arith.constant 1 : i64
      %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
      %1386 = func.call @cc_nil_value() : () -> i64
      %1387 = func.call @cc_intern(%1385, %1386) : (i64, i64) -> i64
      %1388 = func.call @cc_nil_value() : () -> i64
      %1389 = func.call @cc_cons(%1387, %1388) : (i64, i64) -> i64
      %1390 = func.call @cc_values_pack(%1389) : (i64) -> i64
      func.call @stack_push_pointer(%1387) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @cc_cons(%1392, %1391) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1394 = arith.addi %1393, %__rlasp_stack_elide_zero_49 : i64
      %1395 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1396 = arith.constant 11 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      %1398 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1399 = arith.constant 7 : i64
      %1400 = func.call @cc_make_string(%1398, %1399) : (!llvm.ptr, i64) -> i64
      %1401 = func.call @cc_intern(%1397, %1400) : (i64, i64) -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_cons(%1401, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_values_pack(%1403) : (i64) -> i64
      %1405 = func.call @cc_nil_value() : () -> i64
      %1406 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1407 = arith.constant 4 : i64
      %1408 = func.call @cc_make_string(%1406, %1407) : (!llvm.ptr, i64) -> i64
      %1409 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1410 = arith.constant 7 : i64
      %1411 = func.call @cc_make_string(%1409, %1410) : (!llvm.ptr, i64) -> i64
      %1412 = func.call @cc_intern(%1408, %1411) : (i64, i64) -> i64
      %1413 = func.call @cc_nil_value() : () -> i64
      %1414 = func.call @cc_cons(%1412, %1413) : (i64, i64) -> i64
      %1415 = func.call @cc_values_pack(%1414) : (i64) -> i64
      %1416 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1417 = arith.constant 6 : i64
      %1418 = func.call @cc_make_string(%1416, %1417) : (!llvm.ptr, i64) -> i64
      %1419 = func.call @cc_nil_value() : () -> i64
      %1420 = func.call @cc_intern(%1418, %1419) : (i64, i64) -> i64
      %1421 = func.call @cc_nil_value() : () -> i64
      %1422 = func.call @cc_cons(%1420, %1421) : (i64, i64) -> i64
      %1423 = func.call @cc_values_pack(%1422) : (i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1424 = arith.addi %1420, %__rlasp_stack_elide_zero_50 : i64
      %1425 = func.call @cc_nil_value() : () -> i64
      %1426 = func.call @cc_errorp(%844) : (i64) -> i64
      %1427 = arith.cmpi ne, %1426, %1425 : i64
      %1428 = arith.cmpi eq, %1425, %1425 : i64
      %1429 = arith.andi %1427, %1428 : i1
      %1430 = scf.if %1429 -> (i64) {
        scf.yield %844 : i64
      } else {
        scf.yield %1425 : i64
      }
      %1431 = func.call @cc_errorp(%1141) : (i64) -> i64
      %1432 = arith.cmpi ne, %1431, %1425 : i64
      %1433 = arith.cmpi eq, %1430, %1425 : i64
      %1434 = arith.andi %1432, %1433 : i1
      %1435 = scf.if %1434 -> (i64) {
        scf.yield %1141 : i64
      } else {
        scf.yield %1430 : i64
      }
      %1436 = func.call @cc_errorp(%1382) : (i64) -> i64
      %1437 = arith.cmpi ne, %1436, %1425 : i64
      %1438 = arith.cmpi eq, %1435, %1425 : i64
      %1439 = arith.andi %1437, %1438 : i1
      %1440 = scf.if %1439 -> (i64) {
        scf.yield %1382 : i64
      } else {
        scf.yield %1435 : i64
      }
      %1441 = func.call @cc_errorp(%1394) : (i64) -> i64
      %1442 = arith.cmpi ne, %1441, %1425 : i64
      %1443 = arith.cmpi eq, %1440, %1425 : i64
      %1444 = arith.andi %1442, %1443 : i1
      %1445 = scf.if %1444 -> (i64) {
        scf.yield %1394 : i64
      } else {
        scf.yield %1440 : i64
      }
      %1446 = func.call @cc_errorp(%1401) : (i64) -> i64
      %1447 = arith.cmpi ne, %1446, %1425 : i64
      %1448 = arith.cmpi eq, %1445, %1425 : i64
      %1449 = arith.andi %1447, %1448 : i1
      %1450 = scf.if %1449 -> (i64) {
        scf.yield %1401 : i64
      } else {
        scf.yield %1445 : i64
      }
      %1451 = func.call @cc_errorp(%1405) : (i64) -> i64
      %1452 = arith.cmpi ne, %1451, %1425 : i64
      %1453 = arith.cmpi eq, %1450, %1425 : i64
      %1454 = arith.andi %1452, %1453 : i1
      %1455 = scf.if %1454 -> (i64) {
        scf.yield %1405 : i64
      } else {
        scf.yield %1450 : i64
      }
      %1456 = func.call @cc_errorp(%1412) : (i64) -> i64
      %1457 = arith.cmpi ne, %1456, %1425 : i64
      %1458 = arith.cmpi eq, %1455, %1425 : i64
      %1459 = arith.andi %1457, %1458 : i1
      %1460 = scf.if %1459 -> (i64) {
        scf.yield %1412 : i64
      } else {
        scf.yield %1455 : i64
      }
      %1461 = func.call @cc_errorp(%1424) : (i64) -> i64
      %1462 = arith.cmpi ne, %1461, %1425 : i64
      %1463 = arith.cmpi eq, %1460, %1425 : i64
      %1464 = arith.andi %1462, %1463 : i1
      %1465 = scf.if %1464 -> (i64) {
        scf.yield %1424 : i64
      } else {
        scf.yield %1460 : i64
      }
      %1466 = arith.cmpi ne, %1465, %1425 : i64
      scf.if %1466 {
        func.call @stack_push_pointer(%1465) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%844) : (i64) -> ()
        func.call @stack_push_pointer(%1141) : (i64) -> ()
        func.call @stack_push_pointer(%1382) : (i64) -> ()
        func.call @stack_push_pointer(%1394) : (i64) -> ()
        func.call @stack_push_pointer(%1401) : (i64) -> ()
        func.call @stack_push_pointer(%1405) : (i64) -> ()
        func.call @stack_push_pointer(%1412) : (i64) -> ()
        func.call @stack_push_pointer(%1424) : (i64) -> ()
        %1467 = llvm.mlir.addressof @str111 : !llvm.ptr
        %1468 = func.call @cc_make_function_ref_const(%1467) : (!llvm.ptr) -> i64
        %1469 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1468, %1469) : (i64, i64) -> ()
      }
      %1470 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1470 : i64
    }
    %1471 = func.call @cc_nil_value() : () -> i64
    %1472 = func.call @cc_errorp(%835) : (i64) -> i64
    %1473 = arith.cmpi ne, %1472, %1471 : i64
    %1474 = scf.if %1473 -> (i64) {
      scf.yield %835 : i64
    } else {
      %1475 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1476 = arith.constant 17 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = func.call @cc_nil_value() : () -> i64
      %1479 = func.call @cc_intern(%1477, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_nil_value() : () -> i64
      %1481 = func.call @cc_cons(%1479, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_values_pack(%1481) : (i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1483 = arith.addi %1479, %__rlasp_stack_elide_zero_51 : i64
      %1484 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1485 = arith.constant 13 : i64
      %1486 = func.call @cc_make_string(%1484, %1485) : (!llvm.ptr, i64) -> i64
      %1487 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1488 = arith.constant 11 : i64
      %1489 = func.call @cc_make_string(%1487, %1488) : (!llvm.ptr, i64) -> i64
      %1490 = func.call @cc_intern(%1486, %1489) : (i64, i64) -> i64
      %1491 = func.call @cc_nil_value() : () -> i64
      %1492 = func.call @cc_cons(%1490, %1491) : (i64, i64) -> i64
      %1493 = func.call @cc_values_pack(%1492) : (i64) -> i64
      func.call @stack_push_pointer(%1490) : (i64) -> ()
      %1494 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1495 = arith.constant 6 : i64
      %1496 = func.call @cc_make_string(%1494, %1495) : (!llvm.ptr, i64) -> i64
      %1497 = func.call @cc_nil_value() : () -> i64
      %1498 = func.call @cc_intern(%1496, %1497) : (i64, i64) -> i64
      %1499 = func.call @cc_nil_value() : () -> i64
      %1500 = func.call @cc_cons(%1498, %1499) : (i64, i64) -> i64
      %1501 = func.call @cc_values_pack(%1500) : (i64) -> i64
      func.call @stack_push_pointer(%1498) : (i64) -> ()
      %1502 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1503 = arith.constant 19 : i64
      %1504 = func.call @cc_make_string(%1502, %1503) : (!llvm.ptr, i64) -> i64
      %1505 = func.call @cc_nil_value() : () -> i64
      %1506 = func.call @cc_intern(%1504, %1505) : (i64, i64) -> i64
      %1507 = func.call @cc_nil_value() : () -> i64
      %1508 = func.call @cc_cons(%1506, %1507) : (i64, i64) -> i64
      %1509 = func.call @cc_values_pack(%1508) : (i64) -> i64
      func.call @stack_push_pointer(%1506) : (i64) -> ()
      %1510 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1511 = arith.constant 4 : i64
      %1512 = func.call @cc_make_string(%1510, %1511) : (!llvm.ptr, i64) -> i64
      %1513 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1514 = arith.constant 11 : i64
      %1515 = func.call @cc_make_string(%1513, %1514) : (!llvm.ptr, i64) -> i64
      %1516 = func.call @cc_intern(%1512, %1515) : (i64, i64) -> i64
      %1517 = func.call @cc_nil_value() : () -> i64
      %1518 = func.call @cc_cons(%1516, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_values_pack(%1518) : (i64) -> i64
      func.call @stack_push_pointer(%1516) : (i64) -> ()
      %1520 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1521 = arith.constant 3 : i64
      %1522 = func.call @cc_make_string(%1520, %1521) : (!llvm.ptr, i64) -> i64
      %1523 = func.call @cc_nil_value() : () -> i64
      %1524 = func.call @cc_intern(%1522, %1523) : (i64, i64) -> i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = func.call @cc_cons(%1524, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_values_pack(%1526) : (i64) -> i64
      func.call @stack_push_pointer(%1524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1528 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1529 = arith.constant 2 : i64
      %1530 = func.call @cc_make_string(%1528, %1529) : (!llvm.ptr, i64) -> i64
      %1531 = func.call @cc_nil_value() : () -> i64
      %1532 = func.call @cc_intern(%1530, %1531) : (i64, i64) -> i64
      %1533 = func.call @cc_nil_value() : () -> i64
      %1534 = func.call @cc_cons(%1532, %1533) : (i64, i64) -> i64
      %1535 = func.call @cc_values_pack(%1534) : (i64) -> i64
      func.call @stack_push_pointer(%1532) : (i64) -> ()
      %1536 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1537 = arith.constant 1 : i64
      %1538 = func.call @cc_make_string(%1536, %1537) : (!llvm.ptr, i64) -> i64
      %1539 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1540 = arith.constant 11 : i64
      %1541 = func.call @cc_make_string(%1539, %1540) : (!llvm.ptr, i64) -> i64
      %1542 = func.call @cc_intern(%1538, %1541) : (i64, i64) -> i64
      %1543 = func.call @cc_nil_value() : () -> i64
      %1544 = func.call @cc_cons(%1542, %1543) : (i64, i64) -> i64
      %1545 = func.call @cc_values_pack(%1544) : (i64) -> i64
      func.call @stack_push_pointer(%1542) : (i64) -> ()
      %1546 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1546) : (i64) -> ()
      %1547 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1548 = arith.constant 6 : i64
      %1549 = func.call @cc_make_string(%1547, %1548) : (!llvm.ptr, i64) -> i64
      %1550 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1551 = arith.constant 11 : i64
      %1552 = func.call @cc_make_string(%1550, %1551) : (!llvm.ptr, i64) -> i64
      %1553 = func.call @cc_intern(%1549, %1552) : (i64, i64) -> i64
      %1554 = func.call @cc_nil_value() : () -> i64
      %1555 = func.call @cc_cons(%1553, %1554) : (i64, i64) -> i64
      %1556 = func.call @cc_values_pack(%1555) : (i64) -> i64
      func.call @stack_push_pointer(%1553) : (i64) -> ()
      %1557 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%1557) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1558 = func.call @stack_pop_pointer() : () -> i64
      %1559 = func.call @stack_pop_pointer() : () -> i64
      %1560 = func.call @cc_cons(%1559, %1558) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1561 = arith.addi %1560, %__rlasp_stack_elide_zero_52 : i64
      %1562 = func.call @stack_pop_pointer() : () -> i64
      %1563 = func.call @cc_cons(%1562, %1561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1564 = func.call @stack_pop_pointer() : () -> i64
      %1565 = func.call @stack_pop_pointer() : () -> i64
      %1566 = func.call @cc_cons(%1565, %1564) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1567 = arith.addi %1566, %__rlasp_stack_elide_zero_53 : i64
      %1568 = func.call @stack_pop_pointer() : () -> i64
      %1569 = func.call @cc_cons(%1568, %1567) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1570 = arith.addi %1569, %__rlasp_stack_elide_zero_54 : i64
      %1571 = func.call @stack_pop_pointer() : () -> i64
      %1572 = func.call @cc_cons(%1571, %1570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1572) : (i64) -> ()
      %1573 = arith.constant 0.0 : f64
      %1574 = func.call @cc_box_single_float(%1573) : (f64) -> i64
      func.call @stack_push_pointer(%1574) : (i64) -> ()
      %1575 = arith.constant 0.0 : f64
      %1576 = func.call @cc_box_single_float(%1575) : (f64) -> i64
      func.call @stack_push_pointer(%1576) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1577 = func.call @stack_pop_pointer() : () -> i64
      %1578 = func.call @stack_pop_pointer() : () -> i64
      %1579 = func.call @cc_cons(%1578, %1577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1580 = arith.addi %1579, %__rlasp_stack_elide_zero_55 : i64
      %1581 = func.call @stack_pop_pointer() : () -> i64
      %1582 = func.call @cc_cons(%1581, %1580) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1583 = arith.addi %1582, %__rlasp_stack_elide_zero_56 : i64
      %1584 = func.call @stack_pop_pointer() : () -> i64
      %1585 = func.call @cc_cons(%1584, %1583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1586 = arith.addi %1585, %__rlasp_stack_elide_zero_57 : i64
      %1587 = func.call @stack_pop_pointer() : () -> i64
      %1588 = func.call @cc_cons(%1587, %1586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1588) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1589 = func.call @stack_pop_pointer() : () -> i64
      %1590 = func.call @stack_pop_pointer() : () -> i64
      %1591 = func.call @cc_cons(%1590, %1589) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1592 = arith.addi %1591, %__rlasp_stack_elide_zero_58 : i64
      %1593 = func.call @stack_pop_pointer() : () -> i64
      %1594 = func.call @cc_cons(%1593, %1592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1595 = arith.addi %1594, %__rlasp_stack_elide_zero_59 : i64
      %1596 = func.call @stack_pop_pointer() : () -> i64
      %1597 = func.call @cc_cons(%1596, %1595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1597) : (i64) -> ()
      %1598 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1599 = arith.constant 3 : i64
      %1600 = func.call @cc_make_string(%1598, %1599) : (!llvm.ptr, i64) -> i64
      %1601 = func.call @cc_nil_value() : () -> i64
      %1602 = func.call @cc_intern(%1600, %1601) : (i64, i64) -> i64
      %1603 = func.call @cc_nil_value() : () -> i64
      %1604 = func.call @cc_cons(%1602, %1603) : (i64, i64) -> i64
      %1605 = func.call @cc_values_pack(%1604) : (i64) -> i64
      func.call @stack_push_pointer(%1602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1606 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1607 = arith.constant 2 : i64
      %1608 = func.call @cc_make_string(%1606, %1607) : (!llvm.ptr, i64) -> i64
      %1609 = func.call @cc_nil_value() : () -> i64
      %1610 = func.call @cc_intern(%1608, %1609) : (i64, i64) -> i64
      %1611 = func.call @cc_nil_value() : () -> i64
      %1612 = func.call @cc_cons(%1610, %1611) : (i64, i64) -> i64
      %1613 = func.call @cc_values_pack(%1612) : (i64) -> i64
      func.call @stack_push_pointer(%1610) : (i64) -> ()
      %1614 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1615 = arith.constant 1 : i64
      %1616 = func.call @cc_make_string(%1614, %1615) : (!llvm.ptr, i64) -> i64
      %1617 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1618 = arith.constant 11 : i64
      %1619 = func.call @cc_make_string(%1617, %1618) : (!llvm.ptr, i64) -> i64
      %1620 = func.call @cc_intern(%1616, %1619) : (i64, i64) -> i64
      %1621 = func.call @cc_nil_value() : () -> i64
      %1622 = func.call @cc_cons(%1620, %1621) : (i64, i64) -> i64
      %1623 = func.call @cc_values_pack(%1622) : (i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      %1624 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1624) : (i64) -> ()
      %1625 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1626 = arith.constant 6 : i64
      %1627 = func.call @cc_make_string(%1625, %1626) : (!llvm.ptr, i64) -> i64
      %1628 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1629 = arith.constant 11 : i64
      %1630 = func.call @cc_make_string(%1628, %1629) : (!llvm.ptr, i64) -> i64
      %1631 = func.call @cc_intern(%1627, %1630) : (i64, i64) -> i64
      %1632 = func.call @cc_nil_value() : () -> i64
      %1633 = func.call @cc_cons(%1631, %1632) : (i64, i64) -> i64
      %1634 = func.call @cc_values_pack(%1633) : (i64) -> i64
      func.call @stack_push_pointer(%1631) : (i64) -> ()
      %1635 = arith.constant 20 : i64
      func.call @stack_push_fixnum(%1635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1636 = func.call @stack_pop_pointer() : () -> i64
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = func.call @cc_cons(%1637, %1636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1639 = arith.addi %1638, %__rlasp_stack_elide_zero_60 : i64
      %1640 = func.call @stack_pop_pointer() : () -> i64
      %1641 = func.call @cc_cons(%1640, %1639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1645 = arith.addi %1644, %__rlasp_stack_elide_zero_61 : i64
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = func.call @cc_cons(%1646, %1645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1648 = arith.addi %1647, %__rlasp_stack_elide_zero_62 : i64
      %1649 = func.call @stack_pop_pointer() : () -> i64
      %1650 = func.call @cc_cons(%1649, %1648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1650) : (i64) -> ()
      %1651 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1651) : (i64) -> ()
      %1652 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%1652) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1655 = func.call @cc_cons(%1654, %1653) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1656 = arith.addi %1655, %__rlasp_stack_elide_zero_63 : i64
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @cc_cons(%1657, %1656) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1659 = arith.addi %1658, %__rlasp_stack_elide_zero_64 : i64
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @cc_cons(%1660, %1659) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1662 = arith.addi %1661, %__rlasp_stack_elide_zero_65 : i64
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @cc_cons(%1663, %1662) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1664) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1665 = func.call @stack_pop_pointer() : () -> i64
      %1666 = func.call @stack_pop_pointer() : () -> i64
      %1667 = func.call @cc_cons(%1666, %1665) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1668 = arith.addi %1667, %__rlasp_stack_elide_zero_66 : i64
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = func.call @cc_cons(%1669, %1668) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1671 = arith.addi %1670, %__rlasp_stack_elide_zero_67 : i64
      %1672 = func.call @stack_pop_pointer() : () -> i64
      %1673 = func.call @cc_cons(%1672, %1671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1673) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1674 = func.call @stack_pop_pointer() : () -> i64
      %1675 = func.call @stack_pop_pointer() : () -> i64
      %1676 = func.call @cc_cons(%1675, %1674) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1677 = arith.addi %1676, %__rlasp_stack_elide_zero_68 : i64
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @cc_cons(%1678, %1677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1679) : (i64) -> ()
      %1680 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1681 = arith.constant 1 : i64
      %1682 = func.call @cc_make_string(%1680, %1681) : (!llvm.ptr, i64) -> i64
      %1683 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1684 = arith.constant 11 : i64
      %1685 = func.call @cc_make_string(%1683, %1684) : (!llvm.ptr, i64) -> i64
      %1686 = func.call @cc_intern(%1682, %1685) : (i64, i64) -> i64
      %1687 = func.call @cc_nil_value() : () -> i64
      %1688 = func.call @cc_cons(%1686, %1687) : (i64, i64) -> i64
      %1689 = func.call @cc_values_pack(%1688) : (i64) -> i64
      func.call @stack_push_pointer(%1686) : (i64) -> ()
      %1690 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1691 = arith.constant 3 : i64
      %1692 = func.call @cc_make_string(%1690, %1691) : (!llvm.ptr, i64) -> i64
      %1693 = func.call @cc_nil_value() : () -> i64
      %1694 = func.call @cc_intern(%1692, %1693) : (i64, i64) -> i64
      %1695 = func.call @cc_nil_value() : () -> i64
      %1696 = func.call @cc_cons(%1694, %1695) : (i64, i64) -> i64
      %1697 = func.call @cc_values_pack(%1696) : (i64) -> i64
      func.call @stack_push_pointer(%1694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1698 = func.call @stack_pop_pointer() : () -> i64
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @cc_cons(%1699, %1698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      %1701 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1702 = arith.constant 3 : i64
      %1703 = func.call @cc_make_string(%1701, %1702) : (!llvm.ptr, i64) -> i64
      %1704 = func.call @cc_nil_value() : () -> i64
      %1705 = func.call @cc_intern(%1703, %1704) : (i64, i64) -> i64
      %1706 = func.call @cc_nil_value() : () -> i64
      %1707 = func.call @cc_cons(%1705, %1706) : (i64, i64) -> i64
      %1708 = func.call @cc_values_pack(%1707) : (i64) -> i64
      func.call @stack_push_pointer(%1705) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1709 = func.call @stack_pop_pointer() : () -> i64
      %1710 = func.call @stack_pop_pointer() : () -> i64
      %1711 = func.call @cc_cons(%1710, %1709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1712 = func.call @stack_pop_pointer() : () -> i64
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @cc_cons(%1713, %1712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1715 = arith.addi %1714, %__rlasp_stack_elide_zero_69 : i64
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = func.call @cc_cons(%1716, %1715) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1718 = arith.addi %1717, %__rlasp_stack_elide_zero_70 : i64
      %1719 = func.call @stack_pop_pointer() : () -> i64
      %1720 = func.call @cc_cons(%1719, %1718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1720) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1721 = func.call @stack_pop_pointer() : () -> i64
      %1722 = func.call @stack_pop_pointer() : () -> i64
      %1723 = func.call @cc_cons(%1722, %1721) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1724 = arith.addi %1723, %__rlasp_stack_elide_zero_71 : i64
      %1725 = func.call @stack_pop_pointer() : () -> i64
      %1726 = func.call @cc_cons(%1725, %1724) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1727 = arith.addi %1726, %__rlasp_stack_elide_zero_72 : i64
      %1728 = func.call @stack_pop_pointer() : () -> i64
      %1729 = func.call @cc_cons(%1728, %1727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1729) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1730 = func.call @stack_pop_pointer() : () -> i64
      %1731 = func.call @stack_pop_pointer() : () -> i64
      %1732 = func.call @cc_cons(%1731, %1730) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1733 = arith.addi %1732, %__rlasp_stack_elide_zero_73 : i64
      %1734 = func.call @stack_pop_pointer() : () -> i64
      %1735 = func.call @cc_cons(%1734, %1733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1735) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1736 = func.call @stack_pop_pointer() : () -> i64
      %1737 = func.call @stack_pop_pointer() : () -> i64
      %1738 = func.call @cc_cons(%1737, %1736) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1739 = arith.addi %1738, %__rlasp_stack_elide_zero_74 : i64
      %1740 = func.call @stack_pop_pointer() : () -> i64
      %1741 = func.call @cc_cons(%1740, %1739) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1742 = arith.addi %1741, %__rlasp_stack_elide_zero_75 : i64
      %1743 = func.call @stack_pop_pointer() : () -> i64
      %1744 = func.call @cc_cons(%1743, %1742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1745 = func.call @stack_pop_pointer() : () -> i64
      %1746 = func.call @stack_pop_pointer() : () -> i64
      %1747 = func.call @cc_cons(%1746, %1745) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1748 = arith.addi %1747, %__rlasp_stack_elide_zero_76 : i64
      %1749 = func.call @stack_pop_pointer() : () -> i64
      %1750 = func.call @cc_cons(%1749, %1748) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1751 = arith.addi %1750, %__rlasp_stack_elide_zero_77 : i64
      %1991 = arith.constant 152926823645196 : i64
      %1992 = arith.constant 0 : i64
      %1993 = func.call @cc_make_closure(%1991, %1992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1994 = arith.addi %1993, %__rlasp_stack_elide_zero_78 : i64
      %1995 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1996 = arith.constant 4 : i64
      %1997 = func.call @cc_make_string(%1995, %1996) : (!llvm.ptr, i64) -> i64
      %1998 = func.call @cc_nil_value() : () -> i64
      %1999 = func.call @cc_intern(%1997, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_nil_value() : () -> i64
      %2001 = func.call @cc_cons(%1999, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2003 = llvm.mlir.addressof @str148 : !llvm.ptr
      %2004 = arith.constant 16 : i64
      %2005 = func.call @cc_make_string(%2003, %2004) : (!llvm.ptr, i64) -> i64
      %2006 = llvm.mlir.addressof @str149 : !llvm.ptr
      %2007 = arith.constant 11 : i64
      %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
      %2009 = func.call @cc_intern(%2005, %2008) : (i64, i64) -> i64
      %2010 = func.call @cc_nil_value() : () -> i64
      %2011 = func.call @cc_cons(%2009, %2010) : (i64, i64) -> i64
      %2012 = func.call @cc_values_pack(%2011) : (i64) -> i64
      func.call @stack_push_pointer(%2009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2013 = func.call @stack_pop_pointer() : () -> i64
      %2014 = func.call @stack_pop_pointer() : () -> i64
      %2015 = func.call @cc_cons(%2014, %2013) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %2016 = arith.addi %2015, %__rlasp_stack_elide_zero_79 : i64
      %2017 = func.call @stack_pop_pointer() : () -> i64
      %2018 = func.call @cc_cons(%2017, %2016) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %2019 = arith.addi %2018, %__rlasp_stack_elide_zero_80 : i64
      %2020 = llvm.mlir.addressof @str150 : !llvm.ptr
      %2021 = arith.constant 11 : i64
      %2022 = func.call @cc_make_string(%2020, %2021) : (!llvm.ptr, i64) -> i64
      %2023 = llvm.mlir.addressof @str151 : !llvm.ptr
      %2024 = arith.constant 7 : i64
      %2025 = func.call @cc_make_string(%2023, %2024) : (!llvm.ptr, i64) -> i64
      %2026 = func.call @cc_intern(%2022, %2025) : (i64, i64) -> i64
      %2027 = func.call @cc_nil_value() : () -> i64
      %2028 = func.call @cc_cons(%2026, %2027) : (i64, i64) -> i64
      %2029 = func.call @cc_values_pack(%2028) : (i64) -> i64
      %2030 = func.call @cc_nil_value() : () -> i64
      %2031 = llvm.mlir.addressof @str152 : !llvm.ptr
      %2032 = arith.constant 4 : i64
      %2033 = func.call @cc_make_string(%2031, %2032) : (!llvm.ptr, i64) -> i64
      %2034 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2035 = arith.constant 7 : i64
      %2036 = func.call @cc_make_string(%2034, %2035) : (!llvm.ptr, i64) -> i64
      %2037 = func.call @cc_intern(%2033, %2036) : (i64, i64) -> i64
      %2038 = func.call @cc_nil_value() : () -> i64
      %2039 = func.call @cc_cons(%2037, %2038) : (i64, i64) -> i64
      %2040 = func.call @cc_values_pack(%2039) : (i64) -> i64
      %2041 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2042 = arith.constant 5 : i64
      %2043 = func.call @cc_make_string(%2041, %2042) : (!llvm.ptr, i64) -> i64
      %2044 = func.call @cc_nil_value() : () -> i64
      %2045 = func.call @cc_intern(%2043, %2044) : (i64, i64) -> i64
      %2046 = func.call @cc_nil_value() : () -> i64
      %2047 = func.call @cc_cons(%2045, %2046) : (i64, i64) -> i64
      %2048 = func.call @cc_values_pack(%2047) : (i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %2049 = arith.addi %2045, %__rlasp_stack_elide_zero_81 : i64
      %2050 = func.call @cc_nil_value() : () -> i64
      %2051 = func.call @cc_errorp(%1483) : (i64) -> i64
      %2052 = arith.cmpi ne, %2051, %2050 : i64
      %2053 = arith.cmpi eq, %2050, %2050 : i64
      %2054 = arith.andi %2052, %2053 : i1
      %2055 = scf.if %2054 -> (i64) {
        scf.yield %1483 : i64
      } else {
        scf.yield %2050 : i64
      }
      %2056 = func.call @cc_errorp(%1751) : (i64) -> i64
      %2057 = arith.cmpi ne, %2056, %2050 : i64
      %2058 = arith.cmpi eq, %2055, %2050 : i64
      %2059 = arith.andi %2057, %2058 : i1
      %2060 = scf.if %2059 -> (i64) {
        scf.yield %1751 : i64
      } else {
        scf.yield %2055 : i64
      }
      %2061 = func.call @cc_errorp(%1994) : (i64) -> i64
      %2062 = arith.cmpi ne, %2061, %2050 : i64
      %2063 = arith.cmpi eq, %2060, %2050 : i64
      %2064 = arith.andi %2062, %2063 : i1
      %2065 = scf.if %2064 -> (i64) {
        scf.yield %1994 : i64
      } else {
        scf.yield %2060 : i64
      }
      %2066 = func.call @cc_errorp(%2019) : (i64) -> i64
      %2067 = arith.cmpi ne, %2066, %2050 : i64
      %2068 = arith.cmpi eq, %2065, %2050 : i64
      %2069 = arith.andi %2067, %2068 : i1
      %2070 = scf.if %2069 -> (i64) {
        scf.yield %2019 : i64
      } else {
        scf.yield %2065 : i64
      }
      %2071 = func.call @cc_errorp(%2026) : (i64) -> i64
      %2072 = arith.cmpi ne, %2071, %2050 : i64
      %2073 = arith.cmpi eq, %2070, %2050 : i64
      %2074 = arith.andi %2072, %2073 : i1
      %2075 = scf.if %2074 -> (i64) {
        scf.yield %2026 : i64
      } else {
        scf.yield %2070 : i64
      }
      %2076 = func.call @cc_errorp(%2030) : (i64) -> i64
      %2077 = arith.cmpi ne, %2076, %2050 : i64
      %2078 = arith.cmpi eq, %2075, %2050 : i64
      %2079 = arith.andi %2077, %2078 : i1
      %2080 = scf.if %2079 -> (i64) {
        scf.yield %2030 : i64
      } else {
        scf.yield %2075 : i64
      }
      %2081 = func.call @cc_errorp(%2037) : (i64) -> i64
      %2082 = arith.cmpi ne, %2081, %2050 : i64
      %2083 = arith.cmpi eq, %2080, %2050 : i64
      %2084 = arith.andi %2082, %2083 : i1
      %2085 = scf.if %2084 -> (i64) {
        scf.yield %2037 : i64
      } else {
        scf.yield %2080 : i64
      }
      %2086 = func.call @cc_errorp(%2049) : (i64) -> i64
      %2087 = arith.cmpi ne, %2086, %2050 : i64
      %2088 = arith.cmpi eq, %2085, %2050 : i64
      %2089 = arith.andi %2087, %2088 : i1
      %2090 = scf.if %2089 -> (i64) {
        scf.yield %2049 : i64
      } else {
        scf.yield %2085 : i64
      }
      %2091 = arith.cmpi ne, %2090, %2050 : i64
      scf.if %2091 {
        func.call @stack_push_pointer(%2090) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1483) : (i64) -> ()
        func.call @stack_push_pointer(%1751) : (i64) -> ()
        func.call @stack_push_pointer(%1994) : (i64) -> ()
        func.call @stack_push_pointer(%2019) : (i64) -> ()
        func.call @stack_push_pointer(%2026) : (i64) -> ()
        func.call @stack_push_pointer(%2030) : (i64) -> ()
        func.call @stack_push_pointer(%2037) : (i64) -> ()
        func.call @stack_push_pointer(%2049) : (i64) -> ()
        %2092 = llvm.mlir.addressof @str155 : !llvm.ptr
        %2093 = func.call @cc_make_function_ref_const(%2092) : (!llvm.ptr) -> i64
        %2094 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2093, %2094) : (i64, i64) -> ()
      }
      %2095 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2095 : i64
    }
    %2096 = func.call @cc_nil_value() : () -> i64
    %2097 = func.call @cc_errorp(%1474) : (i64) -> i64
    %2098 = arith.cmpi ne, %2097, %2096 : i64
    %2099 = scf.if %2098 -> (i64) {
      scf.yield %1474 : i64
    } else {
      %2100 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2101 = arith.constant 16 : i64
      %2102 = func.call @cc_make_string(%2100, %2101) : (!llvm.ptr, i64) -> i64
      %2103 = func.call @cc_nil_value() : () -> i64
      %2104 = func.call @cc_intern(%2102, %2103) : (i64, i64) -> i64
      %2105 = func.call @cc_nil_value() : () -> i64
      %2106 = func.call @cc_cons(%2104, %2105) : (i64, i64) -> i64
      %2107 = func.call @cc_values_pack(%2106) : (i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %2108 = arith.addi %2104, %__rlasp_stack_elide_zero_82 : i64
      %2109 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2110 = arith.constant 3 : i64
      %2111 = func.call @cc_make_string(%2109, %2110) : (!llvm.ptr, i64) -> i64
      %2112 = func.call @cc_nil_value() : () -> i64
      %2113 = func.call @cc_intern(%2111, %2112) : (i64, i64) -> i64
      %2114 = func.call @cc_nil_value() : () -> i64
      %2115 = func.call @cc_cons(%2113, %2114) : (i64, i64) -> i64
      %2116 = func.call @cc_values_pack(%2115) : (i64) -> i64
      func.call @stack_push_pointer(%2113) : (i64) -> ()
      %2117 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2118 = arith.constant 3 : i64
      %2119 = func.call @cc_make_string(%2117, %2118) : (!llvm.ptr, i64) -> i64
      %2120 = func.call @cc_nil_value() : () -> i64
      %2121 = func.call @cc_intern(%2119, %2120) : (i64, i64) -> i64
      %2122 = func.call @cc_nil_value() : () -> i64
      %2123 = func.call @cc_cons(%2121, %2122) : (i64, i64) -> i64
      %2124 = func.call @cc_values_pack(%2123) : (i64) -> i64
      func.call @stack_push_pointer(%2121) : (i64) -> ()
      %2125 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2126 = arith.constant 16 : i64
      %2127 = func.call @cc_make_string(%2125, %2126) : (!llvm.ptr, i64) -> i64
      %2128 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2129 = arith.constant 3 : i64
      %2130 = func.call @cc_make_string(%2128, %2129) : (!llvm.ptr, i64) -> i64
      %2131 = func.call @cc_intern(%2127, %2130) : (i64, i64) -> i64
      %2132 = func.call @cc_nil_value() : () -> i64
      %2133 = func.call @cc_cons(%2131, %2132) : (i64, i64) -> i64
      %2134 = func.call @cc_values_pack(%2133) : (i64) -> i64
      func.call @stack_push_pointer(%2131) : (i64) -> ()
      %2135 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2136 = arith.constant 23 : i64
      %2137 = func.call @cc_make_string(%2135, %2136) : (!llvm.ptr, i64) -> i64
      %2138 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2139 = arith.constant 3 : i64
      %2140 = func.call @cc_make_string(%2138, %2139) : (!llvm.ptr, i64) -> i64
      %2141 = func.call @cc_intern(%2137, %2140) : (i64, i64) -> i64
      %2142 = func.call @cc_nil_value() : () -> i64
      %2143 = func.call @cc_cons(%2141, %2142) : (i64, i64) -> i64
      %2144 = func.call @cc_values_pack(%2143) : (i64) -> i64
      func.call @stack_push_pointer(%2141) : (i64) -> ()
      %2145 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2146 = arith.constant 8 : i64
      %2147 = func.call @cc_make_string(%2145, %2146) : (!llvm.ptr, i64) -> i64
      %2148 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2149 = arith.constant 7 : i64
      %2150 = func.call @cc_make_string(%2148, %2149) : (!llvm.ptr, i64) -> i64
      %2151 = func.call @cc_intern(%2147, %2150) : (i64, i64) -> i64
      %2152 = func.call @cc_nil_value() : () -> i64
      %2153 = func.call @cc_cons(%2151, %2152) : (i64, i64) -> i64
      %2154 = func.call @cc_values_pack(%2153) : (i64) -> i64
      func.call @stack_push_pointer(%2151) : (i64) -> ()
      %2155 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2156 = arith.constant 7 : i64
      %2157 = func.call @cc_make_string(%2155, %2156) : (!llvm.ptr, i64) -> i64
      %2158 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2159 = arith.constant 7 : i64
      %2160 = func.call @cc_make_string(%2158, %2159) : (!llvm.ptr, i64) -> i64
      %2161 = func.call @cc_intern(%2157, %2160) : (i64, i64) -> i64
      %2162 = func.call @cc_nil_value() : () -> i64
      %2163 = func.call @cc_cons(%2161, %2162) : (i64, i64) -> i64
      %2164 = func.call @cc_values_pack(%2163) : (i64) -> i64
      func.call @stack_push_pointer(%2161) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2165 = func.call @stack_pop_pointer() : () -> i64
      %2166 = func.call @stack_pop_pointer() : () -> i64
      %2167 = func.call @cc_cons(%2166, %2165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %2168 = arith.addi %2167, %__rlasp_stack_elide_zero_83 : i64
      %2169 = func.call @stack_pop_pointer() : () -> i64
      %2170 = func.call @cc_cons(%2169, %2168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2170) : (i64) -> ()
      %2171 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2172 = arith.constant 3 : i64
      %2173 = func.call @cc_make_string(%2171, %2172) : (!llvm.ptr, i64) -> i64
      %2174 = func.call @cc_nil_value() : () -> i64
      %2175 = func.call @cc_intern(%2173, %2174) : (i64, i64) -> i64
      %2176 = func.call @cc_nil_value() : () -> i64
      %2177 = func.call @cc_cons(%2175, %2176) : (i64, i64) -> i64
      %2178 = func.call @cc_values_pack(%2177) : (i64) -> i64
      func.call @stack_push_pointer(%2175) : (i64) -> ()
      %2179 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2180 = arith.constant 1 : i64
      %2181 = func.call @cc_make_string(%2179, %2180) : (!llvm.ptr, i64) -> i64
      %2182 = func.call @cc_nil_value() : () -> i64
      %2183 = func.call @cc_intern(%2181, %2182) : (i64, i64) -> i64
      %2184 = func.call @cc_nil_value() : () -> i64
      %2185 = func.call @cc_cons(%2183, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_values_pack(%2185) : (i64) -> i64
      func.call @stack_push_pointer(%2183) : (i64) -> ()
      %2187 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2188 = arith.constant 6 : i64
      %2189 = func.call @cc_make_string(%2187, %2188) : (!llvm.ptr, i64) -> i64
      %2190 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2191 = arith.constant 11 : i64
      %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
      %2193 = func.call @cc_intern(%2189, %2192) : (i64, i64) -> i64
      %2194 = func.call @cc_nil_value() : () -> i64
      %2195 = func.call @cc_cons(%2193, %2194) : (i64, i64) -> i64
      %2196 = func.call @cc_values_pack(%2195) : (i64) -> i64
      func.call @stack_push_pointer(%2193) : (i64) -> ()
      %2197 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2197) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2198 = func.call @stack_pop_pointer() : () -> i64
      %2199 = func.call @stack_pop_pointer() : () -> i64
      %2200 = func.call @cc_cons(%2199, %2198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %2201 = arith.addi %2200, %__rlasp_stack_elide_zero_84 : i64
      %2202 = func.call @stack_pop_pointer() : () -> i64
      %2203 = func.call @cc_cons(%2202, %2201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2204 = func.call @stack_pop_pointer() : () -> i64
      %2205 = func.call @stack_pop_pointer() : () -> i64
      %2206 = func.call @cc_cons(%2205, %2204) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %2207 = arith.addi %2206, %__rlasp_stack_elide_zero_85 : i64
      %2208 = func.call @stack_pop_pointer() : () -> i64
      %2209 = func.call @cc_cons(%2208, %2207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2209) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2210 = func.call @stack_pop_pointer() : () -> i64
      %2211 = func.call @stack_pop_pointer() : () -> i64
      %2212 = func.call @cc_cons(%2211, %2210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2212) : (i64) -> ()
      %2213 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2214 = arith.constant 1 : i64
      %2215 = func.call @cc_make_string(%2213, %2214) : (!llvm.ptr, i64) -> i64
      %2216 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2217 = arith.constant 11 : i64
      %2218 = func.call @cc_make_string(%2216, %2217) : (!llvm.ptr, i64) -> i64
      %2219 = func.call @cc_intern(%2215, %2218) : (i64, i64) -> i64
      %2220 = func.call @cc_nil_value() : () -> i64
      %2221 = func.call @cc_cons(%2219, %2220) : (i64, i64) -> i64
      %2222 = func.call @cc_values_pack(%2221) : (i64) -> i64
      func.call @stack_push_pointer(%2219) : (i64) -> ()
      %2223 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2224 = arith.constant 9 : i64
      %2225 = func.call @cc_make_string(%2223, %2224) : (!llvm.ptr, i64) -> i64
      %2226 = func.call @cc_nil_value() : () -> i64
      %2227 = func.call @cc_intern(%2225, %2226) : (i64, i64) -> i64
      %2228 = func.call @cc_nil_value() : () -> i64
      %2229 = func.call @cc_cons(%2227, %2228) : (i64, i64) -> i64
      %2230 = func.call @cc_values_pack(%2229) : (i64) -> i64
      func.call @stack_push_pointer(%2227) : (i64) -> ()
      %2231 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2232 = arith.constant 1 : i64
      %2233 = func.call @cc_make_string(%2231, %2232) : (!llvm.ptr, i64) -> i64
      %2234 = func.call @cc_nil_value() : () -> i64
      %2235 = func.call @cc_intern(%2233, %2234) : (i64, i64) -> i64
      %2236 = func.call @cc_nil_value() : () -> i64
      %2237 = func.call @cc_cons(%2235, %2236) : (i64, i64) -> i64
      %2238 = func.call @cc_values_pack(%2237) : (i64) -> i64
      func.call @stack_push_pointer(%2235) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2239 = func.call @stack_pop_pointer() : () -> i64
      %2240 = func.call @stack_pop_pointer() : () -> i64
      %2241 = func.call @cc_cons(%2240, %2239) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %2242 = arith.addi %2241, %__rlasp_stack_elide_zero_86 : i64
      %2243 = func.call @stack_pop_pointer() : () -> i64
      %2244 = func.call @cc_cons(%2243, %2242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2244) : (i64) -> ()
      %2245 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2246 = arith.constant 9 : i64
      %2247 = func.call @cc_make_string(%2245, %2246) : (!llvm.ptr, i64) -> i64
      %2248 = func.call @cc_nil_value() : () -> i64
      %2249 = func.call @cc_intern(%2247, %2248) : (i64, i64) -> i64
      %2250 = func.call @cc_nil_value() : () -> i64
      %2251 = func.call @cc_cons(%2249, %2250) : (i64, i64) -> i64
      %2252 = func.call @cc_values_pack(%2251) : (i64) -> i64
      func.call @stack_push_pointer(%2249) : (i64) -> ()
      %2253 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2254 = arith.constant 1 : i64
      %2255 = func.call @cc_make_string(%2253, %2254) : (!llvm.ptr, i64) -> i64
      %2256 = func.call @cc_nil_value() : () -> i64
      %2257 = func.call @cc_intern(%2255, %2256) : (i64, i64) -> i64
      %2258 = func.call @cc_nil_value() : () -> i64
      %2259 = func.call @cc_cons(%2257, %2258) : (i64, i64) -> i64
      %2260 = func.call @cc_values_pack(%2259) : (i64) -> i64
      func.call @stack_push_pointer(%2257) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2261 = func.call @stack_pop_pointer() : () -> i64
      %2262 = func.call @stack_pop_pointer() : () -> i64
      %2263 = func.call @cc_cons(%2262, %2261) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %2264 = arith.addi %2263, %__rlasp_stack_elide_zero_87 : i64
      %2265 = func.call @stack_pop_pointer() : () -> i64
      %2266 = func.call @cc_cons(%2265, %2264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2266) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2267 = func.call @stack_pop_pointer() : () -> i64
      %2268 = func.call @stack_pop_pointer() : () -> i64
      %2269 = func.call @cc_cons(%2268, %2267) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %2270 = arith.addi %2269, %__rlasp_stack_elide_zero_88 : i64
      %2271 = func.call @stack_pop_pointer() : () -> i64
      %2272 = func.call @cc_cons(%2271, %2270) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %2273 = arith.addi %2272, %__rlasp_stack_elide_zero_89 : i64
      %2274 = func.call @stack_pop_pointer() : () -> i64
      %2275 = func.call @cc_cons(%2274, %2273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2276 = func.call @stack_pop_pointer() : () -> i64
      %2277 = func.call @stack_pop_pointer() : () -> i64
      %2278 = func.call @cc_cons(%2277, %2276) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2279 = arith.addi %2278, %__rlasp_stack_elide_zero_90 : i64
      %2280 = func.call @stack_pop_pointer() : () -> i64
      %2281 = func.call @cc_cons(%2280, %2279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2282 = arith.addi %2281, %__rlasp_stack_elide_zero_91 : i64
      %2283 = func.call @stack_pop_pointer() : () -> i64
      %2284 = func.call @cc_cons(%2283, %2282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2284) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @stack_pop_pointer() : () -> i64
      %2287 = func.call @cc_cons(%2286, %2285) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2288 = arith.addi %2287, %__rlasp_stack_elide_zero_92 : i64
      %2289 = func.call @stack_pop_pointer() : () -> i64
      %2290 = func.call @cc_cons(%2289, %2288) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2291 = arith.addi %2290, %__rlasp_stack_elide_zero_93 : i64
      %2292 = func.call @stack_pop_pointer() : () -> i64
      %2293 = func.call @cc_cons(%2292, %2291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2293) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2294 = func.call @stack_pop_pointer() : () -> i64
      %2295 = func.call @stack_pop_pointer() : () -> i64
      %2296 = func.call @cc_cons(%2295, %2294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %2297 = arith.addi %2296, %__rlasp_stack_elide_zero_94 : i64
      %2298 = func.call @stack_pop_pointer() : () -> i64
      %2299 = func.call @cc_cons(%2298, %2297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2300 = func.call @stack_pop_pointer() : () -> i64
      %2301 = func.call @stack_pop_pointer() : () -> i64
      %2302 = func.call @cc_cons(%2301, %2300) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %2303 = arith.addi %2302, %__rlasp_stack_elide_zero_95 : i64
      %2304 = func.call @stack_pop_pointer() : () -> i64
      %2305 = func.call @cc_cons(%2304, %2303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2305) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2306 = func.call @stack_pop_pointer() : () -> i64
      %2307 = func.call @stack_pop_pointer() : () -> i64
      %2308 = func.call @cc_cons(%2307, %2306) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2309 = arith.addi %2308, %__rlasp_stack_elide_zero_96 : i64
      %2310 = func.call @stack_pop_pointer() : () -> i64
      %2311 = func.call @cc_cons(%2310, %2309) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2312 = arith.addi %2311, %__rlasp_stack_elide_zero_97 : i64
      %2424 = arith.constant 152926823645201 : i64
      %2425 = arith.constant 0 : i64
      %2426 = func.call @cc_make_closure(%2424, %2425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2427 = arith.addi %2426, %__rlasp_stack_elide_zero_98 : i64
      %2428 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2429 = arith.constant 1 : i64
      %2430 = func.call @cc_make_string(%2428, %2429) : (!llvm.ptr, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_intern(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_nil_value() : () -> i64
      %2434 = func.call @cc_cons(%2432, %2433) : (i64, i64) -> i64
      %2435 = func.call @cc_values_pack(%2434) : (i64) -> i64
      func.call @stack_push_pointer(%2432) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @stack_pop_pointer() : () -> i64
      %2438 = func.call @cc_cons(%2437, %2436) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2439 = arith.addi %2438, %__rlasp_stack_elide_zero_99 : i64
      %2440 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2441 = arith.constant 11 : i64
      %2442 = func.call @cc_make_string(%2440, %2441) : (!llvm.ptr, i64) -> i64
      %2443 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2444 = arith.constant 7 : i64
      %2445 = func.call @cc_make_string(%2443, %2444) : (!llvm.ptr, i64) -> i64
      %2446 = func.call @cc_intern(%2442, %2445) : (i64, i64) -> i64
      %2447 = func.call @cc_nil_value() : () -> i64
      %2448 = func.call @cc_cons(%2446, %2447) : (i64, i64) -> i64
      %2449 = func.call @cc_values_pack(%2448) : (i64) -> i64
      %2450 = func.call @cc_nil_value() : () -> i64
      %2451 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2452 = arith.constant 4 : i64
      %2453 = func.call @cc_make_string(%2451, %2452) : (!llvm.ptr, i64) -> i64
      %2454 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2455 = arith.constant 7 : i64
      %2456 = func.call @cc_make_string(%2454, %2455) : (!llvm.ptr, i64) -> i64
      %2457 = func.call @cc_intern(%2453, %2456) : (i64, i64) -> i64
      %2458 = func.call @cc_nil_value() : () -> i64
      %2459 = func.call @cc_cons(%2457, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_values_pack(%2459) : (i64) -> i64
      %2461 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2462 = arith.constant 6 : i64
      %2463 = func.call @cc_make_string(%2461, %2462) : (!llvm.ptr, i64) -> i64
      %2464 = func.call @cc_nil_value() : () -> i64
      %2465 = func.call @cc_intern(%2463, %2464) : (i64, i64) -> i64
      %2466 = func.call @cc_nil_value() : () -> i64
      %2467 = func.call @cc_cons(%2465, %2466) : (i64, i64) -> i64
      %2468 = func.call @cc_values_pack(%2467) : (i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2469 = arith.addi %2465, %__rlasp_stack_elide_zero_100 : i64
      %2470 = func.call @cc_nil_value() : () -> i64
      %2471 = func.call @cc_errorp(%2108) : (i64) -> i64
      %2472 = arith.cmpi ne, %2471, %2470 : i64
      %2473 = arith.cmpi eq, %2470, %2470 : i64
      %2474 = arith.andi %2472, %2473 : i1
      %2475 = scf.if %2474 -> (i64) {
        scf.yield %2108 : i64
      } else {
        scf.yield %2470 : i64
      }
      %2476 = func.call @cc_errorp(%2312) : (i64) -> i64
      %2477 = arith.cmpi ne, %2476, %2470 : i64
      %2478 = arith.cmpi eq, %2475, %2470 : i64
      %2479 = arith.andi %2477, %2478 : i1
      %2480 = scf.if %2479 -> (i64) {
        scf.yield %2312 : i64
      } else {
        scf.yield %2475 : i64
      }
      %2481 = func.call @cc_errorp(%2427) : (i64) -> i64
      %2482 = arith.cmpi ne, %2481, %2470 : i64
      %2483 = arith.cmpi eq, %2480, %2470 : i64
      %2484 = arith.andi %2482, %2483 : i1
      %2485 = scf.if %2484 -> (i64) {
        scf.yield %2427 : i64
      } else {
        scf.yield %2480 : i64
      }
      %2486 = func.call @cc_errorp(%2439) : (i64) -> i64
      %2487 = arith.cmpi ne, %2486, %2470 : i64
      %2488 = arith.cmpi eq, %2485, %2470 : i64
      %2489 = arith.andi %2487, %2488 : i1
      %2490 = scf.if %2489 -> (i64) {
        scf.yield %2439 : i64
      } else {
        scf.yield %2485 : i64
      }
      %2491 = func.call @cc_errorp(%2446) : (i64) -> i64
      %2492 = arith.cmpi ne, %2491, %2470 : i64
      %2493 = arith.cmpi eq, %2490, %2470 : i64
      %2494 = arith.andi %2492, %2493 : i1
      %2495 = scf.if %2494 -> (i64) {
        scf.yield %2446 : i64
      } else {
        scf.yield %2490 : i64
      }
      %2496 = func.call @cc_errorp(%2450) : (i64) -> i64
      %2497 = arith.cmpi ne, %2496, %2470 : i64
      %2498 = arith.cmpi eq, %2495, %2470 : i64
      %2499 = arith.andi %2497, %2498 : i1
      %2500 = scf.if %2499 -> (i64) {
        scf.yield %2450 : i64
      } else {
        scf.yield %2495 : i64
      }
      %2501 = func.call @cc_errorp(%2457) : (i64) -> i64
      %2502 = arith.cmpi ne, %2501, %2470 : i64
      %2503 = arith.cmpi eq, %2500, %2470 : i64
      %2504 = arith.andi %2502, %2503 : i1
      %2505 = scf.if %2504 -> (i64) {
        scf.yield %2457 : i64
      } else {
        scf.yield %2500 : i64
      }
      %2506 = func.call @cc_errorp(%2469) : (i64) -> i64
      %2507 = arith.cmpi ne, %2506, %2470 : i64
      %2508 = arith.cmpi eq, %2505, %2470 : i64
      %2509 = arith.andi %2507, %2508 : i1
      %2510 = scf.if %2509 -> (i64) {
        scf.yield %2469 : i64
      } else {
        scf.yield %2505 : i64
      }
      %2511 = arith.cmpi ne, %2510, %2470 : i64
      scf.if %2511 {
        func.call @stack_push_pointer(%2510) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2108) : (i64) -> ()
        func.call @stack_push_pointer(%2312) : (i64) -> ()
        func.call @stack_push_pointer(%2427) : (i64) -> ()
        func.call @stack_push_pointer(%2439) : (i64) -> ()
        func.call @stack_push_pointer(%2446) : (i64) -> ()
        func.call @stack_push_pointer(%2450) : (i64) -> ()
        func.call @stack_push_pointer(%2457) : (i64) -> ()
        func.call @stack_push_pointer(%2469) : (i64) -> ()
        %2512 = llvm.mlir.addressof @str190 : !llvm.ptr
        %2513 = func.call @cc_make_function_ref_const(%2512) : (!llvm.ptr) -> i64
        %2514 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2513, %2514) : (i64, i64) -> ()
      }
      %2515 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2515 : i64
    }
    %2516 = func.call @cc_nil_value() : () -> i64
    %2517 = func.call @cc_errorp(%2099) : (i64) -> i64
    %2518 = arith.cmpi ne, %2517, %2516 : i64
    %2519 = scf.if %2518 -> (i64) {
      scf.yield %2099 : i64
    } else {
      %2520 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2521 = arith.constant 16 : i64
      %2522 = func.call @cc_make_string(%2520, %2521) : (!llvm.ptr, i64) -> i64
      %2523 = func.call @cc_nil_value() : () -> i64
      %2524 = func.call @cc_intern(%2522, %2523) : (i64, i64) -> i64
      %2525 = func.call @cc_nil_value() : () -> i64
      %2526 = func.call @cc_cons(%2524, %2525) : (i64, i64) -> i64
      %2527 = func.call @cc_values_pack(%2526) : (i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2528 = arith.addi %2524, %__rlasp_stack_elide_zero_101 : i64
      %2529 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2530 = arith.constant 13 : i64
      %2531 = func.call @cc_make_string(%2529, %2530) : (!llvm.ptr, i64) -> i64
      %2532 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2533 = arith.constant 11 : i64
      %2534 = func.call @cc_make_string(%2532, %2533) : (!llvm.ptr, i64) -> i64
      %2535 = func.call @cc_intern(%2531, %2534) : (i64, i64) -> i64
      %2536 = func.call @cc_nil_value() : () -> i64
      %2537 = func.call @cc_cons(%2535, %2536) : (i64, i64) -> i64
      %2538 = func.call @cc_values_pack(%2537) : (i64) -> i64
      func.call @stack_push_pointer(%2535) : (i64) -> ()
      %2539 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2540 = arith.constant 6 : i64
      %2541 = func.call @cc_make_string(%2539, %2540) : (!llvm.ptr, i64) -> i64
      %2542 = func.call @cc_nil_value() : () -> i64
      %2543 = func.call @cc_intern(%2541, %2542) : (i64, i64) -> i64
      %2544 = func.call @cc_nil_value() : () -> i64
      %2545 = func.call @cc_cons(%2543, %2544) : (i64, i64) -> i64
      %2546 = func.call @cc_values_pack(%2545) : (i64) -> i64
      func.call @stack_push_pointer(%2543) : (i64) -> ()
      %2547 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2548 = arith.constant 19 : i64
      %2549 = func.call @cc_make_string(%2547, %2548) : (!llvm.ptr, i64) -> i64
      %2550 = func.call @cc_nil_value() : () -> i64
      %2551 = func.call @cc_intern(%2549, %2550) : (i64, i64) -> i64
      %2552 = func.call @cc_nil_value() : () -> i64
      %2553 = func.call @cc_cons(%2551, %2552) : (i64, i64) -> i64
      %2554 = func.call @cc_values_pack(%2553) : (i64) -> i64
      func.call @stack_push_pointer(%2551) : (i64) -> ()
      %2555 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2556 = arith.constant 3 : i64
      %2557 = func.call @cc_make_string(%2555, %2556) : (!llvm.ptr, i64) -> i64
      %2558 = func.call @cc_nil_value() : () -> i64
      %2559 = func.call @cc_intern(%2557, %2558) : (i64, i64) -> i64
      %2560 = func.call @cc_nil_value() : () -> i64
      %2561 = func.call @cc_cons(%2559, %2560) : (i64, i64) -> i64
      %2562 = func.call @cc_values_pack(%2561) : (i64) -> i64
      func.call @stack_push_pointer(%2559) : (i64) -> ()
      %2563 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2564 = arith.constant 1 : i64
      %2565 = func.call @cc_make_string(%2563, %2564) : (!llvm.ptr, i64) -> i64
      %2566 = func.call @cc_nil_value() : () -> i64
      %2567 = func.call @cc_intern(%2565, %2566) : (i64, i64) -> i64
      %2568 = func.call @cc_nil_value() : () -> i64
      %2569 = func.call @cc_cons(%2567, %2568) : (i64, i64) -> i64
      %2570 = func.call @cc_values_pack(%2569) : (i64) -> i64
      func.call @stack_push_pointer(%2567) : (i64) -> ()
      %2571 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2572 = arith.constant 6 : i64
      %2573 = func.call @cc_make_string(%2571, %2572) : (!llvm.ptr, i64) -> i64
      %2574 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2575 = arith.constant 11 : i64
      %2576 = func.call @cc_make_string(%2574, %2575) : (!llvm.ptr, i64) -> i64
      %2577 = func.call @cc_intern(%2573, %2576) : (i64, i64) -> i64
      %2578 = func.call @cc_nil_value() : () -> i64
      %2579 = func.call @cc_cons(%2577, %2578) : (i64, i64) -> i64
      %2580 = func.call @cc_values_pack(%2579) : (i64) -> i64
      func.call @stack_push_pointer(%2577) : (i64) -> ()
      %2581 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2582 = func.call @stack_pop_pointer() : () -> i64
      %2583 = func.call @stack_pop_pointer() : () -> i64
      %2584 = func.call @cc_cons(%2583, %2582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2585 = arith.addi %2584, %__rlasp_stack_elide_zero_102 : i64
      %2586 = func.call @stack_pop_pointer() : () -> i64
      %2587 = func.call @cc_cons(%2586, %2585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2587) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2588 = func.call @stack_pop_pointer() : () -> i64
      %2589 = func.call @stack_pop_pointer() : () -> i64
      %2590 = func.call @cc_cons(%2589, %2588) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2591 = arith.addi %2590, %__rlasp_stack_elide_zero_103 : i64
      %2592 = func.call @stack_pop_pointer() : () -> i64
      %2593 = func.call @cc_cons(%2592, %2591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2593) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2594 = func.call @stack_pop_pointer() : () -> i64
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = func.call @cc_cons(%2595, %2594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2596) : (i64) -> ()
      %2597 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2598 = arith.constant 1 : i64
      %2599 = func.call @cc_make_string(%2597, %2598) : (!llvm.ptr, i64) -> i64
      %2600 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2601 = arith.constant 11 : i64
      %2602 = func.call @cc_make_string(%2600, %2601) : (!llvm.ptr, i64) -> i64
      %2603 = func.call @cc_intern(%2599, %2602) : (i64, i64) -> i64
      %2604 = func.call @cc_nil_value() : () -> i64
      %2605 = func.call @cc_cons(%2603, %2604) : (i64, i64) -> i64
      %2606 = func.call @cc_values_pack(%2605) : (i64) -> i64
      func.call @stack_push_pointer(%2603) : (i64) -> ()
      %2607 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2608 = arith.constant 9 : i64
      %2609 = func.call @cc_make_string(%2607, %2608) : (!llvm.ptr, i64) -> i64
      %2610 = func.call @cc_nil_value() : () -> i64
      %2611 = func.call @cc_intern(%2609, %2610) : (i64, i64) -> i64
      %2612 = func.call @cc_nil_value() : () -> i64
      %2613 = func.call @cc_cons(%2611, %2612) : (i64, i64) -> i64
      %2614 = func.call @cc_values_pack(%2613) : (i64) -> i64
      func.call @stack_push_pointer(%2611) : (i64) -> ()
      %2615 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2616 = arith.constant 1 : i64
      %2617 = func.call @cc_make_string(%2615, %2616) : (!llvm.ptr, i64) -> i64
      %2618 = func.call @cc_nil_value() : () -> i64
      %2619 = func.call @cc_intern(%2617, %2618) : (i64, i64) -> i64
      %2620 = func.call @cc_nil_value() : () -> i64
      %2621 = func.call @cc_cons(%2619, %2620) : (i64, i64) -> i64
      %2622 = func.call @cc_values_pack(%2621) : (i64) -> i64
      func.call @stack_push_pointer(%2619) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2623 = func.call @stack_pop_pointer() : () -> i64
      %2624 = func.call @stack_pop_pointer() : () -> i64
      %2625 = func.call @cc_cons(%2624, %2623) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2626 = arith.addi %2625, %__rlasp_stack_elide_zero_104 : i64
      %2627 = func.call @stack_pop_pointer() : () -> i64
      %2628 = func.call @cc_cons(%2627, %2626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2628) : (i64) -> ()
      %2629 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2630 = arith.constant 9 : i64
      %2631 = func.call @cc_make_string(%2629, %2630) : (!llvm.ptr, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_intern(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_nil_value() : () -> i64
      %2635 = func.call @cc_cons(%2633, %2634) : (i64, i64) -> i64
      %2636 = func.call @cc_values_pack(%2635) : (i64) -> i64
      func.call @stack_push_pointer(%2633) : (i64) -> ()
      %2637 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2638 = arith.constant 1 : i64
      %2639 = func.call @cc_make_string(%2637, %2638) : (!llvm.ptr, i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_intern(%2639, %2640) : (i64, i64) -> i64
      %2642 = func.call @cc_nil_value() : () -> i64
      %2643 = func.call @cc_cons(%2641, %2642) : (i64, i64) -> i64
      %2644 = func.call @cc_values_pack(%2643) : (i64) -> i64
      func.call @stack_push_pointer(%2641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2645 = func.call @stack_pop_pointer() : () -> i64
      %2646 = func.call @stack_pop_pointer() : () -> i64
      %2647 = func.call @cc_cons(%2646, %2645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2648 = arith.addi %2647, %__rlasp_stack_elide_zero_105 : i64
      %2649 = func.call @stack_pop_pointer() : () -> i64
      %2650 = func.call @cc_cons(%2649, %2648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2650) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2651 = func.call @stack_pop_pointer() : () -> i64
      %2652 = func.call @stack_pop_pointer() : () -> i64
      %2653 = func.call @cc_cons(%2652, %2651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2654 = arith.addi %2653, %__rlasp_stack_elide_zero_106 : i64
      %2655 = func.call @stack_pop_pointer() : () -> i64
      %2656 = func.call @cc_cons(%2655, %2654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2657 = arith.addi %2656, %__rlasp_stack_elide_zero_107 : i64
      %2658 = func.call @stack_pop_pointer() : () -> i64
      %2659 = func.call @cc_cons(%2658, %2657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2659) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2660 = func.call @stack_pop_pointer() : () -> i64
      %2661 = func.call @stack_pop_pointer() : () -> i64
      %2662 = func.call @cc_cons(%2661, %2660) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2663 = arith.addi %2662, %__rlasp_stack_elide_zero_108 : i64
      %2664 = func.call @stack_pop_pointer() : () -> i64
      %2665 = func.call @cc_cons(%2664, %2663) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2666 = arith.addi %2665, %__rlasp_stack_elide_zero_109 : i64
      %2667 = func.call @stack_pop_pointer() : () -> i64
      %2668 = func.call @cc_cons(%2667, %2666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2668) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2669 = func.call @stack_pop_pointer() : () -> i64
      %2670 = func.call @stack_pop_pointer() : () -> i64
      %2671 = func.call @cc_cons(%2670, %2669) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2672 = arith.addi %2671, %__rlasp_stack_elide_zero_110 : i64
      %2673 = func.call @stack_pop_pointer() : () -> i64
      %2674 = func.call @cc_cons(%2673, %2672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2675 = func.call @stack_pop_pointer() : () -> i64
      %2676 = func.call @stack_pop_pointer() : () -> i64
      %2677 = func.call @cc_cons(%2676, %2675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2678 = arith.addi %2677, %__rlasp_stack_elide_zero_111 : i64
      %2679 = func.call @stack_pop_pointer() : () -> i64
      %2680 = func.call @cc_cons(%2679, %2678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2681 = arith.addi %2680, %__rlasp_stack_elide_zero_112 : i64
      %2682 = func.call @stack_pop_pointer() : () -> i64
      %2683 = func.call @cc_cons(%2682, %2681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2683) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2684 = func.call @stack_pop_pointer() : () -> i64
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @cc_cons(%2685, %2684) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2687 = arith.addi %2686, %__rlasp_stack_elide_zero_113 : i64
      %2688 = func.call @stack_pop_pointer() : () -> i64
      %2689 = func.call @cc_cons(%2688, %2687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2690 = arith.addi %2689, %__rlasp_stack_elide_zero_114 : i64
      %2791 = arith.constant 152926823645202 : i64
      %2792 = arith.constant 0 : i64
      %2793 = func.call @cc_make_closure(%2791, %2792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2794 = arith.addi %2793, %__rlasp_stack_elide_zero_115 : i64
      %2795 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2796 = arith.constant 4 : i64
      %2797 = func.call @cc_make_string(%2795, %2796) : (!llvm.ptr, i64) -> i64
      %2798 = func.call @cc_nil_value() : () -> i64
      %2799 = func.call @cc_intern(%2797, %2798) : (i64, i64) -> i64
      %2800 = func.call @cc_nil_value() : () -> i64
      %2801 = func.call @cc_cons(%2799, %2800) : (i64, i64) -> i64
      %2802 = func.call @cc_values_pack(%2801) : (i64) -> i64
      func.call @stack_push_pointer(%2799) : (i64) -> ()
      %2803 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2804 = arith.constant 23 : i64
      %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
      %2806 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2807 = arith.constant 11 : i64
      %2808 = func.call @cc_make_string(%2806, %2807) : (!llvm.ptr, i64) -> i64
      %2809 = func.call @cc_intern(%2805, %2808) : (i64, i64) -> i64
      %2810 = func.call @cc_nil_value() : () -> i64
      %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
      func.call @stack_push_pointer(%2809) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2813 = func.call @stack_pop_pointer() : () -> i64
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @cc_cons(%2814, %2813) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2816 = arith.addi %2815, %__rlasp_stack_elide_zero_116 : i64
      %2817 = func.call @stack_pop_pointer() : () -> i64
      %2818 = func.call @cc_cons(%2817, %2816) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2819 = arith.addi %2818, %__rlasp_stack_elide_zero_117 : i64
      %2820 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2821 = arith.constant 11 : i64
      %2822 = func.call @cc_make_string(%2820, %2821) : (!llvm.ptr, i64) -> i64
      %2823 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2824 = arith.constant 7 : i64
      %2825 = func.call @cc_make_string(%2823, %2824) : (!llvm.ptr, i64) -> i64
      %2826 = func.call @cc_intern(%2822, %2825) : (i64, i64) -> i64
      %2827 = func.call @cc_nil_value() : () -> i64
      %2828 = func.call @cc_cons(%2826, %2827) : (i64, i64) -> i64
      %2829 = func.call @cc_values_pack(%2828) : (i64) -> i64
      %2830 = func.call @cc_nil_value() : () -> i64
      %2831 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2832 = arith.constant 4 : i64
      %2833 = func.call @cc_make_string(%2831, %2832) : (!llvm.ptr, i64) -> i64
      %2834 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2835 = arith.constant 7 : i64
      %2836 = func.call @cc_make_string(%2834, %2835) : (!llvm.ptr, i64) -> i64
      %2837 = func.call @cc_intern(%2833, %2836) : (i64, i64) -> i64
      %2838 = func.call @cc_nil_value() : () -> i64
      %2839 = func.call @cc_cons(%2837, %2838) : (i64, i64) -> i64
      %2840 = func.call @cc_values_pack(%2839) : (i64) -> i64
      %2841 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2842 = arith.constant 5 : i64
      %2843 = func.call @cc_make_string(%2841, %2842) : (!llvm.ptr, i64) -> i64
      %2844 = func.call @cc_nil_value() : () -> i64
      %2845 = func.call @cc_intern(%2843, %2844) : (i64, i64) -> i64
      %2846 = func.call @cc_nil_value() : () -> i64
      %2847 = func.call @cc_cons(%2845, %2846) : (i64, i64) -> i64
      %2848 = func.call @cc_values_pack(%2847) : (i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2849 = arith.addi %2845, %__rlasp_stack_elide_zero_118 : i64
      %2850 = func.call @cc_nil_value() : () -> i64
      %2851 = func.call @cc_errorp(%2528) : (i64) -> i64
      %2852 = arith.cmpi ne, %2851, %2850 : i64
      %2853 = arith.cmpi eq, %2850, %2850 : i64
      %2854 = arith.andi %2852, %2853 : i1
      %2855 = scf.if %2854 -> (i64) {
        scf.yield %2528 : i64
      } else {
        scf.yield %2850 : i64
      }
      %2856 = func.call @cc_errorp(%2690) : (i64) -> i64
      %2857 = arith.cmpi ne, %2856, %2850 : i64
      %2858 = arith.cmpi eq, %2855, %2850 : i64
      %2859 = arith.andi %2857, %2858 : i1
      %2860 = scf.if %2859 -> (i64) {
        scf.yield %2690 : i64
      } else {
        scf.yield %2855 : i64
      }
      %2861 = func.call @cc_errorp(%2794) : (i64) -> i64
      %2862 = arith.cmpi ne, %2861, %2850 : i64
      %2863 = arith.cmpi eq, %2860, %2850 : i64
      %2864 = arith.andi %2862, %2863 : i1
      %2865 = scf.if %2864 -> (i64) {
        scf.yield %2794 : i64
      } else {
        scf.yield %2860 : i64
      }
      %2866 = func.call @cc_errorp(%2819) : (i64) -> i64
      %2867 = arith.cmpi ne, %2866, %2850 : i64
      %2868 = arith.cmpi eq, %2865, %2850 : i64
      %2869 = arith.andi %2867, %2868 : i1
      %2870 = scf.if %2869 -> (i64) {
        scf.yield %2819 : i64
      } else {
        scf.yield %2865 : i64
      }
      %2871 = func.call @cc_errorp(%2826) : (i64) -> i64
      %2872 = arith.cmpi ne, %2871, %2850 : i64
      %2873 = arith.cmpi eq, %2870, %2850 : i64
      %2874 = arith.andi %2872, %2873 : i1
      %2875 = scf.if %2874 -> (i64) {
        scf.yield %2826 : i64
      } else {
        scf.yield %2870 : i64
      }
      %2876 = func.call @cc_errorp(%2830) : (i64) -> i64
      %2877 = arith.cmpi ne, %2876, %2850 : i64
      %2878 = arith.cmpi eq, %2875, %2850 : i64
      %2879 = arith.andi %2877, %2878 : i1
      %2880 = scf.if %2879 -> (i64) {
        scf.yield %2830 : i64
      } else {
        scf.yield %2875 : i64
      }
      %2881 = func.call @cc_errorp(%2837) : (i64) -> i64
      %2882 = arith.cmpi ne, %2881, %2850 : i64
      %2883 = arith.cmpi eq, %2880, %2850 : i64
      %2884 = arith.andi %2882, %2883 : i1
      %2885 = scf.if %2884 -> (i64) {
        scf.yield %2837 : i64
      } else {
        scf.yield %2880 : i64
      }
      %2886 = func.call @cc_errorp(%2849) : (i64) -> i64
      %2887 = arith.cmpi ne, %2886, %2850 : i64
      %2888 = arith.cmpi eq, %2885, %2850 : i64
      %2889 = arith.andi %2887, %2888 : i1
      %2890 = scf.if %2889 -> (i64) {
        scf.yield %2849 : i64
      } else {
        scf.yield %2885 : i64
      }
      %2891 = arith.cmpi ne, %2890, %2850 : i64
      scf.if %2891 {
        func.call @stack_push_pointer(%2890) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2528) : (i64) -> ()
        func.call @stack_push_pointer(%2690) : (i64) -> ()
        func.call @stack_push_pointer(%2794) : (i64) -> ()
        func.call @stack_push_pointer(%2819) : (i64) -> ()
        func.call @stack_push_pointer(%2826) : (i64) -> ()
        func.call @stack_push_pointer(%2830) : (i64) -> ()
        func.call @stack_push_pointer(%2837) : (i64) -> ()
        func.call @stack_push_pointer(%2849) : (i64) -> ()
        %2892 = llvm.mlir.addressof @str216 : !llvm.ptr
        %2893 = func.call @cc_make_function_ref_const(%2892) : (!llvm.ptr) -> i64
        %2894 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2893, %2894) : (i64, i64) -> ()
      }
      %2895 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2895 : i64
    }
    %2896 = func.call @cc_nil_value() : () -> i64
    %2897 = func.call @cc_errorp(%2519) : (i64) -> i64
    %2898 = arith.cmpi ne, %2897, %2896 : i64
    %2899 = scf.if %2898 -> (i64) {
      scf.yield %2519 : i64
    } else {
      %2900 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2901 = arith.constant 16 : i64
      %2902 = func.call @cc_make_string(%2900, %2901) : (!llvm.ptr, i64) -> i64
      %2903 = func.call @cc_nil_value() : () -> i64
      %2904 = func.call @cc_intern(%2902, %2903) : (i64, i64) -> i64
      %2905 = func.call @cc_nil_value() : () -> i64
      %2906 = func.call @cc_cons(%2904, %2905) : (i64, i64) -> i64
      %2907 = func.call @cc_values_pack(%2906) : (i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2908 = arith.addi %2904, %__rlasp_stack_elide_zero_119 : i64
      %2909 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2910 = arith.constant 3 : i64
      %2911 = func.call @cc_make_string(%2909, %2910) : (!llvm.ptr, i64) -> i64
      %2912 = func.call @cc_nil_value() : () -> i64
      %2913 = func.call @cc_intern(%2911, %2912) : (i64, i64) -> i64
      %2914 = func.call @cc_nil_value() : () -> i64
      %2915 = func.call @cc_cons(%2913, %2914) : (i64, i64) -> i64
      %2916 = func.call @cc_values_pack(%2915) : (i64) -> i64
      func.call @stack_push_pointer(%2913) : (i64) -> ()
      %2917 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2918 = arith.constant 3 : i64
      %2919 = func.call @cc_make_string(%2917, %2918) : (!llvm.ptr, i64) -> i64
      %2920 = func.call @cc_nil_value() : () -> i64
      %2921 = func.call @cc_intern(%2919, %2920) : (i64, i64) -> i64
      %2922 = func.call @cc_nil_value() : () -> i64
      %2923 = func.call @cc_cons(%2921, %2922) : (i64, i64) -> i64
      %2924 = func.call @cc_values_pack(%2923) : (i64) -> i64
      func.call @stack_push_pointer(%2921) : (i64) -> ()
      %2925 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2926 = arith.constant 16 : i64
      %2927 = func.call @cc_make_string(%2925, %2926) : (!llvm.ptr, i64) -> i64
      %2928 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2929 = arith.constant 3 : i64
      %2930 = func.call @cc_make_string(%2928, %2929) : (!llvm.ptr, i64) -> i64
      %2931 = func.call @cc_intern(%2927, %2930) : (i64, i64) -> i64
      %2932 = func.call @cc_nil_value() : () -> i64
      %2933 = func.call @cc_cons(%2931, %2932) : (i64, i64) -> i64
      %2934 = func.call @cc_values_pack(%2933) : (i64) -> i64
      func.call @stack_push_pointer(%2931) : (i64) -> ()
      %2935 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2936 = arith.constant 23 : i64
      %2937 = func.call @cc_make_string(%2935, %2936) : (!llvm.ptr, i64) -> i64
      %2938 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2939 = arith.constant 3 : i64
      %2940 = func.call @cc_make_string(%2938, %2939) : (!llvm.ptr, i64) -> i64
      %2941 = func.call @cc_intern(%2937, %2940) : (i64, i64) -> i64
      %2942 = func.call @cc_nil_value() : () -> i64
      %2943 = func.call @cc_cons(%2941, %2942) : (i64, i64) -> i64
      %2944 = func.call @cc_values_pack(%2943) : (i64) -> i64
      func.call @stack_push_pointer(%2941) : (i64) -> ()
      %2945 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2946 = arith.constant 8 : i64
      %2947 = func.call @cc_make_string(%2945, %2946) : (!llvm.ptr, i64) -> i64
      %2948 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2949 = arith.constant 7 : i64
      %2950 = func.call @cc_make_string(%2948, %2949) : (!llvm.ptr, i64) -> i64
      %2951 = func.call @cc_intern(%2947, %2950) : (i64, i64) -> i64
      %2952 = func.call @cc_nil_value() : () -> i64
      %2953 = func.call @cc_cons(%2951, %2952) : (i64, i64) -> i64
      %2954 = func.call @cc_values_pack(%2953) : (i64) -> i64
      func.call @stack_push_pointer(%2951) : (i64) -> ()
      %2955 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2956 = arith.constant 7 : i64
      %2957 = func.call @cc_make_string(%2955, %2956) : (!llvm.ptr, i64) -> i64
      %2958 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2959 = arith.constant 7 : i64
      %2960 = func.call @cc_make_string(%2958, %2959) : (!llvm.ptr, i64) -> i64
      %2961 = func.call @cc_intern(%2957, %2960) : (i64, i64) -> i64
      %2962 = func.call @cc_nil_value() : () -> i64
      %2963 = func.call @cc_cons(%2961, %2962) : (i64, i64) -> i64
      %2964 = func.call @cc_values_pack(%2963) : (i64) -> i64
      func.call @stack_push_pointer(%2961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2965 = func.call @stack_pop_pointer() : () -> i64
      %2966 = func.call @stack_pop_pointer() : () -> i64
      %2967 = func.call @cc_cons(%2966, %2965) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2968 = arith.addi %2967, %__rlasp_stack_elide_zero_120 : i64
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @cc_cons(%2969, %2968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2970) : (i64) -> ()
      %2971 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2972 = arith.constant 3 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = func.call @cc_nil_value() : () -> i64
      %2975 = func.call @cc_intern(%2973, %2974) : (i64, i64) -> i64
      %2976 = func.call @cc_nil_value() : () -> i64
      %2977 = func.call @cc_cons(%2975, %2976) : (i64, i64) -> i64
      %2978 = func.call @cc_values_pack(%2977) : (i64) -> i64
      func.call @stack_push_pointer(%2975) : (i64) -> ()
      %2979 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2980 = arith.constant 1 : i64
      %2981 = func.call @cc_make_string(%2979, %2980) : (!llvm.ptr, i64) -> i64
      %2982 = func.call @cc_nil_value() : () -> i64
      %2983 = func.call @cc_intern(%2981, %2982) : (i64, i64) -> i64
      %2984 = func.call @cc_nil_value() : () -> i64
      %2985 = func.call @cc_cons(%2983, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_values_pack(%2985) : (i64) -> i64
      func.call @stack_push_pointer(%2983) : (i64) -> ()
      %2987 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2988 = arith.constant 6 : i64
      %2989 = func.call @cc_make_string(%2987, %2988) : (!llvm.ptr, i64) -> i64
      %2990 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2991 = arith.constant 11 : i64
      %2992 = func.call @cc_make_string(%2990, %2991) : (!llvm.ptr, i64) -> i64
      %2993 = func.call @cc_intern(%2989, %2992) : (i64, i64) -> i64
      %2994 = func.call @cc_nil_value() : () -> i64
      %2995 = func.call @cc_cons(%2993, %2994) : (i64, i64) -> i64
      %2996 = func.call @cc_values_pack(%2995) : (i64) -> i64
      func.call @stack_push_pointer(%2993) : (i64) -> ()
      %2997 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2998 = func.call @stack_pop_pointer() : () -> i64
      %2999 = func.call @stack_pop_pointer() : () -> i64
      %3000 = func.call @cc_cons(%2999, %2998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %3001 = arith.addi %3000, %__rlasp_stack_elide_zero_121 : i64
      %3002 = func.call @stack_pop_pointer() : () -> i64
      %3003 = func.call @cc_cons(%3002, %3001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3004 = func.call @stack_pop_pointer() : () -> i64
      %3005 = func.call @stack_pop_pointer() : () -> i64
      %3006 = func.call @cc_cons(%3005, %3004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %3007 = arith.addi %3006, %__rlasp_stack_elide_zero_122 : i64
      %3008 = func.call @stack_pop_pointer() : () -> i64
      %3009 = func.call @cc_cons(%3008, %3007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3010 = func.call @stack_pop_pointer() : () -> i64
      %3011 = func.call @stack_pop_pointer() : () -> i64
      %3012 = func.call @cc_cons(%3011, %3010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3012) : (i64) -> ()
      %3013 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3014 = arith.constant 1 : i64
      %3015 = func.call @cc_make_string(%3013, %3014) : (!llvm.ptr, i64) -> i64
      %3016 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3017 = arith.constant 11 : i64
      %3018 = func.call @cc_make_string(%3016, %3017) : (!llvm.ptr, i64) -> i64
      %3019 = func.call @cc_intern(%3015, %3018) : (i64, i64) -> i64
      %3020 = func.call @cc_nil_value() : () -> i64
      %3021 = func.call @cc_cons(%3019, %3020) : (i64, i64) -> i64
      %3022 = func.call @cc_values_pack(%3021) : (i64) -> i64
      func.call @stack_push_pointer(%3019) : (i64) -> ()
      %3023 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3024 = arith.constant 9 : i64
      %3025 = func.call @cc_make_string(%3023, %3024) : (!llvm.ptr, i64) -> i64
      %3026 = func.call @cc_nil_value() : () -> i64
      %3027 = func.call @cc_intern(%3025, %3026) : (i64, i64) -> i64
      %3028 = func.call @cc_nil_value() : () -> i64
      %3029 = func.call @cc_cons(%3027, %3028) : (i64, i64) -> i64
      %3030 = func.call @cc_values_pack(%3029) : (i64) -> i64
      func.call @stack_push_pointer(%3027) : (i64) -> ()
      %3031 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3032 = arith.constant 1 : i64
      %3033 = func.call @cc_make_string(%3031, %3032) : (!llvm.ptr, i64) -> i64
      %3034 = func.call @cc_nil_value() : () -> i64
      %3035 = func.call @cc_intern(%3033, %3034) : (i64, i64) -> i64
      %3036 = func.call @cc_nil_value() : () -> i64
      %3037 = func.call @cc_cons(%3035, %3036) : (i64, i64) -> i64
      %3038 = func.call @cc_values_pack(%3037) : (i64) -> i64
      func.call @stack_push_pointer(%3035) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3039 = func.call @stack_pop_pointer() : () -> i64
      %3040 = func.call @stack_pop_pointer() : () -> i64
      %3041 = func.call @cc_cons(%3040, %3039) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %3042 = arith.addi %3041, %__rlasp_stack_elide_zero_123 : i64
      %3043 = func.call @stack_pop_pointer() : () -> i64
      %3044 = func.call @cc_cons(%3043, %3042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3044) : (i64) -> ()
      %3045 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3046 = arith.constant 9 : i64
      %3047 = func.call @cc_make_string(%3045, %3046) : (!llvm.ptr, i64) -> i64
      %3048 = func.call @cc_nil_value() : () -> i64
      %3049 = func.call @cc_intern(%3047, %3048) : (i64, i64) -> i64
      %3050 = func.call @cc_nil_value() : () -> i64
      %3051 = func.call @cc_cons(%3049, %3050) : (i64, i64) -> i64
      %3052 = func.call @cc_values_pack(%3051) : (i64) -> i64
      func.call @stack_push_pointer(%3049) : (i64) -> ()
      %3053 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3054 = arith.constant 1 : i64
      %3055 = func.call @cc_make_string(%3053, %3054) : (!llvm.ptr, i64) -> i64
      %3056 = func.call @cc_nil_value() : () -> i64
      %3057 = func.call @cc_intern(%3055, %3056) : (i64, i64) -> i64
      %3058 = func.call @cc_nil_value() : () -> i64
      %3059 = func.call @cc_cons(%3057, %3058) : (i64, i64) -> i64
      %3060 = func.call @cc_values_pack(%3059) : (i64) -> i64
      func.call @stack_push_pointer(%3057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3061 = func.call @stack_pop_pointer() : () -> i64
      %3062 = func.call @stack_pop_pointer() : () -> i64
      %3063 = func.call @cc_cons(%3062, %3061) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %3064 = arith.addi %3063, %__rlasp_stack_elide_zero_124 : i64
      %3065 = func.call @stack_pop_pointer() : () -> i64
      %3066 = func.call @cc_cons(%3065, %3064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3067 = func.call @stack_pop_pointer() : () -> i64
      %3068 = func.call @stack_pop_pointer() : () -> i64
      %3069 = func.call @cc_cons(%3068, %3067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %3070 = arith.addi %3069, %__rlasp_stack_elide_zero_125 : i64
      %3071 = func.call @stack_pop_pointer() : () -> i64
      %3072 = func.call @cc_cons(%3071, %3070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %3073 = arith.addi %3072, %__rlasp_stack_elide_zero_126 : i64
      %3074 = func.call @stack_pop_pointer() : () -> i64
      %3075 = func.call @cc_cons(%3074, %3073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3076 = func.call @stack_pop_pointer() : () -> i64
      %3077 = func.call @stack_pop_pointer() : () -> i64
      %3078 = func.call @cc_cons(%3077, %3076) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %3079 = arith.addi %3078, %__rlasp_stack_elide_zero_127 : i64
      %3080 = func.call @stack_pop_pointer() : () -> i64
      %3081 = func.call @cc_cons(%3080, %3079) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %3082 = arith.addi %3081, %__rlasp_stack_elide_zero_128 : i64
      %3083 = func.call @stack_pop_pointer() : () -> i64
      %3084 = func.call @cc_cons(%3083, %3082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3085 = func.call @stack_pop_pointer() : () -> i64
      %3086 = func.call @stack_pop_pointer() : () -> i64
      %3087 = func.call @cc_cons(%3086, %3085) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %3088 = arith.addi %3087, %__rlasp_stack_elide_zero_129 : i64
      %3089 = func.call @stack_pop_pointer() : () -> i64
      %3090 = func.call @cc_cons(%3089, %3088) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %3091 = arith.addi %3090, %__rlasp_stack_elide_zero_130 : i64
      %3092 = func.call @stack_pop_pointer() : () -> i64
      %3093 = func.call @cc_cons(%3092, %3091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3093) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3094 = func.call @stack_pop_pointer() : () -> i64
      %3095 = func.call @stack_pop_pointer() : () -> i64
      %3096 = func.call @cc_cons(%3095, %3094) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %3097 = arith.addi %3096, %__rlasp_stack_elide_zero_131 : i64
      %3098 = func.call @stack_pop_pointer() : () -> i64
      %3099 = func.call @cc_cons(%3098, %3097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3099) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3100 = func.call @stack_pop_pointer() : () -> i64
      %3101 = func.call @stack_pop_pointer() : () -> i64
      %3102 = func.call @cc_cons(%3101, %3100) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %3103 = arith.addi %3102, %__rlasp_stack_elide_zero_132 : i64
      %3104 = func.call @stack_pop_pointer() : () -> i64
      %3105 = func.call @cc_cons(%3104, %3103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3106 = func.call @stack_pop_pointer() : () -> i64
      %3107 = func.call @stack_pop_pointer() : () -> i64
      %3108 = func.call @cc_cons(%3107, %3106) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %3109 = arith.addi %3108, %__rlasp_stack_elide_zero_133 : i64
      %3110 = func.call @stack_pop_pointer() : () -> i64
      %3111 = func.call @cc_cons(%3110, %3109) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %3112 = arith.addi %3111, %__rlasp_stack_elide_zero_134 : i64
      %3224 = arith.constant 152926823645203 : i64
      %3225 = arith.constant 0 : i64
      %3226 = func.call @cc_make_closure(%3224, %3225) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %3227 = arith.addi %3226, %__rlasp_stack_elide_zero_135 : i64
      %3228 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3229 = arith.constant 1 : i64
      %3230 = func.call @cc_make_string(%3228, %3229) : (!llvm.ptr, i64) -> i64
      %3231 = func.call @cc_nil_value() : () -> i64
      %3232 = func.call @cc_intern(%3230, %3231) : (i64, i64) -> i64
      %3233 = func.call @cc_nil_value() : () -> i64
      %3234 = func.call @cc_cons(%3232, %3233) : (i64, i64) -> i64
      %3235 = func.call @cc_values_pack(%3234) : (i64) -> i64
      func.call @stack_push_pointer(%3232) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3236 = func.call @stack_pop_pointer() : () -> i64
      %3237 = func.call @stack_pop_pointer() : () -> i64
      %3238 = func.call @cc_cons(%3237, %3236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %3239 = arith.addi %3238, %__rlasp_stack_elide_zero_136 : i64
      %3240 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3241 = arith.constant 11 : i64
      %3242 = func.call @cc_make_string(%3240, %3241) : (!llvm.ptr, i64) -> i64
      %3243 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3244 = arith.constant 7 : i64
      %3245 = func.call @cc_make_string(%3243, %3244) : (!llvm.ptr, i64) -> i64
      %3246 = func.call @cc_intern(%3242, %3245) : (i64, i64) -> i64
      %3247 = func.call @cc_nil_value() : () -> i64
      %3248 = func.call @cc_cons(%3246, %3247) : (i64, i64) -> i64
      %3249 = func.call @cc_values_pack(%3248) : (i64) -> i64
      %3250 = func.call @cc_nil_value() : () -> i64
      %3251 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3252 = arith.constant 4 : i64
      %3253 = func.call @cc_make_string(%3251, %3252) : (!llvm.ptr, i64) -> i64
      %3254 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3255 = arith.constant 7 : i64
      %3256 = func.call @cc_make_string(%3254, %3255) : (!llvm.ptr, i64) -> i64
      %3257 = func.call @cc_intern(%3253, %3256) : (i64, i64) -> i64
      %3258 = func.call @cc_nil_value() : () -> i64
      %3259 = func.call @cc_cons(%3257, %3258) : (i64, i64) -> i64
      %3260 = func.call @cc_values_pack(%3259) : (i64) -> i64
      %3261 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3262 = arith.constant 6 : i64
      %3263 = func.call @cc_make_string(%3261, %3262) : (!llvm.ptr, i64) -> i64
      %3264 = func.call @cc_nil_value() : () -> i64
      %3265 = func.call @cc_intern(%3263, %3264) : (i64, i64) -> i64
      %3266 = func.call @cc_nil_value() : () -> i64
      %3267 = func.call @cc_cons(%3265, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_values_pack(%3267) : (i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %3269 = arith.addi %3265, %__rlasp_stack_elide_zero_137 : i64
      %3270 = func.call @cc_nil_value() : () -> i64
      %3271 = func.call @cc_errorp(%2908) : (i64) -> i64
      %3272 = arith.cmpi ne, %3271, %3270 : i64
      %3273 = arith.cmpi eq, %3270, %3270 : i64
      %3274 = arith.andi %3272, %3273 : i1
      %3275 = scf.if %3274 -> (i64) {
        scf.yield %2908 : i64
      } else {
        scf.yield %3270 : i64
      }
      %3276 = func.call @cc_errorp(%3112) : (i64) -> i64
      %3277 = arith.cmpi ne, %3276, %3270 : i64
      %3278 = arith.cmpi eq, %3275, %3270 : i64
      %3279 = arith.andi %3277, %3278 : i1
      %3280 = scf.if %3279 -> (i64) {
        scf.yield %3112 : i64
      } else {
        scf.yield %3275 : i64
      }
      %3281 = func.call @cc_errorp(%3227) : (i64) -> i64
      %3282 = arith.cmpi ne, %3281, %3270 : i64
      %3283 = arith.cmpi eq, %3280, %3270 : i64
      %3284 = arith.andi %3282, %3283 : i1
      %3285 = scf.if %3284 -> (i64) {
        scf.yield %3227 : i64
      } else {
        scf.yield %3280 : i64
      }
      %3286 = func.call @cc_errorp(%3239) : (i64) -> i64
      %3287 = arith.cmpi ne, %3286, %3270 : i64
      %3288 = arith.cmpi eq, %3285, %3270 : i64
      %3289 = arith.andi %3287, %3288 : i1
      %3290 = scf.if %3289 -> (i64) {
        scf.yield %3239 : i64
      } else {
        scf.yield %3285 : i64
      }
      %3291 = func.call @cc_errorp(%3246) : (i64) -> i64
      %3292 = arith.cmpi ne, %3291, %3270 : i64
      %3293 = arith.cmpi eq, %3290, %3270 : i64
      %3294 = arith.andi %3292, %3293 : i1
      %3295 = scf.if %3294 -> (i64) {
        scf.yield %3246 : i64
      } else {
        scf.yield %3290 : i64
      }
      %3296 = func.call @cc_errorp(%3250) : (i64) -> i64
      %3297 = arith.cmpi ne, %3296, %3270 : i64
      %3298 = arith.cmpi eq, %3295, %3270 : i64
      %3299 = arith.andi %3297, %3298 : i1
      %3300 = scf.if %3299 -> (i64) {
        scf.yield %3250 : i64
      } else {
        scf.yield %3295 : i64
      }
      %3301 = func.call @cc_errorp(%3257) : (i64) -> i64
      %3302 = arith.cmpi ne, %3301, %3270 : i64
      %3303 = arith.cmpi eq, %3300, %3270 : i64
      %3304 = arith.andi %3302, %3303 : i1
      %3305 = scf.if %3304 -> (i64) {
        scf.yield %3257 : i64
      } else {
        scf.yield %3300 : i64
      }
      %3306 = func.call @cc_errorp(%3269) : (i64) -> i64
      %3307 = arith.cmpi ne, %3306, %3270 : i64
      %3308 = arith.cmpi eq, %3305, %3270 : i64
      %3309 = arith.andi %3307, %3308 : i1
      %3310 = scf.if %3309 -> (i64) {
        scf.yield %3269 : i64
      } else {
        scf.yield %3305 : i64
      }
      %3311 = arith.cmpi ne, %3310, %3270 : i64
      scf.if %3311 {
        func.call @stack_push_pointer(%3310) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2908) : (i64) -> ()
        func.call @stack_push_pointer(%3112) : (i64) -> ()
        func.call @stack_push_pointer(%3227) : (i64) -> ()
        func.call @stack_push_pointer(%3239) : (i64) -> ()
        func.call @stack_push_pointer(%3246) : (i64) -> ()
        func.call @stack_push_pointer(%3250) : (i64) -> ()
        func.call @stack_push_pointer(%3257) : (i64) -> ()
        func.call @stack_push_pointer(%3269) : (i64) -> ()
        %3312 = llvm.mlir.addressof @str251 : !llvm.ptr
        %3313 = func.call @cc_make_function_ref_const(%3312) : (!llvm.ptr) -> i64
        %3314 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3313, %3314) : (i64, i64) -> ()
      }
      %3315 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3315 : i64
    }
    %3316 = func.call @cc_nil_value() : () -> i64
    %3317 = func.call @cc_errorp(%2899) : (i64) -> i64
    %3318 = arith.cmpi ne, %3317, %3316 : i64
    %3319 = scf.if %3318 -> (i64) {
      scf.yield %2899 : i64
    } else {
      %3320 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3321 = arith.constant 16 : i64
      %3322 = func.call @cc_make_string(%3320, %3321) : (!llvm.ptr, i64) -> i64
      %3323 = func.call @cc_nil_value() : () -> i64
      %3324 = func.call @cc_intern(%3322, %3323) : (i64, i64) -> i64
      %3325 = func.call @cc_nil_value() : () -> i64
      %3326 = func.call @cc_cons(%3324, %3325) : (i64, i64) -> i64
      %3327 = func.call @cc_values_pack(%3326) : (i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %3328 = arith.addi %3324, %__rlasp_stack_elide_zero_138 : i64
      %3329 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3330 = arith.constant 13 : i64
      %3331 = func.call @cc_make_string(%3329, %3330) : (!llvm.ptr, i64) -> i64
      %3332 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3333 = arith.constant 11 : i64
      %3334 = func.call @cc_make_string(%3332, %3333) : (!llvm.ptr, i64) -> i64
      %3335 = func.call @cc_intern(%3331, %3334) : (i64, i64) -> i64
      %3336 = func.call @cc_nil_value() : () -> i64
      %3337 = func.call @cc_cons(%3335, %3336) : (i64, i64) -> i64
      %3338 = func.call @cc_values_pack(%3337) : (i64) -> i64
      func.call @stack_push_pointer(%3335) : (i64) -> ()
      %3339 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3340 = arith.constant 6 : i64
      %3341 = func.call @cc_make_string(%3339, %3340) : (!llvm.ptr, i64) -> i64
      %3342 = func.call @cc_nil_value() : () -> i64
      %3343 = func.call @cc_intern(%3341, %3342) : (i64, i64) -> i64
      %3344 = func.call @cc_nil_value() : () -> i64
      %3345 = func.call @cc_cons(%3343, %3344) : (i64, i64) -> i64
      %3346 = func.call @cc_values_pack(%3345) : (i64) -> i64
      func.call @stack_push_pointer(%3343) : (i64) -> ()
      %3347 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3348 = arith.constant 19 : i64
      %3349 = func.call @cc_make_string(%3347, %3348) : (!llvm.ptr, i64) -> i64
      %3350 = func.call @cc_nil_value() : () -> i64
      %3351 = func.call @cc_intern(%3349, %3350) : (i64, i64) -> i64
      %3352 = func.call @cc_nil_value() : () -> i64
      %3353 = func.call @cc_cons(%3351, %3352) : (i64, i64) -> i64
      %3354 = func.call @cc_values_pack(%3353) : (i64) -> i64
      func.call @stack_push_pointer(%3351) : (i64) -> ()
      %3355 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3356 = arith.constant 3 : i64
      %3357 = func.call @cc_make_string(%3355, %3356) : (!llvm.ptr, i64) -> i64
      %3358 = func.call @cc_nil_value() : () -> i64
      %3359 = func.call @cc_intern(%3357, %3358) : (i64, i64) -> i64
      %3360 = func.call @cc_nil_value() : () -> i64
      %3361 = func.call @cc_cons(%3359, %3360) : (i64, i64) -> i64
      %3362 = func.call @cc_values_pack(%3361) : (i64) -> i64
      func.call @stack_push_pointer(%3359) : (i64) -> ()
      %3363 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3364 = arith.constant 1 : i64
      %3365 = func.call @cc_make_string(%3363, %3364) : (!llvm.ptr, i64) -> i64
      %3366 = func.call @cc_nil_value() : () -> i64
      %3367 = func.call @cc_intern(%3365, %3366) : (i64, i64) -> i64
      %3368 = func.call @cc_nil_value() : () -> i64
      %3369 = func.call @cc_cons(%3367, %3368) : (i64, i64) -> i64
      %3370 = func.call @cc_values_pack(%3369) : (i64) -> i64
      func.call @stack_push_pointer(%3367) : (i64) -> ()
      %3371 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3372 = arith.constant 6 : i64
      %3373 = func.call @cc_make_string(%3371, %3372) : (!llvm.ptr, i64) -> i64
      %3374 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3375 = arith.constant 11 : i64
      %3376 = func.call @cc_make_string(%3374, %3375) : (!llvm.ptr, i64) -> i64
      %3377 = func.call @cc_intern(%3373, %3376) : (i64, i64) -> i64
      %3378 = func.call @cc_nil_value() : () -> i64
      %3379 = func.call @cc_cons(%3377, %3378) : (i64, i64) -> i64
      %3380 = func.call @cc_values_pack(%3379) : (i64) -> i64
      func.call @stack_push_pointer(%3377) : (i64) -> ()
      %3381 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%3381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3382 = func.call @stack_pop_pointer() : () -> i64
      %3383 = func.call @stack_pop_pointer() : () -> i64
      %3384 = func.call @cc_cons(%3383, %3382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %3385 = arith.addi %3384, %__rlasp_stack_elide_zero_139 : i64
      %3386 = func.call @stack_pop_pointer() : () -> i64
      %3387 = func.call @cc_cons(%3386, %3385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3387) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3388 = func.call @stack_pop_pointer() : () -> i64
      %3389 = func.call @stack_pop_pointer() : () -> i64
      %3390 = func.call @cc_cons(%3389, %3388) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3391 = arith.addi %3390, %__rlasp_stack_elide_zero_140 : i64
      %3392 = func.call @stack_pop_pointer() : () -> i64
      %3393 = func.call @cc_cons(%3392, %3391) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3393) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3394 = func.call @stack_pop_pointer() : () -> i64
      %3395 = func.call @stack_pop_pointer() : () -> i64
      %3396 = func.call @cc_cons(%3395, %3394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3396) : (i64) -> ()
      %3397 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3398 = arith.constant 1 : i64
      %3399 = func.call @cc_make_string(%3397, %3398) : (!llvm.ptr, i64) -> i64
      %3400 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3401 = arith.constant 11 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      %3403 = func.call @cc_intern(%3399, %3402) : (i64, i64) -> i64
      %3404 = func.call @cc_nil_value() : () -> i64
      %3405 = func.call @cc_cons(%3403, %3404) : (i64, i64) -> i64
      %3406 = func.call @cc_values_pack(%3405) : (i64) -> i64
      func.call @stack_push_pointer(%3403) : (i64) -> ()
      %3407 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3408 = arith.constant 9 : i64
      %3409 = func.call @cc_make_string(%3407, %3408) : (!llvm.ptr, i64) -> i64
      %3410 = func.call @cc_nil_value() : () -> i64
      %3411 = func.call @cc_intern(%3409, %3410) : (i64, i64) -> i64
      %3412 = func.call @cc_nil_value() : () -> i64
      %3413 = func.call @cc_cons(%3411, %3412) : (i64, i64) -> i64
      %3414 = func.call @cc_values_pack(%3413) : (i64) -> i64
      func.call @stack_push_pointer(%3411) : (i64) -> ()
      %3415 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3416 = arith.constant 1 : i64
      %3417 = func.call @cc_make_string(%3415, %3416) : (!llvm.ptr, i64) -> i64
      %3418 = func.call @cc_nil_value() : () -> i64
      %3419 = func.call @cc_intern(%3417, %3418) : (i64, i64) -> i64
      %3420 = func.call @cc_nil_value() : () -> i64
      %3421 = func.call @cc_cons(%3419, %3420) : (i64, i64) -> i64
      %3422 = func.call @cc_values_pack(%3421) : (i64) -> i64
      func.call @stack_push_pointer(%3419) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3423 = func.call @stack_pop_pointer() : () -> i64
      %3424 = func.call @stack_pop_pointer() : () -> i64
      %3425 = func.call @cc_cons(%3424, %3423) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3426 = arith.addi %3425, %__rlasp_stack_elide_zero_141 : i64
      %3427 = func.call @stack_pop_pointer() : () -> i64
      %3428 = func.call @cc_cons(%3427, %3426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3428) : (i64) -> ()
      %3429 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3430 = arith.constant 9 : i64
      %3431 = func.call @cc_make_string(%3429, %3430) : (!llvm.ptr, i64) -> i64
      %3432 = func.call @cc_nil_value() : () -> i64
      %3433 = func.call @cc_intern(%3431, %3432) : (i64, i64) -> i64
      %3434 = func.call @cc_nil_value() : () -> i64
      %3435 = func.call @cc_cons(%3433, %3434) : (i64, i64) -> i64
      %3436 = func.call @cc_values_pack(%3435) : (i64) -> i64
      func.call @stack_push_pointer(%3433) : (i64) -> ()
      %3437 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3438 = arith.constant 1 : i64
      %3439 = func.call @cc_make_string(%3437, %3438) : (!llvm.ptr, i64) -> i64
      %3440 = func.call @cc_nil_value() : () -> i64
      %3441 = func.call @cc_intern(%3439, %3440) : (i64, i64) -> i64
      %3442 = func.call @cc_nil_value() : () -> i64
      %3443 = func.call @cc_cons(%3441, %3442) : (i64, i64) -> i64
      %3444 = func.call @cc_values_pack(%3443) : (i64) -> i64
      func.call @stack_push_pointer(%3441) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3445 = func.call @stack_pop_pointer() : () -> i64
      %3446 = func.call @stack_pop_pointer() : () -> i64
      %3447 = func.call @cc_cons(%3446, %3445) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3448 = arith.addi %3447, %__rlasp_stack_elide_zero_142 : i64
      %3449 = func.call @stack_pop_pointer() : () -> i64
      %3450 = func.call @cc_cons(%3449, %3448) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3450) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3451 = func.call @stack_pop_pointer() : () -> i64
      %3452 = func.call @stack_pop_pointer() : () -> i64
      %3453 = func.call @cc_cons(%3452, %3451) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3454 = arith.addi %3453, %__rlasp_stack_elide_zero_143 : i64
      %3455 = func.call @stack_pop_pointer() : () -> i64
      %3456 = func.call @cc_cons(%3455, %3454) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3457 = arith.addi %3456, %__rlasp_stack_elide_zero_144 : i64
      %3458 = func.call @stack_pop_pointer() : () -> i64
      %3459 = func.call @cc_cons(%3458, %3457) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3460 = func.call @stack_pop_pointer() : () -> i64
      %3461 = func.call @stack_pop_pointer() : () -> i64
      %3462 = func.call @cc_cons(%3461, %3460) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3463 = arith.addi %3462, %__rlasp_stack_elide_zero_145 : i64
      %3464 = func.call @stack_pop_pointer() : () -> i64
      %3465 = func.call @cc_cons(%3464, %3463) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3466 = arith.addi %3465, %__rlasp_stack_elide_zero_146 : i64
      %3467 = func.call @stack_pop_pointer() : () -> i64
      %3468 = func.call @cc_cons(%3467, %3466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3468) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3469 = func.call @stack_pop_pointer() : () -> i64
      %3470 = func.call @stack_pop_pointer() : () -> i64
      %3471 = func.call @cc_cons(%3470, %3469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3472 = arith.addi %3471, %__rlasp_stack_elide_zero_147 : i64
      %3473 = func.call @stack_pop_pointer() : () -> i64
      %3474 = func.call @cc_cons(%3473, %3472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3475 = func.call @stack_pop_pointer() : () -> i64
      %3476 = func.call @stack_pop_pointer() : () -> i64
      %3477 = func.call @cc_cons(%3476, %3475) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3478 = arith.addi %3477, %__rlasp_stack_elide_zero_148 : i64
      %3479 = func.call @stack_pop_pointer() : () -> i64
      %3480 = func.call @cc_cons(%3479, %3478) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3481 = arith.addi %3480, %__rlasp_stack_elide_zero_149 : i64
      %3482 = func.call @stack_pop_pointer() : () -> i64
      %3483 = func.call @cc_cons(%3482, %3481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3483) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = func.call @stack_pop_pointer() : () -> i64
      %3486 = func.call @cc_cons(%3485, %3484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3487 = arith.addi %3486, %__rlasp_stack_elide_zero_150 : i64
      %3488 = func.call @stack_pop_pointer() : () -> i64
      %3489 = func.call @cc_cons(%3488, %3487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3490 = arith.addi %3489, %__rlasp_stack_elide_zero_151 : i64
      %3591 = arith.constant 152926823645204 : i64
      %3592 = arith.constant 0 : i64
      %3593 = func.call @cc_make_closure(%3591, %3592) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3594 = arith.addi %3593, %__rlasp_stack_elide_zero_152 : i64
      %3595 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3596 = arith.constant 4 : i64
      %3597 = func.call @cc_make_string(%3595, %3596) : (!llvm.ptr, i64) -> i64
      %3598 = func.call @cc_nil_value() : () -> i64
      %3599 = func.call @cc_intern(%3597, %3598) : (i64, i64) -> i64
      %3600 = func.call @cc_nil_value() : () -> i64
      %3601 = func.call @cc_cons(%3599, %3600) : (i64, i64) -> i64
      %3602 = func.call @cc_values_pack(%3601) : (i64) -> i64
      func.call @stack_push_pointer(%3599) : (i64) -> ()
      %3603 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3604 = arith.constant 2 : i64
      %3605 = func.call @cc_make_string(%3603, %3604) : (!llvm.ptr, i64) -> i64
      %3606 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3607 = arith.constant 11 : i64
      %3608 = func.call @cc_make_string(%3606, %3607) : (!llvm.ptr, i64) -> i64
      %3609 = func.call @cc_intern(%3605, %3608) : (i64, i64) -> i64
      %3610 = func.call @cc_nil_value() : () -> i64
      %3611 = func.call @cc_cons(%3609, %3610) : (i64, i64) -> i64
      %3612 = func.call @cc_values_pack(%3611) : (i64) -> i64
      func.call @stack_push_pointer(%3609) : (i64) -> ()
      %3613 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3614 = arith.constant 22 : i64
      %3615 = func.call @cc_make_string(%3613, %3614) : (!llvm.ptr, i64) -> i64
      %3616 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3617 = arith.constant 11 : i64
      %3618 = func.call @cc_make_string(%3616, %3617) : (!llvm.ptr, i64) -> i64
      %3619 = func.call @cc_intern(%3615, %3618) : (i64, i64) -> i64
      %3620 = func.call @cc_nil_value() : () -> i64
      %3621 = func.call @cc_cons(%3619, %3620) : (i64, i64) -> i64
      %3622 = func.call @cc_values_pack(%3621) : (i64) -> i64
      func.call @stack_push_pointer(%3619) : (i64) -> ()
      %3623 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3624 = arith.constant 23 : i64
      %3625 = func.call @cc_make_string(%3623, %3624) : (!llvm.ptr, i64) -> i64
      %3626 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3627 = arith.constant 11 : i64
      %3628 = func.call @cc_make_string(%3626, %3627) : (!llvm.ptr, i64) -> i64
      %3629 = func.call @cc_intern(%3625, %3628) : (i64, i64) -> i64
      %3630 = func.call @cc_nil_value() : () -> i64
      %3631 = func.call @cc_cons(%3629, %3630) : (i64, i64) -> i64
      %3632 = func.call @cc_values_pack(%3631) : (i64) -> i64
      func.call @stack_push_pointer(%3629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3633 = func.call @stack_pop_pointer() : () -> i64
      %3634 = func.call @stack_pop_pointer() : () -> i64
      %3635 = func.call @cc_cons(%3634, %3633) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3636 = arith.addi %3635, %__rlasp_stack_elide_zero_153 : i64
      %3637 = func.call @stack_pop_pointer() : () -> i64
      %3638 = func.call @cc_cons(%3637, %3636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3639 = arith.addi %3638, %__rlasp_stack_elide_zero_154 : i64
      %3640 = func.call @stack_pop_pointer() : () -> i64
      %3641 = func.call @cc_cons(%3640, %3639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3642 = func.call @stack_pop_pointer() : () -> i64
      %3643 = func.call @stack_pop_pointer() : () -> i64
      %3644 = func.call @cc_cons(%3643, %3642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3645 = arith.addi %3644, %__rlasp_stack_elide_zero_155 : i64
      %3646 = func.call @stack_pop_pointer() : () -> i64
      %3647 = func.call @cc_cons(%3646, %3645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3648 = arith.addi %3647, %__rlasp_stack_elide_zero_156 : i64
      %3649 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3650 = arith.constant 11 : i64
      %3651 = func.call @cc_make_string(%3649, %3650) : (!llvm.ptr, i64) -> i64
      %3652 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3653 = arith.constant 7 : i64
      %3654 = func.call @cc_make_string(%3652, %3653) : (!llvm.ptr, i64) -> i64
      %3655 = func.call @cc_intern(%3651, %3654) : (i64, i64) -> i64
      %3656 = func.call @cc_nil_value() : () -> i64
      %3657 = func.call @cc_cons(%3655, %3656) : (i64, i64) -> i64
      %3658 = func.call @cc_values_pack(%3657) : (i64) -> i64
      %3659 = func.call @cc_nil_value() : () -> i64
      %3660 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3661 = arith.constant 4 : i64
      %3662 = func.call @cc_make_string(%3660, %3661) : (!llvm.ptr, i64) -> i64
      %3663 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3664 = arith.constant 7 : i64
      %3665 = func.call @cc_make_string(%3663, %3664) : (!llvm.ptr, i64) -> i64
      %3666 = func.call @cc_intern(%3662, %3665) : (i64, i64) -> i64
      %3667 = func.call @cc_nil_value() : () -> i64
      %3668 = func.call @cc_cons(%3666, %3667) : (i64, i64) -> i64
      %3669 = func.call @cc_values_pack(%3668) : (i64) -> i64
      %3670 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3671 = arith.constant 5 : i64
      %3672 = func.call @cc_make_string(%3670, %3671) : (!llvm.ptr, i64) -> i64
      %3673 = func.call @cc_nil_value() : () -> i64
      %3674 = func.call @cc_intern(%3672, %3673) : (i64, i64) -> i64
      %3675 = func.call @cc_nil_value() : () -> i64
      %3676 = func.call @cc_cons(%3674, %3675) : (i64, i64) -> i64
      %3677 = func.call @cc_values_pack(%3676) : (i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3678 = arith.addi %3674, %__rlasp_stack_elide_zero_157 : i64
      %3679 = func.call @cc_nil_value() : () -> i64
      %3680 = func.call @cc_errorp(%3328) : (i64) -> i64
      %3681 = arith.cmpi ne, %3680, %3679 : i64
      %3682 = arith.cmpi eq, %3679, %3679 : i64
      %3683 = arith.andi %3681, %3682 : i1
      %3684 = scf.if %3683 -> (i64) {
        scf.yield %3328 : i64
      } else {
        scf.yield %3679 : i64
      }
      %3685 = func.call @cc_errorp(%3490) : (i64) -> i64
      %3686 = arith.cmpi ne, %3685, %3679 : i64
      %3687 = arith.cmpi eq, %3684, %3679 : i64
      %3688 = arith.andi %3686, %3687 : i1
      %3689 = scf.if %3688 -> (i64) {
        scf.yield %3490 : i64
      } else {
        scf.yield %3684 : i64
      }
      %3690 = func.call @cc_errorp(%3594) : (i64) -> i64
      %3691 = arith.cmpi ne, %3690, %3679 : i64
      %3692 = arith.cmpi eq, %3689, %3679 : i64
      %3693 = arith.andi %3691, %3692 : i1
      %3694 = scf.if %3693 -> (i64) {
        scf.yield %3594 : i64
      } else {
        scf.yield %3689 : i64
      }
      %3695 = func.call @cc_errorp(%3648) : (i64) -> i64
      %3696 = arith.cmpi ne, %3695, %3679 : i64
      %3697 = arith.cmpi eq, %3694, %3679 : i64
      %3698 = arith.andi %3696, %3697 : i1
      %3699 = scf.if %3698 -> (i64) {
        scf.yield %3648 : i64
      } else {
        scf.yield %3694 : i64
      }
      %3700 = func.call @cc_errorp(%3655) : (i64) -> i64
      %3701 = arith.cmpi ne, %3700, %3679 : i64
      %3702 = arith.cmpi eq, %3699, %3679 : i64
      %3703 = arith.andi %3701, %3702 : i1
      %3704 = scf.if %3703 -> (i64) {
        scf.yield %3655 : i64
      } else {
        scf.yield %3699 : i64
      }
      %3705 = func.call @cc_errorp(%3659) : (i64) -> i64
      %3706 = arith.cmpi ne, %3705, %3679 : i64
      %3707 = arith.cmpi eq, %3704, %3679 : i64
      %3708 = arith.andi %3706, %3707 : i1
      %3709 = scf.if %3708 -> (i64) {
        scf.yield %3659 : i64
      } else {
        scf.yield %3704 : i64
      }
      %3710 = func.call @cc_errorp(%3666) : (i64) -> i64
      %3711 = arith.cmpi ne, %3710, %3679 : i64
      %3712 = arith.cmpi eq, %3709, %3679 : i64
      %3713 = arith.andi %3711, %3712 : i1
      %3714 = scf.if %3713 -> (i64) {
        scf.yield %3666 : i64
      } else {
        scf.yield %3709 : i64
      }
      %3715 = func.call @cc_errorp(%3678) : (i64) -> i64
      %3716 = arith.cmpi ne, %3715, %3679 : i64
      %3717 = arith.cmpi eq, %3714, %3679 : i64
      %3718 = arith.andi %3716, %3717 : i1
      %3719 = scf.if %3718 -> (i64) {
        scf.yield %3678 : i64
      } else {
        scf.yield %3714 : i64
      }
      %3720 = arith.cmpi ne, %3719, %3679 : i64
      scf.if %3720 {
        func.call @stack_push_pointer(%3719) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3328) : (i64) -> ()
        func.call @stack_push_pointer(%3490) : (i64) -> ()
        func.call @stack_push_pointer(%3594) : (i64) -> ()
        func.call @stack_push_pointer(%3648) : (i64) -> ()
        func.call @stack_push_pointer(%3655) : (i64) -> ()
        func.call @stack_push_pointer(%3659) : (i64) -> ()
        func.call @stack_push_pointer(%3666) : (i64) -> ()
        func.call @stack_push_pointer(%3678) : (i64) -> ()
        %3721 = llvm.mlir.addressof @str281 : !llvm.ptr
        %3722 = func.call @cc_make_function_ref_const(%3721) : (!llvm.ptr) -> i64
        %3723 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3722, %3723) : (i64, i64) -> ()
      }
      %3724 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3724 : i64
    }
    %3725 = func.call @cc_nil_value() : () -> i64
    %3726 = func.call @cc_errorp(%3319) : (i64) -> i64
    %3727 = arith.cmpi ne, %3726, %3725 : i64
    %3728 = scf.if %3727 -> (i64) {
      scf.yield %3319 : i64
    } else {
      %3729 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3730 = arith.constant 16 : i64
      %3731 = func.call @cc_make_string(%3729, %3730) : (!llvm.ptr, i64) -> i64
      %3732 = func.call @cc_nil_value() : () -> i64
      %3733 = func.call @cc_intern(%3731, %3732) : (i64, i64) -> i64
      %3734 = func.call @cc_nil_value() : () -> i64
      %3735 = func.call @cc_cons(%3733, %3734) : (i64, i64) -> i64
      %3736 = func.call @cc_values_pack(%3735) : (i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3737 = arith.addi %3733, %__rlasp_stack_elide_zero_158 : i64
      %3738 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3739 = arith.constant 3 : i64
      %3740 = func.call @cc_make_string(%3738, %3739) : (!llvm.ptr, i64) -> i64
      %3741 = func.call @cc_nil_value() : () -> i64
      %3742 = func.call @cc_intern(%3740, %3741) : (i64, i64) -> i64
      %3743 = func.call @cc_nil_value() : () -> i64
      %3744 = func.call @cc_cons(%3742, %3743) : (i64, i64) -> i64
      %3745 = func.call @cc_values_pack(%3744) : (i64) -> i64
      func.call @stack_push_pointer(%3742) : (i64) -> ()
      %3746 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3747 = arith.constant 3 : i64
      %3748 = func.call @cc_make_string(%3746, %3747) : (!llvm.ptr, i64) -> i64
      %3749 = func.call @cc_nil_value() : () -> i64
      %3750 = func.call @cc_intern(%3748, %3749) : (i64, i64) -> i64
      %3751 = func.call @cc_nil_value() : () -> i64
      %3752 = func.call @cc_cons(%3750, %3751) : (i64, i64) -> i64
      %3753 = func.call @cc_values_pack(%3752) : (i64) -> i64
      func.call @stack_push_pointer(%3750) : (i64) -> ()
      %3754 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3755 = arith.constant 11 : i64
      %3756 = func.call @cc_make_string(%3754, %3755) : (!llvm.ptr, i64) -> i64
      %3757 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3758 = arith.constant 3 : i64
      %3759 = func.call @cc_make_string(%3757, %3758) : (!llvm.ptr, i64) -> i64
      %3760 = func.call @cc_intern(%3756, %3759) : (i64, i64) -> i64
      %3761 = func.call @cc_nil_value() : () -> i64
      %3762 = func.call @cc_cons(%3760, %3761) : (i64, i64) -> i64
      %3763 = func.call @cc_values_pack(%3762) : (i64) -> i64
      func.call @stack_push_pointer(%3760) : (i64) -> ()
      %3764 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3765 = arith.constant 23 : i64
      %3766 = func.call @cc_make_string(%3764, %3765) : (!llvm.ptr, i64) -> i64
      %3767 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3768 = arith.constant 3 : i64
      %3769 = func.call @cc_make_string(%3767, %3768) : (!llvm.ptr, i64) -> i64
      %3770 = func.call @cc_intern(%3766, %3769) : (i64, i64) -> i64
      %3771 = func.call @cc_nil_value() : () -> i64
      %3772 = func.call @cc_cons(%3770, %3771) : (i64, i64) -> i64
      %3773 = func.call @cc_values_pack(%3772) : (i64) -> i64
      func.call @stack_push_pointer(%3770) : (i64) -> ()
      %3774 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3775 = arith.constant 7 : i64
      %3776 = func.call @cc_make_string(%3774, %3775) : (!llvm.ptr, i64) -> i64
      %3777 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3778 = arith.constant 7 : i64
      %3779 = func.call @cc_make_string(%3777, %3778) : (!llvm.ptr, i64) -> i64
      %3780 = func.call @cc_intern(%3776, %3779) : (i64, i64) -> i64
      %3781 = func.call @cc_nil_value() : () -> i64
      %3782 = func.call @cc_cons(%3780, %3781) : (i64, i64) -> i64
      %3783 = func.call @cc_values_pack(%3782) : (i64) -> i64
      func.call @stack_push_pointer(%3780) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3784 = func.call @stack_pop_pointer() : () -> i64
      %3785 = func.call @stack_pop_pointer() : () -> i64
      %3786 = func.call @cc_cons(%3785, %3784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3786) : (i64) -> ()
      %3787 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3788 = arith.constant 3 : i64
      %3789 = func.call @cc_make_string(%3787, %3788) : (!llvm.ptr, i64) -> i64
      %3790 = func.call @cc_nil_value() : () -> i64
      %3791 = func.call @cc_intern(%3789, %3790) : (i64, i64) -> i64
      %3792 = func.call @cc_nil_value() : () -> i64
      %3793 = func.call @cc_cons(%3791, %3792) : (i64, i64) -> i64
      %3794 = func.call @cc_values_pack(%3793) : (i64) -> i64
      func.call @stack_push_pointer(%3791) : (i64) -> ()
      %3795 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3796 = arith.constant 1 : i64
      %3797 = func.call @cc_make_string(%3795, %3796) : (!llvm.ptr, i64) -> i64
      %3798 = func.call @cc_nil_value() : () -> i64
      %3799 = func.call @cc_intern(%3797, %3798) : (i64, i64) -> i64
      %3800 = func.call @cc_nil_value() : () -> i64
      %3801 = func.call @cc_cons(%3799, %3800) : (i64, i64) -> i64
      %3802 = func.call @cc_values_pack(%3801) : (i64) -> i64
      func.call @stack_push_pointer(%3799) : (i64) -> ()
      %3803 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3804 = arith.constant 6 : i64
      %3805 = func.call @cc_make_string(%3803, %3804) : (!llvm.ptr, i64) -> i64
      %3806 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3807 = arith.constant 11 : i64
      %3808 = func.call @cc_make_string(%3806, %3807) : (!llvm.ptr, i64) -> i64
      %3809 = func.call @cc_intern(%3805, %3808) : (i64, i64) -> i64
      %3810 = func.call @cc_nil_value() : () -> i64
      %3811 = func.call @cc_cons(%3809, %3810) : (i64, i64) -> i64
      %3812 = func.call @cc_values_pack(%3811) : (i64) -> i64
      func.call @stack_push_pointer(%3809) : (i64) -> ()
      %3813 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%3813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3814 = func.call @stack_pop_pointer() : () -> i64
      %3815 = func.call @stack_pop_pointer() : () -> i64
      %3816 = func.call @cc_cons(%3815, %3814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3817 = arith.addi %3816, %__rlasp_stack_elide_zero_159 : i64
      %3818 = func.call @stack_pop_pointer() : () -> i64
      %3819 = func.call @cc_cons(%3818, %3817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3820 = func.call @stack_pop_pointer() : () -> i64
      %3821 = func.call @stack_pop_pointer() : () -> i64
      %3822 = func.call @cc_cons(%3821, %3820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3823 = arith.addi %3822, %__rlasp_stack_elide_zero_160 : i64
      %3824 = func.call @stack_pop_pointer() : () -> i64
      %3825 = func.call @cc_cons(%3824, %3823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3825) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3826 = func.call @stack_pop_pointer() : () -> i64
      %3827 = func.call @stack_pop_pointer() : () -> i64
      %3828 = func.call @cc_cons(%3827, %3826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3828) : (i64) -> ()
      %3829 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3830 = arith.constant 1 : i64
      %3831 = func.call @cc_make_string(%3829, %3830) : (!llvm.ptr, i64) -> i64
      %3832 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3833 = arith.constant 11 : i64
      %3834 = func.call @cc_make_string(%3832, %3833) : (!llvm.ptr, i64) -> i64
      %3835 = func.call @cc_intern(%3831, %3834) : (i64, i64) -> i64
      %3836 = func.call @cc_nil_value() : () -> i64
      %3837 = func.call @cc_cons(%3835, %3836) : (i64, i64) -> i64
      %3838 = func.call @cc_values_pack(%3837) : (i64) -> i64
      func.call @stack_push_pointer(%3835) : (i64) -> ()
      %3839 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3840 = arith.constant 9 : i64
      %3841 = func.call @cc_make_string(%3839, %3840) : (!llvm.ptr, i64) -> i64
      %3842 = func.call @cc_nil_value() : () -> i64
      %3843 = func.call @cc_intern(%3841, %3842) : (i64, i64) -> i64
      %3844 = func.call @cc_nil_value() : () -> i64
      %3845 = func.call @cc_cons(%3843, %3844) : (i64, i64) -> i64
      %3846 = func.call @cc_values_pack(%3845) : (i64) -> i64
      func.call @stack_push_pointer(%3843) : (i64) -> ()
      %3847 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3848 = arith.constant 1 : i64
      %3849 = func.call @cc_make_string(%3847, %3848) : (!llvm.ptr, i64) -> i64
      %3850 = func.call @cc_nil_value() : () -> i64
      %3851 = func.call @cc_intern(%3849, %3850) : (i64, i64) -> i64
      %3852 = func.call @cc_nil_value() : () -> i64
      %3853 = func.call @cc_cons(%3851, %3852) : (i64, i64) -> i64
      %3854 = func.call @cc_values_pack(%3853) : (i64) -> i64
      func.call @stack_push_pointer(%3851) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3855 = func.call @stack_pop_pointer() : () -> i64
      %3856 = func.call @stack_pop_pointer() : () -> i64
      %3857 = func.call @cc_cons(%3856, %3855) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3858 = arith.addi %3857, %__rlasp_stack_elide_zero_161 : i64
      %3859 = func.call @stack_pop_pointer() : () -> i64
      %3860 = func.call @cc_cons(%3859, %3858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3860) : (i64) -> ()
      %3861 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3862 = arith.constant 9 : i64
      %3863 = func.call @cc_make_string(%3861, %3862) : (!llvm.ptr, i64) -> i64
      %3864 = func.call @cc_nil_value() : () -> i64
      %3865 = func.call @cc_intern(%3863, %3864) : (i64, i64) -> i64
      %3866 = func.call @cc_nil_value() : () -> i64
      %3867 = func.call @cc_cons(%3865, %3866) : (i64, i64) -> i64
      %3868 = func.call @cc_values_pack(%3867) : (i64) -> i64
      func.call @stack_push_pointer(%3865) : (i64) -> ()
      %3869 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3870 = arith.constant 1 : i64
      %3871 = func.call @cc_make_string(%3869, %3870) : (!llvm.ptr, i64) -> i64
      %3872 = func.call @cc_nil_value() : () -> i64
      %3873 = func.call @cc_intern(%3871, %3872) : (i64, i64) -> i64
      %3874 = func.call @cc_nil_value() : () -> i64
      %3875 = func.call @cc_cons(%3873, %3874) : (i64, i64) -> i64
      %3876 = func.call @cc_values_pack(%3875) : (i64) -> i64
      func.call @stack_push_pointer(%3873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3877 = func.call @stack_pop_pointer() : () -> i64
      %3878 = func.call @stack_pop_pointer() : () -> i64
      %3879 = func.call @cc_cons(%3878, %3877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3880 = arith.addi %3879, %__rlasp_stack_elide_zero_162 : i64
      %3881 = func.call @stack_pop_pointer() : () -> i64
      %3882 = func.call @cc_cons(%3881, %3880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3883 = func.call @stack_pop_pointer() : () -> i64
      %3884 = func.call @stack_pop_pointer() : () -> i64
      %3885 = func.call @cc_cons(%3884, %3883) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3886 = arith.addi %3885, %__rlasp_stack_elide_zero_163 : i64
      %3887 = func.call @stack_pop_pointer() : () -> i64
      %3888 = func.call @cc_cons(%3887, %3886) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3889 = arith.addi %3888, %__rlasp_stack_elide_zero_164 : i64
      %3890 = func.call @stack_pop_pointer() : () -> i64
      %3891 = func.call @cc_cons(%3890, %3889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3892 = func.call @stack_pop_pointer() : () -> i64
      %3893 = func.call @stack_pop_pointer() : () -> i64
      %3894 = func.call @cc_cons(%3893, %3892) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3895 = arith.addi %3894, %__rlasp_stack_elide_zero_165 : i64
      %3896 = func.call @stack_pop_pointer() : () -> i64
      %3897 = func.call @cc_cons(%3896, %3895) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3898 = arith.addi %3897, %__rlasp_stack_elide_zero_166 : i64
      %3899 = func.call @stack_pop_pointer() : () -> i64
      %3900 = func.call @cc_cons(%3899, %3898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3900) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3901 = func.call @stack_pop_pointer() : () -> i64
      %3902 = func.call @stack_pop_pointer() : () -> i64
      %3903 = func.call @cc_cons(%3902, %3901) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3904 = arith.addi %3903, %__rlasp_stack_elide_zero_167 : i64
      %3905 = func.call @stack_pop_pointer() : () -> i64
      %3906 = func.call @cc_cons(%3905, %3904) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3907 = arith.addi %3906, %__rlasp_stack_elide_zero_168 : i64
      %3908 = func.call @stack_pop_pointer() : () -> i64
      %3909 = func.call @cc_cons(%3908, %3907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3910 = func.call @stack_pop_pointer() : () -> i64
      %3911 = func.call @stack_pop_pointer() : () -> i64
      %3912 = func.call @cc_cons(%3911, %3910) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3913 = arith.addi %3912, %__rlasp_stack_elide_zero_169 : i64
      %3914 = func.call @stack_pop_pointer() : () -> i64
      %3915 = func.call @cc_cons(%3914, %3913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3915) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3916 = func.call @stack_pop_pointer() : () -> i64
      %3917 = func.call @stack_pop_pointer() : () -> i64
      %3918 = func.call @cc_cons(%3917, %3916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3919 = arith.addi %3918, %__rlasp_stack_elide_zero_170 : i64
      %3920 = func.call @stack_pop_pointer() : () -> i64
      %3921 = func.call @cc_cons(%3920, %3919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3921) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3922 = func.call @stack_pop_pointer() : () -> i64
      %3923 = func.call @stack_pop_pointer() : () -> i64
      %3924 = func.call @cc_cons(%3923, %3922) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3925 = arith.addi %3924, %__rlasp_stack_elide_zero_171 : i64
      %3926 = func.call @stack_pop_pointer() : () -> i64
      %3927 = func.call @cc_cons(%3926, %3925) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3928 = arith.addi %3927, %__rlasp_stack_elide_zero_172 : i64
      %4003 = arith.constant 152926823645205 : i64
      %4004 = arith.constant 0 : i64
      %4005 = func.call @cc_make_closure(%4003, %4004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %4006 = arith.addi %4005, %__rlasp_stack_elide_zero_173 : i64
      %4007 = llvm.mlir.addressof @str306 : !llvm.ptr
      %4008 = arith.constant 1 : i64
      %4009 = func.call @cc_make_string(%4007, %4008) : (!llvm.ptr, i64) -> i64
      %4010 = func.call @cc_nil_value() : () -> i64
      %4011 = func.call @cc_intern(%4009, %4010) : (i64, i64) -> i64
      %4012 = func.call @cc_nil_value() : () -> i64
      %4013 = func.call @cc_cons(%4011, %4012) : (i64, i64) -> i64
      %4014 = func.call @cc_values_pack(%4013) : (i64) -> i64
      func.call @stack_push_pointer(%4011) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4015 = func.call @stack_pop_pointer() : () -> i64
      %4016 = func.call @stack_pop_pointer() : () -> i64
      %4017 = func.call @cc_cons(%4016, %4015) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %4018 = arith.addi %4017, %__rlasp_stack_elide_zero_174 : i64
      %4019 = llvm.mlir.addressof @str307 : !llvm.ptr
      %4020 = arith.constant 11 : i64
      %4021 = func.call @cc_make_string(%4019, %4020) : (!llvm.ptr, i64) -> i64
      %4022 = llvm.mlir.addressof @str308 : !llvm.ptr
      %4023 = arith.constant 7 : i64
      %4024 = func.call @cc_make_string(%4022, %4023) : (!llvm.ptr, i64) -> i64
      %4025 = func.call @cc_intern(%4021, %4024) : (i64, i64) -> i64
      %4026 = func.call @cc_nil_value() : () -> i64
      %4027 = func.call @cc_cons(%4025, %4026) : (i64, i64) -> i64
      %4028 = func.call @cc_values_pack(%4027) : (i64) -> i64
      %4029 = func.call @cc_nil_value() : () -> i64
      %4030 = llvm.mlir.addressof @str309 : !llvm.ptr
      %4031 = arith.constant 4 : i64
      %4032 = func.call @cc_make_string(%4030, %4031) : (!llvm.ptr, i64) -> i64
      %4033 = llvm.mlir.addressof @str310 : !llvm.ptr
      %4034 = arith.constant 7 : i64
      %4035 = func.call @cc_make_string(%4033, %4034) : (!llvm.ptr, i64) -> i64
      %4036 = func.call @cc_intern(%4032, %4035) : (i64, i64) -> i64
      %4037 = func.call @cc_nil_value() : () -> i64
      %4038 = func.call @cc_cons(%4036, %4037) : (i64, i64) -> i64
      %4039 = func.call @cc_values_pack(%4038) : (i64) -> i64
      %4040 = llvm.mlir.addressof @str311 : !llvm.ptr
      %4041 = arith.constant 6 : i64
      %4042 = func.call @cc_make_string(%4040, %4041) : (!llvm.ptr, i64) -> i64
      %4043 = func.call @cc_nil_value() : () -> i64
      %4044 = func.call @cc_intern(%4042, %4043) : (i64, i64) -> i64
      %4045 = func.call @cc_nil_value() : () -> i64
      %4046 = func.call @cc_cons(%4044, %4045) : (i64, i64) -> i64
      %4047 = func.call @cc_values_pack(%4046) : (i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %4048 = arith.addi %4044, %__rlasp_stack_elide_zero_175 : i64
      %4049 = func.call @cc_nil_value() : () -> i64
      %4050 = func.call @cc_errorp(%3737) : (i64) -> i64
      %4051 = arith.cmpi ne, %4050, %4049 : i64
      %4052 = arith.cmpi eq, %4049, %4049 : i64
      %4053 = arith.andi %4051, %4052 : i1
      %4054 = scf.if %4053 -> (i64) {
        scf.yield %3737 : i64
      } else {
        scf.yield %4049 : i64
      }
      %4055 = func.call @cc_errorp(%3928) : (i64) -> i64
      %4056 = arith.cmpi ne, %4055, %4049 : i64
      %4057 = arith.cmpi eq, %4054, %4049 : i64
      %4058 = arith.andi %4056, %4057 : i1
      %4059 = scf.if %4058 -> (i64) {
        scf.yield %3928 : i64
      } else {
        scf.yield %4054 : i64
      }
      %4060 = func.call @cc_errorp(%4006) : (i64) -> i64
      %4061 = arith.cmpi ne, %4060, %4049 : i64
      %4062 = arith.cmpi eq, %4059, %4049 : i64
      %4063 = arith.andi %4061, %4062 : i1
      %4064 = scf.if %4063 -> (i64) {
        scf.yield %4006 : i64
      } else {
        scf.yield %4059 : i64
      }
      %4065 = func.call @cc_errorp(%4018) : (i64) -> i64
      %4066 = arith.cmpi ne, %4065, %4049 : i64
      %4067 = arith.cmpi eq, %4064, %4049 : i64
      %4068 = arith.andi %4066, %4067 : i1
      %4069 = scf.if %4068 -> (i64) {
        scf.yield %4018 : i64
      } else {
        scf.yield %4064 : i64
      }
      %4070 = func.call @cc_errorp(%4025) : (i64) -> i64
      %4071 = arith.cmpi ne, %4070, %4049 : i64
      %4072 = arith.cmpi eq, %4069, %4049 : i64
      %4073 = arith.andi %4071, %4072 : i1
      %4074 = scf.if %4073 -> (i64) {
        scf.yield %4025 : i64
      } else {
        scf.yield %4069 : i64
      }
      %4075 = func.call @cc_errorp(%4029) : (i64) -> i64
      %4076 = arith.cmpi ne, %4075, %4049 : i64
      %4077 = arith.cmpi eq, %4074, %4049 : i64
      %4078 = arith.andi %4076, %4077 : i1
      %4079 = scf.if %4078 -> (i64) {
        scf.yield %4029 : i64
      } else {
        scf.yield %4074 : i64
      }
      %4080 = func.call @cc_errorp(%4036) : (i64) -> i64
      %4081 = arith.cmpi ne, %4080, %4049 : i64
      %4082 = arith.cmpi eq, %4079, %4049 : i64
      %4083 = arith.andi %4081, %4082 : i1
      %4084 = scf.if %4083 -> (i64) {
        scf.yield %4036 : i64
      } else {
        scf.yield %4079 : i64
      }
      %4085 = func.call @cc_errorp(%4048) : (i64) -> i64
      %4086 = arith.cmpi ne, %4085, %4049 : i64
      %4087 = arith.cmpi eq, %4084, %4049 : i64
      %4088 = arith.andi %4086, %4087 : i1
      %4089 = scf.if %4088 -> (i64) {
        scf.yield %4048 : i64
      } else {
        scf.yield %4084 : i64
      }
      %4090 = arith.cmpi ne, %4089, %4049 : i64
      scf.if %4090 {
        func.call @stack_push_pointer(%4089) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3737) : (i64) -> ()
        func.call @stack_push_pointer(%3928) : (i64) -> ()
        func.call @stack_push_pointer(%4006) : (i64) -> ()
        func.call @stack_push_pointer(%4018) : (i64) -> ()
        func.call @stack_push_pointer(%4025) : (i64) -> ()
        func.call @stack_push_pointer(%4029) : (i64) -> ()
        func.call @stack_push_pointer(%4036) : (i64) -> ()
        func.call @stack_push_pointer(%4048) : (i64) -> ()
        %4091 = llvm.mlir.addressof @str312 : !llvm.ptr
        %4092 = func.call @cc_make_function_ref_const(%4091) : (!llvm.ptr) -> i64
        %4093 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4092, %4093) : (i64, i64) -> ()
      }
      %4094 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4094 : i64
    }
    %4095 = func.call @cc_nil_value() : () -> i64
    %4096 = func.call @cc_errorp(%3728) : (i64) -> i64
    %4097 = arith.cmpi ne, %4096, %4095 : i64
    %4098 = scf.if %4097 -> (i64) {
      scf.yield %3728 : i64
    } else {
      %4099 = llvm.mlir.addressof @str313 : !llvm.ptr
      %4100 = arith.constant 16 : i64
      %4101 = func.call @cc_make_string(%4099, %4100) : (!llvm.ptr, i64) -> i64
      %4102 = func.call @cc_nil_value() : () -> i64
      %4103 = func.call @cc_intern(%4101, %4102) : (i64, i64) -> i64
      %4104 = func.call @cc_nil_value() : () -> i64
      %4105 = func.call @cc_cons(%4103, %4104) : (i64, i64) -> i64
      %4106 = func.call @cc_values_pack(%4105) : (i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %4107 = arith.addi %4103, %__rlasp_stack_elide_zero_176 : i64
      %4108 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4109 = arith.constant 13 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4112 = arith.constant 11 : i64
      %4113 = func.call @cc_make_string(%4111, %4112) : (!llvm.ptr, i64) -> i64
      %4114 = func.call @cc_intern(%4110, %4113) : (i64, i64) -> i64
      %4115 = func.call @cc_nil_value() : () -> i64
      %4116 = func.call @cc_cons(%4114, %4115) : (i64, i64) -> i64
      %4117 = func.call @cc_values_pack(%4116) : (i64) -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4118 = llvm.mlir.addressof @str316 : !llvm.ptr
      %4119 = arith.constant 6 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = func.call @cc_nil_value() : () -> i64
      %4122 = func.call @cc_intern(%4120, %4121) : (i64, i64) -> i64
      %4123 = func.call @cc_nil_value() : () -> i64
      %4124 = func.call @cc_cons(%4122, %4123) : (i64, i64) -> i64
      %4125 = func.call @cc_values_pack(%4124) : (i64) -> i64
      func.call @stack_push_pointer(%4122) : (i64) -> ()
      %4126 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4127 = arith.constant 19 : i64
      %4128 = func.call @cc_make_string(%4126, %4127) : (!llvm.ptr, i64) -> i64
      %4129 = func.call @cc_nil_value() : () -> i64
      %4130 = func.call @cc_intern(%4128, %4129) : (i64, i64) -> i64
      %4131 = func.call @cc_nil_value() : () -> i64
      %4132 = func.call @cc_cons(%4130, %4131) : (i64, i64) -> i64
      %4133 = func.call @cc_values_pack(%4132) : (i64) -> i64
      func.call @stack_push_pointer(%4130) : (i64) -> ()
      %4134 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4135 = arith.constant 3 : i64
      %4136 = func.call @cc_make_string(%4134, %4135) : (!llvm.ptr, i64) -> i64
      %4137 = func.call @cc_nil_value() : () -> i64
      %4138 = func.call @cc_intern(%4136, %4137) : (i64, i64) -> i64
      %4139 = func.call @cc_nil_value() : () -> i64
      %4140 = func.call @cc_cons(%4138, %4139) : (i64, i64) -> i64
      %4141 = func.call @cc_values_pack(%4140) : (i64) -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4142 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4143 = arith.constant 1 : i64
      %4144 = func.call @cc_make_string(%4142, %4143) : (!llvm.ptr, i64) -> i64
      %4145 = func.call @cc_nil_value() : () -> i64
      %4146 = func.call @cc_intern(%4144, %4145) : (i64, i64) -> i64
      %4147 = func.call @cc_nil_value() : () -> i64
      %4148 = func.call @cc_cons(%4146, %4147) : (i64, i64) -> i64
      %4149 = func.call @cc_values_pack(%4148) : (i64) -> i64
      func.call @stack_push_pointer(%4146) : (i64) -> ()
      %4150 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4151 = arith.constant 6 : i64
      %4152 = func.call @cc_make_string(%4150, %4151) : (!llvm.ptr, i64) -> i64
      %4153 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4154 = arith.constant 11 : i64
      %4155 = func.call @cc_make_string(%4153, %4154) : (!llvm.ptr, i64) -> i64
      %4156 = func.call @cc_intern(%4152, %4155) : (i64, i64) -> i64
      %4157 = func.call @cc_nil_value() : () -> i64
      %4158 = func.call @cc_cons(%4156, %4157) : (i64, i64) -> i64
      %4159 = func.call @cc_values_pack(%4158) : (i64) -> i64
      func.call @stack_push_pointer(%4156) : (i64) -> ()
      %4160 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%4160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4161 = func.call @stack_pop_pointer() : () -> i64
      %4162 = func.call @stack_pop_pointer() : () -> i64
      %4163 = func.call @cc_cons(%4162, %4161) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %4164 = arith.addi %4163, %__rlasp_stack_elide_zero_177 : i64
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @cc_cons(%4165, %4164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4166) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4167 = func.call @stack_pop_pointer() : () -> i64
      %4168 = func.call @stack_pop_pointer() : () -> i64
      %4169 = func.call @cc_cons(%4168, %4167) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %4170 = arith.addi %4169, %__rlasp_stack_elide_zero_178 : i64
      %4171 = func.call @stack_pop_pointer() : () -> i64
      %4172 = func.call @cc_cons(%4171, %4170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4172) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4173 = func.call @stack_pop_pointer() : () -> i64
      %4174 = func.call @stack_pop_pointer() : () -> i64
      %4175 = func.call @cc_cons(%4174, %4173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4175) : (i64) -> ()
      %4176 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4177 = arith.constant 1 : i64
      %4178 = func.call @cc_make_string(%4176, %4177) : (!llvm.ptr, i64) -> i64
      %4179 = llvm.mlir.addressof @str323 : !llvm.ptr
      %4180 = arith.constant 11 : i64
      %4181 = func.call @cc_make_string(%4179, %4180) : (!llvm.ptr, i64) -> i64
      %4182 = func.call @cc_intern(%4178, %4181) : (i64, i64) -> i64
      %4183 = func.call @cc_nil_value() : () -> i64
      %4184 = func.call @cc_cons(%4182, %4183) : (i64, i64) -> i64
      %4185 = func.call @cc_values_pack(%4184) : (i64) -> i64
      func.call @stack_push_pointer(%4182) : (i64) -> ()
      %4186 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4187 = arith.constant 9 : i64
      %4188 = func.call @cc_make_string(%4186, %4187) : (!llvm.ptr, i64) -> i64
      %4189 = func.call @cc_nil_value() : () -> i64
      %4190 = func.call @cc_intern(%4188, %4189) : (i64, i64) -> i64
      %4191 = func.call @cc_nil_value() : () -> i64
      %4192 = func.call @cc_cons(%4190, %4191) : (i64, i64) -> i64
      %4193 = func.call @cc_values_pack(%4192) : (i64) -> i64
      func.call @stack_push_pointer(%4190) : (i64) -> ()
      %4194 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4195 = arith.constant 1 : i64
      %4196 = func.call @cc_make_string(%4194, %4195) : (!llvm.ptr, i64) -> i64
      %4197 = func.call @cc_nil_value() : () -> i64
      %4198 = func.call @cc_intern(%4196, %4197) : (i64, i64) -> i64
      %4199 = func.call @cc_nil_value() : () -> i64
      %4200 = func.call @cc_cons(%4198, %4199) : (i64, i64) -> i64
      %4201 = func.call @cc_values_pack(%4200) : (i64) -> i64
      func.call @stack_push_pointer(%4198) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4202 = func.call @stack_pop_pointer() : () -> i64
      %4203 = func.call @stack_pop_pointer() : () -> i64
      %4204 = func.call @cc_cons(%4203, %4202) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %4205 = arith.addi %4204, %__rlasp_stack_elide_zero_179 : i64
      %4206 = func.call @stack_pop_pointer() : () -> i64
      %4207 = func.call @cc_cons(%4206, %4205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4207) : (i64) -> ()
      %4208 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4209 = arith.constant 9 : i64
      %4210 = func.call @cc_make_string(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = func.call @cc_nil_value() : () -> i64
      %4212 = func.call @cc_intern(%4210, %4211) : (i64, i64) -> i64
      %4213 = func.call @cc_nil_value() : () -> i64
      %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
      %4215 = func.call @cc_values_pack(%4214) : (i64) -> i64
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4216 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4217 = arith.constant 1 : i64
      %4218 = func.call @cc_make_string(%4216, %4217) : (!llvm.ptr, i64) -> i64
      %4219 = func.call @cc_nil_value() : () -> i64
      %4220 = func.call @cc_intern(%4218, %4219) : (i64, i64) -> i64
      %4221 = func.call @cc_nil_value() : () -> i64
      %4222 = func.call @cc_cons(%4220, %4221) : (i64, i64) -> i64
      %4223 = func.call @cc_values_pack(%4222) : (i64) -> i64
      func.call @stack_push_pointer(%4220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4224 = func.call @stack_pop_pointer() : () -> i64
      %4225 = func.call @stack_pop_pointer() : () -> i64
      %4226 = func.call @cc_cons(%4225, %4224) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %4227 = arith.addi %4226, %__rlasp_stack_elide_zero_180 : i64
      %4228 = func.call @stack_pop_pointer() : () -> i64
      %4229 = func.call @cc_cons(%4228, %4227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4230 = func.call @stack_pop_pointer() : () -> i64
      %4231 = func.call @stack_pop_pointer() : () -> i64
      %4232 = func.call @cc_cons(%4231, %4230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %4233 = arith.addi %4232, %__rlasp_stack_elide_zero_181 : i64
      %4234 = func.call @stack_pop_pointer() : () -> i64
      %4235 = func.call @cc_cons(%4234, %4233) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %4236 = arith.addi %4235, %__rlasp_stack_elide_zero_182 : i64
      %4237 = func.call @stack_pop_pointer() : () -> i64
      %4238 = func.call @cc_cons(%4237, %4236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4239 = func.call @stack_pop_pointer() : () -> i64
      %4240 = func.call @stack_pop_pointer() : () -> i64
      %4241 = func.call @cc_cons(%4240, %4239) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %4242 = arith.addi %4241, %__rlasp_stack_elide_zero_183 : i64
      %4243 = func.call @stack_pop_pointer() : () -> i64
      %4244 = func.call @cc_cons(%4243, %4242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %4245 = arith.addi %4244, %__rlasp_stack_elide_zero_184 : i64
      %4246 = func.call @stack_pop_pointer() : () -> i64
      %4247 = func.call @cc_cons(%4246, %4245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4247) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4248 = func.call @stack_pop_pointer() : () -> i64
      %4249 = func.call @stack_pop_pointer() : () -> i64
      %4250 = func.call @cc_cons(%4249, %4248) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %4251 = arith.addi %4250, %__rlasp_stack_elide_zero_185 : i64
      %4252 = func.call @stack_pop_pointer() : () -> i64
      %4253 = func.call @cc_cons(%4252, %4251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4253) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4254 = func.call @stack_pop_pointer() : () -> i64
      %4255 = func.call @stack_pop_pointer() : () -> i64
      %4256 = func.call @cc_cons(%4255, %4254) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %4257 = arith.addi %4256, %__rlasp_stack_elide_zero_186 : i64
      %4258 = func.call @stack_pop_pointer() : () -> i64
      %4259 = func.call @cc_cons(%4258, %4257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %4260 = arith.addi %4259, %__rlasp_stack_elide_zero_187 : i64
      %4261 = func.call @stack_pop_pointer() : () -> i64
      %4262 = func.call @cc_cons(%4261, %4260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4262) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4263 = func.call @stack_pop_pointer() : () -> i64
      %4264 = func.call @stack_pop_pointer() : () -> i64
      %4265 = func.call @cc_cons(%4264, %4263) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %4266 = arith.addi %4265, %__rlasp_stack_elide_zero_188 : i64
      %4267 = func.call @stack_pop_pointer() : () -> i64
      %4268 = func.call @cc_cons(%4267, %4266) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %4269 = arith.addi %4268, %__rlasp_stack_elide_zero_189 : i64
      %4346 = arith.constant 152926823645206 : i64
      %4347 = arith.constant 0 : i64
      %4348 = func.call @cc_make_closure(%4346, %4347) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %4349 = arith.addi %4348, %__rlasp_stack_elide_zero_190 : i64
      %4350 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4351 = arith.constant 4 : i64
      %4352 = func.call @cc_make_string(%4350, %4351) : (!llvm.ptr, i64) -> i64
      %4353 = func.call @cc_nil_value() : () -> i64
      %4354 = func.call @cc_intern(%4352, %4353) : (i64, i64) -> i64
      %4355 = func.call @cc_nil_value() : () -> i64
      %4356 = func.call @cc_cons(%4354, %4355) : (i64, i64) -> i64
      %4357 = func.call @cc_values_pack(%4356) : (i64) -> i64
      func.call @stack_push_pointer(%4354) : (i64) -> ()
      %4358 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4359 = arith.constant 2 : i64
      %4360 = func.call @cc_make_string(%4358, %4359) : (!llvm.ptr, i64) -> i64
      %4361 = llvm.mlir.addressof @str332 : !llvm.ptr
      %4362 = arith.constant 11 : i64
      %4363 = func.call @cc_make_string(%4361, %4362) : (!llvm.ptr, i64) -> i64
      %4364 = func.call @cc_intern(%4360, %4363) : (i64, i64) -> i64
      %4365 = func.call @cc_nil_value() : () -> i64
      %4366 = func.call @cc_cons(%4364, %4365) : (i64, i64) -> i64
      %4367 = func.call @cc_values_pack(%4366) : (i64) -> i64
      func.call @stack_push_pointer(%4364) : (i64) -> ()
      %4368 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4369 = arith.constant 22 : i64
      %4370 = func.call @cc_make_string(%4368, %4369) : (!llvm.ptr, i64) -> i64
      %4371 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4372 = arith.constant 11 : i64
      %4373 = func.call @cc_make_string(%4371, %4372) : (!llvm.ptr, i64) -> i64
      %4374 = func.call @cc_intern(%4370, %4373) : (i64, i64) -> i64
      %4375 = func.call @cc_nil_value() : () -> i64
      %4376 = func.call @cc_cons(%4374, %4375) : (i64, i64) -> i64
      %4377 = func.call @cc_values_pack(%4376) : (i64) -> i64
      func.call @stack_push_pointer(%4374) : (i64) -> ()
      %4378 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4379 = arith.constant 32 : i64
      %4380 = func.call @cc_make_string(%4378, %4379) : (!llvm.ptr, i64) -> i64
      %4381 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4382 = arith.constant 11 : i64
      %4383 = func.call @cc_make_string(%4381, %4382) : (!llvm.ptr, i64) -> i64
      %4384 = func.call @cc_intern(%4380, %4383) : (i64, i64) -> i64
      %4385 = func.call @cc_nil_value() : () -> i64
      %4386 = func.call @cc_cons(%4384, %4385) : (i64, i64) -> i64
      %4387 = func.call @cc_values_pack(%4386) : (i64) -> i64
      func.call @stack_push_pointer(%4384) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4388 = func.call @stack_pop_pointer() : () -> i64
      %4389 = func.call @stack_pop_pointer() : () -> i64
      %4390 = func.call @cc_cons(%4389, %4388) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %4391 = arith.addi %4390, %__rlasp_stack_elide_zero_191 : i64
      %4392 = func.call @stack_pop_pointer() : () -> i64
      %4393 = func.call @cc_cons(%4392, %4391) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %4394 = arith.addi %4393, %__rlasp_stack_elide_zero_192 : i64
      %4395 = func.call @stack_pop_pointer() : () -> i64
      %4396 = func.call @cc_cons(%4395, %4394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4396) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4397 = func.call @stack_pop_pointer() : () -> i64
      %4398 = func.call @stack_pop_pointer() : () -> i64
      %4399 = func.call @cc_cons(%4398, %4397) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %4400 = arith.addi %4399, %__rlasp_stack_elide_zero_193 : i64
      %4401 = func.call @stack_pop_pointer() : () -> i64
      %4402 = func.call @cc_cons(%4401, %4400) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %4403 = arith.addi %4402, %__rlasp_stack_elide_zero_194 : i64
      %4404 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4405 = arith.constant 11 : i64
      %4406 = func.call @cc_make_string(%4404, %4405) : (!llvm.ptr, i64) -> i64
      %4407 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4408 = arith.constant 7 : i64
      %4409 = func.call @cc_make_string(%4407, %4408) : (!llvm.ptr, i64) -> i64
      %4410 = func.call @cc_intern(%4406, %4409) : (i64, i64) -> i64
      %4411 = func.call @cc_nil_value() : () -> i64
      %4412 = func.call @cc_cons(%4410, %4411) : (i64, i64) -> i64
      %4413 = func.call @cc_values_pack(%4412) : (i64) -> i64
      %4414 = func.call @cc_nil_value() : () -> i64
      %4415 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4416 = arith.constant 4 : i64
      %4417 = func.call @cc_make_string(%4415, %4416) : (!llvm.ptr, i64) -> i64
      %4418 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4419 = arith.constant 7 : i64
      %4420 = func.call @cc_make_string(%4418, %4419) : (!llvm.ptr, i64) -> i64
      %4421 = func.call @cc_intern(%4417, %4420) : (i64, i64) -> i64
      %4422 = func.call @cc_nil_value() : () -> i64
      %4423 = func.call @cc_cons(%4421, %4422) : (i64, i64) -> i64
      %4424 = func.call @cc_values_pack(%4423) : (i64) -> i64
      %4425 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4426 = arith.constant 5 : i64
      %4427 = func.call @cc_make_string(%4425, %4426) : (!llvm.ptr, i64) -> i64
      %4428 = func.call @cc_nil_value() : () -> i64
      %4429 = func.call @cc_intern(%4427, %4428) : (i64, i64) -> i64
      %4430 = func.call @cc_nil_value() : () -> i64
      %4431 = func.call @cc_cons(%4429, %4430) : (i64, i64) -> i64
      %4432 = func.call @cc_values_pack(%4431) : (i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %4433 = arith.addi %4429, %__rlasp_stack_elide_zero_195 : i64
      %4434 = func.call @cc_nil_value() : () -> i64
      %4435 = func.call @cc_errorp(%4107) : (i64) -> i64
      %4436 = arith.cmpi ne, %4435, %4434 : i64
      %4437 = arith.cmpi eq, %4434, %4434 : i64
      %4438 = arith.andi %4436, %4437 : i1
      %4439 = scf.if %4438 -> (i64) {
        scf.yield %4107 : i64
      } else {
        scf.yield %4434 : i64
      }
      %4440 = func.call @cc_errorp(%4269) : (i64) -> i64
      %4441 = arith.cmpi ne, %4440, %4434 : i64
      %4442 = arith.cmpi eq, %4439, %4434 : i64
      %4443 = arith.andi %4441, %4442 : i1
      %4444 = scf.if %4443 -> (i64) {
        scf.yield %4269 : i64
      } else {
        scf.yield %4439 : i64
      }
      %4445 = func.call @cc_errorp(%4349) : (i64) -> i64
      %4446 = arith.cmpi ne, %4445, %4434 : i64
      %4447 = arith.cmpi eq, %4444, %4434 : i64
      %4448 = arith.andi %4446, %4447 : i1
      %4449 = scf.if %4448 -> (i64) {
        scf.yield %4349 : i64
      } else {
        scf.yield %4444 : i64
      }
      %4450 = func.call @cc_errorp(%4403) : (i64) -> i64
      %4451 = arith.cmpi ne, %4450, %4434 : i64
      %4452 = arith.cmpi eq, %4449, %4434 : i64
      %4453 = arith.andi %4451, %4452 : i1
      %4454 = scf.if %4453 -> (i64) {
        scf.yield %4403 : i64
      } else {
        scf.yield %4449 : i64
      }
      %4455 = func.call @cc_errorp(%4410) : (i64) -> i64
      %4456 = arith.cmpi ne, %4455, %4434 : i64
      %4457 = arith.cmpi eq, %4454, %4434 : i64
      %4458 = arith.andi %4456, %4457 : i1
      %4459 = scf.if %4458 -> (i64) {
        scf.yield %4410 : i64
      } else {
        scf.yield %4454 : i64
      }
      %4460 = func.call @cc_errorp(%4414) : (i64) -> i64
      %4461 = arith.cmpi ne, %4460, %4434 : i64
      %4462 = arith.cmpi eq, %4459, %4434 : i64
      %4463 = arith.andi %4461, %4462 : i1
      %4464 = scf.if %4463 -> (i64) {
        scf.yield %4414 : i64
      } else {
        scf.yield %4459 : i64
      }
      %4465 = func.call @cc_errorp(%4421) : (i64) -> i64
      %4466 = arith.cmpi ne, %4465, %4434 : i64
      %4467 = arith.cmpi eq, %4464, %4434 : i64
      %4468 = arith.andi %4466, %4467 : i1
      %4469 = scf.if %4468 -> (i64) {
        scf.yield %4421 : i64
      } else {
        scf.yield %4464 : i64
      }
      %4470 = func.call @cc_errorp(%4433) : (i64) -> i64
      %4471 = arith.cmpi ne, %4470, %4434 : i64
      %4472 = arith.cmpi eq, %4469, %4434 : i64
      %4473 = arith.andi %4471, %4472 : i1
      %4474 = scf.if %4473 -> (i64) {
        scf.yield %4433 : i64
      } else {
        scf.yield %4469 : i64
      }
      %4475 = arith.cmpi ne, %4474, %4434 : i64
      scf.if %4475 {
        func.call @stack_push_pointer(%4474) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4107) : (i64) -> ()
        func.call @stack_push_pointer(%4269) : (i64) -> ()
        func.call @stack_push_pointer(%4349) : (i64) -> ()
        func.call @stack_push_pointer(%4403) : (i64) -> ()
        func.call @stack_push_pointer(%4410) : (i64) -> ()
        func.call @stack_push_pointer(%4414) : (i64) -> ()
        func.call @stack_push_pointer(%4421) : (i64) -> ()
        func.call @stack_push_pointer(%4433) : (i64) -> ()
        %4476 = llvm.mlir.addressof @str342 : !llvm.ptr
        %4477 = func.call @cc_make_function_ref_const(%4476) : (!llvm.ptr) -> i64
        %4478 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4477, %4478) : (i64, i64) -> ()
      }
      %4479 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4479 : i64
    }
    %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
    %4480 = arith.addi %4098, %__rlasp_stack_elide_zero_196 : i64
    %4481 = func.call @cc_multiple_value_list(%4480) : (i64) -> i64
    %4482 = llvm.mlir.addressof @str343 : !llvm.ptr
    %4483 = arith.constant 38 : i64
    %4484 = func.call @cc_make_string(%4482, %4483) : (!llvm.ptr, i64) -> i64
    %4485 = func.call @cc_nil_value() : () -> i64
    %4486 = func.call @cc_intern(%4484, %4485) : (i64, i64) -> i64
    %4487 = func.call @cc_nil_value() : () -> i64
    %4488 = func.call @cc_cons(%4486, %4487) : (i64, i64) -> i64
    %4489 = func.call @cc_values_pack(%4488) : (i64) -> i64
    %4490 = func.call @cc_symbol_value(%4486) : (i64) -> i64
    %4491 = llvm.mlir.addressof @str344 : !llvm.ptr
    %4492 = arith.constant 40 : i64
    %4493 = func.call @cc_make_string(%4491, %4492) : (!llvm.ptr, i64) -> i64
    %4494 = func.call @cc_nil_value() : () -> i64
    %4495 = func.call @cc_intern(%4493, %4494) : (i64, i64) -> i64
    %4496 = func.call @cc_nil_value() : () -> i64
    %4497 = func.call @cc_cons(%4495, %4496) : (i64, i64) -> i64
    %4498 = func.call @cc_values_pack(%4497) : (i64) -> i64
    %4499 = func.call @cc_symbol_value(%4495) : (i64) -> i64
    %4500 = func.call @cc_nil_value() : () -> i64
    %4501 = arith.cmpi ne, %4490, %4500 : i64
    %4502 = scf.if %4501 -> (i64) {
      scf.yield %4499 : i64
    } else {
      scf.yield %4481 : i64
    }
    %4503 = func.call @cc_values_pack(%4502) : (i64) -> i64
    func.call @stack_push_pointer(%4503) : (i64) -> ()
    func.return
  }
  func.func @"local_foo_152926823645192"() {
    %1147 = llvm.mlir.addressof @str90 : !llvm.ptr
    %1148 = arith.constant 25 : i64
    %1149 = func.call @cc_make_string(%1147, %1148) : (!llvm.ptr, i64) -> i64
    %1150 = func.call @cc_nil_value() : () -> i64
    %1151 = func.call @cc_intern(%1149, %1150) : (i64, i64) -> i64
    %1152 = func.call @cc_nil_value() : () -> i64
    %1153 = func.call @cc_cons(%1151, %1152) : (i64, i64) -> i64
    %1154 = func.call @cc_values_pack(%1153) : (i64) -> i64
    %1155 = func.call @cc_nil_value() : () -> i64
    %1156 = llvm.mlir.addressof @str91 : !llvm.ptr
    %1157 = arith.constant 38 : i64
    %1158 = func.call @cc_make_string(%1156, %1157) : (!llvm.ptr, i64) -> i64
    %1159 = func.call @cc_nil_value() : () -> i64
    %1160 = func.call @cc_intern(%1158, %1159) : (i64, i64) -> i64
    %1161 = func.call @cc_nil_value() : () -> i64
    %1162 = func.call @cc_cons(%1160, %1161) : (i64, i64) -> i64
    %1163 = func.call @cc_values_pack(%1162) : (i64) -> i64
    %1164 = func.call @cc_set_symbol_value(%1160, %1155) : (i64, i64) -> i64
    %1165 = llvm.mlir.addressof @str92 : !llvm.ptr
    %1166 = arith.constant 39 : i64
    %1167 = func.call @cc_make_string(%1165, %1166) : (!llvm.ptr, i64) -> i64
    %1168 = func.call @cc_nil_value() : () -> i64
    %1169 = func.call @cc_intern(%1167, %1168) : (i64, i64) -> i64
    %1170 = func.call @cc_nil_value() : () -> i64
    %1171 = func.call @cc_cons(%1169, %1170) : (i64, i64) -> i64
    %1172 = func.call @cc_values_pack(%1171) : (i64) -> i64
    %1173 = func.call @cc_set_symbol_value(%1169, %1155) : (i64, i64) -> i64
    %1174 = llvm.mlir.addressof @str93 : !llvm.ptr
    %1175 = arith.constant 40 : i64
    %1176 = func.call @cc_make_string(%1174, %1175) : (!llvm.ptr, i64) -> i64
    %1177 = func.call @cc_nil_value() : () -> i64
    %1178 = func.call @cc_intern(%1176, %1177) : (i64, i64) -> i64
    %1179 = func.call @cc_nil_value() : () -> i64
    %1180 = func.call @cc_cons(%1178, %1179) : (i64, i64) -> i64
    %1181 = func.call @cc_values_pack(%1180) : (i64) -> i64
    %1182 = func.call @cc_set_symbol_value(%1178, %1155) : (i64, i64) -> i64
    %1183 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%1183) : (i64) -> ()
    %1184 = func.call @stack_pop_pointer() : () -> i64
    %1185 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%1185) : (i64) -> ()
    %1186 = func.call @stack_pop_pointer() : () -> i64
    %1187 = func.call @cc_random(%1186) : (i64) -> i64
    %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
    %1188 = arith.addi %1187, %__rlasp_stack_elide_zero_197 : i64
    %1189 = arith.constant 1 : i1
    %1191 = arith.constant 3 : i64
    %1190 = arith.andi %1184, %1191 : i64
    %1192 = arith.constant 0 : i64
    %1193 = arith.cmpi eq, %1190, %1192 : i64
    %1195 = arith.constant 3 : i64
    %1194 = arith.andi %1188, %1195 : i64
    %1196 = arith.constant 0 : i64
    %1197 = arith.cmpi eq, %1194, %1196 : i64
    %1198 = arith.andi %1193, %1197 : i1
    %1199 = scf.if %1198 -> (i1) {
      %1200 = arith.constant 2 : i64
      %1201 = arith.shrsi %1184, %1200 : i64
      %1202 = arith.constant 2 : i64
      %1203 = arith.shrsi %1188, %1202 : i64
      %1204 = arith.cmpi sgt, %1201, %1203 : i64
      scf.yield %1204 : i1
    } else {
      %1205 = func.call @cc_gt(%1184, %1188) : (i64, i64) -> i64
      %1206 = func.call @cc_nil_value() : () -> i64
      %1207 = arith.cmpi ne, %1205, %1206 : i64
      scf.yield %1207 : i1
    }
    %1208 = arith.andi %1189, %1199 : i1
    %1209 = func.call @cc_nil_value() : () -> i64
    %1210 = func.call @cc_t_value() : () -> i64
    %1211 = scf.if %1208 -> (i64) {
      scf.yield %1210 : i64
    } else {
      scf.yield %1209 : i64
    }
    %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
    %1212 = arith.addi %1211, %__rlasp_stack_elide_zero_198 : i64
    %1213 = func.call @cc_nil_value() : () -> i64
    %1214 = arith.cmpi ne, %1212, %1213 : i64
    scf.if %1214 {
      %1215 = arith.constant 0.0 : f64
      %1216 = func.call @cc_box_single_float(%1215) : (f64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
    } else {
      %1217 = arith.constant 0.0 : f64
      %1218 = func.call @cc_box_single_float(%1217) : (f64) -> i64
      func.call @stack_push_pointer(%1218) : (i64) -> ()
    }
    %1219 = func.call @stack_pop_pointer() : () -> i64
    %1220 = func.call @cc_multiple_value_list(%1219) : (i64) -> i64
    %1221 = llvm.mlir.addressof @str94 : !llvm.ptr
    %1222 = arith.constant 38 : i64
    %1223 = func.call @cc_make_string(%1221, %1222) : (!llvm.ptr, i64) -> i64
    %1224 = func.call @cc_nil_value() : () -> i64
    %1225 = func.call @cc_intern(%1223, %1224) : (i64, i64) -> i64
    %1226 = func.call @cc_nil_value() : () -> i64
    %1227 = func.call @cc_cons(%1225, %1226) : (i64, i64) -> i64
    %1228 = func.call @cc_values_pack(%1227) : (i64) -> i64
    %1229 = func.call @cc_symbol_value(%1225) : (i64) -> i64
    %1230 = llvm.mlir.addressof @str95 : !llvm.ptr
    %1231 = arith.constant 40 : i64
    %1232 = func.call @cc_make_string(%1230, %1231) : (!llvm.ptr, i64) -> i64
    %1233 = func.call @cc_nil_value() : () -> i64
    %1234 = func.call @cc_intern(%1232, %1233) : (i64, i64) -> i64
    %1235 = func.call @cc_nil_value() : () -> i64
    %1236 = func.call @cc_cons(%1234, %1235) : (i64, i64) -> i64
    %1237 = func.call @cc_values_pack(%1236) : (i64) -> i64
    %1238 = func.call @cc_symbol_value(%1234) : (i64) -> i64
    %1239 = func.call @cc_nil_value() : () -> i64
    %1240 = arith.cmpi ne, %1229, %1239 : i64
    %1241 = scf.if %1240 -> (i64) {
      scf.yield %1238 : i64
    } else {
      scf.yield %1220 : i64
    }
    %1242 = func.call @cc_values_pack(%1241) : (i64) -> i64
    func.call @stack_push_pointer(%1242) : (i64) -> ()
    func.return
  }
  func.func @"local_bar_152926823645193"() {
    %1243 = llvm.mlir.addressof @str96 : !llvm.ptr
    %1244 = arith.constant 25 : i64
    %1245 = func.call @cc_make_string(%1243, %1244) : (!llvm.ptr, i64) -> i64
    %1246 = func.call @cc_nil_value() : () -> i64
    %1247 = func.call @cc_intern(%1245, %1246) : (i64, i64) -> i64
    %1248 = func.call @cc_nil_value() : () -> i64
    %1249 = func.call @cc_cons(%1247, %1248) : (i64, i64) -> i64
    %1250 = func.call @cc_values_pack(%1249) : (i64) -> i64
    %1251 = func.call @cc_nil_value() : () -> i64
    %1252 = llvm.mlir.addressof @str97 : !llvm.ptr
    %1253 = arith.constant 38 : i64
    %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
    %1255 = func.call @cc_nil_value() : () -> i64
    %1256 = func.call @cc_intern(%1254, %1255) : (i64, i64) -> i64
    %1257 = func.call @cc_nil_value() : () -> i64
    %1258 = func.call @cc_cons(%1256, %1257) : (i64, i64) -> i64
    %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
    %1260 = func.call @cc_set_symbol_value(%1256, %1251) : (i64, i64) -> i64
    %1261 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1262 = arith.constant 39 : i64
    %1263 = func.call @cc_make_string(%1261, %1262) : (!llvm.ptr, i64) -> i64
    %1264 = func.call @cc_nil_value() : () -> i64
    %1265 = func.call @cc_intern(%1263, %1264) : (i64, i64) -> i64
    %1266 = func.call @cc_nil_value() : () -> i64
    %1267 = func.call @cc_cons(%1265, %1266) : (i64, i64) -> i64
    %1268 = func.call @cc_values_pack(%1267) : (i64) -> i64
    %1269 = func.call @cc_set_symbol_value(%1265, %1251) : (i64, i64) -> i64
    %1270 = llvm.mlir.addressof @str99 : !llvm.ptr
    %1271 = arith.constant 40 : i64
    %1272 = func.call @cc_make_string(%1270, %1271) : (!llvm.ptr, i64) -> i64
    %1273 = func.call @cc_nil_value() : () -> i64
    %1274 = func.call @cc_intern(%1272, %1273) : (i64, i64) -> i64
    %1275 = func.call @cc_nil_value() : () -> i64
    %1276 = func.call @cc_cons(%1274, %1275) : (i64, i64) -> i64
    %1277 = func.call @cc_values_pack(%1276) : (i64) -> i64
    %1278 = func.call @cc_set_symbol_value(%1274, %1251) : (i64, i64) -> i64
    %1279 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%1279) : (i64) -> ()
    %1280 = func.call @stack_pop_pointer() : () -> i64
    %1281 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%1281) : (i64) -> ()
    %1282 = func.call @stack_pop_pointer() : () -> i64
    %1283 = func.call @cc_random(%1282) : (i64) -> i64
    %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
    %1284 = arith.addi %1283, %__rlasp_stack_elide_zero_199 : i64
    %1285 = arith.constant 1 : i1
    %1287 = arith.constant 3 : i64
    %1286 = arith.andi %1280, %1287 : i64
    %1288 = arith.constant 0 : i64
    %1289 = arith.cmpi eq, %1286, %1288 : i64
    %1291 = arith.constant 3 : i64
    %1290 = arith.andi %1284, %1291 : i64
    %1292 = arith.constant 0 : i64
    %1293 = arith.cmpi eq, %1290, %1292 : i64
    %1294 = arith.andi %1289, %1293 : i1
    %1295 = scf.if %1294 -> (i1) {
      %1296 = arith.constant 2 : i64
      %1297 = arith.shrsi %1280, %1296 : i64
      %1298 = arith.constant 2 : i64
      %1299 = arith.shrsi %1284, %1298 : i64
      %1300 = arith.cmpi sgt, %1297, %1299 : i64
      scf.yield %1300 : i1
    } else {
      %1301 = func.call @cc_gt(%1280, %1284) : (i64, i64) -> i64
      %1302 = func.call @cc_nil_value() : () -> i64
      %1303 = arith.cmpi ne, %1301, %1302 : i64
      scf.yield %1303 : i1
    }
    %1304 = arith.andi %1285, %1295 : i1
    %1305 = func.call @cc_nil_value() : () -> i64
    %1306 = func.call @cc_t_value() : () -> i64
    %1307 = scf.if %1304 -> (i64) {
      scf.yield %1306 : i64
    } else {
      scf.yield %1305 : i64
    }
    %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
    %1308 = arith.addi %1307, %__rlasp_stack_elide_zero_200 : i64
    %1309 = func.call @cc_nil_value() : () -> i64
    %1310 = arith.cmpi ne, %1308, %1309 : i64
    scf.if %1310 {
      %1311 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1311) : (i64) -> ()
    } else {
      %1312 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%1312) : (i64) -> ()
    }
    %1313 = func.call @stack_pop_pointer() : () -> i64
    %1314 = func.call @cc_multiple_value_list(%1313) : (i64) -> i64
    %1315 = llvm.mlir.addressof @str100 : !llvm.ptr
    %1316 = arith.constant 38 : i64
    %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
    %1318 = func.call @cc_nil_value() : () -> i64
    %1319 = func.call @cc_intern(%1317, %1318) : (i64, i64) -> i64
    %1320 = func.call @cc_nil_value() : () -> i64
    %1321 = func.call @cc_cons(%1319, %1320) : (i64, i64) -> i64
    %1322 = func.call @cc_values_pack(%1321) : (i64) -> i64
    %1323 = func.call @cc_symbol_value(%1319) : (i64) -> i64
    %1324 = llvm.mlir.addressof @str101 : !llvm.ptr
    %1325 = arith.constant 40 : i64
    %1326 = func.call @cc_make_string(%1324, %1325) : (!llvm.ptr, i64) -> i64
    %1327 = func.call @cc_nil_value() : () -> i64
    %1328 = func.call @cc_intern(%1326, %1327) : (i64, i64) -> i64
    %1329 = func.call @cc_nil_value() : () -> i64
    %1330 = func.call @cc_cons(%1328, %1329) : (i64, i64) -> i64
    %1331 = func.call @cc_values_pack(%1330) : (i64) -> i64
    %1332 = func.call @cc_symbol_value(%1328) : (i64) -> i64
    %1333 = func.call @cc_nil_value() : () -> i64
    %1334 = arith.cmpi ne, %1323, %1333 : i64
    %1335 = scf.if %1334 -> (i64) {
      scf.yield %1332 : i64
    } else {
      scf.yield %1314 : i64
    }
    %1336 = func.call @cc_values_pack(%1335) : (i64) -> i64
    func.call @stack_push_pointer(%1336) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645191"() {
    %1142 = func.call @cc_nil_value() : () -> i64
    %1143 = func.call @cc_nil_value() : () -> i64
    %1144 = func.call @cc_errorp(%1142) : (i64) -> i64
    %1145 = arith.cmpi ne, %1144, %1143 : i64
    %1146 = scf.if %1145 -> (i64) {
      scf.yield %1142 : i64
    } else {
      %1337 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1338 = arith.constant 14 : i64
      %1339 = func.call @cc_make_string(%1337, %1338) : (!llvm.ptr, i64) -> i64
      %1340 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1341 = arith.constant 7 : i64
      %1342 = func.call @cc_make_string(%1340, %1341) : (!llvm.ptr, i64) -> i64
      %1343 = func.call @cc_intern(%1339, %1342) : (i64, i64) -> i64
      %1344 = func.call @cc_nil_value() : () -> i64
      %1345 = func.call @cc_cons(%1343, %1344) : (i64, i64) -> i64
      %1346 = func.call @cc_values_pack(%1345) : (i64) -> i64
      func.call @stack_push_pointer(%1343) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1347 = func.call @stack_pop_pointer() : () -> i64
      %1348 = func.call @stack_pop_pointer() : () -> i64
      %1349 = func.call @cc_cons(%1348, %1347) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %1350 = arith.addi %1349, %__rlasp_stack_elide_zero_201 : i64
      %1351 = func.call @cc_push_float_trap_mask(%1350) : (i64) -> i64
      func.call @"local_bar_152926823645193"() : () -> ()
      %1352 = func.call @stack_pop_pointer() : () -> i64
      func.call @"local_foo_152926823645192"() : () -> ()
      %1353 = func.call @stack_pop_pointer() : () -> i64
      %1354 = func.call @cc_div(%1352, %1353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1354) : (i64) -> ()
      %1355 = func.call @cc_restore_float_trap_mask(%1351) : (i64) -> i64
      %1356 = func.call @stack_pop_pointer() : () -> i64
      %1357 = func.call @cc_multiple_value_list(%1356) : (i64) -> i64
      %1358 = func.call @cc_values_pack(%1357) : (i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %1359 = arith.addi %1358, %__rlasp_stack_elide_zero_202 : i64
      %1360 = func.call @cc_nil_value() : () -> i64
      %1361 = func.call @cc_errorp(%1359) : (i64) -> i64
      %1362 = arith.cmpi ne, %1361, %1360 : i64
      %1363 = arith.cmpi eq, %1360, %1360 : i64
      %1364 = arith.andi %1362, %1363 : i1
      %1365 = scf.if %1364 -> (i64) {
        scf.yield %1359 : i64
      } else {
        scf.yield %1360 : i64
      }
      %1366 = arith.cmpi ne, %1365, %1360 : i64
      scf.if %1366 {
        func.call @stack_push_pointer(%1365) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1359) : (i64) -> ()
        %1367 = llvm.mlir.addressof @str104 : !llvm.ptr
        %1368 = func.call @cc_make_function_ref_const(%1367) : (!llvm.ptr) -> i64
        %1369 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1368, %1369) : (i64, i64) -> ()
      }
      %1370 = func.call @stack_pop_pointer() : () -> i64
      %1371 = func.call @cc_nil_value() : () -> i64
      %1372 = func.call @cc_cons(%1370, %1371) : (i64, i64) -> i64
      %1373 = func.call @cc_not(%1372) : (i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %1374 = arith.addi %1373, %__rlasp_stack_elide_zero_203 : i64
      %1375 = func.call @cc_nil_value() : () -> i64
      %1376 = func.call @cc_cons(%1374, %1375) : (i64, i64) -> i64
      %1377 = func.call @cc_not(%1376) : (i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %1378 = arith.addi %1377, %__rlasp_stack_elide_zero_204 : i64
      scf.yield %1378 : i64
    }
    func.call @stack_push_pointer(%1146) : (i64) -> ()
    func.return
  }
  func.func @"local_foo_152926823645197"() {
    %1763 = llvm.mlir.addressof @str135 : !llvm.ptr
    %1764 = arith.constant 25 : i64
    %1765 = func.call @cc_make_string(%1763, %1764) : (!llvm.ptr, i64) -> i64
    %1766 = func.call @cc_nil_value() : () -> i64
    %1767 = func.call @cc_intern(%1765, %1766) : (i64, i64) -> i64
    %1768 = func.call @cc_nil_value() : () -> i64
    %1769 = func.call @cc_cons(%1767, %1768) : (i64, i64) -> i64
    %1770 = func.call @cc_values_pack(%1769) : (i64) -> i64
    %1771 = func.call @cc_nil_value() : () -> i64
    %1772 = llvm.mlir.addressof @str136 : !llvm.ptr
    %1773 = arith.constant 38 : i64
    %1774 = func.call @cc_make_string(%1772, %1773) : (!llvm.ptr, i64) -> i64
    %1775 = func.call @cc_nil_value() : () -> i64
    %1776 = func.call @cc_intern(%1774, %1775) : (i64, i64) -> i64
    %1777 = func.call @cc_nil_value() : () -> i64
    %1778 = func.call @cc_cons(%1776, %1777) : (i64, i64) -> i64
    %1779 = func.call @cc_values_pack(%1778) : (i64) -> i64
    %1780 = func.call @cc_set_symbol_value(%1776, %1771) : (i64, i64) -> i64
    %1781 = llvm.mlir.addressof @str137 : !llvm.ptr
    %1782 = arith.constant 39 : i64
    %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
    %1784 = func.call @cc_nil_value() : () -> i64
    %1785 = func.call @cc_intern(%1783, %1784) : (i64, i64) -> i64
    %1786 = func.call @cc_nil_value() : () -> i64
    %1787 = func.call @cc_cons(%1785, %1786) : (i64, i64) -> i64
    %1788 = func.call @cc_values_pack(%1787) : (i64) -> i64
    %1789 = func.call @cc_set_symbol_value(%1785, %1771) : (i64, i64) -> i64
    %1790 = llvm.mlir.addressof @str138 : !llvm.ptr
    %1791 = arith.constant 40 : i64
    %1792 = func.call @cc_make_string(%1790, %1791) : (!llvm.ptr, i64) -> i64
    %1793 = func.call @cc_nil_value() : () -> i64
    %1794 = func.call @cc_intern(%1792, %1793) : (i64, i64) -> i64
    %1795 = func.call @cc_nil_value() : () -> i64
    %1796 = func.call @cc_cons(%1794, %1795) : (i64, i64) -> i64
    %1797 = func.call @cc_values_pack(%1796) : (i64) -> i64
    %1798 = func.call @cc_set_symbol_value(%1794, %1771) : (i64, i64) -> i64
    %1799 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%1799) : (i64) -> ()
    %1800 = func.call @stack_pop_pointer() : () -> i64
    %1801 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%1801) : (i64) -> ()
    %1802 = func.call @stack_pop_pointer() : () -> i64
    %1803 = func.call @cc_random(%1802) : (i64) -> i64
    %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
    %1804 = arith.addi %1803, %__rlasp_stack_elide_zero_205 : i64
    %1805 = arith.constant 1 : i1
    %1807 = arith.constant 3 : i64
    %1806 = arith.andi %1800, %1807 : i64
    %1808 = arith.constant 0 : i64
    %1809 = arith.cmpi eq, %1806, %1808 : i64
    %1811 = arith.constant 3 : i64
    %1810 = arith.andi %1804, %1811 : i64
    %1812 = arith.constant 0 : i64
    %1813 = arith.cmpi eq, %1810, %1812 : i64
    %1814 = arith.andi %1809, %1813 : i1
    %1815 = scf.if %1814 -> (i1) {
      %1816 = arith.constant 2 : i64
      %1817 = arith.shrsi %1800, %1816 : i64
      %1818 = arith.constant 2 : i64
      %1819 = arith.shrsi %1804, %1818 : i64
      %1820 = arith.cmpi sgt, %1817, %1819 : i64
      scf.yield %1820 : i1
    } else {
      %1821 = func.call @cc_gt(%1800, %1804) : (i64, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = arith.cmpi ne, %1821, %1822 : i64
      scf.yield %1823 : i1
    }
    %1824 = arith.andi %1805, %1815 : i1
    %1825 = func.call @cc_nil_value() : () -> i64
    %1826 = func.call @cc_t_value() : () -> i64
    %1827 = scf.if %1824 -> (i64) {
      scf.yield %1826 : i64
    } else {
      scf.yield %1825 : i64
    }
    %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
    %1828 = arith.addi %1827, %__rlasp_stack_elide_zero_206 : i64
    %1829 = func.call @cc_nil_value() : () -> i64
    %1830 = arith.cmpi ne, %1828, %1829 : i64
    scf.if %1830 {
      %1831 = arith.constant 0.0 : f64
      %1832 = func.call @cc_box_single_float(%1831) : (f64) -> i64
      func.call @stack_push_pointer(%1832) : (i64) -> ()
    } else {
      %1833 = arith.constant 0.0 : f64
      %1834 = func.call @cc_box_single_float(%1833) : (f64) -> i64
      func.call @stack_push_pointer(%1834) : (i64) -> ()
    }
    %1835 = func.call @stack_pop_pointer() : () -> i64
    %1836 = func.call @cc_multiple_value_list(%1835) : (i64) -> i64
    %1837 = llvm.mlir.addressof @str139 : !llvm.ptr
    %1838 = arith.constant 38 : i64
    %1839 = func.call @cc_make_string(%1837, %1838) : (!llvm.ptr, i64) -> i64
    %1840 = func.call @cc_nil_value() : () -> i64
    %1841 = func.call @cc_intern(%1839, %1840) : (i64, i64) -> i64
    %1842 = func.call @cc_nil_value() : () -> i64
    %1843 = func.call @cc_cons(%1841, %1842) : (i64, i64) -> i64
    %1844 = func.call @cc_values_pack(%1843) : (i64) -> i64
    %1845 = func.call @cc_symbol_value(%1841) : (i64) -> i64
    %1846 = llvm.mlir.addressof @str140 : !llvm.ptr
    %1847 = arith.constant 40 : i64
    %1848 = func.call @cc_make_string(%1846, %1847) : (!llvm.ptr, i64) -> i64
    %1849 = func.call @cc_nil_value() : () -> i64
    %1850 = func.call @cc_intern(%1848, %1849) : (i64, i64) -> i64
    %1851 = func.call @cc_nil_value() : () -> i64
    %1852 = func.call @cc_cons(%1850, %1851) : (i64, i64) -> i64
    %1853 = func.call @cc_values_pack(%1852) : (i64) -> i64
    %1854 = func.call @cc_symbol_value(%1850) : (i64) -> i64
    %1855 = func.call @cc_nil_value() : () -> i64
    %1856 = arith.cmpi ne, %1845, %1855 : i64
    %1857 = scf.if %1856 -> (i64) {
      scf.yield %1854 : i64
    } else {
      scf.yield %1836 : i64
    }
    %1858 = func.call @cc_values_pack(%1857) : (i64) -> i64
    func.call @stack_push_pointer(%1858) : (i64) -> ()
    func.return
  }
  func.func @"local_bar_152926823645198"() {
    %1859 = llvm.mlir.addressof @str141 : !llvm.ptr
    %1860 = arith.constant 25 : i64
    %1861 = func.call @cc_make_string(%1859, %1860) : (!llvm.ptr, i64) -> i64
    %1862 = func.call @cc_nil_value() : () -> i64
    %1863 = func.call @cc_intern(%1861, %1862) : (i64, i64) -> i64
    %1864 = func.call @cc_nil_value() : () -> i64
    %1865 = func.call @cc_cons(%1863, %1864) : (i64, i64) -> i64
    %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
    %1867 = func.call @cc_nil_value() : () -> i64
    %1868 = llvm.mlir.addressof @str142 : !llvm.ptr
    %1869 = arith.constant 38 : i64
    %1870 = func.call @cc_make_string(%1868, %1869) : (!llvm.ptr, i64) -> i64
    %1871 = func.call @cc_nil_value() : () -> i64
    %1872 = func.call @cc_intern(%1870, %1871) : (i64, i64) -> i64
    %1873 = func.call @cc_nil_value() : () -> i64
    %1874 = func.call @cc_cons(%1872, %1873) : (i64, i64) -> i64
    %1875 = func.call @cc_values_pack(%1874) : (i64) -> i64
    %1876 = func.call @cc_set_symbol_value(%1872, %1867) : (i64, i64) -> i64
    %1877 = llvm.mlir.addressof @str143 : !llvm.ptr
    %1878 = arith.constant 39 : i64
    %1879 = func.call @cc_make_string(%1877, %1878) : (!llvm.ptr, i64) -> i64
    %1880 = func.call @cc_nil_value() : () -> i64
    %1881 = func.call @cc_intern(%1879, %1880) : (i64, i64) -> i64
    %1882 = func.call @cc_nil_value() : () -> i64
    %1883 = func.call @cc_cons(%1881, %1882) : (i64, i64) -> i64
    %1884 = func.call @cc_values_pack(%1883) : (i64) -> i64
    %1885 = func.call @cc_set_symbol_value(%1881, %1867) : (i64, i64) -> i64
    %1886 = llvm.mlir.addressof @str144 : !llvm.ptr
    %1887 = arith.constant 40 : i64
    %1888 = func.call @cc_make_string(%1886, %1887) : (!llvm.ptr, i64) -> i64
    %1889 = func.call @cc_nil_value() : () -> i64
    %1890 = func.call @cc_intern(%1888, %1889) : (i64, i64) -> i64
    %1891 = func.call @cc_nil_value() : () -> i64
    %1892 = func.call @cc_cons(%1890, %1891) : (i64, i64) -> i64
    %1893 = func.call @cc_values_pack(%1892) : (i64) -> i64
    %1894 = func.call @cc_set_symbol_value(%1890, %1867) : (i64, i64) -> i64
    %1895 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%1895) : (i64) -> ()
    %1896 = func.call @stack_pop_pointer() : () -> i64
    %1897 = arith.constant 20 : i64
    func.call @stack_push_fixnum(%1897) : (i64) -> ()
    %1898 = func.call @stack_pop_pointer() : () -> i64
    %1899 = func.call @cc_random(%1898) : (i64) -> i64
    %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
    %1900 = arith.addi %1899, %__rlasp_stack_elide_zero_207 : i64
    %1901 = arith.constant 1 : i1
    %1903 = arith.constant 3 : i64
    %1902 = arith.andi %1896, %1903 : i64
    %1904 = arith.constant 0 : i64
    %1905 = arith.cmpi eq, %1902, %1904 : i64
    %1907 = arith.constant 3 : i64
    %1906 = arith.andi %1900, %1907 : i64
    %1908 = arith.constant 0 : i64
    %1909 = arith.cmpi eq, %1906, %1908 : i64
    %1910 = arith.andi %1905, %1909 : i1
    %1911 = scf.if %1910 -> (i1) {
      %1912 = arith.constant 2 : i64
      %1913 = arith.shrsi %1896, %1912 : i64
      %1914 = arith.constant 2 : i64
      %1915 = arith.shrsi %1900, %1914 : i64
      %1916 = arith.cmpi sgt, %1913, %1915 : i64
      scf.yield %1916 : i1
    } else {
      %1917 = func.call @cc_gt(%1896, %1900) : (i64, i64) -> i64
      %1918 = func.call @cc_nil_value() : () -> i64
      %1919 = arith.cmpi ne, %1917, %1918 : i64
      scf.yield %1919 : i1
    }
    %1920 = arith.andi %1901, %1911 : i1
    %1921 = func.call @cc_nil_value() : () -> i64
    %1922 = func.call @cc_t_value() : () -> i64
    %1923 = scf.if %1920 -> (i64) {
      scf.yield %1922 : i64
    } else {
      scf.yield %1921 : i64
    }
    %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
    %1924 = arith.addi %1923, %__rlasp_stack_elide_zero_208 : i64
    %1925 = func.call @cc_nil_value() : () -> i64
    %1926 = arith.cmpi ne, %1924, %1925 : i64
    scf.if %1926 {
      %1927 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1927) : (i64) -> ()
    } else {
      %1928 = arith.constant 24 : i64
      func.call @stack_push_fixnum(%1928) : (i64) -> ()
    }
    %1929 = func.call @stack_pop_pointer() : () -> i64
    %1930 = func.call @cc_multiple_value_list(%1929) : (i64) -> i64
    %1931 = llvm.mlir.addressof @str145 : !llvm.ptr
    %1932 = arith.constant 38 : i64
    %1933 = func.call @cc_make_string(%1931, %1932) : (!llvm.ptr, i64) -> i64
    %1934 = func.call @cc_nil_value() : () -> i64
    %1935 = func.call @cc_intern(%1933, %1934) : (i64, i64) -> i64
    %1936 = func.call @cc_nil_value() : () -> i64
    %1937 = func.call @cc_cons(%1935, %1936) : (i64, i64) -> i64
    %1938 = func.call @cc_values_pack(%1937) : (i64) -> i64
    %1939 = func.call @cc_symbol_value(%1935) : (i64) -> i64
    %1940 = llvm.mlir.addressof @str146 : !llvm.ptr
    %1941 = arith.constant 40 : i64
    %1942 = func.call @cc_make_string(%1940, %1941) : (!llvm.ptr, i64) -> i64
    %1943 = func.call @cc_nil_value() : () -> i64
    %1944 = func.call @cc_intern(%1942, %1943) : (i64, i64) -> i64
    %1945 = func.call @cc_nil_value() : () -> i64
    %1946 = func.call @cc_cons(%1944, %1945) : (i64, i64) -> i64
    %1947 = func.call @cc_values_pack(%1946) : (i64) -> i64
    %1948 = func.call @cc_symbol_value(%1944) : (i64) -> i64
    %1949 = func.call @cc_nil_value() : () -> i64
    %1950 = arith.cmpi ne, %1939, %1949 : i64
    %1951 = scf.if %1950 -> (i64) {
      scf.yield %1948 : i64
    } else {
      scf.yield %1930 : i64
    }
    %1952 = func.call @cc_values_pack(%1951) : (i64) -> i64
    func.call @stack_push_pointer(%1952) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645196"() {
    %1752 = func.call @cc_nil_value() : () -> i64
    %1753 = func.call @cc_nil_value() : () -> i64
    %1754 = func.call @cc_errorp(%1752) : (i64) -> i64
    %1755 = arith.cmpi ne, %1754, %1753 : i64
    %1756 = scf.if %1755 -> (i64) {
      scf.yield %1752 : i64
    } else {
      %1757 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1758 = func.call @cc_nil_value() : () -> i64
      %1759 = func.call @cc_nil_value() : () -> i64
      %1760 = func.call @cc_errorp(%1758) : (i64) -> i64
      %1761 = arith.cmpi ne, %1760, %1759 : i64
      %1762 = scf.if %1761 -> (i64) {
        scf.yield %1758 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @"local_bar_152926823645198"() : () -> ()
        %1953 = func.call @stack_pop_pointer() : () -> i64
        func.call @"local_foo_152926823645197"() : () -> ()
        %1954 = func.call @stack_pop_pointer() : () -> i64
        %1955 = func.call @cc_div(%1953, %1954) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
        %1956 = arith.addi %1955, %__rlasp_stack_elide_zero_209 : i64
        %1957 = func.call @cc_multiple_value_list(%1956) : (i64) -> i64
        %1958 = func.call @cc_values_pack(%1957) : (i64) -> i64
        %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
        %1959 = arith.addi %1958, %__rlasp_stack_elide_zero_210 : i64
        %1960 = func.call @cc_errorp(%1959) : (i64) -> i64
        %1961 = func.call @cc_nil_value() : () -> i64
        %1962 = arith.cmpi ne, %1960, %1961 : i64
        scf.if %1962 {
          func.call @stack_push_pointer(%1959) : (i64) -> ()
        } else {
          %1963 = func.call @cc_multiple_value_list(%1959) : (i64) -> i64
          func.call @stack_push_pointer(%1963) : (i64) -> ()
        }
        %1964 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1965 = func.call @stack_pop_pointer() : () -> i64
        %1966 = func.call @cc_nil_value() : () -> i64
        %1967 = func.call @cc_maybe_error_from_multiple_value_list(%1964) : (i64) -> i64
        %1968 = func.call @cc_errorp(%1967) : (i64) -> i64
        %1969 = arith.cmpi ne, %1968, %1966 : i64
        %1970 = arith.cmpi eq, %1966, %1966 : i64
        %1971 = arith.andi %1969, %1970 : i1
        %1972 = scf.if %1971 -> (i64) {
          scf.yield %1967 : i64
        } else {
          scf.yield %1966 : i64
        }
        %1973 = arith.cmpi ne, %1972, %1966 : i64
        scf.if %1973 {
          func.call @stack_push_pointer(%1972) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1974 = func.call @stack_pop_pointer() : () -> i64
          %1975 = func.call @cc_cons(%1965, %1974) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
          %1976 = arith.addi %1975, %__rlasp_stack_elide_zero_211 : i64
          %1977 = func.call @cc_cons(%1964, %1976) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
          %1978 = arith.addi %1977, %__rlasp_stack_elide_zero_212 : i64
          %1979 = func.call @cc_values_pack(%1978) : (i64) -> i64
          func.call @stack_push_pointer(%1979) : (i64) -> ()
        }
        %1980 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1980 : i64
      }
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %1981 = arith.addi %1762, %__rlasp_stack_elide_zero_213 : i64
      %1982 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1983 = func.call @cc_errorp(%1981) : (i64) -> i64
      %1984 = func.call @cc_nil_value() : () -> i64
      %1985 = arith.cmpi ne, %1983, %1984 : i64
      scf.if %1985 {
        %1986 = func.call @cc_condition_value(%1981) : (i64) -> i64
        %1987 = func.call @cc_values2(%1984, %1986) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1987) : (i64) -> ()
      } else {
        %1988 = func.call @cc_multiple_value_list(%1981) : (i64) -> i64
        %1989 = func.call @cc_values_pack(%1988) : (i64) -> i64
        func.call @stack_push_pointer(%1989) : (i64) -> ()
      }
      %1990 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1990 : i64
    }
    func.call @stack_push_pointer(%1756) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645201"() {
    %2313 = func.call @cc_nil_value() : () -> i64
    %2314 = func.call @cc_nil_value() : () -> i64
    %2315 = func.call @cc_errorp(%2313) : (i64) -> i64
    %2316 = arith.cmpi ne, %2315, %2314 : i64
    %2317 = scf.if %2316 -> (i64) {
      scf.yield %2313 : i64
    } else {
      %2318 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2319 = arith.constant 8 : i64
      %2320 = func.call @cc_make_string(%2318, %2319) : (!llvm.ptr, i64) -> i64
      %2321 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2322 = arith.constant 7 : i64
      %2323 = func.call @cc_make_string(%2321, %2322) : (!llvm.ptr, i64) -> i64
      %2324 = func.call @cc_intern(%2320, %2323) : (i64, i64) -> i64
      %2325 = func.call @cc_nil_value() : () -> i64
      %2326 = func.call @cc_cons(%2324, %2325) : (i64, i64) -> i64
      %2327 = func.call @cc_values_pack(%2326) : (i64) -> i64
      func.call @stack_push_pointer(%2324) : (i64) -> ()
      %2328 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2329 = arith.constant 7 : i64
      %2330 = func.call @cc_make_string(%2328, %2329) : (!llvm.ptr, i64) -> i64
      %2331 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2332 = arith.constant 7 : i64
      %2333 = func.call @cc_make_string(%2331, %2332) : (!llvm.ptr, i64) -> i64
      %2334 = func.call @cc_intern(%2330, %2333) : (i64, i64) -> i64
      %2335 = func.call @cc_nil_value() : () -> i64
      %2336 = func.call @cc_cons(%2334, %2335) : (i64, i64) -> i64
      %2337 = func.call @cc_values_pack(%2336) : (i64) -> i64
      func.call @stack_push_pointer(%2334) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2338 = func.call @stack_pop_pointer() : () -> i64
      %2339 = func.call @stack_pop_pointer() : () -> i64
      %2340 = func.call @cc_cons(%2339, %2338) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %2341 = arith.addi %2340, %__rlasp_stack_elide_zero_214 : i64
      %2342 = func.call @stack_pop_pointer() : () -> i64
      %2343 = func.call @cc_cons(%2342, %2341) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %2344 = arith.addi %2343, %__rlasp_stack_elide_zero_215 : i64
      %2345 = func.call @cc_push_float_trap_mask(%2344) : (i64) -> i64
      %2346 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2346) : (i64) -> ()
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = func.call @cc_random(%2347) : (i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %2349 = arith.addi %2348, %__rlasp_stack_elide_zero_216 : i64
      %2350 = func.call @cc_nil_value() : () -> i64
      %2351 = func.call @cc_nil_value() : () -> i64
      %2352 = func.call @cc_errorp(%2350) : (i64) -> i64
      %2353 = arith.cmpi ne, %2352, %2351 : i64
      %2354 = scf.if %2353 -> (i64) {
        scf.yield %2350 : i64
      } else {
        %2355 = func.call @cc_nil_value() : () -> i64
        %2356 = func.call @cc_errorp(%2349) : (i64) -> i64
        %2357 = arith.cmpi ne, %2356, %2355 : i64
        %2358 = arith.cmpi eq, %2355, %2355 : i64
        %2359 = arith.andi %2357, %2358 : i1
        %2360 = scf.if %2359 -> (i64) {
          scf.yield %2349 : i64
        } else {
          scf.yield %2355 : i64
        }
        %2361 = arith.cmpi ne, %2360, %2355 : i64
        scf.if %2361 {
          func.call @stack_push_pointer(%2360) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2349) : (i64) -> ()
          %2362 = llvm.mlir.addressof @str181 : !llvm.ptr
          %2363 = func.call @cc_make_function_ref_const(%2362) : (!llvm.ptr) -> i64
          %2364 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2363, %2364) : (i64, i64) -> ()
        }
        %2365 = func.call @stack_pop_pointer() : () -> i64
        %2366 = func.call @cc_nil_value() : () -> i64
        %2367 = func.call @cc_errorp(%2349) : (i64) -> i64
        %2368 = arith.cmpi ne, %2367, %2366 : i64
        %2369 = arith.cmpi eq, %2366, %2366 : i64
        %2370 = arith.andi %2368, %2369 : i1
        %2371 = scf.if %2370 -> (i64) {
          scf.yield %2349 : i64
        } else {
          scf.yield %2366 : i64
        }
        %2372 = arith.cmpi ne, %2371, %2366 : i64
        scf.if %2372 {
          func.call @stack_push_pointer(%2371) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2349) : (i64) -> ()
          %2373 = llvm.mlir.addressof @str182 : !llvm.ptr
          %2374 = func.call @cc_make_function_ref_const(%2373) : (!llvm.ptr) -> i64
          %2375 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2374, %2375) : (i64, i64) -> ()
        }
        %2376 = func.call @stack_pop_pointer() : () -> i64
        %2378 = arith.constant 3 : i64
        %2377 = arith.andi %2365, %2378 : i64
        %2379 = arith.constant 0 : i64
        %2380 = arith.cmpi eq, %2377, %2379 : i64
        %2382 = arith.constant 3 : i64
        %2381 = arith.andi %2376, %2382 : i64
        %2383 = arith.constant 0 : i64
        %2384 = arith.cmpi eq, %2381, %2383 : i64
        %2385 = arith.andi %2380, %2384 : i1
        %2386 = scf.if %2385 -> (i64) {
          %2387 = arith.constant 2 : i64
          %2388 = arith.shrsi %2365, %2387 : i64
          %2389 = arith.constant 2 : i64
          %2390 = arith.shrsi %2376, %2389 : i64
          %2391 = arith.addi %2388, %2390 : i64
          %2392 = arith.constant -2305843009213693952 : i64
          %2393 = arith.constant 2305843009213693951 : i64
          %2394 = arith.cmpi sge, %2391, %2392 : i64
          %2395 = arith.cmpi sle, %2391, %2393 : i64
          %2396 = arith.andi %2394, %2395 : i1
          %2397 = scf.if %2396 -> (i64) {
            %2398 = arith.constant 2 : i64
            %2399 = arith.shli %2391, %2398 : i64
            scf.yield %2399 : i64
          } else {
            %2400 = func.call @cc_add(%2365, %2376) : (i64, i64) -> i64
            scf.yield %2400 : i64
          }
          scf.yield %2397 : i64
        } else {
          %2401 = func.call @cc_add(%2365, %2376) : (i64, i64) -> i64
          scf.yield %2401 : i64
        }
        %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
        %2402 = arith.addi %2386, %__rlasp_stack_elide_zero_217 : i64
        scf.yield %2402 : i64
      }
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      %2403 = func.call @cc_restore_float_trap_mask(%2345) : (i64) -> i64
      %2404 = func.call @stack_pop_pointer() : () -> i64
      %2405 = func.call @cc_nil_value() : () -> i64
      %2406 = func.call @cc_errorp(%2404) : (i64) -> i64
      %2407 = arith.cmpi ne, %2406, %2405 : i64
      %2408 = arith.cmpi eq, %2405, %2405 : i64
      %2409 = arith.andi %2407, %2408 : i1
      %2410 = scf.if %2409 -> (i64) {
        scf.yield %2404 : i64
      } else {
        scf.yield %2405 : i64
      }
      %2411 = arith.cmpi ne, %2410, %2405 : i64
      scf.if %2411 {
        func.call @stack_push_pointer(%2410) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2404) : (i64) -> ()
        %2412 = llvm.mlir.addressof @str183 : !llvm.ptr
        %2413 = func.call @cc_make_function_ref_const(%2412) : (!llvm.ptr) -> i64
        %2414 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2413, %2414) : (i64, i64) -> ()
      }
      %2415 = func.call @stack_pop_pointer() : () -> i64
      %2416 = func.call @cc_nil_value() : () -> i64
      %2417 = func.call @cc_cons(%2415, %2416) : (i64, i64) -> i64
      %2418 = func.call @cc_not(%2417) : (i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %2419 = arith.addi %2418, %__rlasp_stack_elide_zero_218 : i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_not(%2421) : (i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %2423 = arith.addi %2422, %__rlasp_stack_elide_zero_219 : i64
      scf.yield %2423 : i64
    }
    func.call @stack_push_pointer(%2317) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645202"() {
    %2691 = func.call @cc_nil_value() : () -> i64
    %2692 = func.call @cc_nil_value() : () -> i64
    %2693 = func.call @cc_errorp(%2691) : (i64) -> i64
    %2694 = arith.cmpi ne, %2693, %2692 : i64
    %2695 = scf.if %2694 -> (i64) {
      scf.yield %2691 : i64
    } else {
      %2696 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2697 = func.call @cc_nil_value() : () -> i64
      %2698 = func.call @cc_nil_value() : () -> i64
      %2699 = func.call @cc_errorp(%2697) : (i64) -> i64
      %2700 = arith.cmpi ne, %2699, %2698 : i64
      %2701 = scf.if %2700 -> (i64) {
        scf.yield %2697 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2702 = arith.constant 100 : i64
        func.call @stack_push_fixnum(%2702) : (i64) -> ()
        %2703 = func.call @stack_pop_pointer() : () -> i64
        %2704 = func.call @cc_random(%2703) : (i64) -> i64
        %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
        %2705 = arith.addi %2704, %__rlasp_stack_elide_zero_220 : i64
        %2706 = func.call @cc_nil_value() : () -> i64
        %2707 = func.call @cc_nil_value() : () -> i64
        %2708 = func.call @cc_errorp(%2706) : (i64) -> i64
        %2709 = arith.cmpi ne, %2708, %2707 : i64
        %2710 = scf.if %2709 -> (i64) {
          scf.yield %2706 : i64
        } else {
          %2711 = func.call @cc_nil_value() : () -> i64
          %2712 = func.call @cc_errorp(%2705) : (i64) -> i64
          %2713 = arith.cmpi ne, %2712, %2711 : i64
          %2714 = arith.cmpi eq, %2711, %2711 : i64
          %2715 = arith.andi %2713, %2714 : i1
          %2716 = scf.if %2715 -> (i64) {
            scf.yield %2705 : i64
          } else {
            scf.yield %2711 : i64
          }
          %2717 = arith.cmpi ne, %2716, %2711 : i64
          scf.if %2717 {
            func.call @stack_push_pointer(%2716) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2705) : (i64) -> ()
            %2718 = llvm.mlir.addressof @str206 : !llvm.ptr
            %2719 = func.call @cc_make_function_ref_const(%2718) : (!llvm.ptr) -> i64
            %2720 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2719, %2720) : (i64, i64) -> ()
          }
          %2721 = func.call @stack_pop_pointer() : () -> i64
          %2722 = func.call @cc_nil_value() : () -> i64
          %2723 = func.call @cc_errorp(%2705) : (i64) -> i64
          %2724 = arith.cmpi ne, %2723, %2722 : i64
          %2725 = arith.cmpi eq, %2722, %2722 : i64
          %2726 = arith.andi %2724, %2725 : i1
          %2727 = scf.if %2726 -> (i64) {
            scf.yield %2705 : i64
          } else {
            scf.yield %2722 : i64
          }
          %2728 = arith.cmpi ne, %2727, %2722 : i64
          scf.if %2728 {
            func.call @stack_push_pointer(%2727) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2705) : (i64) -> ()
            %2729 = llvm.mlir.addressof @str207 : !llvm.ptr
            %2730 = func.call @cc_make_function_ref_const(%2729) : (!llvm.ptr) -> i64
            %2731 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2730, %2731) : (i64, i64) -> ()
          }
          %2732 = func.call @stack_pop_pointer() : () -> i64
          %2734 = arith.constant 3 : i64
          %2733 = arith.andi %2721, %2734 : i64
          %2735 = arith.constant 0 : i64
          %2736 = arith.cmpi eq, %2733, %2735 : i64
          %2738 = arith.constant 3 : i64
          %2737 = arith.andi %2732, %2738 : i64
          %2739 = arith.constant 0 : i64
          %2740 = arith.cmpi eq, %2737, %2739 : i64
          %2741 = arith.andi %2736, %2740 : i1
          %2742 = scf.if %2741 -> (i64) {
            %2743 = arith.constant 2 : i64
            %2744 = arith.shrsi %2721, %2743 : i64
            %2745 = arith.constant 2 : i64
            %2746 = arith.shrsi %2732, %2745 : i64
            %2747 = arith.addi %2744, %2746 : i64
            %2748 = arith.constant -2305843009213693952 : i64
            %2749 = arith.constant 2305843009213693951 : i64
            %2750 = arith.cmpi sge, %2747, %2748 : i64
            %2751 = arith.cmpi sle, %2747, %2749 : i64
            %2752 = arith.andi %2750, %2751 : i1
            %2753 = scf.if %2752 -> (i64) {
              %2754 = arith.constant 2 : i64
              %2755 = arith.shli %2747, %2754 : i64
              scf.yield %2755 : i64
            } else {
              %2756 = func.call @cc_add(%2721, %2732) : (i64, i64) -> i64
              scf.yield %2756 : i64
            }
            scf.yield %2753 : i64
          } else {
            %2757 = func.call @cc_add(%2721, %2732) : (i64, i64) -> i64
            scf.yield %2757 : i64
          }
          %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
          %2758 = arith.addi %2742, %__rlasp_stack_elide_zero_221 : i64
          scf.yield %2758 : i64
        }
        %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
        %2759 = arith.addi %2710, %__rlasp_stack_elide_zero_222 : i64
        %2760 = func.call @cc_errorp(%2759) : (i64) -> i64
        %2761 = func.call @cc_nil_value() : () -> i64
        %2762 = arith.cmpi ne, %2760, %2761 : i64
        scf.if %2762 {
          func.call @stack_push_pointer(%2759) : (i64) -> ()
        } else {
          %2763 = func.call @cc_multiple_value_list(%2759) : (i64) -> i64
          func.call @stack_push_pointer(%2763) : (i64) -> ()
        }
        %2764 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2765 = func.call @stack_pop_pointer() : () -> i64
        %2766 = func.call @cc_nil_value() : () -> i64
        %2767 = func.call @cc_maybe_error_from_multiple_value_list(%2764) : (i64) -> i64
        %2768 = func.call @cc_errorp(%2767) : (i64) -> i64
        %2769 = arith.cmpi ne, %2768, %2766 : i64
        %2770 = arith.cmpi eq, %2766, %2766 : i64
        %2771 = arith.andi %2769, %2770 : i1
        %2772 = scf.if %2771 -> (i64) {
          scf.yield %2767 : i64
        } else {
          scf.yield %2766 : i64
        }
        %2773 = arith.cmpi ne, %2772, %2766 : i64
        scf.if %2773 {
          func.call @stack_push_pointer(%2772) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2774 = func.call @stack_pop_pointer() : () -> i64
          %2775 = func.call @cc_cons(%2765, %2774) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
          %2776 = arith.addi %2775, %__rlasp_stack_elide_zero_223 : i64
          %2777 = func.call @cc_cons(%2764, %2776) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
          %2778 = arith.addi %2777, %__rlasp_stack_elide_zero_224 : i64
          %2779 = func.call @cc_values_pack(%2778) : (i64) -> i64
          func.call @stack_push_pointer(%2779) : (i64) -> ()
        }
        %2780 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2780 : i64
      }
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %2781 = arith.addi %2701, %__rlasp_stack_elide_zero_225 : i64
      %2782 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2783 = func.call @cc_errorp(%2781) : (i64) -> i64
      %2784 = func.call @cc_nil_value() : () -> i64
      %2785 = arith.cmpi ne, %2783, %2784 : i64
      scf.if %2785 {
        %2786 = func.call @cc_condition_value(%2781) : (i64) -> i64
        %2787 = func.call @cc_values2(%2784, %2786) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2787) : (i64) -> ()
      } else {
        %2788 = func.call @cc_multiple_value_list(%2781) : (i64) -> i64
        %2789 = func.call @cc_values_pack(%2788) : (i64) -> i64
        func.call @stack_push_pointer(%2789) : (i64) -> ()
      }
      %2790 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2790 : i64
    }
    func.call @stack_push_pointer(%2695) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645203"() {
    %3113 = func.call @cc_nil_value() : () -> i64
    %3114 = func.call @cc_nil_value() : () -> i64
    %3115 = func.call @cc_errorp(%3113) : (i64) -> i64
    %3116 = arith.cmpi ne, %3115, %3114 : i64
    %3117 = scf.if %3116 -> (i64) {
      scf.yield %3113 : i64
    } else {
      %3118 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3119 = arith.constant 8 : i64
      %3120 = func.call @cc_make_string(%3118, %3119) : (!llvm.ptr, i64) -> i64
      %3121 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3122 = arith.constant 7 : i64
      %3123 = func.call @cc_make_string(%3121, %3122) : (!llvm.ptr, i64) -> i64
      %3124 = func.call @cc_intern(%3120, %3123) : (i64, i64) -> i64
      %3125 = func.call @cc_nil_value() : () -> i64
      %3126 = func.call @cc_cons(%3124, %3125) : (i64, i64) -> i64
      %3127 = func.call @cc_values_pack(%3126) : (i64) -> i64
      func.call @stack_push_pointer(%3124) : (i64) -> ()
      %3128 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3129 = arith.constant 7 : i64
      %3130 = func.call @cc_make_string(%3128, %3129) : (!llvm.ptr, i64) -> i64
      %3131 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3132 = arith.constant 7 : i64
      %3133 = func.call @cc_make_string(%3131, %3132) : (!llvm.ptr, i64) -> i64
      %3134 = func.call @cc_intern(%3130, %3133) : (i64, i64) -> i64
      %3135 = func.call @cc_nil_value() : () -> i64
      %3136 = func.call @cc_cons(%3134, %3135) : (i64, i64) -> i64
      %3137 = func.call @cc_values_pack(%3136) : (i64) -> i64
      func.call @stack_push_pointer(%3134) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3138 = func.call @stack_pop_pointer() : () -> i64
      %3139 = func.call @stack_pop_pointer() : () -> i64
      %3140 = func.call @cc_cons(%3139, %3138) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %3141 = arith.addi %3140, %__rlasp_stack_elide_zero_226 : i64
      %3142 = func.call @stack_pop_pointer() : () -> i64
      %3143 = func.call @cc_cons(%3142, %3141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %3144 = arith.addi %3143, %__rlasp_stack_elide_zero_227 : i64
      %3145 = func.call @cc_push_float_trap_mask(%3144) : (i64) -> i64
      %3146 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%3146) : (i64) -> ()
      %3147 = func.call @stack_pop_pointer() : () -> i64
      %3148 = func.call @cc_random(%3147) : (i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %3149 = arith.addi %3148, %__rlasp_stack_elide_zero_228 : i64
      %3150 = func.call @cc_nil_value() : () -> i64
      %3151 = func.call @cc_nil_value() : () -> i64
      %3152 = func.call @cc_errorp(%3150) : (i64) -> i64
      %3153 = arith.cmpi ne, %3152, %3151 : i64
      %3154 = scf.if %3153 -> (i64) {
        scf.yield %3150 : i64
      } else {
        %3155 = func.call @cc_nil_value() : () -> i64
        %3156 = func.call @cc_errorp(%3149) : (i64) -> i64
        %3157 = arith.cmpi ne, %3156, %3155 : i64
        %3158 = arith.cmpi eq, %3155, %3155 : i64
        %3159 = arith.andi %3157, %3158 : i1
        %3160 = scf.if %3159 -> (i64) {
          scf.yield %3149 : i64
        } else {
          scf.yield %3155 : i64
        }
        %3161 = arith.cmpi ne, %3160, %3155 : i64
        scf.if %3161 {
          func.call @stack_push_pointer(%3160) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3149) : (i64) -> ()
          %3162 = llvm.mlir.addressof @str242 : !llvm.ptr
          %3163 = func.call @cc_make_function_ref_const(%3162) : (!llvm.ptr) -> i64
          %3164 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3163, %3164) : (i64, i64) -> ()
        }
        %3165 = func.call @stack_pop_pointer() : () -> i64
        %3166 = func.call @cc_nil_value() : () -> i64
        %3167 = func.call @cc_errorp(%3149) : (i64) -> i64
        %3168 = arith.cmpi ne, %3167, %3166 : i64
        %3169 = arith.cmpi eq, %3166, %3166 : i64
        %3170 = arith.andi %3168, %3169 : i1
        %3171 = scf.if %3170 -> (i64) {
          scf.yield %3149 : i64
        } else {
          scf.yield %3166 : i64
        }
        %3172 = arith.cmpi ne, %3171, %3166 : i64
        scf.if %3172 {
          func.call @stack_push_pointer(%3171) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3149) : (i64) -> ()
          %3173 = llvm.mlir.addressof @str243 : !llvm.ptr
          %3174 = func.call @cc_make_function_ref_const(%3173) : (!llvm.ptr) -> i64
          %3175 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3174, %3175) : (i64, i64) -> ()
        }
        %3176 = func.call @stack_pop_pointer() : () -> i64
        %3178 = arith.constant 3 : i64
        %3177 = arith.andi %3165, %3178 : i64
        %3179 = arith.constant 0 : i64
        %3180 = arith.cmpi eq, %3177, %3179 : i64
        %3182 = arith.constant 3 : i64
        %3181 = arith.andi %3176, %3182 : i64
        %3183 = arith.constant 0 : i64
        %3184 = arith.cmpi eq, %3181, %3183 : i64
        %3185 = arith.andi %3180, %3184 : i1
        %3186 = scf.if %3185 -> (i64) {
          %3187 = arith.constant 2 : i64
          %3188 = arith.shrsi %3165, %3187 : i64
          %3189 = arith.constant 2 : i64
          %3190 = arith.shrsi %3176, %3189 : i64
          %3191 = arith.addi %3188, %3190 : i64
          %3192 = arith.constant -2305843009213693952 : i64
          %3193 = arith.constant 2305843009213693951 : i64
          %3194 = arith.cmpi sge, %3191, %3192 : i64
          %3195 = arith.cmpi sle, %3191, %3193 : i64
          %3196 = arith.andi %3194, %3195 : i1
          %3197 = scf.if %3196 -> (i64) {
            %3198 = arith.constant 2 : i64
            %3199 = arith.shli %3191, %3198 : i64
            scf.yield %3199 : i64
          } else {
            %3200 = func.call @cc_add(%3165, %3176) : (i64, i64) -> i64
            scf.yield %3200 : i64
          }
          scf.yield %3197 : i64
        } else {
          %3201 = func.call @cc_add(%3165, %3176) : (i64, i64) -> i64
          scf.yield %3201 : i64
        }
        %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
        %3202 = arith.addi %3186, %__rlasp_stack_elide_zero_229 : i64
        scf.yield %3202 : i64
      }
      func.call @stack_push_pointer(%3154) : (i64) -> ()
      %3203 = func.call @cc_restore_float_trap_mask(%3145) : (i64) -> i64
      %3204 = func.call @stack_pop_pointer() : () -> i64
      %3205 = func.call @cc_nil_value() : () -> i64
      %3206 = func.call @cc_errorp(%3204) : (i64) -> i64
      %3207 = arith.cmpi ne, %3206, %3205 : i64
      %3208 = arith.cmpi eq, %3205, %3205 : i64
      %3209 = arith.andi %3207, %3208 : i1
      %3210 = scf.if %3209 -> (i64) {
        scf.yield %3204 : i64
      } else {
        scf.yield %3205 : i64
      }
      %3211 = arith.cmpi ne, %3210, %3205 : i64
      scf.if %3211 {
        func.call @stack_push_pointer(%3210) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3204) : (i64) -> ()
        %3212 = llvm.mlir.addressof @str244 : !llvm.ptr
        %3213 = func.call @cc_make_function_ref_const(%3212) : (!llvm.ptr) -> i64
        %3214 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3213, %3214) : (i64, i64) -> ()
      }
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @cc_nil_value() : () -> i64
      %3217 = func.call @cc_cons(%3215, %3216) : (i64, i64) -> i64
      %3218 = func.call @cc_not(%3217) : (i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %3219 = arith.addi %3218, %__rlasp_stack_elide_zero_230 : i64
      %3220 = func.call @cc_nil_value() : () -> i64
      %3221 = func.call @cc_cons(%3219, %3220) : (i64, i64) -> i64
      %3222 = func.call @cc_not(%3221) : (i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %3223 = arith.addi %3222, %__rlasp_stack_elide_zero_231 : i64
      scf.yield %3223 : i64
    }
    func.call @stack_push_pointer(%3117) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645204"() {
    %3491 = func.call @cc_nil_value() : () -> i64
    %3492 = func.call @cc_nil_value() : () -> i64
    %3493 = func.call @cc_errorp(%3491) : (i64) -> i64
    %3494 = arith.cmpi ne, %3493, %3492 : i64
    %3495 = scf.if %3494 -> (i64) {
      scf.yield %3491 : i64
    } else {
      %3496 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3497 = func.call @cc_nil_value() : () -> i64
      %3498 = func.call @cc_nil_value() : () -> i64
      %3499 = func.call @cc_errorp(%3497) : (i64) -> i64
      %3500 = arith.cmpi ne, %3499, %3498 : i64
      %3501 = scf.if %3500 -> (i64) {
        scf.yield %3497 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3502 = arith.constant 100 : i64
        func.call @stack_push_fixnum(%3502) : (i64) -> ()
        %3503 = func.call @stack_pop_pointer() : () -> i64
        %3504 = func.call @cc_random(%3503) : (i64) -> i64
        %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
        %3505 = arith.addi %3504, %__rlasp_stack_elide_zero_232 : i64
        %3506 = func.call @cc_nil_value() : () -> i64
        %3507 = func.call @cc_nil_value() : () -> i64
        %3508 = func.call @cc_errorp(%3506) : (i64) -> i64
        %3509 = arith.cmpi ne, %3508, %3507 : i64
        %3510 = scf.if %3509 -> (i64) {
          scf.yield %3506 : i64
        } else {
          %3511 = func.call @cc_nil_value() : () -> i64
          %3512 = func.call @cc_errorp(%3505) : (i64) -> i64
          %3513 = arith.cmpi ne, %3512, %3511 : i64
          %3514 = arith.cmpi eq, %3511, %3511 : i64
          %3515 = arith.andi %3513, %3514 : i1
          %3516 = scf.if %3515 -> (i64) {
            scf.yield %3505 : i64
          } else {
            scf.yield %3511 : i64
          }
          %3517 = arith.cmpi ne, %3516, %3511 : i64
          scf.if %3517 {
            func.call @stack_push_pointer(%3516) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3505) : (i64) -> ()
            %3518 = llvm.mlir.addressof @str267 : !llvm.ptr
            %3519 = func.call @cc_make_function_ref_const(%3518) : (!llvm.ptr) -> i64
            %3520 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3519, %3520) : (i64, i64) -> ()
          }
          %3521 = func.call @stack_pop_pointer() : () -> i64
          %3522 = func.call @cc_nil_value() : () -> i64
          %3523 = func.call @cc_errorp(%3505) : (i64) -> i64
          %3524 = arith.cmpi ne, %3523, %3522 : i64
          %3525 = arith.cmpi eq, %3522, %3522 : i64
          %3526 = arith.andi %3524, %3525 : i1
          %3527 = scf.if %3526 -> (i64) {
            scf.yield %3505 : i64
          } else {
            scf.yield %3522 : i64
          }
          %3528 = arith.cmpi ne, %3527, %3522 : i64
          scf.if %3528 {
            func.call @stack_push_pointer(%3527) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3505) : (i64) -> ()
            %3529 = llvm.mlir.addressof @str268 : !llvm.ptr
            %3530 = func.call @cc_make_function_ref_const(%3529) : (!llvm.ptr) -> i64
            %3531 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3530, %3531) : (i64, i64) -> ()
          }
          %3532 = func.call @stack_pop_pointer() : () -> i64
          %3534 = arith.constant 3 : i64
          %3533 = arith.andi %3521, %3534 : i64
          %3535 = arith.constant 0 : i64
          %3536 = arith.cmpi eq, %3533, %3535 : i64
          %3538 = arith.constant 3 : i64
          %3537 = arith.andi %3532, %3538 : i64
          %3539 = arith.constant 0 : i64
          %3540 = arith.cmpi eq, %3537, %3539 : i64
          %3541 = arith.andi %3536, %3540 : i1
          %3542 = scf.if %3541 -> (i64) {
            %3543 = arith.constant 2 : i64
            %3544 = arith.shrsi %3521, %3543 : i64
            %3545 = arith.constant 2 : i64
            %3546 = arith.shrsi %3532, %3545 : i64
            %3547 = arith.addi %3544, %3546 : i64
            %3548 = arith.constant -2305843009213693952 : i64
            %3549 = arith.constant 2305843009213693951 : i64
            %3550 = arith.cmpi sge, %3547, %3548 : i64
            %3551 = arith.cmpi sle, %3547, %3549 : i64
            %3552 = arith.andi %3550, %3551 : i1
            %3553 = scf.if %3552 -> (i64) {
              %3554 = arith.constant 2 : i64
              %3555 = arith.shli %3547, %3554 : i64
              scf.yield %3555 : i64
            } else {
              %3556 = func.call @cc_add(%3521, %3532) : (i64, i64) -> i64
              scf.yield %3556 : i64
            }
            scf.yield %3553 : i64
          } else {
            %3557 = func.call @cc_add(%3521, %3532) : (i64, i64) -> i64
            scf.yield %3557 : i64
          }
          %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
          %3558 = arith.addi %3542, %__rlasp_stack_elide_zero_233 : i64
          scf.yield %3558 : i64
        }
        %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
        %3559 = arith.addi %3510, %__rlasp_stack_elide_zero_234 : i64
        %3560 = func.call @cc_errorp(%3559) : (i64) -> i64
        %3561 = func.call @cc_nil_value() : () -> i64
        %3562 = arith.cmpi ne, %3560, %3561 : i64
        scf.if %3562 {
          func.call @stack_push_pointer(%3559) : (i64) -> ()
        } else {
          %3563 = func.call @cc_multiple_value_list(%3559) : (i64) -> i64
          func.call @stack_push_pointer(%3563) : (i64) -> ()
        }
        %3564 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3565 = func.call @stack_pop_pointer() : () -> i64
        %3566 = func.call @cc_nil_value() : () -> i64
        %3567 = func.call @cc_maybe_error_from_multiple_value_list(%3564) : (i64) -> i64
        %3568 = func.call @cc_errorp(%3567) : (i64) -> i64
        %3569 = arith.cmpi ne, %3568, %3566 : i64
        %3570 = arith.cmpi eq, %3566, %3566 : i64
        %3571 = arith.andi %3569, %3570 : i1
        %3572 = scf.if %3571 -> (i64) {
          scf.yield %3567 : i64
        } else {
          scf.yield %3566 : i64
        }
        %3573 = arith.cmpi ne, %3572, %3566 : i64
        scf.if %3573 {
          func.call @stack_push_pointer(%3572) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3574 = func.call @stack_pop_pointer() : () -> i64
          %3575 = func.call @cc_cons(%3565, %3574) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
          %3576 = arith.addi %3575, %__rlasp_stack_elide_zero_235 : i64
          %3577 = func.call @cc_cons(%3564, %3576) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
          %3578 = arith.addi %3577, %__rlasp_stack_elide_zero_236 : i64
          %3579 = func.call @cc_values_pack(%3578) : (i64) -> i64
          func.call @stack_push_pointer(%3579) : (i64) -> ()
        }
        %3580 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3580 : i64
      }
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %3581 = arith.addi %3501, %__rlasp_stack_elide_zero_237 : i64
      %3582 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3583 = func.call @cc_errorp(%3581) : (i64) -> i64
      %3584 = func.call @cc_nil_value() : () -> i64
      %3585 = arith.cmpi ne, %3583, %3584 : i64
      scf.if %3585 {
        %3586 = func.call @cc_condition_value(%3581) : (i64) -> i64
        %3587 = func.call @cc_values2(%3584, %3586) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3587) : (i64) -> ()
      } else {
        %3588 = func.call @cc_multiple_value_list(%3581) : (i64) -> i64
        %3589 = func.call @cc_values_pack(%3588) : (i64) -> i64
        func.call @stack_push_pointer(%3589) : (i64) -> ()
      }
      %3590 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3590 : i64
    }
    func.call @stack_push_pointer(%3495) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645205"() {
    %3929 = func.call @cc_nil_value() : () -> i64
    %3930 = func.call @cc_nil_value() : () -> i64
    %3931 = func.call @cc_errorp(%3929) : (i64) -> i64
    %3932 = arith.cmpi ne, %3931, %3930 : i64
    %3933 = scf.if %3932 -> (i64) {
      scf.yield %3929 : i64
    } else {
      %3934 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3935 = arith.constant 7 : i64
      %3936 = func.call @cc_make_string(%3934, %3935) : (!llvm.ptr, i64) -> i64
      %3937 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3938 = arith.constant 7 : i64
      %3939 = func.call @cc_make_string(%3937, %3938) : (!llvm.ptr, i64) -> i64
      %3940 = func.call @cc_intern(%3936, %3939) : (i64, i64) -> i64
      %3941 = func.call @cc_nil_value() : () -> i64
      %3942 = func.call @cc_cons(%3940, %3941) : (i64, i64) -> i64
      %3943 = func.call @cc_values_pack(%3942) : (i64) -> i64
      func.call @stack_push_pointer(%3940) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3944 = func.call @stack_pop_pointer() : () -> i64
      %3945 = func.call @stack_pop_pointer() : () -> i64
      %3946 = func.call @cc_cons(%3945, %3944) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %3947 = arith.addi %3946, %__rlasp_stack_elide_zero_238 : i64
      %3948 = func.call @cc_push_float_trap_mask(%3947) : (i64) -> i64
      %3949 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%3949) : (i64) -> ()
      %3950 = func.call @stack_pop_pointer() : () -> i64
      %3951 = func.call @cc_random(%3950) : (i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %3952 = arith.addi %3951, %__rlasp_stack_elide_zero_239 : i64
      %3953 = func.call @cc_nil_value() : () -> i64
      %3954 = func.call @cc_nil_value() : () -> i64
      %3955 = func.call @cc_errorp(%3953) : (i64) -> i64
      %3956 = arith.cmpi ne, %3955, %3954 : i64
      %3957 = scf.if %3956 -> (i64) {
        scf.yield %3953 : i64
      } else {
        %3958 = func.call @cc_nil_value() : () -> i64
        %3959 = func.call @cc_errorp(%3952) : (i64) -> i64
        %3960 = arith.cmpi ne, %3959, %3958 : i64
        %3961 = arith.cmpi eq, %3958, %3958 : i64
        %3962 = arith.andi %3960, %3961 : i1
        %3963 = scf.if %3962 -> (i64) {
          scf.yield %3952 : i64
        } else {
          scf.yield %3958 : i64
        }
        %3964 = arith.cmpi ne, %3963, %3958 : i64
        scf.if %3964 {
          func.call @stack_push_pointer(%3963) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3952) : (i64) -> ()
          %3965 = llvm.mlir.addressof @str303 : !llvm.ptr
          %3966 = func.call @cc_make_function_ref_const(%3965) : (!llvm.ptr) -> i64
          %3967 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3966, %3967) : (i64, i64) -> ()
        }
        %3968 = func.call @stack_pop_pointer() : () -> i64
        %3969 = func.call @cc_nil_value() : () -> i64
        %3970 = func.call @cc_errorp(%3952) : (i64) -> i64
        %3971 = arith.cmpi ne, %3970, %3969 : i64
        %3972 = arith.cmpi eq, %3969, %3969 : i64
        %3973 = arith.andi %3971, %3972 : i1
        %3974 = scf.if %3973 -> (i64) {
          scf.yield %3952 : i64
        } else {
          scf.yield %3969 : i64
        }
        %3975 = arith.cmpi ne, %3974, %3969 : i64
        scf.if %3975 {
          func.call @stack_push_pointer(%3974) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3952) : (i64) -> ()
          %3976 = llvm.mlir.addressof @str304 : !llvm.ptr
          %3977 = func.call @cc_make_function_ref_const(%3976) : (!llvm.ptr) -> i64
          %3978 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3977, %3978) : (i64, i64) -> ()
        }
        %3979 = func.call @stack_pop_pointer() : () -> i64
        %3980 = func.call @cc_div(%3968, %3979) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
        %3981 = arith.addi %3980, %__rlasp_stack_elide_zero_240 : i64
        scf.yield %3981 : i64
      }
      func.call @stack_push_pointer(%3957) : (i64) -> ()
      %3982 = func.call @cc_restore_float_trap_mask(%3948) : (i64) -> i64
      %3983 = func.call @stack_pop_pointer() : () -> i64
      %3984 = func.call @cc_nil_value() : () -> i64
      %3985 = func.call @cc_errorp(%3983) : (i64) -> i64
      %3986 = arith.cmpi ne, %3985, %3984 : i64
      %3987 = arith.cmpi eq, %3984, %3984 : i64
      %3988 = arith.andi %3986, %3987 : i1
      %3989 = scf.if %3988 -> (i64) {
        scf.yield %3983 : i64
      } else {
        scf.yield %3984 : i64
      }
      %3990 = arith.cmpi ne, %3989, %3984 : i64
      scf.if %3990 {
        func.call @stack_push_pointer(%3989) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3983) : (i64) -> ()
        %3991 = llvm.mlir.addressof @str305 : !llvm.ptr
        %3992 = func.call @cc_make_function_ref_const(%3991) : (!llvm.ptr) -> i64
        %3993 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3992, %3993) : (i64, i64) -> ()
      }
      %3994 = func.call @stack_pop_pointer() : () -> i64
      %3995 = func.call @cc_nil_value() : () -> i64
      %3996 = func.call @cc_cons(%3994, %3995) : (i64, i64) -> i64
      %3997 = func.call @cc_not(%3996) : (i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %3998 = arith.addi %3997, %__rlasp_stack_elide_zero_241 : i64
      %3999 = func.call @cc_nil_value() : () -> i64
      %4000 = func.call @cc_cons(%3998, %3999) : (i64, i64) -> i64
      %4001 = func.call @cc_not(%4000) : (i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %4002 = arith.addi %4001, %__rlasp_stack_elide_zero_242 : i64
      scf.yield %4002 : i64
    }
    func.call @stack_push_pointer(%3933) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_152926823645206"() {
    %4270 = func.call @cc_nil_value() : () -> i64
    %4271 = func.call @cc_nil_value() : () -> i64
    %4272 = func.call @cc_errorp(%4270) : (i64) -> i64
    %4273 = arith.cmpi ne, %4272, %4271 : i64
    %4274 = scf.if %4273 -> (i64) {
      scf.yield %4270 : i64
    } else {
      %4275 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4276 = func.call @cc_nil_value() : () -> i64
      %4277 = func.call @cc_nil_value() : () -> i64
      %4278 = func.call @cc_errorp(%4276) : (i64) -> i64
      %4279 = arith.cmpi ne, %4278, %4277 : i64
      %4280 = scf.if %4279 -> (i64) {
        scf.yield %4276 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4281 = arith.constant 100 : i64
        func.call @stack_push_fixnum(%4281) : (i64) -> ()
        %4282 = func.call @stack_pop_pointer() : () -> i64
        %4283 = func.call @cc_random(%4282) : (i64) -> i64
        %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
        %4284 = arith.addi %4283, %__rlasp_stack_elide_zero_243 : i64
        %4285 = func.call @cc_nil_value() : () -> i64
        %4286 = func.call @cc_nil_value() : () -> i64
        %4287 = func.call @cc_errorp(%4285) : (i64) -> i64
        %4288 = arith.cmpi ne, %4287, %4286 : i64
        %4289 = scf.if %4288 -> (i64) {
          scf.yield %4285 : i64
        } else {
          %4290 = func.call @cc_nil_value() : () -> i64
          %4291 = func.call @cc_errorp(%4284) : (i64) -> i64
          %4292 = arith.cmpi ne, %4291, %4290 : i64
          %4293 = arith.cmpi eq, %4290, %4290 : i64
          %4294 = arith.andi %4292, %4293 : i1
          %4295 = scf.if %4294 -> (i64) {
            scf.yield %4284 : i64
          } else {
            scf.yield %4290 : i64
          }
          %4296 = arith.cmpi ne, %4295, %4290 : i64
          scf.if %4296 {
            func.call @stack_push_pointer(%4295) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4284) : (i64) -> ()
            %4297 = llvm.mlir.addressof @str328 : !llvm.ptr
            %4298 = func.call @cc_make_function_ref_const(%4297) : (!llvm.ptr) -> i64
            %4299 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4298, %4299) : (i64, i64) -> ()
          }
          %4300 = func.call @stack_pop_pointer() : () -> i64
          %4301 = func.call @cc_nil_value() : () -> i64
          %4302 = func.call @cc_errorp(%4284) : (i64) -> i64
          %4303 = arith.cmpi ne, %4302, %4301 : i64
          %4304 = arith.cmpi eq, %4301, %4301 : i64
          %4305 = arith.andi %4303, %4304 : i1
          %4306 = scf.if %4305 -> (i64) {
            scf.yield %4284 : i64
          } else {
            scf.yield %4301 : i64
          }
          %4307 = arith.cmpi ne, %4306, %4301 : i64
          scf.if %4307 {
            func.call @stack_push_pointer(%4306) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4284) : (i64) -> ()
            %4308 = llvm.mlir.addressof @str329 : !llvm.ptr
            %4309 = func.call @cc_make_function_ref_const(%4308) : (!llvm.ptr) -> i64
            %4310 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4309, %4310) : (i64, i64) -> ()
          }
          %4311 = func.call @stack_pop_pointer() : () -> i64
          %4312 = func.call @cc_div(%4300, %4311) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
          %4313 = arith.addi %4312, %__rlasp_stack_elide_zero_244 : i64
          scf.yield %4313 : i64
        }
        %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
        %4314 = arith.addi %4289, %__rlasp_stack_elide_zero_245 : i64
        %4315 = func.call @cc_errorp(%4314) : (i64) -> i64
        %4316 = func.call @cc_nil_value() : () -> i64
        %4317 = arith.cmpi ne, %4315, %4316 : i64
        scf.if %4317 {
          func.call @stack_push_pointer(%4314) : (i64) -> ()
        } else {
          %4318 = func.call @cc_multiple_value_list(%4314) : (i64) -> i64
          func.call @stack_push_pointer(%4318) : (i64) -> ()
        }
        %4319 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4320 = func.call @stack_pop_pointer() : () -> i64
        %4321 = func.call @cc_nil_value() : () -> i64
        %4322 = func.call @cc_maybe_error_from_multiple_value_list(%4319) : (i64) -> i64
        %4323 = func.call @cc_errorp(%4322) : (i64) -> i64
        %4324 = arith.cmpi ne, %4323, %4321 : i64
        %4325 = arith.cmpi eq, %4321, %4321 : i64
        %4326 = arith.andi %4324, %4325 : i1
        %4327 = scf.if %4326 -> (i64) {
          scf.yield %4322 : i64
        } else {
          scf.yield %4321 : i64
        }
        %4328 = arith.cmpi ne, %4327, %4321 : i64
        scf.if %4328 {
          func.call @stack_push_pointer(%4327) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4329 = func.call @stack_pop_pointer() : () -> i64
          %4330 = func.call @cc_cons(%4320, %4329) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
          %4331 = arith.addi %4330, %__rlasp_stack_elide_zero_246 : i64
          %4332 = func.call @cc_cons(%4319, %4331) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
          %4333 = arith.addi %4332, %__rlasp_stack_elide_zero_247 : i64
          %4334 = func.call @cc_values_pack(%4333) : (i64) -> i64
          func.call @stack_push_pointer(%4334) : (i64) -> ()
        }
        %4335 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4335 : i64
      }
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %4336 = arith.addi %4280, %__rlasp_stack_elide_zero_248 : i64
      %4337 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4338 = func.call @cc_errorp(%4336) : (i64) -> i64
      %4339 = func.call @cc_nil_value() : () -> i64
      %4340 = arith.cmpi ne, %4338, %4339 : i64
      scf.if %4340 {
        %4341 = func.call @cc_condition_value(%4336) : (i64) -> i64
        %4342 = func.call @cc_values2(%4339, %4341) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4342) : (i64) -> ()
      } else {
        %4343 = func.call @cc_multiple_value_list(%4336) : (i64) -> i64
        %4344 = func.call @cc_values_pack(%4343) : (i64) -> i64
        func.call @stack_push_pointer(%4344) : (i64) -> ()
      }
      %4345 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4345 : i64
    }
    func.call @stack_push_pointer(%4274) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_152926823645184*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_152926823645184*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_152926823645184*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str6("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str7("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str8("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETFLAG_152926823645184*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETMVLIST_152926823645184*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str11("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str12("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_152926823645185*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETVALUE_152926823645185*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETMVLIST_152926823645185*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str16("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_152926823645185*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_152926823645185*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str22("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str23("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETFLAG_152926823645186*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETVALUE_152926823645186*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETMVLIST_152926823645186*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str27("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_152926823645186*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETMVLIST_152926823645186*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str33("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str34("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETFLAG_152926823645187*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETVALUE_152926823645187*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETMVLIST_152926823645187*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str38("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str39("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str40("MOST-POSITIVE-LONG-FLOAT\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("*__MLIR_BLOCK_RETFLAG_152926823645187*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETMVLIST_152926823645187*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str44("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str45("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str46("*__MLIR_BLOCK_RETFLAG_152926823645188*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str47("*__MLIR_BLOCK_RETVALUE_152926823645188*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETMVLIST_152926823645188*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETFLAG_152926823645188*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETMVLIST_152926823645188*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str51("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str52("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str53("*__MLIR_BLOCK_RETFLAG_152926823645189*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str54("*__MLIR_BLOCK_RETVALUE_152926823645189*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str55("*__MLIR_BLOCK_RETMVLIST_152926823645189*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str56("*__MLIR_BLOCK_RETFLAG_152926823645189*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str57("*__MLIR_BLOCK_RETMVLIST_152926823645189*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str58("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETFLAG_152926823645190*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str60("*__MLIR_BLOCK_RETVALUE_152926823645190*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str61("*__MLIR_BLOCK_RETMVLIST_152926823645190*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str62("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("FLOAT-FEATURES-1A\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str64("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str65("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str66("FLOAT-INFINITY-P\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str67("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str68("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str71("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str72(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str77("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str78(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str83("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str84("DIVIDE-BY-ZERO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str89("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str90("LOCAL_FOO_152926823645192\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str91("*__MLIR_BLOCK_RETFLAG_152926823645194*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str92("*__MLIR_BLOCK_RETVALUE_152926823645194*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str93("*__MLIR_BLOCK_RETMVLIST_152926823645194*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str94("*__MLIR_BLOCK_RETFLAG_152926823645194*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str95("*__MLIR_BLOCK_RETMVLIST_152926823645194*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str96("LOCAL_BAR_152926823645193\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str97("*__MLIR_BLOCK_RETFLAG_152926823645195*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETVALUE_152926823645195*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str99("*__MLIR_BLOCK_RETMVLIST_152926823645195*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str100("*__MLIR_BLOCK_RETFLAG_152926823645195*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str101("*__MLIR_BLOCK_RETMVLIST_152926823645195*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str102("DIVIDE-BY-ZERO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str103("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str104("ext:float-infinity-p\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str105("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str106("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str108("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str110("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str112("FLOAT-FEATURES-1B\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str113("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str114("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str116("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str117("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str118("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str120("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str121(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str126("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str127(">\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str128("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str132("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str133("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str134("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str135("LOCAL_FOO_152926823645197\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str136("*__MLIR_BLOCK_RETFLAG_152926823645199*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str137("*__MLIR_BLOCK_RETVALUE_152926823645199*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str138("*__MLIR_BLOCK_RETMVLIST_152926823645199*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str139("*__MLIR_BLOCK_RETFLAG_152926823645199*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str140("*__MLIR_BLOCK_RETMVLIST_152926823645199*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str141("LOCAL_BAR_152926823645198\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str142("*__MLIR_BLOCK_RETFLAG_152926823645200*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str143("*__MLIR_BLOCK_RETVALUE_152926823645200*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str144("*__MLIR_BLOCK_RETMVLIST_152926823645200*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str145("*__MLIR_BLOCK_RETFLAG_152926823645200*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str146("*__MLIR_BLOCK_RETMVLIST_152926823645200*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str147("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str148("DIVISION-BY-ZERO\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str155("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str156("FLOAT-FEATURES-3\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str157("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str158("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str159("FLOAT-INFINITY-P\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str160("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str161("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str162("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str163("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str164("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str165("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str166("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str167("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str168("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str169("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str170("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str172("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str173("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str174("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str175("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str176("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str177("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str178("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str179("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str182("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str183("ext:float-infinity-p\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str184("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str185("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str189("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str190("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str191("FLOAT-FEATURES-4\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str192("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str193("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str195("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str196("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str197("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str198("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str201("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str202("FOO-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str203("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str204("BAR-EXT-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str205("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("%FN%foo-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str207("%FN%bar-ext-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str208("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str209("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str210("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str211("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str213("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str214("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str216("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str217("FLOAT-FEATURES-5\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str218("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str219("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str220("FLOAT-INFINITY-P\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str221("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str222("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str223("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str224("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str225("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str228("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str229("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str230("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str233("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str234("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str235("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str236("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str237("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str238("OVERFLOW\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str239("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str240("INEXACT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str241("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str242("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str243("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str244("ext:float-infinity-p\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str245("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str246("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str248("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str249("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str250("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str251("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str252("FLOAT-FEATURES-6\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str253("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str254("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str255("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str256("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str257("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str258("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str259("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str260("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("FOO-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str264("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str265("BAR-EXT-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str266("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str267("%FN%foo-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str268("%FN%bar-ext-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str269("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str270("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str271("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str272("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("FLOATING-POINT-OVERFLOW\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str275("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str276("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str277("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str278("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str279("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str280("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str281("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str282("FLOAT-FEATURES-7\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str283("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str284("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str285("FLOAT-NAN-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str286("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str287("WITH-FLOAT-TRAPS-MASKED\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str288("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str289("INVALID\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str290("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str292("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str293("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str294("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str295("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str296("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str298("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str299("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str300("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str301("INVALID\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str302("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str303("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str304("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str305("ext:float-nan-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str306("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str307("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str308("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str309("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str310("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str311("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str312("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str313("FLOAT-FEATURES-8\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str314("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str315("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str317("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str318("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str319("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str320("RANDOM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("/\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str323("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("FOO-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str325("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str326("BAR-EXT-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str327("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str328("%FN%foo-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str329("%FN%bar-ext-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str330("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str331("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str332("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str333("FLOATING-POINT-INEXACT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str334("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("FLOATING-POINT-INVALID-OPERATION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str336("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str338("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str339("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str340("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str341("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str342("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str343("*__MLIR_BLOCK_RETFLAG_152926823645190*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str344("*__MLIR_BLOCK_RETMVLIST_152926823645190*\00") : !llvm.array<41 x i8>
}
