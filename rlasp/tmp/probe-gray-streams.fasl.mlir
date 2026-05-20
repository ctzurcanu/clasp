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
  func.func private @cc_is_cons(i64) -> i32
  func.func private @cc_nil_value() -> i64
  func.func private @cc_t_value() -> i64
  func.func private @cc_register_function_lambda_list_metadata_raw(i64, i64) -> i64
  func.func private @cc_runtime_debug_stack_push_name(i64)
  func.func private @cc_runtime_debug_stack_pop_name()
  
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
  func.func @"%FN%show-read-line"() {
    %0 = func.call @stack_pop_pointer() : () -> i64
    %1 = llvm.mlir.addressof @str0 : !llvm.ptr
    %2 = arith.constant 14 : i64
    %3 = func.call @cc_make_string(%1, %2) : (!llvm.ptr, i64) -> i64
    %4 = func.call @cc_nil_value() : () -> i64
    %5 = func.call @cc_intern(%3, %4) : (i64, i64) -> i64
    %6 = func.call @cc_nil_value() : () -> i64
    %7 = func.call @cc_cons(%5, %6) : (i64, i64) -> i64
    %8 = func.call @cc_values_pack(%7) : (i64) -> i64
    %9 = llvm.mlir.addressof @str1 : !llvm.ptr
    %10 = arith.constant 5 : i64
    %11 = func.call @cc_make_string(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = func.call @cc_register_function_lambda_list_metadata_raw(%5, %11) : (i64, i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%5) : (i64) -> ()
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = llvm.mlir.addressof @str2 : !llvm.ptr
    %15 = arith.constant 38 : i64
    %16 = func.call @cc_make_symbol(%14, %15) : (!llvm.ptr, i64) -> i64
    %17 = func.call @cc_set_symbol_value(%16, %13) : (i64, i64) -> i64
    %18 = llvm.mlir.addressof @str3 : !llvm.ptr
    %19 = arith.constant 39 : i64
    %20 = func.call @cc_make_symbol(%18, %19) : (!llvm.ptr, i64) -> i64
    %21 = func.call @cc_set_symbol_value(%20, %13) : (i64, i64) -> i64
    %22 = llvm.mlir.addressof @str4 : !llvm.ptr
    %23 = arith.constant 40 : i64
    %24 = func.call @cc_make_symbol(%22, %23) : (!llvm.ptr, i64) -> i64
    %25 = func.call @cc_set_symbol_value(%24, %13) : (i64, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = llvm.mlir.addressof @str5 : !llvm.ptr
    %28 = arith.constant 22 : i64
    %29 = func.call @cc_make_string(%27, %28) : (!llvm.ptr, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_intern(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_nil_value() : () -> i64
    %33 = func.call @cc_cons(%31, %32) : (i64, i64) -> i64
    %34 = func.call @cc_values_pack(%33) : (i64) -> i64
    func.call @stack_push_pointer(%31) : (i64) -> ()
    func.call @stack_push_pointer(%0) : (i64) -> ()
    %35 = func.call @stack_pop_pointer() : () -> i64
    %36 = func.call @cc_cons(%35, %26) : (i64, i64) -> i64
    %37 = llvm.mlir.addressof @str6 : !llvm.ptr
    %38 = arith.constant 5 : i64
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
    %49 = func.call @stack_pop_pointer() : () -> i64
    %50 = func.call @cc_make_instance(%49, %48) : (i64, i64) -> i64
    func.call @stack_push_pointer(%50) : (i64) -> ()
    %51 = func.call @stack_pop_pointer() : () -> i64
    %52 = func.call @cc_nil_value() : () -> i64
    %53 = func.call @cc_nil_value() : () -> i64
    %54 = func.call @cc_errorp(%52) : (i64) -> i64
    %55 = arith.cmpi ne, %54, %53 : i64
    %56 = scf.if %55 -> (i64) {
      scf.yield %52 : i64
    } else {
      %57 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%57) : (i64) -> ()
      %58 = func.call @stack_pop_pointer() : () -> i64
      %59 = llvm.mlir.addressof @str8 : !llvm.ptr
      %60 = arith.constant 38 : i64
      %61 = func.call @cc_make_string(%59, %60) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %62 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %63 = func.call @stack_pop_pointer() : () -> i64
      %64 = llvm.mlir.addressof @str9 : !llvm.ptr
      %65 = arith.constant 5 : i64
      %66 = func.call @cc_make_string(%64, %65) : (!llvm.ptr, i64) -> i64
      %67 = func.call @cc_nil_value() : () -> i64
      %68 = func.call @cc_intern(%66, %67) : (i64, i64) -> i64
      %69 = func.call @cc_nil_value() : () -> i64
      %70 = func.call @cc_cons(%68, %69) : (i64, i64) -> i64
      %71 = func.call @cc_values_pack(%70) : (i64) -> i64
      func.call @stack_push_pointer(%68) : (i64) -> ()
      %72 = func.call @stack_pop_pointer() : () -> i64
      %73 = func.call @cc_nil_value() : () -> i64
      %74 = func.call @cc_errorp(%63) : (i64) -> i64
      %75 = arith.cmpi ne, %74, %73 : i64
      %76 = arith.cmpi eq, %73, %73 : i64
      %77 = arith.andi %75, %76 : i1
      %78 = scf.if %77 -> (i64) {
        scf.yield %63 : i64
      } else {
        scf.yield %73 : i64
      }
      %79 = func.call @cc_errorp(%72) : (i64) -> i64
      %80 = arith.cmpi ne, %79, %73 : i64
      %81 = arith.cmpi eq, %78, %73 : i64
      %82 = arith.andi %80, %81 : i1
      %83 = scf.if %82 -> (i64) {
        scf.yield %72 : i64
      } else {
        scf.yield %78 : i64
      }
      %84 = arith.cmpi ne, %83, %73 : i64
      scf.if %84 {
        func.call @stack_push_pointer(%83) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%63) : (i64) -> ()
        func.call @stack_push_pointer(%72) : (i64) -> ()
        %85 = llvm.mlir.addressof @str10 : !llvm.ptr
        %86 = func.call @cc_make_function_ref_const(%85) : (!llvm.ptr) -> i64
        %87 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%86, %87) : (i64, i64) -> ()
      }
      %88 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %89 = func.call @stack_pop_pointer() : () -> i64
      %90 = llvm.mlir.addressof @str11 : !llvm.ptr
      %91 = arith.constant 5 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_intern(%92, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_errorp(%89) : (i64) -> i64
      %101 = arith.cmpi ne, %100, %99 : i64
      %102 = arith.cmpi eq, %99, %99 : i64
      %103 = arith.andi %101, %102 : i1
      %104 = scf.if %103 -> (i64) {
        scf.yield %89 : i64
      } else {
        scf.yield %99 : i64
      }
      %105 = func.call @cc_errorp(%98) : (i64) -> i64
      %106 = arith.cmpi ne, %105, %99 : i64
      %107 = arith.cmpi eq, %104, %99 : i64
      %108 = arith.andi %106, %107 : i1
      %109 = scf.if %108 -> (i64) {
        scf.yield %98 : i64
      } else {
        scf.yield %104 : i64
      }
      %110 = arith.cmpi ne, %109, %99 : i64
      scf.if %110 {
        func.call @stack_push_pointer(%109) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%89) : (i64) -> ()
        func.call @stack_push_pointer(%98) : (i64) -> ()
        %111 = llvm.mlir.addressof @str12 : !llvm.ptr
        %112 = func.call @cc_make_function_ref_const(%111) : (!llvm.ptr) -> i64
        %113 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%112, %113) : (i64, i64) -> ()
      }
      %114 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %115 = func.call @stack_pop_pointer() : () -> i64
      %116 = func.call @cc_class_of(%115) : (i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      %117 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%58) : (i64) -> ()
      func.call @stack_push_pointer(%62) : (i64) -> ()
      func.call @stack_push_pointer(%88) : (i64) -> ()
      func.call @stack_push_pointer(%114) : (i64) -> ()
      func.call @stack_push_pointer(%117) : (i64) -> ()
      %118 = llvm.mlir.addressof @str13 : !llvm.ptr
      %119 = func.call @cc_make_function_ref_const(%118) : (!llvm.ptr) -> i64
      %120 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%119, %120) : (i64, i64) -> ()
      %121 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %121 : i64
    }
    %122 = func.call @cc_nil_value() : () -> i64
    %123 = func.call @cc_errorp(%56) : (i64) -> i64
    %124 = arith.cmpi ne, %123, %122 : i64
    %125 = scf.if %124 -> (i64) {
      scf.yield %56 : i64
    } else {
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %126 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %127 = func.call @stack_pop_pointer() : () -> i64
      %128 = llvm.mlir.addressof @str14 : !llvm.ptr
      %129 = arith.constant 6 : i64
      %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
      %131 = llvm.mlir.addressof @str15 : !llvm.ptr
      %132 = arith.constant 7 : i64
      %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
      %134 = func.call @cc_intern(%130, %133) : (i64, i64) -> i64
      %135 = func.call @cc_nil_value() : () -> i64
      %136 = func.call @cc_cons(%134, %135) : (i64, i64) -> i64
      %137 = func.call @cc_values_pack(%136) : (i64) -> i64
      func.call @stack_push_pointer(%134) : (i64) -> ()
      %138 = func.call @stack_pop_pointer() : () -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_errorp(%126) : (i64) -> i64
      %141 = arith.cmpi ne, %140, %139 : i64
      %142 = arith.cmpi eq, %139, %139 : i64
      %143 = arith.andi %141, %142 : i1
      %144 = scf.if %143 -> (i64) {
        scf.yield %126 : i64
      } else {
        scf.yield %139 : i64
      }
      %145 = func.call @cc_errorp(%127) : (i64) -> i64
      %146 = arith.cmpi ne, %145, %139 : i64
      %147 = arith.cmpi eq, %144, %139 : i64
      %148 = arith.andi %146, %147 : i1
      %149 = scf.if %148 -> (i64) {
        scf.yield %127 : i64
      } else {
        scf.yield %144 : i64
      }
      %150 = func.call @cc_errorp(%138) : (i64) -> i64
      %151 = arith.cmpi ne, %150, %139 : i64
      %152 = arith.cmpi eq, %149, %139 : i64
      %153 = arith.andi %151, %152 : i1
      %154 = scf.if %153 -> (i64) {
        scf.yield %138 : i64
      } else {
        scf.yield %149 : i64
      }
      %155 = arith.cmpi ne, %154, %139 : i64
      scf.if %155 {
        func.call @stack_push_pointer(%154) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%126) : (i64) -> ()
        func.call @stack_push_pointer(%127) : (i64) -> ()
        func.call @stack_push_pointer(%138) : (i64) -> ()
        %156 = llvm.mlir.addressof @str16 : !llvm.ptr
        %157 = func.call @cc_make_function_ref_const(%156) : (!llvm.ptr) -> i64
        %158 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%157, %158) : (i64, i64) -> ()
      }
      %159 = func.call @stack_pop_pointer() : () -> i64
      %160 = func.call @cc_multiple_value_list(%159) : (i64) -> i64
      %161 = arith.constant 0 : i64
      %162 = func.call @cc_box_fixnum(%161) : (i64) -> i64
      %163 = func.call @cc_nth(%162, %160) : (i64, i64) -> i64
      %164 = arith.constant 1 : i64
      %165 = func.call @cc_box_fixnum(%164) : (i64) -> i64
      %166 = func.call @cc_nth(%165, %160) : (i64, i64) -> i64
      %167 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%167) : (i64) -> ()
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = llvm.mlir.addressof @str17 : !llvm.ptr
      %170 = arith.constant 38 : i64
      %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%171) : (i64) -> ()
      %172 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%0) : (i64) -> ()
      %173 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%163) : (i64) -> ()
      %174 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      %175 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_errorp(%176) : (i64) -> i64
      %179 = arith.cmpi ne, %178, %177 : i64
      %180 = arith.cmpi eq, %177, %177 : i64
      %181 = arith.andi %179, %180 : i1
      %182 = scf.if %181 -> (i64) {
        scf.yield %176 : i64
      } else {
        scf.yield %177 : i64
      }
      %183 = arith.cmpi ne, %182, %177 : i64
      scf.if %183 {
        func.call @stack_push_pointer(%182) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%176) : (i64) -> ()
        %184 = llvm.mlir.addressof @str18 : !llvm.ptr
        %185 = func.call @cc_make_function_ref_const(%184) : (!llvm.ptr) -> i64
        %186 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%185, %186) : (i64, i64) -> ()
      }
      %187 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      func.call @stack_push_pointer(%172) : (i64) -> ()
      func.call @stack_push_pointer(%173) : (i64) -> ()
      func.call @stack_push_pointer(%174) : (i64) -> ()
      func.call @stack_push_pointer(%175) : (i64) -> ()
      func.call @stack_push_pointer(%187) : (i64) -> ()
      %188 = llvm.mlir.addressof @str19 : !llvm.ptr
      %189 = func.call @cc_make_function_ref_const(%188) : (!llvm.ptr) -> i64
      %190 = arith.constant 6 : i64
      func.call @cc_funcall_stack(%189, %190) : (i64, i64) -> ()
      %191 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %191 : i64
    }
    func.call @stack_push_pointer(%125) : (i64) -> ()
    %192 = func.call @stack_pop_pointer() : () -> i64
    %193 = func.call @cc_multiple_value_list(%192) : (i64) -> i64
    %194 = llvm.mlir.addressof @str20 : !llvm.ptr
    %195 = arith.constant 38 : i64
    %196 = func.call @cc_make_symbol(%194, %195) : (!llvm.ptr, i64) -> i64
    %197 = func.call @cc_symbol_value(%196) : (i64) -> i64
    %198 = llvm.mlir.addressof @str21 : !llvm.ptr
    %199 = arith.constant 39 : i64
    %200 = func.call @cc_make_symbol(%198, %199) : (!llvm.ptr, i64) -> i64
    %201 = func.call @cc_symbol_value(%200) : (i64) -> i64
    %202 = llvm.mlir.addressof @str22 : !llvm.ptr
    %203 = arith.constant 40 : i64
    %204 = func.call @cc_make_symbol(%202, %203) : (!llvm.ptr, i64) -> i64
    %205 = func.call @cc_symbol_value(%204) : (i64) -> i64
    %206 = func.call @cc_nil_value() : () -> i64
    %207 = arith.cmpi ne, %197, %206 : i64
    %208 = scf.if %207 -> (i64) {
      scf.yield %205 : i64
    } else {
      scf.yield %193 : i64
    }
    %209 = func.call @cc_values_pack(%208) : (i64) -> i64
    func.call @stack_push_pointer(%209) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %210 = llvm.mlir.addressof @str23 : !llvm.ptr
    %211 = arith.constant 6 : i64
    %212 = func.call @cc_make_string(%210, %211) : (!llvm.ptr, i64) -> i64
    %213 = func.call @cc_nil_value() : () -> i64
    %214 = func.call @cc_intern(%212, %213) : (i64, i64) -> i64
    %215 = func.call @cc_nil_value() : () -> i64
    %216 = func.call @cc_cons(%214, %215) : (i64, i64) -> i64
    %217 = func.call @cc_values_pack(%216) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%214) : (i64) -> ()
    %218 = func.call @cc_nil_value() : () -> i64
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_errorp(%218) : (i64) -> i64
    %221 = arith.cmpi ne, %220, %219 : i64
    %222 = scf.if %221 -> (i64) {
      scf.yield %218 : i64
    } else {
      %223 = llvm.mlir.addressof @str24 : !llvm.ptr
      %224 = arith.constant 11 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = llvm.mlir.addressof @str25 : !llvm.ptr
      %227 = arith.constant 7 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_intern(%225, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %233 = func.call @stack_pop_pointer() : () -> i64
      %234 = func.call @cc_in_package(%233) : (i64) -> i64
      func.call @stack_push_pointer(%234) : (i64) -> ()
      %235 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %235 : i64
    }
    %236 = func.call @cc_nil_value() : () -> i64
    %237 = func.call @cc_errorp(%222) : (i64) -> i64
    %238 = arith.cmpi ne, %237, %236 : i64
    %239 = scf.if %238 -> (i64) {
      scf.yield %222 : i64
    } else {
      %240 = llvm.mlir.addressof @str26 : !llvm.ptr
      %241 = arith.constant 45 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%242) : (i64) -> ()
      %243 = func.call @stack_pop_pointer() : () -> i64
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_cons(%243, %244) : (i64, i64) -> i64
      %246 = func.call @cc_load_stack(%245) : (i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      %247 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %247 : i64
    }
    %248 = func.call @cc_nil_value() : () -> i64
    %249 = func.call @cc_errorp(%239) : (i64) -> i64
    %250 = arith.cmpi ne, %249, %248 : i64
    %251 = scf.if %250 -> (i64) {
      scf.yield %239 : i64
    } else {
      %252 = llvm.mlir.addressof @str27 : !llvm.ptr
      %253 = arith.constant 11 : i64
      %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
      %255 = llvm.mlir.addressof @str28 : !llvm.ptr
      %256 = arith.constant 7 : i64
      %257 = func.call @cc_make_string(%255, %256) : (!llvm.ptr, i64) -> i64
      %258 = func.call @cc_intern(%254, %257) : (i64, i64) -> i64
      %259 = func.call @cc_nil_value() : () -> i64
      %260 = func.call @cc_cons(%258, %259) : (i64, i64) -> i64
      %261 = func.call @cc_values_pack(%260) : (i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @cc_in_package(%262) : (i64) -> i64
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %264 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %264 : i64
    }
    %265 = func.call @cc_nil_value() : () -> i64
    %266 = func.call @cc_errorp(%251) : (i64) -> i64
    %267 = arith.cmpi ne, %266, %265 : i64
    %268 = scf.if %267 -> (i64) {
      scf.yield %251 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %269 = llvm.mlir.addressof @str29 : !llvm.ptr
      %270 = arith.constant 5 : i64
      %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = func.call @cc_intern(%271, %272) : (i64, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_cons(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_values_pack(%275) : (i64) -> i64
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = func.call @cc_cons(%273, %277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      %279 = llvm.mlir.addressof @str30 : !llvm.ptr
      %280 = arith.constant 5 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = func.call @cc_intern(%281, %282) : (i64, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_cons(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_values_pack(%285) : (i64) -> i64
      %287 = func.call @stack_pop_pointer() : () -> i64
      %288 = func.call @cc_cons(%283, %287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%288) : (i64) -> ()
      %289 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %290 = llvm.mlir.addressof @str31 : !llvm.ptr
      %291 = arith.constant 34 : i64
      %292 = func.call @cc_make_string(%290, %291) : (!llvm.ptr, i64) -> i64
      %293 = llvm.mlir.addressof @str32 : !llvm.ptr
      %294 = arith.constant 4 : i64
      %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
      %296 = func.call @cc_intern(%292, %295) : (i64, i64) -> i64
      %297 = func.call @cc_nil_value() : () -> i64
      %298 = func.call @cc_cons(%296, %297) : (i64, i64) -> i64
      %299 = func.call @cc_values_pack(%298) : (i64) -> i64
      %300 = func.call @stack_pop_pointer() : () -> i64
      %301 = func.call @cc_cons(%296, %300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%301) : (i64) -> ()
      %302 = func.call @stack_pop_pointer() : () -> i64
      %303 = llvm.mlir.addressof @str33 : !llvm.ptr
      %304 = arith.constant 22 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = func.call @cc_nil_value() : () -> i64
      %307 = func.call @cc_intern(%305, %306) : (i64, i64) -> i64
      %308 = func.call @cc_nil_value() : () -> i64
      %309 = func.call @cc_cons(%307, %308) : (i64, i64) -> i64
      %310 = func.call @cc_values_pack(%309) : (i64) -> i64
      %311 = func.call @cc_defclass(%307, %289, %302) : (i64, i64, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%312) : (i64) -> ()
      %313 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      %314 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      %315 = llvm.mlir.addressof @str34 : !llvm.ptr
      %316 = arith.constant 5 : i64
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
      %326 = llvm.mlir.addressof @str35 : !llvm.ptr
      %327 = arith.constant 8 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = llvm.mlir.addressof @str36 : !llvm.ptr
      %330 = arith.constant 7 : i64
      %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
      %332 = func.call @cc_intern(%328, %331) : (i64, i64) -> i64
      %333 = func.call @cc_nil_value() : () -> i64
      %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
      %335 = func.call @cc_values_pack(%334) : (i64) -> i64
      func.call @stack_push_pointer(%332) : (i64) -> ()
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @stack_pop_pointer() : () -> i64
      %338 = func.call @cc_cons(%336, %337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%338) : (i64) -> ()
      %339 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%339) : (i64) -> ()
      %340 = func.call @stack_pop_pointer() : () -> i64
      %341 = func.call @stack_pop_pointer() : () -> i64
      %342 = func.call @cc_cons(%340, %341) : (i64, i64) -> i64
      func.call @stack_push_pointer(%342) : (i64) -> ()
      %343 = llvm.mlir.addressof @str37 : !llvm.ptr
      %344 = arith.constant 8 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = llvm.mlir.addressof @str38 : !llvm.ptr
      %347 = arith.constant 7 : i64
      %348 = func.call @cc_make_string(%346, %347) : (!llvm.ptr, i64) -> i64
      %349 = func.call @cc_intern(%345, %348) : (i64, i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_values_pack(%351) : (i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %353 = func.call @stack_pop_pointer() : () -> i64
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @cc_cons(%353, %354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %356 = llvm.mlir.addressof @str39 : !llvm.ptr
      %357 = arith.constant 5 : i64
      %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
      %359 = func.call @cc_nil_value() : () -> i64
      %360 = func.call @cc_intern(%358, %359) : (i64, i64) -> i64
      %361 = func.call @cc_nil_value() : () -> i64
      %362 = func.call @cc_cons(%360, %361) : (i64, i64) -> i64
      %363 = func.call @cc_values_pack(%362) : (i64) -> i64
      func.call @stack_push_pointer(%360) : (i64) -> ()
      %364 = func.call @stack_pop_pointer() : () -> i64
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%366) : (i64) -> ()
      %367 = func.call @stack_pop_pointer() : () -> i64
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @cc_cons(%367, %368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%369) : (i64) -> ()
      %370 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%370) : (i64) -> ()
      %371 = llvm.mlir.addressof @str40 : !llvm.ptr
      %372 = arith.constant 5 : i64
      %373 = func.call @cc_make_string(%371, %372) : (!llvm.ptr, i64) -> i64
      %374 = func.call @cc_nil_value() : () -> i64
      %375 = func.call @cc_intern(%373, %374) : (i64, i64) -> i64
      %376 = func.call @cc_nil_value() : () -> i64
      %377 = func.call @cc_cons(%375, %376) : (i64, i64) -> i64
      %378 = func.call @cc_values_pack(%377) : (i64) -> i64
      func.call @stack_push_pointer(%375) : (i64) -> ()
      %379 = func.call @stack_pop_pointer() : () -> i64
      %380 = func.call @stack_pop_pointer() : () -> i64
      %381 = func.call @cc_cons(%379, %380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%381) : (i64) -> ()
      %382 = llvm.mlir.addressof @str41 : !llvm.ptr
      %383 = arith.constant 6 : i64
      %384 = func.call @cc_make_string(%382, %383) : (!llvm.ptr, i64) -> i64
      %385 = llvm.mlir.addressof @str42 : !llvm.ptr
      %386 = arith.constant 7 : i64
      %387 = func.call @cc_make_string(%385, %386) : (!llvm.ptr, i64) -> i64
      %388 = func.call @cc_intern(%384, %387) : (i64, i64) -> i64
      %389 = func.call @cc_nil_value() : () -> i64
      %390 = func.call @cc_cons(%388, %389) : (i64, i64) -> i64
      %391 = func.call @cc_values_pack(%390) : (i64) -> i64
      func.call @stack_push_pointer(%388) : (i64) -> ()
      %392 = func.call @stack_pop_pointer() : () -> i64
      %393 = func.call @stack_pop_pointer() : () -> i64
      %394 = func.call @cc_cons(%392, %393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%394) : (i64) -> ()
      %395 = llvm.mlir.addressof @str43 : !llvm.ptr
      %396 = arith.constant 5 : i64
      %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
      %398 = llvm.mlir.addressof @str44 : !llvm.ptr
      %399 = arith.constant 7 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_intern(%397, %400) : (i64, i64) -> i64
      %402 = func.call @cc_nil_value() : () -> i64
      %403 = func.call @cc_cons(%401, %402) : (i64, i64) -> i64
      %404 = func.call @cc_values_pack(%403) : (i64) -> i64
      func.call @stack_push_pointer(%401) : (i64) -> ()
      %405 = func.call @stack_pop_pointer() : () -> i64
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = func.call @cc_cons(%405, %406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%407) : (i64) -> ()
      %408 = llvm.mlir.addressof @str45 : !llvm.ptr
      %409 = arith.constant 7 : i64
      %410 = func.call @cc_make_string(%408, %409) : (!llvm.ptr, i64) -> i64
      %411 = llvm.mlir.addressof @str46 : !llvm.ptr
      %412 = arith.constant 7 : i64
      %413 = func.call @cc_make_string(%411, %412) : (!llvm.ptr, i64) -> i64
      %414 = func.call @cc_intern(%410, %413) : (i64, i64) -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_cons(%414, %415) : (i64, i64) -> i64
      %417 = func.call @cc_values_pack(%416) : (i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = func.call @stack_pop_pointer() : () -> i64
      %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
      func.call @stack_push_pointer(%420) : (i64) -> ()
      %421 = llvm.mlir.addressof @str47 : !llvm.ptr
      %422 = arith.constant 5 : i64
      %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
      %424 = func.call @cc_nil_value() : () -> i64
      %425 = func.call @cc_intern(%423, %424) : (i64, i64) -> i64
      %426 = func.call @cc_nil_value() : () -> i64
      %427 = func.call @cc_cons(%425, %426) : (i64, i64) -> i64
      %428 = func.call @cc_values_pack(%427) : (i64) -> i64
      func.call @stack_push_pointer(%425) : (i64) -> ()
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @stack_pop_pointer() : () -> i64
      %431 = func.call @cc_cons(%429, %430) : (i64, i64) -> i64
      func.call @stack_push_pointer(%431) : (i64) -> ()
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @cc_cons(%432, %433) : (i64, i64) -> i64
      func.call @stack_push_pointer(%434) : (i64) -> ()
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @stack_pop_pointer() : () -> i64
      %437 = func.call @cc_cons(%435, %436) : (i64, i64) -> i64
      func.call @stack_push_pointer(%437) : (i64) -> ()
      %438 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%438) : (i64) -> ()
      %439 = llvm.mlir.addressof @str48 : !llvm.ptr
      %440 = arith.constant 34 : i64
      %441 = func.call @cc_make_string(%439, %440) : (!llvm.ptr, i64) -> i64
      %442 = llvm.mlir.addressof @str49 : !llvm.ptr
      %443 = arith.constant 4 : i64
      %444 = func.call @cc_make_string(%442, %443) : (!llvm.ptr, i64) -> i64
      %445 = func.call @cc_intern(%441, %444) : (i64, i64) -> i64
      %446 = func.call @cc_nil_value() : () -> i64
      %447 = func.call @cc_cons(%445, %446) : (i64, i64) -> i64
      %448 = func.call @cc_values_pack(%447) : (i64) -> i64
      func.call @stack_push_pointer(%445) : (i64) -> ()
      %449 = func.call @stack_pop_pointer() : () -> i64
      %450 = func.call @stack_pop_pointer() : () -> i64
      %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%451) : (i64) -> ()
      %452 = func.call @stack_pop_pointer() : () -> i64
      %453 = func.call @stack_pop_pointer() : () -> i64
      %454 = func.call @cc_cons(%452, %453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%454) : (i64) -> ()
      %455 = llvm.mlir.addressof @str50 : !llvm.ptr
      %456 = arith.constant 22 : i64
      %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
      %458 = func.call @cc_nil_value() : () -> i64
      %459 = func.call @cc_intern(%457, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      %463 = func.call @stack_pop_pointer() : () -> i64
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%463, %464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      %466 = llvm.mlir.addressof @str51 : !llvm.ptr
      %467 = arith.constant 8 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_intern(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_nil_value() : () -> i64
      %472 = func.call @cc_cons(%470, %471) : (i64, i64) -> i64
      %473 = func.call @cc_values_pack(%472) : (i64) -> i64
      func.call @stack_push_pointer(%470) : (i64) -> ()
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @cc_cons(%474, %475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%476) : (i64) -> ()
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_nil_value() : () -> i64
      %479 = func.call @cc_cons(%477, %478) : (i64, i64) -> i64
      %480 = func.call @cc_eval(%479) : (i64) -> i64
      %481 = func.call @cc_multiple_value_list(%480) : (i64) -> i64
      %482 = func.call @cc_values_pack(%481) : (i64) -> i64
      func.call @stack_push_pointer(%482) : (i64) -> ()
      %483 = func.call @stack_depth() : () -> i64
      %484 = arith.constant 0 : i64
      %485 = arith.cmpi sgt, %483, %484 : i64
      scf.if %485 {
        %486 = func.call @stack_pop_pointer() : () -> i64
      }
      %525 = llvm.mlir.addressof @str56 : !llvm.ptr
      %526 = arith.constant 5 : i64
      %527 = func.call @cc_make_string(%525, %526) : (!llvm.ptr, i64) -> i64
      %528 = func.call @cc_nil_value() : () -> i64
      %529 = func.call @cc_intern(%527, %528) : (i64, i64) -> i64
      %530 = func.call @cc_nil_value() : () -> i64
      %531 = func.call @cc_cons(%529, %530) : (i64, i64) -> i64
      %532 = func.call @cc_values_pack(%531) : (i64) -> i64
      func.call @stack_push_pointer(%529) : (i64) -> ()
      %533 = func.call @stack_depth() : () -> i64
      %534 = arith.constant 0 : i64
      %535 = arith.cmpi sgt, %533, %534 : i64
      scf.if %535 {
        %536 = func.call @stack_pop_pointer() : () -> i64
      }
      %575 = llvm.mlir.addressof @str61 : !llvm.ptr
      %576 = arith.constant 5 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = func.call @cc_nil_value() : () -> i64
      %579 = func.call @cc_intern(%577, %578) : (i64, i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_cons(%579, %580) : (i64, i64) -> i64
      %582 = func.call @cc_values_pack(%581) : (i64) -> i64
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %583 = func.call @stack_depth() : () -> i64
      %584 = arith.constant 0 : i64
      %585 = arith.cmpi sgt, %583, %584 : i64
      scf.if %585 {
        %586 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%307) : (i64) -> ()
      %587 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %587 : i64
    }
    %588 = func.call @cc_nil_value() : () -> i64
    %589 = func.call @cc_errorp(%268) : (i64) -> i64
    %590 = arith.cmpi ne, %589, %588 : i64
    %591 = scf.if %590 -> (i64) {
      scf.yield %268 : i64
    } else {
      %793 = llvm.mlir.addressof @method_name_217142993616897 : !llvm.ptr
      %794 = func.call @cc_make_lambda_ref_str(%793) : (!llvm.ptr) -> i64
      %795 = llvm.mlir.addressof @str76 : !llvm.ptr
      %796 = arith.constant 16 : i64
      %797 = func.call @cc_make_string(%795, %796) : (!llvm.ptr, i64) -> i64
      %798 = llvm.mlir.addressof @str77 : !llvm.ptr
      %799 = arith.constant 4 : i64
      %800 = func.call @cc_make_string(%798, %799) : (!llvm.ptr, i64) -> i64
      %801 = func.call @cc_intern(%797, %800) : (i64, i64) -> i64
      %802 = func.call @cc_nil_value() : () -> i64
      %803 = func.call @cc_cons(%801, %802) : (i64, i64) -> i64
      %804 = func.call @cc_values_pack(%803) : (i64) -> i64
      %805 = func.call @cc_nil() : () -> i64
      %806 = llvm.mlir.addressof @str78 : !llvm.ptr
      %807 = arith.constant 22 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = func.call @cc_nil_value() : () -> i64
      %810 = func.call @cc_intern(%808, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      %814 = func.call @cc_cons(%810, %805) : (i64, i64) -> i64
      %815 = arith.constant 1 : i64
      %816 = func.call @cc_box_fixnum(%815) : (i64) -> i64
      %817 = arith.constant 0 : i64
      %818 = func.call @cc_box_fixnum(%817) : (i64) -> i64
      %819 = func.call @cc_defmethod_qualified(%801, %814, %794, %816, %818) : (i64, i64, i64, i64, i64) -> i64
      %820 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      %821 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%821) : (i64) -> ()
      %822 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%822) : (i64) -> ()
      %823 = llvm.mlir.addressof @str79 : !llvm.ptr
      %824 = arith.constant 3 : i64
      %825 = func.call @cc_make_string(%823, %824) : (!llvm.ptr, i64) -> i64
      %826 = llvm.mlir.addressof @str80 : !llvm.ptr
      %827 = arith.constant 7 : i64
      %828 = func.call @cc_make_string(%826, %827) : (!llvm.ptr, i64) -> i64
      %829 = func.call @cc_intern(%825, %828) : (i64, i64) -> i64
      %830 = func.call @cc_nil_value() : () -> i64
      %831 = func.call @cc_cons(%829, %830) : (i64, i64) -> i64
      %832 = func.call @cc_values_pack(%831) : (i64) -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %833 = func.call @stack_pop_pointer() : () -> i64
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @cc_cons(%833, %834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%835) : (i64) -> ()
      %836 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%836) : (i64) -> ()
      %837 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%837) : (i64) -> ()
      %838 = llvm.mlir.addressof @str81 : !llvm.ptr
      %839 = arith.constant 5 : i64
      %840 = func.call @cc_make_string(%838, %839) : (!llvm.ptr, i64) -> i64
      %841 = func.call @cc_nil_value() : () -> i64
      %842 = func.call @cc_intern(%840, %841) : (i64, i64) -> i64
      %843 = func.call @cc_nil_value() : () -> i64
      %844 = func.call @cc_cons(%842, %843) : (i64, i64) -> i64
      %845 = func.call @cc_values_pack(%844) : (i64) -> i64
      func.call @stack_push_pointer(%842) : (i64) -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = func.call @cc_cons(%846, %847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%848) : (i64) -> ()
      %849 = llvm.mlir.addressof @str82 : !llvm.ptr
      %850 = arith.constant 4 : i64
      %851 = func.call @cc_make_string(%849, %850) : (!llvm.ptr, i64) -> i64
      %852 = llvm.mlir.addressof @str83 : !llvm.ptr
      %853 = arith.constant 11 : i64
      %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
      %855 = func.call @cc_intern(%851, %854) : (i64, i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = func.call @cc_cons(%855, %856) : (i64, i64) -> i64
      %858 = func.call @cc_values_pack(%857) : (i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @stack_pop_pointer() : () -> i64
      %861 = func.call @cc_cons(%859, %860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%861) : (i64) -> ()
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @cc_cons(%862, %863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%864) : (i64) -> ()
      %865 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%865) : (i64) -> ()
      %866 = llvm.mlir.addressof @str84 : !llvm.ptr
      %867 = arith.constant 5 : i64
      %868 = func.call @cc_make_string(%866, %867) : (!llvm.ptr, i64) -> i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_intern(%868, %869) : (i64, i64) -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_cons(%870, %871) : (i64, i64) -> i64
      %873 = func.call @cc_values_pack(%872) : (i64) -> i64
      func.call @stack_push_pointer(%870) : (i64) -> ()
      %874 = func.call @stack_pop_pointer() : () -> i64
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @cc_cons(%874, %875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%876) : (i64) -> ()
      %877 = llvm.mlir.addressof @str85 : !llvm.ptr
      %878 = arith.constant 5 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      %880 = func.call @cc_nil_value() : () -> i64
      %881 = func.call @cc_intern(%879, %880) : (i64, i64) -> i64
      %882 = func.call @cc_nil_value() : () -> i64
      %883 = func.call @cc_cons(%881, %882) : (i64, i64) -> i64
      %884 = func.call @cc_values_pack(%883) : (i64) -> i64
      func.call @stack_push_pointer(%881) : (i64) -> ()
      %885 = func.call @stack_pop_pointer() : () -> i64
      %886 = func.call @stack_pop_pointer() : () -> i64
      %887 = func.call @cc_cons(%885, %886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%887) : (i64) -> ()
      %888 = llvm.mlir.addressof @str86 : !llvm.ptr
      %889 = arith.constant 4 : i64
      %890 = func.call @cc_make_string(%888, %889) : (!llvm.ptr, i64) -> i64
      %891 = llvm.mlir.addressof @str87 : !llvm.ptr
      %892 = arith.constant 11 : i64
      %893 = func.call @cc_make_string(%891, %892) : (!llvm.ptr, i64) -> i64
      %894 = func.call @cc_intern(%890, %893) : (i64, i64) -> i64
      %895 = func.call @cc_nil_value() : () -> i64
      %896 = func.call @cc_cons(%894, %895) : (i64, i64) -> i64
      %897 = func.call @cc_values_pack(%896) : (i64) -> i64
      func.call @stack_push_pointer(%894) : (i64) -> ()
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = func.call @stack_pop_pointer() : () -> i64
      %903 = func.call @cc_cons(%901, %902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%903) : (i64) -> ()
      %904 = llvm.mlir.addressof @str88 : !llvm.ptr
      %905 = arith.constant 5 : i64
      %906 = func.call @cc_make_string(%904, %905) : (!llvm.ptr, i64) -> i64
      %907 = llvm.mlir.addressof @str89 : !llvm.ptr
      %908 = arith.constant 11 : i64
      %909 = func.call @cc_make_string(%907, %908) : (!llvm.ptr, i64) -> i64
      %910 = func.call @cc_intern(%906, %909) : (i64, i64) -> i64
      %911 = func.call @cc_nil_value() : () -> i64
      %912 = func.call @cc_cons(%910, %911) : (i64, i64) -> i64
      %913 = func.call @cc_values_pack(%912) : (i64) -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %914 = func.call @stack_pop_pointer() : () -> i64
      %915 = func.call @stack_pop_pointer() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%916) : (i64) -> ()
      %917 = func.call @stack_pop_pointer() : () -> i64
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = func.call @cc_cons(%917, %918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%919) : (i64) -> ()
      %920 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%920) : (i64) -> ()
      %921 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%921) : (i64) -> ()
      %922 = llvm.mlir.addressof @str90 : !llvm.ptr
      %923 = arith.constant 5 : i64
      %924 = func.call @cc_make_string(%922, %923) : (!llvm.ptr, i64) -> i64
      %925 = func.call @cc_nil_value() : () -> i64
      %926 = func.call @cc_intern(%924, %925) : (i64, i64) -> i64
      %927 = func.call @cc_nil_value() : () -> i64
      %928 = func.call @cc_cons(%926, %927) : (i64, i64) -> i64
      %929 = func.call @cc_values_pack(%928) : (i64) -> i64
      func.call @stack_push_pointer(%926) : (i64) -> ()
      %930 = func.call @stack_pop_pointer() : () -> i64
      %931 = func.call @stack_pop_pointer() : () -> i64
      %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%932) : (i64) -> ()
      %933 = llvm.mlir.addressof @str91 : !llvm.ptr
      %934 = arith.constant 6 : i64
      %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
      %936 = llvm.mlir.addressof @str92 : !llvm.ptr
      %937 = arith.constant 11 : i64
      %938 = func.call @cc_make_string(%936, %937) : (!llvm.ptr, i64) -> i64
      %939 = func.call @cc_intern(%935, %938) : (i64, i64) -> i64
      %940 = func.call @cc_nil_value() : () -> i64
      %941 = func.call @cc_cons(%939, %940) : (i64, i64) -> i64
      %942 = func.call @cc_values_pack(%941) : (i64) -> i64
      func.call @stack_push_pointer(%939) : (i64) -> ()
      %943 = func.call @stack_pop_pointer() : () -> i64
      %944 = func.call @stack_pop_pointer() : () -> i64
      %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%945) : (i64) -> ()
      %946 = func.call @stack_pop_pointer() : () -> i64
      %947 = func.call @stack_pop_pointer() : () -> i64
      %948 = func.call @cc_cons(%946, %947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%948) : (i64) -> ()
      %949 = llvm.mlir.addressof @str93 : !llvm.ptr
      %950 = arith.constant 5 : i64
      %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
      %952 = func.call @cc_nil_value() : () -> i64
      %953 = func.call @cc_intern(%951, %952) : (i64, i64) -> i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_cons(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_values_pack(%955) : (i64) -> i64
      func.call @stack_push_pointer(%953) : (i64) -> ()
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @stack_pop_pointer() : () -> i64
      %959 = func.call @cc_cons(%957, %958) : (i64, i64) -> i64
      func.call @stack_push_pointer(%959) : (i64) -> ()
      %960 = llvm.mlir.addressof @str94 : !llvm.ptr
      %961 = arith.constant 1 : i64
      %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
      %963 = llvm.mlir.addressof @str95 : !llvm.ptr
      %964 = arith.constant 11 : i64
      %965 = func.call @cc_make_string(%963, %964) : (!llvm.ptr, i64) -> i64
      %966 = func.call @cc_intern(%962, %965) : (i64, i64) -> i64
      %967 = func.call @cc_nil_value() : () -> i64
      %968 = func.call @cc_cons(%966, %967) : (i64, i64) -> i64
      %969 = func.call @cc_values_pack(%968) : (i64) -> i64
      func.call @stack_push_pointer(%966) : (i64) -> ()
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = func.call @stack_pop_pointer() : () -> i64
      %972 = func.call @cc_cons(%970, %971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @stack_pop_pointer() : () -> i64
      %975 = func.call @cc_cons(%973, %974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      %976 = llvm.mlir.addressof @str96 : !llvm.ptr
      %977 = arith.constant 2 : i64
      %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
      %979 = func.call @cc_nil_value() : () -> i64
      %980 = func.call @cc_intern(%978, %979) : (i64, i64) -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_cons(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_values_pack(%982) : (i64) -> i64
      func.call @stack_push_pointer(%980) : (i64) -> ()
      %984 = func.call @stack_pop_pointer() : () -> i64
      %985 = func.call @stack_pop_pointer() : () -> i64
      %986 = func.call @cc_cons(%984, %985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      %987 = func.call @stack_pop_pointer() : () -> i64
      %988 = func.call @stack_pop_pointer() : () -> i64
      %989 = func.call @cc_cons(%987, %988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%989) : (i64) -> ()
      %990 = llvm.mlir.addressof @str97 : !llvm.ptr
      %991 = arith.constant 6 : i64
      %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
      %993 = llvm.mlir.addressof @str98 : !llvm.ptr
      %994 = arith.constant 11 : i64
      %995 = func.call @cc_make_string(%993, %994) : (!llvm.ptr, i64) -> i64
      %996 = func.call @cc_intern(%992, %995) : (i64, i64) -> i64
      %997 = func.call @cc_nil_value() : () -> i64
      %998 = func.call @cc_cons(%996, %997) : (i64, i64) -> i64
      %999 = func.call @cc_values_pack(%998) : (i64) -> i64
      func.call @stack_push_pointer(%996) : (i64) -> ()
      %1000 = func.call @stack_pop_pointer() : () -> i64
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @cc_cons(%1000, %1001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      %1003 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      %1004 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1004) : (i64) -> ()
      %1005 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1006 = arith.constant 5 : i64
      %1007 = func.call @cc_make_string(%1005, %1006) : (!llvm.ptr, i64) -> i64
      %1008 = func.call @cc_nil_value() : () -> i64
      %1009 = func.call @cc_intern(%1007, %1008) : (i64, i64) -> i64
      %1010 = func.call @cc_nil_value() : () -> i64
      %1011 = func.call @cc_cons(%1009, %1010) : (i64, i64) -> i64
      %1012 = func.call @cc_values_pack(%1011) : (i64) -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      %1013 = func.call @stack_pop_pointer() : () -> i64
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @cc_cons(%1013, %1014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1016 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1017 = arith.constant 5 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = func.call @cc_nil_value() : () -> i64
      %1020 = func.call @cc_intern(%1018, %1019) : (i64, i64) -> i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_cons(%1020, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_values_pack(%1022) : (i64) -> i64
      func.call @stack_push_pointer(%1020) : (i64) -> ()
      %1024 = func.call @stack_pop_pointer() : () -> i64
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = func.call @cc_cons(%1024, %1025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1026) : (i64) -> ()
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @stack_pop_pointer() : () -> i64
      %1029 = func.call @cc_cons(%1027, %1028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1029) : (i64) -> ()
      %1030 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1030) : (i64) -> ()
      %1031 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1032 = arith.constant 5 : i64
      %1033 = func.call @cc_make_string(%1031, %1032) : (!llvm.ptr, i64) -> i64
      %1034 = func.call @cc_nil_value() : () -> i64
      %1035 = func.call @cc_intern(%1033, %1034) : (i64, i64) -> i64
      %1036 = func.call @cc_nil_value() : () -> i64
      %1037 = func.call @cc_cons(%1035, %1036) : (i64, i64) -> i64
      %1038 = func.call @cc_values_pack(%1037) : (i64) -> i64
      func.call @stack_push_pointer(%1035) : (i64) -> ()
      %1039 = func.call @stack_pop_pointer() : () -> i64
      %1040 = func.call @stack_pop_pointer() : () -> i64
      %1041 = func.call @cc_cons(%1039, %1040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1041) : (i64) -> ()
      %1042 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1043 = arith.constant 5 : i64
      %1044 = func.call @cc_make_string(%1042, %1043) : (!llvm.ptr, i64) -> i64
      %1045 = func.call @cc_nil_value() : () -> i64
      %1046 = func.call @cc_intern(%1044, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      %1050 = func.call @stack_pop_pointer() : () -> i64
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @cc_cons(%1050, %1051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1052) : (i64) -> ()
      %1053 = func.call @stack_pop_pointer() : () -> i64
      %1054 = func.call @stack_pop_pointer() : () -> i64
      %1055 = func.call @cc_cons(%1053, %1054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      %1056 = func.call @stack_pop_pointer() : () -> i64
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @cc_cons(%1056, %1057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1058) : (i64) -> ()
      %1059 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1060 = arith.constant 14 : i64
      %1061 = func.call @cc_make_string(%1059, %1060) : (!llvm.ptr, i64) -> i64
      %1062 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1063 = arith.constant 11 : i64
      %1064 = func.call @cc_make_string(%1062, %1063) : (!llvm.ptr, i64) -> i64
      %1065 = func.call @cc_intern(%1061, %1064) : (i64, i64) -> i64
      %1066 = func.call @cc_nil_value() : () -> i64
      %1067 = func.call @cc_cons(%1065, %1066) : (i64, i64) -> i64
      %1068 = func.call @cc_values_pack(%1067) : (i64) -> i64
      func.call @stack_push_pointer(%1065) : (i64) -> ()
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @cc_cons(%1069, %1070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1071) : (i64) -> ()
      %1072 = func.call @stack_pop_pointer() : () -> i64
      %1073 = func.call @stack_pop_pointer() : () -> i64
      %1074 = func.call @cc_cons(%1072, %1073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1074) : (i64) -> ()
      %1075 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1075) : (i64) -> ()
      %1076 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1076) : (i64) -> ()
      %1077 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1078 = arith.constant 22 : i64
      %1079 = func.call @cc_make_string(%1077, %1078) : (!llvm.ptr, i64) -> i64
      %1080 = func.call @cc_nil_value() : () -> i64
      %1081 = func.call @cc_intern(%1079, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_nil_value() : () -> i64
      %1083 = func.call @cc_cons(%1081, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_values_pack(%1083) : (i64) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = func.call @cc_cons(%1085, %1086) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      %1088 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1089 = arith.constant 6 : i64
      %1090 = func.call @cc_make_string(%1088, %1089) : (!llvm.ptr, i64) -> i64
      %1091 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1092 = arith.constant 11 : i64
      %1093 = func.call @cc_make_string(%1091, %1092) : (!llvm.ptr, i64) -> i64
      %1094 = func.call @cc_intern(%1090, %1093) : (i64, i64) -> i64
      %1095 = func.call @cc_nil_value() : () -> i64
      %1096 = func.call @cc_cons(%1094, %1095) : (i64, i64) -> i64
      %1097 = func.call @cc_values_pack(%1096) : (i64) -> i64
      func.call @stack_push_pointer(%1094) : (i64) -> ()
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = func.call @stack_pop_pointer() : () -> i64
      %1100 = func.call @cc_cons(%1098, %1099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1100) : (i64) -> ()
      %1101 = func.call @stack_pop_pointer() : () -> i64
      %1102 = func.call @stack_pop_pointer() : () -> i64
      %1103 = func.call @cc_cons(%1101, %1102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1103) : (i64) -> ()
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = func.call @stack_pop_pointer() : () -> i64
      %1106 = func.call @cc_cons(%1104, %1105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1106) : (i64) -> ()
      %1107 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1108 = arith.constant 16 : i64
      %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
      %1110 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1111 = arith.constant 4 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = func.call @cc_intern(%1109, %1112) : (i64, i64) -> i64
      %1114 = func.call @cc_nil_value() : () -> i64
      %1115 = func.call @cc_cons(%1113, %1114) : (i64, i64) -> i64
      %1116 = func.call @cc_values_pack(%1115) : (i64) -> i64
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      %1117 = func.call @stack_pop_pointer() : () -> i64
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_cons(%1117, %1118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1119) : (i64) -> ()
      %1120 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1121 = arith.constant 9 : i64
      %1122 = func.call @cc_make_string(%1120, %1121) : (!llvm.ptr, i64) -> i64
      %1123 = func.call @cc_nil_value() : () -> i64
      %1124 = func.call @cc_intern(%1122, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_cons(%1124, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_values_pack(%1126) : (i64) -> i64
      func.call @stack_push_pointer(%1124) : (i64) -> ()
      %1128 = func.call @stack_pop_pointer() : () -> i64
      %1129 = func.call @stack_pop_pointer() : () -> i64
      %1130 = func.call @cc_cons(%1128, %1129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1130) : (i64) -> ()
      %1131 = func.call @stack_pop_pointer() : () -> i64
      %1132 = func.call @cc_nil_value() : () -> i64
      %1133 = func.call @cc_cons(%1131, %1132) : (i64, i64) -> i64
      %1134 = func.call @cc_eval(%1133) : (i64) -> i64
      %1135 = func.call @cc_multiple_value_list(%1134) : (i64) -> i64
      %1136 = func.call @cc_values_pack(%1135) : (i64) -> i64
      func.call @stack_push_pointer(%1136) : (i64) -> ()
      %1137 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1137 : i64
    }
    %1138 = func.call @cc_nil_value() : () -> i64
    %1139 = func.call @cc_errorp(%591) : (i64) -> i64
    %1140 = arith.cmpi ne, %1139, %1138 : i64
    %1141 = scf.if %1140 -> (i64) {
      scf.yield %591 : i64
    } else {
      %1142 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1143 = func.call @cc_make_function_ref_const(%1142) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1143) : (i64) -> ()
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1146 = arith.constant 14 : i64
      %1147 = func.call @cc_make_string(%1145, %1146) : (!llvm.ptr, i64) -> i64
      %1148 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1149 = arith.constant 15 : i64
      %1150 = func.call @cc_make_string(%1148, %1149) : (!llvm.ptr, i64) -> i64
      %1151 = func.call @cc_intern(%1147, %1150) : (i64, i64) -> i64
      %1152 = func.call @cc_nil_value() : () -> i64
      %1153 = func.call @cc_cons(%1151, %1152) : (i64, i64) -> i64
      %1154 = func.call @cc_values_pack(%1153) : (i64) -> i64
      %1155 = func.call @cc_set_symbol_value(%1151, %1144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1144) : (i64) -> ()
      %1156 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1156 : i64
    }
    %1157 = func.call @cc_nil_value() : () -> i64
    %1158 = func.call @cc_errorp(%1141) : (i64) -> i64
    %1159 = arith.cmpi ne, %1158, %1157 : i64
    %1160 = scf.if %1159 -> (i64) {
      scf.yield %1141 : i64
    } else {
      %1161 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1162 = func.call @cc_make_function_ref_const(%1161) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1165 = arith.constant 14 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1168 = arith.constant 15 : i64
      %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
      %1170 = func.call @cc_intern(%1166, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_cons(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_values_pack(%1172) : (i64) -> i64
      %1174 = func.call @cc_set_symbol_value(%1170, %1163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1163) : (i64) -> ()
      %1175 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1175 : i64
    }
    %1176 = func.call @cc_nil_value() : () -> i64
    %1177 = func.call @cc_errorp(%1160) : (i64) -> i64
    %1178 = arith.cmpi ne, %1177, %1176 : i64
    %1179 = scf.if %1178 -> (i64) {
      scf.yield %1160 : i64
    } else {
      %1180 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1181 = func.call @cc_make_function_ref_const(%1180) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1181) : (i64) -> ()
      %1182 = func.call @stack_pop_pointer() : () -> i64
      %1183 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1184 = arith.constant 14 : i64
      %1185 = func.call @cc_make_string(%1183, %1184) : (!llvm.ptr, i64) -> i64
      %1186 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1187 = arith.constant 15 : i64
      %1188 = func.call @cc_make_string(%1186, %1187) : (!llvm.ptr, i64) -> i64
      %1189 = func.call @cc_intern(%1185, %1188) : (i64, i64) -> i64
      %1190 = func.call @cc_nil_value() : () -> i64
      %1191 = func.call @cc_cons(%1189, %1190) : (i64, i64) -> i64
      %1192 = func.call @cc_values_pack(%1191) : (i64) -> i64
      %1193 = func.call @cc_set_symbol_value(%1189, %1182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1182) : (i64) -> ()
      %1194 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1194 : i64
    }
    %1195 = func.call @cc_nil_value() : () -> i64
    %1196 = func.call @cc_errorp(%1179) : (i64) -> i64
    %1197 = arith.cmpi ne, %1196, %1195 : i64
    %1198 = scf.if %1197 -> (i64) {
      scf.yield %1179 : i64
    } else {
      %1199 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1200 = func.call @cc_make_function_ref_const(%1199) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1200) : (i64) -> ()
      %1201 = func.call @stack_pop_pointer() : () -> i64
      %1202 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1203 = arith.constant 14 : i64
      %1204 = func.call @cc_make_string(%1202, %1203) : (!llvm.ptr, i64) -> i64
      %1205 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1206 = arith.constant 15 : i64
      %1207 = func.call @cc_make_string(%1205, %1206) : (!llvm.ptr, i64) -> i64
      %1208 = func.call @cc_intern(%1204, %1207) : (i64, i64) -> i64
      %1209 = func.call @cc_nil_value() : () -> i64
      %1210 = func.call @cc_cons(%1208, %1209) : (i64, i64) -> i64
      %1211 = func.call @cc_values_pack(%1210) : (i64) -> i64
      %1212 = func.call @cc_set_symbol_value(%1208, %1201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1201) : (i64) -> ()
      %1213 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1213 : i64
    }
    %1214 = func.call @cc_nil_value() : () -> i64
    %1215 = func.call @cc_errorp(%1198) : (i64) -> i64
    %1216 = arith.cmpi ne, %1215, %1214 : i64
    %1217 = scf.if %1216 -> (i64) {
      scf.yield %1198 : i64
    } else {
      %1218 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1219 = arith.constant 0 : i64
      %1220 = func.call @cc_make_string(%1218, %1219) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1220) : (i64) -> ()
      %1221 = func.call @stack_pop_pointer() : () -> i64
      %1222 = func.call @cc_nil_value() : () -> i64
      %1223 = func.call @cc_errorp(%1221) : (i64) -> i64
      %1224 = arith.cmpi ne, %1223, %1222 : i64
      %1225 = arith.cmpi eq, %1222, %1222 : i64
      %1226 = arith.andi %1224, %1225 : i1
      %1227 = scf.if %1226 -> (i64) {
        scf.yield %1221 : i64
      } else {
        scf.yield %1222 : i64
      }
      %1228 = arith.cmpi ne, %1227, %1222 : i64
      scf.if %1228 {
        func.call @stack_push_pointer(%1227) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1221) : (i64) -> ()
        %1229 = llvm.mlir.addressof @str124 : !llvm.ptr
        %1230 = func.call @cc_make_function_ref_const(%1229) : (!llvm.ptr) -> i64
        %1231 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1230, %1231) : (i64, i64) -> ()
      }
      %1232 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1232 : i64
    }
    %1233 = func.call @cc_nil_value() : () -> i64
    %1234 = func.call @cc_errorp(%1217) : (i64) -> i64
    %1235 = arith.cmpi ne, %1234, %1233 : i64
    %1236 = scf.if %1235 -> (i64) {
      scf.yield %1217 : i64
    } else {
      %1237 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1238 = arith.constant 1 : i64
      %1239 = func.call @cc_make_string(%1237, %1238) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1239) : (i64) -> ()
      %1240 = func.call @stack_pop_pointer() : () -> i64
      %1241 = func.call @cc_nil_value() : () -> i64
      %1242 = func.call @cc_errorp(%1240) : (i64) -> i64
      %1243 = arith.cmpi ne, %1242, %1241 : i64
      %1244 = arith.cmpi eq, %1241, %1241 : i64
      %1245 = arith.andi %1243, %1244 : i1
      %1246 = scf.if %1245 -> (i64) {
        scf.yield %1240 : i64
      } else {
        scf.yield %1241 : i64
      }
      %1247 = arith.cmpi ne, %1246, %1241 : i64
      scf.if %1247 {
        func.call @stack_push_pointer(%1246) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1240) : (i64) -> ()
        %1248 = llvm.mlir.addressof @str126 : !llvm.ptr
        %1249 = func.call @cc_make_function_ref_const(%1248) : (!llvm.ptr) -> i64
        %1250 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1249, %1250) : (i64, i64) -> ()
      }
      %1251 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1251 : i64
    }
    %1252 = func.call @cc_nil_value() : () -> i64
    %1253 = func.call @cc_errorp(%1236) : (i64) -> i64
    %1254 = arith.cmpi ne, %1253, %1252 : i64
    %1255 = scf.if %1254 -> (i64) {
      scf.yield %1236 : i64
    } else {
      %1256 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1257 = arith.constant 2 : i64
      %1258 = func.call @cc_make_string(%1256, %1257) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = func.call @cc_nil_value() : () -> i64
      %1261 = func.call @cc_errorp(%1259) : (i64) -> i64
      %1262 = arith.cmpi ne, %1261, %1260 : i64
      %1263 = arith.cmpi eq, %1260, %1260 : i64
      %1264 = arith.andi %1262, %1263 : i1
      %1265 = scf.if %1264 -> (i64) {
        scf.yield %1259 : i64
      } else {
        scf.yield %1260 : i64
      }
      %1266 = arith.cmpi ne, %1265, %1260 : i64
      scf.if %1266 {
        func.call @stack_push_pointer(%1265) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1259) : (i64) -> ()
        %1267 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1268 = func.call @cc_make_function_ref_const(%1267) : (!llvm.ptr) -> i64
        %1269 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1268, %1269) : (i64, i64) -> ()
      }
      %1270 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1270 : i64
    }
    %1271 = func.call @cc_nil_value() : () -> i64
    %1272 = func.call @cc_errorp(%1255) : (i64) -> i64
    %1273 = arith.cmpi ne, %1272, %1271 : i64
    %1274 = scf.if %1273 -> (i64) {
      scf.yield %1255 : i64
    } else {
      %1275 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1276 = arith.constant 15 : i64
      %1277 = func.call @cc_make_string(%1275, %1276) : (!llvm.ptr, i64) -> i64
      %1278 = func.call @cc_nil_value() : () -> i64
      %1279 = func.call @cc_intern(%1277, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_nil_value() : () -> i64
      %1281 = func.call @cc_cons(%1279, %1280) : (i64, i64) -> i64
      %1282 = func.call @cc_values_pack(%1281) : (i64) -> i64
      %1283 = func.call @cc_symbol_value(%1279) : (i64) -> i64
      func.call @stack_push_pointer(%1283) : (i64) -> ()
      %1284 = func.call @stack_pop_pointer() : () -> i64
      %1285 = func.call @cc_nil_value() : () -> i64
      %1286 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1287 = arith.constant 22 : i64
      %1288 = func.call @cc_make_string(%1286, %1287) : (!llvm.ptr, i64) -> i64
      %1289 = func.call @cc_nil_value() : () -> i64
      %1290 = func.call @cc_intern(%1288, %1289) : (i64, i64) -> i64
      %1291 = func.call @cc_nil_value() : () -> i64
      %1292 = func.call @cc_cons(%1290, %1291) : (i64, i64) -> i64
      %1293 = func.call @cc_values_pack(%1292) : (i64) -> i64
      func.call @stack_push_pointer(%1290) : (i64) -> ()
      %1294 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1295 = arith.constant 2 : i64
      %1296 = func.call @cc_make_string(%1294, %1295) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1296) : (i64) -> ()
      %1297 = func.call @stack_pop_pointer() : () -> i64
      %1298 = func.call @cc_cons(%1297, %1285) : (i64, i64) -> i64
      %1299 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1300 = arith.constant 5 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1303 = arith.constant 7 : i64
      %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
      %1305 = func.call @cc_intern(%1301, %1304) : (i64, i64) -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_cons(%1305, %1306) : (i64, i64) -> i64
      %1308 = func.call @cc_values_pack(%1307) : (i64) -> i64
      func.call @stack_push_pointer(%1305) : (i64) -> ()
      %1309 = func.call @stack_pop_pointer() : () -> i64
      %1310 = func.call @cc_cons(%1309, %1298) : (i64, i64) -> i64
      %1311 = func.call @stack_pop_pointer() : () -> i64
      %1312 = func.call @cc_make_instance(%1311, %1310) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1312) : (i64) -> ()
      %1313 = func.call @stack_pop_pointer() : () -> i64
      %1314 = func.call @cc_nil_value() : () -> i64
      %1315 = func.call @cc_errorp(%1313) : (i64) -> i64
      %1316 = arith.cmpi ne, %1315, %1314 : i64
      %1317 = arith.cmpi eq, %1314, %1314 : i64
      %1318 = arith.andi %1316, %1317 : i1
      %1319 = scf.if %1318 -> (i64) {
        scf.yield %1313 : i64
      } else {
        scf.yield %1314 : i64
      }
      %1320 = arith.cmpi ne, %1319, %1314 : i64
      scf.if %1320 {
        func.call @stack_push_pointer(%1319) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1313) : (i64) -> ()
        %1321 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1322 = func.call @cc_make_function_ref_const(%1321) : (!llvm.ptr) -> i64
        %1323 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1322, %1323) : (i64, i64) -> ()
      }
      %1324 = func.call @stack_pop_pointer() : () -> i64
      %1325 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1326 = arith.constant 1 : i64
      %1327 = func.call @cc_make_string(%1325, %1326) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1327) : (i64) -> ()
      %1328 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1329 = arith.constant 4 : i64
      %1330 = func.call @cc_collect_args(%1329) : (i64) -> i64
      %1331 = func.call @cc_funcall(%1328, %1330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1331) : (i64) -> ()
      %1332 = func.call @stack_pop_pointer() : () -> i64
      %1333 = func.call @cc_nil_value() : () -> i64
      %1334 = func.call @cc_errorp(%1284) : (i64) -> i64
      %1335 = arith.cmpi ne, %1334, %1333 : i64
      %1336 = arith.cmpi eq, %1333, %1333 : i64
      %1337 = arith.andi %1335, %1336 : i1
      %1338 = scf.if %1337 -> (i64) {
        scf.yield %1284 : i64
      } else {
        scf.yield %1333 : i64
      }
      %1339 = func.call @cc_errorp(%1324) : (i64) -> i64
      %1340 = arith.cmpi ne, %1339, %1333 : i64
      %1341 = arith.cmpi eq, %1338, %1333 : i64
      %1342 = arith.andi %1340, %1341 : i1
      %1343 = scf.if %1342 -> (i64) {
        scf.yield %1324 : i64
      } else {
        scf.yield %1338 : i64
      }
      %1344 = func.call @cc_errorp(%1332) : (i64) -> i64
      %1345 = arith.cmpi ne, %1344, %1333 : i64
      %1346 = arith.cmpi eq, %1343, %1333 : i64
      %1347 = arith.andi %1345, %1346 : i1
      %1348 = scf.if %1347 -> (i64) {
        scf.yield %1332 : i64
      } else {
        scf.yield %1343 : i64
      }
      %1349 = arith.cmpi ne, %1348, %1333 : i64
      scf.if %1349 {
        func.call @stack_push_pointer(%1348) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1284) : (i64) -> ()
        func.call @stack_push_pointer(%1324) : (i64) -> ()
        func.call @stack_push_pointer(%1332) : (i64) -> ()
        %1350 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1351 = func.call @cc_make_function_ref_const(%1350) : (!llvm.ptr) -> i64
        %1352 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1351, %1352) : (i64, i64) -> ()
      }
      %1353 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1353 : i64
    }
    func.call @stack_push_pointer(%1274) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%value"() {
    %487 = func.call @stack_pop_pointer() : () -> i64
    %488 = llvm.mlir.addressof @str52 : !llvm.ptr
    %489 = arith.constant 5 : i64
    %490 = func.call @cc_make_string(%488, %489) : (!llvm.ptr, i64) -> i64
    %491 = func.call @cc_nil_value() : () -> i64
    %492 = func.call @cc_intern(%490, %491) : (i64, i64) -> i64
    %493 = func.call @cc_nil_value() : () -> i64
    %494 = func.call @cc_cons(%492, %493) : (i64, i64) -> i64
    %495 = func.call @cc_values_pack(%494) : (i64) -> i64
    %496 = llvm.mlir.addressof @str53 : !llvm.ptr
    %497 = arith.constant 6 : i64
    %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
    %499 = func.call @cc_register_function_lambda_list_metadata_raw(%492, %498) : (i64, i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%492) : (i64) -> ()
    func.call @stack_push_pointer(%487) : (i64) -> ()
    %500 = func.call @stack_pop_pointer() : () -> i64
    %501 = llvm.mlir.addressof @str54 : !llvm.ptr
    %502 = arith.constant 5 : i64
    %503 = func.call @cc_make_string(%501, %502) : (!llvm.ptr, i64) -> i64
    %504 = func.call @cc_nil_value() : () -> i64
    %505 = func.call @cc_intern(%503, %504) : (i64, i64) -> i64
    %506 = func.call @cc_nil_value() : () -> i64
    %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
    %508 = func.call @cc_values_pack(%507) : (i64) -> i64
    func.call @stack_push_pointer(%505) : (i64) -> ()
    %509 = func.call @stack_pop_pointer() : () -> i64
    %510 = func.call @cc_nil_value() : () -> i64
    %511 = func.call @cc_errorp(%500) : (i64) -> i64
    %512 = arith.cmpi ne, %511, %510 : i64
    %513 = arith.cmpi eq, %510, %510 : i64
    %514 = arith.andi %512, %513 : i1
    %515 = scf.if %514 -> (i64) {
      scf.yield %500 : i64
    } else {
      scf.yield %510 : i64
    }
    %516 = func.call @cc_errorp(%509) : (i64) -> i64
    %517 = arith.cmpi ne, %516, %510 : i64
    %518 = arith.cmpi eq, %515, %510 : i64
    %519 = arith.andi %517, %518 : i1
    %520 = scf.if %519 -> (i64) {
      scf.yield %509 : i64
    } else {
      scf.yield %515 : i64
    }
    %521 = arith.cmpi ne, %520, %510 : i64
    scf.if %521 {
      func.call @stack_push_pointer(%520) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%500) : (i64) -> ()
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %522 = llvm.mlir.addressof @str55 : !llvm.ptr
      %523 = func.call @cc_make_function_ref_const(%522) : (!llvm.ptr) -> i64
      %524 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%523, %524) : (i64, i64) -> ()
    }
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%index"() {
    %537 = func.call @stack_pop_pointer() : () -> i64
    %538 = llvm.mlir.addressof @str57 : !llvm.ptr
    %539 = arith.constant 5 : i64
    %540 = func.call @cc_make_string(%538, %539) : (!llvm.ptr, i64) -> i64
    %541 = func.call @cc_nil_value() : () -> i64
    %542 = func.call @cc_intern(%540, %541) : (i64, i64) -> i64
    %543 = func.call @cc_nil_value() : () -> i64
    %544 = func.call @cc_cons(%542, %543) : (i64, i64) -> i64
    %545 = func.call @cc_values_pack(%544) : (i64) -> i64
    %546 = llvm.mlir.addressof @str58 : !llvm.ptr
    %547 = arith.constant 6 : i64
    %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
    %549 = func.call @cc_register_function_lambda_list_metadata_raw(%542, %548) : (i64, i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%542) : (i64) -> ()
    func.call @stack_push_pointer(%537) : (i64) -> ()
    %550 = func.call @stack_pop_pointer() : () -> i64
    %551 = llvm.mlir.addressof @str59 : !llvm.ptr
    %552 = arith.constant 5 : i64
    %553 = func.call @cc_make_string(%551, %552) : (!llvm.ptr, i64) -> i64
    %554 = func.call @cc_nil_value() : () -> i64
    %555 = func.call @cc_intern(%553, %554) : (i64, i64) -> i64
    %556 = func.call @cc_nil_value() : () -> i64
    %557 = func.call @cc_cons(%555, %556) : (i64, i64) -> i64
    %558 = func.call @cc_values_pack(%557) : (i64) -> i64
    func.call @stack_push_pointer(%555) : (i64) -> ()
    %559 = func.call @stack_pop_pointer() : () -> i64
    %560 = func.call @cc_nil_value() : () -> i64
    %561 = func.call @cc_errorp(%550) : (i64) -> i64
    %562 = arith.cmpi ne, %561, %560 : i64
    %563 = arith.cmpi eq, %560, %560 : i64
    %564 = arith.andi %562, %563 : i1
    %565 = scf.if %564 -> (i64) {
      scf.yield %550 : i64
    } else {
      scf.yield %560 : i64
    }
    %566 = func.call @cc_errorp(%559) : (i64) -> i64
    %567 = arith.cmpi ne, %566, %560 : i64
    %568 = arith.cmpi eq, %565, %560 : i64
    %569 = arith.andi %567, %568 : i1
    %570 = scf.if %569 -> (i64) {
      scf.yield %559 : i64
    } else {
      scf.yield %565 : i64
    }
    %571 = arith.cmpi ne, %570, %560 : i64
    scf.if %571 {
      func.call @stack_push_pointer(%570) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%550) : (i64) -> ()
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %572 = llvm.mlir.addressof @str60 : !llvm.ptr
      %573 = func.call @cc_make_function_ref_const(%572) : (!llvm.ptr) -> i64
      %574 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%573, %574) : (i64, i64) -> ()
    }
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"gray:stream-read-char_217142993616897_primary"() {
    %592 = func.call @stack_pop_pointer() : () -> i64
    %593 = llvm.mlir.addressof @str62 : !llvm.ptr
    %594 = arith.constant 5 : i64
    %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
    %596 = func.call @cc_nil_value() : () -> i64
    %597 = func.call @cc_intern(%595, %596) : (i64, i64) -> i64
    %598 = func.call @cc_nil_value() : () -> i64
    %599 = func.call @cc_cons(%597, %598) : (i64, i64) -> i64
    %600 = func.call @cc_values_pack(%599) : (i64) -> i64
    %601 = func.call @cc_symbol_value(%597) : (i64) -> i64
    func.call @stack_push_pointer(%601) : (i64) -> ()
    %602 = func.call @stack_pop_pointer() : () -> i64
    %603 = func.call @cc_nil_value() : () -> i64
    %604 = func.call @cc_errorp(%602) : (i64) -> i64
    %605 = arith.cmpi ne, %604, %603 : i64
    %606 = arith.cmpi eq, %603, %603 : i64
    %607 = arith.andi %605, %606 : i1
    %608 = scf.if %607 -> (i64) {
      scf.yield %602 : i64
    } else {
      scf.yield %603 : i64
    }
    %609 = arith.cmpi ne, %608, %603 : i64
    scf.if %609 {
      func.call @stack_push_pointer(%608) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%602) : (i64) -> ()
      %610 = llvm.mlir.addressof @str63 : !llvm.ptr
      %611 = func.call @cc_make_function_ref_const(%610) : (!llvm.ptr) -> i64
      %612 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%611, %612) : (i64, i64) -> ()
    }
    %613 = func.call @stack_pop_pointer() : () -> i64
    %614 = llvm.mlir.addressof @str64 : !llvm.ptr
    %615 = arith.constant 5 : i64
    %616 = func.call @cc_make_string(%614, %615) : (!llvm.ptr, i64) -> i64
    %617 = func.call @cc_nil_value() : () -> i64
    %618 = func.call @cc_intern(%616, %617) : (i64, i64) -> i64
    %619 = func.call @cc_nil_value() : () -> i64
    %620 = func.call @cc_cons(%618, %619) : (i64, i64) -> i64
    %621 = func.call @cc_values_pack(%620) : (i64) -> i64
    %622 = func.call @cc_symbol_value(%618) : (i64) -> i64
    func.call @stack_push_pointer(%622) : (i64) -> ()
    %623 = func.call @stack_pop_pointer() : () -> i64
    %624 = func.call @cc_nil_value() : () -> i64
    %625 = func.call @cc_errorp(%623) : (i64) -> i64
    %626 = arith.cmpi ne, %625, %624 : i64
    %627 = arith.cmpi eq, %624, %624 : i64
    %628 = arith.andi %626, %627 : i1
    %629 = scf.if %628 -> (i64) {
      scf.yield %623 : i64
    } else {
      scf.yield %624 : i64
    }
    %630 = arith.cmpi ne, %629, %624 : i64
    scf.if %630 {
      func.call @stack_push_pointer(%629) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%623) : (i64) -> ()
      %631 = llvm.mlir.addressof @str65 : !llvm.ptr
      %632 = func.call @cc_make_function_ref_const(%631) : (!llvm.ptr) -> i64
      %633 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%632, %633) : (i64, i64) -> ()
    }
    %634 = arith.constant 4 : i64
    %635 = func.call @cc_collect_args(%634) : (i64) -> i64
    %636 = func.call @cc_funcall(%613, %635) : (i64, i64) -> i64
    func.call @stack_push_pointer(%636) : (i64) -> ()
    %637 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%592) : (i64) -> ()
    %638 = func.call @stack_pop_pointer() : () -> i64
    %639 = llvm.mlir.addressof @str66 : !llvm.ptr
    %640 = arith.constant 5 : i64
    %641 = func.call @cc_make_string(%639, %640) : (!llvm.ptr, i64) -> i64
    %642 = func.call @cc_nil_value() : () -> i64
    %643 = func.call @cc_intern(%641, %642) : (i64, i64) -> i64
    %644 = func.call @cc_nil_value() : () -> i64
    %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
    %646 = func.call @cc_values_pack(%645) : (i64) -> i64
    %647 = func.call @cc_symbol_value(%643) : (i64) -> i64
    func.call @stack_push_pointer(%647) : (i64) -> ()
    %648 = func.call @stack_pop_pointer() : () -> i64
    %649 = llvm.mlir.addressof @str67 : !llvm.ptr
    %650 = arith.constant 5 : i64
    %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
    %652 = func.call @cc_nil_value() : () -> i64
    %653 = func.call @cc_intern(%651, %652) : (i64, i64) -> i64
    %654 = func.call @cc_nil_value() : () -> i64
    %655 = func.call @cc_cons(%653, %654) : (i64, i64) -> i64
    %656 = func.call @cc_values_pack(%655) : (i64) -> i64
    %657 = func.call @cc_symbol_value(%653) : (i64) -> i64
    func.call @stack_push_pointer(%657) : (i64) -> ()
    %658 = func.call @stack_pop_pointer() : () -> i64
    %659 = func.call @cc_length(%658) : (i64) -> i64
    func.call @stack_push_pointer(%659) : (i64) -> ()
    %660 = func.call @stack_pop_pointer() : () -> i64
    %661 = arith.constant 1 : i1
    %663 = arith.constant 3 : i64
    %662 = arith.andi %648, %663 : i64
    %664 = arith.constant 0 : i64
    %665 = arith.cmpi eq, %662, %664 : i64
    %667 = arith.constant 3 : i64
    %666 = arith.andi %660, %667 : i64
    %668 = arith.constant 0 : i64
    %669 = arith.cmpi eq, %666, %668 : i64
    %670 = arith.andi %665, %669 : i1
    %671 = scf.if %670 -> (i1) {
      %672 = arith.constant 2 : i64
      %673 = arith.shrsi %648, %672 : i64
      %674 = arith.constant 2 : i64
      %675 = arith.shrsi %660, %674 : i64
      %676 = arith.cmpi slt, %673, %675 : i64
      scf.yield %676 : i1
    } else {
      %677 = func.call @cc_lt(%648, %660) : (i64, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = arith.cmpi ne, %677, %678 : i64
      scf.yield %679 : i1
    }
    %680 = arith.andi %661, %671 : i1
    %681 = func.call @cc_nil_value() : () -> i64
    %682 = func.call @cc_t_value() : () -> i64
    %683 = scf.if %680 -> (i64) {
      scf.yield %682 : i64
    } else {
      scf.yield %681 : i64
    }
    func.call @stack_push_pointer(%683) : (i64) -> ()
    %684 = func.call @stack_pop_pointer() : () -> i64
    %685 = func.call @cc_nil_value() : () -> i64
    %686 = arith.cmpi ne, %684, %685 : i64
    scf.if %686 {
      %687 = llvm.mlir.addressof @str68 : !llvm.ptr
      %688 = arith.constant 5 : i64
      %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
      %690 = func.call @cc_nil_value() : () -> i64
      %691 = func.call @cc_intern(%689, %690) : (i64, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_cons(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_values_pack(%693) : (i64) -> i64
      %695 = func.call @cc_symbol_value(%691) : (i64) -> i64
      func.call @stack_push_pointer(%695) : (i64) -> ()
      %696 = llvm.mlir.addressof @str69 : !llvm.ptr
      %697 = arith.constant 5 : i64
      %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_intern(%698, %699) : (i64, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_cons(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_values_pack(%702) : (i64) -> i64
      %704 = func.call @cc_symbol_value(%700) : (i64) -> i64
      func.call @stack_push_pointer(%704) : (i64) -> ()
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @cc_aref(%706, %705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_multiple_value_list(%708) : (i64) -> i64
      %710 = llvm.mlir.addressof @str70 : !llvm.ptr
      %711 = arith.constant 5 : i64
      %712 = func.call @cc_make_string(%710, %711) : (!llvm.ptr, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_intern(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_nil_value() : () -> i64
      %716 = func.call @cc_cons(%714, %715) : (i64, i64) -> i64
      %717 = func.call @cc_values_pack(%716) : (i64) -> i64
      %718 = func.call @cc_symbol_value(%714) : (i64) -> i64
      func.call @stack_push_pointer(%718) : (i64) -> ()
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = arith.constant 1 : i64
      %721 = func.call @cc_box_fixnum(%720) : (i64) -> i64
      func.call @stack_push_pointer(%721) : (i64) -> ()
      %722 = func.call @stack_pop_pointer() : () -> i64
      %724 = arith.constant 3 : i64
      %723 = arith.andi %719, %724 : i64
      %725 = arith.constant 0 : i64
      %726 = arith.cmpi eq, %723, %725 : i64
      %728 = arith.constant 3 : i64
      %727 = arith.andi %722, %728 : i64
      %729 = arith.constant 0 : i64
      %730 = arith.cmpi eq, %727, %729 : i64
      %731 = arith.andi %726, %730 : i1
      %732 = scf.if %731 -> (i64) {
        %733 = arith.constant 2 : i64
        %734 = arith.shrsi %719, %733 : i64
        %735 = arith.constant 2 : i64
        %736 = arith.shrsi %722, %735 : i64
        %737 = arith.addi %734, %736 : i64
        %738 = arith.constant -2305843009213693952 : i64
        %739 = arith.constant 2305843009213693951 : i64
        %740 = arith.cmpi sge, %737, %738 : i64
        %741 = arith.cmpi sle, %737, %739 : i64
        %742 = arith.andi %740, %741 : i1
        %743 = scf.if %742 -> (i64) {
          %744 = arith.constant 2 : i64
          %745 = arith.shli %737, %744 : i64
          scf.yield %745 : i64
        } else {
          %746 = func.call @cc_add(%719, %722) : (i64, i64) -> i64
          scf.yield %746 : i64
        }
        scf.yield %743 : i64
      } else {
        %747 = func.call @cc_add(%719, %722) : (i64, i64) -> i64
        scf.yield %747 : i64
      }
      %748 = llvm.mlir.addressof @str71 : !llvm.ptr
      %749 = arith.constant 5 : i64
      %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
      %751 = func.call @cc_nil_value() : () -> i64
      %752 = func.call @cc_intern(%750, %751) : (i64, i64) -> i64
      %753 = func.call @cc_nil_value() : () -> i64
      %754 = func.call @cc_cons(%752, %753) : (i64, i64) -> i64
      %755 = func.call @cc_values_pack(%754) : (i64) -> i64
      %756 = func.call @cc_set_symbol_value(%752, %732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%732) : (i64) -> ()
      %757 = func.call @stack_depth() : () -> i64
      %758 = arith.constant 0 : i64
      %759 = arith.cmpi sgt, %757, %758 : i64
      scf.if %759 {
        %760 = func.call @stack_pop_pointer() : () -> i64
      }
      %761 = func.call @cc_values_pack(%709) : (i64) -> i64
      func.call @stack_push_pointer(%761) : (i64) -> ()
    } else {
      %762 = llvm.mlir.addressof @str72 : !llvm.ptr
      %763 = arith.constant 3 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = llvm.mlir.addressof @str73 : !llvm.ptr
      %766 = arith.constant 7 : i64
      %767 = func.call @cc_make_string(%765, %766) : (!llvm.ptr, i64) -> i64
      %768 = func.call @cc_intern(%764, %767) : (i64, i64) -> i64
      %769 = func.call @cc_nil_value() : () -> i64
      %770 = func.call @cc_cons(%768, %769) : (i64, i64) -> i64
      %771 = func.call @cc_values_pack(%770) : (i64) -> i64
      func.call @stack_push_pointer(%768) : (i64) -> ()
    }
    %772 = func.call @stack_pop_pointer() : () -> i64
    %773 = func.call @cc_nil_value() : () -> i64
    %774 = func.call @cc_errorp(%637) : (i64) -> i64
    %775 = arith.cmpi ne, %774, %773 : i64
    %776 = arith.cmpi eq, %773, %773 : i64
    %777 = arith.andi %775, %776 : i1
    %778 = scf.if %777 -> (i64) {
      scf.yield %637 : i64
    } else {
      scf.yield %773 : i64
    }
    %779 = func.call @cc_errorp(%638) : (i64) -> i64
    %780 = arith.cmpi ne, %779, %773 : i64
    %781 = arith.cmpi eq, %778, %773 : i64
    %782 = arith.andi %780, %781 : i1
    %783 = scf.if %782 -> (i64) {
      scf.yield %638 : i64
    } else {
      scf.yield %778 : i64
    }
    %784 = func.call @cc_errorp(%772) : (i64) -> i64
    %785 = arith.cmpi ne, %784, %773 : i64
    %786 = arith.cmpi eq, %783, %773 : i64
    %787 = arith.andi %785, %786 : i1
    %788 = scf.if %787 -> (i64) {
      scf.yield %772 : i64
    } else {
      scf.yield %783 : i64
    }
    %789 = arith.cmpi ne, %788, %773 : i64
    scf.if %789 {
      func.call @stack_push_pointer(%788) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%637) : (i64) -> ()
      func.call @stack_push_pointer(%638) : (i64) -> ()
      func.call @stack_push_pointer(%772) : (i64) -> ()
      %790 = llvm.mlir.addressof @str74 : !llvm.ptr
      %791 = func.call @cc_make_function_ref_const(%790) : (!llvm.ptr) -> i64
      %792 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%791, %792) : (i64, i64) -> ()
    }
    func.return
  }
  llvm.mlir.global private constant @str0("SHOW-READ-LINE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str1("value\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_217142993616896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_217142993616896*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_217142993616896*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("CHARACTER-INPUT-STREAM\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str6("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str7("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("slot-value=~S slot-index=~S class=~S~%\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str10("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str11("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str12("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str13("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("WIBBLE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str17("value=~S line=~S missing=~S index=~S~%\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str18("CLASP-TESTS::index\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str19("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_217142993616896*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETVALUE_217142993616896*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_217142993616896*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str23("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str27("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str30("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str31("FUNDAMENTAL-CHARACTER-INPUT-STREAM\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str32("GRAY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("CHARACTER-INPUT-STREAM\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str34("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str35("ACCESSOR\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str36("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str37("INITFORM\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str40("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("READER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("INITARG\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("FUNDAMENTAL-CHARACTER-INPUT-STREAM\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str49("GRAY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("CHARACTER-INPUT-STREAM\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str51("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str52("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("object\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str54("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("slot-value\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str56("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str58("object\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str60("slot-value\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str61("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str62("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str63("%FN%value\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str64("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str65("%FN%index\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str66("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str67("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str70("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str71("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str73("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("WITH-ACCESSORS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @method_name_217142993616897("gray:stream-read-char_217142993616897_primary\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str76("STREAM-READ-CHAR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str77("GRAY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str78("CHARACTER-INPUT-STREAM\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str79("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str82("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str85("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str86("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("PROG1\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str94("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str97("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str100("INDEX\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str101("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str102("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str103("WITH-ACCESSORS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str104("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str105("CHARACTER-INPUT-STREAM\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str106("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("STREAM-READ-CHAR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str109("GRAY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str110("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str111("%FN%show-read-line\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str112("SHOW-READ-LINE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str113("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str114("%FN%show-read-line\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str115("SHOW-READ-LINE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str116("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str117("%FN%show-read-line\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str118("SHOW-READ-LINE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str119("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str120("%FN%show-read-line\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str121("SHOW-READ-LINE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str122("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str123("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str124("%FN%show-read-line\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str125("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str126("%FN%show-read-line\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str127("a\0A\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str128("%FN%show-read-line\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str129("PROBE-READ-LINE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str130("CHARACTER-INPUT-STREAM\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str131("a\0A\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str132("VALUE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str135("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str136("test\00") : !llvm.array<5 x i8>
}
