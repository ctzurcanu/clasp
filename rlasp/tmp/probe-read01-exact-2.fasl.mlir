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
      %43 = arith.constant 45 : i64
      %44 = func.call @cc_make_string(%42, %43) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%44) : (i64) -> ()
      %45 = func.call @stack_pop_pointer() : () -> i64
      %46 = func.call @cc_nil_value() : () -> i64
      %47 = func.call @cc_cons(%45, %46) : (i64, i64) -> i64
      %48 = func.call @cc_load_stack(%47) : (i64) -> i64
      func.call @stack_push_pointer(%48) : (i64) -> ()
      %49 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %49 : i64
    }
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_errorp(%41) : (i64) -> i64
    %52 = arith.cmpi ne, %51, %50 : i64
    %53 = scf.if %52 -> (i64) {
      scf.yield %41 : i64
    } else {
      %54 = llvm.mlir.addressof @str5 : !llvm.ptr
      %55 = arith.constant 11 : i64
      %56 = func.call @cc_make_string(%54, %55) : (!llvm.ptr, i64) -> i64
      %57 = func.call @cc_nil_value() : () -> i64
      %58 = func.call @cc_intern(%56, %57) : (i64, i64) -> i64
      %59 = func.call @cc_nil_value() : () -> i64
      %60 = func.call @cc_cons(%58, %59) : (i64, i64) -> i64
      %61 = func.call @cc_values_pack(%60) : (i64) -> i64
      func.call @stack_push_pointer(%58) : (i64) -> ()
      %62 = func.call @stack_pop_pointer() : () -> i64
      %63 = func.call @cc_in_package(%62) : (i64) -> i64
      func.call @stack_push_pointer(%63) : (i64) -> ()
      %64 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %64 : i64
    }
    %65 = func.call @cc_nil_value() : () -> i64
    %66 = func.call @cc_errorp(%53) : (i64) -> i64
    %67 = arith.cmpi ne, %66, %65 : i64
    %68 = scf.if %67 -> (i64) {
      scf.yield %53 : i64
    } else {
      %69 = arith.constant 8 : i64
      %70 = func.call @cc_box_character(%69) : (i64) -> i64
      func.call @stack_push_pointer(%70) : (i64) -> ()
      %71 = func.call @stack_pop_pointer() : () -> i64
      %72 = arith.constant 9 : i64
      %73 = func.call @cc_box_character(%72) : (i64) -> i64
      func.call @stack_push_pointer(%73) : (i64) -> ()
      %74 = func.call @stack_pop_pointer() : () -> i64
      %75 = arith.constant 10 : i64
      %76 = func.call @cc_box_character(%75) : (i64) -> i64
      func.call @stack_push_pointer(%76) : (i64) -> ()
      %77 = func.call @stack_pop_pointer() : () -> i64
      %78 = arith.constant 10 : i64
      %79 = func.call @cc_box_character(%78) : (i64) -> i64
      func.call @stack_push_pointer(%79) : (i64) -> ()
      %80 = func.call @stack_pop_pointer() : () -> i64
      %81 = arith.constant 12 : i64
      %82 = func.call @cc_box_character(%81) : (i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      %83 = func.call @stack_pop_pointer() : () -> i64
      %84 = arith.constant 13 : i64
      %85 = func.call @cc_box_character(%84) : (i64) -> i64
      func.call @stack_push_pointer(%85) : (i64) -> ()
      %86 = func.call @stack_pop_pointer() : () -> i64
      %87 = arith.constant 32 : i64
      %88 = func.call @cc_box_character(%87) : (i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %89 = func.call @stack_pop_pointer() : () -> i64
      %90 = arith.constant 127 : i64
      %91 = func.call @cc_box_character(%90) : (i64) -> i64
      func.call @stack_push_pointer(%91) : (i64) -> ()
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_errorp(%71) : (i64) -> i64
      %95 = arith.cmpi ne, %94, %93 : i64
      %96 = arith.cmpi eq, %93, %93 : i64
      %97 = arith.andi %95, %96 : i1
      %98 = scf.if %97 -> (i64) {
        scf.yield %71 : i64
      } else {
        scf.yield %93 : i64
      }
      %99 = func.call @cc_errorp(%74) : (i64) -> i64
      %100 = arith.cmpi ne, %99, %93 : i64
      %101 = arith.cmpi eq, %98, %93 : i64
      %102 = arith.andi %100, %101 : i1
      %103 = scf.if %102 -> (i64) {
        scf.yield %74 : i64
      } else {
        scf.yield %98 : i64
      }
      %104 = func.call @cc_errorp(%77) : (i64) -> i64
      %105 = arith.cmpi ne, %104, %93 : i64
      %106 = arith.cmpi eq, %103, %93 : i64
      %107 = arith.andi %105, %106 : i1
      %108 = scf.if %107 -> (i64) {
        scf.yield %77 : i64
      } else {
        scf.yield %103 : i64
      }
      %109 = func.call @cc_errorp(%80) : (i64) -> i64
      %110 = arith.cmpi ne, %109, %93 : i64
      %111 = arith.cmpi eq, %108, %93 : i64
      %112 = arith.andi %110, %111 : i1
      %113 = scf.if %112 -> (i64) {
        scf.yield %80 : i64
      } else {
        scf.yield %108 : i64
      }
      %114 = func.call @cc_errorp(%83) : (i64) -> i64
      %115 = arith.cmpi ne, %114, %93 : i64
      %116 = arith.cmpi eq, %113, %93 : i64
      %117 = arith.andi %115, %116 : i1
      %118 = scf.if %117 -> (i64) {
        scf.yield %83 : i64
      } else {
        scf.yield %113 : i64
      }
      %119 = func.call @cc_errorp(%86) : (i64) -> i64
      %120 = arith.cmpi ne, %119, %93 : i64
      %121 = arith.cmpi eq, %118, %93 : i64
      %122 = arith.andi %120, %121 : i1
      %123 = scf.if %122 -> (i64) {
        scf.yield %86 : i64
      } else {
        scf.yield %118 : i64
      }
      %124 = func.call @cc_errorp(%89) : (i64) -> i64
      %125 = arith.cmpi ne, %124, %93 : i64
      %126 = arith.cmpi eq, %123, %93 : i64
      %127 = arith.andi %125, %126 : i1
      %128 = scf.if %127 -> (i64) {
        scf.yield %89 : i64
      } else {
        scf.yield %123 : i64
      }
      %129 = func.call @cc_errorp(%92) : (i64) -> i64
      %130 = arith.cmpi ne, %129, %93 : i64
      %131 = arith.cmpi eq, %128, %93 : i64
      %132 = arith.andi %130, %131 : i1
      %133 = scf.if %132 -> (i64) {
        scf.yield %92 : i64
      } else {
        scf.yield %128 : i64
      }
      %134 = arith.cmpi ne, %133, %93 : i64
      scf.if %134 {
        func.call @stack_push_pointer(%133) : (i64) -> ()
      } else {
        %135 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%135) : (i64) -> ()
        func.call @stack_push_pointer(%92) : (i64) -> ()
        %136 = func.call @stack_pop_pointer() : () -> i64
        %137 = func.call @stack_pop_pointer() : () -> i64
        %138 = func.call @cc_cons(%136, %137) : (i64, i64) -> i64
        func.call @stack_push_pointer(%138) : (i64) -> ()
        func.call @stack_push_pointer(%89) : (i64) -> ()
        %139 = func.call @stack_pop_pointer() : () -> i64
        %140 = func.call @stack_pop_pointer() : () -> i64
        %141 = func.call @cc_cons(%139, %140) : (i64, i64) -> i64
        func.call @stack_push_pointer(%141) : (i64) -> ()
        func.call @stack_push_pointer(%86) : (i64) -> ()
        %142 = func.call @stack_pop_pointer() : () -> i64
        %143 = func.call @stack_pop_pointer() : () -> i64
        %144 = func.call @cc_cons(%142, %143) : (i64, i64) -> i64
        func.call @stack_push_pointer(%144) : (i64) -> ()
        func.call @stack_push_pointer(%83) : (i64) -> ()
        %145 = func.call @stack_pop_pointer() : () -> i64
        %146 = func.call @stack_pop_pointer() : () -> i64
        %147 = func.call @cc_cons(%145, %146) : (i64, i64) -> i64
        func.call @stack_push_pointer(%147) : (i64) -> ()
        func.call @stack_push_pointer(%80) : (i64) -> ()
        %148 = func.call @stack_pop_pointer() : () -> i64
        %149 = func.call @stack_pop_pointer() : () -> i64
        %150 = func.call @cc_cons(%148, %149) : (i64, i64) -> i64
        func.call @stack_push_pointer(%150) : (i64) -> ()
        func.call @stack_push_pointer(%77) : (i64) -> ()
        %151 = func.call @stack_pop_pointer() : () -> i64
        %152 = func.call @stack_pop_pointer() : () -> i64
        %153 = func.call @cc_cons(%151, %152) : (i64, i64) -> i64
        func.call @stack_push_pointer(%153) : (i64) -> ()
        func.call @stack_push_pointer(%74) : (i64) -> ()
        %154 = func.call @stack_pop_pointer() : () -> i64
        %155 = func.call @stack_pop_pointer() : () -> i64
        %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
        func.call @stack_push_pointer(%156) : (i64) -> ()
        func.call @stack_push_pointer(%71) : (i64) -> ()
        %157 = func.call @stack_pop_pointer() : () -> i64
        %158 = func.call @stack_pop_pointer() : () -> i64
        %159 = func.call @cc_cons(%157, %158) : (i64, i64) -> i64
        func.call @stack_push_pointer(%159) : (i64) -> ()
      }
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_nil_value() : () -> i64
      %163 = func.call @cc_errorp(%161) : (i64) -> i64
      %164 = arith.cmpi ne, %163, %162 : i64
      %165 = scf.if %164 -> (i64) {
        scf.yield %161 : i64
      } else {
        %547 = llvm.mlir.addressof @str42 : !llvm.ptr
        %548 = arith.constant 30 : i64
        %549 = func.call @cc_make_symbol(%547, %548) : (!llvm.ptr, i64) -> i64
        %550 = func.call @cc_persistent_root_value(%549) : (i64) -> i64
        func.call @stack_push_pointer(%550) : (i64) -> ()
        %551 = arith.constant 252112499900417 : i64
        %552 = arith.constant 1 : i64
        %553 = func.call @cc_make_closure(%551, %552) : (i64, i64) -> i64
        func.call @stack_push_pointer(%553) : (i64) -> ()
        %554 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%160) : (i64) -> ()
        %555 = func.call @stack_pop_pointer() : () -> i64
        %556 = func.call @cc_nil_value() : () -> i64
        %557 = func.call @cc_errorp(%554) : (i64) -> i64
        %558 = arith.cmpi ne, %557, %556 : i64
        %559 = arith.cmpi eq, %556, %556 : i64
        %560 = arith.andi %558, %559 : i1
        %561 = scf.if %560 -> (i64) {
          scf.yield %554 : i64
        } else {
          scf.yield %556 : i64
        }
        %562 = func.call @cc_errorp(%555) : (i64) -> i64
        %563 = arith.cmpi ne, %562, %556 : i64
        %564 = arith.cmpi eq, %561, %556 : i64
        %565 = arith.andi %563, %564 : i1
        %566 = scf.if %565 -> (i64) {
          scf.yield %555 : i64
        } else {
          scf.yield %561 : i64
        }
        %567 = arith.cmpi ne, %566, %556 : i64
        scf.if %567 {
          func.call @stack_push_pointer(%566) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%554) : (i64) -> ()
          func.call @stack_push_pointer(%555) : (i64) -> ()
          %568 = llvm.mlir.addressof @str43 : !llvm.ptr
          %569 = func.call @cc_make_function_ref_const(%568) : (!llvm.ptr) -> i64
          %570 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%569, %570) : (i64, i64) -> ()
        }
        %571 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %571 : i64
      }
      func.call @stack_push_pointer(%165) : (i64) -> ()
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @cc_nil_value() : () -> i64
      %574 = func.call @cc_nil_value() : () -> i64
      %575 = func.call @cc_errorp(%573) : (i64) -> i64
      %576 = arith.cmpi ne, %575, %574 : i64
      %577 = scf.if %576 -> (i64) {
        scf.yield %573 : i64
      } else {
        %578 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%578) : (i64) -> ()
        %579 = func.call @stack_pop_pointer() : () -> i64
        %580 = llvm.mlir.addressof @str44 : !llvm.ptr
        %581 = arith.constant 11 : i64
        %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%582) : (i64) -> ()
        %583 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%572) : (i64) -> ()
        %584 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%579) : (i64) -> ()
        func.call @stack_push_pointer(%583) : (i64) -> ()
        func.call @stack_push_pointer(%584) : (i64) -> ()
        %585 = llvm.mlir.addressof @str45 : !llvm.ptr
        %586 = func.call @cc_make_function_ref_const(%585) : (!llvm.ptr) -> i64
        %587 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%586, %587) : (i64, i64) -> ()
        %588 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %588 : i64
      }
      %589 = func.call @cc_nil_value() : () -> i64
      %590 = func.call @cc_errorp(%577) : (i64) -> i64
      %591 = arith.cmpi ne, %590, %589 : i64
      %592 = scf.if %591 -> (i64) {
        scf.yield %577 : i64
      } else {
        %593 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%593) : (i64) -> ()
        %594 = func.call @stack_pop_pointer() : () -> i64
        %595 = llvm.mlir.addressof @str46 : !llvm.ptr
        %596 = arith.constant 37 : i64
        %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%597) : (i64) -> ()
        %598 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%572) : (i64) -> ()
        %599 = func.call @stack_pop_pointer() : () -> i64
        %600 = func.call @cc_car(%599) : (i64) -> i64
        func.call @stack_push_pointer(%600) : (i64) -> ()
        %601 = llvm.mlir.addressof @str47 : !llvm.ptr
        %602 = arith.constant 12 : i64
        %603 = func.call @cc_make_string(%601, %602) : (!llvm.ptr, i64) -> i64
        %604 = llvm.mlir.addressof @str48 : !llvm.ptr
        %605 = arith.constant 11 : i64
        %606 = func.call @cc_make_string(%604, %605) : (!llvm.ptr, i64) -> i64
        %607 = func.call @cc_intern(%603, %606) : (i64, i64) -> i64
        %608 = func.call @cc_nil_value() : () -> i64
        %609 = func.call @cc_cons(%607, %608) : (i64, i64) -> i64
        %610 = func.call @cc_values_pack(%609) : (i64) -> i64
        func.call @stack_push_pointer(%607) : (i64) -> ()
        %611 = func.call @stack_pop_pointer() : () -> i64
        %612 = func.call @stack_pop_pointer() : () -> i64
        %613 = func.call @cc_typep(%612, %611) : (i64, i64) -> i64
        func.call @stack_push_pointer(%613) : (i64) -> ()
        %614 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%572) : (i64) -> ()
        %615 = func.call @stack_pop_pointer() : () -> i64
        %616 = func.call @cc_nil_value() : () -> i64
        %617 = func.call @cc_errorp(%615) : (i64) -> i64
        %618 = arith.cmpi ne, %617, %616 : i64
        %619 = arith.cmpi eq, %616, %616 : i64
        %620 = arith.andi %618, %619 : i1
        %621 = scf.if %620 -> (i64) {
          scf.yield %615 : i64
        } else {
          scf.yield %616 : i64
        }
        %622 = arith.cmpi ne, %621, %616 : i64
        scf.if %622 {
          func.call @stack_push_pointer(%621) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%615) : (i64) -> ()
          %623 = llvm.mlir.addressof @str49 : !llvm.ptr
          %624 = func.call @cc_make_function_ref_const(%623) : (!llvm.ptr) -> i64
          %625 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%624, %625) : (i64, i64) -> ()
        }
        %626 = llvm.mlir.addressof @str50 : !llvm.ptr
        %627 = arith.constant 12 : i64
        %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
        %629 = llvm.mlir.addressof @str51 : !llvm.ptr
        %630 = arith.constant 11 : i64
        %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
        %632 = func.call @cc_intern(%628, %631) : (i64, i64) -> i64
        %633 = func.call @cc_nil_value() : () -> i64
        %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
        %635 = func.call @cc_values_pack(%634) : (i64) -> i64
        func.call @stack_push_pointer(%632) : (i64) -> ()
        %636 = func.call @stack_pop_pointer() : () -> i64
        %637 = func.call @stack_pop_pointer() : () -> i64
        %638 = func.call @cc_typep(%637, %636) : (i64, i64) -> i64
        func.call @stack_push_pointer(%638) : (i64) -> ()
        %639 = func.call @stack_pop_pointer() : () -> i64
        %640 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%572) : (i64) -> ()
        %641 = func.call @stack_pop_pointer() : () -> i64
        %642 = func.call @cc_car(%641) : (i64) -> i64
        func.call @stack_push_pointer(%642) : (i64) -> ()
        %643 = llvm.mlir.addressof @str52 : !llvm.ptr
        %644 = arith.constant 12 : i64
        %645 = func.call @cc_make_string(%643, %644) : (!llvm.ptr, i64) -> i64
        %646 = llvm.mlir.addressof @str53 : !llvm.ptr
        %647 = arith.constant 11 : i64
        %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
        %649 = func.call @cc_intern(%645, %648) : (i64, i64) -> i64
        %650 = func.call @cc_nil_value() : () -> i64
        %651 = func.call @cc_cons(%649, %650) : (i64, i64) -> i64
        %652 = func.call @cc_values_pack(%651) : (i64) -> i64
        func.call @stack_push_pointer(%649) : (i64) -> ()
        %653 = func.call @stack_pop_pointer() : () -> i64
        %654 = func.call @stack_pop_pointer() : () -> i64
        %655 = func.call @cc_typep(%654, %653) : (i64, i64) -> i64
        func.call @stack_push_pointer(%655) : (i64) -> ()
        %656 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%572) : (i64) -> ()
        %657 = func.call @stack_pop_pointer() : () -> i64
        %658 = func.call @cc_nil_value() : () -> i64
        %659 = func.call @cc_errorp(%657) : (i64) -> i64
        %660 = arith.cmpi ne, %659, %658 : i64
        %661 = arith.cmpi eq, %658, %658 : i64
        %662 = arith.andi %660, %661 : i1
        %663 = scf.if %662 -> (i64) {
          scf.yield %657 : i64
        } else {
          scf.yield %658 : i64
        }
        %664 = arith.cmpi ne, %663, %658 : i64
        scf.if %664 {
          func.call @stack_push_pointer(%663) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%657) : (i64) -> ()
          %665 = llvm.mlir.addressof @str54 : !llvm.ptr
          %666 = func.call @cc_make_function_ref_const(%665) : (!llvm.ptr) -> i64
          %667 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%666, %667) : (i64, i64) -> ()
        }
        %668 = llvm.mlir.addressof @str55 : !llvm.ptr
        %669 = arith.constant 12 : i64
        %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
        %671 = llvm.mlir.addressof @str56 : !llvm.ptr
        %672 = arith.constant 11 : i64
        %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
        %674 = func.call @cc_intern(%670, %673) : (i64, i64) -> i64
        %675 = func.call @cc_nil_value() : () -> i64
        %676 = func.call @cc_cons(%674, %675) : (i64, i64) -> i64
        %677 = func.call @cc_values_pack(%676) : (i64) -> i64
        func.call @stack_push_pointer(%674) : (i64) -> ()
        %678 = func.call @stack_pop_pointer() : () -> i64
        %679 = func.call @stack_pop_pointer() : () -> i64
        %680 = func.call @cc_typep(%679, %678) : (i64, i64) -> i64
        func.call @stack_push_pointer(%680) : (i64) -> ()
        %681 = func.call @stack_pop_pointer() : () -> i64
        %682 = func.call @cc_cons(%681, %640) : (i64, i64) -> i64
        %683 = func.call @cc_cons(%656, %682) : (i64, i64) -> i64
        %684 = func.call @cc_and(%683) : (i64) -> i64
        func.call @stack_push_pointer(%684) : (i64) -> ()
        %685 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%594) : (i64) -> ()
        func.call @stack_push_pointer(%598) : (i64) -> ()
        func.call @stack_push_pointer(%614) : (i64) -> ()
        func.call @stack_push_pointer(%639) : (i64) -> ()
        func.call @stack_push_pointer(%685) : (i64) -> ()
        %686 = llvm.mlir.addressof @str57 : !llvm.ptr
        %687 = func.call @cc_make_function_ref_const(%686) : (!llvm.ptr) -> i64
        %688 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%687, %688) : (i64, i64) -> ()
        %689 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %689 : i64
      }
      func.call @stack_push_pointer(%592) : (i64) -> ()
      %690 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %690 : i64
    }
    func.call @stack_push_pointer(%68) : (i64) -> ()
    %691 = func.call @stack_pop_pointer() : () -> i64
    %692 = func.call @cc_multiple_value_list(%691) : (i64) -> i64
    %693 = llvm.mlir.addressof @str58 : !llvm.ptr
    %694 = arith.constant 38 : i64
    %695 = func.call @cc_make_string(%693, %694) : (!llvm.ptr, i64) -> i64
    %696 = func.call @cc_nil_value() : () -> i64
    %697 = func.call @cc_intern(%695, %696) : (i64, i64) -> i64
    %698 = func.call @cc_nil_value() : () -> i64
    %699 = func.call @cc_cons(%697, %698) : (i64, i64) -> i64
    %700 = func.call @cc_values_pack(%699) : (i64) -> i64
    %701 = func.call @cc_symbol_value(%697) : (i64) -> i64
    %702 = llvm.mlir.addressof @str59 : !llvm.ptr
    %703 = arith.constant 40 : i64
    %704 = func.call @cc_make_string(%702, %703) : (!llvm.ptr, i64) -> i64
    %705 = func.call @cc_nil_value() : () -> i64
    %706 = func.call @cc_intern(%704, %705) : (i64, i64) -> i64
    %707 = func.call @cc_nil_value() : () -> i64
    %708 = func.call @cc_cons(%706, %707) : (i64, i64) -> i64
    %709 = func.call @cc_values_pack(%708) : (i64) -> i64
    %710 = func.call @cc_symbol_value(%706) : (i64) -> i64
    %711 = func.call @cc_nil_value() : () -> i64
    %712 = arith.cmpi ne, %701, %711 : i64
    %713 = scf.if %712 -> (i64) {
      scf.yield %710 : i64
    } else {
      scf.yield %692 : i64
    }
    %714 = func.call @cc_values_pack(%713) : (i64) -> i64
    func.call @stack_push_pointer(%714) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_252112499900417"() {
    %166 = func.call @stack_pop_pointer() : () -> i64
    %167 = func.call @stack_pop_pointer() : () -> i64
    %168 = func.call @cc_nil_value() : () -> i64
    %169 = func.call @cc_nil_value() : () -> i64
    %170 = func.call @cc_errorp(%168) : (i64) -> i64
    %171 = arith.cmpi ne, %170, %169 : i64
    %172 = scf.if %171 -> (i64) {
      scf.yield %168 : i64
    } else {
      %173 = llvm.mlir.addressof @str6 : !llvm.ptr
      %174 = arith.constant 9 : i64
      %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_intern(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_nil_value() : () -> i64
      %179 = func.call @cc_cons(%177, %178) : (i64, i64) -> i64
      %180 = func.call @cc_values_pack(%179) : (i64) -> i64
      %181 = llvm.mlir.addressof @str7 : !llvm.ptr
      %182 = arith.constant 13 : i64
      %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_intern(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_values_pack(%187) : (i64) -> i64
      %189 = llvm.mlir.addressof @str8 : !llvm.ptr
      %190 = arith.constant 12 : i64
      %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
      %192 = func.call @cc_nil_value() : () -> i64
      %193 = func.call @cc_intern(%191, %192) : (i64, i64) -> i64
      %194 = func.call @cc_nil_value() : () -> i64
      %195 = func.call @cc_cons(%193, %194) : (i64, i64) -> i64
      %196 = func.call @cc_values_pack(%195) : (i64) -> i64
      %197 = llvm.mlir.addressof @str9 : !llvm.ptr
      %198 = arith.constant 12 : i64
      %199 = func.call @cc_make_string(%197, %198) : (!llvm.ptr, i64) -> i64
      %200 = func.call @cc_nil_value() : () -> i64
      %201 = func.call @cc_intern(%199, %200) : (i64, i64) -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
      %204 = func.call @cc_values_pack(%203) : (i64) -> i64
      %205 = llvm.mlir.addressof @str10 : !llvm.ptr
      %206 = arith.constant 14 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_intern(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_cons(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_values_pack(%211) : (i64) -> i64
      %213 = llvm.mlir.addressof @str11 : !llvm.ptr
      %214 = arith.constant 14 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_intern(%215, %216) : (i64, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_cons(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_values_pack(%219) : (i64) -> i64
      %221 = llvm.mlir.addressof @str12 : !llvm.ptr
      %222 = arith.constant 14 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = func.call @cc_nil_value() : () -> i64
      %225 = func.call @cc_intern(%223, %224) : (i64, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_cons(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_values_pack(%227) : (i64) -> i64
      %229 = llvm.mlir.addressof @str13 : !llvm.ptr
      %230 = arith.constant 14 : i64
      %231 = func.call @cc_make_string(%229, %230) : (!llvm.ptr, i64) -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_intern(%231, %232) : (i64, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_cons(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_values_pack(%235) : (i64) -> i64
      %237 = llvm.mlir.addressof @str14 : !llvm.ptr
      %238 = arith.constant 13 : i64
      %239 = func.call @cc_make_string(%237, %238) : (!llvm.ptr, i64) -> i64
      %240 = func.call @cc_nil_value() : () -> i64
      %241 = func.call @cc_intern(%239, %240) : (i64, i64) -> i64
      %242 = func.call @cc_nil_value() : () -> i64
      %243 = func.call @cc_cons(%241, %242) : (i64, i64) -> i64
      %244 = func.call @cc_values_pack(%243) : (i64) -> i64
      %245 = llvm.mlir.addressof @str15 : !llvm.ptr
      %246 = arith.constant 13 : i64
      %247 = func.call @cc_make_string(%245, %246) : (!llvm.ptr, i64) -> i64
      %248 = func.call @cc_nil_value() : () -> i64
      %249 = func.call @cc_intern(%247, %248) : (i64, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_cons(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_values_pack(%251) : (i64) -> i64
      %253 = llvm.mlir.addressof @str16 : !llvm.ptr
      %254 = arith.constant 19 : i64
      %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_intern(%255, %256) : (i64, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_values_pack(%259) : (i64) -> i64
      %261 = llvm.mlir.addressof @str17 : !llvm.ptr
      %262 = arith.constant 23 : i64
      %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_intern(%263, %264) : (i64, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      %269 = llvm.mlir.addressof @str18 : !llvm.ptr
      %270 = arith.constant 14 : i64
      %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = func.call @cc_intern(%271, %272) : (i64, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_cons(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_values_pack(%275) : (i64) -> i64
      %277 = llvm.mlir.addressof @str19 : !llvm.ptr
      %278 = arith.constant 13 : i64
      %279 = func.call @cc_make_string(%277, %278) : (!llvm.ptr, i64) -> i64
      %280 = func.call @cc_nil_value() : () -> i64
      %281 = func.call @cc_intern(%279, %280) : (i64, i64) -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = func.call @cc_cons(%281, %282) : (i64, i64) -> i64
      %284 = func.call @cc_values_pack(%283) : (i64) -> i64
      %285 = llvm.mlir.addressof @str20 : !llvm.ptr
      %286 = arith.constant 16 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_intern(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_values_pack(%291) : (i64) -> i64
      %293 = llvm.mlir.addressof @str21 : !llvm.ptr
      %294 = arith.constant 20 : i64
      %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
      %296 = func.call @cc_nil_value() : () -> i64
      %297 = func.call @cc_intern(%295, %296) : (i64, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_cons(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_values_pack(%299) : (i64) -> i64
      %301 = llvm.mlir.addressof @str22 : !llvm.ptr
      %302 = arith.constant 11 : i64
      %303 = func.call @cc_make_string(%301, %302) : (!llvm.ptr, i64) -> i64
      %304 = func.call @cc_nil_value() : () -> i64
      %305 = func.call @cc_intern(%303, %304) : (i64, i64) -> i64
      %306 = func.call @cc_nil_value() : () -> i64
      %307 = func.call @cc_cons(%305, %306) : (i64, i64) -> i64
      %308 = func.call @cc_values_pack(%307) : (i64) -> i64
      %309 = llvm.mlir.addressof @str23 : !llvm.ptr
      %310 = arith.constant 27 : i64
      %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_intern(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_nil_value() : () -> i64
      %315 = func.call @cc_cons(%313, %314) : (i64, i64) -> i64
      %316 = func.call @cc_values_pack(%315) : (i64) -> i64
      %317 = llvm.mlir.addressof @str24 : !llvm.ptr
      %318 = arith.constant 11 : i64
      %319 = func.call @cc_make_string(%317, %318) : (!llvm.ptr, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_intern(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_nil_value() : () -> i64
      %323 = func.call @cc_cons(%321, %322) : (i64, i64) -> i64
      %324 = func.call @cc_values_pack(%323) : (i64) -> i64
      %325 = llvm.mlir.addressof @str25 : !llvm.ptr
      %326 = arith.constant 15 : i64
      %327 = func.call @cc_make_string(%325, %326) : (!llvm.ptr, i64) -> i64
      %328 = func.call @cc_nil_value() : () -> i64
      %329 = func.call @cc_intern(%327, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      %333 = llvm.mlir.addressof @str26 : !llvm.ptr
      %334 = arith.constant 11 : i64
      %335 = func.call @cc_make_string(%333, %334) : (!llvm.ptr, i64) -> i64
      %336 = func.call @cc_nil_value() : () -> i64
      %337 = func.call @cc_intern(%335, %336) : (i64, i64) -> i64
      %338 = func.call @cc_nil_value() : () -> i64
      %339 = func.call @cc_cons(%337, %338) : (i64, i64) -> i64
      %340 = func.call @cc_values_pack(%339) : (i64) -> i64
      %341 = llvm.mlir.addressof @str27 : !llvm.ptr
      %342 = arith.constant 16 : i64
      %343 = func.call @cc_make_string(%341, %342) : (!llvm.ptr, i64) -> i64
      %344 = func.call @cc_nil_value() : () -> i64
      %345 = func.call @cc_intern(%343, %344) : (i64, i64) -> i64
      %346 = func.call @cc_nil_value() : () -> i64
      %347 = func.call @cc_cons(%345, %346) : (i64, i64) -> i64
      %348 = func.call @cc_values_pack(%347) : (i64) -> i64
      %349 = func.call @cc_t_value() : () -> i64
      %350 = arith.constant 10 : i64
      %351 = func.call @cc_box_fixnum(%350) : (i64) -> i64
      %352 = llvm.mlir.addressof @str28 : !llvm.ptr
      %353 = arith.constant 6 : i64
      %354 = func.call @cc_make_string(%352, %353) : (!llvm.ptr, i64) -> i64
      %355 = llvm.mlir.addressof @str29 : !llvm.ptr
      %356 = arith.constant 7 : i64
      %357 = func.call @cc_make_string(%355, %356) : (!llvm.ptr, i64) -> i64
      %358 = func.call @cc_intern(%354, %357) : (i64, i64) -> i64
      %359 = func.call @cc_nil_value() : () -> i64
      %360 = func.call @cc_cons(%358, %359) : (i64, i64) -> i64
      %361 = func.call @cc_values_pack(%360) : (i64) -> i64
      %362 = func.call @cc_nil_value() : () -> i64
      %363 = func.call @cc_t_value() : () -> i64
      %364 = func.call @cc_t_value() : () -> i64
      %365 = func.call @cc_nil_value() : () -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_nil_value() : () -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_nil_value() : () -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_nil_value() : () -> i64
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = arith.constant 10 : i64
      %375 = func.call @cc_box_fixnum(%374) : (i64) -> i64
      %376 = llvm.mlir.addressof @str30 : !llvm.ptr
      %377 = arith.constant 12 : i64
      %378 = func.call @cc_make_string(%376, %377) : (!llvm.ptr, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_intern(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_nil_value() : () -> i64
      %382 = func.call @cc_cons(%380, %381) : (i64, i64) -> i64
      %383 = func.call @cc_values_pack(%382) : (i64) -> i64
      %384 = func.call @cc_t_value() : () -> i64
      %385 = func.call @cc_nil_value() : () -> i64
      %386 = llvm.mlir.addressof @str31 : !llvm.ptr
      %387 = arith.constant 20 : i64
      %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
      %389 = llvm.mlir.addressof @str32 : !llvm.ptr
      %390 = arith.constant 16 : i64
      %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
      %392 = func.call @cc_intern(%388, %391) : (i64, i64) -> i64
      %393 = func.call @cc_nil_value() : () -> i64
      %394 = func.call @cc_cons(%392, %393) : (i64, i64) -> i64
      %395 = func.call @cc_values_pack(%394) : (i64) -> i64
      %396 = func.call @cc_nil_value() : () -> i64
      %397 = func.call @cc_cons(%337, %396) : (i64, i64) -> i64
      %398 = func.call @cc_cons(%329, %397) : (i64, i64) -> i64
      %399 = func.call @cc_cons(%321, %398) : (i64, i64) -> i64
      %400 = func.call @cc_cons(%313, %399) : (i64, i64) -> i64
      %401 = func.call @cc_cons(%305, %400) : (i64, i64) -> i64
      %402 = func.call @cc_cons(%297, %401) : (i64, i64) -> i64
      %403 = func.call @cc_cons(%289, %402) : (i64, i64) -> i64
      %404 = func.call @cc_cons(%281, %403) : (i64, i64) -> i64
      %405 = func.call @cc_cons(%273, %404) : (i64, i64) -> i64
      %406 = func.call @cc_cons(%265, %405) : (i64, i64) -> i64
      %407 = func.call @cc_cons(%257, %406) : (i64, i64) -> i64
      %408 = func.call @cc_cons(%249, %407) : (i64, i64) -> i64
      %409 = func.call @cc_cons(%241, %408) : (i64, i64) -> i64
      %410 = func.call @cc_cons(%233, %409) : (i64, i64) -> i64
      %411 = func.call @cc_cons(%225, %410) : (i64, i64) -> i64
      %412 = func.call @cc_cons(%217, %411) : (i64, i64) -> i64
      %413 = func.call @cc_cons(%209, %412) : (i64, i64) -> i64
      %414 = func.call @cc_cons(%201, %413) : (i64, i64) -> i64
      %415 = func.call @cc_cons(%193, %414) : (i64, i64) -> i64
      %416 = func.call @cc_cons(%185, %415) : (i64, i64) -> i64
      %417 = func.call @cc_cons(%177, %416) : (i64, i64) -> i64
      %418 = func.call @cc_nil_value() : () -> i64
      %419 = func.call @cc_cons(%392, %418) : (i64, i64) -> i64
      %420 = func.call @cc_cons(%385, %419) : (i64, i64) -> i64
      %421 = func.call @cc_cons(%384, %420) : (i64, i64) -> i64
      %422 = func.call @cc_cons(%380, %421) : (i64, i64) -> i64
      %423 = func.call @cc_cons(%375, %422) : (i64, i64) -> i64
      %424 = func.call @cc_cons(%373, %423) : (i64, i64) -> i64
      %425 = func.call @cc_cons(%372, %424) : (i64, i64) -> i64
      %426 = func.call @cc_cons(%371, %425) : (i64, i64) -> i64
      %427 = func.call @cc_cons(%370, %426) : (i64, i64) -> i64
      %428 = func.call @cc_cons(%369, %427) : (i64, i64) -> i64
      %429 = func.call @cc_cons(%368, %428) : (i64, i64) -> i64
      %430 = func.call @cc_cons(%367, %429) : (i64, i64) -> i64
      %431 = func.call @cc_cons(%366, %430) : (i64, i64) -> i64
      %432 = func.call @cc_cons(%365, %431) : (i64, i64) -> i64
      %433 = func.call @cc_cons(%364, %432) : (i64, i64) -> i64
      %434 = func.call @cc_cons(%363, %433) : (i64, i64) -> i64
      %435 = func.call @cc_cons(%362, %434) : (i64, i64) -> i64
      %436 = func.call @cc_cons(%358, %435) : (i64, i64) -> i64
      %437 = func.call @cc_cons(%351, %436) : (i64, i64) -> i64
      %438 = func.call @cc_cons(%349, %437) : (i64, i64) -> i64
      %439 = func.call @cc_cons(%345, %438) : (i64, i64) -> i64
      %440 = llvm.mlir.addressof @str33 : !llvm.ptr
      %441 = arith.constant 12 : i64
      %442 = func.call @cc_make_string(%440, %441) : (!llvm.ptr, i64) -> i64
      %443 = func.call @cc_nil_value() : () -> i64
      %444 = func.call @cc_intern(%442, %443) : (i64, i64) -> i64
      %445 = func.call @cc_nil_value() : () -> i64
      %446 = func.call @cc_cons(%444, %445) : (i64, i64) -> i64
      %447 = func.call @cc_values_pack(%446) : (i64) -> i64
      func.call @stack_push_pointer(%417) : (i64) -> ()
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %448 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%444, %448) : (i64, i64) -> ()
      %449 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %450 = func.call @stack_pop_pointer() : () -> i64
      %451 = func.call @cc_nil_value() : () -> i64
      %452 = func.call @cc_errorp(%450) : (i64) -> i64
      %453 = arith.cmpi ne, %452, %451 : i64
      %454 = arith.cmpi eq, %451, %451 : i64
      %455 = arith.andi %453, %454 : i1
      %456 = scf.if %455 -> (i64) {
        scf.yield %450 : i64
      } else {
        scf.yield %451 : i64
      }
      %457 = arith.cmpi ne, %456, %451 : i64
      scf.if %457 {
        func.call @stack_push_pointer(%456) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%450) : (i64) -> ()
        %458 = llvm.mlir.addressof @str34 : !llvm.ptr
        %459 = func.call @cc_make_function_ref_const(%458) : (!llvm.ptr) -> i64
        %460 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%459, %460) : (i64, i64) -> ()
      }
      %461 = func.call @stack_pop_pointer() : () -> i64
      %462 = llvm.mlir.addressof @str35 : !llvm.ptr
      %463 = arith.constant 23 : i64
      %464 = func.call @cc_make_symbol(%462, %463) : (!llvm.ptr, i64) -> i64
      %465 = func.call @cc_symbol_value(%464) : (i64) -> i64
      %466 = func.call @cc_set_symbol_value(%464, %461) : (i64, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_nil_value() : () -> i64
      %469 = func.call @cc_errorp(%467) : (i64) -> i64
      %470 = arith.cmpi ne, %469, %468 : i64
      %471 = scf.if %470 -> (i64) {
        scf.yield %467 : i64
      } else {
        %472 = llvm.mlir.addressof @str36 : !llvm.ptr
        %473 = arith.constant 6 : i64
        %474 = func.call @cc_make_string(%472, %473) : (!llvm.ptr, i64) -> i64
        %475 = llvm.mlir.addressof @str37 : !llvm.ptr
        %476 = arith.constant 11 : i64
        %477 = func.call @cc_make_string(%475, %476) : (!llvm.ptr, i64) -> i64
        %478 = func.call @cc_intern(%474, %477) : (i64, i64) -> i64
        %479 = func.call @cc_nil_value() : () -> i64
        %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
        %481 = func.call @cc_values_pack(%480) : (i64) -> i64
        func.call @stack_push_pointer(%478) : (i64) -> ()
        %482 = func.call @stack_pop_pointer() : () -> i64
        %483 = func.call @cc_nil_value() : () -> i64
        %484 = llvm.mlir.addressof @str38 : !llvm.ptr
        %485 = arith.constant 1 : i64
        %486 = func.call @cc_make_string(%484, %485) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%486) : (i64) -> ()
        %487 = func.call @stack_pop_pointer() : () -> i64
        %488 = func.call @cc_cons(%487, %483) : (i64, i64) -> i64
        func.call @stack_push_pointer(%166) : (i64) -> ()
        %489 = func.call @stack_pop_pointer() : () -> i64
        %490 = func.call @cc_string(%489) : (i64) -> i64
        func.call @stack_push_pointer(%490) : (i64) -> ()
        %491 = func.call @stack_pop_pointer() : () -> i64
        %492 = func.call @cc_cons(%491, %488) : (i64, i64) -> i64
        %493 = func.call @cc_concatenate(%482, %492) : (i64, i64) -> i64
        func.call @stack_push_pointer(%493) : (i64) -> ()
        %494 = func.call @stack_pop_pointer() : () -> i64
        %495 = func.call @cc_nil_value() : () -> i64
        %496 = func.call @cc_errorp(%494) : (i64) -> i64
        %497 = arith.cmpi ne, %496, %495 : i64
        %498 = arith.cmpi eq, %495, %495 : i64
        %499 = arith.andi %497, %498 : i1
        %500 = scf.if %499 -> (i64) {
          scf.yield %494 : i64
        } else {
          scf.yield %495 : i64
        }
        %501 = arith.cmpi ne, %500, %495 : i64
        scf.if %501 {
          func.call @stack_push_pointer(%500) : (i64) -> ()
        } else {
          %502 = func.call @cc_nil_value() : () -> i64
          %503 = func.call @cc_cons(%494, %502) : (i64, i64) -> i64
          func.call @stack_push_pointer(%503) : (i64) -> ()
          func.call @cc_read_from_string_stack() : () -> ()
        }
        %504 = func.call @stack_pop_pointer() : () -> i64
        %505 = func.call @cc_errorp(%504) : (i64) -> i64
        %506 = func.call @cc_nil_value() : () -> i64
        %507 = arith.cmpi ne, %505, %506 : i64
        %508 = scf.if %507 -> (i64) {
          %509 = func.call @cc_condition_value(%504) : (i64) -> i64
          %510 = llvm.mlir.addressof @str39 : !llvm.ptr
          %511 = arith.constant 12 : i64
          %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
          %513 = llvm.mlir.addressof @str40 : !llvm.ptr
          %514 = arith.constant 11 : i64
          %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
          %516 = func.call @cc_intern(%512, %515) : (i64, i64) -> i64
          %517 = func.call @cc_nil_value() : () -> i64
          %518 = func.call @cc_cons(%516, %517) : (i64, i64) -> i64
          %519 = func.call @cc_values_pack(%518) : (i64) -> i64
          func.call @stack_push_pointer(%516) : (i64) -> ()
          %520 = func.call @stack_pop_pointer() : () -> i64
          %521 = func.call @cc_typep(%509, %520) : (i64, i64) -> i64
          %522 = func.call @cc_nil_value() : () -> i64
          %523 = arith.cmpi ne, %521, %522 : i64
          %524 = scf.if %523 -> (i64) {
            func.call @stack_push_pointer(%509) : (i64) -> ()
            %525 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %525 : i64
          } else {
            scf.yield %504 : i64
          }
          scf.yield %524 : i64
        } else {
          scf.yield %504 : i64
        }
        func.call @stack_push_pointer(%508) : (i64) -> ()
        %526 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %526 : i64
      }
      func.call @stack_push_pointer(%471) : (i64) -> ()
      %527 = func.call @cc_restore_symbol_value(%464, %465) : (i64, i64) -> i64
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @cc_nil_value() : () -> i64
      %530 = func.call @cc_errorp(%528) : (i64) -> i64
      %531 = arith.cmpi ne, %530, %529 : i64
      %532 = scf.if %531 -> (i64) {
        scf.yield %528 : i64
      } else {
        %533 = func.call @cc_multiple_value_list(%528) : (i64) -> i64
        scf.yield %533 : i64
      }
      %534 = llvm.mlir.addressof @str41 : !llvm.ptr
      %535 = arith.constant 11 : i64
      %536 = func.call @cc_make_string(%534, %535) : (!llvm.ptr, i64) -> i64
      %537 = func.call @cc_nil_value() : () -> i64
      %538 = func.call @cc_intern(%536, %537) : (i64, i64) -> i64
      %539 = func.call @cc_nil_value() : () -> i64
      %540 = func.call @cc_cons(%538, %539) : (i64, i64) -> i64
      %541 = func.call @cc_values_pack(%540) : (i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %542 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%538, %542) : (i64, i64) -> ()
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = scf.if %531 -> (i64) {
        scf.yield %532 : i64
      } else {
        %545 = func.call @cc_values_pack(%532) : (i64) -> i64
        scf.yield %545 : i64
      }
      func.call @stack_push_pointer(%544) : (i64) -> ()
      %546 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %546 : i64
    }
    func.call @stack_push_pointer(%172) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_252112499900416*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_252112499900416*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_252112499900416*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str5("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str6("*PACKAGE*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str7("*PRINT-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str8("*PRINT-BASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str9("*PRINT-CASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str10("*PRINT-CIRCLE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str11("*PRINT-ESCAPE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str12("*PRINT-GENSYM*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str13("*PRINT-LENGTH*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str14("*PRINT-LEVEL*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str15("*PRINT-LINES*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str16("*PRINT-MISER-WIDTH*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str17("*PRINT-PPRINT-DISPATCH*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str18("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str19("*PRINT-RADIX*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str20("*PRINT-READABLY*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str21("*PRINT-RIGHT-MARGIN*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str22("*READ-BASE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("*READ-DEFAULT-FLOAT-FORMAT*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str24("*READ-EVAL*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("*READ-SUPPRESS*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str26("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP-USER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str28("UPCASE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str29("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str31("__RLASP_READTABLE__0\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP-USER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str33("%%PROGV-PUSH\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str34("COPY-READTABLE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str35("COMMON-LISP:*READTABLE*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str36("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str37("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str38("Z\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str39("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("%%PROGV-POP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("#:%%DYN-CELL-252112499900418-E\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str43("MAPCAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str44("result=~s~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("first-type=~s eighth-type=~s and=~s~%\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str47("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str53("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str55("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str56("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETFLAG_252112499900416*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETMVLIST_252112499900416*\00") : !llvm.array<41 x i8>
}
