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
  func.func private @cc_collect_args(i64) -> i64
  func.func private @cc_collect_rest_args(i64, i64) -> i64
  func.func private @cc_collect_bad_char_reader_roundtrips() -> i64
  func.func private @cc_collect_bad_char_name_roundtrips() -> i64
  func.func private @cc_if(i64, i64, i64) -> i64
  
  // Function objects
  func.func private @cc_make_lambda_ref_str(!llvm.ptr) -> i64
  func.func private @cc_make_lambda_ref_id(i64) -> i64
  func.func private @cc_make_closure(i64, i64) -> i64
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
  func.func private @cc_restart_invocation_matches(i64, i64) -> i64
  func.func private @cc_restart_invocation_args(i64) -> i64
  func.func private @cc_read_from_string_stack()
  func.func @"__main"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 6 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%4) : (i64) -> ()
    %8 = func.call @cc_nil_value() : () -> i64
    %9 = llvm.mlir.addressof @str1 : !llvm.ptr
    %10 = arith.constant 3 : i64
    %11 = func.call @cc_make_string(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = llvm.mlir.addressof @str2 : !llvm.ptr
    %13 = arith.constant 7 : i64
    %14 = func.call @cc_make_string(%12, %13) : (!llvm.ptr, i64) -> i64
    %15 = func.call @cc_intern(%11, %14) : (i64, i64) -> i64
    %16 = func.call @cc_nil_value() : () -> i64
    %17 = func.call @cc_cons(%15, %16) : (i64, i64) -> i64
    %18 = func.call @cc_values_pack(%17) : (i64) -> i64
    func.call @stack_push_pointer(%15) : (i64) -> ()
    %19 = func.call @stack_pop_pointer() : () -> i64
    %20 = func.call @cc_cons(%19, %8) : (i64, i64) -> i64
    %21 = llvm.mlir.addressof @str3 : !llvm.ptr
    %22 = arith.constant 8 : i64
    %23 = func.call @cc_make_string(%21, %22) : (!llvm.ptr, i64) -> i64
    %24 = llvm.mlir.addressof @str4 : !llvm.ptr
    %25 = arith.constant 7 : i64
    %26 = func.call @cc_make_string(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = func.call @cc_intern(%23, %26) : (i64, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_cons(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_values_pack(%29) : (i64) -> i64
    func.call @stack_push_pointer(%27) : (i64) -> ()
    %31 = func.call @stack_pop_pointer() : () -> i64
    %32 = func.call @cc_cons(%31, %20) : (i64, i64) -> i64
    %33 = llvm.mlir.addressof @str5 : !llvm.ptr
    %34 = func.call @cc_make_function_ref_const(%33) : (!llvm.ptr) -> i64
    func.call @stack_push_pointer(%34) : (i64) -> ()
    %35 = func.call @stack_pop_pointer() : () -> i64
    %36 = func.call @cc_cons(%35, %32) : (i64, i64) -> i64
    %37 = llvm.mlir.addressof @str6 : !llvm.ptr
    %38 = arith.constant 4 : i64
    %39 = func.call @cc_make_string(%37, %38) : (!llvm.ptr, i64) -> i64
    %40 = llvm.mlir.addressof @str7 : !llvm.ptr
    %41 = arith.constant 7 : i64
    %42 = func.call @cc_make_string(%40, %41) : (!llvm.ptr, i64) -> i64
    %43 = func.call @cc_intern(%39, %42) : (i64, i64) -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_cons(%43, %44) : (i64, i64) -> i64
    %46 = func.call @cc_values_pack(%45) : (i64) -> i64
    func.call @stack_push_pointer(%43) : (i64) -> ()
    %47 = func.call @stack_pop_pointer() : () -> i64
    %48 = func.call @cc_cons(%47, %36) : (i64, i64) -> i64
    func.call @stack_push_pointer(%48) : (i64) -> ()
    func.call @cc_make_hash_table_stack() : () -> ()
    %49 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%49) : (i64) -> ()
    %50 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %51 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %52 = func.call @stack_pop_pointer() : () -> i64
    %53 = func.call @cc_nil_value() : () -> i64
    %54 = func.call @cc_nil_value() : () -> i64
    %55 = func.call @cc_errorp(%53) : (i64) -> i64
    %56 = arith.cmpi ne, %55, %54 : i64
    %57:3 = scf.if %56 -> (i64, i64, i64) {
      scf.yield %53, %51, %52 : i64, i64, i64
    } else {
      %58 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%58) : (i64) -> ()
      %59 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%59) : (i64) -> ()
      %60 = func.call @stack_pop_pointer() : () -> i64
      %61 = func.call @stack_pop_pointer() : () -> i64
      %62 = func.call @cc_cons(%61, %60) : (i64, i64) -> i64
      func.call @stack_push_pointer(%62) : (i64) -> ()
      %63 = func.call @stack_pop_pointer() : () -> i64
      %64 = func.call @cc_nil_value() : () -> i64
      %65 = func.call @cc_nil_value() : () -> i64
      %66 = func.call @cc_errorp(%64) : (i64) -> i64
      %67 = arith.cmpi ne, %66, %65 : i64
      %68:2 = scf.if %67 -> (i64, i64) {
        scf.yield %64, %52 : i64, i64
      } else {
        func.call @stack_push_pointer(%63) : (i64) -> ()
        func.call @stack_push_pointer(%50) : (i64) -> ()
        %69 = arith.constant 23 : i64
        func.call @stack_push_fixnum(%69) : (i64) -> ()
        %70 = func.call @stack_pop_pointer() : () -> i64
        %71 = func.call @stack_pop_pointer() : () -> i64
        %72 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%70) : (i64) -> ()
        func.call @stack_push_pointer(%72) : (i64) -> ()
        func.call @stack_push_pointer(%71) : (i64) -> ()
        %73 = llvm.mlir.addressof @str8 : !llvm.ptr
        %74 = func.call @cc_make_function_ref_const(%73) : (!llvm.ptr) -> i64
        %75 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%74, %75) : (i64, i64) -> ()
        %76 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %76, %52 : i64, i64
      }
      %77 = func.call @cc_nil_value() : () -> i64
      %78 = func.call @cc_errorp(%68#0) : (i64) -> i64
      %79 = arith.cmpi ne, %78, %77 : i64
      %80:2 = scf.if %79 -> (i64, i64) {
        scf.yield %68#0, %68#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%63) : (i64) -> ()
        %81 = func.call @stack_pop_pointer() : () -> i64
        %82 = func.call @cc_cons(%81, %68#1) : (i64, i64) -> i64
        func.call @stack_push_pointer(%82) : (i64) -> ()
        %83 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %83, %82 : i64, i64
      }
      func.call @stack_push_pointer(%80#0) : (i64) -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %84, %51, %80#1 : i64, i64, i64
    }
    %85 = func.call @cc_nil_value() : () -> i64
    %86 = func.call @cc_errorp(%57#0) : (i64) -> i64
    %87 = arith.cmpi ne, %86, %85 : i64
    %88:3 = scf.if %87 -> (i64, i64, i64) {
      scf.yield %57#0, %57#1, %57#2 : i64, i64, i64
    } else {
      %89 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%89) : (i64) -> ()
      %90 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%90) : (i64) -> ()
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @cc_cons(%92, %91) : (i64, i64) -> i64
      func.call @stack_push_pointer(%93) : (i64) -> ()
      %94 = func.call @stack_pop_pointer() : () -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_nil_value() : () -> i64
      %97 = func.call @cc_errorp(%95) : (i64) -> i64
      %98 = arith.cmpi ne, %97, %96 : i64
      %99:2 = scf.if %98 -> (i64, i64) {
        scf.yield %95, %57#2 : i64, i64
      } else {
        func.call @stack_push_pointer(%94) : (i64) -> ()
        func.call @stack_push_pointer(%50) : (i64) -> ()
        %100 = arith.constant 24 : i64
        func.call @stack_push_fixnum(%100) : (i64) -> ()
        %101 = func.call @stack_pop_pointer() : () -> i64
        %102 = func.call @stack_pop_pointer() : () -> i64
        %103 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%101) : (i64) -> ()
        func.call @stack_push_pointer(%103) : (i64) -> ()
        func.call @stack_push_pointer(%102) : (i64) -> ()
        %104 = llvm.mlir.addressof @str9 : !llvm.ptr
        %105 = func.call @cc_make_function_ref_const(%104) : (!llvm.ptr) -> i64
        %106 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%105, %106) : (i64, i64) -> ()
        %107 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %107, %57#2 : i64, i64
      }
      %108 = func.call @cc_nil_value() : () -> i64
      %109 = func.call @cc_errorp(%99#0) : (i64) -> i64
      %110 = arith.cmpi ne, %109, %108 : i64
      %111:2 = scf.if %110 -> (i64, i64) {
        scf.yield %99#0, %99#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%94) : (i64) -> ()
        %112 = func.call @stack_pop_pointer() : () -> i64
        %113 = func.call @cc_cons(%112, %99#1) : (i64, i64) -> i64
        func.call @stack_push_pointer(%113) : (i64) -> ()
        %114 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %114, %113 : i64, i64
      }
      func.call @stack_push_pointer(%111#0) : (i64) -> ()
      %115 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %115, %57#1, %111#1 : i64, i64, i64
    }
    %116 = func.call @cc_nil_value() : () -> i64
    %117 = func.call @cc_errorp(%88#0) : (i64) -> i64
    %118 = arith.cmpi ne, %117, %116 : i64
    %119:3 = scf.if %118 -> (i64, i64, i64) {
      scf.yield %88#0, %88#1, %88#2 : i64, i64, i64
    } else {
      %120 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%120) : (i64) -> ()
      %121 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%121) : (i64) -> ()
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @cc_cons(%123, %122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @cc_nil_value() : () -> i64
      %127 = func.call @cc_nil_value() : () -> i64
      %128 = func.call @cc_errorp(%126) : (i64) -> i64
      %129 = arith.cmpi ne, %128, %127 : i64
      %130:2 = scf.if %129 -> (i64, i64) {
        scf.yield %126, %88#2 : i64, i64
      } else {
        func.call @stack_push_pointer(%125) : (i64) -> ()
        func.call @stack_push_pointer(%50) : (i64) -> ()
        %131 = arith.constant 25 : i64
        func.call @stack_push_fixnum(%131) : (i64) -> ()
        %132 = func.call @stack_pop_pointer() : () -> i64
        %133 = func.call @stack_pop_pointer() : () -> i64
        %134 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%132) : (i64) -> ()
        func.call @stack_push_pointer(%134) : (i64) -> ()
        func.call @stack_push_pointer(%133) : (i64) -> ()
        %135 = llvm.mlir.addressof @str10 : !llvm.ptr
        %136 = func.call @cc_make_function_ref_const(%135) : (!llvm.ptr) -> i64
        %137 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%136, %137) : (i64, i64) -> ()
        %138 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %138, %88#2 : i64, i64
      }
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_errorp(%130#0) : (i64) -> i64
      %141 = arith.cmpi ne, %140, %139 : i64
      %142:2 = scf.if %141 -> (i64, i64) {
        scf.yield %130#0, %130#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%125) : (i64) -> ()
        %143 = func.call @stack_pop_pointer() : () -> i64
        %144 = func.call @cc_cons(%143, %130#1) : (i64, i64) -> i64
        func.call @stack_push_pointer(%144) : (i64) -> ()
        %145 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %145, %144 : i64, i64
      }
      func.call @stack_push_pointer(%142#0) : (i64) -> ()
      %146 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %146, %88#1, %142#1 : i64, i64, i64
    }
    %147 = func.call @cc_nil_value() : () -> i64
    %148 = func.call @cc_errorp(%119#0) : (i64) -> i64
    %149 = arith.cmpi ne, %148, %147 : i64
    %150:3 = scf.if %149 -> (i64, i64, i64) {
      scf.yield %119#0, %119#1, %119#2 : i64, i64, i64
    } else {
      func.call @stack_push_pointer(%50) : (i64) -> ()
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @cc_nil_value() : () -> i64
      %153 = func.call @cc_errorp(%151) : (i64) -> i64
      %154 = arith.cmpi ne, %153, %152 : i64
      %155 = arith.cmpi eq, %152, %152 : i64
      %156 = arith.andi %154, %155 : i1
      %157 = scf.if %156 -> (i64) {
        scf.yield %151 : i64
      } else {
        scf.yield %152 : i64
      }
      %158 = arith.cmpi ne, %157, %152 : i64
      scf.if %158 {
        func.call @stack_push_pointer(%157) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%151) : (i64) -> ()
        %159 = llvm.mlir.addressof @str11 : !llvm.ptr
        %160 = func.call @cc_make_function_ref_const(%159) : (!llvm.ptr) -> i64
        %161 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%160, %161) : (i64, i64) -> ()
      }
      %162 = func.call @stack_pop_pointer() : () -> i64
      %163:2 = scf.while (%arg0 = %162, %arg1 = %119#1) : (i64, i64) -> (i64, i64) {
        %164 = func.call @cc_is_cons(%arg0) : (i64) -> i32
        %165 = arith.constant 0 : i32
        %166 = arith.cmpi ne, %164, %165 : i32
        scf.condition(%166) %arg0, %arg1 : i64, i64
      } do {
        ^bb0(%167: i64, %168: i64):
        %169 = func.call @cc_car(%167) : (i64) -> i64
        func.call @stack_push_pointer(%169) : (i64) -> ()
        func.call @stack_push_pointer(%50) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %170 = func.call @stack_pop_pointer() : () -> i64
        %171 = func.call @stack_pop_pointer() : () -> i64
        %172 = func.call @stack_pop_pointer() : () -> i64
        %173 = func.call @cc_gethash(%172, %171, %170) : (i64, i64, i64) -> i64
        func.call @stack_push_pointer(%173) : (i64) -> ()
        %174 = func.call @stack_pop_pointer() : () -> i64
        %175 = func.call @cc_nil_value() : () -> i64
        %176 = func.call @cc_nil_value() : () -> i64
        %177 = func.call @cc_errorp(%175) : (i64) -> i64
        %178 = arith.cmpi ne, %177, %176 : i64
        %179:2 = scf.if %178 -> (i64, i64) {
          scf.yield %175, %168 : i64, i64
        } else {
          func.call @stack_push_pointer(%174) : (i64) -> ()
          %180 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%169) : (i64) -> ()
          %181 = func.call @stack_pop_pointer() : () -> i64
          %182 = func.call @cc_nil_value() : () -> i64
          %183 = func.call @cc_errorp(%180) : (i64) -> i64
          %184 = arith.cmpi ne, %183, %182 : i64
          %185 = arith.cmpi eq, %182, %182 : i64
          %186 = arith.andi %184, %185 : i1
          %187 = scf.if %186 -> (i64) {
            scf.yield %180 : i64
          } else {
            scf.yield %182 : i64
          }
          %188 = func.call @cc_errorp(%181) : (i64) -> i64
          %189 = arith.cmpi ne, %188, %182 : i64
          %190 = arith.cmpi eq, %187, %182 : i64
          %191 = arith.andi %189, %190 : i1
          %192 = scf.if %191 -> (i64) {
            scf.yield %181 : i64
          } else {
            scf.yield %187 : i64
          }
          %193 = arith.cmpi ne, %192, %182 : i64
          scf.if %193 {
            func.call @stack_push_pointer(%192) : (i64) -> ()
          } else {
            %194 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%194) : (i64) -> ()
            func.call @stack_push_pointer(%181) : (i64) -> ()
            %195 = func.call @stack_pop_pointer() : () -> i64
            %196 = func.call @stack_pop_pointer() : () -> i64
            %197 = func.call @cc_cons(%195, %196) : (i64, i64) -> i64
            func.call @stack_push_pointer(%197) : (i64) -> ()
            func.call @stack_push_pointer(%180) : (i64) -> ()
            %198 = func.call @stack_pop_pointer() : () -> i64
            %199 = func.call @stack_pop_pointer() : () -> i64
            %200 = func.call @cc_cons(%198, %199) : (i64, i64) -> i64
            func.call @stack_push_pointer(%200) : (i64) -> ()
          }
          %201 = func.call @stack_pop_pointer() : () -> i64
          %202 = func.call @cc_cons(%201, %168) : (i64, i64) -> i64
          func.call @stack_push_pointer(%202) : (i64) -> ()
          %203 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %203, %202 : i64, i64
        }
        func.call @stack_push_pointer(%179#0) : (i64) -> ()
        %204 = func.call @stack_depth() : () -> i64
        %205 = arith.constant 0 : i64
        %206 = arith.cmpi sgt, %204, %205 : i64
        scf.if %206 {
          %207 = func.call @stack_pop_pointer() : () -> i64
        }
        %208 = func.call @cc_cdr(%167) : (i64) -> i64
        scf.yield %208, %179#1 : i64, i64
      }
      %209 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %210 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %210, %163#1, %119#2 : i64, i64, i64
    }
    %211 = func.call @cc_nil_value() : () -> i64
    %212 = func.call @cc_errorp(%150#0) : (i64) -> i64
    %213 = arith.cmpi ne, %212, %211 : i64
    %214:3 = scf.if %213 -> (i64, i64, i64) {
      scf.yield %150#0, %150#1, %150#2 : i64, i64, i64
    } else {
      %215 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%215) : (i64) -> ()
      %216 = func.call @stack_pop_pointer() : () -> i64
      %217 = llvm.mlir.addressof @str12 : !llvm.ptr
      %218 = arith.constant 4 : i64
      %219 = func.call @cc_make_string(%217, %218) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %220 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%150#1) : (i64) -> ()
      %221 = llvm.mlir.addressof @str13 : !llvm.ptr
      %222 = func.call @cc_make_function_ref_const(%221) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      %223 = llvm.mlir.addressof @str14 : !llvm.ptr
      %224 = func.call @cc_make_function_ref_const(%223) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%224) : (i64) -> ()
      %225 = func.call @stack_pop_pointer() : () -> i64
      %226 = func.call @stack_pop_pointer() : () -> i64
      %227 = func.call @stack_pop_pointer() : () -> i64
      %228 = func.call @cc_sort_key(%227, %226, %225) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%228) : (i64) -> ()
      %229 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%216) : (i64) -> ()
      func.call @stack_push_pointer(%220) : (i64) -> ()
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %230 = llvm.mlir.addressof @str15 : !llvm.ptr
      %231 = func.call @cc_make_function_ref_const(%230) : (!llvm.ptr) -> i64
      %232 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%231, %232) : (i64, i64) -> ()
      %233 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %233, %150#1, %150#2 : i64, i64, i64
    }
    func.call @stack_push_pointer(%214#0) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("KEY\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str2("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str3("WEAKNESS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str4("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str5("COMMON-LISP:EQ\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str6("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str7("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("%FN%(setf COMMON-LISP:GETHASH)\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str9("%FN%(setf COMMON-LISP:GETHASH)\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str10("%FN%(setf COMMON-LISP:GETHASH)\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str11("hash-table-keys\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str12("~S~%\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP:<\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP:FIRST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str15("FORMAT\00") : !llvm.array<7 x i8>
}
