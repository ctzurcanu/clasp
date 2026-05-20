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
      %69 = llvm.mlir.addressof @str6 : !llvm.ptr
      %70 = arith.constant 31 : i64
      %71 = func.call @cc_make_string(%69, %70) : (!llvm.ptr, i64) -> i64
      %72 = func.call @cc_nil_value() : () -> i64
      %73 = func.call @cc_intern(%71, %72) : (i64, i64) -> i64
      %74 = func.call @cc_nil_value() : () -> i64
      %75 = func.call @cc_cons(%73, %74) : (i64, i64) -> i64
      %76 = func.call @cc_values_pack(%75) : (i64) -> i64
      %77 = func.call @cc_symbol_value(%73) : (i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %78 = func.call @stack_pop_pointer() : () -> i64
      %79 = arith.constant 8 : i64
      %80 = func.call @cc_box_character(%79) : (i64) -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = arith.constant 9 : i64
      %83 = func.call @cc_box_character(%82) : (i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      %85 = arith.constant 10 : i64
      %86 = func.call @cc_box_character(%85) : (i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %87 = func.call @stack_pop_pointer() : () -> i64
      %88 = arith.constant 10 : i64
      %89 = func.call @cc_box_character(%88) : (i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = arith.constant 12 : i64
      %92 = func.call @cc_box_character(%91) : (i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %93 = func.call @stack_pop_pointer() : () -> i64
      %94 = arith.constant 13 : i64
      %95 = func.call @cc_box_character(%94) : (i64) -> i64
      func.call @stack_push_pointer(%95) : (i64) -> ()
      %96 = func.call @stack_pop_pointer() : () -> i64
      %97 = arith.constant 32 : i64
      %98 = func.call @cc_box_character(%97) : (i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %99 = func.call @stack_pop_pointer() : () -> i64
      %100 = arith.constant 127 : i64
      %101 = func.call @cc_box_character(%100) : (i64) -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      %102 = func.call @stack_pop_pointer() : () -> i64
      %103 = func.call @cc_nil_value() : () -> i64
      %104 = func.call @cc_errorp(%81) : (i64) -> i64
      %105 = arith.cmpi ne, %104, %103 : i64
      %106 = arith.cmpi eq, %103, %103 : i64
      %107 = arith.andi %105, %106 : i1
      %108 = scf.if %107 -> (i64) {
        scf.yield %81 : i64
      } else {
        scf.yield %103 : i64
      }
      %109 = func.call @cc_errorp(%84) : (i64) -> i64
      %110 = arith.cmpi ne, %109, %103 : i64
      %111 = arith.cmpi eq, %108, %103 : i64
      %112 = arith.andi %110, %111 : i1
      %113 = scf.if %112 -> (i64) {
        scf.yield %84 : i64
      } else {
        scf.yield %108 : i64
      }
      %114 = func.call @cc_errorp(%87) : (i64) -> i64
      %115 = arith.cmpi ne, %114, %103 : i64
      %116 = arith.cmpi eq, %113, %103 : i64
      %117 = arith.andi %115, %116 : i1
      %118 = scf.if %117 -> (i64) {
        scf.yield %87 : i64
      } else {
        scf.yield %113 : i64
      }
      %119 = func.call @cc_errorp(%90) : (i64) -> i64
      %120 = arith.cmpi ne, %119, %103 : i64
      %121 = arith.cmpi eq, %118, %103 : i64
      %122 = arith.andi %120, %121 : i1
      %123 = scf.if %122 -> (i64) {
        scf.yield %90 : i64
      } else {
        scf.yield %118 : i64
      }
      %124 = func.call @cc_errorp(%93) : (i64) -> i64
      %125 = arith.cmpi ne, %124, %103 : i64
      %126 = arith.cmpi eq, %123, %103 : i64
      %127 = arith.andi %125, %126 : i1
      %128 = scf.if %127 -> (i64) {
        scf.yield %93 : i64
      } else {
        scf.yield %123 : i64
      }
      %129 = func.call @cc_errorp(%96) : (i64) -> i64
      %130 = arith.cmpi ne, %129, %103 : i64
      %131 = arith.cmpi eq, %128, %103 : i64
      %132 = arith.andi %130, %131 : i1
      %133 = scf.if %132 -> (i64) {
        scf.yield %96 : i64
      } else {
        scf.yield %128 : i64
      }
      %134 = func.call @cc_errorp(%99) : (i64) -> i64
      %135 = arith.cmpi ne, %134, %103 : i64
      %136 = arith.cmpi eq, %133, %103 : i64
      %137 = arith.andi %135, %136 : i1
      %138 = scf.if %137 -> (i64) {
        scf.yield %99 : i64
      } else {
        scf.yield %133 : i64
      }
      %139 = func.call @cc_errorp(%102) : (i64) -> i64
      %140 = arith.cmpi ne, %139, %103 : i64
      %141 = arith.cmpi eq, %138, %103 : i64
      %142 = arith.andi %140, %141 : i1
      %143 = scf.if %142 -> (i64) {
        scf.yield %102 : i64
      } else {
        scf.yield %138 : i64
      }
      %144 = arith.cmpi ne, %143, %103 : i64
      scf.if %144 {
        func.call @stack_push_pointer(%143) : (i64) -> ()
      } else {
        %145 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%145) : (i64) -> ()
        func.call @stack_push_pointer(%102) : (i64) -> ()
        %146 = func.call @stack_pop_pointer() : () -> i64
        %147 = func.call @stack_pop_pointer() : () -> i64
        %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
        func.call @stack_push_pointer(%148) : (i64) -> ()
        func.call @stack_push_pointer(%99) : (i64) -> ()
        %149 = func.call @stack_pop_pointer() : () -> i64
        %150 = func.call @stack_pop_pointer() : () -> i64
        %151 = func.call @cc_cons(%149, %150) : (i64, i64) -> i64
        func.call @stack_push_pointer(%151) : (i64) -> ()
        func.call @stack_push_pointer(%96) : (i64) -> ()
        %152 = func.call @stack_pop_pointer() : () -> i64
        %153 = func.call @stack_pop_pointer() : () -> i64
        %154 = func.call @cc_cons(%152, %153) : (i64, i64) -> i64
        func.call @stack_push_pointer(%154) : (i64) -> ()
        func.call @stack_push_pointer(%93) : (i64) -> ()
        %155 = func.call @stack_pop_pointer() : () -> i64
        %156 = func.call @stack_pop_pointer() : () -> i64
        %157 = func.call @cc_cons(%155, %156) : (i64, i64) -> i64
        func.call @stack_push_pointer(%157) : (i64) -> ()
        func.call @stack_push_pointer(%90) : (i64) -> ()
        %158 = func.call @stack_pop_pointer() : () -> i64
        %159 = func.call @stack_pop_pointer() : () -> i64
        %160 = func.call @cc_cons(%158, %159) : (i64, i64) -> i64
        func.call @stack_push_pointer(%160) : (i64) -> ()
        func.call @stack_push_pointer(%87) : (i64) -> ()
        %161 = func.call @stack_pop_pointer() : () -> i64
        %162 = func.call @stack_pop_pointer() : () -> i64
        %163 = func.call @cc_cons(%161, %162) : (i64, i64) -> i64
        func.call @stack_push_pointer(%163) : (i64) -> ()
        func.call @stack_push_pointer(%84) : (i64) -> ()
        %164 = func.call @stack_pop_pointer() : () -> i64
        %165 = func.call @stack_pop_pointer() : () -> i64
        %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
        func.call @stack_push_pointer(%166) : (i64) -> ()
        func.call @stack_push_pointer(%81) : (i64) -> ()
        %167 = func.call @stack_pop_pointer() : () -> i64
        %168 = func.call @stack_pop_pointer() : () -> i64
        %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
        func.call @stack_push_pointer(%169) : (i64) -> ()
      }
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @cc_nil_value() : () -> i64
      %172 = func.call @cc_nil_value() : () -> i64
      %173 = func.call @cc_errorp(%171) : (i64) -> i64
      %174 = arith.cmpi ne, %173, %172 : i64
      %175 = scf.if %174 -> (i64) {
        scf.yield %171 : i64
      } else {
        %557 = llvm.mlir.addressof @str43 : !llvm.ptr
        %558 = arith.constant 30 : i64
        %559 = func.call @cc_make_symbol(%557, %558) : (!llvm.ptr, i64) -> i64
        %560 = func.call @cc_persistent_root_value(%559) : (i64) -> i64
        func.call @stack_push_pointer(%560) : (i64) -> ()
        %561 = arith.constant 192447015550977 : i64
        %562 = arith.constant 1 : i64
        %563 = func.call @cc_make_closure(%561, %562) : (i64, i64) -> i64
        func.call @stack_push_pointer(%563) : (i64) -> ()
        %564 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%170) : (i64) -> ()
        %565 = func.call @stack_pop_pointer() : () -> i64
        %566 = func.call @cc_nil_value() : () -> i64
        %567 = func.call @cc_errorp(%564) : (i64) -> i64
        %568 = arith.cmpi ne, %567, %566 : i64
        %569 = arith.cmpi eq, %566, %566 : i64
        %570 = arith.andi %568, %569 : i1
        %571 = scf.if %570 -> (i64) {
          scf.yield %564 : i64
        } else {
          scf.yield %566 : i64
        }
        %572 = func.call @cc_errorp(%565) : (i64) -> i64
        %573 = arith.cmpi ne, %572, %566 : i64
        %574 = arith.cmpi eq, %571, %566 : i64
        %575 = arith.andi %573, %574 : i1
        %576 = scf.if %575 -> (i64) {
          scf.yield %565 : i64
        } else {
          scf.yield %571 : i64
        }
        %577 = arith.cmpi ne, %576, %566 : i64
        scf.if %577 {
          func.call @stack_push_pointer(%576) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%564) : (i64) -> ()
          func.call @stack_push_pointer(%565) : (i64) -> ()
          %578 = llvm.mlir.addressof @str44 : !llvm.ptr
          %579 = func.call @cc_make_function_ref_const(%578) : (!llvm.ptr) -> i64
          %580 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%579, %580) : (i64, i64) -> ()
        }
        %581 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %581 : i64
      }
      func.call @stack_push_pointer(%175) : (i64) -> ()
      %582 = func.call @stack_pop_pointer() : () -> i64
      %583 = func.call @cc_nil_value() : () -> i64
      %584 = func.call @cc_nil_value() : () -> i64
      %585 = func.call @cc_errorp(%583) : (i64) -> i64
      %586 = arith.cmpi ne, %585, %584 : i64
      %587 = scf.if %586 -> (i64) {
        scf.yield %583 : i64
      } else {
        %588 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%582) : (i64) -> ()
        %589 = func.call @stack_pop_pointer() : () -> i64
        %590 = func.call @cc_car(%589) : (i64) -> i64
        func.call @stack_push_pointer(%590) : (i64) -> ()
        %591 = llvm.mlir.addressof @str45 : !llvm.ptr
        %592 = arith.constant 12 : i64
        %593 = func.call @cc_make_string(%591, %592) : (!llvm.ptr, i64) -> i64
        %594 = llvm.mlir.addressof @str46 : !llvm.ptr
        %595 = arith.constant 11 : i64
        %596 = func.call @cc_make_string(%594, %595) : (!llvm.ptr, i64) -> i64
        %597 = func.call @cc_intern(%593, %596) : (i64, i64) -> i64
        %598 = func.call @cc_nil_value() : () -> i64
        %599 = func.call @cc_cons(%597, %598) : (i64, i64) -> i64
        %600 = func.call @cc_values_pack(%599) : (i64) -> i64
        func.call @stack_push_pointer(%597) : (i64) -> ()
        %601 = func.call @stack_pop_pointer() : () -> i64
        %602 = func.call @stack_pop_pointer() : () -> i64
        %603 = func.call @cc_typep(%602, %601) : (i64, i64) -> i64
        func.call @stack_push_pointer(%603) : (i64) -> ()
        %604 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%582) : (i64) -> ()
        %605 = func.call @stack_pop_pointer() : () -> i64
        %606 = func.call @cc_nil_value() : () -> i64
        %607 = func.call @cc_errorp(%605) : (i64) -> i64
        %608 = arith.cmpi ne, %607, %606 : i64
        %609 = arith.cmpi eq, %606, %606 : i64
        %610 = arith.andi %608, %609 : i1
        %611 = scf.if %610 -> (i64) {
          scf.yield %605 : i64
        } else {
          scf.yield %606 : i64
        }
        %612 = arith.cmpi ne, %611, %606 : i64
        scf.if %612 {
          func.call @stack_push_pointer(%611) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%605) : (i64) -> ()
          %613 = llvm.mlir.addressof @str47 : !llvm.ptr
          %614 = func.call @cc_make_function_ref_const(%613) : (!llvm.ptr) -> i64
          %615 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%614, %615) : (i64, i64) -> ()
        }
        %616 = llvm.mlir.addressof @str48 : !llvm.ptr
        %617 = arith.constant 12 : i64
        %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
        %619 = llvm.mlir.addressof @str49 : !llvm.ptr
        %620 = arith.constant 11 : i64
        %621 = func.call @cc_make_string(%619, %620) : (!llvm.ptr, i64) -> i64
        %622 = func.call @cc_intern(%618, %621) : (i64, i64) -> i64
        %623 = func.call @cc_nil_value() : () -> i64
        %624 = func.call @cc_cons(%622, %623) : (i64, i64) -> i64
        %625 = func.call @cc_values_pack(%624) : (i64) -> i64
        func.call @stack_push_pointer(%622) : (i64) -> ()
        %626 = func.call @stack_pop_pointer() : () -> i64
        %627 = func.call @stack_pop_pointer() : () -> i64
        %628 = func.call @cc_typep(%627, %626) : (i64, i64) -> i64
        func.call @stack_push_pointer(%628) : (i64) -> ()
        %629 = func.call @stack_pop_pointer() : () -> i64
        %630 = func.call @cc_cons(%629, %588) : (i64, i64) -> i64
        %631 = func.call @cc_cons(%604, %630) : (i64, i64) -> i64
        %632 = func.call @cc_and(%631) : (i64) -> i64
        func.call @stack_push_pointer(%632) : (i64) -> ()
        %633 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %633 : i64
      }
      func.call @stack_push_pointer(%587) : (i64) -> ()
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @cc_nil_value() : () -> i64
      %636 = func.call @cc_errorp(%78) : (i64) -> i64
      %637 = arith.cmpi ne, %636, %635 : i64
      %638 = arith.cmpi eq, %635, %635 : i64
      %639 = arith.andi %637, %638 : i1
      %640 = scf.if %639 -> (i64) {
        scf.yield %78 : i64
      } else {
        scf.yield %635 : i64
      }
      %641 = func.call @cc_errorp(%634) : (i64) -> i64
      %642 = arith.cmpi ne, %641, %635 : i64
      %643 = arith.cmpi eq, %640, %635 : i64
      %644 = arith.andi %642, %643 : i1
      %645 = scf.if %644 -> (i64) {
        scf.yield %634 : i64
      } else {
        scf.yield %640 : i64
      }
      %646 = arith.cmpi ne, %645, %635 : i64
      scf.if %646 {
        func.call @stack_push_pointer(%645) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%78) : (i64) -> ()
        func.call @stack_push_pointer(%634) : (i64) -> ()
        %647 = llvm.mlir.addressof @str50 : !llvm.ptr
        %648 = func.call @cc_make_function_ref_const(%647) : (!llvm.ptr) -> i64
        %649 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%648, %649) : (i64, i64) -> ()
      }
      %650 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %650 : i64
    }
    %651 = func.call @cc_nil_value() : () -> i64
    %652 = func.call @cc_errorp(%68) : (i64) -> i64
    %653 = arith.cmpi ne, %652, %651 : i64
    %654 = scf.if %653 -> (i64) {
      scf.yield %68 : i64
    } else {
      %655 = func.call @cc_nil_value() : () -> i64
      %656 = arith.cmpi ne, %655, %655 : i64
      scf.if %656 {
        func.call @stack_push_pointer(%655) : (i64) -> ()
      } else {
        %657 = llvm.mlir.addressof @str51 : !llvm.ptr
        %658 = func.call @cc_make_function_ref_const(%657) : (!llvm.ptr) -> i64
        %659 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%658, %659) : (i64, i64) -> ()
      }
      %660 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %660 : i64
    }
    func.call @stack_push_pointer(%654) : (i64) -> ()
    %661 = func.call @stack_pop_pointer() : () -> i64
    %662 = func.call @cc_multiple_value_list(%661) : (i64) -> i64
    %663 = llvm.mlir.addressof @str52 : !llvm.ptr
    %664 = arith.constant 38 : i64
    %665 = func.call @cc_make_string(%663, %664) : (!llvm.ptr, i64) -> i64
    %666 = func.call @cc_nil_value() : () -> i64
    %667 = func.call @cc_intern(%665, %666) : (i64, i64) -> i64
    %668 = func.call @cc_nil_value() : () -> i64
    %669 = func.call @cc_cons(%667, %668) : (i64, i64) -> i64
    %670 = func.call @cc_values_pack(%669) : (i64) -> i64
    %671 = func.call @cc_symbol_value(%667) : (i64) -> i64
    %672 = llvm.mlir.addressof @str53 : !llvm.ptr
    %673 = arith.constant 40 : i64
    %674 = func.call @cc_make_string(%672, %673) : (!llvm.ptr, i64) -> i64
    %675 = func.call @cc_nil_value() : () -> i64
    %676 = func.call @cc_intern(%674, %675) : (i64, i64) -> i64
    %677 = func.call @cc_nil_value() : () -> i64
    %678 = func.call @cc_cons(%676, %677) : (i64, i64) -> i64
    %679 = func.call @cc_values_pack(%678) : (i64) -> i64
    %680 = func.call @cc_symbol_value(%676) : (i64) -> i64
    %681 = func.call @cc_nil_value() : () -> i64
    %682 = arith.cmpi ne, %671, %681 : i64
    %683 = scf.if %682 -> (i64) {
      scf.yield %680 : i64
    } else {
      scf.yield %662 : i64
    }
    %684 = func.call @cc_values_pack(%683) : (i64) -> i64
    func.call @stack_push_pointer(%684) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_192447015550977"() {
    %176 = func.call @stack_pop_pointer() : () -> i64
    %177 = func.call @stack_pop_pointer() : () -> i64
    %178 = func.call @cc_nil_value() : () -> i64
    %179 = func.call @cc_nil_value() : () -> i64
    %180 = func.call @cc_errorp(%178) : (i64) -> i64
    %181 = arith.cmpi ne, %180, %179 : i64
    %182 = scf.if %181 -> (i64) {
      scf.yield %178 : i64
    } else {
      %183 = llvm.mlir.addressof @str7 : !llvm.ptr
      %184 = arith.constant 9 : i64
      %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_intern(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_nil_value() : () -> i64
      %189 = func.call @cc_cons(%187, %188) : (i64, i64) -> i64
      %190 = func.call @cc_values_pack(%189) : (i64) -> i64
      %191 = llvm.mlir.addressof @str8 : !llvm.ptr
      %192 = arith.constant 13 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = func.call @cc_nil_value() : () -> i64
      %195 = func.call @cc_intern(%193, %194) : (i64, i64) -> i64
      %196 = func.call @cc_nil_value() : () -> i64
      %197 = func.call @cc_cons(%195, %196) : (i64, i64) -> i64
      %198 = func.call @cc_values_pack(%197) : (i64) -> i64
      %199 = llvm.mlir.addressof @str9 : !llvm.ptr
      %200 = arith.constant 12 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_intern(%201, %202) : (i64, i64) -> i64
      %204 = func.call @cc_nil_value() : () -> i64
      %205 = func.call @cc_cons(%203, %204) : (i64, i64) -> i64
      %206 = func.call @cc_values_pack(%205) : (i64) -> i64
      %207 = llvm.mlir.addressof @str10 : !llvm.ptr
      %208 = arith.constant 12 : i64
      %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_intern(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_nil_value() : () -> i64
      %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
      %214 = func.call @cc_values_pack(%213) : (i64) -> i64
      %215 = llvm.mlir.addressof @str11 : !llvm.ptr
      %216 = arith.constant 14 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_intern(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      %223 = llvm.mlir.addressof @str12 : !llvm.ptr
      %224 = arith.constant 14 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      %231 = llvm.mlir.addressof @str13 : !llvm.ptr
      %232 = arith.constant 14 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_intern(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_nil_value() : () -> i64
      %237 = func.call @cc_cons(%235, %236) : (i64, i64) -> i64
      %238 = func.call @cc_values_pack(%237) : (i64) -> i64
      %239 = llvm.mlir.addressof @str14 : !llvm.ptr
      %240 = arith.constant 14 : i64
      %241 = func.call @cc_make_string(%239, %240) : (!llvm.ptr, i64) -> i64
      %242 = func.call @cc_nil_value() : () -> i64
      %243 = func.call @cc_intern(%241, %242) : (i64, i64) -> i64
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_cons(%243, %244) : (i64, i64) -> i64
      %246 = func.call @cc_values_pack(%245) : (i64) -> i64
      %247 = llvm.mlir.addressof @str15 : !llvm.ptr
      %248 = arith.constant 13 : i64
      %249 = func.call @cc_make_string(%247, %248) : (!llvm.ptr, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_intern(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_nil_value() : () -> i64
      %253 = func.call @cc_cons(%251, %252) : (i64, i64) -> i64
      %254 = func.call @cc_values_pack(%253) : (i64) -> i64
      %255 = llvm.mlir.addressof @str16 : !llvm.ptr
      %256 = arith.constant 13 : i64
      %257 = func.call @cc_make_string(%255, %256) : (!llvm.ptr, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_intern(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_cons(%259, %260) : (i64, i64) -> i64
      %262 = func.call @cc_values_pack(%261) : (i64) -> i64
      %263 = llvm.mlir.addressof @str17 : !llvm.ptr
      %264 = arith.constant 19 : i64
      %265 = func.call @cc_make_string(%263, %264) : (!llvm.ptr, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_intern(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_nil_value() : () -> i64
      %269 = func.call @cc_cons(%267, %268) : (i64, i64) -> i64
      %270 = func.call @cc_values_pack(%269) : (i64) -> i64
      %271 = llvm.mlir.addressof @str18 : !llvm.ptr
      %272 = arith.constant 23 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_intern(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
      %278 = func.call @cc_values_pack(%277) : (i64) -> i64
      %279 = llvm.mlir.addressof @str19 : !llvm.ptr
      %280 = arith.constant 14 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = func.call @cc_intern(%281, %282) : (i64, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_cons(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_values_pack(%285) : (i64) -> i64
      %287 = llvm.mlir.addressof @str20 : !llvm.ptr
      %288 = arith.constant 13 : i64
      %289 = func.call @cc_make_string(%287, %288) : (!llvm.ptr, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_intern(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_cons(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_values_pack(%293) : (i64) -> i64
      %295 = llvm.mlir.addressof @str21 : !llvm.ptr
      %296 = arith.constant 16 : i64
      %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_intern(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_values_pack(%301) : (i64) -> i64
      %303 = llvm.mlir.addressof @str22 : !llvm.ptr
      %304 = arith.constant 20 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = func.call @cc_nil_value() : () -> i64
      %307 = func.call @cc_intern(%305, %306) : (i64, i64) -> i64
      %308 = func.call @cc_nil_value() : () -> i64
      %309 = func.call @cc_cons(%307, %308) : (i64, i64) -> i64
      %310 = func.call @cc_values_pack(%309) : (i64) -> i64
      %311 = llvm.mlir.addressof @str23 : !llvm.ptr
      %312 = arith.constant 11 : i64
      %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
      %314 = func.call @cc_nil_value() : () -> i64
      %315 = func.call @cc_intern(%313, %314) : (i64, i64) -> i64
      %316 = func.call @cc_nil_value() : () -> i64
      %317 = func.call @cc_cons(%315, %316) : (i64, i64) -> i64
      %318 = func.call @cc_values_pack(%317) : (i64) -> i64
      %319 = llvm.mlir.addressof @str24 : !llvm.ptr
      %320 = arith.constant 27 : i64
      %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
      %322 = func.call @cc_nil_value() : () -> i64
      %323 = func.call @cc_intern(%321, %322) : (i64, i64) -> i64
      %324 = func.call @cc_nil_value() : () -> i64
      %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
      %326 = func.call @cc_values_pack(%325) : (i64) -> i64
      %327 = llvm.mlir.addressof @str25 : !llvm.ptr
      %328 = arith.constant 11 : i64
      %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_intern(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_nil_value() : () -> i64
      %333 = func.call @cc_cons(%331, %332) : (i64, i64) -> i64
      %334 = func.call @cc_values_pack(%333) : (i64) -> i64
      %335 = llvm.mlir.addressof @str26 : !llvm.ptr
      %336 = arith.constant 15 : i64
      %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
      %338 = func.call @cc_nil_value() : () -> i64
      %339 = func.call @cc_intern(%337, %338) : (i64, i64) -> i64
      %340 = func.call @cc_nil_value() : () -> i64
      %341 = func.call @cc_cons(%339, %340) : (i64, i64) -> i64
      %342 = func.call @cc_values_pack(%341) : (i64) -> i64
      %343 = llvm.mlir.addressof @str27 : !llvm.ptr
      %344 = arith.constant 11 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = func.call @cc_nil_value() : () -> i64
      %347 = func.call @cc_intern(%345, %346) : (i64, i64) -> i64
      %348 = func.call @cc_nil_value() : () -> i64
      %349 = func.call @cc_cons(%347, %348) : (i64, i64) -> i64
      %350 = func.call @cc_values_pack(%349) : (i64) -> i64
      %351 = llvm.mlir.addressof @str28 : !llvm.ptr
      %352 = arith.constant 16 : i64
      %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
      %354 = func.call @cc_nil_value() : () -> i64
      %355 = func.call @cc_intern(%353, %354) : (i64, i64) -> i64
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
      %358 = func.call @cc_values_pack(%357) : (i64) -> i64
      %359 = func.call @cc_t_value() : () -> i64
      %360 = arith.constant 10 : i64
      %361 = func.call @cc_box_fixnum(%360) : (i64) -> i64
      %362 = llvm.mlir.addressof @str29 : !llvm.ptr
      %363 = arith.constant 6 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = llvm.mlir.addressof @str30 : !llvm.ptr
      %366 = arith.constant 7 : i64
      %367 = func.call @cc_make_string(%365, %366) : (!llvm.ptr, i64) -> i64
      %368 = func.call @cc_intern(%364, %367) : (i64, i64) -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_cons(%368, %369) : (i64, i64) -> i64
      %371 = func.call @cc_values_pack(%370) : (i64) -> i64
      %372 = func.call @cc_nil_value() : () -> i64
      %373 = func.call @cc_t_value() : () -> i64
      %374 = func.call @cc_t_value() : () -> i64
      %375 = func.call @cc_nil_value() : () -> i64
      %376 = func.call @cc_nil_value() : () -> i64
      %377 = func.call @cc_nil_value() : () -> i64
      %378 = func.call @cc_nil_value() : () -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_nil_value() : () -> i64
      %381 = func.call @cc_nil_value() : () -> i64
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = func.call @cc_nil_value() : () -> i64
      %384 = arith.constant 10 : i64
      %385 = func.call @cc_box_fixnum(%384) : (i64) -> i64
      %386 = llvm.mlir.addressof @str31 : !llvm.ptr
      %387 = arith.constant 12 : i64
      %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
      %389 = func.call @cc_nil_value() : () -> i64
      %390 = func.call @cc_intern(%388, %389) : (i64, i64) -> i64
      %391 = func.call @cc_nil_value() : () -> i64
      %392 = func.call @cc_cons(%390, %391) : (i64, i64) -> i64
      %393 = func.call @cc_values_pack(%392) : (i64) -> i64
      %394 = func.call @cc_t_value() : () -> i64
      %395 = func.call @cc_nil_value() : () -> i64
      %396 = llvm.mlir.addressof @str32 : !llvm.ptr
      %397 = arith.constant 20 : i64
      %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
      %399 = llvm.mlir.addressof @str33 : !llvm.ptr
      %400 = arith.constant 16 : i64
      %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
      %402 = func.call @cc_intern(%398, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      %406 = func.call @cc_nil_value() : () -> i64
      %407 = func.call @cc_cons(%347, %406) : (i64, i64) -> i64
      %408 = func.call @cc_cons(%339, %407) : (i64, i64) -> i64
      %409 = func.call @cc_cons(%331, %408) : (i64, i64) -> i64
      %410 = func.call @cc_cons(%323, %409) : (i64, i64) -> i64
      %411 = func.call @cc_cons(%315, %410) : (i64, i64) -> i64
      %412 = func.call @cc_cons(%307, %411) : (i64, i64) -> i64
      %413 = func.call @cc_cons(%299, %412) : (i64, i64) -> i64
      %414 = func.call @cc_cons(%291, %413) : (i64, i64) -> i64
      %415 = func.call @cc_cons(%283, %414) : (i64, i64) -> i64
      %416 = func.call @cc_cons(%275, %415) : (i64, i64) -> i64
      %417 = func.call @cc_cons(%267, %416) : (i64, i64) -> i64
      %418 = func.call @cc_cons(%259, %417) : (i64, i64) -> i64
      %419 = func.call @cc_cons(%251, %418) : (i64, i64) -> i64
      %420 = func.call @cc_cons(%243, %419) : (i64, i64) -> i64
      %421 = func.call @cc_cons(%235, %420) : (i64, i64) -> i64
      %422 = func.call @cc_cons(%227, %421) : (i64, i64) -> i64
      %423 = func.call @cc_cons(%219, %422) : (i64, i64) -> i64
      %424 = func.call @cc_cons(%211, %423) : (i64, i64) -> i64
      %425 = func.call @cc_cons(%203, %424) : (i64, i64) -> i64
      %426 = func.call @cc_cons(%195, %425) : (i64, i64) -> i64
      %427 = func.call @cc_cons(%187, %426) : (i64, i64) -> i64
      %428 = func.call @cc_nil_value() : () -> i64
      %429 = func.call @cc_cons(%402, %428) : (i64, i64) -> i64
      %430 = func.call @cc_cons(%395, %429) : (i64, i64) -> i64
      %431 = func.call @cc_cons(%394, %430) : (i64, i64) -> i64
      %432 = func.call @cc_cons(%390, %431) : (i64, i64) -> i64
      %433 = func.call @cc_cons(%385, %432) : (i64, i64) -> i64
      %434 = func.call @cc_cons(%383, %433) : (i64, i64) -> i64
      %435 = func.call @cc_cons(%382, %434) : (i64, i64) -> i64
      %436 = func.call @cc_cons(%381, %435) : (i64, i64) -> i64
      %437 = func.call @cc_cons(%380, %436) : (i64, i64) -> i64
      %438 = func.call @cc_cons(%379, %437) : (i64, i64) -> i64
      %439 = func.call @cc_cons(%378, %438) : (i64, i64) -> i64
      %440 = func.call @cc_cons(%377, %439) : (i64, i64) -> i64
      %441 = func.call @cc_cons(%376, %440) : (i64, i64) -> i64
      %442 = func.call @cc_cons(%375, %441) : (i64, i64) -> i64
      %443 = func.call @cc_cons(%374, %442) : (i64, i64) -> i64
      %444 = func.call @cc_cons(%373, %443) : (i64, i64) -> i64
      %445 = func.call @cc_cons(%372, %444) : (i64, i64) -> i64
      %446 = func.call @cc_cons(%368, %445) : (i64, i64) -> i64
      %447 = func.call @cc_cons(%361, %446) : (i64, i64) -> i64
      %448 = func.call @cc_cons(%359, %447) : (i64, i64) -> i64
      %449 = func.call @cc_cons(%355, %448) : (i64, i64) -> i64
      %450 = llvm.mlir.addressof @str34 : !llvm.ptr
      %451 = arith.constant 12 : i64
      %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
      %453 = func.call @cc_nil_value() : () -> i64
      %454 = func.call @cc_intern(%452, %453) : (i64, i64) -> i64
      %455 = func.call @cc_nil_value() : () -> i64
      %456 = func.call @cc_cons(%454, %455) : (i64, i64) -> i64
      %457 = func.call @cc_values_pack(%456) : (i64) -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %458 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%454, %458) : (i64, i64) -> ()
      %459 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %460 = func.call @stack_pop_pointer() : () -> i64
      %461 = func.call @cc_nil_value() : () -> i64
      %462 = func.call @cc_errorp(%460) : (i64) -> i64
      %463 = arith.cmpi ne, %462, %461 : i64
      %464 = arith.cmpi eq, %461, %461 : i64
      %465 = arith.andi %463, %464 : i1
      %466 = scf.if %465 -> (i64) {
        scf.yield %460 : i64
      } else {
        scf.yield %461 : i64
      }
      %467 = arith.cmpi ne, %466, %461 : i64
      scf.if %467 {
        func.call @stack_push_pointer(%466) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%460) : (i64) -> ()
        %468 = llvm.mlir.addressof @str35 : !llvm.ptr
        %469 = func.call @cc_make_function_ref_const(%468) : (!llvm.ptr) -> i64
        %470 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%469, %470) : (i64, i64) -> ()
      }
      %471 = func.call @stack_pop_pointer() : () -> i64
      %472 = llvm.mlir.addressof @str36 : !llvm.ptr
      %473 = arith.constant 23 : i64
      %474 = func.call @cc_make_symbol(%472, %473) : (!llvm.ptr, i64) -> i64
      %475 = func.call @cc_symbol_value(%474) : (i64) -> i64
      %476 = func.call @cc_set_symbol_value(%474, %471) : (i64, i64) -> i64
      %477 = func.call @cc_nil_value() : () -> i64
      %478 = func.call @cc_nil_value() : () -> i64
      %479 = func.call @cc_errorp(%477) : (i64) -> i64
      %480 = arith.cmpi ne, %479, %478 : i64
      %481 = scf.if %480 -> (i64) {
        scf.yield %477 : i64
      } else {
        %482 = llvm.mlir.addressof @str37 : !llvm.ptr
        %483 = arith.constant 6 : i64
        %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
        %485 = llvm.mlir.addressof @str38 : !llvm.ptr
        %486 = arith.constant 11 : i64
        %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
        %488 = func.call @cc_intern(%484, %487) : (i64, i64) -> i64
        %489 = func.call @cc_nil_value() : () -> i64
        %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
        %491 = func.call @cc_values_pack(%490) : (i64) -> i64
        func.call @stack_push_pointer(%488) : (i64) -> ()
        %492 = func.call @stack_pop_pointer() : () -> i64
        %493 = func.call @cc_nil_value() : () -> i64
        %494 = llvm.mlir.addressof @str39 : !llvm.ptr
        %495 = arith.constant 1 : i64
        %496 = func.call @cc_make_string(%494, %495) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%496) : (i64) -> ()
        %497 = func.call @stack_pop_pointer() : () -> i64
        %498 = func.call @cc_cons(%497, %493) : (i64, i64) -> i64
        func.call @stack_push_pointer(%176) : (i64) -> ()
        %499 = func.call @stack_pop_pointer() : () -> i64
        %500 = func.call @cc_string(%499) : (i64) -> i64
        func.call @stack_push_pointer(%500) : (i64) -> ()
        %501 = func.call @stack_pop_pointer() : () -> i64
        %502 = func.call @cc_cons(%501, %498) : (i64, i64) -> i64
        %503 = func.call @cc_concatenate(%492, %502) : (i64, i64) -> i64
        func.call @stack_push_pointer(%503) : (i64) -> ()
        %504 = func.call @stack_pop_pointer() : () -> i64
        %505 = func.call @cc_nil_value() : () -> i64
        %506 = func.call @cc_errorp(%504) : (i64) -> i64
        %507 = arith.cmpi ne, %506, %505 : i64
        %508 = arith.cmpi eq, %505, %505 : i64
        %509 = arith.andi %507, %508 : i1
        %510 = scf.if %509 -> (i64) {
          scf.yield %504 : i64
        } else {
          scf.yield %505 : i64
        }
        %511 = arith.cmpi ne, %510, %505 : i64
        scf.if %511 {
          func.call @stack_push_pointer(%510) : (i64) -> ()
        } else {
          %512 = func.call @cc_nil_value() : () -> i64
          %513 = func.call @cc_cons(%504, %512) : (i64, i64) -> i64
          func.call @stack_push_pointer(%513) : (i64) -> ()
          func.call @cc_read_from_string_stack() : () -> ()
        }
        %514 = func.call @stack_pop_pointer() : () -> i64
        %515 = func.call @cc_errorp(%514) : (i64) -> i64
        %516 = func.call @cc_nil_value() : () -> i64
        %517 = arith.cmpi ne, %515, %516 : i64
        %518 = scf.if %517 -> (i64) {
          %519 = func.call @cc_condition_value(%514) : (i64) -> i64
          %520 = llvm.mlir.addressof @str40 : !llvm.ptr
          %521 = arith.constant 12 : i64
          %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
          %523 = llvm.mlir.addressof @str41 : !llvm.ptr
          %524 = arith.constant 11 : i64
          %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
          %526 = func.call @cc_intern(%522, %525) : (i64, i64) -> i64
          %527 = func.call @cc_nil_value() : () -> i64
          %528 = func.call @cc_cons(%526, %527) : (i64, i64) -> i64
          %529 = func.call @cc_values_pack(%528) : (i64) -> i64
          func.call @stack_push_pointer(%526) : (i64) -> ()
          %530 = func.call @stack_pop_pointer() : () -> i64
          %531 = func.call @cc_typep(%519, %530) : (i64, i64) -> i64
          %532 = func.call @cc_nil_value() : () -> i64
          %533 = arith.cmpi ne, %531, %532 : i64
          %534 = scf.if %533 -> (i64) {
            func.call @stack_push_pointer(%519) : (i64) -> ()
            %535 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %535 : i64
          } else {
            scf.yield %514 : i64
          }
          scf.yield %534 : i64
        } else {
          scf.yield %514 : i64
        }
        func.call @stack_push_pointer(%518) : (i64) -> ()
        %536 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %536 : i64
      }
      func.call @stack_push_pointer(%481) : (i64) -> ()
      %537 = func.call @cc_restore_symbol_value(%474, %475) : (i64, i64) -> i64
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @cc_nil_value() : () -> i64
      %540 = func.call @cc_errorp(%538) : (i64) -> i64
      %541 = arith.cmpi ne, %540, %539 : i64
      %542 = scf.if %541 -> (i64) {
        scf.yield %538 : i64
      } else {
        %543 = func.call @cc_multiple_value_list(%538) : (i64) -> i64
        scf.yield %543 : i64
      }
      %544 = llvm.mlir.addressof @str42 : !llvm.ptr
      %545 = arith.constant 11 : i64
      %546 = func.call @cc_make_string(%544, %545) : (!llvm.ptr, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_intern(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_nil_value() : () -> i64
      %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
      %551 = func.call @cc_values_pack(%550) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      %552 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%548, %552) : (i64, i64) -> ()
      %553 = func.call @stack_pop_pointer() : () -> i64
      %554 = scf.if %541 -> (i64) {
        scf.yield %542 : i64
      } else {
        %555 = func.call @cc_values_pack(%542) : (i64) -> i64
        scf.yield %555 : i64
      }
      func.call @stack_push_pointer(%554) : (i64) -> ()
      %556 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %556 : i64
    }
    func.call @stack_push_pointer(%182) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_192447015550976*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_192447015550976*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_192447015550976*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str5("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str6("SET-SYNTAX-FROM-CHAR-TRAIT-X-1A\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str7("*PACKAGE*\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str8("*PRINT-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str9("*PRINT-BASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str10("*PRINT-CASE*\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str11("*PRINT-CIRCLE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str12("*PRINT-ESCAPE*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str13("*PRINT-GENSYM*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str14("*PRINT-LENGTH*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str15("*PRINT-LEVEL*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str16("*PRINT-LINES*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str17("*PRINT-MISER-WIDTH*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str18("*PRINT-PPRINT-DISPATCH*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str19("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str20("*PRINT-RADIX*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str21("*PRINT-READABLY*\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str22("*PRINT-RIGHT-MARGIN*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str23("*READ-BASE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("*READ-DEFAULT-FLOAT-FORMAT*\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str25("*READ-EVAL*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("*READ-SUPPRESS*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str27("*READTABLE*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP-USER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str29("UPCASE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str32("__RLASP_READTABLE__0\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP-USER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str34("%%PROGV-PUSH\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str35("COPY-READTABLE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP:*READTABLE*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str37("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("Z\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str40("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("%%PROGV-POP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("#:%%DYN-CELL-192447015550978-E\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str44("MAPCAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str45("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str48("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str49("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("test-true\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str51("show-test-summary\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str52("*__MLIR_BLOCK_RETFLAG_192447015550976*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str53("*__MLIR_BLOCK_RETMVLIST_192447015550976*\00") : !llvm.array<41 x i8>
}
