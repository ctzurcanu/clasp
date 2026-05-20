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
    %65 = arith.constant 42 : i64
    func.call @stack_push_fixnum(%65) : (i64) -> ()
    %66 = func.call @stack_pop_pointer() : () -> i64
    %67 = func.call @cc_multiple_value_list(%66) : (i64) -> i64
    %68 = llvm.mlir.addressof @str7 : !llvm.ptr
    %69 = arith.constant 37 : i64
    %70 = func.call @cc_make_string(%68, %69) : (!llvm.ptr, i64) -> i64
    %71 = func.call @cc_nil_value() : () -> i64
    %72 = func.call @cc_intern(%70, %71) : (i64, i64) -> i64
    %73 = func.call @cc_nil_value() : () -> i64
    %74 = func.call @cc_cons(%72, %73) : (i64, i64) -> i64
    %75 = func.call @cc_values_pack(%74) : (i64) -> i64
    %76 = func.call @cc_symbol_value(%72) : (i64) -> i64
    %77 = llvm.mlir.addressof @str8 : !llvm.ptr
    %78 = arith.constant 38 : i64
    %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
    %80 = func.call @cc_nil_value() : () -> i64
    %81 = func.call @cc_intern(%79, %80) : (i64, i64) -> i64
    %82 = func.call @cc_nil_value() : () -> i64
    %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
    %84 = func.call @cc_values_pack(%83) : (i64) -> i64
    %85 = func.call @cc_symbol_value(%81) : (i64) -> i64
    %86 = llvm.mlir.addressof @str9 : !llvm.ptr
    %87 = arith.constant 39 : i64
    %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
    %89 = func.call @cc_nil_value() : () -> i64
    %90 = func.call @cc_intern(%88, %89) : (i64, i64) -> i64
    %91 = func.call @cc_nil_value() : () -> i64
    %92 = func.call @cc_cons(%90, %91) : (i64, i64) -> i64
    %93 = func.call @cc_values_pack(%92) : (i64) -> i64
    %94 = func.call @cc_symbol_value(%90) : (i64) -> i64
    %95 = func.call @cc_nil_value() : () -> i64
    %96 = arith.cmpi ne, %76, %95 : i64
    %97 = scf.if %96 -> (i64) {
      scf.yield %94 : i64
    } else {
      scf.yield %67 : i64
    }
    %98 = func.call @cc_values_pack(%97) : (i64) -> i64
    func.call @stack_push_pointer(%98) : (i64) -> ()
    %99 = func.call @stack_pop_pointer() : () -> i64
    %100 = func.call @cc_multiple_value_list(%99) : (i64) -> i64
    %101 = llvm.mlir.addressof @str10 : !llvm.ptr
    %102 = arith.constant 37 : i64
    %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
    %104 = func.call @cc_nil_value() : () -> i64
    %105 = func.call @cc_intern(%103, %104) : (i64, i64) -> i64
    %106 = func.call @cc_nil_value() : () -> i64
    %107 = func.call @cc_cons(%105, %106) : (i64, i64) -> i64
    %108 = func.call @cc_values_pack(%107) : (i64) -> i64
    %109 = func.call @cc_symbol_value(%105) : (i64) -> i64
    %110 = llvm.mlir.addressof @str11 : !llvm.ptr
    %111 = arith.constant 39 : i64
    %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
    %113 = func.call @cc_nil_value() : () -> i64
    %114 = func.call @cc_intern(%112, %113) : (i64, i64) -> i64
    %115 = func.call @cc_nil_value() : () -> i64
    %116 = func.call @cc_cons(%114, %115) : (i64, i64) -> i64
    %117 = func.call @cc_values_pack(%116) : (i64) -> i64
    %118 = func.call @cc_symbol_value(%114) : (i64) -> i64
    %119 = func.call @cc_nil_value() : () -> i64
    %120 = arith.cmpi ne, %109, %119 : i64
    %121 = scf.if %120 -> (i64) {
      scf.yield %118 : i64
    } else {
      scf.yield %100 : i64
    }
    %122 = func.call @cc_values_pack(%121) : (i64) -> i64
    func.call @stack_push_pointer(%122) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %123 = llvm.mlir.addressof @str12 : !llvm.ptr
    %124 = arith.constant 6 : i64
    %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
    %126 = func.call @cc_nil_value() : () -> i64
    %127 = func.call @cc_intern(%125, %126) : (i64, i64) -> i64
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = func.call @cc_cons(%127, %128) : (i64, i64) -> i64
    %130 = func.call @cc_values_pack(%129) : (i64) -> i64
    %131 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%127, %131) : (i64, i64) -> ()
    %132 = func.call @cc_nil_value() : () -> i64
    %133 = llvm.mlir.addressof @str13 : !llvm.ptr
    %134 = arith.constant 37 : i64
    %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
    %136 = func.call @cc_nil_value() : () -> i64
    %137 = func.call @cc_intern(%135, %136) : (i64, i64) -> i64
    %138 = func.call @cc_nil_value() : () -> i64
    %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
    %140 = func.call @cc_values_pack(%139) : (i64) -> i64
    %141 = func.call @cc_set_symbol_value(%137, %132) : (i64, i64) -> i64
    %142 = llvm.mlir.addressof @str14 : !llvm.ptr
    %143 = arith.constant 38 : i64
    %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_intern(%144, %145) : (i64, i64) -> i64
    %147 = func.call @cc_nil_value() : () -> i64
    %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
    %149 = func.call @cc_values_pack(%148) : (i64) -> i64
    %150 = func.call @cc_set_symbol_value(%146, %132) : (i64, i64) -> i64
    %151 = llvm.mlir.addressof @str15 : !llvm.ptr
    %152 = arith.constant 39 : i64
    %153 = func.call @cc_make_string(%151, %152) : (!llvm.ptr, i64) -> i64
    %154 = func.call @cc_nil_value() : () -> i64
    %155 = func.call @cc_intern(%153, %154) : (i64, i64) -> i64
    %156 = func.call @cc_nil_value() : () -> i64
    %157 = func.call @cc_cons(%155, %156) : (i64, i64) -> i64
    %158 = func.call @cc_values_pack(%157) : (i64) -> i64
    %159 = func.call @cc_set_symbol_value(%155, %132) : (i64, i64) -> i64
    %160 = func.call @cc_nil_value() : () -> i64
    %161 = func.call @cc_nil_value() : () -> i64
    %162 = func.call @cc_errorp(%160) : (i64) -> i64
    %163 = arith.cmpi ne, %162, %161 : i64
    %164 = scf.if %163 -> (i64) {
      scf.yield %160 : i64
    } else {
      %165 = llvm.mlir.addressof @str16 : !llvm.ptr
      %166 = arith.constant 7 : i64
      %167 = func.call @cc_make_string(%165, %166) : (!llvm.ptr, i64) -> i64
      %168 = llvm.mlir.addressof @str17 : !llvm.ptr
      %169 = arith.constant 7 : i64
      %170 = func.call @cc_make_string(%168, %169) : (!llvm.ptr, i64) -> i64
      %171 = func.call @cc_intern(%167, %170) : (i64, i64) -> i64
      %172 = func.call @cc_nil_value() : () -> i64
      %173 = func.call @cc_cons(%171, %172) : (i64, i64) -> i64
      %174 = func.call @cc_values_pack(%173) : (i64) -> i64
      func.call @stack_push_pointer(%171) : (i64) -> ()
      %175 = func.call @stack_pop_pointer() : () -> i64
      %176 = func.call @cc_in_package(%175) : (i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %177 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %177 : i64
    }
    %178 = func.call @cc_nil_value() : () -> i64
    %179 = func.call @cc_errorp(%164) : (i64) -> i64
    %180 = arith.cmpi ne, %179, %178 : i64
    %181 = scf.if %180 -> (i64) {
      scf.yield %164 : i64
    } else {
      %182 = llvm.mlir.addressof @str18 : !llvm.ptr
      %183 = func.call @cc_make_function_ref_const(%182) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = llvm.mlir.addressof @str19 : !llvm.ptr
      %186 = arith.constant 3 : i64
      %187 = func.call @cc_make_string(%185, %186) : (!llvm.ptr, i64) -> i64
      %188 = llvm.mlir.addressof @str20 : !llvm.ptr
      %189 = arith.constant 11 : i64
      %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
      %191 = func.call @cc_intern(%187, %190) : (i64, i64) -> i64
      %192 = func.call @cc_nil_value() : () -> i64
      %193 = func.call @cc_cons(%191, %192) : (i64, i64) -> i64
      %194 = func.call @cc_values_pack(%193) : (i64) -> i64
      %195 = func.call @cc_set_symbol_value(%191, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%184) : (i64) -> ()
      %196 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %196 : i64
    }
    %197 = func.call @cc_nil_value() : () -> i64
    %198 = func.call @cc_errorp(%181) : (i64) -> i64
    %199 = arith.cmpi ne, %198, %197 : i64
    %200 = scf.if %199 -> (i64) {
      scf.yield %181 : i64
    } else {
      %201 = llvm.mlir.addressof @str21 : !llvm.ptr
      %202 = func.call @cc_make_function_ref_const(%201) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%202) : (i64) -> ()
      %203 = func.call @stack_pop_pointer() : () -> i64
      %204 = llvm.mlir.addressof @str22 : !llvm.ptr
      %205 = arith.constant 3 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = llvm.mlir.addressof @str23 : !llvm.ptr
      %208 = arith.constant 11 : i64
      %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
      %210 = func.call @cc_intern(%206, %209) : (i64, i64) -> i64
      %211 = func.call @cc_nil_value() : () -> i64
      %212 = func.call @cc_cons(%210, %211) : (i64, i64) -> i64
      %213 = func.call @cc_values_pack(%212) : (i64) -> i64
      %214 = func.call @cc_set_symbol_value(%210, %203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%203) : (i64) -> ()
      %215 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %215 : i64
    }
    %216 = func.call @cc_nil_value() : () -> i64
    %217 = func.call @cc_errorp(%200) : (i64) -> i64
    %218 = arith.cmpi ne, %217, %216 : i64
    %219 = scf.if %218 -> (i64) {
      scf.yield %200 : i64
    } else {
      %220 = llvm.mlir.addressof @str24 : !llvm.ptr
      %221 = func.call @cc_make_function_ref_const(%220) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%221) : (i64) -> ()
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = llvm.mlir.addressof @str25 : !llvm.ptr
      %224 = arith.constant 3 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = llvm.mlir.addressof @str26 : !llvm.ptr
      %227 = arith.constant 11 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_intern(%225, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      %233 = func.call @cc_set_symbol_value(%229, %222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      %234 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %234 : i64
    }
    %235 = func.call @cc_nil_value() : () -> i64
    %236 = func.call @cc_errorp(%219) : (i64) -> i64
    %237 = arith.cmpi ne, %236, %235 : i64
    %238 = scf.if %237 -> (i64) {
      scf.yield %219 : i64
    } else {
      %239 = llvm.mlir.addressof @str27 : !llvm.ptr
      %240 = func.call @cc_make_function_ref_const(%239) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%240) : (i64) -> ()
      %241 = func.call @stack_pop_pointer() : () -> i64
      %242 = llvm.mlir.addressof @str28 : !llvm.ptr
      %243 = arith.constant 3 : i64
      %244 = func.call @cc_make_string(%242, %243) : (!llvm.ptr, i64) -> i64
      %245 = llvm.mlir.addressof @str29 : !llvm.ptr
      %246 = arith.constant 11 : i64
      %247 = func.call @cc_make_string(%245, %246) : (!llvm.ptr, i64) -> i64
      %248 = func.call @cc_intern(%244, %247) : (i64, i64) -> i64
      %249 = func.call @cc_nil_value() : () -> i64
      %250 = func.call @cc_cons(%248, %249) : (i64, i64) -> i64
      %251 = func.call @cc_values_pack(%250) : (i64) -> i64
      %252 = func.call @cc_set_symbol_value(%248, %241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%241) : (i64) -> ()
      %253 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %253 : i64
    }
    func.call @stack_push_pointer(%238) : (i64) -> ()
    %254 = func.call @stack_pop_pointer() : () -> i64
    %255 = func.call @cc_multiple_value_list(%254) : (i64) -> i64
    %256 = llvm.mlir.addressof @str30 : !llvm.ptr
    %257 = arith.constant 37 : i64
    %258 = func.call @cc_make_string(%256, %257) : (!llvm.ptr, i64) -> i64
    %259 = func.call @cc_nil_value() : () -> i64
    %260 = func.call @cc_intern(%258, %259) : (i64, i64) -> i64
    %261 = func.call @cc_nil_value() : () -> i64
    %262 = func.call @cc_cons(%260, %261) : (i64, i64) -> i64
    %263 = func.call @cc_values_pack(%262) : (i64) -> i64
    %264 = func.call @cc_symbol_value(%260) : (i64) -> i64
    %265 = llvm.mlir.addressof @str31 : !llvm.ptr
    %266 = arith.constant 39 : i64
    %267 = func.call @cc_make_string(%265, %266) : (!llvm.ptr, i64) -> i64
    %268 = func.call @cc_nil_value() : () -> i64
    %269 = func.call @cc_intern(%267, %268) : (i64, i64) -> i64
    %270 = func.call @cc_nil_value() : () -> i64
    %271 = func.call @cc_cons(%269, %270) : (i64, i64) -> i64
    %272 = func.call @cc_values_pack(%271) : (i64) -> i64
    %273 = func.call @cc_symbol_value(%269) : (i64) -> i64
    %274 = func.call @cc_nil_value() : () -> i64
    %275 = arith.cmpi ne, %264, %274 : i64
    %276 = scf.if %275 -> (i64) {
      scf.yield %273 : i64
    } else {
      scf.yield %255 : i64
    }
    %277 = func.call @cc_values_pack(%276) : (i64) -> i64
    func.call @stack_push_pointer(%277) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_98668451463168*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_98668451463168*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_98668451463168*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETFLAG_98668451463169*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETVALUE_98668451463169*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETMVLIST_98668451463169*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_98668451463169*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETVALUE_98668451463169*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_98668451463169*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_98668451463168*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETMVLIST_98668451463168*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_98668451463170*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETVALUE_98668451463170*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETMVLIST_98668451463170*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str16("CL-USER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str20("%FN%CL-USER\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str23("%FN%CL-USER\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str26("%FN%CL-USER\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("%FN%foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("%FN%CL-USER\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("*__MLIR_BLOCK_RETFLAG_98668451463170*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETMVLIST_98668451463170*\00") : !llvm.array<40 x i8>
}
