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
  func.func @"%FN%function-to-show-up-in-backtrace"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 32 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 3 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @stack_pop_pointer() : () -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = llvm.mlir.addressof @str2 : !llvm.ptr
    %17 = arith.constant 37 : i64
    %18 = func.call @cc_make_string(%16, %17) : (!llvm.ptr, i64) -> i64
    %19 = func.call @cc_nil_value() : () -> i64
    %20 = func.call @cc_intern(%18, %19) : (i64, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_cons(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_values_pack(%22) : (i64) -> i64
    %24 = func.call @cc_set_symbol_value(%20, %15) : (i64, i64) -> i64
    %25 = llvm.mlir.addressof @str3 : !llvm.ptr
    %26 = arith.constant 38 : i64
    %27 = func.call @cc_make_string(%25, %26) : (!llvm.ptr, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_intern(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_cons(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_values_pack(%31) : (i64) -> i64
    %33 = func.call @cc_set_symbol_value(%29, %15) : (i64, i64) -> i64
    %34 = llvm.mlir.addressof @str4 : !llvm.ptr
    %35 = arith.constant 39 : i64
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
      %48 = llvm.mlir.addressof @str5 : !llvm.ptr
      %49 = arith.constant 32 : i64
      %50 = func.call @cc_make_string(%48, %49) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %51 = arith.addi %50, %__rlasp_stack_elide_zero_0 : i64
      scf.yield %51 : i64
    }
    %52 = func.call @cc_nil_value() : () -> i64
    %53 = func.call @cc_errorp(%47) : (i64) -> i64
    %54 = arith.cmpi ne, %53, %52 : i64
    %55 = scf.if %54 -> (i64) {
      scf.yield %47 : i64
    } else {
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %56 = arith.addi %14, %__rlasp_stack_elide_zero_1 : i64
      %57 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%56, %57) : (i64, i64) -> ()
      %58 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %58 : i64
    }
    %59 = func.call @cc_nil_value() : () -> i64
    %60 = func.call @cc_errorp(%55) : (i64) -> i64
    %61 = arith.cmpi ne, %60, %59 : i64
    %62 = scf.if %61 -> (i64) {
      scf.yield %55 : i64
    } else {
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %63 = arith.addi %13, %__rlasp_stack_elide_zero_2 : i64
      scf.yield %63 : i64
    }
    %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
    %64 = arith.addi %62, %__rlasp_stack_elide_zero_3 : i64
    %65 = func.call @cc_multiple_value_list(%64) : (i64) -> i64
    %66 = llvm.mlir.addressof @str6 : !llvm.ptr
    %67 = arith.constant 37 : i64
    %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
    %69 = func.call @cc_nil_value() : () -> i64
    %70 = func.call @cc_intern(%68, %69) : (i64, i64) -> i64
    %71 = func.call @cc_nil_value() : () -> i64
    %72 = func.call @cc_cons(%70, %71) : (i64, i64) -> i64
    %73 = func.call @cc_values_pack(%72) : (i64) -> i64
    %74 = func.call @cc_symbol_value(%70) : (i64) -> i64
    %75 = llvm.mlir.addressof @str7 : !llvm.ptr
    %76 = arith.constant 39 : i64
    %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
    %78 = func.call @cc_nil_value() : () -> i64
    %79 = func.call @cc_intern(%77, %78) : (i64, i64) -> i64
    %80 = func.call @cc_nil_value() : () -> i64
    %81 = func.call @cc_cons(%79, %80) : (i64, i64) -> i64
    %82 = func.call @cc_values_pack(%81) : (i64) -> i64
    %83 = func.call @cc_symbol_value(%79) : (i64) -> i64
    %84 = func.call @cc_nil_value() : () -> i64
    %85 = arith.cmpi ne, %74, %84 : i64
    %86 = scf.if %85 -> (i64) {
      scf.yield %83 : i64
    } else {
      scf.yield %65 : i64
    }
    %87 = func.call @cc_values_pack(%86) : (i64) -> i64
    func.call @stack_push_pointer(%87) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%nest-ftsuib"() {
    %88 = llvm.mlir.addressof @str8 : !llvm.ptr
    %89 = arith.constant 11 : i64
    %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
    %91 = func.call @cc_nil_value() : () -> i64
    %92 = func.call @cc_intern(%90, %91) : (i64, i64) -> i64
    %93 = func.call @cc_nil_value() : () -> i64
    %94 = func.call @cc_cons(%92, %93) : (i64, i64) -> i64
    %95 = func.call @cc_values_pack(%94) : (i64) -> i64
    %96 = llvm.mlir.addressof @str9 : !llvm.ptr
    %97 = arith.constant 3 : i64
    %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
    %99 = func.call @cc_register_function_lambda_list_metadata_raw(%92, %98) : (i64, i64) -> i64
    %100 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%92, %100) : (i64, i64) -> ()
    %101 = func.call @stack_pop_pointer() : () -> i64
    %102 = func.call @stack_pop_pointer() : () -> i64
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = llvm.mlir.addressof @str10 : !llvm.ptr
    %105 = arith.constant 37 : i64
    %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
    %107 = func.call @cc_nil_value() : () -> i64
    %108 = func.call @cc_intern(%106, %107) : (i64, i64) -> i64
    %109 = func.call @cc_nil_value() : () -> i64
    %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
    %111 = func.call @cc_values_pack(%110) : (i64) -> i64
    %112 = func.call @cc_set_symbol_value(%108, %103) : (i64, i64) -> i64
    %113 = llvm.mlir.addressof @str11 : !llvm.ptr
    %114 = arith.constant 38 : i64
    %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
    %116 = func.call @cc_nil_value() : () -> i64
    %117 = func.call @cc_intern(%115, %116) : (i64, i64) -> i64
    %118 = func.call @cc_nil_value() : () -> i64
    %119 = func.call @cc_cons(%117, %118) : (i64, i64) -> i64
    %120 = func.call @cc_values_pack(%119) : (i64) -> i64
    %121 = func.call @cc_set_symbol_value(%117, %103) : (i64, i64) -> i64
    %122 = llvm.mlir.addressof @str12 : !llvm.ptr
    %123 = arith.constant 39 : i64
    %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_intern(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_nil_value() : () -> i64
    %128 = func.call @cc_cons(%126, %127) : (i64, i64) -> i64
    %129 = func.call @cc_values_pack(%128) : (i64) -> i64
    %130 = func.call @cc_set_symbol_value(%126, %103) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
    %131 = arith.addi %101, %__rlasp_stack_elide_zero_4 : i64
    %132 = func.call @cc_unbox_fixnum(%131) : (i64) -> i64
    %133 = arith.constant 0 : i64
    %134 = arith.cmpi eq, %132, %133 : i64
    %135 = func.call @cc_t_value() : () -> i64
    %136 = func.call @cc_nil_value() : () -> i64
    %137 = arith.select %134, %135, %136 : i64
    %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
    %138 = arith.addi %137, %__rlasp_stack_elide_zero_5 : i64
    %139 = func.call @cc_nil_value() : () -> i64
    %140 = arith.cmpi ne, %138, %139 : i64
    scf.if %140 {
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %141 = arith.addi %102, %__rlasp_stack_elide_zero_6 : i64
      %142 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%141, %142) : (i64, i64) -> ()
    } else {
      %167 = llvm.mlir.addressof @str14 : !llvm.ptr
      %168 = arith.constant 29 : i64
      %169 = func.call @cc_make_symbol(%167, %168) : (!llvm.ptr, i64) -> i64
      %170 = func.call @cc_persistent_root_value(%169) : (i64) -> i64
      %171 = func.call @cc_set_symbol_value(%170, %102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%170) : (i64) -> ()
      %172 = arith.constant 97047688511490 : i64
      %173 = arith.constant 1 : i64
      %174 = func.call @cc_make_closure(%172, %173) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %175 = arith.addi %174, %__rlasp_stack_elide_zero_7 : i64
      %176 = arith.constant 1 : i64
      %177 = func.call @cc_box_fixnum(%176) : (i64) -> i64
      %179 = arith.constant 3 : i64
      %178 = arith.andi %101, %179 : i64
      %180 = arith.constant 0 : i64
      %181 = arith.cmpi eq, %178, %180 : i64
      %183 = arith.constant 3 : i64
      %182 = arith.andi %177, %183 : i64
      %184 = arith.constant 0 : i64
      %185 = arith.cmpi eq, %182, %184 : i64
      %186 = arith.andi %181, %185 : i1
      %187 = scf.if %186 -> (i64) {
        %188 = arith.constant 2 : i64
        %189 = arith.shrsi %101, %188 : i64
        %190 = arith.constant 2 : i64
        %191 = arith.shrsi %177, %190 : i64
        %192 = arith.subi %189, %191 : i64
        %193 = arith.constant -2305843009213693952 : i64
        %194 = arith.constant 2305843009213693951 : i64
        %195 = arith.cmpi sge, %192, %193 : i64
        %196 = arith.cmpi sle, %192, %194 : i64
        %197 = arith.andi %195, %196 : i1
        %198 = scf.if %197 -> (i64) {
          %199 = arith.constant 2 : i64
          %200 = arith.shli %192, %199 : i64
          scf.yield %200 : i64
        } else {
          %201 = func.call @cc_sub(%101, %177) : (i64, i64) -> i64
          scf.yield %201 : i64
        }
        scf.yield %198 : i64
      } else {
        %202 = func.call @cc_sub(%101, %177) : (i64, i64) -> i64
        scf.yield %202 : i64
      }
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %203 = arith.addi %187, %__rlasp_stack_elide_zero_8 : i64
      %204 = func.call @cc_nil_value() : () -> i64
      %205 = func.call @cc_errorp(%175) : (i64) -> i64
      %206 = arith.cmpi ne, %205, %204 : i64
      %207 = arith.cmpi eq, %204, %204 : i64
      %208 = arith.andi %206, %207 : i1
      %209 = scf.if %208 -> (i64) {
        scf.yield %175 : i64
      } else {
        scf.yield %204 : i64
      }
      %210 = func.call @cc_errorp(%203) : (i64) -> i64
      %211 = arith.cmpi ne, %210, %204 : i64
      %212 = arith.cmpi eq, %209, %204 : i64
      %213 = arith.andi %211, %212 : i1
      %214 = scf.if %213 -> (i64) {
        scf.yield %203 : i64
      } else {
        scf.yield %209 : i64
      }
      %215 = arith.cmpi ne, %214, %204 : i64
      scf.if %215 {
        func.call @stack_push_pointer(%214) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%175) : (i64) -> ()
        func.call @stack_push_pointer(%203) : (i64) -> ()
        %216 = llvm.mlir.addressof @str15 : !llvm.ptr
        %217 = func.call @cc_make_function_ref_const(%216) : (!llvm.ptr) -> i64
        %218 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%217, %218) : (i64, i64) -> ()
      }
    }
    %219 = func.call @stack_pop_pointer() : () -> i64
    %220 = func.call @cc_multiple_value_list(%219) : (i64) -> i64
    %221 = llvm.mlir.addressof @str16 : !llvm.ptr
    %222 = arith.constant 37 : i64
    %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
    %224 = func.call @cc_nil_value() : () -> i64
    %225 = func.call @cc_intern(%223, %224) : (i64, i64) -> i64
    %226 = func.call @cc_nil_value() : () -> i64
    %227 = func.call @cc_cons(%225, %226) : (i64, i64) -> i64
    %228 = func.call @cc_values_pack(%227) : (i64) -> i64
    %229 = func.call @cc_symbol_value(%225) : (i64) -> i64
    %230 = llvm.mlir.addressof @str17 : !llvm.ptr
    %231 = arith.constant 39 : i64
    %232 = func.call @cc_make_string(%230, %231) : (!llvm.ptr, i64) -> i64
    %233 = func.call @cc_nil_value() : () -> i64
    %234 = func.call @cc_intern(%232, %233) : (i64, i64) -> i64
    %235 = func.call @cc_nil_value() : () -> i64
    %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
    %237 = func.call @cc_values_pack(%236) : (i64) -> i64
    %238 = func.call @cc_symbol_value(%234) : (i64) -> i64
    %239 = func.call @cc_nil_value() : () -> i64
    %240 = arith.cmpi ne, %229, %239 : i64
    %241 = scf.if %240 -> (i64) {
      scf.yield %238 : i64
    } else {
      scf.yield %220 : i64
    }
    %242 = func.call @cc_values_pack(%241) : (i64) -> i64
    func.call @stack_push_pointer(%242) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %243 = llvm.mlir.addressof @str18 : !llvm.ptr
    %244 = arith.constant 6 : i64
    %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
    %246 = func.call @cc_nil_value() : () -> i64
    %247 = func.call @cc_intern(%245, %246) : (i64, i64) -> i64
    %248 = func.call @cc_nil_value() : () -> i64
    %249 = func.call @cc_cons(%247, %248) : (i64, i64) -> i64
    %250 = func.call @cc_values_pack(%249) : (i64) -> i64
    %251 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%247, %251) : (i64, i64) -> ()
    %252 = func.call @cc_nil_value() : () -> i64
    %253 = llvm.mlir.addressof @str19 : !llvm.ptr
    %254 = arith.constant 37 : i64
    %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
    %256 = func.call @cc_nil_value() : () -> i64
    %257 = func.call @cc_intern(%255, %256) : (i64, i64) -> i64
    %258 = func.call @cc_nil_value() : () -> i64
    %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
    %260 = func.call @cc_values_pack(%259) : (i64) -> i64
    %261 = func.call @cc_set_symbol_value(%257, %252) : (i64, i64) -> i64
    %262 = llvm.mlir.addressof @str20 : !llvm.ptr
    %263 = arith.constant 38 : i64
    %264 = func.call @cc_make_string(%262, %263) : (!llvm.ptr, i64) -> i64
    %265 = func.call @cc_nil_value() : () -> i64
    %266 = func.call @cc_intern(%264, %265) : (i64, i64) -> i64
    %267 = func.call @cc_nil_value() : () -> i64
    %268 = func.call @cc_cons(%266, %267) : (i64, i64) -> i64
    %269 = func.call @cc_values_pack(%268) : (i64) -> i64
    %270 = func.call @cc_set_symbol_value(%266, %252) : (i64, i64) -> i64
    %271 = llvm.mlir.addressof @str21 : !llvm.ptr
    %272 = arith.constant 39 : i64
    %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
    %274 = func.call @cc_nil_value() : () -> i64
    %275 = func.call @cc_intern(%273, %274) : (i64, i64) -> i64
    %276 = func.call @cc_nil_value() : () -> i64
    %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
    %278 = func.call @cc_values_pack(%277) : (i64) -> i64
    %279 = func.call @cc_set_symbol_value(%275, %252) : (i64, i64) -> i64
    %280 = func.call @cc_nil_value() : () -> i64
    %281 = func.call @cc_nil_value() : () -> i64
    %282 = func.call @cc_errorp(%280) : (i64) -> i64
    %283 = arith.cmpi ne, %282, %281 : i64
    %284 = scf.if %283 -> (i64) {
      scf.yield %280 : i64
    } else {
      %285 = llvm.mlir.addressof @str22 : !llvm.ptr
      %286 = arith.constant 11 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_intern(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_values_pack(%291) : (i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %293 = arith.addi %289, %__rlasp_stack_elide_zero_9 : i64
      %294 = func.call @cc_in_package(%293) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %295 = arith.addi %294, %__rlasp_stack_elide_zero_10 : i64
      scf.yield %295 : i64
    }
    %296 = func.call @cc_nil_value() : () -> i64
    %297 = func.call @cc_errorp(%284) : (i64) -> i64
    %298 = arith.cmpi ne, %297, %296 : i64
    %299 = scf.if %298 -> (i64) {
      scf.yield %284 : i64
    } else {
      %300 = llvm.mlir.addressof @str23 : !llvm.ptr
      %301 = arith.constant 11 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = func.call @cc_nil_value() : () -> i64
      %304 = func.call @cc_intern(%302, %303) : (i64, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_cons(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_values_pack(%306) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %308 = arith.addi %304, %__rlasp_stack_elide_zero_11 : i64
      %309 = llvm.mlir.addressof @str24 : !llvm.ptr
      %310 = arith.constant 6 : i64
      %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_intern(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_nil_value() : () -> i64
      %315 = func.call @cc_cons(%313, %314) : (i64, i64) -> i64
      %316 = func.call @cc_values_pack(%315) : (i64) -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      %317 = llvm.mlir.addressof @str25 : !llvm.ptr
      %318 = arith.constant 21 : i64
      %319 = func.call @cc_make_string(%317, %318) : (!llvm.ptr, i64) -> i64
      %320 = llvm.mlir.addressof @str26 : !llvm.ptr
      %321 = arith.constant 11 : i64
      %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
      %323 = func.call @cc_intern(%319, %322) : (i64, i64) -> i64
      %324 = func.call @cc_nil_value() : () -> i64
      %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
      %326 = func.call @cc_values_pack(%325) : (i64) -> i64
      func.call @stack_push_pointer(%323) : (i64) -> ()
      %327 = llvm.mlir.addressof @str27 : !llvm.ptr
      %328 = arith.constant 1 : i64
      %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_intern(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_nil_value() : () -> i64
      %333 = func.call @cc_cons(%331, %332) : (i64, i64) -> i64
      %334 = func.call @cc_values_pack(%333) : (i64) -> i64
      func.call @stack_push_pointer(%331) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %335 = func.call @stack_pop_pointer() : () -> i64
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @cc_cons(%336, %335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%337) : (i64) -> ()
      %338 = llvm.mlir.addressof @str28 : !llvm.ptr
      %339 = arith.constant 15 : i64
      %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
      %341 = llvm.mlir.addressof @str29 : !llvm.ptr
      %342 = arith.constant 11 : i64
      %343 = func.call @cc_make_string(%341, %342) : (!llvm.ptr, i64) -> i64
      %344 = func.call @cc_intern(%340, %343) : (i64, i64) -> i64
      %345 = func.call @cc_nil_value() : () -> i64
      %346 = func.call @cc_cons(%344, %345) : (i64, i64) -> i64
      %347 = func.call @cc_values_pack(%346) : (i64) -> i64
      func.call @stack_push_pointer(%344) : (i64) -> ()
      %348 = llvm.mlir.addressof @str30 : !llvm.ptr
      %349 = arith.constant 6 : i64
      %350 = func.call @cc_make_string(%348, %349) : (!llvm.ptr, i64) -> i64
      %351 = llvm.mlir.addressof @str31 : !llvm.ptr
      %352 = arith.constant 7 : i64
      %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
      %354 = func.call @cc_intern(%350, %353) : (i64, i64) -> i64
      %355 = func.call @cc_nil_value() : () -> i64
      %356 = func.call @cc_cons(%354, %355) : (i64, i64) -> i64
      %357 = func.call @cc_values_pack(%356) : (i64) -> i64
      func.call @stack_push_pointer(%354) : (i64) -> ()
      %358 = llvm.mlir.addressof @str32 : !llvm.ptr
      %359 = arith.constant 1 : i64
      %360 = func.call @cc_make_string(%358, %359) : (!llvm.ptr, i64) -> i64
      %361 = func.call @cc_nil_value() : () -> i64
      %362 = func.call @cc_intern(%360, %361) : (i64, i64) -> i64
      %363 = func.call @cc_nil_value() : () -> i64
      %364 = func.call @cc_cons(%362, %363) : (i64, i64) -> i64
      %365 = func.call @cc_values_pack(%364) : (i64) -> i64
      func.call @stack_push_pointer(%362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @stack_pop_pointer() : () -> i64
      %368 = func.call @cc_cons(%367, %366) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %369 = arith.addi %368, %__rlasp_stack_elide_zero_12 : i64
      %370 = func.call @stack_pop_pointer() : () -> i64
      %371 = func.call @cc_cons(%370, %369) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %372 = arith.addi %371, %__rlasp_stack_elide_zero_13 : i64
      %373 = func.call @stack_pop_pointer() : () -> i64
      %374 = func.call @cc_cons(%373, %372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%374) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %375 = func.call @stack_pop_pointer() : () -> i64
      %376 = func.call @stack_pop_pointer() : () -> i64
      %377 = func.call @cc_cons(%376, %375) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %378 = arith.addi %377, %__rlasp_stack_elide_zero_14 : i64
      %379 = func.call @stack_pop_pointer() : () -> i64
      %380 = func.call @cc_cons(%379, %378) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %381 = arith.addi %380, %__rlasp_stack_elide_zero_15 : i64
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @cc_cons(%382, %381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%383) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %384 = func.call @stack_pop_pointer() : () -> i64
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @cc_cons(%385, %384) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %387 = arith.addi %386, %__rlasp_stack_elide_zero_16 : i64
      %388 = func.call @stack_pop_pointer() : () -> i64
      %389 = func.call @cc_cons(%388, %387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %390 = arith.addi %389, %__rlasp_stack_elide_zero_17 : i64
      %434 = arith.constant 97047688511493 : i64
      %435 = arith.constant 0 : i64
      %436 = func.call @cc_make_closure(%434, %435) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %437 = arith.addi %436, %__rlasp_stack_elide_zero_18 : i64
      %438 = llvm.mlir.addressof @str36 : !llvm.ptr
      %439 = arith.constant 6 : i64
      %440 = func.call @cc_make_string(%438, %439) : (!llvm.ptr, i64) -> i64
      %441 = llvm.mlir.addressof @str37 : !llvm.ptr
      %442 = arith.constant 11 : i64
      %443 = func.call @cc_make_string(%441, %442) : (!llvm.ptr, i64) -> i64
      %444 = func.call @cc_intern(%440, %443) : (i64, i64) -> i64
      %445 = func.call @cc_nil_value() : () -> i64
      %446 = func.call @cc_cons(%444, %445) : (i64, i64) -> i64
      %447 = func.call @cc_values_pack(%446) : (i64) -> i64
      func.call @stack_push_pointer(%444) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %448 = func.call @stack_pop_pointer() : () -> i64
      %449 = func.call @stack_pop_pointer() : () -> i64
      %450 = func.call @cc_cons(%449, %448) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %451 = arith.addi %450, %__rlasp_stack_elide_zero_19 : i64
      %452 = llvm.mlir.addressof @str38 : !llvm.ptr
      %453 = arith.constant 11 : i64
      %454 = func.call @cc_make_string(%452, %453) : (!llvm.ptr, i64) -> i64
      %455 = llvm.mlir.addressof @str39 : !llvm.ptr
      %456 = arith.constant 7 : i64
      %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
      %458 = func.call @cc_intern(%454, %457) : (i64, i64) -> i64
      %459 = func.call @cc_nil_value() : () -> i64
      %460 = func.call @cc_cons(%458, %459) : (i64, i64) -> i64
      %461 = func.call @cc_values_pack(%460) : (i64) -> i64
      %462 = func.call @cc_nil_value() : () -> i64
      %463 = llvm.mlir.addressof @str40 : !llvm.ptr
      %464 = arith.constant 4 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = llvm.mlir.addressof @str41 : !llvm.ptr
      %467 = arith.constant 7 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_intern(%465, %468) : (i64, i64) -> i64
      %470 = func.call @cc_nil_value() : () -> i64
      %471 = func.call @cc_cons(%469, %470) : (i64, i64) -> i64
      %472 = func.call @cc_values_pack(%471) : (i64) -> i64
      %473 = llvm.mlir.addressof @str42 : !llvm.ptr
      %474 = arith.constant 5 : i64
      %475 = func.call @cc_make_string(%473, %474) : (!llvm.ptr, i64) -> i64
      %476 = func.call @cc_nil_value() : () -> i64
      %477 = func.call @cc_intern(%475, %476) : (i64, i64) -> i64
      %478 = func.call @cc_nil_value() : () -> i64
      %479 = func.call @cc_cons(%477, %478) : (i64, i64) -> i64
      %480 = func.call @cc_values_pack(%479) : (i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %481 = arith.addi %477, %__rlasp_stack_elide_zero_20 : i64
      %482 = func.call @cc_nil_value() : () -> i64
      %483 = func.call @cc_errorp(%308) : (i64) -> i64
      %484 = arith.cmpi ne, %483, %482 : i64
      %485 = arith.cmpi eq, %482, %482 : i64
      %486 = arith.andi %484, %485 : i1
      %487 = scf.if %486 -> (i64) {
        scf.yield %308 : i64
      } else {
        scf.yield %482 : i64
      }
      %488 = func.call @cc_errorp(%390) : (i64) -> i64
      %489 = arith.cmpi ne, %488, %482 : i64
      %490 = arith.cmpi eq, %487, %482 : i64
      %491 = arith.andi %489, %490 : i1
      %492 = scf.if %491 -> (i64) {
        scf.yield %390 : i64
      } else {
        scf.yield %487 : i64
      }
      %493 = func.call @cc_errorp(%437) : (i64) -> i64
      %494 = arith.cmpi ne, %493, %482 : i64
      %495 = arith.cmpi eq, %492, %482 : i64
      %496 = arith.andi %494, %495 : i1
      %497 = scf.if %496 -> (i64) {
        scf.yield %437 : i64
      } else {
        scf.yield %492 : i64
      }
      %498 = func.call @cc_errorp(%451) : (i64) -> i64
      %499 = arith.cmpi ne, %498, %482 : i64
      %500 = arith.cmpi eq, %497, %482 : i64
      %501 = arith.andi %499, %500 : i1
      %502 = scf.if %501 -> (i64) {
        scf.yield %451 : i64
      } else {
        scf.yield %497 : i64
      }
      %503 = func.call @cc_errorp(%458) : (i64) -> i64
      %504 = arith.cmpi ne, %503, %482 : i64
      %505 = arith.cmpi eq, %502, %482 : i64
      %506 = arith.andi %504, %505 : i1
      %507 = scf.if %506 -> (i64) {
        scf.yield %458 : i64
      } else {
        scf.yield %502 : i64
      }
      %508 = func.call @cc_errorp(%462) : (i64) -> i64
      %509 = arith.cmpi ne, %508, %482 : i64
      %510 = arith.cmpi eq, %507, %482 : i64
      %511 = arith.andi %509, %510 : i1
      %512 = scf.if %511 -> (i64) {
        scf.yield %462 : i64
      } else {
        scf.yield %507 : i64
      }
      %513 = func.call @cc_errorp(%469) : (i64) -> i64
      %514 = arith.cmpi ne, %513, %482 : i64
      %515 = arith.cmpi eq, %512, %482 : i64
      %516 = arith.andi %514, %515 : i1
      %517 = scf.if %516 -> (i64) {
        scf.yield %469 : i64
      } else {
        scf.yield %512 : i64
      }
      %518 = func.call @cc_errorp(%481) : (i64) -> i64
      %519 = arith.cmpi ne, %518, %482 : i64
      %520 = arith.cmpi eq, %517, %482 : i64
      %521 = arith.andi %519, %520 : i1
      %522 = scf.if %521 -> (i64) {
        scf.yield %481 : i64
      } else {
        scf.yield %517 : i64
      }
      %523 = arith.cmpi ne, %522, %482 : i64
      scf.if %523 {
        func.call @stack_push_pointer(%522) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%308) : (i64) -> ()
        func.call @stack_push_pointer(%390) : (i64) -> ()
        func.call @stack_push_pointer(%437) : (i64) -> ()
        func.call @stack_push_pointer(%451) : (i64) -> ()
        func.call @stack_push_pointer(%458) : (i64) -> ()
        func.call @stack_push_pointer(%462) : (i64) -> ()
        func.call @stack_push_pointer(%469) : (i64) -> ()
        func.call @stack_push_pointer(%481) : (i64) -> ()
        %524 = llvm.mlir.addressof @str43 : !llvm.ptr
        %525 = func.call @cc_make_function_ref_const(%524) : (!llvm.ptr) -> i64
        %526 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%525, %526) : (i64, i64) -> ()
      }
      %527 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %527 : i64
    }
    %528 = func.call @cc_nil_value() : () -> i64
    %529 = func.call @cc_errorp(%299) : (i64) -> i64
    %530 = arith.cmpi ne, %529, %528 : i64
    %531 = scf.if %530 -> (i64) {
      scf.yield %299 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %532 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %532 : i64
    }
    %533 = func.call @cc_nil_value() : () -> i64
    %534 = func.call @cc_errorp(%531) : (i64) -> i64
    %535 = arith.cmpi ne, %534, %533 : i64
    %536 = scf.if %535 -> (i64) {
      scf.yield %531 : i64
    } else {
      %537 = llvm.mlir.addressof @str44 : !llvm.ptr
      %538 = arith.constant 11 : i64
      %539 = func.call @cc_make_string(%537, %538) : (!llvm.ptr, i64) -> i64
      %540 = func.call @cc_nil_value() : () -> i64
      %541 = func.call @cc_intern(%539, %540) : (i64, i64) -> i64
      %542 = func.call @cc_nil_value() : () -> i64
      %543 = func.call @cc_cons(%541, %542) : (i64, i64) -> i64
      %544 = func.call @cc_values_pack(%543) : (i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %545 = arith.addi %541, %__rlasp_stack_elide_zero_21 : i64
      %546 = llvm.mlir.addressof @str45 : !llvm.ptr
      %547 = arith.constant 3 : i64
      %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_intern(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_cons(%550, %551) : (i64, i64) -> i64
      %553 = func.call @cc_values_pack(%552) : (i64) -> i64
      func.call @stack_push_pointer(%550) : (i64) -> ()
      %554 = llvm.mlir.addressof @str46 : !llvm.ptr
      %555 = arith.constant 3 : i64
      %556 = func.call @cc_make_string(%554, %555) : (!llvm.ptr, i64) -> i64
      %557 = func.call @cc_nil_value() : () -> i64
      %558 = func.call @cc_intern(%556, %557) : (i64, i64) -> i64
      %559 = func.call @cc_nil_value() : () -> i64
      %560 = func.call @cc_cons(%558, %559) : (i64, i64) -> i64
      %561 = func.call @cc_values_pack(%560) : (i64) -> i64
      func.call @stack_push_pointer(%558) : (i64) -> ()
      %562 = llvm.mlir.addressof @str47 : !llvm.ptr
      %563 = arith.constant 5 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      %565 = func.call @cc_nil_value() : () -> i64
      %566 = func.call @cc_intern(%564, %565) : (i64, i64) -> i64
      %567 = func.call @cc_nil_value() : () -> i64
      %568 = func.call @cc_cons(%566, %567) : (i64, i64) -> i64
      %569 = func.call @cc_values_pack(%568) : (i64) -> i64
      func.call @stack_push_pointer(%566) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %570 = llvm.mlir.addressof @str48 : !llvm.ptr
      %571 = arith.constant 32 : i64
      %572 = func.call @cc_make_string(%570, %571) : (!llvm.ptr, i64) -> i64
      %573 = func.call @cc_nil_value() : () -> i64
      %574 = func.call @cc_intern(%572, %573) : (i64, i64) -> i64
      %575 = func.call @cc_nil_value() : () -> i64
      %576 = func.call @cc_cons(%574, %575) : (i64, i64) -> i64
      %577 = func.call @cc_values_pack(%576) : (i64) -> i64
      func.call @stack_push_pointer(%574) : (i64) -> ()
      %578 = llvm.mlir.addressof @str49 : !llvm.ptr
      %579 = arith.constant 6 : i64
      %580 = func.call @cc_make_string(%578, %579) : (!llvm.ptr, i64) -> i64
      %581 = func.call @cc_nil_value() : () -> i64
      %582 = func.call @cc_intern(%580, %581) : (i64, i64) -> i64
      %583 = func.call @cc_nil_value() : () -> i64
      %584 = func.call @cc_cons(%582, %583) : (i64, i64) -> i64
      %585 = func.call @cc_values_pack(%584) : (i64) -> i64
      func.call @stack_push_pointer(%582) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %586 = llvm.mlir.addressof @str50 : !llvm.ptr
      %587 = arith.constant 10 : i64
      %588 = func.call @cc_make_string(%586, %587) : (!llvm.ptr, i64) -> i64
      %589 = llvm.mlir.addressof @str51 : !llvm.ptr
      %590 = arith.constant 11 : i64
      %591 = func.call @cc_make_string(%589, %590) : (!llvm.ptr, i64) -> i64
      %592 = func.call @cc_intern(%588, %591) : (i64, i64) -> i64
      %593 = func.call @cc_nil_value() : () -> i64
      %594 = func.call @cc_cons(%592, %593) : (i64, i64) -> i64
      %595 = func.call @cc_values_pack(%594) : (i64) -> i64
      func.call @stack_push_pointer(%592) : (i64) -> ()
      %596 = llvm.mlir.addressof @str52 : !llvm.ptr
      %597 = arith.constant 5 : i64
      %598 = func.call @cc_make_string(%596, %597) : (!llvm.ptr, i64) -> i64
      %599 = func.call @cc_nil_value() : () -> i64
      %600 = func.call @cc_intern(%598, %599) : (i64, i64) -> i64
      %601 = func.call @cc_nil_value() : () -> i64
      %602 = func.call @cc_cons(%600, %601) : (i64, i64) -> i64
      %603 = func.call @cc_values_pack(%602) : (i64) -> i64
      func.call @stack_push_pointer(%600) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @stack_pop_pointer() : () -> i64
      %606 = func.call @cc_cons(%605, %604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%606) : (i64) -> ()
      %607 = llvm.mlir.addressof @str53 : !llvm.ptr
      %608 = arith.constant 9 : i64
      %609 = func.call @cc_make_string(%607, %608) : (!llvm.ptr, i64) -> i64
      %610 = llvm.mlir.addressof @str54 : !llvm.ptr
      %611 = arith.constant 11 : i64
      %612 = func.call @cc_make_string(%610, %611) : (!llvm.ptr, i64) -> i64
      %613 = func.call @cc_intern(%609, %612) : (i64, i64) -> i64
      %614 = func.call @cc_nil_value() : () -> i64
      %615 = func.call @cc_cons(%613, %614) : (i64, i64) -> i64
      %616 = func.call @cc_values_pack(%615) : (i64) -> i64
      func.call @stack_push_pointer(%613) : (i64) -> ()
      %617 = llvm.mlir.addressof @str55 : !llvm.ptr
      %618 = arith.constant 6 : i64
      %619 = func.call @cc_make_string(%617, %618) : (!llvm.ptr, i64) -> i64
      %620 = func.call @cc_nil_value() : () -> i64
      %621 = func.call @cc_intern(%619, %620) : (i64, i64) -> i64
      %622 = func.call @cc_nil_value() : () -> i64
      %623 = func.call @cc_cons(%621, %622) : (i64, i64) -> i64
      %624 = func.call @cc_values_pack(%623) : (i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      %625 = llvm.mlir.addressof @str56 : !llvm.ptr
      %626 = arith.constant 5 : i64
      %627 = func.call @cc_make_string(%625, %626) : (!llvm.ptr, i64) -> i64
      %628 = func.call @cc_nil_value() : () -> i64
      %629 = func.call @cc_intern(%627, %628) : (i64, i64) -> i64
      %630 = func.call @cc_nil_value() : () -> i64
      %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
      %632 = func.call @cc_values_pack(%631) : (i64) -> i64
      func.call @stack_push_pointer(%629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %633 = func.call @stack_pop_pointer() : () -> i64
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @cc_cons(%634, %633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%635) : (i64) -> ()
      %636 = llvm.mlir.addressof @str57 : !llvm.ptr
      %637 = arith.constant 2 : i64
      %638 = func.call @cc_make_string(%636, %637) : (!llvm.ptr, i64) -> i64
      %639 = func.call @cc_nil_value() : () -> i64
      %640 = func.call @cc_intern(%638, %639) : (i64, i64) -> i64
      %641 = func.call @cc_nil_value() : () -> i64
      %642 = func.call @cc_cons(%640, %641) : (i64, i64) -> i64
      %643 = func.call @cc_values_pack(%642) : (i64) -> i64
      func.call @stack_push_pointer(%640) : (i64) -> ()
      %644 = llvm.mlir.addressof @str58 : !llvm.ptr
      %645 = arith.constant 2 : i64
      %646 = func.call @cc_make_string(%644, %645) : (!llvm.ptr, i64) -> i64
      %647 = llvm.mlir.addressof @str59 : !llvm.ptr
      %648 = arith.constant 11 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = func.call @cc_intern(%646, %649) : (i64, i64) -> i64
      %651 = func.call @cc_nil_value() : () -> i64
      %652 = func.call @cc_cons(%650, %651) : (i64, i64) -> i64
      %653 = func.call @cc_values_pack(%652) : (i64) -> i64
      func.call @stack_push_pointer(%650) : (i64) -> ()
      %654 = llvm.mlir.addressof @str60 : !llvm.ptr
      %655 = arith.constant 19 : i64
      %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
      %657 = llvm.mlir.addressof @str61 : !llvm.ptr
      %658 = arith.constant 11 : i64
      %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
      %660 = func.call @cc_intern(%656, %659) : (i64, i64) -> i64
      %661 = func.call @cc_nil_value() : () -> i64
      %662 = func.call @cc_cons(%660, %661) : (i64, i64) -> i64
      %663 = func.call @cc_values_pack(%662) : (i64) -> i64
      func.call @stack_push_pointer(%660) : (i64) -> ()
      %664 = llvm.mlir.addressof @str62 : !llvm.ptr
      %665 = arith.constant 5 : i64
      %666 = func.call @cc_make_string(%664, %665) : (!llvm.ptr, i64) -> i64
      %667 = func.call @cc_nil_value() : () -> i64
      %668 = func.call @cc_intern(%666, %667) : (i64, i64) -> i64
      %669 = func.call @cc_nil_value() : () -> i64
      %670 = func.call @cc_cons(%668, %669) : (i64, i64) -> i64
      %671 = func.call @cc_values_pack(%670) : (i64) -> i64
      func.call @stack_push_pointer(%668) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %672 = func.call @stack_pop_pointer() : () -> i64
      %673 = func.call @stack_pop_pointer() : () -> i64
      %674 = func.call @cc_cons(%673, %672) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %675 = arith.addi %674, %__rlasp_stack_elide_zero_22 : i64
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @cc_cons(%676, %675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%677) : (i64) -> ()
      %678 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%678) : (i64) -> ()
      %679 = llvm.mlir.addressof @str63 : !llvm.ptr
      %680 = arith.constant 32 : i64
      %681 = func.call @cc_make_string(%679, %680) : (!llvm.ptr, i64) -> i64
      %682 = func.call @cc_nil_value() : () -> i64
      %683 = func.call @cc_intern(%681, %682) : (i64, i64) -> i64
      %684 = func.call @cc_nil_value() : () -> i64
      %685 = func.call @cc_cons(%683, %684) : (i64, i64) -> i64
      %686 = func.call @cc_values_pack(%685) : (i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %687 = arith.addi %683, %__rlasp_stack_elide_zero_23 : i64
      %688 = func.call @stack_pop_pointer() : () -> i64
      %689 = func.call @cc_cons(%687, %688) : (i64, i64) -> i64
      %690 = llvm.mlir.addressof @str64 : !llvm.ptr
      %691 = arith.constant 5 : i64
      %692 = func.call @cc_make_string(%690, %691) : (!llvm.ptr, i64) -> i64
      %693 = func.call @cc_nil_value() : () -> i64
      %694 = func.call @cc_intern(%692, %693) : (i64, i64) -> i64
      %695 = func.call @cc_nil_value() : () -> i64
      %696 = func.call @cc_cons(%694, %695) : (i64, i64) -> i64
      %697 = func.call @cc_values_pack(%696) : (i64) -> i64
      %698 = func.call @cc_cons(%694, %689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%698) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %699 = func.call @stack_pop_pointer() : () -> i64
      %700 = func.call @stack_pop_pointer() : () -> i64
      %701 = func.call @cc_cons(%700, %699) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %702 = arith.addi %701, %__rlasp_stack_elide_zero_24 : i64
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = func.call @cc_cons(%703, %702) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %705 = arith.addi %704, %__rlasp_stack_elide_zero_25 : i64
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @cc_cons(%706, %705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %708 = llvm.mlir.addressof @str65 : !llvm.ptr
      %709 = arith.constant 5 : i64
      %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
      %711 = func.call @cc_nil_value() : () -> i64
      %712 = func.call @cc_intern(%710, %711) : (i64, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_values_pack(%714) : (i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %716 = llvm.mlir.addressof @str66 : !llvm.ptr
      %717 = arith.constant 11 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = func.call @cc_nil_value() : () -> i64
      %720 = func.call @cc_intern(%718, %719) : (i64, i64) -> i64
      %721 = func.call @cc_nil_value() : () -> i64
      %722 = func.call @cc_cons(%720, %721) : (i64, i64) -> i64
      %723 = func.call @cc_values_pack(%722) : (i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %724 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%724) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @cc_cons(%726, %725) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %728 = arith.addi %727, %__rlasp_stack_elide_zero_26 : i64
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @cc_cons(%729, %728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %731 = arith.addi %730, %__rlasp_stack_elide_zero_27 : i64
      %732 = func.call @stack_pop_pointer() : () -> i64
      %733 = func.call @cc_cons(%732, %731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %734 = func.call @stack_pop_pointer() : () -> i64
      %735 = func.call @stack_pop_pointer() : () -> i64
      %736 = func.call @cc_cons(%735, %734) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %737 = arith.addi %736, %__rlasp_stack_elide_zero_28 : i64
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = func.call @cc_cons(%738, %737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @cc_cons(%741, %740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %743 = arith.addi %742, %__rlasp_stack_elide_zero_29 : i64
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = func.call @cc_cons(%744, %743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %746 = arith.addi %745, %__rlasp_stack_elide_zero_30 : i64
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @cc_cons(%747, %746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %749 = arith.addi %748, %__rlasp_stack_elide_zero_31 : i64
      %750 = func.call @stack_pop_pointer() : () -> i64
      %751 = func.call @cc_cons(%750, %749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @cc_cons(%753, %752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %755 = arith.addi %754, %__rlasp_stack_elide_zero_32 : i64
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @cc_cons(%756, %755) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %758 = arith.addi %757, %__rlasp_stack_elide_zero_33 : i64
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @cc_cons(%759, %758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%760) : (i64) -> ()
      %761 = llvm.mlir.addressof @str67 : !llvm.ptr
      %762 = arith.constant 5 : i64
      %763 = func.call @cc_make_string(%761, %762) : (!llvm.ptr, i64) -> i64
      %764 = func.call @cc_nil_value() : () -> i64
      %765 = func.call @cc_intern(%763, %764) : (i64, i64) -> i64
      %766 = func.call @cc_nil_value() : () -> i64
      %767 = func.call @cc_cons(%765, %766) : (i64, i64) -> i64
      %768 = func.call @cc_values_pack(%767) : (i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @cc_cons(%770, %769) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %772 = arith.addi %771, %__rlasp_stack_elide_zero_34 : i64
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @cc_cons(%773, %772) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %775 = arith.addi %774, %__rlasp_stack_elide_zero_35 : i64
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @cc_cons(%776, %775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @cc_cons(%779, %778) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %781 = arith.addi %780, %__rlasp_stack_elide_zero_36 : i64
      %782 = func.call @stack_pop_pointer() : () -> i64
      %783 = func.call @cc_cons(%782, %781) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %784 = arith.addi %783, %__rlasp_stack_elide_zero_37 : i64
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = func.call @cc_cons(%785, %784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @cc_cons(%788, %787) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %790 = arith.addi %789, %__rlasp_stack_elide_zero_38 : i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %793 = arith.addi %792, %__rlasp_stack_elide_zero_39 : i64
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @cc_cons(%794, %793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = func.call @stack_pop_pointer() : () -> i64
      %798 = func.call @cc_cons(%797, %796) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %799 = arith.addi %798, %__rlasp_stack_elide_zero_40 : i64
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @cc_cons(%800, %799) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %802 = arith.addi %801, %__rlasp_stack_elide_zero_41 : i64
      %803 = func.call @stack_pop_pointer() : () -> i64
      %804 = func.call @cc_cons(%803, %802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%804) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %805 = func.call @stack_pop_pointer() : () -> i64
      %806 = func.call @stack_pop_pointer() : () -> i64
      %807 = func.call @cc_cons(%806, %805) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %808 = arith.addi %807, %__rlasp_stack_elide_zero_42 : i64
      %809 = func.call @stack_pop_pointer() : () -> i64
      %810 = func.call @cc_cons(%809, %808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %811 = arith.addi %810, %__rlasp_stack_elide_zero_43 : i64
      %812 = func.call @stack_pop_pointer() : () -> i64
      %813 = func.call @cc_cons(%812, %811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = func.call @cc_cons(%815, %814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %817 = arith.addi %816, %__rlasp_stack_elide_zero_44 : i64
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @cc_cons(%818, %817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %820 = func.call @stack_pop_pointer() : () -> i64
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_cons(%821, %820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %823 = arith.addi %822, %__rlasp_stack_elide_zero_45 : i64
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @cc_cons(%824, %823) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %826 = arith.addi %825, %__rlasp_stack_elide_zero_46 : i64
      %1025 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1026 = arith.constant 33 : i64
      %1027 = func.call @cc_make_symbol(%1025, %1026) : (!llvm.ptr, i64) -> i64
      %1028 = func.call @cc_persistent_root_value(%1027) : (i64) -> i64
      func.call @stack_push_pointer(%1028) : (i64) -> ()
      %1029 = arith.constant 97047688511494 : i64
      %1030 = arith.constant 1 : i64
      %1031 = func.call @cc_make_closure(%1029, %1030) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1032 = arith.addi %1031, %__rlasp_stack_elide_zero_47 : i64
      %1033 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1034 = arith.constant 1 : i64
      %1035 = func.call @cc_make_string(%1033, %1034) : (!llvm.ptr, i64) -> i64
      %1036 = func.call @cc_nil_value() : () -> i64
      %1037 = func.call @cc_intern(%1035, %1036) : (i64, i64) -> i64
      %1038 = func.call @cc_nil_value() : () -> i64
      %1039 = func.call @cc_cons(%1037, %1038) : (i64, i64) -> i64
      %1040 = func.call @cc_values_pack(%1039) : (i64) -> i64
      func.call @stack_push_pointer(%1037) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1041 = func.call @stack_pop_pointer() : () -> i64
      %1042 = func.call @stack_pop_pointer() : () -> i64
      %1043 = func.call @cc_cons(%1042, %1041) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1044 = arith.addi %1043, %__rlasp_stack_elide_zero_48 : i64
      %1045 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1046 = arith.constant 11 : i64
      %1047 = func.call @cc_make_string(%1045, %1046) : (!llvm.ptr, i64) -> i64
      %1048 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1049 = arith.constant 7 : i64
      %1050 = func.call @cc_make_string(%1048, %1049) : (!llvm.ptr, i64) -> i64
      %1051 = func.call @cc_intern(%1047, %1050) : (i64, i64) -> i64
      %1052 = func.call @cc_nil_value() : () -> i64
      %1053 = func.call @cc_cons(%1051, %1052) : (i64, i64) -> i64
      %1054 = func.call @cc_values_pack(%1053) : (i64) -> i64
      %1055 = func.call @cc_nil_value() : () -> i64
      %1056 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1057 = arith.constant 4 : i64
      %1058 = func.call @cc_make_string(%1056, %1057) : (!llvm.ptr, i64) -> i64
      %1059 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1060 = arith.constant 7 : i64
      %1061 = func.call @cc_make_string(%1059, %1060) : (!llvm.ptr, i64) -> i64
      %1062 = func.call @cc_intern(%1058, %1061) : (i64, i64) -> i64
      %1063 = func.call @cc_nil_value() : () -> i64
      %1064 = func.call @cc_cons(%1062, %1063) : (i64, i64) -> i64
      %1065 = func.call @cc_values_pack(%1064) : (i64) -> i64
      %1066 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1067 = arith.constant 6 : i64
      %1068 = func.call @cc_make_string(%1066, %1067) : (!llvm.ptr, i64) -> i64
      %1069 = func.call @cc_nil_value() : () -> i64
      %1070 = func.call @cc_intern(%1068, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_values_pack(%1072) : (i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1074 = arith.addi %1070, %__rlasp_stack_elide_zero_49 : i64
      %1075 = func.call @cc_nil_value() : () -> i64
      %1076 = func.call @cc_errorp(%545) : (i64) -> i64
      %1077 = arith.cmpi ne, %1076, %1075 : i64
      %1078 = arith.cmpi eq, %1075, %1075 : i64
      %1079 = arith.andi %1077, %1078 : i1
      %1080 = scf.if %1079 -> (i64) {
        scf.yield %545 : i64
      } else {
        scf.yield %1075 : i64
      }
      %1081 = func.call @cc_errorp(%826) : (i64) -> i64
      %1082 = arith.cmpi ne, %1081, %1075 : i64
      %1083 = arith.cmpi eq, %1080, %1075 : i64
      %1084 = arith.andi %1082, %1083 : i1
      %1085 = scf.if %1084 -> (i64) {
        scf.yield %826 : i64
      } else {
        scf.yield %1080 : i64
      }
      %1086 = func.call @cc_errorp(%1032) : (i64) -> i64
      %1087 = arith.cmpi ne, %1086, %1075 : i64
      %1088 = arith.cmpi eq, %1085, %1075 : i64
      %1089 = arith.andi %1087, %1088 : i1
      %1090 = scf.if %1089 -> (i64) {
        scf.yield %1032 : i64
      } else {
        scf.yield %1085 : i64
      }
      %1091 = func.call @cc_errorp(%1044) : (i64) -> i64
      %1092 = arith.cmpi ne, %1091, %1075 : i64
      %1093 = arith.cmpi eq, %1090, %1075 : i64
      %1094 = arith.andi %1092, %1093 : i1
      %1095 = scf.if %1094 -> (i64) {
        scf.yield %1044 : i64
      } else {
        scf.yield %1090 : i64
      }
      %1096 = func.call @cc_errorp(%1051) : (i64) -> i64
      %1097 = arith.cmpi ne, %1096, %1075 : i64
      %1098 = arith.cmpi eq, %1095, %1075 : i64
      %1099 = arith.andi %1097, %1098 : i1
      %1100 = scf.if %1099 -> (i64) {
        scf.yield %1051 : i64
      } else {
        scf.yield %1095 : i64
      }
      %1101 = func.call @cc_errorp(%1055) : (i64) -> i64
      %1102 = arith.cmpi ne, %1101, %1075 : i64
      %1103 = arith.cmpi eq, %1100, %1075 : i64
      %1104 = arith.andi %1102, %1103 : i1
      %1105 = scf.if %1104 -> (i64) {
        scf.yield %1055 : i64
      } else {
        scf.yield %1100 : i64
      }
      %1106 = func.call @cc_errorp(%1062) : (i64) -> i64
      %1107 = arith.cmpi ne, %1106, %1075 : i64
      %1108 = arith.cmpi eq, %1105, %1075 : i64
      %1109 = arith.andi %1107, %1108 : i1
      %1110 = scf.if %1109 -> (i64) {
        scf.yield %1062 : i64
      } else {
        scf.yield %1105 : i64
      }
      %1111 = func.call @cc_errorp(%1074) : (i64) -> i64
      %1112 = arith.cmpi ne, %1111, %1075 : i64
      %1113 = arith.cmpi eq, %1110, %1075 : i64
      %1114 = arith.andi %1112, %1113 : i1
      %1115 = scf.if %1114 -> (i64) {
        scf.yield %1074 : i64
      } else {
        scf.yield %1110 : i64
      }
      %1116 = arith.cmpi ne, %1115, %1075 : i64
      scf.if %1116 {
        func.call @stack_push_pointer(%1115) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%545) : (i64) -> ()
        func.call @stack_push_pointer(%826) : (i64) -> ()
        func.call @stack_push_pointer(%1032) : (i64) -> ()
        func.call @stack_push_pointer(%1044) : (i64) -> ()
        func.call @stack_push_pointer(%1051) : (i64) -> ()
        func.call @stack_push_pointer(%1055) : (i64) -> ()
        func.call @stack_push_pointer(%1062) : (i64) -> ()
        func.call @stack_push_pointer(%1074) : (i64) -> ()
        %1117 = llvm.mlir.addressof @str88 : !llvm.ptr
        %1118 = func.call @cc_make_function_ref_const(%1117) : (!llvm.ptr) -> i64
        %1119 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1118, %1119) : (i64, i64) -> ()
      }
      %1120 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1120 : i64
    }
    %1121 = func.call @cc_nil_value() : () -> i64
    %1122 = func.call @cc_errorp(%536) : (i64) -> i64
    %1123 = arith.cmpi ne, %1122, %1121 : i64
    %1124 = scf.if %1123 -> (i64) {
      scf.yield %536 : i64
    } else {
      %1125 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1126 = arith.constant 11 : i64
      %1127 = func.call @cc_make_string(%1125, %1126) : (!llvm.ptr, i64) -> i64
      %1128 = func.call @cc_nil_value() : () -> i64
      %1129 = func.call @cc_intern(%1127, %1128) : (i64, i64) -> i64
      %1130 = func.call @cc_nil_value() : () -> i64
      %1131 = func.call @cc_cons(%1129, %1130) : (i64, i64) -> i64
      %1132 = func.call @cc_values_pack(%1131) : (i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1133 = arith.addi %1129, %__rlasp_stack_elide_zero_50 : i64
      %1134 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1135 = arith.constant 5 : i64
      %1136 = func.call @cc_make_string(%1134, %1135) : (!llvm.ptr, i64) -> i64
      %1137 = func.call @cc_nil_value() : () -> i64
      %1138 = func.call @cc_intern(%1136, %1137) : (i64, i64) -> i64
      %1139 = func.call @cc_nil_value() : () -> i64
      %1140 = func.call @cc_cons(%1138, %1139) : (i64, i64) -> i64
      %1141 = func.call @cc_values_pack(%1140) : (i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1142 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1143 = arith.constant 11 : i64
      %1144 = func.call @cc_make_string(%1142, %1143) : (!llvm.ptr, i64) -> i64
      %1145 = func.call @cc_nil_value() : () -> i64
      %1146 = func.call @cc_intern(%1144, %1145) : (i64, i64) -> i64
      %1147 = func.call @cc_nil_value() : () -> i64
      %1148 = func.call @cc_cons(%1146, %1147) : (i64, i64) -> i64
      %1149 = func.call @cc_values_pack(%1148) : (i64) -> i64
      func.call @stack_push_pointer(%1146) : (i64) -> ()
      %1150 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1151 = arith.constant 6 : i64
      %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
      %1153 = func.call @cc_nil_value() : () -> i64
      %1154 = func.call @cc_intern(%1152, %1153) : (i64, i64) -> i64
      %1155 = func.call @cc_nil_value() : () -> i64
      %1156 = func.call @cc_cons(%1154, %1155) : (i64, i64) -> i64
      %1157 = func.call @cc_values_pack(%1156) : (i64) -> i64
      func.call @stack_push_pointer(%1154) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1158 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1159 = arith.constant 3 : i64
      %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
      %1161 = func.call @cc_nil_value() : () -> i64
      %1162 = func.call @cc_intern(%1160, %1161) : (i64, i64) -> i64
      %1163 = func.call @cc_nil_value() : () -> i64
      %1164 = func.call @cc_cons(%1162, %1163) : (i64, i64) -> i64
      %1165 = func.call @cc_values_pack(%1164) : (i64) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      %1166 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1167 = arith.constant 5 : i64
      %1168 = func.call @cc_make_string(%1166, %1167) : (!llvm.ptr, i64) -> i64
      %1169 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1170 = arith.constant 11 : i64
      %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
      %1172 = func.call @cc_intern(%1168, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_nil_value() : () -> i64
      %1174 = func.call @cc_cons(%1172, %1173) : (i64, i64) -> i64
      %1175 = func.call @cc_values_pack(%1174) : (i64) -> i64
      func.call @stack_push_pointer(%1172) : (i64) -> ()
      %1176 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1176) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1177 = func.call @stack_pop_pointer() : () -> i64
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @cc_cons(%1178, %1177) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1180 = arith.addi %1179, %__rlasp_stack_elide_zero_51 : i64
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @cc_cons(%1181, %1180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1182) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @stack_pop_pointer() : () -> i64
      %1185 = func.call @cc_cons(%1184, %1183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1185) : (i64) -> ()
      %1186 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1187 = arith.constant 10 : i64
      %1188 = func.call @cc_make_string(%1186, %1187) : (!llvm.ptr, i64) -> i64
      %1189 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1190 = arith.constant 11 : i64
      %1191 = func.call @cc_make_string(%1189, %1190) : (!llvm.ptr, i64) -> i64
      %1192 = func.call @cc_intern(%1188, %1191) : (i64, i64) -> i64
      %1193 = func.call @cc_nil_value() : () -> i64
      %1194 = func.call @cc_cons(%1192, %1193) : (i64, i64) -> i64
      %1195 = func.call @cc_values_pack(%1194) : (i64) -> i64
      func.call @stack_push_pointer(%1192) : (i64) -> ()
      %1196 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1197 = arith.constant 5 : i64
      %1198 = func.call @cc_make_string(%1196, %1197) : (!llvm.ptr, i64) -> i64
      %1199 = func.call @cc_nil_value() : () -> i64
      %1200 = func.call @cc_intern(%1198, %1199) : (i64, i64) -> i64
      %1201 = func.call @cc_nil_value() : () -> i64
      %1202 = func.call @cc_cons(%1200, %1201) : (i64, i64) -> i64
      %1203 = func.call @cc_values_pack(%1202) : (i64) -> i64
      func.call @stack_push_pointer(%1200) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1204 = func.call @stack_pop_pointer() : () -> i64
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @cc_cons(%1205, %1204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1206) : (i64) -> ()
      %1207 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1208 = arith.constant 9 : i64
      %1209 = func.call @cc_make_string(%1207, %1208) : (!llvm.ptr, i64) -> i64
      %1210 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1211 = arith.constant 11 : i64
      %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
      %1213 = func.call @cc_intern(%1209, %1212) : (i64, i64) -> i64
      %1214 = func.call @cc_nil_value() : () -> i64
      %1215 = func.call @cc_cons(%1213, %1214) : (i64, i64) -> i64
      %1216 = func.call @cc_values_pack(%1215) : (i64) -> i64
      func.call @stack_push_pointer(%1213) : (i64) -> ()
      %1217 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1218 = arith.constant 6 : i64
      %1219 = func.call @cc_make_string(%1217, %1218) : (!llvm.ptr, i64) -> i64
      %1220 = func.call @cc_nil_value() : () -> i64
      %1221 = func.call @cc_intern(%1219, %1220) : (i64, i64) -> i64
      %1222 = func.call @cc_nil_value() : () -> i64
      %1223 = func.call @cc_cons(%1221, %1222) : (i64, i64) -> i64
      %1224 = func.call @cc_values_pack(%1223) : (i64) -> i64
      func.call @stack_push_pointer(%1221) : (i64) -> ()
      %1225 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1226 = arith.constant 5 : i64
      %1227 = func.call @cc_make_string(%1225, %1226) : (!llvm.ptr, i64) -> i64
      %1228 = func.call @cc_nil_value() : () -> i64
      %1229 = func.call @cc_intern(%1227, %1228) : (i64, i64) -> i64
      %1230 = func.call @cc_nil_value() : () -> i64
      %1231 = func.call @cc_cons(%1229, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_values_pack(%1231) : (i64) -> i64
      func.call @stack_push_pointer(%1229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = func.call @stack_pop_pointer() : () -> i64
      %1235 = func.call @cc_cons(%1234, %1233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1235) : (i64) -> ()
      %1236 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1237 = arith.constant 2 : i64
      %1238 = func.call @cc_make_string(%1236, %1237) : (!llvm.ptr, i64) -> i64
      %1239 = func.call @cc_nil_value() : () -> i64
      %1240 = func.call @cc_intern(%1238, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_nil_value() : () -> i64
      %1242 = func.call @cc_cons(%1240, %1241) : (i64, i64) -> i64
      %1243 = func.call @cc_values_pack(%1242) : (i64) -> i64
      func.call @stack_push_pointer(%1240) : (i64) -> ()
      %1244 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1245 = arith.constant 2 : i64
      %1246 = func.call @cc_make_string(%1244, %1245) : (!llvm.ptr, i64) -> i64
      %1247 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1248 = arith.constant 11 : i64
      %1249 = func.call @cc_make_string(%1247, %1248) : (!llvm.ptr, i64) -> i64
      %1250 = func.call @cc_intern(%1246, %1249) : (i64, i64) -> i64
      %1251 = func.call @cc_nil_value() : () -> i64
      %1252 = func.call @cc_cons(%1250, %1251) : (i64, i64) -> i64
      %1253 = func.call @cc_values_pack(%1252) : (i64) -> i64
      func.call @stack_push_pointer(%1250) : (i64) -> ()
      %1254 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1255 = arith.constant 19 : i64
      %1256 = func.call @cc_make_string(%1254, %1255) : (!llvm.ptr, i64) -> i64
      %1257 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1258 = arith.constant 11 : i64
      %1259 = func.call @cc_make_string(%1257, %1258) : (!llvm.ptr, i64) -> i64
      %1260 = func.call @cc_intern(%1256, %1259) : (i64, i64) -> i64
      %1261 = func.call @cc_nil_value() : () -> i64
      %1262 = func.call @cc_cons(%1260, %1261) : (i64, i64) -> i64
      %1263 = func.call @cc_values_pack(%1262) : (i64) -> i64
      func.call @stack_push_pointer(%1260) : (i64) -> ()
      %1264 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1265 = arith.constant 5 : i64
      %1266 = func.call @cc_make_string(%1264, %1265) : (!llvm.ptr, i64) -> i64
      %1267 = func.call @cc_nil_value() : () -> i64
      %1268 = func.call @cc_intern(%1266, %1267) : (i64, i64) -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_cons(%1268, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_values_pack(%1270) : (i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1272 = func.call @stack_pop_pointer() : () -> i64
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = func.call @cc_cons(%1273, %1272) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1275 = arith.addi %1274, %__rlasp_stack_elide_zero_52 : i64
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = func.call @cc_cons(%1276, %1275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1277) : (i64) -> ()
      %1278 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      %1279 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1280 = arith.constant 32 : i64
      %1281 = func.call @cc_make_string(%1279, %1280) : (!llvm.ptr, i64) -> i64
      %1282 = func.call @cc_nil_value() : () -> i64
      %1283 = func.call @cc_intern(%1281, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_nil_value() : () -> i64
      %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
      %1286 = func.call @cc_values_pack(%1285) : (i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1287 = arith.addi %1283, %__rlasp_stack_elide_zero_53 : i64
      %1288 = func.call @stack_pop_pointer() : () -> i64
      %1289 = func.call @cc_cons(%1287, %1288) : (i64, i64) -> i64
      %1290 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1291 = arith.constant 5 : i64
      %1292 = func.call @cc_make_string(%1290, %1291) : (!llvm.ptr, i64) -> i64
      %1293 = func.call @cc_nil_value() : () -> i64
      %1294 = func.call @cc_intern(%1292, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_nil_value() : () -> i64
      %1296 = func.call @cc_cons(%1294, %1295) : (i64, i64) -> i64
      %1297 = func.call @cc_values_pack(%1296) : (i64) -> i64
      %1298 = func.call @cc_cons(%1294, %1289) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1299 = func.call @stack_pop_pointer() : () -> i64
      %1300 = func.call @stack_pop_pointer() : () -> i64
      %1301 = func.call @cc_cons(%1300, %1299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1302 = arith.addi %1301, %__rlasp_stack_elide_zero_54 : i64
      %1303 = func.call @stack_pop_pointer() : () -> i64
      %1304 = func.call @cc_cons(%1303, %1302) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1305 = arith.addi %1304, %__rlasp_stack_elide_zero_55 : i64
      %1306 = func.call @stack_pop_pointer() : () -> i64
      %1307 = func.call @cc_cons(%1306, %1305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1307) : (i64) -> ()
      %1308 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1309 = arith.constant 5 : i64
      %1310 = func.call @cc_make_string(%1308, %1309) : (!llvm.ptr, i64) -> i64
      %1311 = func.call @cc_nil_value() : () -> i64
      %1312 = func.call @cc_intern(%1310, %1311) : (i64, i64) -> i64
      %1313 = func.call @cc_nil_value() : () -> i64
      %1314 = func.call @cc_cons(%1312, %1313) : (i64, i64) -> i64
      %1315 = func.call @cc_values_pack(%1314) : (i64) -> i64
      func.call @stack_push_pointer(%1312) : (i64) -> ()
      %1316 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1317 = arith.constant 4 : i64
      %1318 = func.call @cc_make_string(%1316, %1317) : (!llvm.ptr, i64) -> i64
      %1319 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1320 = arith.constant 11 : i64
      %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
      %1322 = func.call @cc_intern(%1318, %1321) : (i64, i64) -> i64
      %1323 = func.call @cc_nil_value() : () -> i64
      %1324 = func.call @cc_cons(%1322, %1323) : (i64, i64) -> i64
      %1325 = func.call @cc_values_pack(%1324) : (i64) -> i64
      func.call @stack_push_pointer(%1322) : (i64) -> ()
      %1326 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1327 = arith.constant 5 : i64
      %1328 = func.call @cc_make_string(%1326, %1327) : (!llvm.ptr, i64) -> i64
      %1329 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1330 = arith.constant 11 : i64
      %1331 = func.call @cc_make_string(%1329, %1330) : (!llvm.ptr, i64) -> i64
      %1332 = func.call @cc_intern(%1328, %1331) : (i64, i64) -> i64
      %1333 = func.call @cc_nil_value() : () -> i64
      %1334 = func.call @cc_cons(%1332, %1333) : (i64, i64) -> i64
      %1335 = func.call @cc_values_pack(%1334) : (i64) -> i64
      func.call @stack_push_pointer(%1332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1336 = func.call @stack_pop_pointer() : () -> i64
      %1337 = func.call @stack_pop_pointer() : () -> i64
      %1338 = func.call @cc_cons(%1337, %1336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1339 = arith.addi %1338, %__rlasp_stack_elide_zero_56 : i64
      %1340 = func.call @stack_pop_pointer() : () -> i64
      %1341 = func.call @cc_cons(%1340, %1339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1342 = func.call @stack_pop_pointer() : () -> i64
      %1343 = func.call @stack_pop_pointer() : () -> i64
      %1344 = func.call @cc_cons(%1343, %1342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1345 = arith.addi %1344, %__rlasp_stack_elide_zero_57 : i64
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = func.call @cc_cons(%1346, %1345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1348 = func.call @stack_pop_pointer() : () -> i64
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = func.call @cc_cons(%1349, %1348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1351 = arith.addi %1350, %__rlasp_stack_elide_zero_58 : i64
      %1352 = func.call @stack_pop_pointer() : () -> i64
      %1353 = func.call @cc_cons(%1352, %1351) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1354 = arith.addi %1353, %__rlasp_stack_elide_zero_59 : i64
      %1355 = func.call @stack_pop_pointer() : () -> i64
      %1356 = func.call @cc_cons(%1355, %1354) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1357 = arith.addi %1356, %__rlasp_stack_elide_zero_60 : i64
      %1358 = func.call @stack_pop_pointer() : () -> i64
      %1359 = func.call @cc_cons(%1358, %1357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1360 = func.call @stack_pop_pointer() : () -> i64
      %1361 = func.call @stack_pop_pointer() : () -> i64
      %1362 = func.call @cc_cons(%1361, %1360) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1363 = arith.addi %1362, %__rlasp_stack_elide_zero_61 : i64
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @cc_cons(%1364, %1363) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1366 = arith.addi %1365, %__rlasp_stack_elide_zero_62 : i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1368) : (i64) -> ()
      %1369 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1370 = arith.constant 5 : i64
      %1371 = func.call @cc_make_string(%1369, %1370) : (!llvm.ptr, i64) -> i64
      %1372 = func.call @cc_nil_value() : () -> i64
      %1373 = func.call @cc_intern(%1371, %1372) : (i64, i64) -> i64
      %1374 = func.call @cc_nil_value() : () -> i64
      %1375 = func.call @cc_cons(%1373, %1374) : (i64, i64) -> i64
      %1376 = func.call @cc_values_pack(%1375) : (i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @cc_cons(%1378, %1377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1380 = arith.addi %1379, %__rlasp_stack_elide_zero_63 : i64
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @cc_cons(%1381, %1380) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1383 = arith.addi %1382, %__rlasp_stack_elide_zero_64 : i64
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @cc_cons(%1384, %1383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1385) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @cc_cons(%1387, %1386) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1389 = arith.addi %1388, %__rlasp_stack_elide_zero_65 : i64
      %1390 = func.call @stack_pop_pointer() : () -> i64
      %1391 = func.call @cc_cons(%1390, %1389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1392 = arith.addi %1391, %__rlasp_stack_elide_zero_66 : i64
      %1393 = func.call @stack_pop_pointer() : () -> i64
      %1394 = func.call @cc_cons(%1393, %1392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      %1395 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1396 = arith.constant 11 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      %1398 = func.call @cc_nil_value() : () -> i64
      %1399 = func.call @cc_intern(%1397, %1398) : (i64, i64) -> i64
      %1400 = func.call @cc_nil_value() : () -> i64
      %1401 = func.call @cc_cons(%1399, %1400) : (i64, i64) -> i64
      %1402 = func.call @cc_values_pack(%1401) : (i64) -> i64
      func.call @stack_push_pointer(%1399) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1403 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1404 = arith.constant 5 : i64
      %1405 = func.call @cc_make_string(%1403, %1404) : (!llvm.ptr, i64) -> i64
      %1406 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1407 = arith.constant 11 : i64
      %1408 = func.call @cc_make_string(%1406, %1407) : (!llvm.ptr, i64) -> i64
      %1409 = func.call @cc_intern(%1405, %1408) : (i64, i64) -> i64
      %1410 = func.call @cc_nil_value() : () -> i64
      %1411 = func.call @cc_cons(%1409, %1410) : (i64, i64) -> i64
      %1412 = func.call @cc_values_pack(%1411) : (i64) -> i64
      func.call @stack_push_pointer(%1409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1413 = func.call @stack_pop_pointer() : () -> i64
      %1414 = func.call @stack_pop_pointer() : () -> i64
      %1415 = func.call @cc_cons(%1414, %1413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1416 = arith.addi %1415, %__rlasp_stack_elide_zero_67 : i64
      %1417 = func.call @stack_pop_pointer() : () -> i64
      %1418 = func.call @cc_cons(%1417, %1416) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1419 = arith.addi %1418, %__rlasp_stack_elide_zero_68 : i64
      %1420 = func.call @stack_pop_pointer() : () -> i64
      %1421 = func.call @cc_cons(%1420, %1419) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1421) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1422 = func.call @stack_pop_pointer() : () -> i64
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = func.call @cc_cons(%1423, %1422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1425 = arith.addi %1424, %__rlasp_stack_elide_zero_69 : i64
      %1426 = func.call @stack_pop_pointer() : () -> i64
      %1427 = func.call @cc_cons(%1426, %1425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1428 = arith.addi %1427, %__rlasp_stack_elide_zero_70 : i64
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @cc_cons(%1429, %1428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1431 = arith.addi %1430, %__rlasp_stack_elide_zero_71 : i64
      %1432 = func.call @stack_pop_pointer() : () -> i64
      %1433 = func.call @cc_cons(%1432, %1431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1433) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1434 = func.call @stack_pop_pointer() : () -> i64
      %1435 = func.call @stack_pop_pointer() : () -> i64
      %1436 = func.call @cc_cons(%1435, %1434) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1437 = arith.addi %1436, %__rlasp_stack_elide_zero_72 : i64
      %1438 = func.call @stack_pop_pointer() : () -> i64
      %1439 = func.call @cc_cons(%1438, %1437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1440 = arith.addi %1439, %__rlasp_stack_elide_zero_73 : i64
      %1441 = func.call @stack_pop_pointer() : () -> i64
      %1442 = func.call @cc_cons(%1441, %1440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1442) : (i64) -> ()
      %1443 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1444 = func.call @stack_pop_pointer() : () -> i64
      %1445 = func.call @stack_pop_pointer() : () -> i64
      %1446 = func.call @cc_cons(%1445, %1444) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1447 = arith.addi %1446, %__rlasp_stack_elide_zero_74 : i64
      %1448 = func.call @stack_pop_pointer() : () -> i64
      %1449 = func.call @cc_cons(%1448, %1447) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1450 = arith.addi %1449, %__rlasp_stack_elide_zero_75 : i64
      %1451 = func.call @stack_pop_pointer() : () -> i64
      %1452 = func.call @cc_cons(%1451, %1450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1452) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1453 = func.call @stack_pop_pointer() : () -> i64
      %1454 = func.call @stack_pop_pointer() : () -> i64
      %1455 = func.call @cc_cons(%1454, %1453) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1456 = arith.addi %1455, %__rlasp_stack_elide_zero_76 : i64
      %1457 = func.call @stack_pop_pointer() : () -> i64
      %1458 = func.call @cc_cons(%1457, %1456) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1459 = arith.addi %1458, %__rlasp_stack_elide_zero_77 : i64
      %1460 = func.call @stack_pop_pointer() : () -> i64
      %1461 = func.call @cc_cons(%1460, %1459) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1462 = arith.addi %1461, %__rlasp_stack_elide_zero_78 : i64
      %1703 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1704 = arith.constant 33 : i64
      %1705 = func.call @cc_make_symbol(%1703, %1704) : (!llvm.ptr, i64) -> i64
      %1706 = func.call @cc_persistent_root_value(%1705) : (i64) -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      %1707 = arith.constant 97047688511499 : i64
      %1708 = arith.constant 1 : i64
      %1709 = func.call @cc_make_closure(%1707, %1708) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1710 = arith.addi %1709, %__rlasp_stack_elide_zero_79 : i64
      %1711 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1712 = func.call @stack_pop_pointer() : () -> i64
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @cc_cons(%1713, %1712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1715 = arith.addi %1714, %__rlasp_stack_elide_zero_80 : i64
      %1716 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1717 = arith.constant 11 : i64
      %1718 = func.call @cc_make_string(%1716, %1717) : (!llvm.ptr, i64) -> i64
      %1719 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1720 = arith.constant 7 : i64
      %1721 = func.call @cc_make_string(%1719, %1720) : (!llvm.ptr, i64) -> i64
      %1722 = func.call @cc_intern(%1718, %1721) : (i64, i64) -> i64
      %1723 = func.call @cc_nil_value() : () -> i64
      %1724 = func.call @cc_cons(%1722, %1723) : (i64, i64) -> i64
      %1725 = func.call @cc_values_pack(%1724) : (i64) -> i64
      %1726 = func.call @cc_nil_value() : () -> i64
      %1727 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1728 = arith.constant 4 : i64
      %1729 = func.call @cc_make_string(%1727, %1728) : (!llvm.ptr, i64) -> i64
      %1730 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1731 = arith.constant 7 : i64
      %1732 = func.call @cc_make_string(%1730, %1731) : (!llvm.ptr, i64) -> i64
      %1733 = func.call @cc_intern(%1729, %1732) : (i64, i64) -> i64
      %1734 = func.call @cc_nil_value() : () -> i64
      %1735 = func.call @cc_cons(%1733, %1734) : (i64, i64) -> i64
      %1736 = func.call @cc_values_pack(%1735) : (i64) -> i64
      %1737 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1738 = arith.constant 6 : i64
      %1739 = func.call @cc_make_string(%1737, %1738) : (!llvm.ptr, i64) -> i64
      %1740 = func.call @cc_nil_value() : () -> i64
      %1741 = func.call @cc_intern(%1739, %1740) : (i64, i64) -> i64
      %1742 = func.call @cc_nil_value() : () -> i64
      %1743 = func.call @cc_cons(%1741, %1742) : (i64, i64) -> i64
      %1744 = func.call @cc_values_pack(%1743) : (i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1745 = arith.addi %1741, %__rlasp_stack_elide_zero_81 : i64
      %1746 = func.call @cc_nil_value() : () -> i64
      %1747 = func.call @cc_errorp(%1133) : (i64) -> i64
      %1748 = arith.cmpi ne, %1747, %1746 : i64
      %1749 = arith.cmpi eq, %1746, %1746 : i64
      %1750 = arith.andi %1748, %1749 : i1
      %1751 = scf.if %1750 -> (i64) {
        scf.yield %1133 : i64
      } else {
        scf.yield %1746 : i64
      }
      %1752 = func.call @cc_errorp(%1462) : (i64) -> i64
      %1753 = arith.cmpi ne, %1752, %1746 : i64
      %1754 = arith.cmpi eq, %1751, %1746 : i64
      %1755 = arith.andi %1753, %1754 : i1
      %1756 = scf.if %1755 -> (i64) {
        scf.yield %1462 : i64
      } else {
        scf.yield %1751 : i64
      }
      %1757 = func.call @cc_errorp(%1710) : (i64) -> i64
      %1758 = arith.cmpi ne, %1757, %1746 : i64
      %1759 = arith.cmpi eq, %1756, %1746 : i64
      %1760 = arith.andi %1758, %1759 : i1
      %1761 = scf.if %1760 -> (i64) {
        scf.yield %1710 : i64
      } else {
        scf.yield %1756 : i64
      }
      %1762 = func.call @cc_errorp(%1715) : (i64) -> i64
      %1763 = arith.cmpi ne, %1762, %1746 : i64
      %1764 = arith.cmpi eq, %1761, %1746 : i64
      %1765 = arith.andi %1763, %1764 : i1
      %1766 = scf.if %1765 -> (i64) {
        scf.yield %1715 : i64
      } else {
        scf.yield %1761 : i64
      }
      %1767 = func.call @cc_errorp(%1722) : (i64) -> i64
      %1768 = arith.cmpi ne, %1767, %1746 : i64
      %1769 = arith.cmpi eq, %1766, %1746 : i64
      %1770 = arith.andi %1768, %1769 : i1
      %1771 = scf.if %1770 -> (i64) {
        scf.yield %1722 : i64
      } else {
        scf.yield %1766 : i64
      }
      %1772 = func.call @cc_errorp(%1726) : (i64) -> i64
      %1773 = arith.cmpi ne, %1772, %1746 : i64
      %1774 = arith.cmpi eq, %1771, %1746 : i64
      %1775 = arith.andi %1773, %1774 : i1
      %1776 = scf.if %1775 -> (i64) {
        scf.yield %1726 : i64
      } else {
        scf.yield %1771 : i64
      }
      %1777 = func.call @cc_errorp(%1733) : (i64) -> i64
      %1778 = arith.cmpi ne, %1777, %1746 : i64
      %1779 = arith.cmpi eq, %1776, %1746 : i64
      %1780 = arith.andi %1778, %1779 : i1
      %1781 = scf.if %1780 -> (i64) {
        scf.yield %1733 : i64
      } else {
        scf.yield %1776 : i64
      }
      %1782 = func.call @cc_errorp(%1745) : (i64) -> i64
      %1783 = arith.cmpi ne, %1782, %1746 : i64
      %1784 = arith.cmpi eq, %1781, %1746 : i64
      %1785 = arith.andi %1783, %1784 : i1
      %1786 = scf.if %1785 -> (i64) {
        scf.yield %1745 : i64
      } else {
        scf.yield %1781 : i64
      }
      %1787 = arith.cmpi ne, %1786, %1746 : i64
      scf.if %1787 {
        func.call @stack_push_pointer(%1786) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1133) : (i64) -> ()
        func.call @stack_push_pointer(%1462) : (i64) -> ()
        func.call @stack_push_pointer(%1710) : (i64) -> ()
        func.call @stack_push_pointer(%1715) : (i64) -> ()
        func.call @stack_push_pointer(%1722) : (i64) -> ()
        func.call @stack_push_pointer(%1726) : (i64) -> ()
        func.call @stack_push_pointer(%1733) : (i64) -> ()
        func.call @stack_push_pointer(%1745) : (i64) -> ()
        %1788 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1789 = func.call @cc_make_function_ref_const(%1788) : (!llvm.ptr) -> i64
        %1790 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1789, %1790) : (i64, i64) -> ()
      }
      %1791 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1791 : i64
    }
    %1792 = func.call @cc_nil_value() : () -> i64
    %1793 = func.call @cc_errorp(%1124) : (i64) -> i64
    %1794 = arith.cmpi ne, %1793, %1792 : i64
    %1795 = scf.if %1794 -> (i64) {
      scf.yield %1124 : i64
    } else {
      %1796 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1797 = arith.constant 11 : i64
      %1798 = func.call @cc_make_string(%1796, %1797) : (!llvm.ptr, i64) -> i64
      %1799 = func.call @cc_nil_value() : () -> i64
      %1800 = func.call @cc_intern(%1798, %1799) : (i64, i64) -> i64
      %1801 = func.call @cc_nil_value() : () -> i64
      %1802 = func.call @cc_cons(%1800, %1801) : (i64, i64) -> i64
      %1803 = func.call @cc_values_pack(%1802) : (i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1804 = arith.addi %1800, %__rlasp_stack_elide_zero_82 : i64
      %1805 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1806 = arith.constant 5 : i64
      %1807 = func.call @cc_make_string(%1805, %1806) : (!llvm.ptr, i64) -> i64
      %1808 = func.call @cc_nil_value() : () -> i64
      %1809 = func.call @cc_intern(%1807, %1808) : (i64, i64) -> i64
      %1810 = func.call @cc_nil_value() : () -> i64
      %1811 = func.call @cc_cons(%1809, %1810) : (i64, i64) -> i64
      %1812 = func.call @cc_values_pack(%1811) : (i64) -> i64
      func.call @stack_push_pointer(%1809) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1813 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1814 = arith.constant 11 : i64
      %1815 = func.call @cc_make_string(%1813, %1814) : (!llvm.ptr, i64) -> i64
      %1816 = func.call @cc_nil_value() : () -> i64
      %1817 = func.call @cc_intern(%1815, %1816) : (i64, i64) -> i64
      %1818 = func.call @cc_nil_value() : () -> i64
      %1819 = func.call @cc_cons(%1817, %1818) : (i64, i64) -> i64
      %1820 = func.call @cc_values_pack(%1819) : (i64) -> i64
      func.call @stack_push_pointer(%1817) : (i64) -> ()
      %1821 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1822 = arith.constant 6 : i64
      %1823 = func.call @cc_make_string(%1821, %1822) : (!llvm.ptr, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_intern(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_nil_value() : () -> i64
      %1827 = func.call @cc_cons(%1825, %1826) : (i64, i64) -> i64
      %1828 = func.call @cc_values_pack(%1827) : (i64) -> i64
      func.call @stack_push_pointer(%1825) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1829 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1830 = arith.constant 3 : i64
      %1831 = func.call @cc_make_string(%1829, %1830) : (!llvm.ptr, i64) -> i64
      %1832 = func.call @cc_nil_value() : () -> i64
      %1833 = func.call @cc_intern(%1831, %1832) : (i64, i64) -> i64
      %1834 = func.call @cc_nil_value() : () -> i64
      %1835 = func.call @cc_cons(%1833, %1834) : (i64, i64) -> i64
      %1836 = func.call @cc_values_pack(%1835) : (i64) -> i64
      func.call @stack_push_pointer(%1833) : (i64) -> ()
      %1837 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1838 = arith.constant 5 : i64
      %1839 = func.call @cc_make_string(%1837, %1838) : (!llvm.ptr, i64) -> i64
      %1840 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1841 = arith.constant 11 : i64
      %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
      %1843 = func.call @cc_intern(%1839, %1842) : (i64, i64) -> i64
      %1844 = func.call @cc_nil_value() : () -> i64
      %1845 = func.call @cc_cons(%1843, %1844) : (i64, i64) -> i64
      %1846 = func.call @cc_values_pack(%1845) : (i64) -> i64
      func.call @stack_push_pointer(%1843) : (i64) -> ()
      %1847 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1847) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1848 = func.call @stack_pop_pointer() : () -> i64
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @cc_cons(%1849, %1848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1851 = arith.addi %1850, %__rlasp_stack_elide_zero_83 : i64
      %1852 = func.call @stack_pop_pointer() : () -> i64
      %1853 = func.call @cc_cons(%1852, %1851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1854 = func.call @stack_pop_pointer() : () -> i64
      %1855 = func.call @stack_pop_pointer() : () -> i64
      %1856 = func.call @cc_cons(%1855, %1854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1856) : (i64) -> ()
      %1857 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1858 = arith.constant 10 : i64
      %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
      %1860 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1861 = arith.constant 11 : i64
      %1862 = func.call @cc_make_string(%1860, %1861) : (!llvm.ptr, i64) -> i64
      %1863 = func.call @cc_intern(%1859, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_nil_value() : () -> i64
      %1865 = func.call @cc_cons(%1863, %1864) : (i64, i64) -> i64
      %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
      func.call @stack_push_pointer(%1863) : (i64) -> ()
      %1867 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1868 = arith.constant 5 : i64
      %1869 = func.call @cc_make_string(%1867, %1868) : (!llvm.ptr, i64) -> i64
      %1870 = func.call @cc_nil_value() : () -> i64
      %1871 = func.call @cc_intern(%1869, %1870) : (i64, i64) -> i64
      %1872 = func.call @cc_nil_value() : () -> i64
      %1873 = func.call @cc_cons(%1871, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_values_pack(%1873) : (i64) -> i64
      func.call @stack_push_pointer(%1871) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1875 = func.call @stack_pop_pointer() : () -> i64
      %1876 = func.call @stack_pop_pointer() : () -> i64
      %1877 = func.call @cc_cons(%1876, %1875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1877) : (i64) -> ()
      %1878 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1879 = arith.constant 9 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1882 = arith.constant 11 : i64
      %1883 = func.call @cc_make_string(%1881, %1882) : (!llvm.ptr, i64) -> i64
      %1884 = func.call @cc_intern(%1880, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_nil_value() : () -> i64
      %1886 = func.call @cc_cons(%1884, %1885) : (i64, i64) -> i64
      %1887 = func.call @cc_values_pack(%1886) : (i64) -> i64
      func.call @stack_push_pointer(%1884) : (i64) -> ()
      %1888 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1889 = arith.constant 6 : i64
      %1890 = func.call @cc_make_string(%1888, %1889) : (!llvm.ptr, i64) -> i64
      %1891 = func.call @cc_nil_value() : () -> i64
      %1892 = func.call @cc_intern(%1890, %1891) : (i64, i64) -> i64
      %1893 = func.call @cc_nil_value() : () -> i64
      %1894 = func.call @cc_cons(%1892, %1893) : (i64, i64) -> i64
      %1895 = func.call @cc_values_pack(%1894) : (i64) -> i64
      func.call @stack_push_pointer(%1892) : (i64) -> ()
      %1896 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1897 = arith.constant 5 : i64
      %1898 = func.call @cc_make_string(%1896, %1897) : (!llvm.ptr, i64) -> i64
      %1899 = func.call @cc_nil_value() : () -> i64
      %1900 = func.call @cc_intern(%1898, %1899) : (i64, i64) -> i64
      %1901 = func.call @cc_nil_value() : () -> i64
      %1902 = func.call @cc_cons(%1900, %1901) : (i64, i64) -> i64
      %1903 = func.call @cc_values_pack(%1902) : (i64) -> i64
      func.call @stack_push_pointer(%1900) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1904 = func.call @stack_pop_pointer() : () -> i64
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @cc_cons(%1905, %1904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1906) : (i64) -> ()
      %1907 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1908 = arith.constant 7 : i64
      %1909 = func.call @cc_make_string(%1907, %1908) : (!llvm.ptr, i64) -> i64
      %1910 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1911 = arith.constant 11 : i64
      %1912 = func.call @cc_make_string(%1910, %1911) : (!llvm.ptr, i64) -> i64
      %1913 = func.call @cc_intern(%1909, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_nil_value() : () -> i64
      %1915 = func.call @cc_cons(%1913, %1914) : (i64, i64) -> i64
      %1916 = func.call @cc_values_pack(%1915) : (i64) -> i64
      func.call @stack_push_pointer(%1913) : (i64) -> ()
      %1917 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1918 = arith.constant 6 : i64
      %1919 = func.call @cc_make_string(%1917, %1918) : (!llvm.ptr, i64) -> i64
      %1920 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1921 = arith.constant 11 : i64
      %1922 = func.call @cc_make_string(%1920, %1921) : (!llvm.ptr, i64) -> i64
      %1923 = func.call @cc_intern(%1919, %1922) : (i64, i64) -> i64
      %1924 = func.call @cc_nil_value() : () -> i64
      %1925 = func.call @cc_cons(%1923, %1924) : (i64, i64) -> i64
      %1926 = func.call @cc_values_pack(%1925) : (i64) -> i64
      func.call @stack_push_pointer(%1923) : (i64) -> ()
      %1927 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1928 = arith.constant 5 : i64
      %1929 = func.call @cc_make_string(%1927, %1928) : (!llvm.ptr, i64) -> i64
      %1930 = func.call @cc_nil_value() : () -> i64
      %1931 = func.call @cc_intern(%1929, %1930) : (i64, i64) -> i64
      %1932 = func.call @cc_nil_value() : () -> i64
      %1933 = func.call @cc_cons(%1931, %1932) : (i64, i64) -> i64
      %1934 = func.call @cc_values_pack(%1933) : (i64) -> i64
      func.call @stack_push_pointer(%1931) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1935 = func.call @stack_pop_pointer() : () -> i64
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @cc_cons(%1936, %1935) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1938 = arith.addi %1937, %__rlasp_stack_elide_zero_84 : i64
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @cc_cons(%1939, %1938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1940) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1941 = func.call @stack_pop_pointer() : () -> i64
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @cc_cons(%1942, %1941) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1944 = arith.addi %1943, %__rlasp_stack_elide_zero_85 : i64
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_cons(%1945, %1944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1946) : (i64) -> ()
      %1947 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1948 = arith.constant 4 : i64
      %1949 = func.call @cc_make_string(%1947, %1948) : (!llvm.ptr, i64) -> i64
      %1950 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1951 = arith.constant 11 : i64
      %1952 = func.call @cc_make_string(%1950, %1951) : (!llvm.ptr, i64) -> i64
      %1953 = func.call @cc_intern(%1949, %1952) : (i64, i64) -> i64
      %1954 = func.call @cc_nil_value() : () -> i64
      %1955 = func.call @cc_cons(%1953, %1954) : (i64, i64) -> i64
      %1956 = func.call @cc_values_pack(%1955) : (i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      %1957 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1958 = arith.constant 5 : i64
      %1959 = func.call @cc_make_string(%1957, %1958) : (!llvm.ptr, i64) -> i64
      %1960 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1961 = arith.constant 11 : i64
      %1962 = func.call @cc_make_string(%1960, %1961) : (!llvm.ptr, i64) -> i64
      %1963 = func.call @cc_intern(%1959, %1962) : (i64, i64) -> i64
      %1964 = func.call @cc_nil_value() : () -> i64
      %1965 = func.call @cc_cons(%1963, %1964) : (i64, i64) -> i64
      %1966 = func.call @cc_values_pack(%1965) : (i64) -> i64
      func.call @stack_push_pointer(%1963) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1967 = func.call @stack_pop_pointer() : () -> i64
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = func.call @cc_cons(%1968, %1967) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1970 = arith.addi %1969, %__rlasp_stack_elide_zero_86 : i64
      %1971 = func.call @stack_pop_pointer() : () -> i64
      %1972 = func.call @cc_cons(%1971, %1970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1972) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1973 = func.call @stack_pop_pointer() : () -> i64
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %1975 = func.call @cc_cons(%1974, %1973) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1976 = arith.addi %1975, %__rlasp_stack_elide_zero_87 : i64
      %1977 = func.call @stack_pop_pointer() : () -> i64
      %1978 = func.call @cc_cons(%1977, %1976) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1979 = arith.addi %1978, %__rlasp_stack_elide_zero_88 : i64
      %1980 = func.call @stack_pop_pointer() : () -> i64
      %1981 = func.call @cc_cons(%1980, %1979) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1982 = arith.addi %1981, %__rlasp_stack_elide_zero_89 : i64
      %1983 = func.call @stack_pop_pointer() : () -> i64
      %1984 = func.call @cc_cons(%1983, %1982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1984) : (i64) -> ()
      %1985 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1986 = arith.constant 5 : i64
      %1987 = func.call @cc_make_string(%1985, %1986) : (!llvm.ptr, i64) -> i64
      %1988 = func.call @cc_nil_value() : () -> i64
      %1989 = func.call @cc_intern(%1987, %1988) : (i64, i64) -> i64
      %1990 = func.call @cc_nil_value() : () -> i64
      %1991 = func.call @cc_cons(%1989, %1990) : (i64, i64) -> i64
      %1992 = func.call @cc_values_pack(%1991) : (i64) -> i64
      func.call @stack_push_pointer(%1989) : (i64) -> ()
      %1993 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1994 = arith.constant 5 : i64
      %1995 = func.call @cc_make_string(%1993, %1994) : (!llvm.ptr, i64) -> i64
      %1996 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1997 = arith.constant 7 : i64
      %1998 = func.call @cc_make_string(%1996, %1997) : (!llvm.ptr, i64) -> i64
      %1999 = func.call @cc_intern(%1995, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_nil_value() : () -> i64
      %2001 = func.call @cc_cons(%1999, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2003 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2004 = func.call @stack_pop_pointer() : () -> i64
      %2005 = func.call @stack_pop_pointer() : () -> i64
      %2006 = func.call @cc_cons(%2005, %2004) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %2007 = arith.addi %2006, %__rlasp_stack_elide_zero_90 : i64
      %2008 = func.call @stack_pop_pointer() : () -> i64
      %2009 = func.call @cc_cons(%2008, %2007) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %2010 = arith.addi %2009, %__rlasp_stack_elide_zero_91 : i64
      %2011 = func.call @stack_pop_pointer() : () -> i64
      %2012 = func.call @cc_cons(%2011, %2010) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %2013 = arith.addi %2012, %__rlasp_stack_elide_zero_92 : i64
      %2014 = func.call @stack_pop_pointer() : () -> i64
      %2015 = func.call @cc_cons(%2014, %2013) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %2016 = arith.addi %2015, %__rlasp_stack_elide_zero_93 : i64
      %2017 = func.call @stack_pop_pointer() : () -> i64
      %2018 = func.call @cc_cons(%2017, %2016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2019 = func.call @stack_pop_pointer() : () -> i64
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2021 = func.call @cc_cons(%2020, %2019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %2022 = arith.addi %2021, %__rlasp_stack_elide_zero_94 : i64
      %2023 = func.call @stack_pop_pointer() : () -> i64
      %2024 = func.call @cc_cons(%2023, %2022) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %2025 = arith.addi %2024, %__rlasp_stack_elide_zero_95 : i64
      %2026 = func.call @stack_pop_pointer() : () -> i64
      %2027 = func.call @cc_cons(%2026, %2025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2027) : (i64) -> ()
      %2028 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2029 = arith.constant 11 : i64
      %2030 = func.call @cc_make_string(%2028, %2029) : (!llvm.ptr, i64) -> i64
      %2031 = func.call @cc_nil_value() : () -> i64
      %2032 = func.call @cc_intern(%2030, %2031) : (i64, i64) -> i64
      %2033 = func.call @cc_nil_value() : () -> i64
      %2034 = func.call @cc_cons(%2032, %2033) : (i64, i64) -> i64
      %2035 = func.call @cc_values_pack(%2034) : (i64) -> i64
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2036 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2037 = arith.constant 5 : i64
      %2038 = func.call @cc_make_string(%2036, %2037) : (!llvm.ptr, i64) -> i64
      %2039 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2040 = arith.constant 11 : i64
      %2041 = func.call @cc_make_string(%2039, %2040) : (!llvm.ptr, i64) -> i64
      %2042 = func.call @cc_intern(%2038, %2041) : (i64, i64) -> i64
      %2043 = func.call @cc_nil_value() : () -> i64
      %2044 = func.call @cc_cons(%2042, %2043) : (i64, i64) -> i64
      %2045 = func.call @cc_values_pack(%2044) : (i64) -> i64
      func.call @stack_push_pointer(%2042) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2046 = func.call @stack_pop_pointer() : () -> i64
      %2047 = func.call @stack_pop_pointer() : () -> i64
      %2048 = func.call @cc_cons(%2047, %2046) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2049 = arith.addi %2048, %__rlasp_stack_elide_zero_96 : i64
      %2050 = func.call @stack_pop_pointer() : () -> i64
      %2051 = func.call @cc_cons(%2050, %2049) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2052 = arith.addi %2051, %__rlasp_stack_elide_zero_97 : i64
      %2053 = func.call @stack_pop_pointer() : () -> i64
      %2054 = func.call @cc_cons(%2053, %2052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2055 = func.call @stack_pop_pointer() : () -> i64
      %2056 = func.call @stack_pop_pointer() : () -> i64
      %2057 = func.call @cc_cons(%2056, %2055) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2058 = arith.addi %2057, %__rlasp_stack_elide_zero_98 : i64
      %2059 = func.call @stack_pop_pointer() : () -> i64
      %2060 = func.call @cc_cons(%2059, %2058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2061 = arith.addi %2060, %__rlasp_stack_elide_zero_99 : i64
      %2062 = func.call @stack_pop_pointer() : () -> i64
      %2063 = func.call @cc_cons(%2062, %2061) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2064 = arith.addi %2063, %__rlasp_stack_elide_zero_100 : i64
      %2065 = func.call @stack_pop_pointer() : () -> i64
      %2066 = func.call @cc_cons(%2065, %2064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @stack_pop_pointer() : () -> i64
      %2069 = func.call @cc_cons(%2068, %2067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2070 = arith.addi %2069, %__rlasp_stack_elide_zero_101 : i64
      %2071 = func.call @stack_pop_pointer() : () -> i64
      %2072 = func.call @cc_cons(%2071, %2070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2073 = arith.addi %2072, %__rlasp_stack_elide_zero_102 : i64
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @cc_cons(%2074, %2073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2076 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%2076) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2077 = func.call @stack_pop_pointer() : () -> i64
      %2078 = func.call @stack_pop_pointer() : () -> i64
      %2079 = func.call @cc_cons(%2078, %2077) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2080 = arith.addi %2079, %__rlasp_stack_elide_zero_103 : i64
      %2081 = func.call @stack_pop_pointer() : () -> i64
      %2082 = func.call @cc_cons(%2081, %2080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2083 = arith.addi %2082, %__rlasp_stack_elide_zero_104 : i64
      %2084 = func.call @stack_pop_pointer() : () -> i64
      %2085 = func.call @cc_cons(%2084, %2083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2085) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2086 = func.call @stack_pop_pointer() : () -> i64
      %2087 = func.call @stack_pop_pointer() : () -> i64
      %2088 = func.call @cc_cons(%2087, %2086) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2089 = arith.addi %2088, %__rlasp_stack_elide_zero_105 : i64
      %2090 = func.call @stack_pop_pointer() : () -> i64
      %2091 = func.call @cc_cons(%2090, %2089) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2092 = arith.addi %2091, %__rlasp_stack_elide_zero_106 : i64
      %2093 = func.call @stack_pop_pointer() : () -> i64
      %2094 = func.call @cc_cons(%2093, %2092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2095 = arith.addi %2094, %__rlasp_stack_elide_zero_107 : i64
      %2333 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2334 = arith.constant 33 : i64
      %2335 = func.call @cc_make_symbol(%2333, %2334) : (!llvm.ptr, i64) -> i64
      %2336 = func.call @cc_persistent_root_value(%2335) : (i64) -> i64
      func.call @stack_push_pointer(%2336) : (i64) -> ()
      %2337 = arith.constant 97047688511505 : i64
      %2338 = arith.constant 1 : i64
      %2339 = func.call @cc_make_closure(%2337, %2338) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2340 = arith.addi %2339, %__rlasp_stack_elide_zero_108 : i64
      %2341 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2342 = func.call @stack_pop_pointer() : () -> i64
      %2343 = func.call @stack_pop_pointer() : () -> i64
      %2344 = func.call @cc_cons(%2343, %2342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2345 = arith.addi %2344, %__rlasp_stack_elide_zero_109 : i64
      %2346 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2347 = arith.constant 11 : i64
      %2348 = func.call @cc_make_string(%2346, %2347) : (!llvm.ptr, i64) -> i64
      %2349 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2350 = arith.constant 7 : i64
      %2351 = func.call @cc_make_string(%2349, %2350) : (!llvm.ptr, i64) -> i64
      %2352 = func.call @cc_intern(%2348, %2351) : (i64, i64) -> i64
      %2353 = func.call @cc_nil_value() : () -> i64
      %2354 = func.call @cc_cons(%2352, %2353) : (i64, i64) -> i64
      %2355 = func.call @cc_values_pack(%2354) : (i64) -> i64
      %2356 = func.call @cc_nil_value() : () -> i64
      %2357 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2358 = arith.constant 4 : i64
      %2359 = func.call @cc_make_string(%2357, %2358) : (!llvm.ptr, i64) -> i64
      %2360 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2361 = arith.constant 7 : i64
      %2362 = func.call @cc_make_string(%2360, %2361) : (!llvm.ptr, i64) -> i64
      %2363 = func.call @cc_intern(%2359, %2362) : (i64, i64) -> i64
      %2364 = func.call @cc_nil_value() : () -> i64
      %2365 = func.call @cc_cons(%2363, %2364) : (i64, i64) -> i64
      %2366 = func.call @cc_values_pack(%2365) : (i64) -> i64
      %2367 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2368 = arith.constant 6 : i64
      %2369 = func.call @cc_make_string(%2367, %2368) : (!llvm.ptr, i64) -> i64
      %2370 = func.call @cc_nil_value() : () -> i64
      %2371 = func.call @cc_intern(%2369, %2370) : (i64, i64) -> i64
      %2372 = func.call @cc_nil_value() : () -> i64
      %2373 = func.call @cc_cons(%2371, %2372) : (i64, i64) -> i64
      %2374 = func.call @cc_values_pack(%2373) : (i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2375 = arith.addi %2371, %__rlasp_stack_elide_zero_110 : i64
      %2376 = func.call @cc_nil_value() : () -> i64
      %2377 = func.call @cc_errorp(%1804) : (i64) -> i64
      %2378 = arith.cmpi ne, %2377, %2376 : i64
      %2379 = arith.cmpi eq, %2376, %2376 : i64
      %2380 = arith.andi %2378, %2379 : i1
      %2381 = scf.if %2380 -> (i64) {
        scf.yield %1804 : i64
      } else {
        scf.yield %2376 : i64
      }
      %2382 = func.call @cc_errorp(%2095) : (i64) -> i64
      %2383 = arith.cmpi ne, %2382, %2376 : i64
      %2384 = arith.cmpi eq, %2381, %2376 : i64
      %2385 = arith.andi %2383, %2384 : i1
      %2386 = scf.if %2385 -> (i64) {
        scf.yield %2095 : i64
      } else {
        scf.yield %2381 : i64
      }
      %2387 = func.call @cc_errorp(%2340) : (i64) -> i64
      %2388 = arith.cmpi ne, %2387, %2376 : i64
      %2389 = arith.cmpi eq, %2386, %2376 : i64
      %2390 = arith.andi %2388, %2389 : i1
      %2391 = scf.if %2390 -> (i64) {
        scf.yield %2340 : i64
      } else {
        scf.yield %2386 : i64
      }
      %2392 = func.call @cc_errorp(%2345) : (i64) -> i64
      %2393 = arith.cmpi ne, %2392, %2376 : i64
      %2394 = arith.cmpi eq, %2391, %2376 : i64
      %2395 = arith.andi %2393, %2394 : i1
      %2396 = scf.if %2395 -> (i64) {
        scf.yield %2345 : i64
      } else {
        scf.yield %2391 : i64
      }
      %2397 = func.call @cc_errorp(%2352) : (i64) -> i64
      %2398 = arith.cmpi ne, %2397, %2376 : i64
      %2399 = arith.cmpi eq, %2396, %2376 : i64
      %2400 = arith.andi %2398, %2399 : i1
      %2401 = scf.if %2400 -> (i64) {
        scf.yield %2352 : i64
      } else {
        scf.yield %2396 : i64
      }
      %2402 = func.call @cc_errorp(%2356) : (i64) -> i64
      %2403 = arith.cmpi ne, %2402, %2376 : i64
      %2404 = arith.cmpi eq, %2401, %2376 : i64
      %2405 = arith.andi %2403, %2404 : i1
      %2406 = scf.if %2405 -> (i64) {
        scf.yield %2356 : i64
      } else {
        scf.yield %2401 : i64
      }
      %2407 = func.call @cc_errorp(%2363) : (i64) -> i64
      %2408 = arith.cmpi ne, %2407, %2376 : i64
      %2409 = arith.cmpi eq, %2406, %2376 : i64
      %2410 = arith.andi %2408, %2409 : i1
      %2411 = scf.if %2410 -> (i64) {
        scf.yield %2363 : i64
      } else {
        scf.yield %2406 : i64
      }
      %2412 = func.call @cc_errorp(%2375) : (i64) -> i64
      %2413 = arith.cmpi ne, %2412, %2376 : i64
      %2414 = arith.cmpi eq, %2411, %2376 : i64
      %2415 = arith.andi %2413, %2414 : i1
      %2416 = scf.if %2415 -> (i64) {
        scf.yield %2375 : i64
      } else {
        scf.yield %2411 : i64
      }
      %2417 = arith.cmpi ne, %2416, %2376 : i64
      scf.if %2417 {
        func.call @stack_push_pointer(%2416) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1804) : (i64) -> ()
        func.call @stack_push_pointer(%2095) : (i64) -> ()
        func.call @stack_push_pointer(%2340) : (i64) -> ()
        func.call @stack_push_pointer(%2345) : (i64) -> ()
        func.call @stack_push_pointer(%2352) : (i64) -> ()
        func.call @stack_push_pointer(%2356) : (i64) -> ()
        func.call @stack_push_pointer(%2363) : (i64) -> ()
        func.call @stack_push_pointer(%2375) : (i64) -> ()
        %2418 = llvm.mlir.addressof @str190 : !llvm.ptr
        %2419 = func.call @cc_make_function_ref_const(%2418) : (!llvm.ptr) -> i64
        %2420 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2419, %2420) : (i64, i64) -> ()
      }
      %2421 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2421 : i64
    }
    %2422 = func.call @cc_nil_value() : () -> i64
    %2423 = func.call @cc_errorp(%1795) : (i64) -> i64
    %2424 = arith.cmpi ne, %2423, %2422 : i64
    %2425 = scf.if %2424 -> (i64) {
      scf.yield %1795 : i64
    } else {
      %2426 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2427 = arith.constant 12 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = func.call @cc_nil_value() : () -> i64
      %2430 = func.call @cc_intern(%2428, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2434 = arith.addi %2430, %__rlasp_stack_elide_zero_111 : i64
      %2435 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2436 = arith.constant 5 : i64
      %2437 = func.call @cc_make_string(%2435, %2436) : (!llvm.ptr, i64) -> i64
      %2438 = func.call @cc_nil_value() : () -> i64
      %2439 = func.call @cc_intern(%2437, %2438) : (i64, i64) -> i64
      %2440 = func.call @cc_nil_value() : () -> i64
      %2441 = func.call @cc_cons(%2439, %2440) : (i64, i64) -> i64
      %2442 = func.call @cc_values_pack(%2441) : (i64) -> i64
      func.call @stack_push_pointer(%2439) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2443 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2444 = arith.constant 5 : i64
      %2445 = func.call @cc_make_string(%2443, %2444) : (!llvm.ptr, i64) -> i64
      %2446 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2447 = arith.constant 11 : i64
      %2448 = func.call @cc_make_string(%2446, %2447) : (!llvm.ptr, i64) -> i64
      %2449 = func.call @cc_intern(%2445, %2448) : (i64, i64) -> i64
      %2450 = func.call @cc_nil_value() : () -> i64
      %2451 = func.call @cc_cons(%2449, %2450) : (i64, i64) -> i64
      %2452 = func.call @cc_values_pack(%2451) : (i64) -> i64
      func.call @stack_push_pointer(%2449) : (i64) -> ()
      %2453 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2454 = arith.constant 16 : i64
      %2455 = func.call @cc_make_string(%2453, %2454) : (!llvm.ptr, i64) -> i64
      %2456 = func.call @cc_nil_value() : () -> i64
      %2457 = func.call @cc_intern(%2455, %2456) : (i64, i64) -> i64
      %2458 = func.call @cc_nil_value() : () -> i64
      %2459 = func.call @cc_cons(%2457, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_values_pack(%2459) : (i64) -> i64
      func.call @stack_push_pointer(%2457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2461 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2462 = arith.constant 13 : i64
      %2463 = func.call @cc_make_string(%2461, %2462) : (!llvm.ptr, i64) -> i64
      %2464 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2465 = arith.constant 11 : i64
      %2466 = func.call @cc_make_string(%2464, %2465) : (!llvm.ptr, i64) -> i64
      %2467 = func.call @cc_intern(%2463, %2466) : (i64, i64) -> i64
      %2468 = func.call @cc_nil_value() : () -> i64
      %2469 = func.call @cc_cons(%2467, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_values_pack(%2469) : (i64) -> i64
      func.call @stack_push_pointer(%2467) : (i64) -> ()
      %2471 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2472 = arith.constant 6 : i64
      %2473 = func.call @cc_make_string(%2471, %2472) : (!llvm.ptr, i64) -> i64
      %2474 = func.call @cc_nil_value() : () -> i64
      %2475 = func.call @cc_intern(%2473, %2474) : (i64, i64) -> i64
      %2476 = func.call @cc_nil_value() : () -> i64
      %2477 = func.call @cc_cons(%2475, %2476) : (i64, i64) -> i64
      %2478 = func.call @cc_values_pack(%2477) : (i64) -> i64
      func.call @stack_push_pointer(%2475) : (i64) -> ()
      %2479 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2480 = arith.constant 5 : i64
      %2481 = func.call @cc_make_string(%2479, %2480) : (!llvm.ptr, i64) -> i64
      %2482 = func.call @cc_nil_value() : () -> i64
      %2483 = func.call @cc_intern(%2481, %2482) : (i64, i64) -> i64
      %2484 = func.call @cc_nil_value() : () -> i64
      %2485 = func.call @cc_cons(%2483, %2484) : (i64, i64) -> i64
      %2486 = func.call @cc_values_pack(%2485) : (i64) -> i64
      func.call @stack_push_pointer(%2483) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2487 = func.call @stack_pop_pointer() : () -> i64
      %2488 = func.call @stack_pop_pointer() : () -> i64
      %2489 = func.call @cc_cons(%2488, %2487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2489) : (i64) -> ()
      %2490 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2491 = arith.constant 2 : i64
      %2492 = func.call @cc_make_string(%2490, %2491) : (!llvm.ptr, i64) -> i64
      %2493 = func.call @cc_nil_value() : () -> i64
      %2494 = func.call @cc_intern(%2492, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_nil_value() : () -> i64
      %2496 = func.call @cc_cons(%2494, %2495) : (i64, i64) -> i64
      %2497 = func.call @cc_values_pack(%2496) : (i64) -> i64
      func.call @stack_push_pointer(%2494) : (i64) -> ()
      %2498 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2499 = arith.constant 2 : i64
      %2500 = func.call @cc_make_string(%2498, %2499) : (!llvm.ptr, i64) -> i64
      %2501 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2502 = arith.constant 11 : i64
      %2503 = func.call @cc_make_string(%2501, %2502) : (!llvm.ptr, i64) -> i64
      %2504 = func.call @cc_intern(%2500, %2503) : (i64, i64) -> i64
      %2505 = func.call @cc_nil_value() : () -> i64
      %2506 = func.call @cc_cons(%2504, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_values_pack(%2506) : (i64) -> i64
      func.call @stack_push_pointer(%2504) : (i64) -> ()
      %2508 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2509 = arith.constant 19 : i64
      %2510 = func.call @cc_make_string(%2508, %2509) : (!llvm.ptr, i64) -> i64
      %2511 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2512 = arith.constant 11 : i64
      %2513 = func.call @cc_make_string(%2511, %2512) : (!llvm.ptr, i64) -> i64
      %2514 = func.call @cc_intern(%2510, %2513) : (i64, i64) -> i64
      %2515 = func.call @cc_nil_value() : () -> i64
      %2516 = func.call @cc_cons(%2514, %2515) : (i64, i64) -> i64
      %2517 = func.call @cc_values_pack(%2516) : (i64) -> i64
      func.call @stack_push_pointer(%2514) : (i64) -> ()
      %2518 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2519 = arith.constant 5 : i64
      %2520 = func.call @cc_make_string(%2518, %2519) : (!llvm.ptr, i64) -> i64
      %2521 = func.call @cc_nil_value() : () -> i64
      %2522 = func.call @cc_intern(%2520, %2521) : (i64, i64) -> i64
      %2523 = func.call @cc_nil_value() : () -> i64
      %2524 = func.call @cc_cons(%2522, %2523) : (i64, i64) -> i64
      %2525 = func.call @cc_values_pack(%2524) : (i64) -> i64
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2526 = func.call @stack_pop_pointer() : () -> i64
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @cc_cons(%2527, %2526) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2529 = arith.addi %2528, %__rlasp_stack_elide_zero_112 : i64
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @cc_cons(%2530, %2529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2531) : (i64) -> ()
      %2532 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2532) : (i64) -> ()
      %2533 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2534 = arith.constant 32 : i64
      %2535 = func.call @cc_make_string(%2533, %2534) : (!llvm.ptr, i64) -> i64
      %2536 = func.call @cc_nil_value() : () -> i64
      %2537 = func.call @cc_intern(%2535, %2536) : (i64, i64) -> i64
      %2538 = func.call @cc_nil_value() : () -> i64
      %2539 = func.call @cc_cons(%2537, %2538) : (i64, i64) -> i64
      %2540 = func.call @cc_values_pack(%2539) : (i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2541 = arith.addi %2537, %__rlasp_stack_elide_zero_113 : i64
      %2542 = func.call @stack_pop_pointer() : () -> i64
      %2543 = func.call @cc_cons(%2541, %2542) : (i64, i64) -> i64
      %2544 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2545 = arith.constant 5 : i64
      %2546 = func.call @cc_make_string(%2544, %2545) : (!llvm.ptr, i64) -> i64
      %2547 = func.call @cc_nil_value() : () -> i64
      %2548 = func.call @cc_intern(%2546, %2547) : (i64, i64) -> i64
      %2549 = func.call @cc_nil_value() : () -> i64
      %2550 = func.call @cc_cons(%2548, %2549) : (i64, i64) -> i64
      %2551 = func.call @cc_values_pack(%2550) : (i64) -> i64
      %2552 = func.call @cc_cons(%2548, %2543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2553 = func.call @stack_pop_pointer() : () -> i64
      %2554 = func.call @stack_pop_pointer() : () -> i64
      %2555 = func.call @cc_cons(%2554, %2553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2556 = arith.addi %2555, %__rlasp_stack_elide_zero_114 : i64
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @cc_cons(%2557, %2556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2559 = arith.addi %2558, %__rlasp_stack_elide_zero_115 : i64
      %2560 = func.call @stack_pop_pointer() : () -> i64
      %2561 = func.call @cc_cons(%2560, %2559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2561) : (i64) -> ()
      %2562 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2563 = arith.constant 5 : i64
      %2564 = func.call @cc_make_string(%2562, %2563) : (!llvm.ptr, i64) -> i64
      %2565 = func.call @cc_nil_value() : () -> i64
      %2566 = func.call @cc_intern(%2564, %2565) : (i64, i64) -> i64
      %2567 = func.call @cc_nil_value() : () -> i64
      %2568 = func.call @cc_cons(%2566, %2567) : (i64, i64) -> i64
      %2569 = func.call @cc_values_pack(%2568) : (i64) -> i64
      func.call @stack_push_pointer(%2566) : (i64) -> ()
      %2570 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2571 = arith.constant 11 : i64
      %2572 = func.call @cc_make_string(%2570, %2571) : (!llvm.ptr, i64) -> i64
      %2573 = func.call @cc_nil_value() : () -> i64
      %2574 = func.call @cc_intern(%2572, %2573) : (i64, i64) -> i64
      %2575 = func.call @cc_nil_value() : () -> i64
      %2576 = func.call @cc_cons(%2574, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_values_pack(%2576) : (i64) -> i64
      func.call @stack_push_pointer(%2574) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2578 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2579 = arith.constant 12 : i64
      %2580 = func.call @cc_make_string(%2578, %2579) : (!llvm.ptr, i64) -> i64
      %2581 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2582 = arith.constant 11 : i64
      %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
      %2584 = func.call @cc_intern(%2580, %2583) : (i64, i64) -> i64
      %2585 = func.call @cc_nil_value() : () -> i64
      %2586 = func.call @cc_cons(%2584, %2585) : (i64, i64) -> i64
      %2587 = func.call @cc_values_pack(%2586) : (i64) -> i64
      func.call @stack_push_pointer(%2584) : (i64) -> ()
      %2588 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2589 = arith.constant 5 : i64
      %2590 = func.call @cc_make_string(%2588, %2589) : (!llvm.ptr, i64) -> i64
      %2591 = func.call @cc_nil_value() : () -> i64
      %2592 = func.call @cc_intern(%2590, %2591) : (i64, i64) -> i64
      %2593 = func.call @cc_nil_value() : () -> i64
      %2594 = func.call @cc_cons(%2592, %2593) : (i64, i64) -> i64
      %2595 = func.call @cc_values_pack(%2594) : (i64) -> i64
      func.call @stack_push_pointer(%2592) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2596 = func.call @stack_pop_pointer() : () -> i64
      %2597 = func.call @stack_pop_pointer() : () -> i64
      %2598 = func.call @cc_cons(%2597, %2596) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2599 = arith.addi %2598, %__rlasp_stack_elide_zero_116 : i64
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = func.call @cc_cons(%2600, %2599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2601) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @cc_cons(%2603, %2602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2605 = arith.addi %2604, %__rlasp_stack_elide_zero_117 : i64
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @cc_cons(%2606, %2605) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2608 = arith.addi %2607, %__rlasp_stack_elide_zero_118 : i64
      %2609 = func.call @stack_pop_pointer() : () -> i64
      %2610 = func.call @cc_cons(%2609, %2608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2610) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @stack_pop_pointer() : () -> i64
      %2613 = func.call @cc_cons(%2612, %2611) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2614 = arith.addi %2613, %__rlasp_stack_elide_zero_119 : i64
      %2615 = func.call @stack_pop_pointer() : () -> i64
      %2616 = func.call @cc_cons(%2615, %2614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2616) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2617 = func.call @stack_pop_pointer() : () -> i64
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = func.call @cc_cons(%2618, %2617) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2620 = arith.addi %2619, %__rlasp_stack_elide_zero_120 : i64
      %2621 = func.call @stack_pop_pointer() : () -> i64
      %2622 = func.call @cc_cons(%2621, %2620) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2623 = arith.addi %2622, %__rlasp_stack_elide_zero_121 : i64
      %2624 = func.call @stack_pop_pointer() : () -> i64
      %2625 = func.call @cc_cons(%2624, %2623) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2626 = arith.addi %2625, %__rlasp_stack_elide_zero_122 : i64
      %2627 = func.call @stack_pop_pointer() : () -> i64
      %2628 = func.call @cc_cons(%2627, %2626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2628) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @stack_pop_pointer() : () -> i64
      %2631 = func.call @cc_cons(%2630, %2629) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2632 = arith.addi %2631, %__rlasp_stack_elide_zero_123 : i64
      %2633 = func.call @stack_pop_pointer() : () -> i64
      %2634 = func.call @cc_cons(%2633, %2632) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2635 = arith.addi %2634, %__rlasp_stack_elide_zero_124 : i64
      %2636 = func.call @stack_pop_pointer() : () -> i64
      %2637 = func.call @cc_cons(%2636, %2635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2637) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @stack_pop_pointer() : () -> i64
      %2640 = func.call @cc_cons(%2639, %2638) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2641 = arith.addi %2640, %__rlasp_stack_elide_zero_125 : i64
      %2642 = func.call @stack_pop_pointer() : () -> i64
      %2643 = func.call @cc_cons(%2642, %2641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2643) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @stack_pop_pointer() : () -> i64
      %2646 = func.call @cc_cons(%2645, %2644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2647 = arith.addi %2646, %__rlasp_stack_elide_zero_126 : i64
      %2648 = func.call @stack_pop_pointer() : () -> i64
      %2649 = func.call @cc_cons(%2648, %2647) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2650 = arith.addi %2649, %__rlasp_stack_elide_zero_127 : i64
      %2651 = func.call @stack_pop_pointer() : () -> i64
      %2652 = func.call @cc_cons(%2651, %2650) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2653 = arith.addi %2652, %__rlasp_stack_elide_zero_128 : i64
      %2654 = func.call @stack_pop_pointer() : () -> i64
      %2655 = func.call @cc_cons(%2654, %2653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2655) : (i64) -> ()
      %2656 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2657 = arith.constant 32 : i64
      %2658 = func.call @cc_make_string(%2656, %2657) : (!llvm.ptr, i64) -> i64
      %2659 = func.call @cc_nil_value() : () -> i64
      %2660 = func.call @cc_intern(%2658, %2659) : (i64, i64) -> i64
      %2661 = func.call @cc_nil_value() : () -> i64
      %2662 = func.call @cc_cons(%2660, %2661) : (i64, i64) -> i64
      %2663 = func.call @cc_values_pack(%2662) : (i64) -> i64
      func.call @stack_push_pointer(%2660) : (i64) -> ()
      %2664 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2664) : (i64) -> ()
      %2665 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2666 = arith.constant 16 : i64
      %2667 = func.call @cc_make_string(%2665, %2666) : (!llvm.ptr, i64) -> i64
      %2668 = func.call @cc_nil_value() : () -> i64
      %2669 = func.call @cc_intern(%2667, %2668) : (i64, i64) -> i64
      %2670 = func.call @cc_nil_value() : () -> i64
      %2671 = func.call @cc_cons(%2669, %2670) : (i64, i64) -> i64
      %2672 = func.call @cc_values_pack(%2671) : (i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2673 = arith.addi %2669, %__rlasp_stack_elide_zero_129 : i64
      %2674 = func.call @stack_pop_pointer() : () -> i64
      %2675 = func.call @cc_cons(%2673, %2674) : (i64, i64) -> i64
      %2676 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2677 = arith.constant 5 : i64
      %2678 = func.call @cc_make_string(%2676, %2677) : (!llvm.ptr, i64) -> i64
      %2679 = func.call @cc_nil_value() : () -> i64
      %2680 = func.call @cc_intern(%2678, %2679) : (i64, i64) -> i64
      %2681 = func.call @cc_nil_value() : () -> i64
      %2682 = func.call @cc_cons(%2680, %2681) : (i64, i64) -> i64
      %2683 = func.call @cc_values_pack(%2682) : (i64) -> i64
      %2684 = func.call @cc_cons(%2680, %2675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2684) : (i64) -> ()
      %2685 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%2685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @stack_pop_pointer() : () -> i64
      %2688 = func.call @cc_cons(%2687, %2686) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2689 = arith.addi %2688, %__rlasp_stack_elide_zero_130 : i64
      %2690 = func.call @stack_pop_pointer() : () -> i64
      %2691 = func.call @cc_cons(%2690, %2689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2692 = arith.addi %2691, %__rlasp_stack_elide_zero_131 : i64
      %2693 = func.call @stack_pop_pointer() : () -> i64
      %2694 = func.call @cc_cons(%2693, %2692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2695 = func.call @stack_pop_pointer() : () -> i64
      %2696 = func.call @stack_pop_pointer() : () -> i64
      %2697 = func.call @cc_cons(%2696, %2695) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2698 = arith.addi %2697, %__rlasp_stack_elide_zero_132 : i64
      %2699 = func.call @stack_pop_pointer() : () -> i64
      %2700 = func.call @cc_cons(%2699, %2698) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2701 = arith.addi %2700, %__rlasp_stack_elide_zero_133 : i64
      %2702 = func.call @stack_pop_pointer() : () -> i64
      %2703 = func.call @cc_cons(%2702, %2701) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2704 = arith.addi %2703, %__rlasp_stack_elide_zero_134 : i64
      %2705 = func.call @stack_pop_pointer() : () -> i64
      %2706 = func.call @cc_cons(%2705, %2704) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2707 = arith.addi %2706, %__rlasp_stack_elide_zero_135 : i64
      %3164 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3165 = arith.constant 48 : i64
      %3166 = func.call @cc_make_symbol(%3164, %3165) : (!llvm.ptr, i64) -> i64
      %3167 = func.call @cc_persistent_root_value(%3166) : (i64) -> i64
      func.call @stack_push_pointer(%3167) : (i64) -> ()
      %3168 = arith.constant 97047688511511 : i64
      %3169 = arith.constant 1 : i64
      %3170 = func.call @cc_make_closure(%3168, %3169) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %3171 = arith.addi %3170, %__rlasp_stack_elide_zero_136 : i64
      %3172 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3173 = arith.constant 1 : i64
      %3174 = func.call @cc_make_string(%3172, %3173) : (!llvm.ptr, i64) -> i64
      %3175 = func.call @cc_nil_value() : () -> i64
      %3176 = func.call @cc_intern(%3174, %3175) : (i64, i64) -> i64
      %3177 = func.call @cc_nil_value() : () -> i64
      %3178 = func.call @cc_cons(%3176, %3177) : (i64, i64) -> i64
      %3179 = func.call @cc_values_pack(%3178) : (i64) -> i64
      func.call @stack_push_pointer(%3176) : (i64) -> ()
      %3180 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3181 = arith.constant 16 : i64
      %3182 = func.call @cc_make_string(%3180, %3181) : (!llvm.ptr, i64) -> i64
      %3183 = func.call @cc_nil_value() : () -> i64
      %3184 = func.call @cc_intern(%3182, %3183) : (i64, i64) -> i64
      %3185 = func.call @cc_nil_value() : () -> i64
      %3186 = func.call @cc_cons(%3184, %3185) : (i64, i64) -> i64
      %3187 = func.call @cc_values_pack(%3186) : (i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %3188 = arith.addi %3184, %__rlasp_stack_elide_zero_137 : i64
      %3189 = func.call @stack_pop_pointer() : () -> i64
      %3190 = func.call @cc_cons(%3189, %3188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3190) : (i64) -> ()
      %3191 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3192 = arith.constant 1 : i64
      %3193 = func.call @cc_make_string(%3191, %3192) : (!llvm.ptr, i64) -> i64
      %3194 = func.call @cc_nil_value() : () -> i64
      %3195 = func.call @cc_intern(%3193, %3194) : (i64, i64) -> i64
      %3196 = func.call @cc_nil_value() : () -> i64
      %3197 = func.call @cc_cons(%3195, %3196) : (i64, i64) -> i64
      %3198 = func.call @cc_values_pack(%3197) : (i64) -> i64
      func.call @stack_push_pointer(%3195) : (i64) -> ()
      %3199 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%3199) : (i64) -> ()
      %3200 = func.call @stack_pop_pointer() : () -> i64
      %3201 = func.call @stack_pop_pointer() : () -> i64
      %3202 = func.call @cc_cons(%3201, %3200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3202) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3203 = func.call @stack_pop_pointer() : () -> i64
      %3204 = func.call @stack_pop_pointer() : () -> i64
      %3205 = func.call @cc_cons(%3204, %3203) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %3206 = arith.addi %3205, %__rlasp_stack_elide_zero_138 : i64
      %3207 = func.call @stack_pop_pointer() : () -> i64
      %3208 = func.call @cc_cons(%3207, %3206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3208) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3209 = func.call @stack_pop_pointer() : () -> i64
      %3210 = func.call @stack_pop_pointer() : () -> i64
      %3211 = func.call @cc_cons(%3210, %3209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %3212 = arith.addi %3211, %__rlasp_stack_elide_zero_139 : i64
      %3213 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3214 = arith.constant 11 : i64
      %3215 = func.call @cc_make_string(%3213, %3214) : (!llvm.ptr, i64) -> i64
      %3216 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3217 = arith.constant 7 : i64
      %3218 = func.call @cc_make_string(%3216, %3217) : (!llvm.ptr, i64) -> i64
      %3219 = func.call @cc_intern(%3215, %3218) : (i64, i64) -> i64
      %3220 = func.call @cc_nil_value() : () -> i64
      %3221 = func.call @cc_cons(%3219, %3220) : (i64, i64) -> i64
      %3222 = func.call @cc_values_pack(%3221) : (i64) -> i64
      %3223 = func.call @cc_nil_value() : () -> i64
      %3224 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3225 = arith.constant 4 : i64
      %3226 = func.call @cc_make_string(%3224, %3225) : (!llvm.ptr, i64) -> i64
      %3227 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3228 = arith.constant 7 : i64
      %3229 = func.call @cc_make_string(%3227, %3228) : (!llvm.ptr, i64) -> i64
      %3230 = func.call @cc_intern(%3226, %3229) : (i64, i64) -> i64
      %3231 = func.call @cc_nil_value() : () -> i64
      %3232 = func.call @cc_cons(%3230, %3231) : (i64, i64) -> i64
      %3233 = func.call @cc_values_pack(%3232) : (i64) -> i64
      %3234 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3235 = arith.constant 6 : i64
      %3236 = func.call @cc_make_string(%3234, %3235) : (!llvm.ptr, i64) -> i64
      %3237 = func.call @cc_nil_value() : () -> i64
      %3238 = func.call @cc_intern(%3236, %3237) : (i64, i64) -> i64
      %3239 = func.call @cc_nil_value() : () -> i64
      %3240 = func.call @cc_cons(%3238, %3239) : (i64, i64) -> i64
      %3241 = func.call @cc_values_pack(%3240) : (i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %3242 = arith.addi %3238, %__rlasp_stack_elide_zero_140 : i64
      %3243 = func.call @cc_nil_value() : () -> i64
      %3244 = func.call @cc_errorp(%2434) : (i64) -> i64
      %3245 = arith.cmpi ne, %3244, %3243 : i64
      %3246 = arith.cmpi eq, %3243, %3243 : i64
      %3247 = arith.andi %3245, %3246 : i1
      %3248 = scf.if %3247 -> (i64) {
        scf.yield %2434 : i64
      } else {
        scf.yield %3243 : i64
      }
      %3249 = func.call @cc_errorp(%2707) : (i64) -> i64
      %3250 = arith.cmpi ne, %3249, %3243 : i64
      %3251 = arith.cmpi eq, %3248, %3243 : i64
      %3252 = arith.andi %3250, %3251 : i1
      %3253 = scf.if %3252 -> (i64) {
        scf.yield %2707 : i64
      } else {
        scf.yield %3248 : i64
      }
      %3254 = func.call @cc_errorp(%3171) : (i64) -> i64
      %3255 = arith.cmpi ne, %3254, %3243 : i64
      %3256 = arith.cmpi eq, %3253, %3243 : i64
      %3257 = arith.andi %3255, %3256 : i1
      %3258 = scf.if %3257 -> (i64) {
        scf.yield %3171 : i64
      } else {
        scf.yield %3253 : i64
      }
      %3259 = func.call @cc_errorp(%3212) : (i64) -> i64
      %3260 = arith.cmpi ne, %3259, %3243 : i64
      %3261 = arith.cmpi eq, %3258, %3243 : i64
      %3262 = arith.andi %3260, %3261 : i1
      %3263 = scf.if %3262 -> (i64) {
        scf.yield %3212 : i64
      } else {
        scf.yield %3258 : i64
      }
      %3264 = func.call @cc_errorp(%3219) : (i64) -> i64
      %3265 = arith.cmpi ne, %3264, %3243 : i64
      %3266 = arith.cmpi eq, %3263, %3243 : i64
      %3267 = arith.andi %3265, %3266 : i1
      %3268 = scf.if %3267 -> (i64) {
        scf.yield %3219 : i64
      } else {
        scf.yield %3263 : i64
      }
      %3269 = func.call @cc_errorp(%3223) : (i64) -> i64
      %3270 = arith.cmpi ne, %3269, %3243 : i64
      %3271 = arith.cmpi eq, %3268, %3243 : i64
      %3272 = arith.andi %3270, %3271 : i1
      %3273 = scf.if %3272 -> (i64) {
        scf.yield %3223 : i64
      } else {
        scf.yield %3268 : i64
      }
      %3274 = func.call @cc_errorp(%3230) : (i64) -> i64
      %3275 = arith.cmpi ne, %3274, %3243 : i64
      %3276 = arith.cmpi eq, %3273, %3243 : i64
      %3277 = arith.andi %3275, %3276 : i1
      %3278 = scf.if %3277 -> (i64) {
        scf.yield %3230 : i64
      } else {
        scf.yield %3273 : i64
      }
      %3279 = func.call @cc_errorp(%3242) : (i64) -> i64
      %3280 = arith.cmpi ne, %3279, %3243 : i64
      %3281 = arith.cmpi eq, %3278, %3243 : i64
      %3282 = arith.andi %3280, %3281 : i1
      %3283 = scf.if %3282 -> (i64) {
        scf.yield %3242 : i64
      } else {
        scf.yield %3278 : i64
      }
      %3284 = arith.cmpi ne, %3283, %3243 : i64
      scf.if %3284 {
        func.call @stack_push_pointer(%3283) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2434) : (i64) -> ()
        func.call @stack_push_pointer(%2707) : (i64) -> ()
        func.call @stack_push_pointer(%3171) : (i64) -> ()
        func.call @stack_push_pointer(%3212) : (i64) -> ()
        func.call @stack_push_pointer(%3219) : (i64) -> ()
        func.call @stack_push_pointer(%3223) : (i64) -> ()
        func.call @stack_push_pointer(%3230) : (i64) -> ()
        func.call @stack_push_pointer(%3242) : (i64) -> ()
        %3285 = llvm.mlir.addressof @str272 : !llvm.ptr
        %3286 = func.call @cc_make_function_ref_const(%3285) : (!llvm.ptr) -> i64
        %3287 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3286, %3287) : (i64, i64) -> ()
      }
      %3288 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3288 : i64
    }
    %3289 = func.call @cc_nil_value() : () -> i64
    %3290 = func.call @cc_errorp(%2425) : (i64) -> i64
    %3291 = arith.cmpi ne, %3290, %3289 : i64
    %3292 = scf.if %3291 -> (i64) {
      scf.yield %2425 : i64
    } else {
      %3293 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3294 = arith.constant 14 : i64
      %3295 = func.call @cc_make_string(%3293, %3294) : (!llvm.ptr, i64) -> i64
      %3296 = func.call @cc_nil_value() : () -> i64
      %3297 = func.call @cc_intern(%3295, %3296) : (i64, i64) -> i64
      %3298 = func.call @cc_nil_value() : () -> i64
      %3299 = func.call @cc_cons(%3297, %3298) : (i64, i64) -> i64
      %3300 = func.call @cc_values_pack(%3299) : (i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %3301 = arith.addi %3297, %__rlasp_stack_elide_zero_141 : i64
      %3302 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3303 = arith.constant 3 : i64
      %3304 = func.call @cc_make_string(%3302, %3303) : (!llvm.ptr, i64) -> i64
      %3305 = func.call @cc_nil_value() : () -> i64
      %3306 = func.call @cc_intern(%3304, %3305) : (i64, i64) -> i64
      %3307 = func.call @cc_nil_value() : () -> i64
      %3308 = func.call @cc_cons(%3306, %3307) : (i64, i64) -> i64
      %3309 = func.call @cc_values_pack(%3308) : (i64) -> i64
      func.call @stack_push_pointer(%3306) : (i64) -> ()
      %3310 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3311 = arith.constant 3 : i64
      %3312 = func.call @cc_make_string(%3310, %3311) : (!llvm.ptr, i64) -> i64
      %3313 = func.call @cc_nil_value() : () -> i64
      %3314 = func.call @cc_intern(%3312, %3313) : (i64, i64) -> i64
      %3315 = func.call @cc_nil_value() : () -> i64
      %3316 = func.call @cc_cons(%3314, %3315) : (i64, i64) -> i64
      %3317 = func.call @cc_values_pack(%3316) : (i64) -> i64
      func.call @stack_push_pointer(%3314) : (i64) -> ()
      %3318 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3319 = arith.constant 2 : i64
      %3320 = func.call @cc_make_string(%3318, %3319) : (!llvm.ptr, i64) -> i64
      %3321 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3322 = arith.constant 11 : i64
      %3323 = func.call @cc_make_string(%3321, %3322) : (!llvm.ptr, i64) -> i64
      %3324 = func.call @cc_intern(%3320, %3323) : (i64, i64) -> i64
      %3325 = func.call @cc_nil_value() : () -> i64
      %3326 = func.call @cc_cons(%3324, %3325) : (i64, i64) -> i64
      %3327 = func.call @cc_values_pack(%3326) : (i64) -> i64
      func.call @stack_push_pointer(%3324) : (i64) -> ()
      %3328 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3329 = arith.constant 8 : i64
      %3330 = func.call @cc_make_string(%3328, %3329) : (!llvm.ptr, i64) -> i64
      %3331 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3332 = arith.constant 11 : i64
      %3333 = func.call @cc_make_string(%3331, %3332) : (!llvm.ptr, i64) -> i64
      %3334 = func.call @cc_intern(%3330, %3333) : (i64, i64) -> i64
      %3335 = func.call @cc_nil_value() : () -> i64
      %3336 = func.call @cc_cons(%3334, %3335) : (i64, i64) -> i64
      %3337 = func.call @cc_values_pack(%3336) : (i64) -> i64
      func.call @stack_push_pointer(%3334) : (i64) -> ()
      %3338 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3339 = arith.constant 32 : i64
      %3340 = func.call @cc_make_string(%3338, %3339) : (!llvm.ptr, i64) -> i64
      %3341 = func.call @cc_nil_value() : () -> i64
      %3342 = func.call @cc_intern(%3340, %3341) : (i64, i64) -> i64
      %3343 = func.call @cc_nil_value() : () -> i64
      %3344 = func.call @cc_cons(%3342, %3343) : (i64, i64) -> i64
      %3345 = func.call @cc_values_pack(%3344) : (i64) -> i64
      func.call @stack_push_pointer(%3342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3346 = func.call @stack_pop_pointer() : () -> i64
      %3347 = func.call @stack_pop_pointer() : () -> i64
      %3348 = func.call @cc_cons(%3347, %3346) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3349 = arith.addi %3348, %__rlasp_stack_elide_zero_142 : i64
      %3350 = func.call @stack_pop_pointer() : () -> i64
      %3351 = func.call @cc_cons(%3350, %3349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3351) : (i64) -> ()
      %3352 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3353 = arith.constant 5 : i64
      %3354 = func.call @cc_make_string(%3352, %3353) : (!llvm.ptr, i64) -> i64
      %3355 = func.call @cc_nil_value() : () -> i64
      %3356 = func.call @cc_intern(%3354, %3355) : (i64, i64) -> i64
      %3357 = func.call @cc_nil_value() : () -> i64
      %3358 = func.call @cc_cons(%3356, %3357) : (i64, i64) -> i64
      %3359 = func.call @cc_values_pack(%3358) : (i64) -> i64
      func.call @stack_push_pointer(%3356) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3360 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3361 = arith.constant 32 : i64
      %3362 = func.call @cc_make_string(%3360, %3361) : (!llvm.ptr, i64) -> i64
      %3363 = func.call @cc_nil_value() : () -> i64
      %3364 = func.call @cc_intern(%3362, %3363) : (i64, i64) -> i64
      %3365 = func.call @cc_nil_value() : () -> i64
      %3366 = func.call @cc_cons(%3364, %3365) : (i64, i64) -> i64
      %3367 = func.call @cc_values_pack(%3366) : (i64) -> i64
      func.call @stack_push_pointer(%3364) : (i64) -> ()
      %3368 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3369 = arith.constant 6 : i64
      %3370 = func.call @cc_make_string(%3368, %3369) : (!llvm.ptr, i64) -> i64
      %3371 = func.call @cc_nil_value() : () -> i64
      %3372 = func.call @cc_intern(%3370, %3371) : (i64, i64) -> i64
      %3373 = func.call @cc_nil_value() : () -> i64
      %3374 = func.call @cc_cons(%3372, %3373) : (i64, i64) -> i64
      %3375 = func.call @cc_values_pack(%3374) : (i64) -> i64
      func.call @stack_push_pointer(%3372) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3376 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3377 = arith.constant 10 : i64
      %3378 = func.call @cc_make_string(%3376, %3377) : (!llvm.ptr, i64) -> i64
      %3379 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3380 = arith.constant 11 : i64
      %3381 = func.call @cc_make_string(%3379, %3380) : (!llvm.ptr, i64) -> i64
      %3382 = func.call @cc_intern(%3378, %3381) : (i64, i64) -> i64
      %3383 = func.call @cc_nil_value() : () -> i64
      %3384 = func.call @cc_cons(%3382, %3383) : (i64, i64) -> i64
      %3385 = func.call @cc_values_pack(%3384) : (i64) -> i64
      func.call @stack_push_pointer(%3382) : (i64) -> ()
      %3386 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3387 = arith.constant 5 : i64
      %3388 = func.call @cc_make_string(%3386, %3387) : (!llvm.ptr, i64) -> i64
      %3389 = func.call @cc_nil_value() : () -> i64
      %3390 = func.call @cc_intern(%3388, %3389) : (i64, i64) -> i64
      %3391 = func.call @cc_nil_value() : () -> i64
      %3392 = func.call @cc_cons(%3390, %3391) : (i64, i64) -> i64
      %3393 = func.call @cc_values_pack(%3392) : (i64) -> i64
      func.call @stack_push_pointer(%3390) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3394 = func.call @stack_pop_pointer() : () -> i64
      %3395 = func.call @stack_pop_pointer() : () -> i64
      %3396 = func.call @cc_cons(%3395, %3394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3396) : (i64) -> ()
      %3397 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3398 = arith.constant 9 : i64
      %3399 = func.call @cc_make_string(%3397, %3398) : (!llvm.ptr, i64) -> i64
      %3400 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3401 = arith.constant 11 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      %3403 = func.call @cc_intern(%3399, %3402) : (i64, i64) -> i64
      %3404 = func.call @cc_nil_value() : () -> i64
      %3405 = func.call @cc_cons(%3403, %3404) : (i64, i64) -> i64
      %3406 = func.call @cc_values_pack(%3405) : (i64) -> i64
      func.call @stack_push_pointer(%3403) : (i64) -> ()
      %3407 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3408 = arith.constant 6 : i64
      %3409 = func.call @cc_make_string(%3407, %3408) : (!llvm.ptr, i64) -> i64
      %3410 = func.call @cc_nil_value() : () -> i64
      %3411 = func.call @cc_intern(%3409, %3410) : (i64, i64) -> i64
      %3412 = func.call @cc_nil_value() : () -> i64
      %3413 = func.call @cc_cons(%3411, %3412) : (i64, i64) -> i64
      %3414 = func.call @cc_values_pack(%3413) : (i64) -> i64
      func.call @stack_push_pointer(%3411) : (i64) -> ()
      %3415 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3416 = arith.constant 5 : i64
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
      func.call @stack_push_pointer(%3425) : (i64) -> ()
      %3426 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3427 = arith.constant 2 : i64
      %3428 = func.call @cc_make_string(%3426, %3427) : (!llvm.ptr, i64) -> i64
      %3429 = func.call @cc_nil_value() : () -> i64
      %3430 = func.call @cc_intern(%3428, %3429) : (i64, i64) -> i64
      %3431 = func.call @cc_nil_value() : () -> i64
      %3432 = func.call @cc_cons(%3430, %3431) : (i64, i64) -> i64
      %3433 = func.call @cc_values_pack(%3432) : (i64) -> i64
      func.call @stack_push_pointer(%3430) : (i64) -> ()
      %3434 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3435 = arith.constant 2 : i64
      %3436 = func.call @cc_make_string(%3434, %3435) : (!llvm.ptr, i64) -> i64
      %3437 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3438 = arith.constant 11 : i64
      %3439 = func.call @cc_make_string(%3437, %3438) : (!llvm.ptr, i64) -> i64
      %3440 = func.call @cc_intern(%3436, %3439) : (i64, i64) -> i64
      %3441 = func.call @cc_nil_value() : () -> i64
      %3442 = func.call @cc_cons(%3440, %3441) : (i64, i64) -> i64
      %3443 = func.call @cc_values_pack(%3442) : (i64) -> i64
      func.call @stack_push_pointer(%3440) : (i64) -> ()
      %3444 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3445 = arith.constant 19 : i64
      %3446 = func.call @cc_make_string(%3444, %3445) : (!llvm.ptr, i64) -> i64
      %3447 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3448 = arith.constant 11 : i64
      %3449 = func.call @cc_make_string(%3447, %3448) : (!llvm.ptr, i64) -> i64
      %3450 = func.call @cc_intern(%3446, %3449) : (i64, i64) -> i64
      %3451 = func.call @cc_nil_value() : () -> i64
      %3452 = func.call @cc_cons(%3450, %3451) : (i64, i64) -> i64
      %3453 = func.call @cc_values_pack(%3452) : (i64) -> i64
      func.call @stack_push_pointer(%3450) : (i64) -> ()
      %3454 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3455 = arith.constant 5 : i64
      %3456 = func.call @cc_make_string(%3454, %3455) : (!llvm.ptr, i64) -> i64
      %3457 = func.call @cc_nil_value() : () -> i64
      %3458 = func.call @cc_intern(%3456, %3457) : (i64, i64) -> i64
      %3459 = func.call @cc_nil_value() : () -> i64
      %3460 = func.call @cc_cons(%3458, %3459) : (i64, i64) -> i64
      %3461 = func.call @cc_values_pack(%3460) : (i64) -> i64
      func.call @stack_push_pointer(%3458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3462 = func.call @stack_pop_pointer() : () -> i64
      %3463 = func.call @stack_pop_pointer() : () -> i64
      %3464 = func.call @cc_cons(%3463, %3462) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3465 = arith.addi %3464, %__rlasp_stack_elide_zero_143 : i64
      %3466 = func.call @stack_pop_pointer() : () -> i64
      %3467 = func.call @cc_cons(%3466, %3465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3467) : (i64) -> ()
      %3468 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3468) : (i64) -> ()
      %3469 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3470 = arith.constant 32 : i64
      %3471 = func.call @cc_make_string(%3469, %3470) : (!llvm.ptr, i64) -> i64
      %3472 = func.call @cc_nil_value() : () -> i64
      %3473 = func.call @cc_intern(%3471, %3472) : (i64, i64) -> i64
      %3474 = func.call @cc_nil_value() : () -> i64
      %3475 = func.call @cc_cons(%3473, %3474) : (i64, i64) -> i64
      %3476 = func.call @cc_values_pack(%3475) : (i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3477 = arith.addi %3473, %__rlasp_stack_elide_zero_144 : i64
      %3478 = func.call @stack_pop_pointer() : () -> i64
      %3479 = func.call @cc_cons(%3477, %3478) : (i64, i64) -> i64
      %3480 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3481 = arith.constant 5 : i64
      %3482 = func.call @cc_make_string(%3480, %3481) : (!llvm.ptr, i64) -> i64
      %3483 = func.call @cc_nil_value() : () -> i64
      %3484 = func.call @cc_intern(%3482, %3483) : (i64, i64) -> i64
      %3485 = func.call @cc_nil_value() : () -> i64
      %3486 = func.call @cc_cons(%3484, %3485) : (i64, i64) -> i64
      %3487 = func.call @cc_values_pack(%3486) : (i64) -> i64
      %3488 = func.call @cc_cons(%3484, %3479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3489 = func.call @stack_pop_pointer() : () -> i64
      %3490 = func.call @stack_pop_pointer() : () -> i64
      %3491 = func.call @cc_cons(%3490, %3489) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %3492 = arith.addi %3491, %__rlasp_stack_elide_zero_145 : i64
      %3493 = func.call @stack_pop_pointer() : () -> i64
      %3494 = func.call @cc_cons(%3493, %3492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %3495 = arith.addi %3494, %__rlasp_stack_elide_zero_146 : i64
      %3496 = func.call @stack_pop_pointer() : () -> i64
      %3497 = func.call @cc_cons(%3496, %3495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3497) : (i64) -> ()
      %3498 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3499 = arith.constant 5 : i64
      %3500 = func.call @cc_make_string(%3498, %3499) : (!llvm.ptr, i64) -> i64
      %3501 = func.call @cc_nil_value() : () -> i64
      %3502 = func.call @cc_intern(%3500, %3501) : (i64, i64) -> i64
      %3503 = func.call @cc_nil_value() : () -> i64
      %3504 = func.call @cc_cons(%3502, %3503) : (i64, i64) -> i64
      %3505 = func.call @cc_values_pack(%3504) : (i64) -> i64
      func.call @stack_push_pointer(%3502) : (i64) -> ()
      %3506 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3507 = arith.constant 11 : i64
      %3508 = func.call @cc_make_string(%3506, %3507) : (!llvm.ptr, i64) -> i64
      %3509 = func.call @cc_nil_value() : () -> i64
      %3510 = func.call @cc_intern(%3508, %3509) : (i64, i64) -> i64
      %3511 = func.call @cc_nil_value() : () -> i64
      %3512 = func.call @cc_cons(%3510, %3511) : (i64, i64) -> i64
      %3513 = func.call @cc_values_pack(%3512) : (i64) -> i64
      func.call @stack_push_pointer(%3510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3514 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3515 = arith.constant 14 : i64
      %3516 = func.call @cc_make_string(%3514, %3515) : (!llvm.ptr, i64) -> i64
      %3517 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3518 = arith.constant 11 : i64
      %3519 = func.call @cc_make_string(%3517, %3518) : (!llvm.ptr, i64) -> i64
      %3520 = func.call @cc_intern(%3516, %3519) : (i64, i64) -> i64
      %3521 = func.call @cc_nil_value() : () -> i64
      %3522 = func.call @cc_cons(%3520, %3521) : (i64, i64) -> i64
      %3523 = func.call @cc_values_pack(%3522) : (i64) -> i64
      func.call @stack_push_pointer(%3520) : (i64) -> ()
      %3524 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3525 = arith.constant 5 : i64
      %3526 = func.call @cc_make_string(%3524, %3525) : (!llvm.ptr, i64) -> i64
      %3527 = func.call @cc_nil_value() : () -> i64
      %3528 = func.call @cc_intern(%3526, %3527) : (i64, i64) -> i64
      %3529 = func.call @cc_nil_value() : () -> i64
      %3530 = func.call @cc_cons(%3528, %3529) : (i64, i64) -> i64
      %3531 = func.call @cc_values_pack(%3530) : (i64) -> i64
      func.call @stack_push_pointer(%3528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3532 = func.call @stack_pop_pointer() : () -> i64
      %3533 = func.call @stack_pop_pointer() : () -> i64
      %3534 = func.call @cc_cons(%3533, %3532) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %3535 = arith.addi %3534, %__rlasp_stack_elide_zero_147 : i64
      %3536 = func.call @stack_pop_pointer() : () -> i64
      %3537 = func.call @cc_cons(%3536, %3535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3538 = func.call @stack_pop_pointer() : () -> i64
      %3539 = func.call @stack_pop_pointer() : () -> i64
      %3540 = func.call @cc_cons(%3539, %3538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %3541 = arith.addi %3540, %__rlasp_stack_elide_zero_148 : i64
      %3542 = func.call @stack_pop_pointer() : () -> i64
      %3543 = func.call @cc_cons(%3542, %3541) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %3544 = arith.addi %3543, %__rlasp_stack_elide_zero_149 : i64
      %3545 = func.call @stack_pop_pointer() : () -> i64
      %3546 = func.call @cc_cons(%3545, %3544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3547 = func.call @stack_pop_pointer() : () -> i64
      %3548 = func.call @stack_pop_pointer() : () -> i64
      %3549 = func.call @cc_cons(%3548, %3547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %3550 = arith.addi %3549, %__rlasp_stack_elide_zero_150 : i64
      %3551 = func.call @stack_pop_pointer() : () -> i64
      %3552 = func.call @cc_cons(%3551, %3550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3553 = func.call @stack_pop_pointer() : () -> i64
      %3554 = func.call @stack_pop_pointer() : () -> i64
      %3555 = func.call @cc_cons(%3554, %3553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %3556 = arith.addi %3555, %__rlasp_stack_elide_zero_151 : i64
      %3557 = func.call @stack_pop_pointer() : () -> i64
      %3558 = func.call @cc_cons(%3557, %3556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %3559 = arith.addi %3558, %__rlasp_stack_elide_zero_152 : i64
      %3560 = func.call @stack_pop_pointer() : () -> i64
      %3561 = func.call @cc_cons(%3560, %3559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %3562 = arith.addi %3561, %__rlasp_stack_elide_zero_153 : i64
      %3563 = func.call @stack_pop_pointer() : () -> i64
      %3564 = func.call @cc_cons(%3563, %3562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3564) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3565 = func.call @stack_pop_pointer() : () -> i64
      %3566 = func.call @stack_pop_pointer() : () -> i64
      %3567 = func.call @cc_cons(%3566, %3565) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %3568 = arith.addi %3567, %__rlasp_stack_elide_zero_154 : i64
      %3569 = func.call @stack_pop_pointer() : () -> i64
      %3570 = func.call @cc_cons(%3569, %3568) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %3571 = arith.addi %3570, %__rlasp_stack_elide_zero_155 : i64
      %3572 = func.call @stack_pop_pointer() : () -> i64
      %3573 = func.call @cc_cons(%3572, %3571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3573) : (i64) -> ()
      %3574 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3575 = arith.constant 5 : i64
      %3576 = func.call @cc_make_string(%3574, %3575) : (!llvm.ptr, i64) -> i64
      %3577 = func.call @cc_nil_value() : () -> i64
      %3578 = func.call @cc_intern(%3576, %3577) : (i64, i64) -> i64
      %3579 = func.call @cc_nil_value() : () -> i64
      %3580 = func.call @cc_cons(%3578, %3579) : (i64, i64) -> i64
      %3581 = func.call @cc_values_pack(%3580) : (i64) -> i64
      func.call @stack_push_pointer(%3578) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @stack_pop_pointer() : () -> i64
      %3584 = func.call @cc_cons(%3583, %3582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %3585 = arith.addi %3584, %__rlasp_stack_elide_zero_156 : i64
      %3586 = func.call @stack_pop_pointer() : () -> i64
      %3587 = func.call @cc_cons(%3586, %3585) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %3588 = arith.addi %3587, %__rlasp_stack_elide_zero_157 : i64
      %3589 = func.call @stack_pop_pointer() : () -> i64
      %3590 = func.call @cc_cons(%3589, %3588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3590) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3591 = func.call @stack_pop_pointer() : () -> i64
      %3592 = func.call @stack_pop_pointer() : () -> i64
      %3593 = func.call @cc_cons(%3592, %3591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %3594 = arith.addi %3593, %__rlasp_stack_elide_zero_158 : i64
      %3595 = func.call @stack_pop_pointer() : () -> i64
      %3596 = func.call @cc_cons(%3595, %3594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %3597 = arith.addi %3596, %__rlasp_stack_elide_zero_159 : i64
      %3598 = func.call @stack_pop_pointer() : () -> i64
      %3599 = func.call @cc_cons(%3598, %3597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3600 = func.call @stack_pop_pointer() : () -> i64
      %3601 = func.call @stack_pop_pointer() : () -> i64
      %3602 = func.call @cc_cons(%3601, %3600) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %3603 = arith.addi %3602, %__rlasp_stack_elide_zero_160 : i64
      %3604 = func.call @stack_pop_pointer() : () -> i64
      %3605 = func.call @cc_cons(%3604, %3603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %3606 = arith.addi %3605, %__rlasp_stack_elide_zero_161 : i64
      %3607 = func.call @stack_pop_pointer() : () -> i64
      %3608 = func.call @cc_cons(%3607, %3606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3608) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3609 = func.call @stack_pop_pointer() : () -> i64
      %3610 = func.call @stack_pop_pointer() : () -> i64
      %3611 = func.call @cc_cons(%3610, %3609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %3612 = arith.addi %3611, %__rlasp_stack_elide_zero_162 : i64
      %3613 = func.call @stack_pop_pointer() : () -> i64
      %3614 = func.call @cc_cons(%3613, %3612) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %3615 = arith.addi %3614, %__rlasp_stack_elide_zero_163 : i64
      %3616 = func.call @stack_pop_pointer() : () -> i64
      %3617 = func.call @cc_cons(%3616, %3615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3618 = func.call @stack_pop_pointer() : () -> i64
      %3619 = func.call @stack_pop_pointer() : () -> i64
      %3620 = func.call @cc_cons(%3619, %3618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %3621 = arith.addi %3620, %__rlasp_stack_elide_zero_164 : i64
      %3622 = func.call @stack_pop_pointer() : () -> i64
      %3623 = func.call @cc_cons(%3622, %3621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %3624 = arith.addi %3623, %__rlasp_stack_elide_zero_165 : i64
      %3625 = func.call @stack_pop_pointer() : () -> i64
      %3626 = func.call @cc_cons(%3625, %3624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3627 = func.call @stack_pop_pointer() : () -> i64
      %3628 = func.call @stack_pop_pointer() : () -> i64
      %3629 = func.call @cc_cons(%3628, %3627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %3630 = arith.addi %3629, %__rlasp_stack_elide_zero_166 : i64
      %3631 = func.call @stack_pop_pointer() : () -> i64
      %3632 = func.call @cc_cons(%3631, %3630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %3633 = arith.addi %3632, %__rlasp_stack_elide_zero_167 : i64
      %3634 = func.call @stack_pop_pointer() : () -> i64
      %3635 = func.call @cc_cons(%3634, %3633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3636 = func.call @stack_pop_pointer() : () -> i64
      %3637 = func.call @stack_pop_pointer() : () -> i64
      %3638 = func.call @cc_cons(%3637, %3636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %3639 = arith.addi %3638, %__rlasp_stack_elide_zero_168 : i64
      %3640 = func.call @stack_pop_pointer() : () -> i64
      %3641 = func.call @cc_cons(%3640, %3639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3642 = func.call @stack_pop_pointer() : () -> i64
      %3643 = func.call @stack_pop_pointer() : () -> i64
      %3644 = func.call @cc_cons(%3643, %3642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %3645 = arith.addi %3644, %__rlasp_stack_elide_zero_169 : i64
      %3646 = func.call @stack_pop_pointer() : () -> i64
      %3647 = func.call @cc_cons(%3646, %3645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %3648 = arith.addi %3647, %__rlasp_stack_elide_zero_170 : i64
      %3861 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3862 = arith.constant 33 : i64
      %3863 = func.call @cc_make_symbol(%3861, %3862) : (!llvm.ptr, i64) -> i64
      %3864 = func.call @cc_persistent_root_value(%3863) : (i64) -> i64
      func.call @stack_push_pointer(%3864) : (i64) -> ()
      %3865 = arith.constant 97047688511518 : i64
      %3866 = arith.constant 1 : i64
      %3867 = func.call @cc_make_closure(%3865, %3866) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %3868 = arith.addi %3867, %__rlasp_stack_elide_zero_171 : i64
      %3869 = llvm.mlir.addressof @str321 : !llvm.ptr
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
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %3880 = arith.addi %3879, %__rlasp_stack_elide_zero_172 : i64
      %3881 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3882 = arith.constant 11 : i64
      %3883 = func.call @cc_make_string(%3881, %3882) : (!llvm.ptr, i64) -> i64
      %3884 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3885 = arith.constant 7 : i64
      %3886 = func.call @cc_make_string(%3884, %3885) : (!llvm.ptr, i64) -> i64
      %3887 = func.call @cc_intern(%3883, %3886) : (i64, i64) -> i64
      %3888 = func.call @cc_nil_value() : () -> i64
      %3889 = func.call @cc_cons(%3887, %3888) : (i64, i64) -> i64
      %3890 = func.call @cc_values_pack(%3889) : (i64) -> i64
      %3891 = func.call @cc_nil_value() : () -> i64
      %3892 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3893 = arith.constant 4 : i64
      %3894 = func.call @cc_make_string(%3892, %3893) : (!llvm.ptr, i64) -> i64
      %3895 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3896 = arith.constant 7 : i64
      %3897 = func.call @cc_make_string(%3895, %3896) : (!llvm.ptr, i64) -> i64
      %3898 = func.call @cc_intern(%3894, %3897) : (i64, i64) -> i64
      %3899 = func.call @cc_nil_value() : () -> i64
      %3900 = func.call @cc_cons(%3898, %3899) : (i64, i64) -> i64
      %3901 = func.call @cc_values_pack(%3900) : (i64) -> i64
      %3902 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3903 = arith.constant 6 : i64
      %3904 = func.call @cc_make_string(%3902, %3903) : (!llvm.ptr, i64) -> i64
      %3905 = func.call @cc_nil_value() : () -> i64
      %3906 = func.call @cc_intern(%3904, %3905) : (i64, i64) -> i64
      %3907 = func.call @cc_nil_value() : () -> i64
      %3908 = func.call @cc_cons(%3906, %3907) : (i64, i64) -> i64
      %3909 = func.call @cc_values_pack(%3908) : (i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %3910 = arith.addi %3906, %__rlasp_stack_elide_zero_173 : i64
      %3911 = func.call @cc_nil_value() : () -> i64
      %3912 = func.call @cc_errorp(%3301) : (i64) -> i64
      %3913 = arith.cmpi ne, %3912, %3911 : i64
      %3914 = arith.cmpi eq, %3911, %3911 : i64
      %3915 = arith.andi %3913, %3914 : i1
      %3916 = scf.if %3915 -> (i64) {
        scf.yield %3301 : i64
      } else {
        scf.yield %3911 : i64
      }
      %3917 = func.call @cc_errorp(%3648) : (i64) -> i64
      %3918 = arith.cmpi ne, %3917, %3911 : i64
      %3919 = arith.cmpi eq, %3916, %3911 : i64
      %3920 = arith.andi %3918, %3919 : i1
      %3921 = scf.if %3920 -> (i64) {
        scf.yield %3648 : i64
      } else {
        scf.yield %3916 : i64
      }
      %3922 = func.call @cc_errorp(%3868) : (i64) -> i64
      %3923 = arith.cmpi ne, %3922, %3911 : i64
      %3924 = arith.cmpi eq, %3921, %3911 : i64
      %3925 = arith.andi %3923, %3924 : i1
      %3926 = scf.if %3925 -> (i64) {
        scf.yield %3868 : i64
      } else {
        scf.yield %3921 : i64
      }
      %3927 = func.call @cc_errorp(%3880) : (i64) -> i64
      %3928 = arith.cmpi ne, %3927, %3911 : i64
      %3929 = arith.cmpi eq, %3926, %3911 : i64
      %3930 = arith.andi %3928, %3929 : i1
      %3931 = scf.if %3930 -> (i64) {
        scf.yield %3880 : i64
      } else {
        scf.yield %3926 : i64
      }
      %3932 = func.call @cc_errorp(%3887) : (i64) -> i64
      %3933 = arith.cmpi ne, %3932, %3911 : i64
      %3934 = arith.cmpi eq, %3931, %3911 : i64
      %3935 = arith.andi %3933, %3934 : i1
      %3936 = scf.if %3935 -> (i64) {
        scf.yield %3887 : i64
      } else {
        scf.yield %3931 : i64
      }
      %3937 = func.call @cc_errorp(%3891) : (i64) -> i64
      %3938 = arith.cmpi ne, %3937, %3911 : i64
      %3939 = arith.cmpi eq, %3936, %3911 : i64
      %3940 = arith.andi %3938, %3939 : i1
      %3941 = scf.if %3940 -> (i64) {
        scf.yield %3891 : i64
      } else {
        scf.yield %3936 : i64
      }
      %3942 = func.call @cc_errorp(%3898) : (i64) -> i64
      %3943 = arith.cmpi ne, %3942, %3911 : i64
      %3944 = arith.cmpi eq, %3941, %3911 : i64
      %3945 = arith.andi %3943, %3944 : i1
      %3946 = scf.if %3945 -> (i64) {
        scf.yield %3898 : i64
      } else {
        scf.yield %3941 : i64
      }
      %3947 = func.call @cc_errorp(%3910) : (i64) -> i64
      %3948 = arith.cmpi ne, %3947, %3911 : i64
      %3949 = arith.cmpi eq, %3946, %3911 : i64
      %3950 = arith.andi %3948, %3949 : i1
      %3951 = scf.if %3950 -> (i64) {
        scf.yield %3910 : i64
      } else {
        scf.yield %3946 : i64
      }
      %3952 = arith.cmpi ne, %3951, %3911 : i64
      scf.if %3952 {
        func.call @stack_push_pointer(%3951) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3301) : (i64) -> ()
        func.call @stack_push_pointer(%3648) : (i64) -> ()
        func.call @stack_push_pointer(%3868) : (i64) -> ()
        func.call @stack_push_pointer(%3880) : (i64) -> ()
        func.call @stack_push_pointer(%3887) : (i64) -> ()
        func.call @stack_push_pointer(%3891) : (i64) -> ()
        func.call @stack_push_pointer(%3898) : (i64) -> ()
        func.call @stack_push_pointer(%3910) : (i64) -> ()
        %3953 = llvm.mlir.addressof @str327 : !llvm.ptr
        %3954 = func.call @cc_make_function_ref_const(%3953) : (!llvm.ptr) -> i64
        %3955 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3954, %3955) : (i64, i64) -> ()
      }
      %3956 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3956 : i64
    }
    %3957 = func.call @cc_nil_value() : () -> i64
    %3958 = func.call @cc_errorp(%3292) : (i64) -> i64
    %3959 = arith.cmpi ne, %3958, %3957 : i64
    %3960 = scf.if %3959 -> (i64) {
      scf.yield %3292 : i64
    } else {
      %3961 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3962 = arith.constant 26 : i64
      %3963 = func.call @cc_make_string(%3961, %3962) : (!llvm.ptr, i64) -> i64
      %3964 = func.call @cc_nil_value() : () -> i64
      %3965 = func.call @cc_intern(%3963, %3964) : (i64, i64) -> i64
      %3966 = func.call @cc_nil_value() : () -> i64
      %3967 = func.call @cc_cons(%3965, %3966) : (i64, i64) -> i64
      %3968 = func.call @cc_values_pack(%3967) : (i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %3969 = arith.addi %3965, %__rlasp_stack_elide_zero_174 : i64
      %3970 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3971 = arith.constant 5 : i64
      %3972 = func.call @cc_make_string(%3970, %3971) : (!llvm.ptr, i64) -> i64
      %3973 = func.call @cc_nil_value() : () -> i64
      %3974 = func.call @cc_intern(%3972, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_nil_value() : () -> i64
      %3976 = func.call @cc_cons(%3974, %3975) : (i64, i64) -> i64
      %3977 = func.call @cc_values_pack(%3976) : (i64) -> i64
      func.call @stack_push_pointer(%3974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3978 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3979 = arith.constant 32 : i64
      %3980 = func.call @cc_make_string(%3978, %3979) : (!llvm.ptr, i64) -> i64
      %3981 = func.call @cc_nil_value() : () -> i64
      %3982 = func.call @cc_intern(%3980, %3981) : (i64, i64) -> i64
      %3983 = func.call @cc_nil_value() : () -> i64
      %3984 = func.call @cc_cons(%3982, %3983) : (i64, i64) -> i64
      %3985 = func.call @cc_values_pack(%3984) : (i64) -> i64
      func.call @stack_push_pointer(%3982) : (i64) -> ()
      %3986 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3987 = arith.constant 6 : i64
      %3988 = func.call @cc_make_string(%3986, %3987) : (!llvm.ptr, i64) -> i64
      %3989 = func.call @cc_nil_value() : () -> i64
      %3990 = func.call @cc_intern(%3988, %3989) : (i64, i64) -> i64
      %3991 = func.call @cc_nil_value() : () -> i64
      %3992 = func.call @cc_cons(%3990, %3991) : (i64, i64) -> i64
      %3993 = func.call @cc_values_pack(%3992) : (i64) -> i64
      func.call @stack_push_pointer(%3990) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3994 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3995 = arith.constant 10 : i64
      %3996 = func.call @cc_make_string(%3994, %3995) : (!llvm.ptr, i64) -> i64
      %3997 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3998 = arith.constant 11 : i64
      %3999 = func.call @cc_make_string(%3997, %3998) : (!llvm.ptr, i64) -> i64
      %4000 = func.call @cc_intern(%3996, %3999) : (i64, i64) -> i64
      %4001 = func.call @cc_nil_value() : () -> i64
      %4002 = func.call @cc_cons(%4000, %4001) : (i64, i64) -> i64
      %4003 = func.call @cc_values_pack(%4002) : (i64) -> i64
      func.call @stack_push_pointer(%4000) : (i64) -> ()
      %4004 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4005 = arith.constant 5 : i64
      %4006 = func.call @cc_make_string(%4004, %4005) : (!llvm.ptr, i64) -> i64
      %4007 = func.call @cc_nil_value() : () -> i64
      %4008 = func.call @cc_intern(%4006, %4007) : (i64, i64) -> i64
      %4009 = func.call @cc_nil_value() : () -> i64
      %4010 = func.call @cc_cons(%4008, %4009) : (i64, i64) -> i64
      %4011 = func.call @cc_values_pack(%4010) : (i64) -> i64
      func.call @stack_push_pointer(%4008) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4012 = func.call @stack_pop_pointer() : () -> i64
      %4013 = func.call @stack_pop_pointer() : () -> i64
      %4014 = func.call @cc_cons(%4013, %4012) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4014) : (i64) -> ()
      %4015 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4016 = arith.constant 9 : i64
      %4017 = func.call @cc_make_string(%4015, %4016) : (!llvm.ptr, i64) -> i64
      %4018 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4019 = arith.constant 11 : i64
      %4020 = func.call @cc_make_string(%4018, %4019) : (!llvm.ptr, i64) -> i64
      %4021 = func.call @cc_intern(%4017, %4020) : (i64, i64) -> i64
      %4022 = func.call @cc_nil_value() : () -> i64
      %4023 = func.call @cc_cons(%4021, %4022) : (i64, i64) -> i64
      %4024 = func.call @cc_values_pack(%4023) : (i64) -> i64
      func.call @stack_push_pointer(%4021) : (i64) -> ()
      %4025 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4026 = arith.constant 6 : i64
      %4027 = func.call @cc_make_string(%4025, %4026) : (!llvm.ptr, i64) -> i64
      %4028 = func.call @cc_nil_value() : () -> i64
      %4029 = func.call @cc_intern(%4027, %4028) : (i64, i64) -> i64
      %4030 = func.call @cc_nil_value() : () -> i64
      %4031 = func.call @cc_cons(%4029, %4030) : (i64, i64) -> i64
      %4032 = func.call @cc_values_pack(%4031) : (i64) -> i64
      func.call @stack_push_pointer(%4029) : (i64) -> ()
      %4033 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4034 = arith.constant 5 : i64
      %4035 = func.call @cc_make_string(%4033, %4034) : (!llvm.ptr, i64) -> i64
      %4036 = func.call @cc_nil_value() : () -> i64
      %4037 = func.call @cc_intern(%4035, %4036) : (i64, i64) -> i64
      %4038 = func.call @cc_nil_value() : () -> i64
      %4039 = func.call @cc_cons(%4037, %4038) : (i64, i64) -> i64
      %4040 = func.call @cc_values_pack(%4039) : (i64) -> i64
      func.call @stack_push_pointer(%4037) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4041 = func.call @stack_pop_pointer() : () -> i64
      %4042 = func.call @stack_pop_pointer() : () -> i64
      %4043 = func.call @cc_cons(%4042, %4041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4043) : (i64) -> ()
      %4044 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4045 = arith.constant 2 : i64
      %4046 = func.call @cc_make_string(%4044, %4045) : (!llvm.ptr, i64) -> i64
      %4047 = func.call @cc_nil_value() : () -> i64
      %4048 = func.call @cc_intern(%4046, %4047) : (i64, i64) -> i64
      %4049 = func.call @cc_nil_value() : () -> i64
      %4050 = func.call @cc_cons(%4048, %4049) : (i64, i64) -> i64
      %4051 = func.call @cc_values_pack(%4050) : (i64) -> i64
      func.call @stack_push_pointer(%4048) : (i64) -> ()
      %4052 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4053 = arith.constant 2 : i64
      %4054 = func.call @cc_make_string(%4052, %4053) : (!llvm.ptr, i64) -> i64
      %4055 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4056 = arith.constant 11 : i64
      %4057 = func.call @cc_make_string(%4055, %4056) : (!llvm.ptr, i64) -> i64
      %4058 = func.call @cc_intern(%4054, %4057) : (i64, i64) -> i64
      %4059 = func.call @cc_nil_value() : () -> i64
      %4060 = func.call @cc_cons(%4058, %4059) : (i64, i64) -> i64
      %4061 = func.call @cc_values_pack(%4060) : (i64) -> i64
      func.call @stack_push_pointer(%4058) : (i64) -> ()
      %4062 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4063 = arith.constant 19 : i64
      %4064 = func.call @cc_make_string(%4062, %4063) : (!llvm.ptr, i64) -> i64
      %4065 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4066 = arith.constant 11 : i64
      %4067 = func.call @cc_make_string(%4065, %4066) : (!llvm.ptr, i64) -> i64
      %4068 = func.call @cc_intern(%4064, %4067) : (i64, i64) -> i64
      %4069 = func.call @cc_nil_value() : () -> i64
      %4070 = func.call @cc_cons(%4068, %4069) : (i64, i64) -> i64
      %4071 = func.call @cc_values_pack(%4070) : (i64) -> i64
      func.call @stack_push_pointer(%4068) : (i64) -> ()
      %4072 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4073 = arith.constant 5 : i64
      %4074 = func.call @cc_make_string(%4072, %4073) : (!llvm.ptr, i64) -> i64
      %4075 = func.call @cc_nil_value() : () -> i64
      %4076 = func.call @cc_intern(%4074, %4075) : (i64, i64) -> i64
      %4077 = func.call @cc_nil_value() : () -> i64
      %4078 = func.call @cc_cons(%4076, %4077) : (i64, i64) -> i64
      %4079 = func.call @cc_values_pack(%4078) : (i64) -> i64
      func.call @stack_push_pointer(%4076) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4080 = func.call @stack_pop_pointer() : () -> i64
      %4081 = func.call @stack_pop_pointer() : () -> i64
      %4082 = func.call @cc_cons(%4081, %4080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %4083 = arith.addi %4082, %__rlasp_stack_elide_zero_175 : i64
      %4084 = func.call @stack_pop_pointer() : () -> i64
      %4085 = func.call @cc_cons(%4084, %4083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4085) : (i64) -> ()
      %4086 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4086) : (i64) -> ()
      %4087 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4088 = arith.constant 32 : i64
      %4089 = func.call @cc_make_string(%4087, %4088) : (!llvm.ptr, i64) -> i64
      %4090 = func.call @cc_nil_value() : () -> i64
      %4091 = func.call @cc_intern(%4089, %4090) : (i64, i64) -> i64
      %4092 = func.call @cc_nil_value() : () -> i64
      %4093 = func.call @cc_cons(%4091, %4092) : (i64, i64) -> i64
      %4094 = func.call @cc_values_pack(%4093) : (i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %4095 = arith.addi %4091, %__rlasp_stack_elide_zero_176 : i64
      %4096 = func.call @stack_pop_pointer() : () -> i64
      %4097 = func.call @cc_cons(%4095, %4096) : (i64, i64) -> i64
      %4098 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4099 = arith.constant 5 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = func.call @cc_nil_value() : () -> i64
      %4102 = func.call @cc_intern(%4100, %4101) : (i64, i64) -> i64
      %4103 = func.call @cc_nil_value() : () -> i64
      %4104 = func.call @cc_cons(%4102, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_values_pack(%4104) : (i64) -> i64
      %4106 = func.call @cc_cons(%4102, %4097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4106) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4107 = func.call @stack_pop_pointer() : () -> i64
      %4108 = func.call @stack_pop_pointer() : () -> i64
      %4109 = func.call @cc_cons(%4108, %4107) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %4110 = arith.addi %4109, %__rlasp_stack_elide_zero_177 : i64
      %4111 = func.call @stack_pop_pointer() : () -> i64
      %4112 = func.call @cc_cons(%4111, %4110) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %4113 = arith.addi %4112, %__rlasp_stack_elide_zero_178 : i64
      %4114 = func.call @stack_pop_pointer() : () -> i64
      %4115 = func.call @cc_cons(%4114, %4113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4115) : (i64) -> ()
      %4116 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4117 = arith.constant 5 : i64
      %4118 = func.call @cc_make_string(%4116, %4117) : (!llvm.ptr, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_intern(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_nil_value() : () -> i64
      %4122 = func.call @cc_cons(%4120, %4121) : (i64, i64) -> i64
      %4123 = func.call @cc_values_pack(%4122) : (i64) -> i64
      func.call @stack_push_pointer(%4120) : (i64) -> ()
      %4124 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4125 = arith.constant 11 : i64
      %4126 = func.call @cc_make_string(%4124, %4125) : (!llvm.ptr, i64) -> i64
      %4127 = func.call @cc_nil_value() : () -> i64
      %4128 = func.call @cc_intern(%4126, %4127) : (i64, i64) -> i64
      %4129 = func.call @cc_nil_value() : () -> i64
      %4130 = func.call @cc_cons(%4128, %4129) : (i64, i64) -> i64
      %4131 = func.call @cc_values_pack(%4130) : (i64) -> i64
      func.call @stack_push_pointer(%4128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4132 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4133 = arith.constant 26 : i64
      %4134 = func.call @cc_make_string(%4132, %4133) : (!llvm.ptr, i64) -> i64
      %4135 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4136 = arith.constant 11 : i64
      %4137 = func.call @cc_make_string(%4135, %4136) : (!llvm.ptr, i64) -> i64
      %4138 = func.call @cc_intern(%4134, %4137) : (i64, i64) -> i64
      %4139 = func.call @cc_nil_value() : () -> i64
      %4140 = func.call @cc_cons(%4138, %4139) : (i64, i64) -> i64
      %4141 = func.call @cc_values_pack(%4140) : (i64) -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4142 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4143 = arith.constant 5 : i64
      %4144 = func.call @cc_make_string(%4142, %4143) : (!llvm.ptr, i64) -> i64
      %4145 = func.call @cc_nil_value() : () -> i64
      %4146 = func.call @cc_intern(%4144, %4145) : (i64, i64) -> i64
      %4147 = func.call @cc_nil_value() : () -> i64
      %4148 = func.call @cc_cons(%4146, %4147) : (i64, i64) -> i64
      %4149 = func.call @cc_values_pack(%4148) : (i64) -> i64
      func.call @stack_push_pointer(%4146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4150 = func.call @stack_pop_pointer() : () -> i64
      %4151 = func.call @stack_pop_pointer() : () -> i64
      %4152 = func.call @cc_cons(%4151, %4150) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
      %4153 = arith.addi %4152, %__rlasp_stack_elide_zero_179 : i64
      %4154 = func.call @stack_pop_pointer() : () -> i64
      %4155 = func.call @cc_cons(%4154, %4153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4156 = func.call @stack_pop_pointer() : () -> i64
      %4157 = func.call @stack_pop_pointer() : () -> i64
      %4158 = func.call @cc_cons(%4157, %4156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
      %4159 = arith.addi %4158, %__rlasp_stack_elide_zero_180 : i64
      %4160 = func.call @stack_pop_pointer() : () -> i64
      %4161 = func.call @cc_cons(%4160, %4159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
      %4162 = arith.addi %4161, %__rlasp_stack_elide_zero_181 : i64
      %4163 = func.call @stack_pop_pointer() : () -> i64
      %4164 = func.call @cc_cons(%4163, %4162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @stack_pop_pointer() : () -> i64
      %4167 = func.call @cc_cons(%4166, %4165) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
      %4168 = arith.addi %4167, %__rlasp_stack_elide_zero_182 : i64
      %4169 = func.call @stack_pop_pointer() : () -> i64
      %4170 = func.call @cc_cons(%4169, %4168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4170) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4171 = func.call @stack_pop_pointer() : () -> i64
      %4172 = func.call @stack_pop_pointer() : () -> i64
      %4173 = func.call @cc_cons(%4172, %4171) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
      %4174 = arith.addi %4173, %__rlasp_stack_elide_zero_183 : i64
      %4175 = func.call @stack_pop_pointer() : () -> i64
      %4176 = func.call @cc_cons(%4175, %4174) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %4177 = arith.addi %4176, %__rlasp_stack_elide_zero_184 : i64
      %4178 = func.call @stack_pop_pointer() : () -> i64
      %4179 = func.call @cc_cons(%4178, %4177) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %4180 = arith.addi %4179, %__rlasp_stack_elide_zero_185 : i64
      %4181 = func.call @stack_pop_pointer() : () -> i64
      %4182 = func.call @cc_cons(%4181, %4180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4182) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4183 = func.call @stack_pop_pointer() : () -> i64
      %4184 = func.call @stack_pop_pointer() : () -> i64
      %4185 = func.call @cc_cons(%4184, %4183) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %4186 = arith.addi %4185, %__rlasp_stack_elide_zero_186 : i64
      %4187 = func.call @stack_pop_pointer() : () -> i64
      %4188 = func.call @cc_cons(%4187, %4186) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %4189 = arith.addi %4188, %__rlasp_stack_elide_zero_187 : i64
      %4190 = func.call @stack_pop_pointer() : () -> i64
      %4191 = func.call @cc_cons(%4190, %4189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4191) : (i64) -> ()
      %4192 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4193 = arith.constant 5 : i64
      %4194 = func.call @cc_make_string(%4192, %4193) : (!llvm.ptr, i64) -> i64
      %4195 = func.call @cc_nil_value() : () -> i64
      %4196 = func.call @cc_intern(%4194, %4195) : (i64, i64) -> i64
      %4197 = func.call @cc_nil_value() : () -> i64
      %4198 = func.call @cc_cons(%4196, %4197) : (i64, i64) -> i64
      %4199 = func.call @cc_values_pack(%4198) : (i64) -> i64
      func.call @stack_push_pointer(%4196) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4200 = func.call @stack_pop_pointer() : () -> i64
      %4201 = func.call @stack_pop_pointer() : () -> i64
      %4202 = func.call @cc_cons(%4201, %4200) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %4203 = arith.addi %4202, %__rlasp_stack_elide_zero_188 : i64
      %4204 = func.call @stack_pop_pointer() : () -> i64
      %4205 = func.call @cc_cons(%4204, %4203) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %4206 = arith.addi %4205, %__rlasp_stack_elide_zero_189 : i64
      %4207 = func.call @stack_pop_pointer() : () -> i64
      %4208 = func.call @cc_cons(%4207, %4206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4208) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4209 = func.call @stack_pop_pointer() : () -> i64
      %4210 = func.call @stack_pop_pointer() : () -> i64
      %4211 = func.call @cc_cons(%4210, %4209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %4212 = arith.addi %4211, %__rlasp_stack_elide_zero_190 : i64
      %4213 = func.call @stack_pop_pointer() : () -> i64
      %4214 = func.call @cc_cons(%4213, %4212) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %4215 = arith.addi %4214, %__rlasp_stack_elide_zero_191 : i64
      %4216 = func.call @stack_pop_pointer() : () -> i64
      %4217 = func.call @cc_cons(%4216, %4215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4217) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4218 = func.call @stack_pop_pointer() : () -> i64
      %4219 = func.call @stack_pop_pointer() : () -> i64
      %4220 = func.call @cc_cons(%4219, %4218) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %4221 = arith.addi %4220, %__rlasp_stack_elide_zero_192 : i64
      %4222 = func.call @stack_pop_pointer() : () -> i64
      %4223 = func.call @cc_cons(%4222, %4221) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %4224 = arith.addi %4223, %__rlasp_stack_elide_zero_193 : i64
      %4225 = func.call @stack_pop_pointer() : () -> i64
      %4226 = func.call @cc_cons(%4225, %4224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4226) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4227 = func.call @stack_pop_pointer() : () -> i64
      %4228 = func.call @stack_pop_pointer() : () -> i64
      %4229 = func.call @cc_cons(%4228, %4227) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %4230 = arith.addi %4229, %__rlasp_stack_elide_zero_194 : i64
      %4231 = func.call @stack_pop_pointer() : () -> i64
      %4232 = func.call @cc_cons(%4231, %4230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %4233 = arith.addi %4232, %__rlasp_stack_elide_zero_195 : i64
      %4234 = func.call @stack_pop_pointer() : () -> i64
      %4235 = func.call @cc_cons(%4234, %4233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4235) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4236 = func.call @stack_pop_pointer() : () -> i64
      %4237 = func.call @stack_pop_pointer() : () -> i64
      %4238 = func.call @cc_cons(%4237, %4236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %4239 = arith.addi %4238, %__rlasp_stack_elide_zero_196 : i64
      %4240 = func.call @stack_pop_pointer() : () -> i64
      %4241 = func.call @cc_cons(%4240, %4239) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %4242 = arith.addi %4241, %__rlasp_stack_elide_zero_197 : i64
      %4243 = func.call @stack_pop_pointer() : () -> i64
      %4244 = func.call @cc_cons(%4243, %4242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %4245 = arith.addi %4244, %__rlasp_stack_elide_zero_198 : i64
      %4445 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4446 = arith.constant 33 : i64
      %4447 = func.call @cc_make_symbol(%4445, %4446) : (!llvm.ptr, i64) -> i64
      %4448 = func.call @cc_persistent_root_value(%4447) : (i64) -> i64
      func.call @stack_push_pointer(%4448) : (i64) -> ()
      %4449 = arith.constant 97047688511523 : i64
      %4450 = arith.constant 1 : i64
      %4451 = func.call @cc_make_closure(%4449, %4450) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %4452 = arith.addi %4451, %__rlasp_stack_elide_zero_199 : i64
      %4453 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4454 = arith.constant 1 : i64
      %4455 = func.call @cc_make_string(%4453, %4454) : (!llvm.ptr, i64) -> i64
      %4456 = func.call @cc_nil_value() : () -> i64
      %4457 = func.call @cc_intern(%4455, %4456) : (i64, i64) -> i64
      %4458 = func.call @cc_nil_value() : () -> i64
      %4459 = func.call @cc_cons(%4457, %4458) : (i64, i64) -> i64
      %4460 = func.call @cc_values_pack(%4459) : (i64) -> i64
      func.call @stack_push_pointer(%4457) : (i64) -> ()
      %4461 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4462 = arith.constant 1 : i64
      %4463 = func.call @cc_make_string(%4461, %4462) : (!llvm.ptr, i64) -> i64
      %4464 = func.call @cc_nil_value() : () -> i64
      %4465 = func.call @cc_intern(%4463, %4464) : (i64, i64) -> i64
      %4466 = func.call @cc_nil_value() : () -> i64
      %4467 = func.call @cc_cons(%4465, %4466) : (i64, i64) -> i64
      %4468 = func.call @cc_values_pack(%4467) : (i64) -> i64
      func.call @stack_push_pointer(%4465) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4469 = func.call @stack_pop_pointer() : () -> i64
      %4470 = func.call @stack_pop_pointer() : () -> i64
      %4471 = func.call @cc_cons(%4470, %4469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %4472 = arith.addi %4471, %__rlasp_stack_elide_zero_200 : i64
      %4473 = func.call @stack_pop_pointer() : () -> i64
      %4474 = func.call @cc_cons(%4473, %4472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4474) : (i64) -> ()
      %4475 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4476 = func.call @stack_pop_pointer() : () -> i64
      %4477 = func.call @stack_pop_pointer() : () -> i64
      %4478 = func.call @cc_cons(%4477, %4476) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %4479 = arith.addi %4478, %__rlasp_stack_elide_zero_201 : i64
      %4480 = func.call @stack_pop_pointer() : () -> i64
      %4481 = func.call @cc_cons(%4480, %4479) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %4482 = arith.addi %4481, %__rlasp_stack_elide_zero_202 : i64
      %4483 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4484 = arith.constant 11 : i64
      %4485 = func.call @cc_make_string(%4483, %4484) : (!llvm.ptr, i64) -> i64
      %4486 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4487 = arith.constant 7 : i64
      %4488 = func.call @cc_make_string(%4486, %4487) : (!llvm.ptr, i64) -> i64
      %4489 = func.call @cc_intern(%4485, %4488) : (i64, i64) -> i64
      %4490 = func.call @cc_nil_value() : () -> i64
      %4491 = func.call @cc_cons(%4489, %4490) : (i64, i64) -> i64
      %4492 = func.call @cc_values_pack(%4491) : (i64) -> i64
      %4493 = func.call @cc_nil_value() : () -> i64
      %4494 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4495 = arith.constant 4 : i64
      %4496 = func.call @cc_make_string(%4494, %4495) : (!llvm.ptr, i64) -> i64
      %4497 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4498 = arith.constant 7 : i64
      %4499 = func.call @cc_make_string(%4497, %4498) : (!llvm.ptr, i64) -> i64
      %4500 = func.call @cc_intern(%4496, %4499) : (i64, i64) -> i64
      %4501 = func.call @cc_nil_value() : () -> i64
      %4502 = func.call @cc_cons(%4500, %4501) : (i64, i64) -> i64
      %4503 = func.call @cc_values_pack(%4502) : (i64) -> i64
      %4504 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4505 = arith.constant 6 : i64
      %4506 = func.call @cc_make_string(%4504, %4505) : (!llvm.ptr, i64) -> i64
      %4507 = func.call @cc_nil_value() : () -> i64
      %4508 = func.call @cc_intern(%4506, %4507) : (i64, i64) -> i64
      %4509 = func.call @cc_nil_value() : () -> i64
      %4510 = func.call @cc_cons(%4508, %4509) : (i64, i64) -> i64
      %4511 = func.call @cc_values_pack(%4510) : (i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %4512 = arith.addi %4508, %__rlasp_stack_elide_zero_203 : i64
      %4513 = func.call @cc_nil_value() : () -> i64
      %4514 = func.call @cc_errorp(%3969) : (i64) -> i64
      %4515 = arith.cmpi ne, %4514, %4513 : i64
      %4516 = arith.cmpi eq, %4513, %4513 : i64
      %4517 = arith.andi %4515, %4516 : i1
      %4518 = scf.if %4517 -> (i64) {
        scf.yield %3969 : i64
      } else {
        scf.yield %4513 : i64
      }
      %4519 = func.call @cc_errorp(%4245) : (i64) -> i64
      %4520 = arith.cmpi ne, %4519, %4513 : i64
      %4521 = arith.cmpi eq, %4518, %4513 : i64
      %4522 = arith.andi %4520, %4521 : i1
      %4523 = scf.if %4522 -> (i64) {
        scf.yield %4245 : i64
      } else {
        scf.yield %4518 : i64
      }
      %4524 = func.call @cc_errorp(%4452) : (i64) -> i64
      %4525 = arith.cmpi ne, %4524, %4513 : i64
      %4526 = arith.cmpi eq, %4523, %4513 : i64
      %4527 = arith.andi %4525, %4526 : i1
      %4528 = scf.if %4527 -> (i64) {
        scf.yield %4452 : i64
      } else {
        scf.yield %4523 : i64
      }
      %4529 = func.call @cc_errorp(%4482) : (i64) -> i64
      %4530 = arith.cmpi ne, %4529, %4513 : i64
      %4531 = arith.cmpi eq, %4528, %4513 : i64
      %4532 = arith.andi %4530, %4531 : i1
      %4533 = scf.if %4532 -> (i64) {
        scf.yield %4482 : i64
      } else {
        scf.yield %4528 : i64
      }
      %4534 = func.call @cc_errorp(%4489) : (i64) -> i64
      %4535 = arith.cmpi ne, %4534, %4513 : i64
      %4536 = arith.cmpi eq, %4533, %4513 : i64
      %4537 = arith.andi %4535, %4536 : i1
      %4538 = scf.if %4537 -> (i64) {
        scf.yield %4489 : i64
      } else {
        scf.yield %4533 : i64
      }
      %4539 = func.call @cc_errorp(%4493) : (i64) -> i64
      %4540 = arith.cmpi ne, %4539, %4513 : i64
      %4541 = arith.cmpi eq, %4538, %4513 : i64
      %4542 = arith.andi %4540, %4541 : i1
      %4543 = scf.if %4542 -> (i64) {
        scf.yield %4493 : i64
      } else {
        scf.yield %4538 : i64
      }
      %4544 = func.call @cc_errorp(%4500) : (i64) -> i64
      %4545 = arith.cmpi ne, %4544, %4513 : i64
      %4546 = arith.cmpi eq, %4543, %4513 : i64
      %4547 = arith.andi %4545, %4546 : i1
      %4548 = scf.if %4547 -> (i64) {
        scf.yield %4500 : i64
      } else {
        scf.yield %4543 : i64
      }
      %4549 = func.call @cc_errorp(%4512) : (i64) -> i64
      %4550 = arith.cmpi ne, %4549, %4513 : i64
      %4551 = arith.cmpi eq, %4548, %4513 : i64
      %4552 = arith.andi %4550, %4551 : i1
      %4553 = scf.if %4552 -> (i64) {
        scf.yield %4512 : i64
      } else {
        scf.yield %4548 : i64
      }
      %4554 = arith.cmpi ne, %4553, %4513 : i64
      scf.if %4554 {
        func.call @stack_push_pointer(%4553) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3969) : (i64) -> ()
        func.call @stack_push_pointer(%4245) : (i64) -> ()
        func.call @stack_push_pointer(%4452) : (i64) -> ()
        func.call @stack_push_pointer(%4482) : (i64) -> ()
        func.call @stack_push_pointer(%4489) : (i64) -> ()
        func.call @stack_push_pointer(%4493) : (i64) -> ()
        func.call @stack_push_pointer(%4500) : (i64) -> ()
        func.call @stack_push_pointer(%4512) : (i64) -> ()
        %4555 = llvm.mlir.addressof @str375 : !llvm.ptr
        %4556 = func.call @cc_make_function_ref_const(%4555) : (!llvm.ptr) -> i64
        %4557 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4556, %4557) : (i64, i64) -> ()
      }
      %4558 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4558 : i64
    }
    %4559 = func.call @cc_nil_value() : () -> i64
    %4560 = func.call @cc_errorp(%3960) : (i64) -> i64
    %4561 = arith.cmpi ne, %4560, %4559 : i64
    %4562 = scf.if %4561 -> (i64) {
      scf.yield %3960 : i64
    } else {
      %4563 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4564 = arith.constant 28 : i64
      %4565 = func.call @cc_make_string(%4563, %4564) : (!llvm.ptr, i64) -> i64
      %4566 = func.call @cc_nil_value() : () -> i64
      %4567 = func.call @cc_intern(%4565, %4566) : (i64, i64) -> i64
      %4568 = func.call @cc_nil_value() : () -> i64
      %4569 = func.call @cc_cons(%4567, %4568) : (i64, i64) -> i64
      %4570 = func.call @cc_values_pack(%4569) : (i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %4571 = arith.addi %4567, %__rlasp_stack_elide_zero_204 : i64
      %4572 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4573 = arith.constant 5 : i64
      %4574 = func.call @cc_make_string(%4572, %4573) : (!llvm.ptr, i64) -> i64
      %4575 = func.call @cc_nil_value() : () -> i64
      %4576 = func.call @cc_intern(%4574, %4575) : (i64, i64) -> i64
      %4577 = func.call @cc_nil_value() : () -> i64
      %4578 = func.call @cc_cons(%4576, %4577) : (i64, i64) -> i64
      %4579 = func.call @cc_values_pack(%4578) : (i64) -> i64
      func.call @stack_push_pointer(%4576) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4580 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4581 = arith.constant 32 : i64
      %4582 = func.call @cc_make_string(%4580, %4581) : (!llvm.ptr, i64) -> i64
      %4583 = func.call @cc_nil_value() : () -> i64
      %4584 = func.call @cc_intern(%4582, %4583) : (i64, i64) -> i64
      %4585 = func.call @cc_nil_value() : () -> i64
      %4586 = func.call @cc_cons(%4584, %4585) : (i64, i64) -> i64
      %4587 = func.call @cc_values_pack(%4586) : (i64) -> i64
      func.call @stack_push_pointer(%4584) : (i64) -> ()
      %4588 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4589 = arith.constant 6 : i64
      %4590 = func.call @cc_make_string(%4588, %4589) : (!llvm.ptr, i64) -> i64
      %4591 = func.call @cc_nil_value() : () -> i64
      %4592 = func.call @cc_intern(%4590, %4591) : (i64, i64) -> i64
      %4593 = func.call @cc_nil_value() : () -> i64
      %4594 = func.call @cc_cons(%4592, %4593) : (i64, i64) -> i64
      %4595 = func.call @cc_values_pack(%4594) : (i64) -> i64
      func.call @stack_push_pointer(%4592) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4596 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4597 = arith.constant 10 : i64
      %4598 = func.call @cc_make_string(%4596, %4597) : (!llvm.ptr, i64) -> i64
      %4599 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4600 = arith.constant 11 : i64
      %4601 = func.call @cc_make_string(%4599, %4600) : (!llvm.ptr, i64) -> i64
      %4602 = func.call @cc_intern(%4598, %4601) : (i64, i64) -> i64
      %4603 = func.call @cc_nil_value() : () -> i64
      %4604 = func.call @cc_cons(%4602, %4603) : (i64, i64) -> i64
      %4605 = func.call @cc_values_pack(%4604) : (i64) -> i64
      func.call @stack_push_pointer(%4602) : (i64) -> ()
      %4606 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4607 = arith.constant 5 : i64
      %4608 = func.call @cc_make_string(%4606, %4607) : (!llvm.ptr, i64) -> i64
      %4609 = func.call @cc_nil_value() : () -> i64
      %4610 = func.call @cc_intern(%4608, %4609) : (i64, i64) -> i64
      %4611 = func.call @cc_nil_value() : () -> i64
      %4612 = func.call @cc_cons(%4610, %4611) : (i64, i64) -> i64
      %4613 = func.call @cc_values_pack(%4612) : (i64) -> i64
      func.call @stack_push_pointer(%4610) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4614 = func.call @stack_pop_pointer() : () -> i64
      %4615 = func.call @stack_pop_pointer() : () -> i64
      %4616 = func.call @cc_cons(%4615, %4614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4616) : (i64) -> ()
      %4617 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4618 = arith.constant 9 : i64
      %4619 = func.call @cc_make_string(%4617, %4618) : (!llvm.ptr, i64) -> i64
      %4620 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4621 = arith.constant 11 : i64
      %4622 = func.call @cc_make_string(%4620, %4621) : (!llvm.ptr, i64) -> i64
      %4623 = func.call @cc_intern(%4619, %4622) : (i64, i64) -> i64
      %4624 = func.call @cc_nil_value() : () -> i64
      %4625 = func.call @cc_cons(%4623, %4624) : (i64, i64) -> i64
      %4626 = func.call @cc_values_pack(%4625) : (i64) -> i64
      func.call @stack_push_pointer(%4623) : (i64) -> ()
      %4627 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4628 = arith.constant 6 : i64
      %4629 = func.call @cc_make_string(%4627, %4628) : (!llvm.ptr, i64) -> i64
      %4630 = func.call @cc_nil_value() : () -> i64
      %4631 = func.call @cc_intern(%4629, %4630) : (i64, i64) -> i64
      %4632 = func.call @cc_nil_value() : () -> i64
      %4633 = func.call @cc_cons(%4631, %4632) : (i64, i64) -> i64
      %4634 = func.call @cc_values_pack(%4633) : (i64) -> i64
      func.call @stack_push_pointer(%4631) : (i64) -> ()
      %4635 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4636 = arith.constant 5 : i64
      %4637 = func.call @cc_make_string(%4635, %4636) : (!llvm.ptr, i64) -> i64
      %4638 = func.call @cc_nil_value() : () -> i64
      %4639 = func.call @cc_intern(%4637, %4638) : (i64, i64) -> i64
      %4640 = func.call @cc_nil_value() : () -> i64
      %4641 = func.call @cc_cons(%4639, %4640) : (i64, i64) -> i64
      %4642 = func.call @cc_values_pack(%4641) : (i64) -> i64
      func.call @stack_push_pointer(%4639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4643 = func.call @stack_pop_pointer() : () -> i64
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = func.call @cc_cons(%4644, %4643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4645) : (i64) -> ()
      %4646 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4647 = arith.constant 2 : i64
      %4648 = func.call @cc_make_string(%4646, %4647) : (!llvm.ptr, i64) -> i64
      %4649 = func.call @cc_nil_value() : () -> i64
      %4650 = func.call @cc_intern(%4648, %4649) : (i64, i64) -> i64
      %4651 = func.call @cc_nil_value() : () -> i64
      %4652 = func.call @cc_cons(%4650, %4651) : (i64, i64) -> i64
      %4653 = func.call @cc_values_pack(%4652) : (i64) -> i64
      func.call @stack_push_pointer(%4650) : (i64) -> ()
      %4654 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4655 = arith.constant 2 : i64
      %4656 = func.call @cc_make_string(%4654, %4655) : (!llvm.ptr, i64) -> i64
      %4657 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4658 = arith.constant 11 : i64
      %4659 = func.call @cc_make_string(%4657, %4658) : (!llvm.ptr, i64) -> i64
      %4660 = func.call @cc_intern(%4656, %4659) : (i64, i64) -> i64
      %4661 = func.call @cc_nil_value() : () -> i64
      %4662 = func.call @cc_cons(%4660, %4661) : (i64, i64) -> i64
      %4663 = func.call @cc_values_pack(%4662) : (i64) -> i64
      func.call @stack_push_pointer(%4660) : (i64) -> ()
      %4664 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4665 = arith.constant 19 : i64
      %4666 = func.call @cc_make_string(%4664, %4665) : (!llvm.ptr, i64) -> i64
      %4667 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4668 = arith.constant 11 : i64
      %4669 = func.call @cc_make_string(%4667, %4668) : (!llvm.ptr, i64) -> i64
      %4670 = func.call @cc_intern(%4666, %4669) : (i64, i64) -> i64
      %4671 = func.call @cc_nil_value() : () -> i64
      %4672 = func.call @cc_cons(%4670, %4671) : (i64, i64) -> i64
      %4673 = func.call @cc_values_pack(%4672) : (i64) -> i64
      func.call @stack_push_pointer(%4670) : (i64) -> ()
      %4674 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4675 = arith.constant 5 : i64
      %4676 = func.call @cc_make_string(%4674, %4675) : (!llvm.ptr, i64) -> i64
      %4677 = func.call @cc_nil_value() : () -> i64
      %4678 = func.call @cc_intern(%4676, %4677) : (i64, i64) -> i64
      %4679 = func.call @cc_nil_value() : () -> i64
      %4680 = func.call @cc_cons(%4678, %4679) : (i64, i64) -> i64
      %4681 = func.call @cc_values_pack(%4680) : (i64) -> i64
      func.call @stack_push_pointer(%4678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4682 = func.call @stack_pop_pointer() : () -> i64
      %4683 = func.call @stack_pop_pointer() : () -> i64
      %4684 = func.call @cc_cons(%4683, %4682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %4685 = arith.addi %4684, %__rlasp_stack_elide_zero_205 : i64
      %4686 = func.call @stack_pop_pointer() : () -> i64
      %4687 = func.call @cc_cons(%4686, %4685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4687) : (i64) -> ()
      %4688 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4688) : (i64) -> ()
      %4689 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4690 = arith.constant 32 : i64
      %4691 = func.call @cc_make_string(%4689, %4690) : (!llvm.ptr, i64) -> i64
      %4692 = func.call @cc_nil_value() : () -> i64
      %4693 = func.call @cc_intern(%4691, %4692) : (i64, i64) -> i64
      %4694 = func.call @cc_nil_value() : () -> i64
      %4695 = func.call @cc_cons(%4693, %4694) : (i64, i64) -> i64
      %4696 = func.call @cc_values_pack(%4695) : (i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %4697 = arith.addi %4693, %__rlasp_stack_elide_zero_206 : i64
      %4698 = func.call @stack_pop_pointer() : () -> i64
      %4699 = func.call @cc_cons(%4697, %4698) : (i64, i64) -> i64
      %4700 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4701 = arith.constant 5 : i64
      %4702 = func.call @cc_make_string(%4700, %4701) : (!llvm.ptr, i64) -> i64
      %4703 = func.call @cc_nil_value() : () -> i64
      %4704 = func.call @cc_intern(%4702, %4703) : (i64, i64) -> i64
      %4705 = func.call @cc_nil_value() : () -> i64
      %4706 = func.call @cc_cons(%4704, %4705) : (i64, i64) -> i64
      %4707 = func.call @cc_values_pack(%4706) : (i64) -> i64
      %4708 = func.call @cc_cons(%4704, %4699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4708) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4709 = func.call @stack_pop_pointer() : () -> i64
      %4710 = func.call @stack_pop_pointer() : () -> i64
      %4711 = func.call @cc_cons(%4710, %4709) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %4712 = arith.addi %4711, %__rlasp_stack_elide_zero_207 : i64
      %4713 = func.call @stack_pop_pointer() : () -> i64
      %4714 = func.call @cc_cons(%4713, %4712) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %4715 = arith.addi %4714, %__rlasp_stack_elide_zero_208 : i64
      %4716 = func.call @stack_pop_pointer() : () -> i64
      %4717 = func.call @cc_cons(%4716, %4715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4717) : (i64) -> ()
      %4718 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4719 = arith.constant 5 : i64
      %4720 = func.call @cc_make_string(%4718, %4719) : (!llvm.ptr, i64) -> i64
      %4721 = func.call @cc_nil_value() : () -> i64
      %4722 = func.call @cc_intern(%4720, %4721) : (i64, i64) -> i64
      %4723 = func.call @cc_nil_value() : () -> i64
      %4724 = func.call @cc_cons(%4722, %4723) : (i64, i64) -> i64
      %4725 = func.call @cc_values_pack(%4724) : (i64) -> i64
      func.call @stack_push_pointer(%4722) : (i64) -> ()
      %4726 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4727 = arith.constant 11 : i64
      %4728 = func.call @cc_make_string(%4726, %4727) : (!llvm.ptr, i64) -> i64
      %4729 = func.call @cc_nil_value() : () -> i64
      %4730 = func.call @cc_intern(%4728, %4729) : (i64, i64) -> i64
      %4731 = func.call @cc_nil_value() : () -> i64
      %4732 = func.call @cc_cons(%4730, %4731) : (i64, i64) -> i64
      %4733 = func.call @cc_values_pack(%4732) : (i64) -> i64
      func.call @stack_push_pointer(%4730) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4734 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4735 = arith.constant 28 : i64
      %4736 = func.call @cc_make_string(%4734, %4735) : (!llvm.ptr, i64) -> i64
      %4737 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4738 = arith.constant 11 : i64
      %4739 = func.call @cc_make_string(%4737, %4738) : (!llvm.ptr, i64) -> i64
      %4740 = func.call @cc_intern(%4736, %4739) : (i64, i64) -> i64
      %4741 = func.call @cc_nil_value() : () -> i64
      %4742 = func.call @cc_cons(%4740, %4741) : (i64, i64) -> i64
      %4743 = func.call @cc_values_pack(%4742) : (i64) -> i64
      func.call @stack_push_pointer(%4740) : (i64) -> ()
      %4744 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4745 = arith.constant 5 : i64
      %4746 = func.call @cc_make_string(%4744, %4745) : (!llvm.ptr, i64) -> i64
      %4747 = func.call @cc_nil_value() : () -> i64
      %4748 = func.call @cc_intern(%4746, %4747) : (i64, i64) -> i64
      %4749 = func.call @cc_nil_value() : () -> i64
      %4750 = func.call @cc_cons(%4748, %4749) : (i64, i64) -> i64
      %4751 = func.call @cc_values_pack(%4750) : (i64) -> i64
      func.call @stack_push_pointer(%4748) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4752 = func.call @stack_pop_pointer() : () -> i64
      %4753 = func.call @stack_pop_pointer() : () -> i64
      %4754 = func.call @cc_cons(%4753, %4752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %4755 = arith.addi %4754, %__rlasp_stack_elide_zero_209 : i64
      %4756 = func.call @stack_pop_pointer() : () -> i64
      %4757 = func.call @cc_cons(%4756, %4755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4757) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4758 = func.call @stack_pop_pointer() : () -> i64
      %4759 = func.call @stack_pop_pointer() : () -> i64
      %4760 = func.call @cc_cons(%4759, %4758) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %4761 = arith.addi %4760, %__rlasp_stack_elide_zero_210 : i64
      %4762 = func.call @stack_pop_pointer() : () -> i64
      %4763 = func.call @cc_cons(%4762, %4761) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %4764 = arith.addi %4763, %__rlasp_stack_elide_zero_211 : i64
      %4765 = func.call @stack_pop_pointer() : () -> i64
      %4766 = func.call @cc_cons(%4765, %4764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4767 = func.call @stack_pop_pointer() : () -> i64
      %4768 = func.call @stack_pop_pointer() : () -> i64
      %4769 = func.call @cc_cons(%4768, %4767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %4770 = arith.addi %4769, %__rlasp_stack_elide_zero_212 : i64
      %4771 = func.call @stack_pop_pointer() : () -> i64
      %4772 = func.call @cc_cons(%4771, %4770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4773 = func.call @stack_pop_pointer() : () -> i64
      %4774 = func.call @stack_pop_pointer() : () -> i64
      %4775 = func.call @cc_cons(%4774, %4773) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %4776 = arith.addi %4775, %__rlasp_stack_elide_zero_213 : i64
      %4777 = func.call @stack_pop_pointer() : () -> i64
      %4778 = func.call @cc_cons(%4777, %4776) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %4779 = arith.addi %4778, %__rlasp_stack_elide_zero_214 : i64
      %4780 = func.call @stack_pop_pointer() : () -> i64
      %4781 = func.call @cc_cons(%4780, %4779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %4782 = arith.addi %4781, %__rlasp_stack_elide_zero_215 : i64
      %4783 = func.call @stack_pop_pointer() : () -> i64
      %4784 = func.call @cc_cons(%4783, %4782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4784) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4785 = func.call @stack_pop_pointer() : () -> i64
      %4786 = func.call @stack_pop_pointer() : () -> i64
      %4787 = func.call @cc_cons(%4786, %4785) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %4788 = arith.addi %4787, %__rlasp_stack_elide_zero_216 : i64
      %4789 = func.call @stack_pop_pointer() : () -> i64
      %4790 = func.call @cc_cons(%4789, %4788) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %4791 = arith.addi %4790, %__rlasp_stack_elide_zero_217 : i64
      %4792 = func.call @stack_pop_pointer() : () -> i64
      %4793 = func.call @cc_cons(%4792, %4791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4793) : (i64) -> ()
      %4794 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4795 = arith.constant 5 : i64
      %4796 = func.call @cc_make_string(%4794, %4795) : (!llvm.ptr, i64) -> i64
      %4797 = func.call @cc_nil_value() : () -> i64
      %4798 = func.call @cc_intern(%4796, %4797) : (i64, i64) -> i64
      %4799 = func.call @cc_nil_value() : () -> i64
      %4800 = func.call @cc_cons(%4798, %4799) : (i64, i64) -> i64
      %4801 = func.call @cc_values_pack(%4800) : (i64) -> i64
      func.call @stack_push_pointer(%4798) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4802 = func.call @stack_pop_pointer() : () -> i64
      %4803 = func.call @stack_pop_pointer() : () -> i64
      %4804 = func.call @cc_cons(%4803, %4802) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %4805 = arith.addi %4804, %__rlasp_stack_elide_zero_218 : i64
      %4806 = func.call @stack_pop_pointer() : () -> i64
      %4807 = func.call @cc_cons(%4806, %4805) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %4808 = arith.addi %4807, %__rlasp_stack_elide_zero_219 : i64
      %4809 = func.call @stack_pop_pointer() : () -> i64
      %4810 = func.call @cc_cons(%4809, %4808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4810) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4811 = func.call @stack_pop_pointer() : () -> i64
      %4812 = func.call @stack_pop_pointer() : () -> i64
      %4813 = func.call @cc_cons(%4812, %4811) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %4814 = arith.addi %4813, %__rlasp_stack_elide_zero_220 : i64
      %4815 = func.call @stack_pop_pointer() : () -> i64
      %4816 = func.call @cc_cons(%4815, %4814) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %4817 = arith.addi %4816, %__rlasp_stack_elide_zero_221 : i64
      %4818 = func.call @stack_pop_pointer() : () -> i64
      %4819 = func.call @cc_cons(%4818, %4817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4820 = func.call @stack_pop_pointer() : () -> i64
      %4821 = func.call @stack_pop_pointer() : () -> i64
      %4822 = func.call @cc_cons(%4821, %4820) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %4823 = arith.addi %4822, %__rlasp_stack_elide_zero_222 : i64
      %4824 = func.call @stack_pop_pointer() : () -> i64
      %4825 = func.call @cc_cons(%4824, %4823) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %4826 = arith.addi %4825, %__rlasp_stack_elide_zero_223 : i64
      %4827 = func.call @stack_pop_pointer() : () -> i64
      %4828 = func.call @cc_cons(%4827, %4826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4828) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4829 = func.call @stack_pop_pointer() : () -> i64
      %4830 = func.call @stack_pop_pointer() : () -> i64
      %4831 = func.call @cc_cons(%4830, %4829) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %4832 = arith.addi %4831, %__rlasp_stack_elide_zero_224 : i64
      %4833 = func.call @stack_pop_pointer() : () -> i64
      %4834 = func.call @cc_cons(%4833, %4832) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %4835 = arith.addi %4834, %__rlasp_stack_elide_zero_225 : i64
      %4836 = func.call @stack_pop_pointer() : () -> i64
      %4837 = func.call @cc_cons(%4836, %4835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4838 = func.call @stack_pop_pointer() : () -> i64
      %4839 = func.call @stack_pop_pointer() : () -> i64
      %4840 = func.call @cc_cons(%4839, %4838) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %4841 = arith.addi %4840, %__rlasp_stack_elide_zero_226 : i64
      %4842 = func.call @stack_pop_pointer() : () -> i64
      %4843 = func.call @cc_cons(%4842, %4841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %4844 = arith.addi %4843, %__rlasp_stack_elide_zero_227 : i64
      %4845 = func.call @stack_pop_pointer() : () -> i64
      %4846 = func.call @cc_cons(%4845, %4844) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %4847 = arith.addi %4846, %__rlasp_stack_elide_zero_228 : i64
      %5047 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5048 = arith.constant 33 : i64
      %5049 = func.call @cc_make_symbol(%5047, %5048) : (!llvm.ptr, i64) -> i64
      %5050 = func.call @cc_persistent_root_value(%5049) : (i64) -> i64
      func.call @stack_push_pointer(%5050) : (i64) -> ()
      %5051 = arith.constant 97047688511528 : i64
      %5052 = arith.constant 1 : i64
      %5053 = func.call @cc_make_closure(%5051, %5052) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %5054 = arith.addi %5053, %__rlasp_stack_elide_zero_229 : i64
      %5055 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5056 = arith.constant 32 : i64
      %5057 = func.call @cc_make_string(%5055, %5056) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5058 = func.call @stack_pop_pointer() : () -> i64
      %5059 = func.call @stack_pop_pointer() : () -> i64
      %5060 = func.call @cc_cons(%5059, %5058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %5061 = arith.addi %5060, %__rlasp_stack_elide_zero_230 : i64
      %5062 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5063 = arith.constant 11 : i64
      %5064 = func.call @cc_make_string(%5062, %5063) : (!llvm.ptr, i64) -> i64
      %5065 = llvm.mlir.addressof @str418 : !llvm.ptr
      %5066 = arith.constant 7 : i64
      %5067 = func.call @cc_make_string(%5065, %5066) : (!llvm.ptr, i64) -> i64
      %5068 = func.call @cc_intern(%5064, %5067) : (i64, i64) -> i64
      %5069 = func.call @cc_nil_value() : () -> i64
      %5070 = func.call @cc_cons(%5068, %5069) : (i64, i64) -> i64
      %5071 = func.call @cc_values_pack(%5070) : (i64) -> i64
      %5072 = func.call @cc_nil_value() : () -> i64
      %5073 = llvm.mlir.addressof @str419 : !llvm.ptr
      %5074 = arith.constant 4 : i64
      %5075 = func.call @cc_make_string(%5073, %5074) : (!llvm.ptr, i64) -> i64
      %5076 = llvm.mlir.addressof @str420 : !llvm.ptr
      %5077 = arith.constant 7 : i64
      %5078 = func.call @cc_make_string(%5076, %5077) : (!llvm.ptr, i64) -> i64
      %5079 = func.call @cc_intern(%5075, %5078) : (i64, i64) -> i64
      %5080 = func.call @cc_nil_value() : () -> i64
      %5081 = func.call @cc_cons(%5079, %5080) : (i64, i64) -> i64
      %5082 = func.call @cc_values_pack(%5081) : (i64) -> i64
      %5083 = llvm.mlir.addressof @str421 : !llvm.ptr
      %5084 = arith.constant 6 : i64
      %5085 = func.call @cc_make_string(%5083, %5084) : (!llvm.ptr, i64) -> i64
      %5086 = func.call @cc_nil_value() : () -> i64
      %5087 = func.call @cc_intern(%5085, %5086) : (i64, i64) -> i64
      %5088 = func.call @cc_nil_value() : () -> i64
      %5089 = func.call @cc_cons(%5087, %5088) : (i64, i64) -> i64
      %5090 = func.call @cc_values_pack(%5089) : (i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %5091 = arith.addi %5087, %__rlasp_stack_elide_zero_231 : i64
      %5092 = func.call @cc_nil_value() : () -> i64
      %5093 = func.call @cc_errorp(%4571) : (i64) -> i64
      %5094 = arith.cmpi ne, %5093, %5092 : i64
      %5095 = arith.cmpi eq, %5092, %5092 : i64
      %5096 = arith.andi %5094, %5095 : i1
      %5097 = scf.if %5096 -> (i64) {
        scf.yield %4571 : i64
      } else {
        scf.yield %5092 : i64
      }
      %5098 = func.call @cc_errorp(%4847) : (i64) -> i64
      %5099 = arith.cmpi ne, %5098, %5092 : i64
      %5100 = arith.cmpi eq, %5097, %5092 : i64
      %5101 = arith.andi %5099, %5100 : i1
      %5102 = scf.if %5101 -> (i64) {
        scf.yield %4847 : i64
      } else {
        scf.yield %5097 : i64
      }
      %5103 = func.call @cc_errorp(%5054) : (i64) -> i64
      %5104 = arith.cmpi ne, %5103, %5092 : i64
      %5105 = arith.cmpi eq, %5102, %5092 : i64
      %5106 = arith.andi %5104, %5105 : i1
      %5107 = scf.if %5106 -> (i64) {
        scf.yield %5054 : i64
      } else {
        scf.yield %5102 : i64
      }
      %5108 = func.call @cc_errorp(%5061) : (i64) -> i64
      %5109 = arith.cmpi ne, %5108, %5092 : i64
      %5110 = arith.cmpi eq, %5107, %5092 : i64
      %5111 = arith.andi %5109, %5110 : i1
      %5112 = scf.if %5111 -> (i64) {
        scf.yield %5061 : i64
      } else {
        scf.yield %5107 : i64
      }
      %5113 = func.call @cc_errorp(%5068) : (i64) -> i64
      %5114 = arith.cmpi ne, %5113, %5092 : i64
      %5115 = arith.cmpi eq, %5112, %5092 : i64
      %5116 = arith.andi %5114, %5115 : i1
      %5117 = scf.if %5116 -> (i64) {
        scf.yield %5068 : i64
      } else {
        scf.yield %5112 : i64
      }
      %5118 = func.call @cc_errorp(%5072) : (i64) -> i64
      %5119 = arith.cmpi ne, %5118, %5092 : i64
      %5120 = arith.cmpi eq, %5117, %5092 : i64
      %5121 = arith.andi %5119, %5120 : i1
      %5122 = scf.if %5121 -> (i64) {
        scf.yield %5072 : i64
      } else {
        scf.yield %5117 : i64
      }
      %5123 = func.call @cc_errorp(%5079) : (i64) -> i64
      %5124 = arith.cmpi ne, %5123, %5092 : i64
      %5125 = arith.cmpi eq, %5122, %5092 : i64
      %5126 = arith.andi %5124, %5125 : i1
      %5127 = scf.if %5126 -> (i64) {
        scf.yield %5079 : i64
      } else {
        scf.yield %5122 : i64
      }
      %5128 = func.call @cc_errorp(%5091) : (i64) -> i64
      %5129 = arith.cmpi ne, %5128, %5092 : i64
      %5130 = arith.cmpi eq, %5127, %5092 : i64
      %5131 = arith.andi %5129, %5130 : i1
      %5132 = scf.if %5131 -> (i64) {
        scf.yield %5091 : i64
      } else {
        scf.yield %5127 : i64
      }
      %5133 = arith.cmpi ne, %5132, %5092 : i64
      scf.if %5133 {
        func.call @stack_push_pointer(%5132) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4571) : (i64) -> ()
        func.call @stack_push_pointer(%4847) : (i64) -> ()
        func.call @stack_push_pointer(%5054) : (i64) -> ()
        func.call @stack_push_pointer(%5061) : (i64) -> ()
        func.call @stack_push_pointer(%5068) : (i64) -> ()
        func.call @stack_push_pointer(%5072) : (i64) -> ()
        func.call @stack_push_pointer(%5079) : (i64) -> ()
        func.call @stack_push_pointer(%5091) : (i64) -> ()
        %5134 = llvm.mlir.addressof @str422 : !llvm.ptr
        %5135 = func.call @cc_make_function_ref_const(%5134) : (!llvm.ptr) -> i64
        %5136 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5135, %5136) : (i64, i64) -> ()
      }
      %5137 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5137 : i64
    }
    %5138 = func.call @cc_nil_value() : () -> i64
    %5139 = func.call @cc_errorp(%4562) : (i64) -> i64
    %5140 = arith.cmpi ne, %5139, %5138 : i64
    %5141 = scf.if %5140 -> (i64) {
      scf.yield %4562 : i64
    } else {
      %5142 = llvm.mlir.addressof @str423 : !llvm.ptr
      %5143 = arith.constant 28 : i64
      %5144 = func.call @cc_make_string(%5142, %5143) : (!llvm.ptr, i64) -> i64
      %5145 = func.call @cc_nil_value() : () -> i64
      %5146 = func.call @cc_intern(%5144, %5145) : (i64, i64) -> i64
      %5147 = func.call @cc_nil_value() : () -> i64
      %5148 = func.call @cc_cons(%5146, %5147) : (i64, i64) -> i64
      %5149 = func.call @cc_values_pack(%5148) : (i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %5150 = arith.addi %5146, %__rlasp_stack_elide_zero_232 : i64
      %5151 = llvm.mlir.addressof @str424 : !llvm.ptr
      %5152 = arith.constant 3 : i64
      %5153 = func.call @cc_make_string(%5151, %5152) : (!llvm.ptr, i64) -> i64
      %5154 = func.call @cc_nil_value() : () -> i64
      %5155 = func.call @cc_intern(%5153, %5154) : (i64, i64) -> i64
      %5156 = func.call @cc_nil_value() : () -> i64
      %5157 = func.call @cc_cons(%5155, %5156) : (i64, i64) -> i64
      %5158 = func.call @cc_values_pack(%5157) : (i64) -> i64
      func.call @stack_push_pointer(%5155) : (i64) -> ()
      %5159 = llvm.mlir.addressof @str425 : !llvm.ptr
      %5160 = arith.constant 3 : i64
      %5161 = func.call @cc_make_string(%5159, %5160) : (!llvm.ptr, i64) -> i64
      %5162 = func.call @cc_nil_value() : () -> i64
      %5163 = func.call @cc_intern(%5161, %5162) : (i64, i64) -> i64
      %5164 = func.call @cc_nil_value() : () -> i64
      %5165 = func.call @cc_cons(%5163, %5164) : (i64, i64) -> i64
      %5166 = func.call @cc_values_pack(%5165) : (i64) -> i64
      func.call @stack_push_pointer(%5163) : (i64) -> ()
      %5167 = llvm.mlir.addressof @str426 : !llvm.ptr
      %5168 = arith.constant 5 : i64
      %5169 = func.call @cc_make_string(%5167, %5168) : (!llvm.ptr, i64) -> i64
      %5170 = func.call @cc_nil_value() : () -> i64
      %5171 = func.call @cc_intern(%5169, %5170) : (i64, i64) -> i64
      %5172 = func.call @cc_nil_value() : () -> i64
      %5173 = func.call @cc_cons(%5171, %5172) : (i64, i64) -> i64
      %5174 = func.call @cc_values_pack(%5173) : (i64) -> i64
      func.call @stack_push_pointer(%5171) : (i64) -> ()
      %5175 = llvm.mlir.addressof @str427 : !llvm.ptr
      %5176 = arith.constant 7 : i64
      %5177 = func.call @cc_make_string(%5175, %5176) : (!llvm.ptr, i64) -> i64
      %5178 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5179 = arith.constant 11 : i64
      %5180 = func.call @cc_make_string(%5178, %5179) : (!llvm.ptr, i64) -> i64
      %5181 = func.call @cc_intern(%5177, %5180) : (i64, i64) -> i64
      %5182 = func.call @cc_nil_value() : () -> i64
      %5183 = func.call @cc_cons(%5181, %5182) : (i64, i64) -> i64
      %5184 = func.call @cc_values_pack(%5183) : (i64) -> i64
      func.call @stack_push_pointer(%5181) : (i64) -> ()
      %5185 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5186 = arith.constant 11 : i64
      %5187 = func.call @cc_make_string(%5185, %5186) : (!llvm.ptr, i64) -> i64
      %5188 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5189 = arith.constant 3 : i64
      %5190 = func.call @cc_make_string(%5188, %5189) : (!llvm.ptr, i64) -> i64
      %5191 = func.call @cc_intern(%5187, %5190) : (i64, i64) -> i64
      %5192 = func.call @cc_nil_value() : () -> i64
      %5193 = func.call @cc_cons(%5191, %5192) : (i64, i64) -> i64
      %5194 = func.call @cc_values_pack(%5193) : (i64) -> i64
      func.call @stack_push_pointer(%5191) : (i64) -> ()
      %5195 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5195) : (i64) -> ()
      %5196 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5197 = arith.constant 6 : i64
      %5198 = func.call @cc_make_string(%5196, %5197) : (!llvm.ptr, i64) -> i64
      %5199 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5200 = arith.constant 11 : i64
      %5201 = func.call @cc_make_string(%5199, %5200) : (!llvm.ptr, i64) -> i64
      %5202 = func.call @cc_intern(%5198, %5201) : (i64, i64) -> i64
      %5203 = func.call @cc_nil_value() : () -> i64
      %5204 = func.call @cc_cons(%5202, %5203) : (i64, i64) -> i64
      %5205 = func.call @cc_values_pack(%5204) : (i64) -> i64
      func.call @stack_push_pointer(%5202) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5206 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5207 = arith.constant 5 : i64
      %5208 = func.call @cc_make_string(%5206, %5207) : (!llvm.ptr, i64) -> i64
      %5209 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5210 = arith.constant 11 : i64
      %5211 = func.call @cc_make_string(%5209, %5210) : (!llvm.ptr, i64) -> i64
      %5212 = func.call @cc_intern(%5208, %5211) : (i64, i64) -> i64
      %5213 = func.call @cc_nil_value() : () -> i64
      %5214 = func.call @cc_cons(%5212, %5213) : (i64, i64) -> i64
      %5215 = func.call @cc_values_pack(%5214) : (i64) -> i64
      func.call @stack_push_pointer(%5212) : (i64) -> ()
      %5216 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5217 = arith.constant 3 : i64
      %5218 = func.call @cc_make_string(%5216, %5217) : (!llvm.ptr, i64) -> i64
      %5219 = func.call @cc_nil_value() : () -> i64
      %5220 = func.call @cc_intern(%5218, %5219) : (i64, i64) -> i64
      %5221 = func.call @cc_nil_value() : () -> i64
      %5222 = func.call @cc_cons(%5220, %5221) : (i64, i64) -> i64
      %5223 = func.call @cc_values_pack(%5222) : (i64) -> i64
      func.call @stack_push_pointer(%5220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5224 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5225 = arith.constant 3 : i64
      %5226 = func.call @cc_make_string(%5224, %5225) : (!llvm.ptr, i64) -> i64
      %5227 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5228 = arith.constant 11 : i64
      %5229 = func.call @cc_make_string(%5227, %5228) : (!llvm.ptr, i64) -> i64
      %5230 = func.call @cc_intern(%5226, %5229) : (i64, i64) -> i64
      %5231 = func.call @cc_nil_value() : () -> i64
      %5232 = func.call @cc_cons(%5230, %5231) : (i64, i64) -> i64
      %5233 = func.call @cc_values_pack(%5232) : (i64) -> i64
      func.call @stack_push_pointer(%5230) : (i64) -> ()
      %5234 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5235 = arith.constant 6 : i64
      %5236 = func.call @cc_make_string(%5234, %5235) : (!llvm.ptr, i64) -> i64
      %5237 = func.call @cc_nil_value() : () -> i64
      %5238 = func.call @cc_intern(%5236, %5237) : (i64, i64) -> i64
      %5239 = func.call @cc_nil_value() : () -> i64
      %5240 = func.call @cc_cons(%5238, %5239) : (i64, i64) -> i64
      %5241 = func.call @cc_values_pack(%5240) : (i64) -> i64
      func.call @stack_push_pointer(%5238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5242 = func.call @stack_pop_pointer() : () -> i64
      %5243 = func.call @stack_pop_pointer() : () -> i64
      %5244 = func.call @cc_cons(%5243, %5242) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %5245 = arith.addi %5244, %__rlasp_stack_elide_zero_233 : i64
      %5246 = func.call @stack_pop_pointer() : () -> i64
      %5247 = func.call @cc_cons(%5246, %5245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5247) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5248 = func.call @stack_pop_pointer() : () -> i64
      %5249 = func.call @stack_pop_pointer() : () -> i64
      %5250 = func.call @cc_cons(%5249, %5248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5250) : (i64) -> ()
      %5251 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5252 = arith.constant 13 : i64
      %5253 = func.call @cc_make_string(%5251, %5252) : (!llvm.ptr, i64) -> i64
      %5254 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5255 = arith.constant 11 : i64
      %5256 = func.call @cc_make_string(%5254, %5255) : (!llvm.ptr, i64) -> i64
      %5257 = func.call @cc_intern(%5253, %5256) : (i64, i64) -> i64
      %5258 = func.call @cc_nil_value() : () -> i64
      %5259 = func.call @cc_cons(%5257, %5258) : (i64, i64) -> i64
      %5260 = func.call @cc_values_pack(%5259) : (i64) -> i64
      func.call @stack_push_pointer(%5257) : (i64) -> ()
      %5261 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5262 = arith.constant 6 : i64
      %5263 = func.call @cc_make_string(%5261, %5262) : (!llvm.ptr, i64) -> i64
      %5264 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5265 = arith.constant 11 : i64
      %5266 = func.call @cc_make_string(%5264, %5265) : (!llvm.ptr, i64) -> i64
      %5267 = func.call @cc_intern(%5263, %5266) : (i64, i64) -> i64
      %5268 = func.call @cc_nil_value() : () -> i64
      %5269 = func.call @cc_cons(%5267, %5268) : (i64, i64) -> i64
      %5270 = func.call @cc_values_pack(%5269) : (i64) -> i64
      func.call @stack_push_pointer(%5267) : (i64) -> ()
      %5271 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5272 = arith.constant 5 : i64
      %5273 = func.call @cc_make_string(%5271, %5272) : (!llvm.ptr, i64) -> i64
      %5274 = func.call @cc_nil_value() : () -> i64
      %5275 = func.call @cc_intern(%5273, %5274) : (i64, i64) -> i64
      %5276 = func.call @cc_nil_value() : () -> i64
      %5277 = func.call @cc_cons(%5275, %5276) : (i64, i64) -> i64
      %5278 = func.call @cc_values_pack(%5277) : (i64) -> i64
      func.call @stack_push_pointer(%5275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5279 = func.call @stack_pop_pointer() : () -> i64
      %5280 = func.call @stack_pop_pointer() : () -> i64
      %5281 = func.call @cc_cons(%5280, %5279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5281) : (i64) -> ()
      %5282 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5283 = arith.constant 4 : i64
      %5284 = func.call @cc_make_string(%5282, %5283) : (!llvm.ptr, i64) -> i64
      %5285 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5286 = arith.constant 11 : i64
      %5287 = func.call @cc_make_string(%5285, %5286) : (!llvm.ptr, i64) -> i64
      %5288 = func.call @cc_intern(%5284, %5287) : (i64, i64) -> i64
      %5289 = func.call @cc_nil_value() : () -> i64
      %5290 = func.call @cc_cons(%5288, %5289) : (i64, i64) -> i64
      %5291 = func.call @cc_values_pack(%5290) : (i64) -> i64
      func.call @stack_push_pointer(%5288) : (i64) -> ()
      %5292 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5293 = arith.constant 2 : i64
      %5294 = func.call @cc_make_string(%5292, %5293) : (!llvm.ptr, i64) -> i64
      %5295 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5296 = arith.constant 11 : i64
      %5297 = func.call @cc_make_string(%5295, %5296) : (!llvm.ptr, i64) -> i64
      %5298 = func.call @cc_intern(%5294, %5297) : (i64, i64) -> i64
      %5299 = func.call @cc_nil_value() : () -> i64
      %5300 = func.call @cc_cons(%5298, %5299) : (i64, i64) -> i64
      %5301 = func.call @cc_values_pack(%5300) : (i64) -> i64
      func.call @stack_push_pointer(%5298) : (i64) -> ()
      %5302 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5303 = arith.constant 14 : i64
      %5304 = func.call @cc_make_string(%5302, %5303) : (!llvm.ptr, i64) -> i64
      %5305 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5306 = arith.constant 11 : i64
      %5307 = func.call @cc_make_string(%5305, %5306) : (!llvm.ptr, i64) -> i64
      %5308 = func.call @cc_intern(%5304, %5307) : (i64, i64) -> i64
      %5309 = func.call @cc_nil_value() : () -> i64
      %5310 = func.call @cc_cons(%5308, %5309) : (i64, i64) -> i64
      %5311 = func.call @cc_values_pack(%5310) : (i64) -> i64
      func.call @stack_push_pointer(%5308) : (i64) -> ()
      %5312 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5313 = arith.constant 5 : i64
      %5314 = func.call @cc_make_string(%5312, %5313) : (!llvm.ptr, i64) -> i64
      %5315 = func.call @cc_nil_value() : () -> i64
      %5316 = func.call @cc_intern(%5314, %5315) : (i64, i64) -> i64
      %5317 = func.call @cc_nil_value() : () -> i64
      %5318 = func.call @cc_cons(%5316, %5317) : (i64, i64) -> i64
      %5319 = func.call @cc_values_pack(%5318) : (i64) -> i64
      func.call @stack_push_pointer(%5316) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5320 = func.call @stack_pop_pointer() : () -> i64
      %5321 = func.call @stack_pop_pointer() : () -> i64
      %5322 = func.call @cc_cons(%5321, %5320) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %5323 = arith.addi %5322, %__rlasp_stack_elide_zero_234 : i64
      %5324 = func.call @stack_pop_pointer() : () -> i64
      %5325 = func.call @cc_cons(%5324, %5323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5325) : (i64) -> ()
      %5326 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5327 = arith.constant 8 : i64
      %5328 = func.call @cc_make_string(%5326, %5327) : (!llvm.ptr, i64) -> i64
      %5329 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5330 = arith.constant 7 : i64
      %5331 = func.call @cc_make_string(%5329, %5330) : (!llvm.ptr, i64) -> i64
      %5332 = func.call @cc_intern(%5328, %5331) : (i64, i64) -> i64
      %5333 = func.call @cc_nil_value() : () -> i64
      %5334 = func.call @cc_cons(%5332, %5333) : (i64, i64) -> i64
      %5335 = func.call @cc_values_pack(%5334) : (i64) -> i64
      func.call @stack_push_pointer(%5332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5336 = func.call @stack_pop_pointer() : () -> i64
      %5337 = func.call @stack_pop_pointer() : () -> i64
      %5338 = func.call @cc_cons(%5337, %5336) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %5339 = arith.addi %5338, %__rlasp_stack_elide_zero_235 : i64
      %5340 = func.call @stack_pop_pointer() : () -> i64
      %5341 = func.call @cc_cons(%5340, %5339) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %5342 = arith.addi %5341, %__rlasp_stack_elide_zero_236 : i64
      %5343 = func.call @stack_pop_pointer() : () -> i64
      %5344 = func.call @cc_cons(%5343, %5342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5344) : (i64) -> ()
      %5345 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5346 = arith.constant 4 : i64
      %5347 = func.call @cc_make_string(%5345, %5346) : (!llvm.ptr, i64) -> i64
      %5348 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5349 = arith.constant 11 : i64
      %5350 = func.call @cc_make_string(%5348, %5349) : (!llvm.ptr, i64) -> i64
      %5351 = func.call @cc_intern(%5347, %5350) : (i64, i64) -> i64
      %5352 = func.call @cc_nil_value() : () -> i64
      %5353 = func.call @cc_cons(%5351, %5352) : (i64, i64) -> i64
      %5354 = func.call @cc_values_pack(%5353) : (i64) -> i64
      func.call @stack_push_pointer(%5351) : (i64) -> ()
      %5355 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5356 = arith.constant 19 : i64
      %5357 = func.call @cc_make_string(%5355, %5356) : (!llvm.ptr, i64) -> i64
      %5358 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5359 = arith.constant 11 : i64
      %5360 = func.call @cc_make_string(%5358, %5359) : (!llvm.ptr, i64) -> i64
      %5361 = func.call @cc_intern(%5357, %5360) : (i64, i64) -> i64
      %5362 = func.call @cc_nil_value() : () -> i64
      %5363 = func.call @cc_cons(%5361, %5362) : (i64, i64) -> i64
      %5364 = func.call @cc_values_pack(%5363) : (i64) -> i64
      func.call @stack_push_pointer(%5361) : (i64) -> ()
      %5365 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5366 = arith.constant 5 : i64
      %5367 = func.call @cc_make_string(%5365, %5366) : (!llvm.ptr, i64) -> i64
      %5368 = func.call @cc_nil_value() : () -> i64
      %5369 = func.call @cc_intern(%5367, %5368) : (i64, i64) -> i64
      %5370 = func.call @cc_nil_value() : () -> i64
      %5371 = func.call @cc_cons(%5369, %5370) : (i64, i64) -> i64
      %5372 = func.call @cc_values_pack(%5371) : (i64) -> i64
      func.call @stack_push_pointer(%5369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5373 = func.call @stack_pop_pointer() : () -> i64
      %5374 = func.call @stack_pop_pointer() : () -> i64
      %5375 = func.call @cc_cons(%5374, %5373) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %5376 = arith.addi %5375, %__rlasp_stack_elide_zero_237 : i64
      %5377 = func.call @stack_pop_pointer() : () -> i64
      %5378 = func.call @cc_cons(%5377, %5376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5378) : (i64) -> ()
      %5379 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5380 = arith.constant 6 : i64
      %5381 = func.call @cc_make_string(%5379, %5380) : (!llvm.ptr, i64) -> i64
      %5382 = func.call @cc_nil_value() : () -> i64
      %5383 = func.call @cc_intern(%5381, %5382) : (i64, i64) -> i64
      %5384 = func.call @cc_nil_value() : () -> i64
      %5385 = func.call @cc_cons(%5383, %5384) : (i64, i64) -> i64
      %5386 = func.call @cc_values_pack(%5385) : (i64) -> i64
      func.call @stack_push_pointer(%5383) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5387 = func.call @stack_pop_pointer() : () -> i64
      %5388 = func.call @stack_pop_pointer() : () -> i64
      %5389 = func.call @cc_cons(%5388, %5387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %5390 = arith.addi %5389, %__rlasp_stack_elide_zero_238 : i64
      %5391 = func.call @stack_pop_pointer() : () -> i64
      %5392 = func.call @cc_cons(%5391, %5390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %5393 = arith.addi %5392, %__rlasp_stack_elide_zero_239 : i64
      %5394 = func.call @stack_pop_pointer() : () -> i64
      %5395 = func.call @cc_cons(%5394, %5393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5396 = func.call @stack_pop_pointer() : () -> i64
      %5397 = func.call @stack_pop_pointer() : () -> i64
      %5398 = func.call @cc_cons(%5397, %5396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %5399 = arith.addi %5398, %__rlasp_stack_elide_zero_240 : i64
      %5400 = func.call @stack_pop_pointer() : () -> i64
      %5401 = func.call @cc_cons(%5400, %5399) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %5402 = arith.addi %5401, %__rlasp_stack_elide_zero_241 : i64
      %5403 = func.call @stack_pop_pointer() : () -> i64
      %5404 = func.call @cc_cons(%5403, %5402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5404) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5405 = func.call @stack_pop_pointer() : () -> i64
      %5406 = func.call @stack_pop_pointer() : () -> i64
      %5407 = func.call @cc_cons(%5406, %5405) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %5408 = arith.addi %5407, %__rlasp_stack_elide_zero_242 : i64
      %5409 = func.call @stack_pop_pointer() : () -> i64
      %5410 = func.call @cc_cons(%5409, %5408) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %5411 = arith.addi %5410, %__rlasp_stack_elide_zero_243 : i64
      %5412 = func.call @stack_pop_pointer() : () -> i64
      %5413 = func.call @cc_cons(%5412, %5411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5414 = func.call @stack_pop_pointer() : () -> i64
      %5415 = func.call @stack_pop_pointer() : () -> i64
      %5416 = func.call @cc_cons(%5415, %5414) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %5417 = arith.addi %5416, %__rlasp_stack_elide_zero_244 : i64
      %5418 = func.call @stack_pop_pointer() : () -> i64
      %5419 = func.call @cc_cons(%5418, %5417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5419) : (i64) -> ()
      %5420 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5421 = arith.constant 6 : i64
      %5422 = func.call @cc_make_string(%5420, %5421) : (!llvm.ptr, i64) -> i64
      %5423 = func.call @cc_nil_value() : () -> i64
      %5424 = func.call @cc_intern(%5422, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_nil_value() : () -> i64
      %5426 = func.call @cc_cons(%5424, %5425) : (i64, i64) -> i64
      %5427 = func.call @cc_values_pack(%5426) : (i64) -> i64
      func.call @stack_push_pointer(%5424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5428 = func.call @stack_pop_pointer() : () -> i64
      %5429 = func.call @stack_pop_pointer() : () -> i64
      %5430 = func.call @cc_cons(%5429, %5428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %5431 = arith.addi %5430, %__rlasp_stack_elide_zero_245 : i64
      %5432 = func.call @stack_pop_pointer() : () -> i64
      %5433 = func.call @cc_cons(%5432, %5431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %5434 = arith.addi %5433, %__rlasp_stack_elide_zero_246 : i64
      %5435 = func.call @stack_pop_pointer() : () -> i64
      %5436 = func.call @cc_cons(%5435, %5434) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %5437 = arith.addi %5436, %__rlasp_stack_elide_zero_247 : i64
      %5438 = func.call @stack_pop_pointer() : () -> i64
      %5439 = func.call @cc_cons(%5438, %5437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5439) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5440 = func.call @stack_pop_pointer() : () -> i64
      %5441 = func.call @stack_pop_pointer() : () -> i64
      %5442 = func.call @cc_cons(%5441, %5440) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %5443 = arith.addi %5442, %__rlasp_stack_elide_zero_248 : i64
      %5444 = func.call @stack_pop_pointer() : () -> i64
      %5445 = func.call @cc_cons(%5444, %5443) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %5446 = arith.addi %5445, %__rlasp_stack_elide_zero_249 : i64
      %5447 = func.call @stack_pop_pointer() : () -> i64
      %5448 = func.call @cc_cons(%5447, %5446) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %5449 = arith.addi %5448, %__rlasp_stack_elide_zero_250 : i64
      %5450 = func.call @stack_pop_pointer() : () -> i64
      %5451 = func.call @cc_cons(%5450, %5449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5451) : (i64) -> ()
      %5452 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5453 = arith.constant 5 : i64
      %5454 = func.call @cc_make_string(%5452, %5453) : (!llvm.ptr, i64) -> i64
      %5455 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5456 = arith.constant 11 : i64
      %5457 = func.call @cc_make_string(%5455, %5456) : (!llvm.ptr, i64) -> i64
      %5458 = func.call @cc_intern(%5454, %5457) : (i64, i64) -> i64
      %5459 = func.call @cc_nil_value() : () -> i64
      %5460 = func.call @cc_cons(%5458, %5459) : (i64, i64) -> i64
      %5461 = func.call @cc_values_pack(%5460) : (i64) -> i64
      func.call @stack_push_pointer(%5458) : (i64) -> ()
      %5462 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5463 = arith.constant 3 : i64
      %5464 = func.call @cc_make_string(%5462, %5463) : (!llvm.ptr, i64) -> i64
      %5465 = func.call @cc_nil_value() : () -> i64
      %5466 = func.call @cc_intern(%5464, %5465) : (i64, i64) -> i64
      %5467 = func.call @cc_nil_value() : () -> i64
      %5468 = func.call @cc_cons(%5466, %5467) : (i64, i64) -> i64
      %5469 = func.call @cc_values_pack(%5468) : (i64) -> i64
      func.call @stack_push_pointer(%5466) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5470 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5471 = arith.constant 3 : i64
      %5472 = func.call @cc_make_string(%5470, %5471) : (!llvm.ptr, i64) -> i64
      %5473 = func.call @cc_nil_value() : () -> i64
      %5474 = func.call @cc_intern(%5472, %5473) : (i64, i64) -> i64
      %5475 = func.call @cc_nil_value() : () -> i64
      %5476 = func.call @cc_cons(%5474, %5475) : (i64, i64) -> i64
      %5477 = func.call @cc_values_pack(%5476) : (i64) -> i64
      func.call @stack_push_pointer(%5474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5478 = func.call @stack_pop_pointer() : () -> i64
      %5479 = func.call @stack_pop_pointer() : () -> i64
      %5480 = func.call @cc_cons(%5479, %5478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5480) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5481 = func.call @stack_pop_pointer() : () -> i64
      %5482 = func.call @stack_pop_pointer() : () -> i64
      %5483 = func.call @cc_cons(%5482, %5481) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %5484 = arith.addi %5483, %__rlasp_stack_elide_zero_251 : i64
      %5485 = func.call @stack_pop_pointer() : () -> i64
      %5486 = func.call @cc_cons(%5485, %5484) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %5487 = arith.addi %5486, %__rlasp_stack_elide_zero_252 : i64
      %5488 = func.call @stack_pop_pointer() : () -> i64
      %5489 = func.call @cc_cons(%5488, %5487) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %5490 = arith.addi %5489, %__rlasp_stack_elide_zero_253 : i64
      %5491 = func.call @stack_pop_pointer() : () -> i64
      %5492 = func.call @cc_cons(%5491, %5490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5493 = func.call @stack_pop_pointer() : () -> i64
      %5494 = func.call @stack_pop_pointer() : () -> i64
      %5495 = func.call @cc_cons(%5494, %5493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %5496 = arith.addi %5495, %__rlasp_stack_elide_zero_254 : i64
      %5497 = func.call @stack_pop_pointer() : () -> i64
      %5498 = func.call @cc_cons(%5497, %5496) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %5499 = arith.addi %5498, %__rlasp_stack_elide_zero_255 : i64
      %5500 = func.call @stack_pop_pointer() : () -> i64
      %5501 = func.call @cc_cons(%5500, %5499) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %5502 = arith.addi %5501, %__rlasp_stack_elide_zero_256 : i64
      %5503 = func.call @stack_pop_pointer() : () -> i64
      %5504 = func.call @cc_cons(%5503, %5502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %5505 = arith.addi %5504, %__rlasp_stack_elide_zero_257 : i64
      %5506 = func.call @stack_pop_pointer() : () -> i64
      %5507 = func.call @cc_cons(%5505, %5506) : (i64, i64) -> i64
      %5508 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5509 = arith.constant 5 : i64
      %5510 = func.call @cc_make_string(%5508, %5509) : (!llvm.ptr, i64) -> i64
      %5511 = func.call @cc_nil_value() : () -> i64
      %5512 = func.call @cc_intern(%5510, %5511) : (i64, i64) -> i64
      %5513 = func.call @cc_nil_value() : () -> i64
      %5514 = func.call @cc_cons(%5512, %5513) : (i64, i64) -> i64
      %5515 = func.call @cc_values_pack(%5514) : (i64) -> i64
      %5516 = func.call @cc_cons(%5512, %5507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5516) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5517 = func.call @stack_pop_pointer() : () -> i64
      %5518 = func.call @stack_pop_pointer() : () -> i64
      %5519 = func.call @cc_cons(%5518, %5517) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %5520 = arith.addi %5519, %__rlasp_stack_elide_zero_258 : i64
      %5521 = func.call @stack_pop_pointer() : () -> i64
      %5522 = func.call @cc_cons(%5521, %5520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5523 = func.call @stack_pop_pointer() : () -> i64
      %5524 = func.call @stack_pop_pointer() : () -> i64
      %5525 = func.call @cc_cons(%5524, %5523) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %5526 = arith.addi %5525, %__rlasp_stack_elide_zero_259 : i64
      %5527 = func.call @stack_pop_pointer() : () -> i64
      %5528 = func.call @cc_cons(%5527, %5526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5528) : (i64) -> ()
      %5529 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5530 = arith.constant 6 : i64
      %5531 = func.call @cc_make_string(%5529, %5530) : (!llvm.ptr, i64) -> i64
      %5532 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5533 = arith.constant 11 : i64
      %5534 = func.call @cc_make_string(%5532, %5533) : (!llvm.ptr, i64) -> i64
      %5535 = func.call @cc_intern(%5531, %5534) : (i64, i64) -> i64
      %5536 = func.call @cc_nil_value() : () -> i64
      %5537 = func.call @cc_cons(%5535, %5536) : (i64, i64) -> i64
      %5538 = func.call @cc_values_pack(%5537) : (i64) -> i64
      func.call @stack_push_pointer(%5535) : (i64) -> ()
      %5539 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5539) : (i64) -> ()
      %5540 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5541 = arith.constant 3 : i64
      %5542 = func.call @cc_make_string(%5540, %5541) : (!llvm.ptr, i64) -> i64
      %5543 = func.call @cc_nil_value() : () -> i64
      %5544 = func.call @cc_intern(%5542, %5543) : (i64, i64) -> i64
      %5545 = func.call @cc_nil_value() : () -> i64
      %5546 = func.call @cc_cons(%5544, %5545) : (i64, i64) -> i64
      %5547 = func.call @cc_values_pack(%5546) : (i64) -> i64
      func.call @stack_push_pointer(%5544) : (i64) -> ()
      %5548 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5549 = arith.constant 3 : i64
      %5550 = func.call @cc_make_string(%5548, %5549) : (!llvm.ptr, i64) -> i64
      %5551 = func.call @cc_nil_value() : () -> i64
      %5552 = func.call @cc_intern(%5550, %5551) : (i64, i64) -> i64
      %5553 = func.call @cc_nil_value() : () -> i64
      %5554 = func.call @cc_cons(%5552, %5553) : (i64, i64) -> i64
      %5555 = func.call @cc_values_pack(%5554) : (i64) -> i64
      func.call @stack_push_pointer(%5552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5556 = func.call @stack_pop_pointer() : () -> i64
      %5557 = func.call @stack_pop_pointer() : () -> i64
      %5558 = func.call @cc_cons(%5557, %5556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %5559 = arith.addi %5558, %__rlasp_stack_elide_zero_260 : i64
      %5560 = func.call @stack_pop_pointer() : () -> i64
      %5561 = func.call @cc_cons(%5560, %5559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %5562 = arith.addi %5561, %__rlasp_stack_elide_zero_261 : i64
      %5563 = func.call @stack_pop_pointer() : () -> i64
      %5564 = func.call @cc_cons(%5562, %5563) : (i64, i64) -> i64
      %5565 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5566 = arith.constant 5 : i64
      %5567 = func.call @cc_make_string(%5565, %5566) : (!llvm.ptr, i64) -> i64
      %5568 = func.call @cc_nil_value() : () -> i64
      %5569 = func.call @cc_intern(%5567, %5568) : (i64, i64) -> i64
      %5570 = func.call @cc_nil_value() : () -> i64
      %5571 = func.call @cc_cons(%5569, %5570) : (i64, i64) -> i64
      %5572 = func.call @cc_values_pack(%5571) : (i64) -> i64
      %5573 = func.call @cc_cons(%5569, %5564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5573) : (i64) -> ()
      %5574 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5575 = arith.constant 7 : i64
      %5576 = func.call @cc_make_string(%5574, %5575) : (!llvm.ptr, i64) -> i64
      %5577 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5578 = arith.constant 11 : i64
      %5579 = func.call @cc_make_string(%5577, %5578) : (!llvm.ptr, i64) -> i64
      %5580 = func.call @cc_intern(%5576, %5579) : (i64, i64) -> i64
      %5581 = func.call @cc_nil_value() : () -> i64
      %5582 = func.call @cc_cons(%5580, %5581) : (i64, i64) -> i64
      %5583 = func.call @cc_values_pack(%5582) : (i64) -> i64
      func.call @stack_push_pointer(%5580) : (i64) -> ()
      %5584 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5585 = arith.constant 11 : i64
      %5586 = func.call @cc_make_string(%5584, %5585) : (!llvm.ptr, i64) -> i64
      %5587 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5588 = arith.constant 11 : i64
      %5589 = func.call @cc_make_string(%5587, %5588) : (!llvm.ptr, i64) -> i64
      %5590 = func.call @cc_intern(%5586, %5589) : (i64, i64) -> i64
      %5591 = func.call @cc_nil_value() : () -> i64
      %5592 = func.call @cc_cons(%5590, %5591) : (i64, i64) -> i64
      %5593 = func.call @cc_values_pack(%5592) : (i64) -> i64
      func.call @stack_push_pointer(%5590) : (i64) -> ()
      %5594 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5594) : (i64) -> ()
      %5595 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5596 = arith.constant 3 : i64
      %5597 = func.call @cc_make_string(%5595, %5596) : (!llvm.ptr, i64) -> i64
      %5598 = func.call @cc_nil_value() : () -> i64
      %5599 = func.call @cc_intern(%5597, %5598) : (i64, i64) -> i64
      %5600 = func.call @cc_nil_value() : () -> i64
      %5601 = func.call @cc_cons(%5599, %5600) : (i64, i64) -> i64
      %5602 = func.call @cc_values_pack(%5601) : (i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %5603 = arith.addi %5599, %__rlasp_stack_elide_zero_262 : i64
      %5604 = func.call @stack_pop_pointer() : () -> i64
      %5605 = func.call @cc_cons(%5603, %5604) : (i64, i64) -> i64
      %5606 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5607 = arith.constant 5 : i64
      %5608 = func.call @cc_make_string(%5606, %5607) : (!llvm.ptr, i64) -> i64
      %5609 = func.call @cc_nil_value() : () -> i64
      %5610 = func.call @cc_intern(%5608, %5609) : (i64, i64) -> i64
      %5611 = func.call @cc_nil_value() : () -> i64
      %5612 = func.call @cc_cons(%5610, %5611) : (i64, i64) -> i64
      %5613 = func.call @cc_values_pack(%5612) : (i64) -> i64
      %5614 = func.call @cc_cons(%5610, %5605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5614) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5615 = func.call @stack_pop_pointer() : () -> i64
      %5616 = func.call @stack_pop_pointer() : () -> i64
      %5617 = func.call @cc_cons(%5616, %5615) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %5618 = arith.addi %5617, %__rlasp_stack_elide_zero_263 : i64
      %5619 = func.call @stack_pop_pointer() : () -> i64
      %5620 = func.call @cc_cons(%5619, %5618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5620) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5621 = func.call @stack_pop_pointer() : () -> i64
      %5622 = func.call @stack_pop_pointer() : () -> i64
      %5623 = func.call @cc_cons(%5622, %5621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %5624 = arith.addi %5623, %__rlasp_stack_elide_zero_264 : i64
      %5625 = func.call @stack_pop_pointer() : () -> i64
      %5626 = func.call @cc_cons(%5625, %5624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5627 = func.call @stack_pop_pointer() : () -> i64
      %5628 = func.call @stack_pop_pointer() : () -> i64
      %5629 = func.call @cc_cons(%5628, %5627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %5630 = arith.addi %5629, %__rlasp_stack_elide_zero_265 : i64
      %5631 = func.call @stack_pop_pointer() : () -> i64
      %5632 = func.call @cc_cons(%5631, %5630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %5633 = arith.addi %5632, %__rlasp_stack_elide_zero_266 : i64
      %5634 = func.call @stack_pop_pointer() : () -> i64
      %5635 = func.call @cc_cons(%5634, %5633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5636 = func.call @stack_pop_pointer() : () -> i64
      %5637 = func.call @stack_pop_pointer() : () -> i64
      %5638 = func.call @cc_cons(%5637, %5636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %5639 = arith.addi %5638, %__rlasp_stack_elide_zero_267 : i64
      %5640 = func.call @stack_pop_pointer() : () -> i64
      %5641 = func.call @cc_cons(%5640, %5639) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %5642 = arith.addi %5641, %__rlasp_stack_elide_zero_268 : i64
      %5643 = func.call @stack_pop_pointer() : () -> i64
      %5644 = func.call @cc_cons(%5643, %5642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5644) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5645 = func.call @stack_pop_pointer() : () -> i64
      %5646 = func.call @stack_pop_pointer() : () -> i64
      %5647 = func.call @cc_cons(%5646, %5645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %5648 = arith.addi %5647, %__rlasp_stack_elide_zero_269 : i64
      %5649 = func.call @stack_pop_pointer() : () -> i64
      %5650 = func.call @cc_cons(%5649, %5648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5650) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5651 = func.call @stack_pop_pointer() : () -> i64
      %5652 = func.call @stack_pop_pointer() : () -> i64
      %5653 = func.call @cc_cons(%5652, %5651) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %5654 = arith.addi %5653, %__rlasp_stack_elide_zero_270 : i64
      %5655 = func.call @stack_pop_pointer() : () -> i64
      %5656 = func.call @cc_cons(%5655, %5654) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %5657 = arith.addi %5656, %__rlasp_stack_elide_zero_271 : i64
      %6018 = arith.constant 97047688511533 : i64
      %6019 = arith.constant 0 : i64
      %6020 = func.call @cc_make_closure(%6018, %6019) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %6021 = arith.addi %6020, %__rlasp_stack_elide_zero_272 : i64
      %6022 = llvm.mlir.addressof @str510 : !llvm.ptr
      %6023 = arith.constant 1 : i64
      %6024 = func.call @cc_make_string(%6022, %6023) : (!llvm.ptr, i64) -> i64
      %6025 = func.call @cc_nil_value() : () -> i64
      %6026 = func.call @cc_intern(%6024, %6025) : (i64, i64) -> i64
      %6027 = func.call @cc_nil_value() : () -> i64
      %6028 = func.call @cc_cons(%6026, %6027) : (i64, i64) -> i64
      %6029 = func.call @cc_values_pack(%6028) : (i64) -> i64
      func.call @stack_push_pointer(%6026) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6030 = func.call @stack_pop_pointer() : () -> i64
      %6031 = func.call @stack_pop_pointer() : () -> i64
      %6032 = func.call @cc_cons(%6031, %6030) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %6033 = arith.addi %6032, %__rlasp_stack_elide_zero_273 : i64
      %6034 = llvm.mlir.addressof @str511 : !llvm.ptr
      %6035 = arith.constant 11 : i64
      %6036 = func.call @cc_make_string(%6034, %6035) : (!llvm.ptr, i64) -> i64
      %6037 = llvm.mlir.addressof @str512 : !llvm.ptr
      %6038 = arith.constant 7 : i64
      %6039 = func.call @cc_make_string(%6037, %6038) : (!llvm.ptr, i64) -> i64
      %6040 = func.call @cc_intern(%6036, %6039) : (i64, i64) -> i64
      %6041 = func.call @cc_nil_value() : () -> i64
      %6042 = func.call @cc_cons(%6040, %6041) : (i64, i64) -> i64
      %6043 = func.call @cc_values_pack(%6042) : (i64) -> i64
      %6044 = func.call @cc_nil_value() : () -> i64
      %6045 = llvm.mlir.addressof @str513 : !llvm.ptr
      %6046 = arith.constant 4 : i64
      %6047 = func.call @cc_make_string(%6045, %6046) : (!llvm.ptr, i64) -> i64
      %6048 = llvm.mlir.addressof @str514 : !llvm.ptr
      %6049 = arith.constant 7 : i64
      %6050 = func.call @cc_make_string(%6048, %6049) : (!llvm.ptr, i64) -> i64
      %6051 = func.call @cc_intern(%6047, %6050) : (i64, i64) -> i64
      %6052 = func.call @cc_nil_value() : () -> i64
      %6053 = func.call @cc_cons(%6051, %6052) : (i64, i64) -> i64
      %6054 = func.call @cc_values_pack(%6053) : (i64) -> i64
      %6055 = llvm.mlir.addressof @str515 : !llvm.ptr
      %6056 = arith.constant 6 : i64
      %6057 = func.call @cc_make_string(%6055, %6056) : (!llvm.ptr, i64) -> i64
      %6058 = func.call @cc_nil_value() : () -> i64
      %6059 = func.call @cc_intern(%6057, %6058) : (i64, i64) -> i64
      %6060 = func.call @cc_nil_value() : () -> i64
      %6061 = func.call @cc_cons(%6059, %6060) : (i64, i64) -> i64
      %6062 = func.call @cc_values_pack(%6061) : (i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %6063 = arith.addi %6059, %__rlasp_stack_elide_zero_274 : i64
      %6064 = func.call @cc_nil_value() : () -> i64
      %6065 = func.call @cc_errorp(%5150) : (i64) -> i64
      %6066 = arith.cmpi ne, %6065, %6064 : i64
      %6067 = arith.cmpi eq, %6064, %6064 : i64
      %6068 = arith.andi %6066, %6067 : i1
      %6069 = scf.if %6068 -> (i64) {
        scf.yield %5150 : i64
      } else {
        scf.yield %6064 : i64
      }
      %6070 = func.call @cc_errorp(%5657) : (i64) -> i64
      %6071 = arith.cmpi ne, %6070, %6064 : i64
      %6072 = arith.cmpi eq, %6069, %6064 : i64
      %6073 = arith.andi %6071, %6072 : i1
      %6074 = scf.if %6073 -> (i64) {
        scf.yield %5657 : i64
      } else {
        scf.yield %6069 : i64
      }
      %6075 = func.call @cc_errorp(%6021) : (i64) -> i64
      %6076 = arith.cmpi ne, %6075, %6064 : i64
      %6077 = arith.cmpi eq, %6074, %6064 : i64
      %6078 = arith.andi %6076, %6077 : i1
      %6079 = scf.if %6078 -> (i64) {
        scf.yield %6021 : i64
      } else {
        scf.yield %6074 : i64
      }
      %6080 = func.call @cc_errorp(%6033) : (i64) -> i64
      %6081 = arith.cmpi ne, %6080, %6064 : i64
      %6082 = arith.cmpi eq, %6079, %6064 : i64
      %6083 = arith.andi %6081, %6082 : i1
      %6084 = scf.if %6083 -> (i64) {
        scf.yield %6033 : i64
      } else {
        scf.yield %6079 : i64
      }
      %6085 = func.call @cc_errorp(%6040) : (i64) -> i64
      %6086 = arith.cmpi ne, %6085, %6064 : i64
      %6087 = arith.cmpi eq, %6084, %6064 : i64
      %6088 = arith.andi %6086, %6087 : i1
      %6089 = scf.if %6088 -> (i64) {
        scf.yield %6040 : i64
      } else {
        scf.yield %6084 : i64
      }
      %6090 = func.call @cc_errorp(%6044) : (i64) -> i64
      %6091 = arith.cmpi ne, %6090, %6064 : i64
      %6092 = arith.cmpi eq, %6089, %6064 : i64
      %6093 = arith.andi %6091, %6092 : i1
      %6094 = scf.if %6093 -> (i64) {
        scf.yield %6044 : i64
      } else {
        scf.yield %6089 : i64
      }
      %6095 = func.call @cc_errorp(%6051) : (i64) -> i64
      %6096 = arith.cmpi ne, %6095, %6064 : i64
      %6097 = arith.cmpi eq, %6094, %6064 : i64
      %6098 = arith.andi %6096, %6097 : i1
      %6099 = scf.if %6098 -> (i64) {
        scf.yield %6051 : i64
      } else {
        scf.yield %6094 : i64
      }
      %6100 = func.call @cc_errorp(%6063) : (i64) -> i64
      %6101 = arith.cmpi ne, %6100, %6064 : i64
      %6102 = arith.cmpi eq, %6099, %6064 : i64
      %6103 = arith.andi %6101, %6102 : i1
      %6104 = scf.if %6103 -> (i64) {
        scf.yield %6063 : i64
      } else {
        scf.yield %6099 : i64
      }
      %6105 = arith.cmpi ne, %6104, %6064 : i64
      scf.if %6105 {
        func.call @stack_push_pointer(%6104) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5150) : (i64) -> ()
        func.call @stack_push_pointer(%5657) : (i64) -> ()
        func.call @stack_push_pointer(%6021) : (i64) -> ()
        func.call @stack_push_pointer(%6033) : (i64) -> ()
        func.call @stack_push_pointer(%6040) : (i64) -> ()
        func.call @stack_push_pointer(%6044) : (i64) -> ()
        func.call @stack_push_pointer(%6051) : (i64) -> ()
        func.call @stack_push_pointer(%6063) : (i64) -> ()
        %6106 = llvm.mlir.addressof @str516 : !llvm.ptr
        %6107 = func.call @cc_make_function_ref_const(%6106) : (!llvm.ptr) -> i64
        %6108 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6107, %6108) : (i64, i64) -> ()
      }
      %6109 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6109 : i64
    }
    %6110 = func.call @cc_nil_value() : () -> i64
    %6111 = func.call @cc_errorp(%5141) : (i64) -> i64
    %6112 = arith.cmpi ne, %6111, %6110 : i64
    %6113 = scf.if %6112 -> (i64) {
      scf.yield %5141 : i64
    } else {
      %6114 = llvm.mlir.addressof @str517 : !llvm.ptr
      %6115 = arith.constant 21 : i64
      %6116 = func.call @cc_make_string(%6114, %6115) : (!llvm.ptr, i64) -> i64
      %6117 = func.call @cc_nil_value() : () -> i64
      %6118 = func.call @cc_intern(%6116, %6117) : (i64, i64) -> i64
      %6119 = func.call @cc_nil_value() : () -> i64
      %6120 = func.call @cc_cons(%6118, %6119) : (i64, i64) -> i64
      %6121 = func.call @cc_values_pack(%6120) : (i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %6122 = arith.addi %6118, %__rlasp_stack_elide_zero_275 : i64
      %6123 = llvm.mlir.addressof @str518 : !llvm.ptr
      %6124 = arith.constant 5 : i64
      %6125 = func.call @cc_make_string(%6123, %6124) : (!llvm.ptr, i64) -> i64
      %6126 = func.call @cc_nil_value() : () -> i64
      %6127 = func.call @cc_intern(%6125, %6126) : (i64, i64) -> i64
      %6128 = func.call @cc_nil_value() : () -> i64
      %6129 = func.call @cc_cons(%6127, %6128) : (i64, i64) -> i64
      %6130 = func.call @cc_values_pack(%6129) : (i64) -> i64
      func.call @stack_push_pointer(%6127) : (i64) -> ()
      %6131 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6132 = arith.constant 7 : i64
      %6133 = func.call @cc_make_string(%6131, %6132) : (!llvm.ptr, i64) -> i64
      %6134 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6135 = arith.constant 11 : i64
      %6136 = func.call @cc_make_string(%6134, %6135) : (!llvm.ptr, i64) -> i64
      %6137 = func.call @cc_intern(%6133, %6136) : (i64, i64) -> i64
      %6138 = func.call @cc_nil_value() : () -> i64
      %6139 = func.call @cc_cons(%6137, %6138) : (i64, i64) -> i64
      %6140 = func.call @cc_values_pack(%6139) : (i64) -> i64
      func.call @stack_push_pointer(%6137) : (i64) -> ()
      %6141 = llvm.mlir.addressof @str521 : !llvm.ptr
      %6142 = arith.constant 11 : i64
      %6143 = func.call @cc_make_string(%6141, %6142) : (!llvm.ptr, i64) -> i64
      %6144 = llvm.mlir.addressof @str522 : !llvm.ptr
      %6145 = arith.constant 3 : i64
      %6146 = func.call @cc_make_string(%6144, %6145) : (!llvm.ptr, i64) -> i64
      %6147 = func.call @cc_intern(%6143, %6146) : (i64, i64) -> i64
      %6148 = func.call @cc_nil_value() : () -> i64
      %6149 = func.call @cc_cons(%6147, %6148) : (i64, i64) -> i64
      %6150 = func.call @cc_values_pack(%6149) : (i64) -> i64
      func.call @stack_push_pointer(%6147) : (i64) -> ()
      %6151 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6151) : (i64) -> ()
      %6152 = llvm.mlir.addressof @str523 : !llvm.ptr
      %6153 = arith.constant 6 : i64
      %6154 = func.call @cc_make_string(%6152, %6153) : (!llvm.ptr, i64) -> i64
      %6155 = llvm.mlir.addressof @str524 : !llvm.ptr
      %6156 = arith.constant 11 : i64
      %6157 = func.call @cc_make_string(%6155, %6156) : (!llvm.ptr, i64) -> i64
      %6158 = func.call @cc_intern(%6154, %6157) : (i64, i64) -> i64
      %6159 = func.call @cc_nil_value() : () -> i64
      %6160 = func.call @cc_cons(%6158, %6159) : (i64, i64) -> i64
      %6161 = func.call @cc_values_pack(%6160) : (i64) -> i64
      func.call @stack_push_pointer(%6158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6162 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6163 = arith.constant 5 : i64
      %6164 = func.call @cc_make_string(%6162, %6163) : (!llvm.ptr, i64) -> i64
      %6165 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6166 = arith.constant 11 : i64
      %6167 = func.call @cc_make_string(%6165, %6166) : (!llvm.ptr, i64) -> i64
      %6168 = func.call @cc_intern(%6164, %6167) : (i64, i64) -> i64
      %6169 = func.call @cc_nil_value() : () -> i64
      %6170 = func.call @cc_cons(%6168, %6169) : (i64, i64) -> i64
      %6171 = func.call @cc_values_pack(%6170) : (i64) -> i64
      func.call @stack_push_pointer(%6168) : (i64) -> ()
      %6172 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6173 = arith.constant 3 : i64
      %6174 = func.call @cc_make_string(%6172, %6173) : (!llvm.ptr, i64) -> i64
      %6175 = func.call @cc_nil_value() : () -> i64
      %6176 = func.call @cc_intern(%6174, %6175) : (i64, i64) -> i64
      %6177 = func.call @cc_nil_value() : () -> i64
      %6178 = func.call @cc_cons(%6176, %6177) : (i64, i64) -> i64
      %6179 = func.call @cc_values_pack(%6178) : (i64) -> i64
      func.call @stack_push_pointer(%6176) : (i64) -> ()
      %6180 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6181 = arith.constant 1 : i64
      %6182 = func.call @cc_make_string(%6180, %6181) : (!llvm.ptr, i64) -> i64
      %6183 = func.call @cc_nil_value() : () -> i64
      %6184 = func.call @cc_intern(%6182, %6183) : (i64, i64) -> i64
      %6185 = func.call @cc_nil_value() : () -> i64
      %6186 = func.call @cc_cons(%6184, %6185) : (i64, i64) -> i64
      %6187 = func.call @cc_values_pack(%6186) : (i64) -> i64
      func.call @stack_push_pointer(%6184) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6188 = func.call @stack_pop_pointer() : () -> i64
      %6189 = func.call @stack_pop_pointer() : () -> i64
      %6190 = func.call @cc_cons(%6189, %6188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6190) : (i64) -> ()
      %6191 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6192 = arith.constant 13 : i64
      %6193 = func.call @cc_make_string(%6191, %6192) : (!llvm.ptr, i64) -> i64
      %6194 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6195 = arith.constant 11 : i64
      %6196 = func.call @cc_make_string(%6194, %6195) : (!llvm.ptr, i64) -> i64
      %6197 = func.call @cc_intern(%6193, %6196) : (i64, i64) -> i64
      %6198 = func.call @cc_nil_value() : () -> i64
      %6199 = func.call @cc_cons(%6197, %6198) : (i64, i64) -> i64
      %6200 = func.call @cc_values_pack(%6199) : (i64) -> i64
      func.call @stack_push_pointer(%6197) : (i64) -> ()
      %6201 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6202 = arith.constant 6 : i64
      %6203 = func.call @cc_make_string(%6201, %6202) : (!llvm.ptr, i64) -> i64
      %6204 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6205 = arith.constant 11 : i64
      %6206 = func.call @cc_make_string(%6204, %6205) : (!llvm.ptr, i64) -> i64
      %6207 = func.call @cc_intern(%6203, %6206) : (i64, i64) -> i64
      %6208 = func.call @cc_nil_value() : () -> i64
      %6209 = func.call @cc_cons(%6207, %6208) : (i64, i64) -> i64
      %6210 = func.call @cc_values_pack(%6209) : (i64) -> i64
      func.call @stack_push_pointer(%6207) : (i64) -> ()
      %6211 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6212 = arith.constant 5 : i64
      %6213 = func.call @cc_make_string(%6211, %6212) : (!llvm.ptr, i64) -> i64
      %6214 = func.call @cc_nil_value() : () -> i64
      %6215 = func.call @cc_intern(%6213, %6214) : (i64, i64) -> i64
      %6216 = func.call @cc_nil_value() : () -> i64
      %6217 = func.call @cc_cons(%6215, %6216) : (i64, i64) -> i64
      %6218 = func.call @cc_values_pack(%6217) : (i64) -> i64
      func.call @stack_push_pointer(%6215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6219 = func.call @stack_pop_pointer() : () -> i64
      %6220 = func.call @stack_pop_pointer() : () -> i64
      %6221 = func.call @cc_cons(%6220, %6219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6221) : (i64) -> ()
      %6222 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6223 = arith.constant 4 : i64
      %6224 = func.call @cc_make_string(%6222, %6223) : (!llvm.ptr, i64) -> i64
      %6225 = llvm.mlir.addressof @str535 : !llvm.ptr
      %6226 = arith.constant 11 : i64
      %6227 = func.call @cc_make_string(%6225, %6226) : (!llvm.ptr, i64) -> i64
      %6228 = func.call @cc_intern(%6224, %6227) : (i64, i64) -> i64
      %6229 = func.call @cc_nil_value() : () -> i64
      %6230 = func.call @cc_cons(%6228, %6229) : (i64, i64) -> i64
      %6231 = func.call @cc_values_pack(%6230) : (i64) -> i64
      func.call @stack_push_pointer(%6228) : (i64) -> ()
      %6232 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6233 = arith.constant 2 : i64
      %6234 = func.call @cc_make_string(%6232, %6233) : (!llvm.ptr, i64) -> i64
      %6235 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6236 = arith.constant 11 : i64
      %6237 = func.call @cc_make_string(%6235, %6236) : (!llvm.ptr, i64) -> i64
      %6238 = func.call @cc_intern(%6234, %6237) : (i64, i64) -> i64
      %6239 = func.call @cc_nil_value() : () -> i64
      %6240 = func.call @cc_cons(%6238, %6239) : (i64, i64) -> i64
      %6241 = func.call @cc_values_pack(%6240) : (i64) -> i64
      func.call @stack_push_pointer(%6238) : (i64) -> ()
      %6242 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6243 = arith.constant 19 : i64
      %6244 = func.call @cc_make_string(%6242, %6243) : (!llvm.ptr, i64) -> i64
      %6245 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6246 = arith.constant 11 : i64
      %6247 = func.call @cc_make_string(%6245, %6246) : (!llvm.ptr, i64) -> i64
      %6248 = func.call @cc_intern(%6244, %6247) : (i64, i64) -> i64
      %6249 = func.call @cc_nil_value() : () -> i64
      %6250 = func.call @cc_cons(%6248, %6249) : (i64, i64) -> i64
      %6251 = func.call @cc_values_pack(%6250) : (i64) -> i64
      func.call @stack_push_pointer(%6248) : (i64) -> ()
      %6252 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6253 = arith.constant 5 : i64
      %6254 = func.call @cc_make_string(%6252, %6253) : (!llvm.ptr, i64) -> i64
      %6255 = func.call @cc_nil_value() : () -> i64
      %6256 = func.call @cc_intern(%6254, %6255) : (i64, i64) -> i64
      %6257 = func.call @cc_nil_value() : () -> i64
      %6258 = func.call @cc_cons(%6256, %6257) : (i64, i64) -> i64
      %6259 = func.call @cc_values_pack(%6258) : (i64) -> i64
      func.call @stack_push_pointer(%6256) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6260 = func.call @stack_pop_pointer() : () -> i64
      %6261 = func.call @stack_pop_pointer() : () -> i64
      %6262 = func.call @cc_cons(%6261, %6260) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %6263 = arith.addi %6262, %__rlasp_stack_elide_zero_276 : i64
      %6264 = func.call @stack_pop_pointer() : () -> i64
      %6265 = func.call @cc_cons(%6264, %6263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6265) : (i64) -> ()
      %6266 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6266) : (i64) -> ()
      %6267 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6268 = arith.constant 3 : i64
      %6269 = func.call @cc_make_string(%6267, %6268) : (!llvm.ptr, i64) -> i64
      %6270 = func.call @cc_nil_value() : () -> i64
      %6271 = func.call @cc_intern(%6269, %6270) : (i64, i64) -> i64
      %6272 = func.call @cc_nil_value() : () -> i64
      %6273 = func.call @cc_cons(%6271, %6272) : (i64, i64) -> i64
      %6274 = func.call @cc_values_pack(%6273) : (i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %6275 = arith.addi %6271, %__rlasp_stack_elide_zero_277 : i64
      %6276 = func.call @stack_pop_pointer() : () -> i64
      %6277 = func.call @cc_cons(%6275, %6276) : (i64, i64) -> i64
      %6278 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6279 = arith.constant 5 : i64
      %6280 = func.call @cc_make_string(%6278, %6279) : (!llvm.ptr, i64) -> i64
      %6281 = func.call @cc_nil_value() : () -> i64
      %6282 = func.call @cc_intern(%6280, %6281) : (i64, i64) -> i64
      %6283 = func.call @cc_nil_value() : () -> i64
      %6284 = func.call @cc_cons(%6282, %6283) : (i64, i64) -> i64
      %6285 = func.call @cc_values_pack(%6284) : (i64) -> i64
      %6286 = func.call @cc_cons(%6282, %6277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6286) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6287 = func.call @stack_pop_pointer() : () -> i64
      %6288 = func.call @stack_pop_pointer() : () -> i64
      %6289 = func.call @cc_cons(%6288, %6287) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %6290 = arith.addi %6289, %__rlasp_stack_elide_zero_278 : i64
      %6291 = func.call @stack_pop_pointer() : () -> i64
      %6292 = func.call @cc_cons(%6291, %6290) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %6293 = arith.addi %6292, %__rlasp_stack_elide_zero_279 : i64
      %6294 = func.call @stack_pop_pointer() : () -> i64
      %6295 = func.call @cc_cons(%6294, %6293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6295) : (i64) -> ()
      %6296 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6297 = arith.constant 11 : i64
      %6298 = func.call @cc_make_string(%6296, %6297) : (!llvm.ptr, i64) -> i64
      %6299 = llvm.mlir.addressof @str544 : !llvm.ptr
      %6300 = arith.constant 11 : i64
      %6301 = func.call @cc_make_string(%6299, %6300) : (!llvm.ptr, i64) -> i64
      %6302 = func.call @cc_intern(%6298, %6301) : (i64, i64) -> i64
      %6303 = func.call @cc_nil_value() : () -> i64
      %6304 = func.call @cc_cons(%6302, %6303) : (i64, i64) -> i64
      %6305 = func.call @cc_values_pack(%6304) : (i64) -> i64
      func.call @stack_push_pointer(%6302) : (i64) -> ()
      %6306 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6307 = arith.constant 3 : i64
      %6308 = func.call @cc_make_string(%6306, %6307) : (!llvm.ptr, i64) -> i64
      %6309 = func.call @cc_nil_value() : () -> i64
      %6310 = func.call @cc_intern(%6308, %6309) : (i64, i64) -> i64
      %6311 = func.call @cc_nil_value() : () -> i64
      %6312 = func.call @cc_cons(%6310, %6311) : (i64, i64) -> i64
      %6313 = func.call @cc_values_pack(%6312) : (i64) -> i64
      func.call @stack_push_pointer(%6310) : (i64) -> ()
      %6314 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6315 = arith.constant 12 : i64
      %6316 = func.call @cc_make_string(%6314, %6315) : (!llvm.ptr, i64) -> i64
      %6317 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6318 = arith.constant 11 : i64
      %6319 = func.call @cc_make_string(%6317, %6318) : (!llvm.ptr, i64) -> i64
      %6320 = func.call @cc_intern(%6316, %6319) : (i64, i64) -> i64
      %6321 = func.call @cc_nil_value() : () -> i64
      %6322 = func.call @cc_cons(%6320, %6321) : (i64, i64) -> i64
      %6323 = func.call @cc_values_pack(%6322) : (i64) -> i64
      func.call @stack_push_pointer(%6320) : (i64) -> ()
      %6324 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6325 = arith.constant 5 : i64
      %6326 = func.call @cc_make_string(%6324, %6325) : (!llvm.ptr, i64) -> i64
      %6327 = func.call @cc_nil_value() : () -> i64
      %6328 = func.call @cc_intern(%6326, %6327) : (i64, i64) -> i64
      %6329 = func.call @cc_nil_value() : () -> i64
      %6330 = func.call @cc_cons(%6328, %6329) : (i64, i64) -> i64
      %6331 = func.call @cc_values_pack(%6330) : (i64) -> i64
      func.call @stack_push_pointer(%6328) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6332 = func.call @stack_pop_pointer() : () -> i64
      %6333 = func.call @stack_pop_pointer() : () -> i64
      %6334 = func.call @cc_cons(%6333, %6332) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %6335 = arith.addi %6334, %__rlasp_stack_elide_zero_280 : i64
      %6336 = func.call @stack_pop_pointer() : () -> i64
      %6337 = func.call @cc_cons(%6336, %6335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6337) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6338 = func.call @stack_pop_pointer() : () -> i64
      %6339 = func.call @stack_pop_pointer() : () -> i64
      %6340 = func.call @cc_cons(%6339, %6338) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %6341 = arith.addi %6340, %__rlasp_stack_elide_zero_281 : i64
      %6342 = func.call @stack_pop_pointer() : () -> i64
      %6343 = func.call @cc_cons(%6342, %6341) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %6344 = arith.addi %6343, %__rlasp_stack_elide_zero_282 : i64
      %6345 = func.call @stack_pop_pointer() : () -> i64
      %6346 = func.call @cc_cons(%6345, %6344) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6346) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6347 = func.call @stack_pop_pointer() : () -> i64
      %6348 = func.call @stack_pop_pointer() : () -> i64
      %6349 = func.call @cc_cons(%6348, %6347) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %6350 = arith.addi %6349, %__rlasp_stack_elide_zero_283 : i64
      %6351 = func.call @stack_pop_pointer() : () -> i64
      %6352 = func.call @cc_cons(%6351, %6350) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %6353 = arith.addi %6352, %__rlasp_stack_elide_zero_284 : i64
      %6354 = func.call @stack_pop_pointer() : () -> i64
      %6355 = func.call @cc_cons(%6354, %6353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6355) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6356 = func.call @stack_pop_pointer() : () -> i64
      %6357 = func.call @stack_pop_pointer() : () -> i64
      %6358 = func.call @cc_cons(%6357, %6356) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %6359 = arith.addi %6358, %__rlasp_stack_elide_zero_285 : i64
      %6360 = func.call @stack_pop_pointer() : () -> i64
      %6361 = func.call @cc_cons(%6360, %6359) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %6362 = arith.addi %6361, %__rlasp_stack_elide_zero_286 : i64
      %6363 = func.call @stack_pop_pointer() : () -> i64
      %6364 = func.call @cc_cons(%6363, %6362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6365 = func.call @stack_pop_pointer() : () -> i64
      %6366 = func.call @stack_pop_pointer() : () -> i64
      %6367 = func.call @cc_cons(%6366, %6365) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %6368 = arith.addi %6367, %__rlasp_stack_elide_zero_287 : i64
      %6369 = func.call @stack_pop_pointer() : () -> i64
      %6370 = func.call @cc_cons(%6369, %6368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6370) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6371 = func.call @stack_pop_pointer() : () -> i64
      %6372 = func.call @stack_pop_pointer() : () -> i64
      %6373 = func.call @cc_cons(%6372, %6371) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %6374 = arith.addi %6373, %__rlasp_stack_elide_zero_288 : i64
      %6375 = func.call @stack_pop_pointer() : () -> i64
      %6376 = func.call @cc_cons(%6375, %6374) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %6377 = arith.addi %6376, %__rlasp_stack_elide_zero_289 : i64
      %6378 = func.call @stack_pop_pointer() : () -> i64
      %6379 = func.call @cc_cons(%6378, %6377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %6380 = arith.addi %6379, %__rlasp_stack_elide_zero_290 : i64
      %6381 = func.call @stack_pop_pointer() : () -> i64
      %6382 = func.call @cc_cons(%6381, %6380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6382) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6383 = func.call @stack_pop_pointer() : () -> i64
      %6384 = func.call @stack_pop_pointer() : () -> i64
      %6385 = func.call @cc_cons(%6384, %6383) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %6386 = arith.addi %6385, %__rlasp_stack_elide_zero_291 : i64
      %6387 = func.call @stack_pop_pointer() : () -> i64
      %6388 = func.call @cc_cons(%6387, %6386) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %6389 = arith.addi %6388, %__rlasp_stack_elide_zero_292 : i64
      %6390 = func.call @stack_pop_pointer() : () -> i64
      %6391 = func.call @cc_cons(%6390, %6389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %6392 = arith.addi %6391, %__rlasp_stack_elide_zero_293 : i64
      %6393 = func.call @stack_pop_pointer() : () -> i64
      %6394 = func.call @cc_cons(%6392, %6393) : (i64, i64) -> i64
      %6395 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6396 = arith.constant 5 : i64
      %6397 = func.call @cc_make_string(%6395, %6396) : (!llvm.ptr, i64) -> i64
      %6398 = func.call @cc_nil_value() : () -> i64
      %6399 = func.call @cc_intern(%6397, %6398) : (i64, i64) -> i64
      %6400 = func.call @cc_nil_value() : () -> i64
      %6401 = func.call @cc_cons(%6399, %6400) : (i64, i64) -> i64
      %6402 = func.call @cc_values_pack(%6401) : (i64) -> i64
      %6403 = func.call @cc_cons(%6399, %6394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6404 = func.call @stack_pop_pointer() : () -> i64
      %6405 = func.call @stack_pop_pointer() : () -> i64
      %6406 = func.call @cc_cons(%6405, %6404) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %6407 = arith.addi %6406, %__rlasp_stack_elide_zero_294 : i64
      %6408 = func.call @stack_pop_pointer() : () -> i64
      %6409 = func.call @cc_cons(%6408, %6407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6410 = func.call @stack_pop_pointer() : () -> i64
      %6411 = func.call @stack_pop_pointer() : () -> i64
      %6412 = func.call @cc_cons(%6411, %6410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %6413 = arith.addi %6412, %__rlasp_stack_elide_zero_295 : i64
      %6414 = func.call @stack_pop_pointer() : () -> i64
      %6415 = func.call @cc_cons(%6414, %6413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6415) : (i64) -> ()
      %6416 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6417 = arith.constant 3 : i64
      %6418 = func.call @cc_make_string(%6416, %6417) : (!llvm.ptr, i64) -> i64
      %6419 = func.call @cc_nil_value() : () -> i64
      %6420 = func.call @cc_intern(%6418, %6419) : (i64, i64) -> i64
      %6421 = func.call @cc_nil_value() : () -> i64
      %6422 = func.call @cc_cons(%6420, %6421) : (i64, i64) -> i64
      %6423 = func.call @cc_values_pack(%6422) : (i64) -> i64
      func.call @stack_push_pointer(%6420) : (i64) -> ()
      %6424 = arith.constant 137 : i64
      func.call @stack_push_fixnum(%6424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6425 = func.call @stack_pop_pointer() : () -> i64
      %6426 = func.call @stack_pop_pointer() : () -> i64
      %6427 = func.call @cc_cons(%6426, %6425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %6428 = arith.addi %6427, %__rlasp_stack_elide_zero_296 : i64
      %6429 = func.call @stack_pop_pointer() : () -> i64
      %6430 = func.call @cc_cons(%6429, %6428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6430) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6431 = func.call @stack_pop_pointer() : () -> i64
      %6432 = func.call @stack_pop_pointer() : () -> i64
      %6433 = func.call @cc_cons(%6432, %6431) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %6434 = arith.addi %6433, %__rlasp_stack_elide_zero_297 : i64
      %6435 = func.call @stack_pop_pointer() : () -> i64
      %6436 = func.call @cc_cons(%6435, %6434) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %6437 = arith.addi %6436, %__rlasp_stack_elide_zero_298 : i64
      %6438 = func.call @stack_pop_pointer() : () -> i64
      %6439 = func.call @cc_cons(%6438, %6437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
      %6440 = arith.addi %6439, %__rlasp_stack_elide_zero_299 : i64
      %6677 = arith.constant 97047688511542 : i64
      %6678 = arith.constant 0 : i64
      %6679 = func.call @cc_make_closure(%6677, %6678) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
      %6680 = arith.addi %6679, %__rlasp_stack_elide_zero_300 : i64
      %6681 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6682 = arith.constant 1 : i64
      %6683 = func.call @cc_make_string(%6681, %6682) : (!llvm.ptr, i64) -> i64
      %6684 = func.call @cc_nil_value() : () -> i64
      %6685 = func.call @cc_intern(%6683, %6684) : (i64, i64) -> i64
      %6686 = func.call @cc_nil_value() : () -> i64
      %6687 = func.call @cc_cons(%6685, %6686) : (i64, i64) -> i64
      %6688 = func.call @cc_values_pack(%6687) : (i64) -> i64
      func.call @stack_push_pointer(%6685) : (i64) -> ()
      %6689 = arith.constant 137 : i64
      func.call @stack_push_fixnum(%6689) : (i64) -> ()
      %6690 = func.call @stack_pop_pointer() : () -> i64
      %6691 = func.call @stack_pop_pointer() : () -> i64
      %6692 = func.call @cc_cons(%6691, %6690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6692) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6693 = func.call @stack_pop_pointer() : () -> i64
      %6694 = func.call @stack_pop_pointer() : () -> i64
      %6695 = func.call @cc_cons(%6694, %6693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6696 = func.call @stack_pop_pointer() : () -> i64
      %6697 = func.call @stack_pop_pointer() : () -> i64
      %6698 = func.call @cc_cons(%6697, %6696) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
      %6699 = arith.addi %6698, %__rlasp_stack_elide_zero_301 : i64
      %6700 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6701 = arith.constant 11 : i64
      %6702 = func.call @cc_make_string(%6700, %6701) : (!llvm.ptr, i64) -> i64
      %6703 = llvm.mlir.addressof @str576 : !llvm.ptr
      %6704 = arith.constant 7 : i64
      %6705 = func.call @cc_make_string(%6703, %6704) : (!llvm.ptr, i64) -> i64
      %6706 = func.call @cc_intern(%6702, %6705) : (i64, i64) -> i64
      %6707 = func.call @cc_nil_value() : () -> i64
      %6708 = func.call @cc_cons(%6706, %6707) : (i64, i64) -> i64
      %6709 = func.call @cc_values_pack(%6708) : (i64) -> i64
      %6710 = func.call @cc_nil_value() : () -> i64
      %6711 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6712 = arith.constant 4 : i64
      %6713 = func.call @cc_make_string(%6711, %6712) : (!llvm.ptr, i64) -> i64
      %6714 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6715 = arith.constant 7 : i64
      %6716 = func.call @cc_make_string(%6714, %6715) : (!llvm.ptr, i64) -> i64
      %6717 = func.call @cc_intern(%6713, %6716) : (i64, i64) -> i64
      %6718 = func.call @cc_nil_value() : () -> i64
      %6719 = func.call @cc_cons(%6717, %6718) : (i64, i64) -> i64
      %6720 = func.call @cc_values_pack(%6719) : (i64) -> i64
      %6721 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6722 = arith.constant 6 : i64
      %6723 = func.call @cc_make_string(%6721, %6722) : (!llvm.ptr, i64) -> i64
      %6724 = func.call @cc_nil_value() : () -> i64
      %6725 = func.call @cc_intern(%6723, %6724) : (i64, i64) -> i64
      %6726 = func.call @cc_nil_value() : () -> i64
      %6727 = func.call @cc_cons(%6725, %6726) : (i64, i64) -> i64
      %6728 = func.call @cc_values_pack(%6727) : (i64) -> i64
      %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
      %6729 = arith.addi %6725, %__rlasp_stack_elide_zero_302 : i64
      %6730 = func.call @cc_nil_value() : () -> i64
      %6731 = func.call @cc_errorp(%6122) : (i64) -> i64
      %6732 = arith.cmpi ne, %6731, %6730 : i64
      %6733 = arith.cmpi eq, %6730, %6730 : i64
      %6734 = arith.andi %6732, %6733 : i1
      %6735 = scf.if %6734 -> (i64) {
        scf.yield %6122 : i64
      } else {
        scf.yield %6730 : i64
      }
      %6736 = func.call @cc_errorp(%6440) : (i64) -> i64
      %6737 = arith.cmpi ne, %6736, %6730 : i64
      %6738 = arith.cmpi eq, %6735, %6730 : i64
      %6739 = arith.andi %6737, %6738 : i1
      %6740 = scf.if %6739 -> (i64) {
        scf.yield %6440 : i64
      } else {
        scf.yield %6735 : i64
      }
      %6741 = func.call @cc_errorp(%6680) : (i64) -> i64
      %6742 = arith.cmpi ne, %6741, %6730 : i64
      %6743 = arith.cmpi eq, %6740, %6730 : i64
      %6744 = arith.andi %6742, %6743 : i1
      %6745 = scf.if %6744 -> (i64) {
        scf.yield %6680 : i64
      } else {
        scf.yield %6740 : i64
      }
      %6746 = func.call @cc_errorp(%6699) : (i64) -> i64
      %6747 = arith.cmpi ne, %6746, %6730 : i64
      %6748 = arith.cmpi eq, %6745, %6730 : i64
      %6749 = arith.andi %6747, %6748 : i1
      %6750 = scf.if %6749 -> (i64) {
        scf.yield %6699 : i64
      } else {
        scf.yield %6745 : i64
      }
      %6751 = func.call @cc_errorp(%6706) : (i64) -> i64
      %6752 = arith.cmpi ne, %6751, %6730 : i64
      %6753 = arith.cmpi eq, %6750, %6730 : i64
      %6754 = arith.andi %6752, %6753 : i1
      %6755 = scf.if %6754 -> (i64) {
        scf.yield %6706 : i64
      } else {
        scf.yield %6750 : i64
      }
      %6756 = func.call @cc_errorp(%6710) : (i64) -> i64
      %6757 = arith.cmpi ne, %6756, %6730 : i64
      %6758 = arith.cmpi eq, %6755, %6730 : i64
      %6759 = arith.andi %6757, %6758 : i1
      %6760 = scf.if %6759 -> (i64) {
        scf.yield %6710 : i64
      } else {
        scf.yield %6755 : i64
      }
      %6761 = func.call @cc_errorp(%6717) : (i64) -> i64
      %6762 = arith.cmpi ne, %6761, %6730 : i64
      %6763 = arith.cmpi eq, %6760, %6730 : i64
      %6764 = arith.andi %6762, %6763 : i1
      %6765 = scf.if %6764 -> (i64) {
        scf.yield %6717 : i64
      } else {
        scf.yield %6760 : i64
      }
      %6766 = func.call @cc_errorp(%6729) : (i64) -> i64
      %6767 = arith.cmpi ne, %6766, %6730 : i64
      %6768 = arith.cmpi eq, %6765, %6730 : i64
      %6769 = arith.andi %6767, %6768 : i1
      %6770 = scf.if %6769 -> (i64) {
        scf.yield %6729 : i64
      } else {
        scf.yield %6765 : i64
      }
      %6771 = arith.cmpi ne, %6770, %6730 : i64
      scf.if %6771 {
        func.call @stack_push_pointer(%6770) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6122) : (i64) -> ()
        func.call @stack_push_pointer(%6440) : (i64) -> ()
        func.call @stack_push_pointer(%6680) : (i64) -> ()
        func.call @stack_push_pointer(%6699) : (i64) -> ()
        func.call @stack_push_pointer(%6706) : (i64) -> ()
        func.call @stack_push_pointer(%6710) : (i64) -> ()
        func.call @stack_push_pointer(%6717) : (i64) -> ()
        func.call @stack_push_pointer(%6729) : (i64) -> ()
        %6772 = llvm.mlir.addressof @str580 : !llvm.ptr
        %6773 = func.call @cc_make_function_ref_const(%6772) : (!llvm.ptr) -> i64
        %6774 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6773, %6774) : (i64, i64) -> ()
      }
      %6775 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6775 : i64
    }
    %6776 = func.call @cc_nil_value() : () -> i64
    %6777 = func.call @cc_errorp(%6113) : (i64) -> i64
    %6778 = arith.cmpi ne, %6777, %6776 : i64
    %6779 = scf.if %6778 -> (i64) {
      scf.yield %6113 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %6780 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6781 = func.call @stack_pop_pointer() : () -> i64
      %6782 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6783 = arith.constant 18 : i64
      %6784 = func.call @cc_make_string(%6782, %6783) : (!llvm.ptr, i64) -> i64
      %6785 = func.call @cc_nil_value() : () -> i64
      %6786 = func.call @cc_intern(%6784, %6785) : (i64, i64) -> i64
      %6787 = func.call @cc_nil_value() : () -> i64
      %6788 = func.call @cc_cons(%6786, %6787) : (i64, i64) -> i64
      %6789 = func.call @cc_values_pack(%6788) : (i64) -> i64
      %6790 = func.call @cc_defclass(%6786, %6780, %6781) : (i64, i64, i64) -> i64
      %6791 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6791) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6792 = func.call @stack_pop_pointer() : () -> i64
      %6793 = func.call @stack_pop_pointer() : () -> i64
      %6794 = func.call @cc_cons(%6792, %6793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6794) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6795 = func.call @stack_pop_pointer() : () -> i64
      %6796 = func.call @stack_pop_pointer() : () -> i64
      %6797 = func.call @cc_cons(%6795, %6796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6797) : (i64) -> ()
      %6798 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6799 = arith.constant 18 : i64
      %6800 = func.call @cc_make_string(%6798, %6799) : (!llvm.ptr, i64) -> i64
      %6801 = func.call @cc_nil_value() : () -> i64
      %6802 = func.call @cc_intern(%6800, %6801) : (i64, i64) -> i64
      %6803 = func.call @cc_nil_value() : () -> i64
      %6804 = func.call @cc_cons(%6802, %6803) : (i64, i64) -> i64
      %6805 = func.call @cc_values_pack(%6804) : (i64) -> i64
      %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
      %6806 = arith.addi %6802, %__rlasp_stack_elide_zero_303 : i64
      %6807 = func.call @stack_pop_pointer() : () -> i64
      %6808 = func.call @cc_cons(%6806, %6807) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6808) : (i64) -> ()
      %6809 = llvm.mlir.addressof @str583 : !llvm.ptr
      %6810 = arith.constant 8 : i64
      %6811 = func.call @cc_make_string(%6809, %6810) : (!llvm.ptr, i64) -> i64
      %6812 = func.call @cc_nil_value() : () -> i64
      %6813 = func.call @cc_intern(%6811, %6812) : (i64, i64) -> i64
      %6814 = func.call @cc_nil_value() : () -> i64
      %6815 = func.call @cc_cons(%6813, %6814) : (i64, i64) -> i64
      %6816 = func.call @cc_values_pack(%6815) : (i64) -> i64
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %6817 = arith.addi %6813, %__rlasp_stack_elide_zero_304 : i64
      %6818 = func.call @stack_pop_pointer() : () -> i64
      %6819 = func.call @cc_cons(%6817, %6818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
      %6820 = arith.addi %6819, %__rlasp_stack_elide_zero_305 : i64
      %6821 = func.call @cc_nil_value() : () -> i64
      %6822 = func.call @cc_cons(%6820, %6821) : (i64, i64) -> i64
      %6823 = func.call @cc_eval(%6822) : (i64) -> i64
      %6824 = func.call @cc_multiple_value_list(%6823) : (i64) -> i64
      %6825 = func.call @cc_values_pack(%6824) : (i64) -> i64
      func.call @stack_push_pointer(%6825) : (i64) -> ()
      %6826 = func.call @stack_depth() : () -> i64
      %6827 = arith.constant 0 : i64
      %6828 = arith.cmpi sgt, %6826, %6827 : i64
      scf.if %6828 {
        %6829 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
      %6830 = arith.addi %6786, %__rlasp_stack_elide_zero_306 : i64
      scf.yield %6830 : i64
    }
    %6831 = func.call @cc_nil_value() : () -> i64
    %6832 = func.call @cc_errorp(%6779) : (i64) -> i64
    %6833 = arith.cmpi ne, %6832, %6831 : i64
    %6834 = scf.if %6833 -> (i64) {
      scf.yield %6779 : i64
    } else {
      %6854 = llvm.mlir.addressof @method_name_97047688511548 : !llvm.ptr
      %6855 = func.call @cc_make_lambda_ref_str(%6854) : (!llvm.ptr) -> i64
      %6856 = llvm.mlir.addressof @str587 : !llvm.ptr
      %6857 = arith.constant 12 : i64
      %6858 = func.call @cc_make_string(%6856, %6857) : (!llvm.ptr, i64) -> i64
      %6859 = llvm.mlir.addressof @str588 : !llvm.ptr
      %6860 = arith.constant 11 : i64
      %6861 = func.call @cc_make_string(%6859, %6860) : (!llvm.ptr, i64) -> i64
      %6862 = func.call @cc_intern(%6858, %6861) : (i64, i64) -> i64
      %6863 = func.call @cc_nil_value() : () -> i64
      %6864 = func.call @cc_cons(%6862, %6863) : (i64, i64) -> i64
      %6865 = func.call @cc_values_pack(%6864) : (i64) -> i64
      %6866 = func.call @cc_nil() : () -> i64
      %6867 = llvm.mlir.addressof @str589 : !llvm.ptr
      %6868 = arith.constant 1 : i64
      %6869 = func.call @cc_make_string(%6867, %6868) : (!llvm.ptr, i64) -> i64
      %6870 = func.call @cc_nil_value() : () -> i64
      %6871 = func.call @cc_intern(%6869, %6870) : (i64, i64) -> i64
      %6872 = func.call @cc_nil_value() : () -> i64
      %6873 = func.call @cc_cons(%6871, %6872) : (i64, i64) -> i64
      %6874 = func.call @cc_values_pack(%6873) : (i64) -> i64
      %6875 = func.call @cc_cons(%6871, %6866) : (i64, i64) -> i64
      %6876 = llvm.mlir.addressof @str590 : !llvm.ptr
      %6877 = arith.constant 18 : i64
      %6878 = func.call @cc_make_string(%6876, %6877) : (!llvm.ptr, i64) -> i64
      %6879 = func.call @cc_nil_value() : () -> i64
      %6880 = func.call @cc_intern(%6878, %6879) : (i64, i64) -> i64
      %6881 = func.call @cc_nil_value() : () -> i64
      %6882 = func.call @cc_cons(%6880, %6881) : (i64, i64) -> i64
      %6883 = func.call @cc_values_pack(%6882) : (i64) -> i64
      %6884 = func.call @cc_cons(%6880, %6875) : (i64, i64) -> i64
      %6885 = arith.constant 2 : i64
      %6886 = func.call @cc_box_fixnum(%6885) : (i64) -> i64
      %6887 = arith.constant 0 : i64
      %6888 = func.call @cc_defmethod_qualified(%6862, %6884, %6855, %6886, %6887) : (i64, i64, i64, i64, i64) -> i64
      %6889 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6889) : (i64) -> ()
      %6890 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6890) : (i64) -> ()
      %6891 = llvm.mlir.addressof @str591 : !llvm.ptr
      %6892 = arith.constant 52 : i64
      %6893 = func.call @cc_make_string(%6891, %6892) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
      %6894 = arith.addi %6893, %__rlasp_stack_elide_zero_307 : i64
      %6895 = func.call @stack_pop_pointer() : () -> i64
      %6896 = func.call @cc_cons(%6894, %6895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6896) : (i64) -> ()
      %6897 = llvm.mlir.addressof @str592 : !llvm.ptr
      %6898 = arith.constant 5 : i64
      %6899 = func.call @cc_make_string(%6897, %6898) : (!llvm.ptr, i64) -> i64
      %6900 = llvm.mlir.addressof @str593 : !llvm.ptr
      %6901 = arith.constant 11 : i64
      %6902 = func.call @cc_make_string(%6900, %6901) : (!llvm.ptr, i64) -> i64
      %6903 = func.call @cc_intern(%6899, %6902) : (i64, i64) -> i64
      %6904 = func.call @cc_nil_value() : () -> i64
      %6905 = func.call @cc_cons(%6903, %6904) : (i64, i64) -> i64
      %6906 = func.call @cc_values_pack(%6905) : (i64) -> i64
      %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
      %6907 = arith.addi %6903, %__rlasp_stack_elide_zero_308 : i64
      %6908 = func.call @stack_pop_pointer() : () -> i64
      %6909 = func.call @cc_cons(%6907, %6908) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
      %6910 = arith.addi %6909, %__rlasp_stack_elide_zero_309 : i64
      %6911 = func.call @stack_pop_pointer() : () -> i64
      %6912 = func.call @cc_cons(%6910, %6911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6912) : (i64) -> ()
      %6913 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6913) : (i64) -> ()
      %6914 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6914) : (i64) -> ()
      %6915 = llvm.mlir.addressof @str594 : !llvm.ptr
      %6916 = arith.constant 1 : i64
      %6917 = func.call @cc_make_string(%6915, %6916) : (!llvm.ptr, i64) -> i64
      %6918 = func.call @cc_nil_value() : () -> i64
      %6919 = func.call @cc_intern(%6917, %6918) : (i64, i64) -> i64
      %6920 = func.call @cc_nil_value() : () -> i64
      %6921 = func.call @cc_cons(%6919, %6920) : (i64, i64) -> i64
      %6922 = func.call @cc_values_pack(%6921) : (i64) -> i64
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %6923 = arith.addi %6919, %__rlasp_stack_elide_zero_310 : i64
      %6924 = func.call @stack_pop_pointer() : () -> i64
      %6925 = func.call @cc_cons(%6923, %6924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6925) : (i64) -> ()
      %6926 = llvm.mlir.addressof @str595 : !llvm.ptr
      %6927 = arith.constant 6 : i64
      %6928 = func.call @cc_make_string(%6926, %6927) : (!llvm.ptr, i64) -> i64
      %6929 = llvm.mlir.addressof @str596 : !llvm.ptr
      %6930 = arith.constant 11 : i64
      %6931 = func.call @cc_make_string(%6929, %6930) : (!llvm.ptr, i64) -> i64
      %6932 = func.call @cc_intern(%6928, %6931) : (i64, i64) -> i64
      %6933 = func.call @cc_nil_value() : () -> i64
      %6934 = func.call @cc_cons(%6932, %6933) : (i64, i64) -> i64
      %6935 = func.call @cc_values_pack(%6934) : (i64) -> i64
      %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
      %6936 = arith.addi %6932, %__rlasp_stack_elide_zero_311 : i64
      %6937 = func.call @stack_pop_pointer() : () -> i64
      %6938 = func.call @cc_cons(%6936, %6937) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
      %6939 = arith.addi %6938, %__rlasp_stack_elide_zero_312 : i64
      %6940 = func.call @stack_pop_pointer() : () -> i64
      %6941 = func.call @cc_cons(%6939, %6940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6941) : (i64) -> ()
      %6942 = llvm.mlir.addressof @str597 : !llvm.ptr
      %6943 = arith.constant 7 : i64
      %6944 = func.call @cc_make_string(%6942, %6943) : (!llvm.ptr, i64) -> i64
      %6945 = llvm.mlir.addressof @str598 : !llvm.ptr
      %6946 = arith.constant 11 : i64
      %6947 = func.call @cc_make_string(%6945, %6946) : (!llvm.ptr, i64) -> i64
      %6948 = func.call @cc_intern(%6944, %6947) : (i64, i64) -> i64
      %6949 = func.call @cc_nil_value() : () -> i64
      %6950 = func.call @cc_cons(%6948, %6949) : (i64, i64) -> i64
      %6951 = func.call @cc_values_pack(%6950) : (i64) -> i64
      %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
      %6952 = arith.addi %6948, %__rlasp_stack_elide_zero_313 : i64
      %6953 = func.call @stack_pop_pointer() : () -> i64
      %6954 = func.call @cc_cons(%6952, %6953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %6955 = arith.addi %6954, %__rlasp_stack_elide_zero_314 : i64
      %6956 = func.call @stack_pop_pointer() : () -> i64
      %6957 = func.call @cc_cons(%6955, %6956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6957) : (i64) -> ()
      %6958 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6958) : (i64) -> ()
      %6959 = llvm.mlir.addressof @str599 : !llvm.ptr
      %6960 = arith.constant 1 : i64
      %6961 = func.call @cc_make_string(%6959, %6960) : (!llvm.ptr, i64) -> i64
      %6962 = func.call @cc_nil_value() : () -> i64
      %6963 = func.call @cc_intern(%6961, %6962) : (i64, i64) -> i64
      %6964 = func.call @cc_nil_value() : () -> i64
      %6965 = func.call @cc_cons(%6963, %6964) : (i64, i64) -> i64
      %6966 = func.call @cc_values_pack(%6965) : (i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %6967 = arith.addi %6963, %__rlasp_stack_elide_zero_315 : i64
      %6968 = func.call @stack_pop_pointer() : () -> i64
      %6969 = func.call @cc_cons(%6967, %6968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6969) : (i64) -> ()
      %6970 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6970) : (i64) -> ()
      %6971 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6972 = arith.constant 18 : i64
      %6973 = func.call @cc_make_string(%6971, %6972) : (!llvm.ptr, i64) -> i64
      %6974 = func.call @cc_nil_value() : () -> i64
      %6975 = func.call @cc_intern(%6973, %6974) : (i64, i64) -> i64
      %6976 = func.call @cc_nil_value() : () -> i64
      %6977 = func.call @cc_cons(%6975, %6976) : (i64, i64) -> i64
      %6978 = func.call @cc_values_pack(%6977) : (i64) -> i64
      %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
      %6979 = arith.addi %6975, %__rlasp_stack_elide_zero_316 : i64
      %6980 = func.call @stack_pop_pointer() : () -> i64
      %6981 = func.call @cc_cons(%6979, %6980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6981) : (i64) -> ()
      %6982 = llvm.mlir.addressof @str601 : !llvm.ptr
      %6983 = arith.constant 1 : i64
      %6984 = func.call @cc_make_string(%6982, %6983) : (!llvm.ptr, i64) -> i64
      %6985 = func.call @cc_nil_value() : () -> i64
      %6986 = func.call @cc_intern(%6984, %6985) : (i64, i64) -> i64
      %6987 = func.call @cc_nil_value() : () -> i64
      %6988 = func.call @cc_cons(%6986, %6987) : (i64, i64) -> i64
      %6989 = func.call @cc_values_pack(%6988) : (i64) -> i64
      %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
      %6990 = arith.addi %6986, %__rlasp_stack_elide_zero_317 : i64
      %6991 = func.call @stack_pop_pointer() : () -> i64
      %6992 = func.call @cc_cons(%6990, %6991) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
      %6993 = arith.addi %6992, %__rlasp_stack_elide_zero_318 : i64
      %6994 = func.call @stack_pop_pointer() : () -> i64
      %6995 = func.call @cc_cons(%6993, %6994) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
      %6996 = arith.addi %6995, %__rlasp_stack_elide_zero_319 : i64
      %6997 = func.call @stack_pop_pointer() : () -> i64
      %6998 = func.call @cc_cons(%6996, %6997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6998) : (i64) -> ()
      %6999 = llvm.mlir.addressof @str602 : !llvm.ptr
      %7000 = arith.constant 12 : i64
      %7001 = func.call @cc_make_string(%6999, %7000) : (!llvm.ptr, i64) -> i64
      %7002 = llvm.mlir.addressof @str603 : !llvm.ptr
      %7003 = arith.constant 11 : i64
      %7004 = func.call @cc_make_string(%7002, %7003) : (!llvm.ptr, i64) -> i64
      %7005 = func.call @cc_intern(%7001, %7004) : (i64, i64) -> i64
      %7006 = func.call @cc_nil_value() : () -> i64
      %7007 = func.call @cc_cons(%7005, %7006) : (i64, i64) -> i64
      %7008 = func.call @cc_values_pack(%7007) : (i64) -> i64
      %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
      %7009 = arith.addi %7005, %__rlasp_stack_elide_zero_320 : i64
      %7010 = func.call @stack_pop_pointer() : () -> i64
      %7011 = func.call @cc_cons(%7009, %7010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7011) : (i64) -> ()
      %7012 = llvm.mlir.addressof @str604 : !llvm.ptr
      %7013 = arith.constant 9 : i64
      %7014 = func.call @cc_make_string(%7012, %7013) : (!llvm.ptr, i64) -> i64
      %7015 = func.call @cc_nil_value() : () -> i64
      %7016 = func.call @cc_intern(%7014, %7015) : (i64, i64) -> i64
      %7017 = func.call @cc_nil_value() : () -> i64
      %7018 = func.call @cc_cons(%7016, %7017) : (i64, i64) -> i64
      %7019 = func.call @cc_values_pack(%7018) : (i64) -> i64
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %7020 = arith.addi %7016, %__rlasp_stack_elide_zero_321 : i64
      %7021 = func.call @stack_pop_pointer() : () -> i64
      %7022 = func.call @cc_cons(%7020, %7021) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %7023 = arith.addi %7022, %__rlasp_stack_elide_zero_322 : i64
      %7024 = func.call @cc_nil_value() : () -> i64
      %7025 = func.call @cc_cons(%7023, %7024) : (i64, i64) -> i64
      %7026 = func.call @cc_eval(%7025) : (i64) -> i64
      %7027 = func.call @cc_multiple_value_list(%7026) : (i64) -> i64
      %7028 = func.call @cc_values_pack(%7027) : (i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %7029 = arith.addi %7028, %__rlasp_stack_elide_zero_323 : i64
      scf.yield %7029 : i64
    }
    %7030 = func.call @cc_nil_value() : () -> i64
    %7031 = func.call @cc_errorp(%6834) : (i64) -> i64
    %7032 = arith.cmpi ne, %7031, %7030 : i64
    %7033 = scf.if %7032 -> (i64) {
      scf.yield %6834 : i64
    } else {
      %7034 = llvm.mlir.addressof @str605 : !llvm.ptr
      %7035 = arith.constant 30 : i64
      %7036 = func.call @cc_make_string(%7034, %7035) : (!llvm.ptr, i64) -> i64
      %7037 = func.call @cc_nil_value() : () -> i64
      %7038 = func.call @cc_intern(%7036, %7037) : (i64, i64) -> i64
      %7039 = func.call @cc_nil_value() : () -> i64
      %7040 = func.call @cc_cons(%7038, %7039) : (i64, i64) -> i64
      %7041 = func.call @cc_values_pack(%7040) : (i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %7042 = arith.addi %7038, %__rlasp_stack_elide_zero_324 : i64
      %7043 = llvm.mlir.addressof @str606 : !llvm.ptr
      %7044 = arith.constant 3 : i64
      %7045 = func.call @cc_make_string(%7043, %7044) : (!llvm.ptr, i64) -> i64
      %7046 = func.call @cc_nil_value() : () -> i64
      %7047 = func.call @cc_intern(%7045, %7046) : (i64, i64) -> i64
      %7048 = func.call @cc_nil_value() : () -> i64
      %7049 = func.call @cc_cons(%7047, %7048) : (i64, i64) -> i64
      %7050 = func.call @cc_values_pack(%7049) : (i64) -> i64
      func.call @stack_push_pointer(%7047) : (i64) -> ()
      %7051 = llvm.mlir.addressof @str607 : !llvm.ptr
      %7052 = arith.constant 3 : i64
      %7053 = func.call @cc_make_string(%7051, %7052) : (!llvm.ptr, i64) -> i64
      %7054 = func.call @cc_nil_value() : () -> i64
      %7055 = func.call @cc_intern(%7053, %7054) : (i64, i64) -> i64
      %7056 = func.call @cc_nil_value() : () -> i64
      %7057 = func.call @cc_cons(%7055, %7056) : (i64, i64) -> i64
      %7058 = func.call @cc_values_pack(%7057) : (i64) -> i64
      func.call @stack_push_pointer(%7055) : (i64) -> ()
      %7059 = llvm.mlir.addressof @str608 : !llvm.ptr
      %7060 = arith.constant 5 : i64
      %7061 = func.call @cc_make_string(%7059, %7060) : (!llvm.ptr, i64) -> i64
      %7062 = func.call @cc_nil_value() : () -> i64
      %7063 = func.call @cc_intern(%7061, %7062) : (i64, i64) -> i64
      %7064 = func.call @cc_nil_value() : () -> i64
      %7065 = func.call @cc_cons(%7063, %7064) : (i64, i64) -> i64
      %7066 = func.call @cc_values_pack(%7065) : (i64) -> i64
      func.call @stack_push_pointer(%7063) : (i64) -> ()
      %7067 = llvm.mlir.addressof @str609 : !llvm.ptr
      %7068 = arith.constant 21 : i64
      %7069 = func.call @cc_make_string(%7067, %7068) : (!llvm.ptr, i64) -> i64
      %7070 = llvm.mlir.addressof @str610 : !llvm.ptr
      %7071 = arith.constant 11 : i64
      %7072 = func.call @cc_make_string(%7070, %7071) : (!llvm.ptr, i64) -> i64
      %7073 = func.call @cc_intern(%7069, %7072) : (i64, i64) -> i64
      %7074 = func.call @cc_nil_value() : () -> i64
      %7075 = func.call @cc_cons(%7073, %7074) : (i64, i64) -> i64
      %7076 = func.call @cc_values_pack(%7075) : (i64) -> i64
      func.call @stack_push_pointer(%7073) : (i64) -> ()
      %7077 = llvm.mlir.addressof @str611 : !llvm.ptr
      %7078 = arith.constant 1 : i64
      %7079 = func.call @cc_make_string(%7077, %7078) : (!llvm.ptr, i64) -> i64
      %7080 = func.call @cc_nil_value() : () -> i64
      %7081 = func.call @cc_intern(%7079, %7080) : (i64, i64) -> i64
      %7082 = func.call @cc_nil_value() : () -> i64
      %7083 = func.call @cc_cons(%7081, %7082) : (i64, i64) -> i64
      %7084 = func.call @cc_values_pack(%7083) : (i64) -> i64
      func.call @stack_push_pointer(%7081) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7085 = func.call @stack_pop_pointer() : () -> i64
      %7086 = func.call @stack_pop_pointer() : () -> i64
      %7087 = func.call @cc_cons(%7086, %7085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7087) : (i64) -> ()
      %7088 = llvm.mlir.addressof @str612 : !llvm.ptr
      %7089 = arith.constant 32 : i64
      %7090 = func.call @cc_make_string(%7088, %7089) : (!llvm.ptr, i64) -> i64
      %7091 = func.call @cc_nil_value() : () -> i64
      %7092 = func.call @cc_intern(%7090, %7091) : (i64, i64) -> i64
      %7093 = func.call @cc_nil_value() : () -> i64
      %7094 = func.call @cc_cons(%7092, %7093) : (i64, i64) -> i64
      %7095 = func.call @cc_values_pack(%7094) : (i64) -> i64
      func.call @stack_push_pointer(%7092) : (i64) -> ()
      %7096 = llvm.mlir.addressof @str613 : !llvm.ptr
      %7097 = arith.constant 6 : i64
      %7098 = func.call @cc_make_string(%7096, %7097) : (!llvm.ptr, i64) -> i64
      %7099 = func.call @cc_nil_value() : () -> i64
      %7100 = func.call @cc_intern(%7098, %7099) : (i64, i64) -> i64
      %7101 = func.call @cc_nil_value() : () -> i64
      %7102 = func.call @cc_cons(%7100, %7101) : (i64, i64) -> i64
      %7103 = func.call @cc_values_pack(%7102) : (i64) -> i64
      func.call @stack_push_pointer(%7100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7104 = llvm.mlir.addressof @str614 : !llvm.ptr
      %7105 = arith.constant 15 : i64
      %7106 = func.call @cc_make_string(%7104, %7105) : (!llvm.ptr, i64) -> i64
      %7107 = llvm.mlir.addressof @str615 : !llvm.ptr
      %7108 = arith.constant 11 : i64
      %7109 = func.call @cc_make_string(%7107, %7108) : (!llvm.ptr, i64) -> i64
      %7110 = func.call @cc_intern(%7106, %7109) : (i64, i64) -> i64
      %7111 = func.call @cc_nil_value() : () -> i64
      %7112 = func.call @cc_cons(%7110, %7111) : (i64, i64) -> i64
      %7113 = func.call @cc_values_pack(%7112) : (i64) -> i64
      func.call @stack_push_pointer(%7110) : (i64) -> ()
      %7114 = llvm.mlir.addressof @str616 : !llvm.ptr
      %7115 = arith.constant 6 : i64
      %7116 = func.call @cc_make_string(%7114, %7115) : (!llvm.ptr, i64) -> i64
      %7117 = llvm.mlir.addressof @str617 : !llvm.ptr
      %7118 = arith.constant 7 : i64
      %7119 = func.call @cc_make_string(%7117, %7118) : (!llvm.ptr, i64) -> i64
      %7120 = func.call @cc_intern(%7116, %7119) : (i64, i64) -> i64
      %7121 = func.call @cc_nil_value() : () -> i64
      %7122 = func.call @cc_cons(%7120, %7121) : (i64, i64) -> i64
      %7123 = func.call @cc_values_pack(%7122) : (i64) -> i64
      func.call @stack_push_pointer(%7120) : (i64) -> ()
      %7124 = llvm.mlir.addressof @str618 : !llvm.ptr
      %7125 = arith.constant 1 : i64
      %7126 = func.call @cc_make_string(%7124, %7125) : (!llvm.ptr, i64) -> i64
      %7127 = func.call @cc_nil_value() : () -> i64
      %7128 = func.call @cc_intern(%7126, %7127) : (i64, i64) -> i64
      %7129 = func.call @cc_nil_value() : () -> i64
      %7130 = func.call @cc_cons(%7128, %7129) : (i64, i64) -> i64
      %7131 = func.call @cc_values_pack(%7130) : (i64) -> i64
      func.call @stack_push_pointer(%7128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7132 = func.call @stack_pop_pointer() : () -> i64
      %7133 = func.call @stack_pop_pointer() : () -> i64
      %7134 = func.call @cc_cons(%7133, %7132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
      %7135 = arith.addi %7134, %__rlasp_stack_elide_zero_325 : i64
      %7136 = func.call @stack_pop_pointer() : () -> i64
      %7137 = func.call @cc_cons(%7136, %7135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
      %7138 = arith.addi %7137, %__rlasp_stack_elide_zero_326 : i64
      %7139 = func.call @stack_pop_pointer() : () -> i64
      %7140 = func.call @cc_cons(%7139, %7138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7140) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7141 = func.call @stack_pop_pointer() : () -> i64
      %7142 = func.call @stack_pop_pointer() : () -> i64
      %7143 = func.call @cc_cons(%7142, %7141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
      %7144 = arith.addi %7143, %__rlasp_stack_elide_zero_327 : i64
      %7145 = func.call @stack_pop_pointer() : () -> i64
      %7146 = func.call @cc_cons(%7145, %7144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
      %7147 = arith.addi %7146, %__rlasp_stack_elide_zero_328 : i64
      %7148 = func.call @stack_pop_pointer() : () -> i64
      %7149 = func.call @cc_cons(%7148, %7147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7149) : (i64) -> ()
      %7150 = llvm.mlir.addressof @str619 : !llvm.ptr
      %7151 = arith.constant 13 : i64
      %7152 = func.call @cc_make_string(%7150, %7151) : (!llvm.ptr, i64) -> i64
      %7153 = llvm.mlir.addressof @str620 : !llvm.ptr
      %7154 = arith.constant 11 : i64
      %7155 = func.call @cc_make_string(%7153, %7154) : (!llvm.ptr, i64) -> i64
      %7156 = func.call @cc_intern(%7152, %7155) : (i64, i64) -> i64
      %7157 = func.call @cc_nil_value() : () -> i64
      %7158 = func.call @cc_cons(%7156, %7157) : (i64, i64) -> i64
      %7159 = func.call @cc_values_pack(%7158) : (i64) -> i64
      func.call @stack_push_pointer(%7156) : (i64) -> ()
      %7160 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7160) : (i64) -> ()
      %7161 = llvm.mlir.addressof @str621 : !llvm.ptr
      %7162 = arith.constant 18 : i64
      %7163 = func.call @cc_make_string(%7161, %7162) : (!llvm.ptr, i64) -> i64
      %7164 = func.call @cc_nil_value() : () -> i64
      %7165 = func.call @cc_intern(%7163, %7164) : (i64, i64) -> i64
      %7166 = func.call @cc_nil_value() : () -> i64
      %7167 = func.call @cc_cons(%7165, %7166) : (i64, i64) -> i64
      %7168 = func.call @cc_values_pack(%7167) : (i64) -> i64
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %7169 = arith.addi %7165, %__rlasp_stack_elide_zero_329 : i64
      %7170 = func.call @stack_pop_pointer() : () -> i64
      %7171 = func.call @cc_cons(%7169, %7170) : (i64, i64) -> i64
      %7172 = llvm.mlir.addressof @str622 : !llvm.ptr
      %7173 = arith.constant 5 : i64
      %7174 = func.call @cc_make_string(%7172, %7173) : (!llvm.ptr, i64) -> i64
      %7175 = func.call @cc_nil_value() : () -> i64
      %7176 = func.call @cc_intern(%7174, %7175) : (i64, i64) -> i64
      %7177 = func.call @cc_nil_value() : () -> i64
      %7178 = func.call @cc_cons(%7176, %7177) : (i64, i64) -> i64
      %7179 = func.call @cc_values_pack(%7178) : (i64) -> i64
      %7180 = func.call @cc_cons(%7176, %7171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7180) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7181 = func.call @stack_pop_pointer() : () -> i64
      %7182 = func.call @stack_pop_pointer() : () -> i64
      %7183 = func.call @cc_cons(%7182, %7181) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %7184 = arith.addi %7183, %__rlasp_stack_elide_zero_330 : i64
      %7185 = func.call @stack_pop_pointer() : () -> i64
      %7186 = func.call @cc_cons(%7185, %7184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7186) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7187 = func.call @stack_pop_pointer() : () -> i64
      %7188 = func.call @stack_pop_pointer() : () -> i64
      %7189 = func.call @cc_cons(%7188, %7187) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %7190 = arith.addi %7189, %__rlasp_stack_elide_zero_331 : i64
      %7191 = func.call @stack_pop_pointer() : () -> i64
      %7192 = func.call @cc_cons(%7191, %7190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %7193 = arith.addi %7192, %__rlasp_stack_elide_zero_332 : i64
      %7194 = func.call @stack_pop_pointer() : () -> i64
      %7195 = func.call @cc_cons(%7194, %7193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7195) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7196 = func.call @stack_pop_pointer() : () -> i64
      %7197 = func.call @stack_pop_pointer() : () -> i64
      %7198 = func.call @cc_cons(%7197, %7196) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
      %7199 = arith.addi %7198, %__rlasp_stack_elide_zero_333 : i64
      %7200 = func.call @stack_pop_pointer() : () -> i64
      %7201 = func.call @cc_cons(%7200, %7199) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
      %7202 = arith.addi %7201, %__rlasp_stack_elide_zero_334 : i64
      %7203 = func.call @stack_pop_pointer() : () -> i64
      %7204 = func.call @cc_cons(%7203, %7202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7204) : (i64) -> ()
      %7205 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%7205) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7206 = func.call @stack_pop_pointer() : () -> i64
      %7207 = func.call @stack_pop_pointer() : () -> i64
      %7208 = func.call @cc_cons(%7207, %7206) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
      %7209 = arith.addi %7208, %__rlasp_stack_elide_zero_335 : i64
      %7210 = func.call @stack_pop_pointer() : () -> i64
      %7211 = func.call @cc_cons(%7210, %7209) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %7212 = arith.addi %7211, %__rlasp_stack_elide_zero_336 : i64
      %7213 = func.call @stack_pop_pointer() : () -> i64
      %7214 = func.call @cc_cons(%7213, %7212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7214) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7215 = func.call @stack_pop_pointer() : () -> i64
      %7216 = func.call @stack_pop_pointer() : () -> i64
      %7217 = func.call @cc_cons(%7216, %7215) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %7218 = arith.addi %7217, %__rlasp_stack_elide_zero_337 : i64
      %7219 = func.call @stack_pop_pointer() : () -> i64
      %7220 = func.call @cc_cons(%7219, %7218) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7221 = func.call @stack_pop_pointer() : () -> i64
      %7222 = func.call @stack_pop_pointer() : () -> i64
      %7223 = func.call @cc_cons(%7222, %7221) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %7224 = arith.addi %7223, %__rlasp_stack_elide_zero_338 : i64
      %7225 = func.call @stack_pop_pointer() : () -> i64
      %7226 = func.call @cc_cons(%7225, %7224) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %7227 = arith.addi %7226, %__rlasp_stack_elide_zero_339 : i64
      %7330 = arith.constant 97047688511549 : i64
      %7331 = arith.constant 0 : i64
      %7332 = func.call @cc_make_closure(%7330, %7331) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_340 = arith.constant 0 : i64
      %7333 = arith.addi %7332, %__rlasp_stack_elide_zero_340 : i64
      %7334 = llvm.mlir.addressof @str629 : !llvm.ptr
      %7335 = arith.constant 1 : i64
      %7336 = func.call @cc_make_string(%7334, %7335) : (!llvm.ptr, i64) -> i64
      %7337 = func.call @cc_nil_value() : () -> i64
      %7338 = func.call @cc_intern(%7336, %7337) : (i64, i64) -> i64
      %7339 = func.call @cc_nil_value() : () -> i64
      %7340 = func.call @cc_cons(%7338, %7339) : (i64, i64) -> i64
      %7341 = func.call @cc_values_pack(%7340) : (i64) -> i64
      func.call @stack_push_pointer(%7338) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7342 = func.call @stack_pop_pointer() : () -> i64
      %7343 = func.call @stack_pop_pointer() : () -> i64
      %7344 = func.call @cc_cons(%7343, %7342) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_341 = arith.constant 0 : i64
      %7345 = arith.addi %7344, %__rlasp_stack_elide_zero_341 : i64
      %7346 = llvm.mlir.addressof @str630 : !llvm.ptr
      %7347 = arith.constant 11 : i64
      %7348 = func.call @cc_make_string(%7346, %7347) : (!llvm.ptr, i64) -> i64
      %7349 = llvm.mlir.addressof @str631 : !llvm.ptr
      %7350 = arith.constant 7 : i64
      %7351 = func.call @cc_make_string(%7349, %7350) : (!llvm.ptr, i64) -> i64
      %7352 = func.call @cc_intern(%7348, %7351) : (i64, i64) -> i64
      %7353 = func.call @cc_nil_value() : () -> i64
      %7354 = func.call @cc_cons(%7352, %7353) : (i64, i64) -> i64
      %7355 = func.call @cc_values_pack(%7354) : (i64) -> i64
      %7356 = func.call @cc_nil_value() : () -> i64
      %7357 = llvm.mlir.addressof @str632 : !llvm.ptr
      %7358 = arith.constant 4 : i64
      %7359 = func.call @cc_make_string(%7357, %7358) : (!llvm.ptr, i64) -> i64
      %7360 = llvm.mlir.addressof @str633 : !llvm.ptr
      %7361 = arith.constant 7 : i64
      %7362 = func.call @cc_make_string(%7360, %7361) : (!llvm.ptr, i64) -> i64
      %7363 = func.call @cc_intern(%7359, %7362) : (i64, i64) -> i64
      %7364 = func.call @cc_nil_value() : () -> i64
      %7365 = func.call @cc_cons(%7363, %7364) : (i64, i64) -> i64
      %7366 = func.call @cc_values_pack(%7365) : (i64) -> i64
      %7367 = llvm.mlir.addressof @str634 : !llvm.ptr
      %7368 = arith.constant 6 : i64
      %7369 = func.call @cc_make_string(%7367, %7368) : (!llvm.ptr, i64) -> i64
      %7370 = func.call @cc_nil_value() : () -> i64
      %7371 = func.call @cc_intern(%7369, %7370) : (i64, i64) -> i64
      %7372 = func.call @cc_nil_value() : () -> i64
      %7373 = func.call @cc_cons(%7371, %7372) : (i64, i64) -> i64
      %7374 = func.call @cc_values_pack(%7373) : (i64) -> i64
      %__rlasp_stack_elide_zero_342 = arith.constant 0 : i64
      %7375 = arith.addi %7371, %__rlasp_stack_elide_zero_342 : i64
      %7376 = func.call @cc_nil_value() : () -> i64
      %7377 = func.call @cc_errorp(%7042) : (i64) -> i64
      %7378 = arith.cmpi ne, %7377, %7376 : i64
      %7379 = arith.cmpi eq, %7376, %7376 : i64
      %7380 = arith.andi %7378, %7379 : i1
      %7381 = scf.if %7380 -> (i64) {
        scf.yield %7042 : i64
      } else {
        scf.yield %7376 : i64
      }
      %7382 = func.call @cc_errorp(%7227) : (i64) -> i64
      %7383 = arith.cmpi ne, %7382, %7376 : i64
      %7384 = arith.cmpi eq, %7381, %7376 : i64
      %7385 = arith.andi %7383, %7384 : i1
      %7386 = scf.if %7385 -> (i64) {
        scf.yield %7227 : i64
      } else {
        scf.yield %7381 : i64
      }
      %7387 = func.call @cc_errorp(%7333) : (i64) -> i64
      %7388 = arith.cmpi ne, %7387, %7376 : i64
      %7389 = arith.cmpi eq, %7386, %7376 : i64
      %7390 = arith.andi %7388, %7389 : i1
      %7391 = scf.if %7390 -> (i64) {
        scf.yield %7333 : i64
      } else {
        scf.yield %7386 : i64
      }
      %7392 = func.call @cc_errorp(%7345) : (i64) -> i64
      %7393 = arith.cmpi ne, %7392, %7376 : i64
      %7394 = arith.cmpi eq, %7391, %7376 : i64
      %7395 = arith.andi %7393, %7394 : i1
      %7396 = scf.if %7395 -> (i64) {
        scf.yield %7345 : i64
      } else {
        scf.yield %7391 : i64
      }
      %7397 = func.call @cc_errorp(%7352) : (i64) -> i64
      %7398 = arith.cmpi ne, %7397, %7376 : i64
      %7399 = arith.cmpi eq, %7396, %7376 : i64
      %7400 = arith.andi %7398, %7399 : i1
      %7401 = scf.if %7400 -> (i64) {
        scf.yield %7352 : i64
      } else {
        scf.yield %7396 : i64
      }
      %7402 = func.call @cc_errorp(%7356) : (i64) -> i64
      %7403 = arith.cmpi ne, %7402, %7376 : i64
      %7404 = arith.cmpi eq, %7401, %7376 : i64
      %7405 = arith.andi %7403, %7404 : i1
      %7406 = scf.if %7405 -> (i64) {
        scf.yield %7356 : i64
      } else {
        scf.yield %7401 : i64
      }
      %7407 = func.call @cc_errorp(%7363) : (i64) -> i64
      %7408 = arith.cmpi ne, %7407, %7376 : i64
      %7409 = arith.cmpi eq, %7406, %7376 : i64
      %7410 = arith.andi %7408, %7409 : i1
      %7411 = scf.if %7410 -> (i64) {
        scf.yield %7363 : i64
      } else {
        scf.yield %7406 : i64
      }
      %7412 = func.call @cc_errorp(%7375) : (i64) -> i64
      %7413 = arith.cmpi ne, %7412, %7376 : i64
      %7414 = arith.cmpi eq, %7411, %7376 : i64
      %7415 = arith.andi %7413, %7414 : i1
      %7416 = scf.if %7415 -> (i64) {
        scf.yield %7375 : i64
      } else {
        scf.yield %7411 : i64
      }
      %7417 = arith.cmpi ne, %7416, %7376 : i64
      scf.if %7417 {
        func.call @stack_push_pointer(%7416) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7042) : (i64) -> ()
        func.call @stack_push_pointer(%7227) : (i64) -> ()
        func.call @stack_push_pointer(%7333) : (i64) -> ()
        func.call @stack_push_pointer(%7345) : (i64) -> ()
        func.call @stack_push_pointer(%7352) : (i64) -> ()
        func.call @stack_push_pointer(%7356) : (i64) -> ()
        func.call @stack_push_pointer(%7363) : (i64) -> ()
        func.call @stack_push_pointer(%7375) : (i64) -> ()
        %7418 = llvm.mlir.addressof @str635 : !llvm.ptr
        %7419 = func.call @cc_make_function_ref_const(%7418) : (!llvm.ptr) -> i64
        %7420 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7419, %7420) : (i64, i64) -> ()
      }
      %7421 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7421 : i64
    }
    %7422 = func.call @cc_nil_value() : () -> i64
    %7423 = func.call @cc_errorp(%7033) : (i64) -> i64
    %7424 = arith.cmpi ne, %7423, %7422 : i64
    %7425 = scf.if %7424 -> (i64) {
      scf.yield %7033 : i64
    } else {
      %7426 = llvm.mlir.addressof @str636 : !llvm.ptr
      %7427 = arith.constant 14 : i64
      %7428 = func.call @cc_make_string(%7426, %7427) : (!llvm.ptr, i64) -> i64
      %7429 = func.call @cc_nil_value() : () -> i64
      %7430 = func.call @cc_intern(%7428, %7429) : (i64, i64) -> i64
      %7431 = func.call @cc_nil_value() : () -> i64
      %7432 = func.call @cc_cons(%7430, %7431) : (i64, i64) -> i64
      %7433 = func.call @cc_values_pack(%7432) : (i64) -> i64
      %__rlasp_stack_elide_zero_343 = arith.constant 0 : i64
      %7434 = arith.addi %7430, %__rlasp_stack_elide_zero_343 : i64
      %7435 = llvm.mlir.addressof @str637 : !llvm.ptr
      %7436 = arith.constant 3 : i64
      %7437 = func.call @cc_make_string(%7435, %7436) : (!llvm.ptr, i64) -> i64
      %7438 = func.call @cc_nil_value() : () -> i64
      %7439 = func.call @cc_intern(%7437, %7438) : (i64, i64) -> i64
      %7440 = func.call @cc_nil_value() : () -> i64
      %7441 = func.call @cc_cons(%7439, %7440) : (i64, i64) -> i64
      %7442 = func.call @cc_values_pack(%7441) : (i64) -> i64
      func.call @stack_push_pointer(%7439) : (i64) -> ()
      %7443 = llvm.mlir.addressof @str638 : !llvm.ptr
      %7444 = arith.constant 3 : i64
      %7445 = func.call @cc_make_string(%7443, %7444) : (!llvm.ptr, i64) -> i64
      %7446 = func.call @cc_nil_value() : () -> i64
      %7447 = func.call @cc_intern(%7445, %7446) : (i64, i64) -> i64
      %7448 = func.call @cc_nil_value() : () -> i64
      %7449 = func.call @cc_cons(%7447, %7448) : (i64, i64) -> i64
      %7450 = func.call @cc_values_pack(%7449) : (i64) -> i64
      func.call @stack_push_pointer(%7447) : (i64) -> ()
      %7451 = llvm.mlir.addressof @str639 : !llvm.ptr
      %7452 = arith.constant 5 : i64
      %7453 = func.call @cc_make_string(%7451, %7452) : (!llvm.ptr, i64) -> i64
      %7454 = func.call @cc_nil_value() : () -> i64
      %7455 = func.call @cc_intern(%7453, %7454) : (i64, i64) -> i64
      %7456 = func.call @cc_nil_value() : () -> i64
      %7457 = func.call @cc_cons(%7455, %7456) : (i64, i64) -> i64
      %7458 = func.call @cc_values_pack(%7457) : (i64) -> i64
      func.call @stack_push_pointer(%7455) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7459 = llvm.mlir.addressof @str640 : !llvm.ptr
      %7460 = arith.constant 20 : i64
      %7461 = func.call @cc_make_string(%7459, %7460) : (!llvm.ptr, i64) -> i64
      %7462 = llvm.mlir.addressof @str641 : !llvm.ptr
      %7463 = arith.constant 11 : i64
      %7464 = func.call @cc_make_string(%7462, %7463) : (!llvm.ptr, i64) -> i64
      %7465 = func.call @cc_intern(%7461, %7464) : (i64, i64) -> i64
      %7466 = func.call @cc_nil_value() : () -> i64
      %7467 = func.call @cc_cons(%7465, %7466) : (i64, i64) -> i64
      %7468 = func.call @cc_values_pack(%7467) : (i64) -> i64
      func.call @stack_push_pointer(%7465) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7469 = llvm.mlir.addressof @str642 : !llvm.ptr
      %7470 = arith.constant 32 : i64
      %7471 = func.call @cc_make_string(%7469, %7470) : (!llvm.ptr, i64) -> i64
      %7472 = func.call @cc_nil_value() : () -> i64
      %7473 = func.call @cc_intern(%7471, %7472) : (i64, i64) -> i64
      %7474 = func.call @cc_nil_value() : () -> i64
      %7475 = func.call @cc_cons(%7473, %7474) : (i64, i64) -> i64
      %7476 = func.call @cc_values_pack(%7475) : (i64) -> i64
      func.call @stack_push_pointer(%7473) : (i64) -> ()
      %7477 = llvm.mlir.addressof @str643 : !llvm.ptr
      %7478 = arith.constant 6 : i64
      %7479 = func.call @cc_make_string(%7477, %7478) : (!llvm.ptr, i64) -> i64
      %7480 = func.call @cc_nil_value() : () -> i64
      %7481 = func.call @cc_intern(%7479, %7480) : (i64, i64) -> i64
      %7482 = func.call @cc_nil_value() : () -> i64
      %7483 = func.call @cc_cons(%7481, %7482) : (i64, i64) -> i64
      %7484 = func.call @cc_values_pack(%7483) : (i64) -> i64
      func.call @stack_push_pointer(%7481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7485 = llvm.mlir.addressof @str644 : !llvm.ptr
      %7486 = arith.constant 10 : i64
      %7487 = func.call @cc_make_string(%7485, %7486) : (!llvm.ptr, i64) -> i64
      %7488 = llvm.mlir.addressof @str645 : !llvm.ptr
      %7489 = arith.constant 11 : i64
      %7490 = func.call @cc_make_string(%7488, %7489) : (!llvm.ptr, i64) -> i64
      %7491 = func.call @cc_intern(%7487, %7490) : (i64, i64) -> i64
      %7492 = func.call @cc_nil_value() : () -> i64
      %7493 = func.call @cc_cons(%7491, %7492) : (i64, i64) -> i64
      %7494 = func.call @cc_values_pack(%7493) : (i64) -> i64
      func.call @stack_push_pointer(%7491) : (i64) -> ()
      %7495 = llvm.mlir.addressof @str646 : !llvm.ptr
      %7496 = arith.constant 5 : i64
      %7497 = func.call @cc_make_string(%7495, %7496) : (!llvm.ptr, i64) -> i64
      %7498 = func.call @cc_nil_value() : () -> i64
      %7499 = func.call @cc_intern(%7497, %7498) : (i64, i64) -> i64
      %7500 = func.call @cc_nil_value() : () -> i64
      %7501 = func.call @cc_cons(%7499, %7500) : (i64, i64) -> i64
      %7502 = func.call @cc_values_pack(%7501) : (i64) -> i64
      func.call @stack_push_pointer(%7499) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7503 = func.call @stack_pop_pointer() : () -> i64
      %7504 = func.call @stack_pop_pointer() : () -> i64
      %7505 = func.call @cc_cons(%7504, %7503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7505) : (i64) -> ()
      %7506 = llvm.mlir.addressof @str647 : !llvm.ptr
      %7507 = arith.constant 9 : i64
      %7508 = func.call @cc_make_string(%7506, %7507) : (!llvm.ptr, i64) -> i64
      %7509 = llvm.mlir.addressof @str648 : !llvm.ptr
      %7510 = arith.constant 11 : i64
      %7511 = func.call @cc_make_string(%7509, %7510) : (!llvm.ptr, i64) -> i64
      %7512 = func.call @cc_intern(%7508, %7511) : (i64, i64) -> i64
      %7513 = func.call @cc_nil_value() : () -> i64
      %7514 = func.call @cc_cons(%7512, %7513) : (i64, i64) -> i64
      %7515 = func.call @cc_values_pack(%7514) : (i64) -> i64
      func.call @stack_push_pointer(%7512) : (i64) -> ()
      %7516 = llvm.mlir.addressof @str649 : !llvm.ptr
      %7517 = arith.constant 6 : i64
      %7518 = func.call @cc_make_string(%7516, %7517) : (!llvm.ptr, i64) -> i64
      %7519 = func.call @cc_nil_value() : () -> i64
      %7520 = func.call @cc_intern(%7518, %7519) : (i64, i64) -> i64
      %7521 = func.call @cc_nil_value() : () -> i64
      %7522 = func.call @cc_cons(%7520, %7521) : (i64, i64) -> i64
      %7523 = func.call @cc_values_pack(%7522) : (i64) -> i64
      func.call @stack_push_pointer(%7520) : (i64) -> ()
      %7524 = llvm.mlir.addressof @str650 : !llvm.ptr
      %7525 = arith.constant 5 : i64
      %7526 = func.call @cc_make_string(%7524, %7525) : (!llvm.ptr, i64) -> i64
      %7527 = func.call @cc_nil_value() : () -> i64
      %7528 = func.call @cc_intern(%7526, %7527) : (i64, i64) -> i64
      %7529 = func.call @cc_nil_value() : () -> i64
      %7530 = func.call @cc_cons(%7528, %7529) : (i64, i64) -> i64
      %7531 = func.call @cc_values_pack(%7530) : (i64) -> i64
      func.call @stack_push_pointer(%7528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7532 = func.call @stack_pop_pointer() : () -> i64
      %7533 = func.call @stack_pop_pointer() : () -> i64
      %7534 = func.call @cc_cons(%7533, %7532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7534) : (i64) -> ()
      %7535 = llvm.mlir.addressof @str651 : !llvm.ptr
      %7536 = arith.constant 2 : i64
      %7537 = func.call @cc_make_string(%7535, %7536) : (!llvm.ptr, i64) -> i64
      %7538 = func.call @cc_nil_value() : () -> i64
      %7539 = func.call @cc_intern(%7537, %7538) : (i64, i64) -> i64
      %7540 = func.call @cc_nil_value() : () -> i64
      %7541 = func.call @cc_cons(%7539, %7540) : (i64, i64) -> i64
      %7542 = func.call @cc_values_pack(%7541) : (i64) -> i64
      func.call @stack_push_pointer(%7539) : (i64) -> ()
      %7543 = llvm.mlir.addressof @str652 : !llvm.ptr
      %7544 = arith.constant 2 : i64
      %7545 = func.call @cc_make_string(%7543, %7544) : (!llvm.ptr, i64) -> i64
      %7546 = llvm.mlir.addressof @str653 : !llvm.ptr
      %7547 = arith.constant 11 : i64
      %7548 = func.call @cc_make_string(%7546, %7547) : (!llvm.ptr, i64) -> i64
      %7549 = func.call @cc_intern(%7545, %7548) : (i64, i64) -> i64
      %7550 = func.call @cc_nil_value() : () -> i64
      %7551 = func.call @cc_cons(%7549, %7550) : (i64, i64) -> i64
      %7552 = func.call @cc_values_pack(%7551) : (i64) -> i64
      func.call @stack_push_pointer(%7549) : (i64) -> ()
      %7553 = llvm.mlir.addressof @str654 : !llvm.ptr
      %7554 = arith.constant 19 : i64
      %7555 = func.call @cc_make_string(%7553, %7554) : (!llvm.ptr, i64) -> i64
      %7556 = llvm.mlir.addressof @str655 : !llvm.ptr
      %7557 = arith.constant 11 : i64
      %7558 = func.call @cc_make_string(%7556, %7557) : (!llvm.ptr, i64) -> i64
      %7559 = func.call @cc_intern(%7555, %7558) : (i64, i64) -> i64
      %7560 = func.call @cc_nil_value() : () -> i64
      %7561 = func.call @cc_cons(%7559, %7560) : (i64, i64) -> i64
      %7562 = func.call @cc_values_pack(%7561) : (i64) -> i64
      func.call @stack_push_pointer(%7559) : (i64) -> ()
      %7563 = llvm.mlir.addressof @str656 : !llvm.ptr
      %7564 = arith.constant 5 : i64
      %7565 = func.call @cc_make_string(%7563, %7564) : (!llvm.ptr, i64) -> i64
      %7566 = func.call @cc_nil_value() : () -> i64
      %7567 = func.call @cc_intern(%7565, %7566) : (i64, i64) -> i64
      %7568 = func.call @cc_nil_value() : () -> i64
      %7569 = func.call @cc_cons(%7567, %7568) : (i64, i64) -> i64
      %7570 = func.call @cc_values_pack(%7569) : (i64) -> i64
      func.call @stack_push_pointer(%7567) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7571 = func.call @stack_pop_pointer() : () -> i64
      %7572 = func.call @stack_pop_pointer() : () -> i64
      %7573 = func.call @cc_cons(%7572, %7571) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_344 = arith.constant 0 : i64
      %7574 = arith.addi %7573, %__rlasp_stack_elide_zero_344 : i64
      %7575 = func.call @stack_pop_pointer() : () -> i64
      %7576 = func.call @cc_cons(%7575, %7574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7576) : (i64) -> ()
      %7577 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7577) : (i64) -> ()
      %7578 = llvm.mlir.addressof @str657 : !llvm.ptr
      %7579 = arith.constant 32 : i64
      %7580 = func.call @cc_make_string(%7578, %7579) : (!llvm.ptr, i64) -> i64
      %7581 = func.call @cc_nil_value() : () -> i64
      %7582 = func.call @cc_intern(%7580, %7581) : (i64, i64) -> i64
      %7583 = func.call @cc_nil_value() : () -> i64
      %7584 = func.call @cc_cons(%7582, %7583) : (i64, i64) -> i64
      %7585 = func.call @cc_values_pack(%7584) : (i64) -> i64
      %__rlasp_stack_elide_zero_345 = arith.constant 0 : i64
      %7586 = arith.addi %7582, %__rlasp_stack_elide_zero_345 : i64
      %7587 = func.call @stack_pop_pointer() : () -> i64
      %7588 = func.call @cc_cons(%7586, %7587) : (i64, i64) -> i64
      %7589 = llvm.mlir.addressof @str658 : !llvm.ptr
      %7590 = arith.constant 5 : i64
      %7591 = func.call @cc_make_string(%7589, %7590) : (!llvm.ptr, i64) -> i64
      %7592 = func.call @cc_nil_value() : () -> i64
      %7593 = func.call @cc_intern(%7591, %7592) : (i64, i64) -> i64
      %7594 = func.call @cc_nil_value() : () -> i64
      %7595 = func.call @cc_cons(%7593, %7594) : (i64, i64) -> i64
      %7596 = func.call @cc_values_pack(%7595) : (i64) -> i64
      %7597 = func.call @cc_cons(%7593, %7588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7598 = func.call @stack_pop_pointer() : () -> i64
      %7599 = func.call @stack_pop_pointer() : () -> i64
      %7600 = func.call @cc_cons(%7599, %7598) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_346 = arith.constant 0 : i64
      %7601 = arith.addi %7600, %__rlasp_stack_elide_zero_346 : i64
      %7602 = func.call @stack_pop_pointer() : () -> i64
      %7603 = func.call @cc_cons(%7602, %7601) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_347 = arith.constant 0 : i64
      %7604 = arith.addi %7603, %__rlasp_stack_elide_zero_347 : i64
      %7605 = func.call @stack_pop_pointer() : () -> i64
      %7606 = func.call @cc_cons(%7605, %7604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7606) : (i64) -> ()
      %7607 = llvm.mlir.addressof @str659 : !llvm.ptr
      %7608 = arith.constant 5 : i64
      %7609 = func.call @cc_make_string(%7607, %7608) : (!llvm.ptr, i64) -> i64
      %7610 = func.call @cc_nil_value() : () -> i64
      %7611 = func.call @cc_intern(%7609, %7610) : (i64, i64) -> i64
      %7612 = func.call @cc_nil_value() : () -> i64
      %7613 = func.call @cc_cons(%7611, %7612) : (i64, i64) -> i64
      %7614 = func.call @cc_values_pack(%7613) : (i64) -> i64
      func.call @stack_push_pointer(%7611) : (i64) -> ()
      %7615 = llvm.mlir.addressof @str660 : !llvm.ptr
      %7616 = arith.constant 11 : i64
      %7617 = func.call @cc_make_string(%7615, %7616) : (!llvm.ptr, i64) -> i64
      %7618 = func.call @cc_nil_value() : () -> i64
      %7619 = func.call @cc_intern(%7617, %7618) : (i64, i64) -> i64
      %7620 = func.call @cc_nil_value() : () -> i64
      %7621 = func.call @cc_cons(%7619, %7620) : (i64, i64) -> i64
      %7622 = func.call @cc_values_pack(%7621) : (i64) -> i64
      func.call @stack_push_pointer(%7619) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7623 = func.call @stack_pop_pointer() : () -> i64
      %7624 = func.call @stack_pop_pointer() : () -> i64
      %7625 = func.call @cc_cons(%7624, %7623) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_348 = arith.constant 0 : i64
      %7626 = arith.addi %7625, %__rlasp_stack_elide_zero_348 : i64
      %7627 = func.call @stack_pop_pointer() : () -> i64
      %7628 = func.call @cc_cons(%7627, %7626) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_349 = arith.constant 0 : i64
      %7629 = arith.addi %7628, %__rlasp_stack_elide_zero_349 : i64
      %7630 = func.call @stack_pop_pointer() : () -> i64
      %7631 = func.call @cc_cons(%7630, %7629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7631) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7632 = func.call @stack_pop_pointer() : () -> i64
      %7633 = func.call @stack_pop_pointer() : () -> i64
      %7634 = func.call @cc_cons(%7633, %7632) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_350 = arith.constant 0 : i64
      %7635 = arith.addi %7634, %__rlasp_stack_elide_zero_350 : i64
      %7636 = func.call @stack_pop_pointer() : () -> i64
      %7637 = func.call @cc_cons(%7636, %7635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7637) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7638 = func.call @stack_pop_pointer() : () -> i64
      %7639 = func.call @stack_pop_pointer() : () -> i64
      %7640 = func.call @cc_cons(%7639, %7638) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_351 = arith.constant 0 : i64
      %7641 = arith.addi %7640, %__rlasp_stack_elide_zero_351 : i64
      %7642 = func.call @stack_pop_pointer() : () -> i64
      %7643 = func.call @cc_cons(%7642, %7641) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_352 = arith.constant 0 : i64
      %7644 = arith.addi %7643, %__rlasp_stack_elide_zero_352 : i64
      %7645 = func.call @stack_pop_pointer() : () -> i64
      %7646 = func.call @cc_cons(%7645, %7644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_353 = arith.constant 0 : i64
      %7647 = arith.addi %7646, %__rlasp_stack_elide_zero_353 : i64
      %7648 = func.call @stack_pop_pointer() : () -> i64
      %7649 = func.call @cc_cons(%7648, %7647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7649) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7650 = func.call @stack_pop_pointer() : () -> i64
      %7651 = func.call @stack_pop_pointer() : () -> i64
      %7652 = func.call @cc_cons(%7651, %7650) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_354 = arith.constant 0 : i64
      %7653 = arith.addi %7652, %__rlasp_stack_elide_zero_354 : i64
      %7654 = func.call @stack_pop_pointer() : () -> i64
      %7655 = func.call @cc_cons(%7654, %7653) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_355 = arith.constant 0 : i64
      %7656 = arith.addi %7655, %__rlasp_stack_elide_zero_355 : i64
      %7657 = func.call @stack_pop_pointer() : () -> i64
      %7658 = func.call @cc_cons(%7657, %7656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7658) : (i64) -> ()
      %7659 = llvm.mlir.addressof @str661 : !llvm.ptr
      %7660 = arith.constant 5 : i64
      %7661 = func.call @cc_make_string(%7659, %7660) : (!llvm.ptr, i64) -> i64
      %7662 = func.call @cc_nil_value() : () -> i64
      %7663 = func.call @cc_intern(%7661, %7662) : (i64, i64) -> i64
      %7664 = func.call @cc_nil_value() : () -> i64
      %7665 = func.call @cc_cons(%7663, %7664) : (i64, i64) -> i64
      %7666 = func.call @cc_values_pack(%7665) : (i64) -> i64
      func.call @stack_push_pointer(%7663) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7667 = func.call @stack_pop_pointer() : () -> i64
      %7668 = func.call @stack_pop_pointer() : () -> i64
      %7669 = func.call @cc_cons(%7668, %7667) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_356 = arith.constant 0 : i64
      %7670 = arith.addi %7669, %__rlasp_stack_elide_zero_356 : i64
      %7671 = func.call @stack_pop_pointer() : () -> i64
      %7672 = func.call @cc_cons(%7671, %7670) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_357 = arith.constant 0 : i64
      %7673 = arith.addi %7672, %__rlasp_stack_elide_zero_357 : i64
      %7674 = func.call @stack_pop_pointer() : () -> i64
      %7675 = func.call @cc_cons(%7674, %7673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7676 = func.call @stack_pop_pointer() : () -> i64
      %7677 = func.call @stack_pop_pointer() : () -> i64
      %7678 = func.call @cc_cons(%7677, %7676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_358 = arith.constant 0 : i64
      %7679 = arith.addi %7678, %__rlasp_stack_elide_zero_358 : i64
      %7680 = func.call @stack_pop_pointer() : () -> i64
      %7681 = func.call @cc_cons(%7680, %7679) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_359 = arith.constant 0 : i64
      %7682 = arith.addi %7681, %__rlasp_stack_elide_zero_359 : i64
      %7683 = func.call @stack_pop_pointer() : () -> i64
      %7684 = func.call @cc_cons(%7683, %7682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7684) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7685 = func.call @stack_pop_pointer() : () -> i64
      %7686 = func.call @stack_pop_pointer() : () -> i64
      %7687 = func.call @cc_cons(%7686, %7685) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_360 = arith.constant 0 : i64
      %7688 = arith.addi %7687, %__rlasp_stack_elide_zero_360 : i64
      %7689 = func.call @stack_pop_pointer() : () -> i64
      %7690 = func.call @cc_cons(%7689, %7688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_361 = arith.constant 0 : i64
      %7691 = arith.addi %7690, %__rlasp_stack_elide_zero_361 : i64
      %7692 = func.call @stack_pop_pointer() : () -> i64
      %7693 = func.call @cc_cons(%7692, %7691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7693) : (i64) -> ()
      %7694 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%7694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7695 = func.call @stack_pop_pointer() : () -> i64
      %7696 = func.call @stack_pop_pointer() : () -> i64
      %7697 = func.call @cc_cons(%7696, %7695) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_362 = arith.constant 0 : i64
      %7698 = arith.addi %7697, %__rlasp_stack_elide_zero_362 : i64
      %7699 = func.call @stack_pop_pointer() : () -> i64
      %7700 = func.call @cc_cons(%7699, %7698) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_363 = arith.constant 0 : i64
      %7701 = arith.addi %7700, %__rlasp_stack_elide_zero_363 : i64
      %7702 = func.call @stack_pop_pointer() : () -> i64
      %7703 = func.call @cc_cons(%7702, %7701) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7703) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7704 = func.call @stack_pop_pointer() : () -> i64
      %7705 = func.call @stack_pop_pointer() : () -> i64
      %7706 = func.call @cc_cons(%7705, %7704) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_364 = arith.constant 0 : i64
      %7707 = arith.addi %7706, %__rlasp_stack_elide_zero_364 : i64
      %7708 = func.call @stack_pop_pointer() : () -> i64
      %7709 = func.call @cc_cons(%7708, %7707) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_365 = arith.constant 0 : i64
      %7710 = arith.addi %7709, %__rlasp_stack_elide_zero_365 : i64
      %7711 = func.call @stack_pop_pointer() : () -> i64
      %7712 = func.call @cc_cons(%7711, %7710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7713 = func.call @stack_pop_pointer() : () -> i64
      %7714 = func.call @stack_pop_pointer() : () -> i64
      %7715 = func.call @cc_cons(%7714, %7713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_366 = arith.constant 0 : i64
      %7716 = arith.addi %7715, %__rlasp_stack_elide_zero_366 : i64
      %7717 = func.call @stack_pop_pointer() : () -> i64
      %7718 = func.call @cc_cons(%7717, %7716) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_367 = arith.constant 0 : i64
      %7719 = arith.addi %7718, %__rlasp_stack_elide_zero_367 : i64
      %7720 = func.call @stack_pop_pointer() : () -> i64
      %7721 = func.call @cc_cons(%7720, %7719) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7722 = func.call @stack_pop_pointer() : () -> i64
      %7723 = func.call @stack_pop_pointer() : () -> i64
      %7724 = func.call @cc_cons(%7723, %7722) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_368 = arith.constant 0 : i64
      %7725 = arith.addi %7724, %__rlasp_stack_elide_zero_368 : i64
      %7726 = func.call @stack_pop_pointer() : () -> i64
      %7727 = func.call @cc_cons(%7726, %7725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7727) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7728 = func.call @stack_pop_pointer() : () -> i64
      %7729 = func.call @stack_pop_pointer() : () -> i64
      %7730 = func.call @cc_cons(%7729, %7728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_369 = arith.constant 0 : i64
      %7731 = arith.addi %7730, %__rlasp_stack_elide_zero_369 : i64
      %7732 = func.call @stack_pop_pointer() : () -> i64
      %7733 = func.call @cc_cons(%7732, %7731) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_370 = arith.constant 0 : i64
      %7734 = arith.addi %7733, %__rlasp_stack_elide_zero_370 : i64
      %7953 = llvm.mlir.addressof @str676 : !llvm.ptr
      %7954 = arith.constant 33 : i64
      %7955 = func.call @cc_make_symbol(%7953, %7954) : (!llvm.ptr, i64) -> i64
      %7956 = func.call @cc_persistent_root_value(%7955) : (i64) -> i64
      func.call @stack_push_pointer(%7956) : (i64) -> ()
      %7957 = arith.constant 97047688511552 : i64
      %7958 = arith.constant 1 : i64
      %7959 = func.call @cc_make_closure(%7957, %7958) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_371 = arith.constant 0 : i64
      %7960 = arith.addi %7959, %__rlasp_stack_elide_zero_371 : i64
      %7961 = llvm.mlir.addressof @str677 : !llvm.ptr
      %7962 = arith.constant 1 : i64
      %7963 = func.call @cc_make_string(%7961, %7962) : (!llvm.ptr, i64) -> i64
      %7964 = func.call @cc_nil_value() : () -> i64
      %7965 = func.call @cc_intern(%7963, %7964) : (i64, i64) -> i64
      %7966 = func.call @cc_nil_value() : () -> i64
      %7967 = func.call @cc_cons(%7965, %7966) : (i64, i64) -> i64
      %7968 = func.call @cc_values_pack(%7967) : (i64) -> i64
      func.call @stack_push_pointer(%7965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7969 = func.call @stack_pop_pointer() : () -> i64
      %7970 = func.call @stack_pop_pointer() : () -> i64
      %7971 = func.call @cc_cons(%7970, %7969) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_372 = arith.constant 0 : i64
      %7972 = arith.addi %7971, %__rlasp_stack_elide_zero_372 : i64
      %7973 = llvm.mlir.addressof @str678 : !llvm.ptr
      %7974 = arith.constant 11 : i64
      %7975 = func.call @cc_make_string(%7973, %7974) : (!llvm.ptr, i64) -> i64
      %7976 = llvm.mlir.addressof @str679 : !llvm.ptr
      %7977 = arith.constant 7 : i64
      %7978 = func.call @cc_make_string(%7976, %7977) : (!llvm.ptr, i64) -> i64
      %7979 = func.call @cc_intern(%7975, %7978) : (i64, i64) -> i64
      %7980 = func.call @cc_nil_value() : () -> i64
      %7981 = func.call @cc_cons(%7979, %7980) : (i64, i64) -> i64
      %7982 = func.call @cc_values_pack(%7981) : (i64) -> i64
      %7983 = func.call @cc_nil_value() : () -> i64
      %7984 = llvm.mlir.addressof @str680 : !llvm.ptr
      %7985 = arith.constant 4 : i64
      %7986 = func.call @cc_make_string(%7984, %7985) : (!llvm.ptr, i64) -> i64
      %7987 = llvm.mlir.addressof @str681 : !llvm.ptr
      %7988 = arith.constant 7 : i64
      %7989 = func.call @cc_make_string(%7987, %7988) : (!llvm.ptr, i64) -> i64
      %7990 = func.call @cc_intern(%7986, %7989) : (i64, i64) -> i64
      %7991 = func.call @cc_nil_value() : () -> i64
      %7992 = func.call @cc_cons(%7990, %7991) : (i64, i64) -> i64
      %7993 = func.call @cc_values_pack(%7992) : (i64) -> i64
      %7994 = llvm.mlir.addressof @str682 : !llvm.ptr
      %7995 = arith.constant 6 : i64
      %7996 = func.call @cc_make_string(%7994, %7995) : (!llvm.ptr, i64) -> i64
      %7997 = func.call @cc_nil_value() : () -> i64
      %7998 = func.call @cc_intern(%7996, %7997) : (i64, i64) -> i64
      %7999 = func.call @cc_nil_value() : () -> i64
      %8000 = func.call @cc_cons(%7998, %7999) : (i64, i64) -> i64
      %8001 = func.call @cc_values_pack(%8000) : (i64) -> i64
      %__rlasp_stack_elide_zero_373 = arith.constant 0 : i64
      %8002 = arith.addi %7998, %__rlasp_stack_elide_zero_373 : i64
      %8003 = func.call @cc_nil_value() : () -> i64
      %8004 = func.call @cc_errorp(%7434) : (i64) -> i64
      %8005 = arith.cmpi ne, %8004, %8003 : i64
      %8006 = arith.cmpi eq, %8003, %8003 : i64
      %8007 = arith.andi %8005, %8006 : i1
      %8008 = scf.if %8007 -> (i64) {
        scf.yield %7434 : i64
      } else {
        scf.yield %8003 : i64
      }
      %8009 = func.call @cc_errorp(%7734) : (i64) -> i64
      %8010 = arith.cmpi ne, %8009, %8003 : i64
      %8011 = arith.cmpi eq, %8008, %8003 : i64
      %8012 = arith.andi %8010, %8011 : i1
      %8013 = scf.if %8012 -> (i64) {
        scf.yield %7734 : i64
      } else {
        scf.yield %8008 : i64
      }
      %8014 = func.call @cc_errorp(%7960) : (i64) -> i64
      %8015 = arith.cmpi ne, %8014, %8003 : i64
      %8016 = arith.cmpi eq, %8013, %8003 : i64
      %8017 = arith.andi %8015, %8016 : i1
      %8018 = scf.if %8017 -> (i64) {
        scf.yield %7960 : i64
      } else {
        scf.yield %8013 : i64
      }
      %8019 = func.call @cc_errorp(%7972) : (i64) -> i64
      %8020 = arith.cmpi ne, %8019, %8003 : i64
      %8021 = arith.cmpi eq, %8018, %8003 : i64
      %8022 = arith.andi %8020, %8021 : i1
      %8023 = scf.if %8022 -> (i64) {
        scf.yield %7972 : i64
      } else {
        scf.yield %8018 : i64
      }
      %8024 = func.call @cc_errorp(%7979) : (i64) -> i64
      %8025 = arith.cmpi ne, %8024, %8003 : i64
      %8026 = arith.cmpi eq, %8023, %8003 : i64
      %8027 = arith.andi %8025, %8026 : i1
      %8028 = scf.if %8027 -> (i64) {
        scf.yield %7979 : i64
      } else {
        scf.yield %8023 : i64
      }
      %8029 = func.call @cc_errorp(%7983) : (i64) -> i64
      %8030 = arith.cmpi ne, %8029, %8003 : i64
      %8031 = arith.cmpi eq, %8028, %8003 : i64
      %8032 = arith.andi %8030, %8031 : i1
      %8033 = scf.if %8032 -> (i64) {
        scf.yield %7983 : i64
      } else {
        scf.yield %8028 : i64
      }
      %8034 = func.call @cc_errorp(%7990) : (i64) -> i64
      %8035 = arith.cmpi ne, %8034, %8003 : i64
      %8036 = arith.cmpi eq, %8033, %8003 : i64
      %8037 = arith.andi %8035, %8036 : i1
      %8038 = scf.if %8037 -> (i64) {
        scf.yield %7990 : i64
      } else {
        scf.yield %8033 : i64
      }
      %8039 = func.call @cc_errorp(%8002) : (i64) -> i64
      %8040 = arith.cmpi ne, %8039, %8003 : i64
      %8041 = arith.cmpi eq, %8038, %8003 : i64
      %8042 = arith.andi %8040, %8041 : i1
      %8043 = scf.if %8042 -> (i64) {
        scf.yield %8002 : i64
      } else {
        scf.yield %8038 : i64
      }
      %8044 = arith.cmpi ne, %8043, %8003 : i64
      scf.if %8044 {
        func.call @stack_push_pointer(%8043) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7434) : (i64) -> ()
        func.call @stack_push_pointer(%7734) : (i64) -> ()
        func.call @stack_push_pointer(%7960) : (i64) -> ()
        func.call @stack_push_pointer(%7972) : (i64) -> ()
        func.call @stack_push_pointer(%7979) : (i64) -> ()
        func.call @stack_push_pointer(%7983) : (i64) -> ()
        func.call @stack_push_pointer(%7990) : (i64) -> ()
        func.call @stack_push_pointer(%8002) : (i64) -> ()
        %8045 = llvm.mlir.addressof @str683 : !llvm.ptr
        %8046 = func.call @cc_make_function_ref_const(%8045) : (!llvm.ptr) -> i64
        %8047 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8046, %8047) : (i64, i64) -> ()
      }
      %8048 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8048 : i64
    }
    %8049 = func.call @cc_nil_value() : () -> i64
    %8050 = func.call @cc_errorp(%7425) : (i64) -> i64
    %8051 = arith.cmpi ne, %8050, %8049 : i64
    %8052 = scf.if %8051 -> (i64) {
      scf.yield %7425 : i64
    } else {
      %8053 = llvm.mlir.addressof @str684 : !llvm.ptr
      %8054 = arith.constant 9 : i64
      %8055 = func.call @cc_make_string(%8053, %8054) : (!llvm.ptr, i64) -> i64
      %8056 = func.call @cc_nil_value() : () -> i64
      %8057 = func.call @cc_intern(%8055, %8056) : (i64, i64) -> i64
      %8058 = func.call @cc_nil_value() : () -> i64
      %8059 = func.call @cc_cons(%8057, %8058) : (i64, i64) -> i64
      %8060 = func.call @cc_values_pack(%8059) : (i64) -> i64
      %__rlasp_stack_elide_zero_374 = arith.constant 0 : i64
      %8061 = arith.addi %8057, %__rlasp_stack_elide_zero_374 : i64
      %8062 = llvm.mlir.addressof @str685 : !llvm.ptr
      %8063 = arith.constant 3 : i64
      %8064 = func.call @cc_make_string(%8062, %8063) : (!llvm.ptr, i64) -> i64
      %8065 = func.call @cc_nil_value() : () -> i64
      %8066 = func.call @cc_intern(%8064, %8065) : (i64, i64) -> i64
      %8067 = func.call @cc_nil_value() : () -> i64
      %8068 = func.call @cc_cons(%8066, %8067) : (i64, i64) -> i64
      %8069 = func.call @cc_values_pack(%8068) : (i64) -> i64
      func.call @stack_push_pointer(%8066) : (i64) -> ()
      %8070 = llvm.mlir.addressof @str686 : !llvm.ptr
      %8071 = arith.constant 3 : i64
      %8072 = func.call @cc_make_string(%8070, %8071) : (!llvm.ptr, i64) -> i64
      %8073 = func.call @cc_nil_value() : () -> i64
      %8074 = func.call @cc_intern(%8072, %8073) : (i64, i64) -> i64
      %8075 = func.call @cc_nil_value() : () -> i64
      %8076 = func.call @cc_cons(%8074, %8075) : (i64, i64) -> i64
      %8077 = func.call @cc_values_pack(%8076) : (i64) -> i64
      func.call @stack_push_pointer(%8074) : (i64) -> ()
      %8078 = llvm.mlir.addressof @str687 : !llvm.ptr
      %8079 = arith.constant 5 : i64
      %8080 = func.call @cc_make_string(%8078, %8079) : (!llvm.ptr, i64) -> i64
      %8081 = func.call @cc_nil_value() : () -> i64
      %8082 = func.call @cc_intern(%8080, %8081) : (i64, i64) -> i64
      %8083 = func.call @cc_nil_value() : () -> i64
      %8084 = func.call @cc_cons(%8082, %8083) : (i64, i64) -> i64
      %8085 = func.call @cc_values_pack(%8084) : (i64) -> i64
      func.call @stack_push_pointer(%8082) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8086 = llvm.mlir.addressof @str688 : !llvm.ptr
      %8087 = arith.constant 32 : i64
      %8088 = func.call @cc_make_string(%8086, %8087) : (!llvm.ptr, i64) -> i64
      %8089 = func.call @cc_nil_value() : () -> i64
      %8090 = func.call @cc_intern(%8088, %8089) : (i64, i64) -> i64
      %8091 = func.call @cc_nil_value() : () -> i64
      %8092 = func.call @cc_cons(%8090, %8091) : (i64, i64) -> i64
      %8093 = func.call @cc_values_pack(%8092) : (i64) -> i64
      func.call @stack_push_pointer(%8090) : (i64) -> ()
      %8094 = llvm.mlir.addressof @str689 : !llvm.ptr
      %8095 = arith.constant 6 : i64
      %8096 = func.call @cc_make_string(%8094, %8095) : (!llvm.ptr, i64) -> i64
      %8097 = func.call @cc_nil_value() : () -> i64
      %8098 = func.call @cc_intern(%8096, %8097) : (i64, i64) -> i64
      %8099 = func.call @cc_nil_value() : () -> i64
      %8100 = func.call @cc_cons(%8098, %8099) : (i64, i64) -> i64
      %8101 = func.call @cc_values_pack(%8100) : (i64) -> i64
      func.call @stack_push_pointer(%8098) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8102 = llvm.mlir.addressof @str690 : !llvm.ptr
      %8103 = arith.constant 17 : i64
      %8104 = func.call @cc_make_string(%8102, %8103) : (!llvm.ptr, i64) -> i64
      %8105 = llvm.mlir.addressof @str691 : !llvm.ptr
      %8106 = arith.constant 11 : i64
      %8107 = func.call @cc_make_string(%8105, %8106) : (!llvm.ptr, i64) -> i64
      %8108 = func.call @cc_intern(%8104, %8107) : (i64, i64) -> i64
      %8109 = func.call @cc_nil_value() : () -> i64
      %8110 = func.call @cc_cons(%8108, %8109) : (i64, i64) -> i64
      %8111 = func.call @cc_values_pack(%8110) : (i64) -> i64
      func.call @stack_push_pointer(%8108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8112 = llvm.mlir.addressof @str692 : !llvm.ptr
      %8113 = arith.constant 10 : i64
      %8114 = func.call @cc_make_string(%8112, %8113) : (!llvm.ptr, i64) -> i64
      %8115 = llvm.mlir.addressof @str693 : !llvm.ptr
      %8116 = arith.constant 11 : i64
      %8117 = func.call @cc_make_string(%8115, %8116) : (!llvm.ptr, i64) -> i64
      %8118 = func.call @cc_intern(%8114, %8117) : (i64, i64) -> i64
      %8119 = func.call @cc_nil_value() : () -> i64
      %8120 = func.call @cc_cons(%8118, %8119) : (i64, i64) -> i64
      %8121 = func.call @cc_values_pack(%8120) : (i64) -> i64
      func.call @stack_push_pointer(%8118) : (i64) -> ()
      %8122 = llvm.mlir.addressof @str694 : !llvm.ptr
      %8123 = arith.constant 5 : i64
      %8124 = func.call @cc_make_string(%8122, %8123) : (!llvm.ptr, i64) -> i64
      %8125 = func.call @cc_nil_value() : () -> i64
      %8126 = func.call @cc_intern(%8124, %8125) : (i64, i64) -> i64
      %8127 = func.call @cc_nil_value() : () -> i64
      %8128 = func.call @cc_cons(%8126, %8127) : (i64, i64) -> i64
      %8129 = func.call @cc_values_pack(%8128) : (i64) -> i64
      func.call @stack_push_pointer(%8126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8130 = func.call @stack_pop_pointer() : () -> i64
      %8131 = func.call @stack_pop_pointer() : () -> i64
      %8132 = func.call @cc_cons(%8131, %8130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8132) : (i64) -> ()
      %8133 = llvm.mlir.addressof @str695 : !llvm.ptr
      %8134 = arith.constant 9 : i64
      %8135 = func.call @cc_make_string(%8133, %8134) : (!llvm.ptr, i64) -> i64
      %8136 = llvm.mlir.addressof @str696 : !llvm.ptr
      %8137 = arith.constant 11 : i64
      %8138 = func.call @cc_make_string(%8136, %8137) : (!llvm.ptr, i64) -> i64
      %8139 = func.call @cc_intern(%8135, %8138) : (i64, i64) -> i64
      %8140 = func.call @cc_nil_value() : () -> i64
      %8141 = func.call @cc_cons(%8139, %8140) : (i64, i64) -> i64
      %8142 = func.call @cc_values_pack(%8141) : (i64) -> i64
      func.call @stack_push_pointer(%8139) : (i64) -> ()
      %8143 = llvm.mlir.addressof @str697 : !llvm.ptr
      %8144 = arith.constant 6 : i64
      %8145 = func.call @cc_make_string(%8143, %8144) : (!llvm.ptr, i64) -> i64
      %8146 = func.call @cc_nil_value() : () -> i64
      %8147 = func.call @cc_intern(%8145, %8146) : (i64, i64) -> i64
      %8148 = func.call @cc_nil_value() : () -> i64
      %8149 = func.call @cc_cons(%8147, %8148) : (i64, i64) -> i64
      %8150 = func.call @cc_values_pack(%8149) : (i64) -> i64
      func.call @stack_push_pointer(%8147) : (i64) -> ()
      %8151 = llvm.mlir.addressof @str698 : !llvm.ptr
      %8152 = arith.constant 5 : i64
      %8153 = func.call @cc_make_string(%8151, %8152) : (!llvm.ptr, i64) -> i64
      %8154 = func.call @cc_nil_value() : () -> i64
      %8155 = func.call @cc_intern(%8153, %8154) : (i64, i64) -> i64
      %8156 = func.call @cc_nil_value() : () -> i64
      %8157 = func.call @cc_cons(%8155, %8156) : (i64, i64) -> i64
      %8158 = func.call @cc_values_pack(%8157) : (i64) -> i64
      func.call @stack_push_pointer(%8155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8159 = func.call @stack_pop_pointer() : () -> i64
      %8160 = func.call @stack_pop_pointer() : () -> i64
      %8161 = func.call @cc_cons(%8160, %8159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8161) : (i64) -> ()
      %8162 = llvm.mlir.addressof @str699 : !llvm.ptr
      %8163 = arith.constant 2 : i64
      %8164 = func.call @cc_make_string(%8162, %8163) : (!llvm.ptr, i64) -> i64
      %8165 = func.call @cc_nil_value() : () -> i64
      %8166 = func.call @cc_intern(%8164, %8165) : (i64, i64) -> i64
      %8167 = func.call @cc_nil_value() : () -> i64
      %8168 = func.call @cc_cons(%8166, %8167) : (i64, i64) -> i64
      %8169 = func.call @cc_values_pack(%8168) : (i64) -> i64
      func.call @stack_push_pointer(%8166) : (i64) -> ()
      %8170 = llvm.mlir.addressof @str700 : !llvm.ptr
      %8171 = arith.constant 2 : i64
      %8172 = func.call @cc_make_string(%8170, %8171) : (!llvm.ptr, i64) -> i64
      %8173 = llvm.mlir.addressof @str701 : !llvm.ptr
      %8174 = arith.constant 11 : i64
      %8175 = func.call @cc_make_string(%8173, %8174) : (!llvm.ptr, i64) -> i64
      %8176 = func.call @cc_intern(%8172, %8175) : (i64, i64) -> i64
      %8177 = func.call @cc_nil_value() : () -> i64
      %8178 = func.call @cc_cons(%8176, %8177) : (i64, i64) -> i64
      %8179 = func.call @cc_values_pack(%8178) : (i64) -> i64
      func.call @stack_push_pointer(%8176) : (i64) -> ()
      %8180 = llvm.mlir.addressof @str702 : !llvm.ptr
      %8181 = arith.constant 19 : i64
      %8182 = func.call @cc_make_string(%8180, %8181) : (!llvm.ptr, i64) -> i64
      %8183 = llvm.mlir.addressof @str703 : !llvm.ptr
      %8184 = arith.constant 11 : i64
      %8185 = func.call @cc_make_string(%8183, %8184) : (!llvm.ptr, i64) -> i64
      %8186 = func.call @cc_intern(%8182, %8185) : (i64, i64) -> i64
      %8187 = func.call @cc_nil_value() : () -> i64
      %8188 = func.call @cc_cons(%8186, %8187) : (i64, i64) -> i64
      %8189 = func.call @cc_values_pack(%8188) : (i64) -> i64
      func.call @stack_push_pointer(%8186) : (i64) -> ()
      %8190 = llvm.mlir.addressof @str704 : !llvm.ptr
      %8191 = arith.constant 5 : i64
      %8192 = func.call @cc_make_string(%8190, %8191) : (!llvm.ptr, i64) -> i64
      %8193 = func.call @cc_nil_value() : () -> i64
      %8194 = func.call @cc_intern(%8192, %8193) : (i64, i64) -> i64
      %8195 = func.call @cc_nil_value() : () -> i64
      %8196 = func.call @cc_cons(%8194, %8195) : (i64, i64) -> i64
      %8197 = func.call @cc_values_pack(%8196) : (i64) -> i64
      func.call @stack_push_pointer(%8194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8198 = func.call @stack_pop_pointer() : () -> i64
      %8199 = func.call @stack_pop_pointer() : () -> i64
      %8200 = func.call @cc_cons(%8199, %8198) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_375 = arith.constant 0 : i64
      %8201 = arith.addi %8200, %__rlasp_stack_elide_zero_375 : i64
      %8202 = func.call @stack_pop_pointer() : () -> i64
      %8203 = func.call @cc_cons(%8202, %8201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8203) : (i64) -> ()
      %8204 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8204) : (i64) -> ()
      %8205 = llvm.mlir.addressof @str705 : !llvm.ptr
      %8206 = arith.constant 32 : i64
      %8207 = func.call @cc_make_string(%8205, %8206) : (!llvm.ptr, i64) -> i64
      %8208 = func.call @cc_nil_value() : () -> i64
      %8209 = func.call @cc_intern(%8207, %8208) : (i64, i64) -> i64
      %8210 = func.call @cc_nil_value() : () -> i64
      %8211 = func.call @cc_cons(%8209, %8210) : (i64, i64) -> i64
      %8212 = func.call @cc_values_pack(%8211) : (i64) -> i64
      %__rlasp_stack_elide_zero_376 = arith.constant 0 : i64
      %8213 = arith.addi %8209, %__rlasp_stack_elide_zero_376 : i64
      %8214 = func.call @stack_pop_pointer() : () -> i64
      %8215 = func.call @cc_cons(%8213, %8214) : (i64, i64) -> i64
      %8216 = llvm.mlir.addressof @str706 : !llvm.ptr
      %8217 = arith.constant 5 : i64
      %8218 = func.call @cc_make_string(%8216, %8217) : (!llvm.ptr, i64) -> i64
      %8219 = func.call @cc_nil_value() : () -> i64
      %8220 = func.call @cc_intern(%8218, %8219) : (i64, i64) -> i64
      %8221 = func.call @cc_nil_value() : () -> i64
      %8222 = func.call @cc_cons(%8220, %8221) : (i64, i64) -> i64
      %8223 = func.call @cc_values_pack(%8222) : (i64) -> i64
      %8224 = func.call @cc_cons(%8220, %8215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8224) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8225 = func.call @stack_pop_pointer() : () -> i64
      %8226 = func.call @stack_pop_pointer() : () -> i64
      %8227 = func.call @cc_cons(%8226, %8225) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_377 = arith.constant 0 : i64
      %8228 = arith.addi %8227, %__rlasp_stack_elide_zero_377 : i64
      %8229 = func.call @stack_pop_pointer() : () -> i64
      %8230 = func.call @cc_cons(%8229, %8228) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_378 = arith.constant 0 : i64
      %8231 = arith.addi %8230, %__rlasp_stack_elide_zero_378 : i64
      %8232 = func.call @stack_pop_pointer() : () -> i64
      %8233 = func.call @cc_cons(%8232, %8231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8233) : (i64) -> ()
      %8234 = llvm.mlir.addressof @str707 : !llvm.ptr
      %8235 = arith.constant 5 : i64
      %8236 = func.call @cc_make_string(%8234, %8235) : (!llvm.ptr, i64) -> i64
      %8237 = func.call @cc_nil_value() : () -> i64
      %8238 = func.call @cc_intern(%8236, %8237) : (i64, i64) -> i64
      %8239 = func.call @cc_nil_value() : () -> i64
      %8240 = func.call @cc_cons(%8238, %8239) : (i64, i64) -> i64
      %8241 = func.call @cc_values_pack(%8240) : (i64) -> i64
      func.call @stack_push_pointer(%8238) : (i64) -> ()
      %8242 = llvm.mlir.addressof @str708 : !llvm.ptr
      %8243 = arith.constant 11 : i64
      %8244 = func.call @cc_make_string(%8242, %8243) : (!llvm.ptr, i64) -> i64
      %8245 = func.call @cc_nil_value() : () -> i64
      %8246 = func.call @cc_intern(%8244, %8245) : (i64, i64) -> i64
      %8247 = func.call @cc_nil_value() : () -> i64
      %8248 = func.call @cc_cons(%8246, %8247) : (i64, i64) -> i64
      %8249 = func.call @cc_values_pack(%8248) : (i64) -> i64
      func.call @stack_push_pointer(%8246) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8250 = func.call @stack_pop_pointer() : () -> i64
      %8251 = func.call @stack_pop_pointer() : () -> i64
      %8252 = func.call @cc_cons(%8251, %8250) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_379 = arith.constant 0 : i64
      %8253 = arith.addi %8252, %__rlasp_stack_elide_zero_379 : i64
      %8254 = func.call @stack_pop_pointer() : () -> i64
      %8255 = func.call @cc_cons(%8254, %8253) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_380 = arith.constant 0 : i64
      %8256 = arith.addi %8255, %__rlasp_stack_elide_zero_380 : i64
      %8257 = func.call @stack_pop_pointer() : () -> i64
      %8258 = func.call @cc_cons(%8257, %8256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8258) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8259 = func.call @stack_pop_pointer() : () -> i64
      %8260 = func.call @stack_pop_pointer() : () -> i64
      %8261 = func.call @cc_cons(%8260, %8259) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_381 = arith.constant 0 : i64
      %8262 = arith.addi %8261, %__rlasp_stack_elide_zero_381 : i64
      %8263 = func.call @stack_pop_pointer() : () -> i64
      %8264 = func.call @cc_cons(%8263, %8262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8264) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8265 = func.call @stack_pop_pointer() : () -> i64
      %8266 = func.call @stack_pop_pointer() : () -> i64
      %8267 = func.call @cc_cons(%8266, %8265) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_382 = arith.constant 0 : i64
      %8268 = arith.addi %8267, %__rlasp_stack_elide_zero_382 : i64
      %8269 = func.call @stack_pop_pointer() : () -> i64
      %8270 = func.call @cc_cons(%8269, %8268) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_383 = arith.constant 0 : i64
      %8271 = arith.addi %8270, %__rlasp_stack_elide_zero_383 : i64
      %8272 = func.call @stack_pop_pointer() : () -> i64
      %8273 = func.call @cc_cons(%8272, %8271) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_384 = arith.constant 0 : i64
      %8274 = arith.addi %8273, %__rlasp_stack_elide_zero_384 : i64
      %8275 = func.call @stack_pop_pointer() : () -> i64
      %8276 = func.call @cc_cons(%8275, %8274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8276) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8277 = func.call @stack_pop_pointer() : () -> i64
      %8278 = func.call @stack_pop_pointer() : () -> i64
      %8279 = func.call @cc_cons(%8278, %8277) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_385 = arith.constant 0 : i64
      %8280 = arith.addi %8279, %__rlasp_stack_elide_zero_385 : i64
      %8281 = func.call @stack_pop_pointer() : () -> i64
      %8282 = func.call @cc_cons(%8281, %8280) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_386 = arith.constant 0 : i64
      %8283 = arith.addi %8282, %__rlasp_stack_elide_zero_386 : i64
      %8284 = func.call @stack_pop_pointer() : () -> i64
      %8285 = func.call @cc_cons(%8284, %8283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8285) : (i64) -> ()
      %8286 = llvm.mlir.addressof @str709 : !llvm.ptr
      %8287 = arith.constant 5 : i64
      %8288 = func.call @cc_make_string(%8286, %8287) : (!llvm.ptr, i64) -> i64
      %8289 = func.call @cc_nil_value() : () -> i64
      %8290 = func.call @cc_intern(%8288, %8289) : (i64, i64) -> i64
      %8291 = func.call @cc_nil_value() : () -> i64
      %8292 = func.call @cc_cons(%8290, %8291) : (i64, i64) -> i64
      %8293 = func.call @cc_values_pack(%8292) : (i64) -> i64
      func.call @stack_push_pointer(%8290) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8294 = func.call @stack_pop_pointer() : () -> i64
      %8295 = func.call @stack_pop_pointer() : () -> i64
      %8296 = func.call @cc_cons(%8295, %8294) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_387 = arith.constant 0 : i64
      %8297 = arith.addi %8296, %__rlasp_stack_elide_zero_387 : i64
      %8298 = func.call @stack_pop_pointer() : () -> i64
      %8299 = func.call @cc_cons(%8298, %8297) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_388 = arith.constant 0 : i64
      %8300 = arith.addi %8299, %__rlasp_stack_elide_zero_388 : i64
      %8301 = func.call @stack_pop_pointer() : () -> i64
      %8302 = func.call @cc_cons(%8301, %8300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8303 = func.call @stack_pop_pointer() : () -> i64
      %8304 = func.call @stack_pop_pointer() : () -> i64
      %8305 = func.call @cc_cons(%8304, %8303) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_389 = arith.constant 0 : i64
      %8306 = arith.addi %8305, %__rlasp_stack_elide_zero_389 : i64
      %8307 = func.call @stack_pop_pointer() : () -> i64
      %8308 = func.call @cc_cons(%8307, %8306) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_390 = arith.constant 0 : i64
      %8309 = arith.addi %8308, %__rlasp_stack_elide_zero_390 : i64
      %8310 = func.call @stack_pop_pointer() : () -> i64
      %8311 = func.call @cc_cons(%8310, %8309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8312 = func.call @stack_pop_pointer() : () -> i64
      %8313 = func.call @stack_pop_pointer() : () -> i64
      %8314 = func.call @cc_cons(%8313, %8312) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_391 = arith.constant 0 : i64
      %8315 = arith.addi %8314, %__rlasp_stack_elide_zero_391 : i64
      %8316 = func.call @stack_pop_pointer() : () -> i64
      %8317 = func.call @cc_cons(%8316, %8315) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_392 = arith.constant 0 : i64
      %8318 = arith.addi %8317, %__rlasp_stack_elide_zero_392 : i64
      %8319 = func.call @stack_pop_pointer() : () -> i64
      %8320 = func.call @cc_cons(%8319, %8318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8320) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8321 = func.call @stack_pop_pointer() : () -> i64
      %8322 = func.call @stack_pop_pointer() : () -> i64
      %8323 = func.call @cc_cons(%8322, %8321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_393 = arith.constant 0 : i64
      %8324 = arith.addi %8323, %__rlasp_stack_elide_zero_393 : i64
      %8325 = func.call @stack_pop_pointer() : () -> i64
      %8326 = func.call @cc_cons(%8325, %8324) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_394 = arith.constant 0 : i64
      %8327 = arith.addi %8326, %__rlasp_stack_elide_zero_394 : i64
      %8328 = func.call @stack_pop_pointer() : () -> i64
      %8329 = func.call @cc_cons(%8328, %8327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8329) : (i64) -> ()
      %8330 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%8330) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8331 = func.call @stack_pop_pointer() : () -> i64
      %8332 = func.call @stack_pop_pointer() : () -> i64
      %8333 = func.call @cc_cons(%8332, %8331) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_395 = arith.constant 0 : i64
      %8334 = arith.addi %8333, %__rlasp_stack_elide_zero_395 : i64
      %8335 = func.call @stack_pop_pointer() : () -> i64
      %8336 = func.call @cc_cons(%8335, %8334) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_396 = arith.constant 0 : i64
      %8337 = arith.addi %8336, %__rlasp_stack_elide_zero_396 : i64
      %8338 = func.call @stack_pop_pointer() : () -> i64
      %8339 = func.call @cc_cons(%8338, %8337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8339) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8340 = func.call @stack_pop_pointer() : () -> i64
      %8341 = func.call @stack_pop_pointer() : () -> i64
      %8342 = func.call @cc_cons(%8341, %8340) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_397 = arith.constant 0 : i64
      %8343 = arith.addi %8342, %__rlasp_stack_elide_zero_397 : i64
      %8344 = func.call @stack_pop_pointer() : () -> i64
      %8345 = func.call @cc_cons(%8344, %8343) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_398 = arith.constant 0 : i64
      %8346 = arith.addi %8345, %__rlasp_stack_elide_zero_398 : i64
      %8347 = func.call @stack_pop_pointer() : () -> i64
      %8348 = func.call @cc_cons(%8347, %8346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8349 = func.call @stack_pop_pointer() : () -> i64
      %8350 = func.call @stack_pop_pointer() : () -> i64
      %8351 = func.call @cc_cons(%8350, %8349) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_399 = arith.constant 0 : i64
      %8352 = arith.addi %8351, %__rlasp_stack_elide_zero_399 : i64
      %8353 = func.call @stack_pop_pointer() : () -> i64
      %8354 = func.call @cc_cons(%8353, %8352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8354) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8355 = func.call @stack_pop_pointer() : () -> i64
      %8356 = func.call @stack_pop_pointer() : () -> i64
      %8357 = func.call @cc_cons(%8356, %8355) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_400 = arith.constant 0 : i64
      %8358 = arith.addi %8357, %__rlasp_stack_elide_zero_400 : i64
      %8359 = func.call @stack_pop_pointer() : () -> i64
      %8360 = func.call @cc_cons(%8359, %8358) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_401 = arith.constant 0 : i64
      %8361 = arith.addi %8360, %__rlasp_stack_elide_zero_401 : i64
      %8580 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8581 = arith.constant 33 : i64
      %8582 = func.call @cc_make_symbol(%8580, %8581) : (!llvm.ptr, i64) -> i64
      %8583 = func.call @cc_persistent_root_value(%8582) : (i64) -> i64
      func.call @stack_push_pointer(%8583) : (i64) -> ()
      %8584 = arith.constant 97047688511558 : i64
      %8585 = arith.constant 1 : i64
      %8586 = func.call @cc_make_closure(%8584, %8585) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_402 = arith.constant 0 : i64
      %8587 = arith.addi %8586, %__rlasp_stack_elide_zero_402 : i64
      %8588 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8589 = arith.constant 1 : i64
      %8590 = func.call @cc_make_string(%8588, %8589) : (!llvm.ptr, i64) -> i64
      %8591 = func.call @cc_nil_value() : () -> i64
      %8592 = func.call @cc_intern(%8590, %8591) : (i64, i64) -> i64
      %8593 = func.call @cc_nil_value() : () -> i64
      %8594 = func.call @cc_cons(%8592, %8593) : (i64, i64) -> i64
      %8595 = func.call @cc_values_pack(%8594) : (i64) -> i64
      func.call @stack_push_pointer(%8592) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8596 = func.call @stack_pop_pointer() : () -> i64
      %8597 = func.call @stack_pop_pointer() : () -> i64
      %8598 = func.call @cc_cons(%8597, %8596) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_403 = arith.constant 0 : i64
      %8599 = arith.addi %8598, %__rlasp_stack_elide_zero_403 : i64
      %8600 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8601 = arith.constant 11 : i64
      %8602 = func.call @cc_make_string(%8600, %8601) : (!llvm.ptr, i64) -> i64
      %8603 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8604 = arith.constant 7 : i64
      %8605 = func.call @cc_make_string(%8603, %8604) : (!llvm.ptr, i64) -> i64
      %8606 = func.call @cc_intern(%8602, %8605) : (i64, i64) -> i64
      %8607 = func.call @cc_nil_value() : () -> i64
      %8608 = func.call @cc_cons(%8606, %8607) : (i64, i64) -> i64
      %8609 = func.call @cc_values_pack(%8608) : (i64) -> i64
      %8610 = func.call @cc_nil_value() : () -> i64
      %8611 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8612 = arith.constant 4 : i64
      %8613 = func.call @cc_make_string(%8611, %8612) : (!llvm.ptr, i64) -> i64
      %8614 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8615 = arith.constant 7 : i64
      %8616 = func.call @cc_make_string(%8614, %8615) : (!llvm.ptr, i64) -> i64
      %8617 = func.call @cc_intern(%8613, %8616) : (i64, i64) -> i64
      %8618 = func.call @cc_nil_value() : () -> i64
      %8619 = func.call @cc_cons(%8617, %8618) : (i64, i64) -> i64
      %8620 = func.call @cc_values_pack(%8619) : (i64) -> i64
      %8621 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8622 = arith.constant 6 : i64
      %8623 = func.call @cc_make_string(%8621, %8622) : (!llvm.ptr, i64) -> i64
      %8624 = func.call @cc_nil_value() : () -> i64
      %8625 = func.call @cc_intern(%8623, %8624) : (i64, i64) -> i64
      %8626 = func.call @cc_nil_value() : () -> i64
      %8627 = func.call @cc_cons(%8625, %8626) : (i64, i64) -> i64
      %8628 = func.call @cc_values_pack(%8627) : (i64) -> i64
      %__rlasp_stack_elide_zero_404 = arith.constant 0 : i64
      %8629 = arith.addi %8625, %__rlasp_stack_elide_zero_404 : i64
      %8630 = func.call @cc_nil_value() : () -> i64
      %8631 = func.call @cc_errorp(%8061) : (i64) -> i64
      %8632 = arith.cmpi ne, %8631, %8630 : i64
      %8633 = arith.cmpi eq, %8630, %8630 : i64
      %8634 = arith.andi %8632, %8633 : i1
      %8635 = scf.if %8634 -> (i64) {
        scf.yield %8061 : i64
      } else {
        scf.yield %8630 : i64
      }
      %8636 = func.call @cc_errorp(%8361) : (i64) -> i64
      %8637 = arith.cmpi ne, %8636, %8630 : i64
      %8638 = arith.cmpi eq, %8635, %8630 : i64
      %8639 = arith.andi %8637, %8638 : i1
      %8640 = scf.if %8639 -> (i64) {
        scf.yield %8361 : i64
      } else {
        scf.yield %8635 : i64
      }
      %8641 = func.call @cc_errorp(%8587) : (i64) -> i64
      %8642 = arith.cmpi ne, %8641, %8630 : i64
      %8643 = arith.cmpi eq, %8640, %8630 : i64
      %8644 = arith.andi %8642, %8643 : i1
      %8645 = scf.if %8644 -> (i64) {
        scf.yield %8587 : i64
      } else {
        scf.yield %8640 : i64
      }
      %8646 = func.call @cc_errorp(%8599) : (i64) -> i64
      %8647 = arith.cmpi ne, %8646, %8630 : i64
      %8648 = arith.cmpi eq, %8645, %8630 : i64
      %8649 = arith.andi %8647, %8648 : i1
      %8650 = scf.if %8649 -> (i64) {
        scf.yield %8599 : i64
      } else {
        scf.yield %8645 : i64
      }
      %8651 = func.call @cc_errorp(%8606) : (i64) -> i64
      %8652 = arith.cmpi ne, %8651, %8630 : i64
      %8653 = arith.cmpi eq, %8650, %8630 : i64
      %8654 = arith.andi %8652, %8653 : i1
      %8655 = scf.if %8654 -> (i64) {
        scf.yield %8606 : i64
      } else {
        scf.yield %8650 : i64
      }
      %8656 = func.call @cc_errorp(%8610) : (i64) -> i64
      %8657 = arith.cmpi ne, %8656, %8630 : i64
      %8658 = arith.cmpi eq, %8655, %8630 : i64
      %8659 = arith.andi %8657, %8658 : i1
      %8660 = scf.if %8659 -> (i64) {
        scf.yield %8610 : i64
      } else {
        scf.yield %8655 : i64
      }
      %8661 = func.call @cc_errorp(%8617) : (i64) -> i64
      %8662 = arith.cmpi ne, %8661, %8630 : i64
      %8663 = arith.cmpi eq, %8660, %8630 : i64
      %8664 = arith.andi %8662, %8663 : i1
      %8665 = scf.if %8664 -> (i64) {
        scf.yield %8617 : i64
      } else {
        scf.yield %8660 : i64
      }
      %8666 = func.call @cc_errorp(%8629) : (i64) -> i64
      %8667 = arith.cmpi ne, %8666, %8630 : i64
      %8668 = arith.cmpi eq, %8665, %8630 : i64
      %8669 = arith.andi %8667, %8668 : i1
      %8670 = scf.if %8669 -> (i64) {
        scf.yield %8629 : i64
      } else {
        scf.yield %8665 : i64
      }
      %8671 = arith.cmpi ne, %8670, %8630 : i64
      scf.if %8671 {
        func.call @stack_push_pointer(%8670) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8061) : (i64) -> ()
        func.call @stack_push_pointer(%8361) : (i64) -> ()
        func.call @stack_push_pointer(%8587) : (i64) -> ()
        func.call @stack_push_pointer(%8599) : (i64) -> ()
        func.call @stack_push_pointer(%8606) : (i64) -> ()
        func.call @stack_push_pointer(%8610) : (i64) -> ()
        func.call @stack_push_pointer(%8617) : (i64) -> ()
        func.call @stack_push_pointer(%8629) : (i64) -> ()
        %8672 = llvm.mlir.addressof @str731 : !llvm.ptr
        %8673 = func.call @cc_make_function_ref_const(%8672) : (!llvm.ptr) -> i64
        %8674 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8673, %8674) : (i64, i64) -> ()
      }
      %8675 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8675 : i64
    }
    %8676 = func.call @cc_nil_value() : () -> i64
    %8677 = func.call @cc_errorp(%8052) : (i64) -> i64
    %8678 = arith.cmpi ne, %8677, %8676 : i64
    %8679 = scf.if %8678 -> (i64) {
      scf.yield %8052 : i64
    } else {
      %8680 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8681 = arith.constant 19 : i64
      %8682 = func.call @cc_make_string(%8680, %8681) : (!llvm.ptr, i64) -> i64
      %8683 = func.call @cc_nil_value() : () -> i64
      %8684 = func.call @cc_intern(%8682, %8683) : (i64, i64) -> i64
      %8685 = func.call @cc_nil_value() : () -> i64
      %8686 = func.call @cc_cons(%8684, %8685) : (i64, i64) -> i64
      %8687 = func.call @cc_values_pack(%8686) : (i64) -> i64
      %__rlasp_stack_elide_zero_405 = arith.constant 0 : i64
      %8688 = arith.addi %8684, %__rlasp_stack_elide_zero_405 : i64
      %8689 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8690 = arith.constant 3 : i64
      %8691 = func.call @cc_make_string(%8689, %8690) : (!llvm.ptr, i64) -> i64
      %8692 = func.call @cc_nil_value() : () -> i64
      %8693 = func.call @cc_intern(%8691, %8692) : (i64, i64) -> i64
      %8694 = func.call @cc_nil_value() : () -> i64
      %8695 = func.call @cc_cons(%8693, %8694) : (i64, i64) -> i64
      %8696 = func.call @cc_values_pack(%8695) : (i64) -> i64
      func.call @stack_push_pointer(%8693) : (i64) -> ()
      %8697 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8698 = arith.constant 3 : i64
      %8699 = func.call @cc_make_string(%8697, %8698) : (!llvm.ptr, i64) -> i64
      %8700 = func.call @cc_nil_value() : () -> i64
      %8701 = func.call @cc_intern(%8699, %8700) : (i64, i64) -> i64
      %8702 = func.call @cc_nil_value() : () -> i64
      %8703 = func.call @cc_cons(%8701, %8702) : (i64, i64) -> i64
      %8704 = func.call @cc_values_pack(%8703) : (i64) -> i64
      func.call @stack_push_pointer(%8701) : (i64) -> ()
      %8705 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8706 = arith.constant 5 : i64
      %8707 = func.call @cc_make_string(%8705, %8706) : (!llvm.ptr, i64) -> i64
      %8708 = func.call @cc_nil_value() : () -> i64
      %8709 = func.call @cc_intern(%8707, %8708) : (i64, i64) -> i64
      %8710 = func.call @cc_nil_value() : () -> i64
      %8711 = func.call @cc_cons(%8709, %8710) : (i64, i64) -> i64
      %8712 = func.call @cc_values_pack(%8711) : (i64) -> i64
      func.call @stack_push_pointer(%8709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8713 = llvm.mlir.addressof @str736 : !llvm.ptr
      %8714 = arith.constant 20 : i64
      %8715 = func.call @cc_make_string(%8713, %8714) : (!llvm.ptr, i64) -> i64
      %8716 = llvm.mlir.addressof @str737 : !llvm.ptr
      %8717 = arith.constant 11 : i64
      %8718 = func.call @cc_make_string(%8716, %8717) : (!llvm.ptr, i64) -> i64
      %8719 = func.call @cc_intern(%8715, %8718) : (i64, i64) -> i64
      %8720 = func.call @cc_nil_value() : () -> i64
      %8721 = func.call @cc_cons(%8719, %8720) : (i64, i64) -> i64
      %8722 = func.call @cc_values_pack(%8721) : (i64) -> i64
      func.call @stack_push_pointer(%8719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8723 = llvm.mlir.addressof @str738 : !llvm.ptr
      %8724 = arith.constant 32 : i64
      %8725 = func.call @cc_make_string(%8723, %8724) : (!llvm.ptr, i64) -> i64
      %8726 = func.call @cc_nil_value() : () -> i64
      %8727 = func.call @cc_intern(%8725, %8726) : (i64, i64) -> i64
      %8728 = func.call @cc_nil_value() : () -> i64
      %8729 = func.call @cc_cons(%8727, %8728) : (i64, i64) -> i64
      %8730 = func.call @cc_values_pack(%8729) : (i64) -> i64
      func.call @stack_push_pointer(%8727) : (i64) -> ()
      %8731 = llvm.mlir.addressof @str739 : !llvm.ptr
      %8732 = arith.constant 6 : i64
      %8733 = func.call @cc_make_string(%8731, %8732) : (!llvm.ptr, i64) -> i64
      %8734 = func.call @cc_nil_value() : () -> i64
      %8735 = func.call @cc_intern(%8733, %8734) : (i64, i64) -> i64
      %8736 = func.call @cc_nil_value() : () -> i64
      %8737 = func.call @cc_cons(%8735, %8736) : (i64, i64) -> i64
      %8738 = func.call @cc_values_pack(%8737) : (i64) -> i64
      func.call @stack_push_pointer(%8735) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8739 = llvm.mlir.addressof @str740 : !llvm.ptr
      %8740 = arith.constant 10 : i64
      %8741 = func.call @cc_make_string(%8739, %8740) : (!llvm.ptr, i64) -> i64
      %8742 = llvm.mlir.addressof @str741 : !llvm.ptr
      %8743 = arith.constant 11 : i64
      %8744 = func.call @cc_make_string(%8742, %8743) : (!llvm.ptr, i64) -> i64
      %8745 = func.call @cc_intern(%8741, %8744) : (i64, i64) -> i64
      %8746 = func.call @cc_nil_value() : () -> i64
      %8747 = func.call @cc_cons(%8745, %8746) : (i64, i64) -> i64
      %8748 = func.call @cc_values_pack(%8747) : (i64) -> i64
      func.call @stack_push_pointer(%8745) : (i64) -> ()
      %8749 = llvm.mlir.addressof @str742 : !llvm.ptr
      %8750 = arith.constant 5 : i64
      %8751 = func.call @cc_make_string(%8749, %8750) : (!llvm.ptr, i64) -> i64
      %8752 = func.call @cc_nil_value() : () -> i64
      %8753 = func.call @cc_intern(%8751, %8752) : (i64, i64) -> i64
      %8754 = func.call @cc_nil_value() : () -> i64
      %8755 = func.call @cc_cons(%8753, %8754) : (i64, i64) -> i64
      %8756 = func.call @cc_values_pack(%8755) : (i64) -> i64
      func.call @stack_push_pointer(%8753) : (i64) -> ()
      %8757 = llvm.mlir.addressof @str743 : !llvm.ptr
      %8758 = arith.constant 9 : i64
      %8759 = func.call @cc_make_string(%8757, %8758) : (!llvm.ptr, i64) -> i64
      %8760 = llvm.mlir.addressof @str744 : !llvm.ptr
      %8761 = arith.constant 7 : i64
      %8762 = func.call @cc_make_string(%8760, %8761) : (!llvm.ptr, i64) -> i64
      %8763 = func.call @cc_intern(%8759, %8762) : (i64, i64) -> i64
      %8764 = func.call @cc_nil_value() : () -> i64
      %8765 = func.call @cc_cons(%8763, %8764) : (i64, i64) -> i64
      %8766 = func.call @cc_values_pack(%8765) : (i64) -> i64
      func.call @stack_push_pointer(%8763) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8767 = func.call @stack_pop_pointer() : () -> i64
      %8768 = func.call @stack_pop_pointer() : () -> i64
      %8769 = func.call @cc_cons(%8768, %8767) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_406 = arith.constant 0 : i64
      %8770 = arith.addi %8769, %__rlasp_stack_elide_zero_406 : i64
      %8771 = func.call @stack_pop_pointer() : () -> i64
      %8772 = func.call @cc_cons(%8771, %8770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_407 = arith.constant 0 : i64
      %8773 = arith.addi %8772, %__rlasp_stack_elide_zero_407 : i64
      %8774 = func.call @stack_pop_pointer() : () -> i64
      %8775 = func.call @cc_cons(%8774, %8773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8775) : (i64) -> ()
      %8776 = llvm.mlir.addressof @str745 : !llvm.ptr
      %8777 = arith.constant 9 : i64
      %8778 = func.call @cc_make_string(%8776, %8777) : (!llvm.ptr, i64) -> i64
      %8779 = llvm.mlir.addressof @str746 : !llvm.ptr
      %8780 = arith.constant 11 : i64
      %8781 = func.call @cc_make_string(%8779, %8780) : (!llvm.ptr, i64) -> i64
      %8782 = func.call @cc_intern(%8778, %8781) : (i64, i64) -> i64
      %8783 = func.call @cc_nil_value() : () -> i64
      %8784 = func.call @cc_cons(%8782, %8783) : (i64, i64) -> i64
      %8785 = func.call @cc_values_pack(%8784) : (i64) -> i64
      func.call @stack_push_pointer(%8782) : (i64) -> ()
      %8786 = llvm.mlir.addressof @str747 : !llvm.ptr
      %8787 = arith.constant 6 : i64
      %8788 = func.call @cc_make_string(%8786, %8787) : (!llvm.ptr, i64) -> i64
      %8789 = func.call @cc_nil_value() : () -> i64
      %8790 = func.call @cc_intern(%8788, %8789) : (i64, i64) -> i64
      %8791 = func.call @cc_nil_value() : () -> i64
      %8792 = func.call @cc_cons(%8790, %8791) : (i64, i64) -> i64
      %8793 = func.call @cc_values_pack(%8792) : (i64) -> i64
      func.call @stack_push_pointer(%8790) : (i64) -> ()
      %8794 = llvm.mlir.addressof @str748 : !llvm.ptr
      %8795 = arith.constant 5 : i64
      %8796 = func.call @cc_make_string(%8794, %8795) : (!llvm.ptr, i64) -> i64
      %8797 = func.call @cc_nil_value() : () -> i64
      %8798 = func.call @cc_intern(%8796, %8797) : (i64, i64) -> i64
      %8799 = func.call @cc_nil_value() : () -> i64
      %8800 = func.call @cc_cons(%8798, %8799) : (i64, i64) -> i64
      %8801 = func.call @cc_values_pack(%8800) : (i64) -> i64
      func.call @stack_push_pointer(%8798) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8802 = func.call @stack_pop_pointer() : () -> i64
      %8803 = func.call @stack_pop_pointer() : () -> i64
      %8804 = func.call @cc_cons(%8803, %8802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8804) : (i64) -> ()
      %8805 = llvm.mlir.addressof @str749 : !llvm.ptr
      %8806 = arith.constant 2 : i64
      %8807 = func.call @cc_make_string(%8805, %8806) : (!llvm.ptr, i64) -> i64
      %8808 = func.call @cc_nil_value() : () -> i64
      %8809 = func.call @cc_intern(%8807, %8808) : (i64, i64) -> i64
      %8810 = func.call @cc_nil_value() : () -> i64
      %8811 = func.call @cc_cons(%8809, %8810) : (i64, i64) -> i64
      %8812 = func.call @cc_values_pack(%8811) : (i64) -> i64
      func.call @stack_push_pointer(%8809) : (i64) -> ()
      %8813 = llvm.mlir.addressof @str750 : !llvm.ptr
      %8814 = arith.constant 2 : i64
      %8815 = func.call @cc_make_string(%8813, %8814) : (!llvm.ptr, i64) -> i64
      %8816 = llvm.mlir.addressof @str751 : !llvm.ptr
      %8817 = arith.constant 11 : i64
      %8818 = func.call @cc_make_string(%8816, %8817) : (!llvm.ptr, i64) -> i64
      %8819 = func.call @cc_intern(%8815, %8818) : (i64, i64) -> i64
      %8820 = func.call @cc_nil_value() : () -> i64
      %8821 = func.call @cc_cons(%8819, %8820) : (i64, i64) -> i64
      %8822 = func.call @cc_values_pack(%8821) : (i64) -> i64
      func.call @stack_push_pointer(%8819) : (i64) -> ()
      %8823 = llvm.mlir.addressof @str752 : !llvm.ptr
      %8824 = arith.constant 19 : i64
      %8825 = func.call @cc_make_string(%8823, %8824) : (!llvm.ptr, i64) -> i64
      %8826 = llvm.mlir.addressof @str753 : !llvm.ptr
      %8827 = arith.constant 11 : i64
      %8828 = func.call @cc_make_string(%8826, %8827) : (!llvm.ptr, i64) -> i64
      %8829 = func.call @cc_intern(%8825, %8828) : (i64, i64) -> i64
      %8830 = func.call @cc_nil_value() : () -> i64
      %8831 = func.call @cc_cons(%8829, %8830) : (i64, i64) -> i64
      %8832 = func.call @cc_values_pack(%8831) : (i64) -> i64
      func.call @stack_push_pointer(%8829) : (i64) -> ()
      %8833 = llvm.mlir.addressof @str754 : !llvm.ptr
      %8834 = arith.constant 5 : i64
      %8835 = func.call @cc_make_string(%8833, %8834) : (!llvm.ptr, i64) -> i64
      %8836 = func.call @cc_nil_value() : () -> i64
      %8837 = func.call @cc_intern(%8835, %8836) : (i64, i64) -> i64
      %8838 = func.call @cc_nil_value() : () -> i64
      %8839 = func.call @cc_cons(%8837, %8838) : (i64, i64) -> i64
      %8840 = func.call @cc_values_pack(%8839) : (i64) -> i64
      func.call @stack_push_pointer(%8837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8841 = func.call @stack_pop_pointer() : () -> i64
      %8842 = func.call @stack_pop_pointer() : () -> i64
      %8843 = func.call @cc_cons(%8842, %8841) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_408 = arith.constant 0 : i64
      %8844 = arith.addi %8843, %__rlasp_stack_elide_zero_408 : i64
      %8845 = func.call @stack_pop_pointer() : () -> i64
      %8846 = func.call @cc_cons(%8845, %8844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8846) : (i64) -> ()
      %8847 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8847) : (i64) -> ()
      %8848 = llvm.mlir.addressof @str755 : !llvm.ptr
      %8849 = arith.constant 32 : i64
      %8850 = func.call @cc_make_string(%8848, %8849) : (!llvm.ptr, i64) -> i64
      %8851 = func.call @cc_nil_value() : () -> i64
      %8852 = func.call @cc_intern(%8850, %8851) : (i64, i64) -> i64
      %8853 = func.call @cc_nil_value() : () -> i64
      %8854 = func.call @cc_cons(%8852, %8853) : (i64, i64) -> i64
      %8855 = func.call @cc_values_pack(%8854) : (i64) -> i64
      %__rlasp_stack_elide_zero_409 = arith.constant 0 : i64
      %8856 = arith.addi %8852, %__rlasp_stack_elide_zero_409 : i64
      %8857 = func.call @stack_pop_pointer() : () -> i64
      %8858 = func.call @cc_cons(%8856, %8857) : (i64, i64) -> i64
      %8859 = llvm.mlir.addressof @str756 : !llvm.ptr
      %8860 = arith.constant 5 : i64
      %8861 = func.call @cc_make_string(%8859, %8860) : (!llvm.ptr, i64) -> i64
      %8862 = func.call @cc_nil_value() : () -> i64
      %8863 = func.call @cc_intern(%8861, %8862) : (i64, i64) -> i64
      %8864 = func.call @cc_nil_value() : () -> i64
      %8865 = func.call @cc_cons(%8863, %8864) : (i64, i64) -> i64
      %8866 = func.call @cc_values_pack(%8865) : (i64) -> i64
      %8867 = func.call @cc_cons(%8863, %8858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8868 = func.call @stack_pop_pointer() : () -> i64
      %8869 = func.call @stack_pop_pointer() : () -> i64
      %8870 = func.call @cc_cons(%8869, %8868) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_410 = arith.constant 0 : i64
      %8871 = arith.addi %8870, %__rlasp_stack_elide_zero_410 : i64
      %8872 = func.call @stack_pop_pointer() : () -> i64
      %8873 = func.call @cc_cons(%8872, %8871) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_411 = arith.constant 0 : i64
      %8874 = arith.addi %8873, %__rlasp_stack_elide_zero_411 : i64
      %8875 = func.call @stack_pop_pointer() : () -> i64
      %8876 = func.call @cc_cons(%8875, %8874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8876) : (i64) -> ()
      %8877 = llvm.mlir.addressof @str757 : !llvm.ptr
      %8878 = arith.constant 5 : i64
      %8879 = func.call @cc_make_string(%8877, %8878) : (!llvm.ptr, i64) -> i64
      %8880 = func.call @cc_nil_value() : () -> i64
      %8881 = func.call @cc_intern(%8879, %8880) : (i64, i64) -> i64
      %8882 = func.call @cc_nil_value() : () -> i64
      %8883 = func.call @cc_cons(%8881, %8882) : (i64, i64) -> i64
      %8884 = func.call @cc_values_pack(%8883) : (i64) -> i64
      func.call @stack_push_pointer(%8881) : (i64) -> ()
      %8885 = llvm.mlir.addressof @str758 : !llvm.ptr
      %8886 = arith.constant 11 : i64
      %8887 = func.call @cc_make_string(%8885, %8886) : (!llvm.ptr, i64) -> i64
      %8888 = func.call @cc_nil_value() : () -> i64
      %8889 = func.call @cc_intern(%8887, %8888) : (i64, i64) -> i64
      %8890 = func.call @cc_nil_value() : () -> i64
      %8891 = func.call @cc_cons(%8889, %8890) : (i64, i64) -> i64
      %8892 = func.call @cc_values_pack(%8891) : (i64) -> i64
      func.call @stack_push_pointer(%8889) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8893 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%8893) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8894 = func.call @stack_pop_pointer() : () -> i64
      %8895 = func.call @stack_pop_pointer() : () -> i64
      %8896 = func.call @cc_cons(%8895, %8894) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_412 = arith.constant 0 : i64
      %8897 = arith.addi %8896, %__rlasp_stack_elide_zero_412 : i64
      %8898 = func.call @stack_pop_pointer() : () -> i64
      %8899 = func.call @cc_cons(%8898, %8897) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_413 = arith.constant 0 : i64
      %8900 = arith.addi %8899, %__rlasp_stack_elide_zero_413 : i64
      %8901 = func.call @stack_pop_pointer() : () -> i64
      %8902 = func.call @cc_cons(%8901, %8900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8902) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8903 = func.call @stack_pop_pointer() : () -> i64
      %8904 = func.call @stack_pop_pointer() : () -> i64
      %8905 = func.call @cc_cons(%8904, %8903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_414 = arith.constant 0 : i64
      %8906 = arith.addi %8905, %__rlasp_stack_elide_zero_414 : i64
      %8907 = func.call @stack_pop_pointer() : () -> i64
      %8908 = func.call @cc_cons(%8907, %8906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8908) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8909 = func.call @stack_pop_pointer() : () -> i64
      %8910 = func.call @stack_pop_pointer() : () -> i64
      %8911 = func.call @cc_cons(%8910, %8909) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_415 = arith.constant 0 : i64
      %8912 = arith.addi %8911, %__rlasp_stack_elide_zero_415 : i64
      %8913 = func.call @stack_pop_pointer() : () -> i64
      %8914 = func.call @cc_cons(%8913, %8912) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_416 = arith.constant 0 : i64
      %8915 = arith.addi %8914, %__rlasp_stack_elide_zero_416 : i64
      %8916 = func.call @stack_pop_pointer() : () -> i64
      %8917 = func.call @cc_cons(%8916, %8915) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_417 = arith.constant 0 : i64
      %8918 = arith.addi %8917, %__rlasp_stack_elide_zero_417 : i64
      %8919 = func.call @stack_pop_pointer() : () -> i64
      %8920 = func.call @cc_cons(%8919, %8918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8920) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8921 = func.call @stack_pop_pointer() : () -> i64
      %8922 = func.call @stack_pop_pointer() : () -> i64
      %8923 = func.call @cc_cons(%8922, %8921) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_418 = arith.constant 0 : i64
      %8924 = arith.addi %8923, %__rlasp_stack_elide_zero_418 : i64
      %8925 = func.call @stack_pop_pointer() : () -> i64
      %8926 = func.call @cc_cons(%8925, %8924) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_419 = arith.constant 0 : i64
      %8927 = arith.addi %8926, %__rlasp_stack_elide_zero_419 : i64
      %8928 = func.call @stack_pop_pointer() : () -> i64
      %8929 = func.call @cc_cons(%8928, %8927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8929) : (i64) -> ()
      %8930 = llvm.mlir.addressof @str759 : !llvm.ptr
      %8931 = arith.constant 5 : i64
      %8932 = func.call @cc_make_string(%8930, %8931) : (!llvm.ptr, i64) -> i64
      %8933 = func.call @cc_nil_value() : () -> i64
      %8934 = func.call @cc_intern(%8932, %8933) : (i64, i64) -> i64
      %8935 = func.call @cc_nil_value() : () -> i64
      %8936 = func.call @cc_cons(%8934, %8935) : (i64, i64) -> i64
      %8937 = func.call @cc_values_pack(%8936) : (i64) -> i64
      func.call @stack_push_pointer(%8934) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8938 = func.call @stack_pop_pointer() : () -> i64
      %8939 = func.call @stack_pop_pointer() : () -> i64
      %8940 = func.call @cc_cons(%8939, %8938) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_420 = arith.constant 0 : i64
      %8941 = arith.addi %8940, %__rlasp_stack_elide_zero_420 : i64
      %8942 = func.call @stack_pop_pointer() : () -> i64
      %8943 = func.call @cc_cons(%8942, %8941) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_421 = arith.constant 0 : i64
      %8944 = arith.addi %8943, %__rlasp_stack_elide_zero_421 : i64
      %8945 = func.call @stack_pop_pointer() : () -> i64
      %8946 = func.call @cc_cons(%8945, %8944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8946) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8947 = func.call @stack_pop_pointer() : () -> i64
      %8948 = func.call @stack_pop_pointer() : () -> i64
      %8949 = func.call @cc_cons(%8948, %8947) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_422 = arith.constant 0 : i64
      %8950 = arith.addi %8949, %__rlasp_stack_elide_zero_422 : i64
      %8951 = func.call @stack_pop_pointer() : () -> i64
      %8952 = func.call @cc_cons(%8951, %8950) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_423 = arith.constant 0 : i64
      %8953 = arith.addi %8952, %__rlasp_stack_elide_zero_423 : i64
      %8954 = func.call @stack_pop_pointer() : () -> i64
      %8955 = func.call @cc_cons(%8954, %8953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8956 = func.call @stack_pop_pointer() : () -> i64
      %8957 = func.call @stack_pop_pointer() : () -> i64
      %8958 = func.call @cc_cons(%8957, %8956) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_424 = arith.constant 0 : i64
      %8959 = arith.addi %8958, %__rlasp_stack_elide_zero_424 : i64
      %8960 = func.call @stack_pop_pointer() : () -> i64
      %8961 = func.call @cc_cons(%8960, %8959) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_425 = arith.constant 0 : i64
      %8962 = arith.addi %8961, %__rlasp_stack_elide_zero_425 : i64
      %8963 = func.call @stack_pop_pointer() : () -> i64
      %8964 = func.call @cc_cons(%8963, %8962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8964) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8965 = func.call @stack_pop_pointer() : () -> i64
      %8966 = func.call @stack_pop_pointer() : () -> i64
      %8967 = func.call @cc_cons(%8966, %8965) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_426 = arith.constant 0 : i64
      %8968 = arith.addi %8967, %__rlasp_stack_elide_zero_426 : i64
      %8969 = func.call @stack_pop_pointer() : () -> i64
      %8970 = func.call @cc_cons(%8969, %8968) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_427 = arith.constant 0 : i64
      %8971 = arith.addi %8970, %__rlasp_stack_elide_zero_427 : i64
      %8972 = func.call @stack_pop_pointer() : () -> i64
      %8973 = func.call @cc_cons(%8972, %8971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8973) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8974 = func.call @stack_pop_pointer() : () -> i64
      %8975 = func.call @stack_pop_pointer() : () -> i64
      %8976 = func.call @cc_cons(%8975, %8974) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_428 = arith.constant 0 : i64
      %8977 = arith.addi %8976, %__rlasp_stack_elide_zero_428 : i64
      %8978 = func.call @stack_pop_pointer() : () -> i64
      %8979 = func.call @cc_cons(%8978, %8977) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_429 = arith.constant 0 : i64
      %8980 = arith.addi %8979, %__rlasp_stack_elide_zero_429 : i64
      %8981 = func.call @stack_pop_pointer() : () -> i64
      %8982 = func.call @cc_cons(%8981, %8980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8982) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8983 = func.call @stack_pop_pointer() : () -> i64
      %8984 = func.call @stack_pop_pointer() : () -> i64
      %8985 = func.call @cc_cons(%8984, %8983) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_430 = arith.constant 0 : i64
      %8986 = arith.addi %8985, %__rlasp_stack_elide_zero_430 : i64
      %8987 = func.call @stack_pop_pointer() : () -> i64
      %8988 = func.call @cc_cons(%8987, %8986) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_431 = arith.constant 0 : i64
      %8989 = arith.addi %8988, %__rlasp_stack_elide_zero_431 : i64
      %8990 = func.call @stack_pop_pointer() : () -> i64
      %8991 = func.call @cc_cons(%8990, %8989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8992 = func.call @stack_pop_pointer() : () -> i64
      %8993 = func.call @stack_pop_pointer() : () -> i64
      %8994 = func.call @cc_cons(%8993, %8992) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_432 = arith.constant 0 : i64
      %8995 = arith.addi %8994, %__rlasp_stack_elide_zero_432 : i64
      %8996 = func.call @stack_pop_pointer() : () -> i64
      %8997 = func.call @cc_cons(%8996, %8995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8998 = func.call @stack_pop_pointer() : () -> i64
      %8999 = func.call @stack_pop_pointer() : () -> i64
      %9000 = func.call @cc_cons(%8999, %8998) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_433 = arith.constant 0 : i64
      %9001 = arith.addi %9000, %__rlasp_stack_elide_zero_433 : i64
      %9002 = func.call @stack_pop_pointer() : () -> i64
      %9003 = func.call @cc_cons(%9002, %9001) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_434 = arith.constant 0 : i64
      %9004 = arith.addi %9003, %__rlasp_stack_elide_zero_434 : i64
      %9224 = llvm.mlir.addressof @str774 : !llvm.ptr
      %9225 = arith.constant 33 : i64
      %9226 = func.call @cc_make_symbol(%9224, %9225) : (!llvm.ptr, i64) -> i64
      %9227 = func.call @cc_persistent_root_value(%9226) : (i64) -> i64
      func.call @stack_push_pointer(%9227) : (i64) -> ()
      %9228 = arith.constant 97047688511564 : i64
      %9229 = arith.constant 1 : i64
      %9230 = func.call @cc_make_closure(%9228, %9229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_435 = arith.constant 0 : i64
      %9231 = arith.addi %9230, %__rlasp_stack_elide_zero_435 : i64
      %9232 = llvm.mlir.addressof @str775 : !llvm.ptr
      %9233 = arith.constant 1 : i64
      %9234 = func.call @cc_make_string(%9232, %9233) : (!llvm.ptr, i64) -> i64
      %9235 = func.call @cc_nil_value() : () -> i64
      %9236 = func.call @cc_intern(%9234, %9235) : (i64, i64) -> i64
      %9237 = func.call @cc_nil_value() : () -> i64
      %9238 = func.call @cc_cons(%9236, %9237) : (i64, i64) -> i64
      %9239 = func.call @cc_values_pack(%9238) : (i64) -> i64
      func.call @stack_push_pointer(%9236) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9240 = func.call @stack_pop_pointer() : () -> i64
      %9241 = func.call @stack_pop_pointer() : () -> i64
      %9242 = func.call @cc_cons(%9241, %9240) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_436 = arith.constant 0 : i64
      %9243 = arith.addi %9242, %__rlasp_stack_elide_zero_436 : i64
      %9244 = llvm.mlir.addressof @str776 : !llvm.ptr
      %9245 = arith.constant 11 : i64
      %9246 = func.call @cc_make_string(%9244, %9245) : (!llvm.ptr, i64) -> i64
      %9247 = llvm.mlir.addressof @str777 : !llvm.ptr
      %9248 = arith.constant 7 : i64
      %9249 = func.call @cc_make_string(%9247, %9248) : (!llvm.ptr, i64) -> i64
      %9250 = func.call @cc_intern(%9246, %9249) : (i64, i64) -> i64
      %9251 = func.call @cc_nil_value() : () -> i64
      %9252 = func.call @cc_cons(%9250, %9251) : (i64, i64) -> i64
      %9253 = func.call @cc_values_pack(%9252) : (i64) -> i64
      %9254 = func.call @cc_nil_value() : () -> i64
      %9255 = llvm.mlir.addressof @str778 : !llvm.ptr
      %9256 = arith.constant 4 : i64
      %9257 = func.call @cc_make_string(%9255, %9256) : (!llvm.ptr, i64) -> i64
      %9258 = llvm.mlir.addressof @str779 : !llvm.ptr
      %9259 = arith.constant 7 : i64
      %9260 = func.call @cc_make_string(%9258, %9259) : (!llvm.ptr, i64) -> i64
      %9261 = func.call @cc_intern(%9257, %9260) : (i64, i64) -> i64
      %9262 = func.call @cc_nil_value() : () -> i64
      %9263 = func.call @cc_cons(%9261, %9262) : (i64, i64) -> i64
      %9264 = func.call @cc_values_pack(%9263) : (i64) -> i64
      %9265 = llvm.mlir.addressof @str780 : !llvm.ptr
      %9266 = arith.constant 6 : i64
      %9267 = func.call @cc_make_string(%9265, %9266) : (!llvm.ptr, i64) -> i64
      %9268 = func.call @cc_nil_value() : () -> i64
      %9269 = func.call @cc_intern(%9267, %9268) : (i64, i64) -> i64
      %9270 = func.call @cc_nil_value() : () -> i64
      %9271 = func.call @cc_cons(%9269, %9270) : (i64, i64) -> i64
      %9272 = func.call @cc_values_pack(%9271) : (i64) -> i64
      %__rlasp_stack_elide_zero_437 = arith.constant 0 : i64
      %9273 = arith.addi %9269, %__rlasp_stack_elide_zero_437 : i64
      %9274 = func.call @cc_nil_value() : () -> i64
      %9275 = func.call @cc_errorp(%8688) : (i64) -> i64
      %9276 = arith.cmpi ne, %9275, %9274 : i64
      %9277 = arith.cmpi eq, %9274, %9274 : i64
      %9278 = arith.andi %9276, %9277 : i1
      %9279 = scf.if %9278 -> (i64) {
        scf.yield %8688 : i64
      } else {
        scf.yield %9274 : i64
      }
      %9280 = func.call @cc_errorp(%9004) : (i64) -> i64
      %9281 = arith.cmpi ne, %9280, %9274 : i64
      %9282 = arith.cmpi eq, %9279, %9274 : i64
      %9283 = arith.andi %9281, %9282 : i1
      %9284 = scf.if %9283 -> (i64) {
        scf.yield %9004 : i64
      } else {
        scf.yield %9279 : i64
      }
      %9285 = func.call @cc_errorp(%9231) : (i64) -> i64
      %9286 = arith.cmpi ne, %9285, %9274 : i64
      %9287 = arith.cmpi eq, %9284, %9274 : i64
      %9288 = arith.andi %9286, %9287 : i1
      %9289 = scf.if %9288 -> (i64) {
        scf.yield %9231 : i64
      } else {
        scf.yield %9284 : i64
      }
      %9290 = func.call @cc_errorp(%9243) : (i64) -> i64
      %9291 = arith.cmpi ne, %9290, %9274 : i64
      %9292 = arith.cmpi eq, %9289, %9274 : i64
      %9293 = arith.andi %9291, %9292 : i1
      %9294 = scf.if %9293 -> (i64) {
        scf.yield %9243 : i64
      } else {
        scf.yield %9289 : i64
      }
      %9295 = func.call @cc_errorp(%9250) : (i64) -> i64
      %9296 = arith.cmpi ne, %9295, %9274 : i64
      %9297 = arith.cmpi eq, %9294, %9274 : i64
      %9298 = arith.andi %9296, %9297 : i1
      %9299 = scf.if %9298 -> (i64) {
        scf.yield %9250 : i64
      } else {
        scf.yield %9294 : i64
      }
      %9300 = func.call @cc_errorp(%9254) : (i64) -> i64
      %9301 = arith.cmpi ne, %9300, %9274 : i64
      %9302 = arith.cmpi eq, %9299, %9274 : i64
      %9303 = arith.andi %9301, %9302 : i1
      %9304 = scf.if %9303 -> (i64) {
        scf.yield %9254 : i64
      } else {
        scf.yield %9299 : i64
      }
      %9305 = func.call @cc_errorp(%9261) : (i64) -> i64
      %9306 = arith.cmpi ne, %9305, %9274 : i64
      %9307 = arith.cmpi eq, %9304, %9274 : i64
      %9308 = arith.andi %9306, %9307 : i1
      %9309 = scf.if %9308 -> (i64) {
        scf.yield %9261 : i64
      } else {
        scf.yield %9304 : i64
      }
      %9310 = func.call @cc_errorp(%9273) : (i64) -> i64
      %9311 = arith.cmpi ne, %9310, %9274 : i64
      %9312 = arith.cmpi eq, %9309, %9274 : i64
      %9313 = arith.andi %9311, %9312 : i1
      %9314 = scf.if %9313 -> (i64) {
        scf.yield %9273 : i64
      } else {
        scf.yield %9309 : i64
      }
      %9315 = arith.cmpi ne, %9314, %9274 : i64
      scf.if %9315 {
        func.call @stack_push_pointer(%9314) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8688) : (i64) -> ()
        func.call @stack_push_pointer(%9004) : (i64) -> ()
        func.call @stack_push_pointer(%9231) : (i64) -> ()
        func.call @stack_push_pointer(%9243) : (i64) -> ()
        func.call @stack_push_pointer(%9250) : (i64) -> ()
        func.call @stack_push_pointer(%9254) : (i64) -> ()
        func.call @stack_push_pointer(%9261) : (i64) -> ()
        func.call @stack_push_pointer(%9273) : (i64) -> ()
        %9316 = llvm.mlir.addressof @str781 : !llvm.ptr
        %9317 = func.call @cc_make_function_ref_const(%9316) : (!llvm.ptr) -> i64
        %9318 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9317, %9318) : (i64, i64) -> ()
      }
      %9319 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9319 : i64
    }
    %9320 = func.call @cc_nil_value() : () -> i64
    %9321 = func.call @cc_errorp(%8679) : (i64) -> i64
    %9322 = arith.cmpi ne, %9321, %9320 : i64
    %9323 = scf.if %9322 -> (i64) {
      scf.yield %8679 : i64
    } else {
      %9324 = llvm.mlir.addressof @str782 : !llvm.ptr
      %9325 = arith.constant 19 : i64
      %9326 = func.call @cc_make_string(%9324, %9325) : (!llvm.ptr, i64) -> i64
      %9327 = func.call @cc_nil_value() : () -> i64
      %9328 = func.call @cc_intern(%9326, %9327) : (i64, i64) -> i64
      %9329 = func.call @cc_nil_value() : () -> i64
      %9330 = func.call @cc_cons(%9328, %9329) : (i64, i64) -> i64
      %9331 = func.call @cc_values_pack(%9330) : (i64) -> i64
      %__rlasp_stack_elide_zero_438 = arith.constant 0 : i64
      %9332 = arith.addi %9328, %__rlasp_stack_elide_zero_438 : i64
      %9333 = llvm.mlir.addressof @str783 : !llvm.ptr
      %9334 = arith.constant 3 : i64
      %9335 = func.call @cc_make_string(%9333, %9334) : (!llvm.ptr, i64) -> i64
      %9336 = func.call @cc_nil_value() : () -> i64
      %9337 = func.call @cc_intern(%9335, %9336) : (i64, i64) -> i64
      %9338 = func.call @cc_nil_value() : () -> i64
      %9339 = func.call @cc_cons(%9337, %9338) : (i64, i64) -> i64
      %9340 = func.call @cc_values_pack(%9339) : (i64) -> i64
      func.call @stack_push_pointer(%9337) : (i64) -> ()
      %9341 = llvm.mlir.addressof @str784 : !llvm.ptr
      %9342 = arith.constant 3 : i64
      %9343 = func.call @cc_make_string(%9341, %9342) : (!llvm.ptr, i64) -> i64
      %9344 = func.call @cc_nil_value() : () -> i64
      %9345 = func.call @cc_intern(%9343, %9344) : (i64, i64) -> i64
      %9346 = func.call @cc_nil_value() : () -> i64
      %9347 = func.call @cc_cons(%9345, %9346) : (i64, i64) -> i64
      %9348 = func.call @cc_values_pack(%9347) : (i64) -> i64
      func.call @stack_push_pointer(%9345) : (i64) -> ()
      %9349 = llvm.mlir.addressof @str785 : !llvm.ptr
      %9350 = arith.constant 5 : i64
      %9351 = func.call @cc_make_string(%9349, %9350) : (!llvm.ptr, i64) -> i64
      %9352 = func.call @cc_nil_value() : () -> i64
      %9353 = func.call @cc_intern(%9351, %9352) : (i64, i64) -> i64
      %9354 = func.call @cc_nil_value() : () -> i64
      %9355 = func.call @cc_cons(%9353, %9354) : (i64, i64) -> i64
      %9356 = func.call @cc_values_pack(%9355) : (i64) -> i64
      func.call @stack_push_pointer(%9353) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9357 = llvm.mlir.addressof @str786 : !llvm.ptr
      %9358 = arith.constant 32 : i64
      %9359 = func.call @cc_make_string(%9357, %9358) : (!llvm.ptr, i64) -> i64
      %9360 = func.call @cc_nil_value() : () -> i64
      %9361 = func.call @cc_intern(%9359, %9360) : (i64, i64) -> i64
      %9362 = func.call @cc_nil_value() : () -> i64
      %9363 = func.call @cc_cons(%9361, %9362) : (i64, i64) -> i64
      %9364 = func.call @cc_values_pack(%9363) : (i64) -> i64
      func.call @stack_push_pointer(%9361) : (i64) -> ()
      %9365 = llvm.mlir.addressof @str787 : !llvm.ptr
      %9366 = arith.constant 6 : i64
      %9367 = func.call @cc_make_string(%9365, %9366) : (!llvm.ptr, i64) -> i64
      %9368 = func.call @cc_nil_value() : () -> i64
      %9369 = func.call @cc_intern(%9367, %9368) : (i64, i64) -> i64
      %9370 = func.call @cc_nil_value() : () -> i64
      %9371 = func.call @cc_cons(%9369, %9370) : (i64, i64) -> i64
      %9372 = func.call @cc_values_pack(%9371) : (i64) -> i64
      func.call @stack_push_pointer(%9369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9373 = llvm.mlir.addressof @str788 : !llvm.ptr
      %9374 = arith.constant 17 : i64
      %9375 = func.call @cc_make_string(%9373, %9374) : (!llvm.ptr, i64) -> i64
      %9376 = llvm.mlir.addressof @str789 : !llvm.ptr
      %9377 = arith.constant 11 : i64
      %9378 = func.call @cc_make_string(%9376, %9377) : (!llvm.ptr, i64) -> i64
      %9379 = func.call @cc_intern(%9375, %9378) : (i64, i64) -> i64
      %9380 = func.call @cc_nil_value() : () -> i64
      %9381 = func.call @cc_cons(%9379, %9380) : (i64, i64) -> i64
      %9382 = func.call @cc_values_pack(%9381) : (i64) -> i64
      func.call @stack_push_pointer(%9379) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9383 = llvm.mlir.addressof @str790 : !llvm.ptr
      %9384 = arith.constant 10 : i64
      %9385 = func.call @cc_make_string(%9383, %9384) : (!llvm.ptr, i64) -> i64
      %9386 = llvm.mlir.addressof @str791 : !llvm.ptr
      %9387 = arith.constant 11 : i64
      %9388 = func.call @cc_make_string(%9386, %9387) : (!llvm.ptr, i64) -> i64
      %9389 = func.call @cc_intern(%9385, %9388) : (i64, i64) -> i64
      %9390 = func.call @cc_nil_value() : () -> i64
      %9391 = func.call @cc_cons(%9389, %9390) : (i64, i64) -> i64
      %9392 = func.call @cc_values_pack(%9391) : (i64) -> i64
      func.call @stack_push_pointer(%9389) : (i64) -> ()
      %9393 = llvm.mlir.addressof @str792 : !llvm.ptr
      %9394 = arith.constant 5 : i64
      %9395 = func.call @cc_make_string(%9393, %9394) : (!llvm.ptr, i64) -> i64
      %9396 = func.call @cc_nil_value() : () -> i64
      %9397 = func.call @cc_intern(%9395, %9396) : (i64, i64) -> i64
      %9398 = func.call @cc_nil_value() : () -> i64
      %9399 = func.call @cc_cons(%9397, %9398) : (i64, i64) -> i64
      %9400 = func.call @cc_values_pack(%9399) : (i64) -> i64
      func.call @stack_push_pointer(%9397) : (i64) -> ()
      %9401 = llvm.mlir.addressof @str793 : !llvm.ptr
      %9402 = arith.constant 9 : i64
      %9403 = func.call @cc_make_string(%9401, %9402) : (!llvm.ptr, i64) -> i64
      %9404 = llvm.mlir.addressof @str794 : !llvm.ptr
      %9405 = arith.constant 7 : i64
      %9406 = func.call @cc_make_string(%9404, %9405) : (!llvm.ptr, i64) -> i64
      %9407 = func.call @cc_intern(%9403, %9406) : (i64, i64) -> i64
      %9408 = func.call @cc_nil_value() : () -> i64
      %9409 = func.call @cc_cons(%9407, %9408) : (i64, i64) -> i64
      %9410 = func.call @cc_values_pack(%9409) : (i64) -> i64
      func.call @stack_push_pointer(%9407) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9411 = func.call @stack_pop_pointer() : () -> i64
      %9412 = func.call @stack_pop_pointer() : () -> i64
      %9413 = func.call @cc_cons(%9412, %9411) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_439 = arith.constant 0 : i64
      %9414 = arith.addi %9413, %__rlasp_stack_elide_zero_439 : i64
      %9415 = func.call @stack_pop_pointer() : () -> i64
      %9416 = func.call @cc_cons(%9415, %9414) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_440 = arith.constant 0 : i64
      %9417 = arith.addi %9416, %__rlasp_stack_elide_zero_440 : i64
      %9418 = func.call @stack_pop_pointer() : () -> i64
      %9419 = func.call @cc_cons(%9418, %9417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9419) : (i64) -> ()
      %9420 = llvm.mlir.addressof @str795 : !llvm.ptr
      %9421 = arith.constant 9 : i64
      %9422 = func.call @cc_make_string(%9420, %9421) : (!llvm.ptr, i64) -> i64
      %9423 = llvm.mlir.addressof @str796 : !llvm.ptr
      %9424 = arith.constant 11 : i64
      %9425 = func.call @cc_make_string(%9423, %9424) : (!llvm.ptr, i64) -> i64
      %9426 = func.call @cc_intern(%9422, %9425) : (i64, i64) -> i64
      %9427 = func.call @cc_nil_value() : () -> i64
      %9428 = func.call @cc_cons(%9426, %9427) : (i64, i64) -> i64
      %9429 = func.call @cc_values_pack(%9428) : (i64) -> i64
      func.call @stack_push_pointer(%9426) : (i64) -> ()
      %9430 = llvm.mlir.addressof @str797 : !llvm.ptr
      %9431 = arith.constant 6 : i64
      %9432 = func.call @cc_make_string(%9430, %9431) : (!llvm.ptr, i64) -> i64
      %9433 = func.call @cc_nil_value() : () -> i64
      %9434 = func.call @cc_intern(%9432, %9433) : (i64, i64) -> i64
      %9435 = func.call @cc_nil_value() : () -> i64
      %9436 = func.call @cc_cons(%9434, %9435) : (i64, i64) -> i64
      %9437 = func.call @cc_values_pack(%9436) : (i64) -> i64
      func.call @stack_push_pointer(%9434) : (i64) -> ()
      %9438 = llvm.mlir.addressof @str798 : !llvm.ptr
      %9439 = arith.constant 5 : i64
      %9440 = func.call @cc_make_string(%9438, %9439) : (!llvm.ptr, i64) -> i64
      %9441 = func.call @cc_nil_value() : () -> i64
      %9442 = func.call @cc_intern(%9440, %9441) : (i64, i64) -> i64
      %9443 = func.call @cc_nil_value() : () -> i64
      %9444 = func.call @cc_cons(%9442, %9443) : (i64, i64) -> i64
      %9445 = func.call @cc_values_pack(%9444) : (i64) -> i64
      func.call @stack_push_pointer(%9442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9446 = func.call @stack_pop_pointer() : () -> i64
      %9447 = func.call @stack_pop_pointer() : () -> i64
      %9448 = func.call @cc_cons(%9447, %9446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9448) : (i64) -> ()
      %9449 = llvm.mlir.addressof @str799 : !llvm.ptr
      %9450 = arith.constant 2 : i64
      %9451 = func.call @cc_make_string(%9449, %9450) : (!llvm.ptr, i64) -> i64
      %9452 = func.call @cc_nil_value() : () -> i64
      %9453 = func.call @cc_intern(%9451, %9452) : (i64, i64) -> i64
      %9454 = func.call @cc_nil_value() : () -> i64
      %9455 = func.call @cc_cons(%9453, %9454) : (i64, i64) -> i64
      %9456 = func.call @cc_values_pack(%9455) : (i64) -> i64
      func.call @stack_push_pointer(%9453) : (i64) -> ()
      %9457 = llvm.mlir.addressof @str800 : !llvm.ptr
      %9458 = arith.constant 2 : i64
      %9459 = func.call @cc_make_string(%9457, %9458) : (!llvm.ptr, i64) -> i64
      %9460 = llvm.mlir.addressof @str801 : !llvm.ptr
      %9461 = arith.constant 11 : i64
      %9462 = func.call @cc_make_string(%9460, %9461) : (!llvm.ptr, i64) -> i64
      %9463 = func.call @cc_intern(%9459, %9462) : (i64, i64) -> i64
      %9464 = func.call @cc_nil_value() : () -> i64
      %9465 = func.call @cc_cons(%9463, %9464) : (i64, i64) -> i64
      %9466 = func.call @cc_values_pack(%9465) : (i64) -> i64
      func.call @stack_push_pointer(%9463) : (i64) -> ()
      %9467 = llvm.mlir.addressof @str802 : !llvm.ptr
      %9468 = arith.constant 19 : i64
      %9469 = func.call @cc_make_string(%9467, %9468) : (!llvm.ptr, i64) -> i64
      %9470 = llvm.mlir.addressof @str803 : !llvm.ptr
      %9471 = arith.constant 11 : i64
      %9472 = func.call @cc_make_string(%9470, %9471) : (!llvm.ptr, i64) -> i64
      %9473 = func.call @cc_intern(%9469, %9472) : (i64, i64) -> i64
      %9474 = func.call @cc_nil_value() : () -> i64
      %9475 = func.call @cc_cons(%9473, %9474) : (i64, i64) -> i64
      %9476 = func.call @cc_values_pack(%9475) : (i64) -> i64
      func.call @stack_push_pointer(%9473) : (i64) -> ()
      %9477 = llvm.mlir.addressof @str804 : !llvm.ptr
      %9478 = arith.constant 5 : i64
      %9479 = func.call @cc_make_string(%9477, %9478) : (!llvm.ptr, i64) -> i64
      %9480 = func.call @cc_nil_value() : () -> i64
      %9481 = func.call @cc_intern(%9479, %9480) : (i64, i64) -> i64
      %9482 = func.call @cc_nil_value() : () -> i64
      %9483 = func.call @cc_cons(%9481, %9482) : (i64, i64) -> i64
      %9484 = func.call @cc_values_pack(%9483) : (i64) -> i64
      func.call @stack_push_pointer(%9481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9485 = func.call @stack_pop_pointer() : () -> i64
      %9486 = func.call @stack_pop_pointer() : () -> i64
      %9487 = func.call @cc_cons(%9486, %9485) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_441 = arith.constant 0 : i64
      %9488 = arith.addi %9487, %__rlasp_stack_elide_zero_441 : i64
      %9489 = func.call @stack_pop_pointer() : () -> i64
      %9490 = func.call @cc_cons(%9489, %9488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9490) : (i64) -> ()
      %9491 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%9491) : (i64) -> ()
      %9492 = llvm.mlir.addressof @str805 : !llvm.ptr
      %9493 = arith.constant 32 : i64
      %9494 = func.call @cc_make_string(%9492, %9493) : (!llvm.ptr, i64) -> i64
      %9495 = func.call @cc_nil_value() : () -> i64
      %9496 = func.call @cc_intern(%9494, %9495) : (i64, i64) -> i64
      %9497 = func.call @cc_nil_value() : () -> i64
      %9498 = func.call @cc_cons(%9496, %9497) : (i64, i64) -> i64
      %9499 = func.call @cc_values_pack(%9498) : (i64) -> i64
      %__rlasp_stack_elide_zero_442 = arith.constant 0 : i64
      %9500 = arith.addi %9496, %__rlasp_stack_elide_zero_442 : i64
      %9501 = func.call @stack_pop_pointer() : () -> i64
      %9502 = func.call @cc_cons(%9500, %9501) : (i64, i64) -> i64
      %9503 = llvm.mlir.addressof @str806 : !llvm.ptr
      %9504 = arith.constant 5 : i64
      %9505 = func.call @cc_make_string(%9503, %9504) : (!llvm.ptr, i64) -> i64
      %9506 = func.call @cc_nil_value() : () -> i64
      %9507 = func.call @cc_intern(%9505, %9506) : (i64, i64) -> i64
      %9508 = func.call @cc_nil_value() : () -> i64
      %9509 = func.call @cc_cons(%9507, %9508) : (i64, i64) -> i64
      %9510 = func.call @cc_values_pack(%9509) : (i64) -> i64
      %9511 = func.call @cc_cons(%9507, %9502) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9512 = func.call @stack_pop_pointer() : () -> i64
      %9513 = func.call @stack_pop_pointer() : () -> i64
      %9514 = func.call @cc_cons(%9513, %9512) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_443 = arith.constant 0 : i64
      %9515 = arith.addi %9514, %__rlasp_stack_elide_zero_443 : i64
      %9516 = func.call @stack_pop_pointer() : () -> i64
      %9517 = func.call @cc_cons(%9516, %9515) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_444 = arith.constant 0 : i64
      %9518 = arith.addi %9517, %__rlasp_stack_elide_zero_444 : i64
      %9519 = func.call @stack_pop_pointer() : () -> i64
      %9520 = func.call @cc_cons(%9519, %9518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9520) : (i64) -> ()
      %9521 = llvm.mlir.addressof @str807 : !llvm.ptr
      %9522 = arith.constant 5 : i64
      %9523 = func.call @cc_make_string(%9521, %9522) : (!llvm.ptr, i64) -> i64
      %9524 = func.call @cc_nil_value() : () -> i64
      %9525 = func.call @cc_intern(%9523, %9524) : (i64, i64) -> i64
      %9526 = func.call @cc_nil_value() : () -> i64
      %9527 = func.call @cc_cons(%9525, %9526) : (i64, i64) -> i64
      %9528 = func.call @cc_values_pack(%9527) : (i64) -> i64
      func.call @stack_push_pointer(%9525) : (i64) -> ()
      %9529 = llvm.mlir.addressof @str808 : !llvm.ptr
      %9530 = arith.constant 11 : i64
      %9531 = func.call @cc_make_string(%9529, %9530) : (!llvm.ptr, i64) -> i64
      %9532 = func.call @cc_nil_value() : () -> i64
      %9533 = func.call @cc_intern(%9531, %9532) : (i64, i64) -> i64
      %9534 = func.call @cc_nil_value() : () -> i64
      %9535 = func.call @cc_cons(%9533, %9534) : (i64, i64) -> i64
      %9536 = func.call @cc_values_pack(%9535) : (i64) -> i64
      func.call @stack_push_pointer(%9533) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9537 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%9537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9538 = func.call @stack_pop_pointer() : () -> i64
      %9539 = func.call @stack_pop_pointer() : () -> i64
      %9540 = func.call @cc_cons(%9539, %9538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_445 = arith.constant 0 : i64
      %9541 = arith.addi %9540, %__rlasp_stack_elide_zero_445 : i64
      %9542 = func.call @stack_pop_pointer() : () -> i64
      %9543 = func.call @cc_cons(%9542, %9541) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_446 = arith.constant 0 : i64
      %9544 = arith.addi %9543, %__rlasp_stack_elide_zero_446 : i64
      %9545 = func.call @stack_pop_pointer() : () -> i64
      %9546 = func.call @cc_cons(%9545, %9544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9547 = func.call @stack_pop_pointer() : () -> i64
      %9548 = func.call @stack_pop_pointer() : () -> i64
      %9549 = func.call @cc_cons(%9548, %9547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_447 = arith.constant 0 : i64
      %9550 = arith.addi %9549, %__rlasp_stack_elide_zero_447 : i64
      %9551 = func.call @stack_pop_pointer() : () -> i64
      %9552 = func.call @cc_cons(%9551, %9550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9553 = func.call @stack_pop_pointer() : () -> i64
      %9554 = func.call @stack_pop_pointer() : () -> i64
      %9555 = func.call @cc_cons(%9554, %9553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_448 = arith.constant 0 : i64
      %9556 = arith.addi %9555, %__rlasp_stack_elide_zero_448 : i64
      %9557 = func.call @stack_pop_pointer() : () -> i64
      %9558 = func.call @cc_cons(%9557, %9556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_449 = arith.constant 0 : i64
      %9559 = arith.addi %9558, %__rlasp_stack_elide_zero_449 : i64
      %9560 = func.call @stack_pop_pointer() : () -> i64
      %9561 = func.call @cc_cons(%9560, %9559) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_450 = arith.constant 0 : i64
      %9562 = arith.addi %9561, %__rlasp_stack_elide_zero_450 : i64
      %9563 = func.call @stack_pop_pointer() : () -> i64
      %9564 = func.call @cc_cons(%9563, %9562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9564) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9565 = func.call @stack_pop_pointer() : () -> i64
      %9566 = func.call @stack_pop_pointer() : () -> i64
      %9567 = func.call @cc_cons(%9566, %9565) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_451 = arith.constant 0 : i64
      %9568 = arith.addi %9567, %__rlasp_stack_elide_zero_451 : i64
      %9569 = func.call @stack_pop_pointer() : () -> i64
      %9570 = func.call @cc_cons(%9569, %9568) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_452 = arith.constant 0 : i64
      %9571 = arith.addi %9570, %__rlasp_stack_elide_zero_452 : i64
      %9572 = func.call @stack_pop_pointer() : () -> i64
      %9573 = func.call @cc_cons(%9572, %9571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9573) : (i64) -> ()
      %9574 = llvm.mlir.addressof @str809 : !llvm.ptr
      %9575 = arith.constant 5 : i64
      %9576 = func.call @cc_make_string(%9574, %9575) : (!llvm.ptr, i64) -> i64
      %9577 = func.call @cc_nil_value() : () -> i64
      %9578 = func.call @cc_intern(%9576, %9577) : (i64, i64) -> i64
      %9579 = func.call @cc_nil_value() : () -> i64
      %9580 = func.call @cc_cons(%9578, %9579) : (i64, i64) -> i64
      %9581 = func.call @cc_values_pack(%9580) : (i64) -> i64
      func.call @stack_push_pointer(%9578) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9582 = func.call @stack_pop_pointer() : () -> i64
      %9583 = func.call @stack_pop_pointer() : () -> i64
      %9584 = func.call @cc_cons(%9583, %9582) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_453 = arith.constant 0 : i64
      %9585 = arith.addi %9584, %__rlasp_stack_elide_zero_453 : i64
      %9586 = func.call @stack_pop_pointer() : () -> i64
      %9587 = func.call @cc_cons(%9586, %9585) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_454 = arith.constant 0 : i64
      %9588 = arith.addi %9587, %__rlasp_stack_elide_zero_454 : i64
      %9589 = func.call @stack_pop_pointer() : () -> i64
      %9590 = func.call @cc_cons(%9589, %9588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9590) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9591 = func.call @stack_pop_pointer() : () -> i64
      %9592 = func.call @stack_pop_pointer() : () -> i64
      %9593 = func.call @cc_cons(%9592, %9591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_455 = arith.constant 0 : i64
      %9594 = arith.addi %9593, %__rlasp_stack_elide_zero_455 : i64
      %9595 = func.call @stack_pop_pointer() : () -> i64
      %9596 = func.call @cc_cons(%9595, %9594) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_456 = arith.constant 0 : i64
      %9597 = arith.addi %9596, %__rlasp_stack_elide_zero_456 : i64
      %9598 = func.call @stack_pop_pointer() : () -> i64
      %9599 = func.call @cc_cons(%9598, %9597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9600 = func.call @stack_pop_pointer() : () -> i64
      %9601 = func.call @stack_pop_pointer() : () -> i64
      %9602 = func.call @cc_cons(%9601, %9600) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_457 = arith.constant 0 : i64
      %9603 = arith.addi %9602, %__rlasp_stack_elide_zero_457 : i64
      %9604 = func.call @stack_pop_pointer() : () -> i64
      %9605 = func.call @cc_cons(%9604, %9603) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_458 = arith.constant 0 : i64
      %9606 = arith.addi %9605, %__rlasp_stack_elide_zero_458 : i64
      %9607 = func.call @stack_pop_pointer() : () -> i64
      %9608 = func.call @cc_cons(%9607, %9606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9608) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9609 = func.call @stack_pop_pointer() : () -> i64
      %9610 = func.call @stack_pop_pointer() : () -> i64
      %9611 = func.call @cc_cons(%9610, %9609) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_459 = arith.constant 0 : i64
      %9612 = arith.addi %9611, %__rlasp_stack_elide_zero_459 : i64
      %9613 = func.call @stack_pop_pointer() : () -> i64
      %9614 = func.call @cc_cons(%9613, %9612) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_460 = arith.constant 0 : i64
      %9615 = arith.addi %9614, %__rlasp_stack_elide_zero_460 : i64
      %9616 = func.call @stack_pop_pointer() : () -> i64
      %9617 = func.call @cc_cons(%9616, %9615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9618 = func.call @stack_pop_pointer() : () -> i64
      %9619 = func.call @stack_pop_pointer() : () -> i64
      %9620 = func.call @cc_cons(%9619, %9618) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_461 = arith.constant 0 : i64
      %9621 = arith.addi %9620, %__rlasp_stack_elide_zero_461 : i64
      %9622 = func.call @stack_pop_pointer() : () -> i64
      %9623 = func.call @cc_cons(%9622, %9621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_462 = arith.constant 0 : i64
      %9624 = arith.addi %9623, %__rlasp_stack_elide_zero_462 : i64
      %9625 = func.call @stack_pop_pointer() : () -> i64
      %9626 = func.call @cc_cons(%9625, %9624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9627 = func.call @stack_pop_pointer() : () -> i64
      %9628 = func.call @stack_pop_pointer() : () -> i64
      %9629 = func.call @cc_cons(%9628, %9627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_463 = arith.constant 0 : i64
      %9630 = arith.addi %9629, %__rlasp_stack_elide_zero_463 : i64
      %9631 = func.call @stack_pop_pointer() : () -> i64
      %9632 = func.call @cc_cons(%9631, %9630) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_464 = arith.constant 0 : i64
      %9633 = arith.addi %9632, %__rlasp_stack_elide_zero_464 : i64
      %9634 = func.call @stack_pop_pointer() : () -> i64
      %9635 = func.call @cc_cons(%9634, %9633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9636 = func.call @stack_pop_pointer() : () -> i64
      %9637 = func.call @stack_pop_pointer() : () -> i64
      %9638 = func.call @cc_cons(%9637, %9636) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_465 = arith.constant 0 : i64
      %9639 = arith.addi %9638, %__rlasp_stack_elide_zero_465 : i64
      %9640 = func.call @stack_pop_pointer() : () -> i64
      %9641 = func.call @cc_cons(%9640, %9639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9642 = func.call @stack_pop_pointer() : () -> i64
      %9643 = func.call @stack_pop_pointer() : () -> i64
      %9644 = func.call @cc_cons(%9643, %9642) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_466 = arith.constant 0 : i64
      %9645 = arith.addi %9644, %__rlasp_stack_elide_zero_466 : i64
      %9646 = func.call @stack_pop_pointer() : () -> i64
      %9647 = func.call @cc_cons(%9646, %9645) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_467 = arith.constant 0 : i64
      %9648 = arith.addi %9647, %__rlasp_stack_elide_zero_467 : i64
      %9868 = llvm.mlir.addressof @str824 : !llvm.ptr
      %9869 = arith.constant 33 : i64
      %9870 = func.call @cc_make_symbol(%9868, %9869) : (!llvm.ptr, i64) -> i64
      %9871 = func.call @cc_persistent_root_value(%9870) : (i64) -> i64
      func.call @stack_push_pointer(%9871) : (i64) -> ()
      %9872 = arith.constant 97047688511570 : i64
      %9873 = arith.constant 1 : i64
      %9874 = func.call @cc_make_closure(%9872, %9873) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_468 = arith.constant 0 : i64
      %9875 = arith.addi %9874, %__rlasp_stack_elide_zero_468 : i64
      %9876 = llvm.mlir.addressof @str825 : !llvm.ptr
      %9877 = arith.constant 1 : i64
      %9878 = func.call @cc_make_string(%9876, %9877) : (!llvm.ptr, i64) -> i64
      %9879 = func.call @cc_nil_value() : () -> i64
      %9880 = func.call @cc_intern(%9878, %9879) : (i64, i64) -> i64
      %9881 = func.call @cc_nil_value() : () -> i64
      %9882 = func.call @cc_cons(%9880, %9881) : (i64, i64) -> i64
      %9883 = func.call @cc_values_pack(%9882) : (i64) -> i64
      func.call @stack_push_pointer(%9880) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9884 = func.call @stack_pop_pointer() : () -> i64
      %9885 = func.call @stack_pop_pointer() : () -> i64
      %9886 = func.call @cc_cons(%9885, %9884) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_469 = arith.constant 0 : i64
      %9887 = arith.addi %9886, %__rlasp_stack_elide_zero_469 : i64
      %9888 = llvm.mlir.addressof @str826 : !llvm.ptr
      %9889 = arith.constant 11 : i64
      %9890 = func.call @cc_make_string(%9888, %9889) : (!llvm.ptr, i64) -> i64
      %9891 = llvm.mlir.addressof @str827 : !llvm.ptr
      %9892 = arith.constant 7 : i64
      %9893 = func.call @cc_make_string(%9891, %9892) : (!llvm.ptr, i64) -> i64
      %9894 = func.call @cc_intern(%9890, %9893) : (i64, i64) -> i64
      %9895 = func.call @cc_nil_value() : () -> i64
      %9896 = func.call @cc_cons(%9894, %9895) : (i64, i64) -> i64
      %9897 = func.call @cc_values_pack(%9896) : (i64) -> i64
      %9898 = func.call @cc_nil_value() : () -> i64
      %9899 = llvm.mlir.addressof @str828 : !llvm.ptr
      %9900 = arith.constant 4 : i64
      %9901 = func.call @cc_make_string(%9899, %9900) : (!llvm.ptr, i64) -> i64
      %9902 = llvm.mlir.addressof @str829 : !llvm.ptr
      %9903 = arith.constant 7 : i64
      %9904 = func.call @cc_make_string(%9902, %9903) : (!llvm.ptr, i64) -> i64
      %9905 = func.call @cc_intern(%9901, %9904) : (i64, i64) -> i64
      %9906 = func.call @cc_nil_value() : () -> i64
      %9907 = func.call @cc_cons(%9905, %9906) : (i64, i64) -> i64
      %9908 = func.call @cc_values_pack(%9907) : (i64) -> i64
      %9909 = llvm.mlir.addressof @str830 : !llvm.ptr
      %9910 = arith.constant 6 : i64
      %9911 = func.call @cc_make_string(%9909, %9910) : (!llvm.ptr, i64) -> i64
      %9912 = func.call @cc_nil_value() : () -> i64
      %9913 = func.call @cc_intern(%9911, %9912) : (i64, i64) -> i64
      %9914 = func.call @cc_nil_value() : () -> i64
      %9915 = func.call @cc_cons(%9913, %9914) : (i64, i64) -> i64
      %9916 = func.call @cc_values_pack(%9915) : (i64) -> i64
      %__rlasp_stack_elide_zero_470 = arith.constant 0 : i64
      %9917 = arith.addi %9913, %__rlasp_stack_elide_zero_470 : i64
      %9918 = func.call @cc_nil_value() : () -> i64
      %9919 = func.call @cc_errorp(%9332) : (i64) -> i64
      %9920 = arith.cmpi ne, %9919, %9918 : i64
      %9921 = arith.cmpi eq, %9918, %9918 : i64
      %9922 = arith.andi %9920, %9921 : i1
      %9923 = scf.if %9922 -> (i64) {
        scf.yield %9332 : i64
      } else {
        scf.yield %9918 : i64
      }
      %9924 = func.call @cc_errorp(%9648) : (i64) -> i64
      %9925 = arith.cmpi ne, %9924, %9918 : i64
      %9926 = arith.cmpi eq, %9923, %9918 : i64
      %9927 = arith.andi %9925, %9926 : i1
      %9928 = scf.if %9927 -> (i64) {
        scf.yield %9648 : i64
      } else {
        scf.yield %9923 : i64
      }
      %9929 = func.call @cc_errorp(%9875) : (i64) -> i64
      %9930 = arith.cmpi ne, %9929, %9918 : i64
      %9931 = arith.cmpi eq, %9928, %9918 : i64
      %9932 = arith.andi %9930, %9931 : i1
      %9933 = scf.if %9932 -> (i64) {
        scf.yield %9875 : i64
      } else {
        scf.yield %9928 : i64
      }
      %9934 = func.call @cc_errorp(%9887) : (i64) -> i64
      %9935 = arith.cmpi ne, %9934, %9918 : i64
      %9936 = arith.cmpi eq, %9933, %9918 : i64
      %9937 = arith.andi %9935, %9936 : i1
      %9938 = scf.if %9937 -> (i64) {
        scf.yield %9887 : i64
      } else {
        scf.yield %9933 : i64
      }
      %9939 = func.call @cc_errorp(%9894) : (i64) -> i64
      %9940 = arith.cmpi ne, %9939, %9918 : i64
      %9941 = arith.cmpi eq, %9938, %9918 : i64
      %9942 = arith.andi %9940, %9941 : i1
      %9943 = scf.if %9942 -> (i64) {
        scf.yield %9894 : i64
      } else {
        scf.yield %9938 : i64
      }
      %9944 = func.call @cc_errorp(%9898) : (i64) -> i64
      %9945 = arith.cmpi ne, %9944, %9918 : i64
      %9946 = arith.cmpi eq, %9943, %9918 : i64
      %9947 = arith.andi %9945, %9946 : i1
      %9948 = scf.if %9947 -> (i64) {
        scf.yield %9898 : i64
      } else {
        scf.yield %9943 : i64
      }
      %9949 = func.call @cc_errorp(%9905) : (i64) -> i64
      %9950 = arith.cmpi ne, %9949, %9918 : i64
      %9951 = arith.cmpi eq, %9948, %9918 : i64
      %9952 = arith.andi %9950, %9951 : i1
      %9953 = scf.if %9952 -> (i64) {
        scf.yield %9905 : i64
      } else {
        scf.yield %9948 : i64
      }
      %9954 = func.call @cc_errorp(%9917) : (i64) -> i64
      %9955 = arith.cmpi ne, %9954, %9918 : i64
      %9956 = arith.cmpi eq, %9953, %9918 : i64
      %9957 = arith.andi %9955, %9956 : i1
      %9958 = scf.if %9957 -> (i64) {
        scf.yield %9917 : i64
      } else {
        scf.yield %9953 : i64
      }
      %9959 = arith.cmpi ne, %9958, %9918 : i64
      scf.if %9959 {
        func.call @stack_push_pointer(%9958) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9332) : (i64) -> ()
        func.call @stack_push_pointer(%9648) : (i64) -> ()
        func.call @stack_push_pointer(%9875) : (i64) -> ()
        func.call @stack_push_pointer(%9887) : (i64) -> ()
        func.call @stack_push_pointer(%9894) : (i64) -> ()
        func.call @stack_push_pointer(%9898) : (i64) -> ()
        func.call @stack_push_pointer(%9905) : (i64) -> ()
        func.call @stack_push_pointer(%9917) : (i64) -> ()
        %9960 = llvm.mlir.addressof @str831 : !llvm.ptr
        %9961 = func.call @cc_make_function_ref_const(%9960) : (!llvm.ptr) -> i64
        %9962 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9961, %9962) : (i64, i64) -> ()
      }
      %9963 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9963 : i64
    }
    %9964 = func.call @cc_nil_value() : () -> i64
    %9965 = func.call @cc_errorp(%9323) : (i64) -> i64
    %9966 = arith.cmpi ne, %9965, %9964 : i64
    %9967 = scf.if %9966 -> (i64) {
      scf.yield %9323 : i64
    } else {
      %9968 = llvm.mlir.addressof @str832 : !llvm.ptr
      %9969 = arith.constant 17 : i64
      %9970 = func.call @cc_make_string(%9968, %9969) : (!llvm.ptr, i64) -> i64
      %9971 = func.call @cc_nil_value() : () -> i64
      %9972 = func.call @cc_intern(%9970, %9971) : (i64, i64) -> i64
      %9973 = func.call @cc_nil_value() : () -> i64
      %9974 = func.call @cc_cons(%9972, %9973) : (i64, i64) -> i64
      %9975 = func.call @cc_values_pack(%9974) : (i64) -> i64
      %__rlasp_stack_elide_zero_471 = arith.constant 0 : i64
      %9976 = arith.addi %9972, %__rlasp_stack_elide_zero_471 : i64
      %9977 = llvm.mlir.addressof @str833 : !llvm.ptr
      %9978 = arith.constant 11 : i64
      %9979 = func.call @cc_make_string(%9977, %9978) : (!llvm.ptr, i64) -> i64
      %9980 = llvm.mlir.addressof @str834 : !llvm.ptr
      %9981 = arith.constant 11 : i64
      %9982 = func.call @cc_make_string(%9980, %9981) : (!llvm.ptr, i64) -> i64
      %9983 = func.call @cc_intern(%9979, %9982) : (i64, i64) -> i64
      %9984 = func.call @cc_nil_value() : () -> i64
      %9985 = func.call @cc_cons(%9983, %9984) : (i64, i64) -> i64
      %9986 = func.call @cc_values_pack(%9985) : (i64) -> i64
      func.call @stack_push_pointer(%9983) : (i64) -> ()
      %9987 = llvm.mlir.addressof @str835 : !llvm.ptr
      %9988 = arith.constant 3 : i64
      %9989 = func.call @cc_make_string(%9987, %9988) : (!llvm.ptr, i64) -> i64
      %9990 = llvm.mlir.addressof @str836 : !llvm.ptr
      %9991 = arith.constant 11 : i64
      %9992 = func.call @cc_make_string(%9990, %9991) : (!llvm.ptr, i64) -> i64
      %9993 = func.call @cc_intern(%9989, %9992) : (i64, i64) -> i64
      %9994 = func.call @cc_nil_value() : () -> i64
      %9995 = func.call @cc_cons(%9993, %9994) : (i64, i64) -> i64
      %9996 = func.call @cc_values_pack(%9995) : (i64) -> i64
      func.call @stack_push_pointer(%9993) : (i64) -> ()
      %9997 = llvm.mlir.addressof @str837 : !llvm.ptr
      %9998 = arith.constant 19 : i64
      %9999 = func.call @cc_make_string(%9997, %9998) : (!llvm.ptr, i64) -> i64
      %10000 = llvm.mlir.addressof @str838 : !llvm.ptr
      %10001 = arith.constant 11 : i64
      %10002 = func.call @cc_make_string(%10000, %10001) : (!llvm.ptr, i64) -> i64
      %10003 = func.call @cc_intern(%9999, %10002) : (i64, i64) -> i64
      %10004 = func.call @cc_nil_value() : () -> i64
      %10005 = func.call @cc_cons(%10003, %10004) : (i64, i64) -> i64
      %10006 = func.call @cc_values_pack(%10005) : (i64) -> i64
      func.call @stack_push_pointer(%10003) : (i64) -> ()
      %10007 = llvm.mlir.addressof @str839 : !llvm.ptr
      %10008 = arith.constant 7 : i64
      %10009 = func.call @cc_make_string(%10007, %10008) : (!llvm.ptr, i64) -> i64
      %10010 = llvm.mlir.addressof @str840 : !llvm.ptr
      %10011 = arith.constant 11 : i64
      %10012 = func.call @cc_make_string(%10010, %10011) : (!llvm.ptr, i64) -> i64
      %10013 = func.call @cc_intern(%10009, %10012) : (i64, i64) -> i64
      %10014 = func.call @cc_nil_value() : () -> i64
      %10015 = func.call @cc_cons(%10013, %10014) : (i64, i64) -> i64
      %10016 = func.call @cc_values_pack(%10015) : (i64) -> i64
      func.call @stack_push_pointer(%10013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10017 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%10017) : (i64) -> ()
      %10018 = llvm.mlir.addressof @str841 : !llvm.ptr
      %10019 = arith.constant 6 : i64
      %10020 = func.call @cc_make_string(%10018, %10019) : (!llvm.ptr, i64) -> i64
      %10021 = llvm.mlir.addressof @str842 : !llvm.ptr
      %10022 = arith.constant 11 : i64
      %10023 = func.call @cc_make_string(%10021, %10022) : (!llvm.ptr, i64) -> i64
      %10024 = func.call @cc_intern(%10020, %10023) : (i64, i64) -> i64
      %10025 = func.call @cc_nil_value() : () -> i64
      %10026 = func.call @cc_cons(%10024, %10025) : (i64, i64) -> i64
      %10027 = func.call @cc_values_pack(%10026) : (i64) -> i64
      func.call @stack_push_pointer(%10024) : (i64) -> ()
      %10028 = llvm.mlir.addressof @str843 : !llvm.ptr
      %10029 = arith.constant 1 : i64
      %10030 = func.call @cc_make_string(%10028, %10029) : (!llvm.ptr, i64) -> i64
      %10031 = func.call @cc_nil_value() : () -> i64
      %10032 = func.call @cc_intern(%10030, %10031) : (i64, i64) -> i64
      %10033 = func.call @cc_nil_value() : () -> i64
      %10034 = func.call @cc_cons(%10032, %10033) : (i64, i64) -> i64
      %10035 = func.call @cc_values_pack(%10034) : (i64) -> i64
      func.call @stack_push_pointer(%10032) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10036 = func.call @stack_pop_pointer() : () -> i64
      %10037 = func.call @stack_pop_pointer() : () -> i64
      %10038 = func.call @cc_cons(%10037, %10036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10038) : (i64) -> ()
      %10039 = llvm.mlir.addressof @str844 : !llvm.ptr
      %10040 = arith.constant 13 : i64
      %10041 = func.call @cc_make_string(%10039, %10040) : (!llvm.ptr, i64) -> i64
      %10042 = llvm.mlir.addressof @str845 : !llvm.ptr
      %10043 = arith.constant 11 : i64
      %10044 = func.call @cc_make_string(%10042, %10043) : (!llvm.ptr, i64) -> i64
      %10045 = func.call @cc_intern(%10041, %10044) : (i64, i64) -> i64
      %10046 = func.call @cc_nil_value() : () -> i64
      %10047 = func.call @cc_cons(%10045, %10046) : (i64, i64) -> i64
      %10048 = func.call @cc_values_pack(%10047) : (i64) -> i64
      func.call @stack_push_pointer(%10045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10049 = func.call @stack_pop_pointer() : () -> i64
      %10050 = func.call @stack_pop_pointer() : () -> i64
      %10051 = func.call @cc_cons(%10050, %10049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10051) : (i64) -> ()
      %10052 = llvm.mlir.addressof @str846 : !llvm.ptr
      %10053 = arith.constant 14 : i64
      %10054 = func.call @cc_make_string(%10052, %10053) : (!llvm.ptr, i64) -> i64
      %10055 = llvm.mlir.addressof @str847 : !llvm.ptr
      %10056 = arith.constant 11 : i64
      %10057 = func.call @cc_make_string(%10055, %10056) : (!llvm.ptr, i64) -> i64
      %10058 = func.call @cc_intern(%10054, %10057) : (i64, i64) -> i64
      %10059 = func.call @cc_nil_value() : () -> i64
      %10060 = func.call @cc_cons(%10058, %10059) : (i64, i64) -> i64
      %10061 = func.call @cc_values_pack(%10060) : (i64) -> i64
      func.call @stack_push_pointer(%10058) : (i64) -> ()
      %10062 = llvm.mlir.addressof @str848 : !llvm.ptr
      %10063 = arith.constant 7 : i64
      %10064 = func.call @cc_make_string(%10062, %10063) : (!llvm.ptr, i64) -> i64
      %10065 = llvm.mlir.addressof @str849 : !llvm.ptr
      %10066 = arith.constant 11 : i64
      %10067 = func.call @cc_make_string(%10065, %10066) : (!llvm.ptr, i64) -> i64
      %10068 = func.call @cc_intern(%10064, %10067) : (i64, i64) -> i64
      %10069 = func.call @cc_nil_value() : () -> i64
      %10070 = func.call @cc_cons(%10068, %10069) : (i64, i64) -> i64
      %10071 = func.call @cc_values_pack(%10070) : (i64) -> i64
      func.call @stack_push_pointer(%10068) : (i64) -> ()
      %10072 = llvm.mlir.addressof @str850 : !llvm.ptr
      %10073 = arith.constant 1 : i64
      %10074 = func.call @cc_make_string(%10072, %10073) : (!llvm.ptr, i64) -> i64
      %10075 = func.call @cc_nil_value() : () -> i64
      %10076 = func.call @cc_intern(%10074, %10075) : (i64, i64) -> i64
      %10077 = func.call @cc_nil_value() : () -> i64
      %10078 = func.call @cc_cons(%10076, %10077) : (i64, i64) -> i64
      %10079 = func.call @cc_values_pack(%10078) : (i64) -> i64
      func.call @stack_push_pointer(%10076) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10080 = func.call @stack_pop_pointer() : () -> i64
      %10081 = func.call @stack_pop_pointer() : () -> i64
      %10082 = func.call @cc_cons(%10081, %10080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_472 = arith.constant 0 : i64
      %10083 = arith.addi %10082, %__rlasp_stack_elide_zero_472 : i64
      %10084 = func.call @stack_pop_pointer() : () -> i64
      %10085 = func.call @cc_cons(%10084, %10083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10085) : (i64) -> ()
      %10086 = llvm.mlir.addressof @str851 : !llvm.ptr
      %10087 = arith.constant 15 : i64
      %10088 = func.call @cc_make_string(%10086, %10087) : (!llvm.ptr, i64) -> i64
      %10089 = llvm.mlir.addressof @str852 : !llvm.ptr
      %10090 = arith.constant 11 : i64
      %10091 = func.call @cc_make_string(%10089, %10090) : (!llvm.ptr, i64) -> i64
      %10092 = func.call @cc_intern(%10088, %10091) : (i64, i64) -> i64
      %10093 = func.call @cc_nil_value() : () -> i64
      %10094 = func.call @cc_cons(%10092, %10093) : (i64, i64) -> i64
      %10095 = func.call @cc_values_pack(%10094) : (i64) -> i64
      func.call @stack_push_pointer(%10092) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10096 = func.call @stack_pop_pointer() : () -> i64
      %10097 = func.call @stack_pop_pointer() : () -> i64
      %10098 = func.call @cc_cons(%10097, %10096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10098) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10099 = func.call @stack_pop_pointer() : () -> i64
      %10100 = func.call @stack_pop_pointer() : () -> i64
      %10101 = func.call @cc_cons(%10100, %10099) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_473 = arith.constant 0 : i64
      %10102 = arith.addi %10101, %__rlasp_stack_elide_zero_473 : i64
      %10103 = func.call @stack_pop_pointer() : () -> i64
      %10104 = func.call @cc_cons(%10103, %10102) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_474 = arith.constant 0 : i64
      %10105 = arith.addi %10104, %__rlasp_stack_elide_zero_474 : i64
      %10106 = func.call @stack_pop_pointer() : () -> i64
      %10107 = func.call @cc_cons(%10106, %10105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10107) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10108 = func.call @stack_pop_pointer() : () -> i64
      %10109 = func.call @stack_pop_pointer() : () -> i64
      %10110 = func.call @cc_cons(%10109, %10108) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_475 = arith.constant 0 : i64
      %10111 = arith.addi %10110, %__rlasp_stack_elide_zero_475 : i64
      %10112 = func.call @stack_pop_pointer() : () -> i64
      %10113 = func.call @cc_cons(%10112, %10111) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_476 = arith.constant 0 : i64
      %10114 = arith.addi %10113, %__rlasp_stack_elide_zero_476 : i64
      %10115 = func.call @stack_pop_pointer() : () -> i64
      %10116 = func.call @cc_cons(%10115, %10114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_477 = arith.constant 0 : i64
      %10117 = arith.addi %10116, %__rlasp_stack_elide_zero_477 : i64
      %10118 = func.call @stack_pop_pointer() : () -> i64
      %10119 = func.call @cc_cons(%10118, %10117) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_478 = arith.constant 0 : i64
      %10120 = arith.addi %10119, %__rlasp_stack_elide_zero_478 : i64
      %10121 = func.call @stack_pop_pointer() : () -> i64
      %10122 = func.call @cc_cons(%10120, %10121) : (i64, i64) -> i64
      %10123 = llvm.mlir.addressof @str853 : !llvm.ptr
      %10124 = arith.constant 5 : i64
      %10125 = func.call @cc_make_string(%10123, %10124) : (!llvm.ptr, i64) -> i64
      %10126 = func.call @cc_nil_value() : () -> i64
      %10127 = func.call @cc_intern(%10125, %10126) : (i64, i64) -> i64
      %10128 = func.call @cc_nil_value() : () -> i64
      %10129 = func.call @cc_cons(%10127, %10128) : (i64, i64) -> i64
      %10130 = func.call @cc_values_pack(%10129) : (i64) -> i64
      %10131 = func.call @cc_cons(%10127, %10122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10132 = func.call @stack_pop_pointer() : () -> i64
      %10133 = func.call @stack_pop_pointer() : () -> i64
      %10134 = func.call @cc_cons(%10133, %10132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_479 = arith.constant 0 : i64
      %10135 = arith.addi %10134, %__rlasp_stack_elide_zero_479 : i64
      %10136 = func.call @stack_pop_pointer() : () -> i64
      %10137 = func.call @cc_cons(%10136, %10135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_480 = arith.constant 0 : i64
      %10138 = arith.addi %10137, %__rlasp_stack_elide_zero_480 : i64
      %10139 = func.call @stack_pop_pointer() : () -> i64
      %10140 = func.call @cc_cons(%10139, %10138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10140) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10141 = func.call @stack_pop_pointer() : () -> i64
      %10142 = func.call @stack_pop_pointer() : () -> i64
      %10143 = func.call @cc_cons(%10142, %10141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_481 = arith.constant 0 : i64
      %10144 = arith.addi %10143, %__rlasp_stack_elide_zero_481 : i64
      %10145 = func.call @stack_pop_pointer() : () -> i64
      %10146 = func.call @cc_cons(%10145, %10144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10147 = func.call @stack_pop_pointer() : () -> i64
      %10148 = func.call @stack_pop_pointer() : () -> i64
      %10149 = func.call @cc_cons(%10148, %10147) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_482 = arith.constant 0 : i64
      %10150 = arith.addi %10149, %__rlasp_stack_elide_zero_482 : i64
      %10151 = func.call @stack_pop_pointer() : () -> i64
      %10152 = func.call @cc_cons(%10151, %10150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10152) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10153 = func.call @stack_pop_pointer() : () -> i64
      %10154 = func.call @stack_pop_pointer() : () -> i64
      %10155 = func.call @cc_cons(%10154, %10153) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_483 = arith.constant 0 : i64
      %10156 = arith.addi %10155, %__rlasp_stack_elide_zero_483 : i64
      %10157 = func.call @stack_pop_pointer() : () -> i64
      %10158 = func.call @cc_cons(%10157, %10156) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_484 = arith.constant 0 : i64
      %10159 = arith.addi %10158, %__rlasp_stack_elide_zero_484 : i64
      %10215 = arith.constant 97047688511576 : i64
      %10216 = arith.constant 0 : i64
      %10217 = func.call @cc_make_closure(%10215, %10216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_485 = arith.constant 0 : i64
      %10218 = arith.addi %10217, %__rlasp_stack_elide_zero_485 : i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10219 = func.call @stack_pop_pointer() : () -> i64
      %10220 = func.call @stack_pop_pointer() : () -> i64
      %10221 = func.call @cc_cons(%10220, %10219) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_486 = arith.constant 0 : i64
      %10222 = arith.addi %10221, %__rlasp_stack_elide_zero_486 : i64
      %10223 = func.call @stack_pop_pointer() : () -> i64
      %10224 = func.call @cc_cons(%10223, %10222) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_487 = arith.constant 0 : i64
      %10225 = arith.addi %10224, %__rlasp_stack_elide_zero_487 : i64
      %10226 = llvm.mlir.addressof @str856 : !llvm.ptr
      %10227 = arith.constant 11 : i64
      %10228 = func.call @cc_make_string(%10226, %10227) : (!llvm.ptr, i64) -> i64
      %10229 = llvm.mlir.addressof @str857 : !llvm.ptr
      %10230 = arith.constant 7 : i64
      %10231 = func.call @cc_make_string(%10229, %10230) : (!llvm.ptr, i64) -> i64
      %10232 = func.call @cc_intern(%10228, %10231) : (i64, i64) -> i64
      %10233 = func.call @cc_nil_value() : () -> i64
      %10234 = func.call @cc_cons(%10232, %10233) : (i64, i64) -> i64
      %10235 = func.call @cc_values_pack(%10234) : (i64) -> i64
      %10236 = func.call @cc_nil_value() : () -> i64
      %10237 = llvm.mlir.addressof @str858 : !llvm.ptr
      %10238 = arith.constant 4 : i64
      %10239 = func.call @cc_make_string(%10237, %10238) : (!llvm.ptr, i64) -> i64
      %10240 = llvm.mlir.addressof @str859 : !llvm.ptr
      %10241 = arith.constant 7 : i64
      %10242 = func.call @cc_make_string(%10240, %10241) : (!llvm.ptr, i64) -> i64
      %10243 = func.call @cc_intern(%10239, %10242) : (i64, i64) -> i64
      %10244 = func.call @cc_nil_value() : () -> i64
      %10245 = func.call @cc_cons(%10243, %10244) : (i64, i64) -> i64
      %10246 = func.call @cc_values_pack(%10245) : (i64) -> i64
      %10247 = llvm.mlir.addressof @str860 : !llvm.ptr
      %10248 = arith.constant 6 : i64
      %10249 = func.call @cc_make_string(%10247, %10248) : (!llvm.ptr, i64) -> i64
      %10250 = func.call @cc_nil_value() : () -> i64
      %10251 = func.call @cc_intern(%10249, %10250) : (i64, i64) -> i64
      %10252 = func.call @cc_nil_value() : () -> i64
      %10253 = func.call @cc_cons(%10251, %10252) : (i64, i64) -> i64
      %10254 = func.call @cc_values_pack(%10253) : (i64) -> i64
      %__rlasp_stack_elide_zero_488 = arith.constant 0 : i64
      %10255 = arith.addi %10251, %__rlasp_stack_elide_zero_488 : i64
      %10256 = func.call @cc_nil_value() : () -> i64
      %10257 = func.call @cc_errorp(%9976) : (i64) -> i64
      %10258 = arith.cmpi ne, %10257, %10256 : i64
      %10259 = arith.cmpi eq, %10256, %10256 : i64
      %10260 = arith.andi %10258, %10259 : i1
      %10261 = scf.if %10260 -> (i64) {
        scf.yield %9976 : i64
      } else {
        scf.yield %10256 : i64
      }
      %10262 = func.call @cc_errorp(%10159) : (i64) -> i64
      %10263 = arith.cmpi ne, %10262, %10256 : i64
      %10264 = arith.cmpi eq, %10261, %10256 : i64
      %10265 = arith.andi %10263, %10264 : i1
      %10266 = scf.if %10265 -> (i64) {
        scf.yield %10159 : i64
      } else {
        scf.yield %10261 : i64
      }
      %10267 = func.call @cc_errorp(%10218) : (i64) -> i64
      %10268 = arith.cmpi ne, %10267, %10256 : i64
      %10269 = arith.cmpi eq, %10266, %10256 : i64
      %10270 = arith.andi %10268, %10269 : i1
      %10271 = scf.if %10270 -> (i64) {
        scf.yield %10218 : i64
      } else {
        scf.yield %10266 : i64
      }
      %10272 = func.call @cc_errorp(%10225) : (i64) -> i64
      %10273 = arith.cmpi ne, %10272, %10256 : i64
      %10274 = arith.cmpi eq, %10271, %10256 : i64
      %10275 = arith.andi %10273, %10274 : i1
      %10276 = scf.if %10275 -> (i64) {
        scf.yield %10225 : i64
      } else {
        scf.yield %10271 : i64
      }
      %10277 = func.call @cc_errorp(%10232) : (i64) -> i64
      %10278 = arith.cmpi ne, %10277, %10256 : i64
      %10279 = arith.cmpi eq, %10276, %10256 : i64
      %10280 = arith.andi %10278, %10279 : i1
      %10281 = scf.if %10280 -> (i64) {
        scf.yield %10232 : i64
      } else {
        scf.yield %10276 : i64
      }
      %10282 = func.call @cc_errorp(%10236) : (i64) -> i64
      %10283 = arith.cmpi ne, %10282, %10256 : i64
      %10284 = arith.cmpi eq, %10281, %10256 : i64
      %10285 = arith.andi %10283, %10284 : i1
      %10286 = scf.if %10285 -> (i64) {
        scf.yield %10236 : i64
      } else {
        scf.yield %10281 : i64
      }
      %10287 = func.call @cc_errorp(%10243) : (i64) -> i64
      %10288 = arith.cmpi ne, %10287, %10256 : i64
      %10289 = arith.cmpi eq, %10286, %10256 : i64
      %10290 = arith.andi %10288, %10289 : i1
      %10291 = scf.if %10290 -> (i64) {
        scf.yield %10243 : i64
      } else {
        scf.yield %10286 : i64
      }
      %10292 = func.call @cc_errorp(%10255) : (i64) -> i64
      %10293 = arith.cmpi ne, %10292, %10256 : i64
      %10294 = arith.cmpi eq, %10291, %10256 : i64
      %10295 = arith.andi %10293, %10294 : i1
      %10296 = scf.if %10295 -> (i64) {
        scf.yield %10255 : i64
      } else {
        scf.yield %10291 : i64
      }
      %10297 = arith.cmpi ne, %10296, %10256 : i64
      scf.if %10297 {
        func.call @stack_push_pointer(%10296) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9976) : (i64) -> ()
        func.call @stack_push_pointer(%10159) : (i64) -> ()
        func.call @stack_push_pointer(%10218) : (i64) -> ()
        func.call @stack_push_pointer(%10225) : (i64) -> ()
        func.call @stack_push_pointer(%10232) : (i64) -> ()
        func.call @stack_push_pointer(%10236) : (i64) -> ()
        func.call @stack_push_pointer(%10243) : (i64) -> ()
        func.call @stack_push_pointer(%10255) : (i64) -> ()
        %10298 = llvm.mlir.addressof @str861 : !llvm.ptr
        %10299 = func.call @cc_make_function_ref_const(%10298) : (!llvm.ptr) -> i64
        %10300 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10299, %10300) : (i64, i64) -> ()
      }
      %10301 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10301 : i64
    }
    %10302 = func.call @cc_nil_value() : () -> i64
    %10303 = func.call @cc_errorp(%9967) : (i64) -> i64
    %10304 = arith.cmpi ne, %10303, %10302 : i64
    %10305 = scf.if %10304 -> (i64) {
      scf.yield %9967 : i64
    } else {
      %10306 = llvm.mlir.addressof @str862 : !llvm.ptr
      %10307 = arith.constant 4 : i64
      %10308 = func.call @cc_make_string(%10306, %10307) : (!llvm.ptr, i64) -> i64
      %10309 = llvm.mlir.addressof @str863 : !llvm.ptr
      %10310 = arith.constant 11 : i64
      %10311 = func.call @cc_make_string(%10309, %10310) : (!llvm.ptr, i64) -> i64
      %10312 = func.call @cc_intern(%10308, %10311) : (i64, i64) -> i64
      %10313 = func.call @cc_nil_value() : () -> i64
      %10314 = func.call @cc_cons(%10312, %10313) : (i64, i64) -> i64
      %10315 = func.call @cc_values_pack(%10314) : (i64) -> i64
      %__rlasp_stack_elide_zero_489 = arith.constant 0 : i64
      %10316 = arith.addi %10312, %__rlasp_stack_elide_zero_489 : i64
      %10317 = llvm.mlir.addressof @str864 : !llvm.ptr
      %10318 = arith.constant 3 : i64
      %10319 = func.call @cc_make_string(%10317, %10318) : (!llvm.ptr, i64) -> i64
      %10320 = func.call @cc_nil_value() : () -> i64
      %10321 = func.call @cc_intern(%10319, %10320) : (i64, i64) -> i64
      %10322 = func.call @cc_nil_value() : () -> i64
      %10323 = func.call @cc_cons(%10321, %10322) : (i64, i64) -> i64
      %10324 = func.call @cc_values_pack(%10323) : (i64) -> i64
      func.call @stack_push_pointer(%10321) : (i64) -> ()
      %10325 = llvm.mlir.addressof @str865 : !llvm.ptr
      %10326 = arith.constant 3 : i64
      %10327 = func.call @cc_make_string(%10325, %10326) : (!llvm.ptr, i64) -> i64
      %10328 = func.call @cc_nil_value() : () -> i64
      %10329 = func.call @cc_intern(%10327, %10328) : (i64, i64) -> i64
      %10330 = func.call @cc_nil_value() : () -> i64
      %10331 = func.call @cc_cons(%10329, %10330) : (i64, i64) -> i64
      %10332 = func.call @cc_values_pack(%10331) : (i64) -> i64
      func.call @stack_push_pointer(%10329) : (i64) -> ()
      %10333 = llvm.mlir.addressof @str866 : !llvm.ptr
      %10334 = arith.constant 5 : i64
      %10335 = func.call @cc_make_string(%10333, %10334) : (!llvm.ptr, i64) -> i64
      %10336 = func.call @cc_nil_value() : () -> i64
      %10337 = func.call @cc_intern(%10335, %10336) : (i64, i64) -> i64
      %10338 = func.call @cc_nil_value() : () -> i64
      %10339 = func.call @cc_cons(%10337, %10338) : (i64, i64) -> i64
      %10340 = func.call @cc_values_pack(%10339) : (i64) -> i64
      func.call @stack_push_pointer(%10337) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10341 = llvm.mlir.addressof @str867 : !llvm.ptr
      %10342 = arith.constant 3 : i64
      %10343 = func.call @cc_make_string(%10341, %10342) : (!llvm.ptr, i64) -> i64
      %10344 = func.call @cc_nil_value() : () -> i64
      %10345 = func.call @cc_intern(%10343, %10344) : (i64, i64) -> i64
      %10346 = func.call @cc_nil_value() : () -> i64
      %10347 = func.call @cc_cons(%10345, %10346) : (i64, i64) -> i64
      %10348 = func.call @cc_values_pack(%10347) : (i64) -> i64
      func.call @stack_push_pointer(%10345) : (i64) -> ()
      %10349 = llvm.mlir.addressof @str868 : !llvm.ptr
      %10350 = arith.constant 22 : i64
      %10351 = func.call @cc_make_string(%10349, %10350) : (!llvm.ptr, i64) -> i64
      %10352 = llvm.mlir.addressof @str869 : !llvm.ptr
      %10353 = arith.constant 3 : i64
      %10354 = func.call @cc_make_string(%10352, %10353) : (!llvm.ptr, i64) -> i64
      %10355 = func.call @cc_intern(%10351, %10354) : (i64, i64) -> i64
      %10356 = func.call @cc_nil_value() : () -> i64
      %10357 = func.call @cc_cons(%10355, %10356) : (i64, i64) -> i64
      %10358 = func.call @cc_values_pack(%10357) : (i64) -> i64
      func.call @stack_push_pointer(%10355) : (i64) -> ()
      %10359 = llvm.mlir.addressof @str870 : !llvm.ptr
      %10360 = arith.constant 6 : i64
      %10361 = func.call @cc_make_string(%10359, %10360) : (!llvm.ptr, i64) -> i64
      %10362 = func.call @cc_nil_value() : () -> i64
      %10363 = func.call @cc_intern(%10361, %10362) : (i64, i64) -> i64
      %10364 = func.call @cc_nil_value() : () -> i64
      %10365 = func.call @cc_cons(%10363, %10364) : (i64, i64) -> i64
      %10366 = func.call @cc_values_pack(%10365) : (i64) -> i64
      func.call @stack_push_pointer(%10363) : (i64) -> ()
      %10367 = llvm.mlir.addressof @str871 : !llvm.ptr
      %10368 = arith.constant 9 : i64
      %10369 = func.call @cc_make_string(%10367, %10368) : (!llvm.ptr, i64) -> i64
      %10370 = llvm.mlir.addressof @str872 : !llvm.ptr
      %10371 = arith.constant 11 : i64
      %10372 = func.call @cc_make_string(%10370, %10371) : (!llvm.ptr, i64) -> i64
      %10373 = func.call @cc_intern(%10369, %10372) : (i64, i64) -> i64
      %10374 = func.call @cc_nil_value() : () -> i64
      %10375 = func.call @cc_cons(%10373, %10374) : (i64, i64) -> i64
      %10376 = func.call @cc_values_pack(%10375) : (i64) -> i64
      func.call @stack_push_pointer(%10373) : (i64) -> ()
      %10377 = llvm.mlir.addressof @str873 : !llvm.ptr
      %10378 = arith.constant 8 : i64
      %10379 = func.call @cc_make_string(%10377, %10378) : (!llvm.ptr, i64) -> i64
      %10380 = func.call @cc_nil_value() : () -> i64
      %10381 = func.call @cc_intern(%10379, %10380) : (i64, i64) -> i64
      %10382 = func.call @cc_nil_value() : () -> i64
      %10383 = func.call @cc_cons(%10381, %10382) : (i64, i64) -> i64
      %10384 = func.call @cc_values_pack(%10383) : (i64) -> i64
      func.call @stack_push_pointer(%10381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10385 = func.call @stack_pop_pointer() : () -> i64
      %10386 = func.call @stack_pop_pointer() : () -> i64
      %10387 = func.call @cc_cons(%10386, %10385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_490 = arith.constant 0 : i64
      %10388 = arith.addi %10387, %__rlasp_stack_elide_zero_490 : i64
      %10389 = func.call @stack_pop_pointer() : () -> i64
      %10390 = func.call @cc_cons(%10389, %10388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10390) : (i64) -> ()
      %10391 = llvm.mlir.addressof @str874 : !llvm.ptr
      %10392 = arith.constant 7 : i64
      %10393 = func.call @cc_make_string(%10391, %10392) : (!llvm.ptr, i64) -> i64
      %10394 = llvm.mlir.addressof @str875 : !llvm.ptr
      %10395 = arith.constant 11 : i64
      %10396 = func.call @cc_make_string(%10394, %10395) : (!llvm.ptr, i64) -> i64
      %10397 = func.call @cc_intern(%10393, %10396) : (i64, i64) -> i64
      %10398 = func.call @cc_nil_value() : () -> i64
      %10399 = func.call @cc_cons(%10397, %10398) : (i64, i64) -> i64
      %10400 = func.call @cc_values_pack(%10399) : (i64) -> i64
      func.call @stack_push_pointer(%10397) : (i64) -> ()
      %10401 = llvm.mlir.addressof @str876 : !llvm.ptr
      %10402 = arith.constant 6 : i64
      %10403 = func.call @cc_make_string(%10401, %10402) : (!llvm.ptr, i64) -> i64
      %10404 = llvm.mlir.addressof @str877 : !llvm.ptr
      %10405 = arith.constant 11 : i64
      %10406 = func.call @cc_make_string(%10404, %10405) : (!llvm.ptr, i64) -> i64
      %10407 = func.call @cc_intern(%10403, %10406) : (i64, i64) -> i64
      %10408 = func.call @cc_nil_value() : () -> i64
      %10409 = func.call @cc_cons(%10407, %10408) : (i64, i64) -> i64
      %10410 = func.call @cc_values_pack(%10409) : (i64) -> i64
      func.call @stack_push_pointer(%10407) : (i64) -> ()
      %10411 = llvm.mlir.addressof @str878 : !llvm.ptr
      %10412 = arith.constant 8 : i64
      %10413 = func.call @cc_make_string(%10411, %10412) : (!llvm.ptr, i64) -> i64
      %10414 = func.call @cc_nil_value() : () -> i64
      %10415 = func.call @cc_intern(%10413, %10414) : (i64, i64) -> i64
      %10416 = func.call @cc_nil_value() : () -> i64
      %10417 = func.call @cc_cons(%10415, %10416) : (i64, i64) -> i64
      %10418 = func.call @cc_values_pack(%10417) : (i64) -> i64
      func.call @stack_push_pointer(%10415) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10419 = func.call @stack_pop_pointer() : () -> i64
      %10420 = func.call @stack_pop_pointer() : () -> i64
      %10421 = func.call @cc_cons(%10420, %10419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_491 = arith.constant 0 : i64
      %10422 = arith.addi %10421, %__rlasp_stack_elide_zero_491 : i64
      %10423 = func.call @stack_pop_pointer() : () -> i64
      %10424 = func.call @cc_cons(%10423, %10422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10425 = func.call @stack_pop_pointer() : () -> i64
      %10426 = func.call @stack_pop_pointer() : () -> i64
      %10427 = func.call @cc_cons(%10426, %10425) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_492 = arith.constant 0 : i64
      %10428 = arith.addi %10427, %__rlasp_stack_elide_zero_492 : i64
      %10429 = func.call @stack_pop_pointer() : () -> i64
      %10430 = func.call @cc_cons(%10429, %10428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10430) : (i64) -> ()
      %10431 = llvm.mlir.addressof @str879 : !llvm.ptr
      %10432 = arith.constant 11 : i64
      %10433 = func.call @cc_make_string(%10431, %10432) : (!llvm.ptr, i64) -> i64
      %10434 = func.call @cc_nil_value() : () -> i64
      %10435 = func.call @cc_intern(%10433, %10434) : (i64, i64) -> i64
      %10436 = func.call @cc_nil_value() : () -> i64
      %10437 = func.call @cc_cons(%10435, %10436) : (i64, i64) -> i64
      %10438 = func.call @cc_values_pack(%10437) : (i64) -> i64
      func.call @stack_push_pointer(%10435) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10439 = llvm.mlir.addressof @str880 : !llvm.ptr
      %10440 = arith.constant 5 : i64
      %10441 = func.call @cc_make_string(%10439, %10440) : (!llvm.ptr, i64) -> i64
      %10442 = llvm.mlir.addressof @str881 : !llvm.ptr
      %10443 = arith.constant 11 : i64
      %10444 = func.call @cc_make_string(%10442, %10443) : (!llvm.ptr, i64) -> i64
      %10445 = func.call @cc_intern(%10441, %10444) : (i64, i64) -> i64
      %10446 = func.call @cc_nil_value() : () -> i64
      %10447 = func.call @cc_cons(%10445, %10446) : (i64, i64) -> i64
      %10448 = func.call @cc_values_pack(%10447) : (i64) -> i64
      func.call @stack_push_pointer(%10445) : (i64) -> ()
      %10449 = llvm.mlir.addressof @str882 : !llvm.ptr
      %10450 = arith.constant 9 : i64
      %10451 = func.call @cc_make_string(%10449, %10450) : (!llvm.ptr, i64) -> i64
      %10452 = llvm.mlir.addressof @str883 : !llvm.ptr
      %10453 = arith.constant 11 : i64
      %10454 = func.call @cc_make_string(%10452, %10453) : (!llvm.ptr, i64) -> i64
      %10455 = func.call @cc_intern(%10451, %10454) : (i64, i64) -> i64
      %10456 = func.call @cc_nil_value() : () -> i64
      %10457 = func.call @cc_cons(%10455, %10456) : (i64, i64) -> i64
      %10458 = func.call @cc_values_pack(%10457) : (i64) -> i64
      func.call @stack_push_pointer(%10455) : (i64) -> ()
      %10459 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%10459) : (i64) -> ()
      %10460 = llvm.mlir.addressof @str884 : !llvm.ptr
      %10461 = arith.constant 9 : i64
      %10462 = func.call @cc_make_string(%10460, %10461) : (!llvm.ptr, i64) -> i64
      %10463 = llvm.mlir.addressof @str885 : !llvm.ptr
      %10464 = arith.constant 11 : i64
      %10465 = func.call @cc_make_string(%10463, %10464) : (!llvm.ptr, i64) -> i64
      %10466 = func.call @cc_intern(%10462, %10465) : (i64, i64) -> i64
      %10467 = func.call @cc_nil_value() : () -> i64
      %10468 = func.call @cc_cons(%10466, %10467) : (i64, i64) -> i64
      %10469 = func.call @cc_values_pack(%10468) : (i64) -> i64
      %__rlasp_stack_elide_zero_493 = arith.constant 0 : i64
      %10470 = arith.addi %10466, %__rlasp_stack_elide_zero_493 : i64
      %10471 = func.call @stack_pop_pointer() : () -> i64
      %10472 = func.call @cc_cons(%10470, %10471) : (i64, i64) -> i64
      %10473 = llvm.mlir.addressof @str886 : !llvm.ptr
      %10474 = arith.constant 5 : i64
      %10475 = func.call @cc_make_string(%10473, %10474) : (!llvm.ptr, i64) -> i64
      %10476 = func.call @cc_nil_value() : () -> i64
      %10477 = func.call @cc_intern(%10475, %10476) : (i64, i64) -> i64
      %10478 = func.call @cc_nil_value() : () -> i64
      %10479 = func.call @cc_cons(%10477, %10478) : (i64, i64) -> i64
      %10480 = func.call @cc_values_pack(%10479) : (i64) -> i64
      %10481 = func.call @cc_cons(%10477, %10472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10482 = func.call @stack_pop_pointer() : () -> i64
      %10483 = func.call @stack_pop_pointer() : () -> i64
      %10484 = func.call @cc_cons(%10483, %10482) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_494 = arith.constant 0 : i64
      %10485 = arith.addi %10484, %__rlasp_stack_elide_zero_494 : i64
      %10486 = func.call @stack_pop_pointer() : () -> i64
      %10487 = func.call @cc_cons(%10486, %10485) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_495 = arith.constant 0 : i64
      %10488 = arith.addi %10487, %__rlasp_stack_elide_zero_495 : i64
      %10489 = func.call @stack_pop_pointer() : () -> i64
      %10490 = func.call @cc_cons(%10489, %10488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10490) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10491 = func.call @stack_pop_pointer() : () -> i64
      %10492 = func.call @stack_pop_pointer() : () -> i64
      %10493 = func.call @cc_cons(%10492, %10491) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_496 = arith.constant 0 : i64
      %10494 = arith.addi %10493, %__rlasp_stack_elide_zero_496 : i64
      %10495 = func.call @stack_pop_pointer() : () -> i64
      %10496 = func.call @cc_cons(%10495, %10494) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_497 = arith.constant 0 : i64
      %10497 = arith.addi %10496, %__rlasp_stack_elide_zero_497 : i64
      %10498 = func.call @stack_pop_pointer() : () -> i64
      %10499 = func.call @cc_cons(%10498, %10497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10499) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10500 = func.call @stack_pop_pointer() : () -> i64
      %10501 = func.call @stack_pop_pointer() : () -> i64
      %10502 = func.call @cc_cons(%10501, %10500) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_498 = arith.constant 0 : i64
      %10503 = arith.addi %10502, %__rlasp_stack_elide_zero_498 : i64
      %10504 = func.call @stack_pop_pointer() : () -> i64
      %10505 = func.call @cc_cons(%10504, %10503) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_499 = arith.constant 0 : i64
      %10506 = arith.addi %10505, %__rlasp_stack_elide_zero_499 : i64
      %10507 = func.call @stack_pop_pointer() : () -> i64
      %10508 = func.call @cc_cons(%10507, %10506) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_500 = arith.constant 0 : i64
      %10509 = arith.addi %10508, %__rlasp_stack_elide_zero_500 : i64
      %10510 = func.call @stack_pop_pointer() : () -> i64
      %10511 = func.call @cc_cons(%10510, %10509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10512 = func.call @stack_pop_pointer() : () -> i64
      %10513 = func.call @stack_pop_pointer() : () -> i64
      %10514 = func.call @cc_cons(%10513, %10512) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_501 = arith.constant 0 : i64
      %10515 = arith.addi %10514, %__rlasp_stack_elide_zero_501 : i64
      %10516 = func.call @stack_pop_pointer() : () -> i64
      %10517 = func.call @cc_cons(%10516, %10515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10517) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10518 = func.call @stack_pop_pointer() : () -> i64
      %10519 = func.call @stack_pop_pointer() : () -> i64
      %10520 = func.call @cc_cons(%10519, %10518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10520) : (i64) -> ()
      %10521 = llvm.mlir.addressof @str887 : !llvm.ptr
      %10522 = arith.constant 4 : i64
      %10523 = func.call @cc_make_string(%10521, %10522) : (!llvm.ptr, i64) -> i64
      %10524 = llvm.mlir.addressof @str888 : !llvm.ptr
      %10525 = arith.constant 11 : i64
      %10526 = func.call @cc_make_string(%10524, %10525) : (!llvm.ptr, i64) -> i64
      %10527 = func.call @cc_intern(%10523, %10526) : (i64, i64) -> i64
      %10528 = func.call @cc_nil_value() : () -> i64
      %10529 = func.call @cc_cons(%10527, %10528) : (i64, i64) -> i64
      %10530 = func.call @cc_values_pack(%10529) : (i64) -> i64
      func.call @stack_push_pointer(%10527) : (i64) -> ()
      %10531 = llvm.mlir.addressof @str889 : !llvm.ptr
      %10532 = arith.constant 5 : i64
      %10533 = func.call @cc_make_string(%10531, %10532) : (!llvm.ptr, i64) -> i64
      %10534 = llvm.mlir.addressof @str890 : !llvm.ptr
      %10535 = arith.constant 11 : i64
      %10536 = func.call @cc_make_string(%10534, %10535) : (!llvm.ptr, i64) -> i64
      %10537 = func.call @cc_intern(%10533, %10536) : (i64, i64) -> i64
      %10538 = func.call @cc_nil_value() : () -> i64
      %10539 = func.call @cc_cons(%10537, %10538) : (i64, i64) -> i64
      %10540 = func.call @cc_values_pack(%10539) : (i64) -> i64
      func.call @stack_push_pointer(%10537) : (i64) -> ()
      %10541 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%10541) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10542 = func.call @stack_pop_pointer() : () -> i64
      %10543 = func.call @stack_pop_pointer() : () -> i64
      %10544 = func.call @cc_cons(%10543, %10542) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_502 = arith.constant 0 : i64
      %10545 = arith.addi %10544, %__rlasp_stack_elide_zero_502 : i64
      %10546 = func.call @stack_pop_pointer() : () -> i64
      %10547 = func.call @cc_cons(%10546, %10545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10547) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10548 = func.call @stack_pop_pointer() : () -> i64
      %10549 = func.call @stack_pop_pointer() : () -> i64
      %10550 = func.call @cc_cons(%10549, %10548) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_503 = arith.constant 0 : i64
      %10551 = arith.addi %10550, %__rlasp_stack_elide_zero_503 : i64
      %10552 = func.call @stack_pop_pointer() : () -> i64
      %10553 = func.call @cc_cons(%10552, %10551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10553) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10554 = func.call @stack_pop_pointer() : () -> i64
      %10555 = func.call @stack_pop_pointer() : () -> i64
      %10556 = func.call @cc_cons(%10555, %10554) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_504 = arith.constant 0 : i64
      %10557 = arith.addi %10556, %__rlasp_stack_elide_zero_504 : i64
      %10558 = func.call @stack_pop_pointer() : () -> i64
      %10559 = func.call @cc_cons(%10558, %10557) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_505 = arith.constant 0 : i64
      %10560 = arith.addi %10559, %__rlasp_stack_elide_zero_505 : i64
      %10561 = func.call @stack_pop_pointer() : () -> i64
      %10562 = func.call @cc_cons(%10561, %10560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10562) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10563 = func.call @stack_pop_pointer() : () -> i64
      %10564 = func.call @stack_pop_pointer() : () -> i64
      %10565 = func.call @cc_cons(%10564, %10563) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_506 = arith.constant 0 : i64
      %10566 = arith.addi %10565, %__rlasp_stack_elide_zero_506 : i64
      %10567 = func.call @stack_pop_pointer() : () -> i64
      %10568 = func.call @cc_cons(%10567, %10566) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_507 = arith.constant 0 : i64
      %10569 = arith.addi %10568, %__rlasp_stack_elide_zero_507 : i64
      %10570 = func.call @stack_pop_pointer() : () -> i64
      %10571 = func.call @cc_cons(%10570, %10569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10571) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10572 = func.call @stack_pop_pointer() : () -> i64
      %10573 = func.call @stack_pop_pointer() : () -> i64
      %10574 = func.call @cc_cons(%10573, %10572) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_508 = arith.constant 0 : i64
      %10575 = arith.addi %10574, %__rlasp_stack_elide_zero_508 : i64
      %10576 = func.call @stack_pop_pointer() : () -> i64
      %10577 = func.call @cc_cons(%10576, %10575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10577) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10578 = func.call @stack_pop_pointer() : () -> i64
      %10579 = func.call @stack_pop_pointer() : () -> i64
      %10580 = func.call @cc_cons(%10579, %10578) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_509 = arith.constant 0 : i64
      %10581 = arith.addi %10580, %__rlasp_stack_elide_zero_509 : i64
      %10582 = func.call @stack_pop_pointer() : () -> i64
      %10583 = func.call @cc_cons(%10582, %10581) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_510 = arith.constant 0 : i64
      %10584 = arith.addi %10583, %__rlasp_stack_elide_zero_510 : i64
      %10754 = arith.constant 97047688511578 : i64
      %10755 = arith.constant 0 : i64
      %10756 = func.call @cc_make_closure(%10754, %10755) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_511 = arith.constant 0 : i64
      %10757 = arith.addi %10756, %__rlasp_stack_elide_zero_511 : i64
      %10758 = llvm.mlir.addressof @str904 : !llvm.ptr
      %10759 = arith.constant 1 : i64
      %10760 = func.call @cc_make_string(%10758, %10759) : (!llvm.ptr, i64) -> i64
      %10761 = func.call @cc_nil_value() : () -> i64
      %10762 = func.call @cc_intern(%10760, %10761) : (i64, i64) -> i64
      %10763 = func.call @cc_nil_value() : () -> i64
      %10764 = func.call @cc_cons(%10762, %10763) : (i64, i64) -> i64
      %10765 = func.call @cc_values_pack(%10764) : (i64) -> i64
      func.call @stack_push_pointer(%10762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10766 = func.call @stack_pop_pointer() : () -> i64
      %10767 = func.call @stack_pop_pointer() : () -> i64
      %10768 = func.call @cc_cons(%10767, %10766) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_512 = arith.constant 0 : i64
      %10769 = arith.addi %10768, %__rlasp_stack_elide_zero_512 : i64
      %10770 = llvm.mlir.addressof @str905 : !llvm.ptr
      %10771 = arith.constant 11 : i64
      %10772 = func.call @cc_make_string(%10770, %10771) : (!llvm.ptr, i64) -> i64
      %10773 = llvm.mlir.addressof @str906 : !llvm.ptr
      %10774 = arith.constant 7 : i64
      %10775 = func.call @cc_make_string(%10773, %10774) : (!llvm.ptr, i64) -> i64
      %10776 = func.call @cc_intern(%10772, %10775) : (i64, i64) -> i64
      %10777 = func.call @cc_nil_value() : () -> i64
      %10778 = func.call @cc_cons(%10776, %10777) : (i64, i64) -> i64
      %10779 = func.call @cc_values_pack(%10778) : (i64) -> i64
      %10780 = func.call @cc_nil_value() : () -> i64
      %10781 = llvm.mlir.addressof @str907 : !llvm.ptr
      %10782 = arith.constant 4 : i64
      %10783 = func.call @cc_make_string(%10781, %10782) : (!llvm.ptr, i64) -> i64
      %10784 = llvm.mlir.addressof @str908 : !llvm.ptr
      %10785 = arith.constant 7 : i64
      %10786 = func.call @cc_make_string(%10784, %10785) : (!llvm.ptr, i64) -> i64
      %10787 = func.call @cc_intern(%10783, %10786) : (i64, i64) -> i64
      %10788 = func.call @cc_nil_value() : () -> i64
      %10789 = func.call @cc_cons(%10787, %10788) : (i64, i64) -> i64
      %10790 = func.call @cc_values_pack(%10789) : (i64) -> i64
      %10791 = llvm.mlir.addressof @str909 : !llvm.ptr
      %10792 = arith.constant 6 : i64
      %10793 = func.call @cc_make_string(%10791, %10792) : (!llvm.ptr, i64) -> i64
      %10794 = func.call @cc_nil_value() : () -> i64
      %10795 = func.call @cc_intern(%10793, %10794) : (i64, i64) -> i64
      %10796 = func.call @cc_nil_value() : () -> i64
      %10797 = func.call @cc_cons(%10795, %10796) : (i64, i64) -> i64
      %10798 = func.call @cc_values_pack(%10797) : (i64) -> i64
      %__rlasp_stack_elide_zero_513 = arith.constant 0 : i64
      %10799 = arith.addi %10795, %__rlasp_stack_elide_zero_513 : i64
      %10800 = func.call @cc_nil_value() : () -> i64
      %10801 = func.call @cc_errorp(%10316) : (i64) -> i64
      %10802 = arith.cmpi ne, %10801, %10800 : i64
      %10803 = arith.cmpi eq, %10800, %10800 : i64
      %10804 = arith.andi %10802, %10803 : i1
      %10805 = scf.if %10804 -> (i64) {
        scf.yield %10316 : i64
      } else {
        scf.yield %10800 : i64
      }
      %10806 = func.call @cc_errorp(%10584) : (i64) -> i64
      %10807 = arith.cmpi ne, %10806, %10800 : i64
      %10808 = arith.cmpi eq, %10805, %10800 : i64
      %10809 = arith.andi %10807, %10808 : i1
      %10810 = scf.if %10809 -> (i64) {
        scf.yield %10584 : i64
      } else {
        scf.yield %10805 : i64
      }
      %10811 = func.call @cc_errorp(%10757) : (i64) -> i64
      %10812 = arith.cmpi ne, %10811, %10800 : i64
      %10813 = arith.cmpi eq, %10810, %10800 : i64
      %10814 = arith.andi %10812, %10813 : i1
      %10815 = scf.if %10814 -> (i64) {
        scf.yield %10757 : i64
      } else {
        scf.yield %10810 : i64
      }
      %10816 = func.call @cc_errorp(%10769) : (i64) -> i64
      %10817 = arith.cmpi ne, %10816, %10800 : i64
      %10818 = arith.cmpi eq, %10815, %10800 : i64
      %10819 = arith.andi %10817, %10818 : i1
      %10820 = scf.if %10819 -> (i64) {
        scf.yield %10769 : i64
      } else {
        scf.yield %10815 : i64
      }
      %10821 = func.call @cc_errorp(%10776) : (i64) -> i64
      %10822 = arith.cmpi ne, %10821, %10800 : i64
      %10823 = arith.cmpi eq, %10820, %10800 : i64
      %10824 = arith.andi %10822, %10823 : i1
      %10825 = scf.if %10824 -> (i64) {
        scf.yield %10776 : i64
      } else {
        scf.yield %10820 : i64
      }
      %10826 = func.call @cc_errorp(%10780) : (i64) -> i64
      %10827 = arith.cmpi ne, %10826, %10800 : i64
      %10828 = arith.cmpi eq, %10825, %10800 : i64
      %10829 = arith.andi %10827, %10828 : i1
      %10830 = scf.if %10829 -> (i64) {
        scf.yield %10780 : i64
      } else {
        scf.yield %10825 : i64
      }
      %10831 = func.call @cc_errorp(%10787) : (i64) -> i64
      %10832 = arith.cmpi ne, %10831, %10800 : i64
      %10833 = arith.cmpi eq, %10830, %10800 : i64
      %10834 = arith.andi %10832, %10833 : i1
      %10835 = scf.if %10834 -> (i64) {
        scf.yield %10787 : i64
      } else {
        scf.yield %10830 : i64
      }
      %10836 = func.call @cc_errorp(%10799) : (i64) -> i64
      %10837 = arith.cmpi ne, %10836, %10800 : i64
      %10838 = arith.cmpi eq, %10835, %10800 : i64
      %10839 = arith.andi %10837, %10838 : i1
      %10840 = scf.if %10839 -> (i64) {
        scf.yield %10799 : i64
      } else {
        scf.yield %10835 : i64
      }
      %10841 = arith.cmpi ne, %10840, %10800 : i64
      scf.if %10841 {
        func.call @stack_push_pointer(%10840) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10316) : (i64) -> ()
        func.call @stack_push_pointer(%10584) : (i64) -> ()
        func.call @stack_push_pointer(%10757) : (i64) -> ()
        func.call @stack_push_pointer(%10769) : (i64) -> ()
        func.call @stack_push_pointer(%10776) : (i64) -> ()
        func.call @stack_push_pointer(%10780) : (i64) -> ()
        func.call @stack_push_pointer(%10787) : (i64) -> ()
        func.call @stack_push_pointer(%10799) : (i64) -> ()
        %10842 = llvm.mlir.addressof @str910 : !llvm.ptr
        %10843 = func.call @cc_make_function_ref_const(%10842) : (!llvm.ptr) -> i64
        %10844 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10843, %10844) : (i64, i64) -> ()
      }
      %10845 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10845 : i64
    }
    %10846 = func.call @cc_nil_value() : () -> i64
    %10847 = func.call @cc_errorp(%10305) : (i64) -> i64
    %10848 = arith.cmpi ne, %10847, %10846 : i64
    %10849 = scf.if %10848 -> (i64) {
      scf.yield %10305 : i64
    } else {
      %10850 = llvm.mlir.addressof @str911 : !llvm.ptr
      %10851 = arith.constant 15 : i64
      %10852 = func.call @cc_make_string(%10850, %10851) : (!llvm.ptr, i64) -> i64
      %10853 = func.call @cc_nil_value() : () -> i64
      %10854 = func.call @cc_intern(%10852, %10853) : (i64, i64) -> i64
      %10855 = func.call @cc_nil_value() : () -> i64
      %10856 = func.call @cc_cons(%10854, %10855) : (i64, i64) -> i64
      %10857 = func.call @cc_values_pack(%10856) : (i64) -> i64
      %__rlasp_stack_elide_zero_514 = arith.constant 0 : i64
      %10858 = arith.addi %10854, %__rlasp_stack_elide_zero_514 : i64
      %10859 = llvm.mlir.addressof @str912 : !llvm.ptr
      %10860 = arith.constant 6 : i64
      %10861 = func.call @cc_make_string(%10859, %10860) : (!llvm.ptr, i64) -> i64
      %10862 = llvm.mlir.addressof @str913 : !llvm.ptr
      %10863 = arith.constant 11 : i64
      %10864 = func.call @cc_make_string(%10862, %10863) : (!llvm.ptr, i64) -> i64
      %10865 = func.call @cc_intern(%10861, %10864) : (i64, i64) -> i64
      %10866 = func.call @cc_nil_value() : () -> i64
      %10867 = func.call @cc_cons(%10865, %10866) : (i64, i64) -> i64
      %10868 = func.call @cc_values_pack(%10867) : (i64) -> i64
      func.call @stack_push_pointer(%10865) : (i64) -> ()
      %10869 = llvm.mlir.addressof @str914 : !llvm.ptr
      %10870 = arith.constant 5 : i64
      %10871 = func.call @cc_make_string(%10869, %10870) : (!llvm.ptr, i64) -> i64
      %10872 = func.call @cc_nil_value() : () -> i64
      %10873 = func.call @cc_intern(%10871, %10872) : (i64, i64) -> i64
      %10874 = func.call @cc_nil_value() : () -> i64
      %10875 = func.call @cc_cons(%10873, %10874) : (i64, i64) -> i64
      %10876 = func.call @cc_values_pack(%10875) : (i64) -> i64
      func.call @stack_push_pointer(%10873) : (i64) -> ()
      %10877 = llvm.mlir.addressof @str915 : !llvm.ptr
      %10878 = arith.constant 13 : i64
      %10879 = func.call @cc_make_string(%10877, %10878) : (!llvm.ptr, i64) -> i64
      %10880 = llvm.mlir.addressof @str916 : !llvm.ptr
      %10881 = arith.constant 11 : i64
      %10882 = func.call @cc_make_string(%10880, %10881) : (!llvm.ptr, i64) -> i64
      %10883 = func.call @cc_intern(%10879, %10882) : (i64, i64) -> i64
      %10884 = func.call @cc_nil_value() : () -> i64
      %10885 = func.call @cc_cons(%10883, %10884) : (i64, i64) -> i64
      %10886 = func.call @cc_values_pack(%10885) : (i64) -> i64
      func.call @stack_push_pointer(%10883) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10887 = func.call @stack_pop_pointer() : () -> i64
      %10888 = func.call @stack_pop_pointer() : () -> i64
      %10889 = func.call @cc_cons(%10888, %10887) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10889) : (i64) -> ()
      %10890 = llvm.mlir.addressof @str917 : !llvm.ptr
      %10891 = arith.constant 15 : i64
      %10892 = func.call @cc_make_string(%10890, %10891) : (!llvm.ptr, i64) -> i64
      %10893 = llvm.mlir.addressof @str918 : !llvm.ptr
      %10894 = arith.constant 11 : i64
      %10895 = func.call @cc_make_string(%10893, %10894) : (!llvm.ptr, i64) -> i64
      %10896 = func.call @cc_intern(%10892, %10895) : (i64, i64) -> i64
      %10897 = func.call @cc_nil_value() : () -> i64
      %10898 = func.call @cc_cons(%10896, %10897) : (i64, i64) -> i64
      %10899 = func.call @cc_values_pack(%10898) : (i64) -> i64
      func.call @stack_push_pointer(%10896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10900 = func.call @stack_pop_pointer() : () -> i64
      %10901 = func.call @stack_pop_pointer() : () -> i64
      %10902 = func.call @cc_cons(%10901, %10900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10902) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10903 = func.call @stack_pop_pointer() : () -> i64
      %10904 = func.call @stack_pop_pointer() : () -> i64
      %10905 = func.call @cc_cons(%10904, %10903) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_515 = arith.constant 0 : i64
      %10906 = arith.addi %10905, %__rlasp_stack_elide_zero_515 : i64
      %10907 = func.call @stack_pop_pointer() : () -> i64
      %10908 = func.call @cc_cons(%10907, %10906) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_516 = arith.constant 0 : i64
      %10909 = arith.addi %10908, %__rlasp_stack_elide_zero_516 : i64
      %10910 = func.call @stack_pop_pointer() : () -> i64
      %10911 = func.call @cc_cons(%10910, %10909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10911) : (i64) -> ()
      %10912 = llvm.mlir.addressof @str919 : !llvm.ptr
      %10913 = arith.constant 5 : i64
      %10914 = func.call @cc_make_string(%10912, %10913) : (!llvm.ptr, i64) -> i64
      %10915 = func.call @cc_nil_value() : () -> i64
      %10916 = func.call @cc_intern(%10914, %10915) : (i64, i64) -> i64
      %10917 = func.call @cc_nil_value() : () -> i64
      %10918 = func.call @cc_cons(%10916, %10917) : (i64, i64) -> i64
      %10919 = func.call @cc_values_pack(%10918) : (i64) -> i64
      func.call @stack_push_pointer(%10916) : (i64) -> ()
      %10920 = llvm.mlir.addressof @str920 : !llvm.ptr
      %10921 = arith.constant 15 : i64
      %10922 = func.call @cc_make_string(%10920, %10921) : (!llvm.ptr, i64) -> i64
      %10923 = llvm.mlir.addressof @str921 : !llvm.ptr
      %10924 = arith.constant 11 : i64
      %10925 = func.call @cc_make_string(%10923, %10924) : (!llvm.ptr, i64) -> i64
      %10926 = func.call @cc_intern(%10922, %10925) : (i64, i64) -> i64
      %10927 = func.call @cc_nil_value() : () -> i64
      %10928 = func.call @cc_cons(%10926, %10927) : (i64, i64) -> i64
      %10929 = func.call @cc_values_pack(%10928) : (i64) -> i64
      func.call @stack_push_pointer(%10926) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10930 = func.call @stack_pop_pointer() : () -> i64
      %10931 = func.call @stack_pop_pointer() : () -> i64
      %10932 = func.call @cc_cons(%10931, %10930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10932) : (i64) -> ()
      %10933 = llvm.mlir.addressof @str922 : !llvm.ptr
      %10934 = arith.constant 15 : i64
      %10935 = func.call @cc_make_string(%10933, %10934) : (!llvm.ptr, i64) -> i64
      %10936 = llvm.mlir.addressof @str923 : !llvm.ptr
      %10937 = arith.constant 11 : i64
      %10938 = func.call @cc_make_string(%10936, %10937) : (!llvm.ptr, i64) -> i64
      %10939 = func.call @cc_intern(%10935, %10938) : (i64, i64) -> i64
      %10940 = func.call @cc_nil_value() : () -> i64
      %10941 = func.call @cc_cons(%10939, %10940) : (i64, i64) -> i64
      %10942 = func.call @cc_values_pack(%10941) : (i64) -> i64
      func.call @stack_push_pointer(%10939) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10943 = func.call @stack_pop_pointer() : () -> i64
      %10944 = func.call @stack_pop_pointer() : () -> i64
      %10945 = func.call @cc_cons(%10944, %10943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10945) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10946 = func.call @stack_pop_pointer() : () -> i64
      %10947 = func.call @stack_pop_pointer() : () -> i64
      %10948 = func.call @cc_cons(%10947, %10946) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_517 = arith.constant 0 : i64
      %10949 = arith.addi %10948, %__rlasp_stack_elide_zero_517 : i64
      %10950 = func.call @stack_pop_pointer() : () -> i64
      %10951 = func.call @cc_cons(%10950, %10949) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_518 = arith.constant 0 : i64
      %10952 = arith.addi %10951, %__rlasp_stack_elide_zero_518 : i64
      %10953 = func.call @stack_pop_pointer() : () -> i64
      %10954 = func.call @cc_cons(%10953, %10952) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10954) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10955 = func.call @stack_pop_pointer() : () -> i64
      %10956 = func.call @stack_pop_pointer() : () -> i64
      %10957 = func.call @cc_cons(%10956, %10955) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_519 = arith.constant 0 : i64
      %10958 = arith.addi %10957, %__rlasp_stack_elide_zero_519 : i64
      %10959 = func.call @stack_pop_pointer() : () -> i64
      %10960 = func.call @cc_cons(%10959, %10958) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_520 = arith.constant 0 : i64
      %10961 = arith.addi %10960, %__rlasp_stack_elide_zero_520 : i64
      %10962 = func.call @stack_pop_pointer() : () -> i64
      %10963 = func.call @cc_cons(%10962, %10961) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_521 = arith.constant 0 : i64
      %10964 = arith.addi %10963, %__rlasp_stack_elide_zero_521 : i64
      %11021 = arith.constant 97047688511581 : i64
      %11022 = arith.constant 0 : i64
      %11023 = func.call @cc_make_closure(%11021, %11022) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_522 = arith.constant 0 : i64
      %11024 = arith.addi %11023, %__rlasp_stack_elide_zero_522 : i64
      %11025 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%11025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %11026 = func.call @stack_pop_pointer() : () -> i64
      %11027 = func.call @stack_pop_pointer() : () -> i64
      %11028 = func.call @cc_cons(%11027, %11026) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_523 = arith.constant 0 : i64
      %11029 = arith.addi %11028, %__rlasp_stack_elide_zero_523 : i64
      %11030 = func.call @stack_pop_pointer() : () -> i64
      %11031 = func.call @cc_cons(%11030, %11029) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_524 = arith.constant 0 : i64
      %11032 = arith.addi %11031, %__rlasp_stack_elide_zero_524 : i64
      %11033 = llvm.mlir.addressof @str928 : !llvm.ptr
      %11034 = arith.constant 11 : i64
      %11035 = func.call @cc_make_string(%11033, %11034) : (!llvm.ptr, i64) -> i64
      %11036 = llvm.mlir.addressof @str929 : !llvm.ptr
      %11037 = arith.constant 7 : i64
      %11038 = func.call @cc_make_string(%11036, %11037) : (!llvm.ptr, i64) -> i64
      %11039 = func.call @cc_intern(%11035, %11038) : (i64, i64) -> i64
      %11040 = func.call @cc_nil_value() : () -> i64
      %11041 = func.call @cc_cons(%11039, %11040) : (i64, i64) -> i64
      %11042 = func.call @cc_values_pack(%11041) : (i64) -> i64
      %11043 = func.call @cc_nil_value() : () -> i64
      %11044 = llvm.mlir.addressof @str930 : !llvm.ptr
      %11045 = arith.constant 4 : i64
      %11046 = func.call @cc_make_string(%11044, %11045) : (!llvm.ptr, i64) -> i64
      %11047 = llvm.mlir.addressof @str931 : !llvm.ptr
      %11048 = arith.constant 7 : i64
      %11049 = func.call @cc_make_string(%11047, %11048) : (!llvm.ptr, i64) -> i64
      %11050 = func.call @cc_intern(%11046, %11049) : (i64, i64) -> i64
      %11051 = func.call @cc_nil_value() : () -> i64
      %11052 = func.call @cc_cons(%11050, %11051) : (i64, i64) -> i64
      %11053 = func.call @cc_values_pack(%11052) : (i64) -> i64
      %11054 = llvm.mlir.addressof @str932 : !llvm.ptr
      %11055 = arith.constant 6 : i64
      %11056 = func.call @cc_make_string(%11054, %11055) : (!llvm.ptr, i64) -> i64
      %11057 = func.call @cc_nil_value() : () -> i64
      %11058 = func.call @cc_intern(%11056, %11057) : (i64, i64) -> i64
      %11059 = func.call @cc_nil_value() : () -> i64
      %11060 = func.call @cc_cons(%11058, %11059) : (i64, i64) -> i64
      %11061 = func.call @cc_values_pack(%11060) : (i64) -> i64
      %__rlasp_stack_elide_zero_525 = arith.constant 0 : i64
      %11062 = arith.addi %11058, %__rlasp_stack_elide_zero_525 : i64
      %11063 = func.call @cc_nil_value() : () -> i64
      %11064 = func.call @cc_errorp(%10858) : (i64) -> i64
      %11065 = arith.cmpi ne, %11064, %11063 : i64
      %11066 = arith.cmpi eq, %11063, %11063 : i64
      %11067 = arith.andi %11065, %11066 : i1
      %11068 = scf.if %11067 -> (i64) {
        scf.yield %10858 : i64
      } else {
        scf.yield %11063 : i64
      }
      %11069 = func.call @cc_errorp(%10964) : (i64) -> i64
      %11070 = arith.cmpi ne, %11069, %11063 : i64
      %11071 = arith.cmpi eq, %11068, %11063 : i64
      %11072 = arith.andi %11070, %11071 : i1
      %11073 = scf.if %11072 -> (i64) {
        scf.yield %10964 : i64
      } else {
        scf.yield %11068 : i64
      }
      %11074 = func.call @cc_errorp(%11024) : (i64) -> i64
      %11075 = arith.cmpi ne, %11074, %11063 : i64
      %11076 = arith.cmpi eq, %11073, %11063 : i64
      %11077 = arith.andi %11075, %11076 : i1
      %11078 = scf.if %11077 -> (i64) {
        scf.yield %11024 : i64
      } else {
        scf.yield %11073 : i64
      }
      %11079 = func.call @cc_errorp(%11032) : (i64) -> i64
      %11080 = arith.cmpi ne, %11079, %11063 : i64
      %11081 = arith.cmpi eq, %11078, %11063 : i64
      %11082 = arith.andi %11080, %11081 : i1
      %11083 = scf.if %11082 -> (i64) {
        scf.yield %11032 : i64
      } else {
        scf.yield %11078 : i64
      }
      %11084 = func.call @cc_errorp(%11039) : (i64) -> i64
      %11085 = arith.cmpi ne, %11084, %11063 : i64
      %11086 = arith.cmpi eq, %11083, %11063 : i64
      %11087 = arith.andi %11085, %11086 : i1
      %11088 = scf.if %11087 -> (i64) {
        scf.yield %11039 : i64
      } else {
        scf.yield %11083 : i64
      }
      %11089 = func.call @cc_errorp(%11043) : (i64) -> i64
      %11090 = arith.cmpi ne, %11089, %11063 : i64
      %11091 = arith.cmpi eq, %11088, %11063 : i64
      %11092 = arith.andi %11090, %11091 : i1
      %11093 = scf.if %11092 -> (i64) {
        scf.yield %11043 : i64
      } else {
        scf.yield %11088 : i64
      }
      %11094 = func.call @cc_errorp(%11050) : (i64) -> i64
      %11095 = arith.cmpi ne, %11094, %11063 : i64
      %11096 = arith.cmpi eq, %11093, %11063 : i64
      %11097 = arith.andi %11095, %11096 : i1
      %11098 = scf.if %11097 -> (i64) {
        scf.yield %11050 : i64
      } else {
        scf.yield %11093 : i64
      }
      %11099 = func.call @cc_errorp(%11062) : (i64) -> i64
      %11100 = arith.cmpi ne, %11099, %11063 : i64
      %11101 = arith.cmpi eq, %11098, %11063 : i64
      %11102 = arith.andi %11100, %11101 : i1
      %11103 = scf.if %11102 -> (i64) {
        scf.yield %11062 : i64
      } else {
        scf.yield %11098 : i64
      }
      %11104 = arith.cmpi ne, %11103, %11063 : i64
      scf.if %11104 {
        func.call @stack_push_pointer(%11103) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10858) : (i64) -> ()
        func.call @stack_push_pointer(%10964) : (i64) -> ()
        func.call @stack_push_pointer(%11024) : (i64) -> ()
        func.call @stack_push_pointer(%11032) : (i64) -> ()
        func.call @stack_push_pointer(%11039) : (i64) -> ()
        func.call @stack_push_pointer(%11043) : (i64) -> ()
        func.call @stack_push_pointer(%11050) : (i64) -> ()
        func.call @stack_push_pointer(%11062) : (i64) -> ()
        %11105 = llvm.mlir.addressof @str933 : !llvm.ptr
        %11106 = func.call @cc_make_function_ref_const(%11105) : (!llvm.ptr) -> i64
        %11107 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11106, %11107) : (i64, i64) -> ()
      }
      %11108 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11108 : i64
    }
    %11109 = func.call @cc_nil_value() : () -> i64
    %11110 = func.call @cc_errorp(%10849) : (i64) -> i64
    %11111 = arith.cmpi ne, %11110, %11109 : i64
    %11112 = scf.if %11111 -> (i64) {
      scf.yield %10849 : i64
    } else {
      %11113 = llvm.mlir.addressof @str934 : !llvm.ptr
      %11114 = arith.constant 9 : i64
      %11115 = func.call @cc_make_string(%11113, %11114) : (!llvm.ptr, i64) -> i64
      %11116 = func.call @cc_nil_value() : () -> i64
      %11117 = func.call @cc_intern(%11115, %11116) : (i64, i64) -> i64
      %11118 = func.call @cc_nil_value() : () -> i64
      %11119 = func.call @cc_cons(%11117, %11118) : (i64, i64) -> i64
      %11120 = func.call @cc_values_pack(%11119) : (i64) -> i64
      %__rlasp_stack_elide_zero_526 = arith.constant 0 : i64
      %11121 = arith.addi %11117, %__rlasp_stack_elide_zero_526 : i64
      %11122 = llvm.mlir.addressof @str935 : !llvm.ptr
      %11123 = arith.constant 3 : i64
      %11124 = func.call @cc_make_string(%11122, %11123) : (!llvm.ptr, i64) -> i64
      %11125 = func.call @cc_nil_value() : () -> i64
      %11126 = func.call @cc_intern(%11124, %11125) : (i64, i64) -> i64
      %11127 = func.call @cc_nil_value() : () -> i64
      %11128 = func.call @cc_cons(%11126, %11127) : (i64, i64) -> i64
      %11129 = func.call @cc_values_pack(%11128) : (i64) -> i64
      func.call @stack_push_pointer(%11126) : (i64) -> ()
      %11130 = llvm.mlir.addressof @str936 : !llvm.ptr
      %11131 = arith.constant 3 : i64
      %11132 = func.call @cc_make_string(%11130, %11131) : (!llvm.ptr, i64) -> i64
      %11133 = func.call @cc_nil_value() : () -> i64
      %11134 = func.call @cc_intern(%11132, %11133) : (i64, i64) -> i64
      %11135 = func.call @cc_nil_value() : () -> i64
      %11136 = func.call @cc_cons(%11134, %11135) : (i64, i64) -> i64
      %11137 = func.call @cc_values_pack(%11136) : (i64) -> i64
      func.call @stack_push_pointer(%11134) : (i64) -> ()
      %11138 = llvm.mlir.addressof @str937 : !llvm.ptr
      %11139 = arith.constant 5 : i64
      %11140 = func.call @cc_make_string(%11138, %11139) : (!llvm.ptr, i64) -> i64
      %11141 = func.call @cc_nil_value() : () -> i64
      %11142 = func.call @cc_intern(%11140, %11141) : (i64, i64) -> i64
      %11143 = func.call @cc_nil_value() : () -> i64
      %11144 = func.call @cc_cons(%11142, %11143) : (i64, i64) -> i64
      %11145 = func.call @cc_values_pack(%11144) : (i64) -> i64
      func.call @stack_push_pointer(%11142) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11146 = llvm.mlir.addressof @str938 : !llvm.ptr
      %11147 = arith.constant 3 : i64
      %11148 = func.call @cc_make_string(%11146, %11147) : (!llvm.ptr, i64) -> i64
      %11149 = func.call @cc_nil_value() : () -> i64
      %11150 = func.call @cc_intern(%11148, %11149) : (i64, i64) -> i64
      %11151 = func.call @cc_nil_value() : () -> i64
      %11152 = func.call @cc_cons(%11150, %11151) : (i64, i64) -> i64
      %11153 = func.call @cc_values_pack(%11152) : (i64) -> i64
      func.call @stack_push_pointer(%11150) : (i64) -> ()
      %11154 = llvm.mlir.addressof @str939 : !llvm.ptr
      %11155 = arith.constant 22 : i64
      %11156 = func.call @cc_make_string(%11154, %11155) : (!llvm.ptr, i64) -> i64
      %11157 = llvm.mlir.addressof @str940 : !llvm.ptr
      %11158 = arith.constant 3 : i64
      %11159 = func.call @cc_make_string(%11157, %11158) : (!llvm.ptr, i64) -> i64
      %11160 = func.call @cc_intern(%11156, %11159) : (i64, i64) -> i64
      %11161 = func.call @cc_nil_value() : () -> i64
      %11162 = func.call @cc_cons(%11160, %11161) : (i64, i64) -> i64
      %11163 = func.call @cc_values_pack(%11162) : (i64) -> i64
      func.call @stack_push_pointer(%11160) : (i64) -> ()
      %11164 = llvm.mlir.addressof @str941 : !llvm.ptr
      %11165 = arith.constant 6 : i64
      %11166 = func.call @cc_make_string(%11164, %11165) : (!llvm.ptr, i64) -> i64
      %11167 = func.call @cc_nil_value() : () -> i64
      %11168 = func.call @cc_intern(%11166, %11167) : (i64, i64) -> i64
      %11169 = func.call @cc_nil_value() : () -> i64
      %11170 = func.call @cc_cons(%11168, %11169) : (i64, i64) -> i64
      %11171 = func.call @cc_values_pack(%11170) : (i64) -> i64
      func.call @stack_push_pointer(%11168) : (i64) -> ()
      %11172 = llvm.mlir.addressof @str942 : !llvm.ptr
      %11173 = arith.constant 9 : i64
      %11174 = func.call @cc_make_string(%11172, %11173) : (!llvm.ptr, i64) -> i64
      %11175 = llvm.mlir.addressof @str943 : !llvm.ptr
      %11176 = arith.constant 11 : i64
      %11177 = func.call @cc_make_string(%11175, %11176) : (!llvm.ptr, i64) -> i64
      %11178 = func.call @cc_intern(%11174, %11177) : (i64, i64) -> i64
      %11179 = func.call @cc_nil_value() : () -> i64
      %11180 = func.call @cc_cons(%11178, %11179) : (i64, i64) -> i64
      %11181 = func.call @cc_values_pack(%11180) : (i64) -> i64
      func.call @stack_push_pointer(%11178) : (i64) -> ()
      %11182 = llvm.mlir.addressof @str944 : !llvm.ptr
      %11183 = arith.constant 8 : i64
      %11184 = func.call @cc_make_string(%11182, %11183) : (!llvm.ptr, i64) -> i64
      %11185 = func.call @cc_nil_value() : () -> i64
      %11186 = func.call @cc_intern(%11184, %11185) : (i64, i64) -> i64
      %11187 = func.call @cc_nil_value() : () -> i64
      %11188 = func.call @cc_cons(%11186, %11187) : (i64, i64) -> i64
      %11189 = func.call @cc_values_pack(%11188) : (i64) -> i64
      func.call @stack_push_pointer(%11186) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11190 = func.call @stack_pop_pointer() : () -> i64
      %11191 = func.call @stack_pop_pointer() : () -> i64
      %11192 = func.call @cc_cons(%11191, %11190) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_527 = arith.constant 0 : i64
      %11193 = arith.addi %11192, %__rlasp_stack_elide_zero_527 : i64
      %11194 = func.call @stack_pop_pointer() : () -> i64
      %11195 = func.call @cc_cons(%11194, %11193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11195) : (i64) -> ()
      %11196 = llvm.mlir.addressof @str945 : !llvm.ptr
      %11197 = arith.constant 7 : i64
      %11198 = func.call @cc_make_string(%11196, %11197) : (!llvm.ptr, i64) -> i64
      %11199 = llvm.mlir.addressof @str946 : !llvm.ptr
      %11200 = arith.constant 11 : i64
      %11201 = func.call @cc_make_string(%11199, %11200) : (!llvm.ptr, i64) -> i64
      %11202 = func.call @cc_intern(%11198, %11201) : (i64, i64) -> i64
      %11203 = func.call @cc_nil_value() : () -> i64
      %11204 = func.call @cc_cons(%11202, %11203) : (i64, i64) -> i64
      %11205 = func.call @cc_values_pack(%11204) : (i64) -> i64
      func.call @stack_push_pointer(%11202) : (i64) -> ()
      %11206 = llvm.mlir.addressof @str947 : !llvm.ptr
      %11207 = arith.constant 6 : i64
      %11208 = func.call @cc_make_string(%11206, %11207) : (!llvm.ptr, i64) -> i64
      %11209 = llvm.mlir.addressof @str948 : !llvm.ptr
      %11210 = arith.constant 11 : i64
      %11211 = func.call @cc_make_string(%11209, %11210) : (!llvm.ptr, i64) -> i64
      %11212 = func.call @cc_intern(%11208, %11211) : (i64, i64) -> i64
      %11213 = func.call @cc_nil_value() : () -> i64
      %11214 = func.call @cc_cons(%11212, %11213) : (i64, i64) -> i64
      %11215 = func.call @cc_values_pack(%11214) : (i64) -> i64
      func.call @stack_push_pointer(%11212) : (i64) -> ()
      %11216 = llvm.mlir.addressof @str949 : !llvm.ptr
      %11217 = arith.constant 8 : i64
      %11218 = func.call @cc_make_string(%11216, %11217) : (!llvm.ptr, i64) -> i64
      %11219 = func.call @cc_nil_value() : () -> i64
      %11220 = func.call @cc_intern(%11218, %11219) : (i64, i64) -> i64
      %11221 = func.call @cc_nil_value() : () -> i64
      %11222 = func.call @cc_cons(%11220, %11221) : (i64, i64) -> i64
      %11223 = func.call @cc_values_pack(%11222) : (i64) -> i64
      func.call @stack_push_pointer(%11220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11224 = func.call @stack_pop_pointer() : () -> i64
      %11225 = func.call @stack_pop_pointer() : () -> i64
      %11226 = func.call @cc_cons(%11225, %11224) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_528 = arith.constant 0 : i64
      %11227 = arith.addi %11226, %__rlasp_stack_elide_zero_528 : i64
      %11228 = func.call @stack_pop_pointer() : () -> i64
      %11229 = func.call @cc_cons(%11228, %11227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11230 = func.call @stack_pop_pointer() : () -> i64
      %11231 = func.call @stack_pop_pointer() : () -> i64
      %11232 = func.call @cc_cons(%11231, %11230) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_529 = arith.constant 0 : i64
      %11233 = arith.addi %11232, %__rlasp_stack_elide_zero_529 : i64
      %11234 = func.call @stack_pop_pointer() : () -> i64
      %11235 = func.call @cc_cons(%11234, %11233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11235) : (i64) -> ()
      %11236 = llvm.mlir.addressof @str950 : !llvm.ptr
      %11237 = arith.constant 11 : i64
      %11238 = func.call @cc_make_string(%11236, %11237) : (!llvm.ptr, i64) -> i64
      %11239 = func.call @cc_nil_value() : () -> i64
      %11240 = func.call @cc_intern(%11238, %11239) : (i64, i64) -> i64
      %11241 = func.call @cc_nil_value() : () -> i64
      %11242 = func.call @cc_cons(%11240, %11241) : (i64, i64) -> i64
      %11243 = func.call @cc_values_pack(%11242) : (i64) -> i64
      func.call @stack_push_pointer(%11240) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11244 = llvm.mlir.addressof @str951 : !llvm.ptr
      %11245 = arith.constant 5 : i64
      %11246 = func.call @cc_make_string(%11244, %11245) : (!llvm.ptr, i64) -> i64
      %11247 = llvm.mlir.addressof @str952 : !llvm.ptr
      %11248 = arith.constant 11 : i64
      %11249 = func.call @cc_make_string(%11247, %11248) : (!llvm.ptr, i64) -> i64
      %11250 = func.call @cc_intern(%11246, %11249) : (i64, i64) -> i64
      %11251 = func.call @cc_nil_value() : () -> i64
      %11252 = func.call @cc_cons(%11250, %11251) : (i64, i64) -> i64
      %11253 = func.call @cc_values_pack(%11252) : (i64) -> i64
      func.call @stack_push_pointer(%11250) : (i64) -> ()
      %11254 = llvm.mlir.addressof @str953 : !llvm.ptr
      %11255 = arith.constant 9 : i64
      %11256 = func.call @cc_make_string(%11254, %11255) : (!llvm.ptr, i64) -> i64
      %11257 = llvm.mlir.addressof @str954 : !llvm.ptr
      %11258 = arith.constant 11 : i64
      %11259 = func.call @cc_make_string(%11257, %11258) : (!llvm.ptr, i64) -> i64
      %11260 = func.call @cc_intern(%11256, %11259) : (i64, i64) -> i64
      %11261 = func.call @cc_nil_value() : () -> i64
      %11262 = func.call @cc_cons(%11260, %11261) : (i64, i64) -> i64
      %11263 = func.call @cc_values_pack(%11262) : (i64) -> i64
      func.call @stack_push_pointer(%11260) : (i64) -> ()
      %11264 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%11264) : (i64) -> ()
      %11265 = llvm.mlir.addressof @str955 : !llvm.ptr
      %11266 = arith.constant 9 : i64
      %11267 = func.call @cc_make_string(%11265, %11266) : (!llvm.ptr, i64) -> i64
      %11268 = llvm.mlir.addressof @str956 : !llvm.ptr
      %11269 = arith.constant 11 : i64
      %11270 = func.call @cc_make_string(%11268, %11269) : (!llvm.ptr, i64) -> i64
      %11271 = func.call @cc_intern(%11267, %11270) : (i64, i64) -> i64
      %11272 = func.call @cc_nil_value() : () -> i64
      %11273 = func.call @cc_cons(%11271, %11272) : (i64, i64) -> i64
      %11274 = func.call @cc_values_pack(%11273) : (i64) -> i64
      %__rlasp_stack_elide_zero_530 = arith.constant 0 : i64
      %11275 = arith.addi %11271, %__rlasp_stack_elide_zero_530 : i64
      %11276 = func.call @stack_pop_pointer() : () -> i64
      %11277 = func.call @cc_cons(%11275, %11276) : (i64, i64) -> i64
      %11278 = llvm.mlir.addressof @str957 : !llvm.ptr
      %11279 = arith.constant 5 : i64
      %11280 = func.call @cc_make_string(%11278, %11279) : (!llvm.ptr, i64) -> i64
      %11281 = func.call @cc_nil_value() : () -> i64
      %11282 = func.call @cc_intern(%11280, %11281) : (i64, i64) -> i64
      %11283 = func.call @cc_nil_value() : () -> i64
      %11284 = func.call @cc_cons(%11282, %11283) : (i64, i64) -> i64
      %11285 = func.call @cc_values_pack(%11284) : (i64) -> i64
      %11286 = func.call @cc_cons(%11282, %11277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11286) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11287 = func.call @stack_pop_pointer() : () -> i64
      %11288 = func.call @stack_pop_pointer() : () -> i64
      %11289 = func.call @cc_cons(%11288, %11287) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_531 = arith.constant 0 : i64
      %11290 = arith.addi %11289, %__rlasp_stack_elide_zero_531 : i64
      %11291 = func.call @stack_pop_pointer() : () -> i64
      %11292 = func.call @cc_cons(%11291, %11290) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_532 = arith.constant 0 : i64
      %11293 = arith.addi %11292, %__rlasp_stack_elide_zero_532 : i64
      %11294 = func.call @stack_pop_pointer() : () -> i64
      %11295 = func.call @cc_cons(%11294, %11293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11295) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11296 = func.call @stack_pop_pointer() : () -> i64
      %11297 = func.call @stack_pop_pointer() : () -> i64
      %11298 = func.call @cc_cons(%11297, %11296) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_533 = arith.constant 0 : i64
      %11299 = arith.addi %11298, %__rlasp_stack_elide_zero_533 : i64
      %11300 = func.call @stack_pop_pointer() : () -> i64
      %11301 = func.call @cc_cons(%11300, %11299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_534 = arith.constant 0 : i64
      %11302 = arith.addi %11301, %__rlasp_stack_elide_zero_534 : i64
      %11303 = func.call @stack_pop_pointer() : () -> i64
      %11304 = func.call @cc_cons(%11303, %11302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11305 = func.call @stack_pop_pointer() : () -> i64
      %11306 = func.call @stack_pop_pointer() : () -> i64
      %11307 = func.call @cc_cons(%11306, %11305) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_535 = arith.constant 0 : i64
      %11308 = arith.addi %11307, %__rlasp_stack_elide_zero_535 : i64
      %11309 = func.call @stack_pop_pointer() : () -> i64
      %11310 = func.call @cc_cons(%11309, %11308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_536 = arith.constant 0 : i64
      %11311 = arith.addi %11310, %__rlasp_stack_elide_zero_536 : i64
      %11312 = func.call @stack_pop_pointer() : () -> i64
      %11313 = func.call @cc_cons(%11312, %11311) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_537 = arith.constant 0 : i64
      %11314 = arith.addi %11313, %__rlasp_stack_elide_zero_537 : i64
      %11315 = func.call @stack_pop_pointer() : () -> i64
      %11316 = func.call @cc_cons(%11315, %11314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11316) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11317 = func.call @stack_pop_pointer() : () -> i64
      %11318 = func.call @stack_pop_pointer() : () -> i64
      %11319 = func.call @cc_cons(%11318, %11317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_538 = arith.constant 0 : i64
      %11320 = arith.addi %11319, %__rlasp_stack_elide_zero_538 : i64
      %11321 = func.call @stack_pop_pointer() : () -> i64
      %11322 = func.call @cc_cons(%11321, %11320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11322) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11323 = func.call @stack_pop_pointer() : () -> i64
      %11324 = func.call @stack_pop_pointer() : () -> i64
      %11325 = func.call @cc_cons(%11324, %11323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11325) : (i64) -> ()
      %11326 = llvm.mlir.addressof @str958 : !llvm.ptr
      %11327 = arith.constant 13 : i64
      %11328 = func.call @cc_make_string(%11326, %11327) : (!llvm.ptr, i64) -> i64
      %11329 = llvm.mlir.addressof @str959 : !llvm.ptr
      %11330 = arith.constant 11 : i64
      %11331 = func.call @cc_make_string(%11329, %11330) : (!llvm.ptr, i64) -> i64
      %11332 = func.call @cc_intern(%11328, %11331) : (i64, i64) -> i64
      %11333 = func.call @cc_nil_value() : () -> i64
      %11334 = func.call @cc_cons(%11332, %11333) : (i64, i64) -> i64
      %11335 = func.call @cc_values_pack(%11334) : (i64) -> i64
      func.call @stack_push_pointer(%11332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11336 = func.call @stack_pop_pointer() : () -> i64
      %11337 = func.call @stack_pop_pointer() : () -> i64
      %11338 = func.call @cc_cons(%11337, %11336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11338) : (i64) -> ()
      %11339 = llvm.mlir.addressof @str960 : !llvm.ptr
      %11340 = arith.constant 14 : i64
      %11341 = func.call @cc_make_string(%11339, %11340) : (!llvm.ptr, i64) -> i64
      %11342 = llvm.mlir.addressof @str961 : !llvm.ptr
      %11343 = arith.constant 11 : i64
      %11344 = func.call @cc_make_string(%11342, %11343) : (!llvm.ptr, i64) -> i64
      %11345 = func.call @cc_intern(%11341, %11344) : (i64, i64) -> i64
      %11346 = func.call @cc_nil_value() : () -> i64
      %11347 = func.call @cc_cons(%11345, %11346) : (i64, i64) -> i64
      %11348 = func.call @cc_values_pack(%11347) : (i64) -> i64
      func.call @stack_push_pointer(%11345) : (i64) -> ()
      %11349 = llvm.mlir.addressof @str962 : !llvm.ptr
      %11350 = arith.constant 7 : i64
      %11351 = func.call @cc_make_string(%11349, %11350) : (!llvm.ptr, i64) -> i64
      %11352 = llvm.mlir.addressof @str963 : !llvm.ptr
      %11353 = arith.constant 11 : i64
      %11354 = func.call @cc_make_string(%11352, %11353) : (!llvm.ptr, i64) -> i64
      %11355 = func.call @cc_intern(%11351, %11354) : (i64, i64) -> i64
      %11356 = func.call @cc_nil_value() : () -> i64
      %11357 = func.call @cc_cons(%11355, %11356) : (i64, i64) -> i64
      %11358 = func.call @cc_values_pack(%11357) : (i64) -> i64
      func.call @stack_push_pointer(%11355) : (i64) -> ()
      %11359 = llvm.mlir.addressof @str964 : !llvm.ptr
      %11360 = arith.constant 7 : i64
      %11361 = func.call @cc_make_string(%11359, %11360) : (!llvm.ptr, i64) -> i64
      %11362 = llvm.mlir.addressof @str965 : !llvm.ptr
      %11363 = arith.constant 11 : i64
      %11364 = func.call @cc_make_string(%11362, %11363) : (!llvm.ptr, i64) -> i64
      %11365 = func.call @cc_intern(%11361, %11364) : (i64, i64) -> i64
      %11366 = func.call @cc_nil_value() : () -> i64
      %11367 = func.call @cc_cons(%11365, %11366) : (i64, i64) -> i64
      %11368 = func.call @cc_values_pack(%11367) : (i64) -> i64
      func.call @stack_push_pointer(%11365) : (i64) -> ()
      %11369 = llvm.mlir.addressof @str966 : !llvm.ptr
      %11370 = arith.constant 8 : i64
      %11371 = func.call @cc_make_string(%11369, %11370) : (!llvm.ptr, i64) -> i64
      %11372 = llvm.mlir.addressof @str967 : !llvm.ptr
      %11373 = arith.constant 11 : i64
      %11374 = func.call @cc_make_string(%11372, %11373) : (!llvm.ptr, i64) -> i64
      %11375 = func.call @cc_intern(%11371, %11374) : (i64, i64) -> i64
      %11376 = func.call @cc_nil_value() : () -> i64
      %11377 = func.call @cc_cons(%11375, %11376) : (i64, i64) -> i64
      %11378 = func.call @cc_values_pack(%11377) : (i64) -> i64
      func.call @stack_push_pointer(%11375) : (i64) -> ()
      %11379 = llvm.mlir.addressof @str968 : !llvm.ptr
      %11380 = arith.constant 22 : i64
      %11381 = func.call @cc_make_string(%11379, %11380) : (!llvm.ptr, i64) -> i64
      %11382 = llvm.mlir.addressof @str969 : !llvm.ptr
      %11383 = arith.constant 13 : i64
      %11384 = func.call @cc_make_string(%11382, %11383) : (!llvm.ptr, i64) -> i64
      %11385 = func.call @cc_intern(%11381, %11384) : (i64, i64) -> i64
      %11386 = func.call @cc_nil_value() : () -> i64
      %11387 = func.call @cc_cons(%11385, %11386) : (i64, i64) -> i64
      %11388 = func.call @cc_values_pack(%11387) : (i64) -> i64
      func.call @stack_push_pointer(%11385) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11389 = func.call @stack_pop_pointer() : () -> i64
      %11390 = func.call @stack_pop_pointer() : () -> i64
      %11391 = func.call @cc_cons(%11390, %11389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_539 = arith.constant 0 : i64
      %11392 = arith.addi %11391, %__rlasp_stack_elide_zero_539 : i64
      %11393 = func.call @stack_pop_pointer() : () -> i64
      %11394 = func.call @cc_cons(%11393, %11392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11394) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11395 = func.call @stack_pop_pointer() : () -> i64
      %11396 = func.call @stack_pop_pointer() : () -> i64
      %11397 = func.call @cc_cons(%11396, %11395) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_540 = arith.constant 0 : i64
      %11398 = arith.addi %11397, %__rlasp_stack_elide_zero_540 : i64
      %11399 = func.call @stack_pop_pointer() : () -> i64
      %11400 = func.call @cc_cons(%11399, %11398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11400) : (i64) -> ()
      %11401 = llvm.mlir.addressof @str970 : !llvm.ptr
      %11402 = arith.constant 5 : i64
      %11403 = func.call @cc_make_string(%11401, %11402) : (!llvm.ptr, i64) -> i64
      %11404 = llvm.mlir.addressof @str971 : !llvm.ptr
      %11405 = arith.constant 11 : i64
      %11406 = func.call @cc_make_string(%11404, %11405) : (!llvm.ptr, i64) -> i64
      %11407 = func.call @cc_intern(%11403, %11406) : (i64, i64) -> i64
      %11408 = func.call @cc_nil_value() : () -> i64
      %11409 = func.call @cc_cons(%11407, %11408) : (i64, i64) -> i64
      %11410 = func.call @cc_values_pack(%11409) : (i64) -> i64
      func.call @stack_push_pointer(%11407) : (i64) -> ()
      %11411 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%11411) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11412 = func.call @stack_pop_pointer() : () -> i64
      %11413 = func.call @stack_pop_pointer() : () -> i64
      %11414 = func.call @cc_cons(%11413, %11412) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_541 = arith.constant 0 : i64
      %11415 = arith.addi %11414, %__rlasp_stack_elide_zero_541 : i64
      %11416 = func.call @stack_pop_pointer() : () -> i64
      %11417 = func.call @cc_cons(%11416, %11415) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11417) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11418 = func.call @stack_pop_pointer() : () -> i64
      %11419 = func.call @stack_pop_pointer() : () -> i64
      %11420 = func.call @cc_cons(%11419, %11418) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_542 = arith.constant 0 : i64
      %11421 = arith.addi %11420, %__rlasp_stack_elide_zero_542 : i64
      %11422 = func.call @stack_pop_pointer() : () -> i64
      %11423 = func.call @cc_cons(%11422, %11421) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_543 = arith.constant 0 : i64
      %11424 = arith.addi %11423, %__rlasp_stack_elide_zero_543 : i64
      %11425 = func.call @stack_pop_pointer() : () -> i64
      %11426 = func.call @cc_cons(%11425, %11424) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11426) : (i64) -> ()
      %11427 = llvm.mlir.addressof @str972 : !llvm.ptr
      %11428 = arith.constant 15 : i64
      %11429 = func.call @cc_make_string(%11427, %11428) : (!llvm.ptr, i64) -> i64
      %11430 = llvm.mlir.addressof @str973 : !llvm.ptr
      %11431 = arith.constant 11 : i64
      %11432 = func.call @cc_make_string(%11430, %11431) : (!llvm.ptr, i64) -> i64
      %11433 = func.call @cc_intern(%11429, %11432) : (i64, i64) -> i64
      %11434 = func.call @cc_nil_value() : () -> i64
      %11435 = func.call @cc_cons(%11433, %11434) : (i64, i64) -> i64
      %11436 = func.call @cc_values_pack(%11435) : (i64) -> i64
      func.call @stack_push_pointer(%11433) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11437 = func.call @stack_pop_pointer() : () -> i64
      %11438 = func.call @stack_pop_pointer() : () -> i64
      %11439 = func.call @cc_cons(%11438, %11437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11439) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11440 = func.call @stack_pop_pointer() : () -> i64
      %11441 = func.call @stack_pop_pointer() : () -> i64
      %11442 = func.call @cc_cons(%11441, %11440) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_544 = arith.constant 0 : i64
      %11443 = arith.addi %11442, %__rlasp_stack_elide_zero_544 : i64
      %11444 = func.call @stack_pop_pointer() : () -> i64
      %11445 = func.call @cc_cons(%11444, %11443) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_545 = arith.constant 0 : i64
      %11446 = arith.addi %11445, %__rlasp_stack_elide_zero_545 : i64
      %11447 = func.call @stack_pop_pointer() : () -> i64
      %11448 = func.call @cc_cons(%11447, %11446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11448) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11449 = func.call @stack_pop_pointer() : () -> i64
      %11450 = func.call @stack_pop_pointer() : () -> i64
      %11451 = func.call @cc_cons(%11450, %11449) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_546 = arith.constant 0 : i64
      %11452 = arith.addi %11451, %__rlasp_stack_elide_zero_546 : i64
      %11453 = func.call @stack_pop_pointer() : () -> i64
      %11454 = func.call @cc_cons(%11453, %11452) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_547 = arith.constant 0 : i64
      %11455 = arith.addi %11454, %__rlasp_stack_elide_zero_547 : i64
      %11456 = func.call @stack_pop_pointer() : () -> i64
      %11457 = func.call @cc_cons(%11456, %11455) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_548 = arith.constant 0 : i64
      %11458 = arith.addi %11457, %__rlasp_stack_elide_zero_548 : i64
      %11459 = func.call @stack_pop_pointer() : () -> i64
      %11460 = func.call @cc_cons(%11459, %11458) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11460) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11461 = func.call @stack_pop_pointer() : () -> i64
      %11462 = func.call @stack_pop_pointer() : () -> i64
      %11463 = func.call @cc_cons(%11462, %11461) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_549 = arith.constant 0 : i64
      %11464 = arith.addi %11463, %__rlasp_stack_elide_zero_549 : i64
      %11465 = func.call @stack_pop_pointer() : () -> i64
      %11466 = func.call @cc_cons(%11465, %11464) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_550 = arith.constant 0 : i64
      %11467 = arith.addi %11466, %__rlasp_stack_elide_zero_550 : i64
      %11468 = func.call @stack_pop_pointer() : () -> i64
      %11469 = func.call @cc_cons(%11468, %11467) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11469) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11470 = func.call @stack_pop_pointer() : () -> i64
      %11471 = func.call @stack_pop_pointer() : () -> i64
      %11472 = func.call @cc_cons(%11471, %11470) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_551 = arith.constant 0 : i64
      %11473 = arith.addi %11472, %__rlasp_stack_elide_zero_551 : i64
      %11474 = func.call @stack_pop_pointer() : () -> i64
      %11475 = func.call @cc_cons(%11474, %11473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11476 = func.call @stack_pop_pointer() : () -> i64
      %11477 = func.call @stack_pop_pointer() : () -> i64
      %11478 = func.call @cc_cons(%11477, %11476) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_552 = arith.constant 0 : i64
      %11479 = arith.addi %11478, %__rlasp_stack_elide_zero_552 : i64
      %11480 = func.call @stack_pop_pointer() : () -> i64
      %11481 = func.call @cc_cons(%11480, %11479) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_553 = arith.constant 0 : i64
      %11482 = arith.addi %11481, %__rlasp_stack_elide_zero_553 : i64
      %11669 = arith.constant 97047688511582 : i64
      %11670 = arith.constant 0 : i64
      %11671 = func.call @cc_make_closure(%11669, %11670) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_554 = arith.constant 0 : i64
      %11672 = arith.addi %11671, %__rlasp_stack_elide_zero_554 : i64
      %11673 = llvm.mlir.addressof @str988 : !llvm.ptr
      %11674 = arith.constant 1 : i64
      %11675 = func.call @cc_make_string(%11673, %11674) : (!llvm.ptr, i64) -> i64
      %11676 = func.call @cc_nil_value() : () -> i64
      %11677 = func.call @cc_intern(%11675, %11676) : (i64, i64) -> i64
      %11678 = func.call @cc_nil_value() : () -> i64
      %11679 = func.call @cc_cons(%11677, %11678) : (i64, i64) -> i64
      %11680 = func.call @cc_values_pack(%11679) : (i64) -> i64
      func.call @stack_push_pointer(%11677) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11681 = func.call @stack_pop_pointer() : () -> i64
      %11682 = func.call @stack_pop_pointer() : () -> i64
      %11683 = func.call @cc_cons(%11682, %11681) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_555 = arith.constant 0 : i64
      %11684 = arith.addi %11683, %__rlasp_stack_elide_zero_555 : i64
      %11685 = llvm.mlir.addressof @str989 : !llvm.ptr
      %11686 = arith.constant 11 : i64
      %11687 = func.call @cc_make_string(%11685, %11686) : (!llvm.ptr, i64) -> i64
      %11688 = llvm.mlir.addressof @str990 : !llvm.ptr
      %11689 = arith.constant 7 : i64
      %11690 = func.call @cc_make_string(%11688, %11689) : (!llvm.ptr, i64) -> i64
      %11691 = func.call @cc_intern(%11687, %11690) : (i64, i64) -> i64
      %11692 = func.call @cc_nil_value() : () -> i64
      %11693 = func.call @cc_cons(%11691, %11692) : (i64, i64) -> i64
      %11694 = func.call @cc_values_pack(%11693) : (i64) -> i64
      %11695 = func.call @cc_nil_value() : () -> i64
      %11696 = llvm.mlir.addressof @str991 : !llvm.ptr
      %11697 = arith.constant 4 : i64
      %11698 = func.call @cc_make_string(%11696, %11697) : (!llvm.ptr, i64) -> i64
      %11699 = llvm.mlir.addressof @str992 : !llvm.ptr
      %11700 = arith.constant 7 : i64
      %11701 = func.call @cc_make_string(%11699, %11700) : (!llvm.ptr, i64) -> i64
      %11702 = func.call @cc_intern(%11698, %11701) : (i64, i64) -> i64
      %11703 = func.call @cc_nil_value() : () -> i64
      %11704 = func.call @cc_cons(%11702, %11703) : (i64, i64) -> i64
      %11705 = func.call @cc_values_pack(%11704) : (i64) -> i64
      %11706 = llvm.mlir.addressof @str993 : !llvm.ptr
      %11707 = arith.constant 6 : i64
      %11708 = func.call @cc_make_string(%11706, %11707) : (!llvm.ptr, i64) -> i64
      %11709 = func.call @cc_nil_value() : () -> i64
      %11710 = func.call @cc_intern(%11708, %11709) : (i64, i64) -> i64
      %11711 = func.call @cc_nil_value() : () -> i64
      %11712 = func.call @cc_cons(%11710, %11711) : (i64, i64) -> i64
      %11713 = func.call @cc_values_pack(%11712) : (i64) -> i64
      %__rlasp_stack_elide_zero_556 = arith.constant 0 : i64
      %11714 = arith.addi %11710, %__rlasp_stack_elide_zero_556 : i64
      %11715 = func.call @cc_nil_value() : () -> i64
      %11716 = func.call @cc_errorp(%11121) : (i64) -> i64
      %11717 = arith.cmpi ne, %11716, %11715 : i64
      %11718 = arith.cmpi eq, %11715, %11715 : i64
      %11719 = arith.andi %11717, %11718 : i1
      %11720 = scf.if %11719 -> (i64) {
        scf.yield %11121 : i64
      } else {
        scf.yield %11715 : i64
      }
      %11721 = func.call @cc_errorp(%11482) : (i64) -> i64
      %11722 = arith.cmpi ne, %11721, %11715 : i64
      %11723 = arith.cmpi eq, %11720, %11715 : i64
      %11724 = arith.andi %11722, %11723 : i1
      %11725 = scf.if %11724 -> (i64) {
        scf.yield %11482 : i64
      } else {
        scf.yield %11720 : i64
      }
      %11726 = func.call @cc_errorp(%11672) : (i64) -> i64
      %11727 = arith.cmpi ne, %11726, %11715 : i64
      %11728 = arith.cmpi eq, %11725, %11715 : i64
      %11729 = arith.andi %11727, %11728 : i1
      %11730 = scf.if %11729 -> (i64) {
        scf.yield %11672 : i64
      } else {
        scf.yield %11725 : i64
      }
      %11731 = func.call @cc_errorp(%11684) : (i64) -> i64
      %11732 = arith.cmpi ne, %11731, %11715 : i64
      %11733 = arith.cmpi eq, %11730, %11715 : i64
      %11734 = arith.andi %11732, %11733 : i1
      %11735 = scf.if %11734 -> (i64) {
        scf.yield %11684 : i64
      } else {
        scf.yield %11730 : i64
      }
      %11736 = func.call @cc_errorp(%11691) : (i64) -> i64
      %11737 = arith.cmpi ne, %11736, %11715 : i64
      %11738 = arith.cmpi eq, %11735, %11715 : i64
      %11739 = arith.andi %11737, %11738 : i1
      %11740 = scf.if %11739 -> (i64) {
        scf.yield %11691 : i64
      } else {
        scf.yield %11735 : i64
      }
      %11741 = func.call @cc_errorp(%11695) : (i64) -> i64
      %11742 = arith.cmpi ne, %11741, %11715 : i64
      %11743 = arith.cmpi eq, %11740, %11715 : i64
      %11744 = arith.andi %11742, %11743 : i1
      %11745 = scf.if %11744 -> (i64) {
        scf.yield %11695 : i64
      } else {
        scf.yield %11740 : i64
      }
      %11746 = func.call @cc_errorp(%11702) : (i64) -> i64
      %11747 = arith.cmpi ne, %11746, %11715 : i64
      %11748 = arith.cmpi eq, %11745, %11715 : i64
      %11749 = arith.andi %11747, %11748 : i1
      %11750 = scf.if %11749 -> (i64) {
        scf.yield %11702 : i64
      } else {
        scf.yield %11745 : i64
      }
      %11751 = func.call @cc_errorp(%11714) : (i64) -> i64
      %11752 = arith.cmpi ne, %11751, %11715 : i64
      %11753 = arith.cmpi eq, %11750, %11715 : i64
      %11754 = arith.andi %11752, %11753 : i1
      %11755 = scf.if %11754 -> (i64) {
        scf.yield %11714 : i64
      } else {
        scf.yield %11750 : i64
      }
      %11756 = arith.cmpi ne, %11755, %11715 : i64
      scf.if %11756 {
        func.call @stack_push_pointer(%11755) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11121) : (i64) -> ()
        func.call @stack_push_pointer(%11482) : (i64) -> ()
        func.call @stack_push_pointer(%11672) : (i64) -> ()
        func.call @stack_push_pointer(%11684) : (i64) -> ()
        func.call @stack_push_pointer(%11691) : (i64) -> ()
        func.call @stack_push_pointer(%11695) : (i64) -> ()
        func.call @stack_push_pointer(%11702) : (i64) -> ()
        func.call @stack_push_pointer(%11714) : (i64) -> ()
        %11757 = llvm.mlir.addressof @str994 : !llvm.ptr
        %11758 = func.call @cc_make_function_ref_const(%11757) : (!llvm.ptr) -> i64
        %11759 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11758, %11759) : (i64, i64) -> ()
      }
      %11760 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11760 : i64
    }
    %__rlasp_stack_elide_zero_557 = arith.constant 0 : i64
    %11761 = arith.addi %11112, %__rlasp_stack_elide_zero_557 : i64
    %11762 = func.call @cc_multiple_value_list(%11761) : (i64) -> i64
    %11763 = llvm.mlir.addressof @str995 : !llvm.ptr
    %11764 = arith.constant 37 : i64
    %11765 = func.call @cc_make_string(%11763, %11764) : (!llvm.ptr, i64) -> i64
    %11766 = func.call @cc_nil_value() : () -> i64
    %11767 = func.call @cc_intern(%11765, %11766) : (i64, i64) -> i64
    %11768 = func.call @cc_nil_value() : () -> i64
    %11769 = func.call @cc_cons(%11767, %11768) : (i64, i64) -> i64
    %11770 = func.call @cc_values_pack(%11769) : (i64) -> i64
    %11771 = func.call @cc_symbol_value(%11767) : (i64) -> i64
    %11772 = llvm.mlir.addressof @str996 : !llvm.ptr
    %11773 = arith.constant 39 : i64
    %11774 = func.call @cc_make_string(%11772, %11773) : (!llvm.ptr, i64) -> i64
    %11775 = func.call @cc_nil_value() : () -> i64
    %11776 = func.call @cc_intern(%11774, %11775) : (i64, i64) -> i64
    %11777 = func.call @cc_nil_value() : () -> i64
    %11778 = func.call @cc_cons(%11776, %11777) : (i64, i64) -> i64
    %11779 = func.call @cc_values_pack(%11778) : (i64) -> i64
    %11780 = func.call @cc_symbol_value(%11776) : (i64) -> i64
    %11781 = func.call @cc_nil_value() : () -> i64
    %11782 = arith.cmpi ne, %11771, %11781 : i64
    %11783 = scf.if %11782 -> (i64) {
      scf.yield %11780 : i64
    } else {
      scf.yield %11762 : i64
    }
    %11784 = func.call @cc_values_pack(%11783) : (i64) -> i64
    func.call @stack_push_pointer(%11784) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511490"() {
    %143 = func.call @stack_pop_pointer() : () -> i64
    %144 = func.call @cc_nil_value() : () -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_errorp(%144) : (i64) -> i64
    %147 = arith.cmpi ne, %146, %145 : i64
    %148 = scf.if %147 -> (i64) {
      scf.yield %144 : i64
    } else {
      %149 = func.call @cc_symbol_value(%143) : (i64) -> i64
      %150 = func.call @cc_nil_value() : () -> i64
      %151 = func.call @cc_nil_value() : () -> i64
      %152 = func.call @cc_errorp(%149) : (i64) -> i64
      %153 = arith.cmpi ne, %152, %151 : i64
      %154 = arith.cmpi eq, %151, %151 : i64
      %155 = arith.andi %153, %154 : i1
      %156 = scf.if %155 -> (i64) {
        scf.yield %149 : i64
      } else {
        scf.yield %151 : i64
      }
      %157 = func.call @cc_errorp(%150) : (i64) -> i64
      %158 = arith.cmpi ne, %157, %151 : i64
      %159 = arith.cmpi eq, %156, %151 : i64
      %160 = arith.andi %158, %159 : i1
      %161 = scf.if %160 -> (i64) {
        scf.yield %150 : i64
      } else {
        scf.yield %156 : i64
      }
      %162 = arith.cmpi ne, %161, %151 : i64
      scf.if %162 {
        func.call @stack_push_pointer(%161) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%149) : (i64) -> ()
        func.call @stack_push_pointer(%150) : (i64) -> ()
        %163 = llvm.mlir.addressof @str13 : !llvm.ptr
        %164 = func.call @cc_make_function_ref_const(%163) : (!llvm.ptr) -> i64
        %165 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%164, %165) : (i64, i64) -> ()
      }
      %166 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %166 : i64
    }
    func.call @stack_push_pointer(%148) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511493"() {
    %391 = func.call @cc_nil_value() : () -> i64
    %392 = func.call @cc_nil_value() : () -> i64
    %393 = func.call @cc_errorp(%391) : (i64) -> i64
    %394 = arith.cmpi ne, %393, %392 : i64
    %395 = scf.if %394 -> (i64) {
      scf.yield %391 : i64
    } else {
      %396 = func.call @cc_make_string_output_stream() : () -> i64
      %397 = llvm.mlir.addressof @str33 : !llvm.ptr
      %398 = arith.constant 6 : i64
      %399 = func.call @cc_make_string(%397, %398) : (!llvm.ptr, i64) -> i64
      %400 = llvm.mlir.addressof @str34 : !llvm.ptr
      %401 = arith.constant 7 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = func.call @cc_intern(%399, %402) : (i64, i64) -> i64
      %404 = func.call @cc_nil_value() : () -> i64
      %405 = func.call @cc_cons(%403, %404) : (i64, i64) -> i64
      %406 = func.call @cc_values_pack(%405) : (i64) -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_errorp(%403) : (i64) -> i64
      %409 = arith.cmpi ne, %408, %407 : i64
      %410 = arith.cmpi eq, %407, %407 : i64
      %411 = arith.andi %409, %410 : i1
      %412 = scf.if %411 -> (i64) {
        scf.yield %403 : i64
      } else {
        scf.yield %407 : i64
      }
      %413 = func.call @cc_errorp(%396) : (i64) -> i64
      %414 = arith.cmpi ne, %413, %407 : i64
      %415 = arith.cmpi eq, %412, %407 : i64
      %416 = arith.andi %414, %415 : i1
      %417 = scf.if %416 -> (i64) {
        scf.yield %396 : i64
      } else {
        scf.yield %412 : i64
      }
      %418 = arith.cmpi ne, %417, %407 : i64
      scf.if %418 {
        func.call @stack_push_pointer(%417) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%403) : (i64) -> ()
        func.call @stack_push_pointer(%396) : (i64) -> ()
        %419 = llvm.mlir.addressof @str35 : !llvm.ptr
        %420 = func.call @cc_make_function_ref_const(%419) : (!llvm.ptr) -> i64
        %421 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%420, %421) : (i64, i64) -> ()
      }
      %422 = func.call @stack_pop_pointer() : () -> i64
      %423 = func.call @cc_nil_value() : () -> i64
      %424 = func.call @cc_errorp(%422) : (i64) -> i64
      %425 = arith.cmpi ne, %424, %423 : i64
      %426 = scf.if %425 -> (i64) {
        scf.yield %422 : i64
      } else {
        %427 = func.call @cc_get_output_stream_string(%396) : (i64) -> i64
        scf.yield %427 : i64
      }
      %__rlasp_stack_elide_zero_558 = arith.constant 0 : i64
      %428 = arith.addi %426, %__rlasp_stack_elide_zero_558 : i64
      func.call @stack_push_nil() : () -> ()
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_cons(%428, %429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_559 = arith.constant 0 : i64
      %431 = arith.addi %430, %__rlasp_stack_elide_zero_559 : i64
      %432 = func.call @cc_values_pack(%431) : (i64) -> i64
      %__rlasp_stack_elide_zero_560 = arith.constant 0 : i64
      %433 = arith.addi %432, %__rlasp_stack_elide_zero_560 : i64
      scf.yield %433 : i64
    }
    func.call @stack_push_pointer(%395) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511497"() {
    %874 = func.call @stack_pop_pointer() : () -> i64
    %875 = func.call @cc_nil_value() : () -> i64
    %876 = func.call @cc_nil_value() : () -> i64
    %877 = func.call @cc_errorp(%875) : (i64) -> i64
    %878 = arith.cmpi ne, %877, %876 : i64
    %879 = scf.if %878 -> (i64) {
      scf.yield %875 : i64
    } else {
      %880 = func.call @cc_nil_value() : () -> i64
      %881 = func.call @cc_errorp(%874) : (i64) -> i64
      %882 = arith.cmpi ne, %881, %880 : i64
      %883 = arith.cmpi eq, %880, %880 : i64
      %884 = arith.andi %882, %883 : i1
      %885 = scf.if %884 -> (i64) {
        scf.yield %874 : i64
      } else {
        scf.yield %880 : i64
      }
      %886 = arith.cmpi ne, %885, %880 : i64
      scf.if %886 {
        func.call @stack_push_pointer(%885) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%874) : (i64) -> ()
        %887 = llvm.mlir.addressof @str71 : !llvm.ptr
        %888 = func.call @cc_make_function_ref_const(%887) : (!llvm.ptr) -> i64
        %889 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%888, %889) : (i64, i64) -> ()
      }
      %890 = llvm.mlir.addressof @str72 : !llvm.ptr
      %891 = arith.constant 32 : i64
      %892 = func.call @cc_make_string(%890, %891) : (!llvm.ptr, i64) -> i64
      %893 = func.call @cc_nil_value() : () -> i64
      %894 = func.call @cc_intern(%892, %893) : (i64, i64) -> i64
      %895 = func.call @cc_nil_value() : () -> i64
      %896 = func.call @cc_cons(%894, %895) : (i64, i64) -> i64
      %897 = func.call @cc_values_pack(%896) : (i64) -> i64
      %__rlasp_stack_elide_zero_561 = arith.constant 0 : i64
      %898 = arith.addi %894, %__rlasp_stack_elide_zero_561 : i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_eq(%899, %898) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_562 = arith.constant 0 : i64
      %901 = arith.addi %900, %__rlasp_stack_elide_zero_562 : i64
      %902 = func.call @cc_nil_value() : () -> i64
      %903 = arith.cmpi ne, %901, %902 : i64
      scf.if %903 {
        %904 = func.call @cc_nil_value() : () -> i64
        %905 = func.call @cc_nil_value() : () -> i64
        %906 = func.call @cc_errorp(%904) : (i64) -> i64
        %907 = arith.cmpi ne, %906, %905 : i64
        %908 = scf.if %907 -> (i64) {
          scf.yield %904 : i64
        } else {
          %909 = func.call @cc_t_value() : () -> i64
          %__rlasp_stack_elide_zero_563 = arith.constant 0 : i64
          %910 = arith.addi %909, %__rlasp_stack_elide_zero_563 : i64
          %911 = func.call @cc_multiple_value_list(%910) : (i64) -> i64
          %912 = func.call @cc_t_value() : () -> i64
          %913 = llvm.mlir.addressof @str73 : !llvm.ptr
          %914 = arith.constant 37 : i64
          %915 = func.call @cc_make_string(%913, %914) : (!llvm.ptr, i64) -> i64
          %916 = func.call @cc_nil_value() : () -> i64
          %917 = func.call @cc_intern(%915, %916) : (i64, i64) -> i64
          %918 = func.call @cc_nil_value() : () -> i64
          %919 = func.call @cc_cons(%917, %918) : (i64, i64) -> i64
          %920 = func.call @cc_values_pack(%919) : (i64) -> i64
          %921 = func.call @cc_set_symbol_value(%917, %912) : (i64, i64) -> i64
          %922 = llvm.mlir.addressof @str74 : !llvm.ptr
          %923 = arith.constant 38 : i64
          %924 = func.call @cc_make_string(%922, %923) : (!llvm.ptr, i64) -> i64
          %925 = func.call @cc_nil_value() : () -> i64
          %926 = func.call @cc_intern(%924, %925) : (i64, i64) -> i64
          %927 = func.call @cc_nil_value() : () -> i64
          %928 = func.call @cc_cons(%926, %927) : (i64, i64) -> i64
          %929 = func.call @cc_values_pack(%928) : (i64) -> i64
          %930 = func.call @cc_set_symbol_value(%926, %910) : (i64, i64) -> i64
          %931 = llvm.mlir.addressof @str75 : !llvm.ptr
          %932 = arith.constant 39 : i64
          %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
          %934 = func.call @cc_nil_value() : () -> i64
          %935 = func.call @cc_intern(%933, %934) : (i64, i64) -> i64
          %936 = func.call @cc_nil_value() : () -> i64
          %937 = func.call @cc_cons(%935, %936) : (i64, i64) -> i64
          %938 = func.call @cc_values_pack(%937) : (i64) -> i64
          %939 = func.call @cc_set_symbol_value(%935, %911) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_564 = arith.constant 0 : i64
          %940 = arith.addi %910, %__rlasp_stack_elide_zero_564 : i64
          scf.yield %940 : i64
        }
        func.call @stack_push_pointer(%908) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %941 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %941 : i64
    }
    func.call @stack_push_pointer(%879) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511496"() {
    %861 = func.call @stack_pop_pointer() : () -> i64
    %862 = func.call @cc_nil_value() : () -> i64
    %863 = func.call @cc_nil_value() : () -> i64
    %864 = func.call @cc_errorp(%862) : (i64) -> i64
    %865 = arith.cmpi ne, %864, %863 : i64
    %866 = scf.if %865 -> (i64) {
      scf.yield %862 : i64
    } else {
      %867 = func.call @cc_t_value() : () -> i64
      %868 = func.call @cc_debug_current_stack(%867) : (i64) -> i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_nil_value() : () -> i64
      %871 = func.call @cc_errorp(%869) : (i64) -> i64
      %872 = arith.cmpi ne, %871, %870 : i64
      %873 = scf.if %872 -> (i64) {
        scf.yield %869 : i64
      } else {
        %942 = arith.constant 97047688511497 : i64
        %943 = arith.constant 0 : i64
        %944 = func.call @cc_make_closure(%942, %943) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_565 = arith.constant 0 : i64
        %945 = arith.addi %944, %__rlasp_stack_elide_zero_565 : i64
        %946 = func.call @cc_nil_value() : () -> i64
        %947 = func.call @cc_errorp(%945) : (i64) -> i64
        %948 = arith.cmpi ne, %947, %946 : i64
        %949 = arith.cmpi eq, %946, %946 : i64
        %950 = arith.andi %948, %949 : i1
        %951 = scf.if %950 -> (i64) {
          scf.yield %945 : i64
        } else {
          scf.yield %946 : i64
        }
        %952 = func.call @cc_errorp(%868) : (i64) -> i64
        %953 = arith.cmpi ne, %952, %946 : i64
        %954 = arith.cmpi eq, %951, %946 : i64
        %955 = arith.andi %953, %954 : i1
        %956 = scf.if %955 -> (i64) {
          scf.yield %868 : i64
        } else {
          scf.yield %951 : i64
        }
        %957 = arith.cmpi ne, %956, %946 : i64
        scf.if %957 {
          func.call @stack_push_pointer(%956) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%945) : (i64) -> ()
          func.call @stack_push_pointer(%868) : (i64) -> ()
          %958 = llvm.mlir.addressof @str76 : !llvm.ptr
          %959 = func.call @cc_make_function_ref_const(%958) : (!llvm.ptr) -> i64
          %960 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%959, %960) : (i64, i64) -> ()
        }
        %961 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %961 : i64
      }
      %__rlasp_stack_elide_zero_566 = arith.constant 0 : i64
      %962 = arith.addi %873, %__rlasp_stack_elide_zero_566 : i64
      scf.yield %962 : i64
    }
    func.call @stack_push_pointer(%866) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511494"() {
    %827 = func.call @stack_pop_pointer() : () -> i64
    %828 = func.call @cc_nil_value() : () -> i64
    %829 = func.call @cc_nil_value() : () -> i64
    %830 = func.call @cc_errorp(%828) : (i64) -> i64
    %831 = arith.cmpi ne, %830, %829 : i64
    %832 = scf.if %831 -> (i64) {
      scf.yield %828 : i64
    } else {
      %833 = func.call @cc_nil_value() : () -> i64
      %834 = llvm.mlir.addressof @str68 : !llvm.ptr
      %835 = arith.constant 37 : i64
      %836 = func.call @cc_make_string(%834, %835) : (!llvm.ptr, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_intern(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_nil_value() : () -> i64
      %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
      %841 = func.call @cc_values_pack(%840) : (i64) -> i64
      %842 = func.call @cc_set_symbol_value(%838, %833) : (i64, i64) -> i64
      %843 = llvm.mlir.addressof @str69 : !llvm.ptr
      %844 = arith.constant 38 : i64
      %845 = func.call @cc_make_string(%843, %844) : (!llvm.ptr, i64) -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_intern(%845, %846) : (i64, i64) -> i64
      %848 = func.call @cc_nil_value() : () -> i64
      %849 = func.call @cc_cons(%847, %848) : (i64, i64) -> i64
      %850 = func.call @cc_values_pack(%849) : (i64) -> i64
      %851 = func.call @cc_set_symbol_value(%847, %833) : (i64, i64) -> i64
      %852 = llvm.mlir.addressof @str70 : !llvm.ptr
      %853 = arith.constant 39 : i64
      %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
      %855 = func.call @cc_nil_value() : () -> i64
      %856 = func.call @cc_intern(%854, %855) : (i64, i64) -> i64
      %857 = func.call @cc_nil_value() : () -> i64
      %858 = func.call @cc_cons(%856, %857) : (i64, i64) -> i64
      %859 = func.call @cc_values_pack(%858) : (i64) -> i64
      %860 = func.call @cc_set_symbol_value(%856, %833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%827) : (i64) -> ()
      %963 = arith.constant 97047688511496 : i64
      %964 = arith.constant 1 : i64
      %965 = func.call @cc_make_closure(%963, %964) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_567 = arith.constant 0 : i64
      %966 = arith.addi %965, %__rlasp_stack_elide_zero_567 : i64
      %967 = func.call @cc_nil_value() : () -> i64
      %968 = func.call @cc_nil_value() : () -> i64
      %969 = func.call @cc_errorp(%966) : (i64) -> i64
      %970 = arith.cmpi ne, %969, %968 : i64
      %971 = arith.cmpi eq, %968, %968 : i64
      %972 = arith.andi %970, %971 : i1
      %973 = scf.if %972 -> (i64) {
        scf.yield %966 : i64
      } else {
        scf.yield %968 : i64
      }
      %974 = func.call @cc_errorp(%967) : (i64) -> i64
      %975 = arith.cmpi ne, %974, %968 : i64
      %976 = arith.cmpi eq, %973, %968 : i64
      %977 = arith.andi %975, %976 : i1
      %978 = scf.if %977 -> (i64) {
        scf.yield %967 : i64
      } else {
        scf.yield %973 : i64
      }
      %979 = arith.cmpi ne, %978, %968 : i64
      scf.if %979 {
        func.call @stack_push_pointer(%978) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%966) : (i64) -> ()
        func.call @stack_push_pointer(%967) : (i64) -> ()
        %980 = llvm.mlir.addressof @str77 : !llvm.ptr
        %981 = func.call @cc_make_function_ref_const(%980) : (!llvm.ptr) -> i64
        %982 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%981, %982) : (i64, i64) -> ()
      }
      %983 = func.call @stack_pop_pointer() : () -> i64
      %984 = func.call @cc_multiple_value_list(%983) : (i64) -> i64
      %985 = llvm.mlir.addressof @str78 : !llvm.ptr
      %986 = arith.constant 37 : i64
      %987 = func.call @cc_make_string(%985, %986) : (!llvm.ptr, i64) -> i64
      %988 = func.call @cc_nil_value() : () -> i64
      %989 = func.call @cc_intern(%987, %988) : (i64, i64) -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_cons(%989, %990) : (i64, i64) -> i64
      %992 = func.call @cc_values_pack(%991) : (i64) -> i64
      %993 = func.call @cc_symbol_value(%989) : (i64) -> i64
      %994 = llvm.mlir.addressof @str79 : !llvm.ptr
      %995 = arith.constant 38 : i64
      %996 = func.call @cc_make_string(%994, %995) : (!llvm.ptr, i64) -> i64
      %997 = func.call @cc_nil_value() : () -> i64
      %998 = func.call @cc_intern(%996, %997) : (i64, i64) -> i64
      %999 = func.call @cc_nil_value() : () -> i64
      %1000 = func.call @cc_cons(%998, %999) : (i64, i64) -> i64
      %1001 = func.call @cc_values_pack(%1000) : (i64) -> i64
      %1002 = func.call @cc_symbol_value(%998) : (i64) -> i64
      %1003 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1004 = arith.constant 39 : i64
      %1005 = func.call @cc_make_string(%1003, %1004) : (!llvm.ptr, i64) -> i64
      %1006 = func.call @cc_nil_value() : () -> i64
      %1007 = func.call @cc_intern(%1005, %1006) : (i64, i64) -> i64
      %1008 = func.call @cc_nil_value() : () -> i64
      %1009 = func.call @cc_cons(%1007, %1008) : (i64, i64) -> i64
      %1010 = func.call @cc_values_pack(%1009) : (i64) -> i64
      %1011 = func.call @cc_symbol_value(%1007) : (i64) -> i64
      %1012 = func.call @cc_nil_value() : () -> i64
      %1013 = arith.cmpi ne, %993, %1012 : i64
      %1014 = scf.if %1013 -> (i64) {
        scf.yield %1011 : i64
      } else {
        scf.yield %984 : i64
      }
      %1015 = func.call @cc_values_pack(%1014) : (i64) -> i64
      %__rlasp_stack_elide_zero_568 = arith.constant 0 : i64
      %1016 = arith.addi %1015, %__rlasp_stack_elide_zero_568 : i64
      %1017 = func.call @cc_nil_value() : () -> i64
      %1018 = func.call @cc_cons(%1016, %1017) : (i64, i64) -> i64
      %1019 = func.call @cc_not(%1018) : (i64) -> i64
      %__rlasp_stack_elide_zero_569 = arith.constant 0 : i64
      %1020 = arith.addi %1019, %__rlasp_stack_elide_zero_569 : i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_cons(%1020, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_not(%1022) : (i64) -> i64
      %__rlasp_stack_elide_zero_570 = arith.constant 0 : i64
      %1024 = arith.addi %1023, %__rlasp_stack_elide_zero_570 : i64
      scf.yield %1024 : i64
    }
    func.call @stack_push_pointer(%832) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511503"() {
    %1522 = func.call @stack_pop_pointer() : () -> i64
    %1523 = func.call @stack_pop_pointer() : () -> i64
    %1524 = func.call @cc_nil_value() : () -> i64
    %1525 = func.call @cc_nil_value() : () -> i64
    %1526 = func.call @cc_errorp(%1524) : (i64) -> i64
    %1527 = arith.cmpi ne, %1526, %1525 : i64
    %1528 = scf.if %1527 -> (i64) {
      scf.yield %1524 : i64
    } else {
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_errorp(%1522) : (i64) -> i64
      %1531 = arith.cmpi ne, %1530, %1529 : i64
      %1532 = arith.cmpi eq, %1529, %1529 : i64
      %1533 = arith.andi %1531, %1532 : i1
      %1534 = scf.if %1533 -> (i64) {
        scf.yield %1522 : i64
      } else {
        scf.yield %1529 : i64
      }
      %1535 = arith.cmpi ne, %1534, %1529 : i64
      scf.if %1535 {
        func.call @stack_push_pointer(%1534) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1522) : (i64) -> ()
        %1536 = llvm.mlir.addressof @str124 : !llvm.ptr
        %1537 = func.call @cc_make_function_ref_const(%1536) : (!llvm.ptr) -> i64
        %1538 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1537, %1538) : (i64, i64) -> ()
      }
      %1539 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1540 = arith.constant 32 : i64
      %1541 = func.call @cc_make_string(%1539, %1540) : (!llvm.ptr, i64) -> i64
      %1542 = func.call @cc_nil_value() : () -> i64
      %1543 = func.call @cc_intern(%1541, %1542) : (i64, i64) -> i64
      %1544 = func.call @cc_nil_value() : () -> i64
      %1545 = func.call @cc_cons(%1543, %1544) : (i64, i64) -> i64
      %1546 = func.call @cc_values_pack(%1545) : (i64) -> i64
      %__rlasp_stack_elide_zero_571 = arith.constant 0 : i64
      %1547 = arith.addi %1543, %__rlasp_stack_elide_zero_571 : i64
      %1548 = func.call @stack_pop_pointer() : () -> i64
      %1549 = func.call @cc_eq(%1548, %1547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_572 = arith.constant 0 : i64
      %1550 = arith.addi %1549, %__rlasp_stack_elide_zero_572 : i64
      %1551 = func.call @cc_nil_value() : () -> i64
      %1552 = arith.cmpi ne, %1550, %1551 : i64
      scf.if %1552 {
        %1553 = func.call @cc_nil_value() : () -> i64
        %1554 = func.call @cc_nil_value() : () -> i64
        %1555 = func.call @cc_errorp(%1553) : (i64) -> i64
        %1556 = arith.cmpi ne, %1555, %1554 : i64
        %1557 = scf.if %1556 -> (i64) {
          scf.yield %1553 : i64
        } else {
          %1558 = func.call @cc_symbol_value(%1523) : (i64) -> i64
          %1559 = arith.constant 1 : i64
          %1560 = func.call @cc_box_fixnum(%1559) : (i64) -> i64
          %1562 = arith.constant 3 : i64
          %1561 = arith.andi %1558, %1562 : i64
          %1563 = arith.constant 0 : i64
          %1564 = arith.cmpi eq, %1561, %1563 : i64
          %1566 = arith.constant 3 : i64
          %1565 = arith.andi %1560, %1566 : i64
          %1567 = arith.constant 0 : i64
          %1568 = arith.cmpi eq, %1565, %1567 : i64
          %1569 = arith.andi %1564, %1568 : i1
          %1570 = scf.if %1569 -> (i64) {
            %1571 = arith.constant 2 : i64
            %1572 = arith.shrsi %1558, %1571 : i64
            %1573 = arith.constant 2 : i64
            %1574 = arith.shrsi %1560, %1573 : i64
            %1575 = arith.addi %1572, %1574 : i64
            %1576 = arith.constant -2305843009213693952 : i64
            %1577 = arith.constant 2305843009213693951 : i64
            %1578 = arith.cmpi sge, %1575, %1576 : i64
            %1579 = arith.cmpi sle, %1575, %1577 : i64
            %1580 = arith.andi %1578, %1579 : i1
            %1581 = scf.if %1580 -> (i64) {
              %1582 = arith.constant 2 : i64
              %1583 = arith.shli %1575, %1582 : i64
              scf.yield %1583 : i64
            } else {
              %1584 = func.call @cc_add(%1558, %1560) : (i64, i64) -> i64
              scf.yield %1584 : i64
            }
            scf.yield %1581 : i64
          } else {
            %1585 = func.call @cc_add(%1558, %1560) : (i64, i64) -> i64
            scf.yield %1585 : i64
          }
          %__rlasp_stack_elide_zero_573 = arith.constant 0 : i64
          %1586 = arith.addi %1570, %__rlasp_stack_elide_zero_573 : i64
          %1587 = func.call @cc_set_symbol_value(%1523, %1586) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_574 = arith.constant 0 : i64
          %1588 = arith.addi %1586, %__rlasp_stack_elide_zero_574 : i64
          scf.yield %1588 : i64
        }
        func.call @stack_push_pointer(%1557) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1589 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1589 : i64
    }
    func.call @stack_push_pointer(%1528) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511501"() {
    %1497 = func.call @stack_pop_pointer() : () -> i64
    %1498 = func.call @cc_nil_value() : () -> i64
    %1499 = func.call @cc_nil_value() : () -> i64
    %1500 = func.call @cc_errorp(%1498) : (i64) -> i64
    %1501 = arith.cmpi ne, %1500, %1499 : i64
    %1502 = scf.if %1501 -> (i64) {
      scf.yield %1498 : i64
    } else {
      %1503 = arith.constant 0 : i64
      %1504 = func.call @cc_box_fixnum(%1503) : (i64) -> i64
      %1505 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1506 = arith.constant 33 : i64
      %1507 = func.call @cc_make_symbol(%1505, %1506) : (!llvm.ptr, i64) -> i64
      %1508 = func.call @cc_persistent_root_value(%1507) : (i64) -> i64
      %1509 = func.call @cc_set_symbol_value(%1508, %1504) : (i64, i64) -> i64
      %1510 = func.call @cc_nil_value() : () -> i64
      %1511 = func.call @cc_nil_value() : () -> i64
      %1512 = func.call @cc_errorp(%1510) : (i64) -> i64
      %1513 = arith.cmpi ne, %1512, %1511 : i64
      %1514 = scf.if %1513 -> (i64) {
        scf.yield %1510 : i64
      } else {
        %1515 = func.call @cc_t_value() : () -> i64
        %1516 = func.call @cc_debug_current_stack(%1515) : (i64) -> i64
        %1517 = func.call @cc_nil_value() : () -> i64
        %1518 = func.call @cc_nil_value() : () -> i64
        %1519 = func.call @cc_errorp(%1517) : (i64) -> i64
        %1520 = arith.cmpi ne, %1519, %1518 : i64
        %1521 = scf.if %1520 -> (i64) {
          scf.yield %1517 : i64
        } else {
          func.call @stack_push_pointer(%1508) : (i64) -> ()
          %1590 = arith.constant 97047688511503 : i64
          %1591 = arith.constant 1 : i64
          %1592 = func.call @cc_make_closure(%1590, %1591) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_575 = arith.constant 0 : i64
          %1593 = arith.addi %1592, %__rlasp_stack_elide_zero_575 : i64
          %1594 = func.call @cc_nil_value() : () -> i64
          %1595 = func.call @cc_errorp(%1593) : (i64) -> i64
          %1596 = arith.cmpi ne, %1595, %1594 : i64
          %1597 = arith.cmpi eq, %1594, %1594 : i64
          %1598 = arith.andi %1596, %1597 : i1
          %1599 = scf.if %1598 -> (i64) {
            scf.yield %1593 : i64
          } else {
            scf.yield %1594 : i64
          }
          %1600 = func.call @cc_errorp(%1516) : (i64) -> i64
          %1601 = arith.cmpi ne, %1600, %1594 : i64
          %1602 = arith.cmpi eq, %1599, %1594 : i64
          %1603 = arith.andi %1601, %1602 : i1
          %1604 = scf.if %1603 -> (i64) {
            scf.yield %1516 : i64
          } else {
            scf.yield %1599 : i64
          }
          %1605 = arith.cmpi ne, %1604, %1594 : i64
          scf.if %1605 {
            func.call @stack_push_pointer(%1604) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1593) : (i64) -> ()
            func.call @stack_push_pointer(%1516) : (i64) -> ()
            %1606 = llvm.mlir.addressof @str126 : !llvm.ptr
            %1607 = func.call @cc_make_function_ref_const(%1606) : (!llvm.ptr) -> i64
            %1608 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%1607, %1608) : (i64, i64) -> ()
          }
          %1609 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1609 : i64
        }
        %__rlasp_stack_elide_zero_576 = arith.constant 0 : i64
        %1610 = arith.addi %1521, %__rlasp_stack_elide_zero_576 : i64
        scf.yield %1610 : i64
      }
      %1611 = func.call @cc_nil_value() : () -> i64
      %1612 = func.call @cc_errorp(%1514) : (i64) -> i64
      %1613 = arith.cmpi ne, %1612, %1611 : i64
      %1614 = scf.if %1613 -> (i64) {
        scf.yield %1514 : i64
      } else {
        %1615 = func.call @cc_symbol_value(%1508) : (i64) -> i64
        %__rlasp_stack_elide_zero_577 = arith.constant 0 : i64
        %1616 = arith.addi %1615, %__rlasp_stack_elide_zero_577 : i64
        %1617 = func.call @cc_multiple_value_list(%1616) : (i64) -> i64
        %1618 = func.call @cc_t_value() : () -> i64
        %1619 = llvm.mlir.addressof @str127 : !llvm.ptr
        %1620 = arith.constant 37 : i64
        %1621 = func.call @cc_make_string(%1619, %1620) : (!llvm.ptr, i64) -> i64
        %1622 = func.call @cc_nil_value() : () -> i64
        %1623 = func.call @cc_intern(%1621, %1622) : (i64, i64) -> i64
        %1624 = func.call @cc_nil_value() : () -> i64
        %1625 = func.call @cc_cons(%1623, %1624) : (i64, i64) -> i64
        %1626 = func.call @cc_values_pack(%1625) : (i64) -> i64
        %1627 = func.call @cc_set_symbol_value(%1623, %1618) : (i64, i64) -> i64
        %1628 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1629 = arith.constant 38 : i64
        %1630 = func.call @cc_make_string(%1628, %1629) : (!llvm.ptr, i64) -> i64
        %1631 = func.call @cc_nil_value() : () -> i64
        %1632 = func.call @cc_intern(%1630, %1631) : (i64, i64) -> i64
        %1633 = func.call @cc_nil_value() : () -> i64
        %1634 = func.call @cc_cons(%1632, %1633) : (i64, i64) -> i64
        %1635 = func.call @cc_values_pack(%1634) : (i64) -> i64
        %1636 = func.call @cc_set_symbol_value(%1632, %1616) : (i64, i64) -> i64
        %1637 = llvm.mlir.addressof @str129 : !llvm.ptr
        %1638 = arith.constant 39 : i64
        %1639 = func.call @cc_make_string(%1637, %1638) : (!llvm.ptr, i64) -> i64
        %1640 = func.call @cc_nil_value() : () -> i64
        %1641 = func.call @cc_intern(%1639, %1640) : (i64, i64) -> i64
        %1642 = func.call @cc_nil_value() : () -> i64
        %1643 = func.call @cc_cons(%1641, %1642) : (i64, i64) -> i64
        %1644 = func.call @cc_values_pack(%1643) : (i64) -> i64
        %1645 = func.call @cc_set_symbol_value(%1641, %1617) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_578 = arith.constant 0 : i64
        %1646 = arith.addi %1616, %__rlasp_stack_elide_zero_578 : i64
        scf.yield %1646 : i64
      }
      %__rlasp_stack_elide_zero_579 = arith.constant 0 : i64
      %1647 = arith.addi %1614, %__rlasp_stack_elide_zero_579 : i64
      scf.yield %1647 : i64
    }
    func.call @stack_push_pointer(%1502) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511499"() {
    %1463 = func.call @stack_pop_pointer() : () -> i64
    %1464 = func.call @cc_nil_value() : () -> i64
    %1465 = func.call @cc_nil_value() : () -> i64
    %1466 = func.call @cc_errorp(%1464) : (i64) -> i64
    %1467 = arith.cmpi ne, %1466, %1465 : i64
    %1468 = scf.if %1467 -> (i64) {
      scf.yield %1464 : i64
    } else {
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1471 = arith.constant 37 : i64
      %1472 = func.call @cc_make_string(%1470, %1471) : (!llvm.ptr, i64) -> i64
      %1473 = func.call @cc_nil_value() : () -> i64
      %1474 = func.call @cc_intern(%1472, %1473) : (i64, i64) -> i64
      %1475 = func.call @cc_nil_value() : () -> i64
      %1476 = func.call @cc_cons(%1474, %1475) : (i64, i64) -> i64
      %1477 = func.call @cc_values_pack(%1476) : (i64) -> i64
      %1478 = func.call @cc_set_symbol_value(%1474, %1469) : (i64, i64) -> i64
      %1479 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1480 = arith.constant 38 : i64
      %1481 = func.call @cc_make_string(%1479, %1480) : (!llvm.ptr, i64) -> i64
      %1482 = func.call @cc_nil_value() : () -> i64
      %1483 = func.call @cc_intern(%1481, %1482) : (i64, i64) -> i64
      %1484 = func.call @cc_nil_value() : () -> i64
      %1485 = func.call @cc_cons(%1483, %1484) : (i64, i64) -> i64
      %1486 = func.call @cc_values_pack(%1485) : (i64) -> i64
      %1487 = func.call @cc_set_symbol_value(%1483, %1469) : (i64, i64) -> i64
      %1488 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1489 = arith.constant 39 : i64
      %1490 = func.call @cc_make_string(%1488, %1489) : (!llvm.ptr, i64) -> i64
      %1491 = func.call @cc_nil_value() : () -> i64
      %1492 = func.call @cc_intern(%1490, %1491) : (i64, i64) -> i64
      %1493 = func.call @cc_nil_value() : () -> i64
      %1494 = func.call @cc_cons(%1492, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_values_pack(%1494) : (i64) -> i64
      %1496 = func.call @cc_set_symbol_value(%1492, %1469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1463) : (i64) -> ()
      %1648 = arith.constant 97047688511501 : i64
      %1649 = arith.constant 1 : i64
      %1650 = func.call @cc_make_closure(%1648, %1649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_580 = arith.constant 0 : i64
      %1651 = arith.addi %1650, %__rlasp_stack_elide_zero_580 : i64
      %1652 = arith.constant 23 : i64
      %1653 = func.call @cc_box_fixnum(%1652) : (i64) -> i64
      %1654 = func.call @cc_nil_value() : () -> i64
      %1655 = func.call @cc_errorp(%1651) : (i64) -> i64
      %1656 = arith.cmpi ne, %1655, %1654 : i64
      %1657 = arith.cmpi eq, %1654, %1654 : i64
      %1658 = arith.andi %1656, %1657 : i1
      %1659 = scf.if %1658 -> (i64) {
        scf.yield %1651 : i64
      } else {
        scf.yield %1654 : i64
      }
      %1660 = func.call @cc_errorp(%1653) : (i64) -> i64
      %1661 = arith.cmpi ne, %1660, %1654 : i64
      %1662 = arith.cmpi eq, %1659, %1654 : i64
      %1663 = arith.andi %1661, %1662 : i1
      %1664 = scf.if %1663 -> (i64) {
        scf.yield %1653 : i64
      } else {
        scf.yield %1659 : i64
      }
      %1665 = arith.cmpi ne, %1664, %1654 : i64
      scf.if %1665 {
        func.call @stack_push_pointer(%1664) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1651) : (i64) -> ()
        func.call @stack_push_pointer(%1653) : (i64) -> ()
        %1666 = llvm.mlir.addressof @str130 : !llvm.ptr
        %1667 = func.call @cc_make_function_ref_const(%1666) : (!llvm.ptr) -> i64
        %1668 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1667, %1668) : (i64, i64) -> ()
      }
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = func.call @cc_multiple_value_list(%1669) : (i64) -> i64
      %1671 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1672 = arith.constant 37 : i64
      %1673 = func.call @cc_make_string(%1671, %1672) : (!llvm.ptr, i64) -> i64
      %1674 = func.call @cc_nil_value() : () -> i64
      %1675 = func.call @cc_intern(%1673, %1674) : (i64, i64) -> i64
      %1676 = func.call @cc_nil_value() : () -> i64
      %1677 = func.call @cc_cons(%1675, %1676) : (i64, i64) -> i64
      %1678 = func.call @cc_values_pack(%1677) : (i64) -> i64
      %1679 = func.call @cc_symbol_value(%1675) : (i64) -> i64
      %1680 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1681 = arith.constant 38 : i64
      %1682 = func.call @cc_make_string(%1680, %1681) : (!llvm.ptr, i64) -> i64
      %1683 = func.call @cc_nil_value() : () -> i64
      %1684 = func.call @cc_intern(%1682, %1683) : (i64, i64) -> i64
      %1685 = func.call @cc_nil_value() : () -> i64
      %1686 = func.call @cc_cons(%1684, %1685) : (i64, i64) -> i64
      %1687 = func.call @cc_values_pack(%1686) : (i64) -> i64
      %1688 = func.call @cc_symbol_value(%1684) : (i64) -> i64
      %1689 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1690 = arith.constant 39 : i64
      %1691 = func.call @cc_make_string(%1689, %1690) : (!llvm.ptr, i64) -> i64
      %1692 = func.call @cc_nil_value() : () -> i64
      %1693 = func.call @cc_intern(%1691, %1692) : (i64, i64) -> i64
      %1694 = func.call @cc_nil_value() : () -> i64
      %1695 = func.call @cc_cons(%1693, %1694) : (i64, i64) -> i64
      %1696 = func.call @cc_values_pack(%1695) : (i64) -> i64
      %1697 = func.call @cc_symbol_value(%1693) : (i64) -> i64
      %1698 = func.call @cc_nil_value() : () -> i64
      %1699 = arith.cmpi ne, %1679, %1698 : i64
      %1700 = scf.if %1699 -> (i64) {
        scf.yield %1697 : i64
      } else {
        scf.yield %1670 : i64
      }
      %1701 = func.call @cc_values_pack(%1700) : (i64) -> i64
      %__rlasp_stack_elide_zero_581 = arith.constant 0 : i64
      %1702 = arith.addi %1701, %__rlasp_stack_elide_zero_581 : i64
      scf.yield %1702 : i64
    }
    func.call @stack_push_pointer(%1468) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511509"() {
    %2155 = func.call @stack_pop_pointer() : () -> i64
    %2156 = func.call @stack_pop_pointer() : () -> i64
    %2157 = func.call @cc_nil_value() : () -> i64
    %2158 = func.call @cc_nil_value() : () -> i64
    %2159 = func.call @cc_errorp(%2157) : (i64) -> i64
    %2160 = arith.cmpi ne, %2159, %2158 : i64
    %2161 = scf.if %2160 -> (i64) {
      scf.yield %2157 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2162 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2162 : i64
    }
    %2163 = func.call @cc_nil_value() : () -> i64
    %2164 = func.call @cc_errorp(%2161) : (i64) -> i64
    %2165 = arith.cmpi ne, %2164, %2163 : i64
    %2166 = scf.if %2165 -> (i64) {
      scf.yield %2161 : i64
    } else {
      %2167 = func.call @cc_symbol_value(%2156) : (i64) -> i64
      %2168 = arith.constant 1 : i64
      %2169 = func.call @cc_box_fixnum(%2168) : (i64) -> i64
      %2171 = arith.constant 3 : i64
      %2170 = arith.andi %2167, %2171 : i64
      %2172 = arith.constant 0 : i64
      %2173 = arith.cmpi eq, %2170, %2172 : i64
      %2175 = arith.constant 3 : i64
      %2174 = arith.andi %2169, %2175 : i64
      %2176 = arith.constant 0 : i64
      %2177 = arith.cmpi eq, %2174, %2176 : i64
      %2178 = arith.andi %2173, %2177 : i1
      %2179 = scf.if %2178 -> (i64) {
        %2180 = arith.constant 2 : i64
        %2181 = arith.shrsi %2167, %2180 : i64
        %2182 = arith.constant 2 : i64
        %2183 = arith.shrsi %2169, %2182 : i64
        %2184 = arith.addi %2181, %2183 : i64
        %2185 = arith.constant -2305843009213693952 : i64
        %2186 = arith.constant 2305843009213693951 : i64
        %2187 = arith.cmpi sge, %2184, %2185 : i64
        %2188 = arith.cmpi sle, %2184, %2186 : i64
        %2189 = arith.andi %2187, %2188 : i1
        %2190 = scf.if %2189 -> (i64) {
          %2191 = arith.constant 2 : i64
          %2192 = arith.shli %2184, %2191 : i64
          scf.yield %2192 : i64
        } else {
          %2193 = func.call @cc_add(%2167, %2169) : (i64, i64) -> i64
          scf.yield %2193 : i64
        }
        scf.yield %2190 : i64
      } else {
        %2194 = func.call @cc_add(%2167, %2169) : (i64, i64) -> i64
        scf.yield %2194 : i64
      }
      %__rlasp_stack_elide_zero_582 = arith.constant 0 : i64
      %2195 = arith.addi %2179, %__rlasp_stack_elide_zero_582 : i64
      %2196 = func.call @cc_set_symbol_value(%2156, %2195) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_583 = arith.constant 0 : i64
      %2197 = arith.addi %2195, %__rlasp_stack_elide_zero_583 : i64
      scf.yield %2197 : i64
    }
    func.call @stack_push_pointer(%2166) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511507"() {
    %2130 = func.call @stack_pop_pointer() : () -> i64
    %2131 = func.call @cc_nil_value() : () -> i64
    %2132 = func.call @cc_nil_value() : () -> i64
    %2133 = func.call @cc_errorp(%2131) : (i64) -> i64
    %2134 = arith.cmpi ne, %2133, %2132 : i64
    %2135 = scf.if %2134 -> (i64) {
      scf.yield %2131 : i64
    } else {
      %2136 = arith.constant 0 : i64
      %2137 = func.call @cc_box_fixnum(%2136) : (i64) -> i64
      %2138 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2139 = arith.constant 33 : i64
      %2140 = func.call @cc_make_symbol(%2138, %2139) : (!llvm.ptr, i64) -> i64
      %2141 = func.call @cc_persistent_root_value(%2140) : (i64) -> i64
      %2142 = func.call @cc_set_symbol_value(%2141, %2137) : (i64, i64) -> i64
      %2143 = func.call @cc_nil_value() : () -> i64
      %2144 = func.call @cc_nil_value() : () -> i64
      %2145 = func.call @cc_errorp(%2143) : (i64) -> i64
      %2146 = arith.cmpi ne, %2145, %2144 : i64
      %2147 = scf.if %2146 -> (i64) {
        scf.yield %2143 : i64
      } else {
        %2148 = func.call @cc_t_value() : () -> i64
        %2149 = func.call @cc_debug_current_stack(%2148) : (i64) -> i64
        %2150 = func.call @cc_nil_value() : () -> i64
        %2151 = func.call @cc_nil_value() : () -> i64
        %2152 = func.call @cc_errorp(%2150) : (i64) -> i64
        %2153 = arith.cmpi ne, %2152, %2151 : i64
        %2154 = scf.if %2153 -> (i64) {
          scf.yield %2150 : i64
        } else {
          func.call @stack_push_pointer(%2141) : (i64) -> ()
          %2198 = arith.constant 97047688511509 : i64
          %2199 = arith.constant 1 : i64
          %2200 = func.call @cc_make_closure(%2198, %2199) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_584 = arith.constant 0 : i64
          %2201 = arith.addi %2200, %__rlasp_stack_elide_zero_584 : i64
          %2202 = llvm.mlir.addressof @str174 : !llvm.ptr
          %2203 = arith.constant 5 : i64
          %2204 = func.call @cc_make_string(%2202, %2203) : (!llvm.ptr, i64) -> i64
          %2205 = llvm.mlir.addressof @str175 : !llvm.ptr
          %2206 = arith.constant 7 : i64
          %2207 = func.call @cc_make_string(%2205, %2206) : (!llvm.ptr, i64) -> i64
          %2208 = func.call @cc_intern(%2204, %2207) : (i64, i64) -> i64
          %2209 = func.call @cc_nil_value() : () -> i64
          %2210 = func.call @cc_cons(%2208, %2209) : (i64, i64) -> i64
          %2211 = func.call @cc_values_pack(%2210) : (i64) -> i64
          %2212 = arith.constant 7 : i64
          %2213 = func.call @cc_box_fixnum(%2212) : (i64) -> i64
          %2214 = func.call @cc_nil_value() : () -> i64
          %2215 = func.call @cc_errorp(%2201) : (i64) -> i64
          %2216 = arith.cmpi ne, %2215, %2214 : i64
          %2217 = arith.cmpi eq, %2214, %2214 : i64
          %2218 = arith.andi %2216, %2217 : i1
          %2219 = scf.if %2218 -> (i64) {
            scf.yield %2201 : i64
          } else {
            scf.yield %2214 : i64
          }
          %2220 = func.call @cc_errorp(%2149) : (i64) -> i64
          %2221 = arith.cmpi ne, %2220, %2214 : i64
          %2222 = arith.cmpi eq, %2219, %2214 : i64
          %2223 = arith.andi %2221, %2222 : i1
          %2224 = scf.if %2223 -> (i64) {
            scf.yield %2149 : i64
          } else {
            scf.yield %2219 : i64
          }
          %2225 = func.call @cc_errorp(%2208) : (i64) -> i64
          %2226 = arith.cmpi ne, %2225, %2214 : i64
          %2227 = arith.cmpi eq, %2224, %2214 : i64
          %2228 = arith.andi %2226, %2227 : i1
          %2229 = scf.if %2228 -> (i64) {
            scf.yield %2208 : i64
          } else {
            scf.yield %2224 : i64
          }
          %2230 = func.call @cc_errorp(%2213) : (i64) -> i64
          %2231 = arith.cmpi ne, %2230, %2214 : i64
          %2232 = arith.cmpi eq, %2229, %2214 : i64
          %2233 = arith.andi %2231, %2232 : i1
          %2234 = scf.if %2233 -> (i64) {
            scf.yield %2213 : i64
          } else {
            scf.yield %2229 : i64
          }
          %2235 = arith.cmpi ne, %2234, %2214 : i64
          scf.if %2235 {
            func.call @stack_push_pointer(%2234) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2201) : (i64) -> ()
            func.call @stack_push_pointer(%2149) : (i64) -> ()
            func.call @stack_push_pointer(%2208) : (i64) -> ()
            func.call @stack_push_pointer(%2213) : (i64) -> ()
            %2236 = llvm.mlir.addressof @str176 : !llvm.ptr
            %2237 = func.call @cc_make_function_ref_const(%2236) : (!llvm.ptr) -> i64
            %2238 = arith.constant 4 : i64
            func.call @cc_funcall_stack(%2237, %2238) : (i64, i64) -> ()
          }
          %2239 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2239 : i64
        }
        %__rlasp_stack_elide_zero_585 = arith.constant 0 : i64
        %2240 = arith.addi %2154, %__rlasp_stack_elide_zero_585 : i64
        scf.yield %2240 : i64
      }
      %2241 = func.call @cc_nil_value() : () -> i64
      %2242 = func.call @cc_errorp(%2147) : (i64) -> i64
      %2243 = arith.cmpi ne, %2242, %2241 : i64
      %2244 = scf.if %2243 -> (i64) {
        scf.yield %2147 : i64
      } else {
        %2245 = func.call @cc_symbol_value(%2141) : (i64) -> i64
        %__rlasp_stack_elide_zero_586 = arith.constant 0 : i64
        %2246 = arith.addi %2245, %__rlasp_stack_elide_zero_586 : i64
        %2247 = func.call @cc_multiple_value_list(%2246) : (i64) -> i64
        %2248 = func.call @cc_t_value() : () -> i64
        %2249 = llvm.mlir.addressof @str177 : !llvm.ptr
        %2250 = arith.constant 37 : i64
        %2251 = func.call @cc_make_string(%2249, %2250) : (!llvm.ptr, i64) -> i64
        %2252 = func.call @cc_nil_value() : () -> i64
        %2253 = func.call @cc_intern(%2251, %2252) : (i64, i64) -> i64
        %2254 = func.call @cc_nil_value() : () -> i64
        %2255 = func.call @cc_cons(%2253, %2254) : (i64, i64) -> i64
        %2256 = func.call @cc_values_pack(%2255) : (i64) -> i64
        %2257 = func.call @cc_set_symbol_value(%2253, %2248) : (i64, i64) -> i64
        %2258 = llvm.mlir.addressof @str178 : !llvm.ptr
        %2259 = arith.constant 38 : i64
        %2260 = func.call @cc_make_string(%2258, %2259) : (!llvm.ptr, i64) -> i64
        %2261 = func.call @cc_nil_value() : () -> i64
        %2262 = func.call @cc_intern(%2260, %2261) : (i64, i64) -> i64
        %2263 = func.call @cc_nil_value() : () -> i64
        %2264 = func.call @cc_cons(%2262, %2263) : (i64, i64) -> i64
        %2265 = func.call @cc_values_pack(%2264) : (i64) -> i64
        %2266 = func.call @cc_set_symbol_value(%2262, %2246) : (i64, i64) -> i64
        %2267 = llvm.mlir.addressof @str179 : !llvm.ptr
        %2268 = arith.constant 39 : i64
        %2269 = func.call @cc_make_string(%2267, %2268) : (!llvm.ptr, i64) -> i64
        %2270 = func.call @cc_nil_value() : () -> i64
        %2271 = func.call @cc_intern(%2269, %2270) : (i64, i64) -> i64
        %2272 = func.call @cc_nil_value() : () -> i64
        %2273 = func.call @cc_cons(%2271, %2272) : (i64, i64) -> i64
        %2274 = func.call @cc_values_pack(%2273) : (i64) -> i64
        %2275 = func.call @cc_set_symbol_value(%2271, %2247) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_587 = arith.constant 0 : i64
        %2276 = arith.addi %2246, %__rlasp_stack_elide_zero_587 : i64
        scf.yield %2276 : i64
      }
      %__rlasp_stack_elide_zero_588 = arith.constant 0 : i64
      %2277 = arith.addi %2244, %__rlasp_stack_elide_zero_588 : i64
      scf.yield %2277 : i64
    }
    func.call @stack_push_pointer(%2135) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511505"() {
    %2096 = func.call @stack_pop_pointer() : () -> i64
    %2097 = func.call @cc_nil_value() : () -> i64
    %2098 = func.call @cc_nil_value() : () -> i64
    %2099 = func.call @cc_errorp(%2097) : (i64) -> i64
    %2100 = arith.cmpi ne, %2099, %2098 : i64
    %2101 = scf.if %2100 -> (i64) {
      scf.yield %2097 : i64
    } else {
      %2102 = func.call @cc_nil_value() : () -> i64
      %2103 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2104 = arith.constant 37 : i64
      %2105 = func.call @cc_make_string(%2103, %2104) : (!llvm.ptr, i64) -> i64
      %2106 = func.call @cc_nil_value() : () -> i64
      %2107 = func.call @cc_intern(%2105, %2106) : (i64, i64) -> i64
      %2108 = func.call @cc_nil_value() : () -> i64
      %2109 = func.call @cc_cons(%2107, %2108) : (i64, i64) -> i64
      %2110 = func.call @cc_values_pack(%2109) : (i64) -> i64
      %2111 = func.call @cc_set_symbol_value(%2107, %2102) : (i64, i64) -> i64
      %2112 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2113 = arith.constant 38 : i64
      %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
      %2115 = func.call @cc_nil_value() : () -> i64
      %2116 = func.call @cc_intern(%2114, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_nil_value() : () -> i64
      %2118 = func.call @cc_cons(%2116, %2117) : (i64, i64) -> i64
      %2119 = func.call @cc_values_pack(%2118) : (i64) -> i64
      %2120 = func.call @cc_set_symbol_value(%2116, %2102) : (i64, i64) -> i64
      %2121 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2122 = arith.constant 39 : i64
      %2123 = func.call @cc_make_string(%2121, %2122) : (!llvm.ptr, i64) -> i64
      %2124 = func.call @cc_nil_value() : () -> i64
      %2125 = func.call @cc_intern(%2123, %2124) : (i64, i64) -> i64
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = func.call @cc_cons(%2125, %2126) : (i64, i64) -> i64
      %2128 = func.call @cc_values_pack(%2127) : (i64) -> i64
      %2129 = func.call @cc_set_symbol_value(%2125, %2102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2278 = arith.constant 97047688511507 : i64
      %2279 = arith.constant 1 : i64
      %2280 = func.call @cc_make_closure(%2278, %2279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_589 = arith.constant 0 : i64
      %2281 = arith.addi %2280, %__rlasp_stack_elide_zero_589 : i64
      %2282 = arith.constant 23 : i64
      %2283 = func.call @cc_box_fixnum(%2282) : (i64) -> i64
      %2284 = func.call @cc_nil_value() : () -> i64
      %2285 = func.call @cc_errorp(%2281) : (i64) -> i64
      %2286 = arith.cmpi ne, %2285, %2284 : i64
      %2287 = arith.cmpi eq, %2284, %2284 : i64
      %2288 = arith.andi %2286, %2287 : i1
      %2289 = scf.if %2288 -> (i64) {
        scf.yield %2281 : i64
      } else {
        scf.yield %2284 : i64
      }
      %2290 = func.call @cc_errorp(%2283) : (i64) -> i64
      %2291 = arith.cmpi ne, %2290, %2284 : i64
      %2292 = arith.cmpi eq, %2289, %2284 : i64
      %2293 = arith.andi %2291, %2292 : i1
      %2294 = scf.if %2293 -> (i64) {
        scf.yield %2283 : i64
      } else {
        scf.yield %2289 : i64
      }
      %2295 = arith.cmpi ne, %2294, %2284 : i64
      scf.if %2295 {
        func.call @stack_push_pointer(%2294) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2281) : (i64) -> ()
        func.call @stack_push_pointer(%2283) : (i64) -> ()
        %2296 = llvm.mlir.addressof @str180 : !llvm.ptr
        %2297 = func.call @cc_make_function_ref_const(%2296) : (!llvm.ptr) -> i64
        %2298 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2297, %2298) : (i64, i64) -> ()
      }
      %2299 = func.call @stack_pop_pointer() : () -> i64
      %2300 = func.call @cc_multiple_value_list(%2299) : (i64) -> i64
      %2301 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2302 = arith.constant 37 : i64
      %2303 = func.call @cc_make_string(%2301, %2302) : (!llvm.ptr, i64) -> i64
      %2304 = func.call @cc_nil_value() : () -> i64
      %2305 = func.call @cc_intern(%2303, %2304) : (i64, i64) -> i64
      %2306 = func.call @cc_nil_value() : () -> i64
      %2307 = func.call @cc_cons(%2305, %2306) : (i64, i64) -> i64
      %2308 = func.call @cc_values_pack(%2307) : (i64) -> i64
      %2309 = func.call @cc_symbol_value(%2305) : (i64) -> i64
      %2310 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2311 = arith.constant 38 : i64
      %2312 = func.call @cc_make_string(%2310, %2311) : (!llvm.ptr, i64) -> i64
      %2313 = func.call @cc_nil_value() : () -> i64
      %2314 = func.call @cc_intern(%2312, %2313) : (i64, i64) -> i64
      %2315 = func.call @cc_nil_value() : () -> i64
      %2316 = func.call @cc_cons(%2314, %2315) : (i64, i64) -> i64
      %2317 = func.call @cc_values_pack(%2316) : (i64) -> i64
      %2318 = func.call @cc_symbol_value(%2314) : (i64) -> i64
      %2319 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2320 = arith.constant 39 : i64
      %2321 = func.call @cc_make_string(%2319, %2320) : (!llvm.ptr, i64) -> i64
      %2322 = func.call @cc_nil_value() : () -> i64
      %2323 = func.call @cc_intern(%2321, %2322) : (i64, i64) -> i64
      %2324 = func.call @cc_nil_value() : () -> i64
      %2325 = func.call @cc_cons(%2323, %2324) : (i64, i64) -> i64
      %2326 = func.call @cc_values_pack(%2325) : (i64) -> i64
      %2327 = func.call @cc_symbol_value(%2323) : (i64) -> i64
      %2328 = func.call @cc_nil_value() : () -> i64
      %2329 = arith.cmpi ne, %2309, %2328 : i64
      %2330 = scf.if %2329 -> (i64) {
        scf.yield %2327 : i64
      } else {
        scf.yield %2300 : i64
      }
      %2331 = func.call @cc_values_pack(%2330) : (i64) -> i64
      %__rlasp_stack_elide_zero_590 = arith.constant 0 : i64
      %2332 = arith.addi %2331, %__rlasp_stack_elide_zero_590 : i64
      scf.yield %2332 : i64
    }
    func.call @stack_push_pointer(%2101) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511516"() {
    %2812 = func.call @stack_pop_pointer() : () -> i64
    %2813 = func.call @cc_nil_value() : () -> i64
    %2814 = func.call @cc_nil_value() : () -> i64
    %2815 = func.call @cc_errorp(%2813) : (i64) -> i64
    %2816 = arith.cmpi ne, %2815, %2814 : i64
    %2817 = scf.if %2816 -> (i64) {
      scf.yield %2813 : i64
    } else {
      %2818 = func.call @cc_nil_value() : () -> i64
      %2819 = func.call @cc_errorp(%2812) : (i64) -> i64
      %2820 = arith.cmpi ne, %2819, %2818 : i64
      %2821 = arith.cmpi eq, %2818, %2818 : i64
      %2822 = arith.andi %2820, %2821 : i1
      %2823 = scf.if %2822 -> (i64) {
        scf.yield %2812 : i64
      } else {
        scf.yield %2818 : i64
      }
      %2824 = arith.cmpi ne, %2823, %2818 : i64
      scf.if %2824 {
        func.call @stack_push_pointer(%2823) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2812) : (i64) -> ()
        %2825 = llvm.mlir.addressof @str226 : !llvm.ptr
        %2826 = func.call @cc_make_function_ref_const(%2825) : (!llvm.ptr) -> i64
        %2827 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2826, %2827) : (i64, i64) -> ()
      }
      %2828 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2829 = arith.constant 32 : i64
      %2830 = func.call @cc_make_string(%2828, %2829) : (!llvm.ptr, i64) -> i64
      %2831 = func.call @cc_nil_value() : () -> i64
      %2832 = func.call @cc_intern(%2830, %2831) : (i64, i64) -> i64
      %2833 = func.call @cc_nil_value() : () -> i64
      %2834 = func.call @cc_cons(%2832, %2833) : (i64, i64) -> i64
      %2835 = func.call @cc_values_pack(%2834) : (i64) -> i64
      %__rlasp_stack_elide_zero_591 = arith.constant 0 : i64
      %2836 = arith.addi %2832, %__rlasp_stack_elide_zero_591 : i64
      %2837 = func.call @stack_pop_pointer() : () -> i64
      %2838 = func.call @cc_eq(%2837, %2836) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_592 = arith.constant 0 : i64
      %2839 = arith.addi %2838, %__rlasp_stack_elide_zero_592 : i64
      %2840 = func.call @cc_nil_value() : () -> i64
      %2841 = arith.cmpi ne, %2839, %2840 : i64
      scf.if %2841 {
        %2842 = func.call @cc_nil_value() : () -> i64
        %2843 = func.call @cc_nil_value() : () -> i64
        %2844 = func.call @cc_errorp(%2842) : (i64) -> i64
        %2845 = arith.cmpi ne, %2844, %2843 : i64
        %2846 = scf.if %2845 -> (i64) {
          scf.yield %2842 : i64
        } else {
          %2847 = func.call @cc_nil_value() : () -> i64
          %2848 = func.call @cc_errorp(%2812) : (i64) -> i64
          %2849 = arith.cmpi ne, %2848, %2847 : i64
          %2850 = arith.cmpi eq, %2847, %2847 : i64
          %2851 = arith.andi %2849, %2850 : i1
          %2852 = scf.if %2851 -> (i64) {
            scf.yield %2812 : i64
          } else {
            scf.yield %2847 : i64
          }
          %2853 = arith.cmpi ne, %2852, %2847 : i64
          scf.if %2853 {
            func.call @stack_push_pointer(%2852) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2812) : (i64) -> ()
            %2854 = llvm.mlir.addressof @str228 : !llvm.ptr
            %2855 = func.call @cc_make_function_ref_const(%2854) : (!llvm.ptr) -> i64
            %2856 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2855, %2856) : (i64, i64) -> ()
          }
          %2857 = func.call @stack_pop_pointer() : () -> i64
          %2858 = func.call @cc_multiple_value_list(%2857) : (i64) -> i64
          %2859 = func.call @cc_t_value() : () -> i64
          %2860 = llvm.mlir.addressof @str229 : !llvm.ptr
          %2861 = arith.constant 37 : i64
          %2862 = func.call @cc_make_string(%2860, %2861) : (!llvm.ptr, i64) -> i64
          %2863 = func.call @cc_nil_value() : () -> i64
          %2864 = func.call @cc_intern(%2862, %2863) : (i64, i64) -> i64
          %2865 = func.call @cc_nil_value() : () -> i64
          %2866 = func.call @cc_cons(%2864, %2865) : (i64, i64) -> i64
          %2867 = func.call @cc_values_pack(%2866) : (i64) -> i64
          %2868 = func.call @cc_set_symbol_value(%2864, %2859) : (i64, i64) -> i64
          %2869 = llvm.mlir.addressof @str230 : !llvm.ptr
          %2870 = arith.constant 38 : i64
          %2871 = func.call @cc_make_string(%2869, %2870) : (!llvm.ptr, i64) -> i64
          %2872 = func.call @cc_nil_value() : () -> i64
          %2873 = func.call @cc_intern(%2871, %2872) : (i64, i64) -> i64
          %2874 = func.call @cc_nil_value() : () -> i64
          %2875 = func.call @cc_cons(%2873, %2874) : (i64, i64) -> i64
          %2876 = func.call @cc_values_pack(%2875) : (i64) -> i64
          %2877 = func.call @cc_set_symbol_value(%2873, %2857) : (i64, i64) -> i64
          %2878 = llvm.mlir.addressof @str231 : !llvm.ptr
          %2879 = arith.constant 39 : i64
          %2880 = func.call @cc_make_string(%2878, %2879) : (!llvm.ptr, i64) -> i64
          %2881 = func.call @cc_nil_value() : () -> i64
          %2882 = func.call @cc_intern(%2880, %2881) : (i64, i64) -> i64
          %2883 = func.call @cc_nil_value() : () -> i64
          %2884 = func.call @cc_cons(%2882, %2883) : (i64, i64) -> i64
          %2885 = func.call @cc_values_pack(%2884) : (i64) -> i64
          %2886 = func.call @cc_set_symbol_value(%2882, %2858) : (i64, i64) -> i64
          %2887 = llvm.mlir.addressof @str232 : !llvm.ptr
          %2888 = arith.constant 37 : i64
          %2889 = func.call @cc_make_string(%2887, %2888) : (!llvm.ptr, i64) -> i64
          %2890 = func.call @cc_nil_value() : () -> i64
          %2891 = func.call @cc_intern(%2889, %2890) : (i64, i64) -> i64
          %2892 = func.call @cc_nil_value() : () -> i64
          %2893 = func.call @cc_cons(%2891, %2892) : (i64, i64) -> i64
          %2894 = func.call @cc_values_pack(%2893) : (i64) -> i64
          %2895 = func.call @cc_set_symbol_value(%2891, %2859) : (i64, i64) -> i64
          %2896 = llvm.mlir.addressof @str233 : !llvm.ptr
          %2897 = arith.constant 38 : i64
          %2898 = func.call @cc_make_string(%2896, %2897) : (!llvm.ptr, i64) -> i64
          %2899 = func.call @cc_nil_value() : () -> i64
          %2900 = func.call @cc_intern(%2898, %2899) : (i64, i64) -> i64
          %2901 = func.call @cc_nil_value() : () -> i64
          %2902 = func.call @cc_cons(%2900, %2901) : (i64, i64) -> i64
          %2903 = func.call @cc_values_pack(%2902) : (i64) -> i64
          %2904 = func.call @cc_set_symbol_value(%2900, %2857) : (i64, i64) -> i64
          %2905 = llvm.mlir.addressof @str234 : !llvm.ptr
          %2906 = arith.constant 39 : i64
          %2907 = func.call @cc_make_string(%2905, %2906) : (!llvm.ptr, i64) -> i64
          %2908 = func.call @cc_nil_value() : () -> i64
          %2909 = func.call @cc_intern(%2907, %2908) : (i64, i64) -> i64
          %2910 = func.call @cc_nil_value() : () -> i64
          %2911 = func.call @cc_cons(%2909, %2910) : (i64, i64) -> i64
          %2912 = func.call @cc_values_pack(%2911) : (i64) -> i64
          %2913 = func.call @cc_set_symbol_value(%2909, %2858) : (i64, i64) -> i64
          %2914 = llvm.mlir.addressof @str235 : !llvm.ptr
          %2915 = arith.constant 37 : i64
          %2916 = func.call @cc_make_string(%2914, %2915) : (!llvm.ptr, i64) -> i64
          %2917 = func.call @cc_nil_value() : () -> i64
          %2918 = func.call @cc_intern(%2916, %2917) : (i64, i64) -> i64
          %2919 = func.call @cc_nil_value() : () -> i64
          %2920 = func.call @cc_cons(%2918, %2919) : (i64, i64) -> i64
          %2921 = func.call @cc_values_pack(%2920) : (i64) -> i64
          %2922 = func.call @cc_set_symbol_value(%2918, %2859) : (i64, i64) -> i64
          %2923 = llvm.mlir.addressof @str236 : !llvm.ptr
          %2924 = arith.constant 38 : i64
          %2925 = func.call @cc_make_string(%2923, %2924) : (!llvm.ptr, i64) -> i64
          %2926 = func.call @cc_nil_value() : () -> i64
          %2927 = func.call @cc_intern(%2925, %2926) : (i64, i64) -> i64
          %2928 = func.call @cc_nil_value() : () -> i64
          %2929 = func.call @cc_cons(%2927, %2928) : (i64, i64) -> i64
          %2930 = func.call @cc_values_pack(%2929) : (i64) -> i64
          %2931 = func.call @cc_set_symbol_value(%2927, %2857) : (i64, i64) -> i64
          %2932 = llvm.mlir.addressof @str237 : !llvm.ptr
          %2933 = arith.constant 39 : i64
          %2934 = func.call @cc_make_string(%2932, %2933) : (!llvm.ptr, i64) -> i64
          %2935 = func.call @cc_nil_value() : () -> i64
          %2936 = func.call @cc_intern(%2934, %2935) : (i64, i64) -> i64
          %2937 = func.call @cc_nil_value() : () -> i64
          %2938 = func.call @cc_cons(%2936, %2937) : (i64, i64) -> i64
          %2939 = func.call @cc_values_pack(%2938) : (i64) -> i64
          %2940 = func.call @cc_set_symbol_value(%2936, %2858) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_593 = arith.constant 0 : i64
          %2941 = arith.addi %2857, %__rlasp_stack_elide_zero_593 : i64
          scf.yield %2941 : i64
        }
        func.call @stack_push_pointer(%2846) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %2942 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2942 : i64
    }
    func.call @stack_push_pointer(%2817) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511513"() {
    %2747 = llvm.mlir.addressof @str219 : !llvm.ptr
    %2748 = arith.constant 23 : i64
    %2749 = func.call @cc_make_string(%2747, %2748) : (!llvm.ptr, i64) -> i64
    %2750 = func.call @cc_nil_value() : () -> i64
    %2751 = func.call @cc_intern(%2749, %2750) : (i64, i64) -> i64
    %2752 = func.call @cc_nil_value() : () -> i64
    %2753 = func.call @cc_cons(%2751, %2752) : (i64, i64) -> i64
    %2754 = func.call @cc_values_pack(%2753) : (i64) -> i64
    %2755 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%2751, %2755) : (i64, i64) -> ()
    %2756 = func.call @cc_nil_value() : () -> i64
    %2757 = llvm.mlir.addressof @str220 : !llvm.ptr
    %2758 = arith.constant 37 : i64
    %2759 = func.call @cc_make_string(%2757, %2758) : (!llvm.ptr, i64) -> i64
    %2760 = func.call @cc_nil_value() : () -> i64
    %2761 = func.call @cc_intern(%2759, %2760) : (i64, i64) -> i64
    %2762 = func.call @cc_nil_value() : () -> i64
    %2763 = func.call @cc_cons(%2761, %2762) : (i64, i64) -> i64
    %2764 = func.call @cc_values_pack(%2763) : (i64) -> i64
    %2765 = func.call @cc_set_symbol_value(%2761, %2756) : (i64, i64) -> i64
    %2766 = llvm.mlir.addressof @str221 : !llvm.ptr
    %2767 = arith.constant 38 : i64
    %2768 = func.call @cc_make_string(%2766, %2767) : (!llvm.ptr, i64) -> i64
    %2769 = func.call @cc_nil_value() : () -> i64
    %2770 = func.call @cc_intern(%2768, %2769) : (i64, i64) -> i64
    %2771 = func.call @cc_nil_value() : () -> i64
    %2772 = func.call @cc_cons(%2770, %2771) : (i64, i64) -> i64
    %2773 = func.call @cc_values_pack(%2772) : (i64) -> i64
    %2774 = func.call @cc_set_symbol_value(%2770, %2756) : (i64, i64) -> i64
    %2775 = llvm.mlir.addressof @str222 : !llvm.ptr
    %2776 = arith.constant 39 : i64
    %2777 = func.call @cc_make_string(%2775, %2776) : (!llvm.ptr, i64) -> i64
    %2778 = func.call @cc_nil_value() : () -> i64
    %2779 = func.call @cc_intern(%2777, %2778) : (i64, i64) -> i64
    %2780 = func.call @cc_nil_value() : () -> i64
    %2781 = func.call @cc_cons(%2779, %2780) : (i64, i64) -> i64
    %2782 = func.call @cc_values_pack(%2781) : (i64) -> i64
    %2783 = func.call @cc_set_symbol_value(%2779, %2756) : (i64, i64) -> i64
    %2784 = func.call @cc_nil_value() : () -> i64
    %2785 = llvm.mlir.addressof @str223 : !llvm.ptr
    %2786 = arith.constant 37 : i64
    %2787 = func.call @cc_make_string(%2785, %2786) : (!llvm.ptr, i64) -> i64
    %2788 = func.call @cc_nil_value() : () -> i64
    %2789 = func.call @cc_intern(%2787, %2788) : (i64, i64) -> i64
    %2790 = func.call @cc_nil_value() : () -> i64
    %2791 = func.call @cc_cons(%2789, %2790) : (i64, i64) -> i64
    %2792 = func.call @cc_values_pack(%2791) : (i64) -> i64
    %2793 = func.call @cc_set_symbol_value(%2789, %2784) : (i64, i64) -> i64
    %2794 = llvm.mlir.addressof @str224 : !llvm.ptr
    %2795 = arith.constant 38 : i64
    %2796 = func.call @cc_make_string(%2794, %2795) : (!llvm.ptr, i64) -> i64
    %2797 = func.call @cc_nil_value() : () -> i64
    %2798 = func.call @cc_intern(%2796, %2797) : (i64, i64) -> i64
    %2799 = func.call @cc_nil_value() : () -> i64
    %2800 = func.call @cc_cons(%2798, %2799) : (i64, i64) -> i64
    %2801 = func.call @cc_values_pack(%2800) : (i64) -> i64
    %2802 = func.call @cc_set_symbol_value(%2798, %2784) : (i64, i64) -> i64
    %2803 = llvm.mlir.addressof @str225 : !llvm.ptr
    %2804 = arith.constant 39 : i64
    %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
    %2806 = func.call @cc_nil_value() : () -> i64
    %2807 = func.call @cc_intern(%2805, %2806) : (i64, i64) -> i64
    %2808 = func.call @cc_nil_value() : () -> i64
    %2809 = func.call @cc_cons(%2807, %2808) : (i64, i64) -> i64
    %2810 = func.call @cc_values_pack(%2809) : (i64) -> i64
    %2811 = func.call @cc_set_symbol_value(%2807, %2784) : (i64, i64) -> i64
    %2943 = arith.constant 97047688511516 : i64
    %2944 = arith.constant 0 : i64
    %2945 = func.call @cc_make_closure(%2943, %2944) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_594 = arith.constant 0 : i64
    %2946 = arith.addi %2945, %__rlasp_stack_elide_zero_594 : i64
    %2947 = func.call @cc_nil_value() : () -> i64
    %2948 = func.call @cc_errorp(%2946) : (i64) -> i64
    %2949 = arith.cmpi ne, %2948, %2947 : i64
    %2950 = arith.cmpi eq, %2947, %2947 : i64
    %2951 = arith.andi %2949, %2950 : i1
    %2952 = scf.if %2951 -> (i64) {
      scf.yield %2946 : i64
    } else {
      scf.yield %2947 : i64
    }
    %2953 = arith.cmpi ne, %2952, %2947 : i64
    scf.if %2953 {
      func.call @stack_push_pointer(%2952) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%2946) : (i64) -> ()
      %2954 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2955 = func.call @cc_make_function_ref_const(%2954) : (!llvm.ptr) -> i64
      %2956 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%2955, %2956) : (i64, i64) -> ()
    }
    %2957 = func.call @stack_pop_pointer() : () -> i64
    %2958 = func.call @cc_multiple_value_list(%2957) : (i64) -> i64
    %2959 = llvm.mlir.addressof @str239 : !llvm.ptr
    %2960 = arith.constant 37 : i64
    %2961 = func.call @cc_make_string(%2959, %2960) : (!llvm.ptr, i64) -> i64
    %2962 = func.call @cc_nil_value() : () -> i64
    %2963 = func.call @cc_intern(%2961, %2962) : (i64, i64) -> i64
    %2964 = func.call @cc_nil_value() : () -> i64
    %2965 = func.call @cc_cons(%2963, %2964) : (i64, i64) -> i64
    %2966 = func.call @cc_values_pack(%2965) : (i64) -> i64
    %2967 = func.call @cc_symbol_value(%2963) : (i64) -> i64
    %2968 = llvm.mlir.addressof @str240 : !llvm.ptr
    %2969 = arith.constant 38 : i64
    %2970 = func.call @cc_make_string(%2968, %2969) : (!llvm.ptr, i64) -> i64
    %2971 = func.call @cc_nil_value() : () -> i64
    %2972 = func.call @cc_intern(%2970, %2971) : (i64, i64) -> i64
    %2973 = func.call @cc_nil_value() : () -> i64
    %2974 = func.call @cc_cons(%2972, %2973) : (i64, i64) -> i64
    %2975 = func.call @cc_values_pack(%2974) : (i64) -> i64
    %2976 = func.call @cc_symbol_value(%2972) : (i64) -> i64
    %2977 = llvm.mlir.addressof @str241 : !llvm.ptr
    %2978 = arith.constant 39 : i64
    %2979 = func.call @cc_make_string(%2977, %2978) : (!llvm.ptr, i64) -> i64
    %2980 = func.call @cc_nil_value() : () -> i64
    %2981 = func.call @cc_intern(%2979, %2980) : (i64, i64) -> i64
    %2982 = func.call @cc_nil_value() : () -> i64
    %2983 = func.call @cc_cons(%2981, %2982) : (i64, i64) -> i64
    %2984 = func.call @cc_values_pack(%2983) : (i64) -> i64
    %2985 = func.call @cc_symbol_value(%2981) : (i64) -> i64
    %2986 = func.call @cc_nil_value() : () -> i64
    %2987 = arith.cmpi ne, %2967, %2986 : i64
    %2988 = scf.if %2987 -> (i64) {
      scf.yield %2985 : i64
    } else {
      scf.yield %2958 : i64
    }
    %2989 = func.call @cc_values_pack(%2988) : (i64) -> i64
    %__rlasp_stack_elide_zero_595 = arith.constant 0 : i64
    %2990 = arith.addi %2989, %__rlasp_stack_elide_zero_595 : i64
    %2991 = func.call @cc_multiple_value_list(%2990) : (i64) -> i64
    %2992 = llvm.mlir.addressof @str242 : !llvm.ptr
    %2993 = arith.constant 37 : i64
    %2994 = func.call @cc_make_string(%2992, %2993) : (!llvm.ptr, i64) -> i64
    %2995 = func.call @cc_nil_value() : () -> i64
    %2996 = func.call @cc_intern(%2994, %2995) : (i64, i64) -> i64
    %2997 = func.call @cc_nil_value() : () -> i64
    %2998 = func.call @cc_cons(%2996, %2997) : (i64, i64) -> i64
    %2999 = func.call @cc_values_pack(%2998) : (i64) -> i64
    %3000 = func.call @cc_symbol_value(%2996) : (i64) -> i64
    %3001 = llvm.mlir.addressof @str243 : !llvm.ptr
    %3002 = arith.constant 39 : i64
    %3003 = func.call @cc_make_string(%3001, %3002) : (!llvm.ptr, i64) -> i64
    %3004 = func.call @cc_nil_value() : () -> i64
    %3005 = func.call @cc_intern(%3003, %3004) : (i64, i64) -> i64
    %3006 = func.call @cc_nil_value() : () -> i64
    %3007 = func.call @cc_cons(%3005, %3006) : (i64, i64) -> i64
    %3008 = func.call @cc_values_pack(%3007) : (i64) -> i64
    %3009 = func.call @cc_symbol_value(%3005) : (i64) -> i64
    %3010 = func.call @cc_nil_value() : () -> i64
    %3011 = arith.cmpi ne, %3000, %3010 : i64
    %3012 = scf.if %3011 -> (i64) {
      scf.yield %3009 : i64
    } else {
      scf.yield %2991 : i64
    }
    %3013 = func.call @cc_values_pack(%3012) : (i64) -> i64
    func.call @stack_push_pointer(%3013) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511511"() {
    %2708 = func.call @stack_pop_pointer() : () -> i64
    %2709 = func.call @cc_nil_value() : () -> i64
    %2710 = func.call @cc_nil_value() : () -> i64
    %2711 = func.call @cc_errorp(%2709) : (i64) -> i64
    %2712 = arith.cmpi ne, %2711, %2710 : i64
    %2713 = scf.if %2712 -> (i64) {
      scf.yield %2709 : i64
    } else {
      %2714 = func.call @cc_nil_value() : () -> i64
      %2715 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2716 = arith.constant 37 : i64
      %2717 = func.call @cc_make_string(%2715, %2716) : (!llvm.ptr, i64) -> i64
      %2718 = func.call @cc_nil_value() : () -> i64
      %2719 = func.call @cc_intern(%2717, %2718) : (i64, i64) -> i64
      %2720 = func.call @cc_nil_value() : () -> i64
      %2721 = func.call @cc_cons(%2719, %2720) : (i64, i64) -> i64
      %2722 = func.call @cc_values_pack(%2721) : (i64) -> i64
      %2723 = func.call @cc_set_symbol_value(%2719, %2714) : (i64, i64) -> i64
      %2724 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2725 = arith.constant 38 : i64
      %2726 = func.call @cc_make_string(%2724, %2725) : (!llvm.ptr, i64) -> i64
      %2727 = func.call @cc_nil_value() : () -> i64
      %2728 = func.call @cc_intern(%2726, %2727) : (i64, i64) -> i64
      %2729 = func.call @cc_nil_value() : () -> i64
      %2730 = func.call @cc_cons(%2728, %2729) : (i64, i64) -> i64
      %2731 = func.call @cc_values_pack(%2730) : (i64) -> i64
      %2732 = func.call @cc_set_symbol_value(%2728, %2714) : (i64, i64) -> i64
      %2733 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2734 = arith.constant 39 : i64
      %2735 = func.call @cc_make_string(%2733, %2734) : (!llvm.ptr, i64) -> i64
      %2736 = func.call @cc_nil_value() : () -> i64
      %2737 = func.call @cc_intern(%2735, %2736) : (i64, i64) -> i64
      %2738 = func.call @cc_nil_value() : () -> i64
      %2739 = func.call @cc_cons(%2737, %2738) : (i64, i64) -> i64
      %2740 = func.call @cc_values_pack(%2739) : (i64) -> i64
      %2741 = func.call @cc_set_symbol_value(%2737, %2714) : (i64, i64) -> i64
      %2742 = func.call @cc_nil_value() : () -> i64
      %2743 = func.call @cc_nil_value() : () -> i64
      %2744 = func.call @cc_errorp(%2742) : (i64) -> i64
      %2745 = arith.cmpi ne, %2744, %2743 : i64
      %2746 = scf.if %2745 -> (i64) {
        scf.yield %2742 : i64
      } else {
        %3014 = llvm.mlir.addressof @str244 : !llvm.ptr
        %3015 = func.call @cc_make_lambda_ref_str(%3014) : (!llvm.ptr) -> i64
        %__rlasp_stack_elide_zero_596 = arith.constant 0 : i64
        %3016 = arith.addi %3015, %__rlasp_stack_elide_zero_596 : i64
        %3017 = llvm.mlir.addressof @str245 : !llvm.ptr
        %3018 = arith.constant 20 : i64
        %3019 = func.call @cc_make_string(%3017, %3018) : (!llvm.ptr, i64) -> i64
        %3020 = func.call @cc_nil_value() : () -> i64
        %3021 = func.call @cc_intern(%3019, %3020) : (i64, i64) -> i64
        %3022 = func.call @cc_nil_value() : () -> i64
        %3023 = func.call @cc_cons(%3021, %3022) : (i64, i64) -> i64
        %3024 = func.call @cc_values_pack(%3023) : (i64) -> i64
        %3025 = func.call @cc_set_symbol_value(%3021, %3016) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_597 = arith.constant 0 : i64
        %3026 = arith.addi %3016, %__rlasp_stack_elide_zero_597 : i64
        scf.yield %3026 : i64
      }
      %3027 = func.call @cc_nil_value() : () -> i64
      %3028 = func.call @cc_errorp(%2746) : (i64) -> i64
      %3029 = arith.cmpi ne, %3028, %3027 : i64
      %3030 = scf.if %3029 -> (i64) {
        scf.yield %2746 : i64
      } else {
        %3031 = llvm.mlir.addressof @str246 : !llvm.ptr
        %3032 = func.call @cc_make_function_ref_const(%3031) : (!llvm.ptr) -> i64
        %__rlasp_stack_elide_zero_598 = arith.constant 0 : i64
        %3033 = arith.addi %3032, %__rlasp_stack_elide_zero_598 : i64
        %3034 = llvm.mlir.addressof @str247 : !llvm.ptr
        %3035 = arith.constant 16 : i64
        %3036 = func.call @cc_make_string(%3034, %3035) : (!llvm.ptr, i64) -> i64
        %3037 = llvm.mlir.addressof @str248 : !llvm.ptr
        %3038 = arith.constant 15 : i64
        %3039 = func.call @cc_make_string(%3037, %3038) : (!llvm.ptr, i64) -> i64
        %3040 = func.call @cc_intern(%3036, %3039) : (i64, i64) -> i64
        %3041 = func.call @cc_nil_value() : () -> i64
        %3042 = func.call @cc_cons(%3040, %3041) : (i64, i64) -> i64
        %3043 = func.call @cc_values_pack(%3042) : (i64) -> i64
        %3044 = func.call @cc_set_symbol_value(%3040, %3033) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_599 = arith.constant 0 : i64
        %3045 = arith.addi %3033, %__rlasp_stack_elide_zero_599 : i64
        scf.yield %3045 : i64
      }
      %3046 = func.call @cc_nil_value() : () -> i64
      %3047 = func.call @cc_errorp(%3030) : (i64) -> i64
      %3048 = arith.cmpi ne, %3047, %3046 : i64
      %3049 = scf.if %3048 -> (i64) {
        scf.yield %3030 : i64
      } else {
        %3050 = llvm.mlir.addressof @str249 : !llvm.ptr
        %3051 = func.call @cc_make_function_ref_const(%3050) : (!llvm.ptr) -> i64
        %__rlasp_stack_elide_zero_600 = arith.constant 0 : i64
        %3052 = arith.addi %3051, %__rlasp_stack_elide_zero_600 : i64
        %3053 = llvm.mlir.addressof @str250 : !llvm.ptr
        %3054 = arith.constant 16 : i64
        %3055 = func.call @cc_make_string(%3053, %3054) : (!llvm.ptr, i64) -> i64
        %3056 = llvm.mlir.addressof @str251 : !llvm.ptr
        %3057 = arith.constant 15 : i64
        %3058 = func.call @cc_make_string(%3056, %3057) : (!llvm.ptr, i64) -> i64
        %3059 = func.call @cc_intern(%3055, %3058) : (i64, i64) -> i64
        %3060 = func.call @cc_nil_value() : () -> i64
        %3061 = func.call @cc_cons(%3059, %3060) : (i64, i64) -> i64
        %3062 = func.call @cc_values_pack(%3061) : (i64) -> i64
        %3063 = func.call @cc_set_symbol_value(%3059, %3052) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_601 = arith.constant 0 : i64
        %3064 = arith.addi %3052, %__rlasp_stack_elide_zero_601 : i64
        scf.yield %3064 : i64
      }
      %3065 = func.call @cc_nil_value() : () -> i64
      %3066 = func.call @cc_errorp(%3049) : (i64) -> i64
      %3067 = arith.cmpi ne, %3066, %3065 : i64
      %3068 = scf.if %3067 -> (i64) {
        scf.yield %3049 : i64
      } else {
        %3069 = llvm.mlir.addressof @str252 : !llvm.ptr
        %3070 = func.call @cc_make_function_ref_const(%3069) : (!llvm.ptr) -> i64
        %__rlasp_stack_elide_zero_602 = arith.constant 0 : i64
        %3071 = arith.addi %3070, %__rlasp_stack_elide_zero_602 : i64
        %3072 = llvm.mlir.addressof @str253 : !llvm.ptr
        %3073 = arith.constant 16 : i64
        %3074 = func.call @cc_make_string(%3072, %3073) : (!llvm.ptr, i64) -> i64
        %3075 = llvm.mlir.addressof @str254 : !llvm.ptr
        %3076 = arith.constant 15 : i64
        %3077 = func.call @cc_make_string(%3075, %3076) : (!llvm.ptr, i64) -> i64
        %3078 = func.call @cc_intern(%3074, %3077) : (i64, i64) -> i64
        %3079 = func.call @cc_nil_value() : () -> i64
        %3080 = func.call @cc_cons(%3078, %3079) : (i64, i64) -> i64
        %3081 = func.call @cc_values_pack(%3080) : (i64) -> i64
        %3082 = func.call @cc_set_symbol_value(%3078, %3071) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_603 = arith.constant 0 : i64
        %3083 = arith.addi %3071, %__rlasp_stack_elide_zero_603 : i64
        scf.yield %3083 : i64
      }
      %3084 = func.call @cc_nil_value() : () -> i64
      %3085 = func.call @cc_errorp(%3068) : (i64) -> i64
      %3086 = arith.cmpi ne, %3085, %3084 : i64
      %3087 = scf.if %3086 -> (i64) {
        scf.yield %3068 : i64
      } else {
        %3088 = llvm.mlir.addressof @str255 : !llvm.ptr
        %3089 = func.call @cc_make_function_ref_const(%3088) : (!llvm.ptr) -> i64
        %__rlasp_stack_elide_zero_604 = arith.constant 0 : i64
        %3090 = arith.addi %3089, %__rlasp_stack_elide_zero_604 : i64
        %3091 = llvm.mlir.addressof @str256 : !llvm.ptr
        %3092 = arith.constant 16 : i64
        %3093 = func.call @cc_make_string(%3091, %3092) : (!llvm.ptr, i64) -> i64
        %3094 = llvm.mlir.addressof @str257 : !llvm.ptr
        %3095 = arith.constant 15 : i64
        %3096 = func.call @cc_make_string(%3094, %3095) : (!llvm.ptr, i64) -> i64
        %3097 = func.call @cc_intern(%3093, %3096) : (i64, i64) -> i64
        %3098 = func.call @cc_nil_value() : () -> i64
        %3099 = func.call @cc_cons(%3097, %3098) : (i64, i64) -> i64
        %3100 = func.call @cc_values_pack(%3099) : (i64) -> i64
        %3101 = func.call @cc_set_symbol_value(%3097, %3090) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_605 = arith.constant 0 : i64
        %3102 = arith.addi %3090, %__rlasp_stack_elide_zero_605 : i64
        scf.yield %3102 : i64
      }
      %__rlasp_stack_elide_zero_606 = arith.constant 0 : i64
      %3103 = arith.addi %3087, %__rlasp_stack_elide_zero_606 : i64
      %3104 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3105 = arith.constant 16 : i64
      %3106 = func.call @cc_make_string(%3104, %3105) : (!llvm.ptr, i64) -> i64
      %3107 = func.call @cc_nil_value() : () -> i64
      %3108 = func.call @cc_intern(%3106, %3107) : (i64, i64) -> i64
      %3109 = func.call @cc_nil_value() : () -> i64
      %3110 = func.call @cc_cons(%3108, %3109) : (i64, i64) -> i64
      %3111 = func.call @cc_values_pack(%3110) : (i64) -> i64
      %__rlasp_stack_elide_zero_607 = arith.constant 0 : i64
      %3112 = arith.addi %3108, %__rlasp_stack_elide_zero_607 : i64
      %3113 = arith.constant 357 : i64
      %3114 = func.call @cc_box_fixnum(%3113) : (i64) -> i64
      %3115 = func.call @cc_nil_value() : () -> i64
      %3116 = func.call @cc_errorp(%3112) : (i64) -> i64
      %3117 = arith.cmpi ne, %3116, %3115 : i64
      %3118 = arith.cmpi eq, %3115, %3115 : i64
      %3119 = arith.andi %3117, %3118 : i1
      %3120 = scf.if %3119 -> (i64) {
        scf.yield %3112 : i64
      } else {
        scf.yield %3115 : i64
      }
      %3121 = func.call @cc_errorp(%3114) : (i64) -> i64
      %3122 = arith.cmpi ne, %3121, %3115 : i64
      %3123 = arith.cmpi eq, %3120, %3115 : i64
      %3124 = arith.andi %3122, %3123 : i1
      %3125 = scf.if %3124 -> (i64) {
        scf.yield %3114 : i64
      } else {
        scf.yield %3120 : i64
      }
      %3126 = arith.cmpi ne, %3125, %3115 : i64
      scf.if %3126 {
        func.call @stack_push_pointer(%3125) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3112) : (i64) -> ()
        func.call @stack_push_pointer(%3114) : (i64) -> ()
        %3127 = llvm.mlir.addressof @str259 : !llvm.ptr
        %3128 = func.call @cc_make_function_ref_const(%3127) : (!llvm.ptr) -> i64
        %3129 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3128, %3129) : (i64, i64) -> ()
      }
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @cc_multiple_value_list(%3130) : (i64) -> i64
      %3132 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3133 = arith.constant 37 : i64
      %3134 = func.call @cc_make_string(%3132, %3133) : (!llvm.ptr, i64) -> i64
      %3135 = func.call @cc_nil_value() : () -> i64
      %3136 = func.call @cc_intern(%3134, %3135) : (i64, i64) -> i64
      %3137 = func.call @cc_nil_value() : () -> i64
      %3138 = func.call @cc_cons(%3136, %3137) : (i64, i64) -> i64
      %3139 = func.call @cc_values_pack(%3138) : (i64) -> i64
      %3140 = func.call @cc_symbol_value(%3136) : (i64) -> i64
      %3141 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3142 = arith.constant 38 : i64
      %3143 = func.call @cc_make_string(%3141, %3142) : (!llvm.ptr, i64) -> i64
      %3144 = func.call @cc_nil_value() : () -> i64
      %3145 = func.call @cc_intern(%3143, %3144) : (i64, i64) -> i64
      %3146 = func.call @cc_nil_value() : () -> i64
      %3147 = func.call @cc_cons(%3145, %3146) : (i64, i64) -> i64
      %3148 = func.call @cc_values_pack(%3147) : (i64) -> i64
      %3149 = func.call @cc_symbol_value(%3145) : (i64) -> i64
      %3150 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3151 = arith.constant 39 : i64
      %3152 = func.call @cc_make_string(%3150, %3151) : (!llvm.ptr, i64) -> i64
      %3153 = func.call @cc_nil_value() : () -> i64
      %3154 = func.call @cc_intern(%3152, %3153) : (i64, i64) -> i64
      %3155 = func.call @cc_nil_value() : () -> i64
      %3156 = func.call @cc_cons(%3154, %3155) : (i64, i64) -> i64
      %3157 = func.call @cc_values_pack(%3156) : (i64) -> i64
      %3158 = func.call @cc_symbol_value(%3154) : (i64) -> i64
      %3159 = func.call @cc_nil_value() : () -> i64
      %3160 = arith.cmpi ne, %3140, %3159 : i64
      %3161 = scf.if %3160 -> (i64) {
        scf.yield %3158 : i64
      } else {
        scf.yield %3131 : i64
      }
      %3162 = func.call @cc_values_pack(%3161) : (i64) -> i64
      %__rlasp_stack_elide_zero_608 = arith.constant 0 : i64
      %3163 = arith.addi %3162, %__rlasp_stack_elide_zero_608 : i64
      scf.yield %3163 : i64
    }
    func.call @stack_push_pointer(%2713) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511521"() {
    %3698 = func.call @stack_pop_pointer() : () -> i64
    %3699 = func.call @cc_nil_value() : () -> i64
    %3700 = func.call @cc_nil_value() : () -> i64
    %3701 = func.call @cc_errorp(%3699) : (i64) -> i64
    %3702 = arith.cmpi ne, %3701, %3700 : i64
    %3703 = scf.if %3702 -> (i64) {
      scf.yield %3699 : i64
    } else {
      %3704 = func.call @cc_nil_value() : () -> i64
      %3705 = func.call @cc_errorp(%3698) : (i64) -> i64
      %3706 = arith.cmpi ne, %3705, %3704 : i64
      %3707 = arith.cmpi eq, %3704, %3704 : i64
      %3708 = arith.andi %3706, %3707 : i1
      %3709 = scf.if %3708 -> (i64) {
        scf.yield %3698 : i64
      } else {
        scf.yield %3704 : i64
      }
      %3710 = arith.cmpi ne, %3709, %3704 : i64
      scf.if %3710 {
        func.call @stack_push_pointer(%3709) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3698) : (i64) -> ()
        %3711 = llvm.mlir.addressof @str309 : !llvm.ptr
        %3712 = func.call @cc_make_function_ref_const(%3711) : (!llvm.ptr) -> i64
        %3713 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3712, %3713) : (i64, i64) -> ()
      }
      %3714 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3715 = arith.constant 32 : i64
      %3716 = func.call @cc_make_string(%3714, %3715) : (!llvm.ptr, i64) -> i64
      %3717 = func.call @cc_nil_value() : () -> i64
      %3718 = func.call @cc_intern(%3716, %3717) : (i64, i64) -> i64
      %3719 = func.call @cc_nil_value() : () -> i64
      %3720 = func.call @cc_cons(%3718, %3719) : (i64, i64) -> i64
      %3721 = func.call @cc_values_pack(%3720) : (i64) -> i64
      %__rlasp_stack_elide_zero_609 = arith.constant 0 : i64
      %3722 = arith.addi %3718, %__rlasp_stack_elide_zero_609 : i64
      %3723 = func.call @stack_pop_pointer() : () -> i64
      %3724 = func.call @cc_eq(%3723, %3722) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_610 = arith.constant 0 : i64
      %3725 = arith.addi %3724, %__rlasp_stack_elide_zero_610 : i64
      %3726 = func.call @cc_nil_value() : () -> i64
      %3727 = arith.cmpi ne, %3725, %3726 : i64
      scf.if %3727 {
        %3728 = func.call @cc_nil_value() : () -> i64
        %3729 = func.call @cc_nil_value() : () -> i64
        %3730 = func.call @cc_errorp(%3728) : (i64) -> i64
        %3731 = arith.cmpi ne, %3730, %3729 : i64
        %3732 = scf.if %3731 -> (i64) {
          scf.yield %3728 : i64
        } else {
          %3733 = func.call @cc_nil_value() : () -> i64
          %3734 = func.call @cc_errorp(%3698) : (i64) -> i64
          %3735 = arith.cmpi ne, %3734, %3733 : i64
          %3736 = arith.cmpi eq, %3733, %3733 : i64
          %3737 = arith.andi %3735, %3736 : i1
          %3738 = scf.if %3737 -> (i64) {
            scf.yield %3698 : i64
          } else {
            scf.yield %3733 : i64
          }
          %3739 = arith.cmpi ne, %3738, %3733 : i64
          scf.if %3739 {
            func.call @stack_push_pointer(%3738) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3698) : (i64) -> ()
            %3740 = llvm.mlir.addressof @str311 : !llvm.ptr
            %3741 = func.call @cc_make_function_ref_const(%3740) : (!llvm.ptr) -> i64
            %3742 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3741, %3742) : (i64, i64) -> ()
          }
          %3743 = func.call @stack_pop_pointer() : () -> i64
          %3744 = func.call @cc_multiple_value_list(%3743) : (i64) -> i64
          %3745 = func.call @cc_t_value() : () -> i64
          %3746 = llvm.mlir.addressof @str312 : !llvm.ptr
          %3747 = arith.constant 37 : i64
          %3748 = func.call @cc_make_string(%3746, %3747) : (!llvm.ptr, i64) -> i64
          %3749 = func.call @cc_nil_value() : () -> i64
          %3750 = func.call @cc_intern(%3748, %3749) : (i64, i64) -> i64
          %3751 = func.call @cc_nil_value() : () -> i64
          %3752 = func.call @cc_cons(%3750, %3751) : (i64, i64) -> i64
          %3753 = func.call @cc_values_pack(%3752) : (i64) -> i64
          %3754 = func.call @cc_set_symbol_value(%3750, %3745) : (i64, i64) -> i64
          %3755 = llvm.mlir.addressof @str313 : !llvm.ptr
          %3756 = arith.constant 38 : i64
          %3757 = func.call @cc_make_string(%3755, %3756) : (!llvm.ptr, i64) -> i64
          %3758 = func.call @cc_nil_value() : () -> i64
          %3759 = func.call @cc_intern(%3757, %3758) : (i64, i64) -> i64
          %3760 = func.call @cc_nil_value() : () -> i64
          %3761 = func.call @cc_cons(%3759, %3760) : (i64, i64) -> i64
          %3762 = func.call @cc_values_pack(%3761) : (i64) -> i64
          %3763 = func.call @cc_set_symbol_value(%3759, %3743) : (i64, i64) -> i64
          %3764 = llvm.mlir.addressof @str314 : !llvm.ptr
          %3765 = arith.constant 39 : i64
          %3766 = func.call @cc_make_string(%3764, %3765) : (!llvm.ptr, i64) -> i64
          %3767 = func.call @cc_nil_value() : () -> i64
          %3768 = func.call @cc_intern(%3766, %3767) : (i64, i64) -> i64
          %3769 = func.call @cc_nil_value() : () -> i64
          %3770 = func.call @cc_cons(%3768, %3769) : (i64, i64) -> i64
          %3771 = func.call @cc_values_pack(%3770) : (i64) -> i64
          %3772 = func.call @cc_set_symbol_value(%3768, %3744) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_611 = arith.constant 0 : i64
          %3773 = arith.addi %3743, %__rlasp_stack_elide_zero_611 : i64
          scf.yield %3773 : i64
        }
        func.call @stack_push_pointer(%3732) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %3774 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3774 : i64
    }
    func.call @stack_push_pointer(%3703) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511520"() {
    %3685 = func.call @stack_pop_pointer() : () -> i64
    %3686 = func.call @cc_nil_value() : () -> i64
    %3687 = func.call @cc_nil_value() : () -> i64
    %3688 = func.call @cc_errorp(%3686) : (i64) -> i64
    %3689 = arith.cmpi ne, %3688, %3687 : i64
    %3690 = scf.if %3689 -> (i64) {
      scf.yield %3686 : i64
    } else {
      %3691 = func.call @cc_t_value() : () -> i64
      %3692 = func.call @cc_debug_current_stack(%3691) : (i64) -> i64
      %3693 = func.call @cc_nil_value() : () -> i64
      %3694 = func.call @cc_nil_value() : () -> i64
      %3695 = func.call @cc_errorp(%3693) : (i64) -> i64
      %3696 = arith.cmpi ne, %3695, %3694 : i64
      %3697 = scf.if %3696 -> (i64) {
        scf.yield %3693 : i64
      } else {
        %3775 = arith.constant 97047688511521 : i64
        %3776 = arith.constant 0 : i64
        %3777 = func.call @cc_make_closure(%3775, %3776) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_612 = arith.constant 0 : i64
        %3778 = arith.addi %3777, %__rlasp_stack_elide_zero_612 : i64
        %3779 = func.call @cc_nil_value() : () -> i64
        %3780 = func.call @cc_errorp(%3778) : (i64) -> i64
        %3781 = arith.cmpi ne, %3780, %3779 : i64
        %3782 = arith.cmpi eq, %3779, %3779 : i64
        %3783 = arith.andi %3781, %3782 : i1
        %3784 = scf.if %3783 -> (i64) {
          scf.yield %3778 : i64
        } else {
          scf.yield %3779 : i64
        }
        %3785 = func.call @cc_errorp(%3692) : (i64) -> i64
        %3786 = arith.cmpi ne, %3785, %3779 : i64
        %3787 = arith.cmpi eq, %3784, %3779 : i64
        %3788 = arith.andi %3786, %3787 : i1
        %3789 = scf.if %3788 -> (i64) {
          scf.yield %3692 : i64
        } else {
          scf.yield %3784 : i64
        }
        %3790 = arith.cmpi ne, %3789, %3779 : i64
        scf.if %3790 {
          func.call @stack_push_pointer(%3789) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3778) : (i64) -> ()
          func.call @stack_push_pointer(%3692) : (i64) -> ()
          %3791 = llvm.mlir.addressof @str315 : !llvm.ptr
          %3792 = func.call @cc_make_function_ref_const(%3791) : (!llvm.ptr) -> i64
          %3793 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3792, %3793) : (i64, i64) -> ()
        }
        %3794 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3794 : i64
      }
      %__rlasp_stack_elide_zero_613 = arith.constant 0 : i64
      %3795 = arith.addi %3697, %__rlasp_stack_elide_zero_613 : i64
      scf.yield %3795 : i64
    }
    func.call @stack_push_pointer(%3690) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511518"() {
    %3649 = func.call @stack_pop_pointer() : () -> i64
    %3650 = func.call @cc_nil_value() : () -> i64
    %3651 = func.call @cc_nil_value() : () -> i64
    %3652 = func.call @cc_errorp(%3650) : (i64) -> i64
    %3653 = arith.cmpi ne, %3652, %3651 : i64
    %3654 = scf.if %3653 -> (i64) {
      scf.yield %3650 : i64
    } else {
      %3655 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3656 = func.call @cc_make_function_ref_const(%3655) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3656) : (i64) -> ()
      %3657 = func.call @cc_nil_value() : () -> i64
      %3658 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3659 = arith.constant 37 : i64
      %3660 = func.call @cc_make_string(%3658, %3659) : (!llvm.ptr, i64) -> i64
      %3661 = func.call @cc_nil_value() : () -> i64
      %3662 = func.call @cc_intern(%3660, %3661) : (i64, i64) -> i64
      %3663 = func.call @cc_nil_value() : () -> i64
      %3664 = func.call @cc_cons(%3662, %3663) : (i64, i64) -> i64
      %3665 = func.call @cc_values_pack(%3664) : (i64) -> i64
      %3666 = func.call @cc_set_symbol_value(%3662, %3657) : (i64, i64) -> i64
      %3667 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3668 = arith.constant 38 : i64
      %3669 = func.call @cc_make_string(%3667, %3668) : (!llvm.ptr, i64) -> i64
      %3670 = func.call @cc_nil_value() : () -> i64
      %3671 = func.call @cc_intern(%3669, %3670) : (i64, i64) -> i64
      %3672 = func.call @cc_nil_value() : () -> i64
      %3673 = func.call @cc_cons(%3671, %3672) : (i64, i64) -> i64
      %3674 = func.call @cc_values_pack(%3673) : (i64) -> i64
      %3675 = func.call @cc_set_symbol_value(%3671, %3657) : (i64, i64) -> i64
      %3676 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3677 = arith.constant 39 : i64
      %3678 = func.call @cc_make_string(%3676, %3677) : (!llvm.ptr, i64) -> i64
      %3679 = func.call @cc_nil_value() : () -> i64
      %3680 = func.call @cc_intern(%3678, %3679) : (i64, i64) -> i64
      %3681 = func.call @cc_nil_value() : () -> i64
      %3682 = func.call @cc_cons(%3680, %3681) : (i64, i64) -> i64
      %3683 = func.call @cc_values_pack(%3682) : (i64) -> i64
      %3684 = func.call @cc_set_symbol_value(%3680, %3657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3649) : (i64) -> ()
      %3796 = arith.constant 97047688511520 : i64
      %3797 = arith.constant 1 : i64
      %3798 = func.call @cc_make_closure(%3796, %3797) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_614 = arith.constant 0 : i64
      %3799 = arith.addi %3798, %__rlasp_stack_elide_zero_614 : i64
      %3800 = func.call @cc_nil_value() : () -> i64
      %3801 = func.call @cc_nil_value() : () -> i64
      %3802 = func.call @cc_errorp(%3799) : (i64) -> i64
      %3803 = arith.cmpi ne, %3802, %3801 : i64
      %3804 = arith.cmpi eq, %3801, %3801 : i64
      %3805 = arith.andi %3803, %3804 : i1
      %3806 = scf.if %3805 -> (i64) {
        scf.yield %3799 : i64
      } else {
        scf.yield %3801 : i64
      }
      %3807 = func.call @cc_errorp(%3800) : (i64) -> i64
      %3808 = arith.cmpi ne, %3807, %3801 : i64
      %3809 = arith.cmpi eq, %3806, %3801 : i64
      %3810 = arith.andi %3808, %3809 : i1
      %3811 = scf.if %3810 -> (i64) {
        scf.yield %3800 : i64
      } else {
        scf.yield %3806 : i64
      }
      %3812 = arith.cmpi ne, %3811, %3801 : i64
      scf.if %3812 {
        func.call @stack_push_pointer(%3811) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3799) : (i64) -> ()
        func.call @stack_push_pointer(%3800) : (i64) -> ()
        %3813 = llvm.mlir.addressof @str316 : !llvm.ptr
        %3814 = func.call @cc_make_function_ref_const(%3813) : (!llvm.ptr) -> i64
        %3815 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3814, %3815) : (i64, i64) -> ()
      }
      %3816 = func.call @stack_pop_pointer() : () -> i64
      %3817 = func.call @cc_multiple_value_list(%3816) : (i64) -> i64
      %3818 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3819 = arith.constant 37 : i64
      %3820 = func.call @cc_make_string(%3818, %3819) : (!llvm.ptr, i64) -> i64
      %3821 = func.call @cc_nil_value() : () -> i64
      %3822 = func.call @cc_intern(%3820, %3821) : (i64, i64) -> i64
      %3823 = func.call @cc_nil_value() : () -> i64
      %3824 = func.call @cc_cons(%3822, %3823) : (i64, i64) -> i64
      %3825 = func.call @cc_values_pack(%3824) : (i64) -> i64
      %3826 = func.call @cc_symbol_value(%3822) : (i64) -> i64
      %3827 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3828 = arith.constant 38 : i64
      %3829 = func.call @cc_make_string(%3827, %3828) : (!llvm.ptr, i64) -> i64
      %3830 = func.call @cc_nil_value() : () -> i64
      %3831 = func.call @cc_intern(%3829, %3830) : (i64, i64) -> i64
      %3832 = func.call @cc_nil_value() : () -> i64
      %3833 = func.call @cc_cons(%3831, %3832) : (i64, i64) -> i64
      %3834 = func.call @cc_values_pack(%3833) : (i64) -> i64
      %3835 = func.call @cc_symbol_value(%3831) : (i64) -> i64
      %3836 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3837 = arith.constant 39 : i64
      %3838 = func.call @cc_make_string(%3836, %3837) : (!llvm.ptr, i64) -> i64
      %3839 = func.call @cc_nil_value() : () -> i64
      %3840 = func.call @cc_intern(%3838, %3839) : (i64, i64) -> i64
      %3841 = func.call @cc_nil_value() : () -> i64
      %3842 = func.call @cc_cons(%3840, %3841) : (i64, i64) -> i64
      %3843 = func.call @cc_values_pack(%3842) : (i64) -> i64
      %3844 = func.call @cc_symbol_value(%3840) : (i64) -> i64
      %3845 = func.call @cc_nil_value() : () -> i64
      %3846 = arith.cmpi ne, %3826, %3845 : i64
      %3847 = scf.if %3846 -> (i64) {
        scf.yield %3844 : i64
      } else {
        scf.yield %3817 : i64
      }
      %3848 = func.call @cc_values_pack(%3847) : (i64) -> i64
      %__rlasp_stack_elide_zero_615 = arith.constant 0 : i64
      %3849 = arith.addi %3848, %__rlasp_stack_elide_zero_615 : i64
      %3850 = func.call @stack_pop_pointer() : () -> i64
      %3851 = func.call @cc_eq(%3850, %3849) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_616 = arith.constant 0 : i64
      %3852 = arith.addi %3851, %__rlasp_stack_elide_zero_616 : i64
      %3853 = func.call @cc_nil_value() : () -> i64
      %3854 = func.call @cc_cons(%3852, %3853) : (i64, i64) -> i64
      %3855 = func.call @cc_not(%3854) : (i64) -> i64
      %__rlasp_stack_elide_zero_617 = arith.constant 0 : i64
      %3856 = arith.addi %3855, %__rlasp_stack_elide_zero_617 : i64
      %3857 = func.call @cc_nil_value() : () -> i64
      %3858 = func.call @cc_cons(%3856, %3857) : (i64, i64) -> i64
      %3859 = func.call @cc_not(%3858) : (i64) -> i64
      %__rlasp_stack_elide_zero_618 = arith.constant 0 : i64
      %3860 = arith.addi %3859, %__rlasp_stack_elide_zero_618 : i64
      scf.yield %3860 : i64
    }
    func.call @stack_push_pointer(%3654) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511526"() {
    %4293 = func.call @stack_pop_pointer() : () -> i64
    %4294 = func.call @cc_nil_value() : () -> i64
    %4295 = func.call @cc_nil_value() : () -> i64
    %4296 = func.call @cc_errorp(%4294) : (i64) -> i64
    %4297 = arith.cmpi ne, %4296, %4295 : i64
    %4298 = scf.if %4297 -> (i64) {
      scf.yield %4294 : i64
    } else {
      %4299 = func.call @cc_nil_value() : () -> i64
      %4300 = func.call @cc_errorp(%4293) : (i64) -> i64
      %4301 = arith.cmpi ne, %4300, %4299 : i64
      %4302 = arith.cmpi eq, %4299, %4299 : i64
      %4303 = arith.andi %4301, %4302 : i1
      %4304 = scf.if %4303 -> (i64) {
        scf.yield %4293 : i64
      } else {
        scf.yield %4299 : i64
      }
      %4305 = arith.cmpi ne, %4304, %4299 : i64
      scf.if %4305 {
        func.call @stack_push_pointer(%4304) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4293) : (i64) -> ()
        %4306 = llvm.mlir.addressof @str356 : !llvm.ptr
        %4307 = func.call @cc_make_function_ref_const(%4306) : (!llvm.ptr) -> i64
        %4308 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4307, %4308) : (i64, i64) -> ()
      }
      %4309 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4310 = arith.constant 32 : i64
      %4311 = func.call @cc_make_string(%4309, %4310) : (!llvm.ptr, i64) -> i64
      %4312 = func.call @cc_nil_value() : () -> i64
      %4313 = func.call @cc_intern(%4311, %4312) : (i64, i64) -> i64
      %4314 = func.call @cc_nil_value() : () -> i64
      %4315 = func.call @cc_cons(%4313, %4314) : (i64, i64) -> i64
      %4316 = func.call @cc_values_pack(%4315) : (i64) -> i64
      %__rlasp_stack_elide_zero_619 = arith.constant 0 : i64
      %4317 = arith.addi %4313, %__rlasp_stack_elide_zero_619 : i64
      %4318 = func.call @stack_pop_pointer() : () -> i64
      %4319 = func.call @cc_eq(%4318, %4317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_620 = arith.constant 0 : i64
      %4320 = arith.addi %4319, %__rlasp_stack_elide_zero_620 : i64
      %4321 = func.call @cc_nil_value() : () -> i64
      %4322 = arith.cmpi ne, %4320, %4321 : i64
      scf.if %4322 {
        %4323 = func.call @cc_nil_value() : () -> i64
        %4324 = func.call @cc_nil_value() : () -> i64
        %4325 = func.call @cc_errorp(%4323) : (i64) -> i64
        %4326 = arith.cmpi ne, %4325, %4324 : i64
        %4327 = scf.if %4326 -> (i64) {
          scf.yield %4323 : i64
        } else {
          %4328 = func.call @cc_nil_value() : () -> i64
          %4329 = func.call @cc_errorp(%4293) : (i64) -> i64
          %4330 = arith.cmpi ne, %4329, %4328 : i64
          %4331 = arith.cmpi eq, %4328, %4328 : i64
          %4332 = arith.andi %4330, %4331 : i1
          %4333 = scf.if %4332 -> (i64) {
            scf.yield %4293 : i64
          } else {
            scf.yield %4328 : i64
          }
          %4334 = arith.cmpi ne, %4333, %4328 : i64
          scf.if %4334 {
            func.call @stack_push_pointer(%4333) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4293) : (i64) -> ()
            %4335 = llvm.mlir.addressof @str358 : !llvm.ptr
            %4336 = func.call @cc_make_function_ref_const(%4335) : (!llvm.ptr) -> i64
            %4337 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4336, %4337) : (i64, i64) -> ()
          }
          %4338 = func.call @stack_pop_pointer() : () -> i64
          %4339 = func.call @cc_multiple_value_list(%4338) : (i64) -> i64
          %4340 = func.call @cc_t_value() : () -> i64
          %4341 = llvm.mlir.addressof @str359 : !llvm.ptr
          %4342 = arith.constant 37 : i64
          %4343 = func.call @cc_make_string(%4341, %4342) : (!llvm.ptr, i64) -> i64
          %4344 = func.call @cc_nil_value() : () -> i64
          %4345 = func.call @cc_intern(%4343, %4344) : (i64, i64) -> i64
          %4346 = func.call @cc_nil_value() : () -> i64
          %4347 = func.call @cc_cons(%4345, %4346) : (i64, i64) -> i64
          %4348 = func.call @cc_values_pack(%4347) : (i64) -> i64
          %4349 = func.call @cc_set_symbol_value(%4345, %4340) : (i64, i64) -> i64
          %4350 = llvm.mlir.addressof @str360 : !llvm.ptr
          %4351 = arith.constant 38 : i64
          %4352 = func.call @cc_make_string(%4350, %4351) : (!llvm.ptr, i64) -> i64
          %4353 = func.call @cc_nil_value() : () -> i64
          %4354 = func.call @cc_intern(%4352, %4353) : (i64, i64) -> i64
          %4355 = func.call @cc_nil_value() : () -> i64
          %4356 = func.call @cc_cons(%4354, %4355) : (i64, i64) -> i64
          %4357 = func.call @cc_values_pack(%4356) : (i64) -> i64
          %4358 = func.call @cc_set_symbol_value(%4354, %4338) : (i64, i64) -> i64
          %4359 = llvm.mlir.addressof @str361 : !llvm.ptr
          %4360 = arith.constant 39 : i64
          %4361 = func.call @cc_make_string(%4359, %4360) : (!llvm.ptr, i64) -> i64
          %4362 = func.call @cc_nil_value() : () -> i64
          %4363 = func.call @cc_intern(%4361, %4362) : (i64, i64) -> i64
          %4364 = func.call @cc_nil_value() : () -> i64
          %4365 = func.call @cc_cons(%4363, %4364) : (i64, i64) -> i64
          %4366 = func.call @cc_values_pack(%4365) : (i64) -> i64
          %4367 = func.call @cc_set_symbol_value(%4363, %4339) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_621 = arith.constant 0 : i64
          %4368 = arith.addi %4338, %__rlasp_stack_elide_zero_621 : i64
          scf.yield %4368 : i64
        }
        func.call @stack_push_pointer(%4327) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %4369 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4369 : i64
    }
    func.call @stack_push_pointer(%4298) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511525"() {
    %4280 = func.call @stack_pop_pointer() : () -> i64
    %4281 = func.call @cc_nil_value() : () -> i64
    %4282 = func.call @cc_nil_value() : () -> i64
    %4283 = func.call @cc_errorp(%4281) : (i64) -> i64
    %4284 = arith.cmpi ne, %4283, %4282 : i64
    %4285 = scf.if %4284 -> (i64) {
      scf.yield %4281 : i64
    } else {
      %4286 = func.call @cc_t_value() : () -> i64
      %4287 = func.call @cc_debug_current_stack(%4286) : (i64) -> i64
      %4288 = func.call @cc_nil_value() : () -> i64
      %4289 = func.call @cc_nil_value() : () -> i64
      %4290 = func.call @cc_errorp(%4288) : (i64) -> i64
      %4291 = arith.cmpi ne, %4290, %4289 : i64
      %4292 = scf.if %4291 -> (i64) {
        scf.yield %4288 : i64
      } else {
        %4370 = arith.constant 97047688511526 : i64
        %4371 = arith.constant 0 : i64
        %4372 = func.call @cc_make_closure(%4370, %4371) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_622 = arith.constant 0 : i64
        %4373 = arith.addi %4372, %__rlasp_stack_elide_zero_622 : i64
        %4374 = func.call @cc_nil_value() : () -> i64
        %4375 = func.call @cc_errorp(%4373) : (i64) -> i64
        %4376 = arith.cmpi ne, %4375, %4374 : i64
        %4377 = arith.cmpi eq, %4374, %4374 : i64
        %4378 = arith.andi %4376, %4377 : i1
        %4379 = scf.if %4378 -> (i64) {
          scf.yield %4373 : i64
        } else {
          scf.yield %4374 : i64
        }
        %4380 = func.call @cc_errorp(%4287) : (i64) -> i64
        %4381 = arith.cmpi ne, %4380, %4374 : i64
        %4382 = arith.cmpi eq, %4379, %4374 : i64
        %4383 = arith.andi %4381, %4382 : i1
        %4384 = scf.if %4383 -> (i64) {
          scf.yield %4287 : i64
        } else {
          scf.yield %4379 : i64
        }
        %4385 = arith.cmpi ne, %4384, %4374 : i64
        scf.if %4385 {
          func.call @stack_push_pointer(%4384) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4373) : (i64) -> ()
          func.call @stack_push_pointer(%4287) : (i64) -> ()
          %4386 = llvm.mlir.addressof @str362 : !llvm.ptr
          %4387 = func.call @cc_make_function_ref_const(%4386) : (!llvm.ptr) -> i64
          %4388 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4387, %4388) : (i64, i64) -> ()
        }
        %4389 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4389 : i64
      }
      %__rlasp_stack_elide_zero_623 = arith.constant 0 : i64
      %4390 = arith.addi %4292, %__rlasp_stack_elide_zero_623 : i64
      scf.yield %4390 : i64
    }
    func.call @stack_push_pointer(%4285) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511523"() {
    %4246 = func.call @stack_pop_pointer() : () -> i64
    %4247 = func.call @cc_nil_value() : () -> i64
    %4248 = func.call @cc_nil_value() : () -> i64
    %4249 = func.call @cc_errorp(%4247) : (i64) -> i64
    %4250 = arith.cmpi ne, %4249, %4248 : i64
    %4251 = scf.if %4250 -> (i64) {
      scf.yield %4247 : i64
    } else {
      %4252 = func.call @cc_nil_value() : () -> i64
      %4253 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4254 = arith.constant 37 : i64
      %4255 = func.call @cc_make_string(%4253, %4254) : (!llvm.ptr, i64) -> i64
      %4256 = func.call @cc_nil_value() : () -> i64
      %4257 = func.call @cc_intern(%4255, %4256) : (i64, i64) -> i64
      %4258 = func.call @cc_nil_value() : () -> i64
      %4259 = func.call @cc_cons(%4257, %4258) : (i64, i64) -> i64
      %4260 = func.call @cc_values_pack(%4259) : (i64) -> i64
      %4261 = func.call @cc_set_symbol_value(%4257, %4252) : (i64, i64) -> i64
      %4262 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4263 = arith.constant 38 : i64
      %4264 = func.call @cc_make_string(%4262, %4263) : (!llvm.ptr, i64) -> i64
      %4265 = func.call @cc_nil_value() : () -> i64
      %4266 = func.call @cc_intern(%4264, %4265) : (i64, i64) -> i64
      %4267 = func.call @cc_nil_value() : () -> i64
      %4268 = func.call @cc_cons(%4266, %4267) : (i64, i64) -> i64
      %4269 = func.call @cc_values_pack(%4268) : (i64) -> i64
      %4270 = func.call @cc_set_symbol_value(%4266, %4252) : (i64, i64) -> i64
      %4271 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4272 = arith.constant 39 : i64
      %4273 = func.call @cc_make_string(%4271, %4272) : (!llvm.ptr, i64) -> i64
      %4274 = func.call @cc_nil_value() : () -> i64
      %4275 = func.call @cc_intern(%4273, %4274) : (i64, i64) -> i64
      %4276 = func.call @cc_nil_value() : () -> i64
      %4277 = func.call @cc_cons(%4275, %4276) : (i64, i64) -> i64
      %4278 = func.call @cc_values_pack(%4277) : (i64) -> i64
      %4279 = func.call @cc_set_symbol_value(%4275, %4252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4246) : (i64) -> ()
      %4391 = arith.constant 97047688511525 : i64
      %4392 = arith.constant 1 : i64
      %4393 = func.call @cc_make_closure(%4391, %4392) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_624 = arith.constant 0 : i64
      %4394 = arith.addi %4393, %__rlasp_stack_elide_zero_624 : i64
      %4395 = func.call @cc_nil_value() : () -> i64
      %4396 = func.call @cc_nil_value() : () -> i64
      %4397 = func.call @cc_errorp(%4394) : (i64) -> i64
      %4398 = arith.cmpi ne, %4397, %4396 : i64
      %4399 = arith.cmpi eq, %4396, %4396 : i64
      %4400 = arith.andi %4398, %4399 : i1
      %4401 = scf.if %4400 -> (i64) {
        scf.yield %4394 : i64
      } else {
        scf.yield %4396 : i64
      }
      %4402 = func.call @cc_errorp(%4395) : (i64) -> i64
      %4403 = arith.cmpi ne, %4402, %4396 : i64
      %4404 = arith.cmpi eq, %4401, %4396 : i64
      %4405 = arith.andi %4403, %4404 : i1
      %4406 = scf.if %4405 -> (i64) {
        scf.yield %4395 : i64
      } else {
        scf.yield %4401 : i64
      }
      %4407 = arith.cmpi ne, %4406, %4396 : i64
      scf.if %4407 {
        func.call @stack_push_pointer(%4406) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4394) : (i64) -> ()
        func.call @stack_push_pointer(%4395) : (i64) -> ()
        %4408 = llvm.mlir.addressof @str363 : !llvm.ptr
        %4409 = func.call @cc_make_function_ref_const(%4408) : (!llvm.ptr) -> i64
        %4410 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%4409, %4410) : (i64, i64) -> ()
      }
      %4411 = func.call @stack_pop_pointer() : () -> i64
      %4412 = func.call @cc_multiple_value_list(%4411) : (i64) -> i64
      %4413 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4414 = arith.constant 37 : i64
      %4415 = func.call @cc_make_string(%4413, %4414) : (!llvm.ptr, i64) -> i64
      %4416 = func.call @cc_nil_value() : () -> i64
      %4417 = func.call @cc_intern(%4415, %4416) : (i64, i64) -> i64
      %4418 = func.call @cc_nil_value() : () -> i64
      %4419 = func.call @cc_cons(%4417, %4418) : (i64, i64) -> i64
      %4420 = func.call @cc_values_pack(%4419) : (i64) -> i64
      %4421 = func.call @cc_symbol_value(%4417) : (i64) -> i64
      %4422 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4423 = arith.constant 38 : i64
      %4424 = func.call @cc_make_string(%4422, %4423) : (!llvm.ptr, i64) -> i64
      %4425 = func.call @cc_nil_value() : () -> i64
      %4426 = func.call @cc_intern(%4424, %4425) : (i64, i64) -> i64
      %4427 = func.call @cc_nil_value() : () -> i64
      %4428 = func.call @cc_cons(%4426, %4427) : (i64, i64) -> i64
      %4429 = func.call @cc_values_pack(%4428) : (i64) -> i64
      %4430 = func.call @cc_symbol_value(%4426) : (i64) -> i64
      %4431 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4432 = arith.constant 39 : i64
      %4433 = func.call @cc_make_string(%4431, %4432) : (!llvm.ptr, i64) -> i64
      %4434 = func.call @cc_nil_value() : () -> i64
      %4435 = func.call @cc_intern(%4433, %4434) : (i64, i64) -> i64
      %4436 = func.call @cc_nil_value() : () -> i64
      %4437 = func.call @cc_cons(%4435, %4436) : (i64, i64) -> i64
      %4438 = func.call @cc_values_pack(%4437) : (i64) -> i64
      %4439 = func.call @cc_symbol_value(%4435) : (i64) -> i64
      %4440 = func.call @cc_nil_value() : () -> i64
      %4441 = arith.cmpi ne, %4421, %4440 : i64
      %4442 = scf.if %4441 -> (i64) {
        scf.yield %4439 : i64
      } else {
        scf.yield %4412 : i64
      }
      %4443 = func.call @cc_values_pack(%4442) : (i64) -> i64
      %__rlasp_stack_elide_zero_625 = arith.constant 0 : i64
      %4444 = arith.addi %4443, %__rlasp_stack_elide_zero_625 : i64
      scf.yield %4444 : i64
    }
    func.call @stack_push_pointer(%4251) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511531"() {
    %4895 = func.call @stack_pop_pointer() : () -> i64
    %4896 = func.call @cc_nil_value() : () -> i64
    %4897 = func.call @cc_nil_value() : () -> i64
    %4898 = func.call @cc_errorp(%4896) : (i64) -> i64
    %4899 = arith.cmpi ne, %4898, %4897 : i64
    %4900 = scf.if %4899 -> (i64) {
      scf.yield %4896 : i64
    } else {
      %4901 = func.call @cc_nil_value() : () -> i64
      %4902 = func.call @cc_errorp(%4895) : (i64) -> i64
      %4903 = arith.cmpi ne, %4902, %4901 : i64
      %4904 = arith.cmpi eq, %4901, %4901 : i64
      %4905 = arith.andi %4903, %4904 : i1
      %4906 = scf.if %4905 -> (i64) {
        scf.yield %4895 : i64
      } else {
        scf.yield %4901 : i64
      }
      %4907 = arith.cmpi ne, %4906, %4901 : i64
      scf.if %4907 {
        func.call @stack_push_pointer(%4906) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4895) : (i64) -> ()
        %4908 = llvm.mlir.addressof @str404 : !llvm.ptr
        %4909 = func.call @cc_make_function_ref_const(%4908) : (!llvm.ptr) -> i64
        %4910 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4909, %4910) : (i64, i64) -> ()
      }
      %4911 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4912 = arith.constant 32 : i64
      %4913 = func.call @cc_make_string(%4911, %4912) : (!llvm.ptr, i64) -> i64
      %4914 = func.call @cc_nil_value() : () -> i64
      %4915 = func.call @cc_intern(%4913, %4914) : (i64, i64) -> i64
      %4916 = func.call @cc_nil_value() : () -> i64
      %4917 = func.call @cc_cons(%4915, %4916) : (i64, i64) -> i64
      %4918 = func.call @cc_values_pack(%4917) : (i64) -> i64
      %__rlasp_stack_elide_zero_626 = arith.constant 0 : i64
      %4919 = arith.addi %4915, %__rlasp_stack_elide_zero_626 : i64
      %4920 = func.call @stack_pop_pointer() : () -> i64
      %4921 = func.call @cc_eq(%4920, %4919) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_627 = arith.constant 0 : i64
      %4922 = arith.addi %4921, %__rlasp_stack_elide_zero_627 : i64
      %4923 = func.call @cc_nil_value() : () -> i64
      %4924 = arith.cmpi ne, %4922, %4923 : i64
      scf.if %4924 {
        %4925 = func.call @cc_nil_value() : () -> i64
        %4926 = func.call @cc_nil_value() : () -> i64
        %4927 = func.call @cc_errorp(%4925) : (i64) -> i64
        %4928 = arith.cmpi ne, %4927, %4926 : i64
        %4929 = scf.if %4928 -> (i64) {
          scf.yield %4925 : i64
        } else {
          %4930 = func.call @cc_nil_value() : () -> i64
          %4931 = func.call @cc_errorp(%4895) : (i64) -> i64
          %4932 = arith.cmpi ne, %4931, %4930 : i64
          %4933 = arith.cmpi eq, %4930, %4930 : i64
          %4934 = arith.andi %4932, %4933 : i1
          %4935 = scf.if %4934 -> (i64) {
            scf.yield %4895 : i64
          } else {
            scf.yield %4930 : i64
          }
          %4936 = arith.cmpi ne, %4935, %4930 : i64
          scf.if %4936 {
            func.call @stack_push_pointer(%4935) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4895) : (i64) -> ()
            %4937 = llvm.mlir.addressof @str406 : !llvm.ptr
            %4938 = func.call @cc_make_function_ref_const(%4937) : (!llvm.ptr) -> i64
            %4939 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4938, %4939) : (i64, i64) -> ()
          }
          %4940 = func.call @stack_pop_pointer() : () -> i64
          %4941 = func.call @cc_multiple_value_list(%4940) : (i64) -> i64
          %4942 = func.call @cc_t_value() : () -> i64
          %4943 = llvm.mlir.addressof @str407 : !llvm.ptr
          %4944 = arith.constant 37 : i64
          %4945 = func.call @cc_make_string(%4943, %4944) : (!llvm.ptr, i64) -> i64
          %4946 = func.call @cc_nil_value() : () -> i64
          %4947 = func.call @cc_intern(%4945, %4946) : (i64, i64) -> i64
          %4948 = func.call @cc_nil_value() : () -> i64
          %4949 = func.call @cc_cons(%4947, %4948) : (i64, i64) -> i64
          %4950 = func.call @cc_values_pack(%4949) : (i64) -> i64
          %4951 = func.call @cc_set_symbol_value(%4947, %4942) : (i64, i64) -> i64
          %4952 = llvm.mlir.addressof @str408 : !llvm.ptr
          %4953 = arith.constant 38 : i64
          %4954 = func.call @cc_make_string(%4952, %4953) : (!llvm.ptr, i64) -> i64
          %4955 = func.call @cc_nil_value() : () -> i64
          %4956 = func.call @cc_intern(%4954, %4955) : (i64, i64) -> i64
          %4957 = func.call @cc_nil_value() : () -> i64
          %4958 = func.call @cc_cons(%4956, %4957) : (i64, i64) -> i64
          %4959 = func.call @cc_values_pack(%4958) : (i64) -> i64
          %4960 = func.call @cc_set_symbol_value(%4956, %4940) : (i64, i64) -> i64
          %4961 = llvm.mlir.addressof @str409 : !llvm.ptr
          %4962 = arith.constant 39 : i64
          %4963 = func.call @cc_make_string(%4961, %4962) : (!llvm.ptr, i64) -> i64
          %4964 = func.call @cc_nil_value() : () -> i64
          %4965 = func.call @cc_intern(%4963, %4964) : (i64, i64) -> i64
          %4966 = func.call @cc_nil_value() : () -> i64
          %4967 = func.call @cc_cons(%4965, %4966) : (i64, i64) -> i64
          %4968 = func.call @cc_values_pack(%4967) : (i64) -> i64
          %4969 = func.call @cc_set_symbol_value(%4965, %4941) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_628 = arith.constant 0 : i64
          %4970 = arith.addi %4940, %__rlasp_stack_elide_zero_628 : i64
          scf.yield %4970 : i64
        }
        func.call @stack_push_pointer(%4929) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %4971 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4971 : i64
    }
    func.call @stack_push_pointer(%4900) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511530"() {
    %4882 = func.call @stack_pop_pointer() : () -> i64
    %4883 = func.call @cc_nil_value() : () -> i64
    %4884 = func.call @cc_nil_value() : () -> i64
    %4885 = func.call @cc_errorp(%4883) : (i64) -> i64
    %4886 = arith.cmpi ne, %4885, %4884 : i64
    %4887 = scf.if %4886 -> (i64) {
      scf.yield %4883 : i64
    } else {
      %4888 = func.call @cc_t_value() : () -> i64
      %4889 = func.call @cc_debug_current_stack(%4888) : (i64) -> i64
      %4890 = func.call @cc_nil_value() : () -> i64
      %4891 = func.call @cc_nil_value() : () -> i64
      %4892 = func.call @cc_errorp(%4890) : (i64) -> i64
      %4893 = arith.cmpi ne, %4892, %4891 : i64
      %4894 = scf.if %4893 -> (i64) {
        scf.yield %4890 : i64
      } else {
        %4972 = arith.constant 97047688511531 : i64
        %4973 = arith.constant 0 : i64
        %4974 = func.call @cc_make_closure(%4972, %4973) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_629 = arith.constant 0 : i64
        %4975 = arith.addi %4974, %__rlasp_stack_elide_zero_629 : i64
        %4976 = func.call @cc_nil_value() : () -> i64
        %4977 = func.call @cc_errorp(%4975) : (i64) -> i64
        %4978 = arith.cmpi ne, %4977, %4976 : i64
        %4979 = arith.cmpi eq, %4976, %4976 : i64
        %4980 = arith.andi %4978, %4979 : i1
        %4981 = scf.if %4980 -> (i64) {
          scf.yield %4975 : i64
        } else {
          scf.yield %4976 : i64
        }
        %4982 = func.call @cc_errorp(%4889) : (i64) -> i64
        %4983 = arith.cmpi ne, %4982, %4976 : i64
        %4984 = arith.cmpi eq, %4981, %4976 : i64
        %4985 = arith.andi %4983, %4984 : i1
        %4986 = scf.if %4985 -> (i64) {
          scf.yield %4889 : i64
        } else {
          scf.yield %4981 : i64
        }
        %4987 = arith.cmpi ne, %4986, %4976 : i64
        scf.if %4987 {
          func.call @stack_push_pointer(%4986) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4975) : (i64) -> ()
          func.call @stack_push_pointer(%4889) : (i64) -> ()
          %4988 = llvm.mlir.addressof @str410 : !llvm.ptr
          %4989 = func.call @cc_make_function_ref_const(%4988) : (!llvm.ptr) -> i64
          %4990 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4989, %4990) : (i64, i64) -> ()
        }
        %4991 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4991 : i64
      }
      %__rlasp_stack_elide_zero_630 = arith.constant 0 : i64
      %4992 = arith.addi %4894, %__rlasp_stack_elide_zero_630 : i64
      scf.yield %4992 : i64
    }
    func.call @stack_push_pointer(%4887) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511528"() {
    %4848 = func.call @stack_pop_pointer() : () -> i64
    %4849 = func.call @cc_nil_value() : () -> i64
    %4850 = func.call @cc_nil_value() : () -> i64
    %4851 = func.call @cc_errorp(%4849) : (i64) -> i64
    %4852 = arith.cmpi ne, %4851, %4850 : i64
    %4853 = scf.if %4852 -> (i64) {
      scf.yield %4849 : i64
    } else {
      %4854 = func.call @cc_nil_value() : () -> i64
      %4855 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4856 = arith.constant 37 : i64
      %4857 = func.call @cc_make_string(%4855, %4856) : (!llvm.ptr, i64) -> i64
      %4858 = func.call @cc_nil_value() : () -> i64
      %4859 = func.call @cc_intern(%4857, %4858) : (i64, i64) -> i64
      %4860 = func.call @cc_nil_value() : () -> i64
      %4861 = func.call @cc_cons(%4859, %4860) : (i64, i64) -> i64
      %4862 = func.call @cc_values_pack(%4861) : (i64) -> i64
      %4863 = func.call @cc_set_symbol_value(%4859, %4854) : (i64, i64) -> i64
      %4864 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4865 = arith.constant 38 : i64
      %4866 = func.call @cc_make_string(%4864, %4865) : (!llvm.ptr, i64) -> i64
      %4867 = func.call @cc_nil_value() : () -> i64
      %4868 = func.call @cc_intern(%4866, %4867) : (i64, i64) -> i64
      %4869 = func.call @cc_nil_value() : () -> i64
      %4870 = func.call @cc_cons(%4868, %4869) : (i64, i64) -> i64
      %4871 = func.call @cc_values_pack(%4870) : (i64) -> i64
      %4872 = func.call @cc_set_symbol_value(%4868, %4854) : (i64, i64) -> i64
      %4873 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4874 = arith.constant 39 : i64
      %4875 = func.call @cc_make_string(%4873, %4874) : (!llvm.ptr, i64) -> i64
      %4876 = func.call @cc_nil_value() : () -> i64
      %4877 = func.call @cc_intern(%4875, %4876) : (i64, i64) -> i64
      %4878 = func.call @cc_nil_value() : () -> i64
      %4879 = func.call @cc_cons(%4877, %4878) : (i64, i64) -> i64
      %4880 = func.call @cc_values_pack(%4879) : (i64) -> i64
      %4881 = func.call @cc_set_symbol_value(%4877, %4854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4848) : (i64) -> ()
      %4993 = arith.constant 97047688511530 : i64
      %4994 = arith.constant 1 : i64
      %4995 = func.call @cc_make_closure(%4993, %4994) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_631 = arith.constant 0 : i64
      %4996 = arith.addi %4995, %__rlasp_stack_elide_zero_631 : i64
      %4997 = func.call @cc_nil_value() : () -> i64
      %4998 = func.call @cc_nil_value() : () -> i64
      %4999 = func.call @cc_errorp(%4996) : (i64) -> i64
      %5000 = arith.cmpi ne, %4999, %4998 : i64
      %5001 = arith.cmpi eq, %4998, %4998 : i64
      %5002 = arith.andi %5000, %5001 : i1
      %5003 = scf.if %5002 -> (i64) {
        scf.yield %4996 : i64
      } else {
        scf.yield %4998 : i64
      }
      %5004 = func.call @cc_errorp(%4997) : (i64) -> i64
      %5005 = arith.cmpi ne, %5004, %4998 : i64
      %5006 = arith.cmpi eq, %5003, %4998 : i64
      %5007 = arith.andi %5005, %5006 : i1
      %5008 = scf.if %5007 -> (i64) {
        scf.yield %4997 : i64
      } else {
        scf.yield %5003 : i64
      }
      %5009 = arith.cmpi ne, %5008, %4998 : i64
      scf.if %5009 {
        func.call @stack_push_pointer(%5008) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4996) : (i64) -> ()
        func.call @stack_push_pointer(%4997) : (i64) -> ()
        %5010 = llvm.mlir.addressof @str411 : !llvm.ptr
        %5011 = func.call @cc_make_function_ref_const(%5010) : (!llvm.ptr) -> i64
        %5012 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%5011, %5012) : (i64, i64) -> ()
      }
      %5013 = func.call @stack_pop_pointer() : () -> i64
      %5014 = func.call @cc_multiple_value_list(%5013) : (i64) -> i64
      %5015 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5016 = arith.constant 37 : i64
      %5017 = func.call @cc_make_string(%5015, %5016) : (!llvm.ptr, i64) -> i64
      %5018 = func.call @cc_nil_value() : () -> i64
      %5019 = func.call @cc_intern(%5017, %5018) : (i64, i64) -> i64
      %5020 = func.call @cc_nil_value() : () -> i64
      %5021 = func.call @cc_cons(%5019, %5020) : (i64, i64) -> i64
      %5022 = func.call @cc_values_pack(%5021) : (i64) -> i64
      %5023 = func.call @cc_symbol_value(%5019) : (i64) -> i64
      %5024 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5025 = arith.constant 38 : i64
      %5026 = func.call @cc_make_string(%5024, %5025) : (!llvm.ptr, i64) -> i64
      %5027 = func.call @cc_nil_value() : () -> i64
      %5028 = func.call @cc_intern(%5026, %5027) : (i64, i64) -> i64
      %5029 = func.call @cc_nil_value() : () -> i64
      %5030 = func.call @cc_cons(%5028, %5029) : (i64, i64) -> i64
      %5031 = func.call @cc_values_pack(%5030) : (i64) -> i64
      %5032 = func.call @cc_symbol_value(%5028) : (i64) -> i64
      %5033 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5034 = arith.constant 39 : i64
      %5035 = func.call @cc_make_string(%5033, %5034) : (!llvm.ptr, i64) -> i64
      %5036 = func.call @cc_nil_value() : () -> i64
      %5037 = func.call @cc_intern(%5035, %5036) : (i64, i64) -> i64
      %5038 = func.call @cc_nil_value() : () -> i64
      %5039 = func.call @cc_cons(%5037, %5038) : (i64, i64) -> i64
      %5040 = func.call @cc_values_pack(%5039) : (i64) -> i64
      %5041 = func.call @cc_symbol_value(%5037) : (i64) -> i64
      %5042 = func.call @cc_nil_value() : () -> i64
      %5043 = arith.cmpi ne, %5023, %5042 : i64
      %5044 = scf.if %5043 -> (i64) {
        scf.yield %5041 : i64
      } else {
        scf.yield %5014 : i64
      }
      %5045 = func.call @cc_values_pack(%5044) : (i64) -> i64
      %__rlasp_stack_elide_zero_632 = arith.constant 0 : i64
      %5046 = arith.addi %5045, %__rlasp_stack_elide_zero_632 : i64
      scf.yield %5046 : i64
    }
    func.call @stack_push_pointer(%4853) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511537"() {
    %5728 = func.call @stack_pop_pointer() : () -> i64
    %5729 = func.call @stack_pop_pointer() : () -> i64
    %5730 = func.call @cc_nil_value() : () -> i64
    %5731 = func.call @cc_nil_value() : () -> i64
    %5732 = func.call @cc_errorp(%5730) : (i64) -> i64
    %5733 = arith.cmpi ne, %5732, %5731 : i64
    %5734 = scf.if %5733 -> (i64) {
      scf.yield %5730 : i64
    } else {
      %5735 = func.call @cc_nil_value() : () -> i64
      %5736 = func.call @cc_errorp(%5728) : (i64) -> i64
      %5737 = arith.cmpi ne, %5736, %5735 : i64
      %5738 = arith.cmpi eq, %5735, %5735 : i64
      %5739 = arith.andi %5737, %5738 : i1
      %5740 = scf.if %5739 -> (i64) {
        scf.yield %5728 : i64
      } else {
        scf.yield %5735 : i64
      }
      %5741 = arith.cmpi ne, %5740, %5735 : i64
      scf.if %5741 {
        func.call @stack_push_pointer(%5740) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5728) : (i64) -> ()
        %5742 = llvm.mlir.addressof @str482 : !llvm.ptr
        %5743 = func.call @cc_make_function_ref_const(%5742) : (!llvm.ptr) -> i64
        %5744 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5743, %5744) : (i64, i64) -> ()
      }
      %5745 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5746 = arith.constant 8 : i64
      %5747 = func.call @cc_make_string(%5745, %5746) : (!llvm.ptr, i64) -> i64
      %5748 = llvm.mlir.addressof @str484 : !llvm.ptr
      %5749 = arith.constant 7 : i64
      %5750 = func.call @cc_make_string(%5748, %5749) : (!llvm.ptr, i64) -> i64
      %5751 = func.call @cc_intern(%5747, %5750) : (i64, i64) -> i64
      %5752 = func.call @cc_nil_value() : () -> i64
      %5753 = func.call @cc_cons(%5751, %5752) : (i64, i64) -> i64
      %5754 = func.call @cc_values_pack(%5753) : (i64) -> i64
      %__rlasp_stack_elide_zero_633 = arith.constant 0 : i64
      %5755 = arith.addi %5751, %__rlasp_stack_elide_zero_633 : i64
      %5756 = func.call @stack_pop_pointer() : () -> i64
      %5757 = func.call @cc_eq(%5756, %5755) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_634 = arith.constant 0 : i64
      %5758 = arith.addi %5757, %__rlasp_stack_elide_zero_634 : i64
      %5759 = func.call @cc_nil_value() : () -> i64
      %5760 = arith.cmpi ne, %5758, %5759 : i64
      scf.if %5760 {
        %5761 = func.call @cc_nil_value() : () -> i64
        %5762 = func.call @cc_errorp(%5728) : (i64) -> i64
        %5763 = arith.cmpi ne, %5762, %5761 : i64
        %5764 = arith.cmpi eq, %5761, %5761 : i64
        %5765 = arith.andi %5763, %5764 : i1
        %5766 = scf.if %5765 -> (i64) {
          scf.yield %5728 : i64
        } else {
          scf.yield %5761 : i64
        }
        %5767 = arith.cmpi ne, %5766, %5761 : i64
        scf.if %5767 {
          func.call @stack_push_pointer(%5766) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5728) : (i64) -> ()
          %5768 = llvm.mlir.addressof @str485 : !llvm.ptr
          %5769 = func.call @cc_make_function_ref_const(%5768) : (!llvm.ptr) -> i64
          %5770 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5769, %5770) : (i64, i64) -> ()
        }
        %5771 = func.call @stack_pop_pointer() : () -> i64
        %5772 = func.call @cc_symbol_value(%5729) : (i64) -> i64
        %5773 = func.call @cc_cons(%5771, %5772) : (i64, i64) -> i64
        %5774 = func.call @cc_set_symbol_value(%5729, %5773) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5773) : (i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %5775 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5775 : i64
    }
    func.call @stack_push_pointer(%5734) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bc2"() {
    %5676 = llvm.mlir.addressof @str476 : !llvm.ptr
    %5677 = arith.constant 3 : i64
    %5678 = func.call @cc_make_string(%5676, %5677) : (!llvm.ptr, i64) -> i64
    %5679 = func.call @cc_nil_value() : () -> i64
    %5680 = func.call @cc_intern(%5678, %5679) : (i64, i64) -> i64
    %5681 = func.call @cc_nil_value() : () -> i64
    %5682 = func.call @cc_cons(%5680, %5681) : (i64, i64) -> i64
    %5683 = func.call @cc_values_pack(%5682) : (i64) -> i64
    %5684 = llvm.mlir.addressof @str477 : !llvm.ptr
    %5685 = arith.constant 8 : i64
    %5686 = func.call @cc_make_string(%5684, %5685) : (!llvm.ptr, i64) -> i64
    %5687 = func.call @cc_register_function_frame_language_raw(%5680, %5686) : (i64, i64) -> i64
    %5688 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%5680, %5688) : (i64, i64) -> ()
    %5689 = func.call @cc_nil_value() : () -> i64
    %5690 = llvm.mlir.addressof @str478 : !llvm.ptr
    %5691 = arith.constant 37 : i64
    %5692 = func.call @cc_make_string(%5690, %5691) : (!llvm.ptr, i64) -> i64
    %5693 = func.call @cc_nil_value() : () -> i64
    %5694 = func.call @cc_intern(%5692, %5693) : (i64, i64) -> i64
    %5695 = func.call @cc_nil_value() : () -> i64
    %5696 = func.call @cc_cons(%5694, %5695) : (i64, i64) -> i64
    %5697 = func.call @cc_values_pack(%5696) : (i64) -> i64
    %5698 = func.call @cc_set_symbol_value(%5694, %5689) : (i64, i64) -> i64
    %5699 = llvm.mlir.addressof @str479 : !llvm.ptr
    %5700 = arith.constant 38 : i64
    %5701 = func.call @cc_make_string(%5699, %5700) : (!llvm.ptr, i64) -> i64
    %5702 = func.call @cc_nil_value() : () -> i64
    %5703 = func.call @cc_intern(%5701, %5702) : (i64, i64) -> i64
    %5704 = func.call @cc_nil_value() : () -> i64
    %5705 = func.call @cc_cons(%5703, %5704) : (i64, i64) -> i64
    %5706 = func.call @cc_values_pack(%5705) : (i64) -> i64
    %5707 = func.call @cc_set_symbol_value(%5703, %5689) : (i64, i64) -> i64
    %5708 = llvm.mlir.addressof @str480 : !llvm.ptr
    %5709 = arith.constant 39 : i64
    %5710 = func.call @cc_make_string(%5708, %5709) : (!llvm.ptr, i64) -> i64
    %5711 = func.call @cc_nil_value() : () -> i64
    %5712 = func.call @cc_intern(%5710, %5711) : (i64, i64) -> i64
    %5713 = func.call @cc_nil_value() : () -> i64
    %5714 = func.call @cc_cons(%5712, %5713) : (i64, i64) -> i64
    %5715 = func.call @cc_values_pack(%5714) : (i64) -> i64
    %5716 = func.call @cc_set_symbol_value(%5712, %5689) : (i64, i64) -> i64
    %5717 = func.call @cc_nil_value() : () -> i64
    %5718 = llvm.mlir.addressof @str481 : !llvm.ptr
    %5719 = arith.constant 34 : i64
    %5720 = func.call @cc_make_symbol(%5718, %5719) : (!llvm.ptr, i64) -> i64
    %5721 = func.call @cc_persistent_root_value(%5720) : (i64) -> i64
    %5722 = func.call @cc_set_symbol_value(%5721, %5717) : (i64, i64) -> i64
    %5723 = func.call @cc_nil_value() : () -> i64
    %5724 = func.call @cc_nil_value() : () -> i64
    %5725 = func.call @cc_errorp(%5723) : (i64) -> i64
    %5726 = arith.cmpi ne, %5725, %5724 : i64
    %5727 = scf.if %5726 -> (i64) {
      scf.yield %5723 : i64
    } else {
      func.call @stack_push_pointer(%5721) : (i64) -> ()
      %5776 = arith.constant 97047688511537 : i64
      %5777 = arith.constant 1 : i64
      %5778 = func.call @cc_make_closure(%5776, %5777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_635 = arith.constant 0 : i64
      %5779 = arith.addi %5778, %__rlasp_stack_elide_zero_635 : i64
      %5780 = func.call @cc_nil_value() : () -> i64
      %5781 = func.call @cc_errorp(%5779) : (i64) -> i64
      %5782 = arith.cmpi ne, %5781, %5780 : i64
      %5783 = arith.cmpi eq, %5780, %5780 : i64
      %5784 = arith.andi %5782, %5783 : i1
      %5785 = scf.if %5784 -> (i64) {
        scf.yield %5779 : i64
      } else {
        scf.yield %5780 : i64
      }
      %5786 = arith.cmpi ne, %5785, %5780 : i64
      scf.if %5786 {
        func.call @stack_push_pointer(%5785) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5779) : (i64) -> ()
        %5787 = llvm.mlir.addressof @str486 : !llvm.ptr
        %5788 = func.call @cc_make_function_ref_const(%5787) : (!llvm.ptr) -> i64
        %5789 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5788, %5789) : (i64, i64) -> ()
      }
      %5790 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5790 : i64
    }
    %5791 = func.call @cc_nil_value() : () -> i64
    %5792 = func.call @cc_errorp(%5727) : (i64) -> i64
    %5793 = arith.cmpi ne, %5792, %5791 : i64
    %5794 = scf.if %5793 -> (i64) {
      scf.yield %5727 : i64
    } else {
      %5795 = func.call @cc_symbol_value(%5721) : (i64) -> i64
      %__rlasp_stack_elide_zero_636 = arith.constant 0 : i64
      %5796 = arith.addi %5795, %__rlasp_stack_elide_zero_636 : i64
      scf.yield %5796 : i64
    }
    %__rlasp_stack_elide_zero_637 = arith.constant 0 : i64
    %5797 = arith.addi %5794, %__rlasp_stack_elide_zero_637 : i64
    %5798 = func.call @cc_multiple_value_list(%5797) : (i64) -> i64
    %5799 = llvm.mlir.addressof @str487 : !llvm.ptr
    %5800 = arith.constant 37 : i64
    %5801 = func.call @cc_make_string(%5799, %5800) : (!llvm.ptr, i64) -> i64
    %5802 = func.call @cc_nil_value() : () -> i64
    %5803 = func.call @cc_intern(%5801, %5802) : (i64, i64) -> i64
    %5804 = func.call @cc_nil_value() : () -> i64
    %5805 = func.call @cc_cons(%5803, %5804) : (i64, i64) -> i64
    %5806 = func.call @cc_values_pack(%5805) : (i64) -> i64
    %5807 = func.call @cc_symbol_value(%5803) : (i64) -> i64
    %5808 = llvm.mlir.addressof @str488 : !llvm.ptr
    %5809 = arith.constant 39 : i64
    %5810 = func.call @cc_make_string(%5808, %5809) : (!llvm.ptr, i64) -> i64
    %5811 = func.call @cc_nil_value() : () -> i64
    %5812 = func.call @cc_intern(%5810, %5811) : (i64, i64) -> i64
    %5813 = func.call @cc_nil_value() : () -> i64
    %5814 = func.call @cc_cons(%5812, %5813) : (i64, i64) -> i64
    %5815 = func.call @cc_values_pack(%5814) : (i64) -> i64
    %5816 = func.call @cc_symbol_value(%5812) : (i64) -> i64
    %5817 = func.call @cc_nil_value() : () -> i64
    %5818 = arith.cmpi ne, %5807, %5817 : i64
    %5819 = scf.if %5818 -> (i64) {
      scf.yield %5816 : i64
    } else {
      scf.yield %5798 : i64
    }
    %5820 = func.call @cc_values_pack(%5819) : (i64) -> i64
    func.call @stack_push_pointer(%5820) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%bc1"() {
    %5845 = llvm.mlir.addressof @str492 : !llvm.ptr
    %5846 = arith.constant 3 : i64
    %5847 = func.call @cc_make_string(%5845, %5846) : (!llvm.ptr, i64) -> i64
    %5848 = func.call @cc_nil_value() : () -> i64
    %5849 = func.call @cc_intern(%5847, %5848) : (i64, i64) -> i64
    %5850 = func.call @cc_nil_value() : () -> i64
    %5851 = func.call @cc_cons(%5849, %5850) : (i64, i64) -> i64
    %5852 = func.call @cc_values_pack(%5851) : (i64) -> i64
    %5853 = llvm.mlir.addressof @str493 : !llvm.ptr
    %5854 = arith.constant 8 : i64
    %5855 = func.call @cc_make_string(%5853, %5854) : (!llvm.ptr, i64) -> i64
    %5856 = func.call @cc_register_function_frame_language_raw(%5849, %5855) : (i64, i64) -> i64
    %5857 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%5849, %5857) : (i64, i64) -> ()
    %5858 = func.call @cc_nil_value() : () -> i64
    %5859 = llvm.mlir.addressof @str494 : !llvm.ptr
    %5860 = arith.constant 37 : i64
    %5861 = func.call @cc_make_string(%5859, %5860) : (!llvm.ptr, i64) -> i64
    %5862 = func.call @cc_nil_value() : () -> i64
    %5863 = func.call @cc_intern(%5861, %5862) : (i64, i64) -> i64
    %5864 = func.call @cc_nil_value() : () -> i64
    %5865 = func.call @cc_cons(%5863, %5864) : (i64, i64) -> i64
    %5866 = func.call @cc_values_pack(%5865) : (i64) -> i64
    %5867 = func.call @cc_set_symbol_value(%5863, %5858) : (i64, i64) -> i64
    %5868 = llvm.mlir.addressof @str495 : !llvm.ptr
    %5869 = arith.constant 38 : i64
    %5870 = func.call @cc_make_string(%5868, %5869) : (!llvm.ptr, i64) -> i64
    %5871 = func.call @cc_nil_value() : () -> i64
    %5872 = func.call @cc_intern(%5870, %5871) : (i64, i64) -> i64
    %5873 = func.call @cc_nil_value() : () -> i64
    %5874 = func.call @cc_cons(%5872, %5873) : (i64, i64) -> i64
    %5875 = func.call @cc_values_pack(%5874) : (i64) -> i64
    %5876 = func.call @cc_set_symbol_value(%5872, %5858) : (i64, i64) -> i64
    %5877 = llvm.mlir.addressof @str496 : !llvm.ptr
    %5878 = arith.constant 39 : i64
    %5879 = func.call @cc_make_string(%5877, %5878) : (!llvm.ptr, i64) -> i64
    %5880 = func.call @cc_nil_value() : () -> i64
    %5881 = func.call @cc_intern(%5879, %5880) : (i64, i64) -> i64
    %5882 = func.call @cc_nil_value() : () -> i64
    %5883 = func.call @cc_cons(%5881, %5882) : (i64, i64) -> i64
    %5884 = func.call @cc_values_pack(%5883) : (i64) -> i64
    %5885 = func.call @cc_set_symbol_value(%5881, %5858) : (i64, i64) -> i64
    %5886 = func.call @cc_nil_value() : () -> i64
    %5887 = arith.cmpi ne, %5886, %5886 : i64
    scf.if %5887 {
      func.call @stack_push_pointer(%5886) : (i64) -> ()
    } else {
      %5888 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5889 = func.call @cc_make_function_ref_const(%5888) : (!llvm.ptr) -> i64
      %5890 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%5889, %5890) : (i64, i64) -> ()
    }
    %5891 = func.call @stack_pop_pointer() : () -> i64
    %5892 = func.call @cc_multiple_value_list(%5891) : (i64) -> i64
    %5893 = llvm.mlir.addressof @str498 : !llvm.ptr
    %5894 = arith.constant 37 : i64
    %5895 = func.call @cc_make_string(%5893, %5894) : (!llvm.ptr, i64) -> i64
    %5896 = func.call @cc_nil_value() : () -> i64
    %5897 = func.call @cc_intern(%5895, %5896) : (i64, i64) -> i64
    %5898 = func.call @cc_nil_value() : () -> i64
    %5899 = func.call @cc_cons(%5897, %5898) : (i64, i64) -> i64
    %5900 = func.call @cc_values_pack(%5899) : (i64) -> i64
    %5901 = func.call @cc_symbol_value(%5897) : (i64) -> i64
    %5902 = llvm.mlir.addressof @str499 : !llvm.ptr
    %5903 = arith.constant 39 : i64
    %5904 = func.call @cc_make_string(%5902, %5903) : (!llvm.ptr, i64) -> i64
    %5905 = func.call @cc_nil_value() : () -> i64
    %5906 = func.call @cc_intern(%5904, %5905) : (i64, i64) -> i64
    %5907 = func.call @cc_nil_value() : () -> i64
    %5908 = func.call @cc_cons(%5906, %5907) : (i64, i64) -> i64
    %5909 = func.call @cc_values_pack(%5908) : (i64) -> i64
    %5910 = func.call @cc_symbol_value(%5906) : (i64) -> i64
    %5911 = func.call @cc_nil_value() : () -> i64
    %5912 = arith.cmpi ne, %5901, %5911 : i64
    %5913 = scf.if %5912 -> (i64) {
      scf.yield %5910 : i64
    } else {
      scf.yield %5892 : i64
    }
    %5914 = func.call @cc_values_pack(%5913) : (i64) -> i64
    func.call @stack_push_pointer(%5914) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511534"() {
    %5668 = func.call @stack_pop_pointer() : () -> i64
    %5669 = func.call @stack_pop_pointer() : () -> i64
    %5670 = func.call @stack_pop_pointer() : () -> i64
    %5671 = func.call @cc_nil_value() : () -> i64
    %5672 = func.call @cc_nil_value() : () -> i64
    %5673 = func.call @cc_errorp(%5671) : (i64) -> i64
    %5674 = arith.cmpi ne, %5673, %5672 : i64
    %5675 = scf.if %5674 -> (i64) {
      scf.yield %5671 : i64
    } else {
      %5821 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5822 = func.call @cc_make_function_ref_const(%5821) : (!llvm.ptr) -> i64
      %5823 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5824 = arith.constant 3 : i64
      %5825 = func.call @cc_make_string(%5823, %5824) : (!llvm.ptr, i64) -> i64
      %5826 = func.call @cc_nil_value() : () -> i64
      %5827 = func.call @cc_intern(%5825, %5826) : (i64, i64) -> i64
      %5828 = func.call @cc_nil_value() : () -> i64
      %5829 = func.call @cc_cons(%5827, %5828) : (i64, i64) -> i64
      %5830 = func.call @cc_values_pack(%5829) : (i64) -> i64
      %5831 = func.call @cc_set_symbol_value(%5827, %5822) : (i64, i64) -> i64
      %5832 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5833 = arith.constant 3 : i64
      %5834 = func.call @cc_make_string(%5832, %5833) : (!llvm.ptr, i64) -> i64
      %5835 = func.call @cc_nil_value() : () -> i64
      %5836 = func.call @cc_intern(%5834, %5835) : (i64, i64) -> i64
      %5837 = func.call @cc_nil_value() : () -> i64
      %5838 = func.call @cc_cons(%5836, %5837) : (i64, i64) -> i64
      %5839 = func.call @cc_values_pack(%5838) : (i64) -> i64
      %__rlasp_stack_elide_zero_638 = arith.constant 0 : i64
      %5840 = arith.addi %5836, %__rlasp_stack_elide_zero_638 : i64
      scf.yield %5840 : i64
    }
    %5841 = func.call @cc_nil_value() : () -> i64
    %5842 = func.call @cc_errorp(%5675) : (i64) -> i64
    %5843 = arith.cmpi ne, %5842, %5841 : i64
    %5844 = scf.if %5843 -> (i64) {
      scf.yield %5675 : i64
    } else {
      %5915 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5916 = func.call @cc_make_function_ref_const(%5915) : (!llvm.ptr) -> i64
      %5917 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5918 = arith.constant 3 : i64
      %5919 = func.call @cc_make_string(%5917, %5918) : (!llvm.ptr, i64) -> i64
      %5920 = func.call @cc_nil_value() : () -> i64
      %5921 = func.call @cc_intern(%5919, %5920) : (i64, i64) -> i64
      %5922 = func.call @cc_nil_value() : () -> i64
      %5923 = func.call @cc_cons(%5921, %5922) : (i64, i64) -> i64
      %5924 = func.call @cc_values_pack(%5923) : (i64) -> i64
      %5925 = func.call @cc_set_symbol_value(%5921, %5916) : (i64, i64) -> i64
      %5926 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5927 = arith.constant 3 : i64
      %5928 = func.call @cc_make_string(%5926, %5927) : (!llvm.ptr, i64) -> i64
      %5929 = func.call @cc_nil_value() : () -> i64
      %5930 = func.call @cc_intern(%5928, %5929) : (i64, i64) -> i64
      %5931 = func.call @cc_nil_value() : () -> i64
      %5932 = func.call @cc_cons(%5930, %5931) : (i64, i64) -> i64
      %5933 = func.call @cc_values_pack(%5932) : (i64) -> i64
      %__rlasp_stack_elide_zero_639 = arith.constant 0 : i64
      %5934 = arith.addi %5930, %__rlasp_stack_elide_zero_639 : i64
      scf.yield %5934 : i64
    }
    func.call @stack_push_pointer(%5844) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511533"() {
    %5658 = func.call @cc_nil_value() : () -> i64
    %5659 = func.call @cc_nil_value() : () -> i64
    %5660 = func.call @cc_errorp(%5658) : (i64) -> i64
    %5661 = arith.cmpi ne, %5660, %5659 : i64
    %5662 = scf.if %5661 -> (i64) {
      scf.yield %5658 : i64
    } else {
      %5663 = func.call @cc_nil_value() : () -> i64
      %5664 = func.call @cc_nil_value() : () -> i64
      %5665 = func.call @cc_errorp(%5663) : (i64) -> i64
      %5666 = arith.cmpi ne, %5665, %5664 : i64
      %5667 = scf.if %5666 -> (i64) {
        scf.yield %5663 : i64
      } else {
        %5935 = llvm.mlir.addressof @str503 : !llvm.ptr
        %5936 = arith.constant 31 : i64
        %5937 = func.call @cc_make_symbol(%5935, %5936) : (!llvm.ptr, i64) -> i64
        %5938 = func.call @cc_persistent_root_value(%5937) : (i64) -> i64
        func.call @stack_push_pointer(%5938) : (i64) -> ()
        %5939 = llvm.mlir.addressof @str504 : !llvm.ptr
        %5940 = arith.constant 31 : i64
        %5941 = func.call @cc_make_symbol(%5939, %5940) : (!llvm.ptr, i64) -> i64
        %5942 = func.call @cc_persistent_root_value(%5941) : (i64) -> i64
        func.call @stack_push_pointer(%5942) : (i64) -> ()
        %5943 = llvm.mlir.addressof @str505 : !llvm.ptr
        %5944 = arith.constant 34 : i64
        %5945 = func.call @cc_make_symbol(%5943, %5944) : (!llvm.ptr, i64) -> i64
        %5946 = func.call @cc_persistent_root_value(%5945) : (i64) -> i64
        func.call @stack_push_pointer(%5946) : (i64) -> ()
        %5947 = arith.constant 97047688511534 : i64
        %5948 = arith.constant 3 : i64
        %5949 = func.call @cc_make_closure(%5947, %5948) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_640 = arith.constant 0 : i64
        %5950 = arith.addi %5949, %__rlasp_stack_elide_zero_640 : i64
        %5951 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5950, %5951) : (i64, i64) -> ()
        %5952 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5952 : i64
      }
      %5953 = func.call @cc_nil_value() : () -> i64
      %5954 = func.call @cc_errorp(%5667) : (i64) -> i64
      %5955 = arith.cmpi ne, %5954, %5953 : i64
      %5956 = scf.if %5955 -> (i64) {
        scf.yield %5667 : i64
      } else {
        %5957 = llvm.mlir.addressof @str506 : !llvm.ptr
        %5958 = arith.constant 3 : i64
        %5959 = func.call @cc_make_string(%5957, %5958) : (!llvm.ptr, i64) -> i64
        %5960 = func.call @cc_nil_value() : () -> i64
        %5961 = func.call @cc_intern(%5959, %5960) : (i64, i64) -> i64
        %5962 = func.call @cc_nil_value() : () -> i64
        %5963 = func.call @cc_cons(%5961, %5962) : (i64, i64) -> i64
        %5964 = func.call @cc_values_pack(%5963) : (i64) -> i64
        func.call @stack_push_pointer(%5961) : (i64) -> ()
        %5965 = llvm.mlir.addressof @str507 : !llvm.ptr
        %5966 = arith.constant 3 : i64
        %5967 = func.call @cc_make_string(%5965, %5966) : (!llvm.ptr, i64) -> i64
        %5968 = func.call @cc_nil_value() : () -> i64
        %5969 = func.call @cc_intern(%5967, %5968) : (i64, i64) -> i64
        %5970 = func.call @cc_nil_value() : () -> i64
        %5971 = func.call @cc_cons(%5969, %5970) : (i64, i64) -> i64
        %5972 = func.call @cc_values_pack(%5971) : (i64) -> i64
        func.call @stack_push_pointer(%5969) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %5973 = func.call @stack_pop_pointer() : () -> i64
        %5974 = func.call @stack_pop_pointer() : () -> i64
        %5975 = func.call @cc_cons(%5974, %5973) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_641 = arith.constant 0 : i64
        %5976 = arith.addi %5975, %__rlasp_stack_elide_zero_641 : i64
        %5977 = func.call @stack_pop_pointer() : () -> i64
        %5978 = func.call @cc_cons(%5977, %5976) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_642 = arith.constant 0 : i64
        %5979 = arith.addi %5978, %__rlasp_stack_elide_zero_642 : i64
        %5980 = llvm.mlir.addressof @str508 : !llvm.ptr
        %5981 = arith.constant 3 : i64
        %5982 = func.call @cc_make_string(%5980, %5981) : (!llvm.ptr, i64) -> i64
        %5983 = func.call @cc_nil_value() : () -> i64
        %5984 = func.call @cc_intern(%5982, %5983) : (i64, i64) -> i64
        %5985 = func.call @cc_nil_value() : () -> i64
        %5986 = func.call @cc_cons(%5984, %5985) : (i64, i64) -> i64
        %5987 = func.call @cc_values_pack(%5986) : (i64) -> i64
        %__rlasp_stack_elide_zero_643 = arith.constant 0 : i64
        %5988 = arith.addi %5984, %__rlasp_stack_elide_zero_643 : i64
        %5989 = func.call @cc_fdefinition(%5988) : (i64) -> i64
        %__rlasp_stack_elide_zero_644 = arith.constant 0 : i64
        %5990 = arith.addi %5989, %__rlasp_stack_elide_zero_644 : i64
        %5991 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5990, %5991) : (i64, i64) -> ()
        %5992 = func.call @stack_pop_pointer() : () -> i64
        %5993 = func.call @cc_nil_value() : () -> i64
        %5994 = func.call @cc_errorp(%5979) : (i64) -> i64
        %5995 = arith.cmpi ne, %5994, %5993 : i64
        %5996 = arith.cmpi eq, %5993, %5993 : i64
        %5997 = arith.andi %5995, %5996 : i1
        %5998 = scf.if %5997 -> (i64) {
          scf.yield %5979 : i64
        } else {
          scf.yield %5993 : i64
        }
        %5999 = func.call @cc_errorp(%5992) : (i64) -> i64
        %6000 = arith.cmpi ne, %5999, %5993 : i64
        %6001 = arith.cmpi eq, %5998, %5993 : i64
        %6002 = arith.andi %6000, %6001 : i1
        %6003 = scf.if %6002 -> (i64) {
          scf.yield %5992 : i64
        } else {
          scf.yield %5998 : i64
        }
        %6004 = arith.cmpi ne, %6003, %5993 : i64
        scf.if %6004 {
          func.call @stack_push_pointer(%6003) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5979) : (i64) -> ()
          func.call @stack_push_pointer(%5992) : (i64) -> ()
          %6005 = llvm.mlir.addressof @str509 : !llvm.ptr
          %6006 = func.call @cc_make_function_ref_const(%6005) : (!llvm.ptr) -> i64
          %6007 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%6006, %6007) : (i64, i64) -> ()
        }
        %6008 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6008 : i64
      }
      %__rlasp_stack_elide_zero_645 = arith.constant 0 : i64
      %6009 = arith.addi %5956, %__rlasp_stack_elide_zero_645 : i64
      %6010 = func.call @cc_nil_value() : () -> i64
      %6011 = func.call @cc_cons(%6009, %6010) : (i64, i64) -> i64
      %6012 = func.call @cc_not(%6011) : (i64) -> i64
      %__rlasp_stack_elide_zero_646 = arith.constant 0 : i64
      %6013 = arith.addi %6012, %__rlasp_stack_elide_zero_646 : i64
      %6014 = func.call @cc_nil_value() : () -> i64
      %6015 = func.call @cc_cons(%6013, %6014) : (i64, i64) -> i64
      %6016 = func.call @cc_not(%6015) : (i64) -> i64
      %__rlasp_stack_elide_zero_647 = arith.constant 0 : i64
      %6017 = arith.addi %6016, %__rlasp_stack_elide_zero_647 : i64
      scf.yield %6017 : i64
    }
    func.call @stack_push_pointer(%5662) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511545"() {
    %6503 = func.call @stack_pop_pointer() : () -> i64
    %6504 = func.call @stack_pop_pointer() : () -> i64
    %6505 = func.call @cc_nil_value() : () -> i64
    %6506 = func.call @cc_nil_value() : () -> i64
    %6507 = func.call @cc_errorp(%6505) : (i64) -> i64
    %6508 = arith.cmpi ne, %6507, %6506 : i64
    %6509 = scf.if %6508 -> (i64) {
      scf.yield %6505 : i64
    } else {
      %6510 = func.call @cc_nil_value() : () -> i64
      %6511 = func.call @cc_errorp(%6503) : (i64) -> i64
      %6512 = arith.cmpi ne, %6511, %6510 : i64
      %6513 = arith.cmpi eq, %6510, %6510 : i64
      %6514 = arith.andi %6512, %6513 : i1
      %6515 = scf.if %6514 -> (i64) {
        scf.yield %6503 : i64
      } else {
        scf.yield %6510 : i64
      }
      %6516 = arith.cmpi ne, %6515, %6510 : i64
      scf.if %6516 {
        func.call @stack_push_pointer(%6515) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6503) : (i64) -> ()
        %6517 = llvm.mlir.addressof @str557 : !llvm.ptr
        %6518 = func.call @cc_make_function_ref_const(%6517) : (!llvm.ptr) -> i64
        %6519 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6518, %6519) : (i64, i64) -> ()
      }
      %6520 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6521 = arith.constant 3 : i64
      %6522 = func.call @cc_make_string(%6520, %6521) : (!llvm.ptr, i64) -> i64
      %6523 = func.call @cc_nil_value() : () -> i64
      %6524 = func.call @cc_intern(%6522, %6523) : (i64, i64) -> i64
      %6525 = func.call @cc_nil_value() : () -> i64
      %6526 = func.call @cc_cons(%6524, %6525) : (i64, i64) -> i64
      %6527 = func.call @cc_values_pack(%6526) : (i64) -> i64
      %__rlasp_stack_elide_zero_648 = arith.constant 0 : i64
      %6528 = arith.addi %6524, %__rlasp_stack_elide_zero_648 : i64
      %6529 = func.call @stack_pop_pointer() : () -> i64
      %6530 = func.call @cc_eq(%6529, %6528) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_649 = arith.constant 0 : i64
      %6531 = arith.addi %6530, %__rlasp_stack_elide_zero_649 : i64
      %6532 = func.call @cc_nil_value() : () -> i64
      %6533 = arith.cmpi ne, %6531, %6532 : i64
      scf.if %6533 {
        %6534 = func.call @cc_nil_value() : () -> i64
        %6535 = func.call @cc_errorp(%6503) : (i64) -> i64
        %6536 = arith.cmpi ne, %6535, %6534 : i64
        %6537 = arith.cmpi eq, %6534, %6534 : i64
        %6538 = arith.andi %6536, %6537 : i1
        %6539 = scf.if %6538 -> (i64) {
          scf.yield %6503 : i64
        } else {
          scf.yield %6534 : i64
        }
        %6540 = arith.cmpi ne, %6539, %6534 : i64
        scf.if %6540 {
          func.call @stack_push_pointer(%6539) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6503) : (i64) -> ()
          %6541 = llvm.mlir.addressof @str559 : !llvm.ptr
          %6542 = func.call @cc_make_function_ref_const(%6541) : (!llvm.ptr) -> i64
          %6543 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6542, %6543) : (i64, i64) -> ()
        }
        %6544 = func.call @stack_pop_pointer() : () -> i64
        %6545 = func.call @cc_multiple_value_list(%6544) : (i64) -> i64
        %6546 = func.call @cc_t_value() : () -> i64
        %6547 = llvm.mlir.addressof @str560 : !llvm.ptr
        %6548 = arith.constant 37 : i64
        %6549 = func.call @cc_make_string(%6547, %6548) : (!llvm.ptr, i64) -> i64
        %6550 = func.call @cc_nil_value() : () -> i64
        %6551 = func.call @cc_intern(%6549, %6550) : (i64, i64) -> i64
        %6552 = func.call @cc_nil_value() : () -> i64
        %6553 = func.call @cc_cons(%6551, %6552) : (i64, i64) -> i64
        %6554 = func.call @cc_values_pack(%6553) : (i64) -> i64
        %6555 = func.call @cc_set_symbol_value(%6551, %6546) : (i64, i64) -> i64
        %6556 = llvm.mlir.addressof @str561 : !llvm.ptr
        %6557 = arith.constant 38 : i64
        %6558 = func.call @cc_make_string(%6556, %6557) : (!llvm.ptr, i64) -> i64
        %6559 = func.call @cc_nil_value() : () -> i64
        %6560 = func.call @cc_intern(%6558, %6559) : (i64, i64) -> i64
        %6561 = func.call @cc_nil_value() : () -> i64
        %6562 = func.call @cc_cons(%6560, %6561) : (i64, i64) -> i64
        %6563 = func.call @cc_values_pack(%6562) : (i64) -> i64
        %6564 = func.call @cc_set_symbol_value(%6560, %6544) : (i64, i64) -> i64
        %6565 = llvm.mlir.addressof @str562 : !llvm.ptr
        %6566 = arith.constant 39 : i64
        %6567 = func.call @cc_make_string(%6565, %6566) : (!llvm.ptr, i64) -> i64
        %6568 = func.call @cc_nil_value() : () -> i64
        %6569 = func.call @cc_intern(%6567, %6568) : (i64, i64) -> i64
        %6570 = func.call @cc_nil_value() : () -> i64
        %6571 = func.call @cc_cons(%6569, %6570) : (i64, i64) -> i64
        %6572 = func.call @cc_values_pack(%6571) : (i64) -> i64
        %6573 = func.call @cc_set_symbol_value(%6569, %6545) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6544) : (i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %6574 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6574 : i64
    }
    func.call @stack_push_pointer(%6509) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bcl"() {
    %6457 = llvm.mlir.addressof @str551 : !llvm.ptr
    %6458 = arith.constant 3 : i64
    %6459 = func.call @cc_make_string(%6457, %6458) : (!llvm.ptr, i64) -> i64
    %6460 = func.call @cc_nil_value() : () -> i64
    %6461 = func.call @cc_intern(%6459, %6460) : (i64, i64) -> i64
    %6462 = func.call @cc_nil_value() : () -> i64
    %6463 = func.call @cc_cons(%6461, %6462) : (i64, i64) -> i64
    %6464 = func.call @cc_values_pack(%6463) : (i64) -> i64
    %6465 = llvm.mlir.addressof @str552 : !llvm.ptr
    %6466 = arith.constant 1 : i64
    %6467 = func.call @cc_make_string(%6465, %6466) : (!llvm.ptr, i64) -> i64
    %6468 = func.call @cc_register_function_lambda_list_metadata_raw(%6461, %6467) : (i64, i64) -> i64
    %6469 = llvm.mlir.addressof @str553 : !llvm.ptr
    %6470 = arith.constant 8 : i64
    %6471 = func.call @cc_make_string(%6469, %6470) : (!llvm.ptr, i64) -> i64
    %6472 = func.call @cc_register_function_frame_language_raw(%6461, %6471) : (i64, i64) -> i64
    %6473 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%6461, %6473) : (i64, i64) -> ()
    %6474 = func.call @stack_pop_pointer() : () -> i64
    %6475 = func.call @cc_nil_value() : () -> i64
    %6476 = llvm.mlir.addressof @str554 : !llvm.ptr
    %6477 = arith.constant 37 : i64
    %6478 = func.call @cc_make_string(%6476, %6477) : (!llvm.ptr, i64) -> i64
    %6479 = func.call @cc_nil_value() : () -> i64
    %6480 = func.call @cc_intern(%6478, %6479) : (i64, i64) -> i64
    %6481 = func.call @cc_nil_value() : () -> i64
    %6482 = func.call @cc_cons(%6480, %6481) : (i64, i64) -> i64
    %6483 = func.call @cc_values_pack(%6482) : (i64) -> i64
    %6484 = func.call @cc_set_symbol_value(%6480, %6475) : (i64, i64) -> i64
    %6485 = llvm.mlir.addressof @str555 : !llvm.ptr
    %6486 = arith.constant 38 : i64
    %6487 = func.call @cc_make_string(%6485, %6486) : (!llvm.ptr, i64) -> i64
    %6488 = func.call @cc_nil_value() : () -> i64
    %6489 = func.call @cc_intern(%6487, %6488) : (i64, i64) -> i64
    %6490 = func.call @cc_nil_value() : () -> i64
    %6491 = func.call @cc_cons(%6489, %6490) : (i64, i64) -> i64
    %6492 = func.call @cc_values_pack(%6491) : (i64) -> i64
    %6493 = func.call @cc_set_symbol_value(%6489, %6475) : (i64, i64) -> i64
    %6494 = llvm.mlir.addressof @str556 : !llvm.ptr
    %6495 = arith.constant 39 : i64
    %6496 = func.call @cc_make_string(%6494, %6495) : (!llvm.ptr, i64) -> i64
    %6497 = func.call @cc_nil_value() : () -> i64
    %6498 = func.call @cc_intern(%6496, %6497) : (i64, i64) -> i64
    %6499 = func.call @cc_nil_value() : () -> i64
    %6500 = func.call @cc_cons(%6498, %6499) : (i64, i64) -> i64
    %6501 = func.call @cc_values_pack(%6500) : (i64) -> i64
    %6502 = func.call @cc_set_symbol_value(%6498, %6475) : (i64, i64) -> i64
    %6575 = llvm.mlir.addressof @str563 : !llvm.ptr
    %6576 = arith.constant 31 : i64
    %6577 = func.call @cc_make_symbol(%6575, %6576) : (!llvm.ptr, i64) -> i64
    %6578 = func.call @cc_persistent_root_value(%6577) : (i64) -> i64
    func.call @stack_push_pointer(%6578) : (i64) -> ()
    %6579 = arith.constant 97047688511545 : i64
    %6580 = arith.constant 1 : i64
    %6581 = func.call @cc_make_closure(%6579, %6580) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_650 = arith.constant 0 : i64
    %6582 = arith.addi %6581, %__rlasp_stack_elide_zero_650 : i64
    %6583 = func.call @cc_nil_value() : () -> i64
    %6584 = func.call @cc_errorp(%6582) : (i64) -> i64
    %6585 = arith.cmpi ne, %6584, %6583 : i64
    %6586 = arith.cmpi eq, %6583, %6583 : i64
    %6587 = arith.andi %6585, %6586 : i1
    %6588 = scf.if %6587 -> (i64) {
      scf.yield %6582 : i64
    } else {
      scf.yield %6583 : i64
    }
    %6589 = arith.cmpi ne, %6588, %6583 : i64
    scf.if %6589 {
      func.call @stack_push_pointer(%6588) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%6582) : (i64) -> ()
      %6590 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6591 = func.call @cc_make_function_ref_const(%6590) : (!llvm.ptr) -> i64
      %6592 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%6591, %6592) : (i64, i64) -> ()
    }
    %6593 = func.call @stack_pop_pointer() : () -> i64
    %6594 = func.call @cc_multiple_value_list(%6593) : (i64) -> i64
    %6595 = llvm.mlir.addressof @str565 : !llvm.ptr
    %6596 = arith.constant 37 : i64
    %6597 = func.call @cc_make_string(%6595, %6596) : (!llvm.ptr, i64) -> i64
    %6598 = func.call @cc_nil_value() : () -> i64
    %6599 = func.call @cc_intern(%6597, %6598) : (i64, i64) -> i64
    %6600 = func.call @cc_nil_value() : () -> i64
    %6601 = func.call @cc_cons(%6599, %6600) : (i64, i64) -> i64
    %6602 = func.call @cc_values_pack(%6601) : (i64) -> i64
    %6603 = func.call @cc_symbol_value(%6599) : (i64) -> i64
    %6604 = llvm.mlir.addressof @str566 : !llvm.ptr
    %6605 = arith.constant 39 : i64
    %6606 = func.call @cc_make_string(%6604, %6605) : (!llvm.ptr, i64) -> i64
    %6607 = func.call @cc_nil_value() : () -> i64
    %6608 = func.call @cc_intern(%6606, %6607) : (i64, i64) -> i64
    %6609 = func.call @cc_nil_value() : () -> i64
    %6610 = func.call @cc_cons(%6608, %6609) : (i64, i64) -> i64
    %6611 = func.call @cc_values_pack(%6610) : (i64) -> i64
    %6612 = func.call @cc_symbol_value(%6608) : (i64) -> i64
    %6613 = func.call @cc_nil_value() : () -> i64
    %6614 = arith.cmpi ne, %6603, %6613 : i64
    %6615 = scf.if %6614 -> (i64) {
      scf.yield %6612 : i64
    } else {
      scf.yield %6594 : i64
    }
    %6616 = func.call @cc_values_pack(%6615) : (i64) -> i64
    func.call @stack_push_pointer(%6616) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511543"() {
    %6451 = func.call @stack_pop_pointer() : () -> i64
    %6452 = func.call @cc_nil_value() : () -> i64
    %6453 = func.call @cc_nil_value() : () -> i64
    %6454 = func.call @cc_errorp(%6452) : (i64) -> i64
    %6455 = arith.cmpi ne, %6454, %6453 : i64
    %6456 = scf.if %6455 -> (i64) {
      scf.yield %6452 : i64
    } else {
      %6617 = llvm.mlir.addressof @str567 : !llvm.ptr
      %6618 = arith.constant 1 : i64
      %6619 = func.call @cc_make_string(%6617, %6618) : (!llvm.ptr, i64) -> i64
      %6620 = llvm.mlir.addressof @str568 : !llvm.ptr
      %6621 = arith.constant 3 : i64
      %6622 = func.call @cc_make_string(%6620, %6621) : (!llvm.ptr, i64) -> i64
      %6623 = func.call @cc_nil_value() : () -> i64
      %6624 = func.call @cc_intern(%6622, %6623) : (i64, i64) -> i64
      %6625 = func.call @cc_nil_value() : () -> i64
      %6626 = func.call @cc_cons(%6624, %6625) : (i64, i64) -> i64
      %6627 = func.call @cc_values_pack(%6626) : (i64) -> i64
      %6628 = func.call @cc_register_function_lambda_list_metadata_raw(%6624, %6619) : (i64, i64) -> i64
      %6629 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6630 = func.call @cc_make_function_ref_const(%6629) : (!llvm.ptr) -> i64
      %6631 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6632 = arith.constant 3 : i64
      %6633 = func.call @cc_make_string(%6631, %6632) : (!llvm.ptr, i64) -> i64
      %6634 = func.call @cc_nil_value() : () -> i64
      %6635 = func.call @cc_intern(%6633, %6634) : (i64, i64) -> i64
      %6636 = func.call @cc_nil_value() : () -> i64
      %6637 = func.call @cc_cons(%6635, %6636) : (i64, i64) -> i64
      %6638 = func.call @cc_values_pack(%6637) : (i64) -> i64
      %6639 = func.call @cc_set_symbol_value(%6635, %6630) : (i64, i64) -> i64
      %6640 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6641 = arith.constant 3 : i64
      %6642 = func.call @cc_make_string(%6640, %6641) : (!llvm.ptr, i64) -> i64
      %6643 = func.call @cc_nil_value() : () -> i64
      %6644 = func.call @cc_intern(%6642, %6643) : (i64, i64) -> i64
      %6645 = func.call @cc_nil_value() : () -> i64
      %6646 = func.call @cc_cons(%6644, %6645) : (i64, i64) -> i64
      %6647 = func.call @cc_values_pack(%6646) : (i64) -> i64
      %__rlasp_stack_elide_zero_651 = arith.constant 0 : i64
      %6648 = arith.addi %6644, %__rlasp_stack_elide_zero_651 : i64
      scf.yield %6648 : i64
    }
    func.call @stack_push_pointer(%6456) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511542"() {
    %6441 = func.call @cc_nil_value() : () -> i64
    %6442 = func.call @cc_nil_value() : () -> i64
    %6443 = func.call @cc_errorp(%6441) : (i64) -> i64
    %6444 = arith.cmpi ne, %6443, %6442 : i64
    %6445 = scf.if %6444 -> (i64) {
      scf.yield %6441 : i64
    } else {
      %6446 = func.call @cc_nil_value() : () -> i64
      %6447 = func.call @cc_nil_value() : () -> i64
      %6448 = func.call @cc_errorp(%6446) : (i64) -> i64
      %6449 = arith.cmpi ne, %6448, %6447 : i64
      %6450 = scf.if %6449 -> (i64) {
        scf.yield %6446 : i64
      } else {
        %6649 = llvm.mlir.addressof @str572 : !llvm.ptr
        %6650 = arith.constant 31 : i64
        %6651 = func.call @cc_make_symbol(%6649, %6650) : (!llvm.ptr, i64) -> i64
        %6652 = func.call @cc_persistent_root_value(%6651) : (i64) -> i64
        func.call @stack_push_pointer(%6652) : (i64) -> ()
        %6653 = arith.constant 97047688511543 : i64
        %6654 = arith.constant 1 : i64
        %6655 = func.call @cc_make_closure(%6653, %6654) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_652 = arith.constant 0 : i64
        %6656 = arith.addi %6655, %__rlasp_stack_elide_zero_652 : i64
        %6657 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6656, %6657) : (i64, i64) -> ()
        %6658 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6658 : i64
      }
      %6659 = func.call @cc_nil_value() : () -> i64
      %6660 = func.call @cc_errorp(%6450) : (i64) -> i64
      %6661 = arith.cmpi ne, %6660, %6659 : i64
      %6662 = scf.if %6661 -> (i64) {
        scf.yield %6450 : i64
      } else {
        %6663 = arith.constant 137 : i64
        %6664 = func.call @cc_box_fixnum(%6663) : (i64) -> i64
        %6665 = func.call @cc_nil_value() : () -> i64
        %6666 = func.call @cc_errorp(%6664) : (i64) -> i64
        %6667 = arith.cmpi ne, %6666, %6665 : i64
        %6668 = arith.cmpi eq, %6665, %6665 : i64
        %6669 = arith.andi %6667, %6668 : i1
        %6670 = scf.if %6669 -> (i64) {
          scf.yield %6664 : i64
        } else {
          scf.yield %6665 : i64
        }
        %6671 = arith.cmpi ne, %6670, %6665 : i64
        scf.if %6671 {
          func.call @stack_push_pointer(%6670) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6664) : (i64) -> ()
          %6672 = llvm.mlir.addressof @str573 : !llvm.ptr
          %6673 = func.call @cc_make_function_ref_const(%6672) : (!llvm.ptr) -> i64
          %6674 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6673, %6674) : (i64, i64) -> ()
        }
        %6675 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6675 : i64
      }
      %__rlasp_stack_elide_zero_653 = arith.constant 0 : i64
      %6676 = arith.addi %6662, %__rlasp_stack_elide_zero_653 : i64
      scf.yield %6676 : i64
    }
    func.call @stack_push_pointer(%6445) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:PRINT-OBJECT_97047688511548_primary"() {
    %6835 = func.call @stack_pop_pointer() : () -> i64
    %6836 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %6837 = func.call @stack_depth() : () -> i64
    %6838 = arith.constant 0 : i64
    %6839 = arith.cmpi sgt, %6837, %6838 : i64
    scf.if %6839 {
      %6840 = func.call @stack_pop_pointer() : () -> i64
    }
    %6841 = llvm.mlir.addressof @str584 : !llvm.ptr
    %6842 = arith.constant 52 : i64
    %6843 = func.call @cc_make_string(%6841, %6842) : (!llvm.ptr, i64) -> i64
    %6844 = func.call @cc_nil_value() : () -> i64
    %6845 = func.call @cc_errorp(%6843) : (i64) -> i64
    %6846 = arith.cmpi ne, %6845, %6844 : i64
    %6847 = arith.cmpi eq, %6844, %6844 : i64
    %6848 = arith.andi %6846, %6847 : i1
    %6849 = scf.if %6848 -> (i64) {
      scf.yield %6843 : i64
    } else {
      scf.yield %6844 : i64
    }
    %6850 = arith.cmpi ne, %6849, %6844 : i64
    scf.if %6850 {
      func.call @stack_push_pointer(%6849) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%6843) : (i64) -> ()
      %6851 = llvm.mlir.addressof @str585 : !llvm.ptr
      %6852 = func.call @cc_make_function_ref_const(%6851) : (!llvm.ptr) -> i64
      %6853 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%6852, %6853) : (i64, i64) -> ()
    }
    func.return
  }
  func.func @"__lambda_97047688511550"() {
    %7239 = func.call @stack_pop_pointer() : () -> i64
    %7240 = func.call @cc_nil_value() : () -> i64
    %7241 = func.call @cc_nil_value() : () -> i64
    %7242 = func.call @cc_errorp(%7240) : (i64) -> i64
    %7243 = arith.cmpi ne, %7242, %7241 : i64
    %7244 = scf.if %7243 -> (i64) {
      scf.yield %7240 : i64
    } else {
      %7245 = llvm.mlir.addressof @str623 : !llvm.ptr
      %7246 = arith.constant 6 : i64
      %7247 = func.call @cc_make_string(%7245, %7246) : (!llvm.ptr, i64) -> i64
      %7248 = llvm.mlir.addressof @str624 : !llvm.ptr
      %7249 = arith.constant 7 : i64
      %7250 = func.call @cc_make_string(%7248, %7249) : (!llvm.ptr, i64) -> i64
      %7251 = func.call @cc_intern(%7247, %7250) : (i64, i64) -> i64
      %7252 = func.call @cc_nil_value() : () -> i64
      %7253 = func.call @cc_cons(%7251, %7252) : (i64, i64) -> i64
      %7254 = func.call @cc_values_pack(%7253) : (i64) -> i64
      %7255 = func.call @cc_symbol_value(%7239) : (i64) -> i64
      %7256 = func.call @cc_nil_value() : () -> i64
      %7257 = func.call @cc_errorp(%7251) : (i64) -> i64
      %7258 = arith.cmpi ne, %7257, %7256 : i64
      %7259 = arith.cmpi eq, %7256, %7256 : i64
      %7260 = arith.andi %7258, %7259 : i1
      %7261 = scf.if %7260 -> (i64) {
        scf.yield %7251 : i64
      } else {
        scf.yield %7256 : i64
      }
      %7262 = func.call @cc_errorp(%7255) : (i64) -> i64
      %7263 = arith.cmpi ne, %7262, %7256 : i64
      %7264 = arith.cmpi eq, %7261, %7256 : i64
      %7265 = arith.andi %7263, %7264 : i1
      %7266 = scf.if %7265 -> (i64) {
        scf.yield %7255 : i64
      } else {
        scf.yield %7261 : i64
      }
      %7267 = arith.cmpi ne, %7266, %7256 : i64
      scf.if %7267 {
        func.call @stack_push_pointer(%7266) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7251) : (i64) -> ()
        func.call @stack_push_pointer(%7255) : (i64) -> ()
        %7268 = llvm.mlir.addressof @str625 : !llvm.ptr
        %7269 = func.call @cc_make_function_ref_const(%7268) : (!llvm.ptr) -> i64
        %7270 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%7269, %7270) : (i64, i64) -> ()
      }
      %7271 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7271 : i64
    }
    func.call @stack_push_pointer(%7244) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511549"() {
    %7228 = func.call @cc_nil_value() : () -> i64
    %7229 = func.call @cc_nil_value() : () -> i64
    %7230 = func.call @cc_errorp(%7228) : (i64) -> i64
    %7231 = arith.cmpi ne, %7230, %7229 : i64
    %7232 = scf.if %7231 -> (i64) {
      scf.yield %7228 : i64
    } else {
      %7233 = func.call @cc_nil_value() : () -> i64
      %7234 = func.call @cc_nil_value() : () -> i64
      %7235 = func.call @cc_errorp(%7233) : (i64) -> i64
      %7236 = arith.cmpi ne, %7235, %7234 : i64
      %7237 = scf.if %7236 -> (i64) {
        scf.yield %7233 : i64
      } else {
        %7238 = func.call @cc_make_string_output_stream() : () -> i64
        %7272 = llvm.mlir.addressof @str626 : !llvm.ptr
        %7273 = arith.constant 29 : i64
        %7274 = func.call @cc_make_symbol(%7272, %7273) : (!llvm.ptr, i64) -> i64
        %7275 = func.call @cc_persistent_root_value(%7274) : (i64) -> i64
        %7276 = func.call @cc_set_symbol_value(%7275, %7238) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7275) : (i64) -> ()
        %7277 = arith.constant 97047688511550 : i64
        %7278 = arith.constant 1 : i64
        %7279 = func.call @cc_make_closure(%7277, %7278) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_654 = arith.constant 0 : i64
        %7280 = arith.addi %7279, %__rlasp_stack_elide_zero_654 : i64
        %7281 = func.call @cc_nil_value() : () -> i64
        %7282 = llvm.mlir.addressof @str627 : !llvm.ptr
        %7283 = arith.constant 18 : i64
        %7284 = func.call @cc_make_string(%7282, %7283) : (!llvm.ptr, i64) -> i64
        %7285 = func.call @cc_nil_value() : () -> i64
        %7286 = func.call @cc_intern(%7284, %7285) : (i64, i64) -> i64
        %7287 = func.call @cc_nil_value() : () -> i64
        %7288 = func.call @cc_cons(%7286, %7287) : (i64, i64) -> i64
        %7289 = func.call @cc_values_pack(%7288) : (i64) -> i64
        %__rlasp_stack_elide_zero_655 = arith.constant 0 : i64
        %7290 = arith.addi %7286, %__rlasp_stack_elide_zero_655 : i64
        %7291 = func.call @cc_make_instance(%7290, %7281) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_656 = arith.constant 0 : i64
        %7292 = arith.addi %7291, %__rlasp_stack_elide_zero_656 : i64
        %7293 = func.call @cc_nil_value() : () -> i64
        %7294 = func.call @cc_errorp(%7280) : (i64) -> i64
        %7295 = arith.cmpi ne, %7294, %7293 : i64
        %7296 = arith.cmpi eq, %7293, %7293 : i64
        %7297 = arith.andi %7295, %7296 : i1
        %7298 = scf.if %7297 -> (i64) {
          scf.yield %7280 : i64
        } else {
          scf.yield %7293 : i64
        }
        %7299 = func.call @cc_errorp(%7292) : (i64) -> i64
        %7300 = arith.cmpi ne, %7299, %7293 : i64
        %7301 = arith.cmpi eq, %7298, %7293 : i64
        %7302 = arith.andi %7300, %7301 : i1
        %7303 = scf.if %7302 -> (i64) {
          scf.yield %7292 : i64
        } else {
          scf.yield %7298 : i64
        }
        %7304 = arith.cmpi ne, %7303, %7293 : i64
        scf.if %7304 {
          func.call @stack_push_pointer(%7303) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7280) : (i64) -> ()
          func.call @stack_push_pointer(%7292) : (i64) -> ()
          %7305 = llvm.mlir.addressof @str628 : !llvm.ptr
          %7306 = func.call @cc_make_function_ref_const(%7305) : (!llvm.ptr) -> i64
          %7307 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%7306, %7307) : (i64, i64) -> ()
        }
        %7308 = func.call @stack_pop_pointer() : () -> i64
        %7309 = func.call @cc_nil_value() : () -> i64
        %7310 = func.call @cc_errorp(%7308) : (i64) -> i64
        %7311 = arith.cmpi ne, %7310, %7309 : i64
        %7312 = scf.if %7311 -> (i64) {
          scf.yield %7308 : i64
        } else {
          %7313 = func.call @cc_get_output_stream_string(%7238) : (i64) -> i64
          scf.yield %7313 : i64
        }
        %__rlasp_stack_elide_zero_657 = arith.constant 0 : i64
        %7314 = arith.addi %7312, %__rlasp_stack_elide_zero_657 : i64
        scf.yield %7314 : i64
      }
      %7315 = func.call @cc_nil_value() : () -> i64
      %7316 = func.call @cc_errorp(%7237) : (i64) -> i64
      %7317 = arith.cmpi ne, %7316, %7315 : i64
      %7318 = scf.if %7317 -> (i64) {
        scf.yield %7237 : i64
      } else {
        %7319 = func.call @cc_t_value() : () -> i64
        %__rlasp_stack_elide_zero_658 = arith.constant 0 : i64
        %7320 = arith.addi %7319, %__rlasp_stack_elide_zero_658 : i64
        scf.yield %7320 : i64
      }
      %__rlasp_stack_elide_zero_659 = arith.constant 0 : i64
      %7321 = arith.addi %7318, %__rlasp_stack_elide_zero_659 : i64
      %7322 = func.call @cc_nil_value() : () -> i64
      %7323 = func.call @cc_cons(%7321, %7322) : (i64, i64) -> i64
      %7324 = func.call @cc_not(%7323) : (i64) -> i64
      %__rlasp_stack_elide_zero_660 = arith.constant 0 : i64
      %7325 = arith.addi %7324, %__rlasp_stack_elide_zero_660 : i64
      %7326 = func.call @cc_nil_value() : () -> i64
      %7327 = func.call @cc_cons(%7325, %7326) : (i64, i64) -> i64
      %7328 = func.call @cc_not(%7327) : (i64) -> i64
      %__rlasp_stack_elide_zero_661 = arith.constant 0 : i64
      %7329 = arith.addi %7328, %__rlasp_stack_elide_zero_661 : i64
      scf.yield %7329 : i64
    }
    func.call @stack_push_pointer(%7232) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511556"() {
    %7788 = func.call @stack_pop_pointer() : () -> i64
    %7789 = func.call @cc_nil_value() : () -> i64
    %7790 = func.call @cc_nil_value() : () -> i64
    %7791 = func.call @cc_errorp(%7789) : (i64) -> i64
    %7792 = arith.cmpi ne, %7791, %7790 : i64
    %7793 = scf.if %7792 -> (i64) {
      scf.yield %7789 : i64
    } else {
      %7794 = func.call @cc_nil_value() : () -> i64
      %7795 = func.call @cc_errorp(%7788) : (i64) -> i64
      %7796 = arith.cmpi ne, %7795, %7794 : i64
      %7797 = arith.cmpi eq, %7794, %7794 : i64
      %7798 = arith.andi %7796, %7797 : i1
      %7799 = scf.if %7798 -> (i64) {
        scf.yield %7788 : i64
      } else {
        scf.yield %7794 : i64
      }
      %7800 = arith.cmpi ne, %7799, %7794 : i64
      scf.if %7800 {
        func.call @stack_push_pointer(%7799) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7788) : (i64) -> ()
        %7801 = llvm.mlir.addressof @str665 : !llvm.ptr
        %7802 = func.call @cc_make_function_ref_const(%7801) : (!llvm.ptr) -> i64
        %7803 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%7802, %7803) : (i64, i64) -> ()
      }
      %7804 = llvm.mlir.addressof @str666 : !llvm.ptr
      %7805 = arith.constant 32 : i64
      %7806 = func.call @cc_make_string(%7804, %7805) : (!llvm.ptr, i64) -> i64
      %7807 = func.call @cc_nil_value() : () -> i64
      %7808 = func.call @cc_intern(%7806, %7807) : (i64, i64) -> i64
      %7809 = func.call @cc_nil_value() : () -> i64
      %7810 = func.call @cc_cons(%7808, %7809) : (i64, i64) -> i64
      %7811 = func.call @cc_values_pack(%7810) : (i64) -> i64
      %__rlasp_stack_elide_zero_662 = arith.constant 0 : i64
      %7812 = arith.addi %7808, %__rlasp_stack_elide_zero_662 : i64
      %7813 = func.call @stack_pop_pointer() : () -> i64
      %7814 = func.call @cc_eq(%7813, %7812) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_663 = arith.constant 0 : i64
      %7815 = arith.addi %7814, %__rlasp_stack_elide_zero_663 : i64
      %7816 = func.call @cc_nil_value() : () -> i64
      %7817 = arith.cmpi ne, %7815, %7816 : i64
      scf.if %7817 {
        %7818 = func.call @cc_nil_value() : () -> i64
        %7819 = func.call @cc_nil_value() : () -> i64
        %7820 = func.call @cc_errorp(%7818) : (i64) -> i64
        %7821 = arith.cmpi ne, %7820, %7819 : i64
        %7822 = scf.if %7821 -> (i64) {
          scf.yield %7818 : i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %7823 = func.call @stack_pop_pointer() : () -> i64
          %7824 = func.call @cc_multiple_value_list(%7823) : (i64) -> i64
          %7825 = func.call @cc_t_value() : () -> i64
          %7826 = llvm.mlir.addressof @str667 : !llvm.ptr
          %7827 = arith.constant 37 : i64
          %7828 = func.call @cc_make_string(%7826, %7827) : (!llvm.ptr, i64) -> i64
          %7829 = func.call @cc_nil_value() : () -> i64
          %7830 = func.call @cc_intern(%7828, %7829) : (i64, i64) -> i64
          %7831 = func.call @cc_nil_value() : () -> i64
          %7832 = func.call @cc_cons(%7830, %7831) : (i64, i64) -> i64
          %7833 = func.call @cc_values_pack(%7832) : (i64) -> i64
          %7834 = func.call @cc_set_symbol_value(%7830, %7825) : (i64, i64) -> i64
          %7835 = llvm.mlir.addressof @str668 : !llvm.ptr
          %7836 = arith.constant 38 : i64
          %7837 = func.call @cc_make_string(%7835, %7836) : (!llvm.ptr, i64) -> i64
          %7838 = func.call @cc_nil_value() : () -> i64
          %7839 = func.call @cc_intern(%7837, %7838) : (i64, i64) -> i64
          %7840 = func.call @cc_nil_value() : () -> i64
          %7841 = func.call @cc_cons(%7839, %7840) : (i64, i64) -> i64
          %7842 = func.call @cc_values_pack(%7841) : (i64) -> i64
          %7843 = func.call @cc_set_symbol_value(%7839, %7823) : (i64, i64) -> i64
          %7844 = llvm.mlir.addressof @str669 : !llvm.ptr
          %7845 = arith.constant 39 : i64
          %7846 = func.call @cc_make_string(%7844, %7845) : (!llvm.ptr, i64) -> i64
          %7847 = func.call @cc_nil_value() : () -> i64
          %7848 = func.call @cc_intern(%7846, %7847) : (i64, i64) -> i64
          %7849 = func.call @cc_nil_value() : () -> i64
          %7850 = func.call @cc_cons(%7848, %7849) : (i64, i64) -> i64
          %7851 = func.call @cc_values_pack(%7850) : (i64) -> i64
          %7852 = func.call @cc_set_symbol_value(%7848, %7824) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_664 = arith.constant 0 : i64
          %7853 = arith.addi %7823, %__rlasp_stack_elide_zero_664 : i64
          scf.yield %7853 : i64
        }
        func.call @stack_push_pointer(%7822) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %7854 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7854 : i64
    }
    func.call @stack_push_pointer(%7793) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511555"() {
    %7775 = func.call @stack_pop_pointer() : () -> i64
    %7776 = func.call @cc_nil_value() : () -> i64
    %7777 = func.call @cc_nil_value() : () -> i64
    %7778 = func.call @cc_errorp(%7776) : (i64) -> i64
    %7779 = arith.cmpi ne, %7778, %7777 : i64
    %7780 = scf.if %7779 -> (i64) {
      scf.yield %7776 : i64
    } else {
      %7781 = func.call @cc_t_value() : () -> i64
      %7782 = func.call @cc_debug_current_stack(%7781) : (i64) -> i64
      %7783 = func.call @cc_nil_value() : () -> i64
      %7784 = func.call @cc_nil_value() : () -> i64
      %7785 = func.call @cc_errorp(%7783) : (i64) -> i64
      %7786 = arith.cmpi ne, %7785, %7784 : i64
      %7787 = scf.if %7786 -> (i64) {
        scf.yield %7783 : i64
      } else {
        %7855 = arith.constant 97047688511556 : i64
        %7856 = arith.constant 0 : i64
        %7857 = func.call @cc_make_closure(%7855, %7856) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_665 = arith.constant 0 : i64
        %7858 = arith.addi %7857, %__rlasp_stack_elide_zero_665 : i64
        %7859 = func.call @cc_nil_value() : () -> i64
        %7860 = func.call @cc_errorp(%7858) : (i64) -> i64
        %7861 = arith.cmpi ne, %7860, %7859 : i64
        %7862 = arith.cmpi eq, %7859, %7859 : i64
        %7863 = arith.andi %7861, %7862 : i1
        %7864 = scf.if %7863 -> (i64) {
          scf.yield %7858 : i64
        } else {
          scf.yield %7859 : i64
        }
        %7865 = func.call @cc_errorp(%7782) : (i64) -> i64
        %7866 = arith.cmpi ne, %7865, %7859 : i64
        %7867 = arith.cmpi eq, %7864, %7859 : i64
        %7868 = arith.andi %7866, %7867 : i1
        %7869 = scf.if %7868 -> (i64) {
          scf.yield %7782 : i64
        } else {
          scf.yield %7864 : i64
        }
        %7870 = arith.cmpi ne, %7869, %7859 : i64
        scf.if %7870 {
          func.call @stack_push_pointer(%7869) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7858) : (i64) -> ()
          func.call @stack_push_pointer(%7782) : (i64) -> ()
          %7871 = llvm.mlir.addressof @str670 : !llvm.ptr
          %7872 = func.call @cc_make_function_ref_const(%7871) : (!llvm.ptr) -> i64
          %7873 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%7872, %7873) : (i64, i64) -> ()
        }
        %7874 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7874 : i64
      }
      %__rlasp_stack_elide_zero_666 = arith.constant 0 : i64
      %7875 = arith.addi %7787, %__rlasp_stack_elide_zero_666 : i64
      scf.yield %7875 : i64
    }
    func.call @stack_push_pointer(%7780) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511554"() {
    %7769 = func.call @stack_pop_pointer() : () -> i64
    %7770 = func.call @cc_nil_value() : () -> i64
    %7771 = func.call @cc_nil_value() : () -> i64
    %7772 = func.call @cc_errorp(%7770) : (i64) -> i64
    %7773 = arith.cmpi ne, %7772, %7771 : i64
    %7774 = scf.if %7773 -> (i64) {
      scf.yield %7770 : i64
    } else {
      func.call @stack_push_pointer(%7769) : (i64) -> ()
      %7876 = arith.constant 97047688511555 : i64
      %7877 = arith.constant 1 : i64
      %7878 = func.call @cc_make_closure(%7876, %7877) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_667 = arith.constant 0 : i64
      %7879 = arith.addi %7878, %__rlasp_stack_elide_zero_667 : i64
      %7880 = func.call @cc_t_value() : () -> i64
      %7881 = func.call @cc_nil_value() : () -> i64
      %7882 = func.call @cc_errorp(%7879) : (i64) -> i64
      %7883 = arith.cmpi ne, %7882, %7881 : i64
      %7884 = arith.cmpi eq, %7881, %7881 : i64
      %7885 = arith.andi %7883, %7884 : i1
      %7886 = scf.if %7885 -> (i64) {
        scf.yield %7879 : i64
      } else {
        scf.yield %7881 : i64
      }
      %7887 = func.call @cc_errorp(%7880) : (i64) -> i64
      %7888 = arith.cmpi ne, %7887, %7881 : i64
      %7889 = arith.cmpi eq, %7886, %7881 : i64
      %7890 = arith.andi %7888, %7889 : i1
      %7891 = scf.if %7890 -> (i64) {
        scf.yield %7880 : i64
      } else {
        scf.yield %7886 : i64
      }
      %7892 = arith.cmpi ne, %7891, %7881 : i64
      scf.if %7892 {
        func.call @stack_push_pointer(%7891) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7879) : (i64) -> ()
        func.call @stack_push_pointer(%7880) : (i64) -> ()
        %7893 = llvm.mlir.addressof @str671 : !llvm.ptr
        %7894 = func.call @cc_make_function_ref_const(%7893) : (!llvm.ptr) -> i64
        %7895 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%7894, %7895) : (i64, i64) -> ()
      }
      %7896 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7896 : i64
    }
    func.call @stack_push_pointer(%7774) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511552"() {
    %7735 = func.call @stack_pop_pointer() : () -> i64
    %7736 = func.call @cc_nil_value() : () -> i64
    %7737 = func.call @cc_nil_value() : () -> i64
    %7738 = func.call @cc_errorp(%7736) : (i64) -> i64
    %7739 = arith.cmpi ne, %7738, %7737 : i64
    %7740 = scf.if %7739 -> (i64) {
      scf.yield %7736 : i64
    } else {
      %7741 = func.call @cc_nil_value() : () -> i64
      %7742 = llvm.mlir.addressof @str662 : !llvm.ptr
      %7743 = arith.constant 37 : i64
      %7744 = func.call @cc_make_string(%7742, %7743) : (!llvm.ptr, i64) -> i64
      %7745 = func.call @cc_nil_value() : () -> i64
      %7746 = func.call @cc_intern(%7744, %7745) : (i64, i64) -> i64
      %7747 = func.call @cc_nil_value() : () -> i64
      %7748 = func.call @cc_cons(%7746, %7747) : (i64, i64) -> i64
      %7749 = func.call @cc_values_pack(%7748) : (i64) -> i64
      %7750 = func.call @cc_set_symbol_value(%7746, %7741) : (i64, i64) -> i64
      %7751 = llvm.mlir.addressof @str663 : !llvm.ptr
      %7752 = arith.constant 38 : i64
      %7753 = func.call @cc_make_string(%7751, %7752) : (!llvm.ptr, i64) -> i64
      %7754 = func.call @cc_nil_value() : () -> i64
      %7755 = func.call @cc_intern(%7753, %7754) : (i64, i64) -> i64
      %7756 = func.call @cc_nil_value() : () -> i64
      %7757 = func.call @cc_cons(%7755, %7756) : (i64, i64) -> i64
      %7758 = func.call @cc_values_pack(%7757) : (i64) -> i64
      %7759 = func.call @cc_set_symbol_value(%7755, %7741) : (i64, i64) -> i64
      %7760 = llvm.mlir.addressof @str664 : !llvm.ptr
      %7761 = arith.constant 39 : i64
      %7762 = func.call @cc_make_string(%7760, %7761) : (!llvm.ptr, i64) -> i64
      %7763 = func.call @cc_nil_value() : () -> i64
      %7764 = func.call @cc_intern(%7762, %7763) : (i64, i64) -> i64
      %7765 = func.call @cc_nil_value() : () -> i64
      %7766 = func.call @cc_cons(%7764, %7765) : (i64, i64) -> i64
      %7767 = func.call @cc_values_pack(%7766) : (i64) -> i64
      %7768 = func.call @cc_set_symbol_value(%7764, %7741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7735) : (i64) -> ()
      %7897 = arith.constant 97047688511554 : i64
      %7898 = arith.constant 1 : i64
      %7899 = func.call @cc_make_closure(%7897, %7898) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_668 = arith.constant 0 : i64
      %7900 = arith.addi %7899, %__rlasp_stack_elide_zero_668 : i64
      %7901 = func.call @cc_nil_value() : () -> i64
      %7902 = func.call @cc_errorp(%7900) : (i64) -> i64
      %7903 = arith.cmpi ne, %7902, %7901 : i64
      %7904 = arith.cmpi eq, %7901, %7901 : i64
      %7905 = arith.andi %7903, %7904 : i1
      %7906 = scf.if %7905 -> (i64) {
        scf.yield %7900 : i64
      } else {
        scf.yield %7901 : i64
      }
      %7907 = arith.cmpi ne, %7906, %7901 : i64
      scf.if %7907 {
        func.call @stack_push_pointer(%7906) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7900) : (i64) -> ()
        %7908 = llvm.mlir.addressof @str672 : !llvm.ptr
        %7909 = func.call @cc_make_function_ref_const(%7908) : (!llvm.ptr) -> i64
        %7910 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%7909, %7910) : (i64, i64) -> ()
      }
      %7911 = func.call @stack_pop_pointer() : () -> i64
      %7912 = func.call @cc_multiple_value_list(%7911) : (i64) -> i64
      %7913 = llvm.mlir.addressof @str673 : !llvm.ptr
      %7914 = arith.constant 37 : i64
      %7915 = func.call @cc_make_string(%7913, %7914) : (!llvm.ptr, i64) -> i64
      %7916 = func.call @cc_nil_value() : () -> i64
      %7917 = func.call @cc_intern(%7915, %7916) : (i64, i64) -> i64
      %7918 = func.call @cc_nil_value() : () -> i64
      %7919 = func.call @cc_cons(%7917, %7918) : (i64, i64) -> i64
      %7920 = func.call @cc_values_pack(%7919) : (i64) -> i64
      %7921 = func.call @cc_symbol_value(%7917) : (i64) -> i64
      %7922 = llvm.mlir.addressof @str674 : !llvm.ptr
      %7923 = arith.constant 38 : i64
      %7924 = func.call @cc_make_string(%7922, %7923) : (!llvm.ptr, i64) -> i64
      %7925 = func.call @cc_nil_value() : () -> i64
      %7926 = func.call @cc_intern(%7924, %7925) : (i64, i64) -> i64
      %7927 = func.call @cc_nil_value() : () -> i64
      %7928 = func.call @cc_cons(%7926, %7927) : (i64, i64) -> i64
      %7929 = func.call @cc_values_pack(%7928) : (i64) -> i64
      %7930 = func.call @cc_symbol_value(%7926) : (i64) -> i64
      %7931 = llvm.mlir.addressof @str675 : !llvm.ptr
      %7932 = arith.constant 39 : i64
      %7933 = func.call @cc_make_string(%7931, %7932) : (!llvm.ptr, i64) -> i64
      %7934 = func.call @cc_nil_value() : () -> i64
      %7935 = func.call @cc_intern(%7933, %7934) : (i64, i64) -> i64
      %7936 = func.call @cc_nil_value() : () -> i64
      %7937 = func.call @cc_cons(%7935, %7936) : (i64, i64) -> i64
      %7938 = func.call @cc_values_pack(%7937) : (i64) -> i64
      %7939 = func.call @cc_symbol_value(%7935) : (i64) -> i64
      %7940 = func.call @cc_nil_value() : () -> i64
      %7941 = arith.cmpi ne, %7921, %7940 : i64
      %7942 = scf.if %7941 -> (i64) {
        scf.yield %7939 : i64
      } else {
        scf.yield %7912 : i64
      }
      %7943 = func.call @cc_values_pack(%7942) : (i64) -> i64
      %__rlasp_stack_elide_zero_669 = arith.constant 0 : i64
      %7944 = arith.addi %7943, %__rlasp_stack_elide_zero_669 : i64
      %7945 = func.call @cc_nil_value() : () -> i64
      %7946 = func.call @cc_cons(%7944, %7945) : (i64, i64) -> i64
      %7947 = func.call @cc_not(%7946) : (i64) -> i64
      %__rlasp_stack_elide_zero_670 = arith.constant 0 : i64
      %7948 = arith.addi %7947, %__rlasp_stack_elide_zero_670 : i64
      %7949 = func.call @cc_nil_value() : () -> i64
      %7950 = func.call @cc_cons(%7948, %7949) : (i64, i64) -> i64
      %7951 = func.call @cc_not(%7950) : (i64) -> i64
      %__rlasp_stack_elide_zero_671 = arith.constant 0 : i64
      %7952 = arith.addi %7951, %__rlasp_stack_elide_zero_671 : i64
      scf.yield %7952 : i64
    }
    func.call @stack_push_pointer(%7740) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511562"() {
    %8415 = func.call @stack_pop_pointer() : () -> i64
    %8416 = func.call @cc_nil_value() : () -> i64
    %8417 = func.call @cc_nil_value() : () -> i64
    %8418 = func.call @cc_errorp(%8416) : (i64) -> i64
    %8419 = arith.cmpi ne, %8418, %8417 : i64
    %8420 = scf.if %8419 -> (i64) {
      scf.yield %8416 : i64
    } else {
      %8421 = func.call @cc_nil_value() : () -> i64
      %8422 = func.call @cc_errorp(%8415) : (i64) -> i64
      %8423 = arith.cmpi ne, %8422, %8421 : i64
      %8424 = arith.cmpi eq, %8421, %8421 : i64
      %8425 = arith.andi %8423, %8424 : i1
      %8426 = scf.if %8425 -> (i64) {
        scf.yield %8415 : i64
      } else {
        scf.yield %8421 : i64
      }
      %8427 = arith.cmpi ne, %8426, %8421 : i64
      scf.if %8427 {
        func.call @stack_push_pointer(%8426) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8415) : (i64) -> ()
        %8428 = llvm.mlir.addressof @str713 : !llvm.ptr
        %8429 = func.call @cc_make_function_ref_const(%8428) : (!llvm.ptr) -> i64
        %8430 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%8429, %8430) : (i64, i64) -> ()
      }
      %8431 = llvm.mlir.addressof @str714 : !llvm.ptr
      %8432 = arith.constant 32 : i64
      %8433 = func.call @cc_make_string(%8431, %8432) : (!llvm.ptr, i64) -> i64
      %8434 = func.call @cc_nil_value() : () -> i64
      %8435 = func.call @cc_intern(%8433, %8434) : (i64, i64) -> i64
      %8436 = func.call @cc_nil_value() : () -> i64
      %8437 = func.call @cc_cons(%8435, %8436) : (i64, i64) -> i64
      %8438 = func.call @cc_values_pack(%8437) : (i64) -> i64
      %__rlasp_stack_elide_zero_672 = arith.constant 0 : i64
      %8439 = arith.addi %8435, %__rlasp_stack_elide_zero_672 : i64
      %8440 = func.call @stack_pop_pointer() : () -> i64
      %8441 = func.call @cc_eq(%8440, %8439) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_673 = arith.constant 0 : i64
      %8442 = arith.addi %8441, %__rlasp_stack_elide_zero_673 : i64
      %8443 = func.call @cc_nil_value() : () -> i64
      %8444 = arith.cmpi ne, %8442, %8443 : i64
      scf.if %8444 {
        %8445 = func.call @cc_nil_value() : () -> i64
        %8446 = func.call @cc_nil_value() : () -> i64
        %8447 = func.call @cc_errorp(%8445) : (i64) -> i64
        %8448 = arith.cmpi ne, %8447, %8446 : i64
        %8449 = scf.if %8448 -> (i64) {
          scf.yield %8445 : i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %8450 = func.call @stack_pop_pointer() : () -> i64
          %8451 = func.call @cc_multiple_value_list(%8450) : (i64) -> i64
          %8452 = func.call @cc_t_value() : () -> i64
          %8453 = llvm.mlir.addressof @str715 : !llvm.ptr
          %8454 = arith.constant 37 : i64
          %8455 = func.call @cc_make_string(%8453, %8454) : (!llvm.ptr, i64) -> i64
          %8456 = func.call @cc_nil_value() : () -> i64
          %8457 = func.call @cc_intern(%8455, %8456) : (i64, i64) -> i64
          %8458 = func.call @cc_nil_value() : () -> i64
          %8459 = func.call @cc_cons(%8457, %8458) : (i64, i64) -> i64
          %8460 = func.call @cc_values_pack(%8459) : (i64) -> i64
          %8461 = func.call @cc_set_symbol_value(%8457, %8452) : (i64, i64) -> i64
          %8462 = llvm.mlir.addressof @str716 : !llvm.ptr
          %8463 = arith.constant 38 : i64
          %8464 = func.call @cc_make_string(%8462, %8463) : (!llvm.ptr, i64) -> i64
          %8465 = func.call @cc_nil_value() : () -> i64
          %8466 = func.call @cc_intern(%8464, %8465) : (i64, i64) -> i64
          %8467 = func.call @cc_nil_value() : () -> i64
          %8468 = func.call @cc_cons(%8466, %8467) : (i64, i64) -> i64
          %8469 = func.call @cc_values_pack(%8468) : (i64) -> i64
          %8470 = func.call @cc_set_symbol_value(%8466, %8450) : (i64, i64) -> i64
          %8471 = llvm.mlir.addressof @str717 : !llvm.ptr
          %8472 = arith.constant 39 : i64
          %8473 = func.call @cc_make_string(%8471, %8472) : (!llvm.ptr, i64) -> i64
          %8474 = func.call @cc_nil_value() : () -> i64
          %8475 = func.call @cc_intern(%8473, %8474) : (i64, i64) -> i64
          %8476 = func.call @cc_nil_value() : () -> i64
          %8477 = func.call @cc_cons(%8475, %8476) : (i64, i64) -> i64
          %8478 = func.call @cc_values_pack(%8477) : (i64) -> i64
          %8479 = func.call @cc_set_symbol_value(%8475, %8451) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_674 = arith.constant 0 : i64
          %8480 = arith.addi %8450, %__rlasp_stack_elide_zero_674 : i64
          scf.yield %8480 : i64
        }
        func.call @stack_push_pointer(%8449) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %8481 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8481 : i64
    }
    func.call @stack_push_pointer(%8420) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511561"() {
    %8402 = func.call @stack_pop_pointer() : () -> i64
    %8403 = func.call @cc_nil_value() : () -> i64
    %8404 = func.call @cc_nil_value() : () -> i64
    %8405 = func.call @cc_errorp(%8403) : (i64) -> i64
    %8406 = arith.cmpi ne, %8405, %8404 : i64
    %8407 = scf.if %8406 -> (i64) {
      scf.yield %8403 : i64
    } else {
      %8408 = func.call @cc_t_value() : () -> i64
      %8409 = func.call @cc_debug_current_stack(%8408) : (i64) -> i64
      %8410 = func.call @cc_nil_value() : () -> i64
      %8411 = func.call @cc_nil_value() : () -> i64
      %8412 = func.call @cc_errorp(%8410) : (i64) -> i64
      %8413 = arith.cmpi ne, %8412, %8411 : i64
      %8414 = scf.if %8413 -> (i64) {
        scf.yield %8410 : i64
      } else {
        %8482 = arith.constant 97047688511562 : i64
        %8483 = arith.constant 0 : i64
        %8484 = func.call @cc_make_closure(%8482, %8483) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_675 = arith.constant 0 : i64
        %8485 = arith.addi %8484, %__rlasp_stack_elide_zero_675 : i64
        %8486 = func.call @cc_nil_value() : () -> i64
        %8487 = func.call @cc_errorp(%8485) : (i64) -> i64
        %8488 = arith.cmpi ne, %8487, %8486 : i64
        %8489 = arith.cmpi eq, %8486, %8486 : i64
        %8490 = arith.andi %8488, %8489 : i1
        %8491 = scf.if %8490 -> (i64) {
          scf.yield %8485 : i64
        } else {
          scf.yield %8486 : i64
        }
        %8492 = func.call @cc_errorp(%8409) : (i64) -> i64
        %8493 = arith.cmpi ne, %8492, %8486 : i64
        %8494 = arith.cmpi eq, %8491, %8486 : i64
        %8495 = arith.andi %8493, %8494 : i1
        %8496 = scf.if %8495 -> (i64) {
          scf.yield %8409 : i64
        } else {
          scf.yield %8491 : i64
        }
        %8497 = arith.cmpi ne, %8496, %8486 : i64
        scf.if %8497 {
          func.call @stack_push_pointer(%8496) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8485) : (i64) -> ()
          func.call @stack_push_pointer(%8409) : (i64) -> ()
          %8498 = llvm.mlir.addressof @str718 : !llvm.ptr
          %8499 = func.call @cc_make_function_ref_const(%8498) : (!llvm.ptr) -> i64
          %8500 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%8499, %8500) : (i64, i64) -> ()
        }
        %8501 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8501 : i64
      }
      %__rlasp_stack_elide_zero_676 = arith.constant 0 : i64
      %8502 = arith.addi %8414, %__rlasp_stack_elide_zero_676 : i64
      scf.yield %8502 : i64
    }
    func.call @stack_push_pointer(%8407) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511560"() {
    %8396 = func.call @stack_pop_pointer() : () -> i64
    %8397 = func.call @cc_nil_value() : () -> i64
    %8398 = func.call @cc_nil_value() : () -> i64
    %8399 = func.call @cc_errorp(%8397) : (i64) -> i64
    %8400 = arith.cmpi ne, %8399, %8398 : i64
    %8401 = scf.if %8400 -> (i64) {
      scf.yield %8397 : i64
    } else {
      func.call @stack_push_pointer(%8396) : (i64) -> ()
      %8503 = arith.constant 97047688511561 : i64
      %8504 = arith.constant 1 : i64
      %8505 = func.call @cc_make_closure(%8503, %8504) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_677 = arith.constant 0 : i64
      %8506 = arith.addi %8505, %__rlasp_stack_elide_zero_677 : i64
      %8507 = func.call @cc_nil_value() : () -> i64
      %8508 = func.call @cc_errorp(%8506) : (i64) -> i64
      %8509 = arith.cmpi ne, %8508, %8507 : i64
      %8510 = arith.cmpi eq, %8507, %8507 : i64
      %8511 = arith.andi %8509, %8510 : i1
      %8512 = scf.if %8511 -> (i64) {
        scf.yield %8506 : i64
      } else {
        scf.yield %8507 : i64
      }
      %8513 = arith.cmpi ne, %8512, %8507 : i64
      scf.if %8513 {
        func.call @stack_push_pointer(%8512) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8506) : (i64) -> ()
        %8514 = llvm.mlir.addressof @str719 : !llvm.ptr
        %8515 = func.call @cc_make_function_ref_const(%8514) : (!llvm.ptr) -> i64
        %8516 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%8515, %8516) : (i64, i64) -> ()
      }
      %8517 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8517 : i64
    }
    func.call @stack_push_pointer(%8401) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511558"() {
    %8362 = func.call @stack_pop_pointer() : () -> i64
    %8363 = func.call @cc_nil_value() : () -> i64
    %8364 = func.call @cc_nil_value() : () -> i64
    %8365 = func.call @cc_errorp(%8363) : (i64) -> i64
    %8366 = arith.cmpi ne, %8365, %8364 : i64
    %8367 = scf.if %8366 -> (i64) {
      scf.yield %8363 : i64
    } else {
      %8368 = func.call @cc_nil_value() : () -> i64
      %8369 = llvm.mlir.addressof @str710 : !llvm.ptr
      %8370 = arith.constant 37 : i64
      %8371 = func.call @cc_make_string(%8369, %8370) : (!llvm.ptr, i64) -> i64
      %8372 = func.call @cc_nil_value() : () -> i64
      %8373 = func.call @cc_intern(%8371, %8372) : (i64, i64) -> i64
      %8374 = func.call @cc_nil_value() : () -> i64
      %8375 = func.call @cc_cons(%8373, %8374) : (i64, i64) -> i64
      %8376 = func.call @cc_values_pack(%8375) : (i64) -> i64
      %8377 = func.call @cc_set_symbol_value(%8373, %8368) : (i64, i64) -> i64
      %8378 = llvm.mlir.addressof @str711 : !llvm.ptr
      %8379 = arith.constant 38 : i64
      %8380 = func.call @cc_make_string(%8378, %8379) : (!llvm.ptr, i64) -> i64
      %8381 = func.call @cc_nil_value() : () -> i64
      %8382 = func.call @cc_intern(%8380, %8381) : (i64, i64) -> i64
      %8383 = func.call @cc_nil_value() : () -> i64
      %8384 = func.call @cc_cons(%8382, %8383) : (i64, i64) -> i64
      %8385 = func.call @cc_values_pack(%8384) : (i64) -> i64
      %8386 = func.call @cc_set_symbol_value(%8382, %8368) : (i64, i64) -> i64
      %8387 = llvm.mlir.addressof @str712 : !llvm.ptr
      %8388 = arith.constant 39 : i64
      %8389 = func.call @cc_make_string(%8387, %8388) : (!llvm.ptr, i64) -> i64
      %8390 = func.call @cc_nil_value() : () -> i64
      %8391 = func.call @cc_intern(%8389, %8390) : (i64, i64) -> i64
      %8392 = func.call @cc_nil_value() : () -> i64
      %8393 = func.call @cc_cons(%8391, %8392) : (i64, i64) -> i64
      %8394 = func.call @cc_values_pack(%8393) : (i64) -> i64
      %8395 = func.call @cc_set_symbol_value(%8391, %8368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8362) : (i64) -> ()
      %8518 = arith.constant 97047688511560 : i64
      %8519 = arith.constant 1 : i64
      %8520 = func.call @cc_make_closure(%8518, %8519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_678 = arith.constant 0 : i64
      %8521 = arith.addi %8520, %__rlasp_stack_elide_zero_678 : i64
      %8522 = func.call @cc_t_value() : () -> i64
      %8523 = func.call @cc_nil_value() : () -> i64
      %8524 = func.call @cc_errorp(%8521) : (i64) -> i64
      %8525 = arith.cmpi ne, %8524, %8523 : i64
      %8526 = arith.cmpi eq, %8523, %8523 : i64
      %8527 = arith.andi %8525, %8526 : i1
      %8528 = scf.if %8527 -> (i64) {
        scf.yield %8521 : i64
      } else {
        scf.yield %8523 : i64
      }
      %8529 = func.call @cc_errorp(%8522) : (i64) -> i64
      %8530 = arith.cmpi ne, %8529, %8523 : i64
      %8531 = arith.cmpi eq, %8528, %8523 : i64
      %8532 = arith.andi %8530, %8531 : i1
      %8533 = scf.if %8532 -> (i64) {
        scf.yield %8522 : i64
      } else {
        scf.yield %8528 : i64
      }
      %8534 = arith.cmpi ne, %8533, %8523 : i64
      scf.if %8534 {
        func.call @stack_push_pointer(%8533) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8521) : (i64) -> ()
        func.call @stack_push_pointer(%8522) : (i64) -> ()
        %8535 = llvm.mlir.addressof @str720 : !llvm.ptr
        %8536 = func.call @cc_make_function_ref_const(%8535) : (!llvm.ptr) -> i64
        %8537 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%8536, %8537) : (i64, i64) -> ()
      }
      %8538 = func.call @stack_pop_pointer() : () -> i64
      %8539 = func.call @cc_multiple_value_list(%8538) : (i64) -> i64
      %8540 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8541 = arith.constant 37 : i64
      %8542 = func.call @cc_make_string(%8540, %8541) : (!llvm.ptr, i64) -> i64
      %8543 = func.call @cc_nil_value() : () -> i64
      %8544 = func.call @cc_intern(%8542, %8543) : (i64, i64) -> i64
      %8545 = func.call @cc_nil_value() : () -> i64
      %8546 = func.call @cc_cons(%8544, %8545) : (i64, i64) -> i64
      %8547 = func.call @cc_values_pack(%8546) : (i64) -> i64
      %8548 = func.call @cc_symbol_value(%8544) : (i64) -> i64
      %8549 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8550 = arith.constant 38 : i64
      %8551 = func.call @cc_make_string(%8549, %8550) : (!llvm.ptr, i64) -> i64
      %8552 = func.call @cc_nil_value() : () -> i64
      %8553 = func.call @cc_intern(%8551, %8552) : (i64, i64) -> i64
      %8554 = func.call @cc_nil_value() : () -> i64
      %8555 = func.call @cc_cons(%8553, %8554) : (i64, i64) -> i64
      %8556 = func.call @cc_values_pack(%8555) : (i64) -> i64
      %8557 = func.call @cc_symbol_value(%8553) : (i64) -> i64
      %8558 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8559 = arith.constant 39 : i64
      %8560 = func.call @cc_make_string(%8558, %8559) : (!llvm.ptr, i64) -> i64
      %8561 = func.call @cc_nil_value() : () -> i64
      %8562 = func.call @cc_intern(%8560, %8561) : (i64, i64) -> i64
      %8563 = func.call @cc_nil_value() : () -> i64
      %8564 = func.call @cc_cons(%8562, %8563) : (i64, i64) -> i64
      %8565 = func.call @cc_values_pack(%8564) : (i64) -> i64
      %8566 = func.call @cc_symbol_value(%8562) : (i64) -> i64
      %8567 = func.call @cc_nil_value() : () -> i64
      %8568 = arith.cmpi ne, %8548, %8567 : i64
      %8569 = scf.if %8568 -> (i64) {
        scf.yield %8566 : i64
      } else {
        scf.yield %8539 : i64
      }
      %8570 = func.call @cc_values_pack(%8569) : (i64) -> i64
      %__rlasp_stack_elide_zero_679 = arith.constant 0 : i64
      %8571 = arith.addi %8570, %__rlasp_stack_elide_zero_679 : i64
      %8572 = func.call @cc_nil_value() : () -> i64
      %8573 = func.call @cc_cons(%8571, %8572) : (i64, i64) -> i64
      %8574 = func.call @cc_not(%8573) : (i64) -> i64
      %__rlasp_stack_elide_zero_680 = arith.constant 0 : i64
      %8575 = arith.addi %8574, %__rlasp_stack_elide_zero_680 : i64
      %8576 = func.call @cc_nil_value() : () -> i64
      %8577 = func.call @cc_cons(%8575, %8576) : (i64, i64) -> i64
      %8578 = func.call @cc_not(%8577) : (i64) -> i64
      %__rlasp_stack_elide_zero_681 = arith.constant 0 : i64
      %8579 = arith.addi %8578, %__rlasp_stack_elide_zero_681 : i64
      scf.yield %8579 : i64
    }
    func.call @stack_push_pointer(%8367) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511568"() {
    %9058 = func.call @stack_pop_pointer() : () -> i64
    %9059 = func.call @cc_nil_value() : () -> i64
    %9060 = func.call @cc_nil_value() : () -> i64
    %9061 = func.call @cc_errorp(%9059) : (i64) -> i64
    %9062 = arith.cmpi ne, %9061, %9060 : i64
    %9063 = scf.if %9062 -> (i64) {
      scf.yield %9059 : i64
    } else {
      %9064 = func.call @cc_nil_value() : () -> i64
      %9065 = func.call @cc_errorp(%9058) : (i64) -> i64
      %9066 = arith.cmpi ne, %9065, %9064 : i64
      %9067 = arith.cmpi eq, %9064, %9064 : i64
      %9068 = arith.andi %9066, %9067 : i1
      %9069 = scf.if %9068 -> (i64) {
        scf.yield %9058 : i64
      } else {
        scf.yield %9064 : i64
      }
      %9070 = arith.cmpi ne, %9069, %9064 : i64
      scf.if %9070 {
        func.call @stack_push_pointer(%9069) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9058) : (i64) -> ()
        %9071 = llvm.mlir.addressof @str763 : !llvm.ptr
        %9072 = func.call @cc_make_function_ref_const(%9071) : (!llvm.ptr) -> i64
        %9073 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9072, %9073) : (i64, i64) -> ()
      }
      %9074 = llvm.mlir.addressof @str764 : !llvm.ptr
      %9075 = arith.constant 32 : i64
      %9076 = func.call @cc_make_string(%9074, %9075) : (!llvm.ptr, i64) -> i64
      %9077 = func.call @cc_nil_value() : () -> i64
      %9078 = func.call @cc_intern(%9076, %9077) : (i64, i64) -> i64
      %9079 = func.call @cc_nil_value() : () -> i64
      %9080 = func.call @cc_cons(%9078, %9079) : (i64, i64) -> i64
      %9081 = func.call @cc_values_pack(%9080) : (i64) -> i64
      %__rlasp_stack_elide_zero_682 = arith.constant 0 : i64
      %9082 = arith.addi %9078, %__rlasp_stack_elide_zero_682 : i64
      %9083 = func.call @stack_pop_pointer() : () -> i64
      %9084 = func.call @cc_eq(%9083, %9082) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_683 = arith.constant 0 : i64
      %9085 = arith.addi %9084, %__rlasp_stack_elide_zero_683 : i64
      %9086 = func.call @cc_nil_value() : () -> i64
      %9087 = arith.cmpi ne, %9085, %9086 : i64
      scf.if %9087 {
        %9088 = func.call @cc_nil_value() : () -> i64
        %9089 = func.call @cc_nil_value() : () -> i64
        %9090 = func.call @cc_errorp(%9088) : (i64) -> i64
        %9091 = arith.cmpi ne, %9090, %9089 : i64
        %9092 = scf.if %9091 -> (i64) {
          scf.yield %9088 : i64
        } else {
          %9093 = func.call @cc_t_value() : () -> i64
          %__rlasp_stack_elide_zero_684 = arith.constant 0 : i64
          %9094 = arith.addi %9093, %__rlasp_stack_elide_zero_684 : i64
          %9095 = func.call @cc_multiple_value_list(%9094) : (i64) -> i64
          %9096 = func.call @cc_t_value() : () -> i64
          %9097 = llvm.mlir.addressof @str765 : !llvm.ptr
          %9098 = arith.constant 37 : i64
          %9099 = func.call @cc_make_string(%9097, %9098) : (!llvm.ptr, i64) -> i64
          %9100 = func.call @cc_nil_value() : () -> i64
          %9101 = func.call @cc_intern(%9099, %9100) : (i64, i64) -> i64
          %9102 = func.call @cc_nil_value() : () -> i64
          %9103 = func.call @cc_cons(%9101, %9102) : (i64, i64) -> i64
          %9104 = func.call @cc_values_pack(%9103) : (i64) -> i64
          %9105 = func.call @cc_set_symbol_value(%9101, %9096) : (i64, i64) -> i64
          %9106 = llvm.mlir.addressof @str766 : !llvm.ptr
          %9107 = arith.constant 38 : i64
          %9108 = func.call @cc_make_string(%9106, %9107) : (!llvm.ptr, i64) -> i64
          %9109 = func.call @cc_nil_value() : () -> i64
          %9110 = func.call @cc_intern(%9108, %9109) : (i64, i64) -> i64
          %9111 = func.call @cc_nil_value() : () -> i64
          %9112 = func.call @cc_cons(%9110, %9111) : (i64, i64) -> i64
          %9113 = func.call @cc_values_pack(%9112) : (i64) -> i64
          %9114 = func.call @cc_set_symbol_value(%9110, %9094) : (i64, i64) -> i64
          %9115 = llvm.mlir.addressof @str767 : !llvm.ptr
          %9116 = arith.constant 39 : i64
          %9117 = func.call @cc_make_string(%9115, %9116) : (!llvm.ptr, i64) -> i64
          %9118 = func.call @cc_nil_value() : () -> i64
          %9119 = func.call @cc_intern(%9117, %9118) : (i64, i64) -> i64
          %9120 = func.call @cc_nil_value() : () -> i64
          %9121 = func.call @cc_cons(%9119, %9120) : (i64, i64) -> i64
          %9122 = func.call @cc_values_pack(%9121) : (i64) -> i64
          %9123 = func.call @cc_set_symbol_value(%9119, %9095) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_685 = arith.constant 0 : i64
          %9124 = arith.addi %9094, %__rlasp_stack_elide_zero_685 : i64
          scf.yield %9124 : i64
        }
        func.call @stack_push_pointer(%9092) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %9125 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9125 : i64
    }
    func.call @stack_push_pointer(%9063) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511567"() {
    %9045 = func.call @stack_pop_pointer() : () -> i64
    %9046 = func.call @cc_nil_value() : () -> i64
    %9047 = func.call @cc_nil_value() : () -> i64
    %9048 = func.call @cc_errorp(%9046) : (i64) -> i64
    %9049 = arith.cmpi ne, %9048, %9047 : i64
    %9050 = scf.if %9049 -> (i64) {
      scf.yield %9046 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %9051 = func.call @stack_pop_pointer() : () -> i64
      %9052 = func.call @cc_debug_current_stack(%9051) : (i64) -> i64
      %9053 = func.call @cc_nil_value() : () -> i64
      %9054 = func.call @cc_nil_value() : () -> i64
      %9055 = func.call @cc_errorp(%9053) : (i64) -> i64
      %9056 = arith.cmpi ne, %9055, %9054 : i64
      %9057 = scf.if %9056 -> (i64) {
        scf.yield %9053 : i64
      } else {
        %9126 = arith.constant 97047688511568 : i64
        %9127 = arith.constant 0 : i64
        %9128 = func.call @cc_make_closure(%9126, %9127) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_686 = arith.constant 0 : i64
        %9129 = arith.addi %9128, %__rlasp_stack_elide_zero_686 : i64
        %9130 = func.call @cc_nil_value() : () -> i64
        %9131 = func.call @cc_errorp(%9129) : (i64) -> i64
        %9132 = arith.cmpi ne, %9131, %9130 : i64
        %9133 = arith.cmpi eq, %9130, %9130 : i64
        %9134 = arith.andi %9132, %9133 : i1
        %9135 = scf.if %9134 -> (i64) {
          scf.yield %9129 : i64
        } else {
          scf.yield %9130 : i64
        }
        %9136 = func.call @cc_errorp(%9052) : (i64) -> i64
        %9137 = arith.cmpi ne, %9136, %9130 : i64
        %9138 = arith.cmpi eq, %9135, %9130 : i64
        %9139 = arith.andi %9137, %9138 : i1
        %9140 = scf.if %9139 -> (i64) {
          scf.yield %9052 : i64
        } else {
          scf.yield %9135 : i64
        }
        %9141 = arith.cmpi ne, %9140, %9130 : i64
        scf.if %9141 {
          func.call @stack_push_pointer(%9140) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%9129) : (i64) -> ()
          func.call @stack_push_pointer(%9052) : (i64) -> ()
          %9142 = llvm.mlir.addressof @str768 : !llvm.ptr
          %9143 = func.call @cc_make_function_ref_const(%9142) : (!llvm.ptr) -> i64
          %9144 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%9143, %9144) : (i64, i64) -> ()
        }
        %9145 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9145 : i64
      }
      %__rlasp_stack_elide_zero_687 = arith.constant 0 : i64
      %9146 = arith.addi %9057, %__rlasp_stack_elide_zero_687 : i64
      scf.yield %9146 : i64
    }
    func.call @stack_push_pointer(%9050) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511566"() {
    %9039 = func.call @stack_pop_pointer() : () -> i64
    %9040 = func.call @cc_nil_value() : () -> i64
    %9041 = func.call @cc_nil_value() : () -> i64
    %9042 = func.call @cc_errorp(%9040) : (i64) -> i64
    %9043 = arith.cmpi ne, %9042, %9041 : i64
    %9044 = scf.if %9043 -> (i64) {
      scf.yield %9040 : i64
    } else {
      func.call @stack_push_pointer(%9039) : (i64) -> ()
      %9147 = arith.constant 97047688511567 : i64
      %9148 = arith.constant 1 : i64
      %9149 = func.call @cc_make_closure(%9147, %9148) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_688 = arith.constant 0 : i64
      %9150 = arith.addi %9149, %__rlasp_stack_elide_zero_688 : i64
      %9151 = func.call @cc_nil_value() : () -> i64
      %9152 = func.call @cc_nil_value() : () -> i64
      %9153 = func.call @cc_errorp(%9150) : (i64) -> i64
      %9154 = arith.cmpi ne, %9153, %9152 : i64
      %9155 = arith.cmpi eq, %9152, %9152 : i64
      %9156 = arith.andi %9154, %9155 : i1
      %9157 = scf.if %9156 -> (i64) {
        scf.yield %9150 : i64
      } else {
        scf.yield %9152 : i64
      }
      %9158 = func.call @cc_errorp(%9151) : (i64) -> i64
      %9159 = arith.cmpi ne, %9158, %9152 : i64
      %9160 = arith.cmpi eq, %9157, %9152 : i64
      %9161 = arith.andi %9159, %9160 : i1
      %9162 = scf.if %9161 -> (i64) {
        scf.yield %9151 : i64
      } else {
        scf.yield %9157 : i64
      }
      %9163 = arith.cmpi ne, %9162, %9152 : i64
      scf.if %9163 {
        func.call @stack_push_pointer(%9162) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9150) : (i64) -> ()
        func.call @stack_push_pointer(%9151) : (i64) -> ()
        %9164 = llvm.mlir.addressof @str769 : !llvm.ptr
        %9165 = func.call @cc_make_function_ref_const(%9164) : (!llvm.ptr) -> i64
        %9166 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%9165, %9166) : (i64, i64) -> ()
      }
      %9167 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9167 : i64
    }
    func.call @stack_push_pointer(%9044) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511564"() {
    %9005 = func.call @stack_pop_pointer() : () -> i64
    %9006 = func.call @cc_nil_value() : () -> i64
    %9007 = func.call @cc_nil_value() : () -> i64
    %9008 = func.call @cc_errorp(%9006) : (i64) -> i64
    %9009 = arith.cmpi ne, %9008, %9007 : i64
    %9010 = scf.if %9009 -> (i64) {
      scf.yield %9006 : i64
    } else {
      %9011 = func.call @cc_nil_value() : () -> i64
      %9012 = llvm.mlir.addressof @str760 : !llvm.ptr
      %9013 = arith.constant 37 : i64
      %9014 = func.call @cc_make_string(%9012, %9013) : (!llvm.ptr, i64) -> i64
      %9015 = func.call @cc_nil_value() : () -> i64
      %9016 = func.call @cc_intern(%9014, %9015) : (i64, i64) -> i64
      %9017 = func.call @cc_nil_value() : () -> i64
      %9018 = func.call @cc_cons(%9016, %9017) : (i64, i64) -> i64
      %9019 = func.call @cc_values_pack(%9018) : (i64) -> i64
      %9020 = func.call @cc_set_symbol_value(%9016, %9011) : (i64, i64) -> i64
      %9021 = llvm.mlir.addressof @str761 : !llvm.ptr
      %9022 = arith.constant 38 : i64
      %9023 = func.call @cc_make_string(%9021, %9022) : (!llvm.ptr, i64) -> i64
      %9024 = func.call @cc_nil_value() : () -> i64
      %9025 = func.call @cc_intern(%9023, %9024) : (i64, i64) -> i64
      %9026 = func.call @cc_nil_value() : () -> i64
      %9027 = func.call @cc_cons(%9025, %9026) : (i64, i64) -> i64
      %9028 = func.call @cc_values_pack(%9027) : (i64) -> i64
      %9029 = func.call @cc_set_symbol_value(%9025, %9011) : (i64, i64) -> i64
      %9030 = llvm.mlir.addressof @str762 : !llvm.ptr
      %9031 = arith.constant 39 : i64
      %9032 = func.call @cc_make_string(%9030, %9031) : (!llvm.ptr, i64) -> i64
      %9033 = func.call @cc_nil_value() : () -> i64
      %9034 = func.call @cc_intern(%9032, %9033) : (i64, i64) -> i64
      %9035 = func.call @cc_nil_value() : () -> i64
      %9036 = func.call @cc_cons(%9034, %9035) : (i64, i64) -> i64
      %9037 = func.call @cc_values_pack(%9036) : (i64) -> i64
      %9038 = func.call @cc_set_symbol_value(%9034, %9011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9005) : (i64) -> ()
      %9168 = arith.constant 97047688511566 : i64
      %9169 = arith.constant 1 : i64
      %9170 = func.call @cc_make_closure(%9168, %9169) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_689 = arith.constant 0 : i64
      %9171 = arith.addi %9170, %__rlasp_stack_elide_zero_689 : i64
      %9172 = func.call @cc_nil_value() : () -> i64
      %9173 = func.call @cc_errorp(%9171) : (i64) -> i64
      %9174 = arith.cmpi ne, %9173, %9172 : i64
      %9175 = arith.cmpi eq, %9172, %9172 : i64
      %9176 = arith.andi %9174, %9175 : i1
      %9177 = scf.if %9176 -> (i64) {
        scf.yield %9171 : i64
      } else {
        scf.yield %9172 : i64
      }
      %9178 = arith.cmpi ne, %9177, %9172 : i64
      scf.if %9178 {
        func.call @stack_push_pointer(%9177) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9171) : (i64) -> ()
        %9179 = llvm.mlir.addressof @str770 : !llvm.ptr
        %9180 = func.call @cc_make_function_ref_const(%9179) : (!llvm.ptr) -> i64
        %9181 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9180, %9181) : (i64, i64) -> ()
      }
      %9182 = func.call @stack_pop_pointer() : () -> i64
      %9183 = func.call @cc_multiple_value_list(%9182) : (i64) -> i64
      %9184 = llvm.mlir.addressof @str771 : !llvm.ptr
      %9185 = arith.constant 37 : i64
      %9186 = func.call @cc_make_string(%9184, %9185) : (!llvm.ptr, i64) -> i64
      %9187 = func.call @cc_nil_value() : () -> i64
      %9188 = func.call @cc_intern(%9186, %9187) : (i64, i64) -> i64
      %9189 = func.call @cc_nil_value() : () -> i64
      %9190 = func.call @cc_cons(%9188, %9189) : (i64, i64) -> i64
      %9191 = func.call @cc_values_pack(%9190) : (i64) -> i64
      %9192 = func.call @cc_symbol_value(%9188) : (i64) -> i64
      %9193 = llvm.mlir.addressof @str772 : !llvm.ptr
      %9194 = arith.constant 38 : i64
      %9195 = func.call @cc_make_string(%9193, %9194) : (!llvm.ptr, i64) -> i64
      %9196 = func.call @cc_nil_value() : () -> i64
      %9197 = func.call @cc_intern(%9195, %9196) : (i64, i64) -> i64
      %9198 = func.call @cc_nil_value() : () -> i64
      %9199 = func.call @cc_cons(%9197, %9198) : (i64, i64) -> i64
      %9200 = func.call @cc_values_pack(%9199) : (i64) -> i64
      %9201 = func.call @cc_symbol_value(%9197) : (i64) -> i64
      %9202 = llvm.mlir.addressof @str773 : !llvm.ptr
      %9203 = arith.constant 39 : i64
      %9204 = func.call @cc_make_string(%9202, %9203) : (!llvm.ptr, i64) -> i64
      %9205 = func.call @cc_nil_value() : () -> i64
      %9206 = func.call @cc_intern(%9204, %9205) : (i64, i64) -> i64
      %9207 = func.call @cc_nil_value() : () -> i64
      %9208 = func.call @cc_cons(%9206, %9207) : (i64, i64) -> i64
      %9209 = func.call @cc_values_pack(%9208) : (i64) -> i64
      %9210 = func.call @cc_symbol_value(%9206) : (i64) -> i64
      %9211 = func.call @cc_nil_value() : () -> i64
      %9212 = arith.cmpi ne, %9192, %9211 : i64
      %9213 = scf.if %9212 -> (i64) {
        scf.yield %9210 : i64
      } else {
        scf.yield %9183 : i64
      }
      %9214 = func.call @cc_values_pack(%9213) : (i64) -> i64
      %__rlasp_stack_elide_zero_690 = arith.constant 0 : i64
      %9215 = arith.addi %9214, %__rlasp_stack_elide_zero_690 : i64
      %9216 = func.call @cc_nil_value() : () -> i64
      %9217 = func.call @cc_cons(%9215, %9216) : (i64, i64) -> i64
      %9218 = func.call @cc_not(%9217) : (i64) -> i64
      %__rlasp_stack_elide_zero_691 = arith.constant 0 : i64
      %9219 = arith.addi %9218, %__rlasp_stack_elide_zero_691 : i64
      %9220 = func.call @cc_nil_value() : () -> i64
      %9221 = func.call @cc_cons(%9219, %9220) : (i64, i64) -> i64
      %9222 = func.call @cc_not(%9221) : (i64) -> i64
      %__rlasp_stack_elide_zero_692 = arith.constant 0 : i64
      %9223 = arith.addi %9222, %__rlasp_stack_elide_zero_692 : i64
      scf.yield %9223 : i64
    }
    func.call @stack_push_pointer(%9010) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511574"() {
    %9702 = func.call @stack_pop_pointer() : () -> i64
    %9703 = func.call @cc_nil_value() : () -> i64
    %9704 = func.call @cc_nil_value() : () -> i64
    %9705 = func.call @cc_errorp(%9703) : (i64) -> i64
    %9706 = arith.cmpi ne, %9705, %9704 : i64
    %9707 = scf.if %9706 -> (i64) {
      scf.yield %9703 : i64
    } else {
      %9708 = func.call @cc_nil_value() : () -> i64
      %9709 = func.call @cc_errorp(%9702) : (i64) -> i64
      %9710 = arith.cmpi ne, %9709, %9708 : i64
      %9711 = arith.cmpi eq, %9708, %9708 : i64
      %9712 = arith.andi %9710, %9711 : i1
      %9713 = scf.if %9712 -> (i64) {
        scf.yield %9702 : i64
      } else {
        scf.yield %9708 : i64
      }
      %9714 = arith.cmpi ne, %9713, %9708 : i64
      scf.if %9714 {
        func.call @stack_push_pointer(%9713) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9702) : (i64) -> ()
        %9715 = llvm.mlir.addressof @str813 : !llvm.ptr
        %9716 = func.call @cc_make_function_ref_const(%9715) : (!llvm.ptr) -> i64
        %9717 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9716, %9717) : (i64, i64) -> ()
      }
      %9718 = llvm.mlir.addressof @str814 : !llvm.ptr
      %9719 = arith.constant 32 : i64
      %9720 = func.call @cc_make_string(%9718, %9719) : (!llvm.ptr, i64) -> i64
      %9721 = func.call @cc_nil_value() : () -> i64
      %9722 = func.call @cc_intern(%9720, %9721) : (i64, i64) -> i64
      %9723 = func.call @cc_nil_value() : () -> i64
      %9724 = func.call @cc_cons(%9722, %9723) : (i64, i64) -> i64
      %9725 = func.call @cc_values_pack(%9724) : (i64) -> i64
      %__rlasp_stack_elide_zero_693 = arith.constant 0 : i64
      %9726 = arith.addi %9722, %__rlasp_stack_elide_zero_693 : i64
      %9727 = func.call @stack_pop_pointer() : () -> i64
      %9728 = func.call @cc_eq(%9727, %9726) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_694 = arith.constant 0 : i64
      %9729 = arith.addi %9728, %__rlasp_stack_elide_zero_694 : i64
      %9730 = func.call @cc_nil_value() : () -> i64
      %9731 = arith.cmpi ne, %9729, %9730 : i64
      scf.if %9731 {
        %9732 = func.call @cc_nil_value() : () -> i64
        %9733 = func.call @cc_nil_value() : () -> i64
        %9734 = func.call @cc_errorp(%9732) : (i64) -> i64
        %9735 = arith.cmpi ne, %9734, %9733 : i64
        %9736 = scf.if %9735 -> (i64) {
          scf.yield %9732 : i64
        } else {
          %9737 = func.call @cc_t_value() : () -> i64
          %__rlasp_stack_elide_zero_695 = arith.constant 0 : i64
          %9738 = arith.addi %9737, %__rlasp_stack_elide_zero_695 : i64
          %9739 = func.call @cc_multiple_value_list(%9738) : (i64) -> i64
          %9740 = func.call @cc_t_value() : () -> i64
          %9741 = llvm.mlir.addressof @str815 : !llvm.ptr
          %9742 = arith.constant 37 : i64
          %9743 = func.call @cc_make_string(%9741, %9742) : (!llvm.ptr, i64) -> i64
          %9744 = func.call @cc_nil_value() : () -> i64
          %9745 = func.call @cc_intern(%9743, %9744) : (i64, i64) -> i64
          %9746 = func.call @cc_nil_value() : () -> i64
          %9747 = func.call @cc_cons(%9745, %9746) : (i64, i64) -> i64
          %9748 = func.call @cc_values_pack(%9747) : (i64) -> i64
          %9749 = func.call @cc_set_symbol_value(%9745, %9740) : (i64, i64) -> i64
          %9750 = llvm.mlir.addressof @str816 : !llvm.ptr
          %9751 = arith.constant 38 : i64
          %9752 = func.call @cc_make_string(%9750, %9751) : (!llvm.ptr, i64) -> i64
          %9753 = func.call @cc_nil_value() : () -> i64
          %9754 = func.call @cc_intern(%9752, %9753) : (i64, i64) -> i64
          %9755 = func.call @cc_nil_value() : () -> i64
          %9756 = func.call @cc_cons(%9754, %9755) : (i64, i64) -> i64
          %9757 = func.call @cc_values_pack(%9756) : (i64) -> i64
          %9758 = func.call @cc_set_symbol_value(%9754, %9738) : (i64, i64) -> i64
          %9759 = llvm.mlir.addressof @str817 : !llvm.ptr
          %9760 = arith.constant 39 : i64
          %9761 = func.call @cc_make_string(%9759, %9760) : (!llvm.ptr, i64) -> i64
          %9762 = func.call @cc_nil_value() : () -> i64
          %9763 = func.call @cc_intern(%9761, %9762) : (i64, i64) -> i64
          %9764 = func.call @cc_nil_value() : () -> i64
          %9765 = func.call @cc_cons(%9763, %9764) : (i64, i64) -> i64
          %9766 = func.call @cc_values_pack(%9765) : (i64) -> i64
          %9767 = func.call @cc_set_symbol_value(%9763, %9739) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_696 = arith.constant 0 : i64
          %9768 = arith.addi %9738, %__rlasp_stack_elide_zero_696 : i64
          scf.yield %9768 : i64
        }
        func.call @stack_push_pointer(%9736) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %9769 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9769 : i64
    }
    func.call @stack_push_pointer(%9707) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511573"() {
    %9689 = func.call @stack_pop_pointer() : () -> i64
    %9690 = func.call @cc_nil_value() : () -> i64
    %9691 = func.call @cc_nil_value() : () -> i64
    %9692 = func.call @cc_errorp(%9690) : (i64) -> i64
    %9693 = arith.cmpi ne, %9692, %9691 : i64
    %9694 = scf.if %9693 -> (i64) {
      scf.yield %9690 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %9695 = func.call @stack_pop_pointer() : () -> i64
      %9696 = func.call @cc_debug_current_stack(%9695) : (i64) -> i64
      %9697 = func.call @cc_nil_value() : () -> i64
      %9698 = func.call @cc_nil_value() : () -> i64
      %9699 = func.call @cc_errorp(%9697) : (i64) -> i64
      %9700 = arith.cmpi ne, %9699, %9698 : i64
      %9701 = scf.if %9700 -> (i64) {
        scf.yield %9697 : i64
      } else {
        %9770 = arith.constant 97047688511574 : i64
        %9771 = arith.constant 0 : i64
        %9772 = func.call @cc_make_closure(%9770, %9771) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_697 = arith.constant 0 : i64
        %9773 = arith.addi %9772, %__rlasp_stack_elide_zero_697 : i64
        %9774 = func.call @cc_nil_value() : () -> i64
        %9775 = func.call @cc_errorp(%9773) : (i64) -> i64
        %9776 = arith.cmpi ne, %9775, %9774 : i64
        %9777 = arith.cmpi eq, %9774, %9774 : i64
        %9778 = arith.andi %9776, %9777 : i1
        %9779 = scf.if %9778 -> (i64) {
          scf.yield %9773 : i64
        } else {
          scf.yield %9774 : i64
        }
        %9780 = func.call @cc_errorp(%9696) : (i64) -> i64
        %9781 = arith.cmpi ne, %9780, %9774 : i64
        %9782 = arith.cmpi eq, %9779, %9774 : i64
        %9783 = arith.andi %9781, %9782 : i1
        %9784 = scf.if %9783 -> (i64) {
          scf.yield %9696 : i64
        } else {
          scf.yield %9779 : i64
        }
        %9785 = arith.cmpi ne, %9784, %9774 : i64
        scf.if %9785 {
          func.call @stack_push_pointer(%9784) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%9773) : (i64) -> ()
          func.call @stack_push_pointer(%9696) : (i64) -> ()
          %9786 = llvm.mlir.addressof @str818 : !llvm.ptr
          %9787 = func.call @cc_make_function_ref_const(%9786) : (!llvm.ptr) -> i64
          %9788 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%9787, %9788) : (i64, i64) -> ()
        }
        %9789 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9789 : i64
      }
      %__rlasp_stack_elide_zero_698 = arith.constant 0 : i64
      %9790 = arith.addi %9701, %__rlasp_stack_elide_zero_698 : i64
      scf.yield %9790 : i64
    }
    func.call @stack_push_pointer(%9694) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511572"() {
    %9683 = func.call @stack_pop_pointer() : () -> i64
    %9684 = func.call @cc_nil_value() : () -> i64
    %9685 = func.call @cc_nil_value() : () -> i64
    %9686 = func.call @cc_errorp(%9684) : (i64) -> i64
    %9687 = arith.cmpi ne, %9686, %9685 : i64
    %9688 = scf.if %9687 -> (i64) {
      scf.yield %9684 : i64
    } else {
      func.call @stack_push_pointer(%9683) : (i64) -> ()
      %9791 = arith.constant 97047688511573 : i64
      %9792 = arith.constant 1 : i64
      %9793 = func.call @cc_make_closure(%9791, %9792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_699 = arith.constant 0 : i64
      %9794 = arith.addi %9793, %__rlasp_stack_elide_zero_699 : i64
      %9795 = func.call @cc_nil_value() : () -> i64
      %9796 = func.call @cc_errorp(%9794) : (i64) -> i64
      %9797 = arith.cmpi ne, %9796, %9795 : i64
      %9798 = arith.cmpi eq, %9795, %9795 : i64
      %9799 = arith.andi %9797, %9798 : i1
      %9800 = scf.if %9799 -> (i64) {
        scf.yield %9794 : i64
      } else {
        scf.yield %9795 : i64
      }
      %9801 = arith.cmpi ne, %9800, %9795 : i64
      scf.if %9801 {
        func.call @stack_push_pointer(%9800) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9794) : (i64) -> ()
        %9802 = llvm.mlir.addressof @str819 : !llvm.ptr
        %9803 = func.call @cc_make_function_ref_const(%9802) : (!llvm.ptr) -> i64
        %9804 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9803, %9804) : (i64, i64) -> ()
      }
      %9805 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9805 : i64
    }
    func.call @stack_push_pointer(%9688) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511570"() {
    %9649 = func.call @stack_pop_pointer() : () -> i64
    %9650 = func.call @cc_nil_value() : () -> i64
    %9651 = func.call @cc_nil_value() : () -> i64
    %9652 = func.call @cc_errorp(%9650) : (i64) -> i64
    %9653 = arith.cmpi ne, %9652, %9651 : i64
    %9654 = scf.if %9653 -> (i64) {
      scf.yield %9650 : i64
    } else {
      %9655 = func.call @cc_nil_value() : () -> i64
      %9656 = llvm.mlir.addressof @str810 : !llvm.ptr
      %9657 = arith.constant 37 : i64
      %9658 = func.call @cc_make_string(%9656, %9657) : (!llvm.ptr, i64) -> i64
      %9659 = func.call @cc_nil_value() : () -> i64
      %9660 = func.call @cc_intern(%9658, %9659) : (i64, i64) -> i64
      %9661 = func.call @cc_nil_value() : () -> i64
      %9662 = func.call @cc_cons(%9660, %9661) : (i64, i64) -> i64
      %9663 = func.call @cc_values_pack(%9662) : (i64) -> i64
      %9664 = func.call @cc_set_symbol_value(%9660, %9655) : (i64, i64) -> i64
      %9665 = llvm.mlir.addressof @str811 : !llvm.ptr
      %9666 = arith.constant 38 : i64
      %9667 = func.call @cc_make_string(%9665, %9666) : (!llvm.ptr, i64) -> i64
      %9668 = func.call @cc_nil_value() : () -> i64
      %9669 = func.call @cc_intern(%9667, %9668) : (i64, i64) -> i64
      %9670 = func.call @cc_nil_value() : () -> i64
      %9671 = func.call @cc_cons(%9669, %9670) : (i64, i64) -> i64
      %9672 = func.call @cc_values_pack(%9671) : (i64) -> i64
      %9673 = func.call @cc_set_symbol_value(%9669, %9655) : (i64, i64) -> i64
      %9674 = llvm.mlir.addressof @str812 : !llvm.ptr
      %9675 = arith.constant 39 : i64
      %9676 = func.call @cc_make_string(%9674, %9675) : (!llvm.ptr, i64) -> i64
      %9677 = func.call @cc_nil_value() : () -> i64
      %9678 = func.call @cc_intern(%9676, %9677) : (i64, i64) -> i64
      %9679 = func.call @cc_nil_value() : () -> i64
      %9680 = func.call @cc_cons(%9678, %9679) : (i64, i64) -> i64
      %9681 = func.call @cc_values_pack(%9680) : (i64) -> i64
      %9682 = func.call @cc_set_symbol_value(%9678, %9655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9649) : (i64) -> ()
      %9806 = arith.constant 97047688511572 : i64
      %9807 = arith.constant 1 : i64
      %9808 = func.call @cc_make_closure(%9806, %9807) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_700 = arith.constant 0 : i64
      %9809 = arith.addi %9808, %__rlasp_stack_elide_zero_700 : i64
      %9810 = func.call @cc_nil_value() : () -> i64
      %9811 = func.call @cc_nil_value() : () -> i64
      %9812 = func.call @cc_errorp(%9809) : (i64) -> i64
      %9813 = arith.cmpi ne, %9812, %9811 : i64
      %9814 = arith.cmpi eq, %9811, %9811 : i64
      %9815 = arith.andi %9813, %9814 : i1
      %9816 = scf.if %9815 -> (i64) {
        scf.yield %9809 : i64
      } else {
        scf.yield %9811 : i64
      }
      %9817 = func.call @cc_errorp(%9810) : (i64) -> i64
      %9818 = arith.cmpi ne, %9817, %9811 : i64
      %9819 = arith.cmpi eq, %9816, %9811 : i64
      %9820 = arith.andi %9818, %9819 : i1
      %9821 = scf.if %9820 -> (i64) {
        scf.yield %9810 : i64
      } else {
        scf.yield %9816 : i64
      }
      %9822 = arith.cmpi ne, %9821, %9811 : i64
      scf.if %9822 {
        func.call @stack_push_pointer(%9821) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9809) : (i64) -> ()
        func.call @stack_push_pointer(%9810) : (i64) -> ()
        %9823 = llvm.mlir.addressof @str820 : !llvm.ptr
        %9824 = func.call @cc_make_function_ref_const(%9823) : (!llvm.ptr) -> i64
        %9825 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%9824, %9825) : (i64, i64) -> ()
      }
      %9826 = func.call @stack_pop_pointer() : () -> i64
      %9827 = func.call @cc_multiple_value_list(%9826) : (i64) -> i64
      %9828 = llvm.mlir.addressof @str821 : !llvm.ptr
      %9829 = arith.constant 37 : i64
      %9830 = func.call @cc_make_string(%9828, %9829) : (!llvm.ptr, i64) -> i64
      %9831 = func.call @cc_nil_value() : () -> i64
      %9832 = func.call @cc_intern(%9830, %9831) : (i64, i64) -> i64
      %9833 = func.call @cc_nil_value() : () -> i64
      %9834 = func.call @cc_cons(%9832, %9833) : (i64, i64) -> i64
      %9835 = func.call @cc_values_pack(%9834) : (i64) -> i64
      %9836 = func.call @cc_symbol_value(%9832) : (i64) -> i64
      %9837 = llvm.mlir.addressof @str822 : !llvm.ptr
      %9838 = arith.constant 38 : i64
      %9839 = func.call @cc_make_string(%9837, %9838) : (!llvm.ptr, i64) -> i64
      %9840 = func.call @cc_nil_value() : () -> i64
      %9841 = func.call @cc_intern(%9839, %9840) : (i64, i64) -> i64
      %9842 = func.call @cc_nil_value() : () -> i64
      %9843 = func.call @cc_cons(%9841, %9842) : (i64, i64) -> i64
      %9844 = func.call @cc_values_pack(%9843) : (i64) -> i64
      %9845 = func.call @cc_symbol_value(%9841) : (i64) -> i64
      %9846 = llvm.mlir.addressof @str823 : !llvm.ptr
      %9847 = arith.constant 39 : i64
      %9848 = func.call @cc_make_string(%9846, %9847) : (!llvm.ptr, i64) -> i64
      %9849 = func.call @cc_nil_value() : () -> i64
      %9850 = func.call @cc_intern(%9848, %9849) : (i64, i64) -> i64
      %9851 = func.call @cc_nil_value() : () -> i64
      %9852 = func.call @cc_cons(%9850, %9851) : (i64, i64) -> i64
      %9853 = func.call @cc_values_pack(%9852) : (i64) -> i64
      %9854 = func.call @cc_symbol_value(%9850) : (i64) -> i64
      %9855 = func.call @cc_nil_value() : () -> i64
      %9856 = arith.cmpi ne, %9836, %9855 : i64
      %9857 = scf.if %9856 -> (i64) {
        scf.yield %9854 : i64
      } else {
        scf.yield %9827 : i64
      }
      %9858 = func.call @cc_values_pack(%9857) : (i64) -> i64
      %__rlasp_stack_elide_zero_701 = arith.constant 0 : i64
      %9859 = arith.addi %9858, %__rlasp_stack_elide_zero_701 : i64
      %9860 = func.call @cc_nil_value() : () -> i64
      %9861 = func.call @cc_cons(%9859, %9860) : (i64, i64) -> i64
      %9862 = func.call @cc_not(%9861) : (i64) -> i64
      %__rlasp_stack_elide_zero_702 = arith.constant 0 : i64
      %9863 = arith.addi %9862, %__rlasp_stack_elide_zero_702 : i64
      %9864 = func.call @cc_nil_value() : () -> i64
      %9865 = func.call @cc_cons(%9863, %9864) : (i64, i64) -> i64
      %9866 = func.call @cc_not(%9865) : (i64) -> i64
      %__rlasp_stack_elide_zero_703 = arith.constant 0 : i64
      %9867 = arith.addi %9866, %__rlasp_stack_elide_zero_703 : i64
      scf.yield %9867 : i64
    }
    func.call @stack_push_pointer(%9654) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511577"() {
    %10165 = func.call @stack_pop_pointer() : () -> i64
    %10166 = func.call @cc_nil_value() : () -> i64
    %10167 = func.call @cc_nil_value() : () -> i64
    %10168 = func.call @cc_errorp(%10166) : (i64) -> i64
    %10169 = arith.cmpi ne, %10168, %10167 : i64
    %10170 = scf.if %10169 -> (i64) {
      scf.yield %10166 : i64
    } else {
      %10171 = func.call @cc_nil_value() : () -> i64
      %10172 = arith.cmpi ne, %10171, %10171 : i64
      scf.if %10172 {
        func.call @stack_push_pointer(%10171) : (i64) -> ()
      } else {
        %10173 = llvm.mlir.addressof @str854 : !llvm.ptr
        %10174 = func.call @cc_make_function_ref_const(%10173) : (!llvm.ptr) -> i64
        %10175 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%10174, %10175) : (i64, i64) -> ()
      }
      %10176 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10176 : i64
    }
    %10177 = func.call @cc_nil_value() : () -> i64
    %10178 = func.call @cc_errorp(%10170) : (i64) -> i64
    %10179 = arith.cmpi ne, %10178, %10177 : i64
    %10180 = scf.if %10179 -> (i64) {
      scf.yield %10170 : i64
    } else {
      %__rlasp_stack_elide_zero_704 = arith.constant 0 : i64
      %10181 = arith.addi %10165, %__rlasp_stack_elide_zero_704 : i64
      %10182 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%10181, %10182) : (i64, i64) -> ()
      %10183 = func.call @stack_pop_pointer() : () -> i64
      %10184 = func.call @cc_multiple_value_list(%10183) : (i64) -> i64
      %10185 = func.call @cc_nil_value() : () -> i64
      %10186 = arith.cmpi ne, %10185, %10185 : i64
      scf.if %10186 {
        func.call @stack_push_pointer(%10185) : (i64) -> ()
      } else {
        %10187 = llvm.mlir.addressof @str855 : !llvm.ptr
        %10188 = func.call @cc_make_function_ref_const(%10187) : (!llvm.ptr) -> i64
        %10189 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%10188, %10189) : (i64, i64) -> ()
      }
      %10190 = func.call @stack_depth() : () -> i64
      %10191 = arith.constant 0 : i64
      %10192 = arith.cmpi sgt, %10190, %10191 : i64
      scf.if %10192 {
        %10193 = func.call @stack_pop_pointer() : () -> i64
      }
      %10194 = func.call @cc_values_pack(%10184) : (i64) -> i64
      %__rlasp_stack_elide_zero_705 = arith.constant 0 : i64
      %10195 = arith.addi %10194, %__rlasp_stack_elide_zero_705 : i64
      scf.yield %10195 : i64
    }
    func.call @stack_push_pointer(%10180) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511576"() {
    %10160 = func.call @cc_nil_value() : () -> i64
    %10161 = func.call @cc_nil_value() : () -> i64
    %10162 = func.call @cc_errorp(%10160) : (i64) -> i64
    %10163 = arith.cmpi ne, %10162, %10161 : i64
    %10164 = scf.if %10163 -> (i64) {
      scf.yield %10160 : i64
    } else {
      func.call @cc_clear_multiple_values() : () -> ()
      %10196 = arith.constant 97047688511577 : i64
      %10197 = arith.constant 0 : i64
      %10198 = func.call @cc_make_closure(%10196, %10197) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_706 = arith.constant 0 : i64
      %10199 = arith.addi %10198, %__rlasp_stack_elide_zero_706 : i64
      %10200 = func.call @cc_nil_value() : () -> i64
      %10201 = func.call @cc_cons(%10200, %10200) : (i64, i64) -> i64
      %10202 = func.call @cc_cons(%10200, %10201) : (i64, i64) -> i64
      %10203 = func.call @cc_cons(%10199, %10202) : (i64, i64) -> i64
      %10204 = func.call @cc_values_pack(%10203) : (i64) -> i64
      %__rlasp_stack_elide_zero_707 = arith.constant 0 : i64
      %10205 = arith.addi %10204, %__rlasp_stack_elide_zero_707 : i64
      %10206 = func.call @cc_errorp(%10205) : (i64) -> i64
      %10207 = func.call @cc_nil_value() : () -> i64
      %10208 = arith.cmpi ne, %10206, %10207 : i64
      scf.if %10208 {
        func.call @stack_push_pointer(%10205) : (i64) -> ()
      } else {
        %10209 = func.call @cc_multiple_value_list(%10205) : (i64) -> i64
        func.call @stack_push_pointer(%10209) : (i64) -> ()
      }
      %10210 = func.call @stack_pop_pointer() : () -> i64
      %10211 = func.call @cc_cdr(%10210) : (i64) -> i64
      %__rlasp_stack_elide_zero_708 = arith.constant 0 : i64
      %10212 = arith.addi %10211, %__rlasp_stack_elide_zero_708 : i64
      %10213 = func.call @cc_values_pack(%10212) : (i64) -> i64
      %__rlasp_stack_elide_zero_709 = arith.constant 0 : i64
      %10214 = arith.addi %10213, %__rlasp_stack_elide_zero_709 : i64
      scf.yield %10214 : i64
    }
    func.call @stack_push_pointer(%10164) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511580"() {
    %10618 = func.call @stack_pop_pointer() : () -> i64
    %10619 = func.call @stack_pop_pointer() : () -> i64
    %10620 = func.call @cc_nil_value() : () -> i64
    %10621 = func.call @cc_nil_value() : () -> i64
    %10622 = func.call @cc_errorp(%10620) : (i64) -> i64
    %10623 = arith.cmpi ne, %10622, %10621 : i64
    %10624 = scf.if %10623 -> (i64) {
      scf.yield %10620 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %10625 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10625 : i64
    }
    %10626 = func.call @cc_nil_value() : () -> i64
    %10627 = func.call @cc_errorp(%10624) : (i64) -> i64
    %10628 = arith.cmpi ne, %10627, %10626 : i64
    %10629 = scf.if %10628 -> (i64) {
      scf.yield %10624 : i64
    } else {
      func.call @stack_push_pointer(%10619) : (i64) -> ()
      %10630 = llvm.mlir.addressof @str894 : !llvm.ptr
      %10631 = arith.constant 9 : i64
      %10632 = func.call @cc_make_string(%10630, %10631) : (!llvm.ptr, i64) -> i64
      %10633 = llvm.mlir.addressof @str895 : !llvm.ptr
      %10634 = arith.constant 11 : i64
      %10635 = func.call @cc_make_string(%10633, %10634) : (!llvm.ptr, i64) -> i64
      %10636 = func.call @cc_intern(%10632, %10635) : (i64, i64) -> i64
      %10637 = func.call @cc_nil_value() : () -> i64
      %10638 = func.call @cc_cons(%10636, %10637) : (i64, i64) -> i64
      %10639 = func.call @cc_values_pack(%10638) : (i64) -> i64
      %__rlasp_stack_elide_zero_710 = arith.constant 0 : i64
      %10640 = arith.addi %10636, %__rlasp_stack_elide_zero_710 : i64
      %10641 = func.call @stack_pop_pointer() : () -> i64
      %10642 = func.call @cc_typep(%10641, %10640) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_711 = arith.constant 0 : i64
      %10643 = arith.addi %10642, %__rlasp_stack_elide_zero_711 : i64
      %10644 = func.call @cc_multiple_value_list(%10643) : (i64) -> i64
      %10645 = func.call @cc_t_value() : () -> i64
      %10646 = llvm.mlir.addressof @str896 : !llvm.ptr
      %10647 = arith.constant 37 : i64
      %10648 = func.call @cc_make_string(%10646, %10647) : (!llvm.ptr, i64) -> i64
      %10649 = func.call @cc_nil_value() : () -> i64
      %10650 = func.call @cc_intern(%10648, %10649) : (i64, i64) -> i64
      %10651 = func.call @cc_nil_value() : () -> i64
      %10652 = func.call @cc_cons(%10650, %10651) : (i64, i64) -> i64
      %10653 = func.call @cc_values_pack(%10652) : (i64) -> i64
      %10654 = func.call @cc_set_symbol_value(%10650, %10645) : (i64, i64) -> i64
      %10655 = llvm.mlir.addressof @str897 : !llvm.ptr
      %10656 = arith.constant 38 : i64
      %10657 = func.call @cc_make_string(%10655, %10656) : (!llvm.ptr, i64) -> i64
      %10658 = func.call @cc_nil_value() : () -> i64
      %10659 = func.call @cc_intern(%10657, %10658) : (i64, i64) -> i64
      %10660 = func.call @cc_nil_value() : () -> i64
      %10661 = func.call @cc_cons(%10659, %10660) : (i64, i64) -> i64
      %10662 = func.call @cc_values_pack(%10661) : (i64) -> i64
      %10663 = func.call @cc_set_symbol_value(%10659, %10643) : (i64, i64) -> i64
      %10664 = llvm.mlir.addressof @str898 : !llvm.ptr
      %10665 = arith.constant 39 : i64
      %10666 = func.call @cc_make_string(%10664, %10665) : (!llvm.ptr, i64) -> i64
      %10667 = func.call @cc_nil_value() : () -> i64
      %10668 = func.call @cc_intern(%10666, %10667) : (i64, i64) -> i64
      %10669 = func.call @cc_nil_value() : () -> i64
      %10670 = func.call @cc_cons(%10668, %10669) : (i64, i64) -> i64
      %10671 = func.call @cc_values_pack(%10670) : (i64) -> i64
      %10672 = func.call @cc_set_symbol_value(%10668, %10644) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_712 = arith.constant 0 : i64
      %10673 = arith.addi %10643, %__rlasp_stack_elide_zero_712 : i64
      scf.yield %10673 : i64
    }
    func.call @stack_push_pointer(%10629) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511578"() {
    %10585 = func.call @cc_nil_value() : () -> i64
    %10586 = func.call @cc_nil_value() : () -> i64
    %10587 = func.call @cc_errorp(%10585) : (i64) -> i64
    %10588 = arith.cmpi ne, %10587, %10586 : i64
    %10589 = scf.if %10588 -> (i64) {
      scf.yield %10585 : i64
    } else {
      %10590 = func.call @cc_nil_value() : () -> i64
      %10591 = llvm.mlir.addressof @str891 : !llvm.ptr
      %10592 = arith.constant 37 : i64
      %10593 = func.call @cc_make_string(%10591, %10592) : (!llvm.ptr, i64) -> i64
      %10594 = func.call @cc_nil_value() : () -> i64
      %10595 = func.call @cc_intern(%10593, %10594) : (i64, i64) -> i64
      %10596 = func.call @cc_nil_value() : () -> i64
      %10597 = func.call @cc_cons(%10595, %10596) : (i64, i64) -> i64
      %10598 = func.call @cc_values_pack(%10597) : (i64) -> i64
      %10599 = func.call @cc_set_symbol_value(%10595, %10590) : (i64, i64) -> i64
      %10600 = llvm.mlir.addressof @str892 : !llvm.ptr
      %10601 = arith.constant 38 : i64
      %10602 = func.call @cc_make_string(%10600, %10601) : (!llvm.ptr, i64) -> i64
      %10603 = func.call @cc_nil_value() : () -> i64
      %10604 = func.call @cc_intern(%10602, %10603) : (i64, i64) -> i64
      %10605 = func.call @cc_nil_value() : () -> i64
      %10606 = func.call @cc_cons(%10604, %10605) : (i64, i64) -> i64
      %10607 = func.call @cc_values_pack(%10606) : (i64) -> i64
      %10608 = func.call @cc_set_symbol_value(%10604, %10590) : (i64, i64) -> i64
      %10609 = llvm.mlir.addressof @str893 : !llvm.ptr
      %10610 = arith.constant 39 : i64
      %10611 = func.call @cc_make_string(%10609, %10610) : (!llvm.ptr, i64) -> i64
      %10612 = func.call @cc_nil_value() : () -> i64
      %10613 = func.call @cc_intern(%10611, %10612) : (i64, i64) -> i64
      %10614 = func.call @cc_nil_value() : () -> i64
      %10615 = func.call @cc_cons(%10613, %10614) : (i64, i64) -> i64
      %10616 = func.call @cc_values_pack(%10615) : (i64) -> i64
      %10617 = func.call @cc_set_symbol_value(%10613, %10590) : (i64, i64) -> i64
      %10674 = arith.constant 97047688511580 : i64
      %10675 = arith.constant 0 : i64
      %10676 = func.call @cc_make_closure(%10674, %10675) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_713 = arith.constant 0 : i64
      %10677 = arith.addi %10676, %__rlasp_stack_elide_zero_713 : i64
      %10678 = llvm.mlir.addressof @str899 : !llvm.ptr
      %10679 = arith.constant 26 : i64
      %10680 = func.call @cc_make_symbol(%10678, %10679) : (!llvm.ptr, i64) -> i64
      %10681 = func.call @cc_symbol_value(%10680) : (i64) -> i64
      %10682 = func.call @cc_set_symbol_value(%10680, %10677) : (i64, i64) -> i64
      %10683 = func.call @cc_nil_value() : () -> i64
      %10684 = func.call @cc_nil_value() : () -> i64
      %10685 = func.call @cc_errorp(%10683) : (i64) -> i64
      %10686 = arith.cmpi ne, %10685, %10684 : i64
      %10687 = scf.if %10686 -> (i64) {
        scf.yield %10683 : i64
      } else {
        %10688 = arith.constant 4 : i64
        func.call @stack_push_fixnum(%10688) : (i64) -> ()
        %10689 = func.call @stack_pop_pointer() : () -> i64
        %10690 = func.call @cc_nil_value() : () -> i64
        %10691 = func.call @cc_errorp(%10689) : (i64) -> i64
        %10692 = arith.cmpi ne, %10691, %10690 : i64
        %10693 = arith.cmpi eq, %10690, %10690 : i64
        %10694 = arith.andi %10692, %10693 : i1
        %10695 = scf.if %10694 -> (i64) {
          scf.yield %10689 : i64
        } else {
          scf.yield %10690 : i64
        }
        %10696 = arith.cmpi ne, %10695, %10690 : i64
        scf.if %10696 {
          func.call @stack_push_pointer(%10695) : (i64) -> ()
        } else {
          %10697 = func.call @cc_nil_value() : () -> i64
          %10698 = func.call @cc_cons(%10689, %10697) : (i64, i64) -> i64
          func.call @stack_push_pointer(%10698) : (i64) -> ()
          func.call @cc_print_stack() : () -> ()
        }
        %10699 = func.call @stack_pop_pointer() : () -> i64
        %10700 = func.call @cc_nil_value() : () -> i64
        %10701 = func.call @cc_errorp(%10699) : (i64) -> i64
        %10702 = arith.cmpi ne, %10701, %10700 : i64
        %10703 = arith.cmpi eq, %10700, %10700 : i64
        %10704 = arith.andi %10702, %10703 : i1
        %10705 = scf.if %10704 -> (i64) {
          scf.yield %10699 : i64
        } else {
          scf.yield %10700 : i64
        }
        %10706 = arith.cmpi ne, %10705, %10700 : i64
        scf.if %10706 {
          func.call @stack_push_pointer(%10705) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%10699) : (i64) -> ()
          %10707 = llvm.mlir.addressof @str900 : !llvm.ptr
          %10708 = func.call @cc_make_function_ref_const(%10707) : (!llvm.ptr) -> i64
          %10709 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%10708, %10709) : (i64, i64) -> ()
        }
        %10710 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10710 : i64
      }
      func.call @stack_push_pointer(%10687) : (i64) -> ()
      %10711 = func.call @cc_restore_symbol_value(%10680, %10681) : (i64, i64) -> i64
      %10712 = func.call @stack_pop_pointer() : () -> i64
      %10713 = func.call @cc_multiple_value_list(%10712) : (i64) -> i64
      %10714 = llvm.mlir.addressof @str901 : !llvm.ptr
      %10715 = arith.constant 37 : i64
      %10716 = func.call @cc_make_string(%10714, %10715) : (!llvm.ptr, i64) -> i64
      %10717 = func.call @cc_nil_value() : () -> i64
      %10718 = func.call @cc_intern(%10716, %10717) : (i64, i64) -> i64
      %10719 = func.call @cc_nil_value() : () -> i64
      %10720 = func.call @cc_cons(%10718, %10719) : (i64, i64) -> i64
      %10721 = func.call @cc_values_pack(%10720) : (i64) -> i64
      %10722 = func.call @cc_symbol_value(%10718) : (i64) -> i64
      %10723 = llvm.mlir.addressof @str902 : !llvm.ptr
      %10724 = arith.constant 38 : i64
      %10725 = func.call @cc_make_string(%10723, %10724) : (!llvm.ptr, i64) -> i64
      %10726 = func.call @cc_nil_value() : () -> i64
      %10727 = func.call @cc_intern(%10725, %10726) : (i64, i64) -> i64
      %10728 = func.call @cc_nil_value() : () -> i64
      %10729 = func.call @cc_cons(%10727, %10728) : (i64, i64) -> i64
      %10730 = func.call @cc_values_pack(%10729) : (i64) -> i64
      %10731 = func.call @cc_symbol_value(%10727) : (i64) -> i64
      %10732 = llvm.mlir.addressof @str903 : !llvm.ptr
      %10733 = arith.constant 39 : i64
      %10734 = func.call @cc_make_string(%10732, %10733) : (!llvm.ptr, i64) -> i64
      %10735 = func.call @cc_nil_value() : () -> i64
      %10736 = func.call @cc_intern(%10734, %10735) : (i64, i64) -> i64
      %10737 = func.call @cc_nil_value() : () -> i64
      %10738 = func.call @cc_cons(%10736, %10737) : (i64, i64) -> i64
      %10739 = func.call @cc_values_pack(%10738) : (i64) -> i64
      %10740 = func.call @cc_symbol_value(%10736) : (i64) -> i64
      %10741 = func.call @cc_nil_value() : () -> i64
      %10742 = arith.cmpi ne, %10722, %10741 : i64
      %10743 = scf.if %10742 -> (i64) {
        scf.yield %10740 : i64
      } else {
        scf.yield %10713 : i64
      }
      %10744 = func.call @cc_values_pack(%10743) : (i64) -> i64
      %__rlasp_stack_elide_zero_714 = arith.constant 0 : i64
      %10745 = arith.addi %10744, %__rlasp_stack_elide_zero_714 : i64
      %10746 = func.call @cc_nil_value() : () -> i64
      %10747 = func.call @cc_cons(%10745, %10746) : (i64, i64) -> i64
      %10748 = func.call @cc_not(%10747) : (i64) -> i64
      %__rlasp_stack_elide_zero_715 = arith.constant 0 : i64
      %10749 = arith.addi %10748, %__rlasp_stack_elide_zero_715 : i64
      %10750 = func.call @cc_nil_value() : () -> i64
      %10751 = func.call @cc_cons(%10749, %10750) : (i64, i64) -> i64
      %10752 = func.call @cc_not(%10751) : (i64) -> i64
      %__rlasp_stack_elide_zero_716 = arith.constant 0 : i64
      %10753 = arith.addi %10752, %__rlasp_stack_elide_zero_716 : i64
      scf.yield %10753 : i64
    }
    func.call @stack_push_pointer(%10589) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511581"() {
    %10965 = func.call @cc_nil_value() : () -> i64
    %10966 = func.call @cc_nil_value() : () -> i64
    %10967 = func.call @cc_errorp(%10965) : (i64) -> i64
    %10968 = arith.cmpi ne, %10967, %10966 : i64
    %10969 = scf.if %10968 -> (i64) {
      scf.yield %10965 : i64
    } else {
      %10970 = func.call @cc_nil_value() : () -> i64
      %10971 = func.call @cc_nil_value() : () -> i64
      %10972 = func.call @cc_errorp(%10970) : (i64) -> i64
      %10973 = arith.cmpi ne, %10972, %10971 : i64
      %10974 = scf.if %10973 -> (i64) {
        scf.yield %10970 : i64
      } else {
        %10975 = func.call @cc_nil_value() : () -> i64
        %10976 = arith.cmpi ne, %10975, %10975 : i64
        scf.if %10976 {
          func.call @stack_push_pointer(%10975) : (i64) -> ()
        } else {
          %10977 = llvm.mlir.addressof @str924 : !llvm.ptr
          %10978 = func.call @cc_make_function_ref_const(%10977) : (!llvm.ptr) -> i64
          %10979 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%10978, %10979) : (i64, i64) -> ()
        }
        %10980 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10980 : i64
      }
      %10981 = func.call @cc_nil_value() : () -> i64
      %10982 = func.call @cc_errorp(%10974) : (i64) -> i64
      %10983 = arith.cmpi ne, %10982, %10981 : i64
      %10984 = scf.if %10983 -> (i64) {
        scf.yield %10974 : i64
      } else {
        %10985 = func.call @cc_nil_value() : () -> i64
        %10986 = arith.cmpi ne, %10985, %10985 : i64
        scf.if %10986 {
          func.call @stack_push_pointer(%10985) : (i64) -> ()
        } else {
          %10987 = llvm.mlir.addressof @str925 : !llvm.ptr
          %10988 = func.call @cc_make_function_ref_const(%10987) : (!llvm.ptr) -> i64
          %10989 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%10988, %10989) : (i64, i64) -> ()
        }
        %10990 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10990 : i64
      }
      %__rlasp_stack_elide_zero_717 = arith.constant 0 : i64
      %10991 = arith.addi %10984, %__rlasp_stack_elide_zero_717 : i64
      %10992 = func.call @cc_nil_value() : () -> i64
      %10993 = func.call @cc_nil_value() : () -> i64
      %10994 = func.call @cc_errorp(%10992) : (i64) -> i64
      %10995 = arith.cmpi ne, %10994, %10993 : i64
      %10996 = scf.if %10995 -> (i64) {
        scf.yield %10992 : i64
      } else {
        %10997 = func.call @cc_nil_value() : () -> i64
        %10998 = arith.cmpi ne, %10997, %10997 : i64
        scf.if %10998 {
          func.call @stack_push_pointer(%10997) : (i64) -> ()
        } else {
          %10999 = llvm.mlir.addressof @str926 : !llvm.ptr
          %11000 = func.call @cc_make_function_ref_const(%10999) : (!llvm.ptr) -> i64
          %11001 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11000, %11001) : (i64, i64) -> ()
        }
        %11002 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11002 : i64
      }
      %11003 = func.call @cc_nil_value() : () -> i64
      %11004 = func.call @cc_errorp(%10996) : (i64) -> i64
      %11005 = arith.cmpi ne, %11004, %11003 : i64
      %11006 = scf.if %11005 -> (i64) {
        scf.yield %10996 : i64
      } else {
        %11007 = func.call @cc_nil_value() : () -> i64
        %11008 = arith.cmpi ne, %11007, %11007 : i64
        scf.if %11008 {
          func.call @stack_push_pointer(%11007) : (i64) -> ()
        } else {
          %11009 = llvm.mlir.addressof @str927 : !llvm.ptr
          %11010 = func.call @cc_make_function_ref_const(%11009) : (!llvm.ptr) -> i64
          %11011 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11010, %11011) : (i64, i64) -> ()
        }
        %11012 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11012 : i64
      }
      %__rlasp_stack_elide_zero_718 = arith.constant 0 : i64
      %11013 = arith.addi %11006, %__rlasp_stack_elide_zero_718 : i64
      func.call @stack_push_nil() : () -> ()
      %11014 = func.call @stack_pop_pointer() : () -> i64
      %11015 = func.call @cc_cons(%11013, %11014) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_719 = arith.constant 0 : i64
      %11016 = arith.addi %11015, %__rlasp_stack_elide_zero_719 : i64
      %11017 = func.call @cc_cons(%10991, %11016) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_720 = arith.constant 0 : i64
      %11018 = arith.addi %11017, %__rlasp_stack_elide_zero_720 : i64
      %11019 = func.call @cc_values_pack(%11018) : (i64) -> i64
      %__rlasp_stack_elide_zero_721 = arith.constant 0 : i64
      %11020 = arith.addi %11019, %__rlasp_stack_elide_zero_721 : i64
      scf.yield %11020 : i64
    }
    func.call @stack_push_pointer(%10969) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511584"() {
    %11516 = func.call @stack_pop_pointer() : () -> i64
    %11517 = func.call @stack_pop_pointer() : () -> i64
    %11518 = func.call @cc_nil_value() : () -> i64
    %11519 = func.call @cc_nil_value() : () -> i64
    %11520 = func.call @cc_errorp(%11518) : (i64) -> i64
    %11521 = arith.cmpi ne, %11520, %11519 : i64
    %11522 = scf.if %11521 -> (i64) {
      scf.yield %11518 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %11523 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11523 : i64
    }
    %11524 = func.call @cc_nil_value() : () -> i64
    %11525 = func.call @cc_errorp(%11522) : (i64) -> i64
    %11526 = arith.cmpi ne, %11525, %11524 : i64
    %11527 = scf.if %11526 -> (i64) {
      scf.yield %11522 : i64
    } else {
      func.call @stack_push_pointer(%11517) : (i64) -> ()
      %11528 = llvm.mlir.addressof @str977 : !llvm.ptr
      %11529 = arith.constant 9 : i64
      %11530 = func.call @cc_make_string(%11528, %11529) : (!llvm.ptr, i64) -> i64
      %11531 = llvm.mlir.addressof @str978 : !llvm.ptr
      %11532 = arith.constant 11 : i64
      %11533 = func.call @cc_make_string(%11531, %11532) : (!llvm.ptr, i64) -> i64
      %11534 = func.call @cc_intern(%11530, %11533) : (i64, i64) -> i64
      %11535 = func.call @cc_nil_value() : () -> i64
      %11536 = func.call @cc_cons(%11534, %11535) : (i64, i64) -> i64
      %11537 = func.call @cc_values_pack(%11536) : (i64) -> i64
      %__rlasp_stack_elide_zero_722 = arith.constant 0 : i64
      %11538 = arith.addi %11534, %__rlasp_stack_elide_zero_722 : i64
      %11539 = func.call @stack_pop_pointer() : () -> i64
      %11540 = func.call @cc_typep(%11539, %11538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_723 = arith.constant 0 : i64
      %11541 = arith.addi %11540, %__rlasp_stack_elide_zero_723 : i64
      %11542 = func.call @cc_multiple_value_list(%11541) : (i64) -> i64
      %11543 = func.call @cc_t_value() : () -> i64
      %11544 = llvm.mlir.addressof @str979 : !llvm.ptr
      %11545 = arith.constant 37 : i64
      %11546 = func.call @cc_make_string(%11544, %11545) : (!llvm.ptr, i64) -> i64
      %11547 = func.call @cc_nil_value() : () -> i64
      %11548 = func.call @cc_intern(%11546, %11547) : (i64, i64) -> i64
      %11549 = func.call @cc_nil_value() : () -> i64
      %11550 = func.call @cc_cons(%11548, %11549) : (i64, i64) -> i64
      %11551 = func.call @cc_values_pack(%11550) : (i64) -> i64
      %11552 = func.call @cc_set_symbol_value(%11548, %11543) : (i64, i64) -> i64
      %11553 = llvm.mlir.addressof @str980 : !llvm.ptr
      %11554 = arith.constant 38 : i64
      %11555 = func.call @cc_make_string(%11553, %11554) : (!llvm.ptr, i64) -> i64
      %11556 = func.call @cc_nil_value() : () -> i64
      %11557 = func.call @cc_intern(%11555, %11556) : (i64, i64) -> i64
      %11558 = func.call @cc_nil_value() : () -> i64
      %11559 = func.call @cc_cons(%11557, %11558) : (i64, i64) -> i64
      %11560 = func.call @cc_values_pack(%11559) : (i64) -> i64
      %11561 = func.call @cc_set_symbol_value(%11557, %11541) : (i64, i64) -> i64
      %11562 = llvm.mlir.addressof @str981 : !llvm.ptr
      %11563 = arith.constant 39 : i64
      %11564 = func.call @cc_make_string(%11562, %11563) : (!llvm.ptr, i64) -> i64
      %11565 = func.call @cc_nil_value() : () -> i64
      %11566 = func.call @cc_intern(%11564, %11565) : (i64, i64) -> i64
      %11567 = func.call @cc_nil_value() : () -> i64
      %11568 = func.call @cc_cons(%11566, %11567) : (i64, i64) -> i64
      %11569 = func.call @cc_values_pack(%11568) : (i64) -> i64
      %11570 = func.call @cc_set_symbol_value(%11566, %11542) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_724 = arith.constant 0 : i64
      %11571 = arith.addi %11541, %__rlasp_stack_elide_zero_724 : i64
      scf.yield %11571 : i64
    }
    func.call @stack_push_pointer(%11527) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511582"() {
    %11483 = func.call @cc_nil_value() : () -> i64
    %11484 = func.call @cc_nil_value() : () -> i64
    %11485 = func.call @cc_errorp(%11483) : (i64) -> i64
    %11486 = arith.cmpi ne, %11485, %11484 : i64
    %11487 = scf.if %11486 -> (i64) {
      scf.yield %11483 : i64
    } else {
      %11488 = func.call @cc_nil_value() : () -> i64
      %11489 = llvm.mlir.addressof @str974 : !llvm.ptr
      %11490 = arith.constant 37 : i64
      %11491 = func.call @cc_make_string(%11489, %11490) : (!llvm.ptr, i64) -> i64
      %11492 = func.call @cc_nil_value() : () -> i64
      %11493 = func.call @cc_intern(%11491, %11492) : (i64, i64) -> i64
      %11494 = func.call @cc_nil_value() : () -> i64
      %11495 = func.call @cc_cons(%11493, %11494) : (i64, i64) -> i64
      %11496 = func.call @cc_values_pack(%11495) : (i64) -> i64
      %11497 = func.call @cc_set_symbol_value(%11493, %11488) : (i64, i64) -> i64
      %11498 = llvm.mlir.addressof @str975 : !llvm.ptr
      %11499 = arith.constant 38 : i64
      %11500 = func.call @cc_make_string(%11498, %11499) : (!llvm.ptr, i64) -> i64
      %11501 = func.call @cc_nil_value() : () -> i64
      %11502 = func.call @cc_intern(%11500, %11501) : (i64, i64) -> i64
      %11503 = func.call @cc_nil_value() : () -> i64
      %11504 = func.call @cc_cons(%11502, %11503) : (i64, i64) -> i64
      %11505 = func.call @cc_values_pack(%11504) : (i64) -> i64
      %11506 = func.call @cc_set_symbol_value(%11502, %11488) : (i64, i64) -> i64
      %11507 = llvm.mlir.addressof @str976 : !llvm.ptr
      %11508 = arith.constant 39 : i64
      %11509 = func.call @cc_make_string(%11507, %11508) : (!llvm.ptr, i64) -> i64
      %11510 = func.call @cc_nil_value() : () -> i64
      %11511 = func.call @cc_intern(%11509, %11510) : (i64, i64) -> i64
      %11512 = func.call @cc_nil_value() : () -> i64
      %11513 = func.call @cc_cons(%11511, %11512) : (i64, i64) -> i64
      %11514 = func.call @cc_values_pack(%11513) : (i64) -> i64
      %11515 = func.call @cc_set_symbol_value(%11511, %11488) : (i64, i64) -> i64
      %11572 = arith.constant 97047688511584 : i64
      %11573 = arith.constant 0 : i64
      %11574 = func.call @cc_make_closure(%11572, %11573) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_725 = arith.constant 0 : i64
      %11575 = arith.addi %11574, %__rlasp_stack_elide_zero_725 : i64
      %11576 = llvm.mlir.addressof @str982 : !llvm.ptr
      %11577 = arith.constant 26 : i64
      %11578 = func.call @cc_make_symbol(%11576, %11577) : (!llvm.ptr, i64) -> i64
      %11579 = func.call @cc_symbol_value(%11578) : (i64) -> i64
      %11580 = func.call @cc_set_symbol_value(%11578, %11575) : (i64, i64) -> i64
      %11581 = func.call @cc_nil_value() : () -> i64
      %11582 = func.call @cc_nil_value() : () -> i64
      %11583 = func.call @cc_errorp(%11581) : (i64) -> i64
      %11584 = arith.cmpi ne, %11583, %11582 : i64
      %11585 = scf.if %11584 -> (i64) {
        scf.yield %11581 : i64
      } else {
        %11586 = func.call @cc_nil_value() : () -> i64
        %11587 = arith.cmpi ne, %11586, %11586 : i64
        scf.if %11587 {
          func.call @stack_push_pointer(%11586) : (i64) -> ()
        } else {
          %11588 = llvm.mlir.addressof @str983 : !llvm.ptr
          %11589 = func.call @cc_make_function_ref_const(%11588) : (!llvm.ptr) -> i64
          %11590 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11589, %11590) : (i64, i64) -> ()
        }
        %11591 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11591 : i64
      }
      %11592 = func.call @cc_nil_value() : () -> i64
      %11593 = func.call @cc_errorp(%11585) : (i64) -> i64
      %11594 = arith.cmpi ne, %11593, %11592 : i64
      %11595 = scf.if %11594 -> (i64) {
        scf.yield %11585 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %11596 = func.call @stack_pop_pointer() : () -> i64
        %11597 = func.call @cc_nil_value() : () -> i64
        %11598 = func.call @cc_errorp(%11596) : (i64) -> i64
        %11599 = arith.cmpi ne, %11598, %11597 : i64
        %11600 = scf.if %11599 -> (i64) {
          scf.yield %11596 : i64
        } else {
          %11601 = arith.constant 4 : i64
          func.call @stack_push_fixnum(%11601) : (i64) -> ()
          %11602 = func.call @stack_pop_pointer() : () -> i64
          %11603 = func.call @cc_nil_value() : () -> i64
          %11604 = func.call @cc_errorp(%11602) : (i64) -> i64
          %11605 = arith.cmpi ne, %11604, %11603 : i64
          %11606 = arith.cmpi eq, %11603, %11603 : i64
          %11607 = arith.andi %11605, %11606 : i1
          %11608 = scf.if %11607 -> (i64) {
            scf.yield %11602 : i64
          } else {
            scf.yield %11603 : i64
          }
          %11609 = arith.cmpi ne, %11608, %11603 : i64
          scf.if %11609 {
            func.call @stack_push_pointer(%11608) : (i64) -> ()
          } else {
            %11610 = func.call @cc_nil_value() : () -> i64
            %11611 = func.call @cc_cons(%11602, %11610) : (i64, i64) -> i64
            func.call @stack_push_pointer(%11611) : (i64) -> ()
            func.call @cc_print_stack() : () -> ()
          }
          %11612 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %11612 : i64
        }
        %__rlasp_stack_elide_zero_726 = arith.constant 0 : i64
        %11613 = arith.addi %11600, %__rlasp_stack_elide_zero_726 : i64
        %11614 = func.call @cc_multiple_value_list(%11613) : (i64) -> i64
        %11615 = func.call @cc_nil_value() : () -> i64
        %11616 = arith.cmpi ne, %11615, %11615 : i64
        scf.if %11616 {
          func.call @stack_push_pointer(%11615) : (i64) -> ()
        } else {
          %11617 = llvm.mlir.addressof @str984 : !llvm.ptr
          %11618 = func.call @cc_make_function_ref_const(%11617) : (!llvm.ptr) -> i64
          %11619 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11618, %11619) : (i64, i64) -> ()
        }
        %11620 = func.call @stack_depth() : () -> i64
        %11621 = arith.constant 0 : i64
        %11622 = arith.cmpi sgt, %11620, %11621 : i64
        scf.if %11622 {
          %11623 = func.call @stack_pop_pointer() : () -> i64
        }
        %11624 = func.call @cc_values_pack(%11614) : (i64) -> i64
        %__rlasp_stack_elide_zero_727 = arith.constant 0 : i64
        %11625 = arith.addi %11624, %__rlasp_stack_elide_zero_727 : i64
        scf.yield %11625 : i64
      }
      func.call @stack_push_pointer(%11595) : (i64) -> ()
      %11626 = func.call @cc_restore_symbol_value(%11578, %11579) : (i64, i64) -> i64
      %11627 = func.call @stack_pop_pointer() : () -> i64
      %11628 = func.call @cc_multiple_value_list(%11627) : (i64) -> i64
      %11629 = llvm.mlir.addressof @str985 : !llvm.ptr
      %11630 = arith.constant 37 : i64
      %11631 = func.call @cc_make_string(%11629, %11630) : (!llvm.ptr, i64) -> i64
      %11632 = func.call @cc_nil_value() : () -> i64
      %11633 = func.call @cc_intern(%11631, %11632) : (i64, i64) -> i64
      %11634 = func.call @cc_nil_value() : () -> i64
      %11635 = func.call @cc_cons(%11633, %11634) : (i64, i64) -> i64
      %11636 = func.call @cc_values_pack(%11635) : (i64) -> i64
      %11637 = func.call @cc_symbol_value(%11633) : (i64) -> i64
      %11638 = llvm.mlir.addressof @str986 : !llvm.ptr
      %11639 = arith.constant 38 : i64
      %11640 = func.call @cc_make_string(%11638, %11639) : (!llvm.ptr, i64) -> i64
      %11641 = func.call @cc_nil_value() : () -> i64
      %11642 = func.call @cc_intern(%11640, %11641) : (i64, i64) -> i64
      %11643 = func.call @cc_nil_value() : () -> i64
      %11644 = func.call @cc_cons(%11642, %11643) : (i64, i64) -> i64
      %11645 = func.call @cc_values_pack(%11644) : (i64) -> i64
      %11646 = func.call @cc_symbol_value(%11642) : (i64) -> i64
      %11647 = llvm.mlir.addressof @str987 : !llvm.ptr
      %11648 = arith.constant 39 : i64
      %11649 = func.call @cc_make_string(%11647, %11648) : (!llvm.ptr, i64) -> i64
      %11650 = func.call @cc_nil_value() : () -> i64
      %11651 = func.call @cc_intern(%11649, %11650) : (i64, i64) -> i64
      %11652 = func.call @cc_nil_value() : () -> i64
      %11653 = func.call @cc_cons(%11651, %11652) : (i64, i64) -> i64
      %11654 = func.call @cc_values_pack(%11653) : (i64) -> i64
      %11655 = func.call @cc_symbol_value(%11651) : (i64) -> i64
      %11656 = func.call @cc_nil_value() : () -> i64
      %11657 = arith.cmpi ne, %11637, %11656 : i64
      %11658 = scf.if %11657 -> (i64) {
        scf.yield %11655 : i64
      } else {
        scf.yield %11628 : i64
      }
      %11659 = func.call @cc_values_pack(%11658) : (i64) -> i64
      %__rlasp_stack_elide_zero_728 = arith.constant 0 : i64
      %11660 = arith.addi %11659, %__rlasp_stack_elide_zero_728 : i64
      %11661 = func.call @cc_nil_value() : () -> i64
      %11662 = func.call @cc_cons(%11660, %11661) : (i64, i64) -> i64
      %11663 = func.call @cc_not(%11662) : (i64) -> i64
      %__rlasp_stack_elide_zero_729 = arith.constant 0 : i64
      %11664 = arith.addi %11663, %__rlasp_stack_elide_zero_729 : i64
      %11665 = func.call @cc_nil_value() : () -> i64
      %11666 = func.call @cc_cons(%11664, %11665) : (i64, i64) -> i64
      %11667 = func.call @cc_not(%11666) : (i64) -> i64
      %__rlasp_stack_elide_zero_730 = arith.constant 0 : i64
      %11668 = arith.addi %11667, %__rlasp_stack_elide_zero_730 : i64
      scf.yield %11668 : i64
    }
    func.call @stack_push_pointer(%11487) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str1("f\0Ax\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_97047688511488*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_97047688511488*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_97047688511488*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("Dummy function for use in tests.\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETFLAG_97047688511488*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_97047688511488*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str8("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("f\0An\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_97047688511489*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_97047688511489*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_97047688511489*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str13("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str14("#:%%DYN-CELL-97047688511491-F\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str15("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETFLAG_97047688511489*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETMVLIST_97047688511489*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str18("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_97047688511492*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_97047688511492*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_97047688511492*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("BACKTRACE-1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str28("PRINT-BACKTRACE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str29("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str33("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str34("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("clasp-debug:print-backtrace\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str36("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str37("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str38("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str41("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str43("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str44("BACKTRACE-2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str46("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str47("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str49("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str51("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str54("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str56("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str58("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str61("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str63("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str64("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str65("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETFLAG_97047688511495*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str69("*__MLIR_BLOCK_RETVALUE_97047688511495*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETMVLIST_97047688511495*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str71("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str72("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str73("*__MLIR_BLOCK_RETFLAG_97047688511495*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str74("*__MLIR_BLOCK_RETVALUE_97047688511495*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETMVLIST_97047688511495*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str76("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str77("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str78("*__MLIR_BLOCK_RETFLAG_97047688511495*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETVALUE_97047688511495*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETMVLIST_97047688511495*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str81("#:%%DYN-CELL-97047688511498-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str82("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str83("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str85("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str86("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str87("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str88("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str89("BACKTRACE-3\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str93("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str94("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str97("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str99("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str100("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str103("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str104("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str107("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str109("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str110("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str111("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str112("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str117("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str119("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("*__MLIR_BLOCK_RETFLAG_97047688511500*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str121("*__MLIR_BLOCK_RETVALUE_97047688511500*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str122("*__MLIR_BLOCK_RETMVLIST_97047688511500*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str123("#:%%DYN-CELL-97047688511502-COUNT\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str124("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str125("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str126("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str127("*__MLIR_BLOCK_RETFLAG_97047688511500*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str128("*__MLIR_BLOCK_RETVALUE_97047688511500*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str129("*__MLIR_BLOCK_RETMVLIST_97047688511500*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str130("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str131("*__MLIR_BLOCK_RETFLAG_97047688511500*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str132("*__MLIR_BLOCK_RETVALUE_97047688511500*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str133("*__MLIR_BLOCK_RETMVLIST_97047688511500*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str134("#:%%DYN-CELL-97047688511504-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str135("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str140("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str141("BACKTRACE-4\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str143("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str145("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str146("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str149("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str151("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str152("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str154("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str155("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str160("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str161("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str162("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str163("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str165("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str166("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str167("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("*__MLIR_BLOCK_RETFLAG_97047688511506*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str171("*__MLIR_BLOCK_RETVALUE_97047688511506*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str172("*__MLIR_BLOCK_RETMVLIST_97047688511506*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str173("#:%%DYN-CELL-97047688511508-COUNT\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str174("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str175("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str176("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str177("*__MLIR_BLOCK_RETFLAG_97047688511506*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str178("*__MLIR_BLOCK_RETVALUE_97047688511506*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETMVLIST_97047688511506*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str180("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str181("*__MLIR_BLOCK_RETFLAG_97047688511506*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str182("*__MLIR_BLOCK_RETVALUE_97047688511506*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str183("*__MLIR_BLOCK_RETMVLIST_97047688511506*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str184("#:%%DYN-CELL-97047688511510-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str185("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str189("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str190("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str191("FRAME-LOCALS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str192("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str193("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str194("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str195("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str196("MAP-BACKTRACE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str197("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str198("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str199("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str200("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str201("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str202("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str203("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str204("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str206("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str207("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str208("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str209("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str210("FRAME-LOCALS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str211("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str213("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str214("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str215("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str216("*__MLIR_BLOCK_RETFLAG_97047688511512*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str217("*__MLIR_BLOCK_RETVALUE_97047688511512*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str218("*__MLIR_BLOCK_RETMVLIST_97047688511512*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str219("__LAMBDA_97047688511513\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str220("*__MLIR_BLOCK_RETFLAG_97047688511514*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str221("*__MLIR_BLOCK_RETVALUE_97047688511514*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str222("*__MLIR_BLOCK_RETMVLIST_97047688511514*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str223("*__MLIR_BLOCK_RETFLAG_97047688511515*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str224("*__MLIR_BLOCK_RETVALUE_97047688511515*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str225("*__MLIR_BLOCK_RETMVLIST_97047688511515*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str226("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str227("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str228("clasp-debug:frame-locals\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str229("*__MLIR_BLOCK_RETFLAG_97047688511515*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str230("*__MLIR_BLOCK_RETVALUE_97047688511515*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str231("*__MLIR_BLOCK_RETMVLIST_97047688511515*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str232("*__MLIR_BLOCK_RETFLAG_97047688511514*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str233("*__MLIR_BLOCK_RETVALUE_97047688511514*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str234("*__MLIR_BLOCK_RETMVLIST_97047688511514*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str235("*__MLIR_BLOCK_RETFLAG_97047688511512*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str236("*__MLIR_BLOCK_RETVALUE_97047688511512*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str237("*__MLIR_BLOCK_RETMVLIST_97047688511512*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str238("clasp-debug:map-backtrace\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str239("*__MLIR_BLOCK_RETFLAG_97047688511515*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str240("*__MLIR_BLOCK_RETVALUE_97047688511515*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str241("*__MLIR_BLOCK_RETMVLIST_97047688511515*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str242("*__MLIR_BLOCK_RETFLAG_97047688511514*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str243("*__MLIR_BLOCK_RETMVLIST_97047688511514*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str244("__lambda_97047688511513\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str245("%FN%GET-FRAME-LOCALS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str246("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str247("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str248("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str249("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str250("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str251("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str252("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str253("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str254("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str255("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str256("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str257("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str258("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str259("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str260("*__MLIR_BLOCK_RETFLAG_97047688511512*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str261("*__MLIR_BLOCK_RETVALUE_97047688511512*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str262("*__MLIR_BLOCK_RETMVLIST_97047688511512*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str263("#:%%DYN-CELL-97047688511517-%FN%GET-FRAME-LOCALS\00") : !llvm.array<49 x i8>
  llvm.mlir.global private constant @str264("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str265("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str266("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str267("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str268("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str269("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str270("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str271("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str272("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str273("FRAME-FUNCTION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str274("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str275("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str276("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str277("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str281("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str282("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str283("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str284("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str285("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str286("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str287("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str288("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str290("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str291("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str292("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str293("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str295("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str296("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str297("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str298("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str299("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str300("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str301("FRAME-FUNCTION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str302("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str304("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str305("function-to-show-up-in-backtrace\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str306("*__MLIR_BLOCK_RETFLAG_97047688511519*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str307("*__MLIR_BLOCK_RETVALUE_97047688511519*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str308("*__MLIR_BLOCK_RETMVLIST_97047688511519*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str309("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str310("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str311("clasp-debug:frame-function\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str312("*__MLIR_BLOCK_RETFLAG_97047688511519*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str313("*__MLIR_BLOCK_RETVALUE_97047688511519*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str314("*__MLIR_BLOCK_RETMVLIST_97047688511519*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str315("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str316("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str317("*__MLIR_BLOCK_RETFLAG_97047688511519*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str318("*__MLIR_BLOCK_RETVALUE_97047688511519*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str319("*__MLIR_BLOCK_RETMVLIST_97047688511519*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str320("#:%%DYN-CELL-97047688511522-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str321("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str322("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str323("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str324("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str325("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str326("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str327("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str328("FRAME-FUNCTION-LAMBDA-LIST\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str329("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str330("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str331("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str332("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str333("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str335("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str336("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str338("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str339("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str340("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str341("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str343("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str344("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str345("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str346("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str347("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str348("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str349("FRAME-FUNCTION-LAMBDA-LIST\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str350("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str351("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str352("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str353("*__MLIR_BLOCK_RETFLAG_97047688511524*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str354("*__MLIR_BLOCK_RETVALUE_97047688511524*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str355("*__MLIR_BLOCK_RETMVLIST_97047688511524*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str356("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str357("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str358("clasp-debug:frame-function-lambda-list\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str359("*__MLIR_BLOCK_RETFLAG_97047688511524*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str360("*__MLIR_BLOCK_RETVALUE_97047688511524*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str361("*__MLIR_BLOCK_RETMVLIST_97047688511524*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str362("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str363("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str364("*__MLIR_BLOCK_RETFLAG_97047688511524*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str365("*__MLIR_BLOCK_RETVALUE_97047688511524*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str366("*__MLIR_BLOCK_RETMVLIST_97047688511524*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str367("#:%%DYN-CELL-97047688511527-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str368("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str369("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str370("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str371("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str372("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str373("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str374("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str375("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str376("FRAME-FUNCTION-DOCUMENTATION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str377("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str378("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str379("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str380("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str381("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str382("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str383("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str384("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str386("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str387("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str388("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str389("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str390("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str391("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str392("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str393("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str394("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str395("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str396("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str397("FRAME-FUNCTION-DOCUMENTATION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str398("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str399("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str400("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str401("*__MLIR_BLOCK_RETFLAG_97047688511529*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str402("*__MLIR_BLOCK_RETVALUE_97047688511529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str403("*__MLIR_BLOCK_RETMVLIST_97047688511529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str404("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str405("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str406("clasp-debug:frame-function-documentation\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str407("*__MLIR_BLOCK_RETFLAG_97047688511529*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str408("*__MLIR_BLOCK_RETVALUE_97047688511529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str409("*__MLIR_BLOCK_RETMVLIST_97047688511529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str410("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str411("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str412("*__MLIR_BLOCK_RETFLAG_97047688511529*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str413("*__MLIR_BLOCK_RETVALUE_97047688511529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str414("*__MLIR_BLOCK_RETMVLIST_97047688511529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str415("#:%%DYN-CELL-97047688511532-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str416("Dummy function for use in tests.\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str417("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str418("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str419("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str420("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str421("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str422("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str423("BYTECODE-FRAME-FUNCTION-NAME\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str424("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str425("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str426("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str427("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str428("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str429("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str430("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str431("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str432("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str433("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str434("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str436("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str437("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str438("FRAMES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str439("MAP-BACKTRACE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str440("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str441("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str442("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str443("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str444("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str445("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str446("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str447("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str448("FRAME-LANGUAGE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str449("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str451("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str452("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str453("PUSH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str454("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str455("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str456("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str457("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str458("FRAMES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str459("FRAMES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str460("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str461("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str462("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str463("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str464("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str465("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str468("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str469("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str470("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str471("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("FDEFINITION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str473("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str475("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str476("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str477("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str478("*__MLIR_BLOCK_RETFLAG_97047688511535*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str479("*__MLIR_BLOCK_RETVALUE_97047688511535*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str480("*__MLIR_BLOCK_RETMVLIST_97047688511535*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str481("#:%%DYN-CELL-97047688511536-FRAMES\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str482("clasp-debug:frame-language\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str483("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str484("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str485("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str486("clasp-debug:map-backtrace\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str487("*__MLIR_BLOCK_RETFLAG_97047688511535*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str488("*__MLIR_BLOCK_RETMVLIST_97047688511535*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str489("%FN%bc2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str490("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str491("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str492("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str493("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str494("*__MLIR_BLOCK_RETFLAG_97047688511538*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str495("*__MLIR_BLOCK_RETVALUE_97047688511538*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str496("*__MLIR_BLOCK_RETMVLIST_97047688511538*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str497("%FN%bc2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str498("*__MLIR_BLOCK_RETFLAG_97047688511538*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str499("*__MLIR_BLOCK_RETMVLIST_97047688511538*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str500("%FN%bc1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str501("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str502("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str503("#:%%DYN-CELL-97047688511539-BC1\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str504("#:%%DYN-CELL-97047688511540-BC2\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str505("#:%%DYN-CELL-97047688511541-FRAMES\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str506("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str507("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str508("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str509("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str510("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str511("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str512("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str513("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str514("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str515("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str516("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str517("BYTECODE-FRAME-LOCALS\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str518("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str519("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str520("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str521("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str522("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str523("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str524("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str525("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str526("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str527("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str528("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str529("MAP-BACKTRACE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str530("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str531("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str532("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str533("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str534("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str535("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str536("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str537("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str538("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str539("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str541("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str542("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str543("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str545("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str546("FRAME-LOCALS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str547("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str549("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str550("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str551("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str552("x\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str553("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str554("*__MLIR_BLOCK_RETFLAG_97047688511544*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str555("*__MLIR_BLOCK_RETVALUE_97047688511544*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str556("*__MLIR_BLOCK_RETMVLIST_97047688511544*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str557("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str558("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str559("clasp-debug:frame-locals\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str560("*__MLIR_BLOCK_RETFLAG_97047688511544*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str561("*__MLIR_BLOCK_RETVALUE_97047688511544*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str562("*__MLIR_BLOCK_RETMVLIST_97047688511544*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str563("#:%%DYN-CELL-97047688511546-BCL\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str564("map-backtrace\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str565("*__MLIR_BLOCK_RETFLAG_97047688511544*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str566("*__MLIR_BLOCK_RETMVLIST_97047688511544*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str567("x\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str568("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str569("%FN%bcl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str570("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str571("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str572("#:%%DYN-CELL-97047688511547-BCL\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str573("%FN%bcl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str574("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str575("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str577("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str578("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str579("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str580("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str581("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str582("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str583("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str584("PRINT-OBJECT signaled an error and it wasn't handled\00") : !llvm.array<53 x i8>
  llvm.mlir.global private constant @str585("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @method_name_97047688511548("COMMON-LISP:PRINT-OBJECT_97047688511548_primary\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str587("PRINT-OBJECT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str588("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str589("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str590("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str591("PRINT-OBJECT signaled an error and it wasn't handled\00") : !llvm.array<53 x i8>
  llvm.mlir.global private constant @str592("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str593("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str594("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str595("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str596("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str597("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str598("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str599("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str600("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str601("O\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str602("PRINT-OBJECT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str603("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str604("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str605("PRINT-BACKTRACE-HANDLES-ERRORS\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str606("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str607("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str608("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str609("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str610("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str611("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str612("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str613("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str614("PRINT-BACKTRACE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str615("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str616("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str617("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str618("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str619("MAKE-INSTANCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str620("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str621("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str622("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str623("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str624("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str625("clasp-debug:print-backtrace\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str626("#:%%DYN-CELL-97047688511551-S\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str627("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str628("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str629("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str630("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str631("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str632("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str633("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str634("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str635("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str636("TRUNCATE-STACK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str637("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str638("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str639("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str640("WITH-TRUNCATED-STACK\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str641("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str642("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str643("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str644("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str645("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str646("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str647("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str648("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str649("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str650("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str651("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str652("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str655("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str656("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str657("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str658("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str659("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str660("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str661("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str662("*__MLIR_BLOCK_RETFLAG_97047688511553*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str663("*__MLIR_BLOCK_RETVALUE_97047688511553*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str664("*__MLIR_BLOCK_RETMVLIST_97047688511553*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str665("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str666("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str667("*__MLIR_BLOCK_RETFLAG_97047688511553*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str668("*__MLIR_BLOCK_RETVALUE_97047688511553*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str669("*__MLIR_BLOCK_RETMVLIST_97047688511553*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str670("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str671("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str672("call-with-truncated-stack\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str673("*__MLIR_BLOCK_RETFLAG_97047688511553*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str674("*__MLIR_BLOCK_RETVALUE_97047688511553*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str675("*__MLIR_BLOCK_RETMVLIST_97047688511553*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str676("#:%%DYN-CELL-97047688511557-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str677("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str678("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str679("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str680("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str681("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str682("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str683("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str684("CAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str685("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str686("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str687("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str688("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str689("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str690("WITH-CAPPED-STACK\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str691("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str692("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str693("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str694("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str695("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str696("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str697("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str698("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str699("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str700("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str701("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str702("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str703("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str704("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str705("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str706("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str707("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str708("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str709("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str710("*__MLIR_BLOCK_RETFLAG_97047688511559*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str711("*__MLIR_BLOCK_RETVALUE_97047688511559*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str712("*__MLIR_BLOCK_RETMVLIST_97047688511559*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str713("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str714("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str715("*__MLIR_BLOCK_RETFLAG_97047688511559*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str716("*__MLIR_BLOCK_RETVALUE_97047688511559*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str717("*__MLIR_BLOCK_RETMVLIST_97047688511559*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str718("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str719("call-with-capped-stack\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str720("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str721("*__MLIR_BLOCK_RETFLAG_97047688511559*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str722("*__MLIR_BLOCK_RETVALUE_97047688511559*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str723("*__MLIR_BLOCK_RETMVLIST_97047688511559*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str724("#:%%DYN-CELL-97047688511563-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str725("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str726("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str727("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str728("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str729("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str730("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str731("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str732("UNDELIMITED-STACK-1\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str733("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str734("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str735("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str736("WITH-TRUNCATED-STACK\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str737("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str738("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str739("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str740("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str741("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str742("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str743("DELIMITED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str744("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str745("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str746("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str747("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str748("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str749("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str750("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str751("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str752("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str753("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str754("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str755("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str756("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str757("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str758("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str759("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str760("*__MLIR_BLOCK_RETFLAG_97047688511565*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str761("*__MLIR_BLOCK_RETVALUE_97047688511565*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str762("*__MLIR_BLOCK_RETMVLIST_97047688511565*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str763("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str764("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str765("*__MLIR_BLOCK_RETFLAG_97047688511565*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str766("*__MLIR_BLOCK_RETVALUE_97047688511565*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str767("*__MLIR_BLOCK_RETMVLIST_97047688511565*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str768("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str769("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str770("call-with-truncated-stack\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str771("*__MLIR_BLOCK_RETFLAG_97047688511565*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str772("*__MLIR_BLOCK_RETVALUE_97047688511565*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str773("*__MLIR_BLOCK_RETMVLIST_97047688511565*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str774("#:%%DYN-CELL-97047688511569-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str775("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str776("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str777("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str778("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str779("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str780("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str781("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str782("UNDELIMITED-STACK-2\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str783("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str784("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str785("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str786("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str787("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str788("WITH-CAPPED-STACK\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str789("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str790("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str791("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str792("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str793("DELIMITED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str794("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str795("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str796("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str797("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str798("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str799("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str800("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str801("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str802("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str803("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str804("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str805("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str806("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str807("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str808("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str809("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str810("*__MLIR_BLOCK_RETFLAG_97047688511571*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str811("*__MLIR_BLOCK_RETVALUE_97047688511571*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str812("*__MLIR_BLOCK_RETMVLIST_97047688511571*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str813("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str814("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str815("*__MLIR_BLOCK_RETFLAG_97047688511571*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str816("*__MLIR_BLOCK_RETVALUE_97047688511571*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str817("*__MLIR_BLOCK_RETMVLIST_97047688511571*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str818("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str819("call-with-capped-stack\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str820("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str821("*__MLIR_BLOCK_RETFLAG_97047688511571*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str822("*__MLIR_BLOCK_RETVALUE_97047688511571*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str823("*__MLIR_BLOCK_RETMVLIST_97047688511571*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str824("#:%%DYN-CELL-97047688511575-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str825("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str826("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str827("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str828("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str829("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str830("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str831("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str832("BREAKSTEP-COMPILE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str833("VALUES-LIST\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str834("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str835("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str836("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str837("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str838("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str839("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str840("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str841("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str842("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str843("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str844("SET-BREAKSTEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str845("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str846("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str847("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str848("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str849("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str850("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str851("UNSET-BREAKSTEP\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str852("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str853("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str854("clasp-debug:set-breakstep\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str855("clasp-debug:unset-breakstep\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str856("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str857("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str858("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str859("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str860("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str861("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str862("STEP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str863("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str864("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str865("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str866("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str867("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str868("*INVOKE-DEBUGGER-HOOK*\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str869("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str870("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str871("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str872("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str873("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str874("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str875("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str876("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str877("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str878("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str879("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str880("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str881("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str882("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str883("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str884("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str885("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str886("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str887("STEP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str888("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str889("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str890("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str891("*__MLIR_BLOCK_RETFLAG_97047688511579*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str892("*__MLIR_BLOCK_RETVALUE_97047688511579*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str893("*__MLIR_BLOCK_RETMVLIST_97047688511579*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str894("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str895("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str896("*__MLIR_BLOCK_RETFLAG_97047688511579*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str897("*__MLIR_BLOCK_RETVALUE_97047688511579*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str898("*__MLIR_BLOCK_RETMVLIST_97047688511579*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str899("ext:*invoke-debugger-hook*\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str900("STEP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str901("*__MLIR_BLOCK_RETFLAG_97047688511579*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str902("*__MLIR_BLOCK_RETVALUE_97047688511579*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str903("*__MLIR_BLOCK_RETMVLIST_97047688511579*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str904("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str905("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str906("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str907("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str908("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str909("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str910("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str911("BREAKSTEPPING-P\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str912("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str913("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str914("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str915("SET-BREAKSTEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str916("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str917("BREAKSTEPPING-P\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str918("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str919("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str920("UNSET-BREAKSTEP\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str921("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str922("BREAKSTEPPING-P\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str923("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str924("clasp-debug:set-breakstep\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str925("clasp-debug:breakstepping-p\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str926("clasp-debug:unset-breakstep\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str927("clasp-debug:breakstepping-p\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str928("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str929("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str930("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str931("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str932("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str933("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str934("BREAKSTEP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str935("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str936("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str937("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str938("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str939("*INVOKE-DEBUGGER-HOOK*\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str940("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str941("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str942("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str943("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str944("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str945("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str946("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str947("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str948("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str949("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str950("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str951("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str952("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str953("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str954("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str955("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str956("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str957("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str958("SET-BREAKSTEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str959("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str960("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str961("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str962("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str963("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str964("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str965("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str966("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str967("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str968("INSERT-STEP-CONDITIONS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str969("CLASP-CLEAVIR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str970("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str971("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str972("UNSET-BREAKSTEP\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str973("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str974("*__MLIR_BLOCK_RETFLAG_97047688511583*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str975("*__MLIR_BLOCK_RETVALUE_97047688511583*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str976("*__MLIR_BLOCK_RETMVLIST_97047688511583*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str977("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str978("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str979("*__MLIR_BLOCK_RETFLAG_97047688511583*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str980("*__MLIR_BLOCK_RETVALUE_97047688511583*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str981("*__MLIR_BLOCK_RETMVLIST_97047688511583*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str982("ext:*invoke-debugger-hook*\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str983("clasp-debug:set-breakstep\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str984("clasp-debug:unset-breakstep\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str985("*__MLIR_BLOCK_RETFLAG_97047688511583*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str986("*__MLIR_BLOCK_RETVALUE_97047688511583*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str987("*__MLIR_BLOCK_RETMVLIST_97047688511583*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str988("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str989("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str990("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str991("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str992("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str993("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str994("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str995("*__MLIR_BLOCK_RETFLAG_97047688511492*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str996("*__MLIR_BLOCK_RETMVLIST_97047688511492*\00") : !llvm.array<40 x i8>
}
