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
  func.func @"__main"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 6 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %8) : (i64, i64) -> ()
    %9 = func.call @cc_nil_value() : () -> i64
    %10 = llvm.mlir.addressof @str1 : !llvm.ptr
    %11 = arith.constant 38 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = func.call @cc_intern(%12, %13) : (i64, i64) -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = func.call @cc_cons(%14, %15) : (i64, i64) -> i64
    %17 = func.call @cc_values_pack(%16) : (i64) -> i64
    %18 = func.call @cc_set_symbol_value(%14, %9) : (i64, i64) -> i64
    %19 = llvm.mlir.addressof @str2 : !llvm.ptr
    %20 = arith.constant 39 : i64
    %21 = func.call @cc_make_string(%19, %20) : (!llvm.ptr, i64) -> i64
    %22 = func.call @cc_nil_value() : () -> i64
    %23 = func.call @cc_intern(%21, %22) : (i64, i64) -> i64
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_cons(%23, %24) : (i64, i64) -> i64
    %26 = func.call @cc_values_pack(%25) : (i64) -> i64
    %27 = func.call @cc_set_symbol_value(%23, %9) : (i64, i64) -> i64
    %28 = llvm.mlir.addressof @str3 : !llvm.ptr
    %29 = arith.constant 40 : i64
    %30 = func.call @cc_make_string(%28, %29) : (!llvm.ptr, i64) -> i64
    %31 = func.call @cc_nil_value() : () -> i64
    %32 = func.call @cc_intern(%30, %31) : (i64, i64) -> i64
    %33 = func.call @cc_nil_value() : () -> i64
    %34 = func.call @cc_cons(%32, %33) : (i64, i64) -> i64
    %35 = func.call @cc_values_pack(%34) : (i64) -> i64
    %36 = func.call @cc_set_symbol_value(%32, %9) : (i64, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_errorp(%37) : (i64) -> i64
    %40 = arith.cmpi ne, %39, %38 : i64
    %41 = scf.if %40 -> (i64) {
      scf.yield %37 : i64
    } else {
      %42 = llvm.mlir.addressof @str4 : !llvm.ptr
      %43 = arith.constant 7 : i64
      %44 = func.call @cc_make_string(%42, %43) : (!llvm.ptr, i64) -> i64
      %45 = func.call @cc_nil_value() : () -> i64
      %46 = func.call @cc_intern(%44, %45) : (i64, i64) -> i64
      %47 = func.call @cc_nil_value() : () -> i64
      %48 = func.call @cc_cons(%46, %47) : (i64, i64) -> i64
      %49 = func.call @cc_values_pack(%48) : (i64) -> i64
      func.call @stack_push_pointer(%46) : (i64) -> ()
      %50 = func.call @stack_pop_pointer() : () -> i64
      %51 = func.call @cc_in_package(%50) : (i64) -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %52 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %52 : i64
    }
    %53 = func.call @cc_nil_value() : () -> i64
    %54 = func.call @cc_errorp(%41) : (i64) -> i64
    %55 = arith.cmpi ne, %54, %53 : i64
    %56 = scf.if %55 -> (i64) {
      scf.yield %41 : i64
    } else {
      %57 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%57) : (i64) -> ()
      %58 = func.call @stack_pop_pointer() : () -> i64
      %59 = llvm.mlir.addressof @str5 : !llvm.ptr
      %60 = arith.constant 24 : i64
      %61 = func.call @cc_make_string(%59, %60) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %62 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%58) : (i64) -> ()
      func.call @stack_push_pointer(%62) : (i64) -> ()
      %63 = llvm.mlir.addressof @str6 : !llvm.ptr
      %64 = func.call @cc_make_function_ref_const(%63) : (!llvm.ptr) -> i64
      %65 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%64, %65) : (i64, i64) -> ()
      %66 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %66 : i64
    }
    %67 = func.call @cc_nil_value() : () -> i64
    %68 = func.call @cc_errorp(%56) : (i64) -> i64
    %69 = arith.cmpi ne, %68, %67 : i64
    %70 = scf.if %69 -> (i64) {
      scf.yield %56 : i64
    } else {
      %71 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%71) : (i64) -> ()
      %72 = func.call @stack_pop_pointer() : () -> i64
      %73 = llvm.mlir.addressof @str7 : !llvm.ptr
      %74 = arith.constant 58 : i64
      %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%75) : (i64) -> ()
      %76 = func.call @stack_pop_pointer() : () -> i64
      %77 = llvm.mlir.addressof @str8 : !llvm.ptr
      %78 = arith.constant 20 : i64
      %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
      %80 = llvm.mlir.addressof @str9 : !llvm.ptr
      %81 = arith.constant 11 : i64
      %82 = func.call @cc_make_string(%80, %81) : (!llvm.ptr, i64) -> i64
      %83 = func.call @cc_intern(%79, %82) : (i64, i64) -> i64
      %84 = func.call @cc_nil_value() : () -> i64
      %85 = func.call @cc_cons(%83, %84) : (i64, i64) -> i64
      %86 = func.call @cc_values_pack(%85) : (i64) -> i64
      %87 = func.call @cc_symbol_value(%83) : (i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = llvm.mlir.addressof @str10 : !llvm.ptr
      %90 = arith.constant 20 : i64
      %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
      %92 = llvm.mlir.addressof @str11 : !llvm.ptr
      %93 = arith.constant 11 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = func.call @cc_intern(%91, %94) : (i64, i64) -> i64
      %96 = func.call @cc_nil_value() : () -> i64
      %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
      %98 = func.call @cc_values_pack(%97) : (i64) -> i64
      %99 = func.call @cc_symbol_value(%95) : (i64) -> i64
      func.call @stack_push_pointer(%99) : (i64) -> ()
      %100 = func.call @stack_pop_pointer() : () -> i64
      %101 = arith.constant 1 : i64
      %102 = func.call @cc_box_fixnum(%101) : (i64) -> i64
      %104 = arith.constant 3 : i64
      %103 = arith.andi %100, %104 : i64
      %105 = arith.constant 0 : i64
      %106 = arith.cmpi eq, %103, %105 : i64
      %108 = arith.constant 3 : i64
      %107 = arith.andi %102, %108 : i64
      %109 = arith.constant 0 : i64
      %110 = arith.cmpi eq, %107, %109 : i64
      %111 = arith.andi %106, %110 : i1
      %112 = scf.if %111 -> (i64) {
        %113 = arith.constant 2 : i64
        %114 = arith.shrsi %100, %113 : i64
        %115 = arith.constant 2 : i64
        %116 = arith.shrsi %102, %115 : i64
        %117 = arith.addi %114, %116 : i64
        %118 = arith.constant -2305843009213693952 : i64
        %119 = arith.constant 2305843009213693951 : i64
        %120 = arith.cmpi sge, %117, %118 : i64
        %121 = arith.cmpi sle, %117, %119 : i64
        %122 = arith.andi %120, %121 : i1
        %123 = scf.if %122 -> (i64) {
          %124 = arith.constant 2 : i64
          %125 = arith.shli %117, %124 : i64
          scf.yield %125 : i64
        } else {
          %126 = func.call @cc_add(%100, %102) : (i64, i64) -> i64
          scf.yield %126 : i64
        }
        scf.yield %123 : i64
      } else {
        %127 = func.call @cc_add(%100, %102) : (i64, i64) -> i64
        scf.yield %127 : i64
      }
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %128 = func.call @stack_pop_pointer() : () -> i64
      %129 = llvm.mlir.addressof @str12 : !llvm.ptr
      %130 = arith.constant 20 : i64
      %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
      %132 = llvm.mlir.addressof @str13 : !llvm.ptr
      %133 = arith.constant 11 : i64
      %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
      %135 = func.call @cc_intern(%131, %134) : (i64, i64) -> i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_cons(%135, %136) : (i64, i64) -> i64
      %138 = func.call @cc_values_pack(%137) : (i64) -> i64
      %139 = func.call @cc_symbol_value(%135) : (i64) -> i64
      func.call @stack_push_pointer(%139) : (i64) -> ()
      %140 = func.call @stack_pop_pointer() : () -> i64
      %141 = arith.constant 1 : i64
      %142 = func.call @cc_box_fixnum(%141) : (i64) -> i64
      %144 = arith.constant 3 : i64
      %143 = arith.andi %140, %144 : i64
      %145 = arith.constant 0 : i64
      %146 = arith.cmpi eq, %143, %145 : i64
      %148 = arith.constant 3 : i64
      %147 = arith.andi %142, %148 : i64
      %149 = arith.constant 0 : i64
      %150 = arith.cmpi eq, %147, %149 : i64
      %151 = arith.andi %146, %150 : i1
      %152 = scf.if %151 -> (i64) {
        %153 = arith.constant 2 : i64
        %154 = arith.shrsi %140, %153 : i64
        %155 = arith.constant 2 : i64
        %156 = arith.shrsi %142, %155 : i64
        %157 = arith.addi %154, %156 : i64
        %158 = arith.constant -2305843009213693952 : i64
        %159 = arith.constant 2305843009213693951 : i64
        %160 = arith.cmpi sge, %157, %158 : i64
        %161 = arith.cmpi sle, %157, %159 : i64
        %162 = arith.andi %160, %161 : i1
        %163 = scf.if %162 -> (i64) {
          %164 = arith.constant 2 : i64
          %165 = arith.shli %157, %164 : i64
          scf.yield %165 : i64
        } else {
          %166 = func.call @cc_add(%140, %142) : (i64, i64) -> i64
          scf.yield %166 : i64
        }
        scf.yield %163 : i64
      } else {
        %167 = func.call @cc_add(%140, %142) : (i64, i64) -> i64
        scf.yield %167 : i64
      }
      func.call @stack_push_pointer(%152) : (i64) -> ()
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_type_of(%168) : (i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = llvm.mlir.addressof @str14 : !llvm.ptr
      %172 = arith.constant 20 : i64
      %173 = func.call @cc_make_string(%171, %172) : (!llvm.ptr, i64) -> i64
      %174 = llvm.mlir.addressof @str15 : !llvm.ptr
      %175 = arith.constant 11 : i64
      %176 = func.call @cc_make_string(%174, %175) : (!llvm.ptr, i64) -> i64
      %177 = func.call @cc_intern(%173, %176) : (i64, i64) -> i64
      %178 = func.call @cc_nil_value() : () -> i64
      %179 = func.call @cc_cons(%177, %178) : (i64, i64) -> i64
      %180 = func.call @cc_values_pack(%179) : (i64) -> i64
      %181 = func.call @cc_symbol_value(%177) : (i64) -> i64
      func.call @stack_push_pointer(%181) : (i64) -> ()
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = llvm.mlir.addressof @str16 : !llvm.ptr
      %184 = arith.constant 20 : i64
      %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
      %186 = llvm.mlir.addressof @str17 : !llvm.ptr
      %187 = arith.constant 11 : i64
      %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
      %189 = func.call @cc_intern(%185, %188) : (i64, i64) -> i64
      %190 = func.call @cc_nil_value() : () -> i64
      %191 = func.call @cc_cons(%189, %190) : (i64, i64) -> i64
      %192 = func.call @cc_values_pack(%191) : (i64) -> i64
      %193 = func.call @cc_symbol_value(%189) : (i64) -> i64
      func.call @stack_push_pointer(%193) : (i64) -> ()
      %194 = func.call @stack_pop_pointer() : () -> i64
      %195 = arith.constant 1 : i64
      %196 = func.call @cc_box_fixnum(%195) : (i64) -> i64
      %198 = arith.constant 3 : i64
      %197 = arith.andi %194, %198 : i64
      %199 = arith.constant 0 : i64
      %200 = arith.cmpi eq, %197, %199 : i64
      %202 = arith.constant 3 : i64
      %201 = arith.andi %196, %202 : i64
      %203 = arith.constant 0 : i64
      %204 = arith.cmpi eq, %201, %203 : i64
      %205 = arith.andi %200, %204 : i1
      %206 = scf.if %205 -> (i64) {
        %207 = arith.constant 2 : i64
        %208 = arith.shrsi %194, %207 : i64
        %209 = arith.constant 2 : i64
        %210 = arith.shrsi %196, %209 : i64
        %211 = arith.subi %208, %210 : i64
        %212 = arith.constant -2305843009213693952 : i64
        %213 = arith.constant 2305843009213693951 : i64
        %214 = arith.cmpi sge, %211, %212 : i64
        %215 = arith.cmpi sle, %211, %213 : i64
        %216 = arith.andi %214, %215 : i1
        %217 = scf.if %216 -> (i64) {
          %218 = arith.constant 2 : i64
          %219 = arith.shli %211, %218 : i64
          scf.yield %219 : i64
        } else {
          %220 = func.call @cc_sub(%194, %196) : (i64, i64) -> i64
          scf.yield %220 : i64
        }
        scf.yield %217 : i64
      } else {
        %221 = func.call @cc_sub(%194, %196) : (i64, i64) -> i64
        scf.yield %221 : i64
      }
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = llvm.mlir.addressof @str18 : !llvm.ptr
      %224 = arith.constant 20 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = llvm.mlir.addressof @str19 : !llvm.ptr
      %227 = arith.constant 11 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_intern(%225, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      %233 = func.call @cc_symbol_value(%229) : (i64) -> i64
      func.call @stack_push_pointer(%233) : (i64) -> ()
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = arith.constant 1 : i64
      %236 = func.call @cc_box_fixnum(%235) : (i64) -> i64
      %238 = arith.constant 3 : i64
      %237 = arith.andi %234, %238 : i64
      %239 = arith.constant 0 : i64
      %240 = arith.cmpi eq, %237, %239 : i64
      %242 = arith.constant 3 : i64
      %241 = arith.andi %236, %242 : i64
      %243 = arith.constant 0 : i64
      %244 = arith.cmpi eq, %241, %243 : i64
      %245 = arith.andi %240, %244 : i1
      %246 = scf.if %245 -> (i64) {
        %247 = arith.constant 2 : i64
        %248 = arith.shrsi %234, %247 : i64
        %249 = arith.constant 2 : i64
        %250 = arith.shrsi %236, %249 : i64
        %251 = arith.subi %248, %250 : i64
        %252 = arith.constant -2305843009213693952 : i64
        %253 = arith.constant 2305843009213693951 : i64
        %254 = arith.cmpi sge, %251, %252 : i64
        %255 = arith.cmpi sle, %251, %253 : i64
        %256 = arith.andi %254, %255 : i1
        %257 = scf.if %256 -> (i64) {
          %258 = arith.constant 2 : i64
          %259 = arith.shli %251, %258 : i64
          scf.yield %259 : i64
        } else {
          %260 = func.call @cc_sub(%234, %236) : (i64, i64) -> i64
          scf.yield %260 : i64
        }
        scf.yield %257 : i64
      } else {
        %261 = func.call @cc_sub(%234, %236) : (i64, i64) -> i64
        scf.yield %261 : i64
      }
      func.call @stack_push_pointer(%246) : (i64) -> ()
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @cc_type_of(%262) : (i64) -> i64
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %264 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%72) : (i64) -> ()
      func.call @stack_push_pointer(%76) : (i64) -> ()
      func.call @stack_push_pointer(%88) : (i64) -> ()
      func.call @stack_push_pointer(%128) : (i64) -> ()
      func.call @stack_push_pointer(%170) : (i64) -> ()
      func.call @stack_push_pointer(%182) : (i64) -> ()
      func.call @stack_push_pointer(%222) : (i64) -> ()
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %265 = llvm.mlir.addressof @str20 : !llvm.ptr
      %266 = func.call @cc_make_function_ref_const(%265) : (!llvm.ptr) -> i64
      %267 = arith.constant 8 : i64
      func.call @cc_funcall_stack(%266, %267) : (i64, i64) -> ()
      %268 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %268 : i64
    }
    %269 = func.call @cc_nil_value() : () -> i64
    %270 = func.call @cc_errorp(%70) : (i64) -> i64
    %271 = arith.cmpi ne, %270, %269 : i64
    %272 = scf.if %271 -> (i64) {
      scf.yield %70 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%274) : (i64) -> ()
      %275 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%275) : (i64) -> ()
      %276 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%276) : (i64) -> ()
      %277 = arith.constant 60 : i64
      func.call @stack_push_fixnum(%277) : (i64) -> ()
      %278 = arith.constant 61 : i64
      func.call @stack_push_fixnum(%278) : (i64) -> ()
      %279 = arith.constant 62 : i64
      func.call @stack_push_fixnum(%279) : (i64) -> ()
      %280 = arith.constant 63 : i64
      func.call @stack_push_fixnum(%280) : (i64) -> ()
      %281 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%281) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %282 = func.call @stack_pop_pointer() : () -> i64
      %283 = func.call @stack_pop_pointer() : () -> i64
      %284 = func.call @cc_cons(%283, %282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      %285 = func.call @stack_pop_pointer() : () -> i64
      %286 = func.call @stack_pop_pointer() : () -> i64
      %287 = func.call @cc_cons(%286, %285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%287) : (i64) -> ()
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @stack_pop_pointer() : () -> i64
      %290 = func.call @cc_cons(%289, %288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%290) : (i64) -> ()
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @stack_pop_pointer() : () -> i64
      %293 = func.call @cc_cons(%292, %291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @cc_cons(%295, %294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%296) : (i64) -> ()
      %297 = func.call @stack_pop_pointer() : () -> i64
      %298 = func.call @stack_pop_pointer() : () -> i64
      %299 = func.call @cc_cons(%298, %297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      %300 = func.call @stack_pop_pointer() : () -> i64
      %301 = func.call @stack_pop_pointer() : () -> i64
      %302 = func.call @cc_cons(%301, %300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%302) : (i64) -> ()
      %303 = func.call @stack_pop_pointer() : () -> i64
      %304 = func.call @stack_pop_pointer() : () -> i64
      %305 = func.call @cc_cons(%304, %303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %307 = func.call @stack_pop_pointer() : () -> i64
      %308 = func.call @cc_nil_value() : () -> i64
      %309 = func.call @cc_nil_value() : () -> i64
      %310 = func.call @cc_errorp(%308) : (i64) -> i64
      %311 = arith.cmpi ne, %310, %309 : i64
      %312 = scf.if %311 -> (i64) {
        scf.yield %308 : i64
      } else {
        %313 = func.call @cc_nil_value() : () -> i64
        %314 = llvm.mlir.addressof @str21 : !llvm.ptr
        %315 = arith.constant 38 : i64
        %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
        %317 = func.call @cc_nil_value() : () -> i64
        %318 = func.call @cc_intern(%316, %317) : (i64, i64) -> i64
        %319 = func.call @cc_nil_value() : () -> i64
        %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
        %321 = func.call @cc_values_pack(%320) : (i64) -> i64
        %322 = func.call @cc_set_symbol_value(%318, %313) : (i64, i64) -> i64
        %323 = llvm.mlir.addressof @str22 : !llvm.ptr
        %324 = arith.constant 39 : i64
        %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
        %326 = func.call @cc_nil_value() : () -> i64
        %327 = func.call @cc_intern(%325, %326) : (i64, i64) -> i64
        %328 = func.call @cc_nil_value() : () -> i64
        %329 = func.call @cc_cons(%327, %328) : (i64, i64) -> i64
        %330 = func.call @cc_values_pack(%329) : (i64) -> i64
        %331 = func.call @cc_set_symbol_value(%327, %313) : (i64, i64) -> i64
        %332 = llvm.mlir.addressof @str23 : !llvm.ptr
        %333 = arith.constant 40 : i64
        %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
        %335 = func.call @cc_nil_value() : () -> i64
        %336 = func.call @cc_intern(%334, %335) : (i64, i64) -> i64
        %337 = func.call @cc_nil_value() : () -> i64
        %338 = func.call @cc_cons(%336, %337) : (i64, i64) -> i64
        %339 = func.call @cc_values_pack(%338) : (i64) -> i64
        %340 = func.call @cc_set_symbol_value(%336, %313) : (i64, i64) -> i64
        %341:3 = scf.while (%arg0 = %273, %arg1 = %307, %arg2 = %306) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %342 = func.call @stack_pop_pointer() : () -> i64
          %343 = func.call @cc_nil_value() : () -> i64
          %344 = arith.cmpi ne, %342, %343 : i64
          %345 = func.call @cc_nil_value() : () -> i64
          %346 = llvm.mlir.addressof @str24 : !llvm.ptr
          %347 = arith.constant 38 : i64
          %348 = func.call @cc_make_string(%346, %347) : (!llvm.ptr, i64) -> i64
          %349 = func.call @cc_nil_value() : () -> i64
          %350 = func.call @cc_intern(%348, %349) : (i64, i64) -> i64
          %351 = func.call @cc_nil_value() : () -> i64
          %352 = func.call @cc_cons(%350, %351) : (i64, i64) -> i64
          %353 = func.call @cc_values_pack(%352) : (i64) -> i64
          %354 = func.call @cc_symbol_value(%350) : (i64) -> i64
          %355 = arith.cmpi ne, %354, %345 : i64
          %356 = llvm.mlir.addressof @str25 : !llvm.ptr
          %357 = arith.constant 38 : i64
          %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
          %359 = func.call @cc_nil_value() : () -> i64
          %360 = func.call @cc_intern(%358, %359) : (i64, i64) -> i64
          %361 = func.call @cc_nil_value() : () -> i64
          %362 = func.call @cc_cons(%360, %361) : (i64, i64) -> i64
          %363 = func.call @cc_values_pack(%362) : (i64) -> i64
          %364 = func.call @cc_symbol_value(%360) : (i64) -> i64
          %365 = arith.cmpi ne, %364, %345 : i64
          %366 = arith.ori %355, %365 : i1
          %367 = arith.constant 0 : i1
          %368 = arith.cmpi eq, %366, %367 : i1
          %369 = arith.andi %344, %368 : i1
          scf.condition(%369) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%370: i64, %371: i64, %372: i64):
          %373 = func.call @cc_nil_value() : () -> i64
          %374 = func.call @cc_nil_value() : () -> i64
          %375 = func.call @cc_errorp(%373) : (i64) -> i64
          %376 = arith.cmpi ne, %375, %374 : i64
          %377:3 = scf.if %376 -> (i64, i64, i64) {
            scf.yield %373, %371, %370 : i64, i64, i64
          } else {
            %378 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%372) : (i64) -> ()
            %379 = func.call @stack_pop_pointer() : () -> i64
            %380 = func.call @cc_nil_value() : () -> i64
            %381 = arith.cmpi eq, %379, %380 : i64
            %383 = func.call @cc_t_value() : () -> i64
            %382 = arith.select %381, %383, %380 : i64
            func.call @stack_push_pointer(%382) : (i64) -> ()
            %384 = func.call @stack_pop_pointer() : () -> i64
            %385 = func.call @cc_nil_value() : () -> i64
            %386 = func.call @cc_cons(%384, %385) : (i64, i64) -> i64
            %387 = func.call @cc_not(%386) : (i64) -> i64
            func.call @stack_push_pointer(%387) : (i64) -> ()
            %388 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%372) : (i64) -> ()
            %389 = func.call @stack_pop_pointer() : () -> i64
            %390 = func.call @cc_is_cons(%389) : (i64) -> i32
            %391 = arith.constant 0 : i32
            %392 = arith.cmpi ne, %390, %391 : i32
            %393 = func.call @cc_t_value() : () -> i64
            %394 = func.call @cc_nil_value() : () -> i64
            %395 = arith.select %392, %393, %394 : i64
            func.call @stack_push_pointer(%395) : (i64) -> ()
            %396 = func.call @stack_pop_pointer() : () -> i64
            %397 = func.call @cc_nil_value() : () -> i64
            %398 = func.call @cc_cons(%396, %397) : (i64, i64) -> i64
            %399 = func.call @cc_not(%398) : (i64) -> i64
            func.call @stack_push_pointer(%399) : (i64) -> ()
            %400 = func.call @stack_pop_pointer() : () -> i64
            %401 = func.call @cc_cons(%400, %378) : (i64, i64) -> i64
            %402 = func.call @cc_cons(%388, %401) : (i64, i64) -> i64
            %403 = func.call @cc_and(%402) : (i64) -> i64
            func.call @stack_push_pointer(%403) : (i64) -> ()
            %404 = func.call @stack_pop_pointer() : () -> i64
            %405 = func.call @cc_nil_value() : () -> i64
            %406 = arith.cmpi ne, %404, %405 : i64
            scf.if %406 {
              %407 = llvm.mlir.addressof @str26 : !llvm.ptr
              %408 = arith.constant 10 : i64
              %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
              %410 = func.call @cc_nil_value() : () -> i64
              %411 = func.call @cc_intern(%409, %410) : (i64, i64) -> i64
              %412 = func.call @cc_nil_value() : () -> i64
              %413 = func.call @cc_cons(%411, %412) : (i64, i64) -> i64
              %414 = func.call @cc_values_pack(%413) : (i64) -> i64
              func.call @stack_push_pointer(%411) : (i64) -> ()
              %415 = func.call @stack_pop_pointer() : () -> i64
              %416 = func.call @cc_nil_value() : () -> i64
              %417 = func.call @cc_errorp(%415) : (i64) -> i64
              %418 = arith.cmpi ne, %417, %416 : i64
              %419 = arith.cmpi eq, %416, %416 : i64
              %420 = arith.andi %418, %419 : i1
              %421 = scf.if %420 -> (i64) {
                scf.yield %415 : i64
              } else {
                scf.yield %416 : i64
              }
              %422 = arith.cmpi ne, %421, %416 : i64
              scf.if %422 {
                func.call @stack_push_pointer(%421) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%415) : (i64) -> ()
                %423 = llvm.mlir.addressof @str27 : !llvm.ptr
                %424 = func.call @cc_make_function_ref_const(%423) : (!llvm.ptr) -> i64
                %425 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%424, %425) : (i64, i64) -> ()
              }
              %426 = func.call @stack_pop_pointer() : () -> i64
              %427 = func.call @cc_multiple_value_list(%426) : (i64) -> i64
              %428 = func.call @cc_t_value() : () -> i64
              %429 = llvm.mlir.addressof @str28 : !llvm.ptr
              %430 = arith.constant 38 : i64
              %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
              %432 = func.call @cc_nil_value() : () -> i64
              %433 = func.call @cc_intern(%431, %432) : (i64, i64) -> i64
              %434 = func.call @cc_nil_value() : () -> i64
              %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
              %436 = func.call @cc_values_pack(%435) : (i64) -> i64
              %437 = func.call @cc_set_symbol_value(%433, %428) : (i64, i64) -> i64
              %438 = llvm.mlir.addressof @str29 : !llvm.ptr
              %439 = arith.constant 39 : i64
              %440 = func.call @cc_make_string(%438, %439) : (!llvm.ptr, i64) -> i64
              %441 = func.call @cc_nil_value() : () -> i64
              %442 = func.call @cc_intern(%440, %441) : (i64, i64) -> i64
              %443 = func.call @cc_nil_value() : () -> i64
              %444 = func.call @cc_cons(%442, %443) : (i64, i64) -> i64
              %445 = func.call @cc_values_pack(%444) : (i64) -> i64
              %446 = func.call @cc_set_symbol_value(%442, %426) : (i64, i64) -> i64
              %447 = llvm.mlir.addressof @str30 : !llvm.ptr
              %448 = arith.constant 40 : i64
              %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
              %450 = func.call @cc_nil_value() : () -> i64
              %451 = func.call @cc_intern(%449, %450) : (i64, i64) -> i64
              %452 = func.call @cc_nil_value() : () -> i64
              %453 = func.call @cc_cons(%451, %452) : (i64, i64) -> i64
              %454 = func.call @cc_values_pack(%453) : (i64) -> i64
              %455 = func.call @cc_set_symbol_value(%451, %427) : (i64, i64) -> i64
              func.call @stack_push_pointer(%426) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %456 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %456, %371, %370 : i64, i64, i64
          }
          %457 = func.call @cc_nil_value() : () -> i64
          %458 = func.call @cc_errorp(%377#0) : (i64) -> i64
          %459 = arith.cmpi ne, %458, %457 : i64
          %460:3 = scf.if %459 -> (i64, i64, i64) {
            scf.yield %377#0, %377#1, %377#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%372) : (i64) -> ()
            %461 = func.call @stack_pop_pointer() : () -> i64
            %462 = func.call @cc_car(%461) : (i64) -> i64
            func.call @stack_push_pointer(%462) : (i64) -> ()
            %463 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%463) : (i64) -> ()
            %464 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %464, %377#1, %463 : i64, i64, i64
          }
          %465 = func.call @cc_nil_value() : () -> i64
          %466 = func.call @cc_errorp(%460#0) : (i64) -> i64
          %467 = arith.cmpi ne, %466, %465 : i64
          %468:3 = scf.if %467 -> (i64, i64, i64) {
            scf.yield %460#0, %460#1, %460#2 : i64, i64, i64
          } else {
            %469 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%469) : (i64) -> ()
            %470 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%460#2) : (i64) -> ()
            %471 = func.call @stack_pop_pointer() : () -> i64
            %472 = func.call @cc_nil_value() : () -> i64
            %473 = func.call @cc_errorp(%470) : (i64) -> i64
            %474 = arith.cmpi ne, %473, %472 : i64
            %475 = arith.cmpi eq, %472, %472 : i64
            %476 = arith.andi %474, %475 : i1
            %477 = scf.if %476 -> (i64) {
              scf.yield %470 : i64
            } else {
              scf.yield %472 : i64
            }
            %478 = func.call @cc_errorp(%471) : (i64) -> i64
            %479 = arith.cmpi ne, %478, %472 : i64
            %480 = arith.cmpi eq, %477, %472 : i64
            %481 = arith.andi %479, %480 : i1
            %482 = scf.if %481 -> (i64) {
              scf.yield %471 : i64
            } else {
              scf.yield %477 : i64
            }
            %483 = arith.cmpi ne, %482, %472 : i64
            scf.if %483 {
              func.call @stack_push_pointer(%482) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%470) : (i64) -> ()
              func.call @stack_push_pointer(%471) : (i64) -> ()
              %484 = llvm.mlir.addressof @str31 : !llvm.ptr
              %485 = func.call @cc_make_function_ref_const(%484) : (!llvm.ptr) -> i64
              %486 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%485, %486) : (i64, i64) -> ()
            }
            %487 = func.call @stack_pop_pointer() : () -> i64
            %488 = arith.constant 1 : i64
            %489 = func.call @cc_box_fixnum(%488) : (i64) -> i64
            %491 = arith.constant 3 : i64
            %490 = arith.andi %487, %491 : i64
            %492 = arith.constant 0 : i64
            %493 = arith.cmpi eq, %490, %492 : i64
            %495 = arith.constant 3 : i64
            %494 = arith.andi %489, %495 : i64
            %496 = arith.constant 0 : i64
            %497 = arith.cmpi eq, %494, %496 : i64
            %498 = arith.andi %493, %497 : i1
            %499 = scf.if %498 -> (i64) {
              %500 = arith.constant 2 : i64
              %501 = arith.shrsi %487, %500 : i64
              %502 = arith.constant 2 : i64
              %503 = arith.shrsi %489, %502 : i64
              %504 = arith.subi %501, %503 : i64
              %505 = arith.constant -2305843009213693952 : i64
              %506 = arith.constant 2305843009213693951 : i64
              %507 = arith.cmpi sge, %504, %505 : i64
              %508 = arith.cmpi sle, %504, %506 : i64
              %509 = arith.andi %507, %508 : i1
              %510 = scf.if %509 -> (i64) {
                %511 = arith.constant 2 : i64
                %512 = arith.shli %504, %511 : i64
                scf.yield %512 : i64
              } else {
                %513 = func.call @cc_sub(%487, %489) : (i64, i64) -> i64
                scf.yield %513 : i64
              }
              scf.yield %510 : i64
            } else {
              %514 = func.call @cc_sub(%487, %489) : (i64, i64) -> i64
              scf.yield %514 : i64
            }
            func.call @stack_push_pointer(%499) : (i64) -> ()
            %515 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%515) : (i64) -> ()
            %516 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %516, %515, %460#2 : i64, i64, i64
          }
          %517 = func.call @cc_nil_value() : () -> i64
          %518 = func.call @cc_errorp(%468#0) : (i64) -> i64
          %519 = arith.cmpi ne, %518, %517 : i64
          %520:3 = scf.if %519 -> (i64, i64, i64) {
            scf.yield %468#0, %468#1, %468#2 : i64, i64, i64
          } else {
            %521 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%521) : (i64) -> ()
            %522 = func.call @stack_pop_pointer() : () -> i64
            %523 = llvm.mlir.addressof @str32 : !llvm.ptr
            %524 = arith.constant 50 : i64
            %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%525) : (i64) -> ()
            %526 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%468#2) : (i64) -> ()
            %527 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%468#1) : (i64) -> ()
            %528 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%468#1) : (i64) -> ()
            %529 = func.call @stack_pop_pointer() : () -> i64
            %530 = func.call @cc_nil_value() : () -> i64
            %531 = func.call @cc_errorp(%529) : (i64) -> i64
            %532 = arith.cmpi ne, %531, %530 : i64
            %533 = arith.cmpi eq, %530, %530 : i64
            %534 = arith.andi %532, %533 : i1
            %535 = scf.if %534 -> (i64) {
              scf.yield %529 : i64
            } else {
              scf.yield %530 : i64
            }
            %536 = arith.cmpi ne, %535, %530 : i64
            scf.if %536 {
              func.call @stack_push_pointer(%535) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%529) : (i64) -> ()
              %537 = llvm.mlir.addressof @str33 : !llvm.ptr
              %538 = func.call @cc_make_function_ref_const(%537) : (!llvm.ptr) -> i64
              %539 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%538, %539) : (i64, i64) -> ()
            }
            %540 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%468#2) : (i64) -> ()
            %541 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%468#1) : (i64) -> ()
            %542 = func.call @stack_pop_pointer() : () -> i64
            %543 = func.call @cc_nil_value() : () -> i64
            %544 = func.call @cc_errorp(%542) : (i64) -> i64
            %545 = arith.cmpi ne, %544, %543 : i64
            %546 = arith.cmpi eq, %543, %543 : i64
            %547 = arith.andi %545, %546 : i1
            %548 = scf.if %547 -> (i64) {
              scf.yield %542 : i64
            } else {
              scf.yield %543 : i64
            }
            %549 = arith.cmpi ne, %548, %543 : i64
            scf.if %549 {
              func.call @stack_push_pointer(%548) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%542) : (i64) -> ()
              %550 = llvm.mlir.addressof @str34 : !llvm.ptr
              %551 = func.call @cc_make_function_ref_const(%550) : (!llvm.ptr) -> i64
              %552 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%551, %552) : (i64, i64) -> ()
            }
            %553 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%468#2) : (i64) -> ()
            %554 = func.call @stack_pop_pointer() : () -> i64
            %555 = arith.constant 1 : i1
            %557 = arith.constant 3 : i64
            %556 = arith.andi %553, %557 : i64
            %558 = arith.constant 0 : i64
            %559 = arith.cmpi eq, %556, %558 : i64
            %561 = arith.constant 3 : i64
            %560 = arith.andi %554, %561 : i64
            %562 = arith.constant 0 : i64
            %563 = arith.cmpi eq, %560, %562 : i64
            %564 = arith.andi %559, %563 : i1
            %565 = scf.if %564 -> (i1) {
              %566 = arith.constant 2 : i64
              %567 = arith.shrsi %553, %566 : i64
              %568 = arith.constant 2 : i64
              %569 = arith.shrsi %554, %568 : i64
              %570 = arith.cmpi eq, %567, %569 : i64
              scf.yield %570 : i1
            } else {
              %571 = func.call @cc_eq(%553, %554) : (i64, i64) -> i64
              %572 = func.call @cc_nil_value() : () -> i64
              %573 = arith.cmpi ne, %571, %572 : i64
              scf.yield %573 : i1
            }
            %574 = arith.andi %555, %565 : i1
            %575 = func.call @cc_nil_value() : () -> i64
            %576 = func.call @cc_t_value() : () -> i64
            %577 = scf.if %574 -> (i64) {
              scf.yield %576 : i64
            } else {
              scf.yield %575 : i64
            }
            func.call @stack_push_pointer(%577) : (i64) -> ()
            %578 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%522) : (i64) -> ()
            func.call @stack_push_pointer(%526) : (i64) -> ()
            func.call @stack_push_pointer(%527) : (i64) -> ()
            func.call @stack_push_pointer(%528) : (i64) -> ()
            func.call @stack_push_pointer(%540) : (i64) -> ()
            func.call @stack_push_pointer(%541) : (i64) -> ()
            func.call @stack_push_pointer(%578) : (i64) -> ()
            %579 = llvm.mlir.addressof @str35 : !llvm.ptr
            %580 = func.call @cc_make_function_ref_const(%579) : (!llvm.ptr) -> i64
            %581 = arith.constant 7 : i64
            func.call @cc_funcall_stack(%580, %581) : (i64, i64) -> ()
            %582 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %582, %468#1, %468#2 : i64, i64, i64
          }
          func.call @stack_push_pointer(%520#0) : (i64) -> ()
          %583 = func.call @stack_depth() : () -> i64
          %584 = arith.constant 0 : i64
          %585 = arith.cmpi sgt, %583, %584 : i64
          scf.if %585 {
            %586 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%372) : (i64) -> ()
          %587 = func.call @stack_pop_pointer() : () -> i64
          %588 = func.call @cc_cdr(%587) : (i64) -> i64
          func.call @stack_push_pointer(%588) : (i64) -> ()
          %589 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%589) : (i64) -> ()
          %590 = func.call @stack_depth() : () -> i64
          %591 = arith.constant 0 : i64
          %592 = arith.cmpi sgt, %590, %591 : i64
          scf.if %592 {
            %593 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %520#2, %520#1, %589 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %594 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %595 = func.call @stack_pop_pointer() : () -> i64
        %596 = func.call @cc_multiple_value_list(%595) : (i64) -> i64
        %597 = llvm.mlir.addressof @str36 : !llvm.ptr
        %598 = arith.constant 38 : i64
        %599 = func.call @cc_make_string(%597, %598) : (!llvm.ptr, i64) -> i64
        %600 = func.call @cc_nil_value() : () -> i64
        %601 = func.call @cc_intern(%599, %600) : (i64, i64) -> i64
        %602 = func.call @cc_nil_value() : () -> i64
        %603 = func.call @cc_cons(%601, %602) : (i64, i64) -> i64
        %604 = func.call @cc_values_pack(%603) : (i64) -> i64
        %605 = func.call @cc_symbol_value(%601) : (i64) -> i64
        %606 = llvm.mlir.addressof @str37 : !llvm.ptr
        %607 = arith.constant 39 : i64
        %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
        %609 = func.call @cc_nil_value() : () -> i64
        %610 = func.call @cc_intern(%608, %609) : (i64, i64) -> i64
        %611 = func.call @cc_nil_value() : () -> i64
        %612 = func.call @cc_cons(%610, %611) : (i64, i64) -> i64
        %613 = func.call @cc_values_pack(%612) : (i64) -> i64
        %614 = func.call @cc_symbol_value(%610) : (i64) -> i64
        %615 = llvm.mlir.addressof @str38 : !llvm.ptr
        %616 = arith.constant 40 : i64
        %617 = func.call @cc_make_string(%615, %616) : (!llvm.ptr, i64) -> i64
        %618 = func.call @cc_nil_value() : () -> i64
        %619 = func.call @cc_intern(%617, %618) : (i64, i64) -> i64
        %620 = func.call @cc_nil_value() : () -> i64
        %621 = func.call @cc_cons(%619, %620) : (i64, i64) -> i64
        %622 = func.call @cc_values_pack(%621) : (i64) -> i64
        %623 = func.call @cc_symbol_value(%619) : (i64) -> i64
        %624 = func.call @cc_nil_value() : () -> i64
        %625 = arith.cmpi ne, %605, %624 : i64
        %626 = scf.if %625 -> (i64) {
          scf.yield %623 : i64
        } else {
          scf.yield %596 : i64
        }
        %627 = func.call @cc_values_pack(%626) : (i64) -> i64
        func.call @stack_push_pointer(%627) : (i64) -> ()
        %628 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %628 : i64
      }
      func.call @stack_push_pointer(%312) : (i64) -> ()
      %629 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %629 : i64
    }
    %630 = func.call @cc_nil_value() : () -> i64
    %631 = func.call @cc_errorp(%272) : (i64) -> i64
    %632 = arith.cmpi ne, %631, %630 : i64
    %633 = scf.if %632 -> (i64) {
      scf.yield %272 : i64
    } else {
      %634 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%634) : (i64) -> ()
      %635 = func.call @stack_pop_pointer() : () -> i64
      %636 = llvm.mlir.addressof @str39 : !llvm.ptr
      %637 = arith.constant 26 : i64
      %638 = func.call @cc_make_string(%636, %637) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%638) : (i64) -> ()
      %639 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%635) : (i64) -> ()
      func.call @stack_push_pointer(%639) : (i64) -> ()
      %640 = llvm.mlir.addressof @str40 : !llvm.ptr
      %641 = func.call @cc_make_function_ref_const(%640) : (!llvm.ptr) -> i64
      %642 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%641, %642) : (i64, i64) -> ()
      %643 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %643 : i64
    }
    %644 = func.call @cc_nil_value() : () -> i64
    %645 = func.call @cc_errorp(%633) : (i64) -> i64
    %646 = arith.cmpi ne, %645, %644 : i64
    %647 = scf.if %646 -> (i64) {
      scf.yield %633 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %648 = func.call @stack_pop_pointer() : () -> i64
      %649 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%649) : (i64) -> ()
      %650 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%650) : (i64) -> ()
      %651 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%651) : (i64) -> ()
      %652 = arith.constant 60 : i64
      func.call @stack_push_fixnum(%652) : (i64) -> ()
      %653 = arith.constant 61 : i64
      func.call @stack_push_fixnum(%653) : (i64) -> ()
      %654 = arith.constant 62 : i64
      func.call @stack_push_fixnum(%654) : (i64) -> ()
      %655 = arith.constant 63 : i64
      func.call @stack_push_fixnum(%655) : (i64) -> ()
      %656 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %657 = func.call @stack_pop_pointer() : () -> i64
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @cc_cons(%658, %657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%659) : (i64) -> ()
      %660 = func.call @stack_pop_pointer() : () -> i64
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @cc_cons(%661, %660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %663 = func.call @stack_pop_pointer() : () -> i64
      %664 = func.call @stack_pop_pointer() : () -> i64
      %665 = func.call @cc_cons(%664, %663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%665) : (i64) -> ()
      %666 = func.call @stack_pop_pointer() : () -> i64
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @cc_cons(%667, %666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%668) : (i64) -> ()
      %669 = func.call @stack_pop_pointer() : () -> i64
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @cc_cons(%670, %669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %672 = func.call @stack_pop_pointer() : () -> i64
      %673 = func.call @stack_pop_pointer() : () -> i64
      %674 = func.call @cc_cons(%673, %672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%674) : (i64) -> ()
      %675 = func.call @stack_pop_pointer() : () -> i64
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @cc_cons(%676, %675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%677) : (i64) -> ()
      %678 = func.call @stack_pop_pointer() : () -> i64
      %679 = func.call @stack_pop_pointer() : () -> i64
      %680 = func.call @cc_cons(%679, %678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%680) : (i64) -> ()
      %681 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_nil_value() : () -> i64
      %685 = func.call @cc_errorp(%683) : (i64) -> i64
      %686 = arith.cmpi ne, %685, %684 : i64
      %687 = scf.if %686 -> (i64) {
        scf.yield %683 : i64
      } else {
        %688 = func.call @cc_nil_value() : () -> i64
        %689 = llvm.mlir.addressof @str41 : !llvm.ptr
        %690 = arith.constant 38 : i64
        %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
        %692 = func.call @cc_nil_value() : () -> i64
        %693 = func.call @cc_intern(%691, %692) : (i64, i64) -> i64
        %694 = func.call @cc_nil_value() : () -> i64
        %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
        %696 = func.call @cc_values_pack(%695) : (i64) -> i64
        %697 = func.call @cc_set_symbol_value(%693, %688) : (i64, i64) -> i64
        %698 = llvm.mlir.addressof @str42 : !llvm.ptr
        %699 = arith.constant 39 : i64
        %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
        %701 = func.call @cc_nil_value() : () -> i64
        %702 = func.call @cc_intern(%700, %701) : (i64, i64) -> i64
        %703 = func.call @cc_nil_value() : () -> i64
        %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
        %705 = func.call @cc_values_pack(%704) : (i64) -> i64
        %706 = func.call @cc_set_symbol_value(%702, %688) : (i64, i64) -> i64
        %707 = llvm.mlir.addressof @str43 : !llvm.ptr
        %708 = arith.constant 40 : i64
        %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
        %710 = func.call @cc_nil_value() : () -> i64
        %711 = func.call @cc_intern(%709, %710) : (i64, i64) -> i64
        %712 = func.call @cc_nil_value() : () -> i64
        %713 = func.call @cc_cons(%711, %712) : (i64, i64) -> i64
        %714 = func.call @cc_values_pack(%713) : (i64) -> i64
        %715 = func.call @cc_set_symbol_value(%711, %688) : (i64, i64) -> i64
        %716:3 = scf.while (%arg0 = %648, %arg1 = %682, %arg2 = %681) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %717 = func.call @stack_pop_pointer() : () -> i64
          %718 = func.call @cc_nil_value() : () -> i64
          %719 = arith.cmpi ne, %717, %718 : i64
          %720 = func.call @cc_nil_value() : () -> i64
          %721 = llvm.mlir.addressof @str44 : !llvm.ptr
          %722 = arith.constant 38 : i64
          %723 = func.call @cc_make_string(%721, %722) : (!llvm.ptr, i64) -> i64
          %724 = func.call @cc_nil_value() : () -> i64
          %725 = func.call @cc_intern(%723, %724) : (i64, i64) -> i64
          %726 = func.call @cc_nil_value() : () -> i64
          %727 = func.call @cc_cons(%725, %726) : (i64, i64) -> i64
          %728 = func.call @cc_values_pack(%727) : (i64) -> i64
          %729 = func.call @cc_symbol_value(%725) : (i64) -> i64
          %730 = arith.cmpi ne, %729, %720 : i64
          %731 = llvm.mlir.addressof @str45 : !llvm.ptr
          %732 = arith.constant 38 : i64
          %733 = func.call @cc_make_string(%731, %732) : (!llvm.ptr, i64) -> i64
          %734 = func.call @cc_nil_value() : () -> i64
          %735 = func.call @cc_intern(%733, %734) : (i64, i64) -> i64
          %736 = func.call @cc_nil_value() : () -> i64
          %737 = func.call @cc_cons(%735, %736) : (i64, i64) -> i64
          %738 = func.call @cc_values_pack(%737) : (i64) -> i64
          %739 = func.call @cc_symbol_value(%735) : (i64) -> i64
          %740 = arith.cmpi ne, %739, %720 : i64
          %741 = arith.ori %730, %740 : i1
          %742 = arith.constant 0 : i1
          %743 = arith.cmpi eq, %741, %742 : i1
          %744 = arith.andi %719, %743 : i1
          scf.condition(%744) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%745: i64, %746: i64, %747: i64):
          %748 = func.call @cc_nil_value() : () -> i64
          %749 = func.call @cc_nil_value() : () -> i64
          %750 = func.call @cc_errorp(%748) : (i64) -> i64
          %751 = arith.cmpi ne, %750, %749 : i64
          %752:3 = scf.if %751 -> (i64, i64, i64) {
            scf.yield %748, %746, %745 : i64, i64, i64
          } else {
            %753 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%747) : (i64) -> ()
            %754 = func.call @stack_pop_pointer() : () -> i64
            %755 = func.call @cc_nil_value() : () -> i64
            %756 = arith.cmpi eq, %754, %755 : i64
            %758 = func.call @cc_t_value() : () -> i64
            %757 = arith.select %756, %758, %755 : i64
            func.call @stack_push_pointer(%757) : (i64) -> ()
            %759 = func.call @stack_pop_pointer() : () -> i64
            %760 = func.call @cc_nil_value() : () -> i64
            %761 = func.call @cc_cons(%759, %760) : (i64, i64) -> i64
            %762 = func.call @cc_not(%761) : (i64) -> i64
            func.call @stack_push_pointer(%762) : (i64) -> ()
            %763 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%747) : (i64) -> ()
            %764 = func.call @stack_pop_pointer() : () -> i64
            %765 = func.call @cc_is_cons(%764) : (i64) -> i32
            %766 = arith.constant 0 : i32
            %767 = arith.cmpi ne, %765, %766 : i32
            %768 = func.call @cc_t_value() : () -> i64
            %769 = func.call @cc_nil_value() : () -> i64
            %770 = arith.select %767, %768, %769 : i64
            func.call @stack_push_pointer(%770) : (i64) -> ()
            %771 = func.call @stack_pop_pointer() : () -> i64
            %772 = func.call @cc_nil_value() : () -> i64
            %773 = func.call @cc_cons(%771, %772) : (i64, i64) -> i64
            %774 = func.call @cc_not(%773) : (i64) -> i64
            func.call @stack_push_pointer(%774) : (i64) -> ()
            %775 = func.call @stack_pop_pointer() : () -> i64
            %776 = func.call @cc_cons(%775, %753) : (i64, i64) -> i64
            %777 = func.call @cc_cons(%763, %776) : (i64, i64) -> i64
            %778 = func.call @cc_and(%777) : (i64) -> i64
            func.call @stack_push_pointer(%778) : (i64) -> ()
            %779 = func.call @stack_pop_pointer() : () -> i64
            %780 = func.call @cc_nil_value() : () -> i64
            %781 = arith.cmpi ne, %779, %780 : i64
            scf.if %781 {
              %782 = llvm.mlir.addressof @str46 : !llvm.ptr
              %783 = arith.constant 10 : i64
              %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
              %785 = func.call @cc_nil_value() : () -> i64
              %786 = func.call @cc_intern(%784, %785) : (i64, i64) -> i64
              %787 = func.call @cc_nil_value() : () -> i64
              %788 = func.call @cc_cons(%786, %787) : (i64, i64) -> i64
              %789 = func.call @cc_values_pack(%788) : (i64) -> i64
              func.call @stack_push_pointer(%786) : (i64) -> ()
              %790 = func.call @stack_pop_pointer() : () -> i64
              %791 = func.call @cc_nil_value() : () -> i64
              %792 = func.call @cc_errorp(%790) : (i64) -> i64
              %793 = arith.cmpi ne, %792, %791 : i64
              %794 = arith.cmpi eq, %791, %791 : i64
              %795 = arith.andi %793, %794 : i1
              %796 = scf.if %795 -> (i64) {
                scf.yield %790 : i64
              } else {
                scf.yield %791 : i64
              }
              %797 = arith.cmpi ne, %796, %791 : i64
              scf.if %797 {
                func.call @stack_push_pointer(%796) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%790) : (i64) -> ()
                %798 = llvm.mlir.addressof @str47 : !llvm.ptr
                %799 = func.call @cc_make_function_ref_const(%798) : (!llvm.ptr) -> i64
                %800 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%799, %800) : (i64, i64) -> ()
              }
              %801 = func.call @stack_pop_pointer() : () -> i64
              %802 = func.call @cc_multiple_value_list(%801) : (i64) -> i64
              %803 = func.call @cc_t_value() : () -> i64
              %804 = llvm.mlir.addressof @str48 : !llvm.ptr
              %805 = arith.constant 38 : i64
              %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
              %807 = func.call @cc_nil_value() : () -> i64
              %808 = func.call @cc_intern(%806, %807) : (i64, i64) -> i64
              %809 = func.call @cc_nil_value() : () -> i64
              %810 = func.call @cc_cons(%808, %809) : (i64, i64) -> i64
              %811 = func.call @cc_values_pack(%810) : (i64) -> i64
              %812 = func.call @cc_set_symbol_value(%808, %803) : (i64, i64) -> i64
              %813 = llvm.mlir.addressof @str49 : !llvm.ptr
              %814 = arith.constant 39 : i64
              %815 = func.call @cc_make_string(%813, %814) : (!llvm.ptr, i64) -> i64
              %816 = func.call @cc_nil_value() : () -> i64
              %817 = func.call @cc_intern(%815, %816) : (i64, i64) -> i64
              %818 = func.call @cc_nil_value() : () -> i64
              %819 = func.call @cc_cons(%817, %818) : (i64, i64) -> i64
              %820 = func.call @cc_values_pack(%819) : (i64) -> i64
              %821 = func.call @cc_set_symbol_value(%817, %801) : (i64, i64) -> i64
              %822 = llvm.mlir.addressof @str50 : !llvm.ptr
              %823 = arith.constant 40 : i64
              %824 = func.call @cc_make_string(%822, %823) : (!llvm.ptr, i64) -> i64
              %825 = func.call @cc_nil_value() : () -> i64
              %826 = func.call @cc_intern(%824, %825) : (i64, i64) -> i64
              %827 = func.call @cc_nil_value() : () -> i64
              %828 = func.call @cc_cons(%826, %827) : (i64, i64) -> i64
              %829 = func.call @cc_values_pack(%828) : (i64) -> i64
              %830 = func.call @cc_set_symbol_value(%826, %802) : (i64, i64) -> i64
              func.call @stack_push_pointer(%801) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %831 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %831, %746, %745 : i64, i64, i64
          }
          %832 = func.call @cc_nil_value() : () -> i64
          %833 = func.call @cc_errorp(%752#0) : (i64) -> i64
          %834 = arith.cmpi ne, %833, %832 : i64
          %835:3 = scf.if %834 -> (i64, i64, i64) {
            scf.yield %752#0, %752#1, %752#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%747) : (i64) -> ()
            %836 = func.call @stack_pop_pointer() : () -> i64
            %837 = func.call @cc_car(%836) : (i64) -> i64
            func.call @stack_push_pointer(%837) : (i64) -> ()
            %838 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%838) : (i64) -> ()
            %839 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %839, %752#1, %838 : i64, i64, i64
          }
          %840 = func.call @cc_nil_value() : () -> i64
          %841 = func.call @cc_errorp(%835#0) : (i64) -> i64
          %842 = arith.cmpi ne, %841, %840 : i64
          %843:3 = scf.if %842 -> (i64, i64, i64) {
            scf.yield %835#0, %835#1, %835#2 : i64, i64, i64
          } else {
            %844 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%844) : (i64) -> ()
            %845 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%835#2) : (i64) -> ()
            %846 = func.call @stack_pop_pointer() : () -> i64
            %847 = func.call @cc_nil_value() : () -> i64
            %848 = func.call @cc_errorp(%845) : (i64) -> i64
            %849 = arith.cmpi ne, %848, %847 : i64
            %850 = arith.cmpi eq, %847, %847 : i64
            %851 = arith.andi %849, %850 : i1
            %852 = scf.if %851 -> (i64) {
              scf.yield %845 : i64
            } else {
              scf.yield %847 : i64
            }
            %853 = func.call @cc_errorp(%846) : (i64) -> i64
            %854 = arith.cmpi ne, %853, %847 : i64
            %855 = arith.cmpi eq, %852, %847 : i64
            %856 = arith.andi %854, %855 : i1
            %857 = scf.if %856 -> (i64) {
              scf.yield %846 : i64
            } else {
              scf.yield %852 : i64
            }
            %858 = arith.cmpi ne, %857, %847 : i64
            scf.if %858 {
              func.call @stack_push_pointer(%857) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%845) : (i64) -> ()
              func.call @stack_push_pointer(%846) : (i64) -> ()
              %859 = llvm.mlir.addressof @str51 : !llvm.ptr
              %860 = func.call @cc_make_function_ref_const(%859) : (!llvm.ptr) -> i64
              %861 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%860, %861) : (i64, i64) -> ()
            }
            %862 = func.call @stack_pop_pointer() : () -> i64
            %863 = arith.constant 0 : i64
            %864 = func.call @cc_box_fixnum(%863) : (i64) -> i64
            %866 = arith.constant 3 : i64
            %865 = arith.andi %864, %866 : i64
            %867 = arith.constant 0 : i64
            %868 = arith.cmpi eq, %865, %867 : i64
            %870 = arith.constant 3 : i64
            %869 = arith.andi %862, %870 : i64
            %871 = arith.constant 0 : i64
            %872 = arith.cmpi eq, %869, %871 : i64
            %873 = arith.andi %868, %872 : i1
            %874 = scf.if %873 -> (i64) {
              %875 = arith.constant 2 : i64
              %876 = arith.shrsi %864, %875 : i64
              %877 = arith.constant 2 : i64
              %878 = arith.shrsi %862, %877 : i64
              %879 = arith.subi %876, %878 : i64
              %880 = arith.constant -2305843009213693952 : i64
              %881 = arith.constant 2305843009213693951 : i64
              %882 = arith.cmpi sge, %879, %880 : i64
              %883 = arith.cmpi sle, %879, %881 : i64
              %884 = arith.andi %882, %883 : i1
              %885 = scf.if %884 -> (i64) {
                %886 = arith.constant 2 : i64
                %887 = arith.shli %879, %886 : i64
                scf.yield %887 : i64
              } else {
                %888 = func.call @cc_sub(%864, %862) : (i64, i64) -> i64
                scf.yield %888 : i64
              }
              scf.yield %885 : i64
            } else {
              %889 = func.call @cc_sub(%864, %862) : (i64, i64) -> i64
              scf.yield %889 : i64
            }
            func.call @stack_push_pointer(%874) : (i64) -> ()
            %890 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%890) : (i64) -> ()
            %891 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %891, %890, %835#2 : i64, i64, i64
          }
          %892 = func.call @cc_nil_value() : () -> i64
          %893 = func.call @cc_errorp(%843#0) : (i64) -> i64
          %894 = arith.cmpi ne, %893, %892 : i64
          %895:3 = scf.if %894 -> (i64, i64, i64) {
            scf.yield %843#0, %843#1, %843#2 : i64, i64, i64
          } else {
            %896 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%896) : (i64) -> ()
            %897 = func.call @stack_pop_pointer() : () -> i64
            %898 = llvm.mlir.addressof @str52 : !llvm.ptr
            %899 = arith.constant 50 : i64
            %900 = func.call @cc_make_string(%898, %899) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%900) : (i64) -> ()
            %901 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%843#2) : (i64) -> ()
            %902 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%843#1) : (i64) -> ()
            %903 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%843#1) : (i64) -> ()
            %904 = func.call @stack_pop_pointer() : () -> i64
            %905 = func.call @cc_nil_value() : () -> i64
            %906 = func.call @cc_errorp(%904) : (i64) -> i64
            %907 = arith.cmpi ne, %906, %905 : i64
            %908 = arith.cmpi eq, %905, %905 : i64
            %909 = arith.andi %907, %908 : i1
            %910 = scf.if %909 -> (i64) {
              scf.yield %904 : i64
            } else {
              scf.yield %905 : i64
            }
            %911 = arith.cmpi ne, %910, %905 : i64
            scf.if %911 {
              func.call @stack_push_pointer(%910) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%904) : (i64) -> ()
              %912 = llvm.mlir.addressof @str53 : !llvm.ptr
              %913 = func.call @cc_make_function_ref_const(%912) : (!llvm.ptr) -> i64
              %914 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%913, %914) : (i64, i64) -> ()
            }
            %915 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%843#2) : (i64) -> ()
            %916 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%843#1) : (i64) -> ()
            %917 = func.call @stack_pop_pointer() : () -> i64
            %918 = func.call @cc_nil_value() : () -> i64
            %919 = func.call @cc_errorp(%917) : (i64) -> i64
            %920 = arith.cmpi ne, %919, %918 : i64
            %921 = arith.cmpi eq, %918, %918 : i64
            %922 = arith.andi %920, %921 : i1
            %923 = scf.if %922 -> (i64) {
              scf.yield %917 : i64
            } else {
              scf.yield %918 : i64
            }
            %924 = arith.cmpi ne, %923, %918 : i64
            scf.if %924 {
              func.call @stack_push_pointer(%923) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%917) : (i64) -> ()
              %925 = llvm.mlir.addressof @str54 : !llvm.ptr
              %926 = func.call @cc_make_function_ref_const(%925) : (!llvm.ptr) -> i64
              %927 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%926, %927) : (i64, i64) -> ()
            }
            %928 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%843#2) : (i64) -> ()
            %929 = func.call @stack_pop_pointer() : () -> i64
            %930 = arith.constant 1 : i1
            %932 = arith.constant 3 : i64
            %931 = arith.andi %928, %932 : i64
            %933 = arith.constant 0 : i64
            %934 = arith.cmpi eq, %931, %933 : i64
            %936 = arith.constant 3 : i64
            %935 = arith.andi %929, %936 : i64
            %937 = arith.constant 0 : i64
            %938 = arith.cmpi eq, %935, %937 : i64
            %939 = arith.andi %934, %938 : i1
            %940 = scf.if %939 -> (i1) {
              %941 = arith.constant 2 : i64
              %942 = arith.shrsi %928, %941 : i64
              %943 = arith.constant 2 : i64
              %944 = arith.shrsi %929, %943 : i64
              %945 = arith.cmpi eq, %942, %944 : i64
              scf.yield %945 : i1
            } else {
              %946 = func.call @cc_eq(%928, %929) : (i64, i64) -> i64
              %947 = func.call @cc_nil_value() : () -> i64
              %948 = arith.cmpi ne, %946, %947 : i64
              scf.yield %948 : i1
            }
            %949 = arith.andi %930, %940 : i1
            %950 = func.call @cc_nil_value() : () -> i64
            %951 = func.call @cc_t_value() : () -> i64
            %952 = scf.if %949 -> (i64) {
              scf.yield %951 : i64
            } else {
              scf.yield %950 : i64
            }
            func.call @stack_push_pointer(%952) : (i64) -> ()
            %953 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%897) : (i64) -> ()
            func.call @stack_push_pointer(%901) : (i64) -> ()
            func.call @stack_push_pointer(%902) : (i64) -> ()
            func.call @stack_push_pointer(%903) : (i64) -> ()
            func.call @stack_push_pointer(%915) : (i64) -> ()
            func.call @stack_push_pointer(%916) : (i64) -> ()
            func.call @stack_push_pointer(%953) : (i64) -> ()
            %954 = llvm.mlir.addressof @str55 : !llvm.ptr
            %955 = func.call @cc_make_function_ref_const(%954) : (!llvm.ptr) -> i64
            %956 = arith.constant 7 : i64
            func.call @cc_funcall_stack(%955, %956) : (i64, i64) -> ()
            %957 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %957, %843#1, %843#2 : i64, i64, i64
          }
          func.call @stack_push_pointer(%895#0) : (i64) -> ()
          %958 = func.call @stack_depth() : () -> i64
          %959 = arith.constant 0 : i64
          %960 = arith.cmpi sgt, %958, %959 : i64
          scf.if %960 {
            %961 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%747) : (i64) -> ()
          %962 = func.call @stack_pop_pointer() : () -> i64
          %963 = func.call @cc_cdr(%962) : (i64) -> i64
          func.call @stack_push_pointer(%963) : (i64) -> ()
          %964 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%964) : (i64) -> ()
          %965 = func.call @stack_depth() : () -> i64
          %966 = arith.constant 0 : i64
          %967 = arith.cmpi sgt, %965, %966 : i64
          scf.if %967 {
            %968 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %895#2, %895#1, %964 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %969 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %970 = func.call @stack_pop_pointer() : () -> i64
        %971 = func.call @cc_multiple_value_list(%970) : (i64) -> i64
        %972 = llvm.mlir.addressof @str56 : !llvm.ptr
        %973 = arith.constant 38 : i64
        %974 = func.call @cc_make_string(%972, %973) : (!llvm.ptr, i64) -> i64
        %975 = func.call @cc_nil_value() : () -> i64
        %976 = func.call @cc_intern(%974, %975) : (i64, i64) -> i64
        %977 = func.call @cc_nil_value() : () -> i64
        %978 = func.call @cc_cons(%976, %977) : (i64, i64) -> i64
        %979 = func.call @cc_values_pack(%978) : (i64) -> i64
        %980 = func.call @cc_symbol_value(%976) : (i64) -> i64
        %981 = llvm.mlir.addressof @str57 : !llvm.ptr
        %982 = arith.constant 39 : i64
        %983 = func.call @cc_make_string(%981, %982) : (!llvm.ptr, i64) -> i64
        %984 = func.call @cc_nil_value() : () -> i64
        %985 = func.call @cc_intern(%983, %984) : (i64, i64) -> i64
        %986 = func.call @cc_nil_value() : () -> i64
        %987 = func.call @cc_cons(%985, %986) : (i64, i64) -> i64
        %988 = func.call @cc_values_pack(%987) : (i64) -> i64
        %989 = func.call @cc_symbol_value(%985) : (i64) -> i64
        %990 = llvm.mlir.addressof @str58 : !llvm.ptr
        %991 = arith.constant 40 : i64
        %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
        %993 = func.call @cc_nil_value() : () -> i64
        %994 = func.call @cc_intern(%992, %993) : (i64, i64) -> i64
        %995 = func.call @cc_nil_value() : () -> i64
        %996 = func.call @cc_cons(%994, %995) : (i64, i64) -> i64
        %997 = func.call @cc_values_pack(%996) : (i64) -> i64
        %998 = func.call @cc_symbol_value(%994) : (i64) -> i64
        %999 = func.call @cc_nil_value() : () -> i64
        %1000 = arith.cmpi ne, %980, %999 : i64
        %1001 = scf.if %1000 -> (i64) {
          scf.yield %998 : i64
        } else {
          scf.yield %971 : i64
        }
        %1002 = func.call @cc_values_pack(%1001) : (i64) -> i64
        func.call @stack_push_pointer(%1002) : (i64) -> ()
        %1003 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1003 : i64
      }
      func.call @stack_push_pointer(%687) : (i64) -> ()
      %1004 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1004 : i64
    }
    %1005 = func.call @cc_nil_value() : () -> i64
    %1006 = func.call @cc_errorp(%647) : (i64) -> i64
    %1007 = arith.cmpi ne, %1006, %1005 : i64
    %1008 = scf.if %1007 -> (i64) {
      scf.yield %647 : i64
    } else {
      %1009 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      %1010 = func.call @stack_pop_pointer() : () -> i64
      %1011 = llvm.mlir.addressof @str59 : !llvm.ptr
      %1012 = arith.constant 27 : i64
      %1013 = func.call @cc_make_string(%1011, %1012) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1013) : (i64) -> ()
      %1014 = func.call @stack_pop_pointer() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1015 = llvm.mlir.addressof @str60 : !llvm.ptr
      %1016 = arith.constant 19 : i64
      %1017 = func.call @cc_parse_bignum(%1015, %1016) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1017) : (i64) -> ()
      %1018 = func.call @stack_pop_pointer() : () -> i64
      %1019 = arith.constant -2305843009213693952 : i64
      func.call @stack_push_fixnum(%1019) : (i64) -> ()
      %1020 = func.call @stack_pop_pointer() : () -> i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_errorp(%1018) : (i64) -> i64
      %1023 = arith.cmpi ne, %1022, %1021 : i64
      %1024 = arith.cmpi eq, %1021, %1021 : i64
      %1025 = arith.andi %1023, %1024 : i1
      %1026 = scf.if %1025 -> (i64) {
        scf.yield %1018 : i64
      } else {
        scf.yield %1021 : i64
      }
      %1027 = func.call @cc_errorp(%1020) : (i64) -> i64
      %1028 = arith.cmpi ne, %1027, %1021 : i64
      %1029 = arith.cmpi eq, %1026, %1021 : i64
      %1030 = arith.andi %1028, %1029 : i1
      %1031 = scf.if %1030 -> (i64) {
        scf.yield %1020 : i64
      } else {
        scf.yield %1026 : i64
      }
      %1032 = arith.cmpi ne, %1031, %1021 : i64
      scf.if %1032 {
        func.call @stack_push_pointer(%1031) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1018) : (i64) -> ()
        func.call @stack_push_pointer(%1020) : (i64) -> ()
        %1033 = llvm.mlir.addressof @str61 : !llvm.ptr
        %1034 = func.call @cc_make_function_ref_const(%1033) : (!llvm.ptr) -> i64
        %1035 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1034, %1035) : (i64, i64) -> ()
      }
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @cc_errorp(%1036) : (i64) -> i64
      %1038 = func.call @cc_nil_value() : () -> i64
      %1039 = arith.cmpi ne, %1037, %1038 : i64
      scf.if %1039 {
        func.call @stack_push_pointer(%1036) : (i64) -> ()
      } else {
        %1040 = func.call @cc_multiple_value_list(%1036) : (i64) -> i64
        func.call @stack_push_pointer(%1040) : (i64) -> ()
      }
      %1041 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      func.call @stack_push_pointer(%1014) : (i64) -> ()
      func.call @stack_push_pointer(%1041) : (i64) -> ()
      %1042 = llvm.mlir.addressof @str62 : !llvm.ptr
      %1043 = func.call @cc_make_function_ref_const(%1042) : (!llvm.ptr) -> i64
      %1044 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1043, %1044) : (i64, i64) -> ()
      %1045 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1045 : i64
    }
    %1046 = func.call @cc_nil_value() : () -> i64
    %1047 = func.call @cc_errorp(%1008) : (i64) -> i64
    %1048 = arith.cmpi ne, %1047, %1046 : i64
    %1049 = scf.if %1048 -> (i64) {
      scf.yield %1008 : i64
    } else {
      %1050 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1050) : (i64) -> ()
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = llvm.mlir.addressof @str63 : !llvm.ptr
      %1053 = arith.constant 27 : i64
      %1054 = func.call @cc_make_string(%1052, %1053) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1054) : (i64) -> ()
      %1055 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = llvm.mlir.addressof @str64 : !llvm.ptr
      %1058 = arith.constant 5 : i64
      %1059 = func.call @cc_make_string(%1057, %1058) : (!llvm.ptr, i64) -> i64
      %1060 = llvm.mlir.addressof @str65 : !llvm.ptr
      %1061 = arith.constant 11 : i64
      %1062 = func.call @cc_make_string(%1060, %1061) : (!llvm.ptr, i64) -> i64
      %1063 = func.call @cc_intern(%1059, %1062) : (i64, i64) -> i64
      %1064 = func.call @cc_nil_value() : () -> i64
      %1065 = func.call @cc_cons(%1063, %1064) : (i64, i64) -> i64
      %1066 = func.call @cc_values_pack(%1065) : (i64) -> i64
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1067 = llvm.mlir.addressof @str66 : !llvm.ptr
      %1068 = arith.constant 7 : i64
      %1069 = func.call @cc_make_string(%1067, %1068) : (!llvm.ptr, i64) -> i64
      %1070 = llvm.mlir.addressof @str67 : !llvm.ptr
      %1071 = arith.constant 11 : i64
      %1072 = func.call @cc_make_string(%1070, %1071) : (!llvm.ptr, i64) -> i64
      %1073 = func.call @cc_intern(%1069, %1072) : (i64, i64) -> i64
      %1074 = func.call @cc_nil_value() : () -> i64
      %1075 = func.call @cc_cons(%1073, %1074) : (i64, i64) -> i64
      %1076 = func.call @cc_values_pack(%1075) : (i64) -> i64
      func.call @stack_push_pointer(%1073) : (i64) -> ()
      %1077 = llvm.mlir.addressof @str68 : !llvm.ptr
      %1078 = arith.constant 8 : i64
      %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
      %1080 = llvm.mlir.addressof @str69 : !llvm.ptr
      %1081 = arith.constant 11 : i64
      %1082 = func.call @cc_make_string(%1080, %1081) : (!llvm.ptr, i64) -> i64
      %1083 = func.call @cc_intern(%1079, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_cons(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_values_pack(%1085) : (i64) -> i64
      func.call @stack_push_pointer(%1083) : (i64) -> ()
      %1087 = llvm.mlir.addressof @str70 : !llvm.ptr
      %1088 = arith.constant 5 : i64
      %1089 = func.call @cc_make_string(%1087, %1088) : (!llvm.ptr, i64) -> i64
      %1090 = llvm.mlir.addressof @str71 : !llvm.ptr
      %1091 = arith.constant 11 : i64
      %1092 = func.call @cc_make_string(%1090, %1091) : (!llvm.ptr, i64) -> i64
      %1093 = func.call @cc_intern(%1089, %1092) : (i64, i64) -> i64
      %1094 = func.call @cc_nil_value() : () -> i64
      %1095 = func.call @cc_cons(%1093, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_values_pack(%1095) : (i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      %1097 = llvm.mlir.addressof @str72 : !llvm.ptr
      %1098 = arith.constant 6 : i64
      %1099 = func.call @cc_make_string(%1097, %1098) : (!llvm.ptr, i64) -> i64
      %1100 = llvm.mlir.addressof @str73 : !llvm.ptr
      %1101 = arith.constant 11 : i64
      %1102 = func.call @cc_make_string(%1100, %1101) : (!llvm.ptr, i64) -> i64
      %1103 = func.call @cc_intern(%1099, %1102) : (i64, i64) -> i64
      %1104 = func.call @cc_nil_value() : () -> i64
      %1105 = func.call @cc_cons(%1103, %1104) : (i64, i64) -> i64
      %1106 = func.call @cc_values_pack(%1105) : (i64) -> i64
      func.call @stack_push_pointer(%1103) : (i64) -> ()
      %1107 = llvm.mlir.addressof @str74 : !llvm.ptr
      %1108 = arith.constant 8 : i64
      %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
      %1110 = llvm.mlir.addressof @str75 : !llvm.ptr
      %1111 = arith.constant 11 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = func.call @cc_intern(%1109, %1112) : (i64, i64) -> i64
      %1114 = func.call @cc_nil_value() : () -> i64
      %1115 = func.call @cc_cons(%1113, %1114) : (i64, i64) -> i64
      %1116 = func.call @cc_values_pack(%1115) : (i64) -> i64
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      %1117 = llvm.mlir.addressof @str76 : !llvm.ptr
      %1118 = arith.constant 9 : i64
      %1119 = func.call @cc_make_string(%1117, %1118) : (!llvm.ptr, i64) -> i64
      %1120 = llvm.mlir.addressof @str77 : !llvm.ptr
      %1121 = arith.constant 11 : i64
      %1122 = func.call @cc_make_string(%1120, %1121) : (!llvm.ptr, i64) -> i64
      %1123 = func.call @cc_intern(%1119, %1122) : (i64, i64) -> i64
      %1124 = func.call @cc_nil_value() : () -> i64
      %1125 = func.call @cc_cons(%1123, %1124) : (i64, i64) -> i64
      %1126 = func.call @cc_values_pack(%1125) : (i64) -> i64
      func.call @stack_push_pointer(%1123) : (i64) -> ()
      %1127 = llvm.mlir.addressof @str78 : !llvm.ptr
      %1128 = arith.constant 6 : i64
      %1129 = func.call @cc_make_string(%1127, %1128) : (!llvm.ptr, i64) -> i64
      %1130 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1131 = arith.constant 11 : i64
      %1132 = func.call @cc_make_string(%1130, %1131) : (!llvm.ptr, i64) -> i64
      %1133 = func.call @cc_intern(%1129, %1132) : (i64, i64) -> i64
      %1134 = func.call @cc_nil_value() : () -> i64
      %1135 = func.call @cc_cons(%1133, %1134) : (i64, i64) -> i64
      %1136 = func.call @cc_values_pack(%1135) : (i64) -> i64
      func.call @stack_push_pointer(%1133) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1137 = func.call @stack_pop_pointer() : () -> i64
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @cc_cons(%1138, %1137) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1139) : (i64) -> ()
      %1140 = func.call @stack_pop_pointer() : () -> i64
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @cc_cons(%1141, %1140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1142) : (i64) -> ()
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @cc_cons(%1144, %1143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1145) : (i64) -> ()
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @cc_cons(%1147, %1146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1148) : (i64) -> ()
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @cc_cons(%1150, %1149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1151) : (i64) -> ()
      %1152 = func.call @stack_pop_pointer() : () -> i64
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @cc_cons(%1153, %1152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1154) : (i64) -> ()
      %1155 = func.call @stack_pop_pointer() : () -> i64
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @cc_cons(%1156, %1155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1157) : (i64) -> ()
      %1158 = func.call @stack_pop_pointer() : () -> i64
      %1159 = func.call @stack_pop_pointer() : () -> i64
      %1160 = func.call @cc_cons(%1159, %1158) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1160) : (i64) -> ()
      %1161 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1162 = func.call @stack_pop_pointer() : () -> i64
      %1163 = func.call @cc_nil_value() : () -> i64
      %1164 = func.call @cc_nil_value() : () -> i64
      %1165 = func.call @cc_errorp(%1163) : (i64) -> i64
      %1166 = arith.cmpi ne, %1165, %1164 : i64
      %1167 = scf.if %1166 -> (i64) {
        scf.yield %1163 : i64
      } else {
        %1168 = func.call @cc_nil_value() : () -> i64
        %1169 = llvm.mlir.addressof @str80 : !llvm.ptr
        %1170 = arith.constant 38 : i64
        %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
        %1172 = func.call @cc_nil_value() : () -> i64
        %1173 = func.call @cc_intern(%1171, %1172) : (i64, i64) -> i64
        %1174 = func.call @cc_nil_value() : () -> i64
        %1175 = func.call @cc_cons(%1173, %1174) : (i64, i64) -> i64
        %1176 = func.call @cc_values_pack(%1175) : (i64) -> i64
        %1177 = func.call @cc_set_symbol_value(%1173, %1168) : (i64, i64) -> i64
        %1178 = llvm.mlir.addressof @str81 : !llvm.ptr
        %1179 = arith.constant 39 : i64
        %1180 = func.call @cc_make_string(%1178, %1179) : (!llvm.ptr, i64) -> i64
        %1181 = func.call @cc_nil_value() : () -> i64
        %1182 = func.call @cc_intern(%1180, %1181) : (i64, i64) -> i64
        %1183 = func.call @cc_nil_value() : () -> i64
        %1184 = func.call @cc_cons(%1182, %1183) : (i64, i64) -> i64
        %1185 = func.call @cc_values_pack(%1184) : (i64) -> i64
        %1186 = func.call @cc_set_symbol_value(%1182, %1168) : (i64, i64) -> i64
        %1187 = llvm.mlir.addressof @str82 : !llvm.ptr
        %1188 = arith.constant 40 : i64
        %1189 = func.call @cc_make_string(%1187, %1188) : (!llvm.ptr, i64) -> i64
        %1190 = func.call @cc_nil_value() : () -> i64
        %1191 = func.call @cc_intern(%1189, %1190) : (i64, i64) -> i64
        %1192 = func.call @cc_nil_value() : () -> i64
        %1193 = func.call @cc_cons(%1191, %1192) : (i64, i64) -> i64
        %1194 = func.call @cc_values_pack(%1193) : (i64) -> i64
        %1195 = func.call @cc_set_symbol_value(%1191, %1168) : (i64, i64) -> i64
        %1196:3 = scf.while (%arg0 = %1056, %arg1 = %1162, %arg2 = %1161) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %1197 = func.call @stack_pop_pointer() : () -> i64
          %1198 = func.call @cc_nil_value() : () -> i64
          %1199 = arith.cmpi ne, %1197, %1198 : i64
          %1200 = func.call @cc_nil_value() : () -> i64
          %1201 = llvm.mlir.addressof @str83 : !llvm.ptr
          %1202 = arith.constant 38 : i64
          %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
          %1204 = func.call @cc_nil_value() : () -> i64
          %1205 = func.call @cc_intern(%1203, %1204) : (i64, i64) -> i64
          %1206 = func.call @cc_nil_value() : () -> i64
          %1207 = func.call @cc_cons(%1205, %1206) : (i64, i64) -> i64
          %1208 = func.call @cc_values_pack(%1207) : (i64) -> i64
          %1209 = func.call @cc_symbol_value(%1205) : (i64) -> i64
          %1210 = arith.cmpi ne, %1209, %1200 : i64
          %1211 = llvm.mlir.addressof @str84 : !llvm.ptr
          %1212 = arith.constant 38 : i64
          %1213 = func.call @cc_make_string(%1211, %1212) : (!llvm.ptr, i64) -> i64
          %1214 = func.call @cc_nil_value() : () -> i64
          %1215 = func.call @cc_intern(%1213, %1214) : (i64, i64) -> i64
          %1216 = func.call @cc_nil_value() : () -> i64
          %1217 = func.call @cc_cons(%1215, %1216) : (i64, i64) -> i64
          %1218 = func.call @cc_values_pack(%1217) : (i64) -> i64
          %1219 = func.call @cc_symbol_value(%1215) : (i64) -> i64
          %1220 = arith.cmpi ne, %1219, %1200 : i64
          %1221 = arith.ori %1210, %1220 : i1
          %1222 = arith.constant 0 : i1
          %1223 = arith.cmpi eq, %1221, %1222 : i1
          %1224 = arith.andi %1199, %1223 : i1
          scf.condition(%1224) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%1225: i64, %1226: i64, %1227: i64):
          %1228 = func.call @cc_nil_value() : () -> i64
          %1229 = func.call @cc_nil_value() : () -> i64
          %1230 = func.call @cc_errorp(%1228) : (i64) -> i64
          %1231 = arith.cmpi ne, %1230, %1229 : i64
          %1232:3 = scf.if %1231 -> (i64, i64, i64) {
            scf.yield %1228, %1226, %1225 : i64, i64, i64
          } else {
            %1233 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%1227) : (i64) -> ()
            %1234 = func.call @stack_pop_pointer() : () -> i64
            %1235 = func.call @cc_nil_value() : () -> i64
            %1236 = arith.cmpi eq, %1234, %1235 : i64
            %1238 = func.call @cc_t_value() : () -> i64
            %1237 = arith.select %1236, %1238, %1235 : i64
            func.call @stack_push_pointer(%1237) : (i64) -> ()
            %1239 = func.call @stack_pop_pointer() : () -> i64
            %1240 = func.call @cc_nil_value() : () -> i64
            %1241 = func.call @cc_cons(%1239, %1240) : (i64, i64) -> i64
            %1242 = func.call @cc_not(%1241) : (i64) -> i64
            func.call @stack_push_pointer(%1242) : (i64) -> ()
            %1243 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1227) : (i64) -> ()
            %1244 = func.call @stack_pop_pointer() : () -> i64
            %1245 = func.call @cc_is_cons(%1244) : (i64) -> i32
            %1246 = arith.constant 0 : i32
            %1247 = arith.cmpi ne, %1245, %1246 : i32
            %1248 = func.call @cc_t_value() : () -> i64
            %1249 = func.call @cc_nil_value() : () -> i64
            %1250 = arith.select %1247, %1248, %1249 : i64
            func.call @stack_push_pointer(%1250) : (i64) -> ()
            %1251 = func.call @stack_pop_pointer() : () -> i64
            %1252 = func.call @cc_nil_value() : () -> i64
            %1253 = func.call @cc_cons(%1251, %1252) : (i64, i64) -> i64
            %1254 = func.call @cc_not(%1253) : (i64) -> i64
            func.call @stack_push_pointer(%1254) : (i64) -> ()
            %1255 = func.call @stack_pop_pointer() : () -> i64
            %1256 = func.call @cc_cons(%1255, %1233) : (i64, i64) -> i64
            %1257 = func.call @cc_cons(%1243, %1256) : (i64, i64) -> i64
            %1258 = func.call @cc_and(%1257) : (i64) -> i64
            func.call @stack_push_pointer(%1258) : (i64) -> ()
            %1259 = func.call @stack_pop_pointer() : () -> i64
            %1260 = func.call @cc_nil_value() : () -> i64
            %1261 = arith.cmpi ne, %1259, %1260 : i64
            scf.if %1261 {
              %1262 = llvm.mlir.addressof @str85 : !llvm.ptr
              %1263 = arith.constant 10 : i64
              %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
              %1265 = func.call @cc_nil_value() : () -> i64
              %1266 = func.call @cc_intern(%1264, %1265) : (i64, i64) -> i64
              %1267 = func.call @cc_nil_value() : () -> i64
              %1268 = func.call @cc_cons(%1266, %1267) : (i64, i64) -> i64
              %1269 = func.call @cc_values_pack(%1268) : (i64) -> i64
              func.call @stack_push_pointer(%1266) : (i64) -> ()
              %1270 = func.call @stack_pop_pointer() : () -> i64
              %1271 = func.call @cc_nil_value() : () -> i64
              %1272 = func.call @cc_errorp(%1270) : (i64) -> i64
              %1273 = arith.cmpi ne, %1272, %1271 : i64
              %1274 = arith.cmpi eq, %1271, %1271 : i64
              %1275 = arith.andi %1273, %1274 : i1
              %1276 = scf.if %1275 -> (i64) {
                scf.yield %1270 : i64
              } else {
                scf.yield %1271 : i64
              }
              %1277 = arith.cmpi ne, %1276, %1271 : i64
              scf.if %1277 {
                func.call @stack_push_pointer(%1276) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1270) : (i64) -> ()
                %1278 = llvm.mlir.addressof @str86 : !llvm.ptr
                %1279 = func.call @cc_make_function_ref_const(%1278) : (!llvm.ptr) -> i64
                %1280 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%1279, %1280) : (i64, i64) -> ()
              }
              %1281 = func.call @stack_pop_pointer() : () -> i64
              %1282 = func.call @cc_multiple_value_list(%1281) : (i64) -> i64
              %1283 = func.call @cc_t_value() : () -> i64
              %1284 = llvm.mlir.addressof @str87 : !llvm.ptr
              %1285 = arith.constant 38 : i64
              %1286 = func.call @cc_make_string(%1284, %1285) : (!llvm.ptr, i64) -> i64
              %1287 = func.call @cc_nil_value() : () -> i64
              %1288 = func.call @cc_intern(%1286, %1287) : (i64, i64) -> i64
              %1289 = func.call @cc_nil_value() : () -> i64
              %1290 = func.call @cc_cons(%1288, %1289) : (i64, i64) -> i64
              %1291 = func.call @cc_values_pack(%1290) : (i64) -> i64
              %1292 = func.call @cc_set_symbol_value(%1288, %1283) : (i64, i64) -> i64
              %1293 = llvm.mlir.addressof @str88 : !llvm.ptr
              %1294 = arith.constant 39 : i64
              %1295 = func.call @cc_make_string(%1293, %1294) : (!llvm.ptr, i64) -> i64
              %1296 = func.call @cc_nil_value() : () -> i64
              %1297 = func.call @cc_intern(%1295, %1296) : (i64, i64) -> i64
              %1298 = func.call @cc_nil_value() : () -> i64
              %1299 = func.call @cc_cons(%1297, %1298) : (i64, i64) -> i64
              %1300 = func.call @cc_values_pack(%1299) : (i64) -> i64
              %1301 = func.call @cc_set_symbol_value(%1297, %1281) : (i64, i64) -> i64
              %1302 = llvm.mlir.addressof @str89 : !llvm.ptr
              %1303 = arith.constant 40 : i64
              %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
              %1305 = func.call @cc_nil_value() : () -> i64
              %1306 = func.call @cc_intern(%1304, %1305) : (i64, i64) -> i64
              %1307 = func.call @cc_nil_value() : () -> i64
              %1308 = func.call @cc_cons(%1306, %1307) : (i64, i64) -> i64
              %1309 = func.call @cc_values_pack(%1308) : (i64) -> i64
              %1310 = func.call @cc_set_symbol_value(%1306, %1282) : (i64, i64) -> i64
              func.call @stack_push_pointer(%1281) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %1311 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1311, %1226, %1225 : i64, i64, i64
          }
          %1312 = func.call @cc_nil_value() : () -> i64
          %1313 = func.call @cc_errorp(%1232#0) : (i64) -> i64
          %1314 = arith.cmpi ne, %1313, %1312 : i64
          %1315:3 = scf.if %1314 -> (i64, i64, i64) {
            scf.yield %1232#0, %1232#1, %1232#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%1227) : (i64) -> ()
            %1316 = func.call @stack_pop_pointer() : () -> i64
            %1317 = func.call @cc_car(%1316) : (i64) -> i64
            func.call @stack_push_pointer(%1317) : (i64) -> ()
            %1318 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1318) : (i64) -> ()
            %1319 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1319, %1232#1, %1318 : i64, i64, i64
          }
          %1320 = func.call @cc_nil_value() : () -> i64
          %1321 = func.call @cc_errorp(%1315#0) : (i64) -> i64
          %1322 = arith.cmpi ne, %1321, %1320 : i64
          %1323:3 = scf.if %1322 -> (i64, i64, i64) {
            scf.yield %1315#0, %1315#1, %1315#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%1315#1) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1324 = func.call @stack_pop_pointer() : () -> i64
            %1325 = arith.constant 3.0 : f64
            %1326 = func.call @cc_box_single_float(%1325) : (f64) -> i64
            func.call @stack_push_pointer(%1326) : (i64) -> ()
            %1327 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%1327) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1328 = func.call @stack_pop_pointer() : () -> i64
            %1329 = func.call @stack_pop_pointer() : () -> i64
            %1330 = func.call @cc_cons(%1329, %1328) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1330) : (i64) -> ()
            %1331 = func.call @stack_pop_pointer() : () -> i64
            %1332 = func.call @stack_pop_pointer() : () -> i64
            %1333 = func.call @cc_cons(%1332, %1331) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1333) : (i64) -> ()
            %1334 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%1334) : (i64) -> ()
            %1335 = arith.constant 2.0 : f64
            %1336 = func.call @cc_box_single_float(%1335) : (f64) -> i64
            func.call @stack_push_pointer(%1336) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1337 = func.call @stack_pop_pointer() : () -> i64
            %1338 = func.call @stack_pop_pointer() : () -> i64
            %1339 = func.call @cc_cons(%1338, %1337) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1339) : (i64) -> ()
            %1340 = func.call @stack_pop_pointer() : () -> i64
            %1341 = func.call @stack_pop_pointer() : () -> i64
            %1342 = func.call @cc_cons(%1341, %1340) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1342) : (i64) -> ()
            %1343 = arith.constant 3.0 : f64
            %1344 = func.call @cc_box_single_float(%1343) : (f64) -> i64
            func.call @stack_push_pointer(%1344) : (i64) -> ()
            %1345 = llvm.mlir.addressof @str90 : !llvm.ptr
            %1346 = arith.constant 1 : i64
            %1347 = func.call @cc_parse_bignum(%1345, %1346) : (!llvm.ptr, i64) -> i64
            %1348 = llvm.mlir.addressof @str91 : !llvm.ptr
            %1349 = arith.constant 1 : i64
            %1350 = func.call @cc_parse_bignum(%1348, %1349) : (!llvm.ptr, i64) -> i64
            %1351 = func.call @cc_ratio(%1347, %1350) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1351) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1352 = func.call @stack_pop_pointer() : () -> i64
            %1353 = func.call @stack_pop_pointer() : () -> i64
            %1354 = func.call @cc_cons(%1353, %1352) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1354) : (i64) -> ()
            %1355 = func.call @stack_pop_pointer() : () -> i64
            %1356 = func.call @stack_pop_pointer() : () -> i64
            %1357 = func.call @cc_cons(%1356, %1355) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1357) : (i64) -> ()
            %1358 = llvm.mlir.addressof @str92 : !llvm.ptr
            %1359 = arith.constant 2 : i64
            %1360 = func.call @cc_parse_bignum(%1358, %1359) : (!llvm.ptr, i64) -> i64
            %1361 = llvm.mlir.addressof @str93 : !llvm.ptr
            %1362 = arith.constant 2 : i64
            %1363 = func.call @cc_parse_bignum(%1361, %1362) : (!llvm.ptr, i64) -> i64
            %1364 = func.call @cc_ratio(%1360, %1363) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1364) : (i64) -> ()
            %1365 = arith.constant 2.0 : f64
            %1366 = func.call @cc_box_single_float(%1365) : (f64) -> i64
            func.call @stack_push_pointer(%1366) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1367 = func.call @stack_pop_pointer() : () -> i64
            %1368 = func.call @stack_pop_pointer() : () -> i64
            %1369 = func.call @cc_cons(%1368, %1367) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1369) : (i64) -> ()
            %1370 = func.call @stack_pop_pointer() : () -> i64
            %1371 = func.call @stack_pop_pointer() : () -> i64
            %1372 = func.call @cc_cons(%1371, %1370) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1372) : (i64) -> ()
            %1373 = arith.constant 3.0 : f64
            %1374 = func.call @cc_box_single_float(%1373) : (f64) -> i64
            func.call @stack_push_pointer(%1374) : (i64) -> ()
            %1375 = arith.constant 2.0 : f64
            %1376 = func.call @cc_box_float(%1375) : (f64) -> i64
            func.call @stack_push_pointer(%1376) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1377 = func.call @stack_pop_pointer() : () -> i64
            %1378 = func.call @stack_pop_pointer() : () -> i64
            %1379 = func.call @cc_cons(%1378, %1377) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1379) : (i64) -> ()
            %1380 = func.call @stack_pop_pointer() : () -> i64
            %1381 = func.call @stack_pop_pointer() : () -> i64
            %1382 = func.call @cc_cons(%1381, %1380) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1382) : (i64) -> ()
            %1383 = arith.constant 3.0 : f64
            %1384 = func.call @cc_box_float(%1383) : (f64) -> i64
            func.call @stack_push_pointer(%1384) : (i64) -> ()
            %1385 = arith.constant 2.0 : f64
            %1386 = func.call @cc_box_single_float(%1385) : (f64) -> i64
            func.call @stack_push_pointer(%1386) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1387 = func.call @stack_pop_pointer() : () -> i64
            %1388 = func.call @stack_pop_pointer() : () -> i64
            %1389 = func.call @cc_cons(%1388, %1387) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1389) : (i64) -> ()
            %1390 = func.call @stack_pop_pointer() : () -> i64
            %1391 = func.call @stack_pop_pointer() : () -> i64
            %1392 = func.call @cc_cons(%1391, %1390) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1392) : (i64) -> ()
            %1393 = arith.constant 3.0 : f64
            %1394 = func.call @cc_box_float(%1393) : (f64) -> i64
            func.call @stack_push_pointer(%1394) : (i64) -> ()
            %1395 = arith.constant 2.0 : f64
            %1396 = func.call @cc_box_float(%1395) : (f64) -> i64
            func.call @stack_push_pointer(%1396) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1397 = func.call @stack_pop_pointer() : () -> i64
            %1398 = func.call @stack_pop_pointer() : () -> i64
            %1399 = func.call @cc_cons(%1398, %1397) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1399) : (i64) -> ()
            %1400 = func.call @stack_pop_pointer() : () -> i64
            %1401 = func.call @stack_pop_pointer() : () -> i64
            %1402 = func.call @cc_cons(%1401, %1400) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1402) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1403 = func.call @stack_pop_pointer() : () -> i64
            %1404 = func.call @stack_pop_pointer() : () -> i64
            %1405 = func.call @cc_cons(%1404, %1403) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1405) : (i64) -> ()
            %1406 = func.call @stack_pop_pointer() : () -> i64
            %1407 = func.call @stack_pop_pointer() : () -> i64
            %1408 = func.call @cc_cons(%1407, %1406) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1408) : (i64) -> ()
            %1409 = func.call @stack_pop_pointer() : () -> i64
            %1410 = func.call @stack_pop_pointer() : () -> i64
            %1411 = func.call @cc_cons(%1410, %1409) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1411) : (i64) -> ()
            %1412 = func.call @stack_pop_pointer() : () -> i64
            %1413 = func.call @stack_pop_pointer() : () -> i64
            %1414 = func.call @cc_cons(%1413, %1412) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1414) : (i64) -> ()
            %1415 = func.call @stack_pop_pointer() : () -> i64
            %1416 = func.call @stack_pop_pointer() : () -> i64
            %1417 = func.call @cc_cons(%1416, %1415) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1417) : (i64) -> ()
            %1418 = func.call @stack_pop_pointer() : () -> i64
            %1419 = func.call @stack_pop_pointer() : () -> i64
            %1420 = func.call @cc_cons(%1419, %1418) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1420) : (i64) -> ()
            %1421 = func.call @stack_pop_pointer() : () -> i64
            %1422 = func.call @stack_pop_pointer() : () -> i64
            %1423 = func.call @cc_cons(%1422, %1421) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1423) : (i64) -> ()
            %1424 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1425 = func.call @stack_pop_pointer() : () -> i64
            %1426 = llvm.mlir.addressof @str94 : !llvm.ptr
            %1427 = arith.constant 12 : i64
            %1428 = func.call @cc_make_string(%1426, %1427) : (!llvm.ptr, i64) -> i64
            %1429 = llvm.mlir.addressof @str95 : !llvm.ptr
            %1430 = arith.constant 11 : i64
            %1431 = func.call @cc_make_string(%1429, %1430) : (!llvm.ptr, i64) -> i64
            %1432 = func.call @cc_intern(%1428, %1431) : (i64, i64) -> i64
            %1433 = func.call @cc_nil_value() : () -> i64
            %1434 = func.call @cc_cons(%1432, %1433) : (i64, i64) -> i64
            %1435 = func.call @cc_values_pack(%1434) : (i64) -> i64
            func.call @stack_push_pointer(%1432) : (i64) -> ()
            %1436 = llvm.mlir.addressof @str96 : !llvm.ptr
            %1437 = arith.constant 12 : i64
            %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
            %1439 = llvm.mlir.addressof @str97 : !llvm.ptr
            %1440 = arith.constant 11 : i64
            %1441 = func.call @cc_make_string(%1439, %1440) : (!llvm.ptr, i64) -> i64
            %1442 = func.call @cc_intern(%1438, %1441) : (i64, i64) -> i64
            %1443 = func.call @cc_nil_value() : () -> i64
            %1444 = func.call @cc_cons(%1442, %1443) : (i64, i64) -> i64
            %1445 = func.call @cc_values_pack(%1444) : (i64) -> i64
            func.call @stack_push_pointer(%1442) : (i64) -> ()
            %1446 = llvm.mlir.addressof @str98 : !llvm.ptr
            %1447 = arith.constant 12 : i64
            %1448 = func.call @cc_make_string(%1446, %1447) : (!llvm.ptr, i64) -> i64
            %1449 = llvm.mlir.addressof @str99 : !llvm.ptr
            %1450 = arith.constant 11 : i64
            %1451 = func.call @cc_make_string(%1449, %1450) : (!llvm.ptr, i64) -> i64
            %1452 = func.call @cc_intern(%1448, %1451) : (i64, i64) -> i64
            %1453 = func.call @cc_nil_value() : () -> i64
            %1454 = func.call @cc_cons(%1452, %1453) : (i64, i64) -> i64
            %1455 = func.call @cc_values_pack(%1454) : (i64) -> i64
            func.call @stack_push_pointer(%1452) : (i64) -> ()
            %1456 = llvm.mlir.addressof @str100 : !llvm.ptr
            %1457 = arith.constant 12 : i64
            %1458 = func.call @cc_make_string(%1456, %1457) : (!llvm.ptr, i64) -> i64
            %1459 = llvm.mlir.addressof @str101 : !llvm.ptr
            %1460 = arith.constant 11 : i64
            %1461 = func.call @cc_make_string(%1459, %1460) : (!llvm.ptr, i64) -> i64
            %1462 = func.call @cc_intern(%1458, %1461) : (i64, i64) -> i64
            %1463 = func.call @cc_nil_value() : () -> i64
            %1464 = func.call @cc_cons(%1462, %1463) : (i64, i64) -> i64
            %1465 = func.call @cc_values_pack(%1464) : (i64) -> i64
            func.call @stack_push_pointer(%1462) : (i64) -> ()
            %1466 = llvm.mlir.addressof @str102 : !llvm.ptr
            %1467 = arith.constant 12 : i64
            %1468 = func.call @cc_make_string(%1466, %1467) : (!llvm.ptr, i64) -> i64
            %1469 = llvm.mlir.addressof @str103 : !llvm.ptr
            %1470 = arith.constant 11 : i64
            %1471 = func.call @cc_make_string(%1469, %1470) : (!llvm.ptr, i64) -> i64
            %1472 = func.call @cc_intern(%1468, %1471) : (i64, i64) -> i64
            %1473 = func.call @cc_nil_value() : () -> i64
            %1474 = func.call @cc_cons(%1472, %1473) : (i64, i64) -> i64
            %1475 = func.call @cc_values_pack(%1474) : (i64) -> i64
            func.call @stack_push_pointer(%1472) : (i64) -> ()
            %1476 = llvm.mlir.addressof @str104 : !llvm.ptr
            %1477 = arith.constant 12 : i64
            %1478 = func.call @cc_make_string(%1476, %1477) : (!llvm.ptr, i64) -> i64
            %1479 = llvm.mlir.addressof @str105 : !llvm.ptr
            %1480 = arith.constant 11 : i64
            %1481 = func.call @cc_make_string(%1479, %1480) : (!llvm.ptr, i64) -> i64
            %1482 = func.call @cc_intern(%1478, %1481) : (i64, i64) -> i64
            %1483 = func.call @cc_nil_value() : () -> i64
            %1484 = func.call @cc_cons(%1482, %1483) : (i64, i64) -> i64
            %1485 = func.call @cc_values_pack(%1484) : (i64) -> i64
            func.call @stack_push_pointer(%1482) : (i64) -> ()
            %1486 = llvm.mlir.addressof @str106 : !llvm.ptr
            %1487 = arith.constant 12 : i64
            %1488 = func.call @cc_make_string(%1486, %1487) : (!llvm.ptr, i64) -> i64
            %1489 = llvm.mlir.addressof @str107 : !llvm.ptr
            %1490 = arith.constant 11 : i64
            %1491 = func.call @cc_make_string(%1489, %1490) : (!llvm.ptr, i64) -> i64
            %1492 = func.call @cc_intern(%1488, %1491) : (i64, i64) -> i64
            %1493 = func.call @cc_nil_value() : () -> i64
            %1494 = func.call @cc_cons(%1492, %1493) : (i64, i64) -> i64
            %1495 = func.call @cc_values_pack(%1494) : (i64) -> i64
            func.call @stack_push_pointer(%1492) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1496 = func.call @stack_pop_pointer() : () -> i64
            %1497 = func.call @stack_pop_pointer() : () -> i64
            %1498 = func.call @cc_cons(%1497, %1496) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1498) : (i64) -> ()
            %1499 = func.call @stack_pop_pointer() : () -> i64
            %1500 = func.call @stack_pop_pointer() : () -> i64
            %1501 = func.call @cc_cons(%1500, %1499) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1501) : (i64) -> ()
            %1502 = func.call @stack_pop_pointer() : () -> i64
            %1503 = func.call @stack_pop_pointer() : () -> i64
            %1504 = func.call @cc_cons(%1503, %1502) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1504) : (i64) -> ()
            %1505 = func.call @stack_pop_pointer() : () -> i64
            %1506 = func.call @stack_pop_pointer() : () -> i64
            %1507 = func.call @cc_cons(%1506, %1505) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1507) : (i64) -> ()
            %1508 = func.call @stack_pop_pointer() : () -> i64
            %1509 = func.call @stack_pop_pointer() : () -> i64
            %1510 = func.call @cc_cons(%1509, %1508) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1510) : (i64) -> ()
            %1511 = func.call @stack_pop_pointer() : () -> i64
            %1512 = func.call @stack_pop_pointer() : () -> i64
            %1513 = func.call @cc_cons(%1512, %1511) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1513) : (i64) -> ()
            %1514 = func.call @stack_pop_pointer() : () -> i64
            %1515 = func.call @stack_pop_pointer() : () -> i64
            %1516 = func.call @cc_cons(%1515, %1514) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1516) : (i64) -> ()
            %1517 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1518 = func.call @stack_pop_pointer() : () -> i64
            %1519 = func.call @cc_nil_value() : () -> i64
            %1520 = func.call @cc_nil_value() : () -> i64
            %1521 = func.call @cc_errorp(%1519) : (i64) -> i64
            %1522 = arith.cmpi ne, %1521, %1520 : i64
            %1523 = scf.if %1522 -> (i64) {
              scf.yield %1519 : i64
            } else {
              %1524 = func.call @cc_nil_value() : () -> i64
              %1525 = llvm.mlir.addressof @str108 : !llvm.ptr
              %1526 = arith.constant 38 : i64
              %1527 = func.call @cc_make_string(%1525, %1526) : (!llvm.ptr, i64) -> i64
              %1528 = func.call @cc_nil_value() : () -> i64
              %1529 = func.call @cc_intern(%1527, %1528) : (i64, i64) -> i64
              %1530 = func.call @cc_nil_value() : () -> i64
              %1531 = func.call @cc_cons(%1529, %1530) : (i64, i64) -> i64
              %1532 = func.call @cc_values_pack(%1531) : (i64) -> i64
              %1533 = func.call @cc_set_symbol_value(%1529, %1524) : (i64, i64) -> i64
              %1534 = llvm.mlir.addressof @str109 : !llvm.ptr
              %1535 = arith.constant 39 : i64
              %1536 = func.call @cc_make_string(%1534, %1535) : (!llvm.ptr, i64) -> i64
              %1537 = func.call @cc_nil_value() : () -> i64
              %1538 = func.call @cc_intern(%1536, %1537) : (i64, i64) -> i64
              %1539 = func.call @cc_nil_value() : () -> i64
              %1540 = func.call @cc_cons(%1538, %1539) : (i64, i64) -> i64
              %1541 = func.call @cc_values_pack(%1540) : (i64) -> i64
              %1542 = func.call @cc_set_symbol_value(%1538, %1524) : (i64, i64) -> i64
              %1543 = llvm.mlir.addressof @str110 : !llvm.ptr
              %1544 = arith.constant 40 : i64
              %1545 = func.call @cc_make_string(%1543, %1544) : (!llvm.ptr, i64) -> i64
              %1546 = func.call @cc_nil_value() : () -> i64
              %1547 = func.call @cc_intern(%1545, %1546) : (i64, i64) -> i64
              %1548 = func.call @cc_nil_value() : () -> i64
              %1549 = func.call @cc_cons(%1547, %1548) : (i64, i64) -> i64
              %1550 = func.call @cc_values_pack(%1549) : (i64) -> i64
              %1551 = func.call @cc_set_symbol_value(%1547, %1524) : (i64, i64) -> i64
              %1552:5 = scf.while (%arg0 = %1324, %arg1 = %1425, %arg2 = %1518, %arg3 = %1517, %arg4 = %1424) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
                %1553 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%arg4) : (i64) -> ()
                %1554 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%arg3) : (i64) -> ()
                %1555 = func.call @stack_pop_pointer() : () -> i64
                %1556 = func.call @cc_cons(%1555, %1553) : (i64, i64) -> i64
                %1557 = func.call @cc_cons(%1554, %1556) : (i64, i64) -> i64
                %1558 = func.call @cc_and(%1557) : (i64) -> i64
                func.call @stack_push_pointer(%1558) : (i64) -> ()
                %1559 = func.call @stack_pop_pointer() : () -> i64
                %1560 = func.call @cc_nil_value() : () -> i64
                %1561 = arith.cmpi ne, %1559, %1560 : i64
                %1562 = func.call @cc_nil_value() : () -> i64
                %1563 = llvm.mlir.addressof @str111 : !llvm.ptr
                %1564 = arith.constant 38 : i64
                %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
                %1566 = func.call @cc_nil_value() : () -> i64
                %1567 = func.call @cc_intern(%1565, %1566) : (i64, i64) -> i64
                %1568 = func.call @cc_nil_value() : () -> i64
                %1569 = func.call @cc_cons(%1567, %1568) : (i64, i64) -> i64
                %1570 = func.call @cc_values_pack(%1569) : (i64) -> i64
                %1571 = func.call @cc_symbol_value(%1567) : (i64) -> i64
                %1572 = arith.cmpi ne, %1571, %1562 : i64
                %1573 = llvm.mlir.addressof @str112 : !llvm.ptr
                %1574 = arith.constant 38 : i64
                %1575 = func.call @cc_make_string(%1573, %1574) : (!llvm.ptr, i64) -> i64
                %1576 = func.call @cc_nil_value() : () -> i64
                %1577 = func.call @cc_intern(%1575, %1576) : (i64, i64) -> i64
                %1578 = func.call @cc_nil_value() : () -> i64
                %1579 = func.call @cc_cons(%1577, %1578) : (i64, i64) -> i64
                %1580 = func.call @cc_values_pack(%1579) : (i64) -> i64
                %1581 = func.call @cc_symbol_value(%1577) : (i64) -> i64
                %1582 = arith.cmpi ne, %1581, %1562 : i64
                %1583 = arith.ori %1572, %1582 : i1
                %1584 = llvm.mlir.addressof @str113 : !llvm.ptr
                %1585 = arith.constant 38 : i64
                %1586 = func.call @cc_make_string(%1584, %1585) : (!llvm.ptr, i64) -> i64
                %1587 = func.call @cc_nil_value() : () -> i64
                %1588 = func.call @cc_intern(%1586, %1587) : (i64, i64) -> i64
                %1589 = func.call @cc_nil_value() : () -> i64
                %1590 = func.call @cc_cons(%1588, %1589) : (i64, i64) -> i64
                %1591 = func.call @cc_values_pack(%1590) : (i64) -> i64
                %1592 = func.call @cc_symbol_value(%1588) : (i64) -> i64
                %1593 = arith.cmpi ne, %1592, %1562 : i64
                %1594 = arith.ori %1583, %1593 : i1
                %1595 = arith.constant 0 : i1
                %1596 = arith.cmpi eq, %1594, %1595 : i1
                %1597 = arith.andi %1561, %1596 : i1
                scf.condition(%1597) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
              } do {
                ^bb0(%1598: i64, %1599: i64, %1600: i64, %1601: i64, %1602: i64):
                %1603 = func.call @cc_nil_value() : () -> i64
                %1604 = func.call @cc_nil_value() : () -> i64
                %1605 = func.call @cc_errorp(%1603) : (i64) -> i64
                %1606 = arith.cmpi ne, %1605, %1604 : i64
                %1607:4 = scf.if %1606 -> (i64, i64, i64, i64) {
                  scf.yield %1603, %1600, %1598, %1599 : i64, i64, i64, i64
                } else {
                  %1608 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%1602) : (i64) -> ()
                  %1609 = func.call @stack_pop_pointer() : () -> i64
                  %1610 = func.call @cc_nil_value() : () -> i64
                  %1611 = arith.cmpi eq, %1609, %1610 : i64
                  %1613 = func.call @cc_t_value() : () -> i64
                  %1612 = arith.select %1611, %1613, %1610 : i64
                  func.call @stack_push_pointer(%1612) : (i64) -> ()
                  %1614 = func.call @stack_pop_pointer() : () -> i64
                  %1615 = func.call @cc_nil_value() : () -> i64
                  %1616 = func.call @cc_cons(%1614, %1615) : (i64, i64) -> i64
                  %1617 = func.call @cc_not(%1616) : (i64) -> i64
                  func.call @stack_push_pointer(%1617) : (i64) -> ()
                  %1618 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1602) : (i64) -> ()
                  %1619 = func.call @stack_pop_pointer() : () -> i64
                  %1620 = func.call @cc_is_cons(%1619) : (i64) -> i32
                  %1621 = arith.constant 0 : i32
                  %1622 = arith.cmpi ne, %1620, %1621 : i32
                  %1623 = func.call @cc_t_value() : () -> i64
                  %1624 = func.call @cc_nil_value() : () -> i64
                  %1625 = arith.select %1622, %1623, %1624 : i64
                  func.call @stack_push_pointer(%1625) : (i64) -> ()
                  %1626 = func.call @stack_pop_pointer() : () -> i64
                  %1627 = func.call @cc_nil_value() : () -> i64
                  %1628 = func.call @cc_cons(%1626, %1627) : (i64, i64) -> i64
                  %1629 = func.call @cc_not(%1628) : (i64) -> i64
                  func.call @stack_push_pointer(%1629) : (i64) -> ()
                  %1630 = func.call @stack_pop_pointer() : () -> i64
                  %1631 = func.call @cc_cons(%1630, %1608) : (i64, i64) -> i64
                  %1632 = func.call @cc_cons(%1618, %1631) : (i64, i64) -> i64
                  %1633 = func.call @cc_and(%1632) : (i64) -> i64
                  func.call @stack_push_pointer(%1633) : (i64) -> ()
                  %1634 = func.call @stack_pop_pointer() : () -> i64
                  %1635 = func.call @cc_nil_value() : () -> i64
                  %1636 = arith.cmpi ne, %1634, %1635 : i64
                  scf.if %1636 {
                    %1637 = llvm.mlir.addressof @str114 : !llvm.ptr
                    %1638 = arith.constant 10 : i64
                    %1639 = func.call @cc_make_string(%1637, %1638) : (!llvm.ptr, i64) -> i64
                    %1640 = func.call @cc_nil_value() : () -> i64
                    %1641 = func.call @cc_intern(%1639, %1640) : (i64, i64) -> i64
                    %1642 = func.call @cc_nil_value() : () -> i64
                    %1643 = func.call @cc_cons(%1641, %1642) : (i64, i64) -> i64
                    %1644 = func.call @cc_values_pack(%1643) : (i64) -> i64
                    func.call @stack_push_pointer(%1641) : (i64) -> ()
                    %1645 = func.call @stack_pop_pointer() : () -> i64
                    %1646 = func.call @cc_nil_value() : () -> i64
                    %1647 = func.call @cc_errorp(%1645) : (i64) -> i64
                    %1648 = arith.cmpi ne, %1647, %1646 : i64
                    %1649 = arith.cmpi eq, %1646, %1646 : i64
                    %1650 = arith.andi %1648, %1649 : i1
                    %1651 = scf.if %1650 -> (i64) {
                      scf.yield %1645 : i64
                    } else {
                      scf.yield %1646 : i64
                    }
                    %1652 = arith.cmpi ne, %1651, %1646 : i64
                    scf.if %1652 {
                      func.call @stack_push_pointer(%1651) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%1645) : (i64) -> ()
                      %1653 = llvm.mlir.addressof @str115 : !llvm.ptr
                      %1654 = func.call @cc_make_function_ref_const(%1653) : (!llvm.ptr) -> i64
                      %1655 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%1654, %1655) : (i64, i64) -> ()
                    }
                    %1656 = func.call @stack_pop_pointer() : () -> i64
                    %1657 = func.call @cc_multiple_value_list(%1656) : (i64) -> i64
                    %1658 = func.call @cc_t_value() : () -> i64
                    %1659 = llvm.mlir.addressof @str116 : !llvm.ptr
                    %1660 = arith.constant 38 : i64
                    %1661 = func.call @cc_make_string(%1659, %1660) : (!llvm.ptr, i64) -> i64
                    %1662 = func.call @cc_nil_value() : () -> i64
                    %1663 = func.call @cc_intern(%1661, %1662) : (i64, i64) -> i64
                    %1664 = func.call @cc_nil_value() : () -> i64
                    %1665 = func.call @cc_cons(%1663, %1664) : (i64, i64) -> i64
                    %1666 = func.call @cc_values_pack(%1665) : (i64) -> i64
                    %1667 = func.call @cc_set_symbol_value(%1663, %1658) : (i64, i64) -> i64
                    %1668 = llvm.mlir.addressof @str117 : !llvm.ptr
                    %1669 = arith.constant 39 : i64
                    %1670 = func.call @cc_make_string(%1668, %1669) : (!llvm.ptr, i64) -> i64
                    %1671 = func.call @cc_nil_value() : () -> i64
                    %1672 = func.call @cc_intern(%1670, %1671) : (i64, i64) -> i64
                    %1673 = func.call @cc_nil_value() : () -> i64
                    %1674 = func.call @cc_cons(%1672, %1673) : (i64, i64) -> i64
                    %1675 = func.call @cc_values_pack(%1674) : (i64) -> i64
                    %1676 = func.call @cc_set_symbol_value(%1672, %1656) : (i64, i64) -> i64
                    %1677 = llvm.mlir.addressof @str118 : !llvm.ptr
                    %1678 = arith.constant 40 : i64
                    %1679 = func.call @cc_make_string(%1677, %1678) : (!llvm.ptr, i64) -> i64
                    %1680 = func.call @cc_nil_value() : () -> i64
                    %1681 = func.call @cc_intern(%1679, %1680) : (i64, i64) -> i64
                    %1682 = func.call @cc_nil_value() : () -> i64
                    %1683 = func.call @cc_cons(%1681, %1682) : (i64, i64) -> i64
                    %1684 = func.call @cc_values_pack(%1683) : (i64) -> i64
                    %1685 = func.call @cc_set_symbol_value(%1681, %1657) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%1656) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %1686 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1686, %1600, %1598, %1599 : i64, i64, i64, i64
                }
                %1687 = func.call @cc_nil_value() : () -> i64
                %1688 = func.call @cc_errorp(%1607#0) : (i64) -> i64
                %1689 = arith.cmpi ne, %1688, %1687 : i64
                %1690:4 = scf.if %1689 -> (i64, i64, i64, i64) {
                  scf.yield %1607#0, %1607#1, %1607#2, %1607#3 : i64, i64, i64, i64
                } else {
                  %1691 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%1601) : (i64) -> ()
                  %1692 = func.call @stack_pop_pointer() : () -> i64
                  %1693 = func.call @cc_nil_value() : () -> i64
                  %1694 = arith.cmpi eq, %1692, %1693 : i64
                  %1696 = func.call @cc_t_value() : () -> i64
                  %1695 = arith.select %1694, %1696, %1693 : i64
                  func.call @stack_push_pointer(%1695) : (i64) -> ()
                  %1697 = func.call @stack_pop_pointer() : () -> i64
                  %1698 = func.call @cc_nil_value() : () -> i64
                  %1699 = func.call @cc_cons(%1697, %1698) : (i64, i64) -> i64
                  %1700 = func.call @cc_not(%1699) : (i64) -> i64
                  func.call @stack_push_pointer(%1700) : (i64) -> ()
                  %1701 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1601) : (i64) -> ()
                  %1702 = func.call @stack_pop_pointer() : () -> i64
                  %1703 = func.call @cc_is_cons(%1702) : (i64) -> i32
                  %1704 = arith.constant 0 : i32
                  %1705 = arith.cmpi ne, %1703, %1704 : i32
                  %1706 = func.call @cc_t_value() : () -> i64
                  %1707 = func.call @cc_nil_value() : () -> i64
                  %1708 = arith.select %1705, %1706, %1707 : i64
                  func.call @stack_push_pointer(%1708) : (i64) -> ()
                  %1709 = func.call @stack_pop_pointer() : () -> i64
                  %1710 = func.call @cc_nil_value() : () -> i64
                  %1711 = func.call @cc_cons(%1709, %1710) : (i64, i64) -> i64
                  %1712 = func.call @cc_not(%1711) : (i64) -> i64
                  func.call @stack_push_pointer(%1712) : (i64) -> ()
                  %1713 = func.call @stack_pop_pointer() : () -> i64
                  %1714 = func.call @cc_cons(%1713, %1691) : (i64, i64) -> i64
                  %1715 = func.call @cc_cons(%1701, %1714) : (i64, i64) -> i64
                  %1716 = func.call @cc_and(%1715) : (i64) -> i64
                  func.call @stack_push_pointer(%1716) : (i64) -> ()
                  %1717 = func.call @stack_pop_pointer() : () -> i64
                  %1718 = func.call @cc_nil_value() : () -> i64
                  %1719 = arith.cmpi ne, %1717, %1718 : i64
                  scf.if %1719 {
                    %1720 = llvm.mlir.addressof @str119 : !llvm.ptr
                    %1721 = arith.constant 10 : i64
                    %1722 = func.call @cc_make_string(%1720, %1721) : (!llvm.ptr, i64) -> i64
                    %1723 = func.call @cc_nil_value() : () -> i64
                    %1724 = func.call @cc_intern(%1722, %1723) : (i64, i64) -> i64
                    %1725 = func.call @cc_nil_value() : () -> i64
                    %1726 = func.call @cc_cons(%1724, %1725) : (i64, i64) -> i64
                    %1727 = func.call @cc_values_pack(%1726) : (i64) -> i64
                    func.call @stack_push_pointer(%1724) : (i64) -> ()
                    %1728 = func.call @stack_pop_pointer() : () -> i64
                    %1729 = func.call @cc_nil_value() : () -> i64
                    %1730 = func.call @cc_errorp(%1728) : (i64) -> i64
                    %1731 = arith.cmpi ne, %1730, %1729 : i64
                    %1732 = arith.cmpi eq, %1729, %1729 : i64
                    %1733 = arith.andi %1731, %1732 : i1
                    %1734 = scf.if %1733 -> (i64) {
                      scf.yield %1728 : i64
                    } else {
                      scf.yield %1729 : i64
                    }
                    %1735 = arith.cmpi ne, %1734, %1729 : i64
                    scf.if %1735 {
                      func.call @stack_push_pointer(%1734) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%1728) : (i64) -> ()
                      %1736 = llvm.mlir.addressof @str120 : !llvm.ptr
                      %1737 = func.call @cc_make_function_ref_const(%1736) : (!llvm.ptr) -> i64
                      %1738 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%1737, %1738) : (i64, i64) -> ()
                    }
                    %1739 = func.call @stack_pop_pointer() : () -> i64
                    %1740 = func.call @cc_multiple_value_list(%1739) : (i64) -> i64
                    %1741 = func.call @cc_t_value() : () -> i64
                    %1742 = llvm.mlir.addressof @str121 : !llvm.ptr
                    %1743 = arith.constant 38 : i64
                    %1744 = func.call @cc_make_string(%1742, %1743) : (!llvm.ptr, i64) -> i64
                    %1745 = func.call @cc_nil_value() : () -> i64
                    %1746 = func.call @cc_intern(%1744, %1745) : (i64, i64) -> i64
                    %1747 = func.call @cc_nil_value() : () -> i64
                    %1748 = func.call @cc_cons(%1746, %1747) : (i64, i64) -> i64
                    %1749 = func.call @cc_values_pack(%1748) : (i64) -> i64
                    %1750 = func.call @cc_set_symbol_value(%1746, %1741) : (i64, i64) -> i64
                    %1751 = llvm.mlir.addressof @str122 : !llvm.ptr
                    %1752 = arith.constant 39 : i64
                    %1753 = func.call @cc_make_string(%1751, %1752) : (!llvm.ptr, i64) -> i64
                    %1754 = func.call @cc_nil_value() : () -> i64
                    %1755 = func.call @cc_intern(%1753, %1754) : (i64, i64) -> i64
                    %1756 = func.call @cc_nil_value() : () -> i64
                    %1757 = func.call @cc_cons(%1755, %1756) : (i64, i64) -> i64
                    %1758 = func.call @cc_values_pack(%1757) : (i64) -> i64
                    %1759 = func.call @cc_set_symbol_value(%1755, %1739) : (i64, i64) -> i64
                    %1760 = llvm.mlir.addressof @str123 : !llvm.ptr
                    %1761 = arith.constant 40 : i64
                    %1762 = func.call @cc_make_string(%1760, %1761) : (!llvm.ptr, i64) -> i64
                    %1763 = func.call @cc_nil_value() : () -> i64
                    %1764 = func.call @cc_intern(%1762, %1763) : (i64, i64) -> i64
                    %1765 = func.call @cc_nil_value() : () -> i64
                    %1766 = func.call @cc_cons(%1764, %1765) : (i64, i64) -> i64
                    %1767 = func.call @cc_values_pack(%1766) : (i64) -> i64
                    %1768 = func.call @cc_set_symbol_value(%1764, %1740) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%1739) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %1769 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1769, %1607#1, %1607#2, %1607#3 : i64, i64, i64, i64
                }
                %1770 = func.call @cc_nil_value() : () -> i64
                %1771 = func.call @cc_errorp(%1690#0) : (i64) -> i64
                %1772 = arith.cmpi ne, %1771, %1770 : i64
                %1773:4 = scf.if %1772 -> (i64, i64, i64, i64) {
                  scf.yield %1690#0, %1690#1, %1690#2, %1690#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%1602) : (i64) -> ()
                  %1774 = func.call @stack_pop_pointer() : () -> i64
                  %1775 = func.call @cc_car(%1774) : (i64) -> i64
                  func.call @stack_push_pointer(%1775) : (i64) -> ()
                  %1776 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1776) : (i64) -> ()
                  %1777 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1777, %1690#1, %1776, %1690#3 : i64, i64, i64, i64
                }
                %1778 = func.call @cc_nil_value() : () -> i64
                %1779 = func.call @cc_errorp(%1773#0) : (i64) -> i64
                %1780 = arith.cmpi ne, %1779, %1778 : i64
                %1781:4 = scf.if %1780 -> (i64, i64, i64, i64) {
                  scf.yield %1773#0, %1773#1, %1773#2, %1773#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%1601) : (i64) -> ()
                  %1782 = func.call @stack_pop_pointer() : () -> i64
                  %1783 = func.call @cc_car(%1782) : (i64) -> i64
                  func.call @stack_push_pointer(%1783) : (i64) -> ()
                  %1784 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1784) : (i64) -> ()
                  %1785 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1785, %1773#1, %1773#2, %1784 : i64, i64, i64, i64
                }
                %1786 = func.call @cc_nil_value() : () -> i64
                %1787 = func.call @cc_errorp(%1781#0) : (i64) -> i64
                %1788 = arith.cmpi ne, %1787, %1786 : i64
                %1789:4 = scf.if %1788 -> (i64, i64, i64, i64) {
                  scf.yield %1781#0, %1781#1, %1781#2, %1781#3 : i64, i64, i64, i64
                } else {
                  %1790 = arith.constant 1 : i64
                  func.call @stack_push_fixnum(%1790) : (i64) -> ()
                  %1791 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1315#2) : (i64) -> ()
                  %1792 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1781#2) : (i64) -> ()
                  %1793 = func.call @stack_pop_pointer() : () -> i64
                  %1794 = func.call @cc_apply(%1792, %1793) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1794) : (i64) -> ()
                  %1795 = func.call @stack_pop_pointer() : () -> i64
                  %1796 = func.call @cc_multiple_value_list(%1795) : (i64) -> i64
                  %1797 = func.call @cc_nth(%1791, %1796) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1797) : (i64) -> ()
                  func.call @stack_push_pointer(%1781#3) : (i64) -> ()
                  %1798 = func.call @stack_pop_pointer() : () -> i64
                  %1799 = func.call @stack_pop_pointer() : () -> i64
                  %1800 = func.call @cc_typep(%1799, %1798) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1800) : (i64) -> ()
                  %1801 = func.call @stack_pop_pointer() : () -> i64
                  %1802 = func.call @cc_nil_value() : () -> i64
                  %1803 = func.call @cc_cons(%1801, %1802) : (i64, i64) -> i64
                  %1804 = func.call @cc_not(%1803) : (i64) -> i64
                  func.call @stack_push_pointer(%1804) : (i64) -> ()
                  %1805 = func.call @stack_pop_pointer() : () -> i64
                  %1806 = func.call @cc_nil_value() : () -> i64
                  %1807 = arith.cmpi ne, %1805, %1806 : i64
                  %1808:2 = scf.if %1807 -> (i64, i64) {
                    %1809 = func.call @cc_nil_value() : () -> i64
                    %1810 = func.call @cc_nil_value() : () -> i64
                    %1811 = func.call @cc_errorp(%1809) : (i64) -> i64
                    %1812 = arith.cmpi ne, %1811, %1810 : i64
                    %1813:2 = scf.if %1812 -> (i64, i64) {
                      scf.yield %1809, %1781#1 : i64, i64
                    } else {
                      func.call @stack_push_pointer(%1781#1) : (i64) -> ()
                      func.call @stack_push_pointer(%1315#2) : (i64) -> ()
                      %1814 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1781#2) : (i64) -> ()
                      %1815 = func.call @stack_pop_pointer() : () -> i64
                      %1816 = arith.constant 1 : i64
                      func.call @stack_push_fixnum(%1816) : (i64) -> ()
                      %1817 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1315#2) : (i64) -> ()
                      %1818 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1781#2) : (i64) -> ()
                      %1819 = func.call @stack_pop_pointer() : () -> i64
                      %1820 = func.call @cc_apply(%1818, %1819) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%1820) : (i64) -> ()
                      %1821 = func.call @stack_pop_pointer() : () -> i64
                      %1822 = func.call @cc_multiple_value_list(%1821) : (i64) -> i64
                      %1823 = func.call @cc_nth(%1817, %1822) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%1823) : (i64) -> ()
                      %1824 = func.call @stack_pop_pointer() : () -> i64
                      %1825 = arith.constant 1 : i64
                      func.call @stack_push_fixnum(%1825) : (i64) -> ()
                      %1826 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1315#2) : (i64) -> ()
                      %1827 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1781#2) : (i64) -> ()
                      %1828 = func.call @stack_pop_pointer() : () -> i64
                      %1829 = func.call @cc_apply(%1827, %1828) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%1829) : (i64) -> ()
                      %1830 = func.call @stack_pop_pointer() : () -> i64
                      %1831 = func.call @cc_multiple_value_list(%1830) : (i64) -> i64
                      %1832 = func.call @cc_nth(%1826, %1831) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%1832) : (i64) -> ()
                      %1833 = func.call @stack_pop_pointer() : () -> i64
                      %1834 = func.call @cc_type_of(%1833) : (i64) -> i64
                      func.call @stack_push_pointer(%1834) : (i64) -> ()
                      %1835 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1781#3) : (i64) -> ()
                      %1836 = func.call @stack_pop_pointer() : () -> i64
                      %1837 = func.call @cc_nil_value() : () -> i64
                      %1838 = func.call @cc_errorp(%1814) : (i64) -> i64
                      %1839 = arith.cmpi ne, %1838, %1837 : i64
                      %1840 = arith.cmpi eq, %1837, %1837 : i64
                      %1841 = arith.andi %1839, %1840 : i1
                      %1842 = scf.if %1841 -> (i64) {
                        scf.yield %1814 : i64
                      } else {
                        scf.yield %1837 : i64
                      }
                      %1843 = func.call @cc_errorp(%1815) : (i64) -> i64
                      %1844 = arith.cmpi ne, %1843, %1837 : i64
                      %1845 = arith.cmpi eq, %1842, %1837 : i64
                      %1846 = arith.andi %1844, %1845 : i1
                      %1847 = scf.if %1846 -> (i64) {
                        scf.yield %1815 : i64
                      } else {
                        scf.yield %1842 : i64
                      }
                      %1848 = func.call @cc_errorp(%1824) : (i64) -> i64
                      %1849 = arith.cmpi ne, %1848, %1837 : i64
                      %1850 = arith.cmpi eq, %1847, %1837 : i64
                      %1851 = arith.andi %1849, %1850 : i1
                      %1852 = scf.if %1851 -> (i64) {
                        scf.yield %1824 : i64
                      } else {
                        scf.yield %1847 : i64
                      }
                      %1853 = func.call @cc_errorp(%1835) : (i64) -> i64
                      %1854 = arith.cmpi ne, %1853, %1837 : i64
                      %1855 = arith.cmpi eq, %1852, %1837 : i64
                      %1856 = arith.andi %1854, %1855 : i1
                      %1857 = scf.if %1856 -> (i64) {
                        scf.yield %1835 : i64
                      } else {
                        scf.yield %1852 : i64
                      }
                      %1858 = func.call @cc_errorp(%1836) : (i64) -> i64
                      %1859 = arith.cmpi ne, %1858, %1837 : i64
                      %1860 = arith.cmpi eq, %1857, %1837 : i64
                      %1861 = arith.andi %1859, %1860 : i1
                      %1862 = scf.if %1861 -> (i64) {
                        scf.yield %1836 : i64
                      } else {
                        scf.yield %1857 : i64
                      }
                      %1863 = arith.cmpi ne, %1862, %1837 : i64
                      scf.if %1863 {
                        func.call @stack_push_pointer(%1862) : (i64) -> ()
                      } else {
                        %1864 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%1864) : (i64) -> ()
                        func.call @stack_push_pointer(%1836) : (i64) -> ()
                        %1865 = func.call @stack_pop_pointer() : () -> i64
                        %1866 = func.call @stack_pop_pointer() : () -> i64
                        %1867 = func.call @cc_cons(%1865, %1866) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%1867) : (i64) -> ()
                        func.call @stack_push_pointer(%1835) : (i64) -> ()
                        %1868 = func.call @stack_pop_pointer() : () -> i64
                        %1869 = func.call @stack_pop_pointer() : () -> i64
                        %1870 = func.call @cc_cons(%1868, %1869) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%1870) : (i64) -> ()
                        func.call @stack_push_pointer(%1824) : (i64) -> ()
                        %1871 = func.call @stack_pop_pointer() : () -> i64
                        %1872 = func.call @stack_pop_pointer() : () -> i64
                        %1873 = func.call @cc_cons(%1871, %1872) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%1873) : (i64) -> ()
                        func.call @stack_push_pointer(%1815) : (i64) -> ()
                        %1874 = func.call @stack_pop_pointer() : () -> i64
                        %1875 = func.call @stack_pop_pointer() : () -> i64
                        %1876 = func.call @cc_cons(%1874, %1875) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%1876) : (i64) -> ()
                        func.call @stack_push_pointer(%1814) : (i64) -> ()
                        %1877 = func.call @stack_pop_pointer() : () -> i64
                        %1878 = func.call @stack_pop_pointer() : () -> i64
                        %1879 = func.call @cc_cons(%1877, %1878) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%1879) : (i64) -> ()
                      }
                      %1880 = func.call @stack_pop_pointer() : () -> i64
                      %1881 = func.call @cc_nil_value() : () -> i64
                      %1882 = func.call @cc_errorp(%1880) : (i64) -> i64
                      %1883 = arith.cmpi ne, %1882, %1881 : i64
                      %1884 = arith.cmpi eq, %1881, %1881 : i64
                      %1885 = arith.andi %1883, %1884 : i1
                      %1886 = scf.if %1885 -> (i64) {
                        scf.yield %1880 : i64
                      } else {
                        scf.yield %1881 : i64
                      }
                      %1887 = arith.cmpi ne, %1886, %1881 : i64
                      scf.if %1887 {
                        func.call @stack_push_pointer(%1886) : (i64) -> ()
                      } else {
                        %1888 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%1888) : (i64) -> ()
                        func.call @stack_push_pointer(%1880) : (i64) -> ()
                        %1889 = func.call @stack_pop_pointer() : () -> i64
                        %1890 = func.call @stack_pop_pointer() : () -> i64
                        %1891 = func.call @cc_cons(%1889, %1890) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%1891) : (i64) -> ()
                      }
                      %1892 = func.call @stack_pop_pointer() : () -> i64
                      %1893 = func.call @stack_pop_pointer() : () -> i64
                      %1894 = func.call @cc_append(%1893, %1892) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%1894) : (i64) -> ()
                      %1895 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1895) : (i64) -> ()
                      %1896 = func.call @stack_pop_pointer() : () -> i64
                      scf.yield %1896, %1895 : i64, i64
                    }
                    func.call @stack_push_pointer(%1813#0) : (i64) -> ()
                    %1897 = func.call @stack_pop_pointer() : () -> i64
                    scf.yield %1897, %1813#1 : i64, i64
                  } else {
                    func.call @stack_push_nil() : () -> ()
                    %1898 = func.call @stack_pop_pointer() : () -> i64
                    scf.yield %1898, %1781#1 : i64, i64
                  }
                  func.call @stack_push_pointer(%1808#0) : (i64) -> ()
                  %1899 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1899, %1808#1, %1781#2, %1781#3 : i64, i64, i64, i64
                }
                func.call @stack_push_pointer(%1789#0) : (i64) -> ()
                %1900 = func.call @stack_depth() : () -> i64
                %1901 = arith.constant 0 : i64
                %1902 = arith.cmpi sgt, %1900, %1901 : i64
                scf.if %1902 {
                  %1903 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%1601) : (i64) -> ()
                %1904 = func.call @stack_pop_pointer() : () -> i64
                %1905 = func.call @cc_cdr(%1904) : (i64) -> i64
                func.call @stack_push_pointer(%1905) : (i64) -> ()
                %1906 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1906) : (i64) -> ()
                %1907 = func.call @stack_depth() : () -> i64
                %1908 = arith.constant 0 : i64
                %1909 = arith.cmpi sgt, %1907, %1908 : i64
                scf.if %1909 {
                  %1910 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%1602) : (i64) -> ()
                %1911 = func.call @stack_pop_pointer() : () -> i64
                %1912 = func.call @cc_cdr(%1911) : (i64) -> i64
                func.call @stack_push_pointer(%1912) : (i64) -> ()
                %1913 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1913) : (i64) -> ()
                %1914 = func.call @stack_depth() : () -> i64
                %1915 = arith.constant 0 : i64
                %1916 = arith.cmpi sgt, %1914, %1915 : i64
                scf.if %1916 {
                  %1917 = func.call @stack_pop_pointer() : () -> i64
                }
                scf.yield %1789#2, %1789#3, %1789#1, %1906, %1913 : i64, i64, i64, i64, i64
              }
              func.call @stack_push_nil() : () -> ()
              %1918 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1552#2) : (i64) -> ()
              %1919 = func.call @stack_pop_pointer() : () -> i64
              %1920 = func.call @cc_multiple_value_list(%1919) : (i64) -> i64
              %1921 = llvm.mlir.addressof @str124 : !llvm.ptr
              %1922 = arith.constant 38 : i64
              %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
              %1924 = func.call @cc_nil_value() : () -> i64
              %1925 = func.call @cc_intern(%1923, %1924) : (i64, i64) -> i64
              %1926 = func.call @cc_nil_value() : () -> i64
              %1927 = func.call @cc_cons(%1925, %1926) : (i64, i64) -> i64
              %1928 = func.call @cc_values_pack(%1927) : (i64) -> i64
              %1929 = func.call @cc_symbol_value(%1925) : (i64) -> i64
              %1930 = llvm.mlir.addressof @str125 : !llvm.ptr
              %1931 = arith.constant 39 : i64
              %1932 = func.call @cc_make_string(%1930, %1931) : (!llvm.ptr, i64) -> i64
              %1933 = func.call @cc_nil_value() : () -> i64
              %1934 = func.call @cc_intern(%1932, %1933) : (i64, i64) -> i64
              %1935 = func.call @cc_nil_value() : () -> i64
              %1936 = func.call @cc_cons(%1934, %1935) : (i64, i64) -> i64
              %1937 = func.call @cc_values_pack(%1936) : (i64) -> i64
              %1938 = func.call @cc_symbol_value(%1934) : (i64) -> i64
              %1939 = llvm.mlir.addressof @str126 : !llvm.ptr
              %1940 = arith.constant 40 : i64
              %1941 = func.call @cc_make_string(%1939, %1940) : (!llvm.ptr, i64) -> i64
              %1942 = func.call @cc_nil_value() : () -> i64
              %1943 = func.call @cc_intern(%1941, %1942) : (i64, i64) -> i64
              %1944 = func.call @cc_nil_value() : () -> i64
              %1945 = func.call @cc_cons(%1943, %1944) : (i64, i64) -> i64
              %1946 = func.call @cc_values_pack(%1945) : (i64) -> i64
              %1947 = func.call @cc_symbol_value(%1943) : (i64) -> i64
              %1948 = func.call @cc_nil_value() : () -> i64
              %1949 = arith.cmpi ne, %1929, %1948 : i64
              %1950 = scf.if %1949 -> (i64) {
                scf.yield %1947 : i64
              } else {
                scf.yield %1920 : i64
              }
              %1951 = func.call @cc_values_pack(%1950) : (i64) -> i64
              func.call @stack_push_pointer(%1951) : (i64) -> ()
              %1952 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1952 : i64
            }
            func.call @stack_push_pointer(%1523) : (i64) -> ()
            %1953 = func.call @stack_pop_pointer() : () -> i64
            %1954 = func.call @stack_pop_pointer() : () -> i64
            %1955 = func.call @cc_nconc(%1954, %1953) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1955) : (i64) -> ()
            %1956 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1956) : (i64) -> ()
            %1957 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1957, %1956, %1315#2 : i64, i64, i64
          }
          func.call @stack_push_pointer(%1323#0) : (i64) -> ()
          %1958 = func.call @stack_depth() : () -> i64
          %1959 = arith.constant 0 : i64
          %1960 = arith.cmpi sgt, %1958, %1959 : i64
          scf.if %1960 {
            %1961 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1227) : (i64) -> ()
          %1962 = func.call @stack_pop_pointer() : () -> i64
          %1963 = func.call @cc_cdr(%1962) : (i64) -> i64
          func.call @stack_push_pointer(%1963) : (i64) -> ()
          %1964 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1964) : (i64) -> ()
          %1965 = func.call @stack_depth() : () -> i64
          %1966 = arith.constant 0 : i64
          %1967 = arith.cmpi sgt, %1965, %1966 : i64
          scf.if %1967 {
            %1968 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1323#2, %1323#1, %1964 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1969 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1196#1) : (i64) -> ()
        %1970 = func.call @stack_pop_pointer() : () -> i64
        %1971 = func.call @cc_multiple_value_list(%1970) : (i64) -> i64
        %1972 = llvm.mlir.addressof @str127 : !llvm.ptr
        %1973 = arith.constant 38 : i64
        %1974 = func.call @cc_make_string(%1972, %1973) : (!llvm.ptr, i64) -> i64
        %1975 = func.call @cc_nil_value() : () -> i64
        %1976 = func.call @cc_intern(%1974, %1975) : (i64, i64) -> i64
        %1977 = func.call @cc_nil_value() : () -> i64
        %1978 = func.call @cc_cons(%1976, %1977) : (i64, i64) -> i64
        %1979 = func.call @cc_values_pack(%1978) : (i64) -> i64
        %1980 = func.call @cc_symbol_value(%1976) : (i64) -> i64
        %1981 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1982 = arith.constant 39 : i64
        %1983 = func.call @cc_make_string(%1981, %1982) : (!llvm.ptr, i64) -> i64
        %1984 = func.call @cc_nil_value() : () -> i64
        %1985 = func.call @cc_intern(%1983, %1984) : (i64, i64) -> i64
        %1986 = func.call @cc_nil_value() : () -> i64
        %1987 = func.call @cc_cons(%1985, %1986) : (i64, i64) -> i64
        %1988 = func.call @cc_values_pack(%1987) : (i64) -> i64
        %1989 = func.call @cc_symbol_value(%1985) : (i64) -> i64
        %1990 = llvm.mlir.addressof @str129 : !llvm.ptr
        %1991 = arith.constant 40 : i64
        %1992 = func.call @cc_make_string(%1990, %1991) : (!llvm.ptr, i64) -> i64
        %1993 = func.call @cc_nil_value() : () -> i64
        %1994 = func.call @cc_intern(%1992, %1993) : (i64, i64) -> i64
        %1995 = func.call @cc_nil_value() : () -> i64
        %1996 = func.call @cc_cons(%1994, %1995) : (i64, i64) -> i64
        %1997 = func.call @cc_values_pack(%1996) : (i64) -> i64
        %1998 = func.call @cc_symbol_value(%1994) : (i64) -> i64
        %1999 = func.call @cc_nil_value() : () -> i64
        %2000 = arith.cmpi ne, %1980, %1999 : i64
        %2001 = scf.if %2000 -> (i64) {
          scf.yield %1998 : i64
        } else {
          scf.yield %1971 : i64
        }
        %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
        func.call @stack_push_pointer(%2002) : (i64) -> ()
        %2003 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2003 : i64
      }
      func.call @stack_push_pointer(%1167) : (i64) -> ()
      %2004 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1051) : (i64) -> ()
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      func.call @stack_push_pointer(%2004) : (i64) -> ()
      %2005 = llvm.mlir.addressof @str130 : !llvm.ptr
      %2006 = func.call @cc_make_function_ref_const(%2005) : (!llvm.ptr) -> i64
      %2007 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%2006, %2007) : (i64, i64) -> ()
      %2008 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2008 : i64
    }
    %2009 = func.call @cc_nil_value() : () -> i64
    %2010 = func.call @cc_errorp(%1049) : (i64) -> i64
    %2011 = arith.cmpi ne, %2010, %2009 : i64
    %2012 = scf.if %2011 -> (i64) {
      scf.yield %1049 : i64
    } else {
      %2013 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2013) : (i64) -> ()
      %2014 = func.call @stack_pop_pointer() : () -> i64
      %2015 = llvm.mlir.addressof @str131 : !llvm.ptr
      %2016 = arith.constant 27 : i64
      %2017 = func.call @cc_make_string(%2015, %2016) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2017) : (i64) -> ()
      %2018 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2019 = func.call @stack_pop_pointer() : () -> i64
      %2020 = llvm.mlir.addressof @str132 : !llvm.ptr
      %2021 = arith.constant 6 : i64
      %2022 = func.call @cc_make_string(%2020, %2021) : (!llvm.ptr, i64) -> i64
      %2023 = llvm.mlir.addressof @str133 : !llvm.ptr
      %2024 = arith.constant 11 : i64
      %2025 = func.call @cc_make_string(%2023, %2024) : (!llvm.ptr, i64) -> i64
      %2026 = func.call @cc_intern(%2022, %2025) : (i64, i64) -> i64
      %2027 = func.call @cc_nil_value() : () -> i64
      %2028 = func.call @cc_cons(%2026, %2027) : (i64, i64) -> i64
      %2029 = func.call @cc_values_pack(%2028) : (i64) -> i64
      func.call @stack_push_pointer(%2026) : (i64) -> ()
      %2030 = llvm.mlir.addressof @str134 : !llvm.ptr
      %2031 = arith.constant 8 : i64
      %2032 = func.call @cc_make_string(%2030, %2031) : (!llvm.ptr, i64) -> i64
      %2033 = llvm.mlir.addressof @str135 : !llvm.ptr
      %2034 = arith.constant 11 : i64
      %2035 = func.call @cc_make_string(%2033, %2034) : (!llvm.ptr, i64) -> i64
      %2036 = func.call @cc_intern(%2032, %2035) : (i64, i64) -> i64
      %2037 = func.call @cc_nil_value() : () -> i64
      %2038 = func.call @cc_cons(%2036, %2037) : (i64, i64) -> i64
      %2039 = func.call @cc_values_pack(%2038) : (i64) -> i64
      func.call @stack_push_pointer(%2036) : (i64) -> ()
      %2040 = llvm.mlir.addressof @str136 : !llvm.ptr
      %2041 = arith.constant 9 : i64
      %2042 = func.call @cc_make_string(%2040, %2041) : (!llvm.ptr, i64) -> i64
      %2043 = llvm.mlir.addressof @str137 : !llvm.ptr
      %2044 = arith.constant 11 : i64
      %2045 = func.call @cc_make_string(%2043, %2044) : (!llvm.ptr, i64) -> i64
      %2046 = func.call @cc_intern(%2042, %2045) : (i64, i64) -> i64
      %2047 = func.call @cc_nil_value() : () -> i64
      %2048 = func.call @cc_cons(%2046, %2047) : (i64, i64) -> i64
      %2049 = func.call @cc_values_pack(%2048) : (i64) -> i64
      func.call @stack_push_pointer(%2046) : (i64) -> ()
      %2050 = llvm.mlir.addressof @str138 : !llvm.ptr
      %2051 = arith.constant 6 : i64
      %2052 = func.call @cc_make_string(%2050, %2051) : (!llvm.ptr, i64) -> i64
      %2053 = llvm.mlir.addressof @str139 : !llvm.ptr
      %2054 = arith.constant 11 : i64
      %2055 = func.call @cc_make_string(%2053, %2054) : (!llvm.ptr, i64) -> i64
      %2056 = func.call @cc_intern(%2052, %2055) : (i64, i64) -> i64
      %2057 = func.call @cc_nil_value() : () -> i64
      %2058 = func.call @cc_cons(%2056, %2057) : (i64, i64) -> i64
      %2059 = func.call @cc_values_pack(%2058) : (i64) -> i64
      func.call @stack_push_pointer(%2056) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2060 = func.call @stack_pop_pointer() : () -> i64
      %2061 = func.call @stack_pop_pointer() : () -> i64
      %2062 = func.call @cc_cons(%2061, %2060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      %2063 = func.call @stack_pop_pointer() : () -> i64
      %2064 = func.call @stack_pop_pointer() : () -> i64
      %2065 = func.call @cc_cons(%2064, %2063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2065) : (i64) -> ()
      %2066 = func.call @stack_pop_pointer() : () -> i64
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @cc_cons(%2067, %2066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2068) : (i64) -> ()
      %2069 = func.call @stack_pop_pointer() : () -> i64
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @cc_cons(%2070, %2069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2071) : (i64) -> ()
      %2072 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = func.call @cc_nil_value() : () -> i64
      %2075 = func.call @cc_nil_value() : () -> i64
      %2076 = func.call @cc_errorp(%2074) : (i64) -> i64
      %2077 = arith.cmpi ne, %2076, %2075 : i64
      %2078 = scf.if %2077 -> (i64) {
        scf.yield %2074 : i64
      } else {
        %2079 = func.call @cc_nil_value() : () -> i64
        %2080 = llvm.mlir.addressof @str140 : !llvm.ptr
        %2081 = arith.constant 38 : i64
        %2082 = func.call @cc_make_string(%2080, %2081) : (!llvm.ptr, i64) -> i64
        %2083 = func.call @cc_nil_value() : () -> i64
        %2084 = func.call @cc_intern(%2082, %2083) : (i64, i64) -> i64
        %2085 = func.call @cc_nil_value() : () -> i64
        %2086 = func.call @cc_cons(%2084, %2085) : (i64, i64) -> i64
        %2087 = func.call @cc_values_pack(%2086) : (i64) -> i64
        %2088 = func.call @cc_set_symbol_value(%2084, %2079) : (i64, i64) -> i64
        %2089 = llvm.mlir.addressof @str141 : !llvm.ptr
        %2090 = arith.constant 39 : i64
        %2091 = func.call @cc_make_string(%2089, %2090) : (!llvm.ptr, i64) -> i64
        %2092 = func.call @cc_nil_value() : () -> i64
        %2093 = func.call @cc_intern(%2091, %2092) : (i64, i64) -> i64
        %2094 = func.call @cc_nil_value() : () -> i64
        %2095 = func.call @cc_cons(%2093, %2094) : (i64, i64) -> i64
        %2096 = func.call @cc_values_pack(%2095) : (i64) -> i64
        %2097 = func.call @cc_set_symbol_value(%2093, %2079) : (i64, i64) -> i64
        %2098 = llvm.mlir.addressof @str142 : !llvm.ptr
        %2099 = arith.constant 40 : i64
        %2100 = func.call @cc_make_string(%2098, %2099) : (!llvm.ptr, i64) -> i64
        %2101 = func.call @cc_nil_value() : () -> i64
        %2102 = func.call @cc_intern(%2100, %2101) : (i64, i64) -> i64
        %2103 = func.call @cc_nil_value() : () -> i64
        %2104 = func.call @cc_cons(%2102, %2103) : (i64, i64) -> i64
        %2105 = func.call @cc_values_pack(%2104) : (i64) -> i64
        %2106 = func.call @cc_set_symbol_value(%2102, %2079) : (i64, i64) -> i64
        %2107:3 = scf.while (%arg0 = %2019, %arg1 = %2073, %arg2 = %2072) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %2108 = func.call @stack_pop_pointer() : () -> i64
          %2109 = func.call @cc_nil_value() : () -> i64
          %2110 = arith.cmpi ne, %2108, %2109 : i64
          %2111 = func.call @cc_nil_value() : () -> i64
          %2112 = llvm.mlir.addressof @str143 : !llvm.ptr
          %2113 = arith.constant 38 : i64
          %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
          %2115 = func.call @cc_nil_value() : () -> i64
          %2116 = func.call @cc_intern(%2114, %2115) : (i64, i64) -> i64
          %2117 = func.call @cc_nil_value() : () -> i64
          %2118 = func.call @cc_cons(%2116, %2117) : (i64, i64) -> i64
          %2119 = func.call @cc_values_pack(%2118) : (i64) -> i64
          %2120 = func.call @cc_symbol_value(%2116) : (i64) -> i64
          %2121 = arith.cmpi ne, %2120, %2111 : i64
          %2122 = llvm.mlir.addressof @str144 : !llvm.ptr
          %2123 = arith.constant 38 : i64
          %2124 = func.call @cc_make_string(%2122, %2123) : (!llvm.ptr, i64) -> i64
          %2125 = func.call @cc_nil_value() : () -> i64
          %2126 = func.call @cc_intern(%2124, %2125) : (i64, i64) -> i64
          %2127 = func.call @cc_nil_value() : () -> i64
          %2128 = func.call @cc_cons(%2126, %2127) : (i64, i64) -> i64
          %2129 = func.call @cc_values_pack(%2128) : (i64) -> i64
          %2130 = func.call @cc_symbol_value(%2126) : (i64) -> i64
          %2131 = arith.cmpi ne, %2130, %2111 : i64
          %2132 = arith.ori %2121, %2131 : i1
          %2133 = arith.constant 0 : i1
          %2134 = arith.cmpi eq, %2132, %2133 : i1
          %2135 = arith.andi %2110, %2134 : i1
          scf.condition(%2135) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%2136: i64, %2137: i64, %2138: i64):
          %2139 = func.call @cc_nil_value() : () -> i64
          %2140 = func.call @cc_nil_value() : () -> i64
          %2141 = func.call @cc_errorp(%2139) : (i64) -> i64
          %2142 = arith.cmpi ne, %2141, %2140 : i64
          %2143:3 = scf.if %2142 -> (i64, i64, i64) {
            scf.yield %2139, %2137, %2136 : i64, i64, i64
          } else {
            %2144 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%2138) : (i64) -> ()
            %2145 = func.call @stack_pop_pointer() : () -> i64
            %2146 = func.call @cc_nil_value() : () -> i64
            %2147 = arith.cmpi eq, %2145, %2146 : i64
            %2149 = func.call @cc_t_value() : () -> i64
            %2148 = arith.select %2147, %2149, %2146 : i64
            func.call @stack_push_pointer(%2148) : (i64) -> ()
            %2150 = func.call @stack_pop_pointer() : () -> i64
            %2151 = func.call @cc_nil_value() : () -> i64
            %2152 = func.call @cc_cons(%2150, %2151) : (i64, i64) -> i64
            %2153 = func.call @cc_not(%2152) : (i64) -> i64
            func.call @stack_push_pointer(%2153) : (i64) -> ()
            %2154 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2138) : (i64) -> ()
            %2155 = func.call @stack_pop_pointer() : () -> i64
            %2156 = func.call @cc_is_cons(%2155) : (i64) -> i32
            %2157 = arith.constant 0 : i32
            %2158 = arith.cmpi ne, %2156, %2157 : i32
            %2159 = func.call @cc_t_value() : () -> i64
            %2160 = func.call @cc_nil_value() : () -> i64
            %2161 = arith.select %2158, %2159, %2160 : i64
            func.call @stack_push_pointer(%2161) : (i64) -> ()
            %2162 = func.call @stack_pop_pointer() : () -> i64
            %2163 = func.call @cc_nil_value() : () -> i64
            %2164 = func.call @cc_cons(%2162, %2163) : (i64, i64) -> i64
            %2165 = func.call @cc_not(%2164) : (i64) -> i64
            func.call @stack_push_pointer(%2165) : (i64) -> ()
            %2166 = func.call @stack_pop_pointer() : () -> i64
            %2167 = func.call @cc_cons(%2166, %2144) : (i64, i64) -> i64
            %2168 = func.call @cc_cons(%2154, %2167) : (i64, i64) -> i64
            %2169 = func.call @cc_and(%2168) : (i64) -> i64
            func.call @stack_push_pointer(%2169) : (i64) -> ()
            %2170 = func.call @stack_pop_pointer() : () -> i64
            %2171 = func.call @cc_nil_value() : () -> i64
            %2172 = arith.cmpi ne, %2170, %2171 : i64
            scf.if %2172 {
              %2173 = llvm.mlir.addressof @str145 : !llvm.ptr
              %2174 = arith.constant 10 : i64
              %2175 = func.call @cc_make_string(%2173, %2174) : (!llvm.ptr, i64) -> i64
              %2176 = func.call @cc_nil_value() : () -> i64
              %2177 = func.call @cc_intern(%2175, %2176) : (i64, i64) -> i64
              %2178 = func.call @cc_nil_value() : () -> i64
              %2179 = func.call @cc_cons(%2177, %2178) : (i64, i64) -> i64
              %2180 = func.call @cc_values_pack(%2179) : (i64) -> i64
              func.call @stack_push_pointer(%2177) : (i64) -> ()
              %2181 = func.call @stack_pop_pointer() : () -> i64
              %2182 = func.call @cc_nil_value() : () -> i64
              %2183 = func.call @cc_errorp(%2181) : (i64) -> i64
              %2184 = arith.cmpi ne, %2183, %2182 : i64
              %2185 = arith.cmpi eq, %2182, %2182 : i64
              %2186 = arith.andi %2184, %2185 : i1
              %2187 = scf.if %2186 -> (i64) {
                scf.yield %2181 : i64
              } else {
                scf.yield %2182 : i64
              }
              %2188 = arith.cmpi ne, %2187, %2182 : i64
              scf.if %2188 {
                func.call @stack_push_pointer(%2187) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%2181) : (i64) -> ()
                %2189 = llvm.mlir.addressof @str146 : !llvm.ptr
                %2190 = func.call @cc_make_function_ref_const(%2189) : (!llvm.ptr) -> i64
                %2191 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%2190, %2191) : (i64, i64) -> ()
              }
              %2192 = func.call @stack_pop_pointer() : () -> i64
              %2193 = func.call @cc_multiple_value_list(%2192) : (i64) -> i64
              %2194 = func.call @cc_t_value() : () -> i64
              %2195 = llvm.mlir.addressof @str147 : !llvm.ptr
              %2196 = arith.constant 38 : i64
              %2197 = func.call @cc_make_string(%2195, %2196) : (!llvm.ptr, i64) -> i64
              %2198 = func.call @cc_nil_value() : () -> i64
              %2199 = func.call @cc_intern(%2197, %2198) : (i64, i64) -> i64
              %2200 = func.call @cc_nil_value() : () -> i64
              %2201 = func.call @cc_cons(%2199, %2200) : (i64, i64) -> i64
              %2202 = func.call @cc_values_pack(%2201) : (i64) -> i64
              %2203 = func.call @cc_set_symbol_value(%2199, %2194) : (i64, i64) -> i64
              %2204 = llvm.mlir.addressof @str148 : !llvm.ptr
              %2205 = arith.constant 39 : i64
              %2206 = func.call @cc_make_string(%2204, %2205) : (!llvm.ptr, i64) -> i64
              %2207 = func.call @cc_nil_value() : () -> i64
              %2208 = func.call @cc_intern(%2206, %2207) : (i64, i64) -> i64
              %2209 = func.call @cc_nil_value() : () -> i64
              %2210 = func.call @cc_cons(%2208, %2209) : (i64, i64) -> i64
              %2211 = func.call @cc_values_pack(%2210) : (i64) -> i64
              %2212 = func.call @cc_set_symbol_value(%2208, %2192) : (i64, i64) -> i64
              %2213 = llvm.mlir.addressof @str149 : !llvm.ptr
              %2214 = arith.constant 40 : i64
              %2215 = func.call @cc_make_string(%2213, %2214) : (!llvm.ptr, i64) -> i64
              %2216 = func.call @cc_nil_value() : () -> i64
              %2217 = func.call @cc_intern(%2215, %2216) : (i64, i64) -> i64
              %2218 = func.call @cc_nil_value() : () -> i64
              %2219 = func.call @cc_cons(%2217, %2218) : (i64, i64) -> i64
              %2220 = func.call @cc_values_pack(%2219) : (i64) -> i64
              %2221 = func.call @cc_set_symbol_value(%2217, %2193) : (i64, i64) -> i64
              func.call @stack_push_pointer(%2192) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %2222 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2222, %2137, %2136 : i64, i64, i64
          }
          %2223 = func.call @cc_nil_value() : () -> i64
          %2224 = func.call @cc_errorp(%2143#0) : (i64) -> i64
          %2225 = arith.cmpi ne, %2224, %2223 : i64
          %2226:3 = scf.if %2225 -> (i64, i64, i64) {
            scf.yield %2143#0, %2143#1, %2143#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%2138) : (i64) -> ()
            %2227 = func.call @stack_pop_pointer() : () -> i64
            %2228 = func.call @cc_car(%2227) : (i64) -> i64
            func.call @stack_push_pointer(%2228) : (i64) -> ()
            %2229 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2229) : (i64) -> ()
            %2230 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2230, %2143#1, %2229 : i64, i64, i64
          }
          %2231 = func.call @cc_nil_value() : () -> i64
          %2232 = func.call @cc_errorp(%2226#0) : (i64) -> i64
          %2233 = arith.cmpi ne, %2232, %2231 : i64
          %2234:3 = scf.if %2233 -> (i64, i64, i64) {
            scf.yield %2226#0, %2226#1, %2226#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%2226#1) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2235 = func.call @stack_pop_pointer() : () -> i64
            %2236 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%2236) : (i64) -> ()
            %2237 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%2237) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2238 = func.call @stack_pop_pointer() : () -> i64
            %2239 = func.call @stack_pop_pointer() : () -> i64
            %2240 = func.call @cc_cons(%2239, %2238) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2240) : (i64) -> ()
            %2241 = func.call @stack_pop_pointer() : () -> i64
            %2242 = func.call @stack_pop_pointer() : () -> i64
            %2243 = func.call @cc_cons(%2242, %2241) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2243) : (i64) -> ()
            %2244 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%2244) : (i64) -> ()
            %2245 = llvm.mlir.addressof @str150 : !llvm.ptr
            %2246 = arith.constant 1 : i64
            %2247 = func.call @cc_parse_bignum(%2245, %2246) : (!llvm.ptr, i64) -> i64
            %2248 = llvm.mlir.addressof @str151 : !llvm.ptr
            %2249 = arith.constant 1 : i64
            %2250 = func.call @cc_parse_bignum(%2248, %2249) : (!llvm.ptr, i64) -> i64
            %2251 = func.call @cc_ratio(%2247, %2250) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2251) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2252 = func.call @stack_pop_pointer() : () -> i64
            %2253 = func.call @stack_pop_pointer() : () -> i64
            %2254 = func.call @cc_cons(%2253, %2252) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2254) : (i64) -> ()
            %2255 = func.call @stack_pop_pointer() : () -> i64
            %2256 = func.call @stack_pop_pointer() : () -> i64
            %2257 = func.call @cc_cons(%2256, %2255) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2257) : (i64) -> ()
            %2258 = llvm.mlir.addressof @str152 : !llvm.ptr
            %2259 = arith.constant 2 : i64
            %2260 = func.call @cc_parse_bignum(%2258, %2259) : (!llvm.ptr, i64) -> i64
            %2261 = llvm.mlir.addressof @str153 : !llvm.ptr
            %2262 = arith.constant 2 : i64
            %2263 = func.call @cc_parse_bignum(%2261, %2262) : (!llvm.ptr, i64) -> i64
            %2264 = func.call @cc_ratio(%2260, %2263) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2264) : (i64) -> ()
            %2265 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%2265) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2266 = func.call @stack_pop_pointer() : () -> i64
            %2267 = func.call @stack_pop_pointer() : () -> i64
            %2268 = func.call @cc_cons(%2267, %2266) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2268) : (i64) -> ()
            %2269 = func.call @stack_pop_pointer() : () -> i64
            %2270 = func.call @stack_pop_pointer() : () -> i64
            %2271 = func.call @cc_cons(%2270, %2269) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2271) : (i64) -> ()
            %2272 = arith.constant 3.0 : f64
            %2273 = func.call @cc_box_single_float(%2272) : (f64) -> i64
            func.call @stack_push_pointer(%2273) : (i64) -> ()
            %2274 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%2274) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2275 = func.call @stack_pop_pointer() : () -> i64
            %2276 = func.call @stack_pop_pointer() : () -> i64
            %2277 = func.call @cc_cons(%2276, %2275) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2277) : (i64) -> ()
            %2278 = func.call @stack_pop_pointer() : () -> i64
            %2279 = func.call @stack_pop_pointer() : () -> i64
            %2280 = func.call @cc_cons(%2279, %2278) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2280) : (i64) -> ()
            %2281 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%2281) : (i64) -> ()
            %2282 = arith.constant 2.0 : f64
            %2283 = func.call @cc_box_single_float(%2282) : (f64) -> i64
            func.call @stack_push_pointer(%2283) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2284 = func.call @stack_pop_pointer() : () -> i64
            %2285 = func.call @stack_pop_pointer() : () -> i64
            %2286 = func.call @cc_cons(%2285, %2284) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2286) : (i64) -> ()
            %2287 = func.call @stack_pop_pointer() : () -> i64
            %2288 = func.call @stack_pop_pointer() : () -> i64
            %2289 = func.call @cc_cons(%2288, %2287) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2289) : (i64) -> ()
            %2290 = arith.constant 3.0 : f64
            %2291 = func.call @cc_box_single_float(%2290) : (f64) -> i64
            func.call @stack_push_pointer(%2291) : (i64) -> ()
            %2292 = llvm.mlir.addressof @str154 : !llvm.ptr
            %2293 = arith.constant 1 : i64
            %2294 = func.call @cc_parse_bignum(%2292, %2293) : (!llvm.ptr, i64) -> i64
            %2295 = llvm.mlir.addressof @str155 : !llvm.ptr
            %2296 = arith.constant 1 : i64
            %2297 = func.call @cc_parse_bignum(%2295, %2296) : (!llvm.ptr, i64) -> i64
            %2298 = func.call @cc_ratio(%2294, %2297) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2298) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2299 = func.call @stack_pop_pointer() : () -> i64
            %2300 = func.call @stack_pop_pointer() : () -> i64
            %2301 = func.call @cc_cons(%2300, %2299) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2301) : (i64) -> ()
            %2302 = func.call @stack_pop_pointer() : () -> i64
            %2303 = func.call @stack_pop_pointer() : () -> i64
            %2304 = func.call @cc_cons(%2303, %2302) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2304) : (i64) -> ()
            %2305 = llvm.mlir.addressof @str156 : !llvm.ptr
            %2306 = arith.constant 2 : i64
            %2307 = func.call @cc_parse_bignum(%2305, %2306) : (!llvm.ptr, i64) -> i64
            %2308 = llvm.mlir.addressof @str157 : !llvm.ptr
            %2309 = arith.constant 2 : i64
            %2310 = func.call @cc_parse_bignum(%2308, %2309) : (!llvm.ptr, i64) -> i64
            %2311 = func.call @cc_ratio(%2307, %2310) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2311) : (i64) -> ()
            %2312 = arith.constant 2.0 : f64
            %2313 = func.call @cc_box_single_float(%2312) : (f64) -> i64
            func.call @stack_push_pointer(%2313) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2314 = func.call @stack_pop_pointer() : () -> i64
            %2315 = func.call @stack_pop_pointer() : () -> i64
            %2316 = func.call @cc_cons(%2315, %2314) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2316) : (i64) -> ()
            %2317 = func.call @stack_pop_pointer() : () -> i64
            %2318 = func.call @stack_pop_pointer() : () -> i64
            %2319 = func.call @cc_cons(%2318, %2317) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2319) : (i64) -> ()
            %2320 = arith.constant 3.0 : f64
            %2321 = func.call @cc_box_single_float(%2320) : (f64) -> i64
            func.call @stack_push_pointer(%2321) : (i64) -> ()
            %2322 = arith.constant 2.0 : f64
            %2323 = func.call @cc_box_float(%2322) : (f64) -> i64
            func.call @stack_push_pointer(%2323) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2324 = func.call @stack_pop_pointer() : () -> i64
            %2325 = func.call @stack_pop_pointer() : () -> i64
            %2326 = func.call @cc_cons(%2325, %2324) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2326) : (i64) -> ()
            %2327 = func.call @stack_pop_pointer() : () -> i64
            %2328 = func.call @stack_pop_pointer() : () -> i64
            %2329 = func.call @cc_cons(%2328, %2327) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2329) : (i64) -> ()
            %2330 = arith.constant 3.0 : f64
            %2331 = func.call @cc_box_float(%2330) : (f64) -> i64
            func.call @stack_push_pointer(%2331) : (i64) -> ()
            %2332 = arith.constant 2.0 : f64
            %2333 = func.call @cc_box_single_float(%2332) : (f64) -> i64
            func.call @stack_push_pointer(%2333) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2334 = func.call @stack_pop_pointer() : () -> i64
            %2335 = func.call @stack_pop_pointer() : () -> i64
            %2336 = func.call @cc_cons(%2335, %2334) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2336) : (i64) -> ()
            %2337 = func.call @stack_pop_pointer() : () -> i64
            %2338 = func.call @stack_pop_pointer() : () -> i64
            %2339 = func.call @cc_cons(%2338, %2337) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2339) : (i64) -> ()
            %2340 = arith.constant 3.0 : f64
            %2341 = func.call @cc_box_float(%2340) : (f64) -> i64
            func.call @stack_push_pointer(%2341) : (i64) -> ()
            %2342 = arith.constant 2.0 : f64
            %2343 = func.call @cc_box_float(%2342) : (f64) -> i64
            func.call @stack_push_pointer(%2343) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2344 = func.call @stack_pop_pointer() : () -> i64
            %2345 = func.call @stack_pop_pointer() : () -> i64
            %2346 = func.call @cc_cons(%2345, %2344) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2346) : (i64) -> ()
            %2347 = func.call @stack_pop_pointer() : () -> i64
            %2348 = func.call @stack_pop_pointer() : () -> i64
            %2349 = func.call @cc_cons(%2348, %2347) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2349) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2350 = func.call @stack_pop_pointer() : () -> i64
            %2351 = func.call @stack_pop_pointer() : () -> i64
            %2352 = func.call @cc_cons(%2351, %2350) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2352) : (i64) -> ()
            %2353 = func.call @stack_pop_pointer() : () -> i64
            %2354 = func.call @stack_pop_pointer() : () -> i64
            %2355 = func.call @cc_cons(%2354, %2353) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2355) : (i64) -> ()
            %2356 = func.call @stack_pop_pointer() : () -> i64
            %2357 = func.call @stack_pop_pointer() : () -> i64
            %2358 = func.call @cc_cons(%2357, %2356) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2358) : (i64) -> ()
            %2359 = func.call @stack_pop_pointer() : () -> i64
            %2360 = func.call @stack_pop_pointer() : () -> i64
            %2361 = func.call @cc_cons(%2360, %2359) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2361) : (i64) -> ()
            %2362 = func.call @stack_pop_pointer() : () -> i64
            %2363 = func.call @stack_pop_pointer() : () -> i64
            %2364 = func.call @cc_cons(%2363, %2362) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2364) : (i64) -> ()
            %2365 = func.call @stack_pop_pointer() : () -> i64
            %2366 = func.call @stack_pop_pointer() : () -> i64
            %2367 = func.call @cc_cons(%2366, %2365) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2367) : (i64) -> ()
            %2368 = func.call @stack_pop_pointer() : () -> i64
            %2369 = func.call @stack_pop_pointer() : () -> i64
            %2370 = func.call @cc_cons(%2369, %2368) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2370) : (i64) -> ()
            %2371 = func.call @stack_pop_pointer() : () -> i64
            %2372 = func.call @stack_pop_pointer() : () -> i64
            %2373 = func.call @cc_cons(%2372, %2371) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2373) : (i64) -> ()
            %2374 = func.call @stack_pop_pointer() : () -> i64
            %2375 = func.call @stack_pop_pointer() : () -> i64
            %2376 = func.call @cc_cons(%2375, %2374) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2376) : (i64) -> ()
            %2377 = func.call @stack_pop_pointer() : () -> i64
            %2378 = func.call @stack_pop_pointer() : () -> i64
            %2379 = func.call @cc_cons(%2378, %2377) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2379) : (i64) -> ()
            %2380 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %2381 = func.call @stack_pop_pointer() : () -> i64
            %2382 = llvm.mlir.addressof @str158 : !llvm.ptr
            %2383 = arith.constant 12 : i64
            %2384 = func.call @cc_make_string(%2382, %2383) : (!llvm.ptr, i64) -> i64
            %2385 = llvm.mlir.addressof @str159 : !llvm.ptr
            %2386 = arith.constant 11 : i64
            %2387 = func.call @cc_make_string(%2385, %2386) : (!llvm.ptr, i64) -> i64
            %2388 = func.call @cc_intern(%2384, %2387) : (i64, i64) -> i64
            %2389 = func.call @cc_nil_value() : () -> i64
            %2390 = func.call @cc_cons(%2388, %2389) : (i64, i64) -> i64
            %2391 = func.call @cc_values_pack(%2390) : (i64) -> i64
            func.call @stack_push_pointer(%2388) : (i64) -> ()
            %2392 = llvm.mlir.addressof @str160 : !llvm.ptr
            %2393 = arith.constant 12 : i64
            %2394 = func.call @cc_make_string(%2392, %2393) : (!llvm.ptr, i64) -> i64
            %2395 = llvm.mlir.addressof @str161 : !llvm.ptr
            %2396 = arith.constant 11 : i64
            %2397 = func.call @cc_make_string(%2395, %2396) : (!llvm.ptr, i64) -> i64
            %2398 = func.call @cc_intern(%2394, %2397) : (i64, i64) -> i64
            %2399 = func.call @cc_nil_value() : () -> i64
            %2400 = func.call @cc_cons(%2398, %2399) : (i64, i64) -> i64
            %2401 = func.call @cc_values_pack(%2400) : (i64) -> i64
            func.call @stack_push_pointer(%2398) : (i64) -> ()
            %2402 = llvm.mlir.addressof @str162 : !llvm.ptr
            %2403 = arith.constant 12 : i64
            %2404 = func.call @cc_make_string(%2402, %2403) : (!llvm.ptr, i64) -> i64
            %2405 = llvm.mlir.addressof @str163 : !llvm.ptr
            %2406 = arith.constant 11 : i64
            %2407 = func.call @cc_make_string(%2405, %2406) : (!llvm.ptr, i64) -> i64
            %2408 = func.call @cc_intern(%2404, %2407) : (i64, i64) -> i64
            %2409 = func.call @cc_nil_value() : () -> i64
            %2410 = func.call @cc_cons(%2408, %2409) : (i64, i64) -> i64
            %2411 = func.call @cc_values_pack(%2410) : (i64) -> i64
            func.call @stack_push_pointer(%2408) : (i64) -> ()
            %2412 = llvm.mlir.addressof @str164 : !llvm.ptr
            %2413 = arith.constant 12 : i64
            %2414 = func.call @cc_make_string(%2412, %2413) : (!llvm.ptr, i64) -> i64
            %2415 = llvm.mlir.addressof @str165 : !llvm.ptr
            %2416 = arith.constant 11 : i64
            %2417 = func.call @cc_make_string(%2415, %2416) : (!llvm.ptr, i64) -> i64
            %2418 = func.call @cc_intern(%2414, %2417) : (i64, i64) -> i64
            %2419 = func.call @cc_nil_value() : () -> i64
            %2420 = func.call @cc_cons(%2418, %2419) : (i64, i64) -> i64
            %2421 = func.call @cc_values_pack(%2420) : (i64) -> i64
            func.call @stack_push_pointer(%2418) : (i64) -> ()
            %2422 = llvm.mlir.addressof @str166 : !llvm.ptr
            %2423 = arith.constant 12 : i64
            %2424 = func.call @cc_make_string(%2422, %2423) : (!llvm.ptr, i64) -> i64
            %2425 = llvm.mlir.addressof @str167 : !llvm.ptr
            %2426 = arith.constant 11 : i64
            %2427 = func.call @cc_make_string(%2425, %2426) : (!llvm.ptr, i64) -> i64
            %2428 = func.call @cc_intern(%2424, %2427) : (i64, i64) -> i64
            %2429 = func.call @cc_nil_value() : () -> i64
            %2430 = func.call @cc_cons(%2428, %2429) : (i64, i64) -> i64
            %2431 = func.call @cc_values_pack(%2430) : (i64) -> i64
            func.call @stack_push_pointer(%2428) : (i64) -> ()
            %2432 = llvm.mlir.addressof @str168 : !llvm.ptr
            %2433 = arith.constant 12 : i64
            %2434 = func.call @cc_make_string(%2432, %2433) : (!llvm.ptr, i64) -> i64
            %2435 = llvm.mlir.addressof @str169 : !llvm.ptr
            %2436 = arith.constant 11 : i64
            %2437 = func.call @cc_make_string(%2435, %2436) : (!llvm.ptr, i64) -> i64
            %2438 = func.call @cc_intern(%2434, %2437) : (i64, i64) -> i64
            %2439 = func.call @cc_nil_value() : () -> i64
            %2440 = func.call @cc_cons(%2438, %2439) : (i64, i64) -> i64
            %2441 = func.call @cc_values_pack(%2440) : (i64) -> i64
            func.call @stack_push_pointer(%2438) : (i64) -> ()
            %2442 = llvm.mlir.addressof @str170 : !llvm.ptr
            %2443 = arith.constant 12 : i64
            %2444 = func.call @cc_make_string(%2442, %2443) : (!llvm.ptr, i64) -> i64
            %2445 = llvm.mlir.addressof @str171 : !llvm.ptr
            %2446 = arith.constant 11 : i64
            %2447 = func.call @cc_make_string(%2445, %2446) : (!llvm.ptr, i64) -> i64
            %2448 = func.call @cc_intern(%2444, %2447) : (i64, i64) -> i64
            %2449 = func.call @cc_nil_value() : () -> i64
            %2450 = func.call @cc_cons(%2448, %2449) : (i64, i64) -> i64
            %2451 = func.call @cc_values_pack(%2450) : (i64) -> i64
            func.call @stack_push_pointer(%2448) : (i64) -> ()
            %2452 = llvm.mlir.addressof @str172 : !llvm.ptr
            %2453 = arith.constant 12 : i64
            %2454 = func.call @cc_make_string(%2452, %2453) : (!llvm.ptr, i64) -> i64
            %2455 = llvm.mlir.addressof @str173 : !llvm.ptr
            %2456 = arith.constant 11 : i64
            %2457 = func.call @cc_make_string(%2455, %2456) : (!llvm.ptr, i64) -> i64
            %2458 = func.call @cc_intern(%2454, %2457) : (i64, i64) -> i64
            %2459 = func.call @cc_nil_value() : () -> i64
            %2460 = func.call @cc_cons(%2458, %2459) : (i64, i64) -> i64
            %2461 = func.call @cc_values_pack(%2460) : (i64) -> i64
            func.call @stack_push_pointer(%2458) : (i64) -> ()
            %2462 = llvm.mlir.addressof @str174 : !llvm.ptr
            %2463 = arith.constant 12 : i64
            %2464 = func.call @cc_make_string(%2462, %2463) : (!llvm.ptr, i64) -> i64
            %2465 = llvm.mlir.addressof @str175 : !llvm.ptr
            %2466 = arith.constant 11 : i64
            %2467 = func.call @cc_make_string(%2465, %2466) : (!llvm.ptr, i64) -> i64
            %2468 = func.call @cc_intern(%2464, %2467) : (i64, i64) -> i64
            %2469 = func.call @cc_nil_value() : () -> i64
            %2470 = func.call @cc_cons(%2468, %2469) : (i64, i64) -> i64
            %2471 = func.call @cc_values_pack(%2470) : (i64) -> i64
            func.call @stack_push_pointer(%2468) : (i64) -> ()
            %2472 = llvm.mlir.addressof @str176 : !llvm.ptr
            %2473 = arith.constant 12 : i64
            %2474 = func.call @cc_make_string(%2472, %2473) : (!llvm.ptr, i64) -> i64
            %2475 = llvm.mlir.addressof @str177 : !llvm.ptr
            %2476 = arith.constant 11 : i64
            %2477 = func.call @cc_make_string(%2475, %2476) : (!llvm.ptr, i64) -> i64
            %2478 = func.call @cc_intern(%2474, %2477) : (i64, i64) -> i64
            %2479 = func.call @cc_nil_value() : () -> i64
            %2480 = func.call @cc_cons(%2478, %2479) : (i64, i64) -> i64
            %2481 = func.call @cc_values_pack(%2480) : (i64) -> i64
            func.call @stack_push_pointer(%2478) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %2482 = func.call @stack_pop_pointer() : () -> i64
            %2483 = func.call @stack_pop_pointer() : () -> i64
            %2484 = func.call @cc_cons(%2483, %2482) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2484) : (i64) -> ()
            %2485 = func.call @stack_pop_pointer() : () -> i64
            %2486 = func.call @stack_pop_pointer() : () -> i64
            %2487 = func.call @cc_cons(%2486, %2485) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2487) : (i64) -> ()
            %2488 = func.call @stack_pop_pointer() : () -> i64
            %2489 = func.call @stack_pop_pointer() : () -> i64
            %2490 = func.call @cc_cons(%2489, %2488) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2490) : (i64) -> ()
            %2491 = func.call @stack_pop_pointer() : () -> i64
            %2492 = func.call @stack_pop_pointer() : () -> i64
            %2493 = func.call @cc_cons(%2492, %2491) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2493) : (i64) -> ()
            %2494 = func.call @stack_pop_pointer() : () -> i64
            %2495 = func.call @stack_pop_pointer() : () -> i64
            %2496 = func.call @cc_cons(%2495, %2494) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2496) : (i64) -> ()
            %2497 = func.call @stack_pop_pointer() : () -> i64
            %2498 = func.call @stack_pop_pointer() : () -> i64
            %2499 = func.call @cc_cons(%2498, %2497) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2499) : (i64) -> ()
            %2500 = func.call @stack_pop_pointer() : () -> i64
            %2501 = func.call @stack_pop_pointer() : () -> i64
            %2502 = func.call @cc_cons(%2501, %2500) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2502) : (i64) -> ()
            %2503 = func.call @stack_pop_pointer() : () -> i64
            %2504 = func.call @stack_pop_pointer() : () -> i64
            %2505 = func.call @cc_cons(%2504, %2503) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2505) : (i64) -> ()
            %2506 = func.call @stack_pop_pointer() : () -> i64
            %2507 = func.call @stack_pop_pointer() : () -> i64
            %2508 = func.call @cc_cons(%2507, %2506) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2508) : (i64) -> ()
            %2509 = func.call @stack_pop_pointer() : () -> i64
            %2510 = func.call @stack_pop_pointer() : () -> i64
            %2511 = func.call @cc_cons(%2510, %2509) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2511) : (i64) -> ()
            %2512 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %2513 = func.call @stack_pop_pointer() : () -> i64
            %2514 = func.call @cc_nil_value() : () -> i64
            %2515 = func.call @cc_nil_value() : () -> i64
            %2516 = func.call @cc_errorp(%2514) : (i64) -> i64
            %2517 = arith.cmpi ne, %2516, %2515 : i64
            %2518 = scf.if %2517 -> (i64) {
              scf.yield %2514 : i64
            } else {
              %2519 = func.call @cc_nil_value() : () -> i64
              %2520 = llvm.mlir.addressof @str178 : !llvm.ptr
              %2521 = arith.constant 38 : i64
              %2522 = func.call @cc_make_string(%2520, %2521) : (!llvm.ptr, i64) -> i64
              %2523 = func.call @cc_nil_value() : () -> i64
              %2524 = func.call @cc_intern(%2522, %2523) : (i64, i64) -> i64
              %2525 = func.call @cc_nil_value() : () -> i64
              %2526 = func.call @cc_cons(%2524, %2525) : (i64, i64) -> i64
              %2527 = func.call @cc_values_pack(%2526) : (i64) -> i64
              %2528 = func.call @cc_set_symbol_value(%2524, %2519) : (i64, i64) -> i64
              %2529 = llvm.mlir.addressof @str179 : !llvm.ptr
              %2530 = arith.constant 39 : i64
              %2531 = func.call @cc_make_string(%2529, %2530) : (!llvm.ptr, i64) -> i64
              %2532 = func.call @cc_nil_value() : () -> i64
              %2533 = func.call @cc_intern(%2531, %2532) : (i64, i64) -> i64
              %2534 = func.call @cc_nil_value() : () -> i64
              %2535 = func.call @cc_cons(%2533, %2534) : (i64, i64) -> i64
              %2536 = func.call @cc_values_pack(%2535) : (i64) -> i64
              %2537 = func.call @cc_set_symbol_value(%2533, %2519) : (i64, i64) -> i64
              %2538 = llvm.mlir.addressof @str180 : !llvm.ptr
              %2539 = arith.constant 40 : i64
              %2540 = func.call @cc_make_string(%2538, %2539) : (!llvm.ptr, i64) -> i64
              %2541 = func.call @cc_nil_value() : () -> i64
              %2542 = func.call @cc_intern(%2540, %2541) : (i64, i64) -> i64
              %2543 = func.call @cc_nil_value() : () -> i64
              %2544 = func.call @cc_cons(%2542, %2543) : (i64, i64) -> i64
              %2545 = func.call @cc_values_pack(%2544) : (i64) -> i64
              %2546 = func.call @cc_set_symbol_value(%2542, %2519) : (i64, i64) -> i64
              %2547:5 = scf.while (%arg0 = %2235, %arg1 = %2381, %arg2 = %2513, %arg3 = %2512, %arg4 = %2380) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
                %2548 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%arg4) : (i64) -> ()
                %2549 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%arg3) : (i64) -> ()
                %2550 = func.call @stack_pop_pointer() : () -> i64
                %2551 = func.call @cc_cons(%2550, %2548) : (i64, i64) -> i64
                %2552 = func.call @cc_cons(%2549, %2551) : (i64, i64) -> i64
                %2553 = func.call @cc_and(%2552) : (i64) -> i64
                func.call @stack_push_pointer(%2553) : (i64) -> ()
                %2554 = func.call @stack_pop_pointer() : () -> i64
                %2555 = func.call @cc_nil_value() : () -> i64
                %2556 = arith.cmpi ne, %2554, %2555 : i64
                %2557 = func.call @cc_nil_value() : () -> i64
                %2558 = llvm.mlir.addressof @str181 : !llvm.ptr
                %2559 = arith.constant 38 : i64
                %2560 = func.call @cc_make_string(%2558, %2559) : (!llvm.ptr, i64) -> i64
                %2561 = func.call @cc_nil_value() : () -> i64
                %2562 = func.call @cc_intern(%2560, %2561) : (i64, i64) -> i64
                %2563 = func.call @cc_nil_value() : () -> i64
                %2564 = func.call @cc_cons(%2562, %2563) : (i64, i64) -> i64
                %2565 = func.call @cc_values_pack(%2564) : (i64) -> i64
                %2566 = func.call @cc_symbol_value(%2562) : (i64) -> i64
                %2567 = arith.cmpi ne, %2566, %2557 : i64
                %2568 = llvm.mlir.addressof @str182 : !llvm.ptr
                %2569 = arith.constant 38 : i64
                %2570 = func.call @cc_make_string(%2568, %2569) : (!llvm.ptr, i64) -> i64
                %2571 = func.call @cc_nil_value() : () -> i64
                %2572 = func.call @cc_intern(%2570, %2571) : (i64, i64) -> i64
                %2573 = func.call @cc_nil_value() : () -> i64
                %2574 = func.call @cc_cons(%2572, %2573) : (i64, i64) -> i64
                %2575 = func.call @cc_values_pack(%2574) : (i64) -> i64
                %2576 = func.call @cc_symbol_value(%2572) : (i64) -> i64
                %2577 = arith.cmpi ne, %2576, %2557 : i64
                %2578 = arith.ori %2567, %2577 : i1
                %2579 = llvm.mlir.addressof @str183 : !llvm.ptr
                %2580 = arith.constant 38 : i64
                %2581 = func.call @cc_make_string(%2579, %2580) : (!llvm.ptr, i64) -> i64
                %2582 = func.call @cc_nil_value() : () -> i64
                %2583 = func.call @cc_intern(%2581, %2582) : (i64, i64) -> i64
                %2584 = func.call @cc_nil_value() : () -> i64
                %2585 = func.call @cc_cons(%2583, %2584) : (i64, i64) -> i64
                %2586 = func.call @cc_values_pack(%2585) : (i64) -> i64
                %2587 = func.call @cc_symbol_value(%2583) : (i64) -> i64
                %2588 = arith.cmpi ne, %2587, %2557 : i64
                %2589 = arith.ori %2578, %2588 : i1
                %2590 = arith.constant 0 : i1
                %2591 = arith.cmpi eq, %2589, %2590 : i1
                %2592 = arith.andi %2556, %2591 : i1
                scf.condition(%2592) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
              } do {
                ^bb0(%2593: i64, %2594: i64, %2595: i64, %2596: i64, %2597: i64):
                %2598 = func.call @cc_nil_value() : () -> i64
                %2599 = func.call @cc_nil_value() : () -> i64
                %2600 = func.call @cc_errorp(%2598) : (i64) -> i64
                %2601 = arith.cmpi ne, %2600, %2599 : i64
                %2602:4 = scf.if %2601 -> (i64, i64, i64, i64) {
                  scf.yield %2598, %2595, %2593, %2594 : i64, i64, i64, i64
                } else {
                  %2603 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%2597) : (i64) -> ()
                  %2604 = func.call @stack_pop_pointer() : () -> i64
                  %2605 = func.call @cc_nil_value() : () -> i64
                  %2606 = arith.cmpi eq, %2604, %2605 : i64
                  %2608 = func.call @cc_t_value() : () -> i64
                  %2607 = arith.select %2606, %2608, %2605 : i64
                  func.call @stack_push_pointer(%2607) : (i64) -> ()
                  %2609 = func.call @stack_pop_pointer() : () -> i64
                  %2610 = func.call @cc_nil_value() : () -> i64
                  %2611 = func.call @cc_cons(%2609, %2610) : (i64, i64) -> i64
                  %2612 = func.call @cc_not(%2611) : (i64) -> i64
                  func.call @stack_push_pointer(%2612) : (i64) -> ()
                  %2613 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%2597) : (i64) -> ()
                  %2614 = func.call @stack_pop_pointer() : () -> i64
                  %2615 = func.call @cc_is_cons(%2614) : (i64) -> i32
                  %2616 = arith.constant 0 : i32
                  %2617 = arith.cmpi ne, %2615, %2616 : i32
                  %2618 = func.call @cc_t_value() : () -> i64
                  %2619 = func.call @cc_nil_value() : () -> i64
                  %2620 = arith.select %2617, %2618, %2619 : i64
                  func.call @stack_push_pointer(%2620) : (i64) -> ()
                  %2621 = func.call @stack_pop_pointer() : () -> i64
                  %2622 = func.call @cc_nil_value() : () -> i64
                  %2623 = func.call @cc_cons(%2621, %2622) : (i64, i64) -> i64
                  %2624 = func.call @cc_not(%2623) : (i64) -> i64
                  func.call @stack_push_pointer(%2624) : (i64) -> ()
                  %2625 = func.call @stack_pop_pointer() : () -> i64
                  %2626 = func.call @cc_cons(%2625, %2603) : (i64, i64) -> i64
                  %2627 = func.call @cc_cons(%2613, %2626) : (i64, i64) -> i64
                  %2628 = func.call @cc_and(%2627) : (i64) -> i64
                  func.call @stack_push_pointer(%2628) : (i64) -> ()
                  %2629 = func.call @stack_pop_pointer() : () -> i64
                  %2630 = func.call @cc_nil_value() : () -> i64
                  %2631 = arith.cmpi ne, %2629, %2630 : i64
                  scf.if %2631 {
                    %2632 = llvm.mlir.addressof @str184 : !llvm.ptr
                    %2633 = arith.constant 10 : i64
                    %2634 = func.call @cc_make_string(%2632, %2633) : (!llvm.ptr, i64) -> i64
                    %2635 = func.call @cc_nil_value() : () -> i64
                    %2636 = func.call @cc_intern(%2634, %2635) : (i64, i64) -> i64
                    %2637 = func.call @cc_nil_value() : () -> i64
                    %2638 = func.call @cc_cons(%2636, %2637) : (i64, i64) -> i64
                    %2639 = func.call @cc_values_pack(%2638) : (i64) -> i64
                    func.call @stack_push_pointer(%2636) : (i64) -> ()
                    %2640 = func.call @stack_pop_pointer() : () -> i64
                    %2641 = func.call @cc_nil_value() : () -> i64
                    %2642 = func.call @cc_errorp(%2640) : (i64) -> i64
                    %2643 = arith.cmpi ne, %2642, %2641 : i64
                    %2644 = arith.cmpi eq, %2641, %2641 : i64
                    %2645 = arith.andi %2643, %2644 : i1
                    %2646 = scf.if %2645 -> (i64) {
                      scf.yield %2640 : i64
                    } else {
                      scf.yield %2641 : i64
                    }
                    %2647 = arith.cmpi ne, %2646, %2641 : i64
                    scf.if %2647 {
                      func.call @stack_push_pointer(%2646) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%2640) : (i64) -> ()
                      %2648 = llvm.mlir.addressof @str185 : !llvm.ptr
                      %2649 = func.call @cc_make_function_ref_const(%2648) : (!llvm.ptr) -> i64
                      %2650 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%2649, %2650) : (i64, i64) -> ()
                    }
                    %2651 = func.call @stack_pop_pointer() : () -> i64
                    %2652 = func.call @cc_multiple_value_list(%2651) : (i64) -> i64
                    %2653 = func.call @cc_t_value() : () -> i64
                    %2654 = llvm.mlir.addressof @str186 : !llvm.ptr
                    %2655 = arith.constant 38 : i64
                    %2656 = func.call @cc_make_string(%2654, %2655) : (!llvm.ptr, i64) -> i64
                    %2657 = func.call @cc_nil_value() : () -> i64
                    %2658 = func.call @cc_intern(%2656, %2657) : (i64, i64) -> i64
                    %2659 = func.call @cc_nil_value() : () -> i64
                    %2660 = func.call @cc_cons(%2658, %2659) : (i64, i64) -> i64
                    %2661 = func.call @cc_values_pack(%2660) : (i64) -> i64
                    %2662 = func.call @cc_set_symbol_value(%2658, %2653) : (i64, i64) -> i64
                    %2663 = llvm.mlir.addressof @str187 : !llvm.ptr
                    %2664 = arith.constant 39 : i64
                    %2665 = func.call @cc_make_string(%2663, %2664) : (!llvm.ptr, i64) -> i64
                    %2666 = func.call @cc_nil_value() : () -> i64
                    %2667 = func.call @cc_intern(%2665, %2666) : (i64, i64) -> i64
                    %2668 = func.call @cc_nil_value() : () -> i64
                    %2669 = func.call @cc_cons(%2667, %2668) : (i64, i64) -> i64
                    %2670 = func.call @cc_values_pack(%2669) : (i64) -> i64
                    %2671 = func.call @cc_set_symbol_value(%2667, %2651) : (i64, i64) -> i64
                    %2672 = llvm.mlir.addressof @str188 : !llvm.ptr
                    %2673 = arith.constant 40 : i64
                    %2674 = func.call @cc_make_string(%2672, %2673) : (!llvm.ptr, i64) -> i64
                    %2675 = func.call @cc_nil_value() : () -> i64
                    %2676 = func.call @cc_intern(%2674, %2675) : (i64, i64) -> i64
                    %2677 = func.call @cc_nil_value() : () -> i64
                    %2678 = func.call @cc_cons(%2676, %2677) : (i64, i64) -> i64
                    %2679 = func.call @cc_values_pack(%2678) : (i64) -> i64
                    %2680 = func.call @cc_set_symbol_value(%2676, %2652) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%2651) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %2681 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %2681, %2595, %2593, %2594 : i64, i64, i64, i64
                }
                %2682 = func.call @cc_nil_value() : () -> i64
                %2683 = func.call @cc_errorp(%2602#0) : (i64) -> i64
                %2684 = arith.cmpi ne, %2683, %2682 : i64
                %2685:4 = scf.if %2684 -> (i64, i64, i64, i64) {
                  scf.yield %2602#0, %2602#1, %2602#2, %2602#3 : i64, i64, i64, i64
                } else {
                  %2686 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%2596) : (i64) -> ()
                  %2687 = func.call @stack_pop_pointer() : () -> i64
                  %2688 = func.call @cc_nil_value() : () -> i64
                  %2689 = arith.cmpi eq, %2687, %2688 : i64
                  %2691 = func.call @cc_t_value() : () -> i64
                  %2690 = arith.select %2689, %2691, %2688 : i64
                  func.call @stack_push_pointer(%2690) : (i64) -> ()
                  %2692 = func.call @stack_pop_pointer() : () -> i64
                  %2693 = func.call @cc_nil_value() : () -> i64
                  %2694 = func.call @cc_cons(%2692, %2693) : (i64, i64) -> i64
                  %2695 = func.call @cc_not(%2694) : (i64) -> i64
                  func.call @stack_push_pointer(%2695) : (i64) -> ()
                  %2696 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%2596) : (i64) -> ()
                  %2697 = func.call @stack_pop_pointer() : () -> i64
                  %2698 = func.call @cc_is_cons(%2697) : (i64) -> i32
                  %2699 = arith.constant 0 : i32
                  %2700 = arith.cmpi ne, %2698, %2699 : i32
                  %2701 = func.call @cc_t_value() : () -> i64
                  %2702 = func.call @cc_nil_value() : () -> i64
                  %2703 = arith.select %2700, %2701, %2702 : i64
                  func.call @stack_push_pointer(%2703) : (i64) -> ()
                  %2704 = func.call @stack_pop_pointer() : () -> i64
                  %2705 = func.call @cc_nil_value() : () -> i64
                  %2706 = func.call @cc_cons(%2704, %2705) : (i64, i64) -> i64
                  %2707 = func.call @cc_not(%2706) : (i64) -> i64
                  func.call @stack_push_pointer(%2707) : (i64) -> ()
                  %2708 = func.call @stack_pop_pointer() : () -> i64
                  %2709 = func.call @cc_cons(%2708, %2686) : (i64, i64) -> i64
                  %2710 = func.call @cc_cons(%2696, %2709) : (i64, i64) -> i64
                  %2711 = func.call @cc_and(%2710) : (i64) -> i64
                  func.call @stack_push_pointer(%2711) : (i64) -> ()
                  %2712 = func.call @stack_pop_pointer() : () -> i64
                  %2713 = func.call @cc_nil_value() : () -> i64
                  %2714 = arith.cmpi ne, %2712, %2713 : i64
                  scf.if %2714 {
                    %2715 = llvm.mlir.addressof @str189 : !llvm.ptr
                    %2716 = arith.constant 10 : i64
                    %2717 = func.call @cc_make_string(%2715, %2716) : (!llvm.ptr, i64) -> i64
                    %2718 = func.call @cc_nil_value() : () -> i64
                    %2719 = func.call @cc_intern(%2717, %2718) : (i64, i64) -> i64
                    %2720 = func.call @cc_nil_value() : () -> i64
                    %2721 = func.call @cc_cons(%2719, %2720) : (i64, i64) -> i64
                    %2722 = func.call @cc_values_pack(%2721) : (i64) -> i64
                    func.call @stack_push_pointer(%2719) : (i64) -> ()
                    %2723 = func.call @stack_pop_pointer() : () -> i64
                    %2724 = func.call @cc_nil_value() : () -> i64
                    %2725 = func.call @cc_errorp(%2723) : (i64) -> i64
                    %2726 = arith.cmpi ne, %2725, %2724 : i64
                    %2727 = arith.cmpi eq, %2724, %2724 : i64
                    %2728 = arith.andi %2726, %2727 : i1
                    %2729 = scf.if %2728 -> (i64) {
                      scf.yield %2723 : i64
                    } else {
                      scf.yield %2724 : i64
                    }
                    %2730 = arith.cmpi ne, %2729, %2724 : i64
                    scf.if %2730 {
                      func.call @stack_push_pointer(%2729) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%2723) : (i64) -> ()
                      %2731 = llvm.mlir.addressof @str190 : !llvm.ptr
                      %2732 = func.call @cc_make_function_ref_const(%2731) : (!llvm.ptr) -> i64
                      %2733 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%2732, %2733) : (i64, i64) -> ()
                    }
                    %2734 = func.call @stack_pop_pointer() : () -> i64
                    %2735 = func.call @cc_multiple_value_list(%2734) : (i64) -> i64
                    %2736 = func.call @cc_t_value() : () -> i64
                    %2737 = llvm.mlir.addressof @str191 : !llvm.ptr
                    %2738 = arith.constant 38 : i64
                    %2739 = func.call @cc_make_string(%2737, %2738) : (!llvm.ptr, i64) -> i64
                    %2740 = func.call @cc_nil_value() : () -> i64
                    %2741 = func.call @cc_intern(%2739, %2740) : (i64, i64) -> i64
                    %2742 = func.call @cc_nil_value() : () -> i64
                    %2743 = func.call @cc_cons(%2741, %2742) : (i64, i64) -> i64
                    %2744 = func.call @cc_values_pack(%2743) : (i64) -> i64
                    %2745 = func.call @cc_set_symbol_value(%2741, %2736) : (i64, i64) -> i64
                    %2746 = llvm.mlir.addressof @str192 : !llvm.ptr
                    %2747 = arith.constant 39 : i64
                    %2748 = func.call @cc_make_string(%2746, %2747) : (!llvm.ptr, i64) -> i64
                    %2749 = func.call @cc_nil_value() : () -> i64
                    %2750 = func.call @cc_intern(%2748, %2749) : (i64, i64) -> i64
                    %2751 = func.call @cc_nil_value() : () -> i64
                    %2752 = func.call @cc_cons(%2750, %2751) : (i64, i64) -> i64
                    %2753 = func.call @cc_values_pack(%2752) : (i64) -> i64
                    %2754 = func.call @cc_set_symbol_value(%2750, %2734) : (i64, i64) -> i64
                    %2755 = llvm.mlir.addressof @str193 : !llvm.ptr
                    %2756 = arith.constant 40 : i64
                    %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
                    %2758 = func.call @cc_nil_value() : () -> i64
                    %2759 = func.call @cc_intern(%2757, %2758) : (i64, i64) -> i64
                    %2760 = func.call @cc_nil_value() : () -> i64
                    %2761 = func.call @cc_cons(%2759, %2760) : (i64, i64) -> i64
                    %2762 = func.call @cc_values_pack(%2761) : (i64) -> i64
                    %2763 = func.call @cc_set_symbol_value(%2759, %2735) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%2734) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %2764 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %2764, %2602#1, %2602#2, %2602#3 : i64, i64, i64, i64
                }
                %2765 = func.call @cc_nil_value() : () -> i64
                %2766 = func.call @cc_errorp(%2685#0) : (i64) -> i64
                %2767 = arith.cmpi ne, %2766, %2765 : i64
                %2768:4 = scf.if %2767 -> (i64, i64, i64, i64) {
                  scf.yield %2685#0, %2685#1, %2685#2, %2685#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%2597) : (i64) -> ()
                  %2769 = func.call @stack_pop_pointer() : () -> i64
                  %2770 = func.call @cc_car(%2769) : (i64) -> i64
                  func.call @stack_push_pointer(%2770) : (i64) -> ()
                  %2771 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%2771) : (i64) -> ()
                  %2772 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %2772, %2685#1, %2771, %2685#3 : i64, i64, i64, i64
                }
                %2773 = func.call @cc_nil_value() : () -> i64
                %2774 = func.call @cc_errorp(%2768#0) : (i64) -> i64
                %2775 = arith.cmpi ne, %2774, %2773 : i64
                %2776:4 = scf.if %2775 -> (i64, i64, i64, i64) {
                  scf.yield %2768#0, %2768#1, %2768#2, %2768#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%2596) : (i64) -> ()
                  %2777 = func.call @stack_pop_pointer() : () -> i64
                  %2778 = func.call @cc_car(%2777) : (i64) -> i64
                  func.call @stack_push_pointer(%2778) : (i64) -> ()
                  %2779 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%2779) : (i64) -> ()
                  %2780 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %2780, %2768#1, %2768#2, %2779 : i64, i64, i64, i64
                }
                %2781 = func.call @cc_nil_value() : () -> i64
                %2782 = func.call @cc_errorp(%2776#0) : (i64) -> i64
                %2783 = arith.cmpi ne, %2782, %2781 : i64
                %2784:4 = scf.if %2783 -> (i64, i64, i64, i64) {
                  scf.yield %2776#0, %2776#1, %2776#2, %2776#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%2226#2) : (i64) -> ()
                  %2785 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%2776#2) : (i64) -> ()
                  %2786 = func.call @stack_pop_pointer() : () -> i64
                  %2787 = func.call @cc_apply(%2785, %2786) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%2787) : (i64) -> ()
                  func.call @stack_push_pointer(%2776#3) : (i64) -> ()
                  %2788 = func.call @stack_pop_pointer() : () -> i64
                  %2789 = func.call @stack_pop_pointer() : () -> i64
                  %2790 = func.call @cc_typep(%2789, %2788) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%2790) : (i64) -> ()
                  %2791 = func.call @stack_pop_pointer() : () -> i64
                  %2792 = func.call @cc_nil_value() : () -> i64
                  %2793 = func.call @cc_cons(%2791, %2792) : (i64, i64) -> i64
                  %2794 = func.call @cc_not(%2793) : (i64) -> i64
                  func.call @stack_push_pointer(%2794) : (i64) -> ()
                  %2795 = func.call @stack_pop_pointer() : () -> i64
                  %2796 = func.call @cc_nil_value() : () -> i64
                  %2797 = arith.cmpi ne, %2795, %2796 : i64
                  %2798:2 = scf.if %2797 -> (i64, i64) {
                    %2799 = func.call @cc_nil_value() : () -> i64
                    %2800 = func.call @cc_nil_value() : () -> i64
                    %2801 = func.call @cc_errorp(%2799) : (i64) -> i64
                    %2802 = arith.cmpi ne, %2801, %2800 : i64
                    %2803:2 = scf.if %2802 -> (i64, i64) {
                      scf.yield %2799, %2776#1 : i64, i64
                    } else {
                      func.call @stack_push_pointer(%2776#1) : (i64) -> ()
                      func.call @stack_push_pointer(%2226#2) : (i64) -> ()
                      %2804 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2776#2) : (i64) -> ()
                      %2805 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2226#2) : (i64) -> ()
                      %2806 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2776#2) : (i64) -> ()
                      %2807 = func.call @stack_pop_pointer() : () -> i64
                      %2808 = func.call @cc_apply(%2806, %2807) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%2808) : (i64) -> ()
                      %2809 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2226#2) : (i64) -> ()
                      %2810 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2776#2) : (i64) -> ()
                      %2811 = func.call @stack_pop_pointer() : () -> i64
                      %2812 = func.call @cc_apply(%2810, %2811) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%2812) : (i64) -> ()
                      %2813 = func.call @stack_pop_pointer() : () -> i64
                      %2814 = func.call @cc_type_of(%2813) : (i64) -> i64
                      func.call @stack_push_pointer(%2814) : (i64) -> ()
                      %2815 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2776#3) : (i64) -> ()
                      %2816 = func.call @stack_pop_pointer() : () -> i64
                      %2817 = func.call @cc_nil_value() : () -> i64
                      %2818 = func.call @cc_errorp(%2804) : (i64) -> i64
                      %2819 = arith.cmpi ne, %2818, %2817 : i64
                      %2820 = arith.cmpi eq, %2817, %2817 : i64
                      %2821 = arith.andi %2819, %2820 : i1
                      %2822 = scf.if %2821 -> (i64) {
                        scf.yield %2804 : i64
                      } else {
                        scf.yield %2817 : i64
                      }
                      %2823 = func.call @cc_errorp(%2805) : (i64) -> i64
                      %2824 = arith.cmpi ne, %2823, %2817 : i64
                      %2825 = arith.cmpi eq, %2822, %2817 : i64
                      %2826 = arith.andi %2824, %2825 : i1
                      %2827 = scf.if %2826 -> (i64) {
                        scf.yield %2805 : i64
                      } else {
                        scf.yield %2822 : i64
                      }
                      %2828 = func.call @cc_errorp(%2809) : (i64) -> i64
                      %2829 = arith.cmpi ne, %2828, %2817 : i64
                      %2830 = arith.cmpi eq, %2827, %2817 : i64
                      %2831 = arith.andi %2829, %2830 : i1
                      %2832 = scf.if %2831 -> (i64) {
                        scf.yield %2809 : i64
                      } else {
                        scf.yield %2827 : i64
                      }
                      %2833 = func.call @cc_errorp(%2815) : (i64) -> i64
                      %2834 = arith.cmpi ne, %2833, %2817 : i64
                      %2835 = arith.cmpi eq, %2832, %2817 : i64
                      %2836 = arith.andi %2834, %2835 : i1
                      %2837 = scf.if %2836 -> (i64) {
                        scf.yield %2815 : i64
                      } else {
                        scf.yield %2832 : i64
                      }
                      %2838 = func.call @cc_errorp(%2816) : (i64) -> i64
                      %2839 = arith.cmpi ne, %2838, %2817 : i64
                      %2840 = arith.cmpi eq, %2837, %2817 : i64
                      %2841 = arith.andi %2839, %2840 : i1
                      %2842 = scf.if %2841 -> (i64) {
                        scf.yield %2816 : i64
                      } else {
                        scf.yield %2837 : i64
                      }
                      %2843 = arith.cmpi ne, %2842, %2817 : i64
                      scf.if %2843 {
                        func.call @stack_push_pointer(%2842) : (i64) -> ()
                      } else {
                        %2844 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%2844) : (i64) -> ()
                        func.call @stack_push_pointer(%2816) : (i64) -> ()
                        %2845 = func.call @stack_pop_pointer() : () -> i64
                        %2846 = func.call @stack_pop_pointer() : () -> i64
                        %2847 = func.call @cc_cons(%2845, %2846) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%2847) : (i64) -> ()
                        func.call @stack_push_pointer(%2815) : (i64) -> ()
                        %2848 = func.call @stack_pop_pointer() : () -> i64
                        %2849 = func.call @stack_pop_pointer() : () -> i64
                        %2850 = func.call @cc_cons(%2848, %2849) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%2850) : (i64) -> ()
                        func.call @stack_push_pointer(%2809) : (i64) -> ()
                        %2851 = func.call @stack_pop_pointer() : () -> i64
                        %2852 = func.call @stack_pop_pointer() : () -> i64
                        %2853 = func.call @cc_cons(%2851, %2852) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%2853) : (i64) -> ()
                        func.call @stack_push_pointer(%2805) : (i64) -> ()
                        %2854 = func.call @stack_pop_pointer() : () -> i64
                        %2855 = func.call @stack_pop_pointer() : () -> i64
                        %2856 = func.call @cc_cons(%2854, %2855) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%2856) : (i64) -> ()
                        func.call @stack_push_pointer(%2804) : (i64) -> ()
                        %2857 = func.call @stack_pop_pointer() : () -> i64
                        %2858 = func.call @stack_pop_pointer() : () -> i64
                        %2859 = func.call @cc_cons(%2857, %2858) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%2859) : (i64) -> ()
                      }
                      %2860 = func.call @stack_pop_pointer() : () -> i64
                      %2861 = func.call @cc_nil_value() : () -> i64
                      %2862 = func.call @cc_errorp(%2860) : (i64) -> i64
                      %2863 = arith.cmpi ne, %2862, %2861 : i64
                      %2864 = arith.cmpi eq, %2861, %2861 : i64
                      %2865 = arith.andi %2863, %2864 : i1
                      %2866 = scf.if %2865 -> (i64) {
                        scf.yield %2860 : i64
                      } else {
                        scf.yield %2861 : i64
                      }
                      %2867 = arith.cmpi ne, %2866, %2861 : i64
                      scf.if %2867 {
                        func.call @stack_push_pointer(%2866) : (i64) -> ()
                      } else {
                        %2868 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%2868) : (i64) -> ()
                        func.call @stack_push_pointer(%2860) : (i64) -> ()
                        %2869 = func.call @stack_pop_pointer() : () -> i64
                        %2870 = func.call @stack_pop_pointer() : () -> i64
                        %2871 = func.call @cc_cons(%2869, %2870) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%2871) : (i64) -> ()
                      }
                      %2872 = func.call @stack_pop_pointer() : () -> i64
                      %2873 = func.call @stack_pop_pointer() : () -> i64
                      %2874 = func.call @cc_append(%2873, %2872) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%2874) : (i64) -> ()
                      %2875 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2875) : (i64) -> ()
                      %2876 = func.call @stack_pop_pointer() : () -> i64
                      scf.yield %2876, %2875 : i64, i64
                    }
                    func.call @stack_push_pointer(%2803#0) : (i64) -> ()
                    %2877 = func.call @stack_pop_pointer() : () -> i64
                    scf.yield %2877, %2803#1 : i64, i64
                  } else {
                    func.call @stack_push_nil() : () -> ()
                    %2878 = func.call @stack_pop_pointer() : () -> i64
                    scf.yield %2878, %2776#1 : i64, i64
                  }
                  func.call @stack_push_pointer(%2798#0) : (i64) -> ()
                  %2879 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %2879, %2798#1, %2776#2, %2776#3 : i64, i64, i64, i64
                }
                func.call @stack_push_pointer(%2784#0) : (i64) -> ()
                %2880 = func.call @stack_depth() : () -> i64
                %2881 = arith.constant 0 : i64
                %2882 = arith.cmpi sgt, %2880, %2881 : i64
                scf.if %2882 {
                  %2883 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%2596) : (i64) -> ()
                %2884 = func.call @stack_pop_pointer() : () -> i64
                %2885 = func.call @cc_cdr(%2884) : (i64) -> i64
                func.call @stack_push_pointer(%2885) : (i64) -> ()
                %2886 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%2886) : (i64) -> ()
                %2887 = func.call @stack_depth() : () -> i64
                %2888 = arith.constant 0 : i64
                %2889 = arith.cmpi sgt, %2887, %2888 : i64
                scf.if %2889 {
                  %2890 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%2597) : (i64) -> ()
                %2891 = func.call @stack_pop_pointer() : () -> i64
                %2892 = func.call @cc_cdr(%2891) : (i64) -> i64
                func.call @stack_push_pointer(%2892) : (i64) -> ()
                %2893 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%2893) : (i64) -> ()
                %2894 = func.call @stack_depth() : () -> i64
                %2895 = arith.constant 0 : i64
                %2896 = arith.cmpi sgt, %2894, %2895 : i64
                scf.if %2896 {
                  %2897 = func.call @stack_pop_pointer() : () -> i64
                }
                scf.yield %2784#2, %2784#3, %2784#1, %2886, %2893 : i64, i64, i64, i64, i64
              }
              func.call @stack_push_nil() : () -> ()
              %2898 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2547#2) : (i64) -> ()
              %2899 = func.call @stack_pop_pointer() : () -> i64
              %2900 = func.call @cc_multiple_value_list(%2899) : (i64) -> i64
              %2901 = llvm.mlir.addressof @str194 : !llvm.ptr
              %2902 = arith.constant 38 : i64
              %2903 = func.call @cc_make_string(%2901, %2902) : (!llvm.ptr, i64) -> i64
              %2904 = func.call @cc_nil_value() : () -> i64
              %2905 = func.call @cc_intern(%2903, %2904) : (i64, i64) -> i64
              %2906 = func.call @cc_nil_value() : () -> i64
              %2907 = func.call @cc_cons(%2905, %2906) : (i64, i64) -> i64
              %2908 = func.call @cc_values_pack(%2907) : (i64) -> i64
              %2909 = func.call @cc_symbol_value(%2905) : (i64) -> i64
              %2910 = llvm.mlir.addressof @str195 : !llvm.ptr
              %2911 = arith.constant 39 : i64
              %2912 = func.call @cc_make_string(%2910, %2911) : (!llvm.ptr, i64) -> i64
              %2913 = func.call @cc_nil_value() : () -> i64
              %2914 = func.call @cc_intern(%2912, %2913) : (i64, i64) -> i64
              %2915 = func.call @cc_nil_value() : () -> i64
              %2916 = func.call @cc_cons(%2914, %2915) : (i64, i64) -> i64
              %2917 = func.call @cc_values_pack(%2916) : (i64) -> i64
              %2918 = func.call @cc_symbol_value(%2914) : (i64) -> i64
              %2919 = llvm.mlir.addressof @str196 : !llvm.ptr
              %2920 = arith.constant 40 : i64
              %2921 = func.call @cc_make_string(%2919, %2920) : (!llvm.ptr, i64) -> i64
              %2922 = func.call @cc_nil_value() : () -> i64
              %2923 = func.call @cc_intern(%2921, %2922) : (i64, i64) -> i64
              %2924 = func.call @cc_nil_value() : () -> i64
              %2925 = func.call @cc_cons(%2923, %2924) : (i64, i64) -> i64
              %2926 = func.call @cc_values_pack(%2925) : (i64) -> i64
              %2927 = func.call @cc_symbol_value(%2923) : (i64) -> i64
              %2928 = func.call @cc_nil_value() : () -> i64
              %2929 = arith.cmpi ne, %2909, %2928 : i64
              %2930 = scf.if %2929 -> (i64) {
                scf.yield %2927 : i64
              } else {
                scf.yield %2900 : i64
              }
              %2931 = func.call @cc_values_pack(%2930) : (i64) -> i64
              func.call @stack_push_pointer(%2931) : (i64) -> ()
              %2932 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2932 : i64
            }
            func.call @stack_push_pointer(%2518) : (i64) -> ()
            %2933 = func.call @stack_pop_pointer() : () -> i64
            %2934 = func.call @stack_pop_pointer() : () -> i64
            %2935 = func.call @cc_nconc(%2934, %2933) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2935) : (i64) -> ()
            %2936 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2936) : (i64) -> ()
            %2937 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2937, %2936, %2226#2 : i64, i64, i64
          }
          func.call @stack_push_pointer(%2234#0) : (i64) -> ()
          %2938 = func.call @stack_depth() : () -> i64
          %2939 = arith.constant 0 : i64
          %2940 = arith.cmpi sgt, %2938, %2939 : i64
          scf.if %2940 {
            %2941 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%2138) : (i64) -> ()
          %2942 = func.call @stack_pop_pointer() : () -> i64
          %2943 = func.call @cc_cdr(%2942) : (i64) -> i64
          func.call @stack_push_pointer(%2943) : (i64) -> ()
          %2944 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2944) : (i64) -> ()
          %2945 = func.call @stack_depth() : () -> i64
          %2946 = arith.constant 0 : i64
          %2947 = arith.cmpi sgt, %2945, %2946 : i64
          scf.if %2947 {
            %2948 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %2234#2, %2234#1, %2944 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %2949 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2107#1) : (i64) -> ()
        %2950 = func.call @stack_pop_pointer() : () -> i64
        %2951 = func.call @cc_multiple_value_list(%2950) : (i64) -> i64
        %2952 = llvm.mlir.addressof @str197 : !llvm.ptr
        %2953 = arith.constant 38 : i64
        %2954 = func.call @cc_make_string(%2952, %2953) : (!llvm.ptr, i64) -> i64
        %2955 = func.call @cc_nil_value() : () -> i64
        %2956 = func.call @cc_intern(%2954, %2955) : (i64, i64) -> i64
        %2957 = func.call @cc_nil_value() : () -> i64
        %2958 = func.call @cc_cons(%2956, %2957) : (i64, i64) -> i64
        %2959 = func.call @cc_values_pack(%2958) : (i64) -> i64
        %2960 = func.call @cc_symbol_value(%2956) : (i64) -> i64
        %2961 = llvm.mlir.addressof @str198 : !llvm.ptr
        %2962 = arith.constant 39 : i64
        %2963 = func.call @cc_make_string(%2961, %2962) : (!llvm.ptr, i64) -> i64
        %2964 = func.call @cc_nil_value() : () -> i64
        %2965 = func.call @cc_intern(%2963, %2964) : (i64, i64) -> i64
        %2966 = func.call @cc_nil_value() : () -> i64
        %2967 = func.call @cc_cons(%2965, %2966) : (i64, i64) -> i64
        %2968 = func.call @cc_values_pack(%2967) : (i64) -> i64
        %2969 = func.call @cc_symbol_value(%2965) : (i64) -> i64
        %2970 = llvm.mlir.addressof @str199 : !llvm.ptr
        %2971 = arith.constant 40 : i64
        %2972 = func.call @cc_make_string(%2970, %2971) : (!llvm.ptr, i64) -> i64
        %2973 = func.call @cc_nil_value() : () -> i64
        %2974 = func.call @cc_intern(%2972, %2973) : (i64, i64) -> i64
        %2975 = func.call @cc_nil_value() : () -> i64
        %2976 = func.call @cc_cons(%2974, %2975) : (i64, i64) -> i64
        %2977 = func.call @cc_values_pack(%2976) : (i64) -> i64
        %2978 = func.call @cc_symbol_value(%2974) : (i64) -> i64
        %2979 = func.call @cc_nil_value() : () -> i64
        %2980 = arith.cmpi ne, %2960, %2979 : i64
        %2981 = scf.if %2980 -> (i64) {
          scf.yield %2978 : i64
        } else {
          scf.yield %2951 : i64
        }
        %2982 = func.call @cc_values_pack(%2981) : (i64) -> i64
        func.call @stack_push_pointer(%2982) : (i64) -> ()
        %2983 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2983 : i64
      }
      func.call @stack_push_pointer(%2078) : (i64) -> ()
      %2984 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2014) : (i64) -> ()
      func.call @stack_push_pointer(%2018) : (i64) -> ()
      func.call @stack_push_pointer(%2984) : (i64) -> ()
      %2985 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2986 = func.call @cc_make_function_ref_const(%2985) : (!llvm.ptr) -> i64
      %2987 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%2986, %2987) : (i64, i64) -> ()
      %2988 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2988 : i64
    }
    %2989 = func.call @cc_nil_value() : () -> i64
    %2990 = func.call @cc_errorp(%2012) : (i64) -> i64
    %2991 = arith.cmpi ne, %2990, %2989 : i64
    %2992 = scf.if %2991 -> (i64) {
      scf.yield %2012 : i64
    } else {
      %2993 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2993) : (i64) -> ()
      %2994 = func.call @stack_pop_pointer() : () -> i64
      %2995 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2996 = arith.constant 15 : i64
      %2997 = func.call @cc_make_string(%2995, %2996) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2997) : (i64) -> ()
      %2998 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2994) : (i64) -> ()
      func.call @stack_push_pointer(%2998) : (i64) -> ()
      %2999 = llvm.mlir.addressof @str202 : !llvm.ptr
      %3000 = func.call @cc_make_function_ref_const(%2999) : (!llvm.ptr) -> i64
      %3001 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%3000, %3001) : (i64, i64) -> ()
      %3002 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3002 : i64
    }
    %3003 = func.call @cc_nil_value() : () -> i64
    %3004 = func.call @cc_errorp(%2992) : (i64) -> i64
    %3005 = arith.cmpi ne, %3004, %3003 : i64
    %3006 = scf.if %3005 -> (i64) {
      scf.yield %2992 : i64
    } else {
      %3007 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3007) : (i64) -> ()
      %3008 = func.call @stack_pop_pointer() : () -> i64
      %3009 = llvm.mlir.addressof @str203 : !llvm.ptr
      %3010 = arith.constant 22 : i64
      %3011 = func.call @cc_make_string(%3009, %3010) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3011) : (i64) -> ()
      %3012 = func.call @stack_pop_pointer() : () -> i64
      %3013 = llvm.mlir.addressof @str204 : !llvm.ptr
      %3014 = arith.constant 20 : i64
      %3015 = func.call @cc_make_string(%3013, %3014) : (!llvm.ptr, i64) -> i64
      %3016 = llvm.mlir.addressof @str205 : !llvm.ptr
      %3017 = arith.constant 11 : i64
      %3018 = func.call @cc_make_string(%3016, %3017) : (!llvm.ptr, i64) -> i64
      %3019 = func.call @cc_intern(%3015, %3018) : (i64, i64) -> i64
      %3020 = func.call @cc_nil_value() : () -> i64
      %3021 = func.call @cc_cons(%3019, %3020) : (i64, i64) -> i64
      %3022 = func.call @cc_values_pack(%3021) : (i64) -> i64
      %3023 = func.call @cc_symbol_value(%3019) : (i64) -> i64
      func.call @stack_push_pointer(%3023) : (i64) -> ()
      %3024 = func.call @stack_pop_pointer() : () -> i64
      %3025 = arith.constant 1 : i64
      %3026 = func.call @cc_box_fixnum(%3025) : (i64) -> i64
      %3028 = arith.constant 3 : i64
      %3027 = arith.andi %3024, %3028 : i64
      %3029 = arith.constant 0 : i64
      %3030 = arith.cmpi eq, %3027, %3029 : i64
      %3032 = arith.constant 3 : i64
      %3031 = arith.andi %3026, %3032 : i64
      %3033 = arith.constant 0 : i64
      %3034 = arith.cmpi eq, %3031, %3033 : i64
      %3035 = arith.andi %3030, %3034 : i1
      %3036 = scf.if %3035 -> (i64) {
        %3037 = arith.constant 2 : i64
        %3038 = arith.shrsi %3024, %3037 : i64
        %3039 = arith.constant 2 : i64
        %3040 = arith.shrsi %3026, %3039 : i64
        %3041 = arith.addi %3038, %3040 : i64
        %3042 = arith.constant -2305843009213693952 : i64
        %3043 = arith.constant 2305843009213693951 : i64
        %3044 = arith.cmpi sge, %3041, %3042 : i64
        %3045 = arith.cmpi sle, %3041, %3043 : i64
        %3046 = arith.andi %3044, %3045 : i1
        %3047 = scf.if %3046 -> (i64) {
          %3048 = arith.constant 2 : i64
          %3049 = arith.shli %3041, %3048 : i64
          scf.yield %3049 : i64
        } else {
          %3050 = func.call @cc_add(%3024, %3026) : (i64, i64) -> i64
          scf.yield %3050 : i64
        }
        scf.yield %3047 : i64
      } else {
        %3051 = func.call @cc_add(%3024, %3026) : (i64, i64) -> i64
        scf.yield %3051 : i64
      }
      func.call @stack_push_pointer(%3036) : (i64) -> ()
      %3052 = func.call @stack_pop_pointer() : () -> i64
      %3053 = func.call @cc_nil_value() : () -> i64
      %3054 = func.call @cc_errorp(%3052) : (i64) -> i64
      %3055 = arith.cmpi ne, %3054, %3053 : i64
      %3056 = arith.cmpi eq, %3053, %3053 : i64
      %3057 = arith.andi %3055, %3056 : i1
      %3058 = scf.if %3057 -> (i64) {
        scf.yield %3052 : i64
      } else {
        scf.yield %3053 : i64
      }
      %3059 = arith.cmpi ne, %3058, %3053 : i64
      scf.if %3059 {
        func.call @stack_push_pointer(%3058) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3052) : (i64) -> ()
        %3060 = llvm.mlir.addressof @str206 : !llvm.ptr
        %3061 = func.call @cc_make_function_ref_const(%3060) : (!llvm.ptr) -> i64
        %3062 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3061, %3062) : (i64, i64) -> ()
      }
      %3063 = func.call @stack_pop_pointer() : () -> i64
      %3064 = llvm.mlir.addressof @str207 : !llvm.ptr
      %3065 = arith.constant 20 : i64
      %3066 = func.call @cc_make_string(%3064, %3065) : (!llvm.ptr, i64) -> i64
      %3067 = llvm.mlir.addressof @str208 : !llvm.ptr
      %3068 = arith.constant 11 : i64
      %3069 = func.call @cc_make_string(%3067, %3068) : (!llvm.ptr, i64) -> i64
      %3070 = func.call @cc_intern(%3066, %3069) : (i64, i64) -> i64
      %3071 = func.call @cc_nil_value() : () -> i64
      %3072 = func.call @cc_cons(%3070, %3071) : (i64, i64) -> i64
      %3073 = func.call @cc_values_pack(%3072) : (i64) -> i64
      %3074 = func.call @cc_symbol_value(%3070) : (i64) -> i64
      func.call @stack_push_pointer(%3074) : (i64) -> ()
      %3075 = func.call @stack_pop_pointer() : () -> i64
      %3076 = arith.constant 1 : i64
      %3077 = func.call @cc_box_fixnum(%3076) : (i64) -> i64
      %3079 = arith.constant 3 : i64
      %3078 = arith.andi %3075, %3079 : i64
      %3080 = arith.constant 0 : i64
      %3081 = arith.cmpi eq, %3078, %3080 : i64
      %3083 = arith.constant 3 : i64
      %3082 = arith.andi %3077, %3083 : i64
      %3084 = arith.constant 0 : i64
      %3085 = arith.cmpi eq, %3082, %3084 : i64
      %3086 = arith.andi %3081, %3085 : i1
      %3087 = scf.if %3086 -> (i64) {
        %3088 = arith.constant 2 : i64
        %3089 = arith.shrsi %3075, %3088 : i64
        %3090 = arith.constant 2 : i64
        %3091 = arith.shrsi %3077, %3090 : i64
        %3092 = arith.addi %3089, %3091 : i64
        %3093 = arith.constant -2305843009213693952 : i64
        %3094 = arith.constant 2305843009213693951 : i64
        %3095 = arith.cmpi sge, %3092, %3093 : i64
        %3096 = arith.cmpi sle, %3092, %3094 : i64
        %3097 = arith.andi %3095, %3096 : i1
        %3098 = scf.if %3097 -> (i64) {
          %3099 = arith.constant 2 : i64
          %3100 = arith.shli %3092, %3099 : i64
          scf.yield %3100 : i64
        } else {
          %3101 = func.call @cc_add(%3075, %3077) : (i64, i64) -> i64
          scf.yield %3101 : i64
        }
        scf.yield %3098 : i64
      } else {
        %3102 = func.call @cc_add(%3075, %3077) : (i64, i64) -> i64
        scf.yield %3102 : i64
      }
      func.call @stack_push_pointer(%3087) : (i64) -> ()
      %3103 = func.call @stack_pop_pointer() : () -> i64
      %3104 = func.call @cc_nil_value() : () -> i64
      %3105 = func.call @cc_errorp(%3103) : (i64) -> i64
      %3106 = arith.cmpi ne, %3105, %3104 : i64
      %3107 = arith.cmpi eq, %3104, %3104 : i64
      %3108 = arith.andi %3106, %3107 : i1
      %3109 = scf.if %3108 -> (i64) {
        scf.yield %3103 : i64
      } else {
        scf.yield %3104 : i64
      }
      %3110 = arith.cmpi ne, %3109, %3104 : i64
      scf.if %3110 {
        func.call @stack_push_pointer(%3109) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3103) : (i64) -> ()
        %3111 = llvm.mlir.addressof @str209 : !llvm.ptr
        %3112 = func.call @cc_make_function_ref_const(%3111) : (!llvm.ptr) -> i64
        %3113 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3112, %3113) : (i64, i64) -> ()
      }
      %3114 = func.call @stack_pop_pointer() : () -> i64
      %3115 = llvm.mlir.addressof @str210 : !llvm.ptr
      %3116 = arith.constant 20 : i64
      %3117 = func.call @cc_make_string(%3115, %3116) : (!llvm.ptr, i64) -> i64
      %3118 = llvm.mlir.addressof @str211 : !llvm.ptr
      %3119 = arith.constant 11 : i64
      %3120 = func.call @cc_make_string(%3118, %3119) : (!llvm.ptr, i64) -> i64
      %3121 = func.call @cc_intern(%3117, %3120) : (i64, i64) -> i64
      %3122 = func.call @cc_nil_value() : () -> i64
      %3123 = func.call @cc_cons(%3121, %3122) : (i64, i64) -> i64
      %3124 = func.call @cc_values_pack(%3123) : (i64) -> i64
      %3125 = func.call @cc_symbol_value(%3121) : (i64) -> i64
      func.call @stack_push_pointer(%3125) : (i64) -> ()
      %3126 = func.call @stack_pop_pointer() : () -> i64
      %3127 = arith.constant 1 : i64
      %3128 = func.call @cc_box_fixnum(%3127) : (i64) -> i64
      %3130 = arith.constant 3 : i64
      %3129 = arith.andi %3126, %3130 : i64
      %3131 = arith.constant 0 : i64
      %3132 = arith.cmpi eq, %3129, %3131 : i64
      %3134 = arith.constant 3 : i64
      %3133 = arith.andi %3128, %3134 : i64
      %3135 = arith.constant 0 : i64
      %3136 = arith.cmpi eq, %3133, %3135 : i64
      %3137 = arith.andi %3132, %3136 : i1
      %3138 = scf.if %3137 -> (i64) {
        %3139 = arith.constant 2 : i64
        %3140 = arith.shrsi %3126, %3139 : i64
        %3141 = arith.constant 2 : i64
        %3142 = arith.shrsi %3128, %3141 : i64
        %3143 = arith.addi %3140, %3142 : i64
        %3144 = arith.constant -2305843009213693952 : i64
        %3145 = arith.constant 2305843009213693951 : i64
        %3146 = arith.cmpi sge, %3143, %3144 : i64
        %3147 = arith.cmpi sle, %3143, %3145 : i64
        %3148 = arith.andi %3146, %3147 : i1
        %3149 = scf.if %3148 -> (i64) {
          %3150 = arith.constant 2 : i64
          %3151 = arith.shli %3143, %3150 : i64
          scf.yield %3151 : i64
        } else {
          %3152 = func.call @cc_add(%3126, %3128) : (i64, i64) -> i64
          scf.yield %3152 : i64
        }
        scf.yield %3149 : i64
      } else {
        %3153 = func.call @cc_add(%3126, %3128) : (i64, i64) -> i64
        scf.yield %3153 : i64
      }
      func.call @stack_push_pointer(%3138) : (i64) -> ()
      %3154 = func.call @stack_pop_pointer() : () -> i64
      %3155 = arith.constant 1 : i1
      %3157 = arith.constant 3 : i64
      %3156 = arith.andi %3114, %3157 : i64
      %3158 = arith.constant 0 : i64
      %3159 = arith.cmpi eq, %3156, %3158 : i64
      %3161 = arith.constant 3 : i64
      %3160 = arith.andi %3154, %3161 : i64
      %3162 = arith.constant 0 : i64
      %3163 = arith.cmpi eq, %3160, %3162 : i64
      %3164 = arith.andi %3159, %3163 : i1
      %3165 = scf.if %3164 -> (i1) {
        %3166 = arith.constant 2 : i64
        %3167 = arith.shrsi %3114, %3166 : i64
        %3168 = arith.constant 2 : i64
        %3169 = arith.shrsi %3154, %3168 : i64
        %3170 = arith.cmpi eq, %3167, %3169 : i64
        scf.yield %3170 : i1
      } else {
        %3171 = func.call @cc_eq(%3114, %3154) : (i64, i64) -> i64
        %3172 = func.call @cc_nil_value() : () -> i64
        %3173 = arith.cmpi ne, %3171, %3172 : i64
        scf.yield %3173 : i1
      }
      %3174 = arith.andi %3155, %3165 : i1
      %3175 = func.call @cc_nil_value() : () -> i64
      %3176 = func.call @cc_t_value() : () -> i64
      %3177 = scf.if %3174 -> (i64) {
        scf.yield %3176 : i64
      } else {
        scf.yield %3175 : i64
      }
      func.call @stack_push_pointer(%3177) : (i64) -> ()
      %3178 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3008) : (i64) -> ()
      func.call @stack_push_pointer(%3012) : (i64) -> ()
      func.call @stack_push_pointer(%3063) : (i64) -> ()
      func.call @stack_push_pointer(%3178) : (i64) -> ()
      %3179 = llvm.mlir.addressof @str212 : !llvm.ptr
      %3180 = func.call @cc_make_function_ref_const(%3179) : (!llvm.ptr) -> i64
      %3181 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%3180, %3181) : (i64, i64) -> ()
      %3182 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3182 : i64
    }
    %3183 = func.call @cc_nil_value() : () -> i64
    %3184 = func.call @cc_errorp(%3006) : (i64) -> i64
    %3185 = arith.cmpi ne, %3184, %3183 : i64
    %3186 = scf.if %3185 -> (i64) {
      scf.yield %3006 : i64
    } else {
      %3187 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3187) : (i64) -> ()
      %3188 = func.call @stack_pop_pointer() : () -> i64
      %3189 = llvm.mlir.addressof @str213 : !llvm.ptr
      %3190 = arith.constant 34 : i64
      %3191 = func.call @cc_make_string(%3189, %3190) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3191) : (i64) -> ()
      %3192 = func.call @stack_pop_pointer() : () -> i64
      %3193 = llvm.mlir.addressof @str214 : !llvm.ptr
      %3194 = arith.constant 20 : i64
      %3195 = func.call @cc_make_string(%3193, %3194) : (!llvm.ptr, i64) -> i64
      %3196 = llvm.mlir.addressof @str215 : !llvm.ptr
      %3197 = arith.constant 11 : i64
      %3198 = func.call @cc_make_string(%3196, %3197) : (!llvm.ptr, i64) -> i64
      %3199 = func.call @cc_intern(%3195, %3198) : (i64, i64) -> i64
      %3200 = func.call @cc_nil_value() : () -> i64
      %3201 = func.call @cc_cons(%3199, %3200) : (i64, i64) -> i64
      %3202 = func.call @cc_values_pack(%3201) : (i64) -> i64
      %3203 = func.call @cc_symbol_value(%3199) : (i64) -> i64
      func.call @stack_push_pointer(%3203) : (i64) -> ()
      %3204 = func.call @stack_pop_pointer() : () -> i64
      %3205 = arith.constant 1 : i64
      %3206 = func.call @cc_box_fixnum(%3205) : (i64) -> i64
      %3208 = arith.constant 3 : i64
      %3207 = arith.andi %3204, %3208 : i64
      %3209 = arith.constant 0 : i64
      %3210 = arith.cmpi eq, %3207, %3209 : i64
      %3212 = arith.constant 3 : i64
      %3211 = arith.andi %3206, %3212 : i64
      %3213 = arith.constant 0 : i64
      %3214 = arith.cmpi eq, %3211, %3213 : i64
      %3215 = arith.andi %3210, %3214 : i1
      %3216 = scf.if %3215 -> (i64) {
        %3217 = arith.constant 2 : i64
        %3218 = arith.shrsi %3204, %3217 : i64
        %3219 = arith.constant 2 : i64
        %3220 = arith.shrsi %3206, %3219 : i64
        %3221 = arith.addi %3218, %3220 : i64
        %3222 = arith.constant -2305843009213693952 : i64
        %3223 = arith.constant 2305843009213693951 : i64
        %3224 = arith.cmpi sge, %3221, %3222 : i64
        %3225 = arith.cmpi sle, %3221, %3223 : i64
        %3226 = arith.andi %3224, %3225 : i1
        %3227 = scf.if %3226 -> (i64) {
          %3228 = arith.constant 2 : i64
          %3229 = arith.shli %3221, %3228 : i64
          scf.yield %3229 : i64
        } else {
          %3230 = func.call @cc_add(%3204, %3206) : (i64, i64) -> i64
          scf.yield %3230 : i64
        }
        scf.yield %3227 : i64
      } else {
        %3231 = func.call @cc_add(%3204, %3206) : (i64, i64) -> i64
        scf.yield %3231 : i64
      }
      func.call @stack_push_pointer(%3216) : (i64) -> ()
      %3232 = func.call @stack_pop_pointer() : () -> i64
      %3233 = llvm.mlir.addressof @str216 : !llvm.ptr
      %3234 = arith.constant 20 : i64
      %3235 = func.call @cc_make_string(%3233, %3234) : (!llvm.ptr, i64) -> i64
      %3236 = llvm.mlir.addressof @str217 : !llvm.ptr
      %3237 = arith.constant 11 : i64
      %3238 = func.call @cc_make_string(%3236, %3237) : (!llvm.ptr, i64) -> i64
      %3239 = func.call @cc_intern(%3235, %3238) : (i64, i64) -> i64
      %3240 = func.call @cc_nil_value() : () -> i64
      %3241 = func.call @cc_cons(%3239, %3240) : (i64, i64) -> i64
      %3242 = func.call @cc_values_pack(%3241) : (i64) -> i64
      %3243 = func.call @cc_symbol_value(%3239) : (i64) -> i64
      func.call @stack_push_pointer(%3243) : (i64) -> ()
      %3244 = func.call @stack_pop_pointer() : () -> i64
      %3245 = arith.constant 1 : i64
      %3246 = func.call @cc_box_fixnum(%3245) : (i64) -> i64
      %3248 = arith.constant 3 : i64
      %3247 = arith.andi %3244, %3248 : i64
      %3249 = arith.constant 0 : i64
      %3250 = arith.cmpi eq, %3247, %3249 : i64
      %3252 = arith.constant 3 : i64
      %3251 = arith.andi %3246, %3252 : i64
      %3253 = arith.constant 0 : i64
      %3254 = arith.cmpi eq, %3251, %3253 : i64
      %3255 = arith.andi %3250, %3254 : i1
      %3256 = scf.if %3255 -> (i64) {
        %3257 = arith.constant 2 : i64
        %3258 = arith.shrsi %3244, %3257 : i64
        %3259 = arith.constant 2 : i64
        %3260 = arith.shrsi %3246, %3259 : i64
        %3261 = arith.addi %3258, %3260 : i64
        %3262 = arith.constant -2305843009213693952 : i64
        %3263 = arith.constant 2305843009213693951 : i64
        %3264 = arith.cmpi sge, %3261, %3262 : i64
        %3265 = arith.cmpi sle, %3261, %3263 : i64
        %3266 = arith.andi %3264, %3265 : i1
        %3267 = scf.if %3266 -> (i64) {
          %3268 = arith.constant 2 : i64
          %3269 = arith.shli %3261, %3268 : i64
          scf.yield %3269 : i64
        } else {
          %3270 = func.call @cc_add(%3244, %3246) : (i64, i64) -> i64
          scf.yield %3270 : i64
        }
        scf.yield %3267 : i64
      } else {
        %3271 = func.call @cc_add(%3244, %3246) : (i64, i64) -> i64
        scf.yield %3271 : i64
      }
      func.call @stack_push_pointer(%3256) : (i64) -> ()
      %3272 = func.call @stack_pop_pointer() : () -> i64
      %3273 = arith.constant 1 : i64
      %3274 = func.call @cc_box_fixnum(%3273) : (i64) -> i64
      %3276 = arith.constant 3 : i64
      %3275 = arith.andi %3272, %3276 : i64
      %3277 = arith.constant 0 : i64
      %3278 = arith.cmpi eq, %3275, %3277 : i64
      %3280 = arith.constant 3 : i64
      %3279 = arith.andi %3274, %3280 : i64
      %3281 = arith.constant 0 : i64
      %3282 = arith.cmpi eq, %3279, %3281 : i64
      %3283 = arith.andi %3278, %3282 : i1
      %3284 = scf.if %3283 -> (i64) {
        %3285 = arith.constant 2 : i64
        %3286 = arith.shrsi %3272, %3285 : i64
        %3287 = arith.constant 2 : i64
        %3288 = arith.shrsi %3274, %3287 : i64
        %3289 = arith.addi %3286, %3288 : i64
        %3290 = arith.constant -2305843009213693952 : i64
        %3291 = arith.constant 2305843009213693951 : i64
        %3292 = arith.cmpi sge, %3289, %3290 : i64
        %3293 = arith.cmpi sle, %3289, %3291 : i64
        %3294 = arith.andi %3292, %3293 : i1
        %3295 = scf.if %3294 -> (i64) {
          %3296 = arith.constant 2 : i64
          %3297 = arith.shli %3289, %3296 : i64
          scf.yield %3297 : i64
        } else {
          %3298 = func.call @cc_add(%3272, %3274) : (i64, i64) -> i64
          scf.yield %3298 : i64
        }
        scf.yield %3295 : i64
      } else {
        %3299 = func.call @cc_add(%3272, %3274) : (i64, i64) -> i64
        scf.yield %3299 : i64
      }
      func.call @stack_push_pointer(%3284) : (i64) -> ()
      %3300 = func.call @stack_pop_pointer() : () -> i64
      %3301 = func.call @cc_nil_value() : () -> i64
      %3302 = func.call @cc_errorp(%3232) : (i64) -> i64
      %3303 = arith.cmpi ne, %3302, %3301 : i64
      %3304 = arith.cmpi eq, %3301, %3301 : i64
      %3305 = arith.andi %3303, %3304 : i1
      %3306 = scf.if %3305 -> (i64) {
        scf.yield %3232 : i64
      } else {
        scf.yield %3301 : i64
      }
      %3307 = func.call @cc_errorp(%3300) : (i64) -> i64
      %3308 = arith.cmpi ne, %3307, %3301 : i64
      %3309 = arith.cmpi eq, %3306, %3301 : i64
      %3310 = arith.andi %3308, %3309 : i1
      %3311 = scf.if %3310 -> (i64) {
        scf.yield %3300 : i64
      } else {
        scf.yield %3306 : i64
      }
      %3312 = arith.cmpi ne, %3311, %3301 : i64
      scf.if %3312 {
        func.call @stack_push_pointer(%3311) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3232) : (i64) -> ()
        func.call @stack_push_pointer(%3300) : (i64) -> ()
        %3313 = llvm.mlir.addressof @str218 : !llvm.ptr
        %3314 = func.call @cc_make_function_ref_const(%3313) : (!llvm.ptr) -> i64
        %3315 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3314, %3315) : (i64, i64) -> ()
      }
      %3316 = func.call @stack_pop_pointer() : () -> i64
      %3317 = llvm.mlir.addressof @str219 : !llvm.ptr
      %3318 = arith.constant 20 : i64
      %3319 = func.call @cc_make_string(%3317, %3318) : (!llvm.ptr, i64) -> i64
      %3320 = llvm.mlir.addressof @str220 : !llvm.ptr
      %3321 = arith.constant 11 : i64
      %3322 = func.call @cc_make_string(%3320, %3321) : (!llvm.ptr, i64) -> i64
      %3323 = func.call @cc_intern(%3319, %3322) : (i64, i64) -> i64
      %3324 = func.call @cc_nil_value() : () -> i64
      %3325 = func.call @cc_cons(%3323, %3324) : (i64, i64) -> i64
      %3326 = func.call @cc_values_pack(%3325) : (i64) -> i64
      %3327 = func.call @cc_symbol_value(%3323) : (i64) -> i64
      func.call @stack_push_pointer(%3327) : (i64) -> ()
      %3328 = func.call @stack_pop_pointer() : () -> i64
      %3329 = arith.constant 1 : i64
      %3330 = func.call @cc_box_fixnum(%3329) : (i64) -> i64
      %3332 = arith.constant 3 : i64
      %3331 = arith.andi %3328, %3332 : i64
      %3333 = arith.constant 0 : i64
      %3334 = arith.cmpi eq, %3331, %3333 : i64
      %3336 = arith.constant 3 : i64
      %3335 = arith.andi %3330, %3336 : i64
      %3337 = arith.constant 0 : i64
      %3338 = arith.cmpi eq, %3335, %3337 : i64
      %3339 = arith.andi %3334, %3338 : i1
      %3340 = scf.if %3339 -> (i64) {
        %3341 = arith.constant 2 : i64
        %3342 = arith.shrsi %3328, %3341 : i64
        %3343 = arith.constant 2 : i64
        %3344 = arith.shrsi %3330, %3343 : i64
        %3345 = arith.addi %3342, %3344 : i64
        %3346 = arith.constant -2305843009213693952 : i64
        %3347 = arith.constant 2305843009213693951 : i64
        %3348 = arith.cmpi sge, %3345, %3346 : i64
        %3349 = arith.cmpi sle, %3345, %3347 : i64
        %3350 = arith.andi %3348, %3349 : i1
        %3351 = scf.if %3350 -> (i64) {
          %3352 = arith.constant 2 : i64
          %3353 = arith.shli %3345, %3352 : i64
          scf.yield %3353 : i64
        } else {
          %3354 = func.call @cc_add(%3328, %3330) : (i64, i64) -> i64
          scf.yield %3354 : i64
        }
        scf.yield %3351 : i64
      } else {
        %3355 = func.call @cc_add(%3328, %3330) : (i64, i64) -> i64
        scf.yield %3355 : i64
      }
      func.call @stack_push_pointer(%3340) : (i64) -> ()
      %3356 = func.call @stack_pop_pointer() : () -> i64
      %3357 = llvm.mlir.addressof @str221 : !llvm.ptr
      %3358 = arith.constant 20 : i64
      %3359 = func.call @cc_make_string(%3357, %3358) : (!llvm.ptr, i64) -> i64
      %3360 = llvm.mlir.addressof @str222 : !llvm.ptr
      %3361 = arith.constant 11 : i64
      %3362 = func.call @cc_make_string(%3360, %3361) : (!llvm.ptr, i64) -> i64
      %3363 = func.call @cc_intern(%3359, %3362) : (i64, i64) -> i64
      %3364 = func.call @cc_nil_value() : () -> i64
      %3365 = func.call @cc_cons(%3363, %3364) : (i64, i64) -> i64
      %3366 = func.call @cc_values_pack(%3365) : (i64) -> i64
      %3367 = func.call @cc_symbol_value(%3363) : (i64) -> i64
      func.call @stack_push_pointer(%3367) : (i64) -> ()
      %3368 = func.call @stack_pop_pointer() : () -> i64
      %3369 = arith.constant 1 : i64
      %3370 = func.call @cc_box_fixnum(%3369) : (i64) -> i64
      %3372 = arith.constant 3 : i64
      %3371 = arith.andi %3368, %3372 : i64
      %3373 = arith.constant 0 : i64
      %3374 = arith.cmpi eq, %3371, %3373 : i64
      %3376 = arith.constant 3 : i64
      %3375 = arith.andi %3370, %3376 : i64
      %3377 = arith.constant 0 : i64
      %3378 = arith.cmpi eq, %3375, %3377 : i64
      %3379 = arith.andi %3374, %3378 : i1
      %3380 = scf.if %3379 -> (i64) {
        %3381 = arith.constant 2 : i64
        %3382 = arith.shrsi %3368, %3381 : i64
        %3383 = arith.constant 2 : i64
        %3384 = arith.shrsi %3370, %3383 : i64
        %3385 = arith.addi %3382, %3384 : i64
        %3386 = arith.constant -2305843009213693952 : i64
        %3387 = arith.constant 2305843009213693951 : i64
        %3388 = arith.cmpi sge, %3385, %3386 : i64
        %3389 = arith.cmpi sle, %3385, %3387 : i64
        %3390 = arith.andi %3388, %3389 : i1
        %3391 = scf.if %3390 -> (i64) {
          %3392 = arith.constant 2 : i64
          %3393 = arith.shli %3385, %3392 : i64
          scf.yield %3393 : i64
        } else {
          %3394 = func.call @cc_add(%3368, %3370) : (i64, i64) -> i64
          scf.yield %3394 : i64
        }
        scf.yield %3391 : i64
      } else {
        %3395 = func.call @cc_add(%3368, %3370) : (i64, i64) -> i64
        scf.yield %3395 : i64
      }
      func.call @stack_push_pointer(%3380) : (i64) -> ()
      %3396 = func.call @stack_pop_pointer() : () -> i64
      %3397 = llvm.mlir.addressof @str223 : !llvm.ptr
      %3398 = arith.constant 20 : i64
      %3399 = func.call @cc_make_string(%3397, %3398) : (!llvm.ptr, i64) -> i64
      %3400 = llvm.mlir.addressof @str224 : !llvm.ptr
      %3401 = arith.constant 11 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      %3403 = func.call @cc_intern(%3399, %3402) : (i64, i64) -> i64
      %3404 = func.call @cc_nil_value() : () -> i64
      %3405 = func.call @cc_cons(%3403, %3404) : (i64, i64) -> i64
      %3406 = func.call @cc_values_pack(%3405) : (i64) -> i64
      %3407 = func.call @cc_symbol_value(%3403) : (i64) -> i64
      func.call @stack_push_pointer(%3407) : (i64) -> ()
      %3408 = func.call @stack_pop_pointer() : () -> i64
      %3409 = arith.constant 1 : i64
      %3410 = func.call @cc_box_fixnum(%3409) : (i64) -> i64
      %3412 = arith.constant 3 : i64
      %3411 = arith.andi %3408, %3412 : i64
      %3413 = arith.constant 0 : i64
      %3414 = arith.cmpi eq, %3411, %3413 : i64
      %3416 = arith.constant 3 : i64
      %3415 = arith.andi %3410, %3416 : i64
      %3417 = arith.constant 0 : i64
      %3418 = arith.cmpi eq, %3415, %3417 : i64
      %3419 = arith.andi %3414, %3418 : i1
      %3420 = scf.if %3419 -> (i64) {
        %3421 = arith.constant 2 : i64
        %3422 = arith.shrsi %3408, %3421 : i64
        %3423 = arith.constant 2 : i64
        %3424 = arith.shrsi %3410, %3423 : i64
        %3425 = arith.addi %3422, %3424 : i64
        %3426 = arith.constant -2305843009213693952 : i64
        %3427 = arith.constant 2305843009213693951 : i64
        %3428 = arith.cmpi sge, %3425, %3426 : i64
        %3429 = arith.cmpi sle, %3425, %3427 : i64
        %3430 = arith.andi %3428, %3429 : i1
        %3431 = scf.if %3430 -> (i64) {
          %3432 = arith.constant 2 : i64
          %3433 = arith.shli %3425, %3432 : i64
          scf.yield %3433 : i64
        } else {
          %3434 = func.call @cc_add(%3408, %3410) : (i64, i64) -> i64
          scf.yield %3434 : i64
        }
        scf.yield %3431 : i64
      } else {
        %3435 = func.call @cc_add(%3408, %3410) : (i64, i64) -> i64
        scf.yield %3435 : i64
      }
      func.call @stack_push_pointer(%3420) : (i64) -> ()
      %3436 = func.call @stack_pop_pointer() : () -> i64
      %3437 = arith.constant 1 : i64
      %3438 = func.call @cc_box_fixnum(%3437) : (i64) -> i64
      %3440 = arith.constant 3 : i64
      %3439 = arith.andi %3436, %3440 : i64
      %3441 = arith.constant 0 : i64
      %3442 = arith.cmpi eq, %3439, %3441 : i64
      %3444 = arith.constant 3 : i64
      %3443 = arith.andi %3438, %3444 : i64
      %3445 = arith.constant 0 : i64
      %3446 = arith.cmpi eq, %3443, %3445 : i64
      %3447 = arith.andi %3442, %3446 : i1
      %3448 = scf.if %3447 -> (i64) {
        %3449 = arith.constant 2 : i64
        %3450 = arith.shrsi %3436, %3449 : i64
        %3451 = arith.constant 2 : i64
        %3452 = arith.shrsi %3438, %3451 : i64
        %3453 = arith.addi %3450, %3452 : i64
        %3454 = arith.constant -2305843009213693952 : i64
        %3455 = arith.constant 2305843009213693951 : i64
        %3456 = arith.cmpi sge, %3453, %3454 : i64
        %3457 = arith.cmpi sle, %3453, %3455 : i64
        %3458 = arith.andi %3456, %3457 : i1
        %3459 = scf.if %3458 -> (i64) {
          %3460 = arith.constant 2 : i64
          %3461 = arith.shli %3453, %3460 : i64
          scf.yield %3461 : i64
        } else {
          %3462 = func.call @cc_add(%3436, %3438) : (i64, i64) -> i64
          scf.yield %3462 : i64
        }
        scf.yield %3459 : i64
      } else {
        %3463 = func.call @cc_add(%3436, %3438) : (i64, i64) -> i64
        scf.yield %3463 : i64
      }
      func.call @stack_push_pointer(%3448) : (i64) -> ()
      %3464 = func.call @stack_pop_pointer() : () -> i64
      %3465 = func.call @cc_nil_value() : () -> i64
      %3466 = func.call @cc_errorp(%3396) : (i64) -> i64
      %3467 = arith.cmpi ne, %3466, %3465 : i64
      %3468 = arith.cmpi eq, %3465, %3465 : i64
      %3469 = arith.andi %3467, %3468 : i1
      %3470 = scf.if %3469 -> (i64) {
        scf.yield %3396 : i64
      } else {
        scf.yield %3465 : i64
      }
      %3471 = func.call @cc_errorp(%3464) : (i64) -> i64
      %3472 = arith.cmpi ne, %3471, %3465 : i64
      %3473 = arith.cmpi eq, %3470, %3465 : i64
      %3474 = arith.andi %3472, %3473 : i1
      %3475 = scf.if %3474 -> (i64) {
        scf.yield %3464 : i64
      } else {
        scf.yield %3470 : i64
      }
      %3476 = arith.cmpi ne, %3475, %3465 : i64
      scf.if %3476 {
        func.call @stack_push_pointer(%3475) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3396) : (i64) -> ()
        func.call @stack_push_pointer(%3464) : (i64) -> ()
        %3477 = llvm.mlir.addressof @str225 : !llvm.ptr
        %3478 = func.call @cc_make_function_ref_const(%3477) : (!llvm.ptr) -> i64
        %3479 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3478, %3479) : (i64, i64) -> ()
      }
      %3480 = func.call @stack_pop_pointer() : () -> i64
      %3481 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3482 = arith.constant 20 : i64
      %3483 = func.call @cc_make_string(%3481, %3482) : (!llvm.ptr, i64) -> i64
      %3484 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3485 = arith.constant 11 : i64
      %3486 = func.call @cc_make_string(%3484, %3485) : (!llvm.ptr, i64) -> i64
      %3487 = func.call @cc_intern(%3483, %3486) : (i64, i64) -> i64
      %3488 = func.call @cc_nil_value() : () -> i64
      %3489 = func.call @cc_cons(%3487, %3488) : (i64, i64) -> i64
      %3490 = func.call @cc_values_pack(%3489) : (i64) -> i64
      %3491 = func.call @cc_symbol_value(%3487) : (i64) -> i64
      func.call @stack_push_pointer(%3491) : (i64) -> ()
      %3492 = func.call @stack_pop_pointer() : () -> i64
      %3493 = arith.constant 1 : i64
      %3494 = func.call @cc_box_fixnum(%3493) : (i64) -> i64
      %3496 = arith.constant 3 : i64
      %3495 = arith.andi %3492, %3496 : i64
      %3497 = arith.constant 0 : i64
      %3498 = arith.cmpi eq, %3495, %3497 : i64
      %3500 = arith.constant 3 : i64
      %3499 = arith.andi %3494, %3500 : i64
      %3501 = arith.constant 0 : i64
      %3502 = arith.cmpi eq, %3499, %3501 : i64
      %3503 = arith.andi %3498, %3502 : i1
      %3504 = scf.if %3503 -> (i64) {
        %3505 = arith.constant 2 : i64
        %3506 = arith.shrsi %3492, %3505 : i64
        %3507 = arith.constant 2 : i64
        %3508 = arith.shrsi %3494, %3507 : i64
        %3509 = arith.addi %3506, %3508 : i64
        %3510 = arith.constant -2305843009213693952 : i64
        %3511 = arith.constant 2305843009213693951 : i64
        %3512 = arith.cmpi sge, %3509, %3510 : i64
        %3513 = arith.cmpi sle, %3509, %3511 : i64
        %3514 = arith.andi %3512, %3513 : i1
        %3515 = scf.if %3514 -> (i64) {
          %3516 = arith.constant 2 : i64
          %3517 = arith.shli %3509, %3516 : i64
          scf.yield %3517 : i64
        } else {
          %3518 = func.call @cc_add(%3492, %3494) : (i64, i64) -> i64
          scf.yield %3518 : i64
        }
        scf.yield %3515 : i64
      } else {
        %3519 = func.call @cc_add(%3492, %3494) : (i64, i64) -> i64
        scf.yield %3519 : i64
      }
      func.call @stack_push_pointer(%3504) : (i64) -> ()
      %3520 = func.call @stack_pop_pointer() : () -> i64
      %3521 = arith.constant 1 : i1
      %3523 = arith.constant 3 : i64
      %3522 = arith.andi %3480, %3523 : i64
      %3524 = arith.constant 0 : i64
      %3525 = arith.cmpi eq, %3522, %3524 : i64
      %3527 = arith.constant 3 : i64
      %3526 = arith.andi %3520, %3527 : i64
      %3528 = arith.constant 0 : i64
      %3529 = arith.cmpi eq, %3526, %3528 : i64
      %3530 = arith.andi %3525, %3529 : i1
      %3531 = scf.if %3530 -> (i1) {
        %3532 = arith.constant 2 : i64
        %3533 = arith.shrsi %3480, %3532 : i64
        %3534 = arith.constant 2 : i64
        %3535 = arith.shrsi %3520, %3534 : i64
        %3536 = arith.cmpi eq, %3533, %3535 : i64
        scf.yield %3536 : i1
      } else {
        %3537 = func.call @cc_eq(%3480, %3520) : (i64, i64) -> i64
        %3538 = func.call @cc_nil_value() : () -> i64
        %3539 = arith.cmpi ne, %3537, %3538 : i64
        scf.yield %3539 : i1
      }
      %3540 = arith.andi %3521, %3531 : i1
      %3541 = func.call @cc_nil_value() : () -> i64
      %3542 = func.call @cc_t_value() : () -> i64
      %3543 = scf.if %3540 -> (i64) {
        scf.yield %3542 : i64
      } else {
        scf.yield %3541 : i64
      }
      func.call @stack_push_pointer(%3543) : (i64) -> ()
      %3544 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3188) : (i64) -> ()
      func.call @stack_push_pointer(%3192) : (i64) -> ()
      func.call @stack_push_pointer(%3316) : (i64) -> ()
      func.call @stack_push_pointer(%3356) : (i64) -> ()
      func.call @stack_push_pointer(%3544) : (i64) -> ()
      %3545 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3546 = func.call @cc_make_function_ref_const(%3545) : (!llvm.ptr) -> i64
      %3547 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%3546, %3547) : (i64, i64) -> ()
      %3548 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3548 : i64
    }
    %3549 = func.call @cc_nil_value() : () -> i64
    %3550 = func.call @cc_errorp(%3186) : (i64) -> i64
    %3551 = arith.cmpi ne, %3550, %3549 : i64
    %3552 = scf.if %3551 -> (i64) {
      scf.yield %3186 : i64
    } else {
      %3553 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3553) : (i64) -> ()
      %3554 = func.call @stack_pop_pointer() : () -> i64
      %3555 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3556 = arith.constant 34 : i64
      %3557 = func.call @cc_make_string(%3555, %3556) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3557) : (i64) -> ()
      %3558 = func.call @stack_pop_pointer() : () -> i64
      %3559 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3560 = arith.constant 20 : i64
      %3561 = func.call @cc_make_string(%3559, %3560) : (!llvm.ptr, i64) -> i64
      %3562 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3563 = arith.constant 11 : i64
      %3564 = func.call @cc_make_string(%3562, %3563) : (!llvm.ptr, i64) -> i64
      %3565 = func.call @cc_intern(%3561, %3564) : (i64, i64) -> i64
      %3566 = func.call @cc_nil_value() : () -> i64
      %3567 = func.call @cc_cons(%3565, %3566) : (i64, i64) -> i64
      %3568 = func.call @cc_values_pack(%3567) : (i64) -> i64
      %3569 = func.call @cc_symbol_value(%3565) : (i64) -> i64
      func.call @stack_push_pointer(%3569) : (i64) -> ()
      %3570 = func.call @stack_pop_pointer() : () -> i64
      %3571 = arith.constant 1 : i64
      %3572 = func.call @cc_box_fixnum(%3571) : (i64) -> i64
      %3574 = arith.constant 3 : i64
      %3573 = arith.andi %3570, %3574 : i64
      %3575 = arith.constant 0 : i64
      %3576 = arith.cmpi eq, %3573, %3575 : i64
      %3578 = arith.constant 3 : i64
      %3577 = arith.andi %3572, %3578 : i64
      %3579 = arith.constant 0 : i64
      %3580 = arith.cmpi eq, %3577, %3579 : i64
      %3581 = arith.andi %3576, %3580 : i1
      %3582 = scf.if %3581 -> (i64) {
        %3583 = arith.constant 2 : i64
        %3584 = arith.shrsi %3570, %3583 : i64
        %3585 = arith.constant 2 : i64
        %3586 = arith.shrsi %3572, %3585 : i64
        %3587 = arith.subi %3584, %3586 : i64
        %3588 = arith.constant -2305843009213693952 : i64
        %3589 = arith.constant 2305843009213693951 : i64
        %3590 = arith.cmpi sge, %3587, %3588 : i64
        %3591 = arith.cmpi sle, %3587, %3589 : i64
        %3592 = arith.andi %3590, %3591 : i1
        %3593 = scf.if %3592 -> (i64) {
          %3594 = arith.constant 2 : i64
          %3595 = arith.shli %3587, %3594 : i64
          scf.yield %3595 : i64
        } else {
          %3596 = func.call @cc_sub(%3570, %3572) : (i64, i64) -> i64
          scf.yield %3596 : i64
        }
        scf.yield %3593 : i64
      } else {
        %3597 = func.call @cc_sub(%3570, %3572) : (i64, i64) -> i64
        scf.yield %3597 : i64
      }
      func.call @stack_push_pointer(%3582) : (i64) -> ()
      %3598 = func.call @stack_pop_pointer() : () -> i64
      %3599 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3600 = arith.constant 20 : i64
      %3601 = func.call @cc_make_string(%3599, %3600) : (!llvm.ptr, i64) -> i64
      %3602 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3603 = arith.constant 11 : i64
      %3604 = func.call @cc_make_string(%3602, %3603) : (!llvm.ptr, i64) -> i64
      %3605 = func.call @cc_intern(%3601, %3604) : (i64, i64) -> i64
      %3606 = func.call @cc_nil_value() : () -> i64
      %3607 = func.call @cc_cons(%3605, %3606) : (i64, i64) -> i64
      %3608 = func.call @cc_values_pack(%3607) : (i64) -> i64
      %3609 = func.call @cc_symbol_value(%3605) : (i64) -> i64
      func.call @stack_push_pointer(%3609) : (i64) -> ()
      %3610 = func.call @stack_pop_pointer() : () -> i64
      %3611 = arith.constant 1 : i64
      %3612 = func.call @cc_box_fixnum(%3611) : (i64) -> i64
      %3614 = arith.constant 3 : i64
      %3613 = arith.andi %3610, %3614 : i64
      %3615 = arith.constant 0 : i64
      %3616 = arith.cmpi eq, %3613, %3615 : i64
      %3618 = arith.constant 3 : i64
      %3617 = arith.andi %3612, %3618 : i64
      %3619 = arith.constant 0 : i64
      %3620 = arith.cmpi eq, %3617, %3619 : i64
      %3621 = arith.andi %3616, %3620 : i1
      %3622 = scf.if %3621 -> (i64) {
        %3623 = arith.constant 2 : i64
        %3624 = arith.shrsi %3610, %3623 : i64
        %3625 = arith.constant 2 : i64
        %3626 = arith.shrsi %3612, %3625 : i64
        %3627 = arith.subi %3624, %3626 : i64
        %3628 = arith.constant -2305843009213693952 : i64
        %3629 = arith.constant 2305843009213693951 : i64
        %3630 = arith.cmpi sge, %3627, %3628 : i64
        %3631 = arith.cmpi sle, %3627, %3629 : i64
        %3632 = arith.andi %3630, %3631 : i1
        %3633 = scf.if %3632 -> (i64) {
          %3634 = arith.constant 2 : i64
          %3635 = arith.shli %3627, %3634 : i64
          scf.yield %3635 : i64
        } else {
          %3636 = func.call @cc_sub(%3610, %3612) : (i64, i64) -> i64
          scf.yield %3636 : i64
        }
        scf.yield %3633 : i64
      } else {
        %3637 = func.call @cc_sub(%3610, %3612) : (i64, i64) -> i64
        scf.yield %3637 : i64
      }
      func.call @stack_push_pointer(%3622) : (i64) -> ()
      %3638 = func.call @stack_pop_pointer() : () -> i64
      %3639 = arith.constant 1 : i64
      %3640 = func.call @cc_box_fixnum(%3639) : (i64) -> i64
      %3642 = arith.constant 3 : i64
      %3641 = arith.andi %3638, %3642 : i64
      %3643 = arith.constant 0 : i64
      %3644 = arith.cmpi eq, %3641, %3643 : i64
      %3646 = arith.constant 3 : i64
      %3645 = arith.andi %3640, %3646 : i64
      %3647 = arith.constant 0 : i64
      %3648 = arith.cmpi eq, %3645, %3647 : i64
      %3649 = arith.andi %3644, %3648 : i1
      %3650 = scf.if %3649 -> (i64) {
        %3651 = arith.constant 2 : i64
        %3652 = arith.shrsi %3638, %3651 : i64
        %3653 = arith.constant 2 : i64
        %3654 = arith.shrsi %3640, %3653 : i64
        %3655 = arith.subi %3652, %3654 : i64
        %3656 = arith.constant -2305843009213693952 : i64
        %3657 = arith.constant 2305843009213693951 : i64
        %3658 = arith.cmpi sge, %3655, %3656 : i64
        %3659 = arith.cmpi sle, %3655, %3657 : i64
        %3660 = arith.andi %3658, %3659 : i1
        %3661 = scf.if %3660 -> (i64) {
          %3662 = arith.constant 2 : i64
          %3663 = arith.shli %3655, %3662 : i64
          scf.yield %3663 : i64
        } else {
          %3664 = func.call @cc_sub(%3638, %3640) : (i64, i64) -> i64
          scf.yield %3664 : i64
        }
        scf.yield %3661 : i64
      } else {
        %3665 = func.call @cc_sub(%3638, %3640) : (i64, i64) -> i64
        scf.yield %3665 : i64
      }
      func.call @stack_push_pointer(%3650) : (i64) -> ()
      %3666 = func.call @stack_pop_pointer() : () -> i64
      %3667 = func.call @cc_nil_value() : () -> i64
      %3668 = func.call @cc_errorp(%3598) : (i64) -> i64
      %3669 = arith.cmpi ne, %3668, %3667 : i64
      %3670 = arith.cmpi eq, %3667, %3667 : i64
      %3671 = arith.andi %3669, %3670 : i1
      %3672 = scf.if %3671 -> (i64) {
        scf.yield %3598 : i64
      } else {
        scf.yield %3667 : i64
      }
      %3673 = func.call @cc_errorp(%3666) : (i64) -> i64
      %3674 = arith.cmpi ne, %3673, %3667 : i64
      %3675 = arith.cmpi eq, %3672, %3667 : i64
      %3676 = arith.andi %3674, %3675 : i1
      %3677 = scf.if %3676 -> (i64) {
        scf.yield %3666 : i64
      } else {
        scf.yield %3672 : i64
      }
      %3678 = arith.cmpi ne, %3677, %3667 : i64
      scf.if %3678 {
        func.call @stack_push_pointer(%3677) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3598) : (i64) -> ()
        func.call @stack_push_pointer(%3666) : (i64) -> ()
        %3679 = llvm.mlir.addressof @str234 : !llvm.ptr
        %3680 = func.call @cc_make_function_ref_const(%3679) : (!llvm.ptr) -> i64
        %3681 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3680, %3681) : (i64, i64) -> ()
      }
      %3682 = func.call @stack_pop_pointer() : () -> i64
      %3683 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3684 = arith.constant 20 : i64
      %3685 = func.call @cc_make_string(%3683, %3684) : (!llvm.ptr, i64) -> i64
      %3686 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3687 = arith.constant 11 : i64
      %3688 = func.call @cc_make_string(%3686, %3687) : (!llvm.ptr, i64) -> i64
      %3689 = func.call @cc_intern(%3685, %3688) : (i64, i64) -> i64
      %3690 = func.call @cc_nil_value() : () -> i64
      %3691 = func.call @cc_cons(%3689, %3690) : (i64, i64) -> i64
      %3692 = func.call @cc_values_pack(%3691) : (i64) -> i64
      %3693 = func.call @cc_symbol_value(%3689) : (i64) -> i64
      func.call @stack_push_pointer(%3693) : (i64) -> ()
      %3694 = func.call @stack_pop_pointer() : () -> i64
      %3695 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3695) : (i64) -> ()
      %3696 = func.call @stack_pop_pointer() : () -> i64
      %3698 = arith.constant 3 : i64
      %3697 = arith.andi %3694, %3698 : i64
      %3699 = arith.constant 0 : i64
      %3700 = arith.cmpi eq, %3697, %3699 : i64
      %3702 = arith.constant 3 : i64
      %3701 = arith.andi %3696, %3702 : i64
      %3703 = arith.constant 0 : i64
      %3704 = arith.cmpi eq, %3701, %3703 : i64
      %3705 = arith.andi %3700, %3704 : i1
      %3706 = scf.if %3705 -> (i64) {
        %3707 = arith.constant 2 : i64
        %3708 = arith.shrsi %3694, %3707 : i64
        %3709 = arith.constant 2 : i64
        %3710 = arith.shrsi %3696, %3709 : i64
        %3711 = arith.subi %3708, %3710 : i64
        %3712 = arith.constant -2305843009213693952 : i64
        %3713 = arith.constant 2305843009213693951 : i64
        %3714 = arith.cmpi sge, %3711, %3712 : i64
        %3715 = arith.cmpi sle, %3711, %3713 : i64
        %3716 = arith.andi %3714, %3715 : i1
        %3717 = scf.if %3716 -> (i64) {
          %3718 = arith.constant 2 : i64
          %3719 = arith.shli %3711, %3718 : i64
          scf.yield %3719 : i64
        } else {
          %3720 = func.call @cc_sub(%3694, %3696) : (i64, i64) -> i64
          scf.yield %3720 : i64
        }
        scf.yield %3717 : i64
      } else {
        %3721 = func.call @cc_sub(%3694, %3696) : (i64, i64) -> i64
        scf.yield %3721 : i64
      }
      func.call @stack_push_pointer(%3706) : (i64) -> ()
      %3722 = func.call @stack_pop_pointer() : () -> i64
      %3723 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3724 = arith.constant 20 : i64
      %3725 = func.call @cc_make_string(%3723, %3724) : (!llvm.ptr, i64) -> i64
      %3726 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3727 = arith.constant 11 : i64
      %3728 = func.call @cc_make_string(%3726, %3727) : (!llvm.ptr, i64) -> i64
      %3729 = func.call @cc_intern(%3725, %3728) : (i64, i64) -> i64
      %3730 = func.call @cc_nil_value() : () -> i64
      %3731 = func.call @cc_cons(%3729, %3730) : (i64, i64) -> i64
      %3732 = func.call @cc_values_pack(%3731) : (i64) -> i64
      %3733 = func.call @cc_symbol_value(%3729) : (i64) -> i64
      func.call @stack_push_pointer(%3733) : (i64) -> ()
      %3734 = func.call @stack_pop_pointer() : () -> i64
      %3735 = arith.constant 1 : i64
      %3736 = func.call @cc_box_fixnum(%3735) : (i64) -> i64
      %3738 = arith.constant 3 : i64
      %3737 = arith.andi %3734, %3738 : i64
      %3739 = arith.constant 0 : i64
      %3740 = arith.cmpi eq, %3737, %3739 : i64
      %3742 = arith.constant 3 : i64
      %3741 = arith.andi %3736, %3742 : i64
      %3743 = arith.constant 0 : i64
      %3744 = arith.cmpi eq, %3741, %3743 : i64
      %3745 = arith.andi %3740, %3744 : i1
      %3746 = scf.if %3745 -> (i64) {
        %3747 = arith.constant 2 : i64
        %3748 = arith.shrsi %3734, %3747 : i64
        %3749 = arith.constant 2 : i64
        %3750 = arith.shrsi %3736, %3749 : i64
        %3751 = arith.subi %3748, %3750 : i64
        %3752 = arith.constant -2305843009213693952 : i64
        %3753 = arith.constant 2305843009213693951 : i64
        %3754 = arith.cmpi sge, %3751, %3752 : i64
        %3755 = arith.cmpi sle, %3751, %3753 : i64
        %3756 = arith.andi %3754, %3755 : i1
        %3757 = scf.if %3756 -> (i64) {
          %3758 = arith.constant 2 : i64
          %3759 = arith.shli %3751, %3758 : i64
          scf.yield %3759 : i64
        } else {
          %3760 = func.call @cc_sub(%3734, %3736) : (i64, i64) -> i64
          scf.yield %3760 : i64
        }
        scf.yield %3757 : i64
      } else {
        %3761 = func.call @cc_sub(%3734, %3736) : (i64, i64) -> i64
        scf.yield %3761 : i64
      }
      func.call @stack_push_pointer(%3746) : (i64) -> ()
      %3762 = func.call @stack_pop_pointer() : () -> i64
      %3763 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3764 = arith.constant 20 : i64
      %3765 = func.call @cc_make_string(%3763, %3764) : (!llvm.ptr, i64) -> i64
      %3766 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3767 = arith.constant 11 : i64
      %3768 = func.call @cc_make_string(%3766, %3767) : (!llvm.ptr, i64) -> i64
      %3769 = func.call @cc_intern(%3765, %3768) : (i64, i64) -> i64
      %3770 = func.call @cc_nil_value() : () -> i64
      %3771 = func.call @cc_cons(%3769, %3770) : (i64, i64) -> i64
      %3772 = func.call @cc_values_pack(%3771) : (i64) -> i64
      %3773 = func.call @cc_symbol_value(%3769) : (i64) -> i64
      func.call @stack_push_pointer(%3773) : (i64) -> ()
      %3774 = func.call @stack_pop_pointer() : () -> i64
      %3775 = arith.constant 1 : i64
      %3776 = func.call @cc_box_fixnum(%3775) : (i64) -> i64
      %3778 = arith.constant 3 : i64
      %3777 = arith.andi %3774, %3778 : i64
      %3779 = arith.constant 0 : i64
      %3780 = arith.cmpi eq, %3777, %3779 : i64
      %3782 = arith.constant 3 : i64
      %3781 = arith.andi %3776, %3782 : i64
      %3783 = arith.constant 0 : i64
      %3784 = arith.cmpi eq, %3781, %3783 : i64
      %3785 = arith.andi %3780, %3784 : i1
      %3786 = scf.if %3785 -> (i64) {
        %3787 = arith.constant 2 : i64
        %3788 = arith.shrsi %3774, %3787 : i64
        %3789 = arith.constant 2 : i64
        %3790 = arith.shrsi %3776, %3789 : i64
        %3791 = arith.subi %3788, %3790 : i64
        %3792 = arith.constant -2305843009213693952 : i64
        %3793 = arith.constant 2305843009213693951 : i64
        %3794 = arith.cmpi sge, %3791, %3792 : i64
        %3795 = arith.cmpi sle, %3791, %3793 : i64
        %3796 = arith.andi %3794, %3795 : i1
        %3797 = scf.if %3796 -> (i64) {
          %3798 = arith.constant 2 : i64
          %3799 = arith.shli %3791, %3798 : i64
          scf.yield %3799 : i64
        } else {
          %3800 = func.call @cc_sub(%3774, %3776) : (i64, i64) -> i64
          scf.yield %3800 : i64
        }
        scf.yield %3797 : i64
      } else {
        %3801 = func.call @cc_sub(%3774, %3776) : (i64, i64) -> i64
        scf.yield %3801 : i64
      }
      func.call @stack_push_pointer(%3786) : (i64) -> ()
      %3802 = func.call @stack_pop_pointer() : () -> i64
      %3803 = arith.constant 1 : i64
      %3804 = func.call @cc_box_fixnum(%3803) : (i64) -> i64
      %3806 = arith.constant 3 : i64
      %3805 = arith.andi %3802, %3806 : i64
      %3807 = arith.constant 0 : i64
      %3808 = arith.cmpi eq, %3805, %3807 : i64
      %3810 = arith.constant 3 : i64
      %3809 = arith.andi %3804, %3810 : i64
      %3811 = arith.constant 0 : i64
      %3812 = arith.cmpi eq, %3809, %3811 : i64
      %3813 = arith.andi %3808, %3812 : i1
      %3814 = scf.if %3813 -> (i64) {
        %3815 = arith.constant 2 : i64
        %3816 = arith.shrsi %3802, %3815 : i64
        %3817 = arith.constant 2 : i64
        %3818 = arith.shrsi %3804, %3817 : i64
        %3819 = arith.subi %3816, %3818 : i64
        %3820 = arith.constant -2305843009213693952 : i64
        %3821 = arith.constant 2305843009213693951 : i64
        %3822 = arith.cmpi sge, %3819, %3820 : i64
        %3823 = arith.cmpi sle, %3819, %3821 : i64
        %3824 = arith.andi %3822, %3823 : i1
        %3825 = scf.if %3824 -> (i64) {
          %3826 = arith.constant 2 : i64
          %3827 = arith.shli %3819, %3826 : i64
          scf.yield %3827 : i64
        } else {
          %3828 = func.call @cc_sub(%3802, %3804) : (i64, i64) -> i64
          scf.yield %3828 : i64
        }
        scf.yield %3825 : i64
      } else {
        %3829 = func.call @cc_sub(%3802, %3804) : (i64, i64) -> i64
        scf.yield %3829 : i64
      }
      func.call @stack_push_pointer(%3814) : (i64) -> ()
      %3830 = func.call @stack_pop_pointer() : () -> i64
      %3831 = func.call @cc_nil_value() : () -> i64
      %3832 = func.call @cc_errorp(%3762) : (i64) -> i64
      %3833 = arith.cmpi ne, %3832, %3831 : i64
      %3834 = arith.cmpi eq, %3831, %3831 : i64
      %3835 = arith.andi %3833, %3834 : i1
      %3836 = scf.if %3835 -> (i64) {
        scf.yield %3762 : i64
      } else {
        scf.yield %3831 : i64
      }
      %3837 = func.call @cc_errorp(%3830) : (i64) -> i64
      %3838 = arith.cmpi ne, %3837, %3831 : i64
      %3839 = arith.cmpi eq, %3836, %3831 : i64
      %3840 = arith.andi %3838, %3839 : i1
      %3841 = scf.if %3840 -> (i64) {
        scf.yield %3830 : i64
      } else {
        scf.yield %3836 : i64
      }
      %3842 = arith.cmpi ne, %3841, %3831 : i64
      scf.if %3842 {
        func.call @stack_push_pointer(%3841) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3762) : (i64) -> ()
        func.call @stack_push_pointer(%3830) : (i64) -> ()
        %3843 = llvm.mlir.addressof @str241 : !llvm.ptr
        %3844 = func.call @cc_make_function_ref_const(%3843) : (!llvm.ptr) -> i64
        %3845 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3844, %3845) : (i64, i64) -> ()
      }
      %3846 = func.call @stack_pop_pointer() : () -> i64
      %3847 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3848 = arith.constant 20 : i64
      %3849 = func.call @cc_make_string(%3847, %3848) : (!llvm.ptr, i64) -> i64
      %3850 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3851 = arith.constant 11 : i64
      %3852 = func.call @cc_make_string(%3850, %3851) : (!llvm.ptr, i64) -> i64
      %3853 = func.call @cc_intern(%3849, %3852) : (i64, i64) -> i64
      %3854 = func.call @cc_nil_value() : () -> i64
      %3855 = func.call @cc_cons(%3853, %3854) : (i64, i64) -> i64
      %3856 = func.call @cc_values_pack(%3855) : (i64) -> i64
      %3857 = func.call @cc_symbol_value(%3853) : (i64) -> i64
      func.call @stack_push_pointer(%3857) : (i64) -> ()
      %3858 = func.call @stack_pop_pointer() : () -> i64
      %3859 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3859) : (i64) -> ()
      %3860 = func.call @stack_pop_pointer() : () -> i64
      %3862 = arith.constant 3 : i64
      %3861 = arith.andi %3858, %3862 : i64
      %3863 = arith.constant 0 : i64
      %3864 = arith.cmpi eq, %3861, %3863 : i64
      %3866 = arith.constant 3 : i64
      %3865 = arith.andi %3860, %3866 : i64
      %3867 = arith.constant 0 : i64
      %3868 = arith.cmpi eq, %3865, %3867 : i64
      %3869 = arith.andi %3864, %3868 : i1
      %3870 = scf.if %3869 -> (i64) {
        %3871 = arith.constant 2 : i64
        %3872 = arith.shrsi %3858, %3871 : i64
        %3873 = arith.constant 2 : i64
        %3874 = arith.shrsi %3860, %3873 : i64
        %3875 = arith.subi %3872, %3874 : i64
        %3876 = arith.constant -2305843009213693952 : i64
        %3877 = arith.constant 2305843009213693951 : i64
        %3878 = arith.cmpi sge, %3875, %3876 : i64
        %3879 = arith.cmpi sle, %3875, %3877 : i64
        %3880 = arith.andi %3878, %3879 : i1
        %3881 = scf.if %3880 -> (i64) {
          %3882 = arith.constant 2 : i64
          %3883 = arith.shli %3875, %3882 : i64
          scf.yield %3883 : i64
        } else {
          %3884 = func.call @cc_sub(%3858, %3860) : (i64, i64) -> i64
          scf.yield %3884 : i64
        }
        scf.yield %3881 : i64
      } else {
        %3885 = func.call @cc_sub(%3858, %3860) : (i64, i64) -> i64
        scf.yield %3885 : i64
      }
      func.call @stack_push_pointer(%3870) : (i64) -> ()
      %3886 = func.call @stack_pop_pointer() : () -> i64
      %3887 = arith.constant 1 : i1
      %3889 = arith.constant 3 : i64
      %3888 = arith.andi %3846, %3889 : i64
      %3890 = arith.constant 0 : i64
      %3891 = arith.cmpi eq, %3888, %3890 : i64
      %3893 = arith.constant 3 : i64
      %3892 = arith.andi %3886, %3893 : i64
      %3894 = arith.constant 0 : i64
      %3895 = arith.cmpi eq, %3892, %3894 : i64
      %3896 = arith.andi %3891, %3895 : i1
      %3897 = scf.if %3896 -> (i1) {
        %3898 = arith.constant 2 : i64
        %3899 = arith.shrsi %3846, %3898 : i64
        %3900 = arith.constant 2 : i64
        %3901 = arith.shrsi %3886, %3900 : i64
        %3902 = arith.cmpi eq, %3899, %3901 : i64
        scf.yield %3902 : i1
      } else {
        %3903 = func.call @cc_eq(%3846, %3886) : (i64, i64) -> i64
        %3904 = func.call @cc_nil_value() : () -> i64
        %3905 = arith.cmpi ne, %3903, %3904 : i64
        scf.yield %3905 : i1
      }
      %3906 = arith.andi %3887, %3897 : i1
      %3907 = func.call @cc_nil_value() : () -> i64
      %3908 = func.call @cc_t_value() : () -> i64
      %3909 = scf.if %3906 -> (i64) {
        scf.yield %3908 : i64
      } else {
        scf.yield %3907 : i64
      }
      func.call @stack_push_pointer(%3909) : (i64) -> ()
      %3910 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3554) : (i64) -> ()
      func.call @stack_push_pointer(%3558) : (i64) -> ()
      func.call @stack_push_pointer(%3682) : (i64) -> ()
      func.call @stack_push_pointer(%3722) : (i64) -> ()
      func.call @stack_push_pointer(%3910) : (i64) -> ()
      %3911 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3912 = func.call @cc_make_function_ref_const(%3911) : (!llvm.ptr) -> i64
      %3913 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%3912, %3913) : (i64, i64) -> ()
      %3914 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3914 : i64
    }
    %3915 = func.call @cc_nil_value() : () -> i64
    %3916 = func.call @cc_errorp(%3552) : (i64) -> i64
    %3917 = arith.cmpi ne, %3916, %3915 : i64
    %3918 = scf.if %3917 -> (i64) {
      scf.yield %3552 : i64
    } else {
      %3919 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3919) : (i64) -> ()
      %3920 = func.call @stack_pop_pointer() : () -> i64
      %3921 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3922 = arith.constant 20 : i64
      %3923 = func.call @cc_make_string(%3921, %3922) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3923) : (i64) -> ()
      %3924 = func.call @stack_pop_pointer() : () -> i64
      %3925 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3926 = arith.constant 20 : i64
      %3927 = func.call @cc_make_string(%3925, %3926) : (!llvm.ptr, i64) -> i64
      %3928 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3929 = arith.constant 11 : i64
      %3930 = func.call @cc_make_string(%3928, %3929) : (!llvm.ptr, i64) -> i64
      %3931 = func.call @cc_intern(%3927, %3930) : (i64, i64) -> i64
      %3932 = func.call @cc_nil_value() : () -> i64
      %3933 = func.call @cc_cons(%3931, %3932) : (i64, i64) -> i64
      %3934 = func.call @cc_values_pack(%3933) : (i64) -> i64
      %3935 = func.call @cc_symbol_value(%3931) : (i64) -> i64
      func.call @stack_push_pointer(%3935) : (i64) -> ()
      %3936 = func.call @stack_pop_pointer() : () -> i64
      %3937 = arith.constant 1 : i64
      %3938 = func.call @cc_box_fixnum(%3937) : (i64) -> i64
      %3940 = arith.constant 3 : i64
      %3939 = arith.andi %3936, %3940 : i64
      %3941 = arith.constant 0 : i64
      %3942 = arith.cmpi eq, %3939, %3941 : i64
      %3944 = arith.constant 3 : i64
      %3943 = arith.andi %3938, %3944 : i64
      %3945 = arith.constant 0 : i64
      %3946 = arith.cmpi eq, %3943, %3945 : i64
      %3947 = arith.andi %3942, %3946 : i1
      %3948 = scf.if %3947 -> (i64) {
        %3949 = arith.constant 2 : i64
        %3950 = arith.shrsi %3936, %3949 : i64
        %3951 = arith.constant 2 : i64
        %3952 = arith.shrsi %3938, %3951 : i64
        %3953 = arith.addi %3950, %3952 : i64
        %3954 = arith.constant -2305843009213693952 : i64
        %3955 = arith.constant 2305843009213693951 : i64
        %3956 = arith.cmpi sge, %3953, %3954 : i64
        %3957 = arith.cmpi sle, %3953, %3955 : i64
        %3958 = arith.andi %3956, %3957 : i1
        %3959 = scf.if %3958 -> (i64) {
          %3960 = arith.constant 2 : i64
          %3961 = arith.shli %3953, %3960 : i64
          scf.yield %3961 : i64
        } else {
          %3962 = func.call @cc_add(%3936, %3938) : (i64, i64) -> i64
          scf.yield %3962 : i64
        }
        scf.yield %3959 : i64
      } else {
        %3963 = func.call @cc_add(%3936, %3938) : (i64, i64) -> i64
        scf.yield %3963 : i64
      }
      func.call @stack_push_pointer(%3948) : (i64) -> ()
      %3964 = func.call @stack_pop_pointer() : () -> i64
      %3965 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3965) : (i64) -> ()
      %3966 = func.call @stack_pop_pointer() : () -> i64
      %3967 = func.call @cc_nil_value() : () -> i64
      %3968 = func.call @cc_errorp(%3964) : (i64) -> i64
      %3969 = arith.cmpi ne, %3968, %3967 : i64
      %3970 = arith.cmpi eq, %3967, %3967 : i64
      %3971 = arith.andi %3969, %3970 : i1
      %3972 = scf.if %3971 -> (i64) {
        scf.yield %3964 : i64
      } else {
        scf.yield %3967 : i64
      }
      %3973 = func.call @cc_errorp(%3966) : (i64) -> i64
      %3974 = arith.cmpi ne, %3973, %3967 : i64
      %3975 = arith.cmpi eq, %3972, %3967 : i64
      %3976 = arith.andi %3974, %3975 : i1
      %3977 = scf.if %3976 -> (i64) {
        scf.yield %3966 : i64
      } else {
        scf.yield %3972 : i64
      }
      %3978 = arith.cmpi ne, %3977, %3967 : i64
      scf.if %3978 {
        func.call @stack_push_pointer(%3977) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3964) : (i64) -> ()
        func.call @stack_push_pointer(%3966) : (i64) -> ()
        %3979 = llvm.mlir.addressof @str248 : !llvm.ptr
        %3980 = func.call @cc_make_function_ref_const(%3979) : (!llvm.ptr) -> i64
        %3981 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3980, %3981) : (i64, i64) -> ()
      }
      %3982 = func.call @stack_pop_pointer() : () -> i64
      %3983 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3984 = arith.constant 20 : i64
      %3985 = func.call @cc_make_string(%3983, %3984) : (!llvm.ptr, i64) -> i64
      %3986 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3987 = arith.constant 11 : i64
      %3988 = func.call @cc_make_string(%3986, %3987) : (!llvm.ptr, i64) -> i64
      %3989 = func.call @cc_intern(%3985, %3988) : (i64, i64) -> i64
      %3990 = func.call @cc_nil_value() : () -> i64
      %3991 = func.call @cc_cons(%3989, %3990) : (i64, i64) -> i64
      %3992 = func.call @cc_values_pack(%3991) : (i64) -> i64
      %3993 = func.call @cc_symbol_value(%3989) : (i64) -> i64
      func.call @stack_push_pointer(%3993) : (i64) -> ()
      %3994 = func.call @stack_pop_pointer() : () -> i64
      %3995 = arith.constant 1 : i64
      %3996 = func.call @cc_box_fixnum(%3995) : (i64) -> i64
      %3998 = arith.constant 3 : i64
      %3997 = arith.andi %3994, %3998 : i64
      %3999 = arith.constant 0 : i64
      %4000 = arith.cmpi eq, %3997, %3999 : i64
      %4002 = arith.constant 3 : i64
      %4001 = arith.andi %3996, %4002 : i64
      %4003 = arith.constant 0 : i64
      %4004 = arith.cmpi eq, %4001, %4003 : i64
      %4005 = arith.andi %4000, %4004 : i1
      %4006 = scf.if %4005 -> (i64) {
        %4007 = arith.constant 2 : i64
        %4008 = arith.shrsi %3994, %4007 : i64
        %4009 = arith.constant 2 : i64
        %4010 = arith.shrsi %3996, %4009 : i64
        %4011 = arith.addi %4008, %4010 : i64
        %4012 = arith.constant -2305843009213693952 : i64
        %4013 = arith.constant 2305843009213693951 : i64
        %4014 = arith.cmpi sge, %4011, %4012 : i64
        %4015 = arith.cmpi sle, %4011, %4013 : i64
        %4016 = arith.andi %4014, %4015 : i1
        %4017 = scf.if %4016 -> (i64) {
          %4018 = arith.constant 2 : i64
          %4019 = arith.shli %4011, %4018 : i64
          scf.yield %4019 : i64
        } else {
          %4020 = func.call @cc_add(%3994, %3996) : (i64, i64) -> i64
          scf.yield %4020 : i64
        }
        scf.yield %4017 : i64
      } else {
        %4021 = func.call @cc_add(%3994, %3996) : (i64, i64) -> i64
        scf.yield %4021 : i64
      }
      func.call @stack_push_pointer(%4006) : (i64) -> ()
      %4022 = func.call @stack_pop_pointer() : () -> i64
      %4023 = llvm.mlir.addressof @str251 : !llvm.ptr
      %4024 = arith.constant 20 : i64
      %4025 = func.call @cc_make_string(%4023, %4024) : (!llvm.ptr, i64) -> i64
      %4026 = llvm.mlir.addressof @str252 : !llvm.ptr
      %4027 = arith.constant 11 : i64
      %4028 = func.call @cc_make_string(%4026, %4027) : (!llvm.ptr, i64) -> i64
      %4029 = func.call @cc_intern(%4025, %4028) : (i64, i64) -> i64
      %4030 = func.call @cc_nil_value() : () -> i64
      %4031 = func.call @cc_cons(%4029, %4030) : (i64, i64) -> i64
      %4032 = func.call @cc_values_pack(%4031) : (i64) -> i64
      %4033 = func.call @cc_symbol_value(%4029) : (i64) -> i64
      func.call @stack_push_pointer(%4033) : (i64) -> ()
      %4034 = func.call @stack_pop_pointer() : () -> i64
      %4035 = arith.constant 1 : i64
      %4036 = func.call @cc_box_fixnum(%4035) : (i64) -> i64
      %4038 = arith.constant 3 : i64
      %4037 = arith.andi %4034, %4038 : i64
      %4039 = arith.constant 0 : i64
      %4040 = arith.cmpi eq, %4037, %4039 : i64
      %4042 = arith.constant 3 : i64
      %4041 = arith.andi %4036, %4042 : i64
      %4043 = arith.constant 0 : i64
      %4044 = arith.cmpi eq, %4041, %4043 : i64
      %4045 = arith.andi %4040, %4044 : i1
      %4046 = scf.if %4045 -> (i64) {
        %4047 = arith.constant 2 : i64
        %4048 = arith.shrsi %4034, %4047 : i64
        %4049 = arith.constant 2 : i64
        %4050 = arith.shrsi %4036, %4049 : i64
        %4051 = arith.addi %4048, %4050 : i64
        %4052 = arith.constant -2305843009213693952 : i64
        %4053 = arith.constant 2305843009213693951 : i64
        %4054 = arith.cmpi sge, %4051, %4052 : i64
        %4055 = arith.cmpi sle, %4051, %4053 : i64
        %4056 = arith.andi %4054, %4055 : i1
        %4057 = scf.if %4056 -> (i64) {
          %4058 = arith.constant 2 : i64
          %4059 = arith.shli %4051, %4058 : i64
          scf.yield %4059 : i64
        } else {
          %4060 = func.call @cc_add(%4034, %4036) : (i64, i64) -> i64
          scf.yield %4060 : i64
        }
        scf.yield %4057 : i64
      } else {
        %4061 = func.call @cc_add(%4034, %4036) : (i64, i64) -> i64
        scf.yield %4061 : i64
      }
      func.call @stack_push_pointer(%4046) : (i64) -> ()
      %4062 = func.call @stack_pop_pointer() : () -> i64
      %4063 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4063) : (i64) -> ()
      %4064 = func.call @stack_pop_pointer() : () -> i64
      %4065 = func.call @cc_nil_value() : () -> i64
      %4066 = func.call @cc_errorp(%4062) : (i64) -> i64
      %4067 = arith.cmpi ne, %4066, %4065 : i64
      %4068 = arith.cmpi eq, %4065, %4065 : i64
      %4069 = arith.andi %4067, %4068 : i1
      %4070 = scf.if %4069 -> (i64) {
        scf.yield %4062 : i64
      } else {
        scf.yield %4065 : i64
      }
      %4071 = func.call @cc_errorp(%4064) : (i64) -> i64
      %4072 = arith.cmpi ne, %4071, %4065 : i64
      %4073 = arith.cmpi eq, %4070, %4065 : i64
      %4074 = arith.andi %4072, %4073 : i1
      %4075 = scf.if %4074 -> (i64) {
        scf.yield %4064 : i64
      } else {
        scf.yield %4070 : i64
      }
      %4076 = arith.cmpi ne, %4075, %4065 : i64
      scf.if %4076 {
        func.call @stack_push_pointer(%4075) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4062) : (i64) -> ()
        func.call @stack_push_pointer(%4064) : (i64) -> ()
        %4077 = llvm.mlir.addressof @str253 : !llvm.ptr
        %4078 = func.call @cc_make_function_ref_const(%4077) : (!llvm.ptr) -> i64
        %4079 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%4078, %4079) : (i64, i64) -> ()
      }
      %4080 = func.call @stack_pop_pointer() : () -> i64
      %4081 = arith.constant 1 : i1
      %4083 = arith.constant 3 : i64
      %4082 = arith.andi %4022, %4083 : i64
      %4084 = arith.constant 0 : i64
      %4085 = arith.cmpi eq, %4082, %4084 : i64
      %4087 = arith.constant 3 : i64
      %4086 = arith.andi %4080, %4087 : i64
      %4088 = arith.constant 0 : i64
      %4089 = arith.cmpi eq, %4086, %4088 : i64
      %4090 = arith.andi %4085, %4089 : i1
      %4091 = scf.if %4090 -> (i1) {
        %4092 = arith.constant 2 : i64
        %4093 = arith.shrsi %4022, %4092 : i64
        %4094 = arith.constant 2 : i64
        %4095 = arith.shrsi %4080, %4094 : i64
        %4096 = arith.cmpi eq, %4093, %4095 : i64
        scf.yield %4096 : i1
      } else {
        %4097 = func.call @cc_eq(%4022, %4080) : (i64, i64) -> i64
        %4098 = func.call @cc_nil_value() : () -> i64
        %4099 = arith.cmpi ne, %4097, %4098 : i64
        scf.yield %4099 : i1
      }
      %4100 = arith.andi %4081, %4091 : i1
      %4101 = func.call @cc_nil_value() : () -> i64
      %4102 = func.call @cc_t_value() : () -> i64
      %4103 = scf.if %4100 -> (i64) {
        scf.yield %4102 : i64
      } else {
        scf.yield %4101 : i64
      }
      func.call @stack_push_pointer(%4103) : (i64) -> ()
      %4104 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3920) : (i64) -> ()
      func.call @stack_push_pointer(%3924) : (i64) -> ()
      func.call @stack_push_pointer(%3982) : (i64) -> ()
      func.call @stack_push_pointer(%4104) : (i64) -> ()
      %4105 = llvm.mlir.addressof @str254 : !llvm.ptr
      %4106 = func.call @cc_make_function_ref_const(%4105) : (!llvm.ptr) -> i64
      %4107 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%4106, %4107) : (i64, i64) -> ()
      %4108 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4108 : i64
    }
    %4109 = func.call @cc_nil_value() : () -> i64
    %4110 = func.call @cc_errorp(%3918) : (i64) -> i64
    %4111 = arith.cmpi ne, %4110, %4109 : i64
    %4112 = scf.if %4111 -> (i64) {
      scf.yield %3918 : i64
    } else {
      %4113 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4113) : (i64) -> ()
      %4114 = func.call @stack_pop_pointer() : () -> i64
      %4115 = llvm.mlir.addressof @str255 : !llvm.ptr
      %4116 = arith.constant 24 : i64
      %4117 = func.call @cc_make_string(%4115, %4116) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4117) : (i64) -> ()
      %4118 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      func.call @stack_push_pointer(%4118) : (i64) -> ()
      %4119 = llvm.mlir.addressof @str256 : !llvm.ptr
      %4120 = func.call @cc_make_function_ref_const(%4119) : (!llvm.ptr) -> i64
      %4121 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%4120, %4121) : (i64, i64) -> ()
      %4122 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4122 : i64
    }
    %4123 = func.call @cc_nil_value() : () -> i64
    %4124 = func.call @cc_errorp(%4112) : (i64) -> i64
    %4125 = arith.cmpi ne, %4124, %4123 : i64
    %4126 = scf.if %4125 -> (i64) {
      scf.yield %4112 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %4286 = func.call @stack_pop_pointer() : () -> i64
      %4287 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%4287) : (i64) -> ()
      %4288 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%4288) : (i64) -> ()
      %4289 = arith.constant 200 : i64
      func.call @stack_push_fixnum(%4289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4290 = func.call @stack_pop_pointer() : () -> i64
      %4291 = func.call @stack_pop_pointer() : () -> i64
      %4292 = func.call @cc_cons(%4291, %4290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4292) : (i64) -> ()
      %4293 = func.call @stack_pop_pointer() : () -> i64
      %4294 = func.call @stack_pop_pointer() : () -> i64
      %4295 = func.call @cc_cons(%4294, %4293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4295) : (i64) -> ()
      %4296 = func.call @stack_pop_pointer() : () -> i64
      %4297 = func.call @stack_pop_pointer() : () -> i64
      %4298 = func.call @cc_cons(%4297, %4296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4298) : (i64) -> ()
      %4299 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4300 = func.call @stack_pop_pointer() : () -> i64
      %4301 = func.call @cc_nil_value() : () -> i64
      %4302 = func.call @cc_nil_value() : () -> i64
      %4303 = func.call @cc_errorp(%4301) : (i64) -> i64
      %4304 = arith.cmpi ne, %4303, %4302 : i64
      %4305 = scf.if %4304 -> (i64) {
        scf.yield %4301 : i64
      } else {
        %4306 = func.call @cc_nil_value() : () -> i64
        %4307 = llvm.mlir.addressof @str264 : !llvm.ptr
        %4308 = arith.constant 38 : i64
        %4309 = func.call @cc_make_string(%4307, %4308) : (!llvm.ptr, i64) -> i64
        %4310 = func.call @cc_nil_value() : () -> i64
        %4311 = func.call @cc_intern(%4309, %4310) : (i64, i64) -> i64
        %4312 = func.call @cc_nil_value() : () -> i64
        %4313 = func.call @cc_cons(%4311, %4312) : (i64, i64) -> i64
        %4314 = func.call @cc_values_pack(%4313) : (i64) -> i64
        %4315 = func.call @cc_set_symbol_value(%4311, %4306) : (i64, i64) -> i64
        %4316 = llvm.mlir.addressof @str265 : !llvm.ptr
        %4317 = arith.constant 39 : i64
        %4318 = func.call @cc_make_string(%4316, %4317) : (!llvm.ptr, i64) -> i64
        %4319 = func.call @cc_nil_value() : () -> i64
        %4320 = func.call @cc_intern(%4318, %4319) : (i64, i64) -> i64
        %4321 = func.call @cc_nil_value() : () -> i64
        %4322 = func.call @cc_cons(%4320, %4321) : (i64, i64) -> i64
        %4323 = func.call @cc_values_pack(%4322) : (i64) -> i64
        %4324 = func.call @cc_set_symbol_value(%4320, %4306) : (i64, i64) -> i64
        %4325 = llvm.mlir.addressof @str266 : !llvm.ptr
        %4326 = arith.constant 40 : i64
        %4327 = func.call @cc_make_string(%4325, %4326) : (!llvm.ptr, i64) -> i64
        %4328 = func.call @cc_nil_value() : () -> i64
        %4329 = func.call @cc_intern(%4327, %4328) : (i64, i64) -> i64
        %4330 = func.call @cc_nil_value() : () -> i64
        %4331 = func.call @cc_cons(%4329, %4330) : (i64, i64) -> i64
        %4332 = func.call @cc_values_pack(%4331) : (i64) -> i64
        %4333 = func.call @cc_set_symbol_value(%4329, %4306) : (i64, i64) -> i64
        %4334:3 = scf.while (%arg0 = %4286, %arg1 = %4300, %arg2 = %4299) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %4335 = func.call @stack_pop_pointer() : () -> i64
          %4336 = func.call @cc_nil_value() : () -> i64
          %4337 = arith.cmpi ne, %4335, %4336 : i64
          %4338 = func.call @cc_nil_value() : () -> i64
          %4339 = llvm.mlir.addressof @str267 : !llvm.ptr
          %4340 = arith.constant 38 : i64
          %4341 = func.call @cc_make_string(%4339, %4340) : (!llvm.ptr, i64) -> i64
          %4342 = func.call @cc_nil_value() : () -> i64
          %4343 = func.call @cc_intern(%4341, %4342) : (i64, i64) -> i64
          %4344 = func.call @cc_nil_value() : () -> i64
          %4345 = func.call @cc_cons(%4343, %4344) : (i64, i64) -> i64
          %4346 = func.call @cc_values_pack(%4345) : (i64) -> i64
          %4347 = func.call @cc_symbol_value(%4343) : (i64) -> i64
          %4348 = arith.cmpi ne, %4347, %4338 : i64
          %4349 = llvm.mlir.addressof @str268 : !llvm.ptr
          %4350 = arith.constant 38 : i64
          %4351 = func.call @cc_make_string(%4349, %4350) : (!llvm.ptr, i64) -> i64
          %4352 = func.call @cc_nil_value() : () -> i64
          %4353 = func.call @cc_intern(%4351, %4352) : (i64, i64) -> i64
          %4354 = func.call @cc_nil_value() : () -> i64
          %4355 = func.call @cc_cons(%4353, %4354) : (i64, i64) -> i64
          %4356 = func.call @cc_values_pack(%4355) : (i64) -> i64
          %4357 = func.call @cc_symbol_value(%4353) : (i64) -> i64
          %4358 = arith.cmpi ne, %4357, %4338 : i64
          %4359 = arith.ori %4348, %4358 : i1
          %4360 = arith.constant 0 : i1
          %4361 = arith.cmpi eq, %4359, %4360 : i1
          %4362 = arith.andi %4337, %4361 : i1
          scf.condition(%4362) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%4363: i64, %4364: i64, %4365: i64):
          %4366 = func.call @cc_nil_value() : () -> i64
          %4367 = func.call @cc_nil_value() : () -> i64
          %4368 = func.call @cc_errorp(%4366) : (i64) -> i64
          %4369 = arith.cmpi ne, %4368, %4367 : i64
          %4370:3 = scf.if %4369 -> (i64, i64, i64) {
            scf.yield %4366, %4364, %4363 : i64, i64, i64
          } else {
            %4371 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%4365) : (i64) -> ()
            %4372 = func.call @stack_pop_pointer() : () -> i64
            %4373 = func.call @cc_nil_value() : () -> i64
            %4374 = arith.cmpi eq, %4372, %4373 : i64
            %4376 = func.call @cc_t_value() : () -> i64
            %4375 = arith.select %4374, %4376, %4373 : i64
            func.call @stack_push_pointer(%4375) : (i64) -> ()
            %4377 = func.call @stack_pop_pointer() : () -> i64
            %4378 = func.call @cc_nil_value() : () -> i64
            %4379 = func.call @cc_cons(%4377, %4378) : (i64, i64) -> i64
            %4380 = func.call @cc_not(%4379) : (i64) -> i64
            func.call @stack_push_pointer(%4380) : (i64) -> ()
            %4381 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4365) : (i64) -> ()
            %4382 = func.call @stack_pop_pointer() : () -> i64
            %4383 = func.call @cc_is_cons(%4382) : (i64) -> i32
            %4384 = arith.constant 0 : i32
            %4385 = arith.cmpi ne, %4383, %4384 : i32
            %4386 = func.call @cc_t_value() : () -> i64
            %4387 = func.call @cc_nil_value() : () -> i64
            %4388 = arith.select %4385, %4386, %4387 : i64
            func.call @stack_push_pointer(%4388) : (i64) -> ()
            %4389 = func.call @stack_pop_pointer() : () -> i64
            %4390 = func.call @cc_nil_value() : () -> i64
            %4391 = func.call @cc_cons(%4389, %4390) : (i64, i64) -> i64
            %4392 = func.call @cc_not(%4391) : (i64) -> i64
            func.call @stack_push_pointer(%4392) : (i64) -> ()
            %4393 = func.call @stack_pop_pointer() : () -> i64
            %4394 = func.call @cc_cons(%4393, %4371) : (i64, i64) -> i64
            %4395 = func.call @cc_cons(%4381, %4394) : (i64, i64) -> i64
            %4396 = func.call @cc_and(%4395) : (i64) -> i64
            func.call @stack_push_pointer(%4396) : (i64) -> ()
            %4397 = func.call @stack_pop_pointer() : () -> i64
            %4398 = func.call @cc_nil_value() : () -> i64
            %4399 = arith.cmpi ne, %4397, %4398 : i64
            scf.if %4399 {
              %4400 = llvm.mlir.addressof @str269 : !llvm.ptr
              %4401 = arith.constant 10 : i64
              %4402 = func.call @cc_make_string(%4400, %4401) : (!llvm.ptr, i64) -> i64
              %4403 = func.call @cc_nil_value() : () -> i64
              %4404 = func.call @cc_intern(%4402, %4403) : (i64, i64) -> i64
              %4405 = func.call @cc_nil_value() : () -> i64
              %4406 = func.call @cc_cons(%4404, %4405) : (i64, i64) -> i64
              %4407 = func.call @cc_values_pack(%4406) : (i64) -> i64
              func.call @stack_push_pointer(%4404) : (i64) -> ()
              %4408 = func.call @stack_pop_pointer() : () -> i64
              %4409 = func.call @cc_nil_value() : () -> i64
              %4410 = func.call @cc_errorp(%4408) : (i64) -> i64
              %4411 = arith.cmpi ne, %4410, %4409 : i64
              %4412 = arith.cmpi eq, %4409, %4409 : i64
              %4413 = arith.andi %4411, %4412 : i1
              %4414 = scf.if %4413 -> (i64) {
                scf.yield %4408 : i64
              } else {
                scf.yield %4409 : i64
              }
              %4415 = arith.cmpi ne, %4414, %4409 : i64
              scf.if %4415 {
                func.call @stack_push_pointer(%4414) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%4408) : (i64) -> ()
                %4416 = llvm.mlir.addressof @str270 : !llvm.ptr
                %4417 = func.call @cc_make_function_ref_const(%4416) : (!llvm.ptr) -> i64
                %4418 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%4417, %4418) : (i64, i64) -> ()
              }
              %4419 = func.call @stack_pop_pointer() : () -> i64
              %4420 = func.call @cc_multiple_value_list(%4419) : (i64) -> i64
              %4421 = func.call @cc_t_value() : () -> i64
              %4422 = llvm.mlir.addressof @str271 : !llvm.ptr
              %4423 = arith.constant 38 : i64
              %4424 = func.call @cc_make_string(%4422, %4423) : (!llvm.ptr, i64) -> i64
              %4425 = func.call @cc_nil_value() : () -> i64
              %4426 = func.call @cc_intern(%4424, %4425) : (i64, i64) -> i64
              %4427 = func.call @cc_nil_value() : () -> i64
              %4428 = func.call @cc_cons(%4426, %4427) : (i64, i64) -> i64
              %4429 = func.call @cc_values_pack(%4428) : (i64) -> i64
              %4430 = func.call @cc_set_symbol_value(%4426, %4421) : (i64, i64) -> i64
              %4431 = llvm.mlir.addressof @str272 : !llvm.ptr
              %4432 = arith.constant 39 : i64
              %4433 = func.call @cc_make_string(%4431, %4432) : (!llvm.ptr, i64) -> i64
              %4434 = func.call @cc_nil_value() : () -> i64
              %4435 = func.call @cc_intern(%4433, %4434) : (i64, i64) -> i64
              %4436 = func.call @cc_nil_value() : () -> i64
              %4437 = func.call @cc_cons(%4435, %4436) : (i64, i64) -> i64
              %4438 = func.call @cc_values_pack(%4437) : (i64) -> i64
              %4439 = func.call @cc_set_symbol_value(%4435, %4419) : (i64, i64) -> i64
              %4440 = llvm.mlir.addressof @str273 : !llvm.ptr
              %4441 = arith.constant 40 : i64
              %4442 = func.call @cc_make_string(%4440, %4441) : (!llvm.ptr, i64) -> i64
              %4443 = func.call @cc_nil_value() : () -> i64
              %4444 = func.call @cc_intern(%4442, %4443) : (i64, i64) -> i64
              %4445 = func.call @cc_nil_value() : () -> i64
              %4446 = func.call @cc_cons(%4444, %4445) : (i64, i64) -> i64
              %4447 = func.call @cc_values_pack(%4446) : (i64) -> i64
              %4448 = func.call @cc_set_symbol_value(%4444, %4420) : (i64, i64) -> i64
              func.call @stack_push_pointer(%4419) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %4449 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4449, %4364, %4363 : i64, i64, i64
          }
          %4450 = func.call @cc_nil_value() : () -> i64
          %4451 = func.call @cc_errorp(%4370#0) : (i64) -> i64
          %4452 = arith.cmpi ne, %4451, %4450 : i64
          %4453:3 = scf.if %4452 -> (i64, i64, i64) {
            scf.yield %4370#0, %4370#1, %4370#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%4365) : (i64) -> ()
            %4454 = func.call @stack_pop_pointer() : () -> i64
            %4455 = func.call @cc_car(%4454) : (i64) -> i64
            func.call @stack_push_pointer(%4455) : (i64) -> ()
            %4456 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4456) : (i64) -> ()
            %4457 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4457, %4370#1, %4456 : i64, i64, i64
          }
          %4458 = func.call @cc_nil_value() : () -> i64
          %4459 = func.call @cc_errorp(%4453#0) : (i64) -> i64
          %4460 = arith.cmpi ne, %4459, %4458 : i64
          %4461:3 = scf.if %4460 -> (i64, i64, i64) {
            scf.yield %4453#0, %4453#1, %4453#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%4453#2) : (i64) -> ()
            %4462 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4462) : (i64) -> ()
            func.call @"local_factorial_156157209477127"() : () -> ()
            %4463 = func.call @stack_pop_pointer() : () -> i64
            %4464 = func.call @cc_nil_value() : () -> i64
            %4465 = func.call @cc_errorp(%4463) : (i64) -> i64
            %4466 = arith.cmpi ne, %4465, %4464 : i64
            %4467 = arith.cmpi eq, %4464, %4464 : i64
            %4468 = arith.andi %4466, %4467 : i1
            %4469 = scf.if %4468 -> (i64) {
              scf.yield %4463 : i64
            } else {
              scf.yield %4464 : i64
            }
            %4470 = arith.cmpi ne, %4469, %4464 : i64
            scf.if %4470 {
              func.call @stack_push_pointer(%4469) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%4463) : (i64) -> ()
              %4471 = llvm.mlir.addressof @str274 : !llvm.ptr
              %4472 = func.call @cc_make_function_ref_const(%4471) : (!llvm.ptr) -> i64
              %4473 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%4472, %4473) : (i64, i64) -> ()
            }
            %4474 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4474) : (i64) -> ()
            %4475 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4475, %4474, %4453#2 : i64, i64, i64
          }
          %4476 = func.call @cc_nil_value() : () -> i64
          %4477 = func.call @cc_errorp(%4461#0) : (i64) -> i64
          %4478 = arith.cmpi ne, %4477, %4476 : i64
          %4479:3 = scf.if %4478 -> (i64, i64, i64) {
            scf.yield %4461#0, %4461#1, %4461#2 : i64, i64, i64
          } else {
            %4480 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%4480) : (i64) -> ()
            %4481 = func.call @stack_pop_pointer() : () -> i64
            %4482 = llvm.mlir.addressof @str275 : !llvm.ptr
            %4483 = arith.constant 42 : i64
            %4484 = func.call @cc_make_string(%4482, %4483) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%4484) : (i64) -> ()
            %4485 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4461#2) : (i64) -> ()
            %4486 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4461#1) : (i64) -> ()
            %4487 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4461#1) : (i64) -> ()
            %4488 = func.call @stack_pop_pointer() : () -> i64
            %4489 = func.call @cc_type_of(%4488) : (i64) -> i64
            func.call @stack_push_pointer(%4489) : (i64) -> ()
            %4490 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4461#1) : (i64) -> ()
            %4491 = func.call @stack_pop_pointer() : () -> i64
            %4492 = func.call @cc_floatp(%4491) : (i64) -> i64
            func.call @stack_push_pointer(%4492) : (i64) -> ()
            %4493 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4461#1) : (i64) -> ()
            %4494 = func.call @stack_pop_pointer() : () -> i64
            %4495 = func.call @cc_nil_value() : () -> i64
            %4496 = func.call @cc_errorp(%4494) : (i64) -> i64
            %4497 = arith.cmpi ne, %4496, %4495 : i64
            %4498 = arith.cmpi eq, %4495, %4495 : i64
            %4499 = arith.andi %4497, %4498 : i1
            %4500 = scf.if %4499 -> (i64) {
              scf.yield %4494 : i64
            } else {
              scf.yield %4495 : i64
            }
            %4501 = arith.cmpi ne, %4500, %4495 : i64
            scf.if %4501 {
              func.call @stack_push_pointer(%4500) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%4494) : (i64) -> ()
              %4502 = llvm.mlir.addressof @str276 : !llvm.ptr
              %4503 = func.call @cc_make_function_ref_const(%4502) : (!llvm.ptr) -> i64
              %4504 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%4503, %4504) : (i64, i64) -> ()
            }
            %4505 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4481) : (i64) -> ()
            func.call @stack_push_pointer(%4485) : (i64) -> ()
            func.call @stack_push_pointer(%4486) : (i64) -> ()
            func.call @stack_push_pointer(%4487) : (i64) -> ()
            func.call @stack_push_pointer(%4490) : (i64) -> ()
            func.call @stack_push_pointer(%4493) : (i64) -> ()
            func.call @stack_push_pointer(%4505) : (i64) -> ()
            %4506 = llvm.mlir.addressof @str277 : !llvm.ptr
            %4507 = func.call @cc_make_function_ref_const(%4506) : (!llvm.ptr) -> i64
            %4508 = arith.constant 7 : i64
            func.call @cc_funcall_stack(%4507, %4508) : (i64, i64) -> ()
            %4509 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %4509, %4461#1, %4461#2 : i64, i64, i64
          }
          func.call @stack_push_pointer(%4479#0) : (i64) -> ()
          %4510 = func.call @stack_depth() : () -> i64
          %4511 = arith.constant 0 : i64
          %4512 = arith.cmpi sgt, %4510, %4511 : i64
          scf.if %4512 {
            %4513 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%4365) : (i64) -> ()
          %4514 = func.call @stack_pop_pointer() : () -> i64
          %4515 = func.call @cc_cdr(%4514) : (i64) -> i64
          func.call @stack_push_pointer(%4515) : (i64) -> ()
          %4516 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4516) : (i64) -> ()
          %4517 = func.call @stack_depth() : () -> i64
          %4518 = arith.constant 0 : i64
          %4519 = arith.cmpi sgt, %4517, %4518 : i64
          scf.if %4519 {
            %4520 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %4479#2, %4479#1, %4516 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %4521 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4522 = func.call @stack_pop_pointer() : () -> i64
        %4523 = func.call @cc_multiple_value_list(%4522) : (i64) -> i64
        %4524 = llvm.mlir.addressof @str278 : !llvm.ptr
        %4525 = arith.constant 38 : i64
        %4526 = func.call @cc_make_string(%4524, %4525) : (!llvm.ptr, i64) -> i64
        %4527 = func.call @cc_nil_value() : () -> i64
        %4528 = func.call @cc_intern(%4526, %4527) : (i64, i64) -> i64
        %4529 = func.call @cc_nil_value() : () -> i64
        %4530 = func.call @cc_cons(%4528, %4529) : (i64, i64) -> i64
        %4531 = func.call @cc_values_pack(%4530) : (i64) -> i64
        %4532 = func.call @cc_symbol_value(%4528) : (i64) -> i64
        %4533 = llvm.mlir.addressof @str279 : !llvm.ptr
        %4534 = arith.constant 39 : i64
        %4535 = func.call @cc_make_string(%4533, %4534) : (!llvm.ptr, i64) -> i64
        %4536 = func.call @cc_nil_value() : () -> i64
        %4537 = func.call @cc_intern(%4535, %4536) : (i64, i64) -> i64
        %4538 = func.call @cc_nil_value() : () -> i64
        %4539 = func.call @cc_cons(%4537, %4538) : (i64, i64) -> i64
        %4540 = func.call @cc_values_pack(%4539) : (i64) -> i64
        %4541 = func.call @cc_symbol_value(%4537) : (i64) -> i64
        %4542 = llvm.mlir.addressof @str280 : !llvm.ptr
        %4543 = arith.constant 40 : i64
        %4544 = func.call @cc_make_string(%4542, %4543) : (!llvm.ptr, i64) -> i64
        %4545 = func.call @cc_nil_value() : () -> i64
        %4546 = func.call @cc_intern(%4544, %4545) : (i64, i64) -> i64
        %4547 = func.call @cc_nil_value() : () -> i64
        %4548 = func.call @cc_cons(%4546, %4547) : (i64, i64) -> i64
        %4549 = func.call @cc_values_pack(%4548) : (i64) -> i64
        %4550 = func.call @cc_symbol_value(%4546) : (i64) -> i64
        %4551 = func.call @cc_nil_value() : () -> i64
        %4552 = arith.cmpi ne, %4532, %4551 : i64
        %4553 = scf.if %4552 -> (i64) {
          scf.yield %4550 : i64
        } else {
          scf.yield %4523 : i64
        }
        %4554 = func.call @cc_values_pack(%4553) : (i64) -> i64
        func.call @stack_push_pointer(%4554) : (i64) -> ()
        %4555 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4555 : i64
      }
      func.call @stack_push_pointer(%4305) : (i64) -> ()
      %4556 = func.call @stack_pop_pointer() : () -> i64
      %4557 = func.call @cc_multiple_value_list(%4556) : (i64) -> i64
      %4558 = func.call @cc_values_pack(%4557) : (i64) -> i64
      func.call @stack_push_pointer(%4558) : (i64) -> ()
      %4559 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4559 : i64
    }
    func.call @stack_push_pointer(%4126) : (i64) -> ()
    %4560 = func.call @stack_pop_pointer() : () -> i64
    %4561 = func.call @cc_multiple_value_list(%4560) : (i64) -> i64
    %4562 = llvm.mlir.addressof @str281 : !llvm.ptr
    %4563 = arith.constant 38 : i64
    %4564 = func.call @cc_make_string(%4562, %4563) : (!llvm.ptr, i64) -> i64
    %4565 = func.call @cc_nil_value() : () -> i64
    %4566 = func.call @cc_intern(%4564, %4565) : (i64, i64) -> i64
    %4567 = func.call @cc_nil_value() : () -> i64
    %4568 = func.call @cc_cons(%4566, %4567) : (i64, i64) -> i64
    %4569 = func.call @cc_values_pack(%4568) : (i64) -> i64
    %4570 = func.call @cc_symbol_value(%4566) : (i64) -> i64
    %4571 = llvm.mlir.addressof @str282 : !llvm.ptr
    %4572 = arith.constant 40 : i64
    %4573 = func.call @cc_make_string(%4571, %4572) : (!llvm.ptr, i64) -> i64
    %4574 = func.call @cc_nil_value() : () -> i64
    %4575 = func.call @cc_intern(%4573, %4574) : (i64, i64) -> i64
    %4576 = func.call @cc_nil_value() : () -> i64
    %4577 = func.call @cc_cons(%4575, %4576) : (i64, i64) -> i64
    %4578 = func.call @cc_values_pack(%4577) : (i64) -> i64
    %4579 = func.call @cc_symbol_value(%4575) : (i64) -> i64
    %4580 = func.call @cc_nil_value() : () -> i64
    %4581 = arith.cmpi ne, %4570, %4580 : i64
    %4582 = scf.if %4581 -> (i64) {
      scf.yield %4579 : i64
    } else {
      scf.yield %4561 : i64
    }
    %4583 = func.call @cc_values_pack(%4582) : (i64) -> i64
    func.call @stack_push_pointer(%4583) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"local_factorial_156157209477127"() {
    %4127 = llvm.mlir.addressof @str257 : !llvm.ptr
    %4128 = arith.constant 31 : i64
    %4129 = func.call @cc_make_string(%4127, %4128) : (!llvm.ptr, i64) -> i64
    %4130 = func.call @cc_nil_value() : () -> i64
    %4131 = func.call @cc_intern(%4129, %4130) : (i64, i64) -> i64
    %4132 = func.call @cc_nil_value() : () -> i64
    %4133 = func.call @cc_cons(%4131, %4132) : (i64, i64) -> i64
    %4134 = func.call @cc_values_pack(%4133) : (i64) -> i64
    %4135 = llvm.mlir.addressof @str258 : !llvm.ptr
    %4136 = arith.constant 1 : i64
    %4137 = func.call @cc_make_string(%4135, %4136) : (!llvm.ptr, i64) -> i64
    %4138 = func.call @cc_register_function_lambda_list_metadata_raw(%4131, %4137) : (i64, i64) -> i64
    %4139 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%4131, %4139) : (i64, i64) -> ()
    %4140 = func.call @stack_pop_pointer() : () -> i64
    %4141 = func.call @cc_nil_value() : () -> i64
    %4142 = llvm.mlir.addressof @str259 : !llvm.ptr
    %4143 = arith.constant 38 : i64
    %4144 = func.call @cc_make_string(%4142, %4143) : (!llvm.ptr, i64) -> i64
    %4145 = func.call @cc_nil_value() : () -> i64
    %4146 = func.call @cc_intern(%4144, %4145) : (i64, i64) -> i64
    %4147 = func.call @cc_nil_value() : () -> i64
    %4148 = func.call @cc_cons(%4146, %4147) : (i64, i64) -> i64
    %4149 = func.call @cc_values_pack(%4148) : (i64) -> i64
    %4150 = func.call @cc_set_symbol_value(%4146, %4141) : (i64, i64) -> i64
    %4151 = llvm.mlir.addressof @str260 : !llvm.ptr
    %4152 = arith.constant 39 : i64
    %4153 = func.call @cc_make_string(%4151, %4152) : (!llvm.ptr, i64) -> i64
    %4154 = func.call @cc_nil_value() : () -> i64
    %4155 = func.call @cc_intern(%4153, %4154) : (i64, i64) -> i64
    %4156 = func.call @cc_nil_value() : () -> i64
    %4157 = func.call @cc_cons(%4155, %4156) : (i64, i64) -> i64
    %4158 = func.call @cc_values_pack(%4157) : (i64) -> i64
    %4159 = func.call @cc_set_symbol_value(%4155, %4141) : (i64, i64) -> i64
    %4160 = llvm.mlir.addressof @str261 : !llvm.ptr
    %4161 = arith.constant 40 : i64
    %4162 = func.call @cc_make_string(%4160, %4161) : (!llvm.ptr, i64) -> i64
    %4163 = func.call @cc_nil_value() : () -> i64
    %4164 = func.call @cc_intern(%4162, %4163) : (i64, i64) -> i64
    %4165 = func.call @cc_nil_value() : () -> i64
    %4166 = func.call @cc_cons(%4164, %4165) : (i64, i64) -> i64
    %4167 = func.call @cc_values_pack(%4166) : (i64) -> i64
    %4168 = func.call @cc_set_symbol_value(%4164, %4141) : (i64, i64) -> i64
    func.call @stack_push_pointer(%4140) : (i64) -> ()
    %4169 = func.call @stack_pop_pointer() : () -> i64
    %4170 = arith.constant 1 : i64
    func.call @stack_push_fixnum(%4170) : (i64) -> ()
    %4171 = func.call @stack_pop_pointer() : () -> i64
    %4172 = arith.constant 1 : i1
    %4174 = arith.constant 3 : i64
    %4173 = arith.andi %4169, %4174 : i64
    %4175 = arith.constant 0 : i64
    %4176 = arith.cmpi eq, %4173, %4175 : i64
    %4178 = arith.constant 3 : i64
    %4177 = arith.andi %4171, %4178 : i64
    %4179 = arith.constant 0 : i64
    %4180 = arith.cmpi eq, %4177, %4179 : i64
    %4181 = arith.andi %4176, %4180 : i1
    %4182 = scf.if %4181 -> (i1) {
      %4183 = arith.constant 2 : i64
      %4184 = arith.shrsi %4169, %4183 : i64
      %4185 = arith.constant 2 : i64
      %4186 = arith.shrsi %4171, %4185 : i64
      %4187 = arith.cmpi sle, %4184, %4186 : i64
      scf.yield %4187 : i1
    } else {
      %4188 = func.call @cc_le(%4169, %4171) : (i64, i64) -> i64
      %4189 = func.call @cc_nil_value() : () -> i64
      %4190 = arith.cmpi ne, %4188, %4189 : i64
      scf.yield %4190 : i1
    }
    %4191 = arith.andi %4172, %4182 : i1
    %4192 = func.call @cc_nil_value() : () -> i64
    %4193 = func.call @cc_t_value() : () -> i64
    %4194 = scf.if %4191 -> (i64) {
      scf.yield %4193 : i64
    } else {
      scf.yield %4192 : i64
    }
    func.call @stack_push_pointer(%4194) : (i64) -> ()
    %4195 = func.call @stack_pop_pointer() : () -> i64
    %4196 = func.call @cc_nil_value() : () -> i64
    %4197 = arith.cmpi ne, %4195, %4196 : i64
    scf.if %4197 {
      %4198 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4198) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%4140) : (i64) -> ()
      %4199 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4140) : (i64) -> ()
      %4200 = func.call @stack_pop_pointer() : () -> i64
      %4201 = arith.constant 1 : i64
      %4202 = func.call @cc_box_fixnum(%4201) : (i64) -> i64
      %4204 = arith.constant 3 : i64
      %4203 = arith.andi %4200, %4204 : i64
      %4205 = arith.constant 0 : i64
      %4206 = arith.cmpi eq, %4203, %4205 : i64
      %4208 = arith.constant 3 : i64
      %4207 = arith.andi %4202, %4208 : i64
      %4209 = arith.constant 0 : i64
      %4210 = arith.cmpi eq, %4207, %4209 : i64
      %4211 = arith.andi %4206, %4210 : i1
      %4212 = scf.if %4211 -> (i64) {
        %4213 = arith.constant 2 : i64
        %4214 = arith.shrsi %4200, %4213 : i64
        %4215 = arith.constant 2 : i64
        %4216 = arith.shrsi %4202, %4215 : i64
        %4217 = arith.subi %4214, %4216 : i64
        %4218 = arith.constant -2305843009213693952 : i64
        %4219 = arith.constant 2305843009213693951 : i64
        %4220 = arith.cmpi sge, %4217, %4218 : i64
        %4221 = arith.cmpi sle, %4217, %4219 : i64
        %4222 = arith.andi %4220, %4221 : i1
        %4223 = scf.if %4222 -> (i64) {
          %4224 = arith.constant 2 : i64
          %4225 = arith.shli %4217, %4224 : i64
          scf.yield %4225 : i64
        } else {
          %4226 = func.call @cc_sub(%4200, %4202) : (i64, i64) -> i64
          scf.yield %4226 : i64
        }
        scf.yield %4223 : i64
      } else {
        %4227 = func.call @cc_sub(%4200, %4202) : (i64, i64) -> i64
        scf.yield %4227 : i64
      }
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4228 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4228) : (i64) -> ()
      func.call @"local_factorial_156157209477127"() : () -> ()
      %4229 = func.call @stack_pop_pointer() : () -> i64
      %4231 = arith.constant 3 : i64
      %4230 = arith.andi %4199, %4231 : i64
      %4232 = arith.constant 0 : i64
      %4233 = arith.cmpi eq, %4230, %4232 : i64
      %4235 = arith.constant 3 : i64
      %4234 = arith.andi %4229, %4235 : i64
      %4236 = arith.constant 0 : i64
      %4237 = arith.cmpi eq, %4234, %4236 : i64
      %4238 = arith.andi %4233, %4237 : i1
      %4239 = scf.if %4238 -> (i64) {
        %4240 = arith.constant 2 : i64
        %4241 = arith.shrsi %4199, %4240 : i64
        %4242 = arith.constant 2 : i64
        %4243 = arith.shrsi %4229, %4242 : i64
        %4244 = arith.constant 0 : i64
        %4245 = arith.cmpi slt, %4241, %4244 : i64
        %4246 = scf.if %4245 -> (i64) {
          %4247 = arith.subi %4244, %4241 : i64
          scf.yield %4247 : i64
        } else {
          scf.yield %4241 : i64
        }
        %4248 = arith.constant 0 : i64
        %4249 = arith.cmpi slt, %4243, %4248 : i64
        %4250 = scf.if %4249 -> (i64) {
          %4251 = arith.subi %4248, %4243 : i64
          scf.yield %4251 : i64
        } else {
          scf.yield %4243 : i64
        }
        %4252 = arith.constant 1518500249 : i64
        %4253 = arith.cmpi sle, %4246, %4252 : i64
        %4254 = arith.cmpi sle, %4250, %4252 : i64
        %4255 = arith.andi %4253, %4254 : i1
        %4256 = scf.if %4255 -> (i64) {
          %4257 = arith.muli %4241, %4243 : i64
          %4258 = arith.constant 2 : i64
          %4259 = arith.shli %4257, %4258 : i64
          scf.yield %4259 : i64
        } else {
          %4260 = func.call @cc_mul(%4199, %4229) : (i64, i64) -> i64
          scf.yield %4260 : i64
        }
        scf.yield %4256 : i64
      } else {
        %4261 = func.call @cc_mul(%4199, %4229) : (i64, i64) -> i64
        scf.yield %4261 : i64
      }
      func.call @stack_push_pointer(%4239) : (i64) -> ()
    }
    %4262 = func.call @stack_pop_pointer() : () -> i64
    %4263 = func.call @cc_multiple_value_list(%4262) : (i64) -> i64
    %4264 = llvm.mlir.addressof @str262 : !llvm.ptr
    %4265 = arith.constant 38 : i64
    %4266 = func.call @cc_make_string(%4264, %4265) : (!llvm.ptr, i64) -> i64
    %4267 = func.call @cc_nil_value() : () -> i64
    %4268 = func.call @cc_intern(%4266, %4267) : (i64, i64) -> i64
    %4269 = func.call @cc_nil_value() : () -> i64
    %4270 = func.call @cc_cons(%4268, %4269) : (i64, i64) -> i64
    %4271 = func.call @cc_values_pack(%4270) : (i64) -> i64
    %4272 = func.call @cc_symbol_value(%4268) : (i64) -> i64
    %4273 = llvm.mlir.addressof @str263 : !llvm.ptr
    %4274 = arith.constant 40 : i64
    %4275 = func.call @cc_make_string(%4273, %4274) : (!llvm.ptr, i64) -> i64
    %4276 = func.call @cc_nil_value() : () -> i64
    %4277 = func.call @cc_intern(%4275, %4276) : (i64, i64) -> i64
    %4278 = func.call @cc_nil_value() : () -> i64
    %4279 = func.call @cc_cons(%4277, %4278) : (i64, i64) -> i64
    %4280 = func.call @cc_values_pack(%4279) : (i64) -> i64
    %4281 = func.call @cc_symbol_value(%4277) : (i64) -> i64
    %4282 = func.call @cc_nil_value() : () -> i64
    %4283 = arith.cmpi ne, %4272, %4282 : i64
    %4284 = scf.if %4283 -> (i64) {
      scf.yield %4281 : i64
    } else {
      scf.yield %4263 : i64
    }
    %4285 = func.call @cc_values_pack(%4284) : (i64) -> i64
    func.call @stack_push_pointer(%4285) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_156157209477120*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_156157209477120*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CL-USER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str5("integer-length direct:~%\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str6("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str7("fixnum bounds: mpf=~a 1+=~a type=~a mnf=~a 1-=~a type=~a~%\00") : !llvm.array<59 x i8>
  llvm.mlir.global private constant @str8("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETFLAG_156157209477121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETVALUE_156157209477121*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETMVLIST_156157209477121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETFLAG_156157209477121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str26("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str27("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_156157209477121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETVALUE_156157209477121*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str30("*__MLIR_BLOCK_RETMVLIST_156157209477121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str31("ASH\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str32(" len=~a i=~a integer-length=~a expected=~a ok=~a~%\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str33("INTEGER-LENGTH\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str34("INTEGER-LENGTH\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str35("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETFLAG_156157209477121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETVALUE_156157209477121*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETMVLIST_156157209477121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str39("integer-length negative:~%\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str40("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str41("*__MLIR_BLOCK_RETFLAG_156157209477122*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str42("*__MLIR_BLOCK_RETVALUE_156157209477122*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETMVLIST_156157209477122*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETFLAG_156157209477122*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str46("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str47("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETFLAG_156157209477122*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETVALUE_156157209477122*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETMVLIST_156157209477122*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str51("ASH\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str52(" len=~a i=~a integer-length=~a expected=~a ok=~a~%\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str53("INTEGER-LENGTH\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str54("INTEGER-LENGTH\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str55("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str56("*__MLIR_BLOCK_RETFLAG_156157209477122*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str57("*__MLIR_BLOCK_RETVALUE_156157209477122*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETMVLIST_156157209477122*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str59("round boundary: values=~s~%\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str60("2305843009213693952\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str61("ROUND\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str62("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str63("floor contagion misses=~s~%\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str64("FLOOR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("CEILING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("TRUNCATE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("ROUND\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str71("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("FFLOOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("FCEILING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("FTRUNCATE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("FROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETFLAG_156157209477123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str81("*__MLIR_BLOCK_RETVALUE_156157209477123*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str82("*__MLIR_BLOCK_RETMVLIST_156157209477123*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str83("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str84("*__MLIR_BLOCK_RETFLAG_156157209477123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str85("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str86("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str87("*__MLIR_BLOCK_RETFLAG_156157209477123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str88("*__MLIR_BLOCK_RETVALUE_156157209477123*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str89("*__MLIR_BLOCK_RETMVLIST_156157209477123*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str90("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str91("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str92("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str93("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str94("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str97("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("*__MLIR_BLOCK_RETFLAG_156157209477124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str109("*__MLIR_BLOCK_RETVALUE_156157209477124*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str110("*__MLIR_BLOCK_RETMVLIST_156157209477124*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str111("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str112("*__MLIR_BLOCK_RETFLAG_156157209477123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str113("*__MLIR_BLOCK_RETFLAG_156157209477124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str114("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str115("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str116("*__MLIR_BLOCK_RETFLAG_156157209477124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str117("*__MLIR_BLOCK_RETVALUE_156157209477124*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str118("*__MLIR_BLOCK_RETMVLIST_156157209477124*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str119("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str120("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str121("*__MLIR_BLOCK_RETFLAG_156157209477124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str122("*__MLIR_BLOCK_RETVALUE_156157209477124*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str123("*__MLIR_BLOCK_RETMVLIST_156157209477124*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str124("*__MLIR_BLOCK_RETFLAG_156157209477124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str125("*__MLIR_BLOCK_RETVALUE_156157209477124*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str126("*__MLIR_BLOCK_RETMVLIST_156157209477124*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str127("*__MLIR_BLOCK_RETFLAG_156157209477123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str128("*__MLIR_BLOCK_RETVALUE_156157209477123*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str129("*__MLIR_BLOCK_RETMVLIST_156157209477123*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str130("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str131("ffloor quotient misses=~s~%\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str132("FFLOOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("FCEILING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("FTRUNCATE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("FROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("*__MLIR_BLOCK_RETFLAG_156157209477125*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str141("*__MLIR_BLOCK_RETVALUE_156157209477125*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str142("*__MLIR_BLOCK_RETMVLIST_156157209477125*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str143("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str144("*__MLIR_BLOCK_RETFLAG_156157209477125*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str145("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str146("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str147("*__MLIR_BLOCK_RETFLAG_156157209477125*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str148("*__MLIR_BLOCK_RETVALUE_156157209477125*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str149("*__MLIR_BLOCK_RETMVLIST_156157209477125*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str150("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str151("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str152("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str153("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str154("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str155("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str156("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str157("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str158("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str159("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str160("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str161("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str162("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str163("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str165("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str167("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str174("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str175("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str176("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("*__MLIR_BLOCK_RETFLAG_156157209477126*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETVALUE_156157209477126*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str180("*__MLIR_BLOCK_RETMVLIST_156157209477126*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str181("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str182("*__MLIR_BLOCK_RETFLAG_156157209477125*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str183("*__MLIR_BLOCK_RETFLAG_156157209477126*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str184("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str185("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str186("*__MLIR_BLOCK_RETFLAG_156157209477126*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str187("*__MLIR_BLOCK_RETVALUE_156157209477126*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str188("*__MLIR_BLOCK_RETMVLIST_156157209477126*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str189("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str190("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str191("*__MLIR_BLOCK_RETFLAG_156157209477126*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str192("*__MLIR_BLOCK_RETVALUE_156157209477126*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str193("*__MLIR_BLOCK_RETMVLIST_156157209477126*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str194("*__MLIR_BLOCK_RETFLAG_156157209477126*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str195("*__MLIR_BLOCK_RETVALUE_156157209477126*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str196("*__MLIR_BLOCK_RETMVLIST_156157209477126*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str197("*__MLIR_BLOCK_RETFLAG_156157209477125*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str198("*__MLIR_BLOCK_RETVALUE_156157209477125*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str199("*__MLIR_BLOCK_RETMVLIST_156157209477125*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str200("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str201("log boundary:~%\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str202("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str203(" logand one=~a ok=~a~%\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str204("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str205("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str207("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str210("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str211("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str213(" logand two=~a expected=~a ok=~a~%\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str214("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str219("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str220("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str222("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str223("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str224("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str225("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str226("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str229(" logand neg=~a expected=~a ok=~a~%\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str230("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str233("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str234("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str235("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str238("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str240("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str242("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str245(" logandc2=~a ok=~a~%\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str246("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str247("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("LOGANDC2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str249("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str250("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str251("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str252("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str253("LOGANDC2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str254("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str255("log factorial samples:~%\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str256("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str257("LOCAL_FACTORIAL_156157209477127\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str258("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str259("*__MLIR_BLOCK_RETFLAG_156157209477128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str260("*__MLIR_BLOCK_RETVALUE_156157209477128*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str261("*__MLIR_BLOCK_RETMVLIST_156157209477128*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str262("*__MLIR_BLOCK_RETFLAG_156157209477128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str263("*__MLIR_BLOCK_RETMVLIST_156157209477128*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str264("*__MLIR_BLOCK_RETFLAG_156157209477129*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str265("*__MLIR_BLOCK_RETVALUE_156157209477129*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str266("*__MLIR_BLOCK_RETMVLIST_156157209477129*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str267("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str268("*__MLIR_BLOCK_RETFLAG_156157209477129*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str269("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str270("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str271("*__MLIR_BLOCK_RETFLAG_156157209477129*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str272("*__MLIR_BLOCK_RETVALUE_156157209477129*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str273("*__MLIR_BLOCK_RETMVLIST_156157209477129*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str274("LOG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str275(" x=~a result=~a type=~a floatp=~a nan=~a~%\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str276("ext:float-nan-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str277("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str278("*__MLIR_BLOCK_RETFLAG_156157209477129*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str279("*__MLIR_BLOCK_RETVALUE_156157209477129*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str280("*__MLIR_BLOCK_RETMVLIST_156157209477129*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str281("*__MLIR_BLOCK_RETFLAG_156157209477120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str282("*__MLIR_BLOCK_RETMVLIST_156157209477120*\00") : !llvm.array<41 x i8>
}
