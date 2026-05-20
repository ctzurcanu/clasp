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
  func.func @"%FN%foo"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 3 : i64
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
    %38 = llvm.mlir.addressof @str4 : !llvm.ptr
    %39 = arith.constant 37 : i64
    %40 = func.call @cc_make_string(%38, %39) : (!llvm.ptr, i64) -> i64
    %41 = func.call @cc_nil_value() : () -> i64
    %42 = func.call @cc_intern(%40, %41) : (i64, i64) -> i64
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_cons(%42, %43) : (i64, i64) -> i64
    %45 = func.call @cc_values_pack(%44) : (i64) -> i64
    %46 = func.call @cc_set_symbol_value(%42, %37) : (i64, i64) -> i64
    %47 = llvm.mlir.addressof @str5 : !llvm.ptr
    %48 = arith.constant 38 : i64
    %49 = func.call @cc_make_string(%47, %48) : (!llvm.ptr, i64) -> i64
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_intern(%49, %50) : (i64, i64) -> i64
    %52 = func.call @cc_nil_value() : () -> i64
    %53 = func.call @cc_cons(%51, %52) : (i64, i64) -> i64
    %54 = func.call @cc_values_pack(%53) : (i64) -> i64
    %55 = func.call @cc_set_symbol_value(%51, %37) : (i64, i64) -> i64
    %56 = llvm.mlir.addressof @str6 : !llvm.ptr
    %57 = arith.constant 39 : i64
    %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
    %59 = func.call @cc_nil_value() : () -> i64
    %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
    %61 = func.call @cc_nil_value() : () -> i64
    %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
    %63 = func.call @cc_values_pack(%62) : (i64) -> i64
    %64 = func.call @cc_set_symbol_value(%60, %37) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %65 = func.call @stack_pop_pointer() : () -> i64
    %66 = func.call @cc_multiple_value_list(%65) : (i64) -> i64
    %67 = llvm.mlir.addressof @str7 : !llvm.ptr
    %68 = arith.constant 37 : i64
    %69 = func.call @cc_make_string(%67, %68) : (!llvm.ptr, i64) -> i64
    %70 = func.call @cc_nil_value() : () -> i64
    %71 = func.call @cc_intern(%69, %70) : (i64, i64) -> i64
    %72 = func.call @cc_nil_value() : () -> i64
    %73 = func.call @cc_cons(%71, %72) : (i64, i64) -> i64
    %74 = func.call @cc_values_pack(%73) : (i64) -> i64
    %75 = func.call @cc_symbol_value(%71) : (i64) -> i64
    %76 = llvm.mlir.addressof @str8 : !llvm.ptr
    %77 = arith.constant 38 : i64
    %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
    %79 = func.call @cc_nil_value() : () -> i64
    %80 = func.call @cc_intern(%78, %79) : (i64, i64) -> i64
    %81 = func.call @cc_nil_value() : () -> i64
    %82 = func.call @cc_cons(%80, %81) : (i64, i64) -> i64
    %83 = func.call @cc_values_pack(%82) : (i64) -> i64
    %84 = func.call @cc_symbol_value(%80) : (i64) -> i64
    %85 = llvm.mlir.addressof @str9 : !llvm.ptr
    %86 = arith.constant 39 : i64
    %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
    %88 = func.call @cc_nil_value() : () -> i64
    %89 = func.call @cc_intern(%87, %88) : (i64, i64) -> i64
    %90 = func.call @cc_nil_value() : () -> i64
    %91 = func.call @cc_cons(%89, %90) : (i64, i64) -> i64
    %92 = func.call @cc_values_pack(%91) : (i64) -> i64
    %93 = func.call @cc_symbol_value(%89) : (i64) -> i64
    %94 = func.call @cc_nil_value() : () -> i64
    %95 = arith.cmpi ne, %75, %94 : i64
    %96 = scf.if %95 -> (i64) {
      scf.yield %93 : i64
    } else {
      scf.yield %66 : i64
    }
    %97 = func.call @cc_values_pack(%96) : (i64) -> i64
    func.call @stack_push_pointer(%97) : (i64) -> ()
    %98 = func.call @stack_pop_pointer() : () -> i64
    %99 = func.call @cc_multiple_value_list(%98) : (i64) -> i64
    %100 = llvm.mlir.addressof @str10 : !llvm.ptr
    %101 = arith.constant 37 : i64
    %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = func.call @cc_intern(%102, %103) : (i64, i64) -> i64
    %105 = func.call @cc_nil_value() : () -> i64
    %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
    %107 = func.call @cc_values_pack(%106) : (i64) -> i64
    %108 = func.call @cc_symbol_value(%104) : (i64) -> i64
    %109 = llvm.mlir.addressof @str11 : !llvm.ptr
    %110 = arith.constant 39 : i64
    %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
    %112 = func.call @cc_nil_value() : () -> i64
    %113 = func.call @cc_intern(%111, %112) : (i64, i64) -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
    %116 = func.call @cc_values_pack(%115) : (i64) -> i64
    %117 = func.call @cc_symbol_value(%113) : (i64) -> i64
    %118 = func.call @cc_nil_value() : () -> i64
    %119 = arith.cmpi ne, %108, %118 : i64
    %120 = scf.if %119 -> (i64) {
      scf.yield %117 : i64
    } else {
      scf.yield %99 : i64
    }
    %121 = func.call @cc_values_pack(%120) : (i64) -> i64
    func.call @stack_push_pointer(%121) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%bar"() {
    %122 = llvm.mlir.addressof @str12 : !llvm.ptr
    %123 = arith.constant 3 : i64
    %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_intern(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_nil_value() : () -> i64
    %128 = func.call @cc_cons(%126, %127) : (i64, i64) -> i64
    %129 = func.call @cc_values_pack(%128) : (i64) -> i64
    %130 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%126, %130) : (i64, i64) -> ()
    %131 = func.call @cc_nil_value() : () -> i64
    %132 = llvm.mlir.addressof @str13 : !llvm.ptr
    %133 = arith.constant 37 : i64
    %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
    %135 = func.call @cc_nil_value() : () -> i64
    %136 = func.call @cc_intern(%134, %135) : (i64, i64) -> i64
    %137 = func.call @cc_nil_value() : () -> i64
    %138 = func.call @cc_cons(%136, %137) : (i64, i64) -> i64
    %139 = func.call @cc_values_pack(%138) : (i64) -> i64
    %140 = func.call @cc_set_symbol_value(%136, %131) : (i64, i64) -> i64
    %141 = llvm.mlir.addressof @str14 : !llvm.ptr
    %142 = arith.constant 38 : i64
    %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
    %144 = func.call @cc_nil_value() : () -> i64
    %145 = func.call @cc_intern(%143, %144) : (i64, i64) -> i64
    %146 = func.call @cc_nil_value() : () -> i64
    %147 = func.call @cc_cons(%145, %146) : (i64, i64) -> i64
    %148 = func.call @cc_values_pack(%147) : (i64) -> i64
    %149 = func.call @cc_set_symbol_value(%145, %131) : (i64, i64) -> i64
    %150 = llvm.mlir.addressof @str15 : !llvm.ptr
    %151 = arith.constant 39 : i64
    %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
    %153 = func.call @cc_nil_value() : () -> i64
    %154 = func.call @cc_intern(%152, %153) : (i64, i64) -> i64
    %155 = func.call @cc_nil_value() : () -> i64
    %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
    %157 = func.call @cc_values_pack(%156) : (i64) -> i64
    %158 = func.call @cc_set_symbol_value(%154, %131) : (i64, i64) -> i64
    %159 = func.call @cc_nil_value() : () -> i64
    %160 = llvm.mlir.addressof @str16 : !llvm.ptr
    %161 = arith.constant 37 : i64
    %162 = func.call @cc_make_string(%160, %161) : (!llvm.ptr, i64) -> i64
    %163 = func.call @cc_nil_value() : () -> i64
    %164 = func.call @cc_intern(%162, %163) : (i64, i64) -> i64
    %165 = func.call @cc_nil_value() : () -> i64
    %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
    %167 = func.call @cc_values_pack(%166) : (i64) -> i64
    %168 = func.call @cc_set_symbol_value(%164, %159) : (i64, i64) -> i64
    %169 = llvm.mlir.addressof @str17 : !llvm.ptr
    %170 = arith.constant 38 : i64
    %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
    %172 = func.call @cc_nil_value() : () -> i64
    %173 = func.call @cc_intern(%171, %172) : (i64, i64) -> i64
    %174 = func.call @cc_nil_value() : () -> i64
    %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
    %176 = func.call @cc_values_pack(%175) : (i64) -> i64
    %177 = func.call @cc_set_symbol_value(%173, %159) : (i64, i64) -> i64
    %178 = llvm.mlir.addressof @str18 : !llvm.ptr
    %179 = arith.constant 39 : i64
    %180 = func.call @cc_make_string(%178, %179) : (!llvm.ptr, i64) -> i64
    %181 = func.call @cc_nil_value() : () -> i64
    %182 = func.call @cc_intern(%180, %181) : (i64, i64) -> i64
    %183 = func.call @cc_nil_value() : () -> i64
    %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
    %185 = func.call @cc_values_pack(%184) : (i64) -> i64
    %186 = func.call @cc_set_symbol_value(%182, %159) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %187 = func.call @stack_pop_pointer() : () -> i64
    %188 = func.call @cc_multiple_value_list(%187) : (i64) -> i64
    %189 = llvm.mlir.addressof @str19 : !llvm.ptr
    %190 = arith.constant 37 : i64
    %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
    %192 = func.call @cc_nil_value() : () -> i64
    %193 = func.call @cc_intern(%191, %192) : (i64, i64) -> i64
    %194 = func.call @cc_nil_value() : () -> i64
    %195 = func.call @cc_cons(%193, %194) : (i64, i64) -> i64
    %196 = func.call @cc_values_pack(%195) : (i64) -> i64
    %197 = func.call @cc_symbol_value(%193) : (i64) -> i64
    %198 = llvm.mlir.addressof @str20 : !llvm.ptr
    %199 = arith.constant 38 : i64
    %200 = func.call @cc_make_string(%198, %199) : (!llvm.ptr, i64) -> i64
    %201 = func.call @cc_nil_value() : () -> i64
    %202 = func.call @cc_intern(%200, %201) : (i64, i64) -> i64
    %203 = func.call @cc_nil_value() : () -> i64
    %204 = func.call @cc_cons(%202, %203) : (i64, i64) -> i64
    %205 = func.call @cc_values_pack(%204) : (i64) -> i64
    %206 = func.call @cc_symbol_value(%202) : (i64) -> i64
    %207 = llvm.mlir.addressof @str21 : !llvm.ptr
    %208 = arith.constant 39 : i64
    %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
    %210 = func.call @cc_nil_value() : () -> i64
    %211 = func.call @cc_intern(%209, %210) : (i64, i64) -> i64
    %212 = func.call @cc_nil_value() : () -> i64
    %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
    %214 = func.call @cc_values_pack(%213) : (i64) -> i64
    %215 = func.call @cc_symbol_value(%211) : (i64) -> i64
    %216 = func.call @cc_nil_value() : () -> i64
    %217 = arith.cmpi ne, %197, %216 : i64
    %218 = scf.if %217 -> (i64) {
      scf.yield %215 : i64
    } else {
      scf.yield %188 : i64
    }
    %219 = func.call @cc_values_pack(%218) : (i64) -> i64
    func.call @stack_push_pointer(%219) : (i64) -> ()
    %220 = func.call @stack_pop_pointer() : () -> i64
    %221 = func.call @cc_multiple_value_list(%220) : (i64) -> i64
    %222 = llvm.mlir.addressof @str22 : !llvm.ptr
    %223 = arith.constant 37 : i64
    %224 = func.call @cc_make_string(%222, %223) : (!llvm.ptr, i64) -> i64
    %225 = func.call @cc_nil_value() : () -> i64
    %226 = func.call @cc_intern(%224, %225) : (i64, i64) -> i64
    %227 = func.call @cc_nil_value() : () -> i64
    %228 = func.call @cc_cons(%226, %227) : (i64, i64) -> i64
    %229 = func.call @cc_values_pack(%228) : (i64) -> i64
    %230 = func.call @cc_symbol_value(%226) : (i64) -> i64
    %231 = llvm.mlir.addressof @str23 : !llvm.ptr
    %232 = arith.constant 39 : i64
    %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
    %234 = func.call @cc_nil_value() : () -> i64
    %235 = func.call @cc_intern(%233, %234) : (i64, i64) -> i64
    %236 = func.call @cc_nil_value() : () -> i64
    %237 = func.call @cc_cons(%235, %236) : (i64, i64) -> i64
    %238 = func.call @cc_values_pack(%237) : (i64) -> i64
    %239 = func.call @cc_symbol_value(%235) : (i64) -> i64
    %240 = func.call @cc_nil_value() : () -> i64
    %241 = arith.cmpi ne, %230, %240 : i64
    %242 = scf.if %241 -> (i64) {
      scf.yield %239 : i64
    } else {
      scf.yield %221 : i64
    }
    %243 = func.call @cc_values_pack(%242) : (i64) -> i64
    func.call @stack_push_pointer(%243) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %244 = llvm.mlir.addressof @str24 : !llvm.ptr
    %245 = arith.constant 6 : i64
    %246 = func.call @cc_make_string(%244, %245) : (!llvm.ptr, i64) -> i64
    %247 = func.call @cc_nil_value() : () -> i64
    %248 = func.call @cc_intern(%246, %247) : (i64, i64) -> i64
    %249 = func.call @cc_nil_value() : () -> i64
    %250 = func.call @cc_cons(%248, %249) : (i64, i64) -> i64
    %251 = func.call @cc_values_pack(%250) : (i64) -> i64
    %252 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%248, %252) : (i64, i64) -> ()
    %253 = func.call @cc_nil_value() : () -> i64
    %254 = llvm.mlir.addressof @str25 : !llvm.ptr
    %255 = arith.constant 37 : i64
    %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
    %257 = func.call @cc_nil_value() : () -> i64
    %258 = func.call @cc_intern(%256, %257) : (i64, i64) -> i64
    %259 = func.call @cc_nil_value() : () -> i64
    %260 = func.call @cc_cons(%258, %259) : (i64, i64) -> i64
    %261 = func.call @cc_values_pack(%260) : (i64) -> i64
    %262 = func.call @cc_set_symbol_value(%258, %253) : (i64, i64) -> i64
    %263 = llvm.mlir.addressof @str26 : !llvm.ptr
    %264 = arith.constant 38 : i64
    %265 = func.call @cc_make_string(%263, %264) : (!llvm.ptr, i64) -> i64
    %266 = func.call @cc_nil_value() : () -> i64
    %267 = func.call @cc_intern(%265, %266) : (i64, i64) -> i64
    %268 = func.call @cc_nil_value() : () -> i64
    %269 = func.call @cc_cons(%267, %268) : (i64, i64) -> i64
    %270 = func.call @cc_values_pack(%269) : (i64) -> i64
    %271 = func.call @cc_set_symbol_value(%267, %253) : (i64, i64) -> i64
    %272 = llvm.mlir.addressof @str27 : !llvm.ptr
    %273 = arith.constant 39 : i64
    %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
    %275 = func.call @cc_nil_value() : () -> i64
    %276 = func.call @cc_intern(%274, %275) : (i64, i64) -> i64
    %277 = func.call @cc_nil_value() : () -> i64
    %278 = func.call @cc_cons(%276, %277) : (i64, i64) -> i64
    %279 = func.call @cc_values_pack(%278) : (i64) -> i64
    %280 = func.call @cc_set_symbol_value(%276, %253) : (i64, i64) -> i64
    %281 = func.call @cc_nil_value() : () -> i64
    %282 = func.call @cc_nil_value() : () -> i64
    %283 = func.call @cc_errorp(%281) : (i64) -> i64
    %284 = arith.cmpi ne, %283, %282 : i64
    %285 = scf.if %284 -> (i64) {
      scf.yield %281 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %286 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %287 = func.call @stack_pop_pointer() : () -> i64
      %288 = llvm.mlir.addressof @str28 : !llvm.ptr
      %289 = arith.constant 3 : i64
      %290 = func.call @cc_make_string(%288, %289) : (!llvm.ptr, i64) -> i64
      %291 = func.call @cc_nil_value() : () -> i64
      %292 = func.call @cc_intern(%290, %291) : (i64, i64) -> i64
      %293 = func.call @cc_nil_value() : () -> i64
      %294 = func.call @cc_cons(%292, %293) : (i64, i64) -> i64
      %295 = func.call @cc_values_pack(%294) : (i64) -> i64
      %296 = func.call @cc_defclass(%292, %286, %287) : (i64, i64, i64) -> i64
      %297 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %298 = func.call @stack_pop_pointer() : () -> i64
      %299 = func.call @stack_pop_pointer() : () -> i64
      %300 = func.call @cc_cons(%298, %299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%300) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %301 = func.call @stack_pop_pointer() : () -> i64
      %302 = func.call @stack_pop_pointer() : () -> i64
      %303 = func.call @cc_cons(%301, %302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%303) : (i64) -> ()
      %304 = llvm.mlir.addressof @str29 : !llvm.ptr
      %305 = arith.constant 3 : i64
      %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_intern(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_nil_value() : () -> i64
      %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
      %311 = func.call @cc_values_pack(%310) : (i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @stack_pop_pointer() : () -> i64
      %314 = func.call @cc_cons(%312, %313) : (i64, i64) -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      %315 = llvm.mlir.addressof @str30 : !llvm.ptr
      %316 = arith.constant 8 : i64
      %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
      %318 = func.call @cc_nil_value() : () -> i64
      %319 = func.call @cc_intern(%317, %318) : (i64, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_values_pack(%321) : (i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %326 = func.call @stack_pop_pointer() : () -> i64
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_cons(%326, %327) : (i64, i64) -> i64
      %329 = func.call @cc_eval(%328) : (i64) -> i64
      %330 = func.call @cc_multiple_value_list(%329) : (i64) -> i64
      %331 = func.call @cc_values_pack(%330) : (i64) -> i64
      func.call @stack_push_pointer(%331) : (i64) -> ()
      %332 = func.call @stack_depth() : () -> i64
      %333 = arith.constant 0 : i64
      %334 = arith.cmpi sgt, %332, %333 : i64
      scf.if %334 {
        %335 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%292) : (i64) -> ()
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @cc_nil_value() : () -> i64
      %338 = func.call @cc_errorp(%336) : (i64) -> i64
      %339 = arith.cmpi ne, %338, %337 : i64
      %340 = scf.if %339 -> (i64) {
        scf.yield %336 : i64
      } else {
        %413 = llvm.mlir.addressof @str38 : !llvm.ptr
        %414 = func.call @cc_make_function_ref_const(%413) : (!llvm.ptr) -> i64
        %415 = llvm.mlir.addressof @str39 : !llvm.ptr
        %416 = arith.constant 8 : i64
        %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
        %418 = func.call @cc_nil_value() : () -> i64
        %419 = func.call @cc_intern(%417, %418) : (i64, i64) -> i64
        %420 = func.call @cc_nil_value() : () -> i64
        %421 = func.call @cc_cons(%419, %420) : (i64, i64) -> i64
        %422 = func.call @cc_values_pack(%421) : (i64) -> i64
        %423 = func.call @cc_set_symbol_value(%419, %414) : (i64, i64) -> i64
        %424 = llvm.mlir.addressof @str40 : !llvm.ptr
        %425 = arith.constant 8 : i64
        %426 = func.call @cc_make_string(%424, %425) : (!llvm.ptr, i64) -> i64
        %427 = func.call @cc_nil_value() : () -> i64
        %428 = func.call @cc_intern(%426, %427) : (i64, i64) -> i64
        %429 = func.call @cc_nil_value() : () -> i64
        %430 = func.call @cc_cons(%428, %429) : (i64, i64) -> i64
        %431 = func.call @cc_values_pack(%430) : (i64) -> i64
        func.call @stack_push_pointer(%428) : (i64) -> ()
        %432 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %432 : i64
      }
      %433 = func.call @cc_nil_value() : () -> i64
      %434 = func.call @cc_errorp(%340) : (i64) -> i64
      %435 = arith.cmpi ne, %434, %433 : i64
      %436 = scf.if %435 -> (i64) {
        scf.yield %340 : i64
      } else {
        %497 = llvm.mlir.addressof @method_name_47888533028870 : !llvm.ptr
        %498 = func.call @cc_make_lambda_ref_str(%497) : (!llvm.ptr) -> i64
        %499 = llvm.mlir.addressof @str47 : !llvm.ptr
        %500 = arith.constant 14 : i64
        %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
        %502 = llvm.mlir.addressof @str48 : !llvm.ptr
        %503 = arith.constant 11 : i64
        %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
        %505 = func.call @cc_intern(%501, %504) : (i64, i64) -> i64
        %506 = func.call @cc_nil_value() : () -> i64
        %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
        %508 = func.call @cc_values_pack(%507) : (i64) -> i64
        %509 = func.call @cc_nil() : () -> i64
        %510 = llvm.mlir.addressof @str49 : !llvm.ptr
        %511 = arith.constant 1 : i64
        %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
        %513 = func.call @cc_nil_value() : () -> i64
        %514 = func.call @cc_intern(%512, %513) : (i64, i64) -> i64
        %515 = func.call @cc_nil_value() : () -> i64
        %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
        %517 = func.call @cc_values_pack(%516) : (i64) -> i64
        %518 = func.call @cc_cons(%514, %509) : (i64, i64) -> i64
        %519 = llvm.mlir.addressof @str50 : !llvm.ptr
        %520 = arith.constant 1 : i64
        %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
        %522 = func.call @cc_nil_value() : () -> i64
        %523 = func.call @cc_intern(%521, %522) : (i64, i64) -> i64
        %524 = func.call @cc_nil_value() : () -> i64
        %525 = func.call @cc_cons(%523, %524) : (i64, i64) -> i64
        %526 = func.call @cc_values_pack(%525) : (i64) -> i64
        %527 = func.call @cc_cons(%523, %518) : (i64, i64) -> i64
        %528 = llvm.mlir.addressof @str51 : !llvm.ptr
        %529 = arith.constant 3 : i64
        %530 = func.call @cc_make_string(%528, %529) : (!llvm.ptr, i64) -> i64
        %531 = func.call @cc_nil_value() : () -> i64
        %532 = func.call @cc_intern(%530, %531) : (i64, i64) -> i64
        %533 = func.call @cc_nil_value() : () -> i64
        %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
        %535 = func.call @cc_values_pack(%534) : (i64) -> i64
        %536 = func.call @cc_cons(%532, %527) : (i64, i64) -> i64
        %537 = arith.constant 3 : i64
        %538 = func.call @cc_box_fixnum(%537) : (i64) -> i64
        %539 = arith.constant 0 : i64
        %540 = func.call @cc_defmethod_qualified(%505, %536, %498, %538, %539) : (i64, i64, i64, i64, i64) -> i64
        %541 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%541) : (i64) -> ()
        %542 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%542) : (i64) -> ()
        %543 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%543) : (i64) -> ()
        %544 = llvm.mlir.addressof @str52 : !llvm.ptr
        %545 = arith.constant 3 : i64
        %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
        %547 = llvm.mlir.addressof @str53 : !llvm.ptr
        %548 = arith.constant 11 : i64
        %549 = func.call @cc_make_string(%547, %548) : (!llvm.ptr, i64) -> i64
        %550 = func.call @cc_intern(%546, %549) : (i64, i64) -> i64
        %551 = func.call @cc_nil_value() : () -> i64
        %552 = func.call @cc_cons(%550, %551) : (i64, i64) -> i64
        %553 = func.call @cc_values_pack(%552) : (i64) -> i64
        func.call @stack_push_pointer(%550) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %554 = func.call @stack_pop_pointer() : () -> i64
        %555 = func.call @stack_pop_pointer() : () -> i64
        %556 = func.call @cc_cons(%555, %554) : (i64, i64) -> i64
        func.call @stack_push_pointer(%556) : (i64) -> ()
        %557 = func.call @stack_pop_pointer() : () -> i64
        %558 = func.call @stack_pop_pointer() : () -> i64
        %559 = func.call @cc_cons(%558, %557) : (i64, i64) -> i64
        func.call @stack_push_pointer(%559) : (i64) -> ()
        %560 = func.call @stack_pop_pointer() : () -> i64
        %561 = func.call @stack_pop_pointer() : () -> i64
        %562 = func.call @cc_cons(%560, %561) : (i64, i64) -> i64
        %563 = llvm.mlir.addressof @str54 : !llvm.ptr
        %564 = arith.constant 5 : i64
        %565 = func.call @cc_make_string(%563, %564) : (!llvm.ptr, i64) -> i64
        %566 = func.call @cc_nil_value() : () -> i64
        %567 = func.call @cc_intern(%565, %566) : (i64, i64) -> i64
        %568 = func.call @cc_nil_value() : () -> i64
        %569 = func.call @cc_cons(%567, %568) : (i64, i64) -> i64
        %570 = func.call @cc_values_pack(%569) : (i64) -> i64
        %571 = func.call @cc_cons(%567, %562) : (i64, i64) -> i64
        func.call @stack_push_pointer(%571) : (i64) -> ()
        %572 = func.call @stack_pop_pointer() : () -> i64
        %573 = func.call @stack_pop_pointer() : () -> i64
        %574 = func.call @cc_cons(%572, %573) : (i64, i64) -> i64
        func.call @stack_push_pointer(%574) : (i64) -> ()
        %575 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%575) : (i64) -> ()
        %576 = llvm.mlir.addressof @str55 : !llvm.ptr
        %577 = arith.constant 3 : i64
        %578 = func.call @cc_make_string(%576, %577) : (!llvm.ptr, i64) -> i64
        %579 = llvm.mlir.addressof @str56 : !llvm.ptr
        %580 = arith.constant 11 : i64
        %581 = func.call @cc_make_string(%579, %580) : (!llvm.ptr, i64) -> i64
        %582 = func.call @cc_intern(%578, %581) : (i64, i64) -> i64
        %583 = func.call @cc_nil_value() : () -> i64
        %584 = func.call @cc_cons(%582, %583) : (i64, i64) -> i64
        %585 = func.call @cc_values_pack(%584) : (i64) -> i64
        func.call @stack_push_pointer(%582) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %586 = llvm.mlir.addressof @str57 : !llvm.ptr
        %587 = arith.constant 8 : i64
        %588 = func.call @cc_make_string(%586, %587) : (!llvm.ptr, i64) -> i64
        %589 = func.call @cc_nil_value() : () -> i64
        %590 = func.call @cc_intern(%588, %589) : (i64, i64) -> i64
        %591 = func.call @cc_nil_value() : () -> i64
        %592 = func.call @cc_cons(%590, %591) : (i64, i64) -> i64
        %593 = func.call @cc_values_pack(%592) : (i64) -> i64
        func.call @stack_push_pointer(%590) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %594 = func.call @stack_pop_pointer() : () -> i64
        %595 = func.call @stack_pop_pointer() : () -> i64
        %596 = func.call @cc_cons(%595, %594) : (i64, i64) -> i64
        func.call @stack_push_pointer(%596) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %597 = func.call @stack_pop_pointer() : () -> i64
        %598 = func.call @stack_pop_pointer() : () -> i64
        %599 = func.call @cc_cons(%598, %597) : (i64, i64) -> i64
        func.call @stack_push_pointer(%599) : (i64) -> ()
        %600 = func.call @stack_pop_pointer() : () -> i64
        %601 = func.call @stack_pop_pointer() : () -> i64
        %602 = func.call @cc_cons(%601, %600) : (i64, i64) -> i64
        func.call @stack_push_pointer(%602) : (i64) -> ()
        %603 = func.call @stack_pop_pointer() : () -> i64
        %604 = func.call @stack_pop_pointer() : () -> i64
        %605 = func.call @cc_cons(%604, %603) : (i64, i64) -> i64
        func.call @stack_push_pointer(%605) : (i64) -> ()
        %606 = func.call @stack_pop_pointer() : () -> i64
        %607 = func.call @stack_pop_pointer() : () -> i64
        %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
        %609 = llvm.mlir.addressof @str58 : !llvm.ptr
        %610 = arith.constant 5 : i64
        %611 = func.call @cc_make_string(%609, %610) : (!llvm.ptr, i64) -> i64
        %612 = func.call @cc_nil_value() : () -> i64
        %613 = func.call @cc_intern(%611, %612) : (i64, i64) -> i64
        %614 = func.call @cc_nil_value() : () -> i64
        %615 = func.call @cc_cons(%613, %614) : (i64, i64) -> i64
        %616 = func.call @cc_values_pack(%615) : (i64) -> i64
        %617 = func.call @cc_cons(%613, %608) : (i64, i64) -> i64
        func.call @stack_push_pointer(%617) : (i64) -> ()
        %618 = func.call @stack_pop_pointer() : () -> i64
        %619 = func.call @stack_pop_pointer() : () -> i64
        %620 = func.call @cc_cons(%618, %619) : (i64, i64) -> i64
        func.call @stack_push_pointer(%620) : (i64) -> ()
        %621 = llvm.mlir.addressof @str59 : !llvm.ptr
        %622 = arith.constant 6 : i64
        %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
        %624 = func.call @cc_nil_value() : () -> i64
        %625 = func.call @cc_intern(%623, %624) : (i64, i64) -> i64
        %626 = func.call @cc_nil_value() : () -> i64
        %627 = func.call @cc_cons(%625, %626) : (i64, i64) -> i64
        %628 = func.call @cc_values_pack(%627) : (i64) -> i64
        func.call @stack_push_pointer(%625) : (i64) -> ()
        %629 = func.call @stack_pop_pointer() : () -> i64
        %630 = func.call @stack_pop_pointer() : () -> i64
        %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
        func.call @stack_push_pointer(%631) : (i64) -> ()
        %632 = func.call @stack_pop_pointer() : () -> i64
        %633 = func.call @stack_pop_pointer() : () -> i64
        %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
        func.call @stack_push_pointer(%634) : (i64) -> ()
        %635 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%635) : (i64) -> ()
        %636 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%636) : (i64) -> ()
        %637 = llvm.mlir.addressof @str60 : !llvm.ptr
        %638 = arith.constant 3 : i64
        %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
        %640 = func.call @cc_nil_value() : () -> i64
        %641 = func.call @cc_intern(%639, %640) : (i64, i64) -> i64
        %642 = func.call @cc_nil_value() : () -> i64
        %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
        %644 = func.call @cc_values_pack(%643) : (i64) -> i64
        func.call @stack_push_pointer(%641) : (i64) -> ()
        %645 = func.call @stack_pop_pointer() : () -> i64
        %646 = func.call @stack_pop_pointer() : () -> i64
        %647 = func.call @cc_cons(%645, %646) : (i64, i64) -> i64
        func.call @stack_push_pointer(%647) : (i64) -> ()
        %648 = llvm.mlir.addressof @str61 : !llvm.ptr
        %649 = arith.constant 6 : i64
        %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
        %651 = llvm.mlir.addressof @str62 : !llvm.ptr
        %652 = arith.constant 11 : i64
        %653 = func.call @cc_make_string(%651, %652) : (!llvm.ptr, i64) -> i64
        %654 = func.call @cc_intern(%650, %653) : (i64, i64) -> i64
        %655 = func.call @cc_nil_value() : () -> i64
        %656 = func.call @cc_cons(%654, %655) : (i64, i64) -> i64
        %657 = func.call @cc_values_pack(%656) : (i64) -> i64
        func.call @stack_push_pointer(%654) : (i64) -> ()
        %658 = func.call @stack_pop_pointer() : () -> i64
        %659 = func.call @stack_pop_pointer() : () -> i64
        %660 = func.call @cc_cons(%658, %659) : (i64, i64) -> i64
        func.call @stack_push_pointer(%660) : (i64) -> ()
        %661 = func.call @stack_pop_pointer() : () -> i64
        %662 = func.call @stack_pop_pointer() : () -> i64
        %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
        func.call @stack_push_pointer(%663) : (i64) -> ()
        %664 = llvm.mlir.addressof @str63 : !llvm.ptr
        %665 = arith.constant 7 : i64
        %666 = func.call @cc_make_string(%664, %665) : (!llvm.ptr, i64) -> i64
        %667 = llvm.mlir.addressof @str64 : !llvm.ptr
        %668 = arith.constant 11 : i64
        %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
        %670 = func.call @cc_intern(%666, %669) : (i64, i64) -> i64
        %671 = func.call @cc_nil_value() : () -> i64
        %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
        %673 = func.call @cc_values_pack(%672) : (i64) -> i64
        func.call @stack_push_pointer(%670) : (i64) -> ()
        %674 = func.call @stack_pop_pointer() : () -> i64
        %675 = func.call @stack_pop_pointer() : () -> i64
        %676 = func.call @cc_cons(%674, %675) : (i64, i64) -> i64
        func.call @stack_push_pointer(%676) : (i64) -> ()
        %677 = func.call @stack_pop_pointer() : () -> i64
        %678 = func.call @stack_pop_pointer() : () -> i64
        %679 = func.call @cc_cons(%677, %678) : (i64, i64) -> i64
        func.call @stack_push_pointer(%679) : (i64) -> ()
        %680 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%680) : (i64) -> ()
        %681 = llvm.mlir.addressof @str65 : !llvm.ptr
        %682 = arith.constant 3 : i64
        %683 = func.call @cc_make_string(%681, %682) : (!llvm.ptr, i64) -> i64
        %684 = func.call @cc_nil_value() : () -> i64
        %685 = func.call @cc_intern(%683, %684) : (i64, i64) -> i64
        %686 = func.call @cc_nil_value() : () -> i64
        %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
        %688 = func.call @cc_values_pack(%687) : (i64) -> i64
        func.call @stack_push_pointer(%685) : (i64) -> ()
        %689 = func.call @stack_pop_pointer() : () -> i64
        %690 = func.call @stack_pop_pointer() : () -> i64
        %691 = func.call @cc_cons(%689, %690) : (i64, i64) -> i64
        func.call @stack_push_pointer(%691) : (i64) -> ()
        %692 = llvm.mlir.addressof @str66 : !llvm.ptr
        %693 = arith.constant 9 : i64
        %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
        %695 = llvm.mlir.addressof @str67 : !llvm.ptr
        %696 = arith.constant 11 : i64
        %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
        %698 = func.call @cc_intern(%694, %697) : (i64, i64) -> i64
        %699 = func.call @cc_nil_value() : () -> i64
        %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
        %701 = func.call @cc_values_pack(%700) : (i64) -> i64
        func.call @stack_push_pointer(%698) : (i64) -> ()
        %702 = func.call @stack_pop_pointer() : () -> i64
        %703 = func.call @stack_pop_pointer() : () -> i64
        %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
        func.call @stack_push_pointer(%704) : (i64) -> ()
        %705 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%705) : (i64) -> ()
        %706 = llvm.mlir.addressof @str68 : !llvm.ptr
        %707 = arith.constant 3 : i64
        %708 = func.call @cc_make_string(%706, %707) : (!llvm.ptr, i64) -> i64
        %709 = func.call @cc_nil_value() : () -> i64
        %710 = func.call @cc_intern(%708, %709) : (i64, i64) -> i64
        %711 = func.call @cc_nil_value() : () -> i64
        %712 = func.call @cc_cons(%710, %711) : (i64, i64) -> i64
        %713 = func.call @cc_values_pack(%712) : (i64) -> i64
        func.call @stack_push_pointer(%710) : (i64) -> ()
        %714 = func.call @stack_pop_pointer() : () -> i64
        %715 = func.call @stack_pop_pointer() : () -> i64
        %716 = func.call @cc_cons(%714, %715) : (i64, i64) -> i64
        func.call @stack_push_pointer(%716) : (i64) -> ()
        %717 = llvm.mlir.addressof @str69 : !llvm.ptr
        %718 = arith.constant 1 : i64
        %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
        %720 = func.call @cc_nil_value() : () -> i64
        %721 = func.call @cc_intern(%719, %720) : (i64, i64) -> i64
        %722 = func.call @cc_nil_value() : () -> i64
        %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
        %724 = func.call @cc_values_pack(%723) : (i64) -> i64
        func.call @stack_push_pointer(%721) : (i64) -> ()
        %725 = func.call @stack_pop_pointer() : () -> i64
        %726 = func.call @stack_pop_pointer() : () -> i64
        %727 = func.call @cc_cons(%725, %726) : (i64, i64) -> i64
        func.call @stack_push_pointer(%727) : (i64) -> ()
        %728 = func.call @stack_pop_pointer() : () -> i64
        %729 = func.call @stack_pop_pointer() : () -> i64
        %730 = func.call @cc_cons(%728, %729) : (i64, i64) -> i64
        func.call @stack_push_pointer(%730) : (i64) -> ()
        %731 = func.call @stack_pop_pointer() : () -> i64
        %732 = func.call @stack_pop_pointer() : () -> i64
        %733 = func.call @cc_cons(%731, %732) : (i64, i64) -> i64
        func.call @stack_push_pointer(%733) : (i64) -> ()
        %734 = llvm.mlir.addressof @str70 : !llvm.ptr
        %735 = arith.constant 14 : i64
        %736 = func.call @cc_make_string(%734, %735) : (!llvm.ptr, i64) -> i64
        %737 = llvm.mlir.addressof @str71 : !llvm.ptr
        %738 = arith.constant 11 : i64
        %739 = func.call @cc_make_string(%737, %738) : (!llvm.ptr, i64) -> i64
        %740 = func.call @cc_intern(%736, %739) : (i64, i64) -> i64
        %741 = func.call @cc_nil_value() : () -> i64
        %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
        %743 = func.call @cc_values_pack(%742) : (i64) -> i64
        func.call @stack_push_pointer(%740) : (i64) -> ()
        %744 = func.call @stack_pop_pointer() : () -> i64
        %745 = func.call @stack_pop_pointer() : () -> i64
        %746 = func.call @cc_cons(%744, %745) : (i64, i64) -> i64
        func.call @stack_push_pointer(%746) : (i64) -> ()
        %747 = llvm.mlir.addressof @str72 : !llvm.ptr
        %748 = arith.constant 9 : i64
        %749 = func.call @cc_make_string(%747, %748) : (!llvm.ptr, i64) -> i64
        %750 = func.call @cc_nil_value() : () -> i64
        %751 = func.call @cc_intern(%749, %750) : (i64, i64) -> i64
        %752 = func.call @cc_nil_value() : () -> i64
        %753 = func.call @cc_cons(%751, %752) : (i64, i64) -> i64
        %754 = func.call @cc_values_pack(%753) : (i64) -> i64
        func.call @stack_push_pointer(%751) : (i64) -> ()
        %755 = func.call @stack_pop_pointer() : () -> i64
        %756 = func.call @stack_pop_pointer() : () -> i64
        %757 = func.call @cc_cons(%755, %756) : (i64, i64) -> i64
        func.call @stack_push_pointer(%757) : (i64) -> ()
        %758 = func.call @stack_pop_pointer() : () -> i64
        %759 = func.call @cc_nil_value() : () -> i64
        %760 = func.call @cc_cons(%758, %759) : (i64, i64) -> i64
        %761 = func.call @cc_eval(%760) : (i64) -> i64
        %762 = func.call @cc_multiple_value_list(%761) : (i64) -> i64
        %763 = func.call @cc_values_pack(%762) : (i64) -> i64
        func.call @stack_push_pointer(%763) : (i64) -> ()
        %764 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %764 : i64
      }
      func.call @stack_push_pointer(%436) : (i64) -> ()
      %765 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %765 : i64
    }
    %766 = func.call @cc_nil_value() : () -> i64
    %767 = func.call @cc_errorp(%285) : (i64) -> i64
    %768 = arith.cmpi ne, %767, %766 : i64
    %769 = scf.if %768 -> (i64) {
      scf.yield %285 : i64
    } else {
      %770 = llvm.mlir.addressof @str73 : !llvm.ptr
      %771 = func.call @cc_make_function_ref_const(%770) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%771) : (i64) -> ()
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = llvm.mlir.addressof @str74 : !llvm.ptr
      %774 = arith.constant 3 : i64
      %775 = func.call @cc_make_string(%773, %774) : (!llvm.ptr, i64) -> i64
      %776 = llvm.mlir.addressof @str75 : !llvm.ptr
      %777 = arith.constant 20 : i64
      %778 = func.call @cc_make_string(%776, %777) : (!llvm.ptr, i64) -> i64
      %779 = func.call @cc_intern(%775, %778) : (i64, i64) -> i64
      %780 = func.call @cc_nil_value() : () -> i64
      %781 = func.call @cc_cons(%779, %780) : (i64, i64) -> i64
      %782 = func.call @cc_values_pack(%781) : (i64) -> i64
      %783 = func.call @cc_set_symbol_value(%779, %772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%772) : (i64) -> ()
      %784 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %784 : i64
    }
    %785 = func.call @cc_nil_value() : () -> i64
    %786 = func.call @cc_errorp(%769) : (i64) -> i64
    %787 = arith.cmpi ne, %786, %785 : i64
    %788 = scf.if %787 -> (i64) {
      scf.yield %769 : i64
    } else {
      %789 = llvm.mlir.addressof @str76 : !llvm.ptr
      %790 = func.call @cc_make_function_ref_const(%789) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = llvm.mlir.addressof @str77 : !llvm.ptr
      %793 = arith.constant 3 : i64
      %794 = func.call @cc_make_string(%792, %793) : (!llvm.ptr, i64) -> i64
      %795 = llvm.mlir.addressof @str78 : !llvm.ptr
      %796 = arith.constant 20 : i64
      %797 = func.call @cc_make_string(%795, %796) : (!llvm.ptr, i64) -> i64
      %798 = func.call @cc_intern(%794, %797) : (i64, i64) -> i64
      %799 = func.call @cc_nil_value() : () -> i64
      %800 = func.call @cc_cons(%798, %799) : (i64, i64) -> i64
      %801 = func.call @cc_values_pack(%800) : (i64) -> i64
      %802 = func.call @cc_set_symbol_value(%798, %791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%791) : (i64) -> ()
      %803 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %803 : i64
    }
    %804 = func.call @cc_nil_value() : () -> i64
    %805 = func.call @cc_errorp(%788) : (i64) -> i64
    %806 = arith.cmpi ne, %805, %804 : i64
    %807 = scf.if %806 -> (i64) {
      scf.yield %788 : i64
    } else {
      %808 = llvm.mlir.addressof @str79 : !llvm.ptr
      %809 = func.call @cc_make_function_ref_const(%808) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%809) : (i64) -> ()
      %810 = func.call @stack_pop_pointer() : () -> i64
      %811 = llvm.mlir.addressof @str80 : !llvm.ptr
      %812 = arith.constant 3 : i64
      %813 = func.call @cc_make_string(%811, %812) : (!llvm.ptr, i64) -> i64
      %814 = llvm.mlir.addressof @str81 : !llvm.ptr
      %815 = arith.constant 20 : i64
      %816 = func.call @cc_make_string(%814, %815) : (!llvm.ptr, i64) -> i64
      %817 = func.call @cc_intern(%813, %816) : (i64, i64) -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_cons(%817, %818) : (i64, i64) -> i64
      %820 = func.call @cc_values_pack(%819) : (i64) -> i64
      %821 = func.call @cc_set_symbol_value(%817, %810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%810) : (i64) -> ()
      %822 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %822 : i64
    }
    %823 = func.call @cc_nil_value() : () -> i64
    %824 = func.call @cc_errorp(%807) : (i64) -> i64
    %825 = arith.cmpi ne, %824, %823 : i64
    %826 = scf.if %825 -> (i64) {
      scf.yield %807 : i64
    } else {
      %827 = llvm.mlir.addressof @str82 : !llvm.ptr
      %828 = func.call @cc_make_function_ref_const(%827) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%828) : (i64) -> ()
      %829 = func.call @stack_pop_pointer() : () -> i64
      %830 = llvm.mlir.addressof @str83 : !llvm.ptr
      %831 = arith.constant 3 : i64
      %832 = func.call @cc_make_string(%830, %831) : (!llvm.ptr, i64) -> i64
      %833 = llvm.mlir.addressof @str84 : !llvm.ptr
      %834 = arith.constant 20 : i64
      %835 = func.call @cc_make_string(%833, %834) : (!llvm.ptr, i64) -> i64
      %836 = func.call @cc_intern(%832, %835) : (i64, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_values_pack(%838) : (i64) -> i64
      %840 = func.call @cc_set_symbol_value(%836, %829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %841 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %841 : i64
    }
    %842 = func.call @cc_nil_value() : () -> i64
    %843 = func.call @cc_errorp(%826) : (i64) -> i64
    %844 = arith.cmpi ne, %843, %842 : i64
    %845 = scf.if %844 -> (i64) {
      scf.yield %826 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = llvm.mlir.addressof @str85 : !llvm.ptr
      %849 = arith.constant 3 : i64
      %850 = func.call @cc_make_string(%848, %849) : (!llvm.ptr, i64) -> i64
      %851 = func.call @cc_nil_value() : () -> i64
      %852 = func.call @cc_intern(%850, %851) : (i64, i64) -> i64
      %853 = func.call @cc_nil_value() : () -> i64
      %854 = func.call @cc_cons(%852, %853) : (i64, i64) -> i64
      %855 = func.call @cc_values_pack(%854) : (i64) -> i64
      %856 = func.call @cc_defclass(%852, %846, %847) : (i64, i64, i64) -> i64
      %857 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%857) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %858 = func.call @stack_pop_pointer() : () -> i64
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @cc_cons(%858, %859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%860) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %861 = func.call @stack_pop_pointer() : () -> i64
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @cc_cons(%861, %862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%863) : (i64) -> ()
      %864 = llvm.mlir.addressof @str86 : !llvm.ptr
      %865 = arith.constant 3 : i64
      %866 = func.call @cc_make_string(%864, %865) : (!llvm.ptr, i64) -> i64
      %867 = func.call @cc_nil_value() : () -> i64
      %868 = func.call @cc_intern(%866, %867) : (i64, i64) -> i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_cons(%868, %869) : (i64, i64) -> i64
      %871 = func.call @cc_values_pack(%870) : (i64) -> i64
      func.call @stack_push_pointer(%868) : (i64) -> ()
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = func.call @stack_pop_pointer() : () -> i64
      %874 = func.call @cc_cons(%872, %873) : (i64, i64) -> i64
      func.call @stack_push_pointer(%874) : (i64) -> ()
      %875 = llvm.mlir.addressof @str87 : !llvm.ptr
      %876 = arith.constant 8 : i64
      %877 = func.call @cc_make_string(%875, %876) : (!llvm.ptr, i64) -> i64
      %878 = func.call @cc_nil_value() : () -> i64
      %879 = func.call @cc_intern(%877, %878) : (i64, i64) -> i64
      %880 = func.call @cc_nil_value() : () -> i64
      %881 = func.call @cc_cons(%879, %880) : (i64, i64) -> i64
      %882 = func.call @cc_values_pack(%881) : (i64) -> i64
      func.call @stack_push_pointer(%879) : (i64) -> ()
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = func.call @stack_pop_pointer() : () -> i64
      %885 = func.call @cc_cons(%883, %884) : (i64, i64) -> i64
      func.call @stack_push_pointer(%885) : (i64) -> ()
      %886 = func.call @stack_pop_pointer() : () -> i64
      %887 = func.call @cc_nil_value() : () -> i64
      %888 = func.call @cc_cons(%886, %887) : (i64, i64) -> i64
      %889 = func.call @cc_eval(%888) : (i64) -> i64
      %890 = func.call @cc_multiple_value_list(%889) : (i64) -> i64
      %891 = func.call @cc_values_pack(%890) : (i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      %892 = func.call @stack_depth() : () -> i64
      %893 = arith.constant 0 : i64
      %894 = arith.cmpi sgt, %892, %893 : i64
      scf.if %894 {
        %895 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%852) : (i64) -> ()
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_nil_value() : () -> i64
      %898 = func.call @cc_errorp(%896) : (i64) -> i64
      %899 = arith.cmpi ne, %898, %897 : i64
      %900 = scf.if %899 -> (i64) {
        scf.yield %896 : i64
      } else {
        %973 = llvm.mlir.addressof @str95 : !llvm.ptr
        %974 = func.call @cc_make_function_ref_const(%973) : (!llvm.ptr) -> i64
        %975 = llvm.mlir.addressof @str96 : !llvm.ptr
        %976 = arith.constant 8 : i64
        %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
        %978 = func.call @cc_nil_value() : () -> i64
        %979 = func.call @cc_intern(%977, %978) : (i64, i64) -> i64
        %980 = func.call @cc_nil_value() : () -> i64
        %981 = func.call @cc_cons(%979, %980) : (i64, i64) -> i64
        %982 = func.call @cc_values_pack(%981) : (i64) -> i64
        %983 = func.call @cc_set_symbol_value(%979, %974) : (i64, i64) -> i64
        %984 = llvm.mlir.addressof @str97 : !llvm.ptr
        %985 = arith.constant 8 : i64
        %986 = func.call @cc_make_string(%984, %985) : (!llvm.ptr, i64) -> i64
        %987 = func.call @cc_nil_value() : () -> i64
        %988 = func.call @cc_intern(%986, %987) : (i64, i64) -> i64
        %989 = func.call @cc_nil_value() : () -> i64
        %990 = func.call @cc_cons(%988, %989) : (i64, i64) -> i64
        %991 = func.call @cc_values_pack(%990) : (i64) -> i64
        func.call @stack_push_pointer(%988) : (i64) -> ()
        %992 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %992 : i64
      }
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_errorp(%900) : (i64) -> i64
      %995 = arith.cmpi ne, %994, %993 : i64
      %996 = scf.if %995 -> (i64) {
        scf.yield %900 : i64
      } else {
        %1033 = llvm.mlir.addressof @method_name_47888533028872 : !llvm.ptr
        %1034 = func.call @cc_make_lambda_ref_str(%1033) : (!llvm.ptr) -> i64
        %1035 = llvm.mlir.addressof @str102 : !llvm.ptr
        %1036 = arith.constant 14 : i64
        %1037 = func.call @cc_make_string(%1035, %1036) : (!llvm.ptr, i64) -> i64
        %1038 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1039 = arith.constant 11 : i64
        %1040 = func.call @cc_make_string(%1038, %1039) : (!llvm.ptr, i64) -> i64
        %1041 = func.call @cc_intern(%1037, %1040) : (i64, i64) -> i64
        %1042 = func.call @cc_nil_value() : () -> i64
        %1043 = func.call @cc_cons(%1041, %1042) : (i64, i64) -> i64
        %1044 = func.call @cc_values_pack(%1043) : (i64) -> i64
        %1045 = func.call @cc_nil() : () -> i64
        %1046 = llvm.mlir.addressof @str104 : !llvm.ptr
        %1047 = arith.constant 1 : i64
        %1048 = func.call @cc_make_string(%1046, %1047) : (!llvm.ptr, i64) -> i64
        %1049 = func.call @cc_nil_value() : () -> i64
        %1050 = func.call @cc_intern(%1048, %1049) : (i64, i64) -> i64
        %1051 = func.call @cc_nil_value() : () -> i64
        %1052 = func.call @cc_cons(%1050, %1051) : (i64, i64) -> i64
        %1053 = func.call @cc_values_pack(%1052) : (i64) -> i64
        %1054 = func.call @cc_cons(%1050, %1045) : (i64, i64) -> i64
        %1055 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1056 = arith.constant 1 : i64
        %1057 = func.call @cc_make_string(%1055, %1056) : (!llvm.ptr, i64) -> i64
        %1058 = func.call @cc_nil_value() : () -> i64
        %1059 = func.call @cc_intern(%1057, %1058) : (i64, i64) -> i64
        %1060 = func.call @cc_nil_value() : () -> i64
        %1061 = func.call @cc_cons(%1059, %1060) : (i64, i64) -> i64
        %1062 = func.call @cc_values_pack(%1061) : (i64) -> i64
        %1063 = func.call @cc_cons(%1059, %1054) : (i64, i64) -> i64
        %1064 = llvm.mlir.addressof @str106 : !llvm.ptr
        %1065 = arith.constant 3 : i64
        %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
        %1067 = func.call @cc_nil_value() : () -> i64
        %1068 = func.call @cc_intern(%1066, %1067) : (i64, i64) -> i64
        %1069 = func.call @cc_nil_value() : () -> i64
        %1070 = func.call @cc_cons(%1068, %1069) : (i64, i64) -> i64
        %1071 = func.call @cc_values_pack(%1070) : (i64) -> i64
        %1072 = func.call @cc_cons(%1068, %1063) : (i64, i64) -> i64
        %1073 = arith.constant 3 : i64
        %1074 = func.call @cc_box_fixnum(%1073) : (i64) -> i64
        %1075 = arith.constant 0 : i64
        %1076 = func.call @cc_defmethod_qualified(%1041, %1072, %1034, %1074, %1075) : (i64, i64, i64, i64, i64) -> i64
        %1077 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1077) : (i64) -> ()
        %1078 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1078) : (i64) -> ()
        %1079 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1080 = arith.constant 3 : i64
        %1081 = func.call @cc_make_string(%1079, %1080) : (!llvm.ptr, i64) -> i64
        %1082 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1083 = arith.constant 11 : i64
        %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
        %1085 = func.call @cc_intern(%1081, %1084) : (i64, i64) -> i64
        %1086 = func.call @cc_nil_value() : () -> i64
        %1087 = func.call @cc_cons(%1085, %1086) : (i64, i64) -> i64
        %1088 = func.call @cc_values_pack(%1087) : (i64) -> i64
        func.call @stack_push_pointer(%1085) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1089 = llvm.mlir.addressof @str109 : !llvm.ptr
        %1090 = arith.constant 8 : i64
        %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
        %1092 = func.call @cc_nil_value() : () -> i64
        %1093 = func.call @cc_intern(%1091, %1092) : (i64, i64) -> i64
        %1094 = func.call @cc_nil_value() : () -> i64
        %1095 = func.call @cc_cons(%1093, %1094) : (i64, i64) -> i64
        %1096 = func.call @cc_values_pack(%1095) : (i64) -> i64
        func.call @stack_push_pointer(%1093) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1097 = func.call @stack_pop_pointer() : () -> i64
        %1098 = func.call @stack_pop_pointer() : () -> i64
        %1099 = func.call @cc_cons(%1098, %1097) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1099) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %1100 = func.call @stack_pop_pointer() : () -> i64
        %1101 = func.call @stack_pop_pointer() : () -> i64
        %1102 = func.call @cc_cons(%1101, %1100) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1102) : (i64) -> ()
        %1103 = func.call @stack_pop_pointer() : () -> i64
        %1104 = func.call @stack_pop_pointer() : () -> i64
        %1105 = func.call @cc_cons(%1104, %1103) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1105) : (i64) -> ()
        %1106 = func.call @stack_pop_pointer() : () -> i64
        %1107 = func.call @stack_pop_pointer() : () -> i64
        %1108 = func.call @cc_cons(%1107, %1106) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1108) : (i64) -> ()
        %1109 = func.call @stack_pop_pointer() : () -> i64
        %1110 = func.call @stack_pop_pointer() : () -> i64
        %1111 = func.call @cc_cons(%1109, %1110) : (i64, i64) -> i64
        %1112 = llvm.mlir.addressof @str110 : !llvm.ptr
        %1113 = arith.constant 5 : i64
        %1114 = func.call @cc_make_string(%1112, %1113) : (!llvm.ptr, i64) -> i64
        %1115 = func.call @cc_nil_value() : () -> i64
        %1116 = func.call @cc_intern(%1114, %1115) : (i64, i64) -> i64
        %1117 = func.call @cc_nil_value() : () -> i64
        %1118 = func.call @cc_cons(%1116, %1117) : (i64, i64) -> i64
        %1119 = func.call @cc_values_pack(%1118) : (i64) -> i64
        %1120 = func.call @cc_cons(%1116, %1111) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1120) : (i64) -> ()
        %1121 = func.call @stack_pop_pointer() : () -> i64
        %1122 = func.call @stack_pop_pointer() : () -> i64
        %1123 = func.call @cc_cons(%1121, %1122) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1123) : (i64) -> ()
        %1124 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1124) : (i64) -> ()
        %1125 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1125) : (i64) -> ()
        %1126 = llvm.mlir.addressof @str111 : !llvm.ptr
        %1127 = arith.constant 3 : i64
        %1128 = func.call @cc_make_string(%1126, %1127) : (!llvm.ptr, i64) -> i64
        %1129 = func.call @cc_nil_value() : () -> i64
        %1130 = func.call @cc_intern(%1128, %1129) : (i64, i64) -> i64
        %1131 = func.call @cc_nil_value() : () -> i64
        %1132 = func.call @cc_cons(%1130, %1131) : (i64, i64) -> i64
        %1133 = func.call @cc_values_pack(%1132) : (i64) -> i64
        func.call @stack_push_pointer(%1130) : (i64) -> ()
        %1134 = func.call @stack_pop_pointer() : () -> i64
        %1135 = func.call @stack_pop_pointer() : () -> i64
        %1136 = func.call @cc_cons(%1134, %1135) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1136) : (i64) -> ()
        %1137 = llvm.mlir.addressof @str112 : !llvm.ptr
        %1138 = arith.constant 6 : i64
        %1139 = func.call @cc_make_string(%1137, %1138) : (!llvm.ptr, i64) -> i64
        %1140 = llvm.mlir.addressof @str113 : !llvm.ptr
        %1141 = arith.constant 11 : i64
        %1142 = func.call @cc_make_string(%1140, %1141) : (!llvm.ptr, i64) -> i64
        %1143 = func.call @cc_intern(%1139, %1142) : (i64, i64) -> i64
        %1144 = func.call @cc_nil_value() : () -> i64
        %1145 = func.call @cc_cons(%1143, %1144) : (i64, i64) -> i64
        %1146 = func.call @cc_values_pack(%1145) : (i64) -> i64
        func.call @stack_push_pointer(%1143) : (i64) -> ()
        %1147 = func.call @stack_pop_pointer() : () -> i64
        %1148 = func.call @stack_pop_pointer() : () -> i64
        %1149 = func.call @cc_cons(%1147, %1148) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1149) : (i64) -> ()
        %1150 = func.call @stack_pop_pointer() : () -> i64
        %1151 = func.call @stack_pop_pointer() : () -> i64
        %1152 = func.call @cc_cons(%1150, %1151) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1152) : (i64) -> ()
        %1153 = llvm.mlir.addressof @str114 : !llvm.ptr
        %1154 = arith.constant 7 : i64
        %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
        %1156 = llvm.mlir.addressof @str115 : !llvm.ptr
        %1157 = arith.constant 11 : i64
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
        %1166 = func.call @stack_pop_pointer() : () -> i64
        %1167 = func.call @stack_pop_pointer() : () -> i64
        %1168 = func.call @cc_cons(%1166, %1167) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1168) : (i64) -> ()
        %1169 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1169) : (i64) -> ()
        %1170 = llvm.mlir.addressof @str116 : !llvm.ptr
        %1171 = arith.constant 3 : i64
        %1172 = func.call @cc_make_string(%1170, %1171) : (!llvm.ptr, i64) -> i64
        %1173 = func.call @cc_nil_value() : () -> i64
        %1174 = func.call @cc_intern(%1172, %1173) : (i64, i64) -> i64
        %1175 = func.call @cc_nil_value() : () -> i64
        %1176 = func.call @cc_cons(%1174, %1175) : (i64, i64) -> i64
        %1177 = func.call @cc_values_pack(%1176) : (i64) -> i64
        func.call @stack_push_pointer(%1174) : (i64) -> ()
        %1178 = func.call @stack_pop_pointer() : () -> i64
        %1179 = func.call @stack_pop_pointer() : () -> i64
        %1180 = func.call @cc_cons(%1178, %1179) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1180) : (i64) -> ()
        %1181 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1182 = arith.constant 9 : i64
        %1183 = func.call @cc_make_string(%1181, %1182) : (!llvm.ptr, i64) -> i64
        %1184 = llvm.mlir.addressof @str118 : !llvm.ptr
        %1185 = arith.constant 11 : i64
        %1186 = func.call @cc_make_string(%1184, %1185) : (!llvm.ptr, i64) -> i64
        %1187 = func.call @cc_intern(%1183, %1186) : (i64, i64) -> i64
        %1188 = func.call @cc_nil_value() : () -> i64
        %1189 = func.call @cc_cons(%1187, %1188) : (i64, i64) -> i64
        %1190 = func.call @cc_values_pack(%1189) : (i64) -> i64
        func.call @stack_push_pointer(%1187) : (i64) -> ()
        %1191 = func.call @stack_pop_pointer() : () -> i64
        %1192 = func.call @stack_pop_pointer() : () -> i64
        %1193 = func.call @cc_cons(%1191, %1192) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1193) : (i64) -> ()
        %1194 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1194) : (i64) -> ()
        %1195 = llvm.mlir.addressof @str119 : !llvm.ptr
        %1196 = arith.constant 3 : i64
        %1197 = func.call @cc_make_string(%1195, %1196) : (!llvm.ptr, i64) -> i64
        %1198 = func.call @cc_nil_value() : () -> i64
        %1199 = func.call @cc_intern(%1197, %1198) : (i64, i64) -> i64
        %1200 = func.call @cc_nil_value() : () -> i64
        %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
        %1202 = func.call @cc_values_pack(%1201) : (i64) -> i64
        func.call @stack_push_pointer(%1199) : (i64) -> ()
        %1203 = func.call @stack_pop_pointer() : () -> i64
        %1204 = func.call @stack_pop_pointer() : () -> i64
        %1205 = func.call @cc_cons(%1203, %1204) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1205) : (i64) -> ()
        %1206 = llvm.mlir.addressof @str120 : !llvm.ptr
        %1207 = arith.constant 1 : i64
        %1208 = func.call @cc_make_string(%1206, %1207) : (!llvm.ptr, i64) -> i64
        %1209 = func.call @cc_nil_value() : () -> i64
        %1210 = func.call @cc_intern(%1208, %1209) : (i64, i64) -> i64
        %1211 = func.call @cc_nil_value() : () -> i64
        %1212 = func.call @cc_cons(%1210, %1211) : (i64, i64) -> i64
        %1213 = func.call @cc_values_pack(%1212) : (i64) -> i64
        func.call @stack_push_pointer(%1210) : (i64) -> ()
        %1214 = func.call @stack_pop_pointer() : () -> i64
        %1215 = func.call @stack_pop_pointer() : () -> i64
        %1216 = func.call @cc_cons(%1214, %1215) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1216) : (i64) -> ()
        %1217 = func.call @stack_pop_pointer() : () -> i64
        %1218 = func.call @stack_pop_pointer() : () -> i64
        %1219 = func.call @cc_cons(%1217, %1218) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1219) : (i64) -> ()
        %1220 = func.call @stack_pop_pointer() : () -> i64
        %1221 = func.call @stack_pop_pointer() : () -> i64
        %1222 = func.call @cc_cons(%1220, %1221) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1222) : (i64) -> ()
        %1223 = llvm.mlir.addressof @str121 : !llvm.ptr
        %1224 = arith.constant 14 : i64
        %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
        %1226 = llvm.mlir.addressof @str122 : !llvm.ptr
        %1227 = arith.constant 11 : i64
        %1228 = func.call @cc_make_string(%1226, %1227) : (!llvm.ptr, i64) -> i64
        %1229 = func.call @cc_intern(%1225, %1228) : (i64, i64) -> i64
        %1230 = func.call @cc_nil_value() : () -> i64
        %1231 = func.call @cc_cons(%1229, %1230) : (i64, i64) -> i64
        %1232 = func.call @cc_values_pack(%1231) : (i64) -> i64
        func.call @stack_push_pointer(%1229) : (i64) -> ()
        %1233 = func.call @stack_pop_pointer() : () -> i64
        %1234 = func.call @stack_pop_pointer() : () -> i64
        %1235 = func.call @cc_cons(%1233, %1234) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1235) : (i64) -> ()
        %1236 = llvm.mlir.addressof @str123 : !llvm.ptr
        %1237 = arith.constant 9 : i64
        %1238 = func.call @cc_make_string(%1236, %1237) : (!llvm.ptr, i64) -> i64
        %1239 = func.call @cc_nil_value() : () -> i64
        %1240 = func.call @cc_intern(%1238, %1239) : (i64, i64) -> i64
        %1241 = func.call @cc_nil_value() : () -> i64
        %1242 = func.call @cc_cons(%1240, %1241) : (i64, i64) -> i64
        %1243 = func.call @cc_values_pack(%1242) : (i64) -> i64
        func.call @stack_push_pointer(%1240) : (i64) -> ()
        %1244 = func.call @stack_pop_pointer() : () -> i64
        %1245 = func.call @stack_pop_pointer() : () -> i64
        %1246 = func.call @cc_cons(%1244, %1245) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1246) : (i64) -> ()
        %1247 = func.call @stack_pop_pointer() : () -> i64
        %1248 = func.call @cc_nil_value() : () -> i64
        %1249 = func.call @cc_cons(%1247, %1248) : (i64, i64) -> i64
        %1250 = func.call @cc_eval(%1249) : (i64) -> i64
        %1251 = func.call @cc_multiple_value_list(%1250) : (i64) -> i64
        %1252 = func.call @cc_values_pack(%1251) : (i64) -> i64
        func.call @stack_push_pointer(%1252) : (i64) -> ()
        %1253 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1253 : i64
      }
      func.call @stack_push_pointer(%996) : (i64) -> ()
      %1254 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1254 : i64
    }
    %1255 = func.call @cc_nil_value() : () -> i64
    %1256 = func.call @cc_errorp(%845) : (i64) -> i64
    %1257 = arith.cmpi ne, %1256, %1255 : i64
    %1258 = scf.if %1257 -> (i64) {
      scf.yield %845 : i64
    } else {
      %1259 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1260 = func.call @cc_make_function_ref_const(%1259) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1260) : (i64) -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1263 = arith.constant 3 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1266 = arith.constant 20 : i64
      %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
      %1268 = func.call @cc_intern(%1264, %1267) : (i64, i64) -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_cons(%1268, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_values_pack(%1270) : (i64) -> i64
      %1272 = func.call @cc_set_symbol_value(%1268, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1261) : (i64) -> ()
      %1273 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1273 : i64
    }
    %1274 = func.call @cc_nil_value() : () -> i64
    %1275 = func.call @cc_errorp(%1258) : (i64) -> i64
    %1276 = arith.cmpi ne, %1275, %1274 : i64
    %1277 = scf.if %1276 -> (i64) {
      scf.yield %1258 : i64
    } else {
      %1278 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1279 = func.call @cc_make_function_ref_const(%1278) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1279) : (i64) -> ()
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1282 = arith.constant 3 : i64
      %1283 = func.call @cc_make_string(%1281, %1282) : (!llvm.ptr, i64) -> i64
      %1284 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1285 = arith.constant 20 : i64
      %1286 = func.call @cc_make_string(%1284, %1285) : (!llvm.ptr, i64) -> i64
      %1287 = func.call @cc_intern(%1283, %1286) : (i64, i64) -> i64
      %1288 = func.call @cc_nil_value() : () -> i64
      %1289 = func.call @cc_cons(%1287, %1288) : (i64, i64) -> i64
      %1290 = func.call @cc_values_pack(%1289) : (i64) -> i64
      %1291 = func.call @cc_set_symbol_value(%1287, %1280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1280) : (i64) -> ()
      %1292 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1292 : i64
    }
    %1293 = func.call @cc_nil_value() : () -> i64
    %1294 = func.call @cc_errorp(%1277) : (i64) -> i64
    %1295 = arith.cmpi ne, %1294, %1293 : i64
    %1296 = scf.if %1295 -> (i64) {
      scf.yield %1277 : i64
    } else {
      %1297 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1298 = func.call @cc_make_function_ref_const(%1297) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      %1299 = func.call @stack_pop_pointer() : () -> i64
      %1300 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1301 = arith.constant 3 : i64
      %1302 = func.call @cc_make_string(%1300, %1301) : (!llvm.ptr, i64) -> i64
      %1303 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1304 = arith.constant 20 : i64
      %1305 = func.call @cc_make_string(%1303, %1304) : (!llvm.ptr, i64) -> i64
      %1306 = func.call @cc_intern(%1302, %1305) : (i64, i64) -> i64
      %1307 = func.call @cc_nil_value() : () -> i64
      %1308 = func.call @cc_cons(%1306, %1307) : (i64, i64) -> i64
      %1309 = func.call @cc_values_pack(%1308) : (i64) -> i64
      %1310 = func.call @cc_set_symbol_value(%1306, %1299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1299) : (i64) -> ()
      %1311 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1311 : i64
    }
    %1312 = func.call @cc_nil_value() : () -> i64
    %1313 = func.call @cc_errorp(%1296) : (i64) -> i64
    %1314 = arith.cmpi ne, %1313, %1312 : i64
    %1315 = scf.if %1314 -> (i64) {
      scf.yield %1296 : i64
    } else {
      %1316 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1317 = func.call @cc_make_function_ref_const(%1316) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      %1318 = func.call @stack_pop_pointer() : () -> i64
      %1319 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1320 = arith.constant 3 : i64
      %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
      %1322 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1323 = arith.constant 20 : i64
      %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
      %1325 = func.call @cc_intern(%1321, %1324) : (i64, i64) -> i64
      %1326 = func.call @cc_nil_value() : () -> i64
      %1327 = func.call @cc_cons(%1325, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_values_pack(%1327) : (i64) -> i64
      %1329 = func.call @cc_set_symbol_value(%1325, %1318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1318) : (i64) -> ()
      %1330 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1330 : i64
    }
    func.call @stack_push_pointer(%1315) : (i64) -> ()
    %1331 = func.call @stack_pop_pointer() : () -> i64
    %1332 = func.call @cc_multiple_value_list(%1331) : (i64) -> i64
    %1333 = llvm.mlir.addressof @str136 : !llvm.ptr
    %1334 = arith.constant 37 : i64
    %1335 = func.call @cc_make_string(%1333, %1334) : (!llvm.ptr, i64) -> i64
    %1336 = func.call @cc_nil_value() : () -> i64
    %1337 = func.call @cc_intern(%1335, %1336) : (i64, i64) -> i64
    %1338 = func.call @cc_nil_value() : () -> i64
    %1339 = func.call @cc_cons(%1337, %1338) : (i64, i64) -> i64
    %1340 = func.call @cc_values_pack(%1339) : (i64) -> i64
    %1341 = func.call @cc_symbol_value(%1337) : (i64) -> i64
    %1342 = llvm.mlir.addressof @str137 : !llvm.ptr
    %1343 = arith.constant 39 : i64
    %1344 = func.call @cc_make_string(%1342, %1343) : (!llvm.ptr, i64) -> i64
    %1345 = func.call @cc_nil_value() : () -> i64
    %1346 = func.call @cc_intern(%1344, %1345) : (i64, i64) -> i64
    %1347 = func.call @cc_nil_value() : () -> i64
    %1348 = func.call @cc_cons(%1346, %1347) : (i64, i64) -> i64
    %1349 = func.call @cc_values_pack(%1348) : (i64) -> i64
    %1350 = func.call @cc_symbol_value(%1346) : (i64) -> i64
    %1351 = func.call @cc_nil_value() : () -> i64
    %1352 = arith.cmpi ne, %1341, %1351 : i64
    %1353 = scf.if %1352 -> (i64) {
      scf.yield %1350 : i64
    } else {
      scf.yield %1332 : i64
    }
    %1354 = func.call @cc_values_pack(%1353) : (i64) -> i64
    func.call @stack_push_pointer(%1354) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%make-foo"() {
    %341 = llvm.mlir.addressof @str31 : !llvm.ptr
    %342 = arith.constant 8 : i64
    %343 = func.call @cc_make_string(%341, %342) : (!llvm.ptr, i64) -> i64
    %344 = func.call @cc_nil_value() : () -> i64
    %345 = func.call @cc_intern(%343, %344) : (i64, i64) -> i64
    %346 = func.call @cc_nil_value() : () -> i64
    %347 = func.call @cc_cons(%345, %346) : (i64, i64) -> i64
    %348 = func.call @cc_values_pack(%347) : (i64) -> i64
    %349 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%345, %349) : (i64, i64) -> ()
    %350 = func.call @cc_nil_value() : () -> i64
    %351 = llvm.mlir.addressof @str32 : !llvm.ptr
    %352 = arith.constant 37 : i64
    %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
    %354 = func.call @cc_nil_value() : () -> i64
    %355 = func.call @cc_intern(%353, %354) : (i64, i64) -> i64
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
    %358 = func.call @cc_values_pack(%357) : (i64) -> i64
    %359 = func.call @cc_set_symbol_value(%355, %350) : (i64, i64) -> i64
    %360 = llvm.mlir.addressof @str33 : !llvm.ptr
    %361 = arith.constant 38 : i64
    %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
    %363 = func.call @cc_nil_value() : () -> i64
    %364 = func.call @cc_intern(%362, %363) : (i64, i64) -> i64
    %365 = func.call @cc_nil_value() : () -> i64
    %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
    %367 = func.call @cc_values_pack(%366) : (i64) -> i64
    %368 = func.call @cc_set_symbol_value(%364, %350) : (i64, i64) -> i64
    %369 = llvm.mlir.addressof @str34 : !llvm.ptr
    %370 = arith.constant 39 : i64
    %371 = func.call @cc_make_string(%369, %370) : (!llvm.ptr, i64) -> i64
    %372 = func.call @cc_nil_value() : () -> i64
    %373 = func.call @cc_intern(%371, %372) : (i64, i64) -> i64
    %374 = func.call @cc_nil_value() : () -> i64
    %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
    %376 = func.call @cc_values_pack(%375) : (i64) -> i64
    %377 = func.call @cc_set_symbol_value(%373, %350) : (i64, i64) -> i64
    %378 = func.call @cc_nil_value() : () -> i64
    %379 = llvm.mlir.addressof @str35 : !llvm.ptr
    %380 = arith.constant 3 : i64
    %381 = func.call @cc_make_string(%379, %380) : (!llvm.ptr, i64) -> i64
    %382 = func.call @cc_nil_value() : () -> i64
    %383 = func.call @cc_intern(%381, %382) : (i64, i64) -> i64
    %384 = func.call @cc_nil_value() : () -> i64
    %385 = func.call @cc_cons(%383, %384) : (i64, i64) -> i64
    %386 = func.call @cc_values_pack(%385) : (i64) -> i64
    func.call @stack_push_pointer(%383) : (i64) -> ()
    %387 = func.call @stack_pop_pointer() : () -> i64
    %388 = func.call @cc_make_instance(%387, %378) : (i64, i64) -> i64
    func.call @stack_push_pointer(%388) : (i64) -> ()
    %389 = func.call @stack_pop_pointer() : () -> i64
    %390 = func.call @cc_multiple_value_list(%389) : (i64) -> i64
    %391 = llvm.mlir.addressof @str36 : !llvm.ptr
    %392 = arith.constant 37 : i64
    %393 = func.call @cc_make_string(%391, %392) : (!llvm.ptr, i64) -> i64
    %394 = func.call @cc_nil_value() : () -> i64
    %395 = func.call @cc_intern(%393, %394) : (i64, i64) -> i64
    %396 = func.call @cc_nil_value() : () -> i64
    %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
    %398 = func.call @cc_values_pack(%397) : (i64) -> i64
    %399 = func.call @cc_symbol_value(%395) : (i64) -> i64
    %400 = llvm.mlir.addressof @str37 : !llvm.ptr
    %401 = arith.constant 39 : i64
    %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
    %403 = func.call @cc_nil_value() : () -> i64
    %404 = func.call @cc_intern(%402, %403) : (i64, i64) -> i64
    %405 = func.call @cc_nil_value() : () -> i64
    %406 = func.call @cc_cons(%404, %405) : (i64, i64) -> i64
    %407 = func.call @cc_values_pack(%406) : (i64) -> i64
    %408 = func.call @cc_symbol_value(%404) : (i64) -> i64
    %409 = func.call @cc_nil_value() : () -> i64
    %410 = arith.cmpi ne, %399, %409 : i64
    %411 = scf.if %410 -> (i64) {
      scf.yield %408 : i64
    } else {
      scf.yield %390 : i64
    }
    %412 = func.call @cc_values_pack(%411) : (i64) -> i64
    func.call @stack_push_pointer(%412) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"COMMON-LISP:MAKE-LOAD-FORM_47888533028870_primary"() {
    %437 = func.call @stack_pop_pointer() : () -> i64
    %438 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %439 = func.call @stack_depth() : () -> i64
    %440 = arith.constant 0 : i64
    %441 = arith.cmpi sgt, %439, %440 : i64
    scf.if %441 {
      %442 = func.call @stack_pop_pointer() : () -> i64
    }
    %443 = llvm.mlir.addressof @str41 : !llvm.ptr
    %444 = arith.constant 3 : i64
    %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
    %446 = llvm.mlir.addressof @str42 : !llvm.ptr
    %447 = arith.constant 11 : i64
    %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
    %449 = func.call @cc_intern(%445, %448) : (i64, i64) -> i64
    %450 = func.call @cc_nil_value() : () -> i64
    %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
    %452 = func.call @cc_values_pack(%451) : (i64) -> i64
    func.call @stack_push_pointer(%449) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %453 = llvm.mlir.addressof @str43 : !llvm.ptr
    %454 = arith.constant 8 : i64
    %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
    %456 = func.call @cc_nil_value() : () -> i64
    %457 = func.call @cc_intern(%455, %456) : (i64, i64) -> i64
    %458 = func.call @cc_nil_value() : () -> i64
    %459 = func.call @cc_cons(%457, %458) : (i64, i64) -> i64
    %460 = func.call @cc_values_pack(%459) : (i64) -> i64
    func.call @stack_push_pointer(%457) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %461 = func.call @stack_pop_pointer() : () -> i64
    %462 = func.call @stack_pop_pointer() : () -> i64
    %463 = func.call @cc_cons(%462, %461) : (i64, i64) -> i64
    func.call @stack_push_pointer(%463) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %464 = func.call @stack_pop_pointer() : () -> i64
    %465 = func.call @stack_pop_pointer() : () -> i64
    %466 = func.call @cc_cons(%465, %464) : (i64, i64) -> i64
    func.call @stack_push_pointer(%466) : (i64) -> ()
    %467 = func.call @stack_pop_pointer() : () -> i64
    %468 = func.call @stack_pop_pointer() : () -> i64
    %469 = func.call @cc_cons(%468, %467) : (i64, i64) -> i64
    func.call @stack_push_pointer(%469) : (i64) -> ()
    %470 = func.call @stack_pop_pointer() : () -> i64
    %471 = func.call @stack_pop_pointer() : () -> i64
    %472 = func.call @cc_cons(%471, %470) : (i64, i64) -> i64
    func.call @stack_push_pointer(%472) : (i64) -> ()
    %473 = func.call @stack_pop_pointer() : () -> i64
    %474 = llvm.mlir.addressof @str44 : !llvm.ptr
    %475 = arith.constant 3 : i64
    %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
    %477 = llvm.mlir.addressof @str45 : !llvm.ptr
    %478 = arith.constant 11 : i64
    %479 = func.call @cc_make_string(%477, %478) : (!llvm.ptr, i64) -> i64
    %480 = func.call @cc_intern(%476, %479) : (i64, i64) -> i64
    %481 = func.call @cc_nil_value() : () -> i64
    %482 = func.call @cc_cons(%480, %481) : (i64, i64) -> i64
    %483 = func.call @cc_values_pack(%482) : (i64) -> i64
    func.call @stack_push_pointer(%480) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    func.call @stack_push_nil() : () -> ()
    %484 = func.call @stack_pop_pointer() : () -> i64
    %485 = func.call @stack_pop_pointer() : () -> i64
    %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
    func.call @stack_push_pointer(%486) : (i64) -> ()
    %487 = func.call @stack_pop_pointer() : () -> i64
    %488 = func.call @stack_pop_pointer() : () -> i64
    %489 = func.call @cc_cons(%488, %487) : (i64, i64) -> i64
    func.call @stack_push_pointer(%489) : (i64) -> ()
    %490 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %491 = func.call @stack_pop_pointer() : () -> i64
    %492 = func.call @cc_cons(%490, %491) : (i64, i64) -> i64
    func.call @stack_push_pointer(%492) : (i64) -> ()
    %493 = func.call @stack_pop_pointer() : () -> i64
    %494 = func.call @cc_cons(%473, %493) : (i64, i64) -> i64
    func.call @stack_push_pointer(%494) : (i64) -> ()
    %495 = func.call @stack_pop_pointer() : () -> i64
    %496 = func.call @cc_values_pack(%495) : (i64) -> i64
    func.call @stack_push_pointer(%496) : (i64) -> ()
    func.return
  }
  func.func @"%FN%make-bar"() {
    %901 = llvm.mlir.addressof @str88 : !llvm.ptr
    %902 = arith.constant 8 : i64
    %903 = func.call @cc_make_string(%901, %902) : (!llvm.ptr, i64) -> i64
    %904 = func.call @cc_nil_value() : () -> i64
    %905 = func.call @cc_intern(%903, %904) : (i64, i64) -> i64
    %906 = func.call @cc_nil_value() : () -> i64
    %907 = func.call @cc_cons(%905, %906) : (i64, i64) -> i64
    %908 = func.call @cc_values_pack(%907) : (i64) -> i64
    %909 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%905, %909) : (i64, i64) -> ()
    %910 = func.call @cc_nil_value() : () -> i64
    %911 = llvm.mlir.addressof @str89 : !llvm.ptr
    %912 = arith.constant 37 : i64
    %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
    %914 = func.call @cc_nil_value() : () -> i64
    %915 = func.call @cc_intern(%913, %914) : (i64, i64) -> i64
    %916 = func.call @cc_nil_value() : () -> i64
    %917 = func.call @cc_cons(%915, %916) : (i64, i64) -> i64
    %918 = func.call @cc_values_pack(%917) : (i64) -> i64
    %919 = func.call @cc_set_symbol_value(%915, %910) : (i64, i64) -> i64
    %920 = llvm.mlir.addressof @str90 : !llvm.ptr
    %921 = arith.constant 38 : i64
    %922 = func.call @cc_make_string(%920, %921) : (!llvm.ptr, i64) -> i64
    %923 = func.call @cc_nil_value() : () -> i64
    %924 = func.call @cc_intern(%922, %923) : (i64, i64) -> i64
    %925 = func.call @cc_nil_value() : () -> i64
    %926 = func.call @cc_cons(%924, %925) : (i64, i64) -> i64
    %927 = func.call @cc_values_pack(%926) : (i64) -> i64
    %928 = func.call @cc_set_symbol_value(%924, %910) : (i64, i64) -> i64
    %929 = llvm.mlir.addressof @str91 : !llvm.ptr
    %930 = arith.constant 39 : i64
    %931 = func.call @cc_make_string(%929, %930) : (!llvm.ptr, i64) -> i64
    %932 = func.call @cc_nil_value() : () -> i64
    %933 = func.call @cc_intern(%931, %932) : (i64, i64) -> i64
    %934 = func.call @cc_nil_value() : () -> i64
    %935 = func.call @cc_cons(%933, %934) : (i64, i64) -> i64
    %936 = func.call @cc_values_pack(%935) : (i64) -> i64
    %937 = func.call @cc_set_symbol_value(%933, %910) : (i64, i64) -> i64
    %938 = func.call @cc_nil_value() : () -> i64
    %939 = llvm.mlir.addressof @str92 : !llvm.ptr
    %940 = arith.constant 3 : i64
    %941 = func.call @cc_make_string(%939, %940) : (!llvm.ptr, i64) -> i64
    %942 = func.call @cc_nil_value() : () -> i64
    %943 = func.call @cc_intern(%941, %942) : (i64, i64) -> i64
    %944 = func.call @cc_nil_value() : () -> i64
    %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
    %946 = func.call @cc_values_pack(%945) : (i64) -> i64
    func.call @stack_push_pointer(%943) : (i64) -> ()
    %947 = func.call @stack_pop_pointer() : () -> i64
    %948 = func.call @cc_make_instance(%947, %938) : (i64, i64) -> i64
    func.call @stack_push_pointer(%948) : (i64) -> ()
    %949 = func.call @stack_pop_pointer() : () -> i64
    %950 = func.call @cc_multiple_value_list(%949) : (i64) -> i64
    %951 = llvm.mlir.addressof @str93 : !llvm.ptr
    %952 = arith.constant 37 : i64
    %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
    %954 = func.call @cc_nil_value() : () -> i64
    %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
    %956 = func.call @cc_nil_value() : () -> i64
    %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
    %958 = func.call @cc_values_pack(%957) : (i64) -> i64
    %959 = func.call @cc_symbol_value(%955) : (i64) -> i64
    %960 = llvm.mlir.addressof @str94 : !llvm.ptr
    %961 = arith.constant 39 : i64
    %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
    %963 = func.call @cc_nil_value() : () -> i64
    %964 = func.call @cc_intern(%962, %963) : (i64, i64) -> i64
    %965 = func.call @cc_nil_value() : () -> i64
    %966 = func.call @cc_cons(%964, %965) : (i64, i64) -> i64
    %967 = func.call @cc_values_pack(%966) : (i64) -> i64
    %968 = func.call @cc_symbol_value(%964) : (i64) -> i64
    %969 = func.call @cc_nil_value() : () -> i64
    %970 = arith.cmpi ne, %959, %969 : i64
    %971 = scf.if %970 -> (i64) {
      scf.yield %968 : i64
    } else {
      scf.yield %950 : i64
    }
    %972 = func.call @cc_values_pack(%971) : (i64) -> i64
    func.call @stack_push_pointer(%972) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"COMMON-LISP:MAKE-LOAD-FORM_47888533028872_primary"() {
    %997 = func.call @stack_pop_pointer() : () -> i64
    %998 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %999 = func.call @stack_depth() : () -> i64
    %1000 = arith.constant 0 : i64
    %1001 = arith.cmpi sgt, %999, %1000 : i64
    scf.if %1001 {
      %1002 = func.call @stack_pop_pointer() : () -> i64
    }
    %1003 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1004 = arith.constant 3 : i64
    %1005 = func.call @cc_make_string(%1003, %1004) : (!llvm.ptr, i64) -> i64
    %1006 = llvm.mlir.addressof @str99 : !llvm.ptr
    %1007 = arith.constant 11 : i64
    %1008 = func.call @cc_make_string(%1006, %1007) : (!llvm.ptr, i64) -> i64
    %1009 = func.call @cc_intern(%1005, %1008) : (i64, i64) -> i64
    %1010 = func.call @cc_nil_value() : () -> i64
    %1011 = func.call @cc_cons(%1009, %1010) : (i64, i64) -> i64
    %1012 = func.call @cc_values_pack(%1011) : (i64) -> i64
    func.call @stack_push_pointer(%1009) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %1013 = llvm.mlir.addressof @str100 : !llvm.ptr
    %1014 = arith.constant 8 : i64
    %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
    %1016 = func.call @cc_nil_value() : () -> i64
    %1017 = func.call @cc_intern(%1015, %1016) : (i64, i64) -> i64
    %1018 = func.call @cc_nil_value() : () -> i64
    %1019 = func.call @cc_cons(%1017, %1018) : (i64, i64) -> i64
    %1020 = func.call @cc_values_pack(%1019) : (i64) -> i64
    func.call @stack_push_pointer(%1017) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %1021 = func.call @stack_pop_pointer() : () -> i64
    %1022 = func.call @stack_pop_pointer() : () -> i64
    %1023 = func.call @cc_cons(%1022, %1021) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1023) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %1024 = func.call @stack_pop_pointer() : () -> i64
    %1025 = func.call @stack_pop_pointer() : () -> i64
    %1026 = func.call @cc_cons(%1025, %1024) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1026) : (i64) -> ()
    %1027 = func.call @stack_pop_pointer() : () -> i64
    %1028 = func.call @stack_pop_pointer() : () -> i64
    %1029 = func.call @cc_cons(%1028, %1027) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1029) : (i64) -> ()
    %1030 = func.call @stack_pop_pointer() : () -> i64
    %1031 = func.call @stack_pop_pointer() : () -> i64
    %1032 = func.call @cc_cons(%1031, %1030) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1032) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_47888533028864*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_47888533028864*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_47888533028864*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETFLAG_47888533028865*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETVALUE_47888533028865*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETMVLIST_47888533028865*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_47888533028865*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETVALUE_47888533028865*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_47888533028865*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_47888533028864*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETMVLIST_47888533028864*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_47888533028866*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETVALUE_47888533028866*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETMVLIST_47888533028866*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETFLAG_47888533028867*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETVALUE_47888533028867*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_47888533028867*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_47888533028867*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_47888533028867*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_47888533028867*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETFLAG_47888533028866*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETMVLIST_47888533028866*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str24("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETFLAG_47888533028868*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETVALUE_47888533028868*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETMVLIST_47888533028868*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str28("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str30("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str31("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETFLAG_47888533028869*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETVALUE_47888533028869*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str34("*__MLIR_BLOCK_RETMVLIST_47888533028869*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str35("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETFLAG_47888533028869*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETMVLIST_47888533028869*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str38("%FN%make-foo\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str39("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str40("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str41("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str44("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str45("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @method_name_47888533028870("COMMON-LISP:MAKE-LOAD-FORM_47888533028870_primary\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str47("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str50("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str51("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str52("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str53("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str56("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("MAKE-FOO\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str58("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str59("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str60("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str66("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str69("O\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str70("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str71("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str73("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str75("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str76("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str78("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str79("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str81("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str82("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str83("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str84("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str85("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str86("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str87("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str88("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str89("*__MLIR_BLOCK_RETFLAG_47888533028871*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str90("*__MLIR_BLOCK_RETVALUE_47888533028871*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str91("*__MLIR_BLOCK_RETMVLIST_47888533028871*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str92("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("*__MLIR_BLOCK_RETFLAG_47888533028871*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str94("*__MLIR_BLOCK_RETMVLIST_47888533028871*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str95("%FN%make-bar\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str96("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str97("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str98("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @method_name_47888533028872("COMMON-LISP:MAKE-LOAD-FORM_47888533028872_primary\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str102("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str105("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str106("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str107("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str108("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("MAKE-BAR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str110("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str111("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str112("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("ENV\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str117("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str118("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str120("O\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str121("MAKE-LOAD-FORM\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str124("%FN%bar\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str125("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str126("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str127("%FN%bar\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str128("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str129("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str130("%FN%bar\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str131("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str132("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str133("%FN%bar\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str135("%FN%COMMON-LISP-USER\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str136("*__MLIR_BLOCK_RETFLAG_47888533028868*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str137("*__MLIR_BLOCK_RETMVLIST_47888533028868*\00") : !llvm.array<40 x i8>
}
