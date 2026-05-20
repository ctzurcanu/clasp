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
    %11 = arith.constant 37 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = func.call @cc_intern(%12, %13) : (i64, i64) -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = func.call @cc_cons(%14, %15) : (i64, i64) -> i64
    %17 = func.call @cc_values_pack(%16) : (i64) -> i64
    %18 = func.call @cc_set_symbol_value(%14, %9) : (i64, i64) -> i64
    %19 = llvm.mlir.addressof @str2 : !llvm.ptr
    %20 = arith.constant 38 : i64
    %21 = func.call @cc_make_string(%19, %20) : (!llvm.ptr, i64) -> i64
    %22 = func.call @cc_nil_value() : () -> i64
    %23 = func.call @cc_intern(%21, %22) : (i64, i64) -> i64
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_cons(%23, %24) : (i64, i64) -> i64
    %26 = func.call @cc_values_pack(%25) : (i64) -> i64
    %27 = func.call @cc_set_symbol_value(%23, %9) : (i64, i64) -> i64
    %28 = llvm.mlir.addressof @str3 : !llvm.ptr
    %29 = arith.constant 39 : i64
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
      %45 = llvm.mlir.addressof @str5 : !llvm.ptr
      %46 = arith.constant 7 : i64
      %47 = func.call @cc_make_string(%45, %46) : (!llvm.ptr, i64) -> i64
      %48 = func.call @cc_intern(%44, %47) : (i64, i64) -> i64
      %49 = func.call @cc_nil_value() : () -> i64
      %50 = func.call @cc_cons(%48, %49) : (i64, i64) -> i64
      %51 = func.call @cc_values_pack(%50) : (i64) -> i64
      func.call @stack_push_pointer(%48) : (i64) -> ()
      %52 = func.call @stack_pop_pointer() : () -> i64
      %53 = func.call @cc_in_package(%52) : (i64) -> i64
      func.call @stack_push_pointer(%53) : (i64) -> ()
      %54 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %54 : i64
    }
    %55 = func.call @cc_nil_value() : () -> i64
    %56 = func.call @cc_errorp(%41) : (i64) -> i64
    %57 = arith.cmpi ne, %56, %55 : i64
    %58 = scf.if %57 -> (i64) {
      scf.yield %41 : i64
    } else {
      %59 = llvm.mlir.addressof @str6 : !llvm.ptr
      %60 = arith.constant 45 : i64
      %61 = func.call @cc_make_string(%59, %60) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %62 = func.call @stack_pop_pointer() : () -> i64
      %63 = func.call @cc_nil_value() : () -> i64
      %64 = func.call @cc_cons(%62, %63) : (i64, i64) -> i64
      %65 = func.call @cc_load_stack(%64) : (i64) -> i64
      func.call @stack_push_pointer(%65) : (i64) -> ()
      %66 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %66 : i64
    }
    %67 = func.call @cc_nil_value() : () -> i64
    %68 = func.call @cc_errorp(%58) : (i64) -> i64
    %69 = arith.cmpi ne, %68, %67 : i64
    %70 = scf.if %69 -> (i64) {
      scf.yield %58 : i64
    } else {
      %71 = llvm.mlir.addressof @str7 : !llvm.ptr
      %72 = arith.constant 11 : i64
      %73 = func.call @cc_make_string(%71, %72) : (!llvm.ptr, i64) -> i64
      %74 = func.call @cc_nil_value() : () -> i64
      %75 = func.call @cc_intern(%73, %74) : (i64, i64) -> i64
      %76 = func.call @cc_nil_value() : () -> i64
      %77 = func.call @cc_cons(%75, %76) : (i64, i64) -> i64
      %78 = func.call @cc_values_pack(%77) : (i64) -> i64
      func.call @stack_push_pointer(%75) : (i64) -> ()
      %79 = func.call @stack_pop_pointer() : () -> i64
      %80 = func.call @cc_in_package(%79) : (i64) -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %81 : i64
    }
    %82 = func.call @cc_nil_value() : () -> i64
    %83 = func.call @cc_errorp(%70) : (i64) -> i64
    %84 = arith.cmpi ne, %83, %82 : i64
    %85 = scf.if %84 -> (i64) {
      scf.yield %70 : i64
    } else {
      %86 = func.call @cc_nil_value() : () -> i64
      %87 = arith.cmpi ne, %86, %86 : i64
      scf.if %87 {
        func.call @stack_push_pointer(%86) : (i64) -> ()
      } else {
        %88 = llvm.mlir.addressof @str8 : !llvm.ptr
        %89 = func.call @cc_make_function_ref_const(%88) : (!llvm.ptr) -> i64
        %90 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%89, %90) : (i64, i64) -> ()
      }
      %91 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %91 : i64
    }
    %92 = func.call @cc_nil_value() : () -> i64
    %93 = func.call @cc_errorp(%85) : (i64) -> i64
    %94 = arith.cmpi ne, %93, %92 : i64
    %95 = scf.if %94 -> (i64) {
      scf.yield %85 : i64
    } else {
      %96 = llvm.mlir.addressof @str9 : !llvm.ptr
      %97 = arith.constant 15 : i64
      %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_intern(%98, %99) : (i64, i64) -> i64
      %101 = func.call @cc_nil_value() : () -> i64
      %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
      %103 = func.call @cc_values_pack(%102) : (i64) -> i64
      func.call @stack_push_pointer(%100) : (i64) -> ()
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = llvm.mlir.addressof @str10 : !llvm.ptr
      %106 = arith.constant 13 : i64
      %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
      %108 = llvm.mlir.addressof @str11 : !llvm.ptr
      %109 = arith.constant 11 : i64
      %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
      %111 = func.call @cc_intern(%107, %110) : (i64, i64) -> i64
      %112 = func.call @cc_nil_value() : () -> i64
      %113 = func.call @cc_cons(%111, %112) : (i64, i64) -> i64
      %114 = func.call @cc_values_pack(%113) : (i64) -> i64
      func.call @stack_push_pointer(%111) : (i64) -> ()
      %115 = llvm.mlir.addressof @str12 : !llvm.ptr
      %116 = arith.constant 6 : i64
      %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
      %118 = func.call @cc_nil_value() : () -> i64
      %119 = func.call @cc_intern(%117, %118) : (i64, i64) -> i64
      %120 = func.call @cc_nil_value() : () -> i64
      %121 = func.call @cc_cons(%119, %120) : (i64, i64) -> i64
      %122 = func.call @cc_values_pack(%121) : (i64) -> i64
      func.call @stack_push_pointer(%119) : (i64) -> ()
      %123 = llvm.mlir.addressof @str13 : !llvm.ptr
      %124 = arith.constant 19 : i64
      %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
      %126 = func.call @cc_nil_value() : () -> i64
      %127 = func.call @cc_intern(%125, %126) : (i64, i64) -> i64
      %128 = func.call @cc_nil_value() : () -> i64
      %129 = func.call @cc_cons(%127, %128) : (i64, i64) -> i64
      %130 = func.call @cc_values_pack(%129) : (i64) -> i64
      func.call @stack_push_pointer(%127) : (i64) -> ()
      %131 = llvm.mlir.addressof @str14 : !llvm.ptr
      %132 = arith.constant 12 : i64
      %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
      %134 = llvm.mlir.addressof @str15 : !llvm.ptr
      %135 = arith.constant 11 : i64
      %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
      %137 = func.call @cc_intern(%133, %136) : (i64, i64) -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
      %140 = func.call @cc_values_pack(%139) : (i64) -> i64
      func.call @stack_push_pointer(%137) : (i64) -> ()
      %141 = llvm.mlir.addressof @str16 : !llvm.ptr
      %142 = arith.constant 49 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%143) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @cc_cons(%145, %144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%146) : (i64) -> ()
      %147 = func.call @stack_pop_pointer() : () -> i64
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @cc_cons(%148, %147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %150 = func.call @stack_pop_pointer() : () -> i64
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @cc_cons(%151, %150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%152) : (i64) -> ()
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = func.call @cc_cons(%154, %153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %156 = func.call @stack_pop_pointer() : () -> i64
      %157 = func.call @stack_pop_pointer() : () -> i64
      %158 = func.call @cc_cons(%157, %156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%158) : (i64) -> ()
      %159 = func.call @stack_pop_pointer() : () -> i64
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @cc_cons(%160, %159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%161) : (i64) -> ()
      %162 = func.call @stack_pop_pointer() : () -> i64
      %163 = func.call @stack_pop_pointer() : () -> i64
      %164 = func.call @cc_cons(%163, %162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @cc_cons(%166, %165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%167) : (i64) -> ()
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = func.call @cc_cons(%169, %168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%170) : (i64) -> ()
      %171 = func.call @stack_pop_pointer() : () -> i64
      %239 = arith.constant 46573484507137 : i64
      %240 = arith.constant 0 : i64
      %241 = func.call @cc_make_closure(%239, %240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%241) : (i64) -> ()
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = llvm.mlir.addressof @str19 : !llvm.ptr
      %244 = arith.constant 4 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = func.call @cc_nil_value() : () -> i64
      %247 = func.call @cc_intern(%245, %246) : (i64, i64) -> i64
      %248 = func.call @cc_nil_value() : () -> i64
      %249 = func.call @cc_cons(%247, %248) : (i64, i64) -> i64
      %250 = func.call @cc_values_pack(%249) : (i64) -> i64
      func.call @stack_push_pointer(%247) : (i64) -> ()
      %251 = llvm.mlir.addressof @str20 : !llvm.ptr
      %252 = arith.constant 10 : i64
      %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
      %254 = llvm.mlir.addressof @str21 : !llvm.ptr
      %255 = arith.constant 11 : i64
      %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
      %257 = func.call @cc_intern(%253, %256) : (i64, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_values_pack(%259) : (i64) -> i64
      func.call @stack_push_pointer(%257) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %261 = func.call @stack_pop_pointer() : () -> i64
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @cc_cons(%262, %261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %264 = func.call @stack_pop_pointer() : () -> i64
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @cc_cons(%265, %264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      %267 = func.call @stack_pop_pointer() : () -> i64
      %268 = llvm.mlir.addressof @str22 : !llvm.ptr
      %269 = arith.constant 11 : i64
      %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
      %271 = llvm.mlir.addressof @str23 : !llvm.ptr
      %272 = arith.constant 7 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      %274 = func.call @cc_intern(%270, %273) : (i64, i64) -> i64
      %275 = func.call @cc_nil_value() : () -> i64
      %276 = func.call @cc_cons(%274, %275) : (i64, i64) -> i64
      %277 = func.call @cc_values_pack(%276) : (i64) -> i64
      func.call @stack_push_pointer(%274) : (i64) -> ()
      %278 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %279 = func.call @stack_pop_pointer() : () -> i64
      %280 = llvm.mlir.addressof @str24 : !llvm.ptr
      %281 = arith.constant 4 : i64
      %282 = func.call @cc_make_string(%280, %281) : (!llvm.ptr, i64) -> i64
      %283 = llvm.mlir.addressof @str25 : !llvm.ptr
      %284 = arith.constant 7 : i64
      %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
      %286 = func.call @cc_intern(%282, %285) : (i64, i64) -> i64
      %287 = func.call @cc_nil_value() : () -> i64
      %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
      %289 = func.call @cc_values_pack(%288) : (i64) -> i64
      func.call @stack_push_pointer(%286) : (i64) -> ()
      %290 = func.call @stack_pop_pointer() : () -> i64
      %291 = llvm.mlir.addressof @str26 : !llvm.ptr
      %292 = arith.constant 5 : i64
      %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_intern(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_nil_value() : () -> i64
      %297 = func.call @cc_cons(%295, %296) : (i64, i64) -> i64
      %298 = func.call @cc_values_pack(%297) : (i64) -> i64
      func.call @stack_push_pointer(%295) : (i64) -> ()
      %299 = func.call @stack_pop_pointer() : () -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_errorp(%104) : (i64) -> i64
      %302 = arith.cmpi ne, %301, %300 : i64
      %303 = arith.cmpi eq, %300, %300 : i64
      %304 = arith.andi %302, %303 : i1
      %305 = scf.if %304 -> (i64) {
        scf.yield %104 : i64
      } else {
        scf.yield %300 : i64
      }
      %306 = func.call @cc_errorp(%171) : (i64) -> i64
      %307 = arith.cmpi ne, %306, %300 : i64
      %308 = arith.cmpi eq, %305, %300 : i64
      %309 = arith.andi %307, %308 : i1
      %310 = scf.if %309 -> (i64) {
        scf.yield %171 : i64
      } else {
        scf.yield %305 : i64
      }
      %311 = func.call @cc_errorp(%242) : (i64) -> i64
      %312 = arith.cmpi ne, %311, %300 : i64
      %313 = arith.cmpi eq, %310, %300 : i64
      %314 = arith.andi %312, %313 : i1
      %315 = scf.if %314 -> (i64) {
        scf.yield %242 : i64
      } else {
        scf.yield %310 : i64
      }
      %316 = func.call @cc_errorp(%267) : (i64) -> i64
      %317 = arith.cmpi ne, %316, %300 : i64
      %318 = arith.cmpi eq, %315, %300 : i64
      %319 = arith.andi %317, %318 : i1
      %320 = scf.if %319 -> (i64) {
        scf.yield %267 : i64
      } else {
        scf.yield %315 : i64
      }
      %321 = func.call @cc_errorp(%278) : (i64) -> i64
      %322 = arith.cmpi ne, %321, %300 : i64
      %323 = arith.cmpi eq, %320, %300 : i64
      %324 = arith.andi %322, %323 : i1
      %325 = scf.if %324 -> (i64) {
        scf.yield %278 : i64
      } else {
        scf.yield %320 : i64
      }
      %326 = func.call @cc_errorp(%279) : (i64) -> i64
      %327 = arith.cmpi ne, %326, %300 : i64
      %328 = arith.cmpi eq, %325, %300 : i64
      %329 = arith.andi %327, %328 : i1
      %330 = scf.if %329 -> (i64) {
        scf.yield %279 : i64
      } else {
        scf.yield %325 : i64
      }
      %331 = func.call @cc_errorp(%290) : (i64) -> i64
      %332 = arith.cmpi ne, %331, %300 : i64
      %333 = arith.cmpi eq, %330, %300 : i64
      %334 = arith.andi %332, %333 : i1
      %335 = scf.if %334 -> (i64) {
        scf.yield %290 : i64
      } else {
        scf.yield %330 : i64
      }
      %336 = func.call @cc_errorp(%299) : (i64) -> i64
      %337 = arith.cmpi ne, %336, %300 : i64
      %338 = arith.cmpi eq, %335, %300 : i64
      %339 = arith.andi %337, %338 : i1
      %340 = scf.if %339 -> (i64) {
        scf.yield %299 : i64
      } else {
        scf.yield %335 : i64
      }
      %341 = arith.cmpi ne, %340, %300 : i64
      scf.if %341 {
        func.call @stack_push_pointer(%340) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%104) : (i64) -> ()
        func.call @stack_push_pointer(%171) : (i64) -> ()
        func.call @stack_push_pointer(%242) : (i64) -> ()
        func.call @stack_push_pointer(%267) : (i64) -> ()
        func.call @stack_push_pointer(%278) : (i64) -> ()
        func.call @stack_push_pointer(%279) : (i64) -> ()
        func.call @stack_push_pointer(%290) : (i64) -> ()
        func.call @stack_push_pointer(%299) : (i64) -> ()
        %342 = llvm.mlir.addressof @str27 : !llvm.ptr
        %343 = func.call @cc_make_function_ref_const(%342) : (!llvm.ptr) -> i64
        %344 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%343, %344) : (i64, i64) -> ()
      }
      %345 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %345 : i64
    }
    %346 = func.call @cc_nil_value() : () -> i64
    %347 = func.call @cc_errorp(%95) : (i64) -> i64
    %348 = arith.cmpi ne, %347, %346 : i64
    %349 = scf.if %348 -> (i64) {
      scf.yield %95 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %350 = llvm.mlir.addressof @str28 : !llvm.ptr
      %351 = arith.constant 3 : i64
      %352 = func.call @cc_make_string(%350, %351) : (!llvm.ptr, i64) -> i64
      %353 = func.call @cc_nil_value() : () -> i64
      %354 = func.call @cc_intern(%352, %353) : (i64, i64) -> i64
      %355 = func.call @cc_nil_value() : () -> i64
      %356 = func.call @cc_cons(%354, %355) : (i64, i64) -> i64
      %357 = func.call @cc_values_pack(%356) : (i64) -> i64
      %358 = func.call @stack_pop_pointer() : () -> i64
      %359 = func.call @cc_cons(%354, %358) : (i64, i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      %360 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %361 = func.call @stack_pop_pointer() : () -> i64
      %362 = llvm.mlir.addressof @str29 : !llvm.ptr
      %363 = arith.constant 14 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = func.call @cc_nil_value() : () -> i64
      %366 = func.call @cc_intern(%364, %365) : (i64, i64) -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_cons(%366, %367) : (i64, i64) -> i64
      %369 = func.call @cc_values_pack(%368) : (i64) -> i64
      %370 = func.call @cc_defclass(%366, %360, %361) : (i64, i64, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%371) : (i64) -> ()
      %372 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%372) : (i64) -> ()
      %373 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = llvm.mlir.addressof @str30 : !llvm.ptr
      %375 = arith.constant 14 : i64
      %376 = func.call @cc_make_string(%374, %375) : (!llvm.ptr, i64) -> i64
      %377 = func.call @cc_nil_value() : () -> i64
      %378 = func.call @cc_intern(%376, %377) : (i64, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_cons(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_values_pack(%380) : (i64) -> i64
      func.call @stack_push_pointer(%378) : (i64) -> ()
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @stack_pop_pointer() : () -> i64
      %384 = func.call @cc_cons(%382, %383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%384) : (i64) -> ()
      %385 = llvm.mlir.addressof @str31 : !llvm.ptr
      %386 = arith.constant 8 : i64
      %387 = func.call @cc_make_string(%385, %386) : (!llvm.ptr, i64) -> i64
      %388 = llvm.mlir.addressof @str32 : !llvm.ptr
      %389 = arith.constant 7 : i64
      %390 = func.call @cc_make_string(%388, %389) : (!llvm.ptr, i64) -> i64
      %391 = func.call @cc_intern(%387, %390) : (i64, i64) -> i64
      %392 = func.call @cc_nil_value() : () -> i64
      %393 = func.call @cc_cons(%391, %392) : (i64, i64) -> i64
      %394 = func.call @cc_values_pack(%393) : (i64) -> i64
      func.call @stack_push_pointer(%391) : (i64) -> ()
      %395 = func.call @stack_pop_pointer() : () -> i64
      %396 = func.call @stack_pop_pointer() : () -> i64
      %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%397) : (i64) -> ()
      %398 = llvm.mlir.addressof @str33 : !llvm.ptr
      %399 = arith.constant 3 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_intern(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      func.call @stack_push_pointer(%402) : (i64) -> ()
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = func.call @stack_pop_pointer() : () -> i64
      %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%408) : (i64) -> ()
      %409 = func.call @stack_pop_pointer() : () -> i64
      %410 = func.call @stack_pop_pointer() : () -> i64
      %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
      func.call @stack_push_pointer(%411) : (i64) -> ()
      %412 = func.call @stack_pop_pointer() : () -> i64
      %413 = func.call @stack_pop_pointer() : () -> i64
      %414 = func.call @cc_cons(%412, %413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %415 = func.call @stack_pop_pointer() : () -> i64
      %416 = func.call @stack_pop_pointer() : () -> i64
      %417 = func.call @cc_cons(%415, %416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%417) : (i64) -> ()
      %418 = llvm.mlir.addressof @str34 : !llvm.ptr
      %419 = arith.constant 14 : i64
      %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
      %421 = func.call @cc_nil_value() : () -> i64
      %422 = func.call @cc_intern(%420, %421) : (i64, i64) -> i64
      %423 = func.call @cc_nil_value() : () -> i64
      %424 = func.call @cc_cons(%422, %423) : (i64, i64) -> i64
      %425 = func.call @cc_values_pack(%424) : (i64) -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%426, %427) : (i64, i64) -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      %429 = llvm.mlir.addressof @str35 : !llvm.ptr
      %430 = arith.constant 8 : i64
      %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = func.call @cc_intern(%431, %432) : (i64, i64) -> i64
      %434 = func.call @cc_nil_value() : () -> i64
      %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
      %436 = func.call @cc_values_pack(%435) : (i64) -> i64
      func.call @stack_push_pointer(%433) : (i64) -> ()
      %437 = func.call @stack_pop_pointer() : () -> i64
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @cc_cons(%437, %438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %440 = func.call @stack_pop_pointer() : () -> i64
      %441 = func.call @cc_nil_value() : () -> i64
      %442 = func.call @cc_cons(%440, %441) : (i64, i64) -> i64
      %443 = func.call @cc_eval(%442) : (i64) -> i64
      %444 = func.call @cc_multiple_value_list(%443) : (i64) -> i64
      %445 = func.call @cc_values_pack(%444) : (i64) -> i64
      func.call @stack_push_pointer(%445) : (i64) -> ()
      %446 = func.call @stack_depth() : () -> i64
      %447 = arith.constant 0 : i64
      %448 = arith.cmpi sgt, %446, %447 : i64
      scf.if %448 {
        %449 = func.call @stack_pop_pointer() : () -> i64
      }
      %541 = llvm.mlir.addressof @str45 : !llvm.ptr
      %542 = arith.constant 6 : i64
      %543 = func.call @cc_make_string(%541, %542) : (!llvm.ptr, i64) -> i64
      %544 = llvm.mlir.addressof @str46 : !llvm.ptr
      %545 = arith.constant 14 : i64
      %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_intern(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_values_pack(%550) : (i64) -> i64
      %552 = func.call @cc_register_function_lambda_list_metadata_raw(%548, %543) : (i64, i64) -> i64
      %553 = llvm.mlir.addressof @str47 : !llvm.ptr
      %554 = func.call @cc_make_function_ref_const(%553) : (!llvm.ptr) -> i64
      %555 = llvm.mlir.addressof @str48 : !llvm.ptr
      %556 = arith.constant 14 : i64
      %557 = func.call @cc_make_string(%555, %556) : (!llvm.ptr, i64) -> i64
      %558 = func.call @cc_nil_value() : () -> i64
      %559 = func.call @cc_intern(%557, %558) : (i64, i64) -> i64
      %560 = func.call @cc_nil_value() : () -> i64
      %561 = func.call @cc_cons(%559, %560) : (i64, i64) -> i64
      %562 = func.call @cc_values_pack(%561) : (i64) -> i64
      %563 = func.call @cc_set_symbol_value(%559, %554) : (i64, i64) -> i64
      %564 = llvm.mlir.addressof @str49 : !llvm.ptr
      %565 = arith.constant 14 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      %567 = func.call @cc_nil_value() : () -> i64
      %568 = func.call @cc_intern(%566, %567) : (i64, i64) -> i64
      %569 = func.call @cc_nil_value() : () -> i64
      %570 = func.call @cc_cons(%568, %569) : (i64, i64) -> i64
      %571 = func.call @cc_values_pack(%570) : (i64) -> i64
      func.call @stack_push_pointer(%568) : (i64) -> ()
      %572 = func.call @stack_depth() : () -> i64
      %573 = arith.constant 0 : i64
      %574 = arith.cmpi sgt, %572, %573 : i64
      scf.if %574 {
        %575 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%366) : (i64) -> ()
      %576 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %576 : i64
    }
    %577 = func.call @cc_nil_value() : () -> i64
    %578 = func.call @cc_errorp(%349) : (i64) -> i64
    %579 = arith.cmpi ne, %578, %577 : i64
    %580 = scf.if %579 -> (i64) {
      scf.yield %349 : i64
    } else {
      %581 = llvm.mlir.addressof @str50 : !llvm.ptr
      %582 = arith.constant 12 : i64
      %583 = func.call @cc_make_string(%581, %582) : (!llvm.ptr, i64) -> i64
      %584 = func.call @cc_nil_value() : () -> i64
      %585 = func.call @cc_intern(%583, %584) : (i64, i64) -> i64
      %586 = func.call @cc_nil_value() : () -> i64
      %587 = func.call @cc_cons(%585, %586) : (i64, i64) -> i64
      %588 = func.call @cc_values_pack(%587) : (i64) -> i64
      func.call @stack_push_pointer(%585) : (i64) -> ()
      %589 = func.call @stack_pop_pointer() : () -> i64
      %590 = llvm.mlir.addressof @str51 : !llvm.ptr
      %591 = arith.constant 13 : i64
      %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
      %593 = llvm.mlir.addressof @str52 : !llvm.ptr
      %594 = arith.constant 11 : i64
      %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
      %596 = func.call @cc_intern(%592, %595) : (i64, i64) -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_cons(%596, %597) : (i64, i64) -> i64
      %599 = func.call @cc_values_pack(%598) : (i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      %600 = llvm.mlir.addressof @str53 : !llvm.ptr
      %601 = arith.constant 6 : i64
      %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
      %603 = func.call @cc_nil_value() : () -> i64
      %604 = func.call @cc_intern(%602, %603) : (i64, i64) -> i64
      %605 = func.call @cc_nil_value() : () -> i64
      %606 = func.call @cc_cons(%604, %605) : (i64, i64) -> i64
      %607 = func.call @cc_values_pack(%606) : (i64) -> i64
      func.call @stack_push_pointer(%604) : (i64) -> ()
      %608 = llvm.mlir.addressof @str54 : !llvm.ptr
      %609 = arith.constant 19 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = func.call @cc_nil_value() : () -> i64
      %612 = func.call @cc_intern(%610, %611) : (i64, i64) -> i64
      %613 = func.call @cc_nil_value() : () -> i64
      %614 = func.call @cc_cons(%612, %613) : (i64, i64) -> i64
      %615 = func.call @cc_values_pack(%614) : (i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %616 = llvm.mlir.addressof @str55 : !llvm.ptr
      %617 = arith.constant 14 : i64
      %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
      %619 = func.call @cc_nil_value() : () -> i64
      %620 = func.call @cc_intern(%618, %619) : (i64, i64) -> i64
      %621 = func.call @cc_nil_value() : () -> i64
      %622 = func.call @cc_cons(%620, %621) : (i64, i64) -> i64
      %623 = func.call @cc_values_pack(%622) : (i64) -> i64
      func.call @stack_push_pointer(%620) : (i64) -> ()
      %624 = llvm.mlir.addressof @str56 : !llvm.ptr
      %625 = arith.constant 13 : i64
      %626 = func.call @cc_make_string(%624, %625) : (!llvm.ptr, i64) -> i64
      %627 = llvm.mlir.addressof @str57 : !llvm.ptr
      %628 = arith.constant 11 : i64
      %629 = func.call @cc_make_string(%627, %628) : (!llvm.ptr, i64) -> i64
      %630 = func.call @cc_intern(%626, %629) : (i64, i64) -> i64
      %631 = func.call @cc_nil_value() : () -> i64
      %632 = func.call @cc_cons(%630, %631) : (i64, i64) -> i64
      %633 = func.call @cc_values_pack(%632) : (i64) -> i64
      func.call @stack_push_pointer(%630) : (i64) -> ()
      %634 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%634) : (i64) -> ()
      %635 = llvm.mlir.addressof @str58 : !llvm.ptr
      %636 = arith.constant 14 : i64
      %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
      %638 = func.call @cc_nil_value() : () -> i64
      %639 = func.call @cc_intern(%637, %638) : (i64, i64) -> i64
      %640 = func.call @cc_nil_value() : () -> i64
      %641 = func.call @cc_cons(%639, %640) : (i64, i64) -> i64
      %642 = func.call @cc_values_pack(%641) : (i64) -> i64
      func.call @stack_push_pointer(%639) : (i64) -> ()
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @stack_pop_pointer() : () -> i64
      %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
      %646 = llvm.mlir.addressof @str59 : !llvm.ptr
      %647 = arith.constant 5 : i64
      %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
      %649 = func.call @cc_nil_value() : () -> i64
      %650 = func.call @cc_intern(%648, %649) : (i64, i64) -> i64
      %651 = func.call @cc_nil_value() : () -> i64
      %652 = func.call @cc_cons(%650, %651) : (i64, i64) -> i64
      %653 = func.call @cc_values_pack(%652) : (i64) -> i64
      %654 = func.call @cc_cons(%650, %645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%654) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %655 = func.call @stack_pop_pointer() : () -> i64
      %656 = func.call @stack_pop_pointer() : () -> i64
      %657 = func.call @cc_cons(%656, %655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%657) : (i64) -> ()
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @stack_pop_pointer() : () -> i64
      %660 = func.call @cc_cons(%659, %658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%660) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @stack_pop_pointer() : () -> i64
      %663 = func.call @cc_cons(%662, %661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%663) : (i64) -> ()
      %664 = func.call @stack_pop_pointer() : () -> i64
      %665 = func.call @stack_pop_pointer() : () -> i64
      %666 = func.call @cc_cons(%665, %664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%666) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @stack_pop_pointer() : () -> i64
      %669 = func.call @cc_cons(%668, %667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%669) : (i64) -> ()
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @stack_pop_pointer() : () -> i64
      %672 = func.call @cc_cons(%671, %670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %673 = func.call @stack_pop_pointer() : () -> i64
      %674 = func.call @stack_pop_pointer() : () -> i64
      %675 = func.call @cc_cons(%674, %673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%675) : (i64) -> ()
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @stack_pop_pointer() : () -> i64
      %678 = func.call @cc_cons(%677, %676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%678) : (i64) -> ()
      %679 = func.call @stack_pop_pointer() : () -> i64
      %680 = func.call @stack_pop_pointer() : () -> i64
      %681 = func.call @cc_cons(%680, %679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%681) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @cc_cons(%683, %682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%684) : (i64) -> ()
      %685 = func.call @stack_pop_pointer() : () -> i64
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @cc_cons(%686, %685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%687) : (i64) -> ()
      %688 = func.call @stack_pop_pointer() : () -> i64
      %754 = arith.constant 46573484507139 : i64
      %755 = arith.constant 0 : i64
      %756 = func.call @cc_make_closure(%754, %755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = llvm.mlir.addressof @str62 : !llvm.ptr
      %759 = arith.constant 4 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      %761 = func.call @cc_nil_value() : () -> i64
      %762 = func.call @cc_intern(%760, %761) : (i64, i64) -> i64
      %763 = func.call @cc_nil_value() : () -> i64
      %764 = func.call @cc_cons(%762, %763) : (i64, i64) -> i64
      %765 = func.call @cc_values_pack(%764) : (i64) -> i64
      func.call @stack_push_pointer(%762) : (i64) -> ()
      %766 = llvm.mlir.addressof @str63 : !llvm.ptr
      %767 = arith.constant 12 : i64
      %768 = func.call @cc_make_string(%766, %767) : (!llvm.ptr, i64) -> i64
      %769 = llvm.mlir.addressof @str64 : !llvm.ptr
      %770 = arith.constant 11 : i64
      %771 = func.call @cc_make_string(%769, %770) : (!llvm.ptr, i64) -> i64
      %772 = func.call @cc_intern(%768, %771) : (i64, i64) -> i64
      %773 = func.call @cc_nil_value() : () -> i64
      %774 = func.call @cc_cons(%772, %773) : (i64, i64) -> i64
      %775 = func.call @cc_values_pack(%774) : (i64) -> i64
      func.call @stack_push_pointer(%772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @stack_pop_pointer() : () -> i64
      %778 = func.call @cc_cons(%777, %776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%778) : (i64) -> ()
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @cc_cons(%780, %779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%781) : (i64) -> ()
      %782 = func.call @stack_pop_pointer() : () -> i64
      %783 = llvm.mlir.addressof @str65 : !llvm.ptr
      %784 = arith.constant 11 : i64
      %785 = func.call @cc_make_string(%783, %784) : (!llvm.ptr, i64) -> i64
      %786 = llvm.mlir.addressof @str66 : !llvm.ptr
      %787 = arith.constant 7 : i64
      %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
      %789 = func.call @cc_intern(%785, %788) : (i64, i64) -> i64
      %790 = func.call @cc_nil_value() : () -> i64
      %791 = func.call @cc_cons(%789, %790) : (i64, i64) -> i64
      %792 = func.call @cc_values_pack(%791) : (i64) -> i64
      func.call @stack_push_pointer(%789) : (i64) -> ()
      %793 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = llvm.mlir.addressof @str67 : !llvm.ptr
      %796 = arith.constant 4 : i64
      %797 = func.call @cc_make_string(%795, %796) : (!llvm.ptr, i64) -> i64
      %798 = llvm.mlir.addressof @str68 : !llvm.ptr
      %799 = arith.constant 7 : i64
      %800 = func.call @cc_make_string(%798, %799) : (!llvm.ptr, i64) -> i64
      %801 = func.call @cc_intern(%797, %800) : (i64, i64) -> i64
      %802 = func.call @cc_nil_value() : () -> i64
      %803 = func.call @cc_cons(%801, %802) : (i64, i64) -> i64
      %804 = func.call @cc_values_pack(%803) : (i64) -> i64
      func.call @stack_push_pointer(%801) : (i64) -> ()
      %805 = func.call @stack_pop_pointer() : () -> i64
      %806 = llvm.mlir.addressof @str69 : !llvm.ptr
      %807 = arith.constant 5 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = func.call @cc_nil_value() : () -> i64
      %810 = func.call @cc_intern(%808, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      func.call @stack_push_pointer(%810) : (i64) -> ()
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @cc_nil_value() : () -> i64
      %816 = func.call @cc_errorp(%589) : (i64) -> i64
      %817 = arith.cmpi ne, %816, %815 : i64
      %818 = arith.cmpi eq, %815, %815 : i64
      %819 = arith.andi %817, %818 : i1
      %820 = scf.if %819 -> (i64) {
        scf.yield %589 : i64
      } else {
        scf.yield %815 : i64
      }
      %821 = func.call @cc_errorp(%688) : (i64) -> i64
      %822 = arith.cmpi ne, %821, %815 : i64
      %823 = arith.cmpi eq, %820, %815 : i64
      %824 = arith.andi %822, %823 : i1
      %825 = scf.if %824 -> (i64) {
        scf.yield %688 : i64
      } else {
        scf.yield %820 : i64
      }
      %826 = func.call @cc_errorp(%757) : (i64) -> i64
      %827 = arith.cmpi ne, %826, %815 : i64
      %828 = arith.cmpi eq, %825, %815 : i64
      %829 = arith.andi %827, %828 : i1
      %830 = scf.if %829 -> (i64) {
        scf.yield %757 : i64
      } else {
        scf.yield %825 : i64
      }
      %831 = func.call @cc_errorp(%782) : (i64) -> i64
      %832 = arith.cmpi ne, %831, %815 : i64
      %833 = arith.cmpi eq, %830, %815 : i64
      %834 = arith.andi %832, %833 : i1
      %835 = scf.if %834 -> (i64) {
        scf.yield %782 : i64
      } else {
        scf.yield %830 : i64
      }
      %836 = func.call @cc_errorp(%793) : (i64) -> i64
      %837 = arith.cmpi ne, %836, %815 : i64
      %838 = arith.cmpi eq, %835, %815 : i64
      %839 = arith.andi %837, %838 : i1
      %840 = scf.if %839 -> (i64) {
        scf.yield %793 : i64
      } else {
        scf.yield %835 : i64
      }
      %841 = func.call @cc_errorp(%794) : (i64) -> i64
      %842 = arith.cmpi ne, %841, %815 : i64
      %843 = arith.cmpi eq, %840, %815 : i64
      %844 = arith.andi %842, %843 : i1
      %845 = scf.if %844 -> (i64) {
        scf.yield %794 : i64
      } else {
        scf.yield %840 : i64
      }
      %846 = func.call @cc_errorp(%805) : (i64) -> i64
      %847 = arith.cmpi ne, %846, %815 : i64
      %848 = arith.cmpi eq, %845, %815 : i64
      %849 = arith.andi %847, %848 : i1
      %850 = scf.if %849 -> (i64) {
        scf.yield %805 : i64
      } else {
        scf.yield %845 : i64
      }
      %851 = func.call @cc_errorp(%814) : (i64) -> i64
      %852 = arith.cmpi ne, %851, %815 : i64
      %853 = arith.cmpi eq, %850, %815 : i64
      %854 = arith.andi %852, %853 : i1
      %855 = scf.if %854 -> (i64) {
        scf.yield %814 : i64
      } else {
        scf.yield %850 : i64
      }
      %856 = arith.cmpi ne, %855, %815 : i64
      scf.if %856 {
        func.call @stack_push_pointer(%855) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%589) : (i64) -> ()
        func.call @stack_push_pointer(%688) : (i64) -> ()
        func.call @stack_push_pointer(%757) : (i64) -> ()
        func.call @stack_push_pointer(%782) : (i64) -> ()
        func.call @stack_push_pointer(%793) : (i64) -> ()
        func.call @stack_push_pointer(%794) : (i64) -> ()
        func.call @stack_push_pointer(%805) : (i64) -> ()
        func.call @stack_push_pointer(%814) : (i64) -> ()
        %857 = llvm.mlir.addressof @str70 : !llvm.ptr
        %858 = func.call @cc_make_function_ref_const(%857) : (!llvm.ptr) -> i64
        %859 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%858, %859) : (i64, i64) -> ()
      }
      %860 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %860 : i64
    }
    %861 = func.call @cc_nil_value() : () -> i64
    %862 = func.call @cc_errorp(%580) : (i64) -> i64
    %863 = arith.cmpi ne, %862, %861 : i64
    %864 = scf.if %863 -> (i64) {
      scf.yield %580 : i64
    } else {
      %865 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_nil_value() : () -> i64
      %868 = func.call @cc_errorp(%866) : (i64) -> i64
      %869 = arith.cmpi ne, %868, %867 : i64
      %870 = scf.if %869 -> (i64) {
        scf.yield %866 : i64
      } else {
        %871 = func.call @cc_nil_value() : () -> i64
        %872 = llvm.mlir.addressof @str71 : !llvm.ptr
        %873 = arith.constant 14 : i64
        %874 = func.call @cc_make_string(%872, %873) : (!llvm.ptr, i64) -> i64
        %875 = func.call @cc_nil_value() : () -> i64
        %876 = func.call @cc_intern(%874, %875) : (i64, i64) -> i64
        %877 = func.call @cc_nil_value() : () -> i64
        %878 = func.call @cc_cons(%876, %877) : (i64, i64) -> i64
        %879 = func.call @cc_values_pack(%878) : (i64) -> i64
        func.call @stack_push_pointer(%876) : (i64) -> ()
        %880 = func.call @stack_pop_pointer() : () -> i64
        %881 = func.call @cc_make_instance(%880, %871) : (i64, i64) -> i64
        func.call @stack_push_pointer(%881) : (i64) -> ()
        %882 = func.call @stack_pop_pointer() : () -> i64
        %883 = func.call @cc_nil_value() : () -> i64
        %884 = func.call @cc_errorp(%882) : (i64) -> i64
        %885 = arith.cmpi ne, %884, %883 : i64
        %886 = arith.cmpi eq, %883, %883 : i64
        %887 = arith.andi %885, %886 : i1
        %888 = scf.if %887 -> (i64) {
          scf.yield %882 : i64
        } else {
          scf.yield %883 : i64
        }
        %889 = arith.cmpi ne, %888, %883 : i64
        scf.if %889 {
          func.call @stack_push_pointer(%888) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%882) : (i64) -> ()
          %890 = llvm.mlir.addressof @str72 : !llvm.ptr
          %891 = func.call @cc_make_function_ref_const(%890) : (!llvm.ptr) -> i64
          %892 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%891, %892) : (i64, i64) -> ()
        }
        %893 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %893 : i64
      }
      func.call @stack_push_pointer(%870) : (i64) -> ()
      %894 = func.call @stack_pop_pointer() : () -> i64
      %895 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %896 = func.call @cc_errorp(%894) : (i64) -> i64
      %897 = func.call @cc_nil_value() : () -> i64
      %898 = arith.cmpi ne, %896, %897 : i64
      scf.if %898 {
        %899 = func.call @cc_condition_value(%894) : (i64) -> i64
        %900 = func.call @cc_values2(%897, %899) : (i64, i64) -> i64
        func.call @stack_push_pointer(%900) : (i64) -> ()
      } else {
        %901 = func.call @cc_multiple_value_list(%894) : (i64) -> i64
        %902 = func.call @cc_values_pack(%901) : (i64) -> i64
        func.call @stack_push_pointer(%902) : (i64) -> ()
      }
      %903 = func.call @stack_pop_pointer() : () -> i64
      %904 = func.call @cc_multiple_value_list(%903) : (i64) -> i64
      %905 = arith.constant 0 : i64
      %906 = func.call @cc_box_fixnum(%905) : (i64) -> i64
      %907 = func.call @cc_nth(%906, %904) : (i64, i64) -> i64
      %908 = arith.constant 1 : i64
      %909 = func.call @cc_box_fixnum(%908) : (i64) -> i64
      %910 = func.call @cc_nth(%909, %904) : (i64, i64) -> i64
      %911 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%911) : (i64) -> ()
      %912 = func.call @stack_pop_pointer() : () -> i64
      %913 = llvm.mlir.addressof @str73 : !llvm.ptr
      %914 = arith.constant 66 : i64
      %915 = func.call @cc_make_string(%913, %914) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%915) : (i64) -> ()
      %916 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%907) : (i64) -> ()
      %917 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %920 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %921 = func.call @stack_pop_pointer() : () -> i64
      %922 = func.call @cc_type_of(%921) : (i64) -> i64
      func.call @stack_push_pointer(%922) : (i64) -> ()
      %923 = func.call @stack_pop_pointer() : () -> i64
      %924 = func.call @cc_cons(%923, %919) : (i64, i64) -> i64
      %925 = func.call @cc_cons(%920, %924) : (i64, i64) -> i64
      %926 = func.call @cc_and(%925) : (i64) -> i64
      func.call @stack_push_pointer(%926) : (i64) -> ()
      %927 = func.call @stack_pop_pointer() : () -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %929 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %930 = llvm.mlir.addressof @str74 : !llvm.ptr
      %931 = arith.constant 12 : i64
      %932 = func.call @cc_make_string(%930, %931) : (!llvm.ptr, i64) -> i64
      %933 = llvm.mlir.addressof @str75 : !llvm.ptr
      %934 = arith.constant 11 : i64
      %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
      %936 = func.call @cc_intern(%932, %935) : (i64, i64) -> i64
      %937 = func.call @cc_nil_value() : () -> i64
      %938 = func.call @cc_cons(%936, %937) : (i64, i64) -> i64
      %939 = func.call @cc_values_pack(%938) : (i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      %940 = func.call @stack_pop_pointer() : () -> i64
      %941 = func.call @stack_pop_pointer() : () -> i64
      %942 = func.call @cc_typep(%941, %940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%942) : (i64) -> ()
      %943 = func.call @stack_pop_pointer() : () -> i64
      %944 = func.call @cc_cons(%943, %928) : (i64, i64) -> i64
      %945 = func.call @cc_cons(%929, %944) : (i64, i64) -> i64
      %946 = func.call @cc_and(%945) : (i64) -> i64
      func.call @stack_push_pointer(%946) : (i64) -> ()
      %947 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%912) : (i64) -> ()
      func.call @stack_push_pointer(%916) : (i64) -> ()
      func.call @stack_push_pointer(%917) : (i64) -> ()
      func.call @stack_push_pointer(%918) : (i64) -> ()
      func.call @stack_push_pointer(%927) : (i64) -> ()
      func.call @stack_push_pointer(%947) : (i64) -> ()
      %948 = llvm.mlir.addressof @str76 : !llvm.ptr
      %949 = func.call @cc_make_function_ref_const(%948) : (!llvm.ptr) -> i64
      %950 = arith.constant 6 : i64
      func.call @cc_funcall_stack(%949, %950) : (i64, i64) -> ()
      %951 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %951 : i64
    }
    %952 = func.call @cc_nil_value() : () -> i64
    %953 = func.call @cc_errorp(%864) : (i64) -> i64
    %954 = arith.cmpi ne, %953, %952 : i64
    %955 = scf.if %954 -> (i64) {
      scf.yield %864 : i64
    } else {
      %956 = llvm.mlir.addressof @str77 : !llvm.ptr
      %957 = arith.constant 15 : i64
      %958 = func.call @cc_make_string(%956, %957) : (!llvm.ptr, i64) -> i64
      %959 = func.call @cc_nil_value() : () -> i64
      %960 = func.call @cc_intern(%958, %959) : (i64, i64) -> i64
      %961 = func.call @cc_nil_value() : () -> i64
      %962 = func.call @cc_cons(%960, %961) : (i64, i64) -> i64
      %963 = func.call @cc_values_pack(%962) : (i64) -> i64
      func.call @stack_push_pointer(%960) : (i64) -> ()
      %964 = func.call @stack_pop_pointer() : () -> i64
      %965 = llvm.mlir.addressof @str78 : !llvm.ptr
      %966 = arith.constant 3 : i64
      %967 = func.call @cc_make_string(%965, %966) : (!llvm.ptr, i64) -> i64
      %968 = func.call @cc_nil_value() : () -> i64
      %969 = func.call @cc_intern(%967, %968) : (i64, i64) -> i64
      %970 = func.call @cc_nil_value() : () -> i64
      %971 = func.call @cc_cons(%969, %970) : (i64, i64) -> i64
      %972 = func.call @cc_values_pack(%971) : (i64) -> i64
      func.call @stack_push_pointer(%969) : (i64) -> ()
      %973 = llvm.mlir.addressof @str79 : !llvm.ptr
      %974 = arith.constant 3 : i64
      %975 = func.call @cc_make_string(%973, %974) : (!llvm.ptr, i64) -> i64
      %976 = func.call @cc_nil_value() : () -> i64
      %977 = func.call @cc_intern(%975, %976) : (i64, i64) -> i64
      %978 = func.call @cc_nil_value() : () -> i64
      %979 = func.call @cc_cons(%977, %978) : (i64, i64) -> i64
      %980 = func.call @cc_values_pack(%979) : (i64) -> i64
      func.call @stack_push_pointer(%977) : (i64) -> ()
      %981 = llvm.mlir.addressof @str80 : !llvm.ptr
      %982 = arith.constant 3 : i64
      %983 = func.call @cc_make_string(%981, %982) : (!llvm.ptr, i64) -> i64
      %984 = llvm.mlir.addressof @str81 : !llvm.ptr
      %985 = arith.constant 11 : i64
      %986 = func.call @cc_make_string(%984, %985) : (!llvm.ptr, i64) -> i64
      %987 = func.call @cc_intern(%983, %986) : (i64, i64) -> i64
      %988 = func.call @cc_nil_value() : () -> i64
      %989 = func.call @cc_cons(%987, %988) : (i64, i64) -> i64
      %990 = func.call @cc_values_pack(%989) : (i64) -> i64
      func.call @stack_push_pointer(%987) : (i64) -> ()
      %991 = llvm.mlir.addressof @str82 : !llvm.ptr
      %992 = arith.constant 7 : i64
      %993 = func.call @cc_make_string(%991, %992) : (!llvm.ptr, i64) -> i64
      %994 = llvm.mlir.addressof @str83 : !llvm.ptr
      %995 = arith.constant 11 : i64
      %996 = func.call @cc_make_string(%994, %995) : (!llvm.ptr, i64) -> i64
      %997 = func.call @cc_intern(%993, %996) : (i64, i64) -> i64
      %998 = func.call @cc_nil_value() : () -> i64
      %999 = func.call @cc_cons(%997, %998) : (i64, i64) -> i64
      %1000 = func.call @cc_values_pack(%999) : (i64) -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %1001 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1002 = arith.constant 0 : i64
      %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      %1004 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1005 = arith.constant 21 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1008 = arith.constant 11 : i64
      %1009 = func.call @cc_make_string(%1007, %1008) : (!llvm.ptr, i64) -> i64
      %1010 = func.call @cc_intern(%1006, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_nil_value() : () -> i64
      %1012 = func.call @cc_cons(%1010, %1011) : (i64, i64) -> i64
      %1013 = func.call @cc_values_pack(%1012) : (i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1014 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1015 = arith.constant 17 : i64
      %1016 = func.call @cc_make_string(%1014, %1015) : (!llvm.ptr, i64) -> i64
      %1017 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1018 = arith.constant 11 : i64
      %1019 = func.call @cc_make_string(%1017, %1018) : (!llvm.ptr, i64) -> i64
      %1020 = func.call @cc_intern(%1016, %1019) : (i64, i64) -> i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_cons(%1020, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_values_pack(%1022) : (i64) -> i64
      func.call @stack_push_pointer(%1020) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1024 = func.call @stack_pop_pointer() : () -> i64
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = func.call @cc_cons(%1025, %1024) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1026) : (i64) -> ()
      %1027 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1028 = arith.constant 12 : i64
      %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
      %1030 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1031 = arith.constant 11 : i64
      %1032 = func.call @cc_make_string(%1030, %1031) : (!llvm.ptr, i64) -> i64
      %1033 = func.call @cc_intern(%1029, %1032) : (i64, i64) -> i64
      %1034 = func.call @cc_nil_value() : () -> i64
      %1035 = func.call @cc_cons(%1033, %1034) : (i64, i64) -> i64
      %1036 = func.call @cc_values_pack(%1035) : (i64) -> i64
      func.call @stack_push_pointer(%1033) : (i64) -> ()
      %1037 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1038 = arith.constant 52 : i64
      %1039 = func.call @cc_make_string(%1037, %1038) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1039) : (i64) -> ()
      %1040 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1041 = arith.constant 7 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1044 = arith.constant 7 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      %1046 = func.call @cc_intern(%1042, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      %1050 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1050) : (i64) -> ()
      %1051 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1052 = arith.constant 5 : i64
      %1053 = func.call @cc_make_string(%1051, %1052) : (!llvm.ptr, i64) -> i64
      %1054 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1055 = arith.constant 7 : i64
      %1056 = func.call @cc_make_string(%1054, %1055) : (!llvm.ptr, i64) -> i64
      %1057 = func.call @cc_intern(%1053, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_nil_value() : () -> i64
      %1059 = func.call @cc_cons(%1057, %1058) : (i64, i64) -> i64
      %1060 = func.call @cc_values_pack(%1059) : (i64) -> i64
      func.call @stack_push_pointer(%1057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @cc_cons(%1062, %1061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @cc_cons(%1065, %1064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1066) : (i64) -> ()
      %1067 = func.call @stack_pop_pointer() : () -> i64
      %1068 = func.call @stack_pop_pointer() : () -> i64
      %1069 = func.call @cc_cons(%1068, %1067) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1069) : (i64) -> ()
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @cc_cons(%1071, %1070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      %1073 = func.call @stack_pop_pointer() : () -> i64
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @cc_cons(%1074, %1073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1075) : (i64) -> ()
      %1076 = func.call @stack_pop_pointer() : () -> i64
      %1077 = func.call @stack_pop_pointer() : () -> i64
      %1078 = func.call @cc_cons(%1077, %1076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1078) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1079 = func.call @stack_pop_pointer() : () -> i64
      %1080 = func.call @stack_pop_pointer() : () -> i64
      %1081 = func.call @cc_cons(%1080, %1079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = func.call @stack_pop_pointer() : () -> i64
      %1083 = func.call @stack_pop_pointer() : () -> i64
      %1084 = func.call @cc_cons(%1083, %1082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1084) : (i64) -> ()
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = func.call @cc_cons(%1086, %1085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @stack_pop_pointer() : () -> i64
      %1090 = func.call @cc_cons(%1089, %1088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1090) : (i64) -> ()
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @stack_pop_pointer() : () -> i64
      %1093 = func.call @cc_cons(%1092, %1091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @stack_pop_pointer() : () -> i64
      %1096 = func.call @cc_cons(%1095, %1094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1096) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = func.call @cc_cons(%1098, %1097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1099) : (i64) -> ()
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @stack_pop_pointer() : () -> i64
      %1102 = func.call @cc_cons(%1101, %1100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1102) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = func.call @cc_cons(%1104, %1103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1105) : (i64) -> ()
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @stack_pop_pointer() : () -> i64
      %1108 = func.call @cc_cons(%1107, %1106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = func.call @stack_pop_pointer() : () -> i64
      %1111 = func.call @cc_cons(%1110, %1109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1111) : (i64) -> ()
      %1112 = func.call @stack_pop_pointer() : () -> i64
      %1113 = func.call @stack_pop_pointer() : () -> i64
      %1114 = func.call @cc_cons(%1113, %1112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1220 = arith.constant 46573484507140 : i64
      %1221 = arith.constant 0 : i64
      %1222 = func.call @cc_make_closure(%1220, %1221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1225 = arith.constant 1 : i64
      %1226 = func.call @cc_make_string(%1224, %1225) : (!llvm.ptr, i64) -> i64
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_intern(%1226, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_nil_value() : () -> i64
      %1230 = func.call @cc_cons(%1228, %1229) : (i64, i64) -> i64
      %1231 = func.call @cc_values_pack(%1230) : (i64) -> i64
      func.call @stack_push_pointer(%1228) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1232 = func.call @stack_pop_pointer() : () -> i64
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = func.call @cc_cons(%1233, %1232) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1234) : (i64) -> ()
      %1235 = func.call @stack_pop_pointer() : () -> i64
      %1236 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1237 = arith.constant 11 : i64
      %1238 = func.call @cc_make_string(%1236, %1237) : (!llvm.ptr, i64) -> i64
      %1239 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1240 = arith.constant 7 : i64
      %1241 = func.call @cc_make_string(%1239, %1240) : (!llvm.ptr, i64) -> i64
      %1242 = func.call @cc_intern(%1238, %1241) : (i64, i64) -> i64
      %1243 = func.call @cc_nil_value() : () -> i64
      %1244 = func.call @cc_cons(%1242, %1243) : (i64, i64) -> i64
      %1245 = func.call @cc_values_pack(%1244) : (i64) -> i64
      func.call @stack_push_pointer(%1242) : (i64) -> ()
      %1246 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1247 = func.call @stack_pop_pointer() : () -> i64
      %1248 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1249 = arith.constant 4 : i64
      %1250 = func.call @cc_make_string(%1248, %1249) : (!llvm.ptr, i64) -> i64
      %1251 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1252 = arith.constant 7 : i64
      %1253 = func.call @cc_make_string(%1251, %1252) : (!llvm.ptr, i64) -> i64
      %1254 = func.call @cc_intern(%1250, %1253) : (i64, i64) -> i64
      %1255 = func.call @cc_nil_value() : () -> i64
      %1256 = func.call @cc_cons(%1254, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_values_pack(%1256) : (i64) -> i64
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      %1258 = func.call @stack_pop_pointer() : () -> i64
      %1259 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1260 = arith.constant 6 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = func.call @cc_nil_value() : () -> i64
      %1263 = func.call @cc_intern(%1261, %1262) : (i64, i64) -> i64
      %1264 = func.call @cc_nil_value() : () -> i64
      %1265 = func.call @cc_cons(%1263, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_values_pack(%1265) : (i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @cc_nil_value() : () -> i64
      %1269 = func.call @cc_errorp(%964) : (i64) -> i64
      %1270 = arith.cmpi ne, %1269, %1268 : i64
      %1271 = arith.cmpi eq, %1268, %1268 : i64
      %1272 = arith.andi %1270, %1271 : i1
      %1273 = scf.if %1272 -> (i64) {
        scf.yield %964 : i64
      } else {
        scf.yield %1268 : i64
      }
      %1274 = func.call @cc_errorp(%1115) : (i64) -> i64
      %1275 = arith.cmpi ne, %1274, %1268 : i64
      %1276 = arith.cmpi eq, %1273, %1268 : i64
      %1277 = arith.andi %1275, %1276 : i1
      %1278 = scf.if %1277 -> (i64) {
        scf.yield %1115 : i64
      } else {
        scf.yield %1273 : i64
      }
      %1279 = func.call @cc_errorp(%1223) : (i64) -> i64
      %1280 = arith.cmpi ne, %1279, %1268 : i64
      %1281 = arith.cmpi eq, %1278, %1268 : i64
      %1282 = arith.andi %1280, %1281 : i1
      %1283 = scf.if %1282 -> (i64) {
        scf.yield %1223 : i64
      } else {
        scf.yield %1278 : i64
      }
      %1284 = func.call @cc_errorp(%1235) : (i64) -> i64
      %1285 = arith.cmpi ne, %1284, %1268 : i64
      %1286 = arith.cmpi eq, %1283, %1268 : i64
      %1287 = arith.andi %1285, %1286 : i1
      %1288 = scf.if %1287 -> (i64) {
        scf.yield %1235 : i64
      } else {
        scf.yield %1283 : i64
      }
      %1289 = func.call @cc_errorp(%1246) : (i64) -> i64
      %1290 = arith.cmpi ne, %1289, %1268 : i64
      %1291 = arith.cmpi eq, %1288, %1268 : i64
      %1292 = arith.andi %1290, %1291 : i1
      %1293 = scf.if %1292 -> (i64) {
        scf.yield %1246 : i64
      } else {
        scf.yield %1288 : i64
      }
      %1294 = func.call @cc_errorp(%1247) : (i64) -> i64
      %1295 = arith.cmpi ne, %1294, %1268 : i64
      %1296 = arith.cmpi eq, %1293, %1268 : i64
      %1297 = arith.andi %1295, %1296 : i1
      %1298 = scf.if %1297 -> (i64) {
        scf.yield %1247 : i64
      } else {
        scf.yield %1293 : i64
      }
      %1299 = func.call @cc_errorp(%1258) : (i64) -> i64
      %1300 = arith.cmpi ne, %1299, %1268 : i64
      %1301 = arith.cmpi eq, %1298, %1268 : i64
      %1302 = arith.andi %1300, %1301 : i1
      %1303 = scf.if %1302 -> (i64) {
        scf.yield %1258 : i64
      } else {
        scf.yield %1298 : i64
      }
      %1304 = func.call @cc_errorp(%1267) : (i64) -> i64
      %1305 = arith.cmpi ne, %1304, %1268 : i64
      %1306 = arith.cmpi eq, %1303, %1268 : i64
      %1307 = arith.andi %1305, %1306 : i1
      %1308 = scf.if %1307 -> (i64) {
        scf.yield %1267 : i64
      } else {
        scf.yield %1303 : i64
      }
      %1309 = arith.cmpi ne, %1308, %1268 : i64
      scf.if %1309 {
        func.call @stack_push_pointer(%1308) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%964) : (i64) -> ()
        func.call @stack_push_pointer(%1115) : (i64) -> ()
        func.call @stack_push_pointer(%1223) : (i64) -> ()
        func.call @stack_push_pointer(%1235) : (i64) -> ()
        func.call @stack_push_pointer(%1246) : (i64) -> ()
        func.call @stack_push_pointer(%1247) : (i64) -> ()
        func.call @stack_push_pointer(%1258) : (i64) -> ()
        func.call @stack_push_pointer(%1267) : (i64) -> ()
        %1310 = llvm.mlir.addressof @str110 : !llvm.ptr
        %1311 = func.call @cc_make_function_ref_const(%1310) : (!llvm.ptr) -> i64
        %1312 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1311, %1312) : (i64, i64) -> ()
      }
      %1313 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1313 : i64
    }
    %1314 = func.call @cc_nil_value() : () -> i64
    %1315 = func.call @cc_errorp(%955) : (i64) -> i64
    %1316 = arith.cmpi ne, %1315, %1314 : i64
    %1317 = scf.if %1316 -> (i64) {
      scf.yield %955 : i64
    } else {
      %1318 = func.call @cc_nil_value() : () -> i64
      %1319 = arith.cmpi ne, %1318, %1318 : i64
      scf.if %1319 {
        func.call @stack_push_pointer(%1318) : (i64) -> ()
      } else {
        %1320 = llvm.mlir.addressof @str111 : !llvm.ptr
        %1321 = func.call @cc_make_function_ref_const(%1320) : (!llvm.ptr) -> i64
        %1322 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1321, %1322) : (i64, i64) -> ()
      }
      %1323 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1323 : i64
    }
    func.call @stack_push_pointer(%1317) : (i64) -> ()
    %1324 = func.call @stack_pop_pointer() : () -> i64
    %1325 = func.call @cc_multiple_value_list(%1324) : (i64) -> i64
    %1326 = llvm.mlir.addressof @str112 : !llvm.ptr
    %1327 = arith.constant 37 : i64
    %1328 = func.call @cc_make_string(%1326, %1327) : (!llvm.ptr, i64) -> i64
    %1329 = func.call @cc_nil_value() : () -> i64
    %1330 = func.call @cc_intern(%1328, %1329) : (i64, i64) -> i64
    %1331 = func.call @cc_nil_value() : () -> i64
    %1332 = func.call @cc_cons(%1330, %1331) : (i64, i64) -> i64
    %1333 = func.call @cc_values_pack(%1332) : (i64) -> i64
    %1334 = func.call @cc_symbol_value(%1330) : (i64) -> i64
    %1335 = llvm.mlir.addressof @str113 : !llvm.ptr
    %1336 = arith.constant 39 : i64
    %1337 = func.call @cc_make_string(%1335, %1336) : (!llvm.ptr, i64) -> i64
    %1338 = func.call @cc_nil_value() : () -> i64
    %1339 = func.call @cc_intern(%1337, %1338) : (i64, i64) -> i64
    %1340 = func.call @cc_nil_value() : () -> i64
    %1341 = func.call @cc_cons(%1339, %1340) : (i64, i64) -> i64
    %1342 = func.call @cc_values_pack(%1341) : (i64) -> i64
    %1343 = func.call @cc_symbol_value(%1339) : (i64) -> i64
    %1344 = func.call @cc_nil_value() : () -> i64
    %1345 = arith.cmpi ne, %1334, %1344 : i64
    %1346 = scf.if %1345 -> (i64) {
      scf.yield %1343 : i64
    } else {
      scf.yield %1325 : i64
    }
    %1347 = func.call @cc_values_pack(%1346) : (i64) -> i64
    func.call @stack_push_pointer(%1347) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_46573484507137"() {
    %172 = func.call @cc_nil_value() : () -> i64
    %173 = func.call @cc_nil_value() : () -> i64
    %174 = func.call @cc_errorp(%172) : (i64) -> i64
    %175 = arith.cmpi ne, %174, %173 : i64
    %176 = scf.if %175 -> (i64) {
      scf.yield %172 : i64
    } else {
      %177 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %178 = func.call @cc_nil_value() : () -> i64
      %179 = func.call @cc_nil_value() : () -> i64
      %180 = func.call @cc_errorp(%178) : (i64) -> i64
      %181 = arith.cmpi ne, %180, %179 : i64
      %182 = scf.if %181 -> (i64) {
        scf.yield %178 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %183 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%183) : (i64) -> ()
        %184 = llvm.mlir.addressof @str17 : !llvm.ptr
        %185 = arith.constant 49 : i64
        %186 = func.call @cc_make_string(%184, %185) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%186) : (i64) -> ()
        %187 = func.call @stack_pop_pointer() : () -> i64
        %188 = func.call @stack_pop_pointer() : () -> i64
        %189 = func.call @cc_cons(%187, %188) : (i64, i64) -> i64
        func.call @stack_push_pointer(%189) : (i64) -> ()
        %190 = llvm.mlir.addressof @str18 : !llvm.ptr
        %191 = arith.constant 12 : i64
        %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
        %193 = func.call @cc_nil_value() : () -> i64
        %194 = func.call @cc_intern(%192, %193) : (i64, i64) -> i64
        %195 = func.call @cc_nil_value() : () -> i64
        %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
        %197 = func.call @cc_values_pack(%196) : (i64) -> i64
        func.call @stack_push_pointer(%194) : (i64) -> ()
        %198 = func.call @stack_pop_pointer() : () -> i64
        %199 = func.call @stack_pop_pointer() : () -> i64
        %200 = func.call @cc_cons(%198, %199) : (i64, i64) -> i64
        func.call @stack_push_pointer(%200) : (i64) -> ()
        %201 = func.call @stack_pop_pointer() : () -> i64
        %202 = func.call @cc_nil_value() : () -> i64
        %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
        %204 = func.call @cc_eval(%203) : (i64) -> i64
        %205 = func.call @cc_multiple_value_list(%204) : (i64) -> i64
        %206 = func.call @cc_values_pack(%205) : (i64) -> i64
        func.call @stack_push_pointer(%206) : (i64) -> ()
        %207 = func.call @stack_pop_pointer() : () -> i64
        %208 = func.call @cc_errorp(%207) : (i64) -> i64
        %209 = func.call @cc_nil_value() : () -> i64
        %210 = arith.cmpi ne, %208, %209 : i64
        scf.if %210 {
          func.call @stack_push_pointer(%207) : (i64) -> ()
        } else {
          %211 = func.call @cc_multiple_value_list(%207) : (i64) -> i64
          func.call @stack_push_pointer(%211) : (i64) -> ()
        }
        %212 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %213 = func.call @stack_pop_pointer() : () -> i64
        %214 = func.call @cc_nil_value() : () -> i64
        %215 = func.call @cc_maybe_error_from_multiple_value_list(%212) : (i64) -> i64
        %216 = func.call @cc_errorp(%215) : (i64) -> i64
        %217 = arith.cmpi ne, %216, %214 : i64
        %218 = arith.cmpi eq, %214, %214 : i64
        %219 = arith.andi %217, %218 : i1
        %220 = scf.if %219 -> (i64) {
          scf.yield %215 : i64
        } else {
          scf.yield %214 : i64
        }
        %221 = arith.cmpi ne, %220, %214 : i64
        scf.if %221 {
          func.call @stack_push_pointer(%220) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %222 = func.call @stack_pop_pointer() : () -> i64
          %223 = func.call @cc_cons(%213, %222) : (i64, i64) -> i64
          func.call @stack_push_pointer(%223) : (i64) -> ()
          %224 = func.call @stack_pop_pointer() : () -> i64
          %225 = func.call @cc_cons(%212, %224) : (i64, i64) -> i64
          func.call @stack_push_pointer(%225) : (i64) -> ()
          %226 = func.call @stack_pop_pointer() : () -> i64
          %227 = func.call @cc_values_pack(%226) : (i64) -> i64
          func.call @stack_push_pointer(%227) : (i64) -> ()
        }
        %228 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %228 : i64
      }
      func.call @stack_push_pointer(%182) : (i64) -> ()
      %229 = func.call @stack_pop_pointer() : () -> i64
      %230 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %231 = func.call @cc_errorp(%229) : (i64) -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = arith.cmpi ne, %231, %232 : i64
      scf.if %233 {
        %234 = func.call @cc_condition_value(%229) : (i64) -> i64
        %235 = func.call @cc_values2(%232, %234) : (i64, i64) -> i64
        func.call @stack_push_pointer(%235) : (i64) -> ()
      } else {
        %236 = func.call @cc_multiple_value_list(%229) : (i64) -> i64
        %237 = func.call @cc_values_pack(%236) : (i64) -> i64
        func.call @stack_push_pointer(%237) : (i64) -> ()
      }
      %238 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %238 : i64
    }
    func.call @stack_push_pointer(%176) : (i64) -> ()
    func.return
  }
  func.func @"%FN%probe-cell-bar"() {
    %450 = llvm.mlir.addressof @str36 : !llvm.ptr
    %451 = arith.constant 14 : i64
    %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
    %453 = func.call @cc_nil_value() : () -> i64
    %454 = func.call @cc_intern(%452, %453) : (i64, i64) -> i64
    %455 = func.call @cc_nil_value() : () -> i64
    %456 = func.call @cc_cons(%454, %455) : (i64, i64) -> i64
    %457 = func.call @cc_values_pack(%456) : (i64) -> i64
    %458 = llvm.mlir.addressof @str37 : !llvm.ptr
    %459 = arith.constant 6 : i64
    %460 = func.call @cc_make_string(%458, %459) : (!llvm.ptr, i64) -> i64
    %461 = func.call @cc_register_function_lambda_list_metadata_raw(%454, %460) : (i64, i64) -> i64
    %462 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%454, %462) : (i64, i64) -> ()
    %463 = func.call @stack_pop_pointer() : () -> i64
    %464 = func.call @cc_nil_value() : () -> i64
    %465 = llvm.mlir.addressof @str38 : !llvm.ptr
    %466 = arith.constant 37 : i64
    %467 = func.call @cc_make_string(%465, %466) : (!llvm.ptr, i64) -> i64
    %468 = func.call @cc_nil_value() : () -> i64
    %469 = func.call @cc_intern(%467, %468) : (i64, i64) -> i64
    %470 = func.call @cc_nil_value() : () -> i64
    %471 = func.call @cc_cons(%469, %470) : (i64, i64) -> i64
    %472 = func.call @cc_values_pack(%471) : (i64) -> i64
    %473 = func.call @cc_set_symbol_value(%469, %464) : (i64, i64) -> i64
    %474 = llvm.mlir.addressof @str39 : !llvm.ptr
    %475 = arith.constant 38 : i64
    %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
    %477 = func.call @cc_nil_value() : () -> i64
    %478 = func.call @cc_intern(%476, %477) : (i64, i64) -> i64
    %479 = func.call @cc_nil_value() : () -> i64
    %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
    %481 = func.call @cc_values_pack(%480) : (i64) -> i64
    %482 = func.call @cc_set_symbol_value(%478, %464) : (i64, i64) -> i64
    %483 = llvm.mlir.addressof @str40 : !llvm.ptr
    %484 = arith.constant 39 : i64
    %485 = func.call @cc_make_string(%483, %484) : (!llvm.ptr, i64) -> i64
    %486 = func.call @cc_nil_value() : () -> i64
    %487 = func.call @cc_intern(%485, %486) : (i64, i64) -> i64
    %488 = func.call @cc_nil_value() : () -> i64
    %489 = func.call @cc_cons(%487, %488) : (i64, i64) -> i64
    %490 = func.call @cc_values_pack(%489) : (i64) -> i64
    %491 = func.call @cc_set_symbol_value(%487, %464) : (i64, i64) -> i64
    func.call @stack_push_pointer(%463) : (i64) -> ()
    %492 = func.call @stack_pop_pointer() : () -> i64
    %493 = llvm.mlir.addressof @str41 : !llvm.ptr
    %494 = arith.constant 3 : i64
    %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
    %496 = func.call @cc_nil_value() : () -> i64
    %497 = func.call @cc_intern(%495, %496) : (i64, i64) -> i64
    %498 = func.call @cc_nil_value() : () -> i64
    %499 = func.call @cc_cons(%497, %498) : (i64, i64) -> i64
    %500 = func.call @cc_values_pack(%499) : (i64) -> i64
    func.call @stack_push_pointer(%497) : (i64) -> ()
    %501 = func.call @stack_pop_pointer() : () -> i64
    %502 = func.call @cc_nil_value() : () -> i64
    %503 = func.call @cc_errorp(%492) : (i64) -> i64
    %504 = arith.cmpi ne, %503, %502 : i64
    %505 = arith.cmpi eq, %502, %502 : i64
    %506 = arith.andi %504, %505 : i1
    %507 = scf.if %506 -> (i64) {
      scf.yield %492 : i64
    } else {
      scf.yield %502 : i64
    }
    %508 = func.call @cc_errorp(%501) : (i64) -> i64
    %509 = arith.cmpi ne, %508, %502 : i64
    %510 = arith.cmpi eq, %507, %502 : i64
    %511 = arith.andi %509, %510 : i1
    %512 = scf.if %511 -> (i64) {
      scf.yield %501 : i64
    } else {
      scf.yield %507 : i64
    }
    %513 = arith.cmpi ne, %512, %502 : i64
    scf.if %513 {
      func.call @stack_push_pointer(%512) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%492) : (i64) -> ()
      func.call @stack_push_pointer(%501) : (i64) -> ()
      %514 = llvm.mlir.addressof @str42 : !llvm.ptr
      %515 = func.call @cc_make_function_ref_const(%514) : (!llvm.ptr) -> i64
      %516 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%515, %516) : (i64, i64) -> ()
    }
    %517 = func.call @stack_pop_pointer() : () -> i64
    %518 = func.call @cc_multiple_value_list(%517) : (i64) -> i64
    %519 = llvm.mlir.addressof @str43 : !llvm.ptr
    %520 = arith.constant 37 : i64
    %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
    %522 = func.call @cc_nil_value() : () -> i64
    %523 = func.call @cc_intern(%521, %522) : (i64, i64) -> i64
    %524 = func.call @cc_nil_value() : () -> i64
    %525 = func.call @cc_cons(%523, %524) : (i64, i64) -> i64
    %526 = func.call @cc_values_pack(%525) : (i64) -> i64
    %527 = func.call @cc_symbol_value(%523) : (i64) -> i64
    %528 = llvm.mlir.addressof @str44 : !llvm.ptr
    %529 = arith.constant 39 : i64
    %530 = func.call @cc_make_string(%528, %529) : (!llvm.ptr, i64) -> i64
    %531 = func.call @cc_nil_value() : () -> i64
    %532 = func.call @cc_intern(%530, %531) : (i64, i64) -> i64
    %533 = func.call @cc_nil_value() : () -> i64
    %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
    %535 = func.call @cc_values_pack(%534) : (i64) -> i64
    %536 = func.call @cc_symbol_value(%532) : (i64) -> i64
    %537 = func.call @cc_nil_value() : () -> i64
    %538 = arith.cmpi ne, %527, %537 : i64
    %539 = scf.if %538 -> (i64) {
      scf.yield %536 : i64
    } else {
      scf.yield %518 : i64
    }
    %540 = func.call @cc_values_pack(%539) : (i64) -> i64
    func.call @stack_push_pointer(%540) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_46573484507139"() {
    %689 = func.call @cc_nil_value() : () -> i64
    %690 = func.call @cc_nil_value() : () -> i64
    %691 = func.call @cc_errorp(%689) : (i64) -> i64
    %692 = arith.cmpi ne, %691, %690 : i64
    %693 = scf.if %692 -> (i64) {
      scf.yield %689 : i64
    } else {
      %694 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %695 = func.call @cc_nil_value() : () -> i64
      %696 = func.call @cc_nil_value() : () -> i64
      %697 = func.call @cc_errorp(%695) : (i64) -> i64
      %698 = arith.cmpi ne, %697, %696 : i64
      %699 = scf.if %698 -> (i64) {
        scf.yield %695 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %700 = func.call @cc_nil_value() : () -> i64
        %701 = llvm.mlir.addressof @str60 : !llvm.ptr
        %702 = arith.constant 14 : i64
        %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
        %704 = func.call @cc_nil_value() : () -> i64
        %705 = func.call @cc_intern(%703, %704) : (i64, i64) -> i64
        %706 = func.call @cc_nil_value() : () -> i64
        %707 = func.call @cc_cons(%705, %706) : (i64, i64) -> i64
        %708 = func.call @cc_values_pack(%707) : (i64) -> i64
        func.call @stack_push_pointer(%705) : (i64) -> ()
        %709 = func.call @stack_pop_pointer() : () -> i64
        %710 = func.call @cc_make_instance(%709, %700) : (i64, i64) -> i64
        func.call @stack_push_pointer(%710) : (i64) -> ()
        %711 = func.call @stack_pop_pointer() : () -> i64
        %712 = func.call @cc_nil_value() : () -> i64
        %713 = func.call @cc_errorp(%711) : (i64) -> i64
        %714 = arith.cmpi ne, %713, %712 : i64
        %715 = arith.cmpi eq, %712, %712 : i64
        %716 = arith.andi %714, %715 : i1
        %717 = scf.if %716 -> (i64) {
          scf.yield %711 : i64
        } else {
          scf.yield %712 : i64
        }
        %718 = arith.cmpi ne, %717, %712 : i64
        scf.if %718 {
          func.call @stack_push_pointer(%717) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%711) : (i64) -> ()
          %719 = llvm.mlir.addressof @str61 : !llvm.ptr
          %720 = func.call @cc_make_function_ref_const(%719) : (!llvm.ptr) -> i64
          %721 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%720, %721) : (i64, i64) -> ()
        }
        %722 = func.call @stack_pop_pointer() : () -> i64
        %723 = func.call @cc_errorp(%722) : (i64) -> i64
        %724 = func.call @cc_nil_value() : () -> i64
        %725 = arith.cmpi ne, %723, %724 : i64
        scf.if %725 {
          func.call @stack_push_pointer(%722) : (i64) -> ()
        } else {
          %726 = func.call @cc_multiple_value_list(%722) : (i64) -> i64
          func.call @stack_push_pointer(%726) : (i64) -> ()
        }
        %727 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %728 = func.call @stack_pop_pointer() : () -> i64
        %729 = func.call @cc_nil_value() : () -> i64
        %730 = func.call @cc_maybe_error_from_multiple_value_list(%727) : (i64) -> i64
        %731 = func.call @cc_errorp(%730) : (i64) -> i64
        %732 = arith.cmpi ne, %731, %729 : i64
        %733 = arith.cmpi eq, %729, %729 : i64
        %734 = arith.andi %732, %733 : i1
        %735 = scf.if %734 -> (i64) {
          scf.yield %730 : i64
        } else {
          scf.yield %729 : i64
        }
        %736 = arith.cmpi ne, %735, %729 : i64
        scf.if %736 {
          func.call @stack_push_pointer(%735) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %737 = func.call @stack_pop_pointer() : () -> i64
          %738 = func.call @cc_cons(%728, %737) : (i64, i64) -> i64
          func.call @stack_push_pointer(%738) : (i64) -> ()
          %739 = func.call @stack_pop_pointer() : () -> i64
          %740 = func.call @cc_cons(%727, %739) : (i64, i64) -> i64
          func.call @stack_push_pointer(%740) : (i64) -> ()
          %741 = func.call @stack_pop_pointer() : () -> i64
          %742 = func.call @cc_values_pack(%741) : (i64) -> i64
          func.call @stack_push_pointer(%742) : (i64) -> ()
        }
        %743 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %743 : i64
      }
      func.call @stack_push_pointer(%699) : (i64) -> ()
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %746 = func.call @cc_errorp(%744) : (i64) -> i64
      %747 = func.call @cc_nil_value() : () -> i64
      %748 = arith.cmpi ne, %746, %747 : i64
      scf.if %748 {
        %749 = func.call @cc_condition_value(%744) : (i64) -> i64
        %750 = func.call @cc_values2(%747, %749) : (i64, i64) -> i64
        func.call @stack_push_pointer(%750) : (i64) -> ()
      } else {
        %751 = func.call @cc_multiple_value_list(%744) : (i64) -> i64
        %752 = func.call @cc_values_pack(%751) : (i64) -> i64
        func.call @stack_push_pointer(%752) : (i64) -> ()
      }
      %753 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %753 : i64
    }
    func.call @stack_push_pointer(%693) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_46573484507140"() {
    %1116 = func.call @cc_nil_value() : () -> i64
    %1117 = func.call @cc_nil_value() : () -> i64
    %1118 = func.call @cc_errorp(%1116) : (i64) -> i64
    %1119 = arith.cmpi ne, %1118, %1117 : i64
    %1120 = scf.if %1119 -> (i64) {
      scf.yield %1116 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1121 = func.call @cc_make_string_output_stream() : () -> i64
      %1122 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1123 = arith.constant 17 : i64
      %1124 = func.call @cc_make_string(%1122, %1123) : (!llvm.ptr, i64) -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_intern(%1124, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_nil_value() : () -> i64
      %1128 = func.call @cc_cons(%1126, %1127) : (i64, i64) -> i64
      %1129 = func.call @cc_values_pack(%1128) : (i64) -> i64
      %1130 = func.call @cc_symbol_value(%1126) : (i64) -> i64
      %1131 = func.call @cc_set_symbol_value(%1126, %1121) : (i64, i64) -> i64
      %1132 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1132) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @stack_pop_pointer() : () -> i64
      %1135 = func.call @cc_cons(%1133, %1134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1135) : (i64) -> ()
      %1136 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1137 = arith.constant 5 : i64
      %1138 = func.call @cc_make_string(%1136, %1137) : (!llvm.ptr, i64) -> i64
      %1139 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1140 = arith.constant 7 : i64
      %1141 = func.call @cc_make_string(%1139, %1140) : (!llvm.ptr, i64) -> i64
      %1142 = func.call @cc_intern(%1138, %1141) : (i64, i64) -> i64
      %1143 = func.call @cc_nil_value() : () -> i64
      %1144 = func.call @cc_cons(%1142, %1143) : (i64, i64) -> i64
      %1145 = func.call @cc_values_pack(%1144) : (i64) -> i64
      func.call @stack_push_pointer(%1142) : (i64) -> ()
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @cc_cons(%1146, %1147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1148) : (i64) -> ()
      %1149 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = func.call @cc_cons(%1150, %1151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      %1153 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1154 = arith.constant 7 : i64
      %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
      %1156 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1157 = arith.constant 7 : i64
      %1158 = func.call @cc_make_string(%1156, %1157) : (!llvm.ptr, i64) -> i64
      %1159 = func.call @cc_intern(%1155, %1158) : (i64, i64) -> i64
      %1160 = func.call @cc_nil_value() : () -> i64
      %1161 = func.call @cc_cons(%1159, %1160) : (i64, i64) -> i64
      %1162 = func.call @cc_values_pack(%1161) : (i64) -> i64
      func.call @stack_push_pointer(%1159) : (i64) -> ()
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @stack_pop_pointer() : () -> i64
      %1165 = func.call @cc_cons(%1163, %1164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1165) : (i64) -> ()
      %1166 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1167 = arith.constant 52 : i64
      %1168 = func.call @cc_make_string(%1166, %1167) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = func.call @stack_pop_pointer() : () -> i64
      %1171 = func.call @cc_cons(%1169, %1170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1171) : (i64) -> ()
      %1172 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1173 = arith.constant 12 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = func.call @cc_nil_value() : () -> i64
      %1176 = func.call @cc_intern(%1174, %1175) : (i64, i64) -> i64
      %1177 = func.call @cc_nil_value() : () -> i64
      %1178 = func.call @cc_cons(%1176, %1177) : (i64, i64) -> i64
      %1179 = func.call @cc_values_pack(%1178) : (i64) -> i64
      func.call @stack_push_pointer(%1176) : (i64) -> ()
      %1180 = func.call @stack_pop_pointer() : () -> i64
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @cc_cons(%1180, %1181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1182) : (i64) -> ()
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @cc_nil_value() : () -> i64
      %1185 = func.call @cc_cons(%1183, %1184) : (i64, i64) -> i64
      %1186 = func.call @cc_eval(%1185) : (i64) -> i64
      %1187 = func.call @cc_multiple_value_list(%1186) : (i64) -> i64
      %1188 = func.call @cc_values_pack(%1187) : (i64) -> i64
      func.call @stack_push_pointer(%1188) : (i64) -> ()
      %1189 = func.call @stack_pop_pointer() : () -> i64
      %1190 = func.call @cc_nil_value() : () -> i64
      %1191 = func.call @cc_errorp(%1189) : (i64) -> i64
      %1192 = arith.cmpi ne, %1191, %1190 : i64
      %1193 = scf.if %1192 -> (i64) {
        scf.yield %1189 : i64
      } else {
        %1194 = func.call @cc_get_output_stream_string(%1121) : (i64) -> i64
        scf.yield %1194 : i64
      }
      func.call @stack_push_pointer(%1193) : (i64) -> ()
      %1195 = func.call @cc_set_symbol_value(%1126, %1130) : (i64, i64) -> i64
      %1196 = func.call @stack_pop_pointer() : () -> i64
      %1197 = func.call @stack_pop_pointer() : () -> i64
      %1198 = func.call @cc_cons(%1196, %1197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1198) : (i64) -> ()
      %1199 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1200 = arith.constant 0 : i64
      %1201 = func.call @cc_make_string(%1199, %1200) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1201) : (i64) -> ()
      %1202 = func.call @stack_pop_pointer() : () -> i64
      %1203 = func.call @stack_pop_pointer() : () -> i64
      %1204 = func.call @cc_cons(%1202, %1203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1204) : (i64) -> ()
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @cc_string_equal_full(%1205) : (i64) -> i64
      func.call @stack_push_pointer(%1206) : (i64) -> ()
      %1207 = func.call @stack_pop_pointer() : () -> i64
      %1208 = func.call @cc_nil_value() : () -> i64
      %1209 = func.call @cc_cons(%1207, %1208) : (i64, i64) -> i64
      %1210 = func.call @cc_not(%1209) : (i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      %1211 = func.call @stack_pop_pointer() : () -> i64
      %1212 = func.call @cc_nil_value() : () -> i64
      %1213 = func.call @cc_cons(%1211, %1212) : (i64, i64) -> i64
      %1214 = func.call @cc_not(%1213) : (i64) -> i64
      func.call @stack_push_pointer(%1214) : (i64) -> ()
      %1215 = func.call @stack_pop_pointer() : () -> i64
      %1216 = func.call @cc_nil_value() : () -> i64
      %1217 = func.call @cc_cons(%1215, %1216) : (i64, i64) -> i64
      %1218 = func.call @cc_not(%1217) : (i64) -> i64
      func.call @stack_push_pointer(%1218) : (i64) -> ()
      %1219 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1219 : i64
    }
    func.call @stack_push_pointer(%1120) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_46573484507136*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_46573484507136*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_46573484507136*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("CL-USER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str5("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str6("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str7("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("reset-clasp-tests\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str9("PROBE-COMPILE-1\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str10("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str11("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str14("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("sys:src;lisp;regression-tests;I-do-not-exist.lisp\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str17("sys:src;lisp;regression-tests;I-do-not-exist.lisp\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str18("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str19("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str20("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str24("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str25("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str27("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str28("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("PROBE-CELL-FOO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str30("PROBE-CELL-BAR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str31("ACCESSOR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str32("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str34("PROBE-CELL-FOO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str35("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str36("PROBE-CELL-BAR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str37("object\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETFLAG_46573484507138*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str39("*__MLIR_BLOCK_RETVALUE_46573484507138*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str40("*__MLIR_BLOCK_RETMVLIST_46573484507138*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str41("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str42("slot-value\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETFLAG_46573484507138*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETMVLIST_46573484507138*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str45("object\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("PROBE-CELL-BAR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str47("%FN%probe-cell-bar\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str48("PROBE-CELL-BAR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str49("PROBE-CELL-BAR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str50("PROBE-CELL-3\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str51("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str52("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str54("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str55("PROBE-CELL-BAR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str56("MAKE-INSTANCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str57("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("PROBE-CELL-FOO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str59("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str60("PROBE-CELL-FOO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str61("%FN%probe-cell-bar\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str62("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str63("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str67("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str68("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str70("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str71("PROBE-CELL-FOO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str72("%FN%probe-cell-bar\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str73("probe-cell direct value=~S condition=~S type=~S unbound-slot?=~S~%\00") : !llvm.array<67 x i8>
  llvm.mlir.global private constant @str74("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str77("PROBE-COMPILE-4\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str78("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str79("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str80("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str85("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str86("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str90("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("sys:src;lisp;regression-tests;test-compile-file.lisp\00") : !llvm.array<53 x i8>
  llvm.mlir.global private constant @str92("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str94("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str95("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str96("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str97("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str100("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str101("sys:src;lisp;regression-tests;test-compile-file.lisp\00") : !llvm.array<53 x i8>
  llvm.mlir.global private constant @str102("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str103("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str104("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str105("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str108("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str110("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str111("show-test-summary\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str112("*__MLIR_BLOCK_RETFLAG_46573484507136*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str113("*__MLIR_BLOCK_RETMVLIST_46573484507136*\00") : !llvm.array<40 x i8>
}
