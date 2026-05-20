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
  func.func @"%FN%eh-foo"() {
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
    %38 = llvm.mlir.addressof @str4 : !llvm.ptr
    %39 = arith.constant 38 : i64
    %40 = func.call @cc_make_string(%38, %39) : (!llvm.ptr, i64) -> i64
    %41 = func.call @cc_nil_value() : () -> i64
    %42 = func.call @cc_intern(%40, %41) : (i64, i64) -> i64
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_cons(%42, %43) : (i64, i64) -> i64
    %45 = func.call @cc_values_pack(%44) : (i64) -> i64
    %46 = func.call @cc_set_symbol_value(%42, %37) : (i64, i64) -> i64
    %47 = llvm.mlir.addressof @str5 : !llvm.ptr
    %48 = arith.constant 39 : i64
    %49 = func.call @cc_make_string(%47, %48) : (!llvm.ptr, i64) -> i64
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_intern(%49, %50) : (i64, i64) -> i64
    %52 = func.call @cc_nil_value() : () -> i64
    %53 = func.call @cc_cons(%51, %52) : (i64, i64) -> i64
    %54 = func.call @cc_values_pack(%53) : (i64) -> i64
    %55 = func.call @cc_set_symbol_value(%51, %37) : (i64, i64) -> i64
    %56 = llvm.mlir.addressof @str6 : !llvm.ptr
    %57 = arith.constant 40 : i64
    %58 = func.call @cc_make_string(%56, %57) : (!llvm.ptr, i64) -> i64
    %59 = func.call @cc_nil_value() : () -> i64
    %60 = func.call @cc_intern(%58, %59) : (i64, i64) -> i64
    %61 = func.call @cc_nil_value() : () -> i64
    %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
    %63 = func.call @cc_values_pack(%62) : (i64) -> i64
    %64 = func.call @cc_set_symbol_value(%60, %37) : (i64, i64) -> i64
    %65 = func.call @cc_nil_value() : () -> i64
    %66 = llvm.mlir.addressof @str7 : !llvm.ptr
    %67 = arith.constant 38 : i64
    %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
    %69 = func.call @cc_nil_value() : () -> i64
    %70 = func.call @cc_intern(%68, %69) : (i64, i64) -> i64
    %71 = func.call @cc_nil_value() : () -> i64
    %72 = func.call @cc_cons(%70, %71) : (i64, i64) -> i64
    %73 = func.call @cc_values_pack(%72) : (i64) -> i64
    %74 = func.call @cc_set_symbol_value(%70, %65) : (i64, i64) -> i64
    %75 = llvm.mlir.addressof @str8 : !llvm.ptr
    %76 = arith.constant 39 : i64
    %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
    %78 = func.call @cc_nil_value() : () -> i64
    %79 = func.call @cc_intern(%77, %78) : (i64, i64) -> i64
    %80 = func.call @cc_nil_value() : () -> i64
    %81 = func.call @cc_cons(%79, %80) : (i64, i64) -> i64
    %82 = func.call @cc_values_pack(%81) : (i64) -> i64
    %83 = func.call @cc_set_symbol_value(%79, %65) : (i64, i64) -> i64
    %84 = llvm.mlir.addressof @str9 : !llvm.ptr
    %85 = arith.constant 40 : i64
    %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
    %87 = func.call @cc_nil_value() : () -> i64
    %88 = func.call @cc_intern(%86, %87) : (i64, i64) -> i64
    %89 = func.call @cc_nil_value() : () -> i64
    %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
    %91 = func.call @cc_values_pack(%90) : (i64) -> i64
    %92 = func.call @cc_set_symbol_value(%88, %65) : (i64, i64) -> i64
    %93 = func.call @cc_nil_value() : () -> i64
    %94 = llvm.mlir.addressof @str10 : !llvm.ptr
    %95 = arith.constant 38 : i64
    %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
    %97 = func.call @cc_nil_value() : () -> i64
    %98 = func.call @cc_intern(%96, %97) : (i64, i64) -> i64
    %99 = func.call @cc_nil_value() : () -> i64
    %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
    %101 = func.call @cc_values_pack(%100) : (i64) -> i64
    %102 = func.call @cc_set_symbol_value(%98, %93) : (i64, i64) -> i64
    %103 = llvm.mlir.addressof @str11 : !llvm.ptr
    %104 = arith.constant 39 : i64
    %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
    %106 = func.call @cc_nil_value() : () -> i64
    %107 = func.call @cc_intern(%105, %106) : (i64, i64) -> i64
    %108 = func.call @cc_nil_value() : () -> i64
    %109 = func.call @cc_cons(%107, %108) : (i64, i64) -> i64
    %110 = func.call @cc_values_pack(%109) : (i64) -> i64
    %111 = func.call @cc_set_symbol_value(%107, %93) : (i64, i64) -> i64
    %112 = llvm.mlir.addressof @str12 : !llvm.ptr
    %113 = arith.constant 40 : i64
    %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
    %115 = func.call @cc_nil_value() : () -> i64
    %116 = func.call @cc_intern(%114, %115) : (i64, i64) -> i64
    %117 = func.call @cc_nil_value() : () -> i64
    %118 = func.call @cc_cons(%116, %117) : (i64, i64) -> i64
    %119 = func.call @cc_values_pack(%118) : (i64) -> i64
    %120 = func.call @cc_set_symbol_value(%116, %93) : (i64, i64) -> i64
    %121 = arith.constant 1 : i64
    func.call @stack_push_fixnum(%121) : (i64) -> ()
    %122 = func.call @stack_pop_pointer() : () -> i64
    %123 = func.call @cc_multiple_value_list(%122) : (i64) -> i64
    %124 = func.call @cc_t_value() : () -> i64
    %125 = llvm.mlir.addressof @str13 : !llvm.ptr
    %126 = arith.constant 38 : i64
    %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = func.call @cc_intern(%127, %128) : (i64, i64) -> i64
    %130 = func.call @cc_nil_value() : () -> i64
    %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
    %132 = func.call @cc_values_pack(%131) : (i64) -> i64
    %133 = func.call @cc_set_symbol_value(%129, %124) : (i64, i64) -> i64
    %134 = llvm.mlir.addressof @str14 : !llvm.ptr
    %135 = arith.constant 39 : i64
    %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
    %137 = func.call @cc_nil_value() : () -> i64
    %138 = func.call @cc_intern(%136, %137) : (i64, i64) -> i64
    %139 = func.call @cc_nil_value() : () -> i64
    %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
    %141 = func.call @cc_values_pack(%140) : (i64) -> i64
    %142 = func.call @cc_set_symbol_value(%138, %122) : (i64, i64) -> i64
    %143 = llvm.mlir.addressof @str15 : !llvm.ptr
    %144 = arith.constant 40 : i64
    %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
    %146 = func.call @cc_nil_value() : () -> i64
    %147 = func.call @cc_intern(%145, %146) : (i64, i64) -> i64
    %148 = func.call @cc_nil_value() : () -> i64
    %149 = func.call @cc_cons(%147, %148) : (i64, i64) -> i64
    %150 = func.call @cc_values_pack(%149) : (i64) -> i64
    %151 = func.call @cc_set_symbol_value(%147, %123) : (i64, i64) -> i64
    func.call @stack_push_pointer(%122) : (i64) -> ()
    %152 = func.call @stack_pop_pointer() : () -> i64
    %153 = func.call @cc_multiple_value_list(%152) : (i64) -> i64
    %218 = arith.constant 175130764378116 : i64
    %219 = arith.constant 0 : i64
    %220 = func.call @cc_make_closure(%218, %219) : (i64, i64) -> i64
    func.call @stack_push_pointer(%220) : (i64) -> ()
    %221 = func.call @stack_pop_pointer() : () -> i64
    %222 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%221, %222) : (i64, i64) -> ()
    %223 = func.call @stack_depth() : () -> i64
    %224 = arith.constant 0 : i64
    %225 = arith.cmpi sgt, %223, %224 : i64
    scf.if %225 {
      %226 = func.call @stack_pop_pointer() : () -> i64
    }
    %227 = func.call @cc_values_pack(%153) : (i64) -> i64
    func.call @stack_push_pointer(%227) : (i64) -> ()
    %228 = func.call @stack_pop_pointer() : () -> i64
    %229 = func.call @cc_multiple_value_list(%228) : (i64) -> i64
    %230 = llvm.mlir.addressof @str22 : !llvm.ptr
    %231 = arith.constant 38 : i64
    %232 = func.call @cc_make_string(%230, %231) : (!llvm.ptr, i64) -> i64
    %233 = func.call @cc_nil_value() : () -> i64
    %234 = func.call @cc_intern(%232, %233) : (i64, i64) -> i64
    %235 = func.call @cc_nil_value() : () -> i64
    %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
    %237 = func.call @cc_values_pack(%236) : (i64) -> i64
    %238 = func.call @cc_symbol_value(%234) : (i64) -> i64
    %239 = llvm.mlir.addressof @str23 : !llvm.ptr
    %240 = arith.constant 39 : i64
    %241 = func.call @cc_make_string(%239, %240) : (!llvm.ptr, i64) -> i64
    %242 = func.call @cc_nil_value() : () -> i64
    %243 = func.call @cc_intern(%241, %242) : (i64, i64) -> i64
    %244 = func.call @cc_nil_value() : () -> i64
    %245 = func.call @cc_cons(%243, %244) : (i64, i64) -> i64
    %246 = func.call @cc_values_pack(%245) : (i64) -> i64
    %247 = func.call @cc_symbol_value(%243) : (i64) -> i64
    %248 = llvm.mlir.addressof @str24 : !llvm.ptr
    %249 = arith.constant 40 : i64
    %250 = func.call @cc_make_string(%248, %249) : (!llvm.ptr, i64) -> i64
    %251 = func.call @cc_nil_value() : () -> i64
    %252 = func.call @cc_intern(%250, %251) : (i64, i64) -> i64
    %253 = func.call @cc_nil_value() : () -> i64
    %254 = func.call @cc_cons(%252, %253) : (i64, i64) -> i64
    %255 = func.call @cc_values_pack(%254) : (i64) -> i64
    %256 = func.call @cc_symbol_value(%252) : (i64) -> i64
    %257 = func.call @cc_nil_value() : () -> i64
    %258 = arith.cmpi ne, %238, %257 : i64
    %259 = scf.if %258 -> (i64) {
      scf.yield %256 : i64
    } else {
      scf.yield %229 : i64
    }
    %260 = func.call @cc_values_pack(%259) : (i64) -> i64
    func.call @stack_push_pointer(%260) : (i64) -> ()
    %261 = func.call @stack_pop_pointer() : () -> i64
    %262 = func.call @cc_multiple_value_list(%261) : (i64) -> i64
    %263 = llvm.mlir.addressof @str25 : !llvm.ptr
    %264 = arith.constant 38 : i64
    %265 = func.call @cc_make_string(%263, %264) : (!llvm.ptr, i64) -> i64
    %266 = func.call @cc_nil_value() : () -> i64
    %267 = func.call @cc_intern(%265, %266) : (i64, i64) -> i64
    %268 = func.call @cc_nil_value() : () -> i64
    %269 = func.call @cc_cons(%267, %268) : (i64, i64) -> i64
    %270 = func.call @cc_values_pack(%269) : (i64) -> i64
    %271 = func.call @cc_symbol_value(%267) : (i64) -> i64
    %272 = llvm.mlir.addressof @str26 : !llvm.ptr
    %273 = arith.constant 39 : i64
    %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
    %275 = func.call @cc_nil_value() : () -> i64
    %276 = func.call @cc_intern(%274, %275) : (i64, i64) -> i64
    %277 = func.call @cc_nil_value() : () -> i64
    %278 = func.call @cc_cons(%276, %277) : (i64, i64) -> i64
    %279 = func.call @cc_values_pack(%278) : (i64) -> i64
    %280 = func.call @cc_symbol_value(%276) : (i64) -> i64
    %281 = llvm.mlir.addressof @str27 : !llvm.ptr
    %282 = arith.constant 40 : i64
    %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
    %284 = func.call @cc_nil_value() : () -> i64
    %285 = func.call @cc_intern(%283, %284) : (i64, i64) -> i64
    %286 = func.call @cc_nil_value() : () -> i64
    %287 = func.call @cc_cons(%285, %286) : (i64, i64) -> i64
    %288 = func.call @cc_values_pack(%287) : (i64) -> i64
    %289 = func.call @cc_symbol_value(%285) : (i64) -> i64
    %290 = func.call @cc_nil_value() : () -> i64
    %291 = arith.cmpi ne, %271, %290 : i64
    %292 = scf.if %291 -> (i64) {
      scf.yield %289 : i64
    } else {
      scf.yield %262 : i64
    }
    %293 = func.call @cc_values_pack(%292) : (i64) -> i64
    func.call @stack_push_pointer(%293) : (i64) -> ()
    %294 = func.call @stack_pop_pointer() : () -> i64
    %295 = func.call @cc_multiple_value_list(%294) : (i64) -> i64
    %296 = llvm.mlir.addressof @str28 : !llvm.ptr
    %297 = arith.constant 38 : i64
    %298 = func.call @cc_make_string(%296, %297) : (!llvm.ptr, i64) -> i64
    %299 = func.call @cc_nil_value() : () -> i64
    %300 = func.call @cc_intern(%298, %299) : (i64, i64) -> i64
    %301 = func.call @cc_nil_value() : () -> i64
    %302 = func.call @cc_cons(%300, %301) : (i64, i64) -> i64
    %303 = func.call @cc_values_pack(%302) : (i64) -> i64
    %304 = func.call @cc_symbol_value(%300) : (i64) -> i64
    %305 = llvm.mlir.addressof @str29 : !llvm.ptr
    %306 = arith.constant 39 : i64
    %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
    %308 = func.call @cc_nil_value() : () -> i64
    %309 = func.call @cc_intern(%307, %308) : (i64, i64) -> i64
    %310 = func.call @cc_nil_value() : () -> i64
    %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
    %312 = func.call @cc_values_pack(%311) : (i64) -> i64
    %313 = func.call @cc_symbol_value(%309) : (i64) -> i64
    %314 = llvm.mlir.addressof @str30 : !llvm.ptr
    %315 = arith.constant 40 : i64
    %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
    %317 = func.call @cc_nil_value() : () -> i64
    %318 = func.call @cc_intern(%316, %317) : (i64, i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
    %321 = func.call @cc_values_pack(%320) : (i64) -> i64
    %322 = func.call @cc_symbol_value(%318) : (i64) -> i64
    %323 = func.call @cc_nil_value() : () -> i64
    %324 = arith.cmpi ne, %304, %323 : i64
    %325 = scf.if %324 -> (i64) {
      scf.yield %322 : i64
    } else {
      scf.yield %295 : i64
    }
    %326 = func.call @cc_values_pack(%325) : (i64) -> i64
    func.call @stack_push_pointer(%326) : (i64) -> ()
    %327 = func.call @stack_pop_pointer() : () -> i64
    %328 = func.call @cc_multiple_value_list(%327) : (i64) -> i64
    %329 = llvm.mlir.addressof @str31 : !llvm.ptr
    %330 = arith.constant 38 : i64
    %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = func.call @cc_intern(%331, %332) : (i64, i64) -> i64
    %334 = func.call @cc_nil_value() : () -> i64
    %335 = func.call @cc_cons(%333, %334) : (i64, i64) -> i64
    %336 = func.call @cc_values_pack(%335) : (i64) -> i64
    %337 = func.call @cc_symbol_value(%333) : (i64) -> i64
    %338 = llvm.mlir.addressof @str32 : !llvm.ptr
    %339 = arith.constant 40 : i64
    %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_intern(%340, %341) : (i64, i64) -> i64
    %343 = func.call @cc_nil_value() : () -> i64
    %344 = func.call @cc_cons(%342, %343) : (i64, i64) -> i64
    %345 = func.call @cc_values_pack(%344) : (i64) -> i64
    %346 = func.call @cc_symbol_value(%342) : (i64) -> i64
    %347 = func.call @cc_nil_value() : () -> i64
    %348 = arith.cmpi ne, %337, %347 : i64
    %349 = scf.if %348 -> (i64) {
      scf.yield %346 : i64
    } else {
      scf.yield %328 : i64
    }
    %350 = func.call @cc_values_pack(%349) : (i64) -> i64
    func.call @stack_push_pointer(%350) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%eh-bar"() {
    %351 = llvm.mlir.addressof @str33 : !llvm.ptr
    %352 = arith.constant 6 : i64
    %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
    %354 = func.call @cc_nil_value() : () -> i64
    %355 = func.call @cc_intern(%353, %354) : (i64, i64) -> i64
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
    %358 = func.call @cc_values_pack(%357) : (i64) -> i64
    %359 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%355, %359) : (i64, i64) -> ()
    %360 = func.call @cc_nil_value() : () -> i64
    %361 = llvm.mlir.addressof @str34 : !llvm.ptr
    %362 = arith.constant 38 : i64
    %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
    %364 = func.call @cc_nil_value() : () -> i64
    %365 = func.call @cc_intern(%363, %364) : (i64, i64) -> i64
    %366 = func.call @cc_nil_value() : () -> i64
    %367 = func.call @cc_cons(%365, %366) : (i64, i64) -> i64
    %368 = func.call @cc_values_pack(%367) : (i64) -> i64
    %369 = func.call @cc_set_symbol_value(%365, %360) : (i64, i64) -> i64
    %370 = llvm.mlir.addressof @str35 : !llvm.ptr
    %371 = arith.constant 39 : i64
    %372 = func.call @cc_make_string(%370, %371) : (!llvm.ptr, i64) -> i64
    %373 = func.call @cc_nil_value() : () -> i64
    %374 = func.call @cc_intern(%372, %373) : (i64, i64) -> i64
    %375 = func.call @cc_nil_value() : () -> i64
    %376 = func.call @cc_cons(%374, %375) : (i64, i64) -> i64
    %377 = func.call @cc_values_pack(%376) : (i64) -> i64
    %378 = func.call @cc_set_symbol_value(%374, %360) : (i64, i64) -> i64
    %379 = llvm.mlir.addressof @str36 : !llvm.ptr
    %380 = arith.constant 40 : i64
    %381 = func.call @cc_make_string(%379, %380) : (!llvm.ptr, i64) -> i64
    %382 = func.call @cc_nil_value() : () -> i64
    %383 = func.call @cc_intern(%381, %382) : (i64, i64) -> i64
    %384 = func.call @cc_nil_value() : () -> i64
    %385 = func.call @cc_cons(%383, %384) : (i64, i64) -> i64
    %386 = func.call @cc_values_pack(%385) : (i64) -> i64
    %387 = func.call @cc_set_symbol_value(%383, %360) : (i64, i64) -> i64
    %388 = func.call @cc_nil_value() : () -> i64
    %389 = llvm.mlir.addressof @str37 : !llvm.ptr
    %390 = arith.constant 38 : i64
    %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
    %392 = func.call @cc_nil_value() : () -> i64
    %393 = func.call @cc_intern(%391, %392) : (i64, i64) -> i64
    %394 = func.call @cc_nil_value() : () -> i64
    %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
    %396 = func.call @cc_values_pack(%395) : (i64) -> i64
    %397 = func.call @cc_set_symbol_value(%393, %388) : (i64, i64) -> i64
    %398 = llvm.mlir.addressof @str38 : !llvm.ptr
    %399 = arith.constant 39 : i64
    %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
    %401 = func.call @cc_nil_value() : () -> i64
    %402 = func.call @cc_intern(%400, %401) : (i64, i64) -> i64
    %403 = func.call @cc_nil_value() : () -> i64
    %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
    %405 = func.call @cc_values_pack(%404) : (i64) -> i64
    %406 = func.call @cc_set_symbol_value(%402, %388) : (i64, i64) -> i64
    %407 = llvm.mlir.addressof @str39 : !llvm.ptr
    %408 = arith.constant 40 : i64
    %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
    %410 = func.call @cc_nil_value() : () -> i64
    %411 = func.call @cc_intern(%409, %410) : (i64, i64) -> i64
    %412 = func.call @cc_nil_value() : () -> i64
    %413 = func.call @cc_cons(%411, %412) : (i64, i64) -> i64
    %414 = func.call @cc_values_pack(%413) : (i64) -> i64
    %415 = func.call @cc_set_symbol_value(%411, %388) : (i64, i64) -> i64
    %416 = func.call @cc_nil_value() : () -> i64
    %417 = llvm.mlir.addressof @str40 : !llvm.ptr
    %418 = arith.constant 38 : i64
    %419 = func.call @cc_make_string(%417, %418) : (!llvm.ptr, i64) -> i64
    %420 = func.call @cc_nil_value() : () -> i64
    %421 = func.call @cc_intern(%419, %420) : (i64, i64) -> i64
    %422 = func.call @cc_nil_value() : () -> i64
    %423 = func.call @cc_cons(%421, %422) : (i64, i64) -> i64
    %424 = func.call @cc_values_pack(%423) : (i64) -> i64
    %425 = func.call @cc_set_symbol_value(%421, %416) : (i64, i64) -> i64
    %426 = llvm.mlir.addressof @str41 : !llvm.ptr
    %427 = arith.constant 39 : i64
    %428 = func.call @cc_make_string(%426, %427) : (!llvm.ptr, i64) -> i64
    %429 = func.call @cc_nil_value() : () -> i64
    %430 = func.call @cc_intern(%428, %429) : (i64, i64) -> i64
    %431 = func.call @cc_nil_value() : () -> i64
    %432 = func.call @cc_cons(%430, %431) : (i64, i64) -> i64
    %433 = func.call @cc_values_pack(%432) : (i64) -> i64
    %434 = func.call @cc_set_symbol_value(%430, %416) : (i64, i64) -> i64
    %435 = llvm.mlir.addressof @str42 : !llvm.ptr
    %436 = arith.constant 40 : i64
    %437 = func.call @cc_make_string(%435, %436) : (!llvm.ptr, i64) -> i64
    %438 = func.call @cc_nil_value() : () -> i64
    %439 = func.call @cc_intern(%437, %438) : (i64, i64) -> i64
    %440 = func.call @cc_nil_value() : () -> i64
    %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
    %442 = func.call @cc_values_pack(%441) : (i64) -> i64
    %443 = func.call @cc_set_symbol_value(%439, %416) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %444 = func.call @stack_pop_pointer() : () -> i64
    %445 = func.call @cc_multiple_value_list(%444) : (i64) -> i64
    %483 = arith.constant 175130764378120 : i64
    %484 = arith.constant 0 : i64
    %485 = func.call @cc_make_closure(%483, %484) : (i64, i64) -> i64
    func.call @stack_push_pointer(%485) : (i64) -> ()
    %486 = func.call @stack_pop_pointer() : () -> i64
    %487 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%486, %487) : (i64, i64) -> ()
    %488 = func.call @stack_depth() : () -> i64
    %489 = arith.constant 0 : i64
    %490 = arith.cmpi sgt, %488, %489 : i64
    scf.if %490 {
      %491 = func.call @stack_pop_pointer() : () -> i64
    }
    %492 = func.call @cc_values_pack(%445) : (i64) -> i64
    func.call @stack_push_pointer(%492) : (i64) -> ()
    %493 = func.call @stack_pop_pointer() : () -> i64
    %494 = func.call @cc_multiple_value_list(%493) : (i64) -> i64
    %495 = llvm.mlir.addressof @str46 : !llvm.ptr
    %496 = arith.constant 38 : i64
    %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
    %498 = func.call @cc_nil_value() : () -> i64
    %499 = func.call @cc_intern(%497, %498) : (i64, i64) -> i64
    %500 = func.call @cc_nil_value() : () -> i64
    %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
    %502 = func.call @cc_values_pack(%501) : (i64) -> i64
    %503 = func.call @cc_symbol_value(%499) : (i64) -> i64
    %504 = llvm.mlir.addressof @str47 : !llvm.ptr
    %505 = arith.constant 39 : i64
    %506 = func.call @cc_make_string(%504, %505) : (!llvm.ptr, i64) -> i64
    %507 = func.call @cc_nil_value() : () -> i64
    %508 = func.call @cc_intern(%506, %507) : (i64, i64) -> i64
    %509 = func.call @cc_nil_value() : () -> i64
    %510 = func.call @cc_cons(%508, %509) : (i64, i64) -> i64
    %511 = func.call @cc_values_pack(%510) : (i64) -> i64
    %512 = func.call @cc_symbol_value(%508) : (i64) -> i64
    %513 = llvm.mlir.addressof @str48 : !llvm.ptr
    %514 = arith.constant 40 : i64
    %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
    %516 = func.call @cc_nil_value() : () -> i64
    %517 = func.call @cc_intern(%515, %516) : (i64, i64) -> i64
    %518 = func.call @cc_nil_value() : () -> i64
    %519 = func.call @cc_cons(%517, %518) : (i64, i64) -> i64
    %520 = func.call @cc_values_pack(%519) : (i64) -> i64
    %521 = func.call @cc_symbol_value(%517) : (i64) -> i64
    %522 = func.call @cc_nil_value() : () -> i64
    %523 = arith.cmpi ne, %503, %522 : i64
    %524 = scf.if %523 -> (i64) {
      scf.yield %521 : i64
    } else {
      scf.yield %494 : i64
    }
    %525 = func.call @cc_values_pack(%524) : (i64) -> i64
    func.call @stack_push_pointer(%525) : (i64) -> ()
    %526 = func.call @stack_pop_pointer() : () -> i64
    %527 = func.call @cc_multiple_value_list(%526) : (i64) -> i64
    %528 = llvm.mlir.addressof @str49 : !llvm.ptr
    %529 = arith.constant 38 : i64
    %530 = func.call @cc_make_string(%528, %529) : (!llvm.ptr, i64) -> i64
    %531 = func.call @cc_nil_value() : () -> i64
    %532 = func.call @cc_intern(%530, %531) : (i64, i64) -> i64
    %533 = func.call @cc_nil_value() : () -> i64
    %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
    %535 = func.call @cc_values_pack(%534) : (i64) -> i64
    %536 = func.call @cc_symbol_value(%532) : (i64) -> i64
    %537 = llvm.mlir.addressof @str50 : !llvm.ptr
    %538 = arith.constant 39 : i64
    %539 = func.call @cc_make_string(%537, %538) : (!llvm.ptr, i64) -> i64
    %540 = func.call @cc_nil_value() : () -> i64
    %541 = func.call @cc_intern(%539, %540) : (i64, i64) -> i64
    %542 = func.call @cc_nil_value() : () -> i64
    %543 = func.call @cc_cons(%541, %542) : (i64, i64) -> i64
    %544 = func.call @cc_values_pack(%543) : (i64) -> i64
    %545 = func.call @cc_symbol_value(%541) : (i64) -> i64
    %546 = llvm.mlir.addressof @str51 : !llvm.ptr
    %547 = arith.constant 40 : i64
    %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
    %549 = func.call @cc_nil_value() : () -> i64
    %550 = func.call @cc_intern(%548, %549) : (i64, i64) -> i64
    %551 = func.call @cc_nil_value() : () -> i64
    %552 = func.call @cc_cons(%550, %551) : (i64, i64) -> i64
    %553 = func.call @cc_values_pack(%552) : (i64) -> i64
    %554 = func.call @cc_symbol_value(%550) : (i64) -> i64
    %555 = func.call @cc_nil_value() : () -> i64
    %556 = arith.cmpi ne, %536, %555 : i64
    %557 = scf.if %556 -> (i64) {
      scf.yield %554 : i64
    } else {
      scf.yield %527 : i64
    }
    %558 = func.call @cc_values_pack(%557) : (i64) -> i64
    func.call @stack_push_pointer(%558) : (i64) -> ()
    %559 = func.call @stack_pop_pointer() : () -> i64
    %560 = func.call @cc_multiple_value_list(%559) : (i64) -> i64
    %561 = llvm.mlir.addressof @str52 : !llvm.ptr
    %562 = arith.constant 38 : i64
    %563 = func.call @cc_make_string(%561, %562) : (!llvm.ptr, i64) -> i64
    %564 = func.call @cc_nil_value() : () -> i64
    %565 = func.call @cc_intern(%563, %564) : (i64, i64) -> i64
    %566 = func.call @cc_nil_value() : () -> i64
    %567 = func.call @cc_cons(%565, %566) : (i64, i64) -> i64
    %568 = func.call @cc_values_pack(%567) : (i64) -> i64
    %569 = func.call @cc_symbol_value(%565) : (i64) -> i64
    %570 = llvm.mlir.addressof @str53 : !llvm.ptr
    %571 = arith.constant 40 : i64
    %572 = func.call @cc_make_string(%570, %571) : (!llvm.ptr, i64) -> i64
    %573 = func.call @cc_nil_value() : () -> i64
    %574 = func.call @cc_intern(%572, %573) : (i64, i64) -> i64
    %575 = func.call @cc_nil_value() : () -> i64
    %576 = func.call @cc_cons(%574, %575) : (i64, i64) -> i64
    %577 = func.call @cc_values_pack(%576) : (i64) -> i64
    %578 = func.call @cc_symbol_value(%574) : (i64) -> i64
    %579 = func.call @cc_nil_value() : () -> i64
    %580 = arith.cmpi ne, %569, %579 : i64
    %581 = scf.if %580 -> (i64) {
      scf.yield %578 : i64
    } else {
      scf.yield %560 : i64
    }
    %582 = func.call @cc_values_pack(%581) : (i64) -> i64
    func.call @stack_push_pointer(%582) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%eh-baz"() {
    %583 = llvm.mlir.addressof @str54 : !llvm.ptr
    %584 = arith.constant 6 : i64
    %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
    %586 = func.call @cc_nil_value() : () -> i64
    %587 = func.call @cc_intern(%585, %586) : (i64, i64) -> i64
    %588 = func.call @cc_nil_value() : () -> i64
    %589 = func.call @cc_cons(%587, %588) : (i64, i64) -> i64
    %590 = func.call @cc_values_pack(%589) : (i64) -> i64
    %591 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%587, %591) : (i64, i64) -> ()
    %592 = func.call @cc_nil_value() : () -> i64
    %593 = llvm.mlir.addressof @str55 : !llvm.ptr
    %594 = arith.constant 38 : i64
    %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
    %596 = func.call @cc_nil_value() : () -> i64
    %597 = func.call @cc_intern(%595, %596) : (i64, i64) -> i64
    %598 = func.call @cc_nil_value() : () -> i64
    %599 = func.call @cc_cons(%597, %598) : (i64, i64) -> i64
    %600 = func.call @cc_values_pack(%599) : (i64) -> i64
    %601 = func.call @cc_set_symbol_value(%597, %592) : (i64, i64) -> i64
    %602 = llvm.mlir.addressof @str56 : !llvm.ptr
    %603 = arith.constant 39 : i64
    %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
    %605 = func.call @cc_nil_value() : () -> i64
    %606 = func.call @cc_intern(%604, %605) : (i64, i64) -> i64
    %607 = func.call @cc_nil_value() : () -> i64
    %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
    %609 = func.call @cc_values_pack(%608) : (i64) -> i64
    %610 = func.call @cc_set_symbol_value(%606, %592) : (i64, i64) -> i64
    %611 = llvm.mlir.addressof @str57 : !llvm.ptr
    %612 = arith.constant 40 : i64
    %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
    %614 = func.call @cc_nil_value() : () -> i64
    %615 = func.call @cc_intern(%613, %614) : (i64, i64) -> i64
    %616 = func.call @cc_nil_value() : () -> i64
    %617 = func.call @cc_cons(%615, %616) : (i64, i64) -> i64
    %618 = func.call @cc_values_pack(%617) : (i64) -> i64
    %619 = func.call @cc_set_symbol_value(%615, %592) : (i64, i64) -> i64
    %620 = func.call @cc_nil_value() : () -> i64
    %621 = llvm.mlir.addressof @str58 : !llvm.ptr
    %622 = arith.constant 38 : i64
    %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
    %624 = func.call @cc_nil_value() : () -> i64
    %625 = func.call @cc_intern(%623, %624) : (i64, i64) -> i64
    %626 = func.call @cc_nil_value() : () -> i64
    %627 = func.call @cc_cons(%625, %626) : (i64, i64) -> i64
    %628 = func.call @cc_values_pack(%627) : (i64) -> i64
    %629 = func.call @cc_set_symbol_value(%625, %620) : (i64, i64) -> i64
    %630 = llvm.mlir.addressof @str59 : !llvm.ptr
    %631 = arith.constant 39 : i64
    %632 = func.call @cc_make_string(%630, %631) : (!llvm.ptr, i64) -> i64
    %633 = func.call @cc_nil_value() : () -> i64
    %634 = func.call @cc_intern(%632, %633) : (i64, i64) -> i64
    %635 = func.call @cc_nil_value() : () -> i64
    %636 = func.call @cc_cons(%634, %635) : (i64, i64) -> i64
    %637 = func.call @cc_values_pack(%636) : (i64) -> i64
    %638 = func.call @cc_set_symbol_value(%634, %620) : (i64, i64) -> i64
    %639 = llvm.mlir.addressof @str60 : !llvm.ptr
    %640 = arith.constant 40 : i64
    %641 = func.call @cc_make_string(%639, %640) : (!llvm.ptr, i64) -> i64
    %642 = func.call @cc_nil_value() : () -> i64
    %643 = func.call @cc_intern(%641, %642) : (i64, i64) -> i64
    %644 = func.call @cc_nil_value() : () -> i64
    %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
    %646 = func.call @cc_values_pack(%645) : (i64) -> i64
    %647 = func.call @cc_set_symbol_value(%643, %620) : (i64, i64) -> i64
    %648 = func.call @cc_nil_value() : () -> i64
    %649 = llvm.mlir.addressof @str61 : !llvm.ptr
    %650 = arith.constant 38 : i64
    %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
    %652 = func.call @cc_nil_value() : () -> i64
    %653 = func.call @cc_intern(%651, %652) : (i64, i64) -> i64
    %654 = func.call @cc_nil_value() : () -> i64
    %655 = func.call @cc_cons(%653, %654) : (i64, i64) -> i64
    %656 = func.call @cc_values_pack(%655) : (i64) -> i64
    %657 = func.call @cc_set_symbol_value(%653, %648) : (i64, i64) -> i64
    %658 = llvm.mlir.addressof @str62 : !llvm.ptr
    %659 = arith.constant 39 : i64
    %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
    %661 = func.call @cc_nil_value() : () -> i64
    %662 = func.call @cc_intern(%660, %661) : (i64, i64) -> i64
    %663 = func.call @cc_nil_value() : () -> i64
    %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
    %665 = func.call @cc_values_pack(%664) : (i64) -> i64
    %666 = func.call @cc_set_symbol_value(%662, %648) : (i64, i64) -> i64
    %667 = llvm.mlir.addressof @str63 : !llvm.ptr
    %668 = arith.constant 40 : i64
    %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
    %670 = func.call @cc_nil_value() : () -> i64
    %671 = func.call @cc_intern(%669, %670) : (i64, i64) -> i64
    %672 = func.call @cc_nil_value() : () -> i64
    %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
    %674 = func.call @cc_values_pack(%673) : (i64) -> i64
    %675 = func.call @cc_set_symbol_value(%671, %648) : (i64, i64) -> i64
    %676 = arith.constant 1 : i64
    func.call @stack_push_fixnum(%676) : (i64) -> ()
    %677 = func.call @stack_pop_pointer() : () -> i64
    %678 = func.call @cc_multiple_value_list(%677) : (i64) -> i64
    %679 = func.call @cc_t_value() : () -> i64
    %680 = llvm.mlir.addressof @str64 : !llvm.ptr
    %681 = arith.constant 38 : i64
    %682 = func.call @cc_make_string(%680, %681) : (!llvm.ptr, i64) -> i64
    %683 = func.call @cc_nil_value() : () -> i64
    %684 = func.call @cc_intern(%682, %683) : (i64, i64) -> i64
    %685 = func.call @cc_nil_value() : () -> i64
    %686 = func.call @cc_cons(%684, %685) : (i64, i64) -> i64
    %687 = func.call @cc_values_pack(%686) : (i64) -> i64
    %688 = func.call @cc_set_symbol_value(%684, %679) : (i64, i64) -> i64
    %689 = llvm.mlir.addressof @str65 : !llvm.ptr
    %690 = arith.constant 39 : i64
    %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
    %692 = func.call @cc_nil_value() : () -> i64
    %693 = func.call @cc_intern(%691, %692) : (i64, i64) -> i64
    %694 = func.call @cc_nil_value() : () -> i64
    %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
    %696 = func.call @cc_values_pack(%695) : (i64) -> i64
    %697 = func.call @cc_set_symbol_value(%693, %677) : (i64, i64) -> i64
    %698 = llvm.mlir.addressof @str66 : !llvm.ptr
    %699 = arith.constant 40 : i64
    %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
    %701 = func.call @cc_nil_value() : () -> i64
    %702 = func.call @cc_intern(%700, %701) : (i64, i64) -> i64
    %703 = func.call @cc_nil_value() : () -> i64
    %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
    %705 = func.call @cc_values_pack(%704) : (i64) -> i64
    %706 = func.call @cc_set_symbol_value(%702, %678) : (i64, i64) -> i64
    func.call @stack_push_pointer(%677) : (i64) -> ()
    %707 = func.call @stack_pop_pointer() : () -> i64
    %708 = func.call @cc_multiple_value_list(%707) : (i64) -> i64
    %709 = func.call @cc_nil_value() : () -> i64
    %710 = llvm.mlir.addressof @str67 : !llvm.ptr
    %711 = arith.constant 38 : i64
    %712 = func.call @cc_make_string(%710, %711) : (!llvm.ptr, i64) -> i64
    %713 = func.call @cc_nil_value() : () -> i64
    %714 = func.call @cc_intern(%712, %713) : (i64, i64) -> i64
    %715 = func.call @cc_nil_value() : () -> i64
    %716 = func.call @cc_cons(%714, %715) : (i64, i64) -> i64
    %717 = func.call @cc_values_pack(%716) : (i64) -> i64
    %718 = func.call @cc_set_symbol_value(%714, %709) : (i64, i64) -> i64
    %719 = llvm.mlir.addressof @str68 : !llvm.ptr
    %720 = arith.constant 39 : i64
    %721 = func.call @cc_make_string(%719, %720) : (!llvm.ptr, i64) -> i64
    %722 = func.call @cc_nil_value() : () -> i64
    %723 = func.call @cc_intern(%721, %722) : (i64, i64) -> i64
    %724 = func.call @cc_nil_value() : () -> i64
    %725 = func.call @cc_cons(%723, %724) : (i64, i64) -> i64
    %726 = func.call @cc_values_pack(%725) : (i64) -> i64
    %727 = func.call @cc_set_symbol_value(%723, %709) : (i64, i64) -> i64
    %728 = llvm.mlir.addressof @str69 : !llvm.ptr
    %729 = arith.constant 40 : i64
    %730 = func.call @cc_make_string(%728, %729) : (!llvm.ptr, i64) -> i64
    %731 = func.call @cc_nil_value() : () -> i64
    %732 = func.call @cc_intern(%730, %731) : (i64, i64) -> i64
    %733 = func.call @cc_nil_value() : () -> i64
    %734 = func.call @cc_cons(%732, %733) : (i64, i64) -> i64
    %735 = func.call @cc_values_pack(%734) : (i64) -> i64
    %736 = func.call @cc_set_symbol_value(%732, %709) : (i64, i64) -> i64
    %774 = arith.constant 175130764378125 : i64
    %775 = arith.constant 0 : i64
    %776 = func.call @cc_make_closure(%774, %775) : (i64, i64) -> i64
    func.call @stack_push_pointer(%776) : (i64) -> ()
    %777 = func.call @stack_pop_pointer() : () -> i64
    %778 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%777, %778) : (i64, i64) -> ()
    %779 = func.call @stack_pop_pointer() : () -> i64
    %780 = func.call @cc_multiple_value_list(%779) : (i64) -> i64
    %781 = llvm.mlir.addressof @str73 : !llvm.ptr
    %782 = arith.constant 38 : i64
    %783 = func.call @cc_make_string(%781, %782) : (!llvm.ptr, i64) -> i64
    %784 = func.call @cc_nil_value() : () -> i64
    %785 = func.call @cc_intern(%783, %784) : (i64, i64) -> i64
    %786 = func.call @cc_nil_value() : () -> i64
    %787 = func.call @cc_cons(%785, %786) : (i64, i64) -> i64
    %788 = func.call @cc_values_pack(%787) : (i64) -> i64
    %789 = func.call @cc_symbol_value(%785) : (i64) -> i64
    %790 = llvm.mlir.addressof @str74 : !llvm.ptr
    %791 = arith.constant 39 : i64
    %792 = func.call @cc_make_string(%790, %791) : (!llvm.ptr, i64) -> i64
    %793 = func.call @cc_nil_value() : () -> i64
    %794 = func.call @cc_intern(%792, %793) : (i64, i64) -> i64
    %795 = func.call @cc_nil_value() : () -> i64
    %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
    %797 = func.call @cc_values_pack(%796) : (i64) -> i64
    %798 = func.call @cc_symbol_value(%794) : (i64) -> i64
    %799 = llvm.mlir.addressof @str75 : !llvm.ptr
    %800 = arith.constant 40 : i64
    %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
    %802 = func.call @cc_nil_value() : () -> i64
    %803 = func.call @cc_intern(%801, %802) : (i64, i64) -> i64
    %804 = func.call @cc_nil_value() : () -> i64
    %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
    %806 = func.call @cc_values_pack(%805) : (i64) -> i64
    %807 = func.call @cc_symbol_value(%803) : (i64) -> i64
    %808 = func.call @cc_nil_value() : () -> i64
    %809 = arith.cmpi ne, %789, %808 : i64
    %810 = scf.if %809 -> (i64) {
      scf.yield %807 : i64
    } else {
      scf.yield %780 : i64
    }
    %811 = func.call @cc_values_pack(%810) : (i64) -> i64
    func.call @stack_push_pointer(%811) : (i64) -> ()
    %812 = func.call @stack_depth() : () -> i64
    %813 = arith.constant 0 : i64
    %814 = arith.cmpi sgt, %812, %813 : i64
    scf.if %814 {
      %815 = func.call @stack_pop_pointer() : () -> i64
    }
    %816 = func.call @cc_values_pack(%708) : (i64) -> i64
    func.call @stack_push_pointer(%816) : (i64) -> ()
    %817 = func.call @stack_pop_pointer() : () -> i64
    %818 = func.call @cc_multiple_value_list(%817) : (i64) -> i64
    %819 = llvm.mlir.addressof @str76 : !llvm.ptr
    %820 = arith.constant 38 : i64
    %821 = func.call @cc_make_string(%819, %820) : (!llvm.ptr, i64) -> i64
    %822 = func.call @cc_nil_value() : () -> i64
    %823 = func.call @cc_intern(%821, %822) : (i64, i64) -> i64
    %824 = func.call @cc_nil_value() : () -> i64
    %825 = func.call @cc_cons(%823, %824) : (i64, i64) -> i64
    %826 = func.call @cc_values_pack(%825) : (i64) -> i64
    %827 = func.call @cc_symbol_value(%823) : (i64) -> i64
    %828 = llvm.mlir.addressof @str77 : !llvm.ptr
    %829 = arith.constant 39 : i64
    %830 = func.call @cc_make_string(%828, %829) : (!llvm.ptr, i64) -> i64
    %831 = func.call @cc_nil_value() : () -> i64
    %832 = func.call @cc_intern(%830, %831) : (i64, i64) -> i64
    %833 = func.call @cc_nil_value() : () -> i64
    %834 = func.call @cc_cons(%832, %833) : (i64, i64) -> i64
    %835 = func.call @cc_values_pack(%834) : (i64) -> i64
    %836 = func.call @cc_symbol_value(%832) : (i64) -> i64
    %837 = llvm.mlir.addressof @str78 : !llvm.ptr
    %838 = arith.constant 40 : i64
    %839 = func.call @cc_make_string(%837, %838) : (!llvm.ptr, i64) -> i64
    %840 = func.call @cc_nil_value() : () -> i64
    %841 = func.call @cc_intern(%839, %840) : (i64, i64) -> i64
    %842 = func.call @cc_nil_value() : () -> i64
    %843 = func.call @cc_cons(%841, %842) : (i64, i64) -> i64
    %844 = func.call @cc_values_pack(%843) : (i64) -> i64
    %845 = func.call @cc_symbol_value(%841) : (i64) -> i64
    %846 = func.call @cc_nil_value() : () -> i64
    %847 = arith.cmpi ne, %827, %846 : i64
    %848 = scf.if %847 -> (i64) {
      scf.yield %845 : i64
    } else {
      scf.yield %818 : i64
    }
    %849 = func.call @cc_values_pack(%848) : (i64) -> i64
    func.call @stack_push_pointer(%849) : (i64) -> ()
    %850 = func.call @stack_pop_pointer() : () -> i64
    %851 = func.call @cc_multiple_value_list(%850) : (i64) -> i64
    %852 = llvm.mlir.addressof @str79 : !llvm.ptr
    %853 = arith.constant 38 : i64
    %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
    %855 = func.call @cc_nil_value() : () -> i64
    %856 = func.call @cc_intern(%854, %855) : (i64, i64) -> i64
    %857 = func.call @cc_nil_value() : () -> i64
    %858 = func.call @cc_cons(%856, %857) : (i64, i64) -> i64
    %859 = func.call @cc_values_pack(%858) : (i64) -> i64
    %860 = func.call @cc_symbol_value(%856) : (i64) -> i64
    %861 = llvm.mlir.addressof @str80 : !llvm.ptr
    %862 = arith.constant 39 : i64
    %863 = func.call @cc_make_string(%861, %862) : (!llvm.ptr, i64) -> i64
    %864 = func.call @cc_nil_value() : () -> i64
    %865 = func.call @cc_intern(%863, %864) : (i64, i64) -> i64
    %866 = func.call @cc_nil_value() : () -> i64
    %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
    %868 = func.call @cc_values_pack(%867) : (i64) -> i64
    %869 = func.call @cc_symbol_value(%865) : (i64) -> i64
    %870 = llvm.mlir.addressof @str81 : !llvm.ptr
    %871 = arith.constant 40 : i64
    %872 = func.call @cc_make_string(%870, %871) : (!llvm.ptr, i64) -> i64
    %873 = func.call @cc_nil_value() : () -> i64
    %874 = func.call @cc_intern(%872, %873) : (i64, i64) -> i64
    %875 = func.call @cc_nil_value() : () -> i64
    %876 = func.call @cc_cons(%874, %875) : (i64, i64) -> i64
    %877 = func.call @cc_values_pack(%876) : (i64) -> i64
    %878 = func.call @cc_symbol_value(%874) : (i64) -> i64
    %879 = func.call @cc_nil_value() : () -> i64
    %880 = arith.cmpi ne, %860, %879 : i64
    %881 = scf.if %880 -> (i64) {
      scf.yield %878 : i64
    } else {
      scf.yield %851 : i64
    }
    %882 = func.call @cc_values_pack(%881) : (i64) -> i64
    func.call @stack_push_pointer(%882) : (i64) -> ()
    %883 = func.call @stack_pop_pointer() : () -> i64
    %884 = func.call @cc_multiple_value_list(%883) : (i64) -> i64
    %885 = llvm.mlir.addressof @str82 : !llvm.ptr
    %886 = arith.constant 38 : i64
    %887 = func.call @cc_make_string(%885, %886) : (!llvm.ptr, i64) -> i64
    %888 = func.call @cc_nil_value() : () -> i64
    %889 = func.call @cc_intern(%887, %888) : (i64, i64) -> i64
    %890 = func.call @cc_nil_value() : () -> i64
    %891 = func.call @cc_cons(%889, %890) : (i64, i64) -> i64
    %892 = func.call @cc_values_pack(%891) : (i64) -> i64
    %893 = func.call @cc_symbol_value(%889) : (i64) -> i64
    %894 = llvm.mlir.addressof @str83 : !llvm.ptr
    %895 = arith.constant 40 : i64
    %896 = func.call @cc_make_string(%894, %895) : (!llvm.ptr, i64) -> i64
    %897 = func.call @cc_nil_value() : () -> i64
    %898 = func.call @cc_intern(%896, %897) : (i64, i64) -> i64
    %899 = func.call @cc_nil_value() : () -> i64
    %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
    %901 = func.call @cc_values_pack(%900) : (i64) -> i64
    %902 = func.call @cc_symbol_value(%898) : (i64) -> i64
    %903 = func.call @cc_nil_value() : () -> i64
    %904 = arith.cmpi ne, %893, %903 : i64
    %905 = scf.if %904 -> (i64) {
      scf.yield %902 : i64
    } else {
      scf.yield %884 : i64
    }
    %906 = func.call @cc_values_pack(%905) : (i64) -> i64
    func.call @stack_push_pointer(%906) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %907 = llvm.mlir.addressof @str84 : !llvm.ptr
    %908 = arith.constant 6 : i64
    %909 = func.call @cc_make_string(%907, %908) : (!llvm.ptr, i64) -> i64
    %910 = func.call @cc_nil_value() : () -> i64
    %911 = func.call @cc_intern(%909, %910) : (i64, i64) -> i64
    %912 = func.call @cc_nil_value() : () -> i64
    %913 = func.call @cc_cons(%911, %912) : (i64, i64) -> i64
    %914 = func.call @cc_values_pack(%913) : (i64) -> i64
    %915 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%911, %915) : (i64, i64) -> ()
    %916 = func.call @cc_nil_value() : () -> i64
    %917 = llvm.mlir.addressof @str85 : !llvm.ptr
    %918 = arith.constant 38 : i64
    %919 = func.call @cc_make_string(%917, %918) : (!llvm.ptr, i64) -> i64
    %920 = func.call @cc_nil_value() : () -> i64
    %921 = func.call @cc_intern(%919, %920) : (i64, i64) -> i64
    %922 = func.call @cc_nil_value() : () -> i64
    %923 = func.call @cc_cons(%921, %922) : (i64, i64) -> i64
    %924 = func.call @cc_values_pack(%923) : (i64) -> i64
    %925 = func.call @cc_set_symbol_value(%921, %916) : (i64, i64) -> i64
    %926 = llvm.mlir.addressof @str86 : !llvm.ptr
    %927 = arith.constant 39 : i64
    %928 = func.call @cc_make_string(%926, %927) : (!llvm.ptr, i64) -> i64
    %929 = func.call @cc_nil_value() : () -> i64
    %930 = func.call @cc_intern(%928, %929) : (i64, i64) -> i64
    %931 = func.call @cc_nil_value() : () -> i64
    %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
    %933 = func.call @cc_values_pack(%932) : (i64) -> i64
    %934 = func.call @cc_set_symbol_value(%930, %916) : (i64, i64) -> i64
    %935 = llvm.mlir.addressof @str87 : !llvm.ptr
    %936 = arith.constant 40 : i64
    %937 = func.call @cc_make_string(%935, %936) : (!llvm.ptr, i64) -> i64
    %938 = func.call @cc_nil_value() : () -> i64
    %939 = func.call @cc_intern(%937, %938) : (i64, i64) -> i64
    %940 = func.call @cc_nil_value() : () -> i64
    %941 = func.call @cc_cons(%939, %940) : (i64, i64) -> i64
    %942 = func.call @cc_values_pack(%941) : (i64) -> i64
    %943 = func.call @cc_set_symbol_value(%939, %916) : (i64, i64) -> i64
    %944 = func.call @cc_nil_value() : () -> i64
    %945 = func.call @cc_nil_value() : () -> i64
    %946 = func.call @cc_errorp(%944) : (i64) -> i64
    %947 = arith.cmpi ne, %946, %945 : i64
    %948 = scf.if %947 -> (i64) {
      scf.yield %944 : i64
    } else {
      %949 = llvm.mlir.addressof @str88 : !llvm.ptr
      %950 = func.call @cc_make_function_ref_const(%949) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%950) : (i64) -> ()
      %951 = func.call @stack_pop_pointer() : () -> i64
      %952 = llvm.mlir.addressof @str89 : !llvm.ptr
      %953 = arith.constant 6 : i64
      %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
      %955 = llvm.mlir.addressof @str90 : !llvm.ptr
      %956 = arith.constant 15 : i64
      %957 = func.call @cc_make_string(%955, %956) : (!llvm.ptr, i64) -> i64
      %958 = func.call @cc_intern(%954, %957) : (i64, i64) -> i64
      %959 = func.call @cc_nil_value() : () -> i64
      %960 = func.call @cc_cons(%958, %959) : (i64, i64) -> i64
      %961 = func.call @cc_values_pack(%960) : (i64) -> i64
      %962 = func.call @cc_set_symbol_value(%958, %951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%951) : (i64) -> ()
      %963 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %963 : i64
    }
    %964 = func.call @cc_nil_value() : () -> i64
    %965 = func.call @cc_errorp(%948) : (i64) -> i64
    %966 = arith.cmpi ne, %965, %964 : i64
    %967 = scf.if %966 -> (i64) {
      scf.yield %948 : i64
    } else {
      %968 = llvm.mlir.addressof @str91 : !llvm.ptr
      %969 = func.call @cc_make_function_ref_const(%968) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%969) : (i64) -> ()
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = llvm.mlir.addressof @str92 : !llvm.ptr
      %972 = arith.constant 6 : i64
      %973 = func.call @cc_make_string(%971, %972) : (!llvm.ptr, i64) -> i64
      %974 = llvm.mlir.addressof @str93 : !llvm.ptr
      %975 = arith.constant 15 : i64
      %976 = func.call @cc_make_string(%974, %975) : (!llvm.ptr, i64) -> i64
      %977 = func.call @cc_intern(%973, %976) : (i64, i64) -> i64
      %978 = func.call @cc_nil_value() : () -> i64
      %979 = func.call @cc_cons(%977, %978) : (i64, i64) -> i64
      %980 = func.call @cc_values_pack(%979) : (i64) -> i64
      %981 = func.call @cc_set_symbol_value(%977, %970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%970) : (i64) -> ()
      %982 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %982 : i64
    }
    %983 = func.call @cc_nil_value() : () -> i64
    %984 = func.call @cc_errorp(%967) : (i64) -> i64
    %985 = arith.cmpi ne, %984, %983 : i64
    %986 = scf.if %985 -> (i64) {
      scf.yield %967 : i64
    } else {
      %987 = llvm.mlir.addressof @str94 : !llvm.ptr
      %988 = func.call @cc_make_function_ref_const(%987) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%988) : (i64) -> ()
      %989 = func.call @stack_pop_pointer() : () -> i64
      %990 = llvm.mlir.addressof @str95 : !llvm.ptr
      %991 = arith.constant 6 : i64
      %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
      %993 = llvm.mlir.addressof @str96 : !llvm.ptr
      %994 = arith.constant 15 : i64
      %995 = func.call @cc_make_string(%993, %994) : (!llvm.ptr, i64) -> i64
      %996 = func.call @cc_intern(%992, %995) : (i64, i64) -> i64
      %997 = func.call @cc_nil_value() : () -> i64
      %998 = func.call @cc_cons(%996, %997) : (i64, i64) -> i64
      %999 = func.call @cc_values_pack(%998) : (i64) -> i64
      %1000 = func.call @cc_set_symbol_value(%996, %989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%989) : (i64) -> ()
      %1001 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1001 : i64
    }
    %1002 = func.call @cc_nil_value() : () -> i64
    %1003 = func.call @cc_errorp(%986) : (i64) -> i64
    %1004 = arith.cmpi ne, %1003, %1002 : i64
    %1005 = scf.if %1004 -> (i64) {
      scf.yield %986 : i64
    } else {
      %1006 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1007 = func.call @cc_make_function_ref_const(%1006) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1007) : (i64) -> ()
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1010 = arith.constant 6 : i64
      %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
      %1012 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1013 = arith.constant 15 : i64
      %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
      %1015 = func.call @cc_intern(%1011, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_cons(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_values_pack(%1017) : (i64) -> i64
      %1019 = func.call @cc_set_symbol_value(%1015, %1008) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1008) : (i64) -> ()
      %1020 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1020 : i64
    }
    %1021 = func.call @cc_nil_value() : () -> i64
    %1022 = func.call @cc_errorp(%1005) : (i64) -> i64
    %1023 = arith.cmpi ne, %1022, %1021 : i64
    %1024 = scf.if %1023 -> (i64) {
      scf.yield %1005 : i64
    } else {
      %1025 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1026 = arith.constant 6 : i64
      %1027 = func.call @cc_make_string(%1025, %1026) : (!llvm.ptr, i64) -> i64
      %1028 = func.call @cc_nil_value() : () -> i64
      %1029 = func.call @cc_intern(%1027, %1028) : (i64, i64) -> i64
      %1030 = func.call @cc_nil_value() : () -> i64
      %1031 = func.call @cc_cons(%1029, %1030) : (i64, i64) -> i64
      %1032 = func.call @cc_values_pack(%1031) : (i64) -> i64
      func.call @stack_push_pointer(%1029) : (i64) -> ()
      %1033 = func.call @stack_pop_pointer() : () -> i64
      %1034 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1035 = arith.constant 6 : i64
      %1036 = func.call @cc_make_string(%1034, %1035) : (!llvm.ptr, i64) -> i64
      %1037 = func.call @cc_nil_value() : () -> i64
      %1038 = func.call @cc_intern(%1036, %1037) : (i64, i64) -> i64
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_cons(%1038, %1039) : (i64, i64) -> i64
      %1041 = func.call @cc_values_pack(%1040) : (i64) -> i64
      func.call @stack_push_pointer(%1038) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1042 = func.call @stack_pop_pointer() : () -> i64
      %1043 = func.call @stack_pop_pointer() : () -> i64
      %1044 = func.call @cc_cons(%1043, %1042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1044) : (i64) -> ()
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1057 = arith.constant 175130764378127 : i64
      %1058 = arith.constant 0 : i64
      %1059 = func.call @cc_make_closure(%1057, %1058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1059) : (i64) -> ()
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1061) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @cc_cons(%1063, %1062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1067 = arith.constant 11 : i64
      %1068 = func.call @cc_make_string(%1066, %1067) : (!llvm.ptr, i64) -> i64
      %1069 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1070 = arith.constant 7 : i64
      %1071 = func.call @cc_make_string(%1069, %1070) : (!llvm.ptr, i64) -> i64
      %1072 = func.call @cc_intern(%1068, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_nil_value() : () -> i64
      %1074 = func.call @cc_cons(%1072, %1073) : (i64, i64) -> i64
      %1075 = func.call @cc_values_pack(%1074) : (i64) -> i64
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      %1076 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1077 = func.call @stack_pop_pointer() : () -> i64
      %1078 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1079 = arith.constant 4 : i64
      %1080 = func.call @cc_make_string(%1078, %1079) : (!llvm.ptr, i64) -> i64
      %1081 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1082 = arith.constant 7 : i64
      %1083 = func.call @cc_make_string(%1081, %1082) : (!llvm.ptr, i64) -> i64
      %1084 = func.call @cc_intern(%1080, %1083) : (i64, i64) -> i64
      %1085 = func.call @cc_nil_value() : () -> i64
      %1086 = func.call @cc_cons(%1084, %1085) : (i64, i64) -> i64
      %1087 = func.call @cc_values_pack(%1086) : (i64) -> i64
      func.call @stack_push_pointer(%1084) : (i64) -> ()
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1090 = arith.constant 6 : i64
      %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
      %1092 = func.call @cc_nil_value() : () -> i64
      %1093 = func.call @cc_intern(%1091, %1092) : (i64, i64) -> i64
      %1094 = func.call @cc_nil_value() : () -> i64
      %1095 = func.call @cc_cons(%1093, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_values_pack(%1095) : (i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @cc_nil_value() : () -> i64
      %1099 = func.call @cc_errorp(%1033) : (i64) -> i64
      %1100 = arith.cmpi ne, %1099, %1098 : i64
      %1101 = arith.cmpi eq, %1098, %1098 : i64
      %1102 = arith.andi %1100, %1101 : i1
      %1103 = scf.if %1102 -> (i64) {
        scf.yield %1033 : i64
      } else {
        scf.yield %1098 : i64
      }
      %1104 = func.call @cc_errorp(%1045) : (i64) -> i64
      %1105 = arith.cmpi ne, %1104, %1098 : i64
      %1106 = arith.cmpi eq, %1103, %1098 : i64
      %1107 = arith.andi %1105, %1106 : i1
      %1108 = scf.if %1107 -> (i64) {
        scf.yield %1045 : i64
      } else {
        scf.yield %1103 : i64
      }
      %1109 = func.call @cc_errorp(%1060) : (i64) -> i64
      %1110 = arith.cmpi ne, %1109, %1098 : i64
      %1111 = arith.cmpi eq, %1108, %1098 : i64
      %1112 = arith.andi %1110, %1111 : i1
      %1113 = scf.if %1112 -> (i64) {
        scf.yield %1060 : i64
      } else {
        scf.yield %1108 : i64
      }
      %1114 = func.call @cc_errorp(%1065) : (i64) -> i64
      %1115 = arith.cmpi ne, %1114, %1098 : i64
      %1116 = arith.cmpi eq, %1113, %1098 : i64
      %1117 = arith.andi %1115, %1116 : i1
      %1118 = scf.if %1117 -> (i64) {
        scf.yield %1065 : i64
      } else {
        scf.yield %1113 : i64
      }
      %1119 = func.call @cc_errorp(%1076) : (i64) -> i64
      %1120 = arith.cmpi ne, %1119, %1098 : i64
      %1121 = arith.cmpi eq, %1118, %1098 : i64
      %1122 = arith.andi %1120, %1121 : i1
      %1123 = scf.if %1122 -> (i64) {
        scf.yield %1076 : i64
      } else {
        scf.yield %1118 : i64
      }
      %1124 = func.call @cc_errorp(%1077) : (i64) -> i64
      %1125 = arith.cmpi ne, %1124, %1098 : i64
      %1126 = arith.cmpi eq, %1123, %1098 : i64
      %1127 = arith.andi %1125, %1126 : i1
      %1128 = scf.if %1127 -> (i64) {
        scf.yield %1077 : i64
      } else {
        scf.yield %1123 : i64
      }
      %1129 = func.call @cc_errorp(%1088) : (i64) -> i64
      %1130 = arith.cmpi ne, %1129, %1098 : i64
      %1131 = arith.cmpi eq, %1128, %1098 : i64
      %1132 = arith.andi %1130, %1131 : i1
      %1133 = scf.if %1132 -> (i64) {
        scf.yield %1088 : i64
      } else {
        scf.yield %1128 : i64
      }
      %1134 = func.call @cc_errorp(%1097) : (i64) -> i64
      %1135 = arith.cmpi ne, %1134, %1098 : i64
      %1136 = arith.cmpi eq, %1133, %1098 : i64
      %1137 = arith.andi %1135, %1136 : i1
      %1138 = scf.if %1137 -> (i64) {
        scf.yield %1097 : i64
      } else {
        scf.yield %1133 : i64
      }
      %1139 = arith.cmpi ne, %1138, %1098 : i64
      scf.if %1139 {
        func.call @stack_push_pointer(%1138) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1033) : (i64) -> ()
        func.call @stack_push_pointer(%1045) : (i64) -> ()
        func.call @stack_push_pointer(%1060) : (i64) -> ()
        func.call @stack_push_pointer(%1065) : (i64) -> ()
        func.call @stack_push_pointer(%1076) : (i64) -> ()
        func.call @stack_push_pointer(%1077) : (i64) -> ()
        func.call @stack_push_pointer(%1088) : (i64) -> ()
        func.call @stack_push_pointer(%1097) : (i64) -> ()
        %1140 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1141 = func.call @cc_make_function_ref_const(%1140) : (!llvm.ptr) -> i64
        %1142 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1141, %1142) : (i64, i64) -> ()
      }
      %1143 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1143 : i64
    }
    %1144 = func.call @cc_nil_value() : () -> i64
    %1145 = func.call @cc_errorp(%1024) : (i64) -> i64
    %1146 = arith.cmpi ne, %1145, %1144 : i64
    %1147 = scf.if %1146 -> (i64) {
      scf.yield %1024 : i64
    } else {
      %1148 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1149 = func.call @cc_make_function_ref_const(%1148) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1152 = arith.constant 6 : i64
      %1153 = func.call @cc_make_string(%1151, %1152) : (!llvm.ptr, i64) -> i64
      %1154 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1155 = arith.constant 15 : i64
      %1156 = func.call @cc_make_string(%1154, %1155) : (!llvm.ptr, i64) -> i64
      %1157 = func.call @cc_intern(%1153, %1156) : (i64, i64) -> i64
      %1158 = func.call @cc_nil_value() : () -> i64
      %1159 = func.call @cc_cons(%1157, %1158) : (i64, i64) -> i64
      %1160 = func.call @cc_values_pack(%1159) : (i64) -> i64
      %1161 = func.call @cc_set_symbol_value(%1157, %1150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1162 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1162 : i64
    }
    %1163 = func.call @cc_nil_value() : () -> i64
    %1164 = func.call @cc_errorp(%1147) : (i64) -> i64
    %1165 = arith.cmpi ne, %1164, %1163 : i64
    %1166 = scf.if %1165 -> (i64) {
      scf.yield %1147 : i64
    } else {
      %1167 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1168 = func.call @cc_make_function_ref_const(%1167) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1171 = arith.constant 6 : i64
      %1172 = func.call @cc_make_string(%1170, %1171) : (!llvm.ptr, i64) -> i64
      %1173 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1174 = arith.constant 15 : i64
      %1175 = func.call @cc_make_string(%1173, %1174) : (!llvm.ptr, i64) -> i64
      %1176 = func.call @cc_intern(%1172, %1175) : (i64, i64) -> i64
      %1177 = func.call @cc_nil_value() : () -> i64
      %1178 = func.call @cc_cons(%1176, %1177) : (i64, i64) -> i64
      %1179 = func.call @cc_values_pack(%1178) : (i64) -> i64
      %1180 = func.call @cc_set_symbol_value(%1176, %1169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1169) : (i64) -> ()
      %1181 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1181 : i64
    }
    %1182 = func.call @cc_nil_value() : () -> i64
    %1183 = func.call @cc_errorp(%1166) : (i64) -> i64
    %1184 = arith.cmpi ne, %1183, %1182 : i64
    %1185 = scf.if %1184 -> (i64) {
      scf.yield %1166 : i64
    } else {
      %1186 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1187 = func.call @cc_make_function_ref_const(%1186) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      %1188 = func.call @stack_pop_pointer() : () -> i64
      %1189 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1190 = arith.constant 6 : i64
      %1191 = func.call @cc_make_string(%1189, %1190) : (!llvm.ptr, i64) -> i64
      %1192 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1193 = arith.constant 15 : i64
      %1194 = func.call @cc_make_string(%1192, %1193) : (!llvm.ptr, i64) -> i64
      %1195 = func.call @cc_intern(%1191, %1194) : (i64, i64) -> i64
      %1196 = func.call @cc_nil_value() : () -> i64
      %1197 = func.call @cc_cons(%1195, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_values_pack(%1197) : (i64) -> i64
      %1199 = func.call @cc_set_symbol_value(%1195, %1188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1188) : (i64) -> ()
      %1200 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1200 : i64
    }
    %1201 = func.call @cc_nil_value() : () -> i64
    %1202 = func.call @cc_errorp(%1185) : (i64) -> i64
    %1203 = arith.cmpi ne, %1202, %1201 : i64
    %1204 = scf.if %1203 -> (i64) {
      scf.yield %1185 : i64
    } else {
      %1205 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1206 = func.call @cc_make_function_ref_const(%1205) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1206) : (i64) -> ()
      %1207 = func.call @stack_pop_pointer() : () -> i64
      %1208 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1209 = arith.constant 6 : i64
      %1210 = func.call @cc_make_string(%1208, %1209) : (!llvm.ptr, i64) -> i64
      %1211 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1212 = arith.constant 15 : i64
      %1213 = func.call @cc_make_string(%1211, %1212) : (!llvm.ptr, i64) -> i64
      %1214 = func.call @cc_intern(%1210, %1213) : (i64, i64) -> i64
      %1215 = func.call @cc_nil_value() : () -> i64
      %1216 = func.call @cc_cons(%1214, %1215) : (i64, i64) -> i64
      %1217 = func.call @cc_values_pack(%1216) : (i64) -> i64
      %1218 = func.call @cc_set_symbol_value(%1214, %1207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1207) : (i64) -> ()
      %1219 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1219 : i64
    }
    %1220 = func.call @cc_nil_value() : () -> i64
    %1221 = func.call @cc_errorp(%1204) : (i64) -> i64
    %1222 = arith.cmpi ne, %1221, %1220 : i64
    %1223 = scf.if %1222 -> (i64) {
      scf.yield %1204 : i64
    } else {
      %1224 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1225 = arith.constant 6 : i64
      %1226 = func.call @cc_make_string(%1224, %1225) : (!llvm.ptr, i64) -> i64
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_intern(%1226, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_nil_value() : () -> i64
      %1230 = func.call @cc_cons(%1228, %1229) : (i64, i64) -> i64
      %1231 = func.call @cc_values_pack(%1230) : (i64) -> i64
      func.call @stack_push_pointer(%1228) : (i64) -> ()
      %1232 = func.call @stack_pop_pointer() : () -> i64
      %1233 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1234 = arith.constant 6 : i64
      %1235 = func.call @cc_make_string(%1233, %1234) : (!llvm.ptr, i64) -> i64
      %1236 = func.call @cc_nil_value() : () -> i64
      %1237 = func.call @cc_intern(%1235, %1236) : (i64, i64) -> i64
      %1238 = func.call @cc_nil_value() : () -> i64
      %1239 = func.call @cc_cons(%1237, %1238) : (i64, i64) -> i64
      %1240 = func.call @cc_values_pack(%1239) : (i64) -> i64
      func.call @stack_push_pointer(%1237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1241 = func.call @stack_pop_pointer() : () -> i64
      %1242 = func.call @stack_pop_pointer() : () -> i64
      %1243 = func.call @cc_cons(%1242, %1241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1243) : (i64) -> ()
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1256 = arith.constant 175130764378128 : i64
      %1257 = arith.constant 0 : i64
      %1258 = func.call @cc_make_closure(%1256, %1257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_cons(%1262, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1266 = arith.constant 11 : i64
      %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
      %1268 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1269 = arith.constant 7 : i64
      %1270 = func.call @cc_make_string(%1268, %1269) : (!llvm.ptr, i64) -> i64
      %1271 = func.call @cc_intern(%1267, %1270) : (i64, i64) -> i64
      %1272 = func.call @cc_nil_value() : () -> i64
      %1273 = func.call @cc_cons(%1271, %1272) : (i64, i64) -> i64
      %1274 = func.call @cc_values_pack(%1273) : (i64) -> i64
      func.call @stack_push_pointer(%1271) : (i64) -> ()
      %1275 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1278 = arith.constant 4 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1281 = arith.constant 7 : i64
      %1282 = func.call @cc_make_string(%1280, %1281) : (!llvm.ptr, i64) -> i64
      %1283 = func.call @cc_intern(%1279, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_nil_value() : () -> i64
      %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
      %1286 = func.call @cc_values_pack(%1285) : (i64) -> i64
      func.call @stack_push_pointer(%1283) : (i64) -> ()
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1289 = arith.constant 6 : i64
      %1290 = func.call @cc_make_string(%1288, %1289) : (!llvm.ptr, i64) -> i64
      %1291 = func.call @cc_nil_value() : () -> i64
      %1292 = func.call @cc_intern(%1290, %1291) : (i64, i64) -> i64
      %1293 = func.call @cc_nil_value() : () -> i64
      %1294 = func.call @cc_cons(%1292, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_values_pack(%1294) : (i64) -> i64
      func.call @stack_push_pointer(%1292) : (i64) -> ()
      %1296 = func.call @stack_pop_pointer() : () -> i64
      %1297 = func.call @cc_nil_value() : () -> i64
      %1298 = func.call @cc_errorp(%1232) : (i64) -> i64
      %1299 = arith.cmpi ne, %1298, %1297 : i64
      %1300 = arith.cmpi eq, %1297, %1297 : i64
      %1301 = arith.andi %1299, %1300 : i1
      %1302 = scf.if %1301 -> (i64) {
        scf.yield %1232 : i64
      } else {
        scf.yield %1297 : i64
      }
      %1303 = func.call @cc_errorp(%1244) : (i64) -> i64
      %1304 = arith.cmpi ne, %1303, %1297 : i64
      %1305 = arith.cmpi eq, %1302, %1297 : i64
      %1306 = arith.andi %1304, %1305 : i1
      %1307 = scf.if %1306 -> (i64) {
        scf.yield %1244 : i64
      } else {
        scf.yield %1302 : i64
      }
      %1308 = func.call @cc_errorp(%1259) : (i64) -> i64
      %1309 = arith.cmpi ne, %1308, %1297 : i64
      %1310 = arith.cmpi eq, %1307, %1297 : i64
      %1311 = arith.andi %1309, %1310 : i1
      %1312 = scf.if %1311 -> (i64) {
        scf.yield %1259 : i64
      } else {
        scf.yield %1307 : i64
      }
      %1313 = func.call @cc_errorp(%1264) : (i64) -> i64
      %1314 = arith.cmpi ne, %1313, %1297 : i64
      %1315 = arith.cmpi eq, %1312, %1297 : i64
      %1316 = arith.andi %1314, %1315 : i1
      %1317 = scf.if %1316 -> (i64) {
        scf.yield %1264 : i64
      } else {
        scf.yield %1312 : i64
      }
      %1318 = func.call @cc_errorp(%1275) : (i64) -> i64
      %1319 = arith.cmpi ne, %1318, %1297 : i64
      %1320 = arith.cmpi eq, %1317, %1297 : i64
      %1321 = arith.andi %1319, %1320 : i1
      %1322 = scf.if %1321 -> (i64) {
        scf.yield %1275 : i64
      } else {
        scf.yield %1317 : i64
      }
      %1323 = func.call @cc_errorp(%1276) : (i64) -> i64
      %1324 = arith.cmpi ne, %1323, %1297 : i64
      %1325 = arith.cmpi eq, %1322, %1297 : i64
      %1326 = arith.andi %1324, %1325 : i1
      %1327 = scf.if %1326 -> (i64) {
        scf.yield %1276 : i64
      } else {
        scf.yield %1322 : i64
      }
      %1328 = func.call @cc_errorp(%1287) : (i64) -> i64
      %1329 = arith.cmpi ne, %1328, %1297 : i64
      %1330 = arith.cmpi eq, %1327, %1297 : i64
      %1331 = arith.andi %1329, %1330 : i1
      %1332 = scf.if %1331 -> (i64) {
        scf.yield %1287 : i64
      } else {
        scf.yield %1327 : i64
      }
      %1333 = func.call @cc_errorp(%1296) : (i64) -> i64
      %1334 = arith.cmpi ne, %1333, %1297 : i64
      %1335 = arith.cmpi eq, %1332, %1297 : i64
      %1336 = arith.andi %1334, %1335 : i1
      %1337 = scf.if %1336 -> (i64) {
        scf.yield %1296 : i64
      } else {
        scf.yield %1332 : i64
      }
      %1338 = arith.cmpi ne, %1337, %1297 : i64
      scf.if %1338 {
        func.call @stack_push_pointer(%1337) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1232) : (i64) -> ()
        func.call @stack_push_pointer(%1244) : (i64) -> ()
        func.call @stack_push_pointer(%1259) : (i64) -> ()
        func.call @stack_push_pointer(%1264) : (i64) -> ()
        func.call @stack_push_pointer(%1275) : (i64) -> ()
        func.call @stack_push_pointer(%1276) : (i64) -> ()
        func.call @stack_push_pointer(%1287) : (i64) -> ()
        func.call @stack_push_pointer(%1296) : (i64) -> ()
        %1339 = llvm.mlir.addressof @str129 : !llvm.ptr
        %1340 = func.call @cc_make_function_ref_const(%1339) : (!llvm.ptr) -> i64
        %1341 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1340, %1341) : (i64, i64) -> ()
      }
      %1342 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1342 : i64
    }
    %1343 = func.call @cc_nil_value() : () -> i64
    %1344 = func.call @cc_errorp(%1223) : (i64) -> i64
    %1345 = arith.cmpi ne, %1344, %1343 : i64
    %1346 = scf.if %1345 -> (i64) {
      scf.yield %1223 : i64
    } else {
      %1347 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1348 = func.call @cc_make_function_ref_const(%1347) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1351 = arith.constant 6 : i64
      %1352 = func.call @cc_make_string(%1350, %1351) : (!llvm.ptr, i64) -> i64
      %1353 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1354 = arith.constant 15 : i64
      %1355 = func.call @cc_make_string(%1353, %1354) : (!llvm.ptr, i64) -> i64
      %1356 = func.call @cc_intern(%1352, %1355) : (i64, i64) -> i64
      %1357 = func.call @cc_nil_value() : () -> i64
      %1358 = func.call @cc_cons(%1356, %1357) : (i64, i64) -> i64
      %1359 = func.call @cc_values_pack(%1358) : (i64) -> i64
      %1360 = func.call @cc_set_symbol_value(%1356, %1349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1349) : (i64) -> ()
      %1361 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1361 : i64
    }
    %1362 = func.call @cc_nil_value() : () -> i64
    %1363 = func.call @cc_errorp(%1346) : (i64) -> i64
    %1364 = arith.cmpi ne, %1363, %1362 : i64
    %1365 = scf.if %1364 -> (i64) {
      scf.yield %1346 : i64
    } else {
      %1366 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1367 = func.call @cc_make_function_ref_const(%1366) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1367) : (i64) -> ()
      %1368 = func.call @stack_pop_pointer() : () -> i64
      %1369 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1370 = arith.constant 6 : i64
      %1371 = func.call @cc_make_string(%1369, %1370) : (!llvm.ptr, i64) -> i64
      %1372 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1373 = arith.constant 15 : i64
      %1374 = func.call @cc_make_string(%1372, %1373) : (!llvm.ptr, i64) -> i64
      %1375 = func.call @cc_intern(%1371, %1374) : (i64, i64) -> i64
      %1376 = func.call @cc_nil_value() : () -> i64
      %1377 = func.call @cc_cons(%1375, %1376) : (i64, i64) -> i64
      %1378 = func.call @cc_values_pack(%1377) : (i64) -> i64
      %1379 = func.call @cc_set_symbol_value(%1375, %1368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1368) : (i64) -> ()
      %1380 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1380 : i64
    }
    %1381 = func.call @cc_nil_value() : () -> i64
    %1382 = func.call @cc_errorp(%1365) : (i64) -> i64
    %1383 = arith.cmpi ne, %1382, %1381 : i64
    %1384 = scf.if %1383 -> (i64) {
      scf.yield %1365 : i64
    } else {
      %1385 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1386 = func.call @cc_make_function_ref_const(%1385) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1389 = arith.constant 6 : i64
      %1390 = func.call @cc_make_string(%1388, %1389) : (!llvm.ptr, i64) -> i64
      %1391 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1392 = arith.constant 15 : i64
      %1393 = func.call @cc_make_string(%1391, %1392) : (!llvm.ptr, i64) -> i64
      %1394 = func.call @cc_intern(%1390, %1393) : (i64, i64) -> i64
      %1395 = func.call @cc_nil_value() : () -> i64
      %1396 = func.call @cc_cons(%1394, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_values_pack(%1396) : (i64) -> i64
      %1398 = func.call @cc_set_symbol_value(%1394, %1387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1387) : (i64) -> ()
      %1399 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1399 : i64
    }
    %1400 = func.call @cc_nil_value() : () -> i64
    %1401 = func.call @cc_errorp(%1384) : (i64) -> i64
    %1402 = arith.cmpi ne, %1401, %1400 : i64
    %1403 = scf.if %1402 -> (i64) {
      scf.yield %1384 : i64
    } else {
      %1404 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1405 = func.call @cc_make_function_ref_const(%1404) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1405) : (i64) -> ()
      %1406 = func.call @stack_pop_pointer() : () -> i64
      %1407 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1408 = arith.constant 6 : i64
      %1409 = func.call @cc_make_string(%1407, %1408) : (!llvm.ptr, i64) -> i64
      %1410 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1411 = arith.constant 15 : i64
      %1412 = func.call @cc_make_string(%1410, %1411) : (!llvm.ptr, i64) -> i64
      %1413 = func.call @cc_intern(%1409, %1412) : (i64, i64) -> i64
      %1414 = func.call @cc_nil_value() : () -> i64
      %1415 = func.call @cc_cons(%1413, %1414) : (i64, i64) -> i64
      %1416 = func.call @cc_values_pack(%1415) : (i64) -> i64
      %1417 = func.call @cc_set_symbol_value(%1413, %1406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1406) : (i64) -> ()
      %1418 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1418 : i64
    }
    %1419 = func.call @cc_nil_value() : () -> i64
    %1420 = func.call @cc_errorp(%1403) : (i64) -> i64
    %1421 = arith.cmpi ne, %1420, %1419 : i64
    %1422 = scf.if %1421 -> (i64) {
      scf.yield %1403 : i64
    } else {
      %1423 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1424 = arith.constant 5 : i64
      %1425 = func.call @cc_make_string(%1423, %1424) : (!llvm.ptr, i64) -> i64
      %1426 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1427 = arith.constant 11 : i64
      %1428 = func.call @cc_make_string(%1426, %1427) : (!llvm.ptr, i64) -> i64
      %1429 = func.call @cc_intern(%1425, %1428) : (i64, i64) -> i64
      %1430 = func.call @cc_nil_value() : () -> i64
      %1431 = func.call @cc_cons(%1429, %1430) : (i64, i64) -> i64
      %1432 = func.call @cc_values_pack(%1431) : (i64) -> i64
      func.call @stack_push_pointer(%1429) : (i64) -> ()
      %1433 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1434 = arith.constant 6 : i64
      %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
      %1436 = func.call @cc_nil_value() : () -> i64
      %1437 = func.call @cc_intern(%1435, %1436) : (i64, i64) -> i64
      %1438 = func.call @cc_nil_value() : () -> i64
      %1439 = func.call @cc_cons(%1437, %1438) : (i64, i64) -> i64
      %1440 = func.call @cc_values_pack(%1439) : (i64) -> i64
      func.call @stack_push_pointer(%1437) : (i64) -> ()
      %1441 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1442 = arith.constant 1 : i64
      %1443 = func.call @cc_make_string(%1441, %1442) : (!llvm.ptr, i64) -> i64
      %1444 = func.call @cc_nil_value() : () -> i64
      %1445 = func.call @cc_intern(%1443, %1444) : (i64, i64) -> i64
      %1446 = func.call @cc_nil_value() : () -> i64
      %1447 = func.call @cc_cons(%1445, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_values_pack(%1447) : (i64) -> i64
      func.call @stack_push_pointer(%1445) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1449 = func.call @stack_pop_pointer() : () -> i64
      %1450 = func.call @stack_pop_pointer() : () -> i64
      %1451 = func.call @cc_cons(%1450, %1449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1451) : (i64) -> ()
      %1452 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1453 = arith.constant 5 : i64
      %1454 = func.call @cc_make_string(%1452, %1453) : (!llvm.ptr, i64) -> i64
      %1455 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1456 = arith.constant 11 : i64
      %1457 = func.call @cc_make_string(%1455, %1456) : (!llvm.ptr, i64) -> i64
      %1458 = func.call @cc_intern(%1454, %1457) : (i64, i64) -> i64
      %1459 = func.call @cc_nil_value() : () -> i64
      %1460 = func.call @cc_cons(%1458, %1459) : (i64, i64) -> i64
      %1461 = func.call @cc_values_pack(%1460) : (i64) -> i64
      func.call @stack_push_pointer(%1458) : (i64) -> ()
      %1462 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1463 = arith.constant 1 : i64
      %1464 = func.call @cc_make_string(%1462, %1463) : (!llvm.ptr, i64) -> i64
      %1465 = func.call @cc_nil_value() : () -> i64
      %1466 = func.call @cc_intern(%1464, %1465) : (i64, i64) -> i64
      %1467 = func.call @cc_nil_value() : () -> i64
      %1468 = func.call @cc_cons(%1466, %1467) : (i64, i64) -> i64
      %1469 = func.call @cc_values_pack(%1468) : (i64) -> i64
      func.call @stack_push_pointer(%1466) : (i64) -> ()
      %1470 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1471 = arith.constant 7 : i64
      %1472 = func.call @cc_make_string(%1470, %1471) : (!llvm.ptr, i64) -> i64
      %1473 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1474 = arith.constant 11 : i64
      %1475 = func.call @cc_make_string(%1473, %1474) : (!llvm.ptr, i64) -> i64
      %1476 = func.call @cc_intern(%1472, %1475) : (i64, i64) -> i64
      %1477 = func.call @cc_nil_value() : () -> i64
      %1478 = func.call @cc_cons(%1476, %1477) : (i64, i64) -> i64
      %1479 = func.call @cc_values_pack(%1478) : (i64) -> i64
      func.call @stack_push_pointer(%1476) : (i64) -> ()
      %1480 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1481 = arith.constant 6 : i64
      %1482 = func.call @cc_make_string(%1480, %1481) : (!llvm.ptr, i64) -> i64
      %1483 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1484 = arith.constant 11 : i64
      %1485 = func.call @cc_make_string(%1483, %1484) : (!llvm.ptr, i64) -> i64
      %1486 = func.call @cc_intern(%1482, %1485) : (i64, i64) -> i64
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = func.call @cc_cons(%1486, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_values_pack(%1488) : (i64) -> i64
      func.call @stack_push_pointer(%1486) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1490 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1491 = arith.constant 5 : i64
      %1492 = func.call @cc_make_string(%1490, %1491) : (!llvm.ptr, i64) -> i64
      %1493 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1494 = arith.constant 11 : i64
      %1495 = func.call @cc_make_string(%1493, %1494) : (!llvm.ptr, i64) -> i64
      %1496 = func.call @cc_intern(%1492, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_nil_value() : () -> i64
      %1498 = func.call @cc_cons(%1496, %1497) : (i64, i64) -> i64
      %1499 = func.call @cc_values_pack(%1498) : (i64) -> i64
      func.call @stack_push_pointer(%1496) : (i64) -> ()
      %1500 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1501 = arith.constant 1 : i64
      %1502 = func.call @cc_make_string(%1500, %1501) : (!llvm.ptr, i64) -> i64
      %1503 = func.call @cc_nil_value() : () -> i64
      %1504 = func.call @cc_intern(%1502, %1503) : (i64, i64) -> i64
      %1505 = func.call @cc_nil_value() : () -> i64
      %1506 = func.call @cc_cons(%1504, %1505) : (i64, i64) -> i64
      %1507 = func.call @cc_values_pack(%1506) : (i64) -> i64
      func.call @stack_push_pointer(%1504) : (i64) -> ()
      %1508 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1509 = arith.constant 4 : i64
      %1510 = func.call @cc_make_string(%1508, %1509) : (!llvm.ptr, i64) -> i64
      %1511 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1512 = arith.constant 11 : i64
      %1513 = func.call @cc_make_string(%1511, %1512) : (!llvm.ptr, i64) -> i64
      %1514 = func.call @cc_intern(%1510, %1513) : (i64, i64) -> i64
      %1515 = func.call @cc_nil_value() : () -> i64
      %1516 = func.call @cc_cons(%1514, %1515) : (i64, i64) -> i64
      %1517 = func.call @cc_values_pack(%1516) : (i64) -> i64
      func.call @stack_push_pointer(%1514) : (i64) -> ()
      %1518 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1519 = arith.constant 2 : i64
      %1520 = func.call @cc_make_string(%1518, %1519) : (!llvm.ptr, i64) -> i64
      %1521 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1522 = arith.constant 11 : i64
      %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
      %1524 = func.call @cc_intern(%1520, %1523) : (i64, i64) -> i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = func.call @cc_cons(%1524, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_values_pack(%1526) : (i64) -> i64
      func.call @stack_push_pointer(%1524) : (i64) -> ()
      %1528 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1529 = arith.constant 1 : i64
      %1530 = func.call @cc_make_string(%1528, %1529) : (!llvm.ptr, i64) -> i64
      %1531 = func.call @cc_nil_value() : () -> i64
      %1532 = func.call @cc_intern(%1530, %1531) : (i64, i64) -> i64
      %1533 = func.call @cc_nil_value() : () -> i64
      %1534 = func.call @cc_cons(%1532, %1533) : (i64, i64) -> i64
      %1535 = func.call @cc_values_pack(%1534) : (i64) -> i64
      func.call @stack_push_pointer(%1532) : (i64) -> ()
      %1536 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1537 = arith.constant 5 : i64
      %1538 = func.call @cc_make_string(%1536, %1537) : (!llvm.ptr, i64) -> i64
      %1539 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1540 = arith.constant 11 : i64
      %1541 = func.call @cc_make_string(%1539, %1540) : (!llvm.ptr, i64) -> i64
      %1542 = func.call @cc_intern(%1538, %1541) : (i64, i64) -> i64
      %1543 = func.call @cc_nil_value() : () -> i64
      %1544 = func.call @cc_cons(%1542, %1543) : (i64, i64) -> i64
      %1545 = func.call @cc_values_pack(%1544) : (i64) -> i64
      func.call @stack_push_pointer(%1542) : (i64) -> ()
      %1546 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1547 = arith.constant 1 : i64
      %1548 = func.call @cc_make_string(%1546, %1547) : (!llvm.ptr, i64) -> i64
      %1549 = func.call @cc_nil_value() : () -> i64
      %1550 = func.call @cc_intern(%1548, %1549) : (i64, i64) -> i64
      %1551 = func.call @cc_nil_value() : () -> i64
      %1552 = func.call @cc_cons(%1550, %1551) : (i64, i64) -> i64
      %1553 = func.call @cc_values_pack(%1552) : (i64) -> i64
      func.call @stack_push_pointer(%1550) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1554 = func.call @stack_pop_pointer() : () -> i64
      %1555 = func.call @stack_pop_pointer() : () -> i64
      %1556 = func.call @cc_cons(%1555, %1554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1556) : (i64) -> ()
      %1557 = func.call @stack_pop_pointer() : () -> i64
      %1558 = func.call @stack_pop_pointer() : () -> i64
      %1559 = func.call @cc_cons(%1558, %1557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1559) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1560 = func.call @stack_pop_pointer() : () -> i64
      %1561 = func.call @stack_pop_pointer() : () -> i64
      %1562 = func.call @cc_cons(%1561, %1560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1562) : (i64) -> ()
      %1563 = func.call @stack_pop_pointer() : () -> i64
      %1564 = func.call @stack_pop_pointer() : () -> i64
      %1565 = func.call @cc_cons(%1564, %1563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1565) : (i64) -> ()
      %1566 = func.call @stack_pop_pointer() : () -> i64
      %1567 = func.call @stack_pop_pointer() : () -> i64
      %1568 = func.call @cc_cons(%1567, %1566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1568) : (i64) -> ()
      %1569 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1570 = arith.constant 11 : i64
      %1571 = func.call @cc_make_string(%1569, %1570) : (!llvm.ptr, i64) -> i64
      %1572 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1573 = arith.constant 11 : i64
      %1574 = func.call @cc_make_string(%1572, %1573) : (!llvm.ptr, i64) -> i64
      %1575 = func.call @cc_intern(%1571, %1574) : (i64, i64) -> i64
      %1576 = func.call @cc_nil_value() : () -> i64
      %1577 = func.call @cc_cons(%1575, %1576) : (i64, i64) -> i64
      %1578 = func.call @cc_values_pack(%1577) : (i64) -> i64
      func.call @stack_push_pointer(%1575) : (i64) -> ()
      %1579 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1580 = arith.constant 1 : i64
      %1581 = func.call @cc_make_string(%1579, %1580) : (!llvm.ptr, i64) -> i64
      %1582 = func.call @cc_nil_value() : () -> i64
      %1583 = func.call @cc_intern(%1581, %1582) : (i64, i64) -> i64
      %1584 = func.call @cc_nil_value() : () -> i64
      %1585 = func.call @cc_cons(%1583, %1584) : (i64, i64) -> i64
      %1586 = func.call @cc_values_pack(%1585) : (i64) -> i64
      func.call @stack_push_pointer(%1583) : (i64) -> ()
      %1587 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1588 = arith.constant 1 : i64
      %1589 = func.call @cc_make_string(%1587, %1588) : (!llvm.ptr, i64) -> i64
      %1590 = func.call @cc_nil_value() : () -> i64
      %1591 = func.call @cc_intern(%1589, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = func.call @cc_cons(%1591, %1592) : (i64, i64) -> i64
      %1594 = func.call @cc_values_pack(%1593) : (i64) -> i64
      func.call @stack_push_pointer(%1591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1595 = func.call @stack_pop_pointer() : () -> i64
      %1596 = func.call @stack_pop_pointer() : () -> i64
      %1597 = func.call @cc_cons(%1596, %1595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1597) : (i64) -> ()
      %1598 = func.call @stack_pop_pointer() : () -> i64
      %1599 = func.call @stack_pop_pointer() : () -> i64
      %1600 = func.call @cc_cons(%1599, %1598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1600) : (i64) -> ()
      %1601 = func.call @stack_pop_pointer() : () -> i64
      %1602 = func.call @stack_pop_pointer() : () -> i64
      %1603 = func.call @cc_cons(%1602, %1601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1604 = func.call @stack_pop_pointer() : () -> i64
      %1605 = func.call @stack_pop_pointer() : () -> i64
      %1606 = func.call @cc_cons(%1605, %1604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1606) : (i64) -> ()
      %1607 = func.call @stack_pop_pointer() : () -> i64
      %1608 = func.call @stack_pop_pointer() : () -> i64
      %1609 = func.call @cc_cons(%1608, %1607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1609) : (i64) -> ()
      %1610 = func.call @stack_pop_pointer() : () -> i64
      %1611 = func.call @stack_pop_pointer() : () -> i64
      %1612 = func.call @cc_cons(%1611, %1610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1612) : (i64) -> ()
      %1613 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1614 = arith.constant 7 : i64
      %1615 = func.call @cc_make_string(%1613, %1614) : (!llvm.ptr, i64) -> i64
      %1616 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1617 = arith.constant 11 : i64
      %1618 = func.call @cc_make_string(%1616, %1617) : (!llvm.ptr, i64) -> i64
      %1619 = func.call @cc_intern(%1615, %1618) : (i64, i64) -> i64
      %1620 = func.call @cc_nil_value() : () -> i64
      %1621 = func.call @cc_cons(%1619, %1620) : (i64, i64) -> i64
      %1622 = func.call @cc_values_pack(%1621) : (i64) -> i64
      func.call @stack_push_pointer(%1619) : (i64) -> ()
      %1623 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1624 = arith.constant 6 : i64
      %1625 = func.call @cc_make_string(%1623, %1624) : (!llvm.ptr, i64) -> i64
      %1626 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1627 = arith.constant 11 : i64
      %1628 = func.call @cc_make_string(%1626, %1627) : (!llvm.ptr, i64) -> i64
      %1629 = func.call @cc_intern(%1625, %1628) : (i64, i64) -> i64
      %1630 = func.call @cc_nil_value() : () -> i64
      %1631 = func.call @cc_cons(%1629, %1630) : (i64, i64) -> i64
      %1632 = func.call @cc_values_pack(%1631) : (i64) -> i64
      func.call @stack_push_pointer(%1629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1633 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1634 = arith.constant 4 : i64
      %1635 = func.call @cc_make_string(%1633, %1634) : (!llvm.ptr, i64) -> i64
      %1636 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1637 = arith.constant 11 : i64
      %1638 = func.call @cc_make_string(%1636, %1637) : (!llvm.ptr, i64) -> i64
      %1639 = func.call @cc_intern(%1635, %1638) : (i64, i64) -> i64
      %1640 = func.call @cc_nil_value() : () -> i64
      %1641 = func.call @cc_cons(%1639, %1640) : (i64, i64) -> i64
      %1642 = func.call @cc_values_pack(%1641) : (i64) -> i64
      func.call @stack_push_pointer(%1639) : (i64) -> ()
      %1643 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1644 = arith.constant 2 : i64
      %1645 = func.call @cc_make_string(%1643, %1644) : (!llvm.ptr, i64) -> i64
      %1646 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1647 = arith.constant 11 : i64
      %1648 = func.call @cc_make_string(%1646, %1647) : (!llvm.ptr, i64) -> i64
      %1649 = func.call @cc_intern(%1645, %1648) : (i64, i64) -> i64
      %1650 = func.call @cc_nil_value() : () -> i64
      %1651 = func.call @cc_cons(%1649, %1650) : (i64, i64) -> i64
      %1652 = func.call @cc_values_pack(%1651) : (i64) -> i64
      func.call @stack_push_pointer(%1649) : (i64) -> ()
      %1653 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1654 = arith.constant 1 : i64
      %1655 = func.call @cc_make_string(%1653, %1654) : (!llvm.ptr, i64) -> i64
      %1656 = func.call @cc_nil_value() : () -> i64
      %1657 = func.call @cc_intern(%1655, %1656) : (i64, i64) -> i64
      %1658 = func.call @cc_nil_value() : () -> i64
      %1659 = func.call @cc_cons(%1657, %1658) : (i64, i64) -> i64
      %1660 = func.call @cc_values_pack(%1659) : (i64) -> i64
      func.call @stack_push_pointer(%1657) : (i64) -> ()
      %1661 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1662 = arith.constant 5 : i64
      %1663 = func.call @cc_make_string(%1661, %1662) : (!llvm.ptr, i64) -> i64
      %1664 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1665 = arith.constant 11 : i64
      %1666 = func.call @cc_make_string(%1664, %1665) : (!llvm.ptr, i64) -> i64
      %1667 = func.call @cc_intern(%1663, %1666) : (i64, i64) -> i64
      %1668 = func.call @cc_nil_value() : () -> i64
      %1669 = func.call @cc_cons(%1667, %1668) : (i64, i64) -> i64
      %1670 = func.call @cc_values_pack(%1669) : (i64) -> i64
      func.call @stack_push_pointer(%1667) : (i64) -> ()
      %1671 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1672 = arith.constant 1 : i64
      %1673 = func.call @cc_make_string(%1671, %1672) : (!llvm.ptr, i64) -> i64
      %1674 = func.call @cc_nil_value() : () -> i64
      %1675 = func.call @cc_intern(%1673, %1674) : (i64, i64) -> i64
      %1676 = func.call @cc_nil_value() : () -> i64
      %1677 = func.call @cc_cons(%1675, %1676) : (i64, i64) -> i64
      %1678 = func.call @cc_values_pack(%1677) : (i64) -> i64
      func.call @stack_push_pointer(%1675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1679 = func.call @stack_pop_pointer() : () -> i64
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = func.call @cc_cons(%1680, %1679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1681) : (i64) -> ()
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @cc_cons(%1683, %1682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1684) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1685 = func.call @stack_pop_pointer() : () -> i64
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @cc_cons(%1686, %1685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1687) : (i64) -> ()
      %1688 = func.call @stack_pop_pointer() : () -> i64
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @cc_cons(%1689, %1688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1690) : (i64) -> ()
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = func.call @cc_cons(%1692, %1691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1693) : (i64) -> ()
      %1694 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1695 = arith.constant 11 : i64
      %1696 = func.call @cc_make_string(%1694, %1695) : (!llvm.ptr, i64) -> i64
      %1697 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1698 = arith.constant 11 : i64
      %1699 = func.call @cc_make_string(%1697, %1698) : (!llvm.ptr, i64) -> i64
      %1700 = func.call @cc_intern(%1696, %1699) : (i64, i64) -> i64
      %1701 = func.call @cc_nil_value() : () -> i64
      %1702 = func.call @cc_cons(%1700, %1701) : (i64, i64) -> i64
      %1703 = func.call @cc_values_pack(%1702) : (i64) -> i64
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      %1704 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1705 = arith.constant 1 : i64
      %1706 = func.call @cc_make_string(%1704, %1705) : (!llvm.ptr, i64) -> i64
      %1707 = func.call @cc_nil_value() : () -> i64
      %1708 = func.call @cc_intern(%1706, %1707) : (i64, i64) -> i64
      %1709 = func.call @cc_nil_value() : () -> i64
      %1710 = func.call @cc_cons(%1708, %1709) : (i64, i64) -> i64
      %1711 = func.call @cc_values_pack(%1710) : (i64) -> i64
      func.call @stack_push_pointer(%1708) : (i64) -> ()
      %1712 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1713 = arith.constant 1 : i64
      %1714 = func.call @cc_make_string(%1712, %1713) : (!llvm.ptr, i64) -> i64
      %1715 = func.call @cc_nil_value() : () -> i64
      %1716 = func.call @cc_intern(%1714, %1715) : (i64, i64) -> i64
      %1717 = func.call @cc_nil_value() : () -> i64
      %1718 = func.call @cc_cons(%1716, %1717) : (i64, i64) -> i64
      %1719 = func.call @cc_values_pack(%1718) : (i64) -> i64
      func.call @stack_push_pointer(%1716) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1720 = func.call @stack_pop_pointer() : () -> i64
      %1721 = func.call @stack_pop_pointer() : () -> i64
      %1722 = func.call @cc_cons(%1721, %1720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1722) : (i64) -> ()
      %1723 = func.call @stack_pop_pointer() : () -> i64
      %1724 = func.call @stack_pop_pointer() : () -> i64
      %1725 = func.call @cc_cons(%1724, %1723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1725) : (i64) -> ()
      %1726 = func.call @stack_pop_pointer() : () -> i64
      %1727 = func.call @stack_pop_pointer() : () -> i64
      %1728 = func.call @cc_cons(%1727, %1726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1728) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1729 = func.call @stack_pop_pointer() : () -> i64
      %1730 = func.call @stack_pop_pointer() : () -> i64
      %1731 = func.call @cc_cons(%1730, %1729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      %1732 = func.call @stack_pop_pointer() : () -> i64
      %1733 = func.call @stack_pop_pointer() : () -> i64
      %1734 = func.call @cc_cons(%1733, %1732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1734) : (i64) -> ()
      %1735 = func.call @stack_pop_pointer() : () -> i64
      %1736 = func.call @stack_pop_pointer() : () -> i64
      %1737 = func.call @cc_cons(%1736, %1735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1737) : (i64) -> ()
      %1738 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1739 = arith.constant 7 : i64
      %1740 = func.call @cc_make_string(%1738, %1739) : (!llvm.ptr, i64) -> i64
      %1741 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1742 = arith.constant 11 : i64
      %1743 = func.call @cc_make_string(%1741, %1742) : (!llvm.ptr, i64) -> i64
      %1744 = func.call @cc_intern(%1740, %1743) : (i64, i64) -> i64
      %1745 = func.call @cc_nil_value() : () -> i64
      %1746 = func.call @cc_cons(%1744, %1745) : (i64, i64) -> i64
      %1747 = func.call @cc_values_pack(%1746) : (i64) -> i64
      func.call @stack_push_pointer(%1744) : (i64) -> ()
      %1748 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1749 = arith.constant 6 : i64
      %1750 = func.call @cc_make_string(%1748, %1749) : (!llvm.ptr, i64) -> i64
      %1751 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1752 = arith.constant 11 : i64
      %1753 = func.call @cc_make_string(%1751, %1752) : (!llvm.ptr, i64) -> i64
      %1754 = func.call @cc_intern(%1750, %1753) : (i64, i64) -> i64
      %1755 = func.call @cc_nil_value() : () -> i64
      %1756 = func.call @cc_cons(%1754, %1755) : (i64, i64) -> i64
      %1757 = func.call @cc_values_pack(%1756) : (i64) -> i64
      func.call @stack_push_pointer(%1754) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1758 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1759 = arith.constant 11 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      %1761 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1762 = arith.constant 11 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      %1764 = func.call @cc_intern(%1760, %1763) : (i64, i64) -> i64
      %1765 = func.call @cc_nil_value() : () -> i64
      %1766 = func.call @cc_cons(%1764, %1765) : (i64, i64) -> i64
      %1767 = func.call @cc_values_pack(%1766) : (i64) -> i64
      func.call @stack_push_pointer(%1764) : (i64) -> ()
      %1768 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1769 = arith.constant 1 : i64
      %1770 = func.call @cc_make_string(%1768, %1769) : (!llvm.ptr, i64) -> i64
      %1771 = func.call @cc_nil_value() : () -> i64
      %1772 = func.call @cc_intern(%1770, %1771) : (i64, i64) -> i64
      %1773 = func.call @cc_nil_value() : () -> i64
      %1774 = func.call @cc_cons(%1772, %1773) : (i64, i64) -> i64
      %1775 = func.call @cc_values_pack(%1774) : (i64) -> i64
      func.call @stack_push_pointer(%1772) : (i64) -> ()
      %1776 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1777 = arith.constant 1 : i64
      %1778 = func.call @cc_make_string(%1776, %1777) : (!llvm.ptr, i64) -> i64
      %1779 = func.call @cc_nil_value() : () -> i64
      %1780 = func.call @cc_intern(%1778, %1779) : (i64, i64) -> i64
      %1781 = func.call @cc_nil_value() : () -> i64
      %1782 = func.call @cc_cons(%1780, %1781) : (i64, i64) -> i64
      %1783 = func.call @cc_values_pack(%1782) : (i64) -> i64
      func.call @stack_push_pointer(%1780) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1784 = func.call @stack_pop_pointer() : () -> i64
      %1785 = func.call @stack_pop_pointer() : () -> i64
      %1786 = func.call @cc_cons(%1785, %1784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1786) : (i64) -> ()
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = func.call @stack_pop_pointer() : () -> i64
      %1789 = func.call @cc_cons(%1788, %1787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1789) : (i64) -> ()
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @stack_pop_pointer() : () -> i64
      %1792 = func.call @cc_cons(%1791, %1790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1792) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1793 = func.call @stack_pop_pointer() : () -> i64
      %1794 = func.call @stack_pop_pointer() : () -> i64
      %1795 = func.call @cc_cons(%1794, %1793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1795) : (i64) -> ()
      %1796 = func.call @stack_pop_pointer() : () -> i64
      %1797 = func.call @stack_pop_pointer() : () -> i64
      %1798 = func.call @cc_cons(%1797, %1796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1798) : (i64) -> ()
      %1799 = func.call @stack_pop_pointer() : () -> i64
      %1800 = func.call @stack_pop_pointer() : () -> i64
      %1801 = func.call @cc_cons(%1800, %1799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1802 = func.call @stack_pop_pointer() : () -> i64
      %1803 = func.call @stack_pop_pointer() : () -> i64
      %1804 = func.call @cc_cons(%1803, %1802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1804) : (i64) -> ()
      %1805 = func.call @stack_pop_pointer() : () -> i64
      %1806 = func.call @stack_pop_pointer() : () -> i64
      %1807 = func.call @cc_cons(%1806, %1805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1808 = func.call @stack_pop_pointer() : () -> i64
      %1809 = func.call @stack_pop_pointer() : () -> i64
      %1810 = func.call @cc_cons(%1809, %1808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1810) : (i64) -> ()
      %1811 = func.call @stack_pop_pointer() : () -> i64
      %1812 = func.call @stack_pop_pointer() : () -> i64
      %1813 = func.call @cc_cons(%1812, %1811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1813) : (i64) -> ()
      %1814 = func.call @stack_pop_pointer() : () -> i64
      %1815 = func.call @stack_pop_pointer() : () -> i64
      %1816 = func.call @cc_cons(%1815, %1814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1816) : (i64) -> ()
      %1817 = func.call @stack_pop_pointer() : () -> i64
      %1818 = func.call @stack_pop_pointer() : () -> i64
      %1819 = func.call @cc_cons(%1818, %1817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1820 = func.call @stack_pop_pointer() : () -> i64
      %1821 = func.call @stack_pop_pointer() : () -> i64
      %1822 = func.call @cc_cons(%1821, %1820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1822) : (i64) -> ()
      %1823 = func.call @stack_pop_pointer() : () -> i64
      %1824 = func.call @stack_pop_pointer() : () -> i64
      %1825 = func.call @cc_cons(%1824, %1823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1825) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1826 = func.call @stack_pop_pointer() : () -> i64
      %1827 = func.call @stack_pop_pointer() : () -> i64
      %1828 = func.call @cc_cons(%1827, %1826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1828) : (i64) -> ()
      %1829 = func.call @stack_pop_pointer() : () -> i64
      %1830 = func.call @stack_pop_pointer() : () -> i64
      %1831 = func.call @cc_cons(%1830, %1829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1831) : (i64) -> ()
      %1832 = func.call @stack_pop_pointer() : () -> i64
      %1833 = func.call @stack_pop_pointer() : () -> i64
      %1834 = func.call @cc_cons(%1833, %1832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1834) : (i64) -> ()
      %1835 = func.call @stack_pop_pointer() : () -> i64
      %1836 = func.call @stack_pop_pointer() : () -> i64
      %1837 = func.call @cc_cons(%1836, %1835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1838 = func.call @stack_pop_pointer() : () -> i64
      %1839 = func.call @stack_pop_pointer() : () -> i64
      %1840 = func.call @cc_cons(%1839, %1838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1840) : (i64) -> ()
      %1841 = func.call @stack_pop_pointer() : () -> i64
      %1842 = func.call @stack_pop_pointer() : () -> i64
      %1843 = func.call @cc_cons(%1842, %1841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1843) : (i64) -> ()
      %1844 = func.call @stack_pop_pointer() : () -> i64
      %1845 = func.call @stack_pop_pointer() : () -> i64
      %1846 = func.call @cc_cons(%1845, %1844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1846) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1847 = func.call @stack_pop_pointer() : () -> i64
      %1848 = func.call @stack_pop_pointer() : () -> i64
      %1849 = func.call @cc_cons(%1848, %1847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1849) : (i64) -> ()
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @stack_pop_pointer() : () -> i64
      %1852 = func.call @cc_cons(%1851, %1850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1852) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1853 = func.call @stack_pop_pointer() : () -> i64
      %1854 = func.call @stack_pop_pointer() : () -> i64
      %1855 = func.call @cc_cons(%1854, %1853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1855) : (i64) -> ()
      %1856 = func.call @stack_pop_pointer() : () -> i64
      %1857 = func.call @stack_pop_pointer() : () -> i64
      %1858 = func.call @cc_cons(%1857, %1856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1858) : (i64) -> ()
      %1859 = func.call @stack_pop_pointer() : () -> i64
      %1860 = func.call @stack_pop_pointer() : () -> i64
      %1861 = func.call @cc_cons(%1860, %1859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1861) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1862 = func.call @stack_pop_pointer() : () -> i64
      %1863 = func.call @stack_pop_pointer() : () -> i64
      %1864 = func.call @cc_cons(%1863, %1862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1864) : (i64) -> ()
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = func.call @stack_pop_pointer() : () -> i64
      %1867 = func.call @cc_cons(%1866, %1865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1867) : (i64) -> ()
      %1868 = func.call @stack_pop_pointer() : () -> i64
      %1869 = func.call @stack_pop_pointer() : () -> i64
      %1870 = func.call @cc_cons(%1869, %1868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1870) : (i64) -> ()
      %1871 = func.call @stack_pop_pointer() : () -> i64
      %1872 = func.call @stack_pop_pointer() : () -> i64
      %1873 = func.call @cc_cons(%1872, %1871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      %1874 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1874 : i64
    }
    %1875 = func.call @cc_nil_value() : () -> i64
    %1876 = func.call @cc_errorp(%1422) : (i64) -> i64
    %1877 = arith.cmpi ne, %1876, %1875 : i64
    %1878 = scf.if %1877 -> (i64) {
      scf.yield %1422 : i64
    } else {
      %1879 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1880 = arith.constant 6 : i64
      %1881 = func.call @cc_make_string(%1879, %1880) : (!llvm.ptr, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_intern(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_nil_value() : () -> i64
      %1885 = func.call @cc_cons(%1883, %1884) : (i64, i64) -> i64
      %1886 = func.call @cc_values_pack(%1885) : (i64) -> i64
      func.call @stack_push_pointer(%1883) : (i64) -> ()
      %1887 = func.call @stack_pop_pointer() : () -> i64
      %1888 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1889 = arith.constant 6 : i64
      %1890 = func.call @cc_make_string(%1888, %1889) : (!llvm.ptr, i64) -> i64
      %1891 = func.call @cc_nil_value() : () -> i64
      %1892 = func.call @cc_intern(%1890, %1891) : (i64, i64) -> i64
      %1893 = func.call @cc_nil_value() : () -> i64
      %1894 = func.call @cc_cons(%1892, %1893) : (i64, i64) -> i64
      %1895 = func.call @cc_values_pack(%1894) : (i64) -> i64
      func.call @stack_push_pointer(%1892) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1896 = func.call @stack_pop_pointer() : () -> i64
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = func.call @cc_cons(%1897, %1896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1898) : (i64) -> ()
      %1899 = func.call @stack_pop_pointer() : () -> i64
      %1911 = arith.constant 175130764378129 : i64
      %1912 = arith.constant 0 : i64
      %1913 = func.call @cc_make_closure(%1911, %1912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1913) : (i64) -> ()
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1915) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1916 = func.call @stack_pop_pointer() : () -> i64
      %1917 = func.call @stack_pop_pointer() : () -> i64
      %1918 = func.call @cc_cons(%1917, %1916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1918) : (i64) -> ()
      %1919 = func.call @stack_pop_pointer() : () -> i64
      %1920 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1921 = arith.constant 11 : i64
      %1922 = func.call @cc_make_string(%1920, %1921) : (!llvm.ptr, i64) -> i64
      %1923 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1924 = arith.constant 7 : i64
      %1925 = func.call @cc_make_string(%1923, %1924) : (!llvm.ptr, i64) -> i64
      %1926 = func.call @cc_intern(%1922, %1925) : (i64, i64) -> i64
      %1927 = func.call @cc_nil_value() : () -> i64
      %1928 = func.call @cc_cons(%1926, %1927) : (i64, i64) -> i64
      %1929 = func.call @cc_values_pack(%1928) : (i64) -> i64
      func.call @stack_push_pointer(%1926) : (i64) -> ()
      %1930 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1931 = func.call @stack_pop_pointer() : () -> i64
      %1932 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1933 = arith.constant 4 : i64
      %1934 = func.call @cc_make_string(%1932, %1933) : (!llvm.ptr, i64) -> i64
      %1935 = llvm.mlir.addressof @str198 : !llvm.ptr
      %1936 = arith.constant 7 : i64
      %1937 = func.call @cc_make_string(%1935, %1936) : (!llvm.ptr, i64) -> i64
      %1938 = func.call @cc_intern(%1934, %1937) : (i64, i64) -> i64
      %1939 = func.call @cc_nil_value() : () -> i64
      %1940 = func.call @cc_cons(%1938, %1939) : (i64, i64) -> i64
      %1941 = func.call @cc_values_pack(%1940) : (i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1944 = arith.constant 6 : i64
      %1945 = func.call @cc_make_string(%1943, %1944) : (!llvm.ptr, i64) -> i64
      %1946 = func.call @cc_nil_value() : () -> i64
      %1947 = func.call @cc_intern(%1945, %1946) : (i64, i64) -> i64
      %1948 = func.call @cc_nil_value() : () -> i64
      %1949 = func.call @cc_cons(%1947, %1948) : (i64, i64) -> i64
      %1950 = func.call @cc_values_pack(%1949) : (i64) -> i64
      func.call @stack_push_pointer(%1947) : (i64) -> ()
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @cc_nil_value() : () -> i64
      %1953 = func.call @cc_errorp(%1887) : (i64) -> i64
      %1954 = arith.cmpi ne, %1953, %1952 : i64
      %1955 = arith.cmpi eq, %1952, %1952 : i64
      %1956 = arith.andi %1954, %1955 : i1
      %1957 = scf.if %1956 -> (i64) {
        scf.yield %1887 : i64
      } else {
        scf.yield %1952 : i64
      }
      %1958 = func.call @cc_errorp(%1899) : (i64) -> i64
      %1959 = arith.cmpi ne, %1958, %1952 : i64
      %1960 = arith.cmpi eq, %1957, %1952 : i64
      %1961 = arith.andi %1959, %1960 : i1
      %1962 = scf.if %1961 -> (i64) {
        scf.yield %1899 : i64
      } else {
        scf.yield %1957 : i64
      }
      %1963 = func.call @cc_errorp(%1914) : (i64) -> i64
      %1964 = arith.cmpi ne, %1963, %1952 : i64
      %1965 = arith.cmpi eq, %1962, %1952 : i64
      %1966 = arith.andi %1964, %1965 : i1
      %1967 = scf.if %1966 -> (i64) {
        scf.yield %1914 : i64
      } else {
        scf.yield %1962 : i64
      }
      %1968 = func.call @cc_errorp(%1919) : (i64) -> i64
      %1969 = arith.cmpi ne, %1968, %1952 : i64
      %1970 = arith.cmpi eq, %1967, %1952 : i64
      %1971 = arith.andi %1969, %1970 : i1
      %1972 = scf.if %1971 -> (i64) {
        scf.yield %1919 : i64
      } else {
        scf.yield %1967 : i64
      }
      %1973 = func.call @cc_errorp(%1930) : (i64) -> i64
      %1974 = arith.cmpi ne, %1973, %1952 : i64
      %1975 = arith.cmpi eq, %1972, %1952 : i64
      %1976 = arith.andi %1974, %1975 : i1
      %1977 = scf.if %1976 -> (i64) {
        scf.yield %1930 : i64
      } else {
        scf.yield %1972 : i64
      }
      %1978 = func.call @cc_errorp(%1931) : (i64) -> i64
      %1979 = arith.cmpi ne, %1978, %1952 : i64
      %1980 = arith.cmpi eq, %1977, %1952 : i64
      %1981 = arith.andi %1979, %1980 : i1
      %1982 = scf.if %1981 -> (i64) {
        scf.yield %1931 : i64
      } else {
        scf.yield %1977 : i64
      }
      %1983 = func.call @cc_errorp(%1942) : (i64) -> i64
      %1984 = arith.cmpi ne, %1983, %1952 : i64
      %1985 = arith.cmpi eq, %1982, %1952 : i64
      %1986 = arith.andi %1984, %1985 : i1
      %1987 = scf.if %1986 -> (i64) {
        scf.yield %1942 : i64
      } else {
        scf.yield %1982 : i64
      }
      %1988 = func.call @cc_errorp(%1951) : (i64) -> i64
      %1989 = arith.cmpi ne, %1988, %1952 : i64
      %1990 = arith.cmpi eq, %1987, %1952 : i64
      %1991 = arith.andi %1989, %1990 : i1
      %1992 = scf.if %1991 -> (i64) {
        scf.yield %1951 : i64
      } else {
        scf.yield %1987 : i64
      }
      %1993 = arith.cmpi ne, %1992, %1952 : i64
      scf.if %1993 {
        func.call @stack_push_pointer(%1992) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1887) : (i64) -> ()
        func.call @stack_push_pointer(%1899) : (i64) -> ()
        func.call @stack_push_pointer(%1914) : (i64) -> ()
        func.call @stack_push_pointer(%1919) : (i64) -> ()
        func.call @stack_push_pointer(%1930) : (i64) -> ()
        func.call @stack_push_pointer(%1931) : (i64) -> ()
        func.call @stack_push_pointer(%1942) : (i64) -> ()
        func.call @stack_push_pointer(%1951) : (i64) -> ()
        %1994 = llvm.mlir.addressof @str200 : !llvm.ptr
        %1995 = func.call @cc_make_function_ref_const(%1994) : (!llvm.ptr) -> i64
        %1996 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1995, %1996) : (i64, i64) -> ()
      }
      %1997 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1997 : i64
    }
    func.call @stack_push_pointer(%1878) : (i64) -> ()
    %1998 = func.call @stack_pop_pointer() : () -> i64
    %1999 = func.call @cc_multiple_value_list(%1998) : (i64) -> i64
    %2000 = llvm.mlir.addressof @str201 : !llvm.ptr
    %2001 = arith.constant 38 : i64
    %2002 = func.call @cc_make_string(%2000, %2001) : (!llvm.ptr, i64) -> i64
    %2003 = func.call @cc_nil_value() : () -> i64
    %2004 = func.call @cc_intern(%2002, %2003) : (i64, i64) -> i64
    %2005 = func.call @cc_nil_value() : () -> i64
    %2006 = func.call @cc_cons(%2004, %2005) : (i64, i64) -> i64
    %2007 = func.call @cc_values_pack(%2006) : (i64) -> i64
    %2008 = func.call @cc_symbol_value(%2004) : (i64) -> i64
    %2009 = llvm.mlir.addressof @str202 : !llvm.ptr
    %2010 = arith.constant 40 : i64
    %2011 = func.call @cc_make_string(%2009, %2010) : (!llvm.ptr, i64) -> i64
    %2012 = func.call @cc_nil_value() : () -> i64
    %2013 = func.call @cc_intern(%2011, %2012) : (i64, i64) -> i64
    %2014 = func.call @cc_nil_value() : () -> i64
    %2015 = func.call @cc_cons(%2013, %2014) : (i64, i64) -> i64
    %2016 = func.call @cc_values_pack(%2015) : (i64) -> i64
    %2017 = func.call @cc_symbol_value(%2013) : (i64) -> i64
    %2018 = func.call @cc_nil_value() : () -> i64
    %2019 = arith.cmpi ne, %2008, %2018 : i64
    %2020 = scf.if %2019 -> (i64) {
      scf.yield %2017 : i64
    } else {
      scf.yield %1999 : i64
    }
    %2021 = func.call @cc_values_pack(%2020) : (i64) -> i64
    func.call @stack_push_pointer(%2021) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_175130764378116"() {
    %154 = func.call @cc_nil_value() : () -> i64
    %155 = func.call @cc_nil_value() : () -> i64
    %156 = func.call @cc_errorp(%154) : (i64) -> i64
    %157 = arith.cmpi ne, %156, %155 : i64
    %158 = scf.if %157 -> (i64) {
      scf.yield %154 : i64
    } else {
      %159 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%159) : (i64) -> ()
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @cc_multiple_value_list(%160) : (i64) -> i64
      %162 = func.call @cc_t_value() : () -> i64
      %163 = llvm.mlir.addressof @str16 : !llvm.ptr
      %164 = arith.constant 38 : i64
      %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_intern(%165, %166) : (i64, i64) -> i64
      %168 = func.call @cc_nil_value() : () -> i64
      %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
      %170 = func.call @cc_values_pack(%169) : (i64) -> i64
      %171 = func.call @cc_set_symbol_value(%167, %162) : (i64, i64) -> i64
      %172 = llvm.mlir.addressof @str17 : !llvm.ptr
      %173 = arith.constant 39 : i64
      %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
      %175 = func.call @cc_nil_value() : () -> i64
      %176 = func.call @cc_intern(%174, %175) : (i64, i64) -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_values_pack(%178) : (i64) -> i64
      %180 = func.call @cc_set_symbol_value(%176, %160) : (i64, i64) -> i64
      %181 = llvm.mlir.addressof @str18 : !llvm.ptr
      %182 = arith.constant 40 : i64
      %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_intern(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_values_pack(%187) : (i64) -> i64
      %189 = func.call @cc_set_symbol_value(%185, %161) : (i64, i64) -> i64
      %190 = llvm.mlir.addressof @str19 : !llvm.ptr
      %191 = arith.constant 38 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = func.call @cc_nil_value() : () -> i64
      %194 = func.call @cc_intern(%192, %193) : (i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_values_pack(%196) : (i64) -> i64
      %198 = func.call @cc_set_symbol_value(%194, %162) : (i64, i64) -> i64
      %199 = llvm.mlir.addressof @str20 : !llvm.ptr
      %200 = arith.constant 39 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_intern(%201, %202) : (i64, i64) -> i64
      %204 = func.call @cc_nil_value() : () -> i64
      %205 = func.call @cc_cons(%203, %204) : (i64, i64) -> i64
      %206 = func.call @cc_values_pack(%205) : (i64) -> i64
      %207 = func.call @cc_set_symbol_value(%203, %160) : (i64, i64) -> i64
      %208 = llvm.mlir.addressof @str21 : !llvm.ptr
      %209 = arith.constant 40 : i64
      %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
      %211 = func.call @cc_nil_value() : () -> i64
      %212 = func.call @cc_intern(%210, %211) : (i64, i64) -> i64
      %213 = func.call @cc_nil_value() : () -> i64
      %214 = func.call @cc_cons(%212, %213) : (i64, i64) -> i64
      %215 = func.call @cc_values_pack(%214) : (i64) -> i64
      %216 = func.call @cc_set_symbol_value(%212, %161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%160) : (i64) -> ()
      %217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %217 : i64
    }
    func.call @stack_push_pointer(%158) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378120"() {
    %446 = func.call @cc_nil_value() : () -> i64
    %447 = func.call @cc_nil_value() : () -> i64
    %448 = func.call @cc_errorp(%446) : (i64) -> i64
    %449 = arith.cmpi ne, %448, %447 : i64
    %450 = scf.if %449 -> (i64) {
      scf.yield %446 : i64
    } else {
      %451 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%451) : (i64) -> ()
      %452 = func.call @stack_pop_pointer() : () -> i64
      %453 = func.call @cc_multiple_value_list(%452) : (i64) -> i64
      %454 = func.call @cc_t_value() : () -> i64
      %455 = llvm.mlir.addressof @str43 : !llvm.ptr
      %456 = arith.constant 38 : i64
      %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
      %458 = func.call @cc_nil_value() : () -> i64
      %459 = func.call @cc_intern(%457, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      %463 = func.call @cc_set_symbol_value(%459, %454) : (i64, i64) -> i64
      %464 = llvm.mlir.addressof @str44 : !llvm.ptr
      %465 = arith.constant 39 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_intern(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_cons(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_values_pack(%470) : (i64) -> i64
      %472 = func.call @cc_set_symbol_value(%468, %452) : (i64, i64) -> i64
      %473 = llvm.mlir.addressof @str45 : !llvm.ptr
      %474 = arith.constant 40 : i64
      %475 = func.call @cc_make_string(%473, %474) : (!llvm.ptr, i64) -> i64
      %476 = func.call @cc_nil_value() : () -> i64
      %477 = func.call @cc_intern(%475, %476) : (i64, i64) -> i64
      %478 = func.call @cc_nil_value() : () -> i64
      %479 = func.call @cc_cons(%477, %478) : (i64, i64) -> i64
      %480 = func.call @cc_values_pack(%479) : (i64) -> i64
      %481 = func.call @cc_set_symbol_value(%477, %453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%452) : (i64) -> ()
      %482 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %482 : i64
    }
    func.call @stack_push_pointer(%450) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378125"() {
    %737 = func.call @cc_nil_value() : () -> i64
    %738 = func.call @cc_nil_value() : () -> i64
    %739 = func.call @cc_errorp(%737) : (i64) -> i64
    %740 = arith.cmpi ne, %739, %738 : i64
    %741 = scf.if %740 -> (i64) {
      scf.yield %737 : i64
    } else {
      %742 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%742) : (i64) -> ()
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @cc_multiple_value_list(%743) : (i64) -> i64
      %745 = func.call @cc_t_value() : () -> i64
      %746 = llvm.mlir.addressof @str70 : !llvm.ptr
      %747 = arith.constant 38 : i64
      %748 = func.call @cc_make_string(%746, %747) : (!llvm.ptr, i64) -> i64
      %749 = func.call @cc_nil_value() : () -> i64
      %750 = func.call @cc_intern(%748, %749) : (i64, i64) -> i64
      %751 = func.call @cc_nil_value() : () -> i64
      %752 = func.call @cc_cons(%750, %751) : (i64, i64) -> i64
      %753 = func.call @cc_values_pack(%752) : (i64) -> i64
      %754 = func.call @cc_set_symbol_value(%750, %745) : (i64, i64) -> i64
      %755 = llvm.mlir.addressof @str71 : !llvm.ptr
      %756 = arith.constant 39 : i64
      %757 = func.call @cc_make_string(%755, %756) : (!llvm.ptr, i64) -> i64
      %758 = func.call @cc_nil_value() : () -> i64
      %759 = func.call @cc_intern(%757, %758) : (i64, i64) -> i64
      %760 = func.call @cc_nil_value() : () -> i64
      %761 = func.call @cc_cons(%759, %760) : (i64, i64) -> i64
      %762 = func.call @cc_values_pack(%761) : (i64) -> i64
      %763 = func.call @cc_set_symbol_value(%759, %743) : (i64, i64) -> i64
      %764 = llvm.mlir.addressof @str72 : !llvm.ptr
      %765 = arith.constant 40 : i64
      %766 = func.call @cc_make_string(%764, %765) : (!llvm.ptr, i64) -> i64
      %767 = func.call @cc_nil_value() : () -> i64
      %768 = func.call @cc_intern(%766, %767) : (i64, i64) -> i64
      %769 = func.call @cc_nil_value() : () -> i64
      %770 = func.call @cc_cons(%768, %769) : (i64, i64) -> i64
      %771 = func.call @cc_values_pack(%770) : (i64) -> i64
      %772 = func.call @cc_set_symbol_value(%768, %744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%743) : (i64) -> ()
      %773 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %773 : i64
    }
    func.call @stack_push_pointer(%741) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378127"() {
    %1046 = func.call @cc_nil_value() : () -> i64
    %1047 = func.call @cc_nil_value() : () -> i64
    %1048 = func.call @cc_errorp(%1046) : (i64) -> i64
    %1049 = arith.cmpi ne, %1048, %1047 : i64
    %1050 = scf.if %1049 -> (i64) {
      scf.yield %1046 : i64
    } else {
      %1051 = func.call @cc_nil_value() : () -> i64
      %1052 = arith.cmpi ne, %1051, %1051 : i64
      scf.if %1052 {
        func.call @stack_push_pointer(%1051) : (i64) -> ()
      } else {
        %1053 = llvm.mlir.addressof @str102 : !llvm.ptr
        %1054 = func.call @cc_make_function_ref_const(%1053) : (!llvm.ptr) -> i64
        %1055 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1054, %1055) : (i64, i64) -> ()
      }
      %1056 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1056 : i64
    }
    func.call @stack_push_pointer(%1050) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378128"() {
    %1245 = func.call @cc_nil_value() : () -> i64
    %1246 = func.call @cc_nil_value() : () -> i64
    %1247 = func.call @cc_errorp(%1245) : (i64) -> i64
    %1248 = arith.cmpi ne, %1247, %1246 : i64
    %1249 = scf.if %1248 -> (i64) {
      scf.yield %1245 : i64
    } else {
      %1250 = func.call @cc_nil_value() : () -> i64
      %1251 = arith.cmpi ne, %1250, %1250 : i64
      scf.if %1251 {
        func.call @stack_push_pointer(%1250) : (i64) -> ()
      } else {
        %1252 = llvm.mlir.addressof @str123 : !llvm.ptr
        %1253 = func.call @cc_make_function_ref_const(%1252) : (!llvm.ptr) -> i64
        %1254 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1253, %1254) : (i64, i64) -> ()
      }
      %1255 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1255 : i64
    }
    func.call @stack_push_pointer(%1249) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378129"() {
    %1900 = func.call @cc_nil_value() : () -> i64
    %1901 = func.call @cc_nil_value() : () -> i64
    %1902 = func.call @cc_errorp(%1900) : (i64) -> i64
    %1903 = arith.cmpi ne, %1902, %1901 : i64
    %1904 = scf.if %1903 -> (i64) {
      scf.yield %1900 : i64
    } else {
      %1905 = func.call @cc_nil_value() : () -> i64
      %1906 = arith.cmpi ne, %1905, %1905 : i64
      scf.if %1906 {
        func.call @stack_push_pointer(%1905) : (i64) -> ()
      } else {
        %1907 = llvm.mlir.addressof @str194 : !llvm.ptr
        %1908 = func.call @cc_make_function_ref_const(%1907) : (!llvm.ptr) -> i64
        %1909 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1908, %1909) : (i64, i64) -> ()
      }
      %1910 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1910 : i64
    }
    func.call @stack_push_pointer(%1904) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_175130764378112*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_175130764378112*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_175130764378112*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETFLAG_175130764378113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETVALUE_175130764378113*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETMVLIST_175130764378113*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_175130764378114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETVALUE_175130764378114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_175130764378114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_175130764378115*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_175130764378115*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_175130764378115*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_175130764378115*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETVALUE_175130764378115*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETMVLIST_175130764378115*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETFLAG_175130764378115*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETVALUE_175130764378115*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_175130764378115*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_175130764378114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_175130764378114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_175130764378114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETFLAG_175130764378115*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETVALUE_175130764378115*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETMVLIST_175130764378115*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETFLAG_175130764378114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETVALUE_175130764378114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETMVLIST_175130764378114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_175130764378113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETVALUE_175130764378113*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str30("*__MLIR_BLOCK_RETMVLIST_175130764378113*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_175130764378112*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETMVLIST_175130764378112*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str33("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str34("*__MLIR_BLOCK_RETFLAG_175130764378117*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETVALUE_175130764378117*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETMVLIST_175130764378117*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETFLAG_175130764378118*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETVALUE_175130764378118*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str39("*__MLIR_BLOCK_RETMVLIST_175130764378118*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str40("*__MLIR_BLOCK_RETFLAG_175130764378119*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str41("*__MLIR_BLOCK_RETVALUE_175130764378119*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str42("*__MLIR_BLOCK_RETMVLIST_175130764378119*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETFLAG_175130764378119*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETVALUE_175130764378119*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETMVLIST_175130764378119*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str46("*__MLIR_BLOCK_RETFLAG_175130764378119*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str47("*__MLIR_BLOCK_RETVALUE_175130764378119*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETMVLIST_175130764378119*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETFLAG_175130764378118*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETVALUE_175130764378118*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str51("*__MLIR_BLOCK_RETMVLIST_175130764378118*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str52("*__MLIR_BLOCK_RETFLAG_175130764378117*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str53("*__MLIR_BLOCK_RETMVLIST_175130764378117*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str54("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str55("*__MLIR_BLOCK_RETFLAG_175130764378121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str56("*__MLIR_BLOCK_RETVALUE_175130764378121*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str57("*__MLIR_BLOCK_RETMVLIST_175130764378121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETFLAG_175130764378122*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETVALUE_175130764378122*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str60("*__MLIR_BLOCK_RETMVLIST_175130764378122*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str61("*__MLIR_BLOCK_RETFLAG_175130764378123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETVALUE_175130764378123*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETMVLIST_175130764378123*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str64("*__MLIR_BLOCK_RETFLAG_175130764378123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETVALUE_175130764378123*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str66("*__MLIR_BLOCK_RETMVLIST_175130764378123*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_175130764378124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETVALUE_175130764378124*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str69("*__MLIR_BLOCK_RETMVLIST_175130764378124*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_175130764378124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETVALUE_175130764378124*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETMVLIST_175130764378124*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str73("*__MLIR_BLOCK_RETFLAG_175130764378124*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str74("*__MLIR_BLOCK_RETVALUE_175130764378124*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETMVLIST_175130764378124*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETFLAG_175130764378123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str77("*__MLIR_BLOCK_RETVALUE_175130764378123*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str78("*__MLIR_BLOCK_RETMVLIST_175130764378123*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETFLAG_175130764378122*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETVALUE_175130764378122*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str81("*__MLIR_BLOCK_RETMVLIST_175130764378122*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str82("*__MLIR_BLOCK_RETFLAG_175130764378121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str83("*__MLIR_BLOCK_RETMVLIST_175130764378121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str84("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str85("*__MLIR_BLOCK_RETFLAG_175130764378126*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str86("*__MLIR_BLOCK_RETVALUE_175130764378126*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str87("*__MLIR_BLOCK_RETMVLIST_175130764378126*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str88("%FN%eh-foo\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str89("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str90("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str91("%FN%eh-foo\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str92("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str93("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str94("%FN%eh-foo\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str95("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str96("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str97("%FN%eh-foo\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str98("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str99("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str100("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str101("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("%FN%eh-foo\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str103("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str109("%FN%eh-bar\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str110("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str112("%FN%eh-bar\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str113("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str114("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str115("%FN%eh-bar\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str116("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str118("%FN%eh-bar\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str119("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str120("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str121("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str122("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str123("%FN%eh-bar\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str124("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str126("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str127("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str128("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str129("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str130("%FN%eh-baz\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str131("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str132("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str133("%FN%eh-baz\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str134("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str135("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str136("%FN%eh-baz\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str137("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str138("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str139("%FN%eh-baz\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str140("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str141("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str142("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("EH-BAB\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str145("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str146("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str147("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str149("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str151("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str152("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str154("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str155("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str156("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str157("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str158("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str159("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str160("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str161("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str162("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str164("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str165("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str167("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str168("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str174("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str175("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str176("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str177("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str178("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str180("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str182("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str183("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str184("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str187("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str191("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str192("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str193("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str194("%FN%eh-baz\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str195("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str198("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str199("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str200("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str201("*__MLIR_BLOCK_RETFLAG_175130764378126*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str202("*__MLIR_BLOCK_RETMVLIST_175130764378126*\00") : !llvm.array<41 x i8>
}
