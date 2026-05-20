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
      %43 = arith.constant 11 : i64
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
      %57 = llvm.mlir.addressof @str5 : !llvm.ptr
      %58 = arith.constant 31 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 3 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = func.call @cc_nil_value() : () -> i64
      %70 = func.call @cc_intern(%68, %69) : (i64, i64) -> i64
      %71 = func.call @cc_nil_value() : () -> i64
      %72 = func.call @cc_cons(%70, %71) : (i64, i64) -> i64
      %73 = func.call @cc_values_pack(%72) : (i64) -> i64
      func.call @stack_push_pointer(%70) : (i64) -> ()
      %74 = llvm.mlir.addressof @str7 : !llvm.ptr
      %75 = arith.constant 3 : i64
      %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
      %77 = func.call @cc_nil_value() : () -> i64
      %78 = func.call @cc_intern(%76, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %82 = llvm.mlir.addressof @str8 : !llvm.ptr
      %83 = arith.constant 3 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = func.call @cc_nil_value() : () -> i64
      %86 = func.call @cc_intern(%84, %85) : (i64, i64) -> i64
      %87 = func.call @cc_nil_value() : () -> i64
      %88 = func.call @cc_cons(%86, %87) : (i64, i64) -> i64
      %89 = func.call @cc_values_pack(%88) : (i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %90 = llvm.mlir.addressof @str9 : !llvm.ptr
      %91 = arith.constant 6 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_intern(%92, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %98 = llvm.mlir.addressof @str10 : !llvm.ptr
      %99 = arith.constant 3 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = func.call @cc_nil_value() : () -> i64
      %102 = func.call @cc_intern(%100, %101) : (i64, i64) -> i64
      %103 = func.call @cc_nil_value() : () -> i64
      %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
      %105 = func.call @cc_values_pack(%104) : (i64) -> i64
      func.call @stack_push_pointer(%102) : (i64) -> ()
      %106 = llvm.mlir.addressof @str11 : !llvm.ptr
      %107 = arith.constant 5 : i64
      %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = func.call @cc_intern(%108, %109) : (i64, i64) -> i64
      %111 = func.call @cc_nil_value() : () -> i64
      %112 = func.call @cc_cons(%110, %111) : (i64, i64) -> i64
      %113 = func.call @cc_values_pack(%112) : (i64) -> i64
      func.call @stack_push_pointer(%110) : (i64) -> ()
      %114 = llvm.mlir.addressof @str12 : !llvm.ptr
      %115 = arith.constant 4 : i64
      %116 = func.call @cc_make_string(%114, %115) : (!llvm.ptr, i64) -> i64
      %117 = llvm.mlir.addressof @str13 : !llvm.ptr
      %118 = arith.constant 11 : i64
      %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
      %120 = func.call @cc_intern(%116, %119) : (i64, i64) -> i64
      %121 = func.call @cc_nil_value() : () -> i64
      %122 = func.call @cc_cons(%120, %121) : (i64, i64) -> i64
      %123 = func.call @cc_values_pack(%122) : (i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %124 = arith.constant 8 : i64
      %125 = func.call @cc_box_character(%124) : (i64) -> i64
      func.call @stack_push_pointer(%125) : (i64) -> ()
      %126 = arith.constant 9 : i64
      %127 = func.call @cc_box_character(%126) : (i64) -> i64
      func.call @stack_push_pointer(%127) : (i64) -> ()
      %128 = arith.constant 10 : i64
      %129 = func.call @cc_box_character(%128) : (i64) -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      %130 = arith.constant 10 : i64
      %131 = func.call @cc_box_character(%130) : (i64) -> i64
      func.call @stack_push_pointer(%131) : (i64) -> ()
      %132 = arith.constant 12 : i64
      %133 = func.call @cc_box_character(%132) : (i64) -> i64
      func.call @stack_push_pointer(%133) : (i64) -> ()
      %134 = arith.constant 13 : i64
      %135 = func.call @cc_box_character(%134) : (i64) -> i64
      func.call @stack_push_pointer(%135) : (i64) -> ()
      %136 = arith.constant 32 : i64
      %137 = func.call @cc_box_character(%136) : (i64) -> i64
      func.call @stack_push_pointer(%137) : (i64) -> ()
      %138 = arith.constant 127 : i64
      %139 = func.call @cc_box_character(%138) : (i64) -> i64
      func.call @stack_push_pointer(%139) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %140 = func.call @stack_pop_pointer() : () -> i64
      %141 = func.call @stack_pop_pointer() : () -> i64
      %142 = func.call @cc_cons(%141, %140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%142) : (i64) -> ()
      %143 = func.call @stack_pop_pointer() : () -> i64
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @cc_cons(%144, %143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%145) : (i64) -> ()
      %146 = func.call @stack_pop_pointer() : () -> i64
      %147 = func.call @stack_pop_pointer() : () -> i64
      %148 = func.call @cc_cons(%147, %146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%148) : (i64) -> ()
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = func.call @stack_pop_pointer() : () -> i64
      %151 = func.call @cc_cons(%150, %149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%151) : (i64) -> ()
      %152 = func.call @stack_pop_pointer() : () -> i64
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @cc_cons(%153, %152) : (i64, i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      %155 = func.call @stack_pop_pointer() : () -> i64
      %156 = func.call @stack_pop_pointer() : () -> i64
      %157 = func.call @cc_cons(%156, %155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%157) : (i64) -> ()
      %158 = func.call @stack_pop_pointer() : () -> i64
      %159 = func.call @stack_pop_pointer() : () -> i64
      %160 = func.call @cc_cons(%159, %158) : (i64, i64) -> i64
      func.call @stack_push_pointer(%160) : (i64) -> ()
      %161 = func.call @stack_pop_pointer() : () -> i64
      %162 = func.call @stack_pop_pointer() : () -> i64
      %163 = func.call @cc_cons(%162, %161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%163) : (i64) -> ()
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @cc_cons(%165, %164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @cc_cons(%171, %170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%172) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %173 = func.call @stack_pop_pointer() : () -> i64
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @cc_cons(%174, %173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      %176 = llvm.mlir.addressof @str14 : !llvm.ptr
      %177 = arith.constant 6 : i64
      %178 = func.call @cc_make_string(%176, %177) : (!llvm.ptr, i64) -> i64
      %179 = llvm.mlir.addressof @str15 : !llvm.ptr
      %180 = arith.constant 11 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = func.call @cc_intern(%178, %181) : (i64, i64) -> i64
      %183 = func.call @cc_nil_value() : () -> i64
      %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
      %185 = func.call @cc_values_pack(%184) : (i64) -> i64
      func.call @stack_push_pointer(%182) : (i64) -> ()
      %186 = llvm.mlir.addressof @str16 : !llvm.ptr
      %187 = arith.constant 8 : i64
      %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
      %189 = llvm.mlir.addressof @str17 : !llvm.ptr
      %190 = arith.constant 11 : i64
      %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
      %192 = func.call @cc_intern(%188, %191) : (i64, i64) -> i64
      %193 = func.call @cc_nil_value() : () -> i64
      %194 = func.call @cc_cons(%192, %193) : (i64, i64) -> i64
      %195 = func.call @cc_values_pack(%194) : (i64) -> i64
      func.call @stack_push_pointer(%192) : (i64) -> ()
      %196 = llvm.mlir.addressof @str18 : !llvm.ptr
      %197 = arith.constant 6 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_intern(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_nil_value() : () -> i64
      %202 = func.call @cc_cons(%200, %201) : (i64, i64) -> i64
      %203 = func.call @cc_values_pack(%202) : (i64) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      %204 = llvm.mlir.addressof @str19 : !llvm.ptr
      %205 = arith.constant 1 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = func.call @cc_nil_value() : () -> i64
      %208 = func.call @cc_intern(%206, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%214) : (i64) -> ()
      %215 = llvm.mlir.addressof @str20 : !llvm.ptr
      %216 = arith.constant 23 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = llvm.mlir.addressof @str21 : !llvm.ptr
      %219 = arith.constant 11 : i64
      %220 = func.call @cc_make_string(%218, %219) : (!llvm.ptr, i64) -> i64
      %221 = func.call @cc_intern(%217, %220) : (i64, i64) -> i64
      %222 = func.call @cc_nil_value() : () -> i64
      %223 = func.call @cc_cons(%221, %222) : (i64, i64) -> i64
      %224 = func.call @cc_values_pack(%223) : (i64) -> i64
      func.call @stack_push_pointer(%221) : (i64) -> ()
      %225 = llvm.mlir.addressof @str22 : !llvm.ptr
      %226 = arith.constant 3 : i64
      %227 = func.call @cc_make_string(%225, %226) : (!llvm.ptr, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_intern(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %233 = llvm.mlir.addressof @str23 : !llvm.ptr
      %234 = arith.constant 11 : i64
      %235 = func.call @cc_make_string(%233, %234) : (!llvm.ptr, i64) -> i64
      %236 = llvm.mlir.addressof @str24 : !llvm.ptr
      %237 = arith.constant 11 : i64
      %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
      %239 = func.call @cc_intern(%235, %238) : (i64, i64) -> i64
      %240 = func.call @cc_nil_value() : () -> i64
      %241 = func.call @cc_cons(%239, %240) : (i64, i64) -> i64
      %242 = func.call @cc_values_pack(%241) : (i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %243 = llvm.mlir.addressof @str25 : !llvm.ptr
      %244 = arith.constant 14 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = llvm.mlir.addressof @str26 : !llvm.ptr
      %247 = arith.constant 11 : i64
      %248 = func.call @cc_make_string(%246, %247) : (!llvm.ptr, i64) -> i64
      %249 = func.call @cc_intern(%245, %248) : (i64, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_cons(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_values_pack(%251) : (i64) -> i64
      func.call @stack_push_pointer(%249) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %253 = func.call @stack_pop_pointer() : () -> i64
      %254 = func.call @stack_pop_pointer() : () -> i64
      %255 = func.call @cc_cons(%254, %253) : (i64, i64) -> i64
      func.call @stack_push_pointer(%255) : (i64) -> ()
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @stack_pop_pointer() : () -> i64
      %258 = func.call @cc_cons(%257, %256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @cc_cons(%260, %259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%261) : (i64) -> ()
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @stack_pop_pointer() : () -> i64
      %264 = func.call @cc_cons(%263, %262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%264) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @stack_pop_pointer() : () -> i64
      %267 = func.call @cc_cons(%266, %265) : (i64, i64) -> i64
      func.call @stack_push_pointer(%267) : (i64) -> ()
      %268 = llvm.mlir.addressof @str27 : !llvm.ptr
      %269 = arith.constant 12 : i64
      %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
      %271 = llvm.mlir.addressof @str28 : !llvm.ptr
      %272 = arith.constant 11 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      %274 = func.call @cc_intern(%270, %273) : (i64, i64) -> i64
      %275 = func.call @cc_nil_value() : () -> i64
      %276 = func.call @cc_cons(%274, %275) : (i64, i64) -> i64
      %277 = func.call @cc_values_pack(%276) : (i64) -> i64
      func.call @stack_push_pointer(%274) : (i64) -> ()
      %278 = llvm.mlir.addressof @str29 : !llvm.ptr
      %279 = arith.constant 16 : i64
      %280 = func.call @cc_make_string(%278, %279) : (!llvm.ptr, i64) -> i64
      %281 = llvm.mlir.addressof @str30 : !llvm.ptr
      %282 = arith.constant 11 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = func.call @cc_intern(%280, %283) : (i64, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_cons(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_values_pack(%286) : (i64) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      %288 = llvm.mlir.addressof @str31 : !llvm.ptr
      %289 = arith.constant 11 : i64
      %290 = func.call @cc_make_string(%288, %289) : (!llvm.ptr, i64) -> i64
      %291 = llvm.mlir.addressof @str32 : !llvm.ptr
      %292 = arith.constant 11 : i64
      %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
      %294 = func.call @cc_intern(%290, %293) : (i64, i64) -> i64
      %295 = func.call @cc_nil_value() : () -> i64
      %296 = func.call @cc_cons(%294, %295) : (i64, i64) -> i64
      %297 = func.call @cc_values_pack(%296) : (i64) -> i64
      func.call @stack_push_pointer(%294) : (i64) -> ()
      %298 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%298) : (i64) -> ()
      %299 = llvm.mlir.addressof @str33 : !llvm.ptr
      %300 = arith.constant 6 : i64
      %301 = func.call @cc_make_string(%299, %300) : (!llvm.ptr, i64) -> i64
      %302 = llvm.mlir.addressof @str34 : !llvm.ptr
      %303 = arith.constant 11 : i64
      %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
      %305 = func.call @cc_intern(%301, %304) : (i64, i64) -> i64
      %306 = func.call @cc_nil_value() : () -> i64
      %307 = func.call @cc_cons(%305, %306) : (i64, i64) -> i64
      %308 = func.call @cc_values_pack(%307) : (i64) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @stack_pop_pointer() : () -> i64
      %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
      %312 = llvm.mlir.addressof @str35 : !llvm.ptr
      %313 = arith.constant 5 : i64
      %314 = func.call @cc_make_string(%312, %313) : (!llvm.ptr, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_intern(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_nil_value() : () -> i64
      %318 = func.call @cc_cons(%316, %317) : (i64, i64) -> i64
      %319 = func.call @cc_values_pack(%318) : (i64) -> i64
      %320 = func.call @cc_cons(%316, %311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%320) : (i64) -> ()
      %321 = llvm.mlir.addressof @str36 : !llvm.ptr
      %322 = arith.constant 6 : i64
      %323 = func.call @cc_make_string(%321, %322) : (!llvm.ptr, i64) -> i64
      %324 = llvm.mlir.addressof @str37 : !llvm.ptr
      %325 = arith.constant 11 : i64
      %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
      %327 = func.call @cc_intern(%323, %326) : (i64, i64) -> i64
      %328 = func.call @cc_nil_value() : () -> i64
      %329 = func.call @cc_cons(%327, %328) : (i64, i64) -> i64
      %330 = func.call @cc_values_pack(%329) : (i64) -> i64
      func.call @stack_push_pointer(%327) : (i64) -> ()
      %331 = llvm.mlir.addressof @str38 : !llvm.ptr
      %332 = arith.constant 1 : i64
      %333 = func.call @cc_make_string(%331, %332) : (!llvm.ptr, i64) -> i64
      %334 = func.call @cc_nil_value() : () -> i64
      %335 = func.call @cc_intern(%333, %334) : (i64, i64) -> i64
      %336 = func.call @cc_nil_value() : () -> i64
      %337 = func.call @cc_cons(%335, %336) : (i64, i64) -> i64
      %338 = func.call @cc_values_pack(%337) : (i64) -> i64
      func.call @stack_push_pointer(%335) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %339 = func.call @stack_pop_pointer() : () -> i64
      %340 = func.call @stack_pop_pointer() : () -> i64
      %341 = func.call @cc_cons(%340, %339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%341) : (i64) -> ()
      %342 = func.call @stack_pop_pointer() : () -> i64
      %343 = func.call @stack_pop_pointer() : () -> i64
      %344 = func.call @cc_cons(%343, %342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%344) : (i64) -> ()
      %345 = llvm.mlir.addressof @str39 : !llvm.ptr
      %346 = arith.constant 1 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %348 = func.call @stack_pop_pointer() : () -> i64
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = func.call @cc_cons(%349, %348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%350) : (i64) -> ()
      %351 = func.call @stack_pop_pointer() : () -> i64
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @cc_cons(%352, %351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = func.call @cc_cons(%355, %354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%356) : (i64) -> ()
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = func.call @stack_pop_pointer() : () -> i64
      %359 = func.call @cc_cons(%358, %357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @stack_pop_pointer() : () -> i64
      %362 = func.call @cc_cons(%361, %360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%362) : (i64) -> ()
      %363 = func.call @stack_pop_pointer() : () -> i64
      %364 = func.call @stack_pop_pointer() : () -> i64
      %365 = func.call @cc_cons(%364, %363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%365) : (i64) -> ()
      %366 = llvm.mlir.addressof @str40 : !llvm.ptr
      %367 = arith.constant 12 : i64
      %368 = func.call @cc_make_string(%366, %367) : (!llvm.ptr, i64) -> i64
      %369 = llvm.mlir.addressof @str41 : !llvm.ptr
      %370 = arith.constant 11 : i64
      %371 = func.call @cc_make_string(%369, %370) : (!llvm.ptr, i64) -> i64
      %372 = func.call @cc_intern(%368, %371) : (i64, i64) -> i64
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
      %375 = func.call @cc_values_pack(%374) : (i64) -> i64
      func.call @stack_push_pointer(%372) : (i64) -> ()
      %376 = llvm.mlir.addressof @str42 : !llvm.ptr
      %377 = arith.constant 1 : i64
      %378 = func.call @cc_make_string(%376, %377) : (!llvm.ptr, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_intern(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_nil_value() : () -> i64
      %382 = func.call @cc_cons(%380, %381) : (i64, i64) -> i64
      %383 = func.call @cc_values_pack(%382) : (i64) -> i64
      func.call @stack_push_pointer(%380) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %384 = func.call @stack_pop_pointer() : () -> i64
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @cc_cons(%385, %384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%386) : (i64) -> ()
      %387 = llvm.mlir.addressof @str43 : !llvm.ptr
      %388 = arith.constant 1 : i64
      %389 = func.call @cc_make_string(%387, %388) : (!llvm.ptr, i64) -> i64
      %390 = func.call @cc_nil_value() : () -> i64
      %391 = func.call @cc_intern(%389, %390) : (i64, i64) -> i64
      %392 = func.call @cc_nil_value() : () -> i64
      %393 = func.call @cc_cons(%391, %392) : (i64, i64) -> i64
      %394 = func.call @cc_values_pack(%393) : (i64) -> i64
      func.call @stack_push_pointer(%391) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %395 = func.call @stack_pop_pointer() : () -> i64
      %396 = func.call @stack_pop_pointer() : () -> i64
      %397 = func.call @cc_cons(%396, %395) : (i64, i64) -> i64
      func.call @stack_push_pointer(%397) : (i64) -> ()
      %398 = func.call @stack_pop_pointer() : () -> i64
      %399 = func.call @stack_pop_pointer() : () -> i64
      %400 = func.call @cc_cons(%399, %398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%400) : (i64) -> ()
      %401 = func.call @stack_pop_pointer() : () -> i64
      %402 = func.call @stack_pop_pointer() : () -> i64
      %403 = func.call @cc_cons(%402, %401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %404 = func.call @stack_pop_pointer() : () -> i64
      %405 = func.call @stack_pop_pointer() : () -> i64
      %406 = func.call @cc_cons(%405, %404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%406) : (i64) -> ()
      %407 = func.call @stack_pop_pointer() : () -> i64
      %408 = func.call @stack_pop_pointer() : () -> i64
      %409 = func.call @cc_cons(%408, %407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%409) : (i64) -> ()
      %410 = func.call @stack_pop_pointer() : () -> i64
      %411 = func.call @stack_pop_pointer() : () -> i64
      %412 = func.call @cc_cons(%411, %410) : (i64, i64) -> i64
      func.call @stack_push_pointer(%412) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %413 = func.call @stack_pop_pointer() : () -> i64
      %414 = func.call @stack_pop_pointer() : () -> i64
      %415 = func.call @cc_cons(%414, %413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%415) : (i64) -> ()
      %416 = func.call @stack_pop_pointer() : () -> i64
      %417 = func.call @stack_pop_pointer() : () -> i64
      %418 = func.call @cc_cons(%417, %416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%418) : (i64) -> ()
      %419 = func.call @stack_pop_pointer() : () -> i64
      %420 = func.call @stack_pop_pointer() : () -> i64
      %421 = func.call @cc_cons(%420, %419) : (i64, i64) -> i64
      func.call @stack_push_pointer(%421) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %422 = func.call @stack_pop_pointer() : () -> i64
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @cc_cons(%423, %422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%424) : (i64) -> ()
      %425 = func.call @stack_pop_pointer() : () -> i64
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @cc_cons(%426, %425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_cons(%429, %428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%430) : (i64) -> ()
      %431 = func.call @stack_pop_pointer() : () -> i64
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @cc_cons(%432, %431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%433) : (i64) -> ()
      %434 = func.call @stack_pop_pointer() : () -> i64
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_cons(%435, %434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %437 = func.call @stack_pop_pointer() : () -> i64
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @cc_cons(%438, %437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %440 = func.call @stack_pop_pointer() : () -> i64
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @cc_cons(%441, %440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%442) : (i64) -> ()
      %443 = llvm.mlir.addressof @str44 : !llvm.ptr
      %444 = arith.constant 5 : i64
      %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
      %446 = func.call @cc_nil_value() : () -> i64
      %447 = func.call @cc_intern(%445, %446) : (i64, i64) -> i64
      %448 = func.call @cc_nil_value() : () -> i64
      %449 = func.call @cc_cons(%447, %448) : (i64, i64) -> i64
      %450 = func.call @cc_values_pack(%449) : (i64) -> i64
      func.call @stack_push_pointer(%447) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %451 = func.call @stack_pop_pointer() : () -> i64
      %452 = func.call @stack_pop_pointer() : () -> i64
      %453 = func.call @cc_cons(%452, %451) : (i64, i64) -> i64
      func.call @stack_push_pointer(%453) : (i64) -> ()
      %454 = func.call @stack_pop_pointer() : () -> i64
      %455 = func.call @stack_pop_pointer() : () -> i64
      %456 = func.call @cc_cons(%455, %454) : (i64, i64) -> i64
      func.call @stack_push_pointer(%456) : (i64) -> ()
      %457 = func.call @stack_pop_pointer() : () -> i64
      %458 = func.call @stack_pop_pointer() : () -> i64
      %459 = func.call @cc_cons(%458, %457) : (i64, i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %460 = func.call @stack_pop_pointer() : () -> i64
      %461 = func.call @stack_pop_pointer() : () -> i64
      %462 = func.call @cc_cons(%461, %460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%462) : (i64) -> ()
      %463 = func.call @stack_pop_pointer() : () -> i64
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%464, %463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @cc_cons(%467, %466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %469 = func.call @stack_pop_pointer() : () -> i64
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @cc_cons(%470, %469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @cc_cons(%473, %472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%477) : (i64) -> ()
      %478 = llvm.mlir.addressof @str45 : !llvm.ptr
      %479 = arith.constant 6 : i64
      %480 = func.call @cc_make_string(%478, %479) : (!llvm.ptr, i64) -> i64
      %481 = llvm.mlir.addressof @str46 : !llvm.ptr
      %482 = arith.constant 11 : i64
      %483 = func.call @cc_make_string(%481, %482) : (!llvm.ptr, i64) -> i64
      %484 = func.call @cc_intern(%480, %483) : (i64, i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = func.call @cc_cons(%484, %485) : (i64, i64) -> i64
      %487 = func.call @cc_values_pack(%486) : (i64) -> i64
      func.call @stack_push_pointer(%484) : (i64) -> ()
      %488 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %489 = llvm.mlir.addressof @str47 : !llvm.ptr
      %490 = arith.constant 25 : i64
      %491 = func.call @cc_make_string(%489, %490) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%491) : (i64) -> ()
      %492 = llvm.mlir.addressof @str48 : !llvm.ptr
      %493 = arith.constant 6 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = func.call @cc_nil_value() : () -> i64
      %496 = func.call @cc_intern(%494, %495) : (i64, i64) -> i64
      %497 = func.call @cc_nil_value() : () -> i64
      %498 = func.call @cc_cons(%496, %497) : (i64, i64) -> i64
      %499 = func.call @cc_values_pack(%498) : (i64) -> i64
      func.call @stack_push_pointer(%496) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %500 = func.call @stack_pop_pointer() : () -> i64
      %501 = func.call @stack_pop_pointer() : () -> i64
      %502 = func.call @cc_cons(%501, %500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%502) : (i64) -> ()
      %503 = func.call @stack_pop_pointer() : () -> i64
      %504 = func.call @stack_pop_pointer() : () -> i64
      %505 = func.call @cc_cons(%504, %503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%505) : (i64) -> ()
      %506 = func.call @stack_pop_pointer() : () -> i64
      %507 = func.call @stack_pop_pointer() : () -> i64
      %508 = func.call @cc_cons(%507, %506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%508) : (i64) -> ()
      %509 = func.call @stack_pop_pointer() : () -> i64
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = func.call @cc_cons(%510, %509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%511) : (i64) -> ()
      %512 = llvm.mlir.addressof @str49 : !llvm.ptr
      %513 = arith.constant 6 : i64
      %514 = func.call @cc_make_string(%512, %513) : (!llvm.ptr, i64) -> i64
      %515 = llvm.mlir.addressof @str50 : !llvm.ptr
      %516 = arith.constant 11 : i64
      %517 = func.call @cc_make_string(%515, %516) : (!llvm.ptr, i64) -> i64
      %518 = func.call @cc_intern(%514, %517) : (i64, i64) -> i64
      %519 = func.call @cc_nil_value() : () -> i64
      %520 = func.call @cc_cons(%518, %519) : (i64, i64) -> i64
      %521 = func.call @cc_values_pack(%520) : (i64) -> i64
      func.call @stack_push_pointer(%518) : (i64) -> ()
      %522 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%522) : (i64) -> ()
      %523 = llvm.mlir.addressof @str51 : !llvm.ptr
      %524 = arith.constant 34 : i64
      %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%525) : (i64) -> ()
      %526 = llvm.mlir.addressof @str52 : !llvm.ptr
      %527 = arith.constant 5 : i64
      %528 = func.call @cc_make_string(%526, %527) : (!llvm.ptr, i64) -> i64
      %529 = llvm.mlir.addressof @str53 : !llvm.ptr
      %530 = arith.constant 11 : i64
      %531 = func.call @cc_make_string(%529, %530) : (!llvm.ptr, i64) -> i64
      %532 = func.call @cc_intern(%528, %531) : (i64, i64) -> i64
      %533 = func.call @cc_nil_value() : () -> i64
      %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
      %535 = func.call @cc_values_pack(%534) : (i64) -> i64
      func.call @stack_push_pointer(%532) : (i64) -> ()
      %536 = llvm.mlir.addressof @str54 : !llvm.ptr
      %537 = arith.constant 5 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = llvm.mlir.addressof @str55 : !llvm.ptr
      %540 = arith.constant 11 : i64
      %541 = func.call @cc_make_string(%539, %540) : (!llvm.ptr, i64) -> i64
      %542 = func.call @cc_intern(%538, %541) : (i64, i64) -> i64
      %543 = func.call @cc_nil_value() : () -> i64
      %544 = func.call @cc_cons(%542, %543) : (i64, i64) -> i64
      %545 = func.call @cc_values_pack(%544) : (i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %546 = llvm.mlir.addressof @str56 : !llvm.ptr
      %547 = arith.constant 6 : i64
      %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_intern(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_cons(%550, %551) : (i64, i64) -> i64
      %553 = func.call @cc_values_pack(%552) : (i64) -> i64
      func.call @stack_push_pointer(%550) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = func.call @stack_pop_pointer() : () -> i64
      %556 = func.call @cc_cons(%555, %554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%556) : (i64) -> ()
      %557 = func.call @stack_pop_pointer() : () -> i64
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @cc_cons(%558, %557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %560 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%560) : (i64) -> ()
      %561 = llvm.mlir.addressof @str57 : !llvm.ptr
      %562 = arith.constant 12 : i64
      %563 = func.call @cc_make_string(%561, %562) : (!llvm.ptr, i64) -> i64
      %564 = llvm.mlir.addressof @str58 : !llvm.ptr
      %565 = arith.constant 11 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      %567 = func.call @cc_intern(%563, %566) : (i64, i64) -> i64
      %568 = func.call @cc_nil_value() : () -> i64
      %569 = func.call @cc_cons(%567, %568) : (i64, i64) -> i64
      %570 = func.call @cc_values_pack(%569) : (i64) -> i64
      func.call @stack_push_pointer(%567) : (i64) -> ()
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @cc_cons(%571, %572) : (i64, i64) -> i64
      %574 = llvm.mlir.addressof @str59 : !llvm.ptr
      %575 = arith.constant 5 : i64
      %576 = func.call @cc_make_string(%574, %575) : (!llvm.ptr, i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_intern(%576, %577) : (i64, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_cons(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_values_pack(%580) : (i64) -> i64
      %582 = func.call @cc_cons(%578, %573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%582) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = func.call @stack_pop_pointer() : () -> i64
      %585 = func.call @cc_cons(%584, %583) : (i64, i64) -> i64
      func.call @stack_push_pointer(%585) : (i64) -> ()
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = func.call @stack_pop_pointer() : () -> i64
      %588 = func.call @cc_cons(%587, %586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%588) : (i64) -> ()
      %589 = func.call @stack_pop_pointer() : () -> i64
      %590 = func.call @stack_pop_pointer() : () -> i64
      %591 = func.call @cc_cons(%590, %589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      %592 = llvm.mlir.addressof @str60 : !llvm.ptr
      %593 = arith.constant 5 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = llvm.mlir.addressof @str61 : !llvm.ptr
      %596 = arith.constant 11 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = func.call @cc_intern(%594, %597) : (i64, i64) -> i64
      %599 = func.call @cc_nil_value() : () -> i64
      %600 = func.call @cc_cons(%598, %599) : (i64, i64) -> i64
      %601 = func.call @cc_values_pack(%600) : (i64) -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      %602 = llvm.mlir.addressof @str62 : !llvm.ptr
      %603 = arith.constant 6 : i64
      %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
      %605 = llvm.mlir.addressof @str63 : !llvm.ptr
      %606 = arith.constant 11 : i64
      %607 = func.call @cc_make_string(%605, %606) : (!llvm.ptr, i64) -> i64
      %608 = func.call @cc_intern(%604, %607) : (i64, i64) -> i64
      %609 = func.call @cc_nil_value() : () -> i64
      %610 = func.call @cc_cons(%608, %609) : (i64, i64) -> i64
      %611 = func.call @cc_values_pack(%610) : (i64) -> i64
      func.call @stack_push_pointer(%608) : (i64) -> ()
      %612 = llvm.mlir.addressof @str64 : !llvm.ptr
      %613 = arith.constant 6 : i64
      %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
      %615 = func.call @cc_nil_value() : () -> i64
      %616 = func.call @cc_intern(%614, %615) : (i64, i64) -> i64
      %617 = func.call @cc_nil_value() : () -> i64
      %618 = func.call @cc_cons(%616, %617) : (i64, i64) -> i64
      %619 = func.call @cc_values_pack(%618) : (i64) -> i64
      func.call @stack_push_pointer(%616) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %620 = func.call @stack_pop_pointer() : () -> i64
      %621 = func.call @stack_pop_pointer() : () -> i64
      %622 = func.call @cc_cons(%621, %620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%622) : (i64) -> ()
      %623 = func.call @stack_pop_pointer() : () -> i64
      %624 = func.call @stack_pop_pointer() : () -> i64
      %625 = func.call @cc_cons(%624, %623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%625) : (i64) -> ()
      %626 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%626) : (i64) -> ()
      %627 = llvm.mlir.addressof @str65 : !llvm.ptr
      %628 = arith.constant 12 : i64
      %629 = func.call @cc_make_string(%627, %628) : (!llvm.ptr, i64) -> i64
      %630 = llvm.mlir.addressof @str66 : !llvm.ptr
      %631 = arith.constant 11 : i64
      %632 = func.call @cc_make_string(%630, %631) : (!llvm.ptr, i64) -> i64
      %633 = func.call @cc_intern(%629, %632) : (i64, i64) -> i64
      %634 = func.call @cc_nil_value() : () -> i64
      %635 = func.call @cc_cons(%633, %634) : (i64, i64) -> i64
      %636 = func.call @cc_values_pack(%635) : (i64) -> i64
      func.call @stack_push_pointer(%633) : (i64) -> ()
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
      func.call @stack_push_nil() : () -> ()
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = func.call @stack_pop_pointer() : () -> i64
      %651 = func.call @cc_cons(%650, %649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %652 = func.call @stack_pop_pointer() : () -> i64
      %653 = func.call @stack_pop_pointer() : () -> i64
      %654 = func.call @cc_cons(%653, %652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%654) : (i64) -> ()
      %655 = func.call @stack_pop_pointer() : () -> i64
      %656 = func.call @stack_pop_pointer() : () -> i64
      %657 = func.call @cc_cons(%656, %655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%657) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @stack_pop_pointer() : () -> i64
      %660 = func.call @cc_cons(%659, %658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%660) : (i64) -> ()
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @stack_pop_pointer() : () -> i64
      %663 = func.call @cc_cons(%662, %661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%663) : (i64) -> ()
      %664 = func.call @stack_pop_pointer() : () -> i64
      %665 = func.call @stack_pop_pointer() : () -> i64
      %666 = func.call @cc_cons(%665, %664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%666) : (i64) -> ()
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @stack_pop_pointer() : () -> i64
      %669 = func.call @cc_cons(%668, %667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%669) : (i64) -> ()
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @stack_pop_pointer() : () -> i64
      %672 = func.call @cc_cons(%671, %670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      %673 = llvm.mlir.addressof @str68 : !llvm.ptr
      %674 = arith.constant 6 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = llvm.mlir.addressof @str69 : !llvm.ptr
      %677 = arith.constant 11 : i64
      %678 = func.call @cc_make_string(%676, %677) : (!llvm.ptr, i64) -> i64
      %679 = func.call @cc_intern(%675, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      %683 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%683) : (i64) -> ()
      %684 = llvm.mlir.addressof @str70 : !llvm.ptr
      %685 = arith.constant 44 : i64
      %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%686) : (i64) -> ()
      %687 = llvm.mlir.addressof @str71 : !llvm.ptr
      %688 = arith.constant 7 : i64
      %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
      %690 = llvm.mlir.addressof @str72 : !llvm.ptr
      %691 = arith.constant 11 : i64
      %692 = func.call @cc_make_string(%690, %691) : (!llvm.ptr, i64) -> i64
      %693 = func.call @cc_intern(%689, %692) : (i64, i64) -> i64
      %694 = func.call @cc_nil_value() : () -> i64
      %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
      %696 = func.call @cc_values_pack(%695) : (i64) -> i64
      func.call @stack_push_pointer(%693) : (i64) -> ()
      %697 = llvm.mlir.addressof @str73 : !llvm.ptr
      %698 = arith.constant 5 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = llvm.mlir.addressof @str74 : !llvm.ptr
      %701 = arith.constant 11 : i64
      %702 = func.call @cc_make_string(%700, %701) : (!llvm.ptr, i64) -> i64
      %703 = func.call @cc_intern(%699, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      func.call @stack_push_pointer(%703) : (i64) -> ()
      %707 = llvm.mlir.addressof @str75 : !llvm.ptr
      %708 = arith.constant 6 : i64
      %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
      %710 = func.call @cc_nil_value() : () -> i64
      %711 = func.call @cc_intern(%709, %710) : (i64, i64) -> i64
      %712 = func.call @cc_nil_value() : () -> i64
      %713 = func.call @cc_cons(%711, %712) : (i64, i64) -> i64
      %714 = func.call @cc_values_pack(%713) : (i64) -> i64
      func.call @stack_push_pointer(%711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = func.call @stack_pop_pointer() : () -> i64
      %717 = func.call @cc_cons(%716, %715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%717) : (i64) -> ()
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @cc_cons(%719, %718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @stack_pop_pointer() : () -> i64
      %723 = func.call @cc_cons(%722, %721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%723) : (i64) -> ()
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @cc_cons(%725, %724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%726) : (i64) -> ()
      %727 = llvm.mlir.addressof @str76 : !llvm.ptr
      %728 = arith.constant 7 : i64
      %729 = func.call @cc_make_string(%727, %728) : (!llvm.ptr, i64) -> i64
      %730 = llvm.mlir.addressof @str77 : !llvm.ptr
      %731 = arith.constant 11 : i64
      %732 = func.call @cc_make_string(%730, %731) : (!llvm.ptr, i64) -> i64
      %733 = func.call @cc_intern(%729, %732) : (i64, i64) -> i64
      %734 = func.call @cc_nil_value() : () -> i64
      %735 = func.call @cc_cons(%733, %734) : (i64, i64) -> i64
      %736 = func.call @cc_values_pack(%735) : (i64) -> i64
      func.call @stack_push_pointer(%733) : (i64) -> ()
      %737 = llvm.mlir.addressof @str78 : !llvm.ptr
      %738 = arith.constant 6 : i64
      %739 = func.call @cc_make_string(%737, %738) : (!llvm.ptr, i64) -> i64
      %740 = llvm.mlir.addressof @str79 : !llvm.ptr
      %741 = arith.constant 11 : i64
      %742 = func.call @cc_make_string(%740, %741) : (!llvm.ptr, i64) -> i64
      %743 = func.call @cc_intern(%739, %742) : (i64, i64) -> i64
      %744 = func.call @cc_nil_value() : () -> i64
      %745 = func.call @cc_cons(%743, %744) : (i64, i64) -> i64
      %746 = func.call @cc_values_pack(%745) : (i64) -> i64
      func.call @stack_push_pointer(%743) : (i64) -> ()
      %747 = llvm.mlir.addressof @str80 : !llvm.ptr
      %748 = arith.constant 6 : i64
      %749 = func.call @cc_make_string(%747, %748) : (!llvm.ptr, i64) -> i64
      %750 = func.call @cc_nil_value() : () -> i64
      %751 = func.call @cc_intern(%749, %750) : (i64, i64) -> i64
      %752 = func.call @cc_nil_value() : () -> i64
      %753 = func.call @cc_cons(%751, %752) : (i64, i64) -> i64
      %754 = func.call @cc_values_pack(%753) : (i64) -> i64
      func.call @stack_push_pointer(%751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @cc_cons(%756, %755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @cc_cons(%759, %758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @stack_pop_pointer() : () -> i64
      %763 = func.call @cc_cons(%762, %761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%763) : (i64) -> ()
      %764 = func.call @stack_pop_pointer() : () -> i64
      %765 = func.call @stack_pop_pointer() : () -> i64
      %766 = func.call @cc_cons(%765, %764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = func.call @stack_pop_pointer() : () -> i64
      %769 = func.call @cc_cons(%768, %767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%769) : (i64) -> ()
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @stack_pop_pointer() : () -> i64
      %772 = func.call @cc_cons(%771, %770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%772) : (i64) -> ()
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @stack_pop_pointer() : () -> i64
      %775 = func.call @cc_cons(%774, %773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%775) : (i64) -> ()
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @stack_pop_pointer() : () -> i64
      %778 = func.call @cc_cons(%777, %776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%778) : (i64) -> ()
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @cc_cons(%780, %779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%781) : (i64) -> ()
      %782 = llvm.mlir.addressof @str81 : !llvm.ptr
      %783 = arith.constant 6 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      %785 = llvm.mlir.addressof @str82 : !llvm.ptr
      %786 = arith.constant 11 : i64
      %787 = func.call @cc_make_string(%785, %786) : (!llvm.ptr, i64) -> i64
      %788 = func.call @cc_intern(%784, %787) : (i64, i64) -> i64
      %789 = func.call @cc_nil_value() : () -> i64
      %790 = func.call @cc_cons(%788, %789) : (i64, i64) -> i64
      %791 = func.call @cc_values_pack(%790) : (i64) -> i64
      func.call @stack_push_pointer(%788) : (i64) -> ()
      %792 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %793 = llvm.mlir.addressof @str83 : !llvm.ptr
      %794 = arith.constant 46 : i64
      %795 = func.call @cc_make_string(%793, %794) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      %796 = llvm.mlir.addressof @str84 : !llvm.ptr
      %797 = arith.constant 5 : i64
      %798 = func.call @cc_make_string(%796, %797) : (!llvm.ptr, i64) -> i64
      %799 = llvm.mlir.addressof @str85 : !llvm.ptr
      %800 = arith.constant 11 : i64
      %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
      %802 = func.call @cc_intern(%798, %801) : (i64, i64) -> i64
      %803 = func.call @cc_nil_value() : () -> i64
      %804 = func.call @cc_cons(%802, %803) : (i64, i64) -> i64
      %805 = func.call @cc_values_pack(%804) : (i64) -> i64
      func.call @stack_push_pointer(%802) : (i64) -> ()
      %806 = llvm.mlir.addressof @str86 : !llvm.ptr
      %807 = arith.constant 5 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = llvm.mlir.addressof @str87 : !llvm.ptr
      %810 = arith.constant 11 : i64
      %811 = func.call @cc_make_string(%809, %810) : (!llvm.ptr, i64) -> i64
      %812 = func.call @cc_intern(%808, %811) : (i64, i64) -> i64
      %813 = func.call @cc_nil_value() : () -> i64
      %814 = func.call @cc_cons(%812, %813) : (i64, i64) -> i64
      %815 = func.call @cc_values_pack(%814) : (i64) -> i64
      func.call @stack_push_pointer(%812) : (i64) -> ()
      %816 = llvm.mlir.addressof @str88 : !llvm.ptr
      %817 = arith.constant 6 : i64
      %818 = func.call @cc_make_string(%816, %817) : (!llvm.ptr, i64) -> i64
      %819 = func.call @cc_nil_value() : () -> i64
      %820 = func.call @cc_intern(%818, %819) : (i64, i64) -> i64
      %821 = func.call @cc_nil_value() : () -> i64
      %822 = func.call @cc_cons(%820, %821) : (i64, i64) -> i64
      %823 = func.call @cc_values_pack(%822) : (i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = func.call @cc_cons(%825, %824) : (i64, i64) -> i64
      func.call @stack_push_pointer(%826) : (i64) -> ()
      %827 = func.call @stack_pop_pointer() : () -> i64
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @cc_cons(%828, %827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %830 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%830) : (i64) -> ()
      %831 = llvm.mlir.addressof @str89 : !llvm.ptr
      %832 = arith.constant 5 : i64
      %833 = func.call @cc_make_string(%831, %832) : (!llvm.ptr, i64) -> i64
      %834 = llvm.mlir.addressof @str90 : !llvm.ptr
      %835 = arith.constant 11 : i64
      %836 = func.call @cc_make_string(%834, %835) : (!llvm.ptr, i64) -> i64
      %837 = func.call @cc_intern(%833, %836) : (i64, i64) -> i64
      %838 = func.call @cc_nil_value() : () -> i64
      %839 = func.call @cc_cons(%837, %838) : (i64, i64) -> i64
      %840 = func.call @cc_values_pack(%839) : (i64) -> i64
      func.call @stack_push_pointer(%837) : (i64) -> ()
      %841 = func.call @stack_pop_pointer() : () -> i64
      %842 = func.call @stack_pop_pointer() : () -> i64
      %843 = func.call @cc_cons(%841, %842) : (i64, i64) -> i64
      %844 = llvm.mlir.addressof @str91 : !llvm.ptr
      %845 = arith.constant 5 : i64
      %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
      %847 = func.call @cc_nil_value() : () -> i64
      %848 = func.call @cc_intern(%846, %847) : (i64, i64) -> i64
      %849 = func.call @cc_nil_value() : () -> i64
      %850 = func.call @cc_cons(%848, %849) : (i64, i64) -> i64
      %851 = func.call @cc_values_pack(%850) : (i64) -> i64
      %852 = func.call @cc_cons(%848, %843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%852) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @stack_pop_pointer() : () -> i64
      %855 = func.call @cc_cons(%854, %853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @cc_cons(%857, %856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @stack_pop_pointer() : () -> i64
      %861 = func.call @cc_cons(%860, %859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%861) : (i64) -> ()
      %862 = llvm.mlir.addressof @str92 : !llvm.ptr
      %863 = arith.constant 5 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = llvm.mlir.addressof @str93 : !llvm.ptr
      %866 = arith.constant 11 : i64
      %867 = func.call @cc_make_string(%865, %866) : (!llvm.ptr, i64) -> i64
      %868 = func.call @cc_intern(%864, %867) : (i64, i64) -> i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_cons(%868, %869) : (i64, i64) -> i64
      %871 = func.call @cc_values_pack(%870) : (i64) -> i64
      func.call @stack_push_pointer(%868) : (i64) -> ()
      %872 = llvm.mlir.addressof @str94 : !llvm.ptr
      %873 = arith.constant 6 : i64
      %874 = func.call @cc_make_string(%872, %873) : (!llvm.ptr, i64) -> i64
      %875 = llvm.mlir.addressof @str95 : !llvm.ptr
      %876 = arith.constant 11 : i64
      %877 = func.call @cc_make_string(%875, %876) : (!llvm.ptr, i64) -> i64
      %878 = func.call @cc_intern(%874, %877) : (i64, i64) -> i64
      %879 = func.call @cc_nil_value() : () -> i64
      %880 = func.call @cc_cons(%878, %879) : (i64, i64) -> i64
      %881 = func.call @cc_values_pack(%880) : (i64) -> i64
      func.call @stack_push_pointer(%878) : (i64) -> ()
      %882 = llvm.mlir.addressof @str96 : !llvm.ptr
      %883 = arith.constant 6 : i64
      %884 = func.call @cc_make_string(%882, %883) : (!llvm.ptr, i64) -> i64
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_intern(%884, %885) : (i64, i64) -> i64
      %887 = func.call @cc_nil_value() : () -> i64
      %888 = func.call @cc_cons(%886, %887) : (i64, i64) -> i64
      %889 = func.call @cc_values_pack(%888) : (i64) -> i64
      func.call @stack_push_pointer(%886) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @stack_pop_pointer() : () -> i64
      %892 = func.call @cc_cons(%891, %890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%892) : (i64) -> ()
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @stack_pop_pointer() : () -> i64
      %895 = func.call @cc_cons(%894, %893) : (i64, i64) -> i64
      func.call @stack_push_pointer(%895) : (i64) -> ()
      %896 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%896) : (i64) -> ()
      %897 = llvm.mlir.addressof @str97 : !llvm.ptr
      %898 = arith.constant 5 : i64
      %899 = func.call @cc_make_string(%897, %898) : (!llvm.ptr, i64) -> i64
      %900 = llvm.mlir.addressof @str98 : !llvm.ptr
      %901 = arith.constant 11 : i64
      %902 = func.call @cc_make_string(%900, %901) : (!llvm.ptr, i64) -> i64
      %903 = func.call @cc_intern(%899, %902) : (i64, i64) -> i64
      %904 = func.call @cc_nil_value() : () -> i64
      %905 = func.call @cc_cons(%903, %904) : (i64, i64) -> i64
      %906 = func.call @cc_values_pack(%905) : (i64) -> i64
      func.call @stack_push_pointer(%903) : (i64) -> ()
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @stack_pop_pointer() : () -> i64
      %909 = func.call @cc_cons(%907, %908) : (i64, i64) -> i64
      %910 = llvm.mlir.addressof @str99 : !llvm.ptr
      %911 = arith.constant 5 : i64
      %912 = func.call @cc_make_string(%910, %911) : (!llvm.ptr, i64) -> i64
      %913 = func.call @cc_nil_value() : () -> i64
      %914 = func.call @cc_intern(%912, %913) : (i64, i64) -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      %917 = func.call @cc_values_pack(%916) : (i64) -> i64
      %918 = func.call @cc_cons(%914, %909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%918) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %919 = func.call @stack_pop_pointer() : () -> i64
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = func.call @cc_cons(%920, %919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%921) : (i64) -> ()
      %922 = func.call @stack_pop_pointer() : () -> i64
      %923 = func.call @stack_pop_pointer() : () -> i64
      %924 = func.call @cc_cons(%923, %922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%924) : (i64) -> ()
      %925 = func.call @stack_pop_pointer() : () -> i64
      %926 = func.call @stack_pop_pointer() : () -> i64
      %927 = func.call @cc_cons(%926, %925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%927) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %928 = func.call @stack_pop_pointer() : () -> i64
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = func.call @cc_cons(%929, %928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%930) : (i64) -> ()
      %931 = func.call @stack_pop_pointer() : () -> i64
      %932 = func.call @stack_pop_pointer() : () -> i64
      %933 = func.call @cc_cons(%932, %931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%933) : (i64) -> ()
      %934 = func.call @stack_pop_pointer() : () -> i64
      %935 = func.call @stack_pop_pointer() : () -> i64
      %936 = func.call @cc_cons(%935, %934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      %937 = func.call @stack_pop_pointer() : () -> i64
      %938 = func.call @stack_pop_pointer() : () -> i64
      %939 = func.call @cc_cons(%938, %937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%939) : (i64) -> ()
      %940 = func.call @stack_pop_pointer() : () -> i64
      %941 = func.call @stack_pop_pointer() : () -> i64
      %942 = func.call @cc_cons(%941, %940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%942) : (i64) -> ()
      %943 = llvm.mlir.addressof @str100 : !llvm.ptr
      %944 = arith.constant 6 : i64
      %945 = func.call @cc_make_string(%943, %944) : (!llvm.ptr, i64) -> i64
      %946 = llvm.mlir.addressof @str101 : !llvm.ptr
      %947 = arith.constant 11 : i64
      %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
      %949 = func.call @cc_intern(%945, %948) : (i64, i64) -> i64
      %950 = func.call @cc_nil_value() : () -> i64
      %951 = func.call @cc_cons(%949, %950) : (i64, i64) -> i64
      %952 = func.call @cc_values_pack(%951) : (i64) -> i64
      func.call @stack_push_pointer(%949) : (i64) -> ()
      %953 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%953) : (i64) -> ()
      %954 = llvm.mlir.addressof @str102 : !llvm.ptr
      %955 = arith.constant 58 : i64
      %956 = func.call @cc_make_string(%954, %955) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%956) : (i64) -> ()
      %957 = llvm.mlir.addressof @str103 : !llvm.ptr
      %958 = arith.constant 6 : i64
      %959 = func.call @cc_make_string(%957, %958) : (!llvm.ptr, i64) -> i64
      %960 = llvm.mlir.addressof @str104 : !llvm.ptr
      %961 = arith.constant 11 : i64
      %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
      %963 = func.call @cc_intern(%959, %962) : (i64, i64) -> i64
      %964 = func.call @cc_nil_value() : () -> i64
      %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
      %966 = func.call @cc_values_pack(%965) : (i64) -> i64
      func.call @stack_push_pointer(%963) : (i64) -> ()
      %967 = llvm.mlir.addressof @str105 : !llvm.ptr
      %968 = arith.constant 6 : i64
      %969 = func.call @cc_make_string(%967, %968) : (!llvm.ptr, i64) -> i64
      %970 = func.call @cc_nil_value() : () -> i64
      %971 = func.call @cc_intern(%969, %970) : (i64, i64) -> i64
      %972 = func.call @cc_nil_value() : () -> i64
      %973 = func.call @cc_cons(%971, %972) : (i64, i64) -> i64
      %974 = func.call @cc_values_pack(%973) : (i64) -> i64
      func.call @stack_push_pointer(%971) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %975 = func.call @stack_pop_pointer() : () -> i64
      %976 = func.call @stack_pop_pointer() : () -> i64
      %977 = func.call @cc_cons(%976, %975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%977) : (i64) -> ()
      %978 = func.call @stack_pop_pointer() : () -> i64
      %979 = func.call @stack_pop_pointer() : () -> i64
      %980 = func.call @cc_cons(%979, %978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%980) : (i64) -> ()
      %981 = llvm.mlir.addressof @str106 : !llvm.ptr
      %982 = arith.constant 3 : i64
      %983 = func.call @cc_make_string(%981, %982) : (!llvm.ptr, i64) -> i64
      %984 = llvm.mlir.addressof @str107 : !llvm.ptr
      %985 = arith.constant 11 : i64
      %986 = func.call @cc_make_string(%984, %985) : (!llvm.ptr, i64) -> i64
      %987 = func.call @cc_intern(%983, %986) : (i64, i64) -> i64
      %988 = func.call @cc_nil_value() : () -> i64
      %989 = func.call @cc_cons(%987, %988) : (i64, i64) -> i64
      %990 = func.call @cc_values_pack(%989) : (i64) -> i64
      func.call @stack_push_pointer(%987) : (i64) -> ()
      %991 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%991) : (i64) -> ()
      %992 = llvm.mlir.addressof @str108 : !llvm.ptr
      %993 = arith.constant 6 : i64
      %994 = func.call @cc_make_string(%992, %993) : (!llvm.ptr, i64) -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_intern(%994, %995) : (i64, i64) -> i64
      %997 = func.call @cc_nil_value() : () -> i64
      %998 = func.call @cc_cons(%996, %997) : (i64, i64) -> i64
      %999 = func.call @cc_values_pack(%998) : (i64) -> i64
      func.call @stack_push_pointer(%996) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %1009 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1010 = arith.constant 7 : i64
      %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
      %1012 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1013 = arith.constant 11 : i64
      %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
      %1015 = func.call @cc_intern(%1011, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_cons(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_values_pack(%1017) : (i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1019 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1020 = arith.constant 3 : i64
      %1021 = func.call @cc_make_string(%1019, %1020) : (!llvm.ptr, i64) -> i64
      %1022 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1023 = arith.constant 11 : i64
      %1024 = func.call @cc_make_string(%1022, %1023) : (!llvm.ptr, i64) -> i64
      %1025 = func.call @cc_intern(%1021, %1024) : (i64, i64) -> i64
      %1026 = func.call @cc_nil_value() : () -> i64
      %1027 = func.call @cc_cons(%1025, %1026) : (i64, i64) -> i64
      %1028 = func.call @cc_values_pack(%1027) : (i64) -> i64
      func.call @stack_push_pointer(%1025) : (i64) -> ()
      %1029 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%1029) : (i64) -> ()
      %1030 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1031 = arith.constant 6 : i64
      %1032 = func.call @cc_make_string(%1030, %1031) : (!llvm.ptr, i64) -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_intern(%1032, %1033) : (i64, i64) -> i64
      %1035 = func.call @cc_nil_value() : () -> i64
      %1036 = func.call @cc_cons(%1034, %1035) : (i64, i64) -> i64
      %1037 = func.call @cc_values_pack(%1036) : (i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1039 = func.call @stack_pop_pointer() : () -> i64
      %1040 = func.call @cc_cons(%1039, %1038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1040) : (i64) -> ()
      %1041 = func.call @stack_pop_pointer() : () -> i64
      %1042 = func.call @stack_pop_pointer() : () -> i64
      %1043 = func.call @cc_cons(%1042, %1041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1043) : (i64) -> ()
      %1044 = func.call @stack_pop_pointer() : () -> i64
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @cc_cons(%1045, %1044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @cc_cons(%1048, %1047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1049) : (i64) -> ()
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @cc_cons(%1051, %1050) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1052) : (i64) -> ()
      %1053 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1054 = arith.constant 5 : i64
      %1055 = func.call @cc_make_string(%1053, %1054) : (!llvm.ptr, i64) -> i64
      %1056 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1057 = arith.constant 11 : i64
      %1058 = func.call @cc_make_string(%1056, %1057) : (!llvm.ptr, i64) -> i64
      %1059 = func.call @cc_intern(%1055, %1058) : (i64, i64) -> i64
      %1060 = func.call @cc_nil_value() : () -> i64
      %1061 = func.call @cc_cons(%1059, %1060) : (i64, i64) -> i64
      %1062 = func.call @cc_values_pack(%1061) : (i64) -> i64
      func.call @stack_push_pointer(%1059) : (i64) -> ()
      %1063 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1064 = arith.constant 3 : i64
      %1065 = func.call @cc_make_string(%1063, %1064) : (!llvm.ptr, i64) -> i64
      %1066 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1067 = arith.constant 11 : i64
      %1068 = func.call @cc_make_string(%1066, %1067) : (!llvm.ptr, i64) -> i64
      %1069 = func.call @cc_intern(%1065, %1068) : (i64, i64) -> i64
      %1070 = func.call @cc_nil_value() : () -> i64
      %1071 = func.call @cc_cons(%1069, %1070) : (i64, i64) -> i64
      %1072 = func.call @cc_values_pack(%1071) : (i64) -> i64
      func.call @stack_push_pointer(%1069) : (i64) -> ()
      %1073 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%1073) : (i64) -> ()
      %1074 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1075 = arith.constant 6 : i64
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
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = func.call @cc_cons(%1086, %1085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @stack_pop_pointer() : () -> i64
      %1090 = func.call @cc_cons(%1089, %1088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1090) : (i64) -> ()
      %1091 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1091) : (i64) -> ()
      %1092 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1093 = arith.constant 12 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      %1095 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1096 = arith.constant 11 : i64
      %1097 = func.call @cc_make_string(%1095, %1096) : (!llvm.ptr, i64) -> i64
      %1098 = func.call @cc_intern(%1094, %1097) : (i64, i64) -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_cons(%1098, %1099) : (i64, i64) -> i64
      %1101 = func.call @cc_values_pack(%1100) : (i64) -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
      %1102 = func.call @stack_pop_pointer() : () -> i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1102, %1103) : (i64, i64) -> i64
      %1105 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1106 = arith.constant 5 : i64
      %1107 = func.call @cc_make_string(%1105, %1106) : (!llvm.ptr, i64) -> i64
      %1108 = func.call @cc_nil_value() : () -> i64
      %1109 = func.call @cc_intern(%1107, %1108) : (i64, i64) -> i64
      %1110 = func.call @cc_nil_value() : () -> i64
      %1111 = func.call @cc_cons(%1109, %1110) : (i64, i64) -> i64
      %1112 = func.call @cc_values_pack(%1111) : (i64) -> i64
      %1113 = func.call @cc_cons(%1109, %1104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1114 = func.call @stack_pop_pointer() : () -> i64
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1116 = func.call @cc_cons(%1115, %1114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1116) : (i64) -> ()
      %1117 = func.call @stack_pop_pointer() : () -> i64
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_cons(%1118, %1117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1119) : (i64) -> ()
      %1120 = func.call @stack_pop_pointer() : () -> i64
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @cc_cons(%1121, %1120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1123 = func.call @stack_pop_pointer() : () -> i64
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @cc_cons(%1124, %1123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1125) : (i64) -> ()
      %1126 = func.call @stack_pop_pointer() : () -> i64
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_cons(%1127, %1126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1129 = func.call @stack_pop_pointer() : () -> i64
      %1130 = func.call @stack_pop_pointer() : () -> i64
      %1131 = func.call @cc_cons(%1130, %1129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1131) : (i64) -> ()
      %1132 = func.call @stack_pop_pointer() : () -> i64
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @cc_cons(%1133, %1132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1134) : (i64) -> ()
      %1135 = func.call @stack_pop_pointer() : () -> i64
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @cc_cons(%1136, %1135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1137) : (i64) -> ()
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @cc_cons(%1139, %1138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1140) : (i64) -> ()
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @cc_cons(%1142, %1141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1143) : (i64) -> ()
      %1144 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1145 = arith.constant 3 : i64
      %1146 = func.call @cc_make_string(%1144, %1145) : (!llvm.ptr, i64) -> i64
      %1147 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1148 = arith.constant 11 : i64
      %1149 = func.call @cc_make_string(%1147, %1148) : (!llvm.ptr, i64) -> i64
      %1150 = func.call @cc_intern(%1146, %1149) : (i64, i64) -> i64
      %1151 = func.call @cc_nil_value() : () -> i64
      %1152 = func.call @cc_cons(%1150, %1151) : (i64, i64) -> i64
      %1153 = func.call @cc_values_pack(%1152) : (i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1154 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1155 = arith.constant 5 : i64
      %1156 = func.call @cc_make_string(%1154, %1155) : (!llvm.ptr, i64) -> i64
      %1157 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1158 = arith.constant 11 : i64
      %1159 = func.call @cc_make_string(%1157, %1158) : (!llvm.ptr, i64) -> i64
      %1160 = func.call @cc_intern(%1156, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_nil_value() : () -> i64
      %1162 = func.call @cc_cons(%1160, %1161) : (i64, i64) -> i64
      %1163 = func.call @cc_values_pack(%1162) : (i64) -> i64
      func.call @stack_push_pointer(%1160) : (i64) -> ()
      %1164 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1165 = arith.constant 5 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1168 = arith.constant 11 : i64
      %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
      %1170 = func.call @cc_intern(%1166, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_cons(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_values_pack(%1172) : (i64) -> i64
      func.call @stack_push_pointer(%1170) : (i64) -> ()
      %1174 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1175 = arith.constant 6 : i64
      %1176 = func.call @cc_make_string(%1174, %1175) : (!llvm.ptr, i64) -> i64
      %1177 = func.call @cc_nil_value() : () -> i64
      %1178 = func.call @cc_intern(%1176, %1177) : (i64, i64) -> i64
      %1179 = func.call @cc_nil_value() : () -> i64
      %1180 = func.call @cc_cons(%1178, %1179) : (i64, i64) -> i64
      %1181 = func.call @cc_values_pack(%1180) : (i64) -> i64
      func.call @stack_push_pointer(%1178) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1182 = func.call @stack_pop_pointer() : () -> i64
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @cc_cons(%1183, %1182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1184) : (i64) -> ()
      %1185 = func.call @stack_pop_pointer() : () -> i64
      %1186 = func.call @stack_pop_pointer() : () -> i64
      %1187 = func.call @cc_cons(%1186, %1185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      %1188 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1188) : (i64) -> ()
      %1189 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1190 = arith.constant 12 : i64
      %1191 = func.call @cc_make_string(%1189, %1190) : (!llvm.ptr, i64) -> i64
      %1192 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1193 = arith.constant 11 : i64
      %1194 = func.call @cc_make_string(%1192, %1193) : (!llvm.ptr, i64) -> i64
      %1195 = func.call @cc_intern(%1191, %1194) : (i64, i64) -> i64
      %1196 = func.call @cc_nil_value() : () -> i64
      %1197 = func.call @cc_cons(%1195, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_values_pack(%1197) : (i64) -> i64
      func.call @stack_push_pointer(%1195) : (i64) -> ()
      %1199 = func.call @stack_pop_pointer() : () -> i64
      %1200 = func.call @stack_pop_pointer() : () -> i64
      %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
      %1202 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1203 = arith.constant 5 : i64
      %1204 = func.call @cc_make_string(%1202, %1203) : (!llvm.ptr, i64) -> i64
      %1205 = func.call @cc_nil_value() : () -> i64
      %1206 = func.call @cc_intern(%1204, %1205) : (i64, i64) -> i64
      %1207 = func.call @cc_nil_value() : () -> i64
      %1208 = func.call @cc_cons(%1206, %1207) : (i64, i64) -> i64
      %1209 = func.call @cc_values_pack(%1208) : (i64) -> i64
      %1210 = func.call @cc_cons(%1206, %1201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1211 = func.call @stack_pop_pointer() : () -> i64
      %1212 = func.call @stack_pop_pointer() : () -> i64
      %1213 = func.call @cc_cons(%1212, %1211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1213) : (i64) -> ()
      %1214 = func.call @stack_pop_pointer() : () -> i64
      %1215 = func.call @stack_pop_pointer() : () -> i64
      %1216 = func.call @cc_cons(%1215, %1214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
      %1217 = func.call @stack_pop_pointer() : () -> i64
      %1218 = func.call @stack_pop_pointer() : () -> i64
      %1219 = func.call @cc_cons(%1218, %1217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1219) : (i64) -> ()
      %1220 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1221 = arith.constant 5 : i64
      %1222 = func.call @cc_make_string(%1220, %1221) : (!llvm.ptr, i64) -> i64
      %1223 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1224 = arith.constant 11 : i64
      %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
      %1226 = func.call @cc_intern(%1222, %1225) : (i64, i64) -> i64
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_cons(%1226, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_values_pack(%1228) : (i64) -> i64
      func.call @stack_push_pointer(%1226) : (i64) -> ()
      %1230 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1231 = arith.constant 6 : i64
      %1232 = func.call @cc_make_string(%1230, %1231) : (!llvm.ptr, i64) -> i64
      %1233 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1234 = arith.constant 11 : i64
      %1235 = func.call @cc_make_string(%1233, %1234) : (!llvm.ptr, i64) -> i64
      %1236 = func.call @cc_intern(%1232, %1235) : (i64, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_cons(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_values_pack(%1238) : (i64) -> i64
      func.call @stack_push_pointer(%1236) : (i64) -> ()
      %1240 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1241 = arith.constant 6 : i64
      %1242 = func.call @cc_make_string(%1240, %1241) : (!llvm.ptr, i64) -> i64
      %1243 = func.call @cc_nil_value() : () -> i64
      %1244 = func.call @cc_intern(%1242, %1243) : (i64, i64) -> i64
      %1245 = func.call @cc_nil_value() : () -> i64
      %1246 = func.call @cc_cons(%1244, %1245) : (i64, i64) -> i64
      %1247 = func.call @cc_values_pack(%1246) : (i64) -> i64
      func.call @stack_push_pointer(%1244) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1248 = func.call @stack_pop_pointer() : () -> i64
      %1249 = func.call @stack_pop_pointer() : () -> i64
      %1250 = func.call @cc_cons(%1249, %1248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1250) : (i64) -> ()
      %1251 = func.call @stack_pop_pointer() : () -> i64
      %1252 = func.call @stack_pop_pointer() : () -> i64
      %1253 = func.call @cc_cons(%1252, %1251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1253) : (i64) -> ()
      %1254 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      %1255 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1256 = arith.constant 12 : i64
      %1257 = func.call @cc_make_string(%1255, %1256) : (!llvm.ptr, i64) -> i64
      %1258 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1259 = arith.constant 11 : i64
      %1260 = func.call @cc_make_string(%1258, %1259) : (!llvm.ptr, i64) -> i64
      %1261 = func.call @cc_intern(%1257, %1260) : (i64, i64) -> i64
      %1262 = func.call @cc_nil_value() : () -> i64
      %1263 = func.call @cc_cons(%1261, %1262) : (i64, i64) -> i64
      %1264 = func.call @cc_values_pack(%1263) : (i64) -> i64
      func.call @stack_push_pointer(%1261) : (i64) -> ()
      %1265 = func.call @stack_pop_pointer() : () -> i64
      %1266 = func.call @stack_pop_pointer() : () -> i64
      %1267 = func.call @cc_cons(%1265, %1266) : (i64, i64) -> i64
      %1268 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1269 = arith.constant 5 : i64
      %1270 = func.call @cc_make_string(%1268, %1269) : (!llvm.ptr, i64) -> i64
      %1271 = func.call @cc_nil_value() : () -> i64
      %1272 = func.call @cc_intern(%1270, %1271) : (i64, i64) -> i64
      %1273 = func.call @cc_nil_value() : () -> i64
      %1274 = func.call @cc_cons(%1272, %1273) : (i64, i64) -> i64
      %1275 = func.call @cc_values_pack(%1274) : (i64) -> i64
      %1276 = func.call @cc_cons(%1272, %1267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1276) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1277 = func.call @stack_pop_pointer() : () -> i64
      %1278 = func.call @stack_pop_pointer() : () -> i64
      %1279 = func.call @cc_cons(%1278, %1277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1279) : (i64) -> ()
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = func.call @cc_cons(%1281, %1280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1282) : (i64) -> ()
      %1283 = func.call @stack_pop_pointer() : () -> i64
      %1284 = func.call @stack_pop_pointer() : () -> i64
      %1285 = func.call @cc_cons(%1284, %1283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1285) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1286 = func.call @stack_pop_pointer() : () -> i64
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = func.call @cc_cons(%1287, %1286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1288) : (i64) -> ()
      %1289 = func.call @stack_pop_pointer() : () -> i64
      %1290 = func.call @stack_pop_pointer() : () -> i64
      %1291 = func.call @cc_cons(%1290, %1289) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1291) : (i64) -> ()
      %1292 = func.call @stack_pop_pointer() : () -> i64
      %1293 = func.call @stack_pop_pointer() : () -> i64
      %1294 = func.call @cc_cons(%1293, %1292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1294) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1295 = func.call @stack_pop_pointer() : () -> i64
      %1296 = func.call @stack_pop_pointer() : () -> i64
      %1297 = func.call @cc_cons(%1296, %1295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1297) : (i64) -> ()
      %1298 = func.call @stack_pop_pointer() : () -> i64
      %1299 = func.call @stack_pop_pointer() : () -> i64
      %1300 = func.call @cc_cons(%1299, %1298) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1300) : (i64) -> ()
      %1301 = func.call @stack_pop_pointer() : () -> i64
      %1302 = func.call @stack_pop_pointer() : () -> i64
      %1303 = func.call @cc_cons(%1302, %1301) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1303) : (i64) -> ()
      %1304 = func.call @stack_pop_pointer() : () -> i64
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %1306 = func.call @cc_cons(%1305, %1304) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1306) : (i64) -> ()
      %1307 = func.call @stack_pop_pointer() : () -> i64
      %1308 = func.call @stack_pop_pointer() : () -> i64
      %1309 = func.call @cc_cons(%1308, %1307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1309) : (i64) -> ()
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = func.call @stack_pop_pointer() : () -> i64
      %1312 = func.call @cc_cons(%1311, %1310) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1312) : (i64) -> ()
      %1313 = func.call @stack_pop_pointer() : () -> i64
      %1314 = func.call @stack_pop_pointer() : () -> i64
      %1315 = func.call @cc_cons(%1314, %1313) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1315) : (i64) -> ()
      %1316 = func.call @stack_pop_pointer() : () -> i64
      %1317 = func.call @stack_pop_pointer() : () -> i64
      %1318 = func.call @cc_cons(%1317, %1316) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1318) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1319 = func.call @stack_pop_pointer() : () -> i64
      %1320 = func.call @stack_pop_pointer() : () -> i64
      %1321 = func.call @cc_cons(%1320, %1319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1321) : (i64) -> ()
      %1322 = func.call @stack_pop_pointer() : () -> i64
      %1323 = func.call @stack_pop_pointer() : () -> i64
      %1324 = func.call @cc_cons(%1323, %1322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1324) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1325 = func.call @stack_pop_pointer() : () -> i64
      %1326 = func.call @stack_pop_pointer() : () -> i64
      %1327 = func.call @cc_cons(%1326, %1325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1327) : (i64) -> ()
      %1328 = func.call @stack_pop_pointer() : () -> i64
      %1329 = func.call @stack_pop_pointer() : () -> i64
      %1330 = func.call @cc_cons(%1329, %1328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1330) : (i64) -> ()
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %2081 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2082 = arith.constant 30 : i64
      %2083 = func.call @cc_make_symbol(%2081, %2082) : (!llvm.ptr, i64) -> i64
      %2084 = func.call @cc_persistent_root_value(%2083) : (i64) -> i64
      func.call @stack_push_pointer(%2084) : (i64) -> ()
      %2085 = arith.constant 241389006749697 : i64
      %2086 = arith.constant 1 : i64
      %2087 = func.call @cc_make_closure(%2085, %2086) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2087) : (i64) -> ()
      %2088 = func.call @stack_pop_pointer() : () -> i64
      %2089 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2090 = arith.constant 1 : i64
      %2091 = func.call @cc_make_string(%2089, %2090) : (!llvm.ptr, i64) -> i64
      %2092 = func.call @cc_nil_value() : () -> i64
      %2093 = func.call @cc_intern(%2091, %2092) : (i64, i64) -> i64
      %2094 = func.call @cc_nil_value() : () -> i64
      %2095 = func.call @cc_cons(%2093, %2094) : (i64, i64) -> i64
      %2096 = func.call @cc_values_pack(%2095) : (i64) -> i64
      func.call @stack_push_pointer(%2093) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2097 = func.call @stack_pop_pointer() : () -> i64
      %2098 = func.call @stack_pop_pointer() : () -> i64
      %2099 = func.call @cc_cons(%2098, %2097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2099) : (i64) -> ()
      %2100 = func.call @stack_pop_pointer() : () -> i64
      %2101 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2102 = arith.constant 11 : i64
      %2103 = func.call @cc_make_string(%2101, %2102) : (!llvm.ptr, i64) -> i64
      %2104 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2105 = arith.constant 7 : i64
      %2106 = func.call @cc_make_string(%2104, %2105) : (!llvm.ptr, i64) -> i64
      %2107 = func.call @cc_intern(%2103, %2106) : (i64, i64) -> i64
      %2108 = func.call @cc_nil_value() : () -> i64
      %2109 = func.call @cc_cons(%2107, %2108) : (i64, i64) -> i64
      %2110 = func.call @cc_values_pack(%2109) : (i64) -> i64
      func.call @stack_push_pointer(%2107) : (i64) -> ()
      %2111 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2112 = func.call @stack_pop_pointer() : () -> i64
      %2113 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2114 = arith.constant 4 : i64
      %2115 = func.call @cc_make_string(%2113, %2114) : (!llvm.ptr, i64) -> i64
      %2116 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2117 = arith.constant 7 : i64
      %2118 = func.call @cc_make_string(%2116, %2117) : (!llvm.ptr, i64) -> i64
      %2119 = func.call @cc_intern(%2115, %2118) : (i64, i64) -> i64
      %2120 = func.call @cc_nil_value() : () -> i64
      %2121 = func.call @cc_cons(%2119, %2120) : (i64, i64) -> i64
      %2122 = func.call @cc_values_pack(%2121) : (i64) -> i64
      func.call @stack_push_pointer(%2119) : (i64) -> ()
      %2123 = func.call @stack_pop_pointer() : () -> i64
      %2124 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2125 = arith.constant 6 : i64
      %2126 = func.call @cc_make_string(%2124, %2125) : (!llvm.ptr, i64) -> i64
      %2127 = func.call @cc_nil_value() : () -> i64
      %2128 = func.call @cc_intern(%2126, %2127) : (i64, i64) -> i64
      %2129 = func.call @cc_nil_value() : () -> i64
      %2130 = func.call @cc_cons(%2128, %2129) : (i64, i64) -> i64
      %2131 = func.call @cc_values_pack(%2130) : (i64) -> i64
      func.call @stack_push_pointer(%2128) : (i64) -> ()
      %2132 = func.call @stack_pop_pointer() : () -> i64
      %2133 = func.call @cc_nil_value() : () -> i64
      %2134 = func.call @cc_errorp(%65) : (i64) -> i64
      %2135 = arith.cmpi ne, %2134, %2133 : i64
      %2136 = arith.cmpi eq, %2133, %2133 : i64
      %2137 = arith.andi %2135, %2136 : i1
      %2138 = scf.if %2137 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %2133 : i64
      }
      %2139 = func.call @cc_errorp(%1331) : (i64) -> i64
      %2140 = arith.cmpi ne, %2139, %2133 : i64
      %2141 = arith.cmpi eq, %2138, %2133 : i64
      %2142 = arith.andi %2140, %2141 : i1
      %2143 = scf.if %2142 -> (i64) {
        scf.yield %1331 : i64
      } else {
        scf.yield %2138 : i64
      }
      %2144 = func.call @cc_errorp(%2088) : (i64) -> i64
      %2145 = arith.cmpi ne, %2144, %2133 : i64
      %2146 = arith.cmpi eq, %2143, %2133 : i64
      %2147 = arith.andi %2145, %2146 : i1
      %2148 = scf.if %2147 -> (i64) {
        scf.yield %2088 : i64
      } else {
        scf.yield %2143 : i64
      }
      %2149 = func.call @cc_errorp(%2100) : (i64) -> i64
      %2150 = arith.cmpi ne, %2149, %2133 : i64
      %2151 = arith.cmpi eq, %2148, %2133 : i64
      %2152 = arith.andi %2150, %2151 : i1
      %2153 = scf.if %2152 -> (i64) {
        scf.yield %2100 : i64
      } else {
        scf.yield %2148 : i64
      }
      %2154 = func.call @cc_errorp(%2111) : (i64) -> i64
      %2155 = arith.cmpi ne, %2154, %2133 : i64
      %2156 = arith.cmpi eq, %2153, %2133 : i64
      %2157 = arith.andi %2155, %2156 : i1
      %2158 = scf.if %2157 -> (i64) {
        scf.yield %2111 : i64
      } else {
        scf.yield %2153 : i64
      }
      %2159 = func.call @cc_errorp(%2112) : (i64) -> i64
      %2160 = arith.cmpi ne, %2159, %2133 : i64
      %2161 = arith.cmpi eq, %2158, %2133 : i64
      %2162 = arith.andi %2160, %2161 : i1
      %2163 = scf.if %2162 -> (i64) {
        scf.yield %2112 : i64
      } else {
        scf.yield %2158 : i64
      }
      %2164 = func.call @cc_errorp(%2123) : (i64) -> i64
      %2165 = arith.cmpi ne, %2164, %2133 : i64
      %2166 = arith.cmpi eq, %2163, %2133 : i64
      %2167 = arith.andi %2165, %2166 : i1
      %2168 = scf.if %2167 -> (i64) {
        scf.yield %2123 : i64
      } else {
        scf.yield %2163 : i64
      }
      %2169 = func.call @cc_errorp(%2132) : (i64) -> i64
      %2170 = arith.cmpi ne, %2169, %2133 : i64
      %2171 = arith.cmpi eq, %2168, %2133 : i64
      %2172 = arith.andi %2170, %2171 : i1
      %2173 = scf.if %2172 -> (i64) {
        scf.yield %2132 : i64
      } else {
        scf.yield %2168 : i64
      }
      %2174 = arith.cmpi ne, %2173, %2133 : i64
      scf.if %2174 {
        func.call @stack_push_pointer(%2173) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%1331) : (i64) -> ()
        func.call @stack_push_pointer(%2088) : (i64) -> ()
        func.call @stack_push_pointer(%2100) : (i64) -> ()
        func.call @stack_push_pointer(%2111) : (i64) -> ()
        func.call @stack_push_pointer(%2112) : (i64) -> ()
        func.call @stack_push_pointer(%2123) : (i64) -> ()
        func.call @stack_push_pointer(%2132) : (i64) -> ()
        %2175 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2176 = func.call @cc_make_function_ref_const(%2175) : (!llvm.ptr) -> i64
        %2177 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2176, %2177) : (i64, i64) -> ()
      }
      %2178 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2178 : i64
    }
    %2179 = func.call @cc_nil_value() : () -> i64
    %2180 = func.call @cc_errorp(%56) : (i64) -> i64
    %2181 = arith.cmpi ne, %2180, %2179 : i64
    %2182 = scf.if %2181 -> (i64) {
      scf.yield %56 : i64
    } else {
      %2183 = func.call @cc_nil_value() : () -> i64
      %2184 = arith.cmpi ne, %2183, %2183 : i64
      scf.if %2184 {
        func.call @stack_push_pointer(%2183) : (i64) -> ()
      } else {
        %2185 = llvm.mlir.addressof @str212 : !llvm.ptr
        %2186 = func.call @cc_make_function_ref_const(%2185) : (!llvm.ptr) -> i64
        %2187 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%2186, %2187) : (i64, i64) -> ()
      }
      %2188 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2188 : i64
    }
    func.call @stack_push_pointer(%2182) : (i64) -> ()
    %2189 = func.call @stack_pop_pointer() : () -> i64
    %2190 = func.call @cc_multiple_value_list(%2189) : (i64) -> i64
    %2191 = llvm.mlir.addressof @str213 : !llvm.ptr
    %2192 = arith.constant 38 : i64
    %2193 = func.call @cc_make_string(%2191, %2192) : (!llvm.ptr, i64) -> i64
    %2194 = func.call @cc_nil_value() : () -> i64
    %2195 = func.call @cc_intern(%2193, %2194) : (i64, i64) -> i64
    %2196 = func.call @cc_nil_value() : () -> i64
    %2197 = func.call @cc_cons(%2195, %2196) : (i64, i64) -> i64
    %2198 = func.call @cc_values_pack(%2197) : (i64) -> i64
    %2199 = func.call @cc_symbol_value(%2195) : (i64) -> i64
    %2200 = llvm.mlir.addressof @str214 : !llvm.ptr
    %2201 = arith.constant 40 : i64
    %2202 = func.call @cc_make_string(%2200, %2201) : (!llvm.ptr, i64) -> i64
    %2203 = func.call @cc_nil_value() : () -> i64
    %2204 = func.call @cc_intern(%2202, %2203) : (i64, i64) -> i64
    %2205 = func.call @cc_nil_value() : () -> i64
    %2206 = func.call @cc_cons(%2204, %2205) : (i64, i64) -> i64
    %2207 = func.call @cc_values_pack(%2206) : (i64) -> i64
    %2208 = func.call @cc_symbol_value(%2204) : (i64) -> i64
    %2209 = func.call @cc_nil_value() : () -> i64
    %2210 = arith.cmpi ne, %2199, %2209 : i64
    %2211 = scf.if %2210 -> (i64) {
      scf.yield %2208 : i64
    } else {
      scf.yield %2190 : i64
    }
    %2212 = func.call @cc_values_pack(%2211) : (i64) -> i64
    func.call @stack_push_pointer(%2212) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_241389006749698"() {
    %1435 = func.call @stack_pop_pointer() : () -> i64
    %1436 = func.call @stack_pop_pointer() : () -> i64
    %1437 = func.call @cc_nil_value() : () -> i64
    %1438 = func.call @cc_nil_value() : () -> i64
    %1439 = func.call @cc_errorp(%1437) : (i64) -> i64
    %1440 = arith.cmpi ne, %1439, %1438 : i64
    %1441 = scf.if %1440 -> (i64) {
      scf.yield %1437 : i64
    } else {
      %1442 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1443 = arith.constant 9 : i64
      %1444 = func.call @cc_make_string(%1442, %1443) : (!llvm.ptr, i64) -> i64
      %1445 = func.call @cc_nil_value() : () -> i64
      %1446 = func.call @cc_intern(%1444, %1445) : (i64, i64) -> i64
      %1447 = func.call @cc_nil_value() : () -> i64
      %1448 = func.call @cc_cons(%1446, %1447) : (i64, i64) -> i64
      %1449 = func.call @cc_values_pack(%1448) : (i64) -> i64
      %1450 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1451 = arith.constant 13 : i64
      %1452 = func.call @cc_make_string(%1450, %1451) : (!llvm.ptr, i64) -> i64
      %1453 = func.call @cc_nil_value() : () -> i64
      %1454 = func.call @cc_intern(%1452, %1453) : (i64, i64) -> i64
      %1455 = func.call @cc_nil_value() : () -> i64
      %1456 = func.call @cc_cons(%1454, %1455) : (i64, i64) -> i64
      %1457 = func.call @cc_values_pack(%1456) : (i64) -> i64
      %1458 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1459 = arith.constant 12 : i64
      %1460 = func.call @cc_make_string(%1458, %1459) : (!llvm.ptr, i64) -> i64
      %1461 = func.call @cc_nil_value() : () -> i64
      %1462 = func.call @cc_intern(%1460, %1461) : (i64, i64) -> i64
      %1463 = func.call @cc_nil_value() : () -> i64
      %1464 = func.call @cc_cons(%1462, %1463) : (i64, i64) -> i64
      %1465 = func.call @cc_values_pack(%1464) : (i64) -> i64
      %1466 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1467 = arith.constant 12 : i64
      %1468 = func.call @cc_make_string(%1466, %1467) : (!llvm.ptr, i64) -> i64
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = func.call @cc_intern(%1468, %1469) : (i64, i64) -> i64
      %1471 = func.call @cc_nil_value() : () -> i64
      %1472 = func.call @cc_cons(%1470, %1471) : (i64, i64) -> i64
      %1473 = func.call @cc_values_pack(%1472) : (i64) -> i64
      %1474 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1475 = arith.constant 14 : i64
      %1476 = func.call @cc_make_string(%1474, %1475) : (!llvm.ptr, i64) -> i64
      %1477 = func.call @cc_nil_value() : () -> i64
      %1478 = func.call @cc_intern(%1476, %1477) : (i64, i64) -> i64
      %1479 = func.call @cc_nil_value() : () -> i64
      %1480 = func.call @cc_cons(%1478, %1479) : (i64, i64) -> i64
      %1481 = func.call @cc_values_pack(%1480) : (i64) -> i64
      %1482 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1483 = arith.constant 14 : i64
      %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
      %1485 = func.call @cc_nil_value() : () -> i64
      %1486 = func.call @cc_intern(%1484, %1485) : (i64, i64) -> i64
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = func.call @cc_cons(%1486, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_values_pack(%1488) : (i64) -> i64
      %1490 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1491 = arith.constant 14 : i64
      %1492 = func.call @cc_make_string(%1490, %1491) : (!llvm.ptr, i64) -> i64
      %1493 = func.call @cc_nil_value() : () -> i64
      %1494 = func.call @cc_intern(%1492, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_nil_value() : () -> i64
      %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_values_pack(%1496) : (i64) -> i64
      %1498 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1499 = arith.constant 14 : i64
      %1500 = func.call @cc_make_string(%1498, %1499) : (!llvm.ptr, i64) -> i64
      %1501 = func.call @cc_nil_value() : () -> i64
      %1502 = func.call @cc_intern(%1500, %1501) : (i64, i64) -> i64
      %1503 = func.call @cc_nil_value() : () -> i64
      %1504 = func.call @cc_cons(%1502, %1503) : (i64, i64) -> i64
      %1505 = func.call @cc_values_pack(%1504) : (i64) -> i64
      %1506 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1507 = arith.constant 13 : i64
      %1508 = func.call @cc_make_string(%1506, %1507) : (!llvm.ptr, i64) -> i64
      %1509 = func.call @cc_nil_value() : () -> i64
      %1510 = func.call @cc_intern(%1508, %1509) : (i64, i64) -> i64
      %1511 = func.call @cc_nil_value() : () -> i64
      %1512 = func.call @cc_cons(%1510, %1511) : (i64, i64) -> i64
      %1513 = func.call @cc_values_pack(%1512) : (i64) -> i64
      %1514 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1515 = arith.constant 13 : i64
      %1516 = func.call @cc_make_string(%1514, %1515) : (!llvm.ptr, i64) -> i64
      %1517 = func.call @cc_nil_value() : () -> i64
      %1518 = func.call @cc_intern(%1516, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_nil_value() : () -> i64
      %1520 = func.call @cc_cons(%1518, %1519) : (i64, i64) -> i64
      %1521 = func.call @cc_values_pack(%1520) : (i64) -> i64
      %1522 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1523 = arith.constant 19 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = func.call @cc_intern(%1524, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_nil_value() : () -> i64
      %1528 = func.call @cc_cons(%1526, %1527) : (i64, i64) -> i64
      %1529 = func.call @cc_values_pack(%1528) : (i64) -> i64
      %1530 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1531 = arith.constant 23 : i64
      %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
      %1533 = func.call @cc_nil_value() : () -> i64
      %1534 = func.call @cc_intern(%1532, %1533) : (i64, i64) -> i64
      %1535 = func.call @cc_nil_value() : () -> i64
      %1536 = func.call @cc_cons(%1534, %1535) : (i64, i64) -> i64
      %1537 = func.call @cc_values_pack(%1536) : (i64) -> i64
      %1538 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1539 = arith.constant 14 : i64
      %1540 = func.call @cc_make_string(%1538, %1539) : (!llvm.ptr, i64) -> i64
      %1541 = func.call @cc_nil_value() : () -> i64
      %1542 = func.call @cc_intern(%1540, %1541) : (i64, i64) -> i64
      %1543 = func.call @cc_nil_value() : () -> i64
      %1544 = func.call @cc_cons(%1542, %1543) : (i64, i64) -> i64
      %1545 = func.call @cc_values_pack(%1544) : (i64) -> i64
      %1546 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1547 = arith.constant 13 : i64
      %1548 = func.call @cc_make_string(%1546, %1547) : (!llvm.ptr, i64) -> i64
      %1549 = func.call @cc_nil_value() : () -> i64
      %1550 = func.call @cc_intern(%1548, %1549) : (i64, i64) -> i64
      %1551 = func.call @cc_nil_value() : () -> i64
      %1552 = func.call @cc_cons(%1550, %1551) : (i64, i64) -> i64
      %1553 = func.call @cc_values_pack(%1552) : (i64) -> i64
      %1554 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1555 = arith.constant 16 : i64
      %1556 = func.call @cc_make_string(%1554, %1555) : (!llvm.ptr, i64) -> i64
      %1557 = func.call @cc_nil_value() : () -> i64
      %1558 = func.call @cc_intern(%1556, %1557) : (i64, i64) -> i64
      %1559 = func.call @cc_nil_value() : () -> i64
      %1560 = func.call @cc_cons(%1558, %1559) : (i64, i64) -> i64
      %1561 = func.call @cc_values_pack(%1560) : (i64) -> i64
      %1562 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1563 = arith.constant 20 : i64
      %1564 = func.call @cc_make_string(%1562, %1563) : (!llvm.ptr, i64) -> i64
      %1565 = func.call @cc_nil_value() : () -> i64
      %1566 = func.call @cc_intern(%1564, %1565) : (i64, i64) -> i64
      %1567 = func.call @cc_nil_value() : () -> i64
      %1568 = func.call @cc_cons(%1566, %1567) : (i64, i64) -> i64
      %1569 = func.call @cc_values_pack(%1568) : (i64) -> i64
      %1570 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1571 = arith.constant 11 : i64
      %1572 = func.call @cc_make_string(%1570, %1571) : (!llvm.ptr, i64) -> i64
      %1573 = func.call @cc_nil_value() : () -> i64
      %1574 = func.call @cc_intern(%1572, %1573) : (i64, i64) -> i64
      %1575 = func.call @cc_nil_value() : () -> i64
      %1576 = func.call @cc_cons(%1574, %1575) : (i64, i64) -> i64
      %1577 = func.call @cc_values_pack(%1576) : (i64) -> i64
      %1578 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1579 = arith.constant 27 : i64
      %1580 = func.call @cc_make_string(%1578, %1579) : (!llvm.ptr, i64) -> i64
      %1581 = func.call @cc_nil_value() : () -> i64
      %1582 = func.call @cc_intern(%1580, %1581) : (i64, i64) -> i64
      %1583 = func.call @cc_nil_value() : () -> i64
      %1584 = func.call @cc_cons(%1582, %1583) : (i64, i64) -> i64
      %1585 = func.call @cc_values_pack(%1584) : (i64) -> i64
      %1586 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1587 = arith.constant 11 : i64
      %1588 = func.call @cc_make_string(%1586, %1587) : (!llvm.ptr, i64) -> i64
      %1589 = func.call @cc_nil_value() : () -> i64
      %1590 = func.call @cc_intern(%1588, %1589) : (i64, i64) -> i64
      %1591 = func.call @cc_nil_value() : () -> i64
      %1592 = func.call @cc_cons(%1590, %1591) : (i64, i64) -> i64
      %1593 = func.call @cc_values_pack(%1592) : (i64) -> i64
      %1594 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1595 = arith.constant 15 : i64
      %1596 = func.call @cc_make_string(%1594, %1595) : (!llvm.ptr, i64) -> i64
      %1597 = func.call @cc_nil_value() : () -> i64
      %1598 = func.call @cc_intern(%1596, %1597) : (i64, i64) -> i64
      %1599 = func.call @cc_nil_value() : () -> i64
      %1600 = func.call @cc_cons(%1598, %1599) : (i64, i64) -> i64
      %1601 = func.call @cc_values_pack(%1600) : (i64) -> i64
      %1602 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1603 = arith.constant 11 : i64
      %1604 = func.call @cc_make_string(%1602, %1603) : (!llvm.ptr, i64) -> i64
      %1605 = func.call @cc_nil_value() : () -> i64
      %1606 = func.call @cc_intern(%1604, %1605) : (i64, i64) -> i64
      %1607 = func.call @cc_nil_value() : () -> i64
      %1608 = func.call @cc_cons(%1606, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_values_pack(%1608) : (i64) -> i64
      %1610 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1611 = arith.constant 16 : i64
      %1612 = func.call @cc_make_string(%1610, %1611) : (!llvm.ptr, i64) -> i64
      %1613 = func.call @cc_nil_value() : () -> i64
      %1614 = func.call @cc_intern(%1612, %1613) : (i64, i64) -> i64
      %1615 = func.call @cc_nil_value() : () -> i64
      %1616 = func.call @cc_cons(%1614, %1615) : (i64, i64) -> i64
      %1617 = func.call @cc_values_pack(%1616) : (i64) -> i64
      %1618 = func.call @cc_t_value() : () -> i64
      %1619 = arith.constant 10 : i64
      %1620 = func.call @cc_box_fixnum(%1619) : (i64) -> i64
      %1621 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1622 = arith.constant 6 : i64
      %1623 = func.call @cc_make_string(%1621, %1622) : (!llvm.ptr, i64) -> i64
      %1624 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1625 = arith.constant 7 : i64
      %1626 = func.call @cc_make_string(%1624, %1625) : (!llvm.ptr, i64) -> i64
      %1627 = func.call @cc_intern(%1623, %1626) : (i64, i64) -> i64
      %1628 = func.call @cc_nil_value() : () -> i64
      %1629 = func.call @cc_cons(%1627, %1628) : (i64, i64) -> i64
      %1630 = func.call @cc_values_pack(%1629) : (i64) -> i64
      %1631 = func.call @cc_nil_value() : () -> i64
      %1632 = func.call @cc_t_value() : () -> i64
      %1633 = func.call @cc_t_value() : () -> i64
      %1634 = func.call @cc_nil_value() : () -> i64
      %1635 = func.call @cc_nil_value() : () -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_nil_value() : () -> i64
      %1638 = func.call @cc_nil_value() : () -> i64
      %1639 = func.call @cc_nil_value() : () -> i64
      %1640 = func.call @cc_nil_value() : () -> i64
      %1641 = func.call @cc_nil_value() : () -> i64
      %1642 = func.call @cc_nil_value() : () -> i64
      %1643 = arith.constant 10 : i64
      %1644 = func.call @cc_box_fixnum(%1643) : (i64) -> i64
      %1645 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1646 = arith.constant 12 : i64
      %1647 = func.call @cc_make_string(%1645, %1646) : (!llvm.ptr, i64) -> i64
      %1648 = func.call @cc_nil_value() : () -> i64
      %1649 = func.call @cc_intern(%1647, %1648) : (i64, i64) -> i64
      %1650 = func.call @cc_nil_value() : () -> i64
      %1651 = func.call @cc_cons(%1649, %1650) : (i64, i64) -> i64
      %1652 = func.call @cc_values_pack(%1651) : (i64) -> i64
      %1653 = func.call @cc_t_value() : () -> i64
      %1654 = func.call @cc_nil_value() : () -> i64
      %1655 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1656 = arith.constant 20 : i64
      %1657 = func.call @cc_make_string(%1655, %1656) : (!llvm.ptr, i64) -> i64
      %1658 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1659 = arith.constant 16 : i64
      %1660 = func.call @cc_make_string(%1658, %1659) : (!llvm.ptr, i64) -> i64
      %1661 = func.call @cc_intern(%1657, %1660) : (i64, i64) -> i64
      %1662 = func.call @cc_nil_value() : () -> i64
      %1663 = func.call @cc_cons(%1661, %1662) : (i64, i64) -> i64
      %1664 = func.call @cc_values_pack(%1663) : (i64) -> i64
      %1665 = func.call @cc_nil_value() : () -> i64
      %1666 = func.call @cc_cons(%1606, %1665) : (i64, i64) -> i64
      %1667 = func.call @cc_cons(%1598, %1666) : (i64, i64) -> i64
      %1668 = func.call @cc_cons(%1590, %1667) : (i64, i64) -> i64
      %1669 = func.call @cc_cons(%1582, %1668) : (i64, i64) -> i64
      %1670 = func.call @cc_cons(%1574, %1669) : (i64, i64) -> i64
      %1671 = func.call @cc_cons(%1566, %1670) : (i64, i64) -> i64
      %1672 = func.call @cc_cons(%1558, %1671) : (i64, i64) -> i64
      %1673 = func.call @cc_cons(%1550, %1672) : (i64, i64) -> i64
      %1674 = func.call @cc_cons(%1542, %1673) : (i64, i64) -> i64
      %1675 = func.call @cc_cons(%1534, %1674) : (i64, i64) -> i64
      %1676 = func.call @cc_cons(%1526, %1675) : (i64, i64) -> i64
      %1677 = func.call @cc_cons(%1518, %1676) : (i64, i64) -> i64
      %1678 = func.call @cc_cons(%1510, %1677) : (i64, i64) -> i64
      %1679 = func.call @cc_cons(%1502, %1678) : (i64, i64) -> i64
      %1680 = func.call @cc_cons(%1494, %1679) : (i64, i64) -> i64
      %1681 = func.call @cc_cons(%1486, %1680) : (i64, i64) -> i64
      %1682 = func.call @cc_cons(%1478, %1681) : (i64, i64) -> i64
      %1683 = func.call @cc_cons(%1470, %1682) : (i64, i64) -> i64
      %1684 = func.call @cc_cons(%1462, %1683) : (i64, i64) -> i64
      %1685 = func.call @cc_cons(%1454, %1684) : (i64, i64) -> i64
      %1686 = func.call @cc_cons(%1446, %1685) : (i64, i64) -> i64
      %1687 = func.call @cc_nil_value() : () -> i64
      %1688 = func.call @cc_cons(%1661, %1687) : (i64, i64) -> i64
      %1689 = func.call @cc_cons(%1654, %1688) : (i64, i64) -> i64
      %1690 = func.call @cc_cons(%1653, %1689) : (i64, i64) -> i64
      %1691 = func.call @cc_cons(%1649, %1690) : (i64, i64) -> i64
      %1692 = func.call @cc_cons(%1644, %1691) : (i64, i64) -> i64
      %1693 = func.call @cc_cons(%1642, %1692) : (i64, i64) -> i64
      %1694 = func.call @cc_cons(%1641, %1693) : (i64, i64) -> i64
      %1695 = func.call @cc_cons(%1640, %1694) : (i64, i64) -> i64
      %1696 = func.call @cc_cons(%1639, %1695) : (i64, i64) -> i64
      %1697 = func.call @cc_cons(%1638, %1696) : (i64, i64) -> i64
      %1698 = func.call @cc_cons(%1637, %1697) : (i64, i64) -> i64
      %1699 = func.call @cc_cons(%1636, %1698) : (i64, i64) -> i64
      %1700 = func.call @cc_cons(%1635, %1699) : (i64, i64) -> i64
      %1701 = func.call @cc_cons(%1634, %1700) : (i64, i64) -> i64
      %1702 = func.call @cc_cons(%1633, %1701) : (i64, i64) -> i64
      %1703 = func.call @cc_cons(%1632, %1702) : (i64, i64) -> i64
      %1704 = func.call @cc_cons(%1631, %1703) : (i64, i64) -> i64
      %1705 = func.call @cc_cons(%1627, %1704) : (i64, i64) -> i64
      %1706 = func.call @cc_cons(%1620, %1705) : (i64, i64) -> i64
      %1707 = func.call @cc_cons(%1618, %1706) : (i64, i64) -> i64
      %1708 = func.call @cc_cons(%1614, %1707) : (i64, i64) -> i64
      %1709 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1710 = arith.constant 12 : i64
      %1711 = func.call @cc_make_string(%1709, %1710) : (!llvm.ptr, i64) -> i64
      %1712 = func.call @cc_nil_value() : () -> i64
      %1713 = func.call @cc_intern(%1711, %1712) : (i64, i64) -> i64
      %1714 = func.call @cc_nil_value() : () -> i64
      %1715 = func.call @cc_cons(%1713, %1714) : (i64, i64) -> i64
      %1716 = func.call @cc_values_pack(%1715) : (i64) -> i64
      func.call @stack_push_pointer(%1686) : (i64) -> ()
      func.call @stack_push_pointer(%1708) : (i64) -> ()
      %1717 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%1713, %1717) : (i64, i64) -> ()
      %1718 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1719 = func.call @stack_pop_pointer() : () -> i64
      %1720 = func.call @cc_nil_value() : () -> i64
      %1721 = func.call @cc_errorp(%1719) : (i64) -> i64
      %1722 = arith.cmpi ne, %1721, %1720 : i64
      %1723 = arith.cmpi eq, %1720, %1720 : i64
      %1724 = arith.andi %1722, %1723 : i1
      %1725 = scf.if %1724 -> (i64) {
        scf.yield %1719 : i64
      } else {
        scf.yield %1720 : i64
      }
      %1726 = arith.cmpi ne, %1725, %1720 : i64
      scf.if %1726 {
        func.call @stack_push_pointer(%1725) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1719) : (i64) -> ()
        %1727 = llvm.mlir.addressof @str168 : !llvm.ptr
        %1728 = func.call @cc_make_function_ref_const(%1727) : (!llvm.ptr) -> i64
        %1729 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1728, %1729) : (i64, i64) -> ()
      }
      %1730 = func.call @stack_pop_pointer() : () -> i64
      %1731 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1732 = arith.constant 23 : i64
      %1733 = func.call @cc_make_symbol(%1731, %1732) : (!llvm.ptr, i64) -> i64
      %1734 = func.call @cc_symbol_value(%1733) : (i64) -> i64
      %1735 = func.call @cc_set_symbol_value(%1733, %1730) : (i64, i64) -> i64
      %1736 = func.call @cc_nil_value() : () -> i64
      %1737 = func.call @cc_nil_value() : () -> i64
      %1738 = func.call @cc_errorp(%1736) : (i64) -> i64
      %1739 = arith.cmpi ne, %1738, %1737 : i64
      %1740 = scf.if %1739 -> (i64) {
        scf.yield %1736 : i64
      } else {
        %1741 = llvm.mlir.addressof @str170 : !llvm.ptr
        %1742 = arith.constant 6 : i64
        %1743 = func.call @cc_make_string(%1741, %1742) : (!llvm.ptr, i64) -> i64
        %1744 = llvm.mlir.addressof @str171 : !llvm.ptr
        %1745 = arith.constant 11 : i64
        %1746 = func.call @cc_make_string(%1744, %1745) : (!llvm.ptr, i64) -> i64
        %1747 = func.call @cc_intern(%1743, %1746) : (i64, i64) -> i64
        %1748 = func.call @cc_nil_value() : () -> i64
        %1749 = func.call @cc_cons(%1747, %1748) : (i64, i64) -> i64
        %1750 = func.call @cc_values_pack(%1749) : (i64) -> i64
        func.call @stack_push_pointer(%1747) : (i64) -> ()
        %1751 = func.call @stack_pop_pointer() : () -> i64
        %1752 = func.call @cc_nil_value() : () -> i64
        %1753 = llvm.mlir.addressof @str172 : !llvm.ptr
        %1754 = arith.constant 1 : i64
        %1755 = func.call @cc_make_string(%1753, %1754) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1755) : (i64) -> ()
        %1756 = func.call @stack_pop_pointer() : () -> i64
        %1757 = func.call @cc_cons(%1756, %1752) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1435) : (i64) -> ()
        %1758 = func.call @stack_pop_pointer() : () -> i64
        %1759 = func.call @cc_string(%1758) : (i64) -> i64
        func.call @stack_push_pointer(%1759) : (i64) -> ()
        %1760 = func.call @stack_pop_pointer() : () -> i64
        %1761 = func.call @cc_cons(%1760, %1757) : (i64, i64) -> i64
        %1762 = func.call @cc_concatenate(%1751, %1761) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1762) : (i64) -> ()
        %1763 = func.call @stack_pop_pointer() : () -> i64
        %1764 = func.call @cc_nil_value() : () -> i64
        %1765 = func.call @cc_errorp(%1763) : (i64) -> i64
        %1766 = arith.cmpi ne, %1765, %1764 : i64
        %1767 = arith.cmpi eq, %1764, %1764 : i64
        %1768 = arith.andi %1766, %1767 : i1
        %1769 = scf.if %1768 -> (i64) {
          scf.yield %1763 : i64
        } else {
          scf.yield %1764 : i64
        }
        %1770 = arith.cmpi ne, %1769, %1764 : i64
        scf.if %1770 {
          func.call @stack_push_pointer(%1769) : (i64) -> ()
        } else {
          %1771 = func.call @cc_nil_value() : () -> i64
          %1772 = func.call @cc_cons(%1763, %1771) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1772) : (i64) -> ()
          func.call @cc_read_from_string_stack() : () -> ()
        }
        %1773 = func.call @stack_pop_pointer() : () -> i64
        %1774 = func.call @cc_errorp(%1773) : (i64) -> i64
        %1775 = func.call @cc_nil_value() : () -> i64
        %1776 = arith.cmpi ne, %1774, %1775 : i64
        %1777 = scf.if %1776 -> (i64) {
          %1778 = func.call @cc_condition_value(%1773) : (i64) -> i64
          %1779 = llvm.mlir.addressof @str173 : !llvm.ptr
          %1780 = arith.constant 12 : i64
          %1781 = func.call @cc_make_string(%1779, %1780) : (!llvm.ptr, i64) -> i64
          %1782 = llvm.mlir.addressof @str174 : !llvm.ptr
          %1783 = arith.constant 11 : i64
          %1784 = func.call @cc_make_string(%1782, %1783) : (!llvm.ptr, i64) -> i64
          %1785 = func.call @cc_intern(%1781, %1784) : (i64, i64) -> i64
          %1786 = func.call @cc_nil_value() : () -> i64
          %1787 = func.call @cc_cons(%1785, %1786) : (i64, i64) -> i64
          %1788 = func.call @cc_values_pack(%1787) : (i64) -> i64
          func.call @stack_push_pointer(%1785) : (i64) -> ()
          %1789 = func.call @stack_pop_pointer() : () -> i64
          %1790 = func.call @cc_typep(%1778, %1789) : (i64, i64) -> i64
          %1791 = func.call @cc_nil_value() : () -> i64
          %1792 = arith.cmpi ne, %1790, %1791 : i64
          %1793 = scf.if %1792 -> (i64) {
            func.call @stack_push_pointer(%1778) : (i64) -> ()
            %1794 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1794 : i64
          } else {
            scf.yield %1773 : i64
          }
          scf.yield %1793 : i64
        } else {
          scf.yield %1773 : i64
        }
        func.call @stack_push_pointer(%1777) : (i64) -> ()
        %1795 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1795 : i64
      }
      func.call @stack_push_pointer(%1740) : (i64) -> ()
      %1796 = func.call @cc_restore_symbol_value(%1733, %1734) : (i64, i64) -> i64
      %1797 = func.call @stack_pop_pointer() : () -> i64
      %1798 = func.call @cc_nil_value() : () -> i64
      %1799 = func.call @cc_errorp(%1797) : (i64) -> i64
      %1800 = arith.cmpi ne, %1799, %1798 : i64
      %1801 = scf.if %1800 -> (i64) {
        scf.yield %1797 : i64
      } else {
        %1802 = func.call @cc_multiple_value_list(%1797) : (i64) -> i64
        scf.yield %1802 : i64
      }
      %1803 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1804 = arith.constant 11 : i64
      %1805 = func.call @cc_make_string(%1803, %1804) : (!llvm.ptr, i64) -> i64
      %1806 = func.call @cc_nil_value() : () -> i64
      %1807 = func.call @cc_intern(%1805, %1806) : (i64, i64) -> i64
      %1808 = func.call @cc_nil_value() : () -> i64
      %1809 = func.call @cc_cons(%1807, %1808) : (i64, i64) -> i64
      %1810 = func.call @cc_values_pack(%1809) : (i64) -> i64
      func.call @stack_push_pointer(%1718) : (i64) -> ()
      %1811 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1807, %1811) : (i64, i64) -> ()
      %1812 = func.call @stack_pop_pointer() : () -> i64
      %1813 = scf.if %1800 -> (i64) {
        scf.yield %1801 : i64
      } else {
        %1814 = func.call @cc_values_pack(%1801) : (i64) -> i64
        scf.yield %1814 : i64
      }
      func.call @stack_push_pointer(%1813) : (i64) -> ()
      %1815 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1815 : i64
    }
    func.call @stack_push_pointer(%1441) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_241389006749697"() {
    %1332 = func.call @stack_pop_pointer() : () -> i64
    %1333 = func.call @cc_nil_value() : () -> i64
    %1334 = func.call @cc_nil_value() : () -> i64
    %1335 = func.call @cc_errorp(%1333) : (i64) -> i64
    %1336 = arith.cmpi ne, %1335, %1334 : i64
    %1337 = scf.if %1336 -> (i64) {
      scf.yield %1333 : i64
    } else {
      %1338 = arith.constant 8 : i64
      %1339 = func.call @cc_box_character(%1338) : (i64) -> i64
      func.call @stack_push_pointer(%1339) : (i64) -> ()
      %1340 = func.call @stack_pop_pointer() : () -> i64
      %1341 = arith.constant 9 : i64
      %1342 = func.call @cc_box_character(%1341) : (i64) -> i64
      func.call @stack_push_pointer(%1342) : (i64) -> ()
      %1343 = func.call @stack_pop_pointer() : () -> i64
      %1344 = arith.constant 10 : i64
      %1345 = func.call @cc_box_character(%1344) : (i64) -> i64
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = arith.constant 10 : i64
      %1348 = func.call @cc_box_character(%1347) : (i64) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = arith.constant 12 : i64
      %1351 = func.call @cc_box_character(%1350) : (i64) -> i64
      func.call @stack_push_pointer(%1351) : (i64) -> ()
      %1352 = func.call @stack_pop_pointer() : () -> i64
      %1353 = arith.constant 13 : i64
      %1354 = func.call @cc_box_character(%1353) : (i64) -> i64
      func.call @stack_push_pointer(%1354) : (i64) -> ()
      %1355 = func.call @stack_pop_pointer() : () -> i64
      %1356 = arith.constant 32 : i64
      %1357 = func.call @cc_box_character(%1356) : (i64) -> i64
      func.call @stack_push_pointer(%1357) : (i64) -> ()
      %1358 = func.call @stack_pop_pointer() : () -> i64
      %1359 = arith.constant 127 : i64
      %1360 = func.call @cc_box_character(%1359) : (i64) -> i64
      func.call @stack_push_pointer(%1360) : (i64) -> ()
      %1361 = func.call @stack_pop_pointer() : () -> i64
      %1362 = func.call @cc_nil_value() : () -> i64
      %1363 = func.call @cc_errorp(%1340) : (i64) -> i64
      %1364 = arith.cmpi ne, %1363, %1362 : i64
      %1365 = arith.cmpi eq, %1362, %1362 : i64
      %1366 = arith.andi %1364, %1365 : i1
      %1367 = scf.if %1366 -> (i64) {
        scf.yield %1340 : i64
      } else {
        scf.yield %1362 : i64
      }
      %1368 = func.call @cc_errorp(%1343) : (i64) -> i64
      %1369 = arith.cmpi ne, %1368, %1362 : i64
      %1370 = arith.cmpi eq, %1367, %1362 : i64
      %1371 = arith.andi %1369, %1370 : i1
      %1372 = scf.if %1371 -> (i64) {
        scf.yield %1343 : i64
      } else {
        scf.yield %1367 : i64
      }
      %1373 = func.call @cc_errorp(%1346) : (i64) -> i64
      %1374 = arith.cmpi ne, %1373, %1362 : i64
      %1375 = arith.cmpi eq, %1372, %1362 : i64
      %1376 = arith.andi %1374, %1375 : i1
      %1377 = scf.if %1376 -> (i64) {
        scf.yield %1346 : i64
      } else {
        scf.yield %1372 : i64
      }
      %1378 = func.call @cc_errorp(%1349) : (i64) -> i64
      %1379 = arith.cmpi ne, %1378, %1362 : i64
      %1380 = arith.cmpi eq, %1377, %1362 : i64
      %1381 = arith.andi %1379, %1380 : i1
      %1382 = scf.if %1381 -> (i64) {
        scf.yield %1349 : i64
      } else {
        scf.yield %1377 : i64
      }
      %1383 = func.call @cc_errorp(%1352) : (i64) -> i64
      %1384 = arith.cmpi ne, %1383, %1362 : i64
      %1385 = arith.cmpi eq, %1382, %1362 : i64
      %1386 = arith.andi %1384, %1385 : i1
      %1387 = scf.if %1386 -> (i64) {
        scf.yield %1352 : i64
      } else {
        scf.yield %1382 : i64
      }
      %1388 = func.call @cc_errorp(%1355) : (i64) -> i64
      %1389 = arith.cmpi ne, %1388, %1362 : i64
      %1390 = arith.cmpi eq, %1387, %1362 : i64
      %1391 = arith.andi %1389, %1390 : i1
      %1392 = scf.if %1391 -> (i64) {
        scf.yield %1355 : i64
      } else {
        scf.yield %1387 : i64
      }
      %1393 = func.call @cc_errorp(%1358) : (i64) -> i64
      %1394 = arith.cmpi ne, %1393, %1362 : i64
      %1395 = arith.cmpi eq, %1392, %1362 : i64
      %1396 = arith.andi %1394, %1395 : i1
      %1397 = scf.if %1396 -> (i64) {
        scf.yield %1358 : i64
      } else {
        scf.yield %1392 : i64
      }
      %1398 = func.call @cc_errorp(%1361) : (i64) -> i64
      %1399 = arith.cmpi ne, %1398, %1362 : i64
      %1400 = arith.cmpi eq, %1397, %1362 : i64
      %1401 = arith.andi %1399, %1400 : i1
      %1402 = scf.if %1401 -> (i64) {
        scf.yield %1361 : i64
      } else {
        scf.yield %1397 : i64
      }
      %1403 = arith.cmpi ne, %1402, %1362 : i64
      scf.if %1403 {
        func.call @stack_push_pointer(%1402) : (i64) -> ()
      } else {
        %1404 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1404) : (i64) -> ()
        func.call @stack_push_pointer(%1361) : (i64) -> ()
        %1405 = func.call @stack_pop_pointer() : () -> i64
        %1406 = func.call @stack_pop_pointer() : () -> i64
        %1407 = func.call @cc_cons(%1405, %1406) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1407) : (i64) -> ()
        func.call @stack_push_pointer(%1358) : (i64) -> ()
        %1408 = func.call @stack_pop_pointer() : () -> i64
        %1409 = func.call @stack_pop_pointer() : () -> i64
        %1410 = func.call @cc_cons(%1408, %1409) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1410) : (i64) -> ()
        func.call @stack_push_pointer(%1355) : (i64) -> ()
        %1411 = func.call @stack_pop_pointer() : () -> i64
        %1412 = func.call @stack_pop_pointer() : () -> i64
        %1413 = func.call @cc_cons(%1411, %1412) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1413) : (i64) -> ()
        func.call @stack_push_pointer(%1352) : (i64) -> ()
        %1414 = func.call @stack_pop_pointer() : () -> i64
        %1415 = func.call @stack_pop_pointer() : () -> i64
        %1416 = func.call @cc_cons(%1414, %1415) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1416) : (i64) -> ()
        func.call @stack_push_pointer(%1349) : (i64) -> ()
        %1417 = func.call @stack_pop_pointer() : () -> i64
        %1418 = func.call @stack_pop_pointer() : () -> i64
        %1419 = func.call @cc_cons(%1417, %1418) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1419) : (i64) -> ()
        func.call @stack_push_pointer(%1346) : (i64) -> ()
        %1420 = func.call @stack_pop_pointer() : () -> i64
        %1421 = func.call @stack_pop_pointer() : () -> i64
        %1422 = func.call @cc_cons(%1420, %1421) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1422) : (i64) -> ()
        func.call @stack_push_pointer(%1343) : (i64) -> ()
        %1423 = func.call @stack_pop_pointer() : () -> i64
        %1424 = func.call @stack_pop_pointer() : () -> i64
        %1425 = func.call @cc_cons(%1423, %1424) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1425) : (i64) -> ()
        func.call @stack_push_pointer(%1340) : (i64) -> ()
        %1426 = func.call @stack_pop_pointer() : () -> i64
        %1427 = func.call @stack_pop_pointer() : () -> i64
        %1428 = func.call @cc_cons(%1426, %1427) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1428) : (i64) -> ()
      }
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @cc_nil_value() : () -> i64
      %1431 = func.call @cc_nil_value() : () -> i64
      %1432 = func.call @cc_errorp(%1430) : (i64) -> i64
      %1433 = arith.cmpi ne, %1432, %1431 : i64
      %1434 = scf.if %1433 -> (i64) {
        scf.yield %1430 : i64
      } else {
        func.call @stack_push_pointer(%1332) : (i64) -> ()
        %1816 = arith.constant 241389006749698 : i64
        %1817 = arith.constant 1 : i64
        %1818 = func.call @cc_make_closure(%1816, %1817) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1818) : (i64) -> ()
        %1819 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1429) : (i64) -> ()
        %1820 = func.call @stack_pop_pointer() : () -> i64
        %1821 = func.call @cc_nil_value() : () -> i64
        %1822 = func.call @cc_errorp(%1819) : (i64) -> i64
        %1823 = arith.cmpi ne, %1822, %1821 : i64
        %1824 = arith.cmpi eq, %1821, %1821 : i64
        %1825 = arith.andi %1823, %1824 : i1
        %1826 = scf.if %1825 -> (i64) {
          scf.yield %1819 : i64
        } else {
          scf.yield %1821 : i64
        }
        %1827 = func.call @cc_errorp(%1820) : (i64) -> i64
        %1828 = arith.cmpi ne, %1827, %1821 : i64
        %1829 = arith.cmpi eq, %1826, %1821 : i64
        %1830 = arith.andi %1828, %1829 : i1
        %1831 = scf.if %1830 -> (i64) {
          scf.yield %1820 : i64
        } else {
          scf.yield %1826 : i64
        }
        %1832 = arith.cmpi ne, %1831, %1821 : i64
        scf.if %1832 {
          func.call @stack_push_pointer(%1831) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1819) : (i64) -> ()
          func.call @stack_push_pointer(%1820) : (i64) -> ()
          %1833 = llvm.mlir.addressof @str176 : !llvm.ptr
          %1834 = func.call @cc_make_function_ref_const(%1833) : (!llvm.ptr) -> i64
          %1835 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1834, %1835) : (i64, i64) -> ()
        }
        %1836 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1836 : i64
      }
      func.call @stack_push_pointer(%1434) : (i64) -> ()
      %1837 = func.call @stack_pop_pointer() : () -> i64
      %1838 = func.call @cc_nil_value() : () -> i64
      %1839 = func.call @cc_nil_value() : () -> i64
      %1840 = func.call @cc_errorp(%1838) : (i64) -> i64
      %1841 = arith.cmpi ne, %1840, %1839 : i64
      %1842 = scf.if %1841 -> (i64) {
        scf.yield %1838 : i64
      } else {
        %1843 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%1843) : (i64) -> ()
        %1844 = func.call @stack_pop_pointer() : () -> i64
        %1845 = llvm.mlir.addressof @str177 : !llvm.ptr
        %1846 = arith.constant 25 : i64
        %1847 = func.call @cc_make_string(%1845, %1846) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1847) : (i64) -> ()
        %1848 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1849 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1844) : (i64) -> ()
        func.call @stack_push_pointer(%1848) : (i64) -> ()
        func.call @stack_push_pointer(%1849) : (i64) -> ()
        %1850 = llvm.mlir.addressof @str178 : !llvm.ptr
        %1851 = func.call @cc_make_function_ref_const(%1850) : (!llvm.ptr) -> i64
        %1852 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1851, %1852) : (i64, i64) -> ()
        %1853 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1853 : i64
      }
      %1854 = func.call @cc_nil_value() : () -> i64
      %1855 = func.call @cc_errorp(%1842) : (i64) -> i64
      %1856 = arith.cmpi ne, %1855, %1854 : i64
      %1857 = scf.if %1856 -> (i64) {
        scf.yield %1842 : i64
      } else {
        %1858 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%1858) : (i64) -> ()
        %1859 = func.call @stack_pop_pointer() : () -> i64
        %1860 = llvm.mlir.addressof @str179 : !llvm.ptr
        %1861 = arith.constant 34 : i64
        %1862 = func.call @cc_make_string(%1860, %1861) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1862) : (i64) -> ()
        %1863 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1864 = func.call @stack_pop_pointer() : () -> i64
        %1865 = func.call @cc_car(%1864) : (i64) -> i64
        func.call @stack_push_pointer(%1865) : (i64) -> ()
        %1866 = llvm.mlir.addressof @str180 : !llvm.ptr
        %1867 = arith.constant 12 : i64
        %1868 = func.call @cc_make_string(%1866, %1867) : (!llvm.ptr, i64) -> i64
        %1869 = llvm.mlir.addressof @str181 : !llvm.ptr
        %1870 = arith.constant 11 : i64
        %1871 = func.call @cc_make_string(%1869, %1870) : (!llvm.ptr, i64) -> i64
        %1872 = func.call @cc_intern(%1868, %1871) : (i64, i64) -> i64
        %1873 = func.call @cc_nil_value() : () -> i64
        %1874 = func.call @cc_cons(%1872, %1873) : (i64, i64) -> i64
        %1875 = func.call @cc_values_pack(%1874) : (i64) -> i64
        func.call @stack_push_pointer(%1872) : (i64) -> ()
        %1876 = func.call @stack_pop_pointer() : () -> i64
        %1877 = func.call @stack_pop_pointer() : () -> i64
        %1878 = func.call @cc_typep(%1877, %1876) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1878) : (i64) -> ()
        %1879 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1880 = func.call @stack_pop_pointer() : () -> i64
        %1881 = arith.constant 7 : i64
        %1882 = func.call @cc_box_fixnum(%1881) : (i64) -> i64
        %1883 = func.call @cc_nth(%1882, %1880) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1883) : (i64) -> ()
        %1884 = llvm.mlir.addressof @str182 : !llvm.ptr
        %1885 = arith.constant 12 : i64
        %1886 = func.call @cc_make_string(%1884, %1885) : (!llvm.ptr, i64) -> i64
        %1887 = llvm.mlir.addressof @str183 : !llvm.ptr
        %1888 = arith.constant 11 : i64
        %1889 = func.call @cc_make_string(%1887, %1888) : (!llvm.ptr, i64) -> i64
        %1890 = func.call @cc_intern(%1886, %1889) : (i64, i64) -> i64
        %1891 = func.call @cc_nil_value() : () -> i64
        %1892 = func.call @cc_cons(%1890, %1891) : (i64, i64) -> i64
        %1893 = func.call @cc_values_pack(%1892) : (i64) -> i64
        func.call @stack_push_pointer(%1890) : (i64) -> ()
        %1894 = func.call @stack_pop_pointer() : () -> i64
        %1895 = func.call @stack_pop_pointer() : () -> i64
        %1896 = func.call @cc_typep(%1895, %1894) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1896) : (i64) -> ()
        %1897 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1859) : (i64) -> ()
        func.call @stack_push_pointer(%1863) : (i64) -> ()
        func.call @stack_push_pointer(%1879) : (i64) -> ()
        func.call @stack_push_pointer(%1897) : (i64) -> ()
        %1898 = llvm.mlir.addressof @str184 : !llvm.ptr
        %1899 = func.call @cc_make_function_ref_const(%1898) : (!llvm.ptr) -> i64
        %1900 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%1899, %1900) : (i64, i64) -> ()
        %1901 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1901 : i64
      }
      %1902 = func.call @cc_nil_value() : () -> i64
      %1903 = func.call @cc_errorp(%1857) : (i64) -> i64
      %1904 = arith.cmpi ne, %1903, %1902 : i64
      %1905 = scf.if %1904 -> (i64) {
        scf.yield %1857 : i64
      } else {
        %1906 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%1906) : (i64) -> ()
        %1907 = func.call @stack_pop_pointer() : () -> i64
        %1908 = llvm.mlir.addressof @str185 : !llvm.ptr
        %1909 = arith.constant 44 : i64
        %1910 = func.call @cc_make_string(%1908, %1909) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1910) : (i64) -> ()
        %1911 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1912 = func.call @stack_pop_pointer() : () -> i64
        %1913 = func.call @cc_car(%1912) : (i64) -> i64
        func.call @stack_push_pointer(%1913) : (i64) -> ()
        %1914 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1914) : (i64) -> ()
        %1915 = llvm.mlir.addressof @str186 : !llvm.ptr
        %1916 = func.call @cc_make_function_ref_const(%1915) : (!llvm.ptr) -> i64
        %1917 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1916, %1917) : (i64, i64) -> ()
        %1918 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1919 = func.call @stack_pop_pointer() : () -> i64
        %1920 = arith.constant 7 : i64
        %1921 = func.call @cc_box_fixnum(%1920) : (i64) -> i64
        %1922 = func.call @cc_nth(%1921, %1919) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1922) : (i64) -> ()
        %1923 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1923) : (i64) -> ()
        %1924 = llvm.mlir.addressof @str187 : !llvm.ptr
        %1925 = func.call @cc_make_function_ref_const(%1924) : (!llvm.ptr) -> i64
        %1926 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1925, %1926) : (i64, i64) -> ()
        %1927 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1907) : (i64) -> ()
        func.call @stack_push_pointer(%1911) : (i64) -> ()
        func.call @stack_push_pointer(%1918) : (i64) -> ()
        func.call @stack_push_pointer(%1927) : (i64) -> ()
        %1928 = llvm.mlir.addressof @str188 : !llvm.ptr
        %1929 = func.call @cc_make_function_ref_const(%1928) : (!llvm.ptr) -> i64
        %1930 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%1929, %1930) : (i64, i64) -> ()
        %1931 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1931 : i64
      }
      %1932 = func.call @cc_nil_value() : () -> i64
      %1933 = func.call @cc_errorp(%1905) : (i64) -> i64
      %1934 = arith.cmpi ne, %1933, %1932 : i64
      %1935 = scf.if %1934 -> (i64) {
        scf.yield %1905 : i64
      } else {
        %1936 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%1936) : (i64) -> ()
        %1937 = func.call @stack_pop_pointer() : () -> i64
        %1938 = llvm.mlir.addressof @str189 : !llvm.ptr
        %1939 = arith.constant 46 : i64
        %1940 = func.call @cc_make_string(%1938, %1939) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1940) : (i64) -> ()
        %1941 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1942 = func.call @stack_pop_pointer() : () -> i64
        %1943 = func.call @cc_car(%1942) : (i64) -> i64
        func.call @stack_push_pointer(%1943) : (i64) -> ()
        %1944 = llvm.mlir.addressof @str190 : !llvm.ptr
        %1945 = arith.constant 5 : i64
        %1946 = func.call @cc_make_string(%1944, %1945) : (!llvm.ptr, i64) -> i64
        %1947 = llvm.mlir.addressof @str191 : !llvm.ptr
        %1948 = arith.constant 11 : i64
        %1949 = func.call @cc_make_string(%1947, %1948) : (!llvm.ptr, i64) -> i64
        %1950 = func.call @cc_intern(%1946, %1949) : (i64, i64) -> i64
        %1951 = func.call @cc_nil_value() : () -> i64
        %1952 = func.call @cc_cons(%1950, %1951) : (i64, i64) -> i64
        %1953 = func.call @cc_values_pack(%1952) : (i64) -> i64
        func.call @stack_push_pointer(%1950) : (i64) -> ()
        %1954 = func.call @stack_pop_pointer() : () -> i64
        %1955 = func.call @stack_pop_pointer() : () -> i64
        %1956 = func.call @cc_typep(%1955, %1954) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1956) : (i64) -> ()
        %1957 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1958 = func.call @stack_pop_pointer() : () -> i64
        %1959 = arith.constant 7 : i64
        %1960 = func.call @cc_box_fixnum(%1959) : (i64) -> i64
        %1961 = func.call @cc_nth(%1960, %1958) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1961) : (i64) -> ()
        %1962 = llvm.mlir.addressof @str192 : !llvm.ptr
        %1963 = arith.constant 5 : i64
        %1964 = func.call @cc_make_string(%1962, %1963) : (!llvm.ptr, i64) -> i64
        %1965 = llvm.mlir.addressof @str193 : !llvm.ptr
        %1966 = arith.constant 11 : i64
        %1967 = func.call @cc_make_string(%1965, %1966) : (!llvm.ptr, i64) -> i64
        %1968 = func.call @cc_intern(%1964, %1967) : (i64, i64) -> i64
        %1969 = func.call @cc_nil_value() : () -> i64
        %1970 = func.call @cc_cons(%1968, %1969) : (i64, i64) -> i64
        %1971 = func.call @cc_values_pack(%1970) : (i64) -> i64
        func.call @stack_push_pointer(%1968) : (i64) -> ()
        %1972 = func.call @stack_pop_pointer() : () -> i64
        %1973 = func.call @stack_pop_pointer() : () -> i64
        %1974 = func.call @cc_typep(%1973, %1972) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1974) : (i64) -> ()
        %1975 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1937) : (i64) -> ()
        func.call @stack_push_pointer(%1941) : (i64) -> ()
        func.call @stack_push_pointer(%1957) : (i64) -> ()
        func.call @stack_push_pointer(%1975) : (i64) -> ()
        %1976 = llvm.mlir.addressof @str194 : !llvm.ptr
        %1977 = func.call @cc_make_function_ref_const(%1976) : (!llvm.ptr) -> i64
        %1978 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%1977, %1978) : (i64, i64) -> ()
        %1979 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1979 : i64
      }
      %1980 = func.call @cc_nil_value() : () -> i64
      %1981 = func.call @cc_errorp(%1935) : (i64) -> i64
      %1982 = arith.cmpi ne, %1981, %1980 : i64
      %1983 = scf.if %1982 -> (i64) {
        scf.yield %1935 : i64
      } else {
        %1984 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%1984) : (i64) -> ()
        %1985 = func.call @stack_pop_pointer() : () -> i64
        %1986 = llvm.mlir.addressof @str195 : !llvm.ptr
        %1987 = arith.constant 58 : i64
        %1988 = func.call @cc_make_string(%1986, %1987) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1988) : (i64) -> ()
        %1989 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1990 = func.call @stack_pop_pointer() : () -> i64
        %1991 = func.call @cc_length(%1990) : (i64) -> i64
        func.call @stack_push_pointer(%1991) : (i64) -> ()
        %1992 = func.call @stack_pop_pointer() : () -> i64
        %1993 = arith.constant 7 : i64
        func.call @stack_push_fixnum(%1993) : (i64) -> ()
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1994 = func.call @stack_pop_pointer() : () -> i64
        %1995 = func.call @stack_pop_pointer() : () -> i64
        %1996 = func.call @cc_nth(%1995, %1994) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1996) : (i64) -> ()
        %1997 = func.call @stack_pop_pointer() : () -> i64
        %1998 = arith.constant 7 : i64
        func.call @stack_push_fixnum(%1998) : (i64) -> ()
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %1999 = func.call @stack_pop_pointer() : () -> i64
        %2000 = func.call @stack_pop_pointer() : () -> i64
        %2001 = func.call @cc_nth(%2000, %1999) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2001) : (i64) -> ()
        %2002 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2002) : (i64) -> ()
        %2003 = llvm.mlir.addressof @str196 : !llvm.ptr
        %2004 = func.call @cc_make_function_ref_const(%2003) : (!llvm.ptr) -> i64
        %2005 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2004, %2005) : (i64, i64) -> ()
        %2006 = func.call @stack_pop_pointer() : () -> i64
        %2007 = arith.constant 7 : i64
        func.call @stack_push_fixnum(%2007) : (i64) -> ()
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %2008 = func.call @stack_pop_pointer() : () -> i64
        %2009 = func.call @stack_pop_pointer() : () -> i64
        %2010 = func.call @cc_nth(%2009, %2008) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2010) : (i64) -> ()
        %2011 = llvm.mlir.addressof @str197 : !llvm.ptr
        %2012 = arith.constant 12 : i64
        %2013 = func.call @cc_make_string(%2011, %2012) : (!llvm.ptr, i64) -> i64
        %2014 = llvm.mlir.addressof @str198 : !llvm.ptr
        %2015 = arith.constant 11 : i64
        %2016 = func.call @cc_make_string(%2014, %2015) : (!llvm.ptr, i64) -> i64
        %2017 = func.call @cc_intern(%2013, %2016) : (i64, i64) -> i64
        %2018 = func.call @cc_nil_value() : () -> i64
        %2019 = func.call @cc_cons(%2017, %2018) : (i64, i64) -> i64
        %2020 = func.call @cc_values_pack(%2019) : (i64) -> i64
        func.call @stack_push_pointer(%2017) : (i64) -> ()
        %2021 = func.call @stack_pop_pointer() : () -> i64
        %2022 = func.call @stack_pop_pointer() : () -> i64
        %2023 = func.call @cc_typep(%2022, %2021) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2023) : (i64) -> ()
        %2024 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1985) : (i64) -> ()
        func.call @stack_push_pointer(%1989) : (i64) -> ()
        func.call @stack_push_pointer(%1992) : (i64) -> ()
        func.call @stack_push_pointer(%1997) : (i64) -> ()
        func.call @stack_push_pointer(%2006) : (i64) -> ()
        func.call @stack_push_pointer(%2024) : (i64) -> ()
        %2025 = llvm.mlir.addressof @str199 : !llvm.ptr
        %2026 = func.call @cc_make_function_ref_const(%2025) : (!llvm.ptr) -> i64
        %2027 = arith.constant 6 : i64
        func.call @cc_funcall_stack(%2026, %2027) : (i64, i64) -> ()
        %2028 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2028 : i64
      }
      %2029 = func.call @cc_nil_value() : () -> i64
      %2030 = func.call @cc_errorp(%1983) : (i64) -> i64
      %2031 = arith.cmpi ne, %2030, %2029 : i64
      %2032 = scf.if %2031 -> (i64) {
        scf.yield %1983 : i64
      } else {
        %2033 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %2034 = func.call @stack_pop_pointer() : () -> i64
        %2035 = func.call @cc_car(%2034) : (i64) -> i64
        func.call @stack_push_pointer(%2035) : (i64) -> ()
        %2036 = llvm.mlir.addressof @str200 : !llvm.ptr
        %2037 = arith.constant 12 : i64
        %2038 = func.call @cc_make_string(%2036, %2037) : (!llvm.ptr, i64) -> i64
        %2039 = llvm.mlir.addressof @str201 : !llvm.ptr
        %2040 = arith.constant 11 : i64
        %2041 = func.call @cc_make_string(%2039, %2040) : (!llvm.ptr, i64) -> i64
        %2042 = func.call @cc_intern(%2038, %2041) : (i64, i64) -> i64
        %2043 = func.call @cc_nil_value() : () -> i64
        %2044 = func.call @cc_cons(%2042, %2043) : (i64, i64) -> i64
        %2045 = func.call @cc_values_pack(%2044) : (i64) -> i64
        func.call @stack_push_pointer(%2042) : (i64) -> ()
        %2046 = func.call @stack_pop_pointer() : () -> i64
        %2047 = func.call @stack_pop_pointer() : () -> i64
        %2048 = func.call @cc_typep(%2047, %2046) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2048) : (i64) -> ()
        %2049 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
        %2050 = func.call @stack_pop_pointer() : () -> i64
        %2051 = arith.constant 7 : i64
        %2052 = func.call @cc_box_fixnum(%2051) : (i64) -> i64
        %2053 = func.call @cc_nth(%2052, %2050) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2053) : (i64) -> ()
        %2054 = llvm.mlir.addressof @str202 : !llvm.ptr
        %2055 = arith.constant 12 : i64
        %2056 = func.call @cc_make_string(%2054, %2055) : (!llvm.ptr, i64) -> i64
        %2057 = llvm.mlir.addressof @str203 : !llvm.ptr
        %2058 = arith.constant 11 : i64
        %2059 = func.call @cc_make_string(%2057, %2058) : (!llvm.ptr, i64) -> i64
        %2060 = func.call @cc_intern(%2056, %2059) : (i64, i64) -> i64
        %2061 = func.call @cc_nil_value() : () -> i64
        %2062 = func.call @cc_cons(%2060, %2061) : (i64, i64) -> i64
        %2063 = func.call @cc_values_pack(%2062) : (i64) -> i64
        func.call @stack_push_pointer(%2060) : (i64) -> ()
        %2064 = func.call @stack_pop_pointer() : () -> i64
        %2065 = func.call @stack_pop_pointer() : () -> i64
        %2066 = func.call @cc_typep(%2065, %2064) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2066) : (i64) -> ()
        %2067 = func.call @stack_pop_pointer() : () -> i64
        %2068 = func.call @cc_cons(%2067, %2033) : (i64, i64) -> i64
        %2069 = func.call @cc_cons(%2049, %2068) : (i64, i64) -> i64
        %2070 = func.call @cc_and(%2069) : (i64) -> i64
        func.call @stack_push_pointer(%2070) : (i64) -> ()
        %2071 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2071 : i64
      }
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      %2072 = func.call @stack_pop_pointer() : () -> i64
      %2073 = func.call @cc_nil_value() : () -> i64
      %2074 = func.call @cc_cons(%2072, %2073) : (i64, i64) -> i64
      %2075 = func.call @cc_not(%2074) : (i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2076 = func.call @stack_pop_pointer() : () -> i64
      %2077 = func.call @cc_nil_value() : () -> i64
      %2078 = func.call @cc_cons(%2076, %2077) : (i64, i64) -> i64
      %2079 = func.call @cc_not(%2078) : (i64) -> i64
      func.call @stack_push_pointer(%2079) : (i64) -> ()
      %2080 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2080 : i64
    }
    func.call @stack_push_pointer(%1337) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_241389006749696*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_241389006749696*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_241389006749696*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("SET-SYNTAX-FROM-CHAR-TRAIT-X-1A\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str9("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str11("CHARS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str12("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("MAPCAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str20("WITH-STANDARD-IO-SYNTAX\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str23("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("COPY-READTABLE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("HANDLER-CASE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("READ-FROM-STRING\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str34("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str36("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str37("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str38("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str39("Z\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str40("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str43("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str44("CHARS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str45("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("compiled-test-result=~s~%\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str48("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str49("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("compiled-test-first=~s eighth=~s~%\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str52("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str57("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str60("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str61("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("compiled-test-first-type=~s eighth-type=~s~%\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str71("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str76("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str82("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("compiled-test-first-error=~s eighth-error=~s~%\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str84("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str90("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str92("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str97("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str100("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("compiled-test-len=~s nth7=~s nth7-type=~s nth7-reader=~s~%\00") : !llvm.array<59 x i8>
  llvm.mlir.global private constant @str103("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str104("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str105("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str106("NTH\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str109("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("NTH\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str112("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str114("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("NTH\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str117("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str119("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str120("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str121("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str122("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str125("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str126("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str129("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str132("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str137("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str138("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str140("*PACKAGE*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str141("*PRINT-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str142("*PRINT-BASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str143("*PRINT-CASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str144("*PRINT-CIRCLE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str145("*PRINT-ESCAPE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str146("*PRINT-GENSYM*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str147("*PRINT-LENGTH*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str148("*PRINT-LEVEL*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str149("*PRINT-LINES*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str150("*PRINT-MISER-WIDTH*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str151("*PRINT-PPRINT-DISPATCH*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str152("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str153("*PRINT-RADIX*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str154("*PRINT-READABLY*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str155("*PRINT-RIGHT-MARGIN*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str156("*READ-BASE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("*READ-DEFAULT-FLOAT-FORMAT*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str158("*READ-EVAL*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("*READ-SUPPRESS*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str160("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("COMMON-LISP-USER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str162("UPCASE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str165("__RLASP_READTABLE__0\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP-USER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str167("%%PROGV-PUSH\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str168("COPY-READTABLE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP:*READTABLE*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str170("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("Z\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str173("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("%%PROGV-POP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str176("MAPCAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str177("compiled-test-result=~s~%\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str178("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str179("compiled-test-first=~s eighth=~s~%\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str180("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str182("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str183("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str184("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str185("compiled-test-first-type=~s eighth-type=~s~%\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str186("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str188("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str189("compiled-test-first-error=~s eighth-error=~s~%\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str190("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str192("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str193("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str195("compiled-test-len=~s nth7=~s nth7-type=~s nth7-reader=~s~%\00") : !llvm.array<59 x i8>
  llvm.mlir.global private constant @str196("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str200("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str201("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str202("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str203("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str204("#:%%DYN-CELL-241389006749699-E\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str205("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str208("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str209("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str210("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str211("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str212("show-test-summary\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str213("*__MLIR_BLOCK_RETFLAG_241389006749696*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str214("*__MLIR_BLOCK_RETMVLIST_241389006749696*\00") : !llvm.array<41 x i8>
}
