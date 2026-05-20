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
    %44 = llvm.mlir.addressof @str5 : !llvm.ptr
    %45 = arith.constant 37 : i64
    %46 = func.call @cc_make_string(%44, %45) : (!llvm.ptr, i64) -> i64
    %47 = func.call @cc_nil_value() : () -> i64
    %48 = func.call @cc_intern(%46, %47) : (i64, i64) -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_cons(%48, %49) : (i64, i64) -> i64
    %51 = func.call @cc_values_pack(%50) : (i64) -> i64
    %52 = func.call @cc_set_symbol_value(%48, %43) : (i64, i64) -> i64
    %53 = llvm.mlir.addressof @str6 : !llvm.ptr
    %54 = arith.constant 38 : i64
    %55 = func.call @cc_make_string(%53, %54) : (!llvm.ptr, i64) -> i64
    %56 = func.call @cc_nil_value() : () -> i64
    %57 = func.call @cc_intern(%55, %56) : (i64, i64) -> i64
    %58 = func.call @cc_nil_value() : () -> i64
    %59 = func.call @cc_cons(%57, %58) : (i64, i64) -> i64
    %60 = func.call @cc_values_pack(%59) : (i64) -> i64
    %61 = func.call @cc_set_symbol_value(%57, %43) : (i64, i64) -> i64
    %62 = llvm.mlir.addressof @str7 : !llvm.ptr
    %63 = arith.constant 39 : i64
    %64 = func.call @cc_make_string(%62, %63) : (!llvm.ptr, i64) -> i64
    %65 = func.call @cc_nil_value() : () -> i64
    %66 = func.call @cc_intern(%64, %65) : (i64, i64) -> i64
    %67 = func.call @cc_nil_value() : () -> i64
    %68 = func.call @cc_cons(%66, %67) : (i64, i64) -> i64
    %69 = func.call @cc_values_pack(%68) : (i64) -> i64
    %70 = func.call @cc_set_symbol_value(%66, %43) : (i64, i64) -> i64
    %71 = llvm.mlir.addressof @str8 : !llvm.ptr
    %72 = arith.constant 32 : i64
    %73 = func.call @cc_make_string(%71, %72) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%73) : (i64) -> ()
    %74 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%14) : (i64) -> ()
    %75 = func.call @stack_pop_pointer() : () -> i64
    %76 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%75, %76) : (i64, i64) -> ()
    %77 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %78 = func.call @stack_pop_pointer() : () -> i64
    %79 = func.call @cc_multiple_value_list(%78) : (i64) -> i64
    %80 = llvm.mlir.addressof @str9 : !llvm.ptr
    %81 = arith.constant 37 : i64
    %82 = func.call @cc_make_string(%80, %81) : (!llvm.ptr, i64) -> i64
    %83 = func.call @cc_nil_value() : () -> i64
    %84 = func.call @cc_intern(%82, %83) : (i64, i64) -> i64
    %85 = func.call @cc_nil_value() : () -> i64
    %86 = func.call @cc_cons(%84, %85) : (i64, i64) -> i64
    %87 = func.call @cc_values_pack(%86) : (i64) -> i64
    %88 = func.call @cc_symbol_value(%84) : (i64) -> i64
    %89 = llvm.mlir.addressof @str10 : !llvm.ptr
    %90 = arith.constant 38 : i64
    %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
    %92 = func.call @cc_nil_value() : () -> i64
    %93 = func.call @cc_intern(%91, %92) : (i64, i64) -> i64
    %94 = func.call @cc_nil_value() : () -> i64
    %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
    %96 = func.call @cc_values_pack(%95) : (i64) -> i64
    %97 = func.call @cc_symbol_value(%93) : (i64) -> i64
    %98 = llvm.mlir.addressof @str11 : !llvm.ptr
    %99 = arith.constant 39 : i64
    %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_intern(%100, %101) : (i64, i64) -> i64
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
    %105 = func.call @cc_values_pack(%104) : (i64) -> i64
    %106 = func.call @cc_symbol_value(%102) : (i64) -> i64
    %107 = func.call @cc_nil_value() : () -> i64
    %108 = arith.cmpi ne, %88, %107 : i64
    %109 = scf.if %108 -> (i64) {
      scf.yield %106 : i64
    } else {
      scf.yield %79 : i64
    }
    %110 = func.call @cc_values_pack(%109) : (i64) -> i64
    func.call @stack_push_pointer(%110) : (i64) -> ()
    %111 = func.call @stack_pop_pointer() : () -> i64
    %112 = func.call @cc_multiple_value_list(%111) : (i64) -> i64
    %113 = llvm.mlir.addressof @str12 : !llvm.ptr
    %114 = arith.constant 37 : i64
    %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
    %116 = func.call @cc_nil_value() : () -> i64
    %117 = func.call @cc_intern(%115, %116) : (i64, i64) -> i64
    %118 = func.call @cc_nil_value() : () -> i64
    %119 = func.call @cc_cons(%117, %118) : (i64, i64) -> i64
    %120 = func.call @cc_values_pack(%119) : (i64) -> i64
    %121 = func.call @cc_symbol_value(%117) : (i64) -> i64
    %122 = llvm.mlir.addressof @str13 : !llvm.ptr
    %123 = arith.constant 39 : i64
    %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_intern(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_nil_value() : () -> i64
    %128 = func.call @cc_cons(%126, %127) : (i64, i64) -> i64
    %129 = func.call @cc_values_pack(%128) : (i64) -> i64
    %130 = func.call @cc_symbol_value(%126) : (i64) -> i64
    %131 = func.call @cc_nil_value() : () -> i64
    %132 = arith.cmpi ne, %121, %131 : i64
    %133 = scf.if %132 -> (i64) {
      scf.yield %130 : i64
    } else {
      scf.yield %112 : i64
    }
    %134 = func.call @cc_values_pack(%133) : (i64) -> i64
    func.call @stack_push_pointer(%134) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%nest-ftsuib"() {
    %135 = llvm.mlir.addressof @str14 : !llvm.ptr
    %136 = arith.constant 11 : i64
    %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
    %138 = func.call @cc_nil_value() : () -> i64
    %139 = func.call @cc_intern(%137, %138) : (i64, i64) -> i64
    %140 = func.call @cc_nil_value() : () -> i64
    %141 = func.call @cc_cons(%139, %140) : (i64, i64) -> i64
    %142 = func.call @cc_values_pack(%141) : (i64) -> i64
    %143 = llvm.mlir.addressof @str15 : !llvm.ptr
    %144 = arith.constant 3 : i64
    %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
    %146 = func.call @cc_register_function_lambda_list_metadata_raw(%139, %145) : (i64, i64) -> i64
    %147 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%139, %147) : (i64, i64) -> ()
    %148 = func.call @stack_pop_pointer() : () -> i64
    %149 = func.call @stack_pop_pointer() : () -> i64
    %150 = func.call @cc_nil_value() : () -> i64
    %151 = llvm.mlir.addressof @str16 : !llvm.ptr
    %152 = arith.constant 37 : i64
    %153 = func.call @cc_make_string(%151, %152) : (!llvm.ptr, i64) -> i64
    %154 = func.call @cc_nil_value() : () -> i64
    %155 = func.call @cc_intern(%153, %154) : (i64, i64) -> i64
    %156 = func.call @cc_nil_value() : () -> i64
    %157 = func.call @cc_cons(%155, %156) : (i64, i64) -> i64
    %158 = func.call @cc_values_pack(%157) : (i64) -> i64
    %159 = func.call @cc_set_symbol_value(%155, %150) : (i64, i64) -> i64
    %160 = llvm.mlir.addressof @str17 : !llvm.ptr
    %161 = arith.constant 38 : i64
    %162 = func.call @cc_make_string(%160, %161) : (!llvm.ptr, i64) -> i64
    %163 = func.call @cc_nil_value() : () -> i64
    %164 = func.call @cc_intern(%162, %163) : (i64, i64) -> i64
    %165 = func.call @cc_nil_value() : () -> i64
    %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
    %167 = func.call @cc_values_pack(%166) : (i64) -> i64
    %168 = func.call @cc_set_symbol_value(%164, %150) : (i64, i64) -> i64
    %169 = llvm.mlir.addressof @str18 : !llvm.ptr
    %170 = arith.constant 39 : i64
    %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
    %172 = func.call @cc_nil_value() : () -> i64
    %173 = func.call @cc_intern(%171, %172) : (i64, i64) -> i64
    %174 = func.call @cc_nil_value() : () -> i64
    %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
    %176 = func.call @cc_values_pack(%175) : (i64) -> i64
    %177 = func.call @cc_set_symbol_value(%173, %150) : (i64, i64) -> i64
    %178 = func.call @cc_nil_value() : () -> i64
    %179 = llvm.mlir.addressof @str19 : !llvm.ptr
    %180 = arith.constant 37 : i64
    %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
    %182 = func.call @cc_nil_value() : () -> i64
    %183 = func.call @cc_intern(%181, %182) : (i64, i64) -> i64
    %184 = func.call @cc_nil_value() : () -> i64
    %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
    %186 = func.call @cc_values_pack(%185) : (i64) -> i64
    %187 = func.call @cc_set_symbol_value(%183, %178) : (i64, i64) -> i64
    %188 = llvm.mlir.addressof @str20 : !llvm.ptr
    %189 = arith.constant 38 : i64
    %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
    %191 = func.call @cc_nil_value() : () -> i64
    %192 = func.call @cc_intern(%190, %191) : (i64, i64) -> i64
    %193 = func.call @cc_nil_value() : () -> i64
    %194 = func.call @cc_cons(%192, %193) : (i64, i64) -> i64
    %195 = func.call @cc_values_pack(%194) : (i64) -> i64
    %196 = func.call @cc_set_symbol_value(%192, %178) : (i64, i64) -> i64
    %197 = llvm.mlir.addressof @str21 : !llvm.ptr
    %198 = arith.constant 39 : i64
    %199 = func.call @cc_make_string(%197, %198) : (!llvm.ptr, i64) -> i64
    %200 = func.call @cc_nil_value() : () -> i64
    %201 = func.call @cc_intern(%199, %200) : (i64, i64) -> i64
    %202 = func.call @cc_nil_value() : () -> i64
    %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
    %204 = func.call @cc_values_pack(%203) : (i64) -> i64
    %205 = func.call @cc_set_symbol_value(%201, %178) : (i64, i64) -> i64
    func.call @stack_push_pointer(%148) : (i64) -> ()
    %206 = func.call @stack_pop_pointer() : () -> i64
    %207 = func.call @cc_unbox_fixnum(%206) : (i64) -> i64
    %208 = arith.constant 0 : i64
    %209 = arith.cmpi eq, %207, %208 : i64
    %210 = func.call @cc_t_value() : () -> i64
    %211 = func.call @cc_nil_value() : () -> i64
    %212 = arith.select %209, %210, %211 : i64
    func.call @stack_push_pointer(%212) : (i64) -> ()
    %213 = func.call @stack_pop_pointer() : () -> i64
    %214 = func.call @cc_nil_value() : () -> i64
    %215 = arith.cmpi ne, %213, %214 : i64
    scf.if %215 {
      func.call @stack_push_pointer(%149) : (i64) -> ()
      %216 = func.call @stack_pop_pointer() : () -> i64
      %217 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%216, %217) : (i64, i64) -> ()
    } else {
      %243 = llvm.mlir.addressof @str23 : !llvm.ptr
      %244 = arith.constant 29 : i64
      %245 = func.call @cc_make_symbol(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = func.call @cc_persistent_root_value(%245) : (i64) -> i64
      %247 = func.call @cc_set_symbol_value(%246, %149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      %248 = arith.constant 97047688511492 : i64
      %249 = arith.constant 1 : i64
      %250 = func.call @cc_make_closure(%248, %249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      %251 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%148) : (i64) -> ()
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = arith.constant 1 : i64
      %254 = func.call @cc_box_fixnum(%253) : (i64) -> i64
      %256 = arith.constant 3 : i64
      %255 = arith.andi %252, %256 : i64
      %257 = arith.constant 0 : i64
      %258 = arith.cmpi eq, %255, %257 : i64
      %260 = arith.constant 3 : i64
      %259 = arith.andi %254, %260 : i64
      %261 = arith.constant 0 : i64
      %262 = arith.cmpi eq, %259, %261 : i64
      %263 = arith.andi %258, %262 : i1
      %264 = scf.if %263 -> (i64) {
        %265 = arith.constant 2 : i64
        %266 = arith.shrsi %252, %265 : i64
        %267 = arith.constant 2 : i64
        %268 = arith.shrsi %254, %267 : i64
        %269 = arith.subi %266, %268 : i64
        %270 = arith.constant -2305843009213693952 : i64
        %271 = arith.constant 2305843009213693951 : i64
        %272 = arith.cmpi sge, %269, %270 : i64
        %273 = arith.cmpi sle, %269, %271 : i64
        %274 = arith.andi %272, %273 : i1
        %275 = scf.if %274 -> (i64) {
          %276 = arith.constant 2 : i64
          %277 = arith.shli %269, %276 : i64
          scf.yield %277 : i64
        } else {
          %278 = func.call @cc_sub(%252, %254) : (i64, i64) -> i64
          scf.yield %278 : i64
        }
        scf.yield %275 : i64
      } else {
        %279 = func.call @cc_sub(%252, %254) : (i64, i64) -> i64
        scf.yield %279 : i64
      }
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @cc_nil_value() : () -> i64
      %282 = func.call @cc_errorp(%251) : (i64) -> i64
      %283 = arith.cmpi ne, %282, %281 : i64
      %284 = arith.cmpi eq, %281, %281 : i64
      %285 = arith.andi %283, %284 : i1
      %286 = scf.if %285 -> (i64) {
        scf.yield %251 : i64
      } else {
        scf.yield %281 : i64
      }
      %287 = func.call @cc_errorp(%280) : (i64) -> i64
      %288 = arith.cmpi ne, %287, %281 : i64
      %289 = arith.cmpi eq, %286, %281 : i64
      %290 = arith.andi %288, %289 : i1
      %291 = scf.if %290 -> (i64) {
        scf.yield %280 : i64
      } else {
        scf.yield %286 : i64
      }
      %292 = arith.cmpi ne, %291, %281 : i64
      scf.if %292 {
        func.call @stack_push_pointer(%291) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%251) : (i64) -> ()
        func.call @stack_push_pointer(%280) : (i64) -> ()
        %293 = llvm.mlir.addressof @str24 : !llvm.ptr
        %294 = func.call @cc_make_function_ref_const(%293) : (!llvm.ptr) -> i64
        %295 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%294, %295) : (i64, i64) -> ()
      }
    }
    %296 = func.call @stack_pop_pointer() : () -> i64
    %297 = func.call @cc_multiple_value_list(%296) : (i64) -> i64
    %298 = llvm.mlir.addressof @str25 : !llvm.ptr
    %299 = arith.constant 37 : i64
    %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
    %301 = func.call @cc_nil_value() : () -> i64
    %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
    %303 = func.call @cc_nil_value() : () -> i64
    %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
    %305 = func.call @cc_values_pack(%304) : (i64) -> i64
    %306 = func.call @cc_symbol_value(%302) : (i64) -> i64
    %307 = llvm.mlir.addressof @str26 : !llvm.ptr
    %308 = arith.constant 38 : i64
    %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
    %310 = func.call @cc_nil_value() : () -> i64
    %311 = func.call @cc_intern(%309, %310) : (i64, i64) -> i64
    %312 = func.call @cc_nil_value() : () -> i64
    %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
    %314 = func.call @cc_values_pack(%313) : (i64) -> i64
    %315 = func.call @cc_symbol_value(%311) : (i64) -> i64
    %316 = llvm.mlir.addressof @str27 : !llvm.ptr
    %317 = arith.constant 39 : i64
    %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = func.call @cc_intern(%318, %319) : (i64, i64) -> i64
    %321 = func.call @cc_nil_value() : () -> i64
    %322 = func.call @cc_cons(%320, %321) : (i64, i64) -> i64
    %323 = func.call @cc_values_pack(%322) : (i64) -> i64
    %324 = func.call @cc_symbol_value(%320) : (i64) -> i64
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = arith.cmpi ne, %306, %325 : i64
    %327 = scf.if %326 -> (i64) {
      scf.yield %324 : i64
    } else {
      scf.yield %297 : i64
    }
    %328 = func.call @cc_values_pack(%327) : (i64) -> i64
    func.call @stack_push_pointer(%328) : (i64) -> ()
    %329 = func.call @stack_pop_pointer() : () -> i64
    %330 = func.call @cc_multiple_value_list(%329) : (i64) -> i64
    %331 = llvm.mlir.addressof @str28 : !llvm.ptr
    %332 = arith.constant 37 : i64
    %333 = func.call @cc_make_string(%331, %332) : (!llvm.ptr, i64) -> i64
    %334 = func.call @cc_nil_value() : () -> i64
    %335 = func.call @cc_intern(%333, %334) : (i64, i64) -> i64
    %336 = func.call @cc_nil_value() : () -> i64
    %337 = func.call @cc_cons(%335, %336) : (i64, i64) -> i64
    %338 = func.call @cc_values_pack(%337) : (i64) -> i64
    %339 = func.call @cc_symbol_value(%335) : (i64) -> i64
    %340 = llvm.mlir.addressof @str29 : !llvm.ptr
    %341 = arith.constant 39 : i64
    %342 = func.call @cc_make_string(%340, %341) : (!llvm.ptr, i64) -> i64
    %343 = func.call @cc_nil_value() : () -> i64
    %344 = func.call @cc_intern(%342, %343) : (i64, i64) -> i64
    %345 = func.call @cc_nil_value() : () -> i64
    %346 = func.call @cc_cons(%344, %345) : (i64, i64) -> i64
    %347 = func.call @cc_values_pack(%346) : (i64) -> i64
    %348 = func.call @cc_symbol_value(%344) : (i64) -> i64
    %349 = func.call @cc_nil_value() : () -> i64
    %350 = arith.cmpi ne, %339, %349 : i64
    %351 = scf.if %350 -> (i64) {
      scf.yield %348 : i64
    } else {
      scf.yield %330 : i64
    }
    %352 = func.call @cc_values_pack(%351) : (i64) -> i64
    func.call @stack_push_pointer(%352) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %353 = llvm.mlir.addressof @str30 : !llvm.ptr
    %354 = arith.constant 6 : i64
    %355 = func.call @cc_make_string(%353, %354) : (!llvm.ptr, i64) -> i64
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = func.call @cc_intern(%355, %356) : (i64, i64) -> i64
    %358 = func.call @cc_nil_value() : () -> i64
    %359 = func.call @cc_cons(%357, %358) : (i64, i64) -> i64
    %360 = func.call @cc_values_pack(%359) : (i64) -> i64
    %361 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%357, %361) : (i64, i64) -> ()
    %362 = func.call @cc_nil_value() : () -> i64
    %363 = llvm.mlir.addressof @str31 : !llvm.ptr
    %364 = arith.constant 37 : i64
    %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
    %366 = func.call @cc_nil_value() : () -> i64
    %367 = func.call @cc_intern(%365, %366) : (i64, i64) -> i64
    %368 = func.call @cc_nil_value() : () -> i64
    %369 = func.call @cc_cons(%367, %368) : (i64, i64) -> i64
    %370 = func.call @cc_values_pack(%369) : (i64) -> i64
    %371 = func.call @cc_set_symbol_value(%367, %362) : (i64, i64) -> i64
    %372 = llvm.mlir.addressof @str32 : !llvm.ptr
    %373 = arith.constant 38 : i64
    %374 = func.call @cc_make_string(%372, %373) : (!llvm.ptr, i64) -> i64
    %375 = func.call @cc_nil_value() : () -> i64
    %376 = func.call @cc_intern(%374, %375) : (i64, i64) -> i64
    %377 = func.call @cc_nil_value() : () -> i64
    %378 = func.call @cc_cons(%376, %377) : (i64, i64) -> i64
    %379 = func.call @cc_values_pack(%378) : (i64) -> i64
    %380 = func.call @cc_set_symbol_value(%376, %362) : (i64, i64) -> i64
    %381 = llvm.mlir.addressof @str33 : !llvm.ptr
    %382 = arith.constant 39 : i64
    %383 = func.call @cc_make_string(%381, %382) : (!llvm.ptr, i64) -> i64
    %384 = func.call @cc_nil_value() : () -> i64
    %385 = func.call @cc_intern(%383, %384) : (i64, i64) -> i64
    %386 = func.call @cc_nil_value() : () -> i64
    %387 = func.call @cc_cons(%385, %386) : (i64, i64) -> i64
    %388 = func.call @cc_values_pack(%387) : (i64) -> i64
    %389 = func.call @cc_set_symbol_value(%385, %362) : (i64, i64) -> i64
    %390 = func.call @cc_nil_value() : () -> i64
    %391 = func.call @cc_nil_value() : () -> i64
    %392 = func.call @cc_errorp(%390) : (i64) -> i64
    %393 = arith.cmpi ne, %392, %391 : i64
    %394 = scf.if %393 -> (i64) {
      scf.yield %390 : i64
    } else {
      %395 = llvm.mlir.addressof @str34 : !llvm.ptr
      %396 = arith.constant 11 : i64
      %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
      %398 = func.call @cc_nil_value() : () -> i64
      %399 = func.call @cc_intern(%397, %398) : (i64, i64) -> i64
      %400 = func.call @cc_nil_value() : () -> i64
      %401 = func.call @cc_cons(%399, %400) : (i64, i64) -> i64
      %402 = func.call @cc_values_pack(%401) : (i64) -> i64
      func.call @stack_push_pointer(%399) : (i64) -> ()
      %403 = func.call @stack_pop_pointer() : () -> i64
      %404 = func.call @cc_in_package(%403) : (i64) -> i64
      func.call @stack_push_pointer(%404) : (i64) -> ()
      %405 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %405 : i64
    }
    %406 = func.call @cc_nil_value() : () -> i64
    %407 = func.call @cc_errorp(%394) : (i64) -> i64
    %408 = arith.cmpi ne, %407, %406 : i64
    %409 = scf.if %408 -> (i64) {
      scf.yield %394 : i64
    } else {
      %410 = llvm.mlir.addressof @str35 : !llvm.ptr
      %411 = arith.constant 11 : i64
      %412 = func.call @cc_make_string(%410, %411) : (!llvm.ptr, i64) -> i64
      %413 = func.call @cc_nil_value() : () -> i64
      %414 = func.call @cc_intern(%412, %413) : (i64, i64) -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_cons(%414, %415) : (i64, i64) -> i64
      %417 = func.call @cc_values_pack(%416) : (i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = llvm.mlir.addressof @str36 : !llvm.ptr
      %420 = arith.constant 6 : i64
      %421 = func.call @cc_make_string(%419, %420) : (!llvm.ptr, i64) -> i64
      %422 = func.call @cc_nil_value() : () -> i64
      %423 = func.call @cc_intern(%421, %422) : (i64, i64) -> i64
      %424 = func.call @cc_nil_value() : () -> i64
      %425 = func.call @cc_cons(%423, %424) : (i64, i64) -> i64
      %426 = func.call @cc_values_pack(%425) : (i64) -> i64
      func.call @stack_push_pointer(%423) : (i64) -> ()
      %427 = llvm.mlir.addressof @str37 : !llvm.ptr
      %428 = arith.constant 21 : i64
      %429 = func.call @cc_make_string(%427, %428) : (!llvm.ptr, i64) -> i64
      %430 = llvm.mlir.addressof @str38 : !llvm.ptr
      %431 = arith.constant 11 : i64
      %432 = func.call @cc_make_string(%430, %431) : (!llvm.ptr, i64) -> i64
      %433 = func.call @cc_intern(%429, %432) : (i64, i64) -> i64
      %434 = func.call @cc_nil_value() : () -> i64
      %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
      %436 = func.call @cc_values_pack(%435) : (i64) -> i64
      func.call @stack_push_pointer(%433) : (i64) -> ()
      %437 = llvm.mlir.addressof @str39 : !llvm.ptr
      %438 = arith.constant 1 : i64
      %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_intern(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_nil_value() : () -> i64
      %443 = func.call @cc_cons(%441, %442) : (i64, i64) -> i64
      %444 = func.call @cc_values_pack(%443) : (i64) -> i64
      func.call @stack_push_pointer(%441) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %445 = func.call @stack_pop_pointer() : () -> i64
      %446 = func.call @stack_pop_pointer() : () -> i64
      %447 = func.call @cc_cons(%446, %445) : (i64, i64) -> i64
      func.call @stack_push_pointer(%447) : (i64) -> ()
      %448 = llvm.mlir.addressof @str40 : !llvm.ptr
      %449 = arith.constant 15 : i64
      %450 = func.call @cc_make_string(%448, %449) : (!llvm.ptr, i64) -> i64
      %451 = llvm.mlir.addressof @str41 : !llvm.ptr
      %452 = arith.constant 11 : i64
      %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
      %454 = func.call @cc_intern(%450, %453) : (i64, i64) -> i64
      %455 = func.call @cc_nil_value() : () -> i64
      %456 = func.call @cc_cons(%454, %455) : (i64, i64) -> i64
      %457 = func.call @cc_values_pack(%456) : (i64) -> i64
      func.call @stack_push_pointer(%454) : (i64) -> ()
      %458 = llvm.mlir.addressof @str42 : !llvm.ptr
      %459 = arith.constant 6 : i64
      %460 = func.call @cc_make_string(%458, %459) : (!llvm.ptr, i64) -> i64
      %461 = llvm.mlir.addressof @str43 : !llvm.ptr
      %462 = arith.constant 7 : i64
      %463 = func.call @cc_make_string(%461, %462) : (!llvm.ptr, i64) -> i64
      %464 = func.call @cc_intern(%460, %463) : (i64, i64) -> i64
      %465 = func.call @cc_nil_value() : () -> i64
      %466 = func.call @cc_cons(%464, %465) : (i64, i64) -> i64
      %467 = func.call @cc_values_pack(%466) : (i64) -> i64
      func.call @stack_push_pointer(%464) : (i64) -> ()
      %468 = llvm.mlir.addressof @str44 : !llvm.ptr
      %469 = arith.constant 1 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = func.call @cc_nil_value() : () -> i64
      %472 = func.call @cc_intern(%470, %471) : (i64, i64) -> i64
      %473 = func.call @cc_nil_value() : () -> i64
      %474 = func.call @cc_cons(%472, %473) : (i64, i64) -> i64
      %475 = func.call @cc_values_pack(%474) : (i64) -> i64
      func.call @stack_push_pointer(%472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_cons(%477, %476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @stack_pop_pointer() : () -> i64
      %481 = func.call @cc_cons(%480, %479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%481) : (i64) -> ()
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = func.call @cc_cons(%483, %482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%484) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @stack_pop_pointer() : () -> i64
      %487 = func.call @cc_cons(%486, %485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%487) : (i64) -> ()
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @stack_pop_pointer() : () -> i64
      %490 = func.call @cc_cons(%489, %488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%490) : (i64) -> ()
      %491 = func.call @stack_pop_pointer() : () -> i64
      %492 = func.call @stack_pop_pointer() : () -> i64
      %493 = func.call @cc_cons(%492, %491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%493) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %494 = func.call @stack_pop_pointer() : () -> i64
      %495 = func.call @stack_pop_pointer() : () -> i64
      %496 = func.call @cc_cons(%495, %494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%496) : (i64) -> ()
      %497 = func.call @stack_pop_pointer() : () -> i64
      %498 = func.call @stack_pop_pointer() : () -> i64
      %499 = func.call @cc_cons(%498, %497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%499) : (i64) -> ()
      %500 = func.call @stack_pop_pointer() : () -> i64
      %546 = arith.constant 97047688511495 : i64
      %547 = arith.constant 0 : i64
      %548 = func.call @cc_make_closure(%546, %547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%548) : (i64) -> ()
      %549 = func.call @stack_pop_pointer() : () -> i64
      %550 = llvm.mlir.addressof @str48 : !llvm.ptr
      %551 = arith.constant 6 : i64
      %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
      %553 = llvm.mlir.addressof @str49 : !llvm.ptr
      %554 = arith.constant 11 : i64
      %555 = func.call @cc_make_string(%553, %554) : (!llvm.ptr, i64) -> i64
      %556 = func.call @cc_intern(%552, %555) : (i64, i64) -> i64
      %557 = func.call @cc_nil_value() : () -> i64
      %558 = func.call @cc_cons(%556, %557) : (i64, i64) -> i64
      %559 = func.call @cc_values_pack(%558) : (i64) -> i64
      func.call @stack_push_pointer(%556) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %560 = func.call @stack_pop_pointer() : () -> i64
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @cc_cons(%561, %560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%562) : (i64) -> ()
      %563 = func.call @stack_pop_pointer() : () -> i64
      %564 = llvm.mlir.addressof @str50 : !llvm.ptr
      %565 = arith.constant 11 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      %567 = llvm.mlir.addressof @str51 : !llvm.ptr
      %568 = arith.constant 7 : i64
      %569 = func.call @cc_make_string(%567, %568) : (!llvm.ptr, i64) -> i64
      %570 = func.call @cc_intern(%566, %569) : (i64, i64) -> i64
      %571 = func.call @cc_nil_value() : () -> i64
      %572 = func.call @cc_cons(%570, %571) : (i64, i64) -> i64
      %573 = func.call @cc_values_pack(%572) : (i64) -> i64
      func.call @stack_push_pointer(%570) : (i64) -> ()
      %574 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %575 = func.call @stack_pop_pointer() : () -> i64
      %576 = llvm.mlir.addressof @str52 : !llvm.ptr
      %577 = arith.constant 4 : i64
      %578 = func.call @cc_make_string(%576, %577) : (!llvm.ptr, i64) -> i64
      %579 = llvm.mlir.addressof @str53 : !llvm.ptr
      %580 = arith.constant 7 : i64
      %581 = func.call @cc_make_string(%579, %580) : (!llvm.ptr, i64) -> i64
      %582 = func.call @cc_intern(%578, %581) : (i64, i64) -> i64
      %583 = func.call @cc_nil_value() : () -> i64
      %584 = func.call @cc_cons(%582, %583) : (i64, i64) -> i64
      %585 = func.call @cc_values_pack(%584) : (i64) -> i64
      func.call @stack_push_pointer(%582) : (i64) -> ()
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = llvm.mlir.addressof @str54 : !llvm.ptr
      %588 = arith.constant 5 : i64
      %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
      %590 = func.call @cc_nil_value() : () -> i64
      %591 = func.call @cc_intern(%589, %590) : (i64, i64) -> i64
      %592 = func.call @cc_nil_value() : () -> i64
      %593 = func.call @cc_cons(%591, %592) : (i64, i64) -> i64
      %594 = func.call @cc_values_pack(%593) : (i64) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      %595 = func.call @stack_pop_pointer() : () -> i64
      %596 = func.call @cc_nil_value() : () -> i64
      %597 = func.call @cc_errorp(%418) : (i64) -> i64
      %598 = arith.cmpi ne, %597, %596 : i64
      %599 = arith.cmpi eq, %596, %596 : i64
      %600 = arith.andi %598, %599 : i1
      %601 = scf.if %600 -> (i64) {
        scf.yield %418 : i64
      } else {
        scf.yield %596 : i64
      }
      %602 = func.call @cc_errorp(%500) : (i64) -> i64
      %603 = arith.cmpi ne, %602, %596 : i64
      %604 = arith.cmpi eq, %601, %596 : i64
      %605 = arith.andi %603, %604 : i1
      %606 = scf.if %605 -> (i64) {
        scf.yield %500 : i64
      } else {
        scf.yield %601 : i64
      }
      %607 = func.call @cc_errorp(%549) : (i64) -> i64
      %608 = arith.cmpi ne, %607, %596 : i64
      %609 = arith.cmpi eq, %606, %596 : i64
      %610 = arith.andi %608, %609 : i1
      %611 = scf.if %610 -> (i64) {
        scf.yield %549 : i64
      } else {
        scf.yield %606 : i64
      }
      %612 = func.call @cc_errorp(%563) : (i64) -> i64
      %613 = arith.cmpi ne, %612, %596 : i64
      %614 = arith.cmpi eq, %611, %596 : i64
      %615 = arith.andi %613, %614 : i1
      %616 = scf.if %615 -> (i64) {
        scf.yield %563 : i64
      } else {
        scf.yield %611 : i64
      }
      %617 = func.call @cc_errorp(%574) : (i64) -> i64
      %618 = arith.cmpi ne, %617, %596 : i64
      %619 = arith.cmpi eq, %616, %596 : i64
      %620 = arith.andi %618, %619 : i1
      %621 = scf.if %620 -> (i64) {
        scf.yield %574 : i64
      } else {
        scf.yield %616 : i64
      }
      %622 = func.call @cc_errorp(%575) : (i64) -> i64
      %623 = arith.cmpi ne, %622, %596 : i64
      %624 = arith.cmpi eq, %621, %596 : i64
      %625 = arith.andi %623, %624 : i1
      %626 = scf.if %625 -> (i64) {
        scf.yield %575 : i64
      } else {
        scf.yield %621 : i64
      }
      %627 = func.call @cc_errorp(%586) : (i64) -> i64
      %628 = arith.cmpi ne, %627, %596 : i64
      %629 = arith.cmpi eq, %626, %596 : i64
      %630 = arith.andi %628, %629 : i1
      %631 = scf.if %630 -> (i64) {
        scf.yield %586 : i64
      } else {
        scf.yield %626 : i64
      }
      %632 = func.call @cc_errorp(%595) : (i64) -> i64
      %633 = arith.cmpi ne, %632, %596 : i64
      %634 = arith.cmpi eq, %631, %596 : i64
      %635 = arith.andi %633, %634 : i1
      %636 = scf.if %635 -> (i64) {
        scf.yield %595 : i64
      } else {
        scf.yield %631 : i64
      }
      %637 = arith.cmpi ne, %636, %596 : i64
      scf.if %637 {
        func.call @stack_push_pointer(%636) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%418) : (i64) -> ()
        func.call @stack_push_pointer(%500) : (i64) -> ()
        func.call @stack_push_pointer(%549) : (i64) -> ()
        func.call @stack_push_pointer(%563) : (i64) -> ()
        func.call @stack_push_pointer(%574) : (i64) -> ()
        func.call @stack_push_pointer(%575) : (i64) -> ()
        func.call @stack_push_pointer(%586) : (i64) -> ()
        func.call @stack_push_pointer(%595) : (i64) -> ()
        %638 = llvm.mlir.addressof @str55 : !llvm.ptr
        %639 = func.call @cc_make_function_ref_const(%638) : (!llvm.ptr) -> i64
        %640 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%639, %640) : (i64, i64) -> ()
      }
      %641 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %641 : i64
    }
    %642 = func.call @cc_nil_value() : () -> i64
    %643 = func.call @cc_errorp(%409) : (i64) -> i64
    %644 = arith.cmpi ne, %643, %642 : i64
    %645 = scf.if %644 -> (i64) {
      scf.yield %409 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %646 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %646 : i64
    }
    %647 = func.call @cc_nil_value() : () -> i64
    %648 = func.call @cc_errorp(%645) : (i64) -> i64
    %649 = arith.cmpi ne, %648, %647 : i64
    %650 = scf.if %649 -> (i64) {
      scf.yield %645 : i64
    } else {
      %651 = llvm.mlir.addressof @str56 : !llvm.ptr
      %652 = func.call @cc_make_function_ref_const(%651) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%652) : (i64) -> ()
      %653 = func.call @stack_pop_pointer() : () -> i64
      %654 = llvm.mlir.addressof @str57 : !llvm.ptr
      %655 = arith.constant 32 : i64
      %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
      %657 = llvm.mlir.addressof @str58 : !llvm.ptr
      %658 = arith.constant 15 : i64
      %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
      %660 = func.call @cc_intern(%656, %659) : (i64, i64) -> i64
      %661 = func.call @cc_nil_value() : () -> i64
      %662 = func.call @cc_cons(%660, %661) : (i64, i64) -> i64
      %663 = func.call @cc_values_pack(%662) : (i64) -> i64
      %664 = func.call @cc_set_symbol_value(%660, %653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
      %665 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %665 : i64
    }
    %666 = func.call @cc_nil_value() : () -> i64
    %667 = func.call @cc_errorp(%650) : (i64) -> i64
    %668 = arith.cmpi ne, %667, %666 : i64
    %669 = scf.if %668 -> (i64) {
      scf.yield %650 : i64
    } else {
      %670 = llvm.mlir.addressof @str59 : !llvm.ptr
      %671 = func.call @cc_make_function_ref_const(%670) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %672 = func.call @stack_pop_pointer() : () -> i64
      %673 = llvm.mlir.addressof @str60 : !llvm.ptr
      %674 = arith.constant 32 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = llvm.mlir.addressof @str61 : !llvm.ptr
      %677 = arith.constant 15 : i64
      %678 = func.call @cc_make_string(%676, %677) : (!llvm.ptr, i64) -> i64
      %679 = func.call @cc_intern(%675, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      %683 = func.call @cc_set_symbol_value(%679, %672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      %684 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %684 : i64
    }
    %685 = func.call @cc_nil_value() : () -> i64
    %686 = func.call @cc_errorp(%669) : (i64) -> i64
    %687 = arith.cmpi ne, %686, %685 : i64
    %688 = scf.if %687 -> (i64) {
      scf.yield %669 : i64
    } else {
      %689 = llvm.mlir.addressof @str62 : !llvm.ptr
      %690 = func.call @cc_make_function_ref_const(%689) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%690) : (i64) -> ()
      %691 = func.call @stack_pop_pointer() : () -> i64
      %692 = llvm.mlir.addressof @str63 : !llvm.ptr
      %693 = arith.constant 32 : i64
      %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
      %695 = llvm.mlir.addressof @str64 : !llvm.ptr
      %696 = arith.constant 15 : i64
      %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
      %698 = func.call @cc_intern(%694, %697) : (i64, i64) -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
      %701 = func.call @cc_values_pack(%700) : (i64) -> i64
      %702 = func.call @cc_set_symbol_value(%698, %691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%691) : (i64) -> ()
      %703 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %703 : i64
    }
    %704 = func.call @cc_nil_value() : () -> i64
    %705 = func.call @cc_errorp(%688) : (i64) -> i64
    %706 = arith.cmpi ne, %705, %704 : i64
    %707 = scf.if %706 -> (i64) {
      scf.yield %688 : i64
    } else {
      %708 = llvm.mlir.addressof @str65 : !llvm.ptr
      %709 = func.call @cc_make_function_ref_const(%708) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = llvm.mlir.addressof @str66 : !llvm.ptr
      %712 = arith.constant 32 : i64
      %713 = func.call @cc_make_string(%711, %712) : (!llvm.ptr, i64) -> i64
      %714 = llvm.mlir.addressof @str67 : !llvm.ptr
      %715 = arith.constant 15 : i64
      %716 = func.call @cc_make_string(%714, %715) : (!llvm.ptr, i64) -> i64
      %717 = func.call @cc_intern(%713, %716) : (i64, i64) -> i64
      %718 = func.call @cc_nil_value() : () -> i64
      %719 = func.call @cc_cons(%717, %718) : (i64, i64) -> i64
      %720 = func.call @cc_values_pack(%719) : (i64) -> i64
      %721 = func.call @cc_set_symbol_value(%717, %710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%710) : (i64) -> ()
      %722 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %722 : i64
    }
    %723 = func.call @cc_nil_value() : () -> i64
    %724 = func.call @cc_errorp(%707) : (i64) -> i64
    %725 = arith.cmpi ne, %724, %723 : i64
    %726 = scf.if %725 -> (i64) {
      scf.yield %707 : i64
    } else {
      %727 = llvm.mlir.addressof @str68 : !llvm.ptr
      %728 = arith.constant 11 : i64
      %729 = func.call @cc_make_string(%727, %728) : (!llvm.ptr, i64) -> i64
      %730 = func.call @cc_nil_value() : () -> i64
      %731 = func.call @cc_intern(%729, %730) : (i64, i64) -> i64
      %732 = func.call @cc_nil_value() : () -> i64
      %733 = func.call @cc_cons(%731, %732) : (i64, i64) -> i64
      %734 = func.call @cc_values_pack(%733) : (i64) -> i64
      func.call @stack_push_pointer(%731) : (i64) -> ()
      %735 = func.call @stack_pop_pointer() : () -> i64
      %736 = llvm.mlir.addressof @str69 : !llvm.ptr
      %737 = arith.constant 3 : i64
      %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
      %739 = func.call @cc_nil_value() : () -> i64
      %740 = func.call @cc_intern(%738, %739) : (i64, i64) -> i64
      %741 = func.call @cc_nil_value() : () -> i64
      %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
      %743 = func.call @cc_values_pack(%742) : (i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      %744 = llvm.mlir.addressof @str70 : !llvm.ptr
      %745 = arith.constant 3 : i64
      %746 = func.call @cc_make_string(%744, %745) : (!llvm.ptr, i64) -> i64
      %747 = func.call @cc_nil_value() : () -> i64
      %748 = func.call @cc_intern(%746, %747) : (i64, i64) -> i64
      %749 = func.call @cc_nil_value() : () -> i64
      %750 = func.call @cc_cons(%748, %749) : (i64, i64) -> i64
      %751 = func.call @cc_values_pack(%750) : (i64) -> i64
      func.call @stack_push_pointer(%748) : (i64) -> ()
      %752 = llvm.mlir.addressof @str71 : !llvm.ptr
      %753 = arith.constant 5 : i64
      %754 = func.call @cc_make_string(%752, %753) : (!llvm.ptr, i64) -> i64
      %755 = func.call @cc_nil_value() : () -> i64
      %756 = func.call @cc_intern(%754, %755) : (i64, i64) -> i64
      %757 = func.call @cc_nil_value() : () -> i64
      %758 = func.call @cc_cons(%756, %757) : (i64, i64) -> i64
      %759 = func.call @cc_values_pack(%758) : (i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %760 = llvm.mlir.addressof @str72 : !llvm.ptr
      %761 = arith.constant 32 : i64
      %762 = func.call @cc_make_string(%760, %761) : (!llvm.ptr, i64) -> i64
      %763 = func.call @cc_nil_value() : () -> i64
      %764 = func.call @cc_intern(%762, %763) : (i64, i64) -> i64
      %765 = func.call @cc_nil_value() : () -> i64
      %766 = func.call @cc_cons(%764, %765) : (i64, i64) -> i64
      %767 = func.call @cc_values_pack(%766) : (i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      %768 = llvm.mlir.addressof @str73 : !llvm.ptr
      %769 = arith.constant 6 : i64
      %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
      %771 = func.call @cc_nil_value() : () -> i64
      %772 = func.call @cc_intern(%770, %771) : (i64, i64) -> i64
      %773 = func.call @cc_nil_value() : () -> i64
      %774 = func.call @cc_cons(%772, %773) : (i64, i64) -> i64
      %775 = func.call @cc_values_pack(%774) : (i64) -> i64
      func.call @stack_push_pointer(%772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %776 = llvm.mlir.addressof @str74 : !llvm.ptr
      %777 = arith.constant 10 : i64
      %778 = func.call @cc_make_string(%776, %777) : (!llvm.ptr, i64) -> i64
      %779 = llvm.mlir.addressof @str75 : !llvm.ptr
      %780 = arith.constant 11 : i64
      %781 = func.call @cc_make_string(%779, %780) : (!llvm.ptr, i64) -> i64
      %782 = func.call @cc_intern(%778, %781) : (i64, i64) -> i64
      %783 = func.call @cc_nil_value() : () -> i64
      %784 = func.call @cc_cons(%782, %783) : (i64, i64) -> i64
      %785 = func.call @cc_values_pack(%784) : (i64) -> i64
      func.call @stack_push_pointer(%782) : (i64) -> ()
      %786 = llvm.mlir.addressof @str76 : !llvm.ptr
      %787 = arith.constant 5 : i64
      %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
      %789 = func.call @cc_nil_value() : () -> i64
      %790 = func.call @cc_intern(%788, %789) : (i64, i64) -> i64
      %791 = func.call @cc_nil_value() : () -> i64
      %792 = func.call @cc_cons(%790, %791) : (i64, i64) -> i64
      %793 = func.call @cc_values_pack(%792) : (i64) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @stack_pop_pointer() : () -> i64
      %796 = func.call @cc_cons(%795, %794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%796) : (i64) -> ()
      %797 = llvm.mlir.addressof @str77 : !llvm.ptr
      %798 = arith.constant 9 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = llvm.mlir.addressof @str78 : !llvm.ptr
      %801 = arith.constant 11 : i64
      %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
      %803 = func.call @cc_intern(%799, %802) : (i64, i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
      %806 = func.call @cc_values_pack(%805) : (i64) -> i64
      func.call @stack_push_pointer(%803) : (i64) -> ()
      %807 = llvm.mlir.addressof @str79 : !llvm.ptr
      %808 = arith.constant 6 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = func.call @cc_nil_value() : () -> i64
      %811 = func.call @cc_intern(%809, %810) : (i64, i64) -> i64
      %812 = func.call @cc_nil_value() : () -> i64
      %813 = func.call @cc_cons(%811, %812) : (i64, i64) -> i64
      %814 = func.call @cc_values_pack(%813) : (i64) -> i64
      func.call @stack_push_pointer(%811) : (i64) -> ()
      %815 = llvm.mlir.addressof @str80 : !llvm.ptr
      %816 = arith.constant 5 : i64
      %817 = func.call @cc_make_string(%815, %816) : (!llvm.ptr, i64) -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_intern(%817, %818) : (i64, i64) -> i64
      %820 = func.call @cc_nil_value() : () -> i64
      %821 = func.call @cc_cons(%819, %820) : (i64, i64) -> i64
      %822 = func.call @cc_values_pack(%821) : (i64) -> i64
      func.call @stack_push_pointer(%819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @cc_cons(%824, %823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%825) : (i64) -> ()
      %826 = llvm.mlir.addressof @str81 : !llvm.ptr
      %827 = arith.constant 2 : i64
      %828 = func.call @cc_make_string(%826, %827) : (!llvm.ptr, i64) -> i64
      %829 = func.call @cc_nil_value() : () -> i64
      %830 = func.call @cc_intern(%828, %829) : (i64, i64) -> i64
      %831 = func.call @cc_nil_value() : () -> i64
      %832 = func.call @cc_cons(%830, %831) : (i64, i64) -> i64
      %833 = func.call @cc_values_pack(%832) : (i64) -> i64
      func.call @stack_push_pointer(%830) : (i64) -> ()
      %834 = llvm.mlir.addressof @str82 : !llvm.ptr
      %835 = arith.constant 2 : i64
      %836 = func.call @cc_make_string(%834, %835) : (!llvm.ptr, i64) -> i64
      %837 = llvm.mlir.addressof @str83 : !llvm.ptr
      %838 = arith.constant 11 : i64
      %839 = func.call @cc_make_string(%837, %838) : (!llvm.ptr, i64) -> i64
      %840 = func.call @cc_intern(%836, %839) : (i64, i64) -> i64
      %841 = func.call @cc_nil_value() : () -> i64
      %842 = func.call @cc_cons(%840, %841) : (i64, i64) -> i64
      %843 = func.call @cc_values_pack(%842) : (i64) -> i64
      func.call @stack_push_pointer(%840) : (i64) -> ()
      %844 = llvm.mlir.addressof @str84 : !llvm.ptr
      %845 = arith.constant 19 : i64
      %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
      %847 = llvm.mlir.addressof @str85 : !llvm.ptr
      %848 = arith.constant 11 : i64
      %849 = func.call @cc_make_string(%847, %848) : (!llvm.ptr, i64) -> i64
      %850 = func.call @cc_intern(%846, %849) : (i64, i64) -> i64
      %851 = func.call @cc_nil_value() : () -> i64
      %852 = func.call @cc_cons(%850, %851) : (i64, i64) -> i64
      %853 = func.call @cc_values_pack(%852) : (i64) -> i64
      func.call @stack_push_pointer(%850) : (i64) -> ()
      %854 = llvm.mlir.addressof @str86 : !llvm.ptr
      %855 = arith.constant 5 : i64
      %856 = func.call @cc_make_string(%854, %855) : (!llvm.ptr, i64) -> i64
      %857 = func.call @cc_nil_value() : () -> i64
      %858 = func.call @cc_intern(%856, %857) : (i64, i64) -> i64
      %859 = func.call @cc_nil_value() : () -> i64
      %860 = func.call @cc_cons(%858, %859) : (i64, i64) -> i64
      %861 = func.call @cc_values_pack(%860) : (i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @cc_cons(%863, %862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%864) : (i64) -> ()
      %865 = func.call @stack_pop_pointer() : () -> i64
      %866 = func.call @stack_pop_pointer() : () -> i64
      %867 = func.call @cc_cons(%866, %865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%867) : (i64) -> ()
      %868 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%868) : (i64) -> ()
      %869 = llvm.mlir.addressof @str87 : !llvm.ptr
      %870 = arith.constant 32 : i64
      %871 = func.call @cc_make_string(%869, %870) : (!llvm.ptr, i64) -> i64
      %872 = func.call @cc_nil_value() : () -> i64
      %873 = func.call @cc_intern(%871, %872) : (i64, i64) -> i64
      %874 = func.call @cc_nil_value() : () -> i64
      %875 = func.call @cc_cons(%873, %874) : (i64, i64) -> i64
      %876 = func.call @cc_values_pack(%875) : (i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      %877 = func.call @stack_pop_pointer() : () -> i64
      %878 = func.call @stack_pop_pointer() : () -> i64
      %879 = func.call @cc_cons(%877, %878) : (i64, i64) -> i64
      %880 = llvm.mlir.addressof @str88 : !llvm.ptr
      %881 = arith.constant 5 : i64
      %882 = func.call @cc_make_string(%880, %881) : (!llvm.ptr, i64) -> i64
      %883 = func.call @cc_nil_value() : () -> i64
      %884 = func.call @cc_intern(%882, %883) : (i64, i64) -> i64
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_cons(%884, %885) : (i64, i64) -> i64
      %887 = func.call @cc_values_pack(%886) : (i64) -> i64
      %888 = func.call @cc_cons(%884, %879) : (i64, i64) -> i64
      func.call @stack_push_pointer(%888) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %889 = func.call @stack_pop_pointer() : () -> i64
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @cc_cons(%890, %889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%894) : (i64) -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_cons(%896, %895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      %898 = llvm.mlir.addressof @str89 : !llvm.ptr
      %899 = arith.constant 5 : i64
      %900 = func.call @cc_make_string(%898, %899) : (!llvm.ptr, i64) -> i64
      %901 = func.call @cc_nil_value() : () -> i64
      %902 = func.call @cc_intern(%900, %901) : (i64, i64) -> i64
      %903 = func.call @cc_nil_value() : () -> i64
      %904 = func.call @cc_cons(%902, %903) : (i64, i64) -> i64
      %905 = func.call @cc_values_pack(%904) : (i64) -> i64
      func.call @stack_push_pointer(%902) : (i64) -> ()
      %906 = llvm.mlir.addressof @str90 : !llvm.ptr
      %907 = arith.constant 11 : i64
      %908 = func.call @cc_make_string(%906, %907) : (!llvm.ptr, i64) -> i64
      %909 = func.call @cc_nil_value() : () -> i64
      %910 = func.call @cc_intern(%908, %909) : (i64, i64) -> i64
      %911 = func.call @cc_nil_value() : () -> i64
      %912 = func.call @cc_cons(%910, %911) : (i64, i64) -> i64
      %913 = func.call @cc_values_pack(%912) : (i64) -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %914 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %915 = func.call @stack_pop_pointer() : () -> i64
      %916 = func.call @stack_pop_pointer() : () -> i64
      %917 = func.call @cc_cons(%916, %915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%917) : (i64) -> ()
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = func.call @stack_pop_pointer() : () -> i64
      %920 = func.call @cc_cons(%919, %918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%920) : (i64) -> ()
      %921 = func.call @stack_pop_pointer() : () -> i64
      %922 = func.call @stack_pop_pointer() : () -> i64
      %923 = func.call @cc_cons(%922, %921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%923) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %924 = func.call @stack_pop_pointer() : () -> i64
      %925 = func.call @stack_pop_pointer() : () -> i64
      %926 = func.call @cc_cons(%925, %924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%926) : (i64) -> ()
      %927 = func.call @stack_pop_pointer() : () -> i64
      %928 = func.call @stack_pop_pointer() : () -> i64
      %929 = func.call @cc_cons(%928, %927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%929) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %930 = func.call @stack_pop_pointer() : () -> i64
      %931 = func.call @stack_pop_pointer() : () -> i64
      %932 = func.call @cc_cons(%931, %930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%932) : (i64) -> ()
      %933 = func.call @stack_pop_pointer() : () -> i64
      %934 = func.call @stack_pop_pointer() : () -> i64
      %935 = func.call @cc_cons(%934, %933) : (i64, i64) -> i64
      func.call @stack_push_pointer(%935) : (i64) -> ()
      %936 = func.call @stack_pop_pointer() : () -> i64
      %937 = func.call @stack_pop_pointer() : () -> i64
      %938 = func.call @cc_cons(%937, %936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%938) : (i64) -> ()
      %939 = func.call @stack_pop_pointer() : () -> i64
      %940 = func.call @stack_pop_pointer() : () -> i64
      %941 = func.call @cc_cons(%940, %939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%941) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %942 = func.call @stack_pop_pointer() : () -> i64
      %943 = func.call @stack_pop_pointer() : () -> i64
      %944 = func.call @cc_cons(%943, %942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%944) : (i64) -> ()
      %945 = func.call @stack_pop_pointer() : () -> i64
      %946 = func.call @stack_pop_pointer() : () -> i64
      %947 = func.call @cc_cons(%946, %945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%947) : (i64) -> ()
      %948 = func.call @stack_pop_pointer() : () -> i64
      %949 = func.call @stack_pop_pointer() : () -> i64
      %950 = func.call @cc_cons(%949, %948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%950) : (i64) -> ()
      %951 = llvm.mlir.addressof @str91 : !llvm.ptr
      %952 = arith.constant 5 : i64
      %953 = func.call @cc_make_string(%951, %952) : (!llvm.ptr, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_intern(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      func.call @stack_push_pointer(%955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %959 = func.call @stack_pop_pointer() : () -> i64
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = func.call @cc_cons(%960, %959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%961) : (i64) -> ()
      %962 = func.call @stack_pop_pointer() : () -> i64
      %963 = func.call @stack_pop_pointer() : () -> i64
      %964 = func.call @cc_cons(%963, %962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%964) : (i64) -> ()
      %965 = func.call @stack_pop_pointer() : () -> i64
      %966 = func.call @stack_pop_pointer() : () -> i64
      %967 = func.call @cc_cons(%966, %965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %968 = func.call @stack_pop_pointer() : () -> i64
      %969 = func.call @stack_pop_pointer() : () -> i64
      %970 = func.call @cc_cons(%969, %968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%970) : (i64) -> ()
      %971 = func.call @stack_pop_pointer() : () -> i64
      %972 = func.call @stack_pop_pointer() : () -> i64
      %973 = func.call @cc_cons(%972, %971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%973) : (i64) -> ()
      %974 = func.call @stack_pop_pointer() : () -> i64
      %975 = func.call @stack_pop_pointer() : () -> i64
      %976 = func.call @cc_cons(%975, %974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%976) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %977 = func.call @stack_pop_pointer() : () -> i64
      %978 = func.call @stack_pop_pointer() : () -> i64
      %979 = func.call @cc_cons(%978, %977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%979) : (i64) -> ()
      %980 = func.call @stack_pop_pointer() : () -> i64
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @cc_cons(%981, %980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %983 = func.call @stack_pop_pointer() : () -> i64
      %984 = func.call @stack_pop_pointer() : () -> i64
      %985 = func.call @cc_cons(%984, %983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%985) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = func.call @stack_pop_pointer() : () -> i64
      %988 = func.call @cc_cons(%987, %986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%988) : (i64) -> ()
      %989 = func.call @stack_pop_pointer() : () -> i64
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @cc_cons(%990, %989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%991) : (i64) -> ()
      %992 = func.call @stack_pop_pointer() : () -> i64
      %993 = func.call @stack_pop_pointer() : () -> i64
      %994 = func.call @cc_cons(%993, %992) : (i64, i64) -> i64
      func.call @stack_push_pointer(%994) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %995 = func.call @stack_pop_pointer() : () -> i64
      %996 = func.call @stack_pop_pointer() : () -> i64
      %997 = func.call @cc_cons(%996, %995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = func.call @stack_pop_pointer() : () -> i64
      %1000 = func.call @cc_cons(%999, %998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1000) : (i64) -> ()
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @stack_pop_pointer() : () -> i64
      %1003 = func.call @cc_cons(%1002, %1001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = func.call @cc_cons(%1005, %1004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1006) : (i64) -> ()
      %1007 = func.call @stack_pop_pointer() : () -> i64
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_cons(%1008, %1007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1010 = func.call @stack_pop_pointer() : () -> i64
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = func.call @cc_cons(%1011, %1010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1012) : (i64) -> ()
      %1013 = func.call @stack_pop_pointer() : () -> i64
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @cc_cons(%1014, %1013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1016 = func.call @stack_pop_pointer() : () -> i64
      %1217 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1218 = arith.constant 33 : i64
      %1219 = func.call @cc_make_symbol(%1217, %1218) : (!llvm.ptr, i64) -> i64
      %1220 = func.call @cc_persistent_root_value(%1219) : (i64) -> i64
      func.call @stack_push_pointer(%1220) : (i64) -> ()
      %1221 = arith.constant 97047688511496 : i64
      %1222 = arith.constant 1 : i64
      %1223 = func.call @cc_make_closure(%1221, %1222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1223) : (i64) -> ()
      %1224 = func.call @stack_pop_pointer() : () -> i64
      %1225 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1226 = arith.constant 1 : i64
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
      %1236 = func.call @stack_pop_pointer() : () -> i64
      %1237 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1238 = arith.constant 11 : i64
      %1239 = func.call @cc_make_string(%1237, %1238) : (!llvm.ptr, i64) -> i64
      %1240 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1241 = arith.constant 7 : i64
      %1242 = func.call @cc_make_string(%1240, %1241) : (!llvm.ptr, i64) -> i64
      %1243 = func.call @cc_intern(%1239, %1242) : (i64, i64) -> i64
      %1244 = func.call @cc_nil_value() : () -> i64
      %1245 = func.call @cc_cons(%1243, %1244) : (i64, i64) -> i64
      %1246 = func.call @cc_values_pack(%1245) : (i64) -> i64
      func.call @stack_push_pointer(%1243) : (i64) -> ()
      %1247 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1248 = func.call @stack_pop_pointer() : () -> i64
      %1249 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1250 = arith.constant 4 : i64
      %1251 = func.call @cc_make_string(%1249, %1250) : (!llvm.ptr, i64) -> i64
      %1252 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1253 = arith.constant 7 : i64
      %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
      %1255 = func.call @cc_intern(%1251, %1254) : (i64, i64) -> i64
      %1256 = func.call @cc_nil_value() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      %1258 = func.call @cc_values_pack(%1257) : (i64) -> i64
      func.call @stack_push_pointer(%1255) : (i64) -> ()
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1261 = arith.constant 6 : i64
      %1262 = func.call @cc_make_string(%1260, %1261) : (!llvm.ptr, i64) -> i64
      %1263 = func.call @cc_nil_value() : () -> i64
      %1264 = func.call @cc_intern(%1262, %1263) : (i64, i64) -> i64
      %1265 = func.call @cc_nil_value() : () -> i64
      %1266 = func.call @cc_cons(%1264, %1265) : (i64, i64) -> i64
      %1267 = func.call @cc_values_pack(%1266) : (i64) -> i64
      func.call @stack_push_pointer(%1264) : (i64) -> ()
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_errorp(%735) : (i64) -> i64
      %1271 = arith.cmpi ne, %1270, %1269 : i64
      %1272 = arith.cmpi eq, %1269, %1269 : i64
      %1273 = arith.andi %1271, %1272 : i1
      %1274 = scf.if %1273 -> (i64) {
        scf.yield %735 : i64
      } else {
        scf.yield %1269 : i64
      }
      %1275 = func.call @cc_errorp(%1016) : (i64) -> i64
      %1276 = arith.cmpi ne, %1275, %1269 : i64
      %1277 = arith.cmpi eq, %1274, %1269 : i64
      %1278 = arith.andi %1276, %1277 : i1
      %1279 = scf.if %1278 -> (i64) {
        scf.yield %1016 : i64
      } else {
        scf.yield %1274 : i64
      }
      %1280 = func.call @cc_errorp(%1224) : (i64) -> i64
      %1281 = arith.cmpi ne, %1280, %1269 : i64
      %1282 = arith.cmpi eq, %1279, %1269 : i64
      %1283 = arith.andi %1281, %1282 : i1
      %1284 = scf.if %1283 -> (i64) {
        scf.yield %1224 : i64
      } else {
        scf.yield %1279 : i64
      }
      %1285 = func.call @cc_errorp(%1236) : (i64) -> i64
      %1286 = arith.cmpi ne, %1285, %1269 : i64
      %1287 = arith.cmpi eq, %1284, %1269 : i64
      %1288 = arith.andi %1286, %1287 : i1
      %1289 = scf.if %1288 -> (i64) {
        scf.yield %1236 : i64
      } else {
        scf.yield %1284 : i64
      }
      %1290 = func.call @cc_errorp(%1247) : (i64) -> i64
      %1291 = arith.cmpi ne, %1290, %1269 : i64
      %1292 = arith.cmpi eq, %1289, %1269 : i64
      %1293 = arith.andi %1291, %1292 : i1
      %1294 = scf.if %1293 -> (i64) {
        scf.yield %1247 : i64
      } else {
        scf.yield %1289 : i64
      }
      %1295 = func.call @cc_errorp(%1248) : (i64) -> i64
      %1296 = arith.cmpi ne, %1295, %1269 : i64
      %1297 = arith.cmpi eq, %1294, %1269 : i64
      %1298 = arith.andi %1296, %1297 : i1
      %1299 = scf.if %1298 -> (i64) {
        scf.yield %1248 : i64
      } else {
        scf.yield %1294 : i64
      }
      %1300 = func.call @cc_errorp(%1259) : (i64) -> i64
      %1301 = arith.cmpi ne, %1300, %1269 : i64
      %1302 = arith.cmpi eq, %1299, %1269 : i64
      %1303 = arith.andi %1301, %1302 : i1
      %1304 = scf.if %1303 -> (i64) {
        scf.yield %1259 : i64
      } else {
        scf.yield %1299 : i64
      }
      %1305 = func.call @cc_errorp(%1268) : (i64) -> i64
      %1306 = arith.cmpi ne, %1305, %1269 : i64
      %1307 = arith.cmpi eq, %1304, %1269 : i64
      %1308 = arith.andi %1306, %1307 : i1
      %1309 = scf.if %1308 -> (i64) {
        scf.yield %1268 : i64
      } else {
        scf.yield %1304 : i64
      }
      %1310 = arith.cmpi ne, %1309, %1269 : i64
      scf.if %1310 {
        func.call @stack_push_pointer(%1309) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%735) : (i64) -> ()
        func.call @stack_push_pointer(%1016) : (i64) -> ()
        func.call @stack_push_pointer(%1224) : (i64) -> ()
        func.call @stack_push_pointer(%1236) : (i64) -> ()
        func.call @stack_push_pointer(%1247) : (i64) -> ()
        func.call @stack_push_pointer(%1248) : (i64) -> ()
        func.call @stack_push_pointer(%1259) : (i64) -> ()
        func.call @stack_push_pointer(%1268) : (i64) -> ()
        %1311 = llvm.mlir.addressof @str112 : !llvm.ptr
        %1312 = func.call @cc_make_function_ref_const(%1311) : (!llvm.ptr) -> i64
        %1313 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1312, %1313) : (i64, i64) -> ()
      }
      %1314 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1314 : i64
    }
    %1315 = func.call @cc_nil_value() : () -> i64
    %1316 = func.call @cc_errorp(%726) : (i64) -> i64
    %1317 = arith.cmpi ne, %1316, %1315 : i64
    %1318 = scf.if %1317 -> (i64) {
      scf.yield %726 : i64
    } else {
      %1319 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1320 = func.call @cc_make_function_ref_const(%1319) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1320) : (i64) -> ()
      %1321 = func.call @stack_pop_pointer() : () -> i64
      %1322 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1323 = arith.constant 11 : i64
      %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
      %1325 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1326 = arith.constant 15 : i64
      %1327 = func.call @cc_make_string(%1325, %1326) : (!llvm.ptr, i64) -> i64
      %1328 = func.call @cc_intern(%1324, %1327) : (i64, i64) -> i64
      %1329 = func.call @cc_nil_value() : () -> i64
      %1330 = func.call @cc_cons(%1328, %1329) : (i64, i64) -> i64
      %1331 = func.call @cc_values_pack(%1330) : (i64) -> i64
      %1332 = func.call @cc_set_symbol_value(%1328, %1321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1321) : (i64) -> ()
      %1333 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1333 : i64
    }
    %1334 = func.call @cc_nil_value() : () -> i64
    %1335 = func.call @cc_errorp(%1318) : (i64) -> i64
    %1336 = arith.cmpi ne, %1335, %1334 : i64
    %1337 = scf.if %1336 -> (i64) {
      scf.yield %1318 : i64
    } else {
      %1338 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1339 = func.call @cc_make_function_ref_const(%1338) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1339) : (i64) -> ()
      %1340 = func.call @stack_pop_pointer() : () -> i64
      %1341 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1342 = arith.constant 11 : i64
      %1343 = func.call @cc_make_string(%1341, %1342) : (!llvm.ptr, i64) -> i64
      %1344 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1345 = arith.constant 15 : i64
      %1346 = func.call @cc_make_string(%1344, %1345) : (!llvm.ptr, i64) -> i64
      %1347 = func.call @cc_intern(%1343, %1346) : (i64, i64) -> i64
      %1348 = func.call @cc_nil_value() : () -> i64
      %1349 = func.call @cc_cons(%1347, %1348) : (i64, i64) -> i64
      %1350 = func.call @cc_values_pack(%1349) : (i64) -> i64
      %1351 = func.call @cc_set_symbol_value(%1347, %1340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1340) : (i64) -> ()
      %1352 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1352 : i64
    }
    %1353 = func.call @cc_nil_value() : () -> i64
    %1354 = func.call @cc_errorp(%1337) : (i64) -> i64
    %1355 = arith.cmpi ne, %1354, %1353 : i64
    %1356 = scf.if %1355 -> (i64) {
      scf.yield %1337 : i64
    } else {
      %1357 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1358 = func.call @cc_make_function_ref_const(%1357) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1358) : (i64) -> ()
      %1359 = func.call @stack_pop_pointer() : () -> i64
      %1360 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1361 = arith.constant 11 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      %1363 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1364 = arith.constant 15 : i64
      %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
      %1366 = func.call @cc_intern(%1362, %1365) : (i64, i64) -> i64
      %1367 = func.call @cc_nil_value() : () -> i64
      %1368 = func.call @cc_cons(%1366, %1367) : (i64, i64) -> i64
      %1369 = func.call @cc_values_pack(%1368) : (i64) -> i64
      %1370 = func.call @cc_set_symbol_value(%1366, %1359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      %1371 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1371 : i64
    }
    %1372 = func.call @cc_nil_value() : () -> i64
    %1373 = func.call @cc_errorp(%1356) : (i64) -> i64
    %1374 = arith.cmpi ne, %1373, %1372 : i64
    %1375 = scf.if %1374 -> (i64) {
      scf.yield %1356 : i64
    } else {
      %1376 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1377 = func.call @cc_make_function_ref_const(%1376) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1377) : (i64) -> ()
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1380 = arith.constant 11 : i64
      %1381 = func.call @cc_make_string(%1379, %1380) : (!llvm.ptr, i64) -> i64
      %1382 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1383 = arith.constant 15 : i64
      %1384 = func.call @cc_make_string(%1382, %1383) : (!llvm.ptr, i64) -> i64
      %1385 = func.call @cc_intern(%1381, %1384) : (i64, i64) -> i64
      %1386 = func.call @cc_nil_value() : () -> i64
      %1387 = func.call @cc_cons(%1385, %1386) : (i64, i64) -> i64
      %1388 = func.call @cc_values_pack(%1387) : (i64) -> i64
      %1389 = func.call @cc_set_symbol_value(%1385, %1378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1378) : (i64) -> ()
      %1390 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1390 : i64
    }
    %1391 = func.call @cc_nil_value() : () -> i64
    %1392 = func.call @cc_errorp(%1375) : (i64) -> i64
    %1393 = arith.cmpi ne, %1392, %1391 : i64
    %1394 = scf.if %1393 -> (i64) {
      scf.yield %1375 : i64
    } else {
      %1395 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1396 = arith.constant 11 : i64
      %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
      %1398 = func.call @cc_nil_value() : () -> i64
      %1399 = func.call @cc_intern(%1397, %1398) : (i64, i64) -> i64
      %1400 = func.call @cc_nil_value() : () -> i64
      %1401 = func.call @cc_cons(%1399, %1400) : (i64, i64) -> i64
      %1402 = func.call @cc_values_pack(%1401) : (i64) -> i64
      func.call @stack_push_pointer(%1399) : (i64) -> ()
      %1403 = func.call @stack_pop_pointer() : () -> i64
      %1404 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1405 = arith.constant 5 : i64
      %1406 = func.call @cc_make_string(%1404, %1405) : (!llvm.ptr, i64) -> i64
      %1407 = func.call @cc_nil_value() : () -> i64
      %1408 = func.call @cc_intern(%1406, %1407) : (i64, i64) -> i64
      %1409 = func.call @cc_nil_value() : () -> i64
      %1410 = func.call @cc_cons(%1408, %1409) : (i64, i64) -> i64
      %1411 = func.call @cc_values_pack(%1410) : (i64) -> i64
      func.call @stack_push_pointer(%1408) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1412 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1413 = arith.constant 11 : i64
      %1414 = func.call @cc_make_string(%1412, %1413) : (!llvm.ptr, i64) -> i64
      %1415 = func.call @cc_nil_value() : () -> i64
      %1416 = func.call @cc_intern(%1414, %1415) : (i64, i64) -> i64
      %1417 = func.call @cc_nil_value() : () -> i64
      %1418 = func.call @cc_cons(%1416, %1417) : (i64, i64) -> i64
      %1419 = func.call @cc_values_pack(%1418) : (i64) -> i64
      func.call @stack_push_pointer(%1416) : (i64) -> ()
      %1420 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1421 = arith.constant 6 : i64
      %1422 = func.call @cc_make_string(%1420, %1421) : (!llvm.ptr, i64) -> i64
      %1423 = func.call @cc_nil_value() : () -> i64
      %1424 = func.call @cc_intern(%1422, %1423) : (i64, i64) -> i64
      %1425 = func.call @cc_nil_value() : () -> i64
      %1426 = func.call @cc_cons(%1424, %1425) : (i64, i64) -> i64
      %1427 = func.call @cc_values_pack(%1426) : (i64) -> i64
      func.call @stack_push_pointer(%1424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1428 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1429 = arith.constant 3 : i64
      %1430 = func.call @cc_make_string(%1428, %1429) : (!llvm.ptr, i64) -> i64
      %1431 = func.call @cc_nil_value() : () -> i64
      %1432 = func.call @cc_intern(%1430, %1431) : (i64, i64) -> i64
      %1433 = func.call @cc_nil_value() : () -> i64
      %1434 = func.call @cc_cons(%1432, %1433) : (i64, i64) -> i64
      %1435 = func.call @cc_values_pack(%1434) : (i64) -> i64
      func.call @stack_push_pointer(%1432) : (i64) -> ()
      %1436 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1437 = arith.constant 5 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1440 = arith.constant 11 : i64
      %1441 = func.call @cc_make_string(%1439, %1440) : (!llvm.ptr, i64) -> i64
      %1442 = func.call @cc_intern(%1438, %1441) : (i64, i64) -> i64
      %1443 = func.call @cc_nil_value() : () -> i64
      %1444 = func.call @cc_cons(%1442, %1443) : (i64, i64) -> i64
      %1445 = func.call @cc_values_pack(%1444) : (i64) -> i64
      func.call @stack_push_pointer(%1442) : (i64) -> ()
      %1446 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1446) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1447 = func.call @stack_pop_pointer() : () -> i64
      %1448 = func.call @stack_pop_pointer() : () -> i64
      %1449 = func.call @cc_cons(%1448, %1447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1449) : (i64) -> ()
      %1450 = func.call @stack_pop_pointer() : () -> i64
      %1451 = func.call @stack_pop_pointer() : () -> i64
      %1452 = func.call @cc_cons(%1451, %1450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1452) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1453 = func.call @stack_pop_pointer() : () -> i64
      %1454 = func.call @stack_pop_pointer() : () -> i64
      %1455 = func.call @cc_cons(%1454, %1453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1455) : (i64) -> ()
      %1456 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1457 = arith.constant 10 : i64
      %1458 = func.call @cc_make_string(%1456, %1457) : (!llvm.ptr, i64) -> i64
      %1459 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1460 = arith.constant 11 : i64
      %1461 = func.call @cc_make_string(%1459, %1460) : (!llvm.ptr, i64) -> i64
      %1462 = func.call @cc_intern(%1458, %1461) : (i64, i64) -> i64
      %1463 = func.call @cc_nil_value() : () -> i64
      %1464 = func.call @cc_cons(%1462, %1463) : (i64, i64) -> i64
      %1465 = func.call @cc_values_pack(%1464) : (i64) -> i64
      func.call @stack_push_pointer(%1462) : (i64) -> ()
      %1466 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1467 = arith.constant 5 : i64
      %1468 = func.call @cc_make_string(%1466, %1467) : (!llvm.ptr, i64) -> i64
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = func.call @cc_intern(%1468, %1469) : (i64, i64) -> i64
      %1471 = func.call @cc_nil_value() : () -> i64
      %1472 = func.call @cc_cons(%1470, %1471) : (i64, i64) -> i64
      %1473 = func.call @cc_values_pack(%1472) : (i64) -> i64
      func.call @stack_push_pointer(%1470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1474 = func.call @stack_pop_pointer() : () -> i64
      %1475 = func.call @stack_pop_pointer() : () -> i64
      %1476 = func.call @cc_cons(%1475, %1474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1476) : (i64) -> ()
      %1477 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1478 = arith.constant 9 : i64
      %1479 = func.call @cc_make_string(%1477, %1478) : (!llvm.ptr, i64) -> i64
      %1480 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1481 = arith.constant 11 : i64
      %1482 = func.call @cc_make_string(%1480, %1481) : (!llvm.ptr, i64) -> i64
      %1483 = func.call @cc_intern(%1479, %1482) : (i64, i64) -> i64
      %1484 = func.call @cc_nil_value() : () -> i64
      %1485 = func.call @cc_cons(%1483, %1484) : (i64, i64) -> i64
      %1486 = func.call @cc_values_pack(%1485) : (i64) -> i64
      func.call @stack_push_pointer(%1483) : (i64) -> ()
      %1487 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1488 = arith.constant 6 : i64
      %1489 = func.call @cc_make_string(%1487, %1488) : (!llvm.ptr, i64) -> i64
      %1490 = func.call @cc_nil_value() : () -> i64
      %1491 = func.call @cc_intern(%1489, %1490) : (i64, i64) -> i64
      %1492 = func.call @cc_nil_value() : () -> i64
      %1493 = func.call @cc_cons(%1491, %1492) : (i64, i64) -> i64
      %1494 = func.call @cc_values_pack(%1493) : (i64) -> i64
      func.call @stack_push_pointer(%1491) : (i64) -> ()
      %1495 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1496 = arith.constant 5 : i64
      %1497 = func.call @cc_make_string(%1495, %1496) : (!llvm.ptr, i64) -> i64
      %1498 = func.call @cc_nil_value() : () -> i64
      %1499 = func.call @cc_intern(%1497, %1498) : (i64, i64) -> i64
      %1500 = func.call @cc_nil_value() : () -> i64
      %1501 = func.call @cc_cons(%1499, %1500) : (i64, i64) -> i64
      %1502 = func.call @cc_values_pack(%1501) : (i64) -> i64
      func.call @stack_push_pointer(%1499) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1503 = func.call @stack_pop_pointer() : () -> i64
      %1504 = func.call @stack_pop_pointer() : () -> i64
      %1505 = func.call @cc_cons(%1504, %1503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1505) : (i64) -> ()
      %1506 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1507 = arith.constant 2 : i64
      %1508 = func.call @cc_make_string(%1506, %1507) : (!llvm.ptr, i64) -> i64
      %1509 = func.call @cc_nil_value() : () -> i64
      %1510 = func.call @cc_intern(%1508, %1509) : (i64, i64) -> i64
      %1511 = func.call @cc_nil_value() : () -> i64
      %1512 = func.call @cc_cons(%1510, %1511) : (i64, i64) -> i64
      %1513 = func.call @cc_values_pack(%1512) : (i64) -> i64
      func.call @stack_push_pointer(%1510) : (i64) -> ()
      %1514 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1515 = arith.constant 2 : i64
      %1516 = func.call @cc_make_string(%1514, %1515) : (!llvm.ptr, i64) -> i64
      %1517 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1518 = arith.constant 11 : i64
      %1519 = func.call @cc_make_string(%1517, %1518) : (!llvm.ptr, i64) -> i64
      %1520 = func.call @cc_intern(%1516, %1519) : (i64, i64) -> i64
      %1521 = func.call @cc_nil_value() : () -> i64
      %1522 = func.call @cc_cons(%1520, %1521) : (i64, i64) -> i64
      %1523 = func.call @cc_values_pack(%1522) : (i64) -> i64
      func.call @stack_push_pointer(%1520) : (i64) -> ()
      %1524 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1525 = arith.constant 19 : i64
      %1526 = func.call @cc_make_string(%1524, %1525) : (!llvm.ptr, i64) -> i64
      %1527 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1528 = arith.constant 11 : i64
      %1529 = func.call @cc_make_string(%1527, %1528) : (!llvm.ptr, i64) -> i64
      %1530 = func.call @cc_intern(%1526, %1529) : (i64, i64) -> i64
      %1531 = func.call @cc_nil_value() : () -> i64
      %1532 = func.call @cc_cons(%1530, %1531) : (i64, i64) -> i64
      %1533 = func.call @cc_values_pack(%1532) : (i64) -> i64
      func.call @stack_push_pointer(%1530) : (i64) -> ()
      %1534 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1535 = arith.constant 5 : i64
      %1536 = func.call @cc_make_string(%1534, %1535) : (!llvm.ptr, i64) -> i64
      %1537 = func.call @cc_nil_value() : () -> i64
      %1538 = func.call @cc_intern(%1536, %1537) : (i64, i64) -> i64
      %1539 = func.call @cc_nil_value() : () -> i64
      %1540 = func.call @cc_cons(%1538, %1539) : (i64, i64) -> i64
      %1541 = func.call @cc_values_pack(%1540) : (i64) -> i64
      func.call @stack_push_pointer(%1538) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1542 = func.call @stack_pop_pointer() : () -> i64
      %1543 = func.call @stack_pop_pointer() : () -> i64
      %1544 = func.call @cc_cons(%1543, %1542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1544) : (i64) -> ()
      %1545 = func.call @stack_pop_pointer() : () -> i64
      %1546 = func.call @stack_pop_pointer() : () -> i64
      %1547 = func.call @cc_cons(%1546, %1545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1547) : (i64) -> ()
      %1548 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1548) : (i64) -> ()
      %1549 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1550 = arith.constant 32 : i64
      %1551 = func.call @cc_make_string(%1549, %1550) : (!llvm.ptr, i64) -> i64
      %1552 = func.call @cc_nil_value() : () -> i64
      %1553 = func.call @cc_intern(%1551, %1552) : (i64, i64) -> i64
      %1554 = func.call @cc_nil_value() : () -> i64
      %1555 = func.call @cc_cons(%1553, %1554) : (i64, i64) -> i64
      %1556 = func.call @cc_values_pack(%1555) : (i64) -> i64
      func.call @stack_push_pointer(%1553) : (i64) -> ()
      %1557 = func.call @stack_pop_pointer() : () -> i64
      %1558 = func.call @stack_pop_pointer() : () -> i64
      %1559 = func.call @cc_cons(%1557, %1558) : (i64, i64) -> i64
      %1560 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1561 = arith.constant 5 : i64
      %1562 = func.call @cc_make_string(%1560, %1561) : (!llvm.ptr, i64) -> i64
      %1563 = func.call @cc_nil_value() : () -> i64
      %1564 = func.call @cc_intern(%1562, %1563) : (i64, i64) -> i64
      %1565 = func.call @cc_nil_value() : () -> i64
      %1566 = func.call @cc_cons(%1564, %1565) : (i64, i64) -> i64
      %1567 = func.call @cc_values_pack(%1566) : (i64) -> i64
      %1568 = func.call @cc_cons(%1564, %1559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1568) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1569 = func.call @stack_pop_pointer() : () -> i64
      %1570 = func.call @stack_pop_pointer() : () -> i64
      %1571 = func.call @cc_cons(%1570, %1569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1571) : (i64) -> ()
      %1572 = func.call @stack_pop_pointer() : () -> i64
      %1573 = func.call @stack_pop_pointer() : () -> i64
      %1574 = func.call @cc_cons(%1573, %1572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1574) : (i64) -> ()
      %1575 = func.call @stack_pop_pointer() : () -> i64
      %1576 = func.call @stack_pop_pointer() : () -> i64
      %1577 = func.call @cc_cons(%1576, %1575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1577) : (i64) -> ()
      %1578 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1579 = arith.constant 5 : i64
      %1580 = func.call @cc_make_string(%1578, %1579) : (!llvm.ptr, i64) -> i64
      %1581 = func.call @cc_nil_value() : () -> i64
      %1582 = func.call @cc_intern(%1580, %1581) : (i64, i64) -> i64
      %1583 = func.call @cc_nil_value() : () -> i64
      %1584 = func.call @cc_cons(%1582, %1583) : (i64, i64) -> i64
      %1585 = func.call @cc_values_pack(%1584) : (i64) -> i64
      func.call @stack_push_pointer(%1582) : (i64) -> ()
      %1586 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1587 = arith.constant 4 : i64
      %1588 = func.call @cc_make_string(%1586, %1587) : (!llvm.ptr, i64) -> i64
      %1589 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1590 = arith.constant 11 : i64
      %1591 = func.call @cc_make_string(%1589, %1590) : (!llvm.ptr, i64) -> i64
      %1592 = func.call @cc_intern(%1588, %1591) : (i64, i64) -> i64
      %1593 = func.call @cc_nil_value() : () -> i64
      %1594 = func.call @cc_cons(%1592, %1593) : (i64, i64) -> i64
      %1595 = func.call @cc_values_pack(%1594) : (i64) -> i64
      func.call @stack_push_pointer(%1592) : (i64) -> ()
      %1596 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1597 = arith.constant 5 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1600 = arith.constant 11 : i64
      %1601 = func.call @cc_make_string(%1599, %1600) : (!llvm.ptr, i64) -> i64
      %1602 = func.call @cc_intern(%1598, %1601) : (i64, i64) -> i64
      %1603 = func.call @cc_nil_value() : () -> i64
      %1604 = func.call @cc_cons(%1602, %1603) : (i64, i64) -> i64
      %1605 = func.call @cc_values_pack(%1604) : (i64) -> i64
      func.call @stack_push_pointer(%1602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1606 = func.call @stack_pop_pointer() : () -> i64
      %1607 = func.call @stack_pop_pointer() : () -> i64
      %1608 = func.call @cc_cons(%1607, %1606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      %1609 = func.call @stack_pop_pointer() : () -> i64
      %1610 = func.call @stack_pop_pointer() : () -> i64
      %1611 = func.call @cc_cons(%1610, %1609) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1611) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = func.call @stack_pop_pointer() : () -> i64
      %1614 = func.call @cc_cons(%1613, %1612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1614) : (i64) -> ()
      %1615 = func.call @stack_pop_pointer() : () -> i64
      %1616 = func.call @stack_pop_pointer() : () -> i64
      %1617 = func.call @cc_cons(%1616, %1615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1618 = func.call @stack_pop_pointer() : () -> i64
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @cc_cons(%1619, %1618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      %1621 = func.call @stack_pop_pointer() : () -> i64
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @cc_cons(%1622, %1621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1623) : (i64) -> ()
      %1624 = func.call @stack_pop_pointer() : () -> i64
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = func.call @cc_cons(%1625, %1624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1626) : (i64) -> ()
      %1627 = func.call @stack_pop_pointer() : () -> i64
      %1628 = func.call @stack_pop_pointer() : () -> i64
      %1629 = func.call @cc_cons(%1628, %1627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1630 = func.call @stack_pop_pointer() : () -> i64
      %1631 = func.call @stack_pop_pointer() : () -> i64
      %1632 = func.call @cc_cons(%1631, %1630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1632) : (i64) -> ()
      %1633 = func.call @stack_pop_pointer() : () -> i64
      %1634 = func.call @stack_pop_pointer() : () -> i64
      %1635 = func.call @cc_cons(%1634, %1633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      %1636 = func.call @stack_pop_pointer() : () -> i64
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = func.call @cc_cons(%1637, %1636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      %1639 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1640 = arith.constant 5 : i64
      %1641 = func.call @cc_make_string(%1639, %1640) : (!llvm.ptr, i64) -> i64
      %1642 = func.call @cc_nil_value() : () -> i64
      %1643 = func.call @cc_intern(%1641, %1642) : (i64, i64) -> i64
      %1644 = func.call @cc_nil_value() : () -> i64
      %1645 = func.call @cc_cons(%1643, %1644) : (i64, i64) -> i64
      %1646 = func.call @cc_values_pack(%1645) : (i64) -> i64
      func.call @stack_push_pointer(%1643) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1647 = func.call @stack_pop_pointer() : () -> i64
      %1648 = func.call @stack_pop_pointer() : () -> i64
      %1649 = func.call @cc_cons(%1648, %1647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1649) : (i64) -> ()
      %1650 = func.call @stack_pop_pointer() : () -> i64
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @cc_cons(%1651, %1650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1652) : (i64) -> ()
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1655 = func.call @cc_cons(%1654, %1653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1655) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1656 = func.call @stack_pop_pointer() : () -> i64
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @cc_cons(%1657, %1656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1658) : (i64) -> ()
      %1659 = func.call @stack_pop_pointer() : () -> i64
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @cc_cons(%1660, %1659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1661) : (i64) -> ()
      %1662 = func.call @stack_pop_pointer() : () -> i64
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @cc_cons(%1663, %1662) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1664) : (i64) -> ()
      %1665 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1666 = arith.constant 11 : i64
      %1667 = func.call @cc_make_string(%1665, %1666) : (!llvm.ptr, i64) -> i64
      %1668 = func.call @cc_nil_value() : () -> i64
      %1669 = func.call @cc_intern(%1667, %1668) : (i64, i64) -> i64
      %1670 = func.call @cc_nil_value() : () -> i64
      %1671 = func.call @cc_cons(%1669, %1670) : (i64, i64) -> i64
      %1672 = func.call @cc_values_pack(%1671) : (i64) -> i64
      func.call @stack_push_pointer(%1669) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1673 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1674 = arith.constant 5 : i64
      %1675 = func.call @cc_make_string(%1673, %1674) : (!llvm.ptr, i64) -> i64
      %1676 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1677 = arith.constant 11 : i64
      %1678 = func.call @cc_make_string(%1676, %1677) : (!llvm.ptr, i64) -> i64
      %1679 = func.call @cc_intern(%1675, %1678) : (i64, i64) -> i64
      %1680 = func.call @cc_nil_value() : () -> i64
      %1681 = func.call @cc_cons(%1679, %1680) : (i64, i64) -> i64
      %1682 = func.call @cc_values_pack(%1681) : (i64) -> i64
      func.call @stack_push_pointer(%1679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @stack_pop_pointer() : () -> i64
      %1685 = func.call @cc_cons(%1684, %1683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @cc_cons(%1687, %1686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1688) : (i64) -> ()
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @cc_cons(%1690, %1689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1691) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = func.call @stack_pop_pointer() : () -> i64
      %1694 = func.call @cc_cons(%1693, %1692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1694) : (i64) -> ()
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @stack_pop_pointer() : () -> i64
      %1697 = func.call @cc_cons(%1696, %1695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1697) : (i64) -> ()
      %1698 = func.call @stack_pop_pointer() : () -> i64
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @cc_cons(%1699, %1698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      %1701 = func.call @stack_pop_pointer() : () -> i64
      %1702 = func.call @stack_pop_pointer() : () -> i64
      %1703 = func.call @cc_cons(%1702, %1701) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1703) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1704 = func.call @stack_pop_pointer() : () -> i64
      %1705 = func.call @stack_pop_pointer() : () -> i64
      %1706 = func.call @cc_cons(%1705, %1704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      %1707 = func.call @stack_pop_pointer() : () -> i64
      %1708 = func.call @stack_pop_pointer() : () -> i64
      %1709 = func.call @cc_cons(%1708, %1707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1709) : (i64) -> ()
      %1710 = func.call @stack_pop_pointer() : () -> i64
      %1711 = func.call @stack_pop_pointer() : () -> i64
      %1712 = func.call @cc_cons(%1711, %1710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1712) : (i64) -> ()
      %1713 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1713) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1714 = func.call @stack_pop_pointer() : () -> i64
      %1715 = func.call @stack_pop_pointer() : () -> i64
      %1716 = func.call @cc_cons(%1715, %1714) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1716) : (i64) -> ()
      %1717 = func.call @stack_pop_pointer() : () -> i64
      %1718 = func.call @stack_pop_pointer() : () -> i64
      %1719 = func.call @cc_cons(%1718, %1717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1719) : (i64) -> ()
      %1720 = func.call @stack_pop_pointer() : () -> i64
      %1721 = func.call @stack_pop_pointer() : () -> i64
      %1722 = func.call @cc_cons(%1721, %1720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1722) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1723 = func.call @stack_pop_pointer() : () -> i64
      %1724 = func.call @stack_pop_pointer() : () -> i64
      %1725 = func.call @cc_cons(%1724, %1723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1725) : (i64) -> ()
      %1726 = func.call @stack_pop_pointer() : () -> i64
      %1727 = func.call @stack_pop_pointer() : () -> i64
      %1728 = func.call @cc_cons(%1727, %1726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1728) : (i64) -> ()
      %1729 = func.call @stack_pop_pointer() : () -> i64
      %1730 = func.call @stack_pop_pointer() : () -> i64
      %1731 = func.call @cc_cons(%1730, %1729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      %1732 = func.call @stack_pop_pointer() : () -> i64
      %1976 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1977 = arith.constant 33 : i64
      %1978 = func.call @cc_make_symbol(%1976, %1977) : (!llvm.ptr, i64) -> i64
      %1979 = func.call @cc_persistent_root_value(%1978) : (i64) -> i64
      func.call @stack_push_pointer(%1979) : (i64) -> ()
      %1980 = arith.constant 97047688511501 : i64
      %1981 = arith.constant 1 : i64
      %1982 = func.call @cc_make_closure(%1980, %1981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1982) : (i64) -> ()
      %1983 = func.call @stack_pop_pointer() : () -> i64
      %1984 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1984) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1985 = func.call @stack_pop_pointer() : () -> i64
      %1986 = func.call @stack_pop_pointer() : () -> i64
      %1987 = func.call @cc_cons(%1986, %1985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1987) : (i64) -> ()
      %1988 = func.call @stack_pop_pointer() : () -> i64
      %1989 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1990 = arith.constant 11 : i64
      %1991 = func.call @cc_make_string(%1989, %1990) : (!llvm.ptr, i64) -> i64
      %1992 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1993 = arith.constant 7 : i64
      %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
      %1995 = func.call @cc_intern(%1991, %1994) : (i64, i64) -> i64
      %1996 = func.call @cc_nil_value() : () -> i64
      %1997 = func.call @cc_cons(%1995, %1996) : (i64, i64) -> i64
      %1998 = func.call @cc_values_pack(%1997) : (i64) -> i64
      func.call @stack_push_pointer(%1995) : (i64) -> ()
      %1999 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2000 = func.call @stack_pop_pointer() : () -> i64
      %2001 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2002 = arith.constant 4 : i64
      %2003 = func.call @cc_make_string(%2001, %2002) : (!llvm.ptr, i64) -> i64
      %2004 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2005 = arith.constant 7 : i64
      %2006 = func.call @cc_make_string(%2004, %2005) : (!llvm.ptr, i64) -> i64
      %2007 = func.call @cc_intern(%2003, %2006) : (i64, i64) -> i64
      %2008 = func.call @cc_nil_value() : () -> i64
      %2009 = func.call @cc_cons(%2007, %2008) : (i64, i64) -> i64
      %2010 = func.call @cc_values_pack(%2009) : (i64) -> i64
      func.call @stack_push_pointer(%2007) : (i64) -> ()
      %2011 = func.call @stack_pop_pointer() : () -> i64
      %2012 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2013 = arith.constant 6 : i64
      %2014 = func.call @cc_make_string(%2012, %2013) : (!llvm.ptr, i64) -> i64
      %2015 = func.call @cc_nil_value() : () -> i64
      %2016 = func.call @cc_intern(%2014, %2015) : (i64, i64) -> i64
      %2017 = func.call @cc_nil_value() : () -> i64
      %2018 = func.call @cc_cons(%2016, %2017) : (i64, i64) -> i64
      %2019 = func.call @cc_values_pack(%2018) : (i64) -> i64
      func.call @stack_push_pointer(%2016) : (i64) -> ()
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2021 = func.call @cc_nil_value() : () -> i64
      %2022 = func.call @cc_errorp(%1403) : (i64) -> i64
      %2023 = arith.cmpi ne, %2022, %2021 : i64
      %2024 = arith.cmpi eq, %2021, %2021 : i64
      %2025 = arith.andi %2023, %2024 : i1
      %2026 = scf.if %2025 -> (i64) {
        scf.yield %1403 : i64
      } else {
        scf.yield %2021 : i64
      }
      %2027 = func.call @cc_errorp(%1732) : (i64) -> i64
      %2028 = arith.cmpi ne, %2027, %2021 : i64
      %2029 = arith.cmpi eq, %2026, %2021 : i64
      %2030 = arith.andi %2028, %2029 : i1
      %2031 = scf.if %2030 -> (i64) {
        scf.yield %1732 : i64
      } else {
        scf.yield %2026 : i64
      }
      %2032 = func.call @cc_errorp(%1983) : (i64) -> i64
      %2033 = arith.cmpi ne, %2032, %2021 : i64
      %2034 = arith.cmpi eq, %2031, %2021 : i64
      %2035 = arith.andi %2033, %2034 : i1
      %2036 = scf.if %2035 -> (i64) {
        scf.yield %1983 : i64
      } else {
        scf.yield %2031 : i64
      }
      %2037 = func.call @cc_errorp(%1988) : (i64) -> i64
      %2038 = arith.cmpi ne, %2037, %2021 : i64
      %2039 = arith.cmpi eq, %2036, %2021 : i64
      %2040 = arith.andi %2038, %2039 : i1
      %2041 = scf.if %2040 -> (i64) {
        scf.yield %1988 : i64
      } else {
        scf.yield %2036 : i64
      }
      %2042 = func.call @cc_errorp(%1999) : (i64) -> i64
      %2043 = arith.cmpi ne, %2042, %2021 : i64
      %2044 = arith.cmpi eq, %2041, %2021 : i64
      %2045 = arith.andi %2043, %2044 : i1
      %2046 = scf.if %2045 -> (i64) {
        scf.yield %1999 : i64
      } else {
        scf.yield %2041 : i64
      }
      %2047 = func.call @cc_errorp(%2000) : (i64) -> i64
      %2048 = arith.cmpi ne, %2047, %2021 : i64
      %2049 = arith.cmpi eq, %2046, %2021 : i64
      %2050 = arith.andi %2048, %2049 : i1
      %2051 = scf.if %2050 -> (i64) {
        scf.yield %2000 : i64
      } else {
        scf.yield %2046 : i64
      }
      %2052 = func.call @cc_errorp(%2011) : (i64) -> i64
      %2053 = arith.cmpi ne, %2052, %2021 : i64
      %2054 = arith.cmpi eq, %2051, %2021 : i64
      %2055 = arith.andi %2053, %2054 : i1
      %2056 = scf.if %2055 -> (i64) {
        scf.yield %2011 : i64
      } else {
        scf.yield %2051 : i64
      }
      %2057 = func.call @cc_errorp(%2020) : (i64) -> i64
      %2058 = arith.cmpi ne, %2057, %2021 : i64
      %2059 = arith.cmpi eq, %2056, %2021 : i64
      %2060 = arith.andi %2058, %2059 : i1
      %2061 = scf.if %2060 -> (i64) {
        scf.yield %2020 : i64
      } else {
        scf.yield %2056 : i64
      }
      %2062 = arith.cmpi ne, %2061, %2021 : i64
      scf.if %2062 {
        func.call @stack_push_pointer(%2061) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1403) : (i64) -> ()
        func.call @stack_push_pointer(%1732) : (i64) -> ()
        func.call @stack_push_pointer(%1983) : (i64) -> ()
        func.call @stack_push_pointer(%1988) : (i64) -> ()
        func.call @stack_push_pointer(%1999) : (i64) -> ()
        func.call @stack_push_pointer(%2000) : (i64) -> ()
        func.call @stack_push_pointer(%2011) : (i64) -> ()
        func.call @stack_push_pointer(%2020) : (i64) -> ()
        %2063 = llvm.mlir.addressof @str176 : !llvm.ptr
        %2064 = func.call @cc_make_function_ref_const(%2063) : (!llvm.ptr) -> i64
        %2065 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2064, %2065) : (i64, i64) -> ()
      }
      %2066 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2066 : i64
    }
    %2067 = func.call @cc_nil_value() : () -> i64
    %2068 = func.call @cc_errorp(%1394) : (i64) -> i64
    %2069 = arith.cmpi ne, %2068, %2067 : i64
    %2070 = scf.if %2069 -> (i64) {
      scf.yield %1394 : i64
    } else {
      %2071 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2072 = arith.constant 11 : i64
      %2073 = func.call @cc_make_string(%2071, %2072) : (!llvm.ptr, i64) -> i64
      %2074 = func.call @cc_nil_value() : () -> i64
      %2075 = func.call @cc_intern(%2073, %2074) : (i64, i64) -> i64
      %2076 = func.call @cc_nil_value() : () -> i64
      %2077 = func.call @cc_cons(%2075, %2076) : (i64, i64) -> i64
      %2078 = func.call @cc_values_pack(%2077) : (i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2079 = func.call @stack_pop_pointer() : () -> i64
      %2080 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2081 = arith.constant 5 : i64
      %2082 = func.call @cc_make_string(%2080, %2081) : (!llvm.ptr, i64) -> i64
      %2083 = func.call @cc_nil_value() : () -> i64
      %2084 = func.call @cc_intern(%2082, %2083) : (i64, i64) -> i64
      %2085 = func.call @cc_nil_value() : () -> i64
      %2086 = func.call @cc_cons(%2084, %2085) : (i64, i64) -> i64
      %2087 = func.call @cc_values_pack(%2086) : (i64) -> i64
      func.call @stack_push_pointer(%2084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2088 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2089 = arith.constant 11 : i64
      %2090 = func.call @cc_make_string(%2088, %2089) : (!llvm.ptr, i64) -> i64
      %2091 = func.call @cc_nil_value() : () -> i64
      %2092 = func.call @cc_intern(%2090, %2091) : (i64, i64) -> i64
      %2093 = func.call @cc_nil_value() : () -> i64
      %2094 = func.call @cc_cons(%2092, %2093) : (i64, i64) -> i64
      %2095 = func.call @cc_values_pack(%2094) : (i64) -> i64
      func.call @stack_push_pointer(%2092) : (i64) -> ()
      %2096 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2097 = arith.constant 6 : i64
      %2098 = func.call @cc_make_string(%2096, %2097) : (!llvm.ptr, i64) -> i64
      %2099 = func.call @cc_nil_value() : () -> i64
      %2100 = func.call @cc_intern(%2098, %2099) : (i64, i64) -> i64
      %2101 = func.call @cc_nil_value() : () -> i64
      %2102 = func.call @cc_cons(%2100, %2101) : (i64, i64) -> i64
      %2103 = func.call @cc_values_pack(%2102) : (i64) -> i64
      func.call @stack_push_pointer(%2100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2104 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2105 = arith.constant 3 : i64
      %2106 = func.call @cc_make_string(%2104, %2105) : (!llvm.ptr, i64) -> i64
      %2107 = func.call @cc_nil_value() : () -> i64
      %2108 = func.call @cc_intern(%2106, %2107) : (i64, i64) -> i64
      %2109 = func.call @cc_nil_value() : () -> i64
      %2110 = func.call @cc_cons(%2108, %2109) : (i64, i64) -> i64
      %2111 = func.call @cc_values_pack(%2110) : (i64) -> i64
      func.call @stack_push_pointer(%2108) : (i64) -> ()
      %2112 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2113 = arith.constant 5 : i64
      %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
      %2115 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2116 = arith.constant 11 : i64
      %2117 = func.call @cc_make_string(%2115, %2116) : (!llvm.ptr, i64) -> i64
      %2118 = func.call @cc_intern(%2114, %2117) : (i64, i64) -> i64
      %2119 = func.call @cc_nil_value() : () -> i64
      %2120 = func.call @cc_cons(%2118, %2119) : (i64, i64) -> i64
      %2121 = func.call @cc_values_pack(%2120) : (i64) -> i64
      func.call @stack_push_pointer(%2118) : (i64) -> ()
      %2122 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2123 = func.call @stack_pop_pointer() : () -> i64
      %2124 = func.call @stack_pop_pointer() : () -> i64
      %2125 = func.call @cc_cons(%2124, %2123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2125) : (i64) -> ()
      %2126 = func.call @stack_pop_pointer() : () -> i64
      %2127 = func.call @stack_pop_pointer() : () -> i64
      %2128 = func.call @cc_cons(%2127, %2126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2129 = func.call @stack_pop_pointer() : () -> i64
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_cons(%2130, %2129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2131) : (i64) -> ()
      %2132 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2133 = arith.constant 10 : i64
      %2134 = func.call @cc_make_string(%2132, %2133) : (!llvm.ptr, i64) -> i64
      %2135 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2136 = arith.constant 11 : i64
      %2137 = func.call @cc_make_string(%2135, %2136) : (!llvm.ptr, i64) -> i64
      %2138 = func.call @cc_intern(%2134, %2137) : (i64, i64) -> i64
      %2139 = func.call @cc_nil_value() : () -> i64
      %2140 = func.call @cc_cons(%2138, %2139) : (i64, i64) -> i64
      %2141 = func.call @cc_values_pack(%2140) : (i64) -> i64
      func.call @stack_push_pointer(%2138) : (i64) -> ()
      %2142 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2143 = arith.constant 5 : i64
      %2144 = func.call @cc_make_string(%2142, %2143) : (!llvm.ptr, i64) -> i64
      %2145 = func.call @cc_nil_value() : () -> i64
      %2146 = func.call @cc_intern(%2144, %2145) : (i64, i64) -> i64
      %2147 = func.call @cc_nil_value() : () -> i64
      %2148 = func.call @cc_cons(%2146, %2147) : (i64, i64) -> i64
      %2149 = func.call @cc_values_pack(%2148) : (i64) -> i64
      func.call @stack_push_pointer(%2146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2150 = func.call @stack_pop_pointer() : () -> i64
      %2151 = func.call @stack_pop_pointer() : () -> i64
      %2152 = func.call @cc_cons(%2151, %2150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2152) : (i64) -> ()
      %2153 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2154 = arith.constant 9 : i64
      %2155 = func.call @cc_make_string(%2153, %2154) : (!llvm.ptr, i64) -> i64
      %2156 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2157 = arith.constant 11 : i64
      %2158 = func.call @cc_make_string(%2156, %2157) : (!llvm.ptr, i64) -> i64
      %2159 = func.call @cc_intern(%2155, %2158) : (i64, i64) -> i64
      %2160 = func.call @cc_nil_value() : () -> i64
      %2161 = func.call @cc_cons(%2159, %2160) : (i64, i64) -> i64
      %2162 = func.call @cc_values_pack(%2161) : (i64) -> i64
      func.call @stack_push_pointer(%2159) : (i64) -> ()
      %2163 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2164 = arith.constant 6 : i64
      %2165 = func.call @cc_make_string(%2163, %2164) : (!llvm.ptr, i64) -> i64
      %2166 = func.call @cc_nil_value() : () -> i64
      %2167 = func.call @cc_intern(%2165, %2166) : (i64, i64) -> i64
      %2168 = func.call @cc_nil_value() : () -> i64
      %2169 = func.call @cc_cons(%2167, %2168) : (i64, i64) -> i64
      %2170 = func.call @cc_values_pack(%2169) : (i64) -> i64
      func.call @stack_push_pointer(%2167) : (i64) -> ()
      %2171 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2172 = arith.constant 5 : i64
      %2173 = func.call @cc_make_string(%2171, %2172) : (!llvm.ptr, i64) -> i64
      %2174 = func.call @cc_nil_value() : () -> i64
      %2175 = func.call @cc_intern(%2173, %2174) : (i64, i64) -> i64
      %2176 = func.call @cc_nil_value() : () -> i64
      %2177 = func.call @cc_cons(%2175, %2176) : (i64, i64) -> i64
      %2178 = func.call @cc_values_pack(%2177) : (i64) -> i64
      func.call @stack_push_pointer(%2175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2179 = func.call @stack_pop_pointer() : () -> i64
      %2180 = func.call @stack_pop_pointer() : () -> i64
      %2181 = func.call @cc_cons(%2180, %2179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2181) : (i64) -> ()
      %2182 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2183 = arith.constant 7 : i64
      %2184 = func.call @cc_make_string(%2182, %2183) : (!llvm.ptr, i64) -> i64
      %2185 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2186 = arith.constant 11 : i64
      %2187 = func.call @cc_make_string(%2185, %2186) : (!llvm.ptr, i64) -> i64
      %2188 = func.call @cc_intern(%2184, %2187) : (i64, i64) -> i64
      %2189 = func.call @cc_nil_value() : () -> i64
      %2190 = func.call @cc_cons(%2188, %2189) : (i64, i64) -> i64
      %2191 = func.call @cc_values_pack(%2190) : (i64) -> i64
      func.call @stack_push_pointer(%2188) : (i64) -> ()
      %2192 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2193 = arith.constant 6 : i64
      %2194 = func.call @cc_make_string(%2192, %2193) : (!llvm.ptr, i64) -> i64
      %2195 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2196 = arith.constant 11 : i64
      %2197 = func.call @cc_make_string(%2195, %2196) : (!llvm.ptr, i64) -> i64
      %2198 = func.call @cc_intern(%2194, %2197) : (i64, i64) -> i64
      %2199 = func.call @cc_nil_value() : () -> i64
      %2200 = func.call @cc_cons(%2198, %2199) : (i64, i64) -> i64
      %2201 = func.call @cc_values_pack(%2200) : (i64) -> i64
      func.call @stack_push_pointer(%2198) : (i64) -> ()
      %2202 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2203 = arith.constant 5 : i64
      %2204 = func.call @cc_make_string(%2202, %2203) : (!llvm.ptr, i64) -> i64
      %2205 = func.call @cc_nil_value() : () -> i64
      %2206 = func.call @cc_intern(%2204, %2205) : (i64, i64) -> i64
      %2207 = func.call @cc_nil_value() : () -> i64
      %2208 = func.call @cc_cons(%2206, %2207) : (i64, i64) -> i64
      %2209 = func.call @cc_values_pack(%2208) : (i64) -> i64
      func.call @stack_push_pointer(%2206) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2210 = func.call @stack_pop_pointer() : () -> i64
      %2211 = func.call @stack_pop_pointer() : () -> i64
      %2212 = func.call @cc_cons(%2211, %2210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2212) : (i64) -> ()
      %2213 = func.call @stack_pop_pointer() : () -> i64
      %2214 = func.call @stack_pop_pointer() : () -> i64
      %2215 = func.call @cc_cons(%2214, %2213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2216 = func.call @stack_pop_pointer() : () -> i64
      %2217 = func.call @stack_pop_pointer() : () -> i64
      %2218 = func.call @cc_cons(%2217, %2216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2218) : (i64) -> ()
      %2219 = func.call @stack_pop_pointer() : () -> i64
      %2220 = func.call @stack_pop_pointer() : () -> i64
      %2221 = func.call @cc_cons(%2220, %2219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2221) : (i64) -> ()
      %2222 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2223 = arith.constant 4 : i64
      %2224 = func.call @cc_make_string(%2222, %2223) : (!llvm.ptr, i64) -> i64
      %2225 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2226 = arith.constant 11 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = func.call @cc_intern(%2224, %2227) : (i64, i64) -> i64
      %2229 = func.call @cc_nil_value() : () -> i64
      %2230 = func.call @cc_cons(%2228, %2229) : (i64, i64) -> i64
      %2231 = func.call @cc_values_pack(%2230) : (i64) -> i64
      func.call @stack_push_pointer(%2228) : (i64) -> ()
      %2232 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2233 = arith.constant 5 : i64
      %2234 = func.call @cc_make_string(%2232, %2233) : (!llvm.ptr, i64) -> i64
      %2235 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2236 = arith.constant 11 : i64
      %2237 = func.call @cc_make_string(%2235, %2236) : (!llvm.ptr, i64) -> i64
      %2238 = func.call @cc_intern(%2234, %2237) : (i64, i64) -> i64
      %2239 = func.call @cc_nil_value() : () -> i64
      %2240 = func.call @cc_cons(%2238, %2239) : (i64, i64) -> i64
      %2241 = func.call @cc_values_pack(%2240) : (i64) -> i64
      func.call @stack_push_pointer(%2238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2242 = func.call @stack_pop_pointer() : () -> i64
      %2243 = func.call @stack_pop_pointer() : () -> i64
      %2244 = func.call @cc_cons(%2243, %2242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2244) : (i64) -> ()
      %2245 = func.call @stack_pop_pointer() : () -> i64
      %2246 = func.call @stack_pop_pointer() : () -> i64
      %2247 = func.call @cc_cons(%2246, %2245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2247) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2248 = func.call @stack_pop_pointer() : () -> i64
      %2249 = func.call @stack_pop_pointer() : () -> i64
      %2250 = func.call @cc_cons(%2249, %2248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2250) : (i64) -> ()
      %2251 = func.call @stack_pop_pointer() : () -> i64
      %2252 = func.call @stack_pop_pointer() : () -> i64
      %2253 = func.call @cc_cons(%2252, %2251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2253) : (i64) -> ()
      %2254 = func.call @stack_pop_pointer() : () -> i64
      %2255 = func.call @stack_pop_pointer() : () -> i64
      %2256 = func.call @cc_cons(%2255, %2254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2256) : (i64) -> ()
      %2257 = func.call @stack_pop_pointer() : () -> i64
      %2258 = func.call @stack_pop_pointer() : () -> i64
      %2259 = func.call @cc_cons(%2258, %2257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2259) : (i64) -> ()
      %2260 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2261 = arith.constant 5 : i64
      %2262 = func.call @cc_make_string(%2260, %2261) : (!llvm.ptr, i64) -> i64
      %2263 = func.call @cc_nil_value() : () -> i64
      %2264 = func.call @cc_intern(%2262, %2263) : (i64, i64) -> i64
      %2265 = func.call @cc_nil_value() : () -> i64
      %2266 = func.call @cc_cons(%2264, %2265) : (i64, i64) -> i64
      %2267 = func.call @cc_values_pack(%2266) : (i64) -> i64
      func.call @stack_push_pointer(%2264) : (i64) -> ()
      %2268 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2269 = arith.constant 5 : i64
      %2270 = func.call @cc_make_string(%2268, %2269) : (!llvm.ptr, i64) -> i64
      %2271 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2272 = arith.constant 7 : i64
      %2273 = func.call @cc_make_string(%2271, %2272) : (!llvm.ptr, i64) -> i64
      %2274 = func.call @cc_intern(%2270, %2273) : (i64, i64) -> i64
      %2275 = func.call @cc_nil_value() : () -> i64
      %2276 = func.call @cc_cons(%2274, %2275) : (i64, i64) -> i64
      %2277 = func.call @cc_values_pack(%2276) : (i64) -> i64
      func.call @stack_push_pointer(%2274) : (i64) -> ()
      %2278 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2279 = func.call @stack_pop_pointer() : () -> i64
      %2280 = func.call @stack_pop_pointer() : () -> i64
      %2281 = func.call @cc_cons(%2280, %2279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2281) : (i64) -> ()
      %2282 = func.call @stack_pop_pointer() : () -> i64
      %2283 = func.call @stack_pop_pointer() : () -> i64
      %2284 = func.call @cc_cons(%2283, %2282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2284) : (i64) -> ()
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @stack_pop_pointer() : () -> i64
      %2287 = func.call @cc_cons(%2286, %2285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2287) : (i64) -> ()
      %2288 = func.call @stack_pop_pointer() : () -> i64
      %2289 = func.call @stack_pop_pointer() : () -> i64
      %2290 = func.call @cc_cons(%2289, %2288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2290) : (i64) -> ()
      %2291 = func.call @stack_pop_pointer() : () -> i64
      %2292 = func.call @stack_pop_pointer() : () -> i64
      %2293 = func.call @cc_cons(%2292, %2291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2293) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2294 = func.call @stack_pop_pointer() : () -> i64
      %2295 = func.call @stack_pop_pointer() : () -> i64
      %2296 = func.call @cc_cons(%2295, %2294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2296) : (i64) -> ()
      %2297 = func.call @stack_pop_pointer() : () -> i64
      %2298 = func.call @stack_pop_pointer() : () -> i64
      %2299 = func.call @cc_cons(%2298, %2297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2299) : (i64) -> ()
      %2300 = func.call @stack_pop_pointer() : () -> i64
      %2301 = func.call @stack_pop_pointer() : () -> i64
      %2302 = func.call @cc_cons(%2301, %2300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2302) : (i64) -> ()
      %2303 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2304 = arith.constant 11 : i64
      %2305 = func.call @cc_make_string(%2303, %2304) : (!llvm.ptr, i64) -> i64
      %2306 = func.call @cc_nil_value() : () -> i64
      %2307 = func.call @cc_intern(%2305, %2306) : (i64, i64) -> i64
      %2308 = func.call @cc_nil_value() : () -> i64
      %2309 = func.call @cc_cons(%2307, %2308) : (i64, i64) -> i64
      %2310 = func.call @cc_values_pack(%2309) : (i64) -> i64
      func.call @stack_push_pointer(%2307) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2311 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2312 = arith.constant 5 : i64
      %2313 = func.call @cc_make_string(%2311, %2312) : (!llvm.ptr, i64) -> i64
      %2314 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2315 = arith.constant 11 : i64
      %2316 = func.call @cc_make_string(%2314, %2315) : (!llvm.ptr, i64) -> i64
      %2317 = func.call @cc_intern(%2313, %2316) : (i64, i64) -> i64
      %2318 = func.call @cc_nil_value() : () -> i64
      %2319 = func.call @cc_cons(%2317, %2318) : (i64, i64) -> i64
      %2320 = func.call @cc_values_pack(%2319) : (i64) -> i64
      func.call @stack_push_pointer(%2317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @stack_pop_pointer() : () -> i64
      %2323 = func.call @cc_cons(%2322, %2321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2323) : (i64) -> ()
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = func.call @stack_pop_pointer() : () -> i64
      %2326 = func.call @cc_cons(%2325, %2324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2326) : (i64) -> ()
      %2327 = func.call @stack_pop_pointer() : () -> i64
      %2328 = func.call @stack_pop_pointer() : () -> i64
      %2329 = func.call @cc_cons(%2328, %2327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2329) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2330 = func.call @stack_pop_pointer() : () -> i64
      %2331 = func.call @stack_pop_pointer() : () -> i64
      %2332 = func.call @cc_cons(%2331, %2330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2332) : (i64) -> ()
      %2333 = func.call @stack_pop_pointer() : () -> i64
      %2334 = func.call @stack_pop_pointer() : () -> i64
      %2335 = func.call @cc_cons(%2334, %2333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2335) : (i64) -> ()
      %2336 = func.call @stack_pop_pointer() : () -> i64
      %2337 = func.call @stack_pop_pointer() : () -> i64
      %2338 = func.call @cc_cons(%2337, %2336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2338) : (i64) -> ()
      %2339 = func.call @stack_pop_pointer() : () -> i64
      %2340 = func.call @stack_pop_pointer() : () -> i64
      %2341 = func.call @cc_cons(%2340, %2339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2342 = func.call @stack_pop_pointer() : () -> i64
      %2343 = func.call @stack_pop_pointer() : () -> i64
      %2344 = func.call @cc_cons(%2343, %2342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2344) : (i64) -> ()
      %2345 = func.call @stack_pop_pointer() : () -> i64
      %2346 = func.call @stack_pop_pointer() : () -> i64
      %2347 = func.call @cc_cons(%2346, %2345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2347) : (i64) -> ()
      %2348 = func.call @stack_pop_pointer() : () -> i64
      %2349 = func.call @stack_pop_pointer() : () -> i64
      %2350 = func.call @cc_cons(%2349, %2348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2350) : (i64) -> ()
      %2351 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%2351) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2352 = func.call @stack_pop_pointer() : () -> i64
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @cc_cons(%2353, %2352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      %2355 = func.call @stack_pop_pointer() : () -> i64
      %2356 = func.call @stack_pop_pointer() : () -> i64
      %2357 = func.call @cc_cons(%2356, %2355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2357) : (i64) -> ()
      %2358 = func.call @stack_pop_pointer() : () -> i64
      %2359 = func.call @stack_pop_pointer() : () -> i64
      %2360 = func.call @cc_cons(%2359, %2358) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2360) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2361 = func.call @stack_pop_pointer() : () -> i64
      %2362 = func.call @stack_pop_pointer() : () -> i64
      %2363 = func.call @cc_cons(%2362, %2361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2363) : (i64) -> ()
      %2364 = func.call @stack_pop_pointer() : () -> i64
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @cc_cons(%2365, %2364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2366) : (i64) -> ()
      %2367 = func.call @stack_pop_pointer() : () -> i64
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @cc_cons(%2368, %2367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2369) : (i64) -> ()
      %2370 = func.call @stack_pop_pointer() : () -> i64
      %2611 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2612 = arith.constant 33 : i64
      %2613 = func.call @cc_make_symbol(%2611, %2612) : (!llvm.ptr, i64) -> i64
      %2614 = func.call @cc_persistent_root_value(%2613) : (i64) -> i64
      func.call @stack_push_pointer(%2614) : (i64) -> ()
      %2615 = arith.constant 97047688511507 : i64
      %2616 = arith.constant 1 : i64
      %2617 = func.call @cc_make_closure(%2615, %2616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2617) : (i64) -> ()
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2619) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2620 = func.call @stack_pop_pointer() : () -> i64
      %2621 = func.call @stack_pop_pointer() : () -> i64
      %2622 = func.call @cc_cons(%2621, %2620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2622) : (i64) -> ()
      %2623 = func.call @stack_pop_pointer() : () -> i64
      %2624 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2625 = arith.constant 11 : i64
      %2626 = func.call @cc_make_string(%2624, %2625) : (!llvm.ptr, i64) -> i64
      %2627 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2628 = arith.constant 7 : i64
      %2629 = func.call @cc_make_string(%2627, %2628) : (!llvm.ptr, i64) -> i64
      %2630 = func.call @cc_intern(%2626, %2629) : (i64, i64) -> i64
      %2631 = func.call @cc_nil_value() : () -> i64
      %2632 = func.call @cc_cons(%2630, %2631) : (i64, i64) -> i64
      %2633 = func.call @cc_values_pack(%2632) : (i64) -> i64
      func.call @stack_push_pointer(%2630) : (i64) -> ()
      %2634 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2637 = arith.constant 4 : i64
      %2638 = func.call @cc_make_string(%2636, %2637) : (!llvm.ptr, i64) -> i64
      %2639 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2640 = arith.constant 7 : i64
      %2641 = func.call @cc_make_string(%2639, %2640) : (!llvm.ptr, i64) -> i64
      %2642 = func.call @cc_intern(%2638, %2641) : (i64, i64) -> i64
      %2643 = func.call @cc_nil_value() : () -> i64
      %2644 = func.call @cc_cons(%2642, %2643) : (i64, i64) -> i64
      %2645 = func.call @cc_values_pack(%2644) : (i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      %2646 = func.call @stack_pop_pointer() : () -> i64
      %2647 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2648 = arith.constant 6 : i64
      %2649 = func.call @cc_make_string(%2647, %2648) : (!llvm.ptr, i64) -> i64
      %2650 = func.call @cc_nil_value() : () -> i64
      %2651 = func.call @cc_intern(%2649, %2650) : (i64, i64) -> i64
      %2652 = func.call @cc_nil_value() : () -> i64
      %2653 = func.call @cc_cons(%2651, %2652) : (i64, i64) -> i64
      %2654 = func.call @cc_values_pack(%2653) : (i64) -> i64
      func.call @stack_push_pointer(%2651) : (i64) -> ()
      %2655 = func.call @stack_pop_pointer() : () -> i64
      %2656 = func.call @cc_nil_value() : () -> i64
      %2657 = func.call @cc_errorp(%2079) : (i64) -> i64
      %2658 = arith.cmpi ne, %2657, %2656 : i64
      %2659 = arith.cmpi eq, %2656, %2656 : i64
      %2660 = arith.andi %2658, %2659 : i1
      %2661 = scf.if %2660 -> (i64) {
        scf.yield %2079 : i64
      } else {
        scf.yield %2656 : i64
      }
      %2662 = func.call @cc_errorp(%2370) : (i64) -> i64
      %2663 = arith.cmpi ne, %2662, %2656 : i64
      %2664 = arith.cmpi eq, %2661, %2656 : i64
      %2665 = arith.andi %2663, %2664 : i1
      %2666 = scf.if %2665 -> (i64) {
        scf.yield %2370 : i64
      } else {
        scf.yield %2661 : i64
      }
      %2667 = func.call @cc_errorp(%2618) : (i64) -> i64
      %2668 = arith.cmpi ne, %2667, %2656 : i64
      %2669 = arith.cmpi eq, %2666, %2656 : i64
      %2670 = arith.andi %2668, %2669 : i1
      %2671 = scf.if %2670 -> (i64) {
        scf.yield %2618 : i64
      } else {
        scf.yield %2666 : i64
      }
      %2672 = func.call @cc_errorp(%2623) : (i64) -> i64
      %2673 = arith.cmpi ne, %2672, %2656 : i64
      %2674 = arith.cmpi eq, %2671, %2656 : i64
      %2675 = arith.andi %2673, %2674 : i1
      %2676 = scf.if %2675 -> (i64) {
        scf.yield %2623 : i64
      } else {
        scf.yield %2671 : i64
      }
      %2677 = func.call @cc_errorp(%2634) : (i64) -> i64
      %2678 = arith.cmpi ne, %2677, %2656 : i64
      %2679 = arith.cmpi eq, %2676, %2656 : i64
      %2680 = arith.andi %2678, %2679 : i1
      %2681 = scf.if %2680 -> (i64) {
        scf.yield %2634 : i64
      } else {
        scf.yield %2676 : i64
      }
      %2682 = func.call @cc_errorp(%2635) : (i64) -> i64
      %2683 = arith.cmpi ne, %2682, %2656 : i64
      %2684 = arith.cmpi eq, %2681, %2656 : i64
      %2685 = arith.andi %2683, %2684 : i1
      %2686 = scf.if %2685 -> (i64) {
        scf.yield %2635 : i64
      } else {
        scf.yield %2681 : i64
      }
      %2687 = func.call @cc_errorp(%2646) : (i64) -> i64
      %2688 = arith.cmpi ne, %2687, %2656 : i64
      %2689 = arith.cmpi eq, %2686, %2656 : i64
      %2690 = arith.andi %2688, %2689 : i1
      %2691 = scf.if %2690 -> (i64) {
        scf.yield %2646 : i64
      } else {
        scf.yield %2686 : i64
      }
      %2692 = func.call @cc_errorp(%2655) : (i64) -> i64
      %2693 = arith.cmpi ne, %2692, %2656 : i64
      %2694 = arith.cmpi eq, %2691, %2656 : i64
      %2695 = arith.andi %2693, %2694 : i1
      %2696 = scf.if %2695 -> (i64) {
        scf.yield %2655 : i64
      } else {
        scf.yield %2691 : i64
      }
      %2697 = arith.cmpi ne, %2696, %2656 : i64
      scf.if %2697 {
        func.call @stack_push_pointer(%2696) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2079) : (i64) -> ()
        func.call @stack_push_pointer(%2370) : (i64) -> ()
        func.call @stack_push_pointer(%2618) : (i64) -> ()
        func.call @stack_push_pointer(%2623) : (i64) -> ()
        func.call @stack_push_pointer(%2634) : (i64) -> ()
        func.call @stack_push_pointer(%2635) : (i64) -> ()
        func.call @stack_push_pointer(%2646) : (i64) -> ()
        func.call @stack_push_pointer(%2655) : (i64) -> ()
        %2698 = llvm.mlir.addressof @str226 : !llvm.ptr
        %2699 = func.call @cc_make_function_ref_const(%2698) : (!llvm.ptr) -> i64
        %2700 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2699, %2700) : (i64, i64) -> ()
      }
      %2701 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2701 : i64
    }
    %2702 = func.call @cc_nil_value() : () -> i64
    %2703 = func.call @cc_errorp(%2070) : (i64) -> i64
    %2704 = arith.cmpi ne, %2703, %2702 : i64
    %2705 = scf.if %2704 -> (i64) {
      scf.yield %2070 : i64
    } else {
      %2706 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2707 = arith.constant 12 : i64
      %2708 = func.call @cc_make_string(%2706, %2707) : (!llvm.ptr, i64) -> i64
      %2709 = func.call @cc_nil_value() : () -> i64
      %2710 = func.call @cc_intern(%2708, %2709) : (i64, i64) -> i64
      %2711 = func.call @cc_nil_value() : () -> i64
      %2712 = func.call @cc_cons(%2710, %2711) : (i64, i64) -> i64
      %2713 = func.call @cc_values_pack(%2712) : (i64) -> i64
      func.call @stack_push_pointer(%2710) : (i64) -> ()
      %2714 = func.call @stack_pop_pointer() : () -> i64
      %2715 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2716 = arith.constant 5 : i64
      %2717 = func.call @cc_make_string(%2715, %2716) : (!llvm.ptr, i64) -> i64
      %2718 = func.call @cc_nil_value() : () -> i64
      %2719 = func.call @cc_intern(%2717, %2718) : (i64, i64) -> i64
      %2720 = func.call @cc_nil_value() : () -> i64
      %2721 = func.call @cc_cons(%2719, %2720) : (i64, i64) -> i64
      %2722 = func.call @cc_values_pack(%2721) : (i64) -> i64
      func.call @stack_push_pointer(%2719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2723 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2724 = arith.constant 5 : i64
      %2725 = func.call @cc_make_string(%2723, %2724) : (!llvm.ptr, i64) -> i64
      %2726 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2727 = arith.constant 11 : i64
      %2728 = func.call @cc_make_string(%2726, %2727) : (!llvm.ptr, i64) -> i64
      %2729 = func.call @cc_intern(%2725, %2728) : (i64, i64) -> i64
      %2730 = func.call @cc_nil_value() : () -> i64
      %2731 = func.call @cc_cons(%2729, %2730) : (i64, i64) -> i64
      %2732 = func.call @cc_values_pack(%2731) : (i64) -> i64
      func.call @stack_push_pointer(%2729) : (i64) -> ()
      %2733 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2734 = arith.constant 16 : i64
      %2735 = func.call @cc_make_string(%2733, %2734) : (!llvm.ptr, i64) -> i64
      %2736 = func.call @cc_nil_value() : () -> i64
      %2737 = func.call @cc_intern(%2735, %2736) : (i64, i64) -> i64
      %2738 = func.call @cc_nil_value() : () -> i64
      %2739 = func.call @cc_cons(%2737, %2738) : (i64, i64) -> i64
      %2740 = func.call @cc_values_pack(%2739) : (i64) -> i64
      func.call @stack_push_pointer(%2737) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2741 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2742 = arith.constant 13 : i64
      %2743 = func.call @cc_make_string(%2741, %2742) : (!llvm.ptr, i64) -> i64
      %2744 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2745 = arith.constant 11 : i64
      %2746 = func.call @cc_make_string(%2744, %2745) : (!llvm.ptr, i64) -> i64
      %2747 = func.call @cc_intern(%2743, %2746) : (i64, i64) -> i64
      %2748 = func.call @cc_nil_value() : () -> i64
      %2749 = func.call @cc_cons(%2747, %2748) : (i64, i64) -> i64
      %2750 = func.call @cc_values_pack(%2749) : (i64) -> i64
      func.call @stack_push_pointer(%2747) : (i64) -> ()
      %2751 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2752 = arith.constant 6 : i64
      %2753 = func.call @cc_make_string(%2751, %2752) : (!llvm.ptr, i64) -> i64
      %2754 = func.call @cc_nil_value() : () -> i64
      %2755 = func.call @cc_intern(%2753, %2754) : (i64, i64) -> i64
      %2756 = func.call @cc_nil_value() : () -> i64
      %2757 = func.call @cc_cons(%2755, %2756) : (i64, i64) -> i64
      %2758 = func.call @cc_values_pack(%2757) : (i64) -> i64
      func.call @stack_push_pointer(%2755) : (i64) -> ()
      %2759 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2760 = arith.constant 5 : i64
      %2761 = func.call @cc_make_string(%2759, %2760) : (!llvm.ptr, i64) -> i64
      %2762 = func.call @cc_nil_value() : () -> i64
      %2763 = func.call @cc_intern(%2761, %2762) : (i64, i64) -> i64
      %2764 = func.call @cc_nil_value() : () -> i64
      %2765 = func.call @cc_cons(%2763, %2764) : (i64, i64) -> i64
      %2766 = func.call @cc_values_pack(%2765) : (i64) -> i64
      func.call @stack_push_pointer(%2763) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2767 = func.call @stack_pop_pointer() : () -> i64
      %2768 = func.call @stack_pop_pointer() : () -> i64
      %2769 = func.call @cc_cons(%2768, %2767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2769) : (i64) -> ()
      %2770 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2771 = arith.constant 2 : i64
      %2772 = func.call @cc_make_string(%2770, %2771) : (!llvm.ptr, i64) -> i64
      %2773 = func.call @cc_nil_value() : () -> i64
      %2774 = func.call @cc_intern(%2772, %2773) : (i64, i64) -> i64
      %2775 = func.call @cc_nil_value() : () -> i64
      %2776 = func.call @cc_cons(%2774, %2775) : (i64, i64) -> i64
      %2777 = func.call @cc_values_pack(%2776) : (i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      %2778 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2779 = arith.constant 2 : i64
      %2780 = func.call @cc_make_string(%2778, %2779) : (!llvm.ptr, i64) -> i64
      %2781 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2782 = arith.constant 11 : i64
      %2783 = func.call @cc_make_string(%2781, %2782) : (!llvm.ptr, i64) -> i64
      %2784 = func.call @cc_intern(%2780, %2783) : (i64, i64) -> i64
      %2785 = func.call @cc_nil_value() : () -> i64
      %2786 = func.call @cc_cons(%2784, %2785) : (i64, i64) -> i64
      %2787 = func.call @cc_values_pack(%2786) : (i64) -> i64
      func.call @stack_push_pointer(%2784) : (i64) -> ()
      %2788 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2789 = arith.constant 19 : i64
      %2790 = func.call @cc_make_string(%2788, %2789) : (!llvm.ptr, i64) -> i64
      %2791 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2792 = arith.constant 11 : i64
      %2793 = func.call @cc_make_string(%2791, %2792) : (!llvm.ptr, i64) -> i64
      %2794 = func.call @cc_intern(%2790, %2793) : (i64, i64) -> i64
      %2795 = func.call @cc_nil_value() : () -> i64
      %2796 = func.call @cc_cons(%2794, %2795) : (i64, i64) -> i64
      %2797 = func.call @cc_values_pack(%2796) : (i64) -> i64
      func.call @stack_push_pointer(%2794) : (i64) -> ()
      %2798 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2799 = arith.constant 5 : i64
      %2800 = func.call @cc_make_string(%2798, %2799) : (!llvm.ptr, i64) -> i64
      %2801 = func.call @cc_nil_value() : () -> i64
      %2802 = func.call @cc_intern(%2800, %2801) : (i64, i64) -> i64
      %2803 = func.call @cc_nil_value() : () -> i64
      %2804 = func.call @cc_cons(%2802, %2803) : (i64, i64) -> i64
      %2805 = func.call @cc_values_pack(%2804) : (i64) -> i64
      func.call @stack_push_pointer(%2802) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2806 = func.call @stack_pop_pointer() : () -> i64
      %2807 = func.call @stack_pop_pointer() : () -> i64
      %2808 = func.call @cc_cons(%2807, %2806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2808) : (i64) -> ()
      %2809 = func.call @stack_pop_pointer() : () -> i64
      %2810 = func.call @stack_pop_pointer() : () -> i64
      %2811 = func.call @cc_cons(%2810, %2809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2811) : (i64) -> ()
      %2812 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2812) : (i64) -> ()
      %2813 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2814 = arith.constant 32 : i64
      %2815 = func.call @cc_make_string(%2813, %2814) : (!llvm.ptr, i64) -> i64
      %2816 = func.call @cc_nil_value() : () -> i64
      %2817 = func.call @cc_intern(%2815, %2816) : (i64, i64) -> i64
      %2818 = func.call @cc_nil_value() : () -> i64
      %2819 = func.call @cc_cons(%2817, %2818) : (i64, i64) -> i64
      %2820 = func.call @cc_values_pack(%2819) : (i64) -> i64
      func.call @stack_push_pointer(%2817) : (i64) -> ()
      %2821 = func.call @stack_pop_pointer() : () -> i64
      %2822 = func.call @stack_pop_pointer() : () -> i64
      %2823 = func.call @cc_cons(%2821, %2822) : (i64, i64) -> i64
      %2824 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2825 = arith.constant 5 : i64
      %2826 = func.call @cc_make_string(%2824, %2825) : (!llvm.ptr, i64) -> i64
      %2827 = func.call @cc_nil_value() : () -> i64
      %2828 = func.call @cc_intern(%2826, %2827) : (i64, i64) -> i64
      %2829 = func.call @cc_nil_value() : () -> i64
      %2830 = func.call @cc_cons(%2828, %2829) : (i64, i64) -> i64
      %2831 = func.call @cc_values_pack(%2830) : (i64) -> i64
      %2832 = func.call @cc_cons(%2828, %2823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2832) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2833 = func.call @stack_pop_pointer() : () -> i64
      %2834 = func.call @stack_pop_pointer() : () -> i64
      %2835 = func.call @cc_cons(%2834, %2833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      %2836 = func.call @stack_pop_pointer() : () -> i64
      %2837 = func.call @stack_pop_pointer() : () -> i64
      %2838 = func.call @cc_cons(%2837, %2836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2838) : (i64) -> ()
      %2839 = func.call @stack_pop_pointer() : () -> i64
      %2840 = func.call @stack_pop_pointer() : () -> i64
      %2841 = func.call @cc_cons(%2840, %2839) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2841) : (i64) -> ()
      %2842 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2843 = arith.constant 5 : i64
      %2844 = func.call @cc_make_string(%2842, %2843) : (!llvm.ptr, i64) -> i64
      %2845 = func.call @cc_nil_value() : () -> i64
      %2846 = func.call @cc_intern(%2844, %2845) : (i64, i64) -> i64
      %2847 = func.call @cc_nil_value() : () -> i64
      %2848 = func.call @cc_cons(%2846, %2847) : (i64, i64) -> i64
      %2849 = func.call @cc_values_pack(%2848) : (i64) -> i64
      func.call @stack_push_pointer(%2846) : (i64) -> ()
      %2850 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2851 = arith.constant 11 : i64
      %2852 = func.call @cc_make_string(%2850, %2851) : (!llvm.ptr, i64) -> i64
      %2853 = func.call @cc_nil_value() : () -> i64
      %2854 = func.call @cc_intern(%2852, %2853) : (i64, i64) -> i64
      %2855 = func.call @cc_nil_value() : () -> i64
      %2856 = func.call @cc_cons(%2854, %2855) : (i64, i64) -> i64
      %2857 = func.call @cc_values_pack(%2856) : (i64) -> i64
      func.call @stack_push_pointer(%2854) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2858 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2859 = arith.constant 12 : i64
      %2860 = func.call @cc_make_string(%2858, %2859) : (!llvm.ptr, i64) -> i64
      %2861 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2862 = arith.constant 11 : i64
      %2863 = func.call @cc_make_string(%2861, %2862) : (!llvm.ptr, i64) -> i64
      %2864 = func.call @cc_intern(%2860, %2863) : (i64, i64) -> i64
      %2865 = func.call @cc_nil_value() : () -> i64
      %2866 = func.call @cc_cons(%2864, %2865) : (i64, i64) -> i64
      %2867 = func.call @cc_values_pack(%2866) : (i64) -> i64
      func.call @stack_push_pointer(%2864) : (i64) -> ()
      %2868 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2869 = arith.constant 5 : i64
      %2870 = func.call @cc_make_string(%2868, %2869) : (!llvm.ptr, i64) -> i64
      %2871 = func.call @cc_nil_value() : () -> i64
      %2872 = func.call @cc_intern(%2870, %2871) : (i64, i64) -> i64
      %2873 = func.call @cc_nil_value() : () -> i64
      %2874 = func.call @cc_cons(%2872, %2873) : (i64, i64) -> i64
      %2875 = func.call @cc_values_pack(%2874) : (i64) -> i64
      func.call @stack_push_pointer(%2872) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @stack_pop_pointer() : () -> i64
      %2878 = func.call @cc_cons(%2877, %2876) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2878) : (i64) -> ()
      %2879 = func.call @stack_pop_pointer() : () -> i64
      %2880 = func.call @stack_pop_pointer() : () -> i64
      %2881 = func.call @cc_cons(%2880, %2879) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2881) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2882 = func.call @stack_pop_pointer() : () -> i64
      %2883 = func.call @stack_pop_pointer() : () -> i64
      %2884 = func.call @cc_cons(%2883, %2882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2884) : (i64) -> ()
      %2885 = func.call @stack_pop_pointer() : () -> i64
      %2886 = func.call @stack_pop_pointer() : () -> i64
      %2887 = func.call @cc_cons(%2886, %2885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2887) : (i64) -> ()
      %2888 = func.call @stack_pop_pointer() : () -> i64
      %2889 = func.call @stack_pop_pointer() : () -> i64
      %2890 = func.call @cc_cons(%2889, %2888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2890) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2891 = func.call @stack_pop_pointer() : () -> i64
      %2892 = func.call @stack_pop_pointer() : () -> i64
      %2893 = func.call @cc_cons(%2892, %2891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2893) : (i64) -> ()
      %2894 = func.call @stack_pop_pointer() : () -> i64
      %2895 = func.call @stack_pop_pointer() : () -> i64
      %2896 = func.call @cc_cons(%2895, %2894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2897 = func.call @stack_pop_pointer() : () -> i64
      %2898 = func.call @stack_pop_pointer() : () -> i64
      %2899 = func.call @cc_cons(%2898, %2897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2899) : (i64) -> ()
      %2900 = func.call @stack_pop_pointer() : () -> i64
      %2901 = func.call @stack_pop_pointer() : () -> i64
      %2902 = func.call @cc_cons(%2901, %2900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2902) : (i64) -> ()
      %2903 = func.call @stack_pop_pointer() : () -> i64
      %2904 = func.call @stack_pop_pointer() : () -> i64
      %2905 = func.call @cc_cons(%2904, %2903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2905) : (i64) -> ()
      %2906 = func.call @stack_pop_pointer() : () -> i64
      %2907 = func.call @stack_pop_pointer() : () -> i64
      %2908 = func.call @cc_cons(%2907, %2906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2908) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2909 = func.call @stack_pop_pointer() : () -> i64
      %2910 = func.call @stack_pop_pointer() : () -> i64
      %2911 = func.call @cc_cons(%2910, %2909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2911) : (i64) -> ()
      %2912 = func.call @stack_pop_pointer() : () -> i64
      %2913 = func.call @stack_pop_pointer() : () -> i64
      %2914 = func.call @cc_cons(%2913, %2912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2914) : (i64) -> ()
      %2915 = func.call @stack_pop_pointer() : () -> i64
      %2916 = func.call @stack_pop_pointer() : () -> i64
      %2917 = func.call @cc_cons(%2916, %2915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2917) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2918 = func.call @stack_pop_pointer() : () -> i64
      %2919 = func.call @stack_pop_pointer() : () -> i64
      %2920 = func.call @cc_cons(%2919, %2918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2920) : (i64) -> ()
      %2921 = func.call @stack_pop_pointer() : () -> i64
      %2922 = func.call @stack_pop_pointer() : () -> i64
      %2923 = func.call @cc_cons(%2922, %2921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2923) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2924 = func.call @stack_pop_pointer() : () -> i64
      %2925 = func.call @stack_pop_pointer() : () -> i64
      %2926 = func.call @cc_cons(%2925, %2924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2926) : (i64) -> ()
      %2927 = func.call @stack_pop_pointer() : () -> i64
      %2928 = func.call @stack_pop_pointer() : () -> i64
      %2929 = func.call @cc_cons(%2928, %2927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2929) : (i64) -> ()
      %2930 = func.call @stack_pop_pointer() : () -> i64
      %2931 = func.call @stack_pop_pointer() : () -> i64
      %2932 = func.call @cc_cons(%2931, %2930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2932) : (i64) -> ()
      %2933 = func.call @stack_pop_pointer() : () -> i64
      %2934 = func.call @stack_pop_pointer() : () -> i64
      %2935 = func.call @cc_cons(%2934, %2933) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2935) : (i64) -> ()
      %2936 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2937 = arith.constant 32 : i64
      %2938 = func.call @cc_make_string(%2936, %2937) : (!llvm.ptr, i64) -> i64
      %2939 = func.call @cc_nil_value() : () -> i64
      %2940 = func.call @cc_intern(%2938, %2939) : (i64, i64) -> i64
      %2941 = func.call @cc_nil_value() : () -> i64
      %2942 = func.call @cc_cons(%2940, %2941) : (i64, i64) -> i64
      %2943 = func.call @cc_values_pack(%2942) : (i64) -> i64
      func.call @stack_push_pointer(%2940) : (i64) -> ()
      %2944 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2944) : (i64) -> ()
      %2945 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2946 = arith.constant 16 : i64
      %2947 = func.call @cc_make_string(%2945, %2946) : (!llvm.ptr, i64) -> i64
      %2948 = func.call @cc_nil_value() : () -> i64
      %2949 = func.call @cc_intern(%2947, %2948) : (i64, i64) -> i64
      %2950 = func.call @cc_nil_value() : () -> i64
      %2951 = func.call @cc_cons(%2949, %2950) : (i64, i64) -> i64
      %2952 = func.call @cc_values_pack(%2951) : (i64) -> i64
      func.call @stack_push_pointer(%2949) : (i64) -> ()
      %2953 = func.call @stack_pop_pointer() : () -> i64
      %2954 = func.call @stack_pop_pointer() : () -> i64
      %2955 = func.call @cc_cons(%2953, %2954) : (i64, i64) -> i64
      %2956 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2957 = arith.constant 5 : i64
      %2958 = func.call @cc_make_string(%2956, %2957) : (!llvm.ptr, i64) -> i64
      %2959 = func.call @cc_nil_value() : () -> i64
      %2960 = func.call @cc_intern(%2958, %2959) : (i64, i64) -> i64
      %2961 = func.call @cc_nil_value() : () -> i64
      %2962 = func.call @cc_cons(%2960, %2961) : (i64, i64) -> i64
      %2963 = func.call @cc_values_pack(%2962) : (i64) -> i64
      %2964 = func.call @cc_cons(%2960, %2955) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2964) : (i64) -> ()
      %2965 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%2965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2966 = func.call @stack_pop_pointer() : () -> i64
      %2967 = func.call @stack_pop_pointer() : () -> i64
      %2968 = func.call @cc_cons(%2967, %2966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2968) : (i64) -> ()
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @stack_pop_pointer() : () -> i64
      %2971 = func.call @cc_cons(%2970, %2969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2971) : (i64) -> ()
      %2972 = func.call @stack_pop_pointer() : () -> i64
      %2973 = func.call @stack_pop_pointer() : () -> i64
      %2974 = func.call @cc_cons(%2973, %2972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @stack_pop_pointer() : () -> i64
      %2977 = func.call @cc_cons(%2976, %2975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2977) : (i64) -> ()
      %2978 = func.call @stack_pop_pointer() : () -> i64
      %2979 = func.call @stack_pop_pointer() : () -> i64
      %2980 = func.call @cc_cons(%2979, %2978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2980) : (i64) -> ()
      %2981 = func.call @stack_pop_pointer() : () -> i64
      %2982 = func.call @stack_pop_pointer() : () -> i64
      %2983 = func.call @cc_cons(%2982, %2981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2983) : (i64) -> ()
      %2984 = func.call @stack_pop_pointer() : () -> i64
      %2985 = func.call @stack_pop_pointer() : () -> i64
      %2986 = func.call @cc_cons(%2985, %2984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2986) : (i64) -> ()
      %2987 = func.call @stack_pop_pointer() : () -> i64
      %3446 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3447 = arith.constant 48 : i64
      %3448 = func.call @cc_make_symbol(%3446, %3447) : (!llvm.ptr, i64) -> i64
      %3449 = func.call @cc_persistent_root_value(%3448) : (i64) -> i64
      func.call @stack_push_pointer(%3449) : (i64) -> ()
      %3450 = arith.constant 97047688511513 : i64
      %3451 = arith.constant 1 : i64
      %3452 = func.call @cc_make_closure(%3450, %3451) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3452) : (i64) -> ()
      %3453 = func.call @stack_pop_pointer() : () -> i64
      %3454 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3455 = arith.constant 1 : i64
      %3456 = func.call @cc_make_string(%3454, %3455) : (!llvm.ptr, i64) -> i64
      %3457 = func.call @cc_nil_value() : () -> i64
      %3458 = func.call @cc_intern(%3456, %3457) : (i64, i64) -> i64
      %3459 = func.call @cc_nil_value() : () -> i64
      %3460 = func.call @cc_cons(%3458, %3459) : (i64, i64) -> i64
      %3461 = func.call @cc_values_pack(%3460) : (i64) -> i64
      func.call @stack_push_pointer(%3458) : (i64) -> ()
      %3462 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3463 = arith.constant 16 : i64
      %3464 = func.call @cc_make_string(%3462, %3463) : (!llvm.ptr, i64) -> i64
      %3465 = func.call @cc_nil_value() : () -> i64
      %3466 = func.call @cc_intern(%3464, %3465) : (i64, i64) -> i64
      %3467 = func.call @cc_nil_value() : () -> i64
      %3468 = func.call @cc_cons(%3466, %3467) : (i64, i64) -> i64
      %3469 = func.call @cc_values_pack(%3468) : (i64) -> i64
      func.call @stack_push_pointer(%3466) : (i64) -> ()
      %3470 = func.call @stack_pop_pointer() : () -> i64
      %3471 = func.call @stack_pop_pointer() : () -> i64
      %3472 = func.call @cc_cons(%3471, %3470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3472) : (i64) -> ()
      %3473 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3474 = arith.constant 1 : i64
      %3475 = func.call @cc_make_string(%3473, %3474) : (!llvm.ptr, i64) -> i64
      %3476 = func.call @cc_nil_value() : () -> i64
      %3477 = func.call @cc_intern(%3475, %3476) : (i64, i64) -> i64
      %3478 = func.call @cc_nil_value() : () -> i64
      %3479 = func.call @cc_cons(%3477, %3478) : (i64, i64) -> i64
      %3480 = func.call @cc_values_pack(%3479) : (i64) -> i64
      func.call @stack_push_pointer(%3477) : (i64) -> ()
      %3481 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%3481) : (i64) -> ()
      %3482 = func.call @stack_pop_pointer() : () -> i64
      %3483 = func.call @stack_pop_pointer() : () -> i64
      %3484 = func.call @cc_cons(%3483, %3482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3484) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3485 = func.call @stack_pop_pointer() : () -> i64
      %3486 = func.call @stack_pop_pointer() : () -> i64
      %3487 = func.call @cc_cons(%3486, %3485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3487) : (i64) -> ()
      %3488 = func.call @stack_pop_pointer() : () -> i64
      %3489 = func.call @stack_pop_pointer() : () -> i64
      %3490 = func.call @cc_cons(%3489, %3488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3490) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3491 = func.call @stack_pop_pointer() : () -> i64
      %3492 = func.call @stack_pop_pointer() : () -> i64
      %3493 = func.call @cc_cons(%3492, %3491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3493) : (i64) -> ()
      %3494 = func.call @stack_pop_pointer() : () -> i64
      %3495 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3496 = arith.constant 11 : i64
      %3497 = func.call @cc_make_string(%3495, %3496) : (!llvm.ptr, i64) -> i64
      %3498 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3499 = arith.constant 7 : i64
      %3500 = func.call @cc_make_string(%3498, %3499) : (!llvm.ptr, i64) -> i64
      %3501 = func.call @cc_intern(%3497, %3500) : (i64, i64) -> i64
      %3502 = func.call @cc_nil_value() : () -> i64
      %3503 = func.call @cc_cons(%3501, %3502) : (i64, i64) -> i64
      %3504 = func.call @cc_values_pack(%3503) : (i64) -> i64
      func.call @stack_push_pointer(%3501) : (i64) -> ()
      %3505 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3506 = func.call @stack_pop_pointer() : () -> i64
      %3507 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3508 = arith.constant 4 : i64
      %3509 = func.call @cc_make_string(%3507, %3508) : (!llvm.ptr, i64) -> i64
      %3510 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3511 = arith.constant 7 : i64
      %3512 = func.call @cc_make_string(%3510, %3511) : (!llvm.ptr, i64) -> i64
      %3513 = func.call @cc_intern(%3509, %3512) : (i64, i64) -> i64
      %3514 = func.call @cc_nil_value() : () -> i64
      %3515 = func.call @cc_cons(%3513, %3514) : (i64, i64) -> i64
      %3516 = func.call @cc_values_pack(%3515) : (i64) -> i64
      func.call @stack_push_pointer(%3513) : (i64) -> ()
      %3517 = func.call @stack_pop_pointer() : () -> i64
      %3518 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3519 = arith.constant 6 : i64
      %3520 = func.call @cc_make_string(%3518, %3519) : (!llvm.ptr, i64) -> i64
      %3521 = func.call @cc_nil_value() : () -> i64
      %3522 = func.call @cc_intern(%3520, %3521) : (i64, i64) -> i64
      %3523 = func.call @cc_nil_value() : () -> i64
      %3524 = func.call @cc_cons(%3522, %3523) : (i64, i64) -> i64
      %3525 = func.call @cc_values_pack(%3524) : (i64) -> i64
      func.call @stack_push_pointer(%3522) : (i64) -> ()
      %3526 = func.call @stack_pop_pointer() : () -> i64
      %3527 = func.call @cc_nil_value() : () -> i64
      %3528 = func.call @cc_errorp(%2714) : (i64) -> i64
      %3529 = arith.cmpi ne, %3528, %3527 : i64
      %3530 = arith.cmpi eq, %3527, %3527 : i64
      %3531 = arith.andi %3529, %3530 : i1
      %3532 = scf.if %3531 -> (i64) {
        scf.yield %2714 : i64
      } else {
        scf.yield %3527 : i64
      }
      %3533 = func.call @cc_errorp(%2987) : (i64) -> i64
      %3534 = arith.cmpi ne, %3533, %3527 : i64
      %3535 = arith.cmpi eq, %3532, %3527 : i64
      %3536 = arith.andi %3534, %3535 : i1
      %3537 = scf.if %3536 -> (i64) {
        scf.yield %2987 : i64
      } else {
        scf.yield %3532 : i64
      }
      %3538 = func.call @cc_errorp(%3453) : (i64) -> i64
      %3539 = arith.cmpi ne, %3538, %3527 : i64
      %3540 = arith.cmpi eq, %3537, %3527 : i64
      %3541 = arith.andi %3539, %3540 : i1
      %3542 = scf.if %3541 -> (i64) {
        scf.yield %3453 : i64
      } else {
        scf.yield %3537 : i64
      }
      %3543 = func.call @cc_errorp(%3494) : (i64) -> i64
      %3544 = arith.cmpi ne, %3543, %3527 : i64
      %3545 = arith.cmpi eq, %3542, %3527 : i64
      %3546 = arith.andi %3544, %3545 : i1
      %3547 = scf.if %3546 -> (i64) {
        scf.yield %3494 : i64
      } else {
        scf.yield %3542 : i64
      }
      %3548 = func.call @cc_errorp(%3505) : (i64) -> i64
      %3549 = arith.cmpi ne, %3548, %3527 : i64
      %3550 = arith.cmpi eq, %3547, %3527 : i64
      %3551 = arith.andi %3549, %3550 : i1
      %3552 = scf.if %3551 -> (i64) {
        scf.yield %3505 : i64
      } else {
        scf.yield %3547 : i64
      }
      %3553 = func.call @cc_errorp(%3506) : (i64) -> i64
      %3554 = arith.cmpi ne, %3553, %3527 : i64
      %3555 = arith.cmpi eq, %3552, %3527 : i64
      %3556 = arith.andi %3554, %3555 : i1
      %3557 = scf.if %3556 -> (i64) {
        scf.yield %3506 : i64
      } else {
        scf.yield %3552 : i64
      }
      %3558 = func.call @cc_errorp(%3517) : (i64) -> i64
      %3559 = arith.cmpi ne, %3558, %3527 : i64
      %3560 = arith.cmpi eq, %3557, %3527 : i64
      %3561 = arith.andi %3559, %3560 : i1
      %3562 = scf.if %3561 -> (i64) {
        scf.yield %3517 : i64
      } else {
        scf.yield %3557 : i64
      }
      %3563 = func.call @cc_errorp(%3526) : (i64) -> i64
      %3564 = arith.cmpi ne, %3563, %3527 : i64
      %3565 = arith.cmpi eq, %3562, %3527 : i64
      %3566 = arith.andi %3564, %3565 : i1
      %3567 = scf.if %3566 -> (i64) {
        scf.yield %3526 : i64
      } else {
        scf.yield %3562 : i64
      }
      %3568 = arith.cmpi ne, %3567, %3527 : i64
      scf.if %3568 {
        func.call @stack_push_pointer(%3567) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2714) : (i64) -> ()
        func.call @stack_push_pointer(%2987) : (i64) -> ()
        func.call @stack_push_pointer(%3453) : (i64) -> ()
        func.call @stack_push_pointer(%3494) : (i64) -> ()
        func.call @stack_push_pointer(%3505) : (i64) -> ()
        func.call @stack_push_pointer(%3506) : (i64) -> ()
        func.call @stack_push_pointer(%3517) : (i64) -> ()
        func.call @stack_push_pointer(%3526) : (i64) -> ()
        %3569 = llvm.mlir.addressof @str308 : !llvm.ptr
        %3570 = func.call @cc_make_function_ref_const(%3569) : (!llvm.ptr) -> i64
        %3571 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3570, %3571) : (i64, i64) -> ()
      }
      %3572 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3572 : i64
    }
    %3573 = func.call @cc_nil_value() : () -> i64
    %3574 = func.call @cc_errorp(%2705) : (i64) -> i64
    %3575 = arith.cmpi ne, %3574, %3573 : i64
    %3576 = scf.if %3575 -> (i64) {
      scf.yield %2705 : i64
    } else {
      %3577 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3578 = arith.constant 14 : i64
      %3579 = func.call @cc_make_string(%3577, %3578) : (!llvm.ptr, i64) -> i64
      %3580 = func.call @cc_nil_value() : () -> i64
      %3581 = func.call @cc_intern(%3579, %3580) : (i64, i64) -> i64
      %3582 = func.call @cc_nil_value() : () -> i64
      %3583 = func.call @cc_cons(%3581, %3582) : (i64, i64) -> i64
      %3584 = func.call @cc_values_pack(%3583) : (i64) -> i64
      func.call @stack_push_pointer(%3581) : (i64) -> ()
      %3585 = func.call @stack_pop_pointer() : () -> i64
      %3586 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3587 = arith.constant 3 : i64
      %3588 = func.call @cc_make_string(%3586, %3587) : (!llvm.ptr, i64) -> i64
      %3589 = func.call @cc_nil_value() : () -> i64
      %3590 = func.call @cc_intern(%3588, %3589) : (i64, i64) -> i64
      %3591 = func.call @cc_nil_value() : () -> i64
      %3592 = func.call @cc_cons(%3590, %3591) : (i64, i64) -> i64
      %3593 = func.call @cc_values_pack(%3592) : (i64) -> i64
      func.call @stack_push_pointer(%3590) : (i64) -> ()
      %3594 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3595 = arith.constant 3 : i64
      %3596 = func.call @cc_make_string(%3594, %3595) : (!llvm.ptr, i64) -> i64
      %3597 = func.call @cc_nil_value() : () -> i64
      %3598 = func.call @cc_intern(%3596, %3597) : (i64, i64) -> i64
      %3599 = func.call @cc_nil_value() : () -> i64
      %3600 = func.call @cc_cons(%3598, %3599) : (i64, i64) -> i64
      %3601 = func.call @cc_values_pack(%3600) : (i64) -> i64
      func.call @stack_push_pointer(%3598) : (i64) -> ()
      %3602 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3603 = arith.constant 2 : i64
      %3604 = func.call @cc_make_string(%3602, %3603) : (!llvm.ptr, i64) -> i64
      %3605 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3606 = arith.constant 11 : i64
      %3607 = func.call @cc_make_string(%3605, %3606) : (!llvm.ptr, i64) -> i64
      %3608 = func.call @cc_intern(%3604, %3607) : (i64, i64) -> i64
      %3609 = func.call @cc_nil_value() : () -> i64
      %3610 = func.call @cc_cons(%3608, %3609) : (i64, i64) -> i64
      %3611 = func.call @cc_values_pack(%3610) : (i64) -> i64
      func.call @stack_push_pointer(%3608) : (i64) -> ()
      %3612 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3613 = arith.constant 8 : i64
      %3614 = func.call @cc_make_string(%3612, %3613) : (!llvm.ptr, i64) -> i64
      %3615 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3616 = arith.constant 11 : i64
      %3617 = func.call @cc_make_string(%3615, %3616) : (!llvm.ptr, i64) -> i64
      %3618 = func.call @cc_intern(%3614, %3617) : (i64, i64) -> i64
      %3619 = func.call @cc_nil_value() : () -> i64
      %3620 = func.call @cc_cons(%3618, %3619) : (i64, i64) -> i64
      %3621 = func.call @cc_values_pack(%3620) : (i64) -> i64
      func.call @stack_push_pointer(%3618) : (i64) -> ()
      %3622 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3623 = arith.constant 32 : i64
      %3624 = func.call @cc_make_string(%3622, %3623) : (!llvm.ptr, i64) -> i64
      %3625 = func.call @cc_nil_value() : () -> i64
      %3626 = func.call @cc_intern(%3624, %3625) : (i64, i64) -> i64
      %3627 = func.call @cc_nil_value() : () -> i64
      %3628 = func.call @cc_cons(%3626, %3627) : (i64, i64) -> i64
      %3629 = func.call @cc_values_pack(%3628) : (i64) -> i64
      func.call @stack_push_pointer(%3626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3630 = func.call @stack_pop_pointer() : () -> i64
      %3631 = func.call @stack_pop_pointer() : () -> i64
      %3632 = func.call @cc_cons(%3631, %3630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3632) : (i64) -> ()
      %3633 = func.call @stack_pop_pointer() : () -> i64
      %3634 = func.call @stack_pop_pointer() : () -> i64
      %3635 = func.call @cc_cons(%3634, %3633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3635) : (i64) -> ()
      %3636 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3637 = arith.constant 5 : i64
      %3638 = func.call @cc_make_string(%3636, %3637) : (!llvm.ptr, i64) -> i64
      %3639 = func.call @cc_nil_value() : () -> i64
      %3640 = func.call @cc_intern(%3638, %3639) : (i64, i64) -> i64
      %3641 = func.call @cc_nil_value() : () -> i64
      %3642 = func.call @cc_cons(%3640, %3641) : (i64, i64) -> i64
      %3643 = func.call @cc_values_pack(%3642) : (i64) -> i64
      func.call @stack_push_pointer(%3640) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3644 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3645 = arith.constant 32 : i64
      %3646 = func.call @cc_make_string(%3644, %3645) : (!llvm.ptr, i64) -> i64
      %3647 = func.call @cc_nil_value() : () -> i64
      %3648 = func.call @cc_intern(%3646, %3647) : (i64, i64) -> i64
      %3649 = func.call @cc_nil_value() : () -> i64
      %3650 = func.call @cc_cons(%3648, %3649) : (i64, i64) -> i64
      %3651 = func.call @cc_values_pack(%3650) : (i64) -> i64
      func.call @stack_push_pointer(%3648) : (i64) -> ()
      %3652 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3653 = arith.constant 6 : i64
      %3654 = func.call @cc_make_string(%3652, %3653) : (!llvm.ptr, i64) -> i64
      %3655 = func.call @cc_nil_value() : () -> i64
      %3656 = func.call @cc_intern(%3654, %3655) : (i64, i64) -> i64
      %3657 = func.call @cc_nil_value() : () -> i64
      %3658 = func.call @cc_cons(%3656, %3657) : (i64, i64) -> i64
      %3659 = func.call @cc_values_pack(%3658) : (i64) -> i64
      func.call @stack_push_pointer(%3656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3660 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3661 = arith.constant 10 : i64
      %3662 = func.call @cc_make_string(%3660, %3661) : (!llvm.ptr, i64) -> i64
      %3663 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3664 = arith.constant 11 : i64
      %3665 = func.call @cc_make_string(%3663, %3664) : (!llvm.ptr, i64) -> i64
      %3666 = func.call @cc_intern(%3662, %3665) : (i64, i64) -> i64
      %3667 = func.call @cc_nil_value() : () -> i64
      %3668 = func.call @cc_cons(%3666, %3667) : (i64, i64) -> i64
      %3669 = func.call @cc_values_pack(%3668) : (i64) -> i64
      func.call @stack_push_pointer(%3666) : (i64) -> ()
      %3670 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3671 = arith.constant 5 : i64
      %3672 = func.call @cc_make_string(%3670, %3671) : (!llvm.ptr, i64) -> i64
      %3673 = func.call @cc_nil_value() : () -> i64
      %3674 = func.call @cc_intern(%3672, %3673) : (i64, i64) -> i64
      %3675 = func.call @cc_nil_value() : () -> i64
      %3676 = func.call @cc_cons(%3674, %3675) : (i64, i64) -> i64
      %3677 = func.call @cc_values_pack(%3676) : (i64) -> i64
      func.call @stack_push_pointer(%3674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3678 = func.call @stack_pop_pointer() : () -> i64
      %3679 = func.call @stack_pop_pointer() : () -> i64
      %3680 = func.call @cc_cons(%3679, %3678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3680) : (i64) -> ()
      %3681 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3682 = arith.constant 9 : i64
      %3683 = func.call @cc_make_string(%3681, %3682) : (!llvm.ptr, i64) -> i64
      %3684 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3685 = arith.constant 11 : i64
      %3686 = func.call @cc_make_string(%3684, %3685) : (!llvm.ptr, i64) -> i64
      %3687 = func.call @cc_intern(%3683, %3686) : (i64, i64) -> i64
      %3688 = func.call @cc_nil_value() : () -> i64
      %3689 = func.call @cc_cons(%3687, %3688) : (i64, i64) -> i64
      %3690 = func.call @cc_values_pack(%3689) : (i64) -> i64
      func.call @stack_push_pointer(%3687) : (i64) -> ()
      %3691 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3692 = arith.constant 6 : i64
      %3693 = func.call @cc_make_string(%3691, %3692) : (!llvm.ptr, i64) -> i64
      %3694 = func.call @cc_nil_value() : () -> i64
      %3695 = func.call @cc_intern(%3693, %3694) : (i64, i64) -> i64
      %3696 = func.call @cc_nil_value() : () -> i64
      %3697 = func.call @cc_cons(%3695, %3696) : (i64, i64) -> i64
      %3698 = func.call @cc_values_pack(%3697) : (i64) -> i64
      func.call @stack_push_pointer(%3695) : (i64) -> ()
      %3699 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3700 = arith.constant 5 : i64
      %3701 = func.call @cc_make_string(%3699, %3700) : (!llvm.ptr, i64) -> i64
      %3702 = func.call @cc_nil_value() : () -> i64
      %3703 = func.call @cc_intern(%3701, %3702) : (i64, i64) -> i64
      %3704 = func.call @cc_nil_value() : () -> i64
      %3705 = func.call @cc_cons(%3703, %3704) : (i64, i64) -> i64
      %3706 = func.call @cc_values_pack(%3705) : (i64) -> i64
      func.call @stack_push_pointer(%3703) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3707 = func.call @stack_pop_pointer() : () -> i64
      %3708 = func.call @stack_pop_pointer() : () -> i64
      %3709 = func.call @cc_cons(%3708, %3707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3709) : (i64) -> ()
      %3710 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3711 = arith.constant 2 : i64
      %3712 = func.call @cc_make_string(%3710, %3711) : (!llvm.ptr, i64) -> i64
      %3713 = func.call @cc_nil_value() : () -> i64
      %3714 = func.call @cc_intern(%3712, %3713) : (i64, i64) -> i64
      %3715 = func.call @cc_nil_value() : () -> i64
      %3716 = func.call @cc_cons(%3714, %3715) : (i64, i64) -> i64
      %3717 = func.call @cc_values_pack(%3716) : (i64) -> i64
      func.call @stack_push_pointer(%3714) : (i64) -> ()
      %3718 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3719 = arith.constant 2 : i64
      %3720 = func.call @cc_make_string(%3718, %3719) : (!llvm.ptr, i64) -> i64
      %3721 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3722 = arith.constant 11 : i64
      %3723 = func.call @cc_make_string(%3721, %3722) : (!llvm.ptr, i64) -> i64
      %3724 = func.call @cc_intern(%3720, %3723) : (i64, i64) -> i64
      %3725 = func.call @cc_nil_value() : () -> i64
      %3726 = func.call @cc_cons(%3724, %3725) : (i64, i64) -> i64
      %3727 = func.call @cc_values_pack(%3726) : (i64) -> i64
      func.call @stack_push_pointer(%3724) : (i64) -> ()
      %3728 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3729 = arith.constant 19 : i64
      %3730 = func.call @cc_make_string(%3728, %3729) : (!llvm.ptr, i64) -> i64
      %3731 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3732 = arith.constant 11 : i64
      %3733 = func.call @cc_make_string(%3731, %3732) : (!llvm.ptr, i64) -> i64
      %3734 = func.call @cc_intern(%3730, %3733) : (i64, i64) -> i64
      %3735 = func.call @cc_nil_value() : () -> i64
      %3736 = func.call @cc_cons(%3734, %3735) : (i64, i64) -> i64
      %3737 = func.call @cc_values_pack(%3736) : (i64) -> i64
      func.call @stack_push_pointer(%3734) : (i64) -> ()
      %3738 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3739 = arith.constant 5 : i64
      %3740 = func.call @cc_make_string(%3738, %3739) : (!llvm.ptr, i64) -> i64
      %3741 = func.call @cc_nil_value() : () -> i64
      %3742 = func.call @cc_intern(%3740, %3741) : (i64, i64) -> i64
      %3743 = func.call @cc_nil_value() : () -> i64
      %3744 = func.call @cc_cons(%3742, %3743) : (i64, i64) -> i64
      %3745 = func.call @cc_values_pack(%3744) : (i64) -> i64
      func.call @stack_push_pointer(%3742) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3746 = func.call @stack_pop_pointer() : () -> i64
      %3747 = func.call @stack_pop_pointer() : () -> i64
      %3748 = func.call @cc_cons(%3747, %3746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3748) : (i64) -> ()
      %3749 = func.call @stack_pop_pointer() : () -> i64
      %3750 = func.call @stack_pop_pointer() : () -> i64
      %3751 = func.call @cc_cons(%3750, %3749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3751) : (i64) -> ()
      %3752 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3752) : (i64) -> ()
      %3753 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3754 = arith.constant 32 : i64
      %3755 = func.call @cc_make_string(%3753, %3754) : (!llvm.ptr, i64) -> i64
      %3756 = func.call @cc_nil_value() : () -> i64
      %3757 = func.call @cc_intern(%3755, %3756) : (i64, i64) -> i64
      %3758 = func.call @cc_nil_value() : () -> i64
      %3759 = func.call @cc_cons(%3757, %3758) : (i64, i64) -> i64
      %3760 = func.call @cc_values_pack(%3759) : (i64) -> i64
      func.call @stack_push_pointer(%3757) : (i64) -> ()
      %3761 = func.call @stack_pop_pointer() : () -> i64
      %3762 = func.call @stack_pop_pointer() : () -> i64
      %3763 = func.call @cc_cons(%3761, %3762) : (i64, i64) -> i64
      %3764 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3765 = arith.constant 5 : i64
      %3766 = func.call @cc_make_string(%3764, %3765) : (!llvm.ptr, i64) -> i64
      %3767 = func.call @cc_nil_value() : () -> i64
      %3768 = func.call @cc_intern(%3766, %3767) : (i64, i64) -> i64
      %3769 = func.call @cc_nil_value() : () -> i64
      %3770 = func.call @cc_cons(%3768, %3769) : (i64, i64) -> i64
      %3771 = func.call @cc_values_pack(%3770) : (i64) -> i64
      %3772 = func.call @cc_cons(%3768, %3763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3773 = func.call @stack_pop_pointer() : () -> i64
      %3774 = func.call @stack_pop_pointer() : () -> i64
      %3775 = func.call @cc_cons(%3774, %3773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3775) : (i64) -> ()
      %3776 = func.call @stack_pop_pointer() : () -> i64
      %3777 = func.call @stack_pop_pointer() : () -> i64
      %3778 = func.call @cc_cons(%3777, %3776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3778) : (i64) -> ()
      %3779 = func.call @stack_pop_pointer() : () -> i64
      %3780 = func.call @stack_pop_pointer() : () -> i64
      %3781 = func.call @cc_cons(%3780, %3779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3781) : (i64) -> ()
      %3782 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3783 = arith.constant 5 : i64
      %3784 = func.call @cc_make_string(%3782, %3783) : (!llvm.ptr, i64) -> i64
      %3785 = func.call @cc_nil_value() : () -> i64
      %3786 = func.call @cc_intern(%3784, %3785) : (i64, i64) -> i64
      %3787 = func.call @cc_nil_value() : () -> i64
      %3788 = func.call @cc_cons(%3786, %3787) : (i64, i64) -> i64
      %3789 = func.call @cc_values_pack(%3788) : (i64) -> i64
      func.call @stack_push_pointer(%3786) : (i64) -> ()
      %3790 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3791 = arith.constant 11 : i64
      %3792 = func.call @cc_make_string(%3790, %3791) : (!llvm.ptr, i64) -> i64
      %3793 = func.call @cc_nil_value() : () -> i64
      %3794 = func.call @cc_intern(%3792, %3793) : (i64, i64) -> i64
      %3795 = func.call @cc_nil_value() : () -> i64
      %3796 = func.call @cc_cons(%3794, %3795) : (i64, i64) -> i64
      %3797 = func.call @cc_values_pack(%3796) : (i64) -> i64
      func.call @stack_push_pointer(%3794) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3798 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3799 = arith.constant 14 : i64
      %3800 = func.call @cc_make_string(%3798, %3799) : (!llvm.ptr, i64) -> i64
      %3801 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3802 = arith.constant 11 : i64
      %3803 = func.call @cc_make_string(%3801, %3802) : (!llvm.ptr, i64) -> i64
      %3804 = func.call @cc_intern(%3800, %3803) : (i64, i64) -> i64
      %3805 = func.call @cc_nil_value() : () -> i64
      %3806 = func.call @cc_cons(%3804, %3805) : (i64, i64) -> i64
      %3807 = func.call @cc_values_pack(%3806) : (i64) -> i64
      func.call @stack_push_pointer(%3804) : (i64) -> ()
      %3808 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3809 = arith.constant 5 : i64
      %3810 = func.call @cc_make_string(%3808, %3809) : (!llvm.ptr, i64) -> i64
      %3811 = func.call @cc_nil_value() : () -> i64
      %3812 = func.call @cc_intern(%3810, %3811) : (i64, i64) -> i64
      %3813 = func.call @cc_nil_value() : () -> i64
      %3814 = func.call @cc_cons(%3812, %3813) : (i64, i64) -> i64
      %3815 = func.call @cc_values_pack(%3814) : (i64) -> i64
      func.call @stack_push_pointer(%3812) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3816 = func.call @stack_pop_pointer() : () -> i64
      %3817 = func.call @stack_pop_pointer() : () -> i64
      %3818 = func.call @cc_cons(%3817, %3816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3818) : (i64) -> ()
      %3819 = func.call @stack_pop_pointer() : () -> i64
      %3820 = func.call @stack_pop_pointer() : () -> i64
      %3821 = func.call @cc_cons(%3820, %3819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3821) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3822 = func.call @stack_pop_pointer() : () -> i64
      %3823 = func.call @stack_pop_pointer() : () -> i64
      %3824 = func.call @cc_cons(%3823, %3822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3824) : (i64) -> ()
      %3825 = func.call @stack_pop_pointer() : () -> i64
      %3826 = func.call @stack_pop_pointer() : () -> i64
      %3827 = func.call @cc_cons(%3826, %3825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3827) : (i64) -> ()
      %3828 = func.call @stack_pop_pointer() : () -> i64
      %3829 = func.call @stack_pop_pointer() : () -> i64
      %3830 = func.call @cc_cons(%3829, %3828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3830) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3831 = func.call @stack_pop_pointer() : () -> i64
      %3832 = func.call @stack_pop_pointer() : () -> i64
      %3833 = func.call @cc_cons(%3832, %3831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3833) : (i64) -> ()
      %3834 = func.call @stack_pop_pointer() : () -> i64
      %3835 = func.call @stack_pop_pointer() : () -> i64
      %3836 = func.call @cc_cons(%3835, %3834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3836) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3837 = func.call @stack_pop_pointer() : () -> i64
      %3838 = func.call @stack_pop_pointer() : () -> i64
      %3839 = func.call @cc_cons(%3838, %3837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3839) : (i64) -> ()
      %3840 = func.call @stack_pop_pointer() : () -> i64
      %3841 = func.call @stack_pop_pointer() : () -> i64
      %3842 = func.call @cc_cons(%3841, %3840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3842) : (i64) -> ()
      %3843 = func.call @stack_pop_pointer() : () -> i64
      %3844 = func.call @stack_pop_pointer() : () -> i64
      %3845 = func.call @cc_cons(%3844, %3843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3845) : (i64) -> ()
      %3846 = func.call @stack_pop_pointer() : () -> i64
      %3847 = func.call @stack_pop_pointer() : () -> i64
      %3848 = func.call @cc_cons(%3847, %3846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3848) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3849 = func.call @stack_pop_pointer() : () -> i64
      %3850 = func.call @stack_pop_pointer() : () -> i64
      %3851 = func.call @cc_cons(%3850, %3849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3851) : (i64) -> ()
      %3852 = func.call @stack_pop_pointer() : () -> i64
      %3853 = func.call @stack_pop_pointer() : () -> i64
      %3854 = func.call @cc_cons(%3853, %3852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3854) : (i64) -> ()
      %3855 = func.call @stack_pop_pointer() : () -> i64
      %3856 = func.call @stack_pop_pointer() : () -> i64
      %3857 = func.call @cc_cons(%3856, %3855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3857) : (i64) -> ()
      %3858 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3859 = arith.constant 5 : i64
      %3860 = func.call @cc_make_string(%3858, %3859) : (!llvm.ptr, i64) -> i64
      %3861 = func.call @cc_nil_value() : () -> i64
      %3862 = func.call @cc_intern(%3860, %3861) : (i64, i64) -> i64
      %3863 = func.call @cc_nil_value() : () -> i64
      %3864 = func.call @cc_cons(%3862, %3863) : (i64, i64) -> i64
      %3865 = func.call @cc_values_pack(%3864) : (i64) -> i64
      func.call @stack_push_pointer(%3862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3866 = func.call @stack_pop_pointer() : () -> i64
      %3867 = func.call @stack_pop_pointer() : () -> i64
      %3868 = func.call @cc_cons(%3867, %3866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3868) : (i64) -> ()
      %3869 = func.call @stack_pop_pointer() : () -> i64
      %3870 = func.call @stack_pop_pointer() : () -> i64
      %3871 = func.call @cc_cons(%3870, %3869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3871) : (i64) -> ()
      %3872 = func.call @stack_pop_pointer() : () -> i64
      %3873 = func.call @stack_pop_pointer() : () -> i64
      %3874 = func.call @cc_cons(%3873, %3872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3874) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3875 = func.call @stack_pop_pointer() : () -> i64
      %3876 = func.call @stack_pop_pointer() : () -> i64
      %3877 = func.call @cc_cons(%3876, %3875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3877) : (i64) -> ()
      %3878 = func.call @stack_pop_pointer() : () -> i64
      %3879 = func.call @stack_pop_pointer() : () -> i64
      %3880 = func.call @cc_cons(%3879, %3878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3880) : (i64) -> ()
      %3881 = func.call @stack_pop_pointer() : () -> i64
      %3882 = func.call @stack_pop_pointer() : () -> i64
      %3883 = func.call @cc_cons(%3882, %3881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3883) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3884 = func.call @stack_pop_pointer() : () -> i64
      %3885 = func.call @stack_pop_pointer() : () -> i64
      %3886 = func.call @cc_cons(%3885, %3884) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3886) : (i64) -> ()
      %3887 = func.call @stack_pop_pointer() : () -> i64
      %3888 = func.call @stack_pop_pointer() : () -> i64
      %3889 = func.call @cc_cons(%3888, %3887) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3889) : (i64) -> ()
      %3890 = func.call @stack_pop_pointer() : () -> i64
      %3891 = func.call @stack_pop_pointer() : () -> i64
      %3892 = func.call @cc_cons(%3891, %3890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3892) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3893 = func.call @stack_pop_pointer() : () -> i64
      %3894 = func.call @stack_pop_pointer() : () -> i64
      %3895 = func.call @cc_cons(%3894, %3893) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3895) : (i64) -> ()
      %3896 = func.call @stack_pop_pointer() : () -> i64
      %3897 = func.call @stack_pop_pointer() : () -> i64
      %3898 = func.call @cc_cons(%3897, %3896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3898) : (i64) -> ()
      %3899 = func.call @stack_pop_pointer() : () -> i64
      %3900 = func.call @stack_pop_pointer() : () -> i64
      %3901 = func.call @cc_cons(%3900, %3899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3901) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3902 = func.call @stack_pop_pointer() : () -> i64
      %3903 = func.call @stack_pop_pointer() : () -> i64
      %3904 = func.call @cc_cons(%3903, %3902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3904) : (i64) -> ()
      %3905 = func.call @stack_pop_pointer() : () -> i64
      %3906 = func.call @stack_pop_pointer() : () -> i64
      %3907 = func.call @cc_cons(%3906, %3905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3907) : (i64) -> ()
      %3908 = func.call @stack_pop_pointer() : () -> i64
      %3909 = func.call @stack_pop_pointer() : () -> i64
      %3910 = func.call @cc_cons(%3909, %3908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3910) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3911 = func.call @stack_pop_pointer() : () -> i64
      %3912 = func.call @stack_pop_pointer() : () -> i64
      %3913 = func.call @cc_cons(%3912, %3911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3913) : (i64) -> ()
      %3914 = func.call @stack_pop_pointer() : () -> i64
      %3915 = func.call @stack_pop_pointer() : () -> i64
      %3916 = func.call @cc_cons(%3915, %3914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3916) : (i64) -> ()
      %3917 = func.call @stack_pop_pointer() : () -> i64
      %3918 = func.call @stack_pop_pointer() : () -> i64
      %3919 = func.call @cc_cons(%3918, %3917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3919) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3920 = func.call @stack_pop_pointer() : () -> i64
      %3921 = func.call @stack_pop_pointer() : () -> i64
      %3922 = func.call @cc_cons(%3921, %3920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3922) : (i64) -> ()
      %3923 = func.call @stack_pop_pointer() : () -> i64
      %3924 = func.call @stack_pop_pointer() : () -> i64
      %3925 = func.call @cc_cons(%3924, %3923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3925) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3926 = func.call @stack_pop_pointer() : () -> i64
      %3927 = func.call @stack_pop_pointer() : () -> i64
      %3928 = func.call @cc_cons(%3927, %3926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3928) : (i64) -> ()
      %3929 = func.call @stack_pop_pointer() : () -> i64
      %3930 = func.call @stack_pop_pointer() : () -> i64
      %3931 = func.call @cc_cons(%3930, %3929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3931) : (i64) -> ()
      %3932 = func.call @stack_pop_pointer() : () -> i64
      %4148 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4149 = arith.constant 33 : i64
      %4150 = func.call @cc_make_symbol(%4148, %4149) : (!llvm.ptr, i64) -> i64
      %4151 = func.call @cc_persistent_root_value(%4150) : (i64) -> i64
      func.call @stack_push_pointer(%4151) : (i64) -> ()
      %4152 = arith.constant 97047688511520 : i64
      %4153 = arith.constant 1 : i64
      %4154 = func.call @cc_make_closure(%4152, %4153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4154) : (i64) -> ()
      %4155 = func.call @stack_pop_pointer() : () -> i64
      %4156 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4157 = arith.constant 1 : i64
      %4158 = func.call @cc_make_string(%4156, %4157) : (!llvm.ptr, i64) -> i64
      %4159 = func.call @cc_nil_value() : () -> i64
      %4160 = func.call @cc_intern(%4158, %4159) : (i64, i64) -> i64
      %4161 = func.call @cc_nil_value() : () -> i64
      %4162 = func.call @cc_cons(%4160, %4161) : (i64, i64) -> i64
      %4163 = func.call @cc_values_pack(%4162) : (i64) -> i64
      func.call @stack_push_pointer(%4160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4164 = func.call @stack_pop_pointer() : () -> i64
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @cc_cons(%4165, %4164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4166) : (i64) -> ()
      %4167 = func.call @stack_pop_pointer() : () -> i64
      %4168 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4169 = arith.constant 11 : i64
      %4170 = func.call @cc_make_string(%4168, %4169) : (!llvm.ptr, i64) -> i64
      %4171 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4172 = arith.constant 7 : i64
      %4173 = func.call @cc_make_string(%4171, %4172) : (!llvm.ptr, i64) -> i64
      %4174 = func.call @cc_intern(%4170, %4173) : (i64, i64) -> i64
      %4175 = func.call @cc_nil_value() : () -> i64
      %4176 = func.call @cc_cons(%4174, %4175) : (i64, i64) -> i64
      %4177 = func.call @cc_values_pack(%4176) : (i64) -> i64
      func.call @stack_push_pointer(%4174) : (i64) -> ()
      %4178 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4179 = func.call @stack_pop_pointer() : () -> i64
      %4180 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4181 = arith.constant 4 : i64
      %4182 = func.call @cc_make_string(%4180, %4181) : (!llvm.ptr, i64) -> i64
      %4183 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4184 = arith.constant 7 : i64
      %4185 = func.call @cc_make_string(%4183, %4184) : (!llvm.ptr, i64) -> i64
      %4186 = func.call @cc_intern(%4182, %4185) : (i64, i64) -> i64
      %4187 = func.call @cc_nil_value() : () -> i64
      %4188 = func.call @cc_cons(%4186, %4187) : (i64, i64) -> i64
      %4189 = func.call @cc_values_pack(%4188) : (i64) -> i64
      func.call @stack_push_pointer(%4186) : (i64) -> ()
      %4190 = func.call @stack_pop_pointer() : () -> i64
      %4191 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4192 = arith.constant 6 : i64
      %4193 = func.call @cc_make_string(%4191, %4192) : (!llvm.ptr, i64) -> i64
      %4194 = func.call @cc_nil_value() : () -> i64
      %4195 = func.call @cc_intern(%4193, %4194) : (i64, i64) -> i64
      %4196 = func.call @cc_nil_value() : () -> i64
      %4197 = func.call @cc_cons(%4195, %4196) : (i64, i64) -> i64
      %4198 = func.call @cc_values_pack(%4197) : (i64) -> i64
      func.call @stack_push_pointer(%4195) : (i64) -> ()
      %4199 = func.call @stack_pop_pointer() : () -> i64
      %4200 = func.call @cc_nil_value() : () -> i64
      %4201 = func.call @cc_errorp(%3585) : (i64) -> i64
      %4202 = arith.cmpi ne, %4201, %4200 : i64
      %4203 = arith.cmpi eq, %4200, %4200 : i64
      %4204 = arith.andi %4202, %4203 : i1
      %4205 = scf.if %4204 -> (i64) {
        scf.yield %3585 : i64
      } else {
        scf.yield %4200 : i64
      }
      %4206 = func.call @cc_errorp(%3932) : (i64) -> i64
      %4207 = arith.cmpi ne, %4206, %4200 : i64
      %4208 = arith.cmpi eq, %4205, %4200 : i64
      %4209 = arith.andi %4207, %4208 : i1
      %4210 = scf.if %4209 -> (i64) {
        scf.yield %3932 : i64
      } else {
        scf.yield %4205 : i64
      }
      %4211 = func.call @cc_errorp(%4155) : (i64) -> i64
      %4212 = arith.cmpi ne, %4211, %4200 : i64
      %4213 = arith.cmpi eq, %4210, %4200 : i64
      %4214 = arith.andi %4212, %4213 : i1
      %4215 = scf.if %4214 -> (i64) {
        scf.yield %4155 : i64
      } else {
        scf.yield %4210 : i64
      }
      %4216 = func.call @cc_errorp(%4167) : (i64) -> i64
      %4217 = arith.cmpi ne, %4216, %4200 : i64
      %4218 = arith.cmpi eq, %4215, %4200 : i64
      %4219 = arith.andi %4217, %4218 : i1
      %4220 = scf.if %4219 -> (i64) {
        scf.yield %4167 : i64
      } else {
        scf.yield %4215 : i64
      }
      %4221 = func.call @cc_errorp(%4178) : (i64) -> i64
      %4222 = arith.cmpi ne, %4221, %4200 : i64
      %4223 = arith.cmpi eq, %4220, %4200 : i64
      %4224 = arith.andi %4222, %4223 : i1
      %4225 = scf.if %4224 -> (i64) {
        scf.yield %4178 : i64
      } else {
        scf.yield %4220 : i64
      }
      %4226 = func.call @cc_errorp(%4179) : (i64) -> i64
      %4227 = arith.cmpi ne, %4226, %4200 : i64
      %4228 = arith.cmpi eq, %4225, %4200 : i64
      %4229 = arith.andi %4227, %4228 : i1
      %4230 = scf.if %4229 -> (i64) {
        scf.yield %4179 : i64
      } else {
        scf.yield %4225 : i64
      }
      %4231 = func.call @cc_errorp(%4190) : (i64) -> i64
      %4232 = arith.cmpi ne, %4231, %4200 : i64
      %4233 = arith.cmpi eq, %4230, %4200 : i64
      %4234 = arith.andi %4232, %4233 : i1
      %4235 = scf.if %4234 -> (i64) {
        scf.yield %4190 : i64
      } else {
        scf.yield %4230 : i64
      }
      %4236 = func.call @cc_errorp(%4199) : (i64) -> i64
      %4237 = arith.cmpi ne, %4236, %4200 : i64
      %4238 = arith.cmpi eq, %4235, %4200 : i64
      %4239 = arith.andi %4237, %4238 : i1
      %4240 = scf.if %4239 -> (i64) {
        scf.yield %4199 : i64
      } else {
        scf.yield %4235 : i64
      }
      %4241 = arith.cmpi ne, %4240, %4200 : i64
      scf.if %4241 {
        func.call @stack_push_pointer(%4240) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3585) : (i64) -> ()
        func.call @stack_push_pointer(%3932) : (i64) -> ()
        func.call @stack_push_pointer(%4155) : (i64) -> ()
        func.call @stack_push_pointer(%4167) : (i64) -> ()
        func.call @stack_push_pointer(%4178) : (i64) -> ()
        func.call @stack_push_pointer(%4179) : (i64) -> ()
        func.call @stack_push_pointer(%4190) : (i64) -> ()
        func.call @stack_push_pointer(%4199) : (i64) -> ()
        %4242 = llvm.mlir.addressof @str363 : !llvm.ptr
        %4243 = func.call @cc_make_function_ref_const(%4242) : (!llvm.ptr) -> i64
        %4244 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4243, %4244) : (i64, i64) -> ()
      }
      %4245 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4245 : i64
    }
    %4246 = func.call @cc_nil_value() : () -> i64
    %4247 = func.call @cc_errorp(%3576) : (i64) -> i64
    %4248 = arith.cmpi ne, %4247, %4246 : i64
    %4249 = scf.if %4248 -> (i64) {
      scf.yield %3576 : i64
    } else {
      %4250 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4251 = arith.constant 26 : i64
      %4252 = func.call @cc_make_string(%4250, %4251) : (!llvm.ptr, i64) -> i64
      %4253 = func.call @cc_nil_value() : () -> i64
      %4254 = func.call @cc_intern(%4252, %4253) : (i64, i64) -> i64
      %4255 = func.call @cc_nil_value() : () -> i64
      %4256 = func.call @cc_cons(%4254, %4255) : (i64, i64) -> i64
      %4257 = func.call @cc_values_pack(%4256) : (i64) -> i64
      func.call @stack_push_pointer(%4254) : (i64) -> ()
      %4258 = func.call @stack_pop_pointer() : () -> i64
      %4259 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4260 = arith.constant 5 : i64
      %4261 = func.call @cc_make_string(%4259, %4260) : (!llvm.ptr, i64) -> i64
      %4262 = func.call @cc_nil_value() : () -> i64
      %4263 = func.call @cc_intern(%4261, %4262) : (i64, i64) -> i64
      %4264 = func.call @cc_nil_value() : () -> i64
      %4265 = func.call @cc_cons(%4263, %4264) : (i64, i64) -> i64
      %4266 = func.call @cc_values_pack(%4265) : (i64) -> i64
      func.call @stack_push_pointer(%4263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4267 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4268 = arith.constant 32 : i64
      %4269 = func.call @cc_make_string(%4267, %4268) : (!llvm.ptr, i64) -> i64
      %4270 = func.call @cc_nil_value() : () -> i64
      %4271 = func.call @cc_intern(%4269, %4270) : (i64, i64) -> i64
      %4272 = func.call @cc_nil_value() : () -> i64
      %4273 = func.call @cc_cons(%4271, %4272) : (i64, i64) -> i64
      %4274 = func.call @cc_values_pack(%4273) : (i64) -> i64
      func.call @stack_push_pointer(%4271) : (i64) -> ()
      %4275 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4276 = arith.constant 6 : i64
      %4277 = func.call @cc_make_string(%4275, %4276) : (!llvm.ptr, i64) -> i64
      %4278 = func.call @cc_nil_value() : () -> i64
      %4279 = func.call @cc_intern(%4277, %4278) : (i64, i64) -> i64
      %4280 = func.call @cc_nil_value() : () -> i64
      %4281 = func.call @cc_cons(%4279, %4280) : (i64, i64) -> i64
      %4282 = func.call @cc_values_pack(%4281) : (i64) -> i64
      func.call @stack_push_pointer(%4279) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4283 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4284 = arith.constant 10 : i64
      %4285 = func.call @cc_make_string(%4283, %4284) : (!llvm.ptr, i64) -> i64
      %4286 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4287 = arith.constant 11 : i64
      %4288 = func.call @cc_make_string(%4286, %4287) : (!llvm.ptr, i64) -> i64
      %4289 = func.call @cc_intern(%4285, %4288) : (i64, i64) -> i64
      %4290 = func.call @cc_nil_value() : () -> i64
      %4291 = func.call @cc_cons(%4289, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_values_pack(%4291) : (i64) -> i64
      func.call @stack_push_pointer(%4289) : (i64) -> ()
      %4293 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4294 = arith.constant 5 : i64
      %4295 = func.call @cc_make_string(%4293, %4294) : (!llvm.ptr, i64) -> i64
      %4296 = func.call @cc_nil_value() : () -> i64
      %4297 = func.call @cc_intern(%4295, %4296) : (i64, i64) -> i64
      %4298 = func.call @cc_nil_value() : () -> i64
      %4299 = func.call @cc_cons(%4297, %4298) : (i64, i64) -> i64
      %4300 = func.call @cc_values_pack(%4299) : (i64) -> i64
      func.call @stack_push_pointer(%4297) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4301 = func.call @stack_pop_pointer() : () -> i64
      %4302 = func.call @stack_pop_pointer() : () -> i64
      %4303 = func.call @cc_cons(%4302, %4301) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4303) : (i64) -> ()
      %4304 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4305 = arith.constant 9 : i64
      %4306 = func.call @cc_make_string(%4304, %4305) : (!llvm.ptr, i64) -> i64
      %4307 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4308 = arith.constant 11 : i64
      %4309 = func.call @cc_make_string(%4307, %4308) : (!llvm.ptr, i64) -> i64
      %4310 = func.call @cc_intern(%4306, %4309) : (i64, i64) -> i64
      %4311 = func.call @cc_nil_value() : () -> i64
      %4312 = func.call @cc_cons(%4310, %4311) : (i64, i64) -> i64
      %4313 = func.call @cc_values_pack(%4312) : (i64) -> i64
      func.call @stack_push_pointer(%4310) : (i64) -> ()
      %4314 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4315 = arith.constant 6 : i64
      %4316 = func.call @cc_make_string(%4314, %4315) : (!llvm.ptr, i64) -> i64
      %4317 = func.call @cc_nil_value() : () -> i64
      %4318 = func.call @cc_intern(%4316, %4317) : (i64, i64) -> i64
      %4319 = func.call @cc_nil_value() : () -> i64
      %4320 = func.call @cc_cons(%4318, %4319) : (i64, i64) -> i64
      %4321 = func.call @cc_values_pack(%4320) : (i64) -> i64
      func.call @stack_push_pointer(%4318) : (i64) -> ()
      %4322 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4323 = arith.constant 5 : i64
      %4324 = func.call @cc_make_string(%4322, %4323) : (!llvm.ptr, i64) -> i64
      %4325 = func.call @cc_nil_value() : () -> i64
      %4326 = func.call @cc_intern(%4324, %4325) : (i64, i64) -> i64
      %4327 = func.call @cc_nil_value() : () -> i64
      %4328 = func.call @cc_cons(%4326, %4327) : (i64, i64) -> i64
      %4329 = func.call @cc_values_pack(%4328) : (i64) -> i64
      func.call @stack_push_pointer(%4326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4330 = func.call @stack_pop_pointer() : () -> i64
      %4331 = func.call @stack_pop_pointer() : () -> i64
      %4332 = func.call @cc_cons(%4331, %4330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4332) : (i64) -> ()
      %4333 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4334 = arith.constant 2 : i64
      %4335 = func.call @cc_make_string(%4333, %4334) : (!llvm.ptr, i64) -> i64
      %4336 = func.call @cc_nil_value() : () -> i64
      %4337 = func.call @cc_intern(%4335, %4336) : (i64, i64) -> i64
      %4338 = func.call @cc_nil_value() : () -> i64
      %4339 = func.call @cc_cons(%4337, %4338) : (i64, i64) -> i64
      %4340 = func.call @cc_values_pack(%4339) : (i64) -> i64
      func.call @stack_push_pointer(%4337) : (i64) -> ()
      %4341 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4342 = arith.constant 2 : i64
      %4343 = func.call @cc_make_string(%4341, %4342) : (!llvm.ptr, i64) -> i64
      %4344 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4345 = arith.constant 11 : i64
      %4346 = func.call @cc_make_string(%4344, %4345) : (!llvm.ptr, i64) -> i64
      %4347 = func.call @cc_intern(%4343, %4346) : (i64, i64) -> i64
      %4348 = func.call @cc_nil_value() : () -> i64
      %4349 = func.call @cc_cons(%4347, %4348) : (i64, i64) -> i64
      %4350 = func.call @cc_values_pack(%4349) : (i64) -> i64
      func.call @stack_push_pointer(%4347) : (i64) -> ()
      %4351 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4352 = arith.constant 19 : i64
      %4353 = func.call @cc_make_string(%4351, %4352) : (!llvm.ptr, i64) -> i64
      %4354 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4355 = arith.constant 11 : i64
      %4356 = func.call @cc_make_string(%4354, %4355) : (!llvm.ptr, i64) -> i64
      %4357 = func.call @cc_intern(%4353, %4356) : (i64, i64) -> i64
      %4358 = func.call @cc_nil_value() : () -> i64
      %4359 = func.call @cc_cons(%4357, %4358) : (i64, i64) -> i64
      %4360 = func.call @cc_values_pack(%4359) : (i64) -> i64
      func.call @stack_push_pointer(%4357) : (i64) -> ()
      %4361 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4362 = arith.constant 5 : i64
      %4363 = func.call @cc_make_string(%4361, %4362) : (!llvm.ptr, i64) -> i64
      %4364 = func.call @cc_nil_value() : () -> i64
      %4365 = func.call @cc_intern(%4363, %4364) : (i64, i64) -> i64
      %4366 = func.call @cc_nil_value() : () -> i64
      %4367 = func.call @cc_cons(%4365, %4366) : (i64, i64) -> i64
      %4368 = func.call @cc_values_pack(%4367) : (i64) -> i64
      func.call @stack_push_pointer(%4365) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4369 = func.call @stack_pop_pointer() : () -> i64
      %4370 = func.call @stack_pop_pointer() : () -> i64
      %4371 = func.call @cc_cons(%4370, %4369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4371) : (i64) -> ()
      %4372 = func.call @stack_pop_pointer() : () -> i64
      %4373 = func.call @stack_pop_pointer() : () -> i64
      %4374 = func.call @cc_cons(%4373, %4372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4374) : (i64) -> ()
      %4375 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4375) : (i64) -> ()
      %4376 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4377 = arith.constant 32 : i64
      %4378 = func.call @cc_make_string(%4376, %4377) : (!llvm.ptr, i64) -> i64
      %4379 = func.call @cc_nil_value() : () -> i64
      %4380 = func.call @cc_intern(%4378, %4379) : (i64, i64) -> i64
      %4381 = func.call @cc_nil_value() : () -> i64
      %4382 = func.call @cc_cons(%4380, %4381) : (i64, i64) -> i64
      %4383 = func.call @cc_values_pack(%4382) : (i64) -> i64
      func.call @stack_push_pointer(%4380) : (i64) -> ()
      %4384 = func.call @stack_pop_pointer() : () -> i64
      %4385 = func.call @stack_pop_pointer() : () -> i64
      %4386 = func.call @cc_cons(%4384, %4385) : (i64, i64) -> i64
      %4387 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4388 = arith.constant 5 : i64
      %4389 = func.call @cc_make_string(%4387, %4388) : (!llvm.ptr, i64) -> i64
      %4390 = func.call @cc_nil_value() : () -> i64
      %4391 = func.call @cc_intern(%4389, %4390) : (i64, i64) -> i64
      %4392 = func.call @cc_nil_value() : () -> i64
      %4393 = func.call @cc_cons(%4391, %4392) : (i64, i64) -> i64
      %4394 = func.call @cc_values_pack(%4393) : (i64) -> i64
      %4395 = func.call @cc_cons(%4391, %4386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4396 = func.call @stack_pop_pointer() : () -> i64
      %4397 = func.call @stack_pop_pointer() : () -> i64
      %4398 = func.call @cc_cons(%4397, %4396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4398) : (i64) -> ()
      %4399 = func.call @stack_pop_pointer() : () -> i64
      %4400 = func.call @stack_pop_pointer() : () -> i64
      %4401 = func.call @cc_cons(%4400, %4399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4401) : (i64) -> ()
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = func.call @stack_pop_pointer() : () -> i64
      %4404 = func.call @cc_cons(%4403, %4402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4404) : (i64) -> ()
      %4405 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4406 = arith.constant 5 : i64
      %4407 = func.call @cc_make_string(%4405, %4406) : (!llvm.ptr, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_intern(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_nil_value() : () -> i64
      %4411 = func.call @cc_cons(%4409, %4410) : (i64, i64) -> i64
      %4412 = func.call @cc_values_pack(%4411) : (i64) -> i64
      func.call @stack_push_pointer(%4409) : (i64) -> ()
      %4413 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4414 = arith.constant 11 : i64
      %4415 = func.call @cc_make_string(%4413, %4414) : (!llvm.ptr, i64) -> i64
      %4416 = func.call @cc_nil_value() : () -> i64
      %4417 = func.call @cc_intern(%4415, %4416) : (i64, i64) -> i64
      %4418 = func.call @cc_nil_value() : () -> i64
      %4419 = func.call @cc_cons(%4417, %4418) : (i64, i64) -> i64
      %4420 = func.call @cc_values_pack(%4419) : (i64) -> i64
      func.call @stack_push_pointer(%4417) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4421 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4422 = arith.constant 26 : i64
      %4423 = func.call @cc_make_string(%4421, %4422) : (!llvm.ptr, i64) -> i64
      %4424 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4425 = arith.constant 11 : i64
      %4426 = func.call @cc_make_string(%4424, %4425) : (!llvm.ptr, i64) -> i64
      %4427 = func.call @cc_intern(%4423, %4426) : (i64, i64) -> i64
      %4428 = func.call @cc_nil_value() : () -> i64
      %4429 = func.call @cc_cons(%4427, %4428) : (i64, i64) -> i64
      %4430 = func.call @cc_values_pack(%4429) : (i64) -> i64
      func.call @stack_push_pointer(%4427) : (i64) -> ()
      %4431 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4432 = arith.constant 5 : i64
      %4433 = func.call @cc_make_string(%4431, %4432) : (!llvm.ptr, i64) -> i64
      %4434 = func.call @cc_nil_value() : () -> i64
      %4435 = func.call @cc_intern(%4433, %4434) : (i64, i64) -> i64
      %4436 = func.call @cc_nil_value() : () -> i64
      %4437 = func.call @cc_cons(%4435, %4436) : (i64, i64) -> i64
      %4438 = func.call @cc_values_pack(%4437) : (i64) -> i64
      func.call @stack_push_pointer(%4435) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4439 = func.call @stack_pop_pointer() : () -> i64
      %4440 = func.call @stack_pop_pointer() : () -> i64
      %4441 = func.call @cc_cons(%4440, %4439) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4441) : (i64) -> ()
      %4442 = func.call @stack_pop_pointer() : () -> i64
      %4443 = func.call @stack_pop_pointer() : () -> i64
      %4444 = func.call @cc_cons(%4443, %4442) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4444) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4445 = func.call @stack_pop_pointer() : () -> i64
      %4446 = func.call @stack_pop_pointer() : () -> i64
      %4447 = func.call @cc_cons(%4446, %4445) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4447) : (i64) -> ()
      %4448 = func.call @stack_pop_pointer() : () -> i64
      %4449 = func.call @stack_pop_pointer() : () -> i64
      %4450 = func.call @cc_cons(%4449, %4448) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4450) : (i64) -> ()
      %4451 = func.call @stack_pop_pointer() : () -> i64
      %4452 = func.call @stack_pop_pointer() : () -> i64
      %4453 = func.call @cc_cons(%4452, %4451) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4453) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4454 = func.call @stack_pop_pointer() : () -> i64
      %4455 = func.call @stack_pop_pointer() : () -> i64
      %4456 = func.call @cc_cons(%4455, %4454) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4456) : (i64) -> ()
      %4457 = func.call @stack_pop_pointer() : () -> i64
      %4458 = func.call @stack_pop_pointer() : () -> i64
      %4459 = func.call @cc_cons(%4458, %4457) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4460 = func.call @stack_pop_pointer() : () -> i64
      %4461 = func.call @stack_pop_pointer() : () -> i64
      %4462 = func.call @cc_cons(%4461, %4460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4462) : (i64) -> ()
      %4463 = func.call @stack_pop_pointer() : () -> i64
      %4464 = func.call @stack_pop_pointer() : () -> i64
      %4465 = func.call @cc_cons(%4464, %4463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4465) : (i64) -> ()
      %4466 = func.call @stack_pop_pointer() : () -> i64
      %4467 = func.call @stack_pop_pointer() : () -> i64
      %4468 = func.call @cc_cons(%4467, %4466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4468) : (i64) -> ()
      %4469 = func.call @stack_pop_pointer() : () -> i64
      %4470 = func.call @stack_pop_pointer() : () -> i64
      %4471 = func.call @cc_cons(%4470, %4469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4472 = func.call @stack_pop_pointer() : () -> i64
      %4473 = func.call @stack_pop_pointer() : () -> i64
      %4474 = func.call @cc_cons(%4473, %4472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4474) : (i64) -> ()
      %4475 = func.call @stack_pop_pointer() : () -> i64
      %4476 = func.call @stack_pop_pointer() : () -> i64
      %4477 = func.call @cc_cons(%4476, %4475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4477) : (i64) -> ()
      %4478 = func.call @stack_pop_pointer() : () -> i64
      %4479 = func.call @stack_pop_pointer() : () -> i64
      %4480 = func.call @cc_cons(%4479, %4478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4480) : (i64) -> ()
      %4481 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4482 = arith.constant 5 : i64
      %4483 = func.call @cc_make_string(%4481, %4482) : (!llvm.ptr, i64) -> i64
      %4484 = func.call @cc_nil_value() : () -> i64
      %4485 = func.call @cc_intern(%4483, %4484) : (i64, i64) -> i64
      %4486 = func.call @cc_nil_value() : () -> i64
      %4487 = func.call @cc_cons(%4485, %4486) : (i64, i64) -> i64
      %4488 = func.call @cc_values_pack(%4487) : (i64) -> i64
      func.call @stack_push_pointer(%4485) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4489 = func.call @stack_pop_pointer() : () -> i64
      %4490 = func.call @stack_pop_pointer() : () -> i64
      %4491 = func.call @cc_cons(%4490, %4489) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4491) : (i64) -> ()
      %4492 = func.call @stack_pop_pointer() : () -> i64
      %4493 = func.call @stack_pop_pointer() : () -> i64
      %4494 = func.call @cc_cons(%4493, %4492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4494) : (i64) -> ()
      %4495 = func.call @stack_pop_pointer() : () -> i64
      %4496 = func.call @stack_pop_pointer() : () -> i64
      %4497 = func.call @cc_cons(%4496, %4495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4497) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4498 = func.call @stack_pop_pointer() : () -> i64
      %4499 = func.call @stack_pop_pointer() : () -> i64
      %4500 = func.call @cc_cons(%4499, %4498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4500) : (i64) -> ()
      %4501 = func.call @stack_pop_pointer() : () -> i64
      %4502 = func.call @stack_pop_pointer() : () -> i64
      %4503 = func.call @cc_cons(%4502, %4501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4503) : (i64) -> ()
      %4504 = func.call @stack_pop_pointer() : () -> i64
      %4505 = func.call @stack_pop_pointer() : () -> i64
      %4506 = func.call @cc_cons(%4505, %4504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4506) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4507 = func.call @stack_pop_pointer() : () -> i64
      %4508 = func.call @stack_pop_pointer() : () -> i64
      %4509 = func.call @cc_cons(%4508, %4507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4509) : (i64) -> ()
      %4510 = func.call @stack_pop_pointer() : () -> i64
      %4511 = func.call @stack_pop_pointer() : () -> i64
      %4512 = func.call @cc_cons(%4511, %4510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4512) : (i64) -> ()
      %4513 = func.call @stack_pop_pointer() : () -> i64
      %4514 = func.call @stack_pop_pointer() : () -> i64
      %4515 = func.call @cc_cons(%4514, %4513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4516 = func.call @stack_pop_pointer() : () -> i64
      %4517 = func.call @stack_pop_pointer() : () -> i64
      %4518 = func.call @cc_cons(%4517, %4516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4518) : (i64) -> ()
      %4519 = func.call @stack_pop_pointer() : () -> i64
      %4520 = func.call @stack_pop_pointer() : () -> i64
      %4521 = func.call @cc_cons(%4520, %4519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4521) : (i64) -> ()
      %4522 = func.call @stack_pop_pointer() : () -> i64
      %4523 = func.call @stack_pop_pointer() : () -> i64
      %4524 = func.call @cc_cons(%4523, %4522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4525 = func.call @stack_pop_pointer() : () -> i64
      %4526 = func.call @stack_pop_pointer() : () -> i64
      %4527 = func.call @cc_cons(%4526, %4525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4527) : (i64) -> ()
      %4528 = func.call @stack_pop_pointer() : () -> i64
      %4529 = func.call @stack_pop_pointer() : () -> i64
      %4530 = func.call @cc_cons(%4529, %4528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4530) : (i64) -> ()
      %4531 = func.call @stack_pop_pointer() : () -> i64
      %4532 = func.call @stack_pop_pointer() : () -> i64
      %4533 = func.call @cc_cons(%4532, %4531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4533) : (i64) -> ()
      %4534 = func.call @stack_pop_pointer() : () -> i64
      %4737 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4738 = arith.constant 33 : i64
      %4739 = func.call @cc_make_symbol(%4737, %4738) : (!llvm.ptr, i64) -> i64
      %4740 = func.call @cc_persistent_root_value(%4739) : (i64) -> i64
      func.call @stack_push_pointer(%4740) : (i64) -> ()
      %4741 = arith.constant 97047688511525 : i64
      %4742 = arith.constant 1 : i64
      %4743 = func.call @cc_make_closure(%4741, %4742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4743) : (i64) -> ()
      %4744 = func.call @stack_pop_pointer() : () -> i64
      %4745 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4746 = arith.constant 1 : i64
      %4747 = func.call @cc_make_string(%4745, %4746) : (!llvm.ptr, i64) -> i64
      %4748 = func.call @cc_nil_value() : () -> i64
      %4749 = func.call @cc_intern(%4747, %4748) : (i64, i64) -> i64
      %4750 = func.call @cc_nil_value() : () -> i64
      %4751 = func.call @cc_cons(%4749, %4750) : (i64, i64) -> i64
      %4752 = func.call @cc_values_pack(%4751) : (i64) -> i64
      func.call @stack_push_pointer(%4749) : (i64) -> ()
      %4753 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4754 = arith.constant 1 : i64
      %4755 = func.call @cc_make_string(%4753, %4754) : (!llvm.ptr, i64) -> i64
      %4756 = func.call @cc_nil_value() : () -> i64
      %4757 = func.call @cc_intern(%4755, %4756) : (i64, i64) -> i64
      %4758 = func.call @cc_nil_value() : () -> i64
      %4759 = func.call @cc_cons(%4757, %4758) : (i64, i64) -> i64
      %4760 = func.call @cc_values_pack(%4759) : (i64) -> i64
      func.call @stack_push_pointer(%4757) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4761 = func.call @stack_pop_pointer() : () -> i64
      %4762 = func.call @stack_pop_pointer() : () -> i64
      %4763 = func.call @cc_cons(%4762, %4761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4763) : (i64) -> ()
      %4764 = func.call @stack_pop_pointer() : () -> i64
      %4765 = func.call @stack_pop_pointer() : () -> i64
      %4766 = func.call @cc_cons(%4765, %4764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4766) : (i64) -> ()
      %4767 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4767) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4768 = func.call @stack_pop_pointer() : () -> i64
      %4769 = func.call @stack_pop_pointer() : () -> i64
      %4770 = func.call @cc_cons(%4769, %4768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4770) : (i64) -> ()
      %4771 = func.call @stack_pop_pointer() : () -> i64
      %4772 = func.call @stack_pop_pointer() : () -> i64
      %4773 = func.call @cc_cons(%4772, %4771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4773) : (i64) -> ()
      %4774 = func.call @stack_pop_pointer() : () -> i64
      %4775 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4776 = arith.constant 11 : i64
      %4777 = func.call @cc_make_string(%4775, %4776) : (!llvm.ptr, i64) -> i64
      %4778 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4779 = arith.constant 7 : i64
      %4780 = func.call @cc_make_string(%4778, %4779) : (!llvm.ptr, i64) -> i64
      %4781 = func.call @cc_intern(%4777, %4780) : (i64, i64) -> i64
      %4782 = func.call @cc_nil_value() : () -> i64
      %4783 = func.call @cc_cons(%4781, %4782) : (i64, i64) -> i64
      %4784 = func.call @cc_values_pack(%4783) : (i64) -> i64
      func.call @stack_push_pointer(%4781) : (i64) -> ()
      %4785 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4786 = func.call @stack_pop_pointer() : () -> i64
      %4787 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4788 = arith.constant 4 : i64
      %4789 = func.call @cc_make_string(%4787, %4788) : (!llvm.ptr, i64) -> i64
      %4790 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4791 = arith.constant 7 : i64
      %4792 = func.call @cc_make_string(%4790, %4791) : (!llvm.ptr, i64) -> i64
      %4793 = func.call @cc_intern(%4789, %4792) : (i64, i64) -> i64
      %4794 = func.call @cc_nil_value() : () -> i64
      %4795 = func.call @cc_cons(%4793, %4794) : (i64, i64) -> i64
      %4796 = func.call @cc_values_pack(%4795) : (i64) -> i64
      func.call @stack_push_pointer(%4793) : (i64) -> ()
      %4797 = func.call @stack_pop_pointer() : () -> i64
      %4798 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4799 = arith.constant 6 : i64
      %4800 = func.call @cc_make_string(%4798, %4799) : (!llvm.ptr, i64) -> i64
      %4801 = func.call @cc_nil_value() : () -> i64
      %4802 = func.call @cc_intern(%4800, %4801) : (i64, i64) -> i64
      %4803 = func.call @cc_nil_value() : () -> i64
      %4804 = func.call @cc_cons(%4802, %4803) : (i64, i64) -> i64
      %4805 = func.call @cc_values_pack(%4804) : (i64) -> i64
      func.call @stack_push_pointer(%4802) : (i64) -> ()
      %4806 = func.call @stack_pop_pointer() : () -> i64
      %4807 = func.call @cc_nil_value() : () -> i64
      %4808 = func.call @cc_errorp(%4258) : (i64) -> i64
      %4809 = arith.cmpi ne, %4808, %4807 : i64
      %4810 = arith.cmpi eq, %4807, %4807 : i64
      %4811 = arith.andi %4809, %4810 : i1
      %4812 = scf.if %4811 -> (i64) {
        scf.yield %4258 : i64
      } else {
        scf.yield %4807 : i64
      }
      %4813 = func.call @cc_errorp(%4534) : (i64) -> i64
      %4814 = arith.cmpi ne, %4813, %4807 : i64
      %4815 = arith.cmpi eq, %4812, %4807 : i64
      %4816 = arith.andi %4814, %4815 : i1
      %4817 = scf.if %4816 -> (i64) {
        scf.yield %4534 : i64
      } else {
        scf.yield %4812 : i64
      }
      %4818 = func.call @cc_errorp(%4744) : (i64) -> i64
      %4819 = arith.cmpi ne, %4818, %4807 : i64
      %4820 = arith.cmpi eq, %4817, %4807 : i64
      %4821 = arith.andi %4819, %4820 : i1
      %4822 = scf.if %4821 -> (i64) {
        scf.yield %4744 : i64
      } else {
        scf.yield %4817 : i64
      }
      %4823 = func.call @cc_errorp(%4774) : (i64) -> i64
      %4824 = arith.cmpi ne, %4823, %4807 : i64
      %4825 = arith.cmpi eq, %4822, %4807 : i64
      %4826 = arith.andi %4824, %4825 : i1
      %4827 = scf.if %4826 -> (i64) {
        scf.yield %4774 : i64
      } else {
        scf.yield %4822 : i64
      }
      %4828 = func.call @cc_errorp(%4785) : (i64) -> i64
      %4829 = arith.cmpi ne, %4828, %4807 : i64
      %4830 = arith.cmpi eq, %4827, %4807 : i64
      %4831 = arith.andi %4829, %4830 : i1
      %4832 = scf.if %4831 -> (i64) {
        scf.yield %4785 : i64
      } else {
        scf.yield %4827 : i64
      }
      %4833 = func.call @cc_errorp(%4786) : (i64) -> i64
      %4834 = arith.cmpi ne, %4833, %4807 : i64
      %4835 = arith.cmpi eq, %4832, %4807 : i64
      %4836 = arith.andi %4834, %4835 : i1
      %4837 = scf.if %4836 -> (i64) {
        scf.yield %4786 : i64
      } else {
        scf.yield %4832 : i64
      }
      %4838 = func.call @cc_errorp(%4797) : (i64) -> i64
      %4839 = arith.cmpi ne, %4838, %4807 : i64
      %4840 = arith.cmpi eq, %4837, %4807 : i64
      %4841 = arith.andi %4839, %4840 : i1
      %4842 = scf.if %4841 -> (i64) {
        scf.yield %4797 : i64
      } else {
        scf.yield %4837 : i64
      }
      %4843 = func.call @cc_errorp(%4806) : (i64) -> i64
      %4844 = arith.cmpi ne, %4843, %4807 : i64
      %4845 = arith.cmpi eq, %4842, %4807 : i64
      %4846 = arith.andi %4844, %4845 : i1
      %4847 = scf.if %4846 -> (i64) {
        scf.yield %4806 : i64
      } else {
        scf.yield %4842 : i64
      }
      %4848 = arith.cmpi ne, %4847, %4807 : i64
      scf.if %4848 {
        func.call @stack_push_pointer(%4847) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4258) : (i64) -> ()
        func.call @stack_push_pointer(%4534) : (i64) -> ()
        func.call @stack_push_pointer(%4744) : (i64) -> ()
        func.call @stack_push_pointer(%4774) : (i64) -> ()
        func.call @stack_push_pointer(%4785) : (i64) -> ()
        func.call @stack_push_pointer(%4786) : (i64) -> ()
        func.call @stack_push_pointer(%4797) : (i64) -> ()
        func.call @stack_push_pointer(%4806) : (i64) -> ()
        %4849 = llvm.mlir.addressof @str411 : !llvm.ptr
        %4850 = func.call @cc_make_function_ref_const(%4849) : (!llvm.ptr) -> i64
        %4851 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4850, %4851) : (i64, i64) -> ()
      }
      %4852 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4852 : i64
    }
    %4853 = func.call @cc_nil_value() : () -> i64
    %4854 = func.call @cc_errorp(%4249) : (i64) -> i64
    %4855 = arith.cmpi ne, %4854, %4853 : i64
    %4856 = scf.if %4855 -> (i64) {
      scf.yield %4249 : i64
    } else {
      %4857 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4858 = arith.constant 28 : i64
      %4859 = func.call @cc_make_string(%4857, %4858) : (!llvm.ptr, i64) -> i64
      %4860 = func.call @cc_nil_value() : () -> i64
      %4861 = func.call @cc_intern(%4859, %4860) : (i64, i64) -> i64
      %4862 = func.call @cc_nil_value() : () -> i64
      %4863 = func.call @cc_cons(%4861, %4862) : (i64, i64) -> i64
      %4864 = func.call @cc_values_pack(%4863) : (i64) -> i64
      func.call @stack_push_pointer(%4861) : (i64) -> ()
      %4865 = func.call @stack_pop_pointer() : () -> i64
      %4866 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4867 = arith.constant 5 : i64
      %4868 = func.call @cc_make_string(%4866, %4867) : (!llvm.ptr, i64) -> i64
      %4869 = func.call @cc_nil_value() : () -> i64
      %4870 = func.call @cc_intern(%4868, %4869) : (i64, i64) -> i64
      %4871 = func.call @cc_nil_value() : () -> i64
      %4872 = func.call @cc_cons(%4870, %4871) : (i64, i64) -> i64
      %4873 = func.call @cc_values_pack(%4872) : (i64) -> i64
      func.call @stack_push_pointer(%4870) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4874 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4875 = arith.constant 32 : i64
      %4876 = func.call @cc_make_string(%4874, %4875) : (!llvm.ptr, i64) -> i64
      %4877 = func.call @cc_nil_value() : () -> i64
      %4878 = func.call @cc_intern(%4876, %4877) : (i64, i64) -> i64
      %4879 = func.call @cc_nil_value() : () -> i64
      %4880 = func.call @cc_cons(%4878, %4879) : (i64, i64) -> i64
      %4881 = func.call @cc_values_pack(%4880) : (i64) -> i64
      func.call @stack_push_pointer(%4878) : (i64) -> ()
      %4882 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4883 = arith.constant 6 : i64
      %4884 = func.call @cc_make_string(%4882, %4883) : (!llvm.ptr, i64) -> i64
      %4885 = func.call @cc_nil_value() : () -> i64
      %4886 = func.call @cc_intern(%4884, %4885) : (i64, i64) -> i64
      %4887 = func.call @cc_nil_value() : () -> i64
      %4888 = func.call @cc_cons(%4886, %4887) : (i64, i64) -> i64
      %4889 = func.call @cc_values_pack(%4888) : (i64) -> i64
      func.call @stack_push_pointer(%4886) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4890 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4891 = arith.constant 10 : i64
      %4892 = func.call @cc_make_string(%4890, %4891) : (!llvm.ptr, i64) -> i64
      %4893 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4894 = arith.constant 11 : i64
      %4895 = func.call @cc_make_string(%4893, %4894) : (!llvm.ptr, i64) -> i64
      %4896 = func.call @cc_intern(%4892, %4895) : (i64, i64) -> i64
      %4897 = func.call @cc_nil_value() : () -> i64
      %4898 = func.call @cc_cons(%4896, %4897) : (i64, i64) -> i64
      %4899 = func.call @cc_values_pack(%4898) : (i64) -> i64
      func.call @stack_push_pointer(%4896) : (i64) -> ()
      %4900 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4901 = arith.constant 5 : i64
      %4902 = func.call @cc_make_string(%4900, %4901) : (!llvm.ptr, i64) -> i64
      %4903 = func.call @cc_nil_value() : () -> i64
      %4904 = func.call @cc_intern(%4902, %4903) : (i64, i64) -> i64
      %4905 = func.call @cc_nil_value() : () -> i64
      %4906 = func.call @cc_cons(%4904, %4905) : (i64, i64) -> i64
      %4907 = func.call @cc_values_pack(%4906) : (i64) -> i64
      func.call @stack_push_pointer(%4904) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4908 = func.call @stack_pop_pointer() : () -> i64
      %4909 = func.call @stack_pop_pointer() : () -> i64
      %4910 = func.call @cc_cons(%4909, %4908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4910) : (i64) -> ()
      %4911 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4912 = arith.constant 9 : i64
      %4913 = func.call @cc_make_string(%4911, %4912) : (!llvm.ptr, i64) -> i64
      %4914 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4915 = arith.constant 11 : i64
      %4916 = func.call @cc_make_string(%4914, %4915) : (!llvm.ptr, i64) -> i64
      %4917 = func.call @cc_intern(%4913, %4916) : (i64, i64) -> i64
      %4918 = func.call @cc_nil_value() : () -> i64
      %4919 = func.call @cc_cons(%4917, %4918) : (i64, i64) -> i64
      %4920 = func.call @cc_values_pack(%4919) : (i64) -> i64
      func.call @stack_push_pointer(%4917) : (i64) -> ()
      %4921 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4922 = arith.constant 6 : i64
      %4923 = func.call @cc_make_string(%4921, %4922) : (!llvm.ptr, i64) -> i64
      %4924 = func.call @cc_nil_value() : () -> i64
      %4925 = func.call @cc_intern(%4923, %4924) : (i64, i64) -> i64
      %4926 = func.call @cc_nil_value() : () -> i64
      %4927 = func.call @cc_cons(%4925, %4926) : (i64, i64) -> i64
      %4928 = func.call @cc_values_pack(%4927) : (i64) -> i64
      func.call @stack_push_pointer(%4925) : (i64) -> ()
      %4929 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4930 = arith.constant 5 : i64
      %4931 = func.call @cc_make_string(%4929, %4930) : (!llvm.ptr, i64) -> i64
      %4932 = func.call @cc_nil_value() : () -> i64
      %4933 = func.call @cc_intern(%4931, %4932) : (i64, i64) -> i64
      %4934 = func.call @cc_nil_value() : () -> i64
      %4935 = func.call @cc_cons(%4933, %4934) : (i64, i64) -> i64
      %4936 = func.call @cc_values_pack(%4935) : (i64) -> i64
      func.call @stack_push_pointer(%4933) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4937 = func.call @stack_pop_pointer() : () -> i64
      %4938 = func.call @stack_pop_pointer() : () -> i64
      %4939 = func.call @cc_cons(%4938, %4937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4939) : (i64) -> ()
      %4940 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4941 = arith.constant 2 : i64
      %4942 = func.call @cc_make_string(%4940, %4941) : (!llvm.ptr, i64) -> i64
      %4943 = func.call @cc_nil_value() : () -> i64
      %4944 = func.call @cc_intern(%4942, %4943) : (i64, i64) -> i64
      %4945 = func.call @cc_nil_value() : () -> i64
      %4946 = func.call @cc_cons(%4944, %4945) : (i64, i64) -> i64
      %4947 = func.call @cc_values_pack(%4946) : (i64) -> i64
      func.call @stack_push_pointer(%4944) : (i64) -> ()
      %4948 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4949 = arith.constant 2 : i64
      %4950 = func.call @cc_make_string(%4948, %4949) : (!llvm.ptr, i64) -> i64
      %4951 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4952 = arith.constant 11 : i64
      %4953 = func.call @cc_make_string(%4951, %4952) : (!llvm.ptr, i64) -> i64
      %4954 = func.call @cc_intern(%4950, %4953) : (i64, i64) -> i64
      %4955 = func.call @cc_nil_value() : () -> i64
      %4956 = func.call @cc_cons(%4954, %4955) : (i64, i64) -> i64
      %4957 = func.call @cc_values_pack(%4956) : (i64) -> i64
      func.call @stack_push_pointer(%4954) : (i64) -> ()
      %4958 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4959 = arith.constant 19 : i64
      %4960 = func.call @cc_make_string(%4958, %4959) : (!llvm.ptr, i64) -> i64
      %4961 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4962 = arith.constant 11 : i64
      %4963 = func.call @cc_make_string(%4961, %4962) : (!llvm.ptr, i64) -> i64
      %4964 = func.call @cc_intern(%4960, %4963) : (i64, i64) -> i64
      %4965 = func.call @cc_nil_value() : () -> i64
      %4966 = func.call @cc_cons(%4964, %4965) : (i64, i64) -> i64
      %4967 = func.call @cc_values_pack(%4966) : (i64) -> i64
      func.call @stack_push_pointer(%4964) : (i64) -> ()
      %4968 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4969 = arith.constant 5 : i64
      %4970 = func.call @cc_make_string(%4968, %4969) : (!llvm.ptr, i64) -> i64
      %4971 = func.call @cc_nil_value() : () -> i64
      %4972 = func.call @cc_intern(%4970, %4971) : (i64, i64) -> i64
      %4973 = func.call @cc_nil_value() : () -> i64
      %4974 = func.call @cc_cons(%4972, %4973) : (i64, i64) -> i64
      %4975 = func.call @cc_values_pack(%4974) : (i64) -> i64
      func.call @stack_push_pointer(%4972) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4976 = func.call @stack_pop_pointer() : () -> i64
      %4977 = func.call @stack_pop_pointer() : () -> i64
      %4978 = func.call @cc_cons(%4977, %4976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4978) : (i64) -> ()
      %4979 = func.call @stack_pop_pointer() : () -> i64
      %4980 = func.call @stack_pop_pointer() : () -> i64
      %4981 = func.call @cc_cons(%4980, %4979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4981) : (i64) -> ()
      %4982 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4982) : (i64) -> ()
      %4983 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4984 = arith.constant 32 : i64
      %4985 = func.call @cc_make_string(%4983, %4984) : (!llvm.ptr, i64) -> i64
      %4986 = func.call @cc_nil_value() : () -> i64
      %4987 = func.call @cc_intern(%4985, %4986) : (i64, i64) -> i64
      %4988 = func.call @cc_nil_value() : () -> i64
      %4989 = func.call @cc_cons(%4987, %4988) : (i64, i64) -> i64
      %4990 = func.call @cc_values_pack(%4989) : (i64) -> i64
      func.call @stack_push_pointer(%4987) : (i64) -> ()
      %4991 = func.call @stack_pop_pointer() : () -> i64
      %4992 = func.call @stack_pop_pointer() : () -> i64
      %4993 = func.call @cc_cons(%4991, %4992) : (i64, i64) -> i64
      %4994 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4995 = arith.constant 5 : i64
      %4996 = func.call @cc_make_string(%4994, %4995) : (!llvm.ptr, i64) -> i64
      %4997 = func.call @cc_nil_value() : () -> i64
      %4998 = func.call @cc_intern(%4996, %4997) : (i64, i64) -> i64
      %4999 = func.call @cc_nil_value() : () -> i64
      %5000 = func.call @cc_cons(%4998, %4999) : (i64, i64) -> i64
      %5001 = func.call @cc_values_pack(%5000) : (i64) -> i64
      %5002 = func.call @cc_cons(%4998, %4993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5002) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5003 = func.call @stack_pop_pointer() : () -> i64
      %5004 = func.call @stack_pop_pointer() : () -> i64
      %5005 = func.call @cc_cons(%5004, %5003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5005) : (i64) -> ()
      %5006 = func.call @stack_pop_pointer() : () -> i64
      %5007 = func.call @stack_pop_pointer() : () -> i64
      %5008 = func.call @cc_cons(%5007, %5006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5008) : (i64) -> ()
      %5009 = func.call @stack_pop_pointer() : () -> i64
      %5010 = func.call @stack_pop_pointer() : () -> i64
      %5011 = func.call @cc_cons(%5010, %5009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5011) : (i64) -> ()
      %5012 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5013 = arith.constant 5 : i64
      %5014 = func.call @cc_make_string(%5012, %5013) : (!llvm.ptr, i64) -> i64
      %5015 = func.call @cc_nil_value() : () -> i64
      %5016 = func.call @cc_intern(%5014, %5015) : (i64, i64) -> i64
      %5017 = func.call @cc_nil_value() : () -> i64
      %5018 = func.call @cc_cons(%5016, %5017) : (i64, i64) -> i64
      %5019 = func.call @cc_values_pack(%5018) : (i64) -> i64
      func.call @stack_push_pointer(%5016) : (i64) -> ()
      %5020 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5021 = arith.constant 11 : i64
      %5022 = func.call @cc_make_string(%5020, %5021) : (!llvm.ptr, i64) -> i64
      %5023 = func.call @cc_nil_value() : () -> i64
      %5024 = func.call @cc_intern(%5022, %5023) : (i64, i64) -> i64
      %5025 = func.call @cc_nil_value() : () -> i64
      %5026 = func.call @cc_cons(%5024, %5025) : (i64, i64) -> i64
      %5027 = func.call @cc_values_pack(%5026) : (i64) -> i64
      func.call @stack_push_pointer(%5024) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5028 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5029 = arith.constant 28 : i64
      %5030 = func.call @cc_make_string(%5028, %5029) : (!llvm.ptr, i64) -> i64
      %5031 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5032 = arith.constant 11 : i64
      %5033 = func.call @cc_make_string(%5031, %5032) : (!llvm.ptr, i64) -> i64
      %5034 = func.call @cc_intern(%5030, %5033) : (i64, i64) -> i64
      %5035 = func.call @cc_nil_value() : () -> i64
      %5036 = func.call @cc_cons(%5034, %5035) : (i64, i64) -> i64
      %5037 = func.call @cc_values_pack(%5036) : (i64) -> i64
      func.call @stack_push_pointer(%5034) : (i64) -> ()
      %5038 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5039 = arith.constant 5 : i64
      %5040 = func.call @cc_make_string(%5038, %5039) : (!llvm.ptr, i64) -> i64
      %5041 = func.call @cc_nil_value() : () -> i64
      %5042 = func.call @cc_intern(%5040, %5041) : (i64, i64) -> i64
      %5043 = func.call @cc_nil_value() : () -> i64
      %5044 = func.call @cc_cons(%5042, %5043) : (i64, i64) -> i64
      %5045 = func.call @cc_values_pack(%5044) : (i64) -> i64
      func.call @stack_push_pointer(%5042) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5046 = func.call @stack_pop_pointer() : () -> i64
      %5047 = func.call @stack_pop_pointer() : () -> i64
      %5048 = func.call @cc_cons(%5047, %5046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5048) : (i64) -> ()
      %5049 = func.call @stack_pop_pointer() : () -> i64
      %5050 = func.call @stack_pop_pointer() : () -> i64
      %5051 = func.call @cc_cons(%5050, %5049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5051) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5052 = func.call @stack_pop_pointer() : () -> i64
      %5053 = func.call @stack_pop_pointer() : () -> i64
      %5054 = func.call @cc_cons(%5053, %5052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5054) : (i64) -> ()
      %5055 = func.call @stack_pop_pointer() : () -> i64
      %5056 = func.call @stack_pop_pointer() : () -> i64
      %5057 = func.call @cc_cons(%5056, %5055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5057) : (i64) -> ()
      %5058 = func.call @stack_pop_pointer() : () -> i64
      %5059 = func.call @stack_pop_pointer() : () -> i64
      %5060 = func.call @cc_cons(%5059, %5058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5060) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5061 = func.call @stack_pop_pointer() : () -> i64
      %5062 = func.call @stack_pop_pointer() : () -> i64
      %5063 = func.call @cc_cons(%5062, %5061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5063) : (i64) -> ()
      %5064 = func.call @stack_pop_pointer() : () -> i64
      %5065 = func.call @stack_pop_pointer() : () -> i64
      %5066 = func.call @cc_cons(%5065, %5064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5067 = func.call @stack_pop_pointer() : () -> i64
      %5068 = func.call @stack_pop_pointer() : () -> i64
      %5069 = func.call @cc_cons(%5068, %5067) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5069) : (i64) -> ()
      %5070 = func.call @stack_pop_pointer() : () -> i64
      %5071 = func.call @stack_pop_pointer() : () -> i64
      %5072 = func.call @cc_cons(%5071, %5070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5072) : (i64) -> ()
      %5073 = func.call @stack_pop_pointer() : () -> i64
      %5074 = func.call @stack_pop_pointer() : () -> i64
      %5075 = func.call @cc_cons(%5074, %5073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5075) : (i64) -> ()
      %5076 = func.call @stack_pop_pointer() : () -> i64
      %5077 = func.call @stack_pop_pointer() : () -> i64
      %5078 = func.call @cc_cons(%5077, %5076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5078) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5079 = func.call @stack_pop_pointer() : () -> i64
      %5080 = func.call @stack_pop_pointer() : () -> i64
      %5081 = func.call @cc_cons(%5080, %5079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5081) : (i64) -> ()
      %5082 = func.call @stack_pop_pointer() : () -> i64
      %5083 = func.call @stack_pop_pointer() : () -> i64
      %5084 = func.call @cc_cons(%5083, %5082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5084) : (i64) -> ()
      %5085 = func.call @stack_pop_pointer() : () -> i64
      %5086 = func.call @stack_pop_pointer() : () -> i64
      %5087 = func.call @cc_cons(%5086, %5085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5087) : (i64) -> ()
      %5088 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5089 = arith.constant 5 : i64
      %5090 = func.call @cc_make_string(%5088, %5089) : (!llvm.ptr, i64) -> i64
      %5091 = func.call @cc_nil_value() : () -> i64
      %5092 = func.call @cc_intern(%5090, %5091) : (i64, i64) -> i64
      %5093 = func.call @cc_nil_value() : () -> i64
      %5094 = func.call @cc_cons(%5092, %5093) : (i64, i64) -> i64
      %5095 = func.call @cc_values_pack(%5094) : (i64) -> i64
      func.call @stack_push_pointer(%5092) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5096 = func.call @stack_pop_pointer() : () -> i64
      %5097 = func.call @stack_pop_pointer() : () -> i64
      %5098 = func.call @cc_cons(%5097, %5096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5098) : (i64) -> ()
      %5099 = func.call @stack_pop_pointer() : () -> i64
      %5100 = func.call @stack_pop_pointer() : () -> i64
      %5101 = func.call @cc_cons(%5100, %5099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5101) : (i64) -> ()
      %5102 = func.call @stack_pop_pointer() : () -> i64
      %5103 = func.call @stack_pop_pointer() : () -> i64
      %5104 = func.call @cc_cons(%5103, %5102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5105 = func.call @stack_pop_pointer() : () -> i64
      %5106 = func.call @stack_pop_pointer() : () -> i64
      %5107 = func.call @cc_cons(%5106, %5105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5107) : (i64) -> ()
      %5108 = func.call @stack_pop_pointer() : () -> i64
      %5109 = func.call @stack_pop_pointer() : () -> i64
      %5110 = func.call @cc_cons(%5109, %5108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5110) : (i64) -> ()
      %5111 = func.call @stack_pop_pointer() : () -> i64
      %5112 = func.call @stack_pop_pointer() : () -> i64
      %5113 = func.call @cc_cons(%5112, %5111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5114 = func.call @stack_pop_pointer() : () -> i64
      %5115 = func.call @stack_pop_pointer() : () -> i64
      %5116 = func.call @cc_cons(%5115, %5114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5116) : (i64) -> ()
      %5117 = func.call @stack_pop_pointer() : () -> i64
      %5118 = func.call @stack_pop_pointer() : () -> i64
      %5119 = func.call @cc_cons(%5118, %5117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5119) : (i64) -> ()
      %5120 = func.call @stack_pop_pointer() : () -> i64
      %5121 = func.call @stack_pop_pointer() : () -> i64
      %5122 = func.call @cc_cons(%5121, %5120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5123 = func.call @stack_pop_pointer() : () -> i64
      %5124 = func.call @stack_pop_pointer() : () -> i64
      %5125 = func.call @cc_cons(%5124, %5123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5125) : (i64) -> ()
      %5126 = func.call @stack_pop_pointer() : () -> i64
      %5127 = func.call @stack_pop_pointer() : () -> i64
      %5128 = func.call @cc_cons(%5127, %5126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5128) : (i64) -> ()
      %5129 = func.call @stack_pop_pointer() : () -> i64
      %5130 = func.call @stack_pop_pointer() : () -> i64
      %5131 = func.call @cc_cons(%5130, %5129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5132 = func.call @stack_pop_pointer() : () -> i64
      %5133 = func.call @stack_pop_pointer() : () -> i64
      %5134 = func.call @cc_cons(%5133, %5132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5134) : (i64) -> ()
      %5135 = func.call @stack_pop_pointer() : () -> i64
      %5136 = func.call @stack_pop_pointer() : () -> i64
      %5137 = func.call @cc_cons(%5136, %5135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5137) : (i64) -> ()
      %5138 = func.call @stack_pop_pointer() : () -> i64
      %5139 = func.call @stack_pop_pointer() : () -> i64
      %5140 = func.call @cc_cons(%5139, %5138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5140) : (i64) -> ()
      %5141 = func.call @stack_pop_pointer() : () -> i64
      %5344 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5345 = arith.constant 33 : i64
      %5346 = func.call @cc_make_symbol(%5344, %5345) : (!llvm.ptr, i64) -> i64
      %5347 = func.call @cc_persistent_root_value(%5346) : (i64) -> i64
      func.call @stack_push_pointer(%5347) : (i64) -> ()
      %5348 = arith.constant 97047688511530 : i64
      %5349 = arith.constant 1 : i64
      %5350 = func.call @cc_make_closure(%5348, %5349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5350) : (i64) -> ()
      %5351 = func.call @stack_pop_pointer() : () -> i64
      %5352 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5353 = arith.constant 32 : i64
      %5354 = func.call @cc_make_string(%5352, %5353) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5354) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5355 = func.call @stack_pop_pointer() : () -> i64
      %5356 = func.call @stack_pop_pointer() : () -> i64
      %5357 = func.call @cc_cons(%5356, %5355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5357) : (i64) -> ()
      %5358 = func.call @stack_pop_pointer() : () -> i64
      %5359 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5360 = arith.constant 11 : i64
      %5361 = func.call @cc_make_string(%5359, %5360) : (!llvm.ptr, i64) -> i64
      %5362 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5363 = arith.constant 7 : i64
      %5364 = func.call @cc_make_string(%5362, %5363) : (!llvm.ptr, i64) -> i64
      %5365 = func.call @cc_intern(%5361, %5364) : (i64, i64) -> i64
      %5366 = func.call @cc_nil_value() : () -> i64
      %5367 = func.call @cc_cons(%5365, %5366) : (i64, i64) -> i64
      %5368 = func.call @cc_values_pack(%5367) : (i64) -> i64
      func.call @stack_push_pointer(%5365) : (i64) -> ()
      %5369 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5370 = func.call @stack_pop_pointer() : () -> i64
      %5371 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5372 = arith.constant 4 : i64
      %5373 = func.call @cc_make_string(%5371, %5372) : (!llvm.ptr, i64) -> i64
      %5374 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5375 = arith.constant 7 : i64
      %5376 = func.call @cc_make_string(%5374, %5375) : (!llvm.ptr, i64) -> i64
      %5377 = func.call @cc_intern(%5373, %5376) : (i64, i64) -> i64
      %5378 = func.call @cc_nil_value() : () -> i64
      %5379 = func.call @cc_cons(%5377, %5378) : (i64, i64) -> i64
      %5380 = func.call @cc_values_pack(%5379) : (i64) -> i64
      func.call @stack_push_pointer(%5377) : (i64) -> ()
      %5381 = func.call @stack_pop_pointer() : () -> i64
      %5382 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5383 = arith.constant 6 : i64
      %5384 = func.call @cc_make_string(%5382, %5383) : (!llvm.ptr, i64) -> i64
      %5385 = func.call @cc_nil_value() : () -> i64
      %5386 = func.call @cc_intern(%5384, %5385) : (i64, i64) -> i64
      %5387 = func.call @cc_nil_value() : () -> i64
      %5388 = func.call @cc_cons(%5386, %5387) : (i64, i64) -> i64
      %5389 = func.call @cc_values_pack(%5388) : (i64) -> i64
      func.call @stack_push_pointer(%5386) : (i64) -> ()
      %5390 = func.call @stack_pop_pointer() : () -> i64
      %5391 = func.call @cc_nil_value() : () -> i64
      %5392 = func.call @cc_errorp(%4865) : (i64) -> i64
      %5393 = arith.cmpi ne, %5392, %5391 : i64
      %5394 = arith.cmpi eq, %5391, %5391 : i64
      %5395 = arith.andi %5393, %5394 : i1
      %5396 = scf.if %5395 -> (i64) {
        scf.yield %4865 : i64
      } else {
        scf.yield %5391 : i64
      }
      %5397 = func.call @cc_errorp(%5141) : (i64) -> i64
      %5398 = arith.cmpi ne, %5397, %5391 : i64
      %5399 = arith.cmpi eq, %5396, %5391 : i64
      %5400 = arith.andi %5398, %5399 : i1
      %5401 = scf.if %5400 -> (i64) {
        scf.yield %5141 : i64
      } else {
        scf.yield %5396 : i64
      }
      %5402 = func.call @cc_errorp(%5351) : (i64) -> i64
      %5403 = arith.cmpi ne, %5402, %5391 : i64
      %5404 = arith.cmpi eq, %5401, %5391 : i64
      %5405 = arith.andi %5403, %5404 : i1
      %5406 = scf.if %5405 -> (i64) {
        scf.yield %5351 : i64
      } else {
        scf.yield %5401 : i64
      }
      %5407 = func.call @cc_errorp(%5358) : (i64) -> i64
      %5408 = arith.cmpi ne, %5407, %5391 : i64
      %5409 = arith.cmpi eq, %5406, %5391 : i64
      %5410 = arith.andi %5408, %5409 : i1
      %5411 = scf.if %5410 -> (i64) {
        scf.yield %5358 : i64
      } else {
        scf.yield %5406 : i64
      }
      %5412 = func.call @cc_errorp(%5369) : (i64) -> i64
      %5413 = arith.cmpi ne, %5412, %5391 : i64
      %5414 = arith.cmpi eq, %5411, %5391 : i64
      %5415 = arith.andi %5413, %5414 : i1
      %5416 = scf.if %5415 -> (i64) {
        scf.yield %5369 : i64
      } else {
        scf.yield %5411 : i64
      }
      %5417 = func.call @cc_errorp(%5370) : (i64) -> i64
      %5418 = arith.cmpi ne, %5417, %5391 : i64
      %5419 = arith.cmpi eq, %5416, %5391 : i64
      %5420 = arith.andi %5418, %5419 : i1
      %5421 = scf.if %5420 -> (i64) {
        scf.yield %5370 : i64
      } else {
        scf.yield %5416 : i64
      }
      %5422 = func.call @cc_errorp(%5381) : (i64) -> i64
      %5423 = arith.cmpi ne, %5422, %5391 : i64
      %5424 = arith.cmpi eq, %5421, %5391 : i64
      %5425 = arith.andi %5423, %5424 : i1
      %5426 = scf.if %5425 -> (i64) {
        scf.yield %5381 : i64
      } else {
        scf.yield %5421 : i64
      }
      %5427 = func.call @cc_errorp(%5390) : (i64) -> i64
      %5428 = arith.cmpi ne, %5427, %5391 : i64
      %5429 = arith.cmpi eq, %5426, %5391 : i64
      %5430 = arith.andi %5428, %5429 : i1
      %5431 = scf.if %5430 -> (i64) {
        scf.yield %5390 : i64
      } else {
        scf.yield %5426 : i64
      }
      %5432 = arith.cmpi ne, %5431, %5391 : i64
      scf.if %5432 {
        func.call @stack_push_pointer(%5431) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4865) : (i64) -> ()
        func.call @stack_push_pointer(%5141) : (i64) -> ()
        func.call @stack_push_pointer(%5351) : (i64) -> ()
        func.call @stack_push_pointer(%5358) : (i64) -> ()
        func.call @stack_push_pointer(%5369) : (i64) -> ()
        func.call @stack_push_pointer(%5370) : (i64) -> ()
        func.call @stack_push_pointer(%5381) : (i64) -> ()
        func.call @stack_push_pointer(%5390) : (i64) -> ()
        %5433 = llvm.mlir.addressof @str458 : !llvm.ptr
        %5434 = func.call @cc_make_function_ref_const(%5433) : (!llvm.ptr) -> i64
        %5435 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5434, %5435) : (i64, i64) -> ()
      }
      %5436 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5436 : i64
    }
    %5437 = func.call @cc_nil_value() : () -> i64
    %5438 = func.call @cc_errorp(%4856) : (i64) -> i64
    %5439 = arith.cmpi ne, %5438, %5437 : i64
    %5440 = scf.if %5439 -> (i64) {
      scf.yield %4856 : i64
    } else {
      %5441 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5442 = arith.constant 28 : i64
      %5443 = func.call @cc_make_string(%5441, %5442) : (!llvm.ptr, i64) -> i64
      %5444 = func.call @cc_nil_value() : () -> i64
      %5445 = func.call @cc_intern(%5443, %5444) : (i64, i64) -> i64
      %5446 = func.call @cc_nil_value() : () -> i64
      %5447 = func.call @cc_cons(%5445, %5446) : (i64, i64) -> i64
      %5448 = func.call @cc_values_pack(%5447) : (i64) -> i64
      func.call @stack_push_pointer(%5445) : (i64) -> ()
      %5449 = func.call @stack_pop_pointer() : () -> i64
      %5450 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5451 = arith.constant 3 : i64
      %5452 = func.call @cc_make_string(%5450, %5451) : (!llvm.ptr, i64) -> i64
      %5453 = func.call @cc_nil_value() : () -> i64
      %5454 = func.call @cc_intern(%5452, %5453) : (i64, i64) -> i64
      %5455 = func.call @cc_nil_value() : () -> i64
      %5456 = func.call @cc_cons(%5454, %5455) : (i64, i64) -> i64
      %5457 = func.call @cc_values_pack(%5456) : (i64) -> i64
      func.call @stack_push_pointer(%5454) : (i64) -> ()
      %5458 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5459 = arith.constant 3 : i64
      %5460 = func.call @cc_make_string(%5458, %5459) : (!llvm.ptr, i64) -> i64
      %5461 = func.call @cc_nil_value() : () -> i64
      %5462 = func.call @cc_intern(%5460, %5461) : (i64, i64) -> i64
      %5463 = func.call @cc_nil_value() : () -> i64
      %5464 = func.call @cc_cons(%5462, %5463) : (i64, i64) -> i64
      %5465 = func.call @cc_values_pack(%5464) : (i64) -> i64
      func.call @stack_push_pointer(%5462) : (i64) -> ()
      %5466 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5467 = arith.constant 5 : i64
      %5468 = func.call @cc_make_string(%5466, %5467) : (!llvm.ptr, i64) -> i64
      %5469 = func.call @cc_nil_value() : () -> i64
      %5470 = func.call @cc_intern(%5468, %5469) : (i64, i64) -> i64
      %5471 = func.call @cc_nil_value() : () -> i64
      %5472 = func.call @cc_cons(%5470, %5471) : (i64, i64) -> i64
      %5473 = func.call @cc_values_pack(%5472) : (i64) -> i64
      func.call @stack_push_pointer(%5470) : (i64) -> ()
      %5474 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5475 = arith.constant 7 : i64
      %5476 = func.call @cc_make_string(%5474, %5475) : (!llvm.ptr, i64) -> i64
      %5477 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5478 = arith.constant 11 : i64
      %5479 = func.call @cc_make_string(%5477, %5478) : (!llvm.ptr, i64) -> i64
      %5480 = func.call @cc_intern(%5476, %5479) : (i64, i64) -> i64
      %5481 = func.call @cc_nil_value() : () -> i64
      %5482 = func.call @cc_cons(%5480, %5481) : (i64, i64) -> i64
      %5483 = func.call @cc_values_pack(%5482) : (i64) -> i64
      func.call @stack_push_pointer(%5480) : (i64) -> ()
      %5484 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5485 = arith.constant 11 : i64
      %5486 = func.call @cc_make_string(%5484, %5485) : (!llvm.ptr, i64) -> i64
      %5487 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5488 = arith.constant 3 : i64
      %5489 = func.call @cc_make_string(%5487, %5488) : (!llvm.ptr, i64) -> i64
      %5490 = func.call @cc_intern(%5486, %5489) : (i64, i64) -> i64
      %5491 = func.call @cc_nil_value() : () -> i64
      %5492 = func.call @cc_cons(%5490, %5491) : (i64, i64) -> i64
      %5493 = func.call @cc_values_pack(%5492) : (i64) -> i64
      func.call @stack_push_pointer(%5490) : (i64) -> ()
      %5494 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5494) : (i64) -> ()
      %5495 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5496 = arith.constant 6 : i64
      %5497 = func.call @cc_make_string(%5495, %5496) : (!llvm.ptr, i64) -> i64
      %5498 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5499 = arith.constant 11 : i64
      %5500 = func.call @cc_make_string(%5498, %5499) : (!llvm.ptr, i64) -> i64
      %5501 = func.call @cc_intern(%5497, %5500) : (i64, i64) -> i64
      %5502 = func.call @cc_nil_value() : () -> i64
      %5503 = func.call @cc_cons(%5501, %5502) : (i64, i64) -> i64
      %5504 = func.call @cc_values_pack(%5503) : (i64) -> i64
      func.call @stack_push_pointer(%5501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5505 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5506 = arith.constant 5 : i64
      %5507 = func.call @cc_make_string(%5505, %5506) : (!llvm.ptr, i64) -> i64
      %5508 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5509 = arith.constant 11 : i64
      %5510 = func.call @cc_make_string(%5508, %5509) : (!llvm.ptr, i64) -> i64
      %5511 = func.call @cc_intern(%5507, %5510) : (i64, i64) -> i64
      %5512 = func.call @cc_nil_value() : () -> i64
      %5513 = func.call @cc_cons(%5511, %5512) : (i64, i64) -> i64
      %5514 = func.call @cc_values_pack(%5513) : (i64) -> i64
      func.call @stack_push_pointer(%5511) : (i64) -> ()
      %5515 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5516 = arith.constant 3 : i64
      %5517 = func.call @cc_make_string(%5515, %5516) : (!llvm.ptr, i64) -> i64
      %5518 = func.call @cc_nil_value() : () -> i64
      %5519 = func.call @cc_intern(%5517, %5518) : (i64, i64) -> i64
      %5520 = func.call @cc_nil_value() : () -> i64
      %5521 = func.call @cc_cons(%5519, %5520) : (i64, i64) -> i64
      %5522 = func.call @cc_values_pack(%5521) : (i64) -> i64
      func.call @stack_push_pointer(%5519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5523 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5524 = arith.constant 3 : i64
      %5525 = func.call @cc_make_string(%5523, %5524) : (!llvm.ptr, i64) -> i64
      %5526 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5527 = arith.constant 11 : i64
      %5528 = func.call @cc_make_string(%5526, %5527) : (!llvm.ptr, i64) -> i64
      %5529 = func.call @cc_intern(%5525, %5528) : (i64, i64) -> i64
      %5530 = func.call @cc_nil_value() : () -> i64
      %5531 = func.call @cc_cons(%5529, %5530) : (i64, i64) -> i64
      %5532 = func.call @cc_values_pack(%5531) : (i64) -> i64
      func.call @stack_push_pointer(%5529) : (i64) -> ()
      %5533 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5534 = arith.constant 6 : i64
      %5535 = func.call @cc_make_string(%5533, %5534) : (!llvm.ptr, i64) -> i64
      %5536 = func.call @cc_nil_value() : () -> i64
      %5537 = func.call @cc_intern(%5535, %5536) : (i64, i64) -> i64
      %5538 = func.call @cc_nil_value() : () -> i64
      %5539 = func.call @cc_cons(%5537, %5538) : (i64, i64) -> i64
      %5540 = func.call @cc_values_pack(%5539) : (i64) -> i64
      func.call @stack_push_pointer(%5537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5541 = func.call @stack_pop_pointer() : () -> i64
      %5542 = func.call @stack_pop_pointer() : () -> i64
      %5543 = func.call @cc_cons(%5542, %5541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5543) : (i64) -> ()
      %5544 = func.call @stack_pop_pointer() : () -> i64
      %5545 = func.call @stack_pop_pointer() : () -> i64
      %5546 = func.call @cc_cons(%5545, %5544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5547 = func.call @stack_pop_pointer() : () -> i64
      %5548 = func.call @stack_pop_pointer() : () -> i64
      %5549 = func.call @cc_cons(%5548, %5547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5549) : (i64) -> ()
      %5550 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5551 = arith.constant 13 : i64
      %5552 = func.call @cc_make_string(%5550, %5551) : (!llvm.ptr, i64) -> i64
      %5553 = llvm.mlir.addressof @str476 : !llvm.ptr
      %5554 = arith.constant 11 : i64
      %5555 = func.call @cc_make_string(%5553, %5554) : (!llvm.ptr, i64) -> i64
      %5556 = func.call @cc_intern(%5552, %5555) : (i64, i64) -> i64
      %5557 = func.call @cc_nil_value() : () -> i64
      %5558 = func.call @cc_cons(%5556, %5557) : (i64, i64) -> i64
      %5559 = func.call @cc_values_pack(%5558) : (i64) -> i64
      func.call @stack_push_pointer(%5556) : (i64) -> ()
      %5560 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5561 = arith.constant 6 : i64
      %5562 = func.call @cc_make_string(%5560, %5561) : (!llvm.ptr, i64) -> i64
      %5563 = llvm.mlir.addressof @str478 : !llvm.ptr
      %5564 = arith.constant 11 : i64
      %5565 = func.call @cc_make_string(%5563, %5564) : (!llvm.ptr, i64) -> i64
      %5566 = func.call @cc_intern(%5562, %5565) : (i64, i64) -> i64
      %5567 = func.call @cc_nil_value() : () -> i64
      %5568 = func.call @cc_cons(%5566, %5567) : (i64, i64) -> i64
      %5569 = func.call @cc_values_pack(%5568) : (i64) -> i64
      func.call @stack_push_pointer(%5566) : (i64) -> ()
      %5570 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5571 = arith.constant 5 : i64
      %5572 = func.call @cc_make_string(%5570, %5571) : (!llvm.ptr, i64) -> i64
      %5573 = func.call @cc_nil_value() : () -> i64
      %5574 = func.call @cc_intern(%5572, %5573) : (i64, i64) -> i64
      %5575 = func.call @cc_nil_value() : () -> i64
      %5576 = func.call @cc_cons(%5574, %5575) : (i64, i64) -> i64
      %5577 = func.call @cc_values_pack(%5576) : (i64) -> i64
      func.call @stack_push_pointer(%5574) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5578 = func.call @stack_pop_pointer() : () -> i64
      %5579 = func.call @stack_pop_pointer() : () -> i64
      %5580 = func.call @cc_cons(%5579, %5578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5580) : (i64) -> ()
      %5581 = llvm.mlir.addressof @str480 : !llvm.ptr
      %5582 = arith.constant 4 : i64
      %5583 = func.call @cc_make_string(%5581, %5582) : (!llvm.ptr, i64) -> i64
      %5584 = llvm.mlir.addressof @str481 : !llvm.ptr
      %5585 = arith.constant 11 : i64
      %5586 = func.call @cc_make_string(%5584, %5585) : (!llvm.ptr, i64) -> i64
      %5587 = func.call @cc_intern(%5583, %5586) : (i64, i64) -> i64
      %5588 = func.call @cc_nil_value() : () -> i64
      %5589 = func.call @cc_cons(%5587, %5588) : (i64, i64) -> i64
      %5590 = func.call @cc_values_pack(%5589) : (i64) -> i64
      func.call @stack_push_pointer(%5587) : (i64) -> ()
      %5591 = llvm.mlir.addressof @str482 : !llvm.ptr
      %5592 = arith.constant 2 : i64
      %5593 = func.call @cc_make_string(%5591, %5592) : (!llvm.ptr, i64) -> i64
      %5594 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5595 = arith.constant 11 : i64
      %5596 = func.call @cc_make_string(%5594, %5595) : (!llvm.ptr, i64) -> i64
      %5597 = func.call @cc_intern(%5593, %5596) : (i64, i64) -> i64
      %5598 = func.call @cc_nil_value() : () -> i64
      %5599 = func.call @cc_cons(%5597, %5598) : (i64, i64) -> i64
      %5600 = func.call @cc_values_pack(%5599) : (i64) -> i64
      func.call @stack_push_pointer(%5597) : (i64) -> ()
      %5601 = llvm.mlir.addressof @str484 : !llvm.ptr
      %5602 = arith.constant 14 : i64
      %5603 = func.call @cc_make_string(%5601, %5602) : (!llvm.ptr, i64) -> i64
      %5604 = llvm.mlir.addressof @str485 : !llvm.ptr
      %5605 = arith.constant 11 : i64
      %5606 = func.call @cc_make_string(%5604, %5605) : (!llvm.ptr, i64) -> i64
      %5607 = func.call @cc_intern(%5603, %5606) : (i64, i64) -> i64
      %5608 = func.call @cc_nil_value() : () -> i64
      %5609 = func.call @cc_cons(%5607, %5608) : (i64, i64) -> i64
      %5610 = func.call @cc_values_pack(%5609) : (i64) -> i64
      func.call @stack_push_pointer(%5607) : (i64) -> ()
      %5611 = llvm.mlir.addressof @str486 : !llvm.ptr
      %5612 = arith.constant 5 : i64
      %5613 = func.call @cc_make_string(%5611, %5612) : (!llvm.ptr, i64) -> i64
      %5614 = func.call @cc_nil_value() : () -> i64
      %5615 = func.call @cc_intern(%5613, %5614) : (i64, i64) -> i64
      %5616 = func.call @cc_nil_value() : () -> i64
      %5617 = func.call @cc_cons(%5615, %5616) : (i64, i64) -> i64
      %5618 = func.call @cc_values_pack(%5617) : (i64) -> i64
      func.call @stack_push_pointer(%5615) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5619 = func.call @stack_pop_pointer() : () -> i64
      %5620 = func.call @stack_pop_pointer() : () -> i64
      %5621 = func.call @cc_cons(%5620, %5619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5621) : (i64) -> ()
      %5622 = func.call @stack_pop_pointer() : () -> i64
      %5623 = func.call @stack_pop_pointer() : () -> i64
      %5624 = func.call @cc_cons(%5623, %5622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5624) : (i64) -> ()
      %5625 = llvm.mlir.addressof @str487 : !llvm.ptr
      %5626 = arith.constant 8 : i64
      %5627 = func.call @cc_make_string(%5625, %5626) : (!llvm.ptr, i64) -> i64
      %5628 = llvm.mlir.addressof @str488 : !llvm.ptr
      %5629 = arith.constant 7 : i64
      %5630 = func.call @cc_make_string(%5628, %5629) : (!llvm.ptr, i64) -> i64
      %5631 = func.call @cc_intern(%5627, %5630) : (i64, i64) -> i64
      %5632 = func.call @cc_nil_value() : () -> i64
      %5633 = func.call @cc_cons(%5631, %5632) : (i64, i64) -> i64
      %5634 = func.call @cc_values_pack(%5633) : (i64) -> i64
      func.call @stack_push_pointer(%5631) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5635 = func.call @stack_pop_pointer() : () -> i64
      %5636 = func.call @stack_pop_pointer() : () -> i64
      %5637 = func.call @cc_cons(%5636, %5635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5637) : (i64) -> ()
      %5638 = func.call @stack_pop_pointer() : () -> i64
      %5639 = func.call @stack_pop_pointer() : () -> i64
      %5640 = func.call @cc_cons(%5639, %5638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5640) : (i64) -> ()
      %5641 = func.call @stack_pop_pointer() : () -> i64
      %5642 = func.call @stack_pop_pointer() : () -> i64
      %5643 = func.call @cc_cons(%5642, %5641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5643) : (i64) -> ()
      %5644 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5645 = arith.constant 4 : i64
      %5646 = func.call @cc_make_string(%5644, %5645) : (!llvm.ptr, i64) -> i64
      %5647 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5648 = arith.constant 11 : i64
      %5649 = func.call @cc_make_string(%5647, %5648) : (!llvm.ptr, i64) -> i64
      %5650 = func.call @cc_intern(%5646, %5649) : (i64, i64) -> i64
      %5651 = func.call @cc_nil_value() : () -> i64
      %5652 = func.call @cc_cons(%5650, %5651) : (i64, i64) -> i64
      %5653 = func.call @cc_values_pack(%5652) : (i64) -> i64
      func.call @stack_push_pointer(%5650) : (i64) -> ()
      %5654 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5655 = arith.constant 19 : i64
      %5656 = func.call @cc_make_string(%5654, %5655) : (!llvm.ptr, i64) -> i64
      %5657 = llvm.mlir.addressof @str492 : !llvm.ptr
      %5658 = arith.constant 11 : i64
      %5659 = func.call @cc_make_string(%5657, %5658) : (!llvm.ptr, i64) -> i64
      %5660 = func.call @cc_intern(%5656, %5659) : (i64, i64) -> i64
      %5661 = func.call @cc_nil_value() : () -> i64
      %5662 = func.call @cc_cons(%5660, %5661) : (i64, i64) -> i64
      %5663 = func.call @cc_values_pack(%5662) : (i64) -> i64
      func.call @stack_push_pointer(%5660) : (i64) -> ()
      %5664 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5665 = arith.constant 5 : i64
      %5666 = func.call @cc_make_string(%5664, %5665) : (!llvm.ptr, i64) -> i64
      %5667 = func.call @cc_nil_value() : () -> i64
      %5668 = func.call @cc_intern(%5666, %5667) : (i64, i64) -> i64
      %5669 = func.call @cc_nil_value() : () -> i64
      %5670 = func.call @cc_cons(%5668, %5669) : (i64, i64) -> i64
      %5671 = func.call @cc_values_pack(%5670) : (i64) -> i64
      func.call @stack_push_pointer(%5668) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5672 = func.call @stack_pop_pointer() : () -> i64
      %5673 = func.call @stack_pop_pointer() : () -> i64
      %5674 = func.call @cc_cons(%5673, %5672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5674) : (i64) -> ()
      %5675 = func.call @stack_pop_pointer() : () -> i64
      %5676 = func.call @stack_pop_pointer() : () -> i64
      %5677 = func.call @cc_cons(%5676, %5675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5677) : (i64) -> ()
      %5678 = llvm.mlir.addressof @str494 : !llvm.ptr
      %5679 = arith.constant 6 : i64
      %5680 = func.call @cc_make_string(%5678, %5679) : (!llvm.ptr, i64) -> i64
      %5681 = func.call @cc_nil_value() : () -> i64
      %5682 = func.call @cc_intern(%5680, %5681) : (i64, i64) -> i64
      %5683 = func.call @cc_nil_value() : () -> i64
      %5684 = func.call @cc_cons(%5682, %5683) : (i64, i64) -> i64
      %5685 = func.call @cc_values_pack(%5684) : (i64) -> i64
      func.call @stack_push_pointer(%5682) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5686 = func.call @stack_pop_pointer() : () -> i64
      %5687 = func.call @stack_pop_pointer() : () -> i64
      %5688 = func.call @cc_cons(%5687, %5686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5688) : (i64) -> ()
      %5689 = func.call @stack_pop_pointer() : () -> i64
      %5690 = func.call @stack_pop_pointer() : () -> i64
      %5691 = func.call @cc_cons(%5690, %5689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5691) : (i64) -> ()
      %5692 = func.call @stack_pop_pointer() : () -> i64
      %5693 = func.call @stack_pop_pointer() : () -> i64
      %5694 = func.call @cc_cons(%5693, %5692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5695 = func.call @stack_pop_pointer() : () -> i64
      %5696 = func.call @stack_pop_pointer() : () -> i64
      %5697 = func.call @cc_cons(%5696, %5695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5697) : (i64) -> ()
      %5698 = func.call @stack_pop_pointer() : () -> i64
      %5699 = func.call @stack_pop_pointer() : () -> i64
      %5700 = func.call @cc_cons(%5699, %5698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5700) : (i64) -> ()
      %5701 = func.call @stack_pop_pointer() : () -> i64
      %5702 = func.call @stack_pop_pointer() : () -> i64
      %5703 = func.call @cc_cons(%5702, %5701) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5703) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5704 = func.call @stack_pop_pointer() : () -> i64
      %5705 = func.call @stack_pop_pointer() : () -> i64
      %5706 = func.call @cc_cons(%5705, %5704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5706) : (i64) -> ()
      %5707 = func.call @stack_pop_pointer() : () -> i64
      %5708 = func.call @stack_pop_pointer() : () -> i64
      %5709 = func.call @cc_cons(%5708, %5707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5709) : (i64) -> ()
      %5710 = func.call @stack_pop_pointer() : () -> i64
      %5711 = func.call @stack_pop_pointer() : () -> i64
      %5712 = func.call @cc_cons(%5711, %5710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5713 = func.call @stack_pop_pointer() : () -> i64
      %5714 = func.call @stack_pop_pointer() : () -> i64
      %5715 = func.call @cc_cons(%5714, %5713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5715) : (i64) -> ()
      %5716 = func.call @stack_pop_pointer() : () -> i64
      %5717 = func.call @stack_pop_pointer() : () -> i64
      %5718 = func.call @cc_cons(%5717, %5716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5718) : (i64) -> ()
      %5719 = llvm.mlir.addressof @str495 : !llvm.ptr
      %5720 = arith.constant 6 : i64
      %5721 = func.call @cc_make_string(%5719, %5720) : (!llvm.ptr, i64) -> i64
      %5722 = func.call @cc_nil_value() : () -> i64
      %5723 = func.call @cc_intern(%5721, %5722) : (i64, i64) -> i64
      %5724 = func.call @cc_nil_value() : () -> i64
      %5725 = func.call @cc_cons(%5723, %5724) : (i64, i64) -> i64
      %5726 = func.call @cc_values_pack(%5725) : (i64) -> i64
      func.call @stack_push_pointer(%5723) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5727 = func.call @stack_pop_pointer() : () -> i64
      %5728 = func.call @stack_pop_pointer() : () -> i64
      %5729 = func.call @cc_cons(%5728, %5727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5729) : (i64) -> ()
      %5730 = func.call @stack_pop_pointer() : () -> i64
      %5731 = func.call @stack_pop_pointer() : () -> i64
      %5732 = func.call @cc_cons(%5731, %5730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5732) : (i64) -> ()
      %5733 = func.call @stack_pop_pointer() : () -> i64
      %5734 = func.call @stack_pop_pointer() : () -> i64
      %5735 = func.call @cc_cons(%5734, %5733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5735) : (i64) -> ()
      %5736 = func.call @stack_pop_pointer() : () -> i64
      %5737 = func.call @stack_pop_pointer() : () -> i64
      %5738 = func.call @cc_cons(%5737, %5736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5738) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5739 = func.call @stack_pop_pointer() : () -> i64
      %5740 = func.call @stack_pop_pointer() : () -> i64
      %5741 = func.call @cc_cons(%5740, %5739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5741) : (i64) -> ()
      %5742 = func.call @stack_pop_pointer() : () -> i64
      %5743 = func.call @stack_pop_pointer() : () -> i64
      %5744 = func.call @cc_cons(%5743, %5742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5744) : (i64) -> ()
      %5745 = func.call @stack_pop_pointer() : () -> i64
      %5746 = func.call @stack_pop_pointer() : () -> i64
      %5747 = func.call @cc_cons(%5746, %5745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5747) : (i64) -> ()
      %5748 = func.call @stack_pop_pointer() : () -> i64
      %5749 = func.call @stack_pop_pointer() : () -> i64
      %5750 = func.call @cc_cons(%5749, %5748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5750) : (i64) -> ()
      %5751 = llvm.mlir.addressof @str496 : !llvm.ptr
      %5752 = arith.constant 5 : i64
      %5753 = func.call @cc_make_string(%5751, %5752) : (!llvm.ptr, i64) -> i64
      %5754 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5755 = arith.constant 11 : i64
      %5756 = func.call @cc_make_string(%5754, %5755) : (!llvm.ptr, i64) -> i64
      %5757 = func.call @cc_intern(%5753, %5756) : (i64, i64) -> i64
      %5758 = func.call @cc_nil_value() : () -> i64
      %5759 = func.call @cc_cons(%5757, %5758) : (i64, i64) -> i64
      %5760 = func.call @cc_values_pack(%5759) : (i64) -> i64
      func.call @stack_push_pointer(%5757) : (i64) -> ()
      %5761 = llvm.mlir.addressof @str498 : !llvm.ptr
      %5762 = arith.constant 3 : i64
      %5763 = func.call @cc_make_string(%5761, %5762) : (!llvm.ptr, i64) -> i64
      %5764 = func.call @cc_nil_value() : () -> i64
      %5765 = func.call @cc_intern(%5763, %5764) : (i64, i64) -> i64
      %5766 = func.call @cc_nil_value() : () -> i64
      %5767 = func.call @cc_cons(%5765, %5766) : (i64, i64) -> i64
      %5768 = func.call @cc_values_pack(%5767) : (i64) -> i64
      func.call @stack_push_pointer(%5765) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5769 = llvm.mlir.addressof @str499 : !llvm.ptr
      %5770 = arith.constant 3 : i64
      %5771 = func.call @cc_make_string(%5769, %5770) : (!llvm.ptr, i64) -> i64
      %5772 = func.call @cc_nil_value() : () -> i64
      %5773 = func.call @cc_intern(%5771, %5772) : (i64, i64) -> i64
      %5774 = func.call @cc_nil_value() : () -> i64
      %5775 = func.call @cc_cons(%5773, %5774) : (i64, i64) -> i64
      %5776 = func.call @cc_values_pack(%5775) : (i64) -> i64
      func.call @stack_push_pointer(%5773) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5777 = func.call @stack_pop_pointer() : () -> i64
      %5778 = func.call @stack_pop_pointer() : () -> i64
      %5779 = func.call @cc_cons(%5778, %5777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5779) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5780 = func.call @stack_pop_pointer() : () -> i64
      %5781 = func.call @stack_pop_pointer() : () -> i64
      %5782 = func.call @cc_cons(%5781, %5780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5782) : (i64) -> ()
      %5783 = func.call @stack_pop_pointer() : () -> i64
      %5784 = func.call @stack_pop_pointer() : () -> i64
      %5785 = func.call @cc_cons(%5784, %5783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5785) : (i64) -> ()
      %5786 = func.call @stack_pop_pointer() : () -> i64
      %5787 = func.call @stack_pop_pointer() : () -> i64
      %5788 = func.call @cc_cons(%5787, %5786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5788) : (i64) -> ()
      %5789 = func.call @stack_pop_pointer() : () -> i64
      %5790 = func.call @stack_pop_pointer() : () -> i64
      %5791 = func.call @cc_cons(%5790, %5789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5791) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5792 = func.call @stack_pop_pointer() : () -> i64
      %5793 = func.call @stack_pop_pointer() : () -> i64
      %5794 = func.call @cc_cons(%5793, %5792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5794) : (i64) -> ()
      %5795 = func.call @stack_pop_pointer() : () -> i64
      %5796 = func.call @stack_pop_pointer() : () -> i64
      %5797 = func.call @cc_cons(%5796, %5795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5797) : (i64) -> ()
      %5798 = func.call @stack_pop_pointer() : () -> i64
      %5799 = func.call @stack_pop_pointer() : () -> i64
      %5800 = func.call @cc_cons(%5799, %5798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5800) : (i64) -> ()
      %5801 = func.call @stack_pop_pointer() : () -> i64
      %5802 = func.call @stack_pop_pointer() : () -> i64
      %5803 = func.call @cc_cons(%5802, %5801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5803) : (i64) -> ()
      %5804 = func.call @stack_pop_pointer() : () -> i64
      %5805 = func.call @stack_pop_pointer() : () -> i64
      %5806 = func.call @cc_cons(%5804, %5805) : (i64, i64) -> i64
      %5807 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5808 = arith.constant 5 : i64
      %5809 = func.call @cc_make_string(%5807, %5808) : (!llvm.ptr, i64) -> i64
      %5810 = func.call @cc_nil_value() : () -> i64
      %5811 = func.call @cc_intern(%5809, %5810) : (i64, i64) -> i64
      %5812 = func.call @cc_nil_value() : () -> i64
      %5813 = func.call @cc_cons(%5811, %5812) : (i64, i64) -> i64
      %5814 = func.call @cc_values_pack(%5813) : (i64) -> i64
      %5815 = func.call @cc_cons(%5811, %5806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5815) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5816 = func.call @stack_pop_pointer() : () -> i64
      %5817 = func.call @stack_pop_pointer() : () -> i64
      %5818 = func.call @cc_cons(%5817, %5816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5818) : (i64) -> ()
      %5819 = func.call @stack_pop_pointer() : () -> i64
      %5820 = func.call @stack_pop_pointer() : () -> i64
      %5821 = func.call @cc_cons(%5820, %5819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5821) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5822 = func.call @stack_pop_pointer() : () -> i64
      %5823 = func.call @stack_pop_pointer() : () -> i64
      %5824 = func.call @cc_cons(%5823, %5822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5824) : (i64) -> ()
      %5825 = func.call @stack_pop_pointer() : () -> i64
      %5826 = func.call @stack_pop_pointer() : () -> i64
      %5827 = func.call @cc_cons(%5826, %5825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5827) : (i64) -> ()
      %5828 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5829 = arith.constant 6 : i64
      %5830 = func.call @cc_make_string(%5828, %5829) : (!llvm.ptr, i64) -> i64
      %5831 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5832 = arith.constant 11 : i64
      %5833 = func.call @cc_make_string(%5831, %5832) : (!llvm.ptr, i64) -> i64
      %5834 = func.call @cc_intern(%5830, %5833) : (i64, i64) -> i64
      %5835 = func.call @cc_nil_value() : () -> i64
      %5836 = func.call @cc_cons(%5834, %5835) : (i64, i64) -> i64
      %5837 = func.call @cc_values_pack(%5836) : (i64) -> i64
      func.call @stack_push_pointer(%5834) : (i64) -> ()
      %5838 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5838) : (i64) -> ()
      %5839 = llvm.mlir.addressof @str503 : !llvm.ptr
      %5840 = arith.constant 3 : i64
      %5841 = func.call @cc_make_string(%5839, %5840) : (!llvm.ptr, i64) -> i64
      %5842 = func.call @cc_nil_value() : () -> i64
      %5843 = func.call @cc_intern(%5841, %5842) : (i64, i64) -> i64
      %5844 = func.call @cc_nil_value() : () -> i64
      %5845 = func.call @cc_cons(%5843, %5844) : (i64, i64) -> i64
      %5846 = func.call @cc_values_pack(%5845) : (i64) -> i64
      func.call @stack_push_pointer(%5843) : (i64) -> ()
      %5847 = llvm.mlir.addressof @str504 : !llvm.ptr
      %5848 = arith.constant 3 : i64
      %5849 = func.call @cc_make_string(%5847, %5848) : (!llvm.ptr, i64) -> i64
      %5850 = func.call @cc_nil_value() : () -> i64
      %5851 = func.call @cc_intern(%5849, %5850) : (i64, i64) -> i64
      %5852 = func.call @cc_nil_value() : () -> i64
      %5853 = func.call @cc_cons(%5851, %5852) : (i64, i64) -> i64
      %5854 = func.call @cc_values_pack(%5853) : (i64) -> i64
      func.call @stack_push_pointer(%5851) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5855 = func.call @stack_pop_pointer() : () -> i64
      %5856 = func.call @stack_pop_pointer() : () -> i64
      %5857 = func.call @cc_cons(%5856, %5855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5857) : (i64) -> ()
      %5858 = func.call @stack_pop_pointer() : () -> i64
      %5859 = func.call @stack_pop_pointer() : () -> i64
      %5860 = func.call @cc_cons(%5859, %5858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5860) : (i64) -> ()
      %5861 = func.call @stack_pop_pointer() : () -> i64
      %5862 = func.call @stack_pop_pointer() : () -> i64
      %5863 = func.call @cc_cons(%5861, %5862) : (i64, i64) -> i64
      %5864 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5865 = arith.constant 5 : i64
      %5866 = func.call @cc_make_string(%5864, %5865) : (!llvm.ptr, i64) -> i64
      %5867 = func.call @cc_nil_value() : () -> i64
      %5868 = func.call @cc_intern(%5866, %5867) : (i64, i64) -> i64
      %5869 = func.call @cc_nil_value() : () -> i64
      %5870 = func.call @cc_cons(%5868, %5869) : (i64, i64) -> i64
      %5871 = func.call @cc_values_pack(%5870) : (i64) -> i64
      %5872 = func.call @cc_cons(%5868, %5863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5872) : (i64) -> ()
      %5873 = llvm.mlir.addressof @str506 : !llvm.ptr
      %5874 = arith.constant 7 : i64
      %5875 = func.call @cc_make_string(%5873, %5874) : (!llvm.ptr, i64) -> i64
      %5876 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5877 = arith.constant 11 : i64
      %5878 = func.call @cc_make_string(%5876, %5877) : (!llvm.ptr, i64) -> i64
      %5879 = func.call @cc_intern(%5875, %5878) : (i64, i64) -> i64
      %5880 = func.call @cc_nil_value() : () -> i64
      %5881 = func.call @cc_cons(%5879, %5880) : (i64, i64) -> i64
      %5882 = func.call @cc_values_pack(%5881) : (i64) -> i64
      func.call @stack_push_pointer(%5879) : (i64) -> ()
      %5883 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5884 = arith.constant 11 : i64
      %5885 = func.call @cc_make_string(%5883, %5884) : (!llvm.ptr, i64) -> i64
      %5886 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5887 = arith.constant 11 : i64
      %5888 = func.call @cc_make_string(%5886, %5887) : (!llvm.ptr, i64) -> i64
      %5889 = func.call @cc_intern(%5885, %5888) : (i64, i64) -> i64
      %5890 = func.call @cc_nil_value() : () -> i64
      %5891 = func.call @cc_cons(%5889, %5890) : (i64, i64) -> i64
      %5892 = func.call @cc_values_pack(%5891) : (i64) -> i64
      func.call @stack_push_pointer(%5889) : (i64) -> ()
      %5893 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5893) : (i64) -> ()
      %5894 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5895 = arith.constant 3 : i64
      %5896 = func.call @cc_make_string(%5894, %5895) : (!llvm.ptr, i64) -> i64
      %5897 = func.call @cc_nil_value() : () -> i64
      %5898 = func.call @cc_intern(%5896, %5897) : (i64, i64) -> i64
      %5899 = func.call @cc_nil_value() : () -> i64
      %5900 = func.call @cc_cons(%5898, %5899) : (i64, i64) -> i64
      %5901 = func.call @cc_values_pack(%5900) : (i64) -> i64
      func.call @stack_push_pointer(%5898) : (i64) -> ()
      %5902 = func.call @stack_pop_pointer() : () -> i64
      %5903 = func.call @stack_pop_pointer() : () -> i64
      %5904 = func.call @cc_cons(%5902, %5903) : (i64, i64) -> i64
      %5905 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5906 = arith.constant 5 : i64
      %5907 = func.call @cc_make_string(%5905, %5906) : (!llvm.ptr, i64) -> i64
      %5908 = func.call @cc_nil_value() : () -> i64
      %5909 = func.call @cc_intern(%5907, %5908) : (i64, i64) -> i64
      %5910 = func.call @cc_nil_value() : () -> i64
      %5911 = func.call @cc_cons(%5909, %5910) : (i64, i64) -> i64
      %5912 = func.call @cc_values_pack(%5911) : (i64) -> i64
      %5913 = func.call @cc_cons(%5909, %5904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5913) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5914 = func.call @stack_pop_pointer() : () -> i64
      %5915 = func.call @stack_pop_pointer() : () -> i64
      %5916 = func.call @cc_cons(%5915, %5914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5916) : (i64) -> ()
      %5917 = func.call @stack_pop_pointer() : () -> i64
      %5918 = func.call @stack_pop_pointer() : () -> i64
      %5919 = func.call @cc_cons(%5918, %5917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5919) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5920 = func.call @stack_pop_pointer() : () -> i64
      %5921 = func.call @stack_pop_pointer() : () -> i64
      %5922 = func.call @cc_cons(%5921, %5920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5922) : (i64) -> ()
      %5923 = func.call @stack_pop_pointer() : () -> i64
      %5924 = func.call @stack_pop_pointer() : () -> i64
      %5925 = func.call @cc_cons(%5924, %5923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5925) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5926 = func.call @stack_pop_pointer() : () -> i64
      %5927 = func.call @stack_pop_pointer() : () -> i64
      %5928 = func.call @cc_cons(%5927, %5926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5928) : (i64) -> ()
      %5929 = func.call @stack_pop_pointer() : () -> i64
      %5930 = func.call @stack_pop_pointer() : () -> i64
      %5931 = func.call @cc_cons(%5930, %5929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5931) : (i64) -> ()
      %5932 = func.call @stack_pop_pointer() : () -> i64
      %5933 = func.call @stack_pop_pointer() : () -> i64
      %5934 = func.call @cc_cons(%5933, %5932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5934) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5935 = func.call @stack_pop_pointer() : () -> i64
      %5936 = func.call @stack_pop_pointer() : () -> i64
      %5937 = func.call @cc_cons(%5936, %5935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5937) : (i64) -> ()
      %5938 = func.call @stack_pop_pointer() : () -> i64
      %5939 = func.call @stack_pop_pointer() : () -> i64
      %5940 = func.call @cc_cons(%5939, %5938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5940) : (i64) -> ()
      %5941 = func.call @stack_pop_pointer() : () -> i64
      %5942 = func.call @stack_pop_pointer() : () -> i64
      %5943 = func.call @cc_cons(%5942, %5941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5943) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5944 = func.call @stack_pop_pointer() : () -> i64
      %5945 = func.call @stack_pop_pointer() : () -> i64
      %5946 = func.call @cc_cons(%5945, %5944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5946) : (i64) -> ()
      %5947 = func.call @stack_pop_pointer() : () -> i64
      %5948 = func.call @stack_pop_pointer() : () -> i64
      %5949 = func.call @cc_cons(%5948, %5947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5950 = func.call @stack_pop_pointer() : () -> i64
      %5951 = func.call @stack_pop_pointer() : () -> i64
      %5952 = func.call @cc_cons(%5951, %5950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5952) : (i64) -> ()
      %5953 = func.call @stack_pop_pointer() : () -> i64
      %5954 = func.call @stack_pop_pointer() : () -> i64
      %5955 = func.call @cc_cons(%5954, %5953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5955) : (i64) -> ()
      %5956 = func.call @stack_pop_pointer() : () -> i64
      %6319 = arith.constant 97047688511535 : i64
      %6320 = arith.constant 0 : i64
      %6321 = func.call @cc_make_closure(%6319, %6320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6321) : (i64) -> ()
      %6322 = func.call @stack_pop_pointer() : () -> i64
      %6323 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6324 = arith.constant 1 : i64
      %6325 = func.call @cc_make_string(%6323, %6324) : (!llvm.ptr, i64) -> i64
      %6326 = func.call @cc_nil_value() : () -> i64
      %6327 = func.call @cc_intern(%6325, %6326) : (i64, i64) -> i64
      %6328 = func.call @cc_nil_value() : () -> i64
      %6329 = func.call @cc_cons(%6327, %6328) : (i64, i64) -> i64
      %6330 = func.call @cc_values_pack(%6329) : (i64) -> i64
      func.call @stack_push_pointer(%6327) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6331 = func.call @stack_pop_pointer() : () -> i64
      %6332 = func.call @stack_pop_pointer() : () -> i64
      %6333 = func.call @cc_cons(%6332, %6331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6333) : (i64) -> ()
      %6334 = func.call @stack_pop_pointer() : () -> i64
      %6335 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6336 = arith.constant 11 : i64
      %6337 = func.call @cc_make_string(%6335, %6336) : (!llvm.ptr, i64) -> i64
      %6338 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6339 = arith.constant 7 : i64
      %6340 = func.call @cc_make_string(%6338, %6339) : (!llvm.ptr, i64) -> i64
      %6341 = func.call @cc_intern(%6337, %6340) : (i64, i64) -> i64
      %6342 = func.call @cc_nil_value() : () -> i64
      %6343 = func.call @cc_cons(%6341, %6342) : (i64, i64) -> i64
      %6344 = func.call @cc_values_pack(%6343) : (i64) -> i64
      func.call @stack_push_pointer(%6341) : (i64) -> ()
      %6345 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6346 = func.call @stack_pop_pointer() : () -> i64
      %6347 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6348 = arith.constant 4 : i64
      %6349 = func.call @cc_make_string(%6347, %6348) : (!llvm.ptr, i64) -> i64
      %6350 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6351 = arith.constant 7 : i64
      %6352 = func.call @cc_make_string(%6350, %6351) : (!llvm.ptr, i64) -> i64
      %6353 = func.call @cc_intern(%6349, %6352) : (i64, i64) -> i64
      %6354 = func.call @cc_nil_value() : () -> i64
      %6355 = func.call @cc_cons(%6353, %6354) : (i64, i64) -> i64
      %6356 = func.call @cc_values_pack(%6355) : (i64) -> i64
      func.call @stack_push_pointer(%6353) : (i64) -> ()
      %6357 = func.call @stack_pop_pointer() : () -> i64
      %6358 = llvm.mlir.addressof @str551 : !llvm.ptr
      %6359 = arith.constant 6 : i64
      %6360 = func.call @cc_make_string(%6358, %6359) : (!llvm.ptr, i64) -> i64
      %6361 = func.call @cc_nil_value() : () -> i64
      %6362 = func.call @cc_intern(%6360, %6361) : (i64, i64) -> i64
      %6363 = func.call @cc_nil_value() : () -> i64
      %6364 = func.call @cc_cons(%6362, %6363) : (i64, i64) -> i64
      %6365 = func.call @cc_values_pack(%6364) : (i64) -> i64
      func.call @stack_push_pointer(%6362) : (i64) -> ()
      %6366 = func.call @stack_pop_pointer() : () -> i64
      %6367 = func.call @cc_nil_value() : () -> i64
      %6368 = func.call @cc_errorp(%5449) : (i64) -> i64
      %6369 = arith.cmpi ne, %6368, %6367 : i64
      %6370 = arith.cmpi eq, %6367, %6367 : i64
      %6371 = arith.andi %6369, %6370 : i1
      %6372 = scf.if %6371 -> (i64) {
        scf.yield %5449 : i64
      } else {
        scf.yield %6367 : i64
      }
      %6373 = func.call @cc_errorp(%5956) : (i64) -> i64
      %6374 = arith.cmpi ne, %6373, %6367 : i64
      %6375 = arith.cmpi eq, %6372, %6367 : i64
      %6376 = arith.andi %6374, %6375 : i1
      %6377 = scf.if %6376 -> (i64) {
        scf.yield %5956 : i64
      } else {
        scf.yield %6372 : i64
      }
      %6378 = func.call @cc_errorp(%6322) : (i64) -> i64
      %6379 = arith.cmpi ne, %6378, %6367 : i64
      %6380 = arith.cmpi eq, %6377, %6367 : i64
      %6381 = arith.andi %6379, %6380 : i1
      %6382 = scf.if %6381 -> (i64) {
        scf.yield %6322 : i64
      } else {
        scf.yield %6377 : i64
      }
      %6383 = func.call @cc_errorp(%6334) : (i64) -> i64
      %6384 = arith.cmpi ne, %6383, %6367 : i64
      %6385 = arith.cmpi eq, %6382, %6367 : i64
      %6386 = arith.andi %6384, %6385 : i1
      %6387 = scf.if %6386 -> (i64) {
        scf.yield %6334 : i64
      } else {
        scf.yield %6382 : i64
      }
      %6388 = func.call @cc_errorp(%6345) : (i64) -> i64
      %6389 = arith.cmpi ne, %6388, %6367 : i64
      %6390 = arith.cmpi eq, %6387, %6367 : i64
      %6391 = arith.andi %6389, %6390 : i1
      %6392 = scf.if %6391 -> (i64) {
        scf.yield %6345 : i64
      } else {
        scf.yield %6387 : i64
      }
      %6393 = func.call @cc_errorp(%6346) : (i64) -> i64
      %6394 = arith.cmpi ne, %6393, %6367 : i64
      %6395 = arith.cmpi eq, %6392, %6367 : i64
      %6396 = arith.andi %6394, %6395 : i1
      %6397 = scf.if %6396 -> (i64) {
        scf.yield %6346 : i64
      } else {
        scf.yield %6392 : i64
      }
      %6398 = func.call @cc_errorp(%6357) : (i64) -> i64
      %6399 = arith.cmpi ne, %6398, %6367 : i64
      %6400 = arith.cmpi eq, %6397, %6367 : i64
      %6401 = arith.andi %6399, %6400 : i1
      %6402 = scf.if %6401 -> (i64) {
        scf.yield %6357 : i64
      } else {
        scf.yield %6397 : i64
      }
      %6403 = func.call @cc_errorp(%6366) : (i64) -> i64
      %6404 = arith.cmpi ne, %6403, %6367 : i64
      %6405 = arith.cmpi eq, %6402, %6367 : i64
      %6406 = arith.andi %6404, %6405 : i1
      %6407 = scf.if %6406 -> (i64) {
        scf.yield %6366 : i64
      } else {
        scf.yield %6402 : i64
      }
      %6408 = arith.cmpi ne, %6407, %6367 : i64
      scf.if %6408 {
        func.call @stack_push_pointer(%6407) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5449) : (i64) -> ()
        func.call @stack_push_pointer(%5956) : (i64) -> ()
        func.call @stack_push_pointer(%6322) : (i64) -> ()
        func.call @stack_push_pointer(%6334) : (i64) -> ()
        func.call @stack_push_pointer(%6345) : (i64) -> ()
        func.call @stack_push_pointer(%6346) : (i64) -> ()
        func.call @stack_push_pointer(%6357) : (i64) -> ()
        func.call @stack_push_pointer(%6366) : (i64) -> ()
        %6409 = llvm.mlir.addressof @str552 : !llvm.ptr
        %6410 = func.call @cc_make_function_ref_const(%6409) : (!llvm.ptr) -> i64
        %6411 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6410, %6411) : (i64, i64) -> ()
      }
      %6412 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6412 : i64
    }
    %6413 = func.call @cc_nil_value() : () -> i64
    %6414 = func.call @cc_errorp(%5440) : (i64) -> i64
    %6415 = arith.cmpi ne, %6414, %6413 : i64
    %6416 = scf.if %6415 -> (i64) {
      scf.yield %5440 : i64
    } else {
      %6417 = llvm.mlir.addressof @str553 : !llvm.ptr
      %6418 = arith.constant 21 : i64
      %6419 = func.call @cc_make_string(%6417, %6418) : (!llvm.ptr, i64) -> i64
      %6420 = func.call @cc_nil_value() : () -> i64
      %6421 = func.call @cc_intern(%6419, %6420) : (i64, i64) -> i64
      %6422 = func.call @cc_nil_value() : () -> i64
      %6423 = func.call @cc_cons(%6421, %6422) : (i64, i64) -> i64
      %6424 = func.call @cc_values_pack(%6423) : (i64) -> i64
      func.call @stack_push_pointer(%6421) : (i64) -> ()
      %6425 = func.call @stack_pop_pointer() : () -> i64
      %6426 = llvm.mlir.addressof @str554 : !llvm.ptr
      %6427 = arith.constant 5 : i64
      %6428 = func.call @cc_make_string(%6426, %6427) : (!llvm.ptr, i64) -> i64
      %6429 = func.call @cc_nil_value() : () -> i64
      %6430 = func.call @cc_intern(%6428, %6429) : (i64, i64) -> i64
      %6431 = func.call @cc_nil_value() : () -> i64
      %6432 = func.call @cc_cons(%6430, %6431) : (i64, i64) -> i64
      %6433 = func.call @cc_values_pack(%6432) : (i64) -> i64
      func.call @stack_push_pointer(%6430) : (i64) -> ()
      %6434 = llvm.mlir.addressof @str555 : !llvm.ptr
      %6435 = arith.constant 7 : i64
      %6436 = func.call @cc_make_string(%6434, %6435) : (!llvm.ptr, i64) -> i64
      %6437 = llvm.mlir.addressof @str556 : !llvm.ptr
      %6438 = arith.constant 11 : i64
      %6439 = func.call @cc_make_string(%6437, %6438) : (!llvm.ptr, i64) -> i64
      %6440 = func.call @cc_intern(%6436, %6439) : (i64, i64) -> i64
      %6441 = func.call @cc_nil_value() : () -> i64
      %6442 = func.call @cc_cons(%6440, %6441) : (i64, i64) -> i64
      %6443 = func.call @cc_values_pack(%6442) : (i64) -> i64
      func.call @stack_push_pointer(%6440) : (i64) -> ()
      %6444 = llvm.mlir.addressof @str557 : !llvm.ptr
      %6445 = arith.constant 11 : i64
      %6446 = func.call @cc_make_string(%6444, %6445) : (!llvm.ptr, i64) -> i64
      %6447 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6448 = arith.constant 3 : i64
      %6449 = func.call @cc_make_string(%6447, %6448) : (!llvm.ptr, i64) -> i64
      %6450 = func.call @cc_intern(%6446, %6449) : (i64, i64) -> i64
      %6451 = func.call @cc_nil_value() : () -> i64
      %6452 = func.call @cc_cons(%6450, %6451) : (i64, i64) -> i64
      %6453 = func.call @cc_values_pack(%6452) : (i64) -> i64
      func.call @stack_push_pointer(%6450) : (i64) -> ()
      %6454 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6454) : (i64) -> ()
      %6455 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6456 = arith.constant 6 : i64
      %6457 = func.call @cc_make_string(%6455, %6456) : (!llvm.ptr, i64) -> i64
      %6458 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6459 = arith.constant 11 : i64
      %6460 = func.call @cc_make_string(%6458, %6459) : (!llvm.ptr, i64) -> i64
      %6461 = func.call @cc_intern(%6457, %6460) : (i64, i64) -> i64
      %6462 = func.call @cc_nil_value() : () -> i64
      %6463 = func.call @cc_cons(%6461, %6462) : (i64, i64) -> i64
      %6464 = func.call @cc_values_pack(%6463) : (i64) -> i64
      func.call @stack_push_pointer(%6461) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6465 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6466 = arith.constant 5 : i64
      %6467 = func.call @cc_make_string(%6465, %6466) : (!llvm.ptr, i64) -> i64
      %6468 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6469 = arith.constant 11 : i64
      %6470 = func.call @cc_make_string(%6468, %6469) : (!llvm.ptr, i64) -> i64
      %6471 = func.call @cc_intern(%6467, %6470) : (i64, i64) -> i64
      %6472 = func.call @cc_nil_value() : () -> i64
      %6473 = func.call @cc_cons(%6471, %6472) : (i64, i64) -> i64
      %6474 = func.call @cc_values_pack(%6473) : (i64) -> i64
      func.call @stack_push_pointer(%6471) : (i64) -> ()
      %6475 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6476 = arith.constant 3 : i64
      %6477 = func.call @cc_make_string(%6475, %6476) : (!llvm.ptr, i64) -> i64
      %6478 = func.call @cc_nil_value() : () -> i64
      %6479 = func.call @cc_intern(%6477, %6478) : (i64, i64) -> i64
      %6480 = func.call @cc_nil_value() : () -> i64
      %6481 = func.call @cc_cons(%6479, %6480) : (i64, i64) -> i64
      %6482 = func.call @cc_values_pack(%6481) : (i64) -> i64
      func.call @stack_push_pointer(%6479) : (i64) -> ()
      %6483 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6484 = arith.constant 1 : i64
      %6485 = func.call @cc_make_string(%6483, %6484) : (!llvm.ptr, i64) -> i64
      %6486 = func.call @cc_nil_value() : () -> i64
      %6487 = func.call @cc_intern(%6485, %6486) : (i64, i64) -> i64
      %6488 = func.call @cc_nil_value() : () -> i64
      %6489 = func.call @cc_cons(%6487, %6488) : (i64, i64) -> i64
      %6490 = func.call @cc_values_pack(%6489) : (i64) -> i64
      func.call @stack_push_pointer(%6487) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6491 = func.call @stack_pop_pointer() : () -> i64
      %6492 = func.call @stack_pop_pointer() : () -> i64
      %6493 = func.call @cc_cons(%6492, %6491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6493) : (i64) -> ()
      %6494 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6495 = arith.constant 13 : i64
      %6496 = func.call @cc_make_string(%6494, %6495) : (!llvm.ptr, i64) -> i64
      %6497 = llvm.mlir.addressof @str566 : !llvm.ptr
      %6498 = arith.constant 11 : i64
      %6499 = func.call @cc_make_string(%6497, %6498) : (!llvm.ptr, i64) -> i64
      %6500 = func.call @cc_intern(%6496, %6499) : (i64, i64) -> i64
      %6501 = func.call @cc_nil_value() : () -> i64
      %6502 = func.call @cc_cons(%6500, %6501) : (i64, i64) -> i64
      %6503 = func.call @cc_values_pack(%6502) : (i64) -> i64
      func.call @stack_push_pointer(%6500) : (i64) -> ()
      %6504 = llvm.mlir.addressof @str567 : !llvm.ptr
      %6505 = arith.constant 6 : i64
      %6506 = func.call @cc_make_string(%6504, %6505) : (!llvm.ptr, i64) -> i64
      %6507 = llvm.mlir.addressof @str568 : !llvm.ptr
      %6508 = arith.constant 11 : i64
      %6509 = func.call @cc_make_string(%6507, %6508) : (!llvm.ptr, i64) -> i64
      %6510 = func.call @cc_intern(%6506, %6509) : (i64, i64) -> i64
      %6511 = func.call @cc_nil_value() : () -> i64
      %6512 = func.call @cc_cons(%6510, %6511) : (i64, i64) -> i64
      %6513 = func.call @cc_values_pack(%6512) : (i64) -> i64
      func.call @stack_push_pointer(%6510) : (i64) -> ()
      %6514 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6515 = arith.constant 5 : i64
      %6516 = func.call @cc_make_string(%6514, %6515) : (!llvm.ptr, i64) -> i64
      %6517 = func.call @cc_nil_value() : () -> i64
      %6518 = func.call @cc_intern(%6516, %6517) : (i64, i64) -> i64
      %6519 = func.call @cc_nil_value() : () -> i64
      %6520 = func.call @cc_cons(%6518, %6519) : (i64, i64) -> i64
      %6521 = func.call @cc_values_pack(%6520) : (i64) -> i64
      func.call @stack_push_pointer(%6518) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6522 = func.call @stack_pop_pointer() : () -> i64
      %6523 = func.call @stack_pop_pointer() : () -> i64
      %6524 = func.call @cc_cons(%6523, %6522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6524) : (i64) -> ()
      %6525 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6526 = arith.constant 4 : i64
      %6527 = func.call @cc_make_string(%6525, %6526) : (!llvm.ptr, i64) -> i64
      %6528 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6529 = arith.constant 11 : i64
      %6530 = func.call @cc_make_string(%6528, %6529) : (!llvm.ptr, i64) -> i64
      %6531 = func.call @cc_intern(%6527, %6530) : (i64, i64) -> i64
      %6532 = func.call @cc_nil_value() : () -> i64
      %6533 = func.call @cc_cons(%6531, %6532) : (i64, i64) -> i64
      %6534 = func.call @cc_values_pack(%6533) : (i64) -> i64
      func.call @stack_push_pointer(%6531) : (i64) -> ()
      %6535 = llvm.mlir.addressof @str572 : !llvm.ptr
      %6536 = arith.constant 2 : i64
      %6537 = func.call @cc_make_string(%6535, %6536) : (!llvm.ptr, i64) -> i64
      %6538 = llvm.mlir.addressof @str573 : !llvm.ptr
      %6539 = arith.constant 11 : i64
      %6540 = func.call @cc_make_string(%6538, %6539) : (!llvm.ptr, i64) -> i64
      %6541 = func.call @cc_intern(%6537, %6540) : (i64, i64) -> i64
      %6542 = func.call @cc_nil_value() : () -> i64
      %6543 = func.call @cc_cons(%6541, %6542) : (i64, i64) -> i64
      %6544 = func.call @cc_values_pack(%6543) : (i64) -> i64
      func.call @stack_push_pointer(%6541) : (i64) -> ()
      %6545 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6546 = arith.constant 19 : i64
      %6547 = func.call @cc_make_string(%6545, %6546) : (!llvm.ptr, i64) -> i64
      %6548 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6549 = arith.constant 11 : i64
      %6550 = func.call @cc_make_string(%6548, %6549) : (!llvm.ptr, i64) -> i64
      %6551 = func.call @cc_intern(%6547, %6550) : (i64, i64) -> i64
      %6552 = func.call @cc_nil_value() : () -> i64
      %6553 = func.call @cc_cons(%6551, %6552) : (i64, i64) -> i64
      %6554 = func.call @cc_values_pack(%6553) : (i64) -> i64
      func.call @stack_push_pointer(%6551) : (i64) -> ()
      %6555 = llvm.mlir.addressof @str576 : !llvm.ptr
      %6556 = arith.constant 5 : i64
      %6557 = func.call @cc_make_string(%6555, %6556) : (!llvm.ptr, i64) -> i64
      %6558 = func.call @cc_nil_value() : () -> i64
      %6559 = func.call @cc_intern(%6557, %6558) : (i64, i64) -> i64
      %6560 = func.call @cc_nil_value() : () -> i64
      %6561 = func.call @cc_cons(%6559, %6560) : (i64, i64) -> i64
      %6562 = func.call @cc_values_pack(%6561) : (i64) -> i64
      func.call @stack_push_pointer(%6559) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6563 = func.call @stack_pop_pointer() : () -> i64
      %6564 = func.call @stack_pop_pointer() : () -> i64
      %6565 = func.call @cc_cons(%6564, %6563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6565) : (i64) -> ()
      %6566 = func.call @stack_pop_pointer() : () -> i64
      %6567 = func.call @stack_pop_pointer() : () -> i64
      %6568 = func.call @cc_cons(%6567, %6566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6568) : (i64) -> ()
      %6569 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6569) : (i64) -> ()
      %6570 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6571 = arith.constant 3 : i64
      %6572 = func.call @cc_make_string(%6570, %6571) : (!llvm.ptr, i64) -> i64
      %6573 = func.call @cc_nil_value() : () -> i64
      %6574 = func.call @cc_intern(%6572, %6573) : (i64, i64) -> i64
      %6575 = func.call @cc_nil_value() : () -> i64
      %6576 = func.call @cc_cons(%6574, %6575) : (i64, i64) -> i64
      %6577 = func.call @cc_values_pack(%6576) : (i64) -> i64
      func.call @stack_push_pointer(%6574) : (i64) -> ()
      %6578 = func.call @stack_pop_pointer() : () -> i64
      %6579 = func.call @stack_pop_pointer() : () -> i64
      %6580 = func.call @cc_cons(%6578, %6579) : (i64, i64) -> i64
      %6581 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6582 = arith.constant 5 : i64
      %6583 = func.call @cc_make_string(%6581, %6582) : (!llvm.ptr, i64) -> i64
      %6584 = func.call @cc_nil_value() : () -> i64
      %6585 = func.call @cc_intern(%6583, %6584) : (i64, i64) -> i64
      %6586 = func.call @cc_nil_value() : () -> i64
      %6587 = func.call @cc_cons(%6585, %6586) : (i64, i64) -> i64
      %6588 = func.call @cc_values_pack(%6587) : (i64) -> i64
      %6589 = func.call @cc_cons(%6585, %6580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6589) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6590 = func.call @stack_pop_pointer() : () -> i64
      %6591 = func.call @stack_pop_pointer() : () -> i64
      %6592 = func.call @cc_cons(%6591, %6590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6592) : (i64) -> ()
      %6593 = func.call @stack_pop_pointer() : () -> i64
      %6594 = func.call @stack_pop_pointer() : () -> i64
      %6595 = func.call @cc_cons(%6594, %6593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6595) : (i64) -> ()
      %6596 = func.call @stack_pop_pointer() : () -> i64
      %6597 = func.call @stack_pop_pointer() : () -> i64
      %6598 = func.call @cc_cons(%6597, %6596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6598) : (i64) -> ()
      %6599 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6600 = arith.constant 11 : i64
      %6601 = func.call @cc_make_string(%6599, %6600) : (!llvm.ptr, i64) -> i64
      %6602 = llvm.mlir.addressof @str580 : !llvm.ptr
      %6603 = arith.constant 11 : i64
      %6604 = func.call @cc_make_string(%6602, %6603) : (!llvm.ptr, i64) -> i64
      %6605 = func.call @cc_intern(%6601, %6604) : (i64, i64) -> i64
      %6606 = func.call @cc_nil_value() : () -> i64
      %6607 = func.call @cc_cons(%6605, %6606) : (i64, i64) -> i64
      %6608 = func.call @cc_values_pack(%6607) : (i64) -> i64
      func.call @stack_push_pointer(%6605) : (i64) -> ()
      %6609 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6610 = arith.constant 3 : i64
      %6611 = func.call @cc_make_string(%6609, %6610) : (!llvm.ptr, i64) -> i64
      %6612 = func.call @cc_nil_value() : () -> i64
      %6613 = func.call @cc_intern(%6611, %6612) : (i64, i64) -> i64
      %6614 = func.call @cc_nil_value() : () -> i64
      %6615 = func.call @cc_cons(%6613, %6614) : (i64, i64) -> i64
      %6616 = func.call @cc_values_pack(%6615) : (i64) -> i64
      func.call @stack_push_pointer(%6613) : (i64) -> ()
      %6617 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6618 = arith.constant 12 : i64
      %6619 = func.call @cc_make_string(%6617, %6618) : (!llvm.ptr, i64) -> i64
      %6620 = llvm.mlir.addressof @str583 : !llvm.ptr
      %6621 = arith.constant 11 : i64
      %6622 = func.call @cc_make_string(%6620, %6621) : (!llvm.ptr, i64) -> i64
      %6623 = func.call @cc_intern(%6619, %6622) : (i64, i64) -> i64
      %6624 = func.call @cc_nil_value() : () -> i64
      %6625 = func.call @cc_cons(%6623, %6624) : (i64, i64) -> i64
      %6626 = func.call @cc_values_pack(%6625) : (i64) -> i64
      func.call @stack_push_pointer(%6623) : (i64) -> ()
      %6627 = llvm.mlir.addressof @str584 : !llvm.ptr
      %6628 = arith.constant 5 : i64
      %6629 = func.call @cc_make_string(%6627, %6628) : (!llvm.ptr, i64) -> i64
      %6630 = func.call @cc_nil_value() : () -> i64
      %6631 = func.call @cc_intern(%6629, %6630) : (i64, i64) -> i64
      %6632 = func.call @cc_nil_value() : () -> i64
      %6633 = func.call @cc_cons(%6631, %6632) : (i64, i64) -> i64
      %6634 = func.call @cc_values_pack(%6633) : (i64) -> i64
      func.call @stack_push_pointer(%6631) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6635 = func.call @stack_pop_pointer() : () -> i64
      %6636 = func.call @stack_pop_pointer() : () -> i64
      %6637 = func.call @cc_cons(%6636, %6635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6637) : (i64) -> ()
      %6638 = func.call @stack_pop_pointer() : () -> i64
      %6639 = func.call @stack_pop_pointer() : () -> i64
      %6640 = func.call @cc_cons(%6639, %6638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6640) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6641 = func.call @stack_pop_pointer() : () -> i64
      %6642 = func.call @stack_pop_pointer() : () -> i64
      %6643 = func.call @cc_cons(%6642, %6641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6643) : (i64) -> ()
      %6644 = func.call @stack_pop_pointer() : () -> i64
      %6645 = func.call @stack_pop_pointer() : () -> i64
      %6646 = func.call @cc_cons(%6645, %6644) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6646) : (i64) -> ()
      %6647 = func.call @stack_pop_pointer() : () -> i64
      %6648 = func.call @stack_pop_pointer() : () -> i64
      %6649 = func.call @cc_cons(%6648, %6647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6649) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6650 = func.call @stack_pop_pointer() : () -> i64
      %6651 = func.call @stack_pop_pointer() : () -> i64
      %6652 = func.call @cc_cons(%6651, %6650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6652) : (i64) -> ()
      %6653 = func.call @stack_pop_pointer() : () -> i64
      %6654 = func.call @stack_pop_pointer() : () -> i64
      %6655 = func.call @cc_cons(%6654, %6653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6655) : (i64) -> ()
      %6656 = func.call @stack_pop_pointer() : () -> i64
      %6657 = func.call @stack_pop_pointer() : () -> i64
      %6658 = func.call @cc_cons(%6657, %6656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6658) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6659 = func.call @stack_pop_pointer() : () -> i64
      %6660 = func.call @stack_pop_pointer() : () -> i64
      %6661 = func.call @cc_cons(%6660, %6659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6661) : (i64) -> ()
      %6662 = func.call @stack_pop_pointer() : () -> i64
      %6663 = func.call @stack_pop_pointer() : () -> i64
      %6664 = func.call @cc_cons(%6663, %6662) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6664) : (i64) -> ()
      %6665 = func.call @stack_pop_pointer() : () -> i64
      %6666 = func.call @stack_pop_pointer() : () -> i64
      %6667 = func.call @cc_cons(%6666, %6665) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6667) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6668 = func.call @stack_pop_pointer() : () -> i64
      %6669 = func.call @stack_pop_pointer() : () -> i64
      %6670 = func.call @cc_cons(%6669, %6668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6670) : (i64) -> ()
      %6671 = func.call @stack_pop_pointer() : () -> i64
      %6672 = func.call @stack_pop_pointer() : () -> i64
      %6673 = func.call @cc_cons(%6672, %6671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6673) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6674 = func.call @stack_pop_pointer() : () -> i64
      %6675 = func.call @stack_pop_pointer() : () -> i64
      %6676 = func.call @cc_cons(%6675, %6674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6676) : (i64) -> ()
      %6677 = func.call @stack_pop_pointer() : () -> i64
      %6678 = func.call @stack_pop_pointer() : () -> i64
      %6679 = func.call @cc_cons(%6678, %6677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6679) : (i64) -> ()
      %6680 = func.call @stack_pop_pointer() : () -> i64
      %6681 = func.call @stack_pop_pointer() : () -> i64
      %6682 = func.call @cc_cons(%6681, %6680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6682) : (i64) -> ()
      %6683 = func.call @stack_pop_pointer() : () -> i64
      %6684 = func.call @stack_pop_pointer() : () -> i64
      %6685 = func.call @cc_cons(%6684, %6683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6686 = func.call @stack_pop_pointer() : () -> i64
      %6687 = func.call @stack_pop_pointer() : () -> i64
      %6688 = func.call @cc_cons(%6687, %6686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6688) : (i64) -> ()
      %6689 = func.call @stack_pop_pointer() : () -> i64
      %6690 = func.call @stack_pop_pointer() : () -> i64
      %6691 = func.call @cc_cons(%6690, %6689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6691) : (i64) -> ()
      %6692 = func.call @stack_pop_pointer() : () -> i64
      %6693 = func.call @stack_pop_pointer() : () -> i64
      %6694 = func.call @cc_cons(%6693, %6692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6694) : (i64) -> ()
      %6695 = func.call @stack_pop_pointer() : () -> i64
      %6696 = func.call @stack_pop_pointer() : () -> i64
      %6697 = func.call @cc_cons(%6695, %6696) : (i64, i64) -> i64
      %6698 = llvm.mlir.addressof @str585 : !llvm.ptr
      %6699 = arith.constant 5 : i64
      %6700 = func.call @cc_make_string(%6698, %6699) : (!llvm.ptr, i64) -> i64
      %6701 = func.call @cc_nil_value() : () -> i64
      %6702 = func.call @cc_intern(%6700, %6701) : (i64, i64) -> i64
      %6703 = func.call @cc_nil_value() : () -> i64
      %6704 = func.call @cc_cons(%6702, %6703) : (i64, i64) -> i64
      %6705 = func.call @cc_values_pack(%6704) : (i64) -> i64
      %6706 = func.call @cc_cons(%6702, %6697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6707 = func.call @stack_pop_pointer() : () -> i64
      %6708 = func.call @stack_pop_pointer() : () -> i64
      %6709 = func.call @cc_cons(%6708, %6707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6709) : (i64) -> ()
      %6710 = func.call @stack_pop_pointer() : () -> i64
      %6711 = func.call @stack_pop_pointer() : () -> i64
      %6712 = func.call @cc_cons(%6711, %6710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6713 = func.call @stack_pop_pointer() : () -> i64
      %6714 = func.call @stack_pop_pointer() : () -> i64
      %6715 = func.call @cc_cons(%6714, %6713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6715) : (i64) -> ()
      %6716 = func.call @stack_pop_pointer() : () -> i64
      %6717 = func.call @stack_pop_pointer() : () -> i64
      %6718 = func.call @cc_cons(%6717, %6716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6718) : (i64) -> ()
      %6719 = llvm.mlir.addressof @str586 : !llvm.ptr
      %6720 = arith.constant 3 : i64
      %6721 = func.call @cc_make_string(%6719, %6720) : (!llvm.ptr, i64) -> i64
      %6722 = func.call @cc_nil_value() : () -> i64
      %6723 = func.call @cc_intern(%6721, %6722) : (i64, i64) -> i64
      %6724 = func.call @cc_nil_value() : () -> i64
      %6725 = func.call @cc_cons(%6723, %6724) : (i64, i64) -> i64
      %6726 = func.call @cc_values_pack(%6725) : (i64) -> i64
      func.call @stack_push_pointer(%6723) : (i64) -> ()
      %6727 = arith.constant 137 : i64
      func.call @stack_push_fixnum(%6727) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6728 = func.call @stack_pop_pointer() : () -> i64
      %6729 = func.call @stack_pop_pointer() : () -> i64
      %6730 = func.call @cc_cons(%6729, %6728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6730) : (i64) -> ()
      %6731 = func.call @stack_pop_pointer() : () -> i64
      %6732 = func.call @stack_pop_pointer() : () -> i64
      %6733 = func.call @cc_cons(%6732, %6731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6734 = func.call @stack_pop_pointer() : () -> i64
      %6735 = func.call @stack_pop_pointer() : () -> i64
      %6736 = func.call @cc_cons(%6735, %6734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6736) : (i64) -> ()
      %6737 = func.call @stack_pop_pointer() : () -> i64
      %6738 = func.call @stack_pop_pointer() : () -> i64
      %6739 = func.call @cc_cons(%6738, %6737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6739) : (i64) -> ()
      %6740 = func.call @stack_pop_pointer() : () -> i64
      %6741 = func.call @stack_pop_pointer() : () -> i64
      %6742 = func.call @cc_cons(%6741, %6740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6742) : (i64) -> ()
      %6743 = func.call @stack_pop_pointer() : () -> i64
      %6982 = arith.constant 97047688511544 : i64
      %6983 = arith.constant 0 : i64
      %6984 = func.call @cc_make_closure(%6982, %6983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6984) : (i64) -> ()
      %6985 = func.call @stack_pop_pointer() : () -> i64
      %6986 = llvm.mlir.addressof @str610 : !llvm.ptr
      %6987 = arith.constant 1 : i64
      %6988 = func.call @cc_make_string(%6986, %6987) : (!llvm.ptr, i64) -> i64
      %6989 = func.call @cc_nil_value() : () -> i64
      %6990 = func.call @cc_intern(%6988, %6989) : (i64, i64) -> i64
      %6991 = func.call @cc_nil_value() : () -> i64
      %6992 = func.call @cc_cons(%6990, %6991) : (i64, i64) -> i64
      %6993 = func.call @cc_values_pack(%6992) : (i64) -> i64
      func.call @stack_push_pointer(%6990) : (i64) -> ()
      %6994 = arith.constant 137 : i64
      func.call @stack_push_fixnum(%6994) : (i64) -> ()
      %6995 = func.call @stack_pop_pointer() : () -> i64
      %6996 = func.call @stack_pop_pointer() : () -> i64
      %6997 = func.call @cc_cons(%6996, %6995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6998 = func.call @stack_pop_pointer() : () -> i64
      %6999 = func.call @stack_pop_pointer() : () -> i64
      %7000 = func.call @cc_cons(%6999, %6998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7000) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7001 = func.call @stack_pop_pointer() : () -> i64
      %7002 = func.call @stack_pop_pointer() : () -> i64
      %7003 = func.call @cc_cons(%7002, %7001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7003) : (i64) -> ()
      %7004 = func.call @stack_pop_pointer() : () -> i64
      %7005 = llvm.mlir.addressof @str611 : !llvm.ptr
      %7006 = arith.constant 11 : i64
      %7007 = func.call @cc_make_string(%7005, %7006) : (!llvm.ptr, i64) -> i64
      %7008 = llvm.mlir.addressof @str612 : !llvm.ptr
      %7009 = arith.constant 7 : i64
      %7010 = func.call @cc_make_string(%7008, %7009) : (!llvm.ptr, i64) -> i64
      %7011 = func.call @cc_intern(%7007, %7010) : (i64, i64) -> i64
      %7012 = func.call @cc_nil_value() : () -> i64
      %7013 = func.call @cc_cons(%7011, %7012) : (i64, i64) -> i64
      %7014 = func.call @cc_values_pack(%7013) : (i64) -> i64
      func.call @stack_push_pointer(%7011) : (i64) -> ()
      %7015 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7016 = func.call @stack_pop_pointer() : () -> i64
      %7017 = llvm.mlir.addressof @str613 : !llvm.ptr
      %7018 = arith.constant 4 : i64
      %7019 = func.call @cc_make_string(%7017, %7018) : (!llvm.ptr, i64) -> i64
      %7020 = llvm.mlir.addressof @str614 : !llvm.ptr
      %7021 = arith.constant 7 : i64
      %7022 = func.call @cc_make_string(%7020, %7021) : (!llvm.ptr, i64) -> i64
      %7023 = func.call @cc_intern(%7019, %7022) : (i64, i64) -> i64
      %7024 = func.call @cc_nil_value() : () -> i64
      %7025 = func.call @cc_cons(%7023, %7024) : (i64, i64) -> i64
      %7026 = func.call @cc_values_pack(%7025) : (i64) -> i64
      func.call @stack_push_pointer(%7023) : (i64) -> ()
      %7027 = func.call @stack_pop_pointer() : () -> i64
      %7028 = llvm.mlir.addressof @str615 : !llvm.ptr
      %7029 = arith.constant 6 : i64
      %7030 = func.call @cc_make_string(%7028, %7029) : (!llvm.ptr, i64) -> i64
      %7031 = func.call @cc_nil_value() : () -> i64
      %7032 = func.call @cc_intern(%7030, %7031) : (i64, i64) -> i64
      %7033 = func.call @cc_nil_value() : () -> i64
      %7034 = func.call @cc_cons(%7032, %7033) : (i64, i64) -> i64
      %7035 = func.call @cc_values_pack(%7034) : (i64) -> i64
      func.call @stack_push_pointer(%7032) : (i64) -> ()
      %7036 = func.call @stack_pop_pointer() : () -> i64
      %7037 = func.call @cc_nil_value() : () -> i64
      %7038 = func.call @cc_errorp(%6425) : (i64) -> i64
      %7039 = arith.cmpi ne, %7038, %7037 : i64
      %7040 = arith.cmpi eq, %7037, %7037 : i64
      %7041 = arith.andi %7039, %7040 : i1
      %7042 = scf.if %7041 -> (i64) {
        scf.yield %6425 : i64
      } else {
        scf.yield %7037 : i64
      }
      %7043 = func.call @cc_errorp(%6743) : (i64) -> i64
      %7044 = arith.cmpi ne, %7043, %7037 : i64
      %7045 = arith.cmpi eq, %7042, %7037 : i64
      %7046 = arith.andi %7044, %7045 : i1
      %7047 = scf.if %7046 -> (i64) {
        scf.yield %6743 : i64
      } else {
        scf.yield %7042 : i64
      }
      %7048 = func.call @cc_errorp(%6985) : (i64) -> i64
      %7049 = arith.cmpi ne, %7048, %7037 : i64
      %7050 = arith.cmpi eq, %7047, %7037 : i64
      %7051 = arith.andi %7049, %7050 : i1
      %7052 = scf.if %7051 -> (i64) {
        scf.yield %6985 : i64
      } else {
        scf.yield %7047 : i64
      }
      %7053 = func.call @cc_errorp(%7004) : (i64) -> i64
      %7054 = arith.cmpi ne, %7053, %7037 : i64
      %7055 = arith.cmpi eq, %7052, %7037 : i64
      %7056 = arith.andi %7054, %7055 : i1
      %7057 = scf.if %7056 -> (i64) {
        scf.yield %7004 : i64
      } else {
        scf.yield %7052 : i64
      }
      %7058 = func.call @cc_errorp(%7015) : (i64) -> i64
      %7059 = arith.cmpi ne, %7058, %7037 : i64
      %7060 = arith.cmpi eq, %7057, %7037 : i64
      %7061 = arith.andi %7059, %7060 : i1
      %7062 = scf.if %7061 -> (i64) {
        scf.yield %7015 : i64
      } else {
        scf.yield %7057 : i64
      }
      %7063 = func.call @cc_errorp(%7016) : (i64) -> i64
      %7064 = arith.cmpi ne, %7063, %7037 : i64
      %7065 = arith.cmpi eq, %7062, %7037 : i64
      %7066 = arith.andi %7064, %7065 : i1
      %7067 = scf.if %7066 -> (i64) {
        scf.yield %7016 : i64
      } else {
        scf.yield %7062 : i64
      }
      %7068 = func.call @cc_errorp(%7027) : (i64) -> i64
      %7069 = arith.cmpi ne, %7068, %7037 : i64
      %7070 = arith.cmpi eq, %7067, %7037 : i64
      %7071 = arith.andi %7069, %7070 : i1
      %7072 = scf.if %7071 -> (i64) {
        scf.yield %7027 : i64
      } else {
        scf.yield %7067 : i64
      }
      %7073 = func.call @cc_errorp(%7036) : (i64) -> i64
      %7074 = arith.cmpi ne, %7073, %7037 : i64
      %7075 = arith.cmpi eq, %7072, %7037 : i64
      %7076 = arith.andi %7074, %7075 : i1
      %7077 = scf.if %7076 -> (i64) {
        scf.yield %7036 : i64
      } else {
        scf.yield %7072 : i64
      }
      %7078 = arith.cmpi ne, %7077, %7037 : i64
      scf.if %7078 {
        func.call @stack_push_pointer(%7077) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6425) : (i64) -> ()
        func.call @stack_push_pointer(%6743) : (i64) -> ()
        func.call @stack_push_pointer(%6985) : (i64) -> ()
        func.call @stack_push_pointer(%7004) : (i64) -> ()
        func.call @stack_push_pointer(%7015) : (i64) -> ()
        func.call @stack_push_pointer(%7016) : (i64) -> ()
        func.call @stack_push_pointer(%7027) : (i64) -> ()
        func.call @stack_push_pointer(%7036) : (i64) -> ()
        %7079 = llvm.mlir.addressof @str616 : !llvm.ptr
        %7080 = func.call @cc_make_function_ref_const(%7079) : (!llvm.ptr) -> i64
        %7081 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7080, %7081) : (i64, i64) -> ()
      }
      %7082 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7082 : i64
    }
    %7083 = func.call @cc_nil_value() : () -> i64
    %7084 = func.call @cc_errorp(%6416) : (i64) -> i64
    %7085 = arith.cmpi ne, %7084, %7083 : i64
    %7086 = scf.if %7085 -> (i64) {
      scf.yield %6416 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %7087 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7088 = func.call @stack_pop_pointer() : () -> i64
      %7089 = llvm.mlir.addressof @str617 : !llvm.ptr
      %7090 = arith.constant 18 : i64
      %7091 = func.call @cc_make_string(%7089, %7090) : (!llvm.ptr, i64) -> i64
      %7092 = func.call @cc_nil_value() : () -> i64
      %7093 = func.call @cc_intern(%7091, %7092) : (i64, i64) -> i64
      %7094 = func.call @cc_nil_value() : () -> i64
      %7095 = func.call @cc_cons(%7093, %7094) : (i64, i64) -> i64
      %7096 = func.call @cc_values_pack(%7095) : (i64) -> i64
      %7097 = func.call @cc_defclass(%7093, %7087, %7088) : (i64, i64, i64) -> i64
      %7098 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7098) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7099 = func.call @stack_pop_pointer() : () -> i64
      %7100 = func.call @stack_pop_pointer() : () -> i64
      %7101 = func.call @cc_cons(%7099, %7100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7101) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7102 = func.call @stack_pop_pointer() : () -> i64
      %7103 = func.call @stack_pop_pointer() : () -> i64
      %7104 = func.call @cc_cons(%7102, %7103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7104) : (i64) -> ()
      %7105 = llvm.mlir.addressof @str618 : !llvm.ptr
      %7106 = arith.constant 18 : i64
      %7107 = func.call @cc_make_string(%7105, %7106) : (!llvm.ptr, i64) -> i64
      %7108 = func.call @cc_nil_value() : () -> i64
      %7109 = func.call @cc_intern(%7107, %7108) : (i64, i64) -> i64
      %7110 = func.call @cc_nil_value() : () -> i64
      %7111 = func.call @cc_cons(%7109, %7110) : (i64, i64) -> i64
      %7112 = func.call @cc_values_pack(%7111) : (i64) -> i64
      func.call @stack_push_pointer(%7109) : (i64) -> ()
      %7113 = func.call @stack_pop_pointer() : () -> i64
      %7114 = func.call @stack_pop_pointer() : () -> i64
      %7115 = func.call @cc_cons(%7113, %7114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7115) : (i64) -> ()
      %7116 = llvm.mlir.addressof @str619 : !llvm.ptr
      %7117 = arith.constant 8 : i64
      %7118 = func.call @cc_make_string(%7116, %7117) : (!llvm.ptr, i64) -> i64
      %7119 = func.call @cc_nil_value() : () -> i64
      %7120 = func.call @cc_intern(%7118, %7119) : (i64, i64) -> i64
      %7121 = func.call @cc_nil_value() : () -> i64
      %7122 = func.call @cc_cons(%7120, %7121) : (i64, i64) -> i64
      %7123 = func.call @cc_values_pack(%7122) : (i64) -> i64
      func.call @stack_push_pointer(%7120) : (i64) -> ()
      %7124 = func.call @stack_pop_pointer() : () -> i64
      %7125 = func.call @stack_pop_pointer() : () -> i64
      %7126 = func.call @cc_cons(%7124, %7125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7126) : (i64) -> ()
      %7127 = func.call @stack_pop_pointer() : () -> i64
      %7128 = func.call @cc_nil_value() : () -> i64
      %7129 = func.call @cc_cons(%7127, %7128) : (i64, i64) -> i64
      %7130 = func.call @cc_eval(%7129) : (i64) -> i64
      %7131 = func.call @cc_multiple_value_list(%7130) : (i64) -> i64
      %7132 = func.call @cc_values_pack(%7131) : (i64) -> i64
      func.call @stack_push_pointer(%7132) : (i64) -> ()
      %7133 = func.call @stack_depth() : () -> i64
      %7134 = arith.constant 0 : i64
      %7135 = arith.cmpi sgt, %7133, %7134 : i64
      scf.if %7135 {
        %7136 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%7093) : (i64) -> ()
      %7137 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7137 : i64
    }
    %7138 = func.call @cc_nil_value() : () -> i64
    %7139 = func.call @cc_errorp(%7086) : (i64) -> i64
    %7140 = arith.cmpi ne, %7139, %7138 : i64
    %7141 = scf.if %7140 -> (i64) {
      scf.yield %7086 : i64
    } else {
      %7162 = llvm.mlir.addressof @method_name_97047688511550 : !llvm.ptr
      %7163 = func.call @cc_make_lambda_ref_str(%7162) : (!llvm.ptr) -> i64
      %7164 = llvm.mlir.addressof @str623 : !llvm.ptr
      %7165 = arith.constant 12 : i64
      %7166 = func.call @cc_make_string(%7164, %7165) : (!llvm.ptr, i64) -> i64
      %7167 = llvm.mlir.addressof @str624 : !llvm.ptr
      %7168 = arith.constant 11 : i64
      %7169 = func.call @cc_make_string(%7167, %7168) : (!llvm.ptr, i64) -> i64
      %7170 = func.call @cc_intern(%7166, %7169) : (i64, i64) -> i64
      %7171 = func.call @cc_nil_value() : () -> i64
      %7172 = func.call @cc_cons(%7170, %7171) : (i64, i64) -> i64
      %7173 = func.call @cc_values_pack(%7172) : (i64) -> i64
      %7174 = func.call @cc_nil() : () -> i64
      %7175 = llvm.mlir.addressof @str625 : !llvm.ptr
      %7176 = arith.constant 1 : i64
      %7177 = func.call @cc_make_string(%7175, %7176) : (!llvm.ptr, i64) -> i64
      %7178 = func.call @cc_nil_value() : () -> i64
      %7179 = func.call @cc_intern(%7177, %7178) : (i64, i64) -> i64
      %7180 = func.call @cc_nil_value() : () -> i64
      %7181 = func.call @cc_cons(%7179, %7180) : (i64, i64) -> i64
      %7182 = func.call @cc_values_pack(%7181) : (i64) -> i64
      %7183 = func.call @cc_cons(%7179, %7174) : (i64, i64) -> i64
      %7184 = llvm.mlir.addressof @str626 : !llvm.ptr
      %7185 = arith.constant 18 : i64
      %7186 = func.call @cc_make_string(%7184, %7185) : (!llvm.ptr, i64) -> i64
      %7187 = func.call @cc_nil_value() : () -> i64
      %7188 = func.call @cc_intern(%7186, %7187) : (i64, i64) -> i64
      %7189 = func.call @cc_nil_value() : () -> i64
      %7190 = func.call @cc_cons(%7188, %7189) : (i64, i64) -> i64
      %7191 = func.call @cc_values_pack(%7190) : (i64) -> i64
      %7192 = func.call @cc_cons(%7188, %7183) : (i64, i64) -> i64
      %7193 = arith.constant 2 : i64
      %7194 = func.call @cc_box_fixnum(%7193) : (i64) -> i64
      %7195 = arith.constant 0 : i64
      %7196 = func.call @cc_defmethod_qualified(%7170, %7192, %7163, %7194, %7195) : (i64, i64, i64, i64, i64) -> i64
      %7197 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7197) : (i64) -> ()
      %7198 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7198) : (i64) -> ()
      %7199 = llvm.mlir.addressof @str627 : !llvm.ptr
      %7200 = arith.constant 52 : i64
      %7201 = func.call @cc_make_string(%7199, %7200) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7201) : (i64) -> ()
      %7202 = func.call @stack_pop_pointer() : () -> i64
      %7203 = func.call @stack_pop_pointer() : () -> i64
      %7204 = func.call @cc_cons(%7202, %7203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7204) : (i64) -> ()
      %7205 = llvm.mlir.addressof @str628 : !llvm.ptr
      %7206 = arith.constant 5 : i64
      %7207 = func.call @cc_make_string(%7205, %7206) : (!llvm.ptr, i64) -> i64
      %7208 = llvm.mlir.addressof @str629 : !llvm.ptr
      %7209 = arith.constant 11 : i64
      %7210 = func.call @cc_make_string(%7208, %7209) : (!llvm.ptr, i64) -> i64
      %7211 = func.call @cc_intern(%7207, %7210) : (i64, i64) -> i64
      %7212 = func.call @cc_nil_value() : () -> i64
      %7213 = func.call @cc_cons(%7211, %7212) : (i64, i64) -> i64
      %7214 = func.call @cc_values_pack(%7213) : (i64) -> i64
      func.call @stack_push_pointer(%7211) : (i64) -> ()
      %7215 = func.call @stack_pop_pointer() : () -> i64
      %7216 = func.call @stack_pop_pointer() : () -> i64
      %7217 = func.call @cc_cons(%7215, %7216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7217) : (i64) -> ()
      %7218 = func.call @stack_pop_pointer() : () -> i64
      %7219 = func.call @stack_pop_pointer() : () -> i64
      %7220 = func.call @cc_cons(%7218, %7219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7220) : (i64) -> ()
      %7221 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7221) : (i64) -> ()
      %7222 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7222) : (i64) -> ()
      %7223 = llvm.mlir.addressof @str630 : !llvm.ptr
      %7224 = arith.constant 1 : i64
      %7225 = func.call @cc_make_string(%7223, %7224) : (!llvm.ptr, i64) -> i64
      %7226 = func.call @cc_nil_value() : () -> i64
      %7227 = func.call @cc_intern(%7225, %7226) : (i64, i64) -> i64
      %7228 = func.call @cc_nil_value() : () -> i64
      %7229 = func.call @cc_cons(%7227, %7228) : (i64, i64) -> i64
      %7230 = func.call @cc_values_pack(%7229) : (i64) -> i64
      func.call @stack_push_pointer(%7227) : (i64) -> ()
      %7231 = func.call @stack_pop_pointer() : () -> i64
      %7232 = func.call @stack_pop_pointer() : () -> i64
      %7233 = func.call @cc_cons(%7231, %7232) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7233) : (i64) -> ()
      %7234 = llvm.mlir.addressof @str631 : !llvm.ptr
      %7235 = arith.constant 6 : i64
      %7236 = func.call @cc_make_string(%7234, %7235) : (!llvm.ptr, i64) -> i64
      %7237 = llvm.mlir.addressof @str632 : !llvm.ptr
      %7238 = arith.constant 11 : i64
      %7239 = func.call @cc_make_string(%7237, %7238) : (!llvm.ptr, i64) -> i64
      %7240 = func.call @cc_intern(%7236, %7239) : (i64, i64) -> i64
      %7241 = func.call @cc_nil_value() : () -> i64
      %7242 = func.call @cc_cons(%7240, %7241) : (i64, i64) -> i64
      %7243 = func.call @cc_values_pack(%7242) : (i64) -> i64
      func.call @stack_push_pointer(%7240) : (i64) -> ()
      %7244 = func.call @stack_pop_pointer() : () -> i64
      %7245 = func.call @stack_pop_pointer() : () -> i64
      %7246 = func.call @cc_cons(%7244, %7245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7246) : (i64) -> ()
      %7247 = func.call @stack_pop_pointer() : () -> i64
      %7248 = func.call @stack_pop_pointer() : () -> i64
      %7249 = func.call @cc_cons(%7247, %7248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7249) : (i64) -> ()
      %7250 = llvm.mlir.addressof @str633 : !llvm.ptr
      %7251 = arith.constant 7 : i64
      %7252 = func.call @cc_make_string(%7250, %7251) : (!llvm.ptr, i64) -> i64
      %7253 = llvm.mlir.addressof @str634 : !llvm.ptr
      %7254 = arith.constant 11 : i64
      %7255 = func.call @cc_make_string(%7253, %7254) : (!llvm.ptr, i64) -> i64
      %7256 = func.call @cc_intern(%7252, %7255) : (i64, i64) -> i64
      %7257 = func.call @cc_nil_value() : () -> i64
      %7258 = func.call @cc_cons(%7256, %7257) : (i64, i64) -> i64
      %7259 = func.call @cc_values_pack(%7258) : (i64) -> i64
      func.call @stack_push_pointer(%7256) : (i64) -> ()
      %7260 = func.call @stack_pop_pointer() : () -> i64
      %7261 = func.call @stack_pop_pointer() : () -> i64
      %7262 = func.call @cc_cons(%7260, %7261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7262) : (i64) -> ()
      %7263 = func.call @stack_pop_pointer() : () -> i64
      %7264 = func.call @stack_pop_pointer() : () -> i64
      %7265 = func.call @cc_cons(%7263, %7264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7265) : (i64) -> ()
      %7266 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7266) : (i64) -> ()
      %7267 = llvm.mlir.addressof @str635 : !llvm.ptr
      %7268 = arith.constant 1 : i64
      %7269 = func.call @cc_make_string(%7267, %7268) : (!llvm.ptr, i64) -> i64
      %7270 = func.call @cc_nil_value() : () -> i64
      %7271 = func.call @cc_intern(%7269, %7270) : (i64, i64) -> i64
      %7272 = func.call @cc_nil_value() : () -> i64
      %7273 = func.call @cc_cons(%7271, %7272) : (i64, i64) -> i64
      %7274 = func.call @cc_values_pack(%7273) : (i64) -> i64
      func.call @stack_push_pointer(%7271) : (i64) -> ()
      %7275 = func.call @stack_pop_pointer() : () -> i64
      %7276 = func.call @stack_pop_pointer() : () -> i64
      %7277 = func.call @cc_cons(%7275, %7276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7277) : (i64) -> ()
      %7278 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7278) : (i64) -> ()
      %7279 = llvm.mlir.addressof @str636 : !llvm.ptr
      %7280 = arith.constant 18 : i64
      %7281 = func.call @cc_make_string(%7279, %7280) : (!llvm.ptr, i64) -> i64
      %7282 = func.call @cc_nil_value() : () -> i64
      %7283 = func.call @cc_intern(%7281, %7282) : (i64, i64) -> i64
      %7284 = func.call @cc_nil_value() : () -> i64
      %7285 = func.call @cc_cons(%7283, %7284) : (i64, i64) -> i64
      %7286 = func.call @cc_values_pack(%7285) : (i64) -> i64
      func.call @stack_push_pointer(%7283) : (i64) -> ()
      %7287 = func.call @stack_pop_pointer() : () -> i64
      %7288 = func.call @stack_pop_pointer() : () -> i64
      %7289 = func.call @cc_cons(%7287, %7288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7289) : (i64) -> ()
      %7290 = llvm.mlir.addressof @str637 : !llvm.ptr
      %7291 = arith.constant 1 : i64
      %7292 = func.call @cc_make_string(%7290, %7291) : (!llvm.ptr, i64) -> i64
      %7293 = func.call @cc_nil_value() : () -> i64
      %7294 = func.call @cc_intern(%7292, %7293) : (i64, i64) -> i64
      %7295 = func.call @cc_nil_value() : () -> i64
      %7296 = func.call @cc_cons(%7294, %7295) : (i64, i64) -> i64
      %7297 = func.call @cc_values_pack(%7296) : (i64) -> i64
      func.call @stack_push_pointer(%7294) : (i64) -> ()
      %7298 = func.call @stack_pop_pointer() : () -> i64
      %7299 = func.call @stack_pop_pointer() : () -> i64
      %7300 = func.call @cc_cons(%7298, %7299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7300) : (i64) -> ()
      %7301 = func.call @stack_pop_pointer() : () -> i64
      %7302 = func.call @stack_pop_pointer() : () -> i64
      %7303 = func.call @cc_cons(%7301, %7302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7303) : (i64) -> ()
      %7304 = func.call @stack_pop_pointer() : () -> i64
      %7305 = func.call @stack_pop_pointer() : () -> i64
      %7306 = func.call @cc_cons(%7304, %7305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7306) : (i64) -> ()
      %7307 = llvm.mlir.addressof @str638 : !llvm.ptr
      %7308 = arith.constant 12 : i64
      %7309 = func.call @cc_make_string(%7307, %7308) : (!llvm.ptr, i64) -> i64
      %7310 = llvm.mlir.addressof @str639 : !llvm.ptr
      %7311 = arith.constant 11 : i64
      %7312 = func.call @cc_make_string(%7310, %7311) : (!llvm.ptr, i64) -> i64
      %7313 = func.call @cc_intern(%7309, %7312) : (i64, i64) -> i64
      %7314 = func.call @cc_nil_value() : () -> i64
      %7315 = func.call @cc_cons(%7313, %7314) : (i64, i64) -> i64
      %7316 = func.call @cc_values_pack(%7315) : (i64) -> i64
      func.call @stack_push_pointer(%7313) : (i64) -> ()
      %7317 = func.call @stack_pop_pointer() : () -> i64
      %7318 = func.call @stack_pop_pointer() : () -> i64
      %7319 = func.call @cc_cons(%7317, %7318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7319) : (i64) -> ()
      %7320 = llvm.mlir.addressof @str640 : !llvm.ptr
      %7321 = arith.constant 9 : i64
      %7322 = func.call @cc_make_string(%7320, %7321) : (!llvm.ptr, i64) -> i64
      %7323 = func.call @cc_nil_value() : () -> i64
      %7324 = func.call @cc_intern(%7322, %7323) : (i64, i64) -> i64
      %7325 = func.call @cc_nil_value() : () -> i64
      %7326 = func.call @cc_cons(%7324, %7325) : (i64, i64) -> i64
      %7327 = func.call @cc_values_pack(%7326) : (i64) -> i64
      func.call @stack_push_pointer(%7324) : (i64) -> ()
      %7328 = func.call @stack_pop_pointer() : () -> i64
      %7329 = func.call @stack_pop_pointer() : () -> i64
      %7330 = func.call @cc_cons(%7328, %7329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7330) : (i64) -> ()
      %7331 = func.call @stack_pop_pointer() : () -> i64
      %7332 = func.call @cc_nil_value() : () -> i64
      %7333 = func.call @cc_cons(%7331, %7332) : (i64, i64) -> i64
      %7334 = func.call @cc_eval(%7333) : (i64) -> i64
      %7335 = func.call @cc_multiple_value_list(%7334) : (i64) -> i64
      %7336 = func.call @cc_values_pack(%7335) : (i64) -> i64
      func.call @stack_push_pointer(%7336) : (i64) -> ()
      %7337 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7337 : i64
    }
    %7338 = func.call @cc_nil_value() : () -> i64
    %7339 = func.call @cc_errorp(%7141) : (i64) -> i64
    %7340 = arith.cmpi ne, %7339, %7338 : i64
    %7341 = scf.if %7340 -> (i64) {
      scf.yield %7141 : i64
    } else {
      %7342 = llvm.mlir.addressof @str641 : !llvm.ptr
      %7343 = arith.constant 30 : i64
      %7344 = func.call @cc_make_string(%7342, %7343) : (!llvm.ptr, i64) -> i64
      %7345 = func.call @cc_nil_value() : () -> i64
      %7346 = func.call @cc_intern(%7344, %7345) : (i64, i64) -> i64
      %7347 = func.call @cc_nil_value() : () -> i64
      %7348 = func.call @cc_cons(%7346, %7347) : (i64, i64) -> i64
      %7349 = func.call @cc_values_pack(%7348) : (i64) -> i64
      func.call @stack_push_pointer(%7346) : (i64) -> ()
      %7350 = func.call @stack_pop_pointer() : () -> i64
      %7351 = llvm.mlir.addressof @str642 : !llvm.ptr
      %7352 = arith.constant 3 : i64
      %7353 = func.call @cc_make_string(%7351, %7352) : (!llvm.ptr, i64) -> i64
      %7354 = func.call @cc_nil_value() : () -> i64
      %7355 = func.call @cc_intern(%7353, %7354) : (i64, i64) -> i64
      %7356 = func.call @cc_nil_value() : () -> i64
      %7357 = func.call @cc_cons(%7355, %7356) : (i64, i64) -> i64
      %7358 = func.call @cc_values_pack(%7357) : (i64) -> i64
      func.call @stack_push_pointer(%7355) : (i64) -> ()
      %7359 = llvm.mlir.addressof @str643 : !llvm.ptr
      %7360 = arith.constant 3 : i64
      %7361 = func.call @cc_make_string(%7359, %7360) : (!llvm.ptr, i64) -> i64
      %7362 = func.call @cc_nil_value() : () -> i64
      %7363 = func.call @cc_intern(%7361, %7362) : (i64, i64) -> i64
      %7364 = func.call @cc_nil_value() : () -> i64
      %7365 = func.call @cc_cons(%7363, %7364) : (i64, i64) -> i64
      %7366 = func.call @cc_values_pack(%7365) : (i64) -> i64
      func.call @stack_push_pointer(%7363) : (i64) -> ()
      %7367 = llvm.mlir.addressof @str644 : !llvm.ptr
      %7368 = arith.constant 5 : i64
      %7369 = func.call @cc_make_string(%7367, %7368) : (!llvm.ptr, i64) -> i64
      %7370 = func.call @cc_nil_value() : () -> i64
      %7371 = func.call @cc_intern(%7369, %7370) : (i64, i64) -> i64
      %7372 = func.call @cc_nil_value() : () -> i64
      %7373 = func.call @cc_cons(%7371, %7372) : (i64, i64) -> i64
      %7374 = func.call @cc_values_pack(%7373) : (i64) -> i64
      func.call @stack_push_pointer(%7371) : (i64) -> ()
      %7375 = llvm.mlir.addressof @str645 : !llvm.ptr
      %7376 = arith.constant 21 : i64
      %7377 = func.call @cc_make_string(%7375, %7376) : (!llvm.ptr, i64) -> i64
      %7378 = llvm.mlir.addressof @str646 : !llvm.ptr
      %7379 = arith.constant 11 : i64
      %7380 = func.call @cc_make_string(%7378, %7379) : (!llvm.ptr, i64) -> i64
      %7381 = func.call @cc_intern(%7377, %7380) : (i64, i64) -> i64
      %7382 = func.call @cc_nil_value() : () -> i64
      %7383 = func.call @cc_cons(%7381, %7382) : (i64, i64) -> i64
      %7384 = func.call @cc_values_pack(%7383) : (i64) -> i64
      func.call @stack_push_pointer(%7381) : (i64) -> ()
      %7385 = llvm.mlir.addressof @str647 : !llvm.ptr
      %7386 = arith.constant 1 : i64
      %7387 = func.call @cc_make_string(%7385, %7386) : (!llvm.ptr, i64) -> i64
      %7388 = func.call @cc_nil_value() : () -> i64
      %7389 = func.call @cc_intern(%7387, %7388) : (i64, i64) -> i64
      %7390 = func.call @cc_nil_value() : () -> i64
      %7391 = func.call @cc_cons(%7389, %7390) : (i64, i64) -> i64
      %7392 = func.call @cc_values_pack(%7391) : (i64) -> i64
      func.call @stack_push_pointer(%7389) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7393 = func.call @stack_pop_pointer() : () -> i64
      %7394 = func.call @stack_pop_pointer() : () -> i64
      %7395 = func.call @cc_cons(%7394, %7393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7395) : (i64) -> ()
      %7396 = llvm.mlir.addressof @str648 : !llvm.ptr
      %7397 = arith.constant 32 : i64
      %7398 = func.call @cc_make_string(%7396, %7397) : (!llvm.ptr, i64) -> i64
      %7399 = func.call @cc_nil_value() : () -> i64
      %7400 = func.call @cc_intern(%7398, %7399) : (i64, i64) -> i64
      %7401 = func.call @cc_nil_value() : () -> i64
      %7402 = func.call @cc_cons(%7400, %7401) : (i64, i64) -> i64
      %7403 = func.call @cc_values_pack(%7402) : (i64) -> i64
      func.call @stack_push_pointer(%7400) : (i64) -> ()
      %7404 = llvm.mlir.addressof @str649 : !llvm.ptr
      %7405 = arith.constant 6 : i64
      %7406 = func.call @cc_make_string(%7404, %7405) : (!llvm.ptr, i64) -> i64
      %7407 = func.call @cc_nil_value() : () -> i64
      %7408 = func.call @cc_intern(%7406, %7407) : (i64, i64) -> i64
      %7409 = func.call @cc_nil_value() : () -> i64
      %7410 = func.call @cc_cons(%7408, %7409) : (i64, i64) -> i64
      %7411 = func.call @cc_values_pack(%7410) : (i64) -> i64
      func.call @stack_push_pointer(%7408) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7412 = llvm.mlir.addressof @str650 : !llvm.ptr
      %7413 = arith.constant 15 : i64
      %7414 = func.call @cc_make_string(%7412, %7413) : (!llvm.ptr, i64) -> i64
      %7415 = llvm.mlir.addressof @str651 : !llvm.ptr
      %7416 = arith.constant 11 : i64
      %7417 = func.call @cc_make_string(%7415, %7416) : (!llvm.ptr, i64) -> i64
      %7418 = func.call @cc_intern(%7414, %7417) : (i64, i64) -> i64
      %7419 = func.call @cc_nil_value() : () -> i64
      %7420 = func.call @cc_cons(%7418, %7419) : (i64, i64) -> i64
      %7421 = func.call @cc_values_pack(%7420) : (i64) -> i64
      func.call @stack_push_pointer(%7418) : (i64) -> ()
      %7422 = llvm.mlir.addressof @str652 : !llvm.ptr
      %7423 = arith.constant 6 : i64
      %7424 = func.call @cc_make_string(%7422, %7423) : (!llvm.ptr, i64) -> i64
      %7425 = llvm.mlir.addressof @str653 : !llvm.ptr
      %7426 = arith.constant 7 : i64
      %7427 = func.call @cc_make_string(%7425, %7426) : (!llvm.ptr, i64) -> i64
      %7428 = func.call @cc_intern(%7424, %7427) : (i64, i64) -> i64
      %7429 = func.call @cc_nil_value() : () -> i64
      %7430 = func.call @cc_cons(%7428, %7429) : (i64, i64) -> i64
      %7431 = func.call @cc_values_pack(%7430) : (i64) -> i64
      func.call @stack_push_pointer(%7428) : (i64) -> ()
      %7432 = llvm.mlir.addressof @str654 : !llvm.ptr
      %7433 = arith.constant 1 : i64
      %7434 = func.call @cc_make_string(%7432, %7433) : (!llvm.ptr, i64) -> i64
      %7435 = func.call @cc_nil_value() : () -> i64
      %7436 = func.call @cc_intern(%7434, %7435) : (i64, i64) -> i64
      %7437 = func.call @cc_nil_value() : () -> i64
      %7438 = func.call @cc_cons(%7436, %7437) : (i64, i64) -> i64
      %7439 = func.call @cc_values_pack(%7438) : (i64) -> i64
      func.call @stack_push_pointer(%7436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7440 = func.call @stack_pop_pointer() : () -> i64
      %7441 = func.call @stack_pop_pointer() : () -> i64
      %7442 = func.call @cc_cons(%7441, %7440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7442) : (i64) -> ()
      %7443 = func.call @stack_pop_pointer() : () -> i64
      %7444 = func.call @stack_pop_pointer() : () -> i64
      %7445 = func.call @cc_cons(%7444, %7443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7445) : (i64) -> ()
      %7446 = func.call @stack_pop_pointer() : () -> i64
      %7447 = func.call @stack_pop_pointer() : () -> i64
      %7448 = func.call @cc_cons(%7447, %7446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7448) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7449 = func.call @stack_pop_pointer() : () -> i64
      %7450 = func.call @stack_pop_pointer() : () -> i64
      %7451 = func.call @cc_cons(%7450, %7449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7451) : (i64) -> ()
      %7452 = func.call @stack_pop_pointer() : () -> i64
      %7453 = func.call @stack_pop_pointer() : () -> i64
      %7454 = func.call @cc_cons(%7453, %7452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7454) : (i64) -> ()
      %7455 = func.call @stack_pop_pointer() : () -> i64
      %7456 = func.call @stack_pop_pointer() : () -> i64
      %7457 = func.call @cc_cons(%7456, %7455) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7457) : (i64) -> ()
      %7458 = llvm.mlir.addressof @str655 : !llvm.ptr
      %7459 = arith.constant 13 : i64
      %7460 = func.call @cc_make_string(%7458, %7459) : (!llvm.ptr, i64) -> i64
      %7461 = llvm.mlir.addressof @str656 : !llvm.ptr
      %7462 = arith.constant 11 : i64
      %7463 = func.call @cc_make_string(%7461, %7462) : (!llvm.ptr, i64) -> i64
      %7464 = func.call @cc_intern(%7460, %7463) : (i64, i64) -> i64
      %7465 = func.call @cc_nil_value() : () -> i64
      %7466 = func.call @cc_cons(%7464, %7465) : (i64, i64) -> i64
      %7467 = func.call @cc_values_pack(%7466) : (i64) -> i64
      func.call @stack_push_pointer(%7464) : (i64) -> ()
      %7468 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7468) : (i64) -> ()
      %7469 = llvm.mlir.addressof @str657 : !llvm.ptr
      %7470 = arith.constant 18 : i64
      %7471 = func.call @cc_make_string(%7469, %7470) : (!llvm.ptr, i64) -> i64
      %7472 = func.call @cc_nil_value() : () -> i64
      %7473 = func.call @cc_intern(%7471, %7472) : (i64, i64) -> i64
      %7474 = func.call @cc_nil_value() : () -> i64
      %7475 = func.call @cc_cons(%7473, %7474) : (i64, i64) -> i64
      %7476 = func.call @cc_values_pack(%7475) : (i64) -> i64
      func.call @stack_push_pointer(%7473) : (i64) -> ()
      %7477 = func.call @stack_pop_pointer() : () -> i64
      %7478 = func.call @stack_pop_pointer() : () -> i64
      %7479 = func.call @cc_cons(%7477, %7478) : (i64, i64) -> i64
      %7480 = llvm.mlir.addressof @str658 : !llvm.ptr
      %7481 = arith.constant 5 : i64
      %7482 = func.call @cc_make_string(%7480, %7481) : (!llvm.ptr, i64) -> i64
      %7483 = func.call @cc_nil_value() : () -> i64
      %7484 = func.call @cc_intern(%7482, %7483) : (i64, i64) -> i64
      %7485 = func.call @cc_nil_value() : () -> i64
      %7486 = func.call @cc_cons(%7484, %7485) : (i64, i64) -> i64
      %7487 = func.call @cc_values_pack(%7486) : (i64) -> i64
      %7488 = func.call @cc_cons(%7484, %7479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7489 = func.call @stack_pop_pointer() : () -> i64
      %7490 = func.call @stack_pop_pointer() : () -> i64
      %7491 = func.call @cc_cons(%7490, %7489) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7491) : (i64) -> ()
      %7492 = func.call @stack_pop_pointer() : () -> i64
      %7493 = func.call @stack_pop_pointer() : () -> i64
      %7494 = func.call @cc_cons(%7493, %7492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7494) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7495 = func.call @stack_pop_pointer() : () -> i64
      %7496 = func.call @stack_pop_pointer() : () -> i64
      %7497 = func.call @cc_cons(%7496, %7495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7497) : (i64) -> ()
      %7498 = func.call @stack_pop_pointer() : () -> i64
      %7499 = func.call @stack_pop_pointer() : () -> i64
      %7500 = func.call @cc_cons(%7499, %7498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7500) : (i64) -> ()
      %7501 = func.call @stack_pop_pointer() : () -> i64
      %7502 = func.call @stack_pop_pointer() : () -> i64
      %7503 = func.call @cc_cons(%7502, %7501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7503) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7504 = func.call @stack_pop_pointer() : () -> i64
      %7505 = func.call @stack_pop_pointer() : () -> i64
      %7506 = func.call @cc_cons(%7505, %7504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7506) : (i64) -> ()
      %7507 = func.call @stack_pop_pointer() : () -> i64
      %7508 = func.call @stack_pop_pointer() : () -> i64
      %7509 = func.call @cc_cons(%7508, %7507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7509) : (i64) -> ()
      %7510 = func.call @stack_pop_pointer() : () -> i64
      %7511 = func.call @stack_pop_pointer() : () -> i64
      %7512 = func.call @cc_cons(%7511, %7510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7512) : (i64) -> ()
      %7513 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%7513) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7514 = func.call @stack_pop_pointer() : () -> i64
      %7515 = func.call @stack_pop_pointer() : () -> i64
      %7516 = func.call @cc_cons(%7515, %7514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7516) : (i64) -> ()
      %7517 = func.call @stack_pop_pointer() : () -> i64
      %7518 = func.call @stack_pop_pointer() : () -> i64
      %7519 = func.call @cc_cons(%7518, %7517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7519) : (i64) -> ()
      %7520 = func.call @stack_pop_pointer() : () -> i64
      %7521 = func.call @stack_pop_pointer() : () -> i64
      %7522 = func.call @cc_cons(%7521, %7520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7523 = func.call @stack_pop_pointer() : () -> i64
      %7524 = func.call @stack_pop_pointer() : () -> i64
      %7525 = func.call @cc_cons(%7524, %7523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7525) : (i64) -> ()
      %7526 = func.call @stack_pop_pointer() : () -> i64
      %7527 = func.call @stack_pop_pointer() : () -> i64
      %7528 = func.call @cc_cons(%7527, %7526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7529 = func.call @stack_pop_pointer() : () -> i64
      %7530 = func.call @stack_pop_pointer() : () -> i64
      %7531 = func.call @cc_cons(%7530, %7529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7531) : (i64) -> ()
      %7532 = func.call @stack_pop_pointer() : () -> i64
      %7533 = func.call @stack_pop_pointer() : () -> i64
      %7534 = func.call @cc_cons(%7533, %7532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7534) : (i64) -> ()
      %7535 = func.call @stack_pop_pointer() : () -> i64
      %7640 = arith.constant 97047688511551 : i64
      %7641 = arith.constant 0 : i64
      %7642 = func.call @cc_make_closure(%7640, %7641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7642) : (i64) -> ()
      %7643 = func.call @stack_pop_pointer() : () -> i64
      %7644 = llvm.mlir.addressof @str665 : !llvm.ptr
      %7645 = arith.constant 1 : i64
      %7646 = func.call @cc_make_string(%7644, %7645) : (!llvm.ptr, i64) -> i64
      %7647 = func.call @cc_nil_value() : () -> i64
      %7648 = func.call @cc_intern(%7646, %7647) : (i64, i64) -> i64
      %7649 = func.call @cc_nil_value() : () -> i64
      %7650 = func.call @cc_cons(%7648, %7649) : (i64, i64) -> i64
      %7651 = func.call @cc_values_pack(%7650) : (i64) -> i64
      func.call @stack_push_pointer(%7648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7652 = func.call @stack_pop_pointer() : () -> i64
      %7653 = func.call @stack_pop_pointer() : () -> i64
      %7654 = func.call @cc_cons(%7653, %7652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7654) : (i64) -> ()
      %7655 = func.call @stack_pop_pointer() : () -> i64
      %7656 = llvm.mlir.addressof @str666 : !llvm.ptr
      %7657 = arith.constant 11 : i64
      %7658 = func.call @cc_make_string(%7656, %7657) : (!llvm.ptr, i64) -> i64
      %7659 = llvm.mlir.addressof @str667 : !llvm.ptr
      %7660 = arith.constant 7 : i64
      %7661 = func.call @cc_make_string(%7659, %7660) : (!llvm.ptr, i64) -> i64
      %7662 = func.call @cc_intern(%7658, %7661) : (i64, i64) -> i64
      %7663 = func.call @cc_nil_value() : () -> i64
      %7664 = func.call @cc_cons(%7662, %7663) : (i64, i64) -> i64
      %7665 = func.call @cc_values_pack(%7664) : (i64) -> i64
      func.call @stack_push_pointer(%7662) : (i64) -> ()
      %7666 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7667 = func.call @stack_pop_pointer() : () -> i64
      %7668 = llvm.mlir.addressof @str668 : !llvm.ptr
      %7669 = arith.constant 4 : i64
      %7670 = func.call @cc_make_string(%7668, %7669) : (!llvm.ptr, i64) -> i64
      %7671 = llvm.mlir.addressof @str669 : !llvm.ptr
      %7672 = arith.constant 7 : i64
      %7673 = func.call @cc_make_string(%7671, %7672) : (!llvm.ptr, i64) -> i64
      %7674 = func.call @cc_intern(%7670, %7673) : (i64, i64) -> i64
      %7675 = func.call @cc_nil_value() : () -> i64
      %7676 = func.call @cc_cons(%7674, %7675) : (i64, i64) -> i64
      %7677 = func.call @cc_values_pack(%7676) : (i64) -> i64
      func.call @stack_push_pointer(%7674) : (i64) -> ()
      %7678 = func.call @stack_pop_pointer() : () -> i64
      %7679 = llvm.mlir.addressof @str670 : !llvm.ptr
      %7680 = arith.constant 6 : i64
      %7681 = func.call @cc_make_string(%7679, %7680) : (!llvm.ptr, i64) -> i64
      %7682 = func.call @cc_nil_value() : () -> i64
      %7683 = func.call @cc_intern(%7681, %7682) : (i64, i64) -> i64
      %7684 = func.call @cc_nil_value() : () -> i64
      %7685 = func.call @cc_cons(%7683, %7684) : (i64, i64) -> i64
      %7686 = func.call @cc_values_pack(%7685) : (i64) -> i64
      func.call @stack_push_pointer(%7683) : (i64) -> ()
      %7687 = func.call @stack_pop_pointer() : () -> i64
      %7688 = func.call @cc_nil_value() : () -> i64
      %7689 = func.call @cc_errorp(%7350) : (i64) -> i64
      %7690 = arith.cmpi ne, %7689, %7688 : i64
      %7691 = arith.cmpi eq, %7688, %7688 : i64
      %7692 = arith.andi %7690, %7691 : i1
      %7693 = scf.if %7692 -> (i64) {
        scf.yield %7350 : i64
      } else {
        scf.yield %7688 : i64
      }
      %7694 = func.call @cc_errorp(%7535) : (i64) -> i64
      %7695 = arith.cmpi ne, %7694, %7688 : i64
      %7696 = arith.cmpi eq, %7693, %7688 : i64
      %7697 = arith.andi %7695, %7696 : i1
      %7698 = scf.if %7697 -> (i64) {
        scf.yield %7535 : i64
      } else {
        scf.yield %7693 : i64
      }
      %7699 = func.call @cc_errorp(%7643) : (i64) -> i64
      %7700 = arith.cmpi ne, %7699, %7688 : i64
      %7701 = arith.cmpi eq, %7698, %7688 : i64
      %7702 = arith.andi %7700, %7701 : i1
      %7703 = scf.if %7702 -> (i64) {
        scf.yield %7643 : i64
      } else {
        scf.yield %7698 : i64
      }
      %7704 = func.call @cc_errorp(%7655) : (i64) -> i64
      %7705 = arith.cmpi ne, %7704, %7688 : i64
      %7706 = arith.cmpi eq, %7703, %7688 : i64
      %7707 = arith.andi %7705, %7706 : i1
      %7708 = scf.if %7707 -> (i64) {
        scf.yield %7655 : i64
      } else {
        scf.yield %7703 : i64
      }
      %7709 = func.call @cc_errorp(%7666) : (i64) -> i64
      %7710 = arith.cmpi ne, %7709, %7688 : i64
      %7711 = arith.cmpi eq, %7708, %7688 : i64
      %7712 = arith.andi %7710, %7711 : i1
      %7713 = scf.if %7712 -> (i64) {
        scf.yield %7666 : i64
      } else {
        scf.yield %7708 : i64
      }
      %7714 = func.call @cc_errorp(%7667) : (i64) -> i64
      %7715 = arith.cmpi ne, %7714, %7688 : i64
      %7716 = arith.cmpi eq, %7713, %7688 : i64
      %7717 = arith.andi %7715, %7716 : i1
      %7718 = scf.if %7717 -> (i64) {
        scf.yield %7667 : i64
      } else {
        scf.yield %7713 : i64
      }
      %7719 = func.call @cc_errorp(%7678) : (i64) -> i64
      %7720 = arith.cmpi ne, %7719, %7688 : i64
      %7721 = arith.cmpi eq, %7718, %7688 : i64
      %7722 = arith.andi %7720, %7721 : i1
      %7723 = scf.if %7722 -> (i64) {
        scf.yield %7678 : i64
      } else {
        scf.yield %7718 : i64
      }
      %7724 = func.call @cc_errorp(%7687) : (i64) -> i64
      %7725 = arith.cmpi ne, %7724, %7688 : i64
      %7726 = arith.cmpi eq, %7723, %7688 : i64
      %7727 = arith.andi %7725, %7726 : i1
      %7728 = scf.if %7727 -> (i64) {
        scf.yield %7687 : i64
      } else {
        scf.yield %7723 : i64
      }
      %7729 = arith.cmpi ne, %7728, %7688 : i64
      scf.if %7729 {
        func.call @stack_push_pointer(%7728) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7350) : (i64) -> ()
        func.call @stack_push_pointer(%7535) : (i64) -> ()
        func.call @stack_push_pointer(%7643) : (i64) -> ()
        func.call @stack_push_pointer(%7655) : (i64) -> ()
        func.call @stack_push_pointer(%7666) : (i64) -> ()
        func.call @stack_push_pointer(%7667) : (i64) -> ()
        func.call @stack_push_pointer(%7678) : (i64) -> ()
        func.call @stack_push_pointer(%7687) : (i64) -> ()
        %7730 = llvm.mlir.addressof @str671 : !llvm.ptr
        %7731 = func.call @cc_make_function_ref_const(%7730) : (!llvm.ptr) -> i64
        %7732 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7731, %7732) : (i64, i64) -> ()
      }
      %7733 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7733 : i64
    }
    %7734 = func.call @cc_nil_value() : () -> i64
    %7735 = func.call @cc_errorp(%7341) : (i64) -> i64
    %7736 = arith.cmpi ne, %7735, %7734 : i64
    %7737 = scf.if %7736 -> (i64) {
      scf.yield %7341 : i64
    } else {
      %7738 = llvm.mlir.addressof @str672 : !llvm.ptr
      %7739 = arith.constant 14 : i64
      %7740 = func.call @cc_make_string(%7738, %7739) : (!llvm.ptr, i64) -> i64
      %7741 = func.call @cc_nil_value() : () -> i64
      %7742 = func.call @cc_intern(%7740, %7741) : (i64, i64) -> i64
      %7743 = func.call @cc_nil_value() : () -> i64
      %7744 = func.call @cc_cons(%7742, %7743) : (i64, i64) -> i64
      %7745 = func.call @cc_values_pack(%7744) : (i64) -> i64
      func.call @stack_push_pointer(%7742) : (i64) -> ()
      %7746 = func.call @stack_pop_pointer() : () -> i64
      %7747 = llvm.mlir.addressof @str673 : !llvm.ptr
      %7748 = arith.constant 3 : i64
      %7749 = func.call @cc_make_string(%7747, %7748) : (!llvm.ptr, i64) -> i64
      %7750 = func.call @cc_nil_value() : () -> i64
      %7751 = func.call @cc_intern(%7749, %7750) : (i64, i64) -> i64
      %7752 = func.call @cc_nil_value() : () -> i64
      %7753 = func.call @cc_cons(%7751, %7752) : (i64, i64) -> i64
      %7754 = func.call @cc_values_pack(%7753) : (i64) -> i64
      func.call @stack_push_pointer(%7751) : (i64) -> ()
      %7755 = llvm.mlir.addressof @str674 : !llvm.ptr
      %7756 = arith.constant 3 : i64
      %7757 = func.call @cc_make_string(%7755, %7756) : (!llvm.ptr, i64) -> i64
      %7758 = func.call @cc_nil_value() : () -> i64
      %7759 = func.call @cc_intern(%7757, %7758) : (i64, i64) -> i64
      %7760 = func.call @cc_nil_value() : () -> i64
      %7761 = func.call @cc_cons(%7759, %7760) : (i64, i64) -> i64
      %7762 = func.call @cc_values_pack(%7761) : (i64) -> i64
      func.call @stack_push_pointer(%7759) : (i64) -> ()
      %7763 = llvm.mlir.addressof @str675 : !llvm.ptr
      %7764 = arith.constant 5 : i64
      %7765 = func.call @cc_make_string(%7763, %7764) : (!llvm.ptr, i64) -> i64
      %7766 = func.call @cc_nil_value() : () -> i64
      %7767 = func.call @cc_intern(%7765, %7766) : (i64, i64) -> i64
      %7768 = func.call @cc_nil_value() : () -> i64
      %7769 = func.call @cc_cons(%7767, %7768) : (i64, i64) -> i64
      %7770 = func.call @cc_values_pack(%7769) : (i64) -> i64
      func.call @stack_push_pointer(%7767) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7771 = llvm.mlir.addressof @str676 : !llvm.ptr
      %7772 = arith.constant 20 : i64
      %7773 = func.call @cc_make_string(%7771, %7772) : (!llvm.ptr, i64) -> i64
      %7774 = llvm.mlir.addressof @str677 : !llvm.ptr
      %7775 = arith.constant 11 : i64
      %7776 = func.call @cc_make_string(%7774, %7775) : (!llvm.ptr, i64) -> i64
      %7777 = func.call @cc_intern(%7773, %7776) : (i64, i64) -> i64
      %7778 = func.call @cc_nil_value() : () -> i64
      %7779 = func.call @cc_cons(%7777, %7778) : (i64, i64) -> i64
      %7780 = func.call @cc_values_pack(%7779) : (i64) -> i64
      func.call @stack_push_pointer(%7777) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7781 = llvm.mlir.addressof @str678 : !llvm.ptr
      %7782 = arith.constant 32 : i64
      %7783 = func.call @cc_make_string(%7781, %7782) : (!llvm.ptr, i64) -> i64
      %7784 = func.call @cc_nil_value() : () -> i64
      %7785 = func.call @cc_intern(%7783, %7784) : (i64, i64) -> i64
      %7786 = func.call @cc_nil_value() : () -> i64
      %7787 = func.call @cc_cons(%7785, %7786) : (i64, i64) -> i64
      %7788 = func.call @cc_values_pack(%7787) : (i64) -> i64
      func.call @stack_push_pointer(%7785) : (i64) -> ()
      %7789 = llvm.mlir.addressof @str679 : !llvm.ptr
      %7790 = arith.constant 6 : i64
      %7791 = func.call @cc_make_string(%7789, %7790) : (!llvm.ptr, i64) -> i64
      %7792 = func.call @cc_nil_value() : () -> i64
      %7793 = func.call @cc_intern(%7791, %7792) : (i64, i64) -> i64
      %7794 = func.call @cc_nil_value() : () -> i64
      %7795 = func.call @cc_cons(%7793, %7794) : (i64, i64) -> i64
      %7796 = func.call @cc_values_pack(%7795) : (i64) -> i64
      func.call @stack_push_pointer(%7793) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7797 = llvm.mlir.addressof @str680 : !llvm.ptr
      %7798 = arith.constant 10 : i64
      %7799 = func.call @cc_make_string(%7797, %7798) : (!llvm.ptr, i64) -> i64
      %7800 = llvm.mlir.addressof @str681 : !llvm.ptr
      %7801 = arith.constant 11 : i64
      %7802 = func.call @cc_make_string(%7800, %7801) : (!llvm.ptr, i64) -> i64
      %7803 = func.call @cc_intern(%7799, %7802) : (i64, i64) -> i64
      %7804 = func.call @cc_nil_value() : () -> i64
      %7805 = func.call @cc_cons(%7803, %7804) : (i64, i64) -> i64
      %7806 = func.call @cc_values_pack(%7805) : (i64) -> i64
      func.call @stack_push_pointer(%7803) : (i64) -> ()
      %7807 = llvm.mlir.addressof @str682 : !llvm.ptr
      %7808 = arith.constant 5 : i64
      %7809 = func.call @cc_make_string(%7807, %7808) : (!llvm.ptr, i64) -> i64
      %7810 = func.call @cc_nil_value() : () -> i64
      %7811 = func.call @cc_intern(%7809, %7810) : (i64, i64) -> i64
      %7812 = func.call @cc_nil_value() : () -> i64
      %7813 = func.call @cc_cons(%7811, %7812) : (i64, i64) -> i64
      %7814 = func.call @cc_values_pack(%7813) : (i64) -> i64
      func.call @stack_push_pointer(%7811) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7815 = func.call @stack_pop_pointer() : () -> i64
      %7816 = func.call @stack_pop_pointer() : () -> i64
      %7817 = func.call @cc_cons(%7816, %7815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7817) : (i64) -> ()
      %7818 = llvm.mlir.addressof @str683 : !llvm.ptr
      %7819 = arith.constant 9 : i64
      %7820 = func.call @cc_make_string(%7818, %7819) : (!llvm.ptr, i64) -> i64
      %7821 = llvm.mlir.addressof @str684 : !llvm.ptr
      %7822 = arith.constant 11 : i64
      %7823 = func.call @cc_make_string(%7821, %7822) : (!llvm.ptr, i64) -> i64
      %7824 = func.call @cc_intern(%7820, %7823) : (i64, i64) -> i64
      %7825 = func.call @cc_nil_value() : () -> i64
      %7826 = func.call @cc_cons(%7824, %7825) : (i64, i64) -> i64
      %7827 = func.call @cc_values_pack(%7826) : (i64) -> i64
      func.call @stack_push_pointer(%7824) : (i64) -> ()
      %7828 = llvm.mlir.addressof @str685 : !llvm.ptr
      %7829 = arith.constant 6 : i64
      %7830 = func.call @cc_make_string(%7828, %7829) : (!llvm.ptr, i64) -> i64
      %7831 = func.call @cc_nil_value() : () -> i64
      %7832 = func.call @cc_intern(%7830, %7831) : (i64, i64) -> i64
      %7833 = func.call @cc_nil_value() : () -> i64
      %7834 = func.call @cc_cons(%7832, %7833) : (i64, i64) -> i64
      %7835 = func.call @cc_values_pack(%7834) : (i64) -> i64
      func.call @stack_push_pointer(%7832) : (i64) -> ()
      %7836 = llvm.mlir.addressof @str686 : !llvm.ptr
      %7837 = arith.constant 5 : i64
      %7838 = func.call @cc_make_string(%7836, %7837) : (!llvm.ptr, i64) -> i64
      %7839 = func.call @cc_nil_value() : () -> i64
      %7840 = func.call @cc_intern(%7838, %7839) : (i64, i64) -> i64
      %7841 = func.call @cc_nil_value() : () -> i64
      %7842 = func.call @cc_cons(%7840, %7841) : (i64, i64) -> i64
      %7843 = func.call @cc_values_pack(%7842) : (i64) -> i64
      func.call @stack_push_pointer(%7840) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7844 = func.call @stack_pop_pointer() : () -> i64
      %7845 = func.call @stack_pop_pointer() : () -> i64
      %7846 = func.call @cc_cons(%7845, %7844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7846) : (i64) -> ()
      %7847 = llvm.mlir.addressof @str687 : !llvm.ptr
      %7848 = arith.constant 2 : i64
      %7849 = func.call @cc_make_string(%7847, %7848) : (!llvm.ptr, i64) -> i64
      %7850 = func.call @cc_nil_value() : () -> i64
      %7851 = func.call @cc_intern(%7849, %7850) : (i64, i64) -> i64
      %7852 = func.call @cc_nil_value() : () -> i64
      %7853 = func.call @cc_cons(%7851, %7852) : (i64, i64) -> i64
      %7854 = func.call @cc_values_pack(%7853) : (i64) -> i64
      func.call @stack_push_pointer(%7851) : (i64) -> ()
      %7855 = llvm.mlir.addressof @str688 : !llvm.ptr
      %7856 = arith.constant 2 : i64
      %7857 = func.call @cc_make_string(%7855, %7856) : (!llvm.ptr, i64) -> i64
      %7858 = llvm.mlir.addressof @str689 : !llvm.ptr
      %7859 = arith.constant 11 : i64
      %7860 = func.call @cc_make_string(%7858, %7859) : (!llvm.ptr, i64) -> i64
      %7861 = func.call @cc_intern(%7857, %7860) : (i64, i64) -> i64
      %7862 = func.call @cc_nil_value() : () -> i64
      %7863 = func.call @cc_cons(%7861, %7862) : (i64, i64) -> i64
      %7864 = func.call @cc_values_pack(%7863) : (i64) -> i64
      func.call @stack_push_pointer(%7861) : (i64) -> ()
      %7865 = llvm.mlir.addressof @str690 : !llvm.ptr
      %7866 = arith.constant 19 : i64
      %7867 = func.call @cc_make_string(%7865, %7866) : (!llvm.ptr, i64) -> i64
      %7868 = llvm.mlir.addressof @str691 : !llvm.ptr
      %7869 = arith.constant 11 : i64
      %7870 = func.call @cc_make_string(%7868, %7869) : (!llvm.ptr, i64) -> i64
      %7871 = func.call @cc_intern(%7867, %7870) : (i64, i64) -> i64
      %7872 = func.call @cc_nil_value() : () -> i64
      %7873 = func.call @cc_cons(%7871, %7872) : (i64, i64) -> i64
      %7874 = func.call @cc_values_pack(%7873) : (i64) -> i64
      func.call @stack_push_pointer(%7871) : (i64) -> ()
      %7875 = llvm.mlir.addressof @str692 : !llvm.ptr
      %7876 = arith.constant 5 : i64
      %7877 = func.call @cc_make_string(%7875, %7876) : (!llvm.ptr, i64) -> i64
      %7878 = func.call @cc_nil_value() : () -> i64
      %7879 = func.call @cc_intern(%7877, %7878) : (i64, i64) -> i64
      %7880 = func.call @cc_nil_value() : () -> i64
      %7881 = func.call @cc_cons(%7879, %7880) : (i64, i64) -> i64
      %7882 = func.call @cc_values_pack(%7881) : (i64) -> i64
      func.call @stack_push_pointer(%7879) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7883 = func.call @stack_pop_pointer() : () -> i64
      %7884 = func.call @stack_pop_pointer() : () -> i64
      %7885 = func.call @cc_cons(%7884, %7883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7885) : (i64) -> ()
      %7886 = func.call @stack_pop_pointer() : () -> i64
      %7887 = func.call @stack_pop_pointer() : () -> i64
      %7888 = func.call @cc_cons(%7887, %7886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7888) : (i64) -> ()
      %7889 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7889) : (i64) -> ()
      %7890 = llvm.mlir.addressof @str693 : !llvm.ptr
      %7891 = arith.constant 32 : i64
      %7892 = func.call @cc_make_string(%7890, %7891) : (!llvm.ptr, i64) -> i64
      %7893 = func.call @cc_nil_value() : () -> i64
      %7894 = func.call @cc_intern(%7892, %7893) : (i64, i64) -> i64
      %7895 = func.call @cc_nil_value() : () -> i64
      %7896 = func.call @cc_cons(%7894, %7895) : (i64, i64) -> i64
      %7897 = func.call @cc_values_pack(%7896) : (i64) -> i64
      func.call @stack_push_pointer(%7894) : (i64) -> ()
      %7898 = func.call @stack_pop_pointer() : () -> i64
      %7899 = func.call @stack_pop_pointer() : () -> i64
      %7900 = func.call @cc_cons(%7898, %7899) : (i64, i64) -> i64
      %7901 = llvm.mlir.addressof @str694 : !llvm.ptr
      %7902 = arith.constant 5 : i64
      %7903 = func.call @cc_make_string(%7901, %7902) : (!llvm.ptr, i64) -> i64
      %7904 = func.call @cc_nil_value() : () -> i64
      %7905 = func.call @cc_intern(%7903, %7904) : (i64, i64) -> i64
      %7906 = func.call @cc_nil_value() : () -> i64
      %7907 = func.call @cc_cons(%7905, %7906) : (i64, i64) -> i64
      %7908 = func.call @cc_values_pack(%7907) : (i64) -> i64
      %7909 = func.call @cc_cons(%7905, %7900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7910 = func.call @stack_pop_pointer() : () -> i64
      %7911 = func.call @stack_pop_pointer() : () -> i64
      %7912 = func.call @cc_cons(%7911, %7910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7912) : (i64) -> ()
      %7913 = func.call @stack_pop_pointer() : () -> i64
      %7914 = func.call @stack_pop_pointer() : () -> i64
      %7915 = func.call @cc_cons(%7914, %7913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7915) : (i64) -> ()
      %7916 = func.call @stack_pop_pointer() : () -> i64
      %7917 = func.call @stack_pop_pointer() : () -> i64
      %7918 = func.call @cc_cons(%7917, %7916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7918) : (i64) -> ()
      %7919 = llvm.mlir.addressof @str695 : !llvm.ptr
      %7920 = arith.constant 5 : i64
      %7921 = func.call @cc_make_string(%7919, %7920) : (!llvm.ptr, i64) -> i64
      %7922 = func.call @cc_nil_value() : () -> i64
      %7923 = func.call @cc_intern(%7921, %7922) : (i64, i64) -> i64
      %7924 = func.call @cc_nil_value() : () -> i64
      %7925 = func.call @cc_cons(%7923, %7924) : (i64, i64) -> i64
      %7926 = func.call @cc_values_pack(%7925) : (i64) -> i64
      func.call @stack_push_pointer(%7923) : (i64) -> ()
      %7927 = llvm.mlir.addressof @str696 : !llvm.ptr
      %7928 = arith.constant 11 : i64
      %7929 = func.call @cc_make_string(%7927, %7928) : (!llvm.ptr, i64) -> i64
      %7930 = func.call @cc_nil_value() : () -> i64
      %7931 = func.call @cc_intern(%7929, %7930) : (i64, i64) -> i64
      %7932 = func.call @cc_nil_value() : () -> i64
      %7933 = func.call @cc_cons(%7931, %7932) : (i64, i64) -> i64
      %7934 = func.call @cc_values_pack(%7933) : (i64) -> i64
      func.call @stack_push_pointer(%7931) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7935 = func.call @stack_pop_pointer() : () -> i64
      %7936 = func.call @stack_pop_pointer() : () -> i64
      %7937 = func.call @cc_cons(%7936, %7935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7937) : (i64) -> ()
      %7938 = func.call @stack_pop_pointer() : () -> i64
      %7939 = func.call @stack_pop_pointer() : () -> i64
      %7940 = func.call @cc_cons(%7939, %7938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7940) : (i64) -> ()
      %7941 = func.call @stack_pop_pointer() : () -> i64
      %7942 = func.call @stack_pop_pointer() : () -> i64
      %7943 = func.call @cc_cons(%7942, %7941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7943) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7944 = func.call @stack_pop_pointer() : () -> i64
      %7945 = func.call @stack_pop_pointer() : () -> i64
      %7946 = func.call @cc_cons(%7945, %7944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7946) : (i64) -> ()
      %7947 = func.call @stack_pop_pointer() : () -> i64
      %7948 = func.call @stack_pop_pointer() : () -> i64
      %7949 = func.call @cc_cons(%7948, %7947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7950 = func.call @stack_pop_pointer() : () -> i64
      %7951 = func.call @stack_pop_pointer() : () -> i64
      %7952 = func.call @cc_cons(%7951, %7950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7952) : (i64) -> ()
      %7953 = func.call @stack_pop_pointer() : () -> i64
      %7954 = func.call @stack_pop_pointer() : () -> i64
      %7955 = func.call @cc_cons(%7954, %7953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7955) : (i64) -> ()
      %7956 = func.call @stack_pop_pointer() : () -> i64
      %7957 = func.call @stack_pop_pointer() : () -> i64
      %7958 = func.call @cc_cons(%7957, %7956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7958) : (i64) -> ()
      %7959 = func.call @stack_pop_pointer() : () -> i64
      %7960 = func.call @stack_pop_pointer() : () -> i64
      %7961 = func.call @cc_cons(%7960, %7959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7962 = func.call @stack_pop_pointer() : () -> i64
      %7963 = func.call @stack_pop_pointer() : () -> i64
      %7964 = func.call @cc_cons(%7963, %7962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7964) : (i64) -> ()
      %7965 = func.call @stack_pop_pointer() : () -> i64
      %7966 = func.call @stack_pop_pointer() : () -> i64
      %7967 = func.call @cc_cons(%7966, %7965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7967) : (i64) -> ()
      %7968 = func.call @stack_pop_pointer() : () -> i64
      %7969 = func.call @stack_pop_pointer() : () -> i64
      %7970 = func.call @cc_cons(%7969, %7968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7970) : (i64) -> ()
      %7971 = llvm.mlir.addressof @str697 : !llvm.ptr
      %7972 = arith.constant 5 : i64
      %7973 = func.call @cc_make_string(%7971, %7972) : (!llvm.ptr, i64) -> i64
      %7974 = func.call @cc_nil_value() : () -> i64
      %7975 = func.call @cc_intern(%7973, %7974) : (i64, i64) -> i64
      %7976 = func.call @cc_nil_value() : () -> i64
      %7977 = func.call @cc_cons(%7975, %7976) : (i64, i64) -> i64
      %7978 = func.call @cc_values_pack(%7977) : (i64) -> i64
      func.call @stack_push_pointer(%7975) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7979 = func.call @stack_pop_pointer() : () -> i64
      %7980 = func.call @stack_pop_pointer() : () -> i64
      %7981 = func.call @cc_cons(%7980, %7979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7981) : (i64) -> ()
      %7982 = func.call @stack_pop_pointer() : () -> i64
      %7983 = func.call @stack_pop_pointer() : () -> i64
      %7984 = func.call @cc_cons(%7983, %7982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7984) : (i64) -> ()
      %7985 = func.call @stack_pop_pointer() : () -> i64
      %7986 = func.call @stack_pop_pointer() : () -> i64
      %7987 = func.call @cc_cons(%7986, %7985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7987) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7988 = func.call @stack_pop_pointer() : () -> i64
      %7989 = func.call @stack_pop_pointer() : () -> i64
      %7990 = func.call @cc_cons(%7989, %7988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7990) : (i64) -> ()
      %7991 = func.call @stack_pop_pointer() : () -> i64
      %7992 = func.call @stack_pop_pointer() : () -> i64
      %7993 = func.call @cc_cons(%7992, %7991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7993) : (i64) -> ()
      %7994 = func.call @stack_pop_pointer() : () -> i64
      %7995 = func.call @stack_pop_pointer() : () -> i64
      %7996 = func.call @cc_cons(%7995, %7994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7996) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7997 = func.call @stack_pop_pointer() : () -> i64
      %7998 = func.call @stack_pop_pointer() : () -> i64
      %7999 = func.call @cc_cons(%7998, %7997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7999) : (i64) -> ()
      %8000 = func.call @stack_pop_pointer() : () -> i64
      %8001 = func.call @stack_pop_pointer() : () -> i64
      %8002 = func.call @cc_cons(%8001, %8000) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8002) : (i64) -> ()
      %8003 = func.call @stack_pop_pointer() : () -> i64
      %8004 = func.call @stack_pop_pointer() : () -> i64
      %8005 = func.call @cc_cons(%8004, %8003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8005) : (i64) -> ()
      %8006 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%8006) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8007 = func.call @stack_pop_pointer() : () -> i64
      %8008 = func.call @stack_pop_pointer() : () -> i64
      %8009 = func.call @cc_cons(%8008, %8007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8009) : (i64) -> ()
      %8010 = func.call @stack_pop_pointer() : () -> i64
      %8011 = func.call @stack_pop_pointer() : () -> i64
      %8012 = func.call @cc_cons(%8011, %8010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8012) : (i64) -> ()
      %8013 = func.call @stack_pop_pointer() : () -> i64
      %8014 = func.call @stack_pop_pointer() : () -> i64
      %8015 = func.call @cc_cons(%8014, %8013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8015) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8016 = func.call @stack_pop_pointer() : () -> i64
      %8017 = func.call @stack_pop_pointer() : () -> i64
      %8018 = func.call @cc_cons(%8017, %8016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8018) : (i64) -> ()
      %8019 = func.call @stack_pop_pointer() : () -> i64
      %8020 = func.call @stack_pop_pointer() : () -> i64
      %8021 = func.call @cc_cons(%8020, %8019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8021) : (i64) -> ()
      %8022 = func.call @stack_pop_pointer() : () -> i64
      %8023 = func.call @stack_pop_pointer() : () -> i64
      %8024 = func.call @cc_cons(%8023, %8022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8024) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8025 = func.call @stack_pop_pointer() : () -> i64
      %8026 = func.call @stack_pop_pointer() : () -> i64
      %8027 = func.call @cc_cons(%8026, %8025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8027) : (i64) -> ()
      %8028 = func.call @stack_pop_pointer() : () -> i64
      %8029 = func.call @stack_pop_pointer() : () -> i64
      %8030 = func.call @cc_cons(%8029, %8028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8030) : (i64) -> ()
      %8031 = func.call @stack_pop_pointer() : () -> i64
      %8032 = func.call @stack_pop_pointer() : () -> i64
      %8033 = func.call @cc_cons(%8032, %8031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8034 = func.call @stack_pop_pointer() : () -> i64
      %8035 = func.call @stack_pop_pointer() : () -> i64
      %8036 = func.call @cc_cons(%8035, %8034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8036) : (i64) -> ()
      %8037 = func.call @stack_pop_pointer() : () -> i64
      %8038 = func.call @stack_pop_pointer() : () -> i64
      %8039 = func.call @cc_cons(%8038, %8037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8039) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8040 = func.call @stack_pop_pointer() : () -> i64
      %8041 = func.call @stack_pop_pointer() : () -> i64
      %8042 = func.call @cc_cons(%8041, %8040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8042) : (i64) -> ()
      %8043 = func.call @stack_pop_pointer() : () -> i64
      %8044 = func.call @stack_pop_pointer() : () -> i64
      %8045 = func.call @cc_cons(%8044, %8043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8045) : (i64) -> ()
      %8046 = func.call @stack_pop_pointer() : () -> i64
      %8268 = llvm.mlir.addressof @str712 : !llvm.ptr
      %8269 = arith.constant 33 : i64
      %8270 = func.call @cc_make_symbol(%8268, %8269) : (!llvm.ptr, i64) -> i64
      %8271 = func.call @cc_persistent_root_value(%8270) : (i64) -> i64
      func.call @stack_push_pointer(%8271) : (i64) -> ()
      %8272 = arith.constant 97047688511554 : i64
      %8273 = arith.constant 1 : i64
      %8274 = func.call @cc_make_closure(%8272, %8273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8274) : (i64) -> ()
      %8275 = func.call @stack_pop_pointer() : () -> i64
      %8276 = llvm.mlir.addressof @str713 : !llvm.ptr
      %8277 = arith.constant 1 : i64
      %8278 = func.call @cc_make_string(%8276, %8277) : (!llvm.ptr, i64) -> i64
      %8279 = func.call @cc_nil_value() : () -> i64
      %8280 = func.call @cc_intern(%8278, %8279) : (i64, i64) -> i64
      %8281 = func.call @cc_nil_value() : () -> i64
      %8282 = func.call @cc_cons(%8280, %8281) : (i64, i64) -> i64
      %8283 = func.call @cc_values_pack(%8282) : (i64) -> i64
      func.call @stack_push_pointer(%8280) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8284 = func.call @stack_pop_pointer() : () -> i64
      %8285 = func.call @stack_pop_pointer() : () -> i64
      %8286 = func.call @cc_cons(%8285, %8284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8286) : (i64) -> ()
      %8287 = func.call @stack_pop_pointer() : () -> i64
      %8288 = llvm.mlir.addressof @str714 : !llvm.ptr
      %8289 = arith.constant 11 : i64
      %8290 = func.call @cc_make_string(%8288, %8289) : (!llvm.ptr, i64) -> i64
      %8291 = llvm.mlir.addressof @str715 : !llvm.ptr
      %8292 = arith.constant 7 : i64
      %8293 = func.call @cc_make_string(%8291, %8292) : (!llvm.ptr, i64) -> i64
      %8294 = func.call @cc_intern(%8290, %8293) : (i64, i64) -> i64
      %8295 = func.call @cc_nil_value() : () -> i64
      %8296 = func.call @cc_cons(%8294, %8295) : (i64, i64) -> i64
      %8297 = func.call @cc_values_pack(%8296) : (i64) -> i64
      func.call @stack_push_pointer(%8294) : (i64) -> ()
      %8298 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8299 = func.call @stack_pop_pointer() : () -> i64
      %8300 = llvm.mlir.addressof @str716 : !llvm.ptr
      %8301 = arith.constant 4 : i64
      %8302 = func.call @cc_make_string(%8300, %8301) : (!llvm.ptr, i64) -> i64
      %8303 = llvm.mlir.addressof @str717 : !llvm.ptr
      %8304 = arith.constant 7 : i64
      %8305 = func.call @cc_make_string(%8303, %8304) : (!llvm.ptr, i64) -> i64
      %8306 = func.call @cc_intern(%8302, %8305) : (i64, i64) -> i64
      %8307 = func.call @cc_nil_value() : () -> i64
      %8308 = func.call @cc_cons(%8306, %8307) : (i64, i64) -> i64
      %8309 = func.call @cc_values_pack(%8308) : (i64) -> i64
      func.call @stack_push_pointer(%8306) : (i64) -> ()
      %8310 = func.call @stack_pop_pointer() : () -> i64
      %8311 = llvm.mlir.addressof @str718 : !llvm.ptr
      %8312 = arith.constant 6 : i64
      %8313 = func.call @cc_make_string(%8311, %8312) : (!llvm.ptr, i64) -> i64
      %8314 = func.call @cc_nil_value() : () -> i64
      %8315 = func.call @cc_intern(%8313, %8314) : (i64, i64) -> i64
      %8316 = func.call @cc_nil_value() : () -> i64
      %8317 = func.call @cc_cons(%8315, %8316) : (i64, i64) -> i64
      %8318 = func.call @cc_values_pack(%8317) : (i64) -> i64
      func.call @stack_push_pointer(%8315) : (i64) -> ()
      %8319 = func.call @stack_pop_pointer() : () -> i64
      %8320 = func.call @cc_nil_value() : () -> i64
      %8321 = func.call @cc_errorp(%7746) : (i64) -> i64
      %8322 = arith.cmpi ne, %8321, %8320 : i64
      %8323 = arith.cmpi eq, %8320, %8320 : i64
      %8324 = arith.andi %8322, %8323 : i1
      %8325 = scf.if %8324 -> (i64) {
        scf.yield %7746 : i64
      } else {
        scf.yield %8320 : i64
      }
      %8326 = func.call @cc_errorp(%8046) : (i64) -> i64
      %8327 = arith.cmpi ne, %8326, %8320 : i64
      %8328 = arith.cmpi eq, %8325, %8320 : i64
      %8329 = arith.andi %8327, %8328 : i1
      %8330 = scf.if %8329 -> (i64) {
        scf.yield %8046 : i64
      } else {
        scf.yield %8325 : i64
      }
      %8331 = func.call @cc_errorp(%8275) : (i64) -> i64
      %8332 = arith.cmpi ne, %8331, %8320 : i64
      %8333 = arith.cmpi eq, %8330, %8320 : i64
      %8334 = arith.andi %8332, %8333 : i1
      %8335 = scf.if %8334 -> (i64) {
        scf.yield %8275 : i64
      } else {
        scf.yield %8330 : i64
      }
      %8336 = func.call @cc_errorp(%8287) : (i64) -> i64
      %8337 = arith.cmpi ne, %8336, %8320 : i64
      %8338 = arith.cmpi eq, %8335, %8320 : i64
      %8339 = arith.andi %8337, %8338 : i1
      %8340 = scf.if %8339 -> (i64) {
        scf.yield %8287 : i64
      } else {
        scf.yield %8335 : i64
      }
      %8341 = func.call @cc_errorp(%8298) : (i64) -> i64
      %8342 = arith.cmpi ne, %8341, %8320 : i64
      %8343 = arith.cmpi eq, %8340, %8320 : i64
      %8344 = arith.andi %8342, %8343 : i1
      %8345 = scf.if %8344 -> (i64) {
        scf.yield %8298 : i64
      } else {
        scf.yield %8340 : i64
      }
      %8346 = func.call @cc_errorp(%8299) : (i64) -> i64
      %8347 = arith.cmpi ne, %8346, %8320 : i64
      %8348 = arith.cmpi eq, %8345, %8320 : i64
      %8349 = arith.andi %8347, %8348 : i1
      %8350 = scf.if %8349 -> (i64) {
        scf.yield %8299 : i64
      } else {
        scf.yield %8345 : i64
      }
      %8351 = func.call @cc_errorp(%8310) : (i64) -> i64
      %8352 = arith.cmpi ne, %8351, %8320 : i64
      %8353 = arith.cmpi eq, %8350, %8320 : i64
      %8354 = arith.andi %8352, %8353 : i1
      %8355 = scf.if %8354 -> (i64) {
        scf.yield %8310 : i64
      } else {
        scf.yield %8350 : i64
      }
      %8356 = func.call @cc_errorp(%8319) : (i64) -> i64
      %8357 = arith.cmpi ne, %8356, %8320 : i64
      %8358 = arith.cmpi eq, %8355, %8320 : i64
      %8359 = arith.andi %8357, %8358 : i1
      %8360 = scf.if %8359 -> (i64) {
        scf.yield %8319 : i64
      } else {
        scf.yield %8355 : i64
      }
      %8361 = arith.cmpi ne, %8360, %8320 : i64
      scf.if %8361 {
        func.call @stack_push_pointer(%8360) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7746) : (i64) -> ()
        func.call @stack_push_pointer(%8046) : (i64) -> ()
        func.call @stack_push_pointer(%8275) : (i64) -> ()
        func.call @stack_push_pointer(%8287) : (i64) -> ()
        func.call @stack_push_pointer(%8298) : (i64) -> ()
        func.call @stack_push_pointer(%8299) : (i64) -> ()
        func.call @stack_push_pointer(%8310) : (i64) -> ()
        func.call @stack_push_pointer(%8319) : (i64) -> ()
        %8362 = llvm.mlir.addressof @str719 : !llvm.ptr
        %8363 = func.call @cc_make_function_ref_const(%8362) : (!llvm.ptr) -> i64
        %8364 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8363, %8364) : (i64, i64) -> ()
      }
      %8365 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8365 : i64
    }
    %8366 = func.call @cc_nil_value() : () -> i64
    %8367 = func.call @cc_errorp(%7737) : (i64) -> i64
    %8368 = arith.cmpi ne, %8367, %8366 : i64
    %8369 = scf.if %8368 -> (i64) {
      scf.yield %7737 : i64
    } else {
      %8370 = llvm.mlir.addressof @str720 : !llvm.ptr
      %8371 = arith.constant 9 : i64
      %8372 = func.call @cc_make_string(%8370, %8371) : (!llvm.ptr, i64) -> i64
      %8373 = func.call @cc_nil_value() : () -> i64
      %8374 = func.call @cc_intern(%8372, %8373) : (i64, i64) -> i64
      %8375 = func.call @cc_nil_value() : () -> i64
      %8376 = func.call @cc_cons(%8374, %8375) : (i64, i64) -> i64
      %8377 = func.call @cc_values_pack(%8376) : (i64) -> i64
      func.call @stack_push_pointer(%8374) : (i64) -> ()
      %8378 = func.call @stack_pop_pointer() : () -> i64
      %8379 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8380 = arith.constant 3 : i64
      %8381 = func.call @cc_make_string(%8379, %8380) : (!llvm.ptr, i64) -> i64
      %8382 = func.call @cc_nil_value() : () -> i64
      %8383 = func.call @cc_intern(%8381, %8382) : (i64, i64) -> i64
      %8384 = func.call @cc_nil_value() : () -> i64
      %8385 = func.call @cc_cons(%8383, %8384) : (i64, i64) -> i64
      %8386 = func.call @cc_values_pack(%8385) : (i64) -> i64
      func.call @stack_push_pointer(%8383) : (i64) -> ()
      %8387 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8388 = arith.constant 3 : i64
      %8389 = func.call @cc_make_string(%8387, %8388) : (!llvm.ptr, i64) -> i64
      %8390 = func.call @cc_nil_value() : () -> i64
      %8391 = func.call @cc_intern(%8389, %8390) : (i64, i64) -> i64
      %8392 = func.call @cc_nil_value() : () -> i64
      %8393 = func.call @cc_cons(%8391, %8392) : (i64, i64) -> i64
      %8394 = func.call @cc_values_pack(%8393) : (i64) -> i64
      func.call @stack_push_pointer(%8391) : (i64) -> ()
      %8395 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8396 = arith.constant 5 : i64
      %8397 = func.call @cc_make_string(%8395, %8396) : (!llvm.ptr, i64) -> i64
      %8398 = func.call @cc_nil_value() : () -> i64
      %8399 = func.call @cc_intern(%8397, %8398) : (i64, i64) -> i64
      %8400 = func.call @cc_nil_value() : () -> i64
      %8401 = func.call @cc_cons(%8399, %8400) : (i64, i64) -> i64
      %8402 = func.call @cc_values_pack(%8401) : (i64) -> i64
      func.call @stack_push_pointer(%8399) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8403 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8404 = arith.constant 32 : i64
      %8405 = func.call @cc_make_string(%8403, %8404) : (!llvm.ptr, i64) -> i64
      %8406 = func.call @cc_nil_value() : () -> i64
      %8407 = func.call @cc_intern(%8405, %8406) : (i64, i64) -> i64
      %8408 = func.call @cc_nil_value() : () -> i64
      %8409 = func.call @cc_cons(%8407, %8408) : (i64, i64) -> i64
      %8410 = func.call @cc_values_pack(%8409) : (i64) -> i64
      func.call @stack_push_pointer(%8407) : (i64) -> ()
      %8411 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8412 = arith.constant 6 : i64
      %8413 = func.call @cc_make_string(%8411, %8412) : (!llvm.ptr, i64) -> i64
      %8414 = func.call @cc_nil_value() : () -> i64
      %8415 = func.call @cc_intern(%8413, %8414) : (i64, i64) -> i64
      %8416 = func.call @cc_nil_value() : () -> i64
      %8417 = func.call @cc_cons(%8415, %8416) : (i64, i64) -> i64
      %8418 = func.call @cc_values_pack(%8417) : (i64) -> i64
      func.call @stack_push_pointer(%8415) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8419 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8420 = arith.constant 17 : i64
      %8421 = func.call @cc_make_string(%8419, %8420) : (!llvm.ptr, i64) -> i64
      %8422 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8423 = arith.constant 11 : i64
      %8424 = func.call @cc_make_string(%8422, %8423) : (!llvm.ptr, i64) -> i64
      %8425 = func.call @cc_intern(%8421, %8424) : (i64, i64) -> i64
      %8426 = func.call @cc_nil_value() : () -> i64
      %8427 = func.call @cc_cons(%8425, %8426) : (i64, i64) -> i64
      %8428 = func.call @cc_values_pack(%8427) : (i64) -> i64
      func.call @stack_push_pointer(%8425) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8429 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8430 = arith.constant 10 : i64
      %8431 = func.call @cc_make_string(%8429, %8430) : (!llvm.ptr, i64) -> i64
      %8432 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8433 = arith.constant 11 : i64
      %8434 = func.call @cc_make_string(%8432, %8433) : (!llvm.ptr, i64) -> i64
      %8435 = func.call @cc_intern(%8431, %8434) : (i64, i64) -> i64
      %8436 = func.call @cc_nil_value() : () -> i64
      %8437 = func.call @cc_cons(%8435, %8436) : (i64, i64) -> i64
      %8438 = func.call @cc_values_pack(%8437) : (i64) -> i64
      func.call @stack_push_pointer(%8435) : (i64) -> ()
      %8439 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8440 = arith.constant 5 : i64
      %8441 = func.call @cc_make_string(%8439, %8440) : (!llvm.ptr, i64) -> i64
      %8442 = func.call @cc_nil_value() : () -> i64
      %8443 = func.call @cc_intern(%8441, %8442) : (i64, i64) -> i64
      %8444 = func.call @cc_nil_value() : () -> i64
      %8445 = func.call @cc_cons(%8443, %8444) : (i64, i64) -> i64
      %8446 = func.call @cc_values_pack(%8445) : (i64) -> i64
      func.call @stack_push_pointer(%8443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8447 = func.call @stack_pop_pointer() : () -> i64
      %8448 = func.call @stack_pop_pointer() : () -> i64
      %8449 = func.call @cc_cons(%8448, %8447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8449) : (i64) -> ()
      %8450 = llvm.mlir.addressof @str731 : !llvm.ptr
      %8451 = arith.constant 9 : i64
      %8452 = func.call @cc_make_string(%8450, %8451) : (!llvm.ptr, i64) -> i64
      %8453 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8454 = arith.constant 11 : i64
      %8455 = func.call @cc_make_string(%8453, %8454) : (!llvm.ptr, i64) -> i64
      %8456 = func.call @cc_intern(%8452, %8455) : (i64, i64) -> i64
      %8457 = func.call @cc_nil_value() : () -> i64
      %8458 = func.call @cc_cons(%8456, %8457) : (i64, i64) -> i64
      %8459 = func.call @cc_values_pack(%8458) : (i64) -> i64
      func.call @stack_push_pointer(%8456) : (i64) -> ()
      %8460 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8461 = arith.constant 6 : i64
      %8462 = func.call @cc_make_string(%8460, %8461) : (!llvm.ptr, i64) -> i64
      %8463 = func.call @cc_nil_value() : () -> i64
      %8464 = func.call @cc_intern(%8462, %8463) : (i64, i64) -> i64
      %8465 = func.call @cc_nil_value() : () -> i64
      %8466 = func.call @cc_cons(%8464, %8465) : (i64, i64) -> i64
      %8467 = func.call @cc_values_pack(%8466) : (i64) -> i64
      func.call @stack_push_pointer(%8464) : (i64) -> ()
      %8468 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8469 = arith.constant 5 : i64
      %8470 = func.call @cc_make_string(%8468, %8469) : (!llvm.ptr, i64) -> i64
      %8471 = func.call @cc_nil_value() : () -> i64
      %8472 = func.call @cc_intern(%8470, %8471) : (i64, i64) -> i64
      %8473 = func.call @cc_nil_value() : () -> i64
      %8474 = func.call @cc_cons(%8472, %8473) : (i64, i64) -> i64
      %8475 = func.call @cc_values_pack(%8474) : (i64) -> i64
      func.call @stack_push_pointer(%8472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8476 = func.call @stack_pop_pointer() : () -> i64
      %8477 = func.call @stack_pop_pointer() : () -> i64
      %8478 = func.call @cc_cons(%8477, %8476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8478) : (i64) -> ()
      %8479 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8480 = arith.constant 2 : i64
      %8481 = func.call @cc_make_string(%8479, %8480) : (!llvm.ptr, i64) -> i64
      %8482 = func.call @cc_nil_value() : () -> i64
      %8483 = func.call @cc_intern(%8481, %8482) : (i64, i64) -> i64
      %8484 = func.call @cc_nil_value() : () -> i64
      %8485 = func.call @cc_cons(%8483, %8484) : (i64, i64) -> i64
      %8486 = func.call @cc_values_pack(%8485) : (i64) -> i64
      func.call @stack_push_pointer(%8483) : (i64) -> ()
      %8487 = llvm.mlir.addressof @str736 : !llvm.ptr
      %8488 = arith.constant 2 : i64
      %8489 = func.call @cc_make_string(%8487, %8488) : (!llvm.ptr, i64) -> i64
      %8490 = llvm.mlir.addressof @str737 : !llvm.ptr
      %8491 = arith.constant 11 : i64
      %8492 = func.call @cc_make_string(%8490, %8491) : (!llvm.ptr, i64) -> i64
      %8493 = func.call @cc_intern(%8489, %8492) : (i64, i64) -> i64
      %8494 = func.call @cc_nil_value() : () -> i64
      %8495 = func.call @cc_cons(%8493, %8494) : (i64, i64) -> i64
      %8496 = func.call @cc_values_pack(%8495) : (i64) -> i64
      func.call @stack_push_pointer(%8493) : (i64) -> ()
      %8497 = llvm.mlir.addressof @str738 : !llvm.ptr
      %8498 = arith.constant 19 : i64
      %8499 = func.call @cc_make_string(%8497, %8498) : (!llvm.ptr, i64) -> i64
      %8500 = llvm.mlir.addressof @str739 : !llvm.ptr
      %8501 = arith.constant 11 : i64
      %8502 = func.call @cc_make_string(%8500, %8501) : (!llvm.ptr, i64) -> i64
      %8503 = func.call @cc_intern(%8499, %8502) : (i64, i64) -> i64
      %8504 = func.call @cc_nil_value() : () -> i64
      %8505 = func.call @cc_cons(%8503, %8504) : (i64, i64) -> i64
      %8506 = func.call @cc_values_pack(%8505) : (i64) -> i64
      func.call @stack_push_pointer(%8503) : (i64) -> ()
      %8507 = llvm.mlir.addressof @str740 : !llvm.ptr
      %8508 = arith.constant 5 : i64
      %8509 = func.call @cc_make_string(%8507, %8508) : (!llvm.ptr, i64) -> i64
      %8510 = func.call @cc_nil_value() : () -> i64
      %8511 = func.call @cc_intern(%8509, %8510) : (i64, i64) -> i64
      %8512 = func.call @cc_nil_value() : () -> i64
      %8513 = func.call @cc_cons(%8511, %8512) : (i64, i64) -> i64
      %8514 = func.call @cc_values_pack(%8513) : (i64) -> i64
      func.call @stack_push_pointer(%8511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8515 = func.call @stack_pop_pointer() : () -> i64
      %8516 = func.call @stack_pop_pointer() : () -> i64
      %8517 = func.call @cc_cons(%8516, %8515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8517) : (i64) -> ()
      %8518 = func.call @stack_pop_pointer() : () -> i64
      %8519 = func.call @stack_pop_pointer() : () -> i64
      %8520 = func.call @cc_cons(%8519, %8518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8520) : (i64) -> ()
      %8521 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8521) : (i64) -> ()
      %8522 = llvm.mlir.addressof @str741 : !llvm.ptr
      %8523 = arith.constant 32 : i64
      %8524 = func.call @cc_make_string(%8522, %8523) : (!llvm.ptr, i64) -> i64
      %8525 = func.call @cc_nil_value() : () -> i64
      %8526 = func.call @cc_intern(%8524, %8525) : (i64, i64) -> i64
      %8527 = func.call @cc_nil_value() : () -> i64
      %8528 = func.call @cc_cons(%8526, %8527) : (i64, i64) -> i64
      %8529 = func.call @cc_values_pack(%8528) : (i64) -> i64
      func.call @stack_push_pointer(%8526) : (i64) -> ()
      %8530 = func.call @stack_pop_pointer() : () -> i64
      %8531 = func.call @stack_pop_pointer() : () -> i64
      %8532 = func.call @cc_cons(%8530, %8531) : (i64, i64) -> i64
      %8533 = llvm.mlir.addressof @str742 : !llvm.ptr
      %8534 = arith.constant 5 : i64
      %8535 = func.call @cc_make_string(%8533, %8534) : (!llvm.ptr, i64) -> i64
      %8536 = func.call @cc_nil_value() : () -> i64
      %8537 = func.call @cc_intern(%8535, %8536) : (i64, i64) -> i64
      %8538 = func.call @cc_nil_value() : () -> i64
      %8539 = func.call @cc_cons(%8537, %8538) : (i64, i64) -> i64
      %8540 = func.call @cc_values_pack(%8539) : (i64) -> i64
      %8541 = func.call @cc_cons(%8537, %8532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8541) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8542 = func.call @stack_pop_pointer() : () -> i64
      %8543 = func.call @stack_pop_pointer() : () -> i64
      %8544 = func.call @cc_cons(%8543, %8542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8544) : (i64) -> ()
      %8545 = func.call @stack_pop_pointer() : () -> i64
      %8546 = func.call @stack_pop_pointer() : () -> i64
      %8547 = func.call @cc_cons(%8546, %8545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8547) : (i64) -> ()
      %8548 = func.call @stack_pop_pointer() : () -> i64
      %8549 = func.call @stack_pop_pointer() : () -> i64
      %8550 = func.call @cc_cons(%8549, %8548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8550) : (i64) -> ()
      %8551 = llvm.mlir.addressof @str743 : !llvm.ptr
      %8552 = arith.constant 5 : i64
      %8553 = func.call @cc_make_string(%8551, %8552) : (!llvm.ptr, i64) -> i64
      %8554 = func.call @cc_nil_value() : () -> i64
      %8555 = func.call @cc_intern(%8553, %8554) : (i64, i64) -> i64
      %8556 = func.call @cc_nil_value() : () -> i64
      %8557 = func.call @cc_cons(%8555, %8556) : (i64, i64) -> i64
      %8558 = func.call @cc_values_pack(%8557) : (i64) -> i64
      func.call @stack_push_pointer(%8555) : (i64) -> ()
      %8559 = llvm.mlir.addressof @str744 : !llvm.ptr
      %8560 = arith.constant 11 : i64
      %8561 = func.call @cc_make_string(%8559, %8560) : (!llvm.ptr, i64) -> i64
      %8562 = func.call @cc_nil_value() : () -> i64
      %8563 = func.call @cc_intern(%8561, %8562) : (i64, i64) -> i64
      %8564 = func.call @cc_nil_value() : () -> i64
      %8565 = func.call @cc_cons(%8563, %8564) : (i64, i64) -> i64
      %8566 = func.call @cc_values_pack(%8565) : (i64) -> i64
      func.call @stack_push_pointer(%8563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8567 = func.call @stack_pop_pointer() : () -> i64
      %8568 = func.call @stack_pop_pointer() : () -> i64
      %8569 = func.call @cc_cons(%8568, %8567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8569) : (i64) -> ()
      %8570 = func.call @stack_pop_pointer() : () -> i64
      %8571 = func.call @stack_pop_pointer() : () -> i64
      %8572 = func.call @cc_cons(%8571, %8570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8572) : (i64) -> ()
      %8573 = func.call @stack_pop_pointer() : () -> i64
      %8574 = func.call @stack_pop_pointer() : () -> i64
      %8575 = func.call @cc_cons(%8574, %8573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8575) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8576 = func.call @stack_pop_pointer() : () -> i64
      %8577 = func.call @stack_pop_pointer() : () -> i64
      %8578 = func.call @cc_cons(%8577, %8576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8578) : (i64) -> ()
      %8579 = func.call @stack_pop_pointer() : () -> i64
      %8580 = func.call @stack_pop_pointer() : () -> i64
      %8581 = func.call @cc_cons(%8580, %8579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8582 = func.call @stack_pop_pointer() : () -> i64
      %8583 = func.call @stack_pop_pointer() : () -> i64
      %8584 = func.call @cc_cons(%8583, %8582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8584) : (i64) -> ()
      %8585 = func.call @stack_pop_pointer() : () -> i64
      %8586 = func.call @stack_pop_pointer() : () -> i64
      %8587 = func.call @cc_cons(%8586, %8585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8587) : (i64) -> ()
      %8588 = func.call @stack_pop_pointer() : () -> i64
      %8589 = func.call @stack_pop_pointer() : () -> i64
      %8590 = func.call @cc_cons(%8589, %8588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8590) : (i64) -> ()
      %8591 = func.call @stack_pop_pointer() : () -> i64
      %8592 = func.call @stack_pop_pointer() : () -> i64
      %8593 = func.call @cc_cons(%8592, %8591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8593) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8594 = func.call @stack_pop_pointer() : () -> i64
      %8595 = func.call @stack_pop_pointer() : () -> i64
      %8596 = func.call @cc_cons(%8595, %8594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8596) : (i64) -> ()
      %8597 = func.call @stack_pop_pointer() : () -> i64
      %8598 = func.call @stack_pop_pointer() : () -> i64
      %8599 = func.call @cc_cons(%8598, %8597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8599) : (i64) -> ()
      %8600 = func.call @stack_pop_pointer() : () -> i64
      %8601 = func.call @stack_pop_pointer() : () -> i64
      %8602 = func.call @cc_cons(%8601, %8600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8602) : (i64) -> ()
      %8603 = llvm.mlir.addressof @str745 : !llvm.ptr
      %8604 = arith.constant 5 : i64
      %8605 = func.call @cc_make_string(%8603, %8604) : (!llvm.ptr, i64) -> i64
      %8606 = func.call @cc_nil_value() : () -> i64
      %8607 = func.call @cc_intern(%8605, %8606) : (i64, i64) -> i64
      %8608 = func.call @cc_nil_value() : () -> i64
      %8609 = func.call @cc_cons(%8607, %8608) : (i64, i64) -> i64
      %8610 = func.call @cc_values_pack(%8609) : (i64) -> i64
      func.call @stack_push_pointer(%8607) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8611 = func.call @stack_pop_pointer() : () -> i64
      %8612 = func.call @stack_pop_pointer() : () -> i64
      %8613 = func.call @cc_cons(%8612, %8611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8613) : (i64) -> ()
      %8614 = func.call @stack_pop_pointer() : () -> i64
      %8615 = func.call @stack_pop_pointer() : () -> i64
      %8616 = func.call @cc_cons(%8615, %8614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8616) : (i64) -> ()
      %8617 = func.call @stack_pop_pointer() : () -> i64
      %8618 = func.call @stack_pop_pointer() : () -> i64
      %8619 = func.call @cc_cons(%8618, %8617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8619) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8620 = func.call @stack_pop_pointer() : () -> i64
      %8621 = func.call @stack_pop_pointer() : () -> i64
      %8622 = func.call @cc_cons(%8621, %8620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8622) : (i64) -> ()
      %8623 = func.call @stack_pop_pointer() : () -> i64
      %8624 = func.call @stack_pop_pointer() : () -> i64
      %8625 = func.call @cc_cons(%8624, %8623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8625) : (i64) -> ()
      %8626 = func.call @stack_pop_pointer() : () -> i64
      %8627 = func.call @stack_pop_pointer() : () -> i64
      %8628 = func.call @cc_cons(%8627, %8626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8628) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8629 = func.call @stack_pop_pointer() : () -> i64
      %8630 = func.call @stack_pop_pointer() : () -> i64
      %8631 = func.call @cc_cons(%8630, %8629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8631) : (i64) -> ()
      %8632 = func.call @stack_pop_pointer() : () -> i64
      %8633 = func.call @stack_pop_pointer() : () -> i64
      %8634 = func.call @cc_cons(%8633, %8632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8634) : (i64) -> ()
      %8635 = func.call @stack_pop_pointer() : () -> i64
      %8636 = func.call @stack_pop_pointer() : () -> i64
      %8637 = func.call @cc_cons(%8636, %8635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8637) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8638 = func.call @stack_pop_pointer() : () -> i64
      %8639 = func.call @stack_pop_pointer() : () -> i64
      %8640 = func.call @cc_cons(%8639, %8638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8640) : (i64) -> ()
      %8641 = func.call @stack_pop_pointer() : () -> i64
      %8642 = func.call @stack_pop_pointer() : () -> i64
      %8643 = func.call @cc_cons(%8642, %8641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8643) : (i64) -> ()
      %8644 = func.call @stack_pop_pointer() : () -> i64
      %8645 = func.call @stack_pop_pointer() : () -> i64
      %8646 = func.call @cc_cons(%8645, %8644) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8646) : (i64) -> ()
      %8647 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%8647) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8648 = func.call @stack_pop_pointer() : () -> i64
      %8649 = func.call @stack_pop_pointer() : () -> i64
      %8650 = func.call @cc_cons(%8649, %8648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8650) : (i64) -> ()
      %8651 = func.call @stack_pop_pointer() : () -> i64
      %8652 = func.call @stack_pop_pointer() : () -> i64
      %8653 = func.call @cc_cons(%8652, %8651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8653) : (i64) -> ()
      %8654 = func.call @stack_pop_pointer() : () -> i64
      %8655 = func.call @stack_pop_pointer() : () -> i64
      %8656 = func.call @cc_cons(%8655, %8654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8657 = func.call @stack_pop_pointer() : () -> i64
      %8658 = func.call @stack_pop_pointer() : () -> i64
      %8659 = func.call @cc_cons(%8658, %8657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8659) : (i64) -> ()
      %8660 = func.call @stack_pop_pointer() : () -> i64
      %8661 = func.call @stack_pop_pointer() : () -> i64
      %8662 = func.call @cc_cons(%8661, %8660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8662) : (i64) -> ()
      %8663 = func.call @stack_pop_pointer() : () -> i64
      %8664 = func.call @stack_pop_pointer() : () -> i64
      %8665 = func.call @cc_cons(%8664, %8663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8665) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8666 = func.call @stack_pop_pointer() : () -> i64
      %8667 = func.call @stack_pop_pointer() : () -> i64
      %8668 = func.call @cc_cons(%8667, %8666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8668) : (i64) -> ()
      %8669 = func.call @stack_pop_pointer() : () -> i64
      %8670 = func.call @stack_pop_pointer() : () -> i64
      %8671 = func.call @cc_cons(%8670, %8669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8671) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8672 = func.call @stack_pop_pointer() : () -> i64
      %8673 = func.call @stack_pop_pointer() : () -> i64
      %8674 = func.call @cc_cons(%8673, %8672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8674) : (i64) -> ()
      %8675 = func.call @stack_pop_pointer() : () -> i64
      %8676 = func.call @stack_pop_pointer() : () -> i64
      %8677 = func.call @cc_cons(%8676, %8675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8677) : (i64) -> ()
      %8678 = func.call @stack_pop_pointer() : () -> i64
      %8900 = llvm.mlir.addressof @str760 : !llvm.ptr
      %8901 = arith.constant 33 : i64
      %8902 = func.call @cc_make_symbol(%8900, %8901) : (!llvm.ptr, i64) -> i64
      %8903 = func.call @cc_persistent_root_value(%8902) : (i64) -> i64
      func.call @stack_push_pointer(%8903) : (i64) -> ()
      %8904 = arith.constant 97047688511560 : i64
      %8905 = arith.constant 1 : i64
      %8906 = func.call @cc_make_closure(%8904, %8905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8906) : (i64) -> ()
      %8907 = func.call @stack_pop_pointer() : () -> i64
      %8908 = llvm.mlir.addressof @str761 : !llvm.ptr
      %8909 = arith.constant 1 : i64
      %8910 = func.call @cc_make_string(%8908, %8909) : (!llvm.ptr, i64) -> i64
      %8911 = func.call @cc_nil_value() : () -> i64
      %8912 = func.call @cc_intern(%8910, %8911) : (i64, i64) -> i64
      %8913 = func.call @cc_nil_value() : () -> i64
      %8914 = func.call @cc_cons(%8912, %8913) : (i64, i64) -> i64
      %8915 = func.call @cc_values_pack(%8914) : (i64) -> i64
      func.call @stack_push_pointer(%8912) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8916 = func.call @stack_pop_pointer() : () -> i64
      %8917 = func.call @stack_pop_pointer() : () -> i64
      %8918 = func.call @cc_cons(%8917, %8916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8918) : (i64) -> ()
      %8919 = func.call @stack_pop_pointer() : () -> i64
      %8920 = llvm.mlir.addressof @str762 : !llvm.ptr
      %8921 = arith.constant 11 : i64
      %8922 = func.call @cc_make_string(%8920, %8921) : (!llvm.ptr, i64) -> i64
      %8923 = llvm.mlir.addressof @str763 : !llvm.ptr
      %8924 = arith.constant 7 : i64
      %8925 = func.call @cc_make_string(%8923, %8924) : (!llvm.ptr, i64) -> i64
      %8926 = func.call @cc_intern(%8922, %8925) : (i64, i64) -> i64
      %8927 = func.call @cc_nil_value() : () -> i64
      %8928 = func.call @cc_cons(%8926, %8927) : (i64, i64) -> i64
      %8929 = func.call @cc_values_pack(%8928) : (i64) -> i64
      func.call @stack_push_pointer(%8926) : (i64) -> ()
      %8930 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8931 = func.call @stack_pop_pointer() : () -> i64
      %8932 = llvm.mlir.addressof @str764 : !llvm.ptr
      %8933 = arith.constant 4 : i64
      %8934 = func.call @cc_make_string(%8932, %8933) : (!llvm.ptr, i64) -> i64
      %8935 = llvm.mlir.addressof @str765 : !llvm.ptr
      %8936 = arith.constant 7 : i64
      %8937 = func.call @cc_make_string(%8935, %8936) : (!llvm.ptr, i64) -> i64
      %8938 = func.call @cc_intern(%8934, %8937) : (i64, i64) -> i64
      %8939 = func.call @cc_nil_value() : () -> i64
      %8940 = func.call @cc_cons(%8938, %8939) : (i64, i64) -> i64
      %8941 = func.call @cc_values_pack(%8940) : (i64) -> i64
      func.call @stack_push_pointer(%8938) : (i64) -> ()
      %8942 = func.call @stack_pop_pointer() : () -> i64
      %8943 = llvm.mlir.addressof @str766 : !llvm.ptr
      %8944 = arith.constant 6 : i64
      %8945 = func.call @cc_make_string(%8943, %8944) : (!llvm.ptr, i64) -> i64
      %8946 = func.call @cc_nil_value() : () -> i64
      %8947 = func.call @cc_intern(%8945, %8946) : (i64, i64) -> i64
      %8948 = func.call @cc_nil_value() : () -> i64
      %8949 = func.call @cc_cons(%8947, %8948) : (i64, i64) -> i64
      %8950 = func.call @cc_values_pack(%8949) : (i64) -> i64
      func.call @stack_push_pointer(%8947) : (i64) -> ()
      %8951 = func.call @stack_pop_pointer() : () -> i64
      %8952 = func.call @cc_nil_value() : () -> i64
      %8953 = func.call @cc_errorp(%8378) : (i64) -> i64
      %8954 = arith.cmpi ne, %8953, %8952 : i64
      %8955 = arith.cmpi eq, %8952, %8952 : i64
      %8956 = arith.andi %8954, %8955 : i1
      %8957 = scf.if %8956 -> (i64) {
        scf.yield %8378 : i64
      } else {
        scf.yield %8952 : i64
      }
      %8958 = func.call @cc_errorp(%8678) : (i64) -> i64
      %8959 = arith.cmpi ne, %8958, %8952 : i64
      %8960 = arith.cmpi eq, %8957, %8952 : i64
      %8961 = arith.andi %8959, %8960 : i1
      %8962 = scf.if %8961 -> (i64) {
        scf.yield %8678 : i64
      } else {
        scf.yield %8957 : i64
      }
      %8963 = func.call @cc_errorp(%8907) : (i64) -> i64
      %8964 = arith.cmpi ne, %8963, %8952 : i64
      %8965 = arith.cmpi eq, %8962, %8952 : i64
      %8966 = arith.andi %8964, %8965 : i1
      %8967 = scf.if %8966 -> (i64) {
        scf.yield %8907 : i64
      } else {
        scf.yield %8962 : i64
      }
      %8968 = func.call @cc_errorp(%8919) : (i64) -> i64
      %8969 = arith.cmpi ne, %8968, %8952 : i64
      %8970 = arith.cmpi eq, %8967, %8952 : i64
      %8971 = arith.andi %8969, %8970 : i1
      %8972 = scf.if %8971 -> (i64) {
        scf.yield %8919 : i64
      } else {
        scf.yield %8967 : i64
      }
      %8973 = func.call @cc_errorp(%8930) : (i64) -> i64
      %8974 = arith.cmpi ne, %8973, %8952 : i64
      %8975 = arith.cmpi eq, %8972, %8952 : i64
      %8976 = arith.andi %8974, %8975 : i1
      %8977 = scf.if %8976 -> (i64) {
        scf.yield %8930 : i64
      } else {
        scf.yield %8972 : i64
      }
      %8978 = func.call @cc_errorp(%8931) : (i64) -> i64
      %8979 = arith.cmpi ne, %8978, %8952 : i64
      %8980 = arith.cmpi eq, %8977, %8952 : i64
      %8981 = arith.andi %8979, %8980 : i1
      %8982 = scf.if %8981 -> (i64) {
        scf.yield %8931 : i64
      } else {
        scf.yield %8977 : i64
      }
      %8983 = func.call @cc_errorp(%8942) : (i64) -> i64
      %8984 = arith.cmpi ne, %8983, %8952 : i64
      %8985 = arith.cmpi eq, %8982, %8952 : i64
      %8986 = arith.andi %8984, %8985 : i1
      %8987 = scf.if %8986 -> (i64) {
        scf.yield %8942 : i64
      } else {
        scf.yield %8982 : i64
      }
      %8988 = func.call @cc_errorp(%8951) : (i64) -> i64
      %8989 = arith.cmpi ne, %8988, %8952 : i64
      %8990 = arith.cmpi eq, %8987, %8952 : i64
      %8991 = arith.andi %8989, %8990 : i1
      %8992 = scf.if %8991 -> (i64) {
        scf.yield %8951 : i64
      } else {
        scf.yield %8987 : i64
      }
      %8993 = arith.cmpi ne, %8992, %8952 : i64
      scf.if %8993 {
        func.call @stack_push_pointer(%8992) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8378) : (i64) -> ()
        func.call @stack_push_pointer(%8678) : (i64) -> ()
        func.call @stack_push_pointer(%8907) : (i64) -> ()
        func.call @stack_push_pointer(%8919) : (i64) -> ()
        func.call @stack_push_pointer(%8930) : (i64) -> ()
        func.call @stack_push_pointer(%8931) : (i64) -> ()
        func.call @stack_push_pointer(%8942) : (i64) -> ()
        func.call @stack_push_pointer(%8951) : (i64) -> ()
        %8994 = llvm.mlir.addressof @str767 : !llvm.ptr
        %8995 = func.call @cc_make_function_ref_const(%8994) : (!llvm.ptr) -> i64
        %8996 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8995, %8996) : (i64, i64) -> ()
      }
      %8997 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8997 : i64
    }
    %8998 = func.call @cc_nil_value() : () -> i64
    %8999 = func.call @cc_errorp(%8369) : (i64) -> i64
    %9000 = arith.cmpi ne, %8999, %8998 : i64
    %9001 = scf.if %9000 -> (i64) {
      scf.yield %8369 : i64
    } else {
      %9002 = llvm.mlir.addressof @str768 : !llvm.ptr
      %9003 = arith.constant 19 : i64
      %9004 = func.call @cc_make_string(%9002, %9003) : (!llvm.ptr, i64) -> i64
      %9005 = func.call @cc_nil_value() : () -> i64
      %9006 = func.call @cc_intern(%9004, %9005) : (i64, i64) -> i64
      %9007 = func.call @cc_nil_value() : () -> i64
      %9008 = func.call @cc_cons(%9006, %9007) : (i64, i64) -> i64
      %9009 = func.call @cc_values_pack(%9008) : (i64) -> i64
      func.call @stack_push_pointer(%9006) : (i64) -> ()
      %9010 = func.call @stack_pop_pointer() : () -> i64
      %9011 = llvm.mlir.addressof @str769 : !llvm.ptr
      %9012 = arith.constant 3 : i64
      %9013 = func.call @cc_make_string(%9011, %9012) : (!llvm.ptr, i64) -> i64
      %9014 = func.call @cc_nil_value() : () -> i64
      %9015 = func.call @cc_intern(%9013, %9014) : (i64, i64) -> i64
      %9016 = func.call @cc_nil_value() : () -> i64
      %9017 = func.call @cc_cons(%9015, %9016) : (i64, i64) -> i64
      %9018 = func.call @cc_values_pack(%9017) : (i64) -> i64
      func.call @stack_push_pointer(%9015) : (i64) -> ()
      %9019 = llvm.mlir.addressof @str770 : !llvm.ptr
      %9020 = arith.constant 3 : i64
      %9021 = func.call @cc_make_string(%9019, %9020) : (!llvm.ptr, i64) -> i64
      %9022 = func.call @cc_nil_value() : () -> i64
      %9023 = func.call @cc_intern(%9021, %9022) : (i64, i64) -> i64
      %9024 = func.call @cc_nil_value() : () -> i64
      %9025 = func.call @cc_cons(%9023, %9024) : (i64, i64) -> i64
      %9026 = func.call @cc_values_pack(%9025) : (i64) -> i64
      func.call @stack_push_pointer(%9023) : (i64) -> ()
      %9027 = llvm.mlir.addressof @str771 : !llvm.ptr
      %9028 = arith.constant 5 : i64
      %9029 = func.call @cc_make_string(%9027, %9028) : (!llvm.ptr, i64) -> i64
      %9030 = func.call @cc_nil_value() : () -> i64
      %9031 = func.call @cc_intern(%9029, %9030) : (i64, i64) -> i64
      %9032 = func.call @cc_nil_value() : () -> i64
      %9033 = func.call @cc_cons(%9031, %9032) : (i64, i64) -> i64
      %9034 = func.call @cc_values_pack(%9033) : (i64) -> i64
      func.call @stack_push_pointer(%9031) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9035 = llvm.mlir.addressof @str772 : !llvm.ptr
      %9036 = arith.constant 20 : i64
      %9037 = func.call @cc_make_string(%9035, %9036) : (!llvm.ptr, i64) -> i64
      %9038 = llvm.mlir.addressof @str773 : !llvm.ptr
      %9039 = arith.constant 11 : i64
      %9040 = func.call @cc_make_string(%9038, %9039) : (!llvm.ptr, i64) -> i64
      %9041 = func.call @cc_intern(%9037, %9040) : (i64, i64) -> i64
      %9042 = func.call @cc_nil_value() : () -> i64
      %9043 = func.call @cc_cons(%9041, %9042) : (i64, i64) -> i64
      %9044 = func.call @cc_values_pack(%9043) : (i64) -> i64
      func.call @stack_push_pointer(%9041) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9045 = llvm.mlir.addressof @str774 : !llvm.ptr
      %9046 = arith.constant 32 : i64
      %9047 = func.call @cc_make_string(%9045, %9046) : (!llvm.ptr, i64) -> i64
      %9048 = func.call @cc_nil_value() : () -> i64
      %9049 = func.call @cc_intern(%9047, %9048) : (i64, i64) -> i64
      %9050 = func.call @cc_nil_value() : () -> i64
      %9051 = func.call @cc_cons(%9049, %9050) : (i64, i64) -> i64
      %9052 = func.call @cc_values_pack(%9051) : (i64) -> i64
      func.call @stack_push_pointer(%9049) : (i64) -> ()
      %9053 = llvm.mlir.addressof @str775 : !llvm.ptr
      %9054 = arith.constant 6 : i64
      %9055 = func.call @cc_make_string(%9053, %9054) : (!llvm.ptr, i64) -> i64
      %9056 = func.call @cc_nil_value() : () -> i64
      %9057 = func.call @cc_intern(%9055, %9056) : (i64, i64) -> i64
      %9058 = func.call @cc_nil_value() : () -> i64
      %9059 = func.call @cc_cons(%9057, %9058) : (i64, i64) -> i64
      %9060 = func.call @cc_values_pack(%9059) : (i64) -> i64
      func.call @stack_push_pointer(%9057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9061 = llvm.mlir.addressof @str776 : !llvm.ptr
      %9062 = arith.constant 10 : i64
      %9063 = func.call @cc_make_string(%9061, %9062) : (!llvm.ptr, i64) -> i64
      %9064 = llvm.mlir.addressof @str777 : !llvm.ptr
      %9065 = arith.constant 11 : i64
      %9066 = func.call @cc_make_string(%9064, %9065) : (!llvm.ptr, i64) -> i64
      %9067 = func.call @cc_intern(%9063, %9066) : (i64, i64) -> i64
      %9068 = func.call @cc_nil_value() : () -> i64
      %9069 = func.call @cc_cons(%9067, %9068) : (i64, i64) -> i64
      %9070 = func.call @cc_values_pack(%9069) : (i64) -> i64
      func.call @stack_push_pointer(%9067) : (i64) -> ()
      %9071 = llvm.mlir.addressof @str778 : !llvm.ptr
      %9072 = arith.constant 5 : i64
      %9073 = func.call @cc_make_string(%9071, %9072) : (!llvm.ptr, i64) -> i64
      %9074 = func.call @cc_nil_value() : () -> i64
      %9075 = func.call @cc_intern(%9073, %9074) : (i64, i64) -> i64
      %9076 = func.call @cc_nil_value() : () -> i64
      %9077 = func.call @cc_cons(%9075, %9076) : (i64, i64) -> i64
      %9078 = func.call @cc_values_pack(%9077) : (i64) -> i64
      func.call @stack_push_pointer(%9075) : (i64) -> ()
      %9079 = llvm.mlir.addressof @str779 : !llvm.ptr
      %9080 = arith.constant 9 : i64
      %9081 = func.call @cc_make_string(%9079, %9080) : (!llvm.ptr, i64) -> i64
      %9082 = llvm.mlir.addressof @str780 : !llvm.ptr
      %9083 = arith.constant 7 : i64
      %9084 = func.call @cc_make_string(%9082, %9083) : (!llvm.ptr, i64) -> i64
      %9085 = func.call @cc_intern(%9081, %9084) : (i64, i64) -> i64
      %9086 = func.call @cc_nil_value() : () -> i64
      %9087 = func.call @cc_cons(%9085, %9086) : (i64, i64) -> i64
      %9088 = func.call @cc_values_pack(%9087) : (i64) -> i64
      func.call @stack_push_pointer(%9085) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9089 = func.call @stack_pop_pointer() : () -> i64
      %9090 = func.call @stack_pop_pointer() : () -> i64
      %9091 = func.call @cc_cons(%9090, %9089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9091) : (i64) -> ()
      %9092 = func.call @stack_pop_pointer() : () -> i64
      %9093 = func.call @stack_pop_pointer() : () -> i64
      %9094 = func.call @cc_cons(%9093, %9092) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9094) : (i64) -> ()
      %9095 = func.call @stack_pop_pointer() : () -> i64
      %9096 = func.call @stack_pop_pointer() : () -> i64
      %9097 = func.call @cc_cons(%9096, %9095) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9097) : (i64) -> ()
      %9098 = llvm.mlir.addressof @str781 : !llvm.ptr
      %9099 = arith.constant 9 : i64
      %9100 = func.call @cc_make_string(%9098, %9099) : (!llvm.ptr, i64) -> i64
      %9101 = llvm.mlir.addressof @str782 : !llvm.ptr
      %9102 = arith.constant 11 : i64
      %9103 = func.call @cc_make_string(%9101, %9102) : (!llvm.ptr, i64) -> i64
      %9104 = func.call @cc_intern(%9100, %9103) : (i64, i64) -> i64
      %9105 = func.call @cc_nil_value() : () -> i64
      %9106 = func.call @cc_cons(%9104, %9105) : (i64, i64) -> i64
      %9107 = func.call @cc_values_pack(%9106) : (i64) -> i64
      func.call @stack_push_pointer(%9104) : (i64) -> ()
      %9108 = llvm.mlir.addressof @str783 : !llvm.ptr
      %9109 = arith.constant 6 : i64
      %9110 = func.call @cc_make_string(%9108, %9109) : (!llvm.ptr, i64) -> i64
      %9111 = func.call @cc_nil_value() : () -> i64
      %9112 = func.call @cc_intern(%9110, %9111) : (i64, i64) -> i64
      %9113 = func.call @cc_nil_value() : () -> i64
      %9114 = func.call @cc_cons(%9112, %9113) : (i64, i64) -> i64
      %9115 = func.call @cc_values_pack(%9114) : (i64) -> i64
      func.call @stack_push_pointer(%9112) : (i64) -> ()
      %9116 = llvm.mlir.addressof @str784 : !llvm.ptr
      %9117 = arith.constant 5 : i64
      %9118 = func.call @cc_make_string(%9116, %9117) : (!llvm.ptr, i64) -> i64
      %9119 = func.call @cc_nil_value() : () -> i64
      %9120 = func.call @cc_intern(%9118, %9119) : (i64, i64) -> i64
      %9121 = func.call @cc_nil_value() : () -> i64
      %9122 = func.call @cc_cons(%9120, %9121) : (i64, i64) -> i64
      %9123 = func.call @cc_values_pack(%9122) : (i64) -> i64
      func.call @stack_push_pointer(%9120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9124 = func.call @stack_pop_pointer() : () -> i64
      %9125 = func.call @stack_pop_pointer() : () -> i64
      %9126 = func.call @cc_cons(%9125, %9124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9126) : (i64) -> ()
      %9127 = llvm.mlir.addressof @str785 : !llvm.ptr
      %9128 = arith.constant 2 : i64
      %9129 = func.call @cc_make_string(%9127, %9128) : (!llvm.ptr, i64) -> i64
      %9130 = func.call @cc_nil_value() : () -> i64
      %9131 = func.call @cc_intern(%9129, %9130) : (i64, i64) -> i64
      %9132 = func.call @cc_nil_value() : () -> i64
      %9133 = func.call @cc_cons(%9131, %9132) : (i64, i64) -> i64
      %9134 = func.call @cc_values_pack(%9133) : (i64) -> i64
      func.call @stack_push_pointer(%9131) : (i64) -> ()
      %9135 = llvm.mlir.addressof @str786 : !llvm.ptr
      %9136 = arith.constant 2 : i64
      %9137 = func.call @cc_make_string(%9135, %9136) : (!llvm.ptr, i64) -> i64
      %9138 = llvm.mlir.addressof @str787 : !llvm.ptr
      %9139 = arith.constant 11 : i64
      %9140 = func.call @cc_make_string(%9138, %9139) : (!llvm.ptr, i64) -> i64
      %9141 = func.call @cc_intern(%9137, %9140) : (i64, i64) -> i64
      %9142 = func.call @cc_nil_value() : () -> i64
      %9143 = func.call @cc_cons(%9141, %9142) : (i64, i64) -> i64
      %9144 = func.call @cc_values_pack(%9143) : (i64) -> i64
      func.call @stack_push_pointer(%9141) : (i64) -> ()
      %9145 = llvm.mlir.addressof @str788 : !llvm.ptr
      %9146 = arith.constant 19 : i64
      %9147 = func.call @cc_make_string(%9145, %9146) : (!llvm.ptr, i64) -> i64
      %9148 = llvm.mlir.addressof @str789 : !llvm.ptr
      %9149 = arith.constant 11 : i64
      %9150 = func.call @cc_make_string(%9148, %9149) : (!llvm.ptr, i64) -> i64
      %9151 = func.call @cc_intern(%9147, %9150) : (i64, i64) -> i64
      %9152 = func.call @cc_nil_value() : () -> i64
      %9153 = func.call @cc_cons(%9151, %9152) : (i64, i64) -> i64
      %9154 = func.call @cc_values_pack(%9153) : (i64) -> i64
      func.call @stack_push_pointer(%9151) : (i64) -> ()
      %9155 = llvm.mlir.addressof @str790 : !llvm.ptr
      %9156 = arith.constant 5 : i64
      %9157 = func.call @cc_make_string(%9155, %9156) : (!llvm.ptr, i64) -> i64
      %9158 = func.call @cc_nil_value() : () -> i64
      %9159 = func.call @cc_intern(%9157, %9158) : (i64, i64) -> i64
      %9160 = func.call @cc_nil_value() : () -> i64
      %9161 = func.call @cc_cons(%9159, %9160) : (i64, i64) -> i64
      %9162 = func.call @cc_values_pack(%9161) : (i64) -> i64
      func.call @stack_push_pointer(%9159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9163 = func.call @stack_pop_pointer() : () -> i64
      %9164 = func.call @stack_pop_pointer() : () -> i64
      %9165 = func.call @cc_cons(%9164, %9163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9165) : (i64) -> ()
      %9166 = func.call @stack_pop_pointer() : () -> i64
      %9167 = func.call @stack_pop_pointer() : () -> i64
      %9168 = func.call @cc_cons(%9167, %9166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9168) : (i64) -> ()
      %9169 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%9169) : (i64) -> ()
      %9170 = llvm.mlir.addressof @str791 : !llvm.ptr
      %9171 = arith.constant 32 : i64
      %9172 = func.call @cc_make_string(%9170, %9171) : (!llvm.ptr, i64) -> i64
      %9173 = func.call @cc_nil_value() : () -> i64
      %9174 = func.call @cc_intern(%9172, %9173) : (i64, i64) -> i64
      %9175 = func.call @cc_nil_value() : () -> i64
      %9176 = func.call @cc_cons(%9174, %9175) : (i64, i64) -> i64
      %9177 = func.call @cc_values_pack(%9176) : (i64) -> i64
      func.call @stack_push_pointer(%9174) : (i64) -> ()
      %9178 = func.call @stack_pop_pointer() : () -> i64
      %9179 = func.call @stack_pop_pointer() : () -> i64
      %9180 = func.call @cc_cons(%9178, %9179) : (i64, i64) -> i64
      %9181 = llvm.mlir.addressof @str792 : !llvm.ptr
      %9182 = arith.constant 5 : i64
      %9183 = func.call @cc_make_string(%9181, %9182) : (!llvm.ptr, i64) -> i64
      %9184 = func.call @cc_nil_value() : () -> i64
      %9185 = func.call @cc_intern(%9183, %9184) : (i64, i64) -> i64
      %9186 = func.call @cc_nil_value() : () -> i64
      %9187 = func.call @cc_cons(%9185, %9186) : (i64, i64) -> i64
      %9188 = func.call @cc_values_pack(%9187) : (i64) -> i64
      %9189 = func.call @cc_cons(%9185, %9180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9189) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9190 = func.call @stack_pop_pointer() : () -> i64
      %9191 = func.call @stack_pop_pointer() : () -> i64
      %9192 = func.call @cc_cons(%9191, %9190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9192) : (i64) -> ()
      %9193 = func.call @stack_pop_pointer() : () -> i64
      %9194 = func.call @stack_pop_pointer() : () -> i64
      %9195 = func.call @cc_cons(%9194, %9193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9195) : (i64) -> ()
      %9196 = func.call @stack_pop_pointer() : () -> i64
      %9197 = func.call @stack_pop_pointer() : () -> i64
      %9198 = func.call @cc_cons(%9197, %9196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9198) : (i64) -> ()
      %9199 = llvm.mlir.addressof @str793 : !llvm.ptr
      %9200 = arith.constant 5 : i64
      %9201 = func.call @cc_make_string(%9199, %9200) : (!llvm.ptr, i64) -> i64
      %9202 = func.call @cc_nil_value() : () -> i64
      %9203 = func.call @cc_intern(%9201, %9202) : (i64, i64) -> i64
      %9204 = func.call @cc_nil_value() : () -> i64
      %9205 = func.call @cc_cons(%9203, %9204) : (i64, i64) -> i64
      %9206 = func.call @cc_values_pack(%9205) : (i64) -> i64
      func.call @stack_push_pointer(%9203) : (i64) -> ()
      %9207 = llvm.mlir.addressof @str794 : !llvm.ptr
      %9208 = arith.constant 11 : i64
      %9209 = func.call @cc_make_string(%9207, %9208) : (!llvm.ptr, i64) -> i64
      %9210 = func.call @cc_nil_value() : () -> i64
      %9211 = func.call @cc_intern(%9209, %9210) : (i64, i64) -> i64
      %9212 = func.call @cc_nil_value() : () -> i64
      %9213 = func.call @cc_cons(%9211, %9212) : (i64, i64) -> i64
      %9214 = func.call @cc_values_pack(%9213) : (i64) -> i64
      func.call @stack_push_pointer(%9211) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9215 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%9215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9216 = func.call @stack_pop_pointer() : () -> i64
      %9217 = func.call @stack_pop_pointer() : () -> i64
      %9218 = func.call @cc_cons(%9217, %9216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9218) : (i64) -> ()
      %9219 = func.call @stack_pop_pointer() : () -> i64
      %9220 = func.call @stack_pop_pointer() : () -> i64
      %9221 = func.call @cc_cons(%9220, %9219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9221) : (i64) -> ()
      %9222 = func.call @stack_pop_pointer() : () -> i64
      %9223 = func.call @stack_pop_pointer() : () -> i64
      %9224 = func.call @cc_cons(%9223, %9222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9224) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9225 = func.call @stack_pop_pointer() : () -> i64
      %9226 = func.call @stack_pop_pointer() : () -> i64
      %9227 = func.call @cc_cons(%9226, %9225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9227) : (i64) -> ()
      %9228 = func.call @stack_pop_pointer() : () -> i64
      %9229 = func.call @stack_pop_pointer() : () -> i64
      %9230 = func.call @cc_cons(%9229, %9228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9230) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9231 = func.call @stack_pop_pointer() : () -> i64
      %9232 = func.call @stack_pop_pointer() : () -> i64
      %9233 = func.call @cc_cons(%9232, %9231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9233) : (i64) -> ()
      %9234 = func.call @stack_pop_pointer() : () -> i64
      %9235 = func.call @stack_pop_pointer() : () -> i64
      %9236 = func.call @cc_cons(%9235, %9234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9236) : (i64) -> ()
      %9237 = func.call @stack_pop_pointer() : () -> i64
      %9238 = func.call @stack_pop_pointer() : () -> i64
      %9239 = func.call @cc_cons(%9238, %9237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9239) : (i64) -> ()
      %9240 = func.call @stack_pop_pointer() : () -> i64
      %9241 = func.call @stack_pop_pointer() : () -> i64
      %9242 = func.call @cc_cons(%9241, %9240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9242) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9243 = func.call @stack_pop_pointer() : () -> i64
      %9244 = func.call @stack_pop_pointer() : () -> i64
      %9245 = func.call @cc_cons(%9244, %9243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9245) : (i64) -> ()
      %9246 = func.call @stack_pop_pointer() : () -> i64
      %9247 = func.call @stack_pop_pointer() : () -> i64
      %9248 = func.call @cc_cons(%9247, %9246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9248) : (i64) -> ()
      %9249 = func.call @stack_pop_pointer() : () -> i64
      %9250 = func.call @stack_pop_pointer() : () -> i64
      %9251 = func.call @cc_cons(%9250, %9249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9251) : (i64) -> ()
      %9252 = llvm.mlir.addressof @str795 : !llvm.ptr
      %9253 = arith.constant 5 : i64
      %9254 = func.call @cc_make_string(%9252, %9253) : (!llvm.ptr, i64) -> i64
      %9255 = func.call @cc_nil_value() : () -> i64
      %9256 = func.call @cc_intern(%9254, %9255) : (i64, i64) -> i64
      %9257 = func.call @cc_nil_value() : () -> i64
      %9258 = func.call @cc_cons(%9256, %9257) : (i64, i64) -> i64
      %9259 = func.call @cc_values_pack(%9258) : (i64) -> i64
      func.call @stack_push_pointer(%9256) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9260 = func.call @stack_pop_pointer() : () -> i64
      %9261 = func.call @stack_pop_pointer() : () -> i64
      %9262 = func.call @cc_cons(%9261, %9260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9262) : (i64) -> ()
      %9263 = func.call @stack_pop_pointer() : () -> i64
      %9264 = func.call @stack_pop_pointer() : () -> i64
      %9265 = func.call @cc_cons(%9264, %9263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9265) : (i64) -> ()
      %9266 = func.call @stack_pop_pointer() : () -> i64
      %9267 = func.call @stack_pop_pointer() : () -> i64
      %9268 = func.call @cc_cons(%9267, %9266) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9268) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9269 = func.call @stack_pop_pointer() : () -> i64
      %9270 = func.call @stack_pop_pointer() : () -> i64
      %9271 = func.call @cc_cons(%9270, %9269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9271) : (i64) -> ()
      %9272 = func.call @stack_pop_pointer() : () -> i64
      %9273 = func.call @stack_pop_pointer() : () -> i64
      %9274 = func.call @cc_cons(%9273, %9272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9274) : (i64) -> ()
      %9275 = func.call @stack_pop_pointer() : () -> i64
      %9276 = func.call @stack_pop_pointer() : () -> i64
      %9277 = func.call @cc_cons(%9276, %9275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9278 = func.call @stack_pop_pointer() : () -> i64
      %9279 = func.call @stack_pop_pointer() : () -> i64
      %9280 = func.call @cc_cons(%9279, %9278) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9280) : (i64) -> ()
      %9281 = func.call @stack_pop_pointer() : () -> i64
      %9282 = func.call @stack_pop_pointer() : () -> i64
      %9283 = func.call @cc_cons(%9282, %9281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9283) : (i64) -> ()
      %9284 = func.call @stack_pop_pointer() : () -> i64
      %9285 = func.call @stack_pop_pointer() : () -> i64
      %9286 = func.call @cc_cons(%9285, %9284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9286) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9287 = func.call @stack_pop_pointer() : () -> i64
      %9288 = func.call @stack_pop_pointer() : () -> i64
      %9289 = func.call @cc_cons(%9288, %9287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9289) : (i64) -> ()
      %9290 = func.call @stack_pop_pointer() : () -> i64
      %9291 = func.call @stack_pop_pointer() : () -> i64
      %9292 = func.call @cc_cons(%9291, %9290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9292) : (i64) -> ()
      %9293 = func.call @stack_pop_pointer() : () -> i64
      %9294 = func.call @stack_pop_pointer() : () -> i64
      %9295 = func.call @cc_cons(%9294, %9293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9295) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9296 = func.call @stack_pop_pointer() : () -> i64
      %9297 = func.call @stack_pop_pointer() : () -> i64
      %9298 = func.call @cc_cons(%9297, %9296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9298) : (i64) -> ()
      %9299 = func.call @stack_pop_pointer() : () -> i64
      %9300 = func.call @stack_pop_pointer() : () -> i64
      %9301 = func.call @cc_cons(%9300, %9299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9301) : (i64) -> ()
      %9302 = func.call @stack_pop_pointer() : () -> i64
      %9303 = func.call @stack_pop_pointer() : () -> i64
      %9304 = func.call @cc_cons(%9303, %9302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9305 = func.call @stack_pop_pointer() : () -> i64
      %9306 = func.call @stack_pop_pointer() : () -> i64
      %9307 = func.call @cc_cons(%9306, %9305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9307) : (i64) -> ()
      %9308 = func.call @stack_pop_pointer() : () -> i64
      %9309 = func.call @stack_pop_pointer() : () -> i64
      %9310 = func.call @cc_cons(%9309, %9308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9310) : (i64) -> ()
      %9311 = func.call @stack_pop_pointer() : () -> i64
      %9312 = func.call @stack_pop_pointer() : () -> i64
      %9313 = func.call @cc_cons(%9312, %9311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9314 = func.call @stack_pop_pointer() : () -> i64
      %9315 = func.call @stack_pop_pointer() : () -> i64
      %9316 = func.call @cc_cons(%9315, %9314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9316) : (i64) -> ()
      %9317 = func.call @stack_pop_pointer() : () -> i64
      %9318 = func.call @stack_pop_pointer() : () -> i64
      %9319 = func.call @cc_cons(%9318, %9317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9319) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9320 = func.call @stack_pop_pointer() : () -> i64
      %9321 = func.call @stack_pop_pointer() : () -> i64
      %9322 = func.call @cc_cons(%9321, %9320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9322) : (i64) -> ()
      %9323 = func.call @stack_pop_pointer() : () -> i64
      %9324 = func.call @stack_pop_pointer() : () -> i64
      %9325 = func.call @cc_cons(%9324, %9323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9325) : (i64) -> ()
      %9326 = func.call @stack_pop_pointer() : () -> i64
      %9548 = llvm.mlir.addressof @str810 : !llvm.ptr
      %9549 = arith.constant 33 : i64
      %9550 = func.call @cc_make_symbol(%9548, %9549) : (!llvm.ptr, i64) -> i64
      %9551 = func.call @cc_persistent_root_value(%9550) : (i64) -> i64
      func.call @stack_push_pointer(%9551) : (i64) -> ()
      %9552 = arith.constant 97047688511566 : i64
      %9553 = arith.constant 1 : i64
      %9554 = func.call @cc_make_closure(%9552, %9553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9554) : (i64) -> ()
      %9555 = func.call @stack_pop_pointer() : () -> i64
      %9556 = llvm.mlir.addressof @str811 : !llvm.ptr
      %9557 = arith.constant 1 : i64
      %9558 = func.call @cc_make_string(%9556, %9557) : (!llvm.ptr, i64) -> i64
      %9559 = func.call @cc_nil_value() : () -> i64
      %9560 = func.call @cc_intern(%9558, %9559) : (i64, i64) -> i64
      %9561 = func.call @cc_nil_value() : () -> i64
      %9562 = func.call @cc_cons(%9560, %9561) : (i64, i64) -> i64
      %9563 = func.call @cc_values_pack(%9562) : (i64) -> i64
      func.call @stack_push_pointer(%9560) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9564 = func.call @stack_pop_pointer() : () -> i64
      %9565 = func.call @stack_pop_pointer() : () -> i64
      %9566 = func.call @cc_cons(%9565, %9564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9566) : (i64) -> ()
      %9567 = func.call @stack_pop_pointer() : () -> i64
      %9568 = llvm.mlir.addressof @str812 : !llvm.ptr
      %9569 = arith.constant 11 : i64
      %9570 = func.call @cc_make_string(%9568, %9569) : (!llvm.ptr, i64) -> i64
      %9571 = llvm.mlir.addressof @str813 : !llvm.ptr
      %9572 = arith.constant 7 : i64
      %9573 = func.call @cc_make_string(%9571, %9572) : (!llvm.ptr, i64) -> i64
      %9574 = func.call @cc_intern(%9570, %9573) : (i64, i64) -> i64
      %9575 = func.call @cc_nil_value() : () -> i64
      %9576 = func.call @cc_cons(%9574, %9575) : (i64, i64) -> i64
      %9577 = func.call @cc_values_pack(%9576) : (i64) -> i64
      func.call @stack_push_pointer(%9574) : (i64) -> ()
      %9578 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9579 = func.call @stack_pop_pointer() : () -> i64
      %9580 = llvm.mlir.addressof @str814 : !llvm.ptr
      %9581 = arith.constant 4 : i64
      %9582 = func.call @cc_make_string(%9580, %9581) : (!llvm.ptr, i64) -> i64
      %9583 = llvm.mlir.addressof @str815 : !llvm.ptr
      %9584 = arith.constant 7 : i64
      %9585 = func.call @cc_make_string(%9583, %9584) : (!llvm.ptr, i64) -> i64
      %9586 = func.call @cc_intern(%9582, %9585) : (i64, i64) -> i64
      %9587 = func.call @cc_nil_value() : () -> i64
      %9588 = func.call @cc_cons(%9586, %9587) : (i64, i64) -> i64
      %9589 = func.call @cc_values_pack(%9588) : (i64) -> i64
      func.call @stack_push_pointer(%9586) : (i64) -> ()
      %9590 = func.call @stack_pop_pointer() : () -> i64
      %9591 = llvm.mlir.addressof @str816 : !llvm.ptr
      %9592 = arith.constant 6 : i64
      %9593 = func.call @cc_make_string(%9591, %9592) : (!llvm.ptr, i64) -> i64
      %9594 = func.call @cc_nil_value() : () -> i64
      %9595 = func.call @cc_intern(%9593, %9594) : (i64, i64) -> i64
      %9596 = func.call @cc_nil_value() : () -> i64
      %9597 = func.call @cc_cons(%9595, %9596) : (i64, i64) -> i64
      %9598 = func.call @cc_values_pack(%9597) : (i64) -> i64
      func.call @stack_push_pointer(%9595) : (i64) -> ()
      %9599 = func.call @stack_pop_pointer() : () -> i64
      %9600 = func.call @cc_nil_value() : () -> i64
      %9601 = func.call @cc_errorp(%9010) : (i64) -> i64
      %9602 = arith.cmpi ne, %9601, %9600 : i64
      %9603 = arith.cmpi eq, %9600, %9600 : i64
      %9604 = arith.andi %9602, %9603 : i1
      %9605 = scf.if %9604 -> (i64) {
        scf.yield %9010 : i64
      } else {
        scf.yield %9600 : i64
      }
      %9606 = func.call @cc_errorp(%9326) : (i64) -> i64
      %9607 = arith.cmpi ne, %9606, %9600 : i64
      %9608 = arith.cmpi eq, %9605, %9600 : i64
      %9609 = arith.andi %9607, %9608 : i1
      %9610 = scf.if %9609 -> (i64) {
        scf.yield %9326 : i64
      } else {
        scf.yield %9605 : i64
      }
      %9611 = func.call @cc_errorp(%9555) : (i64) -> i64
      %9612 = arith.cmpi ne, %9611, %9600 : i64
      %9613 = arith.cmpi eq, %9610, %9600 : i64
      %9614 = arith.andi %9612, %9613 : i1
      %9615 = scf.if %9614 -> (i64) {
        scf.yield %9555 : i64
      } else {
        scf.yield %9610 : i64
      }
      %9616 = func.call @cc_errorp(%9567) : (i64) -> i64
      %9617 = arith.cmpi ne, %9616, %9600 : i64
      %9618 = arith.cmpi eq, %9615, %9600 : i64
      %9619 = arith.andi %9617, %9618 : i1
      %9620 = scf.if %9619 -> (i64) {
        scf.yield %9567 : i64
      } else {
        scf.yield %9615 : i64
      }
      %9621 = func.call @cc_errorp(%9578) : (i64) -> i64
      %9622 = arith.cmpi ne, %9621, %9600 : i64
      %9623 = arith.cmpi eq, %9620, %9600 : i64
      %9624 = arith.andi %9622, %9623 : i1
      %9625 = scf.if %9624 -> (i64) {
        scf.yield %9578 : i64
      } else {
        scf.yield %9620 : i64
      }
      %9626 = func.call @cc_errorp(%9579) : (i64) -> i64
      %9627 = arith.cmpi ne, %9626, %9600 : i64
      %9628 = arith.cmpi eq, %9625, %9600 : i64
      %9629 = arith.andi %9627, %9628 : i1
      %9630 = scf.if %9629 -> (i64) {
        scf.yield %9579 : i64
      } else {
        scf.yield %9625 : i64
      }
      %9631 = func.call @cc_errorp(%9590) : (i64) -> i64
      %9632 = arith.cmpi ne, %9631, %9600 : i64
      %9633 = arith.cmpi eq, %9630, %9600 : i64
      %9634 = arith.andi %9632, %9633 : i1
      %9635 = scf.if %9634 -> (i64) {
        scf.yield %9590 : i64
      } else {
        scf.yield %9630 : i64
      }
      %9636 = func.call @cc_errorp(%9599) : (i64) -> i64
      %9637 = arith.cmpi ne, %9636, %9600 : i64
      %9638 = arith.cmpi eq, %9635, %9600 : i64
      %9639 = arith.andi %9637, %9638 : i1
      %9640 = scf.if %9639 -> (i64) {
        scf.yield %9599 : i64
      } else {
        scf.yield %9635 : i64
      }
      %9641 = arith.cmpi ne, %9640, %9600 : i64
      scf.if %9641 {
        func.call @stack_push_pointer(%9640) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9010) : (i64) -> ()
        func.call @stack_push_pointer(%9326) : (i64) -> ()
        func.call @stack_push_pointer(%9555) : (i64) -> ()
        func.call @stack_push_pointer(%9567) : (i64) -> ()
        func.call @stack_push_pointer(%9578) : (i64) -> ()
        func.call @stack_push_pointer(%9579) : (i64) -> ()
        func.call @stack_push_pointer(%9590) : (i64) -> ()
        func.call @stack_push_pointer(%9599) : (i64) -> ()
        %9642 = llvm.mlir.addressof @str817 : !llvm.ptr
        %9643 = func.call @cc_make_function_ref_const(%9642) : (!llvm.ptr) -> i64
        %9644 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9643, %9644) : (i64, i64) -> ()
      }
      %9645 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9645 : i64
    }
    %9646 = func.call @cc_nil_value() : () -> i64
    %9647 = func.call @cc_errorp(%9001) : (i64) -> i64
    %9648 = arith.cmpi ne, %9647, %9646 : i64
    %9649 = scf.if %9648 -> (i64) {
      scf.yield %9001 : i64
    } else {
      %9650 = llvm.mlir.addressof @str818 : !llvm.ptr
      %9651 = arith.constant 19 : i64
      %9652 = func.call @cc_make_string(%9650, %9651) : (!llvm.ptr, i64) -> i64
      %9653 = func.call @cc_nil_value() : () -> i64
      %9654 = func.call @cc_intern(%9652, %9653) : (i64, i64) -> i64
      %9655 = func.call @cc_nil_value() : () -> i64
      %9656 = func.call @cc_cons(%9654, %9655) : (i64, i64) -> i64
      %9657 = func.call @cc_values_pack(%9656) : (i64) -> i64
      func.call @stack_push_pointer(%9654) : (i64) -> ()
      %9658 = func.call @stack_pop_pointer() : () -> i64
      %9659 = llvm.mlir.addressof @str819 : !llvm.ptr
      %9660 = arith.constant 3 : i64
      %9661 = func.call @cc_make_string(%9659, %9660) : (!llvm.ptr, i64) -> i64
      %9662 = func.call @cc_nil_value() : () -> i64
      %9663 = func.call @cc_intern(%9661, %9662) : (i64, i64) -> i64
      %9664 = func.call @cc_nil_value() : () -> i64
      %9665 = func.call @cc_cons(%9663, %9664) : (i64, i64) -> i64
      %9666 = func.call @cc_values_pack(%9665) : (i64) -> i64
      func.call @stack_push_pointer(%9663) : (i64) -> ()
      %9667 = llvm.mlir.addressof @str820 : !llvm.ptr
      %9668 = arith.constant 3 : i64
      %9669 = func.call @cc_make_string(%9667, %9668) : (!llvm.ptr, i64) -> i64
      %9670 = func.call @cc_nil_value() : () -> i64
      %9671 = func.call @cc_intern(%9669, %9670) : (i64, i64) -> i64
      %9672 = func.call @cc_nil_value() : () -> i64
      %9673 = func.call @cc_cons(%9671, %9672) : (i64, i64) -> i64
      %9674 = func.call @cc_values_pack(%9673) : (i64) -> i64
      func.call @stack_push_pointer(%9671) : (i64) -> ()
      %9675 = llvm.mlir.addressof @str821 : !llvm.ptr
      %9676 = arith.constant 5 : i64
      %9677 = func.call @cc_make_string(%9675, %9676) : (!llvm.ptr, i64) -> i64
      %9678 = func.call @cc_nil_value() : () -> i64
      %9679 = func.call @cc_intern(%9677, %9678) : (i64, i64) -> i64
      %9680 = func.call @cc_nil_value() : () -> i64
      %9681 = func.call @cc_cons(%9679, %9680) : (i64, i64) -> i64
      %9682 = func.call @cc_values_pack(%9681) : (i64) -> i64
      func.call @stack_push_pointer(%9679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9683 = llvm.mlir.addressof @str822 : !llvm.ptr
      %9684 = arith.constant 32 : i64
      %9685 = func.call @cc_make_string(%9683, %9684) : (!llvm.ptr, i64) -> i64
      %9686 = func.call @cc_nil_value() : () -> i64
      %9687 = func.call @cc_intern(%9685, %9686) : (i64, i64) -> i64
      %9688 = func.call @cc_nil_value() : () -> i64
      %9689 = func.call @cc_cons(%9687, %9688) : (i64, i64) -> i64
      %9690 = func.call @cc_values_pack(%9689) : (i64) -> i64
      func.call @stack_push_pointer(%9687) : (i64) -> ()
      %9691 = llvm.mlir.addressof @str823 : !llvm.ptr
      %9692 = arith.constant 6 : i64
      %9693 = func.call @cc_make_string(%9691, %9692) : (!llvm.ptr, i64) -> i64
      %9694 = func.call @cc_nil_value() : () -> i64
      %9695 = func.call @cc_intern(%9693, %9694) : (i64, i64) -> i64
      %9696 = func.call @cc_nil_value() : () -> i64
      %9697 = func.call @cc_cons(%9695, %9696) : (i64, i64) -> i64
      %9698 = func.call @cc_values_pack(%9697) : (i64) -> i64
      func.call @stack_push_pointer(%9695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9699 = llvm.mlir.addressof @str824 : !llvm.ptr
      %9700 = arith.constant 17 : i64
      %9701 = func.call @cc_make_string(%9699, %9700) : (!llvm.ptr, i64) -> i64
      %9702 = llvm.mlir.addressof @str825 : !llvm.ptr
      %9703 = arith.constant 11 : i64
      %9704 = func.call @cc_make_string(%9702, %9703) : (!llvm.ptr, i64) -> i64
      %9705 = func.call @cc_intern(%9701, %9704) : (i64, i64) -> i64
      %9706 = func.call @cc_nil_value() : () -> i64
      %9707 = func.call @cc_cons(%9705, %9706) : (i64, i64) -> i64
      %9708 = func.call @cc_values_pack(%9707) : (i64) -> i64
      func.call @stack_push_pointer(%9705) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9709 = llvm.mlir.addressof @str826 : !llvm.ptr
      %9710 = arith.constant 10 : i64
      %9711 = func.call @cc_make_string(%9709, %9710) : (!llvm.ptr, i64) -> i64
      %9712 = llvm.mlir.addressof @str827 : !llvm.ptr
      %9713 = arith.constant 11 : i64
      %9714 = func.call @cc_make_string(%9712, %9713) : (!llvm.ptr, i64) -> i64
      %9715 = func.call @cc_intern(%9711, %9714) : (i64, i64) -> i64
      %9716 = func.call @cc_nil_value() : () -> i64
      %9717 = func.call @cc_cons(%9715, %9716) : (i64, i64) -> i64
      %9718 = func.call @cc_values_pack(%9717) : (i64) -> i64
      func.call @stack_push_pointer(%9715) : (i64) -> ()
      %9719 = llvm.mlir.addressof @str828 : !llvm.ptr
      %9720 = arith.constant 5 : i64
      %9721 = func.call @cc_make_string(%9719, %9720) : (!llvm.ptr, i64) -> i64
      %9722 = func.call @cc_nil_value() : () -> i64
      %9723 = func.call @cc_intern(%9721, %9722) : (i64, i64) -> i64
      %9724 = func.call @cc_nil_value() : () -> i64
      %9725 = func.call @cc_cons(%9723, %9724) : (i64, i64) -> i64
      %9726 = func.call @cc_values_pack(%9725) : (i64) -> i64
      func.call @stack_push_pointer(%9723) : (i64) -> ()
      %9727 = llvm.mlir.addressof @str829 : !llvm.ptr
      %9728 = arith.constant 9 : i64
      %9729 = func.call @cc_make_string(%9727, %9728) : (!llvm.ptr, i64) -> i64
      %9730 = llvm.mlir.addressof @str830 : !llvm.ptr
      %9731 = arith.constant 7 : i64
      %9732 = func.call @cc_make_string(%9730, %9731) : (!llvm.ptr, i64) -> i64
      %9733 = func.call @cc_intern(%9729, %9732) : (i64, i64) -> i64
      %9734 = func.call @cc_nil_value() : () -> i64
      %9735 = func.call @cc_cons(%9733, %9734) : (i64, i64) -> i64
      %9736 = func.call @cc_values_pack(%9735) : (i64) -> i64
      func.call @stack_push_pointer(%9733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9737 = func.call @stack_pop_pointer() : () -> i64
      %9738 = func.call @stack_pop_pointer() : () -> i64
      %9739 = func.call @cc_cons(%9738, %9737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9739) : (i64) -> ()
      %9740 = func.call @stack_pop_pointer() : () -> i64
      %9741 = func.call @stack_pop_pointer() : () -> i64
      %9742 = func.call @cc_cons(%9741, %9740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9742) : (i64) -> ()
      %9743 = func.call @stack_pop_pointer() : () -> i64
      %9744 = func.call @stack_pop_pointer() : () -> i64
      %9745 = func.call @cc_cons(%9744, %9743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9745) : (i64) -> ()
      %9746 = llvm.mlir.addressof @str831 : !llvm.ptr
      %9747 = arith.constant 9 : i64
      %9748 = func.call @cc_make_string(%9746, %9747) : (!llvm.ptr, i64) -> i64
      %9749 = llvm.mlir.addressof @str832 : !llvm.ptr
      %9750 = arith.constant 11 : i64
      %9751 = func.call @cc_make_string(%9749, %9750) : (!llvm.ptr, i64) -> i64
      %9752 = func.call @cc_intern(%9748, %9751) : (i64, i64) -> i64
      %9753 = func.call @cc_nil_value() : () -> i64
      %9754 = func.call @cc_cons(%9752, %9753) : (i64, i64) -> i64
      %9755 = func.call @cc_values_pack(%9754) : (i64) -> i64
      func.call @stack_push_pointer(%9752) : (i64) -> ()
      %9756 = llvm.mlir.addressof @str833 : !llvm.ptr
      %9757 = arith.constant 6 : i64
      %9758 = func.call @cc_make_string(%9756, %9757) : (!llvm.ptr, i64) -> i64
      %9759 = func.call @cc_nil_value() : () -> i64
      %9760 = func.call @cc_intern(%9758, %9759) : (i64, i64) -> i64
      %9761 = func.call @cc_nil_value() : () -> i64
      %9762 = func.call @cc_cons(%9760, %9761) : (i64, i64) -> i64
      %9763 = func.call @cc_values_pack(%9762) : (i64) -> i64
      func.call @stack_push_pointer(%9760) : (i64) -> ()
      %9764 = llvm.mlir.addressof @str834 : !llvm.ptr
      %9765 = arith.constant 5 : i64
      %9766 = func.call @cc_make_string(%9764, %9765) : (!llvm.ptr, i64) -> i64
      %9767 = func.call @cc_nil_value() : () -> i64
      %9768 = func.call @cc_intern(%9766, %9767) : (i64, i64) -> i64
      %9769 = func.call @cc_nil_value() : () -> i64
      %9770 = func.call @cc_cons(%9768, %9769) : (i64, i64) -> i64
      %9771 = func.call @cc_values_pack(%9770) : (i64) -> i64
      func.call @stack_push_pointer(%9768) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9772 = func.call @stack_pop_pointer() : () -> i64
      %9773 = func.call @stack_pop_pointer() : () -> i64
      %9774 = func.call @cc_cons(%9773, %9772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9774) : (i64) -> ()
      %9775 = llvm.mlir.addressof @str835 : !llvm.ptr
      %9776 = arith.constant 2 : i64
      %9777 = func.call @cc_make_string(%9775, %9776) : (!llvm.ptr, i64) -> i64
      %9778 = func.call @cc_nil_value() : () -> i64
      %9779 = func.call @cc_intern(%9777, %9778) : (i64, i64) -> i64
      %9780 = func.call @cc_nil_value() : () -> i64
      %9781 = func.call @cc_cons(%9779, %9780) : (i64, i64) -> i64
      %9782 = func.call @cc_values_pack(%9781) : (i64) -> i64
      func.call @stack_push_pointer(%9779) : (i64) -> ()
      %9783 = llvm.mlir.addressof @str836 : !llvm.ptr
      %9784 = arith.constant 2 : i64
      %9785 = func.call @cc_make_string(%9783, %9784) : (!llvm.ptr, i64) -> i64
      %9786 = llvm.mlir.addressof @str837 : !llvm.ptr
      %9787 = arith.constant 11 : i64
      %9788 = func.call @cc_make_string(%9786, %9787) : (!llvm.ptr, i64) -> i64
      %9789 = func.call @cc_intern(%9785, %9788) : (i64, i64) -> i64
      %9790 = func.call @cc_nil_value() : () -> i64
      %9791 = func.call @cc_cons(%9789, %9790) : (i64, i64) -> i64
      %9792 = func.call @cc_values_pack(%9791) : (i64) -> i64
      func.call @stack_push_pointer(%9789) : (i64) -> ()
      %9793 = llvm.mlir.addressof @str838 : !llvm.ptr
      %9794 = arith.constant 19 : i64
      %9795 = func.call @cc_make_string(%9793, %9794) : (!llvm.ptr, i64) -> i64
      %9796 = llvm.mlir.addressof @str839 : !llvm.ptr
      %9797 = arith.constant 11 : i64
      %9798 = func.call @cc_make_string(%9796, %9797) : (!llvm.ptr, i64) -> i64
      %9799 = func.call @cc_intern(%9795, %9798) : (i64, i64) -> i64
      %9800 = func.call @cc_nil_value() : () -> i64
      %9801 = func.call @cc_cons(%9799, %9800) : (i64, i64) -> i64
      %9802 = func.call @cc_values_pack(%9801) : (i64) -> i64
      func.call @stack_push_pointer(%9799) : (i64) -> ()
      %9803 = llvm.mlir.addressof @str840 : !llvm.ptr
      %9804 = arith.constant 5 : i64
      %9805 = func.call @cc_make_string(%9803, %9804) : (!llvm.ptr, i64) -> i64
      %9806 = func.call @cc_nil_value() : () -> i64
      %9807 = func.call @cc_intern(%9805, %9806) : (i64, i64) -> i64
      %9808 = func.call @cc_nil_value() : () -> i64
      %9809 = func.call @cc_cons(%9807, %9808) : (i64, i64) -> i64
      %9810 = func.call @cc_values_pack(%9809) : (i64) -> i64
      func.call @stack_push_pointer(%9807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9811 = func.call @stack_pop_pointer() : () -> i64
      %9812 = func.call @stack_pop_pointer() : () -> i64
      %9813 = func.call @cc_cons(%9812, %9811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9813) : (i64) -> ()
      %9814 = func.call @stack_pop_pointer() : () -> i64
      %9815 = func.call @stack_pop_pointer() : () -> i64
      %9816 = func.call @cc_cons(%9815, %9814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9816) : (i64) -> ()
      %9817 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%9817) : (i64) -> ()
      %9818 = llvm.mlir.addressof @str841 : !llvm.ptr
      %9819 = arith.constant 32 : i64
      %9820 = func.call @cc_make_string(%9818, %9819) : (!llvm.ptr, i64) -> i64
      %9821 = func.call @cc_nil_value() : () -> i64
      %9822 = func.call @cc_intern(%9820, %9821) : (i64, i64) -> i64
      %9823 = func.call @cc_nil_value() : () -> i64
      %9824 = func.call @cc_cons(%9822, %9823) : (i64, i64) -> i64
      %9825 = func.call @cc_values_pack(%9824) : (i64) -> i64
      func.call @stack_push_pointer(%9822) : (i64) -> ()
      %9826 = func.call @stack_pop_pointer() : () -> i64
      %9827 = func.call @stack_pop_pointer() : () -> i64
      %9828 = func.call @cc_cons(%9826, %9827) : (i64, i64) -> i64
      %9829 = llvm.mlir.addressof @str842 : !llvm.ptr
      %9830 = arith.constant 5 : i64
      %9831 = func.call @cc_make_string(%9829, %9830) : (!llvm.ptr, i64) -> i64
      %9832 = func.call @cc_nil_value() : () -> i64
      %9833 = func.call @cc_intern(%9831, %9832) : (i64, i64) -> i64
      %9834 = func.call @cc_nil_value() : () -> i64
      %9835 = func.call @cc_cons(%9833, %9834) : (i64, i64) -> i64
      %9836 = func.call @cc_values_pack(%9835) : (i64) -> i64
      %9837 = func.call @cc_cons(%9833, %9828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9837) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9838 = func.call @stack_pop_pointer() : () -> i64
      %9839 = func.call @stack_pop_pointer() : () -> i64
      %9840 = func.call @cc_cons(%9839, %9838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9840) : (i64) -> ()
      %9841 = func.call @stack_pop_pointer() : () -> i64
      %9842 = func.call @stack_pop_pointer() : () -> i64
      %9843 = func.call @cc_cons(%9842, %9841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9843) : (i64) -> ()
      %9844 = func.call @stack_pop_pointer() : () -> i64
      %9845 = func.call @stack_pop_pointer() : () -> i64
      %9846 = func.call @cc_cons(%9845, %9844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9846) : (i64) -> ()
      %9847 = llvm.mlir.addressof @str843 : !llvm.ptr
      %9848 = arith.constant 5 : i64
      %9849 = func.call @cc_make_string(%9847, %9848) : (!llvm.ptr, i64) -> i64
      %9850 = func.call @cc_nil_value() : () -> i64
      %9851 = func.call @cc_intern(%9849, %9850) : (i64, i64) -> i64
      %9852 = func.call @cc_nil_value() : () -> i64
      %9853 = func.call @cc_cons(%9851, %9852) : (i64, i64) -> i64
      %9854 = func.call @cc_values_pack(%9853) : (i64) -> i64
      func.call @stack_push_pointer(%9851) : (i64) -> ()
      %9855 = llvm.mlir.addressof @str844 : !llvm.ptr
      %9856 = arith.constant 11 : i64
      %9857 = func.call @cc_make_string(%9855, %9856) : (!llvm.ptr, i64) -> i64
      %9858 = func.call @cc_nil_value() : () -> i64
      %9859 = func.call @cc_intern(%9857, %9858) : (i64, i64) -> i64
      %9860 = func.call @cc_nil_value() : () -> i64
      %9861 = func.call @cc_cons(%9859, %9860) : (i64, i64) -> i64
      %9862 = func.call @cc_values_pack(%9861) : (i64) -> i64
      func.call @stack_push_pointer(%9859) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9863 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%9863) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9864 = func.call @stack_pop_pointer() : () -> i64
      %9865 = func.call @stack_pop_pointer() : () -> i64
      %9866 = func.call @cc_cons(%9865, %9864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9866) : (i64) -> ()
      %9867 = func.call @stack_pop_pointer() : () -> i64
      %9868 = func.call @stack_pop_pointer() : () -> i64
      %9869 = func.call @cc_cons(%9868, %9867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9869) : (i64) -> ()
      %9870 = func.call @stack_pop_pointer() : () -> i64
      %9871 = func.call @stack_pop_pointer() : () -> i64
      %9872 = func.call @cc_cons(%9871, %9870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9872) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9873 = func.call @stack_pop_pointer() : () -> i64
      %9874 = func.call @stack_pop_pointer() : () -> i64
      %9875 = func.call @cc_cons(%9874, %9873) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9875) : (i64) -> ()
      %9876 = func.call @stack_pop_pointer() : () -> i64
      %9877 = func.call @stack_pop_pointer() : () -> i64
      %9878 = func.call @cc_cons(%9877, %9876) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9878) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9879 = func.call @stack_pop_pointer() : () -> i64
      %9880 = func.call @stack_pop_pointer() : () -> i64
      %9881 = func.call @cc_cons(%9880, %9879) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9881) : (i64) -> ()
      %9882 = func.call @stack_pop_pointer() : () -> i64
      %9883 = func.call @stack_pop_pointer() : () -> i64
      %9884 = func.call @cc_cons(%9883, %9882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9884) : (i64) -> ()
      %9885 = func.call @stack_pop_pointer() : () -> i64
      %9886 = func.call @stack_pop_pointer() : () -> i64
      %9887 = func.call @cc_cons(%9886, %9885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9887) : (i64) -> ()
      %9888 = func.call @stack_pop_pointer() : () -> i64
      %9889 = func.call @stack_pop_pointer() : () -> i64
      %9890 = func.call @cc_cons(%9889, %9888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9890) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9891 = func.call @stack_pop_pointer() : () -> i64
      %9892 = func.call @stack_pop_pointer() : () -> i64
      %9893 = func.call @cc_cons(%9892, %9891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9893) : (i64) -> ()
      %9894 = func.call @stack_pop_pointer() : () -> i64
      %9895 = func.call @stack_pop_pointer() : () -> i64
      %9896 = func.call @cc_cons(%9895, %9894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9896) : (i64) -> ()
      %9897 = func.call @stack_pop_pointer() : () -> i64
      %9898 = func.call @stack_pop_pointer() : () -> i64
      %9899 = func.call @cc_cons(%9898, %9897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9899) : (i64) -> ()
      %9900 = llvm.mlir.addressof @str845 : !llvm.ptr
      %9901 = arith.constant 5 : i64
      %9902 = func.call @cc_make_string(%9900, %9901) : (!llvm.ptr, i64) -> i64
      %9903 = func.call @cc_nil_value() : () -> i64
      %9904 = func.call @cc_intern(%9902, %9903) : (i64, i64) -> i64
      %9905 = func.call @cc_nil_value() : () -> i64
      %9906 = func.call @cc_cons(%9904, %9905) : (i64, i64) -> i64
      %9907 = func.call @cc_values_pack(%9906) : (i64) -> i64
      func.call @stack_push_pointer(%9904) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9908 = func.call @stack_pop_pointer() : () -> i64
      %9909 = func.call @stack_pop_pointer() : () -> i64
      %9910 = func.call @cc_cons(%9909, %9908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9910) : (i64) -> ()
      %9911 = func.call @stack_pop_pointer() : () -> i64
      %9912 = func.call @stack_pop_pointer() : () -> i64
      %9913 = func.call @cc_cons(%9912, %9911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9913) : (i64) -> ()
      %9914 = func.call @stack_pop_pointer() : () -> i64
      %9915 = func.call @stack_pop_pointer() : () -> i64
      %9916 = func.call @cc_cons(%9915, %9914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9916) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9917 = func.call @stack_pop_pointer() : () -> i64
      %9918 = func.call @stack_pop_pointer() : () -> i64
      %9919 = func.call @cc_cons(%9918, %9917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9919) : (i64) -> ()
      %9920 = func.call @stack_pop_pointer() : () -> i64
      %9921 = func.call @stack_pop_pointer() : () -> i64
      %9922 = func.call @cc_cons(%9921, %9920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9922) : (i64) -> ()
      %9923 = func.call @stack_pop_pointer() : () -> i64
      %9924 = func.call @stack_pop_pointer() : () -> i64
      %9925 = func.call @cc_cons(%9924, %9923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9925) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9926 = func.call @stack_pop_pointer() : () -> i64
      %9927 = func.call @stack_pop_pointer() : () -> i64
      %9928 = func.call @cc_cons(%9927, %9926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9928) : (i64) -> ()
      %9929 = func.call @stack_pop_pointer() : () -> i64
      %9930 = func.call @stack_pop_pointer() : () -> i64
      %9931 = func.call @cc_cons(%9930, %9929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9931) : (i64) -> ()
      %9932 = func.call @stack_pop_pointer() : () -> i64
      %9933 = func.call @stack_pop_pointer() : () -> i64
      %9934 = func.call @cc_cons(%9933, %9932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9934) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9935 = func.call @stack_pop_pointer() : () -> i64
      %9936 = func.call @stack_pop_pointer() : () -> i64
      %9937 = func.call @cc_cons(%9936, %9935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9937) : (i64) -> ()
      %9938 = func.call @stack_pop_pointer() : () -> i64
      %9939 = func.call @stack_pop_pointer() : () -> i64
      %9940 = func.call @cc_cons(%9939, %9938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9940) : (i64) -> ()
      %9941 = func.call @stack_pop_pointer() : () -> i64
      %9942 = func.call @stack_pop_pointer() : () -> i64
      %9943 = func.call @cc_cons(%9942, %9941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9943) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9944 = func.call @stack_pop_pointer() : () -> i64
      %9945 = func.call @stack_pop_pointer() : () -> i64
      %9946 = func.call @cc_cons(%9945, %9944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9946) : (i64) -> ()
      %9947 = func.call @stack_pop_pointer() : () -> i64
      %9948 = func.call @stack_pop_pointer() : () -> i64
      %9949 = func.call @cc_cons(%9948, %9947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9949) : (i64) -> ()
      %9950 = func.call @stack_pop_pointer() : () -> i64
      %9951 = func.call @stack_pop_pointer() : () -> i64
      %9952 = func.call @cc_cons(%9951, %9950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9953 = func.call @stack_pop_pointer() : () -> i64
      %9954 = func.call @stack_pop_pointer() : () -> i64
      %9955 = func.call @cc_cons(%9954, %9953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9955) : (i64) -> ()
      %9956 = func.call @stack_pop_pointer() : () -> i64
      %9957 = func.call @stack_pop_pointer() : () -> i64
      %9958 = func.call @cc_cons(%9957, %9956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9958) : (i64) -> ()
      %9959 = func.call @stack_pop_pointer() : () -> i64
      %9960 = func.call @stack_pop_pointer() : () -> i64
      %9961 = func.call @cc_cons(%9960, %9959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9962 = func.call @stack_pop_pointer() : () -> i64
      %9963 = func.call @stack_pop_pointer() : () -> i64
      %9964 = func.call @cc_cons(%9963, %9962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9964) : (i64) -> ()
      %9965 = func.call @stack_pop_pointer() : () -> i64
      %9966 = func.call @stack_pop_pointer() : () -> i64
      %9967 = func.call @cc_cons(%9966, %9965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9968 = func.call @stack_pop_pointer() : () -> i64
      %9969 = func.call @stack_pop_pointer() : () -> i64
      %9970 = func.call @cc_cons(%9969, %9968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9970) : (i64) -> ()
      %9971 = func.call @stack_pop_pointer() : () -> i64
      %9972 = func.call @stack_pop_pointer() : () -> i64
      %9973 = func.call @cc_cons(%9972, %9971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9973) : (i64) -> ()
      %9974 = func.call @stack_pop_pointer() : () -> i64
      %10196 = llvm.mlir.addressof @str860 : !llvm.ptr
      %10197 = arith.constant 33 : i64
      %10198 = func.call @cc_make_symbol(%10196, %10197) : (!llvm.ptr, i64) -> i64
      %10199 = func.call @cc_persistent_root_value(%10198) : (i64) -> i64
      func.call @stack_push_pointer(%10199) : (i64) -> ()
      %10200 = arith.constant 97047688511572 : i64
      %10201 = arith.constant 1 : i64
      %10202 = func.call @cc_make_closure(%10200, %10201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10202) : (i64) -> ()
      %10203 = func.call @stack_pop_pointer() : () -> i64
      %10204 = llvm.mlir.addressof @str861 : !llvm.ptr
      %10205 = arith.constant 1 : i64
      %10206 = func.call @cc_make_string(%10204, %10205) : (!llvm.ptr, i64) -> i64
      %10207 = func.call @cc_nil_value() : () -> i64
      %10208 = func.call @cc_intern(%10206, %10207) : (i64, i64) -> i64
      %10209 = func.call @cc_nil_value() : () -> i64
      %10210 = func.call @cc_cons(%10208, %10209) : (i64, i64) -> i64
      %10211 = func.call @cc_values_pack(%10210) : (i64) -> i64
      func.call @stack_push_pointer(%10208) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10212 = func.call @stack_pop_pointer() : () -> i64
      %10213 = func.call @stack_pop_pointer() : () -> i64
      %10214 = func.call @cc_cons(%10213, %10212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10214) : (i64) -> ()
      %10215 = func.call @stack_pop_pointer() : () -> i64
      %10216 = llvm.mlir.addressof @str862 : !llvm.ptr
      %10217 = arith.constant 11 : i64
      %10218 = func.call @cc_make_string(%10216, %10217) : (!llvm.ptr, i64) -> i64
      %10219 = llvm.mlir.addressof @str863 : !llvm.ptr
      %10220 = arith.constant 7 : i64
      %10221 = func.call @cc_make_string(%10219, %10220) : (!llvm.ptr, i64) -> i64
      %10222 = func.call @cc_intern(%10218, %10221) : (i64, i64) -> i64
      %10223 = func.call @cc_nil_value() : () -> i64
      %10224 = func.call @cc_cons(%10222, %10223) : (i64, i64) -> i64
      %10225 = func.call @cc_values_pack(%10224) : (i64) -> i64
      func.call @stack_push_pointer(%10222) : (i64) -> ()
      %10226 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10227 = func.call @stack_pop_pointer() : () -> i64
      %10228 = llvm.mlir.addressof @str864 : !llvm.ptr
      %10229 = arith.constant 4 : i64
      %10230 = func.call @cc_make_string(%10228, %10229) : (!llvm.ptr, i64) -> i64
      %10231 = llvm.mlir.addressof @str865 : !llvm.ptr
      %10232 = arith.constant 7 : i64
      %10233 = func.call @cc_make_string(%10231, %10232) : (!llvm.ptr, i64) -> i64
      %10234 = func.call @cc_intern(%10230, %10233) : (i64, i64) -> i64
      %10235 = func.call @cc_nil_value() : () -> i64
      %10236 = func.call @cc_cons(%10234, %10235) : (i64, i64) -> i64
      %10237 = func.call @cc_values_pack(%10236) : (i64) -> i64
      func.call @stack_push_pointer(%10234) : (i64) -> ()
      %10238 = func.call @stack_pop_pointer() : () -> i64
      %10239 = llvm.mlir.addressof @str866 : !llvm.ptr
      %10240 = arith.constant 6 : i64
      %10241 = func.call @cc_make_string(%10239, %10240) : (!llvm.ptr, i64) -> i64
      %10242 = func.call @cc_nil_value() : () -> i64
      %10243 = func.call @cc_intern(%10241, %10242) : (i64, i64) -> i64
      %10244 = func.call @cc_nil_value() : () -> i64
      %10245 = func.call @cc_cons(%10243, %10244) : (i64, i64) -> i64
      %10246 = func.call @cc_values_pack(%10245) : (i64) -> i64
      func.call @stack_push_pointer(%10243) : (i64) -> ()
      %10247 = func.call @stack_pop_pointer() : () -> i64
      %10248 = func.call @cc_nil_value() : () -> i64
      %10249 = func.call @cc_errorp(%9658) : (i64) -> i64
      %10250 = arith.cmpi ne, %10249, %10248 : i64
      %10251 = arith.cmpi eq, %10248, %10248 : i64
      %10252 = arith.andi %10250, %10251 : i1
      %10253 = scf.if %10252 -> (i64) {
        scf.yield %9658 : i64
      } else {
        scf.yield %10248 : i64
      }
      %10254 = func.call @cc_errorp(%9974) : (i64) -> i64
      %10255 = arith.cmpi ne, %10254, %10248 : i64
      %10256 = arith.cmpi eq, %10253, %10248 : i64
      %10257 = arith.andi %10255, %10256 : i1
      %10258 = scf.if %10257 -> (i64) {
        scf.yield %9974 : i64
      } else {
        scf.yield %10253 : i64
      }
      %10259 = func.call @cc_errorp(%10203) : (i64) -> i64
      %10260 = arith.cmpi ne, %10259, %10248 : i64
      %10261 = arith.cmpi eq, %10258, %10248 : i64
      %10262 = arith.andi %10260, %10261 : i1
      %10263 = scf.if %10262 -> (i64) {
        scf.yield %10203 : i64
      } else {
        scf.yield %10258 : i64
      }
      %10264 = func.call @cc_errorp(%10215) : (i64) -> i64
      %10265 = arith.cmpi ne, %10264, %10248 : i64
      %10266 = arith.cmpi eq, %10263, %10248 : i64
      %10267 = arith.andi %10265, %10266 : i1
      %10268 = scf.if %10267 -> (i64) {
        scf.yield %10215 : i64
      } else {
        scf.yield %10263 : i64
      }
      %10269 = func.call @cc_errorp(%10226) : (i64) -> i64
      %10270 = arith.cmpi ne, %10269, %10248 : i64
      %10271 = arith.cmpi eq, %10268, %10248 : i64
      %10272 = arith.andi %10270, %10271 : i1
      %10273 = scf.if %10272 -> (i64) {
        scf.yield %10226 : i64
      } else {
        scf.yield %10268 : i64
      }
      %10274 = func.call @cc_errorp(%10227) : (i64) -> i64
      %10275 = arith.cmpi ne, %10274, %10248 : i64
      %10276 = arith.cmpi eq, %10273, %10248 : i64
      %10277 = arith.andi %10275, %10276 : i1
      %10278 = scf.if %10277 -> (i64) {
        scf.yield %10227 : i64
      } else {
        scf.yield %10273 : i64
      }
      %10279 = func.call @cc_errorp(%10238) : (i64) -> i64
      %10280 = arith.cmpi ne, %10279, %10248 : i64
      %10281 = arith.cmpi eq, %10278, %10248 : i64
      %10282 = arith.andi %10280, %10281 : i1
      %10283 = scf.if %10282 -> (i64) {
        scf.yield %10238 : i64
      } else {
        scf.yield %10278 : i64
      }
      %10284 = func.call @cc_errorp(%10247) : (i64) -> i64
      %10285 = arith.cmpi ne, %10284, %10248 : i64
      %10286 = arith.cmpi eq, %10283, %10248 : i64
      %10287 = arith.andi %10285, %10286 : i1
      %10288 = scf.if %10287 -> (i64) {
        scf.yield %10247 : i64
      } else {
        scf.yield %10283 : i64
      }
      %10289 = arith.cmpi ne, %10288, %10248 : i64
      scf.if %10289 {
        func.call @stack_push_pointer(%10288) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9658) : (i64) -> ()
        func.call @stack_push_pointer(%9974) : (i64) -> ()
        func.call @stack_push_pointer(%10203) : (i64) -> ()
        func.call @stack_push_pointer(%10215) : (i64) -> ()
        func.call @stack_push_pointer(%10226) : (i64) -> ()
        func.call @stack_push_pointer(%10227) : (i64) -> ()
        func.call @stack_push_pointer(%10238) : (i64) -> ()
        func.call @stack_push_pointer(%10247) : (i64) -> ()
        %10290 = llvm.mlir.addressof @str867 : !llvm.ptr
        %10291 = func.call @cc_make_function_ref_const(%10290) : (!llvm.ptr) -> i64
        %10292 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10291, %10292) : (i64, i64) -> ()
      }
      %10293 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10293 : i64
    }
    %10294 = func.call @cc_nil_value() : () -> i64
    %10295 = func.call @cc_errorp(%9649) : (i64) -> i64
    %10296 = arith.cmpi ne, %10295, %10294 : i64
    %10297 = scf.if %10296 -> (i64) {
      scf.yield %9649 : i64
    } else {
      %10298 = llvm.mlir.addressof @str868 : !llvm.ptr
      %10299 = arith.constant 17 : i64
      %10300 = func.call @cc_make_string(%10298, %10299) : (!llvm.ptr, i64) -> i64
      %10301 = func.call @cc_nil_value() : () -> i64
      %10302 = func.call @cc_intern(%10300, %10301) : (i64, i64) -> i64
      %10303 = func.call @cc_nil_value() : () -> i64
      %10304 = func.call @cc_cons(%10302, %10303) : (i64, i64) -> i64
      %10305 = func.call @cc_values_pack(%10304) : (i64) -> i64
      func.call @stack_push_pointer(%10302) : (i64) -> ()
      %10306 = func.call @stack_pop_pointer() : () -> i64
      %10307 = llvm.mlir.addressof @str869 : !llvm.ptr
      %10308 = arith.constant 11 : i64
      %10309 = func.call @cc_make_string(%10307, %10308) : (!llvm.ptr, i64) -> i64
      %10310 = llvm.mlir.addressof @str870 : !llvm.ptr
      %10311 = arith.constant 11 : i64
      %10312 = func.call @cc_make_string(%10310, %10311) : (!llvm.ptr, i64) -> i64
      %10313 = func.call @cc_intern(%10309, %10312) : (i64, i64) -> i64
      %10314 = func.call @cc_nil_value() : () -> i64
      %10315 = func.call @cc_cons(%10313, %10314) : (i64, i64) -> i64
      %10316 = func.call @cc_values_pack(%10315) : (i64) -> i64
      func.call @stack_push_pointer(%10313) : (i64) -> ()
      %10317 = llvm.mlir.addressof @str871 : !llvm.ptr
      %10318 = arith.constant 3 : i64
      %10319 = func.call @cc_make_string(%10317, %10318) : (!llvm.ptr, i64) -> i64
      %10320 = llvm.mlir.addressof @str872 : !llvm.ptr
      %10321 = arith.constant 11 : i64
      %10322 = func.call @cc_make_string(%10320, %10321) : (!llvm.ptr, i64) -> i64
      %10323 = func.call @cc_intern(%10319, %10322) : (i64, i64) -> i64
      %10324 = func.call @cc_nil_value() : () -> i64
      %10325 = func.call @cc_cons(%10323, %10324) : (i64, i64) -> i64
      %10326 = func.call @cc_values_pack(%10325) : (i64) -> i64
      func.call @stack_push_pointer(%10323) : (i64) -> ()
      %10327 = llvm.mlir.addressof @str873 : !llvm.ptr
      %10328 = arith.constant 19 : i64
      %10329 = func.call @cc_make_string(%10327, %10328) : (!llvm.ptr, i64) -> i64
      %10330 = llvm.mlir.addressof @str874 : !llvm.ptr
      %10331 = arith.constant 11 : i64
      %10332 = func.call @cc_make_string(%10330, %10331) : (!llvm.ptr, i64) -> i64
      %10333 = func.call @cc_intern(%10329, %10332) : (i64, i64) -> i64
      %10334 = func.call @cc_nil_value() : () -> i64
      %10335 = func.call @cc_cons(%10333, %10334) : (i64, i64) -> i64
      %10336 = func.call @cc_values_pack(%10335) : (i64) -> i64
      func.call @stack_push_pointer(%10333) : (i64) -> ()
      %10337 = llvm.mlir.addressof @str875 : !llvm.ptr
      %10338 = arith.constant 7 : i64
      %10339 = func.call @cc_make_string(%10337, %10338) : (!llvm.ptr, i64) -> i64
      %10340 = llvm.mlir.addressof @str876 : !llvm.ptr
      %10341 = arith.constant 11 : i64
      %10342 = func.call @cc_make_string(%10340, %10341) : (!llvm.ptr, i64) -> i64
      %10343 = func.call @cc_intern(%10339, %10342) : (i64, i64) -> i64
      %10344 = func.call @cc_nil_value() : () -> i64
      %10345 = func.call @cc_cons(%10343, %10344) : (i64, i64) -> i64
      %10346 = func.call @cc_values_pack(%10345) : (i64) -> i64
      func.call @stack_push_pointer(%10343) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10347 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%10347) : (i64) -> ()
      %10348 = llvm.mlir.addressof @str877 : !llvm.ptr
      %10349 = arith.constant 6 : i64
      %10350 = func.call @cc_make_string(%10348, %10349) : (!llvm.ptr, i64) -> i64
      %10351 = llvm.mlir.addressof @str878 : !llvm.ptr
      %10352 = arith.constant 11 : i64
      %10353 = func.call @cc_make_string(%10351, %10352) : (!llvm.ptr, i64) -> i64
      %10354 = func.call @cc_intern(%10350, %10353) : (i64, i64) -> i64
      %10355 = func.call @cc_nil_value() : () -> i64
      %10356 = func.call @cc_cons(%10354, %10355) : (i64, i64) -> i64
      %10357 = func.call @cc_values_pack(%10356) : (i64) -> i64
      func.call @stack_push_pointer(%10354) : (i64) -> ()
      %10358 = llvm.mlir.addressof @str879 : !llvm.ptr
      %10359 = arith.constant 1 : i64
      %10360 = func.call @cc_make_string(%10358, %10359) : (!llvm.ptr, i64) -> i64
      %10361 = func.call @cc_nil_value() : () -> i64
      %10362 = func.call @cc_intern(%10360, %10361) : (i64, i64) -> i64
      %10363 = func.call @cc_nil_value() : () -> i64
      %10364 = func.call @cc_cons(%10362, %10363) : (i64, i64) -> i64
      %10365 = func.call @cc_values_pack(%10364) : (i64) -> i64
      func.call @stack_push_pointer(%10362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10366 = func.call @stack_pop_pointer() : () -> i64
      %10367 = func.call @stack_pop_pointer() : () -> i64
      %10368 = func.call @cc_cons(%10367, %10366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10368) : (i64) -> ()
      %10369 = llvm.mlir.addressof @str880 : !llvm.ptr
      %10370 = arith.constant 13 : i64
      %10371 = func.call @cc_make_string(%10369, %10370) : (!llvm.ptr, i64) -> i64
      %10372 = llvm.mlir.addressof @str881 : !llvm.ptr
      %10373 = arith.constant 11 : i64
      %10374 = func.call @cc_make_string(%10372, %10373) : (!llvm.ptr, i64) -> i64
      %10375 = func.call @cc_intern(%10371, %10374) : (i64, i64) -> i64
      %10376 = func.call @cc_nil_value() : () -> i64
      %10377 = func.call @cc_cons(%10375, %10376) : (i64, i64) -> i64
      %10378 = func.call @cc_values_pack(%10377) : (i64) -> i64
      func.call @stack_push_pointer(%10375) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10379 = func.call @stack_pop_pointer() : () -> i64
      %10380 = func.call @stack_pop_pointer() : () -> i64
      %10381 = func.call @cc_cons(%10380, %10379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10381) : (i64) -> ()
      %10382 = llvm.mlir.addressof @str882 : !llvm.ptr
      %10383 = arith.constant 14 : i64
      %10384 = func.call @cc_make_string(%10382, %10383) : (!llvm.ptr, i64) -> i64
      %10385 = llvm.mlir.addressof @str883 : !llvm.ptr
      %10386 = arith.constant 11 : i64
      %10387 = func.call @cc_make_string(%10385, %10386) : (!llvm.ptr, i64) -> i64
      %10388 = func.call @cc_intern(%10384, %10387) : (i64, i64) -> i64
      %10389 = func.call @cc_nil_value() : () -> i64
      %10390 = func.call @cc_cons(%10388, %10389) : (i64, i64) -> i64
      %10391 = func.call @cc_values_pack(%10390) : (i64) -> i64
      func.call @stack_push_pointer(%10388) : (i64) -> ()
      %10392 = llvm.mlir.addressof @str884 : !llvm.ptr
      %10393 = arith.constant 7 : i64
      %10394 = func.call @cc_make_string(%10392, %10393) : (!llvm.ptr, i64) -> i64
      %10395 = llvm.mlir.addressof @str885 : !llvm.ptr
      %10396 = arith.constant 11 : i64
      %10397 = func.call @cc_make_string(%10395, %10396) : (!llvm.ptr, i64) -> i64
      %10398 = func.call @cc_intern(%10394, %10397) : (i64, i64) -> i64
      %10399 = func.call @cc_nil_value() : () -> i64
      %10400 = func.call @cc_cons(%10398, %10399) : (i64, i64) -> i64
      %10401 = func.call @cc_values_pack(%10400) : (i64) -> i64
      func.call @stack_push_pointer(%10398) : (i64) -> ()
      %10402 = llvm.mlir.addressof @str886 : !llvm.ptr
      %10403 = arith.constant 1 : i64
      %10404 = func.call @cc_make_string(%10402, %10403) : (!llvm.ptr, i64) -> i64
      %10405 = func.call @cc_nil_value() : () -> i64
      %10406 = func.call @cc_intern(%10404, %10405) : (i64, i64) -> i64
      %10407 = func.call @cc_nil_value() : () -> i64
      %10408 = func.call @cc_cons(%10406, %10407) : (i64, i64) -> i64
      %10409 = func.call @cc_values_pack(%10408) : (i64) -> i64
      func.call @stack_push_pointer(%10406) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10410 = func.call @stack_pop_pointer() : () -> i64
      %10411 = func.call @stack_pop_pointer() : () -> i64
      %10412 = func.call @cc_cons(%10411, %10410) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10412) : (i64) -> ()
      %10413 = func.call @stack_pop_pointer() : () -> i64
      %10414 = func.call @stack_pop_pointer() : () -> i64
      %10415 = func.call @cc_cons(%10414, %10413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10415) : (i64) -> ()
      %10416 = llvm.mlir.addressof @str887 : !llvm.ptr
      %10417 = arith.constant 15 : i64
      %10418 = func.call @cc_make_string(%10416, %10417) : (!llvm.ptr, i64) -> i64
      %10419 = llvm.mlir.addressof @str888 : !llvm.ptr
      %10420 = arith.constant 11 : i64
      %10421 = func.call @cc_make_string(%10419, %10420) : (!llvm.ptr, i64) -> i64
      %10422 = func.call @cc_intern(%10418, %10421) : (i64, i64) -> i64
      %10423 = func.call @cc_nil_value() : () -> i64
      %10424 = func.call @cc_cons(%10422, %10423) : (i64, i64) -> i64
      %10425 = func.call @cc_values_pack(%10424) : (i64) -> i64
      func.call @stack_push_pointer(%10422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10426 = func.call @stack_pop_pointer() : () -> i64
      %10427 = func.call @stack_pop_pointer() : () -> i64
      %10428 = func.call @cc_cons(%10427, %10426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10429 = func.call @stack_pop_pointer() : () -> i64
      %10430 = func.call @stack_pop_pointer() : () -> i64
      %10431 = func.call @cc_cons(%10430, %10429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10431) : (i64) -> ()
      %10432 = func.call @stack_pop_pointer() : () -> i64
      %10433 = func.call @stack_pop_pointer() : () -> i64
      %10434 = func.call @cc_cons(%10433, %10432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10434) : (i64) -> ()
      %10435 = func.call @stack_pop_pointer() : () -> i64
      %10436 = func.call @stack_pop_pointer() : () -> i64
      %10437 = func.call @cc_cons(%10436, %10435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10437) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10438 = func.call @stack_pop_pointer() : () -> i64
      %10439 = func.call @stack_pop_pointer() : () -> i64
      %10440 = func.call @cc_cons(%10439, %10438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10440) : (i64) -> ()
      %10441 = func.call @stack_pop_pointer() : () -> i64
      %10442 = func.call @stack_pop_pointer() : () -> i64
      %10443 = func.call @cc_cons(%10442, %10441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10443) : (i64) -> ()
      %10444 = func.call @stack_pop_pointer() : () -> i64
      %10445 = func.call @stack_pop_pointer() : () -> i64
      %10446 = func.call @cc_cons(%10445, %10444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10446) : (i64) -> ()
      %10447 = func.call @stack_pop_pointer() : () -> i64
      %10448 = func.call @stack_pop_pointer() : () -> i64
      %10449 = func.call @cc_cons(%10448, %10447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10449) : (i64) -> ()
      %10450 = func.call @stack_pop_pointer() : () -> i64
      %10451 = func.call @stack_pop_pointer() : () -> i64
      %10452 = func.call @cc_cons(%10450, %10451) : (i64, i64) -> i64
      %10453 = llvm.mlir.addressof @str889 : !llvm.ptr
      %10454 = arith.constant 5 : i64
      %10455 = func.call @cc_make_string(%10453, %10454) : (!llvm.ptr, i64) -> i64
      %10456 = func.call @cc_nil_value() : () -> i64
      %10457 = func.call @cc_intern(%10455, %10456) : (i64, i64) -> i64
      %10458 = func.call @cc_nil_value() : () -> i64
      %10459 = func.call @cc_cons(%10457, %10458) : (i64, i64) -> i64
      %10460 = func.call @cc_values_pack(%10459) : (i64) -> i64
      %10461 = func.call @cc_cons(%10457, %10452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10461) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10462 = func.call @stack_pop_pointer() : () -> i64
      %10463 = func.call @stack_pop_pointer() : () -> i64
      %10464 = func.call @cc_cons(%10463, %10462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10464) : (i64) -> ()
      %10465 = func.call @stack_pop_pointer() : () -> i64
      %10466 = func.call @stack_pop_pointer() : () -> i64
      %10467 = func.call @cc_cons(%10466, %10465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10467) : (i64) -> ()
      %10468 = func.call @stack_pop_pointer() : () -> i64
      %10469 = func.call @stack_pop_pointer() : () -> i64
      %10470 = func.call @cc_cons(%10469, %10468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10471 = func.call @stack_pop_pointer() : () -> i64
      %10472 = func.call @stack_pop_pointer() : () -> i64
      %10473 = func.call @cc_cons(%10472, %10471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10473) : (i64) -> ()
      %10474 = func.call @stack_pop_pointer() : () -> i64
      %10475 = func.call @stack_pop_pointer() : () -> i64
      %10476 = func.call @cc_cons(%10475, %10474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10476) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10477 = func.call @stack_pop_pointer() : () -> i64
      %10478 = func.call @stack_pop_pointer() : () -> i64
      %10479 = func.call @cc_cons(%10478, %10477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10479) : (i64) -> ()
      %10480 = func.call @stack_pop_pointer() : () -> i64
      %10481 = func.call @stack_pop_pointer() : () -> i64
      %10482 = func.call @cc_cons(%10481, %10480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10483 = func.call @stack_pop_pointer() : () -> i64
      %10484 = func.call @stack_pop_pointer() : () -> i64
      %10485 = func.call @cc_cons(%10484, %10483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10485) : (i64) -> ()
      %10486 = func.call @stack_pop_pointer() : () -> i64
      %10487 = func.call @stack_pop_pointer() : () -> i64
      %10488 = func.call @cc_cons(%10487, %10486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10488) : (i64) -> ()
      %10489 = func.call @stack_pop_pointer() : () -> i64
      %10545 = arith.constant 97047688511578 : i64
      %10546 = arith.constant 0 : i64
      %10547 = func.call @cc_make_closure(%10545, %10546) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10547) : (i64) -> ()
      %10548 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10549 = func.call @stack_pop_pointer() : () -> i64
      %10550 = func.call @stack_pop_pointer() : () -> i64
      %10551 = func.call @cc_cons(%10550, %10549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10551) : (i64) -> ()
      %10552 = func.call @stack_pop_pointer() : () -> i64
      %10553 = func.call @stack_pop_pointer() : () -> i64
      %10554 = func.call @cc_cons(%10553, %10552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10554) : (i64) -> ()
      %10555 = func.call @stack_pop_pointer() : () -> i64
      %10556 = llvm.mlir.addressof @str892 : !llvm.ptr
      %10557 = arith.constant 11 : i64
      %10558 = func.call @cc_make_string(%10556, %10557) : (!llvm.ptr, i64) -> i64
      %10559 = llvm.mlir.addressof @str893 : !llvm.ptr
      %10560 = arith.constant 7 : i64
      %10561 = func.call @cc_make_string(%10559, %10560) : (!llvm.ptr, i64) -> i64
      %10562 = func.call @cc_intern(%10558, %10561) : (i64, i64) -> i64
      %10563 = func.call @cc_nil_value() : () -> i64
      %10564 = func.call @cc_cons(%10562, %10563) : (i64, i64) -> i64
      %10565 = func.call @cc_values_pack(%10564) : (i64) -> i64
      func.call @stack_push_pointer(%10562) : (i64) -> ()
      %10566 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10567 = func.call @stack_pop_pointer() : () -> i64
      %10568 = llvm.mlir.addressof @str894 : !llvm.ptr
      %10569 = arith.constant 4 : i64
      %10570 = func.call @cc_make_string(%10568, %10569) : (!llvm.ptr, i64) -> i64
      %10571 = llvm.mlir.addressof @str895 : !llvm.ptr
      %10572 = arith.constant 7 : i64
      %10573 = func.call @cc_make_string(%10571, %10572) : (!llvm.ptr, i64) -> i64
      %10574 = func.call @cc_intern(%10570, %10573) : (i64, i64) -> i64
      %10575 = func.call @cc_nil_value() : () -> i64
      %10576 = func.call @cc_cons(%10574, %10575) : (i64, i64) -> i64
      %10577 = func.call @cc_values_pack(%10576) : (i64) -> i64
      func.call @stack_push_pointer(%10574) : (i64) -> ()
      %10578 = func.call @stack_pop_pointer() : () -> i64
      %10579 = llvm.mlir.addressof @str896 : !llvm.ptr
      %10580 = arith.constant 6 : i64
      %10581 = func.call @cc_make_string(%10579, %10580) : (!llvm.ptr, i64) -> i64
      %10582 = func.call @cc_nil_value() : () -> i64
      %10583 = func.call @cc_intern(%10581, %10582) : (i64, i64) -> i64
      %10584 = func.call @cc_nil_value() : () -> i64
      %10585 = func.call @cc_cons(%10583, %10584) : (i64, i64) -> i64
      %10586 = func.call @cc_values_pack(%10585) : (i64) -> i64
      func.call @stack_push_pointer(%10583) : (i64) -> ()
      %10587 = func.call @stack_pop_pointer() : () -> i64
      %10588 = func.call @cc_nil_value() : () -> i64
      %10589 = func.call @cc_errorp(%10306) : (i64) -> i64
      %10590 = arith.cmpi ne, %10589, %10588 : i64
      %10591 = arith.cmpi eq, %10588, %10588 : i64
      %10592 = arith.andi %10590, %10591 : i1
      %10593 = scf.if %10592 -> (i64) {
        scf.yield %10306 : i64
      } else {
        scf.yield %10588 : i64
      }
      %10594 = func.call @cc_errorp(%10489) : (i64) -> i64
      %10595 = arith.cmpi ne, %10594, %10588 : i64
      %10596 = arith.cmpi eq, %10593, %10588 : i64
      %10597 = arith.andi %10595, %10596 : i1
      %10598 = scf.if %10597 -> (i64) {
        scf.yield %10489 : i64
      } else {
        scf.yield %10593 : i64
      }
      %10599 = func.call @cc_errorp(%10548) : (i64) -> i64
      %10600 = arith.cmpi ne, %10599, %10588 : i64
      %10601 = arith.cmpi eq, %10598, %10588 : i64
      %10602 = arith.andi %10600, %10601 : i1
      %10603 = scf.if %10602 -> (i64) {
        scf.yield %10548 : i64
      } else {
        scf.yield %10598 : i64
      }
      %10604 = func.call @cc_errorp(%10555) : (i64) -> i64
      %10605 = arith.cmpi ne, %10604, %10588 : i64
      %10606 = arith.cmpi eq, %10603, %10588 : i64
      %10607 = arith.andi %10605, %10606 : i1
      %10608 = scf.if %10607 -> (i64) {
        scf.yield %10555 : i64
      } else {
        scf.yield %10603 : i64
      }
      %10609 = func.call @cc_errorp(%10566) : (i64) -> i64
      %10610 = arith.cmpi ne, %10609, %10588 : i64
      %10611 = arith.cmpi eq, %10608, %10588 : i64
      %10612 = arith.andi %10610, %10611 : i1
      %10613 = scf.if %10612 -> (i64) {
        scf.yield %10566 : i64
      } else {
        scf.yield %10608 : i64
      }
      %10614 = func.call @cc_errorp(%10567) : (i64) -> i64
      %10615 = arith.cmpi ne, %10614, %10588 : i64
      %10616 = arith.cmpi eq, %10613, %10588 : i64
      %10617 = arith.andi %10615, %10616 : i1
      %10618 = scf.if %10617 -> (i64) {
        scf.yield %10567 : i64
      } else {
        scf.yield %10613 : i64
      }
      %10619 = func.call @cc_errorp(%10578) : (i64) -> i64
      %10620 = arith.cmpi ne, %10619, %10588 : i64
      %10621 = arith.cmpi eq, %10618, %10588 : i64
      %10622 = arith.andi %10620, %10621 : i1
      %10623 = scf.if %10622 -> (i64) {
        scf.yield %10578 : i64
      } else {
        scf.yield %10618 : i64
      }
      %10624 = func.call @cc_errorp(%10587) : (i64) -> i64
      %10625 = arith.cmpi ne, %10624, %10588 : i64
      %10626 = arith.cmpi eq, %10623, %10588 : i64
      %10627 = arith.andi %10625, %10626 : i1
      %10628 = scf.if %10627 -> (i64) {
        scf.yield %10587 : i64
      } else {
        scf.yield %10623 : i64
      }
      %10629 = arith.cmpi ne, %10628, %10588 : i64
      scf.if %10629 {
        func.call @stack_push_pointer(%10628) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10306) : (i64) -> ()
        func.call @stack_push_pointer(%10489) : (i64) -> ()
        func.call @stack_push_pointer(%10548) : (i64) -> ()
        func.call @stack_push_pointer(%10555) : (i64) -> ()
        func.call @stack_push_pointer(%10566) : (i64) -> ()
        func.call @stack_push_pointer(%10567) : (i64) -> ()
        func.call @stack_push_pointer(%10578) : (i64) -> ()
        func.call @stack_push_pointer(%10587) : (i64) -> ()
        %10630 = llvm.mlir.addressof @str897 : !llvm.ptr
        %10631 = func.call @cc_make_function_ref_const(%10630) : (!llvm.ptr) -> i64
        %10632 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10631, %10632) : (i64, i64) -> ()
      }
      %10633 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10633 : i64
    }
    %10634 = func.call @cc_nil_value() : () -> i64
    %10635 = func.call @cc_errorp(%10297) : (i64) -> i64
    %10636 = arith.cmpi ne, %10635, %10634 : i64
    %10637 = scf.if %10636 -> (i64) {
      scf.yield %10297 : i64
    } else {
      %10638 = llvm.mlir.addressof @str898 : !llvm.ptr
      %10639 = arith.constant 4 : i64
      %10640 = func.call @cc_make_string(%10638, %10639) : (!llvm.ptr, i64) -> i64
      %10641 = llvm.mlir.addressof @str899 : !llvm.ptr
      %10642 = arith.constant 11 : i64
      %10643 = func.call @cc_make_string(%10641, %10642) : (!llvm.ptr, i64) -> i64
      %10644 = func.call @cc_intern(%10640, %10643) : (i64, i64) -> i64
      %10645 = func.call @cc_nil_value() : () -> i64
      %10646 = func.call @cc_cons(%10644, %10645) : (i64, i64) -> i64
      %10647 = func.call @cc_values_pack(%10646) : (i64) -> i64
      func.call @stack_push_pointer(%10644) : (i64) -> ()
      %10648 = func.call @stack_pop_pointer() : () -> i64
      %10649 = llvm.mlir.addressof @str900 : !llvm.ptr
      %10650 = arith.constant 3 : i64
      %10651 = func.call @cc_make_string(%10649, %10650) : (!llvm.ptr, i64) -> i64
      %10652 = func.call @cc_nil_value() : () -> i64
      %10653 = func.call @cc_intern(%10651, %10652) : (i64, i64) -> i64
      %10654 = func.call @cc_nil_value() : () -> i64
      %10655 = func.call @cc_cons(%10653, %10654) : (i64, i64) -> i64
      %10656 = func.call @cc_values_pack(%10655) : (i64) -> i64
      func.call @stack_push_pointer(%10653) : (i64) -> ()
      %10657 = llvm.mlir.addressof @str901 : !llvm.ptr
      %10658 = arith.constant 3 : i64
      %10659 = func.call @cc_make_string(%10657, %10658) : (!llvm.ptr, i64) -> i64
      %10660 = func.call @cc_nil_value() : () -> i64
      %10661 = func.call @cc_intern(%10659, %10660) : (i64, i64) -> i64
      %10662 = func.call @cc_nil_value() : () -> i64
      %10663 = func.call @cc_cons(%10661, %10662) : (i64, i64) -> i64
      %10664 = func.call @cc_values_pack(%10663) : (i64) -> i64
      func.call @stack_push_pointer(%10661) : (i64) -> ()
      %10665 = llvm.mlir.addressof @str902 : !llvm.ptr
      %10666 = arith.constant 5 : i64
      %10667 = func.call @cc_make_string(%10665, %10666) : (!llvm.ptr, i64) -> i64
      %10668 = func.call @cc_nil_value() : () -> i64
      %10669 = func.call @cc_intern(%10667, %10668) : (i64, i64) -> i64
      %10670 = func.call @cc_nil_value() : () -> i64
      %10671 = func.call @cc_cons(%10669, %10670) : (i64, i64) -> i64
      %10672 = func.call @cc_values_pack(%10671) : (i64) -> i64
      func.call @stack_push_pointer(%10669) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10673 = llvm.mlir.addressof @str903 : !llvm.ptr
      %10674 = arith.constant 3 : i64
      %10675 = func.call @cc_make_string(%10673, %10674) : (!llvm.ptr, i64) -> i64
      %10676 = func.call @cc_nil_value() : () -> i64
      %10677 = func.call @cc_intern(%10675, %10676) : (i64, i64) -> i64
      %10678 = func.call @cc_nil_value() : () -> i64
      %10679 = func.call @cc_cons(%10677, %10678) : (i64, i64) -> i64
      %10680 = func.call @cc_values_pack(%10679) : (i64) -> i64
      func.call @stack_push_pointer(%10677) : (i64) -> ()
      %10681 = llvm.mlir.addressof @str904 : !llvm.ptr
      %10682 = arith.constant 22 : i64
      %10683 = func.call @cc_make_string(%10681, %10682) : (!llvm.ptr, i64) -> i64
      %10684 = llvm.mlir.addressof @str905 : !llvm.ptr
      %10685 = arith.constant 3 : i64
      %10686 = func.call @cc_make_string(%10684, %10685) : (!llvm.ptr, i64) -> i64
      %10687 = func.call @cc_intern(%10683, %10686) : (i64, i64) -> i64
      %10688 = func.call @cc_nil_value() : () -> i64
      %10689 = func.call @cc_cons(%10687, %10688) : (i64, i64) -> i64
      %10690 = func.call @cc_values_pack(%10689) : (i64) -> i64
      func.call @stack_push_pointer(%10687) : (i64) -> ()
      %10691 = llvm.mlir.addressof @str906 : !llvm.ptr
      %10692 = arith.constant 6 : i64
      %10693 = func.call @cc_make_string(%10691, %10692) : (!llvm.ptr, i64) -> i64
      %10694 = func.call @cc_nil_value() : () -> i64
      %10695 = func.call @cc_intern(%10693, %10694) : (i64, i64) -> i64
      %10696 = func.call @cc_nil_value() : () -> i64
      %10697 = func.call @cc_cons(%10695, %10696) : (i64, i64) -> i64
      %10698 = func.call @cc_values_pack(%10697) : (i64) -> i64
      func.call @stack_push_pointer(%10695) : (i64) -> ()
      %10699 = llvm.mlir.addressof @str907 : !llvm.ptr
      %10700 = arith.constant 9 : i64
      %10701 = func.call @cc_make_string(%10699, %10700) : (!llvm.ptr, i64) -> i64
      %10702 = llvm.mlir.addressof @str908 : !llvm.ptr
      %10703 = arith.constant 11 : i64
      %10704 = func.call @cc_make_string(%10702, %10703) : (!llvm.ptr, i64) -> i64
      %10705 = func.call @cc_intern(%10701, %10704) : (i64, i64) -> i64
      %10706 = func.call @cc_nil_value() : () -> i64
      %10707 = func.call @cc_cons(%10705, %10706) : (i64, i64) -> i64
      %10708 = func.call @cc_values_pack(%10707) : (i64) -> i64
      func.call @stack_push_pointer(%10705) : (i64) -> ()
      %10709 = llvm.mlir.addressof @str909 : !llvm.ptr
      %10710 = arith.constant 8 : i64
      %10711 = func.call @cc_make_string(%10709, %10710) : (!llvm.ptr, i64) -> i64
      %10712 = func.call @cc_nil_value() : () -> i64
      %10713 = func.call @cc_intern(%10711, %10712) : (i64, i64) -> i64
      %10714 = func.call @cc_nil_value() : () -> i64
      %10715 = func.call @cc_cons(%10713, %10714) : (i64, i64) -> i64
      %10716 = func.call @cc_values_pack(%10715) : (i64) -> i64
      func.call @stack_push_pointer(%10713) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10717 = func.call @stack_pop_pointer() : () -> i64
      %10718 = func.call @stack_pop_pointer() : () -> i64
      %10719 = func.call @cc_cons(%10718, %10717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10719) : (i64) -> ()
      %10720 = func.call @stack_pop_pointer() : () -> i64
      %10721 = func.call @stack_pop_pointer() : () -> i64
      %10722 = func.call @cc_cons(%10721, %10720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10722) : (i64) -> ()
      %10723 = llvm.mlir.addressof @str910 : !llvm.ptr
      %10724 = arith.constant 7 : i64
      %10725 = func.call @cc_make_string(%10723, %10724) : (!llvm.ptr, i64) -> i64
      %10726 = llvm.mlir.addressof @str911 : !llvm.ptr
      %10727 = arith.constant 11 : i64
      %10728 = func.call @cc_make_string(%10726, %10727) : (!llvm.ptr, i64) -> i64
      %10729 = func.call @cc_intern(%10725, %10728) : (i64, i64) -> i64
      %10730 = func.call @cc_nil_value() : () -> i64
      %10731 = func.call @cc_cons(%10729, %10730) : (i64, i64) -> i64
      %10732 = func.call @cc_values_pack(%10731) : (i64) -> i64
      func.call @stack_push_pointer(%10729) : (i64) -> ()
      %10733 = llvm.mlir.addressof @str912 : !llvm.ptr
      %10734 = arith.constant 6 : i64
      %10735 = func.call @cc_make_string(%10733, %10734) : (!llvm.ptr, i64) -> i64
      %10736 = llvm.mlir.addressof @str913 : !llvm.ptr
      %10737 = arith.constant 11 : i64
      %10738 = func.call @cc_make_string(%10736, %10737) : (!llvm.ptr, i64) -> i64
      %10739 = func.call @cc_intern(%10735, %10738) : (i64, i64) -> i64
      %10740 = func.call @cc_nil_value() : () -> i64
      %10741 = func.call @cc_cons(%10739, %10740) : (i64, i64) -> i64
      %10742 = func.call @cc_values_pack(%10741) : (i64) -> i64
      func.call @stack_push_pointer(%10739) : (i64) -> ()
      %10743 = llvm.mlir.addressof @str914 : !llvm.ptr
      %10744 = arith.constant 8 : i64
      %10745 = func.call @cc_make_string(%10743, %10744) : (!llvm.ptr, i64) -> i64
      %10746 = func.call @cc_nil_value() : () -> i64
      %10747 = func.call @cc_intern(%10745, %10746) : (i64, i64) -> i64
      %10748 = func.call @cc_nil_value() : () -> i64
      %10749 = func.call @cc_cons(%10747, %10748) : (i64, i64) -> i64
      %10750 = func.call @cc_values_pack(%10749) : (i64) -> i64
      func.call @stack_push_pointer(%10747) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10751 = func.call @stack_pop_pointer() : () -> i64
      %10752 = func.call @stack_pop_pointer() : () -> i64
      %10753 = func.call @cc_cons(%10752, %10751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10753) : (i64) -> ()
      %10754 = func.call @stack_pop_pointer() : () -> i64
      %10755 = func.call @stack_pop_pointer() : () -> i64
      %10756 = func.call @cc_cons(%10755, %10754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10756) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10757 = func.call @stack_pop_pointer() : () -> i64
      %10758 = func.call @stack_pop_pointer() : () -> i64
      %10759 = func.call @cc_cons(%10758, %10757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10759) : (i64) -> ()
      %10760 = func.call @stack_pop_pointer() : () -> i64
      %10761 = func.call @stack_pop_pointer() : () -> i64
      %10762 = func.call @cc_cons(%10761, %10760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10762) : (i64) -> ()
      %10763 = llvm.mlir.addressof @str915 : !llvm.ptr
      %10764 = arith.constant 11 : i64
      %10765 = func.call @cc_make_string(%10763, %10764) : (!llvm.ptr, i64) -> i64
      %10766 = func.call @cc_nil_value() : () -> i64
      %10767 = func.call @cc_intern(%10765, %10766) : (i64, i64) -> i64
      %10768 = func.call @cc_nil_value() : () -> i64
      %10769 = func.call @cc_cons(%10767, %10768) : (i64, i64) -> i64
      %10770 = func.call @cc_values_pack(%10769) : (i64) -> i64
      func.call @stack_push_pointer(%10767) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10771 = llvm.mlir.addressof @str916 : !llvm.ptr
      %10772 = arith.constant 5 : i64
      %10773 = func.call @cc_make_string(%10771, %10772) : (!llvm.ptr, i64) -> i64
      %10774 = llvm.mlir.addressof @str917 : !llvm.ptr
      %10775 = arith.constant 11 : i64
      %10776 = func.call @cc_make_string(%10774, %10775) : (!llvm.ptr, i64) -> i64
      %10777 = func.call @cc_intern(%10773, %10776) : (i64, i64) -> i64
      %10778 = func.call @cc_nil_value() : () -> i64
      %10779 = func.call @cc_cons(%10777, %10778) : (i64, i64) -> i64
      %10780 = func.call @cc_values_pack(%10779) : (i64) -> i64
      func.call @stack_push_pointer(%10777) : (i64) -> ()
      %10781 = llvm.mlir.addressof @str918 : !llvm.ptr
      %10782 = arith.constant 9 : i64
      %10783 = func.call @cc_make_string(%10781, %10782) : (!llvm.ptr, i64) -> i64
      %10784 = llvm.mlir.addressof @str919 : !llvm.ptr
      %10785 = arith.constant 11 : i64
      %10786 = func.call @cc_make_string(%10784, %10785) : (!llvm.ptr, i64) -> i64
      %10787 = func.call @cc_intern(%10783, %10786) : (i64, i64) -> i64
      %10788 = func.call @cc_nil_value() : () -> i64
      %10789 = func.call @cc_cons(%10787, %10788) : (i64, i64) -> i64
      %10790 = func.call @cc_values_pack(%10789) : (i64) -> i64
      func.call @stack_push_pointer(%10787) : (i64) -> ()
      %10791 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%10791) : (i64) -> ()
      %10792 = llvm.mlir.addressof @str920 : !llvm.ptr
      %10793 = arith.constant 9 : i64
      %10794 = func.call @cc_make_string(%10792, %10793) : (!llvm.ptr, i64) -> i64
      %10795 = llvm.mlir.addressof @str921 : !llvm.ptr
      %10796 = arith.constant 11 : i64
      %10797 = func.call @cc_make_string(%10795, %10796) : (!llvm.ptr, i64) -> i64
      %10798 = func.call @cc_intern(%10794, %10797) : (i64, i64) -> i64
      %10799 = func.call @cc_nil_value() : () -> i64
      %10800 = func.call @cc_cons(%10798, %10799) : (i64, i64) -> i64
      %10801 = func.call @cc_values_pack(%10800) : (i64) -> i64
      func.call @stack_push_pointer(%10798) : (i64) -> ()
      %10802 = func.call @stack_pop_pointer() : () -> i64
      %10803 = func.call @stack_pop_pointer() : () -> i64
      %10804 = func.call @cc_cons(%10802, %10803) : (i64, i64) -> i64
      %10805 = llvm.mlir.addressof @str922 : !llvm.ptr
      %10806 = arith.constant 5 : i64
      %10807 = func.call @cc_make_string(%10805, %10806) : (!llvm.ptr, i64) -> i64
      %10808 = func.call @cc_nil_value() : () -> i64
      %10809 = func.call @cc_intern(%10807, %10808) : (i64, i64) -> i64
      %10810 = func.call @cc_nil_value() : () -> i64
      %10811 = func.call @cc_cons(%10809, %10810) : (i64, i64) -> i64
      %10812 = func.call @cc_values_pack(%10811) : (i64) -> i64
      %10813 = func.call @cc_cons(%10809, %10804) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10814 = func.call @stack_pop_pointer() : () -> i64
      %10815 = func.call @stack_pop_pointer() : () -> i64
      %10816 = func.call @cc_cons(%10815, %10814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10816) : (i64) -> ()
      %10817 = func.call @stack_pop_pointer() : () -> i64
      %10818 = func.call @stack_pop_pointer() : () -> i64
      %10819 = func.call @cc_cons(%10818, %10817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10819) : (i64) -> ()
      %10820 = func.call @stack_pop_pointer() : () -> i64
      %10821 = func.call @stack_pop_pointer() : () -> i64
      %10822 = func.call @cc_cons(%10821, %10820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10822) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10823 = func.call @stack_pop_pointer() : () -> i64
      %10824 = func.call @stack_pop_pointer() : () -> i64
      %10825 = func.call @cc_cons(%10824, %10823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10825) : (i64) -> ()
      %10826 = func.call @stack_pop_pointer() : () -> i64
      %10827 = func.call @stack_pop_pointer() : () -> i64
      %10828 = func.call @cc_cons(%10827, %10826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10828) : (i64) -> ()
      %10829 = func.call @stack_pop_pointer() : () -> i64
      %10830 = func.call @stack_pop_pointer() : () -> i64
      %10831 = func.call @cc_cons(%10830, %10829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10831) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10832 = func.call @stack_pop_pointer() : () -> i64
      %10833 = func.call @stack_pop_pointer() : () -> i64
      %10834 = func.call @cc_cons(%10833, %10832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10834) : (i64) -> ()
      %10835 = func.call @stack_pop_pointer() : () -> i64
      %10836 = func.call @stack_pop_pointer() : () -> i64
      %10837 = func.call @cc_cons(%10836, %10835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10837) : (i64) -> ()
      %10838 = func.call @stack_pop_pointer() : () -> i64
      %10839 = func.call @stack_pop_pointer() : () -> i64
      %10840 = func.call @cc_cons(%10839, %10838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10840) : (i64) -> ()
      %10841 = func.call @stack_pop_pointer() : () -> i64
      %10842 = func.call @stack_pop_pointer() : () -> i64
      %10843 = func.call @cc_cons(%10842, %10841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10843) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10844 = func.call @stack_pop_pointer() : () -> i64
      %10845 = func.call @stack_pop_pointer() : () -> i64
      %10846 = func.call @cc_cons(%10845, %10844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10846) : (i64) -> ()
      %10847 = func.call @stack_pop_pointer() : () -> i64
      %10848 = func.call @stack_pop_pointer() : () -> i64
      %10849 = func.call @cc_cons(%10848, %10847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10849) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10850 = func.call @stack_pop_pointer() : () -> i64
      %10851 = func.call @stack_pop_pointer() : () -> i64
      %10852 = func.call @cc_cons(%10851, %10850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10852) : (i64) -> ()
      %10853 = llvm.mlir.addressof @str923 : !llvm.ptr
      %10854 = arith.constant 4 : i64
      %10855 = func.call @cc_make_string(%10853, %10854) : (!llvm.ptr, i64) -> i64
      %10856 = llvm.mlir.addressof @str924 : !llvm.ptr
      %10857 = arith.constant 11 : i64
      %10858 = func.call @cc_make_string(%10856, %10857) : (!llvm.ptr, i64) -> i64
      %10859 = func.call @cc_intern(%10855, %10858) : (i64, i64) -> i64
      %10860 = func.call @cc_nil_value() : () -> i64
      %10861 = func.call @cc_cons(%10859, %10860) : (i64, i64) -> i64
      %10862 = func.call @cc_values_pack(%10861) : (i64) -> i64
      func.call @stack_push_pointer(%10859) : (i64) -> ()
      %10863 = llvm.mlir.addressof @str925 : !llvm.ptr
      %10864 = arith.constant 5 : i64
      %10865 = func.call @cc_make_string(%10863, %10864) : (!llvm.ptr, i64) -> i64
      %10866 = llvm.mlir.addressof @str926 : !llvm.ptr
      %10867 = arith.constant 11 : i64
      %10868 = func.call @cc_make_string(%10866, %10867) : (!llvm.ptr, i64) -> i64
      %10869 = func.call @cc_intern(%10865, %10868) : (i64, i64) -> i64
      %10870 = func.call @cc_nil_value() : () -> i64
      %10871 = func.call @cc_cons(%10869, %10870) : (i64, i64) -> i64
      %10872 = func.call @cc_values_pack(%10871) : (i64) -> i64
      func.call @stack_push_pointer(%10869) : (i64) -> ()
      %10873 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%10873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10874 = func.call @stack_pop_pointer() : () -> i64
      %10875 = func.call @stack_pop_pointer() : () -> i64
      %10876 = func.call @cc_cons(%10875, %10874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10876) : (i64) -> ()
      %10877 = func.call @stack_pop_pointer() : () -> i64
      %10878 = func.call @stack_pop_pointer() : () -> i64
      %10879 = func.call @cc_cons(%10878, %10877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10879) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10880 = func.call @stack_pop_pointer() : () -> i64
      %10881 = func.call @stack_pop_pointer() : () -> i64
      %10882 = func.call @cc_cons(%10881, %10880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10882) : (i64) -> ()
      %10883 = func.call @stack_pop_pointer() : () -> i64
      %10884 = func.call @stack_pop_pointer() : () -> i64
      %10885 = func.call @cc_cons(%10884, %10883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10885) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10886 = func.call @stack_pop_pointer() : () -> i64
      %10887 = func.call @stack_pop_pointer() : () -> i64
      %10888 = func.call @cc_cons(%10887, %10886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10888) : (i64) -> ()
      %10889 = func.call @stack_pop_pointer() : () -> i64
      %10890 = func.call @stack_pop_pointer() : () -> i64
      %10891 = func.call @cc_cons(%10890, %10889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10891) : (i64) -> ()
      %10892 = func.call @stack_pop_pointer() : () -> i64
      %10893 = func.call @stack_pop_pointer() : () -> i64
      %10894 = func.call @cc_cons(%10893, %10892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10894) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10895 = func.call @stack_pop_pointer() : () -> i64
      %10896 = func.call @stack_pop_pointer() : () -> i64
      %10897 = func.call @cc_cons(%10896, %10895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10897) : (i64) -> ()
      %10898 = func.call @stack_pop_pointer() : () -> i64
      %10899 = func.call @stack_pop_pointer() : () -> i64
      %10900 = func.call @cc_cons(%10899, %10898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10900) : (i64) -> ()
      %10901 = func.call @stack_pop_pointer() : () -> i64
      %10902 = func.call @stack_pop_pointer() : () -> i64
      %10903 = func.call @cc_cons(%10902, %10901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10903) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10904 = func.call @stack_pop_pointer() : () -> i64
      %10905 = func.call @stack_pop_pointer() : () -> i64
      %10906 = func.call @cc_cons(%10905, %10904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10906) : (i64) -> ()
      %10907 = func.call @stack_pop_pointer() : () -> i64
      %10908 = func.call @stack_pop_pointer() : () -> i64
      %10909 = func.call @cc_cons(%10908, %10907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10910 = func.call @stack_pop_pointer() : () -> i64
      %10911 = func.call @stack_pop_pointer() : () -> i64
      %10912 = func.call @cc_cons(%10911, %10910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10912) : (i64) -> ()
      %10913 = func.call @stack_pop_pointer() : () -> i64
      %10914 = func.call @stack_pop_pointer() : () -> i64
      %10915 = func.call @cc_cons(%10914, %10913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10915) : (i64) -> ()
      %10916 = func.call @stack_pop_pointer() : () -> i64
      %11086 = arith.constant 97047688511580 : i64
      %11087 = arith.constant 0 : i64
      %11088 = func.call @cc_make_closure(%11086, %11087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11088) : (i64) -> ()
      %11089 = func.call @stack_pop_pointer() : () -> i64
      %11090 = llvm.mlir.addressof @str940 : !llvm.ptr
      %11091 = arith.constant 1 : i64
      %11092 = func.call @cc_make_string(%11090, %11091) : (!llvm.ptr, i64) -> i64
      %11093 = func.call @cc_nil_value() : () -> i64
      %11094 = func.call @cc_intern(%11092, %11093) : (i64, i64) -> i64
      %11095 = func.call @cc_nil_value() : () -> i64
      %11096 = func.call @cc_cons(%11094, %11095) : (i64, i64) -> i64
      %11097 = func.call @cc_values_pack(%11096) : (i64) -> i64
      func.call @stack_push_pointer(%11094) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11098 = func.call @stack_pop_pointer() : () -> i64
      %11099 = func.call @stack_pop_pointer() : () -> i64
      %11100 = func.call @cc_cons(%11099, %11098) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11100) : (i64) -> ()
      %11101 = func.call @stack_pop_pointer() : () -> i64
      %11102 = llvm.mlir.addressof @str941 : !llvm.ptr
      %11103 = arith.constant 11 : i64
      %11104 = func.call @cc_make_string(%11102, %11103) : (!llvm.ptr, i64) -> i64
      %11105 = llvm.mlir.addressof @str942 : !llvm.ptr
      %11106 = arith.constant 7 : i64
      %11107 = func.call @cc_make_string(%11105, %11106) : (!llvm.ptr, i64) -> i64
      %11108 = func.call @cc_intern(%11104, %11107) : (i64, i64) -> i64
      %11109 = func.call @cc_nil_value() : () -> i64
      %11110 = func.call @cc_cons(%11108, %11109) : (i64, i64) -> i64
      %11111 = func.call @cc_values_pack(%11110) : (i64) -> i64
      func.call @stack_push_pointer(%11108) : (i64) -> ()
      %11112 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %11113 = func.call @stack_pop_pointer() : () -> i64
      %11114 = llvm.mlir.addressof @str943 : !llvm.ptr
      %11115 = arith.constant 4 : i64
      %11116 = func.call @cc_make_string(%11114, %11115) : (!llvm.ptr, i64) -> i64
      %11117 = llvm.mlir.addressof @str944 : !llvm.ptr
      %11118 = arith.constant 7 : i64
      %11119 = func.call @cc_make_string(%11117, %11118) : (!llvm.ptr, i64) -> i64
      %11120 = func.call @cc_intern(%11116, %11119) : (i64, i64) -> i64
      %11121 = func.call @cc_nil_value() : () -> i64
      %11122 = func.call @cc_cons(%11120, %11121) : (i64, i64) -> i64
      %11123 = func.call @cc_values_pack(%11122) : (i64) -> i64
      func.call @stack_push_pointer(%11120) : (i64) -> ()
      %11124 = func.call @stack_pop_pointer() : () -> i64
      %11125 = llvm.mlir.addressof @str945 : !llvm.ptr
      %11126 = arith.constant 6 : i64
      %11127 = func.call @cc_make_string(%11125, %11126) : (!llvm.ptr, i64) -> i64
      %11128 = func.call @cc_nil_value() : () -> i64
      %11129 = func.call @cc_intern(%11127, %11128) : (i64, i64) -> i64
      %11130 = func.call @cc_nil_value() : () -> i64
      %11131 = func.call @cc_cons(%11129, %11130) : (i64, i64) -> i64
      %11132 = func.call @cc_values_pack(%11131) : (i64) -> i64
      func.call @stack_push_pointer(%11129) : (i64) -> ()
      %11133 = func.call @stack_pop_pointer() : () -> i64
      %11134 = func.call @cc_nil_value() : () -> i64
      %11135 = func.call @cc_errorp(%10648) : (i64) -> i64
      %11136 = arith.cmpi ne, %11135, %11134 : i64
      %11137 = arith.cmpi eq, %11134, %11134 : i64
      %11138 = arith.andi %11136, %11137 : i1
      %11139 = scf.if %11138 -> (i64) {
        scf.yield %10648 : i64
      } else {
        scf.yield %11134 : i64
      }
      %11140 = func.call @cc_errorp(%10916) : (i64) -> i64
      %11141 = arith.cmpi ne, %11140, %11134 : i64
      %11142 = arith.cmpi eq, %11139, %11134 : i64
      %11143 = arith.andi %11141, %11142 : i1
      %11144 = scf.if %11143 -> (i64) {
        scf.yield %10916 : i64
      } else {
        scf.yield %11139 : i64
      }
      %11145 = func.call @cc_errorp(%11089) : (i64) -> i64
      %11146 = arith.cmpi ne, %11145, %11134 : i64
      %11147 = arith.cmpi eq, %11144, %11134 : i64
      %11148 = arith.andi %11146, %11147 : i1
      %11149 = scf.if %11148 -> (i64) {
        scf.yield %11089 : i64
      } else {
        scf.yield %11144 : i64
      }
      %11150 = func.call @cc_errorp(%11101) : (i64) -> i64
      %11151 = arith.cmpi ne, %11150, %11134 : i64
      %11152 = arith.cmpi eq, %11149, %11134 : i64
      %11153 = arith.andi %11151, %11152 : i1
      %11154 = scf.if %11153 -> (i64) {
        scf.yield %11101 : i64
      } else {
        scf.yield %11149 : i64
      }
      %11155 = func.call @cc_errorp(%11112) : (i64) -> i64
      %11156 = arith.cmpi ne, %11155, %11134 : i64
      %11157 = arith.cmpi eq, %11154, %11134 : i64
      %11158 = arith.andi %11156, %11157 : i1
      %11159 = scf.if %11158 -> (i64) {
        scf.yield %11112 : i64
      } else {
        scf.yield %11154 : i64
      }
      %11160 = func.call @cc_errorp(%11113) : (i64) -> i64
      %11161 = arith.cmpi ne, %11160, %11134 : i64
      %11162 = arith.cmpi eq, %11159, %11134 : i64
      %11163 = arith.andi %11161, %11162 : i1
      %11164 = scf.if %11163 -> (i64) {
        scf.yield %11113 : i64
      } else {
        scf.yield %11159 : i64
      }
      %11165 = func.call @cc_errorp(%11124) : (i64) -> i64
      %11166 = arith.cmpi ne, %11165, %11134 : i64
      %11167 = arith.cmpi eq, %11164, %11134 : i64
      %11168 = arith.andi %11166, %11167 : i1
      %11169 = scf.if %11168 -> (i64) {
        scf.yield %11124 : i64
      } else {
        scf.yield %11164 : i64
      }
      %11170 = func.call @cc_errorp(%11133) : (i64) -> i64
      %11171 = arith.cmpi ne, %11170, %11134 : i64
      %11172 = arith.cmpi eq, %11169, %11134 : i64
      %11173 = arith.andi %11171, %11172 : i1
      %11174 = scf.if %11173 -> (i64) {
        scf.yield %11133 : i64
      } else {
        scf.yield %11169 : i64
      }
      %11175 = arith.cmpi ne, %11174, %11134 : i64
      scf.if %11175 {
        func.call @stack_push_pointer(%11174) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10648) : (i64) -> ()
        func.call @stack_push_pointer(%10916) : (i64) -> ()
        func.call @stack_push_pointer(%11089) : (i64) -> ()
        func.call @stack_push_pointer(%11101) : (i64) -> ()
        func.call @stack_push_pointer(%11112) : (i64) -> ()
        func.call @stack_push_pointer(%11113) : (i64) -> ()
        func.call @stack_push_pointer(%11124) : (i64) -> ()
        func.call @stack_push_pointer(%11133) : (i64) -> ()
        %11176 = llvm.mlir.addressof @str946 : !llvm.ptr
        %11177 = func.call @cc_make_function_ref_const(%11176) : (!llvm.ptr) -> i64
        %11178 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11177, %11178) : (i64, i64) -> ()
      }
      %11179 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11179 : i64
    }
    %11180 = func.call @cc_nil_value() : () -> i64
    %11181 = func.call @cc_errorp(%10637) : (i64) -> i64
    %11182 = arith.cmpi ne, %11181, %11180 : i64
    %11183 = scf.if %11182 -> (i64) {
      scf.yield %10637 : i64
    } else {
      %11184 = llvm.mlir.addressof @str947 : !llvm.ptr
      %11185 = arith.constant 15 : i64
      %11186 = func.call @cc_make_string(%11184, %11185) : (!llvm.ptr, i64) -> i64
      %11187 = func.call @cc_nil_value() : () -> i64
      %11188 = func.call @cc_intern(%11186, %11187) : (i64, i64) -> i64
      %11189 = func.call @cc_nil_value() : () -> i64
      %11190 = func.call @cc_cons(%11188, %11189) : (i64, i64) -> i64
      %11191 = func.call @cc_values_pack(%11190) : (i64) -> i64
      func.call @stack_push_pointer(%11188) : (i64) -> ()
      %11192 = func.call @stack_pop_pointer() : () -> i64
      %11193 = llvm.mlir.addressof @str948 : !llvm.ptr
      %11194 = arith.constant 6 : i64
      %11195 = func.call @cc_make_string(%11193, %11194) : (!llvm.ptr, i64) -> i64
      %11196 = llvm.mlir.addressof @str949 : !llvm.ptr
      %11197 = arith.constant 11 : i64
      %11198 = func.call @cc_make_string(%11196, %11197) : (!llvm.ptr, i64) -> i64
      %11199 = func.call @cc_intern(%11195, %11198) : (i64, i64) -> i64
      %11200 = func.call @cc_nil_value() : () -> i64
      %11201 = func.call @cc_cons(%11199, %11200) : (i64, i64) -> i64
      %11202 = func.call @cc_values_pack(%11201) : (i64) -> i64
      func.call @stack_push_pointer(%11199) : (i64) -> ()
      %11203 = llvm.mlir.addressof @str950 : !llvm.ptr
      %11204 = arith.constant 5 : i64
      %11205 = func.call @cc_make_string(%11203, %11204) : (!llvm.ptr, i64) -> i64
      %11206 = func.call @cc_nil_value() : () -> i64
      %11207 = func.call @cc_intern(%11205, %11206) : (i64, i64) -> i64
      %11208 = func.call @cc_nil_value() : () -> i64
      %11209 = func.call @cc_cons(%11207, %11208) : (i64, i64) -> i64
      %11210 = func.call @cc_values_pack(%11209) : (i64) -> i64
      func.call @stack_push_pointer(%11207) : (i64) -> ()
      %11211 = llvm.mlir.addressof @str951 : !llvm.ptr
      %11212 = arith.constant 13 : i64
      %11213 = func.call @cc_make_string(%11211, %11212) : (!llvm.ptr, i64) -> i64
      %11214 = llvm.mlir.addressof @str952 : !llvm.ptr
      %11215 = arith.constant 11 : i64
      %11216 = func.call @cc_make_string(%11214, %11215) : (!llvm.ptr, i64) -> i64
      %11217 = func.call @cc_intern(%11213, %11216) : (i64, i64) -> i64
      %11218 = func.call @cc_nil_value() : () -> i64
      %11219 = func.call @cc_cons(%11217, %11218) : (i64, i64) -> i64
      %11220 = func.call @cc_values_pack(%11219) : (i64) -> i64
      func.call @stack_push_pointer(%11217) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11221 = func.call @stack_pop_pointer() : () -> i64
      %11222 = func.call @stack_pop_pointer() : () -> i64
      %11223 = func.call @cc_cons(%11222, %11221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11223) : (i64) -> ()
      %11224 = llvm.mlir.addressof @str953 : !llvm.ptr
      %11225 = arith.constant 15 : i64
      %11226 = func.call @cc_make_string(%11224, %11225) : (!llvm.ptr, i64) -> i64
      %11227 = llvm.mlir.addressof @str954 : !llvm.ptr
      %11228 = arith.constant 11 : i64
      %11229 = func.call @cc_make_string(%11227, %11228) : (!llvm.ptr, i64) -> i64
      %11230 = func.call @cc_intern(%11226, %11229) : (i64, i64) -> i64
      %11231 = func.call @cc_nil_value() : () -> i64
      %11232 = func.call @cc_cons(%11230, %11231) : (i64, i64) -> i64
      %11233 = func.call @cc_values_pack(%11232) : (i64) -> i64
      func.call @stack_push_pointer(%11230) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11234 = func.call @stack_pop_pointer() : () -> i64
      %11235 = func.call @stack_pop_pointer() : () -> i64
      %11236 = func.call @cc_cons(%11235, %11234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11236) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11237 = func.call @stack_pop_pointer() : () -> i64
      %11238 = func.call @stack_pop_pointer() : () -> i64
      %11239 = func.call @cc_cons(%11238, %11237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11239) : (i64) -> ()
      %11240 = func.call @stack_pop_pointer() : () -> i64
      %11241 = func.call @stack_pop_pointer() : () -> i64
      %11242 = func.call @cc_cons(%11241, %11240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11242) : (i64) -> ()
      %11243 = func.call @stack_pop_pointer() : () -> i64
      %11244 = func.call @stack_pop_pointer() : () -> i64
      %11245 = func.call @cc_cons(%11244, %11243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11245) : (i64) -> ()
      %11246 = llvm.mlir.addressof @str955 : !llvm.ptr
      %11247 = arith.constant 5 : i64
      %11248 = func.call @cc_make_string(%11246, %11247) : (!llvm.ptr, i64) -> i64
      %11249 = func.call @cc_nil_value() : () -> i64
      %11250 = func.call @cc_intern(%11248, %11249) : (i64, i64) -> i64
      %11251 = func.call @cc_nil_value() : () -> i64
      %11252 = func.call @cc_cons(%11250, %11251) : (i64, i64) -> i64
      %11253 = func.call @cc_values_pack(%11252) : (i64) -> i64
      func.call @stack_push_pointer(%11250) : (i64) -> ()
      %11254 = llvm.mlir.addressof @str956 : !llvm.ptr
      %11255 = arith.constant 15 : i64
      %11256 = func.call @cc_make_string(%11254, %11255) : (!llvm.ptr, i64) -> i64
      %11257 = llvm.mlir.addressof @str957 : !llvm.ptr
      %11258 = arith.constant 11 : i64
      %11259 = func.call @cc_make_string(%11257, %11258) : (!llvm.ptr, i64) -> i64
      %11260 = func.call @cc_intern(%11256, %11259) : (i64, i64) -> i64
      %11261 = func.call @cc_nil_value() : () -> i64
      %11262 = func.call @cc_cons(%11260, %11261) : (i64, i64) -> i64
      %11263 = func.call @cc_values_pack(%11262) : (i64) -> i64
      func.call @stack_push_pointer(%11260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11264 = func.call @stack_pop_pointer() : () -> i64
      %11265 = func.call @stack_pop_pointer() : () -> i64
      %11266 = func.call @cc_cons(%11265, %11264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11266) : (i64) -> ()
      %11267 = llvm.mlir.addressof @str958 : !llvm.ptr
      %11268 = arith.constant 15 : i64
      %11269 = func.call @cc_make_string(%11267, %11268) : (!llvm.ptr, i64) -> i64
      %11270 = llvm.mlir.addressof @str959 : !llvm.ptr
      %11271 = arith.constant 11 : i64
      %11272 = func.call @cc_make_string(%11270, %11271) : (!llvm.ptr, i64) -> i64
      %11273 = func.call @cc_intern(%11269, %11272) : (i64, i64) -> i64
      %11274 = func.call @cc_nil_value() : () -> i64
      %11275 = func.call @cc_cons(%11273, %11274) : (i64, i64) -> i64
      %11276 = func.call @cc_values_pack(%11275) : (i64) -> i64
      func.call @stack_push_pointer(%11273) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11277 = func.call @stack_pop_pointer() : () -> i64
      %11278 = func.call @stack_pop_pointer() : () -> i64
      %11279 = func.call @cc_cons(%11278, %11277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11279) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11280 = func.call @stack_pop_pointer() : () -> i64
      %11281 = func.call @stack_pop_pointer() : () -> i64
      %11282 = func.call @cc_cons(%11281, %11280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11282) : (i64) -> ()
      %11283 = func.call @stack_pop_pointer() : () -> i64
      %11284 = func.call @stack_pop_pointer() : () -> i64
      %11285 = func.call @cc_cons(%11284, %11283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11285) : (i64) -> ()
      %11286 = func.call @stack_pop_pointer() : () -> i64
      %11287 = func.call @stack_pop_pointer() : () -> i64
      %11288 = func.call @cc_cons(%11287, %11286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11288) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11289 = func.call @stack_pop_pointer() : () -> i64
      %11290 = func.call @stack_pop_pointer() : () -> i64
      %11291 = func.call @cc_cons(%11290, %11289) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11291) : (i64) -> ()
      %11292 = func.call @stack_pop_pointer() : () -> i64
      %11293 = func.call @stack_pop_pointer() : () -> i64
      %11294 = func.call @cc_cons(%11293, %11292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11294) : (i64) -> ()
      %11295 = func.call @stack_pop_pointer() : () -> i64
      %11296 = func.call @stack_pop_pointer() : () -> i64
      %11297 = func.call @cc_cons(%11296, %11295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11297) : (i64) -> ()
      %11298 = func.call @stack_pop_pointer() : () -> i64
      %11355 = arith.constant 97047688511583 : i64
      %11356 = arith.constant 0 : i64
      %11357 = func.call @cc_make_closure(%11355, %11356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11357) : (i64) -> ()
      %11358 = func.call @stack_pop_pointer() : () -> i64
      %11359 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%11359) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %11360 = func.call @stack_pop_pointer() : () -> i64
      %11361 = func.call @stack_pop_pointer() : () -> i64
      %11362 = func.call @cc_cons(%11361, %11360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11362) : (i64) -> ()
      %11363 = func.call @stack_pop_pointer() : () -> i64
      %11364 = func.call @stack_pop_pointer() : () -> i64
      %11365 = func.call @cc_cons(%11364, %11363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11365) : (i64) -> ()
      %11366 = func.call @stack_pop_pointer() : () -> i64
      %11367 = llvm.mlir.addressof @str964 : !llvm.ptr
      %11368 = arith.constant 11 : i64
      %11369 = func.call @cc_make_string(%11367, %11368) : (!llvm.ptr, i64) -> i64
      %11370 = llvm.mlir.addressof @str965 : !llvm.ptr
      %11371 = arith.constant 7 : i64
      %11372 = func.call @cc_make_string(%11370, %11371) : (!llvm.ptr, i64) -> i64
      %11373 = func.call @cc_intern(%11369, %11372) : (i64, i64) -> i64
      %11374 = func.call @cc_nil_value() : () -> i64
      %11375 = func.call @cc_cons(%11373, %11374) : (i64, i64) -> i64
      %11376 = func.call @cc_values_pack(%11375) : (i64) -> i64
      func.call @stack_push_pointer(%11373) : (i64) -> ()
      %11377 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %11378 = func.call @stack_pop_pointer() : () -> i64
      %11379 = llvm.mlir.addressof @str966 : !llvm.ptr
      %11380 = arith.constant 4 : i64
      %11381 = func.call @cc_make_string(%11379, %11380) : (!llvm.ptr, i64) -> i64
      %11382 = llvm.mlir.addressof @str967 : !llvm.ptr
      %11383 = arith.constant 7 : i64
      %11384 = func.call @cc_make_string(%11382, %11383) : (!llvm.ptr, i64) -> i64
      %11385 = func.call @cc_intern(%11381, %11384) : (i64, i64) -> i64
      %11386 = func.call @cc_nil_value() : () -> i64
      %11387 = func.call @cc_cons(%11385, %11386) : (i64, i64) -> i64
      %11388 = func.call @cc_values_pack(%11387) : (i64) -> i64
      func.call @stack_push_pointer(%11385) : (i64) -> ()
      %11389 = func.call @stack_pop_pointer() : () -> i64
      %11390 = llvm.mlir.addressof @str968 : !llvm.ptr
      %11391 = arith.constant 6 : i64
      %11392 = func.call @cc_make_string(%11390, %11391) : (!llvm.ptr, i64) -> i64
      %11393 = func.call @cc_nil_value() : () -> i64
      %11394 = func.call @cc_intern(%11392, %11393) : (i64, i64) -> i64
      %11395 = func.call @cc_nil_value() : () -> i64
      %11396 = func.call @cc_cons(%11394, %11395) : (i64, i64) -> i64
      %11397 = func.call @cc_values_pack(%11396) : (i64) -> i64
      func.call @stack_push_pointer(%11394) : (i64) -> ()
      %11398 = func.call @stack_pop_pointer() : () -> i64
      %11399 = func.call @cc_nil_value() : () -> i64
      %11400 = func.call @cc_errorp(%11192) : (i64) -> i64
      %11401 = arith.cmpi ne, %11400, %11399 : i64
      %11402 = arith.cmpi eq, %11399, %11399 : i64
      %11403 = arith.andi %11401, %11402 : i1
      %11404 = scf.if %11403 -> (i64) {
        scf.yield %11192 : i64
      } else {
        scf.yield %11399 : i64
      }
      %11405 = func.call @cc_errorp(%11298) : (i64) -> i64
      %11406 = arith.cmpi ne, %11405, %11399 : i64
      %11407 = arith.cmpi eq, %11404, %11399 : i64
      %11408 = arith.andi %11406, %11407 : i1
      %11409 = scf.if %11408 -> (i64) {
        scf.yield %11298 : i64
      } else {
        scf.yield %11404 : i64
      }
      %11410 = func.call @cc_errorp(%11358) : (i64) -> i64
      %11411 = arith.cmpi ne, %11410, %11399 : i64
      %11412 = arith.cmpi eq, %11409, %11399 : i64
      %11413 = arith.andi %11411, %11412 : i1
      %11414 = scf.if %11413 -> (i64) {
        scf.yield %11358 : i64
      } else {
        scf.yield %11409 : i64
      }
      %11415 = func.call @cc_errorp(%11366) : (i64) -> i64
      %11416 = arith.cmpi ne, %11415, %11399 : i64
      %11417 = arith.cmpi eq, %11414, %11399 : i64
      %11418 = arith.andi %11416, %11417 : i1
      %11419 = scf.if %11418 -> (i64) {
        scf.yield %11366 : i64
      } else {
        scf.yield %11414 : i64
      }
      %11420 = func.call @cc_errorp(%11377) : (i64) -> i64
      %11421 = arith.cmpi ne, %11420, %11399 : i64
      %11422 = arith.cmpi eq, %11419, %11399 : i64
      %11423 = arith.andi %11421, %11422 : i1
      %11424 = scf.if %11423 -> (i64) {
        scf.yield %11377 : i64
      } else {
        scf.yield %11419 : i64
      }
      %11425 = func.call @cc_errorp(%11378) : (i64) -> i64
      %11426 = arith.cmpi ne, %11425, %11399 : i64
      %11427 = arith.cmpi eq, %11424, %11399 : i64
      %11428 = arith.andi %11426, %11427 : i1
      %11429 = scf.if %11428 -> (i64) {
        scf.yield %11378 : i64
      } else {
        scf.yield %11424 : i64
      }
      %11430 = func.call @cc_errorp(%11389) : (i64) -> i64
      %11431 = arith.cmpi ne, %11430, %11399 : i64
      %11432 = arith.cmpi eq, %11429, %11399 : i64
      %11433 = arith.andi %11431, %11432 : i1
      %11434 = scf.if %11433 -> (i64) {
        scf.yield %11389 : i64
      } else {
        scf.yield %11429 : i64
      }
      %11435 = func.call @cc_errorp(%11398) : (i64) -> i64
      %11436 = arith.cmpi ne, %11435, %11399 : i64
      %11437 = arith.cmpi eq, %11434, %11399 : i64
      %11438 = arith.andi %11436, %11437 : i1
      %11439 = scf.if %11438 -> (i64) {
        scf.yield %11398 : i64
      } else {
        scf.yield %11434 : i64
      }
      %11440 = arith.cmpi ne, %11439, %11399 : i64
      scf.if %11440 {
        func.call @stack_push_pointer(%11439) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11192) : (i64) -> ()
        func.call @stack_push_pointer(%11298) : (i64) -> ()
        func.call @stack_push_pointer(%11358) : (i64) -> ()
        func.call @stack_push_pointer(%11366) : (i64) -> ()
        func.call @stack_push_pointer(%11377) : (i64) -> ()
        func.call @stack_push_pointer(%11378) : (i64) -> ()
        func.call @stack_push_pointer(%11389) : (i64) -> ()
        func.call @stack_push_pointer(%11398) : (i64) -> ()
        %11441 = llvm.mlir.addressof @str969 : !llvm.ptr
        %11442 = func.call @cc_make_function_ref_const(%11441) : (!llvm.ptr) -> i64
        %11443 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11442, %11443) : (i64, i64) -> ()
      }
      %11444 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11444 : i64
    }
    %11445 = func.call @cc_nil_value() : () -> i64
    %11446 = func.call @cc_errorp(%11183) : (i64) -> i64
    %11447 = arith.cmpi ne, %11446, %11445 : i64
    %11448 = scf.if %11447 -> (i64) {
      scf.yield %11183 : i64
    } else {
      %11449 = llvm.mlir.addressof @str970 : !llvm.ptr
      %11450 = arith.constant 9 : i64
      %11451 = func.call @cc_make_string(%11449, %11450) : (!llvm.ptr, i64) -> i64
      %11452 = func.call @cc_nil_value() : () -> i64
      %11453 = func.call @cc_intern(%11451, %11452) : (i64, i64) -> i64
      %11454 = func.call @cc_nil_value() : () -> i64
      %11455 = func.call @cc_cons(%11453, %11454) : (i64, i64) -> i64
      %11456 = func.call @cc_values_pack(%11455) : (i64) -> i64
      func.call @stack_push_pointer(%11453) : (i64) -> ()
      %11457 = func.call @stack_pop_pointer() : () -> i64
      %11458 = llvm.mlir.addressof @str971 : !llvm.ptr
      %11459 = arith.constant 3 : i64
      %11460 = func.call @cc_make_string(%11458, %11459) : (!llvm.ptr, i64) -> i64
      %11461 = func.call @cc_nil_value() : () -> i64
      %11462 = func.call @cc_intern(%11460, %11461) : (i64, i64) -> i64
      %11463 = func.call @cc_nil_value() : () -> i64
      %11464 = func.call @cc_cons(%11462, %11463) : (i64, i64) -> i64
      %11465 = func.call @cc_values_pack(%11464) : (i64) -> i64
      func.call @stack_push_pointer(%11462) : (i64) -> ()
      %11466 = llvm.mlir.addressof @str972 : !llvm.ptr
      %11467 = arith.constant 3 : i64
      %11468 = func.call @cc_make_string(%11466, %11467) : (!llvm.ptr, i64) -> i64
      %11469 = func.call @cc_nil_value() : () -> i64
      %11470 = func.call @cc_intern(%11468, %11469) : (i64, i64) -> i64
      %11471 = func.call @cc_nil_value() : () -> i64
      %11472 = func.call @cc_cons(%11470, %11471) : (i64, i64) -> i64
      %11473 = func.call @cc_values_pack(%11472) : (i64) -> i64
      func.call @stack_push_pointer(%11470) : (i64) -> ()
      %11474 = llvm.mlir.addressof @str973 : !llvm.ptr
      %11475 = arith.constant 5 : i64
      %11476 = func.call @cc_make_string(%11474, %11475) : (!llvm.ptr, i64) -> i64
      %11477 = func.call @cc_nil_value() : () -> i64
      %11478 = func.call @cc_intern(%11476, %11477) : (i64, i64) -> i64
      %11479 = func.call @cc_nil_value() : () -> i64
      %11480 = func.call @cc_cons(%11478, %11479) : (i64, i64) -> i64
      %11481 = func.call @cc_values_pack(%11480) : (i64) -> i64
      func.call @stack_push_pointer(%11478) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11482 = llvm.mlir.addressof @str974 : !llvm.ptr
      %11483 = arith.constant 3 : i64
      %11484 = func.call @cc_make_string(%11482, %11483) : (!llvm.ptr, i64) -> i64
      %11485 = func.call @cc_nil_value() : () -> i64
      %11486 = func.call @cc_intern(%11484, %11485) : (i64, i64) -> i64
      %11487 = func.call @cc_nil_value() : () -> i64
      %11488 = func.call @cc_cons(%11486, %11487) : (i64, i64) -> i64
      %11489 = func.call @cc_values_pack(%11488) : (i64) -> i64
      func.call @stack_push_pointer(%11486) : (i64) -> ()
      %11490 = llvm.mlir.addressof @str975 : !llvm.ptr
      %11491 = arith.constant 22 : i64
      %11492 = func.call @cc_make_string(%11490, %11491) : (!llvm.ptr, i64) -> i64
      %11493 = llvm.mlir.addressof @str976 : !llvm.ptr
      %11494 = arith.constant 3 : i64
      %11495 = func.call @cc_make_string(%11493, %11494) : (!llvm.ptr, i64) -> i64
      %11496 = func.call @cc_intern(%11492, %11495) : (i64, i64) -> i64
      %11497 = func.call @cc_nil_value() : () -> i64
      %11498 = func.call @cc_cons(%11496, %11497) : (i64, i64) -> i64
      %11499 = func.call @cc_values_pack(%11498) : (i64) -> i64
      func.call @stack_push_pointer(%11496) : (i64) -> ()
      %11500 = llvm.mlir.addressof @str977 : !llvm.ptr
      %11501 = arith.constant 6 : i64
      %11502 = func.call @cc_make_string(%11500, %11501) : (!llvm.ptr, i64) -> i64
      %11503 = func.call @cc_nil_value() : () -> i64
      %11504 = func.call @cc_intern(%11502, %11503) : (i64, i64) -> i64
      %11505 = func.call @cc_nil_value() : () -> i64
      %11506 = func.call @cc_cons(%11504, %11505) : (i64, i64) -> i64
      %11507 = func.call @cc_values_pack(%11506) : (i64) -> i64
      func.call @stack_push_pointer(%11504) : (i64) -> ()
      %11508 = llvm.mlir.addressof @str978 : !llvm.ptr
      %11509 = arith.constant 9 : i64
      %11510 = func.call @cc_make_string(%11508, %11509) : (!llvm.ptr, i64) -> i64
      %11511 = llvm.mlir.addressof @str979 : !llvm.ptr
      %11512 = arith.constant 11 : i64
      %11513 = func.call @cc_make_string(%11511, %11512) : (!llvm.ptr, i64) -> i64
      %11514 = func.call @cc_intern(%11510, %11513) : (i64, i64) -> i64
      %11515 = func.call @cc_nil_value() : () -> i64
      %11516 = func.call @cc_cons(%11514, %11515) : (i64, i64) -> i64
      %11517 = func.call @cc_values_pack(%11516) : (i64) -> i64
      func.call @stack_push_pointer(%11514) : (i64) -> ()
      %11518 = llvm.mlir.addressof @str980 : !llvm.ptr
      %11519 = arith.constant 8 : i64
      %11520 = func.call @cc_make_string(%11518, %11519) : (!llvm.ptr, i64) -> i64
      %11521 = func.call @cc_nil_value() : () -> i64
      %11522 = func.call @cc_intern(%11520, %11521) : (i64, i64) -> i64
      %11523 = func.call @cc_nil_value() : () -> i64
      %11524 = func.call @cc_cons(%11522, %11523) : (i64, i64) -> i64
      %11525 = func.call @cc_values_pack(%11524) : (i64) -> i64
      func.call @stack_push_pointer(%11522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11526 = func.call @stack_pop_pointer() : () -> i64
      %11527 = func.call @stack_pop_pointer() : () -> i64
      %11528 = func.call @cc_cons(%11527, %11526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11528) : (i64) -> ()
      %11529 = func.call @stack_pop_pointer() : () -> i64
      %11530 = func.call @stack_pop_pointer() : () -> i64
      %11531 = func.call @cc_cons(%11530, %11529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11531) : (i64) -> ()
      %11532 = llvm.mlir.addressof @str981 : !llvm.ptr
      %11533 = arith.constant 7 : i64
      %11534 = func.call @cc_make_string(%11532, %11533) : (!llvm.ptr, i64) -> i64
      %11535 = llvm.mlir.addressof @str982 : !llvm.ptr
      %11536 = arith.constant 11 : i64
      %11537 = func.call @cc_make_string(%11535, %11536) : (!llvm.ptr, i64) -> i64
      %11538 = func.call @cc_intern(%11534, %11537) : (i64, i64) -> i64
      %11539 = func.call @cc_nil_value() : () -> i64
      %11540 = func.call @cc_cons(%11538, %11539) : (i64, i64) -> i64
      %11541 = func.call @cc_values_pack(%11540) : (i64) -> i64
      func.call @stack_push_pointer(%11538) : (i64) -> ()
      %11542 = llvm.mlir.addressof @str983 : !llvm.ptr
      %11543 = arith.constant 6 : i64
      %11544 = func.call @cc_make_string(%11542, %11543) : (!llvm.ptr, i64) -> i64
      %11545 = llvm.mlir.addressof @str984 : !llvm.ptr
      %11546 = arith.constant 11 : i64
      %11547 = func.call @cc_make_string(%11545, %11546) : (!llvm.ptr, i64) -> i64
      %11548 = func.call @cc_intern(%11544, %11547) : (i64, i64) -> i64
      %11549 = func.call @cc_nil_value() : () -> i64
      %11550 = func.call @cc_cons(%11548, %11549) : (i64, i64) -> i64
      %11551 = func.call @cc_values_pack(%11550) : (i64) -> i64
      func.call @stack_push_pointer(%11548) : (i64) -> ()
      %11552 = llvm.mlir.addressof @str985 : !llvm.ptr
      %11553 = arith.constant 8 : i64
      %11554 = func.call @cc_make_string(%11552, %11553) : (!llvm.ptr, i64) -> i64
      %11555 = func.call @cc_nil_value() : () -> i64
      %11556 = func.call @cc_intern(%11554, %11555) : (i64, i64) -> i64
      %11557 = func.call @cc_nil_value() : () -> i64
      %11558 = func.call @cc_cons(%11556, %11557) : (i64, i64) -> i64
      %11559 = func.call @cc_values_pack(%11558) : (i64) -> i64
      func.call @stack_push_pointer(%11556) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11560 = func.call @stack_pop_pointer() : () -> i64
      %11561 = func.call @stack_pop_pointer() : () -> i64
      %11562 = func.call @cc_cons(%11561, %11560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11562) : (i64) -> ()
      %11563 = func.call @stack_pop_pointer() : () -> i64
      %11564 = func.call @stack_pop_pointer() : () -> i64
      %11565 = func.call @cc_cons(%11564, %11563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11565) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11566 = func.call @stack_pop_pointer() : () -> i64
      %11567 = func.call @stack_pop_pointer() : () -> i64
      %11568 = func.call @cc_cons(%11567, %11566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11568) : (i64) -> ()
      %11569 = func.call @stack_pop_pointer() : () -> i64
      %11570 = func.call @stack_pop_pointer() : () -> i64
      %11571 = func.call @cc_cons(%11570, %11569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11571) : (i64) -> ()
      %11572 = llvm.mlir.addressof @str986 : !llvm.ptr
      %11573 = arith.constant 11 : i64
      %11574 = func.call @cc_make_string(%11572, %11573) : (!llvm.ptr, i64) -> i64
      %11575 = func.call @cc_nil_value() : () -> i64
      %11576 = func.call @cc_intern(%11574, %11575) : (i64, i64) -> i64
      %11577 = func.call @cc_nil_value() : () -> i64
      %11578 = func.call @cc_cons(%11576, %11577) : (i64, i64) -> i64
      %11579 = func.call @cc_values_pack(%11578) : (i64) -> i64
      func.call @stack_push_pointer(%11576) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11580 = llvm.mlir.addressof @str987 : !llvm.ptr
      %11581 = arith.constant 5 : i64
      %11582 = func.call @cc_make_string(%11580, %11581) : (!llvm.ptr, i64) -> i64
      %11583 = llvm.mlir.addressof @str988 : !llvm.ptr
      %11584 = arith.constant 11 : i64
      %11585 = func.call @cc_make_string(%11583, %11584) : (!llvm.ptr, i64) -> i64
      %11586 = func.call @cc_intern(%11582, %11585) : (i64, i64) -> i64
      %11587 = func.call @cc_nil_value() : () -> i64
      %11588 = func.call @cc_cons(%11586, %11587) : (i64, i64) -> i64
      %11589 = func.call @cc_values_pack(%11588) : (i64) -> i64
      func.call @stack_push_pointer(%11586) : (i64) -> ()
      %11590 = llvm.mlir.addressof @str989 : !llvm.ptr
      %11591 = arith.constant 9 : i64
      %11592 = func.call @cc_make_string(%11590, %11591) : (!llvm.ptr, i64) -> i64
      %11593 = llvm.mlir.addressof @str990 : !llvm.ptr
      %11594 = arith.constant 11 : i64
      %11595 = func.call @cc_make_string(%11593, %11594) : (!llvm.ptr, i64) -> i64
      %11596 = func.call @cc_intern(%11592, %11595) : (i64, i64) -> i64
      %11597 = func.call @cc_nil_value() : () -> i64
      %11598 = func.call @cc_cons(%11596, %11597) : (i64, i64) -> i64
      %11599 = func.call @cc_values_pack(%11598) : (i64) -> i64
      func.call @stack_push_pointer(%11596) : (i64) -> ()
      %11600 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%11600) : (i64) -> ()
      %11601 = llvm.mlir.addressof @str991 : !llvm.ptr
      %11602 = arith.constant 9 : i64
      %11603 = func.call @cc_make_string(%11601, %11602) : (!llvm.ptr, i64) -> i64
      %11604 = llvm.mlir.addressof @str992 : !llvm.ptr
      %11605 = arith.constant 11 : i64
      %11606 = func.call @cc_make_string(%11604, %11605) : (!llvm.ptr, i64) -> i64
      %11607 = func.call @cc_intern(%11603, %11606) : (i64, i64) -> i64
      %11608 = func.call @cc_nil_value() : () -> i64
      %11609 = func.call @cc_cons(%11607, %11608) : (i64, i64) -> i64
      %11610 = func.call @cc_values_pack(%11609) : (i64) -> i64
      func.call @stack_push_pointer(%11607) : (i64) -> ()
      %11611 = func.call @stack_pop_pointer() : () -> i64
      %11612 = func.call @stack_pop_pointer() : () -> i64
      %11613 = func.call @cc_cons(%11611, %11612) : (i64, i64) -> i64
      %11614 = llvm.mlir.addressof @str993 : !llvm.ptr
      %11615 = arith.constant 5 : i64
      %11616 = func.call @cc_make_string(%11614, %11615) : (!llvm.ptr, i64) -> i64
      %11617 = func.call @cc_nil_value() : () -> i64
      %11618 = func.call @cc_intern(%11616, %11617) : (i64, i64) -> i64
      %11619 = func.call @cc_nil_value() : () -> i64
      %11620 = func.call @cc_cons(%11618, %11619) : (i64, i64) -> i64
      %11621 = func.call @cc_values_pack(%11620) : (i64) -> i64
      %11622 = func.call @cc_cons(%11618, %11613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11622) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11623 = func.call @stack_pop_pointer() : () -> i64
      %11624 = func.call @stack_pop_pointer() : () -> i64
      %11625 = func.call @cc_cons(%11624, %11623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11625) : (i64) -> ()
      %11626 = func.call @stack_pop_pointer() : () -> i64
      %11627 = func.call @stack_pop_pointer() : () -> i64
      %11628 = func.call @cc_cons(%11627, %11626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11628) : (i64) -> ()
      %11629 = func.call @stack_pop_pointer() : () -> i64
      %11630 = func.call @stack_pop_pointer() : () -> i64
      %11631 = func.call @cc_cons(%11630, %11629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11631) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11632 = func.call @stack_pop_pointer() : () -> i64
      %11633 = func.call @stack_pop_pointer() : () -> i64
      %11634 = func.call @cc_cons(%11633, %11632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11634) : (i64) -> ()
      %11635 = func.call @stack_pop_pointer() : () -> i64
      %11636 = func.call @stack_pop_pointer() : () -> i64
      %11637 = func.call @cc_cons(%11636, %11635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11637) : (i64) -> ()
      %11638 = func.call @stack_pop_pointer() : () -> i64
      %11639 = func.call @stack_pop_pointer() : () -> i64
      %11640 = func.call @cc_cons(%11639, %11638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11640) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11641 = func.call @stack_pop_pointer() : () -> i64
      %11642 = func.call @stack_pop_pointer() : () -> i64
      %11643 = func.call @cc_cons(%11642, %11641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11643) : (i64) -> ()
      %11644 = func.call @stack_pop_pointer() : () -> i64
      %11645 = func.call @stack_pop_pointer() : () -> i64
      %11646 = func.call @cc_cons(%11645, %11644) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11646) : (i64) -> ()
      %11647 = func.call @stack_pop_pointer() : () -> i64
      %11648 = func.call @stack_pop_pointer() : () -> i64
      %11649 = func.call @cc_cons(%11648, %11647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11649) : (i64) -> ()
      %11650 = func.call @stack_pop_pointer() : () -> i64
      %11651 = func.call @stack_pop_pointer() : () -> i64
      %11652 = func.call @cc_cons(%11651, %11650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11652) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11653 = func.call @stack_pop_pointer() : () -> i64
      %11654 = func.call @stack_pop_pointer() : () -> i64
      %11655 = func.call @cc_cons(%11654, %11653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11655) : (i64) -> ()
      %11656 = func.call @stack_pop_pointer() : () -> i64
      %11657 = func.call @stack_pop_pointer() : () -> i64
      %11658 = func.call @cc_cons(%11657, %11656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11658) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11659 = func.call @stack_pop_pointer() : () -> i64
      %11660 = func.call @stack_pop_pointer() : () -> i64
      %11661 = func.call @cc_cons(%11660, %11659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11661) : (i64) -> ()
      %11662 = llvm.mlir.addressof @str994 : !llvm.ptr
      %11663 = arith.constant 13 : i64
      %11664 = func.call @cc_make_string(%11662, %11663) : (!llvm.ptr, i64) -> i64
      %11665 = llvm.mlir.addressof @str995 : !llvm.ptr
      %11666 = arith.constant 11 : i64
      %11667 = func.call @cc_make_string(%11665, %11666) : (!llvm.ptr, i64) -> i64
      %11668 = func.call @cc_intern(%11664, %11667) : (i64, i64) -> i64
      %11669 = func.call @cc_nil_value() : () -> i64
      %11670 = func.call @cc_cons(%11668, %11669) : (i64, i64) -> i64
      %11671 = func.call @cc_values_pack(%11670) : (i64) -> i64
      func.call @stack_push_pointer(%11668) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11672 = func.call @stack_pop_pointer() : () -> i64
      %11673 = func.call @stack_pop_pointer() : () -> i64
      %11674 = func.call @cc_cons(%11673, %11672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11674) : (i64) -> ()
      %11675 = llvm.mlir.addressof @str996 : !llvm.ptr
      %11676 = arith.constant 14 : i64
      %11677 = func.call @cc_make_string(%11675, %11676) : (!llvm.ptr, i64) -> i64
      %11678 = llvm.mlir.addressof @str997 : !llvm.ptr
      %11679 = arith.constant 11 : i64
      %11680 = func.call @cc_make_string(%11678, %11679) : (!llvm.ptr, i64) -> i64
      %11681 = func.call @cc_intern(%11677, %11680) : (i64, i64) -> i64
      %11682 = func.call @cc_nil_value() : () -> i64
      %11683 = func.call @cc_cons(%11681, %11682) : (i64, i64) -> i64
      %11684 = func.call @cc_values_pack(%11683) : (i64) -> i64
      func.call @stack_push_pointer(%11681) : (i64) -> ()
      %11685 = llvm.mlir.addressof @str998 : !llvm.ptr
      %11686 = arith.constant 7 : i64
      %11687 = func.call @cc_make_string(%11685, %11686) : (!llvm.ptr, i64) -> i64
      %11688 = llvm.mlir.addressof @str999 : !llvm.ptr
      %11689 = arith.constant 11 : i64
      %11690 = func.call @cc_make_string(%11688, %11689) : (!llvm.ptr, i64) -> i64
      %11691 = func.call @cc_intern(%11687, %11690) : (i64, i64) -> i64
      %11692 = func.call @cc_nil_value() : () -> i64
      %11693 = func.call @cc_cons(%11691, %11692) : (i64, i64) -> i64
      %11694 = func.call @cc_values_pack(%11693) : (i64) -> i64
      func.call @stack_push_pointer(%11691) : (i64) -> ()
      %11695 = llvm.mlir.addressof @str1000 : !llvm.ptr
      %11696 = arith.constant 7 : i64
      %11697 = func.call @cc_make_string(%11695, %11696) : (!llvm.ptr, i64) -> i64
      %11698 = llvm.mlir.addressof @str1001 : !llvm.ptr
      %11699 = arith.constant 11 : i64
      %11700 = func.call @cc_make_string(%11698, %11699) : (!llvm.ptr, i64) -> i64
      %11701 = func.call @cc_intern(%11697, %11700) : (i64, i64) -> i64
      %11702 = func.call @cc_nil_value() : () -> i64
      %11703 = func.call @cc_cons(%11701, %11702) : (i64, i64) -> i64
      %11704 = func.call @cc_values_pack(%11703) : (i64) -> i64
      func.call @stack_push_pointer(%11701) : (i64) -> ()
      %11705 = llvm.mlir.addressof @str1002 : !llvm.ptr
      %11706 = arith.constant 8 : i64
      %11707 = func.call @cc_make_string(%11705, %11706) : (!llvm.ptr, i64) -> i64
      %11708 = llvm.mlir.addressof @str1003 : !llvm.ptr
      %11709 = arith.constant 11 : i64
      %11710 = func.call @cc_make_string(%11708, %11709) : (!llvm.ptr, i64) -> i64
      %11711 = func.call @cc_intern(%11707, %11710) : (i64, i64) -> i64
      %11712 = func.call @cc_nil_value() : () -> i64
      %11713 = func.call @cc_cons(%11711, %11712) : (i64, i64) -> i64
      %11714 = func.call @cc_values_pack(%11713) : (i64) -> i64
      func.call @stack_push_pointer(%11711) : (i64) -> ()
      %11715 = llvm.mlir.addressof @str1004 : !llvm.ptr
      %11716 = arith.constant 22 : i64
      %11717 = func.call @cc_make_string(%11715, %11716) : (!llvm.ptr, i64) -> i64
      %11718 = llvm.mlir.addressof @str1005 : !llvm.ptr
      %11719 = arith.constant 13 : i64
      %11720 = func.call @cc_make_string(%11718, %11719) : (!llvm.ptr, i64) -> i64
      %11721 = func.call @cc_intern(%11717, %11720) : (i64, i64) -> i64
      %11722 = func.call @cc_nil_value() : () -> i64
      %11723 = func.call @cc_cons(%11721, %11722) : (i64, i64) -> i64
      %11724 = func.call @cc_values_pack(%11723) : (i64) -> i64
      func.call @stack_push_pointer(%11721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11725 = func.call @stack_pop_pointer() : () -> i64
      %11726 = func.call @stack_pop_pointer() : () -> i64
      %11727 = func.call @cc_cons(%11726, %11725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11727) : (i64) -> ()
      %11728 = func.call @stack_pop_pointer() : () -> i64
      %11729 = func.call @stack_pop_pointer() : () -> i64
      %11730 = func.call @cc_cons(%11729, %11728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11730) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11731 = func.call @stack_pop_pointer() : () -> i64
      %11732 = func.call @stack_pop_pointer() : () -> i64
      %11733 = func.call @cc_cons(%11732, %11731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11733) : (i64) -> ()
      %11734 = func.call @stack_pop_pointer() : () -> i64
      %11735 = func.call @stack_pop_pointer() : () -> i64
      %11736 = func.call @cc_cons(%11735, %11734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11736) : (i64) -> ()
      %11737 = llvm.mlir.addressof @str1006 : !llvm.ptr
      %11738 = arith.constant 5 : i64
      %11739 = func.call @cc_make_string(%11737, %11738) : (!llvm.ptr, i64) -> i64
      %11740 = llvm.mlir.addressof @str1007 : !llvm.ptr
      %11741 = arith.constant 11 : i64
      %11742 = func.call @cc_make_string(%11740, %11741) : (!llvm.ptr, i64) -> i64
      %11743 = func.call @cc_intern(%11739, %11742) : (i64, i64) -> i64
      %11744 = func.call @cc_nil_value() : () -> i64
      %11745 = func.call @cc_cons(%11743, %11744) : (i64, i64) -> i64
      %11746 = func.call @cc_values_pack(%11745) : (i64) -> i64
      func.call @stack_push_pointer(%11743) : (i64) -> ()
      %11747 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%11747) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11748 = func.call @stack_pop_pointer() : () -> i64
      %11749 = func.call @stack_pop_pointer() : () -> i64
      %11750 = func.call @cc_cons(%11749, %11748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11750) : (i64) -> ()
      %11751 = func.call @stack_pop_pointer() : () -> i64
      %11752 = func.call @stack_pop_pointer() : () -> i64
      %11753 = func.call @cc_cons(%11752, %11751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11753) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11754 = func.call @stack_pop_pointer() : () -> i64
      %11755 = func.call @stack_pop_pointer() : () -> i64
      %11756 = func.call @cc_cons(%11755, %11754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11756) : (i64) -> ()
      %11757 = func.call @stack_pop_pointer() : () -> i64
      %11758 = func.call @stack_pop_pointer() : () -> i64
      %11759 = func.call @cc_cons(%11758, %11757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11759) : (i64) -> ()
      %11760 = func.call @stack_pop_pointer() : () -> i64
      %11761 = func.call @stack_pop_pointer() : () -> i64
      %11762 = func.call @cc_cons(%11761, %11760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11762) : (i64) -> ()
      %11763 = llvm.mlir.addressof @str1008 : !llvm.ptr
      %11764 = arith.constant 15 : i64
      %11765 = func.call @cc_make_string(%11763, %11764) : (!llvm.ptr, i64) -> i64
      %11766 = llvm.mlir.addressof @str1009 : !llvm.ptr
      %11767 = arith.constant 11 : i64
      %11768 = func.call @cc_make_string(%11766, %11767) : (!llvm.ptr, i64) -> i64
      %11769 = func.call @cc_intern(%11765, %11768) : (i64, i64) -> i64
      %11770 = func.call @cc_nil_value() : () -> i64
      %11771 = func.call @cc_cons(%11769, %11770) : (i64, i64) -> i64
      %11772 = func.call @cc_values_pack(%11771) : (i64) -> i64
      func.call @stack_push_pointer(%11769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11773 = func.call @stack_pop_pointer() : () -> i64
      %11774 = func.call @stack_pop_pointer() : () -> i64
      %11775 = func.call @cc_cons(%11774, %11773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11775) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11776 = func.call @stack_pop_pointer() : () -> i64
      %11777 = func.call @stack_pop_pointer() : () -> i64
      %11778 = func.call @cc_cons(%11777, %11776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11778) : (i64) -> ()
      %11779 = func.call @stack_pop_pointer() : () -> i64
      %11780 = func.call @stack_pop_pointer() : () -> i64
      %11781 = func.call @cc_cons(%11780, %11779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11781) : (i64) -> ()
      %11782 = func.call @stack_pop_pointer() : () -> i64
      %11783 = func.call @stack_pop_pointer() : () -> i64
      %11784 = func.call @cc_cons(%11783, %11782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11784) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11785 = func.call @stack_pop_pointer() : () -> i64
      %11786 = func.call @stack_pop_pointer() : () -> i64
      %11787 = func.call @cc_cons(%11786, %11785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11787) : (i64) -> ()
      %11788 = func.call @stack_pop_pointer() : () -> i64
      %11789 = func.call @stack_pop_pointer() : () -> i64
      %11790 = func.call @cc_cons(%11789, %11788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11790) : (i64) -> ()
      %11791 = func.call @stack_pop_pointer() : () -> i64
      %11792 = func.call @stack_pop_pointer() : () -> i64
      %11793 = func.call @cc_cons(%11792, %11791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11793) : (i64) -> ()
      %11794 = func.call @stack_pop_pointer() : () -> i64
      %11795 = func.call @stack_pop_pointer() : () -> i64
      %11796 = func.call @cc_cons(%11795, %11794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11796) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11797 = func.call @stack_pop_pointer() : () -> i64
      %11798 = func.call @stack_pop_pointer() : () -> i64
      %11799 = func.call @cc_cons(%11798, %11797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11799) : (i64) -> ()
      %11800 = func.call @stack_pop_pointer() : () -> i64
      %11801 = func.call @stack_pop_pointer() : () -> i64
      %11802 = func.call @cc_cons(%11801, %11800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11802) : (i64) -> ()
      %11803 = func.call @stack_pop_pointer() : () -> i64
      %11804 = func.call @stack_pop_pointer() : () -> i64
      %11805 = func.call @cc_cons(%11804, %11803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11805) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11806 = func.call @stack_pop_pointer() : () -> i64
      %11807 = func.call @stack_pop_pointer() : () -> i64
      %11808 = func.call @cc_cons(%11807, %11806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11808) : (i64) -> ()
      %11809 = func.call @stack_pop_pointer() : () -> i64
      %11810 = func.call @stack_pop_pointer() : () -> i64
      %11811 = func.call @cc_cons(%11810, %11809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11811) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11812 = func.call @stack_pop_pointer() : () -> i64
      %11813 = func.call @stack_pop_pointer() : () -> i64
      %11814 = func.call @cc_cons(%11813, %11812) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11814) : (i64) -> ()
      %11815 = func.call @stack_pop_pointer() : () -> i64
      %11816 = func.call @stack_pop_pointer() : () -> i64
      %11817 = func.call @cc_cons(%11816, %11815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11817) : (i64) -> ()
      %11818 = func.call @stack_pop_pointer() : () -> i64
      %12005 = arith.constant 97047688511584 : i64
      %12006 = arith.constant 0 : i64
      %12007 = func.call @cc_make_closure(%12005, %12006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%12007) : (i64) -> ()
      %12008 = func.call @stack_pop_pointer() : () -> i64
      %12009 = llvm.mlir.addressof @str1024 : !llvm.ptr
      %12010 = arith.constant 1 : i64
      %12011 = func.call @cc_make_string(%12009, %12010) : (!llvm.ptr, i64) -> i64
      %12012 = func.call @cc_nil_value() : () -> i64
      %12013 = func.call @cc_intern(%12011, %12012) : (i64, i64) -> i64
      %12014 = func.call @cc_nil_value() : () -> i64
      %12015 = func.call @cc_cons(%12013, %12014) : (i64, i64) -> i64
      %12016 = func.call @cc_values_pack(%12015) : (i64) -> i64
      func.call @stack_push_pointer(%12013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %12017 = func.call @stack_pop_pointer() : () -> i64
      %12018 = func.call @stack_pop_pointer() : () -> i64
      %12019 = func.call @cc_cons(%12018, %12017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%12019) : (i64) -> ()
      %12020 = func.call @stack_pop_pointer() : () -> i64
      %12021 = llvm.mlir.addressof @str1025 : !llvm.ptr
      %12022 = arith.constant 11 : i64
      %12023 = func.call @cc_make_string(%12021, %12022) : (!llvm.ptr, i64) -> i64
      %12024 = llvm.mlir.addressof @str1026 : !llvm.ptr
      %12025 = arith.constant 7 : i64
      %12026 = func.call @cc_make_string(%12024, %12025) : (!llvm.ptr, i64) -> i64
      %12027 = func.call @cc_intern(%12023, %12026) : (i64, i64) -> i64
      %12028 = func.call @cc_nil_value() : () -> i64
      %12029 = func.call @cc_cons(%12027, %12028) : (i64, i64) -> i64
      %12030 = func.call @cc_values_pack(%12029) : (i64) -> i64
      func.call @stack_push_pointer(%12027) : (i64) -> ()
      %12031 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %12032 = func.call @stack_pop_pointer() : () -> i64
      %12033 = llvm.mlir.addressof @str1027 : !llvm.ptr
      %12034 = arith.constant 4 : i64
      %12035 = func.call @cc_make_string(%12033, %12034) : (!llvm.ptr, i64) -> i64
      %12036 = llvm.mlir.addressof @str1028 : !llvm.ptr
      %12037 = arith.constant 7 : i64
      %12038 = func.call @cc_make_string(%12036, %12037) : (!llvm.ptr, i64) -> i64
      %12039 = func.call @cc_intern(%12035, %12038) : (i64, i64) -> i64
      %12040 = func.call @cc_nil_value() : () -> i64
      %12041 = func.call @cc_cons(%12039, %12040) : (i64, i64) -> i64
      %12042 = func.call @cc_values_pack(%12041) : (i64) -> i64
      func.call @stack_push_pointer(%12039) : (i64) -> ()
      %12043 = func.call @stack_pop_pointer() : () -> i64
      %12044 = llvm.mlir.addressof @str1029 : !llvm.ptr
      %12045 = arith.constant 6 : i64
      %12046 = func.call @cc_make_string(%12044, %12045) : (!llvm.ptr, i64) -> i64
      %12047 = func.call @cc_nil_value() : () -> i64
      %12048 = func.call @cc_intern(%12046, %12047) : (i64, i64) -> i64
      %12049 = func.call @cc_nil_value() : () -> i64
      %12050 = func.call @cc_cons(%12048, %12049) : (i64, i64) -> i64
      %12051 = func.call @cc_values_pack(%12050) : (i64) -> i64
      func.call @stack_push_pointer(%12048) : (i64) -> ()
      %12052 = func.call @stack_pop_pointer() : () -> i64
      %12053 = func.call @cc_nil_value() : () -> i64
      %12054 = func.call @cc_errorp(%11457) : (i64) -> i64
      %12055 = arith.cmpi ne, %12054, %12053 : i64
      %12056 = arith.cmpi eq, %12053, %12053 : i64
      %12057 = arith.andi %12055, %12056 : i1
      %12058 = scf.if %12057 -> (i64) {
        scf.yield %11457 : i64
      } else {
        scf.yield %12053 : i64
      }
      %12059 = func.call @cc_errorp(%11818) : (i64) -> i64
      %12060 = arith.cmpi ne, %12059, %12053 : i64
      %12061 = arith.cmpi eq, %12058, %12053 : i64
      %12062 = arith.andi %12060, %12061 : i1
      %12063 = scf.if %12062 -> (i64) {
        scf.yield %11818 : i64
      } else {
        scf.yield %12058 : i64
      }
      %12064 = func.call @cc_errorp(%12008) : (i64) -> i64
      %12065 = arith.cmpi ne, %12064, %12053 : i64
      %12066 = arith.cmpi eq, %12063, %12053 : i64
      %12067 = arith.andi %12065, %12066 : i1
      %12068 = scf.if %12067 -> (i64) {
        scf.yield %12008 : i64
      } else {
        scf.yield %12063 : i64
      }
      %12069 = func.call @cc_errorp(%12020) : (i64) -> i64
      %12070 = arith.cmpi ne, %12069, %12053 : i64
      %12071 = arith.cmpi eq, %12068, %12053 : i64
      %12072 = arith.andi %12070, %12071 : i1
      %12073 = scf.if %12072 -> (i64) {
        scf.yield %12020 : i64
      } else {
        scf.yield %12068 : i64
      }
      %12074 = func.call @cc_errorp(%12031) : (i64) -> i64
      %12075 = arith.cmpi ne, %12074, %12053 : i64
      %12076 = arith.cmpi eq, %12073, %12053 : i64
      %12077 = arith.andi %12075, %12076 : i1
      %12078 = scf.if %12077 -> (i64) {
        scf.yield %12031 : i64
      } else {
        scf.yield %12073 : i64
      }
      %12079 = func.call @cc_errorp(%12032) : (i64) -> i64
      %12080 = arith.cmpi ne, %12079, %12053 : i64
      %12081 = arith.cmpi eq, %12078, %12053 : i64
      %12082 = arith.andi %12080, %12081 : i1
      %12083 = scf.if %12082 -> (i64) {
        scf.yield %12032 : i64
      } else {
        scf.yield %12078 : i64
      }
      %12084 = func.call @cc_errorp(%12043) : (i64) -> i64
      %12085 = arith.cmpi ne, %12084, %12053 : i64
      %12086 = arith.cmpi eq, %12083, %12053 : i64
      %12087 = arith.andi %12085, %12086 : i1
      %12088 = scf.if %12087 -> (i64) {
        scf.yield %12043 : i64
      } else {
        scf.yield %12083 : i64
      }
      %12089 = func.call @cc_errorp(%12052) : (i64) -> i64
      %12090 = arith.cmpi ne, %12089, %12053 : i64
      %12091 = arith.cmpi eq, %12088, %12053 : i64
      %12092 = arith.andi %12090, %12091 : i1
      %12093 = scf.if %12092 -> (i64) {
        scf.yield %12052 : i64
      } else {
        scf.yield %12088 : i64
      }
      %12094 = arith.cmpi ne, %12093, %12053 : i64
      scf.if %12094 {
        func.call @stack_push_pointer(%12093) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%11457) : (i64) -> ()
        func.call @stack_push_pointer(%11818) : (i64) -> ()
        func.call @stack_push_pointer(%12008) : (i64) -> ()
        func.call @stack_push_pointer(%12020) : (i64) -> ()
        func.call @stack_push_pointer(%12031) : (i64) -> ()
        func.call @stack_push_pointer(%12032) : (i64) -> ()
        func.call @stack_push_pointer(%12043) : (i64) -> ()
        func.call @stack_push_pointer(%12052) : (i64) -> ()
        %12095 = llvm.mlir.addressof @str1030 : !llvm.ptr
        %12096 = func.call @cc_make_function_ref_const(%12095) : (!llvm.ptr) -> i64
        %12097 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%12096, %12097) : (i64, i64) -> ()
      }
      %12098 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %12098 : i64
    }
    func.call @stack_push_pointer(%11448) : (i64) -> ()
    %12099 = func.call @stack_pop_pointer() : () -> i64
    %12100 = func.call @cc_multiple_value_list(%12099) : (i64) -> i64
    %12101 = llvm.mlir.addressof @str1031 : !llvm.ptr
    %12102 = arith.constant 37 : i64
    %12103 = func.call @cc_make_string(%12101, %12102) : (!llvm.ptr, i64) -> i64
    %12104 = func.call @cc_nil_value() : () -> i64
    %12105 = func.call @cc_intern(%12103, %12104) : (i64, i64) -> i64
    %12106 = func.call @cc_nil_value() : () -> i64
    %12107 = func.call @cc_cons(%12105, %12106) : (i64, i64) -> i64
    %12108 = func.call @cc_values_pack(%12107) : (i64) -> i64
    %12109 = func.call @cc_symbol_value(%12105) : (i64) -> i64
    %12110 = llvm.mlir.addressof @str1032 : !llvm.ptr
    %12111 = arith.constant 39 : i64
    %12112 = func.call @cc_make_string(%12110, %12111) : (!llvm.ptr, i64) -> i64
    %12113 = func.call @cc_nil_value() : () -> i64
    %12114 = func.call @cc_intern(%12112, %12113) : (i64, i64) -> i64
    %12115 = func.call @cc_nil_value() : () -> i64
    %12116 = func.call @cc_cons(%12114, %12115) : (i64, i64) -> i64
    %12117 = func.call @cc_values_pack(%12116) : (i64) -> i64
    %12118 = func.call @cc_symbol_value(%12114) : (i64) -> i64
    %12119 = func.call @cc_nil_value() : () -> i64
    %12120 = arith.cmpi ne, %12109, %12119 : i64
    %12121 = scf.if %12120 -> (i64) {
      scf.yield %12118 : i64
    } else {
      scf.yield %12100 : i64
    }
    %12122 = func.call @cc_values_pack(%12121) : (i64) -> i64
    func.call @stack_push_pointer(%12122) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511492"() {
    %218 = func.call @stack_pop_pointer() : () -> i64
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_nil_value() : () -> i64
    %221 = func.call @cc_errorp(%219) : (i64) -> i64
    %222 = arith.cmpi ne, %221, %220 : i64
    %223 = scf.if %222 -> (i64) {
      scf.yield %219 : i64
    } else {
      %224 = func.call @cc_symbol_value(%218) : (i64) -> i64
      func.call @stack_push_pointer(%224) : (i64) -> ()
      %225 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %226 = func.call @stack_pop_pointer() : () -> i64
      %227 = func.call @cc_nil_value() : () -> i64
      %228 = func.call @cc_errorp(%225) : (i64) -> i64
      %229 = arith.cmpi ne, %228, %227 : i64
      %230 = arith.cmpi eq, %227, %227 : i64
      %231 = arith.andi %229, %230 : i1
      %232 = scf.if %231 -> (i64) {
        scf.yield %225 : i64
      } else {
        scf.yield %227 : i64
      }
      %233 = func.call @cc_errorp(%226) : (i64) -> i64
      %234 = arith.cmpi ne, %233, %227 : i64
      %235 = arith.cmpi eq, %232, %227 : i64
      %236 = arith.andi %234, %235 : i1
      %237 = scf.if %236 -> (i64) {
        scf.yield %226 : i64
      } else {
        scf.yield %232 : i64
      }
      %238 = arith.cmpi ne, %237, %227 : i64
      scf.if %238 {
        func.call @stack_push_pointer(%237) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%225) : (i64) -> ()
        func.call @stack_push_pointer(%226) : (i64) -> ()
        %239 = llvm.mlir.addressof @str22 : !llvm.ptr
        %240 = func.call @cc_make_function_ref_const(%239) : (!llvm.ptr) -> i64
        %241 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%240, %241) : (i64, i64) -> ()
      }
      %242 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %242 : i64
    }
    func.call @stack_push_pointer(%223) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511495"() {
    %501 = func.call @cc_nil_value() : () -> i64
    %502 = func.call @cc_nil_value() : () -> i64
    %503 = func.call @cc_errorp(%501) : (i64) -> i64
    %504 = arith.cmpi ne, %503, %502 : i64
    %505 = scf.if %504 -> (i64) {
      scf.yield %501 : i64
    } else {
      %506 = func.call @cc_make_string_output_stream() : () -> i64
      %507 = llvm.mlir.addressof @str45 : !llvm.ptr
      %508 = arith.constant 6 : i64
      %509 = func.call @cc_make_string(%507, %508) : (!llvm.ptr, i64) -> i64
      %510 = llvm.mlir.addressof @str46 : !llvm.ptr
      %511 = arith.constant 7 : i64
      %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
      %513 = func.call @cc_intern(%509, %512) : (i64, i64) -> i64
      %514 = func.call @cc_nil_value() : () -> i64
      %515 = func.call @cc_cons(%513, %514) : (i64, i64) -> i64
      %516 = func.call @cc_values_pack(%515) : (i64) -> i64
      func.call @stack_push_pointer(%513) : (i64) -> ()
      %517 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %518 = func.call @stack_pop_pointer() : () -> i64
      %519 = func.call @cc_nil_value() : () -> i64
      %520 = func.call @cc_errorp(%517) : (i64) -> i64
      %521 = arith.cmpi ne, %520, %519 : i64
      %522 = arith.cmpi eq, %519, %519 : i64
      %523 = arith.andi %521, %522 : i1
      %524 = scf.if %523 -> (i64) {
        scf.yield %517 : i64
      } else {
        scf.yield %519 : i64
      }
      %525 = func.call @cc_errorp(%518) : (i64) -> i64
      %526 = arith.cmpi ne, %525, %519 : i64
      %527 = arith.cmpi eq, %524, %519 : i64
      %528 = arith.andi %526, %527 : i1
      %529 = scf.if %528 -> (i64) {
        scf.yield %518 : i64
      } else {
        scf.yield %524 : i64
      }
      %530 = arith.cmpi ne, %529, %519 : i64
      scf.if %530 {
        func.call @stack_push_pointer(%529) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%517) : (i64) -> ()
        func.call @stack_push_pointer(%518) : (i64) -> ()
        %531 = llvm.mlir.addressof @str47 : !llvm.ptr
        %532 = func.call @cc_make_function_ref_const(%531) : (!llvm.ptr) -> i64
        %533 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%532, %533) : (i64, i64) -> ()
      }
      %534 = func.call @stack_pop_pointer() : () -> i64
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_errorp(%534) : (i64) -> i64
      %537 = arith.cmpi ne, %536, %535 : i64
      %538 = scf.if %537 -> (i64) {
        scf.yield %534 : i64
      } else {
        %539 = func.call @cc_get_output_stream_string(%506) : (i64) -> i64
        scf.yield %539 : i64
      }
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %540 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %541 = func.call @stack_pop_pointer() : () -> i64
      %542 = func.call @cc_cons(%540, %541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = func.call @cc_values_pack(%543) : (i64) -> i64
      func.call @stack_push_pointer(%544) : (i64) -> ()
      %545 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %545 : i64
    }
    func.call @stack_push_pointer(%505) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511499"() {
    %1064 = func.call @stack_pop_pointer() : () -> i64
    %1065 = func.call @cc_nil_value() : () -> i64
    %1066 = func.call @cc_nil_value() : () -> i64
    %1067 = func.call @cc_errorp(%1065) : (i64) -> i64
    %1068 = arith.cmpi ne, %1067, %1066 : i64
    %1069 = scf.if %1068 -> (i64) {
      scf.yield %1065 : i64
    } else {
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_errorp(%1070) : (i64) -> i64
      %1073 = arith.cmpi ne, %1072, %1071 : i64
      %1074 = arith.cmpi eq, %1071, %1071 : i64
      %1075 = arith.andi %1073, %1074 : i1
      %1076 = scf.if %1075 -> (i64) {
        scf.yield %1070 : i64
      } else {
        scf.yield %1071 : i64
      }
      %1077 = arith.cmpi ne, %1076, %1071 : i64
      scf.if %1077 {
        func.call @stack_push_pointer(%1076) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1070) : (i64) -> ()
        %1078 = llvm.mlir.addressof @str95 : !llvm.ptr
        %1079 = func.call @cc_make_function_ref_const(%1078) : (!llvm.ptr) -> i64
        %1080 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1079, %1080) : (i64, i64) -> ()
      }
      %1081 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1082 = arith.constant 32 : i64
      %1083 = func.call @cc_make_string(%1081, %1082) : (!llvm.ptr, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_intern(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_cons(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_values_pack(%1087) : (i64) -> i64
      func.call @stack_push_pointer(%1085) : (i64) -> ()
      %1089 = func.call @stack_pop_pointer() : () -> i64
      %1090 = func.call @stack_pop_pointer() : () -> i64
      %1091 = func.call @cc_eq(%1090, %1089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1091) : (i64) -> ()
      %1092 = func.call @stack_pop_pointer() : () -> i64
      %1093 = func.call @cc_nil_value() : () -> i64
      %1094 = arith.cmpi ne, %1092, %1093 : i64
      scf.if %1094 {
        %1095 = func.call @cc_nil_value() : () -> i64
        %1096 = func.call @cc_nil_value() : () -> i64
        %1097 = func.call @cc_errorp(%1095) : (i64) -> i64
        %1098 = arith.cmpi ne, %1097, %1096 : i64
        %1099 = scf.if %1098 -> (i64) {
          scf.yield %1095 : i64
        } else {
          %1100 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%1100) : (i64) -> ()
          %1101 = func.call @stack_pop_pointer() : () -> i64
          %1102 = func.call @cc_multiple_value_list(%1101) : (i64) -> i64
          %1103 = func.call @cc_t_value() : () -> i64
          %1104 = llvm.mlir.addressof @str97 : !llvm.ptr
          %1105 = arith.constant 37 : i64
          %1106 = func.call @cc_make_string(%1104, %1105) : (!llvm.ptr, i64) -> i64
          %1107 = func.call @cc_nil_value() : () -> i64
          %1108 = func.call @cc_intern(%1106, %1107) : (i64, i64) -> i64
          %1109 = func.call @cc_nil_value() : () -> i64
          %1110 = func.call @cc_cons(%1108, %1109) : (i64, i64) -> i64
          %1111 = func.call @cc_values_pack(%1110) : (i64) -> i64
          %1112 = func.call @cc_set_symbol_value(%1108, %1103) : (i64, i64) -> i64
          %1113 = llvm.mlir.addressof @str98 : !llvm.ptr
          %1114 = arith.constant 38 : i64
          %1115 = func.call @cc_make_string(%1113, %1114) : (!llvm.ptr, i64) -> i64
          %1116 = func.call @cc_nil_value() : () -> i64
          %1117 = func.call @cc_intern(%1115, %1116) : (i64, i64) -> i64
          %1118 = func.call @cc_nil_value() : () -> i64
          %1119 = func.call @cc_cons(%1117, %1118) : (i64, i64) -> i64
          %1120 = func.call @cc_values_pack(%1119) : (i64) -> i64
          %1121 = func.call @cc_set_symbol_value(%1117, %1101) : (i64, i64) -> i64
          %1122 = llvm.mlir.addressof @str99 : !llvm.ptr
          %1123 = arith.constant 39 : i64
          %1124 = func.call @cc_make_string(%1122, %1123) : (!llvm.ptr, i64) -> i64
          %1125 = func.call @cc_nil_value() : () -> i64
          %1126 = func.call @cc_intern(%1124, %1125) : (i64, i64) -> i64
          %1127 = func.call @cc_nil_value() : () -> i64
          %1128 = func.call @cc_cons(%1126, %1127) : (i64, i64) -> i64
          %1129 = func.call @cc_values_pack(%1128) : (i64) -> i64
          %1130 = func.call @cc_set_symbol_value(%1126, %1102) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1101) : (i64) -> ()
          %1131 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1131 : i64
        }
        func.call @stack_push_pointer(%1099) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1132 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1132 : i64
    }
    func.call @stack_push_pointer(%1069) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511498"() {
    %1051 = func.call @stack_pop_pointer() : () -> i64
    %1052 = func.call @cc_nil_value() : () -> i64
    %1053 = func.call @cc_nil_value() : () -> i64
    %1054 = func.call @cc_errorp(%1052) : (i64) -> i64
    %1055 = arith.cmpi ne, %1054, %1053 : i64
    %1056 = scf.if %1055 -> (i64) {
      scf.yield %1052 : i64
    } else {
      %1057 = func.call @cc_t_value() : () -> i64
      %1058 = func.call @cc_debug_current_stack(%1057) : (i64) -> i64
      %1059 = func.call @cc_nil_value() : () -> i64
      %1060 = func.call @cc_nil_value() : () -> i64
      %1061 = func.call @cc_errorp(%1059) : (i64) -> i64
      %1062 = arith.cmpi ne, %1061, %1060 : i64
      %1063 = scf.if %1062 -> (i64) {
        scf.yield %1059 : i64
      } else {
        %1133 = arith.constant 97047688511499 : i64
        %1134 = arith.constant 0 : i64
        %1135 = func.call @cc_make_closure(%1133, %1134) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1135) : (i64) -> ()
        %1136 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1058) : (i64) -> ()
        %1137 = func.call @stack_pop_pointer() : () -> i64
        %1138 = func.call @cc_nil_value() : () -> i64
        %1139 = func.call @cc_errorp(%1136) : (i64) -> i64
        %1140 = arith.cmpi ne, %1139, %1138 : i64
        %1141 = arith.cmpi eq, %1138, %1138 : i64
        %1142 = arith.andi %1140, %1141 : i1
        %1143 = scf.if %1142 -> (i64) {
          scf.yield %1136 : i64
        } else {
          scf.yield %1138 : i64
        }
        %1144 = func.call @cc_errorp(%1137) : (i64) -> i64
        %1145 = arith.cmpi ne, %1144, %1138 : i64
        %1146 = arith.cmpi eq, %1143, %1138 : i64
        %1147 = arith.andi %1145, %1146 : i1
        %1148 = scf.if %1147 -> (i64) {
          scf.yield %1137 : i64
        } else {
          scf.yield %1143 : i64
        }
        %1149 = arith.cmpi ne, %1148, %1138 : i64
        scf.if %1149 {
          func.call @stack_push_pointer(%1148) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1136) : (i64) -> ()
          func.call @stack_push_pointer(%1137) : (i64) -> ()
          %1150 = llvm.mlir.addressof @str100 : !llvm.ptr
          %1151 = func.call @cc_make_function_ref_const(%1150) : (!llvm.ptr) -> i64
          %1152 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1151, %1152) : (i64, i64) -> ()
        }
        %1153 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1153 : i64
      }
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1154 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1154 : i64
    }
    func.call @stack_push_pointer(%1056) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511496"() {
    %1017 = func.call @stack_pop_pointer() : () -> i64
    %1018 = func.call @cc_nil_value() : () -> i64
    %1019 = func.call @cc_nil_value() : () -> i64
    %1020 = func.call @cc_errorp(%1018) : (i64) -> i64
    %1021 = arith.cmpi ne, %1020, %1019 : i64
    %1022 = scf.if %1021 -> (i64) {
      scf.yield %1018 : i64
    } else {
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1025 = arith.constant 37 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = func.call @cc_nil_value() : () -> i64
      %1028 = func.call @cc_intern(%1026, %1027) : (i64, i64) -> i64
      %1029 = func.call @cc_nil_value() : () -> i64
      %1030 = func.call @cc_cons(%1028, %1029) : (i64, i64) -> i64
      %1031 = func.call @cc_values_pack(%1030) : (i64) -> i64
      %1032 = func.call @cc_set_symbol_value(%1028, %1023) : (i64, i64) -> i64
      %1033 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1034 = arith.constant 38 : i64
      %1035 = func.call @cc_make_string(%1033, %1034) : (!llvm.ptr, i64) -> i64
      %1036 = func.call @cc_nil_value() : () -> i64
      %1037 = func.call @cc_intern(%1035, %1036) : (i64, i64) -> i64
      %1038 = func.call @cc_nil_value() : () -> i64
      %1039 = func.call @cc_cons(%1037, %1038) : (i64, i64) -> i64
      %1040 = func.call @cc_values_pack(%1039) : (i64) -> i64
      %1041 = func.call @cc_set_symbol_value(%1037, %1023) : (i64, i64) -> i64
      %1042 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1043 = arith.constant 39 : i64
      %1044 = func.call @cc_make_string(%1042, %1043) : (!llvm.ptr, i64) -> i64
      %1045 = func.call @cc_nil_value() : () -> i64
      %1046 = func.call @cc_intern(%1044, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      %1050 = func.call @cc_set_symbol_value(%1046, %1023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1017) : (i64) -> ()
      %1155 = arith.constant 97047688511498 : i64
      %1156 = arith.constant 1 : i64
      %1157 = func.call @cc_make_closure(%1155, %1156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1157) : (i64) -> ()
      %1158 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1159 = func.call @stack_pop_pointer() : () -> i64
      %1160 = func.call @cc_nil_value() : () -> i64
      %1161 = func.call @cc_errorp(%1158) : (i64) -> i64
      %1162 = arith.cmpi ne, %1161, %1160 : i64
      %1163 = arith.cmpi eq, %1160, %1160 : i64
      %1164 = arith.andi %1162, %1163 : i1
      %1165 = scf.if %1164 -> (i64) {
        scf.yield %1158 : i64
      } else {
        scf.yield %1160 : i64
      }
      %1166 = func.call @cc_errorp(%1159) : (i64) -> i64
      %1167 = arith.cmpi ne, %1166, %1160 : i64
      %1168 = arith.cmpi eq, %1165, %1160 : i64
      %1169 = arith.andi %1167, %1168 : i1
      %1170 = scf.if %1169 -> (i64) {
        scf.yield %1159 : i64
      } else {
        scf.yield %1165 : i64
      }
      %1171 = arith.cmpi ne, %1170, %1160 : i64
      scf.if %1171 {
        func.call @stack_push_pointer(%1170) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1158) : (i64) -> ()
        func.call @stack_push_pointer(%1159) : (i64) -> ()
        %1172 = llvm.mlir.addressof @str101 : !llvm.ptr
        %1173 = func.call @cc_make_function_ref_const(%1172) : (!llvm.ptr) -> i64
        %1174 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1173, %1174) : (i64, i64) -> ()
      }
      %1175 = func.call @stack_pop_pointer() : () -> i64
      %1176 = func.call @cc_multiple_value_list(%1175) : (i64) -> i64
      %1177 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1178 = arith.constant 37 : i64
      %1179 = func.call @cc_make_string(%1177, %1178) : (!llvm.ptr, i64) -> i64
      %1180 = func.call @cc_nil_value() : () -> i64
      %1181 = func.call @cc_intern(%1179, %1180) : (i64, i64) -> i64
      %1182 = func.call @cc_nil_value() : () -> i64
      %1183 = func.call @cc_cons(%1181, %1182) : (i64, i64) -> i64
      %1184 = func.call @cc_values_pack(%1183) : (i64) -> i64
      %1185 = func.call @cc_symbol_value(%1181) : (i64) -> i64
      %1186 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1187 = arith.constant 38 : i64
      %1188 = func.call @cc_make_string(%1186, %1187) : (!llvm.ptr, i64) -> i64
      %1189 = func.call @cc_nil_value() : () -> i64
      %1190 = func.call @cc_intern(%1188, %1189) : (i64, i64) -> i64
      %1191 = func.call @cc_nil_value() : () -> i64
      %1192 = func.call @cc_cons(%1190, %1191) : (i64, i64) -> i64
      %1193 = func.call @cc_values_pack(%1192) : (i64) -> i64
      %1194 = func.call @cc_symbol_value(%1190) : (i64) -> i64
      %1195 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1196 = arith.constant 39 : i64
      %1197 = func.call @cc_make_string(%1195, %1196) : (!llvm.ptr, i64) -> i64
      %1198 = func.call @cc_nil_value() : () -> i64
      %1199 = func.call @cc_intern(%1197, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_nil_value() : () -> i64
      %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
      %1202 = func.call @cc_values_pack(%1201) : (i64) -> i64
      %1203 = func.call @cc_symbol_value(%1199) : (i64) -> i64
      %1204 = func.call @cc_nil_value() : () -> i64
      %1205 = arith.cmpi ne, %1185, %1204 : i64
      %1206 = scf.if %1205 -> (i64) {
        scf.yield %1203 : i64
      } else {
        scf.yield %1176 : i64
      }
      %1207 = func.call @cc_values_pack(%1206) : (i64) -> i64
      func.call @stack_push_pointer(%1207) : (i64) -> ()
      %1208 = func.call @stack_pop_pointer() : () -> i64
      %1209 = func.call @cc_nil_value() : () -> i64
      %1210 = func.call @cc_cons(%1208, %1209) : (i64, i64) -> i64
      %1211 = func.call @cc_not(%1210) : (i64) -> i64
      func.call @stack_push_pointer(%1211) : (i64) -> ()
      %1212 = func.call @stack_pop_pointer() : () -> i64
      %1213 = func.call @cc_nil_value() : () -> i64
      %1214 = func.call @cc_cons(%1212, %1213) : (i64, i64) -> i64
      %1215 = func.call @cc_not(%1214) : (i64) -> i64
      func.call @stack_push_pointer(%1215) : (i64) -> ()
      %1216 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1216 : i64
    }
    func.call @stack_push_pointer(%1022) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511505"() {
    %1792 = func.call @stack_pop_pointer() : () -> i64
    %1793 = func.call @stack_pop_pointer() : () -> i64
    %1794 = func.call @cc_nil_value() : () -> i64
    %1795 = func.call @cc_nil_value() : () -> i64
    %1796 = func.call @cc_errorp(%1794) : (i64) -> i64
    %1797 = arith.cmpi ne, %1796, %1795 : i64
    %1798 = scf.if %1797 -> (i64) {
      scf.yield %1794 : i64
    } else {
      func.call @stack_push_pointer(%1792) : (i64) -> ()
      %1799 = func.call @stack_pop_pointer() : () -> i64
      %1800 = func.call @cc_nil_value() : () -> i64
      %1801 = func.call @cc_errorp(%1799) : (i64) -> i64
      %1802 = arith.cmpi ne, %1801, %1800 : i64
      %1803 = arith.cmpi eq, %1800, %1800 : i64
      %1804 = arith.andi %1802, %1803 : i1
      %1805 = scf.if %1804 -> (i64) {
        scf.yield %1799 : i64
      } else {
        scf.yield %1800 : i64
      }
      %1806 = arith.cmpi ne, %1805, %1800 : i64
      scf.if %1806 {
        func.call @stack_push_pointer(%1805) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1799) : (i64) -> ()
        %1807 = llvm.mlir.addressof @str160 : !llvm.ptr
        %1808 = func.call @cc_make_function_ref_const(%1807) : (!llvm.ptr) -> i64
        %1809 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1808, %1809) : (i64, i64) -> ()
      }
      %1810 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1811 = arith.constant 32 : i64
      %1812 = func.call @cc_make_string(%1810, %1811) : (!llvm.ptr, i64) -> i64
      %1813 = func.call @cc_nil_value() : () -> i64
      %1814 = func.call @cc_intern(%1812, %1813) : (i64, i64) -> i64
      %1815 = func.call @cc_nil_value() : () -> i64
      %1816 = func.call @cc_cons(%1814, %1815) : (i64, i64) -> i64
      %1817 = func.call @cc_values_pack(%1816) : (i64) -> i64
      func.call @stack_push_pointer(%1814) : (i64) -> ()
      %1818 = func.call @stack_pop_pointer() : () -> i64
      %1819 = func.call @stack_pop_pointer() : () -> i64
      %1820 = func.call @cc_eq(%1819, %1818) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1820) : (i64) -> ()
      %1821 = func.call @stack_pop_pointer() : () -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = arith.cmpi ne, %1821, %1822 : i64
      scf.if %1823 {
        %1824 = func.call @cc_nil_value() : () -> i64
        %1825 = func.call @cc_nil_value() : () -> i64
        %1826 = func.call @cc_errorp(%1824) : (i64) -> i64
        %1827 = arith.cmpi ne, %1826, %1825 : i64
        %1828 = scf.if %1827 -> (i64) {
          scf.yield %1824 : i64
        } else {
          %1829 = func.call @cc_symbol_value(%1793) : (i64) -> i64
          func.call @stack_push_pointer(%1829) : (i64) -> ()
          %1830 = func.call @stack_pop_pointer() : () -> i64
          %1831 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%1831) : (i64) -> ()
          %1832 = func.call @stack_pop_pointer() : () -> i64
          %1834 = arith.constant 3 : i64
          %1833 = arith.andi %1830, %1834 : i64
          %1835 = arith.constant 0 : i64
          %1836 = arith.cmpi eq, %1833, %1835 : i64
          %1838 = arith.constant 3 : i64
          %1837 = arith.andi %1832, %1838 : i64
          %1839 = arith.constant 0 : i64
          %1840 = arith.cmpi eq, %1837, %1839 : i64
          %1841 = arith.andi %1836, %1840 : i1
          %1842 = scf.if %1841 -> (i64) {
            %1843 = arith.constant 2 : i64
            %1844 = arith.shrsi %1830, %1843 : i64
            %1845 = arith.constant 2 : i64
            %1846 = arith.shrsi %1832, %1845 : i64
            %1847 = arith.addi %1844, %1846 : i64
            %1848 = arith.constant -2305843009213693952 : i64
            %1849 = arith.constant 2305843009213693951 : i64
            %1850 = arith.cmpi sge, %1847, %1848 : i64
            %1851 = arith.cmpi sle, %1847, %1849 : i64
            %1852 = arith.andi %1850, %1851 : i1
            %1853 = scf.if %1852 -> (i64) {
              %1854 = arith.constant 2 : i64
              %1855 = arith.shli %1847, %1854 : i64
              scf.yield %1855 : i64
            } else {
              %1856 = func.call @cc_add(%1830, %1832) : (i64, i64) -> i64
              scf.yield %1856 : i64
            }
            scf.yield %1853 : i64
          } else {
            %1857 = func.call @cc_add(%1830, %1832) : (i64, i64) -> i64
            scf.yield %1857 : i64
          }
          func.call @stack_push_pointer(%1842) : (i64) -> ()
          %1858 = func.call @stack_pop_pointer() : () -> i64
          %1859 = func.call @cc_set_symbol_value(%1793, %1858) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1858) : (i64) -> ()
          %1860 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1860 : i64
        }
        func.call @stack_push_pointer(%1828) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1861 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1861 : i64
    }
    func.call @stack_push_pointer(%1798) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511503"() {
    %1767 = func.call @stack_pop_pointer() : () -> i64
    %1768 = func.call @cc_nil_value() : () -> i64
    %1769 = func.call @cc_nil_value() : () -> i64
    %1770 = func.call @cc_errorp(%1768) : (i64) -> i64
    %1771 = arith.cmpi ne, %1770, %1769 : i64
    %1772 = scf.if %1771 -> (i64) {
      scf.yield %1768 : i64
    } else {
      %1773 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1773) : (i64) -> ()
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1776 = arith.constant 33 : i64
      %1777 = func.call @cc_make_symbol(%1775, %1776) : (!llvm.ptr, i64) -> i64
      %1778 = func.call @cc_persistent_root_value(%1777) : (i64) -> i64
      %1779 = func.call @cc_set_symbol_value(%1778, %1774) : (i64, i64) -> i64
      %1780 = func.call @cc_nil_value() : () -> i64
      %1781 = func.call @cc_nil_value() : () -> i64
      %1782 = func.call @cc_errorp(%1780) : (i64) -> i64
      %1783 = arith.cmpi ne, %1782, %1781 : i64
      %1784 = scf.if %1783 -> (i64) {
        scf.yield %1780 : i64
      } else {
        %1785 = func.call @cc_t_value() : () -> i64
        %1786 = func.call @cc_debug_current_stack(%1785) : (i64) -> i64
        %1787 = func.call @cc_nil_value() : () -> i64
        %1788 = func.call @cc_nil_value() : () -> i64
        %1789 = func.call @cc_errorp(%1787) : (i64) -> i64
        %1790 = arith.cmpi ne, %1789, %1788 : i64
        %1791 = scf.if %1790 -> (i64) {
          scf.yield %1787 : i64
        } else {
          func.call @stack_push_pointer(%1778) : (i64) -> ()
          %1862 = arith.constant 97047688511505 : i64
          %1863 = arith.constant 1 : i64
          %1864 = func.call @cc_make_closure(%1862, %1863) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1864) : (i64) -> ()
          %1865 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1786) : (i64) -> ()
          %1866 = func.call @stack_pop_pointer() : () -> i64
          %1867 = func.call @cc_nil_value() : () -> i64
          %1868 = func.call @cc_errorp(%1865) : (i64) -> i64
          %1869 = arith.cmpi ne, %1868, %1867 : i64
          %1870 = arith.cmpi eq, %1867, %1867 : i64
          %1871 = arith.andi %1869, %1870 : i1
          %1872 = scf.if %1871 -> (i64) {
            scf.yield %1865 : i64
          } else {
            scf.yield %1867 : i64
          }
          %1873 = func.call @cc_errorp(%1866) : (i64) -> i64
          %1874 = arith.cmpi ne, %1873, %1867 : i64
          %1875 = arith.cmpi eq, %1872, %1867 : i64
          %1876 = arith.andi %1874, %1875 : i1
          %1877 = scf.if %1876 -> (i64) {
            scf.yield %1866 : i64
          } else {
            scf.yield %1872 : i64
          }
          %1878 = arith.cmpi ne, %1877, %1867 : i64
          scf.if %1878 {
            func.call @stack_push_pointer(%1877) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1865) : (i64) -> ()
            func.call @stack_push_pointer(%1866) : (i64) -> ()
            %1879 = llvm.mlir.addressof @str162 : !llvm.ptr
            %1880 = func.call @cc_make_function_ref_const(%1879) : (!llvm.ptr) -> i64
            %1881 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%1880, %1881) : (i64, i64) -> ()
          }
          %1882 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1882 : i64
        }
        func.call @stack_push_pointer(%1791) : (i64) -> ()
        %1883 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1883 : i64
      }
      %1884 = func.call @cc_nil_value() : () -> i64
      %1885 = func.call @cc_errorp(%1784) : (i64) -> i64
      %1886 = arith.cmpi ne, %1885, %1884 : i64
      %1887 = scf.if %1886 -> (i64) {
        scf.yield %1784 : i64
      } else {
        %1888 = func.call @cc_symbol_value(%1778) : (i64) -> i64
        func.call @stack_push_pointer(%1888) : (i64) -> ()
        %1889 = func.call @stack_pop_pointer() : () -> i64
        %1890 = func.call @cc_multiple_value_list(%1889) : (i64) -> i64
        %1891 = func.call @cc_t_value() : () -> i64
        %1892 = llvm.mlir.addressof @str163 : !llvm.ptr
        %1893 = arith.constant 37 : i64
        %1894 = func.call @cc_make_string(%1892, %1893) : (!llvm.ptr, i64) -> i64
        %1895 = func.call @cc_nil_value() : () -> i64
        %1896 = func.call @cc_intern(%1894, %1895) : (i64, i64) -> i64
        %1897 = func.call @cc_nil_value() : () -> i64
        %1898 = func.call @cc_cons(%1896, %1897) : (i64, i64) -> i64
        %1899 = func.call @cc_values_pack(%1898) : (i64) -> i64
        %1900 = func.call @cc_set_symbol_value(%1896, %1891) : (i64, i64) -> i64
        %1901 = llvm.mlir.addressof @str164 : !llvm.ptr
        %1902 = arith.constant 38 : i64
        %1903 = func.call @cc_make_string(%1901, %1902) : (!llvm.ptr, i64) -> i64
        %1904 = func.call @cc_nil_value() : () -> i64
        %1905 = func.call @cc_intern(%1903, %1904) : (i64, i64) -> i64
        %1906 = func.call @cc_nil_value() : () -> i64
        %1907 = func.call @cc_cons(%1905, %1906) : (i64, i64) -> i64
        %1908 = func.call @cc_values_pack(%1907) : (i64) -> i64
        %1909 = func.call @cc_set_symbol_value(%1905, %1889) : (i64, i64) -> i64
        %1910 = llvm.mlir.addressof @str165 : !llvm.ptr
        %1911 = arith.constant 39 : i64
        %1912 = func.call @cc_make_string(%1910, %1911) : (!llvm.ptr, i64) -> i64
        %1913 = func.call @cc_nil_value() : () -> i64
        %1914 = func.call @cc_intern(%1912, %1913) : (i64, i64) -> i64
        %1915 = func.call @cc_nil_value() : () -> i64
        %1916 = func.call @cc_cons(%1914, %1915) : (i64, i64) -> i64
        %1917 = func.call @cc_values_pack(%1916) : (i64) -> i64
        %1918 = func.call @cc_set_symbol_value(%1914, %1890) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1889) : (i64) -> ()
        %1919 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1919 : i64
      }
      func.call @stack_push_pointer(%1887) : (i64) -> ()
      %1920 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1920 : i64
    }
    func.call @stack_push_pointer(%1772) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511501"() {
    %1733 = func.call @stack_pop_pointer() : () -> i64
    %1734 = func.call @cc_nil_value() : () -> i64
    %1735 = func.call @cc_nil_value() : () -> i64
    %1736 = func.call @cc_errorp(%1734) : (i64) -> i64
    %1737 = arith.cmpi ne, %1736, %1735 : i64
    %1738 = scf.if %1737 -> (i64) {
      scf.yield %1734 : i64
    } else {
      %1739 = func.call @cc_nil_value() : () -> i64
      %1740 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1741 = arith.constant 37 : i64
      %1742 = func.call @cc_make_string(%1740, %1741) : (!llvm.ptr, i64) -> i64
      %1743 = func.call @cc_nil_value() : () -> i64
      %1744 = func.call @cc_intern(%1742, %1743) : (i64, i64) -> i64
      %1745 = func.call @cc_nil_value() : () -> i64
      %1746 = func.call @cc_cons(%1744, %1745) : (i64, i64) -> i64
      %1747 = func.call @cc_values_pack(%1746) : (i64) -> i64
      %1748 = func.call @cc_set_symbol_value(%1744, %1739) : (i64, i64) -> i64
      %1749 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1750 = arith.constant 38 : i64
      %1751 = func.call @cc_make_string(%1749, %1750) : (!llvm.ptr, i64) -> i64
      %1752 = func.call @cc_nil_value() : () -> i64
      %1753 = func.call @cc_intern(%1751, %1752) : (i64, i64) -> i64
      %1754 = func.call @cc_nil_value() : () -> i64
      %1755 = func.call @cc_cons(%1753, %1754) : (i64, i64) -> i64
      %1756 = func.call @cc_values_pack(%1755) : (i64) -> i64
      %1757 = func.call @cc_set_symbol_value(%1753, %1739) : (i64, i64) -> i64
      %1758 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1759 = arith.constant 39 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      %1761 = func.call @cc_nil_value() : () -> i64
      %1762 = func.call @cc_intern(%1760, %1761) : (i64, i64) -> i64
      %1763 = func.call @cc_nil_value() : () -> i64
      %1764 = func.call @cc_cons(%1762, %1763) : (i64, i64) -> i64
      %1765 = func.call @cc_values_pack(%1764) : (i64) -> i64
      %1766 = func.call @cc_set_symbol_value(%1762, %1739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1733) : (i64) -> ()
      %1921 = arith.constant 97047688511503 : i64
      %1922 = arith.constant 1 : i64
      %1923 = func.call @cc_make_closure(%1921, %1922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1923) : (i64) -> ()
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%1925) : (i64) -> ()
      %1926 = func.call @stack_pop_pointer() : () -> i64
      %1927 = func.call @cc_nil_value() : () -> i64
      %1928 = func.call @cc_errorp(%1924) : (i64) -> i64
      %1929 = arith.cmpi ne, %1928, %1927 : i64
      %1930 = arith.cmpi eq, %1927, %1927 : i64
      %1931 = arith.andi %1929, %1930 : i1
      %1932 = scf.if %1931 -> (i64) {
        scf.yield %1924 : i64
      } else {
        scf.yield %1927 : i64
      }
      %1933 = func.call @cc_errorp(%1926) : (i64) -> i64
      %1934 = arith.cmpi ne, %1933, %1927 : i64
      %1935 = arith.cmpi eq, %1932, %1927 : i64
      %1936 = arith.andi %1934, %1935 : i1
      %1937 = scf.if %1936 -> (i64) {
        scf.yield %1926 : i64
      } else {
        scf.yield %1932 : i64
      }
      %1938 = arith.cmpi ne, %1937, %1927 : i64
      scf.if %1938 {
        func.call @stack_push_pointer(%1937) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1924) : (i64) -> ()
        func.call @stack_push_pointer(%1926) : (i64) -> ()
        %1939 = llvm.mlir.addressof @str166 : !llvm.ptr
        %1940 = func.call @cc_make_function_ref_const(%1939) : (!llvm.ptr) -> i64
        %1941 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1940, %1941) : (i64, i64) -> ()
      }
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @cc_multiple_value_list(%1942) : (i64) -> i64
      %1944 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1945 = arith.constant 37 : i64
      %1946 = func.call @cc_make_string(%1944, %1945) : (!llvm.ptr, i64) -> i64
      %1947 = func.call @cc_nil_value() : () -> i64
      %1948 = func.call @cc_intern(%1946, %1947) : (i64, i64) -> i64
      %1949 = func.call @cc_nil_value() : () -> i64
      %1950 = func.call @cc_cons(%1948, %1949) : (i64, i64) -> i64
      %1951 = func.call @cc_values_pack(%1950) : (i64) -> i64
      %1952 = func.call @cc_symbol_value(%1948) : (i64) -> i64
      %1953 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1954 = arith.constant 38 : i64
      %1955 = func.call @cc_make_string(%1953, %1954) : (!llvm.ptr, i64) -> i64
      %1956 = func.call @cc_nil_value() : () -> i64
      %1957 = func.call @cc_intern(%1955, %1956) : (i64, i64) -> i64
      %1958 = func.call @cc_nil_value() : () -> i64
      %1959 = func.call @cc_cons(%1957, %1958) : (i64, i64) -> i64
      %1960 = func.call @cc_values_pack(%1959) : (i64) -> i64
      %1961 = func.call @cc_symbol_value(%1957) : (i64) -> i64
      %1962 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1963 = arith.constant 39 : i64
      %1964 = func.call @cc_make_string(%1962, %1963) : (!llvm.ptr, i64) -> i64
      %1965 = func.call @cc_nil_value() : () -> i64
      %1966 = func.call @cc_intern(%1964, %1965) : (i64, i64) -> i64
      %1967 = func.call @cc_nil_value() : () -> i64
      %1968 = func.call @cc_cons(%1966, %1967) : (i64, i64) -> i64
      %1969 = func.call @cc_values_pack(%1968) : (i64) -> i64
      %1970 = func.call @cc_symbol_value(%1966) : (i64) -> i64
      %1971 = func.call @cc_nil_value() : () -> i64
      %1972 = arith.cmpi ne, %1952, %1971 : i64
      %1973 = scf.if %1972 -> (i64) {
        scf.yield %1970 : i64
      } else {
        scf.yield %1943 : i64
      }
      %1974 = func.call @cc_values_pack(%1973) : (i64) -> i64
      func.call @stack_push_pointer(%1974) : (i64) -> ()
      %1975 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1975 : i64
    }
    func.call @stack_push_pointer(%1738) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511511"() {
    %2430 = func.call @stack_pop_pointer() : () -> i64
    %2431 = func.call @stack_pop_pointer() : () -> i64
    %2432 = func.call @cc_nil_value() : () -> i64
    %2433 = func.call @cc_nil_value() : () -> i64
    %2434 = func.call @cc_errorp(%2432) : (i64) -> i64
    %2435 = arith.cmpi ne, %2434, %2433 : i64
    %2436 = scf.if %2435 -> (i64) {
      scf.yield %2432 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2437 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2437 : i64
    }
    %2438 = func.call @cc_nil_value() : () -> i64
    %2439 = func.call @cc_errorp(%2436) : (i64) -> i64
    %2440 = arith.cmpi ne, %2439, %2438 : i64
    %2441 = scf.if %2440 -> (i64) {
      scf.yield %2436 : i64
    } else {
      %2442 = func.call @cc_symbol_value(%2431) : (i64) -> i64
      func.call @stack_push_pointer(%2442) : (i64) -> ()
      %2443 = func.call @stack_pop_pointer() : () -> i64
      %2444 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2444) : (i64) -> ()
      %2445 = func.call @stack_pop_pointer() : () -> i64
      %2447 = arith.constant 3 : i64
      %2446 = arith.andi %2443, %2447 : i64
      %2448 = arith.constant 0 : i64
      %2449 = arith.cmpi eq, %2446, %2448 : i64
      %2451 = arith.constant 3 : i64
      %2450 = arith.andi %2445, %2451 : i64
      %2452 = arith.constant 0 : i64
      %2453 = arith.cmpi eq, %2450, %2452 : i64
      %2454 = arith.andi %2449, %2453 : i1
      %2455 = scf.if %2454 -> (i64) {
        %2456 = arith.constant 2 : i64
        %2457 = arith.shrsi %2443, %2456 : i64
        %2458 = arith.constant 2 : i64
        %2459 = arith.shrsi %2445, %2458 : i64
        %2460 = arith.addi %2457, %2459 : i64
        %2461 = arith.constant -2305843009213693952 : i64
        %2462 = arith.constant 2305843009213693951 : i64
        %2463 = arith.cmpi sge, %2460, %2461 : i64
        %2464 = arith.cmpi sle, %2460, %2462 : i64
        %2465 = arith.andi %2463, %2464 : i1
        %2466 = scf.if %2465 -> (i64) {
          %2467 = arith.constant 2 : i64
          %2468 = arith.shli %2460, %2467 : i64
          scf.yield %2468 : i64
        } else {
          %2469 = func.call @cc_add(%2443, %2445) : (i64, i64) -> i64
          scf.yield %2469 : i64
        }
        scf.yield %2466 : i64
      } else {
        %2470 = func.call @cc_add(%2443, %2445) : (i64, i64) -> i64
        scf.yield %2470 : i64
      }
      func.call @stack_push_pointer(%2455) : (i64) -> ()
      %2471 = func.call @stack_pop_pointer() : () -> i64
      %2472 = func.call @cc_set_symbol_value(%2431, %2471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2471) : (i64) -> ()
      %2473 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2473 : i64
    }
    func.call @stack_push_pointer(%2441) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511509"() {
    %2405 = func.call @stack_pop_pointer() : () -> i64
    %2406 = func.call @cc_nil_value() : () -> i64
    %2407 = func.call @cc_nil_value() : () -> i64
    %2408 = func.call @cc_errorp(%2406) : (i64) -> i64
    %2409 = arith.cmpi ne, %2408, %2407 : i64
    %2410 = scf.if %2409 -> (i64) {
      scf.yield %2406 : i64
    } else {
      %2411 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2411) : (i64) -> ()
      %2412 = func.call @stack_pop_pointer() : () -> i64
      %2413 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2414 = arith.constant 33 : i64
      %2415 = func.call @cc_make_symbol(%2413, %2414) : (!llvm.ptr, i64) -> i64
      %2416 = func.call @cc_persistent_root_value(%2415) : (i64) -> i64
      %2417 = func.call @cc_set_symbol_value(%2416, %2412) : (i64, i64) -> i64
      %2418 = func.call @cc_nil_value() : () -> i64
      %2419 = func.call @cc_nil_value() : () -> i64
      %2420 = func.call @cc_errorp(%2418) : (i64) -> i64
      %2421 = arith.cmpi ne, %2420, %2419 : i64
      %2422 = scf.if %2421 -> (i64) {
        scf.yield %2418 : i64
      } else {
        %2423 = func.call @cc_t_value() : () -> i64
        %2424 = func.call @cc_debug_current_stack(%2423) : (i64) -> i64
        %2425 = func.call @cc_nil_value() : () -> i64
        %2426 = func.call @cc_nil_value() : () -> i64
        %2427 = func.call @cc_errorp(%2425) : (i64) -> i64
        %2428 = arith.cmpi ne, %2427, %2426 : i64
        %2429 = scf.if %2428 -> (i64) {
          scf.yield %2425 : i64
        } else {
          func.call @stack_push_pointer(%2416) : (i64) -> ()
          %2474 = arith.constant 97047688511511 : i64
          %2475 = arith.constant 1 : i64
          %2476 = func.call @cc_make_closure(%2474, %2475) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2476) : (i64) -> ()
          %2477 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2424) : (i64) -> ()
          %2478 = func.call @stack_pop_pointer() : () -> i64
          %2479 = llvm.mlir.addressof @str210 : !llvm.ptr
          %2480 = arith.constant 5 : i64
          %2481 = func.call @cc_make_string(%2479, %2480) : (!llvm.ptr, i64) -> i64
          %2482 = llvm.mlir.addressof @str211 : !llvm.ptr
          %2483 = arith.constant 7 : i64
          %2484 = func.call @cc_make_string(%2482, %2483) : (!llvm.ptr, i64) -> i64
          %2485 = func.call @cc_intern(%2481, %2484) : (i64, i64) -> i64
          %2486 = func.call @cc_nil_value() : () -> i64
          %2487 = func.call @cc_cons(%2485, %2486) : (i64, i64) -> i64
          %2488 = func.call @cc_values_pack(%2487) : (i64) -> i64
          func.call @stack_push_pointer(%2485) : (i64) -> ()
          %2489 = func.call @stack_pop_pointer() : () -> i64
          %2490 = arith.constant 7 : i64
          func.call @stack_push_fixnum(%2490) : (i64) -> ()
          %2491 = func.call @stack_pop_pointer() : () -> i64
          %2492 = func.call @cc_nil_value() : () -> i64
          %2493 = func.call @cc_errorp(%2477) : (i64) -> i64
          %2494 = arith.cmpi ne, %2493, %2492 : i64
          %2495 = arith.cmpi eq, %2492, %2492 : i64
          %2496 = arith.andi %2494, %2495 : i1
          %2497 = scf.if %2496 -> (i64) {
            scf.yield %2477 : i64
          } else {
            scf.yield %2492 : i64
          }
          %2498 = func.call @cc_errorp(%2478) : (i64) -> i64
          %2499 = arith.cmpi ne, %2498, %2492 : i64
          %2500 = arith.cmpi eq, %2497, %2492 : i64
          %2501 = arith.andi %2499, %2500 : i1
          %2502 = scf.if %2501 -> (i64) {
            scf.yield %2478 : i64
          } else {
            scf.yield %2497 : i64
          }
          %2503 = func.call @cc_errorp(%2489) : (i64) -> i64
          %2504 = arith.cmpi ne, %2503, %2492 : i64
          %2505 = arith.cmpi eq, %2502, %2492 : i64
          %2506 = arith.andi %2504, %2505 : i1
          %2507 = scf.if %2506 -> (i64) {
            scf.yield %2489 : i64
          } else {
            scf.yield %2502 : i64
          }
          %2508 = func.call @cc_errorp(%2491) : (i64) -> i64
          %2509 = arith.cmpi ne, %2508, %2492 : i64
          %2510 = arith.cmpi eq, %2507, %2492 : i64
          %2511 = arith.andi %2509, %2510 : i1
          %2512 = scf.if %2511 -> (i64) {
            scf.yield %2491 : i64
          } else {
            scf.yield %2507 : i64
          }
          %2513 = arith.cmpi ne, %2512, %2492 : i64
          scf.if %2513 {
            func.call @stack_push_pointer(%2512) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2477) : (i64) -> ()
            func.call @stack_push_pointer(%2478) : (i64) -> ()
            func.call @stack_push_pointer(%2489) : (i64) -> ()
            func.call @stack_push_pointer(%2491) : (i64) -> ()
            %2514 = llvm.mlir.addressof @str212 : !llvm.ptr
            %2515 = func.call @cc_make_function_ref_const(%2514) : (!llvm.ptr) -> i64
            %2516 = arith.constant 4 : i64
            func.call @cc_funcall_stack(%2515, %2516) : (i64, i64) -> ()
          }
          %2517 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2517 : i64
        }
        func.call @stack_push_pointer(%2429) : (i64) -> ()
        %2518 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2518 : i64
      }
      %2519 = func.call @cc_nil_value() : () -> i64
      %2520 = func.call @cc_errorp(%2422) : (i64) -> i64
      %2521 = arith.cmpi ne, %2520, %2519 : i64
      %2522 = scf.if %2521 -> (i64) {
        scf.yield %2422 : i64
      } else {
        %2523 = func.call @cc_symbol_value(%2416) : (i64) -> i64
        func.call @stack_push_pointer(%2523) : (i64) -> ()
        %2524 = func.call @stack_pop_pointer() : () -> i64
        %2525 = func.call @cc_multiple_value_list(%2524) : (i64) -> i64
        %2526 = func.call @cc_t_value() : () -> i64
        %2527 = llvm.mlir.addressof @str213 : !llvm.ptr
        %2528 = arith.constant 37 : i64
        %2529 = func.call @cc_make_string(%2527, %2528) : (!llvm.ptr, i64) -> i64
        %2530 = func.call @cc_nil_value() : () -> i64
        %2531 = func.call @cc_intern(%2529, %2530) : (i64, i64) -> i64
        %2532 = func.call @cc_nil_value() : () -> i64
        %2533 = func.call @cc_cons(%2531, %2532) : (i64, i64) -> i64
        %2534 = func.call @cc_values_pack(%2533) : (i64) -> i64
        %2535 = func.call @cc_set_symbol_value(%2531, %2526) : (i64, i64) -> i64
        %2536 = llvm.mlir.addressof @str214 : !llvm.ptr
        %2537 = arith.constant 38 : i64
        %2538 = func.call @cc_make_string(%2536, %2537) : (!llvm.ptr, i64) -> i64
        %2539 = func.call @cc_nil_value() : () -> i64
        %2540 = func.call @cc_intern(%2538, %2539) : (i64, i64) -> i64
        %2541 = func.call @cc_nil_value() : () -> i64
        %2542 = func.call @cc_cons(%2540, %2541) : (i64, i64) -> i64
        %2543 = func.call @cc_values_pack(%2542) : (i64) -> i64
        %2544 = func.call @cc_set_symbol_value(%2540, %2524) : (i64, i64) -> i64
        %2545 = llvm.mlir.addressof @str215 : !llvm.ptr
        %2546 = arith.constant 39 : i64
        %2547 = func.call @cc_make_string(%2545, %2546) : (!llvm.ptr, i64) -> i64
        %2548 = func.call @cc_nil_value() : () -> i64
        %2549 = func.call @cc_intern(%2547, %2548) : (i64, i64) -> i64
        %2550 = func.call @cc_nil_value() : () -> i64
        %2551 = func.call @cc_cons(%2549, %2550) : (i64, i64) -> i64
        %2552 = func.call @cc_values_pack(%2551) : (i64) -> i64
        %2553 = func.call @cc_set_symbol_value(%2549, %2525) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2524) : (i64) -> ()
        %2554 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2554 : i64
      }
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      %2555 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2555 : i64
    }
    func.call @stack_push_pointer(%2410) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511507"() {
    %2371 = func.call @stack_pop_pointer() : () -> i64
    %2372 = func.call @cc_nil_value() : () -> i64
    %2373 = func.call @cc_nil_value() : () -> i64
    %2374 = func.call @cc_errorp(%2372) : (i64) -> i64
    %2375 = arith.cmpi ne, %2374, %2373 : i64
    %2376 = scf.if %2375 -> (i64) {
      scf.yield %2372 : i64
    } else {
      %2377 = func.call @cc_nil_value() : () -> i64
      %2378 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2379 = arith.constant 37 : i64
      %2380 = func.call @cc_make_string(%2378, %2379) : (!llvm.ptr, i64) -> i64
      %2381 = func.call @cc_nil_value() : () -> i64
      %2382 = func.call @cc_intern(%2380, %2381) : (i64, i64) -> i64
      %2383 = func.call @cc_nil_value() : () -> i64
      %2384 = func.call @cc_cons(%2382, %2383) : (i64, i64) -> i64
      %2385 = func.call @cc_values_pack(%2384) : (i64) -> i64
      %2386 = func.call @cc_set_symbol_value(%2382, %2377) : (i64, i64) -> i64
      %2387 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2388 = arith.constant 38 : i64
      %2389 = func.call @cc_make_string(%2387, %2388) : (!llvm.ptr, i64) -> i64
      %2390 = func.call @cc_nil_value() : () -> i64
      %2391 = func.call @cc_intern(%2389, %2390) : (i64, i64) -> i64
      %2392 = func.call @cc_nil_value() : () -> i64
      %2393 = func.call @cc_cons(%2391, %2392) : (i64, i64) -> i64
      %2394 = func.call @cc_values_pack(%2393) : (i64) -> i64
      %2395 = func.call @cc_set_symbol_value(%2391, %2377) : (i64, i64) -> i64
      %2396 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2397 = arith.constant 39 : i64
      %2398 = func.call @cc_make_string(%2396, %2397) : (!llvm.ptr, i64) -> i64
      %2399 = func.call @cc_nil_value() : () -> i64
      %2400 = func.call @cc_intern(%2398, %2399) : (i64, i64) -> i64
      %2401 = func.call @cc_nil_value() : () -> i64
      %2402 = func.call @cc_cons(%2400, %2401) : (i64, i64) -> i64
      %2403 = func.call @cc_values_pack(%2402) : (i64) -> i64
      %2404 = func.call @cc_set_symbol_value(%2400, %2377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2371) : (i64) -> ()
      %2556 = arith.constant 97047688511509 : i64
      %2557 = arith.constant 1 : i64
      %2558 = func.call @cc_make_closure(%2556, %2557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2558) : (i64) -> ()
      %2559 = func.call @stack_pop_pointer() : () -> i64
      %2560 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%2560) : (i64) -> ()
      %2561 = func.call @stack_pop_pointer() : () -> i64
      %2562 = func.call @cc_nil_value() : () -> i64
      %2563 = func.call @cc_errorp(%2559) : (i64) -> i64
      %2564 = arith.cmpi ne, %2563, %2562 : i64
      %2565 = arith.cmpi eq, %2562, %2562 : i64
      %2566 = arith.andi %2564, %2565 : i1
      %2567 = scf.if %2566 -> (i64) {
        scf.yield %2559 : i64
      } else {
        scf.yield %2562 : i64
      }
      %2568 = func.call @cc_errorp(%2561) : (i64) -> i64
      %2569 = arith.cmpi ne, %2568, %2562 : i64
      %2570 = arith.cmpi eq, %2567, %2562 : i64
      %2571 = arith.andi %2569, %2570 : i1
      %2572 = scf.if %2571 -> (i64) {
        scf.yield %2561 : i64
      } else {
        scf.yield %2567 : i64
      }
      %2573 = arith.cmpi ne, %2572, %2562 : i64
      scf.if %2573 {
        func.call @stack_push_pointer(%2572) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2559) : (i64) -> ()
        func.call @stack_push_pointer(%2561) : (i64) -> ()
        %2574 = llvm.mlir.addressof @str216 : !llvm.ptr
        %2575 = func.call @cc_make_function_ref_const(%2574) : (!llvm.ptr) -> i64
        %2576 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2575, %2576) : (i64, i64) -> ()
      }
      %2577 = func.call @stack_pop_pointer() : () -> i64
      %2578 = func.call @cc_multiple_value_list(%2577) : (i64) -> i64
      %2579 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2580 = arith.constant 37 : i64
      %2581 = func.call @cc_make_string(%2579, %2580) : (!llvm.ptr, i64) -> i64
      %2582 = func.call @cc_nil_value() : () -> i64
      %2583 = func.call @cc_intern(%2581, %2582) : (i64, i64) -> i64
      %2584 = func.call @cc_nil_value() : () -> i64
      %2585 = func.call @cc_cons(%2583, %2584) : (i64, i64) -> i64
      %2586 = func.call @cc_values_pack(%2585) : (i64) -> i64
      %2587 = func.call @cc_symbol_value(%2583) : (i64) -> i64
      %2588 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2589 = arith.constant 38 : i64
      %2590 = func.call @cc_make_string(%2588, %2589) : (!llvm.ptr, i64) -> i64
      %2591 = func.call @cc_nil_value() : () -> i64
      %2592 = func.call @cc_intern(%2590, %2591) : (i64, i64) -> i64
      %2593 = func.call @cc_nil_value() : () -> i64
      %2594 = func.call @cc_cons(%2592, %2593) : (i64, i64) -> i64
      %2595 = func.call @cc_values_pack(%2594) : (i64) -> i64
      %2596 = func.call @cc_symbol_value(%2592) : (i64) -> i64
      %2597 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2598 = arith.constant 39 : i64
      %2599 = func.call @cc_make_string(%2597, %2598) : (!llvm.ptr, i64) -> i64
      %2600 = func.call @cc_nil_value() : () -> i64
      %2601 = func.call @cc_intern(%2599, %2600) : (i64, i64) -> i64
      %2602 = func.call @cc_nil_value() : () -> i64
      %2603 = func.call @cc_cons(%2601, %2602) : (i64, i64) -> i64
      %2604 = func.call @cc_values_pack(%2603) : (i64) -> i64
      %2605 = func.call @cc_symbol_value(%2601) : (i64) -> i64
      %2606 = func.call @cc_nil_value() : () -> i64
      %2607 = arith.cmpi ne, %2587, %2606 : i64
      %2608 = scf.if %2607 -> (i64) {
        scf.yield %2605 : i64
      } else {
        scf.yield %2578 : i64
      }
      %2609 = func.call @cc_values_pack(%2608) : (i64) -> i64
      func.call @stack_push_pointer(%2609) : (i64) -> ()
      %2610 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2610 : i64
    }
    func.call @stack_push_pointer(%2376) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511518"() {
    %3092 = func.call @stack_pop_pointer() : () -> i64
    %3093 = func.call @cc_nil_value() : () -> i64
    %3094 = func.call @cc_nil_value() : () -> i64
    %3095 = func.call @cc_errorp(%3093) : (i64) -> i64
    %3096 = arith.cmpi ne, %3095, %3094 : i64
    %3097 = scf.if %3096 -> (i64) {
      scf.yield %3093 : i64
    } else {
      func.call @stack_push_pointer(%3092) : (i64) -> ()
      %3098 = func.call @stack_pop_pointer() : () -> i64
      %3099 = func.call @cc_nil_value() : () -> i64
      %3100 = func.call @cc_errorp(%3098) : (i64) -> i64
      %3101 = arith.cmpi ne, %3100, %3099 : i64
      %3102 = arith.cmpi eq, %3099, %3099 : i64
      %3103 = arith.andi %3101, %3102 : i1
      %3104 = scf.if %3103 -> (i64) {
        scf.yield %3098 : i64
      } else {
        scf.yield %3099 : i64
      }
      %3105 = arith.cmpi ne, %3104, %3099 : i64
      scf.if %3105 {
        func.call @stack_push_pointer(%3104) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3098) : (i64) -> ()
        %3106 = llvm.mlir.addressof @str262 : !llvm.ptr
        %3107 = func.call @cc_make_function_ref_const(%3106) : (!llvm.ptr) -> i64
        %3108 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3107, %3108) : (i64, i64) -> ()
      }
      %3109 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3110 = arith.constant 32 : i64
      %3111 = func.call @cc_make_string(%3109, %3110) : (!llvm.ptr, i64) -> i64
      %3112 = func.call @cc_nil_value() : () -> i64
      %3113 = func.call @cc_intern(%3111, %3112) : (i64, i64) -> i64
      %3114 = func.call @cc_nil_value() : () -> i64
      %3115 = func.call @cc_cons(%3113, %3114) : (i64, i64) -> i64
      %3116 = func.call @cc_values_pack(%3115) : (i64) -> i64
      func.call @stack_push_pointer(%3113) : (i64) -> ()
      %3117 = func.call @stack_pop_pointer() : () -> i64
      %3118 = func.call @stack_pop_pointer() : () -> i64
      %3119 = func.call @cc_eq(%3118, %3117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3119) : (i64) -> ()
      %3120 = func.call @stack_pop_pointer() : () -> i64
      %3121 = func.call @cc_nil_value() : () -> i64
      %3122 = arith.cmpi ne, %3120, %3121 : i64
      scf.if %3122 {
        %3123 = func.call @cc_nil_value() : () -> i64
        %3124 = func.call @cc_nil_value() : () -> i64
        %3125 = func.call @cc_errorp(%3123) : (i64) -> i64
        %3126 = arith.cmpi ne, %3125, %3124 : i64
        %3127 = scf.if %3126 -> (i64) {
          scf.yield %3123 : i64
        } else {
          func.call @stack_push_pointer(%3092) : (i64) -> ()
          %3128 = func.call @stack_pop_pointer() : () -> i64
          %3129 = func.call @cc_nil_value() : () -> i64
          %3130 = func.call @cc_errorp(%3128) : (i64) -> i64
          %3131 = arith.cmpi ne, %3130, %3129 : i64
          %3132 = arith.cmpi eq, %3129, %3129 : i64
          %3133 = arith.andi %3131, %3132 : i1
          %3134 = scf.if %3133 -> (i64) {
            scf.yield %3128 : i64
          } else {
            scf.yield %3129 : i64
          }
          %3135 = arith.cmpi ne, %3134, %3129 : i64
          scf.if %3135 {
            func.call @stack_push_pointer(%3134) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3128) : (i64) -> ()
            %3136 = llvm.mlir.addressof @str264 : !llvm.ptr
            %3137 = func.call @cc_make_function_ref_const(%3136) : (!llvm.ptr) -> i64
            %3138 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3137, %3138) : (i64, i64) -> ()
          }
          %3139 = func.call @stack_pop_pointer() : () -> i64
          %3140 = func.call @cc_multiple_value_list(%3139) : (i64) -> i64
          %3141 = func.call @cc_t_value() : () -> i64
          %3142 = llvm.mlir.addressof @str265 : !llvm.ptr
          %3143 = arith.constant 37 : i64
          %3144 = func.call @cc_make_string(%3142, %3143) : (!llvm.ptr, i64) -> i64
          %3145 = func.call @cc_nil_value() : () -> i64
          %3146 = func.call @cc_intern(%3144, %3145) : (i64, i64) -> i64
          %3147 = func.call @cc_nil_value() : () -> i64
          %3148 = func.call @cc_cons(%3146, %3147) : (i64, i64) -> i64
          %3149 = func.call @cc_values_pack(%3148) : (i64) -> i64
          %3150 = func.call @cc_set_symbol_value(%3146, %3141) : (i64, i64) -> i64
          %3151 = llvm.mlir.addressof @str266 : !llvm.ptr
          %3152 = arith.constant 38 : i64
          %3153 = func.call @cc_make_string(%3151, %3152) : (!llvm.ptr, i64) -> i64
          %3154 = func.call @cc_nil_value() : () -> i64
          %3155 = func.call @cc_intern(%3153, %3154) : (i64, i64) -> i64
          %3156 = func.call @cc_nil_value() : () -> i64
          %3157 = func.call @cc_cons(%3155, %3156) : (i64, i64) -> i64
          %3158 = func.call @cc_values_pack(%3157) : (i64) -> i64
          %3159 = func.call @cc_set_symbol_value(%3155, %3139) : (i64, i64) -> i64
          %3160 = llvm.mlir.addressof @str267 : !llvm.ptr
          %3161 = arith.constant 39 : i64
          %3162 = func.call @cc_make_string(%3160, %3161) : (!llvm.ptr, i64) -> i64
          %3163 = func.call @cc_nil_value() : () -> i64
          %3164 = func.call @cc_intern(%3162, %3163) : (i64, i64) -> i64
          %3165 = func.call @cc_nil_value() : () -> i64
          %3166 = func.call @cc_cons(%3164, %3165) : (i64, i64) -> i64
          %3167 = func.call @cc_values_pack(%3166) : (i64) -> i64
          %3168 = func.call @cc_set_symbol_value(%3164, %3140) : (i64, i64) -> i64
          %3169 = llvm.mlir.addressof @str268 : !llvm.ptr
          %3170 = arith.constant 37 : i64
          %3171 = func.call @cc_make_string(%3169, %3170) : (!llvm.ptr, i64) -> i64
          %3172 = func.call @cc_nil_value() : () -> i64
          %3173 = func.call @cc_intern(%3171, %3172) : (i64, i64) -> i64
          %3174 = func.call @cc_nil_value() : () -> i64
          %3175 = func.call @cc_cons(%3173, %3174) : (i64, i64) -> i64
          %3176 = func.call @cc_values_pack(%3175) : (i64) -> i64
          %3177 = func.call @cc_set_symbol_value(%3173, %3141) : (i64, i64) -> i64
          %3178 = llvm.mlir.addressof @str269 : !llvm.ptr
          %3179 = arith.constant 38 : i64
          %3180 = func.call @cc_make_string(%3178, %3179) : (!llvm.ptr, i64) -> i64
          %3181 = func.call @cc_nil_value() : () -> i64
          %3182 = func.call @cc_intern(%3180, %3181) : (i64, i64) -> i64
          %3183 = func.call @cc_nil_value() : () -> i64
          %3184 = func.call @cc_cons(%3182, %3183) : (i64, i64) -> i64
          %3185 = func.call @cc_values_pack(%3184) : (i64) -> i64
          %3186 = func.call @cc_set_symbol_value(%3182, %3139) : (i64, i64) -> i64
          %3187 = llvm.mlir.addressof @str270 : !llvm.ptr
          %3188 = arith.constant 39 : i64
          %3189 = func.call @cc_make_string(%3187, %3188) : (!llvm.ptr, i64) -> i64
          %3190 = func.call @cc_nil_value() : () -> i64
          %3191 = func.call @cc_intern(%3189, %3190) : (i64, i64) -> i64
          %3192 = func.call @cc_nil_value() : () -> i64
          %3193 = func.call @cc_cons(%3191, %3192) : (i64, i64) -> i64
          %3194 = func.call @cc_values_pack(%3193) : (i64) -> i64
          %3195 = func.call @cc_set_symbol_value(%3191, %3140) : (i64, i64) -> i64
          %3196 = llvm.mlir.addressof @str271 : !llvm.ptr
          %3197 = arith.constant 37 : i64
          %3198 = func.call @cc_make_string(%3196, %3197) : (!llvm.ptr, i64) -> i64
          %3199 = func.call @cc_nil_value() : () -> i64
          %3200 = func.call @cc_intern(%3198, %3199) : (i64, i64) -> i64
          %3201 = func.call @cc_nil_value() : () -> i64
          %3202 = func.call @cc_cons(%3200, %3201) : (i64, i64) -> i64
          %3203 = func.call @cc_values_pack(%3202) : (i64) -> i64
          %3204 = func.call @cc_set_symbol_value(%3200, %3141) : (i64, i64) -> i64
          %3205 = llvm.mlir.addressof @str272 : !llvm.ptr
          %3206 = arith.constant 38 : i64
          %3207 = func.call @cc_make_string(%3205, %3206) : (!llvm.ptr, i64) -> i64
          %3208 = func.call @cc_nil_value() : () -> i64
          %3209 = func.call @cc_intern(%3207, %3208) : (i64, i64) -> i64
          %3210 = func.call @cc_nil_value() : () -> i64
          %3211 = func.call @cc_cons(%3209, %3210) : (i64, i64) -> i64
          %3212 = func.call @cc_values_pack(%3211) : (i64) -> i64
          %3213 = func.call @cc_set_symbol_value(%3209, %3139) : (i64, i64) -> i64
          %3214 = llvm.mlir.addressof @str273 : !llvm.ptr
          %3215 = arith.constant 39 : i64
          %3216 = func.call @cc_make_string(%3214, %3215) : (!llvm.ptr, i64) -> i64
          %3217 = func.call @cc_nil_value() : () -> i64
          %3218 = func.call @cc_intern(%3216, %3217) : (i64, i64) -> i64
          %3219 = func.call @cc_nil_value() : () -> i64
          %3220 = func.call @cc_cons(%3218, %3219) : (i64, i64) -> i64
          %3221 = func.call @cc_values_pack(%3220) : (i64) -> i64
          %3222 = func.call @cc_set_symbol_value(%3218, %3140) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3139) : (i64) -> ()
          %3223 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3223 : i64
        }
        func.call @stack_push_pointer(%3127) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %3224 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3224 : i64
    }
    func.call @stack_push_pointer(%3097) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511515"() {
    %3027 = llvm.mlir.addressof @str255 : !llvm.ptr
    %3028 = arith.constant 23 : i64
    %3029 = func.call @cc_make_string(%3027, %3028) : (!llvm.ptr, i64) -> i64
    %3030 = func.call @cc_nil_value() : () -> i64
    %3031 = func.call @cc_intern(%3029, %3030) : (i64, i64) -> i64
    %3032 = func.call @cc_nil_value() : () -> i64
    %3033 = func.call @cc_cons(%3031, %3032) : (i64, i64) -> i64
    %3034 = func.call @cc_values_pack(%3033) : (i64) -> i64
    %3035 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%3031, %3035) : (i64, i64) -> ()
    %3036 = func.call @cc_nil_value() : () -> i64
    %3037 = llvm.mlir.addressof @str256 : !llvm.ptr
    %3038 = arith.constant 37 : i64
    %3039 = func.call @cc_make_string(%3037, %3038) : (!llvm.ptr, i64) -> i64
    %3040 = func.call @cc_nil_value() : () -> i64
    %3041 = func.call @cc_intern(%3039, %3040) : (i64, i64) -> i64
    %3042 = func.call @cc_nil_value() : () -> i64
    %3043 = func.call @cc_cons(%3041, %3042) : (i64, i64) -> i64
    %3044 = func.call @cc_values_pack(%3043) : (i64) -> i64
    %3045 = func.call @cc_set_symbol_value(%3041, %3036) : (i64, i64) -> i64
    %3046 = llvm.mlir.addressof @str257 : !llvm.ptr
    %3047 = arith.constant 38 : i64
    %3048 = func.call @cc_make_string(%3046, %3047) : (!llvm.ptr, i64) -> i64
    %3049 = func.call @cc_nil_value() : () -> i64
    %3050 = func.call @cc_intern(%3048, %3049) : (i64, i64) -> i64
    %3051 = func.call @cc_nil_value() : () -> i64
    %3052 = func.call @cc_cons(%3050, %3051) : (i64, i64) -> i64
    %3053 = func.call @cc_values_pack(%3052) : (i64) -> i64
    %3054 = func.call @cc_set_symbol_value(%3050, %3036) : (i64, i64) -> i64
    %3055 = llvm.mlir.addressof @str258 : !llvm.ptr
    %3056 = arith.constant 39 : i64
    %3057 = func.call @cc_make_string(%3055, %3056) : (!llvm.ptr, i64) -> i64
    %3058 = func.call @cc_nil_value() : () -> i64
    %3059 = func.call @cc_intern(%3057, %3058) : (i64, i64) -> i64
    %3060 = func.call @cc_nil_value() : () -> i64
    %3061 = func.call @cc_cons(%3059, %3060) : (i64, i64) -> i64
    %3062 = func.call @cc_values_pack(%3061) : (i64) -> i64
    %3063 = func.call @cc_set_symbol_value(%3059, %3036) : (i64, i64) -> i64
    %3064 = func.call @cc_nil_value() : () -> i64
    %3065 = llvm.mlir.addressof @str259 : !llvm.ptr
    %3066 = arith.constant 37 : i64
    %3067 = func.call @cc_make_string(%3065, %3066) : (!llvm.ptr, i64) -> i64
    %3068 = func.call @cc_nil_value() : () -> i64
    %3069 = func.call @cc_intern(%3067, %3068) : (i64, i64) -> i64
    %3070 = func.call @cc_nil_value() : () -> i64
    %3071 = func.call @cc_cons(%3069, %3070) : (i64, i64) -> i64
    %3072 = func.call @cc_values_pack(%3071) : (i64) -> i64
    %3073 = func.call @cc_set_symbol_value(%3069, %3064) : (i64, i64) -> i64
    %3074 = llvm.mlir.addressof @str260 : !llvm.ptr
    %3075 = arith.constant 38 : i64
    %3076 = func.call @cc_make_string(%3074, %3075) : (!llvm.ptr, i64) -> i64
    %3077 = func.call @cc_nil_value() : () -> i64
    %3078 = func.call @cc_intern(%3076, %3077) : (i64, i64) -> i64
    %3079 = func.call @cc_nil_value() : () -> i64
    %3080 = func.call @cc_cons(%3078, %3079) : (i64, i64) -> i64
    %3081 = func.call @cc_values_pack(%3080) : (i64) -> i64
    %3082 = func.call @cc_set_symbol_value(%3078, %3064) : (i64, i64) -> i64
    %3083 = llvm.mlir.addressof @str261 : !llvm.ptr
    %3084 = arith.constant 39 : i64
    %3085 = func.call @cc_make_string(%3083, %3084) : (!llvm.ptr, i64) -> i64
    %3086 = func.call @cc_nil_value() : () -> i64
    %3087 = func.call @cc_intern(%3085, %3086) : (i64, i64) -> i64
    %3088 = func.call @cc_nil_value() : () -> i64
    %3089 = func.call @cc_cons(%3087, %3088) : (i64, i64) -> i64
    %3090 = func.call @cc_values_pack(%3089) : (i64) -> i64
    %3091 = func.call @cc_set_symbol_value(%3087, %3064) : (i64, i64) -> i64
    %3225 = arith.constant 97047688511518 : i64
    %3226 = arith.constant 0 : i64
    %3227 = func.call @cc_make_closure(%3225, %3226) : (i64, i64) -> i64
    func.call @stack_push_pointer(%3227) : (i64) -> ()
    %3228 = func.call @stack_pop_pointer() : () -> i64
    %3229 = func.call @cc_nil_value() : () -> i64
    %3230 = func.call @cc_errorp(%3228) : (i64) -> i64
    %3231 = arith.cmpi ne, %3230, %3229 : i64
    %3232 = arith.cmpi eq, %3229, %3229 : i64
    %3233 = arith.andi %3231, %3232 : i1
    %3234 = scf.if %3233 -> (i64) {
      scf.yield %3228 : i64
    } else {
      scf.yield %3229 : i64
    }
    %3235 = arith.cmpi ne, %3234, %3229 : i64
    scf.if %3235 {
      func.call @stack_push_pointer(%3234) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%3228) : (i64) -> ()
      %3236 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3237 = func.call @cc_make_function_ref_const(%3236) : (!llvm.ptr) -> i64
      %3238 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%3237, %3238) : (i64, i64) -> ()
    }
    %3239 = func.call @stack_pop_pointer() : () -> i64
    %3240 = func.call @cc_multiple_value_list(%3239) : (i64) -> i64
    %3241 = llvm.mlir.addressof @str275 : !llvm.ptr
    %3242 = arith.constant 37 : i64
    %3243 = func.call @cc_make_string(%3241, %3242) : (!llvm.ptr, i64) -> i64
    %3244 = func.call @cc_nil_value() : () -> i64
    %3245 = func.call @cc_intern(%3243, %3244) : (i64, i64) -> i64
    %3246 = func.call @cc_nil_value() : () -> i64
    %3247 = func.call @cc_cons(%3245, %3246) : (i64, i64) -> i64
    %3248 = func.call @cc_values_pack(%3247) : (i64) -> i64
    %3249 = func.call @cc_symbol_value(%3245) : (i64) -> i64
    %3250 = llvm.mlir.addressof @str276 : !llvm.ptr
    %3251 = arith.constant 38 : i64
    %3252 = func.call @cc_make_string(%3250, %3251) : (!llvm.ptr, i64) -> i64
    %3253 = func.call @cc_nil_value() : () -> i64
    %3254 = func.call @cc_intern(%3252, %3253) : (i64, i64) -> i64
    %3255 = func.call @cc_nil_value() : () -> i64
    %3256 = func.call @cc_cons(%3254, %3255) : (i64, i64) -> i64
    %3257 = func.call @cc_values_pack(%3256) : (i64) -> i64
    %3258 = func.call @cc_symbol_value(%3254) : (i64) -> i64
    %3259 = llvm.mlir.addressof @str277 : !llvm.ptr
    %3260 = arith.constant 39 : i64
    %3261 = func.call @cc_make_string(%3259, %3260) : (!llvm.ptr, i64) -> i64
    %3262 = func.call @cc_nil_value() : () -> i64
    %3263 = func.call @cc_intern(%3261, %3262) : (i64, i64) -> i64
    %3264 = func.call @cc_nil_value() : () -> i64
    %3265 = func.call @cc_cons(%3263, %3264) : (i64, i64) -> i64
    %3266 = func.call @cc_values_pack(%3265) : (i64) -> i64
    %3267 = func.call @cc_symbol_value(%3263) : (i64) -> i64
    %3268 = func.call @cc_nil_value() : () -> i64
    %3269 = arith.cmpi ne, %3249, %3268 : i64
    %3270 = scf.if %3269 -> (i64) {
      scf.yield %3267 : i64
    } else {
      scf.yield %3240 : i64
    }
    %3271 = func.call @cc_values_pack(%3270) : (i64) -> i64
    func.call @stack_push_pointer(%3271) : (i64) -> ()
    %3272 = func.call @stack_pop_pointer() : () -> i64
    %3273 = func.call @cc_multiple_value_list(%3272) : (i64) -> i64
    %3274 = llvm.mlir.addressof @str278 : !llvm.ptr
    %3275 = arith.constant 37 : i64
    %3276 = func.call @cc_make_string(%3274, %3275) : (!llvm.ptr, i64) -> i64
    %3277 = func.call @cc_nil_value() : () -> i64
    %3278 = func.call @cc_intern(%3276, %3277) : (i64, i64) -> i64
    %3279 = func.call @cc_nil_value() : () -> i64
    %3280 = func.call @cc_cons(%3278, %3279) : (i64, i64) -> i64
    %3281 = func.call @cc_values_pack(%3280) : (i64) -> i64
    %3282 = func.call @cc_symbol_value(%3278) : (i64) -> i64
    %3283 = llvm.mlir.addressof @str279 : !llvm.ptr
    %3284 = arith.constant 39 : i64
    %3285 = func.call @cc_make_string(%3283, %3284) : (!llvm.ptr, i64) -> i64
    %3286 = func.call @cc_nil_value() : () -> i64
    %3287 = func.call @cc_intern(%3285, %3286) : (i64, i64) -> i64
    %3288 = func.call @cc_nil_value() : () -> i64
    %3289 = func.call @cc_cons(%3287, %3288) : (i64, i64) -> i64
    %3290 = func.call @cc_values_pack(%3289) : (i64) -> i64
    %3291 = func.call @cc_symbol_value(%3287) : (i64) -> i64
    %3292 = func.call @cc_nil_value() : () -> i64
    %3293 = arith.cmpi ne, %3282, %3292 : i64
    %3294 = scf.if %3293 -> (i64) {
      scf.yield %3291 : i64
    } else {
      scf.yield %3273 : i64
    }
    %3295 = func.call @cc_values_pack(%3294) : (i64) -> i64
    func.call @stack_push_pointer(%3295) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511513"() {
    %2988 = func.call @stack_pop_pointer() : () -> i64
    %2989 = func.call @cc_nil_value() : () -> i64
    %2990 = func.call @cc_nil_value() : () -> i64
    %2991 = func.call @cc_errorp(%2989) : (i64) -> i64
    %2992 = arith.cmpi ne, %2991, %2990 : i64
    %2993 = scf.if %2992 -> (i64) {
      scf.yield %2989 : i64
    } else {
      %2994 = func.call @cc_nil_value() : () -> i64
      %2995 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2996 = arith.constant 37 : i64
      %2997 = func.call @cc_make_string(%2995, %2996) : (!llvm.ptr, i64) -> i64
      %2998 = func.call @cc_nil_value() : () -> i64
      %2999 = func.call @cc_intern(%2997, %2998) : (i64, i64) -> i64
      %3000 = func.call @cc_nil_value() : () -> i64
      %3001 = func.call @cc_cons(%2999, %3000) : (i64, i64) -> i64
      %3002 = func.call @cc_values_pack(%3001) : (i64) -> i64
      %3003 = func.call @cc_set_symbol_value(%2999, %2994) : (i64, i64) -> i64
      %3004 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3005 = arith.constant 38 : i64
      %3006 = func.call @cc_make_string(%3004, %3005) : (!llvm.ptr, i64) -> i64
      %3007 = func.call @cc_nil_value() : () -> i64
      %3008 = func.call @cc_intern(%3006, %3007) : (i64, i64) -> i64
      %3009 = func.call @cc_nil_value() : () -> i64
      %3010 = func.call @cc_cons(%3008, %3009) : (i64, i64) -> i64
      %3011 = func.call @cc_values_pack(%3010) : (i64) -> i64
      %3012 = func.call @cc_set_symbol_value(%3008, %2994) : (i64, i64) -> i64
      %3013 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3014 = arith.constant 39 : i64
      %3015 = func.call @cc_make_string(%3013, %3014) : (!llvm.ptr, i64) -> i64
      %3016 = func.call @cc_nil_value() : () -> i64
      %3017 = func.call @cc_intern(%3015, %3016) : (i64, i64) -> i64
      %3018 = func.call @cc_nil_value() : () -> i64
      %3019 = func.call @cc_cons(%3017, %3018) : (i64, i64) -> i64
      %3020 = func.call @cc_values_pack(%3019) : (i64) -> i64
      %3021 = func.call @cc_set_symbol_value(%3017, %2994) : (i64, i64) -> i64
      %3022 = func.call @cc_nil_value() : () -> i64
      %3023 = func.call @cc_nil_value() : () -> i64
      %3024 = func.call @cc_errorp(%3022) : (i64) -> i64
      %3025 = arith.cmpi ne, %3024, %3023 : i64
      %3026 = scf.if %3025 -> (i64) {
        scf.yield %3022 : i64
      } else {
        %3296 = llvm.mlir.addressof @str280 : !llvm.ptr
        %3297 = func.call @cc_make_lambda_ref_str(%3296) : (!llvm.ptr) -> i64
        func.call @stack_push_pointer(%3297) : (i64) -> ()
        %3298 = func.call @stack_pop_pointer() : () -> i64
        %3299 = llvm.mlir.addressof @str281 : !llvm.ptr
        %3300 = arith.constant 20 : i64
        %3301 = func.call @cc_make_string(%3299, %3300) : (!llvm.ptr, i64) -> i64
        %3302 = func.call @cc_nil_value() : () -> i64
        %3303 = func.call @cc_intern(%3301, %3302) : (i64, i64) -> i64
        %3304 = func.call @cc_nil_value() : () -> i64
        %3305 = func.call @cc_cons(%3303, %3304) : (i64, i64) -> i64
        %3306 = func.call @cc_values_pack(%3305) : (i64) -> i64
        %3307 = func.call @cc_set_symbol_value(%3303, %3298) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3298) : (i64) -> ()
        %3308 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3308 : i64
      }
      %3309 = func.call @cc_nil_value() : () -> i64
      %3310 = func.call @cc_errorp(%3026) : (i64) -> i64
      %3311 = arith.cmpi ne, %3310, %3309 : i64
      %3312 = scf.if %3311 -> (i64) {
        scf.yield %3026 : i64
      } else {
        %3313 = llvm.mlir.addressof @str282 : !llvm.ptr
        %3314 = func.call @cc_make_function_ref_const(%3313) : (!llvm.ptr) -> i64
        func.call @stack_push_pointer(%3314) : (i64) -> ()
        %3315 = func.call @stack_pop_pointer() : () -> i64
        %3316 = llvm.mlir.addressof @str283 : !llvm.ptr
        %3317 = arith.constant 16 : i64
        %3318 = func.call @cc_make_string(%3316, %3317) : (!llvm.ptr, i64) -> i64
        %3319 = llvm.mlir.addressof @str284 : !llvm.ptr
        %3320 = arith.constant 15 : i64
        %3321 = func.call @cc_make_string(%3319, %3320) : (!llvm.ptr, i64) -> i64
        %3322 = func.call @cc_intern(%3318, %3321) : (i64, i64) -> i64
        %3323 = func.call @cc_nil_value() : () -> i64
        %3324 = func.call @cc_cons(%3322, %3323) : (i64, i64) -> i64
        %3325 = func.call @cc_values_pack(%3324) : (i64) -> i64
        %3326 = func.call @cc_set_symbol_value(%3322, %3315) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3315) : (i64) -> ()
        %3327 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3327 : i64
      }
      %3328 = func.call @cc_nil_value() : () -> i64
      %3329 = func.call @cc_errorp(%3312) : (i64) -> i64
      %3330 = arith.cmpi ne, %3329, %3328 : i64
      %3331 = scf.if %3330 -> (i64) {
        scf.yield %3312 : i64
      } else {
        %3332 = llvm.mlir.addressof @str285 : !llvm.ptr
        %3333 = func.call @cc_make_function_ref_const(%3332) : (!llvm.ptr) -> i64
        func.call @stack_push_pointer(%3333) : (i64) -> ()
        %3334 = func.call @stack_pop_pointer() : () -> i64
        %3335 = llvm.mlir.addressof @str286 : !llvm.ptr
        %3336 = arith.constant 16 : i64
        %3337 = func.call @cc_make_string(%3335, %3336) : (!llvm.ptr, i64) -> i64
        %3338 = llvm.mlir.addressof @str287 : !llvm.ptr
        %3339 = arith.constant 15 : i64
        %3340 = func.call @cc_make_string(%3338, %3339) : (!llvm.ptr, i64) -> i64
        %3341 = func.call @cc_intern(%3337, %3340) : (i64, i64) -> i64
        %3342 = func.call @cc_nil_value() : () -> i64
        %3343 = func.call @cc_cons(%3341, %3342) : (i64, i64) -> i64
        %3344 = func.call @cc_values_pack(%3343) : (i64) -> i64
        %3345 = func.call @cc_set_symbol_value(%3341, %3334) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3334) : (i64) -> ()
        %3346 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3346 : i64
      }
      %3347 = func.call @cc_nil_value() : () -> i64
      %3348 = func.call @cc_errorp(%3331) : (i64) -> i64
      %3349 = arith.cmpi ne, %3348, %3347 : i64
      %3350 = scf.if %3349 -> (i64) {
        scf.yield %3331 : i64
      } else {
        %3351 = llvm.mlir.addressof @str288 : !llvm.ptr
        %3352 = func.call @cc_make_function_ref_const(%3351) : (!llvm.ptr) -> i64
        func.call @stack_push_pointer(%3352) : (i64) -> ()
        %3353 = func.call @stack_pop_pointer() : () -> i64
        %3354 = llvm.mlir.addressof @str289 : !llvm.ptr
        %3355 = arith.constant 16 : i64
        %3356 = func.call @cc_make_string(%3354, %3355) : (!llvm.ptr, i64) -> i64
        %3357 = llvm.mlir.addressof @str290 : !llvm.ptr
        %3358 = arith.constant 15 : i64
        %3359 = func.call @cc_make_string(%3357, %3358) : (!llvm.ptr, i64) -> i64
        %3360 = func.call @cc_intern(%3356, %3359) : (i64, i64) -> i64
        %3361 = func.call @cc_nil_value() : () -> i64
        %3362 = func.call @cc_cons(%3360, %3361) : (i64, i64) -> i64
        %3363 = func.call @cc_values_pack(%3362) : (i64) -> i64
        %3364 = func.call @cc_set_symbol_value(%3360, %3353) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3353) : (i64) -> ()
        %3365 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3365 : i64
      }
      %3366 = func.call @cc_nil_value() : () -> i64
      %3367 = func.call @cc_errorp(%3350) : (i64) -> i64
      %3368 = arith.cmpi ne, %3367, %3366 : i64
      %3369 = scf.if %3368 -> (i64) {
        scf.yield %3350 : i64
      } else {
        %3370 = llvm.mlir.addressof @str291 : !llvm.ptr
        %3371 = func.call @cc_make_function_ref_const(%3370) : (!llvm.ptr) -> i64
        func.call @stack_push_pointer(%3371) : (i64) -> ()
        %3372 = func.call @stack_pop_pointer() : () -> i64
        %3373 = llvm.mlir.addressof @str292 : !llvm.ptr
        %3374 = arith.constant 16 : i64
        %3375 = func.call @cc_make_string(%3373, %3374) : (!llvm.ptr, i64) -> i64
        %3376 = llvm.mlir.addressof @str293 : !llvm.ptr
        %3377 = arith.constant 15 : i64
        %3378 = func.call @cc_make_string(%3376, %3377) : (!llvm.ptr, i64) -> i64
        %3379 = func.call @cc_intern(%3375, %3378) : (i64, i64) -> i64
        %3380 = func.call @cc_nil_value() : () -> i64
        %3381 = func.call @cc_cons(%3379, %3380) : (i64, i64) -> i64
        %3382 = func.call @cc_values_pack(%3381) : (i64) -> i64
        %3383 = func.call @cc_set_symbol_value(%3379, %3372) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3372) : (i64) -> ()
        %3384 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3384 : i64
      }
      func.call @stack_push_pointer(%3369) : (i64) -> ()
      %3385 = func.call @stack_pop_pointer() : () -> i64
      %3386 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3387 = arith.constant 16 : i64
      %3388 = func.call @cc_make_string(%3386, %3387) : (!llvm.ptr, i64) -> i64
      %3389 = func.call @cc_nil_value() : () -> i64
      %3390 = func.call @cc_intern(%3388, %3389) : (i64, i64) -> i64
      %3391 = func.call @cc_nil_value() : () -> i64
      %3392 = func.call @cc_cons(%3390, %3391) : (i64, i64) -> i64
      %3393 = func.call @cc_values_pack(%3392) : (i64) -> i64
      func.call @stack_push_pointer(%3390) : (i64) -> ()
      %3394 = func.call @stack_pop_pointer() : () -> i64
      %3395 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%3395) : (i64) -> ()
      %3396 = func.call @stack_pop_pointer() : () -> i64
      %3397 = func.call @cc_nil_value() : () -> i64
      %3398 = func.call @cc_errorp(%3394) : (i64) -> i64
      %3399 = arith.cmpi ne, %3398, %3397 : i64
      %3400 = arith.cmpi eq, %3397, %3397 : i64
      %3401 = arith.andi %3399, %3400 : i1
      %3402 = scf.if %3401 -> (i64) {
        scf.yield %3394 : i64
      } else {
        scf.yield %3397 : i64
      }
      %3403 = func.call @cc_errorp(%3396) : (i64) -> i64
      %3404 = arith.cmpi ne, %3403, %3397 : i64
      %3405 = arith.cmpi eq, %3402, %3397 : i64
      %3406 = arith.andi %3404, %3405 : i1
      %3407 = scf.if %3406 -> (i64) {
        scf.yield %3396 : i64
      } else {
        scf.yield %3402 : i64
      }
      %3408 = arith.cmpi ne, %3407, %3397 : i64
      scf.if %3408 {
        func.call @stack_push_pointer(%3407) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3394) : (i64) -> ()
        func.call @stack_push_pointer(%3396) : (i64) -> ()
        %3409 = llvm.mlir.addressof @str295 : !llvm.ptr
        %3410 = func.call @cc_make_function_ref_const(%3409) : (!llvm.ptr) -> i64
        %3411 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3410, %3411) : (i64, i64) -> ()
      }
      %3412 = func.call @stack_pop_pointer() : () -> i64
      %3413 = func.call @cc_multiple_value_list(%3412) : (i64) -> i64
      %3414 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3415 = arith.constant 37 : i64
      %3416 = func.call @cc_make_string(%3414, %3415) : (!llvm.ptr, i64) -> i64
      %3417 = func.call @cc_nil_value() : () -> i64
      %3418 = func.call @cc_intern(%3416, %3417) : (i64, i64) -> i64
      %3419 = func.call @cc_nil_value() : () -> i64
      %3420 = func.call @cc_cons(%3418, %3419) : (i64, i64) -> i64
      %3421 = func.call @cc_values_pack(%3420) : (i64) -> i64
      %3422 = func.call @cc_symbol_value(%3418) : (i64) -> i64
      %3423 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3424 = arith.constant 38 : i64
      %3425 = func.call @cc_make_string(%3423, %3424) : (!llvm.ptr, i64) -> i64
      %3426 = func.call @cc_nil_value() : () -> i64
      %3427 = func.call @cc_intern(%3425, %3426) : (i64, i64) -> i64
      %3428 = func.call @cc_nil_value() : () -> i64
      %3429 = func.call @cc_cons(%3427, %3428) : (i64, i64) -> i64
      %3430 = func.call @cc_values_pack(%3429) : (i64) -> i64
      %3431 = func.call @cc_symbol_value(%3427) : (i64) -> i64
      %3432 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3433 = arith.constant 39 : i64
      %3434 = func.call @cc_make_string(%3432, %3433) : (!llvm.ptr, i64) -> i64
      %3435 = func.call @cc_nil_value() : () -> i64
      %3436 = func.call @cc_intern(%3434, %3435) : (i64, i64) -> i64
      %3437 = func.call @cc_nil_value() : () -> i64
      %3438 = func.call @cc_cons(%3436, %3437) : (i64, i64) -> i64
      %3439 = func.call @cc_values_pack(%3438) : (i64) -> i64
      %3440 = func.call @cc_symbol_value(%3436) : (i64) -> i64
      %3441 = func.call @cc_nil_value() : () -> i64
      %3442 = arith.cmpi ne, %3422, %3441 : i64
      %3443 = scf.if %3442 -> (i64) {
        scf.yield %3440 : i64
      } else {
        scf.yield %3413 : i64
      }
      %3444 = func.call @cc_values_pack(%3443) : (i64) -> i64
      func.call @stack_push_pointer(%3444) : (i64) -> ()
      %3445 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3445 : i64
    }
    func.call @stack_push_pointer(%2993) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511523"() {
    %3982 = func.call @stack_pop_pointer() : () -> i64
    %3983 = func.call @cc_nil_value() : () -> i64
    %3984 = func.call @cc_nil_value() : () -> i64
    %3985 = func.call @cc_errorp(%3983) : (i64) -> i64
    %3986 = arith.cmpi ne, %3985, %3984 : i64
    %3987 = scf.if %3986 -> (i64) {
      scf.yield %3983 : i64
    } else {
      func.call @stack_push_pointer(%3982) : (i64) -> ()
      %3988 = func.call @stack_pop_pointer() : () -> i64
      %3989 = func.call @cc_nil_value() : () -> i64
      %3990 = func.call @cc_errorp(%3988) : (i64) -> i64
      %3991 = arith.cmpi ne, %3990, %3989 : i64
      %3992 = arith.cmpi eq, %3989, %3989 : i64
      %3993 = arith.andi %3991, %3992 : i1
      %3994 = scf.if %3993 -> (i64) {
        scf.yield %3988 : i64
      } else {
        scf.yield %3989 : i64
      }
      %3995 = arith.cmpi ne, %3994, %3989 : i64
      scf.if %3995 {
        func.call @stack_push_pointer(%3994) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3988) : (i64) -> ()
        %3996 = llvm.mlir.addressof @str345 : !llvm.ptr
        %3997 = func.call @cc_make_function_ref_const(%3996) : (!llvm.ptr) -> i64
        %3998 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3997, %3998) : (i64, i64) -> ()
      }
      %3999 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4000 = arith.constant 32 : i64
      %4001 = func.call @cc_make_string(%3999, %4000) : (!llvm.ptr, i64) -> i64
      %4002 = func.call @cc_nil_value() : () -> i64
      %4003 = func.call @cc_intern(%4001, %4002) : (i64, i64) -> i64
      %4004 = func.call @cc_nil_value() : () -> i64
      %4005 = func.call @cc_cons(%4003, %4004) : (i64, i64) -> i64
      %4006 = func.call @cc_values_pack(%4005) : (i64) -> i64
      func.call @stack_push_pointer(%4003) : (i64) -> ()
      %4007 = func.call @stack_pop_pointer() : () -> i64
      %4008 = func.call @stack_pop_pointer() : () -> i64
      %4009 = func.call @cc_eq(%4008, %4007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4009) : (i64) -> ()
      %4010 = func.call @stack_pop_pointer() : () -> i64
      %4011 = func.call @cc_nil_value() : () -> i64
      %4012 = arith.cmpi ne, %4010, %4011 : i64
      scf.if %4012 {
        %4013 = func.call @cc_nil_value() : () -> i64
        %4014 = func.call @cc_nil_value() : () -> i64
        %4015 = func.call @cc_errorp(%4013) : (i64) -> i64
        %4016 = arith.cmpi ne, %4015, %4014 : i64
        %4017 = scf.if %4016 -> (i64) {
          scf.yield %4013 : i64
        } else {
          func.call @stack_push_pointer(%3982) : (i64) -> ()
          %4018 = func.call @stack_pop_pointer() : () -> i64
          %4019 = func.call @cc_nil_value() : () -> i64
          %4020 = func.call @cc_errorp(%4018) : (i64) -> i64
          %4021 = arith.cmpi ne, %4020, %4019 : i64
          %4022 = arith.cmpi eq, %4019, %4019 : i64
          %4023 = arith.andi %4021, %4022 : i1
          %4024 = scf.if %4023 -> (i64) {
            scf.yield %4018 : i64
          } else {
            scf.yield %4019 : i64
          }
          %4025 = arith.cmpi ne, %4024, %4019 : i64
          scf.if %4025 {
            func.call @stack_push_pointer(%4024) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4018) : (i64) -> ()
            %4026 = llvm.mlir.addressof @str347 : !llvm.ptr
            %4027 = func.call @cc_make_function_ref_const(%4026) : (!llvm.ptr) -> i64
            %4028 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4027, %4028) : (i64, i64) -> ()
          }
          %4029 = func.call @stack_pop_pointer() : () -> i64
          %4030 = func.call @cc_multiple_value_list(%4029) : (i64) -> i64
          %4031 = func.call @cc_t_value() : () -> i64
          %4032 = llvm.mlir.addressof @str348 : !llvm.ptr
          %4033 = arith.constant 37 : i64
          %4034 = func.call @cc_make_string(%4032, %4033) : (!llvm.ptr, i64) -> i64
          %4035 = func.call @cc_nil_value() : () -> i64
          %4036 = func.call @cc_intern(%4034, %4035) : (i64, i64) -> i64
          %4037 = func.call @cc_nil_value() : () -> i64
          %4038 = func.call @cc_cons(%4036, %4037) : (i64, i64) -> i64
          %4039 = func.call @cc_values_pack(%4038) : (i64) -> i64
          %4040 = func.call @cc_set_symbol_value(%4036, %4031) : (i64, i64) -> i64
          %4041 = llvm.mlir.addressof @str349 : !llvm.ptr
          %4042 = arith.constant 38 : i64
          %4043 = func.call @cc_make_string(%4041, %4042) : (!llvm.ptr, i64) -> i64
          %4044 = func.call @cc_nil_value() : () -> i64
          %4045 = func.call @cc_intern(%4043, %4044) : (i64, i64) -> i64
          %4046 = func.call @cc_nil_value() : () -> i64
          %4047 = func.call @cc_cons(%4045, %4046) : (i64, i64) -> i64
          %4048 = func.call @cc_values_pack(%4047) : (i64) -> i64
          %4049 = func.call @cc_set_symbol_value(%4045, %4029) : (i64, i64) -> i64
          %4050 = llvm.mlir.addressof @str350 : !llvm.ptr
          %4051 = arith.constant 39 : i64
          %4052 = func.call @cc_make_string(%4050, %4051) : (!llvm.ptr, i64) -> i64
          %4053 = func.call @cc_nil_value() : () -> i64
          %4054 = func.call @cc_intern(%4052, %4053) : (i64, i64) -> i64
          %4055 = func.call @cc_nil_value() : () -> i64
          %4056 = func.call @cc_cons(%4054, %4055) : (i64, i64) -> i64
          %4057 = func.call @cc_values_pack(%4056) : (i64) -> i64
          %4058 = func.call @cc_set_symbol_value(%4054, %4030) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4029) : (i64) -> ()
          %4059 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4059 : i64
        }
        func.call @stack_push_pointer(%4017) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %4060 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4060 : i64
    }
    func.call @stack_push_pointer(%3987) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511522"() {
    %3969 = func.call @stack_pop_pointer() : () -> i64
    %3970 = func.call @cc_nil_value() : () -> i64
    %3971 = func.call @cc_nil_value() : () -> i64
    %3972 = func.call @cc_errorp(%3970) : (i64) -> i64
    %3973 = arith.cmpi ne, %3972, %3971 : i64
    %3974 = scf.if %3973 -> (i64) {
      scf.yield %3970 : i64
    } else {
      %3975 = func.call @cc_t_value() : () -> i64
      %3976 = func.call @cc_debug_current_stack(%3975) : (i64) -> i64
      %3977 = func.call @cc_nil_value() : () -> i64
      %3978 = func.call @cc_nil_value() : () -> i64
      %3979 = func.call @cc_errorp(%3977) : (i64) -> i64
      %3980 = arith.cmpi ne, %3979, %3978 : i64
      %3981 = scf.if %3980 -> (i64) {
        scf.yield %3977 : i64
      } else {
        %4061 = arith.constant 97047688511523 : i64
        %4062 = arith.constant 0 : i64
        %4063 = func.call @cc_make_closure(%4061, %4062) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4063) : (i64) -> ()
        %4064 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3976) : (i64) -> ()
        %4065 = func.call @stack_pop_pointer() : () -> i64
        %4066 = func.call @cc_nil_value() : () -> i64
        %4067 = func.call @cc_errorp(%4064) : (i64) -> i64
        %4068 = arith.cmpi ne, %4067, %4066 : i64
        %4069 = arith.cmpi eq, %4066, %4066 : i64
        %4070 = arith.andi %4068, %4069 : i1
        %4071 = scf.if %4070 -> (i64) {
          scf.yield %4064 : i64
        } else {
          scf.yield %4066 : i64
        }
        %4072 = func.call @cc_errorp(%4065) : (i64) -> i64
        %4073 = arith.cmpi ne, %4072, %4066 : i64
        %4074 = arith.cmpi eq, %4071, %4066 : i64
        %4075 = arith.andi %4073, %4074 : i1
        %4076 = scf.if %4075 -> (i64) {
          scf.yield %4065 : i64
        } else {
          scf.yield %4071 : i64
        }
        %4077 = arith.cmpi ne, %4076, %4066 : i64
        scf.if %4077 {
          func.call @stack_push_pointer(%4076) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4064) : (i64) -> ()
          func.call @stack_push_pointer(%4065) : (i64) -> ()
          %4078 = llvm.mlir.addressof @str351 : !llvm.ptr
          %4079 = func.call @cc_make_function_ref_const(%4078) : (!llvm.ptr) -> i64
          %4080 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4079, %4080) : (i64, i64) -> ()
        }
        %4081 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4081 : i64
      }
      func.call @stack_push_pointer(%3981) : (i64) -> ()
      %4082 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4082 : i64
    }
    func.call @stack_push_pointer(%3974) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511520"() {
    %3933 = func.call @stack_pop_pointer() : () -> i64
    %3934 = func.call @cc_nil_value() : () -> i64
    %3935 = func.call @cc_nil_value() : () -> i64
    %3936 = func.call @cc_errorp(%3934) : (i64) -> i64
    %3937 = arith.cmpi ne, %3936, %3935 : i64
    %3938 = scf.if %3937 -> (i64) {
      scf.yield %3934 : i64
    } else {
      %3939 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3940 = func.call @cc_make_function_ref_const(%3939) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3940) : (i64) -> ()
      %3941 = func.call @cc_nil_value() : () -> i64
      %3942 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3943 = arith.constant 37 : i64
      %3944 = func.call @cc_make_string(%3942, %3943) : (!llvm.ptr, i64) -> i64
      %3945 = func.call @cc_nil_value() : () -> i64
      %3946 = func.call @cc_intern(%3944, %3945) : (i64, i64) -> i64
      %3947 = func.call @cc_nil_value() : () -> i64
      %3948 = func.call @cc_cons(%3946, %3947) : (i64, i64) -> i64
      %3949 = func.call @cc_values_pack(%3948) : (i64) -> i64
      %3950 = func.call @cc_set_symbol_value(%3946, %3941) : (i64, i64) -> i64
      %3951 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3952 = arith.constant 38 : i64
      %3953 = func.call @cc_make_string(%3951, %3952) : (!llvm.ptr, i64) -> i64
      %3954 = func.call @cc_nil_value() : () -> i64
      %3955 = func.call @cc_intern(%3953, %3954) : (i64, i64) -> i64
      %3956 = func.call @cc_nil_value() : () -> i64
      %3957 = func.call @cc_cons(%3955, %3956) : (i64, i64) -> i64
      %3958 = func.call @cc_values_pack(%3957) : (i64) -> i64
      %3959 = func.call @cc_set_symbol_value(%3955, %3941) : (i64, i64) -> i64
      %3960 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3961 = arith.constant 39 : i64
      %3962 = func.call @cc_make_string(%3960, %3961) : (!llvm.ptr, i64) -> i64
      %3963 = func.call @cc_nil_value() : () -> i64
      %3964 = func.call @cc_intern(%3962, %3963) : (i64, i64) -> i64
      %3965 = func.call @cc_nil_value() : () -> i64
      %3966 = func.call @cc_cons(%3964, %3965) : (i64, i64) -> i64
      %3967 = func.call @cc_values_pack(%3966) : (i64) -> i64
      %3968 = func.call @cc_set_symbol_value(%3964, %3941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3933) : (i64) -> ()
      %4083 = arith.constant 97047688511522 : i64
      %4084 = arith.constant 1 : i64
      %4085 = func.call @cc_make_closure(%4083, %4084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4085) : (i64) -> ()
      %4086 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4087 = func.call @stack_pop_pointer() : () -> i64
      %4088 = func.call @cc_nil_value() : () -> i64
      %4089 = func.call @cc_errorp(%4086) : (i64) -> i64
      %4090 = arith.cmpi ne, %4089, %4088 : i64
      %4091 = arith.cmpi eq, %4088, %4088 : i64
      %4092 = arith.andi %4090, %4091 : i1
      %4093 = scf.if %4092 -> (i64) {
        scf.yield %4086 : i64
      } else {
        scf.yield %4088 : i64
      }
      %4094 = func.call @cc_errorp(%4087) : (i64) -> i64
      %4095 = arith.cmpi ne, %4094, %4088 : i64
      %4096 = arith.cmpi eq, %4093, %4088 : i64
      %4097 = arith.andi %4095, %4096 : i1
      %4098 = scf.if %4097 -> (i64) {
        scf.yield %4087 : i64
      } else {
        scf.yield %4093 : i64
      }
      %4099 = arith.cmpi ne, %4098, %4088 : i64
      scf.if %4099 {
        func.call @stack_push_pointer(%4098) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4086) : (i64) -> ()
        func.call @stack_push_pointer(%4087) : (i64) -> ()
        %4100 = llvm.mlir.addressof @str352 : !llvm.ptr
        %4101 = func.call @cc_make_function_ref_const(%4100) : (!llvm.ptr) -> i64
        %4102 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%4101, %4102) : (i64, i64) -> ()
      }
      %4103 = func.call @stack_pop_pointer() : () -> i64
      %4104 = func.call @cc_multiple_value_list(%4103) : (i64) -> i64
      %4105 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4106 = arith.constant 37 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = func.call @cc_nil_value() : () -> i64
      %4109 = func.call @cc_intern(%4107, %4108) : (i64, i64) -> i64
      %4110 = func.call @cc_nil_value() : () -> i64
      %4111 = func.call @cc_cons(%4109, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_values_pack(%4111) : (i64) -> i64
      %4113 = func.call @cc_symbol_value(%4109) : (i64) -> i64
      %4114 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4115 = arith.constant 38 : i64
      %4116 = func.call @cc_make_string(%4114, %4115) : (!llvm.ptr, i64) -> i64
      %4117 = func.call @cc_nil_value() : () -> i64
      %4118 = func.call @cc_intern(%4116, %4117) : (i64, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_cons(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_values_pack(%4120) : (i64) -> i64
      %4122 = func.call @cc_symbol_value(%4118) : (i64) -> i64
      %4123 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4124 = arith.constant 39 : i64
      %4125 = func.call @cc_make_string(%4123, %4124) : (!llvm.ptr, i64) -> i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_intern(%4125, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_nil_value() : () -> i64
      %4129 = func.call @cc_cons(%4127, %4128) : (i64, i64) -> i64
      %4130 = func.call @cc_values_pack(%4129) : (i64) -> i64
      %4131 = func.call @cc_symbol_value(%4127) : (i64) -> i64
      %4132 = func.call @cc_nil_value() : () -> i64
      %4133 = arith.cmpi ne, %4113, %4132 : i64
      %4134 = scf.if %4133 -> (i64) {
        scf.yield %4131 : i64
      } else {
        scf.yield %4104 : i64
      }
      %4135 = func.call @cc_values_pack(%4134) : (i64) -> i64
      func.call @stack_push_pointer(%4135) : (i64) -> ()
      %4136 = func.call @stack_pop_pointer() : () -> i64
      %4137 = func.call @stack_pop_pointer() : () -> i64
      %4138 = func.call @cc_eq(%4137, %4136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4139 = func.call @stack_pop_pointer() : () -> i64
      %4140 = func.call @cc_nil_value() : () -> i64
      %4141 = func.call @cc_cons(%4139, %4140) : (i64, i64) -> i64
      %4142 = func.call @cc_not(%4141) : (i64) -> i64
      func.call @stack_push_pointer(%4142) : (i64) -> ()
      %4143 = func.call @stack_pop_pointer() : () -> i64
      %4144 = func.call @cc_nil_value() : () -> i64
      %4145 = func.call @cc_cons(%4143, %4144) : (i64, i64) -> i64
      %4146 = func.call @cc_not(%4145) : (i64) -> i64
      func.call @stack_push_pointer(%4146) : (i64) -> ()
      %4147 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4147 : i64
    }
    func.call @stack_push_pointer(%3938) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511528"() {
    %4582 = func.call @stack_pop_pointer() : () -> i64
    %4583 = func.call @cc_nil_value() : () -> i64
    %4584 = func.call @cc_nil_value() : () -> i64
    %4585 = func.call @cc_errorp(%4583) : (i64) -> i64
    %4586 = arith.cmpi ne, %4585, %4584 : i64
    %4587 = scf.if %4586 -> (i64) {
      scf.yield %4583 : i64
    } else {
      func.call @stack_push_pointer(%4582) : (i64) -> ()
      %4588 = func.call @stack_pop_pointer() : () -> i64
      %4589 = func.call @cc_nil_value() : () -> i64
      %4590 = func.call @cc_errorp(%4588) : (i64) -> i64
      %4591 = arith.cmpi ne, %4590, %4589 : i64
      %4592 = arith.cmpi eq, %4589, %4589 : i64
      %4593 = arith.andi %4591, %4592 : i1
      %4594 = scf.if %4593 -> (i64) {
        scf.yield %4588 : i64
      } else {
        scf.yield %4589 : i64
      }
      %4595 = arith.cmpi ne, %4594, %4589 : i64
      scf.if %4595 {
        func.call @stack_push_pointer(%4594) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4588) : (i64) -> ()
        %4596 = llvm.mlir.addressof @str392 : !llvm.ptr
        %4597 = func.call @cc_make_function_ref_const(%4596) : (!llvm.ptr) -> i64
        %4598 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4597, %4598) : (i64, i64) -> ()
      }
      %4599 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4600 = arith.constant 32 : i64
      %4601 = func.call @cc_make_string(%4599, %4600) : (!llvm.ptr, i64) -> i64
      %4602 = func.call @cc_nil_value() : () -> i64
      %4603 = func.call @cc_intern(%4601, %4602) : (i64, i64) -> i64
      %4604 = func.call @cc_nil_value() : () -> i64
      %4605 = func.call @cc_cons(%4603, %4604) : (i64, i64) -> i64
      %4606 = func.call @cc_values_pack(%4605) : (i64) -> i64
      func.call @stack_push_pointer(%4603) : (i64) -> ()
      %4607 = func.call @stack_pop_pointer() : () -> i64
      %4608 = func.call @stack_pop_pointer() : () -> i64
      %4609 = func.call @cc_eq(%4608, %4607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4609) : (i64) -> ()
      %4610 = func.call @stack_pop_pointer() : () -> i64
      %4611 = func.call @cc_nil_value() : () -> i64
      %4612 = arith.cmpi ne, %4610, %4611 : i64
      scf.if %4612 {
        %4613 = func.call @cc_nil_value() : () -> i64
        %4614 = func.call @cc_nil_value() : () -> i64
        %4615 = func.call @cc_errorp(%4613) : (i64) -> i64
        %4616 = arith.cmpi ne, %4615, %4614 : i64
        %4617 = scf.if %4616 -> (i64) {
          scf.yield %4613 : i64
        } else {
          func.call @stack_push_pointer(%4582) : (i64) -> ()
          %4618 = func.call @stack_pop_pointer() : () -> i64
          %4619 = func.call @cc_nil_value() : () -> i64
          %4620 = func.call @cc_errorp(%4618) : (i64) -> i64
          %4621 = arith.cmpi ne, %4620, %4619 : i64
          %4622 = arith.cmpi eq, %4619, %4619 : i64
          %4623 = arith.andi %4621, %4622 : i1
          %4624 = scf.if %4623 -> (i64) {
            scf.yield %4618 : i64
          } else {
            scf.yield %4619 : i64
          }
          %4625 = arith.cmpi ne, %4624, %4619 : i64
          scf.if %4625 {
            func.call @stack_push_pointer(%4624) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4618) : (i64) -> ()
            %4626 = llvm.mlir.addressof @str394 : !llvm.ptr
            %4627 = func.call @cc_make_function_ref_const(%4626) : (!llvm.ptr) -> i64
            %4628 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4627, %4628) : (i64, i64) -> ()
          }
          %4629 = func.call @stack_pop_pointer() : () -> i64
          %4630 = func.call @cc_multiple_value_list(%4629) : (i64) -> i64
          %4631 = func.call @cc_t_value() : () -> i64
          %4632 = llvm.mlir.addressof @str395 : !llvm.ptr
          %4633 = arith.constant 37 : i64
          %4634 = func.call @cc_make_string(%4632, %4633) : (!llvm.ptr, i64) -> i64
          %4635 = func.call @cc_nil_value() : () -> i64
          %4636 = func.call @cc_intern(%4634, %4635) : (i64, i64) -> i64
          %4637 = func.call @cc_nil_value() : () -> i64
          %4638 = func.call @cc_cons(%4636, %4637) : (i64, i64) -> i64
          %4639 = func.call @cc_values_pack(%4638) : (i64) -> i64
          %4640 = func.call @cc_set_symbol_value(%4636, %4631) : (i64, i64) -> i64
          %4641 = llvm.mlir.addressof @str396 : !llvm.ptr
          %4642 = arith.constant 38 : i64
          %4643 = func.call @cc_make_string(%4641, %4642) : (!llvm.ptr, i64) -> i64
          %4644 = func.call @cc_nil_value() : () -> i64
          %4645 = func.call @cc_intern(%4643, %4644) : (i64, i64) -> i64
          %4646 = func.call @cc_nil_value() : () -> i64
          %4647 = func.call @cc_cons(%4645, %4646) : (i64, i64) -> i64
          %4648 = func.call @cc_values_pack(%4647) : (i64) -> i64
          %4649 = func.call @cc_set_symbol_value(%4645, %4629) : (i64, i64) -> i64
          %4650 = llvm.mlir.addressof @str397 : !llvm.ptr
          %4651 = arith.constant 39 : i64
          %4652 = func.call @cc_make_string(%4650, %4651) : (!llvm.ptr, i64) -> i64
          %4653 = func.call @cc_nil_value() : () -> i64
          %4654 = func.call @cc_intern(%4652, %4653) : (i64, i64) -> i64
          %4655 = func.call @cc_nil_value() : () -> i64
          %4656 = func.call @cc_cons(%4654, %4655) : (i64, i64) -> i64
          %4657 = func.call @cc_values_pack(%4656) : (i64) -> i64
          %4658 = func.call @cc_set_symbol_value(%4654, %4630) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4629) : (i64) -> ()
          %4659 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4659 : i64
        }
        func.call @stack_push_pointer(%4617) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %4660 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4660 : i64
    }
    func.call @stack_push_pointer(%4587) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511527"() {
    %4569 = func.call @stack_pop_pointer() : () -> i64
    %4570 = func.call @cc_nil_value() : () -> i64
    %4571 = func.call @cc_nil_value() : () -> i64
    %4572 = func.call @cc_errorp(%4570) : (i64) -> i64
    %4573 = arith.cmpi ne, %4572, %4571 : i64
    %4574 = scf.if %4573 -> (i64) {
      scf.yield %4570 : i64
    } else {
      %4575 = func.call @cc_t_value() : () -> i64
      %4576 = func.call @cc_debug_current_stack(%4575) : (i64) -> i64
      %4577 = func.call @cc_nil_value() : () -> i64
      %4578 = func.call @cc_nil_value() : () -> i64
      %4579 = func.call @cc_errorp(%4577) : (i64) -> i64
      %4580 = arith.cmpi ne, %4579, %4578 : i64
      %4581 = scf.if %4580 -> (i64) {
        scf.yield %4577 : i64
      } else {
        %4661 = arith.constant 97047688511528 : i64
        %4662 = arith.constant 0 : i64
        %4663 = func.call @cc_make_closure(%4661, %4662) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4663) : (i64) -> ()
        %4664 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4576) : (i64) -> ()
        %4665 = func.call @stack_pop_pointer() : () -> i64
        %4666 = func.call @cc_nil_value() : () -> i64
        %4667 = func.call @cc_errorp(%4664) : (i64) -> i64
        %4668 = arith.cmpi ne, %4667, %4666 : i64
        %4669 = arith.cmpi eq, %4666, %4666 : i64
        %4670 = arith.andi %4668, %4669 : i1
        %4671 = scf.if %4670 -> (i64) {
          scf.yield %4664 : i64
        } else {
          scf.yield %4666 : i64
        }
        %4672 = func.call @cc_errorp(%4665) : (i64) -> i64
        %4673 = arith.cmpi ne, %4672, %4666 : i64
        %4674 = arith.cmpi eq, %4671, %4666 : i64
        %4675 = arith.andi %4673, %4674 : i1
        %4676 = scf.if %4675 -> (i64) {
          scf.yield %4665 : i64
        } else {
          scf.yield %4671 : i64
        }
        %4677 = arith.cmpi ne, %4676, %4666 : i64
        scf.if %4677 {
          func.call @stack_push_pointer(%4676) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4664) : (i64) -> ()
          func.call @stack_push_pointer(%4665) : (i64) -> ()
          %4678 = llvm.mlir.addressof @str398 : !llvm.ptr
          %4679 = func.call @cc_make_function_ref_const(%4678) : (!llvm.ptr) -> i64
          %4680 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4679, %4680) : (i64, i64) -> ()
        }
        %4681 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4681 : i64
      }
      func.call @stack_push_pointer(%4581) : (i64) -> ()
      %4682 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4682 : i64
    }
    func.call @stack_push_pointer(%4574) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511525"() {
    %4535 = func.call @stack_pop_pointer() : () -> i64
    %4536 = func.call @cc_nil_value() : () -> i64
    %4537 = func.call @cc_nil_value() : () -> i64
    %4538 = func.call @cc_errorp(%4536) : (i64) -> i64
    %4539 = arith.cmpi ne, %4538, %4537 : i64
    %4540 = scf.if %4539 -> (i64) {
      scf.yield %4536 : i64
    } else {
      %4541 = func.call @cc_nil_value() : () -> i64
      %4542 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4543 = arith.constant 37 : i64
      %4544 = func.call @cc_make_string(%4542, %4543) : (!llvm.ptr, i64) -> i64
      %4545 = func.call @cc_nil_value() : () -> i64
      %4546 = func.call @cc_intern(%4544, %4545) : (i64, i64) -> i64
      %4547 = func.call @cc_nil_value() : () -> i64
      %4548 = func.call @cc_cons(%4546, %4547) : (i64, i64) -> i64
      %4549 = func.call @cc_values_pack(%4548) : (i64) -> i64
      %4550 = func.call @cc_set_symbol_value(%4546, %4541) : (i64, i64) -> i64
      %4551 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4552 = arith.constant 38 : i64
      %4553 = func.call @cc_make_string(%4551, %4552) : (!llvm.ptr, i64) -> i64
      %4554 = func.call @cc_nil_value() : () -> i64
      %4555 = func.call @cc_intern(%4553, %4554) : (i64, i64) -> i64
      %4556 = func.call @cc_nil_value() : () -> i64
      %4557 = func.call @cc_cons(%4555, %4556) : (i64, i64) -> i64
      %4558 = func.call @cc_values_pack(%4557) : (i64) -> i64
      %4559 = func.call @cc_set_symbol_value(%4555, %4541) : (i64, i64) -> i64
      %4560 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4561 = arith.constant 39 : i64
      %4562 = func.call @cc_make_string(%4560, %4561) : (!llvm.ptr, i64) -> i64
      %4563 = func.call @cc_nil_value() : () -> i64
      %4564 = func.call @cc_intern(%4562, %4563) : (i64, i64) -> i64
      %4565 = func.call @cc_nil_value() : () -> i64
      %4566 = func.call @cc_cons(%4564, %4565) : (i64, i64) -> i64
      %4567 = func.call @cc_values_pack(%4566) : (i64) -> i64
      %4568 = func.call @cc_set_symbol_value(%4564, %4541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4535) : (i64) -> ()
      %4683 = arith.constant 97047688511527 : i64
      %4684 = arith.constant 1 : i64
      %4685 = func.call @cc_make_closure(%4683, %4684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4685) : (i64) -> ()
      %4686 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4687 = func.call @stack_pop_pointer() : () -> i64
      %4688 = func.call @cc_nil_value() : () -> i64
      %4689 = func.call @cc_errorp(%4686) : (i64) -> i64
      %4690 = arith.cmpi ne, %4689, %4688 : i64
      %4691 = arith.cmpi eq, %4688, %4688 : i64
      %4692 = arith.andi %4690, %4691 : i1
      %4693 = scf.if %4692 -> (i64) {
        scf.yield %4686 : i64
      } else {
        scf.yield %4688 : i64
      }
      %4694 = func.call @cc_errorp(%4687) : (i64) -> i64
      %4695 = arith.cmpi ne, %4694, %4688 : i64
      %4696 = arith.cmpi eq, %4693, %4688 : i64
      %4697 = arith.andi %4695, %4696 : i1
      %4698 = scf.if %4697 -> (i64) {
        scf.yield %4687 : i64
      } else {
        scf.yield %4693 : i64
      }
      %4699 = arith.cmpi ne, %4698, %4688 : i64
      scf.if %4699 {
        func.call @stack_push_pointer(%4698) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4686) : (i64) -> ()
        func.call @stack_push_pointer(%4687) : (i64) -> ()
        %4700 = llvm.mlir.addressof @str399 : !llvm.ptr
        %4701 = func.call @cc_make_function_ref_const(%4700) : (!llvm.ptr) -> i64
        %4702 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%4701, %4702) : (i64, i64) -> ()
      }
      %4703 = func.call @stack_pop_pointer() : () -> i64
      %4704 = func.call @cc_multiple_value_list(%4703) : (i64) -> i64
      %4705 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4706 = arith.constant 37 : i64
      %4707 = func.call @cc_make_string(%4705, %4706) : (!llvm.ptr, i64) -> i64
      %4708 = func.call @cc_nil_value() : () -> i64
      %4709 = func.call @cc_intern(%4707, %4708) : (i64, i64) -> i64
      %4710 = func.call @cc_nil_value() : () -> i64
      %4711 = func.call @cc_cons(%4709, %4710) : (i64, i64) -> i64
      %4712 = func.call @cc_values_pack(%4711) : (i64) -> i64
      %4713 = func.call @cc_symbol_value(%4709) : (i64) -> i64
      %4714 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4715 = arith.constant 38 : i64
      %4716 = func.call @cc_make_string(%4714, %4715) : (!llvm.ptr, i64) -> i64
      %4717 = func.call @cc_nil_value() : () -> i64
      %4718 = func.call @cc_intern(%4716, %4717) : (i64, i64) -> i64
      %4719 = func.call @cc_nil_value() : () -> i64
      %4720 = func.call @cc_cons(%4718, %4719) : (i64, i64) -> i64
      %4721 = func.call @cc_values_pack(%4720) : (i64) -> i64
      %4722 = func.call @cc_symbol_value(%4718) : (i64) -> i64
      %4723 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4724 = arith.constant 39 : i64
      %4725 = func.call @cc_make_string(%4723, %4724) : (!llvm.ptr, i64) -> i64
      %4726 = func.call @cc_nil_value() : () -> i64
      %4727 = func.call @cc_intern(%4725, %4726) : (i64, i64) -> i64
      %4728 = func.call @cc_nil_value() : () -> i64
      %4729 = func.call @cc_cons(%4727, %4728) : (i64, i64) -> i64
      %4730 = func.call @cc_values_pack(%4729) : (i64) -> i64
      %4731 = func.call @cc_symbol_value(%4727) : (i64) -> i64
      %4732 = func.call @cc_nil_value() : () -> i64
      %4733 = arith.cmpi ne, %4713, %4732 : i64
      %4734 = scf.if %4733 -> (i64) {
        scf.yield %4731 : i64
      } else {
        scf.yield %4704 : i64
      }
      %4735 = func.call @cc_values_pack(%4734) : (i64) -> i64
      func.call @stack_push_pointer(%4735) : (i64) -> ()
      %4736 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4736 : i64
    }
    func.call @stack_push_pointer(%4540) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511533"() {
    %5189 = func.call @stack_pop_pointer() : () -> i64
    %5190 = func.call @cc_nil_value() : () -> i64
    %5191 = func.call @cc_nil_value() : () -> i64
    %5192 = func.call @cc_errorp(%5190) : (i64) -> i64
    %5193 = arith.cmpi ne, %5192, %5191 : i64
    %5194 = scf.if %5193 -> (i64) {
      scf.yield %5190 : i64
    } else {
      func.call @stack_push_pointer(%5189) : (i64) -> ()
      %5195 = func.call @stack_pop_pointer() : () -> i64
      %5196 = func.call @cc_nil_value() : () -> i64
      %5197 = func.call @cc_errorp(%5195) : (i64) -> i64
      %5198 = arith.cmpi ne, %5197, %5196 : i64
      %5199 = arith.cmpi eq, %5196, %5196 : i64
      %5200 = arith.andi %5198, %5199 : i1
      %5201 = scf.if %5200 -> (i64) {
        scf.yield %5195 : i64
      } else {
        scf.yield %5196 : i64
      }
      %5202 = arith.cmpi ne, %5201, %5196 : i64
      scf.if %5202 {
        func.call @stack_push_pointer(%5201) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5195) : (i64) -> ()
        %5203 = llvm.mlir.addressof @str440 : !llvm.ptr
        %5204 = func.call @cc_make_function_ref_const(%5203) : (!llvm.ptr) -> i64
        %5205 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5204, %5205) : (i64, i64) -> ()
      }
      %5206 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5207 = arith.constant 32 : i64
      %5208 = func.call @cc_make_string(%5206, %5207) : (!llvm.ptr, i64) -> i64
      %5209 = func.call @cc_nil_value() : () -> i64
      %5210 = func.call @cc_intern(%5208, %5209) : (i64, i64) -> i64
      %5211 = func.call @cc_nil_value() : () -> i64
      %5212 = func.call @cc_cons(%5210, %5211) : (i64, i64) -> i64
      %5213 = func.call @cc_values_pack(%5212) : (i64) -> i64
      func.call @stack_push_pointer(%5210) : (i64) -> ()
      %5214 = func.call @stack_pop_pointer() : () -> i64
      %5215 = func.call @stack_pop_pointer() : () -> i64
      %5216 = func.call @cc_eq(%5215, %5214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5216) : (i64) -> ()
      %5217 = func.call @stack_pop_pointer() : () -> i64
      %5218 = func.call @cc_nil_value() : () -> i64
      %5219 = arith.cmpi ne, %5217, %5218 : i64
      scf.if %5219 {
        %5220 = func.call @cc_nil_value() : () -> i64
        %5221 = func.call @cc_nil_value() : () -> i64
        %5222 = func.call @cc_errorp(%5220) : (i64) -> i64
        %5223 = arith.cmpi ne, %5222, %5221 : i64
        %5224 = scf.if %5223 -> (i64) {
          scf.yield %5220 : i64
        } else {
          func.call @stack_push_pointer(%5189) : (i64) -> ()
          %5225 = func.call @stack_pop_pointer() : () -> i64
          %5226 = func.call @cc_nil_value() : () -> i64
          %5227 = func.call @cc_errorp(%5225) : (i64) -> i64
          %5228 = arith.cmpi ne, %5227, %5226 : i64
          %5229 = arith.cmpi eq, %5226, %5226 : i64
          %5230 = arith.andi %5228, %5229 : i1
          %5231 = scf.if %5230 -> (i64) {
            scf.yield %5225 : i64
          } else {
            scf.yield %5226 : i64
          }
          %5232 = arith.cmpi ne, %5231, %5226 : i64
          scf.if %5232 {
            func.call @stack_push_pointer(%5231) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%5225) : (i64) -> ()
            %5233 = llvm.mlir.addressof @str442 : !llvm.ptr
            %5234 = func.call @cc_make_function_ref_const(%5233) : (!llvm.ptr) -> i64
            %5235 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%5234, %5235) : (i64, i64) -> ()
          }
          %5236 = func.call @stack_pop_pointer() : () -> i64
          %5237 = func.call @cc_multiple_value_list(%5236) : (i64) -> i64
          %5238 = func.call @cc_t_value() : () -> i64
          %5239 = llvm.mlir.addressof @str443 : !llvm.ptr
          %5240 = arith.constant 37 : i64
          %5241 = func.call @cc_make_string(%5239, %5240) : (!llvm.ptr, i64) -> i64
          %5242 = func.call @cc_nil_value() : () -> i64
          %5243 = func.call @cc_intern(%5241, %5242) : (i64, i64) -> i64
          %5244 = func.call @cc_nil_value() : () -> i64
          %5245 = func.call @cc_cons(%5243, %5244) : (i64, i64) -> i64
          %5246 = func.call @cc_values_pack(%5245) : (i64) -> i64
          %5247 = func.call @cc_set_symbol_value(%5243, %5238) : (i64, i64) -> i64
          %5248 = llvm.mlir.addressof @str444 : !llvm.ptr
          %5249 = arith.constant 38 : i64
          %5250 = func.call @cc_make_string(%5248, %5249) : (!llvm.ptr, i64) -> i64
          %5251 = func.call @cc_nil_value() : () -> i64
          %5252 = func.call @cc_intern(%5250, %5251) : (i64, i64) -> i64
          %5253 = func.call @cc_nil_value() : () -> i64
          %5254 = func.call @cc_cons(%5252, %5253) : (i64, i64) -> i64
          %5255 = func.call @cc_values_pack(%5254) : (i64) -> i64
          %5256 = func.call @cc_set_symbol_value(%5252, %5236) : (i64, i64) -> i64
          %5257 = llvm.mlir.addressof @str445 : !llvm.ptr
          %5258 = arith.constant 39 : i64
          %5259 = func.call @cc_make_string(%5257, %5258) : (!llvm.ptr, i64) -> i64
          %5260 = func.call @cc_nil_value() : () -> i64
          %5261 = func.call @cc_intern(%5259, %5260) : (i64, i64) -> i64
          %5262 = func.call @cc_nil_value() : () -> i64
          %5263 = func.call @cc_cons(%5261, %5262) : (i64, i64) -> i64
          %5264 = func.call @cc_values_pack(%5263) : (i64) -> i64
          %5265 = func.call @cc_set_symbol_value(%5261, %5237) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5236) : (i64) -> ()
          %5266 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %5266 : i64
        }
        func.call @stack_push_pointer(%5224) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %5267 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5267 : i64
    }
    func.call @stack_push_pointer(%5194) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511532"() {
    %5176 = func.call @stack_pop_pointer() : () -> i64
    %5177 = func.call @cc_nil_value() : () -> i64
    %5178 = func.call @cc_nil_value() : () -> i64
    %5179 = func.call @cc_errorp(%5177) : (i64) -> i64
    %5180 = arith.cmpi ne, %5179, %5178 : i64
    %5181 = scf.if %5180 -> (i64) {
      scf.yield %5177 : i64
    } else {
      %5182 = func.call @cc_t_value() : () -> i64
      %5183 = func.call @cc_debug_current_stack(%5182) : (i64) -> i64
      %5184 = func.call @cc_nil_value() : () -> i64
      %5185 = func.call @cc_nil_value() : () -> i64
      %5186 = func.call @cc_errorp(%5184) : (i64) -> i64
      %5187 = arith.cmpi ne, %5186, %5185 : i64
      %5188 = scf.if %5187 -> (i64) {
        scf.yield %5184 : i64
      } else {
        %5268 = arith.constant 97047688511533 : i64
        %5269 = arith.constant 0 : i64
        %5270 = func.call @cc_make_closure(%5268, %5269) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5270) : (i64) -> ()
        %5271 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5183) : (i64) -> ()
        %5272 = func.call @stack_pop_pointer() : () -> i64
        %5273 = func.call @cc_nil_value() : () -> i64
        %5274 = func.call @cc_errorp(%5271) : (i64) -> i64
        %5275 = arith.cmpi ne, %5274, %5273 : i64
        %5276 = arith.cmpi eq, %5273, %5273 : i64
        %5277 = arith.andi %5275, %5276 : i1
        %5278 = scf.if %5277 -> (i64) {
          scf.yield %5271 : i64
        } else {
          scf.yield %5273 : i64
        }
        %5279 = func.call @cc_errorp(%5272) : (i64) -> i64
        %5280 = arith.cmpi ne, %5279, %5273 : i64
        %5281 = arith.cmpi eq, %5278, %5273 : i64
        %5282 = arith.andi %5280, %5281 : i1
        %5283 = scf.if %5282 -> (i64) {
          scf.yield %5272 : i64
        } else {
          scf.yield %5278 : i64
        }
        %5284 = arith.cmpi ne, %5283, %5273 : i64
        scf.if %5284 {
          func.call @stack_push_pointer(%5283) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5271) : (i64) -> ()
          func.call @stack_push_pointer(%5272) : (i64) -> ()
          %5285 = llvm.mlir.addressof @str446 : !llvm.ptr
          %5286 = func.call @cc_make_function_ref_const(%5285) : (!llvm.ptr) -> i64
          %5287 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%5286, %5287) : (i64, i64) -> ()
        }
        %5288 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5288 : i64
      }
      func.call @stack_push_pointer(%5188) : (i64) -> ()
      %5289 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5289 : i64
    }
    func.call @stack_push_pointer(%5181) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511530"() {
    %5142 = func.call @stack_pop_pointer() : () -> i64
    %5143 = func.call @cc_nil_value() : () -> i64
    %5144 = func.call @cc_nil_value() : () -> i64
    %5145 = func.call @cc_errorp(%5143) : (i64) -> i64
    %5146 = arith.cmpi ne, %5145, %5144 : i64
    %5147 = scf.if %5146 -> (i64) {
      scf.yield %5143 : i64
    } else {
      %5148 = func.call @cc_nil_value() : () -> i64
      %5149 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5150 = arith.constant 37 : i64
      %5151 = func.call @cc_make_string(%5149, %5150) : (!llvm.ptr, i64) -> i64
      %5152 = func.call @cc_nil_value() : () -> i64
      %5153 = func.call @cc_intern(%5151, %5152) : (i64, i64) -> i64
      %5154 = func.call @cc_nil_value() : () -> i64
      %5155 = func.call @cc_cons(%5153, %5154) : (i64, i64) -> i64
      %5156 = func.call @cc_values_pack(%5155) : (i64) -> i64
      %5157 = func.call @cc_set_symbol_value(%5153, %5148) : (i64, i64) -> i64
      %5158 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5159 = arith.constant 38 : i64
      %5160 = func.call @cc_make_string(%5158, %5159) : (!llvm.ptr, i64) -> i64
      %5161 = func.call @cc_nil_value() : () -> i64
      %5162 = func.call @cc_intern(%5160, %5161) : (i64, i64) -> i64
      %5163 = func.call @cc_nil_value() : () -> i64
      %5164 = func.call @cc_cons(%5162, %5163) : (i64, i64) -> i64
      %5165 = func.call @cc_values_pack(%5164) : (i64) -> i64
      %5166 = func.call @cc_set_symbol_value(%5162, %5148) : (i64, i64) -> i64
      %5167 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5168 = arith.constant 39 : i64
      %5169 = func.call @cc_make_string(%5167, %5168) : (!llvm.ptr, i64) -> i64
      %5170 = func.call @cc_nil_value() : () -> i64
      %5171 = func.call @cc_intern(%5169, %5170) : (i64, i64) -> i64
      %5172 = func.call @cc_nil_value() : () -> i64
      %5173 = func.call @cc_cons(%5171, %5172) : (i64, i64) -> i64
      %5174 = func.call @cc_values_pack(%5173) : (i64) -> i64
      %5175 = func.call @cc_set_symbol_value(%5171, %5148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5142) : (i64) -> ()
      %5290 = arith.constant 97047688511532 : i64
      %5291 = arith.constant 1 : i64
      %5292 = func.call @cc_make_closure(%5290, %5291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5292) : (i64) -> ()
      %5293 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5294 = func.call @stack_pop_pointer() : () -> i64
      %5295 = func.call @cc_nil_value() : () -> i64
      %5296 = func.call @cc_errorp(%5293) : (i64) -> i64
      %5297 = arith.cmpi ne, %5296, %5295 : i64
      %5298 = arith.cmpi eq, %5295, %5295 : i64
      %5299 = arith.andi %5297, %5298 : i1
      %5300 = scf.if %5299 -> (i64) {
        scf.yield %5293 : i64
      } else {
        scf.yield %5295 : i64
      }
      %5301 = func.call @cc_errorp(%5294) : (i64) -> i64
      %5302 = arith.cmpi ne, %5301, %5295 : i64
      %5303 = arith.cmpi eq, %5300, %5295 : i64
      %5304 = arith.andi %5302, %5303 : i1
      %5305 = scf.if %5304 -> (i64) {
        scf.yield %5294 : i64
      } else {
        scf.yield %5300 : i64
      }
      %5306 = arith.cmpi ne, %5305, %5295 : i64
      scf.if %5306 {
        func.call @stack_push_pointer(%5305) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5293) : (i64) -> ()
        func.call @stack_push_pointer(%5294) : (i64) -> ()
        %5307 = llvm.mlir.addressof @str447 : !llvm.ptr
        %5308 = func.call @cc_make_function_ref_const(%5307) : (!llvm.ptr) -> i64
        %5309 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%5308, %5309) : (i64, i64) -> ()
      }
      %5310 = func.call @stack_pop_pointer() : () -> i64
      %5311 = func.call @cc_multiple_value_list(%5310) : (i64) -> i64
      %5312 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5313 = arith.constant 37 : i64
      %5314 = func.call @cc_make_string(%5312, %5313) : (!llvm.ptr, i64) -> i64
      %5315 = func.call @cc_nil_value() : () -> i64
      %5316 = func.call @cc_intern(%5314, %5315) : (i64, i64) -> i64
      %5317 = func.call @cc_nil_value() : () -> i64
      %5318 = func.call @cc_cons(%5316, %5317) : (i64, i64) -> i64
      %5319 = func.call @cc_values_pack(%5318) : (i64) -> i64
      %5320 = func.call @cc_symbol_value(%5316) : (i64) -> i64
      %5321 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5322 = arith.constant 38 : i64
      %5323 = func.call @cc_make_string(%5321, %5322) : (!llvm.ptr, i64) -> i64
      %5324 = func.call @cc_nil_value() : () -> i64
      %5325 = func.call @cc_intern(%5323, %5324) : (i64, i64) -> i64
      %5326 = func.call @cc_nil_value() : () -> i64
      %5327 = func.call @cc_cons(%5325, %5326) : (i64, i64) -> i64
      %5328 = func.call @cc_values_pack(%5327) : (i64) -> i64
      %5329 = func.call @cc_symbol_value(%5325) : (i64) -> i64
      %5330 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5331 = arith.constant 39 : i64
      %5332 = func.call @cc_make_string(%5330, %5331) : (!llvm.ptr, i64) -> i64
      %5333 = func.call @cc_nil_value() : () -> i64
      %5334 = func.call @cc_intern(%5332, %5333) : (i64, i64) -> i64
      %5335 = func.call @cc_nil_value() : () -> i64
      %5336 = func.call @cc_cons(%5334, %5335) : (i64, i64) -> i64
      %5337 = func.call @cc_values_pack(%5336) : (i64) -> i64
      %5338 = func.call @cc_symbol_value(%5334) : (i64) -> i64
      %5339 = func.call @cc_nil_value() : () -> i64
      %5340 = arith.cmpi ne, %5320, %5339 : i64
      %5341 = scf.if %5340 -> (i64) {
        scf.yield %5338 : i64
      } else {
        scf.yield %5311 : i64
      }
      %5342 = func.call @cc_values_pack(%5341) : (i64) -> i64
      func.call @stack_push_pointer(%5342) : (i64) -> ()
      %5343 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5343 : i64
    }
    func.call @stack_push_pointer(%5147) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511539"() {
    %6027 = func.call @stack_pop_pointer() : () -> i64
    %6028 = func.call @stack_pop_pointer() : () -> i64
    %6029 = func.call @cc_nil_value() : () -> i64
    %6030 = func.call @cc_nil_value() : () -> i64
    %6031 = func.call @cc_errorp(%6029) : (i64) -> i64
    %6032 = arith.cmpi ne, %6031, %6030 : i64
    %6033 = scf.if %6032 -> (i64) {
      scf.yield %6029 : i64
    } else {
      func.call @stack_push_pointer(%6027) : (i64) -> ()
      %6034 = func.call @stack_pop_pointer() : () -> i64
      %6035 = func.call @cc_nil_value() : () -> i64
      %6036 = func.call @cc_errorp(%6034) : (i64) -> i64
      %6037 = arith.cmpi ne, %6036, %6035 : i64
      %6038 = arith.cmpi eq, %6035, %6035 : i64
      %6039 = arith.andi %6037, %6038 : i1
      %6040 = scf.if %6039 -> (i64) {
        scf.yield %6034 : i64
      } else {
        scf.yield %6035 : i64
      }
      %6041 = arith.cmpi ne, %6040, %6035 : i64
      scf.if %6041 {
        func.call @stack_push_pointer(%6040) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6034) : (i64) -> ()
        %6042 = llvm.mlir.addressof @str518 : !llvm.ptr
        %6043 = func.call @cc_make_function_ref_const(%6042) : (!llvm.ptr) -> i64
        %6044 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6043, %6044) : (i64, i64) -> ()
      }
      %6045 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6046 = arith.constant 8 : i64
      %6047 = func.call @cc_make_string(%6045, %6046) : (!llvm.ptr, i64) -> i64
      %6048 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6049 = arith.constant 7 : i64
      %6050 = func.call @cc_make_string(%6048, %6049) : (!llvm.ptr, i64) -> i64
      %6051 = func.call @cc_intern(%6047, %6050) : (i64, i64) -> i64
      %6052 = func.call @cc_nil_value() : () -> i64
      %6053 = func.call @cc_cons(%6051, %6052) : (i64, i64) -> i64
      %6054 = func.call @cc_values_pack(%6053) : (i64) -> i64
      func.call @stack_push_pointer(%6051) : (i64) -> ()
      %6055 = func.call @stack_pop_pointer() : () -> i64
      %6056 = func.call @stack_pop_pointer() : () -> i64
      %6057 = func.call @cc_eq(%6056, %6055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6057) : (i64) -> ()
      %6058 = func.call @stack_pop_pointer() : () -> i64
      %6059 = func.call @cc_nil_value() : () -> i64
      %6060 = arith.cmpi ne, %6058, %6059 : i64
      scf.if %6060 {
        func.call @stack_push_pointer(%6027) : (i64) -> ()
        %6061 = func.call @stack_pop_pointer() : () -> i64
        %6062 = func.call @cc_nil_value() : () -> i64
        %6063 = func.call @cc_errorp(%6061) : (i64) -> i64
        %6064 = arith.cmpi ne, %6063, %6062 : i64
        %6065 = arith.cmpi eq, %6062, %6062 : i64
        %6066 = arith.andi %6064, %6065 : i1
        %6067 = scf.if %6066 -> (i64) {
          scf.yield %6061 : i64
        } else {
          scf.yield %6062 : i64
        }
        %6068 = arith.cmpi ne, %6067, %6062 : i64
        scf.if %6068 {
          func.call @stack_push_pointer(%6067) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6061) : (i64) -> ()
          %6069 = llvm.mlir.addressof @str521 : !llvm.ptr
          %6070 = func.call @cc_make_function_ref_const(%6069) : (!llvm.ptr) -> i64
          %6071 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6070, %6071) : (i64, i64) -> ()
        }
        %6072 = func.call @stack_pop_pointer() : () -> i64
        %6073 = func.call @cc_symbol_value(%6028) : (i64) -> i64
        %6074 = func.call @cc_cons(%6072, %6073) : (i64, i64) -> i64
        %6075 = func.call @cc_set_symbol_value(%6028, %6074) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6074) : (i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %6076 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6076 : i64
    }
    func.call @stack_push_pointer(%6033) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bc2"() {
    %5975 = llvm.mlir.addressof @str512 : !llvm.ptr
    %5976 = arith.constant 3 : i64
    %5977 = func.call @cc_make_string(%5975, %5976) : (!llvm.ptr, i64) -> i64
    %5978 = func.call @cc_nil_value() : () -> i64
    %5979 = func.call @cc_intern(%5977, %5978) : (i64, i64) -> i64
    %5980 = func.call @cc_nil_value() : () -> i64
    %5981 = func.call @cc_cons(%5979, %5980) : (i64, i64) -> i64
    %5982 = func.call @cc_values_pack(%5981) : (i64) -> i64
    %5983 = llvm.mlir.addressof @str513 : !llvm.ptr
    %5984 = arith.constant 8 : i64
    %5985 = func.call @cc_make_string(%5983, %5984) : (!llvm.ptr, i64) -> i64
    %5986 = func.call @cc_register_function_frame_language_raw(%5979, %5985) : (i64, i64) -> i64
    %5987 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%5979, %5987) : (i64, i64) -> ()
    %5988 = func.call @cc_nil_value() : () -> i64
    %5989 = llvm.mlir.addressof @str514 : !llvm.ptr
    %5990 = arith.constant 37 : i64
    %5991 = func.call @cc_make_string(%5989, %5990) : (!llvm.ptr, i64) -> i64
    %5992 = func.call @cc_nil_value() : () -> i64
    %5993 = func.call @cc_intern(%5991, %5992) : (i64, i64) -> i64
    %5994 = func.call @cc_nil_value() : () -> i64
    %5995 = func.call @cc_cons(%5993, %5994) : (i64, i64) -> i64
    %5996 = func.call @cc_values_pack(%5995) : (i64) -> i64
    %5997 = func.call @cc_set_symbol_value(%5993, %5988) : (i64, i64) -> i64
    %5998 = llvm.mlir.addressof @str515 : !llvm.ptr
    %5999 = arith.constant 38 : i64
    %6000 = func.call @cc_make_string(%5998, %5999) : (!llvm.ptr, i64) -> i64
    %6001 = func.call @cc_nil_value() : () -> i64
    %6002 = func.call @cc_intern(%6000, %6001) : (i64, i64) -> i64
    %6003 = func.call @cc_nil_value() : () -> i64
    %6004 = func.call @cc_cons(%6002, %6003) : (i64, i64) -> i64
    %6005 = func.call @cc_values_pack(%6004) : (i64) -> i64
    %6006 = func.call @cc_set_symbol_value(%6002, %5988) : (i64, i64) -> i64
    %6007 = llvm.mlir.addressof @str516 : !llvm.ptr
    %6008 = arith.constant 39 : i64
    %6009 = func.call @cc_make_string(%6007, %6008) : (!llvm.ptr, i64) -> i64
    %6010 = func.call @cc_nil_value() : () -> i64
    %6011 = func.call @cc_intern(%6009, %6010) : (i64, i64) -> i64
    %6012 = func.call @cc_nil_value() : () -> i64
    %6013 = func.call @cc_cons(%6011, %6012) : (i64, i64) -> i64
    %6014 = func.call @cc_values_pack(%6013) : (i64) -> i64
    %6015 = func.call @cc_set_symbol_value(%6011, %5988) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %6016 = func.call @stack_pop_pointer() : () -> i64
    %6017 = llvm.mlir.addressof @str517 : !llvm.ptr
    %6018 = arith.constant 34 : i64
    %6019 = func.call @cc_make_symbol(%6017, %6018) : (!llvm.ptr, i64) -> i64
    %6020 = func.call @cc_persistent_root_value(%6019) : (i64) -> i64
    %6021 = func.call @cc_set_symbol_value(%6020, %6016) : (i64, i64) -> i64
    %6022 = func.call @cc_nil_value() : () -> i64
    %6023 = func.call @cc_nil_value() : () -> i64
    %6024 = func.call @cc_errorp(%6022) : (i64) -> i64
    %6025 = arith.cmpi ne, %6024, %6023 : i64
    %6026 = scf.if %6025 -> (i64) {
      scf.yield %6022 : i64
    } else {
      func.call @stack_push_pointer(%6020) : (i64) -> ()
      %6077 = arith.constant 97047688511539 : i64
      %6078 = arith.constant 1 : i64
      %6079 = func.call @cc_make_closure(%6077, %6078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6079) : (i64) -> ()
      %6080 = func.call @stack_pop_pointer() : () -> i64
      %6081 = func.call @cc_nil_value() : () -> i64
      %6082 = func.call @cc_errorp(%6080) : (i64) -> i64
      %6083 = arith.cmpi ne, %6082, %6081 : i64
      %6084 = arith.cmpi eq, %6081, %6081 : i64
      %6085 = arith.andi %6083, %6084 : i1
      %6086 = scf.if %6085 -> (i64) {
        scf.yield %6080 : i64
      } else {
        scf.yield %6081 : i64
      }
      %6087 = arith.cmpi ne, %6086, %6081 : i64
      scf.if %6087 {
        func.call @stack_push_pointer(%6086) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6080) : (i64) -> ()
        %6088 = llvm.mlir.addressof @str522 : !llvm.ptr
        %6089 = func.call @cc_make_function_ref_const(%6088) : (!llvm.ptr) -> i64
        %6090 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6089, %6090) : (i64, i64) -> ()
      }
      %6091 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6091 : i64
    }
    %6092 = func.call @cc_nil_value() : () -> i64
    %6093 = func.call @cc_errorp(%6026) : (i64) -> i64
    %6094 = arith.cmpi ne, %6093, %6092 : i64
    %6095 = scf.if %6094 -> (i64) {
      scf.yield %6026 : i64
    } else {
      %6096 = func.call @cc_symbol_value(%6020) : (i64) -> i64
      func.call @stack_push_pointer(%6096) : (i64) -> ()
      %6097 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6097 : i64
    }
    func.call @stack_push_pointer(%6095) : (i64) -> ()
    %6098 = func.call @stack_pop_pointer() : () -> i64
    %6099 = func.call @cc_multiple_value_list(%6098) : (i64) -> i64
    %6100 = llvm.mlir.addressof @str523 : !llvm.ptr
    %6101 = arith.constant 37 : i64
    %6102 = func.call @cc_make_string(%6100, %6101) : (!llvm.ptr, i64) -> i64
    %6103 = func.call @cc_nil_value() : () -> i64
    %6104 = func.call @cc_intern(%6102, %6103) : (i64, i64) -> i64
    %6105 = func.call @cc_nil_value() : () -> i64
    %6106 = func.call @cc_cons(%6104, %6105) : (i64, i64) -> i64
    %6107 = func.call @cc_values_pack(%6106) : (i64) -> i64
    %6108 = func.call @cc_symbol_value(%6104) : (i64) -> i64
    %6109 = llvm.mlir.addressof @str524 : !llvm.ptr
    %6110 = arith.constant 39 : i64
    %6111 = func.call @cc_make_string(%6109, %6110) : (!llvm.ptr, i64) -> i64
    %6112 = func.call @cc_nil_value() : () -> i64
    %6113 = func.call @cc_intern(%6111, %6112) : (i64, i64) -> i64
    %6114 = func.call @cc_nil_value() : () -> i64
    %6115 = func.call @cc_cons(%6113, %6114) : (i64, i64) -> i64
    %6116 = func.call @cc_values_pack(%6115) : (i64) -> i64
    %6117 = func.call @cc_symbol_value(%6113) : (i64) -> i64
    %6118 = func.call @cc_nil_value() : () -> i64
    %6119 = arith.cmpi ne, %6108, %6118 : i64
    %6120 = scf.if %6119 -> (i64) {
      scf.yield %6117 : i64
    } else {
      scf.yield %6099 : i64
    }
    %6121 = func.call @cc_values_pack(%6120) : (i64) -> i64
    func.call @stack_push_pointer(%6121) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%bc1"() {
    %6146 = llvm.mlir.addressof @str528 : !llvm.ptr
    %6147 = arith.constant 3 : i64
    %6148 = func.call @cc_make_string(%6146, %6147) : (!llvm.ptr, i64) -> i64
    %6149 = func.call @cc_nil_value() : () -> i64
    %6150 = func.call @cc_intern(%6148, %6149) : (i64, i64) -> i64
    %6151 = func.call @cc_nil_value() : () -> i64
    %6152 = func.call @cc_cons(%6150, %6151) : (i64, i64) -> i64
    %6153 = func.call @cc_values_pack(%6152) : (i64) -> i64
    %6154 = llvm.mlir.addressof @str529 : !llvm.ptr
    %6155 = arith.constant 8 : i64
    %6156 = func.call @cc_make_string(%6154, %6155) : (!llvm.ptr, i64) -> i64
    %6157 = func.call @cc_register_function_frame_language_raw(%6150, %6156) : (i64, i64) -> i64
    %6158 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%6150, %6158) : (i64, i64) -> ()
    %6159 = func.call @cc_nil_value() : () -> i64
    %6160 = llvm.mlir.addressof @str530 : !llvm.ptr
    %6161 = arith.constant 37 : i64
    %6162 = func.call @cc_make_string(%6160, %6161) : (!llvm.ptr, i64) -> i64
    %6163 = func.call @cc_nil_value() : () -> i64
    %6164 = func.call @cc_intern(%6162, %6163) : (i64, i64) -> i64
    %6165 = func.call @cc_nil_value() : () -> i64
    %6166 = func.call @cc_cons(%6164, %6165) : (i64, i64) -> i64
    %6167 = func.call @cc_values_pack(%6166) : (i64) -> i64
    %6168 = func.call @cc_set_symbol_value(%6164, %6159) : (i64, i64) -> i64
    %6169 = llvm.mlir.addressof @str531 : !llvm.ptr
    %6170 = arith.constant 38 : i64
    %6171 = func.call @cc_make_string(%6169, %6170) : (!llvm.ptr, i64) -> i64
    %6172 = func.call @cc_nil_value() : () -> i64
    %6173 = func.call @cc_intern(%6171, %6172) : (i64, i64) -> i64
    %6174 = func.call @cc_nil_value() : () -> i64
    %6175 = func.call @cc_cons(%6173, %6174) : (i64, i64) -> i64
    %6176 = func.call @cc_values_pack(%6175) : (i64) -> i64
    %6177 = func.call @cc_set_symbol_value(%6173, %6159) : (i64, i64) -> i64
    %6178 = llvm.mlir.addressof @str532 : !llvm.ptr
    %6179 = arith.constant 39 : i64
    %6180 = func.call @cc_make_string(%6178, %6179) : (!llvm.ptr, i64) -> i64
    %6181 = func.call @cc_nil_value() : () -> i64
    %6182 = func.call @cc_intern(%6180, %6181) : (i64, i64) -> i64
    %6183 = func.call @cc_nil_value() : () -> i64
    %6184 = func.call @cc_cons(%6182, %6183) : (i64, i64) -> i64
    %6185 = func.call @cc_values_pack(%6184) : (i64) -> i64
    %6186 = func.call @cc_set_symbol_value(%6182, %6159) : (i64, i64) -> i64
    %6187 = func.call @cc_nil_value() : () -> i64
    %6188 = arith.cmpi ne, %6187, %6187 : i64
    scf.if %6188 {
      func.call @stack_push_pointer(%6187) : (i64) -> ()
    } else {
      %6189 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6190 = func.call @cc_make_function_ref_const(%6189) : (!llvm.ptr) -> i64
      %6191 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%6190, %6191) : (i64, i64) -> ()
    }
    %6192 = func.call @stack_pop_pointer() : () -> i64
    %6193 = func.call @cc_multiple_value_list(%6192) : (i64) -> i64
    %6194 = llvm.mlir.addressof @str534 : !llvm.ptr
    %6195 = arith.constant 37 : i64
    %6196 = func.call @cc_make_string(%6194, %6195) : (!llvm.ptr, i64) -> i64
    %6197 = func.call @cc_nil_value() : () -> i64
    %6198 = func.call @cc_intern(%6196, %6197) : (i64, i64) -> i64
    %6199 = func.call @cc_nil_value() : () -> i64
    %6200 = func.call @cc_cons(%6198, %6199) : (i64, i64) -> i64
    %6201 = func.call @cc_values_pack(%6200) : (i64) -> i64
    %6202 = func.call @cc_symbol_value(%6198) : (i64) -> i64
    %6203 = llvm.mlir.addressof @str535 : !llvm.ptr
    %6204 = arith.constant 39 : i64
    %6205 = func.call @cc_make_string(%6203, %6204) : (!llvm.ptr, i64) -> i64
    %6206 = func.call @cc_nil_value() : () -> i64
    %6207 = func.call @cc_intern(%6205, %6206) : (i64, i64) -> i64
    %6208 = func.call @cc_nil_value() : () -> i64
    %6209 = func.call @cc_cons(%6207, %6208) : (i64, i64) -> i64
    %6210 = func.call @cc_values_pack(%6209) : (i64) -> i64
    %6211 = func.call @cc_symbol_value(%6207) : (i64) -> i64
    %6212 = func.call @cc_nil_value() : () -> i64
    %6213 = arith.cmpi ne, %6202, %6212 : i64
    %6214 = scf.if %6213 -> (i64) {
      scf.yield %6211 : i64
    } else {
      scf.yield %6193 : i64
    }
    %6215 = func.call @cc_values_pack(%6214) : (i64) -> i64
    func.call @stack_push_pointer(%6215) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511536"() {
    %5967 = func.call @stack_pop_pointer() : () -> i64
    %5968 = func.call @stack_pop_pointer() : () -> i64
    %5969 = func.call @stack_pop_pointer() : () -> i64
    %5970 = func.call @cc_nil_value() : () -> i64
    %5971 = func.call @cc_nil_value() : () -> i64
    %5972 = func.call @cc_errorp(%5970) : (i64) -> i64
    %5973 = arith.cmpi ne, %5972, %5971 : i64
    %5974 = scf.if %5973 -> (i64) {
      scf.yield %5970 : i64
    } else {
      %6122 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6123 = func.call @cc_make_function_ref_const(%6122) : (!llvm.ptr) -> i64
      %6124 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6125 = arith.constant 3 : i64
      %6126 = func.call @cc_make_string(%6124, %6125) : (!llvm.ptr, i64) -> i64
      %6127 = func.call @cc_nil_value() : () -> i64
      %6128 = func.call @cc_intern(%6126, %6127) : (i64, i64) -> i64
      %6129 = func.call @cc_nil_value() : () -> i64
      %6130 = func.call @cc_cons(%6128, %6129) : (i64, i64) -> i64
      %6131 = func.call @cc_values_pack(%6130) : (i64) -> i64
      %6132 = func.call @cc_set_symbol_value(%6128, %6123) : (i64, i64) -> i64
      %6133 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6134 = arith.constant 3 : i64
      %6135 = func.call @cc_make_string(%6133, %6134) : (!llvm.ptr, i64) -> i64
      %6136 = func.call @cc_nil_value() : () -> i64
      %6137 = func.call @cc_intern(%6135, %6136) : (i64, i64) -> i64
      %6138 = func.call @cc_nil_value() : () -> i64
      %6139 = func.call @cc_cons(%6137, %6138) : (i64, i64) -> i64
      %6140 = func.call @cc_values_pack(%6139) : (i64) -> i64
      func.call @stack_push_pointer(%6137) : (i64) -> ()
      %6141 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6141 : i64
    }
    %6142 = func.call @cc_nil_value() : () -> i64
    %6143 = func.call @cc_errorp(%5974) : (i64) -> i64
    %6144 = arith.cmpi ne, %6143, %6142 : i64
    %6145 = scf.if %6144 -> (i64) {
      scf.yield %5974 : i64
    } else {
      %6216 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6217 = func.call @cc_make_function_ref_const(%6216) : (!llvm.ptr) -> i64
      %6218 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6219 = arith.constant 3 : i64
      %6220 = func.call @cc_make_string(%6218, %6219) : (!llvm.ptr, i64) -> i64
      %6221 = func.call @cc_nil_value() : () -> i64
      %6222 = func.call @cc_intern(%6220, %6221) : (i64, i64) -> i64
      %6223 = func.call @cc_nil_value() : () -> i64
      %6224 = func.call @cc_cons(%6222, %6223) : (i64, i64) -> i64
      %6225 = func.call @cc_values_pack(%6224) : (i64) -> i64
      %6226 = func.call @cc_set_symbol_value(%6222, %6217) : (i64, i64) -> i64
      %6227 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6228 = arith.constant 3 : i64
      %6229 = func.call @cc_make_string(%6227, %6228) : (!llvm.ptr, i64) -> i64
      %6230 = func.call @cc_nil_value() : () -> i64
      %6231 = func.call @cc_intern(%6229, %6230) : (i64, i64) -> i64
      %6232 = func.call @cc_nil_value() : () -> i64
      %6233 = func.call @cc_cons(%6231, %6232) : (i64, i64) -> i64
      %6234 = func.call @cc_values_pack(%6233) : (i64) -> i64
      func.call @stack_push_pointer(%6231) : (i64) -> ()
      %6235 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6235 : i64
    }
    func.call @stack_push_pointer(%6145) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511535"() {
    %5957 = func.call @cc_nil_value() : () -> i64
    %5958 = func.call @cc_nil_value() : () -> i64
    %5959 = func.call @cc_errorp(%5957) : (i64) -> i64
    %5960 = arith.cmpi ne, %5959, %5958 : i64
    %5961 = scf.if %5960 -> (i64) {
      scf.yield %5957 : i64
    } else {
      %5962 = func.call @cc_nil_value() : () -> i64
      %5963 = func.call @cc_nil_value() : () -> i64
      %5964 = func.call @cc_errorp(%5962) : (i64) -> i64
      %5965 = arith.cmpi ne, %5964, %5963 : i64
      %5966 = scf.if %5965 -> (i64) {
        scf.yield %5962 : i64
      } else {
        %6236 = llvm.mlir.addressof @str539 : !llvm.ptr
        %6237 = arith.constant 31 : i64
        %6238 = func.call @cc_make_symbol(%6236, %6237) : (!llvm.ptr, i64) -> i64
        %6239 = func.call @cc_persistent_root_value(%6238) : (i64) -> i64
        func.call @stack_push_pointer(%6239) : (i64) -> ()
        %6240 = llvm.mlir.addressof @str540 : !llvm.ptr
        %6241 = arith.constant 31 : i64
        %6242 = func.call @cc_make_symbol(%6240, %6241) : (!llvm.ptr, i64) -> i64
        %6243 = func.call @cc_persistent_root_value(%6242) : (i64) -> i64
        func.call @stack_push_pointer(%6243) : (i64) -> ()
        %6244 = llvm.mlir.addressof @str541 : !llvm.ptr
        %6245 = arith.constant 34 : i64
        %6246 = func.call @cc_make_symbol(%6244, %6245) : (!llvm.ptr, i64) -> i64
        %6247 = func.call @cc_persistent_root_value(%6246) : (i64) -> i64
        func.call @stack_push_pointer(%6247) : (i64) -> ()
        %6248 = arith.constant 97047688511536 : i64
        %6249 = arith.constant 3 : i64
        %6250 = func.call @cc_make_closure(%6248, %6249) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6250) : (i64) -> ()
        %6251 = func.call @stack_pop_pointer() : () -> i64
        %6252 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6251, %6252) : (i64, i64) -> ()
        %6253 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6253 : i64
      }
      %6254 = func.call @cc_nil_value() : () -> i64
      %6255 = func.call @cc_errorp(%5966) : (i64) -> i64
      %6256 = arith.cmpi ne, %6255, %6254 : i64
      %6257 = scf.if %6256 -> (i64) {
        scf.yield %5966 : i64
      } else {
        %6258 = llvm.mlir.addressof @str542 : !llvm.ptr
        %6259 = arith.constant 3 : i64
        %6260 = func.call @cc_make_string(%6258, %6259) : (!llvm.ptr, i64) -> i64
        %6261 = func.call @cc_nil_value() : () -> i64
        %6262 = func.call @cc_intern(%6260, %6261) : (i64, i64) -> i64
        %6263 = func.call @cc_nil_value() : () -> i64
        %6264 = func.call @cc_cons(%6262, %6263) : (i64, i64) -> i64
        %6265 = func.call @cc_values_pack(%6264) : (i64) -> i64
        func.call @stack_push_pointer(%6262) : (i64) -> ()
        %6266 = llvm.mlir.addressof @str543 : !llvm.ptr
        %6267 = arith.constant 3 : i64
        %6268 = func.call @cc_make_string(%6266, %6267) : (!llvm.ptr, i64) -> i64
        %6269 = func.call @cc_nil_value() : () -> i64
        %6270 = func.call @cc_intern(%6268, %6269) : (i64, i64) -> i64
        %6271 = func.call @cc_nil_value() : () -> i64
        %6272 = func.call @cc_cons(%6270, %6271) : (i64, i64) -> i64
        %6273 = func.call @cc_values_pack(%6272) : (i64) -> i64
        func.call @stack_push_pointer(%6270) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %6274 = func.call @stack_pop_pointer() : () -> i64
        %6275 = func.call @stack_pop_pointer() : () -> i64
        %6276 = func.call @cc_cons(%6275, %6274) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6276) : (i64) -> ()
        %6277 = func.call @stack_pop_pointer() : () -> i64
        %6278 = func.call @stack_pop_pointer() : () -> i64
        %6279 = func.call @cc_cons(%6278, %6277) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6279) : (i64) -> ()
        %6280 = func.call @stack_pop_pointer() : () -> i64
        %6281 = llvm.mlir.addressof @str544 : !llvm.ptr
        %6282 = arith.constant 3 : i64
        %6283 = func.call @cc_make_string(%6281, %6282) : (!llvm.ptr, i64) -> i64
        %6284 = func.call @cc_nil_value() : () -> i64
        %6285 = func.call @cc_intern(%6283, %6284) : (i64, i64) -> i64
        %6286 = func.call @cc_nil_value() : () -> i64
        %6287 = func.call @cc_cons(%6285, %6286) : (i64, i64) -> i64
        %6288 = func.call @cc_values_pack(%6287) : (i64) -> i64
        func.call @stack_push_pointer(%6285) : (i64) -> ()
        %6289 = func.call @stack_pop_pointer() : () -> i64
        %6290 = func.call @cc_fdefinition(%6289) : (i64) -> i64
        func.call @stack_push_pointer(%6290) : (i64) -> ()
        %6291 = func.call @stack_pop_pointer() : () -> i64
        %6292 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6291, %6292) : (i64, i64) -> ()
        %6293 = func.call @stack_pop_pointer() : () -> i64
        %6294 = func.call @cc_nil_value() : () -> i64
        %6295 = func.call @cc_errorp(%6280) : (i64) -> i64
        %6296 = arith.cmpi ne, %6295, %6294 : i64
        %6297 = arith.cmpi eq, %6294, %6294 : i64
        %6298 = arith.andi %6296, %6297 : i1
        %6299 = scf.if %6298 -> (i64) {
          scf.yield %6280 : i64
        } else {
          scf.yield %6294 : i64
        }
        %6300 = func.call @cc_errorp(%6293) : (i64) -> i64
        %6301 = arith.cmpi ne, %6300, %6294 : i64
        %6302 = arith.cmpi eq, %6299, %6294 : i64
        %6303 = arith.andi %6301, %6302 : i1
        %6304 = scf.if %6303 -> (i64) {
          scf.yield %6293 : i64
        } else {
          scf.yield %6299 : i64
        }
        %6305 = arith.cmpi ne, %6304, %6294 : i64
        scf.if %6305 {
          func.call @stack_push_pointer(%6304) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6280) : (i64) -> ()
          func.call @stack_push_pointer(%6293) : (i64) -> ()
          %6306 = llvm.mlir.addressof @str545 : !llvm.ptr
          %6307 = func.call @cc_make_function_ref_const(%6306) : (!llvm.ptr) -> i64
          %6308 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%6307, %6308) : (i64, i64) -> ()
        }
        %6309 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6309 : i64
      }
      func.call @stack_push_pointer(%6257) : (i64) -> ()
      %6310 = func.call @stack_pop_pointer() : () -> i64
      %6311 = func.call @cc_nil_value() : () -> i64
      %6312 = func.call @cc_cons(%6310, %6311) : (i64, i64) -> i64
      %6313 = func.call @cc_not(%6312) : (i64) -> i64
      func.call @stack_push_pointer(%6313) : (i64) -> ()
      %6314 = func.call @stack_pop_pointer() : () -> i64
      %6315 = func.call @cc_nil_value() : () -> i64
      %6316 = func.call @cc_cons(%6314, %6315) : (i64, i64) -> i64
      %6317 = func.call @cc_not(%6316) : (i64) -> i64
      func.call @stack_push_pointer(%6317) : (i64) -> ()
      %6318 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6318 : i64
    }
    func.call @stack_push_pointer(%5961) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511547"() {
    %6806 = func.call @stack_pop_pointer() : () -> i64
    %6807 = func.call @stack_pop_pointer() : () -> i64
    %6808 = func.call @cc_nil_value() : () -> i64
    %6809 = func.call @cc_nil_value() : () -> i64
    %6810 = func.call @cc_errorp(%6808) : (i64) -> i64
    %6811 = arith.cmpi ne, %6810, %6809 : i64
    %6812 = scf.if %6811 -> (i64) {
      scf.yield %6808 : i64
    } else {
      func.call @stack_push_pointer(%6806) : (i64) -> ()
      %6813 = func.call @stack_pop_pointer() : () -> i64
      %6814 = func.call @cc_nil_value() : () -> i64
      %6815 = func.call @cc_errorp(%6813) : (i64) -> i64
      %6816 = arith.cmpi ne, %6815, %6814 : i64
      %6817 = arith.cmpi eq, %6814, %6814 : i64
      %6818 = arith.andi %6816, %6817 : i1
      %6819 = scf.if %6818 -> (i64) {
        scf.yield %6813 : i64
      } else {
        scf.yield %6814 : i64
      }
      %6820 = arith.cmpi ne, %6819, %6814 : i64
      scf.if %6820 {
        func.call @stack_push_pointer(%6819) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6813) : (i64) -> ()
        %6821 = llvm.mlir.addressof @str593 : !llvm.ptr
        %6822 = func.call @cc_make_function_ref_const(%6821) : (!llvm.ptr) -> i64
        %6823 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6822, %6823) : (i64, i64) -> ()
      }
      %6824 = llvm.mlir.addressof @str594 : !llvm.ptr
      %6825 = arith.constant 3 : i64
      %6826 = func.call @cc_make_string(%6824, %6825) : (!llvm.ptr, i64) -> i64
      %6827 = func.call @cc_nil_value() : () -> i64
      %6828 = func.call @cc_intern(%6826, %6827) : (i64, i64) -> i64
      %6829 = func.call @cc_nil_value() : () -> i64
      %6830 = func.call @cc_cons(%6828, %6829) : (i64, i64) -> i64
      %6831 = func.call @cc_values_pack(%6830) : (i64) -> i64
      func.call @stack_push_pointer(%6828) : (i64) -> ()
      %6832 = func.call @stack_pop_pointer() : () -> i64
      %6833 = func.call @stack_pop_pointer() : () -> i64
      %6834 = func.call @cc_eq(%6833, %6832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6834) : (i64) -> ()
      %6835 = func.call @stack_pop_pointer() : () -> i64
      %6836 = func.call @cc_nil_value() : () -> i64
      %6837 = arith.cmpi ne, %6835, %6836 : i64
      scf.if %6837 {
        func.call @stack_push_pointer(%6806) : (i64) -> ()
        %6838 = func.call @stack_pop_pointer() : () -> i64
        %6839 = func.call @cc_nil_value() : () -> i64
        %6840 = func.call @cc_errorp(%6838) : (i64) -> i64
        %6841 = arith.cmpi ne, %6840, %6839 : i64
        %6842 = arith.cmpi eq, %6839, %6839 : i64
        %6843 = arith.andi %6841, %6842 : i1
        %6844 = scf.if %6843 -> (i64) {
          scf.yield %6838 : i64
        } else {
          scf.yield %6839 : i64
        }
        %6845 = arith.cmpi ne, %6844, %6839 : i64
        scf.if %6845 {
          func.call @stack_push_pointer(%6844) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6838) : (i64) -> ()
          %6846 = llvm.mlir.addressof @str595 : !llvm.ptr
          %6847 = func.call @cc_make_function_ref_const(%6846) : (!llvm.ptr) -> i64
          %6848 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6847, %6848) : (i64, i64) -> ()
        }
        %6849 = func.call @stack_pop_pointer() : () -> i64
        %6850 = func.call @cc_multiple_value_list(%6849) : (i64) -> i64
        %6851 = func.call @cc_t_value() : () -> i64
        %6852 = llvm.mlir.addressof @str596 : !llvm.ptr
        %6853 = arith.constant 37 : i64
        %6854 = func.call @cc_make_string(%6852, %6853) : (!llvm.ptr, i64) -> i64
        %6855 = func.call @cc_nil_value() : () -> i64
        %6856 = func.call @cc_intern(%6854, %6855) : (i64, i64) -> i64
        %6857 = func.call @cc_nil_value() : () -> i64
        %6858 = func.call @cc_cons(%6856, %6857) : (i64, i64) -> i64
        %6859 = func.call @cc_values_pack(%6858) : (i64) -> i64
        %6860 = func.call @cc_set_symbol_value(%6856, %6851) : (i64, i64) -> i64
        %6861 = llvm.mlir.addressof @str597 : !llvm.ptr
        %6862 = arith.constant 38 : i64
        %6863 = func.call @cc_make_string(%6861, %6862) : (!llvm.ptr, i64) -> i64
        %6864 = func.call @cc_nil_value() : () -> i64
        %6865 = func.call @cc_intern(%6863, %6864) : (i64, i64) -> i64
        %6866 = func.call @cc_nil_value() : () -> i64
        %6867 = func.call @cc_cons(%6865, %6866) : (i64, i64) -> i64
        %6868 = func.call @cc_values_pack(%6867) : (i64) -> i64
        %6869 = func.call @cc_set_symbol_value(%6865, %6849) : (i64, i64) -> i64
        %6870 = llvm.mlir.addressof @str598 : !llvm.ptr
        %6871 = arith.constant 39 : i64
        %6872 = func.call @cc_make_string(%6870, %6871) : (!llvm.ptr, i64) -> i64
        %6873 = func.call @cc_nil_value() : () -> i64
        %6874 = func.call @cc_intern(%6872, %6873) : (i64, i64) -> i64
        %6875 = func.call @cc_nil_value() : () -> i64
        %6876 = func.call @cc_cons(%6874, %6875) : (i64, i64) -> i64
        %6877 = func.call @cc_values_pack(%6876) : (i64) -> i64
        %6878 = func.call @cc_set_symbol_value(%6874, %6850) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6849) : (i64) -> ()
      }
      func.call @stack_push_nil() : () -> ()
      %6879 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6879 : i64
    }
    func.call @stack_push_pointer(%6812) : (i64) -> ()
    func.return
  }
  func.func @"%FN%bcl"() {
    %6760 = llvm.mlir.addressof @str587 : !llvm.ptr
    %6761 = arith.constant 3 : i64
    %6762 = func.call @cc_make_string(%6760, %6761) : (!llvm.ptr, i64) -> i64
    %6763 = func.call @cc_nil_value() : () -> i64
    %6764 = func.call @cc_intern(%6762, %6763) : (i64, i64) -> i64
    %6765 = func.call @cc_nil_value() : () -> i64
    %6766 = func.call @cc_cons(%6764, %6765) : (i64, i64) -> i64
    %6767 = func.call @cc_values_pack(%6766) : (i64) -> i64
    %6768 = llvm.mlir.addressof @str588 : !llvm.ptr
    %6769 = arith.constant 1 : i64
    %6770 = func.call @cc_make_string(%6768, %6769) : (!llvm.ptr, i64) -> i64
    %6771 = func.call @cc_register_function_lambda_list_metadata_raw(%6764, %6770) : (i64, i64) -> i64
    %6772 = llvm.mlir.addressof @str589 : !llvm.ptr
    %6773 = arith.constant 8 : i64
    %6774 = func.call @cc_make_string(%6772, %6773) : (!llvm.ptr, i64) -> i64
    %6775 = func.call @cc_register_function_frame_language_raw(%6764, %6774) : (i64, i64) -> i64
    %6776 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%6764, %6776) : (i64, i64) -> ()
    %6777 = func.call @stack_pop_pointer() : () -> i64
    %6778 = func.call @cc_nil_value() : () -> i64
    %6779 = llvm.mlir.addressof @str590 : !llvm.ptr
    %6780 = arith.constant 37 : i64
    %6781 = func.call @cc_make_string(%6779, %6780) : (!llvm.ptr, i64) -> i64
    %6782 = func.call @cc_nil_value() : () -> i64
    %6783 = func.call @cc_intern(%6781, %6782) : (i64, i64) -> i64
    %6784 = func.call @cc_nil_value() : () -> i64
    %6785 = func.call @cc_cons(%6783, %6784) : (i64, i64) -> i64
    %6786 = func.call @cc_values_pack(%6785) : (i64) -> i64
    %6787 = func.call @cc_set_symbol_value(%6783, %6778) : (i64, i64) -> i64
    %6788 = llvm.mlir.addressof @str591 : !llvm.ptr
    %6789 = arith.constant 38 : i64
    %6790 = func.call @cc_make_string(%6788, %6789) : (!llvm.ptr, i64) -> i64
    %6791 = func.call @cc_nil_value() : () -> i64
    %6792 = func.call @cc_intern(%6790, %6791) : (i64, i64) -> i64
    %6793 = func.call @cc_nil_value() : () -> i64
    %6794 = func.call @cc_cons(%6792, %6793) : (i64, i64) -> i64
    %6795 = func.call @cc_values_pack(%6794) : (i64) -> i64
    %6796 = func.call @cc_set_symbol_value(%6792, %6778) : (i64, i64) -> i64
    %6797 = llvm.mlir.addressof @str592 : !llvm.ptr
    %6798 = arith.constant 39 : i64
    %6799 = func.call @cc_make_string(%6797, %6798) : (!llvm.ptr, i64) -> i64
    %6800 = func.call @cc_nil_value() : () -> i64
    %6801 = func.call @cc_intern(%6799, %6800) : (i64, i64) -> i64
    %6802 = func.call @cc_nil_value() : () -> i64
    %6803 = func.call @cc_cons(%6801, %6802) : (i64, i64) -> i64
    %6804 = func.call @cc_values_pack(%6803) : (i64) -> i64
    %6805 = func.call @cc_set_symbol_value(%6801, %6778) : (i64, i64) -> i64
    %6880 = llvm.mlir.addressof @str599 : !llvm.ptr
    %6881 = arith.constant 31 : i64
    %6882 = func.call @cc_make_symbol(%6880, %6881) : (!llvm.ptr, i64) -> i64
    %6883 = func.call @cc_persistent_root_value(%6882) : (i64) -> i64
    func.call @stack_push_pointer(%6883) : (i64) -> ()
    %6884 = arith.constant 97047688511547 : i64
    %6885 = arith.constant 1 : i64
    %6886 = func.call @cc_make_closure(%6884, %6885) : (i64, i64) -> i64
    func.call @stack_push_pointer(%6886) : (i64) -> ()
    %6887 = func.call @stack_pop_pointer() : () -> i64
    %6888 = func.call @cc_nil_value() : () -> i64
    %6889 = func.call @cc_errorp(%6887) : (i64) -> i64
    %6890 = arith.cmpi ne, %6889, %6888 : i64
    %6891 = arith.cmpi eq, %6888, %6888 : i64
    %6892 = arith.andi %6890, %6891 : i1
    %6893 = scf.if %6892 -> (i64) {
      scf.yield %6887 : i64
    } else {
      scf.yield %6888 : i64
    }
    %6894 = arith.cmpi ne, %6893, %6888 : i64
    scf.if %6894 {
      func.call @stack_push_pointer(%6893) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%6887) : (i64) -> ()
      %6895 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6896 = func.call @cc_make_function_ref_const(%6895) : (!llvm.ptr) -> i64
      %6897 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%6896, %6897) : (i64, i64) -> ()
    }
    %6898 = func.call @stack_pop_pointer() : () -> i64
    %6899 = func.call @cc_multiple_value_list(%6898) : (i64) -> i64
    %6900 = llvm.mlir.addressof @str601 : !llvm.ptr
    %6901 = arith.constant 37 : i64
    %6902 = func.call @cc_make_string(%6900, %6901) : (!llvm.ptr, i64) -> i64
    %6903 = func.call @cc_nil_value() : () -> i64
    %6904 = func.call @cc_intern(%6902, %6903) : (i64, i64) -> i64
    %6905 = func.call @cc_nil_value() : () -> i64
    %6906 = func.call @cc_cons(%6904, %6905) : (i64, i64) -> i64
    %6907 = func.call @cc_values_pack(%6906) : (i64) -> i64
    %6908 = func.call @cc_symbol_value(%6904) : (i64) -> i64
    %6909 = llvm.mlir.addressof @str602 : !llvm.ptr
    %6910 = arith.constant 39 : i64
    %6911 = func.call @cc_make_string(%6909, %6910) : (!llvm.ptr, i64) -> i64
    %6912 = func.call @cc_nil_value() : () -> i64
    %6913 = func.call @cc_intern(%6911, %6912) : (i64, i64) -> i64
    %6914 = func.call @cc_nil_value() : () -> i64
    %6915 = func.call @cc_cons(%6913, %6914) : (i64, i64) -> i64
    %6916 = func.call @cc_values_pack(%6915) : (i64) -> i64
    %6917 = func.call @cc_symbol_value(%6913) : (i64) -> i64
    %6918 = func.call @cc_nil_value() : () -> i64
    %6919 = arith.cmpi ne, %6908, %6918 : i64
    %6920 = scf.if %6919 -> (i64) {
      scf.yield %6917 : i64
    } else {
      scf.yield %6899 : i64
    }
    %6921 = func.call @cc_values_pack(%6920) : (i64) -> i64
    func.call @stack_push_pointer(%6921) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_97047688511545"() {
    %6754 = func.call @stack_pop_pointer() : () -> i64
    %6755 = func.call @cc_nil_value() : () -> i64
    %6756 = func.call @cc_nil_value() : () -> i64
    %6757 = func.call @cc_errorp(%6755) : (i64) -> i64
    %6758 = arith.cmpi ne, %6757, %6756 : i64
    %6759 = scf.if %6758 -> (i64) {
      scf.yield %6755 : i64
    } else {
      %6922 = llvm.mlir.addressof @str603 : !llvm.ptr
      %6923 = arith.constant 1 : i64
      %6924 = func.call @cc_make_string(%6922, %6923) : (!llvm.ptr, i64) -> i64
      %6925 = llvm.mlir.addressof @str604 : !llvm.ptr
      %6926 = arith.constant 3 : i64
      %6927 = func.call @cc_make_string(%6925, %6926) : (!llvm.ptr, i64) -> i64
      %6928 = func.call @cc_nil_value() : () -> i64
      %6929 = func.call @cc_intern(%6927, %6928) : (i64, i64) -> i64
      %6930 = func.call @cc_nil_value() : () -> i64
      %6931 = func.call @cc_cons(%6929, %6930) : (i64, i64) -> i64
      %6932 = func.call @cc_values_pack(%6931) : (i64) -> i64
      %6933 = func.call @cc_register_function_lambda_list_metadata_raw(%6929, %6924) : (i64, i64) -> i64
      %6934 = llvm.mlir.addressof @str605 : !llvm.ptr
      %6935 = func.call @cc_make_function_ref_const(%6934) : (!llvm.ptr) -> i64
      %6936 = llvm.mlir.addressof @str606 : !llvm.ptr
      %6937 = arith.constant 3 : i64
      %6938 = func.call @cc_make_string(%6936, %6937) : (!llvm.ptr, i64) -> i64
      %6939 = func.call @cc_nil_value() : () -> i64
      %6940 = func.call @cc_intern(%6938, %6939) : (i64, i64) -> i64
      %6941 = func.call @cc_nil_value() : () -> i64
      %6942 = func.call @cc_cons(%6940, %6941) : (i64, i64) -> i64
      %6943 = func.call @cc_values_pack(%6942) : (i64) -> i64
      %6944 = func.call @cc_set_symbol_value(%6940, %6935) : (i64, i64) -> i64
      %6945 = llvm.mlir.addressof @str607 : !llvm.ptr
      %6946 = arith.constant 3 : i64
      %6947 = func.call @cc_make_string(%6945, %6946) : (!llvm.ptr, i64) -> i64
      %6948 = func.call @cc_nil_value() : () -> i64
      %6949 = func.call @cc_intern(%6947, %6948) : (i64, i64) -> i64
      %6950 = func.call @cc_nil_value() : () -> i64
      %6951 = func.call @cc_cons(%6949, %6950) : (i64, i64) -> i64
      %6952 = func.call @cc_values_pack(%6951) : (i64) -> i64
      func.call @stack_push_pointer(%6949) : (i64) -> ()
      %6953 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6953 : i64
    }
    func.call @stack_push_pointer(%6759) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511544"() {
    %6744 = func.call @cc_nil_value() : () -> i64
    %6745 = func.call @cc_nil_value() : () -> i64
    %6746 = func.call @cc_errorp(%6744) : (i64) -> i64
    %6747 = arith.cmpi ne, %6746, %6745 : i64
    %6748 = scf.if %6747 -> (i64) {
      scf.yield %6744 : i64
    } else {
      %6749 = func.call @cc_nil_value() : () -> i64
      %6750 = func.call @cc_nil_value() : () -> i64
      %6751 = func.call @cc_errorp(%6749) : (i64) -> i64
      %6752 = arith.cmpi ne, %6751, %6750 : i64
      %6753 = scf.if %6752 -> (i64) {
        scf.yield %6749 : i64
      } else {
        %6954 = llvm.mlir.addressof @str608 : !llvm.ptr
        %6955 = arith.constant 31 : i64
        %6956 = func.call @cc_make_symbol(%6954, %6955) : (!llvm.ptr, i64) -> i64
        %6957 = func.call @cc_persistent_root_value(%6956) : (i64) -> i64
        func.call @stack_push_pointer(%6957) : (i64) -> ()
        %6958 = arith.constant 97047688511545 : i64
        %6959 = arith.constant 1 : i64
        %6960 = func.call @cc_make_closure(%6958, %6959) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6960) : (i64) -> ()
        %6961 = func.call @stack_pop_pointer() : () -> i64
        %6962 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6961, %6962) : (i64, i64) -> ()
        %6963 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6963 : i64
      }
      %6964 = func.call @cc_nil_value() : () -> i64
      %6965 = func.call @cc_errorp(%6753) : (i64) -> i64
      %6966 = arith.cmpi ne, %6965, %6964 : i64
      %6967 = scf.if %6966 -> (i64) {
        scf.yield %6753 : i64
      } else {
        %6968 = arith.constant 137 : i64
        func.call @stack_push_fixnum(%6968) : (i64) -> ()
        %6969 = func.call @stack_pop_pointer() : () -> i64
        %6970 = func.call @cc_nil_value() : () -> i64
        %6971 = func.call @cc_errorp(%6969) : (i64) -> i64
        %6972 = arith.cmpi ne, %6971, %6970 : i64
        %6973 = arith.cmpi eq, %6970, %6970 : i64
        %6974 = arith.andi %6972, %6973 : i1
        %6975 = scf.if %6974 -> (i64) {
          scf.yield %6969 : i64
        } else {
          scf.yield %6970 : i64
        }
        %6976 = arith.cmpi ne, %6975, %6970 : i64
        scf.if %6976 {
          func.call @stack_push_pointer(%6975) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%6969) : (i64) -> ()
          %6977 = llvm.mlir.addressof @str609 : !llvm.ptr
          %6978 = func.call @cc_make_function_ref_const(%6977) : (!llvm.ptr) -> i64
          %6979 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%6978, %6979) : (i64, i64) -> ()
        }
        %6980 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6980 : i64
      }
      func.call @stack_push_pointer(%6967) : (i64) -> ()
      %6981 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6981 : i64
    }
    func.call @stack_push_pointer(%6748) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:PRINT-OBJECT_97047688511550_primary"() {
    %7142 = func.call @stack_pop_pointer() : () -> i64
    %7143 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %7144 = func.call @stack_depth() : () -> i64
    %7145 = arith.constant 0 : i64
    %7146 = arith.cmpi sgt, %7144, %7145 : i64
    scf.if %7146 {
      %7147 = func.call @stack_pop_pointer() : () -> i64
    }
    %7148 = llvm.mlir.addressof @str620 : !llvm.ptr
    %7149 = arith.constant 52 : i64
    %7150 = func.call @cc_make_string(%7148, %7149) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%7150) : (i64) -> ()
    %7151 = func.call @stack_pop_pointer() : () -> i64
    %7152 = func.call @cc_nil_value() : () -> i64
    %7153 = func.call @cc_errorp(%7151) : (i64) -> i64
    %7154 = arith.cmpi ne, %7153, %7152 : i64
    %7155 = arith.cmpi eq, %7152, %7152 : i64
    %7156 = arith.andi %7154, %7155 : i1
    %7157 = scf.if %7156 -> (i64) {
      scf.yield %7151 : i64
    } else {
      scf.yield %7152 : i64
    }
    %7158 = arith.cmpi ne, %7157, %7152 : i64
    scf.if %7158 {
      func.call @stack_push_pointer(%7157) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%7151) : (i64) -> ()
      %7159 = llvm.mlir.addressof @str621 : !llvm.ptr
      %7160 = func.call @cc_make_function_ref_const(%7159) : (!llvm.ptr) -> i64
      %7161 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%7160, %7161) : (i64, i64) -> ()
    }
    func.return
  }
  func.func @"__lambda_97047688511552"() {
    %7547 = func.call @stack_pop_pointer() : () -> i64
    %7548 = func.call @cc_nil_value() : () -> i64
    %7549 = func.call @cc_nil_value() : () -> i64
    %7550 = func.call @cc_errorp(%7548) : (i64) -> i64
    %7551 = arith.cmpi ne, %7550, %7549 : i64
    %7552 = scf.if %7551 -> (i64) {
      scf.yield %7548 : i64
    } else {
      %7553 = llvm.mlir.addressof @str659 : !llvm.ptr
      %7554 = arith.constant 6 : i64
      %7555 = func.call @cc_make_string(%7553, %7554) : (!llvm.ptr, i64) -> i64
      %7556 = llvm.mlir.addressof @str660 : !llvm.ptr
      %7557 = arith.constant 7 : i64
      %7558 = func.call @cc_make_string(%7556, %7557) : (!llvm.ptr, i64) -> i64
      %7559 = func.call @cc_intern(%7555, %7558) : (i64, i64) -> i64
      %7560 = func.call @cc_nil_value() : () -> i64
      %7561 = func.call @cc_cons(%7559, %7560) : (i64, i64) -> i64
      %7562 = func.call @cc_values_pack(%7561) : (i64) -> i64
      func.call @stack_push_pointer(%7559) : (i64) -> ()
      %7563 = func.call @stack_pop_pointer() : () -> i64
      %7564 = func.call @cc_symbol_value(%7547) : (i64) -> i64
      func.call @stack_push_pointer(%7564) : (i64) -> ()
      %7565 = func.call @stack_pop_pointer() : () -> i64
      %7566 = func.call @cc_nil_value() : () -> i64
      %7567 = func.call @cc_errorp(%7563) : (i64) -> i64
      %7568 = arith.cmpi ne, %7567, %7566 : i64
      %7569 = arith.cmpi eq, %7566, %7566 : i64
      %7570 = arith.andi %7568, %7569 : i1
      %7571 = scf.if %7570 -> (i64) {
        scf.yield %7563 : i64
      } else {
        scf.yield %7566 : i64
      }
      %7572 = func.call @cc_errorp(%7565) : (i64) -> i64
      %7573 = arith.cmpi ne, %7572, %7566 : i64
      %7574 = arith.cmpi eq, %7571, %7566 : i64
      %7575 = arith.andi %7573, %7574 : i1
      %7576 = scf.if %7575 -> (i64) {
        scf.yield %7565 : i64
      } else {
        scf.yield %7571 : i64
      }
      %7577 = arith.cmpi ne, %7576, %7566 : i64
      scf.if %7577 {
        func.call @stack_push_pointer(%7576) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7563) : (i64) -> ()
        func.call @stack_push_pointer(%7565) : (i64) -> ()
        %7578 = llvm.mlir.addressof @str661 : !llvm.ptr
        %7579 = func.call @cc_make_function_ref_const(%7578) : (!llvm.ptr) -> i64
        %7580 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%7579, %7580) : (i64, i64) -> ()
      }
      %7581 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7581 : i64
    }
    func.call @stack_push_pointer(%7552) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511551"() {
    %7536 = func.call @cc_nil_value() : () -> i64
    %7537 = func.call @cc_nil_value() : () -> i64
    %7538 = func.call @cc_errorp(%7536) : (i64) -> i64
    %7539 = arith.cmpi ne, %7538, %7537 : i64
    %7540 = scf.if %7539 -> (i64) {
      scf.yield %7536 : i64
    } else {
      %7541 = func.call @cc_nil_value() : () -> i64
      %7542 = func.call @cc_nil_value() : () -> i64
      %7543 = func.call @cc_errorp(%7541) : (i64) -> i64
      %7544 = arith.cmpi ne, %7543, %7542 : i64
      %7545 = scf.if %7544 -> (i64) {
        scf.yield %7541 : i64
      } else {
        %7546 = func.call @cc_make_string_output_stream() : () -> i64
        %7582 = llvm.mlir.addressof @str662 : !llvm.ptr
        %7583 = arith.constant 29 : i64
        %7584 = func.call @cc_make_symbol(%7582, %7583) : (!llvm.ptr, i64) -> i64
        %7585 = func.call @cc_persistent_root_value(%7584) : (i64) -> i64
        %7586 = func.call @cc_set_symbol_value(%7585, %7546) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7585) : (i64) -> ()
        %7587 = arith.constant 97047688511552 : i64
        %7588 = arith.constant 1 : i64
        %7589 = func.call @cc_make_closure(%7587, %7588) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7589) : (i64) -> ()
        %7590 = func.call @stack_pop_pointer() : () -> i64
        %7591 = func.call @cc_nil_value() : () -> i64
        %7592 = llvm.mlir.addressof @str663 : !llvm.ptr
        %7593 = arith.constant 18 : i64
        %7594 = func.call @cc_make_string(%7592, %7593) : (!llvm.ptr, i64) -> i64
        %7595 = func.call @cc_nil_value() : () -> i64
        %7596 = func.call @cc_intern(%7594, %7595) : (i64, i64) -> i64
        %7597 = func.call @cc_nil_value() : () -> i64
        %7598 = func.call @cc_cons(%7596, %7597) : (i64, i64) -> i64
        %7599 = func.call @cc_values_pack(%7598) : (i64) -> i64
        func.call @stack_push_pointer(%7596) : (i64) -> ()
        %7600 = func.call @stack_pop_pointer() : () -> i64
        %7601 = func.call @cc_make_instance(%7600, %7591) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7601) : (i64) -> ()
        %7602 = func.call @stack_pop_pointer() : () -> i64
        %7603 = func.call @cc_nil_value() : () -> i64
        %7604 = func.call @cc_errorp(%7590) : (i64) -> i64
        %7605 = arith.cmpi ne, %7604, %7603 : i64
        %7606 = arith.cmpi eq, %7603, %7603 : i64
        %7607 = arith.andi %7605, %7606 : i1
        %7608 = scf.if %7607 -> (i64) {
          scf.yield %7590 : i64
        } else {
          scf.yield %7603 : i64
        }
        %7609 = func.call @cc_errorp(%7602) : (i64) -> i64
        %7610 = arith.cmpi ne, %7609, %7603 : i64
        %7611 = arith.cmpi eq, %7608, %7603 : i64
        %7612 = arith.andi %7610, %7611 : i1
        %7613 = scf.if %7612 -> (i64) {
          scf.yield %7602 : i64
        } else {
          scf.yield %7608 : i64
        }
        %7614 = arith.cmpi ne, %7613, %7603 : i64
        scf.if %7614 {
          func.call @stack_push_pointer(%7613) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%7590) : (i64) -> ()
          func.call @stack_push_pointer(%7602) : (i64) -> ()
          %7615 = llvm.mlir.addressof @str664 : !llvm.ptr
          %7616 = func.call @cc_make_function_ref_const(%7615) : (!llvm.ptr) -> i64
          %7617 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%7616, %7617) : (i64, i64) -> ()
        }
        %7618 = func.call @stack_pop_pointer() : () -> i64
        %7619 = func.call @cc_nil_value() : () -> i64
        %7620 = func.call @cc_errorp(%7618) : (i64) -> i64
        %7621 = arith.cmpi ne, %7620, %7619 : i64
        %7622 = scf.if %7621 -> (i64) {
          scf.yield %7618 : i64
        } else {
          %7623 = func.call @cc_get_output_stream_string(%7546) : (i64) -> i64
          scf.yield %7623 : i64
        }
        func.call @stack_push_pointer(%7622) : (i64) -> ()
        %7624 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7624 : i64
      }
      %7625 = func.call @cc_nil_value() : () -> i64
      %7626 = func.call @cc_errorp(%7545) : (i64) -> i64
      %7627 = arith.cmpi ne, %7626, %7625 : i64
      %7628 = scf.if %7627 -> (i64) {
        scf.yield %7545 : i64
      } else {
        %7629 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%7629) : (i64) -> ()
        %7630 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7630 : i64
      }
      func.call @stack_push_pointer(%7628) : (i64) -> ()
      %7631 = func.call @stack_pop_pointer() : () -> i64
      %7632 = func.call @cc_nil_value() : () -> i64
      %7633 = func.call @cc_cons(%7631, %7632) : (i64, i64) -> i64
      %7634 = func.call @cc_not(%7633) : (i64) -> i64
      func.call @stack_push_pointer(%7634) : (i64) -> ()
      %7635 = func.call @stack_pop_pointer() : () -> i64
      %7636 = func.call @cc_nil_value() : () -> i64
      %7637 = func.call @cc_cons(%7635, %7636) : (i64, i64) -> i64
      %7638 = func.call @cc_not(%7637) : (i64) -> i64
      func.call @stack_push_pointer(%7638) : (i64) -> ()
      %7639 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7639 : i64
    }
    func.call @stack_push_pointer(%7540) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511558"() {
    %8100 = func.call @stack_pop_pointer() : () -> i64
    %8101 = func.call @cc_nil_value() : () -> i64
    %8102 = func.call @cc_nil_value() : () -> i64
    %8103 = func.call @cc_errorp(%8101) : (i64) -> i64
    %8104 = arith.cmpi ne, %8103, %8102 : i64
    %8105 = scf.if %8104 -> (i64) {
      scf.yield %8101 : i64
    } else {
      func.call @stack_push_pointer(%8100) : (i64) -> ()
      %8106 = func.call @stack_pop_pointer() : () -> i64
      %8107 = func.call @cc_nil_value() : () -> i64
      %8108 = func.call @cc_errorp(%8106) : (i64) -> i64
      %8109 = arith.cmpi ne, %8108, %8107 : i64
      %8110 = arith.cmpi eq, %8107, %8107 : i64
      %8111 = arith.andi %8109, %8110 : i1
      %8112 = scf.if %8111 -> (i64) {
        scf.yield %8106 : i64
      } else {
        scf.yield %8107 : i64
      }
      %8113 = arith.cmpi ne, %8112, %8107 : i64
      scf.if %8113 {
        func.call @stack_push_pointer(%8112) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8106) : (i64) -> ()
        %8114 = llvm.mlir.addressof @str701 : !llvm.ptr
        %8115 = func.call @cc_make_function_ref_const(%8114) : (!llvm.ptr) -> i64
        %8116 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%8115, %8116) : (i64, i64) -> ()
      }
      %8117 = llvm.mlir.addressof @str702 : !llvm.ptr
      %8118 = arith.constant 32 : i64
      %8119 = func.call @cc_make_string(%8117, %8118) : (!llvm.ptr, i64) -> i64
      %8120 = func.call @cc_nil_value() : () -> i64
      %8121 = func.call @cc_intern(%8119, %8120) : (i64, i64) -> i64
      %8122 = func.call @cc_nil_value() : () -> i64
      %8123 = func.call @cc_cons(%8121, %8122) : (i64, i64) -> i64
      %8124 = func.call @cc_values_pack(%8123) : (i64) -> i64
      func.call @stack_push_pointer(%8121) : (i64) -> ()
      %8125 = func.call @stack_pop_pointer() : () -> i64
      %8126 = func.call @stack_pop_pointer() : () -> i64
      %8127 = func.call @cc_eq(%8126, %8125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8127) : (i64) -> ()
      %8128 = func.call @stack_pop_pointer() : () -> i64
      %8129 = func.call @cc_nil_value() : () -> i64
      %8130 = arith.cmpi ne, %8128, %8129 : i64
      scf.if %8130 {
        %8131 = func.call @cc_nil_value() : () -> i64
        %8132 = func.call @cc_nil_value() : () -> i64
        %8133 = func.call @cc_errorp(%8131) : (i64) -> i64
        %8134 = arith.cmpi ne, %8133, %8132 : i64
        %8135 = scf.if %8134 -> (i64) {
          scf.yield %8131 : i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %8136 = func.call @stack_pop_pointer() : () -> i64
          %8137 = func.call @cc_multiple_value_list(%8136) : (i64) -> i64
          %8138 = func.call @cc_t_value() : () -> i64
          %8139 = llvm.mlir.addressof @str703 : !llvm.ptr
          %8140 = arith.constant 37 : i64
          %8141 = func.call @cc_make_string(%8139, %8140) : (!llvm.ptr, i64) -> i64
          %8142 = func.call @cc_nil_value() : () -> i64
          %8143 = func.call @cc_intern(%8141, %8142) : (i64, i64) -> i64
          %8144 = func.call @cc_nil_value() : () -> i64
          %8145 = func.call @cc_cons(%8143, %8144) : (i64, i64) -> i64
          %8146 = func.call @cc_values_pack(%8145) : (i64) -> i64
          %8147 = func.call @cc_set_symbol_value(%8143, %8138) : (i64, i64) -> i64
          %8148 = llvm.mlir.addressof @str704 : !llvm.ptr
          %8149 = arith.constant 38 : i64
          %8150 = func.call @cc_make_string(%8148, %8149) : (!llvm.ptr, i64) -> i64
          %8151 = func.call @cc_nil_value() : () -> i64
          %8152 = func.call @cc_intern(%8150, %8151) : (i64, i64) -> i64
          %8153 = func.call @cc_nil_value() : () -> i64
          %8154 = func.call @cc_cons(%8152, %8153) : (i64, i64) -> i64
          %8155 = func.call @cc_values_pack(%8154) : (i64) -> i64
          %8156 = func.call @cc_set_symbol_value(%8152, %8136) : (i64, i64) -> i64
          %8157 = llvm.mlir.addressof @str705 : !llvm.ptr
          %8158 = arith.constant 39 : i64
          %8159 = func.call @cc_make_string(%8157, %8158) : (!llvm.ptr, i64) -> i64
          %8160 = func.call @cc_nil_value() : () -> i64
          %8161 = func.call @cc_intern(%8159, %8160) : (i64, i64) -> i64
          %8162 = func.call @cc_nil_value() : () -> i64
          %8163 = func.call @cc_cons(%8161, %8162) : (i64, i64) -> i64
          %8164 = func.call @cc_values_pack(%8163) : (i64) -> i64
          %8165 = func.call @cc_set_symbol_value(%8161, %8137) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8136) : (i64) -> ()
          %8166 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %8166 : i64
        }
        func.call @stack_push_pointer(%8135) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %8167 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8167 : i64
    }
    func.call @stack_push_pointer(%8105) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511557"() {
    %8087 = func.call @stack_pop_pointer() : () -> i64
    %8088 = func.call @cc_nil_value() : () -> i64
    %8089 = func.call @cc_nil_value() : () -> i64
    %8090 = func.call @cc_errorp(%8088) : (i64) -> i64
    %8091 = arith.cmpi ne, %8090, %8089 : i64
    %8092 = scf.if %8091 -> (i64) {
      scf.yield %8088 : i64
    } else {
      %8093 = func.call @cc_t_value() : () -> i64
      %8094 = func.call @cc_debug_current_stack(%8093) : (i64) -> i64
      %8095 = func.call @cc_nil_value() : () -> i64
      %8096 = func.call @cc_nil_value() : () -> i64
      %8097 = func.call @cc_errorp(%8095) : (i64) -> i64
      %8098 = arith.cmpi ne, %8097, %8096 : i64
      %8099 = scf.if %8098 -> (i64) {
        scf.yield %8095 : i64
      } else {
        %8168 = arith.constant 97047688511558 : i64
        %8169 = arith.constant 0 : i64
        %8170 = func.call @cc_make_closure(%8168, %8169) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8170) : (i64) -> ()
        %8171 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%8094) : (i64) -> ()
        %8172 = func.call @stack_pop_pointer() : () -> i64
        %8173 = func.call @cc_nil_value() : () -> i64
        %8174 = func.call @cc_errorp(%8171) : (i64) -> i64
        %8175 = arith.cmpi ne, %8174, %8173 : i64
        %8176 = arith.cmpi eq, %8173, %8173 : i64
        %8177 = arith.andi %8175, %8176 : i1
        %8178 = scf.if %8177 -> (i64) {
          scf.yield %8171 : i64
        } else {
          scf.yield %8173 : i64
        }
        %8179 = func.call @cc_errorp(%8172) : (i64) -> i64
        %8180 = arith.cmpi ne, %8179, %8173 : i64
        %8181 = arith.cmpi eq, %8178, %8173 : i64
        %8182 = arith.andi %8180, %8181 : i1
        %8183 = scf.if %8182 -> (i64) {
          scf.yield %8172 : i64
        } else {
          scf.yield %8178 : i64
        }
        %8184 = arith.cmpi ne, %8183, %8173 : i64
        scf.if %8184 {
          func.call @stack_push_pointer(%8183) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8171) : (i64) -> ()
          func.call @stack_push_pointer(%8172) : (i64) -> ()
          %8185 = llvm.mlir.addressof @str706 : !llvm.ptr
          %8186 = func.call @cc_make_function_ref_const(%8185) : (!llvm.ptr) -> i64
          %8187 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%8186, %8187) : (i64, i64) -> ()
        }
        %8188 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8188 : i64
      }
      func.call @stack_push_pointer(%8099) : (i64) -> ()
      %8189 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8189 : i64
    }
    func.call @stack_push_pointer(%8092) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511556"() {
    %8081 = func.call @stack_pop_pointer() : () -> i64
    %8082 = func.call @cc_nil_value() : () -> i64
    %8083 = func.call @cc_nil_value() : () -> i64
    %8084 = func.call @cc_errorp(%8082) : (i64) -> i64
    %8085 = arith.cmpi ne, %8084, %8083 : i64
    %8086 = scf.if %8085 -> (i64) {
      scf.yield %8082 : i64
    } else {
      func.call @stack_push_pointer(%8081) : (i64) -> ()
      %8190 = arith.constant 97047688511557 : i64
      %8191 = arith.constant 1 : i64
      %8192 = func.call @cc_make_closure(%8190, %8191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8192) : (i64) -> ()
      %8193 = func.call @stack_pop_pointer() : () -> i64
      %8194 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%8194) : (i64) -> ()
      %8195 = func.call @stack_pop_pointer() : () -> i64
      %8196 = func.call @cc_nil_value() : () -> i64
      %8197 = func.call @cc_errorp(%8193) : (i64) -> i64
      %8198 = arith.cmpi ne, %8197, %8196 : i64
      %8199 = arith.cmpi eq, %8196, %8196 : i64
      %8200 = arith.andi %8198, %8199 : i1
      %8201 = scf.if %8200 -> (i64) {
        scf.yield %8193 : i64
      } else {
        scf.yield %8196 : i64
      }
      %8202 = func.call @cc_errorp(%8195) : (i64) -> i64
      %8203 = arith.cmpi ne, %8202, %8196 : i64
      %8204 = arith.cmpi eq, %8201, %8196 : i64
      %8205 = arith.andi %8203, %8204 : i1
      %8206 = scf.if %8205 -> (i64) {
        scf.yield %8195 : i64
      } else {
        scf.yield %8201 : i64
      }
      %8207 = arith.cmpi ne, %8206, %8196 : i64
      scf.if %8207 {
        func.call @stack_push_pointer(%8206) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8193) : (i64) -> ()
        func.call @stack_push_pointer(%8195) : (i64) -> ()
        %8208 = llvm.mlir.addressof @str707 : !llvm.ptr
        %8209 = func.call @cc_make_function_ref_const(%8208) : (!llvm.ptr) -> i64
        %8210 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%8209, %8210) : (i64, i64) -> ()
      }
      %8211 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8211 : i64
    }
    func.call @stack_push_pointer(%8086) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511554"() {
    %8047 = func.call @stack_pop_pointer() : () -> i64
    %8048 = func.call @cc_nil_value() : () -> i64
    %8049 = func.call @cc_nil_value() : () -> i64
    %8050 = func.call @cc_errorp(%8048) : (i64) -> i64
    %8051 = arith.cmpi ne, %8050, %8049 : i64
    %8052 = scf.if %8051 -> (i64) {
      scf.yield %8048 : i64
    } else {
      %8053 = func.call @cc_nil_value() : () -> i64
      %8054 = llvm.mlir.addressof @str698 : !llvm.ptr
      %8055 = arith.constant 37 : i64
      %8056 = func.call @cc_make_string(%8054, %8055) : (!llvm.ptr, i64) -> i64
      %8057 = func.call @cc_nil_value() : () -> i64
      %8058 = func.call @cc_intern(%8056, %8057) : (i64, i64) -> i64
      %8059 = func.call @cc_nil_value() : () -> i64
      %8060 = func.call @cc_cons(%8058, %8059) : (i64, i64) -> i64
      %8061 = func.call @cc_values_pack(%8060) : (i64) -> i64
      %8062 = func.call @cc_set_symbol_value(%8058, %8053) : (i64, i64) -> i64
      %8063 = llvm.mlir.addressof @str699 : !llvm.ptr
      %8064 = arith.constant 38 : i64
      %8065 = func.call @cc_make_string(%8063, %8064) : (!llvm.ptr, i64) -> i64
      %8066 = func.call @cc_nil_value() : () -> i64
      %8067 = func.call @cc_intern(%8065, %8066) : (i64, i64) -> i64
      %8068 = func.call @cc_nil_value() : () -> i64
      %8069 = func.call @cc_cons(%8067, %8068) : (i64, i64) -> i64
      %8070 = func.call @cc_values_pack(%8069) : (i64) -> i64
      %8071 = func.call @cc_set_symbol_value(%8067, %8053) : (i64, i64) -> i64
      %8072 = llvm.mlir.addressof @str700 : !llvm.ptr
      %8073 = arith.constant 39 : i64
      %8074 = func.call @cc_make_string(%8072, %8073) : (!llvm.ptr, i64) -> i64
      %8075 = func.call @cc_nil_value() : () -> i64
      %8076 = func.call @cc_intern(%8074, %8075) : (i64, i64) -> i64
      %8077 = func.call @cc_nil_value() : () -> i64
      %8078 = func.call @cc_cons(%8076, %8077) : (i64, i64) -> i64
      %8079 = func.call @cc_values_pack(%8078) : (i64) -> i64
      %8080 = func.call @cc_set_symbol_value(%8076, %8053) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8047) : (i64) -> ()
      %8212 = arith.constant 97047688511556 : i64
      %8213 = arith.constant 1 : i64
      %8214 = func.call @cc_make_closure(%8212, %8213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8214) : (i64) -> ()
      %8215 = func.call @stack_pop_pointer() : () -> i64
      %8216 = func.call @cc_nil_value() : () -> i64
      %8217 = func.call @cc_errorp(%8215) : (i64) -> i64
      %8218 = arith.cmpi ne, %8217, %8216 : i64
      %8219 = arith.cmpi eq, %8216, %8216 : i64
      %8220 = arith.andi %8218, %8219 : i1
      %8221 = scf.if %8220 -> (i64) {
        scf.yield %8215 : i64
      } else {
        scf.yield %8216 : i64
      }
      %8222 = arith.cmpi ne, %8221, %8216 : i64
      scf.if %8222 {
        func.call @stack_push_pointer(%8221) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8215) : (i64) -> ()
        %8223 = llvm.mlir.addressof @str708 : !llvm.ptr
        %8224 = func.call @cc_make_function_ref_const(%8223) : (!llvm.ptr) -> i64
        %8225 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%8224, %8225) : (i64, i64) -> ()
      }
      %8226 = func.call @stack_pop_pointer() : () -> i64
      %8227 = func.call @cc_multiple_value_list(%8226) : (i64) -> i64
      %8228 = llvm.mlir.addressof @str709 : !llvm.ptr
      %8229 = arith.constant 37 : i64
      %8230 = func.call @cc_make_string(%8228, %8229) : (!llvm.ptr, i64) -> i64
      %8231 = func.call @cc_nil_value() : () -> i64
      %8232 = func.call @cc_intern(%8230, %8231) : (i64, i64) -> i64
      %8233 = func.call @cc_nil_value() : () -> i64
      %8234 = func.call @cc_cons(%8232, %8233) : (i64, i64) -> i64
      %8235 = func.call @cc_values_pack(%8234) : (i64) -> i64
      %8236 = func.call @cc_symbol_value(%8232) : (i64) -> i64
      %8237 = llvm.mlir.addressof @str710 : !llvm.ptr
      %8238 = arith.constant 38 : i64
      %8239 = func.call @cc_make_string(%8237, %8238) : (!llvm.ptr, i64) -> i64
      %8240 = func.call @cc_nil_value() : () -> i64
      %8241 = func.call @cc_intern(%8239, %8240) : (i64, i64) -> i64
      %8242 = func.call @cc_nil_value() : () -> i64
      %8243 = func.call @cc_cons(%8241, %8242) : (i64, i64) -> i64
      %8244 = func.call @cc_values_pack(%8243) : (i64) -> i64
      %8245 = func.call @cc_symbol_value(%8241) : (i64) -> i64
      %8246 = llvm.mlir.addressof @str711 : !llvm.ptr
      %8247 = arith.constant 39 : i64
      %8248 = func.call @cc_make_string(%8246, %8247) : (!llvm.ptr, i64) -> i64
      %8249 = func.call @cc_nil_value() : () -> i64
      %8250 = func.call @cc_intern(%8248, %8249) : (i64, i64) -> i64
      %8251 = func.call @cc_nil_value() : () -> i64
      %8252 = func.call @cc_cons(%8250, %8251) : (i64, i64) -> i64
      %8253 = func.call @cc_values_pack(%8252) : (i64) -> i64
      %8254 = func.call @cc_symbol_value(%8250) : (i64) -> i64
      %8255 = func.call @cc_nil_value() : () -> i64
      %8256 = arith.cmpi ne, %8236, %8255 : i64
      %8257 = scf.if %8256 -> (i64) {
        scf.yield %8254 : i64
      } else {
        scf.yield %8227 : i64
      }
      %8258 = func.call @cc_values_pack(%8257) : (i64) -> i64
      func.call @stack_push_pointer(%8258) : (i64) -> ()
      %8259 = func.call @stack_pop_pointer() : () -> i64
      %8260 = func.call @cc_nil_value() : () -> i64
      %8261 = func.call @cc_cons(%8259, %8260) : (i64, i64) -> i64
      %8262 = func.call @cc_not(%8261) : (i64) -> i64
      func.call @stack_push_pointer(%8262) : (i64) -> ()
      %8263 = func.call @stack_pop_pointer() : () -> i64
      %8264 = func.call @cc_nil_value() : () -> i64
      %8265 = func.call @cc_cons(%8263, %8264) : (i64, i64) -> i64
      %8266 = func.call @cc_not(%8265) : (i64) -> i64
      func.call @stack_push_pointer(%8266) : (i64) -> ()
      %8267 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8267 : i64
    }
    func.call @stack_push_pointer(%8052) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511564"() {
    %8732 = func.call @stack_pop_pointer() : () -> i64
    %8733 = func.call @cc_nil_value() : () -> i64
    %8734 = func.call @cc_nil_value() : () -> i64
    %8735 = func.call @cc_errorp(%8733) : (i64) -> i64
    %8736 = arith.cmpi ne, %8735, %8734 : i64
    %8737 = scf.if %8736 -> (i64) {
      scf.yield %8733 : i64
    } else {
      func.call @stack_push_pointer(%8732) : (i64) -> ()
      %8738 = func.call @stack_pop_pointer() : () -> i64
      %8739 = func.call @cc_nil_value() : () -> i64
      %8740 = func.call @cc_errorp(%8738) : (i64) -> i64
      %8741 = arith.cmpi ne, %8740, %8739 : i64
      %8742 = arith.cmpi eq, %8739, %8739 : i64
      %8743 = arith.andi %8741, %8742 : i1
      %8744 = scf.if %8743 -> (i64) {
        scf.yield %8738 : i64
      } else {
        scf.yield %8739 : i64
      }
      %8745 = arith.cmpi ne, %8744, %8739 : i64
      scf.if %8745 {
        func.call @stack_push_pointer(%8744) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8738) : (i64) -> ()
        %8746 = llvm.mlir.addressof @str749 : !llvm.ptr
        %8747 = func.call @cc_make_function_ref_const(%8746) : (!llvm.ptr) -> i64
        %8748 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%8747, %8748) : (i64, i64) -> ()
      }
      %8749 = llvm.mlir.addressof @str750 : !llvm.ptr
      %8750 = arith.constant 32 : i64
      %8751 = func.call @cc_make_string(%8749, %8750) : (!llvm.ptr, i64) -> i64
      %8752 = func.call @cc_nil_value() : () -> i64
      %8753 = func.call @cc_intern(%8751, %8752) : (i64, i64) -> i64
      %8754 = func.call @cc_nil_value() : () -> i64
      %8755 = func.call @cc_cons(%8753, %8754) : (i64, i64) -> i64
      %8756 = func.call @cc_values_pack(%8755) : (i64) -> i64
      func.call @stack_push_pointer(%8753) : (i64) -> ()
      %8757 = func.call @stack_pop_pointer() : () -> i64
      %8758 = func.call @stack_pop_pointer() : () -> i64
      %8759 = func.call @cc_eq(%8758, %8757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8759) : (i64) -> ()
      %8760 = func.call @stack_pop_pointer() : () -> i64
      %8761 = func.call @cc_nil_value() : () -> i64
      %8762 = arith.cmpi ne, %8760, %8761 : i64
      scf.if %8762 {
        %8763 = func.call @cc_nil_value() : () -> i64
        %8764 = func.call @cc_nil_value() : () -> i64
        %8765 = func.call @cc_errorp(%8763) : (i64) -> i64
        %8766 = arith.cmpi ne, %8765, %8764 : i64
        %8767 = scf.if %8766 -> (i64) {
          scf.yield %8763 : i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %8768 = func.call @stack_pop_pointer() : () -> i64
          %8769 = func.call @cc_multiple_value_list(%8768) : (i64) -> i64
          %8770 = func.call @cc_t_value() : () -> i64
          %8771 = llvm.mlir.addressof @str751 : !llvm.ptr
          %8772 = arith.constant 37 : i64
          %8773 = func.call @cc_make_string(%8771, %8772) : (!llvm.ptr, i64) -> i64
          %8774 = func.call @cc_nil_value() : () -> i64
          %8775 = func.call @cc_intern(%8773, %8774) : (i64, i64) -> i64
          %8776 = func.call @cc_nil_value() : () -> i64
          %8777 = func.call @cc_cons(%8775, %8776) : (i64, i64) -> i64
          %8778 = func.call @cc_values_pack(%8777) : (i64) -> i64
          %8779 = func.call @cc_set_symbol_value(%8775, %8770) : (i64, i64) -> i64
          %8780 = llvm.mlir.addressof @str752 : !llvm.ptr
          %8781 = arith.constant 38 : i64
          %8782 = func.call @cc_make_string(%8780, %8781) : (!llvm.ptr, i64) -> i64
          %8783 = func.call @cc_nil_value() : () -> i64
          %8784 = func.call @cc_intern(%8782, %8783) : (i64, i64) -> i64
          %8785 = func.call @cc_nil_value() : () -> i64
          %8786 = func.call @cc_cons(%8784, %8785) : (i64, i64) -> i64
          %8787 = func.call @cc_values_pack(%8786) : (i64) -> i64
          %8788 = func.call @cc_set_symbol_value(%8784, %8768) : (i64, i64) -> i64
          %8789 = llvm.mlir.addressof @str753 : !llvm.ptr
          %8790 = arith.constant 39 : i64
          %8791 = func.call @cc_make_string(%8789, %8790) : (!llvm.ptr, i64) -> i64
          %8792 = func.call @cc_nil_value() : () -> i64
          %8793 = func.call @cc_intern(%8791, %8792) : (i64, i64) -> i64
          %8794 = func.call @cc_nil_value() : () -> i64
          %8795 = func.call @cc_cons(%8793, %8794) : (i64, i64) -> i64
          %8796 = func.call @cc_values_pack(%8795) : (i64) -> i64
          %8797 = func.call @cc_set_symbol_value(%8793, %8769) : (i64, i64) -> i64
          func.call @stack_push_pointer(%8768) : (i64) -> ()
          %8798 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %8798 : i64
        }
        func.call @stack_push_pointer(%8767) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %8799 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8799 : i64
    }
    func.call @stack_push_pointer(%8737) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511563"() {
    %8719 = func.call @stack_pop_pointer() : () -> i64
    %8720 = func.call @cc_nil_value() : () -> i64
    %8721 = func.call @cc_nil_value() : () -> i64
    %8722 = func.call @cc_errorp(%8720) : (i64) -> i64
    %8723 = arith.cmpi ne, %8722, %8721 : i64
    %8724 = scf.if %8723 -> (i64) {
      scf.yield %8720 : i64
    } else {
      %8725 = func.call @cc_t_value() : () -> i64
      %8726 = func.call @cc_debug_current_stack(%8725) : (i64) -> i64
      %8727 = func.call @cc_nil_value() : () -> i64
      %8728 = func.call @cc_nil_value() : () -> i64
      %8729 = func.call @cc_errorp(%8727) : (i64) -> i64
      %8730 = arith.cmpi ne, %8729, %8728 : i64
      %8731 = scf.if %8730 -> (i64) {
        scf.yield %8727 : i64
      } else {
        %8800 = arith.constant 97047688511564 : i64
        %8801 = arith.constant 0 : i64
        %8802 = func.call @cc_make_closure(%8800, %8801) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8802) : (i64) -> ()
        %8803 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%8726) : (i64) -> ()
        %8804 = func.call @stack_pop_pointer() : () -> i64
        %8805 = func.call @cc_nil_value() : () -> i64
        %8806 = func.call @cc_errorp(%8803) : (i64) -> i64
        %8807 = arith.cmpi ne, %8806, %8805 : i64
        %8808 = arith.cmpi eq, %8805, %8805 : i64
        %8809 = arith.andi %8807, %8808 : i1
        %8810 = scf.if %8809 -> (i64) {
          scf.yield %8803 : i64
        } else {
          scf.yield %8805 : i64
        }
        %8811 = func.call @cc_errorp(%8804) : (i64) -> i64
        %8812 = arith.cmpi ne, %8811, %8805 : i64
        %8813 = arith.cmpi eq, %8810, %8805 : i64
        %8814 = arith.andi %8812, %8813 : i1
        %8815 = scf.if %8814 -> (i64) {
          scf.yield %8804 : i64
        } else {
          scf.yield %8810 : i64
        }
        %8816 = arith.cmpi ne, %8815, %8805 : i64
        scf.if %8816 {
          func.call @stack_push_pointer(%8815) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%8803) : (i64) -> ()
          func.call @stack_push_pointer(%8804) : (i64) -> ()
          %8817 = llvm.mlir.addressof @str754 : !llvm.ptr
          %8818 = func.call @cc_make_function_ref_const(%8817) : (!llvm.ptr) -> i64
          %8819 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%8818, %8819) : (i64, i64) -> ()
        }
        %8820 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8820 : i64
      }
      func.call @stack_push_pointer(%8731) : (i64) -> ()
      %8821 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8821 : i64
    }
    func.call @stack_push_pointer(%8724) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511562"() {
    %8713 = func.call @stack_pop_pointer() : () -> i64
    %8714 = func.call @cc_nil_value() : () -> i64
    %8715 = func.call @cc_nil_value() : () -> i64
    %8716 = func.call @cc_errorp(%8714) : (i64) -> i64
    %8717 = arith.cmpi ne, %8716, %8715 : i64
    %8718 = scf.if %8717 -> (i64) {
      scf.yield %8714 : i64
    } else {
      func.call @stack_push_pointer(%8713) : (i64) -> ()
      %8822 = arith.constant 97047688511563 : i64
      %8823 = arith.constant 1 : i64
      %8824 = func.call @cc_make_closure(%8822, %8823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8824) : (i64) -> ()
      %8825 = func.call @stack_pop_pointer() : () -> i64
      %8826 = func.call @cc_nil_value() : () -> i64
      %8827 = func.call @cc_errorp(%8825) : (i64) -> i64
      %8828 = arith.cmpi ne, %8827, %8826 : i64
      %8829 = arith.cmpi eq, %8826, %8826 : i64
      %8830 = arith.andi %8828, %8829 : i1
      %8831 = scf.if %8830 -> (i64) {
        scf.yield %8825 : i64
      } else {
        scf.yield %8826 : i64
      }
      %8832 = arith.cmpi ne, %8831, %8826 : i64
      scf.if %8832 {
        func.call @stack_push_pointer(%8831) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8825) : (i64) -> ()
        %8833 = llvm.mlir.addressof @str755 : !llvm.ptr
        %8834 = func.call @cc_make_function_ref_const(%8833) : (!llvm.ptr) -> i64
        %8835 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%8834, %8835) : (i64, i64) -> ()
      }
      %8836 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8836 : i64
    }
    func.call @stack_push_pointer(%8718) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511560"() {
    %8679 = func.call @stack_pop_pointer() : () -> i64
    %8680 = func.call @cc_nil_value() : () -> i64
    %8681 = func.call @cc_nil_value() : () -> i64
    %8682 = func.call @cc_errorp(%8680) : (i64) -> i64
    %8683 = arith.cmpi ne, %8682, %8681 : i64
    %8684 = scf.if %8683 -> (i64) {
      scf.yield %8680 : i64
    } else {
      %8685 = func.call @cc_nil_value() : () -> i64
      %8686 = llvm.mlir.addressof @str746 : !llvm.ptr
      %8687 = arith.constant 37 : i64
      %8688 = func.call @cc_make_string(%8686, %8687) : (!llvm.ptr, i64) -> i64
      %8689 = func.call @cc_nil_value() : () -> i64
      %8690 = func.call @cc_intern(%8688, %8689) : (i64, i64) -> i64
      %8691 = func.call @cc_nil_value() : () -> i64
      %8692 = func.call @cc_cons(%8690, %8691) : (i64, i64) -> i64
      %8693 = func.call @cc_values_pack(%8692) : (i64) -> i64
      %8694 = func.call @cc_set_symbol_value(%8690, %8685) : (i64, i64) -> i64
      %8695 = llvm.mlir.addressof @str747 : !llvm.ptr
      %8696 = arith.constant 38 : i64
      %8697 = func.call @cc_make_string(%8695, %8696) : (!llvm.ptr, i64) -> i64
      %8698 = func.call @cc_nil_value() : () -> i64
      %8699 = func.call @cc_intern(%8697, %8698) : (i64, i64) -> i64
      %8700 = func.call @cc_nil_value() : () -> i64
      %8701 = func.call @cc_cons(%8699, %8700) : (i64, i64) -> i64
      %8702 = func.call @cc_values_pack(%8701) : (i64) -> i64
      %8703 = func.call @cc_set_symbol_value(%8699, %8685) : (i64, i64) -> i64
      %8704 = llvm.mlir.addressof @str748 : !llvm.ptr
      %8705 = arith.constant 39 : i64
      %8706 = func.call @cc_make_string(%8704, %8705) : (!llvm.ptr, i64) -> i64
      %8707 = func.call @cc_nil_value() : () -> i64
      %8708 = func.call @cc_intern(%8706, %8707) : (i64, i64) -> i64
      %8709 = func.call @cc_nil_value() : () -> i64
      %8710 = func.call @cc_cons(%8708, %8709) : (i64, i64) -> i64
      %8711 = func.call @cc_values_pack(%8710) : (i64) -> i64
      %8712 = func.call @cc_set_symbol_value(%8708, %8685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8679) : (i64) -> ()
      %8837 = arith.constant 97047688511562 : i64
      %8838 = arith.constant 1 : i64
      %8839 = func.call @cc_make_closure(%8837, %8838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8839) : (i64) -> ()
      %8840 = func.call @stack_pop_pointer() : () -> i64
      %8841 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%8841) : (i64) -> ()
      %8842 = func.call @stack_pop_pointer() : () -> i64
      %8843 = func.call @cc_nil_value() : () -> i64
      %8844 = func.call @cc_errorp(%8840) : (i64) -> i64
      %8845 = arith.cmpi ne, %8844, %8843 : i64
      %8846 = arith.cmpi eq, %8843, %8843 : i64
      %8847 = arith.andi %8845, %8846 : i1
      %8848 = scf.if %8847 -> (i64) {
        scf.yield %8840 : i64
      } else {
        scf.yield %8843 : i64
      }
      %8849 = func.call @cc_errorp(%8842) : (i64) -> i64
      %8850 = arith.cmpi ne, %8849, %8843 : i64
      %8851 = arith.cmpi eq, %8848, %8843 : i64
      %8852 = arith.andi %8850, %8851 : i1
      %8853 = scf.if %8852 -> (i64) {
        scf.yield %8842 : i64
      } else {
        scf.yield %8848 : i64
      }
      %8854 = arith.cmpi ne, %8853, %8843 : i64
      scf.if %8854 {
        func.call @stack_push_pointer(%8853) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8840) : (i64) -> ()
        func.call @stack_push_pointer(%8842) : (i64) -> ()
        %8855 = llvm.mlir.addressof @str756 : !llvm.ptr
        %8856 = func.call @cc_make_function_ref_const(%8855) : (!llvm.ptr) -> i64
        %8857 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%8856, %8857) : (i64, i64) -> ()
      }
      %8858 = func.call @stack_pop_pointer() : () -> i64
      %8859 = func.call @cc_multiple_value_list(%8858) : (i64) -> i64
      %8860 = llvm.mlir.addressof @str757 : !llvm.ptr
      %8861 = arith.constant 37 : i64
      %8862 = func.call @cc_make_string(%8860, %8861) : (!llvm.ptr, i64) -> i64
      %8863 = func.call @cc_nil_value() : () -> i64
      %8864 = func.call @cc_intern(%8862, %8863) : (i64, i64) -> i64
      %8865 = func.call @cc_nil_value() : () -> i64
      %8866 = func.call @cc_cons(%8864, %8865) : (i64, i64) -> i64
      %8867 = func.call @cc_values_pack(%8866) : (i64) -> i64
      %8868 = func.call @cc_symbol_value(%8864) : (i64) -> i64
      %8869 = llvm.mlir.addressof @str758 : !llvm.ptr
      %8870 = arith.constant 38 : i64
      %8871 = func.call @cc_make_string(%8869, %8870) : (!llvm.ptr, i64) -> i64
      %8872 = func.call @cc_nil_value() : () -> i64
      %8873 = func.call @cc_intern(%8871, %8872) : (i64, i64) -> i64
      %8874 = func.call @cc_nil_value() : () -> i64
      %8875 = func.call @cc_cons(%8873, %8874) : (i64, i64) -> i64
      %8876 = func.call @cc_values_pack(%8875) : (i64) -> i64
      %8877 = func.call @cc_symbol_value(%8873) : (i64) -> i64
      %8878 = llvm.mlir.addressof @str759 : !llvm.ptr
      %8879 = arith.constant 39 : i64
      %8880 = func.call @cc_make_string(%8878, %8879) : (!llvm.ptr, i64) -> i64
      %8881 = func.call @cc_nil_value() : () -> i64
      %8882 = func.call @cc_intern(%8880, %8881) : (i64, i64) -> i64
      %8883 = func.call @cc_nil_value() : () -> i64
      %8884 = func.call @cc_cons(%8882, %8883) : (i64, i64) -> i64
      %8885 = func.call @cc_values_pack(%8884) : (i64) -> i64
      %8886 = func.call @cc_symbol_value(%8882) : (i64) -> i64
      %8887 = func.call @cc_nil_value() : () -> i64
      %8888 = arith.cmpi ne, %8868, %8887 : i64
      %8889 = scf.if %8888 -> (i64) {
        scf.yield %8886 : i64
      } else {
        scf.yield %8859 : i64
      }
      %8890 = func.call @cc_values_pack(%8889) : (i64) -> i64
      func.call @stack_push_pointer(%8890) : (i64) -> ()
      %8891 = func.call @stack_pop_pointer() : () -> i64
      %8892 = func.call @cc_nil_value() : () -> i64
      %8893 = func.call @cc_cons(%8891, %8892) : (i64, i64) -> i64
      %8894 = func.call @cc_not(%8893) : (i64) -> i64
      func.call @stack_push_pointer(%8894) : (i64) -> ()
      %8895 = func.call @stack_pop_pointer() : () -> i64
      %8896 = func.call @cc_nil_value() : () -> i64
      %8897 = func.call @cc_cons(%8895, %8896) : (i64, i64) -> i64
      %8898 = func.call @cc_not(%8897) : (i64) -> i64
      func.call @stack_push_pointer(%8898) : (i64) -> ()
      %8899 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8899 : i64
    }
    func.call @stack_push_pointer(%8684) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511570"() {
    %9380 = func.call @stack_pop_pointer() : () -> i64
    %9381 = func.call @cc_nil_value() : () -> i64
    %9382 = func.call @cc_nil_value() : () -> i64
    %9383 = func.call @cc_errorp(%9381) : (i64) -> i64
    %9384 = arith.cmpi ne, %9383, %9382 : i64
    %9385 = scf.if %9384 -> (i64) {
      scf.yield %9381 : i64
    } else {
      func.call @stack_push_pointer(%9380) : (i64) -> ()
      %9386 = func.call @stack_pop_pointer() : () -> i64
      %9387 = func.call @cc_nil_value() : () -> i64
      %9388 = func.call @cc_errorp(%9386) : (i64) -> i64
      %9389 = arith.cmpi ne, %9388, %9387 : i64
      %9390 = arith.cmpi eq, %9387, %9387 : i64
      %9391 = arith.andi %9389, %9390 : i1
      %9392 = scf.if %9391 -> (i64) {
        scf.yield %9386 : i64
      } else {
        scf.yield %9387 : i64
      }
      %9393 = arith.cmpi ne, %9392, %9387 : i64
      scf.if %9393 {
        func.call @stack_push_pointer(%9392) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9386) : (i64) -> ()
        %9394 = llvm.mlir.addressof @str799 : !llvm.ptr
        %9395 = func.call @cc_make_function_ref_const(%9394) : (!llvm.ptr) -> i64
        %9396 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9395, %9396) : (i64, i64) -> ()
      }
      %9397 = llvm.mlir.addressof @str800 : !llvm.ptr
      %9398 = arith.constant 32 : i64
      %9399 = func.call @cc_make_string(%9397, %9398) : (!llvm.ptr, i64) -> i64
      %9400 = func.call @cc_nil_value() : () -> i64
      %9401 = func.call @cc_intern(%9399, %9400) : (i64, i64) -> i64
      %9402 = func.call @cc_nil_value() : () -> i64
      %9403 = func.call @cc_cons(%9401, %9402) : (i64, i64) -> i64
      %9404 = func.call @cc_values_pack(%9403) : (i64) -> i64
      func.call @stack_push_pointer(%9401) : (i64) -> ()
      %9405 = func.call @stack_pop_pointer() : () -> i64
      %9406 = func.call @stack_pop_pointer() : () -> i64
      %9407 = func.call @cc_eq(%9406, %9405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9407) : (i64) -> ()
      %9408 = func.call @stack_pop_pointer() : () -> i64
      %9409 = func.call @cc_nil_value() : () -> i64
      %9410 = arith.cmpi ne, %9408, %9409 : i64
      scf.if %9410 {
        %9411 = func.call @cc_nil_value() : () -> i64
        %9412 = func.call @cc_nil_value() : () -> i64
        %9413 = func.call @cc_errorp(%9411) : (i64) -> i64
        %9414 = arith.cmpi ne, %9413, %9412 : i64
        %9415 = scf.if %9414 -> (i64) {
          scf.yield %9411 : i64
        } else {
          %9416 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%9416) : (i64) -> ()
          %9417 = func.call @stack_pop_pointer() : () -> i64
          %9418 = func.call @cc_multiple_value_list(%9417) : (i64) -> i64
          %9419 = func.call @cc_t_value() : () -> i64
          %9420 = llvm.mlir.addressof @str801 : !llvm.ptr
          %9421 = arith.constant 37 : i64
          %9422 = func.call @cc_make_string(%9420, %9421) : (!llvm.ptr, i64) -> i64
          %9423 = func.call @cc_nil_value() : () -> i64
          %9424 = func.call @cc_intern(%9422, %9423) : (i64, i64) -> i64
          %9425 = func.call @cc_nil_value() : () -> i64
          %9426 = func.call @cc_cons(%9424, %9425) : (i64, i64) -> i64
          %9427 = func.call @cc_values_pack(%9426) : (i64) -> i64
          %9428 = func.call @cc_set_symbol_value(%9424, %9419) : (i64, i64) -> i64
          %9429 = llvm.mlir.addressof @str802 : !llvm.ptr
          %9430 = arith.constant 38 : i64
          %9431 = func.call @cc_make_string(%9429, %9430) : (!llvm.ptr, i64) -> i64
          %9432 = func.call @cc_nil_value() : () -> i64
          %9433 = func.call @cc_intern(%9431, %9432) : (i64, i64) -> i64
          %9434 = func.call @cc_nil_value() : () -> i64
          %9435 = func.call @cc_cons(%9433, %9434) : (i64, i64) -> i64
          %9436 = func.call @cc_values_pack(%9435) : (i64) -> i64
          %9437 = func.call @cc_set_symbol_value(%9433, %9417) : (i64, i64) -> i64
          %9438 = llvm.mlir.addressof @str803 : !llvm.ptr
          %9439 = arith.constant 39 : i64
          %9440 = func.call @cc_make_string(%9438, %9439) : (!llvm.ptr, i64) -> i64
          %9441 = func.call @cc_nil_value() : () -> i64
          %9442 = func.call @cc_intern(%9440, %9441) : (i64, i64) -> i64
          %9443 = func.call @cc_nil_value() : () -> i64
          %9444 = func.call @cc_cons(%9442, %9443) : (i64, i64) -> i64
          %9445 = func.call @cc_values_pack(%9444) : (i64) -> i64
          %9446 = func.call @cc_set_symbol_value(%9442, %9418) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9417) : (i64) -> ()
          %9447 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %9447 : i64
        }
        func.call @stack_push_pointer(%9415) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %9448 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9448 : i64
    }
    func.call @stack_push_pointer(%9385) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511569"() {
    %9367 = func.call @stack_pop_pointer() : () -> i64
    %9368 = func.call @cc_nil_value() : () -> i64
    %9369 = func.call @cc_nil_value() : () -> i64
    %9370 = func.call @cc_errorp(%9368) : (i64) -> i64
    %9371 = arith.cmpi ne, %9370, %9369 : i64
    %9372 = scf.if %9371 -> (i64) {
      scf.yield %9368 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %9373 = func.call @stack_pop_pointer() : () -> i64
      %9374 = func.call @cc_debug_current_stack(%9373) : (i64) -> i64
      %9375 = func.call @cc_nil_value() : () -> i64
      %9376 = func.call @cc_nil_value() : () -> i64
      %9377 = func.call @cc_errorp(%9375) : (i64) -> i64
      %9378 = arith.cmpi ne, %9377, %9376 : i64
      %9379 = scf.if %9378 -> (i64) {
        scf.yield %9375 : i64
      } else {
        %9449 = arith.constant 97047688511570 : i64
        %9450 = arith.constant 0 : i64
        %9451 = func.call @cc_make_closure(%9449, %9450) : (i64, i64) -> i64
        func.call @stack_push_pointer(%9451) : (i64) -> ()
        %9452 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%9374) : (i64) -> ()
        %9453 = func.call @stack_pop_pointer() : () -> i64
        %9454 = func.call @cc_nil_value() : () -> i64
        %9455 = func.call @cc_errorp(%9452) : (i64) -> i64
        %9456 = arith.cmpi ne, %9455, %9454 : i64
        %9457 = arith.cmpi eq, %9454, %9454 : i64
        %9458 = arith.andi %9456, %9457 : i1
        %9459 = scf.if %9458 -> (i64) {
          scf.yield %9452 : i64
        } else {
          scf.yield %9454 : i64
        }
        %9460 = func.call @cc_errorp(%9453) : (i64) -> i64
        %9461 = arith.cmpi ne, %9460, %9454 : i64
        %9462 = arith.cmpi eq, %9459, %9454 : i64
        %9463 = arith.andi %9461, %9462 : i1
        %9464 = scf.if %9463 -> (i64) {
          scf.yield %9453 : i64
        } else {
          scf.yield %9459 : i64
        }
        %9465 = arith.cmpi ne, %9464, %9454 : i64
        scf.if %9465 {
          func.call @stack_push_pointer(%9464) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%9452) : (i64) -> ()
          func.call @stack_push_pointer(%9453) : (i64) -> ()
          %9466 = llvm.mlir.addressof @str804 : !llvm.ptr
          %9467 = func.call @cc_make_function_ref_const(%9466) : (!llvm.ptr) -> i64
          %9468 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%9467, %9468) : (i64, i64) -> ()
        }
        %9469 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9469 : i64
      }
      func.call @stack_push_pointer(%9379) : (i64) -> ()
      %9470 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9470 : i64
    }
    func.call @stack_push_pointer(%9372) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511568"() {
    %9361 = func.call @stack_pop_pointer() : () -> i64
    %9362 = func.call @cc_nil_value() : () -> i64
    %9363 = func.call @cc_nil_value() : () -> i64
    %9364 = func.call @cc_errorp(%9362) : (i64) -> i64
    %9365 = arith.cmpi ne, %9364, %9363 : i64
    %9366 = scf.if %9365 -> (i64) {
      scf.yield %9362 : i64
    } else {
      func.call @stack_push_pointer(%9361) : (i64) -> ()
      %9471 = arith.constant 97047688511569 : i64
      %9472 = arith.constant 1 : i64
      %9473 = func.call @cc_make_closure(%9471, %9472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9473) : (i64) -> ()
      %9474 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9475 = func.call @stack_pop_pointer() : () -> i64
      %9476 = func.call @cc_nil_value() : () -> i64
      %9477 = func.call @cc_errorp(%9474) : (i64) -> i64
      %9478 = arith.cmpi ne, %9477, %9476 : i64
      %9479 = arith.cmpi eq, %9476, %9476 : i64
      %9480 = arith.andi %9478, %9479 : i1
      %9481 = scf.if %9480 -> (i64) {
        scf.yield %9474 : i64
      } else {
        scf.yield %9476 : i64
      }
      %9482 = func.call @cc_errorp(%9475) : (i64) -> i64
      %9483 = arith.cmpi ne, %9482, %9476 : i64
      %9484 = arith.cmpi eq, %9481, %9476 : i64
      %9485 = arith.andi %9483, %9484 : i1
      %9486 = scf.if %9485 -> (i64) {
        scf.yield %9475 : i64
      } else {
        scf.yield %9481 : i64
      }
      %9487 = arith.cmpi ne, %9486, %9476 : i64
      scf.if %9487 {
        func.call @stack_push_pointer(%9486) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9474) : (i64) -> ()
        func.call @stack_push_pointer(%9475) : (i64) -> ()
        %9488 = llvm.mlir.addressof @str805 : !llvm.ptr
        %9489 = func.call @cc_make_function_ref_const(%9488) : (!llvm.ptr) -> i64
        %9490 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%9489, %9490) : (i64, i64) -> ()
      }
      %9491 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9491 : i64
    }
    func.call @stack_push_pointer(%9366) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511566"() {
    %9327 = func.call @stack_pop_pointer() : () -> i64
    %9328 = func.call @cc_nil_value() : () -> i64
    %9329 = func.call @cc_nil_value() : () -> i64
    %9330 = func.call @cc_errorp(%9328) : (i64) -> i64
    %9331 = arith.cmpi ne, %9330, %9329 : i64
    %9332 = scf.if %9331 -> (i64) {
      scf.yield %9328 : i64
    } else {
      %9333 = func.call @cc_nil_value() : () -> i64
      %9334 = llvm.mlir.addressof @str796 : !llvm.ptr
      %9335 = arith.constant 37 : i64
      %9336 = func.call @cc_make_string(%9334, %9335) : (!llvm.ptr, i64) -> i64
      %9337 = func.call @cc_nil_value() : () -> i64
      %9338 = func.call @cc_intern(%9336, %9337) : (i64, i64) -> i64
      %9339 = func.call @cc_nil_value() : () -> i64
      %9340 = func.call @cc_cons(%9338, %9339) : (i64, i64) -> i64
      %9341 = func.call @cc_values_pack(%9340) : (i64) -> i64
      %9342 = func.call @cc_set_symbol_value(%9338, %9333) : (i64, i64) -> i64
      %9343 = llvm.mlir.addressof @str797 : !llvm.ptr
      %9344 = arith.constant 38 : i64
      %9345 = func.call @cc_make_string(%9343, %9344) : (!llvm.ptr, i64) -> i64
      %9346 = func.call @cc_nil_value() : () -> i64
      %9347 = func.call @cc_intern(%9345, %9346) : (i64, i64) -> i64
      %9348 = func.call @cc_nil_value() : () -> i64
      %9349 = func.call @cc_cons(%9347, %9348) : (i64, i64) -> i64
      %9350 = func.call @cc_values_pack(%9349) : (i64) -> i64
      %9351 = func.call @cc_set_symbol_value(%9347, %9333) : (i64, i64) -> i64
      %9352 = llvm.mlir.addressof @str798 : !llvm.ptr
      %9353 = arith.constant 39 : i64
      %9354 = func.call @cc_make_string(%9352, %9353) : (!llvm.ptr, i64) -> i64
      %9355 = func.call @cc_nil_value() : () -> i64
      %9356 = func.call @cc_intern(%9354, %9355) : (i64, i64) -> i64
      %9357 = func.call @cc_nil_value() : () -> i64
      %9358 = func.call @cc_cons(%9356, %9357) : (i64, i64) -> i64
      %9359 = func.call @cc_values_pack(%9358) : (i64) -> i64
      %9360 = func.call @cc_set_symbol_value(%9356, %9333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9327) : (i64) -> ()
      %9492 = arith.constant 97047688511568 : i64
      %9493 = arith.constant 1 : i64
      %9494 = func.call @cc_make_closure(%9492, %9493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9494) : (i64) -> ()
      %9495 = func.call @stack_pop_pointer() : () -> i64
      %9496 = func.call @cc_nil_value() : () -> i64
      %9497 = func.call @cc_errorp(%9495) : (i64) -> i64
      %9498 = arith.cmpi ne, %9497, %9496 : i64
      %9499 = arith.cmpi eq, %9496, %9496 : i64
      %9500 = arith.andi %9498, %9499 : i1
      %9501 = scf.if %9500 -> (i64) {
        scf.yield %9495 : i64
      } else {
        scf.yield %9496 : i64
      }
      %9502 = arith.cmpi ne, %9501, %9496 : i64
      scf.if %9502 {
        func.call @stack_push_pointer(%9501) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9495) : (i64) -> ()
        %9503 = llvm.mlir.addressof @str806 : !llvm.ptr
        %9504 = func.call @cc_make_function_ref_const(%9503) : (!llvm.ptr) -> i64
        %9505 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9504, %9505) : (i64, i64) -> ()
      }
      %9506 = func.call @stack_pop_pointer() : () -> i64
      %9507 = func.call @cc_multiple_value_list(%9506) : (i64) -> i64
      %9508 = llvm.mlir.addressof @str807 : !llvm.ptr
      %9509 = arith.constant 37 : i64
      %9510 = func.call @cc_make_string(%9508, %9509) : (!llvm.ptr, i64) -> i64
      %9511 = func.call @cc_nil_value() : () -> i64
      %9512 = func.call @cc_intern(%9510, %9511) : (i64, i64) -> i64
      %9513 = func.call @cc_nil_value() : () -> i64
      %9514 = func.call @cc_cons(%9512, %9513) : (i64, i64) -> i64
      %9515 = func.call @cc_values_pack(%9514) : (i64) -> i64
      %9516 = func.call @cc_symbol_value(%9512) : (i64) -> i64
      %9517 = llvm.mlir.addressof @str808 : !llvm.ptr
      %9518 = arith.constant 38 : i64
      %9519 = func.call @cc_make_string(%9517, %9518) : (!llvm.ptr, i64) -> i64
      %9520 = func.call @cc_nil_value() : () -> i64
      %9521 = func.call @cc_intern(%9519, %9520) : (i64, i64) -> i64
      %9522 = func.call @cc_nil_value() : () -> i64
      %9523 = func.call @cc_cons(%9521, %9522) : (i64, i64) -> i64
      %9524 = func.call @cc_values_pack(%9523) : (i64) -> i64
      %9525 = func.call @cc_symbol_value(%9521) : (i64) -> i64
      %9526 = llvm.mlir.addressof @str809 : !llvm.ptr
      %9527 = arith.constant 39 : i64
      %9528 = func.call @cc_make_string(%9526, %9527) : (!llvm.ptr, i64) -> i64
      %9529 = func.call @cc_nil_value() : () -> i64
      %9530 = func.call @cc_intern(%9528, %9529) : (i64, i64) -> i64
      %9531 = func.call @cc_nil_value() : () -> i64
      %9532 = func.call @cc_cons(%9530, %9531) : (i64, i64) -> i64
      %9533 = func.call @cc_values_pack(%9532) : (i64) -> i64
      %9534 = func.call @cc_symbol_value(%9530) : (i64) -> i64
      %9535 = func.call @cc_nil_value() : () -> i64
      %9536 = arith.cmpi ne, %9516, %9535 : i64
      %9537 = scf.if %9536 -> (i64) {
        scf.yield %9534 : i64
      } else {
        scf.yield %9507 : i64
      }
      %9538 = func.call @cc_values_pack(%9537) : (i64) -> i64
      func.call @stack_push_pointer(%9538) : (i64) -> ()
      %9539 = func.call @stack_pop_pointer() : () -> i64
      %9540 = func.call @cc_nil_value() : () -> i64
      %9541 = func.call @cc_cons(%9539, %9540) : (i64, i64) -> i64
      %9542 = func.call @cc_not(%9541) : (i64) -> i64
      func.call @stack_push_pointer(%9542) : (i64) -> ()
      %9543 = func.call @stack_pop_pointer() : () -> i64
      %9544 = func.call @cc_nil_value() : () -> i64
      %9545 = func.call @cc_cons(%9543, %9544) : (i64, i64) -> i64
      %9546 = func.call @cc_not(%9545) : (i64) -> i64
      func.call @stack_push_pointer(%9546) : (i64) -> ()
      %9547 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9547 : i64
    }
    func.call @stack_push_pointer(%9332) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511576"() {
    %10028 = func.call @stack_pop_pointer() : () -> i64
    %10029 = func.call @cc_nil_value() : () -> i64
    %10030 = func.call @cc_nil_value() : () -> i64
    %10031 = func.call @cc_errorp(%10029) : (i64) -> i64
    %10032 = arith.cmpi ne, %10031, %10030 : i64
    %10033 = scf.if %10032 -> (i64) {
      scf.yield %10029 : i64
    } else {
      func.call @stack_push_pointer(%10028) : (i64) -> ()
      %10034 = func.call @stack_pop_pointer() : () -> i64
      %10035 = func.call @cc_nil_value() : () -> i64
      %10036 = func.call @cc_errorp(%10034) : (i64) -> i64
      %10037 = arith.cmpi ne, %10036, %10035 : i64
      %10038 = arith.cmpi eq, %10035, %10035 : i64
      %10039 = arith.andi %10037, %10038 : i1
      %10040 = scf.if %10039 -> (i64) {
        scf.yield %10034 : i64
      } else {
        scf.yield %10035 : i64
      }
      %10041 = arith.cmpi ne, %10040, %10035 : i64
      scf.if %10041 {
        func.call @stack_push_pointer(%10040) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10034) : (i64) -> ()
        %10042 = llvm.mlir.addressof @str849 : !llvm.ptr
        %10043 = func.call @cc_make_function_ref_const(%10042) : (!llvm.ptr) -> i64
        %10044 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%10043, %10044) : (i64, i64) -> ()
      }
      %10045 = llvm.mlir.addressof @str850 : !llvm.ptr
      %10046 = arith.constant 32 : i64
      %10047 = func.call @cc_make_string(%10045, %10046) : (!llvm.ptr, i64) -> i64
      %10048 = func.call @cc_nil_value() : () -> i64
      %10049 = func.call @cc_intern(%10047, %10048) : (i64, i64) -> i64
      %10050 = func.call @cc_nil_value() : () -> i64
      %10051 = func.call @cc_cons(%10049, %10050) : (i64, i64) -> i64
      %10052 = func.call @cc_values_pack(%10051) : (i64) -> i64
      func.call @stack_push_pointer(%10049) : (i64) -> ()
      %10053 = func.call @stack_pop_pointer() : () -> i64
      %10054 = func.call @stack_pop_pointer() : () -> i64
      %10055 = func.call @cc_eq(%10054, %10053) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10055) : (i64) -> ()
      %10056 = func.call @stack_pop_pointer() : () -> i64
      %10057 = func.call @cc_nil_value() : () -> i64
      %10058 = arith.cmpi ne, %10056, %10057 : i64
      scf.if %10058 {
        %10059 = func.call @cc_nil_value() : () -> i64
        %10060 = func.call @cc_nil_value() : () -> i64
        %10061 = func.call @cc_errorp(%10059) : (i64) -> i64
        %10062 = arith.cmpi ne, %10061, %10060 : i64
        %10063 = scf.if %10062 -> (i64) {
          scf.yield %10059 : i64
        } else {
          %10064 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%10064) : (i64) -> ()
          %10065 = func.call @stack_pop_pointer() : () -> i64
          %10066 = func.call @cc_multiple_value_list(%10065) : (i64) -> i64
          %10067 = func.call @cc_t_value() : () -> i64
          %10068 = llvm.mlir.addressof @str851 : !llvm.ptr
          %10069 = arith.constant 37 : i64
          %10070 = func.call @cc_make_string(%10068, %10069) : (!llvm.ptr, i64) -> i64
          %10071 = func.call @cc_nil_value() : () -> i64
          %10072 = func.call @cc_intern(%10070, %10071) : (i64, i64) -> i64
          %10073 = func.call @cc_nil_value() : () -> i64
          %10074 = func.call @cc_cons(%10072, %10073) : (i64, i64) -> i64
          %10075 = func.call @cc_values_pack(%10074) : (i64) -> i64
          %10076 = func.call @cc_set_symbol_value(%10072, %10067) : (i64, i64) -> i64
          %10077 = llvm.mlir.addressof @str852 : !llvm.ptr
          %10078 = arith.constant 38 : i64
          %10079 = func.call @cc_make_string(%10077, %10078) : (!llvm.ptr, i64) -> i64
          %10080 = func.call @cc_nil_value() : () -> i64
          %10081 = func.call @cc_intern(%10079, %10080) : (i64, i64) -> i64
          %10082 = func.call @cc_nil_value() : () -> i64
          %10083 = func.call @cc_cons(%10081, %10082) : (i64, i64) -> i64
          %10084 = func.call @cc_values_pack(%10083) : (i64) -> i64
          %10085 = func.call @cc_set_symbol_value(%10081, %10065) : (i64, i64) -> i64
          %10086 = llvm.mlir.addressof @str853 : !llvm.ptr
          %10087 = arith.constant 39 : i64
          %10088 = func.call @cc_make_string(%10086, %10087) : (!llvm.ptr, i64) -> i64
          %10089 = func.call @cc_nil_value() : () -> i64
          %10090 = func.call @cc_intern(%10088, %10089) : (i64, i64) -> i64
          %10091 = func.call @cc_nil_value() : () -> i64
          %10092 = func.call @cc_cons(%10090, %10091) : (i64, i64) -> i64
          %10093 = func.call @cc_values_pack(%10092) : (i64) -> i64
          %10094 = func.call @cc_set_symbol_value(%10090, %10066) : (i64, i64) -> i64
          func.call @stack_push_pointer(%10065) : (i64) -> ()
          %10095 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %10095 : i64
        }
        func.call @stack_push_pointer(%10063) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %10096 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10096 : i64
    }
    func.call @stack_push_pointer(%10033) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511575"() {
    %10015 = func.call @stack_pop_pointer() : () -> i64
    %10016 = func.call @cc_nil_value() : () -> i64
    %10017 = func.call @cc_nil_value() : () -> i64
    %10018 = func.call @cc_errorp(%10016) : (i64) -> i64
    %10019 = arith.cmpi ne, %10018, %10017 : i64
    %10020 = scf.if %10019 -> (i64) {
      scf.yield %10016 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %10021 = func.call @stack_pop_pointer() : () -> i64
      %10022 = func.call @cc_debug_current_stack(%10021) : (i64) -> i64
      %10023 = func.call @cc_nil_value() : () -> i64
      %10024 = func.call @cc_nil_value() : () -> i64
      %10025 = func.call @cc_errorp(%10023) : (i64) -> i64
      %10026 = arith.cmpi ne, %10025, %10024 : i64
      %10027 = scf.if %10026 -> (i64) {
        scf.yield %10023 : i64
      } else {
        %10097 = arith.constant 97047688511576 : i64
        %10098 = arith.constant 0 : i64
        %10099 = func.call @cc_make_closure(%10097, %10098) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10099) : (i64) -> ()
        %10100 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%10022) : (i64) -> ()
        %10101 = func.call @stack_pop_pointer() : () -> i64
        %10102 = func.call @cc_nil_value() : () -> i64
        %10103 = func.call @cc_errorp(%10100) : (i64) -> i64
        %10104 = arith.cmpi ne, %10103, %10102 : i64
        %10105 = arith.cmpi eq, %10102, %10102 : i64
        %10106 = arith.andi %10104, %10105 : i1
        %10107 = scf.if %10106 -> (i64) {
          scf.yield %10100 : i64
        } else {
          scf.yield %10102 : i64
        }
        %10108 = func.call @cc_errorp(%10101) : (i64) -> i64
        %10109 = arith.cmpi ne, %10108, %10102 : i64
        %10110 = arith.cmpi eq, %10107, %10102 : i64
        %10111 = arith.andi %10109, %10110 : i1
        %10112 = scf.if %10111 -> (i64) {
          scf.yield %10101 : i64
        } else {
          scf.yield %10107 : i64
        }
        %10113 = arith.cmpi ne, %10112, %10102 : i64
        scf.if %10113 {
          func.call @stack_push_pointer(%10112) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%10100) : (i64) -> ()
          func.call @stack_push_pointer(%10101) : (i64) -> ()
          %10114 = llvm.mlir.addressof @str854 : !llvm.ptr
          %10115 = func.call @cc_make_function_ref_const(%10114) : (!llvm.ptr) -> i64
          %10116 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%10115, %10116) : (i64, i64) -> ()
        }
        %10117 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10117 : i64
      }
      func.call @stack_push_pointer(%10027) : (i64) -> ()
      %10118 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10118 : i64
    }
    func.call @stack_push_pointer(%10020) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511574"() {
    %10009 = func.call @stack_pop_pointer() : () -> i64
    %10010 = func.call @cc_nil_value() : () -> i64
    %10011 = func.call @cc_nil_value() : () -> i64
    %10012 = func.call @cc_errorp(%10010) : (i64) -> i64
    %10013 = arith.cmpi ne, %10012, %10011 : i64
    %10014 = scf.if %10013 -> (i64) {
      scf.yield %10010 : i64
    } else {
      func.call @stack_push_pointer(%10009) : (i64) -> ()
      %10119 = arith.constant 97047688511575 : i64
      %10120 = arith.constant 1 : i64
      %10121 = func.call @cc_make_closure(%10119, %10120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10121) : (i64) -> ()
      %10122 = func.call @stack_pop_pointer() : () -> i64
      %10123 = func.call @cc_nil_value() : () -> i64
      %10124 = func.call @cc_errorp(%10122) : (i64) -> i64
      %10125 = arith.cmpi ne, %10124, %10123 : i64
      %10126 = arith.cmpi eq, %10123, %10123 : i64
      %10127 = arith.andi %10125, %10126 : i1
      %10128 = scf.if %10127 -> (i64) {
        scf.yield %10122 : i64
      } else {
        scf.yield %10123 : i64
      }
      %10129 = arith.cmpi ne, %10128, %10123 : i64
      scf.if %10129 {
        func.call @stack_push_pointer(%10128) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10122) : (i64) -> ()
        %10130 = llvm.mlir.addressof @str855 : !llvm.ptr
        %10131 = func.call @cc_make_function_ref_const(%10130) : (!llvm.ptr) -> i64
        %10132 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%10131, %10132) : (i64, i64) -> ()
      }
      %10133 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10133 : i64
    }
    func.call @stack_push_pointer(%10014) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511572"() {
    %9975 = func.call @stack_pop_pointer() : () -> i64
    %9976 = func.call @cc_nil_value() : () -> i64
    %9977 = func.call @cc_nil_value() : () -> i64
    %9978 = func.call @cc_errorp(%9976) : (i64) -> i64
    %9979 = arith.cmpi ne, %9978, %9977 : i64
    %9980 = scf.if %9979 -> (i64) {
      scf.yield %9976 : i64
    } else {
      %9981 = func.call @cc_nil_value() : () -> i64
      %9982 = llvm.mlir.addressof @str846 : !llvm.ptr
      %9983 = arith.constant 37 : i64
      %9984 = func.call @cc_make_string(%9982, %9983) : (!llvm.ptr, i64) -> i64
      %9985 = func.call @cc_nil_value() : () -> i64
      %9986 = func.call @cc_intern(%9984, %9985) : (i64, i64) -> i64
      %9987 = func.call @cc_nil_value() : () -> i64
      %9988 = func.call @cc_cons(%9986, %9987) : (i64, i64) -> i64
      %9989 = func.call @cc_values_pack(%9988) : (i64) -> i64
      %9990 = func.call @cc_set_symbol_value(%9986, %9981) : (i64, i64) -> i64
      %9991 = llvm.mlir.addressof @str847 : !llvm.ptr
      %9992 = arith.constant 38 : i64
      %9993 = func.call @cc_make_string(%9991, %9992) : (!llvm.ptr, i64) -> i64
      %9994 = func.call @cc_nil_value() : () -> i64
      %9995 = func.call @cc_intern(%9993, %9994) : (i64, i64) -> i64
      %9996 = func.call @cc_nil_value() : () -> i64
      %9997 = func.call @cc_cons(%9995, %9996) : (i64, i64) -> i64
      %9998 = func.call @cc_values_pack(%9997) : (i64) -> i64
      %9999 = func.call @cc_set_symbol_value(%9995, %9981) : (i64, i64) -> i64
      %10000 = llvm.mlir.addressof @str848 : !llvm.ptr
      %10001 = arith.constant 39 : i64
      %10002 = func.call @cc_make_string(%10000, %10001) : (!llvm.ptr, i64) -> i64
      %10003 = func.call @cc_nil_value() : () -> i64
      %10004 = func.call @cc_intern(%10002, %10003) : (i64, i64) -> i64
      %10005 = func.call @cc_nil_value() : () -> i64
      %10006 = func.call @cc_cons(%10004, %10005) : (i64, i64) -> i64
      %10007 = func.call @cc_values_pack(%10006) : (i64) -> i64
      %10008 = func.call @cc_set_symbol_value(%10004, %9981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9975) : (i64) -> ()
      %10134 = arith.constant 97047688511574 : i64
      %10135 = arith.constant 1 : i64
      %10136 = func.call @cc_make_closure(%10134, %10135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10136) : (i64) -> ()
      %10137 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10138 = func.call @stack_pop_pointer() : () -> i64
      %10139 = func.call @cc_nil_value() : () -> i64
      %10140 = func.call @cc_errorp(%10137) : (i64) -> i64
      %10141 = arith.cmpi ne, %10140, %10139 : i64
      %10142 = arith.cmpi eq, %10139, %10139 : i64
      %10143 = arith.andi %10141, %10142 : i1
      %10144 = scf.if %10143 -> (i64) {
        scf.yield %10137 : i64
      } else {
        scf.yield %10139 : i64
      }
      %10145 = func.call @cc_errorp(%10138) : (i64) -> i64
      %10146 = arith.cmpi ne, %10145, %10139 : i64
      %10147 = arith.cmpi eq, %10144, %10139 : i64
      %10148 = arith.andi %10146, %10147 : i1
      %10149 = scf.if %10148 -> (i64) {
        scf.yield %10138 : i64
      } else {
        scf.yield %10144 : i64
      }
      %10150 = arith.cmpi ne, %10149, %10139 : i64
      scf.if %10150 {
        func.call @stack_push_pointer(%10149) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10137) : (i64) -> ()
        func.call @stack_push_pointer(%10138) : (i64) -> ()
        %10151 = llvm.mlir.addressof @str856 : !llvm.ptr
        %10152 = func.call @cc_make_function_ref_const(%10151) : (!llvm.ptr) -> i64
        %10153 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%10152, %10153) : (i64, i64) -> ()
      }
      %10154 = func.call @stack_pop_pointer() : () -> i64
      %10155 = func.call @cc_multiple_value_list(%10154) : (i64) -> i64
      %10156 = llvm.mlir.addressof @str857 : !llvm.ptr
      %10157 = arith.constant 37 : i64
      %10158 = func.call @cc_make_string(%10156, %10157) : (!llvm.ptr, i64) -> i64
      %10159 = func.call @cc_nil_value() : () -> i64
      %10160 = func.call @cc_intern(%10158, %10159) : (i64, i64) -> i64
      %10161 = func.call @cc_nil_value() : () -> i64
      %10162 = func.call @cc_cons(%10160, %10161) : (i64, i64) -> i64
      %10163 = func.call @cc_values_pack(%10162) : (i64) -> i64
      %10164 = func.call @cc_symbol_value(%10160) : (i64) -> i64
      %10165 = llvm.mlir.addressof @str858 : !llvm.ptr
      %10166 = arith.constant 38 : i64
      %10167 = func.call @cc_make_string(%10165, %10166) : (!llvm.ptr, i64) -> i64
      %10168 = func.call @cc_nil_value() : () -> i64
      %10169 = func.call @cc_intern(%10167, %10168) : (i64, i64) -> i64
      %10170 = func.call @cc_nil_value() : () -> i64
      %10171 = func.call @cc_cons(%10169, %10170) : (i64, i64) -> i64
      %10172 = func.call @cc_values_pack(%10171) : (i64) -> i64
      %10173 = func.call @cc_symbol_value(%10169) : (i64) -> i64
      %10174 = llvm.mlir.addressof @str859 : !llvm.ptr
      %10175 = arith.constant 39 : i64
      %10176 = func.call @cc_make_string(%10174, %10175) : (!llvm.ptr, i64) -> i64
      %10177 = func.call @cc_nil_value() : () -> i64
      %10178 = func.call @cc_intern(%10176, %10177) : (i64, i64) -> i64
      %10179 = func.call @cc_nil_value() : () -> i64
      %10180 = func.call @cc_cons(%10178, %10179) : (i64, i64) -> i64
      %10181 = func.call @cc_values_pack(%10180) : (i64) -> i64
      %10182 = func.call @cc_symbol_value(%10178) : (i64) -> i64
      %10183 = func.call @cc_nil_value() : () -> i64
      %10184 = arith.cmpi ne, %10164, %10183 : i64
      %10185 = scf.if %10184 -> (i64) {
        scf.yield %10182 : i64
      } else {
        scf.yield %10155 : i64
      }
      %10186 = func.call @cc_values_pack(%10185) : (i64) -> i64
      func.call @stack_push_pointer(%10186) : (i64) -> ()
      %10187 = func.call @stack_pop_pointer() : () -> i64
      %10188 = func.call @cc_nil_value() : () -> i64
      %10189 = func.call @cc_cons(%10187, %10188) : (i64, i64) -> i64
      %10190 = func.call @cc_not(%10189) : (i64) -> i64
      func.call @stack_push_pointer(%10190) : (i64) -> ()
      %10191 = func.call @stack_pop_pointer() : () -> i64
      %10192 = func.call @cc_nil_value() : () -> i64
      %10193 = func.call @cc_cons(%10191, %10192) : (i64, i64) -> i64
      %10194 = func.call @cc_not(%10193) : (i64) -> i64
      func.call @stack_push_pointer(%10194) : (i64) -> ()
      %10195 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10195 : i64
    }
    func.call @stack_push_pointer(%9980) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511579"() {
    %10495 = func.call @stack_pop_pointer() : () -> i64
    %10496 = func.call @cc_nil_value() : () -> i64
    %10497 = func.call @cc_nil_value() : () -> i64
    %10498 = func.call @cc_errorp(%10496) : (i64) -> i64
    %10499 = arith.cmpi ne, %10498, %10497 : i64
    %10500 = scf.if %10499 -> (i64) {
      scf.yield %10496 : i64
    } else {
      %10501 = func.call @cc_nil_value() : () -> i64
      %10502 = arith.cmpi ne, %10501, %10501 : i64
      scf.if %10502 {
        func.call @stack_push_pointer(%10501) : (i64) -> ()
      } else {
        %10503 = llvm.mlir.addressof @str890 : !llvm.ptr
        %10504 = func.call @cc_make_function_ref_const(%10503) : (!llvm.ptr) -> i64
        %10505 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%10504, %10505) : (i64, i64) -> ()
      }
      %10506 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10506 : i64
    }
    %10507 = func.call @cc_nil_value() : () -> i64
    %10508 = func.call @cc_errorp(%10500) : (i64) -> i64
    %10509 = arith.cmpi ne, %10508, %10507 : i64
    %10510 = scf.if %10509 -> (i64) {
      scf.yield %10500 : i64
    } else {
      func.call @stack_push_pointer(%10495) : (i64) -> ()
      %10511 = func.call @stack_pop_pointer() : () -> i64
      %10512 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%10511, %10512) : (i64, i64) -> ()
      %10513 = func.call @stack_pop_pointer() : () -> i64
      %10514 = func.call @cc_multiple_value_list(%10513) : (i64) -> i64
      %10515 = func.call @cc_nil_value() : () -> i64
      %10516 = arith.cmpi ne, %10515, %10515 : i64
      scf.if %10516 {
        func.call @stack_push_pointer(%10515) : (i64) -> ()
      } else {
        %10517 = llvm.mlir.addressof @str891 : !llvm.ptr
        %10518 = func.call @cc_make_function_ref_const(%10517) : (!llvm.ptr) -> i64
        %10519 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%10518, %10519) : (i64, i64) -> ()
      }
      %10520 = func.call @stack_depth() : () -> i64
      %10521 = arith.constant 0 : i64
      %10522 = arith.cmpi sgt, %10520, %10521 : i64
      scf.if %10522 {
        %10523 = func.call @stack_pop_pointer() : () -> i64
      }
      %10524 = func.call @cc_values_pack(%10514) : (i64) -> i64
      func.call @stack_push_pointer(%10524) : (i64) -> ()
      %10525 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10525 : i64
    }
    func.call @stack_push_pointer(%10510) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511578"() {
    %10490 = func.call @cc_nil_value() : () -> i64
    %10491 = func.call @cc_nil_value() : () -> i64
    %10492 = func.call @cc_errorp(%10490) : (i64) -> i64
    %10493 = arith.cmpi ne, %10492, %10491 : i64
    %10494 = scf.if %10493 -> (i64) {
      scf.yield %10490 : i64
    } else {
      func.call @cc_clear_multiple_values() : () -> ()
      %10526 = arith.constant 97047688511579 : i64
      %10527 = arith.constant 0 : i64
      %10528 = func.call @cc_make_closure(%10526, %10527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10528) : (i64) -> ()
      %10529 = func.call @stack_pop_pointer() : () -> i64
      %10530 = func.call @cc_nil_value() : () -> i64
      %10531 = func.call @cc_cons(%10530, %10530) : (i64, i64) -> i64
      %10532 = func.call @cc_cons(%10530, %10531) : (i64, i64) -> i64
      %10533 = func.call @cc_cons(%10529, %10532) : (i64, i64) -> i64
      %10534 = func.call @cc_values_pack(%10533) : (i64) -> i64
      func.call @stack_push_pointer(%10534) : (i64) -> ()
      %10535 = func.call @stack_pop_pointer() : () -> i64
      %10536 = func.call @cc_errorp(%10535) : (i64) -> i64
      %10537 = func.call @cc_nil_value() : () -> i64
      %10538 = arith.cmpi ne, %10536, %10537 : i64
      scf.if %10538 {
        func.call @stack_push_pointer(%10535) : (i64) -> ()
      } else {
        %10539 = func.call @cc_multiple_value_list(%10535) : (i64) -> i64
        func.call @stack_push_pointer(%10539) : (i64) -> ()
      }
      %10540 = func.call @stack_pop_pointer() : () -> i64
      %10541 = func.call @cc_cdr(%10540) : (i64) -> i64
      func.call @stack_push_pointer(%10541) : (i64) -> ()
      %10542 = func.call @stack_pop_pointer() : () -> i64
      %10543 = func.call @cc_values_pack(%10542) : (i64) -> i64
      func.call @stack_push_pointer(%10543) : (i64) -> ()
      %10544 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10544 : i64
    }
    func.call @stack_push_pointer(%10494) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511582"() {
    %10950 = func.call @stack_pop_pointer() : () -> i64
    %10951 = func.call @stack_pop_pointer() : () -> i64
    %10952 = func.call @cc_nil_value() : () -> i64
    %10953 = func.call @cc_nil_value() : () -> i64
    %10954 = func.call @cc_errorp(%10952) : (i64) -> i64
    %10955 = arith.cmpi ne, %10954, %10953 : i64
    %10956 = scf.if %10955 -> (i64) {
      scf.yield %10952 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %10957 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10957 : i64
    }
    %10958 = func.call @cc_nil_value() : () -> i64
    %10959 = func.call @cc_errorp(%10956) : (i64) -> i64
    %10960 = arith.cmpi ne, %10959, %10958 : i64
    %10961 = scf.if %10960 -> (i64) {
      scf.yield %10956 : i64
    } else {
      func.call @stack_push_pointer(%10951) : (i64) -> ()
      %10962 = llvm.mlir.addressof @str930 : !llvm.ptr
      %10963 = arith.constant 9 : i64
      %10964 = func.call @cc_make_string(%10962, %10963) : (!llvm.ptr, i64) -> i64
      %10965 = llvm.mlir.addressof @str931 : !llvm.ptr
      %10966 = arith.constant 11 : i64
      %10967 = func.call @cc_make_string(%10965, %10966) : (!llvm.ptr, i64) -> i64
      %10968 = func.call @cc_intern(%10964, %10967) : (i64, i64) -> i64
      %10969 = func.call @cc_nil_value() : () -> i64
      %10970 = func.call @cc_cons(%10968, %10969) : (i64, i64) -> i64
      %10971 = func.call @cc_values_pack(%10970) : (i64) -> i64
      func.call @stack_push_pointer(%10968) : (i64) -> ()
      %10972 = func.call @stack_pop_pointer() : () -> i64
      %10973 = func.call @stack_pop_pointer() : () -> i64
      %10974 = func.call @cc_typep(%10973, %10972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10974) : (i64) -> ()
      %10975 = func.call @stack_pop_pointer() : () -> i64
      %10976 = func.call @cc_multiple_value_list(%10975) : (i64) -> i64
      %10977 = func.call @cc_t_value() : () -> i64
      %10978 = llvm.mlir.addressof @str932 : !llvm.ptr
      %10979 = arith.constant 37 : i64
      %10980 = func.call @cc_make_string(%10978, %10979) : (!llvm.ptr, i64) -> i64
      %10981 = func.call @cc_nil_value() : () -> i64
      %10982 = func.call @cc_intern(%10980, %10981) : (i64, i64) -> i64
      %10983 = func.call @cc_nil_value() : () -> i64
      %10984 = func.call @cc_cons(%10982, %10983) : (i64, i64) -> i64
      %10985 = func.call @cc_values_pack(%10984) : (i64) -> i64
      %10986 = func.call @cc_set_symbol_value(%10982, %10977) : (i64, i64) -> i64
      %10987 = llvm.mlir.addressof @str933 : !llvm.ptr
      %10988 = arith.constant 38 : i64
      %10989 = func.call @cc_make_string(%10987, %10988) : (!llvm.ptr, i64) -> i64
      %10990 = func.call @cc_nil_value() : () -> i64
      %10991 = func.call @cc_intern(%10989, %10990) : (i64, i64) -> i64
      %10992 = func.call @cc_nil_value() : () -> i64
      %10993 = func.call @cc_cons(%10991, %10992) : (i64, i64) -> i64
      %10994 = func.call @cc_values_pack(%10993) : (i64) -> i64
      %10995 = func.call @cc_set_symbol_value(%10991, %10975) : (i64, i64) -> i64
      %10996 = llvm.mlir.addressof @str934 : !llvm.ptr
      %10997 = arith.constant 39 : i64
      %10998 = func.call @cc_make_string(%10996, %10997) : (!llvm.ptr, i64) -> i64
      %10999 = func.call @cc_nil_value() : () -> i64
      %11000 = func.call @cc_intern(%10998, %10999) : (i64, i64) -> i64
      %11001 = func.call @cc_nil_value() : () -> i64
      %11002 = func.call @cc_cons(%11000, %11001) : (i64, i64) -> i64
      %11003 = func.call @cc_values_pack(%11002) : (i64) -> i64
      %11004 = func.call @cc_set_symbol_value(%11000, %10976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10975) : (i64) -> ()
      %11005 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11005 : i64
    }
    func.call @stack_push_pointer(%10961) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511580"() {
    %10917 = func.call @cc_nil_value() : () -> i64
    %10918 = func.call @cc_nil_value() : () -> i64
    %10919 = func.call @cc_errorp(%10917) : (i64) -> i64
    %10920 = arith.cmpi ne, %10919, %10918 : i64
    %10921 = scf.if %10920 -> (i64) {
      scf.yield %10917 : i64
    } else {
      %10922 = func.call @cc_nil_value() : () -> i64
      %10923 = llvm.mlir.addressof @str927 : !llvm.ptr
      %10924 = arith.constant 37 : i64
      %10925 = func.call @cc_make_string(%10923, %10924) : (!llvm.ptr, i64) -> i64
      %10926 = func.call @cc_nil_value() : () -> i64
      %10927 = func.call @cc_intern(%10925, %10926) : (i64, i64) -> i64
      %10928 = func.call @cc_nil_value() : () -> i64
      %10929 = func.call @cc_cons(%10927, %10928) : (i64, i64) -> i64
      %10930 = func.call @cc_values_pack(%10929) : (i64) -> i64
      %10931 = func.call @cc_set_symbol_value(%10927, %10922) : (i64, i64) -> i64
      %10932 = llvm.mlir.addressof @str928 : !llvm.ptr
      %10933 = arith.constant 38 : i64
      %10934 = func.call @cc_make_string(%10932, %10933) : (!llvm.ptr, i64) -> i64
      %10935 = func.call @cc_nil_value() : () -> i64
      %10936 = func.call @cc_intern(%10934, %10935) : (i64, i64) -> i64
      %10937 = func.call @cc_nil_value() : () -> i64
      %10938 = func.call @cc_cons(%10936, %10937) : (i64, i64) -> i64
      %10939 = func.call @cc_values_pack(%10938) : (i64) -> i64
      %10940 = func.call @cc_set_symbol_value(%10936, %10922) : (i64, i64) -> i64
      %10941 = llvm.mlir.addressof @str929 : !llvm.ptr
      %10942 = arith.constant 39 : i64
      %10943 = func.call @cc_make_string(%10941, %10942) : (!llvm.ptr, i64) -> i64
      %10944 = func.call @cc_nil_value() : () -> i64
      %10945 = func.call @cc_intern(%10943, %10944) : (i64, i64) -> i64
      %10946 = func.call @cc_nil_value() : () -> i64
      %10947 = func.call @cc_cons(%10945, %10946) : (i64, i64) -> i64
      %10948 = func.call @cc_values_pack(%10947) : (i64) -> i64
      %10949 = func.call @cc_set_symbol_value(%10945, %10922) : (i64, i64) -> i64
      %11006 = arith.constant 97047688511582 : i64
      %11007 = arith.constant 0 : i64
      %11008 = func.call @cc_make_closure(%11006, %11007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11008) : (i64) -> ()
      %11009 = func.call @stack_pop_pointer() : () -> i64
      %11010 = llvm.mlir.addressof @str935 : !llvm.ptr
      %11011 = arith.constant 26 : i64
      %11012 = func.call @cc_make_symbol(%11010, %11011) : (!llvm.ptr, i64) -> i64
      %11013 = func.call @cc_symbol_value(%11012) : (i64) -> i64
      %11014 = func.call @cc_set_symbol_value(%11012, %11009) : (i64, i64) -> i64
      %11015 = func.call @cc_nil_value() : () -> i64
      %11016 = func.call @cc_nil_value() : () -> i64
      %11017 = func.call @cc_errorp(%11015) : (i64) -> i64
      %11018 = arith.cmpi ne, %11017, %11016 : i64
      %11019 = scf.if %11018 -> (i64) {
        scf.yield %11015 : i64
      } else {
        %11020 = arith.constant 4 : i64
        func.call @stack_push_fixnum(%11020) : (i64) -> ()
        %11021 = func.call @stack_pop_pointer() : () -> i64
        %11022 = func.call @cc_nil_value() : () -> i64
        %11023 = func.call @cc_errorp(%11021) : (i64) -> i64
        %11024 = arith.cmpi ne, %11023, %11022 : i64
        %11025 = arith.cmpi eq, %11022, %11022 : i64
        %11026 = arith.andi %11024, %11025 : i1
        %11027 = scf.if %11026 -> (i64) {
          scf.yield %11021 : i64
        } else {
          scf.yield %11022 : i64
        }
        %11028 = arith.cmpi ne, %11027, %11022 : i64
        scf.if %11028 {
          func.call @stack_push_pointer(%11027) : (i64) -> ()
        } else {
          %11029 = func.call @cc_nil_value() : () -> i64
          %11030 = func.call @cc_cons(%11021, %11029) : (i64, i64) -> i64
          func.call @stack_push_pointer(%11030) : (i64) -> ()
          func.call @cc_print_stack() : () -> ()
        }
        %11031 = func.call @stack_pop_pointer() : () -> i64
        %11032 = func.call @cc_nil_value() : () -> i64
        %11033 = func.call @cc_errorp(%11031) : (i64) -> i64
        %11034 = arith.cmpi ne, %11033, %11032 : i64
        %11035 = arith.cmpi eq, %11032, %11032 : i64
        %11036 = arith.andi %11034, %11035 : i1
        %11037 = scf.if %11036 -> (i64) {
          scf.yield %11031 : i64
        } else {
          scf.yield %11032 : i64
        }
        %11038 = arith.cmpi ne, %11037, %11032 : i64
        scf.if %11038 {
          func.call @stack_push_pointer(%11037) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%11031) : (i64) -> ()
          %11039 = llvm.mlir.addressof @str936 : !llvm.ptr
          %11040 = func.call @cc_make_function_ref_const(%11039) : (!llvm.ptr) -> i64
          %11041 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%11040, %11041) : (i64, i64) -> ()
        }
        %11042 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11042 : i64
      }
      func.call @stack_push_pointer(%11019) : (i64) -> ()
      %11043 = func.call @cc_restore_symbol_value(%11012, %11013) : (i64, i64) -> i64
      %11044 = func.call @stack_pop_pointer() : () -> i64
      %11045 = func.call @cc_multiple_value_list(%11044) : (i64) -> i64
      %11046 = llvm.mlir.addressof @str937 : !llvm.ptr
      %11047 = arith.constant 37 : i64
      %11048 = func.call @cc_make_string(%11046, %11047) : (!llvm.ptr, i64) -> i64
      %11049 = func.call @cc_nil_value() : () -> i64
      %11050 = func.call @cc_intern(%11048, %11049) : (i64, i64) -> i64
      %11051 = func.call @cc_nil_value() : () -> i64
      %11052 = func.call @cc_cons(%11050, %11051) : (i64, i64) -> i64
      %11053 = func.call @cc_values_pack(%11052) : (i64) -> i64
      %11054 = func.call @cc_symbol_value(%11050) : (i64) -> i64
      %11055 = llvm.mlir.addressof @str938 : !llvm.ptr
      %11056 = arith.constant 38 : i64
      %11057 = func.call @cc_make_string(%11055, %11056) : (!llvm.ptr, i64) -> i64
      %11058 = func.call @cc_nil_value() : () -> i64
      %11059 = func.call @cc_intern(%11057, %11058) : (i64, i64) -> i64
      %11060 = func.call @cc_nil_value() : () -> i64
      %11061 = func.call @cc_cons(%11059, %11060) : (i64, i64) -> i64
      %11062 = func.call @cc_values_pack(%11061) : (i64) -> i64
      %11063 = func.call @cc_symbol_value(%11059) : (i64) -> i64
      %11064 = llvm.mlir.addressof @str939 : !llvm.ptr
      %11065 = arith.constant 39 : i64
      %11066 = func.call @cc_make_string(%11064, %11065) : (!llvm.ptr, i64) -> i64
      %11067 = func.call @cc_nil_value() : () -> i64
      %11068 = func.call @cc_intern(%11066, %11067) : (i64, i64) -> i64
      %11069 = func.call @cc_nil_value() : () -> i64
      %11070 = func.call @cc_cons(%11068, %11069) : (i64, i64) -> i64
      %11071 = func.call @cc_values_pack(%11070) : (i64) -> i64
      %11072 = func.call @cc_symbol_value(%11068) : (i64) -> i64
      %11073 = func.call @cc_nil_value() : () -> i64
      %11074 = arith.cmpi ne, %11054, %11073 : i64
      %11075 = scf.if %11074 -> (i64) {
        scf.yield %11072 : i64
      } else {
        scf.yield %11045 : i64
      }
      %11076 = func.call @cc_values_pack(%11075) : (i64) -> i64
      func.call @stack_push_pointer(%11076) : (i64) -> ()
      %11077 = func.call @stack_pop_pointer() : () -> i64
      %11078 = func.call @cc_nil_value() : () -> i64
      %11079 = func.call @cc_cons(%11077, %11078) : (i64, i64) -> i64
      %11080 = func.call @cc_not(%11079) : (i64) -> i64
      func.call @stack_push_pointer(%11080) : (i64) -> ()
      %11081 = func.call @stack_pop_pointer() : () -> i64
      %11082 = func.call @cc_nil_value() : () -> i64
      %11083 = func.call @cc_cons(%11081, %11082) : (i64, i64) -> i64
      %11084 = func.call @cc_not(%11083) : (i64) -> i64
      func.call @stack_push_pointer(%11084) : (i64) -> ()
      %11085 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11085 : i64
    }
    func.call @stack_push_pointer(%10921) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511583"() {
    %11299 = func.call @cc_nil_value() : () -> i64
    %11300 = func.call @cc_nil_value() : () -> i64
    %11301 = func.call @cc_errorp(%11299) : (i64) -> i64
    %11302 = arith.cmpi ne, %11301, %11300 : i64
    %11303 = scf.if %11302 -> (i64) {
      scf.yield %11299 : i64
    } else {
      %11304 = func.call @cc_nil_value() : () -> i64
      %11305 = func.call @cc_nil_value() : () -> i64
      %11306 = func.call @cc_errorp(%11304) : (i64) -> i64
      %11307 = arith.cmpi ne, %11306, %11305 : i64
      %11308 = scf.if %11307 -> (i64) {
        scf.yield %11304 : i64
      } else {
        %11309 = func.call @cc_nil_value() : () -> i64
        %11310 = arith.cmpi ne, %11309, %11309 : i64
        scf.if %11310 {
          func.call @stack_push_pointer(%11309) : (i64) -> ()
        } else {
          %11311 = llvm.mlir.addressof @str960 : !llvm.ptr
          %11312 = func.call @cc_make_function_ref_const(%11311) : (!llvm.ptr) -> i64
          %11313 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11312, %11313) : (i64, i64) -> ()
        }
        %11314 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11314 : i64
      }
      %11315 = func.call @cc_nil_value() : () -> i64
      %11316 = func.call @cc_errorp(%11308) : (i64) -> i64
      %11317 = arith.cmpi ne, %11316, %11315 : i64
      %11318 = scf.if %11317 -> (i64) {
        scf.yield %11308 : i64
      } else {
        %11319 = func.call @cc_nil_value() : () -> i64
        %11320 = arith.cmpi ne, %11319, %11319 : i64
        scf.if %11320 {
          func.call @stack_push_pointer(%11319) : (i64) -> ()
        } else {
          %11321 = llvm.mlir.addressof @str961 : !llvm.ptr
          %11322 = func.call @cc_make_function_ref_const(%11321) : (!llvm.ptr) -> i64
          %11323 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11322, %11323) : (i64, i64) -> ()
        }
        %11324 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11324 : i64
      }
      func.call @stack_push_pointer(%11318) : (i64) -> ()
      %11325 = func.call @stack_pop_pointer() : () -> i64
      %11326 = func.call @cc_nil_value() : () -> i64
      %11327 = func.call @cc_nil_value() : () -> i64
      %11328 = func.call @cc_errorp(%11326) : (i64) -> i64
      %11329 = arith.cmpi ne, %11328, %11327 : i64
      %11330 = scf.if %11329 -> (i64) {
        scf.yield %11326 : i64
      } else {
        %11331 = func.call @cc_nil_value() : () -> i64
        %11332 = arith.cmpi ne, %11331, %11331 : i64
        scf.if %11332 {
          func.call @stack_push_pointer(%11331) : (i64) -> ()
        } else {
          %11333 = llvm.mlir.addressof @str962 : !llvm.ptr
          %11334 = func.call @cc_make_function_ref_const(%11333) : (!llvm.ptr) -> i64
          %11335 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11334, %11335) : (i64, i64) -> ()
        }
        %11336 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11336 : i64
      }
      %11337 = func.call @cc_nil_value() : () -> i64
      %11338 = func.call @cc_errorp(%11330) : (i64) -> i64
      %11339 = arith.cmpi ne, %11338, %11337 : i64
      %11340 = scf.if %11339 -> (i64) {
        scf.yield %11330 : i64
      } else {
        %11341 = func.call @cc_nil_value() : () -> i64
        %11342 = arith.cmpi ne, %11341, %11341 : i64
        scf.if %11342 {
          func.call @stack_push_pointer(%11341) : (i64) -> ()
        } else {
          %11343 = llvm.mlir.addressof @str963 : !llvm.ptr
          %11344 = func.call @cc_make_function_ref_const(%11343) : (!llvm.ptr) -> i64
          %11345 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11344, %11345) : (i64, i64) -> ()
        }
        %11346 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11346 : i64
      }
      func.call @stack_push_pointer(%11340) : (i64) -> ()
      %11347 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %11348 = func.call @stack_pop_pointer() : () -> i64
      %11349 = func.call @cc_cons(%11347, %11348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11349) : (i64) -> ()
      %11350 = func.call @stack_pop_pointer() : () -> i64
      %11351 = func.call @cc_cons(%11325, %11350) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11351) : (i64) -> ()
      %11352 = func.call @stack_pop_pointer() : () -> i64
      %11353 = func.call @cc_values_pack(%11352) : (i64) -> i64
      func.call @stack_push_pointer(%11353) : (i64) -> ()
      %11354 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11354 : i64
    }
    func.call @stack_push_pointer(%11303) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511586"() {
    %11852 = func.call @stack_pop_pointer() : () -> i64
    %11853 = func.call @stack_pop_pointer() : () -> i64
    %11854 = func.call @cc_nil_value() : () -> i64
    %11855 = func.call @cc_nil_value() : () -> i64
    %11856 = func.call @cc_errorp(%11854) : (i64) -> i64
    %11857 = arith.cmpi ne, %11856, %11855 : i64
    %11858 = scf.if %11857 -> (i64) {
      scf.yield %11854 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %11859 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11859 : i64
    }
    %11860 = func.call @cc_nil_value() : () -> i64
    %11861 = func.call @cc_errorp(%11858) : (i64) -> i64
    %11862 = arith.cmpi ne, %11861, %11860 : i64
    %11863 = scf.if %11862 -> (i64) {
      scf.yield %11858 : i64
    } else {
      func.call @stack_push_pointer(%11853) : (i64) -> ()
      %11864 = llvm.mlir.addressof @str1013 : !llvm.ptr
      %11865 = arith.constant 9 : i64
      %11866 = func.call @cc_make_string(%11864, %11865) : (!llvm.ptr, i64) -> i64
      %11867 = llvm.mlir.addressof @str1014 : !llvm.ptr
      %11868 = arith.constant 11 : i64
      %11869 = func.call @cc_make_string(%11867, %11868) : (!llvm.ptr, i64) -> i64
      %11870 = func.call @cc_intern(%11866, %11869) : (i64, i64) -> i64
      %11871 = func.call @cc_nil_value() : () -> i64
      %11872 = func.call @cc_cons(%11870, %11871) : (i64, i64) -> i64
      %11873 = func.call @cc_values_pack(%11872) : (i64) -> i64
      func.call @stack_push_pointer(%11870) : (i64) -> ()
      %11874 = func.call @stack_pop_pointer() : () -> i64
      %11875 = func.call @stack_pop_pointer() : () -> i64
      %11876 = func.call @cc_typep(%11875, %11874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11876) : (i64) -> ()
      %11877 = func.call @stack_pop_pointer() : () -> i64
      %11878 = func.call @cc_multiple_value_list(%11877) : (i64) -> i64
      %11879 = func.call @cc_t_value() : () -> i64
      %11880 = llvm.mlir.addressof @str1015 : !llvm.ptr
      %11881 = arith.constant 37 : i64
      %11882 = func.call @cc_make_string(%11880, %11881) : (!llvm.ptr, i64) -> i64
      %11883 = func.call @cc_nil_value() : () -> i64
      %11884 = func.call @cc_intern(%11882, %11883) : (i64, i64) -> i64
      %11885 = func.call @cc_nil_value() : () -> i64
      %11886 = func.call @cc_cons(%11884, %11885) : (i64, i64) -> i64
      %11887 = func.call @cc_values_pack(%11886) : (i64) -> i64
      %11888 = func.call @cc_set_symbol_value(%11884, %11879) : (i64, i64) -> i64
      %11889 = llvm.mlir.addressof @str1016 : !llvm.ptr
      %11890 = arith.constant 38 : i64
      %11891 = func.call @cc_make_string(%11889, %11890) : (!llvm.ptr, i64) -> i64
      %11892 = func.call @cc_nil_value() : () -> i64
      %11893 = func.call @cc_intern(%11891, %11892) : (i64, i64) -> i64
      %11894 = func.call @cc_nil_value() : () -> i64
      %11895 = func.call @cc_cons(%11893, %11894) : (i64, i64) -> i64
      %11896 = func.call @cc_values_pack(%11895) : (i64) -> i64
      %11897 = func.call @cc_set_symbol_value(%11893, %11877) : (i64, i64) -> i64
      %11898 = llvm.mlir.addressof @str1017 : !llvm.ptr
      %11899 = arith.constant 39 : i64
      %11900 = func.call @cc_make_string(%11898, %11899) : (!llvm.ptr, i64) -> i64
      %11901 = func.call @cc_nil_value() : () -> i64
      %11902 = func.call @cc_intern(%11900, %11901) : (i64, i64) -> i64
      %11903 = func.call @cc_nil_value() : () -> i64
      %11904 = func.call @cc_cons(%11902, %11903) : (i64, i64) -> i64
      %11905 = func.call @cc_values_pack(%11904) : (i64) -> i64
      %11906 = func.call @cc_set_symbol_value(%11902, %11878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11877) : (i64) -> ()
      %11907 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11907 : i64
    }
    func.call @stack_push_pointer(%11863) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_97047688511584"() {
    %11819 = func.call @cc_nil_value() : () -> i64
    %11820 = func.call @cc_nil_value() : () -> i64
    %11821 = func.call @cc_errorp(%11819) : (i64) -> i64
    %11822 = arith.cmpi ne, %11821, %11820 : i64
    %11823 = scf.if %11822 -> (i64) {
      scf.yield %11819 : i64
    } else {
      %11824 = func.call @cc_nil_value() : () -> i64
      %11825 = llvm.mlir.addressof @str1010 : !llvm.ptr
      %11826 = arith.constant 37 : i64
      %11827 = func.call @cc_make_string(%11825, %11826) : (!llvm.ptr, i64) -> i64
      %11828 = func.call @cc_nil_value() : () -> i64
      %11829 = func.call @cc_intern(%11827, %11828) : (i64, i64) -> i64
      %11830 = func.call @cc_nil_value() : () -> i64
      %11831 = func.call @cc_cons(%11829, %11830) : (i64, i64) -> i64
      %11832 = func.call @cc_values_pack(%11831) : (i64) -> i64
      %11833 = func.call @cc_set_symbol_value(%11829, %11824) : (i64, i64) -> i64
      %11834 = llvm.mlir.addressof @str1011 : !llvm.ptr
      %11835 = arith.constant 38 : i64
      %11836 = func.call @cc_make_string(%11834, %11835) : (!llvm.ptr, i64) -> i64
      %11837 = func.call @cc_nil_value() : () -> i64
      %11838 = func.call @cc_intern(%11836, %11837) : (i64, i64) -> i64
      %11839 = func.call @cc_nil_value() : () -> i64
      %11840 = func.call @cc_cons(%11838, %11839) : (i64, i64) -> i64
      %11841 = func.call @cc_values_pack(%11840) : (i64) -> i64
      %11842 = func.call @cc_set_symbol_value(%11838, %11824) : (i64, i64) -> i64
      %11843 = llvm.mlir.addressof @str1012 : !llvm.ptr
      %11844 = arith.constant 39 : i64
      %11845 = func.call @cc_make_string(%11843, %11844) : (!llvm.ptr, i64) -> i64
      %11846 = func.call @cc_nil_value() : () -> i64
      %11847 = func.call @cc_intern(%11845, %11846) : (i64, i64) -> i64
      %11848 = func.call @cc_nil_value() : () -> i64
      %11849 = func.call @cc_cons(%11847, %11848) : (i64, i64) -> i64
      %11850 = func.call @cc_values_pack(%11849) : (i64) -> i64
      %11851 = func.call @cc_set_symbol_value(%11847, %11824) : (i64, i64) -> i64
      %11908 = arith.constant 97047688511586 : i64
      %11909 = arith.constant 0 : i64
      %11910 = func.call @cc_make_closure(%11908, %11909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11910) : (i64) -> ()
      %11911 = func.call @stack_pop_pointer() : () -> i64
      %11912 = llvm.mlir.addressof @str1018 : !llvm.ptr
      %11913 = arith.constant 26 : i64
      %11914 = func.call @cc_make_symbol(%11912, %11913) : (!llvm.ptr, i64) -> i64
      %11915 = func.call @cc_symbol_value(%11914) : (i64) -> i64
      %11916 = func.call @cc_set_symbol_value(%11914, %11911) : (i64, i64) -> i64
      %11917 = func.call @cc_nil_value() : () -> i64
      %11918 = func.call @cc_nil_value() : () -> i64
      %11919 = func.call @cc_errorp(%11917) : (i64) -> i64
      %11920 = arith.cmpi ne, %11919, %11918 : i64
      %11921 = scf.if %11920 -> (i64) {
        scf.yield %11917 : i64
      } else {
        %11922 = func.call @cc_nil_value() : () -> i64
        %11923 = arith.cmpi ne, %11922, %11922 : i64
        scf.if %11923 {
          func.call @stack_push_pointer(%11922) : (i64) -> ()
        } else {
          %11924 = llvm.mlir.addressof @str1019 : !llvm.ptr
          %11925 = func.call @cc_make_function_ref_const(%11924) : (!llvm.ptr) -> i64
          %11926 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11925, %11926) : (i64, i64) -> ()
        }
        %11927 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11927 : i64
      }
      %11928 = func.call @cc_nil_value() : () -> i64
      %11929 = func.call @cc_errorp(%11921) : (i64) -> i64
      %11930 = arith.cmpi ne, %11929, %11928 : i64
      %11931 = scf.if %11930 -> (i64) {
        scf.yield %11921 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %11932 = func.call @stack_pop_pointer() : () -> i64
        %11933 = func.call @cc_nil_value() : () -> i64
        %11934 = func.call @cc_errorp(%11932) : (i64) -> i64
        %11935 = arith.cmpi ne, %11934, %11933 : i64
        %11936 = scf.if %11935 -> (i64) {
          scf.yield %11932 : i64
        } else {
          %11937 = arith.constant 4 : i64
          func.call @stack_push_fixnum(%11937) : (i64) -> ()
          %11938 = func.call @stack_pop_pointer() : () -> i64
          %11939 = func.call @cc_nil_value() : () -> i64
          %11940 = func.call @cc_errorp(%11938) : (i64) -> i64
          %11941 = arith.cmpi ne, %11940, %11939 : i64
          %11942 = arith.cmpi eq, %11939, %11939 : i64
          %11943 = arith.andi %11941, %11942 : i1
          %11944 = scf.if %11943 -> (i64) {
            scf.yield %11938 : i64
          } else {
            scf.yield %11939 : i64
          }
          %11945 = arith.cmpi ne, %11944, %11939 : i64
          scf.if %11945 {
            func.call @stack_push_pointer(%11944) : (i64) -> ()
          } else {
            %11946 = func.call @cc_nil_value() : () -> i64
            %11947 = func.call @cc_cons(%11938, %11946) : (i64, i64) -> i64
            func.call @stack_push_pointer(%11947) : (i64) -> ()
            func.call @cc_print_stack() : () -> ()
          }
          %11948 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %11948 : i64
        }
        func.call @stack_push_pointer(%11936) : (i64) -> ()
        %11949 = func.call @stack_pop_pointer() : () -> i64
        %11950 = func.call @cc_multiple_value_list(%11949) : (i64) -> i64
        %11951 = func.call @cc_nil_value() : () -> i64
        %11952 = arith.cmpi ne, %11951, %11951 : i64
        scf.if %11952 {
          func.call @stack_push_pointer(%11951) : (i64) -> ()
        } else {
          %11953 = llvm.mlir.addressof @str1020 : !llvm.ptr
          %11954 = func.call @cc_make_function_ref_const(%11953) : (!llvm.ptr) -> i64
          %11955 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%11954, %11955) : (i64, i64) -> ()
        }
        %11956 = func.call @stack_depth() : () -> i64
        %11957 = arith.constant 0 : i64
        %11958 = arith.cmpi sgt, %11956, %11957 : i64
        scf.if %11958 {
          %11959 = func.call @stack_pop_pointer() : () -> i64
        }
        %11960 = func.call @cc_values_pack(%11950) : (i64) -> i64
        func.call @stack_push_pointer(%11960) : (i64) -> ()
        %11961 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %11961 : i64
      }
      func.call @stack_push_pointer(%11931) : (i64) -> ()
      %11962 = func.call @cc_restore_symbol_value(%11914, %11915) : (i64, i64) -> i64
      %11963 = func.call @stack_pop_pointer() : () -> i64
      %11964 = func.call @cc_multiple_value_list(%11963) : (i64) -> i64
      %11965 = llvm.mlir.addressof @str1021 : !llvm.ptr
      %11966 = arith.constant 37 : i64
      %11967 = func.call @cc_make_string(%11965, %11966) : (!llvm.ptr, i64) -> i64
      %11968 = func.call @cc_nil_value() : () -> i64
      %11969 = func.call @cc_intern(%11967, %11968) : (i64, i64) -> i64
      %11970 = func.call @cc_nil_value() : () -> i64
      %11971 = func.call @cc_cons(%11969, %11970) : (i64, i64) -> i64
      %11972 = func.call @cc_values_pack(%11971) : (i64) -> i64
      %11973 = func.call @cc_symbol_value(%11969) : (i64) -> i64
      %11974 = llvm.mlir.addressof @str1022 : !llvm.ptr
      %11975 = arith.constant 38 : i64
      %11976 = func.call @cc_make_string(%11974, %11975) : (!llvm.ptr, i64) -> i64
      %11977 = func.call @cc_nil_value() : () -> i64
      %11978 = func.call @cc_intern(%11976, %11977) : (i64, i64) -> i64
      %11979 = func.call @cc_nil_value() : () -> i64
      %11980 = func.call @cc_cons(%11978, %11979) : (i64, i64) -> i64
      %11981 = func.call @cc_values_pack(%11980) : (i64) -> i64
      %11982 = func.call @cc_symbol_value(%11978) : (i64) -> i64
      %11983 = llvm.mlir.addressof @str1023 : !llvm.ptr
      %11984 = arith.constant 39 : i64
      %11985 = func.call @cc_make_string(%11983, %11984) : (!llvm.ptr, i64) -> i64
      %11986 = func.call @cc_nil_value() : () -> i64
      %11987 = func.call @cc_intern(%11985, %11986) : (i64, i64) -> i64
      %11988 = func.call @cc_nil_value() : () -> i64
      %11989 = func.call @cc_cons(%11987, %11988) : (i64, i64) -> i64
      %11990 = func.call @cc_values_pack(%11989) : (i64) -> i64
      %11991 = func.call @cc_symbol_value(%11987) : (i64) -> i64
      %11992 = func.call @cc_nil_value() : () -> i64
      %11993 = arith.cmpi ne, %11973, %11992 : i64
      %11994 = scf.if %11993 -> (i64) {
        scf.yield %11991 : i64
      } else {
        scf.yield %11964 : i64
      }
      %11995 = func.call @cc_values_pack(%11994) : (i64) -> i64
      func.call @stack_push_pointer(%11995) : (i64) -> ()
      %11996 = func.call @stack_pop_pointer() : () -> i64
      %11997 = func.call @cc_nil_value() : () -> i64
      %11998 = func.call @cc_cons(%11996, %11997) : (i64, i64) -> i64
      %11999 = func.call @cc_not(%11998) : (i64) -> i64
      func.call @stack_push_pointer(%11999) : (i64) -> ()
      %12000 = func.call @stack_pop_pointer() : () -> i64
      %12001 = func.call @cc_nil_value() : () -> i64
      %12002 = func.call @cc_cons(%12000, %12001) : (i64, i64) -> i64
      %12003 = func.call @cc_not(%12002) : (i64) -> i64
      func.call @stack_push_pointer(%12003) : (i64) -> ()
      %12004 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %12004 : i64
    }
    func.call @stack_push_pointer(%11823) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str1("f\0Ax\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_97047688511488*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_97047688511488*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_97047688511488*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_97047688511489*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_97047688511489*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_97047688511489*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str8("Dummy function for use in tests.\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETFLAG_97047688511489*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETVALUE_97047688511489*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETMVLIST_97047688511489*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETFLAG_97047688511488*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETMVLIST_97047688511488*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str14("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("f\0An\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETFLAG_97047688511490*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETVALUE_97047688511490*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_97047688511490*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_97047688511491*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_97047688511491*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_97047688511491*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("CLASP-TESTS::function-to-show-up-in-backtrace\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str23("#:%%DYN-CELL-97047688511493-F\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str24("CLASP-TESTS::nest-ftsuib\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETFLAG_97047688511491*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETVALUE_97047688511491*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETMVLIST_97047688511491*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_97047688511490*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETMVLIST_97047688511490*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str30("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_97047688511494*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETVALUE_97047688511494*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETMVLIST_97047688511494*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str34("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("BACKTRACE-1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str37("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str40("PRINT-BACKTRACE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str41("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str43("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str44("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str45("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("clasp-debug:print-backtrace\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str48("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str49("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str56("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str57("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str58("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str59("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str60("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str61("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str62("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str63("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str64("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str65("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str66("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str67("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str68("BACKTRACE-2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str70("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str71("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str73("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str75("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str77("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str78("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str80("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str81("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str82("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str85("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str87("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str88("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str89("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str90("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str92("*__MLIR_BLOCK_RETFLAG_97047688511497*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str93("*__MLIR_BLOCK_RETVALUE_97047688511497*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str94("*__MLIR_BLOCK_RETMVLIST_97047688511497*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str95("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str96("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str97("*__MLIR_BLOCK_RETFLAG_97047688511497*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETVALUE_97047688511497*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str99("*__MLIR_BLOCK_RETMVLIST_97047688511497*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str100("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str101("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str102("*__MLIR_BLOCK_RETFLAG_97047688511497*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str103("*__MLIR_BLOCK_RETVALUE_97047688511497*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str104("*__MLIR_BLOCK_RETMVLIST_97047688511497*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str105("#:%%DYN-CELL-97047688511500-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str106("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str107("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str110("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str111("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str112("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str113("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str114("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str116("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str117("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str119("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str120("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str121("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str122("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str123("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str125("BACKTRACE-3\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str126("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str127("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str129("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str130("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str133("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str135("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str136("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str137("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str138("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str139("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str140("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str143("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str145("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str146("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str147("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str148("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str153("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str155("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str156("*__MLIR_BLOCK_RETFLAG_97047688511502*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str157("*__MLIR_BLOCK_RETVALUE_97047688511502*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str158("*__MLIR_BLOCK_RETMVLIST_97047688511502*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str159("#:%%DYN-CELL-97047688511504-COUNT\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str160("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str161("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str162("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str163("*__MLIR_BLOCK_RETFLAG_97047688511502*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str164("*__MLIR_BLOCK_RETVALUE_97047688511502*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str165("*__MLIR_BLOCK_RETMVLIST_97047688511502*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str166("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str167("*__MLIR_BLOCK_RETFLAG_97047688511502*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str168("*__MLIR_BLOCK_RETVALUE_97047688511502*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str169("*__MLIR_BLOCK_RETMVLIST_97047688511502*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str170("#:%%DYN-CELL-97047688511506-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str171("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str173("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str174("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str175("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str176("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str177("BACKTRACE-4\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str179("NEST-FTSUIB\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str181("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str182("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str183("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str184("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str185("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str187("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str188("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str190("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str191("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str192("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str193("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str194("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str195("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str196("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str198("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str201("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str202("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str203("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str204("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str205("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("*__MLIR_BLOCK_RETFLAG_97047688511508*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str207("*__MLIR_BLOCK_RETVALUE_97047688511508*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str208("*__MLIR_BLOCK_RETMVLIST_97047688511508*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str209("#:%%DYN-CELL-97047688511510-COUNT\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str210("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str211("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str212("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str213("*__MLIR_BLOCK_RETFLAG_97047688511508*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str214("*__MLIR_BLOCK_RETVALUE_97047688511508*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str215("*__MLIR_BLOCK_RETMVLIST_97047688511508*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str216("%FN%nest-ftsuib\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str217("*__MLIR_BLOCK_RETFLAG_97047688511508*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str218("*__MLIR_BLOCK_RETVALUE_97047688511508*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str219("*__MLIR_BLOCK_RETMVLIST_97047688511508*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str220("#:%%DYN-CELL-97047688511512-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str221("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str223("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str224("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str225("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str226("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str227("FRAME-LOCALS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str228("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str229("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str232("MAP-BACKTRACE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str233("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str234("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str235("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str236("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str237("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str238("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str240("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str242("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str243("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str244("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str245("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("FRAME-LOCALS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str247("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str248("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str250("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str251("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str252("*__MLIR_BLOCK_RETFLAG_97047688511514*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str253("*__MLIR_BLOCK_RETVALUE_97047688511514*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str254("*__MLIR_BLOCK_RETMVLIST_97047688511514*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str255("__LAMBDA_97047688511515\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str256("*__MLIR_BLOCK_RETFLAG_97047688511516*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str257("*__MLIR_BLOCK_RETVALUE_97047688511516*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str258("*__MLIR_BLOCK_RETMVLIST_97047688511516*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str259("*__MLIR_BLOCK_RETFLAG_97047688511517*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str260("*__MLIR_BLOCK_RETVALUE_97047688511517*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str261("*__MLIR_BLOCK_RETMVLIST_97047688511517*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str262("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str263("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str264("clasp-debug:frame-locals\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str265("*__MLIR_BLOCK_RETFLAG_97047688511517*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str266("*__MLIR_BLOCK_RETVALUE_97047688511517*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str267("*__MLIR_BLOCK_RETMVLIST_97047688511517*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str268("*__MLIR_BLOCK_RETFLAG_97047688511516*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str269("*__MLIR_BLOCK_RETVALUE_97047688511516*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str270("*__MLIR_BLOCK_RETMVLIST_97047688511516*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str271("*__MLIR_BLOCK_RETFLAG_97047688511514*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str272("*__MLIR_BLOCK_RETVALUE_97047688511514*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str273("*__MLIR_BLOCK_RETMVLIST_97047688511514*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str274("clasp-debug:map-backtrace\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str275("*__MLIR_BLOCK_RETFLAG_97047688511517*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str276("*__MLIR_BLOCK_RETVALUE_97047688511517*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str277("*__MLIR_BLOCK_RETMVLIST_97047688511517*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str278("*__MLIR_BLOCK_RETFLAG_97047688511516*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str279("*__MLIR_BLOCK_RETMVLIST_97047688511516*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str280("__lambda_97047688511515\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str281("%FN%GET-FRAME-LOCALS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str282("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str283("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str284("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str285("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str286("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str287("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str288("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str289("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str290("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str291("%FN%get-frame-locals\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str292("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str293("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str294("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str295("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str296("*__MLIR_BLOCK_RETFLAG_97047688511514*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str297("*__MLIR_BLOCK_RETVALUE_97047688511514*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str298("*__MLIR_BLOCK_RETMVLIST_97047688511514*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str299("#:%%DYN-CELL-97047688511519-%FN%GET-FRAME-LOCALS\00") : !llvm.array<49 x i8>
  llvm.mlir.global private constant @str300("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str301("GET-FRAME-LOCALS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str302("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str303("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str304("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str305("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str306("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str307("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str308("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str309("FRAME-FUNCTION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str310("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str311("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str312("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str313("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str315("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str317("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str318("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str319("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str320("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str321("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str323("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str324("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str326("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str327("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str328("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str331("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str333("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str334("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str335("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str336("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("FRAME-FUNCTION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str338("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str339("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str340("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str341("function-to-show-up-in-backtrace\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str342("*__MLIR_BLOCK_RETFLAG_97047688511521*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str343("*__MLIR_BLOCK_RETVALUE_97047688511521*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str344("*__MLIR_BLOCK_RETMVLIST_97047688511521*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str345("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str346("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str347("clasp-debug:frame-function\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str348("*__MLIR_BLOCK_RETFLAG_97047688511521*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str349("*__MLIR_BLOCK_RETVALUE_97047688511521*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str350("*__MLIR_BLOCK_RETMVLIST_97047688511521*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str351("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str352("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str353("*__MLIR_BLOCK_RETFLAG_97047688511521*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str354("*__MLIR_BLOCK_RETVALUE_97047688511521*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str355("*__MLIR_BLOCK_RETMVLIST_97047688511521*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str356("#:%%DYN-CELL-97047688511524-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str357("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str358("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str359("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str360("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str361("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str362("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str363("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str364("FRAME-FUNCTION-LAMBDA-LIST\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str365("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str366("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str367("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str368("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str369("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str370("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str371("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str372("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str373("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str374("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str375("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str376("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str377("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str378("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str379("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str380("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str381("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str382("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str383("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str384("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("FRAME-FUNCTION-LAMBDA-LIST\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str386("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str387("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str388("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str389("*__MLIR_BLOCK_RETFLAG_97047688511526*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str390("*__MLIR_BLOCK_RETVALUE_97047688511526*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str391("*__MLIR_BLOCK_RETMVLIST_97047688511526*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str392("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str393("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str394("clasp-debug:frame-function-lambda-list\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str395("*__MLIR_BLOCK_RETFLAG_97047688511526*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str396("*__MLIR_BLOCK_RETVALUE_97047688511526*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str397("*__MLIR_BLOCK_RETMVLIST_97047688511526*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str398("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str399("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str400("*__MLIR_BLOCK_RETFLAG_97047688511526*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str401("*__MLIR_BLOCK_RETVALUE_97047688511526*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str402("*__MLIR_BLOCK_RETMVLIST_97047688511526*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str403("#:%%DYN-CELL-97047688511529-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str404("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str405("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str406("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str407("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str408("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str409("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str410("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str411("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str412("FRAME-FUNCTION-DOCUMENTATION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str413("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str414("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str415("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str416("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str417("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str418("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str419("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str420("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str422("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str423("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str424("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str425("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str427("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str428("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str429("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str430("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str431("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str432("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str433("FRAME-FUNCTION-DOCUMENTATION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str434("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str436("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str437("*__MLIR_BLOCK_RETFLAG_97047688511531*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str438("*__MLIR_BLOCK_RETVALUE_97047688511531*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str439("*__MLIR_BLOCK_RETMVLIST_97047688511531*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str440("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str441("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str442("clasp-debug:frame-function-documentation\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str443("*__MLIR_BLOCK_RETFLAG_97047688511531*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str444("*__MLIR_BLOCK_RETVALUE_97047688511531*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str445("*__MLIR_BLOCK_RETMVLIST_97047688511531*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str446("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str447("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str448("*__MLIR_BLOCK_RETFLAG_97047688511531*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str449("*__MLIR_BLOCK_RETVALUE_97047688511531*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str450("*__MLIR_BLOCK_RETMVLIST_97047688511531*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str451("#:%%DYN-CELL-97047688511534-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str452("Dummy function for use in tests.\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str453("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str455("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str456("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str457("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str458("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str459("BYTECODE-FRAME-FUNCTION-NAME\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str460("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str461("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str462("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str463("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str464("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str465("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str466("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str467("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str468("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str469("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str470("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str471("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str472("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str473("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("FRAMES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str475("MAP-BACKTRACE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str476("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str477("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str478("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str479("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str480("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str481("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str482("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str483("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("FRAME-LANGUAGE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str485("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str486("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str487("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str488("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str489("PUSH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str490("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str491("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str492("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str493("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str494("FRAMES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str495("FRAMES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str496("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str497("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str498("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str499("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str500("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str501("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str502("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str503("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str504("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str505("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str506("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str507("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str508("FDEFINITION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str509("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str510("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str511("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str512("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str513("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str514("*__MLIR_BLOCK_RETFLAG_97047688511537*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str515("*__MLIR_BLOCK_RETVALUE_97047688511537*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str516("*__MLIR_BLOCK_RETMVLIST_97047688511537*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str517("#:%%DYN-CELL-97047688511538-FRAMES\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str518("clasp-debug:frame-language\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str519("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str520("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str521("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str522("clasp-debug:map-backtrace\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str523("*__MLIR_BLOCK_RETFLAG_97047688511537*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str524("*__MLIR_BLOCK_RETMVLIST_97047688511537*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str525("%FN%bc2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str526("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str527("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str528("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str529("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str530("*__MLIR_BLOCK_RETFLAG_97047688511540*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str531("*__MLIR_BLOCK_RETVALUE_97047688511540*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str532("*__MLIR_BLOCK_RETMVLIST_97047688511540*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str533("%FN%bc2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str534("*__MLIR_BLOCK_RETFLAG_97047688511540*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str535("*__MLIR_BLOCK_RETMVLIST_97047688511540*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str536("%FN%bc1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str537("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str538("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str539("#:%%DYN-CELL-97047688511541-BC1\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str540("#:%%DYN-CELL-97047688511542-BC2\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str541("#:%%DYN-CELL-97047688511543-FRAMES\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str542("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str543("BC2\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str544("BC1\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str545("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str546("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str547("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str549("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str550("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str551("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str552("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str553("BYTECODE-FRAME-LOCALS\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str554("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str555("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str556("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str557("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str558("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str559("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str560("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str561("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str562("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str564("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str565("MAP-BACKTRACE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str566("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str567("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str568("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str569("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str570("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str571("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str572("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str573("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str574("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str575("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str577("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str578("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str579("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str580("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str581("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str582("FRAME-LOCALS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str583("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str584("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str585("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str586("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str587("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str588("x\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str589("BYTECODE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str590("*__MLIR_BLOCK_RETFLAG_97047688511546*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str591("*__MLIR_BLOCK_RETVALUE_97047688511546*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str592("*__MLIR_BLOCK_RETMVLIST_97047688511546*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str593("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str594("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str595("clasp-debug:frame-locals\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str596("*__MLIR_BLOCK_RETFLAG_97047688511546*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str597("*__MLIR_BLOCK_RETVALUE_97047688511546*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str598("*__MLIR_BLOCK_RETMVLIST_97047688511546*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str599("#:%%DYN-CELL-97047688511548-BCL\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str600("map-backtrace\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str601("*__MLIR_BLOCK_RETFLAG_97047688511546*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str602("*__MLIR_BLOCK_RETMVLIST_97047688511546*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str603("x\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str604("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str605("%FN%bcl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str606("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str607("BCL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str608("#:%%DYN-CELL-97047688511549-BCL\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str609("%FN%bcl\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str610("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str611("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str612("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str613("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str614("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str615("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str616("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str617("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str618("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str619("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str620("PRINT-OBJECT signaled an error and it wasn't handled\00") : !llvm.array<53 x i8>
  llvm.mlir.global private constant @str621("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @method_name_97047688511550("COMMON-LISP:PRINT-OBJECT_97047688511550_primary\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str623("PRINT-OBJECT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str624("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str625("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str626("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str627("PRINT-OBJECT signaled an error and it wasn't handled\00") : !llvm.array<53 x i8>
  llvm.mlir.global private constant @str628("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str629("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str630("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str631("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str632("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str633("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str634("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str635("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str636("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str637("O\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str638("PRINT-OBJECT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str639("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str640("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str641("PRINT-BACKTRACE-HANDLES-ERRORS\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str642("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str643("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str644("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str645("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str646("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str647("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str648("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str649("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str650("PRINT-BACKTRACE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str651("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str652("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str653("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str654("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str655("MAKE-INSTANCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str656("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str657("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str658("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str659("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str660("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str661("clasp-debug:print-backtrace\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str662("#:%%DYN-CELL-97047688511553-S\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str663("UNPRINTABLE-OBJECT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str664("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str665("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str666("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str667("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str668("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str669("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str670("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str671("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str672("TRUNCATE-STACK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str673("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str674("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str675("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str676("WITH-TRUNCATED-STACK\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str677("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str678("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str679("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str680("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str681("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str682("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str683("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str684("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str685("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str686("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str687("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str688("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str689("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str690("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str691("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str692("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str693("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str694("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str695("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str696("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str697("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str698("*__MLIR_BLOCK_RETFLAG_97047688511555*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str699("*__MLIR_BLOCK_RETVALUE_97047688511555*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str700("*__MLIR_BLOCK_RETMVLIST_97047688511555*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str701("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str702("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str703("*__MLIR_BLOCK_RETFLAG_97047688511555*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str704("*__MLIR_BLOCK_RETVALUE_97047688511555*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str705("*__MLIR_BLOCK_RETMVLIST_97047688511555*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str706("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str707("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str708("call-with-truncated-stack\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str709("*__MLIR_BLOCK_RETFLAG_97047688511555*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str710("*__MLIR_BLOCK_RETVALUE_97047688511555*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str711("*__MLIR_BLOCK_RETMVLIST_97047688511555*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str712("#:%%DYN-CELL-97047688511559-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str713("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str714("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str715("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str716("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str717("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str718("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str719("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str720("CAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str721("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str722("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str723("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str724("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str725("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str726("WITH-CAPPED-STACK\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str727("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str729("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str730("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str731("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str732("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str733("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str734("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str735("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str736("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str737("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str738("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str739("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str740("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str741("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str742("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str743("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str744("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str745("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str746("*__MLIR_BLOCK_RETFLAG_97047688511561*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str747("*__MLIR_BLOCK_RETVALUE_97047688511561*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str748("*__MLIR_BLOCK_RETMVLIST_97047688511561*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str749("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str750("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str751("*__MLIR_BLOCK_RETFLAG_97047688511561*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str752("*__MLIR_BLOCK_RETVALUE_97047688511561*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str753("*__MLIR_BLOCK_RETMVLIST_97047688511561*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str754("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str755("call-with-capped-stack\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str756("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str757("*__MLIR_BLOCK_RETFLAG_97047688511561*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str758("*__MLIR_BLOCK_RETVALUE_97047688511561*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str759("*__MLIR_BLOCK_RETMVLIST_97047688511561*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str760("#:%%DYN-CELL-97047688511565-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str761("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str762("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str763("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str764("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str765("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str766("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str767("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str768("UNDELIMITED-STACK-1\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str769("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str770("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str771("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str772("WITH-TRUNCATED-STACK\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str773("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str774("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str775("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str776("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str777("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str778("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str779("DELIMITED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str780("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str781("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str782("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str783("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str784("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str785("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str786("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str787("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str788("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str789("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str790("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str791("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str792("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str793("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str794("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str795("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str796("*__MLIR_BLOCK_RETFLAG_97047688511567*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str797("*__MLIR_BLOCK_RETVALUE_97047688511567*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str798("*__MLIR_BLOCK_RETMVLIST_97047688511567*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str799("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str800("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str801("*__MLIR_BLOCK_RETFLAG_97047688511567*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str802("*__MLIR_BLOCK_RETVALUE_97047688511567*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str803("*__MLIR_BLOCK_RETMVLIST_97047688511567*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str804("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str805("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str806("call-with-truncated-stack\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str807("*__MLIR_BLOCK_RETFLAG_97047688511567*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str808("*__MLIR_BLOCK_RETVALUE_97047688511567*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str809("*__MLIR_BLOCK_RETMVLIST_97047688511567*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str810("#:%%DYN-CELL-97047688511571-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str811("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str812("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str813("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str814("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str815("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str816("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str817("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str818("UNDELIMITED-STACK-2\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str819("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str820("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str821("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str822("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str823("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str824("WITH-CAPPED-STACK\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str825("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str826("WITH-STACK\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str827("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str828("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str829("DELIMITED\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str830("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str831("MAP-STACK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str832("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str833("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str834("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str835("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str836("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str837("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str838("FRAME-FUNCTION-NAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str839("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str840("FRAME\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str841("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str842("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str843("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str844("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str845("STACK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str846("*__MLIR_BLOCK_RETFLAG_97047688511573*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str847("*__MLIR_BLOCK_RETVALUE_97047688511573*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str848("*__MLIR_BLOCK_RETMVLIST_97047688511573*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str849("clasp-debug:frame-function-name\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str850("FUNCTION-TO-SHOW-UP-IN-BACKTRACE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str851("*__MLIR_BLOCK_RETFLAG_97047688511573*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str852("*__MLIR_BLOCK_RETVALUE_97047688511573*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str853("*__MLIR_BLOCK_RETMVLIST_97047688511573*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str854("clasp-debug:map-stack\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str855("call-with-capped-stack\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str856("%FN%function-to-show-up-in-backtrace\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str857("*__MLIR_BLOCK_RETFLAG_97047688511573*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str858("*__MLIR_BLOCK_RETVALUE_97047688511573*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str859("*__MLIR_BLOCK_RETMVLIST_97047688511573*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str860("#:%%DYN-CELL-97047688511577-STACK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str861("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str862("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str863("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str864("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str865("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str866("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str867("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str868("BREAKSTEP-COMPILE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str869("VALUES-LIST\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str870("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str871("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str872("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str873("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str874("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str875("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str876("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str877("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str878("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str879("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str880("SET-BREAKSTEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str881("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str882("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str883("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str884("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str885("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str886("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str887("UNSET-BREAKSTEP\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str888("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str889("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str890("clasp-debug:set-breakstep\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str891("clasp-debug:unset-breakstep\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str892("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str893("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str894("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str895("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str896("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str897("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str898("STEP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str899("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str900("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str901("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str902("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str903("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str904("*INVOKE-DEBUGGER-HOOK*\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str905("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str906("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str907("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str908("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str909("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str910("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str911("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str912("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str913("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str914("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str915("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str916("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str917("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str918("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str919("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str920("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str921("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str922("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str923("STEP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str924("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str925("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str926("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str927("*__MLIR_BLOCK_RETFLAG_97047688511581*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str928("*__MLIR_BLOCK_RETVALUE_97047688511581*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str929("*__MLIR_BLOCK_RETMVLIST_97047688511581*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str930("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str931("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str932("*__MLIR_BLOCK_RETFLAG_97047688511581*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str933("*__MLIR_BLOCK_RETVALUE_97047688511581*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str934("*__MLIR_BLOCK_RETMVLIST_97047688511581*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str935("ext:*invoke-debugger-hook*\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str936("STEP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str937("*__MLIR_BLOCK_RETFLAG_97047688511581*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str938("*__MLIR_BLOCK_RETVALUE_97047688511581*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str939("*__MLIR_BLOCK_RETMVLIST_97047688511581*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str940("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str941("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str942("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str943("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str944("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str945("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str946("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str947("BREAKSTEPPING-P\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str948("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str949("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str950("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str951("SET-BREAKSTEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str952("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str953("BREAKSTEPPING-P\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str954("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str955("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str956("UNSET-BREAKSTEP\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str957("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str958("BREAKSTEPPING-P\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str959("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str960("clasp-debug:set-breakstep\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str961("clasp-debug:breakstepping-p\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str962("clasp-debug:unset-breakstep\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str963("clasp-debug:breakstepping-p\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str964("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str965("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str966("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str967("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str968("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str969("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str970("BREAKSTEP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str971("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str972("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str973("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str974("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str975("*INVOKE-DEBUGGER-HOOK*\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str976("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str977("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str978("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str979("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str980("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str981("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str982("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str983("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str984("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str985("OLD-HOOK\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str986("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str987("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str988("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str989("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str990("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str991("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str992("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str993("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str994("SET-BREAKSTEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str995("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str996("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str997("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str998("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str999("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1000("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1001("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1002("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1003("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1004("INSERT-STEP-CONDITIONS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str1005("CLASP-CLEAVIR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str1006("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1007("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1008("UNSET-BREAKSTEP\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str1009("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1010("*__MLIR_BLOCK_RETFLAG_97047688511585*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1011("*__MLIR_BLOCK_RETVALUE_97047688511585*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1012("*__MLIR_BLOCK_RETMVLIST_97047688511585*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1013("STEP-FORM\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str1014("CLASP-DEBUG\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1015("*__MLIR_BLOCK_RETFLAG_97047688511585*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1016("*__MLIR_BLOCK_RETVALUE_97047688511585*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1017("*__MLIR_BLOCK_RETMVLIST_97047688511585*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1018("ext:*invoke-debugger-hook*\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str1019("clasp-debug:set-breakstep\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str1020("clasp-debug:unset-breakstep\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str1021("*__MLIR_BLOCK_RETFLAG_97047688511585*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1022("*__MLIR_BLOCK_RETVALUE_97047688511585*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1023("*__MLIR_BLOCK_RETMVLIST_97047688511585*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str1024("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str1025("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1026("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1027("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1028("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1029("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1030("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1031("*__MLIR_BLOCK_RETFLAG_97047688511494*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str1032("*__MLIR_BLOCK_RETMVLIST_97047688511494*\00") : !llvm.array<40 x i8>
}
