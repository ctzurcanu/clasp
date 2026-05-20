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
  func.func @"%FN%qsort"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 5 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 26 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = arith.constant 4 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @stack_pop_pointer() : () -> i64
    %15 = func.call @stack_pop_pointer() : () -> i64
    %16 = func.call @stack_pop_pointer() : () -> i64
    %17 = func.call @cc_nil_value() : () -> i64
    %18 = llvm.mlir.addressof @str2 : !llvm.ptr
    %19 = arith.constant 38 : i64
    %20 = func.call @cc_make_string(%18, %19) : (!llvm.ptr, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_intern(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_nil_value() : () -> i64
    %24 = func.call @cc_cons(%22, %23) : (i64, i64) -> i64
    %25 = func.call @cc_values_pack(%24) : (i64) -> i64
    %26 = func.call @cc_set_symbol_value(%22, %17) : (i64, i64) -> i64
    %27 = llvm.mlir.addressof @str3 : !llvm.ptr
    %28 = arith.constant 39 : i64
    %29 = func.call @cc_make_string(%27, %28) : (!llvm.ptr, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_intern(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_nil_value() : () -> i64
    %33 = func.call @cc_cons(%31, %32) : (i64, i64) -> i64
    %34 = func.call @cc_values_pack(%33) : (i64) -> i64
    %35 = func.call @cc_set_symbol_value(%31, %17) : (i64, i64) -> i64
    %36 = llvm.mlir.addressof @str4 : !llvm.ptr
    %37 = arith.constant 40 : i64
    %38 = func.call @cc_make_string(%36, %37) : (!llvm.ptr, i64) -> i64
    %39 = func.call @cc_nil_value() : () -> i64
    %40 = func.call @cc_intern(%38, %39) : (i64, i64) -> i64
    %41 = func.call @cc_nil_value() : () -> i64
    %42 = func.call @cc_cons(%40, %41) : (i64, i64) -> i64
    %43 = func.call @cc_values_pack(%42) : (i64) -> i64
    %44 = func.call @cc_set_symbol_value(%40, %17) : (i64, i64) -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = llvm.mlir.addressof @str5 : !llvm.ptr
    %47 = arith.constant 38 : i64
    %48 = func.call @cc_make_string(%46, %47) : (!llvm.ptr, i64) -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_intern(%48, %49) : (i64, i64) -> i64
    %51 = func.call @cc_nil_value() : () -> i64
    %52 = func.call @cc_cons(%50, %51) : (i64, i64) -> i64
    %53 = func.call @cc_values_pack(%52) : (i64) -> i64
    %54 = func.call @cc_set_symbol_value(%50, %45) : (i64, i64) -> i64
    %55 = llvm.mlir.addressof @str6 : !llvm.ptr
    %56 = arith.constant 39 : i64
    %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
    %58 = func.call @cc_nil_value() : () -> i64
    %59 = func.call @cc_intern(%57, %58) : (i64, i64) -> i64
    %60 = func.call @cc_nil_value() : () -> i64
    %61 = func.call @cc_cons(%59, %60) : (i64, i64) -> i64
    %62 = func.call @cc_values_pack(%61) : (i64) -> i64
    %63 = func.call @cc_set_symbol_value(%59, %45) : (i64, i64) -> i64
    %64 = llvm.mlir.addressof @str7 : !llvm.ptr
    %65 = arith.constant 40 : i64
    %66 = func.call @cc_make_string(%64, %65) : (!llvm.ptr, i64) -> i64
    %67 = func.call @cc_nil_value() : () -> i64
    %68 = func.call @cc_intern(%66, %67) : (i64, i64) -> i64
    %69 = func.call @cc_nil_value() : () -> i64
    %70 = func.call @cc_cons(%68, %69) : (i64, i64) -> i64
    %71 = func.call @cc_values_pack(%70) : (i64) -> i64
    %72 = func.call @cc_set_symbol_value(%68, %45) : (i64, i64) -> i64
    func.call @stack_push_pointer(%16) : (i64) -> ()
    %73 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%15) : (i64) -> ()
    %74 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%14) : (i64) -> ()
    %75 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %76 = func.call @stack_pop_pointer() : () -> i64
    %77 = func.call @cc_nil_value() : () -> i64
    %78 = func.call @cc_nil_value() : () -> i64
    %79 = func.call @cc_errorp(%77) : (i64) -> i64
    %80 = arith.cmpi ne, %79, %78 : i64
    %81 = scf.if %80 -> (i64) {
      scf.yield %77 : i64
    } else {
      %82 = llvm.mlir.addressof @str8 : !llvm.ptr
      %83 = arith.constant 5 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%84) : (i64) -> ()
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = llvm.mlir.addressof @str9 : !llvm.ptr
      %87 = arith.constant 7 : i64
      %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
      %89 = llvm.mlir.addressof @str10 : !llvm.ptr
      %90 = arith.constant 7 : i64
      %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
      %92 = func.call @cc_intern(%88, %91) : (i64, i64) -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_cons(%92, %93) : (i64, i64) -> i64
      %95 = func.call @cc_values_pack(%94) : (i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %96 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%73) : (i64) -> ()
      %97 = func.call @stack_pop_pointer() : () -> i64
      %98 = llvm.mlir.addressof @str11 : !llvm.ptr
      %99 = arith.constant 3 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = llvm.mlir.addressof @str12 : !llvm.ptr
      %102 = arith.constant 7 : i64
      %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
      %104 = func.call @cc_intern(%100, %103) : (i64, i64) -> i64
      %105 = func.call @cc_nil_value() : () -> i64
      %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
      %107 = func.call @cc_values_pack(%106) : (i64) -> i64
      func.call @stack_push_pointer(%104) : (i64) -> ()
      %108 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%74) : (i64) -> ()
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = llvm.mlir.addressof @str13 : !llvm.ptr
      %111 = arith.constant 3 : i64
      %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
      %113 = llvm.mlir.addressof @str14 : !llvm.ptr
      %114 = arith.constant 7 : i64
      %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
      %116 = func.call @cc_intern(%112, %115) : (i64, i64) -> i64
      %117 = func.call @cc_nil_value() : () -> i64
      %118 = func.call @cc_cons(%116, %117) : (i64, i64) -> i64
      %119 = func.call @cc_values_pack(%118) : (i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      %120 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%75) : (i64) -> ()
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = llvm.mlir.addressof @str15 : !llvm.ptr
      %123 = arith.constant 7 : i64
      %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
      %125 = llvm.mlir.addressof @str16 : !llvm.ptr
      %126 = arith.constant 7 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = func.call @cc_intern(%124, %127) : (i64, i64) -> i64
      %129 = func.call @cc_nil_value() : () -> i64
      %130 = func.call @cc_cons(%128, %129) : (i64, i64) -> i64
      %131 = func.call @cc_values_pack(%130) : (i64) -> i64
      func.call @stack_push_pointer(%128) : (i64) -> ()
      %132 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%76) : (i64) -> ()
      %133 = func.call @stack_pop_pointer() : () -> i64
      %134 = llvm.mlir.addressof @str17 : !llvm.ptr
      %135 = arith.constant 4 : i64
      %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
      %137 = llvm.mlir.addressof @str18 : !llvm.ptr
      %138 = arith.constant 7 : i64
      %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
      %140 = func.call @cc_intern(%136, %139) : (i64, i64) -> i64
      %141 = func.call @cc_nil_value() : () -> i64
      %142 = func.call @cc_cons(%140, %141) : (i64, i64) -> i64
      %143 = func.call @cc_values_pack(%142) : (i64) -> i64
      func.call @stack_push_pointer(%140) : (i64) -> ()
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_errorp(%85) : (i64) -> i64
      %147 = arith.cmpi ne, %146, %145 : i64
      %148 = arith.cmpi eq, %145, %145 : i64
      %149 = arith.andi %147, %148 : i1
      %150 = scf.if %149 -> (i64) {
        scf.yield %85 : i64
      } else {
        scf.yield %145 : i64
      }
      %151 = func.call @cc_errorp(%96) : (i64) -> i64
      %152 = arith.cmpi ne, %151, %145 : i64
      %153 = arith.cmpi eq, %150, %145 : i64
      %154 = arith.andi %152, %153 : i1
      %155 = scf.if %154 -> (i64) {
        scf.yield %96 : i64
      } else {
        scf.yield %150 : i64
      }
      %156 = func.call @cc_errorp(%97) : (i64) -> i64
      %157 = arith.cmpi ne, %156, %145 : i64
      %158 = arith.cmpi eq, %155, %145 : i64
      %159 = arith.andi %157, %158 : i1
      %160 = scf.if %159 -> (i64) {
        scf.yield %97 : i64
      } else {
        scf.yield %155 : i64
      }
      %161 = func.call @cc_errorp(%108) : (i64) -> i64
      %162 = arith.cmpi ne, %161, %145 : i64
      %163 = arith.cmpi eq, %160, %145 : i64
      %164 = arith.andi %162, %163 : i1
      %165 = scf.if %164 -> (i64) {
        scf.yield %108 : i64
      } else {
        scf.yield %160 : i64
      }
      %166 = func.call @cc_errorp(%109) : (i64) -> i64
      %167 = arith.cmpi ne, %166, %145 : i64
      %168 = arith.cmpi eq, %165, %145 : i64
      %169 = arith.andi %167, %168 : i1
      %170 = scf.if %169 -> (i64) {
        scf.yield %109 : i64
      } else {
        scf.yield %165 : i64
      }
      %171 = func.call @cc_errorp(%120) : (i64) -> i64
      %172 = arith.cmpi ne, %171, %145 : i64
      %173 = arith.cmpi eq, %170, %145 : i64
      %174 = arith.andi %172, %173 : i1
      %175 = scf.if %174 -> (i64) {
        scf.yield %120 : i64
      } else {
        scf.yield %170 : i64
      }
      %176 = func.call @cc_errorp(%121) : (i64) -> i64
      %177 = arith.cmpi ne, %176, %145 : i64
      %178 = arith.cmpi eq, %175, %145 : i64
      %179 = arith.andi %177, %178 : i1
      %180 = scf.if %179 -> (i64) {
        scf.yield %121 : i64
      } else {
        scf.yield %175 : i64
      }
      %181 = func.call @cc_errorp(%132) : (i64) -> i64
      %182 = arith.cmpi ne, %181, %145 : i64
      %183 = arith.cmpi eq, %180, %145 : i64
      %184 = arith.andi %182, %183 : i1
      %185 = scf.if %184 -> (i64) {
        scf.yield %132 : i64
      } else {
        scf.yield %180 : i64
      }
      %186 = func.call @cc_errorp(%133) : (i64) -> i64
      %187 = arith.cmpi ne, %186, %145 : i64
      %188 = arith.cmpi eq, %185, %145 : i64
      %189 = arith.andi %187, %188 : i1
      %190 = scf.if %189 -> (i64) {
        scf.yield %133 : i64
      } else {
        scf.yield %185 : i64
      }
      %191 = func.call @cc_errorp(%144) : (i64) -> i64
      %192 = arith.cmpi ne, %191, %145 : i64
      %193 = arith.cmpi eq, %190, %145 : i64
      %194 = arith.andi %192, %193 : i1
      %195 = scf.if %194 -> (i64) {
        scf.yield %144 : i64
      } else {
        scf.yield %190 : i64
      }
      %196 = arith.cmpi ne, %195, %145 : i64
      scf.if %196 {
        func.call @stack_push_pointer(%195) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%85) : (i64) -> ()
        func.call @stack_push_pointer(%96) : (i64) -> ()
        func.call @stack_push_pointer(%97) : (i64) -> ()
        func.call @stack_push_pointer(%108) : (i64) -> ()
        func.call @stack_push_pointer(%109) : (i64) -> ()
        func.call @stack_push_pointer(%120) : (i64) -> ()
        func.call @stack_push_pointer(%121) : (i64) -> ()
        func.call @stack_push_pointer(%132) : (i64) -> ()
        func.call @stack_push_pointer(%133) : (i64) -> ()
        func.call @stack_push_pointer(%144) : (i64) -> ()
        %197 = llvm.mlir.addressof @str19 : !llvm.ptr
        %198 = func.call @cc_make_function_ref_const(%197) : (!llvm.ptr) -> i64
        %199 = arith.constant 10 : i64
        func.call @cc_funcall_stack(%198, %199) : (i64, i64) -> ()
      }
      %200 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %200 : i64
    }
    func.call @stack_push_pointer(%81) : (i64) -> ()
    %201 = func.call @stack_pop_pointer() : () -> i64
    %202 = func.call @cc_multiple_value_list(%201) : (i64) -> i64
    %203 = llvm.mlir.addressof @str20 : !llvm.ptr
    %204 = arith.constant 38 : i64
    %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
    %206 = func.call @cc_nil_value() : () -> i64
    %207 = func.call @cc_intern(%205, %206) : (i64, i64) -> i64
    %208 = func.call @cc_nil_value() : () -> i64
    %209 = func.call @cc_cons(%207, %208) : (i64, i64) -> i64
    %210 = func.call @cc_values_pack(%209) : (i64) -> i64
    %211 = func.call @cc_symbol_value(%207) : (i64) -> i64
    %212 = llvm.mlir.addressof @str21 : !llvm.ptr
    %213 = arith.constant 39 : i64
    %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
    %215 = func.call @cc_nil_value() : () -> i64
    %216 = func.call @cc_intern(%214, %215) : (i64, i64) -> i64
    %217 = func.call @cc_nil_value() : () -> i64
    %218 = func.call @cc_cons(%216, %217) : (i64, i64) -> i64
    %219 = func.call @cc_values_pack(%218) : (i64) -> i64
    %220 = func.call @cc_symbol_value(%216) : (i64) -> i64
    %221 = llvm.mlir.addressof @str22 : !llvm.ptr
    %222 = arith.constant 40 : i64
    %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
    %224 = func.call @cc_nil_value() : () -> i64
    %225 = func.call @cc_intern(%223, %224) : (i64, i64) -> i64
    %226 = func.call @cc_nil_value() : () -> i64
    %227 = func.call @cc_cons(%225, %226) : (i64, i64) -> i64
    %228 = func.call @cc_values_pack(%227) : (i64) -> i64
    %229 = func.call @cc_symbol_value(%225) : (i64) -> i64
    %230 = func.call @cc_nil_value() : () -> i64
    %231 = arith.cmpi ne, %211, %230 : i64
    %232 = scf.if %231 -> (i64) {
      scf.yield %229 : i64
    } else {
      scf.yield %202 : i64
    }
    %233 = func.call @cc_values_pack(%232) : (i64) -> i64
    func.call @stack_push_pointer(%233) : (i64) -> ()
    %234 = func.call @stack_pop_pointer() : () -> i64
    %235 = func.call @cc_multiple_value_list(%234) : (i64) -> i64
    %236 = llvm.mlir.addressof @str23 : !llvm.ptr
    %237 = arith.constant 38 : i64
    %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
    %239 = func.call @cc_nil_value() : () -> i64
    %240 = func.call @cc_intern(%238, %239) : (i64, i64) -> i64
    %241 = func.call @cc_nil_value() : () -> i64
    %242 = func.call @cc_cons(%240, %241) : (i64, i64) -> i64
    %243 = func.call @cc_values_pack(%242) : (i64) -> i64
    %244 = func.call @cc_symbol_value(%240) : (i64) -> i64
    %245 = llvm.mlir.addressof @str24 : !llvm.ptr
    %246 = arith.constant 40 : i64
    %247 = func.call @cc_make_string(%245, %246) : (!llvm.ptr, i64) -> i64
    %248 = func.call @cc_nil_value() : () -> i64
    %249 = func.call @cc_intern(%247, %248) : (i64, i64) -> i64
    %250 = func.call @cc_nil_value() : () -> i64
    %251 = func.call @cc_cons(%249, %250) : (i64, i64) -> i64
    %252 = func.call @cc_values_pack(%251) : (i64) -> i64
    %253 = func.call @cc_symbol_value(%249) : (i64) -> i64
    %254 = func.call @cc_nil_value() : () -> i64
    %255 = arith.cmpi ne, %244, %254 : i64
    %256 = scf.if %255 -> (i64) {
      scf.yield %253 : i64
    } else {
      scf.yield %235 : i64
    }
    %257 = func.call @cc_values_pack(%256) : (i64) -> i64
    func.call @stack_push_pointer(%257) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %258 = llvm.mlir.addressof @str25 : !llvm.ptr
    %259 = arith.constant 6 : i64
    %260 = func.call @cc_make_string(%258, %259) : (!llvm.ptr, i64) -> i64
    %261 = func.call @cc_nil_value() : () -> i64
    %262 = func.call @cc_intern(%260, %261) : (i64, i64) -> i64
    %263 = func.call @cc_nil_value() : () -> i64
    %264 = func.call @cc_cons(%262, %263) : (i64, i64) -> i64
    %265 = func.call @cc_values_pack(%264) : (i64) -> i64
    %266 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%262, %266) : (i64, i64) -> ()
    %267 = func.call @cc_nil_value() : () -> i64
    %268 = llvm.mlir.addressof @str26 : !llvm.ptr
    %269 = arith.constant 38 : i64
    %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
    %271 = func.call @cc_nil_value() : () -> i64
    %272 = func.call @cc_intern(%270, %271) : (i64, i64) -> i64
    %273 = func.call @cc_nil_value() : () -> i64
    %274 = func.call @cc_cons(%272, %273) : (i64, i64) -> i64
    %275 = func.call @cc_values_pack(%274) : (i64) -> i64
    %276 = func.call @cc_set_symbol_value(%272, %267) : (i64, i64) -> i64
    %277 = llvm.mlir.addressof @str27 : !llvm.ptr
    %278 = arith.constant 39 : i64
    %279 = func.call @cc_make_string(%277, %278) : (!llvm.ptr, i64) -> i64
    %280 = func.call @cc_nil_value() : () -> i64
    %281 = func.call @cc_intern(%279, %280) : (i64, i64) -> i64
    %282 = func.call @cc_nil_value() : () -> i64
    %283 = func.call @cc_cons(%281, %282) : (i64, i64) -> i64
    %284 = func.call @cc_values_pack(%283) : (i64) -> i64
    %285 = func.call @cc_set_symbol_value(%281, %267) : (i64, i64) -> i64
    %286 = llvm.mlir.addressof @str28 : !llvm.ptr
    %287 = arith.constant 40 : i64
    %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
    %289 = func.call @cc_nil_value() : () -> i64
    %290 = func.call @cc_intern(%288, %289) : (i64, i64) -> i64
    %291 = func.call @cc_nil_value() : () -> i64
    %292 = func.call @cc_cons(%290, %291) : (i64, i64) -> i64
    %293 = func.call @cc_values_pack(%292) : (i64) -> i64
    %294 = func.call @cc_set_symbol_value(%290, %267) : (i64, i64) -> i64
    %295 = func.call @cc_nil_value() : () -> i64
    %296 = func.call @cc_nil_value() : () -> i64
    %297 = func.call @cc_errorp(%295) : (i64) -> i64
    %298 = arith.cmpi ne, %297, %296 : i64
    %299 = scf.if %298 -> (i64) {
      scf.yield %295 : i64
    } else {
      %300 = llvm.mlir.addressof @str29 : !llvm.ptr
      %301 = arith.constant 11 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = func.call @cc_nil_value() : () -> i64
      %304 = func.call @cc_intern(%302, %303) : (i64, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_cons(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_values_pack(%306) : (i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      %308 = func.call @stack_pop_pointer() : () -> i64
      %309 = func.call @cc_in_package(%308) : (i64) -> i64
      func.call @stack_push_pointer(%309) : (i64) -> ()
      %310 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %310 : i64
    }
    %311 = func.call @cc_nil_value() : () -> i64
    %312 = func.call @cc_errorp(%299) : (i64) -> i64
    %313 = arith.cmpi ne, %312, %311 : i64
    %314 = scf.if %313 -> (i64) {
      scf.yield %299 : i64
    } else {
      %315 = llvm.mlir.addressof @str30 : !llvm.ptr
      %316 = func.call @cc_make_function_ref_const(%315) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%316) : (i64) -> ()
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = llvm.mlir.addressof @str31 : !llvm.ptr
      %319 = arith.constant 5 : i64
      %320 = func.call @cc_make_string(%318, %319) : (!llvm.ptr, i64) -> i64
      %321 = llvm.mlir.addressof @str32 : !llvm.ptr
      %322 = arith.constant 15 : i64
      %323 = func.call @cc_make_string(%321, %322) : (!llvm.ptr, i64) -> i64
      %324 = func.call @cc_intern(%320, %323) : (i64, i64) -> i64
      %325 = func.call @cc_nil_value() : () -> i64
      %326 = func.call @cc_cons(%324, %325) : (i64, i64) -> i64
      %327 = func.call @cc_values_pack(%326) : (i64) -> i64
      %328 = func.call @cc_set_symbol_value(%324, %317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%317) : (i64) -> ()
      %329 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %329 : i64
    }
    %330 = func.call @cc_nil_value() : () -> i64
    %331 = func.call @cc_errorp(%314) : (i64) -> i64
    %332 = arith.cmpi ne, %331, %330 : i64
    %333 = scf.if %332 -> (i64) {
      scf.yield %314 : i64
    } else {
      %334 = llvm.mlir.addressof @str33 : !llvm.ptr
      %335 = func.call @cc_make_function_ref_const(%334) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%335) : (i64) -> ()
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = llvm.mlir.addressof @str34 : !llvm.ptr
      %338 = arith.constant 5 : i64
      %339 = func.call @cc_make_string(%337, %338) : (!llvm.ptr, i64) -> i64
      %340 = llvm.mlir.addressof @str35 : !llvm.ptr
      %341 = arith.constant 15 : i64
      %342 = func.call @cc_make_string(%340, %341) : (!llvm.ptr, i64) -> i64
      %343 = func.call @cc_intern(%339, %342) : (i64, i64) -> i64
      %344 = func.call @cc_nil_value() : () -> i64
      %345 = func.call @cc_cons(%343, %344) : (i64, i64) -> i64
      %346 = func.call @cc_values_pack(%345) : (i64) -> i64
      %347 = func.call @cc_set_symbol_value(%343, %336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%336) : (i64) -> ()
      %348 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %348 : i64
    }
    %349 = func.call @cc_nil_value() : () -> i64
    %350 = func.call @cc_errorp(%333) : (i64) -> i64
    %351 = arith.cmpi ne, %350, %349 : i64
    %352 = scf.if %351 -> (i64) {
      scf.yield %333 : i64
    } else {
      %353 = llvm.mlir.addressof @str36 : !llvm.ptr
      %354 = func.call @cc_make_function_ref_const(%353) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%354) : (i64) -> ()
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = llvm.mlir.addressof @str37 : !llvm.ptr
      %357 = arith.constant 5 : i64
      %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
      %359 = llvm.mlir.addressof @str38 : !llvm.ptr
      %360 = arith.constant 15 : i64
      %361 = func.call @cc_make_string(%359, %360) : (!llvm.ptr, i64) -> i64
      %362 = func.call @cc_intern(%358, %361) : (i64, i64) -> i64
      %363 = func.call @cc_nil_value() : () -> i64
      %364 = func.call @cc_cons(%362, %363) : (i64, i64) -> i64
      %365 = func.call @cc_values_pack(%364) : (i64) -> i64
      %366 = func.call @cc_set_symbol_value(%362, %355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %367 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %367 : i64
    }
    %368 = func.call @cc_nil_value() : () -> i64
    %369 = func.call @cc_errorp(%352) : (i64) -> i64
    %370 = arith.cmpi ne, %369, %368 : i64
    %371 = scf.if %370 -> (i64) {
      scf.yield %352 : i64
    } else {
      %372 = llvm.mlir.addressof @str39 : !llvm.ptr
      %373 = func.call @cc_make_function_ref_const(%372) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = llvm.mlir.addressof @str40 : !llvm.ptr
      %376 = arith.constant 5 : i64
      %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
      %378 = llvm.mlir.addressof @str41 : !llvm.ptr
      %379 = arith.constant 15 : i64
      %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
      %381 = func.call @cc_intern(%377, %380) : (i64, i64) -> i64
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = func.call @cc_cons(%381, %382) : (i64, i64) -> i64
      %384 = func.call @cc_values_pack(%383) : (i64) -> i64
      %385 = func.call @cc_set_symbol_value(%381, %374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%374) : (i64) -> ()
      %386 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %386 : i64
    }
    %387 = func.call @cc_nil_value() : () -> i64
    %388 = func.call @cc_errorp(%371) : (i64) -> i64
    %389 = arith.cmpi ne, %388, %387 : i64
    %390 = scf.if %389 -> (i64) {
      scf.yield %371 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %391 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %391 : i64
    }
    %392 = func.call @cc_nil_value() : () -> i64
    %393 = func.call @cc_errorp(%390) : (i64) -> i64
    %394 = arith.cmpi ne, %393, %392 : i64
    %395 = scf.if %394 -> (i64) {
      scf.yield %390 : i64
    } else {
      %396 = llvm.mlir.addressof @str42 : !llvm.ptr
      %397 = arith.constant 16 : i64
      %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
      %399 = func.call @cc_nil_value() : () -> i64
      %400 = func.call @cc_intern(%398, %399) : (i64, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_cons(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_values_pack(%402) : (i64) -> i64
      func.call @stack_push_pointer(%400) : (i64) -> ()
      %404 = func.call @stack_pop_pointer() : () -> i64
      %405 = llvm.mlir.addressof @str43 : !llvm.ptr
      %406 = arith.constant 4 : i64
      %407 = func.call @cc_make_string(%405, %406) : (!llvm.ptr, i64) -> i64
      %408 = func.call @cc_nil_value() : () -> i64
      %409 = func.call @cc_intern(%407, %408) : (i64, i64) -> i64
      %410 = func.call @cc_nil_value() : () -> i64
      %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
      %412 = func.call @cc_values_pack(%411) : (i64) -> i64
      func.call @stack_push_pointer(%409) : (i64) -> ()
      %413 = llvm.mlir.addressof @str44 : !llvm.ptr
      %414 = arith.constant 7 : i64
      %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
      %416 = func.call @cc_nil_value() : () -> i64
      %417 = func.call @cc_intern(%415, %416) : (i64, i64) -> i64
      %418 = func.call @cc_nil_value() : () -> i64
      %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
      %420 = func.call @cc_values_pack(%419) : (i64) -> i64
      func.call @stack_push_pointer(%417) : (i64) -> ()
      %421 = llvm.mlir.addressof @str45 : !llvm.ptr
      %422 = arith.constant 18 : i64
      %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
      %424 = llvm.mlir.addressof @str46 : !llvm.ptr
      %425 = arith.constant 9 : i64
      %426 = func.call @cc_make_string(%424, %425) : (!llvm.ptr, i64) -> i64
      %427 = func.call @cc_intern(%423, %426) : (i64, i64) -> i64
      %428 = func.call @cc_nil_value() : () -> i64
      %429 = func.call @cc_cons(%427, %428) : (i64, i64) -> i64
      %430 = func.call @cc_values_pack(%429) : (i64) -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      %431 = llvm.mlir.addressof @str47 : !llvm.ptr
      %432 = arith.constant 3 : i64
      %433 = func.call @cc_make_string(%431, %432) : (!llvm.ptr, i64) -> i64
      %434 = llvm.mlir.addressof @str48 : !llvm.ptr
      %435 = arith.constant 7 : i64
      %436 = func.call @cc_make_string(%434, %435) : (!llvm.ptr, i64) -> i64
      %437 = func.call @cc_intern(%433, %436) : (i64, i64) -> i64
      %438 = func.call @cc_nil_value() : () -> i64
      %439 = func.call @cc_cons(%437, %438) : (i64, i64) -> i64
      %440 = func.call @cc_values_pack(%439) : (i64) -> i64
      func.call @stack_push_pointer(%437) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @stack_pop_pointer() : () -> i64
      %443 = func.call @cc_cons(%442, %441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      %444 = func.call @stack_pop_pointer() : () -> i64
      %445 = func.call @stack_pop_pointer() : () -> i64
      %446 = func.call @cc_cons(%445, %444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%446) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %447 = func.call @stack_pop_pointer() : () -> i64
      %448 = func.call @stack_pop_pointer() : () -> i64
      %449 = func.call @cc_cons(%448, %447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %450 = func.call @stack_pop_pointer() : () -> i64
      %451 = func.call @stack_pop_pointer() : () -> i64
      %452 = func.call @cc_cons(%451, %450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%452) : (i64) -> ()
      %453 = llvm.mlir.addressof @str49 : !llvm.ptr
      %454 = arith.constant 5 : i64
      %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
      %456 = llvm.mlir.addressof @str50 : !llvm.ptr
      %457 = arith.constant 11 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = func.call @cc_intern(%455, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      %463 = llvm.mlir.addressof @str51 : !llvm.ptr
      %464 = arith.constant 14 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = llvm.mlir.addressof @str52 : !llvm.ptr
      %467 = arith.constant 9 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_intern(%465, %468) : (i64, i64) -> i64
      %470 = func.call @cc_nil_value() : () -> i64
      %471 = func.call @cc_cons(%469, %470) : (i64, i64) -> i64
      %472 = func.call @cc_values_pack(%471) : (i64) -> i64
      func.call @stack_push_pointer(%469) : (i64) -> ()
      %473 = llvm.mlir.addressof @str53 : !llvm.ptr
      %474 = arith.constant 1 : i64
      %475 = func.call @cc_make_string(%473, %474) : (!llvm.ptr, i64) -> i64
      %476 = llvm.mlir.addressof @str54 : !llvm.ptr
      %477 = arith.constant 11 : i64
      %478 = func.call @cc_make_string(%476, %477) : (!llvm.ptr, i64) -> i64
      %479 = func.call @cc_intern(%475, %478) : (i64, i64) -> i64
      %480 = func.call @cc_nil_value() : () -> i64
      %481 = func.call @cc_cons(%479, %480) : (i64, i64) -> i64
      %482 = func.call @cc_values_pack(%481) : (i64) -> i64
      func.call @stack_push_pointer(%479) : (i64) -> ()
      %483 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%483) : (i64) -> ()
      %484 = llvm.mlir.addressof @str55 : !llvm.ptr
      %485 = arith.constant 7 : i64
      %486 = func.call @cc_make_string(%484, %485) : (!llvm.ptr, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_intern(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %492 = func.call @stack_pop_pointer() : () -> i64
      %493 = func.call @stack_pop_pointer() : () -> i64
      %494 = func.call @cc_cons(%493, %492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%494) : (i64) -> ()
      %495 = func.call @stack_pop_pointer() : () -> i64
      %496 = func.call @stack_pop_pointer() : () -> i64
      %497 = func.call @cc_cons(%496, %495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%497) : (i64) -> ()
      %498 = func.call @stack_pop_pointer() : () -> i64
      %499 = func.call @stack_pop_pointer() : () -> i64
      %500 = func.call @cc_cons(%499, %498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%500) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %501 = func.call @stack_pop_pointer() : () -> i64
      %502 = func.call @stack_pop_pointer() : () -> i64
      %503 = func.call @cc_cons(%502, %501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%503) : (i64) -> ()
      %504 = func.call @stack_pop_pointer() : () -> i64
      %505 = func.call @stack_pop_pointer() : () -> i64
      %506 = func.call @cc_cons(%505, %504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %507 = func.call @stack_pop_pointer() : () -> i64
      %508 = func.call @stack_pop_pointer() : () -> i64
      %509 = func.call @cc_cons(%508, %507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @cc_cons(%511, %510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %513 = func.call @stack_pop_pointer() : () -> i64
      %514 = func.call @stack_pop_pointer() : () -> i64
      %515 = func.call @cc_cons(%514, %513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%515) : (i64) -> ()
      %516 = func.call @stack_pop_pointer() : () -> i64
      %517 = func.call @stack_pop_pointer() : () -> i64
      %518 = func.call @cc_cons(%517, %516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%518) : (i64) -> ()
      %519 = llvm.mlir.addressof @str56 : !llvm.ptr
      %520 = arith.constant 14 : i64
      %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
      %522 = llvm.mlir.addressof @str57 : !llvm.ptr
      %523 = arith.constant 11 : i64
      %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
      %525 = func.call @cc_intern(%521, %524) : (i64, i64) -> i64
      %526 = func.call @cc_nil_value() : () -> i64
      %527 = func.call @cc_cons(%525, %526) : (i64, i64) -> i64
      %528 = func.call @cc_values_pack(%527) : (i64) -> i64
      func.call @stack_push_pointer(%525) : (i64) -> ()
      %529 = llvm.mlir.addressof @str58 : !llvm.ptr
      %530 = arith.constant 5 : i64
      %531 = func.call @cc_make_string(%529, %530) : (!llvm.ptr, i64) -> i64
      %532 = func.call @cc_nil_value() : () -> i64
      %533 = func.call @cc_intern(%531, %532) : (i64, i64) -> i64
      %534 = func.call @cc_nil_value() : () -> i64
      %535 = func.call @cc_cons(%533, %534) : (i64, i64) -> i64
      %536 = func.call @cc_values_pack(%535) : (i64) -> i64
      func.call @stack_push_pointer(%533) : (i64) -> ()
      %537 = llvm.mlir.addressof @str59 : !llvm.ptr
      %538 = arith.constant 4 : i64
      %539 = func.call @cc_make_string(%537, %538) : (!llvm.ptr, i64) -> i64
      %540 = func.call @cc_nil_value() : () -> i64
      %541 = func.call @cc_intern(%539, %540) : (i64, i64) -> i64
      %542 = func.call @cc_nil_value() : () -> i64
      %543 = func.call @cc_cons(%541, %542) : (i64, i64) -> i64
      %544 = func.call @cc_values_pack(%543) : (i64) -> i64
      func.call @stack_push_pointer(%541) : (i64) -> ()
      %545 = llvm.mlir.addressof @str60 : !llvm.ptr
      %546 = arith.constant 3 : i64
      %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
      %548 = func.call @cc_nil_value() : () -> i64
      %549 = func.call @cc_intern(%547, %548) : (i64, i64) -> i64
      %550 = func.call @cc_nil_value() : () -> i64
      %551 = func.call @cc_cons(%549, %550) : (i64, i64) -> i64
      %552 = func.call @cc_values_pack(%551) : (i64) -> i64
      func.call @stack_push_pointer(%549) : (i64) -> ()
      %553 = llvm.mlir.addressof @str61 : !llvm.ptr
      %554 = arith.constant 1 : i64
      %555 = func.call @cc_make_string(%553, %554) : (!llvm.ptr, i64) -> i64
      %556 = func.call @cc_nil_value() : () -> i64
      %557 = func.call @cc_intern(%555, %556) : (i64, i64) -> i64
      %558 = func.call @cc_nil_value() : () -> i64
      %559 = func.call @cc_cons(%557, %558) : (i64, i64) -> i64
      %560 = func.call @cc_values_pack(%559) : (i64) -> i64
      func.call @stack_push_pointer(%557) : (i64) -> ()
      %561 = llvm.mlir.addressof @str62 : !llvm.ptr
      %562 = arith.constant 4 : i64
      %563 = func.call @cc_make_string(%561, %562) : (!llvm.ptr, i64) -> i64
      %564 = func.call @cc_nil_value() : () -> i64
      %565 = func.call @cc_intern(%563, %564) : (i64, i64) -> i64
      %566 = func.call @cc_nil_value() : () -> i64
      %567 = func.call @cc_cons(%565, %566) : (i64, i64) -> i64
      %568 = func.call @cc_values_pack(%567) : (i64) -> i64
      func.call @stack_push_pointer(%565) : (i64) -> ()
      %569 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%569) : (i64) -> ()
      %570 = llvm.mlir.addressof @str63 : !llvm.ptr
      %571 = arith.constant 3 : i64
      %572 = func.call @cc_make_string(%570, %571) : (!llvm.ptr, i64) -> i64
      %573 = llvm.mlir.addressof @str64 : !llvm.ptr
      %574 = arith.constant 11 : i64
      %575 = func.call @cc_make_string(%573, %574) : (!llvm.ptr, i64) -> i64
      %576 = func.call @cc_intern(%572, %575) : (i64, i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_cons(%576, %577) : (i64, i64) -> i64
      %579 = func.call @cc_values_pack(%578) : (i64) -> i64
      func.call @stack_push_pointer(%576) : (i64) -> ()
      %580 = llvm.mlir.addressof @str65 : !llvm.ptr
      %581 = arith.constant 1 : i64
      %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
      %583 = func.call @cc_nil_value() : () -> i64
      %584 = func.call @cc_intern(%582, %583) : (i64, i64) -> i64
      %585 = func.call @cc_nil_value() : () -> i64
      %586 = func.call @cc_cons(%584, %585) : (i64, i64) -> i64
      %587 = func.call @cc_values_pack(%586) : (i64) -> i64
      func.call @stack_push_pointer(%584) : (i64) -> ()
      %588 = llvm.mlir.addressof @str66 : !llvm.ptr
      %589 = arith.constant 2 : i64
      %590 = func.call @cc_make_string(%588, %589) : (!llvm.ptr, i64) -> i64
      %591 = func.call @cc_nil_value() : () -> i64
      %592 = func.call @cc_intern(%590, %591) : (i64, i64) -> i64
      %593 = func.call @cc_nil_value() : () -> i64
      %594 = func.call @cc_cons(%592, %593) : (i64, i64) -> i64
      %595 = func.call @cc_values_pack(%594) : (i64) -> i64
      func.call @stack_push_pointer(%592) : (i64) -> ()
      %596 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      %597 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%597) : (i64) -> ()
      %598 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%598) : (i64) -> ()
      %599 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%599) : (i64) -> ()
      %600 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%600) : (i64) -> ()
      %601 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%601) : (i64) -> ()
      %602 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%602) : (i64) -> ()
      %603 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%603) : (i64) -> ()
      %604 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%604) : (i64) -> ()
      %605 = arith.constant 9 : i64
      func.call @stack_push_fixnum(%605) : (i64) -> ()
      %606 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%606) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @stack_pop_pointer() : () -> i64
      %609 = func.call @cc_cons(%608, %607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%609) : (i64) -> ()
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%611, %610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_cons(%614, %613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = func.call @stack_pop_pointer() : () -> i64
      %618 = func.call @cc_cons(%617, %616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%618) : (i64) -> ()
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = func.call @stack_pop_pointer() : () -> i64
      %621 = func.call @cc_cons(%620, %619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @stack_pop_pointer() : () -> i64
      %624 = func.call @cc_cons(%623, %622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%624) : (i64) -> ()
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = func.call @cc_cons(%626, %625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%627) : (i64) -> ()
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @stack_pop_pointer() : () -> i64
      %630 = func.call @cc_cons(%629, %628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%630) : (i64) -> ()
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @cc_cons(%632, %631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%633) : (i64) -> ()
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @stack_pop_pointer() : () -> i64
      %636 = func.call @cc_cons(%635, %634) : (i64, i64) -> i64
      func.call @stack_push_pointer(%636) : (i64) -> ()
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @stack_pop_pointer() : () -> i64
      %639 = func.call @cc_cons(%637, %638) : (i64, i64) -> i64
      %640 = llvm.mlir.addressof @str67 : !llvm.ptr
      %641 = arith.constant 5 : i64
      %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
      %643 = func.call @cc_nil_value() : () -> i64
      %644 = func.call @cc_intern(%642, %643) : (i64, i64) -> i64
      %645 = func.call @cc_nil_value() : () -> i64
      %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
      %647 = func.call @cc_values_pack(%646) : (i64) -> i64
      %648 = func.call @cc_cons(%644, %639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%648) : (i64) -> ()
      %649 = llvm.mlir.addressof @str68 : !llvm.ptr
      %650 = arith.constant 2 : i64
      %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
      %652 = llvm.mlir.addressof @str69 : !llvm.ptr
      %653 = arith.constant 11 : i64
      %654 = func.call @cc_make_string(%652, %653) : (!llvm.ptr, i64) -> i64
      %655 = func.call @cc_intern(%651, %654) : (i64, i64) -> i64
      %656 = func.call @cc_nil_value() : () -> i64
      %657 = func.call @cc_cons(%655, %656) : (i64, i64) -> i64
      %658 = func.call @cc_values_pack(%657) : (i64) -> i64
      func.call @stack_push_pointer(%655) : (i64) -> ()
      %659 = llvm.mlir.addressof @str70 : !llvm.ptr
      %660 = arith.constant 8 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = llvm.mlir.addressof @str71 : !llvm.ptr
      %663 = arith.constant 9 : i64
      %664 = func.call @cc_make_string(%662, %663) : (!llvm.ptr, i64) -> i64
      %665 = func.call @cc_intern(%661, %664) : (i64, i64) -> i64
      %666 = func.call @cc_nil_value() : () -> i64
      %667 = func.call @cc_cons(%665, %666) : (i64, i64) -> i64
      %668 = func.call @cc_values_pack(%667) : (i64) -> i64
      func.call @stack_push_pointer(%665) : (i64) -> ()
      %669 = llvm.mlir.addressof @str72 : !llvm.ptr
      %670 = arith.constant 5 : i64
      %671 = func.call @cc_make_string(%669, %670) : (!llvm.ptr, i64) -> i64
      %672 = llvm.mlir.addressof @str73 : !llvm.ptr
      %673 = arith.constant 11 : i64
      %674 = func.call @cc_make_string(%672, %673) : (!llvm.ptr, i64) -> i64
      %675 = func.call @cc_intern(%671, %674) : (i64, i64) -> i64
      %676 = func.call @cc_nil_value() : () -> i64
      %677 = func.call @cc_cons(%675, %676) : (i64, i64) -> i64
      %678 = func.call @cc_values_pack(%677) : (i64) -> i64
      func.call @stack_push_pointer(%675) : (i64) -> ()
      %679 = llvm.mlir.addressof @str74 : !llvm.ptr
      %680 = arith.constant 3 : i64
      %681 = func.call @cc_make_string(%679, %680) : (!llvm.ptr, i64) -> i64
      %682 = llvm.mlir.addressof @str75 : !llvm.ptr
      %683 = arith.constant 7 : i64
      %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
      %685 = func.call @cc_intern(%681, %684) : (i64, i64) -> i64
      %686 = func.call @cc_nil_value() : () -> i64
      %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
      %688 = func.call @cc_values_pack(%687) : (i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %689 = llvm.mlir.addressof @str76 : !llvm.ptr
      %690 = arith.constant 1 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_intern(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_nil_value() : () -> i64
      %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
      %696 = func.call @cc_values_pack(%695) : (i64) -> i64
      func.call @stack_push_pointer(%693) : (i64) -> ()
      %697 = llvm.mlir.addressof @str77 : !llvm.ptr
      %698 = arith.constant 1 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = llvm.mlir.addressof @str78 : !llvm.ptr
      %701 = arith.constant 11 : i64
      %702 = func.call @cc_make_string(%700, %701) : (!llvm.ptr, i64) -> i64
      %703 = func.call @cc_intern(%699, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      func.call @stack_push_pointer(%703) : (i64) -> ()
      %707 = llvm.mlir.addressof @str79 : !llvm.ptr
      %708 = arith.constant 1 : i64
      %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
      %710 = func.call @cc_nil_value() : () -> i64
      %711 = func.call @cc_intern(%709, %710) : (i64, i64) -> i64
      %712 = func.call @cc_nil_value() : () -> i64
      %713 = func.call @cc_cons(%711, %712) : (i64, i64) -> i64
      %714 = func.call @cc_values_pack(%713) : (i64) -> i64
      func.call @stack_push_pointer(%711) : (i64) -> ()
      %715 = llvm.mlir.addressof @str80 : !llvm.ptr
      %716 = arith.constant 7 : i64
      %717 = func.call @cc_make_string(%715, %716) : (!llvm.ptr, i64) -> i64
      %718 = func.call @cc_nil_value() : () -> i64
      %719 = func.call @cc_intern(%717, %718) : (i64, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_cons(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_values_pack(%721) : (i64) -> i64
      func.call @stack_push_pointer(%719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @cc_cons(%724, %723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%725) : (i64) -> ()
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @cc_cons(%727, %726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @cc_cons(%730, %729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %732 = func.call @stack_pop_pointer() : () -> i64
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @cc_cons(%733, %732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%734) : (i64) -> ()
      %735 = func.call @stack_pop_pointer() : () -> i64
      %736 = func.call @stack_pop_pointer() : () -> i64
      %737 = func.call @cc_cons(%736, %735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%737) : (i64) -> ()
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @cc_cons(%739, %738) : (i64, i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @stack_pop_pointer() : () -> i64
      %743 = func.call @cc_cons(%742, %741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%743) : (i64) -> ()
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @cc_cons(%745, %744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%746) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @cc_cons(%748, %747) : (i64, i64) -> i64
      func.call @stack_push_pointer(%749) : (i64) -> ()
      %750 = func.call @stack_pop_pointer() : () -> i64
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @cc_cons(%751, %750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%752) : (i64) -> ()
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @cc_cons(%754, %753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%755) : (i64) -> ()
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @cc_cons(%757, %756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%758) : (i64) -> ()
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @cc_cons(%760, %759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%761) : (i64) -> ()
      %762 = func.call @stack_pop_pointer() : () -> i64
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @cc_cons(%763, %762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      %765 = func.call @stack_pop_pointer() : () -> i64
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @cc_cons(%766, %765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%767) : (i64) -> ()
      %768 = func.call @stack_pop_pointer() : () -> i64
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @cc_cons(%769, %768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%770) : (i64) -> ()
      %771 = func.call @stack_pop_pointer() : () -> i64
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @cc_cons(%772, %771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%773) : (i64) -> ()
      %774 = func.call @stack_pop_pointer() : () -> i64
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = func.call @cc_cons(%775, %774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%776) : (i64) -> ()
      %777 = func.call @stack_pop_pointer() : () -> i64
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = func.call @cc_cons(%778, %777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%779) : (i64) -> ()
      %780 = llvm.mlir.addressof @str81 : !llvm.ptr
      %781 = arith.constant 5 : i64
      %782 = func.call @cc_make_string(%780, %781) : (!llvm.ptr, i64) -> i64
      %783 = func.call @cc_nil_value() : () -> i64
      %784 = func.call @cc_intern(%782, %783) : (i64, i64) -> i64
      %785 = func.call @cc_nil_value() : () -> i64
      %786 = func.call @cc_cons(%784, %785) : (i64, i64) -> i64
      %787 = func.call @cc_values_pack(%786) : (i64) -> i64
      func.call @stack_push_pointer(%784) : (i64) -> ()
      %788 = llvm.mlir.addressof @str82 : !llvm.ptr
      %789 = arith.constant 5 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = llvm.mlir.addressof @str83 : !llvm.ptr
      %792 = arith.constant 11 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = func.call @cc_intern(%790, %793) : (i64, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_values_pack(%796) : (i64) -> i64
      func.call @stack_push_pointer(%794) : (i64) -> ()
      %798 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%798) : (i64) -> ()
      %799 = llvm.mlir.addressof @str84 : !llvm.ptr
      %800 = arith.constant 7 : i64
      %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
      %802 = func.call @cc_nil_value() : () -> i64
      %803 = func.call @cc_intern(%801, %802) : (i64, i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
      %806 = func.call @cc_values_pack(%805) : (i64) -> i64
      func.call @stack_push_pointer(%803) : (i64) -> ()
      %807 = llvm.mlir.addressof @str85 : !llvm.ptr
      %808 = arith.constant 13 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = llvm.mlir.addressof @str86 : !llvm.ptr
      %811 = arith.constant 9 : i64
      %812 = func.call @cc_make_string(%810, %811) : (!llvm.ptr, i64) -> i64
      %813 = func.call @cc_intern(%809, %812) : (i64, i64) -> i64
      %814 = func.call @cc_nil_value() : () -> i64
      %815 = func.call @cc_cons(%813, %814) : (i64, i64) -> i64
      %816 = func.call @cc_values_pack(%815) : (i64) -> i64
      func.call @stack_push_pointer(%813) : (i64) -> ()
      %817 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%817) : (i64) -> ()
      %818 = llvm.mlir.addressof @str87 : !llvm.ptr
      %819 = arith.constant 1 : i64
      %820 = func.call @cc_make_string(%818, %819) : (!llvm.ptr, i64) -> i64
      %821 = llvm.mlir.addressof @str88 : !llvm.ptr
      %822 = arith.constant 11 : i64
      %823 = func.call @cc_make_string(%821, %822) : (!llvm.ptr, i64) -> i64
      %824 = func.call @cc_intern(%820, %823) : (i64, i64) -> i64
      %825 = func.call @cc_nil_value() : () -> i64
      %826 = func.call @cc_cons(%824, %825) : (i64, i64) -> i64
      %827 = func.call @cc_values_pack(%826) : (i64) -> i64
      func.call @stack_push_pointer(%824) : (i64) -> ()
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @stack_pop_pointer() : () -> i64
      %830 = func.call @cc_cons(%828, %829) : (i64, i64) -> i64
      %831 = llvm.mlir.addressof @str89 : !llvm.ptr
      %832 = arith.constant 5 : i64
      %833 = func.call @cc_make_string(%831, %832) : (!llvm.ptr, i64) -> i64
      %834 = func.call @cc_nil_value() : () -> i64
      %835 = func.call @cc_intern(%833, %834) : (i64, i64) -> i64
      %836 = func.call @cc_nil_value() : () -> i64
      %837 = func.call @cc_cons(%835, %836) : (i64, i64) -> i64
      %838 = func.call @cc_values_pack(%837) : (i64) -> i64
      %839 = func.call @cc_cons(%835, %830) : (i64, i64) -> i64
      func.call @stack_push_pointer(%839) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %840 = func.call @stack_pop_pointer() : () -> i64
      %841 = func.call @stack_pop_pointer() : () -> i64
      %842 = func.call @cc_cons(%841, %840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%842) : (i64) -> ()
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @stack_pop_pointer() : () -> i64
      %845 = func.call @cc_cons(%844, %843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = func.call @cc_cons(%847, %846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%848) : (i64) -> ()
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @cc_cons(%850, %849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%851) : (i64) -> ()
      %852 = func.call @stack_pop_pointer() : () -> i64
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @cc_cons(%853, %852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%854) : (i64) -> ()
      %855 = func.call @stack_pop_pointer() : () -> i64
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @cc_cons(%856, %855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%857) : (i64) -> ()
      %858 = func.call @stack_pop_pointer() : () -> i64
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @cc_cons(%859, %858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%860) : (i64) -> ()
      %861 = llvm.mlir.addressof @str90 : !llvm.ptr
      %862 = arith.constant 4 : i64
      %863 = func.call @cc_make_string(%861, %862) : (!llvm.ptr, i64) -> i64
      %864 = func.call @cc_nil_value() : () -> i64
      %865 = func.call @cc_intern(%863, %864) : (i64, i64) -> i64
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
      %868 = func.call @cc_values_pack(%867) : (i64) -> i64
      func.call @stack_push_pointer(%865) : (i64) -> ()
      %869 = llvm.mlir.addressof @str91 : !llvm.ptr
      %870 = arith.constant 3 : i64
      %871 = func.call @cc_make_string(%869, %870) : (!llvm.ptr, i64) -> i64
      %872 = func.call @cc_nil_value() : () -> i64
      %873 = func.call @cc_intern(%871, %872) : (i64, i64) -> i64
      %874 = func.call @cc_nil_value() : () -> i64
      %875 = func.call @cc_cons(%873, %874) : (i64, i64) -> i64
      %876 = func.call @cc_values_pack(%875) : (i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      %877 = llvm.mlir.addressof @str92 : !llvm.ptr
      %878 = arith.constant 1 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      %880 = func.call @cc_nil_value() : () -> i64
      %881 = func.call @cc_intern(%879, %880) : (i64, i64) -> i64
      %882 = func.call @cc_nil_value() : () -> i64
      %883 = func.call @cc_cons(%881, %882) : (i64, i64) -> i64
      %884 = func.call @cc_values_pack(%883) : (i64) -> i64
      func.call @stack_push_pointer(%881) : (i64) -> ()
      %885 = llvm.mlir.addressof @str93 : !llvm.ptr
      %886 = arith.constant 4 : i64
      %887 = func.call @cc_make_string(%885, %886) : (!llvm.ptr, i64) -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_intern(%887, %888) : (i64, i64) -> i64
      %890 = func.call @cc_nil_value() : () -> i64
      %891 = func.call @cc_cons(%889, %890) : (i64, i64) -> i64
      %892 = func.call @cc_values_pack(%891) : (i64) -> i64
      func.call @stack_push_pointer(%889) : (i64) -> ()
      %893 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%893) : (i64) -> ()
      %894 = llvm.mlir.addressof @str94 : !llvm.ptr
      %895 = arith.constant 5 : i64
      %896 = func.call @cc_make_string(%894, %895) : (!llvm.ptr, i64) -> i64
      %897 = func.call @cc_nil_value() : () -> i64
      %898 = func.call @cc_intern(%896, %897) : (i64, i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
      %901 = func.call @cc_values_pack(%900) : (i64) -> i64
      func.call @stack_push_pointer(%898) : (i64) -> ()
      %902 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%902) : (i64) -> ()
      %903 = llvm.mlir.addressof @str95 : !llvm.ptr
      %904 = arith.constant 7 : i64
      %905 = func.call @cc_make_string(%903, %904) : (!llvm.ptr, i64) -> i64
      %906 = func.call @cc_nil_value() : () -> i64
      %907 = func.call @cc_intern(%905, %906) : (i64, i64) -> i64
      %908 = func.call @cc_nil_value() : () -> i64
      %909 = func.call @cc_cons(%907, %908) : (i64, i64) -> i64
      %910 = func.call @cc_values_pack(%909) : (i64) -> i64
      func.call @stack_push_pointer(%907) : (i64) -> ()
      %911 = llvm.mlir.addressof @str96 : !llvm.ptr
      %912 = arith.constant 8 : i64
      %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
      %914 = llvm.mlir.addressof @str97 : !llvm.ptr
      %915 = arith.constant 9 : i64
      %916 = func.call @cc_make_string(%914, %915) : (!llvm.ptr, i64) -> i64
      %917 = func.call @cc_intern(%913, %916) : (i64, i64) -> i64
      %918 = func.call @cc_nil_value() : () -> i64
      %919 = func.call @cc_cons(%917, %918) : (i64, i64) -> i64
      %920 = func.call @cc_values_pack(%919) : (i64) -> i64
      func.call @stack_push_pointer(%917) : (i64) -> ()
      %921 = llvm.mlir.addressof @str98 : !llvm.ptr
      %922 = arith.constant 5 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = llvm.mlir.addressof @str99 : !llvm.ptr
      %925 = arith.constant 11 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = func.call @cc_intern(%923, %926) : (i64, i64) -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      %929 = func.call @cc_cons(%927, %928) : (i64, i64) -> i64
      %930 = func.call @cc_values_pack(%929) : (i64) -> i64
      func.call @stack_push_pointer(%927) : (i64) -> ()
      %931 = llvm.mlir.addressof @str100 : !llvm.ptr
      %932 = arith.constant 3 : i64
      %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
      %934 = llvm.mlir.addressof @str101 : !llvm.ptr
      %935 = arith.constant 7 : i64
      %936 = func.call @cc_make_string(%934, %935) : (!llvm.ptr, i64) -> i64
      %937 = func.call @cc_intern(%933, %936) : (i64, i64) -> i64
      %938 = func.call @cc_nil_value() : () -> i64
      %939 = func.call @cc_cons(%937, %938) : (i64, i64) -> i64
      %940 = func.call @cc_values_pack(%939) : (i64) -> i64
      func.call @stack_push_pointer(%937) : (i64) -> ()
      %941 = llvm.mlir.addressof @str102 : !llvm.ptr
      %942 = arith.constant 1 : i64
      %943 = func.call @cc_make_string(%941, %942) : (!llvm.ptr, i64) -> i64
      %944 = llvm.mlir.addressof @str103 : !llvm.ptr
      %945 = arith.constant 11 : i64
      %946 = func.call @cc_make_string(%944, %945) : (!llvm.ptr, i64) -> i64
      %947 = func.call @cc_intern(%943, %946) : (i64, i64) -> i64
      %948 = func.call @cc_nil_value() : () -> i64
      %949 = func.call @cc_cons(%947, %948) : (i64, i64) -> i64
      %950 = func.call @cc_values_pack(%949) : (i64) -> i64
      func.call @stack_push_pointer(%947) : (i64) -> ()
      %951 = llvm.mlir.addressof @str104 : !llvm.ptr
      %952 = arith.constant 1 : i64
      %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      func.call @stack_push_pointer(%955) : (i64) -> ()
      %959 = llvm.mlir.addressof @str105 : !llvm.ptr
      %960 = arith.constant 7 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = func.call @cc_nil_value() : () -> i64
      %963 = func.call @cc_intern(%961, %962) : (i64, i64) -> i64
      %964 = func.call @cc_nil_value() : () -> i64
      %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
      %966 = func.call @cc_values_pack(%965) : (i64) -> i64
      func.call @stack_push_pointer(%963) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %967 = func.call @stack_pop_pointer() : () -> i64
      %968 = func.call @stack_pop_pointer() : () -> i64
      %969 = func.call @cc_cons(%968, %967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%969) : (i64) -> ()
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = func.call @stack_pop_pointer() : () -> i64
      %972 = func.call @cc_cons(%971, %970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @stack_pop_pointer() : () -> i64
      %975 = func.call @cc_cons(%974, %973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %976 = func.call @stack_pop_pointer() : () -> i64
      %977 = func.call @stack_pop_pointer() : () -> i64
      %978 = func.call @cc_cons(%977, %976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %979 = func.call @stack_pop_pointer() : () -> i64
      %980 = func.call @stack_pop_pointer() : () -> i64
      %981 = func.call @cc_cons(%980, %979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%981) : (i64) -> ()
      %982 = func.call @stack_pop_pointer() : () -> i64
      %983 = func.call @stack_pop_pointer() : () -> i64
      %984 = func.call @cc_cons(%983, %982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%984) : (i64) -> ()
      %985 = func.call @stack_pop_pointer() : () -> i64
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = func.call @cc_cons(%986, %985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%987) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %988 = func.call @stack_pop_pointer() : () -> i64
      %989 = func.call @stack_pop_pointer() : () -> i64
      %990 = func.call @cc_cons(%989, %988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%990) : (i64) -> ()
      %991 = func.call @stack_pop_pointer() : () -> i64
      %992 = func.call @stack_pop_pointer() : () -> i64
      %993 = func.call @cc_cons(%992, %991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%993) : (i64) -> ()
      %994 = func.call @stack_pop_pointer() : () -> i64
      %995 = func.call @stack_pop_pointer() : () -> i64
      %996 = func.call @cc_cons(%995, %994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%996) : (i64) -> ()
      %997 = func.call @stack_pop_pointer() : () -> i64
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = func.call @cc_cons(%998, %997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%999) : (i64) -> ()
      %1000 = func.call @stack_pop_pointer() : () -> i64
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @cc_cons(%1001, %1000) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      %1003 = func.call @stack_pop_pointer() : () -> i64
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = func.call @cc_cons(%1004, %1003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1006 = func.call @stack_pop_pointer() : () -> i64
      %1007 = func.call @stack_pop_pointer() : () -> i64
      %1008 = func.call @cc_cons(%1007, %1006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1008) : (i64) -> ()
      %1009 = func.call @stack_pop_pointer() : () -> i64
      %1010 = func.call @stack_pop_pointer() : () -> i64
      %1011 = func.call @cc_cons(%1010, %1009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1011) : (i64) -> ()
      %1012 = func.call @stack_pop_pointer() : () -> i64
      %1013 = func.call @stack_pop_pointer() : () -> i64
      %1014 = func.call @cc_cons(%1013, %1012) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1014) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1015 = func.call @stack_pop_pointer() : () -> i64
      %1016 = func.call @stack_pop_pointer() : () -> i64
      %1017 = func.call @cc_cons(%1016, %1015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1017) : (i64) -> ()
      %1018 = func.call @stack_pop_pointer() : () -> i64
      %1019 = func.call @stack_pop_pointer() : () -> i64
      %1020 = func.call @cc_cons(%1019, %1018) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1020) : (i64) -> ()
      %1021 = func.call @stack_pop_pointer() : () -> i64
      %1022 = func.call @stack_pop_pointer() : () -> i64
      %1023 = func.call @cc_cons(%1022, %1021) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1023) : (i64) -> ()
      %1024 = func.call @stack_pop_pointer() : () -> i64
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = func.call @cc_cons(%1025, %1024) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1026) : (i64) -> ()
      %1027 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1028 = arith.constant 13 : i64
      %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
      %1030 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1031 = arith.constant 9 : i64
      %1032 = func.call @cc_make_string(%1030, %1031) : (!llvm.ptr, i64) -> i64
      %1033 = func.call @cc_intern(%1029, %1032) : (i64, i64) -> i64
      %1034 = func.call @cc_nil_value() : () -> i64
      %1035 = func.call @cc_cons(%1033, %1034) : (i64, i64) -> i64
      %1036 = func.call @cc_values_pack(%1035) : (i64) -> i64
      func.call @stack_push_pointer(%1033) : (i64) -> ()
      %1037 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1038 = arith.constant 5 : i64
      %1039 = func.call @cc_make_string(%1037, %1038) : (!llvm.ptr, i64) -> i64
      %1040 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1041 = arith.constant 11 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = func.call @cc_intern(%1039, %1042) : (i64, i64) -> i64
      %1044 = func.call @cc_nil_value() : () -> i64
      %1045 = func.call @cc_cons(%1043, %1044) : (i64, i64) -> i64
      %1046 = func.call @cc_values_pack(%1045) : (i64) -> i64
      func.call @stack_push_pointer(%1043) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @cc_cons(%1048, %1047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1049) : (i64) -> ()
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @cc_cons(%1051, %1050) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1052) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1053 = func.call @stack_pop_pointer() : () -> i64
      %1054 = func.call @stack_pop_pointer() : () -> i64
      %1055 = func.call @cc_cons(%1054, %1053) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @cc_cons(%1057, %1056) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1058) : (i64) -> ()
      %1059 = func.call @stack_pop_pointer() : () -> i64
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @cc_cons(%1060, %1059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1061) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @cc_cons(%1063, %1062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @cc_cons(%1066, %1065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1067) : (i64) -> ()
      %1068 = func.call @stack_pop_pointer() : () -> i64
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1070 = func.call @cc_cons(%1069, %1068) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1070) : (i64) -> ()
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1894 = arith.constant 201747314245635 : i64
      %1895 = arith.constant 0 : i64
      %1896 = func.call @cc_make_closure(%1894, %1895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1896) : (i64) -> ()
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1898) : (i64) -> ()
      %1899 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1899) : (i64) -> ()
      %1900 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1900) : (i64) -> ()
      %1901 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%1901) : (i64) -> ()
      %1902 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1902) : (i64) -> ()
      %1903 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%1903) : (i64) -> ()
      %1904 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%1904) : (i64) -> ()
      %1905 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%1905) : (i64) -> ()
      %1906 = arith.constant 9 : i64
      func.call @stack_push_fixnum(%1906) : (i64) -> ()
      %1907 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1907) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1908 = func.call @stack_pop_pointer() : () -> i64
      %1909 = func.call @stack_pop_pointer() : () -> i64
      %1910 = func.call @cc_cons(%1909, %1908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1910) : (i64) -> ()
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @stack_pop_pointer() : () -> i64
      %1913 = func.call @cc_cons(%1912, %1911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1913) : (i64) -> ()
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = func.call @stack_pop_pointer() : () -> i64
      %1916 = func.call @cc_cons(%1915, %1914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1916) : (i64) -> ()
      %1917 = func.call @stack_pop_pointer() : () -> i64
      %1918 = func.call @stack_pop_pointer() : () -> i64
      %1919 = func.call @cc_cons(%1918, %1917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      %1920 = func.call @stack_pop_pointer() : () -> i64
      %1921 = func.call @stack_pop_pointer() : () -> i64
      %1922 = func.call @cc_cons(%1921, %1920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1922) : (i64) -> ()
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = func.call @cc_cons(%1924, %1923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1925) : (i64) -> ()
      %1926 = func.call @stack_pop_pointer() : () -> i64
      %1927 = func.call @stack_pop_pointer() : () -> i64
      %1928 = func.call @cc_cons(%1927, %1926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1928) : (i64) -> ()
      %1929 = func.call @stack_pop_pointer() : () -> i64
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = func.call @cc_cons(%1930, %1929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1931) : (i64) -> ()
      %1932 = func.call @stack_pop_pointer() : () -> i64
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = func.call @cc_cons(%1933, %1932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1934) : (i64) -> ()
      %1935 = func.call @stack_pop_pointer() : () -> i64
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @cc_cons(%1936, %1935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1937) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1938 = func.call @stack_pop_pointer() : () -> i64
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @cc_cons(%1939, %1938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1940) : (i64) -> ()
      %1941 = func.call @stack_pop_pointer() : () -> i64
      %1942 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1943 = arith.constant 11 : i64
      %1944 = func.call @cc_make_string(%1942, %1943) : (!llvm.ptr, i64) -> i64
      %1945 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1946 = arith.constant 7 : i64
      %1947 = func.call @cc_make_string(%1945, %1946) : (!llvm.ptr, i64) -> i64
      %1948 = func.call @cc_intern(%1944, %1947) : (i64, i64) -> i64
      %1949 = func.call @cc_nil_value() : () -> i64
      %1950 = func.call @cc_cons(%1948, %1949) : (i64, i64) -> i64
      %1951 = func.call @cc_values_pack(%1950) : (i64) -> i64
      func.call @stack_push_pointer(%1948) : (i64) -> ()
      %1952 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1955 = arith.constant 4 : i64
      %1956 = func.call @cc_make_string(%1954, %1955) : (!llvm.ptr, i64) -> i64
      %1957 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1958 = arith.constant 7 : i64
      %1959 = func.call @cc_make_string(%1957, %1958) : (!llvm.ptr, i64) -> i64
      %1960 = func.call @cc_intern(%1956, %1959) : (i64, i64) -> i64
      %1961 = func.call @cc_nil_value() : () -> i64
      %1962 = func.call @cc_cons(%1960, %1961) : (i64, i64) -> i64
      %1963 = func.call @cc_values_pack(%1962) : (i64) -> i64
      func.call @stack_push_pointer(%1960) : (i64) -> ()
      %1964 = func.call @stack_pop_pointer() : () -> i64
      %1965 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1966 = arith.constant 6 : i64
      %1967 = func.call @cc_make_string(%1965, %1966) : (!llvm.ptr, i64) -> i64
      %1968 = func.call @cc_nil_value() : () -> i64
      %1969 = func.call @cc_intern(%1967, %1968) : (i64, i64) -> i64
      %1970 = func.call @cc_nil_value() : () -> i64
      %1971 = func.call @cc_cons(%1969, %1970) : (i64, i64) -> i64
      %1972 = func.call @cc_values_pack(%1971) : (i64) -> i64
      func.call @stack_push_pointer(%1969) : (i64) -> ()
      %1973 = func.call @stack_pop_pointer() : () -> i64
      %1974 = func.call @cc_nil_value() : () -> i64
      %1975 = func.call @cc_errorp(%404) : (i64) -> i64
      %1976 = arith.cmpi ne, %1975, %1974 : i64
      %1977 = arith.cmpi eq, %1974, %1974 : i64
      %1978 = arith.andi %1976, %1977 : i1
      %1979 = scf.if %1978 -> (i64) {
        scf.yield %404 : i64
      } else {
        scf.yield %1974 : i64
      }
      %1980 = func.call @cc_errorp(%1071) : (i64) -> i64
      %1981 = arith.cmpi ne, %1980, %1974 : i64
      %1982 = arith.cmpi eq, %1979, %1974 : i64
      %1983 = arith.andi %1981, %1982 : i1
      %1984 = scf.if %1983 -> (i64) {
        scf.yield %1071 : i64
      } else {
        scf.yield %1979 : i64
      }
      %1985 = func.call @cc_errorp(%1897) : (i64) -> i64
      %1986 = arith.cmpi ne, %1985, %1974 : i64
      %1987 = arith.cmpi eq, %1984, %1974 : i64
      %1988 = arith.andi %1986, %1987 : i1
      %1989 = scf.if %1988 -> (i64) {
        scf.yield %1897 : i64
      } else {
        scf.yield %1984 : i64
      }
      %1990 = func.call @cc_errorp(%1941) : (i64) -> i64
      %1991 = arith.cmpi ne, %1990, %1974 : i64
      %1992 = arith.cmpi eq, %1989, %1974 : i64
      %1993 = arith.andi %1991, %1992 : i1
      %1994 = scf.if %1993 -> (i64) {
        scf.yield %1941 : i64
      } else {
        scf.yield %1989 : i64
      }
      %1995 = func.call @cc_errorp(%1952) : (i64) -> i64
      %1996 = arith.cmpi ne, %1995, %1974 : i64
      %1997 = arith.cmpi eq, %1994, %1974 : i64
      %1998 = arith.andi %1996, %1997 : i1
      %1999 = scf.if %1998 -> (i64) {
        scf.yield %1952 : i64
      } else {
        scf.yield %1994 : i64
      }
      %2000 = func.call @cc_errorp(%1953) : (i64) -> i64
      %2001 = arith.cmpi ne, %2000, %1974 : i64
      %2002 = arith.cmpi eq, %1999, %1974 : i64
      %2003 = arith.andi %2001, %2002 : i1
      %2004 = scf.if %2003 -> (i64) {
        scf.yield %1953 : i64
      } else {
        scf.yield %1999 : i64
      }
      %2005 = func.call @cc_errorp(%1964) : (i64) -> i64
      %2006 = arith.cmpi ne, %2005, %1974 : i64
      %2007 = arith.cmpi eq, %2004, %1974 : i64
      %2008 = arith.andi %2006, %2007 : i1
      %2009 = scf.if %2008 -> (i64) {
        scf.yield %1964 : i64
      } else {
        scf.yield %2004 : i64
      }
      %2010 = func.call @cc_errorp(%1973) : (i64) -> i64
      %2011 = arith.cmpi ne, %2010, %1974 : i64
      %2012 = arith.cmpi eq, %2009, %1974 : i64
      %2013 = arith.andi %2011, %2012 : i1
      %2014 = scf.if %2013 -> (i64) {
        scf.yield %1973 : i64
      } else {
        scf.yield %2009 : i64
      }
      %2015 = arith.cmpi ne, %2014, %1974 : i64
      scf.if %2015 {
        func.call @stack_push_pointer(%2014) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%404) : (i64) -> ()
        func.call @stack_push_pointer(%1071) : (i64) -> ()
        func.call @stack_push_pointer(%1897) : (i64) -> ()
        func.call @stack_push_pointer(%1941) : (i64) -> ()
        func.call @stack_push_pointer(%1952) : (i64) -> ()
        func.call @stack_push_pointer(%1953) : (i64) -> ()
        func.call @stack_push_pointer(%1964) : (i64) -> ()
        func.call @stack_push_pointer(%1973) : (i64) -> ()
        %2016 = llvm.mlir.addressof @str151 : !llvm.ptr
        %2017 = func.call @cc_make_function_ref_const(%2016) : (!llvm.ptr) -> i64
        %2018 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2017, %2018) : (i64, i64) -> ()
      }
      %2019 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2019 : i64
    }
    func.call @stack_push_pointer(%395) : (i64) -> ()
    %2020 = func.call @stack_pop_pointer() : () -> i64
    %2021 = func.call @cc_multiple_value_list(%2020) : (i64) -> i64
    %2022 = llvm.mlir.addressof @str152 : !llvm.ptr
    %2023 = arith.constant 38 : i64
    %2024 = func.call @cc_make_string(%2022, %2023) : (!llvm.ptr, i64) -> i64
    %2025 = func.call @cc_nil_value() : () -> i64
    %2026 = func.call @cc_intern(%2024, %2025) : (i64, i64) -> i64
    %2027 = func.call @cc_nil_value() : () -> i64
    %2028 = func.call @cc_cons(%2026, %2027) : (i64, i64) -> i64
    %2029 = func.call @cc_values_pack(%2028) : (i64) -> i64
    %2030 = func.call @cc_symbol_value(%2026) : (i64) -> i64
    %2031 = llvm.mlir.addressof @str153 : !llvm.ptr
    %2032 = arith.constant 40 : i64
    %2033 = func.call @cc_make_string(%2031, %2032) : (!llvm.ptr, i64) -> i64
    %2034 = func.call @cc_nil_value() : () -> i64
    %2035 = func.call @cc_intern(%2033, %2034) : (i64, i64) -> i64
    %2036 = func.call @cc_nil_value() : () -> i64
    %2037 = func.call @cc_cons(%2035, %2036) : (i64, i64) -> i64
    %2038 = func.call @cc_values_pack(%2037) : (i64) -> i64
    %2039 = func.call @cc_symbol_value(%2035) : (i64) -> i64
    %2040 = func.call @cc_nil_value() : () -> i64
    %2041 = arith.cmpi ne, %2030, %2040 : i64
    %2042 = scf.if %2041 -> (i64) {
      scf.yield %2039 : i64
    } else {
      scf.yield %2021 : i64
    }
    %2043 = func.call @cc_values_pack(%2042) : (i64) -> i64
    func.call @stack_push_pointer(%2043) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_201747314245635"() {
    %1072 = func.call @cc_nil_value() : () -> i64
    %1073 = func.call @cc_nil_value() : () -> i64
    %1074 = func.call @cc_errorp(%1072) : (i64) -> i64
    %1075 = arith.cmpi ne, %1074, %1073 : i64
    %1076 = scf.if %1075 -> (i64) {
      scf.yield %1072 : i64
    } else {
      %1077 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1078 = arith.constant 3 : i64
      %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
      %1080 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1081 = arith.constant 7 : i64
      %1082 = func.call @cc_make_string(%1080, %1081) : (!llvm.ptr, i64) -> i64
      %1083 = func.call @cc_intern(%1079, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_cons(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_values_pack(%1085) : (i64) -> i64
      func.call @stack_push_pointer(%1083) : (i64) -> ()
      %1087 = func.call @stack_pop_pointer() : () -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_errorp(%1087) : (i64) -> i64
      %1090 = arith.cmpi ne, %1089, %1088 : i64
      %1091 = arith.cmpi eq, %1088, %1088 : i64
      %1092 = arith.andi %1090, %1091 : i1
      %1093 = scf.if %1092 -> (i64) {
        scf.yield %1087 : i64
      } else {
        scf.yield %1088 : i64
      }
      %1094 = arith.cmpi ne, %1093, %1088 : i64
      scf.if %1094 {
        func.call @stack_push_pointer(%1093) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1087) : (i64) -> ()
        %1095 = llvm.mlir.addressof @str112 : !llvm.ptr
        %1096 = func.call @cc_make_function_ref_const(%1095) : (!llvm.ptr) -> i64
        %1097 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1096, %1097) : (i64, i64) -> ()
      }
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1099) : (i64) -> ()
      %1100 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
      %1101 = func.call @stack_pop_pointer() : () -> i64
      %1103 = arith.constant 3 : i64
      %1102 = arith.andi %1100, %1103 : i64
      %1104 = arith.constant 0 : i64
      %1105 = arith.cmpi eq, %1102, %1104 : i64
      %1107 = arith.constant 3 : i64
      %1106 = arith.andi %1101, %1107 : i64
      %1108 = arith.constant 0 : i64
      %1109 = arith.cmpi eq, %1106, %1108 : i64
      %1110 = arith.andi %1105, %1109 : i1
      %1111 = scf.if %1110 -> (i64) {
        %1112 = arith.constant 2 : i64
        %1113 = arith.shrsi %1100, %1112 : i64
        %1114 = arith.constant 2 : i64
        %1115 = arith.shrsi %1101, %1114 : i64
        %1116 = arith.constant 0 : i64
        %1117 = arith.cmpi slt, %1113, %1116 : i64
        %1118 = scf.if %1117 -> (i64) {
          %1119 = arith.subi %1116, %1113 : i64
          scf.yield %1119 : i64
        } else {
          scf.yield %1113 : i64
        }
        %1120 = arith.constant 0 : i64
        %1121 = arith.cmpi slt, %1115, %1120 : i64
        %1122 = scf.if %1121 -> (i64) {
          %1123 = arith.subi %1120, %1115 : i64
          scf.yield %1123 : i64
        } else {
          scf.yield %1115 : i64
        }
        %1124 = arith.constant 1518500249 : i64
        %1125 = arith.cmpi sle, %1118, %1124 : i64
        %1126 = arith.cmpi sle, %1122, %1124 : i64
        %1127 = arith.andi %1125, %1126 : i1
        %1128 = scf.if %1127 -> (i64) {
          %1129 = arith.muli %1113, %1115 : i64
          %1130 = arith.constant 2 : i64
          %1131 = arith.shli %1129, %1130 : i64
          scf.yield %1131 : i64
        } else {
          %1132 = func.call @cc_mul(%1100, %1101) : (i64, i64) -> i64
          scf.yield %1132 : i64
        }
        scf.yield %1128 : i64
      } else {
        %1133 = func.call @cc_mul(%1100, %1101) : (i64, i64) -> i64
        scf.yield %1133 : i64
      }
      func.call @stack_push_pointer(%1111) : (i64) -> ()
      %1134 = func.call @stack_pop_pointer() : () -> i64
      %1135 = func.call @cc_nil_value() : () -> i64
      %1136 = func.call @cc_errorp(%1134) : (i64) -> i64
      %1137 = arith.cmpi ne, %1136, %1135 : i64
      %1138 = arith.cmpi eq, %1135, %1135 : i64
      %1139 = arith.andi %1137, %1138 : i1
      %1140 = scf.if %1139 -> (i64) {
        scf.yield %1134 : i64
      } else {
        scf.yield %1135 : i64
      }
      %1141 = arith.cmpi ne, %1140, %1135 : i64
      scf.if %1141 {
        func.call @stack_push_pointer(%1140) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1134) : (i64) -> ()
        %1142 = llvm.mlir.addressof @str113 : !llvm.ptr
        %1143 = func.call @cc_make_function_ref_const(%1142) : (!llvm.ptr) -> i64
        %1144 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1143, %1144) : (i64, i64) -> ()
      }
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = func.call @cc_nil_value() : () -> i64
      %1147 = func.call @cc_nil_value() : () -> i64
      %1148 = func.call @cc_errorp(%1146) : (i64) -> i64
      %1149 = arith.cmpi ne, %1148, %1147 : i64
      %1150 = scf.if %1149 -> (i64) {
        scf.yield %1146 : i64
      } else {
        %1151 = func.call @cc_nil_value() : () -> i64
        %1152 = func.call @cc_nil_value() : () -> i64
        %1153 = func.call @cc_errorp(%1151) : (i64) -> i64
        %1154 = arith.cmpi ne, %1153, %1152 : i64
        %1155 = scf.if %1154 -> (i64) {
          scf.yield %1151 : i64
        } else {
          %1156 = arith.constant 0 : i64
          func.call @stack_push_fixnum(%1156) : (i64) -> ()
          %1157 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1158 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1159 = func.call @stack_pop_pointer() : () -> i64
          %1160 = arith.constant 7 : i64
          func.call @stack_push_fixnum(%1160) : (i64) -> ()
          %1161 = arith.constant 2 : i64
          func.call @stack_push_fixnum(%1161) : (i64) -> ()
          %1162 = arith.constant 10 : i64
          func.call @stack_push_fixnum(%1162) : (i64) -> ()
          %1163 = arith.constant 4 : i64
          func.call @stack_push_fixnum(%1163) : (i64) -> ()
          %1164 = arith.constant 3 : i64
          func.call @stack_push_fixnum(%1164) : (i64) -> ()
          %1165 = arith.constant 5 : i64
          func.call @stack_push_fixnum(%1165) : (i64) -> ()
          %1166 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%1166) : (i64) -> ()
          %1167 = arith.constant 6 : i64
          func.call @stack_push_fixnum(%1167) : (i64) -> ()
          %1168 = arith.constant 9 : i64
          func.call @stack_push_fixnum(%1168) : (i64) -> ()
          %1169 = arith.constant 8 : i64
          func.call @stack_push_fixnum(%1169) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %1170 = func.call @stack_pop_pointer() : () -> i64
          %1171 = func.call @stack_pop_pointer() : () -> i64
          %1172 = func.call @cc_cons(%1171, %1170) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1172) : (i64) -> ()
          %1173 = func.call @stack_pop_pointer() : () -> i64
          %1174 = func.call @stack_pop_pointer() : () -> i64
          %1175 = func.call @cc_cons(%1174, %1173) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1175) : (i64) -> ()
          %1176 = func.call @stack_pop_pointer() : () -> i64
          %1177 = func.call @stack_pop_pointer() : () -> i64
          %1178 = func.call @cc_cons(%1177, %1176) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1178) : (i64) -> ()
          %1179 = func.call @stack_pop_pointer() : () -> i64
          %1180 = func.call @stack_pop_pointer() : () -> i64
          %1181 = func.call @cc_cons(%1180, %1179) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1181) : (i64) -> ()
          %1182 = func.call @stack_pop_pointer() : () -> i64
          %1183 = func.call @stack_pop_pointer() : () -> i64
          %1184 = func.call @cc_cons(%1183, %1182) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1184) : (i64) -> ()
          %1185 = func.call @stack_pop_pointer() : () -> i64
          %1186 = func.call @stack_pop_pointer() : () -> i64
          %1187 = func.call @cc_cons(%1186, %1185) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1187) : (i64) -> ()
          %1188 = func.call @stack_pop_pointer() : () -> i64
          %1189 = func.call @stack_pop_pointer() : () -> i64
          %1190 = func.call @cc_cons(%1189, %1188) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1190) : (i64) -> ()
          %1191 = func.call @stack_pop_pointer() : () -> i64
          %1192 = func.call @stack_pop_pointer() : () -> i64
          %1193 = func.call @cc_cons(%1192, %1191) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1193) : (i64) -> ()
          %1194 = func.call @stack_pop_pointer() : () -> i64
          %1195 = func.call @stack_pop_pointer() : () -> i64
          %1196 = func.call @cc_cons(%1195, %1194) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1196) : (i64) -> ()
          %1197 = func.call @stack_pop_pointer() : () -> i64
          %1198 = func.call @stack_pop_pointer() : () -> i64
          %1199 = func.call @cc_cons(%1198, %1197) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1199) : (i64) -> ()
          %1200 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1201 = func.call @stack_pop_pointer() : () -> i64
          %1202 = func.call @cc_nil_value() : () -> i64
          %1203 = func.call @cc_nil_value() : () -> i64
          %1204 = func.call @cc_errorp(%1202) : (i64) -> i64
          %1205 = arith.cmpi ne, %1204, %1203 : i64
          %1206 = scf.if %1205 -> (i64) {
            scf.yield %1202 : i64
          } else {
            %1207 = func.call @cc_nil_value() : () -> i64
            %1208 = llvm.mlir.addressof @str114 : !llvm.ptr
            %1209 = arith.constant 38 : i64
            %1210 = func.call @cc_make_string(%1208, %1209) : (!llvm.ptr, i64) -> i64
            %1211 = func.call @cc_nil_value() : () -> i64
            %1212 = func.call @cc_intern(%1210, %1211) : (i64, i64) -> i64
            %1213 = func.call @cc_nil_value() : () -> i64
            %1214 = func.call @cc_cons(%1212, %1213) : (i64, i64) -> i64
            %1215 = func.call @cc_values_pack(%1214) : (i64) -> i64
            %1216 = func.call @cc_set_symbol_value(%1212, %1207) : (i64, i64) -> i64
            %1217 = llvm.mlir.addressof @str115 : !llvm.ptr
            %1218 = arith.constant 39 : i64
            %1219 = func.call @cc_make_string(%1217, %1218) : (!llvm.ptr, i64) -> i64
            %1220 = func.call @cc_nil_value() : () -> i64
            %1221 = func.call @cc_intern(%1219, %1220) : (i64, i64) -> i64
            %1222 = func.call @cc_nil_value() : () -> i64
            %1223 = func.call @cc_cons(%1221, %1222) : (i64, i64) -> i64
            %1224 = func.call @cc_values_pack(%1223) : (i64) -> i64
            %1225 = func.call @cc_set_symbol_value(%1221, %1207) : (i64, i64) -> i64
            %1226 = llvm.mlir.addressof @str116 : !llvm.ptr
            %1227 = arith.constant 40 : i64
            %1228 = func.call @cc_make_string(%1226, %1227) : (!llvm.ptr, i64) -> i64
            %1229 = func.call @cc_nil_value() : () -> i64
            %1230 = func.call @cc_intern(%1228, %1229) : (i64, i64) -> i64
            %1231 = func.call @cc_nil_value() : () -> i64
            %1232 = func.call @cc_cons(%1230, %1231) : (i64, i64) -> i64
            %1233 = func.call @cc_values_pack(%1232) : (i64) -> i64
            %1234 = func.call @cc_set_symbol_value(%1230, %1207) : (i64, i64) -> i64
            %1235:5 = scf.while (%arg0 = %1159, %arg1 = %1201, %arg2 = %1158, %arg3 = %1157, %arg4 = %1200) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
              func.call @stack_push_pointer(%arg4) : (i64) -> ()
              %1236 = func.call @stack_pop_pointer() : () -> i64
              %1237 = func.call @cc_nil_value() : () -> i64
              %1238 = arith.cmpi ne, %1236, %1237 : i64
              %1239 = func.call @cc_nil_value() : () -> i64
              %1240 = llvm.mlir.addressof @str117 : !llvm.ptr
              %1241 = arith.constant 38 : i64
              %1242 = func.call @cc_make_string(%1240, %1241) : (!llvm.ptr, i64) -> i64
              %1243 = func.call @cc_nil_value() : () -> i64
              %1244 = func.call @cc_intern(%1242, %1243) : (i64, i64) -> i64
              %1245 = func.call @cc_nil_value() : () -> i64
              %1246 = func.call @cc_cons(%1244, %1245) : (i64, i64) -> i64
              %1247 = func.call @cc_values_pack(%1246) : (i64) -> i64
              %1248 = func.call @cc_symbol_value(%1244) : (i64) -> i64
              %1249 = arith.cmpi ne, %1248, %1239 : i64
              %1250 = llvm.mlir.addressof @str118 : !llvm.ptr
              %1251 = arith.constant 38 : i64
              %1252 = func.call @cc_make_string(%1250, %1251) : (!llvm.ptr, i64) -> i64
              %1253 = func.call @cc_nil_value() : () -> i64
              %1254 = func.call @cc_intern(%1252, %1253) : (i64, i64) -> i64
              %1255 = func.call @cc_nil_value() : () -> i64
              %1256 = func.call @cc_cons(%1254, %1255) : (i64, i64) -> i64
              %1257 = func.call @cc_values_pack(%1256) : (i64) -> i64
              %1258 = func.call @cc_symbol_value(%1254) : (i64) -> i64
              %1259 = arith.cmpi ne, %1258, %1239 : i64
              %1260 = arith.ori %1249, %1259 : i1
              %1261 = arith.constant 0 : i1
              %1262 = arith.cmpi eq, %1260, %1261 : i1
              %1263 = arith.andi %1238, %1262 : i1
              scf.condition(%1263) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
            } do {
              ^bb0(%1264: i64, %1265: i64, %1266: i64, %1267: i64, %1268: i64):
              %1269 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%1268) : (i64) -> ()
              %1270 = func.call @stack_pop_pointer() : () -> i64
              %1271 = func.call @cc_nil_value() : () -> i64
              %1272 = arith.cmpi eq, %1270, %1271 : i64
              %1274 = func.call @cc_t_value() : () -> i64
              %1273 = arith.select %1272, %1274, %1271 : i64
              func.call @stack_push_pointer(%1273) : (i64) -> ()
              %1275 = func.call @stack_pop_pointer() : () -> i64
              %1276 = func.call @cc_nil_value() : () -> i64
              %1277 = func.call @cc_cons(%1275, %1276) : (i64, i64) -> i64
              %1278 = func.call @cc_not(%1277) : (i64) -> i64
              func.call @stack_push_pointer(%1278) : (i64) -> ()
              %1279 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1268) : (i64) -> ()
              %1280 = func.call @stack_pop_pointer() : () -> i64
              %1281 = func.call @cc_is_cons(%1280) : (i64) -> i32
              %1282 = arith.constant 0 : i32
              %1283 = arith.cmpi ne, %1281, %1282 : i32
              %1284 = func.call @cc_t_value() : () -> i64
              %1285 = func.call @cc_nil_value() : () -> i64
              %1286 = arith.select %1283, %1284, %1285 : i64
              func.call @stack_push_pointer(%1286) : (i64) -> ()
              %1287 = func.call @stack_pop_pointer() : () -> i64
              %1288 = func.call @cc_nil_value() : () -> i64
              %1289 = func.call @cc_cons(%1287, %1288) : (i64, i64) -> i64
              %1290 = func.call @cc_not(%1289) : (i64) -> i64
              func.call @stack_push_pointer(%1290) : (i64) -> ()
              %1291 = func.call @stack_pop_pointer() : () -> i64
              %1292 = func.call @cc_cons(%1291, %1269) : (i64, i64) -> i64
              %1293 = func.call @cc_cons(%1279, %1292) : (i64, i64) -> i64
              %1294 = func.call @cc_and(%1293) : (i64) -> i64
              func.call @stack_push_pointer(%1294) : (i64) -> ()
              %1295 = func.call @stack_pop_pointer() : () -> i64
              %1296 = func.call @cc_nil_value() : () -> i64
              %1297 = arith.cmpi ne, %1295, %1296 : i64
              scf.if %1297 {
                %1298 = llvm.mlir.addressof @str119 : !llvm.ptr
                %1299 = arith.constant 10 : i64
                %1300 = func.call @cc_make_string(%1298, %1299) : (!llvm.ptr, i64) -> i64
                %1301 = func.call @cc_nil_value() : () -> i64
                %1302 = func.call @cc_intern(%1300, %1301) : (i64, i64) -> i64
                %1303 = func.call @cc_nil_value() : () -> i64
                %1304 = func.call @cc_cons(%1302, %1303) : (i64, i64) -> i64
                %1305 = func.call @cc_values_pack(%1304) : (i64) -> i64
                func.call @stack_push_pointer(%1302) : (i64) -> ()
                %1306 = func.call @stack_pop_pointer() : () -> i64
                %1307 = func.call @cc_nil_value() : () -> i64
                %1308 = func.call @cc_errorp(%1306) : (i64) -> i64
                %1309 = arith.cmpi ne, %1308, %1307 : i64
                %1310 = arith.cmpi eq, %1307, %1307 : i64
                %1311 = arith.andi %1309, %1310 : i1
                %1312 = scf.if %1311 -> (i64) {
                  scf.yield %1306 : i64
                } else {
                  scf.yield %1307 : i64
                }
                %1313 = arith.cmpi ne, %1312, %1307 : i64
                scf.if %1313 {
                  func.call @stack_push_pointer(%1312) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%1306) : (i64) -> ()
                  %1314 = llvm.mlir.addressof @str120 : !llvm.ptr
                  %1315 = func.call @cc_make_function_ref_const(%1314) : (!llvm.ptr) -> i64
                  %1316 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%1315, %1316) : (i64, i64) -> ()
                }
                %1317 = func.call @stack_pop_pointer() : () -> i64
                %1318 = func.call @cc_multiple_value_list(%1317) : (i64) -> i64
                %1319 = func.call @cc_t_value() : () -> i64
                %1320 = llvm.mlir.addressof @str121 : !llvm.ptr
                %1321 = arith.constant 38 : i64
                %1322 = func.call @cc_make_string(%1320, %1321) : (!llvm.ptr, i64) -> i64
                %1323 = func.call @cc_nil_value() : () -> i64
                %1324 = func.call @cc_intern(%1322, %1323) : (i64, i64) -> i64
                %1325 = func.call @cc_nil_value() : () -> i64
                %1326 = func.call @cc_cons(%1324, %1325) : (i64, i64) -> i64
                %1327 = func.call @cc_values_pack(%1326) : (i64) -> i64
                %1328 = func.call @cc_set_symbol_value(%1324, %1319) : (i64, i64) -> i64
                %1329 = llvm.mlir.addressof @str122 : !llvm.ptr
                %1330 = arith.constant 39 : i64
                %1331 = func.call @cc_make_string(%1329, %1330) : (!llvm.ptr, i64) -> i64
                %1332 = func.call @cc_nil_value() : () -> i64
                %1333 = func.call @cc_intern(%1331, %1332) : (i64, i64) -> i64
                %1334 = func.call @cc_nil_value() : () -> i64
                %1335 = func.call @cc_cons(%1333, %1334) : (i64, i64) -> i64
                %1336 = func.call @cc_values_pack(%1335) : (i64) -> i64
                %1337 = func.call @cc_set_symbol_value(%1333, %1317) : (i64, i64) -> i64
                %1338 = llvm.mlir.addressof @str123 : !llvm.ptr
                %1339 = arith.constant 40 : i64
                %1340 = func.call @cc_make_string(%1338, %1339) : (!llvm.ptr, i64) -> i64
                %1341 = func.call @cc_nil_value() : () -> i64
                %1342 = func.call @cc_intern(%1340, %1341) : (i64, i64) -> i64
                %1343 = func.call @cc_nil_value() : () -> i64
                %1344 = func.call @cc_cons(%1342, %1343) : (i64, i64) -> i64
                %1345 = func.call @cc_values_pack(%1344) : (i64) -> i64
                %1346 = func.call @cc_set_symbol_value(%1342, %1318) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1317) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %1347 = func.call @stack_depth() : () -> i64
              %1348 = arith.constant 0 : i64
              %1349 = arith.cmpi sgt, %1347, %1348 : i64
              scf.if %1349 {
                %1350 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1268) : (i64) -> ()
              %1351 = func.call @stack_pop_pointer() : () -> i64
              %1352 = func.call @cc_car(%1351) : (i64) -> i64
              func.call @stack_push_pointer(%1352) : (i64) -> ()
              %1353 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1353) : (i64) -> ()
              %1354 = func.call @stack_depth() : () -> i64
              %1355 = arith.constant 0 : i64
              %1356 = arith.cmpi sgt, %1354, %1355 : i64
              scf.if %1356 {
                %1357 = func.call @stack_pop_pointer() : () -> i64
              }
              %1358 = func.call @cc_t_value() : () -> i64
              func.call @stack_push_pointer(%1358) : (i64) -> ()
              %1359 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1359) : (i64) -> ()
              %1360 = func.call @stack_depth() : () -> i64
              %1361 = arith.constant 0 : i64
              %1362 = arith.cmpi sgt, %1360, %1361 : i64
              scf.if %1362 {
                %1363 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1267) : (i64) -> ()
              %1364 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1364) : (i64) -> ()
              %1365 = func.call @stack_depth() : () -> i64
              %1366 = arith.constant 0 : i64
              %1367 = arith.cmpi sgt, %1365, %1366 : i64
              scf.if %1367 {
                %1368 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1145) : (i64) -> ()
              %1369 = func.call @stack_pop_pointer() : () -> i64
              %1370 = llvm.mlir.addressof @str124 : !llvm.ptr
              %1371 = arith.constant 3 : i64
              %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
              %1373 = llvm.mlir.addressof @str125 : !llvm.ptr
              %1374 = arith.constant 7 : i64
              %1375 = func.call @cc_make_string(%1373, %1374) : (!llvm.ptr, i64) -> i64
              %1376 = func.call @cc_intern(%1372, %1375) : (i64, i64) -> i64
              %1377 = func.call @cc_nil_value() : () -> i64
              %1378 = func.call @cc_cons(%1376, %1377) : (i64, i64) -> i64
              %1379 = func.call @cc_values_pack(%1378) : (i64) -> i64
              func.call @stack_push_pointer(%1376) : (i64) -> ()
              %1380 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1353) : (i64) -> ()
              %1381 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1267) : (i64) -> ()
              %1382 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1098) : (i64) -> ()
              %1383 = func.call @stack_pop_pointer() : () -> i64
              %1385 = arith.constant 3 : i64
              %1384 = arith.andi %1382, %1385 : i64
              %1386 = arith.constant 0 : i64
              %1387 = arith.cmpi eq, %1384, %1386 : i64
              %1389 = arith.constant 3 : i64
              %1388 = arith.andi %1383, %1389 : i64
              %1390 = arith.constant 0 : i64
              %1391 = arith.cmpi eq, %1388, %1390 : i64
              %1392 = arith.andi %1387, %1391 : i1
              %1393 = scf.if %1392 -> (i64) {
                %1394 = arith.constant 2 : i64
                %1395 = arith.shrsi %1382, %1394 : i64
                %1396 = arith.constant 2 : i64
                %1397 = arith.shrsi %1383, %1396 : i64
                %1398 = arith.constant 0 : i64
                %1399 = arith.cmpi slt, %1395, %1398 : i64
                %1400 = scf.if %1399 -> (i64) {
                  %1401 = arith.subi %1398, %1395 : i64
                  scf.yield %1401 : i64
                } else {
                  scf.yield %1395 : i64
                }
                %1402 = arith.constant 0 : i64
                %1403 = arith.cmpi slt, %1397, %1402 : i64
                %1404 = scf.if %1403 -> (i64) {
                  %1405 = arith.subi %1402, %1397 : i64
                  scf.yield %1405 : i64
                } else {
                  scf.yield %1397 : i64
                }
                %1406 = arith.constant 1518500249 : i64
                %1407 = arith.cmpi sle, %1400, %1406 : i64
                %1408 = arith.cmpi sle, %1404, %1406 : i64
                %1409 = arith.andi %1407, %1408 : i1
                %1410 = scf.if %1409 -> (i64) {
                  %1411 = arith.muli %1395, %1397 : i64
                  %1412 = arith.constant 2 : i64
                  %1413 = arith.shli %1411, %1412 : i64
                  scf.yield %1413 : i64
                } else {
                  %1414 = func.call @cc_mul(%1382, %1383) : (i64, i64) -> i64
                  scf.yield %1414 : i64
                }
                scf.yield %1410 : i64
              } else {
                %1415 = func.call @cc_mul(%1382, %1383) : (i64, i64) -> i64
                scf.yield %1415 : i64
              }
              func.call @stack_push_pointer(%1393) : (i64) -> ()
              %1416 = func.call @stack_pop_pointer() : () -> i64
              %1417 = func.call @cc_nil_value() : () -> i64
              %1418 = func.call @cc_errorp(%1369) : (i64) -> i64
              %1419 = arith.cmpi ne, %1418, %1417 : i64
              %1420 = arith.cmpi eq, %1417, %1417 : i64
              %1421 = arith.andi %1419, %1420 : i1
              %1422 = scf.if %1421 -> (i64) {
                scf.yield %1369 : i64
              } else {
                scf.yield %1417 : i64
              }
              %1423 = func.call @cc_errorp(%1380) : (i64) -> i64
              %1424 = arith.cmpi ne, %1423, %1417 : i64
              %1425 = arith.cmpi eq, %1422, %1417 : i64
              %1426 = arith.andi %1424, %1425 : i1
              %1427 = scf.if %1426 -> (i64) {
                scf.yield %1380 : i64
              } else {
                scf.yield %1422 : i64
              }
              %1428 = func.call @cc_errorp(%1381) : (i64) -> i64
              %1429 = arith.cmpi ne, %1428, %1417 : i64
              %1430 = arith.cmpi eq, %1427, %1417 : i64
              %1431 = arith.andi %1429, %1430 : i1
              %1432 = scf.if %1431 -> (i64) {
                scf.yield %1381 : i64
              } else {
                scf.yield %1427 : i64
              }
              %1433 = func.call @cc_errorp(%1416) : (i64) -> i64
              %1434 = arith.cmpi ne, %1433, %1417 : i64
              %1435 = arith.cmpi eq, %1432, %1417 : i64
              %1436 = arith.andi %1434, %1435 : i1
              %1437 = scf.if %1436 -> (i64) {
                scf.yield %1416 : i64
              } else {
                scf.yield %1432 : i64
              }
              %1438 = arith.cmpi ne, %1437, %1417 : i64
              scf.if %1438 {
                func.call @stack_push_pointer(%1437) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1369) : (i64) -> ()
                func.call @stack_push_pointer(%1380) : (i64) -> ()
                func.call @stack_push_pointer(%1381) : (i64) -> ()
                func.call @stack_push_pointer(%1416) : (i64) -> ()
                %1439 = llvm.mlir.addressof @str126 : !llvm.ptr
                %1440 = func.call @cc_make_function_ref_const(%1439) : (!llvm.ptr) -> i64
                %1441 = arith.constant 4 : i64
                func.call @cc_funcall_stack(%1440, %1441) : (i64, i64) -> ()
              }
              %1442 = func.call @stack_depth() : () -> i64
              %1443 = arith.constant 0 : i64
              %1444 = arith.cmpi sgt, %1442, %1443 : i64
              scf.if %1444 {
                %1445 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1267) : (i64) -> ()
              %1446 = func.call @stack_pop_pointer() : () -> i64
              %1447 = arith.constant 1 : i64
              func.call @stack_push_fixnum(%1447) : (i64) -> ()
              %1448 = func.call @stack_pop_pointer() : () -> i64
              %1450 = arith.constant 3 : i64
              %1449 = arith.andi %1446, %1450 : i64
              %1451 = arith.constant 0 : i64
              %1452 = arith.cmpi eq, %1449, %1451 : i64
              %1454 = arith.constant 3 : i64
              %1453 = arith.andi %1448, %1454 : i64
              %1455 = arith.constant 0 : i64
              %1456 = arith.cmpi eq, %1453, %1455 : i64
              %1457 = arith.andi %1452, %1456 : i1
              %1458 = scf.if %1457 -> (i64) {
                %1459 = arith.constant 2 : i64
                %1460 = arith.shrsi %1446, %1459 : i64
                %1461 = arith.constant 2 : i64
                %1462 = arith.shrsi %1448, %1461 : i64
                %1463 = arith.addi %1460, %1462 : i64
                %1464 = arith.constant -2305843009213693952 : i64
                %1465 = arith.constant 2305843009213693951 : i64
                %1466 = arith.cmpi sge, %1463, %1464 : i64
                %1467 = arith.cmpi sle, %1463, %1465 : i64
                %1468 = arith.andi %1466, %1467 : i1
                %1469 = scf.if %1468 -> (i64) {
                  %1470 = arith.constant 2 : i64
                  %1471 = arith.shli %1463, %1470 : i64
                  scf.yield %1471 : i64
                } else {
                  %1472 = func.call @cc_add(%1446, %1448) : (i64, i64) -> i64
                  scf.yield %1472 : i64
                }
                scf.yield %1469 : i64
              } else {
                %1473 = func.call @cc_add(%1446, %1448) : (i64, i64) -> i64
                scf.yield %1473 : i64
              }
              func.call @stack_push_pointer(%1458) : (i64) -> ()
              %1474 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1474) : (i64) -> ()
              %1475 = func.call @stack_depth() : () -> i64
              %1476 = arith.constant 0 : i64
              %1477 = arith.cmpi sgt, %1475, %1476 : i64
              scf.if %1477 {
                %1478 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1268) : (i64) -> ()
              %1479 = func.call @stack_pop_pointer() : () -> i64
              %1480 = func.call @cc_cdr(%1479) : (i64) -> i64
              func.call @stack_push_pointer(%1480) : (i64) -> ()
              %1481 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1481) : (i64) -> ()
              %1482 = func.call @stack_depth() : () -> i64
              %1483 = arith.constant 0 : i64
              %1484 = arith.cmpi sgt, %1482, %1483 : i64
              scf.if %1484 {
                %1485 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %1353, %1359, %1364, %1474, %1481 : i64, i64, i64, i64, i64
            }
            func.call @stack_push_nil() : () -> ()
            %1486 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1235#1) : (i64) -> ()
            %1487 = func.call @stack_pop_pointer() : () -> i64
            %1488 = func.call @cc_nil_value() : () -> i64
            %1489 = arith.cmpi ne, %1487, %1488 : i64
            %1490:2 = scf.if %1489 -> (i64, i64) {
              %1491 = func.call @cc_nil_value() : () -> i64
              %1492 = func.call @cc_nil_value() : () -> i64
              %1493 = func.call @cc_errorp(%1491) : (i64) -> i64
              %1494 = arith.cmpi ne, %1493, %1492 : i64
              %1495:2 = scf.if %1494 -> (i64, i64) {
                scf.yield %1491, %1235#3 : i64, i64
              } else {
                func.call @stack_push_pointer(%1235#2) : (i64) -> ()
                %1496 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1496) : (i64) -> ()
                %1497 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %1497, %1496 : i64, i64
              }
              func.call @stack_push_pointer(%1495#0) : (i64) -> ()
              %1498 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1498, %1495#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %1499 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1499, %1235#3 : i64, i64
            }
            func.call @stack_push_pointer(%1490#0) : (i64) -> ()
            %1500 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1501 = func.call @stack_pop_pointer() : () -> i64
            %1502 = func.call @cc_multiple_value_list(%1501) : (i64) -> i64
            %1503 = llvm.mlir.addressof @str127 : !llvm.ptr
            %1504 = arith.constant 38 : i64
            %1505 = func.call @cc_make_string(%1503, %1504) : (!llvm.ptr, i64) -> i64
            %1506 = func.call @cc_nil_value() : () -> i64
            %1507 = func.call @cc_intern(%1505, %1506) : (i64, i64) -> i64
            %1508 = func.call @cc_nil_value() : () -> i64
            %1509 = func.call @cc_cons(%1507, %1508) : (i64, i64) -> i64
            %1510 = func.call @cc_values_pack(%1509) : (i64) -> i64
            %1511 = func.call @cc_symbol_value(%1507) : (i64) -> i64
            %1512 = llvm.mlir.addressof @str128 : !llvm.ptr
            %1513 = arith.constant 39 : i64
            %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
            %1515 = func.call @cc_nil_value() : () -> i64
            %1516 = func.call @cc_intern(%1514, %1515) : (i64, i64) -> i64
            %1517 = func.call @cc_nil_value() : () -> i64
            %1518 = func.call @cc_cons(%1516, %1517) : (i64, i64) -> i64
            %1519 = func.call @cc_values_pack(%1518) : (i64) -> i64
            %1520 = func.call @cc_symbol_value(%1516) : (i64) -> i64
            %1521 = llvm.mlir.addressof @str129 : !llvm.ptr
            %1522 = arith.constant 40 : i64
            %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
            %1524 = func.call @cc_nil_value() : () -> i64
            %1525 = func.call @cc_intern(%1523, %1524) : (i64, i64) -> i64
            %1526 = func.call @cc_nil_value() : () -> i64
            %1527 = func.call @cc_cons(%1525, %1526) : (i64, i64) -> i64
            %1528 = func.call @cc_values_pack(%1527) : (i64) -> i64
            %1529 = func.call @cc_symbol_value(%1525) : (i64) -> i64
            %1530 = func.call @cc_nil_value() : () -> i64
            %1531 = arith.cmpi ne, %1511, %1530 : i64
            %1532 = scf.if %1531 -> (i64) {
              scf.yield %1529 : i64
            } else {
              scf.yield %1502 : i64
            }
            %1533 = func.call @cc_values_pack(%1532) : (i64) -> i64
            func.call @stack_push_pointer(%1533) : (i64) -> ()
            %1534 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1534 : i64
          }
          func.call @stack_push_pointer(%1206) : (i64) -> ()
          %1535 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1535 : i64
        }
        %1536 = func.call @cc_nil_value() : () -> i64
        %1537 = func.call @cc_errorp(%1155) : (i64) -> i64
        %1538 = arith.cmpi ne, %1537, %1536 : i64
        %1539 = scf.if %1538 -> (i64) {
          scf.yield %1155 : i64
        } else {
          func.call @stack_push_pointer(%1145) : (i64) -> ()
          %1540 = func.call @stack_pop_pointer() : () -> i64
          %1541 = arith.constant 10 : i64
          func.call @stack_push_fixnum(%1541) : (i64) -> ()
          %1542 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1098) : (i64) -> ()
          %1543 = func.call @stack_pop_pointer() : () -> i64
          %1544 = llvm.mlir.addressof @str130 : !llvm.ptr
          %1545 = arith.constant 1 : i64
          %1546 = func.call @cc_make_string(%1544, %1545) : (!llvm.ptr, i64) -> i64
          %1547 = llvm.mlir.addressof @str131 : !llvm.ptr
          %1548 = arith.constant 11 : i64
          %1549 = func.call @cc_make_string(%1547, %1548) : (!llvm.ptr, i64) -> i64
          %1550 = func.call @cc_intern(%1546, %1549) : (i64, i64) -> i64
          %1551 = func.call @cc_nil_value() : () -> i64
          %1552 = func.call @cc_cons(%1550, %1551) : (i64, i64) -> i64
          %1553 = func.call @cc_values_pack(%1552) : (i64) -> i64
          func.call @stack_push_pointer(%1550) : (i64) -> ()
          %1554 = func.call @stack_pop_pointer() : () -> i64
          %1555 = func.call @cc_nil_value() : () -> i64
          %1556 = func.call @cc_errorp(%1554) : (i64) -> i64
          %1557 = arith.cmpi ne, %1556, %1555 : i64
          %1558 = arith.cmpi eq, %1555, %1555 : i64
          %1559 = arith.andi %1557, %1558 : i1
          %1560 = scf.if %1559 -> (i64) {
            scf.yield %1554 : i64
          } else {
            scf.yield %1555 : i64
          }
          %1561 = arith.cmpi ne, %1560, %1555 : i64
          scf.if %1561 {
            func.call @stack_push_pointer(%1560) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1554) : (i64) -> ()
            %1562 = llvm.mlir.addressof @str132 : !llvm.ptr
            %1563 = func.call @cc_make_function_ref_const(%1562) : (!llvm.ptr) -> i64
            %1564 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1563, %1564) : (i64, i64) -> ()
          }
          %1565 = func.call @stack_pop_pointer() : () -> i64
          %1566 = func.call @cc_nil_value() : () -> i64
          %1567 = func.call @cc_errorp(%1540) : (i64) -> i64
          %1568 = arith.cmpi ne, %1567, %1566 : i64
          %1569 = arith.cmpi eq, %1566, %1566 : i64
          %1570 = arith.andi %1568, %1569 : i1
          %1571 = scf.if %1570 -> (i64) {
            scf.yield %1540 : i64
          } else {
            scf.yield %1566 : i64
          }
          %1572 = func.call @cc_errorp(%1542) : (i64) -> i64
          %1573 = arith.cmpi ne, %1572, %1566 : i64
          %1574 = arith.cmpi eq, %1571, %1566 : i64
          %1575 = arith.andi %1573, %1574 : i1
          %1576 = scf.if %1575 -> (i64) {
            scf.yield %1542 : i64
          } else {
            scf.yield %1571 : i64
          }
          %1577 = func.call @cc_errorp(%1543) : (i64) -> i64
          %1578 = arith.cmpi ne, %1577, %1566 : i64
          %1579 = arith.cmpi eq, %1576, %1566 : i64
          %1580 = arith.andi %1578, %1579 : i1
          %1581 = scf.if %1580 -> (i64) {
            scf.yield %1543 : i64
          } else {
            scf.yield %1576 : i64
          }
          %1582 = func.call @cc_errorp(%1565) : (i64) -> i64
          %1583 = arith.cmpi ne, %1582, %1566 : i64
          %1584 = arith.cmpi eq, %1581, %1566 : i64
          %1585 = arith.andi %1583, %1584 : i1
          %1586 = scf.if %1585 -> (i64) {
            scf.yield %1565 : i64
          } else {
            scf.yield %1581 : i64
          }
          %1587 = arith.cmpi ne, %1586, %1566 : i64
          scf.if %1587 {
            func.call @stack_push_pointer(%1586) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1540) : (i64) -> ()
            func.call @stack_push_pointer(%1542) : (i64) -> ()
            func.call @stack_push_pointer(%1543) : (i64) -> ()
            func.call @stack_push_pointer(%1565) : (i64) -> ()
            %1588 = llvm.mlir.addressof @str133 : !llvm.ptr
            %1589 = func.call @cc_make_function_ref_const(%1588) : (!llvm.ptr) -> i64
            %1590 = arith.constant 4 : i64
            func.call @cc_funcall_stack(%1589, %1590) : (i64, i64) -> ()
          }
          %1591 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1591 : i64
        }
        %1592 = func.call @cc_nil_value() : () -> i64
        %1593 = func.call @cc_errorp(%1539) : (i64) -> i64
        %1594 = arith.cmpi ne, %1593, %1592 : i64
        %1595 = scf.if %1594 -> (i64) {
          scf.yield %1539 : i64
        } else {
          %1596 = arith.constant 0 : i64
          func.call @stack_push_fixnum(%1596) : (i64) -> ()
          %1597 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1598 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1599 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %1600 = func.call @stack_pop_pointer() : () -> i64
          %1601 = func.call @cc_nil_value() : () -> i64
          %1602 = func.call @cc_nil_value() : () -> i64
          %1603 = func.call @cc_errorp(%1601) : (i64) -> i64
          %1604 = arith.cmpi ne, %1603, %1602 : i64
          %1605 = scf.if %1604 -> (i64) {
            scf.yield %1601 : i64
          } else {
            %1606 = func.call @cc_nil_value() : () -> i64
            %1607 = llvm.mlir.addressof @str134 : !llvm.ptr
            %1608 = arith.constant 38 : i64
            %1609 = func.call @cc_make_string(%1607, %1608) : (!llvm.ptr, i64) -> i64
            %1610 = func.call @cc_nil_value() : () -> i64
            %1611 = func.call @cc_intern(%1609, %1610) : (i64, i64) -> i64
            %1612 = func.call @cc_nil_value() : () -> i64
            %1613 = func.call @cc_cons(%1611, %1612) : (i64, i64) -> i64
            %1614 = func.call @cc_values_pack(%1613) : (i64) -> i64
            %1615 = func.call @cc_set_symbol_value(%1611, %1606) : (i64, i64) -> i64
            %1616 = llvm.mlir.addressof @str135 : !llvm.ptr
            %1617 = arith.constant 39 : i64
            %1618 = func.call @cc_make_string(%1616, %1617) : (!llvm.ptr, i64) -> i64
            %1619 = func.call @cc_nil_value() : () -> i64
            %1620 = func.call @cc_intern(%1618, %1619) : (i64, i64) -> i64
            %1621 = func.call @cc_nil_value() : () -> i64
            %1622 = func.call @cc_cons(%1620, %1621) : (i64, i64) -> i64
            %1623 = func.call @cc_values_pack(%1622) : (i64) -> i64
            %1624 = func.call @cc_set_symbol_value(%1620, %1606) : (i64, i64) -> i64
            %1625 = llvm.mlir.addressof @str136 : !llvm.ptr
            %1626 = arith.constant 40 : i64
            %1627 = func.call @cc_make_string(%1625, %1626) : (!llvm.ptr, i64) -> i64
            %1628 = func.call @cc_nil_value() : () -> i64
            %1629 = func.call @cc_intern(%1627, %1628) : (i64, i64) -> i64
            %1630 = func.call @cc_nil_value() : () -> i64
            %1631 = func.call @cc_cons(%1629, %1630) : (i64, i64) -> i64
            %1632 = func.call @cc_values_pack(%1631) : (i64) -> i64
            %1633 = func.call @cc_set_symbol_value(%1629, %1606) : (i64, i64) -> i64
            %1634:4 = scf.while (%arg0 = %1600, %arg1 = %1598, %arg2 = %1599, %arg3 = %1597) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
              func.call @stack_push_pointer(%arg3) : (i64) -> ()
              %1635 = func.call @stack_pop_pointer() : () -> i64
              %1636 = arith.constant 10 : i64
              func.call @stack_push_fixnum(%1636) : (i64) -> ()
              %1637 = func.call @stack_pop_pointer() : () -> i64
              %1638 = arith.constant 1 : i1
              %1640 = arith.constant 3 : i64
              %1639 = arith.andi %1635, %1640 : i64
              %1641 = arith.constant 0 : i64
              %1642 = arith.cmpi eq, %1639, %1641 : i64
              %1644 = arith.constant 3 : i64
              %1643 = arith.andi %1637, %1644 : i64
              %1645 = arith.constant 0 : i64
              %1646 = arith.cmpi eq, %1643, %1645 : i64
              %1647 = arith.andi %1642, %1646 : i1
              %1648 = scf.if %1647 -> (i1) {
                %1649 = arith.constant 2 : i64
                %1650 = arith.shrsi %1635, %1649 : i64
                %1651 = arith.constant 2 : i64
                %1652 = arith.shrsi %1637, %1651 : i64
                %1653 = arith.cmpi slt, %1650, %1652 : i64
                scf.yield %1653 : i1
              } else {
                %1654 = func.call @cc_lt(%1635, %1637) : (i64, i64) -> i64
                %1655 = func.call @cc_nil_value() : () -> i64
                %1656 = arith.cmpi ne, %1654, %1655 : i64
                scf.yield %1656 : i1
              }
              %1657 = arith.andi %1638, %1648 : i1
              %1658 = func.call @cc_nil_value() : () -> i64
              %1659 = func.call @cc_t_value() : () -> i64
              %1660 = scf.if %1657 -> (i64) {
                scf.yield %1659 : i64
              } else {
                scf.yield %1658 : i64
              }
              func.call @stack_push_pointer(%1660) : (i64) -> ()
              %1661 = func.call @stack_pop_pointer() : () -> i64
              %1662 = func.call @cc_nil_value() : () -> i64
              %1663 = arith.cmpi ne, %1661, %1662 : i64
              %1664 = func.call @cc_nil_value() : () -> i64
              %1665 = llvm.mlir.addressof @str137 : !llvm.ptr
              %1666 = arith.constant 38 : i64
              %1667 = func.call @cc_make_string(%1665, %1666) : (!llvm.ptr, i64) -> i64
              %1668 = func.call @cc_nil_value() : () -> i64
              %1669 = func.call @cc_intern(%1667, %1668) : (i64, i64) -> i64
              %1670 = func.call @cc_nil_value() : () -> i64
              %1671 = func.call @cc_cons(%1669, %1670) : (i64, i64) -> i64
              %1672 = func.call @cc_values_pack(%1671) : (i64) -> i64
              %1673 = func.call @cc_symbol_value(%1669) : (i64) -> i64
              %1674 = arith.cmpi ne, %1673, %1664 : i64
              %1675 = llvm.mlir.addressof @str138 : !llvm.ptr
              %1676 = arith.constant 38 : i64
              %1677 = func.call @cc_make_string(%1675, %1676) : (!llvm.ptr, i64) -> i64
              %1678 = func.call @cc_nil_value() : () -> i64
              %1679 = func.call @cc_intern(%1677, %1678) : (i64, i64) -> i64
              %1680 = func.call @cc_nil_value() : () -> i64
              %1681 = func.call @cc_cons(%1679, %1680) : (i64, i64) -> i64
              %1682 = func.call @cc_values_pack(%1681) : (i64) -> i64
              %1683 = func.call @cc_symbol_value(%1679) : (i64) -> i64
              %1684 = arith.cmpi ne, %1683, %1664 : i64
              %1685 = arith.ori %1674, %1684 : i1
              %1686 = arith.constant 0 : i1
              %1687 = arith.cmpi eq, %1685, %1686 : i1
              %1688 = arith.andi %1663, %1687 : i1
              scf.condition(%1688) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
            } do {
              ^bb0(%1689: i64, %1690: i64, %1691: i64, %1692: i64):
              %1693 = func.call @cc_t_value() : () -> i64
              func.call @stack_push_pointer(%1693) : (i64) -> ()
              %1694 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1694) : (i64) -> ()
              %1695 = func.call @stack_depth() : () -> i64
              %1696 = arith.constant 0 : i64
              %1697 = arith.cmpi sgt, %1695, %1696 : i64
              scf.if %1697 {
                %1698 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1692) : (i64) -> ()
              %1699 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1699) : (i64) -> ()
              %1700 = func.call @stack_depth() : () -> i64
              %1701 = arith.constant 0 : i64
              %1702 = arith.cmpi sgt, %1700, %1701 : i64
              scf.if %1702 {
                %1703 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1691) : (i64) -> ()
              func.call @stack_push_pointer(%1145) : (i64) -> ()
              %1704 = func.call @stack_pop_pointer() : () -> i64
              %1705 = llvm.mlir.addressof @str139 : !llvm.ptr
              %1706 = arith.constant 3 : i64
              %1707 = func.call @cc_make_string(%1705, %1706) : (!llvm.ptr, i64) -> i64
              %1708 = llvm.mlir.addressof @str140 : !llvm.ptr
              %1709 = arith.constant 7 : i64
              %1710 = func.call @cc_make_string(%1708, %1709) : (!llvm.ptr, i64) -> i64
              %1711 = func.call @cc_intern(%1707, %1710) : (i64, i64) -> i64
              %1712 = func.call @cc_nil_value() : () -> i64
              %1713 = func.call @cc_cons(%1711, %1712) : (i64, i64) -> i64
              %1714 = func.call @cc_values_pack(%1713) : (i64) -> i64
              func.call @stack_push_pointer(%1711) : (i64) -> ()
              %1715 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1692) : (i64) -> ()
              %1716 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1098) : (i64) -> ()
              %1717 = func.call @stack_pop_pointer() : () -> i64
              %1719 = arith.constant 3 : i64
              %1718 = arith.andi %1716, %1719 : i64
              %1720 = arith.constant 0 : i64
              %1721 = arith.cmpi eq, %1718, %1720 : i64
              %1723 = arith.constant 3 : i64
              %1722 = arith.andi %1717, %1723 : i64
              %1724 = arith.constant 0 : i64
              %1725 = arith.cmpi eq, %1722, %1724 : i64
              %1726 = arith.andi %1721, %1725 : i1
              %1727 = scf.if %1726 -> (i64) {
                %1728 = arith.constant 2 : i64
                %1729 = arith.shrsi %1716, %1728 : i64
                %1730 = arith.constant 2 : i64
                %1731 = arith.shrsi %1717, %1730 : i64
                %1732 = arith.constant 0 : i64
                %1733 = arith.cmpi slt, %1729, %1732 : i64
                %1734 = scf.if %1733 -> (i64) {
                  %1735 = arith.subi %1732, %1729 : i64
                  scf.yield %1735 : i64
                } else {
                  scf.yield %1729 : i64
                }
                %1736 = arith.constant 0 : i64
                %1737 = arith.cmpi slt, %1731, %1736 : i64
                %1738 = scf.if %1737 -> (i64) {
                  %1739 = arith.subi %1736, %1731 : i64
                  scf.yield %1739 : i64
                } else {
                  scf.yield %1731 : i64
                }
                %1740 = arith.constant 1518500249 : i64
                %1741 = arith.cmpi sle, %1734, %1740 : i64
                %1742 = arith.cmpi sle, %1738, %1740 : i64
                %1743 = arith.andi %1741, %1742 : i1
                %1744 = scf.if %1743 -> (i64) {
                  %1745 = arith.muli %1729, %1731 : i64
                  %1746 = arith.constant 2 : i64
                  %1747 = arith.shli %1745, %1746 : i64
                  scf.yield %1747 : i64
                } else {
                  %1748 = func.call @cc_mul(%1716, %1717) : (i64, i64) -> i64
                  scf.yield %1748 : i64
                }
                scf.yield %1744 : i64
              } else {
                %1749 = func.call @cc_mul(%1716, %1717) : (i64, i64) -> i64
                scf.yield %1749 : i64
              }
              func.call @stack_push_pointer(%1727) : (i64) -> ()
              %1750 = func.call @stack_pop_pointer() : () -> i64
              %1751 = func.call @cc_nil_value() : () -> i64
              %1752 = func.call @cc_errorp(%1704) : (i64) -> i64
              %1753 = arith.cmpi ne, %1752, %1751 : i64
              %1754 = arith.cmpi eq, %1751, %1751 : i64
              %1755 = arith.andi %1753, %1754 : i1
              %1756 = scf.if %1755 -> (i64) {
                scf.yield %1704 : i64
              } else {
                scf.yield %1751 : i64
              }
              %1757 = func.call @cc_errorp(%1715) : (i64) -> i64
              %1758 = arith.cmpi ne, %1757, %1751 : i64
              %1759 = arith.cmpi eq, %1756, %1751 : i64
              %1760 = arith.andi %1758, %1759 : i1
              %1761 = scf.if %1760 -> (i64) {
                scf.yield %1715 : i64
              } else {
                scf.yield %1756 : i64
              }
              %1762 = func.call @cc_errorp(%1750) : (i64) -> i64
              %1763 = arith.cmpi ne, %1762, %1751 : i64
              %1764 = arith.cmpi eq, %1761, %1751 : i64
              %1765 = arith.andi %1763, %1764 : i1
              %1766 = scf.if %1765 -> (i64) {
                scf.yield %1750 : i64
              } else {
                scf.yield %1761 : i64
              }
              %1767 = arith.cmpi ne, %1766, %1751 : i64
              scf.if %1767 {
                func.call @stack_push_pointer(%1766) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1704) : (i64) -> ()
                func.call @stack_push_pointer(%1715) : (i64) -> ()
                func.call @stack_push_pointer(%1750) : (i64) -> ()
                %1768 = llvm.mlir.addressof @str141 : !llvm.ptr
                %1769 = func.call @cc_make_function_ref_const(%1768) : (!llvm.ptr) -> i64
                %1770 = arith.constant 3 : i64
                func.call @cc_funcall_stack(%1769, %1770) : (i64, i64) -> ()
              }
              %1771 = func.call @stack_pop_pointer() : () -> i64
              %1772 = func.call @cc_nil_value() : () -> i64
              %1773 = func.call @cc_errorp(%1771) : (i64) -> i64
              %1774 = arith.cmpi ne, %1773, %1772 : i64
              %1775 = arith.cmpi eq, %1772, %1772 : i64
              %1776 = arith.andi %1774, %1775 : i1
              %1777 = scf.if %1776 -> (i64) {
                scf.yield %1771 : i64
              } else {
                scf.yield %1772 : i64
              }
              %1778 = arith.cmpi ne, %1777, %1772 : i64
              scf.if %1778 {
                func.call @stack_push_pointer(%1777) : (i64) -> ()
              } else {
                %1779 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1779) : (i64) -> ()
                func.call @stack_push_pointer(%1771) : (i64) -> ()
                %1780 = func.call @stack_pop_pointer() : () -> i64
                %1781 = func.call @stack_pop_pointer() : () -> i64
                %1782 = func.call @cc_cons(%1780, %1781) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1782) : (i64) -> ()
              }
              %1783 = func.call @stack_pop_pointer() : () -> i64
              %1784 = func.call @stack_pop_pointer() : () -> i64
              %1785 = func.call @cc_append(%1784, %1783) : (i64, i64) -> i64
              func.call @stack_push_pointer(%1785) : (i64) -> ()
              %1786 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1786) : (i64) -> ()
              %1787 = func.call @stack_depth() : () -> i64
              %1788 = arith.constant 0 : i64
              %1789 = arith.cmpi sgt, %1787, %1788 : i64
              scf.if %1789 {
                %1790 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%1692) : (i64) -> ()
              %1791 = func.call @stack_pop_pointer() : () -> i64
              %1792 = arith.constant 1 : i64
              func.call @stack_push_fixnum(%1792) : (i64) -> ()
              %1793 = func.call @stack_pop_pointer() : () -> i64
              %1795 = arith.constant 3 : i64
              %1794 = arith.andi %1791, %1795 : i64
              %1796 = arith.constant 0 : i64
              %1797 = arith.cmpi eq, %1794, %1796 : i64
              %1799 = arith.constant 3 : i64
              %1798 = arith.andi %1793, %1799 : i64
              %1800 = arith.constant 0 : i64
              %1801 = arith.cmpi eq, %1798, %1800 : i64
              %1802 = arith.andi %1797, %1801 : i1
              %1803 = scf.if %1802 -> (i64) {
                %1804 = arith.constant 2 : i64
                %1805 = arith.shrsi %1791, %1804 : i64
                %1806 = arith.constant 2 : i64
                %1807 = arith.shrsi %1793, %1806 : i64
                %1808 = arith.addi %1805, %1807 : i64
                %1809 = arith.constant -2305843009213693952 : i64
                %1810 = arith.constant 2305843009213693951 : i64
                %1811 = arith.cmpi sge, %1808, %1809 : i64
                %1812 = arith.cmpi sle, %1808, %1810 : i64
                %1813 = arith.andi %1811, %1812 : i1
                %1814 = scf.if %1813 -> (i64) {
                  %1815 = arith.constant 2 : i64
                  %1816 = arith.shli %1808, %1815 : i64
                  scf.yield %1816 : i64
                } else {
                  %1817 = func.call @cc_add(%1791, %1793) : (i64, i64) -> i64
                  scf.yield %1817 : i64
                }
                scf.yield %1814 : i64
              } else {
                %1818 = func.call @cc_add(%1791, %1793) : (i64, i64) -> i64
                scf.yield %1818 : i64
              }
              func.call @stack_push_pointer(%1803) : (i64) -> ()
              %1819 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1819) : (i64) -> ()
              %1820 = func.call @stack_depth() : () -> i64
              %1821 = arith.constant 0 : i64
              %1822 = arith.cmpi sgt, %1820, %1821 : i64
              scf.if %1822 {
                %1823 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %1694, %1699, %1786, %1819 : i64, i64, i64, i64
            }
            func.call @stack_push_nil() : () -> ()
            %1824 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1634#0) : (i64) -> ()
            %1825 = func.call @stack_pop_pointer() : () -> i64
            %1826 = func.call @cc_nil_value() : () -> i64
            %1827 = arith.cmpi ne, %1825, %1826 : i64
            %1828:2 = scf.if %1827 -> (i64, i64) {
              %1829 = func.call @cc_nil_value() : () -> i64
              %1830 = func.call @cc_nil_value() : () -> i64
              %1831 = func.call @cc_errorp(%1829) : (i64) -> i64
              %1832 = arith.cmpi ne, %1831, %1830 : i64
              %1833:2 = scf.if %1832 -> (i64, i64) {
                scf.yield %1829, %1634#3 : i64, i64
              } else {
                func.call @stack_push_pointer(%1634#1) : (i64) -> ()
                %1834 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1834) : (i64) -> ()
                %1835 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %1835, %1834 : i64, i64
              }
              func.call @stack_push_pointer(%1833#0) : (i64) -> ()
              %1836 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1836, %1833#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %1837 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1837, %1634#3 : i64, i64
            }
            func.call @stack_push_pointer(%1828#0) : (i64) -> ()
            %1838 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1634#2) : (i64) -> ()
            %1839 = func.call @stack_pop_pointer() : () -> i64
            %1840 = func.call @cc_multiple_value_list(%1839) : (i64) -> i64
            %1841 = llvm.mlir.addressof @str142 : !llvm.ptr
            %1842 = arith.constant 38 : i64
            %1843 = func.call @cc_make_string(%1841, %1842) : (!llvm.ptr, i64) -> i64
            %1844 = func.call @cc_nil_value() : () -> i64
            %1845 = func.call @cc_intern(%1843, %1844) : (i64, i64) -> i64
            %1846 = func.call @cc_nil_value() : () -> i64
            %1847 = func.call @cc_cons(%1845, %1846) : (i64, i64) -> i64
            %1848 = func.call @cc_values_pack(%1847) : (i64) -> i64
            %1849 = func.call @cc_symbol_value(%1845) : (i64) -> i64
            %1850 = llvm.mlir.addressof @str143 : !llvm.ptr
            %1851 = arith.constant 39 : i64
            %1852 = func.call @cc_make_string(%1850, %1851) : (!llvm.ptr, i64) -> i64
            %1853 = func.call @cc_nil_value() : () -> i64
            %1854 = func.call @cc_intern(%1852, %1853) : (i64, i64) -> i64
            %1855 = func.call @cc_nil_value() : () -> i64
            %1856 = func.call @cc_cons(%1854, %1855) : (i64, i64) -> i64
            %1857 = func.call @cc_values_pack(%1856) : (i64) -> i64
            %1858 = func.call @cc_symbol_value(%1854) : (i64) -> i64
            %1859 = llvm.mlir.addressof @str144 : !llvm.ptr
            %1860 = arith.constant 40 : i64
            %1861 = func.call @cc_make_string(%1859, %1860) : (!llvm.ptr, i64) -> i64
            %1862 = func.call @cc_nil_value() : () -> i64
            %1863 = func.call @cc_intern(%1861, %1862) : (i64, i64) -> i64
            %1864 = func.call @cc_nil_value() : () -> i64
            %1865 = func.call @cc_cons(%1863, %1864) : (i64, i64) -> i64
            %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
            %1867 = func.call @cc_symbol_value(%1863) : (i64) -> i64
            %1868 = func.call @cc_nil_value() : () -> i64
            %1869 = arith.cmpi ne, %1849, %1868 : i64
            %1870 = scf.if %1869 -> (i64) {
              scf.yield %1867 : i64
            } else {
              scf.yield %1840 : i64
            }
            %1871 = func.call @cc_values_pack(%1870) : (i64) -> i64
            func.call @stack_push_pointer(%1871) : (i64) -> ()
            %1872 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1872 : i64
          }
          func.call @stack_push_pointer(%1605) : (i64) -> ()
          %1873 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1873 : i64
        }
        func.call @stack_push_pointer(%1595) : (i64) -> ()
        %1874 = func.call @stack_pop_pointer() : () -> i64
        %1875 = func.call @cc_multiple_value_list(%1874) : (i64) -> i64
        func.call @stack_push_pointer(%1145) : (i64) -> ()
        %1876 = func.call @stack_pop_pointer() : () -> i64
        %1877 = func.call @cc_nil_value() : () -> i64
        %1878 = func.call @cc_errorp(%1876) : (i64) -> i64
        %1879 = arith.cmpi ne, %1878, %1877 : i64
        %1880 = arith.cmpi eq, %1877, %1877 : i64
        %1881 = arith.andi %1879, %1880 : i1
        %1882 = scf.if %1881 -> (i64) {
          scf.yield %1876 : i64
        } else {
          scf.yield %1877 : i64
        }
        %1883 = arith.cmpi ne, %1882, %1877 : i64
        scf.if %1883 {
          func.call @stack_push_pointer(%1882) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1876) : (i64) -> ()
          %1884 = llvm.mlir.addressof @str145 : !llvm.ptr
          %1885 = func.call @cc_make_function_ref_const(%1884) : (!llvm.ptr) -> i64
          %1886 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1885, %1886) : (i64, i64) -> ()
        }
        %1887 = func.call @stack_depth() : () -> i64
        %1888 = arith.constant 0 : i64
        %1889 = arith.cmpi sgt, %1887, %1888 : i64
        scf.if %1889 {
          %1890 = func.call @stack_pop_pointer() : () -> i64
        }
        %1891 = func.call @cc_values_pack(%1875) : (i64) -> i64
        func.call @stack_push_pointer(%1891) : (i64) -> ()
        %1892 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1892 : i64
      }
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1893 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1893 : i64
    }
    func.call @stack_push_pointer(%1076) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1("base\0Anmemb\0Asize\0Afun-compar\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_201747314245632*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_201747314245632*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_201747314245632*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_201747314245633*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_201747314245633*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_201747314245633*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("qsort\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str9("POINTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("POINTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("VOID\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("clasp-ffi:%foreign-funcall\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_201747314245633*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETVALUE_201747314245633*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_201747314245633*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETFLAG_201747314245632*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETMVLIST_201747314245632*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str25("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETFLAG_201747314245634*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETVALUE_201747314245634*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETMVLIST_201747314245634*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str29("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("%FN%qsort\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str31("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str33("%FN%qsort\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str34("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str35("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str36("%FN%qsort\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str37("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str38("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str39("%FN%qsort\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str40("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str42("CFFI-DEFCALLBACK\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str43("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("%FOREIGN-TYPE-SIZE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str46("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str47("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str48("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str49("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("%FOREIGN-ALLOC\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str52("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str53("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str57("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str59("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str62("FROM\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str63("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str66("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str67("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("%MEM-SET\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str71("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str72("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str75("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str76("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str77("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str78("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str80("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("QSORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str82("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str85("%GET-CALLBACK\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str86("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str87("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str90("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str91("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str92("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str93("FROM\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("BELOW\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str95("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str96("%MEM-REF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str97("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str98("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str101("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str102("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str105("INTSIZE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str106("%FOREIGN-FREE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str107("CLASP-FFI\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str108("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str111("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str112("clasp-ffi:%foreign-type-size\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str113("clasp-ffi:%foreign-alloc\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str114("*__MLIR_BLOCK_RETFLAG_201747314245636*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str115("*__MLIR_BLOCK_RETVALUE_201747314245636*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str116("*__MLIR_BLOCK_RETMVLIST_201747314245636*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str117("*__MLIR_BLOCK_RETFLAG_201747314245634*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str118("*__MLIR_BLOCK_RETFLAG_201747314245636*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str119("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str120("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str121("*__MLIR_BLOCK_RETFLAG_201747314245636*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str122("*__MLIR_BLOCK_RETVALUE_201747314245636*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str123("*__MLIR_BLOCK_RETMVLIST_201747314245636*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str124("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str125("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str126("clasp-ffi:%mem-set\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str127("*__MLIR_BLOCK_RETFLAG_201747314245636*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str128("*__MLIR_BLOCK_RETVALUE_201747314245636*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str129("*__MLIR_BLOCK_RETMVLIST_201747314245636*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str130("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("clasp-ffi:%get-callback\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str133("%FN%qsort\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str134("*__MLIR_BLOCK_RETFLAG_201747314245637*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str135("*__MLIR_BLOCK_RETVALUE_201747314245637*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str136("*__MLIR_BLOCK_RETMVLIST_201747314245637*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str137("*__MLIR_BLOCK_RETFLAG_201747314245634*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str138("*__MLIR_BLOCK_RETFLAG_201747314245637*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str139("INT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("clasp-ffi:%mem-ref\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str142("*__MLIR_BLOCK_RETFLAG_201747314245637*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str143("*__MLIR_BLOCK_RETVALUE_201747314245637*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str144("*__MLIR_BLOCK_RETMVLIST_201747314245637*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str145("clasp-ffi:%foreign-free\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str146("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str148("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str149("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str151("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str152("*__MLIR_BLOCK_RETFLAG_201747314245634*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str153("*__MLIR_BLOCK_RETMVLIST_201747314245634*\00") : !llvm.array<41 x i8>
}
